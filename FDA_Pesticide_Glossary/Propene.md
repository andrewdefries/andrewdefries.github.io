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
-3.277624, 0.002008809, -0.9601799, 1, 0, 0, 1,
-3.207652, -0.3857752, -3.475816, 1, 0.007843138, 0, 1,
-2.886695, 1.780193, -0.4055762, 1, 0.01176471, 0, 1,
-2.605846, -1.768248, -2.782232, 1, 0.01960784, 0, 1,
-2.508409, 0.2991282, -1.370763, 1, 0.02352941, 0, 1,
-2.473994, 0.03955363, -2.718869, 1, 0.03137255, 0, 1,
-2.437386, -1.184501, -2.126971, 1, 0.03529412, 0, 1,
-2.437195, 0.4671228, -1.512229, 1, 0.04313726, 0, 1,
-2.268324, -1.40183, -1.298329, 1, 0.04705882, 0, 1,
-2.259006, 1.214088, -1.111747, 1, 0.05490196, 0, 1,
-2.243381, 0.8507268, -1.04235, 1, 0.05882353, 0, 1,
-2.215184, 0.6159634, -2.254092, 1, 0.06666667, 0, 1,
-2.132554, -0.1647776, -1.52689, 1, 0.07058824, 0, 1,
-2.12204, 0.05972094, -0.3687359, 1, 0.07843138, 0, 1,
-2.111453, 1.055771, 0.008979203, 1, 0.08235294, 0, 1,
-2.094573, -0.6797938, -1.911892, 1, 0.09019608, 0, 1,
-2.093849, -0.5350209, -2.181981, 1, 0.09411765, 0, 1,
-2.033915, -0.4323851, -1.89877, 1, 0.1019608, 0, 1,
-2.028382, 0.215884, 0.3328123, 1, 0.1098039, 0, 1,
-2.024892, -1.311539, -2.895289, 1, 0.1137255, 0, 1,
-2.015024, 0.8379473, -1.583474, 1, 0.1215686, 0, 1,
-1.9742, 0.1002334, -1.781947, 1, 0.1254902, 0, 1,
-1.967973, 1.47386, -1.757039, 1, 0.1333333, 0, 1,
-1.945752, -1.213272, -0.1441659, 1, 0.1372549, 0, 1,
-1.941102, -1.139671, -2.183685, 1, 0.145098, 0, 1,
-1.929043, -0.1391247, -1.698327, 1, 0.1490196, 0, 1,
-1.928455, 0.2202589, -1.7743, 1, 0.1568628, 0, 1,
-1.912659, -1.901199, 0.009101475, 1, 0.1607843, 0, 1,
-1.872531, -0.06651901, -3.061329, 1, 0.1686275, 0, 1,
-1.83629, 1.16112, -2.169798, 1, 0.172549, 0, 1,
-1.789493, -0.6290757, -2.826753, 1, 0.1803922, 0, 1,
-1.773568, -1.613263, -3.318495, 1, 0.1843137, 0, 1,
-1.767537, 0.2886864, -2.1211, 1, 0.1921569, 0, 1,
-1.765826, -0.6319415, -1.640163, 1, 0.1960784, 0, 1,
-1.761314, 0.7535626, -0.07056336, 1, 0.2039216, 0, 1,
-1.756676, 0.05078623, -1.3739, 1, 0.2117647, 0, 1,
-1.748802, 1.70223, -2.988222, 1, 0.2156863, 0, 1,
-1.744914, -0.5597632, -2.068625, 1, 0.2235294, 0, 1,
-1.724748, 1.552234, -0.9426662, 1, 0.227451, 0, 1,
-1.707975, 0.953478, -1.403828, 1, 0.2352941, 0, 1,
-1.699776, -0.3724146, -1.96443, 1, 0.2392157, 0, 1,
-1.678782, -0.3437567, -2.35412, 1, 0.2470588, 0, 1,
-1.675942, -1.049881, -2.93965, 1, 0.2509804, 0, 1,
-1.672593, -0.09011922, -2.696943, 1, 0.2588235, 0, 1,
-1.667798, 1.536884, -1.124586, 1, 0.2627451, 0, 1,
-1.666308, 0.6787539, -1.24786, 1, 0.2705882, 0, 1,
-1.656893, -0.3125961, -1.909769, 1, 0.2745098, 0, 1,
-1.651895, 0.3505066, -2.866291, 1, 0.282353, 0, 1,
-1.650724, 0.01175918, -2.754818, 1, 0.2862745, 0, 1,
-1.641959, -0.2984039, -0.5408406, 1, 0.2941177, 0, 1,
-1.621169, -1.288355, -3.42495, 1, 0.3019608, 0, 1,
-1.601544, -0.2664891, -2.651421, 1, 0.3058824, 0, 1,
-1.600741, 0.6858813, -0.5497616, 1, 0.3137255, 0, 1,
-1.595832, 0.5318402, -0.9909325, 1, 0.3176471, 0, 1,
-1.577044, -0.7538414, -2.47577, 1, 0.3254902, 0, 1,
-1.56709, 0.5045452, -0.7762523, 1, 0.3294118, 0, 1,
-1.564362, -0.8349662, -1.991508, 1, 0.3372549, 0, 1,
-1.555236, 0.779093, -0.9586792, 1, 0.3411765, 0, 1,
-1.54918, 1.951122, -0.3537207, 1, 0.3490196, 0, 1,
-1.539482, -0.2033055, -2.746678, 1, 0.3529412, 0, 1,
-1.536869, -1.202331, -1.681146, 1, 0.3607843, 0, 1,
-1.533078, 0.1514186, -0.5472033, 1, 0.3647059, 0, 1,
-1.530789, 1.254968, -3.429368, 1, 0.372549, 0, 1,
-1.52303, -0.06799067, -1.860719, 1, 0.3764706, 0, 1,
-1.522024, 0.7995312, -1.012267, 1, 0.3843137, 0, 1,
-1.515712, -0.4546838, -3.995083, 1, 0.3882353, 0, 1,
-1.513701, 1.811642, -0.772503, 1, 0.3960784, 0, 1,
-1.495242, 2.619346, -0.3976342, 1, 0.4039216, 0, 1,
-1.493912, 1.229398, -0.962274, 1, 0.4078431, 0, 1,
-1.488391, -0.5765995, -2.809835, 1, 0.4156863, 0, 1,
-1.477553, 0.3191825, -2.648849, 1, 0.4196078, 0, 1,
-1.476693, 0.03271173, -3.210044, 1, 0.427451, 0, 1,
-1.471622, 2.297797, -0.1063934, 1, 0.4313726, 0, 1,
-1.462615, -0.6673604, -2.002269, 1, 0.4392157, 0, 1,
-1.450829, -0.4076662, -1.271418, 1, 0.4431373, 0, 1,
-1.446481, -0.5169549, -2.726405, 1, 0.4509804, 0, 1,
-1.440282, 0.4915773, -1.605209, 1, 0.454902, 0, 1,
-1.433082, -1.191688, -2.887576, 1, 0.4627451, 0, 1,
-1.425292, -0.3246342, -2.780378, 1, 0.4666667, 0, 1,
-1.42315, -1.017249, -3.312315, 1, 0.4745098, 0, 1,
-1.410182, -0.207714, -2.930741, 1, 0.4784314, 0, 1,
-1.410022, 0.208409, 0.5942354, 1, 0.4862745, 0, 1,
-1.389904, -1.626631, -2.524073, 1, 0.4901961, 0, 1,
-1.386907, -0.8873789, -1.551563, 1, 0.4980392, 0, 1,
-1.37818, -0.1679125, 0.4335575, 1, 0.5058824, 0, 1,
-1.364616, 1.257073, -0.5970634, 1, 0.509804, 0, 1,
-1.355416, 1.370733, -0.6448388, 1, 0.5176471, 0, 1,
-1.354974, 0.4107624, -0.7171692, 1, 0.5215687, 0, 1,
-1.351413, 0.2853816, -1.305136, 1, 0.5294118, 0, 1,
-1.349673, 0.6811662, -1.293471, 1, 0.5333334, 0, 1,
-1.329458, -1.787543, -1.88698, 1, 0.5411765, 0, 1,
-1.327847, -2.058972, -3.211923, 1, 0.5450981, 0, 1,
-1.324638, 0.7343719, -3.559243, 1, 0.5529412, 0, 1,
-1.322553, 0.6696709, -0.2925941, 1, 0.5568628, 0, 1,
-1.317178, -0.7908236, -1.466817, 1, 0.5647059, 0, 1,
-1.31497, -0.07027654, -2.888151, 1, 0.5686275, 0, 1,
-1.308404, -0.2680082, -2.845083, 1, 0.5764706, 0, 1,
-1.307304, 1.79162, -0.03174384, 1, 0.5803922, 0, 1,
-1.306683, -0.05518415, -0.6515681, 1, 0.5882353, 0, 1,
-1.301542, -0.6629727, -2.021008, 1, 0.5921569, 0, 1,
-1.298741, 0.709332, 0.02653578, 1, 0.6, 0, 1,
-1.296756, -0.3901136, -0.3183635, 1, 0.6078432, 0, 1,
-1.293172, 0.4856741, -1.382754, 1, 0.6117647, 0, 1,
-1.29174, 0.2148297, -0.8987066, 1, 0.6196079, 0, 1,
-1.288329, 1.420103, -2.486338, 1, 0.6235294, 0, 1,
-1.285975, -0.6564456, -1.76738, 1, 0.6313726, 0, 1,
-1.285393, -0.4279457, -1.95656, 1, 0.6352941, 0, 1,
-1.285018, -0.8200903, -3.313498, 1, 0.6431373, 0, 1,
-1.270153, 0.4058973, -0.2970942, 1, 0.6470588, 0, 1,
-1.258839, 0.6311684, -0.6486193, 1, 0.654902, 0, 1,
-1.257682, -1.37695, -3.77896, 1, 0.6588235, 0, 1,
-1.254056, 0.6808188, -0.03775682, 1, 0.6666667, 0, 1,
-1.25311, 0.4761831, -2.195683, 1, 0.6705883, 0, 1,
-1.243307, 0.2245013, -1.003132, 1, 0.6784314, 0, 1,
-1.239124, -1.043419, -1.560967, 1, 0.682353, 0, 1,
-1.238117, 0.59159, 0.2340053, 1, 0.6901961, 0, 1,
-1.234819, -0.4066735, -1.840623, 1, 0.6941177, 0, 1,
-1.218754, 1.207765, -2.033698, 1, 0.7019608, 0, 1,
-1.211095, -0.5120659, -1.712502, 1, 0.7098039, 0, 1,
-1.207516, 0.3360983, -1.748955, 1, 0.7137255, 0, 1,
-1.204811, -0.3231471, -0.1532607, 1, 0.7215686, 0, 1,
-1.204378, 0.7937034, -2.885234, 1, 0.7254902, 0, 1,
-1.203708, -1.933054, -1.403641, 1, 0.7333333, 0, 1,
-1.202463, 2.650839, 0.3309578, 1, 0.7372549, 0, 1,
-1.201845, 0.8043583, -0.108777, 1, 0.7450981, 0, 1,
-1.20178, 0.7556444, -1.522326, 1, 0.7490196, 0, 1,
-1.20145, -1.998866, -2.692815, 1, 0.7568628, 0, 1,
-1.19735, 0.7003993, 0.630155, 1, 0.7607843, 0, 1,
-1.195783, 0.3932861, -1.870419, 1, 0.7686275, 0, 1,
-1.185841, -0.8125751, -3.371565, 1, 0.772549, 0, 1,
-1.183673, -1.009662, -1.143955, 1, 0.7803922, 0, 1,
-1.177655, 1.714579, -0.5903097, 1, 0.7843137, 0, 1,
-1.172343, 1.123485, -3.818436, 1, 0.7921569, 0, 1,
-1.165938, -1.307099, -1.718858, 1, 0.7960784, 0, 1,
-1.161241, -0.3823426, -2.216937, 1, 0.8039216, 0, 1,
-1.159037, -2.032686, -1.554338, 1, 0.8117647, 0, 1,
-1.158467, -0.4718238, -1.763672, 1, 0.8156863, 0, 1,
-1.155567, 0.8939539, 0.7466213, 1, 0.8235294, 0, 1,
-1.148099, -0.8175402, -1.315241, 1, 0.827451, 0, 1,
-1.139821, 1.379871, -1.282315, 1, 0.8352941, 0, 1,
-1.131783, 0.2432368, -0.7836918, 1, 0.8392157, 0, 1,
-1.127271, 0.4929973, 0.5500066, 1, 0.8470588, 0, 1,
-1.127233, 0.1942611, -1.672983, 1, 0.8509804, 0, 1,
-1.126011, -1.188056, -0.4894627, 1, 0.8588235, 0, 1,
-1.122339, -2.25434, 0.42374, 1, 0.8627451, 0, 1,
-1.121421, 1.234817, 0.6330848, 1, 0.8705882, 0, 1,
-1.106174, 0.05882787, -2.500359, 1, 0.8745098, 0, 1,
-1.104658, -0.5669464, -2.060316, 1, 0.8823529, 0, 1,
-1.094369, -0.9265576, -2.359963, 1, 0.8862745, 0, 1,
-1.090229, 0.65942, -1.611415, 1, 0.8941177, 0, 1,
-1.083028, 0.7295688, -1.256291, 1, 0.8980392, 0, 1,
-1.082233, 0.6532196, -0.529231, 1, 0.9058824, 0, 1,
-1.074176, 0.3552861, -2.557296, 1, 0.9137255, 0, 1,
-1.07076, -0.4171678, -2.657116, 1, 0.9176471, 0, 1,
-1.065592, 0.07086212, -1.992574, 1, 0.9254902, 0, 1,
-1.065089, -1.738567, -1.625319, 1, 0.9294118, 0, 1,
-1.053493, -0.5342476, -2.165874, 1, 0.9372549, 0, 1,
-1.052628, 0.711042, 1.281038, 1, 0.9411765, 0, 1,
-1.049399, 0.5555885, -1.910626, 1, 0.9490196, 0, 1,
-1.048573, 1.037946, -1.462699, 1, 0.9529412, 0, 1,
-1.048002, -1.801109, -2.87122, 1, 0.9607843, 0, 1,
-1.040497, 1.058824, -0.7507071, 1, 0.9647059, 0, 1,
-1.039015, -0.6530959, -1.009066, 1, 0.972549, 0, 1,
-1.024428, 0.5260732, -1.674024, 1, 0.9764706, 0, 1,
-1.022197, 1.315714, 0.8329768, 1, 0.9843137, 0, 1,
-1.017955, 0.09622303, -3.01555, 1, 0.9882353, 0, 1,
-1.011436, -0.6544324, -3.174269, 1, 0.9960784, 0, 1,
-1.001044, -0.1290215, -1.096922, 0.9960784, 1, 0, 1,
-0.9947411, 0.1919843, -0.9185278, 0.9921569, 1, 0, 1,
-0.9864168, 0.3105439, -0.7313722, 0.9843137, 1, 0, 1,
-0.9831746, 1.200758, -0.9495065, 0.9803922, 1, 0, 1,
-0.9792137, -0.6121321, -2.500352, 0.972549, 1, 0, 1,
-0.9749727, -0.2629968, -0.8092119, 0.9686275, 1, 0, 1,
-0.9744419, -0.4473607, -2.567696, 0.9607843, 1, 0, 1,
-0.9627783, 0.4417343, -1.701859, 0.9568627, 1, 0, 1,
-0.960052, -0.839832, -4.651501, 0.9490196, 1, 0, 1,
-0.9549065, -0.02973067, -1.653364, 0.945098, 1, 0, 1,
-0.9465157, 2.928613, -1.217362, 0.9372549, 1, 0, 1,
-0.9356592, 0.513195, -0.05835323, 0.9333333, 1, 0, 1,
-0.9323986, -1.05253, -2.431818, 0.9254902, 1, 0, 1,
-0.9256885, -0.06897707, -0.764744, 0.9215686, 1, 0, 1,
-0.9251897, -0.3408248, -2.443033, 0.9137255, 1, 0, 1,
-0.9235762, 0.5060447, -1.51746, 0.9098039, 1, 0, 1,
-0.9162145, 2.768996, 0.7077335, 0.9019608, 1, 0, 1,
-0.915614, -0.3402383, -2.262579, 0.8941177, 1, 0, 1,
-0.898536, -0.3115705, -2.360251, 0.8901961, 1, 0, 1,
-0.8963854, -0.2230277, -1.076833, 0.8823529, 1, 0, 1,
-0.8961757, -0.4953848, -1.059078, 0.8784314, 1, 0, 1,
-0.8877739, -0.5176524, -3.329895, 0.8705882, 1, 0, 1,
-0.8874323, 0.2162451, -0.5540485, 0.8666667, 1, 0, 1,
-0.8868619, 0.1823084, -1.076156, 0.8588235, 1, 0, 1,
-0.8759443, -0.8609491, -2.23438, 0.854902, 1, 0, 1,
-0.8739966, 0.72176, -2.019907, 0.8470588, 1, 0, 1,
-0.86962, 1.387877, -0.2677697, 0.8431373, 1, 0, 1,
-0.8651904, -0.04085081, -1.485441, 0.8352941, 1, 0, 1,
-0.8574166, 1.374569, -0.2354227, 0.8313726, 1, 0, 1,
-0.8447235, 0.3423322, -1.233174, 0.8235294, 1, 0, 1,
-0.8406075, -2.323267, -3.3541, 0.8196079, 1, 0, 1,
-0.8397343, 0.2125287, -1.282356, 0.8117647, 1, 0, 1,
-0.8383118, 0.2410908, -3.234953, 0.8078431, 1, 0, 1,
-0.8362346, 0.996429, -1.728682, 0.8, 1, 0, 1,
-0.8314241, -0.5124307, -0.5988371, 0.7921569, 1, 0, 1,
-0.8292009, 0.2080538, -3.491628, 0.7882353, 1, 0, 1,
-0.8243636, 0.1478389, -0.501552, 0.7803922, 1, 0, 1,
-0.8196574, -0.4495312, -0.6611397, 0.7764706, 1, 0, 1,
-0.8176724, 0.3808387, -2.205567, 0.7686275, 1, 0, 1,
-0.8172109, 0.5388736, -1.033383, 0.7647059, 1, 0, 1,
-0.8146148, 0.03205483, -3.363815, 0.7568628, 1, 0, 1,
-0.8121668, 0.4471456, -2.737603, 0.7529412, 1, 0, 1,
-0.8036379, 0.03527563, -0.2695429, 0.7450981, 1, 0, 1,
-0.7929053, 1.448905, -0.005553536, 0.7411765, 1, 0, 1,
-0.7873455, 0.7474543, -2.404472, 0.7333333, 1, 0, 1,
-0.7842007, 0.3739499, -0.7793667, 0.7294118, 1, 0, 1,
-0.7798393, 0.007917585, -0.6211105, 0.7215686, 1, 0, 1,
-0.7717142, 0.7287591, -1.258803, 0.7176471, 1, 0, 1,
-0.7677358, -0.9757987, -0.2040537, 0.7098039, 1, 0, 1,
-0.7654113, -0.1925898, -1.870502, 0.7058824, 1, 0, 1,
-0.7646219, 1.464639, -0.2024804, 0.6980392, 1, 0, 1,
-0.7607592, 1.679985, -1.509844, 0.6901961, 1, 0, 1,
-0.7547329, 1.608589, -0.3727529, 0.6862745, 1, 0, 1,
-0.7541644, -0.3552819, -0.843982, 0.6784314, 1, 0, 1,
-0.7483328, -0.1842303, -1.434352, 0.6745098, 1, 0, 1,
-0.7480238, -2.979599, -3.059017, 0.6666667, 1, 0, 1,
-0.7479828, 2.286461, -1.096103, 0.6627451, 1, 0, 1,
-0.7466068, 2.50516, -0.4279406, 0.654902, 1, 0, 1,
-0.737565, -1.727821, -2.298228, 0.6509804, 1, 0, 1,
-0.7318134, -0.5759028, -4.2396, 0.6431373, 1, 0, 1,
-0.730922, -0.9121369, -0.6348017, 0.6392157, 1, 0, 1,
-0.727111, 0.9006765, -0.517707, 0.6313726, 1, 0, 1,
-0.7270199, -1.632527, -2.93863, 0.627451, 1, 0, 1,
-0.7210499, -1.730908, -1.426585, 0.6196079, 1, 0, 1,
-0.720613, 0.1625974, -0.766012, 0.6156863, 1, 0, 1,
-0.7180032, -0.9647284, -3.603526, 0.6078432, 1, 0, 1,
-0.7170446, 0.6138887, -0.4955528, 0.6039216, 1, 0, 1,
-0.7168109, 0.1549183, -2.647375, 0.5960785, 1, 0, 1,
-0.7105829, 2.236696, -1.957194, 0.5882353, 1, 0, 1,
-0.701306, -0.9429886, -3.865426, 0.5843138, 1, 0, 1,
-0.6902527, -0.2726896, -0.1236959, 0.5764706, 1, 0, 1,
-0.6855124, -1.449338, -4.534921, 0.572549, 1, 0, 1,
-0.684988, 0.8750442, -0.6400846, 0.5647059, 1, 0, 1,
-0.6811479, 0.3215851, -0.7646394, 0.5607843, 1, 0, 1,
-0.6801782, -0.9793932, -1.979971, 0.5529412, 1, 0, 1,
-0.6796674, 0.1129436, -1.656307, 0.5490196, 1, 0, 1,
-0.6787255, 1.706019, 0.2647324, 0.5411765, 1, 0, 1,
-0.6721123, -0.3098888, -2.9692, 0.5372549, 1, 0, 1,
-0.6684477, -1.220901, -2.234601, 0.5294118, 1, 0, 1,
-0.6642056, 0.0542483, 0.6440158, 0.5254902, 1, 0, 1,
-0.6601701, -1.227737, -0.7965311, 0.5176471, 1, 0, 1,
-0.6600925, 1.340038, -0.6726322, 0.5137255, 1, 0, 1,
-0.654469, 1.22765, -0.7284534, 0.5058824, 1, 0, 1,
-0.6538146, -0.8754189, -2.081627, 0.5019608, 1, 0, 1,
-0.6518919, -1.385935, -2.911003, 0.4941176, 1, 0, 1,
-0.6518398, -0.4321141, -2.833834, 0.4862745, 1, 0, 1,
-0.6455604, -0.8326916, -2.214296, 0.4823529, 1, 0, 1,
-0.6450396, 1.106769, -1.707239, 0.4745098, 1, 0, 1,
-0.6432108, -0.7671168, -1.390345, 0.4705882, 1, 0, 1,
-0.6422053, 0.9252914, -0.1448097, 0.4627451, 1, 0, 1,
-0.6390598, -1.86673, -3.063486, 0.4588235, 1, 0, 1,
-0.6377923, 0.3532811, -0.9317688, 0.4509804, 1, 0, 1,
-0.6363119, 0.555342, -1.477414, 0.4470588, 1, 0, 1,
-0.6350002, 0.8087168, -0.8026767, 0.4392157, 1, 0, 1,
-0.633193, 0.8818626, -2.506632, 0.4352941, 1, 0, 1,
-0.6285702, -0.7412154, -3.09611, 0.427451, 1, 0, 1,
-0.6266456, -2.488037, -1.47884, 0.4235294, 1, 0, 1,
-0.6245695, -0.3596393, -4.016356, 0.4156863, 1, 0, 1,
-0.6220753, -1.50373, -1.239292, 0.4117647, 1, 0, 1,
-0.618038, -0.3467522, -1.062555, 0.4039216, 1, 0, 1,
-0.6075825, -0.06897147, -1.400947, 0.3960784, 1, 0, 1,
-0.6042811, -1.566223, -3.969303, 0.3921569, 1, 0, 1,
-0.6012675, 0.8431252, -1.03521, 0.3843137, 1, 0, 1,
-0.6008811, -0.4841144, -3.116227, 0.3803922, 1, 0, 1,
-0.6006144, 2.374315, -0.1538614, 0.372549, 1, 0, 1,
-0.5999194, -0.636394, -2.368776, 0.3686275, 1, 0, 1,
-0.5941513, -0.4353334, -1.952723, 0.3607843, 1, 0, 1,
-0.592595, -2.695693, -3.547233, 0.3568628, 1, 0, 1,
-0.5916582, 0.7620498, -0.4497258, 0.3490196, 1, 0, 1,
-0.5906846, -0.4991014, -0.8580484, 0.345098, 1, 0, 1,
-0.5902444, -0.3695018, -2.370295, 0.3372549, 1, 0, 1,
-0.5872501, -0.5522949, -1.403251, 0.3333333, 1, 0, 1,
-0.5860776, 0.5160115, -3.310158, 0.3254902, 1, 0, 1,
-0.5838383, 1.918584, -0.4621419, 0.3215686, 1, 0, 1,
-0.5744382, 0.2829616, -1.895557, 0.3137255, 1, 0, 1,
-0.5686711, -1.239482, -2.247015, 0.3098039, 1, 0, 1,
-0.5672531, -2.112457, -2.514782, 0.3019608, 1, 0, 1,
-0.563579, -0.696909, -0.03324691, 0.2941177, 1, 0, 1,
-0.5575786, 1.109605, -0.8778044, 0.2901961, 1, 0, 1,
-0.5477768, -0.5857156, -1.286663, 0.282353, 1, 0, 1,
-0.5458128, 0.2630109, -1.907475, 0.2784314, 1, 0, 1,
-0.537057, -0.9458303, -2.460163, 0.2705882, 1, 0, 1,
-0.5302762, 1.125993, -0.6841709, 0.2666667, 1, 0, 1,
-0.5286658, 0.02423118, -1.360424, 0.2588235, 1, 0, 1,
-0.5236492, -0.3292227, -1.649832, 0.254902, 1, 0, 1,
-0.5231865, 1.373796, -1.852937, 0.2470588, 1, 0, 1,
-0.5171417, -0.2205547, -3.117258, 0.2431373, 1, 0, 1,
-0.5170181, 0.248385, -1.520487, 0.2352941, 1, 0, 1,
-0.5167429, -0.4136424, -3.638075, 0.2313726, 1, 0, 1,
-0.5138629, 1.08863, 0.8055362, 0.2235294, 1, 0, 1,
-0.5114389, -1.084683, -2.095066, 0.2196078, 1, 0, 1,
-0.5095087, -0.6321733, -2.032548, 0.2117647, 1, 0, 1,
-0.5048084, -0.6865548, -2.488884, 0.2078431, 1, 0, 1,
-0.4913757, 1.113263, -0.3512107, 0.2, 1, 0, 1,
-0.4892493, -1.205651, -0.7359225, 0.1921569, 1, 0, 1,
-0.488855, -0.2803313, -2.52575, 0.1882353, 1, 0, 1,
-0.4858962, -0.6271275, -3.072028, 0.1803922, 1, 0, 1,
-0.482933, 0.5192906, -1.308918, 0.1764706, 1, 0, 1,
-0.4825536, 1.042519, -0.6282127, 0.1686275, 1, 0, 1,
-0.4753168, -0.1366237, -3.228276, 0.1647059, 1, 0, 1,
-0.4710516, -0.7253485, -3.66329, 0.1568628, 1, 0, 1,
-0.4690486, -0.3384096, -2.745458, 0.1529412, 1, 0, 1,
-0.4623004, 0.3422938, -0.6601574, 0.145098, 1, 0, 1,
-0.4622564, -0.3293021, -0.1876512, 0.1411765, 1, 0, 1,
-0.4588177, 1.298689, -0.8166348, 0.1333333, 1, 0, 1,
-0.4558513, -0.08734959, -3.432717, 0.1294118, 1, 0, 1,
-0.4539505, -0.7863111, -0.06982215, 0.1215686, 1, 0, 1,
-0.4535889, -1.090604, -2.568241, 0.1176471, 1, 0, 1,
-0.4500514, 0.05746689, -3.447592, 0.1098039, 1, 0, 1,
-0.4478366, 1.8662, -1.05826, 0.1058824, 1, 0, 1,
-0.4465168, 0.01961042, -3.512182, 0.09803922, 1, 0, 1,
-0.4419733, -0.2874235, -1.293854, 0.09019608, 1, 0, 1,
-0.4408733, 1.521685, -0.01379042, 0.08627451, 1, 0, 1,
-0.439083, -0.4879775, -4.057823, 0.07843138, 1, 0, 1,
-0.4317247, 0.3290998, -1.204357, 0.07450981, 1, 0, 1,
-0.4314222, -1.190251, -4.492302, 0.06666667, 1, 0, 1,
-0.4256606, -0.3397503, -3.66394, 0.0627451, 1, 0, 1,
-0.420781, 0.6987977, 0.5286382, 0.05490196, 1, 0, 1,
-0.4145994, -0.3211386, -3.670285, 0.05098039, 1, 0, 1,
-0.4101355, -0.1700513, -2.836315, 0.04313726, 1, 0, 1,
-0.409964, -0.7616989, -1.99948, 0.03921569, 1, 0, 1,
-0.4096605, 0.06641164, -3.297826, 0.03137255, 1, 0, 1,
-0.4027001, -1.133718, -2.01153, 0.02745098, 1, 0, 1,
-0.3993268, -0.9930788, -1.715688, 0.01960784, 1, 0, 1,
-0.3979256, -0.2468468, -2.379467, 0.01568628, 1, 0, 1,
-0.3943861, -1.134538, -2.882059, 0.007843138, 1, 0, 1,
-0.3928101, 2.379582, 0.7459524, 0.003921569, 1, 0, 1,
-0.3911195, 1.126311, -0.3729236, 0, 1, 0.003921569, 1,
-0.3884797, -0.8152767, -1.021965, 0, 1, 0.01176471, 1,
-0.385388, 0.6319458, -2.203229, 0, 1, 0.01568628, 1,
-0.3843696, 1.396921, -1.009201, 0, 1, 0.02352941, 1,
-0.3842795, 1.290079, -0.01036658, 0, 1, 0.02745098, 1,
-0.3751527, -1.404918, -2.594422, 0, 1, 0.03529412, 1,
-0.3660488, -0.6170911, -3.752464, 0, 1, 0.03921569, 1,
-0.3657512, -0.1737936, -2.568954, 0, 1, 0.04705882, 1,
-0.3644667, 0.815627, 0.102925, 0, 1, 0.05098039, 1,
-0.3544926, -0.9801923, -2.90934, 0, 1, 0.05882353, 1,
-0.3536201, -0.1602291, -3.107752, 0, 1, 0.0627451, 1,
-0.3525237, 0.7727304, -0.8842105, 0, 1, 0.07058824, 1,
-0.3525142, -0.1523685, -2.007174, 0, 1, 0.07450981, 1,
-0.3525063, -1.064854, -3.146041, 0, 1, 0.08235294, 1,
-0.3517309, -1.044197, -4.168337, 0, 1, 0.08627451, 1,
-0.3509396, 1.724651, 0.02060365, 0, 1, 0.09411765, 1,
-0.3500605, 0.4099297, -0.9215072, 0, 1, 0.1019608, 1,
-0.34707, -1.293647, -3.705515, 0, 1, 0.1058824, 1,
-0.3440983, 1.419758, -0.8384342, 0, 1, 0.1137255, 1,
-0.3435134, 0.9908367, 1.505789, 0, 1, 0.1176471, 1,
-0.342004, -1.271077, -3.44834, 0, 1, 0.1254902, 1,
-0.3386692, -0.01948731, -2.774589, 0, 1, 0.1294118, 1,
-0.3385781, -0.7641045, -2.405269, 0, 1, 0.1372549, 1,
-0.336474, 0.7274641, -0.6936164, 0, 1, 0.1411765, 1,
-0.3310246, 0.6356992, 0.009934923, 0, 1, 0.1490196, 1,
-0.3266606, 0.0521353, -1.619653, 0, 1, 0.1529412, 1,
-0.3241403, 0.455736, -0.4964592, 0, 1, 0.1607843, 1,
-0.3178014, 0.7631171, -1.414564, 0, 1, 0.1647059, 1,
-0.314145, -1.062481, -2.594761, 0, 1, 0.172549, 1,
-0.3139705, -1.643416, -2.401612, 0, 1, 0.1764706, 1,
-0.3120563, -1.408023, -3.95903, 0, 1, 0.1843137, 1,
-0.309046, -1.425807, -3.703379, 0, 1, 0.1882353, 1,
-0.3043347, 1.590313, 1.695296, 0, 1, 0.1960784, 1,
-0.3039528, 0.6969653, 1.017823, 0, 1, 0.2039216, 1,
-0.2974804, -0.922103, -2.023165, 0, 1, 0.2078431, 1,
-0.2971694, 1.13159, -0.6702961, 0, 1, 0.2156863, 1,
-0.2927657, 2.466097, -0.6627448, 0, 1, 0.2196078, 1,
-0.2922987, -0.3422969, -2.543813, 0, 1, 0.227451, 1,
-0.290213, 0.3603151, -0.9753273, 0, 1, 0.2313726, 1,
-0.2899013, -0.2074529, -1.962662, 0, 1, 0.2392157, 1,
-0.2822062, 1.369717, -0.9168889, 0, 1, 0.2431373, 1,
-0.276805, 1.381407, -0.320004, 0, 1, 0.2509804, 1,
-0.2735636, 1.408251, -0.9196259, 0, 1, 0.254902, 1,
-0.2729909, -0.4320142, -2.556144, 0, 1, 0.2627451, 1,
-0.2710655, 1.507126, -0.6256391, 0, 1, 0.2666667, 1,
-0.2685849, 0.5052935, 0.4332125, 0, 1, 0.2745098, 1,
-0.2658823, 1.18247, 1.376229, 0, 1, 0.2784314, 1,
-0.2640422, -2.042126, -2.341691, 0, 1, 0.2862745, 1,
-0.2625813, 0.3911231, -1.726581, 0, 1, 0.2901961, 1,
-0.2610449, 0.4432367, -0.9821541, 0, 1, 0.2980392, 1,
-0.2600698, -1.953129, -2.639673, 0, 1, 0.3058824, 1,
-0.2594255, -0.008309201, -0.7115669, 0, 1, 0.3098039, 1,
-0.2586932, -0.07659264, -3.272834, 0, 1, 0.3176471, 1,
-0.2584855, -0.5037662, -3.428314, 0, 1, 0.3215686, 1,
-0.2525993, 0.462993, 0.09027296, 0, 1, 0.3294118, 1,
-0.2387356, 0.7880925, -2.221575, 0, 1, 0.3333333, 1,
-0.2362896, 0.3989074, 0.6315337, 0, 1, 0.3411765, 1,
-0.2304767, -1.281958, -4.061454, 0, 1, 0.345098, 1,
-0.2303551, 0.6022511, -0.1812428, 0, 1, 0.3529412, 1,
-0.2239144, -0.5353363, -2.815285, 0, 1, 0.3568628, 1,
-0.2226947, -0.3595696, -2.935866, 0, 1, 0.3647059, 1,
-0.2218549, -0.7406138, -3.414919, 0, 1, 0.3686275, 1,
-0.2215595, -0.516664, -3.000576, 0, 1, 0.3764706, 1,
-0.2176081, 0.5316034, -1.097602, 0, 1, 0.3803922, 1,
-0.2148187, -0.6322085, -2.012256, 0, 1, 0.3882353, 1,
-0.2118431, 0.8864558, -0.5762213, 0, 1, 0.3921569, 1,
-0.2094353, 0.4816497, -2.017188, 0, 1, 0.4, 1,
-0.2089804, -1.022202, -1.974204, 0, 1, 0.4078431, 1,
-0.208448, 0.1580977, 1.094868, 0, 1, 0.4117647, 1,
-0.198036, 0.3539162, -1.006269, 0, 1, 0.4196078, 1,
-0.1951602, -0.979547, -2.885541, 0, 1, 0.4235294, 1,
-0.194757, 1.330607, -1.195118, 0, 1, 0.4313726, 1,
-0.194624, 0.5521064, 0.1733332, 0, 1, 0.4352941, 1,
-0.1796456, 0.7881137, -1.710901, 0, 1, 0.4431373, 1,
-0.1783812, -0.6021162, -1.679644, 0, 1, 0.4470588, 1,
-0.1773184, 0.1118648, -3.385321, 0, 1, 0.454902, 1,
-0.1773047, -0.05501585, -1.565579, 0, 1, 0.4588235, 1,
-0.1762366, -0.653909, -1.965099, 0, 1, 0.4666667, 1,
-0.1749852, 1.375324, 1.397149, 0, 1, 0.4705882, 1,
-0.1722321, -0.02578005, -2.853887, 0, 1, 0.4784314, 1,
-0.1721378, -2.631585, -2.666094, 0, 1, 0.4823529, 1,
-0.1690033, -0.7047336, -3.69912, 0, 1, 0.4901961, 1,
-0.1651584, 0.4986901, 1.313428, 0, 1, 0.4941176, 1,
-0.161081, 0.4157183, -0.7840311, 0, 1, 0.5019608, 1,
-0.1579225, 0.1578934, -0.1831238, 0, 1, 0.509804, 1,
-0.1567965, -1.241156, -3.031687, 0, 1, 0.5137255, 1,
-0.1552346, 2.603555, 0.4713728, 0, 1, 0.5215687, 1,
-0.1516882, 1.081859, -1.869185, 0, 1, 0.5254902, 1,
-0.1505097, 0.1627346, 1.873655, 0, 1, 0.5333334, 1,
-0.1466396, -1.108776, -3.387861, 0, 1, 0.5372549, 1,
-0.1417064, 0.3499244, -2.321033, 0, 1, 0.5450981, 1,
-0.1414514, 0.464234, 0.3802683, 0, 1, 0.5490196, 1,
-0.1403001, 0.5088262, 1.52193, 0, 1, 0.5568628, 1,
-0.1380427, -0.1670405, -3.68844, 0, 1, 0.5607843, 1,
-0.1324071, 0.004922079, -1.004047, 0, 1, 0.5686275, 1,
-0.1309628, -0.2890288, -2.262667, 0, 1, 0.572549, 1,
-0.125839, 0.6607038, -0.648484, 0, 1, 0.5803922, 1,
-0.1255161, -1.488153, -0.8327682, 0, 1, 0.5843138, 1,
-0.1182217, -0.9354565, -1.992486, 0, 1, 0.5921569, 1,
-0.1169614, 2.552724, -0.02661575, 0, 1, 0.5960785, 1,
-0.1160038, -0.9614052, -2.32319, 0, 1, 0.6039216, 1,
-0.1138462, -0.8054771, -3.482116, 0, 1, 0.6117647, 1,
-0.1111852, 0.3024789, 0.8399424, 0, 1, 0.6156863, 1,
-0.1060372, 0.272045, 0.1267625, 0, 1, 0.6235294, 1,
-0.1038816, 0.2165031, 1.264932, 0, 1, 0.627451, 1,
-0.1022309, 0.1785067, 0.04733525, 0, 1, 0.6352941, 1,
-0.1013853, -0.5025738, -3.278212, 0, 1, 0.6392157, 1,
-0.1011681, 0.1509558, -1.374306, 0, 1, 0.6470588, 1,
-0.0995734, -0.3914517, -2.344415, 0, 1, 0.6509804, 1,
-0.09095198, -0.2086773, -2.835182, 0, 1, 0.6588235, 1,
-0.08942077, 0.7330469, 0.9349679, 0, 1, 0.6627451, 1,
-0.0842944, -0.208723, -1.732024, 0, 1, 0.6705883, 1,
-0.0813894, -1.01961, -3.190023, 0, 1, 0.6745098, 1,
-0.07539253, 0.4517974, 0.5553244, 0, 1, 0.682353, 1,
-0.071982, -1.767618, -2.166475, 0, 1, 0.6862745, 1,
-0.06767882, -1.215921, -2.417661, 0, 1, 0.6941177, 1,
-0.06216178, -0.8791629, -3.533063, 0, 1, 0.7019608, 1,
-0.06168219, 0.4521343, 2.129504, 0, 1, 0.7058824, 1,
-0.06066383, 0.2218379, -1.150229, 0, 1, 0.7137255, 1,
-0.06035964, -0.1080989, -3.8505, 0, 1, 0.7176471, 1,
-0.05792909, -1.136305, -2.874846, 0, 1, 0.7254902, 1,
-0.05509604, 1.063153, 0.1040887, 0, 1, 0.7294118, 1,
-0.05297137, -0.8975765, -1.90129, 0, 1, 0.7372549, 1,
-0.05046176, -0.0459904, -1.370304, 0, 1, 0.7411765, 1,
-0.0496157, -0.08571003, -2.743748, 0, 1, 0.7490196, 1,
-0.04874191, 0.805004, 0.4681987, 0, 1, 0.7529412, 1,
-0.0450718, -0.9235851, -3.383013, 0, 1, 0.7607843, 1,
-0.04386639, -0.8856814, -1.670829, 0, 1, 0.7647059, 1,
-0.04312987, 1.299182, -0.3192649, 0, 1, 0.772549, 1,
-0.04310394, 1.600118, 0.6193501, 0, 1, 0.7764706, 1,
-0.0415904, 0.5997974, 1.449014, 0, 1, 0.7843137, 1,
-0.04104211, 1.308987, -1.029059, 0, 1, 0.7882353, 1,
-0.04090781, -0.2461172, -2.993524, 0, 1, 0.7960784, 1,
-0.03977833, 0.8144216, 0.1614945, 0, 1, 0.8039216, 1,
-0.03167894, 2.006308, -0.593912, 0, 1, 0.8078431, 1,
-0.03136873, -0.670943, -1.754331, 0, 1, 0.8156863, 1,
-0.03002243, -0.162167, -1.548684, 0, 1, 0.8196079, 1,
-0.02536053, -1.654772, -2.792983, 0, 1, 0.827451, 1,
-0.01828161, -0.6338396, -3.115621, 0, 1, 0.8313726, 1,
-0.01723878, 1.068998, -1.278134, 0, 1, 0.8392157, 1,
-0.01598089, 0.3460593, -1.184626, 0, 1, 0.8431373, 1,
-0.01283368, -0.9341107, -3.353737, 0, 1, 0.8509804, 1,
-0.009153593, -1.5062, -3.935271, 0, 1, 0.854902, 1,
-0.007611284, 0.8088127, -0.4748129, 0, 1, 0.8627451, 1,
-0.002922539, 0.1808732, -0.377291, 0, 1, 0.8666667, 1,
-0.002125073, -0.2701044, -3.121883, 0, 1, 0.8745098, 1,
0.006768842, -0.003498925, 2.699652, 0, 1, 0.8784314, 1,
0.007276417, 0.2565046, -0.7036527, 0, 1, 0.8862745, 1,
0.00743832, -1.038103, 1.826252, 0, 1, 0.8901961, 1,
0.007856818, -0.2067788, 0.7336022, 0, 1, 0.8980392, 1,
0.008105963, -0.4048459, 3.689511, 0, 1, 0.9058824, 1,
0.008201739, -1.290727, 1.505906, 0, 1, 0.9098039, 1,
0.008990574, 0.85689, -1.005762, 0, 1, 0.9176471, 1,
0.0115109, 1.071685, 0.7019628, 0, 1, 0.9215686, 1,
0.01418433, -0.06557968, 3.514865, 0, 1, 0.9294118, 1,
0.01544794, 0.1808578, 0.06557183, 0, 1, 0.9333333, 1,
0.01872336, 1.309621, -0.4664891, 0, 1, 0.9411765, 1,
0.02041221, -0.5528528, 3.924971, 0, 1, 0.945098, 1,
0.0226322, -0.3821517, 4.335418, 0, 1, 0.9529412, 1,
0.02325913, -0.8485, 3.35563, 0, 1, 0.9568627, 1,
0.02616694, -0.5259952, 5.474905, 0, 1, 0.9647059, 1,
0.02794587, 0.0631192, -0.3014579, 0, 1, 0.9686275, 1,
0.02875376, 1.274909, 1.399363, 0, 1, 0.9764706, 1,
0.0343484, 0.6759657, -2.259171, 0, 1, 0.9803922, 1,
0.03671711, -0.05900899, 3.10446, 0, 1, 0.9882353, 1,
0.03843393, 0.5827417, -1.989461, 0, 1, 0.9921569, 1,
0.04197995, 0.7862855, 1.386911, 0, 1, 1, 1,
0.04320321, 0.4700007, 0.207306, 0, 0.9921569, 1, 1,
0.04485584, -1.42098, 4.325779, 0, 0.9882353, 1, 1,
0.04559603, 0.8376917, -0.9759018, 0, 0.9803922, 1, 1,
0.04574661, 0.05838197, 0.8128775, 0, 0.9764706, 1, 1,
0.05217306, -0.6179529, 3.625868, 0, 0.9686275, 1, 1,
0.05438383, 2.191863, 0.3848804, 0, 0.9647059, 1, 1,
0.062585, -0.8703524, 2.249059, 0, 0.9568627, 1, 1,
0.06362127, 0.3943242, -2.362174, 0, 0.9529412, 1, 1,
0.06568427, -1.133257, 2.748501, 0, 0.945098, 1, 1,
0.06628235, 0.6676357, 1.43676, 0, 0.9411765, 1, 1,
0.06857388, 1.094735, 0.1749469, 0, 0.9333333, 1, 1,
0.07017763, -1.009531, 2.950896, 0, 0.9294118, 1, 1,
0.07087131, 0.03300181, 0.4789916, 0, 0.9215686, 1, 1,
0.07214256, -1.352076, 2.350008, 0, 0.9176471, 1, 1,
0.07282406, 0.08087788, 1.866175, 0, 0.9098039, 1, 1,
0.07552695, 1.267877, 0.8784802, 0, 0.9058824, 1, 1,
0.07754989, 0.2790202, -0.03779842, 0, 0.8980392, 1, 1,
0.08386996, -1.145048, 2.631387, 0, 0.8901961, 1, 1,
0.08453154, -1.052265, 4.228721, 0, 0.8862745, 1, 1,
0.08588637, 0.5399861, -0.4329655, 0, 0.8784314, 1, 1,
0.0926043, -1.054972, 3.06877, 0, 0.8745098, 1, 1,
0.09289162, -0.1550589, 1.798064, 0, 0.8666667, 1, 1,
0.09456368, -0.006943212, 1.716198, 0, 0.8627451, 1, 1,
0.09993605, 0.114009, -0.02848415, 0, 0.854902, 1, 1,
0.1033681, -0.5578051, 2.192072, 0, 0.8509804, 1, 1,
0.1045341, -1.091007, 2.753002, 0, 0.8431373, 1, 1,
0.1053539, 0.3682332, -0.07636204, 0, 0.8392157, 1, 1,
0.106743, -0.1563088, 1.437739, 0, 0.8313726, 1, 1,
0.1077639, -1.008704, 5.044211, 0, 0.827451, 1, 1,
0.1106097, 1.925314, 0.7736632, 0, 0.8196079, 1, 1,
0.1169264, -1.188627, 2.783453, 0, 0.8156863, 1, 1,
0.123852, -0.5301089, 4.170903, 0, 0.8078431, 1, 1,
0.1251415, -0.7068213, 2.087725, 0, 0.8039216, 1, 1,
0.1255247, -0.8330273, 5.353281, 0, 0.7960784, 1, 1,
0.1259637, -0.05651994, 1.490527, 0, 0.7882353, 1, 1,
0.129591, -1.73754, 3.50235, 0, 0.7843137, 1, 1,
0.14227, -0.2115847, 2.247267, 0, 0.7764706, 1, 1,
0.1429826, 0.4070768, 1.040196, 0, 0.772549, 1, 1,
0.1432067, -0.3314211, 3.244484, 0, 0.7647059, 1, 1,
0.1454405, -0.09476924, 2.096565, 0, 0.7607843, 1, 1,
0.1468611, 0.04963779, 0.8419532, 0, 0.7529412, 1, 1,
0.1472135, 0.2741203, 2.556344, 0, 0.7490196, 1, 1,
0.1487738, -1.28126, 3.259406, 0, 0.7411765, 1, 1,
0.1502059, 1.268271, 1.863023, 0, 0.7372549, 1, 1,
0.1524031, -0.773353, 3.16243, 0, 0.7294118, 1, 1,
0.1528322, -0.2727631, 2.640598, 0, 0.7254902, 1, 1,
0.1575919, -1.238093, 2.113922, 0, 0.7176471, 1, 1,
0.1576119, -1.458674, 2.757155, 0, 0.7137255, 1, 1,
0.1613629, -1.005386, 3.474011, 0, 0.7058824, 1, 1,
0.1625844, 0.7189896, -0.3755808, 0, 0.6980392, 1, 1,
0.1637755, -0.8406166, 4.248215, 0, 0.6941177, 1, 1,
0.166923, 0.3496903, -0.2055274, 0, 0.6862745, 1, 1,
0.1717052, -0.4060282, 3.849879, 0, 0.682353, 1, 1,
0.1757656, 1.738671, 0.08066819, 0, 0.6745098, 1, 1,
0.1768554, 0.2681662, -0.3083513, 0, 0.6705883, 1, 1,
0.1805313, -1.678493, 3.344456, 0, 0.6627451, 1, 1,
0.1842083, -0.9011589, 2.363375, 0, 0.6588235, 1, 1,
0.1904174, 1.975011, 0.6073493, 0, 0.6509804, 1, 1,
0.2000899, 1.594934, -2.339815, 0, 0.6470588, 1, 1,
0.2001321, -1.241092, 3.435684, 0, 0.6392157, 1, 1,
0.2008173, 0.1488889, 1.888179, 0, 0.6352941, 1, 1,
0.2094998, -0.09207863, 2.237946, 0, 0.627451, 1, 1,
0.2107906, 0.1539184, 1.753851, 0, 0.6235294, 1, 1,
0.2125659, -1.85399, 4.701823, 0, 0.6156863, 1, 1,
0.2136712, -0.6607506, 3.267713, 0, 0.6117647, 1, 1,
0.2143476, 1.405946, 1.003227, 0, 0.6039216, 1, 1,
0.2174156, 0.5477456, -0.6932445, 0, 0.5960785, 1, 1,
0.219718, -1.116652, 3.793648, 0, 0.5921569, 1, 1,
0.2200888, -0.4183706, 1.945049, 0, 0.5843138, 1, 1,
0.2212873, -1.038211, 1.762381, 0, 0.5803922, 1, 1,
0.2234336, 2.224561, 2.082498, 0, 0.572549, 1, 1,
0.2265283, 0.08533988, 0.9511014, 0, 0.5686275, 1, 1,
0.226668, 0.2893683, 0.6584216, 0, 0.5607843, 1, 1,
0.2270981, -0.7030096, 2.871047, 0, 0.5568628, 1, 1,
0.2288549, 0.2237903, 2.2908, 0, 0.5490196, 1, 1,
0.2310857, 1.377264, -0.6796241, 0, 0.5450981, 1, 1,
0.2338, 1.317186, -0.5681718, 0, 0.5372549, 1, 1,
0.2356703, -0.8642653, 4.055898, 0, 0.5333334, 1, 1,
0.238727, -1.296587, 3.020692, 0, 0.5254902, 1, 1,
0.2388723, 0.9288286, 0.03587342, 0, 0.5215687, 1, 1,
0.2429103, 0.8805928, 1.301125, 0, 0.5137255, 1, 1,
0.2464828, -2.486983, 1.285101, 0, 0.509804, 1, 1,
0.247951, 0.2659113, 0.9415106, 0, 0.5019608, 1, 1,
0.2497944, -1.202157, 2.649421, 0, 0.4941176, 1, 1,
0.2531765, 1.405606, 0.6197292, 0, 0.4901961, 1, 1,
0.2537586, -0.2432275, 1.703876, 0, 0.4823529, 1, 1,
0.2549323, 0.03520811, 1.074452, 0, 0.4784314, 1, 1,
0.2587855, -1.881887, 0.8137654, 0, 0.4705882, 1, 1,
0.2597435, -0.08320092, 1.301568, 0, 0.4666667, 1, 1,
0.2649868, -1.053421, 4.388818, 0, 0.4588235, 1, 1,
0.2654836, -0.1566008, 3.033314, 0, 0.454902, 1, 1,
0.2667294, 0.3221672, 1.037739, 0, 0.4470588, 1, 1,
0.2684375, 1.026423, 0.7697278, 0, 0.4431373, 1, 1,
0.2727841, -0.2760421, 3.346797, 0, 0.4352941, 1, 1,
0.2741265, 0.1119323, 0.2567235, 0, 0.4313726, 1, 1,
0.2757146, -0.9401934, 3.889755, 0, 0.4235294, 1, 1,
0.2761252, -0.3115457, 3.527894, 0, 0.4196078, 1, 1,
0.2801583, 0.04312813, 0.2524702, 0, 0.4117647, 1, 1,
0.2827923, -0.5498865, 2.325498, 0, 0.4078431, 1, 1,
0.2882698, -0.756263, 3.322926, 0, 0.4, 1, 1,
0.2883633, -0.8761063, 2.558149, 0, 0.3921569, 1, 1,
0.2925763, 1.675448, -0.399543, 0, 0.3882353, 1, 1,
0.2954361, -0.5210185, 1.937558, 0, 0.3803922, 1, 1,
0.2969051, -0.3078514, 1.554094, 0, 0.3764706, 1, 1,
0.2970114, 0.6887751, -0.1487844, 0, 0.3686275, 1, 1,
0.2992774, 0.0997021, 1.354691, 0, 0.3647059, 1, 1,
0.3022566, 0.9594517, -1.040379, 0, 0.3568628, 1, 1,
0.3062388, 0.4820763, -1.287168, 0, 0.3529412, 1, 1,
0.3063115, 0.4186896, 2.453806, 0, 0.345098, 1, 1,
0.3080837, 0.09256229, 0.8145785, 0, 0.3411765, 1, 1,
0.3163823, -0.6712534, 1.064258, 0, 0.3333333, 1, 1,
0.3235358, 0.1122846, 0.8817811, 0, 0.3294118, 1, 1,
0.3238815, 0.7612902, 0.3597832, 0, 0.3215686, 1, 1,
0.3240383, -0.07591121, 2.210514, 0, 0.3176471, 1, 1,
0.3290858, 1.439154, 0.3136731, 0, 0.3098039, 1, 1,
0.335364, -0.9984065, 3.659696, 0, 0.3058824, 1, 1,
0.3398606, -1.405845, 3.337056, 0, 0.2980392, 1, 1,
0.3400265, 0.8820151, 1.343317, 0, 0.2901961, 1, 1,
0.3436545, -1.086362, 1.913647, 0, 0.2862745, 1, 1,
0.34416, -0.01210032, 2.013417, 0, 0.2784314, 1, 1,
0.3470322, -0.456225, 2.33359, 0, 0.2745098, 1, 1,
0.3475717, -0.6459988, 3.936426, 0, 0.2666667, 1, 1,
0.3555505, 0.1739513, 0.01669522, 0, 0.2627451, 1, 1,
0.3555672, -0.264139, 1.873926, 0, 0.254902, 1, 1,
0.3565209, -0.5650858, 2.160797, 0, 0.2509804, 1, 1,
0.3606437, -0.3282068, 2.399179, 0, 0.2431373, 1, 1,
0.3656514, 0.5962111, -0.6958297, 0, 0.2392157, 1, 1,
0.3663927, -0.188854, 1.338538, 0, 0.2313726, 1, 1,
0.369672, -2.0981, 1.951332, 0, 0.227451, 1, 1,
0.3718384, 2.49865, 0.8313557, 0, 0.2196078, 1, 1,
0.3723255, 0.3758408, 0.1097563, 0, 0.2156863, 1, 1,
0.3730446, -1.787949, 3.099529, 0, 0.2078431, 1, 1,
0.3783778, 0.3632984, 3.34112, 0, 0.2039216, 1, 1,
0.3798345, 0.329558, -0.615419, 0, 0.1960784, 1, 1,
0.3803223, 0.8887002, 0.5765042, 0, 0.1882353, 1, 1,
0.3835316, 0.6939816, -1.415742, 0, 0.1843137, 1, 1,
0.3840984, 1.272009, 1.098138, 0, 0.1764706, 1, 1,
0.3852871, -0.2513636, 1.418371, 0, 0.172549, 1, 1,
0.3880183, 0.8161637, 2.062054, 0, 0.1647059, 1, 1,
0.3915427, -0.0954434, 1.751006, 0, 0.1607843, 1, 1,
0.3943001, -0.05246001, 2.403584, 0, 0.1529412, 1, 1,
0.3949209, 2.229952, 0.4599705, 0, 0.1490196, 1, 1,
0.3977859, -0.3371415, 0.9046409, 0, 0.1411765, 1, 1,
0.398938, -0.3690579, 3.462898, 0, 0.1372549, 1, 1,
0.404294, 1.700881, 2.181295, 0, 0.1294118, 1, 1,
0.4074182, 0.4109882, 1.698281, 0, 0.1254902, 1, 1,
0.4126336, -1.280634, 1.410665, 0, 0.1176471, 1, 1,
0.4205368, 1.285409, 0.8904876, 0, 0.1137255, 1, 1,
0.4211145, -0.7171773, 4.260959, 0, 0.1058824, 1, 1,
0.4221793, -0.4295885, 1.16631, 0, 0.09803922, 1, 1,
0.4275246, -1.373234, 3.19372, 0, 0.09411765, 1, 1,
0.4283208, 0.787426, 0.223044, 0, 0.08627451, 1, 1,
0.4302924, 0.09537122, 0.5159012, 0, 0.08235294, 1, 1,
0.4307946, -0.6833376, 3.109947, 0, 0.07450981, 1, 1,
0.4313953, -0.2418662, 3.310822, 0, 0.07058824, 1, 1,
0.4321943, -0.2239254, 2.310323, 0, 0.0627451, 1, 1,
0.4350093, 0.3191991, -0.4476572, 0, 0.05882353, 1, 1,
0.4433102, -0.8976467, 1.543473, 0, 0.05098039, 1, 1,
0.4453993, 0.4837225, 0.9513953, 0, 0.04705882, 1, 1,
0.4466025, 1.353993, 0.2634181, 0, 0.03921569, 1, 1,
0.4466436, -1.298123, 5.721598, 0, 0.03529412, 1, 1,
0.4500094, 1.688699, -1.870445, 0, 0.02745098, 1, 1,
0.4537619, -0.1918995, 0.9638513, 0, 0.02352941, 1, 1,
0.4539633, 0.8197914, -0.2829712, 0, 0.01568628, 1, 1,
0.4543048, -0.07640968, 1.165658, 0, 0.01176471, 1, 1,
0.4561058, -0.02149483, 2.24542, 0, 0.003921569, 1, 1,
0.4653696, 0.770117, 0.9390072, 0.003921569, 0, 1, 1,
0.4678544, 0.4408647, 0.2655672, 0.007843138, 0, 1, 1,
0.4682252, 0.2421072, 1.48112, 0.01568628, 0, 1, 1,
0.4688211, -0.7543721, 3.385493, 0.01960784, 0, 1, 1,
0.4708529, 0.06870126, 1.068602, 0.02745098, 0, 1, 1,
0.4754598, -0.4927529, 2.878836, 0.03137255, 0, 1, 1,
0.4764577, 1.270995, 0.0220712, 0.03921569, 0, 1, 1,
0.4769184, 0.1476738, 1.821471, 0.04313726, 0, 1, 1,
0.477373, -0.2174016, 1.28558, 0.05098039, 0, 1, 1,
0.4833432, 2.395067, -0.4161774, 0.05490196, 0, 1, 1,
0.4862202, -1.929234, 3.439754, 0.0627451, 0, 1, 1,
0.4866539, 1.590047, 0.317453, 0.06666667, 0, 1, 1,
0.4876294, -1.078994, 2.978048, 0.07450981, 0, 1, 1,
0.4887153, -0.2451913, 0.7563327, 0.07843138, 0, 1, 1,
0.491634, -0.1174822, 1.528383, 0.08627451, 0, 1, 1,
0.4917675, -0.8549005, 4.716876, 0.09019608, 0, 1, 1,
0.4954211, -0.02270681, 1.123412, 0.09803922, 0, 1, 1,
0.4964274, -2.401561, 2.680739, 0.1058824, 0, 1, 1,
0.5045763, -0.1156771, 1.423273, 0.1098039, 0, 1, 1,
0.5071017, -0.1398698, 4.72475, 0.1176471, 0, 1, 1,
0.5135927, -0.871605, 1.061897, 0.1215686, 0, 1, 1,
0.5139727, 0.366461, 2.699634, 0.1294118, 0, 1, 1,
0.5232805, 1.631774, 0.06371091, 0.1333333, 0, 1, 1,
0.5249917, 0.9079652, 0.5985908, 0.1411765, 0, 1, 1,
0.5367282, 0.6589187, 0.03034229, 0.145098, 0, 1, 1,
0.5379894, -0.008555141, 1.233063, 0.1529412, 0, 1, 1,
0.5466325, 1.88957, -0.372122, 0.1568628, 0, 1, 1,
0.5496953, 0.7575251, 0.4752636, 0.1647059, 0, 1, 1,
0.5547225, 0.8846915, -0.695932, 0.1686275, 0, 1, 1,
0.5553702, 0.6169237, -0.5692025, 0.1764706, 0, 1, 1,
0.5599058, -0.4924968, 2.123961, 0.1803922, 0, 1, 1,
0.5683981, 0.529978, 0.8713562, 0.1882353, 0, 1, 1,
0.5692812, -0.09030408, 2.222594, 0.1921569, 0, 1, 1,
0.5694677, -0.6025743, 0.4577919, 0.2, 0, 1, 1,
0.5707021, 0.4112262, 2.573265, 0.2078431, 0, 1, 1,
0.5710202, -0.2281945, 2.054699, 0.2117647, 0, 1, 1,
0.5721179, -1.18824, 3.483456, 0.2196078, 0, 1, 1,
0.572293, -0.8100777, 2.239334, 0.2235294, 0, 1, 1,
0.5761139, -1.120596, 1.16125, 0.2313726, 0, 1, 1,
0.577287, -0.8949586, 1.521705, 0.2352941, 0, 1, 1,
0.5803331, 0.5351284, 1.108112, 0.2431373, 0, 1, 1,
0.5822235, -1.021592, 1.181899, 0.2470588, 0, 1, 1,
0.5824291, 1.286561, -1.363883, 0.254902, 0, 1, 1,
0.5868327, 0.504379, -1.164624, 0.2588235, 0, 1, 1,
0.5905752, -1.068557, 2.440225, 0.2666667, 0, 1, 1,
0.59335, 1.328768, -1.388334, 0.2705882, 0, 1, 1,
0.5972589, -2.018055, 3.447378, 0.2784314, 0, 1, 1,
0.5999409, -1.54481, 1.10081, 0.282353, 0, 1, 1,
0.6050767, 0.7850589, 1.73551, 0.2901961, 0, 1, 1,
0.6089966, -1.307005, 2.262462, 0.2941177, 0, 1, 1,
0.6117861, 0.5460176, 0.5168767, 0.3019608, 0, 1, 1,
0.6248335, -1.513833, 3.490129, 0.3098039, 0, 1, 1,
0.625517, 1.245767, -0.02783712, 0.3137255, 0, 1, 1,
0.6281539, -0.6389968, 2.077381, 0.3215686, 0, 1, 1,
0.6321378, -1.055055, 1.359498, 0.3254902, 0, 1, 1,
0.6361591, 0.3807905, 0.9957507, 0.3333333, 0, 1, 1,
0.6403828, -0.6914609, 2.317427, 0.3372549, 0, 1, 1,
0.6405935, -0.0301713, 2.627193, 0.345098, 0, 1, 1,
0.6496454, 0.3818698, 1.92816, 0.3490196, 0, 1, 1,
0.6507227, 2.269659, 0.2333829, 0.3568628, 0, 1, 1,
0.6516893, -1.438799, 2.144719, 0.3607843, 0, 1, 1,
0.6526105, 0.6522646, -0.263941, 0.3686275, 0, 1, 1,
0.6533897, -1.858482, 2.229746, 0.372549, 0, 1, 1,
0.6732945, -0.6226935, 1.512328, 0.3803922, 0, 1, 1,
0.6771597, 0.08064658, 0.7742108, 0.3843137, 0, 1, 1,
0.6801259, 0.1643244, 0.3510002, 0.3921569, 0, 1, 1,
0.682031, 0.7060755, 1.171757, 0.3960784, 0, 1, 1,
0.6821114, 1.322966, -0.7560099, 0.4039216, 0, 1, 1,
0.6851475, 0.6716417, 1.431343, 0.4117647, 0, 1, 1,
0.6855139, 0.5976661, 0.893486, 0.4156863, 0, 1, 1,
0.6904628, 1.091716, 0.6306723, 0.4235294, 0, 1, 1,
0.6955397, 1.045535, 1.445804, 0.427451, 0, 1, 1,
0.6985098, -1.076396, 3.574259, 0.4352941, 0, 1, 1,
0.7023519, 1.347564, 0.6693072, 0.4392157, 0, 1, 1,
0.7027768, -1.626821, 1.892073, 0.4470588, 0, 1, 1,
0.7060864, 0.9362785, 2.046878, 0.4509804, 0, 1, 1,
0.7071106, -0.9488428, 3.388986, 0.4588235, 0, 1, 1,
0.7106336, -0.02050933, 1.771698, 0.4627451, 0, 1, 1,
0.7137921, -0.6121207, 2.596483, 0.4705882, 0, 1, 1,
0.7159521, -1.420561, 2.331291, 0.4745098, 0, 1, 1,
0.7188026, -1.578271, 2.496974, 0.4823529, 0, 1, 1,
0.7254077, -0.1115144, 1.826204, 0.4862745, 0, 1, 1,
0.7274942, -1.473512, 3.628408, 0.4941176, 0, 1, 1,
0.7275324, 1.255408, 0.1593873, 0.5019608, 0, 1, 1,
0.7285625, -0.7817096, 1.697328, 0.5058824, 0, 1, 1,
0.7351035, -0.4614441, 2.516157, 0.5137255, 0, 1, 1,
0.7371197, -0.3447103, 0.5867941, 0.5176471, 0, 1, 1,
0.7402245, 0.01690779, 0.6809167, 0.5254902, 0, 1, 1,
0.7416146, 0.914511, 1.195949, 0.5294118, 0, 1, 1,
0.748188, 0.2088664, 0.6451896, 0.5372549, 0, 1, 1,
0.7499635, -0.3094573, 0.9519247, 0.5411765, 0, 1, 1,
0.7511285, -1.510765, 2.66856, 0.5490196, 0, 1, 1,
0.752172, 1.076336, -0.6405593, 0.5529412, 0, 1, 1,
0.7589301, -0.7238564, 1.998243, 0.5607843, 0, 1, 1,
0.7607039, 0.5043657, 0.3769167, 0.5647059, 0, 1, 1,
0.7647519, -0.5966678, 2.267417, 0.572549, 0, 1, 1,
0.7751514, -1.23938, 3.182222, 0.5764706, 0, 1, 1,
0.7772684, 0.8559443, -0.2061276, 0.5843138, 0, 1, 1,
0.777469, 0.6388324, 2.278977, 0.5882353, 0, 1, 1,
0.7786331, -0.0241428, 1.94431, 0.5960785, 0, 1, 1,
0.7804293, 0.1009869, 1.404335, 0.6039216, 0, 1, 1,
0.7834807, 0.0554098, 2.385014, 0.6078432, 0, 1, 1,
0.7887555, 0.341314, 1.571523, 0.6156863, 0, 1, 1,
0.7977358, -0.6965787, 3.490782, 0.6196079, 0, 1, 1,
0.7996938, 0.3049743, 0.4282762, 0.627451, 0, 1, 1,
0.8073972, 0.2385689, 1.269047, 0.6313726, 0, 1, 1,
0.8082357, -0.346884, 2.252573, 0.6392157, 0, 1, 1,
0.8092579, -1.237156, 3.580291, 0.6431373, 0, 1, 1,
0.8126758, 0.5689386, 0.504862, 0.6509804, 0, 1, 1,
0.8146035, -1.673855, 2.746044, 0.654902, 0, 1, 1,
0.8167035, -0.6060622, 3.547646, 0.6627451, 0, 1, 1,
0.8268723, -0.6300801, 3.586766, 0.6666667, 0, 1, 1,
0.8319414, -1.470295, 0.6470071, 0.6745098, 0, 1, 1,
0.8360821, -0.3630467, 1.528269, 0.6784314, 0, 1, 1,
0.8395917, 0.6636181, 0.7539946, 0.6862745, 0, 1, 1,
0.8489029, -0.447578, 2.482969, 0.6901961, 0, 1, 1,
0.8499097, -0.05869433, 1.422441, 0.6980392, 0, 1, 1,
0.8523299, 1.354652, 0.0652843, 0.7058824, 0, 1, 1,
0.8560469, -1.534714, 5.006734, 0.7098039, 0, 1, 1,
0.8581077, 0.2618713, 1.439487, 0.7176471, 0, 1, 1,
0.8600975, -0.4038313, 3.851737, 0.7215686, 0, 1, 1,
0.8616384, -0.6010191, 1.207522, 0.7294118, 0, 1, 1,
0.8679537, -0.2206885, 2.020215, 0.7333333, 0, 1, 1,
0.8697249, 1.792977, 1.062449, 0.7411765, 0, 1, 1,
0.8712634, 1.294469, -0.458474, 0.7450981, 0, 1, 1,
0.8718798, 0.4362634, 1.302953, 0.7529412, 0, 1, 1,
0.8721294, -0.5604723, 3.375664, 0.7568628, 0, 1, 1,
0.8723266, 0.2096353, 0.6138868, 0.7647059, 0, 1, 1,
0.8761486, 0.447104, 2.035623, 0.7686275, 0, 1, 1,
0.8792683, 0.1565807, 3.032447, 0.7764706, 0, 1, 1,
0.8814083, -1.091634, 2.415999, 0.7803922, 0, 1, 1,
0.8838271, 0.7520379, 1.257022, 0.7882353, 0, 1, 1,
0.884445, -0.9071046, 3.315239, 0.7921569, 0, 1, 1,
0.8845807, -1.145164, 3.904466, 0.8, 0, 1, 1,
0.8849863, -0.4142912, 3.449143, 0.8078431, 0, 1, 1,
0.8859072, 0.7917708, 1.5812, 0.8117647, 0, 1, 1,
0.887324, -0.2960085, 1.722606, 0.8196079, 0, 1, 1,
0.8885499, -0.7497635, 2.890046, 0.8235294, 0, 1, 1,
0.8895643, 0.1209647, 0.8022588, 0.8313726, 0, 1, 1,
0.89065, -1.653218, 1.856992, 0.8352941, 0, 1, 1,
0.8930786, 0.209002, 0.8734493, 0.8431373, 0, 1, 1,
0.9023358, 0.1421068, 1.344609, 0.8470588, 0, 1, 1,
0.9047298, -2.076626, 2.866836, 0.854902, 0, 1, 1,
0.9081756, -0.2484491, 2.747843, 0.8588235, 0, 1, 1,
0.9097151, 0.7667425, -0.6012319, 0.8666667, 0, 1, 1,
0.9111046, -0.5081768, 1.475209, 0.8705882, 0, 1, 1,
0.9259322, -2.003253, 3.056776, 0.8784314, 0, 1, 1,
0.9294414, -1.204984, 1.878333, 0.8823529, 0, 1, 1,
0.9325143, 0.1963641, 2.071512, 0.8901961, 0, 1, 1,
0.93423, -1.235041, 0.7894945, 0.8941177, 0, 1, 1,
0.9358078, 0.1018848, 0.03615373, 0.9019608, 0, 1, 1,
0.9403616, -0.7123888, 4.766506, 0.9098039, 0, 1, 1,
0.9412253, -1.103949, 1.868191, 0.9137255, 0, 1, 1,
0.9426455, 0.3685263, 1.753384, 0.9215686, 0, 1, 1,
0.9440576, 2.127077, 0.817929, 0.9254902, 0, 1, 1,
0.9470698, -0.2220974, 0.9159683, 0.9333333, 0, 1, 1,
0.9567632, 0.1943249, 1.295424, 0.9372549, 0, 1, 1,
0.9580577, -1.59957, 0.9088622, 0.945098, 0, 1, 1,
0.9674892, -1.912127, 4.616876, 0.9490196, 0, 1, 1,
0.9688671, -0.1243109, 0.8068247, 0.9568627, 0, 1, 1,
0.9740521, 1.741944, -1.584394, 0.9607843, 0, 1, 1,
0.9788857, 0.05450684, 0.8808557, 0.9686275, 0, 1, 1,
0.9800143, -0.162298, 1.175087, 0.972549, 0, 1, 1,
0.9836413, -1.676392, 2.020163, 0.9803922, 0, 1, 1,
0.9844558, -0.263869, 2.48451, 0.9843137, 0, 1, 1,
0.995642, 0.7009385, -0.8403429, 0.9921569, 0, 1, 1,
0.9957527, -0.209854, 1.14529, 0.9960784, 0, 1, 1,
0.9962065, -1.354492, 3.229783, 1, 0, 0.9960784, 1,
1.00322, -1.028419, 3.458583, 1, 0, 0.9882353, 1,
1.005993, 0.3587445, 1.357422, 1, 0, 0.9843137, 1,
1.009191, 1.112579, 0.6881557, 1, 0, 0.9764706, 1,
1.010073, 0.37432, -0.4712794, 1, 0, 0.972549, 1,
1.015049, -0.06084982, 1.501389, 1, 0, 0.9647059, 1,
1.016259, -0.3409488, 2.979365, 1, 0, 0.9607843, 1,
1.016927, -1.495507, 3.40157, 1, 0, 0.9529412, 1,
1.020051, -1.874716, 1.880006, 1, 0, 0.9490196, 1,
1.030181, 0.3132091, 1.414486, 1, 0, 0.9411765, 1,
1.032883, -1.152761, 2.821563, 1, 0, 0.9372549, 1,
1.0342, 0.4201537, 1.504125, 1, 0, 0.9294118, 1,
1.034813, 4.067172, -1.449446, 1, 0, 0.9254902, 1,
1.035127, 0.09436253, 3.716742, 1, 0, 0.9176471, 1,
1.037021, 0.06063516, 2.312718, 1, 0, 0.9137255, 1,
1.043584, 0.89774, 3.288731, 1, 0, 0.9058824, 1,
1.043647, -0.7985562, 2.727665, 1, 0, 0.9019608, 1,
1.047319, -1.18059, 2.535667, 1, 0, 0.8941177, 1,
1.052478, -0.05689653, 0.7009513, 1, 0, 0.8862745, 1,
1.05818, 2.165965, 0.4620198, 1, 0, 0.8823529, 1,
1.058525, 1.298736, 2.039131, 1, 0, 0.8745098, 1,
1.071892, -2.046087, 2.337706, 1, 0, 0.8705882, 1,
1.088452, 1.270181, -0.2494994, 1, 0, 0.8627451, 1,
1.093313, 0.1302057, 1.177047, 1, 0, 0.8588235, 1,
1.099677, 0.6360604, 0.6429763, 1, 0, 0.8509804, 1,
1.111395, -0.05982652, 2.479025, 1, 0, 0.8470588, 1,
1.115496, 0.5525894, 1.864867, 1, 0, 0.8392157, 1,
1.120838, 0.1122306, 2.608311, 1, 0, 0.8352941, 1,
1.122189, 1.201249, 1.618956, 1, 0, 0.827451, 1,
1.128886, 0.4272734, -0.511541, 1, 0, 0.8235294, 1,
1.134474, -0.7602798, 3.005051, 1, 0, 0.8156863, 1,
1.150459, -1.683615, 3.457237, 1, 0, 0.8117647, 1,
1.157786, 1.70506, 1.146944, 1, 0, 0.8039216, 1,
1.161504, -2.551714, 2.587649, 1, 0, 0.7960784, 1,
1.1637, 0.1550271, 1.269296, 1, 0, 0.7921569, 1,
1.170813, -0.03591655, 1.386604, 1, 0, 0.7843137, 1,
1.173614, -0.2150114, 4.351698, 1, 0, 0.7803922, 1,
1.178947, 0.7889547, 2.640193, 1, 0, 0.772549, 1,
1.187048, -0.01267864, 0.2129039, 1, 0, 0.7686275, 1,
1.19092, 0.7768326, -0.06327803, 1, 0, 0.7607843, 1,
1.211433, 0.2625626, 0.2865313, 1, 0, 0.7568628, 1,
1.216273, -1.999475, 2.105728, 1, 0, 0.7490196, 1,
1.222783, 1.089258, -0.3626245, 1, 0, 0.7450981, 1,
1.223484, -1.695547, 2.079037, 1, 0, 0.7372549, 1,
1.225148, -0.540737, 2.04213, 1, 0, 0.7333333, 1,
1.228186, 1.000275, 1.643707, 1, 0, 0.7254902, 1,
1.231091, 0.1577791, 1.331448, 1, 0, 0.7215686, 1,
1.231373, -0.06294354, 0.5962185, 1, 0, 0.7137255, 1,
1.233957, -0.0179749, 0.221781, 1, 0, 0.7098039, 1,
1.244827, 0.4235179, 2.066357, 1, 0, 0.7019608, 1,
1.253868, 0.6856385, 0.8972101, 1, 0, 0.6941177, 1,
1.264817, -0.07000595, 0.871339, 1, 0, 0.6901961, 1,
1.267207, -1.519234, 1.813817, 1, 0, 0.682353, 1,
1.267852, 0.1932883, 1.250803, 1, 0, 0.6784314, 1,
1.270142, 1.282044, 1.953104, 1, 0, 0.6705883, 1,
1.273898, -1.016249, 2.808395, 1, 0, 0.6666667, 1,
1.290199, 1.78649, 0.5014569, 1, 0, 0.6588235, 1,
1.290525, 0.5802694, 2.723006, 1, 0, 0.654902, 1,
1.299146, -0.4777333, 1.986857, 1, 0, 0.6470588, 1,
1.299496, 0.7592735, 0.5788741, 1, 0, 0.6431373, 1,
1.304892, -0.3660728, 1.102811, 1, 0, 0.6352941, 1,
1.305975, -0.5046862, 1.769826, 1, 0, 0.6313726, 1,
1.307305, -1.050749, 2.242154, 1, 0, 0.6235294, 1,
1.311573, -0.9009736, 1.204682, 1, 0, 0.6196079, 1,
1.311639, 0.0188893, 0.7922418, 1, 0, 0.6117647, 1,
1.319879, 0.0451464, 2.142951, 1, 0, 0.6078432, 1,
1.320891, -0.002956826, 1.239703, 1, 0, 0.6, 1,
1.322116, -2.067518, 3.676195, 1, 0, 0.5921569, 1,
1.329258, -0.4200919, 2.601921, 1, 0, 0.5882353, 1,
1.32975, 1.428438, 1.108148, 1, 0, 0.5803922, 1,
1.339306, -0.6833831, 3.231643, 1, 0, 0.5764706, 1,
1.346257, -0.9648567, 3.024115, 1, 0, 0.5686275, 1,
1.34749, -0.801012, 2.088993, 1, 0, 0.5647059, 1,
1.35152, 0.08944812, 1.595553, 1, 0, 0.5568628, 1,
1.352862, 0.3133346, 0.162571, 1, 0, 0.5529412, 1,
1.360559, -1.025422, 2.979504, 1, 0, 0.5450981, 1,
1.36172, -0.2207983, 2.712537, 1, 0, 0.5411765, 1,
1.366634, 0.2034085, 2.693922, 1, 0, 0.5333334, 1,
1.375114, 0.4003171, 0.6510326, 1, 0, 0.5294118, 1,
1.376366, -2.614394, 2.101796, 1, 0, 0.5215687, 1,
1.400443, -0.9776655, 2.080616, 1, 0, 0.5176471, 1,
1.414088, 0.3814976, 2.328539, 1, 0, 0.509804, 1,
1.425047, 1.374803, 0.5258609, 1, 0, 0.5058824, 1,
1.425317, -0.4235315, 0.9110532, 1, 0, 0.4980392, 1,
1.443574, -2.161885, 2.128664, 1, 0, 0.4901961, 1,
1.445938, 1.010778, 0.8155939, 1, 0, 0.4862745, 1,
1.44644, -0.5385336, 2.01044, 1, 0, 0.4784314, 1,
1.455091, 1.015161, 1.764586, 1, 0, 0.4745098, 1,
1.484911, -0.6041371, 3.128625, 1, 0, 0.4666667, 1,
1.49897, 0.3826631, 1.983509, 1, 0, 0.4627451, 1,
1.505675, -1.093306, 1.912336, 1, 0, 0.454902, 1,
1.507468, 1.20225, 1.437734, 1, 0, 0.4509804, 1,
1.508512, -2.688725, 1.974541, 1, 0, 0.4431373, 1,
1.531253, 0.1849854, 1.032671, 1, 0, 0.4392157, 1,
1.538947, 0.914744, 3.094541, 1, 0, 0.4313726, 1,
1.5424, -1.681073, 2.800184, 1, 0, 0.427451, 1,
1.567437, 0.9548543, 2.308866, 1, 0, 0.4196078, 1,
1.567565, 0.897751, 1.004701, 1, 0, 0.4156863, 1,
1.570565, -2.059306, 3.902946, 1, 0, 0.4078431, 1,
1.578291, 0.248531, 0.8830261, 1, 0, 0.4039216, 1,
1.583063, -0.2105895, 4.458014, 1, 0, 0.3960784, 1,
1.587914, 0.1021323, 2.223083, 1, 0, 0.3882353, 1,
1.593193, 0.08178983, 3.305798, 1, 0, 0.3843137, 1,
1.603759, 0.07204255, 0.884281, 1, 0, 0.3764706, 1,
1.606832, 1.241423, 0.7116842, 1, 0, 0.372549, 1,
1.609063, -0.6976395, 2.804661, 1, 0, 0.3647059, 1,
1.616216, 0.1118107, 0.7416772, 1, 0, 0.3607843, 1,
1.62591, 1.334964, 0.4782146, 1, 0, 0.3529412, 1,
1.626279, -1.887776, 2.546674, 1, 0, 0.3490196, 1,
1.634422, 2.021211, 2.351479, 1, 0, 0.3411765, 1,
1.654815, -1.69796, 2.365993, 1, 0, 0.3372549, 1,
1.65975, 0.009067643, 0.4959269, 1, 0, 0.3294118, 1,
1.66032, -0.2407565, 2.441206, 1, 0, 0.3254902, 1,
1.70014, -0.1801353, 0.8023682, 1, 0, 0.3176471, 1,
1.729444, -0.488153, 1.492519, 1, 0, 0.3137255, 1,
1.73241, 0.3460159, -0.3269444, 1, 0, 0.3058824, 1,
1.742204, 0.4653075, 2.070287, 1, 0, 0.2980392, 1,
1.747888, 0.01570716, 0.2310266, 1, 0, 0.2941177, 1,
1.754376, 0.5905069, 0.2708007, 1, 0, 0.2862745, 1,
1.756927, 0.7474918, 1.288427, 1, 0, 0.282353, 1,
1.762493, 0.2027098, 1.618567, 1, 0, 0.2745098, 1,
1.772699, -1.081174, 3.26783, 1, 0, 0.2705882, 1,
1.807024, 0.323594, 0.9987894, 1, 0, 0.2627451, 1,
1.814436, 0.1372889, 2.60442, 1, 0, 0.2588235, 1,
1.82675, 0.2846268, 2.902403, 1, 0, 0.2509804, 1,
1.866464, -0.1557827, 1.86384, 1, 0, 0.2470588, 1,
1.868797, -1.218571, 1.635983, 1, 0, 0.2392157, 1,
1.873018, -0.753427, 1.781281, 1, 0, 0.2352941, 1,
1.888194, -0.4726829, 0.7518024, 1, 0, 0.227451, 1,
1.890881, 1.93524, 1.723652, 1, 0, 0.2235294, 1,
1.899237, 0.6620983, 0.7623552, 1, 0, 0.2156863, 1,
1.900644, 1.062527, 2.11052, 1, 0, 0.2117647, 1,
1.900965, 0.4906273, 2.438771, 1, 0, 0.2039216, 1,
1.924717, 0.02279868, -0.697134, 1, 0, 0.1960784, 1,
1.946199, 0.1503948, 3.27092, 1, 0, 0.1921569, 1,
2.021426, 0.2020362, 2.097756, 1, 0, 0.1843137, 1,
2.023815, -0.295709, -0.4853871, 1, 0, 0.1803922, 1,
2.025016, 0.3880223, 1.213123, 1, 0, 0.172549, 1,
2.033044, 0.2961367, 1.607631, 1, 0, 0.1686275, 1,
2.041993, -1.168993, 1.927289, 1, 0, 0.1607843, 1,
2.063143, -0.6592039, 1.779313, 1, 0, 0.1568628, 1,
2.127651, -0.6011729, 1.077371, 1, 0, 0.1490196, 1,
2.12773, 1.376359, 1.305608, 1, 0, 0.145098, 1,
2.12867, 0.7730147, 2.265603, 1, 0, 0.1372549, 1,
2.150586, 1.42304, 2.315511, 1, 0, 0.1333333, 1,
2.151635, 0.228846, 0.1088599, 1, 0, 0.1254902, 1,
2.172529, 0.578227, 2.603679, 1, 0, 0.1215686, 1,
2.203868, -1.703058, 1.076031, 1, 0, 0.1137255, 1,
2.236121, 1.191461, 2.528336, 1, 0, 0.1098039, 1,
2.236195, 0.201894, 1.21785, 1, 0, 0.1019608, 1,
2.283421, -0.9961304, 1.098979, 1, 0, 0.09411765, 1,
2.292782, -0.980319, 1.172673, 1, 0, 0.09019608, 1,
2.308627, 0.3639717, -0.1240056, 1, 0, 0.08235294, 1,
2.32809, -0.2437772, 2.478441, 1, 0, 0.07843138, 1,
2.352974, -0.3080829, 3.818722, 1, 0, 0.07058824, 1,
2.381368, 0.3105038, 1.247565, 1, 0, 0.06666667, 1,
2.406355, -0.9177234, 2.02293, 1, 0, 0.05882353, 1,
2.449529, 1.36722, 1.504987, 1, 0, 0.05490196, 1,
2.476136, -1.004385, 0.6424262, 1, 0, 0.04705882, 1,
2.500446, -1.45063, 1.982995, 1, 0, 0.04313726, 1,
2.556797, -0.1252497, 2.413659, 1, 0, 0.03529412, 1,
2.625138, 0.8295861, 3.009145, 1, 0, 0.03137255, 1,
2.661789, 0.7570937, 0.564621, 1, 0, 0.02352941, 1,
2.896345, 0.7096777, 2.158318, 1, 0, 0.01960784, 1,
3.070334, -1.155559, 1.760601, 1, 0, 0.01176471, 1,
4.010176, 1.042925, 1.337776, 1, 0, 0.007843138, 1
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
0.3662758, -4.174026, -6.409741, 0, -0.5, 0.5, 0.5,
0.3662758, -4.174026, -6.409741, 1, -0.5, 0.5, 0.5,
0.3662758, -4.174026, -6.409741, 1, 1.5, 0.5, 0.5,
0.3662758, -4.174026, -6.409741, 0, 1.5, 0.5, 0.5
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
-4.512906, 0.5437864, -6.409741, 0, -0.5, 0.5, 0.5,
-4.512906, 0.5437864, -6.409741, 1, -0.5, 0.5, 0.5,
-4.512906, 0.5437864, -6.409741, 1, 1.5, 0.5, 0.5,
-4.512906, 0.5437864, -6.409741, 0, 1.5, 0.5, 0.5
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
-4.512906, -4.174026, 0.5350487, 0, -0.5, 0.5, 0.5,
-4.512906, -4.174026, 0.5350487, 1, -0.5, 0.5, 0.5,
-4.512906, -4.174026, 0.5350487, 1, 1.5, 0.5, 0.5,
-4.512906, -4.174026, 0.5350487, 0, 1.5, 0.5, 0.5
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
-2, -3.0853, -4.807097,
4, -3.0853, -4.807097,
-2, -3.0853, -4.807097,
-2, -3.266755, -5.074204,
0, -3.0853, -4.807097,
0, -3.266755, -5.074204,
2, -3.0853, -4.807097,
2, -3.266755, -5.074204,
4, -3.0853, -4.807097,
4, -3.266755, -5.074204
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
"2",
"4"
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
-2, -3.629663, -5.608419, 0, -0.5, 0.5, 0.5,
-2, -3.629663, -5.608419, 1, -0.5, 0.5, 0.5,
-2, -3.629663, -5.608419, 1, 1.5, 0.5, 0.5,
-2, -3.629663, -5.608419, 0, 1.5, 0.5, 0.5,
0, -3.629663, -5.608419, 0, -0.5, 0.5, 0.5,
0, -3.629663, -5.608419, 1, -0.5, 0.5, 0.5,
0, -3.629663, -5.608419, 1, 1.5, 0.5, 0.5,
0, -3.629663, -5.608419, 0, 1.5, 0.5, 0.5,
2, -3.629663, -5.608419, 0, -0.5, 0.5, 0.5,
2, -3.629663, -5.608419, 1, -0.5, 0.5, 0.5,
2, -3.629663, -5.608419, 1, 1.5, 0.5, 0.5,
2, -3.629663, -5.608419, 0, 1.5, 0.5, 0.5,
4, -3.629663, -5.608419, 0, -0.5, 0.5, 0.5,
4, -3.629663, -5.608419, 1, -0.5, 0.5, 0.5,
4, -3.629663, -5.608419, 1, 1.5, 0.5, 0.5,
4, -3.629663, -5.608419, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.386941, -2, -4.807097,
-3.386941, 4, -4.807097,
-3.386941, -2, -4.807097,
-3.574602, -2, -5.074204,
-3.386941, 0, -4.807097,
-3.574602, 0, -5.074204,
-3.386941, 2, -4.807097,
-3.574602, 2, -5.074204,
-3.386941, 4, -4.807097,
-3.574602, 4, -5.074204
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
"0",
"2",
"4"
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
-3.949924, -2, -5.608419, 0, -0.5, 0.5, 0.5,
-3.949924, -2, -5.608419, 1, -0.5, 0.5, 0.5,
-3.949924, -2, -5.608419, 1, 1.5, 0.5, 0.5,
-3.949924, -2, -5.608419, 0, 1.5, 0.5, 0.5,
-3.949924, 0, -5.608419, 0, -0.5, 0.5, 0.5,
-3.949924, 0, -5.608419, 1, -0.5, 0.5, 0.5,
-3.949924, 0, -5.608419, 1, 1.5, 0.5, 0.5,
-3.949924, 0, -5.608419, 0, 1.5, 0.5, 0.5,
-3.949924, 2, -5.608419, 0, -0.5, 0.5, 0.5,
-3.949924, 2, -5.608419, 1, -0.5, 0.5, 0.5,
-3.949924, 2, -5.608419, 1, 1.5, 0.5, 0.5,
-3.949924, 2, -5.608419, 0, 1.5, 0.5, 0.5,
-3.949924, 4, -5.608419, 0, -0.5, 0.5, 0.5,
-3.949924, 4, -5.608419, 1, -0.5, 0.5, 0.5,
-3.949924, 4, -5.608419, 1, 1.5, 0.5, 0.5,
-3.949924, 4, -5.608419, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.386941, -3.0853, -4,
-3.386941, -3.0853, 4,
-3.386941, -3.0853, -4,
-3.574602, -3.266755, -4,
-3.386941, -3.0853, -2,
-3.574602, -3.266755, -2,
-3.386941, -3.0853, 0,
-3.574602, -3.266755, 0,
-3.386941, -3.0853, 2,
-3.574602, -3.266755, 2,
-3.386941, -3.0853, 4,
-3.574602, -3.266755, 4
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
-3.949924, -3.629663, -4, 0, -0.5, 0.5, 0.5,
-3.949924, -3.629663, -4, 1, -0.5, 0.5, 0.5,
-3.949924, -3.629663, -4, 1, 1.5, 0.5, 0.5,
-3.949924, -3.629663, -4, 0, 1.5, 0.5, 0.5,
-3.949924, -3.629663, -2, 0, -0.5, 0.5, 0.5,
-3.949924, -3.629663, -2, 1, -0.5, 0.5, 0.5,
-3.949924, -3.629663, -2, 1, 1.5, 0.5, 0.5,
-3.949924, -3.629663, -2, 0, 1.5, 0.5, 0.5,
-3.949924, -3.629663, 0, 0, -0.5, 0.5, 0.5,
-3.949924, -3.629663, 0, 1, -0.5, 0.5, 0.5,
-3.949924, -3.629663, 0, 1, 1.5, 0.5, 0.5,
-3.949924, -3.629663, 0, 0, 1.5, 0.5, 0.5,
-3.949924, -3.629663, 2, 0, -0.5, 0.5, 0.5,
-3.949924, -3.629663, 2, 1, -0.5, 0.5, 0.5,
-3.949924, -3.629663, 2, 1, 1.5, 0.5, 0.5,
-3.949924, -3.629663, 2, 0, 1.5, 0.5, 0.5,
-3.949924, -3.629663, 4, 0, -0.5, 0.5, 0.5,
-3.949924, -3.629663, 4, 1, -0.5, 0.5, 0.5,
-3.949924, -3.629663, 4, 1, 1.5, 0.5, 0.5,
-3.949924, -3.629663, 4, 0, 1.5, 0.5, 0.5
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
-3.386941, -3.0853, -4.807097,
-3.386941, 4.172873, -4.807097,
-3.386941, -3.0853, 5.877194,
-3.386941, 4.172873, 5.877194,
-3.386941, -3.0853, -4.807097,
-3.386941, -3.0853, 5.877194,
-3.386941, 4.172873, -4.807097,
-3.386941, 4.172873, 5.877194,
-3.386941, -3.0853, -4.807097,
4.119493, -3.0853, -4.807097,
-3.386941, -3.0853, 5.877194,
4.119493, -3.0853, 5.877194,
-3.386941, 4.172873, -4.807097,
4.119493, 4.172873, -4.807097,
-3.386941, 4.172873, 5.877194,
4.119493, 4.172873, 5.877194,
4.119493, -3.0853, -4.807097,
4.119493, 4.172873, -4.807097,
4.119493, -3.0853, 5.877194,
4.119493, 4.172873, 5.877194,
4.119493, -3.0853, -4.807097,
4.119493, -3.0853, 5.877194,
4.119493, 4.172873, -4.807097,
4.119493, 4.172873, 5.877194
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
var radius = 7.977279;
var distance = 35.49182;
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
mvMatrix.translate( -0.3662758, -0.5437864, -0.5350487 );
mvMatrix.scale( 1.14904, 1.188342, 0.8072777 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.49182);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Propene<-read.table("Propene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propene' not found
```

```r
y<-Propene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propene' not found
```

```r
z<-Propene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propene' not found
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
-3.277624, 0.002008809, -0.9601799, 0, 0, 1, 1, 1,
-3.207652, -0.3857752, -3.475816, 1, 0, 0, 1, 1,
-2.886695, 1.780193, -0.4055762, 1, 0, 0, 1, 1,
-2.605846, -1.768248, -2.782232, 1, 0, 0, 1, 1,
-2.508409, 0.2991282, -1.370763, 1, 0, 0, 1, 1,
-2.473994, 0.03955363, -2.718869, 1, 0, 0, 1, 1,
-2.437386, -1.184501, -2.126971, 0, 0, 0, 1, 1,
-2.437195, 0.4671228, -1.512229, 0, 0, 0, 1, 1,
-2.268324, -1.40183, -1.298329, 0, 0, 0, 1, 1,
-2.259006, 1.214088, -1.111747, 0, 0, 0, 1, 1,
-2.243381, 0.8507268, -1.04235, 0, 0, 0, 1, 1,
-2.215184, 0.6159634, -2.254092, 0, 0, 0, 1, 1,
-2.132554, -0.1647776, -1.52689, 0, 0, 0, 1, 1,
-2.12204, 0.05972094, -0.3687359, 1, 1, 1, 1, 1,
-2.111453, 1.055771, 0.008979203, 1, 1, 1, 1, 1,
-2.094573, -0.6797938, -1.911892, 1, 1, 1, 1, 1,
-2.093849, -0.5350209, -2.181981, 1, 1, 1, 1, 1,
-2.033915, -0.4323851, -1.89877, 1, 1, 1, 1, 1,
-2.028382, 0.215884, 0.3328123, 1, 1, 1, 1, 1,
-2.024892, -1.311539, -2.895289, 1, 1, 1, 1, 1,
-2.015024, 0.8379473, -1.583474, 1, 1, 1, 1, 1,
-1.9742, 0.1002334, -1.781947, 1, 1, 1, 1, 1,
-1.967973, 1.47386, -1.757039, 1, 1, 1, 1, 1,
-1.945752, -1.213272, -0.1441659, 1, 1, 1, 1, 1,
-1.941102, -1.139671, -2.183685, 1, 1, 1, 1, 1,
-1.929043, -0.1391247, -1.698327, 1, 1, 1, 1, 1,
-1.928455, 0.2202589, -1.7743, 1, 1, 1, 1, 1,
-1.912659, -1.901199, 0.009101475, 1, 1, 1, 1, 1,
-1.872531, -0.06651901, -3.061329, 0, 0, 1, 1, 1,
-1.83629, 1.16112, -2.169798, 1, 0, 0, 1, 1,
-1.789493, -0.6290757, -2.826753, 1, 0, 0, 1, 1,
-1.773568, -1.613263, -3.318495, 1, 0, 0, 1, 1,
-1.767537, 0.2886864, -2.1211, 1, 0, 0, 1, 1,
-1.765826, -0.6319415, -1.640163, 1, 0, 0, 1, 1,
-1.761314, 0.7535626, -0.07056336, 0, 0, 0, 1, 1,
-1.756676, 0.05078623, -1.3739, 0, 0, 0, 1, 1,
-1.748802, 1.70223, -2.988222, 0, 0, 0, 1, 1,
-1.744914, -0.5597632, -2.068625, 0, 0, 0, 1, 1,
-1.724748, 1.552234, -0.9426662, 0, 0, 0, 1, 1,
-1.707975, 0.953478, -1.403828, 0, 0, 0, 1, 1,
-1.699776, -0.3724146, -1.96443, 0, 0, 0, 1, 1,
-1.678782, -0.3437567, -2.35412, 1, 1, 1, 1, 1,
-1.675942, -1.049881, -2.93965, 1, 1, 1, 1, 1,
-1.672593, -0.09011922, -2.696943, 1, 1, 1, 1, 1,
-1.667798, 1.536884, -1.124586, 1, 1, 1, 1, 1,
-1.666308, 0.6787539, -1.24786, 1, 1, 1, 1, 1,
-1.656893, -0.3125961, -1.909769, 1, 1, 1, 1, 1,
-1.651895, 0.3505066, -2.866291, 1, 1, 1, 1, 1,
-1.650724, 0.01175918, -2.754818, 1, 1, 1, 1, 1,
-1.641959, -0.2984039, -0.5408406, 1, 1, 1, 1, 1,
-1.621169, -1.288355, -3.42495, 1, 1, 1, 1, 1,
-1.601544, -0.2664891, -2.651421, 1, 1, 1, 1, 1,
-1.600741, 0.6858813, -0.5497616, 1, 1, 1, 1, 1,
-1.595832, 0.5318402, -0.9909325, 1, 1, 1, 1, 1,
-1.577044, -0.7538414, -2.47577, 1, 1, 1, 1, 1,
-1.56709, 0.5045452, -0.7762523, 1, 1, 1, 1, 1,
-1.564362, -0.8349662, -1.991508, 0, 0, 1, 1, 1,
-1.555236, 0.779093, -0.9586792, 1, 0, 0, 1, 1,
-1.54918, 1.951122, -0.3537207, 1, 0, 0, 1, 1,
-1.539482, -0.2033055, -2.746678, 1, 0, 0, 1, 1,
-1.536869, -1.202331, -1.681146, 1, 0, 0, 1, 1,
-1.533078, 0.1514186, -0.5472033, 1, 0, 0, 1, 1,
-1.530789, 1.254968, -3.429368, 0, 0, 0, 1, 1,
-1.52303, -0.06799067, -1.860719, 0, 0, 0, 1, 1,
-1.522024, 0.7995312, -1.012267, 0, 0, 0, 1, 1,
-1.515712, -0.4546838, -3.995083, 0, 0, 0, 1, 1,
-1.513701, 1.811642, -0.772503, 0, 0, 0, 1, 1,
-1.495242, 2.619346, -0.3976342, 0, 0, 0, 1, 1,
-1.493912, 1.229398, -0.962274, 0, 0, 0, 1, 1,
-1.488391, -0.5765995, -2.809835, 1, 1, 1, 1, 1,
-1.477553, 0.3191825, -2.648849, 1, 1, 1, 1, 1,
-1.476693, 0.03271173, -3.210044, 1, 1, 1, 1, 1,
-1.471622, 2.297797, -0.1063934, 1, 1, 1, 1, 1,
-1.462615, -0.6673604, -2.002269, 1, 1, 1, 1, 1,
-1.450829, -0.4076662, -1.271418, 1, 1, 1, 1, 1,
-1.446481, -0.5169549, -2.726405, 1, 1, 1, 1, 1,
-1.440282, 0.4915773, -1.605209, 1, 1, 1, 1, 1,
-1.433082, -1.191688, -2.887576, 1, 1, 1, 1, 1,
-1.425292, -0.3246342, -2.780378, 1, 1, 1, 1, 1,
-1.42315, -1.017249, -3.312315, 1, 1, 1, 1, 1,
-1.410182, -0.207714, -2.930741, 1, 1, 1, 1, 1,
-1.410022, 0.208409, 0.5942354, 1, 1, 1, 1, 1,
-1.389904, -1.626631, -2.524073, 1, 1, 1, 1, 1,
-1.386907, -0.8873789, -1.551563, 1, 1, 1, 1, 1,
-1.37818, -0.1679125, 0.4335575, 0, 0, 1, 1, 1,
-1.364616, 1.257073, -0.5970634, 1, 0, 0, 1, 1,
-1.355416, 1.370733, -0.6448388, 1, 0, 0, 1, 1,
-1.354974, 0.4107624, -0.7171692, 1, 0, 0, 1, 1,
-1.351413, 0.2853816, -1.305136, 1, 0, 0, 1, 1,
-1.349673, 0.6811662, -1.293471, 1, 0, 0, 1, 1,
-1.329458, -1.787543, -1.88698, 0, 0, 0, 1, 1,
-1.327847, -2.058972, -3.211923, 0, 0, 0, 1, 1,
-1.324638, 0.7343719, -3.559243, 0, 0, 0, 1, 1,
-1.322553, 0.6696709, -0.2925941, 0, 0, 0, 1, 1,
-1.317178, -0.7908236, -1.466817, 0, 0, 0, 1, 1,
-1.31497, -0.07027654, -2.888151, 0, 0, 0, 1, 1,
-1.308404, -0.2680082, -2.845083, 0, 0, 0, 1, 1,
-1.307304, 1.79162, -0.03174384, 1, 1, 1, 1, 1,
-1.306683, -0.05518415, -0.6515681, 1, 1, 1, 1, 1,
-1.301542, -0.6629727, -2.021008, 1, 1, 1, 1, 1,
-1.298741, 0.709332, 0.02653578, 1, 1, 1, 1, 1,
-1.296756, -0.3901136, -0.3183635, 1, 1, 1, 1, 1,
-1.293172, 0.4856741, -1.382754, 1, 1, 1, 1, 1,
-1.29174, 0.2148297, -0.8987066, 1, 1, 1, 1, 1,
-1.288329, 1.420103, -2.486338, 1, 1, 1, 1, 1,
-1.285975, -0.6564456, -1.76738, 1, 1, 1, 1, 1,
-1.285393, -0.4279457, -1.95656, 1, 1, 1, 1, 1,
-1.285018, -0.8200903, -3.313498, 1, 1, 1, 1, 1,
-1.270153, 0.4058973, -0.2970942, 1, 1, 1, 1, 1,
-1.258839, 0.6311684, -0.6486193, 1, 1, 1, 1, 1,
-1.257682, -1.37695, -3.77896, 1, 1, 1, 1, 1,
-1.254056, 0.6808188, -0.03775682, 1, 1, 1, 1, 1,
-1.25311, 0.4761831, -2.195683, 0, 0, 1, 1, 1,
-1.243307, 0.2245013, -1.003132, 1, 0, 0, 1, 1,
-1.239124, -1.043419, -1.560967, 1, 0, 0, 1, 1,
-1.238117, 0.59159, 0.2340053, 1, 0, 0, 1, 1,
-1.234819, -0.4066735, -1.840623, 1, 0, 0, 1, 1,
-1.218754, 1.207765, -2.033698, 1, 0, 0, 1, 1,
-1.211095, -0.5120659, -1.712502, 0, 0, 0, 1, 1,
-1.207516, 0.3360983, -1.748955, 0, 0, 0, 1, 1,
-1.204811, -0.3231471, -0.1532607, 0, 0, 0, 1, 1,
-1.204378, 0.7937034, -2.885234, 0, 0, 0, 1, 1,
-1.203708, -1.933054, -1.403641, 0, 0, 0, 1, 1,
-1.202463, 2.650839, 0.3309578, 0, 0, 0, 1, 1,
-1.201845, 0.8043583, -0.108777, 0, 0, 0, 1, 1,
-1.20178, 0.7556444, -1.522326, 1, 1, 1, 1, 1,
-1.20145, -1.998866, -2.692815, 1, 1, 1, 1, 1,
-1.19735, 0.7003993, 0.630155, 1, 1, 1, 1, 1,
-1.195783, 0.3932861, -1.870419, 1, 1, 1, 1, 1,
-1.185841, -0.8125751, -3.371565, 1, 1, 1, 1, 1,
-1.183673, -1.009662, -1.143955, 1, 1, 1, 1, 1,
-1.177655, 1.714579, -0.5903097, 1, 1, 1, 1, 1,
-1.172343, 1.123485, -3.818436, 1, 1, 1, 1, 1,
-1.165938, -1.307099, -1.718858, 1, 1, 1, 1, 1,
-1.161241, -0.3823426, -2.216937, 1, 1, 1, 1, 1,
-1.159037, -2.032686, -1.554338, 1, 1, 1, 1, 1,
-1.158467, -0.4718238, -1.763672, 1, 1, 1, 1, 1,
-1.155567, 0.8939539, 0.7466213, 1, 1, 1, 1, 1,
-1.148099, -0.8175402, -1.315241, 1, 1, 1, 1, 1,
-1.139821, 1.379871, -1.282315, 1, 1, 1, 1, 1,
-1.131783, 0.2432368, -0.7836918, 0, 0, 1, 1, 1,
-1.127271, 0.4929973, 0.5500066, 1, 0, 0, 1, 1,
-1.127233, 0.1942611, -1.672983, 1, 0, 0, 1, 1,
-1.126011, -1.188056, -0.4894627, 1, 0, 0, 1, 1,
-1.122339, -2.25434, 0.42374, 1, 0, 0, 1, 1,
-1.121421, 1.234817, 0.6330848, 1, 0, 0, 1, 1,
-1.106174, 0.05882787, -2.500359, 0, 0, 0, 1, 1,
-1.104658, -0.5669464, -2.060316, 0, 0, 0, 1, 1,
-1.094369, -0.9265576, -2.359963, 0, 0, 0, 1, 1,
-1.090229, 0.65942, -1.611415, 0, 0, 0, 1, 1,
-1.083028, 0.7295688, -1.256291, 0, 0, 0, 1, 1,
-1.082233, 0.6532196, -0.529231, 0, 0, 0, 1, 1,
-1.074176, 0.3552861, -2.557296, 0, 0, 0, 1, 1,
-1.07076, -0.4171678, -2.657116, 1, 1, 1, 1, 1,
-1.065592, 0.07086212, -1.992574, 1, 1, 1, 1, 1,
-1.065089, -1.738567, -1.625319, 1, 1, 1, 1, 1,
-1.053493, -0.5342476, -2.165874, 1, 1, 1, 1, 1,
-1.052628, 0.711042, 1.281038, 1, 1, 1, 1, 1,
-1.049399, 0.5555885, -1.910626, 1, 1, 1, 1, 1,
-1.048573, 1.037946, -1.462699, 1, 1, 1, 1, 1,
-1.048002, -1.801109, -2.87122, 1, 1, 1, 1, 1,
-1.040497, 1.058824, -0.7507071, 1, 1, 1, 1, 1,
-1.039015, -0.6530959, -1.009066, 1, 1, 1, 1, 1,
-1.024428, 0.5260732, -1.674024, 1, 1, 1, 1, 1,
-1.022197, 1.315714, 0.8329768, 1, 1, 1, 1, 1,
-1.017955, 0.09622303, -3.01555, 1, 1, 1, 1, 1,
-1.011436, -0.6544324, -3.174269, 1, 1, 1, 1, 1,
-1.001044, -0.1290215, -1.096922, 1, 1, 1, 1, 1,
-0.9947411, 0.1919843, -0.9185278, 0, 0, 1, 1, 1,
-0.9864168, 0.3105439, -0.7313722, 1, 0, 0, 1, 1,
-0.9831746, 1.200758, -0.9495065, 1, 0, 0, 1, 1,
-0.9792137, -0.6121321, -2.500352, 1, 0, 0, 1, 1,
-0.9749727, -0.2629968, -0.8092119, 1, 0, 0, 1, 1,
-0.9744419, -0.4473607, -2.567696, 1, 0, 0, 1, 1,
-0.9627783, 0.4417343, -1.701859, 0, 0, 0, 1, 1,
-0.960052, -0.839832, -4.651501, 0, 0, 0, 1, 1,
-0.9549065, -0.02973067, -1.653364, 0, 0, 0, 1, 1,
-0.9465157, 2.928613, -1.217362, 0, 0, 0, 1, 1,
-0.9356592, 0.513195, -0.05835323, 0, 0, 0, 1, 1,
-0.9323986, -1.05253, -2.431818, 0, 0, 0, 1, 1,
-0.9256885, -0.06897707, -0.764744, 0, 0, 0, 1, 1,
-0.9251897, -0.3408248, -2.443033, 1, 1, 1, 1, 1,
-0.9235762, 0.5060447, -1.51746, 1, 1, 1, 1, 1,
-0.9162145, 2.768996, 0.7077335, 1, 1, 1, 1, 1,
-0.915614, -0.3402383, -2.262579, 1, 1, 1, 1, 1,
-0.898536, -0.3115705, -2.360251, 1, 1, 1, 1, 1,
-0.8963854, -0.2230277, -1.076833, 1, 1, 1, 1, 1,
-0.8961757, -0.4953848, -1.059078, 1, 1, 1, 1, 1,
-0.8877739, -0.5176524, -3.329895, 1, 1, 1, 1, 1,
-0.8874323, 0.2162451, -0.5540485, 1, 1, 1, 1, 1,
-0.8868619, 0.1823084, -1.076156, 1, 1, 1, 1, 1,
-0.8759443, -0.8609491, -2.23438, 1, 1, 1, 1, 1,
-0.8739966, 0.72176, -2.019907, 1, 1, 1, 1, 1,
-0.86962, 1.387877, -0.2677697, 1, 1, 1, 1, 1,
-0.8651904, -0.04085081, -1.485441, 1, 1, 1, 1, 1,
-0.8574166, 1.374569, -0.2354227, 1, 1, 1, 1, 1,
-0.8447235, 0.3423322, -1.233174, 0, 0, 1, 1, 1,
-0.8406075, -2.323267, -3.3541, 1, 0, 0, 1, 1,
-0.8397343, 0.2125287, -1.282356, 1, 0, 0, 1, 1,
-0.8383118, 0.2410908, -3.234953, 1, 0, 0, 1, 1,
-0.8362346, 0.996429, -1.728682, 1, 0, 0, 1, 1,
-0.8314241, -0.5124307, -0.5988371, 1, 0, 0, 1, 1,
-0.8292009, 0.2080538, -3.491628, 0, 0, 0, 1, 1,
-0.8243636, 0.1478389, -0.501552, 0, 0, 0, 1, 1,
-0.8196574, -0.4495312, -0.6611397, 0, 0, 0, 1, 1,
-0.8176724, 0.3808387, -2.205567, 0, 0, 0, 1, 1,
-0.8172109, 0.5388736, -1.033383, 0, 0, 0, 1, 1,
-0.8146148, 0.03205483, -3.363815, 0, 0, 0, 1, 1,
-0.8121668, 0.4471456, -2.737603, 0, 0, 0, 1, 1,
-0.8036379, 0.03527563, -0.2695429, 1, 1, 1, 1, 1,
-0.7929053, 1.448905, -0.005553536, 1, 1, 1, 1, 1,
-0.7873455, 0.7474543, -2.404472, 1, 1, 1, 1, 1,
-0.7842007, 0.3739499, -0.7793667, 1, 1, 1, 1, 1,
-0.7798393, 0.007917585, -0.6211105, 1, 1, 1, 1, 1,
-0.7717142, 0.7287591, -1.258803, 1, 1, 1, 1, 1,
-0.7677358, -0.9757987, -0.2040537, 1, 1, 1, 1, 1,
-0.7654113, -0.1925898, -1.870502, 1, 1, 1, 1, 1,
-0.7646219, 1.464639, -0.2024804, 1, 1, 1, 1, 1,
-0.7607592, 1.679985, -1.509844, 1, 1, 1, 1, 1,
-0.7547329, 1.608589, -0.3727529, 1, 1, 1, 1, 1,
-0.7541644, -0.3552819, -0.843982, 1, 1, 1, 1, 1,
-0.7483328, -0.1842303, -1.434352, 1, 1, 1, 1, 1,
-0.7480238, -2.979599, -3.059017, 1, 1, 1, 1, 1,
-0.7479828, 2.286461, -1.096103, 1, 1, 1, 1, 1,
-0.7466068, 2.50516, -0.4279406, 0, 0, 1, 1, 1,
-0.737565, -1.727821, -2.298228, 1, 0, 0, 1, 1,
-0.7318134, -0.5759028, -4.2396, 1, 0, 0, 1, 1,
-0.730922, -0.9121369, -0.6348017, 1, 0, 0, 1, 1,
-0.727111, 0.9006765, -0.517707, 1, 0, 0, 1, 1,
-0.7270199, -1.632527, -2.93863, 1, 0, 0, 1, 1,
-0.7210499, -1.730908, -1.426585, 0, 0, 0, 1, 1,
-0.720613, 0.1625974, -0.766012, 0, 0, 0, 1, 1,
-0.7180032, -0.9647284, -3.603526, 0, 0, 0, 1, 1,
-0.7170446, 0.6138887, -0.4955528, 0, 0, 0, 1, 1,
-0.7168109, 0.1549183, -2.647375, 0, 0, 0, 1, 1,
-0.7105829, 2.236696, -1.957194, 0, 0, 0, 1, 1,
-0.701306, -0.9429886, -3.865426, 0, 0, 0, 1, 1,
-0.6902527, -0.2726896, -0.1236959, 1, 1, 1, 1, 1,
-0.6855124, -1.449338, -4.534921, 1, 1, 1, 1, 1,
-0.684988, 0.8750442, -0.6400846, 1, 1, 1, 1, 1,
-0.6811479, 0.3215851, -0.7646394, 1, 1, 1, 1, 1,
-0.6801782, -0.9793932, -1.979971, 1, 1, 1, 1, 1,
-0.6796674, 0.1129436, -1.656307, 1, 1, 1, 1, 1,
-0.6787255, 1.706019, 0.2647324, 1, 1, 1, 1, 1,
-0.6721123, -0.3098888, -2.9692, 1, 1, 1, 1, 1,
-0.6684477, -1.220901, -2.234601, 1, 1, 1, 1, 1,
-0.6642056, 0.0542483, 0.6440158, 1, 1, 1, 1, 1,
-0.6601701, -1.227737, -0.7965311, 1, 1, 1, 1, 1,
-0.6600925, 1.340038, -0.6726322, 1, 1, 1, 1, 1,
-0.654469, 1.22765, -0.7284534, 1, 1, 1, 1, 1,
-0.6538146, -0.8754189, -2.081627, 1, 1, 1, 1, 1,
-0.6518919, -1.385935, -2.911003, 1, 1, 1, 1, 1,
-0.6518398, -0.4321141, -2.833834, 0, 0, 1, 1, 1,
-0.6455604, -0.8326916, -2.214296, 1, 0, 0, 1, 1,
-0.6450396, 1.106769, -1.707239, 1, 0, 0, 1, 1,
-0.6432108, -0.7671168, -1.390345, 1, 0, 0, 1, 1,
-0.6422053, 0.9252914, -0.1448097, 1, 0, 0, 1, 1,
-0.6390598, -1.86673, -3.063486, 1, 0, 0, 1, 1,
-0.6377923, 0.3532811, -0.9317688, 0, 0, 0, 1, 1,
-0.6363119, 0.555342, -1.477414, 0, 0, 0, 1, 1,
-0.6350002, 0.8087168, -0.8026767, 0, 0, 0, 1, 1,
-0.633193, 0.8818626, -2.506632, 0, 0, 0, 1, 1,
-0.6285702, -0.7412154, -3.09611, 0, 0, 0, 1, 1,
-0.6266456, -2.488037, -1.47884, 0, 0, 0, 1, 1,
-0.6245695, -0.3596393, -4.016356, 0, 0, 0, 1, 1,
-0.6220753, -1.50373, -1.239292, 1, 1, 1, 1, 1,
-0.618038, -0.3467522, -1.062555, 1, 1, 1, 1, 1,
-0.6075825, -0.06897147, -1.400947, 1, 1, 1, 1, 1,
-0.6042811, -1.566223, -3.969303, 1, 1, 1, 1, 1,
-0.6012675, 0.8431252, -1.03521, 1, 1, 1, 1, 1,
-0.6008811, -0.4841144, -3.116227, 1, 1, 1, 1, 1,
-0.6006144, 2.374315, -0.1538614, 1, 1, 1, 1, 1,
-0.5999194, -0.636394, -2.368776, 1, 1, 1, 1, 1,
-0.5941513, -0.4353334, -1.952723, 1, 1, 1, 1, 1,
-0.592595, -2.695693, -3.547233, 1, 1, 1, 1, 1,
-0.5916582, 0.7620498, -0.4497258, 1, 1, 1, 1, 1,
-0.5906846, -0.4991014, -0.8580484, 1, 1, 1, 1, 1,
-0.5902444, -0.3695018, -2.370295, 1, 1, 1, 1, 1,
-0.5872501, -0.5522949, -1.403251, 1, 1, 1, 1, 1,
-0.5860776, 0.5160115, -3.310158, 1, 1, 1, 1, 1,
-0.5838383, 1.918584, -0.4621419, 0, 0, 1, 1, 1,
-0.5744382, 0.2829616, -1.895557, 1, 0, 0, 1, 1,
-0.5686711, -1.239482, -2.247015, 1, 0, 0, 1, 1,
-0.5672531, -2.112457, -2.514782, 1, 0, 0, 1, 1,
-0.563579, -0.696909, -0.03324691, 1, 0, 0, 1, 1,
-0.5575786, 1.109605, -0.8778044, 1, 0, 0, 1, 1,
-0.5477768, -0.5857156, -1.286663, 0, 0, 0, 1, 1,
-0.5458128, 0.2630109, -1.907475, 0, 0, 0, 1, 1,
-0.537057, -0.9458303, -2.460163, 0, 0, 0, 1, 1,
-0.5302762, 1.125993, -0.6841709, 0, 0, 0, 1, 1,
-0.5286658, 0.02423118, -1.360424, 0, 0, 0, 1, 1,
-0.5236492, -0.3292227, -1.649832, 0, 0, 0, 1, 1,
-0.5231865, 1.373796, -1.852937, 0, 0, 0, 1, 1,
-0.5171417, -0.2205547, -3.117258, 1, 1, 1, 1, 1,
-0.5170181, 0.248385, -1.520487, 1, 1, 1, 1, 1,
-0.5167429, -0.4136424, -3.638075, 1, 1, 1, 1, 1,
-0.5138629, 1.08863, 0.8055362, 1, 1, 1, 1, 1,
-0.5114389, -1.084683, -2.095066, 1, 1, 1, 1, 1,
-0.5095087, -0.6321733, -2.032548, 1, 1, 1, 1, 1,
-0.5048084, -0.6865548, -2.488884, 1, 1, 1, 1, 1,
-0.4913757, 1.113263, -0.3512107, 1, 1, 1, 1, 1,
-0.4892493, -1.205651, -0.7359225, 1, 1, 1, 1, 1,
-0.488855, -0.2803313, -2.52575, 1, 1, 1, 1, 1,
-0.4858962, -0.6271275, -3.072028, 1, 1, 1, 1, 1,
-0.482933, 0.5192906, -1.308918, 1, 1, 1, 1, 1,
-0.4825536, 1.042519, -0.6282127, 1, 1, 1, 1, 1,
-0.4753168, -0.1366237, -3.228276, 1, 1, 1, 1, 1,
-0.4710516, -0.7253485, -3.66329, 1, 1, 1, 1, 1,
-0.4690486, -0.3384096, -2.745458, 0, 0, 1, 1, 1,
-0.4623004, 0.3422938, -0.6601574, 1, 0, 0, 1, 1,
-0.4622564, -0.3293021, -0.1876512, 1, 0, 0, 1, 1,
-0.4588177, 1.298689, -0.8166348, 1, 0, 0, 1, 1,
-0.4558513, -0.08734959, -3.432717, 1, 0, 0, 1, 1,
-0.4539505, -0.7863111, -0.06982215, 1, 0, 0, 1, 1,
-0.4535889, -1.090604, -2.568241, 0, 0, 0, 1, 1,
-0.4500514, 0.05746689, -3.447592, 0, 0, 0, 1, 1,
-0.4478366, 1.8662, -1.05826, 0, 0, 0, 1, 1,
-0.4465168, 0.01961042, -3.512182, 0, 0, 0, 1, 1,
-0.4419733, -0.2874235, -1.293854, 0, 0, 0, 1, 1,
-0.4408733, 1.521685, -0.01379042, 0, 0, 0, 1, 1,
-0.439083, -0.4879775, -4.057823, 0, 0, 0, 1, 1,
-0.4317247, 0.3290998, -1.204357, 1, 1, 1, 1, 1,
-0.4314222, -1.190251, -4.492302, 1, 1, 1, 1, 1,
-0.4256606, -0.3397503, -3.66394, 1, 1, 1, 1, 1,
-0.420781, 0.6987977, 0.5286382, 1, 1, 1, 1, 1,
-0.4145994, -0.3211386, -3.670285, 1, 1, 1, 1, 1,
-0.4101355, -0.1700513, -2.836315, 1, 1, 1, 1, 1,
-0.409964, -0.7616989, -1.99948, 1, 1, 1, 1, 1,
-0.4096605, 0.06641164, -3.297826, 1, 1, 1, 1, 1,
-0.4027001, -1.133718, -2.01153, 1, 1, 1, 1, 1,
-0.3993268, -0.9930788, -1.715688, 1, 1, 1, 1, 1,
-0.3979256, -0.2468468, -2.379467, 1, 1, 1, 1, 1,
-0.3943861, -1.134538, -2.882059, 1, 1, 1, 1, 1,
-0.3928101, 2.379582, 0.7459524, 1, 1, 1, 1, 1,
-0.3911195, 1.126311, -0.3729236, 1, 1, 1, 1, 1,
-0.3884797, -0.8152767, -1.021965, 1, 1, 1, 1, 1,
-0.385388, 0.6319458, -2.203229, 0, 0, 1, 1, 1,
-0.3843696, 1.396921, -1.009201, 1, 0, 0, 1, 1,
-0.3842795, 1.290079, -0.01036658, 1, 0, 0, 1, 1,
-0.3751527, -1.404918, -2.594422, 1, 0, 0, 1, 1,
-0.3660488, -0.6170911, -3.752464, 1, 0, 0, 1, 1,
-0.3657512, -0.1737936, -2.568954, 1, 0, 0, 1, 1,
-0.3644667, 0.815627, 0.102925, 0, 0, 0, 1, 1,
-0.3544926, -0.9801923, -2.90934, 0, 0, 0, 1, 1,
-0.3536201, -0.1602291, -3.107752, 0, 0, 0, 1, 1,
-0.3525237, 0.7727304, -0.8842105, 0, 0, 0, 1, 1,
-0.3525142, -0.1523685, -2.007174, 0, 0, 0, 1, 1,
-0.3525063, -1.064854, -3.146041, 0, 0, 0, 1, 1,
-0.3517309, -1.044197, -4.168337, 0, 0, 0, 1, 1,
-0.3509396, 1.724651, 0.02060365, 1, 1, 1, 1, 1,
-0.3500605, 0.4099297, -0.9215072, 1, 1, 1, 1, 1,
-0.34707, -1.293647, -3.705515, 1, 1, 1, 1, 1,
-0.3440983, 1.419758, -0.8384342, 1, 1, 1, 1, 1,
-0.3435134, 0.9908367, 1.505789, 1, 1, 1, 1, 1,
-0.342004, -1.271077, -3.44834, 1, 1, 1, 1, 1,
-0.3386692, -0.01948731, -2.774589, 1, 1, 1, 1, 1,
-0.3385781, -0.7641045, -2.405269, 1, 1, 1, 1, 1,
-0.336474, 0.7274641, -0.6936164, 1, 1, 1, 1, 1,
-0.3310246, 0.6356992, 0.009934923, 1, 1, 1, 1, 1,
-0.3266606, 0.0521353, -1.619653, 1, 1, 1, 1, 1,
-0.3241403, 0.455736, -0.4964592, 1, 1, 1, 1, 1,
-0.3178014, 0.7631171, -1.414564, 1, 1, 1, 1, 1,
-0.314145, -1.062481, -2.594761, 1, 1, 1, 1, 1,
-0.3139705, -1.643416, -2.401612, 1, 1, 1, 1, 1,
-0.3120563, -1.408023, -3.95903, 0, 0, 1, 1, 1,
-0.309046, -1.425807, -3.703379, 1, 0, 0, 1, 1,
-0.3043347, 1.590313, 1.695296, 1, 0, 0, 1, 1,
-0.3039528, 0.6969653, 1.017823, 1, 0, 0, 1, 1,
-0.2974804, -0.922103, -2.023165, 1, 0, 0, 1, 1,
-0.2971694, 1.13159, -0.6702961, 1, 0, 0, 1, 1,
-0.2927657, 2.466097, -0.6627448, 0, 0, 0, 1, 1,
-0.2922987, -0.3422969, -2.543813, 0, 0, 0, 1, 1,
-0.290213, 0.3603151, -0.9753273, 0, 0, 0, 1, 1,
-0.2899013, -0.2074529, -1.962662, 0, 0, 0, 1, 1,
-0.2822062, 1.369717, -0.9168889, 0, 0, 0, 1, 1,
-0.276805, 1.381407, -0.320004, 0, 0, 0, 1, 1,
-0.2735636, 1.408251, -0.9196259, 0, 0, 0, 1, 1,
-0.2729909, -0.4320142, -2.556144, 1, 1, 1, 1, 1,
-0.2710655, 1.507126, -0.6256391, 1, 1, 1, 1, 1,
-0.2685849, 0.5052935, 0.4332125, 1, 1, 1, 1, 1,
-0.2658823, 1.18247, 1.376229, 1, 1, 1, 1, 1,
-0.2640422, -2.042126, -2.341691, 1, 1, 1, 1, 1,
-0.2625813, 0.3911231, -1.726581, 1, 1, 1, 1, 1,
-0.2610449, 0.4432367, -0.9821541, 1, 1, 1, 1, 1,
-0.2600698, -1.953129, -2.639673, 1, 1, 1, 1, 1,
-0.2594255, -0.008309201, -0.7115669, 1, 1, 1, 1, 1,
-0.2586932, -0.07659264, -3.272834, 1, 1, 1, 1, 1,
-0.2584855, -0.5037662, -3.428314, 1, 1, 1, 1, 1,
-0.2525993, 0.462993, 0.09027296, 1, 1, 1, 1, 1,
-0.2387356, 0.7880925, -2.221575, 1, 1, 1, 1, 1,
-0.2362896, 0.3989074, 0.6315337, 1, 1, 1, 1, 1,
-0.2304767, -1.281958, -4.061454, 1, 1, 1, 1, 1,
-0.2303551, 0.6022511, -0.1812428, 0, 0, 1, 1, 1,
-0.2239144, -0.5353363, -2.815285, 1, 0, 0, 1, 1,
-0.2226947, -0.3595696, -2.935866, 1, 0, 0, 1, 1,
-0.2218549, -0.7406138, -3.414919, 1, 0, 0, 1, 1,
-0.2215595, -0.516664, -3.000576, 1, 0, 0, 1, 1,
-0.2176081, 0.5316034, -1.097602, 1, 0, 0, 1, 1,
-0.2148187, -0.6322085, -2.012256, 0, 0, 0, 1, 1,
-0.2118431, 0.8864558, -0.5762213, 0, 0, 0, 1, 1,
-0.2094353, 0.4816497, -2.017188, 0, 0, 0, 1, 1,
-0.2089804, -1.022202, -1.974204, 0, 0, 0, 1, 1,
-0.208448, 0.1580977, 1.094868, 0, 0, 0, 1, 1,
-0.198036, 0.3539162, -1.006269, 0, 0, 0, 1, 1,
-0.1951602, -0.979547, -2.885541, 0, 0, 0, 1, 1,
-0.194757, 1.330607, -1.195118, 1, 1, 1, 1, 1,
-0.194624, 0.5521064, 0.1733332, 1, 1, 1, 1, 1,
-0.1796456, 0.7881137, -1.710901, 1, 1, 1, 1, 1,
-0.1783812, -0.6021162, -1.679644, 1, 1, 1, 1, 1,
-0.1773184, 0.1118648, -3.385321, 1, 1, 1, 1, 1,
-0.1773047, -0.05501585, -1.565579, 1, 1, 1, 1, 1,
-0.1762366, -0.653909, -1.965099, 1, 1, 1, 1, 1,
-0.1749852, 1.375324, 1.397149, 1, 1, 1, 1, 1,
-0.1722321, -0.02578005, -2.853887, 1, 1, 1, 1, 1,
-0.1721378, -2.631585, -2.666094, 1, 1, 1, 1, 1,
-0.1690033, -0.7047336, -3.69912, 1, 1, 1, 1, 1,
-0.1651584, 0.4986901, 1.313428, 1, 1, 1, 1, 1,
-0.161081, 0.4157183, -0.7840311, 1, 1, 1, 1, 1,
-0.1579225, 0.1578934, -0.1831238, 1, 1, 1, 1, 1,
-0.1567965, -1.241156, -3.031687, 1, 1, 1, 1, 1,
-0.1552346, 2.603555, 0.4713728, 0, 0, 1, 1, 1,
-0.1516882, 1.081859, -1.869185, 1, 0, 0, 1, 1,
-0.1505097, 0.1627346, 1.873655, 1, 0, 0, 1, 1,
-0.1466396, -1.108776, -3.387861, 1, 0, 0, 1, 1,
-0.1417064, 0.3499244, -2.321033, 1, 0, 0, 1, 1,
-0.1414514, 0.464234, 0.3802683, 1, 0, 0, 1, 1,
-0.1403001, 0.5088262, 1.52193, 0, 0, 0, 1, 1,
-0.1380427, -0.1670405, -3.68844, 0, 0, 0, 1, 1,
-0.1324071, 0.004922079, -1.004047, 0, 0, 0, 1, 1,
-0.1309628, -0.2890288, -2.262667, 0, 0, 0, 1, 1,
-0.125839, 0.6607038, -0.648484, 0, 0, 0, 1, 1,
-0.1255161, -1.488153, -0.8327682, 0, 0, 0, 1, 1,
-0.1182217, -0.9354565, -1.992486, 0, 0, 0, 1, 1,
-0.1169614, 2.552724, -0.02661575, 1, 1, 1, 1, 1,
-0.1160038, -0.9614052, -2.32319, 1, 1, 1, 1, 1,
-0.1138462, -0.8054771, -3.482116, 1, 1, 1, 1, 1,
-0.1111852, 0.3024789, 0.8399424, 1, 1, 1, 1, 1,
-0.1060372, 0.272045, 0.1267625, 1, 1, 1, 1, 1,
-0.1038816, 0.2165031, 1.264932, 1, 1, 1, 1, 1,
-0.1022309, 0.1785067, 0.04733525, 1, 1, 1, 1, 1,
-0.1013853, -0.5025738, -3.278212, 1, 1, 1, 1, 1,
-0.1011681, 0.1509558, -1.374306, 1, 1, 1, 1, 1,
-0.0995734, -0.3914517, -2.344415, 1, 1, 1, 1, 1,
-0.09095198, -0.2086773, -2.835182, 1, 1, 1, 1, 1,
-0.08942077, 0.7330469, 0.9349679, 1, 1, 1, 1, 1,
-0.0842944, -0.208723, -1.732024, 1, 1, 1, 1, 1,
-0.0813894, -1.01961, -3.190023, 1, 1, 1, 1, 1,
-0.07539253, 0.4517974, 0.5553244, 1, 1, 1, 1, 1,
-0.071982, -1.767618, -2.166475, 0, 0, 1, 1, 1,
-0.06767882, -1.215921, -2.417661, 1, 0, 0, 1, 1,
-0.06216178, -0.8791629, -3.533063, 1, 0, 0, 1, 1,
-0.06168219, 0.4521343, 2.129504, 1, 0, 0, 1, 1,
-0.06066383, 0.2218379, -1.150229, 1, 0, 0, 1, 1,
-0.06035964, -0.1080989, -3.8505, 1, 0, 0, 1, 1,
-0.05792909, -1.136305, -2.874846, 0, 0, 0, 1, 1,
-0.05509604, 1.063153, 0.1040887, 0, 0, 0, 1, 1,
-0.05297137, -0.8975765, -1.90129, 0, 0, 0, 1, 1,
-0.05046176, -0.0459904, -1.370304, 0, 0, 0, 1, 1,
-0.0496157, -0.08571003, -2.743748, 0, 0, 0, 1, 1,
-0.04874191, 0.805004, 0.4681987, 0, 0, 0, 1, 1,
-0.0450718, -0.9235851, -3.383013, 0, 0, 0, 1, 1,
-0.04386639, -0.8856814, -1.670829, 1, 1, 1, 1, 1,
-0.04312987, 1.299182, -0.3192649, 1, 1, 1, 1, 1,
-0.04310394, 1.600118, 0.6193501, 1, 1, 1, 1, 1,
-0.0415904, 0.5997974, 1.449014, 1, 1, 1, 1, 1,
-0.04104211, 1.308987, -1.029059, 1, 1, 1, 1, 1,
-0.04090781, -0.2461172, -2.993524, 1, 1, 1, 1, 1,
-0.03977833, 0.8144216, 0.1614945, 1, 1, 1, 1, 1,
-0.03167894, 2.006308, -0.593912, 1, 1, 1, 1, 1,
-0.03136873, -0.670943, -1.754331, 1, 1, 1, 1, 1,
-0.03002243, -0.162167, -1.548684, 1, 1, 1, 1, 1,
-0.02536053, -1.654772, -2.792983, 1, 1, 1, 1, 1,
-0.01828161, -0.6338396, -3.115621, 1, 1, 1, 1, 1,
-0.01723878, 1.068998, -1.278134, 1, 1, 1, 1, 1,
-0.01598089, 0.3460593, -1.184626, 1, 1, 1, 1, 1,
-0.01283368, -0.9341107, -3.353737, 1, 1, 1, 1, 1,
-0.009153593, -1.5062, -3.935271, 0, 0, 1, 1, 1,
-0.007611284, 0.8088127, -0.4748129, 1, 0, 0, 1, 1,
-0.002922539, 0.1808732, -0.377291, 1, 0, 0, 1, 1,
-0.002125073, -0.2701044, -3.121883, 1, 0, 0, 1, 1,
0.006768842, -0.003498925, 2.699652, 1, 0, 0, 1, 1,
0.007276417, 0.2565046, -0.7036527, 1, 0, 0, 1, 1,
0.00743832, -1.038103, 1.826252, 0, 0, 0, 1, 1,
0.007856818, -0.2067788, 0.7336022, 0, 0, 0, 1, 1,
0.008105963, -0.4048459, 3.689511, 0, 0, 0, 1, 1,
0.008201739, -1.290727, 1.505906, 0, 0, 0, 1, 1,
0.008990574, 0.85689, -1.005762, 0, 0, 0, 1, 1,
0.0115109, 1.071685, 0.7019628, 0, 0, 0, 1, 1,
0.01418433, -0.06557968, 3.514865, 0, 0, 0, 1, 1,
0.01544794, 0.1808578, 0.06557183, 1, 1, 1, 1, 1,
0.01872336, 1.309621, -0.4664891, 1, 1, 1, 1, 1,
0.02041221, -0.5528528, 3.924971, 1, 1, 1, 1, 1,
0.0226322, -0.3821517, 4.335418, 1, 1, 1, 1, 1,
0.02325913, -0.8485, 3.35563, 1, 1, 1, 1, 1,
0.02616694, -0.5259952, 5.474905, 1, 1, 1, 1, 1,
0.02794587, 0.0631192, -0.3014579, 1, 1, 1, 1, 1,
0.02875376, 1.274909, 1.399363, 1, 1, 1, 1, 1,
0.0343484, 0.6759657, -2.259171, 1, 1, 1, 1, 1,
0.03671711, -0.05900899, 3.10446, 1, 1, 1, 1, 1,
0.03843393, 0.5827417, -1.989461, 1, 1, 1, 1, 1,
0.04197995, 0.7862855, 1.386911, 1, 1, 1, 1, 1,
0.04320321, 0.4700007, 0.207306, 1, 1, 1, 1, 1,
0.04485584, -1.42098, 4.325779, 1, 1, 1, 1, 1,
0.04559603, 0.8376917, -0.9759018, 1, 1, 1, 1, 1,
0.04574661, 0.05838197, 0.8128775, 0, 0, 1, 1, 1,
0.05217306, -0.6179529, 3.625868, 1, 0, 0, 1, 1,
0.05438383, 2.191863, 0.3848804, 1, 0, 0, 1, 1,
0.062585, -0.8703524, 2.249059, 1, 0, 0, 1, 1,
0.06362127, 0.3943242, -2.362174, 1, 0, 0, 1, 1,
0.06568427, -1.133257, 2.748501, 1, 0, 0, 1, 1,
0.06628235, 0.6676357, 1.43676, 0, 0, 0, 1, 1,
0.06857388, 1.094735, 0.1749469, 0, 0, 0, 1, 1,
0.07017763, -1.009531, 2.950896, 0, 0, 0, 1, 1,
0.07087131, 0.03300181, 0.4789916, 0, 0, 0, 1, 1,
0.07214256, -1.352076, 2.350008, 0, 0, 0, 1, 1,
0.07282406, 0.08087788, 1.866175, 0, 0, 0, 1, 1,
0.07552695, 1.267877, 0.8784802, 0, 0, 0, 1, 1,
0.07754989, 0.2790202, -0.03779842, 1, 1, 1, 1, 1,
0.08386996, -1.145048, 2.631387, 1, 1, 1, 1, 1,
0.08453154, -1.052265, 4.228721, 1, 1, 1, 1, 1,
0.08588637, 0.5399861, -0.4329655, 1, 1, 1, 1, 1,
0.0926043, -1.054972, 3.06877, 1, 1, 1, 1, 1,
0.09289162, -0.1550589, 1.798064, 1, 1, 1, 1, 1,
0.09456368, -0.006943212, 1.716198, 1, 1, 1, 1, 1,
0.09993605, 0.114009, -0.02848415, 1, 1, 1, 1, 1,
0.1033681, -0.5578051, 2.192072, 1, 1, 1, 1, 1,
0.1045341, -1.091007, 2.753002, 1, 1, 1, 1, 1,
0.1053539, 0.3682332, -0.07636204, 1, 1, 1, 1, 1,
0.106743, -0.1563088, 1.437739, 1, 1, 1, 1, 1,
0.1077639, -1.008704, 5.044211, 1, 1, 1, 1, 1,
0.1106097, 1.925314, 0.7736632, 1, 1, 1, 1, 1,
0.1169264, -1.188627, 2.783453, 1, 1, 1, 1, 1,
0.123852, -0.5301089, 4.170903, 0, 0, 1, 1, 1,
0.1251415, -0.7068213, 2.087725, 1, 0, 0, 1, 1,
0.1255247, -0.8330273, 5.353281, 1, 0, 0, 1, 1,
0.1259637, -0.05651994, 1.490527, 1, 0, 0, 1, 1,
0.129591, -1.73754, 3.50235, 1, 0, 0, 1, 1,
0.14227, -0.2115847, 2.247267, 1, 0, 0, 1, 1,
0.1429826, 0.4070768, 1.040196, 0, 0, 0, 1, 1,
0.1432067, -0.3314211, 3.244484, 0, 0, 0, 1, 1,
0.1454405, -0.09476924, 2.096565, 0, 0, 0, 1, 1,
0.1468611, 0.04963779, 0.8419532, 0, 0, 0, 1, 1,
0.1472135, 0.2741203, 2.556344, 0, 0, 0, 1, 1,
0.1487738, -1.28126, 3.259406, 0, 0, 0, 1, 1,
0.1502059, 1.268271, 1.863023, 0, 0, 0, 1, 1,
0.1524031, -0.773353, 3.16243, 1, 1, 1, 1, 1,
0.1528322, -0.2727631, 2.640598, 1, 1, 1, 1, 1,
0.1575919, -1.238093, 2.113922, 1, 1, 1, 1, 1,
0.1576119, -1.458674, 2.757155, 1, 1, 1, 1, 1,
0.1613629, -1.005386, 3.474011, 1, 1, 1, 1, 1,
0.1625844, 0.7189896, -0.3755808, 1, 1, 1, 1, 1,
0.1637755, -0.8406166, 4.248215, 1, 1, 1, 1, 1,
0.166923, 0.3496903, -0.2055274, 1, 1, 1, 1, 1,
0.1717052, -0.4060282, 3.849879, 1, 1, 1, 1, 1,
0.1757656, 1.738671, 0.08066819, 1, 1, 1, 1, 1,
0.1768554, 0.2681662, -0.3083513, 1, 1, 1, 1, 1,
0.1805313, -1.678493, 3.344456, 1, 1, 1, 1, 1,
0.1842083, -0.9011589, 2.363375, 1, 1, 1, 1, 1,
0.1904174, 1.975011, 0.6073493, 1, 1, 1, 1, 1,
0.2000899, 1.594934, -2.339815, 1, 1, 1, 1, 1,
0.2001321, -1.241092, 3.435684, 0, 0, 1, 1, 1,
0.2008173, 0.1488889, 1.888179, 1, 0, 0, 1, 1,
0.2094998, -0.09207863, 2.237946, 1, 0, 0, 1, 1,
0.2107906, 0.1539184, 1.753851, 1, 0, 0, 1, 1,
0.2125659, -1.85399, 4.701823, 1, 0, 0, 1, 1,
0.2136712, -0.6607506, 3.267713, 1, 0, 0, 1, 1,
0.2143476, 1.405946, 1.003227, 0, 0, 0, 1, 1,
0.2174156, 0.5477456, -0.6932445, 0, 0, 0, 1, 1,
0.219718, -1.116652, 3.793648, 0, 0, 0, 1, 1,
0.2200888, -0.4183706, 1.945049, 0, 0, 0, 1, 1,
0.2212873, -1.038211, 1.762381, 0, 0, 0, 1, 1,
0.2234336, 2.224561, 2.082498, 0, 0, 0, 1, 1,
0.2265283, 0.08533988, 0.9511014, 0, 0, 0, 1, 1,
0.226668, 0.2893683, 0.6584216, 1, 1, 1, 1, 1,
0.2270981, -0.7030096, 2.871047, 1, 1, 1, 1, 1,
0.2288549, 0.2237903, 2.2908, 1, 1, 1, 1, 1,
0.2310857, 1.377264, -0.6796241, 1, 1, 1, 1, 1,
0.2338, 1.317186, -0.5681718, 1, 1, 1, 1, 1,
0.2356703, -0.8642653, 4.055898, 1, 1, 1, 1, 1,
0.238727, -1.296587, 3.020692, 1, 1, 1, 1, 1,
0.2388723, 0.9288286, 0.03587342, 1, 1, 1, 1, 1,
0.2429103, 0.8805928, 1.301125, 1, 1, 1, 1, 1,
0.2464828, -2.486983, 1.285101, 1, 1, 1, 1, 1,
0.247951, 0.2659113, 0.9415106, 1, 1, 1, 1, 1,
0.2497944, -1.202157, 2.649421, 1, 1, 1, 1, 1,
0.2531765, 1.405606, 0.6197292, 1, 1, 1, 1, 1,
0.2537586, -0.2432275, 1.703876, 1, 1, 1, 1, 1,
0.2549323, 0.03520811, 1.074452, 1, 1, 1, 1, 1,
0.2587855, -1.881887, 0.8137654, 0, 0, 1, 1, 1,
0.2597435, -0.08320092, 1.301568, 1, 0, 0, 1, 1,
0.2649868, -1.053421, 4.388818, 1, 0, 0, 1, 1,
0.2654836, -0.1566008, 3.033314, 1, 0, 0, 1, 1,
0.2667294, 0.3221672, 1.037739, 1, 0, 0, 1, 1,
0.2684375, 1.026423, 0.7697278, 1, 0, 0, 1, 1,
0.2727841, -0.2760421, 3.346797, 0, 0, 0, 1, 1,
0.2741265, 0.1119323, 0.2567235, 0, 0, 0, 1, 1,
0.2757146, -0.9401934, 3.889755, 0, 0, 0, 1, 1,
0.2761252, -0.3115457, 3.527894, 0, 0, 0, 1, 1,
0.2801583, 0.04312813, 0.2524702, 0, 0, 0, 1, 1,
0.2827923, -0.5498865, 2.325498, 0, 0, 0, 1, 1,
0.2882698, -0.756263, 3.322926, 0, 0, 0, 1, 1,
0.2883633, -0.8761063, 2.558149, 1, 1, 1, 1, 1,
0.2925763, 1.675448, -0.399543, 1, 1, 1, 1, 1,
0.2954361, -0.5210185, 1.937558, 1, 1, 1, 1, 1,
0.2969051, -0.3078514, 1.554094, 1, 1, 1, 1, 1,
0.2970114, 0.6887751, -0.1487844, 1, 1, 1, 1, 1,
0.2992774, 0.0997021, 1.354691, 1, 1, 1, 1, 1,
0.3022566, 0.9594517, -1.040379, 1, 1, 1, 1, 1,
0.3062388, 0.4820763, -1.287168, 1, 1, 1, 1, 1,
0.3063115, 0.4186896, 2.453806, 1, 1, 1, 1, 1,
0.3080837, 0.09256229, 0.8145785, 1, 1, 1, 1, 1,
0.3163823, -0.6712534, 1.064258, 1, 1, 1, 1, 1,
0.3235358, 0.1122846, 0.8817811, 1, 1, 1, 1, 1,
0.3238815, 0.7612902, 0.3597832, 1, 1, 1, 1, 1,
0.3240383, -0.07591121, 2.210514, 1, 1, 1, 1, 1,
0.3290858, 1.439154, 0.3136731, 1, 1, 1, 1, 1,
0.335364, -0.9984065, 3.659696, 0, 0, 1, 1, 1,
0.3398606, -1.405845, 3.337056, 1, 0, 0, 1, 1,
0.3400265, 0.8820151, 1.343317, 1, 0, 0, 1, 1,
0.3436545, -1.086362, 1.913647, 1, 0, 0, 1, 1,
0.34416, -0.01210032, 2.013417, 1, 0, 0, 1, 1,
0.3470322, -0.456225, 2.33359, 1, 0, 0, 1, 1,
0.3475717, -0.6459988, 3.936426, 0, 0, 0, 1, 1,
0.3555505, 0.1739513, 0.01669522, 0, 0, 0, 1, 1,
0.3555672, -0.264139, 1.873926, 0, 0, 0, 1, 1,
0.3565209, -0.5650858, 2.160797, 0, 0, 0, 1, 1,
0.3606437, -0.3282068, 2.399179, 0, 0, 0, 1, 1,
0.3656514, 0.5962111, -0.6958297, 0, 0, 0, 1, 1,
0.3663927, -0.188854, 1.338538, 0, 0, 0, 1, 1,
0.369672, -2.0981, 1.951332, 1, 1, 1, 1, 1,
0.3718384, 2.49865, 0.8313557, 1, 1, 1, 1, 1,
0.3723255, 0.3758408, 0.1097563, 1, 1, 1, 1, 1,
0.3730446, -1.787949, 3.099529, 1, 1, 1, 1, 1,
0.3783778, 0.3632984, 3.34112, 1, 1, 1, 1, 1,
0.3798345, 0.329558, -0.615419, 1, 1, 1, 1, 1,
0.3803223, 0.8887002, 0.5765042, 1, 1, 1, 1, 1,
0.3835316, 0.6939816, -1.415742, 1, 1, 1, 1, 1,
0.3840984, 1.272009, 1.098138, 1, 1, 1, 1, 1,
0.3852871, -0.2513636, 1.418371, 1, 1, 1, 1, 1,
0.3880183, 0.8161637, 2.062054, 1, 1, 1, 1, 1,
0.3915427, -0.0954434, 1.751006, 1, 1, 1, 1, 1,
0.3943001, -0.05246001, 2.403584, 1, 1, 1, 1, 1,
0.3949209, 2.229952, 0.4599705, 1, 1, 1, 1, 1,
0.3977859, -0.3371415, 0.9046409, 1, 1, 1, 1, 1,
0.398938, -0.3690579, 3.462898, 0, 0, 1, 1, 1,
0.404294, 1.700881, 2.181295, 1, 0, 0, 1, 1,
0.4074182, 0.4109882, 1.698281, 1, 0, 0, 1, 1,
0.4126336, -1.280634, 1.410665, 1, 0, 0, 1, 1,
0.4205368, 1.285409, 0.8904876, 1, 0, 0, 1, 1,
0.4211145, -0.7171773, 4.260959, 1, 0, 0, 1, 1,
0.4221793, -0.4295885, 1.16631, 0, 0, 0, 1, 1,
0.4275246, -1.373234, 3.19372, 0, 0, 0, 1, 1,
0.4283208, 0.787426, 0.223044, 0, 0, 0, 1, 1,
0.4302924, 0.09537122, 0.5159012, 0, 0, 0, 1, 1,
0.4307946, -0.6833376, 3.109947, 0, 0, 0, 1, 1,
0.4313953, -0.2418662, 3.310822, 0, 0, 0, 1, 1,
0.4321943, -0.2239254, 2.310323, 0, 0, 0, 1, 1,
0.4350093, 0.3191991, -0.4476572, 1, 1, 1, 1, 1,
0.4433102, -0.8976467, 1.543473, 1, 1, 1, 1, 1,
0.4453993, 0.4837225, 0.9513953, 1, 1, 1, 1, 1,
0.4466025, 1.353993, 0.2634181, 1, 1, 1, 1, 1,
0.4466436, -1.298123, 5.721598, 1, 1, 1, 1, 1,
0.4500094, 1.688699, -1.870445, 1, 1, 1, 1, 1,
0.4537619, -0.1918995, 0.9638513, 1, 1, 1, 1, 1,
0.4539633, 0.8197914, -0.2829712, 1, 1, 1, 1, 1,
0.4543048, -0.07640968, 1.165658, 1, 1, 1, 1, 1,
0.4561058, -0.02149483, 2.24542, 1, 1, 1, 1, 1,
0.4653696, 0.770117, 0.9390072, 1, 1, 1, 1, 1,
0.4678544, 0.4408647, 0.2655672, 1, 1, 1, 1, 1,
0.4682252, 0.2421072, 1.48112, 1, 1, 1, 1, 1,
0.4688211, -0.7543721, 3.385493, 1, 1, 1, 1, 1,
0.4708529, 0.06870126, 1.068602, 1, 1, 1, 1, 1,
0.4754598, -0.4927529, 2.878836, 0, 0, 1, 1, 1,
0.4764577, 1.270995, 0.0220712, 1, 0, 0, 1, 1,
0.4769184, 0.1476738, 1.821471, 1, 0, 0, 1, 1,
0.477373, -0.2174016, 1.28558, 1, 0, 0, 1, 1,
0.4833432, 2.395067, -0.4161774, 1, 0, 0, 1, 1,
0.4862202, -1.929234, 3.439754, 1, 0, 0, 1, 1,
0.4866539, 1.590047, 0.317453, 0, 0, 0, 1, 1,
0.4876294, -1.078994, 2.978048, 0, 0, 0, 1, 1,
0.4887153, -0.2451913, 0.7563327, 0, 0, 0, 1, 1,
0.491634, -0.1174822, 1.528383, 0, 0, 0, 1, 1,
0.4917675, -0.8549005, 4.716876, 0, 0, 0, 1, 1,
0.4954211, -0.02270681, 1.123412, 0, 0, 0, 1, 1,
0.4964274, -2.401561, 2.680739, 0, 0, 0, 1, 1,
0.5045763, -0.1156771, 1.423273, 1, 1, 1, 1, 1,
0.5071017, -0.1398698, 4.72475, 1, 1, 1, 1, 1,
0.5135927, -0.871605, 1.061897, 1, 1, 1, 1, 1,
0.5139727, 0.366461, 2.699634, 1, 1, 1, 1, 1,
0.5232805, 1.631774, 0.06371091, 1, 1, 1, 1, 1,
0.5249917, 0.9079652, 0.5985908, 1, 1, 1, 1, 1,
0.5367282, 0.6589187, 0.03034229, 1, 1, 1, 1, 1,
0.5379894, -0.008555141, 1.233063, 1, 1, 1, 1, 1,
0.5466325, 1.88957, -0.372122, 1, 1, 1, 1, 1,
0.5496953, 0.7575251, 0.4752636, 1, 1, 1, 1, 1,
0.5547225, 0.8846915, -0.695932, 1, 1, 1, 1, 1,
0.5553702, 0.6169237, -0.5692025, 1, 1, 1, 1, 1,
0.5599058, -0.4924968, 2.123961, 1, 1, 1, 1, 1,
0.5683981, 0.529978, 0.8713562, 1, 1, 1, 1, 1,
0.5692812, -0.09030408, 2.222594, 1, 1, 1, 1, 1,
0.5694677, -0.6025743, 0.4577919, 0, 0, 1, 1, 1,
0.5707021, 0.4112262, 2.573265, 1, 0, 0, 1, 1,
0.5710202, -0.2281945, 2.054699, 1, 0, 0, 1, 1,
0.5721179, -1.18824, 3.483456, 1, 0, 0, 1, 1,
0.572293, -0.8100777, 2.239334, 1, 0, 0, 1, 1,
0.5761139, -1.120596, 1.16125, 1, 0, 0, 1, 1,
0.577287, -0.8949586, 1.521705, 0, 0, 0, 1, 1,
0.5803331, 0.5351284, 1.108112, 0, 0, 0, 1, 1,
0.5822235, -1.021592, 1.181899, 0, 0, 0, 1, 1,
0.5824291, 1.286561, -1.363883, 0, 0, 0, 1, 1,
0.5868327, 0.504379, -1.164624, 0, 0, 0, 1, 1,
0.5905752, -1.068557, 2.440225, 0, 0, 0, 1, 1,
0.59335, 1.328768, -1.388334, 0, 0, 0, 1, 1,
0.5972589, -2.018055, 3.447378, 1, 1, 1, 1, 1,
0.5999409, -1.54481, 1.10081, 1, 1, 1, 1, 1,
0.6050767, 0.7850589, 1.73551, 1, 1, 1, 1, 1,
0.6089966, -1.307005, 2.262462, 1, 1, 1, 1, 1,
0.6117861, 0.5460176, 0.5168767, 1, 1, 1, 1, 1,
0.6248335, -1.513833, 3.490129, 1, 1, 1, 1, 1,
0.625517, 1.245767, -0.02783712, 1, 1, 1, 1, 1,
0.6281539, -0.6389968, 2.077381, 1, 1, 1, 1, 1,
0.6321378, -1.055055, 1.359498, 1, 1, 1, 1, 1,
0.6361591, 0.3807905, 0.9957507, 1, 1, 1, 1, 1,
0.6403828, -0.6914609, 2.317427, 1, 1, 1, 1, 1,
0.6405935, -0.0301713, 2.627193, 1, 1, 1, 1, 1,
0.6496454, 0.3818698, 1.92816, 1, 1, 1, 1, 1,
0.6507227, 2.269659, 0.2333829, 1, 1, 1, 1, 1,
0.6516893, -1.438799, 2.144719, 1, 1, 1, 1, 1,
0.6526105, 0.6522646, -0.263941, 0, 0, 1, 1, 1,
0.6533897, -1.858482, 2.229746, 1, 0, 0, 1, 1,
0.6732945, -0.6226935, 1.512328, 1, 0, 0, 1, 1,
0.6771597, 0.08064658, 0.7742108, 1, 0, 0, 1, 1,
0.6801259, 0.1643244, 0.3510002, 1, 0, 0, 1, 1,
0.682031, 0.7060755, 1.171757, 1, 0, 0, 1, 1,
0.6821114, 1.322966, -0.7560099, 0, 0, 0, 1, 1,
0.6851475, 0.6716417, 1.431343, 0, 0, 0, 1, 1,
0.6855139, 0.5976661, 0.893486, 0, 0, 0, 1, 1,
0.6904628, 1.091716, 0.6306723, 0, 0, 0, 1, 1,
0.6955397, 1.045535, 1.445804, 0, 0, 0, 1, 1,
0.6985098, -1.076396, 3.574259, 0, 0, 0, 1, 1,
0.7023519, 1.347564, 0.6693072, 0, 0, 0, 1, 1,
0.7027768, -1.626821, 1.892073, 1, 1, 1, 1, 1,
0.7060864, 0.9362785, 2.046878, 1, 1, 1, 1, 1,
0.7071106, -0.9488428, 3.388986, 1, 1, 1, 1, 1,
0.7106336, -0.02050933, 1.771698, 1, 1, 1, 1, 1,
0.7137921, -0.6121207, 2.596483, 1, 1, 1, 1, 1,
0.7159521, -1.420561, 2.331291, 1, 1, 1, 1, 1,
0.7188026, -1.578271, 2.496974, 1, 1, 1, 1, 1,
0.7254077, -0.1115144, 1.826204, 1, 1, 1, 1, 1,
0.7274942, -1.473512, 3.628408, 1, 1, 1, 1, 1,
0.7275324, 1.255408, 0.1593873, 1, 1, 1, 1, 1,
0.7285625, -0.7817096, 1.697328, 1, 1, 1, 1, 1,
0.7351035, -0.4614441, 2.516157, 1, 1, 1, 1, 1,
0.7371197, -0.3447103, 0.5867941, 1, 1, 1, 1, 1,
0.7402245, 0.01690779, 0.6809167, 1, 1, 1, 1, 1,
0.7416146, 0.914511, 1.195949, 1, 1, 1, 1, 1,
0.748188, 0.2088664, 0.6451896, 0, 0, 1, 1, 1,
0.7499635, -0.3094573, 0.9519247, 1, 0, 0, 1, 1,
0.7511285, -1.510765, 2.66856, 1, 0, 0, 1, 1,
0.752172, 1.076336, -0.6405593, 1, 0, 0, 1, 1,
0.7589301, -0.7238564, 1.998243, 1, 0, 0, 1, 1,
0.7607039, 0.5043657, 0.3769167, 1, 0, 0, 1, 1,
0.7647519, -0.5966678, 2.267417, 0, 0, 0, 1, 1,
0.7751514, -1.23938, 3.182222, 0, 0, 0, 1, 1,
0.7772684, 0.8559443, -0.2061276, 0, 0, 0, 1, 1,
0.777469, 0.6388324, 2.278977, 0, 0, 0, 1, 1,
0.7786331, -0.0241428, 1.94431, 0, 0, 0, 1, 1,
0.7804293, 0.1009869, 1.404335, 0, 0, 0, 1, 1,
0.7834807, 0.0554098, 2.385014, 0, 0, 0, 1, 1,
0.7887555, 0.341314, 1.571523, 1, 1, 1, 1, 1,
0.7977358, -0.6965787, 3.490782, 1, 1, 1, 1, 1,
0.7996938, 0.3049743, 0.4282762, 1, 1, 1, 1, 1,
0.8073972, 0.2385689, 1.269047, 1, 1, 1, 1, 1,
0.8082357, -0.346884, 2.252573, 1, 1, 1, 1, 1,
0.8092579, -1.237156, 3.580291, 1, 1, 1, 1, 1,
0.8126758, 0.5689386, 0.504862, 1, 1, 1, 1, 1,
0.8146035, -1.673855, 2.746044, 1, 1, 1, 1, 1,
0.8167035, -0.6060622, 3.547646, 1, 1, 1, 1, 1,
0.8268723, -0.6300801, 3.586766, 1, 1, 1, 1, 1,
0.8319414, -1.470295, 0.6470071, 1, 1, 1, 1, 1,
0.8360821, -0.3630467, 1.528269, 1, 1, 1, 1, 1,
0.8395917, 0.6636181, 0.7539946, 1, 1, 1, 1, 1,
0.8489029, -0.447578, 2.482969, 1, 1, 1, 1, 1,
0.8499097, -0.05869433, 1.422441, 1, 1, 1, 1, 1,
0.8523299, 1.354652, 0.0652843, 0, 0, 1, 1, 1,
0.8560469, -1.534714, 5.006734, 1, 0, 0, 1, 1,
0.8581077, 0.2618713, 1.439487, 1, 0, 0, 1, 1,
0.8600975, -0.4038313, 3.851737, 1, 0, 0, 1, 1,
0.8616384, -0.6010191, 1.207522, 1, 0, 0, 1, 1,
0.8679537, -0.2206885, 2.020215, 1, 0, 0, 1, 1,
0.8697249, 1.792977, 1.062449, 0, 0, 0, 1, 1,
0.8712634, 1.294469, -0.458474, 0, 0, 0, 1, 1,
0.8718798, 0.4362634, 1.302953, 0, 0, 0, 1, 1,
0.8721294, -0.5604723, 3.375664, 0, 0, 0, 1, 1,
0.8723266, 0.2096353, 0.6138868, 0, 0, 0, 1, 1,
0.8761486, 0.447104, 2.035623, 0, 0, 0, 1, 1,
0.8792683, 0.1565807, 3.032447, 0, 0, 0, 1, 1,
0.8814083, -1.091634, 2.415999, 1, 1, 1, 1, 1,
0.8838271, 0.7520379, 1.257022, 1, 1, 1, 1, 1,
0.884445, -0.9071046, 3.315239, 1, 1, 1, 1, 1,
0.8845807, -1.145164, 3.904466, 1, 1, 1, 1, 1,
0.8849863, -0.4142912, 3.449143, 1, 1, 1, 1, 1,
0.8859072, 0.7917708, 1.5812, 1, 1, 1, 1, 1,
0.887324, -0.2960085, 1.722606, 1, 1, 1, 1, 1,
0.8885499, -0.7497635, 2.890046, 1, 1, 1, 1, 1,
0.8895643, 0.1209647, 0.8022588, 1, 1, 1, 1, 1,
0.89065, -1.653218, 1.856992, 1, 1, 1, 1, 1,
0.8930786, 0.209002, 0.8734493, 1, 1, 1, 1, 1,
0.9023358, 0.1421068, 1.344609, 1, 1, 1, 1, 1,
0.9047298, -2.076626, 2.866836, 1, 1, 1, 1, 1,
0.9081756, -0.2484491, 2.747843, 1, 1, 1, 1, 1,
0.9097151, 0.7667425, -0.6012319, 1, 1, 1, 1, 1,
0.9111046, -0.5081768, 1.475209, 0, 0, 1, 1, 1,
0.9259322, -2.003253, 3.056776, 1, 0, 0, 1, 1,
0.9294414, -1.204984, 1.878333, 1, 0, 0, 1, 1,
0.9325143, 0.1963641, 2.071512, 1, 0, 0, 1, 1,
0.93423, -1.235041, 0.7894945, 1, 0, 0, 1, 1,
0.9358078, 0.1018848, 0.03615373, 1, 0, 0, 1, 1,
0.9403616, -0.7123888, 4.766506, 0, 0, 0, 1, 1,
0.9412253, -1.103949, 1.868191, 0, 0, 0, 1, 1,
0.9426455, 0.3685263, 1.753384, 0, 0, 0, 1, 1,
0.9440576, 2.127077, 0.817929, 0, 0, 0, 1, 1,
0.9470698, -0.2220974, 0.9159683, 0, 0, 0, 1, 1,
0.9567632, 0.1943249, 1.295424, 0, 0, 0, 1, 1,
0.9580577, -1.59957, 0.9088622, 0, 0, 0, 1, 1,
0.9674892, -1.912127, 4.616876, 1, 1, 1, 1, 1,
0.9688671, -0.1243109, 0.8068247, 1, 1, 1, 1, 1,
0.9740521, 1.741944, -1.584394, 1, 1, 1, 1, 1,
0.9788857, 0.05450684, 0.8808557, 1, 1, 1, 1, 1,
0.9800143, -0.162298, 1.175087, 1, 1, 1, 1, 1,
0.9836413, -1.676392, 2.020163, 1, 1, 1, 1, 1,
0.9844558, -0.263869, 2.48451, 1, 1, 1, 1, 1,
0.995642, 0.7009385, -0.8403429, 1, 1, 1, 1, 1,
0.9957527, -0.209854, 1.14529, 1, 1, 1, 1, 1,
0.9962065, -1.354492, 3.229783, 1, 1, 1, 1, 1,
1.00322, -1.028419, 3.458583, 1, 1, 1, 1, 1,
1.005993, 0.3587445, 1.357422, 1, 1, 1, 1, 1,
1.009191, 1.112579, 0.6881557, 1, 1, 1, 1, 1,
1.010073, 0.37432, -0.4712794, 1, 1, 1, 1, 1,
1.015049, -0.06084982, 1.501389, 1, 1, 1, 1, 1,
1.016259, -0.3409488, 2.979365, 0, 0, 1, 1, 1,
1.016927, -1.495507, 3.40157, 1, 0, 0, 1, 1,
1.020051, -1.874716, 1.880006, 1, 0, 0, 1, 1,
1.030181, 0.3132091, 1.414486, 1, 0, 0, 1, 1,
1.032883, -1.152761, 2.821563, 1, 0, 0, 1, 1,
1.0342, 0.4201537, 1.504125, 1, 0, 0, 1, 1,
1.034813, 4.067172, -1.449446, 0, 0, 0, 1, 1,
1.035127, 0.09436253, 3.716742, 0, 0, 0, 1, 1,
1.037021, 0.06063516, 2.312718, 0, 0, 0, 1, 1,
1.043584, 0.89774, 3.288731, 0, 0, 0, 1, 1,
1.043647, -0.7985562, 2.727665, 0, 0, 0, 1, 1,
1.047319, -1.18059, 2.535667, 0, 0, 0, 1, 1,
1.052478, -0.05689653, 0.7009513, 0, 0, 0, 1, 1,
1.05818, 2.165965, 0.4620198, 1, 1, 1, 1, 1,
1.058525, 1.298736, 2.039131, 1, 1, 1, 1, 1,
1.071892, -2.046087, 2.337706, 1, 1, 1, 1, 1,
1.088452, 1.270181, -0.2494994, 1, 1, 1, 1, 1,
1.093313, 0.1302057, 1.177047, 1, 1, 1, 1, 1,
1.099677, 0.6360604, 0.6429763, 1, 1, 1, 1, 1,
1.111395, -0.05982652, 2.479025, 1, 1, 1, 1, 1,
1.115496, 0.5525894, 1.864867, 1, 1, 1, 1, 1,
1.120838, 0.1122306, 2.608311, 1, 1, 1, 1, 1,
1.122189, 1.201249, 1.618956, 1, 1, 1, 1, 1,
1.128886, 0.4272734, -0.511541, 1, 1, 1, 1, 1,
1.134474, -0.7602798, 3.005051, 1, 1, 1, 1, 1,
1.150459, -1.683615, 3.457237, 1, 1, 1, 1, 1,
1.157786, 1.70506, 1.146944, 1, 1, 1, 1, 1,
1.161504, -2.551714, 2.587649, 1, 1, 1, 1, 1,
1.1637, 0.1550271, 1.269296, 0, 0, 1, 1, 1,
1.170813, -0.03591655, 1.386604, 1, 0, 0, 1, 1,
1.173614, -0.2150114, 4.351698, 1, 0, 0, 1, 1,
1.178947, 0.7889547, 2.640193, 1, 0, 0, 1, 1,
1.187048, -0.01267864, 0.2129039, 1, 0, 0, 1, 1,
1.19092, 0.7768326, -0.06327803, 1, 0, 0, 1, 1,
1.211433, 0.2625626, 0.2865313, 0, 0, 0, 1, 1,
1.216273, -1.999475, 2.105728, 0, 0, 0, 1, 1,
1.222783, 1.089258, -0.3626245, 0, 0, 0, 1, 1,
1.223484, -1.695547, 2.079037, 0, 0, 0, 1, 1,
1.225148, -0.540737, 2.04213, 0, 0, 0, 1, 1,
1.228186, 1.000275, 1.643707, 0, 0, 0, 1, 1,
1.231091, 0.1577791, 1.331448, 0, 0, 0, 1, 1,
1.231373, -0.06294354, 0.5962185, 1, 1, 1, 1, 1,
1.233957, -0.0179749, 0.221781, 1, 1, 1, 1, 1,
1.244827, 0.4235179, 2.066357, 1, 1, 1, 1, 1,
1.253868, 0.6856385, 0.8972101, 1, 1, 1, 1, 1,
1.264817, -0.07000595, 0.871339, 1, 1, 1, 1, 1,
1.267207, -1.519234, 1.813817, 1, 1, 1, 1, 1,
1.267852, 0.1932883, 1.250803, 1, 1, 1, 1, 1,
1.270142, 1.282044, 1.953104, 1, 1, 1, 1, 1,
1.273898, -1.016249, 2.808395, 1, 1, 1, 1, 1,
1.290199, 1.78649, 0.5014569, 1, 1, 1, 1, 1,
1.290525, 0.5802694, 2.723006, 1, 1, 1, 1, 1,
1.299146, -0.4777333, 1.986857, 1, 1, 1, 1, 1,
1.299496, 0.7592735, 0.5788741, 1, 1, 1, 1, 1,
1.304892, -0.3660728, 1.102811, 1, 1, 1, 1, 1,
1.305975, -0.5046862, 1.769826, 1, 1, 1, 1, 1,
1.307305, -1.050749, 2.242154, 0, 0, 1, 1, 1,
1.311573, -0.9009736, 1.204682, 1, 0, 0, 1, 1,
1.311639, 0.0188893, 0.7922418, 1, 0, 0, 1, 1,
1.319879, 0.0451464, 2.142951, 1, 0, 0, 1, 1,
1.320891, -0.002956826, 1.239703, 1, 0, 0, 1, 1,
1.322116, -2.067518, 3.676195, 1, 0, 0, 1, 1,
1.329258, -0.4200919, 2.601921, 0, 0, 0, 1, 1,
1.32975, 1.428438, 1.108148, 0, 0, 0, 1, 1,
1.339306, -0.6833831, 3.231643, 0, 0, 0, 1, 1,
1.346257, -0.9648567, 3.024115, 0, 0, 0, 1, 1,
1.34749, -0.801012, 2.088993, 0, 0, 0, 1, 1,
1.35152, 0.08944812, 1.595553, 0, 0, 0, 1, 1,
1.352862, 0.3133346, 0.162571, 0, 0, 0, 1, 1,
1.360559, -1.025422, 2.979504, 1, 1, 1, 1, 1,
1.36172, -0.2207983, 2.712537, 1, 1, 1, 1, 1,
1.366634, 0.2034085, 2.693922, 1, 1, 1, 1, 1,
1.375114, 0.4003171, 0.6510326, 1, 1, 1, 1, 1,
1.376366, -2.614394, 2.101796, 1, 1, 1, 1, 1,
1.400443, -0.9776655, 2.080616, 1, 1, 1, 1, 1,
1.414088, 0.3814976, 2.328539, 1, 1, 1, 1, 1,
1.425047, 1.374803, 0.5258609, 1, 1, 1, 1, 1,
1.425317, -0.4235315, 0.9110532, 1, 1, 1, 1, 1,
1.443574, -2.161885, 2.128664, 1, 1, 1, 1, 1,
1.445938, 1.010778, 0.8155939, 1, 1, 1, 1, 1,
1.44644, -0.5385336, 2.01044, 1, 1, 1, 1, 1,
1.455091, 1.015161, 1.764586, 1, 1, 1, 1, 1,
1.484911, -0.6041371, 3.128625, 1, 1, 1, 1, 1,
1.49897, 0.3826631, 1.983509, 1, 1, 1, 1, 1,
1.505675, -1.093306, 1.912336, 0, 0, 1, 1, 1,
1.507468, 1.20225, 1.437734, 1, 0, 0, 1, 1,
1.508512, -2.688725, 1.974541, 1, 0, 0, 1, 1,
1.531253, 0.1849854, 1.032671, 1, 0, 0, 1, 1,
1.538947, 0.914744, 3.094541, 1, 0, 0, 1, 1,
1.5424, -1.681073, 2.800184, 1, 0, 0, 1, 1,
1.567437, 0.9548543, 2.308866, 0, 0, 0, 1, 1,
1.567565, 0.897751, 1.004701, 0, 0, 0, 1, 1,
1.570565, -2.059306, 3.902946, 0, 0, 0, 1, 1,
1.578291, 0.248531, 0.8830261, 0, 0, 0, 1, 1,
1.583063, -0.2105895, 4.458014, 0, 0, 0, 1, 1,
1.587914, 0.1021323, 2.223083, 0, 0, 0, 1, 1,
1.593193, 0.08178983, 3.305798, 0, 0, 0, 1, 1,
1.603759, 0.07204255, 0.884281, 1, 1, 1, 1, 1,
1.606832, 1.241423, 0.7116842, 1, 1, 1, 1, 1,
1.609063, -0.6976395, 2.804661, 1, 1, 1, 1, 1,
1.616216, 0.1118107, 0.7416772, 1, 1, 1, 1, 1,
1.62591, 1.334964, 0.4782146, 1, 1, 1, 1, 1,
1.626279, -1.887776, 2.546674, 1, 1, 1, 1, 1,
1.634422, 2.021211, 2.351479, 1, 1, 1, 1, 1,
1.654815, -1.69796, 2.365993, 1, 1, 1, 1, 1,
1.65975, 0.009067643, 0.4959269, 1, 1, 1, 1, 1,
1.66032, -0.2407565, 2.441206, 1, 1, 1, 1, 1,
1.70014, -0.1801353, 0.8023682, 1, 1, 1, 1, 1,
1.729444, -0.488153, 1.492519, 1, 1, 1, 1, 1,
1.73241, 0.3460159, -0.3269444, 1, 1, 1, 1, 1,
1.742204, 0.4653075, 2.070287, 1, 1, 1, 1, 1,
1.747888, 0.01570716, 0.2310266, 1, 1, 1, 1, 1,
1.754376, 0.5905069, 0.2708007, 0, 0, 1, 1, 1,
1.756927, 0.7474918, 1.288427, 1, 0, 0, 1, 1,
1.762493, 0.2027098, 1.618567, 1, 0, 0, 1, 1,
1.772699, -1.081174, 3.26783, 1, 0, 0, 1, 1,
1.807024, 0.323594, 0.9987894, 1, 0, 0, 1, 1,
1.814436, 0.1372889, 2.60442, 1, 0, 0, 1, 1,
1.82675, 0.2846268, 2.902403, 0, 0, 0, 1, 1,
1.866464, -0.1557827, 1.86384, 0, 0, 0, 1, 1,
1.868797, -1.218571, 1.635983, 0, 0, 0, 1, 1,
1.873018, -0.753427, 1.781281, 0, 0, 0, 1, 1,
1.888194, -0.4726829, 0.7518024, 0, 0, 0, 1, 1,
1.890881, 1.93524, 1.723652, 0, 0, 0, 1, 1,
1.899237, 0.6620983, 0.7623552, 0, 0, 0, 1, 1,
1.900644, 1.062527, 2.11052, 1, 1, 1, 1, 1,
1.900965, 0.4906273, 2.438771, 1, 1, 1, 1, 1,
1.924717, 0.02279868, -0.697134, 1, 1, 1, 1, 1,
1.946199, 0.1503948, 3.27092, 1, 1, 1, 1, 1,
2.021426, 0.2020362, 2.097756, 1, 1, 1, 1, 1,
2.023815, -0.295709, -0.4853871, 1, 1, 1, 1, 1,
2.025016, 0.3880223, 1.213123, 1, 1, 1, 1, 1,
2.033044, 0.2961367, 1.607631, 1, 1, 1, 1, 1,
2.041993, -1.168993, 1.927289, 1, 1, 1, 1, 1,
2.063143, -0.6592039, 1.779313, 1, 1, 1, 1, 1,
2.127651, -0.6011729, 1.077371, 1, 1, 1, 1, 1,
2.12773, 1.376359, 1.305608, 1, 1, 1, 1, 1,
2.12867, 0.7730147, 2.265603, 1, 1, 1, 1, 1,
2.150586, 1.42304, 2.315511, 1, 1, 1, 1, 1,
2.151635, 0.228846, 0.1088599, 1, 1, 1, 1, 1,
2.172529, 0.578227, 2.603679, 0, 0, 1, 1, 1,
2.203868, -1.703058, 1.076031, 1, 0, 0, 1, 1,
2.236121, 1.191461, 2.528336, 1, 0, 0, 1, 1,
2.236195, 0.201894, 1.21785, 1, 0, 0, 1, 1,
2.283421, -0.9961304, 1.098979, 1, 0, 0, 1, 1,
2.292782, -0.980319, 1.172673, 1, 0, 0, 1, 1,
2.308627, 0.3639717, -0.1240056, 0, 0, 0, 1, 1,
2.32809, -0.2437772, 2.478441, 0, 0, 0, 1, 1,
2.352974, -0.3080829, 3.818722, 0, 0, 0, 1, 1,
2.381368, 0.3105038, 1.247565, 0, 0, 0, 1, 1,
2.406355, -0.9177234, 2.02293, 0, 0, 0, 1, 1,
2.449529, 1.36722, 1.504987, 0, 0, 0, 1, 1,
2.476136, -1.004385, 0.6424262, 0, 0, 0, 1, 1,
2.500446, -1.45063, 1.982995, 1, 1, 1, 1, 1,
2.556797, -0.1252497, 2.413659, 1, 1, 1, 1, 1,
2.625138, 0.8295861, 3.009145, 1, 1, 1, 1, 1,
2.661789, 0.7570937, 0.564621, 1, 1, 1, 1, 1,
2.896345, 0.7096777, 2.158318, 1, 1, 1, 1, 1,
3.070334, -1.155559, 1.760601, 1, 1, 1, 1, 1,
4.010176, 1.042925, 1.337776, 1, 1, 1, 1, 1
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
var radius = 9.857143;
var distance = 34.6228;
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
mvMatrix.translate( -0.3662758, -0.5437864, -0.5350487 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.6228);
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