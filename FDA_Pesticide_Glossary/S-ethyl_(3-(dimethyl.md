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
-3.207955, -0.5641151, -1.870171, 1, 0, 0, 1,
-3.058779, -0.05921254, 0.4346126, 1, 0.007843138, 0, 1,
-2.926347, 0.2790545, -0.1285727, 1, 0.01176471, 0, 1,
-2.758406, 1.410573, -2.244976, 1, 0.01960784, 0, 1,
-2.576955, -0.3799257, -2.007117, 1, 0.02352941, 0, 1,
-2.508892, -0.7544494, 0.1733586, 1, 0.03137255, 0, 1,
-2.408556, 0.5380588, 0.6749697, 1, 0.03529412, 0, 1,
-2.392628, 0.1904148, -1.803962, 1, 0.04313726, 0, 1,
-2.360219, 0.07199781, -3.588719, 1, 0.04705882, 0, 1,
-2.300034, -1.733777, -4.980772, 1, 0.05490196, 0, 1,
-2.213074, -0.888755, 0.4650009, 1, 0.05882353, 0, 1,
-2.20159, -1.303923, -0.8744859, 1, 0.06666667, 0, 1,
-2.193263, 1.635848, -1.06773, 1, 0.07058824, 0, 1,
-2.191044, 1.426389, -1.430712, 1, 0.07843138, 0, 1,
-2.152454, -0.428957, -1.554576, 1, 0.08235294, 0, 1,
-2.143282, 2.355378, -1.055463, 1, 0.09019608, 0, 1,
-2.133284, 1.175707, -0.3542941, 1, 0.09411765, 0, 1,
-2.132847, 1.254115, -0.1999577, 1, 0.1019608, 0, 1,
-2.109051, 0.1671777, -3.054539, 1, 0.1098039, 0, 1,
-2.002045, 1.896895, -0.3426484, 1, 0.1137255, 0, 1,
-1.984791, 0.1938871, -2.231991, 1, 0.1215686, 0, 1,
-1.972203, 1.104399, -0.01440445, 1, 0.1254902, 0, 1,
-1.964891, -0.08324573, -2.73007, 1, 0.1333333, 0, 1,
-1.962865, -1.79326, -2.009024, 1, 0.1372549, 0, 1,
-1.95199, 1.345086, -1.297737, 1, 0.145098, 0, 1,
-1.947791, 0.7745144, 0.7736418, 1, 0.1490196, 0, 1,
-1.938979, -0.7594976, -2.613215, 1, 0.1568628, 0, 1,
-1.938455, 0.607191, -1.499505, 1, 0.1607843, 0, 1,
-1.934902, 1.257623, -2.008193, 1, 0.1686275, 0, 1,
-1.924785, -1.133719, -2.210031, 1, 0.172549, 0, 1,
-1.924285, 1.115109, -3.067173, 1, 0.1803922, 0, 1,
-1.869643, 0.1206915, -1.4123, 1, 0.1843137, 0, 1,
-1.846202, 0.8829486, -2.321212, 1, 0.1921569, 0, 1,
-1.83709, 0.6291053, -0.9062776, 1, 0.1960784, 0, 1,
-1.821039, 0.1714263, -1.718909, 1, 0.2039216, 0, 1,
-1.807354, -0.8874936, -1.476914, 1, 0.2117647, 0, 1,
-1.79897, -2.331754, -2.917615, 1, 0.2156863, 0, 1,
-1.785722, -0.5384849, -0.8698157, 1, 0.2235294, 0, 1,
-1.778613, -0.4703422, -1.686847, 1, 0.227451, 0, 1,
-1.774837, -1.211804, -2.551128, 1, 0.2352941, 0, 1,
-1.765074, -0.8184322, -1.736177, 1, 0.2392157, 0, 1,
-1.759649, -1.55885, -1.388952, 1, 0.2470588, 0, 1,
-1.754397, 1.702263, -1.605056, 1, 0.2509804, 0, 1,
-1.745272, 1.042706, -2.271415, 1, 0.2588235, 0, 1,
-1.729348, 0.9144666, -0.5435063, 1, 0.2627451, 0, 1,
-1.728612, 0.1006327, -0.6726835, 1, 0.2705882, 0, 1,
-1.721573, 0.1804993, -3.098122, 1, 0.2745098, 0, 1,
-1.68563, -0.2734778, -1.639479, 1, 0.282353, 0, 1,
-1.676662, -0.2704215, -0.5630212, 1, 0.2862745, 0, 1,
-1.675343, -1.203556, -0.9642776, 1, 0.2941177, 0, 1,
-1.674882, -0.7481541, -0.1969993, 1, 0.3019608, 0, 1,
-1.674086, -0.3237209, -2.455084, 1, 0.3058824, 0, 1,
-1.668583, -0.9967688, -3.575033, 1, 0.3137255, 0, 1,
-1.650374, 0.2839745, 0.1352256, 1, 0.3176471, 0, 1,
-1.638805, 1.427352, -0.3171024, 1, 0.3254902, 0, 1,
-1.625601, 1.435499, -0.8396432, 1, 0.3294118, 0, 1,
-1.613307, -0.5106683, -0.2753841, 1, 0.3372549, 0, 1,
-1.613058, -0.333528, -2.262218, 1, 0.3411765, 0, 1,
-1.611203, 0.7726645, -1.607056, 1, 0.3490196, 0, 1,
-1.596861, -0.2050696, -1.511012, 1, 0.3529412, 0, 1,
-1.588522, 0.1382796, -2.654894, 1, 0.3607843, 0, 1,
-1.585325, -0.1069186, -2.039492, 1, 0.3647059, 0, 1,
-1.580839, 0.8184708, -0.6612062, 1, 0.372549, 0, 1,
-1.57756, -0.6147115, -1.76559, 1, 0.3764706, 0, 1,
-1.575841, -0.4900578, -2.638677, 1, 0.3843137, 0, 1,
-1.57478, 0.2702073, -1.723513, 1, 0.3882353, 0, 1,
-1.569814, 2.11379, -1.143909, 1, 0.3960784, 0, 1,
-1.562173, 0.3653449, -1.891131, 1, 0.4039216, 0, 1,
-1.556134, -0.01110473, -2.257116, 1, 0.4078431, 0, 1,
-1.551797, -0.5399457, -1.922917, 1, 0.4156863, 0, 1,
-1.543222, 1.0825, -0.246631, 1, 0.4196078, 0, 1,
-1.538474, -0.009673858, -1.879773, 1, 0.427451, 0, 1,
-1.529612, -0.3333398, -1.911313, 1, 0.4313726, 0, 1,
-1.520962, -0.2161463, -1.354118, 1, 0.4392157, 0, 1,
-1.517801, -1.007203, -1.795083, 1, 0.4431373, 0, 1,
-1.51683, -0.1208747, -2.47292, 1, 0.4509804, 0, 1,
-1.5079, 0.503562, -1.219321, 1, 0.454902, 0, 1,
-1.501491, -0.6774349, -2.269099, 1, 0.4627451, 0, 1,
-1.498794, 1.154247, -1.394891, 1, 0.4666667, 0, 1,
-1.487125, -0.7395493, -2.749538, 1, 0.4745098, 0, 1,
-1.471586, -0.5315643, -0.96806, 1, 0.4784314, 0, 1,
-1.442892, -0.7580141, -3.080123, 1, 0.4862745, 0, 1,
-1.438129, 0.1452911, -0.4611235, 1, 0.4901961, 0, 1,
-1.437403, 0.1488703, -2.946943, 1, 0.4980392, 0, 1,
-1.433008, 1.027928, -1.985761, 1, 0.5058824, 0, 1,
-1.431074, 0.2379695, -0.3979945, 1, 0.509804, 0, 1,
-1.427481, 1.22161, -3.293409, 1, 0.5176471, 0, 1,
-1.412473, 0.08426356, -0.9250408, 1, 0.5215687, 0, 1,
-1.408292, -0.3902622, -2.879316, 1, 0.5294118, 0, 1,
-1.4039, -0.6103284, -0.8631414, 1, 0.5333334, 0, 1,
-1.398181, 0.4825753, -1.873401, 1, 0.5411765, 0, 1,
-1.398161, 1.293596, 0.1645157, 1, 0.5450981, 0, 1,
-1.385749, 0.1351122, -1.723204, 1, 0.5529412, 0, 1,
-1.38541, 1.809969, -2.436513, 1, 0.5568628, 0, 1,
-1.384132, 0.3230848, -1.704943, 1, 0.5647059, 0, 1,
-1.381309, -2.221822, -1.787325, 1, 0.5686275, 0, 1,
-1.37482, 0.5795348, -1.335321, 1, 0.5764706, 0, 1,
-1.372266, 1.511939, -2.471855, 1, 0.5803922, 0, 1,
-1.353923, -0.08662555, -1.243084, 1, 0.5882353, 0, 1,
-1.351542, -1.260218, -2.760527, 1, 0.5921569, 0, 1,
-1.351176, -0.4473644, -1.790611, 1, 0.6, 0, 1,
-1.34763, 1.176974, -0.1498953, 1, 0.6078432, 0, 1,
-1.345751, -1.282461, -1.444647, 1, 0.6117647, 0, 1,
-1.340744, 0.1747706, -1.772816, 1, 0.6196079, 0, 1,
-1.335835, 0.2266911, -0.1659272, 1, 0.6235294, 0, 1,
-1.331928, -0.9818283, -1.833733, 1, 0.6313726, 0, 1,
-1.314295, -0.3814343, -1.608238, 1, 0.6352941, 0, 1,
-1.308063, -0.4063266, -0.53312, 1, 0.6431373, 0, 1,
-1.307137, -0.1111812, -0.5673596, 1, 0.6470588, 0, 1,
-1.290928, 0.04773884, -3.375033, 1, 0.654902, 0, 1,
-1.266828, -0.4816388, -2.00302, 1, 0.6588235, 0, 1,
-1.264853, 1.406544, -0.9695029, 1, 0.6666667, 0, 1,
-1.25164, -0.58607, -3.395555, 1, 0.6705883, 0, 1,
-1.250679, 0.1174498, -1.401711, 1, 0.6784314, 0, 1,
-1.235099, 1.271792, -0.4453767, 1, 0.682353, 0, 1,
-1.23507, 0.3488362, -2.305497, 1, 0.6901961, 0, 1,
-1.230086, 0.5409946, -0.2126056, 1, 0.6941177, 0, 1,
-1.227619, -0.5396743, -2.202665, 1, 0.7019608, 0, 1,
-1.213964, 0.2258231, -0.5592684, 1, 0.7098039, 0, 1,
-1.210872, -0.9171003, -2.249458, 1, 0.7137255, 0, 1,
-1.204767, 0.736736, -1.340018, 1, 0.7215686, 0, 1,
-1.201607, -0.2173269, -0.8687525, 1, 0.7254902, 0, 1,
-1.197616, 1.122715, 0.8906232, 1, 0.7333333, 0, 1,
-1.195813, -0.01930858, -2.394693, 1, 0.7372549, 0, 1,
-1.184926, -1.083281, -1.353415, 1, 0.7450981, 0, 1,
-1.182841, 0.000449929, -2.58396, 1, 0.7490196, 0, 1,
-1.180495, -1.698618, -1.359524, 1, 0.7568628, 0, 1,
-1.178522, 0.655414, -1.71499, 1, 0.7607843, 0, 1,
-1.167891, -1.688006, -1.397581, 1, 0.7686275, 0, 1,
-1.165758, -2.311838, -3.920083, 1, 0.772549, 0, 1,
-1.159615, -0.3807885, -1.630417, 1, 0.7803922, 0, 1,
-1.157063, 0.6639483, -1.077863, 1, 0.7843137, 0, 1,
-1.156568, -2.077431, -2.101858, 1, 0.7921569, 0, 1,
-1.151876, -0.1940375, -2.396533, 1, 0.7960784, 0, 1,
-1.147513, -0.6613454, -1.108012, 1, 0.8039216, 0, 1,
-1.146353, -0.2934071, 0.5187045, 1, 0.8117647, 0, 1,
-1.138213, 1.614248, -0.8654972, 1, 0.8156863, 0, 1,
-1.132325, -1.086974, -4.749755, 1, 0.8235294, 0, 1,
-1.119442, -0.3821771, -2.316154, 1, 0.827451, 0, 1,
-1.111697, -0.1026831, -1.149888, 1, 0.8352941, 0, 1,
-1.100207, 0.110273, -2.196005, 1, 0.8392157, 0, 1,
-1.098776, 0.8670371, -1.465368, 1, 0.8470588, 0, 1,
-1.090004, 0.5142885, -1.718797, 1, 0.8509804, 0, 1,
-1.062917, -0.6214243, -2.922862, 1, 0.8588235, 0, 1,
-1.06233, -0.2444049, -0.9808612, 1, 0.8627451, 0, 1,
-1.057487, 0.3547085, -2.471851, 1, 0.8705882, 0, 1,
-1.052855, 0.4569461, -1.590872, 1, 0.8745098, 0, 1,
-1.051436, -0.031513, -2.984923, 1, 0.8823529, 0, 1,
-1.050075, -0.3764125, -1.100575, 1, 0.8862745, 0, 1,
-1.048435, 0.3469655, -2.132713, 1, 0.8941177, 0, 1,
-1.043164, 0.5478404, -1.483539, 1, 0.8980392, 0, 1,
-1.042939, 0.8946611, -1.426831, 1, 0.9058824, 0, 1,
-1.031237, -0.8092859, -1.786164, 1, 0.9137255, 0, 1,
-1.026284, 0.6305495, -2.169169, 1, 0.9176471, 0, 1,
-1.023971, 0.5560884, -1.003213, 1, 0.9254902, 0, 1,
-1.021863, 1.170543, -3.578976e-05, 1, 0.9294118, 0, 1,
-1.021586, 0.2501783, -0.455819, 1, 0.9372549, 0, 1,
-1.021321, -0.3909444, -1.816064, 1, 0.9411765, 0, 1,
-1.017682, -1.013358, -4.008409, 1, 0.9490196, 0, 1,
-1.012601, -0.05281795, -0.7288713, 1, 0.9529412, 0, 1,
-1.007275, 0.4552185, -0.7652674, 1, 0.9607843, 0, 1,
-1.006933, 1.751274, -1.420581, 1, 0.9647059, 0, 1,
-0.9924045, -0.007084034, -1.980036, 1, 0.972549, 0, 1,
-0.9911325, -0.3371266, -0.3721524, 1, 0.9764706, 0, 1,
-0.9910687, -0.315686, -1.181312, 1, 0.9843137, 0, 1,
-0.9909169, -0.7111242, -1.841657, 1, 0.9882353, 0, 1,
-0.9812513, 0.02670811, -2.707146, 1, 0.9960784, 0, 1,
-0.9795087, -0.4938014, -1.528871, 0.9960784, 1, 0, 1,
-0.9699654, -0.4256774, -1.432313, 0.9921569, 1, 0, 1,
-0.9699092, 0.5323738, -1.768257, 0.9843137, 1, 0, 1,
-0.9661259, 0.004064398, -1.551033, 0.9803922, 1, 0, 1,
-0.9661138, 0.3797351, -1.433795, 0.972549, 1, 0, 1,
-0.9505208, -0.3877507, -1.49335, 0.9686275, 1, 0, 1,
-0.9502631, 0.4930427, -0.9230326, 0.9607843, 1, 0, 1,
-0.9474887, 0.488276, -0.8725274, 0.9568627, 1, 0, 1,
-0.941851, -0.6925668, -2.408889, 0.9490196, 1, 0, 1,
-0.9394693, -0.8626041, -3.486996, 0.945098, 1, 0, 1,
-0.9360521, 0.3698147, 0.06533488, 0.9372549, 1, 0, 1,
-0.9321324, 0.966794, -0.834725, 0.9333333, 1, 0, 1,
-0.9309748, 0.5235091, 0.1593571, 0.9254902, 1, 0, 1,
-0.9285434, -0.2596869, -0.4780501, 0.9215686, 1, 0, 1,
-0.9251984, -0.7174637, -1.60341, 0.9137255, 1, 0, 1,
-0.9249941, -0.9104695, -3.788379, 0.9098039, 1, 0, 1,
-0.9237329, -0.9633591, -2.968377, 0.9019608, 1, 0, 1,
-0.9224895, 0.8181382, 0.3948839, 0.8941177, 1, 0, 1,
-0.9212074, 0.6214375, -1.488289, 0.8901961, 1, 0, 1,
-0.920755, -0.9749796, -3.396457, 0.8823529, 1, 0, 1,
-0.9205797, 0.9363273, -1.978249, 0.8784314, 1, 0, 1,
-0.910975, 0.5196967, -0.2833286, 0.8705882, 1, 0, 1,
-0.9067676, -0.7776206, -1.758865, 0.8666667, 1, 0, 1,
-0.9067591, 2.469029, -1.216246, 0.8588235, 1, 0, 1,
-0.9012757, 0.2983207, -2.702022, 0.854902, 1, 0, 1,
-0.9002433, 0.3127539, -1.190755, 0.8470588, 1, 0, 1,
-0.8925096, 0.2706172, 0.3464476, 0.8431373, 1, 0, 1,
-0.89182, -1.849923, -1.556794, 0.8352941, 1, 0, 1,
-0.8873415, -1.678432, -4.533043, 0.8313726, 1, 0, 1,
-0.8863044, 0.5656354, -1.201719, 0.8235294, 1, 0, 1,
-0.8859857, 0.6349692, -2.214442, 0.8196079, 1, 0, 1,
-0.8848392, 0.02347055, -1.107128, 0.8117647, 1, 0, 1,
-0.8770911, -0.3324347, -2.789831, 0.8078431, 1, 0, 1,
-0.870448, 0.5144782, -2.748134, 0.8, 1, 0, 1,
-0.869045, 0.4248988, 0.466181, 0.7921569, 1, 0, 1,
-0.8657256, 0.3961897, -2.216397, 0.7882353, 1, 0, 1,
-0.8654706, -1.342268, -3.44523, 0.7803922, 1, 0, 1,
-0.8649568, -1.893453, -2.416884, 0.7764706, 1, 0, 1,
-0.8608914, 0.9716876, -0.3205488, 0.7686275, 1, 0, 1,
-0.8545836, 0.2502221, -2.526767, 0.7647059, 1, 0, 1,
-0.8512275, 0.1873364, -0.941921, 0.7568628, 1, 0, 1,
-0.8499959, 0.8448809, -0.1018604, 0.7529412, 1, 0, 1,
-0.8464478, 0.4630742, -1.721962, 0.7450981, 1, 0, 1,
-0.8463028, 0.9398432, -1.009298, 0.7411765, 1, 0, 1,
-0.8446378, -0.1136543, 0.8073058, 0.7333333, 1, 0, 1,
-0.8338997, -0.5195925, -1.537672, 0.7294118, 1, 0, 1,
-0.8312913, 0.4394087, -0.7203419, 0.7215686, 1, 0, 1,
-0.8305463, -0.5344328, -1.748601, 0.7176471, 1, 0, 1,
-0.829634, 0.1702226, -1.710354, 0.7098039, 1, 0, 1,
-0.8227925, 0.6801043, -0.02384132, 0.7058824, 1, 0, 1,
-0.8207231, -0.9926661, -3.277847, 0.6980392, 1, 0, 1,
-0.8198074, -0.160956, -2.668978, 0.6901961, 1, 0, 1,
-0.8185219, 0.8591617, -1.21888, 0.6862745, 1, 0, 1,
-0.8117425, -1.901018, -1.25492, 0.6784314, 1, 0, 1,
-0.8116983, 1.250467, -1.04331, 0.6745098, 1, 0, 1,
-0.8059955, 1.64358, 0.1014571, 0.6666667, 1, 0, 1,
-0.8015152, -0.9849218, -4.047825, 0.6627451, 1, 0, 1,
-0.7964751, 0.7913878, -0.7094314, 0.654902, 1, 0, 1,
-0.7945932, -0.02079523, -0.6450922, 0.6509804, 1, 0, 1,
-0.7926005, -0.8563974, -2.422921, 0.6431373, 1, 0, 1,
-0.7891935, 1.422619, -0.2857795, 0.6392157, 1, 0, 1,
-0.7887425, -0.8972843, -2.874845, 0.6313726, 1, 0, 1,
-0.7872447, -1.434595, -2.839749, 0.627451, 1, 0, 1,
-0.7870461, -0.2511975, -1.130067, 0.6196079, 1, 0, 1,
-0.7822534, 1.351168, -0.6962306, 0.6156863, 1, 0, 1,
-0.7810283, 0.4249428, -1.662206, 0.6078432, 1, 0, 1,
-0.7804245, 0.9099321, -0.6358637, 0.6039216, 1, 0, 1,
-0.7767289, -0.7964895, -2.598698, 0.5960785, 1, 0, 1,
-0.7732533, 2.396527, -0.3851472, 0.5882353, 1, 0, 1,
-0.7690085, -0.06878159, -2.090518, 0.5843138, 1, 0, 1,
-0.7662724, -1.08899, -4.628163, 0.5764706, 1, 0, 1,
-0.7622053, 0.4527222, -0.7001725, 0.572549, 1, 0, 1,
-0.7618433, 0.957696, -0.6142788, 0.5647059, 1, 0, 1,
-0.7611893, 0.5135857, 0.5066479, 0.5607843, 1, 0, 1,
-0.7555165, -0.0969448, -0.2215324, 0.5529412, 1, 0, 1,
-0.7549335, -0.3096228, -2.335137, 0.5490196, 1, 0, 1,
-0.7545981, -0.5196978, -1.276865, 0.5411765, 1, 0, 1,
-0.7541474, -0.2041661, -1.573892, 0.5372549, 1, 0, 1,
-0.7538536, 0.8256593, -1.196725, 0.5294118, 1, 0, 1,
-0.7530355, 0.4474711, -0.527666, 0.5254902, 1, 0, 1,
-0.7495742, -1.742007, -2.262089, 0.5176471, 1, 0, 1,
-0.7477334, -1.365086, -2.400464, 0.5137255, 1, 0, 1,
-0.7419691, -0.947018, -1.98445, 0.5058824, 1, 0, 1,
-0.7393911, -1.039873, -4.223425, 0.5019608, 1, 0, 1,
-0.7260481, 0.3721577, -1.245549, 0.4941176, 1, 0, 1,
-0.723533, -0.1439873, -1.559188, 0.4862745, 1, 0, 1,
-0.7147759, 0.2714588, -1.036039, 0.4823529, 1, 0, 1,
-0.7088569, 1.586681, -0.2706952, 0.4745098, 1, 0, 1,
-0.704347, -0.1697434, -0.7554522, 0.4705882, 1, 0, 1,
-0.7039386, -0.6215718, -3.259385, 0.4627451, 1, 0, 1,
-0.6965947, 0.637042, -2.136032, 0.4588235, 1, 0, 1,
-0.6958908, -0.5850204, -1.316102, 0.4509804, 1, 0, 1,
-0.6953542, -0.6541144, -1.663264, 0.4470588, 1, 0, 1,
-0.6892697, -1.176885, -2.636003, 0.4392157, 1, 0, 1,
-0.6883643, -0.4360591, -1.96279, 0.4352941, 1, 0, 1,
-0.6865978, -0.3695273, -2.932418, 0.427451, 1, 0, 1,
-0.6832466, 1.13043, -1.292473, 0.4235294, 1, 0, 1,
-0.6831962, 0.5257518, -1.722848, 0.4156863, 1, 0, 1,
-0.6813756, -0.4295151, -1.324745, 0.4117647, 1, 0, 1,
-0.677748, 0.7547632, -0.3189074, 0.4039216, 1, 0, 1,
-0.6757829, -0.3192657, -1.162005, 0.3960784, 1, 0, 1,
-0.6665199, -2.331908, -2.861695, 0.3921569, 1, 0, 1,
-0.6640815, -0.2752941, -2.76519, 0.3843137, 1, 0, 1,
-0.6436229, -0.6584021, -4.744893, 0.3803922, 1, 0, 1,
-0.6435934, 0.7029526, -0.7823982, 0.372549, 1, 0, 1,
-0.6412153, 0.3794716, 0.134519, 0.3686275, 1, 0, 1,
-0.6376863, 0.8790451, -2.274568, 0.3607843, 1, 0, 1,
-0.6369133, 0.3612217, -1.646271, 0.3568628, 1, 0, 1,
-0.6339293, -0.02108203, -3.592888, 0.3490196, 1, 0, 1,
-0.6334658, -1.719466, -3.138432, 0.345098, 1, 0, 1,
-0.6315157, 1.103283, -0.8792697, 0.3372549, 1, 0, 1,
-0.6259922, 0.7002356, -1.390704, 0.3333333, 1, 0, 1,
-0.6228495, -0.2744791, -1.666925, 0.3254902, 1, 0, 1,
-0.6182169, 0.5784085, 0.3261384, 0.3215686, 1, 0, 1,
-0.6174595, -2.127649, -2.116389, 0.3137255, 1, 0, 1,
-0.6080592, 0.1104306, -1.745847, 0.3098039, 1, 0, 1,
-0.6036733, 2.419122, 0.4900095, 0.3019608, 1, 0, 1,
-0.6032104, 0.8291382, -1.811539, 0.2941177, 1, 0, 1,
-0.5983016, 0.7436742, -0.3076429, 0.2901961, 1, 0, 1,
-0.5971149, -0.6040735, -3.037966, 0.282353, 1, 0, 1,
-0.5965571, 0.8481593, 1.932118, 0.2784314, 1, 0, 1,
-0.5962628, 2.39331, 0.06814548, 0.2705882, 1, 0, 1,
-0.5954177, -0.08325122, -0.4344218, 0.2666667, 1, 0, 1,
-0.5923949, -1.668711, -2.671726, 0.2588235, 1, 0, 1,
-0.5913051, 0.4298819, -0.3951952, 0.254902, 1, 0, 1,
-0.5861296, -0.1074501, -2.773554, 0.2470588, 1, 0, 1,
-0.5841601, 0.9031909, -0.1561989, 0.2431373, 1, 0, 1,
-0.5837984, 1.555233, -0.6226168, 0.2352941, 1, 0, 1,
-0.5822264, -0.6017824, -2.145594, 0.2313726, 1, 0, 1,
-0.5788205, 1.608155, -0.8946508, 0.2235294, 1, 0, 1,
-0.5761374, 0.6095765, 1.507456, 0.2196078, 1, 0, 1,
-0.5751598, -0.4088544, -0.909955, 0.2117647, 1, 0, 1,
-0.5732701, 0.05182093, -1.391492, 0.2078431, 1, 0, 1,
-0.5729915, -0.2091749, -0.006255969, 0.2, 1, 0, 1,
-0.5714756, 0.611036, -0.8691087, 0.1921569, 1, 0, 1,
-0.5698107, 0.3596214, -0.562021, 0.1882353, 1, 0, 1,
-0.5694531, -0.9968233, -2.816777, 0.1803922, 1, 0, 1,
-0.5676372, 0.993492, -1.843546, 0.1764706, 1, 0, 1,
-0.5639263, -0.4658928, -1.196874, 0.1686275, 1, 0, 1,
-0.5638988, 0.9173741, 0.5120161, 0.1647059, 1, 0, 1,
-0.563803, -0.07947529, -2.369837, 0.1568628, 1, 0, 1,
-0.5623848, -2.137878, -0.9508621, 0.1529412, 1, 0, 1,
-0.5617753, -1.137657, -3.197621, 0.145098, 1, 0, 1,
-0.5542917, 0.8506716, -1.193147, 0.1411765, 1, 0, 1,
-0.5515832, -0.2489398, -1.054402, 0.1333333, 1, 0, 1,
-0.5503274, -0.3969728, -2.683715, 0.1294118, 1, 0, 1,
-0.5476725, 0.5346723, -0.9104381, 0.1215686, 1, 0, 1,
-0.538094, 0.2230482, -0.5276054, 0.1176471, 1, 0, 1,
-0.5376998, 0.173271, -0.1296391, 0.1098039, 1, 0, 1,
-0.5361674, 2.512266, 1.50489, 0.1058824, 1, 0, 1,
-0.5352257, -1.031236, -2.547736, 0.09803922, 1, 0, 1,
-0.5341788, -0.5660432, -3.630679, 0.09019608, 1, 0, 1,
-0.5328491, 0.5198081, -0.9994261, 0.08627451, 1, 0, 1,
-0.5294372, -0.2012542, -0.4481206, 0.07843138, 1, 0, 1,
-0.526849, 1.246851, 1.095634, 0.07450981, 1, 0, 1,
-0.5220435, -0.9963124, -3.27882, 0.06666667, 1, 0, 1,
-0.5191759, 0.8426425, -0.8449622, 0.0627451, 1, 0, 1,
-0.5187522, 0.1125815, -0.7904716, 0.05490196, 1, 0, 1,
-0.5157435, -0.3572536, -1.984371, 0.05098039, 1, 0, 1,
-0.5156009, -1.110839, -1.09828, 0.04313726, 1, 0, 1,
-0.5136865, 1.088598, 0.2292926, 0.03921569, 1, 0, 1,
-0.50967, 1.240587, -1.279836, 0.03137255, 1, 0, 1,
-0.4991035, -0.9736356, -2.2632, 0.02745098, 1, 0, 1,
-0.497028, 0.1125178, -1.027978, 0.01960784, 1, 0, 1,
-0.4918185, -0.8220639, -2.889701, 0.01568628, 1, 0, 1,
-0.491082, 1.12024, 0.5648945, 0.007843138, 1, 0, 1,
-0.4896164, 0.2185037, -1.758059, 0.003921569, 1, 0, 1,
-0.4840834, -0.4925139, -1.713017, 0, 1, 0.003921569, 1,
-0.4782743, -0.05470302, -0.8244597, 0, 1, 0.01176471, 1,
-0.4770769, 0.4404059, -0.3633823, 0, 1, 0.01568628, 1,
-0.4735582, -0.5375134, 0.8122191, 0, 1, 0.02352941, 1,
-0.4735346, -0.2981649, -1.996963, 0, 1, 0.02745098, 1,
-0.4698457, -0.8562279, -3.941765, 0, 1, 0.03529412, 1,
-0.4666565, 0.5919858, -2.156182, 0, 1, 0.03921569, 1,
-0.4614649, -0.00780055, -1.824992, 0, 1, 0.04705882, 1,
-0.4559236, 0.02818105, -2.011376, 0, 1, 0.05098039, 1,
-0.4557497, -0.4918364, -2.876534, 0, 1, 0.05882353, 1,
-0.44969, 0.3419334, 0.9026302, 0, 1, 0.0627451, 1,
-0.4493919, -0.2288412, -2.751107, 0, 1, 0.07058824, 1,
-0.4486806, 0.268427, -0.6309264, 0, 1, 0.07450981, 1,
-0.4462665, 0.7063041, 0.07852585, 0, 1, 0.08235294, 1,
-0.4462045, 0.5565483, -0.127507, 0, 1, 0.08627451, 1,
-0.4388113, 1.040944, 0.3475417, 0, 1, 0.09411765, 1,
-0.4298045, 0.9938958, -0.5263183, 0, 1, 0.1019608, 1,
-0.4294992, 0.2058771, -0.7017986, 0, 1, 0.1058824, 1,
-0.4141029, -0.6620418, -2.77448, 0, 1, 0.1137255, 1,
-0.4134047, -0.8775746, -2.542903, 0, 1, 0.1176471, 1,
-0.4127294, 1.740549, 0.0524153, 0, 1, 0.1254902, 1,
-0.4116916, 0.1567678, -1.007343, 0, 1, 0.1294118, 1,
-0.4070074, 0.8524665, 0.233601, 0, 1, 0.1372549, 1,
-0.4028359, 0.3532608, 0.2180235, 0, 1, 0.1411765, 1,
-0.3998119, -0.4540609, -1.471764, 0, 1, 0.1490196, 1,
-0.398101, 0.7576977, 0.4628174, 0, 1, 0.1529412, 1,
-0.3957772, 1.808361, -0.3710435, 0, 1, 0.1607843, 1,
-0.3911926, -0.2896092, -1.522036, 0, 1, 0.1647059, 1,
-0.3908298, -0.7925589, -2.8441, 0, 1, 0.172549, 1,
-0.3896435, -0.5701203, -2.746061, 0, 1, 0.1764706, 1,
-0.3734691, 0.1009796, 0.5440738, 0, 1, 0.1843137, 1,
-0.3734477, 0.2092275, -2.995248, 0, 1, 0.1882353, 1,
-0.365836, 1.979928, -0.01929778, 0, 1, 0.1960784, 1,
-0.3568738, -0.2654979, -0.872055, 0, 1, 0.2039216, 1,
-0.3562933, -1.900647, -2.793013, 0, 1, 0.2078431, 1,
-0.3554601, -0.3904096, -2.697511, 0, 1, 0.2156863, 1,
-0.3495645, -0.5151442, -3.429481, 0, 1, 0.2196078, 1,
-0.3491699, -0.7490632, -1.803837, 0, 1, 0.227451, 1,
-0.347831, -1.545415, -1.506096, 0, 1, 0.2313726, 1,
-0.3468356, 0.3855862, -0.7647035, 0, 1, 0.2392157, 1,
-0.3467045, -1.061286, -4.39263, 0, 1, 0.2431373, 1,
-0.3423386, 1.013519, -0.1887707, 0, 1, 0.2509804, 1,
-0.3409686, -1.296368, -4.144332, 0, 1, 0.254902, 1,
-0.3409332, 0.7824886, -0.2317199, 0, 1, 0.2627451, 1,
-0.3380229, 1.120123, 0.1479397, 0, 1, 0.2666667, 1,
-0.3351768, 0.9779457, 0.1520446, 0, 1, 0.2745098, 1,
-0.3321169, -1.497881, -1.448842, 0, 1, 0.2784314, 1,
-0.3312661, -0.3446003, -3.910526, 0, 1, 0.2862745, 1,
-0.3308544, 1.45083, 0.01903763, 0, 1, 0.2901961, 1,
-0.3225409, 0.9747261, -1.737592, 0, 1, 0.2980392, 1,
-0.3205037, 0.5758721, -1.825893, 0, 1, 0.3058824, 1,
-0.3090864, 0.06791013, -0.6581184, 0, 1, 0.3098039, 1,
-0.3070958, -0.3445106, -3.00192, 0, 1, 0.3176471, 1,
-0.3058722, -1.290105, -2.942786, 0, 1, 0.3215686, 1,
-0.3056693, 0.591348, -1.722512, 0, 1, 0.3294118, 1,
-0.3028224, -0.2621502, -2.268462, 0, 1, 0.3333333, 1,
-0.3004453, 2.427123, 1.503938, 0, 1, 0.3411765, 1,
-0.2967498, -0.005319047, 0.06592333, 0, 1, 0.345098, 1,
-0.2950538, -0.9674123, -1.215935, 0, 1, 0.3529412, 1,
-0.2935098, 0.4066695, -2.519454, 0, 1, 0.3568628, 1,
-0.2926434, 0.333461, -0.7881798, 0, 1, 0.3647059, 1,
-0.2848796, 0.4130775, 1.455696, 0, 1, 0.3686275, 1,
-0.2846349, 0.6831723, 0.4785915, 0, 1, 0.3764706, 1,
-0.2842802, -0.1659672, -1.425819, 0, 1, 0.3803922, 1,
-0.282027, -1.022784, -3.82595, 0, 1, 0.3882353, 1,
-0.2781636, -1.039621, -2.902831, 0, 1, 0.3921569, 1,
-0.2778113, 0.968472, -1.260392, 0, 1, 0.4, 1,
-0.2735936, 0.4402073, -1.361094, 0, 1, 0.4078431, 1,
-0.2716795, 0.5876478, -0.4060133, 0, 1, 0.4117647, 1,
-0.2685894, -1.902809, -3.052637, 0, 1, 0.4196078, 1,
-0.2671491, 1.672522, -1.019669, 0, 1, 0.4235294, 1,
-0.2668547, 0.3457184, 0.4399632, 0, 1, 0.4313726, 1,
-0.2658356, 1.468346, -0.9219499, 0, 1, 0.4352941, 1,
-0.2623687, -0.4019313, -0.519061, 0, 1, 0.4431373, 1,
-0.260432, -1.336341, -2.86472, 0, 1, 0.4470588, 1,
-0.2497452, -0.1200423, -2.643959, 0, 1, 0.454902, 1,
-0.2455467, 0.3295259, -1.858668, 0, 1, 0.4588235, 1,
-0.2305937, -0.9514052, -4.203636, 0, 1, 0.4666667, 1,
-0.2291734, 0.6485129, -1.083631, 0, 1, 0.4705882, 1,
-0.2270669, 0.9870028, -0.3053951, 0, 1, 0.4784314, 1,
-0.2256299, -2.057253, -3.026034, 0, 1, 0.4823529, 1,
-0.2247623, 0.2528989, -1.859667, 0, 1, 0.4901961, 1,
-0.2232441, 0.2693113, -1.882235, 0, 1, 0.4941176, 1,
-0.2232395, 0.1774929, -0.6059586, 0, 1, 0.5019608, 1,
-0.2228541, 1.823866, -0.140856, 0, 1, 0.509804, 1,
-0.2216254, 0.3091089, -1.845132, 0, 1, 0.5137255, 1,
-0.2197569, 0.170203, -0.9677239, 0, 1, 0.5215687, 1,
-0.2191197, -2.241235, -5.154029, 0, 1, 0.5254902, 1,
-0.2174011, -0.03414741, -3.244058, 0, 1, 0.5333334, 1,
-0.2120275, 0.02691515, -2.545592, 0, 1, 0.5372549, 1,
-0.2095761, -0.3730799, -2.095232, 0, 1, 0.5450981, 1,
-0.2089322, 1.054737, -0.8900819, 0, 1, 0.5490196, 1,
-0.2087104, -0.1144203, -3.338067, 0, 1, 0.5568628, 1,
-0.2080057, -0.1506054, -1.514214, 0, 1, 0.5607843, 1,
-0.2025637, -0.9138636, -4.149457, 0, 1, 0.5686275, 1,
-0.1985907, 1.10435, -0.03697162, 0, 1, 0.572549, 1,
-0.197766, 0.6266993, -0.579924, 0, 1, 0.5803922, 1,
-0.1918617, -1.706398, -3.674801, 0, 1, 0.5843138, 1,
-0.1892939, 1.536458, -0.10851, 0, 1, 0.5921569, 1,
-0.1889004, 1.136107, -0.9866455, 0, 1, 0.5960785, 1,
-0.1886779, 1.570183, 1.408342, 0, 1, 0.6039216, 1,
-0.1839862, -0.1627803, -3.387163, 0, 1, 0.6117647, 1,
-0.1838461, -0.8648105, -1.804001, 0, 1, 0.6156863, 1,
-0.1838125, -0.8712871, -3.668135, 0, 1, 0.6235294, 1,
-0.1826147, -0.6422172, -3.019423, 0, 1, 0.627451, 1,
-0.1822442, 0.3089418, -1.658835, 0, 1, 0.6352941, 1,
-0.1804543, -0.1305939, -0.7189526, 0, 1, 0.6392157, 1,
-0.1797398, -0.181826, -1.651751, 0, 1, 0.6470588, 1,
-0.1728177, 0.1329609, -0.8966368, 0, 1, 0.6509804, 1,
-0.1726649, -1.329898, -2.908646, 0, 1, 0.6588235, 1,
-0.1710388, 0.3016833, 1.864594, 0, 1, 0.6627451, 1,
-0.1689242, 0.5945671, -1.113463, 0, 1, 0.6705883, 1,
-0.167752, 1.383094, 2.966888, 0, 1, 0.6745098, 1,
-0.1677499, -0.7218756, -1.317862, 0, 1, 0.682353, 1,
-0.163851, -1.973196, -2.813268, 0, 1, 0.6862745, 1,
-0.1579939, 0.03584993, 0.6983483, 0, 1, 0.6941177, 1,
-0.1487378, -0.3853623, -4.142051, 0, 1, 0.7019608, 1,
-0.1470796, -0.01264179, -3.762447, 0, 1, 0.7058824, 1,
-0.1469032, 0.7445315, 0.9624243, 0, 1, 0.7137255, 1,
-0.1416321, -0.2442882, -3.373459, 0, 1, 0.7176471, 1,
-0.1390565, -0.06542202, -3.890258, 0, 1, 0.7254902, 1,
-0.1384579, 1.411117, -0.319786, 0, 1, 0.7294118, 1,
-0.1371984, -0.7384686, -4.37082, 0, 1, 0.7372549, 1,
-0.1252718, -0.09025947, -2.421144, 0, 1, 0.7411765, 1,
-0.1218957, -0.02515963, -1.318044, 0, 1, 0.7490196, 1,
-0.1217762, -1.25077, -2.433384, 0, 1, 0.7529412, 1,
-0.1210369, -0.03123746, -1.848862, 0, 1, 0.7607843, 1,
-0.1209635, -1.388721, -1.826026, 0, 1, 0.7647059, 1,
-0.1178973, 0.5647174, -1.711792, 0, 1, 0.772549, 1,
-0.1114688, 0.03702616, -2.625693, 0, 1, 0.7764706, 1,
-0.108167, 0.7775872, 0.6104331, 0, 1, 0.7843137, 1,
-0.108115, 0.8406343, -0.7785381, 0, 1, 0.7882353, 1,
-0.1065897, -0.4073527, -1.409689, 0, 1, 0.7960784, 1,
-0.1020421, 0.2089674, -0.2910114, 0, 1, 0.8039216, 1,
-0.1018126, 1.250788, -2.368069, 0, 1, 0.8078431, 1,
-0.1017728, 0.8041461, 0.9882353, 0, 1, 0.8156863, 1,
-0.1002529, 0.1483094, 0.1914614, 0, 1, 0.8196079, 1,
-0.09906659, -1.553635, -2.364313, 0, 1, 0.827451, 1,
-0.0954977, 0.6184335, -1.485662, 0, 1, 0.8313726, 1,
-0.08432991, -0.3425902, -3.033482, 0, 1, 0.8392157, 1,
-0.08400223, 2.253308, -0.06092731, 0, 1, 0.8431373, 1,
-0.08256555, -0.8657948, -1.562261, 0, 1, 0.8509804, 1,
-0.08110762, 0.3107815, -1.315513, 0, 1, 0.854902, 1,
-0.07317412, -0.6798682, -3.299747, 0, 1, 0.8627451, 1,
-0.07142656, 0.02605602, -1.220914, 0, 1, 0.8666667, 1,
-0.070188, 0.02446176, -2.063754, 0, 1, 0.8745098, 1,
-0.07010827, -1.584483, -1.993512, 0, 1, 0.8784314, 1,
-0.06921133, 0.2025403, -0.03377633, 0, 1, 0.8862745, 1,
-0.06823599, 0.5750962, -1.842237, 0, 1, 0.8901961, 1,
-0.06819206, 1.154629, 0.5935925, 0, 1, 0.8980392, 1,
-0.06704167, -0.9996867, -3.544652, 0, 1, 0.9058824, 1,
-0.06660425, 0.9780329, 0.2018314, 0, 1, 0.9098039, 1,
-0.06637964, 0.2394653, -1.330855, 0, 1, 0.9176471, 1,
-0.06490041, 1.095441, 0.3758121, 0, 1, 0.9215686, 1,
-0.06440826, -0.6179455, -3.850323, 0, 1, 0.9294118, 1,
-0.06410402, -0.3476545, -3.654902, 0, 1, 0.9333333, 1,
-0.0583626, -0.5377924, -2.655176, 0, 1, 0.9411765, 1,
-0.0488313, -0.2291696, -3.259763, 0, 1, 0.945098, 1,
-0.04816559, 0.1250381, 0.4154774, 0, 1, 0.9529412, 1,
-0.04749215, 0.06160975, 0.1236555, 0, 1, 0.9568627, 1,
-0.0416593, 2.626761, -0.439875, 0, 1, 0.9647059, 1,
-0.04140377, -0.5827528, -2.327161, 0, 1, 0.9686275, 1,
-0.0382624, 0.5767119, 0.7584611, 0, 1, 0.9764706, 1,
-0.03755382, 0.4392846, -0.7140786, 0, 1, 0.9803922, 1,
-0.03570183, -0.2127366, -3.662731, 0, 1, 0.9882353, 1,
-0.03563899, -1.471658, -3.742649, 0, 1, 0.9921569, 1,
-0.03419198, -0.9056015, -2.998619, 0, 1, 1, 1,
-0.0322648, 0.1003073, 0.5948855, 0, 0.9921569, 1, 1,
-0.03126384, -1.168324, -2.722452, 0, 0.9882353, 1, 1,
-0.0252548, -0.5689037, -2.80289, 0, 0.9803922, 1, 1,
-0.02461119, 1.639734, 0.142543, 0, 0.9764706, 1, 1,
-0.02268959, 1.95499, -1.057205, 0, 0.9686275, 1, 1,
-0.01570817, 0.01088934, -1.071286, 0, 0.9647059, 1, 1,
-0.01510084, 0.1486579, -0.5356596, 0, 0.9568627, 1, 1,
-0.01243357, 0.03168432, 1.537408, 0, 0.9529412, 1, 1,
-0.01209171, -0.4600052, -4.597045, 0, 0.945098, 1, 1,
-0.01072381, 1.798159, -0.5246929, 0, 0.9411765, 1, 1,
-0.006934155, -0.2241562, -1.018982, 0, 0.9333333, 1, 1,
-0.003070248, -0.9935287, -3.457465, 0, 0.9294118, 1, 1,
-0.001204829, 1.108326, -0.4648748, 0, 0.9215686, 1, 1,
7.931051e-05, 0.5169003, -0.4842359, 0, 0.9176471, 1, 1,
0.01245505, 1.012699, 0.2861303, 0, 0.9098039, 1, 1,
0.01248023, -0.3830629, 2.235503, 0, 0.9058824, 1, 1,
0.01273456, -0.6821783, 2.192734, 0, 0.8980392, 1, 1,
0.01368263, -0.1638668, 4.539556, 0, 0.8901961, 1, 1,
0.02791744, 1.133203, 0.5669472, 0, 0.8862745, 1, 1,
0.02873678, -1.77515, 2.904418, 0, 0.8784314, 1, 1,
0.02943766, -1.343023, 2.499653, 0, 0.8745098, 1, 1,
0.03043199, -0.6800653, 3.498339, 0, 0.8666667, 1, 1,
0.0304406, -0.493549, 4.196407, 0, 0.8627451, 1, 1,
0.03113892, 2.228333, -0.2917511, 0, 0.854902, 1, 1,
0.03228231, 0.5962662, -0.5267215, 0, 0.8509804, 1, 1,
0.03371525, -0.850022, 3.631488, 0, 0.8431373, 1, 1,
0.03620432, 1.311489, 0.6980591, 0, 0.8392157, 1, 1,
0.03743289, -1.617529, 2.844953, 0, 0.8313726, 1, 1,
0.04276685, -0.8611059, 1.376126, 0, 0.827451, 1, 1,
0.05652669, 0.9330965, -0.2639391, 0, 0.8196079, 1, 1,
0.05982102, 0.3060424, 0.723012, 0, 0.8156863, 1, 1,
0.07160404, 0.3702365, 1.467548, 0, 0.8078431, 1, 1,
0.07373327, -0.0727006, -0.1166848, 0, 0.8039216, 1, 1,
0.0741856, -1.158492, 4.050892, 0, 0.7960784, 1, 1,
0.07776009, 0.7961313, -1.523813, 0, 0.7882353, 1, 1,
0.07803155, 0.3012744, 2.152609, 0, 0.7843137, 1, 1,
0.07881136, -1.556865, 3.221294, 0, 0.7764706, 1, 1,
0.08178219, 1.641904, -1.113135, 0, 0.772549, 1, 1,
0.08224916, 0.4755863, 1.052224, 0, 0.7647059, 1, 1,
0.08680584, 1.196208, 0.2643445, 0, 0.7607843, 1, 1,
0.08930423, 1.153415, -1.31012, 0, 0.7529412, 1, 1,
0.09727161, -0.3081994, 4.289405, 0, 0.7490196, 1, 1,
0.09844804, 0.09543397, 0.5245447, 0, 0.7411765, 1, 1,
0.09900863, 0.1237967, -0.4843643, 0, 0.7372549, 1, 1,
0.09935787, -1.931247, 3.906857, 0, 0.7294118, 1, 1,
0.1001253, -0.1851787, 3.900075, 0, 0.7254902, 1, 1,
0.1125236, 1.621789, -0.06367639, 0, 0.7176471, 1, 1,
0.1129814, 1.732901, -0.8614626, 0, 0.7137255, 1, 1,
0.1133199, 0.469998, 0.02384363, 0, 0.7058824, 1, 1,
0.1178671, 0.2153958, 0.2527566, 0, 0.6980392, 1, 1,
0.1205391, 1.314934, 2.118617, 0, 0.6941177, 1, 1,
0.1241701, 0.4212124, 0.6402135, 0, 0.6862745, 1, 1,
0.1257047, -1.067927, 1.940585, 0, 0.682353, 1, 1,
0.1290603, 0.148865, -1.233497, 0, 0.6745098, 1, 1,
0.1351822, -0.5096462, 2.519194, 0, 0.6705883, 1, 1,
0.1368647, 0.9492887, -1.100311, 0, 0.6627451, 1, 1,
0.1372168, -1.338431, 2.872212, 0, 0.6588235, 1, 1,
0.1396759, 1.482132, 1.421727, 0, 0.6509804, 1, 1,
0.1401178, 1.924583, -1.059835, 0, 0.6470588, 1, 1,
0.1417477, 0.4851343, 0.6342239, 0, 0.6392157, 1, 1,
0.1420215, -1.672126, 3.228585, 0, 0.6352941, 1, 1,
0.1421393, 0.1701138, 1.129774, 0, 0.627451, 1, 1,
0.14809, 0.2683454, -0.2459592, 0, 0.6235294, 1, 1,
0.149158, -1.616837, 2.335318, 0, 0.6156863, 1, 1,
0.1493908, 0.1936808, 0.944369, 0, 0.6117647, 1, 1,
0.1514399, 0.8569142, -0.01595947, 0, 0.6039216, 1, 1,
0.1529409, 1.078232, 1.482834, 0, 0.5960785, 1, 1,
0.157246, -0.4632411, 2.16284, 0, 0.5921569, 1, 1,
0.1595158, -0.64697, 3.640721, 0, 0.5843138, 1, 1,
0.1627823, -0.3160356, 2.129117, 0, 0.5803922, 1, 1,
0.1640483, -0.1914523, 1.963024, 0, 0.572549, 1, 1,
0.1716789, 0.7459405, 1.280982, 0, 0.5686275, 1, 1,
0.1791971, -0.5462533, 0.8173885, 0, 0.5607843, 1, 1,
0.1792406, 0.270318, 1.430169, 0, 0.5568628, 1, 1,
0.1830925, 0.2866487, 0.8429817, 0, 0.5490196, 1, 1,
0.1874194, 0.6427364, -0.1449986, 0, 0.5450981, 1, 1,
0.1886215, -1.515728, 3.679181, 0, 0.5372549, 1, 1,
0.1916932, 0.2602798, 0.9137084, 0, 0.5333334, 1, 1,
0.1919474, 0.4259958, 0.09542409, 0, 0.5254902, 1, 1,
0.1927067, 0.3831213, 2.21192, 0, 0.5215687, 1, 1,
0.1946131, 0.2232734, -0.2623451, 0, 0.5137255, 1, 1,
0.1970433, -0.3459192, 2.310788, 0, 0.509804, 1, 1,
0.1974248, 0.1663672, 2.136663, 0, 0.5019608, 1, 1,
0.2021634, -1.676418, 0.7039797, 0, 0.4941176, 1, 1,
0.2028343, 1.373635, 0.07273006, 0, 0.4901961, 1, 1,
0.204331, 0.6867122, 1.736833, 0, 0.4823529, 1, 1,
0.2067279, -0.206277, 1.475923, 0, 0.4784314, 1, 1,
0.2069997, 1.105432, 0.5602362, 0, 0.4705882, 1, 1,
0.2124754, 0.5530785, -0.9658341, 0, 0.4666667, 1, 1,
0.2153527, -0.4461272, 3.886053, 0, 0.4588235, 1, 1,
0.221936, 0.7840487, 0.7345672, 0, 0.454902, 1, 1,
0.2224991, -0.5921557, 1.764395, 0, 0.4470588, 1, 1,
0.2282789, 1.130586, 0.2146815, 0, 0.4431373, 1, 1,
0.231504, -0.2557163, 2.585136, 0, 0.4352941, 1, 1,
0.2324948, 0.3499338, 1.178536, 0, 0.4313726, 1, 1,
0.2337157, 0.4960697, 0.9060163, 0, 0.4235294, 1, 1,
0.235121, 1.571735, 0.726215, 0, 0.4196078, 1, 1,
0.2356672, -0.7193144, 2.94003, 0, 0.4117647, 1, 1,
0.2363204, -1.453536, 2.643033, 0, 0.4078431, 1, 1,
0.2386395, 0.02762647, 1.171215, 0, 0.4, 1, 1,
0.239711, -0.3221497, 2.771331, 0, 0.3921569, 1, 1,
0.2437925, -0.1946913, 1.151757, 0, 0.3882353, 1, 1,
0.2438459, -0.22012, 2.827646, 0, 0.3803922, 1, 1,
0.2444876, 0.7061173, 0.7376517, 0, 0.3764706, 1, 1,
0.2499998, -1.011526, 1.547475, 0, 0.3686275, 1, 1,
0.2589408, -1.465987, 2.531163, 0, 0.3647059, 1, 1,
0.2596166, 1.85944, -1.303478, 0, 0.3568628, 1, 1,
0.2742988, 1.146553, -1.422969, 0, 0.3529412, 1, 1,
0.2779285, 0.6755967, -0.9180856, 0, 0.345098, 1, 1,
0.2790779, -0.6512492, 3.154815, 0, 0.3411765, 1, 1,
0.282379, 0.5407551, 0.1482166, 0, 0.3333333, 1, 1,
0.2835764, 2.006845, -1.054769, 0, 0.3294118, 1, 1,
0.2848934, -1.200161, 3.430459, 0, 0.3215686, 1, 1,
0.289332, 0.9681208, -0.0710605, 0, 0.3176471, 1, 1,
0.2908726, 0.1401771, 0.9363248, 0, 0.3098039, 1, 1,
0.2930577, 1.442463, -0.5315717, 0, 0.3058824, 1, 1,
0.2940502, -0.523257, 1.467057, 0, 0.2980392, 1, 1,
0.2951098, -0.2145445, 2.406379, 0, 0.2901961, 1, 1,
0.3043004, 0.6852243, 0.05854526, 0, 0.2862745, 1, 1,
0.3072607, 1.452788, 0.2599142, 0, 0.2784314, 1, 1,
0.3087833, -1.306628, 3.092972, 0, 0.2745098, 1, 1,
0.3101414, -0.4809311, 2.706619, 0, 0.2666667, 1, 1,
0.3125199, -0.09368587, 0.3865895, 0, 0.2627451, 1, 1,
0.317214, 0.07110736, -0.2220097, 0, 0.254902, 1, 1,
0.3194093, -0.4002836, 1.844358, 0, 0.2509804, 1, 1,
0.3239091, 0.59022, 1.82872, 0, 0.2431373, 1, 1,
0.3276106, 0.1483603, 1.013205, 0, 0.2392157, 1, 1,
0.3276247, -2.190246, 4.904091, 0, 0.2313726, 1, 1,
0.3291754, -0.2413954, 2.118495, 0, 0.227451, 1, 1,
0.3342634, -1.584026, 3.689354, 0, 0.2196078, 1, 1,
0.3346893, 0.274841, 1.393424, 0, 0.2156863, 1, 1,
0.33648, -0.8976689, 3.273225, 0, 0.2078431, 1, 1,
0.3374907, 0.12939, 1.79879, 0, 0.2039216, 1, 1,
0.3377139, -0.8753573, 2.743712, 0, 0.1960784, 1, 1,
0.3404351, 0.4490106, 0.6714918, 0, 0.1882353, 1, 1,
0.3435239, -1.305247, 2.771314, 0, 0.1843137, 1, 1,
0.3441392, -0.7280224, 1.887871, 0, 0.1764706, 1, 1,
0.346948, 1.13433, 1.47905, 0, 0.172549, 1, 1,
0.3492456, 0.140287, -0.9606465, 0, 0.1647059, 1, 1,
0.3503616, -0.1386696, 0.7192331, 0, 0.1607843, 1, 1,
0.3515025, -0.3348068, 2.933694, 0, 0.1529412, 1, 1,
0.3532512, -1.227559, 1.829788, 0, 0.1490196, 1, 1,
0.3580193, 0.9344751, 0.3915223, 0, 0.1411765, 1, 1,
0.3596685, 1.792345, -0.3509136, 0, 0.1372549, 1, 1,
0.3717876, 1.659725, 2.02637, 0, 0.1294118, 1, 1,
0.3727413, -1.222127, 3.7537, 0, 0.1254902, 1, 1,
0.3777315, -1.733014, 4.000785, 0, 0.1176471, 1, 1,
0.3791234, 0.3516901, 3.565761, 0, 0.1137255, 1, 1,
0.3822649, 0.1900986, 3.139874, 0, 0.1058824, 1, 1,
0.3840164, 0.6283615, -0.6181691, 0, 0.09803922, 1, 1,
0.3842672, -1.375444, 4.317629, 0, 0.09411765, 1, 1,
0.3885487, 0.4920047, 1.959142, 0, 0.08627451, 1, 1,
0.3963293, 0.6088807, -1.119289, 0, 0.08235294, 1, 1,
0.4033638, 0.0004568876, 0.7267864, 0, 0.07450981, 1, 1,
0.4132194, 2.376661, -0.7953517, 0, 0.07058824, 1, 1,
0.4138446, 0.005125856, 0.2005917, 0, 0.0627451, 1, 1,
0.4220953, 0.8444387, -0.8265098, 0, 0.05882353, 1, 1,
0.4227702, 1.211905, -0.4991878, 0, 0.05098039, 1, 1,
0.4257873, -0.0389533, 0.1439835, 0, 0.04705882, 1, 1,
0.4281041, -1.793372, 2.498408, 0, 0.03921569, 1, 1,
0.4281484, -0.9638368, 1.822126, 0, 0.03529412, 1, 1,
0.428984, 2.965489, -0.6847408, 0, 0.02745098, 1, 1,
0.4291979, 1.957396, -0.7335201, 0, 0.02352941, 1, 1,
0.4370976, -0.2615702, 1.004154, 0, 0.01568628, 1, 1,
0.4404435, 0.3598743, 0.901785, 0, 0.01176471, 1, 1,
0.4419411, 0.2830074, 1.761867, 0, 0.003921569, 1, 1,
0.4457869, -0.2930762, 2.141162, 0.003921569, 0, 1, 1,
0.4500102, -0.6486263, 2.737927, 0.007843138, 0, 1, 1,
0.4562207, 0.09985805, 1.231979, 0.01568628, 0, 1, 1,
0.4605149, 0.6304082, -0.8229654, 0.01960784, 0, 1, 1,
0.4660342, -0.7900808, 2.91653, 0.02745098, 0, 1, 1,
0.4660501, -0.3082708, 3.031891, 0.03137255, 0, 1, 1,
0.4661475, -0.5935927, 2.654054, 0.03921569, 0, 1, 1,
0.4668315, -1.451909, 2.539361, 0.04313726, 0, 1, 1,
0.4709666, 0.05169835, 0.1576125, 0.05098039, 0, 1, 1,
0.4713505, -0.4903063, 3.147646, 0.05490196, 0, 1, 1,
0.4713984, 0.4038606, 2.184731, 0.0627451, 0, 1, 1,
0.471867, 0.4317528, 0.3730974, 0.06666667, 0, 1, 1,
0.4731529, -0.02236591, 0.6879854, 0.07450981, 0, 1, 1,
0.4756047, 0.2609856, 2.452988, 0.07843138, 0, 1, 1,
0.4776095, -0.5236961, 2.905545, 0.08627451, 0, 1, 1,
0.4818274, -1.800747, 0.5590307, 0.09019608, 0, 1, 1,
0.4831435, -0.1538181, 4.295557, 0.09803922, 0, 1, 1,
0.4855951, 0.1641829, 0.8070533, 0.1058824, 0, 1, 1,
0.4875403, -1.183972, 4.661723, 0.1098039, 0, 1, 1,
0.4886429, 0.03639968, 0.1089764, 0.1176471, 0, 1, 1,
0.4985325, 0.7450866, 0.5368929, 0.1215686, 0, 1, 1,
0.5007564, 0.8134202, 1.772998, 0.1294118, 0, 1, 1,
0.5023404, -0.6843027, 3.749691, 0.1333333, 0, 1, 1,
0.5049776, 2.118991, 1.387084, 0.1411765, 0, 1, 1,
0.5117581, 1.221526, -0.7741398, 0.145098, 0, 1, 1,
0.5128357, 1.517307, 2.071118, 0.1529412, 0, 1, 1,
0.5212857, 1.281438, 0.6881037, 0.1568628, 0, 1, 1,
0.5227481, 0.040324, 1.776291, 0.1647059, 0, 1, 1,
0.5254292, 0.6084203, -1.427315, 0.1686275, 0, 1, 1,
0.5267471, 1.404547, 1.22246, 0.1764706, 0, 1, 1,
0.5309066, 0.1230995, 2.674028, 0.1803922, 0, 1, 1,
0.5326384, -0.2430071, 2.753293, 0.1882353, 0, 1, 1,
0.5375671, -1.408965, 4.366356, 0.1921569, 0, 1, 1,
0.5391747, 2.655183, 2.123228, 0.2, 0, 1, 1,
0.541591, 0.9661427, 2.187968, 0.2078431, 0, 1, 1,
0.5439504, -0.7996038, 2.807227, 0.2117647, 0, 1, 1,
0.5451401, -0.04691303, 2.015333, 0.2196078, 0, 1, 1,
0.5452169, -1.115894, 3.861906, 0.2235294, 0, 1, 1,
0.5465827, 0.5945753, -0.0556687, 0.2313726, 0, 1, 1,
0.5501527, 0.8677445, -0.1583708, 0.2352941, 0, 1, 1,
0.5512242, -1.340448, 1.646703, 0.2431373, 0, 1, 1,
0.555347, -0.2058833, 1.987604, 0.2470588, 0, 1, 1,
0.5561547, -1.414969, 1.191163, 0.254902, 0, 1, 1,
0.5606737, 0.3101212, 1.3273, 0.2588235, 0, 1, 1,
0.5629121, -0.6639521, 1.46347, 0.2666667, 0, 1, 1,
0.5639597, -1.413762, 1.852458, 0.2705882, 0, 1, 1,
0.5650456, 0.308973, 0.7390251, 0.2784314, 0, 1, 1,
0.5676794, -0.4259944, 1.832936, 0.282353, 0, 1, 1,
0.5706996, 1.403904, -1.20565, 0.2901961, 0, 1, 1,
0.5740638, 0.8467628, -1.031441, 0.2941177, 0, 1, 1,
0.5751606, -0.5792028, 1.461617, 0.3019608, 0, 1, 1,
0.5793183, -0.1107435, 1.682144, 0.3098039, 0, 1, 1,
0.5818429, 0.9467383, 0.8576988, 0.3137255, 0, 1, 1,
0.5818776, -0.9976184, 2.684273, 0.3215686, 0, 1, 1,
0.5848425, 0.05149434, 1.954686, 0.3254902, 0, 1, 1,
0.5902876, 1.303444, 0.6180966, 0.3333333, 0, 1, 1,
0.5977893, -2.260143, 2.842227, 0.3372549, 0, 1, 1,
0.6011358, -1.190994, 1.523625, 0.345098, 0, 1, 1,
0.6030514, 0.5398367, -0.4352376, 0.3490196, 0, 1, 1,
0.6064953, -0.8045778, 2.27036, 0.3568628, 0, 1, 1,
0.608682, -0.1235026, 1.63803, 0.3607843, 0, 1, 1,
0.6102496, 1.360318, 0.7394958, 0.3686275, 0, 1, 1,
0.6146284, 0.6020774, 0.1138963, 0.372549, 0, 1, 1,
0.6158642, 1.876902, 1.654461, 0.3803922, 0, 1, 1,
0.6163982, 1.212863, 0.2440555, 0.3843137, 0, 1, 1,
0.6198675, 0.4066939, -0.7640175, 0.3921569, 0, 1, 1,
0.6237798, 0.9737423, 1.359987, 0.3960784, 0, 1, 1,
0.6255437, 0.07600252, 0.9454364, 0.4039216, 0, 1, 1,
0.6258458, 0.0847996, 0.563578, 0.4117647, 0, 1, 1,
0.628698, 0.6902229, 1.853114, 0.4156863, 0, 1, 1,
0.6314414, 0.7707053, 0.7040065, 0.4235294, 0, 1, 1,
0.6338161, -0.2849898, 2.424094, 0.427451, 0, 1, 1,
0.6370091, -2.459826, 1.14115, 0.4352941, 0, 1, 1,
0.6410733, 0.2392697, 0.1437083, 0.4392157, 0, 1, 1,
0.6435806, 0.7443963, 0.5541641, 0.4470588, 0, 1, 1,
0.6465352, -0.5184155, 2.269556, 0.4509804, 0, 1, 1,
0.6471034, -0.7295551, 1.396572, 0.4588235, 0, 1, 1,
0.6506675, -2.038748, 4.111202, 0.4627451, 0, 1, 1,
0.6657369, -1.23057, 4.004872, 0.4705882, 0, 1, 1,
0.6709422, -0.1375667, 1.925708, 0.4745098, 0, 1, 1,
0.6767581, 2.522565, 1.46172, 0.4823529, 0, 1, 1,
0.6772529, 0.4068006, 0.4739796, 0.4862745, 0, 1, 1,
0.6791025, -1.560743, 3.831054, 0.4941176, 0, 1, 1,
0.6815134, -0.1891729, 0.4065903, 0.5019608, 0, 1, 1,
0.6848055, -0.6418173, 2.821025, 0.5058824, 0, 1, 1,
0.6870849, 0.2312753, -0.7520536, 0.5137255, 0, 1, 1,
0.6906963, -1.42905, 4.16798, 0.5176471, 0, 1, 1,
0.6948931, -0.6450738, 2.320834, 0.5254902, 0, 1, 1,
0.6962297, 0.1268877, 1.030594, 0.5294118, 0, 1, 1,
0.6978916, -0.9939234, 2.036916, 0.5372549, 0, 1, 1,
0.6990495, -0.7447969, 1.941343, 0.5411765, 0, 1, 1,
0.7065375, -1.259483, 2.590834, 0.5490196, 0, 1, 1,
0.7066982, 1.421095, -1.627413, 0.5529412, 0, 1, 1,
0.7112927, -1.378913, 2.554389, 0.5607843, 0, 1, 1,
0.7138855, -0.427051, 1.744616, 0.5647059, 0, 1, 1,
0.7171256, 2.987422, 0.4307206, 0.572549, 0, 1, 1,
0.7172948, 0.1143158, 0.00182792, 0.5764706, 0, 1, 1,
0.7199273, -1.325152, 3.252941, 0.5843138, 0, 1, 1,
0.7202579, 1.390224, 0.2831455, 0.5882353, 0, 1, 1,
0.7220331, -0.3492154, 1.164161, 0.5960785, 0, 1, 1,
0.727023, 0.2138084, 0.7599949, 0.6039216, 0, 1, 1,
0.7311332, 2.240469, 0.9001638, 0.6078432, 0, 1, 1,
0.7373313, -1.175931, 2.238933, 0.6156863, 0, 1, 1,
0.7428099, -0.3595202, 3.54602, 0.6196079, 0, 1, 1,
0.7468095, 0.2886146, -0.6385781, 0.627451, 0, 1, 1,
0.7498217, -0.6391128, -1.095526, 0.6313726, 0, 1, 1,
0.7565489, -0.8858079, 2.658691, 0.6392157, 0, 1, 1,
0.762842, -0.5654524, 2.60027, 0.6431373, 0, 1, 1,
0.7630991, -0.7939612, 2.258013, 0.6509804, 0, 1, 1,
0.7650909, 0.126015, 2.767278, 0.654902, 0, 1, 1,
0.7662787, -1.151097, 1.374102, 0.6627451, 0, 1, 1,
0.7680086, 0.3709941, 1.710612, 0.6666667, 0, 1, 1,
0.7693487, -0.2994117, 3.663748, 0.6745098, 0, 1, 1,
0.7741017, 1.042134, 1.364078, 0.6784314, 0, 1, 1,
0.7785537, 0.9927264, -0.9794351, 0.6862745, 0, 1, 1,
0.7813312, -0.3232543, 0.9543377, 0.6901961, 0, 1, 1,
0.7816116, -1.537586, 3.794075, 0.6980392, 0, 1, 1,
0.7876348, 1.181318, 0.460486, 0.7058824, 0, 1, 1,
0.7916492, 0.9262466, -1.178201, 0.7098039, 0, 1, 1,
0.7948182, 2.405624, -0.4531235, 0.7176471, 0, 1, 1,
0.8001432, -2.411734, 4.193102, 0.7215686, 0, 1, 1,
0.8063211, 0.8503482, 0.8983287, 0.7294118, 0, 1, 1,
0.8064169, -0.08038917, 2.08682, 0.7333333, 0, 1, 1,
0.8074622, 1.092673, 0.3622287, 0.7411765, 0, 1, 1,
0.8175892, -0.7244441, 2.705742, 0.7450981, 0, 1, 1,
0.818763, -0.27437, 2.823041, 0.7529412, 0, 1, 1,
0.8232837, 0.06231929, 2.154163, 0.7568628, 0, 1, 1,
0.8256629, -1.19505, -1.165228, 0.7647059, 0, 1, 1,
0.8266627, -0.7275671, 4.887324, 0.7686275, 0, 1, 1,
0.8307922, -0.6310126, 3.09233, 0.7764706, 0, 1, 1,
0.8358037, 0.1378653, 1.124791, 0.7803922, 0, 1, 1,
0.8360656, 1.621861, -0.02595039, 0.7882353, 0, 1, 1,
0.8419793, -0.6879596, 2.032514, 0.7921569, 0, 1, 1,
0.8424621, -0.4510667, 2.56107, 0.8, 0, 1, 1,
0.8427544, -0.09702778, 1.911567, 0.8078431, 0, 1, 1,
0.843116, 0.1370567, 1.389165, 0.8117647, 0, 1, 1,
0.8439193, -0.05805324, 2.34015, 0.8196079, 0, 1, 1,
0.8455471, 0.2580737, 1.262978, 0.8235294, 0, 1, 1,
0.8464882, 0.2711412, 3.212283, 0.8313726, 0, 1, 1,
0.8487784, 0.6846568, 1.884208, 0.8352941, 0, 1, 1,
0.8625788, 0.7100954, 3.037087, 0.8431373, 0, 1, 1,
0.865738, -1.739132, 1.614938, 0.8470588, 0, 1, 1,
0.8662394, 0.7420259, 2.008718, 0.854902, 0, 1, 1,
0.8670584, -0.5348473, 2.113929, 0.8588235, 0, 1, 1,
0.8761868, -0.2512657, 1.798032, 0.8666667, 0, 1, 1,
0.8778605, 1.197482, -2.281072, 0.8705882, 0, 1, 1,
0.878907, -0.6953771, 2.939123, 0.8784314, 0, 1, 1,
0.8790531, -2.004399, 2.454802, 0.8823529, 0, 1, 1,
0.8804848, 1.153348, 0.5148328, 0.8901961, 0, 1, 1,
0.8831219, -0.3752151, 2.507327, 0.8941177, 0, 1, 1,
0.8837166, 0.44206, -0.222166, 0.9019608, 0, 1, 1,
0.8891216, -0.327812, 2.961889, 0.9098039, 0, 1, 1,
0.889162, -1.861008, 3.665336, 0.9137255, 0, 1, 1,
0.8910528, -1.232048, 2.443575, 0.9215686, 0, 1, 1,
0.9002964, 0.7541082, 0.9324501, 0.9254902, 0, 1, 1,
0.9021428, 0.2810716, -0.100664, 0.9333333, 0, 1, 1,
0.9053708, 1.185662, 0.5675945, 0.9372549, 0, 1, 1,
0.9098001, -0.1487553, 3.041832, 0.945098, 0, 1, 1,
0.9102843, -0.4083662, 0.2665057, 0.9490196, 0, 1, 1,
0.9126494, 0.05213556, 2.632977, 0.9568627, 0, 1, 1,
0.9198747, 0.9976301, 0.5036626, 0.9607843, 0, 1, 1,
0.9202034, -0.6042109, 3.399189, 0.9686275, 0, 1, 1,
0.930423, 0.07622401, 1.524657, 0.972549, 0, 1, 1,
0.9344028, -0.9477096, 0.5302923, 0.9803922, 0, 1, 1,
0.9344844, 0.7203274, 0.8980674, 0.9843137, 0, 1, 1,
0.9347695, -0.813592, 1.379724, 0.9921569, 0, 1, 1,
0.9354981, 0.6760591, -0.6781355, 0.9960784, 0, 1, 1,
0.9371157, 1.733573, 2.046635, 1, 0, 0.9960784, 1,
0.9398201, 0.5398244, 2.878311, 1, 0, 0.9882353, 1,
0.9463437, -0.7203826, 3.772149, 1, 0, 0.9843137, 1,
0.9512182, -1.419734, 2.023777, 1, 0, 0.9764706, 1,
0.9514345, 1.341446, 0.639452, 1, 0, 0.972549, 1,
0.9594982, 1.725411, 1.163344, 1, 0, 0.9647059, 1,
0.9669797, -0.8470167, 3.374229, 1, 0, 0.9607843, 1,
0.9739512, -0.187919, 2.306979, 1, 0, 0.9529412, 1,
0.9754418, -0.2342291, 3.621666, 1, 0, 0.9490196, 1,
0.9783783, -0.3995164, 2.427403, 1, 0, 0.9411765, 1,
0.979038, 1.487608, -0.5555101, 1, 0, 0.9372549, 1,
0.9845224, 0.6082341, 1.721713, 1, 0, 0.9294118, 1,
0.9907308, -0.2482626, 0.3610698, 1, 0, 0.9254902, 1,
0.9942397, 0.06454737, 2.559639, 1, 0, 0.9176471, 1,
0.9974508, -0.2904925, 1.029691, 1, 0, 0.9137255, 1,
1.001244, -1.898499, 1.218219, 1, 0, 0.9058824, 1,
1.002114, -1.491011, 3.443004, 1, 0, 0.9019608, 1,
1.003252, 1.050414, -0.8616896, 1, 0, 0.8941177, 1,
1.004202, 2.048259, 1.206582, 1, 0, 0.8862745, 1,
1.004867, 0.8962053, -0.9630262, 1, 0, 0.8823529, 1,
1.016957, 0.9406815, 0.6113372, 1, 0, 0.8745098, 1,
1.017096, -0.5359182, 1.986569, 1, 0, 0.8705882, 1,
1.018869, -0.9441317, 3.156291, 1, 0, 0.8627451, 1,
1.019324, -0.250102, 1.915747, 1, 0, 0.8588235, 1,
1.022825, -1.154082, 2.214712, 1, 0, 0.8509804, 1,
1.030698, -0.7878587, 2.945538, 1, 0, 0.8470588, 1,
1.037752, 2.127006, 2.18031, 1, 0, 0.8392157, 1,
1.037823, 0.01498015, 0.930008, 1, 0, 0.8352941, 1,
1.046192, -0.6810516, 1.73194, 1, 0, 0.827451, 1,
1.057017, 0.9355584, 1.081522, 1, 0, 0.8235294, 1,
1.05856, -0.007272167, 1.707668, 1, 0, 0.8156863, 1,
1.063045, 0.2890828, 1.126856, 1, 0, 0.8117647, 1,
1.063219, 0.2881745, 1.792837, 1, 0, 0.8039216, 1,
1.074831, -0.7549024, 0.928461, 1, 0, 0.7960784, 1,
1.077696, -2.305903, 2.920684, 1, 0, 0.7921569, 1,
1.079041, 0.1669597, 3.898852, 1, 0, 0.7843137, 1,
1.07905, -0.9221415, 2.024761, 1, 0, 0.7803922, 1,
1.08181, 0.1332988, -0.1874231, 1, 0, 0.772549, 1,
1.082757, 1.52072, 0.2262598, 1, 0, 0.7686275, 1,
1.083053, -1.613936, 1.819233, 1, 0, 0.7607843, 1,
1.084829, 1.666779, 0.6398847, 1, 0, 0.7568628, 1,
1.090891, 1.758055, 0.463913, 1, 0, 0.7490196, 1,
1.095422, -0.5694841, 2.701389, 1, 0, 0.7450981, 1,
1.096234, -0.4228939, 1.558328, 1, 0, 0.7372549, 1,
1.10239, 0.5894939, 1.490896, 1, 0, 0.7333333, 1,
1.106162, -0.618569, 2.159606, 1, 0, 0.7254902, 1,
1.109936, 0.3697548, 0.3057055, 1, 0, 0.7215686, 1,
1.118707, 0.08821779, 1.452093, 1, 0, 0.7137255, 1,
1.123096, 0.04486193, 2.016741, 1, 0, 0.7098039, 1,
1.126194, -1.219504, 1.915533, 1, 0, 0.7019608, 1,
1.126606, -0.1168234, 0.8732638, 1, 0, 0.6941177, 1,
1.126693, -1.30735, 3.82434, 1, 0, 0.6901961, 1,
1.127914, -1.196055, 3.736573, 1, 0, 0.682353, 1,
1.134827, -0.7112095, 2.879104, 1, 0, 0.6784314, 1,
1.164485, -0.6058353, 1.106532, 1, 0, 0.6705883, 1,
1.168684, 0.9098104, 1.385002, 1, 0, 0.6666667, 1,
1.18093, 1.727067, 0.4297739, 1, 0, 0.6588235, 1,
1.191129, 0.1232598, 0.6234206, 1, 0, 0.654902, 1,
1.196162, 1.758564, 1.302266, 1, 0, 0.6470588, 1,
1.200254, 0.752818, 1.76733, 1, 0, 0.6431373, 1,
1.204834, 0.7614101, 2.132093, 1, 0, 0.6352941, 1,
1.205716, -1.390269, 1.822144, 1, 0, 0.6313726, 1,
1.206665, -2.475122, 1.620174, 1, 0, 0.6235294, 1,
1.207377, -0.5360839, 2.409091, 1, 0, 0.6196079, 1,
1.212453, -1.209337, 3.337237, 1, 0, 0.6117647, 1,
1.217097, -0.03813367, 1.442684, 1, 0, 0.6078432, 1,
1.220918, 2.161119, 0.03353279, 1, 0, 0.6, 1,
1.226, -0.5004503, 2.356917, 1, 0, 0.5921569, 1,
1.238817, -0.7836639, 2.642962, 1, 0, 0.5882353, 1,
1.239555, -2.171265, 0.805741, 1, 0, 0.5803922, 1,
1.242909, 0.2354269, 1.95645, 1, 0, 0.5764706, 1,
1.256514, -0.210768, 2.486089, 1, 0, 0.5686275, 1,
1.261254, -0.07677764, 1.40013, 1, 0, 0.5647059, 1,
1.265285, -0.5227225, 1.103089, 1, 0, 0.5568628, 1,
1.271337, 0.1898161, 1.820009, 1, 0, 0.5529412, 1,
1.294188, 0.7084609, 1.279763, 1, 0, 0.5450981, 1,
1.297249, -1.197922, 3.024732, 1, 0, 0.5411765, 1,
1.307305, -0.8690886, 3.124162, 1, 0, 0.5333334, 1,
1.311195, -0.9887299, 1.675262, 1, 0, 0.5294118, 1,
1.331258, 0.2897198, 1.545303, 1, 0, 0.5215687, 1,
1.33961, 1.468856, 0.219086, 1, 0, 0.5176471, 1,
1.340059, -0.1715605, 1.504622, 1, 0, 0.509804, 1,
1.341145, -0.04315154, 0.7928253, 1, 0, 0.5058824, 1,
1.345414, -3.557752, 0.8808057, 1, 0, 0.4980392, 1,
1.358601, -0.3023841, 3.021196, 1, 0, 0.4901961, 1,
1.359814, 0.9543903, 1.121575, 1, 0, 0.4862745, 1,
1.369208, -0.2165595, 2.972765, 1, 0, 0.4784314, 1,
1.376406, -0.8363577, 2.22372, 1, 0, 0.4745098, 1,
1.378573, -0.01835943, 3.122464, 1, 0, 0.4666667, 1,
1.381852, 1.464852, 0.3146731, 1, 0, 0.4627451, 1,
1.389112, 0.300572, 1.135352, 1, 0, 0.454902, 1,
1.393812, -1.549383, 0.4748873, 1, 0, 0.4509804, 1,
1.394052, -1.10154, 2.024239, 1, 0, 0.4431373, 1,
1.396518, 0.8041486, 0.3949906, 1, 0, 0.4392157, 1,
1.400474, -0.976545, 3.124916, 1, 0, 0.4313726, 1,
1.420992, 0.6677234, 0.4308938, 1, 0, 0.427451, 1,
1.451321, -0.06691177, 2.447833, 1, 0, 0.4196078, 1,
1.458073, -0.4346274, 0.9928358, 1, 0, 0.4156863, 1,
1.46127, 0.4018024, 3.427142, 1, 0, 0.4078431, 1,
1.477233, 0.06596299, 2.069796, 1, 0, 0.4039216, 1,
1.519699, 0.503634, 1.951179, 1, 0, 0.3960784, 1,
1.545493, -0.0002230989, 1.468331, 1, 0, 0.3882353, 1,
1.559623, 0.3880663, 1.202788, 1, 0, 0.3843137, 1,
1.570415, 0.6191895, 0.2013451, 1, 0, 0.3764706, 1,
1.575589, -0.6471751, 2.4001, 1, 0, 0.372549, 1,
1.578571, -0.3991721, 2.747377, 1, 0, 0.3647059, 1,
1.578706, 0.6636264, 2.999929, 1, 0, 0.3607843, 1,
1.582753, 2.314759, 1.833326, 1, 0, 0.3529412, 1,
1.583218, -0.4495242, 2.967256, 1, 0, 0.3490196, 1,
1.584506, -0.6020592, 2.724527, 1, 0, 0.3411765, 1,
1.586782, -1.209444, -0.6275185, 1, 0, 0.3372549, 1,
1.599512, -0.8300374, 2.596201, 1, 0, 0.3294118, 1,
1.616861, 2.320139, 2.428447, 1, 0, 0.3254902, 1,
1.617922, 0.6536219, 0.5817651, 1, 0, 0.3176471, 1,
1.623569, 0.6121904, 2.66063, 1, 0, 0.3137255, 1,
1.631177, 2.091882, -0.421629, 1, 0, 0.3058824, 1,
1.631772, -0.5858831, 1.95662, 1, 0, 0.2980392, 1,
1.636036, 0.432575, 1.057233, 1, 0, 0.2941177, 1,
1.642228, -0.8865528, 2.484428, 1, 0, 0.2862745, 1,
1.659769, -0.968699, 1.187925, 1, 0, 0.282353, 1,
1.679585, -0.5090362, 2.104277, 1, 0, 0.2745098, 1,
1.681245, 1.091116, 1.346934, 1, 0, 0.2705882, 1,
1.683, 0.3749684, -1.628598, 1, 0, 0.2627451, 1,
1.702334, 1.170921, 1.31917, 1, 0, 0.2588235, 1,
1.703461, -0.3126392, 3.204268, 1, 0, 0.2509804, 1,
1.704192, -1.61461, 2.198127, 1, 0, 0.2470588, 1,
1.713038, -0.3741065, 1.962, 1, 0, 0.2392157, 1,
1.714996, -0.3925388, 3.130475, 1, 0, 0.2352941, 1,
1.719846, 1.394219, 0.0003084797, 1, 0, 0.227451, 1,
1.751017, -0.291856, 2.186511, 1, 0, 0.2235294, 1,
1.754683, 0.03464996, 2.680809, 1, 0, 0.2156863, 1,
1.755575, -0.5353221, 3.298819, 1, 0, 0.2117647, 1,
1.768672, -0.8964544, 2.577889, 1, 0, 0.2039216, 1,
1.783282, 1.386608, 0.2649323, 1, 0, 0.1960784, 1,
1.815794, 0.570203, 2.371778, 1, 0, 0.1921569, 1,
1.833854, -1.447358, 2.989285, 1, 0, 0.1843137, 1,
1.862391, -0.5740018, 2.13478, 1, 0, 0.1803922, 1,
1.901526, 0.32352, 0.7595842, 1, 0, 0.172549, 1,
1.916018, 1.165563, 2.900885, 1, 0, 0.1686275, 1,
1.925479, -0.6432678, 0.4518668, 1, 0, 0.1607843, 1,
1.936467, -1.116312, 1.592672, 1, 0, 0.1568628, 1,
1.961377, -0.2145015, 1.297281, 1, 0, 0.1490196, 1,
1.962113, 1.251079, -0.6322192, 1, 0, 0.145098, 1,
2.030807, 1.423898, -0.358025, 1, 0, 0.1372549, 1,
2.066212, 1.023912, 0.8144355, 1, 0, 0.1333333, 1,
2.068319, 0.8232319, 0.9034826, 1, 0, 0.1254902, 1,
2.069197, -0.3550564, 2.088165, 1, 0, 0.1215686, 1,
2.092789, -0.07609423, 0.02147764, 1, 0, 0.1137255, 1,
2.124327, 1.848266, 2.190799, 1, 0, 0.1098039, 1,
2.151339, -1.121189, 3.700222, 1, 0, 0.1019608, 1,
2.161376, -0.3281907, 1.940582, 1, 0, 0.09411765, 1,
2.163337, 0.1670877, 2.261889, 1, 0, 0.09019608, 1,
2.215898, 0.4554705, 2.304194, 1, 0, 0.08235294, 1,
2.265, -0.6753376, 3.139488, 1, 0, 0.07843138, 1,
2.267936, -0.01158386, 2.366371, 1, 0, 0.07058824, 1,
2.286412, 0.924853, 0.7821305, 1, 0, 0.06666667, 1,
2.30233, 0.861438, 2.693631, 1, 0, 0.05882353, 1,
2.32036, 1.318524, 1.449536, 1, 0, 0.05490196, 1,
2.333458, 0.1651655, 2.104296, 1, 0, 0.04705882, 1,
2.34477, 1.039806, 0.265602, 1, 0, 0.04313726, 1,
2.366692, 1.32119, 1.370389, 1, 0, 0.03529412, 1,
2.425367, -0.6643995, 3.604997, 1, 0, 0.03137255, 1,
2.456632, -1.28106, 1.761264, 1, 0, 0.02352941, 1,
2.485071, -0.8062768, 1.313496, 1, 0, 0.01960784, 1,
2.638184, -0.3563552, 2.410471, 1, 0, 0.01176471, 1,
3.730374, -0.3067768, 2.048406, 1, 0, 0.007843138, 1
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
0.2612095, -4.667159, -6.85888, 0, -0.5, 0.5, 0.5,
0.2612095, -4.667159, -6.85888, 1, -0.5, 0.5, 0.5,
0.2612095, -4.667159, -6.85888, 1, 1.5, 0.5, 0.5,
0.2612095, -4.667159, -6.85888, 0, 1.5, 0.5, 0.5
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
-4.384002, -0.285165, -6.85888, 0, -0.5, 0.5, 0.5,
-4.384002, -0.285165, -6.85888, 1, -0.5, 0.5, 0.5,
-4.384002, -0.285165, -6.85888, 1, 1.5, 0.5, 0.5,
-4.384002, -0.285165, -6.85888, 0, 1.5, 0.5, 0.5
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
-4.384002, -4.667159, -0.1249688, 0, -0.5, 0.5, 0.5,
-4.384002, -4.667159, -0.1249688, 1, -0.5, 0.5, 0.5,
-4.384002, -4.667159, -0.1249688, 1, 1.5, 0.5, 0.5,
-4.384002, -4.667159, -0.1249688, 0, 1.5, 0.5, 0.5
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
-3, -3.65593, -5.304901,
3, -3.65593, -5.304901,
-3, -3.65593, -5.304901,
-3, -3.824468, -5.563897,
-2, -3.65593, -5.304901,
-2, -3.824468, -5.563897,
-1, -3.65593, -5.304901,
-1, -3.824468, -5.563897,
0, -3.65593, -5.304901,
0, -3.824468, -5.563897,
1, -3.65593, -5.304901,
1, -3.824468, -5.563897,
2, -3.65593, -5.304901,
2, -3.824468, -5.563897,
3, -3.65593, -5.304901,
3, -3.824468, -5.563897
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
-3, -4.161544, -6.081891, 0, -0.5, 0.5, 0.5,
-3, -4.161544, -6.081891, 1, -0.5, 0.5, 0.5,
-3, -4.161544, -6.081891, 1, 1.5, 0.5, 0.5,
-3, -4.161544, -6.081891, 0, 1.5, 0.5, 0.5,
-2, -4.161544, -6.081891, 0, -0.5, 0.5, 0.5,
-2, -4.161544, -6.081891, 1, -0.5, 0.5, 0.5,
-2, -4.161544, -6.081891, 1, 1.5, 0.5, 0.5,
-2, -4.161544, -6.081891, 0, 1.5, 0.5, 0.5,
-1, -4.161544, -6.081891, 0, -0.5, 0.5, 0.5,
-1, -4.161544, -6.081891, 1, -0.5, 0.5, 0.5,
-1, -4.161544, -6.081891, 1, 1.5, 0.5, 0.5,
-1, -4.161544, -6.081891, 0, 1.5, 0.5, 0.5,
0, -4.161544, -6.081891, 0, -0.5, 0.5, 0.5,
0, -4.161544, -6.081891, 1, -0.5, 0.5, 0.5,
0, -4.161544, -6.081891, 1, 1.5, 0.5, 0.5,
0, -4.161544, -6.081891, 0, 1.5, 0.5, 0.5,
1, -4.161544, -6.081891, 0, -0.5, 0.5, 0.5,
1, -4.161544, -6.081891, 1, -0.5, 0.5, 0.5,
1, -4.161544, -6.081891, 1, 1.5, 0.5, 0.5,
1, -4.161544, -6.081891, 0, 1.5, 0.5, 0.5,
2, -4.161544, -6.081891, 0, -0.5, 0.5, 0.5,
2, -4.161544, -6.081891, 1, -0.5, 0.5, 0.5,
2, -4.161544, -6.081891, 1, 1.5, 0.5, 0.5,
2, -4.161544, -6.081891, 0, 1.5, 0.5, 0.5,
3, -4.161544, -6.081891, 0, -0.5, 0.5, 0.5,
3, -4.161544, -6.081891, 1, -0.5, 0.5, 0.5,
3, -4.161544, -6.081891, 1, 1.5, 0.5, 0.5,
3, -4.161544, -6.081891, 0, 1.5, 0.5, 0.5
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
-3.31203, -3, -5.304901,
-3.31203, 2, -5.304901,
-3.31203, -3, -5.304901,
-3.490692, -3, -5.563897,
-3.31203, -2, -5.304901,
-3.490692, -2, -5.563897,
-3.31203, -1, -5.304901,
-3.490692, -1, -5.563897,
-3.31203, 0, -5.304901,
-3.490692, 0, -5.563897,
-3.31203, 1, -5.304901,
-3.490692, 1, -5.563897,
-3.31203, 2, -5.304901,
-3.490692, 2, -5.563897
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
-3.848016, -3, -6.081891, 0, -0.5, 0.5, 0.5,
-3.848016, -3, -6.081891, 1, -0.5, 0.5, 0.5,
-3.848016, -3, -6.081891, 1, 1.5, 0.5, 0.5,
-3.848016, -3, -6.081891, 0, 1.5, 0.5, 0.5,
-3.848016, -2, -6.081891, 0, -0.5, 0.5, 0.5,
-3.848016, -2, -6.081891, 1, -0.5, 0.5, 0.5,
-3.848016, -2, -6.081891, 1, 1.5, 0.5, 0.5,
-3.848016, -2, -6.081891, 0, 1.5, 0.5, 0.5,
-3.848016, -1, -6.081891, 0, -0.5, 0.5, 0.5,
-3.848016, -1, -6.081891, 1, -0.5, 0.5, 0.5,
-3.848016, -1, -6.081891, 1, 1.5, 0.5, 0.5,
-3.848016, -1, -6.081891, 0, 1.5, 0.5, 0.5,
-3.848016, 0, -6.081891, 0, -0.5, 0.5, 0.5,
-3.848016, 0, -6.081891, 1, -0.5, 0.5, 0.5,
-3.848016, 0, -6.081891, 1, 1.5, 0.5, 0.5,
-3.848016, 0, -6.081891, 0, 1.5, 0.5, 0.5,
-3.848016, 1, -6.081891, 0, -0.5, 0.5, 0.5,
-3.848016, 1, -6.081891, 1, -0.5, 0.5, 0.5,
-3.848016, 1, -6.081891, 1, 1.5, 0.5, 0.5,
-3.848016, 1, -6.081891, 0, 1.5, 0.5, 0.5,
-3.848016, 2, -6.081891, 0, -0.5, 0.5, 0.5,
-3.848016, 2, -6.081891, 1, -0.5, 0.5, 0.5,
-3.848016, 2, -6.081891, 1, 1.5, 0.5, 0.5,
-3.848016, 2, -6.081891, 0, 1.5, 0.5, 0.5
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
-3.31203, -3.65593, -4,
-3.31203, -3.65593, 4,
-3.31203, -3.65593, -4,
-3.490692, -3.824468, -4,
-3.31203, -3.65593, -2,
-3.490692, -3.824468, -2,
-3.31203, -3.65593, 0,
-3.490692, -3.824468, 0,
-3.31203, -3.65593, 2,
-3.490692, -3.824468, 2,
-3.31203, -3.65593, 4,
-3.490692, -3.824468, 4
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
-3.848016, -4.161544, -4, 0, -0.5, 0.5, 0.5,
-3.848016, -4.161544, -4, 1, -0.5, 0.5, 0.5,
-3.848016, -4.161544, -4, 1, 1.5, 0.5, 0.5,
-3.848016, -4.161544, -4, 0, 1.5, 0.5, 0.5,
-3.848016, -4.161544, -2, 0, -0.5, 0.5, 0.5,
-3.848016, -4.161544, -2, 1, -0.5, 0.5, 0.5,
-3.848016, -4.161544, -2, 1, 1.5, 0.5, 0.5,
-3.848016, -4.161544, -2, 0, 1.5, 0.5, 0.5,
-3.848016, -4.161544, 0, 0, -0.5, 0.5, 0.5,
-3.848016, -4.161544, 0, 1, -0.5, 0.5, 0.5,
-3.848016, -4.161544, 0, 1, 1.5, 0.5, 0.5,
-3.848016, -4.161544, 0, 0, 1.5, 0.5, 0.5,
-3.848016, -4.161544, 2, 0, -0.5, 0.5, 0.5,
-3.848016, -4.161544, 2, 1, -0.5, 0.5, 0.5,
-3.848016, -4.161544, 2, 1, 1.5, 0.5, 0.5,
-3.848016, -4.161544, 2, 0, 1.5, 0.5, 0.5,
-3.848016, -4.161544, 4, 0, -0.5, 0.5, 0.5,
-3.848016, -4.161544, 4, 1, -0.5, 0.5, 0.5,
-3.848016, -4.161544, 4, 1, 1.5, 0.5, 0.5,
-3.848016, -4.161544, 4, 0, 1.5, 0.5, 0.5
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
-3.31203, -3.65593, -5.304901,
-3.31203, 3.0856, -5.304901,
-3.31203, -3.65593, 5.054963,
-3.31203, 3.0856, 5.054963,
-3.31203, -3.65593, -5.304901,
-3.31203, -3.65593, 5.054963,
-3.31203, 3.0856, -5.304901,
-3.31203, 3.0856, 5.054963,
-3.31203, -3.65593, -5.304901,
3.834449, -3.65593, -5.304901,
-3.31203, -3.65593, 5.054963,
3.834449, -3.65593, 5.054963,
-3.31203, 3.0856, -5.304901,
3.834449, 3.0856, -5.304901,
-3.31203, 3.0856, 5.054963,
3.834449, 3.0856, 5.054963,
3.834449, -3.65593, -5.304901,
3.834449, 3.0856, -5.304901,
3.834449, -3.65593, 5.054963,
3.834449, 3.0856, 5.054963,
3.834449, -3.65593, -5.304901,
3.834449, -3.65593, 5.054963,
3.834449, 3.0856, -5.304901,
3.834449, 3.0856, 5.054963
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
var radius = 7.623911;
var distance = 33.91964;
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
mvMatrix.translate( -0.2612095, 0.285165, 0.1249688 );
mvMatrix.scale( 1.153452, 1.222738, 0.7956786 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.91964);
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


