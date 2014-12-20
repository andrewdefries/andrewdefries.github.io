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
-3.800168, 0.2267483, -0.9263611, 1, 0, 0, 1,
-3.126015, -1.8068, -3.450437, 1, 0.007843138, 0, 1,
-2.897133, -0.03215669, -4.091176, 1, 0.01176471, 0, 1,
-2.818866, 0.7522585, -1.539078, 1, 0.01960784, 0, 1,
-2.583277, 0.9834099, -1.068771, 1, 0.02352941, 0, 1,
-2.578939, -0.6184811, -2.216061, 1, 0.03137255, 0, 1,
-2.491659, 0.3232918, -0.3426107, 1, 0.03529412, 0, 1,
-2.377423, 1.21977, -0.9576133, 1, 0.04313726, 0, 1,
-2.353348, -0.7783875, -2.303685, 1, 0.04705882, 0, 1,
-2.337042, 1.32934, -2.446685, 1, 0.05490196, 0, 1,
-2.334298, 2.02804, -0.07074775, 1, 0.05882353, 0, 1,
-2.328249, -0.4099878, -0.6937904, 1, 0.06666667, 0, 1,
-2.266989, -0.127187, -2.118724, 1, 0.07058824, 0, 1,
-2.260784, 0.3602745, -1.850877, 1, 0.07843138, 0, 1,
-2.229534, 0.7284597, -1.563415, 1, 0.08235294, 0, 1,
-2.218127, -1.560614, -0.04163769, 1, 0.09019608, 0, 1,
-2.203898, 1.032963, -1.747138, 1, 0.09411765, 0, 1,
-2.15719, -1.198424, -2.264273, 1, 0.1019608, 0, 1,
-2.152965, -0.669304, -1.671454, 1, 0.1098039, 0, 1,
-2.148282, 0.1817449, -2.893088, 1, 0.1137255, 0, 1,
-2.146521, -0.268898, -2.856016, 1, 0.1215686, 0, 1,
-2.13418, 0.2474694, -1.63284, 1, 0.1254902, 0, 1,
-2.131823, -0.04741186, -3.194349, 1, 0.1333333, 0, 1,
-2.123967, 0.1269748, -2.48754, 1, 0.1372549, 0, 1,
-2.10064, -0.8304675, -1.993773, 1, 0.145098, 0, 1,
-2.094983, 0.5011697, -0.7063641, 1, 0.1490196, 0, 1,
-2.064338, -0.2307208, -0.7621343, 1, 0.1568628, 0, 1,
-1.995587, -0.7785041, -1.845721, 1, 0.1607843, 0, 1,
-1.993053, -3.266101, -0.706085, 1, 0.1686275, 0, 1,
-1.967925, -0.3660013, -1.787107, 1, 0.172549, 0, 1,
-1.962166, -0.1502412, -1.232494, 1, 0.1803922, 0, 1,
-1.944009, 0.2232206, -1.422007, 1, 0.1843137, 0, 1,
-1.907271, 1.330543, -0.4993781, 1, 0.1921569, 0, 1,
-1.87514, -1.492759, -2.296764, 1, 0.1960784, 0, 1,
-1.874935, 0.4992999, -0.2599655, 1, 0.2039216, 0, 1,
-1.816644, -0.1343059, -1.625122, 1, 0.2117647, 0, 1,
-1.811116, 1.066936, -1.366464, 1, 0.2156863, 0, 1,
-1.794367, -0.2361115, -2.295194, 1, 0.2235294, 0, 1,
-1.78871, 0.7598488, -1.271902, 1, 0.227451, 0, 1,
-1.786573, -1.050623, -1.824393, 1, 0.2352941, 0, 1,
-1.764344, -0.9776627, -2.348025, 1, 0.2392157, 0, 1,
-1.735229, -0.1965985, -0.8979818, 1, 0.2470588, 0, 1,
-1.712315, -0.5330282, -0.3815497, 1, 0.2509804, 0, 1,
-1.711717, -1.214298, -1.889691, 1, 0.2588235, 0, 1,
-1.684919, 0.653238, -0.4644142, 1, 0.2627451, 0, 1,
-1.658112, -0.164366, -1.469448, 1, 0.2705882, 0, 1,
-1.645436, -0.8079606, -1.992485, 1, 0.2745098, 0, 1,
-1.637424, -0.2123451, -0.9285073, 1, 0.282353, 0, 1,
-1.626687, -0.8803414, -3.324376, 1, 0.2862745, 0, 1,
-1.613868, -1.788063, -2.540322, 1, 0.2941177, 0, 1,
-1.598534, 0.4154352, -1.369934, 1, 0.3019608, 0, 1,
-1.593777, 1.712373, -1.574615, 1, 0.3058824, 0, 1,
-1.590069, 1.301218, -1.677562, 1, 0.3137255, 0, 1,
-1.57909, -1.321815, -1.947327, 1, 0.3176471, 0, 1,
-1.57564, -0.1306524, -1.699981, 1, 0.3254902, 0, 1,
-1.553817, -1.79509, -2.22033, 1, 0.3294118, 0, 1,
-1.539257, 0.3722964, -0.3022965, 1, 0.3372549, 0, 1,
-1.534156, -0.1064655, -1.734162, 1, 0.3411765, 0, 1,
-1.530691, -0.6524092, -1.32105, 1, 0.3490196, 0, 1,
-1.52479, -0.04140332, -1.671382, 1, 0.3529412, 0, 1,
-1.520486, -0.5052198, -1.750806, 1, 0.3607843, 0, 1,
-1.517217, 1.187548, -1.234327, 1, 0.3647059, 0, 1,
-1.515266, -1.627379, -2.409577, 1, 0.372549, 0, 1,
-1.509531, 0.641284, -0.9688171, 1, 0.3764706, 0, 1,
-1.505326, -0.7293113, -3.768492, 1, 0.3843137, 0, 1,
-1.502346, -0.03066378, -3.170555, 1, 0.3882353, 0, 1,
-1.495626, 0.06338101, -2.03823, 1, 0.3960784, 0, 1,
-1.485628, 2.887901, -0.4077711, 1, 0.4039216, 0, 1,
-1.478088, -0.07698523, -2.455232, 1, 0.4078431, 0, 1,
-1.473851, 0.7554617, 1.07265, 1, 0.4156863, 0, 1,
-1.464995, -0.2941354, -1.285363, 1, 0.4196078, 0, 1,
-1.455081, -0.2147192, -2.417036, 1, 0.427451, 0, 1,
-1.454404, -1.695805, -2.333241, 1, 0.4313726, 0, 1,
-1.452678, -1.399145, -2.284407, 1, 0.4392157, 0, 1,
-1.435546, -1.433585, -2.883684, 1, 0.4431373, 0, 1,
-1.427688, -0.5758779, -2.678901, 1, 0.4509804, 0, 1,
-1.421157, -0.02720852, -1.695451, 1, 0.454902, 0, 1,
-1.410165, -1.543706, -1.71698, 1, 0.4627451, 0, 1,
-1.405354, 0.9009991, -2.202954, 1, 0.4666667, 0, 1,
-1.391916, 1.014021, -2.065392, 1, 0.4745098, 0, 1,
-1.369017, -1.275706, -1.608136, 1, 0.4784314, 0, 1,
-1.367717, -0.4581148, -2.346883, 1, 0.4862745, 0, 1,
-1.366973, -1.752191, -1.784858, 1, 0.4901961, 0, 1,
-1.359572, 1.382706, -0.8478495, 1, 0.4980392, 0, 1,
-1.355916, -0.4837785, -2.24702, 1, 0.5058824, 0, 1,
-1.35589, 0.6682179, -2.39821, 1, 0.509804, 0, 1,
-1.353412, 1.448127, -0.8822891, 1, 0.5176471, 0, 1,
-1.352665, -1.393134, -2.254828, 1, 0.5215687, 0, 1,
-1.347174, 1.854051, -1.313557, 1, 0.5294118, 0, 1,
-1.344895, 0.9086821, -0.7253838, 1, 0.5333334, 0, 1,
-1.341606, 0.97631, 0.3043617, 1, 0.5411765, 0, 1,
-1.321738, -0.2695426, -2.294625, 1, 0.5450981, 0, 1,
-1.314788, -0.0107036, -3.00873, 1, 0.5529412, 0, 1,
-1.313952, -2.046735, -2.871148, 1, 0.5568628, 0, 1,
-1.303823, 2.553607, 0.4063565, 1, 0.5647059, 0, 1,
-1.299898, -0.9817536, -3.057947, 1, 0.5686275, 0, 1,
-1.29723, 0.849215, -1.445413, 1, 0.5764706, 0, 1,
-1.285124, 0.03948513, -3.239369, 1, 0.5803922, 0, 1,
-1.279025, -0.6464268, -2.344543, 1, 0.5882353, 0, 1,
-1.274746, -5.34768e-05, -1.89653, 1, 0.5921569, 0, 1,
-1.268496, 0.5328919, -0.6047024, 1, 0.6, 0, 1,
-1.241452, 0.02449597, -1.001786, 1, 0.6078432, 0, 1,
-1.237965, 0.1087288, -0.1688646, 1, 0.6117647, 0, 1,
-1.234808, -0.0537152, -2.186871, 1, 0.6196079, 0, 1,
-1.233079, -0.5574862, -3.314344, 1, 0.6235294, 0, 1,
-1.228829, -2.894551, -2.870785, 1, 0.6313726, 0, 1,
-1.219257, 0.3648793, -3.237005, 1, 0.6352941, 0, 1,
-1.215061, 0.9783325, 0.01655613, 1, 0.6431373, 0, 1,
-1.200822, 0.2161138, -0.5493268, 1, 0.6470588, 0, 1,
-1.199707, 1.936055, -0.6821788, 1, 0.654902, 0, 1,
-1.198078, 0.9303432, -2.477033, 1, 0.6588235, 0, 1,
-1.190669, -1.322721, -2.222705, 1, 0.6666667, 0, 1,
-1.188839, 0.01993784, -0.2799799, 1, 0.6705883, 0, 1,
-1.18684, 0.2663634, -1.010782, 1, 0.6784314, 0, 1,
-1.175922, -0.2512964, -0.3147562, 1, 0.682353, 0, 1,
-1.169234, 1.91874, -2.366027, 1, 0.6901961, 0, 1,
-1.163012, 0.7219213, -1.178237, 1, 0.6941177, 0, 1,
-1.152624, 2.655284, -0.02338664, 1, 0.7019608, 0, 1,
-1.152495, 0.2655119, -0.4596944, 1, 0.7098039, 0, 1,
-1.151117, 1.344096, -0.594066, 1, 0.7137255, 0, 1,
-1.147951, 0.2243014, -0.6560376, 1, 0.7215686, 0, 1,
-1.145106, -0.4081296, -2.65294, 1, 0.7254902, 0, 1,
-1.140021, 1.093489, -2.235648, 1, 0.7333333, 0, 1,
-1.138663, -1.123181, -0.2762392, 1, 0.7372549, 0, 1,
-1.13701, -1.087811, -3.477863, 1, 0.7450981, 0, 1,
-1.136971, -0.02128344, -1.300765, 1, 0.7490196, 0, 1,
-1.133191, 0.594677, -0.3925203, 1, 0.7568628, 0, 1,
-1.12862, 0.3856553, -1.492309, 1, 0.7607843, 0, 1,
-1.126189, -1.115707, -2.197973, 1, 0.7686275, 0, 1,
-1.12367, -0.6255295, -0.9119094, 1, 0.772549, 0, 1,
-1.121461, 0.9618607, -0.4842433, 1, 0.7803922, 0, 1,
-1.09719, 0.8184651, 1.066789, 1, 0.7843137, 0, 1,
-1.093808, -0.9758017, -2.395036, 1, 0.7921569, 0, 1,
-1.090098, 0.6017951, -1.110085, 1, 0.7960784, 0, 1,
-1.084801, -2.104212, -2.883546, 1, 0.8039216, 0, 1,
-1.075886, 0.2251068, -0.4419357, 1, 0.8117647, 0, 1,
-1.067836, -0.9929964, -2.776324, 1, 0.8156863, 0, 1,
-1.059082, 1.46148, 0.676532, 1, 0.8235294, 0, 1,
-1.058293, 0.2577567, -1.689384, 1, 0.827451, 0, 1,
-1.054243, 1.456739, -2.594343, 1, 0.8352941, 0, 1,
-1.037766, 0.8967694, 0.5627471, 1, 0.8392157, 0, 1,
-1.036665, 1.226239, 0.3195622, 1, 0.8470588, 0, 1,
-1.036621, 0.6288449, -0.06685285, 1, 0.8509804, 0, 1,
-1.029532, -0.2949645, -1.999606, 1, 0.8588235, 0, 1,
-1.028466, 1.138879, -1.046392, 1, 0.8627451, 0, 1,
-1.017879, 1.414238, -0.7559879, 1, 0.8705882, 0, 1,
-1.008325, 1.634373, 0.6800045, 1, 0.8745098, 0, 1,
-1.00783, 1.466107, -0.1560772, 1, 0.8823529, 0, 1,
-1.007686, 0.6273222, -1.259063, 1, 0.8862745, 0, 1,
-1.005437, 1.054625, -1.14985, 1, 0.8941177, 0, 1,
-0.9988099, -0.3471957, -3.658188, 1, 0.8980392, 0, 1,
-0.9944634, -1.206858, -2.888081, 1, 0.9058824, 0, 1,
-0.9893283, 0.3810512, -1.033314, 1, 0.9137255, 0, 1,
-0.9857898, 0.8186429, -1.400305, 1, 0.9176471, 0, 1,
-0.9854856, -0.3470415, -1.788887, 1, 0.9254902, 0, 1,
-0.9744735, -0.452003, -2.113728, 1, 0.9294118, 0, 1,
-0.969216, -0.1232035, -2.969442, 1, 0.9372549, 0, 1,
-0.9681552, 2.026197, -1.526495, 1, 0.9411765, 0, 1,
-0.9658951, -0.4800113, -1.780697, 1, 0.9490196, 0, 1,
-0.9651185, 1.089802, -1.972435, 1, 0.9529412, 0, 1,
-0.9583144, 0.3480112, -1.636366, 1, 0.9607843, 0, 1,
-0.9506606, -0.4448327, -1.828715, 1, 0.9647059, 0, 1,
-0.9493104, 0.2868465, 1.237401, 1, 0.972549, 0, 1,
-0.9491277, -1.23834, -1.162286, 1, 0.9764706, 0, 1,
-0.9474045, 1.045792, -2.165699, 1, 0.9843137, 0, 1,
-0.9473431, 0.4092392, -0.6253121, 1, 0.9882353, 0, 1,
-0.9471384, -0.7884637, -4.593575, 1, 0.9960784, 0, 1,
-0.9463721, 1.951351, 0.7252835, 0.9960784, 1, 0, 1,
-0.9386924, -1.087776, -0.4233049, 0.9921569, 1, 0, 1,
-0.9321922, 1.354243, -0.2534663, 0.9843137, 1, 0, 1,
-0.9302796, -0.2969209, -0.4836317, 0.9803922, 1, 0, 1,
-0.9242471, 0.6729645, -0.4170574, 0.972549, 1, 0, 1,
-0.9197238, -1.153183, -1.814934, 0.9686275, 1, 0, 1,
-0.9189706, 1.023389, -0.9093944, 0.9607843, 1, 0, 1,
-0.9170083, 0.1144612, -1.400294, 0.9568627, 1, 0, 1,
-0.9166875, 2.256787, 1.555869, 0.9490196, 1, 0, 1,
-0.9142752, -1.083087, -2.686676, 0.945098, 1, 0, 1,
-0.9125135, -0.1130747, 0.4512787, 0.9372549, 1, 0, 1,
-0.9123147, -0.522052, -0.8486791, 0.9333333, 1, 0, 1,
-0.9024577, 1.69401, 1.905039, 0.9254902, 1, 0, 1,
-0.898095, 0.372267, -1.520467, 0.9215686, 1, 0, 1,
-0.8978467, 0.2568825, -0.008958793, 0.9137255, 1, 0, 1,
-0.8959262, 0.6367546, 0.6528189, 0.9098039, 1, 0, 1,
-0.8857719, -0.7299648, -0.9345666, 0.9019608, 1, 0, 1,
-0.8834386, 0.9752666, 0.7284981, 0.8941177, 1, 0, 1,
-0.8727627, 1.571257, 0.8484135, 0.8901961, 1, 0, 1,
-0.8648534, 0.2770509, -1.41966, 0.8823529, 1, 0, 1,
-0.8576823, -0.4784579, -1.288234, 0.8784314, 1, 0, 1,
-0.856874, -0.494553, -3.869888, 0.8705882, 1, 0, 1,
-0.8564011, -0.3726121, -3.769967, 0.8666667, 1, 0, 1,
-0.8557083, -1.99747, -1.982397, 0.8588235, 1, 0, 1,
-0.848115, 0.2022783, -1.222682, 0.854902, 1, 0, 1,
-0.8453322, 0.05020242, -1.565408, 0.8470588, 1, 0, 1,
-0.8372493, 1.036184, -0.6122609, 0.8431373, 1, 0, 1,
-0.8363201, -0.3311649, -2.559284, 0.8352941, 1, 0, 1,
-0.8363132, -1.100094, -1.57447, 0.8313726, 1, 0, 1,
-0.8328274, -1.486482, -3.931126, 0.8235294, 1, 0, 1,
-0.8325066, 1.132244, -1.350024, 0.8196079, 1, 0, 1,
-0.8307086, 1.282517, 2.0237, 0.8117647, 1, 0, 1,
-0.8285344, 1.034403, -0.1047216, 0.8078431, 1, 0, 1,
-0.8275818, -0.6163738, -1.55422, 0.8, 1, 0, 1,
-0.8245922, 0.5309232, -2.090824, 0.7921569, 1, 0, 1,
-0.8236266, 0.3865094, -1.759092, 0.7882353, 1, 0, 1,
-0.810145, 1.565736, -0.2741257, 0.7803922, 1, 0, 1,
-0.8084495, -0.6877555, -2.14633, 0.7764706, 1, 0, 1,
-0.8057966, -1.38939, -3.658147, 0.7686275, 1, 0, 1,
-0.8040306, -0.2492759, -1.615624, 0.7647059, 1, 0, 1,
-0.7998796, 0.4071318, -1.565177, 0.7568628, 1, 0, 1,
-0.7981011, -0.07100116, -1.382744, 0.7529412, 1, 0, 1,
-0.7952441, 0.6737078, -1.54353, 0.7450981, 1, 0, 1,
-0.78609, 1.108872, -0.690685, 0.7411765, 1, 0, 1,
-0.7810899, -1.010616, -1.555231, 0.7333333, 1, 0, 1,
-0.7806494, 0.01335727, -1.663438, 0.7294118, 1, 0, 1,
-0.7765201, 1.583109, -0.1920466, 0.7215686, 1, 0, 1,
-0.7752062, -0.01204252, -2.862262, 0.7176471, 1, 0, 1,
-0.7740589, -0.8517786, -2.687988, 0.7098039, 1, 0, 1,
-0.7735308, -0.7476452, -2.430251, 0.7058824, 1, 0, 1,
-0.7686388, 2.397232, -1.128432, 0.6980392, 1, 0, 1,
-0.7682768, -0.2527974, -1.834672, 0.6901961, 1, 0, 1,
-0.7670627, 1.303982, -1.186179, 0.6862745, 1, 0, 1,
-0.7633032, 0.2976671, -2.909999, 0.6784314, 1, 0, 1,
-0.7579195, 1.588734, -0.3481412, 0.6745098, 1, 0, 1,
-0.7555218, -1.148822, -2.923442, 0.6666667, 1, 0, 1,
-0.7555053, -0.06158434, -2.952533, 0.6627451, 1, 0, 1,
-0.7513046, 1.053165, 0.7424861, 0.654902, 1, 0, 1,
-0.7458386, -2.139589, -3.282107, 0.6509804, 1, 0, 1,
-0.7448998, 0.1652891, -2.076947, 0.6431373, 1, 0, 1,
-0.7435603, 0.04716687, -3.018255, 0.6392157, 1, 0, 1,
-0.7419789, 0.09452506, 0.3565557, 0.6313726, 1, 0, 1,
-0.740149, 0.8806992, -0.7559379, 0.627451, 1, 0, 1,
-0.737367, 0.8200647, 0.7005919, 0.6196079, 1, 0, 1,
-0.7371917, -0.4352509, -2.493962, 0.6156863, 1, 0, 1,
-0.7287322, -0.3005162, -2.375487, 0.6078432, 1, 0, 1,
-0.7286825, 0.9637002, 1.125685, 0.6039216, 1, 0, 1,
-0.7266068, -0.5533844, -2.35632, 0.5960785, 1, 0, 1,
-0.7174211, -0.2775163, -1.080563, 0.5882353, 1, 0, 1,
-0.7166972, 0.3086747, -3.29304, 0.5843138, 1, 0, 1,
-0.7049181, -0.713109, -2.671223, 0.5764706, 1, 0, 1,
-0.7035596, 0.189335, -1.44237, 0.572549, 1, 0, 1,
-0.6988681, 0.4974569, -1.921781, 0.5647059, 1, 0, 1,
-0.698089, -0.6528938, -1.900385, 0.5607843, 1, 0, 1,
-0.695268, -0.08031168, 0.4089412, 0.5529412, 1, 0, 1,
-0.6915172, 0.068583, -1.550087, 0.5490196, 1, 0, 1,
-0.6862505, -0.01420513, -0.6428068, 0.5411765, 1, 0, 1,
-0.6850083, -0.5915328, -1.456596, 0.5372549, 1, 0, 1,
-0.6842035, 1.000606, -0.01445307, 0.5294118, 1, 0, 1,
-0.6782692, 0.4436328, -0.4321565, 0.5254902, 1, 0, 1,
-0.6677558, -0.4044076, -0.6667857, 0.5176471, 1, 0, 1,
-0.6661619, -0.8776492, -1.807926, 0.5137255, 1, 0, 1,
-0.6629772, -2.250298, -3.572395, 0.5058824, 1, 0, 1,
-0.6621954, 0.1698531, -2.362358, 0.5019608, 1, 0, 1,
-0.6611857, -0.1716849, -0.2627498, 0.4941176, 1, 0, 1,
-0.6595924, -1.065739, -3.454391, 0.4862745, 1, 0, 1,
-0.6440195, 0.6964337, 0.5118946, 0.4823529, 1, 0, 1,
-0.6435662, -0.2213212, -2.157736, 0.4745098, 1, 0, 1,
-0.6410293, 2.005746, 0.4208246, 0.4705882, 1, 0, 1,
-0.6333644, -0.5167971, -3.627423, 0.4627451, 1, 0, 1,
-0.6330556, -0.1843912, -2.248499, 0.4588235, 1, 0, 1,
-0.6327624, -1.192461, -3.14745, 0.4509804, 1, 0, 1,
-0.6304753, -0.2282694, -2.043802, 0.4470588, 1, 0, 1,
-0.6261598, -2.126564, -3.744869, 0.4392157, 1, 0, 1,
-0.6235405, -0.8007094, -3.672838, 0.4352941, 1, 0, 1,
-0.6224306, -1.038783, -3.457501, 0.427451, 1, 0, 1,
-0.6187406, 1.209192, -0.4085979, 0.4235294, 1, 0, 1,
-0.6093179, -0.1440096, -1.297165, 0.4156863, 1, 0, 1,
-0.6084594, 0.4739357, -1.018664, 0.4117647, 1, 0, 1,
-0.6064831, -0.061753, -2.502882, 0.4039216, 1, 0, 1,
-0.5999198, -1.212867, -2.554423, 0.3960784, 1, 0, 1,
-0.5996428, -0.940142, -1.262912, 0.3921569, 1, 0, 1,
-0.5993174, 0.03066539, -1.107551, 0.3843137, 1, 0, 1,
-0.5965008, 0.873574, -1.08331, 0.3803922, 1, 0, 1,
-0.594933, -0.9563646, -2.802196, 0.372549, 1, 0, 1,
-0.5880857, -1.800451, -2.601244, 0.3686275, 1, 0, 1,
-0.5864543, 0.3105001, 0.07048096, 0.3607843, 1, 0, 1,
-0.5821415, 0.4883773, -0.8106267, 0.3568628, 1, 0, 1,
-0.5811942, -0.1675182, -4.253424, 0.3490196, 1, 0, 1,
-0.5805749, 1.541899, -0.04210249, 0.345098, 1, 0, 1,
-0.5743327, -0.3520159, -2.677741, 0.3372549, 1, 0, 1,
-0.5636796, -1.774222, -3.01442, 0.3333333, 1, 0, 1,
-0.5624012, -1.346436, -2.665691, 0.3254902, 1, 0, 1,
-0.5620457, -0.3954968, -0.3893533, 0.3215686, 1, 0, 1,
-0.556385, 1.164629, -0.1441764, 0.3137255, 1, 0, 1,
-0.5516554, -0.8950771, -2.405896, 0.3098039, 1, 0, 1,
-0.5508074, -0.340278, -3.088962, 0.3019608, 1, 0, 1,
-0.5484015, -0.7869714, -1.240688, 0.2941177, 1, 0, 1,
-0.5442772, 0.8257067, -0.2053949, 0.2901961, 1, 0, 1,
-0.5426584, -0.1156981, -0.9504192, 0.282353, 1, 0, 1,
-0.5417219, 0.7260963, -2.445094, 0.2784314, 1, 0, 1,
-0.5409758, 1.289513, -0.8625649, 0.2705882, 1, 0, 1,
-0.5368906, -0.7199354, -1.044311, 0.2666667, 1, 0, 1,
-0.5327864, 0.2972523, -2.285668, 0.2588235, 1, 0, 1,
-0.5269979, 1.126649, 0.3812658, 0.254902, 1, 0, 1,
-0.5258301, 0.9493575, -1.240639, 0.2470588, 1, 0, 1,
-0.5210398, -0.03576815, -1.542889, 0.2431373, 1, 0, 1,
-0.5185803, 1.202506, -0.8734544, 0.2352941, 1, 0, 1,
-0.5161115, 1.049853, -1.330263, 0.2313726, 1, 0, 1,
-0.5113292, -0.48924, -1.296149, 0.2235294, 1, 0, 1,
-0.5094131, 0.9925606, -2.444126, 0.2196078, 1, 0, 1,
-0.5069925, 1.021669, -1.807776, 0.2117647, 1, 0, 1,
-0.5055637, -2.058467, -2.140178, 0.2078431, 1, 0, 1,
-0.5049537, -0.7988645, -0.8592137, 0.2, 1, 0, 1,
-0.4994273, 0.145697, -1.125705, 0.1921569, 1, 0, 1,
-0.4965272, 0.484155, -0.1412758, 0.1882353, 1, 0, 1,
-0.4962138, -1.565654, -1.869728, 0.1803922, 1, 0, 1,
-0.489491, -1.25982, -1.979098, 0.1764706, 1, 0, 1,
-0.4888946, -0.2207792, -1.678718, 0.1686275, 1, 0, 1,
-0.4841594, -2.248659, -1.870187, 0.1647059, 1, 0, 1,
-0.4825965, -0.9170163, -1.855125, 0.1568628, 1, 0, 1,
-0.482107, 0.2200235, -0.04770151, 0.1529412, 1, 0, 1,
-0.4800614, 0.6234056, -0.2133802, 0.145098, 1, 0, 1,
-0.4797566, -0.09954385, -1.672521, 0.1411765, 1, 0, 1,
-0.4787787, 0.3929319, -2.632643, 0.1333333, 1, 0, 1,
-0.4754174, -0.2909001, -0.2281276, 0.1294118, 1, 0, 1,
-0.4752057, 0.519197, 0.0003213543, 0.1215686, 1, 0, 1,
-0.46982, -2.198798, -3.316005, 0.1176471, 1, 0, 1,
-0.4686127, 2.170804, 0.1420765, 0.1098039, 1, 0, 1,
-0.4663827, -0.5634386, -0.7345084, 0.1058824, 1, 0, 1,
-0.4662375, 0.5164071, -1.509358, 0.09803922, 1, 0, 1,
-0.4637731, 0.7075599, 1.706493, 0.09019608, 1, 0, 1,
-0.4611636, -1.067799, -1.456781, 0.08627451, 1, 0, 1,
-0.4579154, 1.123759, 0.7321981, 0.07843138, 1, 0, 1,
-0.4559472, -0.5783852, -1.923341, 0.07450981, 1, 0, 1,
-0.4521728, 0.007448257, -2.665679, 0.06666667, 1, 0, 1,
-0.4519978, 1.412832, 0.2982658, 0.0627451, 1, 0, 1,
-0.4512198, 0.2568435, 0.8065241, 0.05490196, 1, 0, 1,
-0.4498699, 1.687572, -0.2472638, 0.05098039, 1, 0, 1,
-0.4470977, 1.703523, -0.2438753, 0.04313726, 1, 0, 1,
-0.4465799, -0.08702166, -2.137579, 0.03921569, 1, 0, 1,
-0.4461224, -0.09002435, -1.063104, 0.03137255, 1, 0, 1,
-0.4444507, 0.3753318, 0.6541665, 0.02745098, 1, 0, 1,
-0.4431756, -0.3744256, -3.143482, 0.01960784, 1, 0, 1,
-0.4419242, -0.09393802, -2.062702, 0.01568628, 1, 0, 1,
-0.4413991, -0.7473201, -2.82109, 0.007843138, 1, 0, 1,
-0.4374356, -0.442375, -1.771416, 0.003921569, 1, 0, 1,
-0.4345544, -0.04619896, -1.820102, 0, 1, 0.003921569, 1,
-0.4297263, 0.5842549, -0.5602894, 0, 1, 0.01176471, 1,
-0.4277677, 0.722922, -2.449883, 0, 1, 0.01568628, 1,
-0.4263348, -1.271221, -1.32243, 0, 1, 0.02352941, 1,
-0.4227502, 1.308304, -0.8481246, 0, 1, 0.02745098, 1,
-0.4185246, 1.193312, 0.7160625, 0, 1, 0.03529412, 1,
-0.4151568, 1.079259, 0.8652315, 0, 1, 0.03921569, 1,
-0.4151241, -0.4933436, -1.952136, 0, 1, 0.04705882, 1,
-0.4095218, 2.243259, 0.3681075, 0, 1, 0.05098039, 1,
-0.4090135, 0.2862886, -0.7102883, 0, 1, 0.05882353, 1,
-0.4057261, -0.3210062, -1.418968, 0, 1, 0.0627451, 1,
-0.4044581, -0.5037161, -4.04258, 0, 1, 0.07058824, 1,
-0.4041135, -0.5222751, -1.646158, 0, 1, 0.07450981, 1,
-0.4027705, -0.4987639, -1.141801, 0, 1, 0.08235294, 1,
-0.4022183, -0.2524783, -4.131977, 0, 1, 0.08627451, 1,
-0.4015541, 0.7663488, -0.8457575, 0, 1, 0.09411765, 1,
-0.399457, 1.431218, -0.8590062, 0, 1, 0.1019608, 1,
-0.3963435, 1.078459, -1.373432, 0, 1, 0.1058824, 1,
-0.3937369, -0.5917541, -2.704917, 0, 1, 0.1137255, 1,
-0.3910376, -0.3742508, -3.624173, 0, 1, 0.1176471, 1,
-0.3887541, 0.2542223, -0.6253892, 0, 1, 0.1254902, 1,
-0.3887498, -1.323887, -4.566398, 0, 1, 0.1294118, 1,
-0.3864284, 0.6922645, -0.8295811, 0, 1, 0.1372549, 1,
-0.3839393, 0.9809142, -0.7487506, 0, 1, 0.1411765, 1,
-0.3758688, -0.1332677, -2.782666, 0, 1, 0.1490196, 1,
-0.3663933, -0.3328953, -3.469141, 0, 1, 0.1529412, 1,
-0.3541417, -0.03308554, -1.075912, 0, 1, 0.1607843, 1,
-0.3533854, -0.2576251, -1.953335, 0, 1, 0.1647059, 1,
-0.3463542, -0.5187243, -4.131578, 0, 1, 0.172549, 1,
-0.3375397, 0.2718409, -0.2590582, 0, 1, 0.1764706, 1,
-0.3359039, 1.431205, 0.06840355, 0, 1, 0.1843137, 1,
-0.3288445, 0.1419057, -0.02133877, 0, 1, 0.1882353, 1,
-0.3263471, -0.5775715, -2.32777, 0, 1, 0.1960784, 1,
-0.3263315, -0.05816781, -0.8758404, 0, 1, 0.2039216, 1,
-0.3250177, 0.6175666, -2.406417, 0, 1, 0.2078431, 1,
-0.3246517, 0.4041428, -1.408478, 0, 1, 0.2156863, 1,
-0.3185447, 1.366244, 0.5060424, 0, 1, 0.2196078, 1,
-0.316738, 0.3895446, -1.005271, 0, 1, 0.227451, 1,
-0.3151634, -1.596669, -4.807174, 0, 1, 0.2313726, 1,
-0.3112611, 0.890669, -1.170261, 0, 1, 0.2392157, 1,
-0.3100209, 0.6823628, -1.061166, 0, 1, 0.2431373, 1,
-0.307662, 1.852088, 0.0445517, 0, 1, 0.2509804, 1,
-0.3026403, 1.204933, 1.310698, 0, 1, 0.254902, 1,
-0.2998913, 0.8490891, 0.1740184, 0, 1, 0.2627451, 1,
-0.2986629, -0.6208501, -1.627634, 0, 1, 0.2666667, 1,
-0.2986607, 0.4974577, -1.016031, 0, 1, 0.2745098, 1,
-0.2937132, 1.139873, 0.05052698, 0, 1, 0.2784314, 1,
-0.2907176, -0.2450671, -1.686809, 0, 1, 0.2862745, 1,
-0.2861267, 1.272464, 0.1796321, 0, 1, 0.2901961, 1,
-0.2846273, 1.10396, -1.069781, 0, 1, 0.2980392, 1,
-0.2827626, -0.725412, -2.874541, 0, 1, 0.3058824, 1,
-0.2800941, 0.6954331, -0.982472, 0, 1, 0.3098039, 1,
-0.2776408, -0.5923507, -3.721962, 0, 1, 0.3176471, 1,
-0.276695, 1.238055, -0.5614668, 0, 1, 0.3215686, 1,
-0.2753972, -0.4480039, -2.198066, 0, 1, 0.3294118, 1,
-0.2673008, -0.7757383, -1.587151, 0, 1, 0.3333333, 1,
-0.2650098, 0.8417784, 0.8850859, 0, 1, 0.3411765, 1,
-0.264468, 1.617402, 1.136021, 0, 1, 0.345098, 1,
-0.2636099, -0.5123422, -3.425406, 0, 1, 0.3529412, 1,
-0.261642, -0.584383, -3.930473, 0, 1, 0.3568628, 1,
-0.2453233, -1.336257, -3.935769, 0, 1, 0.3647059, 1,
-0.2440641, 0.613599, 0.6116669, 0, 1, 0.3686275, 1,
-0.2435281, 0.8633561, 1.833643, 0, 1, 0.3764706, 1,
-0.243329, 0.1704513, -1.010805, 0, 1, 0.3803922, 1,
-0.2398266, 0.632189, -0.7718549, 0, 1, 0.3882353, 1,
-0.2372168, -0.2900191, -3.745492, 0, 1, 0.3921569, 1,
-0.2304959, 0.7958465, -1.250717, 0, 1, 0.4, 1,
-0.230167, 0.2787548, 0.7184342, 0, 1, 0.4078431, 1,
-0.2279599, -0.7553641, -2.280929, 0, 1, 0.4117647, 1,
-0.2259825, 0.8535186, -1.824273, 0, 1, 0.4196078, 1,
-0.2256742, 3.572479, 0.9877142, 0, 1, 0.4235294, 1,
-0.2187897, -0.4966975, -5.2175, 0, 1, 0.4313726, 1,
-0.2184033, 2.150409, 1.239828, 0, 1, 0.4352941, 1,
-0.2148988, 1.30716, 2.570896, 0, 1, 0.4431373, 1,
-0.214521, 1.235531, 0.3546247, 0, 1, 0.4470588, 1,
-0.2126022, 0.5525385, -0.08701645, 0, 1, 0.454902, 1,
-0.2099528, 2.473879, -1.106486, 0, 1, 0.4588235, 1,
-0.2063435, -0.0312112, -1.39096, 0, 1, 0.4666667, 1,
-0.2054593, 0.7951741, -1.001948, 0, 1, 0.4705882, 1,
-0.2041565, -1.17632, -2.763557, 0, 1, 0.4784314, 1,
-0.2010834, -0.5985517, -2.066728, 0, 1, 0.4823529, 1,
-0.1995329, -0.07116741, -2.765377, 0, 1, 0.4901961, 1,
-0.1887935, -0.6401466, -3.950224, 0, 1, 0.4941176, 1,
-0.1880773, -0.9756243, -0.6867891, 0, 1, 0.5019608, 1,
-0.1862543, -0.02533169, -0.9196178, 0, 1, 0.509804, 1,
-0.1858349, 0.07659381, -3.119849, 0, 1, 0.5137255, 1,
-0.1799776, -0.3172503, -1.600204, 0, 1, 0.5215687, 1,
-0.1782759, -1.773302, -4.071229, 0, 1, 0.5254902, 1,
-0.1749002, 0.3979405, 1.031693, 0, 1, 0.5333334, 1,
-0.173941, -0.3356295, -2.760459, 0, 1, 0.5372549, 1,
-0.1689889, 0.8766453, -1.068149, 0, 1, 0.5450981, 1,
-0.1669381, -0.0441167, -1.881654, 0, 1, 0.5490196, 1,
-0.1660542, -0.2465644, -3.264223, 0, 1, 0.5568628, 1,
-0.1608263, -0.008172926, -1.498356, 0, 1, 0.5607843, 1,
-0.1562108, -0.3010381, -3.442306, 0, 1, 0.5686275, 1,
-0.1541197, 1.245128, 0.2541231, 0, 1, 0.572549, 1,
-0.1511991, 0.8383616, -0.7249328, 0, 1, 0.5803922, 1,
-0.150391, -1.10069, -2.876402, 0, 1, 0.5843138, 1,
-0.1503748, 0.4066414, -1.565028, 0, 1, 0.5921569, 1,
-0.1482689, -1.117481, -2.900035, 0, 1, 0.5960785, 1,
-0.1469091, -0.4012496, -2.796143, 0, 1, 0.6039216, 1,
-0.1464809, 0.3621678, -0.6419314, 0, 1, 0.6117647, 1,
-0.1419485, -1.406846, -2.829225, 0, 1, 0.6156863, 1,
-0.1407566, 0.3843394, -0.7727904, 0, 1, 0.6235294, 1,
-0.1396726, 0.5530875, -1.243447, 0, 1, 0.627451, 1,
-0.1378198, -0.1719962, -1.397378, 0, 1, 0.6352941, 1,
-0.1370997, 1.193957, 0.9126251, 0, 1, 0.6392157, 1,
-0.1348225, 1.681815, -0.1395014, 0, 1, 0.6470588, 1,
-0.1343391, -1.173278, -1.859938, 0, 1, 0.6509804, 1,
-0.132847, 0.788534, -0.4740753, 0, 1, 0.6588235, 1,
-0.1277767, 1.292843, -1.130152, 0, 1, 0.6627451, 1,
-0.1194085, -0.2958903, -3.321449, 0, 1, 0.6705883, 1,
-0.1156328, 0.3989348, 0.4856692, 0, 1, 0.6745098, 1,
-0.115071, -0.5324298, -4.137561, 0, 1, 0.682353, 1,
-0.1135694, -1.540465, -2.35668, 0, 1, 0.6862745, 1,
-0.1129831, -3.091982, -2.869257, 0, 1, 0.6941177, 1,
-0.1112202, -0.03180401, -2.542057, 0, 1, 0.7019608, 1,
-0.1111004, -0.0671426, -1.186545, 0, 1, 0.7058824, 1,
-0.1105224, -1.401531, -3.571251, 0, 1, 0.7137255, 1,
-0.1099409, -0.7580125, -1.973874, 0, 1, 0.7176471, 1,
-0.1076141, -0.4627929, -1.814504, 0, 1, 0.7254902, 1,
-0.1017402, 1.736225, -0.4010728, 0, 1, 0.7294118, 1,
-0.1013778, -0.3984141, -4.405797, 0, 1, 0.7372549, 1,
-0.09647848, -0.1750822, -4.403572, 0, 1, 0.7411765, 1,
-0.09471115, -1.190908, -2.141708, 0, 1, 0.7490196, 1,
-0.09290718, 0.2800605, -0.4092724, 0, 1, 0.7529412, 1,
-0.09013473, 1.02277, 0.05645245, 0, 1, 0.7607843, 1,
-0.09009454, -0.2002137, -2.733846, 0, 1, 0.7647059, 1,
-0.08820118, 0.6162805, 0.05155459, 0, 1, 0.772549, 1,
-0.08799657, -0.03139519, -0.7402372, 0, 1, 0.7764706, 1,
-0.08661578, 0.1593739, -0.07555571, 0, 1, 0.7843137, 1,
-0.08389822, -0.9148585, -0.7192445, 0, 1, 0.7882353, 1,
-0.0822656, -0.1215798, -4.380459, 0, 1, 0.7960784, 1,
-0.08222958, -0.7116924, -3.551739, 0, 1, 0.8039216, 1,
-0.0789369, -1.364184, -3.433538, 0, 1, 0.8078431, 1,
-0.07619131, 0.1608295, -0.9129643, 0, 1, 0.8156863, 1,
-0.07586606, 1.053441, 0.3110535, 0, 1, 0.8196079, 1,
-0.0738015, -1.162752, -1.753505, 0, 1, 0.827451, 1,
-0.07124208, 0.6078218, 0.140801, 0, 1, 0.8313726, 1,
-0.06808398, 0.6026513, -0.1019858, 0, 1, 0.8392157, 1,
-0.06470579, -0.2902167, -3.408194, 0, 1, 0.8431373, 1,
-0.06458069, 0.2219088, 1.15446, 0, 1, 0.8509804, 1,
-0.06444512, 0.3152577, 0.01066468, 0, 1, 0.854902, 1,
-0.06427944, 0.6891314, -1.124971, 0, 1, 0.8627451, 1,
-0.06075185, -0.4820732, -5.023379, 0, 1, 0.8666667, 1,
-0.05715561, -0.3316408, -3.074151, 0, 1, 0.8745098, 1,
-0.05702512, 0.7550815, 0.2566008, 0, 1, 0.8784314, 1,
-0.05628421, 3.187733, -0.8623128, 0, 1, 0.8862745, 1,
-0.05561054, -0.8261788, -2.026252, 0, 1, 0.8901961, 1,
-0.05322431, -0.2192243, -3.916925, 0, 1, 0.8980392, 1,
-0.0519428, 0.4193555, 0.4770343, 0, 1, 0.9058824, 1,
-0.04680018, -0.4309097, -3.61641, 0, 1, 0.9098039, 1,
-0.04602822, 0.3686228, -0.6091407, 0, 1, 0.9176471, 1,
-0.04499045, 0.7462118, 0.02717448, 0, 1, 0.9215686, 1,
-0.04432497, 0.7748163, 0.6505012, 0, 1, 0.9294118, 1,
-0.04149231, -0.2324253, -2.696267, 0, 1, 0.9333333, 1,
-0.0375597, -0.07361612, -1.80819, 0, 1, 0.9411765, 1,
-0.03708163, -0.2941891, -3.719524, 0, 1, 0.945098, 1,
-0.03583915, 1.210462, -0.181129, 0, 1, 0.9529412, 1,
-0.03420177, -0.4385888, -3.977966, 0, 1, 0.9568627, 1,
-0.03176969, -0.4609288, -1.920565, 0, 1, 0.9647059, 1,
-0.02840994, -1.168203, -2.848778, 0, 1, 0.9686275, 1,
-0.02752835, 0.3172089, 0.2013663, 0, 1, 0.9764706, 1,
-0.02687827, -0.7943356, -1.739144, 0, 1, 0.9803922, 1,
-0.0259663, -1.265115, -2.495293, 0, 1, 0.9882353, 1,
-0.02503085, 0.2458466, 0.3293336, 0, 1, 0.9921569, 1,
-0.02278623, -0.5088786, -2.244557, 0, 1, 1, 1,
-0.02252395, -1.807564, -1.486566, 0, 0.9921569, 1, 1,
-0.02110972, 0.7387525, -1.237099, 0, 0.9882353, 1, 1,
-0.01824114, 0.259217, 0.8491927, 0, 0.9803922, 1, 1,
-0.009714559, -2.056458, -4.250138, 0, 0.9764706, 1, 1,
-0.00861511, -0.2353344, -1.4611, 0, 0.9686275, 1, 1,
-0.007886597, -0.9837214, -3.329314, 0, 0.9647059, 1, 1,
-0.005865508, 0.01063439, -0.8538885, 0, 0.9568627, 1, 1,
-0.005280524, 1.016305, -0.6844606, 0, 0.9529412, 1, 1,
-0.001046884, -1.095922, -4.189224, 0, 0.945098, 1, 1,
-0.0004525507, -0.8402946, -3.186244, 0, 0.9411765, 1, 1,
0.001555167, 0.2619337, 0.06809261, 0, 0.9333333, 1, 1,
0.001565951, -0.1967732, 2.259065, 0, 0.9294118, 1, 1,
0.008073919, 1.298439, -0.4800615, 0, 0.9215686, 1, 1,
0.008260451, 1.093354, -0.3890627, 0, 0.9176471, 1, 1,
0.01071565, -0.01059849, 3.574168, 0, 0.9098039, 1, 1,
0.01081964, 0.825968, 0.9960068, 0, 0.9058824, 1, 1,
0.0119035, -0.9648678, 3.503411, 0, 0.8980392, 1, 1,
0.013875, 0.7805153, -0.3261317, 0, 0.8901961, 1, 1,
0.0172776, 0.5581347, -0.1860268, 0, 0.8862745, 1, 1,
0.01931788, -0.476522, 2.75459, 0, 0.8784314, 1, 1,
0.01982002, -0.2560456, 3.172298, 0, 0.8745098, 1, 1,
0.02670426, -1.219359, 1.749552, 0, 0.8666667, 1, 1,
0.02914798, 0.9936156, -0.9249861, 0, 0.8627451, 1, 1,
0.02918549, -0.3583307, 3.726562, 0, 0.854902, 1, 1,
0.03090592, 0.3559622, 2.115287, 0, 0.8509804, 1, 1,
0.0362775, -0.8515597, 3.102627, 0, 0.8431373, 1, 1,
0.04332362, -0.3296161, 3.545793, 0, 0.8392157, 1, 1,
0.04749941, 0.4135547, 1.210725, 0, 0.8313726, 1, 1,
0.0610395, 0.5652705, -0.6817809, 0, 0.827451, 1, 1,
0.06129423, -0.1064194, 2.723437, 0, 0.8196079, 1, 1,
0.06195888, 0.03050193, -0.3472113, 0, 0.8156863, 1, 1,
0.06666703, -0.2920976, 2.801342, 0, 0.8078431, 1, 1,
0.07996228, 0.7620042, 1.864378, 0, 0.8039216, 1, 1,
0.08272569, -0.7398988, 0.1559375, 0, 0.7960784, 1, 1,
0.08344761, -0.9190444, 1.695373, 0, 0.7882353, 1, 1,
0.09052183, -0.2802746, 4.968559, 0, 0.7843137, 1, 1,
0.09314702, 0.2192179, 0.7545426, 0, 0.7764706, 1, 1,
0.09513989, -0.4802742, 1.910012, 0, 0.772549, 1, 1,
0.09803603, 0.7980428, -0.6484043, 0, 0.7647059, 1, 1,
0.09988899, 2.188259, -1.283763, 0, 0.7607843, 1, 1,
0.1036085, 2.426956, -0.4776522, 0, 0.7529412, 1, 1,
0.1069431, 0.6783168, 1.02764, 0, 0.7490196, 1, 1,
0.1076705, 1.653689, -1.692178, 0, 0.7411765, 1, 1,
0.1097164, 0.3700595, -1.374697, 0, 0.7372549, 1, 1,
0.10987, 0.3224385, -0.9275213, 0, 0.7294118, 1, 1,
0.1228805, -0.06172839, 1.995027, 0, 0.7254902, 1, 1,
0.1312393, -0.1359861, 2.135544, 0, 0.7176471, 1, 1,
0.13275, -0.6404282, 2.834888, 0, 0.7137255, 1, 1,
0.1377026, 0.8539572, -3.089402, 0, 0.7058824, 1, 1,
0.1393333, -0.3009782, 2.973512, 0, 0.6980392, 1, 1,
0.1410397, -0.4322866, 4.403691, 0, 0.6941177, 1, 1,
0.1482834, 2.325183, 1.205385, 0, 0.6862745, 1, 1,
0.1517862, 0.4876757, 0.3994137, 0, 0.682353, 1, 1,
0.1545443, -0.1527836, 2.084742, 0, 0.6745098, 1, 1,
0.1574574, 0.08099696, 1.599655, 0, 0.6705883, 1, 1,
0.1620662, 0.3301523, 0.4033548, 0, 0.6627451, 1, 1,
0.1642457, -1.350654, 2.299071, 0, 0.6588235, 1, 1,
0.1651343, -0.1009753, 3.292333, 0, 0.6509804, 1, 1,
0.1675272, -1.284889, 2.484023, 0, 0.6470588, 1, 1,
0.1705955, -0.444904, 4.06607, 0, 0.6392157, 1, 1,
0.1713502, 0.1663339, 0.1685052, 0, 0.6352941, 1, 1,
0.1774594, -1.696627, 1.899517, 0, 0.627451, 1, 1,
0.1781317, 1.009525, -0.1546808, 0, 0.6235294, 1, 1,
0.1782336, 0.02152955, 2.673199, 0, 0.6156863, 1, 1,
0.1838148, 0.9971016, 0.8980982, 0, 0.6117647, 1, 1,
0.1895517, 0.5231055, 0.7590178, 0, 0.6039216, 1, 1,
0.1910734, -1.875985, 4.038467, 0, 0.5960785, 1, 1,
0.1952222, -1.005849, 4.944188, 0, 0.5921569, 1, 1,
0.1970156, -1.576192, 2.794834, 0, 0.5843138, 1, 1,
0.1984715, 0.3021777, -1.243938, 0, 0.5803922, 1, 1,
0.2128276, 0.9653927, -2.014758, 0, 0.572549, 1, 1,
0.2140818, 1.880527, 1.038192, 0, 0.5686275, 1, 1,
0.2140882, 0.5207195, -0.3270346, 0, 0.5607843, 1, 1,
0.2162704, 0.244355, 0.7391915, 0, 0.5568628, 1, 1,
0.2185905, -0.6393543, 5.05486, 0, 0.5490196, 1, 1,
0.2189907, 0.3378247, 1.329501, 0, 0.5450981, 1, 1,
0.2206762, -0.1331575, 4.477911, 0, 0.5372549, 1, 1,
0.2207718, -0.4999732, 4.316526, 0, 0.5333334, 1, 1,
0.2227463, 1.512537, -0.9546707, 0, 0.5254902, 1, 1,
0.2234769, 0.005864099, 1.692436, 0, 0.5215687, 1, 1,
0.2266867, -0.08074962, 3.224881, 0, 0.5137255, 1, 1,
0.2286885, 0.1988508, 2.506957, 0, 0.509804, 1, 1,
0.2294428, 1.215359, -1.476889, 0, 0.5019608, 1, 1,
0.2296478, -0.1852801, 1.594004, 0, 0.4941176, 1, 1,
0.230498, 1.835252, -2.555033, 0, 0.4901961, 1, 1,
0.2328223, 1.342202, 0.1369752, 0, 0.4823529, 1, 1,
0.2350599, 0.04747066, 0.2449729, 0, 0.4784314, 1, 1,
0.2370677, 1.441535, 0.2872885, 0, 0.4705882, 1, 1,
0.2395241, 0.2809322, 0.9934384, 0, 0.4666667, 1, 1,
0.2400329, 1.361266, 0.7410984, 0, 0.4588235, 1, 1,
0.2401815, -0.6076743, 4.271986, 0, 0.454902, 1, 1,
0.2413731, 0.3864644, 0.6174024, 0, 0.4470588, 1, 1,
0.2530811, 0.2794089, 1.080161, 0, 0.4431373, 1, 1,
0.2590394, 0.9884011, 0.195248, 0, 0.4352941, 1, 1,
0.2595151, 1.436793, 2.410594, 0, 0.4313726, 1, 1,
0.2596072, 1.034715, 0.1352675, 0, 0.4235294, 1, 1,
0.2617595, 0.5993138, 1.610395, 0, 0.4196078, 1, 1,
0.2634081, -2.160733, 4.038236, 0, 0.4117647, 1, 1,
0.2675354, -1.005643, 2.757117, 0, 0.4078431, 1, 1,
0.2675517, 0.2718396, -0.8364828, 0, 0.4, 1, 1,
0.2688308, -0.1484617, 3.762925, 0, 0.3921569, 1, 1,
0.2715271, 0.617473, 0.9311491, 0, 0.3882353, 1, 1,
0.272106, 1.446673, 0.6559314, 0, 0.3803922, 1, 1,
0.2737255, -0.0711237, 1.900824, 0, 0.3764706, 1, 1,
0.2751781, 1.952387, 1.698357, 0, 0.3686275, 1, 1,
0.2769139, 1.446231, -1.00817, 0, 0.3647059, 1, 1,
0.2787568, 0.8466772, 1.075249, 0, 0.3568628, 1, 1,
0.2818027, -0.2033064, 2.55175, 0, 0.3529412, 1, 1,
0.2820847, 1.470564, 0.6907598, 0, 0.345098, 1, 1,
0.2844087, -0.8407553, 3.543193, 0, 0.3411765, 1, 1,
0.284752, 0.4522156, -0.9322373, 0, 0.3333333, 1, 1,
0.2854945, 0.1441519, 1.283018, 0, 0.3294118, 1, 1,
0.2859375, -0.9897979, 2.225675, 0, 0.3215686, 1, 1,
0.2861266, -1.016792, 1.670018, 0, 0.3176471, 1, 1,
0.289769, -2.220816, 3.493558, 0, 0.3098039, 1, 1,
0.2917111, 0.3482962, -0.1811732, 0, 0.3058824, 1, 1,
0.2921755, -1.084918, 2.870689, 0, 0.2980392, 1, 1,
0.292778, 2.201597, 1.667979, 0, 0.2901961, 1, 1,
0.2932895, -0.5267962, 1.593425, 0, 0.2862745, 1, 1,
0.2934837, -1.704948, 2.396535, 0, 0.2784314, 1, 1,
0.3019485, 0.7078747, -0.05799941, 0, 0.2745098, 1, 1,
0.3030254, -0.537913, 4.187277, 0, 0.2666667, 1, 1,
0.3098558, -0.4785123, 2.36818, 0, 0.2627451, 1, 1,
0.3106207, 0.07201979, 3.905838, 0, 0.254902, 1, 1,
0.3107759, -1.224838, 2.80351, 0, 0.2509804, 1, 1,
0.3149989, 0.06379697, -0.2611995, 0, 0.2431373, 1, 1,
0.3167878, -0.3866169, 2.794539, 0, 0.2392157, 1, 1,
0.3187025, 0.8506758, 1.451997, 0, 0.2313726, 1, 1,
0.3190963, 0.4266348, 2.68665, 0, 0.227451, 1, 1,
0.3205478, -1.244239, 2.348168, 0, 0.2196078, 1, 1,
0.3210882, 1.405869, 0.2691763, 0, 0.2156863, 1, 1,
0.3269743, -0.1545203, 2.571343, 0, 0.2078431, 1, 1,
0.3283958, 0.6802233, 1.249038, 0, 0.2039216, 1, 1,
0.3320067, -0.4314619, 1.870423, 0, 0.1960784, 1, 1,
0.3331681, 1.742231, -0.4414428, 0, 0.1882353, 1, 1,
0.333456, -0.08715848, 1.80233, 0, 0.1843137, 1, 1,
0.3341951, -0.8088112, 0.5390292, 0, 0.1764706, 1, 1,
0.3374448, 0.03088238, 1.548666, 0, 0.172549, 1, 1,
0.3375409, -0.618685, 3.305493, 0, 0.1647059, 1, 1,
0.3384827, -1.047633, 1.954009, 0, 0.1607843, 1, 1,
0.346304, -0.6115374, 3.610838, 0, 0.1529412, 1, 1,
0.3475958, -1.021952, 4.045182, 0, 0.1490196, 1, 1,
0.3512805, 0.7977762, -1.034495, 0, 0.1411765, 1, 1,
0.3536196, -0.2602695, 2.926622, 0, 0.1372549, 1, 1,
0.3569787, -0.9319927, 2.399778, 0, 0.1294118, 1, 1,
0.3573029, -0.07806323, 1.393997, 0, 0.1254902, 1, 1,
0.3579389, 0.5010046, 2.29716, 0, 0.1176471, 1, 1,
0.3616547, 0.9340723, -0.7700801, 0, 0.1137255, 1, 1,
0.3641025, -0.519838, 1.893833, 0, 0.1058824, 1, 1,
0.3697635, -0.0318264, 1.422203, 0, 0.09803922, 1, 1,
0.3789457, 0.9790139, -0.4722357, 0, 0.09411765, 1, 1,
0.3850845, 1.559137, 2.036185, 0, 0.08627451, 1, 1,
0.3851253, -0.8898453, 3.430442, 0, 0.08235294, 1, 1,
0.3895203, 0.01542031, 1.867409, 0, 0.07450981, 1, 1,
0.3929534, 0.5057169, 0.9004514, 0, 0.07058824, 1, 1,
0.3938552, 1.722376, -1.206596, 0, 0.0627451, 1, 1,
0.3963511, 2.005982, -0.1966793, 0, 0.05882353, 1, 1,
0.3984846, -0.8812116, 2.369946, 0, 0.05098039, 1, 1,
0.4083393, 0.9955466, -0.07412788, 0, 0.04705882, 1, 1,
0.4108548, 0.4291696, 0.2709623, 0, 0.03921569, 1, 1,
0.4141698, 0.8795087, -0.9132882, 0, 0.03529412, 1, 1,
0.4198503, 1.027739, 0.5843839, 0, 0.02745098, 1, 1,
0.4205019, 1.748794, 1.270573, 0, 0.02352941, 1, 1,
0.4210197, -0.3876698, 2.963211, 0, 0.01568628, 1, 1,
0.421021, 0.5289866, 0.4378184, 0, 0.01176471, 1, 1,
0.4214736, -0.09480383, 2.834891, 0, 0.003921569, 1, 1,
0.4219528, 0.8967438, 1.81331, 0.003921569, 0, 1, 1,
0.4237808, 0.3465088, 0.08173747, 0.007843138, 0, 1, 1,
0.4323107, -0.416533, 1.450297, 0.01568628, 0, 1, 1,
0.448453, -1.490302, 2.629017, 0.01960784, 0, 1, 1,
0.4491706, -0.1044854, 2.952533, 0.02745098, 0, 1, 1,
0.4529445, -0.4764743, 3.619171, 0.03137255, 0, 1, 1,
0.4539284, 1.430641, -0.06515399, 0.03921569, 0, 1, 1,
0.4542567, 0.4145305, 0.0432544, 0.04313726, 0, 1, 1,
0.4591325, 0.6900951, -0.5346901, 0.05098039, 0, 1, 1,
0.4635631, 1.287286, -0.3042156, 0.05490196, 0, 1, 1,
0.464094, -1.706765, 3.035016, 0.0627451, 0, 1, 1,
0.4659032, -0.6733587, 2.37523, 0.06666667, 0, 1, 1,
0.4667709, 0.4647916, -0.1576198, 0.07450981, 0, 1, 1,
0.4700632, 1.41694, -0.5057906, 0.07843138, 0, 1, 1,
0.4704133, -0.2512407, 2.875439, 0.08627451, 0, 1, 1,
0.4780796, 2.304042, -2.427604, 0.09019608, 0, 1, 1,
0.4799635, 0.7395091, 1.2105, 0.09803922, 0, 1, 1,
0.4850925, -1.324489, 2.526634, 0.1058824, 0, 1, 1,
0.4858145, 0.8358597, 1.853739, 0.1098039, 0, 1, 1,
0.4859816, 0.9459391, 0.3096661, 0.1176471, 0, 1, 1,
0.4869501, -0.07149752, 1.742496, 0.1215686, 0, 1, 1,
0.4890887, 0.1718889, 1.383658, 0.1294118, 0, 1, 1,
0.4892723, -0.3479495, 2.266419, 0.1333333, 0, 1, 1,
0.490306, 0.2025935, 0.776448, 0.1411765, 0, 1, 1,
0.490771, -0.2237887, 1.376096, 0.145098, 0, 1, 1,
0.4959742, 0.3019282, 0.880013, 0.1529412, 0, 1, 1,
0.5008474, -1.94184, 3.67332, 0.1568628, 0, 1, 1,
0.5033039, -1.85041, 3.1924, 0.1647059, 0, 1, 1,
0.507749, 0.614489, 0.9744913, 0.1686275, 0, 1, 1,
0.50859, 1.970937, 0.1422592, 0.1764706, 0, 1, 1,
0.5097035, 0.6809868, 0.5311229, 0.1803922, 0, 1, 1,
0.5102107, 1.287008, 2.15801, 0.1882353, 0, 1, 1,
0.5123593, -0.3151947, 1.802242, 0.1921569, 0, 1, 1,
0.5161234, -1.743197, 2.837168, 0.2, 0, 1, 1,
0.5163927, 0.1884282, 1.760377, 0.2078431, 0, 1, 1,
0.5180022, 0.4068709, 1.096621, 0.2117647, 0, 1, 1,
0.518032, 1.148325, -0.0651441, 0.2196078, 0, 1, 1,
0.527238, 0.2849439, 0.9152636, 0.2235294, 0, 1, 1,
0.5290868, -0.1706025, 1.819291, 0.2313726, 0, 1, 1,
0.531918, 0.2083377, 1.608801, 0.2352941, 0, 1, 1,
0.5343117, 1.67072, 1.417254, 0.2431373, 0, 1, 1,
0.5347983, 0.6673337, 0.7168252, 0.2470588, 0, 1, 1,
0.5405971, 0.3014402, 0.3421488, 0.254902, 0, 1, 1,
0.5406788, -0.8124228, 3.023726, 0.2588235, 0, 1, 1,
0.5407848, 0.2626526, -0.3195447, 0.2666667, 0, 1, 1,
0.5426695, 1.55278, 0.9208628, 0.2705882, 0, 1, 1,
0.545663, 1.174726, 1.413411, 0.2784314, 0, 1, 1,
0.5519344, 1.072623, 0.8869731, 0.282353, 0, 1, 1,
0.5618857, -0.9578524, 2.450787, 0.2901961, 0, 1, 1,
0.5628805, 0.2360037, 2.504188, 0.2941177, 0, 1, 1,
0.5635662, -1.234256, 2.811084, 0.3019608, 0, 1, 1,
0.5645165, 0.7691874, 1.15388, 0.3098039, 0, 1, 1,
0.5662662, 0.4136904, 1.439147, 0.3137255, 0, 1, 1,
0.5676797, 0.1227185, -0.7638097, 0.3215686, 0, 1, 1,
0.5701927, -0.8114362, 3.241298, 0.3254902, 0, 1, 1,
0.5723313, 0.4171157, 0.5004885, 0.3333333, 0, 1, 1,
0.5740033, 0.4927731, 2.67182, 0.3372549, 0, 1, 1,
0.574371, 0.2517743, -0.00895141, 0.345098, 0, 1, 1,
0.5749885, 0.1736376, 1.517475, 0.3490196, 0, 1, 1,
0.5760604, 0.4701058, -0.1279773, 0.3568628, 0, 1, 1,
0.5800948, -0.7051911, 3.266615, 0.3607843, 0, 1, 1,
0.5802938, 0.7420305, 0.1817815, 0.3686275, 0, 1, 1,
0.5859661, -0.02968747, 0.07592163, 0.372549, 0, 1, 1,
0.5867007, -0.5327193, -0.4534424, 0.3803922, 0, 1, 1,
0.5914374, 0.5160275, -0.2784502, 0.3843137, 0, 1, 1,
0.5978968, -0.03796649, 3.319706, 0.3921569, 0, 1, 1,
0.6021249, -0.2462105, 1.74563, 0.3960784, 0, 1, 1,
0.6031557, -0.01706958, 1.29116, 0.4039216, 0, 1, 1,
0.6034614, -0.5273711, 1.751575, 0.4117647, 0, 1, 1,
0.6084323, -0.1783652, 1.709789, 0.4156863, 0, 1, 1,
0.6096954, 0.04599675, 2.886117, 0.4235294, 0, 1, 1,
0.6131064, 0.0121094, 0.6995195, 0.427451, 0, 1, 1,
0.6161649, 0.3466684, 0.4309501, 0.4352941, 0, 1, 1,
0.6251443, -0.5048425, 1.207949, 0.4392157, 0, 1, 1,
0.6327275, 0.2241623, 0.7350289, 0.4470588, 0, 1, 1,
0.6368135, 0.02572699, 2.756755, 0.4509804, 0, 1, 1,
0.640385, 0.3830929, 1.314736, 0.4588235, 0, 1, 1,
0.6404038, -1.055475, 2.845472, 0.4627451, 0, 1, 1,
0.6443896, 0.6341763, 1.132422, 0.4705882, 0, 1, 1,
0.6466037, 0.3902986, 1.242627, 0.4745098, 0, 1, 1,
0.6466367, -0.7806466, 2.900223, 0.4823529, 0, 1, 1,
0.6491372, -0.6178198, 2.971242, 0.4862745, 0, 1, 1,
0.6529761, -0.7000319, 2.924313, 0.4941176, 0, 1, 1,
0.6554035, 0.4776855, 0.1601477, 0.5019608, 0, 1, 1,
0.6558865, -2.080559, 0.9915367, 0.5058824, 0, 1, 1,
0.6565438, -1.27719, 2.393059, 0.5137255, 0, 1, 1,
0.6575667, -0.9795132, 3.157978, 0.5176471, 0, 1, 1,
0.6589071, -0.9734014, 3.4705, 0.5254902, 0, 1, 1,
0.6686352, 0.6603639, 0.02404601, 0.5294118, 0, 1, 1,
0.6727358, -0.7768067, 3.784844, 0.5372549, 0, 1, 1,
0.6735539, -1.609949, 2.338109, 0.5411765, 0, 1, 1,
0.681289, 1.435989, -1.14722, 0.5490196, 0, 1, 1,
0.6829054, 0.6600085, 0.188056, 0.5529412, 0, 1, 1,
0.6829494, 1.050505, 2.066801, 0.5607843, 0, 1, 1,
0.6846268, 0.04405434, 2.676394, 0.5647059, 0, 1, 1,
0.6901893, 0.1478764, 0.9121979, 0.572549, 0, 1, 1,
0.6962463, -1.727714, 3.97794, 0.5764706, 0, 1, 1,
0.6971599, 0.4257812, 1.007818, 0.5843138, 0, 1, 1,
0.6980165, -0.103076, 2.025548, 0.5882353, 0, 1, 1,
0.6983575, 0.1817113, 1.959001, 0.5960785, 0, 1, 1,
0.7026107, 0.6932358, 2.220692, 0.6039216, 0, 1, 1,
0.7063613, -0.6404827, 2.559539, 0.6078432, 0, 1, 1,
0.7071716, -1.63728, 3.584813, 0.6156863, 0, 1, 1,
0.7148165, 0.8768104, 1.412755, 0.6196079, 0, 1, 1,
0.7160783, -0.1864951, 3.341669, 0.627451, 0, 1, 1,
0.7220899, -0.7901936, 3.517321, 0.6313726, 0, 1, 1,
0.7225376, 1.105826, 0.9200329, 0.6392157, 0, 1, 1,
0.7299745, -0.5435207, 2.972925, 0.6431373, 0, 1, 1,
0.7343143, 0.8837769, 0.1869404, 0.6509804, 0, 1, 1,
0.7355433, 0.6011761, 0.002476996, 0.654902, 0, 1, 1,
0.735979, 0.01175954, 2.522067, 0.6627451, 0, 1, 1,
0.7413625, -0.5730338, 4.494839, 0.6666667, 0, 1, 1,
0.7434872, 2.352807, -0.1322911, 0.6745098, 0, 1, 1,
0.7478452, -1.780649, 4.418548, 0.6784314, 0, 1, 1,
0.7581666, -0.9658589, 1.358564, 0.6862745, 0, 1, 1,
0.7637191, 1.2921, -0.9232846, 0.6901961, 0, 1, 1,
0.7762761, -0.5753497, 3.094979, 0.6980392, 0, 1, 1,
0.7768825, -0.2548599, 2.589214, 0.7058824, 0, 1, 1,
0.7825174, 1.772114, 0.143922, 0.7098039, 0, 1, 1,
0.789736, -0.9603525, 3.490693, 0.7176471, 0, 1, 1,
0.7907442, -1.450506, 1.427775, 0.7215686, 0, 1, 1,
0.7948991, -1.130298, 2.482345, 0.7294118, 0, 1, 1,
0.7949845, -0.5515591, 1.465015, 0.7333333, 0, 1, 1,
0.7967749, 0.08885872, 1.836781, 0.7411765, 0, 1, 1,
0.8015629, 2.546485, 1.048403, 0.7450981, 0, 1, 1,
0.8050378, 0.52968, 1.955849, 0.7529412, 0, 1, 1,
0.8098771, 0.2647665, 0.1658519, 0.7568628, 0, 1, 1,
0.8137379, 1.42154, 0.04998682, 0.7647059, 0, 1, 1,
0.8249721, 0.1155832, 1.557197, 0.7686275, 0, 1, 1,
0.8257221, 2.021467, 0.08659483, 0.7764706, 0, 1, 1,
0.8258963, 0.8940994, 1.136113, 0.7803922, 0, 1, 1,
0.8279097, 0.5711755, 0.7140873, 0.7882353, 0, 1, 1,
0.8300066, -0.9671286, 3.237671, 0.7921569, 0, 1, 1,
0.8302068, -1.33842, 2.12632, 0.8, 0, 1, 1,
0.8307437, 0.5209677, 0.7252061, 0.8078431, 0, 1, 1,
0.8310705, -2.266956, 4.230563, 0.8117647, 0, 1, 1,
0.8338116, 1.059855, 0.3784611, 0.8196079, 0, 1, 1,
0.8376726, 0.04010379, 2.920052, 0.8235294, 0, 1, 1,
0.8462929, -0.5899885, 1.932526, 0.8313726, 0, 1, 1,
0.8566194, -0.4763581, 3.985816, 0.8352941, 0, 1, 1,
0.8574004, -1.288768, 3.001895, 0.8431373, 0, 1, 1,
0.8720886, 1.012517, -0.2099068, 0.8470588, 0, 1, 1,
0.875553, -0.725176, 2.476767, 0.854902, 0, 1, 1,
0.8757796, 2.039493, 0.1983257, 0.8588235, 0, 1, 1,
0.8890712, 0.4591224, 1.681352, 0.8666667, 0, 1, 1,
0.8930056, 0.3076358, 0.91658, 0.8705882, 0, 1, 1,
0.9020041, -2.426217, 3.172194, 0.8784314, 0, 1, 1,
0.9025155, 0.277901, 1.206625, 0.8823529, 0, 1, 1,
0.9042198, 0.772059, 0.5440837, 0.8901961, 0, 1, 1,
0.9145837, 1.259504, 0.3329129, 0.8941177, 0, 1, 1,
0.9168034, 0.1006192, 2.811487, 0.9019608, 0, 1, 1,
0.918952, -1.086938, 1.745023, 0.9098039, 0, 1, 1,
0.9251772, -0.6239467, 1.383057, 0.9137255, 0, 1, 1,
0.9285712, 0.8241383, 1.36436, 0.9215686, 0, 1, 1,
0.9300705, 0.9832481, 0.6166405, 0.9254902, 0, 1, 1,
0.9327063, -0.4650749, 1.265865, 0.9333333, 0, 1, 1,
0.9335427, -0.710695, 2.576653, 0.9372549, 0, 1, 1,
0.9391847, 0.05581253, 1.068251, 0.945098, 0, 1, 1,
0.9468018, 0.793659, 1.832273, 0.9490196, 0, 1, 1,
0.9486669, -1.39795, 4.167207, 0.9568627, 0, 1, 1,
0.950411, 1.053466, -0.9208906, 0.9607843, 0, 1, 1,
0.9517903, 0.7380579, 0.8969641, 0.9686275, 0, 1, 1,
0.9519989, 0.7978592, 1.171226, 0.972549, 0, 1, 1,
0.9554173, 1.427408, 1.194293, 0.9803922, 0, 1, 1,
0.956046, -0.6806467, 1.542329, 0.9843137, 0, 1, 1,
0.9578847, -0.04963363, -0.4499072, 0.9921569, 0, 1, 1,
0.9582869, -0.722645, 1.875594, 0.9960784, 0, 1, 1,
0.9608808, 0.3133766, 1.549631, 1, 0, 0.9960784, 1,
0.9648839, -0.866293, 2.695662, 1, 0, 0.9882353, 1,
0.9653022, -0.8817054, 2.640038, 1, 0, 0.9843137, 1,
0.9674056, 0.5418015, 1.23881, 1, 0, 0.9764706, 1,
0.9769782, -0.4596713, 2.070362, 1, 0, 0.972549, 1,
0.9800925, -0.2942646, 1.673156, 1, 0, 0.9647059, 1,
0.982587, -0.03607129, 2.599044, 1, 0, 0.9607843, 1,
0.9886948, 1.70802, -0.5477902, 1, 0, 0.9529412, 1,
0.9947424, -0.4436461, 1.982802, 1, 0, 0.9490196, 1,
0.9998906, -0.5939711, 1.463673, 1, 0, 0.9411765, 1,
1.005885, -0.20086, 1.146818, 1, 0, 0.9372549, 1,
1.008731, -0.4879354, 0.948636, 1, 0, 0.9294118, 1,
1.009654, -0.8374527, 3.749738, 1, 0, 0.9254902, 1,
1.013327, 0.5361085, -0.5414116, 1, 0, 0.9176471, 1,
1.014358, -0.006311825, 0.765935, 1, 0, 0.9137255, 1,
1.014521, 0.24971, 1.989203, 1, 0, 0.9058824, 1,
1.020586, -0.9392613, 0.6668919, 1, 0, 0.9019608, 1,
1.031862, 0.233305, 1.631152, 1, 0, 0.8941177, 1,
1.039278, -1.407097, 2.715604, 1, 0, 0.8862745, 1,
1.039919, -0.5041755, 3.158316, 1, 0, 0.8823529, 1,
1.040015, 0.001481095, 1.9297, 1, 0, 0.8745098, 1,
1.044639, -1.226093, -0.05860398, 1, 0, 0.8705882, 1,
1.046377, -0.1279654, 0.6245597, 1, 0, 0.8627451, 1,
1.049407, 1.491245, 1.109012, 1, 0, 0.8588235, 1,
1.050954, 0.4207486, 0.2583971, 1, 0, 0.8509804, 1,
1.053931, 1.136038, -0.02196813, 1, 0, 0.8470588, 1,
1.054758, 0.7607555, 0.3593239, 1, 0, 0.8392157, 1,
1.05512, 2.968274, 0.05978645, 1, 0, 0.8352941, 1,
1.057451, 0.5395951, 0.02732343, 1, 0, 0.827451, 1,
1.073301, -1.256194, 1.636858, 1, 0, 0.8235294, 1,
1.079725, -0.8047879, 0.8846683, 1, 0, 0.8156863, 1,
1.085535, 0.8761989, 0.574999, 1, 0, 0.8117647, 1,
1.090071, 1.292651, 0.7508546, 1, 0, 0.8039216, 1,
1.092988, -0.7338208, 1.896522, 1, 0, 0.7960784, 1,
1.093927, 1.3364, -0.05882564, 1, 0, 0.7921569, 1,
1.101005, 0.2969507, 1.860695, 1, 0, 0.7843137, 1,
1.108536, -1.584378, 2.887935, 1, 0, 0.7803922, 1,
1.10984, -1.189183, 2.837733, 1, 0, 0.772549, 1,
1.111977, -0.07918919, 0.1557004, 1, 0, 0.7686275, 1,
1.11369, 0.6913564, -1.028285, 1, 0, 0.7607843, 1,
1.11617, 0.1765404, 1.029287, 1, 0, 0.7568628, 1,
1.128312, -0.9691098, 3.059849, 1, 0, 0.7490196, 1,
1.132745, 0.6171424, 1.354279, 1, 0, 0.7450981, 1,
1.134216, 0.3000473, 0.6787643, 1, 0, 0.7372549, 1,
1.134481, 0.6225448, 1.096825, 1, 0, 0.7333333, 1,
1.140529, 0.3129506, 1.99948, 1, 0, 0.7254902, 1,
1.152162, 0.5039844, 1.965212, 1, 0, 0.7215686, 1,
1.154057, 1.066769, 1.500547, 1, 0, 0.7137255, 1,
1.157809, -0.09241442, 1.574219, 1, 0, 0.7098039, 1,
1.158191, -1.58717, 2.783396, 1, 0, 0.7019608, 1,
1.164294, -0.8851628, 1.900819, 1, 0, 0.6941177, 1,
1.167778, -1.175714, 0.7353646, 1, 0, 0.6901961, 1,
1.173332, 0.4045964, 1.991714, 1, 0, 0.682353, 1,
1.178565, 1.175236, 1.131535, 1, 0, 0.6784314, 1,
1.184945, 1.730846, -0.7422559, 1, 0, 0.6705883, 1,
1.19303, -0.02442201, 2.351555, 1, 0, 0.6666667, 1,
1.195764, -1.129631, 1.850305, 1, 0, 0.6588235, 1,
1.198735, -0.01121206, 0.954914, 1, 0, 0.654902, 1,
1.205301, 1.339195, -0.366338, 1, 0, 0.6470588, 1,
1.207472, 0.8326402, 2.836523, 1, 0, 0.6431373, 1,
1.22171, 0.2564247, 2.222047, 1, 0, 0.6352941, 1,
1.223467, -0.3533893, 4.619656, 1, 0, 0.6313726, 1,
1.225887, -0.2623941, 1.804908, 1, 0, 0.6235294, 1,
1.225911, 1.477974, -1.090544, 1, 0, 0.6196079, 1,
1.237387, 1.601613, 0.3981263, 1, 0, 0.6117647, 1,
1.238712, -1.509363, 2.881053, 1, 0, 0.6078432, 1,
1.238769, 0.4490406, 1.287055, 1, 0, 0.6, 1,
1.245964, 1.030745, 2.258917, 1, 0, 0.5921569, 1,
1.261329, 0.5680094, 0.7870322, 1, 0, 0.5882353, 1,
1.27104, -0.7233129, 3.616294, 1, 0, 0.5803922, 1,
1.28752, 0.1441785, 1.898838, 1, 0, 0.5764706, 1,
1.288286, -0.473076, 2.172178, 1, 0, 0.5686275, 1,
1.300739, -0.7441483, 3.499391, 1, 0, 0.5647059, 1,
1.304964, 0.3404525, 0.3742786, 1, 0, 0.5568628, 1,
1.305529, -1.75382, 3.340586, 1, 0, 0.5529412, 1,
1.313043, 0.2872548, 1.339853, 1, 0, 0.5450981, 1,
1.317189, 1.153117, 0.5249279, 1, 0, 0.5411765, 1,
1.319364, -0.7943244, 2.473817, 1, 0, 0.5333334, 1,
1.323413, -0.5931923, 3.043042, 1, 0, 0.5294118, 1,
1.324297, 1.655393, -1.286043, 1, 0, 0.5215687, 1,
1.324738, -0.3989051, 1.457304, 1, 0, 0.5176471, 1,
1.343039, 1.508599, -0.9625357, 1, 0, 0.509804, 1,
1.358351, -0.04213899, 2.414878, 1, 0, 0.5058824, 1,
1.378593, 0.3427143, 0.2156679, 1, 0, 0.4980392, 1,
1.380917, -1.340521, 2.500939, 1, 0, 0.4901961, 1,
1.394651, 0.7392282, 0.8779856, 1, 0, 0.4862745, 1,
1.39829, -0.9418001, 2.246316, 1, 0, 0.4784314, 1,
1.398925, -0.4919833, 0.6348127, 1, 0, 0.4745098, 1,
1.402547, -0.6102612, 1.45751, 1, 0, 0.4666667, 1,
1.434767, -1.223207, 1.682922, 1, 0, 0.4627451, 1,
1.438952, -2.128953, 2.499074, 1, 0, 0.454902, 1,
1.439412, -0.140459, 2.381046, 1, 0, 0.4509804, 1,
1.441406, 0.4035971, 1.993126, 1, 0, 0.4431373, 1,
1.441888, 1.275086, -0.4258652, 1, 0, 0.4392157, 1,
1.449122, -1.351067, 0.159595, 1, 0, 0.4313726, 1,
1.45945, -0.5176971, 3.012388, 1, 0, 0.427451, 1,
1.460324, -1.384769, 1.651487, 1, 0, 0.4196078, 1,
1.460641, -0.1385308, 2.677317, 1, 0, 0.4156863, 1,
1.463432, -2.020854, 2.531268, 1, 0, 0.4078431, 1,
1.466539, -0.8889841, 3.140053, 1, 0, 0.4039216, 1,
1.487499, -0.2198848, 0.8669408, 1, 0, 0.3960784, 1,
1.493163, -0.3969504, 1.551926, 1, 0, 0.3882353, 1,
1.496946, -0.794956, 1.592466, 1, 0, 0.3843137, 1,
1.502485, -0.5091754, 1.585421, 1, 0, 0.3764706, 1,
1.517428, -1.818978, 3.789916, 1, 0, 0.372549, 1,
1.520912, 0.2254927, 2.781751, 1, 0, 0.3647059, 1,
1.521884, 1.283291, -0.271769, 1, 0, 0.3607843, 1,
1.535689, 1.555795, 0.4508754, 1, 0, 0.3529412, 1,
1.536728, 0.7376058, 0.4263261, 1, 0, 0.3490196, 1,
1.546091, -1.153871, 0.816299, 1, 0, 0.3411765, 1,
1.55646, 1.354088, -0.5513425, 1, 0, 0.3372549, 1,
1.556539, -0.8324606, 2.2938, 1, 0, 0.3294118, 1,
1.563967, 1.98145, 2.106196, 1, 0, 0.3254902, 1,
1.571201, -0.1609491, 2.754728, 1, 0, 0.3176471, 1,
1.571354, -0.5079286, 0.5956463, 1, 0, 0.3137255, 1,
1.589619, 0.5207861, 1.76566, 1, 0, 0.3058824, 1,
1.611326, -0.5892636, 2.583139, 1, 0, 0.2980392, 1,
1.614973, 0.1191103, 0.08181386, 1, 0, 0.2941177, 1,
1.616663, -0.4093346, 1.769779, 1, 0, 0.2862745, 1,
1.621108, 0.5049059, 0.2681683, 1, 0, 0.282353, 1,
1.621514, 0.9137391, 0.9758476, 1, 0, 0.2745098, 1,
1.627069, 0.1110407, -1.377, 1, 0, 0.2705882, 1,
1.647916, -0.2349426, 1.451796, 1, 0, 0.2627451, 1,
1.670653, -0.6872301, 0.9611494, 1, 0, 0.2588235, 1,
1.670682, -1.769067, 2.052337, 1, 0, 0.2509804, 1,
1.672305, -0.8459057, 0.5229099, 1, 0, 0.2470588, 1,
1.681224, 0.286821, 0.3441459, 1, 0, 0.2392157, 1,
1.68349, 0.5268458, 4.069461, 1, 0, 0.2352941, 1,
1.700392, 0.3108833, 3.425876, 1, 0, 0.227451, 1,
1.703351, -2.064105, 2.472678, 1, 0, 0.2235294, 1,
1.706209, 1.853848, -0.345163, 1, 0, 0.2156863, 1,
1.711922, 0.7976924, 1.334538, 1, 0, 0.2117647, 1,
1.723787, 1.668934, 0.002544637, 1, 0, 0.2039216, 1,
1.731361, -1.106881, 1.636968, 1, 0, 0.1960784, 1,
1.731574, -1.258997, 2.809697, 1, 0, 0.1921569, 1,
1.746109, 0.3462709, -0.08881313, 1, 0, 0.1843137, 1,
1.747822, 0.312224, 2.837704, 1, 0, 0.1803922, 1,
1.763906, -1.523346, 2.992317, 1, 0, 0.172549, 1,
1.765115, -0.003639275, 0.7348728, 1, 0, 0.1686275, 1,
1.788259, -0.3524142, 0.8138999, 1, 0, 0.1607843, 1,
1.802072, 0.8873265, 0.60119, 1, 0, 0.1568628, 1,
1.808312, 0.8644248, 1.946455, 1, 0, 0.1490196, 1,
1.811293, -0.5270373, 2.553115, 1, 0, 0.145098, 1,
1.817346, -0.4246576, 2.605904, 1, 0, 0.1372549, 1,
1.907642, -0.4855242, -0.6108896, 1, 0, 0.1333333, 1,
2.012333, 0.5120628, 2.780727, 1, 0, 0.1254902, 1,
2.064455, -1.815, 2.302191, 1, 0, 0.1215686, 1,
2.074067, 1.140406, 1.498025, 1, 0, 0.1137255, 1,
2.118798, -0.732585, 0.727033, 1, 0, 0.1098039, 1,
2.14821, 0.4708232, 0.7927292, 1, 0, 0.1019608, 1,
2.151106, -1.675074, 3.218585, 1, 0, 0.09411765, 1,
2.214751, 1.834394, 2.669625, 1, 0, 0.09019608, 1,
2.227024, 0.6048518, 1.869208, 1, 0, 0.08235294, 1,
2.231799, 0.5946624, 3.312672, 1, 0, 0.07843138, 1,
2.243204, -0.9277194, 2.693994, 1, 0, 0.07058824, 1,
2.279328, 3.444879, 1.265413, 1, 0, 0.06666667, 1,
2.434066, 0.6676744, 2.1966, 1, 0, 0.05882353, 1,
2.458238, -0.8694801, 1.487397, 1, 0, 0.05490196, 1,
2.518275, 0.6742758, 2.630998, 1, 0, 0.04705882, 1,
2.522681, -0.1871646, 1.223431, 1, 0, 0.04313726, 1,
2.634885, 0.0838559, 2.061095, 1, 0, 0.03529412, 1,
2.68269, 0.01991206, 1.918595, 1, 0, 0.03137255, 1,
2.698476, 0.142975, 1.457132, 1, 0, 0.02352941, 1,
2.756942, -0.1194037, 1.191525, 1, 0, 0.01960784, 1,
3.269335, 1.386101, 0.9146602, 1, 0, 0.01176471, 1,
3.297698, -0.4844471, 0.8565997, 1, 0, 0.007843138, 1
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
-0.2512351, -4.425241, -6.958665, 0, -0.5, 0.5, 0.5,
-0.2512351, -4.425241, -6.958665, 1, -0.5, 0.5, 0.5,
-0.2512351, -4.425241, -6.958665, 1, 1.5, 0.5, 0.5,
-0.2512351, -4.425241, -6.958665, 0, 1.5, 0.5, 0.5
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
-5.003257, 0.1531892, -6.958665, 0, -0.5, 0.5, 0.5,
-5.003257, 0.1531892, -6.958665, 1, -0.5, 0.5, 0.5,
-5.003257, 0.1531892, -6.958665, 1, 1.5, 0.5, 0.5,
-5.003257, 0.1531892, -6.958665, 0, 1.5, 0.5, 0.5
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
-5.003257, -4.425241, -0.08132005, 0, -0.5, 0.5, 0.5,
-5.003257, -4.425241, -0.08132005, 1, -0.5, 0.5, 0.5,
-5.003257, -4.425241, -0.08132005, 1, 1.5, 0.5, 0.5,
-5.003257, -4.425241, -0.08132005, 0, 1.5, 0.5, 0.5
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
-2, -3.36868, -5.371586,
2, -3.36868, -5.371586,
-2, -3.36868, -5.371586,
-2, -3.544773, -5.636099,
0, -3.36868, -5.371586,
0, -3.544773, -5.636099,
2, -3.36868, -5.371586,
2, -3.544773, -5.636099
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
"0",
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
-2, -3.89696, -6.165125, 0, -0.5, 0.5, 0.5,
-2, -3.89696, -6.165125, 1, -0.5, 0.5, 0.5,
-2, -3.89696, -6.165125, 1, 1.5, 0.5, 0.5,
-2, -3.89696, -6.165125, 0, 1.5, 0.5, 0.5,
0, -3.89696, -6.165125, 0, -0.5, 0.5, 0.5,
0, -3.89696, -6.165125, 1, -0.5, 0.5, 0.5,
0, -3.89696, -6.165125, 1, 1.5, 0.5, 0.5,
0, -3.89696, -6.165125, 0, 1.5, 0.5, 0.5,
2, -3.89696, -6.165125, 0, -0.5, 0.5, 0.5,
2, -3.89696, -6.165125, 1, -0.5, 0.5, 0.5,
2, -3.89696, -6.165125, 1, 1.5, 0.5, 0.5,
2, -3.89696, -6.165125, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.906636, -3, -5.371586,
-3.906636, 3, -5.371586,
-3.906636, -3, -5.371586,
-4.089406, -3, -5.636099,
-3.906636, -2, -5.371586,
-4.089406, -2, -5.636099,
-3.906636, -1, -5.371586,
-4.089406, -1, -5.636099,
-3.906636, 0, -5.371586,
-4.089406, 0, -5.636099,
-3.906636, 1, -5.371586,
-4.089406, 1, -5.636099,
-3.906636, 2, -5.371586,
-4.089406, 2, -5.636099,
-3.906636, 3, -5.371586,
-4.089406, 3, -5.636099
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
-4.454947, -3, -6.165125, 0, -0.5, 0.5, 0.5,
-4.454947, -3, -6.165125, 1, -0.5, 0.5, 0.5,
-4.454947, -3, -6.165125, 1, 1.5, 0.5, 0.5,
-4.454947, -3, -6.165125, 0, 1.5, 0.5, 0.5,
-4.454947, -2, -6.165125, 0, -0.5, 0.5, 0.5,
-4.454947, -2, -6.165125, 1, -0.5, 0.5, 0.5,
-4.454947, -2, -6.165125, 1, 1.5, 0.5, 0.5,
-4.454947, -2, -6.165125, 0, 1.5, 0.5, 0.5,
-4.454947, -1, -6.165125, 0, -0.5, 0.5, 0.5,
-4.454947, -1, -6.165125, 1, -0.5, 0.5, 0.5,
-4.454947, -1, -6.165125, 1, 1.5, 0.5, 0.5,
-4.454947, -1, -6.165125, 0, 1.5, 0.5, 0.5,
-4.454947, 0, -6.165125, 0, -0.5, 0.5, 0.5,
-4.454947, 0, -6.165125, 1, -0.5, 0.5, 0.5,
-4.454947, 0, -6.165125, 1, 1.5, 0.5, 0.5,
-4.454947, 0, -6.165125, 0, 1.5, 0.5, 0.5,
-4.454947, 1, -6.165125, 0, -0.5, 0.5, 0.5,
-4.454947, 1, -6.165125, 1, -0.5, 0.5, 0.5,
-4.454947, 1, -6.165125, 1, 1.5, 0.5, 0.5,
-4.454947, 1, -6.165125, 0, 1.5, 0.5, 0.5,
-4.454947, 2, -6.165125, 0, -0.5, 0.5, 0.5,
-4.454947, 2, -6.165125, 1, -0.5, 0.5, 0.5,
-4.454947, 2, -6.165125, 1, 1.5, 0.5, 0.5,
-4.454947, 2, -6.165125, 0, 1.5, 0.5, 0.5,
-4.454947, 3, -6.165125, 0, -0.5, 0.5, 0.5,
-4.454947, 3, -6.165125, 1, -0.5, 0.5, 0.5,
-4.454947, 3, -6.165125, 1, 1.5, 0.5, 0.5,
-4.454947, 3, -6.165125, 0, 1.5, 0.5, 0.5
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
-3.906636, -3.36868, -4,
-3.906636, -3.36868, 4,
-3.906636, -3.36868, -4,
-4.089406, -3.544773, -4,
-3.906636, -3.36868, -2,
-4.089406, -3.544773, -2,
-3.906636, -3.36868, 0,
-4.089406, -3.544773, 0,
-3.906636, -3.36868, 2,
-4.089406, -3.544773, 2,
-3.906636, -3.36868, 4,
-4.089406, -3.544773, 4
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
-4.454947, -3.89696, -4, 0, -0.5, 0.5, 0.5,
-4.454947, -3.89696, -4, 1, -0.5, 0.5, 0.5,
-4.454947, -3.89696, -4, 1, 1.5, 0.5, 0.5,
-4.454947, -3.89696, -4, 0, 1.5, 0.5, 0.5,
-4.454947, -3.89696, -2, 0, -0.5, 0.5, 0.5,
-4.454947, -3.89696, -2, 1, -0.5, 0.5, 0.5,
-4.454947, -3.89696, -2, 1, 1.5, 0.5, 0.5,
-4.454947, -3.89696, -2, 0, 1.5, 0.5, 0.5,
-4.454947, -3.89696, 0, 0, -0.5, 0.5, 0.5,
-4.454947, -3.89696, 0, 1, -0.5, 0.5, 0.5,
-4.454947, -3.89696, 0, 1, 1.5, 0.5, 0.5,
-4.454947, -3.89696, 0, 0, 1.5, 0.5, 0.5,
-4.454947, -3.89696, 2, 0, -0.5, 0.5, 0.5,
-4.454947, -3.89696, 2, 1, -0.5, 0.5, 0.5,
-4.454947, -3.89696, 2, 1, 1.5, 0.5, 0.5,
-4.454947, -3.89696, 2, 0, 1.5, 0.5, 0.5,
-4.454947, -3.89696, 4, 0, -0.5, 0.5, 0.5,
-4.454947, -3.89696, 4, 1, -0.5, 0.5, 0.5,
-4.454947, -3.89696, 4, 1, 1.5, 0.5, 0.5,
-4.454947, -3.89696, 4, 0, 1.5, 0.5, 0.5
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
-3.906636, -3.36868, -5.371586,
-3.906636, 3.675058, -5.371586,
-3.906636, -3.36868, 5.208946,
-3.906636, 3.675058, 5.208946,
-3.906636, -3.36868, -5.371586,
-3.906636, -3.36868, 5.208946,
-3.906636, 3.675058, -5.371586,
-3.906636, 3.675058, 5.208946,
-3.906636, -3.36868, -5.371586,
3.404166, -3.36868, -5.371586,
-3.906636, -3.36868, 5.208946,
3.404166, -3.36868, 5.208946,
-3.906636, 3.675058, -5.371586,
3.404166, 3.675058, -5.371586,
-3.906636, 3.675058, 5.208946,
3.404166, 3.675058, 5.208946,
3.404166, -3.36868, -5.371586,
3.404166, 3.675058, -5.371586,
3.404166, -3.36868, 5.208946,
3.404166, 3.675058, 5.208946,
3.404166, -3.36868, -5.371586,
3.404166, -3.36868, 5.208946,
3.404166, 3.675058, -5.371586,
3.404166, 3.675058, 5.208946
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
var radius = 7.829869;
var distance = 34.83598;
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
mvMatrix.translate( 0.2512351, -0.1531892, 0.08132005 );
mvMatrix.scale( 1.157986, 1.201891, 0.8001307 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.83598);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Phenylcarbamic_Acid_<-read.table("Phenylcarbamic_Acid_.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenylcarbamic_Acid_$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenylcarbamic_Acid_' not found
```

```r
y<-Phenylcarbamic_Acid_$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenylcarbamic_Acid_' not found
```

```r
z<-Phenylcarbamic_Acid_$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenylcarbamic_Acid_' not found
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
-3.800168, 0.2267483, -0.9263611, 0, 0, 1, 1, 1,
-3.126015, -1.8068, -3.450437, 1, 0, 0, 1, 1,
-2.897133, -0.03215669, -4.091176, 1, 0, 0, 1, 1,
-2.818866, 0.7522585, -1.539078, 1, 0, 0, 1, 1,
-2.583277, 0.9834099, -1.068771, 1, 0, 0, 1, 1,
-2.578939, -0.6184811, -2.216061, 1, 0, 0, 1, 1,
-2.491659, 0.3232918, -0.3426107, 0, 0, 0, 1, 1,
-2.377423, 1.21977, -0.9576133, 0, 0, 0, 1, 1,
-2.353348, -0.7783875, -2.303685, 0, 0, 0, 1, 1,
-2.337042, 1.32934, -2.446685, 0, 0, 0, 1, 1,
-2.334298, 2.02804, -0.07074775, 0, 0, 0, 1, 1,
-2.328249, -0.4099878, -0.6937904, 0, 0, 0, 1, 1,
-2.266989, -0.127187, -2.118724, 0, 0, 0, 1, 1,
-2.260784, 0.3602745, -1.850877, 1, 1, 1, 1, 1,
-2.229534, 0.7284597, -1.563415, 1, 1, 1, 1, 1,
-2.218127, -1.560614, -0.04163769, 1, 1, 1, 1, 1,
-2.203898, 1.032963, -1.747138, 1, 1, 1, 1, 1,
-2.15719, -1.198424, -2.264273, 1, 1, 1, 1, 1,
-2.152965, -0.669304, -1.671454, 1, 1, 1, 1, 1,
-2.148282, 0.1817449, -2.893088, 1, 1, 1, 1, 1,
-2.146521, -0.268898, -2.856016, 1, 1, 1, 1, 1,
-2.13418, 0.2474694, -1.63284, 1, 1, 1, 1, 1,
-2.131823, -0.04741186, -3.194349, 1, 1, 1, 1, 1,
-2.123967, 0.1269748, -2.48754, 1, 1, 1, 1, 1,
-2.10064, -0.8304675, -1.993773, 1, 1, 1, 1, 1,
-2.094983, 0.5011697, -0.7063641, 1, 1, 1, 1, 1,
-2.064338, -0.2307208, -0.7621343, 1, 1, 1, 1, 1,
-1.995587, -0.7785041, -1.845721, 1, 1, 1, 1, 1,
-1.993053, -3.266101, -0.706085, 0, 0, 1, 1, 1,
-1.967925, -0.3660013, -1.787107, 1, 0, 0, 1, 1,
-1.962166, -0.1502412, -1.232494, 1, 0, 0, 1, 1,
-1.944009, 0.2232206, -1.422007, 1, 0, 0, 1, 1,
-1.907271, 1.330543, -0.4993781, 1, 0, 0, 1, 1,
-1.87514, -1.492759, -2.296764, 1, 0, 0, 1, 1,
-1.874935, 0.4992999, -0.2599655, 0, 0, 0, 1, 1,
-1.816644, -0.1343059, -1.625122, 0, 0, 0, 1, 1,
-1.811116, 1.066936, -1.366464, 0, 0, 0, 1, 1,
-1.794367, -0.2361115, -2.295194, 0, 0, 0, 1, 1,
-1.78871, 0.7598488, -1.271902, 0, 0, 0, 1, 1,
-1.786573, -1.050623, -1.824393, 0, 0, 0, 1, 1,
-1.764344, -0.9776627, -2.348025, 0, 0, 0, 1, 1,
-1.735229, -0.1965985, -0.8979818, 1, 1, 1, 1, 1,
-1.712315, -0.5330282, -0.3815497, 1, 1, 1, 1, 1,
-1.711717, -1.214298, -1.889691, 1, 1, 1, 1, 1,
-1.684919, 0.653238, -0.4644142, 1, 1, 1, 1, 1,
-1.658112, -0.164366, -1.469448, 1, 1, 1, 1, 1,
-1.645436, -0.8079606, -1.992485, 1, 1, 1, 1, 1,
-1.637424, -0.2123451, -0.9285073, 1, 1, 1, 1, 1,
-1.626687, -0.8803414, -3.324376, 1, 1, 1, 1, 1,
-1.613868, -1.788063, -2.540322, 1, 1, 1, 1, 1,
-1.598534, 0.4154352, -1.369934, 1, 1, 1, 1, 1,
-1.593777, 1.712373, -1.574615, 1, 1, 1, 1, 1,
-1.590069, 1.301218, -1.677562, 1, 1, 1, 1, 1,
-1.57909, -1.321815, -1.947327, 1, 1, 1, 1, 1,
-1.57564, -0.1306524, -1.699981, 1, 1, 1, 1, 1,
-1.553817, -1.79509, -2.22033, 1, 1, 1, 1, 1,
-1.539257, 0.3722964, -0.3022965, 0, 0, 1, 1, 1,
-1.534156, -0.1064655, -1.734162, 1, 0, 0, 1, 1,
-1.530691, -0.6524092, -1.32105, 1, 0, 0, 1, 1,
-1.52479, -0.04140332, -1.671382, 1, 0, 0, 1, 1,
-1.520486, -0.5052198, -1.750806, 1, 0, 0, 1, 1,
-1.517217, 1.187548, -1.234327, 1, 0, 0, 1, 1,
-1.515266, -1.627379, -2.409577, 0, 0, 0, 1, 1,
-1.509531, 0.641284, -0.9688171, 0, 0, 0, 1, 1,
-1.505326, -0.7293113, -3.768492, 0, 0, 0, 1, 1,
-1.502346, -0.03066378, -3.170555, 0, 0, 0, 1, 1,
-1.495626, 0.06338101, -2.03823, 0, 0, 0, 1, 1,
-1.485628, 2.887901, -0.4077711, 0, 0, 0, 1, 1,
-1.478088, -0.07698523, -2.455232, 0, 0, 0, 1, 1,
-1.473851, 0.7554617, 1.07265, 1, 1, 1, 1, 1,
-1.464995, -0.2941354, -1.285363, 1, 1, 1, 1, 1,
-1.455081, -0.2147192, -2.417036, 1, 1, 1, 1, 1,
-1.454404, -1.695805, -2.333241, 1, 1, 1, 1, 1,
-1.452678, -1.399145, -2.284407, 1, 1, 1, 1, 1,
-1.435546, -1.433585, -2.883684, 1, 1, 1, 1, 1,
-1.427688, -0.5758779, -2.678901, 1, 1, 1, 1, 1,
-1.421157, -0.02720852, -1.695451, 1, 1, 1, 1, 1,
-1.410165, -1.543706, -1.71698, 1, 1, 1, 1, 1,
-1.405354, 0.9009991, -2.202954, 1, 1, 1, 1, 1,
-1.391916, 1.014021, -2.065392, 1, 1, 1, 1, 1,
-1.369017, -1.275706, -1.608136, 1, 1, 1, 1, 1,
-1.367717, -0.4581148, -2.346883, 1, 1, 1, 1, 1,
-1.366973, -1.752191, -1.784858, 1, 1, 1, 1, 1,
-1.359572, 1.382706, -0.8478495, 1, 1, 1, 1, 1,
-1.355916, -0.4837785, -2.24702, 0, 0, 1, 1, 1,
-1.35589, 0.6682179, -2.39821, 1, 0, 0, 1, 1,
-1.353412, 1.448127, -0.8822891, 1, 0, 0, 1, 1,
-1.352665, -1.393134, -2.254828, 1, 0, 0, 1, 1,
-1.347174, 1.854051, -1.313557, 1, 0, 0, 1, 1,
-1.344895, 0.9086821, -0.7253838, 1, 0, 0, 1, 1,
-1.341606, 0.97631, 0.3043617, 0, 0, 0, 1, 1,
-1.321738, -0.2695426, -2.294625, 0, 0, 0, 1, 1,
-1.314788, -0.0107036, -3.00873, 0, 0, 0, 1, 1,
-1.313952, -2.046735, -2.871148, 0, 0, 0, 1, 1,
-1.303823, 2.553607, 0.4063565, 0, 0, 0, 1, 1,
-1.299898, -0.9817536, -3.057947, 0, 0, 0, 1, 1,
-1.29723, 0.849215, -1.445413, 0, 0, 0, 1, 1,
-1.285124, 0.03948513, -3.239369, 1, 1, 1, 1, 1,
-1.279025, -0.6464268, -2.344543, 1, 1, 1, 1, 1,
-1.274746, -5.34768e-05, -1.89653, 1, 1, 1, 1, 1,
-1.268496, 0.5328919, -0.6047024, 1, 1, 1, 1, 1,
-1.241452, 0.02449597, -1.001786, 1, 1, 1, 1, 1,
-1.237965, 0.1087288, -0.1688646, 1, 1, 1, 1, 1,
-1.234808, -0.0537152, -2.186871, 1, 1, 1, 1, 1,
-1.233079, -0.5574862, -3.314344, 1, 1, 1, 1, 1,
-1.228829, -2.894551, -2.870785, 1, 1, 1, 1, 1,
-1.219257, 0.3648793, -3.237005, 1, 1, 1, 1, 1,
-1.215061, 0.9783325, 0.01655613, 1, 1, 1, 1, 1,
-1.200822, 0.2161138, -0.5493268, 1, 1, 1, 1, 1,
-1.199707, 1.936055, -0.6821788, 1, 1, 1, 1, 1,
-1.198078, 0.9303432, -2.477033, 1, 1, 1, 1, 1,
-1.190669, -1.322721, -2.222705, 1, 1, 1, 1, 1,
-1.188839, 0.01993784, -0.2799799, 0, 0, 1, 1, 1,
-1.18684, 0.2663634, -1.010782, 1, 0, 0, 1, 1,
-1.175922, -0.2512964, -0.3147562, 1, 0, 0, 1, 1,
-1.169234, 1.91874, -2.366027, 1, 0, 0, 1, 1,
-1.163012, 0.7219213, -1.178237, 1, 0, 0, 1, 1,
-1.152624, 2.655284, -0.02338664, 1, 0, 0, 1, 1,
-1.152495, 0.2655119, -0.4596944, 0, 0, 0, 1, 1,
-1.151117, 1.344096, -0.594066, 0, 0, 0, 1, 1,
-1.147951, 0.2243014, -0.6560376, 0, 0, 0, 1, 1,
-1.145106, -0.4081296, -2.65294, 0, 0, 0, 1, 1,
-1.140021, 1.093489, -2.235648, 0, 0, 0, 1, 1,
-1.138663, -1.123181, -0.2762392, 0, 0, 0, 1, 1,
-1.13701, -1.087811, -3.477863, 0, 0, 0, 1, 1,
-1.136971, -0.02128344, -1.300765, 1, 1, 1, 1, 1,
-1.133191, 0.594677, -0.3925203, 1, 1, 1, 1, 1,
-1.12862, 0.3856553, -1.492309, 1, 1, 1, 1, 1,
-1.126189, -1.115707, -2.197973, 1, 1, 1, 1, 1,
-1.12367, -0.6255295, -0.9119094, 1, 1, 1, 1, 1,
-1.121461, 0.9618607, -0.4842433, 1, 1, 1, 1, 1,
-1.09719, 0.8184651, 1.066789, 1, 1, 1, 1, 1,
-1.093808, -0.9758017, -2.395036, 1, 1, 1, 1, 1,
-1.090098, 0.6017951, -1.110085, 1, 1, 1, 1, 1,
-1.084801, -2.104212, -2.883546, 1, 1, 1, 1, 1,
-1.075886, 0.2251068, -0.4419357, 1, 1, 1, 1, 1,
-1.067836, -0.9929964, -2.776324, 1, 1, 1, 1, 1,
-1.059082, 1.46148, 0.676532, 1, 1, 1, 1, 1,
-1.058293, 0.2577567, -1.689384, 1, 1, 1, 1, 1,
-1.054243, 1.456739, -2.594343, 1, 1, 1, 1, 1,
-1.037766, 0.8967694, 0.5627471, 0, 0, 1, 1, 1,
-1.036665, 1.226239, 0.3195622, 1, 0, 0, 1, 1,
-1.036621, 0.6288449, -0.06685285, 1, 0, 0, 1, 1,
-1.029532, -0.2949645, -1.999606, 1, 0, 0, 1, 1,
-1.028466, 1.138879, -1.046392, 1, 0, 0, 1, 1,
-1.017879, 1.414238, -0.7559879, 1, 0, 0, 1, 1,
-1.008325, 1.634373, 0.6800045, 0, 0, 0, 1, 1,
-1.00783, 1.466107, -0.1560772, 0, 0, 0, 1, 1,
-1.007686, 0.6273222, -1.259063, 0, 0, 0, 1, 1,
-1.005437, 1.054625, -1.14985, 0, 0, 0, 1, 1,
-0.9988099, -0.3471957, -3.658188, 0, 0, 0, 1, 1,
-0.9944634, -1.206858, -2.888081, 0, 0, 0, 1, 1,
-0.9893283, 0.3810512, -1.033314, 0, 0, 0, 1, 1,
-0.9857898, 0.8186429, -1.400305, 1, 1, 1, 1, 1,
-0.9854856, -0.3470415, -1.788887, 1, 1, 1, 1, 1,
-0.9744735, -0.452003, -2.113728, 1, 1, 1, 1, 1,
-0.969216, -0.1232035, -2.969442, 1, 1, 1, 1, 1,
-0.9681552, 2.026197, -1.526495, 1, 1, 1, 1, 1,
-0.9658951, -0.4800113, -1.780697, 1, 1, 1, 1, 1,
-0.9651185, 1.089802, -1.972435, 1, 1, 1, 1, 1,
-0.9583144, 0.3480112, -1.636366, 1, 1, 1, 1, 1,
-0.9506606, -0.4448327, -1.828715, 1, 1, 1, 1, 1,
-0.9493104, 0.2868465, 1.237401, 1, 1, 1, 1, 1,
-0.9491277, -1.23834, -1.162286, 1, 1, 1, 1, 1,
-0.9474045, 1.045792, -2.165699, 1, 1, 1, 1, 1,
-0.9473431, 0.4092392, -0.6253121, 1, 1, 1, 1, 1,
-0.9471384, -0.7884637, -4.593575, 1, 1, 1, 1, 1,
-0.9463721, 1.951351, 0.7252835, 1, 1, 1, 1, 1,
-0.9386924, -1.087776, -0.4233049, 0, 0, 1, 1, 1,
-0.9321922, 1.354243, -0.2534663, 1, 0, 0, 1, 1,
-0.9302796, -0.2969209, -0.4836317, 1, 0, 0, 1, 1,
-0.9242471, 0.6729645, -0.4170574, 1, 0, 0, 1, 1,
-0.9197238, -1.153183, -1.814934, 1, 0, 0, 1, 1,
-0.9189706, 1.023389, -0.9093944, 1, 0, 0, 1, 1,
-0.9170083, 0.1144612, -1.400294, 0, 0, 0, 1, 1,
-0.9166875, 2.256787, 1.555869, 0, 0, 0, 1, 1,
-0.9142752, -1.083087, -2.686676, 0, 0, 0, 1, 1,
-0.9125135, -0.1130747, 0.4512787, 0, 0, 0, 1, 1,
-0.9123147, -0.522052, -0.8486791, 0, 0, 0, 1, 1,
-0.9024577, 1.69401, 1.905039, 0, 0, 0, 1, 1,
-0.898095, 0.372267, -1.520467, 0, 0, 0, 1, 1,
-0.8978467, 0.2568825, -0.008958793, 1, 1, 1, 1, 1,
-0.8959262, 0.6367546, 0.6528189, 1, 1, 1, 1, 1,
-0.8857719, -0.7299648, -0.9345666, 1, 1, 1, 1, 1,
-0.8834386, 0.9752666, 0.7284981, 1, 1, 1, 1, 1,
-0.8727627, 1.571257, 0.8484135, 1, 1, 1, 1, 1,
-0.8648534, 0.2770509, -1.41966, 1, 1, 1, 1, 1,
-0.8576823, -0.4784579, -1.288234, 1, 1, 1, 1, 1,
-0.856874, -0.494553, -3.869888, 1, 1, 1, 1, 1,
-0.8564011, -0.3726121, -3.769967, 1, 1, 1, 1, 1,
-0.8557083, -1.99747, -1.982397, 1, 1, 1, 1, 1,
-0.848115, 0.2022783, -1.222682, 1, 1, 1, 1, 1,
-0.8453322, 0.05020242, -1.565408, 1, 1, 1, 1, 1,
-0.8372493, 1.036184, -0.6122609, 1, 1, 1, 1, 1,
-0.8363201, -0.3311649, -2.559284, 1, 1, 1, 1, 1,
-0.8363132, -1.100094, -1.57447, 1, 1, 1, 1, 1,
-0.8328274, -1.486482, -3.931126, 0, 0, 1, 1, 1,
-0.8325066, 1.132244, -1.350024, 1, 0, 0, 1, 1,
-0.8307086, 1.282517, 2.0237, 1, 0, 0, 1, 1,
-0.8285344, 1.034403, -0.1047216, 1, 0, 0, 1, 1,
-0.8275818, -0.6163738, -1.55422, 1, 0, 0, 1, 1,
-0.8245922, 0.5309232, -2.090824, 1, 0, 0, 1, 1,
-0.8236266, 0.3865094, -1.759092, 0, 0, 0, 1, 1,
-0.810145, 1.565736, -0.2741257, 0, 0, 0, 1, 1,
-0.8084495, -0.6877555, -2.14633, 0, 0, 0, 1, 1,
-0.8057966, -1.38939, -3.658147, 0, 0, 0, 1, 1,
-0.8040306, -0.2492759, -1.615624, 0, 0, 0, 1, 1,
-0.7998796, 0.4071318, -1.565177, 0, 0, 0, 1, 1,
-0.7981011, -0.07100116, -1.382744, 0, 0, 0, 1, 1,
-0.7952441, 0.6737078, -1.54353, 1, 1, 1, 1, 1,
-0.78609, 1.108872, -0.690685, 1, 1, 1, 1, 1,
-0.7810899, -1.010616, -1.555231, 1, 1, 1, 1, 1,
-0.7806494, 0.01335727, -1.663438, 1, 1, 1, 1, 1,
-0.7765201, 1.583109, -0.1920466, 1, 1, 1, 1, 1,
-0.7752062, -0.01204252, -2.862262, 1, 1, 1, 1, 1,
-0.7740589, -0.8517786, -2.687988, 1, 1, 1, 1, 1,
-0.7735308, -0.7476452, -2.430251, 1, 1, 1, 1, 1,
-0.7686388, 2.397232, -1.128432, 1, 1, 1, 1, 1,
-0.7682768, -0.2527974, -1.834672, 1, 1, 1, 1, 1,
-0.7670627, 1.303982, -1.186179, 1, 1, 1, 1, 1,
-0.7633032, 0.2976671, -2.909999, 1, 1, 1, 1, 1,
-0.7579195, 1.588734, -0.3481412, 1, 1, 1, 1, 1,
-0.7555218, -1.148822, -2.923442, 1, 1, 1, 1, 1,
-0.7555053, -0.06158434, -2.952533, 1, 1, 1, 1, 1,
-0.7513046, 1.053165, 0.7424861, 0, 0, 1, 1, 1,
-0.7458386, -2.139589, -3.282107, 1, 0, 0, 1, 1,
-0.7448998, 0.1652891, -2.076947, 1, 0, 0, 1, 1,
-0.7435603, 0.04716687, -3.018255, 1, 0, 0, 1, 1,
-0.7419789, 0.09452506, 0.3565557, 1, 0, 0, 1, 1,
-0.740149, 0.8806992, -0.7559379, 1, 0, 0, 1, 1,
-0.737367, 0.8200647, 0.7005919, 0, 0, 0, 1, 1,
-0.7371917, -0.4352509, -2.493962, 0, 0, 0, 1, 1,
-0.7287322, -0.3005162, -2.375487, 0, 0, 0, 1, 1,
-0.7286825, 0.9637002, 1.125685, 0, 0, 0, 1, 1,
-0.7266068, -0.5533844, -2.35632, 0, 0, 0, 1, 1,
-0.7174211, -0.2775163, -1.080563, 0, 0, 0, 1, 1,
-0.7166972, 0.3086747, -3.29304, 0, 0, 0, 1, 1,
-0.7049181, -0.713109, -2.671223, 1, 1, 1, 1, 1,
-0.7035596, 0.189335, -1.44237, 1, 1, 1, 1, 1,
-0.6988681, 0.4974569, -1.921781, 1, 1, 1, 1, 1,
-0.698089, -0.6528938, -1.900385, 1, 1, 1, 1, 1,
-0.695268, -0.08031168, 0.4089412, 1, 1, 1, 1, 1,
-0.6915172, 0.068583, -1.550087, 1, 1, 1, 1, 1,
-0.6862505, -0.01420513, -0.6428068, 1, 1, 1, 1, 1,
-0.6850083, -0.5915328, -1.456596, 1, 1, 1, 1, 1,
-0.6842035, 1.000606, -0.01445307, 1, 1, 1, 1, 1,
-0.6782692, 0.4436328, -0.4321565, 1, 1, 1, 1, 1,
-0.6677558, -0.4044076, -0.6667857, 1, 1, 1, 1, 1,
-0.6661619, -0.8776492, -1.807926, 1, 1, 1, 1, 1,
-0.6629772, -2.250298, -3.572395, 1, 1, 1, 1, 1,
-0.6621954, 0.1698531, -2.362358, 1, 1, 1, 1, 1,
-0.6611857, -0.1716849, -0.2627498, 1, 1, 1, 1, 1,
-0.6595924, -1.065739, -3.454391, 0, 0, 1, 1, 1,
-0.6440195, 0.6964337, 0.5118946, 1, 0, 0, 1, 1,
-0.6435662, -0.2213212, -2.157736, 1, 0, 0, 1, 1,
-0.6410293, 2.005746, 0.4208246, 1, 0, 0, 1, 1,
-0.6333644, -0.5167971, -3.627423, 1, 0, 0, 1, 1,
-0.6330556, -0.1843912, -2.248499, 1, 0, 0, 1, 1,
-0.6327624, -1.192461, -3.14745, 0, 0, 0, 1, 1,
-0.6304753, -0.2282694, -2.043802, 0, 0, 0, 1, 1,
-0.6261598, -2.126564, -3.744869, 0, 0, 0, 1, 1,
-0.6235405, -0.8007094, -3.672838, 0, 0, 0, 1, 1,
-0.6224306, -1.038783, -3.457501, 0, 0, 0, 1, 1,
-0.6187406, 1.209192, -0.4085979, 0, 0, 0, 1, 1,
-0.6093179, -0.1440096, -1.297165, 0, 0, 0, 1, 1,
-0.6084594, 0.4739357, -1.018664, 1, 1, 1, 1, 1,
-0.6064831, -0.061753, -2.502882, 1, 1, 1, 1, 1,
-0.5999198, -1.212867, -2.554423, 1, 1, 1, 1, 1,
-0.5996428, -0.940142, -1.262912, 1, 1, 1, 1, 1,
-0.5993174, 0.03066539, -1.107551, 1, 1, 1, 1, 1,
-0.5965008, 0.873574, -1.08331, 1, 1, 1, 1, 1,
-0.594933, -0.9563646, -2.802196, 1, 1, 1, 1, 1,
-0.5880857, -1.800451, -2.601244, 1, 1, 1, 1, 1,
-0.5864543, 0.3105001, 0.07048096, 1, 1, 1, 1, 1,
-0.5821415, 0.4883773, -0.8106267, 1, 1, 1, 1, 1,
-0.5811942, -0.1675182, -4.253424, 1, 1, 1, 1, 1,
-0.5805749, 1.541899, -0.04210249, 1, 1, 1, 1, 1,
-0.5743327, -0.3520159, -2.677741, 1, 1, 1, 1, 1,
-0.5636796, -1.774222, -3.01442, 1, 1, 1, 1, 1,
-0.5624012, -1.346436, -2.665691, 1, 1, 1, 1, 1,
-0.5620457, -0.3954968, -0.3893533, 0, 0, 1, 1, 1,
-0.556385, 1.164629, -0.1441764, 1, 0, 0, 1, 1,
-0.5516554, -0.8950771, -2.405896, 1, 0, 0, 1, 1,
-0.5508074, -0.340278, -3.088962, 1, 0, 0, 1, 1,
-0.5484015, -0.7869714, -1.240688, 1, 0, 0, 1, 1,
-0.5442772, 0.8257067, -0.2053949, 1, 0, 0, 1, 1,
-0.5426584, -0.1156981, -0.9504192, 0, 0, 0, 1, 1,
-0.5417219, 0.7260963, -2.445094, 0, 0, 0, 1, 1,
-0.5409758, 1.289513, -0.8625649, 0, 0, 0, 1, 1,
-0.5368906, -0.7199354, -1.044311, 0, 0, 0, 1, 1,
-0.5327864, 0.2972523, -2.285668, 0, 0, 0, 1, 1,
-0.5269979, 1.126649, 0.3812658, 0, 0, 0, 1, 1,
-0.5258301, 0.9493575, -1.240639, 0, 0, 0, 1, 1,
-0.5210398, -0.03576815, -1.542889, 1, 1, 1, 1, 1,
-0.5185803, 1.202506, -0.8734544, 1, 1, 1, 1, 1,
-0.5161115, 1.049853, -1.330263, 1, 1, 1, 1, 1,
-0.5113292, -0.48924, -1.296149, 1, 1, 1, 1, 1,
-0.5094131, 0.9925606, -2.444126, 1, 1, 1, 1, 1,
-0.5069925, 1.021669, -1.807776, 1, 1, 1, 1, 1,
-0.5055637, -2.058467, -2.140178, 1, 1, 1, 1, 1,
-0.5049537, -0.7988645, -0.8592137, 1, 1, 1, 1, 1,
-0.4994273, 0.145697, -1.125705, 1, 1, 1, 1, 1,
-0.4965272, 0.484155, -0.1412758, 1, 1, 1, 1, 1,
-0.4962138, -1.565654, -1.869728, 1, 1, 1, 1, 1,
-0.489491, -1.25982, -1.979098, 1, 1, 1, 1, 1,
-0.4888946, -0.2207792, -1.678718, 1, 1, 1, 1, 1,
-0.4841594, -2.248659, -1.870187, 1, 1, 1, 1, 1,
-0.4825965, -0.9170163, -1.855125, 1, 1, 1, 1, 1,
-0.482107, 0.2200235, -0.04770151, 0, 0, 1, 1, 1,
-0.4800614, 0.6234056, -0.2133802, 1, 0, 0, 1, 1,
-0.4797566, -0.09954385, -1.672521, 1, 0, 0, 1, 1,
-0.4787787, 0.3929319, -2.632643, 1, 0, 0, 1, 1,
-0.4754174, -0.2909001, -0.2281276, 1, 0, 0, 1, 1,
-0.4752057, 0.519197, 0.0003213543, 1, 0, 0, 1, 1,
-0.46982, -2.198798, -3.316005, 0, 0, 0, 1, 1,
-0.4686127, 2.170804, 0.1420765, 0, 0, 0, 1, 1,
-0.4663827, -0.5634386, -0.7345084, 0, 0, 0, 1, 1,
-0.4662375, 0.5164071, -1.509358, 0, 0, 0, 1, 1,
-0.4637731, 0.7075599, 1.706493, 0, 0, 0, 1, 1,
-0.4611636, -1.067799, -1.456781, 0, 0, 0, 1, 1,
-0.4579154, 1.123759, 0.7321981, 0, 0, 0, 1, 1,
-0.4559472, -0.5783852, -1.923341, 1, 1, 1, 1, 1,
-0.4521728, 0.007448257, -2.665679, 1, 1, 1, 1, 1,
-0.4519978, 1.412832, 0.2982658, 1, 1, 1, 1, 1,
-0.4512198, 0.2568435, 0.8065241, 1, 1, 1, 1, 1,
-0.4498699, 1.687572, -0.2472638, 1, 1, 1, 1, 1,
-0.4470977, 1.703523, -0.2438753, 1, 1, 1, 1, 1,
-0.4465799, -0.08702166, -2.137579, 1, 1, 1, 1, 1,
-0.4461224, -0.09002435, -1.063104, 1, 1, 1, 1, 1,
-0.4444507, 0.3753318, 0.6541665, 1, 1, 1, 1, 1,
-0.4431756, -0.3744256, -3.143482, 1, 1, 1, 1, 1,
-0.4419242, -0.09393802, -2.062702, 1, 1, 1, 1, 1,
-0.4413991, -0.7473201, -2.82109, 1, 1, 1, 1, 1,
-0.4374356, -0.442375, -1.771416, 1, 1, 1, 1, 1,
-0.4345544, -0.04619896, -1.820102, 1, 1, 1, 1, 1,
-0.4297263, 0.5842549, -0.5602894, 1, 1, 1, 1, 1,
-0.4277677, 0.722922, -2.449883, 0, 0, 1, 1, 1,
-0.4263348, -1.271221, -1.32243, 1, 0, 0, 1, 1,
-0.4227502, 1.308304, -0.8481246, 1, 0, 0, 1, 1,
-0.4185246, 1.193312, 0.7160625, 1, 0, 0, 1, 1,
-0.4151568, 1.079259, 0.8652315, 1, 0, 0, 1, 1,
-0.4151241, -0.4933436, -1.952136, 1, 0, 0, 1, 1,
-0.4095218, 2.243259, 0.3681075, 0, 0, 0, 1, 1,
-0.4090135, 0.2862886, -0.7102883, 0, 0, 0, 1, 1,
-0.4057261, -0.3210062, -1.418968, 0, 0, 0, 1, 1,
-0.4044581, -0.5037161, -4.04258, 0, 0, 0, 1, 1,
-0.4041135, -0.5222751, -1.646158, 0, 0, 0, 1, 1,
-0.4027705, -0.4987639, -1.141801, 0, 0, 0, 1, 1,
-0.4022183, -0.2524783, -4.131977, 0, 0, 0, 1, 1,
-0.4015541, 0.7663488, -0.8457575, 1, 1, 1, 1, 1,
-0.399457, 1.431218, -0.8590062, 1, 1, 1, 1, 1,
-0.3963435, 1.078459, -1.373432, 1, 1, 1, 1, 1,
-0.3937369, -0.5917541, -2.704917, 1, 1, 1, 1, 1,
-0.3910376, -0.3742508, -3.624173, 1, 1, 1, 1, 1,
-0.3887541, 0.2542223, -0.6253892, 1, 1, 1, 1, 1,
-0.3887498, -1.323887, -4.566398, 1, 1, 1, 1, 1,
-0.3864284, 0.6922645, -0.8295811, 1, 1, 1, 1, 1,
-0.3839393, 0.9809142, -0.7487506, 1, 1, 1, 1, 1,
-0.3758688, -0.1332677, -2.782666, 1, 1, 1, 1, 1,
-0.3663933, -0.3328953, -3.469141, 1, 1, 1, 1, 1,
-0.3541417, -0.03308554, -1.075912, 1, 1, 1, 1, 1,
-0.3533854, -0.2576251, -1.953335, 1, 1, 1, 1, 1,
-0.3463542, -0.5187243, -4.131578, 1, 1, 1, 1, 1,
-0.3375397, 0.2718409, -0.2590582, 1, 1, 1, 1, 1,
-0.3359039, 1.431205, 0.06840355, 0, 0, 1, 1, 1,
-0.3288445, 0.1419057, -0.02133877, 1, 0, 0, 1, 1,
-0.3263471, -0.5775715, -2.32777, 1, 0, 0, 1, 1,
-0.3263315, -0.05816781, -0.8758404, 1, 0, 0, 1, 1,
-0.3250177, 0.6175666, -2.406417, 1, 0, 0, 1, 1,
-0.3246517, 0.4041428, -1.408478, 1, 0, 0, 1, 1,
-0.3185447, 1.366244, 0.5060424, 0, 0, 0, 1, 1,
-0.316738, 0.3895446, -1.005271, 0, 0, 0, 1, 1,
-0.3151634, -1.596669, -4.807174, 0, 0, 0, 1, 1,
-0.3112611, 0.890669, -1.170261, 0, 0, 0, 1, 1,
-0.3100209, 0.6823628, -1.061166, 0, 0, 0, 1, 1,
-0.307662, 1.852088, 0.0445517, 0, 0, 0, 1, 1,
-0.3026403, 1.204933, 1.310698, 0, 0, 0, 1, 1,
-0.2998913, 0.8490891, 0.1740184, 1, 1, 1, 1, 1,
-0.2986629, -0.6208501, -1.627634, 1, 1, 1, 1, 1,
-0.2986607, 0.4974577, -1.016031, 1, 1, 1, 1, 1,
-0.2937132, 1.139873, 0.05052698, 1, 1, 1, 1, 1,
-0.2907176, -0.2450671, -1.686809, 1, 1, 1, 1, 1,
-0.2861267, 1.272464, 0.1796321, 1, 1, 1, 1, 1,
-0.2846273, 1.10396, -1.069781, 1, 1, 1, 1, 1,
-0.2827626, -0.725412, -2.874541, 1, 1, 1, 1, 1,
-0.2800941, 0.6954331, -0.982472, 1, 1, 1, 1, 1,
-0.2776408, -0.5923507, -3.721962, 1, 1, 1, 1, 1,
-0.276695, 1.238055, -0.5614668, 1, 1, 1, 1, 1,
-0.2753972, -0.4480039, -2.198066, 1, 1, 1, 1, 1,
-0.2673008, -0.7757383, -1.587151, 1, 1, 1, 1, 1,
-0.2650098, 0.8417784, 0.8850859, 1, 1, 1, 1, 1,
-0.264468, 1.617402, 1.136021, 1, 1, 1, 1, 1,
-0.2636099, -0.5123422, -3.425406, 0, 0, 1, 1, 1,
-0.261642, -0.584383, -3.930473, 1, 0, 0, 1, 1,
-0.2453233, -1.336257, -3.935769, 1, 0, 0, 1, 1,
-0.2440641, 0.613599, 0.6116669, 1, 0, 0, 1, 1,
-0.2435281, 0.8633561, 1.833643, 1, 0, 0, 1, 1,
-0.243329, 0.1704513, -1.010805, 1, 0, 0, 1, 1,
-0.2398266, 0.632189, -0.7718549, 0, 0, 0, 1, 1,
-0.2372168, -0.2900191, -3.745492, 0, 0, 0, 1, 1,
-0.2304959, 0.7958465, -1.250717, 0, 0, 0, 1, 1,
-0.230167, 0.2787548, 0.7184342, 0, 0, 0, 1, 1,
-0.2279599, -0.7553641, -2.280929, 0, 0, 0, 1, 1,
-0.2259825, 0.8535186, -1.824273, 0, 0, 0, 1, 1,
-0.2256742, 3.572479, 0.9877142, 0, 0, 0, 1, 1,
-0.2187897, -0.4966975, -5.2175, 1, 1, 1, 1, 1,
-0.2184033, 2.150409, 1.239828, 1, 1, 1, 1, 1,
-0.2148988, 1.30716, 2.570896, 1, 1, 1, 1, 1,
-0.214521, 1.235531, 0.3546247, 1, 1, 1, 1, 1,
-0.2126022, 0.5525385, -0.08701645, 1, 1, 1, 1, 1,
-0.2099528, 2.473879, -1.106486, 1, 1, 1, 1, 1,
-0.2063435, -0.0312112, -1.39096, 1, 1, 1, 1, 1,
-0.2054593, 0.7951741, -1.001948, 1, 1, 1, 1, 1,
-0.2041565, -1.17632, -2.763557, 1, 1, 1, 1, 1,
-0.2010834, -0.5985517, -2.066728, 1, 1, 1, 1, 1,
-0.1995329, -0.07116741, -2.765377, 1, 1, 1, 1, 1,
-0.1887935, -0.6401466, -3.950224, 1, 1, 1, 1, 1,
-0.1880773, -0.9756243, -0.6867891, 1, 1, 1, 1, 1,
-0.1862543, -0.02533169, -0.9196178, 1, 1, 1, 1, 1,
-0.1858349, 0.07659381, -3.119849, 1, 1, 1, 1, 1,
-0.1799776, -0.3172503, -1.600204, 0, 0, 1, 1, 1,
-0.1782759, -1.773302, -4.071229, 1, 0, 0, 1, 1,
-0.1749002, 0.3979405, 1.031693, 1, 0, 0, 1, 1,
-0.173941, -0.3356295, -2.760459, 1, 0, 0, 1, 1,
-0.1689889, 0.8766453, -1.068149, 1, 0, 0, 1, 1,
-0.1669381, -0.0441167, -1.881654, 1, 0, 0, 1, 1,
-0.1660542, -0.2465644, -3.264223, 0, 0, 0, 1, 1,
-0.1608263, -0.008172926, -1.498356, 0, 0, 0, 1, 1,
-0.1562108, -0.3010381, -3.442306, 0, 0, 0, 1, 1,
-0.1541197, 1.245128, 0.2541231, 0, 0, 0, 1, 1,
-0.1511991, 0.8383616, -0.7249328, 0, 0, 0, 1, 1,
-0.150391, -1.10069, -2.876402, 0, 0, 0, 1, 1,
-0.1503748, 0.4066414, -1.565028, 0, 0, 0, 1, 1,
-0.1482689, -1.117481, -2.900035, 1, 1, 1, 1, 1,
-0.1469091, -0.4012496, -2.796143, 1, 1, 1, 1, 1,
-0.1464809, 0.3621678, -0.6419314, 1, 1, 1, 1, 1,
-0.1419485, -1.406846, -2.829225, 1, 1, 1, 1, 1,
-0.1407566, 0.3843394, -0.7727904, 1, 1, 1, 1, 1,
-0.1396726, 0.5530875, -1.243447, 1, 1, 1, 1, 1,
-0.1378198, -0.1719962, -1.397378, 1, 1, 1, 1, 1,
-0.1370997, 1.193957, 0.9126251, 1, 1, 1, 1, 1,
-0.1348225, 1.681815, -0.1395014, 1, 1, 1, 1, 1,
-0.1343391, -1.173278, -1.859938, 1, 1, 1, 1, 1,
-0.132847, 0.788534, -0.4740753, 1, 1, 1, 1, 1,
-0.1277767, 1.292843, -1.130152, 1, 1, 1, 1, 1,
-0.1194085, -0.2958903, -3.321449, 1, 1, 1, 1, 1,
-0.1156328, 0.3989348, 0.4856692, 1, 1, 1, 1, 1,
-0.115071, -0.5324298, -4.137561, 1, 1, 1, 1, 1,
-0.1135694, -1.540465, -2.35668, 0, 0, 1, 1, 1,
-0.1129831, -3.091982, -2.869257, 1, 0, 0, 1, 1,
-0.1112202, -0.03180401, -2.542057, 1, 0, 0, 1, 1,
-0.1111004, -0.0671426, -1.186545, 1, 0, 0, 1, 1,
-0.1105224, -1.401531, -3.571251, 1, 0, 0, 1, 1,
-0.1099409, -0.7580125, -1.973874, 1, 0, 0, 1, 1,
-0.1076141, -0.4627929, -1.814504, 0, 0, 0, 1, 1,
-0.1017402, 1.736225, -0.4010728, 0, 0, 0, 1, 1,
-0.1013778, -0.3984141, -4.405797, 0, 0, 0, 1, 1,
-0.09647848, -0.1750822, -4.403572, 0, 0, 0, 1, 1,
-0.09471115, -1.190908, -2.141708, 0, 0, 0, 1, 1,
-0.09290718, 0.2800605, -0.4092724, 0, 0, 0, 1, 1,
-0.09013473, 1.02277, 0.05645245, 0, 0, 0, 1, 1,
-0.09009454, -0.2002137, -2.733846, 1, 1, 1, 1, 1,
-0.08820118, 0.6162805, 0.05155459, 1, 1, 1, 1, 1,
-0.08799657, -0.03139519, -0.7402372, 1, 1, 1, 1, 1,
-0.08661578, 0.1593739, -0.07555571, 1, 1, 1, 1, 1,
-0.08389822, -0.9148585, -0.7192445, 1, 1, 1, 1, 1,
-0.0822656, -0.1215798, -4.380459, 1, 1, 1, 1, 1,
-0.08222958, -0.7116924, -3.551739, 1, 1, 1, 1, 1,
-0.0789369, -1.364184, -3.433538, 1, 1, 1, 1, 1,
-0.07619131, 0.1608295, -0.9129643, 1, 1, 1, 1, 1,
-0.07586606, 1.053441, 0.3110535, 1, 1, 1, 1, 1,
-0.0738015, -1.162752, -1.753505, 1, 1, 1, 1, 1,
-0.07124208, 0.6078218, 0.140801, 1, 1, 1, 1, 1,
-0.06808398, 0.6026513, -0.1019858, 1, 1, 1, 1, 1,
-0.06470579, -0.2902167, -3.408194, 1, 1, 1, 1, 1,
-0.06458069, 0.2219088, 1.15446, 1, 1, 1, 1, 1,
-0.06444512, 0.3152577, 0.01066468, 0, 0, 1, 1, 1,
-0.06427944, 0.6891314, -1.124971, 1, 0, 0, 1, 1,
-0.06075185, -0.4820732, -5.023379, 1, 0, 0, 1, 1,
-0.05715561, -0.3316408, -3.074151, 1, 0, 0, 1, 1,
-0.05702512, 0.7550815, 0.2566008, 1, 0, 0, 1, 1,
-0.05628421, 3.187733, -0.8623128, 1, 0, 0, 1, 1,
-0.05561054, -0.8261788, -2.026252, 0, 0, 0, 1, 1,
-0.05322431, -0.2192243, -3.916925, 0, 0, 0, 1, 1,
-0.0519428, 0.4193555, 0.4770343, 0, 0, 0, 1, 1,
-0.04680018, -0.4309097, -3.61641, 0, 0, 0, 1, 1,
-0.04602822, 0.3686228, -0.6091407, 0, 0, 0, 1, 1,
-0.04499045, 0.7462118, 0.02717448, 0, 0, 0, 1, 1,
-0.04432497, 0.7748163, 0.6505012, 0, 0, 0, 1, 1,
-0.04149231, -0.2324253, -2.696267, 1, 1, 1, 1, 1,
-0.0375597, -0.07361612, -1.80819, 1, 1, 1, 1, 1,
-0.03708163, -0.2941891, -3.719524, 1, 1, 1, 1, 1,
-0.03583915, 1.210462, -0.181129, 1, 1, 1, 1, 1,
-0.03420177, -0.4385888, -3.977966, 1, 1, 1, 1, 1,
-0.03176969, -0.4609288, -1.920565, 1, 1, 1, 1, 1,
-0.02840994, -1.168203, -2.848778, 1, 1, 1, 1, 1,
-0.02752835, 0.3172089, 0.2013663, 1, 1, 1, 1, 1,
-0.02687827, -0.7943356, -1.739144, 1, 1, 1, 1, 1,
-0.0259663, -1.265115, -2.495293, 1, 1, 1, 1, 1,
-0.02503085, 0.2458466, 0.3293336, 1, 1, 1, 1, 1,
-0.02278623, -0.5088786, -2.244557, 1, 1, 1, 1, 1,
-0.02252395, -1.807564, -1.486566, 1, 1, 1, 1, 1,
-0.02110972, 0.7387525, -1.237099, 1, 1, 1, 1, 1,
-0.01824114, 0.259217, 0.8491927, 1, 1, 1, 1, 1,
-0.009714559, -2.056458, -4.250138, 0, 0, 1, 1, 1,
-0.00861511, -0.2353344, -1.4611, 1, 0, 0, 1, 1,
-0.007886597, -0.9837214, -3.329314, 1, 0, 0, 1, 1,
-0.005865508, 0.01063439, -0.8538885, 1, 0, 0, 1, 1,
-0.005280524, 1.016305, -0.6844606, 1, 0, 0, 1, 1,
-0.001046884, -1.095922, -4.189224, 1, 0, 0, 1, 1,
-0.0004525507, -0.8402946, -3.186244, 0, 0, 0, 1, 1,
0.001555167, 0.2619337, 0.06809261, 0, 0, 0, 1, 1,
0.001565951, -0.1967732, 2.259065, 0, 0, 0, 1, 1,
0.008073919, 1.298439, -0.4800615, 0, 0, 0, 1, 1,
0.008260451, 1.093354, -0.3890627, 0, 0, 0, 1, 1,
0.01071565, -0.01059849, 3.574168, 0, 0, 0, 1, 1,
0.01081964, 0.825968, 0.9960068, 0, 0, 0, 1, 1,
0.0119035, -0.9648678, 3.503411, 1, 1, 1, 1, 1,
0.013875, 0.7805153, -0.3261317, 1, 1, 1, 1, 1,
0.0172776, 0.5581347, -0.1860268, 1, 1, 1, 1, 1,
0.01931788, -0.476522, 2.75459, 1, 1, 1, 1, 1,
0.01982002, -0.2560456, 3.172298, 1, 1, 1, 1, 1,
0.02670426, -1.219359, 1.749552, 1, 1, 1, 1, 1,
0.02914798, 0.9936156, -0.9249861, 1, 1, 1, 1, 1,
0.02918549, -0.3583307, 3.726562, 1, 1, 1, 1, 1,
0.03090592, 0.3559622, 2.115287, 1, 1, 1, 1, 1,
0.0362775, -0.8515597, 3.102627, 1, 1, 1, 1, 1,
0.04332362, -0.3296161, 3.545793, 1, 1, 1, 1, 1,
0.04749941, 0.4135547, 1.210725, 1, 1, 1, 1, 1,
0.0610395, 0.5652705, -0.6817809, 1, 1, 1, 1, 1,
0.06129423, -0.1064194, 2.723437, 1, 1, 1, 1, 1,
0.06195888, 0.03050193, -0.3472113, 1, 1, 1, 1, 1,
0.06666703, -0.2920976, 2.801342, 0, 0, 1, 1, 1,
0.07996228, 0.7620042, 1.864378, 1, 0, 0, 1, 1,
0.08272569, -0.7398988, 0.1559375, 1, 0, 0, 1, 1,
0.08344761, -0.9190444, 1.695373, 1, 0, 0, 1, 1,
0.09052183, -0.2802746, 4.968559, 1, 0, 0, 1, 1,
0.09314702, 0.2192179, 0.7545426, 1, 0, 0, 1, 1,
0.09513989, -0.4802742, 1.910012, 0, 0, 0, 1, 1,
0.09803603, 0.7980428, -0.6484043, 0, 0, 0, 1, 1,
0.09988899, 2.188259, -1.283763, 0, 0, 0, 1, 1,
0.1036085, 2.426956, -0.4776522, 0, 0, 0, 1, 1,
0.1069431, 0.6783168, 1.02764, 0, 0, 0, 1, 1,
0.1076705, 1.653689, -1.692178, 0, 0, 0, 1, 1,
0.1097164, 0.3700595, -1.374697, 0, 0, 0, 1, 1,
0.10987, 0.3224385, -0.9275213, 1, 1, 1, 1, 1,
0.1228805, -0.06172839, 1.995027, 1, 1, 1, 1, 1,
0.1312393, -0.1359861, 2.135544, 1, 1, 1, 1, 1,
0.13275, -0.6404282, 2.834888, 1, 1, 1, 1, 1,
0.1377026, 0.8539572, -3.089402, 1, 1, 1, 1, 1,
0.1393333, -0.3009782, 2.973512, 1, 1, 1, 1, 1,
0.1410397, -0.4322866, 4.403691, 1, 1, 1, 1, 1,
0.1482834, 2.325183, 1.205385, 1, 1, 1, 1, 1,
0.1517862, 0.4876757, 0.3994137, 1, 1, 1, 1, 1,
0.1545443, -0.1527836, 2.084742, 1, 1, 1, 1, 1,
0.1574574, 0.08099696, 1.599655, 1, 1, 1, 1, 1,
0.1620662, 0.3301523, 0.4033548, 1, 1, 1, 1, 1,
0.1642457, -1.350654, 2.299071, 1, 1, 1, 1, 1,
0.1651343, -0.1009753, 3.292333, 1, 1, 1, 1, 1,
0.1675272, -1.284889, 2.484023, 1, 1, 1, 1, 1,
0.1705955, -0.444904, 4.06607, 0, 0, 1, 1, 1,
0.1713502, 0.1663339, 0.1685052, 1, 0, 0, 1, 1,
0.1774594, -1.696627, 1.899517, 1, 0, 0, 1, 1,
0.1781317, 1.009525, -0.1546808, 1, 0, 0, 1, 1,
0.1782336, 0.02152955, 2.673199, 1, 0, 0, 1, 1,
0.1838148, 0.9971016, 0.8980982, 1, 0, 0, 1, 1,
0.1895517, 0.5231055, 0.7590178, 0, 0, 0, 1, 1,
0.1910734, -1.875985, 4.038467, 0, 0, 0, 1, 1,
0.1952222, -1.005849, 4.944188, 0, 0, 0, 1, 1,
0.1970156, -1.576192, 2.794834, 0, 0, 0, 1, 1,
0.1984715, 0.3021777, -1.243938, 0, 0, 0, 1, 1,
0.2128276, 0.9653927, -2.014758, 0, 0, 0, 1, 1,
0.2140818, 1.880527, 1.038192, 0, 0, 0, 1, 1,
0.2140882, 0.5207195, -0.3270346, 1, 1, 1, 1, 1,
0.2162704, 0.244355, 0.7391915, 1, 1, 1, 1, 1,
0.2185905, -0.6393543, 5.05486, 1, 1, 1, 1, 1,
0.2189907, 0.3378247, 1.329501, 1, 1, 1, 1, 1,
0.2206762, -0.1331575, 4.477911, 1, 1, 1, 1, 1,
0.2207718, -0.4999732, 4.316526, 1, 1, 1, 1, 1,
0.2227463, 1.512537, -0.9546707, 1, 1, 1, 1, 1,
0.2234769, 0.005864099, 1.692436, 1, 1, 1, 1, 1,
0.2266867, -0.08074962, 3.224881, 1, 1, 1, 1, 1,
0.2286885, 0.1988508, 2.506957, 1, 1, 1, 1, 1,
0.2294428, 1.215359, -1.476889, 1, 1, 1, 1, 1,
0.2296478, -0.1852801, 1.594004, 1, 1, 1, 1, 1,
0.230498, 1.835252, -2.555033, 1, 1, 1, 1, 1,
0.2328223, 1.342202, 0.1369752, 1, 1, 1, 1, 1,
0.2350599, 0.04747066, 0.2449729, 1, 1, 1, 1, 1,
0.2370677, 1.441535, 0.2872885, 0, 0, 1, 1, 1,
0.2395241, 0.2809322, 0.9934384, 1, 0, 0, 1, 1,
0.2400329, 1.361266, 0.7410984, 1, 0, 0, 1, 1,
0.2401815, -0.6076743, 4.271986, 1, 0, 0, 1, 1,
0.2413731, 0.3864644, 0.6174024, 1, 0, 0, 1, 1,
0.2530811, 0.2794089, 1.080161, 1, 0, 0, 1, 1,
0.2590394, 0.9884011, 0.195248, 0, 0, 0, 1, 1,
0.2595151, 1.436793, 2.410594, 0, 0, 0, 1, 1,
0.2596072, 1.034715, 0.1352675, 0, 0, 0, 1, 1,
0.2617595, 0.5993138, 1.610395, 0, 0, 0, 1, 1,
0.2634081, -2.160733, 4.038236, 0, 0, 0, 1, 1,
0.2675354, -1.005643, 2.757117, 0, 0, 0, 1, 1,
0.2675517, 0.2718396, -0.8364828, 0, 0, 0, 1, 1,
0.2688308, -0.1484617, 3.762925, 1, 1, 1, 1, 1,
0.2715271, 0.617473, 0.9311491, 1, 1, 1, 1, 1,
0.272106, 1.446673, 0.6559314, 1, 1, 1, 1, 1,
0.2737255, -0.0711237, 1.900824, 1, 1, 1, 1, 1,
0.2751781, 1.952387, 1.698357, 1, 1, 1, 1, 1,
0.2769139, 1.446231, -1.00817, 1, 1, 1, 1, 1,
0.2787568, 0.8466772, 1.075249, 1, 1, 1, 1, 1,
0.2818027, -0.2033064, 2.55175, 1, 1, 1, 1, 1,
0.2820847, 1.470564, 0.6907598, 1, 1, 1, 1, 1,
0.2844087, -0.8407553, 3.543193, 1, 1, 1, 1, 1,
0.284752, 0.4522156, -0.9322373, 1, 1, 1, 1, 1,
0.2854945, 0.1441519, 1.283018, 1, 1, 1, 1, 1,
0.2859375, -0.9897979, 2.225675, 1, 1, 1, 1, 1,
0.2861266, -1.016792, 1.670018, 1, 1, 1, 1, 1,
0.289769, -2.220816, 3.493558, 1, 1, 1, 1, 1,
0.2917111, 0.3482962, -0.1811732, 0, 0, 1, 1, 1,
0.2921755, -1.084918, 2.870689, 1, 0, 0, 1, 1,
0.292778, 2.201597, 1.667979, 1, 0, 0, 1, 1,
0.2932895, -0.5267962, 1.593425, 1, 0, 0, 1, 1,
0.2934837, -1.704948, 2.396535, 1, 0, 0, 1, 1,
0.3019485, 0.7078747, -0.05799941, 1, 0, 0, 1, 1,
0.3030254, -0.537913, 4.187277, 0, 0, 0, 1, 1,
0.3098558, -0.4785123, 2.36818, 0, 0, 0, 1, 1,
0.3106207, 0.07201979, 3.905838, 0, 0, 0, 1, 1,
0.3107759, -1.224838, 2.80351, 0, 0, 0, 1, 1,
0.3149989, 0.06379697, -0.2611995, 0, 0, 0, 1, 1,
0.3167878, -0.3866169, 2.794539, 0, 0, 0, 1, 1,
0.3187025, 0.8506758, 1.451997, 0, 0, 0, 1, 1,
0.3190963, 0.4266348, 2.68665, 1, 1, 1, 1, 1,
0.3205478, -1.244239, 2.348168, 1, 1, 1, 1, 1,
0.3210882, 1.405869, 0.2691763, 1, 1, 1, 1, 1,
0.3269743, -0.1545203, 2.571343, 1, 1, 1, 1, 1,
0.3283958, 0.6802233, 1.249038, 1, 1, 1, 1, 1,
0.3320067, -0.4314619, 1.870423, 1, 1, 1, 1, 1,
0.3331681, 1.742231, -0.4414428, 1, 1, 1, 1, 1,
0.333456, -0.08715848, 1.80233, 1, 1, 1, 1, 1,
0.3341951, -0.8088112, 0.5390292, 1, 1, 1, 1, 1,
0.3374448, 0.03088238, 1.548666, 1, 1, 1, 1, 1,
0.3375409, -0.618685, 3.305493, 1, 1, 1, 1, 1,
0.3384827, -1.047633, 1.954009, 1, 1, 1, 1, 1,
0.346304, -0.6115374, 3.610838, 1, 1, 1, 1, 1,
0.3475958, -1.021952, 4.045182, 1, 1, 1, 1, 1,
0.3512805, 0.7977762, -1.034495, 1, 1, 1, 1, 1,
0.3536196, -0.2602695, 2.926622, 0, 0, 1, 1, 1,
0.3569787, -0.9319927, 2.399778, 1, 0, 0, 1, 1,
0.3573029, -0.07806323, 1.393997, 1, 0, 0, 1, 1,
0.3579389, 0.5010046, 2.29716, 1, 0, 0, 1, 1,
0.3616547, 0.9340723, -0.7700801, 1, 0, 0, 1, 1,
0.3641025, -0.519838, 1.893833, 1, 0, 0, 1, 1,
0.3697635, -0.0318264, 1.422203, 0, 0, 0, 1, 1,
0.3789457, 0.9790139, -0.4722357, 0, 0, 0, 1, 1,
0.3850845, 1.559137, 2.036185, 0, 0, 0, 1, 1,
0.3851253, -0.8898453, 3.430442, 0, 0, 0, 1, 1,
0.3895203, 0.01542031, 1.867409, 0, 0, 0, 1, 1,
0.3929534, 0.5057169, 0.9004514, 0, 0, 0, 1, 1,
0.3938552, 1.722376, -1.206596, 0, 0, 0, 1, 1,
0.3963511, 2.005982, -0.1966793, 1, 1, 1, 1, 1,
0.3984846, -0.8812116, 2.369946, 1, 1, 1, 1, 1,
0.4083393, 0.9955466, -0.07412788, 1, 1, 1, 1, 1,
0.4108548, 0.4291696, 0.2709623, 1, 1, 1, 1, 1,
0.4141698, 0.8795087, -0.9132882, 1, 1, 1, 1, 1,
0.4198503, 1.027739, 0.5843839, 1, 1, 1, 1, 1,
0.4205019, 1.748794, 1.270573, 1, 1, 1, 1, 1,
0.4210197, -0.3876698, 2.963211, 1, 1, 1, 1, 1,
0.421021, 0.5289866, 0.4378184, 1, 1, 1, 1, 1,
0.4214736, -0.09480383, 2.834891, 1, 1, 1, 1, 1,
0.4219528, 0.8967438, 1.81331, 1, 1, 1, 1, 1,
0.4237808, 0.3465088, 0.08173747, 1, 1, 1, 1, 1,
0.4323107, -0.416533, 1.450297, 1, 1, 1, 1, 1,
0.448453, -1.490302, 2.629017, 1, 1, 1, 1, 1,
0.4491706, -0.1044854, 2.952533, 1, 1, 1, 1, 1,
0.4529445, -0.4764743, 3.619171, 0, 0, 1, 1, 1,
0.4539284, 1.430641, -0.06515399, 1, 0, 0, 1, 1,
0.4542567, 0.4145305, 0.0432544, 1, 0, 0, 1, 1,
0.4591325, 0.6900951, -0.5346901, 1, 0, 0, 1, 1,
0.4635631, 1.287286, -0.3042156, 1, 0, 0, 1, 1,
0.464094, -1.706765, 3.035016, 1, 0, 0, 1, 1,
0.4659032, -0.6733587, 2.37523, 0, 0, 0, 1, 1,
0.4667709, 0.4647916, -0.1576198, 0, 0, 0, 1, 1,
0.4700632, 1.41694, -0.5057906, 0, 0, 0, 1, 1,
0.4704133, -0.2512407, 2.875439, 0, 0, 0, 1, 1,
0.4780796, 2.304042, -2.427604, 0, 0, 0, 1, 1,
0.4799635, 0.7395091, 1.2105, 0, 0, 0, 1, 1,
0.4850925, -1.324489, 2.526634, 0, 0, 0, 1, 1,
0.4858145, 0.8358597, 1.853739, 1, 1, 1, 1, 1,
0.4859816, 0.9459391, 0.3096661, 1, 1, 1, 1, 1,
0.4869501, -0.07149752, 1.742496, 1, 1, 1, 1, 1,
0.4890887, 0.1718889, 1.383658, 1, 1, 1, 1, 1,
0.4892723, -0.3479495, 2.266419, 1, 1, 1, 1, 1,
0.490306, 0.2025935, 0.776448, 1, 1, 1, 1, 1,
0.490771, -0.2237887, 1.376096, 1, 1, 1, 1, 1,
0.4959742, 0.3019282, 0.880013, 1, 1, 1, 1, 1,
0.5008474, -1.94184, 3.67332, 1, 1, 1, 1, 1,
0.5033039, -1.85041, 3.1924, 1, 1, 1, 1, 1,
0.507749, 0.614489, 0.9744913, 1, 1, 1, 1, 1,
0.50859, 1.970937, 0.1422592, 1, 1, 1, 1, 1,
0.5097035, 0.6809868, 0.5311229, 1, 1, 1, 1, 1,
0.5102107, 1.287008, 2.15801, 1, 1, 1, 1, 1,
0.5123593, -0.3151947, 1.802242, 1, 1, 1, 1, 1,
0.5161234, -1.743197, 2.837168, 0, 0, 1, 1, 1,
0.5163927, 0.1884282, 1.760377, 1, 0, 0, 1, 1,
0.5180022, 0.4068709, 1.096621, 1, 0, 0, 1, 1,
0.518032, 1.148325, -0.0651441, 1, 0, 0, 1, 1,
0.527238, 0.2849439, 0.9152636, 1, 0, 0, 1, 1,
0.5290868, -0.1706025, 1.819291, 1, 0, 0, 1, 1,
0.531918, 0.2083377, 1.608801, 0, 0, 0, 1, 1,
0.5343117, 1.67072, 1.417254, 0, 0, 0, 1, 1,
0.5347983, 0.6673337, 0.7168252, 0, 0, 0, 1, 1,
0.5405971, 0.3014402, 0.3421488, 0, 0, 0, 1, 1,
0.5406788, -0.8124228, 3.023726, 0, 0, 0, 1, 1,
0.5407848, 0.2626526, -0.3195447, 0, 0, 0, 1, 1,
0.5426695, 1.55278, 0.9208628, 0, 0, 0, 1, 1,
0.545663, 1.174726, 1.413411, 1, 1, 1, 1, 1,
0.5519344, 1.072623, 0.8869731, 1, 1, 1, 1, 1,
0.5618857, -0.9578524, 2.450787, 1, 1, 1, 1, 1,
0.5628805, 0.2360037, 2.504188, 1, 1, 1, 1, 1,
0.5635662, -1.234256, 2.811084, 1, 1, 1, 1, 1,
0.5645165, 0.7691874, 1.15388, 1, 1, 1, 1, 1,
0.5662662, 0.4136904, 1.439147, 1, 1, 1, 1, 1,
0.5676797, 0.1227185, -0.7638097, 1, 1, 1, 1, 1,
0.5701927, -0.8114362, 3.241298, 1, 1, 1, 1, 1,
0.5723313, 0.4171157, 0.5004885, 1, 1, 1, 1, 1,
0.5740033, 0.4927731, 2.67182, 1, 1, 1, 1, 1,
0.574371, 0.2517743, -0.00895141, 1, 1, 1, 1, 1,
0.5749885, 0.1736376, 1.517475, 1, 1, 1, 1, 1,
0.5760604, 0.4701058, -0.1279773, 1, 1, 1, 1, 1,
0.5800948, -0.7051911, 3.266615, 1, 1, 1, 1, 1,
0.5802938, 0.7420305, 0.1817815, 0, 0, 1, 1, 1,
0.5859661, -0.02968747, 0.07592163, 1, 0, 0, 1, 1,
0.5867007, -0.5327193, -0.4534424, 1, 0, 0, 1, 1,
0.5914374, 0.5160275, -0.2784502, 1, 0, 0, 1, 1,
0.5978968, -0.03796649, 3.319706, 1, 0, 0, 1, 1,
0.6021249, -0.2462105, 1.74563, 1, 0, 0, 1, 1,
0.6031557, -0.01706958, 1.29116, 0, 0, 0, 1, 1,
0.6034614, -0.5273711, 1.751575, 0, 0, 0, 1, 1,
0.6084323, -0.1783652, 1.709789, 0, 0, 0, 1, 1,
0.6096954, 0.04599675, 2.886117, 0, 0, 0, 1, 1,
0.6131064, 0.0121094, 0.6995195, 0, 0, 0, 1, 1,
0.6161649, 0.3466684, 0.4309501, 0, 0, 0, 1, 1,
0.6251443, -0.5048425, 1.207949, 0, 0, 0, 1, 1,
0.6327275, 0.2241623, 0.7350289, 1, 1, 1, 1, 1,
0.6368135, 0.02572699, 2.756755, 1, 1, 1, 1, 1,
0.640385, 0.3830929, 1.314736, 1, 1, 1, 1, 1,
0.6404038, -1.055475, 2.845472, 1, 1, 1, 1, 1,
0.6443896, 0.6341763, 1.132422, 1, 1, 1, 1, 1,
0.6466037, 0.3902986, 1.242627, 1, 1, 1, 1, 1,
0.6466367, -0.7806466, 2.900223, 1, 1, 1, 1, 1,
0.6491372, -0.6178198, 2.971242, 1, 1, 1, 1, 1,
0.6529761, -0.7000319, 2.924313, 1, 1, 1, 1, 1,
0.6554035, 0.4776855, 0.1601477, 1, 1, 1, 1, 1,
0.6558865, -2.080559, 0.9915367, 1, 1, 1, 1, 1,
0.6565438, -1.27719, 2.393059, 1, 1, 1, 1, 1,
0.6575667, -0.9795132, 3.157978, 1, 1, 1, 1, 1,
0.6589071, -0.9734014, 3.4705, 1, 1, 1, 1, 1,
0.6686352, 0.6603639, 0.02404601, 1, 1, 1, 1, 1,
0.6727358, -0.7768067, 3.784844, 0, 0, 1, 1, 1,
0.6735539, -1.609949, 2.338109, 1, 0, 0, 1, 1,
0.681289, 1.435989, -1.14722, 1, 0, 0, 1, 1,
0.6829054, 0.6600085, 0.188056, 1, 0, 0, 1, 1,
0.6829494, 1.050505, 2.066801, 1, 0, 0, 1, 1,
0.6846268, 0.04405434, 2.676394, 1, 0, 0, 1, 1,
0.6901893, 0.1478764, 0.9121979, 0, 0, 0, 1, 1,
0.6962463, -1.727714, 3.97794, 0, 0, 0, 1, 1,
0.6971599, 0.4257812, 1.007818, 0, 0, 0, 1, 1,
0.6980165, -0.103076, 2.025548, 0, 0, 0, 1, 1,
0.6983575, 0.1817113, 1.959001, 0, 0, 0, 1, 1,
0.7026107, 0.6932358, 2.220692, 0, 0, 0, 1, 1,
0.7063613, -0.6404827, 2.559539, 0, 0, 0, 1, 1,
0.7071716, -1.63728, 3.584813, 1, 1, 1, 1, 1,
0.7148165, 0.8768104, 1.412755, 1, 1, 1, 1, 1,
0.7160783, -0.1864951, 3.341669, 1, 1, 1, 1, 1,
0.7220899, -0.7901936, 3.517321, 1, 1, 1, 1, 1,
0.7225376, 1.105826, 0.9200329, 1, 1, 1, 1, 1,
0.7299745, -0.5435207, 2.972925, 1, 1, 1, 1, 1,
0.7343143, 0.8837769, 0.1869404, 1, 1, 1, 1, 1,
0.7355433, 0.6011761, 0.002476996, 1, 1, 1, 1, 1,
0.735979, 0.01175954, 2.522067, 1, 1, 1, 1, 1,
0.7413625, -0.5730338, 4.494839, 1, 1, 1, 1, 1,
0.7434872, 2.352807, -0.1322911, 1, 1, 1, 1, 1,
0.7478452, -1.780649, 4.418548, 1, 1, 1, 1, 1,
0.7581666, -0.9658589, 1.358564, 1, 1, 1, 1, 1,
0.7637191, 1.2921, -0.9232846, 1, 1, 1, 1, 1,
0.7762761, -0.5753497, 3.094979, 1, 1, 1, 1, 1,
0.7768825, -0.2548599, 2.589214, 0, 0, 1, 1, 1,
0.7825174, 1.772114, 0.143922, 1, 0, 0, 1, 1,
0.789736, -0.9603525, 3.490693, 1, 0, 0, 1, 1,
0.7907442, -1.450506, 1.427775, 1, 0, 0, 1, 1,
0.7948991, -1.130298, 2.482345, 1, 0, 0, 1, 1,
0.7949845, -0.5515591, 1.465015, 1, 0, 0, 1, 1,
0.7967749, 0.08885872, 1.836781, 0, 0, 0, 1, 1,
0.8015629, 2.546485, 1.048403, 0, 0, 0, 1, 1,
0.8050378, 0.52968, 1.955849, 0, 0, 0, 1, 1,
0.8098771, 0.2647665, 0.1658519, 0, 0, 0, 1, 1,
0.8137379, 1.42154, 0.04998682, 0, 0, 0, 1, 1,
0.8249721, 0.1155832, 1.557197, 0, 0, 0, 1, 1,
0.8257221, 2.021467, 0.08659483, 0, 0, 0, 1, 1,
0.8258963, 0.8940994, 1.136113, 1, 1, 1, 1, 1,
0.8279097, 0.5711755, 0.7140873, 1, 1, 1, 1, 1,
0.8300066, -0.9671286, 3.237671, 1, 1, 1, 1, 1,
0.8302068, -1.33842, 2.12632, 1, 1, 1, 1, 1,
0.8307437, 0.5209677, 0.7252061, 1, 1, 1, 1, 1,
0.8310705, -2.266956, 4.230563, 1, 1, 1, 1, 1,
0.8338116, 1.059855, 0.3784611, 1, 1, 1, 1, 1,
0.8376726, 0.04010379, 2.920052, 1, 1, 1, 1, 1,
0.8462929, -0.5899885, 1.932526, 1, 1, 1, 1, 1,
0.8566194, -0.4763581, 3.985816, 1, 1, 1, 1, 1,
0.8574004, -1.288768, 3.001895, 1, 1, 1, 1, 1,
0.8720886, 1.012517, -0.2099068, 1, 1, 1, 1, 1,
0.875553, -0.725176, 2.476767, 1, 1, 1, 1, 1,
0.8757796, 2.039493, 0.1983257, 1, 1, 1, 1, 1,
0.8890712, 0.4591224, 1.681352, 1, 1, 1, 1, 1,
0.8930056, 0.3076358, 0.91658, 0, 0, 1, 1, 1,
0.9020041, -2.426217, 3.172194, 1, 0, 0, 1, 1,
0.9025155, 0.277901, 1.206625, 1, 0, 0, 1, 1,
0.9042198, 0.772059, 0.5440837, 1, 0, 0, 1, 1,
0.9145837, 1.259504, 0.3329129, 1, 0, 0, 1, 1,
0.9168034, 0.1006192, 2.811487, 1, 0, 0, 1, 1,
0.918952, -1.086938, 1.745023, 0, 0, 0, 1, 1,
0.9251772, -0.6239467, 1.383057, 0, 0, 0, 1, 1,
0.9285712, 0.8241383, 1.36436, 0, 0, 0, 1, 1,
0.9300705, 0.9832481, 0.6166405, 0, 0, 0, 1, 1,
0.9327063, -0.4650749, 1.265865, 0, 0, 0, 1, 1,
0.9335427, -0.710695, 2.576653, 0, 0, 0, 1, 1,
0.9391847, 0.05581253, 1.068251, 0, 0, 0, 1, 1,
0.9468018, 0.793659, 1.832273, 1, 1, 1, 1, 1,
0.9486669, -1.39795, 4.167207, 1, 1, 1, 1, 1,
0.950411, 1.053466, -0.9208906, 1, 1, 1, 1, 1,
0.9517903, 0.7380579, 0.8969641, 1, 1, 1, 1, 1,
0.9519989, 0.7978592, 1.171226, 1, 1, 1, 1, 1,
0.9554173, 1.427408, 1.194293, 1, 1, 1, 1, 1,
0.956046, -0.6806467, 1.542329, 1, 1, 1, 1, 1,
0.9578847, -0.04963363, -0.4499072, 1, 1, 1, 1, 1,
0.9582869, -0.722645, 1.875594, 1, 1, 1, 1, 1,
0.9608808, 0.3133766, 1.549631, 1, 1, 1, 1, 1,
0.9648839, -0.866293, 2.695662, 1, 1, 1, 1, 1,
0.9653022, -0.8817054, 2.640038, 1, 1, 1, 1, 1,
0.9674056, 0.5418015, 1.23881, 1, 1, 1, 1, 1,
0.9769782, -0.4596713, 2.070362, 1, 1, 1, 1, 1,
0.9800925, -0.2942646, 1.673156, 1, 1, 1, 1, 1,
0.982587, -0.03607129, 2.599044, 0, 0, 1, 1, 1,
0.9886948, 1.70802, -0.5477902, 1, 0, 0, 1, 1,
0.9947424, -0.4436461, 1.982802, 1, 0, 0, 1, 1,
0.9998906, -0.5939711, 1.463673, 1, 0, 0, 1, 1,
1.005885, -0.20086, 1.146818, 1, 0, 0, 1, 1,
1.008731, -0.4879354, 0.948636, 1, 0, 0, 1, 1,
1.009654, -0.8374527, 3.749738, 0, 0, 0, 1, 1,
1.013327, 0.5361085, -0.5414116, 0, 0, 0, 1, 1,
1.014358, -0.006311825, 0.765935, 0, 0, 0, 1, 1,
1.014521, 0.24971, 1.989203, 0, 0, 0, 1, 1,
1.020586, -0.9392613, 0.6668919, 0, 0, 0, 1, 1,
1.031862, 0.233305, 1.631152, 0, 0, 0, 1, 1,
1.039278, -1.407097, 2.715604, 0, 0, 0, 1, 1,
1.039919, -0.5041755, 3.158316, 1, 1, 1, 1, 1,
1.040015, 0.001481095, 1.9297, 1, 1, 1, 1, 1,
1.044639, -1.226093, -0.05860398, 1, 1, 1, 1, 1,
1.046377, -0.1279654, 0.6245597, 1, 1, 1, 1, 1,
1.049407, 1.491245, 1.109012, 1, 1, 1, 1, 1,
1.050954, 0.4207486, 0.2583971, 1, 1, 1, 1, 1,
1.053931, 1.136038, -0.02196813, 1, 1, 1, 1, 1,
1.054758, 0.7607555, 0.3593239, 1, 1, 1, 1, 1,
1.05512, 2.968274, 0.05978645, 1, 1, 1, 1, 1,
1.057451, 0.5395951, 0.02732343, 1, 1, 1, 1, 1,
1.073301, -1.256194, 1.636858, 1, 1, 1, 1, 1,
1.079725, -0.8047879, 0.8846683, 1, 1, 1, 1, 1,
1.085535, 0.8761989, 0.574999, 1, 1, 1, 1, 1,
1.090071, 1.292651, 0.7508546, 1, 1, 1, 1, 1,
1.092988, -0.7338208, 1.896522, 1, 1, 1, 1, 1,
1.093927, 1.3364, -0.05882564, 0, 0, 1, 1, 1,
1.101005, 0.2969507, 1.860695, 1, 0, 0, 1, 1,
1.108536, -1.584378, 2.887935, 1, 0, 0, 1, 1,
1.10984, -1.189183, 2.837733, 1, 0, 0, 1, 1,
1.111977, -0.07918919, 0.1557004, 1, 0, 0, 1, 1,
1.11369, 0.6913564, -1.028285, 1, 0, 0, 1, 1,
1.11617, 0.1765404, 1.029287, 0, 0, 0, 1, 1,
1.128312, -0.9691098, 3.059849, 0, 0, 0, 1, 1,
1.132745, 0.6171424, 1.354279, 0, 0, 0, 1, 1,
1.134216, 0.3000473, 0.6787643, 0, 0, 0, 1, 1,
1.134481, 0.6225448, 1.096825, 0, 0, 0, 1, 1,
1.140529, 0.3129506, 1.99948, 0, 0, 0, 1, 1,
1.152162, 0.5039844, 1.965212, 0, 0, 0, 1, 1,
1.154057, 1.066769, 1.500547, 1, 1, 1, 1, 1,
1.157809, -0.09241442, 1.574219, 1, 1, 1, 1, 1,
1.158191, -1.58717, 2.783396, 1, 1, 1, 1, 1,
1.164294, -0.8851628, 1.900819, 1, 1, 1, 1, 1,
1.167778, -1.175714, 0.7353646, 1, 1, 1, 1, 1,
1.173332, 0.4045964, 1.991714, 1, 1, 1, 1, 1,
1.178565, 1.175236, 1.131535, 1, 1, 1, 1, 1,
1.184945, 1.730846, -0.7422559, 1, 1, 1, 1, 1,
1.19303, -0.02442201, 2.351555, 1, 1, 1, 1, 1,
1.195764, -1.129631, 1.850305, 1, 1, 1, 1, 1,
1.198735, -0.01121206, 0.954914, 1, 1, 1, 1, 1,
1.205301, 1.339195, -0.366338, 1, 1, 1, 1, 1,
1.207472, 0.8326402, 2.836523, 1, 1, 1, 1, 1,
1.22171, 0.2564247, 2.222047, 1, 1, 1, 1, 1,
1.223467, -0.3533893, 4.619656, 1, 1, 1, 1, 1,
1.225887, -0.2623941, 1.804908, 0, 0, 1, 1, 1,
1.225911, 1.477974, -1.090544, 1, 0, 0, 1, 1,
1.237387, 1.601613, 0.3981263, 1, 0, 0, 1, 1,
1.238712, -1.509363, 2.881053, 1, 0, 0, 1, 1,
1.238769, 0.4490406, 1.287055, 1, 0, 0, 1, 1,
1.245964, 1.030745, 2.258917, 1, 0, 0, 1, 1,
1.261329, 0.5680094, 0.7870322, 0, 0, 0, 1, 1,
1.27104, -0.7233129, 3.616294, 0, 0, 0, 1, 1,
1.28752, 0.1441785, 1.898838, 0, 0, 0, 1, 1,
1.288286, -0.473076, 2.172178, 0, 0, 0, 1, 1,
1.300739, -0.7441483, 3.499391, 0, 0, 0, 1, 1,
1.304964, 0.3404525, 0.3742786, 0, 0, 0, 1, 1,
1.305529, -1.75382, 3.340586, 0, 0, 0, 1, 1,
1.313043, 0.2872548, 1.339853, 1, 1, 1, 1, 1,
1.317189, 1.153117, 0.5249279, 1, 1, 1, 1, 1,
1.319364, -0.7943244, 2.473817, 1, 1, 1, 1, 1,
1.323413, -0.5931923, 3.043042, 1, 1, 1, 1, 1,
1.324297, 1.655393, -1.286043, 1, 1, 1, 1, 1,
1.324738, -0.3989051, 1.457304, 1, 1, 1, 1, 1,
1.343039, 1.508599, -0.9625357, 1, 1, 1, 1, 1,
1.358351, -0.04213899, 2.414878, 1, 1, 1, 1, 1,
1.378593, 0.3427143, 0.2156679, 1, 1, 1, 1, 1,
1.380917, -1.340521, 2.500939, 1, 1, 1, 1, 1,
1.394651, 0.7392282, 0.8779856, 1, 1, 1, 1, 1,
1.39829, -0.9418001, 2.246316, 1, 1, 1, 1, 1,
1.398925, -0.4919833, 0.6348127, 1, 1, 1, 1, 1,
1.402547, -0.6102612, 1.45751, 1, 1, 1, 1, 1,
1.434767, -1.223207, 1.682922, 1, 1, 1, 1, 1,
1.438952, -2.128953, 2.499074, 0, 0, 1, 1, 1,
1.439412, -0.140459, 2.381046, 1, 0, 0, 1, 1,
1.441406, 0.4035971, 1.993126, 1, 0, 0, 1, 1,
1.441888, 1.275086, -0.4258652, 1, 0, 0, 1, 1,
1.449122, -1.351067, 0.159595, 1, 0, 0, 1, 1,
1.45945, -0.5176971, 3.012388, 1, 0, 0, 1, 1,
1.460324, -1.384769, 1.651487, 0, 0, 0, 1, 1,
1.460641, -0.1385308, 2.677317, 0, 0, 0, 1, 1,
1.463432, -2.020854, 2.531268, 0, 0, 0, 1, 1,
1.466539, -0.8889841, 3.140053, 0, 0, 0, 1, 1,
1.487499, -0.2198848, 0.8669408, 0, 0, 0, 1, 1,
1.493163, -0.3969504, 1.551926, 0, 0, 0, 1, 1,
1.496946, -0.794956, 1.592466, 0, 0, 0, 1, 1,
1.502485, -0.5091754, 1.585421, 1, 1, 1, 1, 1,
1.517428, -1.818978, 3.789916, 1, 1, 1, 1, 1,
1.520912, 0.2254927, 2.781751, 1, 1, 1, 1, 1,
1.521884, 1.283291, -0.271769, 1, 1, 1, 1, 1,
1.535689, 1.555795, 0.4508754, 1, 1, 1, 1, 1,
1.536728, 0.7376058, 0.4263261, 1, 1, 1, 1, 1,
1.546091, -1.153871, 0.816299, 1, 1, 1, 1, 1,
1.55646, 1.354088, -0.5513425, 1, 1, 1, 1, 1,
1.556539, -0.8324606, 2.2938, 1, 1, 1, 1, 1,
1.563967, 1.98145, 2.106196, 1, 1, 1, 1, 1,
1.571201, -0.1609491, 2.754728, 1, 1, 1, 1, 1,
1.571354, -0.5079286, 0.5956463, 1, 1, 1, 1, 1,
1.589619, 0.5207861, 1.76566, 1, 1, 1, 1, 1,
1.611326, -0.5892636, 2.583139, 1, 1, 1, 1, 1,
1.614973, 0.1191103, 0.08181386, 1, 1, 1, 1, 1,
1.616663, -0.4093346, 1.769779, 0, 0, 1, 1, 1,
1.621108, 0.5049059, 0.2681683, 1, 0, 0, 1, 1,
1.621514, 0.9137391, 0.9758476, 1, 0, 0, 1, 1,
1.627069, 0.1110407, -1.377, 1, 0, 0, 1, 1,
1.647916, -0.2349426, 1.451796, 1, 0, 0, 1, 1,
1.670653, -0.6872301, 0.9611494, 1, 0, 0, 1, 1,
1.670682, -1.769067, 2.052337, 0, 0, 0, 1, 1,
1.672305, -0.8459057, 0.5229099, 0, 0, 0, 1, 1,
1.681224, 0.286821, 0.3441459, 0, 0, 0, 1, 1,
1.68349, 0.5268458, 4.069461, 0, 0, 0, 1, 1,
1.700392, 0.3108833, 3.425876, 0, 0, 0, 1, 1,
1.703351, -2.064105, 2.472678, 0, 0, 0, 1, 1,
1.706209, 1.853848, -0.345163, 0, 0, 0, 1, 1,
1.711922, 0.7976924, 1.334538, 1, 1, 1, 1, 1,
1.723787, 1.668934, 0.002544637, 1, 1, 1, 1, 1,
1.731361, -1.106881, 1.636968, 1, 1, 1, 1, 1,
1.731574, -1.258997, 2.809697, 1, 1, 1, 1, 1,
1.746109, 0.3462709, -0.08881313, 1, 1, 1, 1, 1,
1.747822, 0.312224, 2.837704, 1, 1, 1, 1, 1,
1.763906, -1.523346, 2.992317, 1, 1, 1, 1, 1,
1.765115, -0.003639275, 0.7348728, 1, 1, 1, 1, 1,
1.788259, -0.3524142, 0.8138999, 1, 1, 1, 1, 1,
1.802072, 0.8873265, 0.60119, 1, 1, 1, 1, 1,
1.808312, 0.8644248, 1.946455, 1, 1, 1, 1, 1,
1.811293, -0.5270373, 2.553115, 1, 1, 1, 1, 1,
1.817346, -0.4246576, 2.605904, 1, 1, 1, 1, 1,
1.907642, -0.4855242, -0.6108896, 1, 1, 1, 1, 1,
2.012333, 0.5120628, 2.780727, 1, 1, 1, 1, 1,
2.064455, -1.815, 2.302191, 0, 0, 1, 1, 1,
2.074067, 1.140406, 1.498025, 1, 0, 0, 1, 1,
2.118798, -0.732585, 0.727033, 1, 0, 0, 1, 1,
2.14821, 0.4708232, 0.7927292, 1, 0, 0, 1, 1,
2.151106, -1.675074, 3.218585, 1, 0, 0, 1, 1,
2.214751, 1.834394, 2.669625, 1, 0, 0, 1, 1,
2.227024, 0.6048518, 1.869208, 0, 0, 0, 1, 1,
2.231799, 0.5946624, 3.312672, 0, 0, 0, 1, 1,
2.243204, -0.9277194, 2.693994, 0, 0, 0, 1, 1,
2.279328, 3.444879, 1.265413, 0, 0, 0, 1, 1,
2.434066, 0.6676744, 2.1966, 0, 0, 0, 1, 1,
2.458238, -0.8694801, 1.487397, 0, 0, 0, 1, 1,
2.518275, 0.6742758, 2.630998, 0, 0, 0, 1, 1,
2.522681, -0.1871646, 1.223431, 1, 1, 1, 1, 1,
2.634885, 0.0838559, 2.061095, 1, 1, 1, 1, 1,
2.68269, 0.01991206, 1.918595, 1, 1, 1, 1, 1,
2.698476, 0.142975, 1.457132, 1, 1, 1, 1, 1,
2.756942, -0.1194037, 1.191525, 1, 1, 1, 1, 1,
3.269335, 1.386101, 0.9146602, 1, 1, 1, 1, 1,
3.297698, -0.4844471, 0.8565997, 1, 1, 1, 1, 1
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
var radius = 9.707188;
var distance = 34.09609;
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
mvMatrix.translate( 0.251235, -0.1531892, 0.08132005 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.09609);
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
