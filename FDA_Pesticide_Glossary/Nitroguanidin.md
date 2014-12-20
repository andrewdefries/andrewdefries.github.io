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
-3.465793, 0.4587508, -2.800564, 1, 0, 0, 1,
-2.998651, 0.3063664, 0.3908612, 1, 0.007843138, 0, 1,
-2.931249, -1.680905, 0.4498307, 1, 0.01176471, 0, 1,
-2.848831, -0.0369757, -1.96718, 1, 0.01960784, 0, 1,
-2.700902, 0.1670355, -2.062449, 1, 0.02352941, 0, 1,
-2.671783, -0.7952887, -1.875816, 1, 0.03137255, 0, 1,
-2.566389, 0.9509574, 0.1968622, 1, 0.03529412, 0, 1,
-2.509619, 0.2036031, -0.8833277, 1, 0.04313726, 0, 1,
-2.46678, -0.1818219, -1.847923, 1, 0.04705882, 0, 1,
-2.265617, 0.6472868, -1.514998, 1, 0.05490196, 0, 1,
-2.259158, 0.04692769, -0.395577, 1, 0.05882353, 0, 1,
-2.248896, 0.2924736, -1.33793, 1, 0.06666667, 0, 1,
-2.231273, -0.5627996, -2.210569, 1, 0.07058824, 0, 1,
-2.215075, -0.7718328, -1.283931, 1, 0.07843138, 0, 1,
-2.197068, 0.5644186, -2.316238, 1, 0.08235294, 0, 1,
-2.190169, 2.485666, 0.7591836, 1, 0.09019608, 0, 1,
-2.179516, 1.040068, -1.905846, 1, 0.09411765, 0, 1,
-2.150739, -1.184942, -2.417912, 1, 0.1019608, 0, 1,
-2.15018, 1.232144, -2.668142, 1, 0.1098039, 0, 1,
-2.108713, -2.20753, -4.28227, 1, 0.1137255, 0, 1,
-2.03789, -1.504268, -3.563495, 1, 0.1215686, 0, 1,
-2.03003, -0.6935961, -1.54908, 1, 0.1254902, 0, 1,
-2.021179, 0.6115293, -0.7901738, 1, 0.1333333, 0, 1,
-2.013171, -0.9929013, -2.568861, 1, 0.1372549, 0, 1,
-1.965536, -0.2030641, -1.678922, 1, 0.145098, 0, 1,
-1.944906, -1.551126, -0.002093089, 1, 0.1490196, 0, 1,
-1.941413, 1.442478, -1.899508, 1, 0.1568628, 0, 1,
-1.92422, 0.7914048, -0.08850689, 1, 0.1607843, 0, 1,
-1.923431, -0.03003835, -1.195636, 1, 0.1686275, 0, 1,
-1.903085, -0.7323852, -1.802814, 1, 0.172549, 0, 1,
-1.892593, 1.074854, -1.570094, 1, 0.1803922, 0, 1,
-1.883737, -1.143762, -0.6716393, 1, 0.1843137, 0, 1,
-1.854897, 0.5856917, -0.3543802, 1, 0.1921569, 0, 1,
-1.837859, 1.189421, -0.1318906, 1, 0.1960784, 0, 1,
-1.837198, 0.3615279, -0.2413948, 1, 0.2039216, 0, 1,
-1.823731, 0.08143208, -2.792234, 1, 0.2117647, 0, 1,
-1.793841, 1.321432, -0.4646296, 1, 0.2156863, 0, 1,
-1.79202, 2.077291, -0.4338593, 1, 0.2235294, 0, 1,
-1.784526, -0.2658162, -1.593565, 1, 0.227451, 0, 1,
-1.77103, 1.140426, -1.502588, 1, 0.2352941, 0, 1,
-1.759202, -0.2155271, -2.455891, 1, 0.2392157, 0, 1,
-1.727371, 0.8707833, -1.165206, 1, 0.2470588, 0, 1,
-1.718837, -0.4474073, -0.7560718, 1, 0.2509804, 0, 1,
-1.688135, -0.7029074, -3.410475, 1, 0.2588235, 0, 1,
-1.687923, -0.1291177, -2.261618, 1, 0.2627451, 0, 1,
-1.673988, 0.255889, -2.028012, 1, 0.2705882, 0, 1,
-1.65977, -1.165243, -1.356938, 1, 0.2745098, 0, 1,
-1.655249, -0.8986125, -1.875642, 1, 0.282353, 0, 1,
-1.633206, -0.206886, -1.123798, 1, 0.2862745, 0, 1,
-1.629616, -0.2209134, -1.045489, 1, 0.2941177, 0, 1,
-1.625418, -1.800357, -0.6614997, 1, 0.3019608, 0, 1,
-1.620061, -1.471802, -2.455133, 1, 0.3058824, 0, 1,
-1.612048, 0.07048507, -0.6778446, 1, 0.3137255, 0, 1,
-1.602499, 0.8877943, -0.9186299, 1, 0.3176471, 0, 1,
-1.599147, -0.5489703, -1.695195, 1, 0.3254902, 0, 1,
-1.593874, 0.05911213, -0.6661183, 1, 0.3294118, 0, 1,
-1.593138, 1.377126, 0.1459319, 1, 0.3372549, 0, 1,
-1.588382, -1.606239, -3.185354, 1, 0.3411765, 0, 1,
-1.574346, 0.2545756, -1.946361, 1, 0.3490196, 0, 1,
-1.572316, 0.6023794, 0.3483297, 1, 0.3529412, 0, 1,
-1.571684, -0.246935, -0.5368394, 1, 0.3607843, 0, 1,
-1.564517, -0.1463642, -1.483001, 1, 0.3647059, 0, 1,
-1.562276, -0.2135961, -0.378942, 1, 0.372549, 0, 1,
-1.56136, -1.542375, -1.772485, 1, 0.3764706, 0, 1,
-1.557223, -1.457719, -0.9512884, 1, 0.3843137, 0, 1,
-1.538544, -0.5299715, -2.460899, 1, 0.3882353, 0, 1,
-1.536961, 0.6905499, -2.317131, 1, 0.3960784, 0, 1,
-1.532698, 0.1851678, -0.921553, 1, 0.4039216, 0, 1,
-1.527505, 0.5030923, -1.116414, 1, 0.4078431, 0, 1,
-1.523891, 0.2258027, -2.066046, 1, 0.4156863, 0, 1,
-1.522396, 1.76769, -1.41218, 1, 0.4196078, 0, 1,
-1.519718, 0.4888947, -2.038223, 1, 0.427451, 0, 1,
-1.509268, -0.429176, -2.088197, 1, 0.4313726, 0, 1,
-1.508324, -0.4706838, -1.148512, 1, 0.4392157, 0, 1,
-1.504465, -1.264489, -2.736632, 1, 0.4431373, 0, 1,
-1.489741, -1.256494, -0.985202, 1, 0.4509804, 0, 1,
-1.488931, 1.161869, -0.2397596, 1, 0.454902, 0, 1,
-1.481906, 1.347838, -1.286645, 1, 0.4627451, 0, 1,
-1.470501, -0.2190603, -1.992058, 1, 0.4666667, 0, 1,
-1.45565, 0.6890707, -2.417772, 1, 0.4745098, 0, 1,
-1.446111, 0.1412149, -0.811297, 1, 0.4784314, 0, 1,
-1.41836, 0.3227029, -2.200583, 1, 0.4862745, 0, 1,
-1.41528, -0.6526613, 0.1752462, 1, 0.4901961, 0, 1,
-1.410131, 0.1842431, -1.549639, 1, 0.4980392, 0, 1,
-1.404983, 1.003057, -0.2528264, 1, 0.5058824, 0, 1,
-1.404236, -0.4798684, -2.3608, 1, 0.509804, 0, 1,
-1.402374, -0.5983297, -2.484405, 1, 0.5176471, 0, 1,
-1.394009, 0.1785313, -3.760556, 1, 0.5215687, 0, 1,
-1.363977, -0.02988402, -1.415738, 1, 0.5294118, 0, 1,
-1.363957, 1.54293, -1.824535, 1, 0.5333334, 0, 1,
-1.362241, -0.5206234, -3.641834, 1, 0.5411765, 0, 1,
-1.359843, -0.5673342, -2.30782, 1, 0.5450981, 0, 1,
-1.344408, 0.01947425, -1.153183, 1, 0.5529412, 0, 1,
-1.333562, -0.7423229, -3.693291, 1, 0.5568628, 0, 1,
-1.333489, -0.7275565, -3.062955, 1, 0.5647059, 0, 1,
-1.306911, 0.442518, -1.361912, 1, 0.5686275, 0, 1,
-1.297668, -0.3832804, -1.539885, 1, 0.5764706, 0, 1,
-1.296151, -0.9882526, -3.934284, 1, 0.5803922, 0, 1,
-1.289292, 1.577102, -0.5910932, 1, 0.5882353, 0, 1,
-1.286064, 0.6754955, -0.8927386, 1, 0.5921569, 0, 1,
-1.280888, -1.03948, -2.521324, 1, 0.6, 0, 1,
-1.279307, -0.2684709, -2.585622, 1, 0.6078432, 0, 1,
-1.278592, -0.6751476, -2.310064, 1, 0.6117647, 0, 1,
-1.272664, 0.8425713, -0.866312, 1, 0.6196079, 0, 1,
-1.265102, 1.081235, -0.9851829, 1, 0.6235294, 0, 1,
-1.261172, 0.4282613, -1.564106, 1, 0.6313726, 0, 1,
-1.257632, -0.9221193, -2.113292, 1, 0.6352941, 0, 1,
-1.253059, 0.7819292, 0.4452832, 1, 0.6431373, 0, 1,
-1.240306, 0.996686, -0.222643, 1, 0.6470588, 0, 1,
-1.239062, -0.3399979, -3.038071, 1, 0.654902, 0, 1,
-1.23493, -0.8185071, -0.2624089, 1, 0.6588235, 0, 1,
-1.225386, -0.04032585, -2.229819, 1, 0.6666667, 0, 1,
-1.22378, -1.157661, -2.687602, 1, 0.6705883, 0, 1,
-1.220179, 0.2412648, -0.6601548, 1, 0.6784314, 0, 1,
-1.209664, -0.01828879, -2.043736, 1, 0.682353, 0, 1,
-1.205165, 0.2803679, -2.428179, 1, 0.6901961, 0, 1,
-1.196034, -0.0929053, -1.997066, 1, 0.6941177, 0, 1,
-1.182982, 0.2564431, -1.608427, 1, 0.7019608, 0, 1,
-1.176347, -0.0847378, -1.825324, 1, 0.7098039, 0, 1,
-1.16849, -0.6580866, -1.332726, 1, 0.7137255, 0, 1,
-1.16677, 0.3083421, -0.3772902, 1, 0.7215686, 0, 1,
-1.158891, -0.2130192, -3.157715, 1, 0.7254902, 0, 1,
-1.147016, 0.1130757, -2.944313, 1, 0.7333333, 0, 1,
-1.137136, 0.5895883, -0.5353165, 1, 0.7372549, 0, 1,
-1.131959, -0.771552, -1.642521, 1, 0.7450981, 0, 1,
-1.119846, 0.5888753, -0.1563556, 1, 0.7490196, 0, 1,
-1.113345, 0.636827, -2.177337, 1, 0.7568628, 0, 1,
-1.112607, -0.9248736, -3.394669, 1, 0.7607843, 0, 1,
-1.100101, -0.3036666, -1.578642, 1, 0.7686275, 0, 1,
-1.092124, -0.251046, -2.193155, 1, 0.772549, 0, 1,
-1.068598, 0.9532437, -1.059851, 1, 0.7803922, 0, 1,
-1.063882, 0.4069582, -2.383056, 1, 0.7843137, 0, 1,
-1.052063, 1.574969, -0.229477, 1, 0.7921569, 0, 1,
-1.045177, 1.67911, -0.3642837, 1, 0.7960784, 0, 1,
-1.040366, -0.3213959, -1.618771, 1, 0.8039216, 0, 1,
-1.018467, 0.4903378, -1.159151, 1, 0.8117647, 0, 1,
-1.006678, 1.943135, -1.546844, 1, 0.8156863, 0, 1,
-1.002485, 0.2280579, -0.8738688, 1, 0.8235294, 0, 1,
-0.999063, 1.792971, -0.4965909, 1, 0.827451, 0, 1,
-0.9973484, 2.042537, -1.815925, 1, 0.8352941, 0, 1,
-0.9973276, 0.630592, -0.2432355, 1, 0.8392157, 0, 1,
-0.9936301, -0.3359208, -1.139535, 1, 0.8470588, 0, 1,
-0.9922165, 0.7073119, -1.253268, 1, 0.8509804, 0, 1,
-0.9847151, 0.8092614, -0.9379018, 1, 0.8588235, 0, 1,
-0.9819061, 0.9728272, -1.497797, 1, 0.8627451, 0, 1,
-0.9818378, -0.4077746, -1.497066, 1, 0.8705882, 0, 1,
-0.9769905, -1.174886, -2.290128, 1, 0.8745098, 0, 1,
-0.9752418, 0.2653399, -3.382765, 1, 0.8823529, 0, 1,
-0.9694944, -1.632392, -4.294723, 1, 0.8862745, 0, 1,
-0.9599562, -1.364867, -3.43769, 1, 0.8941177, 0, 1,
-0.955906, -0.1272419, -2.095172, 1, 0.8980392, 0, 1,
-0.9557023, -1.459444, 0.4350959, 1, 0.9058824, 0, 1,
-0.9537118, 0.2449362, -1.744264, 1, 0.9137255, 0, 1,
-0.9530136, -0.05171623, -2.694576, 1, 0.9176471, 0, 1,
-0.9391443, 0.008959306, -1.071546, 1, 0.9254902, 0, 1,
-0.936743, -0.3021115, -0.8812118, 1, 0.9294118, 0, 1,
-0.9341291, 0.3664579, -2.044723, 1, 0.9372549, 0, 1,
-0.9338654, -0.4977555, -2.379993, 1, 0.9411765, 0, 1,
-0.9317825, 0.2888157, -0.5912589, 1, 0.9490196, 0, 1,
-0.927922, -0.3965661, -1.869191, 1, 0.9529412, 0, 1,
-0.9222407, -1.344023, -0.6089488, 1, 0.9607843, 0, 1,
-0.9190784, 0.2866404, -0.2899178, 1, 0.9647059, 0, 1,
-0.9170279, 1.611655, -0.5555465, 1, 0.972549, 0, 1,
-0.9158588, 0.6402662, -0.7868851, 1, 0.9764706, 0, 1,
-0.9138369, -0.6145861, -2.458436, 1, 0.9843137, 0, 1,
-0.9107792, -0.6244147, -3.185104, 1, 0.9882353, 0, 1,
-0.9104537, -0.9985737, -2.70096, 1, 0.9960784, 0, 1,
-0.9098711, 0.2338195, -2.144782, 0.9960784, 1, 0, 1,
-0.9063323, -0.2254253, -1.496881, 0.9921569, 1, 0, 1,
-0.9049125, 0.9585633, -1.348249, 0.9843137, 1, 0, 1,
-0.8949268, 0.3071003, -1.318549, 0.9803922, 1, 0, 1,
-0.8946052, 1.920062, -0.5776457, 0.972549, 1, 0, 1,
-0.8873199, 0.6315234, -2.361309, 0.9686275, 1, 0, 1,
-0.8837426, -1.839645, -3.701078, 0.9607843, 1, 0, 1,
-0.8772133, -0.9563568, -2.92345, 0.9568627, 1, 0, 1,
-0.8770306, 0.1184893, -0.6807615, 0.9490196, 1, 0, 1,
-0.8747075, -1.019644, -2.008094, 0.945098, 1, 0, 1,
-0.8713174, 0.7624575, -1.928597, 0.9372549, 1, 0, 1,
-0.8707097, 1.055887, -1.200717, 0.9333333, 1, 0, 1,
-0.865467, -0.5092088, -2.456463, 0.9254902, 1, 0, 1,
-0.8625211, -0.5128211, -2.991669, 0.9215686, 1, 0, 1,
-0.8609378, 1.119048, -1.693993, 0.9137255, 1, 0, 1,
-0.8566657, 0.4166133, -0.1891697, 0.9098039, 1, 0, 1,
-0.8563979, -0.4139738, -2.822725, 0.9019608, 1, 0, 1,
-0.8547028, -0.8979411, -0.4168954, 0.8941177, 1, 0, 1,
-0.8506602, 0.1784745, 0.342048, 0.8901961, 1, 0, 1,
-0.850328, 1.693192, -0.6938598, 0.8823529, 1, 0, 1,
-0.8468008, -0.120047, -2.435304, 0.8784314, 1, 0, 1,
-0.8452094, -0.526045, -1.15125, 0.8705882, 1, 0, 1,
-0.835486, 0.5881678, 1.202402, 0.8666667, 1, 0, 1,
-0.8341544, 0.802301, 0.2131419, 0.8588235, 1, 0, 1,
-0.8315865, 0.2839871, -0.1954593, 0.854902, 1, 0, 1,
-0.8314968, -3.130292, -3.225887, 0.8470588, 1, 0, 1,
-0.8251826, -1.51587, -2.276006, 0.8431373, 1, 0, 1,
-0.8235322, -0.05716616, -2.168303, 0.8352941, 1, 0, 1,
-0.8205224, 1.009201, -0.1815094, 0.8313726, 1, 0, 1,
-0.8079986, -0.637893, 0.2207373, 0.8235294, 1, 0, 1,
-0.8031071, 2.06408, -0.6717194, 0.8196079, 1, 0, 1,
-0.8006157, -1.369794, -0.8666174, 0.8117647, 1, 0, 1,
-0.7995912, 1.251934, -1.40136, 0.8078431, 1, 0, 1,
-0.7985286, -0.6358396, -2.768965, 0.8, 1, 0, 1,
-0.7983893, 0.684126, -1.506544, 0.7921569, 1, 0, 1,
-0.7923583, -0.1373892, -2.424378, 0.7882353, 1, 0, 1,
-0.7902543, -0.05124783, -2.841941, 0.7803922, 1, 0, 1,
-0.7873362, 0.4049803, -0.2208285, 0.7764706, 1, 0, 1,
-0.7854689, 3.537942, -3.62917, 0.7686275, 1, 0, 1,
-0.7834869, 1.419189, 0.7026734, 0.7647059, 1, 0, 1,
-0.7834235, -1.08145, -3.073134, 0.7568628, 1, 0, 1,
-0.7728819, -0.3696416, -1.354695, 0.7529412, 1, 0, 1,
-0.7649943, 0.1839681, -0.8618752, 0.7450981, 1, 0, 1,
-0.7493875, 1.548062, -0.5993118, 0.7411765, 1, 0, 1,
-0.7484413, 1.230031, 0.9108981, 0.7333333, 1, 0, 1,
-0.7474881, -0.570598, -2.463009, 0.7294118, 1, 0, 1,
-0.7434595, -0.1107181, -2.675254, 0.7215686, 1, 0, 1,
-0.7385713, 1.376152, -1.234085, 0.7176471, 1, 0, 1,
-0.7336743, -0.2311521, -2.696148, 0.7098039, 1, 0, 1,
-0.7321714, 1.280396, -1.826985, 0.7058824, 1, 0, 1,
-0.7298583, -0.7272834, -2.244914, 0.6980392, 1, 0, 1,
-0.7275608, -0.7601785, -2.890686, 0.6901961, 1, 0, 1,
-0.7267414, 0.0116816, -1.764954, 0.6862745, 1, 0, 1,
-0.7212148, -0.2602057, -2.831842, 0.6784314, 1, 0, 1,
-0.7192639, -1.060291, -2.297379, 0.6745098, 1, 0, 1,
-0.716938, -1.279518, -1.547873, 0.6666667, 1, 0, 1,
-0.7153546, 0.7762508, -2.432488, 0.6627451, 1, 0, 1,
-0.7135693, 0.5275826, -1.28194, 0.654902, 1, 0, 1,
-0.7097707, -0.3003032, -2.159695, 0.6509804, 1, 0, 1,
-0.7078534, 0.830582, -1.461178, 0.6431373, 1, 0, 1,
-0.7055593, 0.9099316, 1.874325, 0.6392157, 1, 0, 1,
-0.7005614, -2.073715, -1.189963, 0.6313726, 1, 0, 1,
-0.7003562, 0.1992769, -1.712711, 0.627451, 1, 0, 1,
-0.6980891, 0.2288576, -1.475367, 0.6196079, 1, 0, 1,
-0.6943906, -0.047398, -1.30453, 0.6156863, 1, 0, 1,
-0.6898725, -0.3811051, -0.7802715, 0.6078432, 1, 0, 1,
-0.6886014, 0.1613645, -2.016806, 0.6039216, 1, 0, 1,
-0.6883229, -0.5498303, -3.077443, 0.5960785, 1, 0, 1,
-0.6868463, -1.331139, -1.810786, 0.5882353, 1, 0, 1,
-0.6832869, 0.3801142, -1.296312, 0.5843138, 1, 0, 1,
-0.681356, 0.07100419, -2.017282, 0.5764706, 1, 0, 1,
-0.6787686, 0.2072337, -0.7444788, 0.572549, 1, 0, 1,
-0.6779853, 1.483281, 1.582797, 0.5647059, 1, 0, 1,
-0.6754936, 0.2462783, 0.6082702, 0.5607843, 1, 0, 1,
-0.6749302, -0.5581649, -2.709901, 0.5529412, 1, 0, 1,
-0.67168, 1.157586, -0.4686516, 0.5490196, 1, 0, 1,
-0.6712394, 0.7475962, -1.321149, 0.5411765, 1, 0, 1,
-0.6634858, 0.0644266, -1.218028, 0.5372549, 1, 0, 1,
-0.6630061, 0.329971, -1.69305, 0.5294118, 1, 0, 1,
-0.6602703, 0.8294669, -0.5618452, 0.5254902, 1, 0, 1,
-0.6582814, -0.4315231, -3.311002, 0.5176471, 1, 0, 1,
-0.6576997, -0.4323326, -3.244441, 0.5137255, 1, 0, 1,
-0.65544, 0.3750653, -2.150149, 0.5058824, 1, 0, 1,
-0.6552973, -0.3686294, -3.014742, 0.5019608, 1, 0, 1,
-0.654256, 0.6876674, -1.409019, 0.4941176, 1, 0, 1,
-0.6500266, -0.3428935, -0.6604081, 0.4862745, 1, 0, 1,
-0.6494744, -0.3076379, -2.085442, 0.4823529, 1, 0, 1,
-0.6475151, -0.1075432, -3.421497, 0.4745098, 1, 0, 1,
-0.6411166, -0.1174282, -2.403503, 0.4705882, 1, 0, 1,
-0.6393465, 0.3370665, -0.1771547, 0.4627451, 1, 0, 1,
-0.6376736, 0.6929061, -1.289445, 0.4588235, 1, 0, 1,
-0.6366443, -0.7580408, -0.5592071, 0.4509804, 1, 0, 1,
-0.6261038, 0.9261423, -0.4893318, 0.4470588, 1, 0, 1,
-0.6251228, -0.3234519, -2.694141, 0.4392157, 1, 0, 1,
-0.6248401, -1.101062, -3.567089, 0.4352941, 1, 0, 1,
-0.623049, 1.173152, -1.136262, 0.427451, 1, 0, 1,
-0.6198101, 1.405252, -1.698525, 0.4235294, 1, 0, 1,
-0.6190922, 0.7047487, 0.04099329, 0.4156863, 1, 0, 1,
-0.605625, 0.6224945, -0.6197953, 0.4117647, 1, 0, 1,
-0.5972481, -0.2100953, -2.396584, 0.4039216, 1, 0, 1,
-0.5970805, 0.01687524, -3.068905, 0.3960784, 1, 0, 1,
-0.5969973, 0.4621238, -0.4530694, 0.3921569, 1, 0, 1,
-0.5941898, 0.2367334, -0.5172662, 0.3843137, 1, 0, 1,
-0.5841136, 1.42426, -0.02769684, 0.3803922, 1, 0, 1,
-0.5836819, -1.320222, -3.822368, 0.372549, 1, 0, 1,
-0.580992, 0.9755603, 0.6766756, 0.3686275, 1, 0, 1,
-0.5809607, 0.01932939, -0.6370991, 0.3607843, 1, 0, 1,
-0.5780183, -1.940819, -3.600571, 0.3568628, 1, 0, 1,
-0.5635074, -1.292226, -2.927601, 0.3490196, 1, 0, 1,
-0.5596517, 0.9410468, 0.3708788, 0.345098, 1, 0, 1,
-0.5548729, 0.8616142, -0.2700681, 0.3372549, 1, 0, 1,
-0.5510143, -0.4509458, -2.10352, 0.3333333, 1, 0, 1,
-0.5503145, 2.394372, -0.4847089, 0.3254902, 1, 0, 1,
-0.5359533, -0.09201507, -1.796381, 0.3215686, 1, 0, 1,
-0.5359045, 0.1010362, -1.019603, 0.3137255, 1, 0, 1,
-0.5307491, -0.690906, -2.431237, 0.3098039, 1, 0, 1,
-0.5206729, -1.46119, -2.238965, 0.3019608, 1, 0, 1,
-0.5199572, 0.3460117, 0.4186742, 0.2941177, 1, 0, 1,
-0.5169063, -0.2676527, 0.4854943, 0.2901961, 1, 0, 1,
-0.5139078, 0.6288586, 0.01954858, 0.282353, 1, 0, 1,
-0.5093365, 0.1967366, -3.425535, 0.2784314, 1, 0, 1,
-0.5082745, -0.5654758, -1.837478, 0.2705882, 1, 0, 1,
-0.5069376, -0.03356264, -0.6527984, 0.2666667, 1, 0, 1,
-0.5018959, 1.402747, 0.03988872, 0.2588235, 1, 0, 1,
-0.4963345, -0.9385054, -4.124318, 0.254902, 1, 0, 1,
-0.4957722, -0.7932438, -4.126034, 0.2470588, 1, 0, 1,
-0.4933147, 0.8879715, 0.3460867, 0.2431373, 1, 0, 1,
-0.4927273, -0.3668053, -1.268203, 0.2352941, 1, 0, 1,
-0.4920452, 0.8241916, -0.4655193, 0.2313726, 1, 0, 1,
-0.4910069, 1.353283, -1.617536, 0.2235294, 1, 0, 1,
-0.4889982, 1.187673, -1.062679, 0.2196078, 1, 0, 1,
-0.4814751, 0.761847, 0.3826184, 0.2117647, 1, 0, 1,
-0.4782871, 1.382921, -2.18277, 0.2078431, 1, 0, 1,
-0.4672325, -0.3892576, -1.897255, 0.2, 1, 0, 1,
-0.4644561, 1.981186, 0.2184222, 0.1921569, 1, 0, 1,
-0.4628836, -1.232577, -3.079063, 0.1882353, 1, 0, 1,
-0.4570806, 0.5518032, 0.1551872, 0.1803922, 1, 0, 1,
-0.4500784, 0.8636717, -0.9803034, 0.1764706, 1, 0, 1,
-0.4420998, -2.07829, -3.643776, 0.1686275, 1, 0, 1,
-0.4402468, 0.5998594, -0.1689559, 0.1647059, 1, 0, 1,
-0.4379564, 0.04612366, 0.4669386, 0.1568628, 1, 0, 1,
-0.4349451, -0.8668683, -1.422662, 0.1529412, 1, 0, 1,
-0.4329849, 1.025051, -1.011024, 0.145098, 1, 0, 1,
-0.4317908, 0.31376, -1.188385, 0.1411765, 1, 0, 1,
-0.4309079, 0.08370467, -1.431088, 0.1333333, 1, 0, 1,
-0.4292459, 0.4786461, -1.23736, 0.1294118, 1, 0, 1,
-0.426425, 1.376466, 1.488609, 0.1215686, 1, 0, 1,
-0.4257093, 0.1369659, -1.2217, 0.1176471, 1, 0, 1,
-0.4232855, 0.2279672, -1.519968, 0.1098039, 1, 0, 1,
-0.4207418, -1.171535, -2.248145, 0.1058824, 1, 0, 1,
-0.4169452, -0.836533, -2.615832, 0.09803922, 1, 0, 1,
-0.4160604, -0.797058, -3.206401, 0.09019608, 1, 0, 1,
-0.4124091, 0.4456881, -0.2997669, 0.08627451, 1, 0, 1,
-0.4102979, -0.7744335, -1.017967, 0.07843138, 1, 0, 1,
-0.408318, -1.504337, -4.272959, 0.07450981, 1, 0, 1,
-0.4008491, -0.3736776, -1.281234, 0.06666667, 1, 0, 1,
-0.4003963, 0.7442506, 0.7743277, 0.0627451, 1, 0, 1,
-0.4003537, 0.9677872, 0.7583458, 0.05490196, 1, 0, 1,
-0.3997053, -0.8977134, -2.775655, 0.05098039, 1, 0, 1,
-0.3951572, 0.7930107, 0.5039192, 0.04313726, 1, 0, 1,
-0.392528, 1.316379, -1.645749, 0.03921569, 1, 0, 1,
-0.3889156, 0.3595239, -0.5349783, 0.03137255, 1, 0, 1,
-0.3853434, 2.293241, 2.242702, 0.02745098, 1, 0, 1,
-0.3843087, -0.04301954, -2.2217, 0.01960784, 1, 0, 1,
-0.3838911, -1.008247, -1.96041, 0.01568628, 1, 0, 1,
-0.3812206, -2.255821, -2.87149, 0.007843138, 1, 0, 1,
-0.3797415, 0.3102536, -0.9757036, 0.003921569, 1, 0, 1,
-0.3774698, 1.124573, -1.314504, 0, 1, 0.003921569, 1,
-0.3771008, 0.05034522, 0.04812758, 0, 1, 0.01176471, 1,
-0.3673528, 1.258353, -0.3626188, 0, 1, 0.01568628, 1,
-0.36437, -1.07901, -1.258642, 0, 1, 0.02352941, 1,
-0.3588682, -0.1208385, -2.355613, 0, 1, 0.02745098, 1,
-0.3561553, 0.533061, -1.767049, 0, 1, 0.03529412, 1,
-0.3524685, -1.258094, -3.826886, 0, 1, 0.03921569, 1,
-0.3515491, -0.08133408, -1.293721, 0, 1, 0.04705882, 1,
-0.3511943, -0.03282224, -1.500454, 0, 1, 0.05098039, 1,
-0.3510917, 0.1887667, -1.09158, 0, 1, 0.05882353, 1,
-0.3496746, 0.08585829, -1.518414, 0, 1, 0.0627451, 1,
-0.3433548, -0.2333066, -4.305792, 0, 1, 0.07058824, 1,
-0.3409359, -0.1331208, -1.358917, 0, 1, 0.07450981, 1,
-0.3388337, -0.8898865, -2.033917, 0, 1, 0.08235294, 1,
-0.3383687, 0.4814004, -0.6326975, 0, 1, 0.08627451, 1,
-0.3310742, 0.7231851, -0.2743946, 0, 1, 0.09411765, 1,
-0.3301029, -0.2043781, -1.188143, 0, 1, 0.1019608, 1,
-0.3278015, 1.410138, -0.3080864, 0, 1, 0.1058824, 1,
-0.3174986, -0.1210835, -1.588513, 0, 1, 0.1137255, 1,
-0.3131948, -0.9932101, -2.407511, 0, 1, 0.1176471, 1,
-0.3124833, 0.54918, -1.442011, 0, 1, 0.1254902, 1,
-0.3115114, -0.1706382, -1.970209, 0, 1, 0.1294118, 1,
-0.3104272, 1.127905, -0.7845157, 0, 1, 0.1372549, 1,
-0.3061422, 0.6500922, -0.2915638, 0, 1, 0.1411765, 1,
-0.2965456, -0.06712002, -0.9893543, 0, 1, 0.1490196, 1,
-0.2951657, -0.4783518, 0.5965573, 0, 1, 0.1529412, 1,
-0.2895963, -0.05399503, -3.062746, 0, 1, 0.1607843, 1,
-0.2893284, 0.3776712, -1.409644, 0, 1, 0.1647059, 1,
-0.2823917, 2.590064, 1.388245, 0, 1, 0.172549, 1,
-0.2796346, -1.365424, -2.038295, 0, 1, 0.1764706, 1,
-0.2770018, 0.08755843, 0.1711011, 0, 1, 0.1843137, 1,
-0.2628441, -0.09386079, -2.300822, 0, 1, 0.1882353, 1,
-0.2618346, -0.8658024, -2.903524, 0, 1, 0.1960784, 1,
-0.2610133, 0.942329, -0.4186133, 0, 1, 0.2039216, 1,
-0.2586844, 1.542683, 1.823358, 0, 1, 0.2078431, 1,
-0.2578746, 0.1156208, -2.412235, 0, 1, 0.2156863, 1,
-0.2573022, -0.1791877, -2.028124, 0, 1, 0.2196078, 1,
-0.2539474, -1.236968, -2.527251, 0, 1, 0.227451, 1,
-0.2470824, 1.661044, 0.4421052, 0, 1, 0.2313726, 1,
-0.2465182, 0.3135228, -1.242879, 0, 1, 0.2392157, 1,
-0.2458861, 0.2344883, -2.245213, 0, 1, 0.2431373, 1,
-0.2431776, -0.601384, -4.122973, 0, 1, 0.2509804, 1,
-0.2431415, -1.821952, -3.702583, 0, 1, 0.254902, 1,
-0.2424524, -0.07152018, -0.5043508, 0, 1, 0.2627451, 1,
-0.2393608, -0.2303533, -2.090193, 0, 1, 0.2666667, 1,
-0.2362131, -0.6606779, -3.155117, 0, 1, 0.2745098, 1,
-0.2334149, 0.01142952, -1.84587, 0, 1, 0.2784314, 1,
-0.2321399, -1.299348, -2.844416, 0, 1, 0.2862745, 1,
-0.2298834, 0.09090291, -1.574178, 0, 1, 0.2901961, 1,
-0.2289941, -1.261278, -2.533204, 0, 1, 0.2980392, 1,
-0.2265893, 0.8862606, 1.959387, 0, 1, 0.3058824, 1,
-0.2231031, -0.9323696, -2.300283, 0, 1, 0.3098039, 1,
-0.223027, 1.529478, -0.7208861, 0, 1, 0.3176471, 1,
-0.2209934, -0.7385265, -3.85296, 0, 1, 0.3215686, 1,
-0.2209339, -0.7361383, -3.534346, 0, 1, 0.3294118, 1,
-0.2184907, -1.3707, -1.172823, 0, 1, 0.3333333, 1,
-0.2155961, 1.082786, -1.085472, 0, 1, 0.3411765, 1,
-0.2137306, -0.6603911, -3.361674, 0, 1, 0.345098, 1,
-0.2096345, 0.14269, -2.545638, 0, 1, 0.3529412, 1,
-0.2074382, 0.2944596, 0.1892287, 0, 1, 0.3568628, 1,
-0.2040841, -0.0667118, -1.483441, 0, 1, 0.3647059, 1,
-0.203366, -0.3342262, -2.520617, 0, 1, 0.3686275, 1,
-0.2007975, 0.04517495, -1.005566, 0, 1, 0.3764706, 1,
-0.2003457, -1.147196, -3.967326, 0, 1, 0.3803922, 1,
-0.1951985, -0.2947724, -2.100684, 0, 1, 0.3882353, 1,
-0.1937361, -1.356067, -2.059772, 0, 1, 0.3921569, 1,
-0.1891162, -1.911486, -2.310464, 0, 1, 0.4, 1,
-0.1884694, -1.163978, -3.242439, 0, 1, 0.4078431, 1,
-0.1882948, 3.238512, 0.6125448, 0, 1, 0.4117647, 1,
-0.186069, 0.3781342, 0.9254827, 0, 1, 0.4196078, 1,
-0.1846568, 0.4790729, 0.2901488, 0, 1, 0.4235294, 1,
-0.1834495, 1.177994, -1.067921, 0, 1, 0.4313726, 1,
-0.1815152, -1.00816, -2.259815, 0, 1, 0.4352941, 1,
-0.176116, 0.8456185, -0.97685, 0, 1, 0.4431373, 1,
-0.1750389, -1.361454, -2.984102, 0, 1, 0.4470588, 1,
-0.173654, -0.9132869, -3.717348, 0, 1, 0.454902, 1,
-0.1711927, -0.9440674, -3.602361, 0, 1, 0.4588235, 1,
-0.1682588, 0.4793746, 1.256045, 0, 1, 0.4666667, 1,
-0.167239, -0.06879633, -1.173174, 0, 1, 0.4705882, 1,
-0.1634147, -0.5898427, -2.066407, 0, 1, 0.4784314, 1,
-0.1613816, -0.2986777, -4.887555, 0, 1, 0.4823529, 1,
-0.1603359, 0.1314729, 0.6816288, 0, 1, 0.4901961, 1,
-0.1591252, 0.6223252, 0.2300003, 0, 1, 0.4941176, 1,
-0.1574463, -0.5677558, -3.822967, 0, 1, 0.5019608, 1,
-0.1569613, -0.6770432, -3.608853, 0, 1, 0.509804, 1,
-0.1548264, -1.043038, -3.530901, 0, 1, 0.5137255, 1,
-0.1534399, 0.2229717, -2.337207, 0, 1, 0.5215687, 1,
-0.1531391, 0.8173504, 0.8432404, 0, 1, 0.5254902, 1,
-0.1482147, -0.2769088, -2.146929, 0, 1, 0.5333334, 1,
-0.1447259, -1.145203, -3.364531, 0, 1, 0.5372549, 1,
-0.1402925, 0.3226404, 0.4303815, 0, 1, 0.5450981, 1,
-0.139991, -0.2005533, -3.667465, 0, 1, 0.5490196, 1,
-0.1393285, 2.245634, -0.6685752, 0, 1, 0.5568628, 1,
-0.1349114, 1.231914, -0.2454343, 0, 1, 0.5607843, 1,
-0.1326736, 0.4480007, -0.05874376, 0, 1, 0.5686275, 1,
-0.1307958, 1.582109, 0.1497095, 0, 1, 0.572549, 1,
-0.1252111, 0.713249, 1.006515, 0, 1, 0.5803922, 1,
-0.1248763, -1.140688, -3.233477, 0, 1, 0.5843138, 1,
-0.1205424, 1.718232, 0.02296896, 0, 1, 0.5921569, 1,
-0.1189848, 1.314259, -0.7982389, 0, 1, 0.5960785, 1,
-0.1177138, 1.259632, 0.7506508, 0, 1, 0.6039216, 1,
-0.1169348, 1.473446, 0.2739066, 0, 1, 0.6117647, 1,
-0.1157167, -2.164624, -4.072243, 0, 1, 0.6156863, 1,
-0.108008, -0.3392113, -4.147107, 0, 1, 0.6235294, 1,
-0.1046205, -0.6992039, -1.870221, 0, 1, 0.627451, 1,
-0.1032984, 0.1642411, -0.5256411, 0, 1, 0.6352941, 1,
-0.09948781, -1.04011, -2.055702, 0, 1, 0.6392157, 1,
-0.09855637, 0.478975, 0.4160787, 0, 1, 0.6470588, 1,
-0.09855323, 1.418607, 1.412039, 0, 1, 0.6509804, 1,
-0.09799075, -0.422458, -4.184387, 0, 1, 0.6588235, 1,
-0.09486946, -0.05217467, -0.5485096, 0, 1, 0.6627451, 1,
-0.09437529, 0.7475368, 0.3128636, 0, 1, 0.6705883, 1,
-0.08648632, -0.6620349, -4.055198, 0, 1, 0.6745098, 1,
-0.08451581, 0.4901941, -1.745497, 0, 1, 0.682353, 1,
-0.07799991, 2.812739, -0.7118366, 0, 1, 0.6862745, 1,
-0.07406323, 1.050581, 0.2909147, 0, 1, 0.6941177, 1,
-0.07350771, -0.3496891, -1.766229, 0, 1, 0.7019608, 1,
-0.07318146, -0.8944761, -1.992484, 0, 1, 0.7058824, 1,
-0.07269481, 2.128632, -0.4598177, 0, 1, 0.7137255, 1,
-0.07080448, -0.709159, -3.667887, 0, 1, 0.7176471, 1,
-0.07011484, 0.1638063, 1.400499, 0, 1, 0.7254902, 1,
-0.06868354, 0.6811245, -0.6493522, 0, 1, 0.7294118, 1,
-0.06402066, -0.574062, -2.422294, 0, 1, 0.7372549, 1,
-0.05492971, 1.726268, -0.8520724, 0, 1, 0.7411765, 1,
-0.05052144, 0.1280635, 1.212553, 0, 1, 0.7490196, 1,
-0.05043596, 0.2141955, -1.783765, 0, 1, 0.7529412, 1,
-0.05012453, -1.467874, -2.284281, 0, 1, 0.7607843, 1,
-0.0455034, 0.4111066, -1.059791, 0, 1, 0.7647059, 1,
-0.04404499, -0.9726046, -3.345138, 0, 1, 0.772549, 1,
-0.03934087, -0.8115172, -2.419014, 0, 1, 0.7764706, 1,
-0.03909242, 0.4065208, -0.06301279, 0, 1, 0.7843137, 1,
-0.03507867, 1.827081, 1.086057, 0, 1, 0.7882353, 1,
-0.03378127, -0.6928475, -3.196119, 0, 1, 0.7960784, 1,
-0.03037232, 0.2869019, 0.9737207, 0, 1, 0.8039216, 1,
-0.03027645, 0.3514359, 0.5077758, 0, 1, 0.8078431, 1,
-0.0270134, 0.4204667, -0.4389479, 0, 1, 0.8156863, 1,
-0.02404452, -2.490127, -6.816693, 0, 1, 0.8196079, 1,
-0.01978625, -0.7080972, -1.41117, 0, 1, 0.827451, 1,
-0.01804189, 0.3563672, 1.547716, 0, 1, 0.8313726, 1,
-0.01779401, -0.1379434, -3.716223, 0, 1, 0.8392157, 1,
-0.01651935, -0.1742236, -6.205942, 0, 1, 0.8431373, 1,
-0.01648437, 1.494078, -0.4888804, 0, 1, 0.8509804, 1,
-0.007931432, 0.811353, 1.347251, 0, 1, 0.854902, 1,
-0.006835602, 1.523005, -1.351918, 0, 1, 0.8627451, 1,
-0.004024693, 0.2988779, -0.2191804, 0, 1, 0.8666667, 1,
-0.001356197, 0.5427873, 2.203609, 0, 1, 0.8745098, 1,
-0.000335536, -0.6987432, -4.79403, 0, 1, 0.8784314, 1,
0.000277834, 0.6910281, -0.9284208, 0, 1, 0.8862745, 1,
0.01009625, 0.3197444, 1.212403, 0, 1, 0.8901961, 1,
0.01042646, 0.6045887, 1.328118, 0, 1, 0.8980392, 1,
0.01277416, -2.484808, 4.329567, 0, 1, 0.9058824, 1,
0.01379369, 0.5802564, -1.111003, 0, 1, 0.9098039, 1,
0.01400149, 0.831901, -0.7476934, 0, 1, 0.9176471, 1,
0.01655998, 0.4011993, 0.6413792, 0, 1, 0.9215686, 1,
0.01658689, -2.117345, 2.291941, 0, 1, 0.9294118, 1,
0.01805573, -0.2357257, 2.881277, 0, 1, 0.9333333, 1,
0.02686654, -1.5853, 4.475701, 0, 1, 0.9411765, 1,
0.02789819, -0.1066895, 2.581911, 0, 1, 0.945098, 1,
0.02831945, 0.776596, 0.08028804, 0, 1, 0.9529412, 1,
0.03027286, 0.6536103, 0.9371677, 0, 1, 0.9568627, 1,
0.03500856, -1.230325, 1.923176, 0, 1, 0.9647059, 1,
0.03848881, 0.2142705, 0.6983693, 0, 1, 0.9686275, 1,
0.04036381, 0.5969425, 1.192005, 0, 1, 0.9764706, 1,
0.0416624, 0.986149, 0.4185019, 0, 1, 0.9803922, 1,
0.04743339, -1.497443, 3.977506, 0, 1, 0.9882353, 1,
0.04748939, 0.8854949, -1.48519, 0, 1, 0.9921569, 1,
0.05472205, 0.3118986, 1.134327, 0, 1, 1, 1,
0.05585277, 0.8130577, 0.8674783, 0, 0.9921569, 1, 1,
0.05587158, -0.5914725, 2.042577, 0, 0.9882353, 1, 1,
0.07148848, -0.7656217, 4.71662, 0, 0.9803922, 1, 1,
0.072739, 0.5859206, -0.2980983, 0, 0.9764706, 1, 1,
0.07604813, 0.3920938, -0.1586648, 0, 0.9686275, 1, 1,
0.07703904, 0.1930509, 1.465804, 0, 0.9647059, 1, 1,
0.0776678, 1.652607, -0.2036667, 0, 0.9568627, 1, 1,
0.07939582, 0.5882714, -0.3592344, 0, 0.9529412, 1, 1,
0.08158757, -0.8522643, 2.267658, 0, 0.945098, 1, 1,
0.08625721, 0.3326302, -0.8952665, 0, 0.9411765, 1, 1,
0.09728886, 0.1108793, 0.902035, 0, 0.9333333, 1, 1,
0.09918777, 0.6052514, -0.6685324, 0, 0.9294118, 1, 1,
0.1103992, 1.65727, 1.722608, 0, 0.9215686, 1, 1,
0.1120592, -0.2442857, 1.43042, 0, 0.9176471, 1, 1,
0.112443, 1.453739, -0.9701605, 0, 0.9098039, 1, 1,
0.1166608, -0.06688026, 2.60338, 0, 0.9058824, 1, 1,
0.1221453, 0.04994736, 1.927962, 0, 0.8980392, 1, 1,
0.122477, 0.7576464, -0.7794883, 0, 0.8901961, 1, 1,
0.123197, 0.5346084, 1.841978, 0, 0.8862745, 1, 1,
0.1236429, 0.5992381, 1.169448, 0, 0.8784314, 1, 1,
0.1256706, 1.059533, -0.4613908, 0, 0.8745098, 1, 1,
0.1286111, -0.09366263, 1.416518, 0, 0.8666667, 1, 1,
0.1296477, 0.1011072, 0.4567344, 0, 0.8627451, 1, 1,
0.1314519, -2.347382, 2.906803, 0, 0.854902, 1, 1,
0.1360007, -0.0327559, 1.546836, 0, 0.8509804, 1, 1,
0.1387914, -1.154611, 2.158104, 0, 0.8431373, 1, 1,
0.1394378, -1.619555, 4.825363, 0, 0.8392157, 1, 1,
0.1409262, -0.5005181, 2.805729, 0, 0.8313726, 1, 1,
0.1412605, 0.6582907, -0.1069457, 0, 0.827451, 1, 1,
0.1477882, 0.4028329, -0.6741287, 0, 0.8196079, 1, 1,
0.1488964, 0.4855553, 0.6081473, 0, 0.8156863, 1, 1,
0.1494599, 2.356746, -0.01967117, 0, 0.8078431, 1, 1,
0.1576428, 2.016966, -0.6418273, 0, 0.8039216, 1, 1,
0.1586431, -1.047346, 3.748947, 0, 0.7960784, 1, 1,
0.1609636, 0.1212975, 2.327984, 0, 0.7882353, 1, 1,
0.1640711, 2.271752, 0.992541, 0, 0.7843137, 1, 1,
0.1730067, -1.438984, 3.360466, 0, 0.7764706, 1, 1,
0.1737655, -0.01107726, 0.2007574, 0, 0.772549, 1, 1,
0.1760841, -1.437572, 3.517923, 0, 0.7647059, 1, 1,
0.1777798, -0.5709938, 2.097447, 0, 0.7607843, 1, 1,
0.1801578, 0.9375165, 0.09501658, 0, 0.7529412, 1, 1,
0.1802773, -0.111118, 0.4684801, 0, 0.7490196, 1, 1,
0.1811971, -3.265926, 3.791202, 0, 0.7411765, 1, 1,
0.1833803, -1.759631, 4.52686, 0, 0.7372549, 1, 1,
0.1843673, 1.102356, 0.791577, 0, 0.7294118, 1, 1,
0.1844355, 2.359101, -2.296507, 0, 0.7254902, 1, 1,
0.1878503, -1.745377, 3.98988, 0, 0.7176471, 1, 1,
0.1881255, 0.01725875, 1.570782, 0, 0.7137255, 1, 1,
0.1904625, -0.8264878, 0.9604806, 0, 0.7058824, 1, 1,
0.1916219, 0.9263854, -0.5002424, 0, 0.6980392, 1, 1,
0.1933507, 0.007415064, 1.404841, 0, 0.6941177, 1, 1,
0.1950664, -2.168444, 2.60662, 0, 0.6862745, 1, 1,
0.2001477, -0.3184025, 3.205425, 0, 0.682353, 1, 1,
0.2040904, -0.7920164, 2.994694, 0, 0.6745098, 1, 1,
0.2043715, 0.8032041, 0.449036, 0, 0.6705883, 1, 1,
0.2051706, 0.5647598, -0.5420177, 0, 0.6627451, 1, 1,
0.2072019, 0.02381593, 2.250791, 0, 0.6588235, 1, 1,
0.207928, -0.8811051, 2.666974, 0, 0.6509804, 1, 1,
0.208431, -0.4802675, 3.741615, 0, 0.6470588, 1, 1,
0.2093092, -0.165802, 1.980338, 0, 0.6392157, 1, 1,
0.2098643, 1.173467, 1.377396, 0, 0.6352941, 1, 1,
0.2124001, -0.990151, 3.826433, 0, 0.627451, 1, 1,
0.2143007, -0.7783013, 2.566642, 0, 0.6235294, 1, 1,
0.2163682, 0.4101961, -0.2241238, 0, 0.6156863, 1, 1,
0.217549, -0.3645689, 1.922856, 0, 0.6117647, 1, 1,
0.2178097, 0.4064622, 1.273487, 0, 0.6039216, 1, 1,
0.2189661, 1.174139, -0.2401736, 0, 0.5960785, 1, 1,
0.2219668, 0.9537609, 2.461329, 0, 0.5921569, 1, 1,
0.2237668, 1.405165, 0.4789599, 0, 0.5843138, 1, 1,
0.2237846, 0.3314597, 1.573946, 0, 0.5803922, 1, 1,
0.2258505, 0.8578345, -1.428005, 0, 0.572549, 1, 1,
0.2278886, -0.2254997, 2.823347, 0, 0.5686275, 1, 1,
0.2282746, 0.8554793, 1.786109, 0, 0.5607843, 1, 1,
0.2326726, 0.8538537, -0.2681471, 0, 0.5568628, 1, 1,
0.2329196, 0.4544888, 0.771045, 0, 0.5490196, 1, 1,
0.2363732, -1.829283, 3.38692, 0, 0.5450981, 1, 1,
0.2389453, -2.276518, 4.722219, 0, 0.5372549, 1, 1,
0.2409392, -1.041126, 3.121155, 0, 0.5333334, 1, 1,
0.2416921, 1.399963, 0.4984965, 0, 0.5254902, 1, 1,
0.2436509, -0.3552193, 2.426313, 0, 0.5215687, 1, 1,
0.2445073, -0.4100235, 3.19197, 0, 0.5137255, 1, 1,
0.2488852, -0.8761185, 3.140994, 0, 0.509804, 1, 1,
0.2515743, -0.3952602, 0.2251566, 0, 0.5019608, 1, 1,
0.2579931, -0.2898932, 1.187608, 0, 0.4941176, 1, 1,
0.2581864, 0.9486223, 2.315712, 0, 0.4901961, 1, 1,
0.2611598, -0.3951545, 1.33221, 0, 0.4823529, 1, 1,
0.2641793, -0.1046497, 2.295261, 0, 0.4784314, 1, 1,
0.2657569, 0.8691293, 0.3731625, 0, 0.4705882, 1, 1,
0.2723858, 0.4236459, 0.7971197, 0, 0.4666667, 1, 1,
0.27371, -1.355908, 3.198058, 0, 0.4588235, 1, 1,
0.27416, -0.5553623, 2.003175, 0, 0.454902, 1, 1,
0.2745267, -0.5321845, 2.161867, 0, 0.4470588, 1, 1,
0.2795214, 0.2852667, 1.461995, 0, 0.4431373, 1, 1,
0.2796647, 1.180014, 2.230282, 0, 0.4352941, 1, 1,
0.2835744, -1.362847, 3.015846, 0, 0.4313726, 1, 1,
0.2878994, 2.301316, -0.02851626, 0, 0.4235294, 1, 1,
0.2915029, -0.05603669, 0.6132302, 0, 0.4196078, 1, 1,
0.2923318, 0.2523016, 2.765298, 0, 0.4117647, 1, 1,
0.2930178, -1.281616, 1.773353, 0, 0.4078431, 1, 1,
0.2944637, -1.745461, 1.785266, 0, 0.4, 1, 1,
0.2962199, 1.159304, 0.534754, 0, 0.3921569, 1, 1,
0.2969114, -0.1026936, 1.377724, 0, 0.3882353, 1, 1,
0.2972373, 0.3592156, 1.089604, 0, 0.3803922, 1, 1,
0.2994326, -1.289521, 3.56182, 0, 0.3764706, 1, 1,
0.2999144, -1.311822, 2.369112, 0, 0.3686275, 1, 1,
0.3041579, 0.9577443, 1.184183, 0, 0.3647059, 1, 1,
0.3085165, -0.2609783, 3.23528, 0, 0.3568628, 1, 1,
0.3117831, -0.4753021, 3.019287, 0, 0.3529412, 1, 1,
0.3127825, 1.789739, -0.593217, 0, 0.345098, 1, 1,
0.3227115, 0.8477964, 0.0482134, 0, 0.3411765, 1, 1,
0.3334278, 0.5315451, 0.795104, 0, 0.3333333, 1, 1,
0.3359709, -0.443157, 3.874695, 0, 0.3294118, 1, 1,
0.3367838, 0.5216338, 0.5898433, 0, 0.3215686, 1, 1,
0.3474838, -0.6735498, 3.495738, 0, 0.3176471, 1, 1,
0.3517482, 0.05195674, 0.6398826, 0, 0.3098039, 1, 1,
0.3526627, 1.192247, 0.172237, 0, 0.3058824, 1, 1,
0.3575404, -0.300991, 2.514714, 0, 0.2980392, 1, 1,
0.3598599, -0.4654081, 0.9155926, 0, 0.2901961, 1, 1,
0.3654682, 0.7994407, 1.654299, 0, 0.2862745, 1, 1,
0.3657133, 0.21077, 2.618227, 0, 0.2784314, 1, 1,
0.3744113, 0.8035032, 0.2929727, 0, 0.2745098, 1, 1,
0.3744536, 0.9436786, 0.5692211, 0, 0.2666667, 1, 1,
0.3746184, 1.713771, 1.000499, 0, 0.2627451, 1, 1,
0.3759552, 0.1448883, 0.9838659, 0, 0.254902, 1, 1,
0.3769564, 1.640688, -1.279866, 0, 0.2509804, 1, 1,
0.3811246, 0.235455, -0.00884935, 0, 0.2431373, 1, 1,
0.3837589, 0.7091503, -0.01560109, 0, 0.2392157, 1, 1,
0.3837607, -0.6035523, 2.150549, 0, 0.2313726, 1, 1,
0.3848151, 0.850718, -1.850902, 0, 0.227451, 1, 1,
0.3866849, -0.3148433, 2.779797, 0, 0.2196078, 1, 1,
0.3923061, -2.300236, 2.396368, 0, 0.2156863, 1, 1,
0.3926942, 0.09699665, 0.9933335, 0, 0.2078431, 1, 1,
0.3931359, 1.135897, 0.5107202, 0, 0.2039216, 1, 1,
0.3935153, 1.267908, -0.7561593, 0, 0.1960784, 1, 1,
0.3948061, 0.9312356, -1.891327, 0, 0.1882353, 1, 1,
0.3961143, 0.3221862, 1.061302, 0, 0.1843137, 1, 1,
0.3998719, 1.149498, 0.4973046, 0, 0.1764706, 1, 1,
0.4122607, -0.6048263, 1.480665, 0, 0.172549, 1, 1,
0.4128761, 1.799661, 0.6983547, 0, 0.1647059, 1, 1,
0.4138288, -0.4094215, 4.067293, 0, 0.1607843, 1, 1,
0.4184294, 1.372078, 1.620804, 0, 0.1529412, 1, 1,
0.4258005, 0.3152743, 1.681694, 0, 0.1490196, 1, 1,
0.4258377, -1.569994, 3.393488, 0, 0.1411765, 1, 1,
0.42699, -1.317288, 0.8531886, 0, 0.1372549, 1, 1,
0.4289579, -1.023419, 2.828582, 0, 0.1294118, 1, 1,
0.4298891, -0.004525595, 3.001372, 0, 0.1254902, 1, 1,
0.4317181, 0.6182605, -0.2550451, 0, 0.1176471, 1, 1,
0.4323147, -0.262557, 2.586763, 0, 0.1137255, 1, 1,
0.4329329, 0.7976466, 1.048476, 0, 0.1058824, 1, 1,
0.4353621, 1.858205, 0.9280804, 0, 0.09803922, 1, 1,
0.4364367, 1.431321, 0.6072543, 0, 0.09411765, 1, 1,
0.4367145, -0.3053417, 3.217468, 0, 0.08627451, 1, 1,
0.4393034, 0.1208978, 2.232615, 0, 0.08235294, 1, 1,
0.4406788, -0.3171581, 1.072312, 0, 0.07450981, 1, 1,
0.4420376, -1.794192, 4.839814, 0, 0.07058824, 1, 1,
0.4439511, 0.6404692, 1.102445, 0, 0.0627451, 1, 1,
0.4454398, 0.4991412, 0.9625486, 0, 0.05882353, 1, 1,
0.4502387, 1.63308, 0.4266353, 0, 0.05098039, 1, 1,
0.4507177, 1.421633, 1.002853, 0, 0.04705882, 1, 1,
0.4521791, -0.7587038, 2.897521, 0, 0.03921569, 1, 1,
0.4531596, 0.6582627, 1.452489, 0, 0.03529412, 1, 1,
0.4536105, 0.9223241, -1.055164, 0, 0.02745098, 1, 1,
0.455844, 0.3621027, 1.330028, 0, 0.02352941, 1, 1,
0.4578777, -0.1083978, 1.454337, 0, 0.01568628, 1, 1,
0.458331, 0.9032349, 0.6036833, 0, 0.01176471, 1, 1,
0.4591925, -0.697924, 3.108655, 0, 0.003921569, 1, 1,
0.4618942, -1.930774, 3.100684, 0.003921569, 0, 1, 1,
0.4630654, 0.07000027, 1.674736, 0.007843138, 0, 1, 1,
0.4647873, -0.8038656, 0.8521545, 0.01568628, 0, 1, 1,
0.4676571, -0.1369204, 1.465136, 0.01960784, 0, 1, 1,
0.468, 0.8816589, 0.3021718, 0.02745098, 0, 1, 1,
0.468598, -1.496939, 2.54553, 0.03137255, 0, 1, 1,
0.4692768, 1.512723, 0.002951848, 0.03921569, 0, 1, 1,
0.4716248, -0.02345791, 1.375014, 0.04313726, 0, 1, 1,
0.4749022, 0.2622992, 2.04466, 0.05098039, 0, 1, 1,
0.4767433, -1.744763, 0.8923366, 0.05490196, 0, 1, 1,
0.4793495, -0.4617995, 3.302459, 0.0627451, 0, 1, 1,
0.4817377, -0.005341139, 0.50156, 0.06666667, 0, 1, 1,
0.4846682, -1.005686, 2.942307, 0.07450981, 0, 1, 1,
0.4967698, 0.7976506, 1.493383, 0.07843138, 0, 1, 1,
0.5040839, 0.07121373, 0.9105141, 0.08627451, 0, 1, 1,
0.5050026, -1.014273, 2.453397, 0.09019608, 0, 1, 1,
0.5124232, 0.007164392, 1.006889, 0.09803922, 0, 1, 1,
0.5132174, -0.04793717, 1.347621, 0.1058824, 0, 1, 1,
0.5154042, 0.3960451, 0.3982282, 0.1098039, 0, 1, 1,
0.5178477, 0.5216779, -0.04521785, 0.1176471, 0, 1, 1,
0.5188112, -1.860475, 1.427873, 0.1215686, 0, 1, 1,
0.5209368, 1.454336, 0.8399786, 0.1294118, 0, 1, 1,
0.5219445, -0.8566541, 2.273717, 0.1333333, 0, 1, 1,
0.5231802, 0.8183994, 0.4766926, 0.1411765, 0, 1, 1,
0.5232323, -0.3851509, 2.669973, 0.145098, 0, 1, 1,
0.5236824, 0.3328041, -0.4411927, 0.1529412, 0, 1, 1,
0.5280856, -1.851024, 2.633883, 0.1568628, 0, 1, 1,
0.5312067, 0.0445295, 0.9614199, 0.1647059, 0, 1, 1,
0.5352371, 0.2396214, 0.06005357, 0.1686275, 0, 1, 1,
0.5391451, 2.278519, 0.2388897, 0.1764706, 0, 1, 1,
0.5416529, 0.566399, 0.3413515, 0.1803922, 0, 1, 1,
0.5493304, -1.641829, 3.288508, 0.1882353, 0, 1, 1,
0.5518742, 1.276938, -0.3903406, 0.1921569, 0, 1, 1,
0.5541688, -1.585072, 2.219298, 0.2, 0, 1, 1,
0.5553495, 0.7119982, 0.7993962, 0.2078431, 0, 1, 1,
0.5564702, 0.8193806, 0.9632366, 0.2117647, 0, 1, 1,
0.5727465, 1.2305, -0.7317857, 0.2196078, 0, 1, 1,
0.5813419, 0.235091, 0.3309919, 0.2235294, 0, 1, 1,
0.584346, 1.267369, -0.6540658, 0.2313726, 0, 1, 1,
0.5861917, 1.08276, -0.1260874, 0.2352941, 0, 1, 1,
0.588948, -1.319135, 2.122543, 0.2431373, 0, 1, 1,
0.5911474, -0.5258937, 1.353763, 0.2470588, 0, 1, 1,
0.5933173, 1.60382, -0.1398244, 0.254902, 0, 1, 1,
0.5982413, 0.6427751, 1.975662, 0.2588235, 0, 1, 1,
0.5995951, 0.03752991, 1.501099, 0.2666667, 0, 1, 1,
0.6012098, 0.3862408, -0.5603446, 0.2705882, 0, 1, 1,
0.6031124, 0.5072461, -0.8957559, 0.2784314, 0, 1, 1,
0.6090373, 0.8459238, -1.223314, 0.282353, 0, 1, 1,
0.6108755, -2.311918, 3.041293, 0.2901961, 0, 1, 1,
0.6116013, -1.298627, 1.09093, 0.2941177, 0, 1, 1,
0.6149027, -1.168809, 3.204103, 0.3019608, 0, 1, 1,
0.6164324, 1.1805, 1.604472, 0.3098039, 0, 1, 1,
0.6267993, 0.7664067, -0.4809765, 0.3137255, 0, 1, 1,
0.6409507, -0.8078916, 2.798703, 0.3215686, 0, 1, 1,
0.6418186, -1.016377, 2.859706, 0.3254902, 0, 1, 1,
0.646476, -1.337064, 5.213118, 0.3333333, 0, 1, 1,
0.6492938, -0.2481045, 3.427857, 0.3372549, 0, 1, 1,
0.6578375, 1.527204, 1.135705, 0.345098, 0, 1, 1,
0.6639702, -0.09795285, 1.597123, 0.3490196, 0, 1, 1,
0.6688905, 1.314085, 0.7149914, 0.3568628, 0, 1, 1,
0.6756628, 0.2299025, 2.774046, 0.3607843, 0, 1, 1,
0.681456, 0.5133868, 0.7007178, 0.3686275, 0, 1, 1,
0.6851273, -0.1418733, 3.818245, 0.372549, 0, 1, 1,
0.6854944, 0.8162834, 0.9613376, 0.3803922, 0, 1, 1,
0.6860023, -0.08801516, 0.7273259, 0.3843137, 0, 1, 1,
0.6886638, 1.210495, 1.202579, 0.3921569, 0, 1, 1,
0.689243, -1.303739, 2.424919, 0.3960784, 0, 1, 1,
0.6902611, -2.443519, 1.873962, 0.4039216, 0, 1, 1,
0.6925426, -0.4080375, 2.319476, 0.4117647, 0, 1, 1,
0.6928546, -0.551306, 2.334949, 0.4156863, 0, 1, 1,
0.695541, -2.389228, 3.41685, 0.4235294, 0, 1, 1,
0.6959262, 0.8032444, 0.9535062, 0.427451, 0, 1, 1,
0.7012019, -0.008367557, 1.695868, 0.4352941, 0, 1, 1,
0.7019392, 0.1964748, 0.6998947, 0.4392157, 0, 1, 1,
0.7052104, -0.9519066, 3.735178, 0.4470588, 0, 1, 1,
0.7069674, 0.2832033, 0.8461729, 0.4509804, 0, 1, 1,
0.7106003, 0.2256513, 2.139938, 0.4588235, 0, 1, 1,
0.7107806, -0.6139228, 1.224129, 0.4627451, 0, 1, 1,
0.7148657, -0.7430322, 2.611933, 0.4705882, 0, 1, 1,
0.7180331, 0.7325397, 1.520517, 0.4745098, 0, 1, 1,
0.7200257, 1.239984, -0.5044855, 0.4823529, 0, 1, 1,
0.7227081, -0.284441, 2.923573, 0.4862745, 0, 1, 1,
0.7244442, -1.451161, 2.278469, 0.4941176, 0, 1, 1,
0.7254781, -1.838377, 4.291995, 0.5019608, 0, 1, 1,
0.7279735, 0.2764502, 1.834938, 0.5058824, 0, 1, 1,
0.7292795, 0.6079581, 0.4870456, 0.5137255, 0, 1, 1,
0.7324677, 1.630738, 3.385506, 0.5176471, 0, 1, 1,
0.7342661, 0.8994797, -0.03216061, 0.5254902, 0, 1, 1,
0.7356796, -0.116841, 3.020278, 0.5294118, 0, 1, 1,
0.7465643, 1.714454, -1.219208, 0.5372549, 0, 1, 1,
0.7471936, -0.8785172, 1.72143, 0.5411765, 0, 1, 1,
0.7498898, 0.8140957, -0.06767054, 0.5490196, 0, 1, 1,
0.7524934, -0.06739409, 0.3510654, 0.5529412, 0, 1, 1,
0.7581526, 0.9837791, 0.01085614, 0.5607843, 0, 1, 1,
0.7590864, 0.1429832, -0.3114997, 0.5647059, 0, 1, 1,
0.7616776, -0.834693, 2.794112, 0.572549, 0, 1, 1,
0.7622661, -0.643873, 1.597103, 0.5764706, 0, 1, 1,
0.7630932, -0.7481675, 2.421415, 0.5843138, 0, 1, 1,
0.7631891, -1.403511, 3.271561, 0.5882353, 0, 1, 1,
0.7641963, 0.177278, -0.3982059, 0.5960785, 0, 1, 1,
0.7740594, -0.2467547, 2.802766, 0.6039216, 0, 1, 1,
0.7747325, 0.8878809, -0.2411052, 0.6078432, 0, 1, 1,
0.7767235, 0.2263425, 0.9549496, 0.6156863, 0, 1, 1,
0.7770079, -0.7185614, 1.53843, 0.6196079, 0, 1, 1,
0.7794294, -0.2781414, 2.299493, 0.627451, 0, 1, 1,
0.7796664, 0.2436374, 0.8768023, 0.6313726, 0, 1, 1,
0.7816306, 0.6712269, 0.538013, 0.6392157, 0, 1, 1,
0.7858783, 0.4906794, 0.6064499, 0.6431373, 0, 1, 1,
0.7881215, 0.1876984, 1.078684, 0.6509804, 0, 1, 1,
0.788503, 1.388558, 0.6313313, 0.654902, 0, 1, 1,
0.7963036, -0.258523, 0.89101, 0.6627451, 0, 1, 1,
0.7978978, 2.016488, 0.06853197, 0.6666667, 0, 1, 1,
0.801486, -0.9453599, 1.073189, 0.6745098, 0, 1, 1,
0.8053331, -0.2363184, 2.075527, 0.6784314, 0, 1, 1,
0.8143682, -0.2044384, 0.7990279, 0.6862745, 0, 1, 1,
0.8163502, 0.6941065, 2.808472, 0.6901961, 0, 1, 1,
0.8181462, 1.774611, 1.184479, 0.6980392, 0, 1, 1,
0.8222309, 0.8564371, 1.070205, 0.7058824, 0, 1, 1,
0.8224682, 0.9933946, 0.6880762, 0.7098039, 0, 1, 1,
0.8239793, 1.71172, 0.8817551, 0.7176471, 0, 1, 1,
0.8320101, -2.596549, 1.465702, 0.7215686, 0, 1, 1,
0.8327202, 0.5794366, 0.6191898, 0.7294118, 0, 1, 1,
0.8337594, 0.5785764, 2.071891, 0.7333333, 0, 1, 1,
0.8377431, -0.2399745, 1.550484, 0.7411765, 0, 1, 1,
0.8429857, -0.9561036, 4.319456, 0.7450981, 0, 1, 1,
0.8443021, 0.572262, 2.074728, 0.7529412, 0, 1, 1,
0.8505147, -0.1244182, 3.226401, 0.7568628, 0, 1, 1,
0.852219, 0.6481863, -0.2909513, 0.7647059, 0, 1, 1,
0.8533527, -0.116361, 2.279775, 0.7686275, 0, 1, 1,
0.8536896, 0.6582865, 1.570886, 0.7764706, 0, 1, 1,
0.8541213, 1.061725, 0.775435, 0.7803922, 0, 1, 1,
0.8560432, 0.720098, 1.075927, 0.7882353, 0, 1, 1,
0.8563213, -0.8406973, 3.497842, 0.7921569, 0, 1, 1,
0.8603139, -0.4412396, 2.67729, 0.8, 0, 1, 1,
0.8607252, 0.7271134, 0.5540989, 0.8078431, 0, 1, 1,
0.8719293, 0.7956527, -1.139106, 0.8117647, 0, 1, 1,
0.874375, -0.2759441, 2.983401, 0.8196079, 0, 1, 1,
0.8767012, -2.577486, 4.27556, 0.8235294, 0, 1, 1,
0.8869644, 0.1949475, -0.07694723, 0.8313726, 0, 1, 1,
0.8894579, 1.437843, 0.9922081, 0.8352941, 0, 1, 1,
0.8924082, -0.1194828, -0.2586017, 0.8431373, 0, 1, 1,
0.8935474, -0.3116972, 0.8137633, 0.8470588, 0, 1, 1,
0.8967347, 0.3207569, 1.420202, 0.854902, 0, 1, 1,
0.9049768, -0.01239475, 1.823064, 0.8588235, 0, 1, 1,
0.9064798, 0.4354307, 1.978336, 0.8666667, 0, 1, 1,
0.9135342, 0.3316088, 1.846069, 0.8705882, 0, 1, 1,
0.9172691, 0.3517611, 0.7337428, 0.8784314, 0, 1, 1,
0.9199293, -1.022689, 1.745592, 0.8823529, 0, 1, 1,
0.9217173, 1.212862, 1.544646, 0.8901961, 0, 1, 1,
0.9233125, 1.242395, 1.718811, 0.8941177, 0, 1, 1,
0.9268683, -1.367221, 3.536412, 0.9019608, 0, 1, 1,
0.9320349, 0.2747531, 0.6380705, 0.9098039, 0, 1, 1,
0.9365841, 0.4664814, 1.860704, 0.9137255, 0, 1, 1,
0.9415216, -0.5483314, 2.182218, 0.9215686, 0, 1, 1,
0.9427496, 0.3238113, 1.883904, 0.9254902, 0, 1, 1,
0.9446555, -0.1945611, 1.735036, 0.9333333, 0, 1, 1,
0.9460977, -1.247454, 4.557162, 0.9372549, 0, 1, 1,
0.9502508, 0.5937144, -0.08471576, 0.945098, 0, 1, 1,
0.9559838, 0.1442456, 0.1138755, 0.9490196, 0, 1, 1,
0.9560442, 0.9239237, 1.200147, 0.9568627, 0, 1, 1,
0.9569234, 0.2068598, 3.284387, 0.9607843, 0, 1, 1,
0.9636983, -0.6361036, 2.750983, 0.9686275, 0, 1, 1,
0.9693891, -0.5544486, 3.714096, 0.972549, 0, 1, 1,
0.9765446, -1.428377, 1.957384, 0.9803922, 0, 1, 1,
0.9765983, 1.388276, -0.8657832, 0.9843137, 0, 1, 1,
0.9824622, -0.5062715, 1.253243, 0.9921569, 0, 1, 1,
0.9829672, -0.4315025, 1.77948, 0.9960784, 0, 1, 1,
0.9835563, 0.4281174, 0.9373983, 1, 0, 0.9960784, 1,
0.9838853, -1.738813, 2.342251, 1, 0, 0.9882353, 1,
0.9842864, 1.207889, 2.685551, 1, 0, 0.9843137, 1,
0.9867563, -1.492706, 2.794586, 1, 0, 0.9764706, 1,
0.9885615, -0.1485477, 3.560045, 1, 0, 0.972549, 1,
0.9952109, 1.573527, 2.103479, 1, 0, 0.9647059, 1,
0.999818, -0.03462213, 2.358592, 1, 0, 0.9607843, 1,
1.000896, -0.5310622, 1.768438, 1, 0, 0.9529412, 1,
1.007875, 0.1113026, 1.588998, 1, 0, 0.9490196, 1,
1.01109, -0.1682704, 2.223923, 1, 0, 0.9411765, 1,
1.011619, 0.7734483, 1.409795, 1, 0, 0.9372549, 1,
1.01224, 0.7198783, 1.555951, 1, 0, 0.9294118, 1,
1.013278, 3.068716, -0.1125295, 1, 0, 0.9254902, 1,
1.017424, 1.390499, 0.4009707, 1, 0, 0.9176471, 1,
1.018942, 0.797559, 2.24623, 1, 0, 0.9137255, 1,
1.022036, -0.6906068, 2.17671, 1, 0, 0.9058824, 1,
1.038958, -1.092051, 2.82587, 1, 0, 0.9019608, 1,
1.039863, 1.261949, 1.02735, 1, 0, 0.8941177, 1,
1.043453, 0.5825334, 0.6463501, 1, 0, 0.8862745, 1,
1.045091, -0.1721283, 2.62596, 1, 0, 0.8823529, 1,
1.046153, 0.6176212, 2.66797, 1, 0, 0.8745098, 1,
1.049982, -1.119257, 0.7917639, 1, 0, 0.8705882, 1,
1.051176, -0.0639421, 1.531686, 1, 0, 0.8627451, 1,
1.052879, 0.6909477, 0.1094551, 1, 0, 0.8588235, 1,
1.055803, 0.4104762, 1.867887, 1, 0, 0.8509804, 1,
1.058963, 0.4351491, 1.988586, 1, 0, 0.8470588, 1,
1.059376, -1.706939, 0.5750537, 1, 0, 0.8392157, 1,
1.065007, -0.627156, 1.225917, 1, 0, 0.8352941, 1,
1.073949, -0.05319675, 2.431083, 1, 0, 0.827451, 1,
1.077903, -1.00748, 1.581137, 1, 0, 0.8235294, 1,
1.088547, -1.246239, 4.655303, 1, 0, 0.8156863, 1,
1.091188, 0.1540616, 0.4077411, 1, 0, 0.8117647, 1,
1.099896, -0.5818279, 1.026494, 1, 0, 0.8039216, 1,
1.102596, 0.7115457, -0.08954451, 1, 0, 0.7960784, 1,
1.102856, -0.6612095, 3.933398, 1, 0, 0.7921569, 1,
1.104424, 0.6659161, 2.216755, 1, 0, 0.7843137, 1,
1.113019, 0.3700882, 0.6773736, 1, 0, 0.7803922, 1,
1.119861, -0.7478517, 2.56625, 1, 0, 0.772549, 1,
1.120981, -0.5052016, 1.059841, 1, 0, 0.7686275, 1,
1.126689, 1.116327, 1.263998, 1, 0, 0.7607843, 1,
1.128051, 0.8338225, 1.997177, 1, 0, 0.7568628, 1,
1.129454, -0.9539313, 0.6920335, 1, 0, 0.7490196, 1,
1.132597, -0.9541387, 1.737284, 1, 0, 0.7450981, 1,
1.134739, 0.6989615, 2.135527, 1, 0, 0.7372549, 1,
1.142596, -2.345018, 2.95358, 1, 0, 0.7333333, 1,
1.142744, -0.6567923, 2.795144, 1, 0, 0.7254902, 1,
1.154881, -1.842706, 4.171452, 1, 0, 0.7215686, 1,
1.168498, 0.5526778, 1.584198, 1, 0, 0.7137255, 1,
1.188431, -1.429618, 1.361086, 1, 0, 0.7098039, 1,
1.189368, -0.1235101, 3.13979, 1, 0, 0.7019608, 1,
1.198586, -2.085194, 2.774046, 1, 0, 0.6941177, 1,
1.200508, 2.355059, 0.3204804, 1, 0, 0.6901961, 1,
1.200604, -0.2200542, 0.5170024, 1, 0, 0.682353, 1,
1.201551, -0.5666619, 2.024775, 1, 0, 0.6784314, 1,
1.20159, -1.559185, 1.838085, 1, 0, 0.6705883, 1,
1.204605, -0.5982404, 3.50318, 1, 0, 0.6666667, 1,
1.217588, 0.630752, 1.886485, 1, 0, 0.6588235, 1,
1.223452, 1.177582, -1.066696, 1, 0, 0.654902, 1,
1.226552, -1.55224, 3.509614, 1, 0, 0.6470588, 1,
1.230095, 1.653957, -0.01992463, 1, 0, 0.6431373, 1,
1.2302, 0.3075486, 0.9165881, 1, 0, 0.6352941, 1,
1.234638, 0.1409189, -0.8384609, 1, 0, 0.6313726, 1,
1.236443, -1.759569, 4.134084, 1, 0, 0.6235294, 1,
1.236611, 0.3866597, 3.101899, 1, 0, 0.6196079, 1,
1.237763, -1.413848, 2.83882, 1, 0, 0.6117647, 1,
1.255613, 1.544449, 0.02513016, 1, 0, 0.6078432, 1,
1.259163, 1.55843, -0.8890517, 1, 0, 0.6, 1,
1.267861, 0.6245047, 0.7900974, 1, 0, 0.5921569, 1,
1.269738, 1.045408, 1.495266, 1, 0, 0.5882353, 1,
1.27818, -0.9238176, 2.9379, 1, 0, 0.5803922, 1,
1.279547, 0.8904537, 0.1074458, 1, 0, 0.5764706, 1,
1.281254, -1.357518, 3.31649, 1, 0, 0.5686275, 1,
1.2826, 0.9252428, 0.8499436, 1, 0, 0.5647059, 1,
1.291958, -0.1843812, 1.704741, 1, 0, 0.5568628, 1,
1.30449, -2.119658, 1.481033, 1, 0, 0.5529412, 1,
1.305635, -0.7591306, 2.534271, 1, 0, 0.5450981, 1,
1.308113, -0.2142073, 1.424446, 1, 0, 0.5411765, 1,
1.311951, 0.2309721, 2.547855, 1, 0, 0.5333334, 1,
1.31683, 0.0720476, 1.800287, 1, 0, 0.5294118, 1,
1.318966, 0.4194931, 3.405398, 1, 0, 0.5215687, 1,
1.33602, 0.8234001, 1.39913, 1, 0, 0.5176471, 1,
1.347726, 0.4646236, 0.06837192, 1, 0, 0.509804, 1,
1.352762, 0.807507, 1.157836, 1, 0, 0.5058824, 1,
1.366611, -0.1713806, 3.181767, 1, 0, 0.4980392, 1,
1.367041, -0.4270186, 4.649931, 1, 0, 0.4901961, 1,
1.370297, 1.648735, 1.431701, 1, 0, 0.4862745, 1,
1.379474, -1.456258, 2.099554, 1, 0, 0.4784314, 1,
1.381272, -1.503011, 2.571719, 1, 0, 0.4745098, 1,
1.38734, 0.5287977, 1.087985, 1, 0, 0.4666667, 1,
1.387595, 0.291593, 0.9017597, 1, 0, 0.4627451, 1,
1.391566, -0.6459858, 2.836272, 1, 0, 0.454902, 1,
1.403038, 0.8625888, 1.144503, 1, 0, 0.4509804, 1,
1.405244, -0.6170957, 0.6081814, 1, 0, 0.4431373, 1,
1.410848, 1.140637, 0.9609796, 1, 0, 0.4392157, 1,
1.414999, -1.68134, 4.625247, 1, 0, 0.4313726, 1,
1.442383, -0.7660909, 0.2652861, 1, 0, 0.427451, 1,
1.445185, 0.4906325, -0.5637627, 1, 0, 0.4196078, 1,
1.455116, 1.062967, 2.461612, 1, 0, 0.4156863, 1,
1.464218, 0.559192, -0.6820173, 1, 0, 0.4078431, 1,
1.472027, -0.6914111, 0.3751718, 1, 0, 0.4039216, 1,
1.47479, 0.7819113, 0.8740811, 1, 0, 0.3960784, 1,
1.475461, -0.06288005, -0.141236, 1, 0, 0.3882353, 1,
1.475569, 0.3200256, 0.846158, 1, 0, 0.3843137, 1,
1.487878, 0.2640208, 0.9889266, 1, 0, 0.3764706, 1,
1.503061, 1.239063, 1.187332, 1, 0, 0.372549, 1,
1.503104, -1.871382, 2.111417, 1, 0, 0.3647059, 1,
1.504085, 0.09827267, 1.576055, 1, 0, 0.3607843, 1,
1.510528, -1.883976, 3.574828, 1, 0, 0.3529412, 1,
1.511456, 3.099701, -0.7068002, 1, 0, 0.3490196, 1,
1.514936, 0.422526, 2.694947, 1, 0, 0.3411765, 1,
1.531886, 0.06705354, 2.92736, 1, 0, 0.3372549, 1,
1.550681, 0.09873009, 2.242854, 1, 0, 0.3294118, 1,
1.555712, 1.415667, 0.7894354, 1, 0, 0.3254902, 1,
1.556088, -0.7558649, 1.564133, 1, 0, 0.3176471, 1,
1.55741, -0.1005278, 4.26955, 1, 0, 0.3137255, 1,
1.558536, -0.08874793, 1.206659, 1, 0, 0.3058824, 1,
1.56109, 0.366291, 1.845059, 1, 0, 0.2980392, 1,
1.564371, -0.9097934, 2.572774, 1, 0, 0.2941177, 1,
1.573091, -0.9444981, 2.068988, 1, 0, 0.2862745, 1,
1.575858, -0.3182262, 2.023143, 1, 0, 0.282353, 1,
1.588769, -2.057383, 2.065564, 1, 0, 0.2745098, 1,
1.590759, 1.007022, 1.769005, 1, 0, 0.2705882, 1,
1.595244, 0.0763216, 2.444714, 1, 0, 0.2627451, 1,
1.597027, 1.074578, 0.9637363, 1, 0, 0.2588235, 1,
1.599712, 0.3868402, -0.04106444, 1, 0, 0.2509804, 1,
1.616953, -0.6657156, 2.086543, 1, 0, 0.2470588, 1,
1.618484, 1.252973, 3.851667, 1, 0, 0.2392157, 1,
1.658321, 0.4515335, -0.68225, 1, 0, 0.2352941, 1,
1.660384, 0.8808993, 0.4300506, 1, 0, 0.227451, 1,
1.67047, -1.664355, 3.344464, 1, 0, 0.2235294, 1,
1.677701, -1.573542, 1.304858, 1, 0, 0.2156863, 1,
1.678581, 0.5592219, 0.2808246, 1, 0, 0.2117647, 1,
1.697571, 1.134034, 1.180495, 1, 0, 0.2039216, 1,
1.699463, -0.7913303, 1.046601, 1, 0, 0.1960784, 1,
1.717259, 1.791555, 0.2298156, 1, 0, 0.1921569, 1,
1.721286, 0.2365393, 1.386967, 1, 0, 0.1843137, 1,
1.725281, 0.4208945, -0.1810366, 1, 0, 0.1803922, 1,
1.749922, 0.3950618, 1.22117, 1, 0, 0.172549, 1,
1.755984, -0.1658522, 1.803329, 1, 0, 0.1686275, 1,
1.766013, 1.772496, 1.804522, 1, 0, 0.1607843, 1,
1.767229, 0.7855769, 0.7679052, 1, 0, 0.1568628, 1,
1.772793, -0.3407634, 1.185646, 1, 0, 0.1490196, 1,
1.796529, 0.7562671, 2.237554, 1, 0, 0.145098, 1,
1.808013, 0.7333238, 0.2067936, 1, 0, 0.1372549, 1,
1.808412, 0.2647775, 1.068843, 1, 0, 0.1333333, 1,
1.836488, 0.3540202, 2.146302, 1, 0, 0.1254902, 1,
1.846663, 0.6795302, 0.8098571, 1, 0, 0.1215686, 1,
1.884794, -2.022537, 1.905792, 1, 0, 0.1137255, 1,
1.924722, 0.002062455, 0.5075839, 1, 0, 0.1098039, 1,
2.02136, -0.4089521, 1.710172, 1, 0, 0.1019608, 1,
2.034411, -0.581743, 2.009923, 1, 0, 0.09411765, 1,
2.122678, 0.6151342, 1.144114, 1, 0, 0.09019608, 1,
2.144095, -0.1184976, 2.199025, 1, 0, 0.08235294, 1,
2.176126, 0.04380827, 0.4842479, 1, 0, 0.07843138, 1,
2.210639, -0.1027126, 0.831794, 1, 0, 0.07058824, 1,
2.252875, 0.1312131, 1.349498, 1, 0, 0.06666667, 1,
2.254709, -0.3358741, 3.30462, 1, 0, 0.05882353, 1,
2.259454, -1.533406, 1.342913, 1, 0, 0.05490196, 1,
2.294776, -2.481186, 2.934075, 1, 0, 0.04705882, 1,
2.349416, 1.453692, 0.2777438, 1, 0, 0.04313726, 1,
2.421219, -0.92834, 0.9836325, 1, 0, 0.03529412, 1,
2.457956, 1.592206, 2.632936, 1, 0, 0.03137255, 1,
2.484655, -0.3658249, 2.02707, 1, 0, 0.02352941, 1,
2.567931, -0.03676334, 1.712767, 1, 0, 0.01960784, 1,
2.683828, -0.5445244, 2.243886, 1, 0, 0.01176471, 1,
3.076298, -0.009281131, 2.657836, 1, 0, 0.007843138, 1
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
-0.1947473, -4.419182, -8.855745, 0, -0.5, 0.5, 0.5,
-0.1947473, -4.419182, -8.855745, 1, -0.5, 0.5, 0.5,
-0.1947473, -4.419182, -8.855745, 1, 1.5, 0.5, 0.5,
-0.1947473, -4.419182, -8.855745, 0, 1.5, 0.5, 0.5
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
-4.574677, 0.1360078, -8.855745, 0, -0.5, 0.5, 0.5,
-4.574677, 0.1360078, -8.855745, 1, -0.5, 0.5, 0.5,
-4.574677, 0.1360078, -8.855745, 1, 1.5, 0.5, 0.5,
-4.574677, 0.1360078, -8.855745, 0, 1.5, 0.5, 0.5
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
-4.574677, -4.419182, -0.8017876, 0, -0.5, 0.5, 0.5,
-4.574677, -4.419182, -0.8017876, 1, -0.5, 0.5, 0.5,
-4.574677, -4.419182, -0.8017876, 1, 1.5, 0.5, 0.5,
-4.574677, -4.419182, -0.8017876, 0, 1.5, 0.5, 0.5
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
-3, -3.367984, -6.99714,
3, -3.367984, -6.99714,
-3, -3.367984, -6.99714,
-3, -3.543184, -7.306908,
-2, -3.367984, -6.99714,
-2, -3.543184, -7.306908,
-1, -3.367984, -6.99714,
-1, -3.543184, -7.306908,
0, -3.367984, -6.99714,
0, -3.543184, -7.306908,
1, -3.367984, -6.99714,
1, -3.543184, -7.306908,
2, -3.367984, -6.99714,
2, -3.543184, -7.306908,
3, -3.367984, -6.99714,
3, -3.543184, -7.306908
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3, -3.893583, -7.926443, 0, -0.5, 0.5, 0.5,
-3, -3.893583, -7.926443, 1, -0.5, 0.5, 0.5,
-3, -3.893583, -7.926443, 1, 1.5, 0.5, 0.5,
-3, -3.893583, -7.926443, 0, 1.5, 0.5, 0.5,
-2, -3.893583, -7.926443, 0, -0.5, 0.5, 0.5,
-2, -3.893583, -7.926443, 1, -0.5, 0.5, 0.5,
-2, -3.893583, -7.926443, 1, 1.5, 0.5, 0.5,
-2, -3.893583, -7.926443, 0, 1.5, 0.5, 0.5,
-1, -3.893583, -7.926443, 0, -0.5, 0.5, 0.5,
-1, -3.893583, -7.926443, 1, -0.5, 0.5, 0.5,
-1, -3.893583, -7.926443, 1, 1.5, 0.5, 0.5,
-1, -3.893583, -7.926443, 0, 1.5, 0.5, 0.5,
0, -3.893583, -7.926443, 0, -0.5, 0.5, 0.5,
0, -3.893583, -7.926443, 1, -0.5, 0.5, 0.5,
0, -3.893583, -7.926443, 1, 1.5, 0.5, 0.5,
0, -3.893583, -7.926443, 0, 1.5, 0.5, 0.5,
1, -3.893583, -7.926443, 0, -0.5, 0.5, 0.5,
1, -3.893583, -7.926443, 1, -0.5, 0.5, 0.5,
1, -3.893583, -7.926443, 1, 1.5, 0.5, 0.5,
1, -3.893583, -7.926443, 0, 1.5, 0.5, 0.5,
2, -3.893583, -7.926443, 0, -0.5, 0.5, 0.5,
2, -3.893583, -7.926443, 1, -0.5, 0.5, 0.5,
2, -3.893583, -7.926443, 1, 1.5, 0.5, 0.5,
2, -3.893583, -7.926443, 0, 1.5, 0.5, 0.5,
3, -3.893583, -7.926443, 0, -0.5, 0.5, 0.5,
3, -3.893583, -7.926443, 1, -0.5, 0.5, 0.5,
3, -3.893583, -7.926443, 1, 1.5, 0.5, 0.5,
3, -3.893583, -7.926443, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.563924, -3, -6.99714,
-3.563924, 3, -6.99714,
-3.563924, -3, -6.99714,
-3.732383, -3, -7.306908,
-3.563924, -2, -6.99714,
-3.732383, -2, -7.306908,
-3.563924, -1, -6.99714,
-3.732383, -1, -7.306908,
-3.563924, 0, -6.99714,
-3.732383, 0, -7.306908,
-3.563924, 1, -6.99714,
-3.732383, 1, -7.306908,
-3.563924, 2, -6.99714,
-3.732383, 2, -7.306908,
-3.563924, 3, -6.99714,
-3.732383, 3, -7.306908
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-4.069301, -3, -7.926443, 0, -0.5, 0.5, 0.5,
-4.069301, -3, -7.926443, 1, -0.5, 0.5, 0.5,
-4.069301, -3, -7.926443, 1, 1.5, 0.5, 0.5,
-4.069301, -3, -7.926443, 0, 1.5, 0.5, 0.5,
-4.069301, -2, -7.926443, 0, -0.5, 0.5, 0.5,
-4.069301, -2, -7.926443, 1, -0.5, 0.5, 0.5,
-4.069301, -2, -7.926443, 1, 1.5, 0.5, 0.5,
-4.069301, -2, -7.926443, 0, 1.5, 0.5, 0.5,
-4.069301, -1, -7.926443, 0, -0.5, 0.5, 0.5,
-4.069301, -1, -7.926443, 1, -0.5, 0.5, 0.5,
-4.069301, -1, -7.926443, 1, 1.5, 0.5, 0.5,
-4.069301, -1, -7.926443, 0, 1.5, 0.5, 0.5,
-4.069301, 0, -7.926443, 0, -0.5, 0.5, 0.5,
-4.069301, 0, -7.926443, 1, -0.5, 0.5, 0.5,
-4.069301, 0, -7.926443, 1, 1.5, 0.5, 0.5,
-4.069301, 0, -7.926443, 0, 1.5, 0.5, 0.5,
-4.069301, 1, -7.926443, 0, -0.5, 0.5, 0.5,
-4.069301, 1, -7.926443, 1, -0.5, 0.5, 0.5,
-4.069301, 1, -7.926443, 1, 1.5, 0.5, 0.5,
-4.069301, 1, -7.926443, 0, 1.5, 0.5, 0.5,
-4.069301, 2, -7.926443, 0, -0.5, 0.5, 0.5,
-4.069301, 2, -7.926443, 1, -0.5, 0.5, 0.5,
-4.069301, 2, -7.926443, 1, 1.5, 0.5, 0.5,
-4.069301, 2, -7.926443, 0, 1.5, 0.5, 0.5,
-4.069301, 3, -7.926443, 0, -0.5, 0.5, 0.5,
-4.069301, 3, -7.926443, 1, -0.5, 0.5, 0.5,
-4.069301, 3, -7.926443, 1, 1.5, 0.5, 0.5,
-4.069301, 3, -7.926443, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.563924, -3.367984, -6,
-3.563924, -3.367984, 4,
-3.563924, -3.367984, -6,
-3.732383, -3.543184, -6,
-3.563924, -3.367984, -4,
-3.732383, -3.543184, -4,
-3.563924, -3.367984, -2,
-3.732383, -3.543184, -2,
-3.563924, -3.367984, 0,
-3.732383, -3.543184, 0,
-3.563924, -3.367984, 2,
-3.732383, -3.543184, 2,
-3.563924, -3.367984, 4,
-3.732383, -3.543184, 4
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
"-6",
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
-4.069301, -3.893583, -6, 0, -0.5, 0.5, 0.5,
-4.069301, -3.893583, -6, 1, -0.5, 0.5, 0.5,
-4.069301, -3.893583, -6, 1, 1.5, 0.5, 0.5,
-4.069301, -3.893583, -6, 0, 1.5, 0.5, 0.5,
-4.069301, -3.893583, -4, 0, -0.5, 0.5, 0.5,
-4.069301, -3.893583, -4, 1, -0.5, 0.5, 0.5,
-4.069301, -3.893583, -4, 1, 1.5, 0.5, 0.5,
-4.069301, -3.893583, -4, 0, 1.5, 0.5, 0.5,
-4.069301, -3.893583, -2, 0, -0.5, 0.5, 0.5,
-4.069301, -3.893583, -2, 1, -0.5, 0.5, 0.5,
-4.069301, -3.893583, -2, 1, 1.5, 0.5, 0.5,
-4.069301, -3.893583, -2, 0, 1.5, 0.5, 0.5,
-4.069301, -3.893583, 0, 0, -0.5, 0.5, 0.5,
-4.069301, -3.893583, 0, 1, -0.5, 0.5, 0.5,
-4.069301, -3.893583, 0, 1, 1.5, 0.5, 0.5,
-4.069301, -3.893583, 0, 0, 1.5, 0.5, 0.5,
-4.069301, -3.893583, 2, 0, -0.5, 0.5, 0.5,
-4.069301, -3.893583, 2, 1, -0.5, 0.5, 0.5,
-4.069301, -3.893583, 2, 1, 1.5, 0.5, 0.5,
-4.069301, -3.893583, 2, 0, 1.5, 0.5, 0.5,
-4.069301, -3.893583, 4, 0, -0.5, 0.5, 0.5,
-4.069301, -3.893583, 4, 1, -0.5, 0.5, 0.5,
-4.069301, -3.893583, 4, 1, 1.5, 0.5, 0.5,
-4.069301, -3.893583, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
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
-3.563924, -3.367984, -6.99714,
-3.563924, 3.64, -6.99714,
-3.563924, -3.367984, 5.393565,
-3.563924, 3.64, 5.393565,
-3.563924, -3.367984, -6.99714,
-3.563924, -3.367984, 5.393565,
-3.563924, 3.64, -6.99714,
-3.563924, 3.64, 5.393565,
-3.563924, -3.367984, -6.99714,
3.17443, -3.367984, -6.99714,
-3.563924, -3.367984, 5.393565,
3.17443, -3.367984, 5.393565,
-3.563924, 3.64, -6.99714,
3.17443, 3.64, -6.99714,
-3.563924, 3.64, 5.393565,
3.17443, 3.64, 5.393565,
3.17443, -3.367984, -6.99714,
3.17443, 3.64, -6.99714,
3.17443, -3.367984, 5.393565,
3.17443, 3.64, 5.393565,
3.17443, -3.367984, -6.99714,
3.17443, -3.367984, 5.393565,
3.17443, 3.64, -6.99714,
3.17443, 3.64, 5.393565
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
var radius = 8.409928;
var distance = 37.41672;
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
mvMatrix.translate( 0.1947473, -0.1360078, 0.8017876 );
mvMatrix.scale( 1.349436, 1.297517, 0.7338549 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.41672);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Nitroguanidin<-read.table("Nitroguanidin.xyz")
```

```
## Error in read.table("Nitroguanidin.xyz"): no lines available in input
```

```r
x<-Nitroguanidin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Nitroguanidin' not found
```

```r
y<-Nitroguanidin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Nitroguanidin' not found
```

```r
z<-Nitroguanidin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Nitroguanidin' not found
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
-3.465793, 0.4587508, -2.800564, 0, 0, 1, 1, 1,
-2.998651, 0.3063664, 0.3908612, 1, 0, 0, 1, 1,
-2.931249, -1.680905, 0.4498307, 1, 0, 0, 1, 1,
-2.848831, -0.0369757, -1.96718, 1, 0, 0, 1, 1,
-2.700902, 0.1670355, -2.062449, 1, 0, 0, 1, 1,
-2.671783, -0.7952887, -1.875816, 1, 0, 0, 1, 1,
-2.566389, 0.9509574, 0.1968622, 0, 0, 0, 1, 1,
-2.509619, 0.2036031, -0.8833277, 0, 0, 0, 1, 1,
-2.46678, -0.1818219, -1.847923, 0, 0, 0, 1, 1,
-2.265617, 0.6472868, -1.514998, 0, 0, 0, 1, 1,
-2.259158, 0.04692769, -0.395577, 0, 0, 0, 1, 1,
-2.248896, 0.2924736, -1.33793, 0, 0, 0, 1, 1,
-2.231273, -0.5627996, -2.210569, 0, 0, 0, 1, 1,
-2.215075, -0.7718328, -1.283931, 1, 1, 1, 1, 1,
-2.197068, 0.5644186, -2.316238, 1, 1, 1, 1, 1,
-2.190169, 2.485666, 0.7591836, 1, 1, 1, 1, 1,
-2.179516, 1.040068, -1.905846, 1, 1, 1, 1, 1,
-2.150739, -1.184942, -2.417912, 1, 1, 1, 1, 1,
-2.15018, 1.232144, -2.668142, 1, 1, 1, 1, 1,
-2.108713, -2.20753, -4.28227, 1, 1, 1, 1, 1,
-2.03789, -1.504268, -3.563495, 1, 1, 1, 1, 1,
-2.03003, -0.6935961, -1.54908, 1, 1, 1, 1, 1,
-2.021179, 0.6115293, -0.7901738, 1, 1, 1, 1, 1,
-2.013171, -0.9929013, -2.568861, 1, 1, 1, 1, 1,
-1.965536, -0.2030641, -1.678922, 1, 1, 1, 1, 1,
-1.944906, -1.551126, -0.002093089, 1, 1, 1, 1, 1,
-1.941413, 1.442478, -1.899508, 1, 1, 1, 1, 1,
-1.92422, 0.7914048, -0.08850689, 1, 1, 1, 1, 1,
-1.923431, -0.03003835, -1.195636, 0, 0, 1, 1, 1,
-1.903085, -0.7323852, -1.802814, 1, 0, 0, 1, 1,
-1.892593, 1.074854, -1.570094, 1, 0, 0, 1, 1,
-1.883737, -1.143762, -0.6716393, 1, 0, 0, 1, 1,
-1.854897, 0.5856917, -0.3543802, 1, 0, 0, 1, 1,
-1.837859, 1.189421, -0.1318906, 1, 0, 0, 1, 1,
-1.837198, 0.3615279, -0.2413948, 0, 0, 0, 1, 1,
-1.823731, 0.08143208, -2.792234, 0, 0, 0, 1, 1,
-1.793841, 1.321432, -0.4646296, 0, 0, 0, 1, 1,
-1.79202, 2.077291, -0.4338593, 0, 0, 0, 1, 1,
-1.784526, -0.2658162, -1.593565, 0, 0, 0, 1, 1,
-1.77103, 1.140426, -1.502588, 0, 0, 0, 1, 1,
-1.759202, -0.2155271, -2.455891, 0, 0, 0, 1, 1,
-1.727371, 0.8707833, -1.165206, 1, 1, 1, 1, 1,
-1.718837, -0.4474073, -0.7560718, 1, 1, 1, 1, 1,
-1.688135, -0.7029074, -3.410475, 1, 1, 1, 1, 1,
-1.687923, -0.1291177, -2.261618, 1, 1, 1, 1, 1,
-1.673988, 0.255889, -2.028012, 1, 1, 1, 1, 1,
-1.65977, -1.165243, -1.356938, 1, 1, 1, 1, 1,
-1.655249, -0.8986125, -1.875642, 1, 1, 1, 1, 1,
-1.633206, -0.206886, -1.123798, 1, 1, 1, 1, 1,
-1.629616, -0.2209134, -1.045489, 1, 1, 1, 1, 1,
-1.625418, -1.800357, -0.6614997, 1, 1, 1, 1, 1,
-1.620061, -1.471802, -2.455133, 1, 1, 1, 1, 1,
-1.612048, 0.07048507, -0.6778446, 1, 1, 1, 1, 1,
-1.602499, 0.8877943, -0.9186299, 1, 1, 1, 1, 1,
-1.599147, -0.5489703, -1.695195, 1, 1, 1, 1, 1,
-1.593874, 0.05911213, -0.6661183, 1, 1, 1, 1, 1,
-1.593138, 1.377126, 0.1459319, 0, 0, 1, 1, 1,
-1.588382, -1.606239, -3.185354, 1, 0, 0, 1, 1,
-1.574346, 0.2545756, -1.946361, 1, 0, 0, 1, 1,
-1.572316, 0.6023794, 0.3483297, 1, 0, 0, 1, 1,
-1.571684, -0.246935, -0.5368394, 1, 0, 0, 1, 1,
-1.564517, -0.1463642, -1.483001, 1, 0, 0, 1, 1,
-1.562276, -0.2135961, -0.378942, 0, 0, 0, 1, 1,
-1.56136, -1.542375, -1.772485, 0, 0, 0, 1, 1,
-1.557223, -1.457719, -0.9512884, 0, 0, 0, 1, 1,
-1.538544, -0.5299715, -2.460899, 0, 0, 0, 1, 1,
-1.536961, 0.6905499, -2.317131, 0, 0, 0, 1, 1,
-1.532698, 0.1851678, -0.921553, 0, 0, 0, 1, 1,
-1.527505, 0.5030923, -1.116414, 0, 0, 0, 1, 1,
-1.523891, 0.2258027, -2.066046, 1, 1, 1, 1, 1,
-1.522396, 1.76769, -1.41218, 1, 1, 1, 1, 1,
-1.519718, 0.4888947, -2.038223, 1, 1, 1, 1, 1,
-1.509268, -0.429176, -2.088197, 1, 1, 1, 1, 1,
-1.508324, -0.4706838, -1.148512, 1, 1, 1, 1, 1,
-1.504465, -1.264489, -2.736632, 1, 1, 1, 1, 1,
-1.489741, -1.256494, -0.985202, 1, 1, 1, 1, 1,
-1.488931, 1.161869, -0.2397596, 1, 1, 1, 1, 1,
-1.481906, 1.347838, -1.286645, 1, 1, 1, 1, 1,
-1.470501, -0.2190603, -1.992058, 1, 1, 1, 1, 1,
-1.45565, 0.6890707, -2.417772, 1, 1, 1, 1, 1,
-1.446111, 0.1412149, -0.811297, 1, 1, 1, 1, 1,
-1.41836, 0.3227029, -2.200583, 1, 1, 1, 1, 1,
-1.41528, -0.6526613, 0.1752462, 1, 1, 1, 1, 1,
-1.410131, 0.1842431, -1.549639, 1, 1, 1, 1, 1,
-1.404983, 1.003057, -0.2528264, 0, 0, 1, 1, 1,
-1.404236, -0.4798684, -2.3608, 1, 0, 0, 1, 1,
-1.402374, -0.5983297, -2.484405, 1, 0, 0, 1, 1,
-1.394009, 0.1785313, -3.760556, 1, 0, 0, 1, 1,
-1.363977, -0.02988402, -1.415738, 1, 0, 0, 1, 1,
-1.363957, 1.54293, -1.824535, 1, 0, 0, 1, 1,
-1.362241, -0.5206234, -3.641834, 0, 0, 0, 1, 1,
-1.359843, -0.5673342, -2.30782, 0, 0, 0, 1, 1,
-1.344408, 0.01947425, -1.153183, 0, 0, 0, 1, 1,
-1.333562, -0.7423229, -3.693291, 0, 0, 0, 1, 1,
-1.333489, -0.7275565, -3.062955, 0, 0, 0, 1, 1,
-1.306911, 0.442518, -1.361912, 0, 0, 0, 1, 1,
-1.297668, -0.3832804, -1.539885, 0, 0, 0, 1, 1,
-1.296151, -0.9882526, -3.934284, 1, 1, 1, 1, 1,
-1.289292, 1.577102, -0.5910932, 1, 1, 1, 1, 1,
-1.286064, 0.6754955, -0.8927386, 1, 1, 1, 1, 1,
-1.280888, -1.03948, -2.521324, 1, 1, 1, 1, 1,
-1.279307, -0.2684709, -2.585622, 1, 1, 1, 1, 1,
-1.278592, -0.6751476, -2.310064, 1, 1, 1, 1, 1,
-1.272664, 0.8425713, -0.866312, 1, 1, 1, 1, 1,
-1.265102, 1.081235, -0.9851829, 1, 1, 1, 1, 1,
-1.261172, 0.4282613, -1.564106, 1, 1, 1, 1, 1,
-1.257632, -0.9221193, -2.113292, 1, 1, 1, 1, 1,
-1.253059, 0.7819292, 0.4452832, 1, 1, 1, 1, 1,
-1.240306, 0.996686, -0.222643, 1, 1, 1, 1, 1,
-1.239062, -0.3399979, -3.038071, 1, 1, 1, 1, 1,
-1.23493, -0.8185071, -0.2624089, 1, 1, 1, 1, 1,
-1.225386, -0.04032585, -2.229819, 1, 1, 1, 1, 1,
-1.22378, -1.157661, -2.687602, 0, 0, 1, 1, 1,
-1.220179, 0.2412648, -0.6601548, 1, 0, 0, 1, 1,
-1.209664, -0.01828879, -2.043736, 1, 0, 0, 1, 1,
-1.205165, 0.2803679, -2.428179, 1, 0, 0, 1, 1,
-1.196034, -0.0929053, -1.997066, 1, 0, 0, 1, 1,
-1.182982, 0.2564431, -1.608427, 1, 0, 0, 1, 1,
-1.176347, -0.0847378, -1.825324, 0, 0, 0, 1, 1,
-1.16849, -0.6580866, -1.332726, 0, 0, 0, 1, 1,
-1.16677, 0.3083421, -0.3772902, 0, 0, 0, 1, 1,
-1.158891, -0.2130192, -3.157715, 0, 0, 0, 1, 1,
-1.147016, 0.1130757, -2.944313, 0, 0, 0, 1, 1,
-1.137136, 0.5895883, -0.5353165, 0, 0, 0, 1, 1,
-1.131959, -0.771552, -1.642521, 0, 0, 0, 1, 1,
-1.119846, 0.5888753, -0.1563556, 1, 1, 1, 1, 1,
-1.113345, 0.636827, -2.177337, 1, 1, 1, 1, 1,
-1.112607, -0.9248736, -3.394669, 1, 1, 1, 1, 1,
-1.100101, -0.3036666, -1.578642, 1, 1, 1, 1, 1,
-1.092124, -0.251046, -2.193155, 1, 1, 1, 1, 1,
-1.068598, 0.9532437, -1.059851, 1, 1, 1, 1, 1,
-1.063882, 0.4069582, -2.383056, 1, 1, 1, 1, 1,
-1.052063, 1.574969, -0.229477, 1, 1, 1, 1, 1,
-1.045177, 1.67911, -0.3642837, 1, 1, 1, 1, 1,
-1.040366, -0.3213959, -1.618771, 1, 1, 1, 1, 1,
-1.018467, 0.4903378, -1.159151, 1, 1, 1, 1, 1,
-1.006678, 1.943135, -1.546844, 1, 1, 1, 1, 1,
-1.002485, 0.2280579, -0.8738688, 1, 1, 1, 1, 1,
-0.999063, 1.792971, -0.4965909, 1, 1, 1, 1, 1,
-0.9973484, 2.042537, -1.815925, 1, 1, 1, 1, 1,
-0.9973276, 0.630592, -0.2432355, 0, 0, 1, 1, 1,
-0.9936301, -0.3359208, -1.139535, 1, 0, 0, 1, 1,
-0.9922165, 0.7073119, -1.253268, 1, 0, 0, 1, 1,
-0.9847151, 0.8092614, -0.9379018, 1, 0, 0, 1, 1,
-0.9819061, 0.9728272, -1.497797, 1, 0, 0, 1, 1,
-0.9818378, -0.4077746, -1.497066, 1, 0, 0, 1, 1,
-0.9769905, -1.174886, -2.290128, 0, 0, 0, 1, 1,
-0.9752418, 0.2653399, -3.382765, 0, 0, 0, 1, 1,
-0.9694944, -1.632392, -4.294723, 0, 0, 0, 1, 1,
-0.9599562, -1.364867, -3.43769, 0, 0, 0, 1, 1,
-0.955906, -0.1272419, -2.095172, 0, 0, 0, 1, 1,
-0.9557023, -1.459444, 0.4350959, 0, 0, 0, 1, 1,
-0.9537118, 0.2449362, -1.744264, 0, 0, 0, 1, 1,
-0.9530136, -0.05171623, -2.694576, 1, 1, 1, 1, 1,
-0.9391443, 0.008959306, -1.071546, 1, 1, 1, 1, 1,
-0.936743, -0.3021115, -0.8812118, 1, 1, 1, 1, 1,
-0.9341291, 0.3664579, -2.044723, 1, 1, 1, 1, 1,
-0.9338654, -0.4977555, -2.379993, 1, 1, 1, 1, 1,
-0.9317825, 0.2888157, -0.5912589, 1, 1, 1, 1, 1,
-0.927922, -0.3965661, -1.869191, 1, 1, 1, 1, 1,
-0.9222407, -1.344023, -0.6089488, 1, 1, 1, 1, 1,
-0.9190784, 0.2866404, -0.2899178, 1, 1, 1, 1, 1,
-0.9170279, 1.611655, -0.5555465, 1, 1, 1, 1, 1,
-0.9158588, 0.6402662, -0.7868851, 1, 1, 1, 1, 1,
-0.9138369, -0.6145861, -2.458436, 1, 1, 1, 1, 1,
-0.9107792, -0.6244147, -3.185104, 1, 1, 1, 1, 1,
-0.9104537, -0.9985737, -2.70096, 1, 1, 1, 1, 1,
-0.9098711, 0.2338195, -2.144782, 1, 1, 1, 1, 1,
-0.9063323, -0.2254253, -1.496881, 0, 0, 1, 1, 1,
-0.9049125, 0.9585633, -1.348249, 1, 0, 0, 1, 1,
-0.8949268, 0.3071003, -1.318549, 1, 0, 0, 1, 1,
-0.8946052, 1.920062, -0.5776457, 1, 0, 0, 1, 1,
-0.8873199, 0.6315234, -2.361309, 1, 0, 0, 1, 1,
-0.8837426, -1.839645, -3.701078, 1, 0, 0, 1, 1,
-0.8772133, -0.9563568, -2.92345, 0, 0, 0, 1, 1,
-0.8770306, 0.1184893, -0.6807615, 0, 0, 0, 1, 1,
-0.8747075, -1.019644, -2.008094, 0, 0, 0, 1, 1,
-0.8713174, 0.7624575, -1.928597, 0, 0, 0, 1, 1,
-0.8707097, 1.055887, -1.200717, 0, 0, 0, 1, 1,
-0.865467, -0.5092088, -2.456463, 0, 0, 0, 1, 1,
-0.8625211, -0.5128211, -2.991669, 0, 0, 0, 1, 1,
-0.8609378, 1.119048, -1.693993, 1, 1, 1, 1, 1,
-0.8566657, 0.4166133, -0.1891697, 1, 1, 1, 1, 1,
-0.8563979, -0.4139738, -2.822725, 1, 1, 1, 1, 1,
-0.8547028, -0.8979411, -0.4168954, 1, 1, 1, 1, 1,
-0.8506602, 0.1784745, 0.342048, 1, 1, 1, 1, 1,
-0.850328, 1.693192, -0.6938598, 1, 1, 1, 1, 1,
-0.8468008, -0.120047, -2.435304, 1, 1, 1, 1, 1,
-0.8452094, -0.526045, -1.15125, 1, 1, 1, 1, 1,
-0.835486, 0.5881678, 1.202402, 1, 1, 1, 1, 1,
-0.8341544, 0.802301, 0.2131419, 1, 1, 1, 1, 1,
-0.8315865, 0.2839871, -0.1954593, 1, 1, 1, 1, 1,
-0.8314968, -3.130292, -3.225887, 1, 1, 1, 1, 1,
-0.8251826, -1.51587, -2.276006, 1, 1, 1, 1, 1,
-0.8235322, -0.05716616, -2.168303, 1, 1, 1, 1, 1,
-0.8205224, 1.009201, -0.1815094, 1, 1, 1, 1, 1,
-0.8079986, -0.637893, 0.2207373, 0, 0, 1, 1, 1,
-0.8031071, 2.06408, -0.6717194, 1, 0, 0, 1, 1,
-0.8006157, -1.369794, -0.8666174, 1, 0, 0, 1, 1,
-0.7995912, 1.251934, -1.40136, 1, 0, 0, 1, 1,
-0.7985286, -0.6358396, -2.768965, 1, 0, 0, 1, 1,
-0.7983893, 0.684126, -1.506544, 1, 0, 0, 1, 1,
-0.7923583, -0.1373892, -2.424378, 0, 0, 0, 1, 1,
-0.7902543, -0.05124783, -2.841941, 0, 0, 0, 1, 1,
-0.7873362, 0.4049803, -0.2208285, 0, 0, 0, 1, 1,
-0.7854689, 3.537942, -3.62917, 0, 0, 0, 1, 1,
-0.7834869, 1.419189, 0.7026734, 0, 0, 0, 1, 1,
-0.7834235, -1.08145, -3.073134, 0, 0, 0, 1, 1,
-0.7728819, -0.3696416, -1.354695, 0, 0, 0, 1, 1,
-0.7649943, 0.1839681, -0.8618752, 1, 1, 1, 1, 1,
-0.7493875, 1.548062, -0.5993118, 1, 1, 1, 1, 1,
-0.7484413, 1.230031, 0.9108981, 1, 1, 1, 1, 1,
-0.7474881, -0.570598, -2.463009, 1, 1, 1, 1, 1,
-0.7434595, -0.1107181, -2.675254, 1, 1, 1, 1, 1,
-0.7385713, 1.376152, -1.234085, 1, 1, 1, 1, 1,
-0.7336743, -0.2311521, -2.696148, 1, 1, 1, 1, 1,
-0.7321714, 1.280396, -1.826985, 1, 1, 1, 1, 1,
-0.7298583, -0.7272834, -2.244914, 1, 1, 1, 1, 1,
-0.7275608, -0.7601785, -2.890686, 1, 1, 1, 1, 1,
-0.7267414, 0.0116816, -1.764954, 1, 1, 1, 1, 1,
-0.7212148, -0.2602057, -2.831842, 1, 1, 1, 1, 1,
-0.7192639, -1.060291, -2.297379, 1, 1, 1, 1, 1,
-0.716938, -1.279518, -1.547873, 1, 1, 1, 1, 1,
-0.7153546, 0.7762508, -2.432488, 1, 1, 1, 1, 1,
-0.7135693, 0.5275826, -1.28194, 0, 0, 1, 1, 1,
-0.7097707, -0.3003032, -2.159695, 1, 0, 0, 1, 1,
-0.7078534, 0.830582, -1.461178, 1, 0, 0, 1, 1,
-0.7055593, 0.9099316, 1.874325, 1, 0, 0, 1, 1,
-0.7005614, -2.073715, -1.189963, 1, 0, 0, 1, 1,
-0.7003562, 0.1992769, -1.712711, 1, 0, 0, 1, 1,
-0.6980891, 0.2288576, -1.475367, 0, 0, 0, 1, 1,
-0.6943906, -0.047398, -1.30453, 0, 0, 0, 1, 1,
-0.6898725, -0.3811051, -0.7802715, 0, 0, 0, 1, 1,
-0.6886014, 0.1613645, -2.016806, 0, 0, 0, 1, 1,
-0.6883229, -0.5498303, -3.077443, 0, 0, 0, 1, 1,
-0.6868463, -1.331139, -1.810786, 0, 0, 0, 1, 1,
-0.6832869, 0.3801142, -1.296312, 0, 0, 0, 1, 1,
-0.681356, 0.07100419, -2.017282, 1, 1, 1, 1, 1,
-0.6787686, 0.2072337, -0.7444788, 1, 1, 1, 1, 1,
-0.6779853, 1.483281, 1.582797, 1, 1, 1, 1, 1,
-0.6754936, 0.2462783, 0.6082702, 1, 1, 1, 1, 1,
-0.6749302, -0.5581649, -2.709901, 1, 1, 1, 1, 1,
-0.67168, 1.157586, -0.4686516, 1, 1, 1, 1, 1,
-0.6712394, 0.7475962, -1.321149, 1, 1, 1, 1, 1,
-0.6634858, 0.0644266, -1.218028, 1, 1, 1, 1, 1,
-0.6630061, 0.329971, -1.69305, 1, 1, 1, 1, 1,
-0.6602703, 0.8294669, -0.5618452, 1, 1, 1, 1, 1,
-0.6582814, -0.4315231, -3.311002, 1, 1, 1, 1, 1,
-0.6576997, -0.4323326, -3.244441, 1, 1, 1, 1, 1,
-0.65544, 0.3750653, -2.150149, 1, 1, 1, 1, 1,
-0.6552973, -0.3686294, -3.014742, 1, 1, 1, 1, 1,
-0.654256, 0.6876674, -1.409019, 1, 1, 1, 1, 1,
-0.6500266, -0.3428935, -0.6604081, 0, 0, 1, 1, 1,
-0.6494744, -0.3076379, -2.085442, 1, 0, 0, 1, 1,
-0.6475151, -0.1075432, -3.421497, 1, 0, 0, 1, 1,
-0.6411166, -0.1174282, -2.403503, 1, 0, 0, 1, 1,
-0.6393465, 0.3370665, -0.1771547, 1, 0, 0, 1, 1,
-0.6376736, 0.6929061, -1.289445, 1, 0, 0, 1, 1,
-0.6366443, -0.7580408, -0.5592071, 0, 0, 0, 1, 1,
-0.6261038, 0.9261423, -0.4893318, 0, 0, 0, 1, 1,
-0.6251228, -0.3234519, -2.694141, 0, 0, 0, 1, 1,
-0.6248401, -1.101062, -3.567089, 0, 0, 0, 1, 1,
-0.623049, 1.173152, -1.136262, 0, 0, 0, 1, 1,
-0.6198101, 1.405252, -1.698525, 0, 0, 0, 1, 1,
-0.6190922, 0.7047487, 0.04099329, 0, 0, 0, 1, 1,
-0.605625, 0.6224945, -0.6197953, 1, 1, 1, 1, 1,
-0.5972481, -0.2100953, -2.396584, 1, 1, 1, 1, 1,
-0.5970805, 0.01687524, -3.068905, 1, 1, 1, 1, 1,
-0.5969973, 0.4621238, -0.4530694, 1, 1, 1, 1, 1,
-0.5941898, 0.2367334, -0.5172662, 1, 1, 1, 1, 1,
-0.5841136, 1.42426, -0.02769684, 1, 1, 1, 1, 1,
-0.5836819, -1.320222, -3.822368, 1, 1, 1, 1, 1,
-0.580992, 0.9755603, 0.6766756, 1, 1, 1, 1, 1,
-0.5809607, 0.01932939, -0.6370991, 1, 1, 1, 1, 1,
-0.5780183, -1.940819, -3.600571, 1, 1, 1, 1, 1,
-0.5635074, -1.292226, -2.927601, 1, 1, 1, 1, 1,
-0.5596517, 0.9410468, 0.3708788, 1, 1, 1, 1, 1,
-0.5548729, 0.8616142, -0.2700681, 1, 1, 1, 1, 1,
-0.5510143, -0.4509458, -2.10352, 1, 1, 1, 1, 1,
-0.5503145, 2.394372, -0.4847089, 1, 1, 1, 1, 1,
-0.5359533, -0.09201507, -1.796381, 0, 0, 1, 1, 1,
-0.5359045, 0.1010362, -1.019603, 1, 0, 0, 1, 1,
-0.5307491, -0.690906, -2.431237, 1, 0, 0, 1, 1,
-0.5206729, -1.46119, -2.238965, 1, 0, 0, 1, 1,
-0.5199572, 0.3460117, 0.4186742, 1, 0, 0, 1, 1,
-0.5169063, -0.2676527, 0.4854943, 1, 0, 0, 1, 1,
-0.5139078, 0.6288586, 0.01954858, 0, 0, 0, 1, 1,
-0.5093365, 0.1967366, -3.425535, 0, 0, 0, 1, 1,
-0.5082745, -0.5654758, -1.837478, 0, 0, 0, 1, 1,
-0.5069376, -0.03356264, -0.6527984, 0, 0, 0, 1, 1,
-0.5018959, 1.402747, 0.03988872, 0, 0, 0, 1, 1,
-0.4963345, -0.9385054, -4.124318, 0, 0, 0, 1, 1,
-0.4957722, -0.7932438, -4.126034, 0, 0, 0, 1, 1,
-0.4933147, 0.8879715, 0.3460867, 1, 1, 1, 1, 1,
-0.4927273, -0.3668053, -1.268203, 1, 1, 1, 1, 1,
-0.4920452, 0.8241916, -0.4655193, 1, 1, 1, 1, 1,
-0.4910069, 1.353283, -1.617536, 1, 1, 1, 1, 1,
-0.4889982, 1.187673, -1.062679, 1, 1, 1, 1, 1,
-0.4814751, 0.761847, 0.3826184, 1, 1, 1, 1, 1,
-0.4782871, 1.382921, -2.18277, 1, 1, 1, 1, 1,
-0.4672325, -0.3892576, -1.897255, 1, 1, 1, 1, 1,
-0.4644561, 1.981186, 0.2184222, 1, 1, 1, 1, 1,
-0.4628836, -1.232577, -3.079063, 1, 1, 1, 1, 1,
-0.4570806, 0.5518032, 0.1551872, 1, 1, 1, 1, 1,
-0.4500784, 0.8636717, -0.9803034, 1, 1, 1, 1, 1,
-0.4420998, -2.07829, -3.643776, 1, 1, 1, 1, 1,
-0.4402468, 0.5998594, -0.1689559, 1, 1, 1, 1, 1,
-0.4379564, 0.04612366, 0.4669386, 1, 1, 1, 1, 1,
-0.4349451, -0.8668683, -1.422662, 0, 0, 1, 1, 1,
-0.4329849, 1.025051, -1.011024, 1, 0, 0, 1, 1,
-0.4317908, 0.31376, -1.188385, 1, 0, 0, 1, 1,
-0.4309079, 0.08370467, -1.431088, 1, 0, 0, 1, 1,
-0.4292459, 0.4786461, -1.23736, 1, 0, 0, 1, 1,
-0.426425, 1.376466, 1.488609, 1, 0, 0, 1, 1,
-0.4257093, 0.1369659, -1.2217, 0, 0, 0, 1, 1,
-0.4232855, 0.2279672, -1.519968, 0, 0, 0, 1, 1,
-0.4207418, -1.171535, -2.248145, 0, 0, 0, 1, 1,
-0.4169452, -0.836533, -2.615832, 0, 0, 0, 1, 1,
-0.4160604, -0.797058, -3.206401, 0, 0, 0, 1, 1,
-0.4124091, 0.4456881, -0.2997669, 0, 0, 0, 1, 1,
-0.4102979, -0.7744335, -1.017967, 0, 0, 0, 1, 1,
-0.408318, -1.504337, -4.272959, 1, 1, 1, 1, 1,
-0.4008491, -0.3736776, -1.281234, 1, 1, 1, 1, 1,
-0.4003963, 0.7442506, 0.7743277, 1, 1, 1, 1, 1,
-0.4003537, 0.9677872, 0.7583458, 1, 1, 1, 1, 1,
-0.3997053, -0.8977134, -2.775655, 1, 1, 1, 1, 1,
-0.3951572, 0.7930107, 0.5039192, 1, 1, 1, 1, 1,
-0.392528, 1.316379, -1.645749, 1, 1, 1, 1, 1,
-0.3889156, 0.3595239, -0.5349783, 1, 1, 1, 1, 1,
-0.3853434, 2.293241, 2.242702, 1, 1, 1, 1, 1,
-0.3843087, -0.04301954, -2.2217, 1, 1, 1, 1, 1,
-0.3838911, -1.008247, -1.96041, 1, 1, 1, 1, 1,
-0.3812206, -2.255821, -2.87149, 1, 1, 1, 1, 1,
-0.3797415, 0.3102536, -0.9757036, 1, 1, 1, 1, 1,
-0.3774698, 1.124573, -1.314504, 1, 1, 1, 1, 1,
-0.3771008, 0.05034522, 0.04812758, 1, 1, 1, 1, 1,
-0.3673528, 1.258353, -0.3626188, 0, 0, 1, 1, 1,
-0.36437, -1.07901, -1.258642, 1, 0, 0, 1, 1,
-0.3588682, -0.1208385, -2.355613, 1, 0, 0, 1, 1,
-0.3561553, 0.533061, -1.767049, 1, 0, 0, 1, 1,
-0.3524685, -1.258094, -3.826886, 1, 0, 0, 1, 1,
-0.3515491, -0.08133408, -1.293721, 1, 0, 0, 1, 1,
-0.3511943, -0.03282224, -1.500454, 0, 0, 0, 1, 1,
-0.3510917, 0.1887667, -1.09158, 0, 0, 0, 1, 1,
-0.3496746, 0.08585829, -1.518414, 0, 0, 0, 1, 1,
-0.3433548, -0.2333066, -4.305792, 0, 0, 0, 1, 1,
-0.3409359, -0.1331208, -1.358917, 0, 0, 0, 1, 1,
-0.3388337, -0.8898865, -2.033917, 0, 0, 0, 1, 1,
-0.3383687, 0.4814004, -0.6326975, 0, 0, 0, 1, 1,
-0.3310742, 0.7231851, -0.2743946, 1, 1, 1, 1, 1,
-0.3301029, -0.2043781, -1.188143, 1, 1, 1, 1, 1,
-0.3278015, 1.410138, -0.3080864, 1, 1, 1, 1, 1,
-0.3174986, -0.1210835, -1.588513, 1, 1, 1, 1, 1,
-0.3131948, -0.9932101, -2.407511, 1, 1, 1, 1, 1,
-0.3124833, 0.54918, -1.442011, 1, 1, 1, 1, 1,
-0.3115114, -0.1706382, -1.970209, 1, 1, 1, 1, 1,
-0.3104272, 1.127905, -0.7845157, 1, 1, 1, 1, 1,
-0.3061422, 0.6500922, -0.2915638, 1, 1, 1, 1, 1,
-0.2965456, -0.06712002, -0.9893543, 1, 1, 1, 1, 1,
-0.2951657, -0.4783518, 0.5965573, 1, 1, 1, 1, 1,
-0.2895963, -0.05399503, -3.062746, 1, 1, 1, 1, 1,
-0.2893284, 0.3776712, -1.409644, 1, 1, 1, 1, 1,
-0.2823917, 2.590064, 1.388245, 1, 1, 1, 1, 1,
-0.2796346, -1.365424, -2.038295, 1, 1, 1, 1, 1,
-0.2770018, 0.08755843, 0.1711011, 0, 0, 1, 1, 1,
-0.2628441, -0.09386079, -2.300822, 1, 0, 0, 1, 1,
-0.2618346, -0.8658024, -2.903524, 1, 0, 0, 1, 1,
-0.2610133, 0.942329, -0.4186133, 1, 0, 0, 1, 1,
-0.2586844, 1.542683, 1.823358, 1, 0, 0, 1, 1,
-0.2578746, 0.1156208, -2.412235, 1, 0, 0, 1, 1,
-0.2573022, -0.1791877, -2.028124, 0, 0, 0, 1, 1,
-0.2539474, -1.236968, -2.527251, 0, 0, 0, 1, 1,
-0.2470824, 1.661044, 0.4421052, 0, 0, 0, 1, 1,
-0.2465182, 0.3135228, -1.242879, 0, 0, 0, 1, 1,
-0.2458861, 0.2344883, -2.245213, 0, 0, 0, 1, 1,
-0.2431776, -0.601384, -4.122973, 0, 0, 0, 1, 1,
-0.2431415, -1.821952, -3.702583, 0, 0, 0, 1, 1,
-0.2424524, -0.07152018, -0.5043508, 1, 1, 1, 1, 1,
-0.2393608, -0.2303533, -2.090193, 1, 1, 1, 1, 1,
-0.2362131, -0.6606779, -3.155117, 1, 1, 1, 1, 1,
-0.2334149, 0.01142952, -1.84587, 1, 1, 1, 1, 1,
-0.2321399, -1.299348, -2.844416, 1, 1, 1, 1, 1,
-0.2298834, 0.09090291, -1.574178, 1, 1, 1, 1, 1,
-0.2289941, -1.261278, -2.533204, 1, 1, 1, 1, 1,
-0.2265893, 0.8862606, 1.959387, 1, 1, 1, 1, 1,
-0.2231031, -0.9323696, -2.300283, 1, 1, 1, 1, 1,
-0.223027, 1.529478, -0.7208861, 1, 1, 1, 1, 1,
-0.2209934, -0.7385265, -3.85296, 1, 1, 1, 1, 1,
-0.2209339, -0.7361383, -3.534346, 1, 1, 1, 1, 1,
-0.2184907, -1.3707, -1.172823, 1, 1, 1, 1, 1,
-0.2155961, 1.082786, -1.085472, 1, 1, 1, 1, 1,
-0.2137306, -0.6603911, -3.361674, 1, 1, 1, 1, 1,
-0.2096345, 0.14269, -2.545638, 0, 0, 1, 1, 1,
-0.2074382, 0.2944596, 0.1892287, 1, 0, 0, 1, 1,
-0.2040841, -0.0667118, -1.483441, 1, 0, 0, 1, 1,
-0.203366, -0.3342262, -2.520617, 1, 0, 0, 1, 1,
-0.2007975, 0.04517495, -1.005566, 1, 0, 0, 1, 1,
-0.2003457, -1.147196, -3.967326, 1, 0, 0, 1, 1,
-0.1951985, -0.2947724, -2.100684, 0, 0, 0, 1, 1,
-0.1937361, -1.356067, -2.059772, 0, 0, 0, 1, 1,
-0.1891162, -1.911486, -2.310464, 0, 0, 0, 1, 1,
-0.1884694, -1.163978, -3.242439, 0, 0, 0, 1, 1,
-0.1882948, 3.238512, 0.6125448, 0, 0, 0, 1, 1,
-0.186069, 0.3781342, 0.9254827, 0, 0, 0, 1, 1,
-0.1846568, 0.4790729, 0.2901488, 0, 0, 0, 1, 1,
-0.1834495, 1.177994, -1.067921, 1, 1, 1, 1, 1,
-0.1815152, -1.00816, -2.259815, 1, 1, 1, 1, 1,
-0.176116, 0.8456185, -0.97685, 1, 1, 1, 1, 1,
-0.1750389, -1.361454, -2.984102, 1, 1, 1, 1, 1,
-0.173654, -0.9132869, -3.717348, 1, 1, 1, 1, 1,
-0.1711927, -0.9440674, -3.602361, 1, 1, 1, 1, 1,
-0.1682588, 0.4793746, 1.256045, 1, 1, 1, 1, 1,
-0.167239, -0.06879633, -1.173174, 1, 1, 1, 1, 1,
-0.1634147, -0.5898427, -2.066407, 1, 1, 1, 1, 1,
-0.1613816, -0.2986777, -4.887555, 1, 1, 1, 1, 1,
-0.1603359, 0.1314729, 0.6816288, 1, 1, 1, 1, 1,
-0.1591252, 0.6223252, 0.2300003, 1, 1, 1, 1, 1,
-0.1574463, -0.5677558, -3.822967, 1, 1, 1, 1, 1,
-0.1569613, -0.6770432, -3.608853, 1, 1, 1, 1, 1,
-0.1548264, -1.043038, -3.530901, 1, 1, 1, 1, 1,
-0.1534399, 0.2229717, -2.337207, 0, 0, 1, 1, 1,
-0.1531391, 0.8173504, 0.8432404, 1, 0, 0, 1, 1,
-0.1482147, -0.2769088, -2.146929, 1, 0, 0, 1, 1,
-0.1447259, -1.145203, -3.364531, 1, 0, 0, 1, 1,
-0.1402925, 0.3226404, 0.4303815, 1, 0, 0, 1, 1,
-0.139991, -0.2005533, -3.667465, 1, 0, 0, 1, 1,
-0.1393285, 2.245634, -0.6685752, 0, 0, 0, 1, 1,
-0.1349114, 1.231914, -0.2454343, 0, 0, 0, 1, 1,
-0.1326736, 0.4480007, -0.05874376, 0, 0, 0, 1, 1,
-0.1307958, 1.582109, 0.1497095, 0, 0, 0, 1, 1,
-0.1252111, 0.713249, 1.006515, 0, 0, 0, 1, 1,
-0.1248763, -1.140688, -3.233477, 0, 0, 0, 1, 1,
-0.1205424, 1.718232, 0.02296896, 0, 0, 0, 1, 1,
-0.1189848, 1.314259, -0.7982389, 1, 1, 1, 1, 1,
-0.1177138, 1.259632, 0.7506508, 1, 1, 1, 1, 1,
-0.1169348, 1.473446, 0.2739066, 1, 1, 1, 1, 1,
-0.1157167, -2.164624, -4.072243, 1, 1, 1, 1, 1,
-0.108008, -0.3392113, -4.147107, 1, 1, 1, 1, 1,
-0.1046205, -0.6992039, -1.870221, 1, 1, 1, 1, 1,
-0.1032984, 0.1642411, -0.5256411, 1, 1, 1, 1, 1,
-0.09948781, -1.04011, -2.055702, 1, 1, 1, 1, 1,
-0.09855637, 0.478975, 0.4160787, 1, 1, 1, 1, 1,
-0.09855323, 1.418607, 1.412039, 1, 1, 1, 1, 1,
-0.09799075, -0.422458, -4.184387, 1, 1, 1, 1, 1,
-0.09486946, -0.05217467, -0.5485096, 1, 1, 1, 1, 1,
-0.09437529, 0.7475368, 0.3128636, 1, 1, 1, 1, 1,
-0.08648632, -0.6620349, -4.055198, 1, 1, 1, 1, 1,
-0.08451581, 0.4901941, -1.745497, 1, 1, 1, 1, 1,
-0.07799991, 2.812739, -0.7118366, 0, 0, 1, 1, 1,
-0.07406323, 1.050581, 0.2909147, 1, 0, 0, 1, 1,
-0.07350771, -0.3496891, -1.766229, 1, 0, 0, 1, 1,
-0.07318146, -0.8944761, -1.992484, 1, 0, 0, 1, 1,
-0.07269481, 2.128632, -0.4598177, 1, 0, 0, 1, 1,
-0.07080448, -0.709159, -3.667887, 1, 0, 0, 1, 1,
-0.07011484, 0.1638063, 1.400499, 0, 0, 0, 1, 1,
-0.06868354, 0.6811245, -0.6493522, 0, 0, 0, 1, 1,
-0.06402066, -0.574062, -2.422294, 0, 0, 0, 1, 1,
-0.05492971, 1.726268, -0.8520724, 0, 0, 0, 1, 1,
-0.05052144, 0.1280635, 1.212553, 0, 0, 0, 1, 1,
-0.05043596, 0.2141955, -1.783765, 0, 0, 0, 1, 1,
-0.05012453, -1.467874, -2.284281, 0, 0, 0, 1, 1,
-0.0455034, 0.4111066, -1.059791, 1, 1, 1, 1, 1,
-0.04404499, -0.9726046, -3.345138, 1, 1, 1, 1, 1,
-0.03934087, -0.8115172, -2.419014, 1, 1, 1, 1, 1,
-0.03909242, 0.4065208, -0.06301279, 1, 1, 1, 1, 1,
-0.03507867, 1.827081, 1.086057, 1, 1, 1, 1, 1,
-0.03378127, -0.6928475, -3.196119, 1, 1, 1, 1, 1,
-0.03037232, 0.2869019, 0.9737207, 1, 1, 1, 1, 1,
-0.03027645, 0.3514359, 0.5077758, 1, 1, 1, 1, 1,
-0.0270134, 0.4204667, -0.4389479, 1, 1, 1, 1, 1,
-0.02404452, -2.490127, -6.816693, 1, 1, 1, 1, 1,
-0.01978625, -0.7080972, -1.41117, 1, 1, 1, 1, 1,
-0.01804189, 0.3563672, 1.547716, 1, 1, 1, 1, 1,
-0.01779401, -0.1379434, -3.716223, 1, 1, 1, 1, 1,
-0.01651935, -0.1742236, -6.205942, 1, 1, 1, 1, 1,
-0.01648437, 1.494078, -0.4888804, 1, 1, 1, 1, 1,
-0.007931432, 0.811353, 1.347251, 0, 0, 1, 1, 1,
-0.006835602, 1.523005, -1.351918, 1, 0, 0, 1, 1,
-0.004024693, 0.2988779, -0.2191804, 1, 0, 0, 1, 1,
-0.001356197, 0.5427873, 2.203609, 1, 0, 0, 1, 1,
-0.000335536, -0.6987432, -4.79403, 1, 0, 0, 1, 1,
0.000277834, 0.6910281, -0.9284208, 1, 0, 0, 1, 1,
0.01009625, 0.3197444, 1.212403, 0, 0, 0, 1, 1,
0.01042646, 0.6045887, 1.328118, 0, 0, 0, 1, 1,
0.01277416, -2.484808, 4.329567, 0, 0, 0, 1, 1,
0.01379369, 0.5802564, -1.111003, 0, 0, 0, 1, 1,
0.01400149, 0.831901, -0.7476934, 0, 0, 0, 1, 1,
0.01655998, 0.4011993, 0.6413792, 0, 0, 0, 1, 1,
0.01658689, -2.117345, 2.291941, 0, 0, 0, 1, 1,
0.01805573, -0.2357257, 2.881277, 1, 1, 1, 1, 1,
0.02686654, -1.5853, 4.475701, 1, 1, 1, 1, 1,
0.02789819, -0.1066895, 2.581911, 1, 1, 1, 1, 1,
0.02831945, 0.776596, 0.08028804, 1, 1, 1, 1, 1,
0.03027286, 0.6536103, 0.9371677, 1, 1, 1, 1, 1,
0.03500856, -1.230325, 1.923176, 1, 1, 1, 1, 1,
0.03848881, 0.2142705, 0.6983693, 1, 1, 1, 1, 1,
0.04036381, 0.5969425, 1.192005, 1, 1, 1, 1, 1,
0.0416624, 0.986149, 0.4185019, 1, 1, 1, 1, 1,
0.04743339, -1.497443, 3.977506, 1, 1, 1, 1, 1,
0.04748939, 0.8854949, -1.48519, 1, 1, 1, 1, 1,
0.05472205, 0.3118986, 1.134327, 1, 1, 1, 1, 1,
0.05585277, 0.8130577, 0.8674783, 1, 1, 1, 1, 1,
0.05587158, -0.5914725, 2.042577, 1, 1, 1, 1, 1,
0.07148848, -0.7656217, 4.71662, 1, 1, 1, 1, 1,
0.072739, 0.5859206, -0.2980983, 0, 0, 1, 1, 1,
0.07604813, 0.3920938, -0.1586648, 1, 0, 0, 1, 1,
0.07703904, 0.1930509, 1.465804, 1, 0, 0, 1, 1,
0.0776678, 1.652607, -0.2036667, 1, 0, 0, 1, 1,
0.07939582, 0.5882714, -0.3592344, 1, 0, 0, 1, 1,
0.08158757, -0.8522643, 2.267658, 1, 0, 0, 1, 1,
0.08625721, 0.3326302, -0.8952665, 0, 0, 0, 1, 1,
0.09728886, 0.1108793, 0.902035, 0, 0, 0, 1, 1,
0.09918777, 0.6052514, -0.6685324, 0, 0, 0, 1, 1,
0.1103992, 1.65727, 1.722608, 0, 0, 0, 1, 1,
0.1120592, -0.2442857, 1.43042, 0, 0, 0, 1, 1,
0.112443, 1.453739, -0.9701605, 0, 0, 0, 1, 1,
0.1166608, -0.06688026, 2.60338, 0, 0, 0, 1, 1,
0.1221453, 0.04994736, 1.927962, 1, 1, 1, 1, 1,
0.122477, 0.7576464, -0.7794883, 1, 1, 1, 1, 1,
0.123197, 0.5346084, 1.841978, 1, 1, 1, 1, 1,
0.1236429, 0.5992381, 1.169448, 1, 1, 1, 1, 1,
0.1256706, 1.059533, -0.4613908, 1, 1, 1, 1, 1,
0.1286111, -0.09366263, 1.416518, 1, 1, 1, 1, 1,
0.1296477, 0.1011072, 0.4567344, 1, 1, 1, 1, 1,
0.1314519, -2.347382, 2.906803, 1, 1, 1, 1, 1,
0.1360007, -0.0327559, 1.546836, 1, 1, 1, 1, 1,
0.1387914, -1.154611, 2.158104, 1, 1, 1, 1, 1,
0.1394378, -1.619555, 4.825363, 1, 1, 1, 1, 1,
0.1409262, -0.5005181, 2.805729, 1, 1, 1, 1, 1,
0.1412605, 0.6582907, -0.1069457, 1, 1, 1, 1, 1,
0.1477882, 0.4028329, -0.6741287, 1, 1, 1, 1, 1,
0.1488964, 0.4855553, 0.6081473, 1, 1, 1, 1, 1,
0.1494599, 2.356746, -0.01967117, 0, 0, 1, 1, 1,
0.1576428, 2.016966, -0.6418273, 1, 0, 0, 1, 1,
0.1586431, -1.047346, 3.748947, 1, 0, 0, 1, 1,
0.1609636, 0.1212975, 2.327984, 1, 0, 0, 1, 1,
0.1640711, 2.271752, 0.992541, 1, 0, 0, 1, 1,
0.1730067, -1.438984, 3.360466, 1, 0, 0, 1, 1,
0.1737655, -0.01107726, 0.2007574, 0, 0, 0, 1, 1,
0.1760841, -1.437572, 3.517923, 0, 0, 0, 1, 1,
0.1777798, -0.5709938, 2.097447, 0, 0, 0, 1, 1,
0.1801578, 0.9375165, 0.09501658, 0, 0, 0, 1, 1,
0.1802773, -0.111118, 0.4684801, 0, 0, 0, 1, 1,
0.1811971, -3.265926, 3.791202, 0, 0, 0, 1, 1,
0.1833803, -1.759631, 4.52686, 0, 0, 0, 1, 1,
0.1843673, 1.102356, 0.791577, 1, 1, 1, 1, 1,
0.1844355, 2.359101, -2.296507, 1, 1, 1, 1, 1,
0.1878503, -1.745377, 3.98988, 1, 1, 1, 1, 1,
0.1881255, 0.01725875, 1.570782, 1, 1, 1, 1, 1,
0.1904625, -0.8264878, 0.9604806, 1, 1, 1, 1, 1,
0.1916219, 0.9263854, -0.5002424, 1, 1, 1, 1, 1,
0.1933507, 0.007415064, 1.404841, 1, 1, 1, 1, 1,
0.1950664, -2.168444, 2.60662, 1, 1, 1, 1, 1,
0.2001477, -0.3184025, 3.205425, 1, 1, 1, 1, 1,
0.2040904, -0.7920164, 2.994694, 1, 1, 1, 1, 1,
0.2043715, 0.8032041, 0.449036, 1, 1, 1, 1, 1,
0.2051706, 0.5647598, -0.5420177, 1, 1, 1, 1, 1,
0.2072019, 0.02381593, 2.250791, 1, 1, 1, 1, 1,
0.207928, -0.8811051, 2.666974, 1, 1, 1, 1, 1,
0.208431, -0.4802675, 3.741615, 1, 1, 1, 1, 1,
0.2093092, -0.165802, 1.980338, 0, 0, 1, 1, 1,
0.2098643, 1.173467, 1.377396, 1, 0, 0, 1, 1,
0.2124001, -0.990151, 3.826433, 1, 0, 0, 1, 1,
0.2143007, -0.7783013, 2.566642, 1, 0, 0, 1, 1,
0.2163682, 0.4101961, -0.2241238, 1, 0, 0, 1, 1,
0.217549, -0.3645689, 1.922856, 1, 0, 0, 1, 1,
0.2178097, 0.4064622, 1.273487, 0, 0, 0, 1, 1,
0.2189661, 1.174139, -0.2401736, 0, 0, 0, 1, 1,
0.2219668, 0.9537609, 2.461329, 0, 0, 0, 1, 1,
0.2237668, 1.405165, 0.4789599, 0, 0, 0, 1, 1,
0.2237846, 0.3314597, 1.573946, 0, 0, 0, 1, 1,
0.2258505, 0.8578345, -1.428005, 0, 0, 0, 1, 1,
0.2278886, -0.2254997, 2.823347, 0, 0, 0, 1, 1,
0.2282746, 0.8554793, 1.786109, 1, 1, 1, 1, 1,
0.2326726, 0.8538537, -0.2681471, 1, 1, 1, 1, 1,
0.2329196, 0.4544888, 0.771045, 1, 1, 1, 1, 1,
0.2363732, -1.829283, 3.38692, 1, 1, 1, 1, 1,
0.2389453, -2.276518, 4.722219, 1, 1, 1, 1, 1,
0.2409392, -1.041126, 3.121155, 1, 1, 1, 1, 1,
0.2416921, 1.399963, 0.4984965, 1, 1, 1, 1, 1,
0.2436509, -0.3552193, 2.426313, 1, 1, 1, 1, 1,
0.2445073, -0.4100235, 3.19197, 1, 1, 1, 1, 1,
0.2488852, -0.8761185, 3.140994, 1, 1, 1, 1, 1,
0.2515743, -0.3952602, 0.2251566, 1, 1, 1, 1, 1,
0.2579931, -0.2898932, 1.187608, 1, 1, 1, 1, 1,
0.2581864, 0.9486223, 2.315712, 1, 1, 1, 1, 1,
0.2611598, -0.3951545, 1.33221, 1, 1, 1, 1, 1,
0.2641793, -0.1046497, 2.295261, 1, 1, 1, 1, 1,
0.2657569, 0.8691293, 0.3731625, 0, 0, 1, 1, 1,
0.2723858, 0.4236459, 0.7971197, 1, 0, 0, 1, 1,
0.27371, -1.355908, 3.198058, 1, 0, 0, 1, 1,
0.27416, -0.5553623, 2.003175, 1, 0, 0, 1, 1,
0.2745267, -0.5321845, 2.161867, 1, 0, 0, 1, 1,
0.2795214, 0.2852667, 1.461995, 1, 0, 0, 1, 1,
0.2796647, 1.180014, 2.230282, 0, 0, 0, 1, 1,
0.2835744, -1.362847, 3.015846, 0, 0, 0, 1, 1,
0.2878994, 2.301316, -0.02851626, 0, 0, 0, 1, 1,
0.2915029, -0.05603669, 0.6132302, 0, 0, 0, 1, 1,
0.2923318, 0.2523016, 2.765298, 0, 0, 0, 1, 1,
0.2930178, -1.281616, 1.773353, 0, 0, 0, 1, 1,
0.2944637, -1.745461, 1.785266, 0, 0, 0, 1, 1,
0.2962199, 1.159304, 0.534754, 1, 1, 1, 1, 1,
0.2969114, -0.1026936, 1.377724, 1, 1, 1, 1, 1,
0.2972373, 0.3592156, 1.089604, 1, 1, 1, 1, 1,
0.2994326, -1.289521, 3.56182, 1, 1, 1, 1, 1,
0.2999144, -1.311822, 2.369112, 1, 1, 1, 1, 1,
0.3041579, 0.9577443, 1.184183, 1, 1, 1, 1, 1,
0.3085165, -0.2609783, 3.23528, 1, 1, 1, 1, 1,
0.3117831, -0.4753021, 3.019287, 1, 1, 1, 1, 1,
0.3127825, 1.789739, -0.593217, 1, 1, 1, 1, 1,
0.3227115, 0.8477964, 0.0482134, 1, 1, 1, 1, 1,
0.3334278, 0.5315451, 0.795104, 1, 1, 1, 1, 1,
0.3359709, -0.443157, 3.874695, 1, 1, 1, 1, 1,
0.3367838, 0.5216338, 0.5898433, 1, 1, 1, 1, 1,
0.3474838, -0.6735498, 3.495738, 1, 1, 1, 1, 1,
0.3517482, 0.05195674, 0.6398826, 1, 1, 1, 1, 1,
0.3526627, 1.192247, 0.172237, 0, 0, 1, 1, 1,
0.3575404, -0.300991, 2.514714, 1, 0, 0, 1, 1,
0.3598599, -0.4654081, 0.9155926, 1, 0, 0, 1, 1,
0.3654682, 0.7994407, 1.654299, 1, 0, 0, 1, 1,
0.3657133, 0.21077, 2.618227, 1, 0, 0, 1, 1,
0.3744113, 0.8035032, 0.2929727, 1, 0, 0, 1, 1,
0.3744536, 0.9436786, 0.5692211, 0, 0, 0, 1, 1,
0.3746184, 1.713771, 1.000499, 0, 0, 0, 1, 1,
0.3759552, 0.1448883, 0.9838659, 0, 0, 0, 1, 1,
0.3769564, 1.640688, -1.279866, 0, 0, 0, 1, 1,
0.3811246, 0.235455, -0.00884935, 0, 0, 0, 1, 1,
0.3837589, 0.7091503, -0.01560109, 0, 0, 0, 1, 1,
0.3837607, -0.6035523, 2.150549, 0, 0, 0, 1, 1,
0.3848151, 0.850718, -1.850902, 1, 1, 1, 1, 1,
0.3866849, -0.3148433, 2.779797, 1, 1, 1, 1, 1,
0.3923061, -2.300236, 2.396368, 1, 1, 1, 1, 1,
0.3926942, 0.09699665, 0.9933335, 1, 1, 1, 1, 1,
0.3931359, 1.135897, 0.5107202, 1, 1, 1, 1, 1,
0.3935153, 1.267908, -0.7561593, 1, 1, 1, 1, 1,
0.3948061, 0.9312356, -1.891327, 1, 1, 1, 1, 1,
0.3961143, 0.3221862, 1.061302, 1, 1, 1, 1, 1,
0.3998719, 1.149498, 0.4973046, 1, 1, 1, 1, 1,
0.4122607, -0.6048263, 1.480665, 1, 1, 1, 1, 1,
0.4128761, 1.799661, 0.6983547, 1, 1, 1, 1, 1,
0.4138288, -0.4094215, 4.067293, 1, 1, 1, 1, 1,
0.4184294, 1.372078, 1.620804, 1, 1, 1, 1, 1,
0.4258005, 0.3152743, 1.681694, 1, 1, 1, 1, 1,
0.4258377, -1.569994, 3.393488, 1, 1, 1, 1, 1,
0.42699, -1.317288, 0.8531886, 0, 0, 1, 1, 1,
0.4289579, -1.023419, 2.828582, 1, 0, 0, 1, 1,
0.4298891, -0.004525595, 3.001372, 1, 0, 0, 1, 1,
0.4317181, 0.6182605, -0.2550451, 1, 0, 0, 1, 1,
0.4323147, -0.262557, 2.586763, 1, 0, 0, 1, 1,
0.4329329, 0.7976466, 1.048476, 1, 0, 0, 1, 1,
0.4353621, 1.858205, 0.9280804, 0, 0, 0, 1, 1,
0.4364367, 1.431321, 0.6072543, 0, 0, 0, 1, 1,
0.4367145, -0.3053417, 3.217468, 0, 0, 0, 1, 1,
0.4393034, 0.1208978, 2.232615, 0, 0, 0, 1, 1,
0.4406788, -0.3171581, 1.072312, 0, 0, 0, 1, 1,
0.4420376, -1.794192, 4.839814, 0, 0, 0, 1, 1,
0.4439511, 0.6404692, 1.102445, 0, 0, 0, 1, 1,
0.4454398, 0.4991412, 0.9625486, 1, 1, 1, 1, 1,
0.4502387, 1.63308, 0.4266353, 1, 1, 1, 1, 1,
0.4507177, 1.421633, 1.002853, 1, 1, 1, 1, 1,
0.4521791, -0.7587038, 2.897521, 1, 1, 1, 1, 1,
0.4531596, 0.6582627, 1.452489, 1, 1, 1, 1, 1,
0.4536105, 0.9223241, -1.055164, 1, 1, 1, 1, 1,
0.455844, 0.3621027, 1.330028, 1, 1, 1, 1, 1,
0.4578777, -0.1083978, 1.454337, 1, 1, 1, 1, 1,
0.458331, 0.9032349, 0.6036833, 1, 1, 1, 1, 1,
0.4591925, -0.697924, 3.108655, 1, 1, 1, 1, 1,
0.4618942, -1.930774, 3.100684, 1, 1, 1, 1, 1,
0.4630654, 0.07000027, 1.674736, 1, 1, 1, 1, 1,
0.4647873, -0.8038656, 0.8521545, 1, 1, 1, 1, 1,
0.4676571, -0.1369204, 1.465136, 1, 1, 1, 1, 1,
0.468, 0.8816589, 0.3021718, 1, 1, 1, 1, 1,
0.468598, -1.496939, 2.54553, 0, 0, 1, 1, 1,
0.4692768, 1.512723, 0.002951848, 1, 0, 0, 1, 1,
0.4716248, -0.02345791, 1.375014, 1, 0, 0, 1, 1,
0.4749022, 0.2622992, 2.04466, 1, 0, 0, 1, 1,
0.4767433, -1.744763, 0.8923366, 1, 0, 0, 1, 1,
0.4793495, -0.4617995, 3.302459, 1, 0, 0, 1, 1,
0.4817377, -0.005341139, 0.50156, 0, 0, 0, 1, 1,
0.4846682, -1.005686, 2.942307, 0, 0, 0, 1, 1,
0.4967698, 0.7976506, 1.493383, 0, 0, 0, 1, 1,
0.5040839, 0.07121373, 0.9105141, 0, 0, 0, 1, 1,
0.5050026, -1.014273, 2.453397, 0, 0, 0, 1, 1,
0.5124232, 0.007164392, 1.006889, 0, 0, 0, 1, 1,
0.5132174, -0.04793717, 1.347621, 0, 0, 0, 1, 1,
0.5154042, 0.3960451, 0.3982282, 1, 1, 1, 1, 1,
0.5178477, 0.5216779, -0.04521785, 1, 1, 1, 1, 1,
0.5188112, -1.860475, 1.427873, 1, 1, 1, 1, 1,
0.5209368, 1.454336, 0.8399786, 1, 1, 1, 1, 1,
0.5219445, -0.8566541, 2.273717, 1, 1, 1, 1, 1,
0.5231802, 0.8183994, 0.4766926, 1, 1, 1, 1, 1,
0.5232323, -0.3851509, 2.669973, 1, 1, 1, 1, 1,
0.5236824, 0.3328041, -0.4411927, 1, 1, 1, 1, 1,
0.5280856, -1.851024, 2.633883, 1, 1, 1, 1, 1,
0.5312067, 0.0445295, 0.9614199, 1, 1, 1, 1, 1,
0.5352371, 0.2396214, 0.06005357, 1, 1, 1, 1, 1,
0.5391451, 2.278519, 0.2388897, 1, 1, 1, 1, 1,
0.5416529, 0.566399, 0.3413515, 1, 1, 1, 1, 1,
0.5493304, -1.641829, 3.288508, 1, 1, 1, 1, 1,
0.5518742, 1.276938, -0.3903406, 1, 1, 1, 1, 1,
0.5541688, -1.585072, 2.219298, 0, 0, 1, 1, 1,
0.5553495, 0.7119982, 0.7993962, 1, 0, 0, 1, 1,
0.5564702, 0.8193806, 0.9632366, 1, 0, 0, 1, 1,
0.5727465, 1.2305, -0.7317857, 1, 0, 0, 1, 1,
0.5813419, 0.235091, 0.3309919, 1, 0, 0, 1, 1,
0.584346, 1.267369, -0.6540658, 1, 0, 0, 1, 1,
0.5861917, 1.08276, -0.1260874, 0, 0, 0, 1, 1,
0.588948, -1.319135, 2.122543, 0, 0, 0, 1, 1,
0.5911474, -0.5258937, 1.353763, 0, 0, 0, 1, 1,
0.5933173, 1.60382, -0.1398244, 0, 0, 0, 1, 1,
0.5982413, 0.6427751, 1.975662, 0, 0, 0, 1, 1,
0.5995951, 0.03752991, 1.501099, 0, 0, 0, 1, 1,
0.6012098, 0.3862408, -0.5603446, 0, 0, 0, 1, 1,
0.6031124, 0.5072461, -0.8957559, 1, 1, 1, 1, 1,
0.6090373, 0.8459238, -1.223314, 1, 1, 1, 1, 1,
0.6108755, -2.311918, 3.041293, 1, 1, 1, 1, 1,
0.6116013, -1.298627, 1.09093, 1, 1, 1, 1, 1,
0.6149027, -1.168809, 3.204103, 1, 1, 1, 1, 1,
0.6164324, 1.1805, 1.604472, 1, 1, 1, 1, 1,
0.6267993, 0.7664067, -0.4809765, 1, 1, 1, 1, 1,
0.6409507, -0.8078916, 2.798703, 1, 1, 1, 1, 1,
0.6418186, -1.016377, 2.859706, 1, 1, 1, 1, 1,
0.646476, -1.337064, 5.213118, 1, 1, 1, 1, 1,
0.6492938, -0.2481045, 3.427857, 1, 1, 1, 1, 1,
0.6578375, 1.527204, 1.135705, 1, 1, 1, 1, 1,
0.6639702, -0.09795285, 1.597123, 1, 1, 1, 1, 1,
0.6688905, 1.314085, 0.7149914, 1, 1, 1, 1, 1,
0.6756628, 0.2299025, 2.774046, 1, 1, 1, 1, 1,
0.681456, 0.5133868, 0.7007178, 0, 0, 1, 1, 1,
0.6851273, -0.1418733, 3.818245, 1, 0, 0, 1, 1,
0.6854944, 0.8162834, 0.9613376, 1, 0, 0, 1, 1,
0.6860023, -0.08801516, 0.7273259, 1, 0, 0, 1, 1,
0.6886638, 1.210495, 1.202579, 1, 0, 0, 1, 1,
0.689243, -1.303739, 2.424919, 1, 0, 0, 1, 1,
0.6902611, -2.443519, 1.873962, 0, 0, 0, 1, 1,
0.6925426, -0.4080375, 2.319476, 0, 0, 0, 1, 1,
0.6928546, -0.551306, 2.334949, 0, 0, 0, 1, 1,
0.695541, -2.389228, 3.41685, 0, 0, 0, 1, 1,
0.6959262, 0.8032444, 0.9535062, 0, 0, 0, 1, 1,
0.7012019, -0.008367557, 1.695868, 0, 0, 0, 1, 1,
0.7019392, 0.1964748, 0.6998947, 0, 0, 0, 1, 1,
0.7052104, -0.9519066, 3.735178, 1, 1, 1, 1, 1,
0.7069674, 0.2832033, 0.8461729, 1, 1, 1, 1, 1,
0.7106003, 0.2256513, 2.139938, 1, 1, 1, 1, 1,
0.7107806, -0.6139228, 1.224129, 1, 1, 1, 1, 1,
0.7148657, -0.7430322, 2.611933, 1, 1, 1, 1, 1,
0.7180331, 0.7325397, 1.520517, 1, 1, 1, 1, 1,
0.7200257, 1.239984, -0.5044855, 1, 1, 1, 1, 1,
0.7227081, -0.284441, 2.923573, 1, 1, 1, 1, 1,
0.7244442, -1.451161, 2.278469, 1, 1, 1, 1, 1,
0.7254781, -1.838377, 4.291995, 1, 1, 1, 1, 1,
0.7279735, 0.2764502, 1.834938, 1, 1, 1, 1, 1,
0.7292795, 0.6079581, 0.4870456, 1, 1, 1, 1, 1,
0.7324677, 1.630738, 3.385506, 1, 1, 1, 1, 1,
0.7342661, 0.8994797, -0.03216061, 1, 1, 1, 1, 1,
0.7356796, -0.116841, 3.020278, 1, 1, 1, 1, 1,
0.7465643, 1.714454, -1.219208, 0, 0, 1, 1, 1,
0.7471936, -0.8785172, 1.72143, 1, 0, 0, 1, 1,
0.7498898, 0.8140957, -0.06767054, 1, 0, 0, 1, 1,
0.7524934, -0.06739409, 0.3510654, 1, 0, 0, 1, 1,
0.7581526, 0.9837791, 0.01085614, 1, 0, 0, 1, 1,
0.7590864, 0.1429832, -0.3114997, 1, 0, 0, 1, 1,
0.7616776, -0.834693, 2.794112, 0, 0, 0, 1, 1,
0.7622661, -0.643873, 1.597103, 0, 0, 0, 1, 1,
0.7630932, -0.7481675, 2.421415, 0, 0, 0, 1, 1,
0.7631891, -1.403511, 3.271561, 0, 0, 0, 1, 1,
0.7641963, 0.177278, -0.3982059, 0, 0, 0, 1, 1,
0.7740594, -0.2467547, 2.802766, 0, 0, 0, 1, 1,
0.7747325, 0.8878809, -0.2411052, 0, 0, 0, 1, 1,
0.7767235, 0.2263425, 0.9549496, 1, 1, 1, 1, 1,
0.7770079, -0.7185614, 1.53843, 1, 1, 1, 1, 1,
0.7794294, -0.2781414, 2.299493, 1, 1, 1, 1, 1,
0.7796664, 0.2436374, 0.8768023, 1, 1, 1, 1, 1,
0.7816306, 0.6712269, 0.538013, 1, 1, 1, 1, 1,
0.7858783, 0.4906794, 0.6064499, 1, 1, 1, 1, 1,
0.7881215, 0.1876984, 1.078684, 1, 1, 1, 1, 1,
0.788503, 1.388558, 0.6313313, 1, 1, 1, 1, 1,
0.7963036, -0.258523, 0.89101, 1, 1, 1, 1, 1,
0.7978978, 2.016488, 0.06853197, 1, 1, 1, 1, 1,
0.801486, -0.9453599, 1.073189, 1, 1, 1, 1, 1,
0.8053331, -0.2363184, 2.075527, 1, 1, 1, 1, 1,
0.8143682, -0.2044384, 0.7990279, 1, 1, 1, 1, 1,
0.8163502, 0.6941065, 2.808472, 1, 1, 1, 1, 1,
0.8181462, 1.774611, 1.184479, 1, 1, 1, 1, 1,
0.8222309, 0.8564371, 1.070205, 0, 0, 1, 1, 1,
0.8224682, 0.9933946, 0.6880762, 1, 0, 0, 1, 1,
0.8239793, 1.71172, 0.8817551, 1, 0, 0, 1, 1,
0.8320101, -2.596549, 1.465702, 1, 0, 0, 1, 1,
0.8327202, 0.5794366, 0.6191898, 1, 0, 0, 1, 1,
0.8337594, 0.5785764, 2.071891, 1, 0, 0, 1, 1,
0.8377431, -0.2399745, 1.550484, 0, 0, 0, 1, 1,
0.8429857, -0.9561036, 4.319456, 0, 0, 0, 1, 1,
0.8443021, 0.572262, 2.074728, 0, 0, 0, 1, 1,
0.8505147, -0.1244182, 3.226401, 0, 0, 0, 1, 1,
0.852219, 0.6481863, -0.2909513, 0, 0, 0, 1, 1,
0.8533527, -0.116361, 2.279775, 0, 0, 0, 1, 1,
0.8536896, 0.6582865, 1.570886, 0, 0, 0, 1, 1,
0.8541213, 1.061725, 0.775435, 1, 1, 1, 1, 1,
0.8560432, 0.720098, 1.075927, 1, 1, 1, 1, 1,
0.8563213, -0.8406973, 3.497842, 1, 1, 1, 1, 1,
0.8603139, -0.4412396, 2.67729, 1, 1, 1, 1, 1,
0.8607252, 0.7271134, 0.5540989, 1, 1, 1, 1, 1,
0.8719293, 0.7956527, -1.139106, 1, 1, 1, 1, 1,
0.874375, -0.2759441, 2.983401, 1, 1, 1, 1, 1,
0.8767012, -2.577486, 4.27556, 1, 1, 1, 1, 1,
0.8869644, 0.1949475, -0.07694723, 1, 1, 1, 1, 1,
0.8894579, 1.437843, 0.9922081, 1, 1, 1, 1, 1,
0.8924082, -0.1194828, -0.2586017, 1, 1, 1, 1, 1,
0.8935474, -0.3116972, 0.8137633, 1, 1, 1, 1, 1,
0.8967347, 0.3207569, 1.420202, 1, 1, 1, 1, 1,
0.9049768, -0.01239475, 1.823064, 1, 1, 1, 1, 1,
0.9064798, 0.4354307, 1.978336, 1, 1, 1, 1, 1,
0.9135342, 0.3316088, 1.846069, 0, 0, 1, 1, 1,
0.9172691, 0.3517611, 0.7337428, 1, 0, 0, 1, 1,
0.9199293, -1.022689, 1.745592, 1, 0, 0, 1, 1,
0.9217173, 1.212862, 1.544646, 1, 0, 0, 1, 1,
0.9233125, 1.242395, 1.718811, 1, 0, 0, 1, 1,
0.9268683, -1.367221, 3.536412, 1, 0, 0, 1, 1,
0.9320349, 0.2747531, 0.6380705, 0, 0, 0, 1, 1,
0.9365841, 0.4664814, 1.860704, 0, 0, 0, 1, 1,
0.9415216, -0.5483314, 2.182218, 0, 0, 0, 1, 1,
0.9427496, 0.3238113, 1.883904, 0, 0, 0, 1, 1,
0.9446555, -0.1945611, 1.735036, 0, 0, 0, 1, 1,
0.9460977, -1.247454, 4.557162, 0, 0, 0, 1, 1,
0.9502508, 0.5937144, -0.08471576, 0, 0, 0, 1, 1,
0.9559838, 0.1442456, 0.1138755, 1, 1, 1, 1, 1,
0.9560442, 0.9239237, 1.200147, 1, 1, 1, 1, 1,
0.9569234, 0.2068598, 3.284387, 1, 1, 1, 1, 1,
0.9636983, -0.6361036, 2.750983, 1, 1, 1, 1, 1,
0.9693891, -0.5544486, 3.714096, 1, 1, 1, 1, 1,
0.9765446, -1.428377, 1.957384, 1, 1, 1, 1, 1,
0.9765983, 1.388276, -0.8657832, 1, 1, 1, 1, 1,
0.9824622, -0.5062715, 1.253243, 1, 1, 1, 1, 1,
0.9829672, -0.4315025, 1.77948, 1, 1, 1, 1, 1,
0.9835563, 0.4281174, 0.9373983, 1, 1, 1, 1, 1,
0.9838853, -1.738813, 2.342251, 1, 1, 1, 1, 1,
0.9842864, 1.207889, 2.685551, 1, 1, 1, 1, 1,
0.9867563, -1.492706, 2.794586, 1, 1, 1, 1, 1,
0.9885615, -0.1485477, 3.560045, 1, 1, 1, 1, 1,
0.9952109, 1.573527, 2.103479, 1, 1, 1, 1, 1,
0.999818, -0.03462213, 2.358592, 0, 0, 1, 1, 1,
1.000896, -0.5310622, 1.768438, 1, 0, 0, 1, 1,
1.007875, 0.1113026, 1.588998, 1, 0, 0, 1, 1,
1.01109, -0.1682704, 2.223923, 1, 0, 0, 1, 1,
1.011619, 0.7734483, 1.409795, 1, 0, 0, 1, 1,
1.01224, 0.7198783, 1.555951, 1, 0, 0, 1, 1,
1.013278, 3.068716, -0.1125295, 0, 0, 0, 1, 1,
1.017424, 1.390499, 0.4009707, 0, 0, 0, 1, 1,
1.018942, 0.797559, 2.24623, 0, 0, 0, 1, 1,
1.022036, -0.6906068, 2.17671, 0, 0, 0, 1, 1,
1.038958, -1.092051, 2.82587, 0, 0, 0, 1, 1,
1.039863, 1.261949, 1.02735, 0, 0, 0, 1, 1,
1.043453, 0.5825334, 0.6463501, 0, 0, 0, 1, 1,
1.045091, -0.1721283, 2.62596, 1, 1, 1, 1, 1,
1.046153, 0.6176212, 2.66797, 1, 1, 1, 1, 1,
1.049982, -1.119257, 0.7917639, 1, 1, 1, 1, 1,
1.051176, -0.0639421, 1.531686, 1, 1, 1, 1, 1,
1.052879, 0.6909477, 0.1094551, 1, 1, 1, 1, 1,
1.055803, 0.4104762, 1.867887, 1, 1, 1, 1, 1,
1.058963, 0.4351491, 1.988586, 1, 1, 1, 1, 1,
1.059376, -1.706939, 0.5750537, 1, 1, 1, 1, 1,
1.065007, -0.627156, 1.225917, 1, 1, 1, 1, 1,
1.073949, -0.05319675, 2.431083, 1, 1, 1, 1, 1,
1.077903, -1.00748, 1.581137, 1, 1, 1, 1, 1,
1.088547, -1.246239, 4.655303, 1, 1, 1, 1, 1,
1.091188, 0.1540616, 0.4077411, 1, 1, 1, 1, 1,
1.099896, -0.5818279, 1.026494, 1, 1, 1, 1, 1,
1.102596, 0.7115457, -0.08954451, 1, 1, 1, 1, 1,
1.102856, -0.6612095, 3.933398, 0, 0, 1, 1, 1,
1.104424, 0.6659161, 2.216755, 1, 0, 0, 1, 1,
1.113019, 0.3700882, 0.6773736, 1, 0, 0, 1, 1,
1.119861, -0.7478517, 2.56625, 1, 0, 0, 1, 1,
1.120981, -0.5052016, 1.059841, 1, 0, 0, 1, 1,
1.126689, 1.116327, 1.263998, 1, 0, 0, 1, 1,
1.128051, 0.8338225, 1.997177, 0, 0, 0, 1, 1,
1.129454, -0.9539313, 0.6920335, 0, 0, 0, 1, 1,
1.132597, -0.9541387, 1.737284, 0, 0, 0, 1, 1,
1.134739, 0.6989615, 2.135527, 0, 0, 0, 1, 1,
1.142596, -2.345018, 2.95358, 0, 0, 0, 1, 1,
1.142744, -0.6567923, 2.795144, 0, 0, 0, 1, 1,
1.154881, -1.842706, 4.171452, 0, 0, 0, 1, 1,
1.168498, 0.5526778, 1.584198, 1, 1, 1, 1, 1,
1.188431, -1.429618, 1.361086, 1, 1, 1, 1, 1,
1.189368, -0.1235101, 3.13979, 1, 1, 1, 1, 1,
1.198586, -2.085194, 2.774046, 1, 1, 1, 1, 1,
1.200508, 2.355059, 0.3204804, 1, 1, 1, 1, 1,
1.200604, -0.2200542, 0.5170024, 1, 1, 1, 1, 1,
1.201551, -0.5666619, 2.024775, 1, 1, 1, 1, 1,
1.20159, -1.559185, 1.838085, 1, 1, 1, 1, 1,
1.204605, -0.5982404, 3.50318, 1, 1, 1, 1, 1,
1.217588, 0.630752, 1.886485, 1, 1, 1, 1, 1,
1.223452, 1.177582, -1.066696, 1, 1, 1, 1, 1,
1.226552, -1.55224, 3.509614, 1, 1, 1, 1, 1,
1.230095, 1.653957, -0.01992463, 1, 1, 1, 1, 1,
1.2302, 0.3075486, 0.9165881, 1, 1, 1, 1, 1,
1.234638, 0.1409189, -0.8384609, 1, 1, 1, 1, 1,
1.236443, -1.759569, 4.134084, 0, 0, 1, 1, 1,
1.236611, 0.3866597, 3.101899, 1, 0, 0, 1, 1,
1.237763, -1.413848, 2.83882, 1, 0, 0, 1, 1,
1.255613, 1.544449, 0.02513016, 1, 0, 0, 1, 1,
1.259163, 1.55843, -0.8890517, 1, 0, 0, 1, 1,
1.267861, 0.6245047, 0.7900974, 1, 0, 0, 1, 1,
1.269738, 1.045408, 1.495266, 0, 0, 0, 1, 1,
1.27818, -0.9238176, 2.9379, 0, 0, 0, 1, 1,
1.279547, 0.8904537, 0.1074458, 0, 0, 0, 1, 1,
1.281254, -1.357518, 3.31649, 0, 0, 0, 1, 1,
1.2826, 0.9252428, 0.8499436, 0, 0, 0, 1, 1,
1.291958, -0.1843812, 1.704741, 0, 0, 0, 1, 1,
1.30449, -2.119658, 1.481033, 0, 0, 0, 1, 1,
1.305635, -0.7591306, 2.534271, 1, 1, 1, 1, 1,
1.308113, -0.2142073, 1.424446, 1, 1, 1, 1, 1,
1.311951, 0.2309721, 2.547855, 1, 1, 1, 1, 1,
1.31683, 0.0720476, 1.800287, 1, 1, 1, 1, 1,
1.318966, 0.4194931, 3.405398, 1, 1, 1, 1, 1,
1.33602, 0.8234001, 1.39913, 1, 1, 1, 1, 1,
1.347726, 0.4646236, 0.06837192, 1, 1, 1, 1, 1,
1.352762, 0.807507, 1.157836, 1, 1, 1, 1, 1,
1.366611, -0.1713806, 3.181767, 1, 1, 1, 1, 1,
1.367041, -0.4270186, 4.649931, 1, 1, 1, 1, 1,
1.370297, 1.648735, 1.431701, 1, 1, 1, 1, 1,
1.379474, -1.456258, 2.099554, 1, 1, 1, 1, 1,
1.381272, -1.503011, 2.571719, 1, 1, 1, 1, 1,
1.38734, 0.5287977, 1.087985, 1, 1, 1, 1, 1,
1.387595, 0.291593, 0.9017597, 1, 1, 1, 1, 1,
1.391566, -0.6459858, 2.836272, 0, 0, 1, 1, 1,
1.403038, 0.8625888, 1.144503, 1, 0, 0, 1, 1,
1.405244, -0.6170957, 0.6081814, 1, 0, 0, 1, 1,
1.410848, 1.140637, 0.9609796, 1, 0, 0, 1, 1,
1.414999, -1.68134, 4.625247, 1, 0, 0, 1, 1,
1.442383, -0.7660909, 0.2652861, 1, 0, 0, 1, 1,
1.445185, 0.4906325, -0.5637627, 0, 0, 0, 1, 1,
1.455116, 1.062967, 2.461612, 0, 0, 0, 1, 1,
1.464218, 0.559192, -0.6820173, 0, 0, 0, 1, 1,
1.472027, -0.6914111, 0.3751718, 0, 0, 0, 1, 1,
1.47479, 0.7819113, 0.8740811, 0, 0, 0, 1, 1,
1.475461, -0.06288005, -0.141236, 0, 0, 0, 1, 1,
1.475569, 0.3200256, 0.846158, 0, 0, 0, 1, 1,
1.487878, 0.2640208, 0.9889266, 1, 1, 1, 1, 1,
1.503061, 1.239063, 1.187332, 1, 1, 1, 1, 1,
1.503104, -1.871382, 2.111417, 1, 1, 1, 1, 1,
1.504085, 0.09827267, 1.576055, 1, 1, 1, 1, 1,
1.510528, -1.883976, 3.574828, 1, 1, 1, 1, 1,
1.511456, 3.099701, -0.7068002, 1, 1, 1, 1, 1,
1.514936, 0.422526, 2.694947, 1, 1, 1, 1, 1,
1.531886, 0.06705354, 2.92736, 1, 1, 1, 1, 1,
1.550681, 0.09873009, 2.242854, 1, 1, 1, 1, 1,
1.555712, 1.415667, 0.7894354, 1, 1, 1, 1, 1,
1.556088, -0.7558649, 1.564133, 1, 1, 1, 1, 1,
1.55741, -0.1005278, 4.26955, 1, 1, 1, 1, 1,
1.558536, -0.08874793, 1.206659, 1, 1, 1, 1, 1,
1.56109, 0.366291, 1.845059, 1, 1, 1, 1, 1,
1.564371, -0.9097934, 2.572774, 1, 1, 1, 1, 1,
1.573091, -0.9444981, 2.068988, 0, 0, 1, 1, 1,
1.575858, -0.3182262, 2.023143, 1, 0, 0, 1, 1,
1.588769, -2.057383, 2.065564, 1, 0, 0, 1, 1,
1.590759, 1.007022, 1.769005, 1, 0, 0, 1, 1,
1.595244, 0.0763216, 2.444714, 1, 0, 0, 1, 1,
1.597027, 1.074578, 0.9637363, 1, 0, 0, 1, 1,
1.599712, 0.3868402, -0.04106444, 0, 0, 0, 1, 1,
1.616953, -0.6657156, 2.086543, 0, 0, 0, 1, 1,
1.618484, 1.252973, 3.851667, 0, 0, 0, 1, 1,
1.658321, 0.4515335, -0.68225, 0, 0, 0, 1, 1,
1.660384, 0.8808993, 0.4300506, 0, 0, 0, 1, 1,
1.67047, -1.664355, 3.344464, 0, 0, 0, 1, 1,
1.677701, -1.573542, 1.304858, 0, 0, 0, 1, 1,
1.678581, 0.5592219, 0.2808246, 1, 1, 1, 1, 1,
1.697571, 1.134034, 1.180495, 1, 1, 1, 1, 1,
1.699463, -0.7913303, 1.046601, 1, 1, 1, 1, 1,
1.717259, 1.791555, 0.2298156, 1, 1, 1, 1, 1,
1.721286, 0.2365393, 1.386967, 1, 1, 1, 1, 1,
1.725281, 0.4208945, -0.1810366, 1, 1, 1, 1, 1,
1.749922, 0.3950618, 1.22117, 1, 1, 1, 1, 1,
1.755984, -0.1658522, 1.803329, 1, 1, 1, 1, 1,
1.766013, 1.772496, 1.804522, 1, 1, 1, 1, 1,
1.767229, 0.7855769, 0.7679052, 1, 1, 1, 1, 1,
1.772793, -0.3407634, 1.185646, 1, 1, 1, 1, 1,
1.796529, 0.7562671, 2.237554, 1, 1, 1, 1, 1,
1.808013, 0.7333238, 0.2067936, 1, 1, 1, 1, 1,
1.808412, 0.2647775, 1.068843, 1, 1, 1, 1, 1,
1.836488, 0.3540202, 2.146302, 1, 1, 1, 1, 1,
1.846663, 0.6795302, 0.8098571, 0, 0, 1, 1, 1,
1.884794, -2.022537, 1.905792, 1, 0, 0, 1, 1,
1.924722, 0.002062455, 0.5075839, 1, 0, 0, 1, 1,
2.02136, -0.4089521, 1.710172, 1, 0, 0, 1, 1,
2.034411, -0.581743, 2.009923, 1, 0, 0, 1, 1,
2.122678, 0.6151342, 1.144114, 1, 0, 0, 1, 1,
2.144095, -0.1184976, 2.199025, 0, 0, 0, 1, 1,
2.176126, 0.04380827, 0.4842479, 0, 0, 0, 1, 1,
2.210639, -0.1027126, 0.831794, 0, 0, 0, 1, 1,
2.252875, 0.1312131, 1.349498, 0, 0, 0, 1, 1,
2.254709, -0.3358741, 3.30462, 0, 0, 0, 1, 1,
2.259454, -1.533406, 1.342913, 0, 0, 0, 1, 1,
2.294776, -2.481186, 2.934075, 0, 0, 0, 1, 1,
2.349416, 1.453692, 0.2777438, 1, 1, 1, 1, 1,
2.421219, -0.92834, 0.9836325, 1, 1, 1, 1, 1,
2.457956, 1.592206, 2.632936, 1, 1, 1, 1, 1,
2.484655, -0.3658249, 2.02707, 1, 1, 1, 1, 1,
2.567931, -0.03676334, 1.712767, 1, 1, 1, 1, 1,
2.683828, -0.5445244, 2.243886, 1, 1, 1, 1, 1,
3.076298, -0.009281131, 2.657836, 1, 1, 1, 1, 1
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
var radius = 10.24995;
var distance = 36.00253;
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
mvMatrix.translate( 0.1947472, -0.1360078, 0.8017876 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.00253);
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
