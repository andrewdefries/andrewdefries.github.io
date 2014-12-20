---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.844284, 1.202139, -0.7739942, 1, 0, 0, 1,
-2.699185, -0.9541876, -1.940451, 1, 0.007843138, 0, 1,
-2.564451, 0.00284968, -0.6806361, 1, 0.01176471, 0, 1,
-2.547551, 0.5561768, -1.24524, 1, 0.01960784, 0, 1,
-2.534266, 0.2456591, -1.792163, 1, 0.02352941, 0, 1,
-2.523757, 0.01656082, -2.029203, 1, 0.03137255, 0, 1,
-2.483924, -0.4979473, -1.111762, 1, 0.03529412, 0, 1,
-2.444372, 0.4290477, -2.394284, 1, 0.04313726, 0, 1,
-2.433326, -0.2628681, -2.472387, 1, 0.04705882, 0, 1,
-2.361835, -0.1512335, -1.622085, 1, 0.05490196, 0, 1,
-2.329383, -0.5837588, -2.773269, 1, 0.05882353, 0, 1,
-2.327357, 0.6202131, -0.4163777, 1, 0.06666667, 0, 1,
-2.297621, 0.6521229, -2.381254, 1, 0.07058824, 0, 1,
-2.256854, 1.219959, -0.4836884, 1, 0.07843138, 0, 1,
-2.240514, -0.7920878, -2.520967, 1, 0.08235294, 0, 1,
-2.231421, -0.4318932, -0.018166, 1, 0.09019608, 0, 1,
-2.225162, 0.08526076, -1.028113, 1, 0.09411765, 0, 1,
-2.212597, 0.03931705, -1.498862, 1, 0.1019608, 0, 1,
-2.181425, -0.3048694, -2.152075, 1, 0.1098039, 0, 1,
-2.176964, -0.5131656, -2.140326, 1, 0.1137255, 0, 1,
-2.163995, -1.605062, -1.092048, 1, 0.1215686, 0, 1,
-2.155984, 1.009343, -1.79951, 1, 0.1254902, 0, 1,
-2.140355, -0.1831832, -1.388618, 1, 0.1333333, 0, 1,
-2.081976, -1.179747, 0.7933082, 1, 0.1372549, 0, 1,
-2.074042, 1.389281, -2.373889, 1, 0.145098, 0, 1,
-2.069968, 0.9593818, -0.2362258, 1, 0.1490196, 0, 1,
-2.067161, -0.6322591, -2.041012, 1, 0.1568628, 0, 1,
-2.033988, 0.5422208, -2.196598, 1, 0.1607843, 0, 1,
-2.028095, -1.621379, -0.3669652, 1, 0.1686275, 0, 1,
-2.026493, -0.9269661, -2.998189, 1, 0.172549, 0, 1,
-2.012314, 1.172159, 0.343463, 1, 0.1803922, 0, 1,
-2.004709, -0.9652037, -3.653907, 1, 0.1843137, 0, 1,
-1.979338, -1.160728, -3.274811, 1, 0.1921569, 0, 1,
-1.971618, -0.1576938, -1.832526, 1, 0.1960784, 0, 1,
-1.954421, 0.2913481, -2.482906, 1, 0.2039216, 0, 1,
-1.94747, -0.4428972, -3.621815, 1, 0.2117647, 0, 1,
-1.8992, 0.4620166, -2.567251, 1, 0.2156863, 0, 1,
-1.878262, 0.9316573, -0.7528193, 1, 0.2235294, 0, 1,
-1.861971, -0.4571667, -1.303742, 1, 0.227451, 0, 1,
-1.855597, 0.8868794, -1.116105, 1, 0.2352941, 0, 1,
-1.836185, -0.0633683, -1.359259, 1, 0.2392157, 0, 1,
-1.82172, 0.6951763, -2.189895, 1, 0.2470588, 0, 1,
-1.820904, 1.025078, -0.2893701, 1, 0.2509804, 0, 1,
-1.806985, -1.755189, -0.5000659, 1, 0.2588235, 0, 1,
-1.788645, 0.2415925, -2.446612, 1, 0.2627451, 0, 1,
-1.779542, 0.7341464, -1.916945, 1, 0.2705882, 0, 1,
-1.761803, -0.790763, -1.842561, 1, 0.2745098, 0, 1,
-1.755063, -1.042099, -2.290505, 1, 0.282353, 0, 1,
-1.751594, -1.334318, -2.695215, 1, 0.2862745, 0, 1,
-1.745905, 1.479294, -0.705907, 1, 0.2941177, 0, 1,
-1.734524, 1.070892, -0.1217549, 1, 0.3019608, 0, 1,
-1.687551, 1.128839, -1.840266, 1, 0.3058824, 0, 1,
-1.663434, 0.3443076, 0.9971251, 1, 0.3137255, 0, 1,
-1.657898, -1.343068, -3.309113, 1, 0.3176471, 0, 1,
-1.650313, 0.180547, -0.07577963, 1, 0.3254902, 0, 1,
-1.633032, -0.09354885, -2.023159, 1, 0.3294118, 0, 1,
-1.632478, -1.718467, -2.889401, 1, 0.3372549, 0, 1,
-1.625402, -0.4719962, -1.154376, 1, 0.3411765, 0, 1,
-1.624446, -0.6024755, -1.459814, 1, 0.3490196, 0, 1,
-1.613474, -1.075698, -1.536905, 1, 0.3529412, 0, 1,
-1.583028, 1.146855, -1.062953, 1, 0.3607843, 0, 1,
-1.580669, -0.891046, -1.218297, 1, 0.3647059, 0, 1,
-1.579715, 1.752528, 0.4212632, 1, 0.372549, 0, 1,
-1.566033, -0.5423478, -2.628833, 1, 0.3764706, 0, 1,
-1.565845, 0.3254621, -1.792663, 1, 0.3843137, 0, 1,
-1.559423, -0.4484438, -2.104064, 1, 0.3882353, 0, 1,
-1.555259, -1.268002, -2.816765, 1, 0.3960784, 0, 1,
-1.552277, -1.110018, -1.053328, 1, 0.4039216, 0, 1,
-1.550915, 0.6831251, -0.8801486, 1, 0.4078431, 0, 1,
-1.549715, 0.13537, -0.6636676, 1, 0.4156863, 0, 1,
-1.549545, -1.647836, -2.104188, 1, 0.4196078, 0, 1,
-1.538677, -1.595184, -1.852283, 1, 0.427451, 0, 1,
-1.537924, -0.770934, -0.727585, 1, 0.4313726, 0, 1,
-1.534322, -1.449671, -3.095489, 1, 0.4392157, 0, 1,
-1.530513, 0.03113016, -1.630161, 1, 0.4431373, 0, 1,
-1.525562, -0.02837539, -2.38383, 1, 0.4509804, 0, 1,
-1.508919, -1.12859, -1.489176, 1, 0.454902, 0, 1,
-1.50248, -0.08774266, -1.310669, 1, 0.4627451, 0, 1,
-1.498191, -1.093523, 0.4970028, 1, 0.4666667, 0, 1,
-1.4898, 0.2697358, -2.323112, 1, 0.4745098, 0, 1,
-1.476683, 0.163008, -1.957346, 1, 0.4784314, 0, 1,
-1.476197, -0.09384067, -2.49494, 1, 0.4862745, 0, 1,
-1.470448, 1.706809, -0.6138654, 1, 0.4901961, 0, 1,
-1.467823, -1.882379, -1.832522, 1, 0.4980392, 0, 1,
-1.464556, 1.570249, -0.04107597, 1, 0.5058824, 0, 1,
-1.46407, 0.2363179, -2.652889, 1, 0.509804, 0, 1,
-1.445971, 0.3655944, -3.11169, 1, 0.5176471, 0, 1,
-1.423835, -0.02330294, -1.855693, 1, 0.5215687, 0, 1,
-1.417831, 0.4691496, -1.466786, 1, 0.5294118, 0, 1,
-1.416303, 0.3113856, -1.788363, 1, 0.5333334, 0, 1,
-1.403502, 0.2740111, -1.844665, 1, 0.5411765, 0, 1,
-1.397862, -0.06896356, -2.920632, 1, 0.5450981, 0, 1,
-1.392061, -0.1176271, -2.153143, 1, 0.5529412, 0, 1,
-1.390306, -1.591089, -1.336353, 1, 0.5568628, 0, 1,
-1.38713, -0.9948994, -3.127873, 1, 0.5647059, 0, 1,
-1.375961, 0.139769, -1.65349, 1, 0.5686275, 0, 1,
-1.374767, 0.4613069, -2.078552, 1, 0.5764706, 0, 1,
-1.373347, 0.1700773, -3.339936, 1, 0.5803922, 0, 1,
-1.367807, -0.07910519, -3.437246, 1, 0.5882353, 0, 1,
-1.36694, 0.9693428, -1.647423, 1, 0.5921569, 0, 1,
-1.362161, -0.9535785, -3.454414, 1, 0.6, 0, 1,
-1.344501, 0.638711, -0.9453457, 1, 0.6078432, 0, 1,
-1.340486, 0.5595137, -1.041703, 1, 0.6117647, 0, 1,
-1.336372, 0.4669465, -1.286771, 1, 0.6196079, 0, 1,
-1.331402, -0.3651821, -3.295388, 1, 0.6235294, 0, 1,
-1.317349, -0.06225683, -1.287377, 1, 0.6313726, 0, 1,
-1.312844, 0.3672439, -0.5425407, 1, 0.6352941, 0, 1,
-1.30478, -0.8211289, -3.176284, 1, 0.6431373, 0, 1,
-1.283769, -0.9430755, -0.1794574, 1, 0.6470588, 0, 1,
-1.282551, -0.3429551, -1.663156, 1, 0.654902, 0, 1,
-1.268871, -0.05054097, -2.474428, 1, 0.6588235, 0, 1,
-1.256387, 1.292152, -1.447762, 1, 0.6666667, 0, 1,
-1.252218, 0.4730098, -0.2314342, 1, 0.6705883, 0, 1,
-1.248307, 0.04552512, -2.075382, 1, 0.6784314, 0, 1,
-1.242469, 0.9766266, -0.5475037, 1, 0.682353, 0, 1,
-1.238676, 0.3151586, -2.799597, 1, 0.6901961, 0, 1,
-1.238119, 0.2748548, 0.5893028, 1, 0.6941177, 0, 1,
-1.230281, 0.195067, -1.40361, 1, 0.7019608, 0, 1,
-1.227599, -0.4168303, -1.299345, 1, 0.7098039, 0, 1,
-1.219362, -0.8446319, -1.91828, 1, 0.7137255, 0, 1,
-1.215223, -0.8543572, -0.2465845, 1, 0.7215686, 0, 1,
-1.194505, 0.3862522, -4.851122, 1, 0.7254902, 0, 1,
-1.189708, -0.299913, -0.9275377, 1, 0.7333333, 0, 1,
-1.188959, 1.275456, -0.9356484, 1, 0.7372549, 0, 1,
-1.188678, -0.7898777, -1.602603, 1, 0.7450981, 0, 1,
-1.184029, 0.5972275, -2.053616, 1, 0.7490196, 0, 1,
-1.18294, -1.176403, -1.989604, 1, 0.7568628, 0, 1,
-1.181487, 1.162905, -0.9575185, 1, 0.7607843, 0, 1,
-1.178948, -0.2770304, -0.04623688, 1, 0.7686275, 0, 1,
-1.177623, -0.158558, 0.5728883, 1, 0.772549, 0, 1,
-1.175565, -0.4412071, -2.401846, 1, 0.7803922, 0, 1,
-1.170475, -0.05405663, -3.182104, 1, 0.7843137, 0, 1,
-1.170407, 0.6244037, 0.7654524, 1, 0.7921569, 0, 1,
-1.166009, 0.1158655, -0.4200181, 1, 0.7960784, 0, 1,
-1.156781, -1.046472, -1.72367, 1, 0.8039216, 0, 1,
-1.153081, 1.160419, 0.3473462, 1, 0.8117647, 0, 1,
-1.146491, -0.48386, -3.340024, 1, 0.8156863, 0, 1,
-1.126898, -0.9090549, -2.40635, 1, 0.8235294, 0, 1,
-1.115713, -1.416635, -2.783576, 1, 0.827451, 0, 1,
-1.106738, 1.153255, 1.455911, 1, 0.8352941, 0, 1,
-1.105816, -0.234277, -3.503077, 1, 0.8392157, 0, 1,
-1.098687, 0.2783946, -1.734223, 1, 0.8470588, 0, 1,
-1.088613, 0.5945695, -1.587411, 1, 0.8509804, 0, 1,
-1.087008, 0.1067262, -2.037521, 1, 0.8588235, 0, 1,
-1.082252, -0.4270486, -2.327549, 1, 0.8627451, 0, 1,
-1.07709, 1.994714, -0.2748318, 1, 0.8705882, 0, 1,
-1.064377, 0.1834393, -0.636111, 1, 0.8745098, 0, 1,
-1.059855, 0.6815127, -0.7958333, 1, 0.8823529, 0, 1,
-1.055664, -0.005686824, -2.11723, 1, 0.8862745, 0, 1,
-1.043313, 0.6208042, -0.8001292, 1, 0.8941177, 0, 1,
-1.043224, 1.36793, -0.5767382, 1, 0.8980392, 0, 1,
-1.038645, -0.9848409, -1.567397, 1, 0.9058824, 0, 1,
-1.03761, 1.026841, -0.3033371, 1, 0.9137255, 0, 1,
-1.034428, 1.589927, 1.942665, 1, 0.9176471, 0, 1,
-1.026763, 0.1634442, -1.846135, 1, 0.9254902, 0, 1,
-1.024652, 1.197051, 0.1444833, 1, 0.9294118, 0, 1,
-1.022851, 1.749999, -0.5321653, 1, 0.9372549, 0, 1,
-1.010177, -1.642696, -1.647804, 1, 0.9411765, 0, 1,
-0.9926622, 1.276837, -0.1324686, 1, 0.9490196, 0, 1,
-0.9920483, -0.6540396, -1.033809, 1, 0.9529412, 0, 1,
-0.9916937, 1.589039, 1.2149, 1, 0.9607843, 0, 1,
-0.9891205, 0.3563761, 0.9668734, 1, 0.9647059, 0, 1,
-0.9867723, 0.9695932, -0.573747, 1, 0.972549, 0, 1,
-0.9837658, -1.126724, -3.49029, 1, 0.9764706, 0, 1,
-0.9805591, 0.1402142, -0.8503063, 1, 0.9843137, 0, 1,
-0.9794433, 0.8859934, -1.633325, 1, 0.9882353, 0, 1,
-0.9778949, -1.706228, -2.634016, 1, 0.9960784, 0, 1,
-0.9778524, 1.428728, 0.2612781, 0.9960784, 1, 0, 1,
-0.9761719, 1.173579, -1.974034, 0.9921569, 1, 0, 1,
-0.9603627, 0.4181263, -0.8673561, 0.9843137, 1, 0, 1,
-0.9578895, 0.2833647, -2.989632, 0.9803922, 1, 0, 1,
-0.953307, 0.705467, -0.1664564, 0.972549, 1, 0, 1,
-0.9516956, 2.301831, -1.008555, 0.9686275, 1, 0, 1,
-0.9512074, -0.1824722, -1.609954, 0.9607843, 1, 0, 1,
-0.9501261, 0.05472975, -2.025703, 0.9568627, 1, 0, 1,
-0.9457039, -1.440932, -1.088275, 0.9490196, 1, 0, 1,
-0.9446669, 0.341453, -2.851158, 0.945098, 1, 0, 1,
-0.9434935, 0.348803, -1.474115, 0.9372549, 1, 0, 1,
-0.9373093, -0.9775621, -2.342065, 0.9333333, 1, 0, 1,
-0.9321216, -0.4152388, -1.917715, 0.9254902, 1, 0, 1,
-0.9318009, -0.4758644, -2.969349, 0.9215686, 1, 0, 1,
-0.92897, 0.36305, -0.3556069, 0.9137255, 1, 0, 1,
-0.9289626, -1.133685, -2.693581, 0.9098039, 1, 0, 1,
-0.9284316, -0.6036925, -2.181061, 0.9019608, 1, 0, 1,
-0.9283997, -0.8662125, -2.309372, 0.8941177, 1, 0, 1,
-0.9276545, 1.064304, 1.45525, 0.8901961, 1, 0, 1,
-0.9274713, 0.2490923, -1.994606, 0.8823529, 1, 0, 1,
-0.925536, 0.5067973, -3.013264, 0.8784314, 1, 0, 1,
-0.9193859, 0.692216, -0.9220208, 0.8705882, 1, 0, 1,
-0.9192286, 0.9755241, -2.478055, 0.8666667, 1, 0, 1,
-0.9141626, 0.8547541, -1.125016, 0.8588235, 1, 0, 1,
-0.9138635, 0.6221242, -1.212117, 0.854902, 1, 0, 1,
-0.9074045, -0.6385649, -3.586188, 0.8470588, 1, 0, 1,
-0.9062068, -0.2428553, -1.51993, 0.8431373, 1, 0, 1,
-0.9009791, 0.2668705, -0.871541, 0.8352941, 1, 0, 1,
-0.8957468, 0.3241413, -1.068481, 0.8313726, 1, 0, 1,
-0.8953571, 0.1108093, -1.408918, 0.8235294, 1, 0, 1,
-0.8925514, 0.6890339, -2.272347, 0.8196079, 1, 0, 1,
-0.8895267, -0.5128863, -0.512762, 0.8117647, 1, 0, 1,
-0.8889605, 0.8874849, -2.684586, 0.8078431, 1, 0, 1,
-0.8869411, 0.008096305, -1.564155, 0.8, 1, 0, 1,
-0.8866405, 1.982464, -1.66282, 0.7921569, 1, 0, 1,
-0.8863416, -2.156839, -2.335687, 0.7882353, 1, 0, 1,
-0.8836136, -0.3262169, -1.251752, 0.7803922, 1, 0, 1,
-0.8792288, -0.1405622, -0.3572826, 0.7764706, 1, 0, 1,
-0.8790182, -2.336963, -3.772249, 0.7686275, 1, 0, 1,
-0.8705209, -0.06105029, -0.7411209, 0.7647059, 1, 0, 1,
-0.8629538, 1.593213, -1.458404, 0.7568628, 1, 0, 1,
-0.8605236, 0.8326075, -1.230534, 0.7529412, 1, 0, 1,
-0.8579658, -0.9161178, -2.530838, 0.7450981, 1, 0, 1,
-0.8566741, 0.4356956, 0.1795377, 0.7411765, 1, 0, 1,
-0.8546193, -0.3458994, -1.745165, 0.7333333, 1, 0, 1,
-0.8489821, -0.3252294, -2.52701, 0.7294118, 1, 0, 1,
-0.8486266, -1.077718, -4.562342, 0.7215686, 1, 0, 1,
-0.8482045, 1.444683, -0.05836701, 0.7176471, 1, 0, 1,
-0.8450488, -0.2770497, -2.715623, 0.7098039, 1, 0, 1,
-0.8432854, -1.433947, -3.654356, 0.7058824, 1, 0, 1,
-0.8430874, -0.07699639, -2.480733, 0.6980392, 1, 0, 1,
-0.83778, 1.470072, -1.680591, 0.6901961, 1, 0, 1,
-0.8243096, -0.1218572, -3.067175, 0.6862745, 1, 0, 1,
-0.8214937, 0.7120808, -0.5285616, 0.6784314, 1, 0, 1,
-0.8150848, -1.490487, -1.433763, 0.6745098, 1, 0, 1,
-0.8140495, -1.364771, -3.576996, 0.6666667, 1, 0, 1,
-0.8131191, 0.2379374, -2.580785, 0.6627451, 1, 0, 1,
-0.8081888, -0.6006735, -0.1052198, 0.654902, 1, 0, 1,
-0.8014244, -1.792898, -2.454856, 0.6509804, 1, 0, 1,
-0.7927784, 0.5658289, -0.2385993, 0.6431373, 1, 0, 1,
-0.7907522, 0.1268248, -0.3342592, 0.6392157, 1, 0, 1,
-0.7817743, 0.9045053, 1.578175, 0.6313726, 1, 0, 1,
-0.7780852, -0.3267968, -1.437123, 0.627451, 1, 0, 1,
-0.7745484, -1.97639, -3.376923, 0.6196079, 1, 0, 1,
-0.7733257, -1.918609, -3.157459, 0.6156863, 1, 0, 1,
-0.7726969, 1.800647, 0.5024565, 0.6078432, 1, 0, 1,
-0.7717187, -0.6062543, -2.873691, 0.6039216, 1, 0, 1,
-0.7661769, -0.4165508, -2.61078, 0.5960785, 1, 0, 1,
-0.7644882, -0.6708454, -1.156923, 0.5882353, 1, 0, 1,
-0.7599955, 0.1141954, -1.517322, 0.5843138, 1, 0, 1,
-0.7578792, 0.4587236, -1.745109, 0.5764706, 1, 0, 1,
-0.75773, -1.767273, -2.410103, 0.572549, 1, 0, 1,
-0.7560073, 0.4618129, -1.066515, 0.5647059, 1, 0, 1,
-0.7530716, 0.01472972, -1.446028, 0.5607843, 1, 0, 1,
-0.7499777, -0.1951207, -1.232381, 0.5529412, 1, 0, 1,
-0.7492079, 1.490114, -1.036631, 0.5490196, 1, 0, 1,
-0.7483873, -1.004362, -2.858075, 0.5411765, 1, 0, 1,
-0.7428102, -1.202615, -3.497691, 0.5372549, 1, 0, 1,
-0.7406569, 1.645571, -0.7143719, 0.5294118, 1, 0, 1,
-0.7336095, 0.06116137, -2.606381, 0.5254902, 1, 0, 1,
-0.7251365, 0.5898389, 0.1465762, 0.5176471, 1, 0, 1,
-0.7227122, -0.1342398, -1.065349, 0.5137255, 1, 0, 1,
-0.7131863, 0.1408896, -0.9766765, 0.5058824, 1, 0, 1,
-0.7077518, 1.919689, -0.004520637, 0.5019608, 1, 0, 1,
-0.7047842, -0.1641086, -0.8247164, 0.4941176, 1, 0, 1,
-0.6937994, -2.722011, -2.326011, 0.4862745, 1, 0, 1,
-0.6937016, 0.1754588, -1.718368, 0.4823529, 1, 0, 1,
-0.6901397, 0.7254723, -0.3059499, 0.4745098, 1, 0, 1,
-0.6868703, -2.258995, -2.904876, 0.4705882, 1, 0, 1,
-0.6864496, 0.5338021, -1.302987, 0.4627451, 1, 0, 1,
-0.6861417, -2.200404, -3.279197, 0.4588235, 1, 0, 1,
-0.6855799, 0.6986271, 0.2352139, 0.4509804, 1, 0, 1,
-0.6837625, -0.1881415, -1.659116, 0.4470588, 1, 0, 1,
-0.6832603, -1.040027, -3.262512, 0.4392157, 1, 0, 1,
-0.6830111, -0.7244705, -2.930984, 0.4352941, 1, 0, 1,
-0.6808892, -0.8963662, -2.695709, 0.427451, 1, 0, 1,
-0.6802762, -0.8829956, -1.640033, 0.4235294, 1, 0, 1,
-0.680057, 0.1335724, -1.501498, 0.4156863, 1, 0, 1,
-0.6753487, -1.373569, -2.632813, 0.4117647, 1, 0, 1,
-0.6749652, 1.876306, 0.7255122, 0.4039216, 1, 0, 1,
-0.6734971, 0.2724891, -0.5593517, 0.3960784, 1, 0, 1,
-0.6689748, 0.9825042, -2.504653, 0.3921569, 1, 0, 1,
-0.6689293, 0.09894185, 0.1879044, 0.3843137, 1, 0, 1,
-0.6676011, -0.4954385, -1.151759, 0.3803922, 1, 0, 1,
-0.6651071, 1.289957, 0.5096253, 0.372549, 1, 0, 1,
-0.6640375, 0.668519, -1.304253, 0.3686275, 1, 0, 1,
-0.6601274, -0.4329297, -1.849989, 0.3607843, 1, 0, 1,
-0.6526316, -0.4493005, -3.156815, 0.3568628, 1, 0, 1,
-0.6512101, 0.3403122, -1.540599, 0.3490196, 1, 0, 1,
-0.6486639, -1.617017, -2.075301, 0.345098, 1, 0, 1,
-0.6476814, -0.2268448, -2.499262, 0.3372549, 1, 0, 1,
-0.6434479, 1.347725, -2.374368, 0.3333333, 1, 0, 1,
-0.6433818, -0.5882239, -0.7848242, 0.3254902, 1, 0, 1,
-0.6418776, 0.5329054, -1.625723, 0.3215686, 1, 0, 1,
-0.6344149, 0.796605, 0.2931315, 0.3137255, 1, 0, 1,
-0.6334772, 1.405295, -0.1765379, 0.3098039, 1, 0, 1,
-0.6323278, -0.7988958, -3.513554, 0.3019608, 1, 0, 1,
-0.6216105, 0.1405176, 0.4757465, 0.2941177, 1, 0, 1,
-0.6214094, -1.009735, -3.624532, 0.2901961, 1, 0, 1,
-0.6208189, 0.2257747, -2.468548, 0.282353, 1, 0, 1,
-0.6193588, 0.2941703, -1.093744, 0.2784314, 1, 0, 1,
-0.6121899, 0.468739, -2.131495, 0.2705882, 1, 0, 1,
-0.6065369, 0.1468301, -1.115076, 0.2666667, 1, 0, 1,
-0.6004601, -0.5514992, -2.473997, 0.2588235, 1, 0, 1,
-0.5957791, -1.331205, -5.032844, 0.254902, 1, 0, 1,
-0.5952784, 1.188611, 0.4913309, 0.2470588, 1, 0, 1,
-0.5948799, 1.147101, -1.459604, 0.2431373, 1, 0, 1,
-0.5922307, -0.926998, -3.16705, 0.2352941, 1, 0, 1,
-0.5918226, -1.938642, -3.596017, 0.2313726, 1, 0, 1,
-0.5897387, 2.103967, -2.02524, 0.2235294, 1, 0, 1,
-0.5886354, -0.2432195, -3.056448, 0.2196078, 1, 0, 1,
-0.5826484, 1.676793, 0.02620961, 0.2117647, 1, 0, 1,
-0.5821953, 1.099933, 0.2739601, 0.2078431, 1, 0, 1,
-0.5802401, 0.01708991, -2.000783, 0.2, 1, 0, 1,
-0.5759678, 0.1893021, 0.648169, 0.1921569, 1, 0, 1,
-0.5757796, -1.743932, -4.32229, 0.1882353, 1, 0, 1,
-0.5716777, 0.5514577, -0.6546692, 0.1803922, 1, 0, 1,
-0.5712073, 0.873669, 0.3313774, 0.1764706, 1, 0, 1,
-0.5679564, 0.1934019, -2.2014, 0.1686275, 1, 0, 1,
-0.5663436, 0.5473202, 0.434233, 0.1647059, 1, 0, 1,
-0.5648265, 0.7193996, -1.953858, 0.1568628, 1, 0, 1,
-0.5626708, 1.993247, -0.1186715, 0.1529412, 1, 0, 1,
-0.5612335, -0.4221335, -2.860559, 0.145098, 1, 0, 1,
-0.5594932, 0.3219971, -1.054196, 0.1411765, 1, 0, 1,
-0.5584796, 0.1886717, -2.216692, 0.1333333, 1, 0, 1,
-0.5562313, 1.118623, -0.2386328, 0.1294118, 1, 0, 1,
-0.5561083, 0.07005785, -0.2927958, 0.1215686, 1, 0, 1,
-0.5559077, -0.4178034, -1.98048, 0.1176471, 1, 0, 1,
-0.5557057, 0.1199969, -2.947158, 0.1098039, 1, 0, 1,
-0.5520438, 0.5208986, -2.307586, 0.1058824, 1, 0, 1,
-0.5519578, -0.4882191, -0.787783, 0.09803922, 1, 0, 1,
-0.5514923, -0.8924249, -3.58704, 0.09019608, 1, 0, 1,
-0.5478163, 0.3644264, -0.939072, 0.08627451, 1, 0, 1,
-0.5387726, 0.04353942, -0.4611916, 0.07843138, 1, 0, 1,
-0.5383113, 1.663295, 0.518688, 0.07450981, 1, 0, 1,
-0.53611, -0.3662971, -0.9858166, 0.06666667, 1, 0, 1,
-0.531499, 0.1426964, -0.2425973, 0.0627451, 1, 0, 1,
-0.5303272, -0.4034113, -3.250397, 0.05490196, 1, 0, 1,
-0.5286649, -0.6202736, -2.075638, 0.05098039, 1, 0, 1,
-0.5266172, 0.005359837, -1.709217, 0.04313726, 1, 0, 1,
-0.5251104, 1.219175, -0.09858247, 0.03921569, 1, 0, 1,
-0.5249425, -0.1328017, -2.282158, 0.03137255, 1, 0, 1,
-0.5232222, -0.2171457, -1.528043, 0.02745098, 1, 0, 1,
-0.5205973, -0.3661968, -2.471893, 0.01960784, 1, 0, 1,
-0.5184916, 1.711374, 0.6157771, 0.01568628, 1, 0, 1,
-0.5128625, -1.225295, -3.35647, 0.007843138, 1, 0, 1,
-0.5102898, 1.147472, -1.628465, 0.003921569, 1, 0, 1,
-0.5071011, -1.017449, -2.941375, 0, 1, 0.003921569, 1,
-0.5033909, -0.1138044, -1.285645, 0, 1, 0.01176471, 1,
-0.5014593, 0.1388727, -1.671367, 0, 1, 0.01568628, 1,
-0.4933427, -1.765364, -1.957531, 0, 1, 0.02352941, 1,
-0.4931988, 1.237684, -0.9308492, 0, 1, 0.02745098, 1,
-0.4914707, -0.1361702, -0.6247164, 0, 1, 0.03529412, 1,
-0.4904098, 0.6282525, -0.9467909, 0, 1, 0.03921569, 1,
-0.4855652, 0.8046039, -1.473195, 0, 1, 0.04705882, 1,
-0.483469, -0.1490975, -2.429467, 0, 1, 0.05098039, 1,
-0.4814912, 0.9184895, 0.1807582, 0, 1, 0.05882353, 1,
-0.4812394, -0.03774838, -1.08097, 0, 1, 0.0627451, 1,
-0.4812159, -0.5347286, -2.31607, 0, 1, 0.07058824, 1,
-0.4810096, 0.3741614, -1.55346, 0, 1, 0.07450981, 1,
-0.4777566, 0.6795934, -0.6147709, 0, 1, 0.08235294, 1,
-0.4758648, -1.651927, -3.37672, 0, 1, 0.08627451, 1,
-0.4616998, 0.653291, 1.191304, 0, 1, 0.09411765, 1,
-0.461372, 0.428349, -2.433863, 0, 1, 0.1019608, 1,
-0.4582895, -0.1440776, -2.305369, 0, 1, 0.1058824, 1,
-0.4556732, 0.8123872, -0.737088, 0, 1, 0.1137255, 1,
-0.4546148, -2.138423, -3.053673, 0, 1, 0.1176471, 1,
-0.4513497, -2.770313, -2.28847, 0, 1, 0.1254902, 1,
-0.4510576, -0.1062006, -1.434266, 0, 1, 0.1294118, 1,
-0.4480692, 0.363354, -0.6195077, 0, 1, 0.1372549, 1,
-0.4445333, 1.255986, 0.762015, 0, 1, 0.1411765, 1,
-0.444329, -0.3276552, -1.699544, 0, 1, 0.1490196, 1,
-0.4438741, -0.2152568, -1.893895, 0, 1, 0.1529412, 1,
-0.4436198, -1.292191, -3.804221, 0, 1, 0.1607843, 1,
-0.4387074, -1.17727, -2.462998, 0, 1, 0.1647059, 1,
-0.4333687, -1.507999, -1.738251, 0, 1, 0.172549, 1,
-0.4333607, 1.324792, -0.5391894, 0, 1, 0.1764706, 1,
-0.4308356, 1.765704, -0.7036697, 0, 1, 0.1843137, 1,
-0.4290397, 1.214234, 1.176463, 0, 1, 0.1882353, 1,
-0.4259889, -0.1346595, -3.308167, 0, 1, 0.1960784, 1,
-0.4198095, -0.1733445, -2.496383, 0, 1, 0.2039216, 1,
-0.4153385, 1.535902, 1.498218, 0, 1, 0.2078431, 1,
-0.4090885, -0.5765826, -2.01747, 0, 1, 0.2156863, 1,
-0.4070385, -1.099733, -2.926005, 0, 1, 0.2196078, 1,
-0.4065831, 0.9222385, -0.9789698, 0, 1, 0.227451, 1,
-0.4053429, -0.3863413, -3.945791, 0, 1, 0.2313726, 1,
-0.4049776, 1.623467, -1.294847, 0, 1, 0.2392157, 1,
-0.4036098, 0.9327485, -0.2773875, 0, 1, 0.2431373, 1,
-0.4026772, 2.164177, -1.009325, 0, 1, 0.2509804, 1,
-0.3914935, 0.07692441, -0.8090435, 0, 1, 0.254902, 1,
-0.3903812, -1.322067, -2.569874, 0, 1, 0.2627451, 1,
-0.3889683, -1.066046, -1.797228, 0, 1, 0.2666667, 1,
-0.3853226, -1.478819, -1.93435, 0, 1, 0.2745098, 1,
-0.3834357, -1.606019, -2.825563, 0, 1, 0.2784314, 1,
-0.382512, -0.6991694, -3.135626, 0, 1, 0.2862745, 1,
-0.3801007, -1.132967, -2.100901, 0, 1, 0.2901961, 1,
-0.3757452, 0.9817352, -0.3353012, 0, 1, 0.2980392, 1,
-0.369955, -0.6759216, -2.946025, 0, 1, 0.3058824, 1,
-0.3699066, -0.394004, -3.269315, 0, 1, 0.3098039, 1,
-0.3657639, 1.128592, -2.516488, 0, 1, 0.3176471, 1,
-0.3622692, 0.3089699, -0.1867147, 0, 1, 0.3215686, 1,
-0.3569571, 0.005963871, -1.243514, 0, 1, 0.3294118, 1,
-0.3557166, 0.1381835, -0.0766827, 0, 1, 0.3333333, 1,
-0.3557025, -0.5153405, -1.356808, 0, 1, 0.3411765, 1,
-0.3548796, -0.2224385, -0.5564139, 0, 1, 0.345098, 1,
-0.3494582, 1.109993, 0.4869832, 0, 1, 0.3529412, 1,
-0.3487274, 1.520419, 0.4829771, 0, 1, 0.3568628, 1,
-0.3477492, -0.3976099, -2.771249, 0, 1, 0.3647059, 1,
-0.3458975, 0.3895855, -0.9632015, 0, 1, 0.3686275, 1,
-0.3431499, -1.181, -4.221529, 0, 1, 0.3764706, 1,
-0.3396664, -0.1364092, -1.883259, 0, 1, 0.3803922, 1,
-0.3368805, -0.07110296, -1.930049, 0, 1, 0.3882353, 1,
-0.3296422, 1.821564, -1.754989, 0, 1, 0.3921569, 1,
-0.3271561, 0.0307634, -2.436412, 0, 1, 0.4, 1,
-0.324156, -0.3802207, -2.835427, 0, 1, 0.4078431, 1,
-0.3237144, -2.639009, -2.56465, 0, 1, 0.4117647, 1,
-0.3204906, 0.43989, -0.1842592, 0, 1, 0.4196078, 1,
-0.317723, 0.2048783, 0.07699681, 0, 1, 0.4235294, 1,
-0.3168415, 0.1544432, -1.189354, 0, 1, 0.4313726, 1,
-0.3168292, 0.8239797, -1.746501, 0, 1, 0.4352941, 1,
-0.3151613, 0.4223349, -0.3865321, 0, 1, 0.4431373, 1,
-0.3104645, -1.000654, -3.957286, 0, 1, 0.4470588, 1,
-0.3071162, -1.02295, -3.690512, 0, 1, 0.454902, 1,
-0.3005976, 0.6445411, -0.1738492, 0, 1, 0.4588235, 1,
-0.3003991, 0.1932862, -2.633488, 0, 1, 0.4666667, 1,
-0.2976618, -0.2696795, -1.158086, 0, 1, 0.4705882, 1,
-0.2947356, -0.9966009, -3.747091, 0, 1, 0.4784314, 1,
-0.2931425, 0.2027677, -0.9219085, 0, 1, 0.4823529, 1,
-0.2774371, -0.3429707, -1.290175, 0, 1, 0.4901961, 1,
-0.273583, -1.200284, -4.362867, 0, 1, 0.4941176, 1,
-0.2735305, -0.6079679, -2.327348, 0, 1, 0.5019608, 1,
-0.2729337, 0.05049954, -1.122388, 0, 1, 0.509804, 1,
-0.2688873, 0.4169221, 0.2740993, 0, 1, 0.5137255, 1,
-0.2669342, -0.3951494, -1.372941, 0, 1, 0.5215687, 1,
-0.2664194, 2.441063, -0.5798008, 0, 1, 0.5254902, 1,
-0.26618, 0.204073, -0.6028613, 0, 1, 0.5333334, 1,
-0.2637013, -0.8816432, -2.734451, 0, 1, 0.5372549, 1,
-0.2622018, -1.467269, -1.491366, 0, 1, 0.5450981, 1,
-0.2611246, 0.6475596, 1.117984, 0, 1, 0.5490196, 1,
-0.2585884, -0.3067631, -3.402915, 0, 1, 0.5568628, 1,
-0.2570836, -0.1228673, -0.0559821, 0, 1, 0.5607843, 1,
-0.2562025, -0.1385563, -4.450024, 0, 1, 0.5686275, 1,
-0.255271, -2.557554, -2.063566, 0, 1, 0.572549, 1,
-0.2532538, -1.27293, -3.19185, 0, 1, 0.5803922, 1,
-0.2517944, 0.1997267, -0.3022802, 0, 1, 0.5843138, 1,
-0.2494399, -1.07791, -3.342926, 0, 1, 0.5921569, 1,
-0.248238, 0.812416, -0.7100762, 0, 1, 0.5960785, 1,
-0.2461107, -0.3906097, -2.507977, 0, 1, 0.6039216, 1,
-0.2448354, -1.69124, -1.56491, 0, 1, 0.6117647, 1,
-0.2436175, 0.6771542, 0.09638095, 0, 1, 0.6156863, 1,
-0.2360712, 1.414057, 1.482906, 0, 1, 0.6235294, 1,
-0.2350101, -1.071862, -3.486432, 0, 1, 0.627451, 1,
-0.2331232, 0.2428023, -1.37763, 0, 1, 0.6352941, 1,
-0.2327081, -0.8962368, -1.575973, 0, 1, 0.6392157, 1,
-0.23103, 0.1230569, -0.3271171, 0, 1, 0.6470588, 1,
-0.2240316, -1.181674, -1.295312, 0, 1, 0.6509804, 1,
-0.2235008, 0.2565379, -2.25008, 0, 1, 0.6588235, 1,
-0.2212071, 0.3894119, -0.4548126, 0, 1, 0.6627451, 1,
-0.2207383, 0.3539246, 0.1231432, 0, 1, 0.6705883, 1,
-0.2179601, -0.7969935, -3.756254, 0, 1, 0.6745098, 1,
-0.2119855, 0.1725083, 0.2805502, 0, 1, 0.682353, 1,
-0.2114988, 1.284575, -0.5998634, 0, 1, 0.6862745, 1,
-0.2105961, -0.2100334, -2.21639, 0, 1, 0.6941177, 1,
-0.2102214, -1.496124, -2.419945, 0, 1, 0.7019608, 1,
-0.2102096, -1.476216, -1.910846, 0, 1, 0.7058824, 1,
-0.2095852, -1.012002, -3.08337, 0, 1, 0.7137255, 1,
-0.2074464, -0.5583588, -3.079306, 0, 1, 0.7176471, 1,
-0.2047195, 0.1309861, -2.118237, 0, 1, 0.7254902, 1,
-0.2043809, 0.3184045, -0.490132, 0, 1, 0.7294118, 1,
-0.202182, 0.4806127, 0.3343576, 0, 1, 0.7372549, 1,
-0.2004117, 0.5712504, 0.1408099, 0, 1, 0.7411765, 1,
-0.1977577, 0.662593, -1.435899, 0, 1, 0.7490196, 1,
-0.1972476, 1.007691, -0.02201488, 0, 1, 0.7529412, 1,
-0.1961652, -1.103499, -2.995231, 0, 1, 0.7607843, 1,
-0.1943611, 0.3268581, -2.5868, 0, 1, 0.7647059, 1,
-0.1852816, 0.08285335, -2.294737, 0, 1, 0.772549, 1,
-0.1826219, -1.437661, -2.77938, 0, 1, 0.7764706, 1,
-0.1822201, -1.579799, -3.711872, 0, 1, 0.7843137, 1,
-0.1618357, -0.6781767, -2.455772, 0, 1, 0.7882353, 1,
-0.1540794, -1.362268, -3.503889, 0, 1, 0.7960784, 1,
-0.1480835, -2.096356, -4.499307, 0, 1, 0.8039216, 1,
-0.1443661, 1.016221, 1.71114, 0, 1, 0.8078431, 1,
-0.1428805, -0.281509, -2.609047, 0, 1, 0.8156863, 1,
-0.1428062, 0.7602159, 0.4753249, 0, 1, 0.8196079, 1,
-0.1373876, -0.8931587, -2.394533, 0, 1, 0.827451, 1,
-0.136251, -0.889615, -4.196733, 0, 1, 0.8313726, 1,
-0.1339856, -1.132402, -4.061207, 0, 1, 0.8392157, 1,
-0.1323216, -0.4660034, -3.114797, 0, 1, 0.8431373, 1,
-0.127674, 0.1787456, -0.2243273, 0, 1, 0.8509804, 1,
-0.1236461, -0.1783064, -2.138941, 0, 1, 0.854902, 1,
-0.1174806, -1.39589, -3.349637, 0, 1, 0.8627451, 1,
-0.117174, 0.06386747, -3.083914, 0, 1, 0.8666667, 1,
-0.1155811, -0.0913491, -2.74834, 0, 1, 0.8745098, 1,
-0.1112801, -0.3267191, -4.043915, 0, 1, 0.8784314, 1,
-0.1104259, 0.1585435, -1.296008, 0, 1, 0.8862745, 1,
-0.1088014, -0.07988893, -1.348515, 0, 1, 0.8901961, 1,
-0.1086896, -0.8376341, -3.044721, 0, 1, 0.8980392, 1,
-0.1066509, 0.2443963, 0.4596815, 0, 1, 0.9058824, 1,
-0.1055711, 1.333555, 0.2622879, 0, 1, 0.9098039, 1,
-0.1049006, 1.865102, -1.726623, 0, 1, 0.9176471, 1,
-0.1040986, 0.06593895, 0.2143999, 0, 1, 0.9215686, 1,
-0.1002731, 1.474954, 0.4669489, 0, 1, 0.9294118, 1,
-0.1000154, 0.6438422, 2.539304, 0, 1, 0.9333333, 1,
-0.09739994, 0.6065763, -1.730585, 0, 1, 0.9411765, 1,
-0.09075586, -1.375602, -4.089648, 0, 1, 0.945098, 1,
-0.088462, -0.9720385, -4.55919, 0, 1, 0.9529412, 1,
-0.08576448, 1.425539, 2.000615, 0, 1, 0.9568627, 1,
-0.08391578, 0.9165128, -0.6872295, 0, 1, 0.9647059, 1,
-0.08193967, 0.1794092, -0.8498119, 0, 1, 0.9686275, 1,
-0.08175801, 1.669577, 0.9782833, 0, 1, 0.9764706, 1,
-0.07898586, -0.2162879, -3.007375, 0, 1, 0.9803922, 1,
-0.07695943, -1.286322, -2.771413, 0, 1, 0.9882353, 1,
-0.07242632, 1.652959, -1.667397, 0, 1, 0.9921569, 1,
-0.07008411, 0.4747444, -0.1389307, 0, 1, 1, 1,
-0.06752391, -0.8245303, -4.387594, 0, 0.9921569, 1, 1,
-0.06687642, -1.42876, -3.303686, 0, 0.9882353, 1, 1,
-0.06154738, 0.8016074, 0.4691371, 0, 0.9803922, 1, 1,
-0.05889091, 2.308168, 0.8018305, 0, 0.9764706, 1, 1,
-0.05878187, 0.676372, -1.792526, 0, 0.9686275, 1, 1,
-0.05387255, -1.031977, -3.288542, 0, 0.9647059, 1, 1,
-0.05151513, -0.2587647, -2.535753, 0, 0.9568627, 1, 1,
-0.04282635, 0.8030044, -0.7584772, 0, 0.9529412, 1, 1,
-0.03797863, -0.7706169, -0.711832, 0, 0.945098, 1, 1,
-0.03239531, -0.3269425, -1.534218, 0, 0.9411765, 1, 1,
-0.0299168, 1.001636, -0.7080214, 0, 0.9333333, 1, 1,
-0.02964368, 0.1390616, -1.582277, 0, 0.9294118, 1, 1,
-0.02646588, 0.04036786, -1.190942, 0, 0.9215686, 1, 1,
-0.02466894, -0.04436408, -1.474807, 0, 0.9176471, 1, 1,
-0.01640429, 1.567792, 0.4791178, 0, 0.9098039, 1, 1,
-0.0129514, 0.2351126, 1.184273, 0, 0.9058824, 1, 1,
-0.01227498, 0.541174, -0.8439159, 0, 0.8980392, 1, 1,
-0.01166011, 0.08293463, 0.1939468, 0, 0.8901961, 1, 1,
-0.007195489, 0.3170142, 0.9267665, 0, 0.8862745, 1, 1,
-0.007081912, -0.948772, -2.458861, 0, 0.8784314, 1, 1,
0.005714389, 1.961347, -0.200227, 0, 0.8745098, 1, 1,
0.0123334, -0.2630935, 2.906853, 0, 0.8666667, 1, 1,
0.01373278, 0.5567847, -0.09044538, 0, 0.8627451, 1, 1,
0.02081461, 2.090498, -0.1223408, 0, 0.854902, 1, 1,
0.02172644, -1.482598, 3.826348, 0, 0.8509804, 1, 1,
0.02803018, -0.4800858, 1.826787, 0, 0.8431373, 1, 1,
0.03578912, 0.5268082, -0.8995857, 0, 0.8392157, 1, 1,
0.03621081, -1.360513, 3.325163, 0, 0.8313726, 1, 1,
0.04021303, 1.406841, 0.2154728, 0, 0.827451, 1, 1,
0.0451663, 0.7655875, 0.7424058, 0, 0.8196079, 1, 1,
0.04718599, 0.6557532, 1.176748, 0, 0.8156863, 1, 1,
0.04944256, -2.07266, 2.073006, 0, 0.8078431, 1, 1,
0.04982852, 0.01397638, 0.1237512, 0, 0.8039216, 1, 1,
0.05340328, -2.13991, 2.817242, 0, 0.7960784, 1, 1,
0.05365077, 1.327588, -1.312292, 0, 0.7882353, 1, 1,
0.05491795, 0.5316676, 0.7246677, 0, 0.7843137, 1, 1,
0.05771103, -1.522405, 4.112552, 0, 0.7764706, 1, 1,
0.06286853, -0.7699746, 4.788479, 0, 0.772549, 1, 1,
0.0651127, -2.034143, 4.37235, 0, 0.7647059, 1, 1,
0.07004467, -1.204639, 0.7497484, 0, 0.7607843, 1, 1,
0.07909017, 1.478073, -0.550658, 0, 0.7529412, 1, 1,
0.07938673, -0.0847085, 2.075176, 0, 0.7490196, 1, 1,
0.08057372, 1.421767, 1.537981, 0, 0.7411765, 1, 1,
0.08093107, 0.4509689, -0.2559349, 0, 0.7372549, 1, 1,
0.0813169, 0.2971448, 0.6582353, 0, 0.7294118, 1, 1,
0.08482479, 0.4273917, 0.04963542, 0, 0.7254902, 1, 1,
0.08764499, -0.896408, 3.512559, 0, 0.7176471, 1, 1,
0.09501754, 0.6932345, 0.8928807, 0, 0.7137255, 1, 1,
0.09794642, 1.397658, -1.580929, 0, 0.7058824, 1, 1,
0.09879097, 0.2205452, 0.6470171, 0, 0.6980392, 1, 1,
0.09889986, 0.5452228, -1.46341, 0, 0.6941177, 1, 1,
0.1029395, 0.6930656, -0.3302559, 0, 0.6862745, 1, 1,
0.1033685, -1.652582, 2.597409, 0, 0.682353, 1, 1,
0.1070902, 0.05834612, 1.940583, 0, 0.6745098, 1, 1,
0.1106137, -0.107472, 1.172747, 0, 0.6705883, 1, 1,
0.1157215, 0.9612551, -0.1750846, 0, 0.6627451, 1, 1,
0.1162791, 0.5580528, -0.816208, 0, 0.6588235, 1, 1,
0.1194877, 2.62922, 0.4179038, 0, 0.6509804, 1, 1,
0.12246, 0.4262598, 1.464988, 0, 0.6470588, 1, 1,
0.1225346, 2.792571, 0.3687309, 0, 0.6392157, 1, 1,
0.124102, 0.02283716, 2.55404, 0, 0.6352941, 1, 1,
0.1262823, -0.1755683, 5.87584, 0, 0.627451, 1, 1,
0.130234, 0.5909868, -0.2940182, 0, 0.6235294, 1, 1,
0.1396412, -0.9617515, 5.602633, 0, 0.6156863, 1, 1,
0.1445404, 0.2144971, 0.0437862, 0, 0.6117647, 1, 1,
0.1467208, -0.1621111, 3.314083, 0, 0.6039216, 1, 1,
0.1495154, -0.4911261, 4.249315, 0, 0.5960785, 1, 1,
0.1500288, 1.737411, 1.02531, 0, 0.5921569, 1, 1,
0.1506078, 1.382648, 0.4808252, 0, 0.5843138, 1, 1,
0.1536988, -0.4445839, 2.082869, 0, 0.5803922, 1, 1,
0.1640856, -2.101603, 4.778227, 0, 0.572549, 1, 1,
0.1642084, 0.6202631, 1.127733, 0, 0.5686275, 1, 1,
0.1663084, 0.4807647, -0.454837, 0, 0.5607843, 1, 1,
0.1674385, 0.3694476, -0.04163143, 0, 0.5568628, 1, 1,
0.1676983, -1.099492, 3.234943, 0, 0.5490196, 1, 1,
0.1689681, 0.1593647, 0.5619694, 0, 0.5450981, 1, 1,
0.1705641, -0.3282326, 3.775869, 0, 0.5372549, 1, 1,
0.1707722, -0.1476143, 2.643318, 0, 0.5333334, 1, 1,
0.1709817, 0.08642692, 0.8761601, 0, 0.5254902, 1, 1,
0.1713658, -0.4669647, 2.661683, 0, 0.5215687, 1, 1,
0.1754043, -0.6746408, 2.616874, 0, 0.5137255, 1, 1,
0.1801445, -0.4087554, 4.008316, 0, 0.509804, 1, 1,
0.1860966, 1.214879, 1.250381, 0, 0.5019608, 1, 1,
0.1876409, 0.01576891, 0.2706847, 0, 0.4941176, 1, 1,
0.191671, -0.860168, 4.041243, 0, 0.4901961, 1, 1,
0.1926759, -0.8917993, 2.759791, 0, 0.4823529, 1, 1,
0.1931293, -0.8581401, 3.55449, 0, 0.4784314, 1, 1,
0.1948109, 0.6578338, -0.9671835, 0, 0.4705882, 1, 1,
0.197246, -0.03811458, 1.625653, 0, 0.4666667, 1, 1,
0.1988924, 0.9206746, -0.4181961, 0, 0.4588235, 1, 1,
0.1995135, -0.2739242, 2.737065, 0, 0.454902, 1, 1,
0.2005698, 1.194477, -0.2913249, 0, 0.4470588, 1, 1,
0.2044571, 1.217852, 1.256376, 0, 0.4431373, 1, 1,
0.2071656, 0.7485304, -1.478563, 0, 0.4352941, 1, 1,
0.2071789, 0.04831557, 1.104683, 0, 0.4313726, 1, 1,
0.2141688, -0.0502889, 2.225828, 0, 0.4235294, 1, 1,
0.2150166, 0.04387387, 1.835677, 0, 0.4196078, 1, 1,
0.221355, 0.2729177, 0.6374974, 0, 0.4117647, 1, 1,
0.2263204, -0.9511176, 4.250865, 0, 0.4078431, 1, 1,
0.229837, -0.06384405, 2.694782, 0, 0.4, 1, 1,
0.2302166, -0.0005591023, 2.575818, 0, 0.3921569, 1, 1,
0.2372564, 0.1495897, 0.502889, 0, 0.3882353, 1, 1,
0.2461928, 0.04956006, -1.118926, 0, 0.3803922, 1, 1,
0.2473758, -1.111507, 2.348254, 0, 0.3764706, 1, 1,
0.2479662, -0.6388817, 3.300494, 0, 0.3686275, 1, 1,
0.2488292, -0.8294489, 4.597085, 0, 0.3647059, 1, 1,
0.2489225, 0.6952139, 0.8961818, 0, 0.3568628, 1, 1,
0.2526896, 2.362097, 1.707545, 0, 0.3529412, 1, 1,
0.2566119, -1.433315, 3.507464, 0, 0.345098, 1, 1,
0.2603299, -0.6707326, 2.389864, 0, 0.3411765, 1, 1,
0.2673694, 1.396219, 1.133141, 0, 0.3333333, 1, 1,
0.2680387, 1.451674, 1.046947, 0, 0.3294118, 1, 1,
0.268652, 0.6076943, 0.1384809, 0, 0.3215686, 1, 1,
0.2697276, 0.2808022, 3.312923, 0, 0.3176471, 1, 1,
0.2727523, 0.5267774, -0.4155623, 0, 0.3098039, 1, 1,
0.2811592, -0.2085336, 1.882286, 0, 0.3058824, 1, 1,
0.2857225, -0.569153, 3.576731, 0, 0.2980392, 1, 1,
0.2862445, 1.403312, 1.870023, 0, 0.2901961, 1, 1,
0.2930771, 1.25802, 0.1202429, 0, 0.2862745, 1, 1,
0.2959524, -1.171054, 4.094567, 0, 0.2784314, 1, 1,
0.2973197, -1.274123, 1.506011, 0, 0.2745098, 1, 1,
0.2991763, -1.077418, 4.247848, 0, 0.2666667, 1, 1,
0.3028661, 0.4355307, -0.2568079, 0, 0.2627451, 1, 1,
0.3033106, 0.2236809, 1.345235, 0, 0.254902, 1, 1,
0.3041699, 0.1556387, 2.038543, 0, 0.2509804, 1, 1,
0.3047337, 1.083616, -0.180132, 0, 0.2431373, 1, 1,
0.3086449, -0.6569611, 1.873608, 0, 0.2392157, 1, 1,
0.317477, 0.1051007, 0.9786375, 0, 0.2313726, 1, 1,
0.3175373, -0.7625817, 2.819576, 0, 0.227451, 1, 1,
0.3242023, 0.2980284, 0.8580707, 0, 0.2196078, 1, 1,
0.3244947, -0.4317691, 3.261977, 0, 0.2156863, 1, 1,
0.3259301, -0.3390554, 2.391408, 0, 0.2078431, 1, 1,
0.3265985, -0.3596735, 1.721883, 0, 0.2039216, 1, 1,
0.3267213, -0.08153971, 1.503464, 0, 0.1960784, 1, 1,
0.3284261, -1.229806, 1.810628, 0, 0.1882353, 1, 1,
0.3286861, 0.5264893, -1.184063, 0, 0.1843137, 1, 1,
0.3297422, -1.199614, 1.654791, 0, 0.1764706, 1, 1,
0.3331372, 1.005496, 2.047248, 0, 0.172549, 1, 1,
0.3381817, -0.9860348, 3.768234, 0, 0.1647059, 1, 1,
0.3449964, 0.01861602, 1.868043, 0, 0.1607843, 1, 1,
0.3484553, -0.08423131, 2.176648, 0, 0.1529412, 1, 1,
0.3493212, -0.1044494, 2.437, 0, 0.1490196, 1, 1,
0.3549543, -2.487762, 2.341556, 0, 0.1411765, 1, 1,
0.3582853, -1.126212, 4.303622, 0, 0.1372549, 1, 1,
0.3597184, -1.239907, 3.375495, 0, 0.1294118, 1, 1,
0.3599503, -0.5356457, 0.8037938, 0, 0.1254902, 1, 1,
0.3619517, -0.05939526, 2.125335, 0, 0.1176471, 1, 1,
0.3678583, 0.1536976, -1.501424, 0, 0.1137255, 1, 1,
0.3729275, 0.206715, 1.135799, 0, 0.1058824, 1, 1,
0.3781486, 1.028698, 0.5689015, 0, 0.09803922, 1, 1,
0.3809715, 0.6323202, 0.6613502, 0, 0.09411765, 1, 1,
0.3863461, -2.220439, 4.06013, 0, 0.08627451, 1, 1,
0.3871738, -0.4186015, 1.737738, 0, 0.08235294, 1, 1,
0.3899579, -0.2026995, 1.975134, 0, 0.07450981, 1, 1,
0.3937622, 2.179445, -0.9438685, 0, 0.07058824, 1, 1,
0.3959327, 0.6793882, -1.517991, 0, 0.0627451, 1, 1,
0.397451, 0.428701, 0.7371954, 0, 0.05882353, 1, 1,
0.399146, 0.7428303, 0.05106223, 0, 0.05098039, 1, 1,
0.4023639, -0.1988878, 3.551836, 0, 0.04705882, 1, 1,
0.4112011, 0.307236, 0.3326757, 0, 0.03921569, 1, 1,
0.4116293, 0.6468618, 2.098339, 0, 0.03529412, 1, 1,
0.4131877, 0.3997423, 0.1151345, 0, 0.02745098, 1, 1,
0.4138479, 0.5959936, 1.124939, 0, 0.02352941, 1, 1,
0.4179617, 1.615647, 1.748785, 0, 0.01568628, 1, 1,
0.4252567, 1.077692, -1.504871, 0, 0.01176471, 1, 1,
0.428085, -0.5220278, 2.423376, 0, 0.003921569, 1, 1,
0.4283361, 0.08339449, 1.393227, 0.003921569, 0, 1, 1,
0.4390645, -0.008079072, 2.777826, 0.007843138, 0, 1, 1,
0.4431601, 1.976887, 0.1679873, 0.01568628, 0, 1, 1,
0.4465488, -0.7894302, 1.578974, 0.01960784, 0, 1, 1,
0.4469822, -0.1534485, 5.4166, 0.02745098, 0, 1, 1,
0.4492695, -0.8446348, 1.064241, 0.03137255, 0, 1, 1,
0.4518876, 0.2103005, 1.794105, 0.03921569, 0, 1, 1,
0.4524716, 0.5032849, 1.063491, 0.04313726, 0, 1, 1,
0.4551327, -1.08479, 4.759372, 0.05098039, 0, 1, 1,
0.4640999, 0.6021864, 1.620409, 0.05490196, 0, 1, 1,
0.4642046, -0.7883041, 3.012532, 0.0627451, 0, 1, 1,
0.4654137, 0.8764713, 0.9778997, 0.06666667, 0, 1, 1,
0.4693249, -0.05548427, 0.910718, 0.07450981, 0, 1, 1,
0.4846251, -0.3651978, 2.287596, 0.07843138, 0, 1, 1,
0.4908626, -0.6751892, 3.033396, 0.08627451, 0, 1, 1,
0.4930375, 0.9596328, -0.2864976, 0.09019608, 0, 1, 1,
0.4931717, 0.1474533, 1.245998, 0.09803922, 0, 1, 1,
0.4932798, 1.020026, -0.285138, 0.1058824, 0, 1, 1,
0.505087, 0.9739932, 0.5228202, 0.1098039, 0, 1, 1,
0.5050972, -0.2041623, 1.26048, 0.1176471, 0, 1, 1,
0.5150091, -0.03140189, 1.94103, 0.1215686, 0, 1, 1,
0.5168818, 0.7618751, -0.2332761, 0.1294118, 0, 1, 1,
0.5210776, 0.05299129, 1.787466, 0.1333333, 0, 1, 1,
0.5242522, -0.4969838, 2.100029, 0.1411765, 0, 1, 1,
0.5279577, 0.2246573, 1.377797, 0.145098, 0, 1, 1,
0.5322807, -1.011231, 0.7301058, 0.1529412, 0, 1, 1,
0.5325217, 2.148984, 1.505109, 0.1568628, 0, 1, 1,
0.5325288, 2.448875, 0.5496178, 0.1647059, 0, 1, 1,
0.5372307, -0.3186813, 1.171367, 0.1686275, 0, 1, 1,
0.5403713, 0.6987691, 0.2018232, 0.1764706, 0, 1, 1,
0.5405522, -0.4193526, 2.907021, 0.1803922, 0, 1, 1,
0.5422158, 1.70533, -0.5488906, 0.1882353, 0, 1, 1,
0.5475914, -2.633005, 5.510846, 0.1921569, 0, 1, 1,
0.548485, -0.5832398, 4.384284, 0.2, 0, 1, 1,
0.548651, 0.6962242, 0.6020244, 0.2078431, 0, 1, 1,
0.5488676, -0.4935185, 2.871841, 0.2117647, 0, 1, 1,
0.5504173, -1.683476, 1.462479, 0.2196078, 0, 1, 1,
0.5517429, 1.138062, 1.777946, 0.2235294, 0, 1, 1,
0.5555668, 1.471395, 2.3206, 0.2313726, 0, 1, 1,
0.561095, 0.4124843, 0.366676, 0.2352941, 0, 1, 1,
0.5633901, 0.005567288, 0.9720576, 0.2431373, 0, 1, 1,
0.5682817, -0.03617066, 1.430328, 0.2470588, 0, 1, 1,
0.5707528, 0.5814337, -0.5097365, 0.254902, 0, 1, 1,
0.5785946, -1.254776, 3.439677, 0.2588235, 0, 1, 1,
0.5797818, -0.8365543, 2.49844, 0.2666667, 0, 1, 1,
0.5798866, -1.342703, 3.097652, 0.2705882, 0, 1, 1,
0.5803912, 0.9353142, 2.953345, 0.2784314, 0, 1, 1,
0.5907524, 1.564049, 1.762007, 0.282353, 0, 1, 1,
0.5923641, -0.2724564, 1.71158, 0.2901961, 0, 1, 1,
0.5931252, 0.4949533, -0.09313706, 0.2941177, 0, 1, 1,
0.5941406, 0.1595582, 0.079054, 0.3019608, 0, 1, 1,
0.6024125, -0.08344395, 1.386385, 0.3098039, 0, 1, 1,
0.6064522, -0.0561148, 1.421224, 0.3137255, 0, 1, 1,
0.6080952, 0.8207053, 1.808213, 0.3215686, 0, 1, 1,
0.6084362, -0.578172, 4.390531, 0.3254902, 0, 1, 1,
0.6136291, 0.7006772, -0.2692795, 0.3333333, 0, 1, 1,
0.6146813, -0.3908314, 3.05091, 0.3372549, 0, 1, 1,
0.6156198, -0.006758176, 0.9871007, 0.345098, 0, 1, 1,
0.6226638, -1.844221, 3.882401, 0.3490196, 0, 1, 1,
0.6295744, -0.06234256, 1.157225, 0.3568628, 0, 1, 1,
0.6298988, 0.432611, 0.818445, 0.3607843, 0, 1, 1,
0.6299376, -0.8240969, -0.1182038, 0.3686275, 0, 1, 1,
0.6370265, 1.209624, -1.100405, 0.372549, 0, 1, 1,
0.6418871, -0.4744983, 1.133003, 0.3803922, 0, 1, 1,
0.6431248, 1.221683, -1.15774, 0.3843137, 0, 1, 1,
0.6483895, 0.2134358, 2.33523, 0.3921569, 0, 1, 1,
0.6526098, 0.9519348, 0.2994527, 0.3960784, 0, 1, 1,
0.6579606, 1.487482, 0.1391495, 0.4039216, 0, 1, 1,
0.6619437, -1.364378, 3.451318, 0.4117647, 0, 1, 1,
0.6627122, 0.3686261, 1.002115, 0.4156863, 0, 1, 1,
0.6628202, 0.9650127, 1.057742, 0.4235294, 0, 1, 1,
0.6712754, 1.118278, 0.5432447, 0.427451, 0, 1, 1,
0.6720542, 1.98845, 1.689479, 0.4352941, 0, 1, 1,
0.6728139, -0.6297695, 1.131327, 0.4392157, 0, 1, 1,
0.6785877, -0.09151642, 2.473308, 0.4470588, 0, 1, 1,
0.67997, 0.4819197, 2.207373, 0.4509804, 0, 1, 1,
0.6911707, -1.673838, 3.588909, 0.4588235, 0, 1, 1,
0.6916511, 0.6911841, 2.311316, 0.4627451, 0, 1, 1,
0.6999575, 1.48092, -0.9765198, 0.4705882, 0, 1, 1,
0.7025964, -0.9556273, 2.923274, 0.4745098, 0, 1, 1,
0.7063324, -0.5474849, 3.074566, 0.4823529, 0, 1, 1,
0.7110467, -0.02187124, 2.436974, 0.4862745, 0, 1, 1,
0.7124142, -0.3381343, 2.099125, 0.4941176, 0, 1, 1,
0.7182906, -0.174521, 1.305453, 0.5019608, 0, 1, 1,
0.7229197, 0.1783218, -0.3347845, 0.5058824, 0, 1, 1,
0.7263497, 0.5701501, -0.3858672, 0.5137255, 0, 1, 1,
0.7340704, -0.6636497, 1.838235, 0.5176471, 0, 1, 1,
0.7375246, 1.618194, -0.0383039, 0.5254902, 0, 1, 1,
0.7417547, -2.262592, 2.529947, 0.5294118, 0, 1, 1,
0.746412, -0.8026435, 3.276487, 0.5372549, 0, 1, 1,
0.7539725, -1.980233, 3.075562, 0.5411765, 0, 1, 1,
0.755826, -0.6800882, 2.882064, 0.5490196, 0, 1, 1,
0.756664, -1.638896, 1.787983, 0.5529412, 0, 1, 1,
0.7588267, 0.1438361, 2.272657, 0.5607843, 0, 1, 1,
0.7591518, -1.106228, -1.557045, 0.5647059, 0, 1, 1,
0.7597584, -1.468721, 3.830346, 0.572549, 0, 1, 1,
0.762246, -0.4921714, 2.212526, 0.5764706, 0, 1, 1,
0.7637485, 1.229417, 0.9060135, 0.5843138, 0, 1, 1,
0.7703049, 1.079842, 0.6477871, 0.5882353, 0, 1, 1,
0.774222, 0.4372995, 2.962687, 0.5960785, 0, 1, 1,
0.7751499, -0.9704871, 1.795333, 0.6039216, 0, 1, 1,
0.7794793, -0.4085962, 2.947361, 0.6078432, 0, 1, 1,
0.7834234, 0.4279565, 0.958329, 0.6156863, 0, 1, 1,
0.7849057, -0.4742302, 0.8773843, 0.6196079, 0, 1, 1,
0.7979133, 0.5209512, 1.327351, 0.627451, 0, 1, 1,
0.8003068, 0.2083642, 2.121257, 0.6313726, 0, 1, 1,
0.8043413, 0.1918889, 3.572252, 0.6392157, 0, 1, 1,
0.8081641, -0.6351652, 3.142233, 0.6431373, 0, 1, 1,
0.8120066, 1.651919, 0.09495418, 0.6509804, 0, 1, 1,
0.8122972, -1.859741, 2.269044, 0.654902, 0, 1, 1,
0.821529, -0.3937661, 3.008855, 0.6627451, 0, 1, 1,
0.82603, -0.5177352, 1.202601, 0.6666667, 0, 1, 1,
0.8270351, 0.4451111, 0.9550298, 0.6745098, 0, 1, 1,
0.8300063, -1.16267, 2.352868, 0.6784314, 0, 1, 1,
0.8335193, -0.1421872, 0.4889008, 0.6862745, 0, 1, 1,
0.8383949, -0.5989156, 3.114323, 0.6901961, 0, 1, 1,
0.8408986, 0.1556195, 1.53392, 0.6980392, 0, 1, 1,
0.8447456, -1.99838, 0.9932287, 0.7058824, 0, 1, 1,
0.8462071, 0.5772753, -0.2081711, 0.7098039, 0, 1, 1,
0.8462248, -1.169695, 1.721933, 0.7176471, 0, 1, 1,
0.8494423, -0.513031, 2.237592, 0.7215686, 0, 1, 1,
0.8499203, 0.3519349, 0.6180878, 0.7294118, 0, 1, 1,
0.8524618, 0.2307781, 1.977318, 0.7333333, 0, 1, 1,
0.8586314, -0.8754641, 1.795845, 0.7411765, 0, 1, 1,
0.8593982, 0.5138963, 1.309061, 0.7450981, 0, 1, 1,
0.860408, -0.5002802, 2.566473, 0.7529412, 0, 1, 1,
0.8623943, -2.005622, 2.804139, 0.7568628, 0, 1, 1,
0.8649232, 0.955998, 2.439031, 0.7647059, 0, 1, 1,
0.8665519, 0.306475, 5.06265, 0.7686275, 0, 1, 1,
0.867823, 1.099252, 1.605728, 0.7764706, 0, 1, 1,
0.8679332, -0.03466047, 1.1652, 0.7803922, 0, 1, 1,
0.8703954, -0.799024, 2.764383, 0.7882353, 0, 1, 1,
0.8736224, 0.2026093, 2.610845, 0.7921569, 0, 1, 1,
0.8742431, -0.04091308, 1.235271, 0.8, 0, 1, 1,
0.8789373, 0.06963827, 3.465118, 0.8078431, 0, 1, 1,
0.8902476, 0.2523197, 3.117748, 0.8117647, 0, 1, 1,
0.8935168, 0.4091432, 2.87549, 0.8196079, 0, 1, 1,
0.8946173, 0.7431245, 0.2421919, 0.8235294, 0, 1, 1,
0.9030593, 1.140552, 1.21929, 0.8313726, 0, 1, 1,
0.9050137, 0.3528318, -0.1696754, 0.8352941, 0, 1, 1,
0.9053706, 1.502449, 0.3089168, 0.8431373, 0, 1, 1,
0.9077188, 0.2455104, 2.197758, 0.8470588, 0, 1, 1,
0.9093519, 0.01474021, 1.376427, 0.854902, 0, 1, 1,
0.9112936, 0.7222276, 0.371856, 0.8588235, 0, 1, 1,
0.9115883, -0.9635724, 2.976372, 0.8666667, 0, 1, 1,
0.9128878, 2.390656, 0.3308103, 0.8705882, 0, 1, 1,
0.9172011, 1.04839, 3.009577, 0.8784314, 0, 1, 1,
0.9204035, -0.04476852, 0.8893958, 0.8823529, 0, 1, 1,
0.9214742, 0.7938599, 1.208949, 0.8901961, 0, 1, 1,
0.9245269, -1.302763, 2.189645, 0.8941177, 0, 1, 1,
0.9246609, 0.3143285, 2.156171, 0.9019608, 0, 1, 1,
0.927195, -0.9608484, 2.058447, 0.9098039, 0, 1, 1,
0.9316514, -0.2060878, 2.298035, 0.9137255, 0, 1, 1,
0.9329014, -2.013688, 1.805842, 0.9215686, 0, 1, 1,
0.9435936, -0.9868687, 1.153771, 0.9254902, 0, 1, 1,
0.9463748, -1.273243, 2.627825, 0.9333333, 0, 1, 1,
0.9477224, 0.006517006, 0.345467, 0.9372549, 0, 1, 1,
0.9479707, -1.249593, 3.443335, 0.945098, 0, 1, 1,
0.9485468, 0.753049, 2.730713, 0.9490196, 0, 1, 1,
0.9515398, 0.6633286, 1.521476, 0.9568627, 0, 1, 1,
0.9532773, -1.834749, 3.782846, 0.9607843, 0, 1, 1,
0.9578987, 1.271176, -1.309079, 0.9686275, 0, 1, 1,
0.966643, -0.01162796, 0.9075181, 0.972549, 0, 1, 1,
0.9708695, -0.06958887, 0.002678124, 0.9803922, 0, 1, 1,
0.9761516, -0.6143125, 3.483606, 0.9843137, 0, 1, 1,
0.9778193, -0.6638634, 3.410367, 0.9921569, 0, 1, 1,
0.9829236, -0.03237275, 2.551813, 0.9960784, 0, 1, 1,
0.985624, 0.9688504, 0.5396568, 1, 0, 0.9960784, 1,
0.9904025, 0.05480142, 0.8923898, 1, 0, 0.9882353, 1,
0.9910514, 0.9464388, 0.8580689, 1, 0, 0.9843137, 1,
0.993311, 2.36097, 0.4854417, 1, 0, 0.9764706, 1,
0.993612, 0.2175328, 0.7101269, 1, 0, 0.972549, 1,
1.00526, 1.259432, 2.111134, 1, 0, 0.9647059, 1,
1.005666, -0.3744418, 1.208493, 1, 0, 0.9607843, 1,
1.00649, 1.246518, 1.008409, 1, 0, 0.9529412, 1,
1.009707, 1.003513, -0.1012524, 1, 0, 0.9490196, 1,
1.011687, -0.4058469, 1.279175, 1, 0, 0.9411765, 1,
1.01835, 0.5802748, 1.815742, 1, 0, 0.9372549, 1,
1.023582, 0.7311872, 1.679949, 1, 0, 0.9294118, 1,
1.025124, 0.9086591, 1.408883, 1, 0, 0.9254902, 1,
1.026176, -0.0884377, 2.132802, 1, 0, 0.9176471, 1,
1.036382, -1.917108, 1.352818, 1, 0, 0.9137255, 1,
1.037274, 1.148328, -0.4766933, 1, 0, 0.9058824, 1,
1.041531, -1.733918, 2.939816, 1, 0, 0.9019608, 1,
1.065336, -0.2570333, 0.6458359, 1, 0, 0.8941177, 1,
1.065805, -0.5833198, 2.606779, 1, 0, 0.8862745, 1,
1.071003, -1.454063, 1.359874, 1, 0, 0.8823529, 1,
1.071424, -0.0517861, 2.022494, 1, 0, 0.8745098, 1,
1.076321, 0.2909221, 1.564863, 1, 0, 0.8705882, 1,
1.07645, -0.229219, 0.8296018, 1, 0, 0.8627451, 1,
1.078193, -0.2274439, 0.9412664, 1, 0, 0.8588235, 1,
1.127493, 1.603649, 0.3321906, 1, 0, 0.8509804, 1,
1.130058, 1.136444, 0.7342516, 1, 0, 0.8470588, 1,
1.1447, -0.3685982, 2.357493, 1, 0, 0.8392157, 1,
1.148507, 0.09795804, 0.4540974, 1, 0, 0.8352941, 1,
1.148836, -0.6777028, 0.2683112, 1, 0, 0.827451, 1,
1.149685, 0.4381426, 0.3547415, 1, 0, 0.8235294, 1,
1.153789, -0.2104838, 1.505756, 1, 0, 0.8156863, 1,
1.154971, 0.6795458, 0.7505702, 1, 0, 0.8117647, 1,
1.161771, -0.4549773, 0.8560764, 1, 0, 0.8039216, 1,
1.161825, 0.3945821, 1.622925, 1, 0, 0.7960784, 1,
1.162946, -2.066573, 3.047089, 1, 0, 0.7921569, 1,
1.16469, 0.6291112, 1.609119, 1, 0, 0.7843137, 1,
1.168359, -0.5611537, 0.7994524, 1, 0, 0.7803922, 1,
1.168469, -0.6503015, 3.00806, 1, 0, 0.772549, 1,
1.172185, 0.007135871, 1.387113, 1, 0, 0.7686275, 1,
1.191016, -0.7392091, 2.375333, 1, 0, 0.7607843, 1,
1.192852, -0.4041796, 3.360145, 1, 0, 0.7568628, 1,
1.201883, -0.7468766, 2.80817, 1, 0, 0.7490196, 1,
1.204908, -0.6059148, 1.56857, 1, 0, 0.7450981, 1,
1.211097, -0.2042756, 1.306631, 1, 0, 0.7372549, 1,
1.212186, -1.75531, 2.446695, 1, 0, 0.7333333, 1,
1.2277, -0.5703747, 2.083766, 1, 0, 0.7254902, 1,
1.228402, -2.169856, 2.659749, 1, 0, 0.7215686, 1,
1.23294, -0.9262711, 4.009355, 1, 0, 0.7137255, 1,
1.239709, -0.04890304, 0.5027402, 1, 0, 0.7098039, 1,
1.240816, 0.3061556, 1.203079, 1, 0, 0.7019608, 1,
1.260481, -0.6431118, 1.875121, 1, 0, 0.6941177, 1,
1.264465, 0.146419, 1.476193, 1, 0, 0.6901961, 1,
1.270668, 0.5895137, 0.3889469, 1, 0, 0.682353, 1,
1.276041, 0.7498307, 0.3709102, 1, 0, 0.6784314, 1,
1.291293, -1.498961, 1.720881, 1, 0, 0.6705883, 1,
1.294602, -1.250915, 2.214968, 1, 0, 0.6666667, 1,
1.294643, -1.181915, 2.558445, 1, 0, 0.6588235, 1,
1.295185, -1.08832, 1.526345, 1, 0, 0.654902, 1,
1.295747, -0.5697801, 3.441221, 1, 0, 0.6470588, 1,
1.297718, 0.9067697, 1.188987, 1, 0, 0.6431373, 1,
1.315644, -0.4903495, 0.3109555, 1, 0, 0.6352941, 1,
1.317639, -0.1337301, 1.69885, 1, 0, 0.6313726, 1,
1.317723, -0.001643248, 2.025513, 1, 0, 0.6235294, 1,
1.319957, -0.5475916, 2.104702, 1, 0, 0.6196079, 1,
1.320325, -1.467896, 3.273992, 1, 0, 0.6117647, 1,
1.320915, 0.4643139, 2.284158, 1, 0, 0.6078432, 1,
1.32127, -0.4001029, 1.768307, 1, 0, 0.6, 1,
1.322277, 0.5272046, 3.685171, 1, 0, 0.5921569, 1,
1.331012, -1.473716, 2.434349, 1, 0, 0.5882353, 1,
1.33555, -1.715998, 2.592649, 1, 0, 0.5803922, 1,
1.337201, 2.119847, 0.4017181, 1, 0, 0.5764706, 1,
1.343326, -1.004501, 2.334391, 1, 0, 0.5686275, 1,
1.345995, 0.9811236, -0.1567085, 1, 0, 0.5647059, 1,
1.346644, 0.2490207, 1.521683, 1, 0, 0.5568628, 1,
1.347812, -1.57352, 4.03139, 1, 0, 0.5529412, 1,
1.350105, 0.7157941, 0.8143831, 1, 0, 0.5450981, 1,
1.35688, 0.9872336, 0.6968225, 1, 0, 0.5411765, 1,
1.362482, 0.05387925, 0.9539615, 1, 0, 0.5333334, 1,
1.368197, -1.105397, 1.166879, 1, 0, 0.5294118, 1,
1.374614, -0.2651521, 1.589016, 1, 0, 0.5215687, 1,
1.377026, 1.855193, 1.419624, 1, 0, 0.5176471, 1,
1.385236, -0.2959108, 1.12322, 1, 0, 0.509804, 1,
1.395485, -0.7828938, 2.043298, 1, 0, 0.5058824, 1,
1.405804, 1.249425, -0.6160106, 1, 0, 0.4980392, 1,
1.417186, 1.157609, 0.2793443, 1, 0, 0.4901961, 1,
1.429548, -1.59015, 1.924864, 1, 0, 0.4862745, 1,
1.431086, -0.5360247, 1.98147, 1, 0, 0.4784314, 1,
1.431153, -0.553302, 0.9291977, 1, 0, 0.4745098, 1,
1.432054, -1.513638, 2.686085, 1, 0, 0.4666667, 1,
1.435562, 0.05698679, 0.347393, 1, 0, 0.4627451, 1,
1.461532, 1.119493, 1.689823, 1, 0, 0.454902, 1,
1.468606, 0.4874271, 0.9414926, 1, 0, 0.4509804, 1,
1.471956, 1.304295, 1.162798, 1, 0, 0.4431373, 1,
1.479356, -0.1976265, 4.255327, 1, 0, 0.4392157, 1,
1.479519, -0.1346403, 2.172183, 1, 0, 0.4313726, 1,
1.480927, 2.758495, -0.4279647, 1, 0, 0.427451, 1,
1.482705, 0.1633791, 1.199707, 1, 0, 0.4196078, 1,
1.484974, 0.1401084, -0.6893554, 1, 0, 0.4156863, 1,
1.49474, 0.3940918, 1.717797, 1, 0, 0.4078431, 1,
1.496868, 0.8886278, 0.7793998, 1, 0, 0.4039216, 1,
1.513705, -1.102417, 3.201406, 1, 0, 0.3960784, 1,
1.514875, -1.236559, 0.6086949, 1, 0, 0.3882353, 1,
1.516088, -0.03466314, 2.133339, 1, 0, 0.3843137, 1,
1.526149, -0.2309219, -0.2954564, 1, 0, 0.3764706, 1,
1.532372, -1.90715, 2.242326, 1, 0, 0.372549, 1,
1.542336, 0.2394303, 1.475267, 1, 0, 0.3647059, 1,
1.546654, 0.3323258, -0.1886948, 1, 0, 0.3607843, 1,
1.548395, -1.675458, 3.020553, 1, 0, 0.3529412, 1,
1.554197, 0.3508052, 1.257088, 1, 0, 0.3490196, 1,
1.557881, -0.806543, 2.54173, 1, 0, 0.3411765, 1,
1.561911, -1.150385, 1.749673, 1, 0, 0.3372549, 1,
1.578271, 0.8241165, 0.2188333, 1, 0, 0.3294118, 1,
1.583082, 0.1793768, 1.209752, 1, 0, 0.3254902, 1,
1.588546, 0.5967831, 0.7400648, 1, 0, 0.3176471, 1,
1.588674, -0.4931606, 1.568242, 1, 0, 0.3137255, 1,
1.598363, 0.9678034, -1.500365, 1, 0, 0.3058824, 1,
1.601748, -1.402294, 1.748211, 1, 0, 0.2980392, 1,
1.605384, 0.9570646, 0.9885261, 1, 0, 0.2941177, 1,
1.617063, -1.163737, 2.95713, 1, 0, 0.2862745, 1,
1.618005, 1.456449, 0.559301, 1, 0, 0.282353, 1,
1.625835, 1.342202, 2.027654, 1, 0, 0.2745098, 1,
1.647513, 0.449511, 2.915475, 1, 0, 0.2705882, 1,
1.650047, 1.697123, 1.66458, 1, 0, 0.2627451, 1,
1.651339, 0.08250176, 2.424352, 1, 0, 0.2588235, 1,
1.677611, -0.9473379, 2.683359, 1, 0, 0.2509804, 1,
1.678006, 0.3230871, 1.199732, 1, 0, 0.2470588, 1,
1.695911, -0.08713096, 0.01098803, 1, 0, 0.2392157, 1,
1.702131, 1.056283, 0.939257, 1, 0, 0.2352941, 1,
1.749819, 0.7823046, 2.311401, 1, 0, 0.227451, 1,
1.757225, -1.98764, 2.196579, 1, 0, 0.2235294, 1,
1.766646, 1.028412, 2.106756, 1, 0, 0.2156863, 1,
1.768951, 0.9506361, 0.4342802, 1, 0, 0.2117647, 1,
1.771889, 1.079922, 1.060612, 1, 0, 0.2039216, 1,
1.778796, -1.248676, 2.88617, 1, 0, 0.1960784, 1,
1.797118, -0.9960167, 3.057261, 1, 0, 0.1921569, 1,
1.797516, -1.975395, 2.189317, 1, 0, 0.1843137, 1,
1.819772, 1.03944, 2.135975, 1, 0, 0.1803922, 1,
1.843086, 1.617552, -0.3147316, 1, 0, 0.172549, 1,
1.850319, -0.128529, 0.8526346, 1, 0, 0.1686275, 1,
1.860052, 1.061551, -0.6020172, 1, 0, 0.1607843, 1,
1.868795, 1.953251, 1.404071, 1, 0, 0.1568628, 1,
1.908183, 2.556841, 1.551702, 1, 0, 0.1490196, 1,
1.919286, -0.4030559, 2.91734, 1, 0, 0.145098, 1,
1.93426, -0.8517699, 0.8445819, 1, 0, 0.1372549, 1,
1.948748, -0.4446015, 4.206166, 1, 0, 0.1333333, 1,
2.00938, -1.187094, 1.955752, 1, 0, 0.1254902, 1,
2.042995, 0.8378265, 2.465949, 1, 0, 0.1215686, 1,
2.054393, -1.955289, 1.821288, 1, 0, 0.1137255, 1,
2.055743, -0.00808643, 2.023125, 1, 0, 0.1098039, 1,
2.064663, -0.1559638, 1.643367, 1, 0, 0.1019608, 1,
2.070745, -0.4767085, 1.652759, 1, 0, 0.09411765, 1,
2.072245, 0.3569129, 1.235837, 1, 0, 0.09019608, 1,
2.08128, -0.1217844, 2.698897, 1, 0, 0.08235294, 1,
2.126241, 1.371229, -0.2319209, 1, 0, 0.07843138, 1,
2.31295, 0.6611222, 1.455869, 1, 0, 0.07058824, 1,
2.400718, 1.701205, 0.540753, 1, 0, 0.06666667, 1,
2.40949, 0.574558, 1.052259, 1, 0, 0.05882353, 1,
2.43881, 0.8460447, 0.4449557, 1, 0, 0.05490196, 1,
2.488318, 0.7481269, 1.943057, 1, 0, 0.04705882, 1,
2.523925, 0.9315872, 2.107573, 1, 0, 0.04313726, 1,
2.560828, -0.830262, 2.760502, 1, 0, 0.03529412, 1,
2.638974, 0.960825, 1.805166, 1, 0, 0.03137255, 1,
2.765065, -0.8927615, 0.8177938, 1, 0, 0.02352941, 1,
2.786733, 1.043595, 0.2603605, 1, 0, 0.01960784, 1,
2.807557, -0.2652713, 0.5772704, 1, 0, 0.01176471, 1,
2.951507, 1.142113, 1.477789, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.05361164, -3.713221, -6.881866, 0, -0.5, 0.5, 0.5,
0.05361164, -3.713221, -6.881866, 1, -0.5, 0.5, 0.5,
0.05361164, -3.713221, -6.881866, 1, 1.5, 0.5, 0.5,
0.05361164, -3.713221, -6.881866, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.82667, 0.01112914, -6.881866, 0, -0.5, 0.5, 0.5,
-3.82667, 0.01112914, -6.881866, 1, -0.5, 0.5, 0.5,
-3.82667, 0.01112914, -6.881866, 1, 1.5, 0.5, 0.5,
-3.82667, 0.01112914, -6.881866, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.82667, -3.713221, 0.4214983, 0, -0.5, 0.5, 0.5,
-3.82667, -3.713221, 0.4214983, 1, -0.5, 0.5, 0.5,
-3.82667, -3.713221, 0.4214983, 1, 1.5, 0.5, 0.5,
-3.82667, -3.713221, 0.4214983, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -2.853756, -5.196474,
2, -2.853756, -5.196474,
-2, -2.853756, -5.196474,
-2, -2.997, -5.477373,
-1, -2.853756, -5.196474,
-1, -2.997, -5.477373,
0, -2.853756, -5.196474,
0, -2.997, -5.477373,
1, -2.853756, -5.196474,
1, -2.997, -5.477373,
2, -2.853756, -5.196474,
2, -2.997, -5.477373
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.283489, -6.03917, 0, -0.5, 0.5, 0.5,
-2, -3.283489, -6.03917, 1, -0.5, 0.5, 0.5,
-2, -3.283489, -6.03917, 1, 1.5, 0.5, 0.5,
-2, -3.283489, -6.03917, 0, 1.5, 0.5, 0.5,
-1, -3.283489, -6.03917, 0, -0.5, 0.5, 0.5,
-1, -3.283489, -6.03917, 1, -0.5, 0.5, 0.5,
-1, -3.283489, -6.03917, 1, 1.5, 0.5, 0.5,
-1, -3.283489, -6.03917, 0, 1.5, 0.5, 0.5,
0, -3.283489, -6.03917, 0, -0.5, 0.5, 0.5,
0, -3.283489, -6.03917, 1, -0.5, 0.5, 0.5,
0, -3.283489, -6.03917, 1, 1.5, 0.5, 0.5,
0, -3.283489, -6.03917, 0, 1.5, 0.5, 0.5,
1, -3.283489, -6.03917, 0, -0.5, 0.5, 0.5,
1, -3.283489, -6.03917, 1, -0.5, 0.5, 0.5,
1, -3.283489, -6.03917, 1, 1.5, 0.5, 0.5,
1, -3.283489, -6.03917, 0, 1.5, 0.5, 0.5,
2, -3.283489, -6.03917, 0, -0.5, 0.5, 0.5,
2, -3.283489, -6.03917, 1, -0.5, 0.5, 0.5,
2, -3.283489, -6.03917, 1, 1.5, 0.5, 0.5,
2, -3.283489, -6.03917, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-2.931221, -2, -5.196474,
-2.931221, 2, -5.196474,
-2.931221, -2, -5.196474,
-3.080462, -2, -5.477373,
-2.931221, -1, -5.196474,
-3.080462, -1, -5.477373,
-2.931221, 0, -5.196474,
-3.080462, 0, -5.477373,
-2.931221, 1, -5.196474,
-3.080462, 1, -5.477373,
-2.931221, 2, -5.196474,
-3.080462, 2, -5.477373
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.378946, -2, -6.03917, 0, -0.5, 0.5, 0.5,
-3.378946, -2, -6.03917, 1, -0.5, 0.5, 0.5,
-3.378946, -2, -6.03917, 1, 1.5, 0.5, 0.5,
-3.378946, -2, -6.03917, 0, 1.5, 0.5, 0.5,
-3.378946, -1, -6.03917, 0, -0.5, 0.5, 0.5,
-3.378946, -1, -6.03917, 1, -0.5, 0.5, 0.5,
-3.378946, -1, -6.03917, 1, 1.5, 0.5, 0.5,
-3.378946, -1, -6.03917, 0, 1.5, 0.5, 0.5,
-3.378946, 0, -6.03917, 0, -0.5, 0.5, 0.5,
-3.378946, 0, -6.03917, 1, -0.5, 0.5, 0.5,
-3.378946, 0, -6.03917, 1, 1.5, 0.5, 0.5,
-3.378946, 0, -6.03917, 0, 1.5, 0.5, 0.5,
-3.378946, 1, -6.03917, 0, -0.5, 0.5, 0.5,
-3.378946, 1, -6.03917, 1, -0.5, 0.5, 0.5,
-3.378946, 1, -6.03917, 1, 1.5, 0.5, 0.5,
-3.378946, 1, -6.03917, 0, 1.5, 0.5, 0.5,
-3.378946, 2, -6.03917, 0, -0.5, 0.5, 0.5,
-3.378946, 2, -6.03917, 1, -0.5, 0.5, 0.5,
-3.378946, 2, -6.03917, 1, 1.5, 0.5, 0.5,
-3.378946, 2, -6.03917, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-2.931221, -2.853756, -4,
-2.931221, -2.853756, 4,
-2.931221, -2.853756, -4,
-3.080462, -2.997, -4,
-2.931221, -2.853756, -2,
-3.080462, -2.997, -2,
-2.931221, -2.853756, 0,
-3.080462, -2.997, 0,
-2.931221, -2.853756, 2,
-3.080462, -2.997, 2,
-2.931221, -2.853756, 4,
-3.080462, -2.997, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.378946, -3.283489, -4, 0, -0.5, 0.5, 0.5,
-3.378946, -3.283489, -4, 1, -0.5, 0.5, 0.5,
-3.378946, -3.283489, -4, 1, 1.5, 0.5, 0.5,
-3.378946, -3.283489, -4, 0, 1.5, 0.5, 0.5,
-3.378946, -3.283489, -2, 0, -0.5, 0.5, 0.5,
-3.378946, -3.283489, -2, 1, -0.5, 0.5, 0.5,
-3.378946, -3.283489, -2, 1, 1.5, 0.5, 0.5,
-3.378946, -3.283489, -2, 0, 1.5, 0.5, 0.5,
-3.378946, -3.283489, 0, 0, -0.5, 0.5, 0.5,
-3.378946, -3.283489, 0, 1, -0.5, 0.5, 0.5,
-3.378946, -3.283489, 0, 1, 1.5, 0.5, 0.5,
-3.378946, -3.283489, 0, 0, 1.5, 0.5, 0.5,
-3.378946, -3.283489, 2, 0, -0.5, 0.5, 0.5,
-3.378946, -3.283489, 2, 1, -0.5, 0.5, 0.5,
-3.378946, -3.283489, 2, 1, 1.5, 0.5, 0.5,
-3.378946, -3.283489, 2, 0, 1.5, 0.5, 0.5,
-3.378946, -3.283489, 4, 0, -0.5, 0.5, 0.5,
-3.378946, -3.283489, 4, 1, -0.5, 0.5, 0.5,
-3.378946, -3.283489, 4, 1, 1.5, 0.5, 0.5,
-3.378946, -3.283489, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-2.931221, -2.853756, -5.196474,
-2.931221, 2.876014, -5.196474,
-2.931221, -2.853756, 6.039471,
-2.931221, 2.876014, 6.039471,
-2.931221, -2.853756, -5.196474,
-2.931221, -2.853756, 6.039471,
-2.931221, 2.876014, -5.196474,
-2.931221, 2.876014, 6.039471,
-2.931221, -2.853756, -5.196474,
3.038444, -2.853756, -5.196474,
-2.931221, -2.853756, 6.039471,
3.038444, -2.853756, 6.039471,
-2.931221, 2.876014, -5.196474,
3.038444, 2.876014, -5.196474,
-2.931221, 2.876014, 6.039471,
3.038444, 2.876014, 6.039471,
3.038444, -2.853756, -5.196474,
3.038444, 2.876014, -5.196474,
3.038444, -2.853756, 6.039471,
3.038444, 2.876014, 6.039471,
3.038444, -2.853756, -5.196474,
3.038444, -2.853756, 6.039471,
3.038444, 2.876014, -5.196474,
3.038444, 2.876014, 6.039471
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.451155;
var distance = 33.15104;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.05361164, -0.01112914, -0.4214983 );
mvMatrix.scale( 1.349546, 1.406049, 0.7170145 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.15104);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
fluxofenim<-read.table("fluxofenim.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluxofenim$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluxofenim' not found
```

```r
y<-fluxofenim$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluxofenim' not found
```

```r
z<-fluxofenim$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluxofenim' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.844284, 1.202139, -0.7739942, 0, 0, 1, 1, 1,
-2.699185, -0.9541876, -1.940451, 1, 0, 0, 1, 1,
-2.564451, 0.00284968, -0.6806361, 1, 0, 0, 1, 1,
-2.547551, 0.5561768, -1.24524, 1, 0, 0, 1, 1,
-2.534266, 0.2456591, -1.792163, 1, 0, 0, 1, 1,
-2.523757, 0.01656082, -2.029203, 1, 0, 0, 1, 1,
-2.483924, -0.4979473, -1.111762, 0, 0, 0, 1, 1,
-2.444372, 0.4290477, -2.394284, 0, 0, 0, 1, 1,
-2.433326, -0.2628681, -2.472387, 0, 0, 0, 1, 1,
-2.361835, -0.1512335, -1.622085, 0, 0, 0, 1, 1,
-2.329383, -0.5837588, -2.773269, 0, 0, 0, 1, 1,
-2.327357, 0.6202131, -0.4163777, 0, 0, 0, 1, 1,
-2.297621, 0.6521229, -2.381254, 0, 0, 0, 1, 1,
-2.256854, 1.219959, -0.4836884, 1, 1, 1, 1, 1,
-2.240514, -0.7920878, -2.520967, 1, 1, 1, 1, 1,
-2.231421, -0.4318932, -0.018166, 1, 1, 1, 1, 1,
-2.225162, 0.08526076, -1.028113, 1, 1, 1, 1, 1,
-2.212597, 0.03931705, -1.498862, 1, 1, 1, 1, 1,
-2.181425, -0.3048694, -2.152075, 1, 1, 1, 1, 1,
-2.176964, -0.5131656, -2.140326, 1, 1, 1, 1, 1,
-2.163995, -1.605062, -1.092048, 1, 1, 1, 1, 1,
-2.155984, 1.009343, -1.79951, 1, 1, 1, 1, 1,
-2.140355, -0.1831832, -1.388618, 1, 1, 1, 1, 1,
-2.081976, -1.179747, 0.7933082, 1, 1, 1, 1, 1,
-2.074042, 1.389281, -2.373889, 1, 1, 1, 1, 1,
-2.069968, 0.9593818, -0.2362258, 1, 1, 1, 1, 1,
-2.067161, -0.6322591, -2.041012, 1, 1, 1, 1, 1,
-2.033988, 0.5422208, -2.196598, 1, 1, 1, 1, 1,
-2.028095, -1.621379, -0.3669652, 0, 0, 1, 1, 1,
-2.026493, -0.9269661, -2.998189, 1, 0, 0, 1, 1,
-2.012314, 1.172159, 0.343463, 1, 0, 0, 1, 1,
-2.004709, -0.9652037, -3.653907, 1, 0, 0, 1, 1,
-1.979338, -1.160728, -3.274811, 1, 0, 0, 1, 1,
-1.971618, -0.1576938, -1.832526, 1, 0, 0, 1, 1,
-1.954421, 0.2913481, -2.482906, 0, 0, 0, 1, 1,
-1.94747, -0.4428972, -3.621815, 0, 0, 0, 1, 1,
-1.8992, 0.4620166, -2.567251, 0, 0, 0, 1, 1,
-1.878262, 0.9316573, -0.7528193, 0, 0, 0, 1, 1,
-1.861971, -0.4571667, -1.303742, 0, 0, 0, 1, 1,
-1.855597, 0.8868794, -1.116105, 0, 0, 0, 1, 1,
-1.836185, -0.0633683, -1.359259, 0, 0, 0, 1, 1,
-1.82172, 0.6951763, -2.189895, 1, 1, 1, 1, 1,
-1.820904, 1.025078, -0.2893701, 1, 1, 1, 1, 1,
-1.806985, -1.755189, -0.5000659, 1, 1, 1, 1, 1,
-1.788645, 0.2415925, -2.446612, 1, 1, 1, 1, 1,
-1.779542, 0.7341464, -1.916945, 1, 1, 1, 1, 1,
-1.761803, -0.790763, -1.842561, 1, 1, 1, 1, 1,
-1.755063, -1.042099, -2.290505, 1, 1, 1, 1, 1,
-1.751594, -1.334318, -2.695215, 1, 1, 1, 1, 1,
-1.745905, 1.479294, -0.705907, 1, 1, 1, 1, 1,
-1.734524, 1.070892, -0.1217549, 1, 1, 1, 1, 1,
-1.687551, 1.128839, -1.840266, 1, 1, 1, 1, 1,
-1.663434, 0.3443076, 0.9971251, 1, 1, 1, 1, 1,
-1.657898, -1.343068, -3.309113, 1, 1, 1, 1, 1,
-1.650313, 0.180547, -0.07577963, 1, 1, 1, 1, 1,
-1.633032, -0.09354885, -2.023159, 1, 1, 1, 1, 1,
-1.632478, -1.718467, -2.889401, 0, 0, 1, 1, 1,
-1.625402, -0.4719962, -1.154376, 1, 0, 0, 1, 1,
-1.624446, -0.6024755, -1.459814, 1, 0, 0, 1, 1,
-1.613474, -1.075698, -1.536905, 1, 0, 0, 1, 1,
-1.583028, 1.146855, -1.062953, 1, 0, 0, 1, 1,
-1.580669, -0.891046, -1.218297, 1, 0, 0, 1, 1,
-1.579715, 1.752528, 0.4212632, 0, 0, 0, 1, 1,
-1.566033, -0.5423478, -2.628833, 0, 0, 0, 1, 1,
-1.565845, 0.3254621, -1.792663, 0, 0, 0, 1, 1,
-1.559423, -0.4484438, -2.104064, 0, 0, 0, 1, 1,
-1.555259, -1.268002, -2.816765, 0, 0, 0, 1, 1,
-1.552277, -1.110018, -1.053328, 0, 0, 0, 1, 1,
-1.550915, 0.6831251, -0.8801486, 0, 0, 0, 1, 1,
-1.549715, 0.13537, -0.6636676, 1, 1, 1, 1, 1,
-1.549545, -1.647836, -2.104188, 1, 1, 1, 1, 1,
-1.538677, -1.595184, -1.852283, 1, 1, 1, 1, 1,
-1.537924, -0.770934, -0.727585, 1, 1, 1, 1, 1,
-1.534322, -1.449671, -3.095489, 1, 1, 1, 1, 1,
-1.530513, 0.03113016, -1.630161, 1, 1, 1, 1, 1,
-1.525562, -0.02837539, -2.38383, 1, 1, 1, 1, 1,
-1.508919, -1.12859, -1.489176, 1, 1, 1, 1, 1,
-1.50248, -0.08774266, -1.310669, 1, 1, 1, 1, 1,
-1.498191, -1.093523, 0.4970028, 1, 1, 1, 1, 1,
-1.4898, 0.2697358, -2.323112, 1, 1, 1, 1, 1,
-1.476683, 0.163008, -1.957346, 1, 1, 1, 1, 1,
-1.476197, -0.09384067, -2.49494, 1, 1, 1, 1, 1,
-1.470448, 1.706809, -0.6138654, 1, 1, 1, 1, 1,
-1.467823, -1.882379, -1.832522, 1, 1, 1, 1, 1,
-1.464556, 1.570249, -0.04107597, 0, 0, 1, 1, 1,
-1.46407, 0.2363179, -2.652889, 1, 0, 0, 1, 1,
-1.445971, 0.3655944, -3.11169, 1, 0, 0, 1, 1,
-1.423835, -0.02330294, -1.855693, 1, 0, 0, 1, 1,
-1.417831, 0.4691496, -1.466786, 1, 0, 0, 1, 1,
-1.416303, 0.3113856, -1.788363, 1, 0, 0, 1, 1,
-1.403502, 0.2740111, -1.844665, 0, 0, 0, 1, 1,
-1.397862, -0.06896356, -2.920632, 0, 0, 0, 1, 1,
-1.392061, -0.1176271, -2.153143, 0, 0, 0, 1, 1,
-1.390306, -1.591089, -1.336353, 0, 0, 0, 1, 1,
-1.38713, -0.9948994, -3.127873, 0, 0, 0, 1, 1,
-1.375961, 0.139769, -1.65349, 0, 0, 0, 1, 1,
-1.374767, 0.4613069, -2.078552, 0, 0, 0, 1, 1,
-1.373347, 0.1700773, -3.339936, 1, 1, 1, 1, 1,
-1.367807, -0.07910519, -3.437246, 1, 1, 1, 1, 1,
-1.36694, 0.9693428, -1.647423, 1, 1, 1, 1, 1,
-1.362161, -0.9535785, -3.454414, 1, 1, 1, 1, 1,
-1.344501, 0.638711, -0.9453457, 1, 1, 1, 1, 1,
-1.340486, 0.5595137, -1.041703, 1, 1, 1, 1, 1,
-1.336372, 0.4669465, -1.286771, 1, 1, 1, 1, 1,
-1.331402, -0.3651821, -3.295388, 1, 1, 1, 1, 1,
-1.317349, -0.06225683, -1.287377, 1, 1, 1, 1, 1,
-1.312844, 0.3672439, -0.5425407, 1, 1, 1, 1, 1,
-1.30478, -0.8211289, -3.176284, 1, 1, 1, 1, 1,
-1.283769, -0.9430755, -0.1794574, 1, 1, 1, 1, 1,
-1.282551, -0.3429551, -1.663156, 1, 1, 1, 1, 1,
-1.268871, -0.05054097, -2.474428, 1, 1, 1, 1, 1,
-1.256387, 1.292152, -1.447762, 1, 1, 1, 1, 1,
-1.252218, 0.4730098, -0.2314342, 0, 0, 1, 1, 1,
-1.248307, 0.04552512, -2.075382, 1, 0, 0, 1, 1,
-1.242469, 0.9766266, -0.5475037, 1, 0, 0, 1, 1,
-1.238676, 0.3151586, -2.799597, 1, 0, 0, 1, 1,
-1.238119, 0.2748548, 0.5893028, 1, 0, 0, 1, 1,
-1.230281, 0.195067, -1.40361, 1, 0, 0, 1, 1,
-1.227599, -0.4168303, -1.299345, 0, 0, 0, 1, 1,
-1.219362, -0.8446319, -1.91828, 0, 0, 0, 1, 1,
-1.215223, -0.8543572, -0.2465845, 0, 0, 0, 1, 1,
-1.194505, 0.3862522, -4.851122, 0, 0, 0, 1, 1,
-1.189708, -0.299913, -0.9275377, 0, 0, 0, 1, 1,
-1.188959, 1.275456, -0.9356484, 0, 0, 0, 1, 1,
-1.188678, -0.7898777, -1.602603, 0, 0, 0, 1, 1,
-1.184029, 0.5972275, -2.053616, 1, 1, 1, 1, 1,
-1.18294, -1.176403, -1.989604, 1, 1, 1, 1, 1,
-1.181487, 1.162905, -0.9575185, 1, 1, 1, 1, 1,
-1.178948, -0.2770304, -0.04623688, 1, 1, 1, 1, 1,
-1.177623, -0.158558, 0.5728883, 1, 1, 1, 1, 1,
-1.175565, -0.4412071, -2.401846, 1, 1, 1, 1, 1,
-1.170475, -0.05405663, -3.182104, 1, 1, 1, 1, 1,
-1.170407, 0.6244037, 0.7654524, 1, 1, 1, 1, 1,
-1.166009, 0.1158655, -0.4200181, 1, 1, 1, 1, 1,
-1.156781, -1.046472, -1.72367, 1, 1, 1, 1, 1,
-1.153081, 1.160419, 0.3473462, 1, 1, 1, 1, 1,
-1.146491, -0.48386, -3.340024, 1, 1, 1, 1, 1,
-1.126898, -0.9090549, -2.40635, 1, 1, 1, 1, 1,
-1.115713, -1.416635, -2.783576, 1, 1, 1, 1, 1,
-1.106738, 1.153255, 1.455911, 1, 1, 1, 1, 1,
-1.105816, -0.234277, -3.503077, 0, 0, 1, 1, 1,
-1.098687, 0.2783946, -1.734223, 1, 0, 0, 1, 1,
-1.088613, 0.5945695, -1.587411, 1, 0, 0, 1, 1,
-1.087008, 0.1067262, -2.037521, 1, 0, 0, 1, 1,
-1.082252, -0.4270486, -2.327549, 1, 0, 0, 1, 1,
-1.07709, 1.994714, -0.2748318, 1, 0, 0, 1, 1,
-1.064377, 0.1834393, -0.636111, 0, 0, 0, 1, 1,
-1.059855, 0.6815127, -0.7958333, 0, 0, 0, 1, 1,
-1.055664, -0.005686824, -2.11723, 0, 0, 0, 1, 1,
-1.043313, 0.6208042, -0.8001292, 0, 0, 0, 1, 1,
-1.043224, 1.36793, -0.5767382, 0, 0, 0, 1, 1,
-1.038645, -0.9848409, -1.567397, 0, 0, 0, 1, 1,
-1.03761, 1.026841, -0.3033371, 0, 0, 0, 1, 1,
-1.034428, 1.589927, 1.942665, 1, 1, 1, 1, 1,
-1.026763, 0.1634442, -1.846135, 1, 1, 1, 1, 1,
-1.024652, 1.197051, 0.1444833, 1, 1, 1, 1, 1,
-1.022851, 1.749999, -0.5321653, 1, 1, 1, 1, 1,
-1.010177, -1.642696, -1.647804, 1, 1, 1, 1, 1,
-0.9926622, 1.276837, -0.1324686, 1, 1, 1, 1, 1,
-0.9920483, -0.6540396, -1.033809, 1, 1, 1, 1, 1,
-0.9916937, 1.589039, 1.2149, 1, 1, 1, 1, 1,
-0.9891205, 0.3563761, 0.9668734, 1, 1, 1, 1, 1,
-0.9867723, 0.9695932, -0.573747, 1, 1, 1, 1, 1,
-0.9837658, -1.126724, -3.49029, 1, 1, 1, 1, 1,
-0.9805591, 0.1402142, -0.8503063, 1, 1, 1, 1, 1,
-0.9794433, 0.8859934, -1.633325, 1, 1, 1, 1, 1,
-0.9778949, -1.706228, -2.634016, 1, 1, 1, 1, 1,
-0.9778524, 1.428728, 0.2612781, 1, 1, 1, 1, 1,
-0.9761719, 1.173579, -1.974034, 0, 0, 1, 1, 1,
-0.9603627, 0.4181263, -0.8673561, 1, 0, 0, 1, 1,
-0.9578895, 0.2833647, -2.989632, 1, 0, 0, 1, 1,
-0.953307, 0.705467, -0.1664564, 1, 0, 0, 1, 1,
-0.9516956, 2.301831, -1.008555, 1, 0, 0, 1, 1,
-0.9512074, -0.1824722, -1.609954, 1, 0, 0, 1, 1,
-0.9501261, 0.05472975, -2.025703, 0, 0, 0, 1, 1,
-0.9457039, -1.440932, -1.088275, 0, 0, 0, 1, 1,
-0.9446669, 0.341453, -2.851158, 0, 0, 0, 1, 1,
-0.9434935, 0.348803, -1.474115, 0, 0, 0, 1, 1,
-0.9373093, -0.9775621, -2.342065, 0, 0, 0, 1, 1,
-0.9321216, -0.4152388, -1.917715, 0, 0, 0, 1, 1,
-0.9318009, -0.4758644, -2.969349, 0, 0, 0, 1, 1,
-0.92897, 0.36305, -0.3556069, 1, 1, 1, 1, 1,
-0.9289626, -1.133685, -2.693581, 1, 1, 1, 1, 1,
-0.9284316, -0.6036925, -2.181061, 1, 1, 1, 1, 1,
-0.9283997, -0.8662125, -2.309372, 1, 1, 1, 1, 1,
-0.9276545, 1.064304, 1.45525, 1, 1, 1, 1, 1,
-0.9274713, 0.2490923, -1.994606, 1, 1, 1, 1, 1,
-0.925536, 0.5067973, -3.013264, 1, 1, 1, 1, 1,
-0.9193859, 0.692216, -0.9220208, 1, 1, 1, 1, 1,
-0.9192286, 0.9755241, -2.478055, 1, 1, 1, 1, 1,
-0.9141626, 0.8547541, -1.125016, 1, 1, 1, 1, 1,
-0.9138635, 0.6221242, -1.212117, 1, 1, 1, 1, 1,
-0.9074045, -0.6385649, -3.586188, 1, 1, 1, 1, 1,
-0.9062068, -0.2428553, -1.51993, 1, 1, 1, 1, 1,
-0.9009791, 0.2668705, -0.871541, 1, 1, 1, 1, 1,
-0.8957468, 0.3241413, -1.068481, 1, 1, 1, 1, 1,
-0.8953571, 0.1108093, -1.408918, 0, 0, 1, 1, 1,
-0.8925514, 0.6890339, -2.272347, 1, 0, 0, 1, 1,
-0.8895267, -0.5128863, -0.512762, 1, 0, 0, 1, 1,
-0.8889605, 0.8874849, -2.684586, 1, 0, 0, 1, 1,
-0.8869411, 0.008096305, -1.564155, 1, 0, 0, 1, 1,
-0.8866405, 1.982464, -1.66282, 1, 0, 0, 1, 1,
-0.8863416, -2.156839, -2.335687, 0, 0, 0, 1, 1,
-0.8836136, -0.3262169, -1.251752, 0, 0, 0, 1, 1,
-0.8792288, -0.1405622, -0.3572826, 0, 0, 0, 1, 1,
-0.8790182, -2.336963, -3.772249, 0, 0, 0, 1, 1,
-0.8705209, -0.06105029, -0.7411209, 0, 0, 0, 1, 1,
-0.8629538, 1.593213, -1.458404, 0, 0, 0, 1, 1,
-0.8605236, 0.8326075, -1.230534, 0, 0, 0, 1, 1,
-0.8579658, -0.9161178, -2.530838, 1, 1, 1, 1, 1,
-0.8566741, 0.4356956, 0.1795377, 1, 1, 1, 1, 1,
-0.8546193, -0.3458994, -1.745165, 1, 1, 1, 1, 1,
-0.8489821, -0.3252294, -2.52701, 1, 1, 1, 1, 1,
-0.8486266, -1.077718, -4.562342, 1, 1, 1, 1, 1,
-0.8482045, 1.444683, -0.05836701, 1, 1, 1, 1, 1,
-0.8450488, -0.2770497, -2.715623, 1, 1, 1, 1, 1,
-0.8432854, -1.433947, -3.654356, 1, 1, 1, 1, 1,
-0.8430874, -0.07699639, -2.480733, 1, 1, 1, 1, 1,
-0.83778, 1.470072, -1.680591, 1, 1, 1, 1, 1,
-0.8243096, -0.1218572, -3.067175, 1, 1, 1, 1, 1,
-0.8214937, 0.7120808, -0.5285616, 1, 1, 1, 1, 1,
-0.8150848, -1.490487, -1.433763, 1, 1, 1, 1, 1,
-0.8140495, -1.364771, -3.576996, 1, 1, 1, 1, 1,
-0.8131191, 0.2379374, -2.580785, 1, 1, 1, 1, 1,
-0.8081888, -0.6006735, -0.1052198, 0, 0, 1, 1, 1,
-0.8014244, -1.792898, -2.454856, 1, 0, 0, 1, 1,
-0.7927784, 0.5658289, -0.2385993, 1, 0, 0, 1, 1,
-0.7907522, 0.1268248, -0.3342592, 1, 0, 0, 1, 1,
-0.7817743, 0.9045053, 1.578175, 1, 0, 0, 1, 1,
-0.7780852, -0.3267968, -1.437123, 1, 0, 0, 1, 1,
-0.7745484, -1.97639, -3.376923, 0, 0, 0, 1, 1,
-0.7733257, -1.918609, -3.157459, 0, 0, 0, 1, 1,
-0.7726969, 1.800647, 0.5024565, 0, 0, 0, 1, 1,
-0.7717187, -0.6062543, -2.873691, 0, 0, 0, 1, 1,
-0.7661769, -0.4165508, -2.61078, 0, 0, 0, 1, 1,
-0.7644882, -0.6708454, -1.156923, 0, 0, 0, 1, 1,
-0.7599955, 0.1141954, -1.517322, 0, 0, 0, 1, 1,
-0.7578792, 0.4587236, -1.745109, 1, 1, 1, 1, 1,
-0.75773, -1.767273, -2.410103, 1, 1, 1, 1, 1,
-0.7560073, 0.4618129, -1.066515, 1, 1, 1, 1, 1,
-0.7530716, 0.01472972, -1.446028, 1, 1, 1, 1, 1,
-0.7499777, -0.1951207, -1.232381, 1, 1, 1, 1, 1,
-0.7492079, 1.490114, -1.036631, 1, 1, 1, 1, 1,
-0.7483873, -1.004362, -2.858075, 1, 1, 1, 1, 1,
-0.7428102, -1.202615, -3.497691, 1, 1, 1, 1, 1,
-0.7406569, 1.645571, -0.7143719, 1, 1, 1, 1, 1,
-0.7336095, 0.06116137, -2.606381, 1, 1, 1, 1, 1,
-0.7251365, 0.5898389, 0.1465762, 1, 1, 1, 1, 1,
-0.7227122, -0.1342398, -1.065349, 1, 1, 1, 1, 1,
-0.7131863, 0.1408896, -0.9766765, 1, 1, 1, 1, 1,
-0.7077518, 1.919689, -0.004520637, 1, 1, 1, 1, 1,
-0.7047842, -0.1641086, -0.8247164, 1, 1, 1, 1, 1,
-0.6937994, -2.722011, -2.326011, 0, 0, 1, 1, 1,
-0.6937016, 0.1754588, -1.718368, 1, 0, 0, 1, 1,
-0.6901397, 0.7254723, -0.3059499, 1, 0, 0, 1, 1,
-0.6868703, -2.258995, -2.904876, 1, 0, 0, 1, 1,
-0.6864496, 0.5338021, -1.302987, 1, 0, 0, 1, 1,
-0.6861417, -2.200404, -3.279197, 1, 0, 0, 1, 1,
-0.6855799, 0.6986271, 0.2352139, 0, 0, 0, 1, 1,
-0.6837625, -0.1881415, -1.659116, 0, 0, 0, 1, 1,
-0.6832603, -1.040027, -3.262512, 0, 0, 0, 1, 1,
-0.6830111, -0.7244705, -2.930984, 0, 0, 0, 1, 1,
-0.6808892, -0.8963662, -2.695709, 0, 0, 0, 1, 1,
-0.6802762, -0.8829956, -1.640033, 0, 0, 0, 1, 1,
-0.680057, 0.1335724, -1.501498, 0, 0, 0, 1, 1,
-0.6753487, -1.373569, -2.632813, 1, 1, 1, 1, 1,
-0.6749652, 1.876306, 0.7255122, 1, 1, 1, 1, 1,
-0.6734971, 0.2724891, -0.5593517, 1, 1, 1, 1, 1,
-0.6689748, 0.9825042, -2.504653, 1, 1, 1, 1, 1,
-0.6689293, 0.09894185, 0.1879044, 1, 1, 1, 1, 1,
-0.6676011, -0.4954385, -1.151759, 1, 1, 1, 1, 1,
-0.6651071, 1.289957, 0.5096253, 1, 1, 1, 1, 1,
-0.6640375, 0.668519, -1.304253, 1, 1, 1, 1, 1,
-0.6601274, -0.4329297, -1.849989, 1, 1, 1, 1, 1,
-0.6526316, -0.4493005, -3.156815, 1, 1, 1, 1, 1,
-0.6512101, 0.3403122, -1.540599, 1, 1, 1, 1, 1,
-0.6486639, -1.617017, -2.075301, 1, 1, 1, 1, 1,
-0.6476814, -0.2268448, -2.499262, 1, 1, 1, 1, 1,
-0.6434479, 1.347725, -2.374368, 1, 1, 1, 1, 1,
-0.6433818, -0.5882239, -0.7848242, 1, 1, 1, 1, 1,
-0.6418776, 0.5329054, -1.625723, 0, 0, 1, 1, 1,
-0.6344149, 0.796605, 0.2931315, 1, 0, 0, 1, 1,
-0.6334772, 1.405295, -0.1765379, 1, 0, 0, 1, 1,
-0.6323278, -0.7988958, -3.513554, 1, 0, 0, 1, 1,
-0.6216105, 0.1405176, 0.4757465, 1, 0, 0, 1, 1,
-0.6214094, -1.009735, -3.624532, 1, 0, 0, 1, 1,
-0.6208189, 0.2257747, -2.468548, 0, 0, 0, 1, 1,
-0.6193588, 0.2941703, -1.093744, 0, 0, 0, 1, 1,
-0.6121899, 0.468739, -2.131495, 0, 0, 0, 1, 1,
-0.6065369, 0.1468301, -1.115076, 0, 0, 0, 1, 1,
-0.6004601, -0.5514992, -2.473997, 0, 0, 0, 1, 1,
-0.5957791, -1.331205, -5.032844, 0, 0, 0, 1, 1,
-0.5952784, 1.188611, 0.4913309, 0, 0, 0, 1, 1,
-0.5948799, 1.147101, -1.459604, 1, 1, 1, 1, 1,
-0.5922307, -0.926998, -3.16705, 1, 1, 1, 1, 1,
-0.5918226, -1.938642, -3.596017, 1, 1, 1, 1, 1,
-0.5897387, 2.103967, -2.02524, 1, 1, 1, 1, 1,
-0.5886354, -0.2432195, -3.056448, 1, 1, 1, 1, 1,
-0.5826484, 1.676793, 0.02620961, 1, 1, 1, 1, 1,
-0.5821953, 1.099933, 0.2739601, 1, 1, 1, 1, 1,
-0.5802401, 0.01708991, -2.000783, 1, 1, 1, 1, 1,
-0.5759678, 0.1893021, 0.648169, 1, 1, 1, 1, 1,
-0.5757796, -1.743932, -4.32229, 1, 1, 1, 1, 1,
-0.5716777, 0.5514577, -0.6546692, 1, 1, 1, 1, 1,
-0.5712073, 0.873669, 0.3313774, 1, 1, 1, 1, 1,
-0.5679564, 0.1934019, -2.2014, 1, 1, 1, 1, 1,
-0.5663436, 0.5473202, 0.434233, 1, 1, 1, 1, 1,
-0.5648265, 0.7193996, -1.953858, 1, 1, 1, 1, 1,
-0.5626708, 1.993247, -0.1186715, 0, 0, 1, 1, 1,
-0.5612335, -0.4221335, -2.860559, 1, 0, 0, 1, 1,
-0.5594932, 0.3219971, -1.054196, 1, 0, 0, 1, 1,
-0.5584796, 0.1886717, -2.216692, 1, 0, 0, 1, 1,
-0.5562313, 1.118623, -0.2386328, 1, 0, 0, 1, 1,
-0.5561083, 0.07005785, -0.2927958, 1, 0, 0, 1, 1,
-0.5559077, -0.4178034, -1.98048, 0, 0, 0, 1, 1,
-0.5557057, 0.1199969, -2.947158, 0, 0, 0, 1, 1,
-0.5520438, 0.5208986, -2.307586, 0, 0, 0, 1, 1,
-0.5519578, -0.4882191, -0.787783, 0, 0, 0, 1, 1,
-0.5514923, -0.8924249, -3.58704, 0, 0, 0, 1, 1,
-0.5478163, 0.3644264, -0.939072, 0, 0, 0, 1, 1,
-0.5387726, 0.04353942, -0.4611916, 0, 0, 0, 1, 1,
-0.5383113, 1.663295, 0.518688, 1, 1, 1, 1, 1,
-0.53611, -0.3662971, -0.9858166, 1, 1, 1, 1, 1,
-0.531499, 0.1426964, -0.2425973, 1, 1, 1, 1, 1,
-0.5303272, -0.4034113, -3.250397, 1, 1, 1, 1, 1,
-0.5286649, -0.6202736, -2.075638, 1, 1, 1, 1, 1,
-0.5266172, 0.005359837, -1.709217, 1, 1, 1, 1, 1,
-0.5251104, 1.219175, -0.09858247, 1, 1, 1, 1, 1,
-0.5249425, -0.1328017, -2.282158, 1, 1, 1, 1, 1,
-0.5232222, -0.2171457, -1.528043, 1, 1, 1, 1, 1,
-0.5205973, -0.3661968, -2.471893, 1, 1, 1, 1, 1,
-0.5184916, 1.711374, 0.6157771, 1, 1, 1, 1, 1,
-0.5128625, -1.225295, -3.35647, 1, 1, 1, 1, 1,
-0.5102898, 1.147472, -1.628465, 1, 1, 1, 1, 1,
-0.5071011, -1.017449, -2.941375, 1, 1, 1, 1, 1,
-0.5033909, -0.1138044, -1.285645, 1, 1, 1, 1, 1,
-0.5014593, 0.1388727, -1.671367, 0, 0, 1, 1, 1,
-0.4933427, -1.765364, -1.957531, 1, 0, 0, 1, 1,
-0.4931988, 1.237684, -0.9308492, 1, 0, 0, 1, 1,
-0.4914707, -0.1361702, -0.6247164, 1, 0, 0, 1, 1,
-0.4904098, 0.6282525, -0.9467909, 1, 0, 0, 1, 1,
-0.4855652, 0.8046039, -1.473195, 1, 0, 0, 1, 1,
-0.483469, -0.1490975, -2.429467, 0, 0, 0, 1, 1,
-0.4814912, 0.9184895, 0.1807582, 0, 0, 0, 1, 1,
-0.4812394, -0.03774838, -1.08097, 0, 0, 0, 1, 1,
-0.4812159, -0.5347286, -2.31607, 0, 0, 0, 1, 1,
-0.4810096, 0.3741614, -1.55346, 0, 0, 0, 1, 1,
-0.4777566, 0.6795934, -0.6147709, 0, 0, 0, 1, 1,
-0.4758648, -1.651927, -3.37672, 0, 0, 0, 1, 1,
-0.4616998, 0.653291, 1.191304, 1, 1, 1, 1, 1,
-0.461372, 0.428349, -2.433863, 1, 1, 1, 1, 1,
-0.4582895, -0.1440776, -2.305369, 1, 1, 1, 1, 1,
-0.4556732, 0.8123872, -0.737088, 1, 1, 1, 1, 1,
-0.4546148, -2.138423, -3.053673, 1, 1, 1, 1, 1,
-0.4513497, -2.770313, -2.28847, 1, 1, 1, 1, 1,
-0.4510576, -0.1062006, -1.434266, 1, 1, 1, 1, 1,
-0.4480692, 0.363354, -0.6195077, 1, 1, 1, 1, 1,
-0.4445333, 1.255986, 0.762015, 1, 1, 1, 1, 1,
-0.444329, -0.3276552, -1.699544, 1, 1, 1, 1, 1,
-0.4438741, -0.2152568, -1.893895, 1, 1, 1, 1, 1,
-0.4436198, -1.292191, -3.804221, 1, 1, 1, 1, 1,
-0.4387074, -1.17727, -2.462998, 1, 1, 1, 1, 1,
-0.4333687, -1.507999, -1.738251, 1, 1, 1, 1, 1,
-0.4333607, 1.324792, -0.5391894, 1, 1, 1, 1, 1,
-0.4308356, 1.765704, -0.7036697, 0, 0, 1, 1, 1,
-0.4290397, 1.214234, 1.176463, 1, 0, 0, 1, 1,
-0.4259889, -0.1346595, -3.308167, 1, 0, 0, 1, 1,
-0.4198095, -0.1733445, -2.496383, 1, 0, 0, 1, 1,
-0.4153385, 1.535902, 1.498218, 1, 0, 0, 1, 1,
-0.4090885, -0.5765826, -2.01747, 1, 0, 0, 1, 1,
-0.4070385, -1.099733, -2.926005, 0, 0, 0, 1, 1,
-0.4065831, 0.9222385, -0.9789698, 0, 0, 0, 1, 1,
-0.4053429, -0.3863413, -3.945791, 0, 0, 0, 1, 1,
-0.4049776, 1.623467, -1.294847, 0, 0, 0, 1, 1,
-0.4036098, 0.9327485, -0.2773875, 0, 0, 0, 1, 1,
-0.4026772, 2.164177, -1.009325, 0, 0, 0, 1, 1,
-0.3914935, 0.07692441, -0.8090435, 0, 0, 0, 1, 1,
-0.3903812, -1.322067, -2.569874, 1, 1, 1, 1, 1,
-0.3889683, -1.066046, -1.797228, 1, 1, 1, 1, 1,
-0.3853226, -1.478819, -1.93435, 1, 1, 1, 1, 1,
-0.3834357, -1.606019, -2.825563, 1, 1, 1, 1, 1,
-0.382512, -0.6991694, -3.135626, 1, 1, 1, 1, 1,
-0.3801007, -1.132967, -2.100901, 1, 1, 1, 1, 1,
-0.3757452, 0.9817352, -0.3353012, 1, 1, 1, 1, 1,
-0.369955, -0.6759216, -2.946025, 1, 1, 1, 1, 1,
-0.3699066, -0.394004, -3.269315, 1, 1, 1, 1, 1,
-0.3657639, 1.128592, -2.516488, 1, 1, 1, 1, 1,
-0.3622692, 0.3089699, -0.1867147, 1, 1, 1, 1, 1,
-0.3569571, 0.005963871, -1.243514, 1, 1, 1, 1, 1,
-0.3557166, 0.1381835, -0.0766827, 1, 1, 1, 1, 1,
-0.3557025, -0.5153405, -1.356808, 1, 1, 1, 1, 1,
-0.3548796, -0.2224385, -0.5564139, 1, 1, 1, 1, 1,
-0.3494582, 1.109993, 0.4869832, 0, 0, 1, 1, 1,
-0.3487274, 1.520419, 0.4829771, 1, 0, 0, 1, 1,
-0.3477492, -0.3976099, -2.771249, 1, 0, 0, 1, 1,
-0.3458975, 0.3895855, -0.9632015, 1, 0, 0, 1, 1,
-0.3431499, -1.181, -4.221529, 1, 0, 0, 1, 1,
-0.3396664, -0.1364092, -1.883259, 1, 0, 0, 1, 1,
-0.3368805, -0.07110296, -1.930049, 0, 0, 0, 1, 1,
-0.3296422, 1.821564, -1.754989, 0, 0, 0, 1, 1,
-0.3271561, 0.0307634, -2.436412, 0, 0, 0, 1, 1,
-0.324156, -0.3802207, -2.835427, 0, 0, 0, 1, 1,
-0.3237144, -2.639009, -2.56465, 0, 0, 0, 1, 1,
-0.3204906, 0.43989, -0.1842592, 0, 0, 0, 1, 1,
-0.317723, 0.2048783, 0.07699681, 0, 0, 0, 1, 1,
-0.3168415, 0.1544432, -1.189354, 1, 1, 1, 1, 1,
-0.3168292, 0.8239797, -1.746501, 1, 1, 1, 1, 1,
-0.3151613, 0.4223349, -0.3865321, 1, 1, 1, 1, 1,
-0.3104645, -1.000654, -3.957286, 1, 1, 1, 1, 1,
-0.3071162, -1.02295, -3.690512, 1, 1, 1, 1, 1,
-0.3005976, 0.6445411, -0.1738492, 1, 1, 1, 1, 1,
-0.3003991, 0.1932862, -2.633488, 1, 1, 1, 1, 1,
-0.2976618, -0.2696795, -1.158086, 1, 1, 1, 1, 1,
-0.2947356, -0.9966009, -3.747091, 1, 1, 1, 1, 1,
-0.2931425, 0.2027677, -0.9219085, 1, 1, 1, 1, 1,
-0.2774371, -0.3429707, -1.290175, 1, 1, 1, 1, 1,
-0.273583, -1.200284, -4.362867, 1, 1, 1, 1, 1,
-0.2735305, -0.6079679, -2.327348, 1, 1, 1, 1, 1,
-0.2729337, 0.05049954, -1.122388, 1, 1, 1, 1, 1,
-0.2688873, 0.4169221, 0.2740993, 1, 1, 1, 1, 1,
-0.2669342, -0.3951494, -1.372941, 0, 0, 1, 1, 1,
-0.2664194, 2.441063, -0.5798008, 1, 0, 0, 1, 1,
-0.26618, 0.204073, -0.6028613, 1, 0, 0, 1, 1,
-0.2637013, -0.8816432, -2.734451, 1, 0, 0, 1, 1,
-0.2622018, -1.467269, -1.491366, 1, 0, 0, 1, 1,
-0.2611246, 0.6475596, 1.117984, 1, 0, 0, 1, 1,
-0.2585884, -0.3067631, -3.402915, 0, 0, 0, 1, 1,
-0.2570836, -0.1228673, -0.0559821, 0, 0, 0, 1, 1,
-0.2562025, -0.1385563, -4.450024, 0, 0, 0, 1, 1,
-0.255271, -2.557554, -2.063566, 0, 0, 0, 1, 1,
-0.2532538, -1.27293, -3.19185, 0, 0, 0, 1, 1,
-0.2517944, 0.1997267, -0.3022802, 0, 0, 0, 1, 1,
-0.2494399, -1.07791, -3.342926, 0, 0, 0, 1, 1,
-0.248238, 0.812416, -0.7100762, 1, 1, 1, 1, 1,
-0.2461107, -0.3906097, -2.507977, 1, 1, 1, 1, 1,
-0.2448354, -1.69124, -1.56491, 1, 1, 1, 1, 1,
-0.2436175, 0.6771542, 0.09638095, 1, 1, 1, 1, 1,
-0.2360712, 1.414057, 1.482906, 1, 1, 1, 1, 1,
-0.2350101, -1.071862, -3.486432, 1, 1, 1, 1, 1,
-0.2331232, 0.2428023, -1.37763, 1, 1, 1, 1, 1,
-0.2327081, -0.8962368, -1.575973, 1, 1, 1, 1, 1,
-0.23103, 0.1230569, -0.3271171, 1, 1, 1, 1, 1,
-0.2240316, -1.181674, -1.295312, 1, 1, 1, 1, 1,
-0.2235008, 0.2565379, -2.25008, 1, 1, 1, 1, 1,
-0.2212071, 0.3894119, -0.4548126, 1, 1, 1, 1, 1,
-0.2207383, 0.3539246, 0.1231432, 1, 1, 1, 1, 1,
-0.2179601, -0.7969935, -3.756254, 1, 1, 1, 1, 1,
-0.2119855, 0.1725083, 0.2805502, 1, 1, 1, 1, 1,
-0.2114988, 1.284575, -0.5998634, 0, 0, 1, 1, 1,
-0.2105961, -0.2100334, -2.21639, 1, 0, 0, 1, 1,
-0.2102214, -1.496124, -2.419945, 1, 0, 0, 1, 1,
-0.2102096, -1.476216, -1.910846, 1, 0, 0, 1, 1,
-0.2095852, -1.012002, -3.08337, 1, 0, 0, 1, 1,
-0.2074464, -0.5583588, -3.079306, 1, 0, 0, 1, 1,
-0.2047195, 0.1309861, -2.118237, 0, 0, 0, 1, 1,
-0.2043809, 0.3184045, -0.490132, 0, 0, 0, 1, 1,
-0.202182, 0.4806127, 0.3343576, 0, 0, 0, 1, 1,
-0.2004117, 0.5712504, 0.1408099, 0, 0, 0, 1, 1,
-0.1977577, 0.662593, -1.435899, 0, 0, 0, 1, 1,
-0.1972476, 1.007691, -0.02201488, 0, 0, 0, 1, 1,
-0.1961652, -1.103499, -2.995231, 0, 0, 0, 1, 1,
-0.1943611, 0.3268581, -2.5868, 1, 1, 1, 1, 1,
-0.1852816, 0.08285335, -2.294737, 1, 1, 1, 1, 1,
-0.1826219, -1.437661, -2.77938, 1, 1, 1, 1, 1,
-0.1822201, -1.579799, -3.711872, 1, 1, 1, 1, 1,
-0.1618357, -0.6781767, -2.455772, 1, 1, 1, 1, 1,
-0.1540794, -1.362268, -3.503889, 1, 1, 1, 1, 1,
-0.1480835, -2.096356, -4.499307, 1, 1, 1, 1, 1,
-0.1443661, 1.016221, 1.71114, 1, 1, 1, 1, 1,
-0.1428805, -0.281509, -2.609047, 1, 1, 1, 1, 1,
-0.1428062, 0.7602159, 0.4753249, 1, 1, 1, 1, 1,
-0.1373876, -0.8931587, -2.394533, 1, 1, 1, 1, 1,
-0.136251, -0.889615, -4.196733, 1, 1, 1, 1, 1,
-0.1339856, -1.132402, -4.061207, 1, 1, 1, 1, 1,
-0.1323216, -0.4660034, -3.114797, 1, 1, 1, 1, 1,
-0.127674, 0.1787456, -0.2243273, 1, 1, 1, 1, 1,
-0.1236461, -0.1783064, -2.138941, 0, 0, 1, 1, 1,
-0.1174806, -1.39589, -3.349637, 1, 0, 0, 1, 1,
-0.117174, 0.06386747, -3.083914, 1, 0, 0, 1, 1,
-0.1155811, -0.0913491, -2.74834, 1, 0, 0, 1, 1,
-0.1112801, -0.3267191, -4.043915, 1, 0, 0, 1, 1,
-0.1104259, 0.1585435, -1.296008, 1, 0, 0, 1, 1,
-0.1088014, -0.07988893, -1.348515, 0, 0, 0, 1, 1,
-0.1086896, -0.8376341, -3.044721, 0, 0, 0, 1, 1,
-0.1066509, 0.2443963, 0.4596815, 0, 0, 0, 1, 1,
-0.1055711, 1.333555, 0.2622879, 0, 0, 0, 1, 1,
-0.1049006, 1.865102, -1.726623, 0, 0, 0, 1, 1,
-0.1040986, 0.06593895, 0.2143999, 0, 0, 0, 1, 1,
-0.1002731, 1.474954, 0.4669489, 0, 0, 0, 1, 1,
-0.1000154, 0.6438422, 2.539304, 1, 1, 1, 1, 1,
-0.09739994, 0.6065763, -1.730585, 1, 1, 1, 1, 1,
-0.09075586, -1.375602, -4.089648, 1, 1, 1, 1, 1,
-0.088462, -0.9720385, -4.55919, 1, 1, 1, 1, 1,
-0.08576448, 1.425539, 2.000615, 1, 1, 1, 1, 1,
-0.08391578, 0.9165128, -0.6872295, 1, 1, 1, 1, 1,
-0.08193967, 0.1794092, -0.8498119, 1, 1, 1, 1, 1,
-0.08175801, 1.669577, 0.9782833, 1, 1, 1, 1, 1,
-0.07898586, -0.2162879, -3.007375, 1, 1, 1, 1, 1,
-0.07695943, -1.286322, -2.771413, 1, 1, 1, 1, 1,
-0.07242632, 1.652959, -1.667397, 1, 1, 1, 1, 1,
-0.07008411, 0.4747444, -0.1389307, 1, 1, 1, 1, 1,
-0.06752391, -0.8245303, -4.387594, 1, 1, 1, 1, 1,
-0.06687642, -1.42876, -3.303686, 1, 1, 1, 1, 1,
-0.06154738, 0.8016074, 0.4691371, 1, 1, 1, 1, 1,
-0.05889091, 2.308168, 0.8018305, 0, 0, 1, 1, 1,
-0.05878187, 0.676372, -1.792526, 1, 0, 0, 1, 1,
-0.05387255, -1.031977, -3.288542, 1, 0, 0, 1, 1,
-0.05151513, -0.2587647, -2.535753, 1, 0, 0, 1, 1,
-0.04282635, 0.8030044, -0.7584772, 1, 0, 0, 1, 1,
-0.03797863, -0.7706169, -0.711832, 1, 0, 0, 1, 1,
-0.03239531, -0.3269425, -1.534218, 0, 0, 0, 1, 1,
-0.0299168, 1.001636, -0.7080214, 0, 0, 0, 1, 1,
-0.02964368, 0.1390616, -1.582277, 0, 0, 0, 1, 1,
-0.02646588, 0.04036786, -1.190942, 0, 0, 0, 1, 1,
-0.02466894, -0.04436408, -1.474807, 0, 0, 0, 1, 1,
-0.01640429, 1.567792, 0.4791178, 0, 0, 0, 1, 1,
-0.0129514, 0.2351126, 1.184273, 0, 0, 0, 1, 1,
-0.01227498, 0.541174, -0.8439159, 1, 1, 1, 1, 1,
-0.01166011, 0.08293463, 0.1939468, 1, 1, 1, 1, 1,
-0.007195489, 0.3170142, 0.9267665, 1, 1, 1, 1, 1,
-0.007081912, -0.948772, -2.458861, 1, 1, 1, 1, 1,
0.005714389, 1.961347, -0.200227, 1, 1, 1, 1, 1,
0.0123334, -0.2630935, 2.906853, 1, 1, 1, 1, 1,
0.01373278, 0.5567847, -0.09044538, 1, 1, 1, 1, 1,
0.02081461, 2.090498, -0.1223408, 1, 1, 1, 1, 1,
0.02172644, -1.482598, 3.826348, 1, 1, 1, 1, 1,
0.02803018, -0.4800858, 1.826787, 1, 1, 1, 1, 1,
0.03578912, 0.5268082, -0.8995857, 1, 1, 1, 1, 1,
0.03621081, -1.360513, 3.325163, 1, 1, 1, 1, 1,
0.04021303, 1.406841, 0.2154728, 1, 1, 1, 1, 1,
0.0451663, 0.7655875, 0.7424058, 1, 1, 1, 1, 1,
0.04718599, 0.6557532, 1.176748, 1, 1, 1, 1, 1,
0.04944256, -2.07266, 2.073006, 0, 0, 1, 1, 1,
0.04982852, 0.01397638, 0.1237512, 1, 0, 0, 1, 1,
0.05340328, -2.13991, 2.817242, 1, 0, 0, 1, 1,
0.05365077, 1.327588, -1.312292, 1, 0, 0, 1, 1,
0.05491795, 0.5316676, 0.7246677, 1, 0, 0, 1, 1,
0.05771103, -1.522405, 4.112552, 1, 0, 0, 1, 1,
0.06286853, -0.7699746, 4.788479, 0, 0, 0, 1, 1,
0.0651127, -2.034143, 4.37235, 0, 0, 0, 1, 1,
0.07004467, -1.204639, 0.7497484, 0, 0, 0, 1, 1,
0.07909017, 1.478073, -0.550658, 0, 0, 0, 1, 1,
0.07938673, -0.0847085, 2.075176, 0, 0, 0, 1, 1,
0.08057372, 1.421767, 1.537981, 0, 0, 0, 1, 1,
0.08093107, 0.4509689, -0.2559349, 0, 0, 0, 1, 1,
0.0813169, 0.2971448, 0.6582353, 1, 1, 1, 1, 1,
0.08482479, 0.4273917, 0.04963542, 1, 1, 1, 1, 1,
0.08764499, -0.896408, 3.512559, 1, 1, 1, 1, 1,
0.09501754, 0.6932345, 0.8928807, 1, 1, 1, 1, 1,
0.09794642, 1.397658, -1.580929, 1, 1, 1, 1, 1,
0.09879097, 0.2205452, 0.6470171, 1, 1, 1, 1, 1,
0.09889986, 0.5452228, -1.46341, 1, 1, 1, 1, 1,
0.1029395, 0.6930656, -0.3302559, 1, 1, 1, 1, 1,
0.1033685, -1.652582, 2.597409, 1, 1, 1, 1, 1,
0.1070902, 0.05834612, 1.940583, 1, 1, 1, 1, 1,
0.1106137, -0.107472, 1.172747, 1, 1, 1, 1, 1,
0.1157215, 0.9612551, -0.1750846, 1, 1, 1, 1, 1,
0.1162791, 0.5580528, -0.816208, 1, 1, 1, 1, 1,
0.1194877, 2.62922, 0.4179038, 1, 1, 1, 1, 1,
0.12246, 0.4262598, 1.464988, 1, 1, 1, 1, 1,
0.1225346, 2.792571, 0.3687309, 0, 0, 1, 1, 1,
0.124102, 0.02283716, 2.55404, 1, 0, 0, 1, 1,
0.1262823, -0.1755683, 5.87584, 1, 0, 0, 1, 1,
0.130234, 0.5909868, -0.2940182, 1, 0, 0, 1, 1,
0.1396412, -0.9617515, 5.602633, 1, 0, 0, 1, 1,
0.1445404, 0.2144971, 0.0437862, 1, 0, 0, 1, 1,
0.1467208, -0.1621111, 3.314083, 0, 0, 0, 1, 1,
0.1495154, -0.4911261, 4.249315, 0, 0, 0, 1, 1,
0.1500288, 1.737411, 1.02531, 0, 0, 0, 1, 1,
0.1506078, 1.382648, 0.4808252, 0, 0, 0, 1, 1,
0.1536988, -0.4445839, 2.082869, 0, 0, 0, 1, 1,
0.1640856, -2.101603, 4.778227, 0, 0, 0, 1, 1,
0.1642084, 0.6202631, 1.127733, 0, 0, 0, 1, 1,
0.1663084, 0.4807647, -0.454837, 1, 1, 1, 1, 1,
0.1674385, 0.3694476, -0.04163143, 1, 1, 1, 1, 1,
0.1676983, -1.099492, 3.234943, 1, 1, 1, 1, 1,
0.1689681, 0.1593647, 0.5619694, 1, 1, 1, 1, 1,
0.1705641, -0.3282326, 3.775869, 1, 1, 1, 1, 1,
0.1707722, -0.1476143, 2.643318, 1, 1, 1, 1, 1,
0.1709817, 0.08642692, 0.8761601, 1, 1, 1, 1, 1,
0.1713658, -0.4669647, 2.661683, 1, 1, 1, 1, 1,
0.1754043, -0.6746408, 2.616874, 1, 1, 1, 1, 1,
0.1801445, -0.4087554, 4.008316, 1, 1, 1, 1, 1,
0.1860966, 1.214879, 1.250381, 1, 1, 1, 1, 1,
0.1876409, 0.01576891, 0.2706847, 1, 1, 1, 1, 1,
0.191671, -0.860168, 4.041243, 1, 1, 1, 1, 1,
0.1926759, -0.8917993, 2.759791, 1, 1, 1, 1, 1,
0.1931293, -0.8581401, 3.55449, 1, 1, 1, 1, 1,
0.1948109, 0.6578338, -0.9671835, 0, 0, 1, 1, 1,
0.197246, -0.03811458, 1.625653, 1, 0, 0, 1, 1,
0.1988924, 0.9206746, -0.4181961, 1, 0, 0, 1, 1,
0.1995135, -0.2739242, 2.737065, 1, 0, 0, 1, 1,
0.2005698, 1.194477, -0.2913249, 1, 0, 0, 1, 1,
0.2044571, 1.217852, 1.256376, 1, 0, 0, 1, 1,
0.2071656, 0.7485304, -1.478563, 0, 0, 0, 1, 1,
0.2071789, 0.04831557, 1.104683, 0, 0, 0, 1, 1,
0.2141688, -0.0502889, 2.225828, 0, 0, 0, 1, 1,
0.2150166, 0.04387387, 1.835677, 0, 0, 0, 1, 1,
0.221355, 0.2729177, 0.6374974, 0, 0, 0, 1, 1,
0.2263204, -0.9511176, 4.250865, 0, 0, 0, 1, 1,
0.229837, -0.06384405, 2.694782, 0, 0, 0, 1, 1,
0.2302166, -0.0005591023, 2.575818, 1, 1, 1, 1, 1,
0.2372564, 0.1495897, 0.502889, 1, 1, 1, 1, 1,
0.2461928, 0.04956006, -1.118926, 1, 1, 1, 1, 1,
0.2473758, -1.111507, 2.348254, 1, 1, 1, 1, 1,
0.2479662, -0.6388817, 3.300494, 1, 1, 1, 1, 1,
0.2488292, -0.8294489, 4.597085, 1, 1, 1, 1, 1,
0.2489225, 0.6952139, 0.8961818, 1, 1, 1, 1, 1,
0.2526896, 2.362097, 1.707545, 1, 1, 1, 1, 1,
0.2566119, -1.433315, 3.507464, 1, 1, 1, 1, 1,
0.2603299, -0.6707326, 2.389864, 1, 1, 1, 1, 1,
0.2673694, 1.396219, 1.133141, 1, 1, 1, 1, 1,
0.2680387, 1.451674, 1.046947, 1, 1, 1, 1, 1,
0.268652, 0.6076943, 0.1384809, 1, 1, 1, 1, 1,
0.2697276, 0.2808022, 3.312923, 1, 1, 1, 1, 1,
0.2727523, 0.5267774, -0.4155623, 1, 1, 1, 1, 1,
0.2811592, -0.2085336, 1.882286, 0, 0, 1, 1, 1,
0.2857225, -0.569153, 3.576731, 1, 0, 0, 1, 1,
0.2862445, 1.403312, 1.870023, 1, 0, 0, 1, 1,
0.2930771, 1.25802, 0.1202429, 1, 0, 0, 1, 1,
0.2959524, -1.171054, 4.094567, 1, 0, 0, 1, 1,
0.2973197, -1.274123, 1.506011, 1, 0, 0, 1, 1,
0.2991763, -1.077418, 4.247848, 0, 0, 0, 1, 1,
0.3028661, 0.4355307, -0.2568079, 0, 0, 0, 1, 1,
0.3033106, 0.2236809, 1.345235, 0, 0, 0, 1, 1,
0.3041699, 0.1556387, 2.038543, 0, 0, 0, 1, 1,
0.3047337, 1.083616, -0.180132, 0, 0, 0, 1, 1,
0.3086449, -0.6569611, 1.873608, 0, 0, 0, 1, 1,
0.317477, 0.1051007, 0.9786375, 0, 0, 0, 1, 1,
0.3175373, -0.7625817, 2.819576, 1, 1, 1, 1, 1,
0.3242023, 0.2980284, 0.8580707, 1, 1, 1, 1, 1,
0.3244947, -0.4317691, 3.261977, 1, 1, 1, 1, 1,
0.3259301, -0.3390554, 2.391408, 1, 1, 1, 1, 1,
0.3265985, -0.3596735, 1.721883, 1, 1, 1, 1, 1,
0.3267213, -0.08153971, 1.503464, 1, 1, 1, 1, 1,
0.3284261, -1.229806, 1.810628, 1, 1, 1, 1, 1,
0.3286861, 0.5264893, -1.184063, 1, 1, 1, 1, 1,
0.3297422, -1.199614, 1.654791, 1, 1, 1, 1, 1,
0.3331372, 1.005496, 2.047248, 1, 1, 1, 1, 1,
0.3381817, -0.9860348, 3.768234, 1, 1, 1, 1, 1,
0.3449964, 0.01861602, 1.868043, 1, 1, 1, 1, 1,
0.3484553, -0.08423131, 2.176648, 1, 1, 1, 1, 1,
0.3493212, -0.1044494, 2.437, 1, 1, 1, 1, 1,
0.3549543, -2.487762, 2.341556, 1, 1, 1, 1, 1,
0.3582853, -1.126212, 4.303622, 0, 0, 1, 1, 1,
0.3597184, -1.239907, 3.375495, 1, 0, 0, 1, 1,
0.3599503, -0.5356457, 0.8037938, 1, 0, 0, 1, 1,
0.3619517, -0.05939526, 2.125335, 1, 0, 0, 1, 1,
0.3678583, 0.1536976, -1.501424, 1, 0, 0, 1, 1,
0.3729275, 0.206715, 1.135799, 1, 0, 0, 1, 1,
0.3781486, 1.028698, 0.5689015, 0, 0, 0, 1, 1,
0.3809715, 0.6323202, 0.6613502, 0, 0, 0, 1, 1,
0.3863461, -2.220439, 4.06013, 0, 0, 0, 1, 1,
0.3871738, -0.4186015, 1.737738, 0, 0, 0, 1, 1,
0.3899579, -0.2026995, 1.975134, 0, 0, 0, 1, 1,
0.3937622, 2.179445, -0.9438685, 0, 0, 0, 1, 1,
0.3959327, 0.6793882, -1.517991, 0, 0, 0, 1, 1,
0.397451, 0.428701, 0.7371954, 1, 1, 1, 1, 1,
0.399146, 0.7428303, 0.05106223, 1, 1, 1, 1, 1,
0.4023639, -0.1988878, 3.551836, 1, 1, 1, 1, 1,
0.4112011, 0.307236, 0.3326757, 1, 1, 1, 1, 1,
0.4116293, 0.6468618, 2.098339, 1, 1, 1, 1, 1,
0.4131877, 0.3997423, 0.1151345, 1, 1, 1, 1, 1,
0.4138479, 0.5959936, 1.124939, 1, 1, 1, 1, 1,
0.4179617, 1.615647, 1.748785, 1, 1, 1, 1, 1,
0.4252567, 1.077692, -1.504871, 1, 1, 1, 1, 1,
0.428085, -0.5220278, 2.423376, 1, 1, 1, 1, 1,
0.4283361, 0.08339449, 1.393227, 1, 1, 1, 1, 1,
0.4390645, -0.008079072, 2.777826, 1, 1, 1, 1, 1,
0.4431601, 1.976887, 0.1679873, 1, 1, 1, 1, 1,
0.4465488, -0.7894302, 1.578974, 1, 1, 1, 1, 1,
0.4469822, -0.1534485, 5.4166, 1, 1, 1, 1, 1,
0.4492695, -0.8446348, 1.064241, 0, 0, 1, 1, 1,
0.4518876, 0.2103005, 1.794105, 1, 0, 0, 1, 1,
0.4524716, 0.5032849, 1.063491, 1, 0, 0, 1, 1,
0.4551327, -1.08479, 4.759372, 1, 0, 0, 1, 1,
0.4640999, 0.6021864, 1.620409, 1, 0, 0, 1, 1,
0.4642046, -0.7883041, 3.012532, 1, 0, 0, 1, 1,
0.4654137, 0.8764713, 0.9778997, 0, 0, 0, 1, 1,
0.4693249, -0.05548427, 0.910718, 0, 0, 0, 1, 1,
0.4846251, -0.3651978, 2.287596, 0, 0, 0, 1, 1,
0.4908626, -0.6751892, 3.033396, 0, 0, 0, 1, 1,
0.4930375, 0.9596328, -0.2864976, 0, 0, 0, 1, 1,
0.4931717, 0.1474533, 1.245998, 0, 0, 0, 1, 1,
0.4932798, 1.020026, -0.285138, 0, 0, 0, 1, 1,
0.505087, 0.9739932, 0.5228202, 1, 1, 1, 1, 1,
0.5050972, -0.2041623, 1.26048, 1, 1, 1, 1, 1,
0.5150091, -0.03140189, 1.94103, 1, 1, 1, 1, 1,
0.5168818, 0.7618751, -0.2332761, 1, 1, 1, 1, 1,
0.5210776, 0.05299129, 1.787466, 1, 1, 1, 1, 1,
0.5242522, -0.4969838, 2.100029, 1, 1, 1, 1, 1,
0.5279577, 0.2246573, 1.377797, 1, 1, 1, 1, 1,
0.5322807, -1.011231, 0.7301058, 1, 1, 1, 1, 1,
0.5325217, 2.148984, 1.505109, 1, 1, 1, 1, 1,
0.5325288, 2.448875, 0.5496178, 1, 1, 1, 1, 1,
0.5372307, -0.3186813, 1.171367, 1, 1, 1, 1, 1,
0.5403713, 0.6987691, 0.2018232, 1, 1, 1, 1, 1,
0.5405522, -0.4193526, 2.907021, 1, 1, 1, 1, 1,
0.5422158, 1.70533, -0.5488906, 1, 1, 1, 1, 1,
0.5475914, -2.633005, 5.510846, 1, 1, 1, 1, 1,
0.548485, -0.5832398, 4.384284, 0, 0, 1, 1, 1,
0.548651, 0.6962242, 0.6020244, 1, 0, 0, 1, 1,
0.5488676, -0.4935185, 2.871841, 1, 0, 0, 1, 1,
0.5504173, -1.683476, 1.462479, 1, 0, 0, 1, 1,
0.5517429, 1.138062, 1.777946, 1, 0, 0, 1, 1,
0.5555668, 1.471395, 2.3206, 1, 0, 0, 1, 1,
0.561095, 0.4124843, 0.366676, 0, 0, 0, 1, 1,
0.5633901, 0.005567288, 0.9720576, 0, 0, 0, 1, 1,
0.5682817, -0.03617066, 1.430328, 0, 0, 0, 1, 1,
0.5707528, 0.5814337, -0.5097365, 0, 0, 0, 1, 1,
0.5785946, -1.254776, 3.439677, 0, 0, 0, 1, 1,
0.5797818, -0.8365543, 2.49844, 0, 0, 0, 1, 1,
0.5798866, -1.342703, 3.097652, 0, 0, 0, 1, 1,
0.5803912, 0.9353142, 2.953345, 1, 1, 1, 1, 1,
0.5907524, 1.564049, 1.762007, 1, 1, 1, 1, 1,
0.5923641, -0.2724564, 1.71158, 1, 1, 1, 1, 1,
0.5931252, 0.4949533, -0.09313706, 1, 1, 1, 1, 1,
0.5941406, 0.1595582, 0.079054, 1, 1, 1, 1, 1,
0.6024125, -0.08344395, 1.386385, 1, 1, 1, 1, 1,
0.6064522, -0.0561148, 1.421224, 1, 1, 1, 1, 1,
0.6080952, 0.8207053, 1.808213, 1, 1, 1, 1, 1,
0.6084362, -0.578172, 4.390531, 1, 1, 1, 1, 1,
0.6136291, 0.7006772, -0.2692795, 1, 1, 1, 1, 1,
0.6146813, -0.3908314, 3.05091, 1, 1, 1, 1, 1,
0.6156198, -0.006758176, 0.9871007, 1, 1, 1, 1, 1,
0.6226638, -1.844221, 3.882401, 1, 1, 1, 1, 1,
0.6295744, -0.06234256, 1.157225, 1, 1, 1, 1, 1,
0.6298988, 0.432611, 0.818445, 1, 1, 1, 1, 1,
0.6299376, -0.8240969, -0.1182038, 0, 0, 1, 1, 1,
0.6370265, 1.209624, -1.100405, 1, 0, 0, 1, 1,
0.6418871, -0.4744983, 1.133003, 1, 0, 0, 1, 1,
0.6431248, 1.221683, -1.15774, 1, 0, 0, 1, 1,
0.6483895, 0.2134358, 2.33523, 1, 0, 0, 1, 1,
0.6526098, 0.9519348, 0.2994527, 1, 0, 0, 1, 1,
0.6579606, 1.487482, 0.1391495, 0, 0, 0, 1, 1,
0.6619437, -1.364378, 3.451318, 0, 0, 0, 1, 1,
0.6627122, 0.3686261, 1.002115, 0, 0, 0, 1, 1,
0.6628202, 0.9650127, 1.057742, 0, 0, 0, 1, 1,
0.6712754, 1.118278, 0.5432447, 0, 0, 0, 1, 1,
0.6720542, 1.98845, 1.689479, 0, 0, 0, 1, 1,
0.6728139, -0.6297695, 1.131327, 0, 0, 0, 1, 1,
0.6785877, -0.09151642, 2.473308, 1, 1, 1, 1, 1,
0.67997, 0.4819197, 2.207373, 1, 1, 1, 1, 1,
0.6911707, -1.673838, 3.588909, 1, 1, 1, 1, 1,
0.6916511, 0.6911841, 2.311316, 1, 1, 1, 1, 1,
0.6999575, 1.48092, -0.9765198, 1, 1, 1, 1, 1,
0.7025964, -0.9556273, 2.923274, 1, 1, 1, 1, 1,
0.7063324, -0.5474849, 3.074566, 1, 1, 1, 1, 1,
0.7110467, -0.02187124, 2.436974, 1, 1, 1, 1, 1,
0.7124142, -0.3381343, 2.099125, 1, 1, 1, 1, 1,
0.7182906, -0.174521, 1.305453, 1, 1, 1, 1, 1,
0.7229197, 0.1783218, -0.3347845, 1, 1, 1, 1, 1,
0.7263497, 0.5701501, -0.3858672, 1, 1, 1, 1, 1,
0.7340704, -0.6636497, 1.838235, 1, 1, 1, 1, 1,
0.7375246, 1.618194, -0.0383039, 1, 1, 1, 1, 1,
0.7417547, -2.262592, 2.529947, 1, 1, 1, 1, 1,
0.746412, -0.8026435, 3.276487, 0, 0, 1, 1, 1,
0.7539725, -1.980233, 3.075562, 1, 0, 0, 1, 1,
0.755826, -0.6800882, 2.882064, 1, 0, 0, 1, 1,
0.756664, -1.638896, 1.787983, 1, 0, 0, 1, 1,
0.7588267, 0.1438361, 2.272657, 1, 0, 0, 1, 1,
0.7591518, -1.106228, -1.557045, 1, 0, 0, 1, 1,
0.7597584, -1.468721, 3.830346, 0, 0, 0, 1, 1,
0.762246, -0.4921714, 2.212526, 0, 0, 0, 1, 1,
0.7637485, 1.229417, 0.9060135, 0, 0, 0, 1, 1,
0.7703049, 1.079842, 0.6477871, 0, 0, 0, 1, 1,
0.774222, 0.4372995, 2.962687, 0, 0, 0, 1, 1,
0.7751499, -0.9704871, 1.795333, 0, 0, 0, 1, 1,
0.7794793, -0.4085962, 2.947361, 0, 0, 0, 1, 1,
0.7834234, 0.4279565, 0.958329, 1, 1, 1, 1, 1,
0.7849057, -0.4742302, 0.8773843, 1, 1, 1, 1, 1,
0.7979133, 0.5209512, 1.327351, 1, 1, 1, 1, 1,
0.8003068, 0.2083642, 2.121257, 1, 1, 1, 1, 1,
0.8043413, 0.1918889, 3.572252, 1, 1, 1, 1, 1,
0.8081641, -0.6351652, 3.142233, 1, 1, 1, 1, 1,
0.8120066, 1.651919, 0.09495418, 1, 1, 1, 1, 1,
0.8122972, -1.859741, 2.269044, 1, 1, 1, 1, 1,
0.821529, -0.3937661, 3.008855, 1, 1, 1, 1, 1,
0.82603, -0.5177352, 1.202601, 1, 1, 1, 1, 1,
0.8270351, 0.4451111, 0.9550298, 1, 1, 1, 1, 1,
0.8300063, -1.16267, 2.352868, 1, 1, 1, 1, 1,
0.8335193, -0.1421872, 0.4889008, 1, 1, 1, 1, 1,
0.8383949, -0.5989156, 3.114323, 1, 1, 1, 1, 1,
0.8408986, 0.1556195, 1.53392, 1, 1, 1, 1, 1,
0.8447456, -1.99838, 0.9932287, 0, 0, 1, 1, 1,
0.8462071, 0.5772753, -0.2081711, 1, 0, 0, 1, 1,
0.8462248, -1.169695, 1.721933, 1, 0, 0, 1, 1,
0.8494423, -0.513031, 2.237592, 1, 0, 0, 1, 1,
0.8499203, 0.3519349, 0.6180878, 1, 0, 0, 1, 1,
0.8524618, 0.2307781, 1.977318, 1, 0, 0, 1, 1,
0.8586314, -0.8754641, 1.795845, 0, 0, 0, 1, 1,
0.8593982, 0.5138963, 1.309061, 0, 0, 0, 1, 1,
0.860408, -0.5002802, 2.566473, 0, 0, 0, 1, 1,
0.8623943, -2.005622, 2.804139, 0, 0, 0, 1, 1,
0.8649232, 0.955998, 2.439031, 0, 0, 0, 1, 1,
0.8665519, 0.306475, 5.06265, 0, 0, 0, 1, 1,
0.867823, 1.099252, 1.605728, 0, 0, 0, 1, 1,
0.8679332, -0.03466047, 1.1652, 1, 1, 1, 1, 1,
0.8703954, -0.799024, 2.764383, 1, 1, 1, 1, 1,
0.8736224, 0.2026093, 2.610845, 1, 1, 1, 1, 1,
0.8742431, -0.04091308, 1.235271, 1, 1, 1, 1, 1,
0.8789373, 0.06963827, 3.465118, 1, 1, 1, 1, 1,
0.8902476, 0.2523197, 3.117748, 1, 1, 1, 1, 1,
0.8935168, 0.4091432, 2.87549, 1, 1, 1, 1, 1,
0.8946173, 0.7431245, 0.2421919, 1, 1, 1, 1, 1,
0.9030593, 1.140552, 1.21929, 1, 1, 1, 1, 1,
0.9050137, 0.3528318, -0.1696754, 1, 1, 1, 1, 1,
0.9053706, 1.502449, 0.3089168, 1, 1, 1, 1, 1,
0.9077188, 0.2455104, 2.197758, 1, 1, 1, 1, 1,
0.9093519, 0.01474021, 1.376427, 1, 1, 1, 1, 1,
0.9112936, 0.7222276, 0.371856, 1, 1, 1, 1, 1,
0.9115883, -0.9635724, 2.976372, 1, 1, 1, 1, 1,
0.9128878, 2.390656, 0.3308103, 0, 0, 1, 1, 1,
0.9172011, 1.04839, 3.009577, 1, 0, 0, 1, 1,
0.9204035, -0.04476852, 0.8893958, 1, 0, 0, 1, 1,
0.9214742, 0.7938599, 1.208949, 1, 0, 0, 1, 1,
0.9245269, -1.302763, 2.189645, 1, 0, 0, 1, 1,
0.9246609, 0.3143285, 2.156171, 1, 0, 0, 1, 1,
0.927195, -0.9608484, 2.058447, 0, 0, 0, 1, 1,
0.9316514, -0.2060878, 2.298035, 0, 0, 0, 1, 1,
0.9329014, -2.013688, 1.805842, 0, 0, 0, 1, 1,
0.9435936, -0.9868687, 1.153771, 0, 0, 0, 1, 1,
0.9463748, -1.273243, 2.627825, 0, 0, 0, 1, 1,
0.9477224, 0.006517006, 0.345467, 0, 0, 0, 1, 1,
0.9479707, -1.249593, 3.443335, 0, 0, 0, 1, 1,
0.9485468, 0.753049, 2.730713, 1, 1, 1, 1, 1,
0.9515398, 0.6633286, 1.521476, 1, 1, 1, 1, 1,
0.9532773, -1.834749, 3.782846, 1, 1, 1, 1, 1,
0.9578987, 1.271176, -1.309079, 1, 1, 1, 1, 1,
0.966643, -0.01162796, 0.9075181, 1, 1, 1, 1, 1,
0.9708695, -0.06958887, 0.002678124, 1, 1, 1, 1, 1,
0.9761516, -0.6143125, 3.483606, 1, 1, 1, 1, 1,
0.9778193, -0.6638634, 3.410367, 1, 1, 1, 1, 1,
0.9829236, -0.03237275, 2.551813, 1, 1, 1, 1, 1,
0.985624, 0.9688504, 0.5396568, 1, 1, 1, 1, 1,
0.9904025, 0.05480142, 0.8923898, 1, 1, 1, 1, 1,
0.9910514, 0.9464388, 0.8580689, 1, 1, 1, 1, 1,
0.993311, 2.36097, 0.4854417, 1, 1, 1, 1, 1,
0.993612, 0.2175328, 0.7101269, 1, 1, 1, 1, 1,
1.00526, 1.259432, 2.111134, 1, 1, 1, 1, 1,
1.005666, -0.3744418, 1.208493, 0, 0, 1, 1, 1,
1.00649, 1.246518, 1.008409, 1, 0, 0, 1, 1,
1.009707, 1.003513, -0.1012524, 1, 0, 0, 1, 1,
1.011687, -0.4058469, 1.279175, 1, 0, 0, 1, 1,
1.01835, 0.5802748, 1.815742, 1, 0, 0, 1, 1,
1.023582, 0.7311872, 1.679949, 1, 0, 0, 1, 1,
1.025124, 0.9086591, 1.408883, 0, 0, 0, 1, 1,
1.026176, -0.0884377, 2.132802, 0, 0, 0, 1, 1,
1.036382, -1.917108, 1.352818, 0, 0, 0, 1, 1,
1.037274, 1.148328, -0.4766933, 0, 0, 0, 1, 1,
1.041531, -1.733918, 2.939816, 0, 0, 0, 1, 1,
1.065336, -0.2570333, 0.6458359, 0, 0, 0, 1, 1,
1.065805, -0.5833198, 2.606779, 0, 0, 0, 1, 1,
1.071003, -1.454063, 1.359874, 1, 1, 1, 1, 1,
1.071424, -0.0517861, 2.022494, 1, 1, 1, 1, 1,
1.076321, 0.2909221, 1.564863, 1, 1, 1, 1, 1,
1.07645, -0.229219, 0.8296018, 1, 1, 1, 1, 1,
1.078193, -0.2274439, 0.9412664, 1, 1, 1, 1, 1,
1.127493, 1.603649, 0.3321906, 1, 1, 1, 1, 1,
1.130058, 1.136444, 0.7342516, 1, 1, 1, 1, 1,
1.1447, -0.3685982, 2.357493, 1, 1, 1, 1, 1,
1.148507, 0.09795804, 0.4540974, 1, 1, 1, 1, 1,
1.148836, -0.6777028, 0.2683112, 1, 1, 1, 1, 1,
1.149685, 0.4381426, 0.3547415, 1, 1, 1, 1, 1,
1.153789, -0.2104838, 1.505756, 1, 1, 1, 1, 1,
1.154971, 0.6795458, 0.7505702, 1, 1, 1, 1, 1,
1.161771, -0.4549773, 0.8560764, 1, 1, 1, 1, 1,
1.161825, 0.3945821, 1.622925, 1, 1, 1, 1, 1,
1.162946, -2.066573, 3.047089, 0, 0, 1, 1, 1,
1.16469, 0.6291112, 1.609119, 1, 0, 0, 1, 1,
1.168359, -0.5611537, 0.7994524, 1, 0, 0, 1, 1,
1.168469, -0.6503015, 3.00806, 1, 0, 0, 1, 1,
1.172185, 0.007135871, 1.387113, 1, 0, 0, 1, 1,
1.191016, -0.7392091, 2.375333, 1, 0, 0, 1, 1,
1.192852, -0.4041796, 3.360145, 0, 0, 0, 1, 1,
1.201883, -0.7468766, 2.80817, 0, 0, 0, 1, 1,
1.204908, -0.6059148, 1.56857, 0, 0, 0, 1, 1,
1.211097, -0.2042756, 1.306631, 0, 0, 0, 1, 1,
1.212186, -1.75531, 2.446695, 0, 0, 0, 1, 1,
1.2277, -0.5703747, 2.083766, 0, 0, 0, 1, 1,
1.228402, -2.169856, 2.659749, 0, 0, 0, 1, 1,
1.23294, -0.9262711, 4.009355, 1, 1, 1, 1, 1,
1.239709, -0.04890304, 0.5027402, 1, 1, 1, 1, 1,
1.240816, 0.3061556, 1.203079, 1, 1, 1, 1, 1,
1.260481, -0.6431118, 1.875121, 1, 1, 1, 1, 1,
1.264465, 0.146419, 1.476193, 1, 1, 1, 1, 1,
1.270668, 0.5895137, 0.3889469, 1, 1, 1, 1, 1,
1.276041, 0.7498307, 0.3709102, 1, 1, 1, 1, 1,
1.291293, -1.498961, 1.720881, 1, 1, 1, 1, 1,
1.294602, -1.250915, 2.214968, 1, 1, 1, 1, 1,
1.294643, -1.181915, 2.558445, 1, 1, 1, 1, 1,
1.295185, -1.08832, 1.526345, 1, 1, 1, 1, 1,
1.295747, -0.5697801, 3.441221, 1, 1, 1, 1, 1,
1.297718, 0.9067697, 1.188987, 1, 1, 1, 1, 1,
1.315644, -0.4903495, 0.3109555, 1, 1, 1, 1, 1,
1.317639, -0.1337301, 1.69885, 1, 1, 1, 1, 1,
1.317723, -0.001643248, 2.025513, 0, 0, 1, 1, 1,
1.319957, -0.5475916, 2.104702, 1, 0, 0, 1, 1,
1.320325, -1.467896, 3.273992, 1, 0, 0, 1, 1,
1.320915, 0.4643139, 2.284158, 1, 0, 0, 1, 1,
1.32127, -0.4001029, 1.768307, 1, 0, 0, 1, 1,
1.322277, 0.5272046, 3.685171, 1, 0, 0, 1, 1,
1.331012, -1.473716, 2.434349, 0, 0, 0, 1, 1,
1.33555, -1.715998, 2.592649, 0, 0, 0, 1, 1,
1.337201, 2.119847, 0.4017181, 0, 0, 0, 1, 1,
1.343326, -1.004501, 2.334391, 0, 0, 0, 1, 1,
1.345995, 0.9811236, -0.1567085, 0, 0, 0, 1, 1,
1.346644, 0.2490207, 1.521683, 0, 0, 0, 1, 1,
1.347812, -1.57352, 4.03139, 0, 0, 0, 1, 1,
1.350105, 0.7157941, 0.8143831, 1, 1, 1, 1, 1,
1.35688, 0.9872336, 0.6968225, 1, 1, 1, 1, 1,
1.362482, 0.05387925, 0.9539615, 1, 1, 1, 1, 1,
1.368197, -1.105397, 1.166879, 1, 1, 1, 1, 1,
1.374614, -0.2651521, 1.589016, 1, 1, 1, 1, 1,
1.377026, 1.855193, 1.419624, 1, 1, 1, 1, 1,
1.385236, -0.2959108, 1.12322, 1, 1, 1, 1, 1,
1.395485, -0.7828938, 2.043298, 1, 1, 1, 1, 1,
1.405804, 1.249425, -0.6160106, 1, 1, 1, 1, 1,
1.417186, 1.157609, 0.2793443, 1, 1, 1, 1, 1,
1.429548, -1.59015, 1.924864, 1, 1, 1, 1, 1,
1.431086, -0.5360247, 1.98147, 1, 1, 1, 1, 1,
1.431153, -0.553302, 0.9291977, 1, 1, 1, 1, 1,
1.432054, -1.513638, 2.686085, 1, 1, 1, 1, 1,
1.435562, 0.05698679, 0.347393, 1, 1, 1, 1, 1,
1.461532, 1.119493, 1.689823, 0, 0, 1, 1, 1,
1.468606, 0.4874271, 0.9414926, 1, 0, 0, 1, 1,
1.471956, 1.304295, 1.162798, 1, 0, 0, 1, 1,
1.479356, -0.1976265, 4.255327, 1, 0, 0, 1, 1,
1.479519, -0.1346403, 2.172183, 1, 0, 0, 1, 1,
1.480927, 2.758495, -0.4279647, 1, 0, 0, 1, 1,
1.482705, 0.1633791, 1.199707, 0, 0, 0, 1, 1,
1.484974, 0.1401084, -0.6893554, 0, 0, 0, 1, 1,
1.49474, 0.3940918, 1.717797, 0, 0, 0, 1, 1,
1.496868, 0.8886278, 0.7793998, 0, 0, 0, 1, 1,
1.513705, -1.102417, 3.201406, 0, 0, 0, 1, 1,
1.514875, -1.236559, 0.6086949, 0, 0, 0, 1, 1,
1.516088, -0.03466314, 2.133339, 0, 0, 0, 1, 1,
1.526149, -0.2309219, -0.2954564, 1, 1, 1, 1, 1,
1.532372, -1.90715, 2.242326, 1, 1, 1, 1, 1,
1.542336, 0.2394303, 1.475267, 1, 1, 1, 1, 1,
1.546654, 0.3323258, -0.1886948, 1, 1, 1, 1, 1,
1.548395, -1.675458, 3.020553, 1, 1, 1, 1, 1,
1.554197, 0.3508052, 1.257088, 1, 1, 1, 1, 1,
1.557881, -0.806543, 2.54173, 1, 1, 1, 1, 1,
1.561911, -1.150385, 1.749673, 1, 1, 1, 1, 1,
1.578271, 0.8241165, 0.2188333, 1, 1, 1, 1, 1,
1.583082, 0.1793768, 1.209752, 1, 1, 1, 1, 1,
1.588546, 0.5967831, 0.7400648, 1, 1, 1, 1, 1,
1.588674, -0.4931606, 1.568242, 1, 1, 1, 1, 1,
1.598363, 0.9678034, -1.500365, 1, 1, 1, 1, 1,
1.601748, -1.402294, 1.748211, 1, 1, 1, 1, 1,
1.605384, 0.9570646, 0.9885261, 1, 1, 1, 1, 1,
1.617063, -1.163737, 2.95713, 0, 0, 1, 1, 1,
1.618005, 1.456449, 0.559301, 1, 0, 0, 1, 1,
1.625835, 1.342202, 2.027654, 1, 0, 0, 1, 1,
1.647513, 0.449511, 2.915475, 1, 0, 0, 1, 1,
1.650047, 1.697123, 1.66458, 1, 0, 0, 1, 1,
1.651339, 0.08250176, 2.424352, 1, 0, 0, 1, 1,
1.677611, -0.9473379, 2.683359, 0, 0, 0, 1, 1,
1.678006, 0.3230871, 1.199732, 0, 0, 0, 1, 1,
1.695911, -0.08713096, 0.01098803, 0, 0, 0, 1, 1,
1.702131, 1.056283, 0.939257, 0, 0, 0, 1, 1,
1.749819, 0.7823046, 2.311401, 0, 0, 0, 1, 1,
1.757225, -1.98764, 2.196579, 0, 0, 0, 1, 1,
1.766646, 1.028412, 2.106756, 0, 0, 0, 1, 1,
1.768951, 0.9506361, 0.4342802, 1, 1, 1, 1, 1,
1.771889, 1.079922, 1.060612, 1, 1, 1, 1, 1,
1.778796, -1.248676, 2.88617, 1, 1, 1, 1, 1,
1.797118, -0.9960167, 3.057261, 1, 1, 1, 1, 1,
1.797516, -1.975395, 2.189317, 1, 1, 1, 1, 1,
1.819772, 1.03944, 2.135975, 1, 1, 1, 1, 1,
1.843086, 1.617552, -0.3147316, 1, 1, 1, 1, 1,
1.850319, -0.128529, 0.8526346, 1, 1, 1, 1, 1,
1.860052, 1.061551, -0.6020172, 1, 1, 1, 1, 1,
1.868795, 1.953251, 1.404071, 1, 1, 1, 1, 1,
1.908183, 2.556841, 1.551702, 1, 1, 1, 1, 1,
1.919286, -0.4030559, 2.91734, 1, 1, 1, 1, 1,
1.93426, -0.8517699, 0.8445819, 1, 1, 1, 1, 1,
1.948748, -0.4446015, 4.206166, 1, 1, 1, 1, 1,
2.00938, -1.187094, 1.955752, 1, 1, 1, 1, 1,
2.042995, 0.8378265, 2.465949, 0, 0, 1, 1, 1,
2.054393, -1.955289, 1.821288, 1, 0, 0, 1, 1,
2.055743, -0.00808643, 2.023125, 1, 0, 0, 1, 1,
2.064663, -0.1559638, 1.643367, 1, 0, 0, 1, 1,
2.070745, -0.4767085, 1.652759, 1, 0, 0, 1, 1,
2.072245, 0.3569129, 1.235837, 1, 0, 0, 1, 1,
2.08128, -0.1217844, 2.698897, 0, 0, 0, 1, 1,
2.126241, 1.371229, -0.2319209, 0, 0, 0, 1, 1,
2.31295, 0.6611222, 1.455869, 0, 0, 0, 1, 1,
2.400718, 1.701205, 0.540753, 0, 0, 0, 1, 1,
2.40949, 0.574558, 1.052259, 0, 0, 0, 1, 1,
2.43881, 0.8460447, 0.4449557, 0, 0, 0, 1, 1,
2.488318, 0.7481269, 1.943057, 0, 0, 0, 1, 1,
2.523925, 0.9315872, 2.107573, 1, 1, 1, 1, 1,
2.560828, -0.830262, 2.760502, 1, 1, 1, 1, 1,
2.638974, 0.960825, 1.805166, 1, 1, 1, 1, 1,
2.765065, -0.8927615, 0.8177938, 1, 1, 1, 1, 1,
2.786733, 1.043595, 0.2603605, 1, 1, 1, 1, 1,
2.807557, -0.2652713, 0.5772704, 1, 1, 1, 1, 1,
2.951507, 1.142113, 1.477789, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.278643;
var distance = 32.59084;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.05361164, -0.01112914, -0.4214983 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.59084);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
