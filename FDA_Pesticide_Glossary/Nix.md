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
-3.181417, -0.8437414, -0.3481598, 1, 0, 0, 1,
-3.039467, -2.287345, -2.959866, 1, 0.007843138, 0, 1,
-2.970438, 0.5433714, 0.1082609, 1, 0.01176471, 0, 1,
-2.53916, 0.696278, -2.644251, 1, 0.01960784, 0, 1,
-2.526356, 1.581948, -1.772245, 1, 0.02352941, 0, 1,
-2.52483, -0.06155154, -1.998175, 1, 0.03137255, 0, 1,
-2.481367, 1.041184, -1.051772, 1, 0.03529412, 0, 1,
-2.432793, 0.4562245, -3.152742, 1, 0.04313726, 0, 1,
-2.391596, 1.033757, 1.25163, 1, 0.04705882, 0, 1,
-2.383565, 0.3556457, -2.205358, 1, 0.05490196, 0, 1,
-2.286977, 0.6933287, -0.8584365, 1, 0.05882353, 0, 1,
-2.260251, 1.495435, -2.445544, 1, 0.06666667, 0, 1,
-2.245731, -1.495676, -3.897423, 1, 0.07058824, 0, 1,
-2.2405, -0.004479412, -0.8072208, 1, 0.07843138, 0, 1,
-2.217422, -0.7380173, -1.684331, 1, 0.08235294, 0, 1,
-2.208211, 0.2374325, -1.373725, 1, 0.09019608, 0, 1,
-2.174486, 1.152109, 0.4312809, 1, 0.09411765, 0, 1,
-2.16661, 0.5227428, 1.593448, 1, 0.1019608, 0, 1,
-2.163747, -0.01490882, -1.13076, 1, 0.1098039, 0, 1,
-2.141045, -1.014977, -4.711504, 1, 0.1137255, 0, 1,
-2.09576, 0.01567492, -2.702881, 1, 0.1215686, 0, 1,
-2.068439, -0.9710259, -2.258965, 1, 0.1254902, 0, 1,
-2.044683, -1.31896, -3.001946, 1, 0.1333333, 0, 1,
-2.022696, 1.600907, -1.648795, 1, 0.1372549, 0, 1,
-2.021311, -0.5094932, -0.9818502, 1, 0.145098, 0, 1,
-2.015337, -1.562548, -2.970152, 1, 0.1490196, 0, 1,
-2.00251, 1.034361, -0.4060316, 1, 0.1568628, 0, 1,
-1.991862, -0.3843862, -1.61942, 1, 0.1607843, 0, 1,
-1.989172, -1.83349, -1.111487, 1, 0.1686275, 0, 1,
-1.975366, -0.6066195, -1.722096, 1, 0.172549, 0, 1,
-1.971486, 0.1995958, -2.179128, 1, 0.1803922, 0, 1,
-1.935397, 1.406909, -0.9094271, 1, 0.1843137, 0, 1,
-1.931373, -0.4844217, -3.058558, 1, 0.1921569, 0, 1,
-1.920596, 0.5189293, -2.308, 1, 0.1960784, 0, 1,
-1.895992, 0.1367048, -3.231317, 1, 0.2039216, 0, 1,
-1.798203, -0.6023661, -2.512788, 1, 0.2117647, 0, 1,
-1.779155, 0.02315477, -1.352599, 1, 0.2156863, 0, 1,
-1.736195, -0.1817981, 0.1998676, 1, 0.2235294, 0, 1,
-1.73231, -0.8592577, -0.9514794, 1, 0.227451, 0, 1,
-1.730708, 0.9109524, -1.125766, 1, 0.2352941, 0, 1,
-1.711666, -0.2683175, -2.224145, 1, 0.2392157, 0, 1,
-1.710355, 0.7862865, 0.3265755, 1, 0.2470588, 0, 1,
-1.704165, -0.6805132, -1.955333, 1, 0.2509804, 0, 1,
-1.674816, 0.655448, -1.675862, 1, 0.2588235, 0, 1,
-1.671496, 0.8493038, -2.272848, 1, 0.2627451, 0, 1,
-1.66401, 0.6441812, -2.237131, 1, 0.2705882, 0, 1,
-1.611974, -0.7917564, -2.17424, 1, 0.2745098, 0, 1,
-1.610206, 0.7027666, -2.582533, 1, 0.282353, 0, 1,
-1.600425, -1.322408, -2.749558, 1, 0.2862745, 0, 1,
-1.597749, 0.1223344, -0.960582, 1, 0.2941177, 0, 1,
-1.595509, 1.128324, -3.07423, 1, 0.3019608, 0, 1,
-1.583457, -0.7074096, -0.2130528, 1, 0.3058824, 0, 1,
-1.5828, -1.180485, -1.432094, 1, 0.3137255, 0, 1,
-1.578197, 0.7795388, 0.2399544, 1, 0.3176471, 0, 1,
-1.557222, 0.9390032, -0.01412706, 1, 0.3254902, 0, 1,
-1.556132, -0.679518, -2.913353, 1, 0.3294118, 0, 1,
-1.553089, 0.4205104, -1.68432, 1, 0.3372549, 0, 1,
-1.541395, 0.999575, -1.605807, 1, 0.3411765, 0, 1,
-1.532756, -0.6016811, -2.13353, 1, 0.3490196, 0, 1,
-1.528409, -1.154301, -4.110945, 1, 0.3529412, 0, 1,
-1.52656, 0.3723447, -1.362159, 1, 0.3607843, 0, 1,
-1.525855, -1.123935, -2.903511, 1, 0.3647059, 0, 1,
-1.518739, 1.520176, -0.9357802, 1, 0.372549, 0, 1,
-1.515062, -0.1467991, -2.388047, 1, 0.3764706, 0, 1,
-1.505871, 0.1886363, -4.070741, 1, 0.3843137, 0, 1,
-1.502187, 0.8372831, -2.130595, 1, 0.3882353, 0, 1,
-1.495811, 0.6235576, -0.185421, 1, 0.3960784, 0, 1,
-1.483783, 0.6483304, -2.853375, 1, 0.4039216, 0, 1,
-1.47054, -1.007891, -2.807151, 1, 0.4078431, 0, 1,
-1.470123, 0.1771082, 0.5011357, 1, 0.4156863, 0, 1,
-1.469543, 0.9761931, -0.2532061, 1, 0.4196078, 0, 1,
-1.465659, 0.7395851, -2.661668, 1, 0.427451, 0, 1,
-1.439996, -0.2737951, -0.5092425, 1, 0.4313726, 0, 1,
-1.439156, 0.7736579, -1.04407, 1, 0.4392157, 0, 1,
-1.438962, -0.2534225, -3.091463, 1, 0.4431373, 0, 1,
-1.434405, -2.719339, -2.815028, 1, 0.4509804, 0, 1,
-1.432623, 1.173738, -1.184559, 1, 0.454902, 0, 1,
-1.422072, 0.8160032, 0.001167713, 1, 0.4627451, 0, 1,
-1.421143, -0.02816302, -1.308661, 1, 0.4666667, 0, 1,
-1.42063, -1.109119, -2.363832, 1, 0.4745098, 0, 1,
-1.407571, 1.999665, -1.074879, 1, 0.4784314, 0, 1,
-1.406663, 0.05830285, -1.645497, 1, 0.4862745, 0, 1,
-1.39245, -0.2556387, -0.6071705, 1, 0.4901961, 0, 1,
-1.375773, -1.556112, -4.5551, 1, 0.4980392, 0, 1,
-1.3742, -0.5909612, -2.208887, 1, 0.5058824, 0, 1,
-1.360736, 0.7319239, -0.8512776, 1, 0.509804, 0, 1,
-1.360594, -0.5281145, -1.476345, 1, 0.5176471, 0, 1,
-1.357014, 0.5487852, -1.240257, 1, 0.5215687, 0, 1,
-1.356907, -1.023181, -1.634356, 1, 0.5294118, 0, 1,
-1.355227, 1.900211, -0.5159968, 1, 0.5333334, 0, 1,
-1.349461, -0.5236729, -3.865101, 1, 0.5411765, 0, 1,
-1.33994, -0.3728859, -1.815062, 1, 0.5450981, 0, 1,
-1.334327, 1.767858, -2.559705, 1, 0.5529412, 0, 1,
-1.328942, -0.1109152, -1.592494, 1, 0.5568628, 0, 1,
-1.327534, 0.7755932, -0.1627736, 1, 0.5647059, 0, 1,
-1.319347, 0.6530347, 0.11238, 1, 0.5686275, 0, 1,
-1.305995, -0.03328707, -1.368999, 1, 0.5764706, 0, 1,
-1.303276, -1.046188, -0.9419364, 1, 0.5803922, 0, 1,
-1.298729, 1.059458, -2.071866, 1, 0.5882353, 0, 1,
-1.296304, 0.1625913, -0.6382546, 1, 0.5921569, 0, 1,
-1.295748, -0.6615191, -2.005353, 1, 0.6, 0, 1,
-1.29563, -1.083209, -2.537002, 1, 0.6078432, 0, 1,
-1.283621, 0.1746447, 0.4581719, 1, 0.6117647, 0, 1,
-1.263258, 0.2887797, 0.313788, 1, 0.6196079, 0, 1,
-1.261856, -0.04448784, -0.7511255, 1, 0.6235294, 0, 1,
-1.257527, -1.089615, -3.679804, 1, 0.6313726, 0, 1,
-1.254336, 0.1620229, -1.192805, 1, 0.6352941, 0, 1,
-1.248814, -0.914104, -4.951202, 1, 0.6431373, 0, 1,
-1.244721, 0.70306, 0.01416042, 1, 0.6470588, 0, 1,
-1.240005, -1.056926, -1.433378, 1, 0.654902, 0, 1,
-1.233142, 0.4522335, -1.735997, 1, 0.6588235, 0, 1,
-1.229119, -0.6484208, -2.343896, 1, 0.6666667, 0, 1,
-1.228912, 0.780892, -1.347325, 1, 0.6705883, 0, 1,
-1.228761, 2.207323, -0.5569078, 1, 0.6784314, 0, 1,
-1.225581, -0.8019313, -0.7825363, 1, 0.682353, 0, 1,
-1.225255, 0.09487019, 0.05057405, 1, 0.6901961, 0, 1,
-1.224607, -0.1951802, -2.540646, 1, 0.6941177, 0, 1,
-1.216689, -0.7425378, -1.12681, 1, 0.7019608, 0, 1,
-1.212899, -0.2928335, 0.06195314, 1, 0.7098039, 0, 1,
-1.201788, 0.1515659, -0.4777531, 1, 0.7137255, 0, 1,
-1.200505, 0.02922493, -0.6216052, 1, 0.7215686, 0, 1,
-1.200412, -0.3580393, -0.6856517, 1, 0.7254902, 0, 1,
-1.196182, -1.137724, -1.859171, 1, 0.7333333, 0, 1,
-1.193927, 1.249697, -1.854732, 1, 0.7372549, 0, 1,
-1.189278, -0.7706561, -1.874479, 1, 0.7450981, 0, 1,
-1.182865, -0.1718644, -1.882067, 1, 0.7490196, 0, 1,
-1.180348, -0.8783018, -2.515821, 1, 0.7568628, 0, 1,
-1.173197, 0.1117717, -1.994091, 1, 0.7607843, 0, 1,
-1.172743, 0.1058236, -2.373869, 1, 0.7686275, 0, 1,
-1.169202, 1.295693, -0.6575133, 1, 0.772549, 0, 1,
-1.166333, 1.556931, -0.7136047, 1, 0.7803922, 0, 1,
-1.156131, 0.2269937, -2.933093, 1, 0.7843137, 0, 1,
-1.139332, 0.1114848, -2.154595, 1, 0.7921569, 0, 1,
-1.139195, -0.7245156, -3.693363, 1, 0.7960784, 0, 1,
-1.137823, 1.250172, -0.5403342, 1, 0.8039216, 0, 1,
-1.137365, -1.157173, -1.121952, 1, 0.8117647, 0, 1,
-1.136133, 0.426967, -0.4644039, 1, 0.8156863, 0, 1,
-1.128352, 1.579495, -0.529587, 1, 0.8235294, 0, 1,
-1.125578, -1.545878, -1.695954, 1, 0.827451, 0, 1,
-1.124487, -0.2275985, -4.141817, 1, 0.8352941, 0, 1,
-1.115841, 1.759645, -2.105865, 1, 0.8392157, 0, 1,
-1.109501, 0.1448667, -1.675511, 1, 0.8470588, 0, 1,
-1.105174, -0.9853068, -1.003409, 1, 0.8509804, 0, 1,
-1.104547, 0.3120543, -0.1799284, 1, 0.8588235, 0, 1,
-1.100942, 1.171124, -3.227434, 1, 0.8627451, 0, 1,
-1.093434, 0.5795939, -0.5527139, 1, 0.8705882, 0, 1,
-1.089953, 0.8943998, 0.2163272, 1, 0.8745098, 0, 1,
-1.087276, 0.7420011, -0.2555721, 1, 0.8823529, 0, 1,
-1.081365, -1.103706, -3.589286, 1, 0.8862745, 0, 1,
-1.080051, -2.201479, -2.356432, 1, 0.8941177, 0, 1,
-1.078851, 0.6737254, -1.272267, 1, 0.8980392, 0, 1,
-1.077365, 0.580903, -2.163137, 1, 0.9058824, 0, 1,
-1.074456, -0.8083337, -2.899653, 1, 0.9137255, 0, 1,
-1.067588, -2.011632, -2.297816, 1, 0.9176471, 0, 1,
-1.064934, 0.1362521, -1.335782, 1, 0.9254902, 0, 1,
-1.064472, -0.05404209, -1.740959, 1, 0.9294118, 0, 1,
-1.052453, 0.3425656, -2.446239, 1, 0.9372549, 0, 1,
-1.047649, 0.1467071, -0.8167388, 1, 0.9411765, 0, 1,
-1.043123, -1.128571, -1.386968, 1, 0.9490196, 0, 1,
-1.0418, -1.145726, -2.105353, 1, 0.9529412, 0, 1,
-1.041397, 0.001025176, -1.257566, 1, 0.9607843, 0, 1,
-1.039917, -0.4031064, -1.119986, 1, 0.9647059, 0, 1,
-1.028465, 2.499352, 0.7944638, 1, 0.972549, 0, 1,
-1.028338, 1.727353, -0.3963325, 1, 0.9764706, 0, 1,
-1.007394, -1.049031, -2.100252, 1, 0.9843137, 0, 1,
-1.002481, 0.9357067, 0.6184324, 1, 0.9882353, 0, 1,
-0.996769, -0.5103012, -2.798652, 1, 0.9960784, 0, 1,
-0.9939355, -0.8701783, -3.78714, 0.9960784, 1, 0, 1,
-0.9878712, -0.05318179, -1.07582, 0.9921569, 1, 0, 1,
-0.9811313, -1.237033, -4.29482, 0.9843137, 1, 0, 1,
-0.9764441, 1.076115, -0.7510512, 0.9803922, 1, 0, 1,
-0.9746941, -1.009261, -3.112864, 0.972549, 1, 0, 1,
-0.9731792, 1.451084, -0.05720016, 0.9686275, 1, 0, 1,
-0.9685563, 0.2783893, -1.85567, 0.9607843, 1, 0, 1,
-0.9664354, -0.6453463, -0.6592358, 0.9568627, 1, 0, 1,
-0.96537, -0.6473118, -0.6627927, 0.9490196, 1, 0, 1,
-0.9648055, 1.52004, -0.4049757, 0.945098, 1, 0, 1,
-0.9637043, 1.162652, -0.2807066, 0.9372549, 1, 0, 1,
-0.9588028, 1.419054, -2.614852, 0.9333333, 1, 0, 1,
-0.9537688, -0.3156956, -1.192287, 0.9254902, 1, 0, 1,
-0.9534651, 1.630551, -3.182615, 0.9215686, 1, 0, 1,
-0.9520673, 0.2830577, -0.6456509, 0.9137255, 1, 0, 1,
-0.9495355, -0.688889, -2.250712, 0.9098039, 1, 0, 1,
-0.9491682, -0.8498641, -1.634126, 0.9019608, 1, 0, 1,
-0.9465182, -1.086491, -1.833937, 0.8941177, 1, 0, 1,
-0.9460618, -1.128369, -2.289166, 0.8901961, 1, 0, 1,
-0.9417107, -1.929326, -2.385782, 0.8823529, 1, 0, 1,
-0.9389454, -0.5058216, -3.532612, 0.8784314, 1, 0, 1,
-0.9385248, 0.4858956, 0.2249201, 0.8705882, 1, 0, 1,
-0.9309843, -1.437982, -2.398517, 0.8666667, 1, 0, 1,
-0.9309567, -0.5389346, -1.132148, 0.8588235, 1, 0, 1,
-0.9250393, -0.1444122, 0.553822, 0.854902, 1, 0, 1,
-0.9231659, 0.9572718, -0.1586126, 0.8470588, 1, 0, 1,
-0.9215189, -1.716046, -1.90119, 0.8431373, 1, 0, 1,
-0.9197345, 0.6531503, -3.612866, 0.8352941, 1, 0, 1,
-0.9189928, 1.263622, 0.002659484, 0.8313726, 1, 0, 1,
-0.9083344, 0.1939448, -1.081773, 0.8235294, 1, 0, 1,
-0.9051591, 1.210195, -1.536123, 0.8196079, 1, 0, 1,
-0.9016706, -0.4930013, -1.924718, 0.8117647, 1, 0, 1,
-0.8943226, 1.396136, -0.47288, 0.8078431, 1, 0, 1,
-0.8931296, 0.4535646, -0.8308123, 0.8, 1, 0, 1,
-0.8760065, -0.9974015, -0.5895479, 0.7921569, 1, 0, 1,
-0.8745232, 0.8040867, 0.9085894, 0.7882353, 1, 0, 1,
-0.8696561, -0.7181751, -1.2604, 0.7803922, 1, 0, 1,
-0.864936, -0.4409909, -1.107302, 0.7764706, 1, 0, 1,
-0.8619341, -1.079682, -1.604947, 0.7686275, 1, 0, 1,
-0.8609889, 0.2515723, -0.8221523, 0.7647059, 1, 0, 1,
-0.8594954, -2.687411, -2.157825, 0.7568628, 1, 0, 1,
-0.857737, 0.8287677, -0.9111302, 0.7529412, 1, 0, 1,
-0.8534133, -0.3087254, -2.450104, 0.7450981, 1, 0, 1,
-0.8523568, 1.075423, 0.1900361, 0.7411765, 1, 0, 1,
-0.8501528, -0.004955833, -0.8035545, 0.7333333, 1, 0, 1,
-0.849488, 1.628075, -0.6812807, 0.7294118, 1, 0, 1,
-0.8466569, 1.612825, -3.29395, 0.7215686, 1, 0, 1,
-0.8340545, 0.6951333, -1.194241, 0.7176471, 1, 0, 1,
-0.8318419, 0.5913848, -2.595573, 0.7098039, 1, 0, 1,
-0.8300182, 0.7349133, -0.9551268, 0.7058824, 1, 0, 1,
-0.8178785, -0.03465231, -1.58896, 0.6980392, 1, 0, 1,
-0.8143754, -0.5991989, -1.592642, 0.6901961, 1, 0, 1,
-0.8083606, 1.475331, -0.9978089, 0.6862745, 1, 0, 1,
-0.7928303, -1.027808, -0.8956995, 0.6784314, 1, 0, 1,
-0.7879021, 1.324749, -1.740733, 0.6745098, 1, 0, 1,
-0.7874917, 0.342725, -2.658232, 0.6666667, 1, 0, 1,
-0.7842908, 0.8902671, -2.43193, 0.6627451, 1, 0, 1,
-0.7812222, 1.021178, -0.611272, 0.654902, 1, 0, 1,
-0.771884, -1.241539, -1.765638, 0.6509804, 1, 0, 1,
-0.7694944, 0.250929, -1.91095, 0.6431373, 1, 0, 1,
-0.7642693, -0.5796539, -1.865836, 0.6392157, 1, 0, 1,
-0.7635475, 1.160311, -0.8153166, 0.6313726, 1, 0, 1,
-0.7629356, -0.2943301, -1.967741, 0.627451, 1, 0, 1,
-0.7553146, 0.2619756, -1.408853, 0.6196079, 1, 0, 1,
-0.7538615, -1.590517, -2.167764, 0.6156863, 1, 0, 1,
-0.7520401, -1.115092, -2.517123, 0.6078432, 1, 0, 1,
-0.7488255, 0.820661, -0.9723918, 0.6039216, 1, 0, 1,
-0.7319748, 0.4749102, -1.989815, 0.5960785, 1, 0, 1,
-0.7222247, 0.6026781, -0.7847982, 0.5882353, 1, 0, 1,
-0.718464, -0.9537068, -2.878204, 0.5843138, 1, 0, 1,
-0.7177567, 0.1840674, -3.06184, 0.5764706, 1, 0, 1,
-0.7173783, -2.311552, -3.030408, 0.572549, 1, 0, 1,
-0.7128022, 2.684543, 0.1727168, 0.5647059, 1, 0, 1,
-0.7118252, -1.525041, -2.242884, 0.5607843, 1, 0, 1,
-0.7097149, -0.4715651, -2.496241, 0.5529412, 1, 0, 1,
-0.7059845, -0.5380846, -1.595335, 0.5490196, 1, 0, 1,
-0.7053345, 0.8595935, -0.02993747, 0.5411765, 1, 0, 1,
-0.7041987, -0.6424066, -1.21777, 0.5372549, 1, 0, 1,
-0.7010473, 1.321719, -1.079699, 0.5294118, 1, 0, 1,
-0.6965751, -1.634829, -2.290304, 0.5254902, 1, 0, 1,
-0.6937795, -0.5750459, -2.117882, 0.5176471, 1, 0, 1,
-0.6932412, 0.6386883, -3.269486, 0.5137255, 1, 0, 1,
-0.689009, 0.1984198, -0.4051702, 0.5058824, 1, 0, 1,
-0.6852176, -0.8158197, -3.210479, 0.5019608, 1, 0, 1,
-0.6845152, 0.575495, -0.202849, 0.4941176, 1, 0, 1,
-0.6795415, 1.540516, -0.3184775, 0.4862745, 1, 0, 1,
-0.6786862, -0.7349753, -3.373598, 0.4823529, 1, 0, 1,
-0.6775088, -0.9405701, -2.257366, 0.4745098, 1, 0, 1,
-0.6772978, 0.3816173, -1.247042, 0.4705882, 1, 0, 1,
-0.670026, 0.798934, -0.89193, 0.4627451, 1, 0, 1,
-0.6667575, -0.403465, -1.150271, 0.4588235, 1, 0, 1,
-0.6665381, 0.4372433, -1.972329, 0.4509804, 1, 0, 1,
-0.6662991, -0.3710897, -2.998035, 0.4470588, 1, 0, 1,
-0.6660404, 0.4181837, 0.06781191, 0.4392157, 1, 0, 1,
-0.6655048, 0.2426452, -0.7553978, 0.4352941, 1, 0, 1,
-0.6648991, -0.8706421, -0.5582106, 0.427451, 1, 0, 1,
-0.663117, 0.2889341, -2.315551, 0.4235294, 1, 0, 1,
-0.6569131, 0.6672996, 2.007411, 0.4156863, 1, 0, 1,
-0.6536826, -0.6173669, -4.038667, 0.4117647, 1, 0, 1,
-0.6514666, -1.192252, -1.02825, 0.4039216, 1, 0, 1,
-0.6511763, 2.180263, 0.7361676, 0.3960784, 1, 0, 1,
-0.6486433, 1.60356, -2.085324, 0.3921569, 1, 0, 1,
-0.6472002, -1.350144, -2.762083, 0.3843137, 1, 0, 1,
-0.64385, -0.2855452, -2.02539, 0.3803922, 1, 0, 1,
-0.6403154, -0.9964521, -1.350865, 0.372549, 1, 0, 1,
-0.6368891, 0.7856407, 0.9130886, 0.3686275, 1, 0, 1,
-0.6296328, 1.464176, 0.1335855, 0.3607843, 1, 0, 1,
-0.6283416, -1.283286, -1.203291, 0.3568628, 1, 0, 1,
-0.6255137, -0.08803093, -3.512893, 0.3490196, 1, 0, 1,
-0.6241974, 0.8011039, -3.074964, 0.345098, 1, 0, 1,
-0.620445, 0.6423485, -0.9216898, 0.3372549, 1, 0, 1,
-0.6180369, 0.127996, -2.08467, 0.3333333, 1, 0, 1,
-0.6177736, -1.485127, -2.788639, 0.3254902, 1, 0, 1,
-0.6140234, -0.7967738, -2.787894, 0.3215686, 1, 0, 1,
-0.6138777, -1.90615, -2.442605, 0.3137255, 1, 0, 1,
-0.6137166, -1.015395, -4.258798, 0.3098039, 1, 0, 1,
-0.611878, 1.197608, -1.511381, 0.3019608, 1, 0, 1,
-0.6088495, -0.3891453, -2.576062, 0.2941177, 1, 0, 1,
-0.6067052, -1.385863, -2.420496, 0.2901961, 1, 0, 1,
-0.6052191, 1.306588, -1.137565, 0.282353, 1, 0, 1,
-0.6044171, 0.5948131, -0.6597226, 0.2784314, 1, 0, 1,
-0.6024365, -0.398535, -2.702821, 0.2705882, 1, 0, 1,
-0.5984035, 0.926074, -0.2694916, 0.2666667, 1, 0, 1,
-0.5965598, -0.8502045, -1.776961, 0.2588235, 1, 0, 1,
-0.5944024, -0.0787319, -0.9367834, 0.254902, 1, 0, 1,
-0.5930863, 0.381129, 0.09622377, 0.2470588, 1, 0, 1,
-0.5929233, 1.015685, -2.131903, 0.2431373, 1, 0, 1,
-0.5922496, -0.1087423, -1.40237, 0.2352941, 1, 0, 1,
-0.5919624, -2.297039, -2.89532, 0.2313726, 1, 0, 1,
-0.5880856, -1.251417, -3.076628, 0.2235294, 1, 0, 1,
-0.5833294, -0.1868448, -3.841822, 0.2196078, 1, 0, 1,
-0.581061, 0.07506178, -0.9281033, 0.2117647, 1, 0, 1,
-0.5789526, 0.4733218, -0.6592488, 0.2078431, 1, 0, 1,
-0.5785753, -0.02175414, -1.209261, 0.2, 1, 0, 1,
-0.5773658, 1.211244, -1.289077, 0.1921569, 1, 0, 1,
-0.5772744, -0.01457444, -1.136747, 0.1882353, 1, 0, 1,
-0.5762557, -0.5367337, -0.7055413, 0.1803922, 1, 0, 1,
-0.5760547, -1.275151, -1.637348, 0.1764706, 1, 0, 1,
-0.5742157, 1.921562, -2.170535, 0.1686275, 1, 0, 1,
-0.5683655, -1.217282, -1.299903, 0.1647059, 1, 0, 1,
-0.5639334, -0.1807168, -2.036176, 0.1568628, 1, 0, 1,
-0.5622492, -0.7762892, -2.107152, 0.1529412, 1, 0, 1,
-0.5593014, 0.1724309, -1.673034, 0.145098, 1, 0, 1,
-0.5588006, -2.137786, -0.9878438, 0.1411765, 1, 0, 1,
-0.5527554, 0.1795308, -1.057023, 0.1333333, 1, 0, 1,
-0.550685, -0.5218367, -1.080311, 0.1294118, 1, 0, 1,
-0.5471074, 0.8239265, -0.9352269, 0.1215686, 1, 0, 1,
-0.5459074, 0.7093053, -2.242829, 0.1176471, 1, 0, 1,
-0.5456912, 0.1747919, -1.493688, 0.1098039, 1, 0, 1,
-0.5431184, 0.5274046, 0.2825679, 0.1058824, 1, 0, 1,
-0.5412272, 0.1699329, -2.689795, 0.09803922, 1, 0, 1,
-0.5363891, 1.228862, -0.6074561, 0.09019608, 1, 0, 1,
-0.5298368, 0.2580734, -0.2455069, 0.08627451, 1, 0, 1,
-0.528028, 0.8608821, -0.02346165, 0.07843138, 1, 0, 1,
-0.5271542, -0.1824223, -1.972214, 0.07450981, 1, 0, 1,
-0.5263222, 0.6074755, 0.7347548, 0.06666667, 1, 0, 1,
-0.5236607, -0.2551118, -3.796786, 0.0627451, 1, 0, 1,
-0.5231256, -2.033644, -3.304007, 0.05490196, 1, 0, 1,
-0.5203207, 0.3674781, -1.437254, 0.05098039, 1, 0, 1,
-0.5193189, 1.131604, 0.3465161, 0.04313726, 1, 0, 1,
-0.5188078, 0.86778, -0.3474136, 0.03921569, 1, 0, 1,
-0.5179131, 1.714123, -0.4835651, 0.03137255, 1, 0, 1,
-0.5161581, 0.4744936, -2.468903, 0.02745098, 1, 0, 1,
-0.5149811, 0.05887934, -1.947496, 0.01960784, 1, 0, 1,
-0.5122084, 2.012438, -0.0574584, 0.01568628, 1, 0, 1,
-0.5120866, -0.5856634, -0.9954255, 0.007843138, 1, 0, 1,
-0.5107748, 0.4330376, 0.8013239, 0.003921569, 1, 0, 1,
-0.5101783, 0.2440085, -1.426097, 0, 1, 0.003921569, 1,
-0.50962, 1.289223, -0.423042, 0, 1, 0.01176471, 1,
-0.5090256, 0.1900292, -1.44272, 0, 1, 0.01568628, 1,
-0.5058621, -0.4515275, -1.467481, 0, 1, 0.02352941, 1,
-0.5022835, -1.557254, -3.925538, 0, 1, 0.02745098, 1,
-0.4994674, -0.3926342, -2.080931, 0, 1, 0.03529412, 1,
-0.4988779, -0.9009882, -1.946325, 0, 1, 0.03921569, 1,
-0.4988034, -0.5850371, -3.269458, 0, 1, 0.04705882, 1,
-0.4949657, -1.099096, -2.176471, 0, 1, 0.05098039, 1,
-0.4768848, -0.116069, -1.802323, 0, 1, 0.05882353, 1,
-0.4759796, -1.175187, -3.770054, 0, 1, 0.0627451, 1,
-0.4692184, -0.2758436, -1.733699, 0, 1, 0.07058824, 1,
-0.468309, -0.3280302, -2.441302, 0, 1, 0.07450981, 1,
-0.4669766, -2.31033, -1.59442, 0, 1, 0.08235294, 1,
-0.4628041, -0.3354281, -1.270595, 0, 1, 0.08627451, 1,
-0.4619413, 0.458332, -2.724121, 0, 1, 0.09411765, 1,
-0.4599065, 0.767619, -0.3159137, 0, 1, 0.1019608, 1,
-0.4503888, -2.202211, -3.125794, 0, 1, 0.1058824, 1,
-0.4479601, 0.2114729, -1.67374, 0, 1, 0.1137255, 1,
-0.4462747, -0.367851, -1.469828, 0, 1, 0.1176471, 1,
-0.4455599, 0.7542828, 1.274908, 0, 1, 0.1254902, 1,
-0.4455096, 0.141732, -1.01264, 0, 1, 0.1294118, 1,
-0.44292, 1.069942, 0.1100509, 0, 1, 0.1372549, 1,
-0.4390707, -0.5531984, -2.468472, 0, 1, 0.1411765, 1,
-0.4349777, -0.2763142, -2.690828, 0, 1, 0.1490196, 1,
-0.4332259, -0.7554857, -3.549126, 0, 1, 0.1529412, 1,
-0.431708, 0.9049244, -1.777201, 0, 1, 0.1607843, 1,
-0.4278741, -1.020048, -3.497575, 0, 1, 0.1647059, 1,
-0.4260257, 0.459857, 0.2086313, 0, 1, 0.172549, 1,
-0.4254626, -0.2895695, -1.628183, 0, 1, 0.1764706, 1,
-0.4229868, 1.80828, -0.11176, 0, 1, 0.1843137, 1,
-0.4176939, 0.9561675, -1.613008, 0, 1, 0.1882353, 1,
-0.4168459, -0.6848508, -1.877423, 0, 1, 0.1960784, 1,
-0.4135604, 1.577727, -0.5679339, 0, 1, 0.2039216, 1,
-0.4123401, -0.9903393, -3.397173, 0, 1, 0.2078431, 1,
-0.4119674, -0.07212878, 0.6549565, 0, 1, 0.2156863, 1,
-0.4118785, 0.4789454, -1.205912, 0, 1, 0.2196078, 1,
-0.4089797, 0.2984505, 0.2698444, 0, 1, 0.227451, 1,
-0.3988037, 0.3740948, -0.3838983, 0, 1, 0.2313726, 1,
-0.3973017, -0.200526, -3.488006, 0, 1, 0.2392157, 1,
-0.3927912, 0.1119789, -1.531421, 0, 1, 0.2431373, 1,
-0.3863549, 3.182844, 1.178391, 0, 1, 0.2509804, 1,
-0.3807517, 0.2863482, -0.5337027, 0, 1, 0.254902, 1,
-0.378859, 0.0159628, -2.140782, 0, 1, 0.2627451, 1,
-0.3762233, -0.841777, -1.519561, 0, 1, 0.2666667, 1,
-0.374441, 1.718628, -0.7050937, 0, 1, 0.2745098, 1,
-0.3699794, 1.34282, 1.088818, 0, 1, 0.2784314, 1,
-0.3668976, 1.396729, 1.2636, 0, 1, 0.2862745, 1,
-0.3578838, 1.016596, 0.747601, 0, 1, 0.2901961, 1,
-0.3576696, 0.7285398, -0.1627272, 0, 1, 0.2980392, 1,
-0.3546842, -2.281195, -3.870666, 0, 1, 0.3058824, 1,
-0.3530521, 0.1722081, 0.1629517, 0, 1, 0.3098039, 1,
-0.3485082, 0.5084812, -0.740212, 0, 1, 0.3176471, 1,
-0.3460517, 1.383765, -0.05272529, 0, 1, 0.3215686, 1,
-0.3427939, 1.020406, 0.185113, 0, 1, 0.3294118, 1,
-0.3414921, 0.1534145, -2.252151, 0, 1, 0.3333333, 1,
-0.3408226, -0.8750352, -2.898172, 0, 1, 0.3411765, 1,
-0.3401744, 1.265917, 0.4145434, 0, 1, 0.345098, 1,
-0.339202, -0.2800053, -2.462513, 0, 1, 0.3529412, 1,
-0.3384847, -0.6323668, -0.894318, 0, 1, 0.3568628, 1,
-0.3350496, -0.5484926, -2.43731, 0, 1, 0.3647059, 1,
-0.3349661, -0.5136944, -2.480753, 0, 1, 0.3686275, 1,
-0.3302878, 1.182568, 0.1114629, 0, 1, 0.3764706, 1,
-0.325417, -0.7609584, -4.277891, 0, 1, 0.3803922, 1,
-0.3233903, 0.8973056, -0.1260866, 0, 1, 0.3882353, 1,
-0.3224607, 0.4391418, -1.32114, 0, 1, 0.3921569, 1,
-0.3154514, -0.02676591, -0.5076296, 0, 1, 0.4, 1,
-0.3093238, 2.63749, -0.2337341, 0, 1, 0.4078431, 1,
-0.3064038, -0.7016326, -1.915725, 0, 1, 0.4117647, 1,
-0.3038905, -0.9776515, -3.391851, 0, 1, 0.4196078, 1,
-0.2994365, 1.970564, 0.4730341, 0, 1, 0.4235294, 1,
-0.2963517, 1.555307, -1.431809, 0, 1, 0.4313726, 1,
-0.2963345, 0.1503361, -0.3409844, 0, 1, 0.4352941, 1,
-0.2932259, -1.269014, -2.403317, 0, 1, 0.4431373, 1,
-0.2868524, 1.068144, 1.090322, 0, 1, 0.4470588, 1,
-0.2861148, -2.024101, -3.233803, 0, 1, 0.454902, 1,
-0.283609, -1.144663, -4.208573, 0, 1, 0.4588235, 1,
-0.2790643, -0.09816389, 0.06264488, 0, 1, 0.4666667, 1,
-0.2789521, -1.438575, -4.245063, 0, 1, 0.4705882, 1,
-0.2746431, 0.9878355, -0.7910579, 0, 1, 0.4784314, 1,
-0.2666589, -0.636637, -3.406797, 0, 1, 0.4823529, 1,
-0.2642796, -1.291669, -3.281133, 0, 1, 0.4901961, 1,
-0.2641534, 0.2632715, -0.6443475, 0, 1, 0.4941176, 1,
-0.2626097, 0.6939325, -0.5386159, 0, 1, 0.5019608, 1,
-0.2611942, 1.760725, 1.026372, 0, 1, 0.509804, 1,
-0.2587525, 0.5686119, -0.986963, 0, 1, 0.5137255, 1,
-0.256599, 0.6178288, -0.9248403, 0, 1, 0.5215687, 1,
-0.2541638, 0.4487844, 0.4155886, 0, 1, 0.5254902, 1,
-0.2520084, 0.9433675, 0.1607796, 0, 1, 0.5333334, 1,
-0.2456296, -2.163522, -2.645198, 0, 1, 0.5372549, 1,
-0.2444072, 0.8574439, 0.4346478, 0, 1, 0.5450981, 1,
-0.235963, -0.02425828, 0.5028968, 0, 1, 0.5490196, 1,
-0.2352621, 1.062373, -0.2640557, 0, 1, 0.5568628, 1,
-0.2348548, -0.7142307, -2.255017, 0, 1, 0.5607843, 1,
-0.2344489, -0.6783387, -3.038747, 0, 1, 0.5686275, 1,
-0.2304883, -2.663959, -3.085586, 0, 1, 0.572549, 1,
-0.2278257, -0.8501124, -2.961402, 0, 1, 0.5803922, 1,
-0.22695, 1.02567, -0.7584285, 0, 1, 0.5843138, 1,
-0.2267823, 0.6466169, -0.9995086, 0, 1, 0.5921569, 1,
-0.2257066, 0.1930671, -1.915995, 0, 1, 0.5960785, 1,
-0.2210945, -0.009959741, -2.990247, 0, 1, 0.6039216, 1,
-0.2166524, 0.03880673, -0.9507726, 0, 1, 0.6117647, 1,
-0.2106137, -1.290327, -2.553436, 0, 1, 0.6156863, 1,
-0.2089077, 1.557356, 0.719735, 0, 1, 0.6235294, 1,
-0.207632, 0.2823082, 0.8165937, 0, 1, 0.627451, 1,
-0.2073161, -0.02453366, -3.322111, 0, 1, 0.6352941, 1,
-0.2013879, -0.759506, -1.647395, 0, 1, 0.6392157, 1,
-0.197928, -1.181792, -4.184952, 0, 1, 0.6470588, 1,
-0.1816181, -1.642167, -2.898107, 0, 1, 0.6509804, 1,
-0.1808218, -1.014146, -6.127412, 0, 1, 0.6588235, 1,
-0.1794411, -0.3318349, -3.961972, 0, 1, 0.6627451, 1,
-0.1734793, -0.1038876, -2.537621, 0, 1, 0.6705883, 1,
-0.1727507, 0.14494, -0.9165351, 0, 1, 0.6745098, 1,
-0.1615543, 1.068388, 1.586056, 0, 1, 0.682353, 1,
-0.1588303, -0.7801626, -3.559847, 0, 1, 0.6862745, 1,
-0.1530566, 0.8949032, 0.9501702, 0, 1, 0.6941177, 1,
-0.1477524, 0.3616949, -0.3471029, 0, 1, 0.7019608, 1,
-0.1469035, 0.5846524, -1.850477, 0, 1, 0.7058824, 1,
-0.1435632, -0.6981868, -1.958582, 0, 1, 0.7137255, 1,
-0.143294, 1.063669, -0.8045462, 0, 1, 0.7176471, 1,
-0.1371599, 1.438828, 0.03492814, 0, 1, 0.7254902, 1,
-0.1370993, -0.2048032, -2.91472, 0, 1, 0.7294118, 1,
-0.1360866, -2.480358, -3.387691, 0, 1, 0.7372549, 1,
-0.1330209, 2.541527, 0.697699, 0, 1, 0.7411765, 1,
-0.1327529, -1.956469, -3.166547, 0, 1, 0.7490196, 1,
-0.1307454, -0.004229116, -2.314803, 0, 1, 0.7529412, 1,
-0.1270924, 1.28299, 1.182605, 0, 1, 0.7607843, 1,
-0.1262305, -1.752692, -3.839476, 0, 1, 0.7647059, 1,
-0.1242446, 0.8190057, 0.117756, 0, 1, 0.772549, 1,
-0.1137826, -0.07954511, -0.6648352, 0, 1, 0.7764706, 1,
-0.110612, 0.9284992, 0.1729042, 0, 1, 0.7843137, 1,
-0.108031, -0.04188462, -2.548738, 0, 1, 0.7882353, 1,
-0.107321, -0.4317938, -3.897666, 0, 1, 0.7960784, 1,
-0.1051599, 1.684524, -0.5606705, 0, 1, 0.8039216, 1,
-0.1026348, -0.1248208, -2.352229, 0, 1, 0.8078431, 1,
-0.09811825, -0.08206776, -2.037271, 0, 1, 0.8156863, 1,
-0.0952831, -1.263509, -1.665738, 0, 1, 0.8196079, 1,
-0.0917306, -0.01652954, -2.303072, 0, 1, 0.827451, 1,
-0.08274291, 0.1523168, -2.776875, 0, 1, 0.8313726, 1,
-0.07971843, -1.351072, -3.673635, 0, 1, 0.8392157, 1,
-0.07718343, -0.2087436, -2.899895, 0, 1, 0.8431373, 1,
-0.07572303, 0.4733141, -0.6629632, 0, 1, 0.8509804, 1,
-0.07303035, 0.5933611, -0.7092086, 0, 1, 0.854902, 1,
-0.07290165, -0.5773751, -2.303298, 0, 1, 0.8627451, 1,
-0.07245869, -0.3692563, -3.088432, 0, 1, 0.8666667, 1,
-0.07081492, 0.3135902, -0.5482929, 0, 1, 0.8745098, 1,
-0.06663176, 0.8086496, 1.351192, 0, 1, 0.8784314, 1,
-0.06657017, 0.4008183, 0.3884249, 0, 1, 0.8862745, 1,
-0.06383594, -0.8916196, -3.460531, 0, 1, 0.8901961, 1,
-0.06383474, -0.0650386, -2.918095, 0, 1, 0.8980392, 1,
-0.06020945, 0.4528097, -0.8388898, 0, 1, 0.9058824, 1,
-0.05737357, -0.08255289, -2.849561, 0, 1, 0.9098039, 1,
-0.05488177, -0.5406792, -4.176673, 0, 1, 0.9176471, 1,
-0.05188327, -0.2471063, -3.536092, 0, 1, 0.9215686, 1,
-0.04657941, 0.363411, -1.480929, 0, 1, 0.9294118, 1,
-0.0451245, -1.427555, -4.56607, 0, 1, 0.9333333, 1,
-0.04436981, 0.5565131, 1.110018, 0, 1, 0.9411765, 1,
-0.04329877, -1.79874, -4.816957, 0, 1, 0.945098, 1,
-0.04196334, -1.08493, -4.079623, 0, 1, 0.9529412, 1,
-0.04027975, 0.07820746, -0.2220923, 0, 1, 0.9568627, 1,
-0.03611399, 0.2605505, -0.4008583, 0, 1, 0.9647059, 1,
-0.03111513, 0.6789684, 0.326997, 0, 1, 0.9686275, 1,
-0.02850832, 0.1470984, -0.8858998, 0, 1, 0.9764706, 1,
-0.02801058, -2.552032, -2.865292, 0, 1, 0.9803922, 1,
-0.0266502, -1.604192, -2.813835, 0, 1, 0.9882353, 1,
-0.02576542, 0.6264714, -0.4786088, 0, 1, 0.9921569, 1,
-0.02448897, 0.2309741, -1.443304, 0, 1, 1, 1,
-0.02243362, 1.776659, 0.4932372, 0, 0.9921569, 1, 1,
-0.02180048, 0.1405513, 0.7994121, 0, 0.9882353, 1, 1,
-0.01271515, 0.6951845, -1.983925, 0, 0.9803922, 1, 1,
-0.01217598, 0.8302482, -0.3071056, 0, 0.9764706, 1, 1,
-0.01046741, 0.5910025, -0.2124343, 0, 0.9686275, 1, 1,
-0.007665241, -0.4635755, -1.192535, 0, 0.9647059, 1, 1,
-0.00631033, 0.9236506, 0.2546843, 0, 0.9568627, 1, 1,
-0.002994015, 0.1956427, -1.332003, 0, 0.9529412, 1, 1,
-0.001448064, -1.423137, -3.401109, 0, 0.945098, 1, 1,
0.002686297, 0.1517837, 1.401465, 0, 0.9411765, 1, 1,
0.003072075, 2.350973, 1.815411, 0, 0.9333333, 1, 1,
0.005164201, -0.5416475, 4.140022, 0, 0.9294118, 1, 1,
0.009926149, 0.1903394, 1.564269, 0, 0.9215686, 1, 1,
0.01003616, 0.3410774, -0.0577113, 0, 0.9176471, 1, 1,
0.01254154, -0.105563, 5.007946, 0, 0.9098039, 1, 1,
0.01282844, 0.9610543, -1.059458, 0, 0.9058824, 1, 1,
0.01393211, 0.4191167, -0.2339928, 0, 0.8980392, 1, 1,
0.01678339, 0.4093001, 1.985995, 0, 0.8901961, 1, 1,
0.0197903, 0.4344796, -0.5532384, 0, 0.8862745, 1, 1,
0.02225725, 1.738242, -0.7346724, 0, 0.8784314, 1, 1,
0.02374559, -0.21406, 3.416933, 0, 0.8745098, 1, 1,
0.02547278, -1.12935, 1.456823, 0, 0.8666667, 1, 1,
0.02692472, 1.167317, 1.055562, 0, 0.8627451, 1, 1,
0.02823276, -0.2882405, 2.814214, 0, 0.854902, 1, 1,
0.02938451, 0.3561464, -0.1901959, 0, 0.8509804, 1, 1,
0.03049998, 0.2533057, 0.1823406, 0, 0.8431373, 1, 1,
0.03179372, 1.262451, 0.6146908, 0, 0.8392157, 1, 1,
0.03306353, -2.076774, 0.9849124, 0, 0.8313726, 1, 1,
0.04084865, -1.524974, 2.858243, 0, 0.827451, 1, 1,
0.04095467, -1.846746, 3.701655, 0, 0.8196079, 1, 1,
0.0464117, 0.5901037, 0.3168937, 0, 0.8156863, 1, 1,
0.04842732, 0.4788833, 0.8408667, 0, 0.8078431, 1, 1,
0.04939717, -0.1326855, 3.597225, 0, 0.8039216, 1, 1,
0.05032954, -0.04618077, 2.878565, 0, 0.7960784, 1, 1,
0.05117178, 0.1049914, -1.783896, 0, 0.7882353, 1, 1,
0.05135442, -0.9630921, 3.409163, 0, 0.7843137, 1, 1,
0.05236134, -0.4443103, 3.032649, 0, 0.7764706, 1, 1,
0.05560263, 0.009403074, 2.096101, 0, 0.772549, 1, 1,
0.05908335, 0.4774354, 0.7131104, 0, 0.7647059, 1, 1,
0.059917, 0.1149696, 0.4677842, 0, 0.7607843, 1, 1,
0.06048734, 1.230865, 0.1142484, 0, 0.7529412, 1, 1,
0.06368426, 0.2552088, -1.189773, 0, 0.7490196, 1, 1,
0.06391287, 0.05159119, 0.8404818, 0, 0.7411765, 1, 1,
0.06412892, 2.020859, -0.4959645, 0, 0.7372549, 1, 1,
0.06449869, 0.2793808, -0.1952855, 0, 0.7294118, 1, 1,
0.06797954, -1.293084, 3.604362, 0, 0.7254902, 1, 1,
0.06852783, -1.857806, 3.058512, 0, 0.7176471, 1, 1,
0.07560248, -0.9627597, 4.16423, 0, 0.7137255, 1, 1,
0.07863151, -0.3302181, 2.305057, 0, 0.7058824, 1, 1,
0.07881592, -1.013609, 2.518533, 0, 0.6980392, 1, 1,
0.07891381, 0.3401543, -1.082421, 0, 0.6941177, 1, 1,
0.08110523, 0.2201732, 0.3659678, 0, 0.6862745, 1, 1,
0.08574236, -1.314561, 4.146998, 0, 0.682353, 1, 1,
0.0884288, 1.045638, -0.3619722, 0, 0.6745098, 1, 1,
0.08860862, 0.5463298, 1.145696, 0, 0.6705883, 1, 1,
0.08967587, 0.8818913, -1.415144, 0, 0.6627451, 1, 1,
0.09351483, -0.9989222, 3.571392, 0, 0.6588235, 1, 1,
0.09660051, -0.3899771, 2.399537, 0, 0.6509804, 1, 1,
0.09660091, -0.9343097, 2.403821, 0, 0.6470588, 1, 1,
0.09871305, 2.467087, 0.8062117, 0, 0.6392157, 1, 1,
0.09989004, 0.07283784, 1.855415, 0, 0.6352941, 1, 1,
0.1003719, 2.914599, 0.01001021, 0, 0.627451, 1, 1,
0.1031955, -0.5050893, 2.806012, 0, 0.6235294, 1, 1,
0.1049078, -1.495249, 4.490933, 0, 0.6156863, 1, 1,
0.1073396, -1.674905, 4.288238, 0, 0.6117647, 1, 1,
0.1086967, 1.547012, 0.9047229, 0, 0.6039216, 1, 1,
0.1088636, 2.120875, 0.5260543, 0, 0.5960785, 1, 1,
0.109706, 1.818869, 1.388709, 0, 0.5921569, 1, 1,
0.1144283, 0.8005006, -0.7394147, 0, 0.5843138, 1, 1,
0.121027, 0.6571621, -1.771107, 0, 0.5803922, 1, 1,
0.1212758, 0.2321936, 0.9729244, 0, 0.572549, 1, 1,
0.1260113, -1.203251, 4.813256, 0, 0.5686275, 1, 1,
0.1263784, -0.2712038, 1.427392, 0, 0.5607843, 1, 1,
0.1274786, 1.705116, -1.702673, 0, 0.5568628, 1, 1,
0.1294296, -0.9298821, 3.509255, 0, 0.5490196, 1, 1,
0.1353313, -1.093881, 0.7800016, 0, 0.5450981, 1, 1,
0.1378625, -0.9345988, 1.350842, 0, 0.5372549, 1, 1,
0.1456754, 0.6916372, 0.6467522, 0, 0.5333334, 1, 1,
0.1479558, -0.4363094, 2.464382, 0, 0.5254902, 1, 1,
0.1498967, 0.2882931, -2.507933, 0, 0.5215687, 1, 1,
0.1510345, -0.08923673, 1.156995, 0, 0.5137255, 1, 1,
0.151893, 0.597386, -1.688304, 0, 0.509804, 1, 1,
0.1525992, -0.9942964, 3.13871, 0, 0.5019608, 1, 1,
0.1558376, 0.584636, 0.9391599, 0, 0.4941176, 1, 1,
0.162216, 0.5168359, 1.638172, 0, 0.4901961, 1, 1,
0.1657866, 0.1011189, -0.1244361, 0, 0.4823529, 1, 1,
0.1658425, 0.4214605, 0.6645938, 0, 0.4784314, 1, 1,
0.1688864, 0.7637727, 0.6202357, 0, 0.4705882, 1, 1,
0.1699436, 0.1458957, -0.9330202, 0, 0.4666667, 1, 1,
0.1711255, 0.9939069, 0.5335152, 0, 0.4588235, 1, 1,
0.1758263, 0.6227451, 0.05805807, 0, 0.454902, 1, 1,
0.1762067, 1.579819, 0.1722486, 0, 0.4470588, 1, 1,
0.1779585, -0.4600634, 3.480066, 0, 0.4431373, 1, 1,
0.1789847, 0.3699597, -0.2972999, 0, 0.4352941, 1, 1,
0.1804175, 0.9349983, -0.1606641, 0, 0.4313726, 1, 1,
0.1843878, 0.2767227, -0.3246039, 0, 0.4235294, 1, 1,
0.1889295, -1.06528, 3.872946, 0, 0.4196078, 1, 1,
0.2013086, 0.2480527, 1.083609, 0, 0.4117647, 1, 1,
0.2021624, -0.3263252, 1.80963, 0, 0.4078431, 1, 1,
0.203498, -1.040447, 3.204627, 0, 0.4, 1, 1,
0.2041754, -1.583225, 2.336314, 0, 0.3921569, 1, 1,
0.2046167, -0.630693, 3.124206, 0, 0.3882353, 1, 1,
0.2078404, 1.10119, 0.8848898, 0, 0.3803922, 1, 1,
0.2084445, 1.387034, -0.4569816, 0, 0.3764706, 1, 1,
0.211826, -0.1636448, 2.663525, 0, 0.3686275, 1, 1,
0.2124607, 0.2724968, 0.5005338, 0, 0.3647059, 1, 1,
0.2176832, 0.6085007, 0.6185559, 0, 0.3568628, 1, 1,
0.2193026, 1.236391, -1.004662, 0, 0.3529412, 1, 1,
0.2194769, -1.54991, 4.363247, 0, 0.345098, 1, 1,
0.219602, -0.928871, 3.775038, 0, 0.3411765, 1, 1,
0.2209992, 0.5806506, -0.671341, 0, 0.3333333, 1, 1,
0.2210487, 0.1307191, -0.2411655, 0, 0.3294118, 1, 1,
0.2235156, 0.4525878, 1.860065, 0, 0.3215686, 1, 1,
0.2247358, 0.4528653, 1.057346, 0, 0.3176471, 1, 1,
0.2268458, -0.06481258, 1.962935, 0, 0.3098039, 1, 1,
0.2277095, -0.7817191, 3.018474, 0, 0.3058824, 1, 1,
0.2310448, 2.783183, 0.7361611, 0, 0.2980392, 1, 1,
0.2331751, 0.04483428, 0.1002575, 0, 0.2901961, 1, 1,
0.2339467, 0.06605666, 1.237144, 0, 0.2862745, 1, 1,
0.2341433, 0.6690962, -0.8774835, 0, 0.2784314, 1, 1,
0.240521, -1.438507, 4.289708, 0, 0.2745098, 1, 1,
0.252349, -0.1372529, 2.174828, 0, 0.2666667, 1, 1,
0.2544004, -0.341352, 1.530015, 0, 0.2627451, 1, 1,
0.2566994, -1.503587, 4.232105, 0, 0.254902, 1, 1,
0.2567376, -1.144745, 2.69049, 0, 0.2509804, 1, 1,
0.2583343, -0.4474842, 3.090774, 0, 0.2431373, 1, 1,
0.2619157, 0.4606929, 1.315225, 0, 0.2392157, 1, 1,
0.2674317, 0.2163807, 0.998714, 0, 0.2313726, 1, 1,
0.2688464, -0.6040238, 2.003554, 0, 0.227451, 1, 1,
0.2735359, -1.620777, 3.155945, 0, 0.2196078, 1, 1,
0.2768678, 0.4910478, -0.6174645, 0, 0.2156863, 1, 1,
0.2774319, 0.1541284, 1.181712, 0, 0.2078431, 1, 1,
0.2847684, 0.1305146, 1.84445, 0, 0.2039216, 1, 1,
0.2883984, 0.03826521, 2.01386, 0, 0.1960784, 1, 1,
0.288732, -0.1651927, 2.351625, 0, 0.1882353, 1, 1,
0.2901974, 1.517848, 1.929855, 0, 0.1843137, 1, 1,
0.2907633, 1.13257, 0.1907918, 0, 0.1764706, 1, 1,
0.2989177, -1.446599, 2.493509, 0, 0.172549, 1, 1,
0.2998486, -1.643802, 3.164947, 0, 0.1647059, 1, 1,
0.3022035, -0.3884486, 0.3355003, 0, 0.1607843, 1, 1,
0.3042009, -2.298947, 2.321697, 0, 0.1529412, 1, 1,
0.3067751, -1.48264, 2.156014, 0, 0.1490196, 1, 1,
0.3127657, 0.3393394, 0.6480277, 0, 0.1411765, 1, 1,
0.3156637, 2.481137, -0.1607087, 0, 0.1372549, 1, 1,
0.3247432, -0.5288899, 3.450943, 0, 0.1294118, 1, 1,
0.3258033, -0.134644, 3.337047, 0, 0.1254902, 1, 1,
0.3380799, -0.1417493, 4.117628, 0, 0.1176471, 1, 1,
0.3385896, 1.013766, -0.3615634, 0, 0.1137255, 1, 1,
0.3394236, 2.020209, 0.1207313, 0, 0.1058824, 1, 1,
0.3425644, -0.6378117, 2.51704, 0, 0.09803922, 1, 1,
0.3431322, -1.348051, 1.857297, 0, 0.09411765, 1, 1,
0.3436218, 0.6551312, -0.7397469, 0, 0.08627451, 1, 1,
0.3457715, -1.795748, 3.583201, 0, 0.08235294, 1, 1,
0.3499781, -1.384414, 3.61688, 0, 0.07450981, 1, 1,
0.3516848, -0.5385036, 3.31544, 0, 0.07058824, 1, 1,
0.3542998, -0.8025987, 3.755526, 0, 0.0627451, 1, 1,
0.3653422, 0.6432152, 1.356759, 0, 0.05882353, 1, 1,
0.368815, -0.1123148, 3.145147, 0, 0.05098039, 1, 1,
0.3788678, 0.3185918, 1.190821, 0, 0.04705882, 1, 1,
0.3794498, 0.0160713, 0.8990151, 0, 0.03921569, 1, 1,
0.3830732, 0.6641256, 0.6929414, 0, 0.03529412, 1, 1,
0.383878, 1.210994, 0.9816995, 0, 0.02745098, 1, 1,
0.3855711, -0.3443228, 2.080467, 0, 0.02352941, 1, 1,
0.38767, 0.5983595, 0.6632111, 0, 0.01568628, 1, 1,
0.3902715, 0.7804295, 0.9727298, 0, 0.01176471, 1, 1,
0.3906573, -1.379397, 2.850522, 0, 0.003921569, 1, 1,
0.3914043, 0.3085516, 0.8445551, 0.003921569, 0, 1, 1,
0.3924419, -0.3048017, 2.589398, 0.007843138, 0, 1, 1,
0.3939296, 0.5285369, -0.2167871, 0.01568628, 0, 1, 1,
0.3948402, 1.16418, 0.3149211, 0.01960784, 0, 1, 1,
0.4045869, 1.691462, 0.7730454, 0.02745098, 0, 1, 1,
0.4107412, -0.5815115, 1.044167, 0.03137255, 0, 1, 1,
0.4160697, 1.877456, 0.6660289, 0.03921569, 0, 1, 1,
0.4205335, -1.515509, 3.13735, 0.04313726, 0, 1, 1,
0.4216309, 0.563189, 1.874993, 0.05098039, 0, 1, 1,
0.4224079, -1.49546, 2.244325, 0.05490196, 0, 1, 1,
0.4262269, -0.1914761, 1.619158, 0.0627451, 0, 1, 1,
0.4272395, 0.077026, 1.048925, 0.06666667, 0, 1, 1,
0.4380277, -1.093818, 2.870618, 0.07450981, 0, 1, 1,
0.4394556, -2.433534, 2.583451, 0.07843138, 0, 1, 1,
0.4419212, -0.2308722, 1.951246, 0.08627451, 0, 1, 1,
0.4437032, 0.2125679, 0.06425543, 0.09019608, 0, 1, 1,
0.4520312, 0.9830059, 0.3013035, 0.09803922, 0, 1, 1,
0.453128, -0.4416571, 3.064777, 0.1058824, 0, 1, 1,
0.4625502, 0.6649232, 0.4722854, 0.1098039, 0, 1, 1,
0.467046, 0.3046255, 1.104301, 0.1176471, 0, 1, 1,
0.4761844, 0.1093324, 0.132368, 0.1215686, 0, 1, 1,
0.4768156, 0.5752963, 0.7363184, 0.1294118, 0, 1, 1,
0.4794955, 0.0345417, 2.28011, 0.1333333, 0, 1, 1,
0.4797392, 0.7972618, 2.049087, 0.1411765, 0, 1, 1,
0.4857025, -2.019126, 2.874887, 0.145098, 0, 1, 1,
0.4857083, 1.061528, -0.3091711, 0.1529412, 0, 1, 1,
0.4867392, -0.5021758, 3.657107, 0.1568628, 0, 1, 1,
0.4867561, -0.8824771, 4.322948, 0.1647059, 0, 1, 1,
0.4963993, 0.7221379, 2.164057, 0.1686275, 0, 1, 1,
0.5024939, -1.403037, 5.001194, 0.1764706, 0, 1, 1,
0.5046342, -0.5393484, 3.076805, 0.1803922, 0, 1, 1,
0.5103114, -0.7095641, 3.44646, 0.1882353, 0, 1, 1,
0.5153482, -1.306181, 1.254592, 0.1921569, 0, 1, 1,
0.5153626, 0.3444466, 0.3962608, 0.2, 0, 1, 1,
0.5166243, -0.8236881, 4.156629, 0.2078431, 0, 1, 1,
0.5173684, 0.1403293, 0.9745046, 0.2117647, 0, 1, 1,
0.5207981, -0.2667804, 1.852434, 0.2196078, 0, 1, 1,
0.5281009, 2.360929, 0.718654, 0.2235294, 0, 1, 1,
0.5286193, -0.5509807, 1.673764, 0.2313726, 0, 1, 1,
0.5287093, -0.5502005, 2.795766, 0.2352941, 0, 1, 1,
0.5312281, 0.382028, -0.3865862, 0.2431373, 0, 1, 1,
0.5313909, -0.686438, 1.85819, 0.2470588, 0, 1, 1,
0.5334304, -0.794171, 2.341009, 0.254902, 0, 1, 1,
0.5379109, 1.973213, -0.5148587, 0.2588235, 0, 1, 1,
0.53915, -0.338796, 1.85436, 0.2666667, 0, 1, 1,
0.5395606, -0.4667537, 2.660889, 0.2705882, 0, 1, 1,
0.5423778, 0.1061984, 0.8684687, 0.2784314, 0, 1, 1,
0.543585, 0.6905413, 1.985728, 0.282353, 0, 1, 1,
0.5498961, 0.4369232, 1.904287, 0.2901961, 0, 1, 1,
0.5512797, -1.81587, 2.563911, 0.2941177, 0, 1, 1,
0.5533571, 0.09013965, 3.086839, 0.3019608, 0, 1, 1,
0.5576351, 1.346182, 0.06593482, 0.3098039, 0, 1, 1,
0.5644476, -1.386882, 2.994234, 0.3137255, 0, 1, 1,
0.5660569, -2.136482, 2.962305, 0.3215686, 0, 1, 1,
0.5674974, -1.321854, 3.265698, 0.3254902, 0, 1, 1,
0.5706849, 0.1131169, 1.96613, 0.3333333, 0, 1, 1,
0.5734647, 0.4921962, 3.161126, 0.3372549, 0, 1, 1,
0.5770482, 0.3146271, 1.409751, 0.345098, 0, 1, 1,
0.58385, -1.010352, 2.249497, 0.3490196, 0, 1, 1,
0.593711, 0.08474431, 0.09984808, 0.3568628, 0, 1, 1,
0.595513, 0.2504338, -0.1033599, 0.3607843, 0, 1, 1,
0.5987442, 1.121613, 1.604733, 0.3686275, 0, 1, 1,
0.6008576, 0.5516384, 0.1296216, 0.372549, 0, 1, 1,
0.6037726, 0.542989, 1.227293, 0.3803922, 0, 1, 1,
0.6069416, -0.1026076, 2.561813, 0.3843137, 0, 1, 1,
0.6155646, -0.9622469, 3.208784, 0.3921569, 0, 1, 1,
0.6164263, 0.3175789, 3.183782, 0.3960784, 0, 1, 1,
0.6166806, 0.07441663, 0.1555206, 0.4039216, 0, 1, 1,
0.6189446, -0.749846, 3.089885, 0.4117647, 0, 1, 1,
0.6192153, -0.5956699, 3.612972, 0.4156863, 0, 1, 1,
0.6195554, 1.120389, -1.45747, 0.4235294, 0, 1, 1,
0.6198435, 0.6884344, 0.7899328, 0.427451, 0, 1, 1,
0.6200612, 0.1751187, 2.130161, 0.4352941, 0, 1, 1,
0.6233206, -0.4136448, 2.042337, 0.4392157, 0, 1, 1,
0.6258527, 0.7100316, 2.133165, 0.4470588, 0, 1, 1,
0.6374917, 0.6473485, 0.383398, 0.4509804, 0, 1, 1,
0.6450825, -0.7374772, 2.026917, 0.4588235, 0, 1, 1,
0.6513028, -0.06020388, 2.404698, 0.4627451, 0, 1, 1,
0.6525716, 0.9707031, -1.123328, 0.4705882, 0, 1, 1,
0.6536518, -0.07281209, 0.2368426, 0.4745098, 0, 1, 1,
0.6546249, -2.510765, 3.072504, 0.4823529, 0, 1, 1,
0.6555023, -0.7078576, 1.918791, 0.4862745, 0, 1, 1,
0.6569831, -0.3094859, 2.180647, 0.4941176, 0, 1, 1,
0.6645489, -1.723224, 2.433594, 0.5019608, 0, 1, 1,
0.6716117, -0.08968396, 0.455473, 0.5058824, 0, 1, 1,
0.6749324, -0.4058245, 3.280001, 0.5137255, 0, 1, 1,
0.6781329, -1.176342, 0.5394716, 0.5176471, 0, 1, 1,
0.6835431, 0.6810593, 0.2931423, 0.5254902, 0, 1, 1,
0.6865169, 1.299865, -0.6783723, 0.5294118, 0, 1, 1,
0.6948775, 0.04273589, 2.830637, 0.5372549, 0, 1, 1,
0.695558, -0.4881385, 1.867354, 0.5411765, 0, 1, 1,
0.7004086, -0.4095815, 2.569547, 0.5490196, 0, 1, 1,
0.7023127, -0.9067196, 2.363447, 0.5529412, 0, 1, 1,
0.7058315, 1.060045, 1.637735, 0.5607843, 0, 1, 1,
0.7072853, 2.028763, 1.703547, 0.5647059, 0, 1, 1,
0.7146198, -0.2693595, 1.285308, 0.572549, 0, 1, 1,
0.7180204, -2.18472, 4.21594, 0.5764706, 0, 1, 1,
0.7274429, -1.098073, 2.90759, 0.5843138, 0, 1, 1,
0.7286525, -1.235911, 3.355859, 0.5882353, 0, 1, 1,
0.728687, -0.4736583, 2.843153, 0.5960785, 0, 1, 1,
0.7420182, -1.106569, 2.288482, 0.6039216, 0, 1, 1,
0.7424949, 1.221454, 0.1185668, 0.6078432, 0, 1, 1,
0.7471027, 0.2181668, 1.020807, 0.6156863, 0, 1, 1,
0.7524876, 0.8061393, 2.250453, 0.6196079, 0, 1, 1,
0.7540818, 0.4923402, 0.1368897, 0.627451, 0, 1, 1,
0.7588074, -0.2006188, 2.666919, 0.6313726, 0, 1, 1,
0.761851, 0.1853471, 3.443057, 0.6392157, 0, 1, 1,
0.7653054, -0.4495977, 1.169603, 0.6431373, 0, 1, 1,
0.769984, -1.379092, 2.423386, 0.6509804, 0, 1, 1,
0.7711893, -0.8782055, 2.770735, 0.654902, 0, 1, 1,
0.7853584, 1.107597, 1.749393, 0.6627451, 0, 1, 1,
0.790872, -1.215222, 2.090711, 0.6666667, 0, 1, 1,
0.7926089, -1.073784, 2.908608, 0.6745098, 0, 1, 1,
0.7953267, -0.4161182, 2.601287, 0.6784314, 0, 1, 1,
0.803914, 0.4378355, 0.5157278, 0.6862745, 0, 1, 1,
0.8042814, -0.412921, 0.5715305, 0.6901961, 0, 1, 1,
0.8096931, -1.18608, 3.307328, 0.6980392, 0, 1, 1,
0.8099033, -1.409084, 1.671953, 0.7058824, 0, 1, 1,
0.8108747, 0.218972, 1.619997, 0.7098039, 0, 1, 1,
0.8139544, 0.4927733, 0.8049933, 0.7176471, 0, 1, 1,
0.8163682, -0.09042384, 1.3046, 0.7215686, 0, 1, 1,
0.8221738, 0.02704967, 0.6321762, 0.7294118, 0, 1, 1,
0.8226703, -1.099816, 1.756841, 0.7333333, 0, 1, 1,
0.8264648, 0.22475, -0.7731534, 0.7411765, 0, 1, 1,
0.8269973, -0.2969569, 2.599651, 0.7450981, 0, 1, 1,
0.8285674, -2.427348, 3.568901, 0.7529412, 0, 1, 1,
0.8313629, 0.5817772, 0.908434, 0.7568628, 0, 1, 1,
0.8324543, 0.7957245, 0.06014764, 0.7647059, 0, 1, 1,
0.8403209, 1.982635, -0.1435419, 0.7686275, 0, 1, 1,
0.8431942, -0.5629218, 2.171766, 0.7764706, 0, 1, 1,
0.8459365, -0.6097553, 1.380199, 0.7803922, 0, 1, 1,
0.8504884, -0.2623904, 3.107299, 0.7882353, 0, 1, 1,
0.8597245, -1.151151, 1.705745, 0.7921569, 0, 1, 1,
0.8606128, 1.268997, 0.623207, 0.8, 0, 1, 1,
0.8620384, 0.4933411, 2.390357, 0.8078431, 0, 1, 1,
0.868477, -0.2399981, 2.161683, 0.8117647, 0, 1, 1,
0.8753298, 0.5321676, 0.7427546, 0.8196079, 0, 1, 1,
0.8780096, -1.720772, 1.400405, 0.8235294, 0, 1, 1,
0.8793318, 0.02413492, 3.754193, 0.8313726, 0, 1, 1,
0.8797449, 0.4434085, -0.722487, 0.8352941, 0, 1, 1,
0.8803986, 0.7330952, 0.9583184, 0.8431373, 0, 1, 1,
0.88559, -0.7545583, 0.5697921, 0.8470588, 0, 1, 1,
0.8951281, -0.6469532, 2.68029, 0.854902, 0, 1, 1,
0.9034793, 0.3640974, -0.1678193, 0.8588235, 0, 1, 1,
0.9052738, 0.8552244, 1.083437, 0.8666667, 0, 1, 1,
0.9133636, -0.2784286, 0.8396643, 0.8705882, 0, 1, 1,
0.9142846, 1.405769, 1.171687, 0.8784314, 0, 1, 1,
0.9146881, -0.5947356, 2.332185, 0.8823529, 0, 1, 1,
0.924644, -1.008729, 0.1666111, 0.8901961, 0, 1, 1,
0.9255368, 0.6706731, 2.120204, 0.8941177, 0, 1, 1,
0.9387226, -0.3164649, 2.996814, 0.9019608, 0, 1, 1,
0.9405249, -0.3718256, 1.519483, 0.9098039, 0, 1, 1,
0.9434689, 0.9759429, 1.4986, 0.9137255, 0, 1, 1,
0.945196, -0.1385489, -1.044009, 0.9215686, 0, 1, 1,
0.9468261, 1.213377, 1.916102, 0.9254902, 0, 1, 1,
0.9492036, -0.4597453, 2.161547, 0.9333333, 0, 1, 1,
0.9509133, -0.4088486, 0.03642121, 0.9372549, 0, 1, 1,
0.9567876, 0.0005326981, 1.122485, 0.945098, 0, 1, 1,
0.9587783, -2.7315, 3.533449, 0.9490196, 0, 1, 1,
0.9629044, -0.6343529, 1.17684, 0.9568627, 0, 1, 1,
0.9660352, -0.0600292, 1.042937, 0.9607843, 0, 1, 1,
0.9666246, -1.04737, 2.638919, 0.9686275, 0, 1, 1,
0.9694653, -0.464721, 2.052872, 0.972549, 0, 1, 1,
0.9753652, 0.06297369, 1.290914, 0.9803922, 0, 1, 1,
0.9805719, -0.5874316, 2.053548, 0.9843137, 0, 1, 1,
0.9808358, 1.330984, -0.6211368, 0.9921569, 0, 1, 1,
0.9810542, 0.5225831, 1.134676, 0.9960784, 0, 1, 1,
0.9833711, -0.5608819, 2.061785, 1, 0, 0.9960784, 1,
0.9855202, 0.9712762, 3.19831, 1, 0, 0.9882353, 1,
0.9856244, 0.5296912, 0.9124288, 1, 0, 0.9843137, 1,
0.9882237, -0.4794119, 1.809038, 1, 0, 0.9764706, 1,
0.9890045, -0.05400152, 0.4171343, 1, 0, 0.972549, 1,
0.9915757, 0.9405863, -1.093439, 1, 0, 0.9647059, 1,
0.9919131, -0.4305848, 2.179791, 1, 0, 0.9607843, 1,
0.992946, 0.6214104, 1.73813, 1, 0, 0.9529412, 1,
0.9936652, 1.01752, 1.704058, 1, 0, 0.9490196, 1,
1.001726, 0.1395901, 0.7095009, 1, 0, 0.9411765, 1,
1.001924, 0.0344261, 0.54119, 1, 0, 0.9372549, 1,
1.006695, -0.1272526, 0.8875079, 1, 0, 0.9294118, 1,
1.011906, -0.04960582, 2.772102, 1, 0, 0.9254902, 1,
1.012435, 0.189325, 3.642859, 1, 0, 0.9176471, 1,
1.013907, 0.3836735, 3.533214, 1, 0, 0.9137255, 1,
1.014823, -1.407174, 2.22836, 1, 0, 0.9058824, 1,
1.016832, 0.5701443, 2.104603, 1, 0, 0.9019608, 1,
1.018165, -1.068734, 2.828845, 1, 0, 0.8941177, 1,
1.022059, -0.885515, 5.038982, 1, 0, 0.8862745, 1,
1.025947, 0.324053, 1.006607, 1, 0, 0.8823529, 1,
1.027412, 0.7635441, 1.012057, 1, 0, 0.8745098, 1,
1.028405, 1.754447, 1.158256, 1, 0, 0.8705882, 1,
1.03278, -1.721023, 3.783105, 1, 0, 0.8627451, 1,
1.038524, 0.4307286, 2.024891, 1, 0, 0.8588235, 1,
1.041686, -2.021235, 2.085428, 1, 0, 0.8509804, 1,
1.044113, -0.2111648, 0.7206531, 1, 0, 0.8470588, 1,
1.049159, -1.299536, 0.5140414, 1, 0, 0.8392157, 1,
1.050889, -1.020093, 2.638609, 1, 0, 0.8352941, 1,
1.052308, -0.1031343, -0.2458657, 1, 0, 0.827451, 1,
1.052391, 1.359434, 0.3239254, 1, 0, 0.8235294, 1,
1.062602, -1.699427, 1.539722, 1, 0, 0.8156863, 1,
1.07085, 0.5542789, 1.861982, 1, 0, 0.8117647, 1,
1.075857, 0.03975448, 2.767738, 1, 0, 0.8039216, 1,
1.083213, 0.8277647, 2.150125, 1, 0, 0.7960784, 1,
1.083639, -0.1327079, 2.537322, 1, 0, 0.7921569, 1,
1.083769, 1.935883, 0.7042655, 1, 0, 0.7843137, 1,
1.085674, -0.8333727, 2.475251, 1, 0, 0.7803922, 1,
1.098164, -2.13113, 2.770844, 1, 0, 0.772549, 1,
1.106919, -1.772854, 1.486573, 1, 0, 0.7686275, 1,
1.11066, 1.923805, 1.001404, 1, 0, 0.7607843, 1,
1.118221, -0.777573, 2.751738, 1, 0, 0.7568628, 1,
1.119491, -0.852003, 3.722607, 1, 0, 0.7490196, 1,
1.122414, 0.4941098, 2.461842, 1, 0, 0.7450981, 1,
1.127892, 0.8569673, 1.485271, 1, 0, 0.7372549, 1,
1.131681, 1.072191, 3.498115, 1, 0, 0.7333333, 1,
1.13372, -0.7002648, 3.245219, 1, 0, 0.7254902, 1,
1.137416, -0.2232404, 0.392947, 1, 0, 0.7215686, 1,
1.138024, -0.6865205, 1.775004, 1, 0, 0.7137255, 1,
1.14149, -0.9009591, 1.285109, 1, 0, 0.7098039, 1,
1.141574, -1.321851, 2.19319, 1, 0, 0.7019608, 1,
1.143572, 0.5172679, 3.357671, 1, 0, 0.6941177, 1,
1.154931, 0.09841059, -0.6845602, 1, 0, 0.6901961, 1,
1.159506, 1.088397, -0.01447623, 1, 0, 0.682353, 1,
1.170714, -0.01305264, 0.09756495, 1, 0, 0.6784314, 1,
1.175988, -0.8261158, 4.027156, 1, 0, 0.6705883, 1,
1.179946, 0.5837203, 0.7316424, 1, 0, 0.6666667, 1,
1.193993, -0.424818, 1.177455, 1, 0, 0.6588235, 1,
1.19614, 0.4640726, 0.1859155, 1, 0, 0.654902, 1,
1.196849, -1.247384, 2.854011, 1, 0, 0.6470588, 1,
1.201342, -0.6419987, 1.414099, 1, 0, 0.6431373, 1,
1.210073, -0.3051574, 0.3444396, 1, 0, 0.6352941, 1,
1.221149, 0.7530374, 1.872353, 1, 0, 0.6313726, 1,
1.222443, -2.139836, 3.587046, 1, 0, 0.6235294, 1,
1.228028, -0.2345074, 2.670733, 1, 0, 0.6196079, 1,
1.230471, -0.2832118, 1.679489, 1, 0, 0.6117647, 1,
1.232735, -0.113724, -0.4024844, 1, 0, 0.6078432, 1,
1.233087, -1.055671, 1.753612, 1, 0, 0.6, 1,
1.236697, -1.826844, 3.263463, 1, 0, 0.5921569, 1,
1.241384, 0.8089581, 1.33059, 1, 0, 0.5882353, 1,
1.255611, 0.1995079, 1.466389, 1, 0, 0.5803922, 1,
1.263763, -1.61966, 2.51189, 1, 0, 0.5764706, 1,
1.270558, 0.8093178, 0.328586, 1, 0, 0.5686275, 1,
1.271918, -0.3631597, 2.81855, 1, 0, 0.5647059, 1,
1.27382, 1.458153, 2.104711, 1, 0, 0.5568628, 1,
1.284387, -0.7162113, 2.168195, 1, 0, 0.5529412, 1,
1.28731, 0.1478494, 1.607886, 1, 0, 0.5450981, 1,
1.294142, 1.088468, 1.373332, 1, 0, 0.5411765, 1,
1.308013, 0.5941035, -0.4983755, 1, 0, 0.5333334, 1,
1.309087, -0.3563289, 1.60487, 1, 0, 0.5294118, 1,
1.315408, -0.8898261, 2.940373, 1, 0, 0.5215687, 1,
1.3302, 0.6195284, 1.421211, 1, 0, 0.5176471, 1,
1.340191, 0.3206922, 0.9597839, 1, 0, 0.509804, 1,
1.351428, 0.4743876, 0.4421868, 1, 0, 0.5058824, 1,
1.357697, -0.3156931, 0.8128096, 1, 0, 0.4980392, 1,
1.358223, -1.014441, 2.663142, 1, 0, 0.4901961, 1,
1.371894, 1.528395, 2.521547, 1, 0, 0.4862745, 1,
1.381516, 0.02694229, 1.360543, 1, 0, 0.4784314, 1,
1.391592, -0.9680597, 3.525642, 1, 0, 0.4745098, 1,
1.392289, 0.9687876, 0.9091508, 1, 0, 0.4666667, 1,
1.40185, 0.2655684, 1.131939, 1, 0, 0.4627451, 1,
1.414193, 2.316946, 1.565042, 1, 0, 0.454902, 1,
1.422412, -0.8545849, 0.9209604, 1, 0, 0.4509804, 1,
1.423403, -1.731842, 2.6538, 1, 0, 0.4431373, 1,
1.425664, -1.582379, 2.230345, 1, 0, 0.4392157, 1,
1.432167, 0.7777793, -0.1169696, 1, 0, 0.4313726, 1,
1.455215, 1.552334, 1.446439, 1, 0, 0.427451, 1,
1.457471, -0.1971409, 1.329075, 1, 0, 0.4196078, 1,
1.477409, -0.5548323, 1.088767, 1, 0, 0.4156863, 1,
1.481363, -1.091892, 1.454141, 1, 0, 0.4078431, 1,
1.483669, -2.53196, 2.553405, 1, 0, 0.4039216, 1,
1.486505, -0.8083877, 2.397673, 1, 0, 0.3960784, 1,
1.498083, 0.2119911, 0.8534016, 1, 0, 0.3882353, 1,
1.511915, 0.8666047, 1.116315, 1, 0, 0.3843137, 1,
1.528947, 0.09936588, 0.1715354, 1, 0, 0.3764706, 1,
1.53013, 2.024144, 1.430561, 1, 0, 0.372549, 1,
1.538155, -1.020409, 2.166113, 1, 0, 0.3647059, 1,
1.540166, -0.6243051, 2.65609, 1, 0, 0.3607843, 1,
1.572368, 1.885387, 0.7790678, 1, 0, 0.3529412, 1,
1.583712, 0.2606986, 1.407588, 1, 0, 0.3490196, 1,
1.597365, -0.3337142, 0.8139764, 1, 0, 0.3411765, 1,
1.609254, 1.277241, 0.4945532, 1, 0, 0.3372549, 1,
1.611432, -1.484351, 2.409901, 1, 0, 0.3294118, 1,
1.620195, -2.305622, 4.371578, 1, 0, 0.3254902, 1,
1.645801, -0.2952257, 1.690054, 1, 0, 0.3176471, 1,
1.647111, 0.7138004, -0.03838241, 1, 0, 0.3137255, 1,
1.662994, 0.95426, 3.136437, 1, 0, 0.3058824, 1,
1.664624, 0.5566428, 1.071025, 1, 0, 0.2980392, 1,
1.711389, 0.3388714, 1.394892, 1, 0, 0.2941177, 1,
1.722126, 0.5366297, 0.7430999, 1, 0, 0.2862745, 1,
1.726629, -0.05374564, 0.139632, 1, 0, 0.282353, 1,
1.738368, -1.174642, 2.292199, 1, 0, 0.2745098, 1,
1.756022, -0.4297792, 2.823435, 1, 0, 0.2705882, 1,
1.761755, -1.433778, 1.192713, 1, 0, 0.2627451, 1,
1.801462, 0.1327124, 1.091226, 1, 0, 0.2588235, 1,
1.805231, -0.7564371, 3.234664, 1, 0, 0.2509804, 1,
1.81174, -2.488443, 1.550143, 1, 0, 0.2470588, 1,
1.840755, 3.165483, -0.2568611, 1, 0, 0.2392157, 1,
1.841049, 0.2117841, 1.33966, 1, 0, 0.2352941, 1,
1.849165, 0.1376571, -0.742858, 1, 0, 0.227451, 1,
1.851202, -0.3698499, 3.37997, 1, 0, 0.2235294, 1,
1.907193, 2.025272, -0.2016515, 1, 0, 0.2156863, 1,
1.927027, -2.198431, 2.402394, 1, 0, 0.2117647, 1,
1.929147, -0.3519762, 3.214706, 1, 0, 0.2039216, 1,
1.939693, -0.005317583, 2.153565, 1, 0, 0.1960784, 1,
1.945549, 0.3970669, 1.305797, 1, 0, 0.1921569, 1,
1.946987, -1.749193, 2.034977, 1, 0, 0.1843137, 1,
1.950695, -0.06637497, 0.627254, 1, 0, 0.1803922, 1,
1.963836, 0.33597, -0.04033323, 1, 0, 0.172549, 1,
1.974821, -0.05262245, 3.382423, 1, 0, 0.1686275, 1,
1.989884, -0.5409176, 3.361189, 1, 0, 0.1607843, 1,
1.990837, 0.2408229, 0.4883198, 1, 0, 0.1568628, 1,
2.051069, 1.5029, 0.4922206, 1, 0, 0.1490196, 1,
2.06462, 0.5422921, 1.958407, 1, 0, 0.145098, 1,
2.085839, 0.7555323, -0.2738456, 1, 0, 0.1372549, 1,
2.136762, -1.016443, 2.39792, 1, 0, 0.1333333, 1,
2.138364, -1.270106, 1.343875, 1, 0, 0.1254902, 1,
2.143447, 0.172016, 2.732764, 1, 0, 0.1215686, 1,
2.190922, 0.9712371, 1.607282, 1, 0, 0.1137255, 1,
2.19124, 2.856775, 1.839123, 1, 0, 0.1098039, 1,
2.199528, -0.226986, 0.6726526, 1, 0, 0.1019608, 1,
2.222239, -0.7575495, 0.5950544, 1, 0, 0.09411765, 1,
2.281283, 0.8243358, 1.567128, 1, 0, 0.09019608, 1,
2.285081, 0.07778599, 0.3297288, 1, 0, 0.08235294, 1,
2.301047, -0.255382, 2.706698, 1, 0, 0.07843138, 1,
2.336037, -0.9012749, 0.458625, 1, 0, 0.07058824, 1,
2.348608, -0.3593373, 1.859113, 1, 0, 0.06666667, 1,
2.384934, -1.214527, 1.850367, 1, 0, 0.05882353, 1,
2.40535, 1.888399, 0.6123961, 1, 0, 0.05490196, 1,
2.426971, 0.3731338, 1.642459, 1, 0, 0.04705882, 1,
2.43875, 0.1365345, 2.890712, 1, 0, 0.04313726, 1,
2.439671, -0.33912, 1.723507, 1, 0, 0.03529412, 1,
2.462826, 0.2321839, -0.1426401, 1, 0, 0.03137255, 1,
2.503304, 0.0928223, 1.501385, 1, 0, 0.02352941, 1,
2.566671, 0.1972415, 3.437254, 1, 0, 0.01960784, 1,
2.580782, 0.569573, 2.178754, 1, 0, 0.01176471, 1,
2.71932, -0.9889442, 0.7247764, 1, 0, 0.007843138, 1
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
-0.2310486, -3.733982, -8.020116, 0, -0.5, 0.5, 0.5,
-0.2310486, -3.733982, -8.020116, 1, -0.5, 0.5, 0.5,
-0.2310486, -3.733982, -8.020116, 1, 1.5, 0.5, 0.5,
-0.2310486, -3.733982, -8.020116, 0, 1.5, 0.5, 0.5
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
-4.181592, 0.225672, -8.020116, 0, -0.5, 0.5, 0.5,
-4.181592, 0.225672, -8.020116, 1, -0.5, 0.5, 0.5,
-4.181592, 0.225672, -8.020116, 1, 1.5, 0.5, 0.5,
-4.181592, 0.225672, -8.020116, 0, 1.5, 0.5, 0.5
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
-4.181592, -3.733982, -0.544215, 0, -0.5, 0.5, 0.5,
-4.181592, -3.733982, -0.544215, 1, -0.5, 0.5, 0.5,
-4.181592, -3.733982, -0.544215, 1, 1.5, 0.5, 0.5,
-4.181592, -3.733982, -0.544215, 0, 1.5, 0.5, 0.5
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
-3, -2.820215, -6.294908,
2, -2.820215, -6.294908,
-3, -2.820215, -6.294908,
-3, -2.97251, -6.582443,
-2, -2.820215, -6.294908,
-2, -2.97251, -6.582443,
-1, -2.820215, -6.294908,
-1, -2.97251, -6.582443,
0, -2.820215, -6.294908,
0, -2.97251, -6.582443,
1, -2.820215, -6.294908,
1, -2.97251, -6.582443,
2, -2.820215, -6.294908,
2, -2.97251, -6.582443
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
-3, -3.277099, -7.157512, 0, -0.5, 0.5, 0.5,
-3, -3.277099, -7.157512, 1, -0.5, 0.5, 0.5,
-3, -3.277099, -7.157512, 1, 1.5, 0.5, 0.5,
-3, -3.277099, -7.157512, 0, 1.5, 0.5, 0.5,
-2, -3.277099, -7.157512, 0, -0.5, 0.5, 0.5,
-2, -3.277099, -7.157512, 1, -0.5, 0.5, 0.5,
-2, -3.277099, -7.157512, 1, 1.5, 0.5, 0.5,
-2, -3.277099, -7.157512, 0, 1.5, 0.5, 0.5,
-1, -3.277099, -7.157512, 0, -0.5, 0.5, 0.5,
-1, -3.277099, -7.157512, 1, -0.5, 0.5, 0.5,
-1, -3.277099, -7.157512, 1, 1.5, 0.5, 0.5,
-1, -3.277099, -7.157512, 0, 1.5, 0.5, 0.5,
0, -3.277099, -7.157512, 0, -0.5, 0.5, 0.5,
0, -3.277099, -7.157512, 1, -0.5, 0.5, 0.5,
0, -3.277099, -7.157512, 1, 1.5, 0.5, 0.5,
0, -3.277099, -7.157512, 0, 1.5, 0.5, 0.5,
1, -3.277099, -7.157512, 0, -0.5, 0.5, 0.5,
1, -3.277099, -7.157512, 1, -0.5, 0.5, 0.5,
1, -3.277099, -7.157512, 1, 1.5, 0.5, 0.5,
1, -3.277099, -7.157512, 0, 1.5, 0.5, 0.5,
2, -3.277099, -7.157512, 0, -0.5, 0.5, 0.5,
2, -3.277099, -7.157512, 1, -0.5, 0.5, 0.5,
2, -3.277099, -7.157512, 1, 1.5, 0.5, 0.5,
2, -3.277099, -7.157512, 0, 1.5, 0.5, 0.5
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
-3.269928, -2, -6.294908,
-3.269928, 3, -6.294908,
-3.269928, -2, -6.294908,
-3.421872, -2, -6.582443,
-3.269928, -1, -6.294908,
-3.421872, -1, -6.582443,
-3.269928, 0, -6.294908,
-3.421872, 0, -6.582443,
-3.269928, 1, -6.294908,
-3.421872, 1, -6.582443,
-3.269928, 2, -6.294908,
-3.421872, 2, -6.582443,
-3.269928, 3, -6.294908,
-3.421872, 3, -6.582443
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
-3.72576, -2, -7.157512, 0, -0.5, 0.5, 0.5,
-3.72576, -2, -7.157512, 1, -0.5, 0.5, 0.5,
-3.72576, -2, -7.157512, 1, 1.5, 0.5, 0.5,
-3.72576, -2, -7.157512, 0, 1.5, 0.5, 0.5,
-3.72576, -1, -7.157512, 0, -0.5, 0.5, 0.5,
-3.72576, -1, -7.157512, 1, -0.5, 0.5, 0.5,
-3.72576, -1, -7.157512, 1, 1.5, 0.5, 0.5,
-3.72576, -1, -7.157512, 0, 1.5, 0.5, 0.5,
-3.72576, 0, -7.157512, 0, -0.5, 0.5, 0.5,
-3.72576, 0, -7.157512, 1, -0.5, 0.5, 0.5,
-3.72576, 0, -7.157512, 1, 1.5, 0.5, 0.5,
-3.72576, 0, -7.157512, 0, 1.5, 0.5, 0.5,
-3.72576, 1, -7.157512, 0, -0.5, 0.5, 0.5,
-3.72576, 1, -7.157512, 1, -0.5, 0.5, 0.5,
-3.72576, 1, -7.157512, 1, 1.5, 0.5, 0.5,
-3.72576, 1, -7.157512, 0, 1.5, 0.5, 0.5,
-3.72576, 2, -7.157512, 0, -0.5, 0.5, 0.5,
-3.72576, 2, -7.157512, 1, -0.5, 0.5, 0.5,
-3.72576, 2, -7.157512, 1, 1.5, 0.5, 0.5,
-3.72576, 2, -7.157512, 0, 1.5, 0.5, 0.5,
-3.72576, 3, -7.157512, 0, -0.5, 0.5, 0.5,
-3.72576, 3, -7.157512, 1, -0.5, 0.5, 0.5,
-3.72576, 3, -7.157512, 1, 1.5, 0.5, 0.5,
-3.72576, 3, -7.157512, 0, 1.5, 0.5, 0.5
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
-3.269928, -2.820215, -6,
-3.269928, -2.820215, 4,
-3.269928, -2.820215, -6,
-3.421872, -2.97251, -6,
-3.269928, -2.820215, -4,
-3.421872, -2.97251, -4,
-3.269928, -2.820215, -2,
-3.421872, -2.97251, -2,
-3.269928, -2.820215, 0,
-3.421872, -2.97251, 0,
-3.269928, -2.820215, 2,
-3.421872, -2.97251, 2,
-3.269928, -2.820215, 4,
-3.421872, -2.97251, 4
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
-3.72576, -3.277099, -6, 0, -0.5, 0.5, 0.5,
-3.72576, -3.277099, -6, 1, -0.5, 0.5, 0.5,
-3.72576, -3.277099, -6, 1, 1.5, 0.5, 0.5,
-3.72576, -3.277099, -6, 0, 1.5, 0.5, 0.5,
-3.72576, -3.277099, -4, 0, -0.5, 0.5, 0.5,
-3.72576, -3.277099, -4, 1, -0.5, 0.5, 0.5,
-3.72576, -3.277099, -4, 1, 1.5, 0.5, 0.5,
-3.72576, -3.277099, -4, 0, 1.5, 0.5, 0.5,
-3.72576, -3.277099, -2, 0, -0.5, 0.5, 0.5,
-3.72576, -3.277099, -2, 1, -0.5, 0.5, 0.5,
-3.72576, -3.277099, -2, 1, 1.5, 0.5, 0.5,
-3.72576, -3.277099, -2, 0, 1.5, 0.5, 0.5,
-3.72576, -3.277099, 0, 0, -0.5, 0.5, 0.5,
-3.72576, -3.277099, 0, 1, -0.5, 0.5, 0.5,
-3.72576, -3.277099, 0, 1, 1.5, 0.5, 0.5,
-3.72576, -3.277099, 0, 0, 1.5, 0.5, 0.5,
-3.72576, -3.277099, 2, 0, -0.5, 0.5, 0.5,
-3.72576, -3.277099, 2, 1, -0.5, 0.5, 0.5,
-3.72576, -3.277099, 2, 1, 1.5, 0.5, 0.5,
-3.72576, -3.277099, 2, 0, 1.5, 0.5, 0.5,
-3.72576, -3.277099, 4, 0, -0.5, 0.5, 0.5,
-3.72576, -3.277099, 4, 1, -0.5, 0.5, 0.5,
-3.72576, -3.277099, 4, 1, 1.5, 0.5, 0.5,
-3.72576, -3.277099, 4, 0, 1.5, 0.5, 0.5
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
-3.269928, -2.820215, -6.294908,
-3.269928, 3.271559, -6.294908,
-3.269928, -2.820215, 5.206478,
-3.269928, 3.271559, 5.206478,
-3.269928, -2.820215, -6.294908,
-3.269928, -2.820215, 5.206478,
-3.269928, 3.271559, -6.294908,
-3.269928, 3.271559, 5.206478,
-3.269928, -2.820215, -6.294908,
2.807831, -2.820215, -6.294908,
-3.269928, -2.820215, 5.206478,
2.807831, -2.820215, 5.206478,
-3.269928, 3.271559, -6.294908,
2.807831, 3.271559, -6.294908,
-3.269928, 3.271559, 5.206478,
2.807831, 3.271559, 5.206478,
2.807831, -2.820215, -6.294908,
2.807831, 3.271559, -6.294908,
2.807831, -2.820215, 5.206478,
2.807831, 3.271559, 5.206478,
2.807831, -2.820215, -6.294908,
2.807831, -2.820215, 5.206478,
2.807831, 3.271559, -6.294908,
2.807831, 3.271559, 5.206478
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
var radius = 7.670214;
var distance = 34.12564;
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
mvMatrix.translate( 0.2310486, -0.225672, 0.544215 );
mvMatrix.scale( 1.364514, 1.361374, 0.7210596 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.12564);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Nix<-read.table("Nix.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Nix$V2
```

```
## Error in eval(expr, envir, enclos): object 'Nix' not found
```

```r
y<-Nix$V3
```

```
## Error in eval(expr, envir, enclos): object 'Nix' not found
```

```r
z<-Nix$V4
```

```
## Error in eval(expr, envir, enclos): object 'Nix' not found
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
-3.181417, -0.8437414, -0.3481598, 0, 0, 1, 1, 1,
-3.039467, -2.287345, -2.959866, 1, 0, 0, 1, 1,
-2.970438, 0.5433714, 0.1082609, 1, 0, 0, 1, 1,
-2.53916, 0.696278, -2.644251, 1, 0, 0, 1, 1,
-2.526356, 1.581948, -1.772245, 1, 0, 0, 1, 1,
-2.52483, -0.06155154, -1.998175, 1, 0, 0, 1, 1,
-2.481367, 1.041184, -1.051772, 0, 0, 0, 1, 1,
-2.432793, 0.4562245, -3.152742, 0, 0, 0, 1, 1,
-2.391596, 1.033757, 1.25163, 0, 0, 0, 1, 1,
-2.383565, 0.3556457, -2.205358, 0, 0, 0, 1, 1,
-2.286977, 0.6933287, -0.8584365, 0, 0, 0, 1, 1,
-2.260251, 1.495435, -2.445544, 0, 0, 0, 1, 1,
-2.245731, -1.495676, -3.897423, 0, 0, 0, 1, 1,
-2.2405, -0.004479412, -0.8072208, 1, 1, 1, 1, 1,
-2.217422, -0.7380173, -1.684331, 1, 1, 1, 1, 1,
-2.208211, 0.2374325, -1.373725, 1, 1, 1, 1, 1,
-2.174486, 1.152109, 0.4312809, 1, 1, 1, 1, 1,
-2.16661, 0.5227428, 1.593448, 1, 1, 1, 1, 1,
-2.163747, -0.01490882, -1.13076, 1, 1, 1, 1, 1,
-2.141045, -1.014977, -4.711504, 1, 1, 1, 1, 1,
-2.09576, 0.01567492, -2.702881, 1, 1, 1, 1, 1,
-2.068439, -0.9710259, -2.258965, 1, 1, 1, 1, 1,
-2.044683, -1.31896, -3.001946, 1, 1, 1, 1, 1,
-2.022696, 1.600907, -1.648795, 1, 1, 1, 1, 1,
-2.021311, -0.5094932, -0.9818502, 1, 1, 1, 1, 1,
-2.015337, -1.562548, -2.970152, 1, 1, 1, 1, 1,
-2.00251, 1.034361, -0.4060316, 1, 1, 1, 1, 1,
-1.991862, -0.3843862, -1.61942, 1, 1, 1, 1, 1,
-1.989172, -1.83349, -1.111487, 0, 0, 1, 1, 1,
-1.975366, -0.6066195, -1.722096, 1, 0, 0, 1, 1,
-1.971486, 0.1995958, -2.179128, 1, 0, 0, 1, 1,
-1.935397, 1.406909, -0.9094271, 1, 0, 0, 1, 1,
-1.931373, -0.4844217, -3.058558, 1, 0, 0, 1, 1,
-1.920596, 0.5189293, -2.308, 1, 0, 0, 1, 1,
-1.895992, 0.1367048, -3.231317, 0, 0, 0, 1, 1,
-1.798203, -0.6023661, -2.512788, 0, 0, 0, 1, 1,
-1.779155, 0.02315477, -1.352599, 0, 0, 0, 1, 1,
-1.736195, -0.1817981, 0.1998676, 0, 0, 0, 1, 1,
-1.73231, -0.8592577, -0.9514794, 0, 0, 0, 1, 1,
-1.730708, 0.9109524, -1.125766, 0, 0, 0, 1, 1,
-1.711666, -0.2683175, -2.224145, 0, 0, 0, 1, 1,
-1.710355, 0.7862865, 0.3265755, 1, 1, 1, 1, 1,
-1.704165, -0.6805132, -1.955333, 1, 1, 1, 1, 1,
-1.674816, 0.655448, -1.675862, 1, 1, 1, 1, 1,
-1.671496, 0.8493038, -2.272848, 1, 1, 1, 1, 1,
-1.66401, 0.6441812, -2.237131, 1, 1, 1, 1, 1,
-1.611974, -0.7917564, -2.17424, 1, 1, 1, 1, 1,
-1.610206, 0.7027666, -2.582533, 1, 1, 1, 1, 1,
-1.600425, -1.322408, -2.749558, 1, 1, 1, 1, 1,
-1.597749, 0.1223344, -0.960582, 1, 1, 1, 1, 1,
-1.595509, 1.128324, -3.07423, 1, 1, 1, 1, 1,
-1.583457, -0.7074096, -0.2130528, 1, 1, 1, 1, 1,
-1.5828, -1.180485, -1.432094, 1, 1, 1, 1, 1,
-1.578197, 0.7795388, 0.2399544, 1, 1, 1, 1, 1,
-1.557222, 0.9390032, -0.01412706, 1, 1, 1, 1, 1,
-1.556132, -0.679518, -2.913353, 1, 1, 1, 1, 1,
-1.553089, 0.4205104, -1.68432, 0, 0, 1, 1, 1,
-1.541395, 0.999575, -1.605807, 1, 0, 0, 1, 1,
-1.532756, -0.6016811, -2.13353, 1, 0, 0, 1, 1,
-1.528409, -1.154301, -4.110945, 1, 0, 0, 1, 1,
-1.52656, 0.3723447, -1.362159, 1, 0, 0, 1, 1,
-1.525855, -1.123935, -2.903511, 1, 0, 0, 1, 1,
-1.518739, 1.520176, -0.9357802, 0, 0, 0, 1, 1,
-1.515062, -0.1467991, -2.388047, 0, 0, 0, 1, 1,
-1.505871, 0.1886363, -4.070741, 0, 0, 0, 1, 1,
-1.502187, 0.8372831, -2.130595, 0, 0, 0, 1, 1,
-1.495811, 0.6235576, -0.185421, 0, 0, 0, 1, 1,
-1.483783, 0.6483304, -2.853375, 0, 0, 0, 1, 1,
-1.47054, -1.007891, -2.807151, 0, 0, 0, 1, 1,
-1.470123, 0.1771082, 0.5011357, 1, 1, 1, 1, 1,
-1.469543, 0.9761931, -0.2532061, 1, 1, 1, 1, 1,
-1.465659, 0.7395851, -2.661668, 1, 1, 1, 1, 1,
-1.439996, -0.2737951, -0.5092425, 1, 1, 1, 1, 1,
-1.439156, 0.7736579, -1.04407, 1, 1, 1, 1, 1,
-1.438962, -0.2534225, -3.091463, 1, 1, 1, 1, 1,
-1.434405, -2.719339, -2.815028, 1, 1, 1, 1, 1,
-1.432623, 1.173738, -1.184559, 1, 1, 1, 1, 1,
-1.422072, 0.8160032, 0.001167713, 1, 1, 1, 1, 1,
-1.421143, -0.02816302, -1.308661, 1, 1, 1, 1, 1,
-1.42063, -1.109119, -2.363832, 1, 1, 1, 1, 1,
-1.407571, 1.999665, -1.074879, 1, 1, 1, 1, 1,
-1.406663, 0.05830285, -1.645497, 1, 1, 1, 1, 1,
-1.39245, -0.2556387, -0.6071705, 1, 1, 1, 1, 1,
-1.375773, -1.556112, -4.5551, 1, 1, 1, 1, 1,
-1.3742, -0.5909612, -2.208887, 0, 0, 1, 1, 1,
-1.360736, 0.7319239, -0.8512776, 1, 0, 0, 1, 1,
-1.360594, -0.5281145, -1.476345, 1, 0, 0, 1, 1,
-1.357014, 0.5487852, -1.240257, 1, 0, 0, 1, 1,
-1.356907, -1.023181, -1.634356, 1, 0, 0, 1, 1,
-1.355227, 1.900211, -0.5159968, 1, 0, 0, 1, 1,
-1.349461, -0.5236729, -3.865101, 0, 0, 0, 1, 1,
-1.33994, -0.3728859, -1.815062, 0, 0, 0, 1, 1,
-1.334327, 1.767858, -2.559705, 0, 0, 0, 1, 1,
-1.328942, -0.1109152, -1.592494, 0, 0, 0, 1, 1,
-1.327534, 0.7755932, -0.1627736, 0, 0, 0, 1, 1,
-1.319347, 0.6530347, 0.11238, 0, 0, 0, 1, 1,
-1.305995, -0.03328707, -1.368999, 0, 0, 0, 1, 1,
-1.303276, -1.046188, -0.9419364, 1, 1, 1, 1, 1,
-1.298729, 1.059458, -2.071866, 1, 1, 1, 1, 1,
-1.296304, 0.1625913, -0.6382546, 1, 1, 1, 1, 1,
-1.295748, -0.6615191, -2.005353, 1, 1, 1, 1, 1,
-1.29563, -1.083209, -2.537002, 1, 1, 1, 1, 1,
-1.283621, 0.1746447, 0.4581719, 1, 1, 1, 1, 1,
-1.263258, 0.2887797, 0.313788, 1, 1, 1, 1, 1,
-1.261856, -0.04448784, -0.7511255, 1, 1, 1, 1, 1,
-1.257527, -1.089615, -3.679804, 1, 1, 1, 1, 1,
-1.254336, 0.1620229, -1.192805, 1, 1, 1, 1, 1,
-1.248814, -0.914104, -4.951202, 1, 1, 1, 1, 1,
-1.244721, 0.70306, 0.01416042, 1, 1, 1, 1, 1,
-1.240005, -1.056926, -1.433378, 1, 1, 1, 1, 1,
-1.233142, 0.4522335, -1.735997, 1, 1, 1, 1, 1,
-1.229119, -0.6484208, -2.343896, 1, 1, 1, 1, 1,
-1.228912, 0.780892, -1.347325, 0, 0, 1, 1, 1,
-1.228761, 2.207323, -0.5569078, 1, 0, 0, 1, 1,
-1.225581, -0.8019313, -0.7825363, 1, 0, 0, 1, 1,
-1.225255, 0.09487019, 0.05057405, 1, 0, 0, 1, 1,
-1.224607, -0.1951802, -2.540646, 1, 0, 0, 1, 1,
-1.216689, -0.7425378, -1.12681, 1, 0, 0, 1, 1,
-1.212899, -0.2928335, 0.06195314, 0, 0, 0, 1, 1,
-1.201788, 0.1515659, -0.4777531, 0, 0, 0, 1, 1,
-1.200505, 0.02922493, -0.6216052, 0, 0, 0, 1, 1,
-1.200412, -0.3580393, -0.6856517, 0, 0, 0, 1, 1,
-1.196182, -1.137724, -1.859171, 0, 0, 0, 1, 1,
-1.193927, 1.249697, -1.854732, 0, 0, 0, 1, 1,
-1.189278, -0.7706561, -1.874479, 0, 0, 0, 1, 1,
-1.182865, -0.1718644, -1.882067, 1, 1, 1, 1, 1,
-1.180348, -0.8783018, -2.515821, 1, 1, 1, 1, 1,
-1.173197, 0.1117717, -1.994091, 1, 1, 1, 1, 1,
-1.172743, 0.1058236, -2.373869, 1, 1, 1, 1, 1,
-1.169202, 1.295693, -0.6575133, 1, 1, 1, 1, 1,
-1.166333, 1.556931, -0.7136047, 1, 1, 1, 1, 1,
-1.156131, 0.2269937, -2.933093, 1, 1, 1, 1, 1,
-1.139332, 0.1114848, -2.154595, 1, 1, 1, 1, 1,
-1.139195, -0.7245156, -3.693363, 1, 1, 1, 1, 1,
-1.137823, 1.250172, -0.5403342, 1, 1, 1, 1, 1,
-1.137365, -1.157173, -1.121952, 1, 1, 1, 1, 1,
-1.136133, 0.426967, -0.4644039, 1, 1, 1, 1, 1,
-1.128352, 1.579495, -0.529587, 1, 1, 1, 1, 1,
-1.125578, -1.545878, -1.695954, 1, 1, 1, 1, 1,
-1.124487, -0.2275985, -4.141817, 1, 1, 1, 1, 1,
-1.115841, 1.759645, -2.105865, 0, 0, 1, 1, 1,
-1.109501, 0.1448667, -1.675511, 1, 0, 0, 1, 1,
-1.105174, -0.9853068, -1.003409, 1, 0, 0, 1, 1,
-1.104547, 0.3120543, -0.1799284, 1, 0, 0, 1, 1,
-1.100942, 1.171124, -3.227434, 1, 0, 0, 1, 1,
-1.093434, 0.5795939, -0.5527139, 1, 0, 0, 1, 1,
-1.089953, 0.8943998, 0.2163272, 0, 0, 0, 1, 1,
-1.087276, 0.7420011, -0.2555721, 0, 0, 0, 1, 1,
-1.081365, -1.103706, -3.589286, 0, 0, 0, 1, 1,
-1.080051, -2.201479, -2.356432, 0, 0, 0, 1, 1,
-1.078851, 0.6737254, -1.272267, 0, 0, 0, 1, 1,
-1.077365, 0.580903, -2.163137, 0, 0, 0, 1, 1,
-1.074456, -0.8083337, -2.899653, 0, 0, 0, 1, 1,
-1.067588, -2.011632, -2.297816, 1, 1, 1, 1, 1,
-1.064934, 0.1362521, -1.335782, 1, 1, 1, 1, 1,
-1.064472, -0.05404209, -1.740959, 1, 1, 1, 1, 1,
-1.052453, 0.3425656, -2.446239, 1, 1, 1, 1, 1,
-1.047649, 0.1467071, -0.8167388, 1, 1, 1, 1, 1,
-1.043123, -1.128571, -1.386968, 1, 1, 1, 1, 1,
-1.0418, -1.145726, -2.105353, 1, 1, 1, 1, 1,
-1.041397, 0.001025176, -1.257566, 1, 1, 1, 1, 1,
-1.039917, -0.4031064, -1.119986, 1, 1, 1, 1, 1,
-1.028465, 2.499352, 0.7944638, 1, 1, 1, 1, 1,
-1.028338, 1.727353, -0.3963325, 1, 1, 1, 1, 1,
-1.007394, -1.049031, -2.100252, 1, 1, 1, 1, 1,
-1.002481, 0.9357067, 0.6184324, 1, 1, 1, 1, 1,
-0.996769, -0.5103012, -2.798652, 1, 1, 1, 1, 1,
-0.9939355, -0.8701783, -3.78714, 1, 1, 1, 1, 1,
-0.9878712, -0.05318179, -1.07582, 0, 0, 1, 1, 1,
-0.9811313, -1.237033, -4.29482, 1, 0, 0, 1, 1,
-0.9764441, 1.076115, -0.7510512, 1, 0, 0, 1, 1,
-0.9746941, -1.009261, -3.112864, 1, 0, 0, 1, 1,
-0.9731792, 1.451084, -0.05720016, 1, 0, 0, 1, 1,
-0.9685563, 0.2783893, -1.85567, 1, 0, 0, 1, 1,
-0.9664354, -0.6453463, -0.6592358, 0, 0, 0, 1, 1,
-0.96537, -0.6473118, -0.6627927, 0, 0, 0, 1, 1,
-0.9648055, 1.52004, -0.4049757, 0, 0, 0, 1, 1,
-0.9637043, 1.162652, -0.2807066, 0, 0, 0, 1, 1,
-0.9588028, 1.419054, -2.614852, 0, 0, 0, 1, 1,
-0.9537688, -0.3156956, -1.192287, 0, 0, 0, 1, 1,
-0.9534651, 1.630551, -3.182615, 0, 0, 0, 1, 1,
-0.9520673, 0.2830577, -0.6456509, 1, 1, 1, 1, 1,
-0.9495355, -0.688889, -2.250712, 1, 1, 1, 1, 1,
-0.9491682, -0.8498641, -1.634126, 1, 1, 1, 1, 1,
-0.9465182, -1.086491, -1.833937, 1, 1, 1, 1, 1,
-0.9460618, -1.128369, -2.289166, 1, 1, 1, 1, 1,
-0.9417107, -1.929326, -2.385782, 1, 1, 1, 1, 1,
-0.9389454, -0.5058216, -3.532612, 1, 1, 1, 1, 1,
-0.9385248, 0.4858956, 0.2249201, 1, 1, 1, 1, 1,
-0.9309843, -1.437982, -2.398517, 1, 1, 1, 1, 1,
-0.9309567, -0.5389346, -1.132148, 1, 1, 1, 1, 1,
-0.9250393, -0.1444122, 0.553822, 1, 1, 1, 1, 1,
-0.9231659, 0.9572718, -0.1586126, 1, 1, 1, 1, 1,
-0.9215189, -1.716046, -1.90119, 1, 1, 1, 1, 1,
-0.9197345, 0.6531503, -3.612866, 1, 1, 1, 1, 1,
-0.9189928, 1.263622, 0.002659484, 1, 1, 1, 1, 1,
-0.9083344, 0.1939448, -1.081773, 0, 0, 1, 1, 1,
-0.9051591, 1.210195, -1.536123, 1, 0, 0, 1, 1,
-0.9016706, -0.4930013, -1.924718, 1, 0, 0, 1, 1,
-0.8943226, 1.396136, -0.47288, 1, 0, 0, 1, 1,
-0.8931296, 0.4535646, -0.8308123, 1, 0, 0, 1, 1,
-0.8760065, -0.9974015, -0.5895479, 1, 0, 0, 1, 1,
-0.8745232, 0.8040867, 0.9085894, 0, 0, 0, 1, 1,
-0.8696561, -0.7181751, -1.2604, 0, 0, 0, 1, 1,
-0.864936, -0.4409909, -1.107302, 0, 0, 0, 1, 1,
-0.8619341, -1.079682, -1.604947, 0, 0, 0, 1, 1,
-0.8609889, 0.2515723, -0.8221523, 0, 0, 0, 1, 1,
-0.8594954, -2.687411, -2.157825, 0, 0, 0, 1, 1,
-0.857737, 0.8287677, -0.9111302, 0, 0, 0, 1, 1,
-0.8534133, -0.3087254, -2.450104, 1, 1, 1, 1, 1,
-0.8523568, 1.075423, 0.1900361, 1, 1, 1, 1, 1,
-0.8501528, -0.004955833, -0.8035545, 1, 1, 1, 1, 1,
-0.849488, 1.628075, -0.6812807, 1, 1, 1, 1, 1,
-0.8466569, 1.612825, -3.29395, 1, 1, 1, 1, 1,
-0.8340545, 0.6951333, -1.194241, 1, 1, 1, 1, 1,
-0.8318419, 0.5913848, -2.595573, 1, 1, 1, 1, 1,
-0.8300182, 0.7349133, -0.9551268, 1, 1, 1, 1, 1,
-0.8178785, -0.03465231, -1.58896, 1, 1, 1, 1, 1,
-0.8143754, -0.5991989, -1.592642, 1, 1, 1, 1, 1,
-0.8083606, 1.475331, -0.9978089, 1, 1, 1, 1, 1,
-0.7928303, -1.027808, -0.8956995, 1, 1, 1, 1, 1,
-0.7879021, 1.324749, -1.740733, 1, 1, 1, 1, 1,
-0.7874917, 0.342725, -2.658232, 1, 1, 1, 1, 1,
-0.7842908, 0.8902671, -2.43193, 1, 1, 1, 1, 1,
-0.7812222, 1.021178, -0.611272, 0, 0, 1, 1, 1,
-0.771884, -1.241539, -1.765638, 1, 0, 0, 1, 1,
-0.7694944, 0.250929, -1.91095, 1, 0, 0, 1, 1,
-0.7642693, -0.5796539, -1.865836, 1, 0, 0, 1, 1,
-0.7635475, 1.160311, -0.8153166, 1, 0, 0, 1, 1,
-0.7629356, -0.2943301, -1.967741, 1, 0, 0, 1, 1,
-0.7553146, 0.2619756, -1.408853, 0, 0, 0, 1, 1,
-0.7538615, -1.590517, -2.167764, 0, 0, 0, 1, 1,
-0.7520401, -1.115092, -2.517123, 0, 0, 0, 1, 1,
-0.7488255, 0.820661, -0.9723918, 0, 0, 0, 1, 1,
-0.7319748, 0.4749102, -1.989815, 0, 0, 0, 1, 1,
-0.7222247, 0.6026781, -0.7847982, 0, 0, 0, 1, 1,
-0.718464, -0.9537068, -2.878204, 0, 0, 0, 1, 1,
-0.7177567, 0.1840674, -3.06184, 1, 1, 1, 1, 1,
-0.7173783, -2.311552, -3.030408, 1, 1, 1, 1, 1,
-0.7128022, 2.684543, 0.1727168, 1, 1, 1, 1, 1,
-0.7118252, -1.525041, -2.242884, 1, 1, 1, 1, 1,
-0.7097149, -0.4715651, -2.496241, 1, 1, 1, 1, 1,
-0.7059845, -0.5380846, -1.595335, 1, 1, 1, 1, 1,
-0.7053345, 0.8595935, -0.02993747, 1, 1, 1, 1, 1,
-0.7041987, -0.6424066, -1.21777, 1, 1, 1, 1, 1,
-0.7010473, 1.321719, -1.079699, 1, 1, 1, 1, 1,
-0.6965751, -1.634829, -2.290304, 1, 1, 1, 1, 1,
-0.6937795, -0.5750459, -2.117882, 1, 1, 1, 1, 1,
-0.6932412, 0.6386883, -3.269486, 1, 1, 1, 1, 1,
-0.689009, 0.1984198, -0.4051702, 1, 1, 1, 1, 1,
-0.6852176, -0.8158197, -3.210479, 1, 1, 1, 1, 1,
-0.6845152, 0.575495, -0.202849, 1, 1, 1, 1, 1,
-0.6795415, 1.540516, -0.3184775, 0, 0, 1, 1, 1,
-0.6786862, -0.7349753, -3.373598, 1, 0, 0, 1, 1,
-0.6775088, -0.9405701, -2.257366, 1, 0, 0, 1, 1,
-0.6772978, 0.3816173, -1.247042, 1, 0, 0, 1, 1,
-0.670026, 0.798934, -0.89193, 1, 0, 0, 1, 1,
-0.6667575, -0.403465, -1.150271, 1, 0, 0, 1, 1,
-0.6665381, 0.4372433, -1.972329, 0, 0, 0, 1, 1,
-0.6662991, -0.3710897, -2.998035, 0, 0, 0, 1, 1,
-0.6660404, 0.4181837, 0.06781191, 0, 0, 0, 1, 1,
-0.6655048, 0.2426452, -0.7553978, 0, 0, 0, 1, 1,
-0.6648991, -0.8706421, -0.5582106, 0, 0, 0, 1, 1,
-0.663117, 0.2889341, -2.315551, 0, 0, 0, 1, 1,
-0.6569131, 0.6672996, 2.007411, 0, 0, 0, 1, 1,
-0.6536826, -0.6173669, -4.038667, 1, 1, 1, 1, 1,
-0.6514666, -1.192252, -1.02825, 1, 1, 1, 1, 1,
-0.6511763, 2.180263, 0.7361676, 1, 1, 1, 1, 1,
-0.6486433, 1.60356, -2.085324, 1, 1, 1, 1, 1,
-0.6472002, -1.350144, -2.762083, 1, 1, 1, 1, 1,
-0.64385, -0.2855452, -2.02539, 1, 1, 1, 1, 1,
-0.6403154, -0.9964521, -1.350865, 1, 1, 1, 1, 1,
-0.6368891, 0.7856407, 0.9130886, 1, 1, 1, 1, 1,
-0.6296328, 1.464176, 0.1335855, 1, 1, 1, 1, 1,
-0.6283416, -1.283286, -1.203291, 1, 1, 1, 1, 1,
-0.6255137, -0.08803093, -3.512893, 1, 1, 1, 1, 1,
-0.6241974, 0.8011039, -3.074964, 1, 1, 1, 1, 1,
-0.620445, 0.6423485, -0.9216898, 1, 1, 1, 1, 1,
-0.6180369, 0.127996, -2.08467, 1, 1, 1, 1, 1,
-0.6177736, -1.485127, -2.788639, 1, 1, 1, 1, 1,
-0.6140234, -0.7967738, -2.787894, 0, 0, 1, 1, 1,
-0.6138777, -1.90615, -2.442605, 1, 0, 0, 1, 1,
-0.6137166, -1.015395, -4.258798, 1, 0, 0, 1, 1,
-0.611878, 1.197608, -1.511381, 1, 0, 0, 1, 1,
-0.6088495, -0.3891453, -2.576062, 1, 0, 0, 1, 1,
-0.6067052, -1.385863, -2.420496, 1, 0, 0, 1, 1,
-0.6052191, 1.306588, -1.137565, 0, 0, 0, 1, 1,
-0.6044171, 0.5948131, -0.6597226, 0, 0, 0, 1, 1,
-0.6024365, -0.398535, -2.702821, 0, 0, 0, 1, 1,
-0.5984035, 0.926074, -0.2694916, 0, 0, 0, 1, 1,
-0.5965598, -0.8502045, -1.776961, 0, 0, 0, 1, 1,
-0.5944024, -0.0787319, -0.9367834, 0, 0, 0, 1, 1,
-0.5930863, 0.381129, 0.09622377, 0, 0, 0, 1, 1,
-0.5929233, 1.015685, -2.131903, 1, 1, 1, 1, 1,
-0.5922496, -0.1087423, -1.40237, 1, 1, 1, 1, 1,
-0.5919624, -2.297039, -2.89532, 1, 1, 1, 1, 1,
-0.5880856, -1.251417, -3.076628, 1, 1, 1, 1, 1,
-0.5833294, -0.1868448, -3.841822, 1, 1, 1, 1, 1,
-0.581061, 0.07506178, -0.9281033, 1, 1, 1, 1, 1,
-0.5789526, 0.4733218, -0.6592488, 1, 1, 1, 1, 1,
-0.5785753, -0.02175414, -1.209261, 1, 1, 1, 1, 1,
-0.5773658, 1.211244, -1.289077, 1, 1, 1, 1, 1,
-0.5772744, -0.01457444, -1.136747, 1, 1, 1, 1, 1,
-0.5762557, -0.5367337, -0.7055413, 1, 1, 1, 1, 1,
-0.5760547, -1.275151, -1.637348, 1, 1, 1, 1, 1,
-0.5742157, 1.921562, -2.170535, 1, 1, 1, 1, 1,
-0.5683655, -1.217282, -1.299903, 1, 1, 1, 1, 1,
-0.5639334, -0.1807168, -2.036176, 1, 1, 1, 1, 1,
-0.5622492, -0.7762892, -2.107152, 0, 0, 1, 1, 1,
-0.5593014, 0.1724309, -1.673034, 1, 0, 0, 1, 1,
-0.5588006, -2.137786, -0.9878438, 1, 0, 0, 1, 1,
-0.5527554, 0.1795308, -1.057023, 1, 0, 0, 1, 1,
-0.550685, -0.5218367, -1.080311, 1, 0, 0, 1, 1,
-0.5471074, 0.8239265, -0.9352269, 1, 0, 0, 1, 1,
-0.5459074, 0.7093053, -2.242829, 0, 0, 0, 1, 1,
-0.5456912, 0.1747919, -1.493688, 0, 0, 0, 1, 1,
-0.5431184, 0.5274046, 0.2825679, 0, 0, 0, 1, 1,
-0.5412272, 0.1699329, -2.689795, 0, 0, 0, 1, 1,
-0.5363891, 1.228862, -0.6074561, 0, 0, 0, 1, 1,
-0.5298368, 0.2580734, -0.2455069, 0, 0, 0, 1, 1,
-0.528028, 0.8608821, -0.02346165, 0, 0, 0, 1, 1,
-0.5271542, -0.1824223, -1.972214, 1, 1, 1, 1, 1,
-0.5263222, 0.6074755, 0.7347548, 1, 1, 1, 1, 1,
-0.5236607, -0.2551118, -3.796786, 1, 1, 1, 1, 1,
-0.5231256, -2.033644, -3.304007, 1, 1, 1, 1, 1,
-0.5203207, 0.3674781, -1.437254, 1, 1, 1, 1, 1,
-0.5193189, 1.131604, 0.3465161, 1, 1, 1, 1, 1,
-0.5188078, 0.86778, -0.3474136, 1, 1, 1, 1, 1,
-0.5179131, 1.714123, -0.4835651, 1, 1, 1, 1, 1,
-0.5161581, 0.4744936, -2.468903, 1, 1, 1, 1, 1,
-0.5149811, 0.05887934, -1.947496, 1, 1, 1, 1, 1,
-0.5122084, 2.012438, -0.0574584, 1, 1, 1, 1, 1,
-0.5120866, -0.5856634, -0.9954255, 1, 1, 1, 1, 1,
-0.5107748, 0.4330376, 0.8013239, 1, 1, 1, 1, 1,
-0.5101783, 0.2440085, -1.426097, 1, 1, 1, 1, 1,
-0.50962, 1.289223, -0.423042, 1, 1, 1, 1, 1,
-0.5090256, 0.1900292, -1.44272, 0, 0, 1, 1, 1,
-0.5058621, -0.4515275, -1.467481, 1, 0, 0, 1, 1,
-0.5022835, -1.557254, -3.925538, 1, 0, 0, 1, 1,
-0.4994674, -0.3926342, -2.080931, 1, 0, 0, 1, 1,
-0.4988779, -0.9009882, -1.946325, 1, 0, 0, 1, 1,
-0.4988034, -0.5850371, -3.269458, 1, 0, 0, 1, 1,
-0.4949657, -1.099096, -2.176471, 0, 0, 0, 1, 1,
-0.4768848, -0.116069, -1.802323, 0, 0, 0, 1, 1,
-0.4759796, -1.175187, -3.770054, 0, 0, 0, 1, 1,
-0.4692184, -0.2758436, -1.733699, 0, 0, 0, 1, 1,
-0.468309, -0.3280302, -2.441302, 0, 0, 0, 1, 1,
-0.4669766, -2.31033, -1.59442, 0, 0, 0, 1, 1,
-0.4628041, -0.3354281, -1.270595, 0, 0, 0, 1, 1,
-0.4619413, 0.458332, -2.724121, 1, 1, 1, 1, 1,
-0.4599065, 0.767619, -0.3159137, 1, 1, 1, 1, 1,
-0.4503888, -2.202211, -3.125794, 1, 1, 1, 1, 1,
-0.4479601, 0.2114729, -1.67374, 1, 1, 1, 1, 1,
-0.4462747, -0.367851, -1.469828, 1, 1, 1, 1, 1,
-0.4455599, 0.7542828, 1.274908, 1, 1, 1, 1, 1,
-0.4455096, 0.141732, -1.01264, 1, 1, 1, 1, 1,
-0.44292, 1.069942, 0.1100509, 1, 1, 1, 1, 1,
-0.4390707, -0.5531984, -2.468472, 1, 1, 1, 1, 1,
-0.4349777, -0.2763142, -2.690828, 1, 1, 1, 1, 1,
-0.4332259, -0.7554857, -3.549126, 1, 1, 1, 1, 1,
-0.431708, 0.9049244, -1.777201, 1, 1, 1, 1, 1,
-0.4278741, -1.020048, -3.497575, 1, 1, 1, 1, 1,
-0.4260257, 0.459857, 0.2086313, 1, 1, 1, 1, 1,
-0.4254626, -0.2895695, -1.628183, 1, 1, 1, 1, 1,
-0.4229868, 1.80828, -0.11176, 0, 0, 1, 1, 1,
-0.4176939, 0.9561675, -1.613008, 1, 0, 0, 1, 1,
-0.4168459, -0.6848508, -1.877423, 1, 0, 0, 1, 1,
-0.4135604, 1.577727, -0.5679339, 1, 0, 0, 1, 1,
-0.4123401, -0.9903393, -3.397173, 1, 0, 0, 1, 1,
-0.4119674, -0.07212878, 0.6549565, 1, 0, 0, 1, 1,
-0.4118785, 0.4789454, -1.205912, 0, 0, 0, 1, 1,
-0.4089797, 0.2984505, 0.2698444, 0, 0, 0, 1, 1,
-0.3988037, 0.3740948, -0.3838983, 0, 0, 0, 1, 1,
-0.3973017, -0.200526, -3.488006, 0, 0, 0, 1, 1,
-0.3927912, 0.1119789, -1.531421, 0, 0, 0, 1, 1,
-0.3863549, 3.182844, 1.178391, 0, 0, 0, 1, 1,
-0.3807517, 0.2863482, -0.5337027, 0, 0, 0, 1, 1,
-0.378859, 0.0159628, -2.140782, 1, 1, 1, 1, 1,
-0.3762233, -0.841777, -1.519561, 1, 1, 1, 1, 1,
-0.374441, 1.718628, -0.7050937, 1, 1, 1, 1, 1,
-0.3699794, 1.34282, 1.088818, 1, 1, 1, 1, 1,
-0.3668976, 1.396729, 1.2636, 1, 1, 1, 1, 1,
-0.3578838, 1.016596, 0.747601, 1, 1, 1, 1, 1,
-0.3576696, 0.7285398, -0.1627272, 1, 1, 1, 1, 1,
-0.3546842, -2.281195, -3.870666, 1, 1, 1, 1, 1,
-0.3530521, 0.1722081, 0.1629517, 1, 1, 1, 1, 1,
-0.3485082, 0.5084812, -0.740212, 1, 1, 1, 1, 1,
-0.3460517, 1.383765, -0.05272529, 1, 1, 1, 1, 1,
-0.3427939, 1.020406, 0.185113, 1, 1, 1, 1, 1,
-0.3414921, 0.1534145, -2.252151, 1, 1, 1, 1, 1,
-0.3408226, -0.8750352, -2.898172, 1, 1, 1, 1, 1,
-0.3401744, 1.265917, 0.4145434, 1, 1, 1, 1, 1,
-0.339202, -0.2800053, -2.462513, 0, 0, 1, 1, 1,
-0.3384847, -0.6323668, -0.894318, 1, 0, 0, 1, 1,
-0.3350496, -0.5484926, -2.43731, 1, 0, 0, 1, 1,
-0.3349661, -0.5136944, -2.480753, 1, 0, 0, 1, 1,
-0.3302878, 1.182568, 0.1114629, 1, 0, 0, 1, 1,
-0.325417, -0.7609584, -4.277891, 1, 0, 0, 1, 1,
-0.3233903, 0.8973056, -0.1260866, 0, 0, 0, 1, 1,
-0.3224607, 0.4391418, -1.32114, 0, 0, 0, 1, 1,
-0.3154514, -0.02676591, -0.5076296, 0, 0, 0, 1, 1,
-0.3093238, 2.63749, -0.2337341, 0, 0, 0, 1, 1,
-0.3064038, -0.7016326, -1.915725, 0, 0, 0, 1, 1,
-0.3038905, -0.9776515, -3.391851, 0, 0, 0, 1, 1,
-0.2994365, 1.970564, 0.4730341, 0, 0, 0, 1, 1,
-0.2963517, 1.555307, -1.431809, 1, 1, 1, 1, 1,
-0.2963345, 0.1503361, -0.3409844, 1, 1, 1, 1, 1,
-0.2932259, -1.269014, -2.403317, 1, 1, 1, 1, 1,
-0.2868524, 1.068144, 1.090322, 1, 1, 1, 1, 1,
-0.2861148, -2.024101, -3.233803, 1, 1, 1, 1, 1,
-0.283609, -1.144663, -4.208573, 1, 1, 1, 1, 1,
-0.2790643, -0.09816389, 0.06264488, 1, 1, 1, 1, 1,
-0.2789521, -1.438575, -4.245063, 1, 1, 1, 1, 1,
-0.2746431, 0.9878355, -0.7910579, 1, 1, 1, 1, 1,
-0.2666589, -0.636637, -3.406797, 1, 1, 1, 1, 1,
-0.2642796, -1.291669, -3.281133, 1, 1, 1, 1, 1,
-0.2641534, 0.2632715, -0.6443475, 1, 1, 1, 1, 1,
-0.2626097, 0.6939325, -0.5386159, 1, 1, 1, 1, 1,
-0.2611942, 1.760725, 1.026372, 1, 1, 1, 1, 1,
-0.2587525, 0.5686119, -0.986963, 1, 1, 1, 1, 1,
-0.256599, 0.6178288, -0.9248403, 0, 0, 1, 1, 1,
-0.2541638, 0.4487844, 0.4155886, 1, 0, 0, 1, 1,
-0.2520084, 0.9433675, 0.1607796, 1, 0, 0, 1, 1,
-0.2456296, -2.163522, -2.645198, 1, 0, 0, 1, 1,
-0.2444072, 0.8574439, 0.4346478, 1, 0, 0, 1, 1,
-0.235963, -0.02425828, 0.5028968, 1, 0, 0, 1, 1,
-0.2352621, 1.062373, -0.2640557, 0, 0, 0, 1, 1,
-0.2348548, -0.7142307, -2.255017, 0, 0, 0, 1, 1,
-0.2344489, -0.6783387, -3.038747, 0, 0, 0, 1, 1,
-0.2304883, -2.663959, -3.085586, 0, 0, 0, 1, 1,
-0.2278257, -0.8501124, -2.961402, 0, 0, 0, 1, 1,
-0.22695, 1.02567, -0.7584285, 0, 0, 0, 1, 1,
-0.2267823, 0.6466169, -0.9995086, 0, 0, 0, 1, 1,
-0.2257066, 0.1930671, -1.915995, 1, 1, 1, 1, 1,
-0.2210945, -0.009959741, -2.990247, 1, 1, 1, 1, 1,
-0.2166524, 0.03880673, -0.9507726, 1, 1, 1, 1, 1,
-0.2106137, -1.290327, -2.553436, 1, 1, 1, 1, 1,
-0.2089077, 1.557356, 0.719735, 1, 1, 1, 1, 1,
-0.207632, 0.2823082, 0.8165937, 1, 1, 1, 1, 1,
-0.2073161, -0.02453366, -3.322111, 1, 1, 1, 1, 1,
-0.2013879, -0.759506, -1.647395, 1, 1, 1, 1, 1,
-0.197928, -1.181792, -4.184952, 1, 1, 1, 1, 1,
-0.1816181, -1.642167, -2.898107, 1, 1, 1, 1, 1,
-0.1808218, -1.014146, -6.127412, 1, 1, 1, 1, 1,
-0.1794411, -0.3318349, -3.961972, 1, 1, 1, 1, 1,
-0.1734793, -0.1038876, -2.537621, 1, 1, 1, 1, 1,
-0.1727507, 0.14494, -0.9165351, 1, 1, 1, 1, 1,
-0.1615543, 1.068388, 1.586056, 1, 1, 1, 1, 1,
-0.1588303, -0.7801626, -3.559847, 0, 0, 1, 1, 1,
-0.1530566, 0.8949032, 0.9501702, 1, 0, 0, 1, 1,
-0.1477524, 0.3616949, -0.3471029, 1, 0, 0, 1, 1,
-0.1469035, 0.5846524, -1.850477, 1, 0, 0, 1, 1,
-0.1435632, -0.6981868, -1.958582, 1, 0, 0, 1, 1,
-0.143294, 1.063669, -0.8045462, 1, 0, 0, 1, 1,
-0.1371599, 1.438828, 0.03492814, 0, 0, 0, 1, 1,
-0.1370993, -0.2048032, -2.91472, 0, 0, 0, 1, 1,
-0.1360866, -2.480358, -3.387691, 0, 0, 0, 1, 1,
-0.1330209, 2.541527, 0.697699, 0, 0, 0, 1, 1,
-0.1327529, -1.956469, -3.166547, 0, 0, 0, 1, 1,
-0.1307454, -0.004229116, -2.314803, 0, 0, 0, 1, 1,
-0.1270924, 1.28299, 1.182605, 0, 0, 0, 1, 1,
-0.1262305, -1.752692, -3.839476, 1, 1, 1, 1, 1,
-0.1242446, 0.8190057, 0.117756, 1, 1, 1, 1, 1,
-0.1137826, -0.07954511, -0.6648352, 1, 1, 1, 1, 1,
-0.110612, 0.9284992, 0.1729042, 1, 1, 1, 1, 1,
-0.108031, -0.04188462, -2.548738, 1, 1, 1, 1, 1,
-0.107321, -0.4317938, -3.897666, 1, 1, 1, 1, 1,
-0.1051599, 1.684524, -0.5606705, 1, 1, 1, 1, 1,
-0.1026348, -0.1248208, -2.352229, 1, 1, 1, 1, 1,
-0.09811825, -0.08206776, -2.037271, 1, 1, 1, 1, 1,
-0.0952831, -1.263509, -1.665738, 1, 1, 1, 1, 1,
-0.0917306, -0.01652954, -2.303072, 1, 1, 1, 1, 1,
-0.08274291, 0.1523168, -2.776875, 1, 1, 1, 1, 1,
-0.07971843, -1.351072, -3.673635, 1, 1, 1, 1, 1,
-0.07718343, -0.2087436, -2.899895, 1, 1, 1, 1, 1,
-0.07572303, 0.4733141, -0.6629632, 1, 1, 1, 1, 1,
-0.07303035, 0.5933611, -0.7092086, 0, 0, 1, 1, 1,
-0.07290165, -0.5773751, -2.303298, 1, 0, 0, 1, 1,
-0.07245869, -0.3692563, -3.088432, 1, 0, 0, 1, 1,
-0.07081492, 0.3135902, -0.5482929, 1, 0, 0, 1, 1,
-0.06663176, 0.8086496, 1.351192, 1, 0, 0, 1, 1,
-0.06657017, 0.4008183, 0.3884249, 1, 0, 0, 1, 1,
-0.06383594, -0.8916196, -3.460531, 0, 0, 0, 1, 1,
-0.06383474, -0.0650386, -2.918095, 0, 0, 0, 1, 1,
-0.06020945, 0.4528097, -0.8388898, 0, 0, 0, 1, 1,
-0.05737357, -0.08255289, -2.849561, 0, 0, 0, 1, 1,
-0.05488177, -0.5406792, -4.176673, 0, 0, 0, 1, 1,
-0.05188327, -0.2471063, -3.536092, 0, 0, 0, 1, 1,
-0.04657941, 0.363411, -1.480929, 0, 0, 0, 1, 1,
-0.0451245, -1.427555, -4.56607, 1, 1, 1, 1, 1,
-0.04436981, 0.5565131, 1.110018, 1, 1, 1, 1, 1,
-0.04329877, -1.79874, -4.816957, 1, 1, 1, 1, 1,
-0.04196334, -1.08493, -4.079623, 1, 1, 1, 1, 1,
-0.04027975, 0.07820746, -0.2220923, 1, 1, 1, 1, 1,
-0.03611399, 0.2605505, -0.4008583, 1, 1, 1, 1, 1,
-0.03111513, 0.6789684, 0.326997, 1, 1, 1, 1, 1,
-0.02850832, 0.1470984, -0.8858998, 1, 1, 1, 1, 1,
-0.02801058, -2.552032, -2.865292, 1, 1, 1, 1, 1,
-0.0266502, -1.604192, -2.813835, 1, 1, 1, 1, 1,
-0.02576542, 0.6264714, -0.4786088, 1, 1, 1, 1, 1,
-0.02448897, 0.2309741, -1.443304, 1, 1, 1, 1, 1,
-0.02243362, 1.776659, 0.4932372, 1, 1, 1, 1, 1,
-0.02180048, 0.1405513, 0.7994121, 1, 1, 1, 1, 1,
-0.01271515, 0.6951845, -1.983925, 1, 1, 1, 1, 1,
-0.01217598, 0.8302482, -0.3071056, 0, 0, 1, 1, 1,
-0.01046741, 0.5910025, -0.2124343, 1, 0, 0, 1, 1,
-0.007665241, -0.4635755, -1.192535, 1, 0, 0, 1, 1,
-0.00631033, 0.9236506, 0.2546843, 1, 0, 0, 1, 1,
-0.002994015, 0.1956427, -1.332003, 1, 0, 0, 1, 1,
-0.001448064, -1.423137, -3.401109, 1, 0, 0, 1, 1,
0.002686297, 0.1517837, 1.401465, 0, 0, 0, 1, 1,
0.003072075, 2.350973, 1.815411, 0, 0, 0, 1, 1,
0.005164201, -0.5416475, 4.140022, 0, 0, 0, 1, 1,
0.009926149, 0.1903394, 1.564269, 0, 0, 0, 1, 1,
0.01003616, 0.3410774, -0.0577113, 0, 0, 0, 1, 1,
0.01254154, -0.105563, 5.007946, 0, 0, 0, 1, 1,
0.01282844, 0.9610543, -1.059458, 0, 0, 0, 1, 1,
0.01393211, 0.4191167, -0.2339928, 1, 1, 1, 1, 1,
0.01678339, 0.4093001, 1.985995, 1, 1, 1, 1, 1,
0.0197903, 0.4344796, -0.5532384, 1, 1, 1, 1, 1,
0.02225725, 1.738242, -0.7346724, 1, 1, 1, 1, 1,
0.02374559, -0.21406, 3.416933, 1, 1, 1, 1, 1,
0.02547278, -1.12935, 1.456823, 1, 1, 1, 1, 1,
0.02692472, 1.167317, 1.055562, 1, 1, 1, 1, 1,
0.02823276, -0.2882405, 2.814214, 1, 1, 1, 1, 1,
0.02938451, 0.3561464, -0.1901959, 1, 1, 1, 1, 1,
0.03049998, 0.2533057, 0.1823406, 1, 1, 1, 1, 1,
0.03179372, 1.262451, 0.6146908, 1, 1, 1, 1, 1,
0.03306353, -2.076774, 0.9849124, 1, 1, 1, 1, 1,
0.04084865, -1.524974, 2.858243, 1, 1, 1, 1, 1,
0.04095467, -1.846746, 3.701655, 1, 1, 1, 1, 1,
0.0464117, 0.5901037, 0.3168937, 1, 1, 1, 1, 1,
0.04842732, 0.4788833, 0.8408667, 0, 0, 1, 1, 1,
0.04939717, -0.1326855, 3.597225, 1, 0, 0, 1, 1,
0.05032954, -0.04618077, 2.878565, 1, 0, 0, 1, 1,
0.05117178, 0.1049914, -1.783896, 1, 0, 0, 1, 1,
0.05135442, -0.9630921, 3.409163, 1, 0, 0, 1, 1,
0.05236134, -0.4443103, 3.032649, 1, 0, 0, 1, 1,
0.05560263, 0.009403074, 2.096101, 0, 0, 0, 1, 1,
0.05908335, 0.4774354, 0.7131104, 0, 0, 0, 1, 1,
0.059917, 0.1149696, 0.4677842, 0, 0, 0, 1, 1,
0.06048734, 1.230865, 0.1142484, 0, 0, 0, 1, 1,
0.06368426, 0.2552088, -1.189773, 0, 0, 0, 1, 1,
0.06391287, 0.05159119, 0.8404818, 0, 0, 0, 1, 1,
0.06412892, 2.020859, -0.4959645, 0, 0, 0, 1, 1,
0.06449869, 0.2793808, -0.1952855, 1, 1, 1, 1, 1,
0.06797954, -1.293084, 3.604362, 1, 1, 1, 1, 1,
0.06852783, -1.857806, 3.058512, 1, 1, 1, 1, 1,
0.07560248, -0.9627597, 4.16423, 1, 1, 1, 1, 1,
0.07863151, -0.3302181, 2.305057, 1, 1, 1, 1, 1,
0.07881592, -1.013609, 2.518533, 1, 1, 1, 1, 1,
0.07891381, 0.3401543, -1.082421, 1, 1, 1, 1, 1,
0.08110523, 0.2201732, 0.3659678, 1, 1, 1, 1, 1,
0.08574236, -1.314561, 4.146998, 1, 1, 1, 1, 1,
0.0884288, 1.045638, -0.3619722, 1, 1, 1, 1, 1,
0.08860862, 0.5463298, 1.145696, 1, 1, 1, 1, 1,
0.08967587, 0.8818913, -1.415144, 1, 1, 1, 1, 1,
0.09351483, -0.9989222, 3.571392, 1, 1, 1, 1, 1,
0.09660051, -0.3899771, 2.399537, 1, 1, 1, 1, 1,
0.09660091, -0.9343097, 2.403821, 1, 1, 1, 1, 1,
0.09871305, 2.467087, 0.8062117, 0, 0, 1, 1, 1,
0.09989004, 0.07283784, 1.855415, 1, 0, 0, 1, 1,
0.1003719, 2.914599, 0.01001021, 1, 0, 0, 1, 1,
0.1031955, -0.5050893, 2.806012, 1, 0, 0, 1, 1,
0.1049078, -1.495249, 4.490933, 1, 0, 0, 1, 1,
0.1073396, -1.674905, 4.288238, 1, 0, 0, 1, 1,
0.1086967, 1.547012, 0.9047229, 0, 0, 0, 1, 1,
0.1088636, 2.120875, 0.5260543, 0, 0, 0, 1, 1,
0.109706, 1.818869, 1.388709, 0, 0, 0, 1, 1,
0.1144283, 0.8005006, -0.7394147, 0, 0, 0, 1, 1,
0.121027, 0.6571621, -1.771107, 0, 0, 0, 1, 1,
0.1212758, 0.2321936, 0.9729244, 0, 0, 0, 1, 1,
0.1260113, -1.203251, 4.813256, 0, 0, 0, 1, 1,
0.1263784, -0.2712038, 1.427392, 1, 1, 1, 1, 1,
0.1274786, 1.705116, -1.702673, 1, 1, 1, 1, 1,
0.1294296, -0.9298821, 3.509255, 1, 1, 1, 1, 1,
0.1353313, -1.093881, 0.7800016, 1, 1, 1, 1, 1,
0.1378625, -0.9345988, 1.350842, 1, 1, 1, 1, 1,
0.1456754, 0.6916372, 0.6467522, 1, 1, 1, 1, 1,
0.1479558, -0.4363094, 2.464382, 1, 1, 1, 1, 1,
0.1498967, 0.2882931, -2.507933, 1, 1, 1, 1, 1,
0.1510345, -0.08923673, 1.156995, 1, 1, 1, 1, 1,
0.151893, 0.597386, -1.688304, 1, 1, 1, 1, 1,
0.1525992, -0.9942964, 3.13871, 1, 1, 1, 1, 1,
0.1558376, 0.584636, 0.9391599, 1, 1, 1, 1, 1,
0.162216, 0.5168359, 1.638172, 1, 1, 1, 1, 1,
0.1657866, 0.1011189, -0.1244361, 1, 1, 1, 1, 1,
0.1658425, 0.4214605, 0.6645938, 1, 1, 1, 1, 1,
0.1688864, 0.7637727, 0.6202357, 0, 0, 1, 1, 1,
0.1699436, 0.1458957, -0.9330202, 1, 0, 0, 1, 1,
0.1711255, 0.9939069, 0.5335152, 1, 0, 0, 1, 1,
0.1758263, 0.6227451, 0.05805807, 1, 0, 0, 1, 1,
0.1762067, 1.579819, 0.1722486, 1, 0, 0, 1, 1,
0.1779585, -0.4600634, 3.480066, 1, 0, 0, 1, 1,
0.1789847, 0.3699597, -0.2972999, 0, 0, 0, 1, 1,
0.1804175, 0.9349983, -0.1606641, 0, 0, 0, 1, 1,
0.1843878, 0.2767227, -0.3246039, 0, 0, 0, 1, 1,
0.1889295, -1.06528, 3.872946, 0, 0, 0, 1, 1,
0.2013086, 0.2480527, 1.083609, 0, 0, 0, 1, 1,
0.2021624, -0.3263252, 1.80963, 0, 0, 0, 1, 1,
0.203498, -1.040447, 3.204627, 0, 0, 0, 1, 1,
0.2041754, -1.583225, 2.336314, 1, 1, 1, 1, 1,
0.2046167, -0.630693, 3.124206, 1, 1, 1, 1, 1,
0.2078404, 1.10119, 0.8848898, 1, 1, 1, 1, 1,
0.2084445, 1.387034, -0.4569816, 1, 1, 1, 1, 1,
0.211826, -0.1636448, 2.663525, 1, 1, 1, 1, 1,
0.2124607, 0.2724968, 0.5005338, 1, 1, 1, 1, 1,
0.2176832, 0.6085007, 0.6185559, 1, 1, 1, 1, 1,
0.2193026, 1.236391, -1.004662, 1, 1, 1, 1, 1,
0.2194769, -1.54991, 4.363247, 1, 1, 1, 1, 1,
0.219602, -0.928871, 3.775038, 1, 1, 1, 1, 1,
0.2209992, 0.5806506, -0.671341, 1, 1, 1, 1, 1,
0.2210487, 0.1307191, -0.2411655, 1, 1, 1, 1, 1,
0.2235156, 0.4525878, 1.860065, 1, 1, 1, 1, 1,
0.2247358, 0.4528653, 1.057346, 1, 1, 1, 1, 1,
0.2268458, -0.06481258, 1.962935, 1, 1, 1, 1, 1,
0.2277095, -0.7817191, 3.018474, 0, 0, 1, 1, 1,
0.2310448, 2.783183, 0.7361611, 1, 0, 0, 1, 1,
0.2331751, 0.04483428, 0.1002575, 1, 0, 0, 1, 1,
0.2339467, 0.06605666, 1.237144, 1, 0, 0, 1, 1,
0.2341433, 0.6690962, -0.8774835, 1, 0, 0, 1, 1,
0.240521, -1.438507, 4.289708, 1, 0, 0, 1, 1,
0.252349, -0.1372529, 2.174828, 0, 0, 0, 1, 1,
0.2544004, -0.341352, 1.530015, 0, 0, 0, 1, 1,
0.2566994, -1.503587, 4.232105, 0, 0, 0, 1, 1,
0.2567376, -1.144745, 2.69049, 0, 0, 0, 1, 1,
0.2583343, -0.4474842, 3.090774, 0, 0, 0, 1, 1,
0.2619157, 0.4606929, 1.315225, 0, 0, 0, 1, 1,
0.2674317, 0.2163807, 0.998714, 0, 0, 0, 1, 1,
0.2688464, -0.6040238, 2.003554, 1, 1, 1, 1, 1,
0.2735359, -1.620777, 3.155945, 1, 1, 1, 1, 1,
0.2768678, 0.4910478, -0.6174645, 1, 1, 1, 1, 1,
0.2774319, 0.1541284, 1.181712, 1, 1, 1, 1, 1,
0.2847684, 0.1305146, 1.84445, 1, 1, 1, 1, 1,
0.2883984, 0.03826521, 2.01386, 1, 1, 1, 1, 1,
0.288732, -0.1651927, 2.351625, 1, 1, 1, 1, 1,
0.2901974, 1.517848, 1.929855, 1, 1, 1, 1, 1,
0.2907633, 1.13257, 0.1907918, 1, 1, 1, 1, 1,
0.2989177, -1.446599, 2.493509, 1, 1, 1, 1, 1,
0.2998486, -1.643802, 3.164947, 1, 1, 1, 1, 1,
0.3022035, -0.3884486, 0.3355003, 1, 1, 1, 1, 1,
0.3042009, -2.298947, 2.321697, 1, 1, 1, 1, 1,
0.3067751, -1.48264, 2.156014, 1, 1, 1, 1, 1,
0.3127657, 0.3393394, 0.6480277, 1, 1, 1, 1, 1,
0.3156637, 2.481137, -0.1607087, 0, 0, 1, 1, 1,
0.3247432, -0.5288899, 3.450943, 1, 0, 0, 1, 1,
0.3258033, -0.134644, 3.337047, 1, 0, 0, 1, 1,
0.3380799, -0.1417493, 4.117628, 1, 0, 0, 1, 1,
0.3385896, 1.013766, -0.3615634, 1, 0, 0, 1, 1,
0.3394236, 2.020209, 0.1207313, 1, 0, 0, 1, 1,
0.3425644, -0.6378117, 2.51704, 0, 0, 0, 1, 1,
0.3431322, -1.348051, 1.857297, 0, 0, 0, 1, 1,
0.3436218, 0.6551312, -0.7397469, 0, 0, 0, 1, 1,
0.3457715, -1.795748, 3.583201, 0, 0, 0, 1, 1,
0.3499781, -1.384414, 3.61688, 0, 0, 0, 1, 1,
0.3516848, -0.5385036, 3.31544, 0, 0, 0, 1, 1,
0.3542998, -0.8025987, 3.755526, 0, 0, 0, 1, 1,
0.3653422, 0.6432152, 1.356759, 1, 1, 1, 1, 1,
0.368815, -0.1123148, 3.145147, 1, 1, 1, 1, 1,
0.3788678, 0.3185918, 1.190821, 1, 1, 1, 1, 1,
0.3794498, 0.0160713, 0.8990151, 1, 1, 1, 1, 1,
0.3830732, 0.6641256, 0.6929414, 1, 1, 1, 1, 1,
0.383878, 1.210994, 0.9816995, 1, 1, 1, 1, 1,
0.3855711, -0.3443228, 2.080467, 1, 1, 1, 1, 1,
0.38767, 0.5983595, 0.6632111, 1, 1, 1, 1, 1,
0.3902715, 0.7804295, 0.9727298, 1, 1, 1, 1, 1,
0.3906573, -1.379397, 2.850522, 1, 1, 1, 1, 1,
0.3914043, 0.3085516, 0.8445551, 1, 1, 1, 1, 1,
0.3924419, -0.3048017, 2.589398, 1, 1, 1, 1, 1,
0.3939296, 0.5285369, -0.2167871, 1, 1, 1, 1, 1,
0.3948402, 1.16418, 0.3149211, 1, 1, 1, 1, 1,
0.4045869, 1.691462, 0.7730454, 1, 1, 1, 1, 1,
0.4107412, -0.5815115, 1.044167, 0, 0, 1, 1, 1,
0.4160697, 1.877456, 0.6660289, 1, 0, 0, 1, 1,
0.4205335, -1.515509, 3.13735, 1, 0, 0, 1, 1,
0.4216309, 0.563189, 1.874993, 1, 0, 0, 1, 1,
0.4224079, -1.49546, 2.244325, 1, 0, 0, 1, 1,
0.4262269, -0.1914761, 1.619158, 1, 0, 0, 1, 1,
0.4272395, 0.077026, 1.048925, 0, 0, 0, 1, 1,
0.4380277, -1.093818, 2.870618, 0, 0, 0, 1, 1,
0.4394556, -2.433534, 2.583451, 0, 0, 0, 1, 1,
0.4419212, -0.2308722, 1.951246, 0, 0, 0, 1, 1,
0.4437032, 0.2125679, 0.06425543, 0, 0, 0, 1, 1,
0.4520312, 0.9830059, 0.3013035, 0, 0, 0, 1, 1,
0.453128, -0.4416571, 3.064777, 0, 0, 0, 1, 1,
0.4625502, 0.6649232, 0.4722854, 1, 1, 1, 1, 1,
0.467046, 0.3046255, 1.104301, 1, 1, 1, 1, 1,
0.4761844, 0.1093324, 0.132368, 1, 1, 1, 1, 1,
0.4768156, 0.5752963, 0.7363184, 1, 1, 1, 1, 1,
0.4794955, 0.0345417, 2.28011, 1, 1, 1, 1, 1,
0.4797392, 0.7972618, 2.049087, 1, 1, 1, 1, 1,
0.4857025, -2.019126, 2.874887, 1, 1, 1, 1, 1,
0.4857083, 1.061528, -0.3091711, 1, 1, 1, 1, 1,
0.4867392, -0.5021758, 3.657107, 1, 1, 1, 1, 1,
0.4867561, -0.8824771, 4.322948, 1, 1, 1, 1, 1,
0.4963993, 0.7221379, 2.164057, 1, 1, 1, 1, 1,
0.5024939, -1.403037, 5.001194, 1, 1, 1, 1, 1,
0.5046342, -0.5393484, 3.076805, 1, 1, 1, 1, 1,
0.5103114, -0.7095641, 3.44646, 1, 1, 1, 1, 1,
0.5153482, -1.306181, 1.254592, 1, 1, 1, 1, 1,
0.5153626, 0.3444466, 0.3962608, 0, 0, 1, 1, 1,
0.5166243, -0.8236881, 4.156629, 1, 0, 0, 1, 1,
0.5173684, 0.1403293, 0.9745046, 1, 0, 0, 1, 1,
0.5207981, -0.2667804, 1.852434, 1, 0, 0, 1, 1,
0.5281009, 2.360929, 0.718654, 1, 0, 0, 1, 1,
0.5286193, -0.5509807, 1.673764, 1, 0, 0, 1, 1,
0.5287093, -0.5502005, 2.795766, 0, 0, 0, 1, 1,
0.5312281, 0.382028, -0.3865862, 0, 0, 0, 1, 1,
0.5313909, -0.686438, 1.85819, 0, 0, 0, 1, 1,
0.5334304, -0.794171, 2.341009, 0, 0, 0, 1, 1,
0.5379109, 1.973213, -0.5148587, 0, 0, 0, 1, 1,
0.53915, -0.338796, 1.85436, 0, 0, 0, 1, 1,
0.5395606, -0.4667537, 2.660889, 0, 0, 0, 1, 1,
0.5423778, 0.1061984, 0.8684687, 1, 1, 1, 1, 1,
0.543585, 0.6905413, 1.985728, 1, 1, 1, 1, 1,
0.5498961, 0.4369232, 1.904287, 1, 1, 1, 1, 1,
0.5512797, -1.81587, 2.563911, 1, 1, 1, 1, 1,
0.5533571, 0.09013965, 3.086839, 1, 1, 1, 1, 1,
0.5576351, 1.346182, 0.06593482, 1, 1, 1, 1, 1,
0.5644476, -1.386882, 2.994234, 1, 1, 1, 1, 1,
0.5660569, -2.136482, 2.962305, 1, 1, 1, 1, 1,
0.5674974, -1.321854, 3.265698, 1, 1, 1, 1, 1,
0.5706849, 0.1131169, 1.96613, 1, 1, 1, 1, 1,
0.5734647, 0.4921962, 3.161126, 1, 1, 1, 1, 1,
0.5770482, 0.3146271, 1.409751, 1, 1, 1, 1, 1,
0.58385, -1.010352, 2.249497, 1, 1, 1, 1, 1,
0.593711, 0.08474431, 0.09984808, 1, 1, 1, 1, 1,
0.595513, 0.2504338, -0.1033599, 1, 1, 1, 1, 1,
0.5987442, 1.121613, 1.604733, 0, 0, 1, 1, 1,
0.6008576, 0.5516384, 0.1296216, 1, 0, 0, 1, 1,
0.6037726, 0.542989, 1.227293, 1, 0, 0, 1, 1,
0.6069416, -0.1026076, 2.561813, 1, 0, 0, 1, 1,
0.6155646, -0.9622469, 3.208784, 1, 0, 0, 1, 1,
0.6164263, 0.3175789, 3.183782, 1, 0, 0, 1, 1,
0.6166806, 0.07441663, 0.1555206, 0, 0, 0, 1, 1,
0.6189446, -0.749846, 3.089885, 0, 0, 0, 1, 1,
0.6192153, -0.5956699, 3.612972, 0, 0, 0, 1, 1,
0.6195554, 1.120389, -1.45747, 0, 0, 0, 1, 1,
0.6198435, 0.6884344, 0.7899328, 0, 0, 0, 1, 1,
0.6200612, 0.1751187, 2.130161, 0, 0, 0, 1, 1,
0.6233206, -0.4136448, 2.042337, 0, 0, 0, 1, 1,
0.6258527, 0.7100316, 2.133165, 1, 1, 1, 1, 1,
0.6374917, 0.6473485, 0.383398, 1, 1, 1, 1, 1,
0.6450825, -0.7374772, 2.026917, 1, 1, 1, 1, 1,
0.6513028, -0.06020388, 2.404698, 1, 1, 1, 1, 1,
0.6525716, 0.9707031, -1.123328, 1, 1, 1, 1, 1,
0.6536518, -0.07281209, 0.2368426, 1, 1, 1, 1, 1,
0.6546249, -2.510765, 3.072504, 1, 1, 1, 1, 1,
0.6555023, -0.7078576, 1.918791, 1, 1, 1, 1, 1,
0.6569831, -0.3094859, 2.180647, 1, 1, 1, 1, 1,
0.6645489, -1.723224, 2.433594, 1, 1, 1, 1, 1,
0.6716117, -0.08968396, 0.455473, 1, 1, 1, 1, 1,
0.6749324, -0.4058245, 3.280001, 1, 1, 1, 1, 1,
0.6781329, -1.176342, 0.5394716, 1, 1, 1, 1, 1,
0.6835431, 0.6810593, 0.2931423, 1, 1, 1, 1, 1,
0.6865169, 1.299865, -0.6783723, 1, 1, 1, 1, 1,
0.6948775, 0.04273589, 2.830637, 0, 0, 1, 1, 1,
0.695558, -0.4881385, 1.867354, 1, 0, 0, 1, 1,
0.7004086, -0.4095815, 2.569547, 1, 0, 0, 1, 1,
0.7023127, -0.9067196, 2.363447, 1, 0, 0, 1, 1,
0.7058315, 1.060045, 1.637735, 1, 0, 0, 1, 1,
0.7072853, 2.028763, 1.703547, 1, 0, 0, 1, 1,
0.7146198, -0.2693595, 1.285308, 0, 0, 0, 1, 1,
0.7180204, -2.18472, 4.21594, 0, 0, 0, 1, 1,
0.7274429, -1.098073, 2.90759, 0, 0, 0, 1, 1,
0.7286525, -1.235911, 3.355859, 0, 0, 0, 1, 1,
0.728687, -0.4736583, 2.843153, 0, 0, 0, 1, 1,
0.7420182, -1.106569, 2.288482, 0, 0, 0, 1, 1,
0.7424949, 1.221454, 0.1185668, 0, 0, 0, 1, 1,
0.7471027, 0.2181668, 1.020807, 1, 1, 1, 1, 1,
0.7524876, 0.8061393, 2.250453, 1, 1, 1, 1, 1,
0.7540818, 0.4923402, 0.1368897, 1, 1, 1, 1, 1,
0.7588074, -0.2006188, 2.666919, 1, 1, 1, 1, 1,
0.761851, 0.1853471, 3.443057, 1, 1, 1, 1, 1,
0.7653054, -0.4495977, 1.169603, 1, 1, 1, 1, 1,
0.769984, -1.379092, 2.423386, 1, 1, 1, 1, 1,
0.7711893, -0.8782055, 2.770735, 1, 1, 1, 1, 1,
0.7853584, 1.107597, 1.749393, 1, 1, 1, 1, 1,
0.790872, -1.215222, 2.090711, 1, 1, 1, 1, 1,
0.7926089, -1.073784, 2.908608, 1, 1, 1, 1, 1,
0.7953267, -0.4161182, 2.601287, 1, 1, 1, 1, 1,
0.803914, 0.4378355, 0.5157278, 1, 1, 1, 1, 1,
0.8042814, -0.412921, 0.5715305, 1, 1, 1, 1, 1,
0.8096931, -1.18608, 3.307328, 1, 1, 1, 1, 1,
0.8099033, -1.409084, 1.671953, 0, 0, 1, 1, 1,
0.8108747, 0.218972, 1.619997, 1, 0, 0, 1, 1,
0.8139544, 0.4927733, 0.8049933, 1, 0, 0, 1, 1,
0.8163682, -0.09042384, 1.3046, 1, 0, 0, 1, 1,
0.8221738, 0.02704967, 0.6321762, 1, 0, 0, 1, 1,
0.8226703, -1.099816, 1.756841, 1, 0, 0, 1, 1,
0.8264648, 0.22475, -0.7731534, 0, 0, 0, 1, 1,
0.8269973, -0.2969569, 2.599651, 0, 0, 0, 1, 1,
0.8285674, -2.427348, 3.568901, 0, 0, 0, 1, 1,
0.8313629, 0.5817772, 0.908434, 0, 0, 0, 1, 1,
0.8324543, 0.7957245, 0.06014764, 0, 0, 0, 1, 1,
0.8403209, 1.982635, -0.1435419, 0, 0, 0, 1, 1,
0.8431942, -0.5629218, 2.171766, 0, 0, 0, 1, 1,
0.8459365, -0.6097553, 1.380199, 1, 1, 1, 1, 1,
0.8504884, -0.2623904, 3.107299, 1, 1, 1, 1, 1,
0.8597245, -1.151151, 1.705745, 1, 1, 1, 1, 1,
0.8606128, 1.268997, 0.623207, 1, 1, 1, 1, 1,
0.8620384, 0.4933411, 2.390357, 1, 1, 1, 1, 1,
0.868477, -0.2399981, 2.161683, 1, 1, 1, 1, 1,
0.8753298, 0.5321676, 0.7427546, 1, 1, 1, 1, 1,
0.8780096, -1.720772, 1.400405, 1, 1, 1, 1, 1,
0.8793318, 0.02413492, 3.754193, 1, 1, 1, 1, 1,
0.8797449, 0.4434085, -0.722487, 1, 1, 1, 1, 1,
0.8803986, 0.7330952, 0.9583184, 1, 1, 1, 1, 1,
0.88559, -0.7545583, 0.5697921, 1, 1, 1, 1, 1,
0.8951281, -0.6469532, 2.68029, 1, 1, 1, 1, 1,
0.9034793, 0.3640974, -0.1678193, 1, 1, 1, 1, 1,
0.9052738, 0.8552244, 1.083437, 1, 1, 1, 1, 1,
0.9133636, -0.2784286, 0.8396643, 0, 0, 1, 1, 1,
0.9142846, 1.405769, 1.171687, 1, 0, 0, 1, 1,
0.9146881, -0.5947356, 2.332185, 1, 0, 0, 1, 1,
0.924644, -1.008729, 0.1666111, 1, 0, 0, 1, 1,
0.9255368, 0.6706731, 2.120204, 1, 0, 0, 1, 1,
0.9387226, -0.3164649, 2.996814, 1, 0, 0, 1, 1,
0.9405249, -0.3718256, 1.519483, 0, 0, 0, 1, 1,
0.9434689, 0.9759429, 1.4986, 0, 0, 0, 1, 1,
0.945196, -0.1385489, -1.044009, 0, 0, 0, 1, 1,
0.9468261, 1.213377, 1.916102, 0, 0, 0, 1, 1,
0.9492036, -0.4597453, 2.161547, 0, 0, 0, 1, 1,
0.9509133, -0.4088486, 0.03642121, 0, 0, 0, 1, 1,
0.9567876, 0.0005326981, 1.122485, 0, 0, 0, 1, 1,
0.9587783, -2.7315, 3.533449, 1, 1, 1, 1, 1,
0.9629044, -0.6343529, 1.17684, 1, 1, 1, 1, 1,
0.9660352, -0.0600292, 1.042937, 1, 1, 1, 1, 1,
0.9666246, -1.04737, 2.638919, 1, 1, 1, 1, 1,
0.9694653, -0.464721, 2.052872, 1, 1, 1, 1, 1,
0.9753652, 0.06297369, 1.290914, 1, 1, 1, 1, 1,
0.9805719, -0.5874316, 2.053548, 1, 1, 1, 1, 1,
0.9808358, 1.330984, -0.6211368, 1, 1, 1, 1, 1,
0.9810542, 0.5225831, 1.134676, 1, 1, 1, 1, 1,
0.9833711, -0.5608819, 2.061785, 1, 1, 1, 1, 1,
0.9855202, 0.9712762, 3.19831, 1, 1, 1, 1, 1,
0.9856244, 0.5296912, 0.9124288, 1, 1, 1, 1, 1,
0.9882237, -0.4794119, 1.809038, 1, 1, 1, 1, 1,
0.9890045, -0.05400152, 0.4171343, 1, 1, 1, 1, 1,
0.9915757, 0.9405863, -1.093439, 1, 1, 1, 1, 1,
0.9919131, -0.4305848, 2.179791, 0, 0, 1, 1, 1,
0.992946, 0.6214104, 1.73813, 1, 0, 0, 1, 1,
0.9936652, 1.01752, 1.704058, 1, 0, 0, 1, 1,
1.001726, 0.1395901, 0.7095009, 1, 0, 0, 1, 1,
1.001924, 0.0344261, 0.54119, 1, 0, 0, 1, 1,
1.006695, -0.1272526, 0.8875079, 1, 0, 0, 1, 1,
1.011906, -0.04960582, 2.772102, 0, 0, 0, 1, 1,
1.012435, 0.189325, 3.642859, 0, 0, 0, 1, 1,
1.013907, 0.3836735, 3.533214, 0, 0, 0, 1, 1,
1.014823, -1.407174, 2.22836, 0, 0, 0, 1, 1,
1.016832, 0.5701443, 2.104603, 0, 0, 0, 1, 1,
1.018165, -1.068734, 2.828845, 0, 0, 0, 1, 1,
1.022059, -0.885515, 5.038982, 0, 0, 0, 1, 1,
1.025947, 0.324053, 1.006607, 1, 1, 1, 1, 1,
1.027412, 0.7635441, 1.012057, 1, 1, 1, 1, 1,
1.028405, 1.754447, 1.158256, 1, 1, 1, 1, 1,
1.03278, -1.721023, 3.783105, 1, 1, 1, 1, 1,
1.038524, 0.4307286, 2.024891, 1, 1, 1, 1, 1,
1.041686, -2.021235, 2.085428, 1, 1, 1, 1, 1,
1.044113, -0.2111648, 0.7206531, 1, 1, 1, 1, 1,
1.049159, -1.299536, 0.5140414, 1, 1, 1, 1, 1,
1.050889, -1.020093, 2.638609, 1, 1, 1, 1, 1,
1.052308, -0.1031343, -0.2458657, 1, 1, 1, 1, 1,
1.052391, 1.359434, 0.3239254, 1, 1, 1, 1, 1,
1.062602, -1.699427, 1.539722, 1, 1, 1, 1, 1,
1.07085, 0.5542789, 1.861982, 1, 1, 1, 1, 1,
1.075857, 0.03975448, 2.767738, 1, 1, 1, 1, 1,
1.083213, 0.8277647, 2.150125, 1, 1, 1, 1, 1,
1.083639, -0.1327079, 2.537322, 0, 0, 1, 1, 1,
1.083769, 1.935883, 0.7042655, 1, 0, 0, 1, 1,
1.085674, -0.8333727, 2.475251, 1, 0, 0, 1, 1,
1.098164, -2.13113, 2.770844, 1, 0, 0, 1, 1,
1.106919, -1.772854, 1.486573, 1, 0, 0, 1, 1,
1.11066, 1.923805, 1.001404, 1, 0, 0, 1, 1,
1.118221, -0.777573, 2.751738, 0, 0, 0, 1, 1,
1.119491, -0.852003, 3.722607, 0, 0, 0, 1, 1,
1.122414, 0.4941098, 2.461842, 0, 0, 0, 1, 1,
1.127892, 0.8569673, 1.485271, 0, 0, 0, 1, 1,
1.131681, 1.072191, 3.498115, 0, 0, 0, 1, 1,
1.13372, -0.7002648, 3.245219, 0, 0, 0, 1, 1,
1.137416, -0.2232404, 0.392947, 0, 0, 0, 1, 1,
1.138024, -0.6865205, 1.775004, 1, 1, 1, 1, 1,
1.14149, -0.9009591, 1.285109, 1, 1, 1, 1, 1,
1.141574, -1.321851, 2.19319, 1, 1, 1, 1, 1,
1.143572, 0.5172679, 3.357671, 1, 1, 1, 1, 1,
1.154931, 0.09841059, -0.6845602, 1, 1, 1, 1, 1,
1.159506, 1.088397, -0.01447623, 1, 1, 1, 1, 1,
1.170714, -0.01305264, 0.09756495, 1, 1, 1, 1, 1,
1.175988, -0.8261158, 4.027156, 1, 1, 1, 1, 1,
1.179946, 0.5837203, 0.7316424, 1, 1, 1, 1, 1,
1.193993, -0.424818, 1.177455, 1, 1, 1, 1, 1,
1.19614, 0.4640726, 0.1859155, 1, 1, 1, 1, 1,
1.196849, -1.247384, 2.854011, 1, 1, 1, 1, 1,
1.201342, -0.6419987, 1.414099, 1, 1, 1, 1, 1,
1.210073, -0.3051574, 0.3444396, 1, 1, 1, 1, 1,
1.221149, 0.7530374, 1.872353, 1, 1, 1, 1, 1,
1.222443, -2.139836, 3.587046, 0, 0, 1, 1, 1,
1.228028, -0.2345074, 2.670733, 1, 0, 0, 1, 1,
1.230471, -0.2832118, 1.679489, 1, 0, 0, 1, 1,
1.232735, -0.113724, -0.4024844, 1, 0, 0, 1, 1,
1.233087, -1.055671, 1.753612, 1, 0, 0, 1, 1,
1.236697, -1.826844, 3.263463, 1, 0, 0, 1, 1,
1.241384, 0.8089581, 1.33059, 0, 0, 0, 1, 1,
1.255611, 0.1995079, 1.466389, 0, 0, 0, 1, 1,
1.263763, -1.61966, 2.51189, 0, 0, 0, 1, 1,
1.270558, 0.8093178, 0.328586, 0, 0, 0, 1, 1,
1.271918, -0.3631597, 2.81855, 0, 0, 0, 1, 1,
1.27382, 1.458153, 2.104711, 0, 0, 0, 1, 1,
1.284387, -0.7162113, 2.168195, 0, 0, 0, 1, 1,
1.28731, 0.1478494, 1.607886, 1, 1, 1, 1, 1,
1.294142, 1.088468, 1.373332, 1, 1, 1, 1, 1,
1.308013, 0.5941035, -0.4983755, 1, 1, 1, 1, 1,
1.309087, -0.3563289, 1.60487, 1, 1, 1, 1, 1,
1.315408, -0.8898261, 2.940373, 1, 1, 1, 1, 1,
1.3302, 0.6195284, 1.421211, 1, 1, 1, 1, 1,
1.340191, 0.3206922, 0.9597839, 1, 1, 1, 1, 1,
1.351428, 0.4743876, 0.4421868, 1, 1, 1, 1, 1,
1.357697, -0.3156931, 0.8128096, 1, 1, 1, 1, 1,
1.358223, -1.014441, 2.663142, 1, 1, 1, 1, 1,
1.371894, 1.528395, 2.521547, 1, 1, 1, 1, 1,
1.381516, 0.02694229, 1.360543, 1, 1, 1, 1, 1,
1.391592, -0.9680597, 3.525642, 1, 1, 1, 1, 1,
1.392289, 0.9687876, 0.9091508, 1, 1, 1, 1, 1,
1.40185, 0.2655684, 1.131939, 1, 1, 1, 1, 1,
1.414193, 2.316946, 1.565042, 0, 0, 1, 1, 1,
1.422412, -0.8545849, 0.9209604, 1, 0, 0, 1, 1,
1.423403, -1.731842, 2.6538, 1, 0, 0, 1, 1,
1.425664, -1.582379, 2.230345, 1, 0, 0, 1, 1,
1.432167, 0.7777793, -0.1169696, 1, 0, 0, 1, 1,
1.455215, 1.552334, 1.446439, 1, 0, 0, 1, 1,
1.457471, -0.1971409, 1.329075, 0, 0, 0, 1, 1,
1.477409, -0.5548323, 1.088767, 0, 0, 0, 1, 1,
1.481363, -1.091892, 1.454141, 0, 0, 0, 1, 1,
1.483669, -2.53196, 2.553405, 0, 0, 0, 1, 1,
1.486505, -0.8083877, 2.397673, 0, 0, 0, 1, 1,
1.498083, 0.2119911, 0.8534016, 0, 0, 0, 1, 1,
1.511915, 0.8666047, 1.116315, 0, 0, 0, 1, 1,
1.528947, 0.09936588, 0.1715354, 1, 1, 1, 1, 1,
1.53013, 2.024144, 1.430561, 1, 1, 1, 1, 1,
1.538155, -1.020409, 2.166113, 1, 1, 1, 1, 1,
1.540166, -0.6243051, 2.65609, 1, 1, 1, 1, 1,
1.572368, 1.885387, 0.7790678, 1, 1, 1, 1, 1,
1.583712, 0.2606986, 1.407588, 1, 1, 1, 1, 1,
1.597365, -0.3337142, 0.8139764, 1, 1, 1, 1, 1,
1.609254, 1.277241, 0.4945532, 1, 1, 1, 1, 1,
1.611432, -1.484351, 2.409901, 1, 1, 1, 1, 1,
1.620195, -2.305622, 4.371578, 1, 1, 1, 1, 1,
1.645801, -0.2952257, 1.690054, 1, 1, 1, 1, 1,
1.647111, 0.7138004, -0.03838241, 1, 1, 1, 1, 1,
1.662994, 0.95426, 3.136437, 1, 1, 1, 1, 1,
1.664624, 0.5566428, 1.071025, 1, 1, 1, 1, 1,
1.711389, 0.3388714, 1.394892, 1, 1, 1, 1, 1,
1.722126, 0.5366297, 0.7430999, 0, 0, 1, 1, 1,
1.726629, -0.05374564, 0.139632, 1, 0, 0, 1, 1,
1.738368, -1.174642, 2.292199, 1, 0, 0, 1, 1,
1.756022, -0.4297792, 2.823435, 1, 0, 0, 1, 1,
1.761755, -1.433778, 1.192713, 1, 0, 0, 1, 1,
1.801462, 0.1327124, 1.091226, 1, 0, 0, 1, 1,
1.805231, -0.7564371, 3.234664, 0, 0, 0, 1, 1,
1.81174, -2.488443, 1.550143, 0, 0, 0, 1, 1,
1.840755, 3.165483, -0.2568611, 0, 0, 0, 1, 1,
1.841049, 0.2117841, 1.33966, 0, 0, 0, 1, 1,
1.849165, 0.1376571, -0.742858, 0, 0, 0, 1, 1,
1.851202, -0.3698499, 3.37997, 0, 0, 0, 1, 1,
1.907193, 2.025272, -0.2016515, 0, 0, 0, 1, 1,
1.927027, -2.198431, 2.402394, 1, 1, 1, 1, 1,
1.929147, -0.3519762, 3.214706, 1, 1, 1, 1, 1,
1.939693, -0.005317583, 2.153565, 1, 1, 1, 1, 1,
1.945549, 0.3970669, 1.305797, 1, 1, 1, 1, 1,
1.946987, -1.749193, 2.034977, 1, 1, 1, 1, 1,
1.950695, -0.06637497, 0.627254, 1, 1, 1, 1, 1,
1.963836, 0.33597, -0.04033323, 1, 1, 1, 1, 1,
1.974821, -0.05262245, 3.382423, 1, 1, 1, 1, 1,
1.989884, -0.5409176, 3.361189, 1, 1, 1, 1, 1,
1.990837, 0.2408229, 0.4883198, 1, 1, 1, 1, 1,
2.051069, 1.5029, 0.4922206, 1, 1, 1, 1, 1,
2.06462, 0.5422921, 1.958407, 1, 1, 1, 1, 1,
2.085839, 0.7555323, -0.2738456, 1, 1, 1, 1, 1,
2.136762, -1.016443, 2.39792, 1, 1, 1, 1, 1,
2.138364, -1.270106, 1.343875, 1, 1, 1, 1, 1,
2.143447, 0.172016, 2.732764, 0, 0, 1, 1, 1,
2.190922, 0.9712371, 1.607282, 1, 0, 0, 1, 1,
2.19124, 2.856775, 1.839123, 1, 0, 0, 1, 1,
2.199528, -0.226986, 0.6726526, 1, 0, 0, 1, 1,
2.222239, -0.7575495, 0.5950544, 1, 0, 0, 1, 1,
2.281283, 0.8243358, 1.567128, 1, 0, 0, 1, 1,
2.285081, 0.07778599, 0.3297288, 0, 0, 0, 1, 1,
2.301047, -0.255382, 2.706698, 0, 0, 0, 1, 1,
2.336037, -0.9012749, 0.458625, 0, 0, 0, 1, 1,
2.348608, -0.3593373, 1.859113, 0, 0, 0, 1, 1,
2.384934, -1.214527, 1.850367, 0, 0, 0, 1, 1,
2.40535, 1.888399, 0.6123961, 0, 0, 0, 1, 1,
2.426971, 0.3731338, 1.642459, 0, 0, 0, 1, 1,
2.43875, 0.1365345, 2.890712, 1, 1, 1, 1, 1,
2.439671, -0.33912, 1.723507, 1, 1, 1, 1, 1,
2.462826, 0.2321839, -0.1426401, 1, 1, 1, 1, 1,
2.503304, 0.0928223, 1.501385, 1, 1, 1, 1, 1,
2.566671, 0.1972415, 3.437254, 1, 1, 1, 1, 1,
2.580782, 0.569573, 2.178754, 1, 1, 1, 1, 1,
2.71932, -0.9889442, 0.7247764, 1, 1, 1, 1, 1
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
var radius = 9.50104;
var distance = 33.372;
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
mvMatrix.translate( 0.2310487, -0.2256719, 0.544215 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.372);
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