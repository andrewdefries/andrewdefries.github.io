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
-2.942793, -0.7585338, -2.38991, 1, 0, 0, 1,
-2.91723, 0.05655777, -2.08634, 1, 0.007843138, 0, 1,
-2.730946, 2.045114, -1.773078, 1, 0.01176471, 0, 1,
-2.516966, 0.2772036, -2.783128, 1, 0.01960784, 0, 1,
-2.472088, -1.437918, -2.557841, 1, 0.02352941, 0, 1,
-2.364606, 0.319351, -1.15112, 1, 0.03137255, 0, 1,
-2.361966, -0.08372207, -0.3784142, 1, 0.03529412, 0, 1,
-2.353394, 1.401902, 0.3330353, 1, 0.04313726, 0, 1,
-2.342479, 0.02471043, -3.191639, 1, 0.04705882, 0, 1,
-2.331087, -0.3590722, -2.949867, 1, 0.05490196, 0, 1,
-2.316168, 0.3615756, -1.551286, 1, 0.05882353, 0, 1,
-2.282459, 0.01624113, -1.509372, 1, 0.06666667, 0, 1,
-2.279976, 0.2141295, -1.733506, 1, 0.07058824, 0, 1,
-2.277458, 1.367608, 0.6136139, 1, 0.07843138, 0, 1,
-2.270458, 0.3814881, 0.1300455, 1, 0.08235294, 0, 1,
-2.207878, 0.5325499, -0.6750546, 1, 0.09019608, 0, 1,
-2.184893, -1.001923, -2.031455, 1, 0.09411765, 0, 1,
-2.184781, -1.183558, 0.1024624, 1, 0.1019608, 0, 1,
-2.096815, 0.4407836, -1.163542, 1, 0.1098039, 0, 1,
-2.094307, -0.7508758, -2.640057, 1, 0.1137255, 0, 1,
-2.085726, 0.4372934, -0.4507133, 1, 0.1215686, 0, 1,
-2.082847, -0.1636562, -1.086027, 1, 0.1254902, 0, 1,
-2.035535, -0.31482, -2.313759, 1, 0.1333333, 0, 1,
-2.007457, 1.353099, -0.3552711, 1, 0.1372549, 0, 1,
-2.005792, -0.08074166, -1.636181, 1, 0.145098, 0, 1,
-2.004847, -0.3057581, -1.470772, 1, 0.1490196, 0, 1,
-1.994731, 0.3689924, -2.631673, 1, 0.1568628, 0, 1,
-1.951441, -0.9605941, -2.120324, 1, 0.1607843, 0, 1,
-1.949818, 0.1810936, -1.349448, 1, 0.1686275, 0, 1,
-1.940561, -0.5796435, -0.7729077, 1, 0.172549, 0, 1,
-1.911371, -0.8010226, -2.301658, 1, 0.1803922, 0, 1,
-1.905647, -2.453715, -2.848581, 1, 0.1843137, 0, 1,
-1.899583, -0.5149759, -2.058588, 1, 0.1921569, 0, 1,
-1.887056, 1.171091, -1.875631, 1, 0.1960784, 0, 1,
-1.870459, 0.5066297, -3.827676, 1, 0.2039216, 0, 1,
-1.848315, -0.02681142, -1.029521, 1, 0.2117647, 0, 1,
-1.833922, 0.8741097, -0.9716472, 1, 0.2156863, 0, 1,
-1.817371, 0.7966983, -3.596901, 1, 0.2235294, 0, 1,
-1.782534, -0.6855888, -0.6463929, 1, 0.227451, 0, 1,
-1.768279, -0.4957395, -2.695021, 1, 0.2352941, 0, 1,
-1.752275, 0.3070406, -1.848465, 1, 0.2392157, 0, 1,
-1.736616, -1.278709, -1.843148, 1, 0.2470588, 0, 1,
-1.718274, -0.547193, -1.420756, 1, 0.2509804, 0, 1,
-1.700031, 0.5322294, -3.247445, 1, 0.2588235, 0, 1,
-1.692175, 0.9565601, -0.2591929, 1, 0.2627451, 0, 1,
-1.669786, 0.4193543, -1.03836, 1, 0.2705882, 0, 1,
-1.668557, 0.0325082, -1.193751, 1, 0.2745098, 0, 1,
-1.654299, -1.481221, -3.080459, 1, 0.282353, 0, 1,
-1.645259, -0.7301373, -1.881415, 1, 0.2862745, 0, 1,
-1.628633, 0.4796727, -1.263397, 1, 0.2941177, 0, 1,
-1.613211, -1.858443, -2.896036, 1, 0.3019608, 0, 1,
-1.609046, -0.8000129, -1.552683, 1, 0.3058824, 0, 1,
-1.600701, 0.3572276, -2.247847, 1, 0.3137255, 0, 1,
-1.588998, 1.569811, -2.379155, 1, 0.3176471, 0, 1,
-1.58013, 1.48257, -1.92056, 1, 0.3254902, 0, 1,
-1.489283, -1.22149, -1.441007, 1, 0.3294118, 0, 1,
-1.488419, 0.07747704, -1.93431, 1, 0.3372549, 0, 1,
-1.486136, 0.4983145, -3.708173, 1, 0.3411765, 0, 1,
-1.433341, 0.7492543, -1.914258, 1, 0.3490196, 0, 1,
-1.431032, 1.344927, -1.412565, 1, 0.3529412, 0, 1,
-1.43021, 1.605582, 0.7851344, 1, 0.3607843, 0, 1,
-1.421252, -3.447936, -2.442786, 1, 0.3647059, 0, 1,
-1.42056, -0.2062612, 1.573242, 1, 0.372549, 0, 1,
-1.417268, 1.139414, -0.1787413, 1, 0.3764706, 0, 1,
-1.411619, -0.8297849, -2.174258, 1, 0.3843137, 0, 1,
-1.397442, -0.4806091, -1.947273, 1, 0.3882353, 0, 1,
-1.39468, 0.6707348, -0.9989384, 1, 0.3960784, 0, 1,
-1.393117, -0.1053369, -0.6874461, 1, 0.4039216, 0, 1,
-1.392794, 0.6315176, -1.082509, 1, 0.4078431, 0, 1,
-1.385409, -0.6964999, -2.894666, 1, 0.4156863, 0, 1,
-1.377193, 0.6077924, 0.7089022, 1, 0.4196078, 0, 1,
-1.372158, -0.1485236, -1.984888, 1, 0.427451, 0, 1,
-1.369386, -0.002856436, -1.865409, 1, 0.4313726, 0, 1,
-1.350412, -1.186591, -1.997555, 1, 0.4392157, 0, 1,
-1.34985, 0.8028399, -2.093286, 1, 0.4431373, 0, 1,
-1.34728, 0.8384482, -0.8973744, 1, 0.4509804, 0, 1,
-1.328076, 0.113795, -2.12623, 1, 0.454902, 0, 1,
-1.316503, -1.607303, -1.792605, 1, 0.4627451, 0, 1,
-1.290464, -0.3454432, -1.014563, 1, 0.4666667, 0, 1,
-1.285707, -1.062055, -2.23954, 1, 0.4745098, 0, 1,
-1.28322, 0.4322413, -0.9429495, 1, 0.4784314, 0, 1,
-1.272356, 0.1280556, -1.057052, 1, 0.4862745, 0, 1,
-1.258461, -0.002244873, -0.4683885, 1, 0.4901961, 0, 1,
-1.257352, 0.4528293, -2.100749, 1, 0.4980392, 0, 1,
-1.242703, 0.5528716, -2.606852, 1, 0.5058824, 0, 1,
-1.231058, -2.712707, -1.902781, 1, 0.509804, 0, 1,
-1.230933, 2.034387, -1.156337, 1, 0.5176471, 0, 1,
-1.220302, -0.6204284, -3.174321, 1, 0.5215687, 0, 1,
-1.2148, 1.002672, -1.441996, 1, 0.5294118, 0, 1,
-1.213413, 0.2091598, -2.726268, 1, 0.5333334, 0, 1,
-1.212241, -0.708023, -2.380193, 1, 0.5411765, 0, 1,
-1.210738, 0.01189016, -2.845227, 1, 0.5450981, 0, 1,
-1.209107, -1.253649, -1.640932, 1, 0.5529412, 0, 1,
-1.205619, -0.8339511, -0.6614941, 1, 0.5568628, 0, 1,
-1.197363, -0.9227265, -3.72593, 1, 0.5647059, 0, 1,
-1.193739, -0.2576447, -1.680987, 1, 0.5686275, 0, 1,
-1.192353, 1.49953, -1.436541, 1, 0.5764706, 0, 1,
-1.186979, 2.045607, -1.410587, 1, 0.5803922, 0, 1,
-1.186169, -1.686588, -2.709183, 1, 0.5882353, 0, 1,
-1.185227, 0.05862315, -1.031248, 1, 0.5921569, 0, 1,
-1.175897, -0.08379404, -2.588778, 1, 0.6, 0, 1,
-1.167858, 0.3613813, -1.592346, 1, 0.6078432, 0, 1,
-1.165691, 0.4034434, -1.052562, 1, 0.6117647, 0, 1,
-1.153701, -0.372243, -3.662786, 1, 0.6196079, 0, 1,
-1.151082, 0.5051306, -1.149808, 1, 0.6235294, 0, 1,
-1.143897, -1.919922, -4.531709, 1, 0.6313726, 0, 1,
-1.141574, 1.528888, -0.6628904, 1, 0.6352941, 0, 1,
-1.139298, 1.800769, -0.3607658, 1, 0.6431373, 0, 1,
-1.139161, -0.6459743, -1.628063, 1, 0.6470588, 0, 1,
-1.137195, 1.72591, -0.6230093, 1, 0.654902, 0, 1,
-1.124876, -0.8587447, -2.500485, 1, 0.6588235, 0, 1,
-1.124551, 0.3687991, -2.984774, 1, 0.6666667, 0, 1,
-1.124453, 0.8813585, -0.8066683, 1, 0.6705883, 0, 1,
-1.088863, 0.5657943, -1.249387, 1, 0.6784314, 0, 1,
-1.088391, -1.704041, -3.090368, 1, 0.682353, 0, 1,
-1.088093, 0.8360518, -1.198992, 1, 0.6901961, 0, 1,
-1.08193, -1.283752, -0.9606401, 1, 0.6941177, 0, 1,
-1.075165, 0.1347571, -1.80621, 1, 0.7019608, 0, 1,
-1.068951, -0.7492213, -1.748094, 1, 0.7098039, 0, 1,
-1.06489, 0.7787619, -0.6963333, 1, 0.7137255, 0, 1,
-1.060907, 0.5311009, -0.8933948, 1, 0.7215686, 0, 1,
-1.05877, -1.386607, -1.971371, 1, 0.7254902, 0, 1,
-1.057431, 0.7021685, -0.8811572, 1, 0.7333333, 0, 1,
-1.05515, -0.6476611, -1.482777, 1, 0.7372549, 0, 1,
-1.051636, -0.9723772, -2.673733, 1, 0.7450981, 0, 1,
-1.051337, 0.4948212, 1.135346, 1, 0.7490196, 0, 1,
-1.033297, -1.262202, -2.807613, 1, 0.7568628, 0, 1,
-1.020527, 0.908785, -1.228049, 1, 0.7607843, 0, 1,
-1.013021, -0.2657897, -1.275735, 1, 0.7686275, 0, 1,
-1.011793, 0.574743, 0.2150993, 1, 0.772549, 0, 1,
-0.9982799, -0.2787143, -1.509646, 1, 0.7803922, 0, 1,
-0.997108, 0.318623, -0.8616378, 1, 0.7843137, 0, 1,
-0.9919718, 0.211978, -0.5081757, 1, 0.7921569, 0, 1,
-0.9778717, -1.240168, -3.331706, 1, 0.7960784, 0, 1,
-0.9701172, 2.619515, -1.837533, 1, 0.8039216, 0, 1,
-0.9648622, 0.8763344, -0.108281, 1, 0.8117647, 0, 1,
-0.9645869, 1.106158, -0.591952, 1, 0.8156863, 0, 1,
-0.9601275, -0.02672999, 0.4826222, 1, 0.8235294, 0, 1,
-0.9545105, -1.881227, -3.132753, 1, 0.827451, 0, 1,
-0.9491997, -1.347801, -2.545633, 1, 0.8352941, 0, 1,
-0.9388463, 1.342067, -0.8013431, 1, 0.8392157, 0, 1,
-0.9358522, -0.6752502, -0.6311995, 1, 0.8470588, 0, 1,
-0.9294896, 0.8399194, 2.138807, 1, 0.8509804, 0, 1,
-0.926596, 0.4711844, -1.761947, 1, 0.8588235, 0, 1,
-0.918802, -0.02999265, -0.4177469, 1, 0.8627451, 0, 1,
-0.9181966, 1.166934, -0.9604066, 1, 0.8705882, 0, 1,
-0.9138637, 0.602066, 0.3880131, 1, 0.8745098, 0, 1,
-0.9087316, 0.7752801, -1.910455, 1, 0.8823529, 0, 1,
-0.9074448, 1.167067, 0.2727577, 1, 0.8862745, 0, 1,
-0.9005064, -0.7810047, -3.122099, 1, 0.8941177, 0, 1,
-0.9004781, -0.3821203, -3.282541, 1, 0.8980392, 0, 1,
-0.895174, 1.340652, -0.1831787, 1, 0.9058824, 0, 1,
-0.891893, 0.1533601, -1.955685, 1, 0.9137255, 0, 1,
-0.8901352, 2.06228, -1.61733, 1, 0.9176471, 0, 1,
-0.8884611, 0.5084119, -1.887944, 1, 0.9254902, 0, 1,
-0.8880339, -0.1376847, -3.410658, 1, 0.9294118, 0, 1,
-0.880407, 0.2614417, -1.01839, 1, 0.9372549, 0, 1,
-0.880081, 1.480706, -1.294949, 1, 0.9411765, 0, 1,
-0.8753064, -0.7424715, 0.2288222, 1, 0.9490196, 0, 1,
-0.8735355, 0.8665644, -0.4595315, 1, 0.9529412, 0, 1,
-0.868666, -0.4439926, -3.98386, 1, 0.9607843, 0, 1,
-0.8671024, 0.4498357, -2.011299, 1, 0.9647059, 0, 1,
-0.8649067, 0.1046955, -1.498033, 1, 0.972549, 0, 1,
-0.8639888, -0.1177591, -1.646883, 1, 0.9764706, 0, 1,
-0.8614756, 1.251308, -1.764377, 1, 0.9843137, 0, 1,
-0.8577712, -0.855583, -3.546477, 1, 0.9882353, 0, 1,
-0.8574525, -0.4492784, -1.517789, 1, 0.9960784, 0, 1,
-0.8533534, -0.5201719, -1.782437, 0.9960784, 1, 0, 1,
-0.853193, -1.401952, -3.745525, 0.9921569, 1, 0, 1,
-0.8484805, -0.839411, -1.959655, 0.9843137, 1, 0, 1,
-0.8467999, -0.3574612, -3.090951, 0.9803922, 1, 0, 1,
-0.8445823, 0.05555858, 0.2999078, 0.972549, 1, 0, 1,
-0.8443928, -1.709284, -2.975635, 0.9686275, 1, 0, 1,
-0.8440946, -1.12087, -2.533708, 0.9607843, 1, 0, 1,
-0.8398302, -1.34829, -0.8633159, 0.9568627, 1, 0, 1,
-0.8342632, -0.5108074, -1.672821, 0.9490196, 1, 0, 1,
-0.8331911, -0.1070868, -1.278594, 0.945098, 1, 0, 1,
-0.8269908, 1.548849, -0.1772092, 0.9372549, 1, 0, 1,
-0.8269754, 1.162798, -0.7056378, 0.9333333, 1, 0, 1,
-0.8192024, 0.01773647, -1.566778, 0.9254902, 1, 0, 1,
-0.8185792, 0.330291, 0.1457732, 0.9215686, 1, 0, 1,
-0.8175086, -1.391734, -2.825144, 0.9137255, 1, 0, 1,
-0.8153929, 0.1369669, -0.4661856, 0.9098039, 1, 0, 1,
-0.811464, 0.1472978, -2.34856, 0.9019608, 1, 0, 1,
-0.8072299, 1.568321, -0.8867549, 0.8941177, 1, 0, 1,
-0.8055834, -0.005198769, -1.535983, 0.8901961, 1, 0, 1,
-0.8036231, 0.4697367, -1.874077, 0.8823529, 1, 0, 1,
-0.8013369, 0.4621151, -0.7321276, 0.8784314, 1, 0, 1,
-0.798695, -1.079352, -4.396142, 0.8705882, 1, 0, 1,
-0.7959853, 0.6243382, -1.414902, 0.8666667, 1, 0, 1,
-0.7957595, 0.208581, 0.2852451, 0.8588235, 1, 0, 1,
-0.7950725, -1.010551, -3.468145, 0.854902, 1, 0, 1,
-0.7932854, 0.6281706, -0.7903014, 0.8470588, 1, 0, 1,
-0.7907972, 0.5110118, -1.303928, 0.8431373, 1, 0, 1,
-0.7902134, -0.1859592, -2.030568, 0.8352941, 1, 0, 1,
-0.7894609, 1.114236, -0.4654372, 0.8313726, 1, 0, 1,
-0.78105, 0.08568934, -1.64719, 0.8235294, 1, 0, 1,
-0.7810266, -0.2535697, -1.905162, 0.8196079, 1, 0, 1,
-0.7697307, -0.6256108, -2.207806, 0.8117647, 1, 0, 1,
-0.7646134, 1.618684, 2.389936, 0.8078431, 1, 0, 1,
-0.7641271, 0.6972767, -0.1390764, 0.8, 1, 0, 1,
-0.7640654, 2.404536, 1.039406, 0.7921569, 1, 0, 1,
-0.7623065, -1.471075, -2.843913, 0.7882353, 1, 0, 1,
-0.7609132, 1.152886, 0.3124571, 0.7803922, 1, 0, 1,
-0.7505174, 0.05279876, -0.6664581, 0.7764706, 1, 0, 1,
-0.744443, 1.276532, -1.855212, 0.7686275, 1, 0, 1,
-0.7427597, -2.483041, -4.642112, 0.7647059, 1, 0, 1,
-0.7320502, -0.9289407, -2.786428, 0.7568628, 1, 0, 1,
-0.7161788, -0.2975487, -2.813755, 0.7529412, 1, 0, 1,
-0.7138349, -0.1902593, -2.48375, 0.7450981, 1, 0, 1,
-0.712164, -0.5269101, -2.643365, 0.7411765, 1, 0, 1,
-0.7117768, -0.09760312, -3.815058, 0.7333333, 1, 0, 1,
-0.7112637, -0.1866014, -2.205813, 0.7294118, 1, 0, 1,
-0.7104797, -1.640616, -3.445752, 0.7215686, 1, 0, 1,
-0.6997622, 0.05240756, -2.576185, 0.7176471, 1, 0, 1,
-0.6960872, -0.4677764, -2.265584, 0.7098039, 1, 0, 1,
-0.6869826, 0.5240849, -1.590565, 0.7058824, 1, 0, 1,
-0.6831253, -0.8694464, -2.759975, 0.6980392, 1, 0, 1,
-0.6822308, 1.331982, -0.9765784, 0.6901961, 1, 0, 1,
-0.6816764, 1.901794, 0.5383824, 0.6862745, 1, 0, 1,
-0.6807922, -0.2236571, -2.579085, 0.6784314, 1, 0, 1,
-0.6800402, -0.4846819, -1.269224, 0.6745098, 1, 0, 1,
-0.6727252, 0.6628856, 0.3703822, 0.6666667, 1, 0, 1,
-0.6648175, 0.01471471, -2.084735, 0.6627451, 1, 0, 1,
-0.6500714, -1.670052, -1.798793, 0.654902, 1, 0, 1,
-0.6456958, 0.4078381, -2.586891, 0.6509804, 1, 0, 1,
-0.6439072, -1.081347, -1.364011, 0.6431373, 1, 0, 1,
-0.6432578, 0.3846336, -1.264679, 0.6392157, 1, 0, 1,
-0.6405827, 1.149905, -0.6225008, 0.6313726, 1, 0, 1,
-0.6380221, -0.6093842, -3.396765, 0.627451, 1, 0, 1,
-0.6336401, -0.4999255, -2.860281, 0.6196079, 1, 0, 1,
-0.6322078, -2.167969, -2.344712, 0.6156863, 1, 0, 1,
-0.6318992, -0.3225057, -2.192386, 0.6078432, 1, 0, 1,
-0.6296349, -0.2009557, -2.072549, 0.6039216, 1, 0, 1,
-0.6294229, 0.9575794, 0.345151, 0.5960785, 1, 0, 1,
-0.6233798, -1.322714, -2.975413, 0.5882353, 1, 0, 1,
-0.6219833, 0.7590807, -1.1605, 0.5843138, 1, 0, 1,
-0.6218808, -0.8654194, -3.626504, 0.5764706, 1, 0, 1,
-0.6210847, -0.6615574, -2.885138, 0.572549, 1, 0, 1,
-0.6182607, 2.120006, -0.7724034, 0.5647059, 1, 0, 1,
-0.6163427, 0.1903661, -1.446087, 0.5607843, 1, 0, 1,
-0.6120704, 0.8096408, 0.08793783, 0.5529412, 1, 0, 1,
-0.6120684, -0.675629, -1.524637, 0.5490196, 1, 0, 1,
-0.6108878, 0.4707703, -0.7649835, 0.5411765, 1, 0, 1,
-0.6070259, 1.418974, -0.4257355, 0.5372549, 1, 0, 1,
-0.6030335, 0.8604679, 0.9407044, 0.5294118, 1, 0, 1,
-0.6027765, 0.03127521, -0.2351999, 0.5254902, 1, 0, 1,
-0.6013016, -0.313686, -3.698216, 0.5176471, 1, 0, 1,
-0.6009106, -0.2002287, -3.657145, 0.5137255, 1, 0, 1,
-0.6000574, 1.125863, -0.3596539, 0.5058824, 1, 0, 1,
-0.5978499, -0.3105991, -0.9473004, 0.5019608, 1, 0, 1,
-0.5894927, -1.897775, -1.754858, 0.4941176, 1, 0, 1,
-0.5888651, 0.8714862, 1.228182, 0.4862745, 1, 0, 1,
-0.5877703, -1.960433, -3.802336, 0.4823529, 1, 0, 1,
-0.5849988, 0.4102131, -1.903743, 0.4745098, 1, 0, 1,
-0.5812366, 0.8963974, -1.083641, 0.4705882, 1, 0, 1,
-0.5798107, -0.2979811, -2.641768, 0.4627451, 1, 0, 1,
-0.5659867, -0.1134134, -2.450516, 0.4588235, 1, 0, 1,
-0.5538788, 0.1891064, -0.5468145, 0.4509804, 1, 0, 1,
-0.5467061, 1.298579, 1.035816, 0.4470588, 1, 0, 1,
-0.5443005, 0.215333, -2.832084, 0.4392157, 1, 0, 1,
-0.5394085, 0.4058342, -0.2237931, 0.4352941, 1, 0, 1,
-0.5377471, 0.9721675, 0.2404938, 0.427451, 1, 0, 1,
-0.536294, 0.2573366, -1.900095, 0.4235294, 1, 0, 1,
-0.5351281, -0.4052828, -2.08636, 0.4156863, 1, 0, 1,
-0.5337533, -0.2874142, -1.236517, 0.4117647, 1, 0, 1,
-0.5298877, -0.1434313, -4.07018, 0.4039216, 1, 0, 1,
-0.529427, 2.764862, -1.211495, 0.3960784, 1, 0, 1,
-0.5256512, -0.2334515, -2.893748, 0.3921569, 1, 0, 1,
-0.5254068, 0.6322402, 0.9332305, 0.3843137, 1, 0, 1,
-0.5251125, -0.6252084, -2.506613, 0.3803922, 1, 0, 1,
-0.5245194, -0.5834732, -0.6141712, 0.372549, 1, 0, 1,
-0.5170037, -0.2144723, -3.261238, 0.3686275, 1, 0, 1,
-0.5152135, -0.573879, -2.155181, 0.3607843, 1, 0, 1,
-0.5134551, -0.07404428, -2.078198, 0.3568628, 1, 0, 1,
-0.5132297, -0.169202, -1.917312, 0.3490196, 1, 0, 1,
-0.511566, -0.07892066, -0.8695661, 0.345098, 1, 0, 1,
-0.5070157, 0.6754605, -1.209889, 0.3372549, 1, 0, 1,
-0.50615, -0.3186306, -0.8999523, 0.3333333, 1, 0, 1,
-0.5042753, 0.7069744, 0.729226, 0.3254902, 1, 0, 1,
-0.5028285, -0.4455772, -1.592154, 0.3215686, 1, 0, 1,
-0.5019783, -1.36321, -3.535426, 0.3137255, 1, 0, 1,
-0.4998046, 0.9796232, 0.05823448, 0.3098039, 1, 0, 1,
-0.49774, 0.6413445, 2.068571, 0.3019608, 1, 0, 1,
-0.4964973, -1.70864, -3.76281, 0.2941177, 1, 0, 1,
-0.4928309, -0.8125849, -3.469243, 0.2901961, 1, 0, 1,
-0.4923288, 1.029613, -0.8170044, 0.282353, 1, 0, 1,
-0.4921214, 1.075204, 1.082477, 0.2784314, 1, 0, 1,
-0.4912131, -0.2399879, -2.005795, 0.2705882, 1, 0, 1,
-0.4910134, 0.9603847, -0.7662907, 0.2666667, 1, 0, 1,
-0.4897969, -0.3495243, -1.393196, 0.2588235, 1, 0, 1,
-0.4842238, 1.453368, -0.8701155, 0.254902, 1, 0, 1,
-0.4813522, -1.770347, -3.152286, 0.2470588, 1, 0, 1,
-0.4811083, -0.5236339, -4.204232, 0.2431373, 1, 0, 1,
-0.4746108, 0.8159807, 0.1609214, 0.2352941, 1, 0, 1,
-0.4743126, 0.4466715, -1.102347, 0.2313726, 1, 0, 1,
-0.4692689, 0.264302, 0.001777846, 0.2235294, 1, 0, 1,
-0.4682982, -0.9140441, -2.394844, 0.2196078, 1, 0, 1,
-0.4634522, 1.3518, -0.7746543, 0.2117647, 1, 0, 1,
-0.4595417, 1.086378, -1.183979, 0.2078431, 1, 0, 1,
-0.4566703, 0.4927664, -0.1560045, 0.2, 1, 0, 1,
-0.4563241, -0.2248592, -1.720491, 0.1921569, 1, 0, 1,
-0.4556659, -0.09153771, -1.399082, 0.1882353, 1, 0, 1,
-0.444166, -1.661246, -2.145036, 0.1803922, 1, 0, 1,
-0.4360201, -0.4321243, -2.831894, 0.1764706, 1, 0, 1,
-0.4356822, -0.2564908, -2.07432, 0.1686275, 1, 0, 1,
-0.4346622, 1.714398, 1.287313, 0.1647059, 1, 0, 1,
-0.4341217, -0.2434484, -0.7387852, 0.1568628, 1, 0, 1,
-0.4336417, -1.11341, -2.563012, 0.1529412, 1, 0, 1,
-0.4328083, 0.03749005, -0.5808594, 0.145098, 1, 0, 1,
-0.4317538, -0.2323857, -1.938143, 0.1411765, 1, 0, 1,
-0.4275376, 0.07389279, -1.138306, 0.1333333, 1, 0, 1,
-0.4222839, 1.344371, -0.008619578, 0.1294118, 1, 0, 1,
-0.4205344, 2.53659, -0.7167969, 0.1215686, 1, 0, 1,
-0.4145932, 2.392052, -0.4292813, 0.1176471, 1, 0, 1,
-0.4090859, -0.7218643, -1.798929, 0.1098039, 1, 0, 1,
-0.4087862, -0.9987016, -2.649895, 0.1058824, 1, 0, 1,
-0.4015681, -0.5723907, -3.16898, 0.09803922, 1, 0, 1,
-0.4004776, -0.1069345, 1.435096, 0.09019608, 1, 0, 1,
-0.3986327, 1.462323, -0.772127, 0.08627451, 1, 0, 1,
-0.3892704, 0.6738203, -0.5020595, 0.07843138, 1, 0, 1,
-0.3878819, 1.799685, 1.474019, 0.07450981, 1, 0, 1,
-0.3874526, 0.2839871, -1.101906, 0.06666667, 1, 0, 1,
-0.3856095, -1.224769, -1.953353, 0.0627451, 1, 0, 1,
-0.3764275, 0.3169529, -0.6275762, 0.05490196, 1, 0, 1,
-0.3748621, -1.015179, -2.226947, 0.05098039, 1, 0, 1,
-0.3729287, -0.2981771, -2.966102, 0.04313726, 1, 0, 1,
-0.3709115, -0.3266806, -1.316332, 0.03921569, 1, 0, 1,
-0.3645581, 0.8590059, -1.097825, 0.03137255, 1, 0, 1,
-0.3622753, 0.6306774, -0.5275223, 0.02745098, 1, 0, 1,
-0.3617613, 0.9092353, -0.4841182, 0.01960784, 1, 0, 1,
-0.3598609, -0.5467203, -3.121937, 0.01568628, 1, 0, 1,
-0.3563113, -0.3979548, -2.753353, 0.007843138, 1, 0, 1,
-0.3553372, 0.2340554, -1.79671, 0.003921569, 1, 0, 1,
-0.3532984, -0.7127094, -1.727512, 0, 1, 0.003921569, 1,
-0.3492028, -0.1724874, -0.9483604, 0, 1, 0.01176471, 1,
-0.3470153, 2.112958, 2.337067, 0, 1, 0.01568628, 1,
-0.3462698, -0.9889308, -3.271319, 0, 1, 0.02352941, 1,
-0.344514, 0.1817438, -1.016993, 0, 1, 0.02745098, 1,
-0.339259, 0.2072695, -1.540308, 0, 1, 0.03529412, 1,
-0.3372181, 0.491007, 0.758907, 0, 1, 0.03921569, 1,
-0.334032, 1.109765, -0.565346, 0, 1, 0.04705882, 1,
-0.3319694, 1.185899, -1.375353, 0, 1, 0.05098039, 1,
-0.3302865, -1.786915, -3.269508, 0, 1, 0.05882353, 1,
-0.3248363, -1.184183, -2.173281, 0, 1, 0.0627451, 1,
-0.3224958, -1.802399, -3.544123, 0, 1, 0.07058824, 1,
-0.3192932, -2.320194, -2.52821, 0, 1, 0.07450981, 1,
-0.3185309, 0.1492853, -2.709249, 0, 1, 0.08235294, 1,
-0.3180924, 2.020145, -0.3284715, 0, 1, 0.08627451, 1,
-0.3166512, 1.379557, 0.7041357, 0, 1, 0.09411765, 1,
-0.3108475, 0.363784, -0.3898598, 0, 1, 0.1019608, 1,
-0.3047478, 0.4764932, 0.8288057, 0, 1, 0.1058824, 1,
-0.3043172, -1.634742, -3.046067, 0, 1, 0.1137255, 1,
-0.3020156, -0.263781, -2.725482, 0, 1, 0.1176471, 1,
-0.3017233, 0.8920426, 0.8661876, 0, 1, 0.1254902, 1,
-0.2990134, -1.008467, -3.076733, 0, 1, 0.1294118, 1,
-0.2978329, 1.988487, -1.568589, 0, 1, 0.1372549, 1,
-0.2924263, 0.3142742, 0.4717598, 0, 1, 0.1411765, 1,
-0.2919715, 0.8220759, 0.6113292, 0, 1, 0.1490196, 1,
-0.2878749, -1.497917, -0.9706092, 0, 1, 0.1529412, 1,
-0.2869979, 0.455716, 1.599528, 0, 1, 0.1607843, 1,
-0.2861496, -0.1422459, -0.6968389, 0, 1, 0.1647059, 1,
-0.2855705, -1.488839, -2.325767, 0, 1, 0.172549, 1,
-0.2847202, -0.3202695, -2.915161, 0, 1, 0.1764706, 1,
-0.2845839, -0.7260613, -3.471936, 0, 1, 0.1843137, 1,
-0.2806057, -0.3628236, -5.191516, 0, 1, 0.1882353, 1,
-0.279936, -0.6486051, -1.579459, 0, 1, 0.1960784, 1,
-0.2795634, -0.8174292, -1.431038, 0, 1, 0.2039216, 1,
-0.2741576, -0.8600906, -1.666529, 0, 1, 0.2078431, 1,
-0.270829, -0.5604027, -2.905157, 0, 1, 0.2156863, 1,
-0.2658686, -0.3925657, -3.685679, 0, 1, 0.2196078, 1,
-0.2643489, -1.220592, -3.145441, 0, 1, 0.227451, 1,
-0.2599496, 1.155315, -2.633322, 0, 1, 0.2313726, 1,
-0.259889, -1.402143, -3.196635, 0, 1, 0.2392157, 1,
-0.2559479, 2.200684, -1.858492, 0, 1, 0.2431373, 1,
-0.2546875, 0.9359916, -1.535002, 0, 1, 0.2509804, 1,
-0.2524081, -0.8129249, -2.507309, 0, 1, 0.254902, 1,
-0.248679, 0.01578024, -1.815406, 0, 1, 0.2627451, 1,
-0.2411012, 0.8593282, -1.786057, 0, 1, 0.2666667, 1,
-0.2367163, -0.08314288, -2.016967, 0, 1, 0.2745098, 1,
-0.235116, -0.4731079, -3.308816, 0, 1, 0.2784314, 1,
-0.2323516, -1.05867, -2.246466, 0, 1, 0.2862745, 1,
-0.2289173, -0.7199361, -1.58147, 0, 1, 0.2901961, 1,
-0.2229014, -0.1381804, -1.117219, 0, 1, 0.2980392, 1,
-0.2210571, 0.6360429, -1.035491, 0, 1, 0.3058824, 1,
-0.2097283, 1.478153, -0.632363, 0, 1, 0.3098039, 1,
-0.2083844, -0.5643284, -3.660954, 0, 1, 0.3176471, 1,
-0.2033149, -0.5932203, -2.311678, 0, 1, 0.3215686, 1,
-0.1938098, -1.374037, -5.1552, 0, 1, 0.3294118, 1,
-0.1926785, -0.7210361, -1.644309, 0, 1, 0.3333333, 1,
-0.1904152, -0.07534838, -3.107616, 0, 1, 0.3411765, 1,
-0.1874741, 0.2400296, 1.273374, 0, 1, 0.345098, 1,
-0.1869116, 0.4484964, -0.6873463, 0, 1, 0.3529412, 1,
-0.1771386, -0.2753239, -1.837788, 0, 1, 0.3568628, 1,
-0.1770749, 1.069968, -0.7169689, 0, 1, 0.3647059, 1,
-0.172392, -0.3094216, -3.842514, 0, 1, 0.3686275, 1,
-0.1704994, -0.6162287, -3.123923, 0, 1, 0.3764706, 1,
-0.1703706, 1.896318, 0.1667849, 0, 1, 0.3803922, 1,
-0.1665505, 1.801812, 0.144996, 0, 1, 0.3882353, 1,
-0.1655129, 0.4186688, -0.2211585, 0, 1, 0.3921569, 1,
-0.1650272, -0.2441663, -2.299752, 0, 1, 0.4, 1,
-0.1633266, 0.5288498, -1.232601, 0, 1, 0.4078431, 1,
-0.160927, -0.1632376, -4.57797, 0, 1, 0.4117647, 1,
-0.160471, 1.140785, -0.5309456, 0, 1, 0.4196078, 1,
-0.1581557, 1.149056, -2.924283, 0, 1, 0.4235294, 1,
-0.1574612, -0.06930421, -3.322739, 0, 1, 0.4313726, 1,
-0.1544621, -0.2737952, -2.280744, 0, 1, 0.4352941, 1,
-0.1514607, -1.170733, -0.9519084, 0, 1, 0.4431373, 1,
-0.1501444, 1.494174, -1.274786, 0, 1, 0.4470588, 1,
-0.1499788, -0.1962308, -4.179749, 0, 1, 0.454902, 1,
-0.1451804, -1.21876, -2.021173, 0, 1, 0.4588235, 1,
-0.1431626, -0.2429046, -2.932771, 0, 1, 0.4666667, 1,
-0.1392211, -0.128357, -1.82226, 0, 1, 0.4705882, 1,
-0.1389368, 0.2186449, 0.06998739, 0, 1, 0.4784314, 1,
-0.1364135, -1.299186, -3.209406, 0, 1, 0.4823529, 1,
-0.1334628, -1.515015, -2.68146, 0, 1, 0.4901961, 1,
-0.1293817, 1.336808, 1.368143, 0, 1, 0.4941176, 1,
-0.1291623, 0.6174643, -0.6805909, 0, 1, 0.5019608, 1,
-0.127967, 0.5298591, -1.016647, 0, 1, 0.509804, 1,
-0.1247937, -1.051481, -3.151681, 0, 1, 0.5137255, 1,
-0.1182783, 0.5215963, -2.383932, 0, 1, 0.5215687, 1,
-0.11753, 0.4638536, -1.271351, 0, 1, 0.5254902, 1,
-0.1080869, 0.7133536, -2.187915, 0, 1, 0.5333334, 1,
-0.1071402, 1.418478, -1.008196, 0, 1, 0.5372549, 1,
-0.1058929, 0.01717936, -1.63811, 0, 1, 0.5450981, 1,
-0.1048491, -0.8175644, -1.269159, 0, 1, 0.5490196, 1,
-0.1034554, 1.799708, 1.553984, 0, 1, 0.5568628, 1,
-0.1034049, -0.2661236, -1.874254, 0, 1, 0.5607843, 1,
-0.1032449, -0.05613001, -3.812015, 0, 1, 0.5686275, 1,
-0.09968909, -0.3601473, -2.094544, 0, 1, 0.572549, 1,
-0.09744546, 0.4462596, -0.1896114, 0, 1, 0.5803922, 1,
-0.0970227, -0.8525546, -1.40421, 0, 1, 0.5843138, 1,
-0.09311945, -0.08534911, -3.52065, 0, 1, 0.5921569, 1,
-0.09016394, -1.442918, -3.920766, 0, 1, 0.5960785, 1,
-0.08989353, -1.779742, -3.195513, 0, 1, 0.6039216, 1,
-0.08774135, -0.9863151, -3.84067, 0, 1, 0.6117647, 1,
-0.08718114, -0.447668, -3.601414, 0, 1, 0.6156863, 1,
-0.0862724, 2.1084, -1.858527, 0, 1, 0.6235294, 1,
-0.08580639, -0.2537005, -3.641785, 0, 1, 0.627451, 1,
-0.08323037, 0.3211016, -0.2190937, 0, 1, 0.6352941, 1,
-0.08205154, -0.5464744, -2.104672, 0, 1, 0.6392157, 1,
-0.08073019, -1.082561, -2.750202, 0, 1, 0.6470588, 1,
-0.07769556, -1.274034, -3.002402, 0, 1, 0.6509804, 1,
-0.07700096, 0.7168946, 0.5414278, 0, 1, 0.6588235, 1,
-0.07057322, -1.16964, -1.356555, 0, 1, 0.6627451, 1,
-0.06995681, 0.1820846, -0.3278525, 0, 1, 0.6705883, 1,
-0.06967053, -0.4297646, -2.963942, 0, 1, 0.6745098, 1,
-0.06906907, -0.4008429, -4.195238, 0, 1, 0.682353, 1,
-0.06371254, -0.1847625, -2.386616, 0, 1, 0.6862745, 1,
-0.05251224, 0.8397405, 0.6639531, 0, 1, 0.6941177, 1,
-0.04727165, 1.229675, -0.5700462, 0, 1, 0.7019608, 1,
-0.04476355, -0.03924798, -2.353649, 0, 1, 0.7058824, 1,
-0.04320325, -1.148752, -2.160612, 0, 1, 0.7137255, 1,
-0.04109915, 0.128053, -0.4072544, 0, 1, 0.7176471, 1,
-0.0388965, 1.114803, 2.187235, 0, 1, 0.7254902, 1,
-0.0382142, -1.348616, -4.03839, 0, 1, 0.7294118, 1,
-0.03648307, -0.8726068, -2.738401, 0, 1, 0.7372549, 1,
-0.03613765, -0.8965911, -3.110761, 0, 1, 0.7411765, 1,
-0.03591241, 1.557803, 0.4768255, 0, 1, 0.7490196, 1,
-0.03452011, 1.299414, 0.03826426, 0, 1, 0.7529412, 1,
-0.0315707, 0.5663208, -0.6551653, 0, 1, 0.7607843, 1,
-0.03015129, 0.5298998, -0.2756023, 0, 1, 0.7647059, 1,
-0.02098197, -0.03868955, -2.91333, 0, 1, 0.772549, 1,
-0.01810583, 1.165819, 0.06553354, 0, 1, 0.7764706, 1,
-0.01735679, 0.01121595, 0.2984965, 0, 1, 0.7843137, 1,
-0.0151387, -1.055594, -3.407529, 0, 1, 0.7882353, 1,
-0.01285846, 1.243646, 0.8731423, 0, 1, 0.7960784, 1,
-0.01167272, 0.2550327, 0.4341027, 0, 1, 0.8039216, 1,
-0.00328011, -0.4254318, -3.27932, 0, 1, 0.8078431, 1,
0.003616429, 1.209187, -2.345809, 0, 1, 0.8156863, 1,
0.00597383, -1.39326, 3.407019, 0, 1, 0.8196079, 1,
0.007463177, -0.2253324, 2.296969, 0, 1, 0.827451, 1,
0.008695916, 0.3512727, 0.4613764, 0, 1, 0.8313726, 1,
0.01312776, 1.271655, 0.1840113, 0, 1, 0.8392157, 1,
0.01532187, 0.4546896, 1.744409, 0, 1, 0.8431373, 1,
0.01908204, 0.7689506, -1.105608, 0, 1, 0.8509804, 1,
0.02013707, 0.6987243, -0.844111, 0, 1, 0.854902, 1,
0.02038394, 0.2690707, 0.3151622, 0, 1, 0.8627451, 1,
0.0229457, -1.357223, 1.982392, 0, 1, 0.8666667, 1,
0.02377204, 2.709027, -0.6919927, 0, 1, 0.8745098, 1,
0.03013112, 0.1084777, 3.291032, 0, 1, 0.8784314, 1,
0.03291159, -0.9996425, 3.717577, 0, 1, 0.8862745, 1,
0.03292238, 0.6899253, -0.05997265, 0, 1, 0.8901961, 1,
0.03999063, 1.322822, 0.2639271, 0, 1, 0.8980392, 1,
0.04028744, -0.2023494, 2.558399, 0, 1, 0.9058824, 1,
0.04263833, -0.3186562, 4.012121, 0, 1, 0.9098039, 1,
0.05075689, 0.1623365, -0.3908075, 0, 1, 0.9176471, 1,
0.0512176, -0.725764, 2.883867, 0, 1, 0.9215686, 1,
0.05165703, -0.2915193, 4.072083, 0, 1, 0.9294118, 1,
0.05502105, 0.1849771, -0.5438131, 0, 1, 0.9333333, 1,
0.0562232, 0.2380108, -1.995462, 0, 1, 0.9411765, 1,
0.05938971, -0.8086479, 3.266543, 0, 1, 0.945098, 1,
0.06276973, -0.2328116, 2.321207, 0, 1, 0.9529412, 1,
0.06828751, -1.080424, 2.361931, 0, 1, 0.9568627, 1,
0.06973211, 0.3129722, -0.2212928, 0, 1, 0.9647059, 1,
0.07208966, 0.04050798, 1.564449, 0, 1, 0.9686275, 1,
0.07310399, -1.524831, 3.020065, 0, 1, 0.9764706, 1,
0.07492241, 1.698899, 1.135782, 0, 1, 0.9803922, 1,
0.0750324, 1.12576, 1.231486, 0, 1, 0.9882353, 1,
0.07818469, -1.584572, 3.411485, 0, 1, 0.9921569, 1,
0.07855799, 0.5451054, -0.8594447, 0, 1, 1, 1,
0.07994852, 0.6109778, 1.210471, 0, 0.9921569, 1, 1,
0.08065052, -0.7670884, 2.747634, 0, 0.9882353, 1, 1,
0.08810647, 0.7757393, 0.5098808, 0, 0.9803922, 1, 1,
0.09102014, 1.272682, 0.08034471, 0, 0.9764706, 1, 1,
0.09813313, -1.150611, 3.267903, 0, 0.9686275, 1, 1,
0.09864333, 0.3037596, 0.3819857, 0, 0.9647059, 1, 1,
0.1046028, 0.2027805, -1.252915, 0, 0.9568627, 1, 1,
0.1054321, 0.1493294, 1.224611, 0, 0.9529412, 1, 1,
0.1065768, 1.341468, 0.398396, 0, 0.945098, 1, 1,
0.1066113, -0.4973455, 4.155852, 0, 0.9411765, 1, 1,
0.1182928, -1.461966, 1.262833, 0, 0.9333333, 1, 1,
0.1184003, 0.3489828, 0.2759497, 0, 0.9294118, 1, 1,
0.1260532, 0.3250131, 0.8753011, 0, 0.9215686, 1, 1,
0.1275151, 0.6382101, -0.1872087, 0, 0.9176471, 1, 1,
0.1303145, 0.6071301, 0.6948332, 0, 0.9098039, 1, 1,
0.1352279, -0.4996227, 3.614392, 0, 0.9058824, 1, 1,
0.1372973, 0.6286582, -1.45869, 0, 0.8980392, 1, 1,
0.1477707, -0.1017739, 3.600707, 0, 0.8901961, 1, 1,
0.1482808, 1.877468, 0.349355, 0, 0.8862745, 1, 1,
0.1555923, -0.4088144, 4.004216, 0, 0.8784314, 1, 1,
0.157761, -1.430454, 3.017755, 0, 0.8745098, 1, 1,
0.1578472, -0.6221076, 3.285591, 0, 0.8666667, 1, 1,
0.1599033, -1.231597, 2.316042, 0, 0.8627451, 1, 1,
0.1604044, 0.5677198, 1.725442, 0, 0.854902, 1, 1,
0.1607423, -0.197881, 3.401015, 0, 0.8509804, 1, 1,
0.1617231, -1.21999, 1.79831, 0, 0.8431373, 1, 1,
0.1640994, -0.3863723, 3.231518, 0, 0.8392157, 1, 1,
0.1667284, -1.293651, 1.746925, 0, 0.8313726, 1, 1,
0.1670414, 1.110462, -0.6081417, 0, 0.827451, 1, 1,
0.1673993, 0.6943326, -0.3456646, 0, 0.8196079, 1, 1,
0.171556, -0.02239472, 3.446716, 0, 0.8156863, 1, 1,
0.1735431, -1.747803, 2.240026, 0, 0.8078431, 1, 1,
0.1760798, 1.206887, 0.7716283, 0, 0.8039216, 1, 1,
0.1784189, 0.4453906, -0.4768351, 0, 0.7960784, 1, 1,
0.1796146, 1.872044, -0.9114643, 0, 0.7882353, 1, 1,
0.1800496, -0.8280107, 2.764055, 0, 0.7843137, 1, 1,
0.1829347, -0.4414376, 2.405814, 0, 0.7764706, 1, 1,
0.1840432, -0.4652953, 1.537618, 0, 0.772549, 1, 1,
0.1872872, 1.465632, -0.2930959, 0, 0.7647059, 1, 1,
0.1931621, -0.8045908, 1.578009, 0, 0.7607843, 1, 1,
0.1962736, -0.3939231, 3.698377, 0, 0.7529412, 1, 1,
0.1966798, 0.8261421, 0.339872, 0, 0.7490196, 1, 1,
0.1968267, -2.054363, 1.658678, 0, 0.7411765, 1, 1,
0.2014672, 1.726406, 0.07878565, 0, 0.7372549, 1, 1,
0.2022164, 0.7458758, -0.05822404, 0, 0.7294118, 1, 1,
0.202512, 0.2796708, -1.439425, 0, 0.7254902, 1, 1,
0.2109399, -0.7817714, 3.572503, 0, 0.7176471, 1, 1,
0.2157883, -0.5495421, 3.318508, 0, 0.7137255, 1, 1,
0.2238259, -2.543622, 2.554454, 0, 0.7058824, 1, 1,
0.2300711, 0.5313013, 1.509728, 0, 0.6980392, 1, 1,
0.2302004, -1.118755, 1.876045, 0, 0.6941177, 1, 1,
0.2347072, -0.9231248, 2.599602, 0, 0.6862745, 1, 1,
0.2349505, 0.7097871, 1.493298, 0, 0.682353, 1, 1,
0.2349963, 1.954138, -1.157222, 0, 0.6745098, 1, 1,
0.2361296, 0.327242, 0.3575777, 0, 0.6705883, 1, 1,
0.2386621, 1.574876, 0.3916088, 0, 0.6627451, 1, 1,
0.238775, 0.5759701, 1.034664, 0, 0.6588235, 1, 1,
0.2388921, -0.6872886, 4.700191, 0, 0.6509804, 1, 1,
0.2406747, -0.4408596, 2.491015, 0, 0.6470588, 1, 1,
0.2416716, 2.470051, -0.6214182, 0, 0.6392157, 1, 1,
0.244057, -0.1971003, 1.267925, 0, 0.6352941, 1, 1,
0.2455883, 1.860005, -0.6461529, 0, 0.627451, 1, 1,
0.249561, -0.08466823, 2.942601, 0, 0.6235294, 1, 1,
0.2538327, 0.6104497, 0.5874123, 0, 0.6156863, 1, 1,
0.2556953, 0.468195, 1.414637, 0, 0.6117647, 1, 1,
0.257766, 1.45594, -0.5808548, 0, 0.6039216, 1, 1,
0.2586392, -0.9764436, 4.478055, 0, 0.5960785, 1, 1,
0.2600079, 0.5139199, 0.1205127, 0, 0.5921569, 1, 1,
0.2605172, -0.3699097, 1.754098, 0, 0.5843138, 1, 1,
0.2640584, 0.1544014, -0.4747557, 0, 0.5803922, 1, 1,
0.2664561, -0.8455014, 4.439918, 0, 0.572549, 1, 1,
0.2703532, -0.4559856, 3.449458, 0, 0.5686275, 1, 1,
0.2722753, -0.3632521, 3.20437, 0, 0.5607843, 1, 1,
0.2727427, 0.3989305, 0.6613722, 0, 0.5568628, 1, 1,
0.2774571, 0.3623493, -0.3721887, 0, 0.5490196, 1, 1,
0.2792735, 0.5534069, 1.08928, 0, 0.5450981, 1, 1,
0.2797092, 0.7707051, 0.2502654, 0, 0.5372549, 1, 1,
0.2828989, 0.7213588, 1.392156, 0, 0.5333334, 1, 1,
0.2830699, 0.279103, 1.180177, 0, 0.5254902, 1, 1,
0.2844056, 1.891915, 0.01605659, 0, 0.5215687, 1, 1,
0.2850854, 0.9598444, -1.314903, 0, 0.5137255, 1, 1,
0.2868799, 0.4443791, 0.7588825, 0, 0.509804, 1, 1,
0.2871882, 0.2128978, 0.7158374, 0, 0.5019608, 1, 1,
0.2875145, -0.3917655, 1.222899, 0, 0.4941176, 1, 1,
0.2889479, -0.8419102, 3.888634, 0, 0.4901961, 1, 1,
0.2921842, 1.249092, 0.5548787, 0, 0.4823529, 1, 1,
0.2957855, -0.1734032, 0.9896541, 0, 0.4784314, 1, 1,
0.2978478, -0.5813244, 2.619755, 0, 0.4705882, 1, 1,
0.299582, 1.408485, 0.911126, 0, 0.4666667, 1, 1,
0.2997268, -1.463139, 2.109039, 0, 0.4588235, 1, 1,
0.3001016, -1.021563, 2.905786, 0, 0.454902, 1, 1,
0.3001651, 0.01446057, 2.411705, 0, 0.4470588, 1, 1,
0.3017242, 0.2028295, 2.163591, 0, 0.4431373, 1, 1,
0.3027673, -0.3171324, 2.971815, 0, 0.4352941, 1, 1,
0.3046238, -0.1320397, 1.788461, 0, 0.4313726, 1, 1,
0.3046793, -0.3161894, 0.2210721, 0, 0.4235294, 1, 1,
0.3053291, -0.3468561, 2.616649, 0, 0.4196078, 1, 1,
0.3055664, 1.404225, 1.097112, 0, 0.4117647, 1, 1,
0.3100421, 0.6684687, 0.2747725, 0, 0.4078431, 1, 1,
0.31094, -1.144058, 3.953845, 0, 0.4, 1, 1,
0.3111601, -0.2359579, 2.4366, 0, 0.3921569, 1, 1,
0.3121108, -1.334936, 3.457643, 0, 0.3882353, 1, 1,
0.3151192, -2.338688, 2.226937, 0, 0.3803922, 1, 1,
0.3174797, -2.787756, 2.070511, 0, 0.3764706, 1, 1,
0.319153, 1.689357, -1.355076, 0, 0.3686275, 1, 1,
0.3196751, -0.7131206, 2.433748, 0, 0.3647059, 1, 1,
0.321614, 1.441018, 0.1648084, 0, 0.3568628, 1, 1,
0.3229896, 0.7996507, 0.3433509, 0, 0.3529412, 1, 1,
0.3297287, -0.2740137, 1.654, 0, 0.345098, 1, 1,
0.3359589, 0.4060093, 0.6843004, 0, 0.3411765, 1, 1,
0.3405399, 0.4235948, 0.814288, 0, 0.3333333, 1, 1,
0.34091, -1.574718, 3.678569, 0, 0.3294118, 1, 1,
0.3410517, -1.223639, 4.384847, 0, 0.3215686, 1, 1,
0.3457933, -0.8768905, 1.811644, 0, 0.3176471, 1, 1,
0.3468888, 0.9615691, 2.453442, 0, 0.3098039, 1, 1,
0.3471606, 0.3751483, 0.2671396, 0, 0.3058824, 1, 1,
0.3486623, -0.5139382, 1.883016, 0, 0.2980392, 1, 1,
0.3493067, -0.3099471, 2.68848, 0, 0.2901961, 1, 1,
0.3507506, 0.06360596, 2.445155, 0, 0.2862745, 1, 1,
0.3569529, -1.110347, 3.351429, 0, 0.2784314, 1, 1,
0.3611495, 0.882039, 1.763143, 0, 0.2745098, 1, 1,
0.3611647, -1.39908, 4.423317, 0, 0.2666667, 1, 1,
0.3616776, -0.8075231, 2.117134, 0, 0.2627451, 1, 1,
0.3632247, 0.4882832, -0.1168508, 0, 0.254902, 1, 1,
0.3653424, -0.6576497, 0.7086858, 0, 0.2509804, 1, 1,
0.3657416, -1.058568, 2.46455, 0, 0.2431373, 1, 1,
0.3693348, -0.222161, 2.418583, 0, 0.2392157, 1, 1,
0.37172, -0.7123876, 1.706688, 0, 0.2313726, 1, 1,
0.3722106, -1.498595, 2.408076, 0, 0.227451, 1, 1,
0.376159, -0.06564554, 0.5982679, 0, 0.2196078, 1, 1,
0.3762749, 0.2030292, -1.221633, 0, 0.2156863, 1, 1,
0.3783935, -0.5162535, 2.057688, 0, 0.2078431, 1, 1,
0.3784558, 0.8121506, 0.5043352, 0, 0.2039216, 1, 1,
0.3799131, 0.1686529, 2.265945, 0, 0.1960784, 1, 1,
0.3824039, 0.09541616, 3.103599, 0, 0.1882353, 1, 1,
0.3843403, -1.062643, 2.478959, 0, 0.1843137, 1, 1,
0.3860136, -0.8112402, 3.744148, 0, 0.1764706, 1, 1,
0.3882146, -1.685211, 2.424542, 0, 0.172549, 1, 1,
0.3907378, 0.5048585, 0.1876746, 0, 0.1647059, 1, 1,
0.3953362, -0.8264913, 4.11671, 0, 0.1607843, 1, 1,
0.3994459, -0.717793, 1.381799, 0, 0.1529412, 1, 1,
0.4009318, -0.3120078, 2.065402, 0, 0.1490196, 1, 1,
0.4036558, 1.000231, 1.591291, 0, 0.1411765, 1, 1,
0.4040452, -1.362947, 1.946727, 0, 0.1372549, 1, 1,
0.4055901, 0.7085363, -1.573764, 0, 0.1294118, 1, 1,
0.4093659, -0.2972611, 3.195227, 0, 0.1254902, 1, 1,
0.4114419, 0.7473941, 1.625586, 0, 0.1176471, 1, 1,
0.4184606, 0.05753497, 1.245803, 0, 0.1137255, 1, 1,
0.4219114, 0.4260481, 0.1449873, 0, 0.1058824, 1, 1,
0.424025, 0.2796066, 0.6547318, 0, 0.09803922, 1, 1,
0.4256054, -0.5088569, 1.89184, 0, 0.09411765, 1, 1,
0.4315078, 0.2305521, 3.345448, 0, 0.08627451, 1, 1,
0.4319818, -1.939585, 3.429602, 0, 0.08235294, 1, 1,
0.434287, 0.6181853, -1.937249, 0, 0.07450981, 1, 1,
0.4354488, -1.076257, 3.272755, 0, 0.07058824, 1, 1,
0.4358377, -0.7055067, 3.793544, 0, 0.0627451, 1, 1,
0.4405421, 0.2044691, 1.562583, 0, 0.05882353, 1, 1,
0.4429306, -1.088547, 2.309715, 0, 0.05098039, 1, 1,
0.4455947, -0.2557192, 0.5290169, 0, 0.04705882, 1, 1,
0.4497935, -0.8836227, 3.144409, 0, 0.03921569, 1, 1,
0.4533875, 0.7414963, -1.294974, 0, 0.03529412, 1, 1,
0.4546216, 0.4572687, -0.3566498, 0, 0.02745098, 1, 1,
0.4596785, 0.9591191, -0.4561843, 0, 0.02352941, 1, 1,
0.4603112, 1.319422, 1.008952, 0, 0.01568628, 1, 1,
0.4667192, 0.5220636, 0.4474787, 0, 0.01176471, 1, 1,
0.4675457, 0.3067789, 2.416367, 0, 0.003921569, 1, 1,
0.4743248, 1.17748, -0.6235263, 0.003921569, 0, 1, 1,
0.474508, -0.4181571, 3.027395, 0.007843138, 0, 1, 1,
0.4778318, 1.643564, 0.7033718, 0.01568628, 0, 1, 1,
0.4799606, 0.8507629, 1.149073, 0.01960784, 0, 1, 1,
0.4806842, -0.07823253, 1.539625, 0.02745098, 0, 1, 1,
0.4812624, -0.2586375, 1.755008, 0.03137255, 0, 1, 1,
0.4844036, 0.9918512, 2.795074, 0.03921569, 0, 1, 1,
0.4892691, -0.2047245, 4.772746, 0.04313726, 0, 1, 1,
0.4897532, 1.025278, -0.2316292, 0.05098039, 0, 1, 1,
0.491192, -1.126021, 1.865148, 0.05490196, 0, 1, 1,
0.4916266, 1.774711, 0.8221198, 0.0627451, 0, 1, 1,
0.4975236, -0.7182952, 1.434772, 0.06666667, 0, 1, 1,
0.4978514, 0.9084802, 0.8042626, 0.07450981, 0, 1, 1,
0.4989998, -0.3065865, 1.60355, 0.07843138, 0, 1, 1,
0.5017353, -1.14042, 1.483118, 0.08627451, 0, 1, 1,
0.5032551, -0.4557497, 3.163748, 0.09019608, 0, 1, 1,
0.5042191, -0.02799624, 0.4999749, 0.09803922, 0, 1, 1,
0.5055792, -0.1752119, 3.027092, 0.1058824, 0, 1, 1,
0.5088688, -0.7731279, 3.102292, 0.1098039, 0, 1, 1,
0.5139294, -1.336922, 4.016306, 0.1176471, 0, 1, 1,
0.5139515, 1.311429, 0.9892529, 0.1215686, 0, 1, 1,
0.5176483, -0.1793146, 3.687542, 0.1294118, 0, 1, 1,
0.5216161, 0.4870185, 0.4943907, 0.1333333, 0, 1, 1,
0.5239151, 0.9793345, 0.7014658, 0.1411765, 0, 1, 1,
0.5252376, 0.5788829, 0.3311588, 0.145098, 0, 1, 1,
0.5274881, -1.188271, 3.4971, 0.1529412, 0, 1, 1,
0.5286751, 1.492312, 1.150523, 0.1568628, 0, 1, 1,
0.5301683, -0.7843713, 1.442489, 0.1647059, 0, 1, 1,
0.5383326, 0.8950317, 0.840379, 0.1686275, 0, 1, 1,
0.553946, -0.1191587, 0.7757795, 0.1764706, 0, 1, 1,
0.5610223, 0.393439, -0.5811591, 0.1803922, 0, 1, 1,
0.561952, 0.2435573, 3.122777, 0.1882353, 0, 1, 1,
0.5637771, -1.182545, 2.527767, 0.1921569, 0, 1, 1,
0.5645739, -0.8838747, 2.84116, 0.2, 0, 1, 1,
0.5655611, -1.997199, 2.746405, 0.2078431, 0, 1, 1,
0.5697638, 1.71105, -0.08732557, 0.2117647, 0, 1, 1,
0.5723805, -0.3619836, 3.78484, 0.2196078, 0, 1, 1,
0.5725396, -1.635515, 1.748597, 0.2235294, 0, 1, 1,
0.5726803, 1.136112, 1.09551, 0.2313726, 0, 1, 1,
0.5743774, 0.825059, 0.9133162, 0.2352941, 0, 1, 1,
0.5748047, -2.136524, 2.053134, 0.2431373, 0, 1, 1,
0.5769671, -1.205939, 2.702528, 0.2470588, 0, 1, 1,
0.5772648, -1.597604, 3.84545, 0.254902, 0, 1, 1,
0.5791392, -0.3961456, 1.143505, 0.2588235, 0, 1, 1,
0.5807152, -1.444497, 1.377891, 0.2666667, 0, 1, 1,
0.5812225, -1.671337, 2.071405, 0.2705882, 0, 1, 1,
0.5904413, 0.5769889, 0.5576147, 0.2784314, 0, 1, 1,
0.5939836, -1.266205, 3.383781, 0.282353, 0, 1, 1,
0.5959528, -1.371276, 2.506771, 0.2901961, 0, 1, 1,
0.5999384, 0.7799336, 0.918014, 0.2941177, 0, 1, 1,
0.6039333, -0.2919625, 3.629777, 0.3019608, 0, 1, 1,
0.6074732, 1.685995, -0.5429719, 0.3098039, 0, 1, 1,
0.6088636, -1.486763, 1.236374, 0.3137255, 0, 1, 1,
0.6095431, -0.4530377, 1.563091, 0.3215686, 0, 1, 1,
0.6121874, -1.241535, 3.054824, 0.3254902, 0, 1, 1,
0.6126778, -1.067875, 3.854902, 0.3333333, 0, 1, 1,
0.6129977, -0.09952993, 0.5928831, 0.3372549, 0, 1, 1,
0.6141698, 0.5988845, -1.793106, 0.345098, 0, 1, 1,
0.6141868, 0.889197, 2.436602, 0.3490196, 0, 1, 1,
0.6246549, -0.9004826, 0.911459, 0.3568628, 0, 1, 1,
0.6283043, 1.731187, 0.3297449, 0.3607843, 0, 1, 1,
0.6332694, -1.804917, 2.727067, 0.3686275, 0, 1, 1,
0.6360426, 1.010305, -0.8315827, 0.372549, 0, 1, 1,
0.6372722, 0.5114282, 2.891477, 0.3803922, 0, 1, 1,
0.6396478, 2.064963, -0.5536365, 0.3843137, 0, 1, 1,
0.6448353, -0.01066671, 1.114848, 0.3921569, 0, 1, 1,
0.6499202, 0.5830429, 0.2642375, 0.3960784, 0, 1, 1,
0.6541475, 0.4830134, 2.369007, 0.4039216, 0, 1, 1,
0.6559057, -1.172736, 2.768115, 0.4117647, 0, 1, 1,
0.6560039, -0.3639749, 2.58234, 0.4156863, 0, 1, 1,
0.6581554, -0.4351119, 2.406964, 0.4235294, 0, 1, 1,
0.6596728, 0.2509688, 3.06993, 0.427451, 0, 1, 1,
0.6606098, 2.129164, 0.5269624, 0.4352941, 0, 1, 1,
0.6641638, -0.7849818, 2.954418, 0.4392157, 0, 1, 1,
0.6645161, -1.038532, 2.587662, 0.4470588, 0, 1, 1,
0.6658111, 2.075143, 1.521825, 0.4509804, 0, 1, 1,
0.6693881, 2.129441, 0.1938331, 0.4588235, 0, 1, 1,
0.6714011, 0.1299379, 0.3811848, 0.4627451, 0, 1, 1,
0.6736106, -0.3296671, 2.288293, 0.4705882, 0, 1, 1,
0.6751193, 0.7080513, 1.229206, 0.4745098, 0, 1, 1,
0.6752357, -1.120127, 4.652837, 0.4823529, 0, 1, 1,
0.6830093, 0.517463, 1.040313, 0.4862745, 0, 1, 1,
0.6950291, -1.489792, 1.75144, 0.4941176, 0, 1, 1,
0.695569, -0.7365401, 2.728524, 0.5019608, 0, 1, 1,
0.6988561, -0.5583878, 3.233015, 0.5058824, 0, 1, 1,
0.701484, -0.1091452, 1.149389, 0.5137255, 0, 1, 1,
0.7025334, -0.6580923, 1.178181, 0.5176471, 0, 1, 1,
0.702821, -1.800785, 1.227544, 0.5254902, 0, 1, 1,
0.704882, 0.2305504, -0.1067908, 0.5294118, 0, 1, 1,
0.7049409, -0.9723876, 1.531428, 0.5372549, 0, 1, 1,
0.7051299, -2.407136, 2.15316, 0.5411765, 0, 1, 1,
0.7055234, 1.739844, 0.2179321, 0.5490196, 0, 1, 1,
0.7073647, 0.8731654, 0.3674468, 0.5529412, 0, 1, 1,
0.7105101, -1.097606, 3.183645, 0.5607843, 0, 1, 1,
0.7127205, -1.399327, 2.997211, 0.5647059, 0, 1, 1,
0.7130566, 0.973739, 1.160485, 0.572549, 0, 1, 1,
0.7213321, -0.4736742, 2.336882, 0.5764706, 0, 1, 1,
0.7217841, 0.9496461, -0.7635529, 0.5843138, 0, 1, 1,
0.7233219, -0.5638515, 2.074711, 0.5882353, 0, 1, 1,
0.7240043, 1.664595, 0.5861869, 0.5960785, 0, 1, 1,
0.728663, 1.077935, 0.3527227, 0.6039216, 0, 1, 1,
0.7299879, -0.9630471, 4.337083, 0.6078432, 0, 1, 1,
0.7301055, -0.1258848, 0.2954472, 0.6156863, 0, 1, 1,
0.7310863, 0.6867129, -0.08810332, 0.6196079, 0, 1, 1,
0.7327428, 0.321749, 0.8532784, 0.627451, 0, 1, 1,
0.7331741, -0.7547977, -0.03096248, 0.6313726, 0, 1, 1,
0.7340233, 2.481152, 0.5731488, 0.6392157, 0, 1, 1,
0.7359904, -1.564532, 5.069705, 0.6431373, 0, 1, 1,
0.744985, -0.03834061, 0.4153986, 0.6509804, 0, 1, 1,
0.7469993, 0.5526847, 0.900004, 0.654902, 0, 1, 1,
0.749695, -1.381926, 3.52685, 0.6627451, 0, 1, 1,
0.7511118, -1.60239, 3.844249, 0.6666667, 0, 1, 1,
0.7517018, 0.1008476, 0.5179242, 0.6745098, 0, 1, 1,
0.7523422, -0.350206, 1.257787, 0.6784314, 0, 1, 1,
0.7611194, 0.03969185, 1.081977, 0.6862745, 0, 1, 1,
0.7621247, -0.759905, 3.109392, 0.6901961, 0, 1, 1,
0.7658663, -1.208096, 2.656564, 0.6980392, 0, 1, 1,
0.7746158, -1.110536, 5.325652, 0.7058824, 0, 1, 1,
0.7771454, 0.701124, 1.129191, 0.7098039, 0, 1, 1,
0.7786692, -0.983534, 1.024683, 0.7176471, 0, 1, 1,
0.7845255, -0.1939693, 2.485453, 0.7215686, 0, 1, 1,
0.802694, -0.9639644, 3.399851, 0.7294118, 0, 1, 1,
0.8209512, 1.82631, 0.2108563, 0.7333333, 0, 1, 1,
0.823605, 0.6718428, 0.6044045, 0.7411765, 0, 1, 1,
0.8241276, 0.01900359, 2.850724, 0.7450981, 0, 1, 1,
0.8264924, 0.4853375, 1.256874, 0.7529412, 0, 1, 1,
0.8268572, 0.5104382, 2.504065, 0.7568628, 0, 1, 1,
0.8277493, 2.021018, -1.008532, 0.7647059, 0, 1, 1,
0.8304982, 0.5435496, 2.951605, 0.7686275, 0, 1, 1,
0.8327696, 1.05427, 0.7353531, 0.7764706, 0, 1, 1,
0.8359665, -0.5863513, 1.99258, 0.7803922, 0, 1, 1,
0.8366651, 0.4149279, 0.9854072, 0.7882353, 0, 1, 1,
0.8373291, 0.6600512, 1.468472, 0.7921569, 0, 1, 1,
0.8396934, 0.1719418, 0.8781261, 0.8, 0, 1, 1,
0.8417074, 0.1008912, 2.177158, 0.8078431, 0, 1, 1,
0.8531364, -0.46318, 1.778604, 0.8117647, 0, 1, 1,
0.8537518, 1.375701, 0.2026018, 0.8196079, 0, 1, 1,
0.8599468, 0.2777755, 0.06447011, 0.8235294, 0, 1, 1,
0.8756387, -0.6946566, 2.234186, 0.8313726, 0, 1, 1,
0.8761784, -0.3702497, 1.824404, 0.8352941, 0, 1, 1,
0.8824747, 0.2240033, -0.7154566, 0.8431373, 0, 1, 1,
0.8923305, -0.0726975, 1.804967, 0.8470588, 0, 1, 1,
0.8923855, -0.2197329, 1.172877, 0.854902, 0, 1, 1,
0.8974572, -1.410897, 3.625398, 0.8588235, 0, 1, 1,
0.9028789, -0.3272413, 2.349012, 0.8666667, 0, 1, 1,
0.9043484, 0.2919905, 0.9131742, 0.8705882, 0, 1, 1,
0.9100174, 0.5817237, 2.035601, 0.8784314, 0, 1, 1,
0.9130796, -1.265191, 2.786497, 0.8823529, 0, 1, 1,
0.9134196, -1.027192, 0.7808711, 0.8901961, 0, 1, 1,
0.924077, -0.9861889, 3.555635, 0.8941177, 0, 1, 1,
0.9249208, 0.6062799, 0.06535862, 0.9019608, 0, 1, 1,
0.9321244, -0.8615769, 1.501302, 0.9098039, 0, 1, 1,
0.9348133, -1.899334, 1.540579, 0.9137255, 0, 1, 1,
0.9397058, 0.4801391, 1.056139, 0.9215686, 0, 1, 1,
0.9412823, 2.550599, 1.241822, 0.9254902, 0, 1, 1,
0.9437726, -0.1605135, 2.516283, 0.9333333, 0, 1, 1,
0.9467108, -1.731431, 3.185155, 0.9372549, 0, 1, 1,
0.9498168, -0.378555, 1.441575, 0.945098, 0, 1, 1,
0.9632231, 0.08563077, 1.577082, 0.9490196, 0, 1, 1,
0.9687575, -1.741512, 2.669371, 0.9568627, 0, 1, 1,
0.9704012, 1.112052, 0.8319006, 0.9607843, 0, 1, 1,
0.9719203, 1.43926, 0.05493953, 0.9686275, 0, 1, 1,
0.9728748, 0.7126009, 2.469267, 0.972549, 0, 1, 1,
0.9741645, 0.0653239, 2.191777, 0.9803922, 0, 1, 1,
0.9769701, 2.355368, -0.6370119, 0.9843137, 0, 1, 1,
0.9791059, -1.494444, 1.914402, 0.9921569, 0, 1, 1,
0.9792064, 0.3271921, -0.268391, 0.9960784, 0, 1, 1,
0.9815941, 0.5333812, 0.2913911, 1, 0, 0.9960784, 1,
0.9820688, -0.1692739, 1.052819, 1, 0, 0.9882353, 1,
0.9835967, -0.2104372, 2.092186, 1, 0, 0.9843137, 1,
0.9865415, 0.4681363, 0.8284066, 1, 0, 0.9764706, 1,
0.990194, -1.981152, 3.164302, 1, 0, 0.972549, 1,
0.9933115, 1.572737, 0.9914226, 1, 0, 0.9647059, 1,
0.9982414, -0.3854195, 1.164416, 1, 0, 0.9607843, 1,
0.9991388, 0.7912752, 0.114551, 1, 0, 0.9529412, 1,
1.003004, -0.8043898, 1.626529, 1, 0, 0.9490196, 1,
1.005806, 0.778328, 1.220003, 1, 0, 0.9411765, 1,
1.009055, 0.9592463, -1.081608, 1, 0, 0.9372549, 1,
1.009666, -1.638636, 3.870184, 1, 0, 0.9294118, 1,
1.01171, -0.3965292, 4.806702, 1, 0, 0.9254902, 1,
1.012134, -0.2913917, 3.073772, 1, 0, 0.9176471, 1,
1.014476, 1.200358, 1.303485, 1, 0, 0.9137255, 1,
1.024585, -0.33163, 2.948615, 1, 0, 0.9058824, 1,
1.027083, 0.4688242, 0.1216115, 1, 0, 0.9019608, 1,
1.027328, 0.01128845, 1.599302, 1, 0, 0.8941177, 1,
1.037192, 0.3230303, 3.095067, 1, 0, 0.8862745, 1,
1.042973, -0.6845188, 2.038284, 1, 0, 0.8823529, 1,
1.045181, 0.4230916, 0.5453472, 1, 0, 0.8745098, 1,
1.045834, 0.8635265, 1.678423, 1, 0, 0.8705882, 1,
1.055421, 0.01093408, 1.042278, 1, 0, 0.8627451, 1,
1.065824, -1.300488, 2.242926, 1, 0, 0.8588235, 1,
1.066026, 0.8435314, 1.291423, 1, 0, 0.8509804, 1,
1.079084, 1.060191, 0.5680986, 1, 0, 0.8470588, 1,
1.08199, -1.237989, 2.800506, 1, 0, 0.8392157, 1,
1.084595, 0.5478719, 1.656623, 1, 0, 0.8352941, 1,
1.087121, 1.670902, 1.050741, 1, 0, 0.827451, 1,
1.091595, 0.4077991, 0.6361868, 1, 0, 0.8235294, 1,
1.093796, -0.6009074, 0.5901313, 1, 0, 0.8156863, 1,
1.095125, -0.1886247, 1.187545, 1, 0, 0.8117647, 1,
1.097013, -0.1638469, 0.8812155, 1, 0, 0.8039216, 1,
1.104839, -1.224333, 1.614974, 1, 0, 0.7960784, 1,
1.106587, 0.7261045, 2.353385, 1, 0, 0.7921569, 1,
1.11468, -0.1040307, 1.063477, 1, 0, 0.7843137, 1,
1.11498, 1.348809, 0.1904362, 1, 0, 0.7803922, 1,
1.117174, -0.9178554, 1.555125, 1, 0, 0.772549, 1,
1.120106, -0.0875645, 2.517427, 1, 0, 0.7686275, 1,
1.123923, 0.607772, 1.484648, 1, 0, 0.7607843, 1,
1.125189, 0.7248699, 0.8400969, 1, 0, 0.7568628, 1,
1.132089, -0.1843246, 0.1212858, 1, 0, 0.7490196, 1,
1.135791, -0.03831333, 2.252725, 1, 0, 0.7450981, 1,
1.13717, -0.4303218, 1.808208, 1, 0, 0.7372549, 1,
1.140326, 0.4140002, 2.478584, 1, 0, 0.7333333, 1,
1.141512, 0.9002656, 0.71434, 1, 0, 0.7254902, 1,
1.144822, -0.2695993, 1.237527, 1, 0, 0.7215686, 1,
1.154728, -0.7325553, 1.335062, 1, 0, 0.7137255, 1,
1.169958, -0.5437822, 2.017883, 1, 0, 0.7098039, 1,
1.170752, 0.1852883, 1.05183, 1, 0, 0.7019608, 1,
1.177546, 0.4014155, -0.1003547, 1, 0, 0.6941177, 1,
1.204588, 0.3179597, 2.131881, 1, 0, 0.6901961, 1,
1.204892, 0.3776975, 3.130977, 1, 0, 0.682353, 1,
1.20698, -1.122361, 2.545724, 1, 0, 0.6784314, 1,
1.211141, 1.053479, 0.168942, 1, 0, 0.6705883, 1,
1.223717, 0.9695625, 1.007551, 1, 0, 0.6666667, 1,
1.233907, -0.09807264, 1.697052, 1, 0, 0.6588235, 1,
1.233933, 1.077406, 1.317953, 1, 0, 0.654902, 1,
1.242355, -2.19978, 2.000535, 1, 0, 0.6470588, 1,
1.247104, 1.606226, 1.50705, 1, 0, 0.6431373, 1,
1.256375, 0.6603615, 1.132974, 1, 0, 0.6352941, 1,
1.266202, 0.4657172, 0.5794712, 1, 0, 0.6313726, 1,
1.267187, -1.079646, 2.20402, 1, 0, 0.6235294, 1,
1.270883, 0.4880163, -0.3373366, 1, 0, 0.6196079, 1,
1.286836, 1.243858, 1.253354, 1, 0, 0.6117647, 1,
1.286977, -0.5856026, 3.030774, 1, 0, 0.6078432, 1,
1.295408, 0.02834672, 2.644191, 1, 0, 0.6, 1,
1.301551, 1.583313, 0.04687306, 1, 0, 0.5921569, 1,
1.30215, -0.2019455, 0.5253292, 1, 0, 0.5882353, 1,
1.307342, -0.5667275, 3.755434, 1, 0, 0.5803922, 1,
1.309779, 0.5012624, 0.4088247, 1, 0, 0.5764706, 1,
1.309871, -0.7087784, 3.176156, 1, 0, 0.5686275, 1,
1.311654, -0.2544635, 2.934031, 1, 0, 0.5647059, 1,
1.311711, -0.6256464, 1.354388, 1, 0, 0.5568628, 1,
1.3171, -1.29771, 1.167449, 1, 0, 0.5529412, 1,
1.317168, -0.6389413, 1.961671, 1, 0, 0.5450981, 1,
1.322031, -0.2451392, 1.461913, 1, 0, 0.5411765, 1,
1.323409, 0.5718467, 1.999383, 1, 0, 0.5333334, 1,
1.325738, -0.192451, 3.244626, 1, 0, 0.5294118, 1,
1.329722, 0.1807401, 0.7881497, 1, 0, 0.5215687, 1,
1.336643, -0.4945726, 2.022082, 1, 0, 0.5176471, 1,
1.338033, -0.9053345, 3.112991, 1, 0, 0.509804, 1,
1.338273, 0.8758641, 0.3877603, 1, 0, 0.5058824, 1,
1.347056, -0.8323139, 2.393255, 1, 0, 0.4980392, 1,
1.34973, -0.4553368, 1.165417, 1, 0, 0.4901961, 1,
1.351667, 2.321048, 1.569556, 1, 0, 0.4862745, 1,
1.353947, 0.3215999, 0.1763197, 1, 0, 0.4784314, 1,
1.378692, 0.5360492, 0.6516833, 1, 0, 0.4745098, 1,
1.383721, 0.1962067, 1.538212, 1, 0, 0.4666667, 1,
1.39483, -0.2365247, 1.13432, 1, 0, 0.4627451, 1,
1.402644, 1.120634, -1.734843, 1, 0, 0.454902, 1,
1.405182, 0.9021268, 1.073244, 1, 0, 0.4509804, 1,
1.411139, -1.00205, 0.5825417, 1, 0, 0.4431373, 1,
1.451725, 0.9559672, 1.009231, 1, 0, 0.4392157, 1,
1.460708, -1.006253, 1.347888, 1, 0, 0.4313726, 1,
1.461548, 0.5905951, 2.739183, 1, 0, 0.427451, 1,
1.468732, 0.6953897, 0.4970591, 1, 0, 0.4196078, 1,
1.475021, -0.2532326, 2.437891, 1, 0, 0.4156863, 1,
1.484993, -0.4594904, 1.081957, 1, 0, 0.4078431, 1,
1.490098, -1.098317, 2.063747, 1, 0, 0.4039216, 1,
1.493413, 2.299138, 0.9828701, 1, 0, 0.3960784, 1,
1.494158, -0.804391, 2.051767, 1, 0, 0.3882353, 1,
1.495659, -1.305772, 2.067117, 1, 0, 0.3843137, 1,
1.508542, -0.923692, 0.6895669, 1, 0, 0.3764706, 1,
1.526468, 0.5399317, 0.01589938, 1, 0, 0.372549, 1,
1.536301, 0.9892119, 2.254817, 1, 0, 0.3647059, 1,
1.536899, 2.225975, -0.07209515, 1, 0, 0.3607843, 1,
1.536913, 1.236076, 0.9287807, 1, 0, 0.3529412, 1,
1.537086, 0.6291178, 2.059749, 1, 0, 0.3490196, 1,
1.540647, -0.3409578, 1.946336, 1, 0, 0.3411765, 1,
1.550568, 0.8077303, 1.801256, 1, 0, 0.3372549, 1,
1.55571, 0.002873263, 1.007883, 1, 0, 0.3294118, 1,
1.556944, 0.4369216, -0.3319441, 1, 0, 0.3254902, 1,
1.574449, -0.1734968, -0.2151496, 1, 0, 0.3176471, 1,
1.598289, -1.280551, 2.196694, 1, 0, 0.3137255, 1,
1.623895, 0.310128, 1.609629, 1, 0, 0.3058824, 1,
1.634708, -0.1656183, 0.4831339, 1, 0, 0.2980392, 1,
1.64278, 0.8762851, 0.9889113, 1, 0, 0.2941177, 1,
1.651715, -0.5716047, 1.481509, 1, 0, 0.2862745, 1,
1.6821, 2.10522, 0.3001016, 1, 0, 0.282353, 1,
1.693211, -0.4852916, 2.052359, 1, 0, 0.2745098, 1,
1.714245, 0.3243971, 0.7364846, 1, 0, 0.2705882, 1,
1.718886, -0.8223047, 1.495411, 1, 0, 0.2627451, 1,
1.722077, 0.4292866, 1.123709, 1, 0, 0.2588235, 1,
1.723162, 1.752245, 1.700417, 1, 0, 0.2509804, 1,
1.724299, 1.560388, 1.250657, 1, 0, 0.2470588, 1,
1.734792, 0.5628831, 2.308307, 1, 0, 0.2392157, 1,
1.735799, -0.4033878, 0.9862818, 1, 0, 0.2352941, 1,
1.745811, -0.04296741, 0.1430647, 1, 0, 0.227451, 1,
1.767402, 0.5382674, -0.175235, 1, 0, 0.2235294, 1,
1.773878, 1.322877, 0.9396906, 1, 0, 0.2156863, 1,
1.789548, 0.7786933, 2.357278, 1, 0, 0.2117647, 1,
1.805953, 1.692866, 1.814932, 1, 0, 0.2039216, 1,
1.823032, -1.395079, 2.618219, 1, 0, 0.1960784, 1,
1.834067, 0.06023763, 2.176938, 1, 0, 0.1921569, 1,
1.93614, 0.5025144, 1.438959, 1, 0, 0.1843137, 1,
1.961736, -0.694805, 1.066324, 1, 0, 0.1803922, 1,
1.973972, -0.7303373, 3.222977, 1, 0, 0.172549, 1,
1.988478, -0.1812235, 1.788017, 1, 0, 0.1686275, 1,
1.993462, -1.224673, 4.17423, 1, 0, 0.1607843, 1,
2.003521, -0.5577546, 0.6499014, 1, 0, 0.1568628, 1,
2.003916, 0.2744391, 0.04142732, 1, 0, 0.1490196, 1,
2.009267, -0.1914805, 2.220498, 1, 0, 0.145098, 1,
2.026408, -0.1467396, 1.985754, 1, 0, 0.1372549, 1,
2.039507, -1.647243, 4.180397, 1, 0, 0.1333333, 1,
2.049901, -2.143402, 3.838366, 1, 0, 0.1254902, 1,
2.059772, -0.4063277, 1.82791, 1, 0, 0.1215686, 1,
2.086259, -0.7657545, 1.14859, 1, 0, 0.1137255, 1,
2.131818, -2.089245, 2.054579, 1, 0, 0.1098039, 1,
2.170985, -0.8839961, 1.559036, 1, 0, 0.1019608, 1,
2.173668, 2.066478, 1.150575, 1, 0, 0.09411765, 1,
2.174814, 1.791955, 0.1998648, 1, 0, 0.09019608, 1,
2.175638, 1.398819, 0.9915709, 1, 0, 0.08235294, 1,
2.189935, 0.3187696, 2.322204, 1, 0, 0.07843138, 1,
2.292917, -0.4240316, 0.485668, 1, 0, 0.07058824, 1,
2.337762, 0.7674959, 1.693657, 1, 0, 0.06666667, 1,
2.343397, 1.027642, -0.6749781, 1, 0, 0.05882353, 1,
2.36004, -0.4952921, 1.430665, 1, 0, 0.05490196, 1,
2.461527, 0.3212325, 2.028254, 1, 0, 0.04705882, 1,
2.470924, 0.3608671, 0.1635509, 1, 0, 0.04313726, 1,
2.479054, -0.8051926, 0.2755426, 1, 0, 0.03529412, 1,
2.505322, 0.6786072, 3.029631, 1, 0, 0.03137255, 1,
2.897793, -1.254665, 4.412661, 1, 0, 0.02352941, 1,
2.92256, 0.5962493, -0.09802417, 1, 0, 0.01960784, 1,
3.120808, -0.7204566, 3.534308, 1, 0, 0.01176471, 1,
3.37697, -0.2037956, 1.770607, 1, 0, 0.007843138, 1
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
0.2170886, -4.501005, -6.974176, 0, -0.5, 0.5, 0.5,
0.2170886, -4.501005, -6.974176, 1, -0.5, 0.5, 0.5,
0.2170886, -4.501005, -6.974176, 1, 1.5, 0.5, 0.5,
0.2170886, -4.501005, -6.974176, 0, 1.5, 0.5, 0.5
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
-4.013993, -0.3415371, -6.974176, 0, -0.5, 0.5, 0.5,
-4.013993, -0.3415371, -6.974176, 1, -0.5, 0.5, 0.5,
-4.013993, -0.3415371, -6.974176, 1, 1.5, 0.5, 0.5,
-4.013993, -0.3415371, -6.974176, 0, 1.5, 0.5, 0.5
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
-4.013993, -4.501005, 0.06706762, 0, -0.5, 0.5, 0.5,
-4.013993, -4.501005, 0.06706762, 1, -0.5, 0.5, 0.5,
-4.013993, -4.501005, 0.06706762, 1, 1.5, 0.5, 0.5,
-4.013993, -4.501005, 0.06706762, 0, 1.5, 0.5, 0.5
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
-2, -3.541128, -5.349274,
3, -3.541128, -5.349274,
-2, -3.541128, -5.349274,
-2, -3.701107, -5.620091,
-1, -3.541128, -5.349274,
-1, -3.701107, -5.620091,
0, -3.541128, -5.349274,
0, -3.701107, -5.620091,
1, -3.541128, -5.349274,
1, -3.701107, -5.620091,
2, -3.541128, -5.349274,
2, -3.701107, -5.620091,
3, -3.541128, -5.349274,
3, -3.701107, -5.620091
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
-2, -4.021066, -6.161725, 0, -0.5, 0.5, 0.5,
-2, -4.021066, -6.161725, 1, -0.5, 0.5, 0.5,
-2, -4.021066, -6.161725, 1, 1.5, 0.5, 0.5,
-2, -4.021066, -6.161725, 0, 1.5, 0.5, 0.5,
-1, -4.021066, -6.161725, 0, -0.5, 0.5, 0.5,
-1, -4.021066, -6.161725, 1, -0.5, 0.5, 0.5,
-1, -4.021066, -6.161725, 1, 1.5, 0.5, 0.5,
-1, -4.021066, -6.161725, 0, 1.5, 0.5, 0.5,
0, -4.021066, -6.161725, 0, -0.5, 0.5, 0.5,
0, -4.021066, -6.161725, 1, -0.5, 0.5, 0.5,
0, -4.021066, -6.161725, 1, 1.5, 0.5, 0.5,
0, -4.021066, -6.161725, 0, 1.5, 0.5, 0.5,
1, -4.021066, -6.161725, 0, -0.5, 0.5, 0.5,
1, -4.021066, -6.161725, 1, -0.5, 0.5, 0.5,
1, -4.021066, -6.161725, 1, 1.5, 0.5, 0.5,
1, -4.021066, -6.161725, 0, 1.5, 0.5, 0.5,
2, -4.021066, -6.161725, 0, -0.5, 0.5, 0.5,
2, -4.021066, -6.161725, 1, -0.5, 0.5, 0.5,
2, -4.021066, -6.161725, 1, 1.5, 0.5, 0.5,
2, -4.021066, -6.161725, 0, 1.5, 0.5, 0.5,
3, -4.021066, -6.161725, 0, -0.5, 0.5, 0.5,
3, -4.021066, -6.161725, 1, -0.5, 0.5, 0.5,
3, -4.021066, -6.161725, 1, 1.5, 0.5, 0.5,
3, -4.021066, -6.161725, 0, 1.5, 0.5, 0.5
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
-3.03759, -3, -5.349274,
-3.03759, 2, -5.349274,
-3.03759, -3, -5.349274,
-3.200324, -3, -5.620091,
-3.03759, -2, -5.349274,
-3.200324, -2, -5.620091,
-3.03759, -1, -5.349274,
-3.200324, -1, -5.620091,
-3.03759, 0, -5.349274,
-3.200324, 0, -5.620091,
-3.03759, 1, -5.349274,
-3.200324, 1, -5.620091,
-3.03759, 2, -5.349274,
-3.200324, 2, -5.620091
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
-3.525791, -3, -6.161725, 0, -0.5, 0.5, 0.5,
-3.525791, -3, -6.161725, 1, -0.5, 0.5, 0.5,
-3.525791, -3, -6.161725, 1, 1.5, 0.5, 0.5,
-3.525791, -3, -6.161725, 0, 1.5, 0.5, 0.5,
-3.525791, -2, -6.161725, 0, -0.5, 0.5, 0.5,
-3.525791, -2, -6.161725, 1, -0.5, 0.5, 0.5,
-3.525791, -2, -6.161725, 1, 1.5, 0.5, 0.5,
-3.525791, -2, -6.161725, 0, 1.5, 0.5, 0.5,
-3.525791, -1, -6.161725, 0, -0.5, 0.5, 0.5,
-3.525791, -1, -6.161725, 1, -0.5, 0.5, 0.5,
-3.525791, -1, -6.161725, 1, 1.5, 0.5, 0.5,
-3.525791, -1, -6.161725, 0, 1.5, 0.5, 0.5,
-3.525791, 0, -6.161725, 0, -0.5, 0.5, 0.5,
-3.525791, 0, -6.161725, 1, -0.5, 0.5, 0.5,
-3.525791, 0, -6.161725, 1, 1.5, 0.5, 0.5,
-3.525791, 0, -6.161725, 0, 1.5, 0.5, 0.5,
-3.525791, 1, -6.161725, 0, -0.5, 0.5, 0.5,
-3.525791, 1, -6.161725, 1, -0.5, 0.5, 0.5,
-3.525791, 1, -6.161725, 1, 1.5, 0.5, 0.5,
-3.525791, 1, -6.161725, 0, 1.5, 0.5, 0.5,
-3.525791, 2, -6.161725, 0, -0.5, 0.5, 0.5,
-3.525791, 2, -6.161725, 1, -0.5, 0.5, 0.5,
-3.525791, 2, -6.161725, 1, 1.5, 0.5, 0.5,
-3.525791, 2, -6.161725, 0, 1.5, 0.5, 0.5
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
-3.03759, -3.541128, -4,
-3.03759, -3.541128, 4,
-3.03759, -3.541128, -4,
-3.200324, -3.701107, -4,
-3.03759, -3.541128, -2,
-3.200324, -3.701107, -2,
-3.03759, -3.541128, 0,
-3.200324, -3.701107, 0,
-3.03759, -3.541128, 2,
-3.200324, -3.701107, 2,
-3.03759, -3.541128, 4,
-3.200324, -3.701107, 4
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
-3.525791, -4.021066, -4, 0, -0.5, 0.5, 0.5,
-3.525791, -4.021066, -4, 1, -0.5, 0.5, 0.5,
-3.525791, -4.021066, -4, 1, 1.5, 0.5, 0.5,
-3.525791, -4.021066, -4, 0, 1.5, 0.5, 0.5,
-3.525791, -4.021066, -2, 0, -0.5, 0.5, 0.5,
-3.525791, -4.021066, -2, 1, -0.5, 0.5, 0.5,
-3.525791, -4.021066, -2, 1, 1.5, 0.5, 0.5,
-3.525791, -4.021066, -2, 0, 1.5, 0.5, 0.5,
-3.525791, -4.021066, 0, 0, -0.5, 0.5, 0.5,
-3.525791, -4.021066, 0, 1, -0.5, 0.5, 0.5,
-3.525791, -4.021066, 0, 1, 1.5, 0.5, 0.5,
-3.525791, -4.021066, 0, 0, 1.5, 0.5, 0.5,
-3.525791, -4.021066, 2, 0, -0.5, 0.5, 0.5,
-3.525791, -4.021066, 2, 1, -0.5, 0.5, 0.5,
-3.525791, -4.021066, 2, 1, 1.5, 0.5, 0.5,
-3.525791, -4.021066, 2, 0, 1.5, 0.5, 0.5,
-3.525791, -4.021066, 4, 0, -0.5, 0.5, 0.5,
-3.525791, -4.021066, 4, 1, -0.5, 0.5, 0.5,
-3.525791, -4.021066, 4, 1, 1.5, 0.5, 0.5,
-3.525791, -4.021066, 4, 0, 1.5, 0.5, 0.5
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
-3.03759, -3.541128, -5.349274,
-3.03759, 2.858053, -5.349274,
-3.03759, -3.541128, 5.483409,
-3.03759, 2.858053, 5.483409,
-3.03759, -3.541128, -5.349274,
-3.03759, -3.541128, 5.483409,
-3.03759, 2.858053, -5.349274,
-3.03759, 2.858053, 5.483409,
-3.03759, -3.541128, -5.349274,
3.471767, -3.541128, -5.349274,
-3.03759, -3.541128, 5.483409,
3.471767, -3.541128, 5.483409,
-3.03759, 2.858053, -5.349274,
3.471767, 2.858053, -5.349274,
-3.03759, 2.858053, 5.483409,
3.471767, 2.858053, 5.483409,
3.471767, -3.541128, -5.349274,
3.471767, 2.858053, -5.349274,
3.471767, -3.541128, 5.483409,
3.471767, 2.858053, 5.483409,
3.471767, -3.541128, -5.349274,
3.471767, -3.541128, 5.483409,
3.471767, 2.858053, -5.349274,
3.471767, 2.858053, 5.483409
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
var radius = 7.564232;
var distance = 33.65412;
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
mvMatrix.translate( -0.2170886, 0.3415371, -0.06706762 );
mvMatrix.scale( 1.256437, 1.278069, 0.7549926 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.65412);
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
PAL<-read.table("PAL.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-PAL$V2
```

```
## Error in eval(expr, envir, enclos): object 'PAL' not found
```

```r
y<-PAL$V3
```

```
## Error in eval(expr, envir, enclos): object 'PAL' not found
```

```r
z<-PAL$V4
```

```
## Error in eval(expr, envir, enclos): object 'PAL' not found
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
-2.942793, -0.7585338, -2.38991, 0, 0, 1, 1, 1,
-2.91723, 0.05655777, -2.08634, 1, 0, 0, 1, 1,
-2.730946, 2.045114, -1.773078, 1, 0, 0, 1, 1,
-2.516966, 0.2772036, -2.783128, 1, 0, 0, 1, 1,
-2.472088, -1.437918, -2.557841, 1, 0, 0, 1, 1,
-2.364606, 0.319351, -1.15112, 1, 0, 0, 1, 1,
-2.361966, -0.08372207, -0.3784142, 0, 0, 0, 1, 1,
-2.353394, 1.401902, 0.3330353, 0, 0, 0, 1, 1,
-2.342479, 0.02471043, -3.191639, 0, 0, 0, 1, 1,
-2.331087, -0.3590722, -2.949867, 0, 0, 0, 1, 1,
-2.316168, 0.3615756, -1.551286, 0, 0, 0, 1, 1,
-2.282459, 0.01624113, -1.509372, 0, 0, 0, 1, 1,
-2.279976, 0.2141295, -1.733506, 0, 0, 0, 1, 1,
-2.277458, 1.367608, 0.6136139, 1, 1, 1, 1, 1,
-2.270458, 0.3814881, 0.1300455, 1, 1, 1, 1, 1,
-2.207878, 0.5325499, -0.6750546, 1, 1, 1, 1, 1,
-2.184893, -1.001923, -2.031455, 1, 1, 1, 1, 1,
-2.184781, -1.183558, 0.1024624, 1, 1, 1, 1, 1,
-2.096815, 0.4407836, -1.163542, 1, 1, 1, 1, 1,
-2.094307, -0.7508758, -2.640057, 1, 1, 1, 1, 1,
-2.085726, 0.4372934, -0.4507133, 1, 1, 1, 1, 1,
-2.082847, -0.1636562, -1.086027, 1, 1, 1, 1, 1,
-2.035535, -0.31482, -2.313759, 1, 1, 1, 1, 1,
-2.007457, 1.353099, -0.3552711, 1, 1, 1, 1, 1,
-2.005792, -0.08074166, -1.636181, 1, 1, 1, 1, 1,
-2.004847, -0.3057581, -1.470772, 1, 1, 1, 1, 1,
-1.994731, 0.3689924, -2.631673, 1, 1, 1, 1, 1,
-1.951441, -0.9605941, -2.120324, 1, 1, 1, 1, 1,
-1.949818, 0.1810936, -1.349448, 0, 0, 1, 1, 1,
-1.940561, -0.5796435, -0.7729077, 1, 0, 0, 1, 1,
-1.911371, -0.8010226, -2.301658, 1, 0, 0, 1, 1,
-1.905647, -2.453715, -2.848581, 1, 0, 0, 1, 1,
-1.899583, -0.5149759, -2.058588, 1, 0, 0, 1, 1,
-1.887056, 1.171091, -1.875631, 1, 0, 0, 1, 1,
-1.870459, 0.5066297, -3.827676, 0, 0, 0, 1, 1,
-1.848315, -0.02681142, -1.029521, 0, 0, 0, 1, 1,
-1.833922, 0.8741097, -0.9716472, 0, 0, 0, 1, 1,
-1.817371, 0.7966983, -3.596901, 0, 0, 0, 1, 1,
-1.782534, -0.6855888, -0.6463929, 0, 0, 0, 1, 1,
-1.768279, -0.4957395, -2.695021, 0, 0, 0, 1, 1,
-1.752275, 0.3070406, -1.848465, 0, 0, 0, 1, 1,
-1.736616, -1.278709, -1.843148, 1, 1, 1, 1, 1,
-1.718274, -0.547193, -1.420756, 1, 1, 1, 1, 1,
-1.700031, 0.5322294, -3.247445, 1, 1, 1, 1, 1,
-1.692175, 0.9565601, -0.2591929, 1, 1, 1, 1, 1,
-1.669786, 0.4193543, -1.03836, 1, 1, 1, 1, 1,
-1.668557, 0.0325082, -1.193751, 1, 1, 1, 1, 1,
-1.654299, -1.481221, -3.080459, 1, 1, 1, 1, 1,
-1.645259, -0.7301373, -1.881415, 1, 1, 1, 1, 1,
-1.628633, 0.4796727, -1.263397, 1, 1, 1, 1, 1,
-1.613211, -1.858443, -2.896036, 1, 1, 1, 1, 1,
-1.609046, -0.8000129, -1.552683, 1, 1, 1, 1, 1,
-1.600701, 0.3572276, -2.247847, 1, 1, 1, 1, 1,
-1.588998, 1.569811, -2.379155, 1, 1, 1, 1, 1,
-1.58013, 1.48257, -1.92056, 1, 1, 1, 1, 1,
-1.489283, -1.22149, -1.441007, 1, 1, 1, 1, 1,
-1.488419, 0.07747704, -1.93431, 0, 0, 1, 1, 1,
-1.486136, 0.4983145, -3.708173, 1, 0, 0, 1, 1,
-1.433341, 0.7492543, -1.914258, 1, 0, 0, 1, 1,
-1.431032, 1.344927, -1.412565, 1, 0, 0, 1, 1,
-1.43021, 1.605582, 0.7851344, 1, 0, 0, 1, 1,
-1.421252, -3.447936, -2.442786, 1, 0, 0, 1, 1,
-1.42056, -0.2062612, 1.573242, 0, 0, 0, 1, 1,
-1.417268, 1.139414, -0.1787413, 0, 0, 0, 1, 1,
-1.411619, -0.8297849, -2.174258, 0, 0, 0, 1, 1,
-1.397442, -0.4806091, -1.947273, 0, 0, 0, 1, 1,
-1.39468, 0.6707348, -0.9989384, 0, 0, 0, 1, 1,
-1.393117, -0.1053369, -0.6874461, 0, 0, 0, 1, 1,
-1.392794, 0.6315176, -1.082509, 0, 0, 0, 1, 1,
-1.385409, -0.6964999, -2.894666, 1, 1, 1, 1, 1,
-1.377193, 0.6077924, 0.7089022, 1, 1, 1, 1, 1,
-1.372158, -0.1485236, -1.984888, 1, 1, 1, 1, 1,
-1.369386, -0.002856436, -1.865409, 1, 1, 1, 1, 1,
-1.350412, -1.186591, -1.997555, 1, 1, 1, 1, 1,
-1.34985, 0.8028399, -2.093286, 1, 1, 1, 1, 1,
-1.34728, 0.8384482, -0.8973744, 1, 1, 1, 1, 1,
-1.328076, 0.113795, -2.12623, 1, 1, 1, 1, 1,
-1.316503, -1.607303, -1.792605, 1, 1, 1, 1, 1,
-1.290464, -0.3454432, -1.014563, 1, 1, 1, 1, 1,
-1.285707, -1.062055, -2.23954, 1, 1, 1, 1, 1,
-1.28322, 0.4322413, -0.9429495, 1, 1, 1, 1, 1,
-1.272356, 0.1280556, -1.057052, 1, 1, 1, 1, 1,
-1.258461, -0.002244873, -0.4683885, 1, 1, 1, 1, 1,
-1.257352, 0.4528293, -2.100749, 1, 1, 1, 1, 1,
-1.242703, 0.5528716, -2.606852, 0, 0, 1, 1, 1,
-1.231058, -2.712707, -1.902781, 1, 0, 0, 1, 1,
-1.230933, 2.034387, -1.156337, 1, 0, 0, 1, 1,
-1.220302, -0.6204284, -3.174321, 1, 0, 0, 1, 1,
-1.2148, 1.002672, -1.441996, 1, 0, 0, 1, 1,
-1.213413, 0.2091598, -2.726268, 1, 0, 0, 1, 1,
-1.212241, -0.708023, -2.380193, 0, 0, 0, 1, 1,
-1.210738, 0.01189016, -2.845227, 0, 0, 0, 1, 1,
-1.209107, -1.253649, -1.640932, 0, 0, 0, 1, 1,
-1.205619, -0.8339511, -0.6614941, 0, 0, 0, 1, 1,
-1.197363, -0.9227265, -3.72593, 0, 0, 0, 1, 1,
-1.193739, -0.2576447, -1.680987, 0, 0, 0, 1, 1,
-1.192353, 1.49953, -1.436541, 0, 0, 0, 1, 1,
-1.186979, 2.045607, -1.410587, 1, 1, 1, 1, 1,
-1.186169, -1.686588, -2.709183, 1, 1, 1, 1, 1,
-1.185227, 0.05862315, -1.031248, 1, 1, 1, 1, 1,
-1.175897, -0.08379404, -2.588778, 1, 1, 1, 1, 1,
-1.167858, 0.3613813, -1.592346, 1, 1, 1, 1, 1,
-1.165691, 0.4034434, -1.052562, 1, 1, 1, 1, 1,
-1.153701, -0.372243, -3.662786, 1, 1, 1, 1, 1,
-1.151082, 0.5051306, -1.149808, 1, 1, 1, 1, 1,
-1.143897, -1.919922, -4.531709, 1, 1, 1, 1, 1,
-1.141574, 1.528888, -0.6628904, 1, 1, 1, 1, 1,
-1.139298, 1.800769, -0.3607658, 1, 1, 1, 1, 1,
-1.139161, -0.6459743, -1.628063, 1, 1, 1, 1, 1,
-1.137195, 1.72591, -0.6230093, 1, 1, 1, 1, 1,
-1.124876, -0.8587447, -2.500485, 1, 1, 1, 1, 1,
-1.124551, 0.3687991, -2.984774, 1, 1, 1, 1, 1,
-1.124453, 0.8813585, -0.8066683, 0, 0, 1, 1, 1,
-1.088863, 0.5657943, -1.249387, 1, 0, 0, 1, 1,
-1.088391, -1.704041, -3.090368, 1, 0, 0, 1, 1,
-1.088093, 0.8360518, -1.198992, 1, 0, 0, 1, 1,
-1.08193, -1.283752, -0.9606401, 1, 0, 0, 1, 1,
-1.075165, 0.1347571, -1.80621, 1, 0, 0, 1, 1,
-1.068951, -0.7492213, -1.748094, 0, 0, 0, 1, 1,
-1.06489, 0.7787619, -0.6963333, 0, 0, 0, 1, 1,
-1.060907, 0.5311009, -0.8933948, 0, 0, 0, 1, 1,
-1.05877, -1.386607, -1.971371, 0, 0, 0, 1, 1,
-1.057431, 0.7021685, -0.8811572, 0, 0, 0, 1, 1,
-1.05515, -0.6476611, -1.482777, 0, 0, 0, 1, 1,
-1.051636, -0.9723772, -2.673733, 0, 0, 0, 1, 1,
-1.051337, 0.4948212, 1.135346, 1, 1, 1, 1, 1,
-1.033297, -1.262202, -2.807613, 1, 1, 1, 1, 1,
-1.020527, 0.908785, -1.228049, 1, 1, 1, 1, 1,
-1.013021, -0.2657897, -1.275735, 1, 1, 1, 1, 1,
-1.011793, 0.574743, 0.2150993, 1, 1, 1, 1, 1,
-0.9982799, -0.2787143, -1.509646, 1, 1, 1, 1, 1,
-0.997108, 0.318623, -0.8616378, 1, 1, 1, 1, 1,
-0.9919718, 0.211978, -0.5081757, 1, 1, 1, 1, 1,
-0.9778717, -1.240168, -3.331706, 1, 1, 1, 1, 1,
-0.9701172, 2.619515, -1.837533, 1, 1, 1, 1, 1,
-0.9648622, 0.8763344, -0.108281, 1, 1, 1, 1, 1,
-0.9645869, 1.106158, -0.591952, 1, 1, 1, 1, 1,
-0.9601275, -0.02672999, 0.4826222, 1, 1, 1, 1, 1,
-0.9545105, -1.881227, -3.132753, 1, 1, 1, 1, 1,
-0.9491997, -1.347801, -2.545633, 1, 1, 1, 1, 1,
-0.9388463, 1.342067, -0.8013431, 0, 0, 1, 1, 1,
-0.9358522, -0.6752502, -0.6311995, 1, 0, 0, 1, 1,
-0.9294896, 0.8399194, 2.138807, 1, 0, 0, 1, 1,
-0.926596, 0.4711844, -1.761947, 1, 0, 0, 1, 1,
-0.918802, -0.02999265, -0.4177469, 1, 0, 0, 1, 1,
-0.9181966, 1.166934, -0.9604066, 1, 0, 0, 1, 1,
-0.9138637, 0.602066, 0.3880131, 0, 0, 0, 1, 1,
-0.9087316, 0.7752801, -1.910455, 0, 0, 0, 1, 1,
-0.9074448, 1.167067, 0.2727577, 0, 0, 0, 1, 1,
-0.9005064, -0.7810047, -3.122099, 0, 0, 0, 1, 1,
-0.9004781, -0.3821203, -3.282541, 0, 0, 0, 1, 1,
-0.895174, 1.340652, -0.1831787, 0, 0, 0, 1, 1,
-0.891893, 0.1533601, -1.955685, 0, 0, 0, 1, 1,
-0.8901352, 2.06228, -1.61733, 1, 1, 1, 1, 1,
-0.8884611, 0.5084119, -1.887944, 1, 1, 1, 1, 1,
-0.8880339, -0.1376847, -3.410658, 1, 1, 1, 1, 1,
-0.880407, 0.2614417, -1.01839, 1, 1, 1, 1, 1,
-0.880081, 1.480706, -1.294949, 1, 1, 1, 1, 1,
-0.8753064, -0.7424715, 0.2288222, 1, 1, 1, 1, 1,
-0.8735355, 0.8665644, -0.4595315, 1, 1, 1, 1, 1,
-0.868666, -0.4439926, -3.98386, 1, 1, 1, 1, 1,
-0.8671024, 0.4498357, -2.011299, 1, 1, 1, 1, 1,
-0.8649067, 0.1046955, -1.498033, 1, 1, 1, 1, 1,
-0.8639888, -0.1177591, -1.646883, 1, 1, 1, 1, 1,
-0.8614756, 1.251308, -1.764377, 1, 1, 1, 1, 1,
-0.8577712, -0.855583, -3.546477, 1, 1, 1, 1, 1,
-0.8574525, -0.4492784, -1.517789, 1, 1, 1, 1, 1,
-0.8533534, -0.5201719, -1.782437, 1, 1, 1, 1, 1,
-0.853193, -1.401952, -3.745525, 0, 0, 1, 1, 1,
-0.8484805, -0.839411, -1.959655, 1, 0, 0, 1, 1,
-0.8467999, -0.3574612, -3.090951, 1, 0, 0, 1, 1,
-0.8445823, 0.05555858, 0.2999078, 1, 0, 0, 1, 1,
-0.8443928, -1.709284, -2.975635, 1, 0, 0, 1, 1,
-0.8440946, -1.12087, -2.533708, 1, 0, 0, 1, 1,
-0.8398302, -1.34829, -0.8633159, 0, 0, 0, 1, 1,
-0.8342632, -0.5108074, -1.672821, 0, 0, 0, 1, 1,
-0.8331911, -0.1070868, -1.278594, 0, 0, 0, 1, 1,
-0.8269908, 1.548849, -0.1772092, 0, 0, 0, 1, 1,
-0.8269754, 1.162798, -0.7056378, 0, 0, 0, 1, 1,
-0.8192024, 0.01773647, -1.566778, 0, 0, 0, 1, 1,
-0.8185792, 0.330291, 0.1457732, 0, 0, 0, 1, 1,
-0.8175086, -1.391734, -2.825144, 1, 1, 1, 1, 1,
-0.8153929, 0.1369669, -0.4661856, 1, 1, 1, 1, 1,
-0.811464, 0.1472978, -2.34856, 1, 1, 1, 1, 1,
-0.8072299, 1.568321, -0.8867549, 1, 1, 1, 1, 1,
-0.8055834, -0.005198769, -1.535983, 1, 1, 1, 1, 1,
-0.8036231, 0.4697367, -1.874077, 1, 1, 1, 1, 1,
-0.8013369, 0.4621151, -0.7321276, 1, 1, 1, 1, 1,
-0.798695, -1.079352, -4.396142, 1, 1, 1, 1, 1,
-0.7959853, 0.6243382, -1.414902, 1, 1, 1, 1, 1,
-0.7957595, 0.208581, 0.2852451, 1, 1, 1, 1, 1,
-0.7950725, -1.010551, -3.468145, 1, 1, 1, 1, 1,
-0.7932854, 0.6281706, -0.7903014, 1, 1, 1, 1, 1,
-0.7907972, 0.5110118, -1.303928, 1, 1, 1, 1, 1,
-0.7902134, -0.1859592, -2.030568, 1, 1, 1, 1, 1,
-0.7894609, 1.114236, -0.4654372, 1, 1, 1, 1, 1,
-0.78105, 0.08568934, -1.64719, 0, 0, 1, 1, 1,
-0.7810266, -0.2535697, -1.905162, 1, 0, 0, 1, 1,
-0.7697307, -0.6256108, -2.207806, 1, 0, 0, 1, 1,
-0.7646134, 1.618684, 2.389936, 1, 0, 0, 1, 1,
-0.7641271, 0.6972767, -0.1390764, 1, 0, 0, 1, 1,
-0.7640654, 2.404536, 1.039406, 1, 0, 0, 1, 1,
-0.7623065, -1.471075, -2.843913, 0, 0, 0, 1, 1,
-0.7609132, 1.152886, 0.3124571, 0, 0, 0, 1, 1,
-0.7505174, 0.05279876, -0.6664581, 0, 0, 0, 1, 1,
-0.744443, 1.276532, -1.855212, 0, 0, 0, 1, 1,
-0.7427597, -2.483041, -4.642112, 0, 0, 0, 1, 1,
-0.7320502, -0.9289407, -2.786428, 0, 0, 0, 1, 1,
-0.7161788, -0.2975487, -2.813755, 0, 0, 0, 1, 1,
-0.7138349, -0.1902593, -2.48375, 1, 1, 1, 1, 1,
-0.712164, -0.5269101, -2.643365, 1, 1, 1, 1, 1,
-0.7117768, -0.09760312, -3.815058, 1, 1, 1, 1, 1,
-0.7112637, -0.1866014, -2.205813, 1, 1, 1, 1, 1,
-0.7104797, -1.640616, -3.445752, 1, 1, 1, 1, 1,
-0.6997622, 0.05240756, -2.576185, 1, 1, 1, 1, 1,
-0.6960872, -0.4677764, -2.265584, 1, 1, 1, 1, 1,
-0.6869826, 0.5240849, -1.590565, 1, 1, 1, 1, 1,
-0.6831253, -0.8694464, -2.759975, 1, 1, 1, 1, 1,
-0.6822308, 1.331982, -0.9765784, 1, 1, 1, 1, 1,
-0.6816764, 1.901794, 0.5383824, 1, 1, 1, 1, 1,
-0.6807922, -0.2236571, -2.579085, 1, 1, 1, 1, 1,
-0.6800402, -0.4846819, -1.269224, 1, 1, 1, 1, 1,
-0.6727252, 0.6628856, 0.3703822, 1, 1, 1, 1, 1,
-0.6648175, 0.01471471, -2.084735, 1, 1, 1, 1, 1,
-0.6500714, -1.670052, -1.798793, 0, 0, 1, 1, 1,
-0.6456958, 0.4078381, -2.586891, 1, 0, 0, 1, 1,
-0.6439072, -1.081347, -1.364011, 1, 0, 0, 1, 1,
-0.6432578, 0.3846336, -1.264679, 1, 0, 0, 1, 1,
-0.6405827, 1.149905, -0.6225008, 1, 0, 0, 1, 1,
-0.6380221, -0.6093842, -3.396765, 1, 0, 0, 1, 1,
-0.6336401, -0.4999255, -2.860281, 0, 0, 0, 1, 1,
-0.6322078, -2.167969, -2.344712, 0, 0, 0, 1, 1,
-0.6318992, -0.3225057, -2.192386, 0, 0, 0, 1, 1,
-0.6296349, -0.2009557, -2.072549, 0, 0, 0, 1, 1,
-0.6294229, 0.9575794, 0.345151, 0, 0, 0, 1, 1,
-0.6233798, -1.322714, -2.975413, 0, 0, 0, 1, 1,
-0.6219833, 0.7590807, -1.1605, 0, 0, 0, 1, 1,
-0.6218808, -0.8654194, -3.626504, 1, 1, 1, 1, 1,
-0.6210847, -0.6615574, -2.885138, 1, 1, 1, 1, 1,
-0.6182607, 2.120006, -0.7724034, 1, 1, 1, 1, 1,
-0.6163427, 0.1903661, -1.446087, 1, 1, 1, 1, 1,
-0.6120704, 0.8096408, 0.08793783, 1, 1, 1, 1, 1,
-0.6120684, -0.675629, -1.524637, 1, 1, 1, 1, 1,
-0.6108878, 0.4707703, -0.7649835, 1, 1, 1, 1, 1,
-0.6070259, 1.418974, -0.4257355, 1, 1, 1, 1, 1,
-0.6030335, 0.8604679, 0.9407044, 1, 1, 1, 1, 1,
-0.6027765, 0.03127521, -0.2351999, 1, 1, 1, 1, 1,
-0.6013016, -0.313686, -3.698216, 1, 1, 1, 1, 1,
-0.6009106, -0.2002287, -3.657145, 1, 1, 1, 1, 1,
-0.6000574, 1.125863, -0.3596539, 1, 1, 1, 1, 1,
-0.5978499, -0.3105991, -0.9473004, 1, 1, 1, 1, 1,
-0.5894927, -1.897775, -1.754858, 1, 1, 1, 1, 1,
-0.5888651, 0.8714862, 1.228182, 0, 0, 1, 1, 1,
-0.5877703, -1.960433, -3.802336, 1, 0, 0, 1, 1,
-0.5849988, 0.4102131, -1.903743, 1, 0, 0, 1, 1,
-0.5812366, 0.8963974, -1.083641, 1, 0, 0, 1, 1,
-0.5798107, -0.2979811, -2.641768, 1, 0, 0, 1, 1,
-0.5659867, -0.1134134, -2.450516, 1, 0, 0, 1, 1,
-0.5538788, 0.1891064, -0.5468145, 0, 0, 0, 1, 1,
-0.5467061, 1.298579, 1.035816, 0, 0, 0, 1, 1,
-0.5443005, 0.215333, -2.832084, 0, 0, 0, 1, 1,
-0.5394085, 0.4058342, -0.2237931, 0, 0, 0, 1, 1,
-0.5377471, 0.9721675, 0.2404938, 0, 0, 0, 1, 1,
-0.536294, 0.2573366, -1.900095, 0, 0, 0, 1, 1,
-0.5351281, -0.4052828, -2.08636, 0, 0, 0, 1, 1,
-0.5337533, -0.2874142, -1.236517, 1, 1, 1, 1, 1,
-0.5298877, -0.1434313, -4.07018, 1, 1, 1, 1, 1,
-0.529427, 2.764862, -1.211495, 1, 1, 1, 1, 1,
-0.5256512, -0.2334515, -2.893748, 1, 1, 1, 1, 1,
-0.5254068, 0.6322402, 0.9332305, 1, 1, 1, 1, 1,
-0.5251125, -0.6252084, -2.506613, 1, 1, 1, 1, 1,
-0.5245194, -0.5834732, -0.6141712, 1, 1, 1, 1, 1,
-0.5170037, -0.2144723, -3.261238, 1, 1, 1, 1, 1,
-0.5152135, -0.573879, -2.155181, 1, 1, 1, 1, 1,
-0.5134551, -0.07404428, -2.078198, 1, 1, 1, 1, 1,
-0.5132297, -0.169202, -1.917312, 1, 1, 1, 1, 1,
-0.511566, -0.07892066, -0.8695661, 1, 1, 1, 1, 1,
-0.5070157, 0.6754605, -1.209889, 1, 1, 1, 1, 1,
-0.50615, -0.3186306, -0.8999523, 1, 1, 1, 1, 1,
-0.5042753, 0.7069744, 0.729226, 1, 1, 1, 1, 1,
-0.5028285, -0.4455772, -1.592154, 0, 0, 1, 1, 1,
-0.5019783, -1.36321, -3.535426, 1, 0, 0, 1, 1,
-0.4998046, 0.9796232, 0.05823448, 1, 0, 0, 1, 1,
-0.49774, 0.6413445, 2.068571, 1, 0, 0, 1, 1,
-0.4964973, -1.70864, -3.76281, 1, 0, 0, 1, 1,
-0.4928309, -0.8125849, -3.469243, 1, 0, 0, 1, 1,
-0.4923288, 1.029613, -0.8170044, 0, 0, 0, 1, 1,
-0.4921214, 1.075204, 1.082477, 0, 0, 0, 1, 1,
-0.4912131, -0.2399879, -2.005795, 0, 0, 0, 1, 1,
-0.4910134, 0.9603847, -0.7662907, 0, 0, 0, 1, 1,
-0.4897969, -0.3495243, -1.393196, 0, 0, 0, 1, 1,
-0.4842238, 1.453368, -0.8701155, 0, 0, 0, 1, 1,
-0.4813522, -1.770347, -3.152286, 0, 0, 0, 1, 1,
-0.4811083, -0.5236339, -4.204232, 1, 1, 1, 1, 1,
-0.4746108, 0.8159807, 0.1609214, 1, 1, 1, 1, 1,
-0.4743126, 0.4466715, -1.102347, 1, 1, 1, 1, 1,
-0.4692689, 0.264302, 0.001777846, 1, 1, 1, 1, 1,
-0.4682982, -0.9140441, -2.394844, 1, 1, 1, 1, 1,
-0.4634522, 1.3518, -0.7746543, 1, 1, 1, 1, 1,
-0.4595417, 1.086378, -1.183979, 1, 1, 1, 1, 1,
-0.4566703, 0.4927664, -0.1560045, 1, 1, 1, 1, 1,
-0.4563241, -0.2248592, -1.720491, 1, 1, 1, 1, 1,
-0.4556659, -0.09153771, -1.399082, 1, 1, 1, 1, 1,
-0.444166, -1.661246, -2.145036, 1, 1, 1, 1, 1,
-0.4360201, -0.4321243, -2.831894, 1, 1, 1, 1, 1,
-0.4356822, -0.2564908, -2.07432, 1, 1, 1, 1, 1,
-0.4346622, 1.714398, 1.287313, 1, 1, 1, 1, 1,
-0.4341217, -0.2434484, -0.7387852, 1, 1, 1, 1, 1,
-0.4336417, -1.11341, -2.563012, 0, 0, 1, 1, 1,
-0.4328083, 0.03749005, -0.5808594, 1, 0, 0, 1, 1,
-0.4317538, -0.2323857, -1.938143, 1, 0, 0, 1, 1,
-0.4275376, 0.07389279, -1.138306, 1, 0, 0, 1, 1,
-0.4222839, 1.344371, -0.008619578, 1, 0, 0, 1, 1,
-0.4205344, 2.53659, -0.7167969, 1, 0, 0, 1, 1,
-0.4145932, 2.392052, -0.4292813, 0, 0, 0, 1, 1,
-0.4090859, -0.7218643, -1.798929, 0, 0, 0, 1, 1,
-0.4087862, -0.9987016, -2.649895, 0, 0, 0, 1, 1,
-0.4015681, -0.5723907, -3.16898, 0, 0, 0, 1, 1,
-0.4004776, -0.1069345, 1.435096, 0, 0, 0, 1, 1,
-0.3986327, 1.462323, -0.772127, 0, 0, 0, 1, 1,
-0.3892704, 0.6738203, -0.5020595, 0, 0, 0, 1, 1,
-0.3878819, 1.799685, 1.474019, 1, 1, 1, 1, 1,
-0.3874526, 0.2839871, -1.101906, 1, 1, 1, 1, 1,
-0.3856095, -1.224769, -1.953353, 1, 1, 1, 1, 1,
-0.3764275, 0.3169529, -0.6275762, 1, 1, 1, 1, 1,
-0.3748621, -1.015179, -2.226947, 1, 1, 1, 1, 1,
-0.3729287, -0.2981771, -2.966102, 1, 1, 1, 1, 1,
-0.3709115, -0.3266806, -1.316332, 1, 1, 1, 1, 1,
-0.3645581, 0.8590059, -1.097825, 1, 1, 1, 1, 1,
-0.3622753, 0.6306774, -0.5275223, 1, 1, 1, 1, 1,
-0.3617613, 0.9092353, -0.4841182, 1, 1, 1, 1, 1,
-0.3598609, -0.5467203, -3.121937, 1, 1, 1, 1, 1,
-0.3563113, -0.3979548, -2.753353, 1, 1, 1, 1, 1,
-0.3553372, 0.2340554, -1.79671, 1, 1, 1, 1, 1,
-0.3532984, -0.7127094, -1.727512, 1, 1, 1, 1, 1,
-0.3492028, -0.1724874, -0.9483604, 1, 1, 1, 1, 1,
-0.3470153, 2.112958, 2.337067, 0, 0, 1, 1, 1,
-0.3462698, -0.9889308, -3.271319, 1, 0, 0, 1, 1,
-0.344514, 0.1817438, -1.016993, 1, 0, 0, 1, 1,
-0.339259, 0.2072695, -1.540308, 1, 0, 0, 1, 1,
-0.3372181, 0.491007, 0.758907, 1, 0, 0, 1, 1,
-0.334032, 1.109765, -0.565346, 1, 0, 0, 1, 1,
-0.3319694, 1.185899, -1.375353, 0, 0, 0, 1, 1,
-0.3302865, -1.786915, -3.269508, 0, 0, 0, 1, 1,
-0.3248363, -1.184183, -2.173281, 0, 0, 0, 1, 1,
-0.3224958, -1.802399, -3.544123, 0, 0, 0, 1, 1,
-0.3192932, -2.320194, -2.52821, 0, 0, 0, 1, 1,
-0.3185309, 0.1492853, -2.709249, 0, 0, 0, 1, 1,
-0.3180924, 2.020145, -0.3284715, 0, 0, 0, 1, 1,
-0.3166512, 1.379557, 0.7041357, 1, 1, 1, 1, 1,
-0.3108475, 0.363784, -0.3898598, 1, 1, 1, 1, 1,
-0.3047478, 0.4764932, 0.8288057, 1, 1, 1, 1, 1,
-0.3043172, -1.634742, -3.046067, 1, 1, 1, 1, 1,
-0.3020156, -0.263781, -2.725482, 1, 1, 1, 1, 1,
-0.3017233, 0.8920426, 0.8661876, 1, 1, 1, 1, 1,
-0.2990134, -1.008467, -3.076733, 1, 1, 1, 1, 1,
-0.2978329, 1.988487, -1.568589, 1, 1, 1, 1, 1,
-0.2924263, 0.3142742, 0.4717598, 1, 1, 1, 1, 1,
-0.2919715, 0.8220759, 0.6113292, 1, 1, 1, 1, 1,
-0.2878749, -1.497917, -0.9706092, 1, 1, 1, 1, 1,
-0.2869979, 0.455716, 1.599528, 1, 1, 1, 1, 1,
-0.2861496, -0.1422459, -0.6968389, 1, 1, 1, 1, 1,
-0.2855705, -1.488839, -2.325767, 1, 1, 1, 1, 1,
-0.2847202, -0.3202695, -2.915161, 1, 1, 1, 1, 1,
-0.2845839, -0.7260613, -3.471936, 0, 0, 1, 1, 1,
-0.2806057, -0.3628236, -5.191516, 1, 0, 0, 1, 1,
-0.279936, -0.6486051, -1.579459, 1, 0, 0, 1, 1,
-0.2795634, -0.8174292, -1.431038, 1, 0, 0, 1, 1,
-0.2741576, -0.8600906, -1.666529, 1, 0, 0, 1, 1,
-0.270829, -0.5604027, -2.905157, 1, 0, 0, 1, 1,
-0.2658686, -0.3925657, -3.685679, 0, 0, 0, 1, 1,
-0.2643489, -1.220592, -3.145441, 0, 0, 0, 1, 1,
-0.2599496, 1.155315, -2.633322, 0, 0, 0, 1, 1,
-0.259889, -1.402143, -3.196635, 0, 0, 0, 1, 1,
-0.2559479, 2.200684, -1.858492, 0, 0, 0, 1, 1,
-0.2546875, 0.9359916, -1.535002, 0, 0, 0, 1, 1,
-0.2524081, -0.8129249, -2.507309, 0, 0, 0, 1, 1,
-0.248679, 0.01578024, -1.815406, 1, 1, 1, 1, 1,
-0.2411012, 0.8593282, -1.786057, 1, 1, 1, 1, 1,
-0.2367163, -0.08314288, -2.016967, 1, 1, 1, 1, 1,
-0.235116, -0.4731079, -3.308816, 1, 1, 1, 1, 1,
-0.2323516, -1.05867, -2.246466, 1, 1, 1, 1, 1,
-0.2289173, -0.7199361, -1.58147, 1, 1, 1, 1, 1,
-0.2229014, -0.1381804, -1.117219, 1, 1, 1, 1, 1,
-0.2210571, 0.6360429, -1.035491, 1, 1, 1, 1, 1,
-0.2097283, 1.478153, -0.632363, 1, 1, 1, 1, 1,
-0.2083844, -0.5643284, -3.660954, 1, 1, 1, 1, 1,
-0.2033149, -0.5932203, -2.311678, 1, 1, 1, 1, 1,
-0.1938098, -1.374037, -5.1552, 1, 1, 1, 1, 1,
-0.1926785, -0.7210361, -1.644309, 1, 1, 1, 1, 1,
-0.1904152, -0.07534838, -3.107616, 1, 1, 1, 1, 1,
-0.1874741, 0.2400296, 1.273374, 1, 1, 1, 1, 1,
-0.1869116, 0.4484964, -0.6873463, 0, 0, 1, 1, 1,
-0.1771386, -0.2753239, -1.837788, 1, 0, 0, 1, 1,
-0.1770749, 1.069968, -0.7169689, 1, 0, 0, 1, 1,
-0.172392, -0.3094216, -3.842514, 1, 0, 0, 1, 1,
-0.1704994, -0.6162287, -3.123923, 1, 0, 0, 1, 1,
-0.1703706, 1.896318, 0.1667849, 1, 0, 0, 1, 1,
-0.1665505, 1.801812, 0.144996, 0, 0, 0, 1, 1,
-0.1655129, 0.4186688, -0.2211585, 0, 0, 0, 1, 1,
-0.1650272, -0.2441663, -2.299752, 0, 0, 0, 1, 1,
-0.1633266, 0.5288498, -1.232601, 0, 0, 0, 1, 1,
-0.160927, -0.1632376, -4.57797, 0, 0, 0, 1, 1,
-0.160471, 1.140785, -0.5309456, 0, 0, 0, 1, 1,
-0.1581557, 1.149056, -2.924283, 0, 0, 0, 1, 1,
-0.1574612, -0.06930421, -3.322739, 1, 1, 1, 1, 1,
-0.1544621, -0.2737952, -2.280744, 1, 1, 1, 1, 1,
-0.1514607, -1.170733, -0.9519084, 1, 1, 1, 1, 1,
-0.1501444, 1.494174, -1.274786, 1, 1, 1, 1, 1,
-0.1499788, -0.1962308, -4.179749, 1, 1, 1, 1, 1,
-0.1451804, -1.21876, -2.021173, 1, 1, 1, 1, 1,
-0.1431626, -0.2429046, -2.932771, 1, 1, 1, 1, 1,
-0.1392211, -0.128357, -1.82226, 1, 1, 1, 1, 1,
-0.1389368, 0.2186449, 0.06998739, 1, 1, 1, 1, 1,
-0.1364135, -1.299186, -3.209406, 1, 1, 1, 1, 1,
-0.1334628, -1.515015, -2.68146, 1, 1, 1, 1, 1,
-0.1293817, 1.336808, 1.368143, 1, 1, 1, 1, 1,
-0.1291623, 0.6174643, -0.6805909, 1, 1, 1, 1, 1,
-0.127967, 0.5298591, -1.016647, 1, 1, 1, 1, 1,
-0.1247937, -1.051481, -3.151681, 1, 1, 1, 1, 1,
-0.1182783, 0.5215963, -2.383932, 0, 0, 1, 1, 1,
-0.11753, 0.4638536, -1.271351, 1, 0, 0, 1, 1,
-0.1080869, 0.7133536, -2.187915, 1, 0, 0, 1, 1,
-0.1071402, 1.418478, -1.008196, 1, 0, 0, 1, 1,
-0.1058929, 0.01717936, -1.63811, 1, 0, 0, 1, 1,
-0.1048491, -0.8175644, -1.269159, 1, 0, 0, 1, 1,
-0.1034554, 1.799708, 1.553984, 0, 0, 0, 1, 1,
-0.1034049, -0.2661236, -1.874254, 0, 0, 0, 1, 1,
-0.1032449, -0.05613001, -3.812015, 0, 0, 0, 1, 1,
-0.09968909, -0.3601473, -2.094544, 0, 0, 0, 1, 1,
-0.09744546, 0.4462596, -0.1896114, 0, 0, 0, 1, 1,
-0.0970227, -0.8525546, -1.40421, 0, 0, 0, 1, 1,
-0.09311945, -0.08534911, -3.52065, 0, 0, 0, 1, 1,
-0.09016394, -1.442918, -3.920766, 1, 1, 1, 1, 1,
-0.08989353, -1.779742, -3.195513, 1, 1, 1, 1, 1,
-0.08774135, -0.9863151, -3.84067, 1, 1, 1, 1, 1,
-0.08718114, -0.447668, -3.601414, 1, 1, 1, 1, 1,
-0.0862724, 2.1084, -1.858527, 1, 1, 1, 1, 1,
-0.08580639, -0.2537005, -3.641785, 1, 1, 1, 1, 1,
-0.08323037, 0.3211016, -0.2190937, 1, 1, 1, 1, 1,
-0.08205154, -0.5464744, -2.104672, 1, 1, 1, 1, 1,
-0.08073019, -1.082561, -2.750202, 1, 1, 1, 1, 1,
-0.07769556, -1.274034, -3.002402, 1, 1, 1, 1, 1,
-0.07700096, 0.7168946, 0.5414278, 1, 1, 1, 1, 1,
-0.07057322, -1.16964, -1.356555, 1, 1, 1, 1, 1,
-0.06995681, 0.1820846, -0.3278525, 1, 1, 1, 1, 1,
-0.06967053, -0.4297646, -2.963942, 1, 1, 1, 1, 1,
-0.06906907, -0.4008429, -4.195238, 1, 1, 1, 1, 1,
-0.06371254, -0.1847625, -2.386616, 0, 0, 1, 1, 1,
-0.05251224, 0.8397405, 0.6639531, 1, 0, 0, 1, 1,
-0.04727165, 1.229675, -0.5700462, 1, 0, 0, 1, 1,
-0.04476355, -0.03924798, -2.353649, 1, 0, 0, 1, 1,
-0.04320325, -1.148752, -2.160612, 1, 0, 0, 1, 1,
-0.04109915, 0.128053, -0.4072544, 1, 0, 0, 1, 1,
-0.0388965, 1.114803, 2.187235, 0, 0, 0, 1, 1,
-0.0382142, -1.348616, -4.03839, 0, 0, 0, 1, 1,
-0.03648307, -0.8726068, -2.738401, 0, 0, 0, 1, 1,
-0.03613765, -0.8965911, -3.110761, 0, 0, 0, 1, 1,
-0.03591241, 1.557803, 0.4768255, 0, 0, 0, 1, 1,
-0.03452011, 1.299414, 0.03826426, 0, 0, 0, 1, 1,
-0.0315707, 0.5663208, -0.6551653, 0, 0, 0, 1, 1,
-0.03015129, 0.5298998, -0.2756023, 1, 1, 1, 1, 1,
-0.02098197, -0.03868955, -2.91333, 1, 1, 1, 1, 1,
-0.01810583, 1.165819, 0.06553354, 1, 1, 1, 1, 1,
-0.01735679, 0.01121595, 0.2984965, 1, 1, 1, 1, 1,
-0.0151387, -1.055594, -3.407529, 1, 1, 1, 1, 1,
-0.01285846, 1.243646, 0.8731423, 1, 1, 1, 1, 1,
-0.01167272, 0.2550327, 0.4341027, 1, 1, 1, 1, 1,
-0.00328011, -0.4254318, -3.27932, 1, 1, 1, 1, 1,
0.003616429, 1.209187, -2.345809, 1, 1, 1, 1, 1,
0.00597383, -1.39326, 3.407019, 1, 1, 1, 1, 1,
0.007463177, -0.2253324, 2.296969, 1, 1, 1, 1, 1,
0.008695916, 0.3512727, 0.4613764, 1, 1, 1, 1, 1,
0.01312776, 1.271655, 0.1840113, 1, 1, 1, 1, 1,
0.01532187, 0.4546896, 1.744409, 1, 1, 1, 1, 1,
0.01908204, 0.7689506, -1.105608, 1, 1, 1, 1, 1,
0.02013707, 0.6987243, -0.844111, 0, 0, 1, 1, 1,
0.02038394, 0.2690707, 0.3151622, 1, 0, 0, 1, 1,
0.0229457, -1.357223, 1.982392, 1, 0, 0, 1, 1,
0.02377204, 2.709027, -0.6919927, 1, 0, 0, 1, 1,
0.03013112, 0.1084777, 3.291032, 1, 0, 0, 1, 1,
0.03291159, -0.9996425, 3.717577, 1, 0, 0, 1, 1,
0.03292238, 0.6899253, -0.05997265, 0, 0, 0, 1, 1,
0.03999063, 1.322822, 0.2639271, 0, 0, 0, 1, 1,
0.04028744, -0.2023494, 2.558399, 0, 0, 0, 1, 1,
0.04263833, -0.3186562, 4.012121, 0, 0, 0, 1, 1,
0.05075689, 0.1623365, -0.3908075, 0, 0, 0, 1, 1,
0.0512176, -0.725764, 2.883867, 0, 0, 0, 1, 1,
0.05165703, -0.2915193, 4.072083, 0, 0, 0, 1, 1,
0.05502105, 0.1849771, -0.5438131, 1, 1, 1, 1, 1,
0.0562232, 0.2380108, -1.995462, 1, 1, 1, 1, 1,
0.05938971, -0.8086479, 3.266543, 1, 1, 1, 1, 1,
0.06276973, -0.2328116, 2.321207, 1, 1, 1, 1, 1,
0.06828751, -1.080424, 2.361931, 1, 1, 1, 1, 1,
0.06973211, 0.3129722, -0.2212928, 1, 1, 1, 1, 1,
0.07208966, 0.04050798, 1.564449, 1, 1, 1, 1, 1,
0.07310399, -1.524831, 3.020065, 1, 1, 1, 1, 1,
0.07492241, 1.698899, 1.135782, 1, 1, 1, 1, 1,
0.0750324, 1.12576, 1.231486, 1, 1, 1, 1, 1,
0.07818469, -1.584572, 3.411485, 1, 1, 1, 1, 1,
0.07855799, 0.5451054, -0.8594447, 1, 1, 1, 1, 1,
0.07994852, 0.6109778, 1.210471, 1, 1, 1, 1, 1,
0.08065052, -0.7670884, 2.747634, 1, 1, 1, 1, 1,
0.08810647, 0.7757393, 0.5098808, 1, 1, 1, 1, 1,
0.09102014, 1.272682, 0.08034471, 0, 0, 1, 1, 1,
0.09813313, -1.150611, 3.267903, 1, 0, 0, 1, 1,
0.09864333, 0.3037596, 0.3819857, 1, 0, 0, 1, 1,
0.1046028, 0.2027805, -1.252915, 1, 0, 0, 1, 1,
0.1054321, 0.1493294, 1.224611, 1, 0, 0, 1, 1,
0.1065768, 1.341468, 0.398396, 1, 0, 0, 1, 1,
0.1066113, -0.4973455, 4.155852, 0, 0, 0, 1, 1,
0.1182928, -1.461966, 1.262833, 0, 0, 0, 1, 1,
0.1184003, 0.3489828, 0.2759497, 0, 0, 0, 1, 1,
0.1260532, 0.3250131, 0.8753011, 0, 0, 0, 1, 1,
0.1275151, 0.6382101, -0.1872087, 0, 0, 0, 1, 1,
0.1303145, 0.6071301, 0.6948332, 0, 0, 0, 1, 1,
0.1352279, -0.4996227, 3.614392, 0, 0, 0, 1, 1,
0.1372973, 0.6286582, -1.45869, 1, 1, 1, 1, 1,
0.1477707, -0.1017739, 3.600707, 1, 1, 1, 1, 1,
0.1482808, 1.877468, 0.349355, 1, 1, 1, 1, 1,
0.1555923, -0.4088144, 4.004216, 1, 1, 1, 1, 1,
0.157761, -1.430454, 3.017755, 1, 1, 1, 1, 1,
0.1578472, -0.6221076, 3.285591, 1, 1, 1, 1, 1,
0.1599033, -1.231597, 2.316042, 1, 1, 1, 1, 1,
0.1604044, 0.5677198, 1.725442, 1, 1, 1, 1, 1,
0.1607423, -0.197881, 3.401015, 1, 1, 1, 1, 1,
0.1617231, -1.21999, 1.79831, 1, 1, 1, 1, 1,
0.1640994, -0.3863723, 3.231518, 1, 1, 1, 1, 1,
0.1667284, -1.293651, 1.746925, 1, 1, 1, 1, 1,
0.1670414, 1.110462, -0.6081417, 1, 1, 1, 1, 1,
0.1673993, 0.6943326, -0.3456646, 1, 1, 1, 1, 1,
0.171556, -0.02239472, 3.446716, 1, 1, 1, 1, 1,
0.1735431, -1.747803, 2.240026, 0, 0, 1, 1, 1,
0.1760798, 1.206887, 0.7716283, 1, 0, 0, 1, 1,
0.1784189, 0.4453906, -0.4768351, 1, 0, 0, 1, 1,
0.1796146, 1.872044, -0.9114643, 1, 0, 0, 1, 1,
0.1800496, -0.8280107, 2.764055, 1, 0, 0, 1, 1,
0.1829347, -0.4414376, 2.405814, 1, 0, 0, 1, 1,
0.1840432, -0.4652953, 1.537618, 0, 0, 0, 1, 1,
0.1872872, 1.465632, -0.2930959, 0, 0, 0, 1, 1,
0.1931621, -0.8045908, 1.578009, 0, 0, 0, 1, 1,
0.1962736, -0.3939231, 3.698377, 0, 0, 0, 1, 1,
0.1966798, 0.8261421, 0.339872, 0, 0, 0, 1, 1,
0.1968267, -2.054363, 1.658678, 0, 0, 0, 1, 1,
0.2014672, 1.726406, 0.07878565, 0, 0, 0, 1, 1,
0.2022164, 0.7458758, -0.05822404, 1, 1, 1, 1, 1,
0.202512, 0.2796708, -1.439425, 1, 1, 1, 1, 1,
0.2109399, -0.7817714, 3.572503, 1, 1, 1, 1, 1,
0.2157883, -0.5495421, 3.318508, 1, 1, 1, 1, 1,
0.2238259, -2.543622, 2.554454, 1, 1, 1, 1, 1,
0.2300711, 0.5313013, 1.509728, 1, 1, 1, 1, 1,
0.2302004, -1.118755, 1.876045, 1, 1, 1, 1, 1,
0.2347072, -0.9231248, 2.599602, 1, 1, 1, 1, 1,
0.2349505, 0.7097871, 1.493298, 1, 1, 1, 1, 1,
0.2349963, 1.954138, -1.157222, 1, 1, 1, 1, 1,
0.2361296, 0.327242, 0.3575777, 1, 1, 1, 1, 1,
0.2386621, 1.574876, 0.3916088, 1, 1, 1, 1, 1,
0.238775, 0.5759701, 1.034664, 1, 1, 1, 1, 1,
0.2388921, -0.6872886, 4.700191, 1, 1, 1, 1, 1,
0.2406747, -0.4408596, 2.491015, 1, 1, 1, 1, 1,
0.2416716, 2.470051, -0.6214182, 0, 0, 1, 1, 1,
0.244057, -0.1971003, 1.267925, 1, 0, 0, 1, 1,
0.2455883, 1.860005, -0.6461529, 1, 0, 0, 1, 1,
0.249561, -0.08466823, 2.942601, 1, 0, 0, 1, 1,
0.2538327, 0.6104497, 0.5874123, 1, 0, 0, 1, 1,
0.2556953, 0.468195, 1.414637, 1, 0, 0, 1, 1,
0.257766, 1.45594, -0.5808548, 0, 0, 0, 1, 1,
0.2586392, -0.9764436, 4.478055, 0, 0, 0, 1, 1,
0.2600079, 0.5139199, 0.1205127, 0, 0, 0, 1, 1,
0.2605172, -0.3699097, 1.754098, 0, 0, 0, 1, 1,
0.2640584, 0.1544014, -0.4747557, 0, 0, 0, 1, 1,
0.2664561, -0.8455014, 4.439918, 0, 0, 0, 1, 1,
0.2703532, -0.4559856, 3.449458, 0, 0, 0, 1, 1,
0.2722753, -0.3632521, 3.20437, 1, 1, 1, 1, 1,
0.2727427, 0.3989305, 0.6613722, 1, 1, 1, 1, 1,
0.2774571, 0.3623493, -0.3721887, 1, 1, 1, 1, 1,
0.2792735, 0.5534069, 1.08928, 1, 1, 1, 1, 1,
0.2797092, 0.7707051, 0.2502654, 1, 1, 1, 1, 1,
0.2828989, 0.7213588, 1.392156, 1, 1, 1, 1, 1,
0.2830699, 0.279103, 1.180177, 1, 1, 1, 1, 1,
0.2844056, 1.891915, 0.01605659, 1, 1, 1, 1, 1,
0.2850854, 0.9598444, -1.314903, 1, 1, 1, 1, 1,
0.2868799, 0.4443791, 0.7588825, 1, 1, 1, 1, 1,
0.2871882, 0.2128978, 0.7158374, 1, 1, 1, 1, 1,
0.2875145, -0.3917655, 1.222899, 1, 1, 1, 1, 1,
0.2889479, -0.8419102, 3.888634, 1, 1, 1, 1, 1,
0.2921842, 1.249092, 0.5548787, 1, 1, 1, 1, 1,
0.2957855, -0.1734032, 0.9896541, 1, 1, 1, 1, 1,
0.2978478, -0.5813244, 2.619755, 0, 0, 1, 1, 1,
0.299582, 1.408485, 0.911126, 1, 0, 0, 1, 1,
0.2997268, -1.463139, 2.109039, 1, 0, 0, 1, 1,
0.3001016, -1.021563, 2.905786, 1, 0, 0, 1, 1,
0.3001651, 0.01446057, 2.411705, 1, 0, 0, 1, 1,
0.3017242, 0.2028295, 2.163591, 1, 0, 0, 1, 1,
0.3027673, -0.3171324, 2.971815, 0, 0, 0, 1, 1,
0.3046238, -0.1320397, 1.788461, 0, 0, 0, 1, 1,
0.3046793, -0.3161894, 0.2210721, 0, 0, 0, 1, 1,
0.3053291, -0.3468561, 2.616649, 0, 0, 0, 1, 1,
0.3055664, 1.404225, 1.097112, 0, 0, 0, 1, 1,
0.3100421, 0.6684687, 0.2747725, 0, 0, 0, 1, 1,
0.31094, -1.144058, 3.953845, 0, 0, 0, 1, 1,
0.3111601, -0.2359579, 2.4366, 1, 1, 1, 1, 1,
0.3121108, -1.334936, 3.457643, 1, 1, 1, 1, 1,
0.3151192, -2.338688, 2.226937, 1, 1, 1, 1, 1,
0.3174797, -2.787756, 2.070511, 1, 1, 1, 1, 1,
0.319153, 1.689357, -1.355076, 1, 1, 1, 1, 1,
0.3196751, -0.7131206, 2.433748, 1, 1, 1, 1, 1,
0.321614, 1.441018, 0.1648084, 1, 1, 1, 1, 1,
0.3229896, 0.7996507, 0.3433509, 1, 1, 1, 1, 1,
0.3297287, -0.2740137, 1.654, 1, 1, 1, 1, 1,
0.3359589, 0.4060093, 0.6843004, 1, 1, 1, 1, 1,
0.3405399, 0.4235948, 0.814288, 1, 1, 1, 1, 1,
0.34091, -1.574718, 3.678569, 1, 1, 1, 1, 1,
0.3410517, -1.223639, 4.384847, 1, 1, 1, 1, 1,
0.3457933, -0.8768905, 1.811644, 1, 1, 1, 1, 1,
0.3468888, 0.9615691, 2.453442, 1, 1, 1, 1, 1,
0.3471606, 0.3751483, 0.2671396, 0, 0, 1, 1, 1,
0.3486623, -0.5139382, 1.883016, 1, 0, 0, 1, 1,
0.3493067, -0.3099471, 2.68848, 1, 0, 0, 1, 1,
0.3507506, 0.06360596, 2.445155, 1, 0, 0, 1, 1,
0.3569529, -1.110347, 3.351429, 1, 0, 0, 1, 1,
0.3611495, 0.882039, 1.763143, 1, 0, 0, 1, 1,
0.3611647, -1.39908, 4.423317, 0, 0, 0, 1, 1,
0.3616776, -0.8075231, 2.117134, 0, 0, 0, 1, 1,
0.3632247, 0.4882832, -0.1168508, 0, 0, 0, 1, 1,
0.3653424, -0.6576497, 0.7086858, 0, 0, 0, 1, 1,
0.3657416, -1.058568, 2.46455, 0, 0, 0, 1, 1,
0.3693348, -0.222161, 2.418583, 0, 0, 0, 1, 1,
0.37172, -0.7123876, 1.706688, 0, 0, 0, 1, 1,
0.3722106, -1.498595, 2.408076, 1, 1, 1, 1, 1,
0.376159, -0.06564554, 0.5982679, 1, 1, 1, 1, 1,
0.3762749, 0.2030292, -1.221633, 1, 1, 1, 1, 1,
0.3783935, -0.5162535, 2.057688, 1, 1, 1, 1, 1,
0.3784558, 0.8121506, 0.5043352, 1, 1, 1, 1, 1,
0.3799131, 0.1686529, 2.265945, 1, 1, 1, 1, 1,
0.3824039, 0.09541616, 3.103599, 1, 1, 1, 1, 1,
0.3843403, -1.062643, 2.478959, 1, 1, 1, 1, 1,
0.3860136, -0.8112402, 3.744148, 1, 1, 1, 1, 1,
0.3882146, -1.685211, 2.424542, 1, 1, 1, 1, 1,
0.3907378, 0.5048585, 0.1876746, 1, 1, 1, 1, 1,
0.3953362, -0.8264913, 4.11671, 1, 1, 1, 1, 1,
0.3994459, -0.717793, 1.381799, 1, 1, 1, 1, 1,
0.4009318, -0.3120078, 2.065402, 1, 1, 1, 1, 1,
0.4036558, 1.000231, 1.591291, 1, 1, 1, 1, 1,
0.4040452, -1.362947, 1.946727, 0, 0, 1, 1, 1,
0.4055901, 0.7085363, -1.573764, 1, 0, 0, 1, 1,
0.4093659, -0.2972611, 3.195227, 1, 0, 0, 1, 1,
0.4114419, 0.7473941, 1.625586, 1, 0, 0, 1, 1,
0.4184606, 0.05753497, 1.245803, 1, 0, 0, 1, 1,
0.4219114, 0.4260481, 0.1449873, 1, 0, 0, 1, 1,
0.424025, 0.2796066, 0.6547318, 0, 0, 0, 1, 1,
0.4256054, -0.5088569, 1.89184, 0, 0, 0, 1, 1,
0.4315078, 0.2305521, 3.345448, 0, 0, 0, 1, 1,
0.4319818, -1.939585, 3.429602, 0, 0, 0, 1, 1,
0.434287, 0.6181853, -1.937249, 0, 0, 0, 1, 1,
0.4354488, -1.076257, 3.272755, 0, 0, 0, 1, 1,
0.4358377, -0.7055067, 3.793544, 0, 0, 0, 1, 1,
0.4405421, 0.2044691, 1.562583, 1, 1, 1, 1, 1,
0.4429306, -1.088547, 2.309715, 1, 1, 1, 1, 1,
0.4455947, -0.2557192, 0.5290169, 1, 1, 1, 1, 1,
0.4497935, -0.8836227, 3.144409, 1, 1, 1, 1, 1,
0.4533875, 0.7414963, -1.294974, 1, 1, 1, 1, 1,
0.4546216, 0.4572687, -0.3566498, 1, 1, 1, 1, 1,
0.4596785, 0.9591191, -0.4561843, 1, 1, 1, 1, 1,
0.4603112, 1.319422, 1.008952, 1, 1, 1, 1, 1,
0.4667192, 0.5220636, 0.4474787, 1, 1, 1, 1, 1,
0.4675457, 0.3067789, 2.416367, 1, 1, 1, 1, 1,
0.4743248, 1.17748, -0.6235263, 1, 1, 1, 1, 1,
0.474508, -0.4181571, 3.027395, 1, 1, 1, 1, 1,
0.4778318, 1.643564, 0.7033718, 1, 1, 1, 1, 1,
0.4799606, 0.8507629, 1.149073, 1, 1, 1, 1, 1,
0.4806842, -0.07823253, 1.539625, 1, 1, 1, 1, 1,
0.4812624, -0.2586375, 1.755008, 0, 0, 1, 1, 1,
0.4844036, 0.9918512, 2.795074, 1, 0, 0, 1, 1,
0.4892691, -0.2047245, 4.772746, 1, 0, 0, 1, 1,
0.4897532, 1.025278, -0.2316292, 1, 0, 0, 1, 1,
0.491192, -1.126021, 1.865148, 1, 0, 0, 1, 1,
0.4916266, 1.774711, 0.8221198, 1, 0, 0, 1, 1,
0.4975236, -0.7182952, 1.434772, 0, 0, 0, 1, 1,
0.4978514, 0.9084802, 0.8042626, 0, 0, 0, 1, 1,
0.4989998, -0.3065865, 1.60355, 0, 0, 0, 1, 1,
0.5017353, -1.14042, 1.483118, 0, 0, 0, 1, 1,
0.5032551, -0.4557497, 3.163748, 0, 0, 0, 1, 1,
0.5042191, -0.02799624, 0.4999749, 0, 0, 0, 1, 1,
0.5055792, -0.1752119, 3.027092, 0, 0, 0, 1, 1,
0.5088688, -0.7731279, 3.102292, 1, 1, 1, 1, 1,
0.5139294, -1.336922, 4.016306, 1, 1, 1, 1, 1,
0.5139515, 1.311429, 0.9892529, 1, 1, 1, 1, 1,
0.5176483, -0.1793146, 3.687542, 1, 1, 1, 1, 1,
0.5216161, 0.4870185, 0.4943907, 1, 1, 1, 1, 1,
0.5239151, 0.9793345, 0.7014658, 1, 1, 1, 1, 1,
0.5252376, 0.5788829, 0.3311588, 1, 1, 1, 1, 1,
0.5274881, -1.188271, 3.4971, 1, 1, 1, 1, 1,
0.5286751, 1.492312, 1.150523, 1, 1, 1, 1, 1,
0.5301683, -0.7843713, 1.442489, 1, 1, 1, 1, 1,
0.5383326, 0.8950317, 0.840379, 1, 1, 1, 1, 1,
0.553946, -0.1191587, 0.7757795, 1, 1, 1, 1, 1,
0.5610223, 0.393439, -0.5811591, 1, 1, 1, 1, 1,
0.561952, 0.2435573, 3.122777, 1, 1, 1, 1, 1,
0.5637771, -1.182545, 2.527767, 1, 1, 1, 1, 1,
0.5645739, -0.8838747, 2.84116, 0, 0, 1, 1, 1,
0.5655611, -1.997199, 2.746405, 1, 0, 0, 1, 1,
0.5697638, 1.71105, -0.08732557, 1, 0, 0, 1, 1,
0.5723805, -0.3619836, 3.78484, 1, 0, 0, 1, 1,
0.5725396, -1.635515, 1.748597, 1, 0, 0, 1, 1,
0.5726803, 1.136112, 1.09551, 1, 0, 0, 1, 1,
0.5743774, 0.825059, 0.9133162, 0, 0, 0, 1, 1,
0.5748047, -2.136524, 2.053134, 0, 0, 0, 1, 1,
0.5769671, -1.205939, 2.702528, 0, 0, 0, 1, 1,
0.5772648, -1.597604, 3.84545, 0, 0, 0, 1, 1,
0.5791392, -0.3961456, 1.143505, 0, 0, 0, 1, 1,
0.5807152, -1.444497, 1.377891, 0, 0, 0, 1, 1,
0.5812225, -1.671337, 2.071405, 0, 0, 0, 1, 1,
0.5904413, 0.5769889, 0.5576147, 1, 1, 1, 1, 1,
0.5939836, -1.266205, 3.383781, 1, 1, 1, 1, 1,
0.5959528, -1.371276, 2.506771, 1, 1, 1, 1, 1,
0.5999384, 0.7799336, 0.918014, 1, 1, 1, 1, 1,
0.6039333, -0.2919625, 3.629777, 1, 1, 1, 1, 1,
0.6074732, 1.685995, -0.5429719, 1, 1, 1, 1, 1,
0.6088636, -1.486763, 1.236374, 1, 1, 1, 1, 1,
0.6095431, -0.4530377, 1.563091, 1, 1, 1, 1, 1,
0.6121874, -1.241535, 3.054824, 1, 1, 1, 1, 1,
0.6126778, -1.067875, 3.854902, 1, 1, 1, 1, 1,
0.6129977, -0.09952993, 0.5928831, 1, 1, 1, 1, 1,
0.6141698, 0.5988845, -1.793106, 1, 1, 1, 1, 1,
0.6141868, 0.889197, 2.436602, 1, 1, 1, 1, 1,
0.6246549, -0.9004826, 0.911459, 1, 1, 1, 1, 1,
0.6283043, 1.731187, 0.3297449, 1, 1, 1, 1, 1,
0.6332694, -1.804917, 2.727067, 0, 0, 1, 1, 1,
0.6360426, 1.010305, -0.8315827, 1, 0, 0, 1, 1,
0.6372722, 0.5114282, 2.891477, 1, 0, 0, 1, 1,
0.6396478, 2.064963, -0.5536365, 1, 0, 0, 1, 1,
0.6448353, -0.01066671, 1.114848, 1, 0, 0, 1, 1,
0.6499202, 0.5830429, 0.2642375, 1, 0, 0, 1, 1,
0.6541475, 0.4830134, 2.369007, 0, 0, 0, 1, 1,
0.6559057, -1.172736, 2.768115, 0, 0, 0, 1, 1,
0.6560039, -0.3639749, 2.58234, 0, 0, 0, 1, 1,
0.6581554, -0.4351119, 2.406964, 0, 0, 0, 1, 1,
0.6596728, 0.2509688, 3.06993, 0, 0, 0, 1, 1,
0.6606098, 2.129164, 0.5269624, 0, 0, 0, 1, 1,
0.6641638, -0.7849818, 2.954418, 0, 0, 0, 1, 1,
0.6645161, -1.038532, 2.587662, 1, 1, 1, 1, 1,
0.6658111, 2.075143, 1.521825, 1, 1, 1, 1, 1,
0.6693881, 2.129441, 0.1938331, 1, 1, 1, 1, 1,
0.6714011, 0.1299379, 0.3811848, 1, 1, 1, 1, 1,
0.6736106, -0.3296671, 2.288293, 1, 1, 1, 1, 1,
0.6751193, 0.7080513, 1.229206, 1, 1, 1, 1, 1,
0.6752357, -1.120127, 4.652837, 1, 1, 1, 1, 1,
0.6830093, 0.517463, 1.040313, 1, 1, 1, 1, 1,
0.6950291, -1.489792, 1.75144, 1, 1, 1, 1, 1,
0.695569, -0.7365401, 2.728524, 1, 1, 1, 1, 1,
0.6988561, -0.5583878, 3.233015, 1, 1, 1, 1, 1,
0.701484, -0.1091452, 1.149389, 1, 1, 1, 1, 1,
0.7025334, -0.6580923, 1.178181, 1, 1, 1, 1, 1,
0.702821, -1.800785, 1.227544, 1, 1, 1, 1, 1,
0.704882, 0.2305504, -0.1067908, 1, 1, 1, 1, 1,
0.7049409, -0.9723876, 1.531428, 0, 0, 1, 1, 1,
0.7051299, -2.407136, 2.15316, 1, 0, 0, 1, 1,
0.7055234, 1.739844, 0.2179321, 1, 0, 0, 1, 1,
0.7073647, 0.8731654, 0.3674468, 1, 0, 0, 1, 1,
0.7105101, -1.097606, 3.183645, 1, 0, 0, 1, 1,
0.7127205, -1.399327, 2.997211, 1, 0, 0, 1, 1,
0.7130566, 0.973739, 1.160485, 0, 0, 0, 1, 1,
0.7213321, -0.4736742, 2.336882, 0, 0, 0, 1, 1,
0.7217841, 0.9496461, -0.7635529, 0, 0, 0, 1, 1,
0.7233219, -0.5638515, 2.074711, 0, 0, 0, 1, 1,
0.7240043, 1.664595, 0.5861869, 0, 0, 0, 1, 1,
0.728663, 1.077935, 0.3527227, 0, 0, 0, 1, 1,
0.7299879, -0.9630471, 4.337083, 0, 0, 0, 1, 1,
0.7301055, -0.1258848, 0.2954472, 1, 1, 1, 1, 1,
0.7310863, 0.6867129, -0.08810332, 1, 1, 1, 1, 1,
0.7327428, 0.321749, 0.8532784, 1, 1, 1, 1, 1,
0.7331741, -0.7547977, -0.03096248, 1, 1, 1, 1, 1,
0.7340233, 2.481152, 0.5731488, 1, 1, 1, 1, 1,
0.7359904, -1.564532, 5.069705, 1, 1, 1, 1, 1,
0.744985, -0.03834061, 0.4153986, 1, 1, 1, 1, 1,
0.7469993, 0.5526847, 0.900004, 1, 1, 1, 1, 1,
0.749695, -1.381926, 3.52685, 1, 1, 1, 1, 1,
0.7511118, -1.60239, 3.844249, 1, 1, 1, 1, 1,
0.7517018, 0.1008476, 0.5179242, 1, 1, 1, 1, 1,
0.7523422, -0.350206, 1.257787, 1, 1, 1, 1, 1,
0.7611194, 0.03969185, 1.081977, 1, 1, 1, 1, 1,
0.7621247, -0.759905, 3.109392, 1, 1, 1, 1, 1,
0.7658663, -1.208096, 2.656564, 1, 1, 1, 1, 1,
0.7746158, -1.110536, 5.325652, 0, 0, 1, 1, 1,
0.7771454, 0.701124, 1.129191, 1, 0, 0, 1, 1,
0.7786692, -0.983534, 1.024683, 1, 0, 0, 1, 1,
0.7845255, -0.1939693, 2.485453, 1, 0, 0, 1, 1,
0.802694, -0.9639644, 3.399851, 1, 0, 0, 1, 1,
0.8209512, 1.82631, 0.2108563, 1, 0, 0, 1, 1,
0.823605, 0.6718428, 0.6044045, 0, 0, 0, 1, 1,
0.8241276, 0.01900359, 2.850724, 0, 0, 0, 1, 1,
0.8264924, 0.4853375, 1.256874, 0, 0, 0, 1, 1,
0.8268572, 0.5104382, 2.504065, 0, 0, 0, 1, 1,
0.8277493, 2.021018, -1.008532, 0, 0, 0, 1, 1,
0.8304982, 0.5435496, 2.951605, 0, 0, 0, 1, 1,
0.8327696, 1.05427, 0.7353531, 0, 0, 0, 1, 1,
0.8359665, -0.5863513, 1.99258, 1, 1, 1, 1, 1,
0.8366651, 0.4149279, 0.9854072, 1, 1, 1, 1, 1,
0.8373291, 0.6600512, 1.468472, 1, 1, 1, 1, 1,
0.8396934, 0.1719418, 0.8781261, 1, 1, 1, 1, 1,
0.8417074, 0.1008912, 2.177158, 1, 1, 1, 1, 1,
0.8531364, -0.46318, 1.778604, 1, 1, 1, 1, 1,
0.8537518, 1.375701, 0.2026018, 1, 1, 1, 1, 1,
0.8599468, 0.2777755, 0.06447011, 1, 1, 1, 1, 1,
0.8756387, -0.6946566, 2.234186, 1, 1, 1, 1, 1,
0.8761784, -0.3702497, 1.824404, 1, 1, 1, 1, 1,
0.8824747, 0.2240033, -0.7154566, 1, 1, 1, 1, 1,
0.8923305, -0.0726975, 1.804967, 1, 1, 1, 1, 1,
0.8923855, -0.2197329, 1.172877, 1, 1, 1, 1, 1,
0.8974572, -1.410897, 3.625398, 1, 1, 1, 1, 1,
0.9028789, -0.3272413, 2.349012, 1, 1, 1, 1, 1,
0.9043484, 0.2919905, 0.9131742, 0, 0, 1, 1, 1,
0.9100174, 0.5817237, 2.035601, 1, 0, 0, 1, 1,
0.9130796, -1.265191, 2.786497, 1, 0, 0, 1, 1,
0.9134196, -1.027192, 0.7808711, 1, 0, 0, 1, 1,
0.924077, -0.9861889, 3.555635, 1, 0, 0, 1, 1,
0.9249208, 0.6062799, 0.06535862, 1, 0, 0, 1, 1,
0.9321244, -0.8615769, 1.501302, 0, 0, 0, 1, 1,
0.9348133, -1.899334, 1.540579, 0, 0, 0, 1, 1,
0.9397058, 0.4801391, 1.056139, 0, 0, 0, 1, 1,
0.9412823, 2.550599, 1.241822, 0, 0, 0, 1, 1,
0.9437726, -0.1605135, 2.516283, 0, 0, 0, 1, 1,
0.9467108, -1.731431, 3.185155, 0, 0, 0, 1, 1,
0.9498168, -0.378555, 1.441575, 0, 0, 0, 1, 1,
0.9632231, 0.08563077, 1.577082, 1, 1, 1, 1, 1,
0.9687575, -1.741512, 2.669371, 1, 1, 1, 1, 1,
0.9704012, 1.112052, 0.8319006, 1, 1, 1, 1, 1,
0.9719203, 1.43926, 0.05493953, 1, 1, 1, 1, 1,
0.9728748, 0.7126009, 2.469267, 1, 1, 1, 1, 1,
0.9741645, 0.0653239, 2.191777, 1, 1, 1, 1, 1,
0.9769701, 2.355368, -0.6370119, 1, 1, 1, 1, 1,
0.9791059, -1.494444, 1.914402, 1, 1, 1, 1, 1,
0.9792064, 0.3271921, -0.268391, 1, 1, 1, 1, 1,
0.9815941, 0.5333812, 0.2913911, 1, 1, 1, 1, 1,
0.9820688, -0.1692739, 1.052819, 1, 1, 1, 1, 1,
0.9835967, -0.2104372, 2.092186, 1, 1, 1, 1, 1,
0.9865415, 0.4681363, 0.8284066, 1, 1, 1, 1, 1,
0.990194, -1.981152, 3.164302, 1, 1, 1, 1, 1,
0.9933115, 1.572737, 0.9914226, 1, 1, 1, 1, 1,
0.9982414, -0.3854195, 1.164416, 0, 0, 1, 1, 1,
0.9991388, 0.7912752, 0.114551, 1, 0, 0, 1, 1,
1.003004, -0.8043898, 1.626529, 1, 0, 0, 1, 1,
1.005806, 0.778328, 1.220003, 1, 0, 0, 1, 1,
1.009055, 0.9592463, -1.081608, 1, 0, 0, 1, 1,
1.009666, -1.638636, 3.870184, 1, 0, 0, 1, 1,
1.01171, -0.3965292, 4.806702, 0, 0, 0, 1, 1,
1.012134, -0.2913917, 3.073772, 0, 0, 0, 1, 1,
1.014476, 1.200358, 1.303485, 0, 0, 0, 1, 1,
1.024585, -0.33163, 2.948615, 0, 0, 0, 1, 1,
1.027083, 0.4688242, 0.1216115, 0, 0, 0, 1, 1,
1.027328, 0.01128845, 1.599302, 0, 0, 0, 1, 1,
1.037192, 0.3230303, 3.095067, 0, 0, 0, 1, 1,
1.042973, -0.6845188, 2.038284, 1, 1, 1, 1, 1,
1.045181, 0.4230916, 0.5453472, 1, 1, 1, 1, 1,
1.045834, 0.8635265, 1.678423, 1, 1, 1, 1, 1,
1.055421, 0.01093408, 1.042278, 1, 1, 1, 1, 1,
1.065824, -1.300488, 2.242926, 1, 1, 1, 1, 1,
1.066026, 0.8435314, 1.291423, 1, 1, 1, 1, 1,
1.079084, 1.060191, 0.5680986, 1, 1, 1, 1, 1,
1.08199, -1.237989, 2.800506, 1, 1, 1, 1, 1,
1.084595, 0.5478719, 1.656623, 1, 1, 1, 1, 1,
1.087121, 1.670902, 1.050741, 1, 1, 1, 1, 1,
1.091595, 0.4077991, 0.6361868, 1, 1, 1, 1, 1,
1.093796, -0.6009074, 0.5901313, 1, 1, 1, 1, 1,
1.095125, -0.1886247, 1.187545, 1, 1, 1, 1, 1,
1.097013, -0.1638469, 0.8812155, 1, 1, 1, 1, 1,
1.104839, -1.224333, 1.614974, 1, 1, 1, 1, 1,
1.106587, 0.7261045, 2.353385, 0, 0, 1, 1, 1,
1.11468, -0.1040307, 1.063477, 1, 0, 0, 1, 1,
1.11498, 1.348809, 0.1904362, 1, 0, 0, 1, 1,
1.117174, -0.9178554, 1.555125, 1, 0, 0, 1, 1,
1.120106, -0.0875645, 2.517427, 1, 0, 0, 1, 1,
1.123923, 0.607772, 1.484648, 1, 0, 0, 1, 1,
1.125189, 0.7248699, 0.8400969, 0, 0, 0, 1, 1,
1.132089, -0.1843246, 0.1212858, 0, 0, 0, 1, 1,
1.135791, -0.03831333, 2.252725, 0, 0, 0, 1, 1,
1.13717, -0.4303218, 1.808208, 0, 0, 0, 1, 1,
1.140326, 0.4140002, 2.478584, 0, 0, 0, 1, 1,
1.141512, 0.9002656, 0.71434, 0, 0, 0, 1, 1,
1.144822, -0.2695993, 1.237527, 0, 0, 0, 1, 1,
1.154728, -0.7325553, 1.335062, 1, 1, 1, 1, 1,
1.169958, -0.5437822, 2.017883, 1, 1, 1, 1, 1,
1.170752, 0.1852883, 1.05183, 1, 1, 1, 1, 1,
1.177546, 0.4014155, -0.1003547, 1, 1, 1, 1, 1,
1.204588, 0.3179597, 2.131881, 1, 1, 1, 1, 1,
1.204892, 0.3776975, 3.130977, 1, 1, 1, 1, 1,
1.20698, -1.122361, 2.545724, 1, 1, 1, 1, 1,
1.211141, 1.053479, 0.168942, 1, 1, 1, 1, 1,
1.223717, 0.9695625, 1.007551, 1, 1, 1, 1, 1,
1.233907, -0.09807264, 1.697052, 1, 1, 1, 1, 1,
1.233933, 1.077406, 1.317953, 1, 1, 1, 1, 1,
1.242355, -2.19978, 2.000535, 1, 1, 1, 1, 1,
1.247104, 1.606226, 1.50705, 1, 1, 1, 1, 1,
1.256375, 0.6603615, 1.132974, 1, 1, 1, 1, 1,
1.266202, 0.4657172, 0.5794712, 1, 1, 1, 1, 1,
1.267187, -1.079646, 2.20402, 0, 0, 1, 1, 1,
1.270883, 0.4880163, -0.3373366, 1, 0, 0, 1, 1,
1.286836, 1.243858, 1.253354, 1, 0, 0, 1, 1,
1.286977, -0.5856026, 3.030774, 1, 0, 0, 1, 1,
1.295408, 0.02834672, 2.644191, 1, 0, 0, 1, 1,
1.301551, 1.583313, 0.04687306, 1, 0, 0, 1, 1,
1.30215, -0.2019455, 0.5253292, 0, 0, 0, 1, 1,
1.307342, -0.5667275, 3.755434, 0, 0, 0, 1, 1,
1.309779, 0.5012624, 0.4088247, 0, 0, 0, 1, 1,
1.309871, -0.7087784, 3.176156, 0, 0, 0, 1, 1,
1.311654, -0.2544635, 2.934031, 0, 0, 0, 1, 1,
1.311711, -0.6256464, 1.354388, 0, 0, 0, 1, 1,
1.3171, -1.29771, 1.167449, 0, 0, 0, 1, 1,
1.317168, -0.6389413, 1.961671, 1, 1, 1, 1, 1,
1.322031, -0.2451392, 1.461913, 1, 1, 1, 1, 1,
1.323409, 0.5718467, 1.999383, 1, 1, 1, 1, 1,
1.325738, -0.192451, 3.244626, 1, 1, 1, 1, 1,
1.329722, 0.1807401, 0.7881497, 1, 1, 1, 1, 1,
1.336643, -0.4945726, 2.022082, 1, 1, 1, 1, 1,
1.338033, -0.9053345, 3.112991, 1, 1, 1, 1, 1,
1.338273, 0.8758641, 0.3877603, 1, 1, 1, 1, 1,
1.347056, -0.8323139, 2.393255, 1, 1, 1, 1, 1,
1.34973, -0.4553368, 1.165417, 1, 1, 1, 1, 1,
1.351667, 2.321048, 1.569556, 1, 1, 1, 1, 1,
1.353947, 0.3215999, 0.1763197, 1, 1, 1, 1, 1,
1.378692, 0.5360492, 0.6516833, 1, 1, 1, 1, 1,
1.383721, 0.1962067, 1.538212, 1, 1, 1, 1, 1,
1.39483, -0.2365247, 1.13432, 1, 1, 1, 1, 1,
1.402644, 1.120634, -1.734843, 0, 0, 1, 1, 1,
1.405182, 0.9021268, 1.073244, 1, 0, 0, 1, 1,
1.411139, -1.00205, 0.5825417, 1, 0, 0, 1, 1,
1.451725, 0.9559672, 1.009231, 1, 0, 0, 1, 1,
1.460708, -1.006253, 1.347888, 1, 0, 0, 1, 1,
1.461548, 0.5905951, 2.739183, 1, 0, 0, 1, 1,
1.468732, 0.6953897, 0.4970591, 0, 0, 0, 1, 1,
1.475021, -0.2532326, 2.437891, 0, 0, 0, 1, 1,
1.484993, -0.4594904, 1.081957, 0, 0, 0, 1, 1,
1.490098, -1.098317, 2.063747, 0, 0, 0, 1, 1,
1.493413, 2.299138, 0.9828701, 0, 0, 0, 1, 1,
1.494158, -0.804391, 2.051767, 0, 0, 0, 1, 1,
1.495659, -1.305772, 2.067117, 0, 0, 0, 1, 1,
1.508542, -0.923692, 0.6895669, 1, 1, 1, 1, 1,
1.526468, 0.5399317, 0.01589938, 1, 1, 1, 1, 1,
1.536301, 0.9892119, 2.254817, 1, 1, 1, 1, 1,
1.536899, 2.225975, -0.07209515, 1, 1, 1, 1, 1,
1.536913, 1.236076, 0.9287807, 1, 1, 1, 1, 1,
1.537086, 0.6291178, 2.059749, 1, 1, 1, 1, 1,
1.540647, -0.3409578, 1.946336, 1, 1, 1, 1, 1,
1.550568, 0.8077303, 1.801256, 1, 1, 1, 1, 1,
1.55571, 0.002873263, 1.007883, 1, 1, 1, 1, 1,
1.556944, 0.4369216, -0.3319441, 1, 1, 1, 1, 1,
1.574449, -0.1734968, -0.2151496, 1, 1, 1, 1, 1,
1.598289, -1.280551, 2.196694, 1, 1, 1, 1, 1,
1.623895, 0.310128, 1.609629, 1, 1, 1, 1, 1,
1.634708, -0.1656183, 0.4831339, 1, 1, 1, 1, 1,
1.64278, 0.8762851, 0.9889113, 1, 1, 1, 1, 1,
1.651715, -0.5716047, 1.481509, 0, 0, 1, 1, 1,
1.6821, 2.10522, 0.3001016, 1, 0, 0, 1, 1,
1.693211, -0.4852916, 2.052359, 1, 0, 0, 1, 1,
1.714245, 0.3243971, 0.7364846, 1, 0, 0, 1, 1,
1.718886, -0.8223047, 1.495411, 1, 0, 0, 1, 1,
1.722077, 0.4292866, 1.123709, 1, 0, 0, 1, 1,
1.723162, 1.752245, 1.700417, 0, 0, 0, 1, 1,
1.724299, 1.560388, 1.250657, 0, 0, 0, 1, 1,
1.734792, 0.5628831, 2.308307, 0, 0, 0, 1, 1,
1.735799, -0.4033878, 0.9862818, 0, 0, 0, 1, 1,
1.745811, -0.04296741, 0.1430647, 0, 0, 0, 1, 1,
1.767402, 0.5382674, -0.175235, 0, 0, 0, 1, 1,
1.773878, 1.322877, 0.9396906, 0, 0, 0, 1, 1,
1.789548, 0.7786933, 2.357278, 1, 1, 1, 1, 1,
1.805953, 1.692866, 1.814932, 1, 1, 1, 1, 1,
1.823032, -1.395079, 2.618219, 1, 1, 1, 1, 1,
1.834067, 0.06023763, 2.176938, 1, 1, 1, 1, 1,
1.93614, 0.5025144, 1.438959, 1, 1, 1, 1, 1,
1.961736, -0.694805, 1.066324, 1, 1, 1, 1, 1,
1.973972, -0.7303373, 3.222977, 1, 1, 1, 1, 1,
1.988478, -0.1812235, 1.788017, 1, 1, 1, 1, 1,
1.993462, -1.224673, 4.17423, 1, 1, 1, 1, 1,
2.003521, -0.5577546, 0.6499014, 1, 1, 1, 1, 1,
2.003916, 0.2744391, 0.04142732, 1, 1, 1, 1, 1,
2.009267, -0.1914805, 2.220498, 1, 1, 1, 1, 1,
2.026408, -0.1467396, 1.985754, 1, 1, 1, 1, 1,
2.039507, -1.647243, 4.180397, 1, 1, 1, 1, 1,
2.049901, -2.143402, 3.838366, 1, 1, 1, 1, 1,
2.059772, -0.4063277, 1.82791, 0, 0, 1, 1, 1,
2.086259, -0.7657545, 1.14859, 1, 0, 0, 1, 1,
2.131818, -2.089245, 2.054579, 1, 0, 0, 1, 1,
2.170985, -0.8839961, 1.559036, 1, 0, 0, 1, 1,
2.173668, 2.066478, 1.150575, 1, 0, 0, 1, 1,
2.174814, 1.791955, 0.1998648, 1, 0, 0, 1, 1,
2.175638, 1.398819, 0.9915709, 0, 0, 0, 1, 1,
2.189935, 0.3187696, 2.322204, 0, 0, 0, 1, 1,
2.292917, -0.4240316, 0.485668, 0, 0, 0, 1, 1,
2.337762, 0.7674959, 1.693657, 0, 0, 0, 1, 1,
2.343397, 1.027642, -0.6749781, 0, 0, 0, 1, 1,
2.36004, -0.4952921, 1.430665, 0, 0, 0, 1, 1,
2.461527, 0.3212325, 2.028254, 0, 0, 0, 1, 1,
2.470924, 0.3608671, 0.1635509, 1, 1, 1, 1, 1,
2.479054, -0.8051926, 0.2755426, 1, 1, 1, 1, 1,
2.505322, 0.6786072, 3.029631, 1, 1, 1, 1, 1,
2.897793, -1.254665, 4.412661, 1, 1, 1, 1, 1,
2.92256, 0.5962493, -0.09802417, 1, 1, 1, 1, 1,
3.120808, -0.7204566, 3.534308, 1, 1, 1, 1, 1,
3.37697, -0.2037956, 1.770607, 1, 1, 1, 1, 1
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
var radius = 9.420073;
var distance = 33.0876;
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
mvMatrix.translate( -0.2170886, 0.3415372, -0.06706762 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.0876);
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
