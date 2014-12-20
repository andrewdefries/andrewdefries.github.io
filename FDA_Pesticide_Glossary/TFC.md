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
-3.104207, -1.374703, -1.792921, 1, 0, 0, 1,
-3.104078, -1.25464, -0.493942, 1, 0.007843138, 0, 1,
-2.876806, -0.6752733, -1.337692, 1, 0.01176471, 0, 1,
-2.678629, -0.02442847, -0.8279742, 1, 0.01960784, 0, 1,
-2.631076, -1.413611, -2.906959, 1, 0.02352941, 0, 1,
-2.627588, 0.09661719, -1.376784, 1, 0.03137255, 0, 1,
-2.467334, 1.072079, -1.875423, 1, 0.03529412, 0, 1,
-2.412268, -0.7832164, -2.904422, 1, 0.04313726, 0, 1,
-2.356452, 0.5337538, -1.801125, 1, 0.04705882, 0, 1,
-2.34968, 2.12416, -1.886131, 1, 0.05490196, 0, 1,
-2.268149, -0.9374216, -1.976879, 1, 0.05882353, 0, 1,
-2.251173, 0.2260533, -3.289607, 1, 0.06666667, 0, 1,
-2.215844, -1.704229, -2.838656, 1, 0.07058824, 0, 1,
-2.166882, 0.4428294, -0.3384579, 1, 0.07843138, 0, 1,
-2.16442, -1.73958, -2.775275, 1, 0.08235294, 0, 1,
-2.154629, 0.3907843, -2.179465, 1, 0.09019608, 0, 1,
-2.01434, -0.2254738, -2.176892, 1, 0.09411765, 0, 1,
-1.967055, -1.67055, -1.859149, 1, 0.1019608, 0, 1,
-1.963526, 0.05434905, -1.45835, 1, 0.1098039, 0, 1,
-1.959758, 1.249775, -1.066594, 1, 0.1137255, 0, 1,
-1.925079, -0.3052988, -1.467639, 1, 0.1215686, 0, 1,
-1.921437, -0.4329855, -1.398834, 1, 0.1254902, 0, 1,
-1.913508, 0.2547146, 0.3860627, 1, 0.1333333, 0, 1,
-1.908733, -0.8044992, -1.524248, 1, 0.1372549, 0, 1,
-1.86161, -1.148695, -1.502612, 1, 0.145098, 0, 1,
-1.851119, 2.6068, -1.713617, 1, 0.1490196, 0, 1,
-1.846387, -0.4873277, -2.506047, 1, 0.1568628, 0, 1,
-1.840086, -1.463871, -1.539107, 1, 0.1607843, 0, 1,
-1.837701, 2.911245, 0.1014381, 1, 0.1686275, 0, 1,
-1.805539, 1.382275, 0.06840511, 1, 0.172549, 0, 1,
-1.800231, 1.173159, -1.034438, 1, 0.1803922, 0, 1,
-1.788023, -1.179641, -1.892885, 1, 0.1843137, 0, 1,
-1.782851, 0.6481373, -3.767231, 1, 0.1921569, 0, 1,
-1.764637, 0.1965477, -1.998067, 1, 0.1960784, 0, 1,
-1.757518, 1.215538, -0.9453408, 1, 0.2039216, 0, 1,
-1.742961, 1.113057, -2.678095, 1, 0.2117647, 0, 1,
-1.739127, -0.1031095, -2.530622, 1, 0.2156863, 0, 1,
-1.727544, -0.157798, -0.3663056, 1, 0.2235294, 0, 1,
-1.721812, 0.9227455, -0.5271749, 1, 0.227451, 0, 1,
-1.699431, -0.6119634, -1.810839, 1, 0.2352941, 0, 1,
-1.686198, 1.811001, 0.7139053, 1, 0.2392157, 0, 1,
-1.674821, -0.118363, -1.422503, 1, 0.2470588, 0, 1,
-1.663607, 0.876433, -1.105116, 1, 0.2509804, 0, 1,
-1.660954, -1.649327, -3.851693, 1, 0.2588235, 0, 1,
-1.657351, -1.426956, -2.439221, 1, 0.2627451, 0, 1,
-1.653746, -0.9674518, -1.577492, 1, 0.2705882, 0, 1,
-1.633936, 0.8454785, 0.0432982, 1, 0.2745098, 0, 1,
-1.629544, 0.1534124, -2.704206, 1, 0.282353, 0, 1,
-1.618114, 1.001786, -1.405605, 1, 0.2862745, 0, 1,
-1.570548, 0.7030383, -0.1605594, 1, 0.2941177, 0, 1,
-1.563192, -0.132465, -0.08494046, 1, 0.3019608, 0, 1,
-1.548573, -1.069397, -4.418747, 1, 0.3058824, 0, 1,
-1.54111, 1.662888, -0.8296854, 1, 0.3137255, 0, 1,
-1.540977, -1.364218, -2.031122, 1, 0.3176471, 0, 1,
-1.538393, 1.599378, -1.114767, 1, 0.3254902, 0, 1,
-1.526, -0.7213281, -2.109609, 1, 0.3294118, 0, 1,
-1.514601, -0.2912718, -2.119222, 1, 0.3372549, 0, 1,
-1.505162, -1.057632, -1.766586, 1, 0.3411765, 0, 1,
-1.503693, 0.4533869, -2.395432, 1, 0.3490196, 0, 1,
-1.500328, -1.283734, -4.389992, 1, 0.3529412, 0, 1,
-1.500189, -1.402556, -1.942773, 1, 0.3607843, 0, 1,
-1.499584, 0.07415207, -2.907801, 1, 0.3647059, 0, 1,
-1.493608, 1.048587, 0.4767897, 1, 0.372549, 0, 1,
-1.486706, 0.298123, -1.540491, 1, 0.3764706, 0, 1,
-1.473717, -0.09472038, -0.2328445, 1, 0.3843137, 0, 1,
-1.469669, -0.9903442, -2.422026, 1, 0.3882353, 0, 1,
-1.458556, -0.0003046406, -0.7035497, 1, 0.3960784, 0, 1,
-1.456527, -0.593344, -2.426485, 1, 0.4039216, 0, 1,
-1.435336, 0.8020912, -1.528725, 1, 0.4078431, 0, 1,
-1.431417, 0.8249795, -0.1362629, 1, 0.4156863, 0, 1,
-1.430922, 0.6309583, -1.784803, 1, 0.4196078, 0, 1,
-1.427001, -1.854404, -2.457722, 1, 0.427451, 0, 1,
-1.424075, -0.3995706, -1.003758, 1, 0.4313726, 0, 1,
-1.423649, -1.168792, 0.08318085, 1, 0.4392157, 0, 1,
-1.405642, -0.7039454, -1.345773, 1, 0.4431373, 0, 1,
-1.399061, -0.2109642, -3.699407, 1, 0.4509804, 0, 1,
-1.397149, 0.6573741, -0.7197645, 1, 0.454902, 0, 1,
-1.388992, 1.031512, -0.850475, 1, 0.4627451, 0, 1,
-1.379764, 0.246496, -0.7691098, 1, 0.4666667, 0, 1,
-1.377597, 1.650284, -1.630339, 1, 0.4745098, 0, 1,
-1.377523, -0.4587739, -3.971769, 1, 0.4784314, 0, 1,
-1.376501, -0.1969912, -0.7161187, 1, 0.4862745, 0, 1,
-1.359487, 1.301071, -1.590783, 1, 0.4901961, 0, 1,
-1.357068, -0.304702, -1.418116, 1, 0.4980392, 0, 1,
-1.34423, 0.4941444, -0.130855, 1, 0.5058824, 0, 1,
-1.343891, 0.9341641, -0.8878273, 1, 0.509804, 0, 1,
-1.340121, 0.5508381, -1.197648, 1, 0.5176471, 0, 1,
-1.328164, -0.926932, -2.383964, 1, 0.5215687, 0, 1,
-1.324871, 0.2162927, -1.337118, 1, 0.5294118, 0, 1,
-1.318768, 0.05437504, 0.2499628, 1, 0.5333334, 0, 1,
-1.314012, -1.101991, -2.856083, 1, 0.5411765, 0, 1,
-1.303846, 0.228164, -1.92161, 1, 0.5450981, 0, 1,
-1.297112, -0.09247495, -1.675548, 1, 0.5529412, 0, 1,
-1.293538, -0.6811993, -3.255106, 1, 0.5568628, 0, 1,
-1.285288, -1.11396, -3.765523, 1, 0.5647059, 0, 1,
-1.278418, 1.597636, 1.351953, 1, 0.5686275, 0, 1,
-1.276248, -1.34389, -4.219219, 1, 0.5764706, 0, 1,
-1.251803, -0.1696444, -0.7534435, 1, 0.5803922, 0, 1,
-1.250648, -1.844709, -2.117371, 1, 0.5882353, 0, 1,
-1.249587, -0.5191296, -0.05169139, 1, 0.5921569, 0, 1,
-1.248032, -1.18699, 0.3916607, 1, 0.6, 0, 1,
-1.241117, -1.650027, -3.319591, 1, 0.6078432, 0, 1,
-1.23043, 0.6184254, -0.1612558, 1, 0.6117647, 0, 1,
-1.2164, 0.8412528, -0.7967646, 1, 0.6196079, 0, 1,
-1.207992, -2.081816, -3.273718, 1, 0.6235294, 0, 1,
-1.200558, 1.131112, -0.01676171, 1, 0.6313726, 0, 1,
-1.187906, -1.120577, -3.675193, 1, 0.6352941, 0, 1,
-1.180326, 0.1289824, -1.380166, 1, 0.6431373, 0, 1,
-1.175959, -0.752811, -0.4007704, 1, 0.6470588, 0, 1,
-1.175953, -0.2573375, -1.406982, 1, 0.654902, 0, 1,
-1.174585, -3.329036, -2.507582, 1, 0.6588235, 0, 1,
-1.173497, -1.35119, -2.932522, 1, 0.6666667, 0, 1,
-1.173254, -0.3934808, -1.991821, 1, 0.6705883, 0, 1,
-1.17198, 1.709278, 0.512132, 1, 0.6784314, 0, 1,
-1.170026, -1.077945, -2.083145, 1, 0.682353, 0, 1,
-1.169837, -0.06289648, -1.548298, 1, 0.6901961, 0, 1,
-1.163619, 1.156647, 0.3405617, 1, 0.6941177, 0, 1,
-1.162325, 1.420183, -0.1005925, 1, 0.7019608, 0, 1,
-1.152267, -0.2963404, -2.279842, 1, 0.7098039, 0, 1,
-1.148089, -0.1847, -1.519783, 1, 0.7137255, 0, 1,
-1.139862, -1.280876, -2.060823, 1, 0.7215686, 0, 1,
-1.138923, -0.43411, -2.345076, 1, 0.7254902, 0, 1,
-1.135833, -0.9578044, -3.831472, 1, 0.7333333, 0, 1,
-1.135278, 0.8906111, 0.8623989, 1, 0.7372549, 0, 1,
-1.13476, -0.2655852, -1.867458, 1, 0.7450981, 0, 1,
-1.131349, -0.9871545, -1.289528, 1, 0.7490196, 0, 1,
-1.125117, 0.2599438, -1.240564, 1, 0.7568628, 0, 1,
-1.122321, -1.523137, -3.946589, 1, 0.7607843, 0, 1,
-1.12227, 0.04527732, -2.729882, 1, 0.7686275, 0, 1,
-1.116619, -1.856337, -2.713134, 1, 0.772549, 0, 1,
-1.107985, 0.08781562, -1.14463, 1, 0.7803922, 0, 1,
-1.106822, -0.4373774, -1.601486, 1, 0.7843137, 0, 1,
-1.106351, 0.3245953, -1.475702, 1, 0.7921569, 0, 1,
-1.10156, 1.279687, 0.5470863, 1, 0.7960784, 0, 1,
-1.086055, -0.5267866, -2.479867, 1, 0.8039216, 0, 1,
-1.082634, -0.2374435, -1.838078, 1, 0.8117647, 0, 1,
-1.082171, 0.2658744, -1.502985, 1, 0.8156863, 0, 1,
-1.080094, -1.393906, -3.058976, 1, 0.8235294, 0, 1,
-1.073292, 0.6324363, -1.867701, 1, 0.827451, 0, 1,
-1.070218, -0.1266696, -2.004143, 1, 0.8352941, 0, 1,
-1.068019, -0.2466451, -2.627867, 1, 0.8392157, 0, 1,
-1.064123, -0.4089074, -1.576804, 1, 0.8470588, 0, 1,
-1.057747, -0.9505036, -2.207554, 1, 0.8509804, 0, 1,
-1.046389, 0.9635868, -1.097582, 1, 0.8588235, 0, 1,
-1.03509, -1.421918, -3.357565, 1, 0.8627451, 0, 1,
-1.031539, 0.6485929, 0.8291452, 1, 0.8705882, 0, 1,
-1.029089, 1.206603, -1.894837, 1, 0.8745098, 0, 1,
-1.027525, -0.3644283, -2.418555, 1, 0.8823529, 0, 1,
-1.025313, -0.401059, -2.539917, 1, 0.8862745, 0, 1,
-1.023119, -0.9569968, -2.168435, 1, 0.8941177, 0, 1,
-1.022878, 0.7517741, -1.711968, 1, 0.8980392, 0, 1,
-1.021065, 0.2470994, -1.864967, 1, 0.9058824, 0, 1,
-1.019654, 0.8816185, -2.131696, 1, 0.9137255, 0, 1,
-1.016805, -0.1002236, -1.826114, 1, 0.9176471, 0, 1,
-1.016247, 1.043006, 0.8032175, 1, 0.9254902, 0, 1,
-1.011721, 0.8912175, -1.741508, 1, 0.9294118, 0, 1,
-1.006936, 0.2317669, -3.255426, 1, 0.9372549, 0, 1,
-1.004781, 1.228089, -0.2962418, 1, 0.9411765, 0, 1,
-1.000607, -0.05834264, -2.052554, 1, 0.9490196, 0, 1,
-0.9964404, 0.6806454, -0.8360836, 1, 0.9529412, 0, 1,
-0.9962346, 0.4486229, -0.935783, 1, 0.9607843, 0, 1,
-0.9937941, 1.288503, -0.8009676, 1, 0.9647059, 0, 1,
-0.9837415, -0.2752281, -0.4615381, 1, 0.972549, 0, 1,
-0.9800507, 0.3182454, -2.21156, 1, 0.9764706, 0, 1,
-0.9785514, -0.07181025, -1.174958, 1, 0.9843137, 0, 1,
-0.9739112, -0.6369071, -2.448803, 1, 0.9882353, 0, 1,
-0.9733236, -0.5221057, -1.619341, 1, 0.9960784, 0, 1,
-0.9722279, 0.04281043, -1.920761, 0.9960784, 1, 0, 1,
-0.9694045, -0.2522189, -1.674124, 0.9921569, 1, 0, 1,
-0.9641061, -0.5018424, -2.065586, 0.9843137, 1, 0, 1,
-0.9626732, -0.1427643, -3.104055, 0.9803922, 1, 0, 1,
-0.9530776, -0.1486374, -2.232365, 0.972549, 1, 0, 1,
-0.9474172, 0.7085676, -0.1043855, 0.9686275, 1, 0, 1,
-0.9445646, -2.030281, -3.892199, 0.9607843, 1, 0, 1,
-0.942626, -1.035669, -3.341271, 0.9568627, 1, 0, 1,
-0.9381489, -0.7378449, -2.335943, 0.9490196, 1, 0, 1,
-0.9374902, 0.861786, -1.822877, 0.945098, 1, 0, 1,
-0.9356769, -0.01609652, -1.245467, 0.9372549, 1, 0, 1,
-0.927615, 0.4103962, -1.604679, 0.9333333, 1, 0, 1,
-0.926458, -0.5867346, -2.253387, 0.9254902, 1, 0, 1,
-0.9260145, -1.262618, -1.945872, 0.9215686, 1, 0, 1,
-0.9236737, 1.888641, -2.557681, 0.9137255, 1, 0, 1,
-0.9204782, -0.4300466, -1.13341, 0.9098039, 1, 0, 1,
-0.9181392, -1.454398, -3.218488, 0.9019608, 1, 0, 1,
-0.9164749, 0.9085309, -0.9315723, 0.8941177, 1, 0, 1,
-0.914881, 0.71548, -1.628615, 0.8901961, 1, 0, 1,
-0.9114659, 0.3612993, -3.437759, 0.8823529, 1, 0, 1,
-0.9107802, 0.1339023, 0.2899558, 0.8784314, 1, 0, 1,
-0.9002841, 0.7130949, -0.3838928, 0.8705882, 1, 0, 1,
-0.896159, -0.2287712, -2.249248, 0.8666667, 1, 0, 1,
-0.8958659, -0.02136155, -2.090861, 0.8588235, 1, 0, 1,
-0.8873219, -1.544708, -2.701857, 0.854902, 1, 0, 1,
-0.8857454, 0.4329244, -0.08328556, 0.8470588, 1, 0, 1,
-0.8822322, 1.129968, -0.56635, 0.8431373, 1, 0, 1,
-0.8799574, 0.4022644, 0.6354529, 0.8352941, 1, 0, 1,
-0.8788809, 0.9380728, -1.523407, 0.8313726, 1, 0, 1,
-0.8783833, -0.1540037, -2.523114, 0.8235294, 1, 0, 1,
-0.8743607, 0.1810933, -1.044658, 0.8196079, 1, 0, 1,
-0.8714242, -0.8978894, -1.353794, 0.8117647, 1, 0, 1,
-0.8690355, 1.509815, -1.366483, 0.8078431, 1, 0, 1,
-0.8648456, 0.5529007, -2.372279, 0.8, 1, 0, 1,
-0.8629767, -0.7050572, -3.196346, 0.7921569, 1, 0, 1,
-0.8594939, 1.453518, -1.066756, 0.7882353, 1, 0, 1,
-0.8580641, -0.5396025, -0.9578215, 0.7803922, 1, 0, 1,
-0.8539503, 1.198821, -0.3539586, 0.7764706, 1, 0, 1,
-0.8524569, 0.9422789, -1.233139, 0.7686275, 1, 0, 1,
-0.8509256, 0.7752159, -0.9972526, 0.7647059, 1, 0, 1,
-0.8480669, 1.112939, 0.7230241, 0.7568628, 1, 0, 1,
-0.8392273, 0.4985543, -1.548884, 0.7529412, 1, 0, 1,
-0.8369442, -0.8173988, -1.617616, 0.7450981, 1, 0, 1,
-0.836644, -1.396908, -1.739688, 0.7411765, 1, 0, 1,
-0.8353019, 0.7106789, -1.016798, 0.7333333, 1, 0, 1,
-0.8270605, -1.284998, -3.284839, 0.7294118, 1, 0, 1,
-0.8215851, 0.3361787, -0.04447482, 0.7215686, 1, 0, 1,
-0.8174682, -0.9123373, -2.802588, 0.7176471, 1, 0, 1,
-0.8128062, -0.4379247, -3.120038, 0.7098039, 1, 0, 1,
-0.811673, -0.3543077, -1.116031, 0.7058824, 1, 0, 1,
-0.8022969, 2.318005, -0.9519582, 0.6980392, 1, 0, 1,
-0.7865123, -1.346077, -2.483035, 0.6901961, 1, 0, 1,
-0.7810052, -2.381059, -3.514354, 0.6862745, 1, 0, 1,
-0.7791043, -0.1475997, -1.570105, 0.6784314, 1, 0, 1,
-0.7776358, 1.135536, -0.2998284, 0.6745098, 1, 0, 1,
-0.7762319, -0.9212106, -1.794834, 0.6666667, 1, 0, 1,
-0.7744976, -1.446193, -4.024431, 0.6627451, 1, 0, 1,
-0.7739371, -0.8351324, -1.454825, 0.654902, 1, 0, 1,
-0.7732008, 0.1428209, -1.483189, 0.6509804, 1, 0, 1,
-0.7602763, 0.2855283, -1.502033, 0.6431373, 1, 0, 1,
-0.7592094, 0.4691401, -2.825069, 0.6392157, 1, 0, 1,
-0.7574356, -0.7334492, -1.333323, 0.6313726, 1, 0, 1,
-0.7570707, 0.2021227, -1.991592, 0.627451, 1, 0, 1,
-0.7557514, -0.7601442, -2.721523, 0.6196079, 1, 0, 1,
-0.744211, 0.1271486, -1.412928, 0.6156863, 1, 0, 1,
-0.7435352, -1.006611, -1.950822, 0.6078432, 1, 0, 1,
-0.7412931, -0.04851046, -2.253068, 0.6039216, 1, 0, 1,
-0.7402536, 0.4567025, -1.820454, 0.5960785, 1, 0, 1,
-0.7398112, 1.26258, 1.905651, 0.5882353, 1, 0, 1,
-0.7356724, 0.6042944, -0.6620386, 0.5843138, 1, 0, 1,
-0.7320323, 1.592868, 0.734553, 0.5764706, 1, 0, 1,
-0.7318742, -1.212586, -3.324763, 0.572549, 1, 0, 1,
-0.7272652, 1.05121, 0.002686817, 0.5647059, 1, 0, 1,
-0.7267668, 0.341114, -0.5499592, 0.5607843, 1, 0, 1,
-0.7266828, 0.8323452, 0.09763962, 0.5529412, 1, 0, 1,
-0.7237188, 0.9357743, -1.036391, 0.5490196, 1, 0, 1,
-0.7186633, -0.4733474, -2.095281, 0.5411765, 1, 0, 1,
-0.7174764, 0.2737086, -1.651233, 0.5372549, 1, 0, 1,
-0.7166654, 1.093958, -0.573994, 0.5294118, 1, 0, 1,
-0.7161859, -2.396067, -1.745017, 0.5254902, 1, 0, 1,
-0.7149222, 0.6564684, -1.036276, 0.5176471, 1, 0, 1,
-0.713501, 0.4041516, 0.5935633, 0.5137255, 1, 0, 1,
-0.7117208, -0.3502457, -2.31093, 0.5058824, 1, 0, 1,
-0.7098444, -0.4368822, -2.758821, 0.5019608, 1, 0, 1,
-0.7037399, 1.967408, -0.5061375, 0.4941176, 1, 0, 1,
-0.7014616, 0.7403575, -1.432891, 0.4862745, 1, 0, 1,
-0.6991931, 0.6413868, -0.2445612, 0.4823529, 1, 0, 1,
-0.6947285, 0.4370798, -0.7013682, 0.4745098, 1, 0, 1,
-0.6930006, -0.08585283, -1.383601, 0.4705882, 1, 0, 1,
-0.6929969, 0.6836519, -0.340953, 0.4627451, 1, 0, 1,
-0.691415, -0.3602433, -1.714295, 0.4588235, 1, 0, 1,
-0.6853013, 0.9137931, -1.644317, 0.4509804, 1, 0, 1,
-0.6852617, -1.020557, -1.945762, 0.4470588, 1, 0, 1,
-0.6844853, -1.085894, -2.983812, 0.4392157, 1, 0, 1,
-0.6807246, -1.977782, -3.596052, 0.4352941, 1, 0, 1,
-0.6799099, -0.9284267, -2.995409, 0.427451, 1, 0, 1,
-0.6770037, 0.5967826, -1.01246, 0.4235294, 1, 0, 1,
-0.6766782, 1.07518, -1.405488, 0.4156863, 1, 0, 1,
-0.6750925, 1.70646, 0.3121324, 0.4117647, 1, 0, 1,
-0.6592636, -0.5364574, -2.599672, 0.4039216, 1, 0, 1,
-0.6579197, -1.507348, -1.834399, 0.3960784, 1, 0, 1,
-0.6533027, -0.7664139, -3.819048, 0.3921569, 1, 0, 1,
-0.641352, -0.7092642, -2.297633, 0.3843137, 1, 0, 1,
-0.6403708, 1.61849, -0.1289481, 0.3803922, 1, 0, 1,
-0.6370515, 0.1080159, -2.289344, 0.372549, 1, 0, 1,
-0.636836, 1.479329, 0.3833485, 0.3686275, 1, 0, 1,
-0.6364089, 0.2634115, -2.490212, 0.3607843, 1, 0, 1,
-0.6354599, -0.8355063, -1.99108, 0.3568628, 1, 0, 1,
-0.6338512, -0.8331453, -4.204583, 0.3490196, 1, 0, 1,
-0.6325496, -1.734715, -2.856879, 0.345098, 1, 0, 1,
-0.6314595, -0.2041168, -0.1387371, 0.3372549, 1, 0, 1,
-0.6295242, -1.53395, -1.913836, 0.3333333, 1, 0, 1,
-0.626367, 0.2887967, -1.068713, 0.3254902, 1, 0, 1,
-0.620829, -0.1174497, -1.078231, 0.3215686, 1, 0, 1,
-0.6203334, 2.212183, -0.8106602, 0.3137255, 1, 0, 1,
-0.6193534, -1.064197, -0.7779896, 0.3098039, 1, 0, 1,
-0.6085876, 0.124316, -1.780686, 0.3019608, 1, 0, 1,
-0.6065454, -1.293288, -2.47481, 0.2941177, 1, 0, 1,
-0.6045477, 0.3001569, -0.2486033, 0.2901961, 1, 0, 1,
-0.6040471, -0.7814305, -2.384208, 0.282353, 1, 0, 1,
-0.5928439, 0.2300976, -1.368698, 0.2784314, 1, 0, 1,
-0.5904481, 0.5390162, -0.8599647, 0.2705882, 1, 0, 1,
-0.5887658, 1.096746, 0.2142601, 0.2666667, 1, 0, 1,
-0.5806535, -0.6653737, -2.546995, 0.2588235, 1, 0, 1,
-0.577003, 1.961297, 0.525234, 0.254902, 1, 0, 1,
-0.5765858, -0.265757, -2.328362, 0.2470588, 1, 0, 1,
-0.5711295, -0.545314, -2.811127, 0.2431373, 1, 0, 1,
-0.5696488, 0.3296186, 0.3381764, 0.2352941, 1, 0, 1,
-0.5689778, -0.2026252, -0.8883408, 0.2313726, 1, 0, 1,
-0.5689595, -0.6962905, -3.398554, 0.2235294, 1, 0, 1,
-0.5689234, 0.5929758, 0.8651628, 0.2196078, 1, 0, 1,
-0.5678792, -2.31266, -3.562588, 0.2117647, 1, 0, 1,
-0.5632412, 0.9021536, -2.056081, 0.2078431, 1, 0, 1,
-0.5632095, 1.134227, -1.38053, 0.2, 1, 0, 1,
-0.5626121, -0.6310584, -1.605267, 0.1921569, 1, 0, 1,
-0.56088, -0.8443367, -2.483566, 0.1882353, 1, 0, 1,
-0.5541558, 0.9713405, -2.092583, 0.1803922, 1, 0, 1,
-0.5514899, -0.2235613, -0.8274, 0.1764706, 1, 0, 1,
-0.550373, 1.020917, -0.3113235, 0.1686275, 1, 0, 1,
-0.5457017, -1.4062, -2.382351, 0.1647059, 1, 0, 1,
-0.5448132, -0.1342761, -2.070239, 0.1568628, 1, 0, 1,
-0.5437543, 1.03328, 0.6859375, 0.1529412, 1, 0, 1,
-0.5285857, 0.08666225, -3.692187, 0.145098, 1, 0, 1,
-0.5268416, -0.01252776, -0.8366139, 0.1411765, 1, 0, 1,
-0.52178, 0.1051133, -0.001151507, 0.1333333, 1, 0, 1,
-0.5198085, 0.5443817, -0.09124903, 0.1294118, 1, 0, 1,
-0.515057, 2.072453, -1.01177, 0.1215686, 1, 0, 1,
-0.5102571, 1.550384, -0.5189605, 0.1176471, 1, 0, 1,
-0.50978, 0.002865186, 0.003042776, 0.1098039, 1, 0, 1,
-0.5089676, -0.3688172, -3.75218, 0.1058824, 1, 0, 1,
-0.5077228, 0.8796996, -0.2890459, 0.09803922, 1, 0, 1,
-0.5072166, 0.7947995, -1.02564, 0.09019608, 1, 0, 1,
-0.5069374, 0.00565836, -2.473022, 0.08627451, 1, 0, 1,
-0.5030684, -1.810897, -2.32549, 0.07843138, 1, 0, 1,
-0.502261, -1.990822, -3.679303, 0.07450981, 1, 0, 1,
-0.5008487, 0.1512545, -0.9483557, 0.06666667, 1, 0, 1,
-0.4959492, 1.763116, 1.927603, 0.0627451, 1, 0, 1,
-0.4948055, -1.383187, -2.642526, 0.05490196, 1, 0, 1,
-0.4866239, 0.7436597, 0.5819346, 0.05098039, 1, 0, 1,
-0.4834651, 1.273963, 0.7173759, 0.04313726, 1, 0, 1,
-0.4820658, -0.4609012, -2.4015, 0.03921569, 1, 0, 1,
-0.4795257, -0.967261, -3.205258, 0.03137255, 1, 0, 1,
-0.4781094, 0.8202744, -0.7141872, 0.02745098, 1, 0, 1,
-0.4707068, 1.897656, -0.8152368, 0.01960784, 1, 0, 1,
-0.464823, 0.7649459, 0.25721, 0.01568628, 1, 0, 1,
-0.4585911, -0.2024231, -2.758886, 0.007843138, 1, 0, 1,
-0.4578301, -0.8100412, -1.445648, 0.003921569, 1, 0, 1,
-0.4565925, -1.190491, -2.588447, 0, 1, 0.003921569, 1,
-0.4517569, 0.8913017, -1.040335, 0, 1, 0.01176471, 1,
-0.4489223, -0.6601926, -2.342484, 0, 1, 0.01568628, 1,
-0.4479403, 0.7275582, -1.007242, 0, 1, 0.02352941, 1,
-0.4474327, -0.4137021, -2.42585, 0, 1, 0.02745098, 1,
-0.4472575, 0.4650122, -0.2831297, 0, 1, 0.03529412, 1,
-0.4469882, -0.8796808, -2.707388, 0, 1, 0.03921569, 1,
-0.4425701, -1.663637, -1.183138, 0, 1, 0.04705882, 1,
-0.4424309, 0.07970912, -0.2176274, 0, 1, 0.05098039, 1,
-0.437195, -1.08001, -0.9041404, 0, 1, 0.05882353, 1,
-0.4364848, 0.6855831, 0.6702166, 0, 1, 0.0627451, 1,
-0.4330255, 0.2649228, -1.187284, 0, 1, 0.07058824, 1,
-0.4249018, -0.3734097, -1.901955, 0, 1, 0.07450981, 1,
-0.4195936, -0.7394148, -3.806235, 0, 1, 0.08235294, 1,
-0.4190651, 0.9794447, 1.03001, 0, 1, 0.08627451, 1,
-0.4190121, 0.5032988, -0.9717144, 0, 1, 0.09411765, 1,
-0.4183457, 1.168975, -1.048378, 0, 1, 0.1019608, 1,
-0.4174288, -0.947165, -2.15997, 0, 1, 0.1058824, 1,
-0.4156809, 0.4080547, 1.418118, 0, 1, 0.1137255, 1,
-0.4056539, -0.6790045, -1.477874, 0, 1, 0.1176471, 1,
-0.4052293, 0.1858264, -1.438951, 0, 1, 0.1254902, 1,
-0.401965, -0.1707443, -3.265248, 0, 1, 0.1294118, 1,
-0.401052, 0.2901923, -1.376285, 0, 1, 0.1372549, 1,
-0.3989053, -0.6638221, -4.29617, 0, 1, 0.1411765, 1,
-0.3974502, -0.3652036, -3.634805, 0, 1, 0.1490196, 1,
-0.3926608, -0.1666269, -2.105961, 0, 1, 0.1529412, 1,
-0.3905836, -1.118191, -4.767435, 0, 1, 0.1607843, 1,
-0.3898757, -0.8999801, -3.401645, 0, 1, 0.1647059, 1,
-0.3840713, -0.9359536, -2.580514, 0, 1, 0.172549, 1,
-0.3813674, -1.369149, -0.5589276, 0, 1, 0.1764706, 1,
-0.3807549, -0.4043896, -1.871178, 0, 1, 0.1843137, 1,
-0.3713672, -0.9909815, -3.944749, 0, 1, 0.1882353, 1,
-0.3687664, 1.087477, 0.4558401, 0, 1, 0.1960784, 1,
-0.3643353, -0.2544776, -1.749168, 0, 1, 0.2039216, 1,
-0.357517, -0.9805413, -2.856217, 0, 1, 0.2078431, 1,
-0.3525484, 0.4071917, -1.078287, 0, 1, 0.2156863, 1,
-0.3525192, 1.183933, 1.135581, 0, 1, 0.2196078, 1,
-0.3502078, 0.2554564, -1.160877, 0, 1, 0.227451, 1,
-0.3487518, -0.6368175, -2.957932, 0, 1, 0.2313726, 1,
-0.3486145, -0.6457988, -4.426743, 0, 1, 0.2392157, 1,
-0.3474163, -1.385403, -3.954133, 0, 1, 0.2431373, 1,
-0.3434668, -1.321465, -3.405246, 0, 1, 0.2509804, 1,
-0.3433096, 0.5952837, -0.5931948, 0, 1, 0.254902, 1,
-0.3432779, 0.7635239, -0.6013799, 0, 1, 0.2627451, 1,
-0.342454, -1.259826, -1.673272, 0, 1, 0.2666667, 1,
-0.3419659, 0.8422807, 0.4106829, 0, 1, 0.2745098, 1,
-0.3407629, 0.4726462, 0.2310078, 0, 1, 0.2784314, 1,
-0.3406446, 0.03385443, -0.711265, 0, 1, 0.2862745, 1,
-0.3384814, 2.007337, 0.2986494, 0, 1, 0.2901961, 1,
-0.3286167, -1.133813, -1.683849, 0, 1, 0.2980392, 1,
-0.3254489, -0.1002798, -0.8680028, 0, 1, 0.3058824, 1,
-0.3179879, 2.078599, -0.2888758, 0, 1, 0.3098039, 1,
-0.3080526, -0.1741441, -0.8771228, 0, 1, 0.3176471, 1,
-0.3062332, -0.4174573, -2.386204, 0, 1, 0.3215686, 1,
-0.3060722, -0.5689628, -3.28676, 0, 1, 0.3294118, 1,
-0.3055718, -1.13132, -3.714212, 0, 1, 0.3333333, 1,
-0.3010376, -0.1046726, -1.753817, 0, 1, 0.3411765, 1,
-0.3005344, 0.1925171, -1.519398, 0, 1, 0.345098, 1,
-0.2980269, -0.007767211, -1.134551, 0, 1, 0.3529412, 1,
-0.2976562, -0.7344732, -2.645211, 0, 1, 0.3568628, 1,
-0.2932461, 1.098118, -0.1959692, 0, 1, 0.3647059, 1,
-0.2861111, -0.3952732, -4.178524, 0, 1, 0.3686275, 1,
-0.2851707, -0.164429, -1.995963, 0, 1, 0.3764706, 1,
-0.2795824, 0.8522041, 0.07413018, 0, 1, 0.3803922, 1,
-0.2786375, -1.135018, -2.32431, 0, 1, 0.3882353, 1,
-0.2759227, -0.8001536, -3.169766, 0, 1, 0.3921569, 1,
-0.2731595, 0.7950395, 0.3503721, 0, 1, 0.4, 1,
-0.2721186, -0.4583343, -2.513759, 0, 1, 0.4078431, 1,
-0.2694296, -1.81946, -2.764951, 0, 1, 0.4117647, 1,
-0.2677376, -0.9228464, -1.659412, 0, 1, 0.4196078, 1,
-0.2662722, -0.6262625, -0.6950134, 0, 1, 0.4235294, 1,
-0.2623122, 1.284464, -3.123737, 0, 1, 0.4313726, 1,
-0.2553499, 0.7080807, -0.6271449, 0, 1, 0.4352941, 1,
-0.2526519, 1.52206, -0.1002257, 0, 1, 0.4431373, 1,
-0.2508999, 0.03060114, -3.269803, 0, 1, 0.4470588, 1,
-0.248651, -0.1552222, -1.402736, 0, 1, 0.454902, 1,
-0.2485786, 0.5574183, -0.3701404, 0, 1, 0.4588235, 1,
-0.2403003, 1.467328, -0.3331149, 0, 1, 0.4666667, 1,
-0.2379751, -0.8745413, -4.158903, 0, 1, 0.4705882, 1,
-0.2378284, -1.084684, -2.070608, 0, 1, 0.4784314, 1,
-0.2360184, -0.6685095, -2.607319, 0, 1, 0.4823529, 1,
-0.234262, -1.447297, -4.182648, 0, 1, 0.4901961, 1,
-0.2320415, -1.321243, -0.8741324, 0, 1, 0.4941176, 1,
-0.2285758, 0.5079473, -1.694278, 0, 1, 0.5019608, 1,
-0.2271126, -0.3012279, -2.719795, 0, 1, 0.509804, 1,
-0.218902, -0.0208803, 1.07847, 0, 1, 0.5137255, 1,
-0.2100213, -0.1605308, -2.027986, 0, 1, 0.5215687, 1,
-0.209039, 1.192192, -0.7025512, 0, 1, 0.5254902, 1,
-0.2084328, 0.6386611, -1.589554, 0, 1, 0.5333334, 1,
-0.2075712, 1.052215, -0.1148763, 0, 1, 0.5372549, 1,
-0.2055074, -1.018919, -2.775351, 0, 1, 0.5450981, 1,
-0.205364, 1.240449, 0.9340546, 0, 1, 0.5490196, 1,
-0.197273, -0.6726618, -3.589542, 0, 1, 0.5568628, 1,
-0.195958, 1.67197, -0.5442232, 0, 1, 0.5607843, 1,
-0.1937387, 0.3451473, 0.4959999, 0, 1, 0.5686275, 1,
-0.1912352, 1.280618, -0.594767, 0, 1, 0.572549, 1,
-0.1897051, 0.2011849, -2.311517, 0, 1, 0.5803922, 1,
-0.1867371, -1.23796, -1.967038, 0, 1, 0.5843138, 1,
-0.184585, -0.4573456, -0.6214448, 0, 1, 0.5921569, 1,
-0.1808297, 0.1235302, -1.865623, 0, 1, 0.5960785, 1,
-0.1794558, 1.45749, -0.5536696, 0, 1, 0.6039216, 1,
-0.1751178, -0.1851659, -2.532337, 0, 1, 0.6117647, 1,
-0.1740085, -0.6596597, -1.609663, 0, 1, 0.6156863, 1,
-0.1717311, -0.04572687, -2.233588, 0, 1, 0.6235294, 1,
-0.1665755, -0.5409621, -3.720338, 0, 1, 0.627451, 1,
-0.1529164, -0.9356079, -3.481465, 0, 1, 0.6352941, 1,
-0.1524982, 1.904792, -2.213423, 0, 1, 0.6392157, 1,
-0.1436537, -0.5281798, -3.3934, 0, 1, 0.6470588, 1,
-0.1406077, 0.2290682, -1.048468, 0, 1, 0.6509804, 1,
-0.1369202, 0.3950021, 0.9700815, 0, 1, 0.6588235, 1,
-0.1362849, -1.261824, -1.297315, 0, 1, 0.6627451, 1,
-0.13202, -0.06381455, -2.791989, 0, 1, 0.6705883, 1,
-0.1319094, -0.5441287, -3.299449, 0, 1, 0.6745098, 1,
-0.1294897, 0.4314324, 1.22663, 0, 1, 0.682353, 1,
-0.1239742, -0.9979685, -1.772069, 0, 1, 0.6862745, 1,
-0.1231869, -0.593659, -3.608834, 0, 1, 0.6941177, 1,
-0.1225717, -0.03038123, -1.73744, 0, 1, 0.7019608, 1,
-0.1220189, 1.353761, 0.1856024, 0, 1, 0.7058824, 1,
-0.121363, -0.1605248, -2.998491, 0, 1, 0.7137255, 1,
-0.1212091, 0.08327329, -0.4389971, 0, 1, 0.7176471, 1,
-0.1173773, 0.1374183, -0.7278405, 0, 1, 0.7254902, 1,
-0.1145674, -0.04153617, -1.021888, 0, 1, 0.7294118, 1,
-0.1048683, 0.3630363, 0.9907578, 0, 1, 0.7372549, 1,
-0.1011167, 1.442003, -0.1888449, 0, 1, 0.7411765, 1,
-0.09856883, 0.5793716, 0.7005429, 0, 1, 0.7490196, 1,
-0.09568149, -0.4583985, -2.229058, 0, 1, 0.7529412, 1,
-0.09099757, 0.1657698, -0.5514423, 0, 1, 0.7607843, 1,
-0.088609, 0.1116132, -0.908681, 0, 1, 0.7647059, 1,
-0.0872995, 0.7689551, -0.6356988, 0, 1, 0.772549, 1,
-0.0828584, 1.812192, -0.5369689, 0, 1, 0.7764706, 1,
-0.08248641, -0.03269201, -0.4342691, 0, 1, 0.7843137, 1,
-0.08242448, -0.3135644, -3.998143, 0, 1, 0.7882353, 1,
-0.07535111, -0.3019181, -2.514376, 0, 1, 0.7960784, 1,
-0.07338842, 0.5780115, -0.2827369, 0, 1, 0.8039216, 1,
-0.06962569, -0.7326562, -2.238667, 0, 1, 0.8078431, 1,
-0.06528511, 1.050296, -0.7778314, 0, 1, 0.8156863, 1,
-0.05926401, 0.287593, -0.3234157, 0, 1, 0.8196079, 1,
-0.05899495, 0.4651449, -0.8660567, 0, 1, 0.827451, 1,
-0.05512853, -1.179204, -2.740192, 0, 1, 0.8313726, 1,
-0.04797329, 0.4418191, 1.698855, 0, 1, 0.8392157, 1,
-0.04589555, -1.55622, -2.46158, 0, 1, 0.8431373, 1,
-0.04313563, 0.2944917, -0.2166089, 0, 1, 0.8509804, 1,
-0.04074007, -1.097398, -2.482756, 0, 1, 0.854902, 1,
-0.03903173, -1.240258, -2.819493, 0, 1, 0.8627451, 1,
-0.03889041, 1.958914, 1.739885, 0, 1, 0.8666667, 1,
-0.03042015, -0.9913867, -1.655703, 0, 1, 0.8745098, 1,
-0.02840018, -0.5055329, -3.420499, 0, 1, 0.8784314, 1,
-0.02740024, -0.6787054, -1.583727, 0, 1, 0.8862745, 1,
-0.02661867, -0.4328533, -2.541888, 0, 1, 0.8901961, 1,
-0.0242849, 1.098189, 0.295209, 0, 1, 0.8980392, 1,
-0.02412023, -0.9010864, -1.842017, 0, 1, 0.9058824, 1,
-0.02384458, 0.8808601, 0.6771068, 0, 1, 0.9098039, 1,
-0.02159821, 1.785205, -0.3125527, 0, 1, 0.9176471, 1,
-0.01819077, -0.7860405, -3.517403, 0, 1, 0.9215686, 1,
-0.01566303, -1.13281, -3.467675, 0, 1, 0.9294118, 1,
-0.01447727, 0.3155845, -1.696575, 0, 1, 0.9333333, 1,
-0.01392589, 0.4667211, 0.8528075, 0, 1, 0.9411765, 1,
-0.01157091, 0.8790749, 1.228758, 0, 1, 0.945098, 1,
-0.006123415, 0.3972478, 2.59079, 0, 1, 0.9529412, 1,
-0.004868468, -1.609252, -3.453641, 0, 1, 0.9568627, 1,
-0.004390484, 1.366673, 0.5701228, 0, 1, 0.9647059, 1,
-0.002675478, -0.8656132, -2.581856, 0, 1, 0.9686275, 1,
-0.0004678002, -1.375595, -2.678444, 0, 1, 0.9764706, 1,
0.003746101, 0.9143047, 0.201818, 0, 1, 0.9803922, 1,
0.01057454, 0.08611835, 0.1512953, 0, 1, 0.9882353, 1,
0.01075502, 0.05779672, 0.3267949, 0, 1, 0.9921569, 1,
0.01193245, -0.007178396, 4.113554, 0, 1, 1, 1,
0.01315667, -0.2072749, 2.737553, 0, 0.9921569, 1, 1,
0.0143265, 0.4147763, -0.01309365, 0, 0.9882353, 1, 1,
0.01504336, -0.7333289, 3.51195, 0, 0.9803922, 1, 1,
0.0160546, -0.2941255, 3.170974, 0, 0.9764706, 1, 1,
0.01755887, -0.1068548, 2.098639, 0, 0.9686275, 1, 1,
0.01787249, 0.02772115, 1.024387, 0, 0.9647059, 1, 1,
0.01848065, -0.3931355, 3.064543, 0, 0.9568627, 1, 1,
0.02171192, -1.56548, 1.298378, 0, 0.9529412, 1, 1,
0.02600266, -0.2841761, 4.000014, 0, 0.945098, 1, 1,
0.03329872, 1.984391, -0.9724642, 0, 0.9411765, 1, 1,
0.03561183, -0.4673988, 1.940983, 0, 0.9333333, 1, 1,
0.03882829, -1.229031, 2.209922, 0, 0.9294118, 1, 1,
0.0389734, 2.3121, 0.5768673, 0, 0.9215686, 1, 1,
0.04126682, 0.8003817, 1.245241, 0, 0.9176471, 1, 1,
0.04591877, 0.3890916, 0.9295442, 0, 0.9098039, 1, 1,
0.04617487, -0.2950865, 3.593522, 0, 0.9058824, 1, 1,
0.04693562, 0.2268023, -0.1619682, 0, 0.8980392, 1, 1,
0.04807443, 0.1802016, 0.1575347, 0, 0.8901961, 1, 1,
0.04900235, 1.154548, 0.6550086, 0, 0.8862745, 1, 1,
0.04902131, 2.155067, -0.5541862, 0, 0.8784314, 1, 1,
0.05076235, 1.001286, 0.02933192, 0, 0.8745098, 1, 1,
0.05864001, -0.5641035, 1.400702, 0, 0.8666667, 1, 1,
0.06032649, -0.8487037, 3.34718, 0, 0.8627451, 1, 1,
0.06216468, 0.06512896, 2.42305, 0, 0.854902, 1, 1,
0.06296092, -0.6024547, 3.062089, 0, 0.8509804, 1, 1,
0.06734514, -1.98562, 3.568738, 0, 0.8431373, 1, 1,
0.07060862, 0.3867953, 0.6562623, 0, 0.8392157, 1, 1,
0.07084355, 0.9250377, -0.3789208, 0, 0.8313726, 1, 1,
0.07218985, 0.8398221, 0.9928163, 0, 0.827451, 1, 1,
0.07373884, 0.7112094, -1.178583, 0, 0.8196079, 1, 1,
0.07591054, -0.9017227, 1.943989, 0, 0.8156863, 1, 1,
0.07787719, -1.244838, 3.041993, 0, 0.8078431, 1, 1,
0.08249795, -0.3389581, 1.655559, 0, 0.8039216, 1, 1,
0.08291581, 1.828413, -0.6776804, 0, 0.7960784, 1, 1,
0.08990552, 0.1180632, 1.27271, 0, 0.7882353, 1, 1,
0.09479155, 0.08010523, -0.06113845, 0, 0.7843137, 1, 1,
0.09733811, -0.5878151, 2.659127, 0, 0.7764706, 1, 1,
0.09739996, -2.214547, 1.777097, 0, 0.772549, 1, 1,
0.0989337, -1.093538, 2.888495, 0, 0.7647059, 1, 1,
0.10152, -1.940133, 2.983278, 0, 0.7607843, 1, 1,
0.1017362, -1.041646, 2.425146, 0, 0.7529412, 1, 1,
0.102093, -0.07354929, 1.498727, 0, 0.7490196, 1, 1,
0.1021385, -0.9591117, 4.169789, 0, 0.7411765, 1, 1,
0.1114843, 0.4707395, 1.162309, 0, 0.7372549, 1, 1,
0.1129699, -0.2743329, 2.340067, 0, 0.7294118, 1, 1,
0.115723, -0.8548867, 2.33888, 0, 0.7254902, 1, 1,
0.118826, -1.535415, 1.884522, 0, 0.7176471, 1, 1,
0.121079, -0.886507, 3.68035, 0, 0.7137255, 1, 1,
0.12687, 0.09185822, -0.6356582, 0, 0.7058824, 1, 1,
0.1272136, 0.06974389, 2.599696, 0, 0.6980392, 1, 1,
0.129162, 0.2881368, -2.324101, 0, 0.6941177, 1, 1,
0.1302659, 0.4248294, -1.083082, 0, 0.6862745, 1, 1,
0.1335677, -0.2276462, 4.240458, 0, 0.682353, 1, 1,
0.1336959, 0.7828074, -0.991711, 0, 0.6745098, 1, 1,
0.1416188, -0.508361, 2.090364, 0, 0.6705883, 1, 1,
0.1472449, 0.4814847, 2.285285, 0, 0.6627451, 1, 1,
0.14763, 0.1515101, 0.6702054, 0, 0.6588235, 1, 1,
0.1503616, -0.9340059, 2.033968, 0, 0.6509804, 1, 1,
0.1539529, -0.8708855, 2.004082, 0, 0.6470588, 1, 1,
0.1570808, 0.8007016, 0.9459284, 0, 0.6392157, 1, 1,
0.166605, 0.9169382, -0.6425005, 0, 0.6352941, 1, 1,
0.1681186, -0.827604, 4.206344, 0, 0.627451, 1, 1,
0.1683329, -0.5164735, 2.777305, 0, 0.6235294, 1, 1,
0.1696552, -1.719678, 4.711654, 0, 0.6156863, 1, 1,
0.1700497, 0.1000321, 1.280422, 0, 0.6117647, 1, 1,
0.1799819, -1.1845, 2.307342, 0, 0.6039216, 1, 1,
0.1850093, -0.8594251, 3.100453, 0, 0.5960785, 1, 1,
0.1874212, -0.04259739, 0.7720123, 0, 0.5921569, 1, 1,
0.1875162, 0.5201219, -0.5810935, 0, 0.5843138, 1, 1,
0.1901473, 1.398063, -0.1284718, 0, 0.5803922, 1, 1,
0.1919236, -1.205321, 2.601578, 0, 0.572549, 1, 1,
0.1966448, 0.8043126, -0.8977075, 0, 0.5686275, 1, 1,
0.2034514, 0.6906518, 1.055924, 0, 0.5607843, 1, 1,
0.206415, -1.25296, 2.497963, 0, 0.5568628, 1, 1,
0.2082849, 0.5161192, -0.3178672, 0, 0.5490196, 1, 1,
0.2112797, -0.6346076, 0.9225673, 0, 0.5450981, 1, 1,
0.2142877, -0.9464512, 3.04935, 0, 0.5372549, 1, 1,
0.2148421, -1.459654, 2.752815, 0, 0.5333334, 1, 1,
0.2174333, 0.2486243, 0.5492571, 0, 0.5254902, 1, 1,
0.2264696, -0.1075588, 2.786461, 0, 0.5215687, 1, 1,
0.2311023, -1.075327, 1.486323, 0, 0.5137255, 1, 1,
0.2312234, 2.371736, 0.3650242, 0, 0.509804, 1, 1,
0.2375224, -0.2963099, 2.425659, 0, 0.5019608, 1, 1,
0.2439367, 0.8428536, -1.386603, 0, 0.4941176, 1, 1,
0.2443123, 0.2187226, 1.191303, 0, 0.4901961, 1, 1,
0.2466571, 0.5247673, 0.8198147, 0, 0.4823529, 1, 1,
0.2522938, 0.2894309, 1.376653, 0, 0.4784314, 1, 1,
0.2528287, -1.865287, 3.137993, 0, 0.4705882, 1, 1,
0.2536063, -0.7530611, 2.144795, 0, 0.4666667, 1, 1,
0.2545972, 0.5423169, -1.097526, 0, 0.4588235, 1, 1,
0.2550159, 0.002134259, 3.927563, 0, 0.454902, 1, 1,
0.2567912, 0.6068084, -0.2013077, 0, 0.4470588, 1, 1,
0.25792, -0.2946335, 1.837363, 0, 0.4431373, 1, 1,
0.2583112, -0.3946225, 1.510602, 0, 0.4352941, 1, 1,
0.2633599, -1.108541, 4.365379, 0, 0.4313726, 1, 1,
0.2647305, -0.007170753, 1.550096, 0, 0.4235294, 1, 1,
0.2693923, -0.8969269, 2.829712, 0, 0.4196078, 1, 1,
0.2695873, 0.369155, 1.914152, 0, 0.4117647, 1, 1,
0.2777733, -0.3533719, 1.836502, 0, 0.4078431, 1, 1,
0.2779945, -0.7054971, 3.080592, 0, 0.4, 1, 1,
0.2798413, 0.6925846, 0.353018, 0, 0.3921569, 1, 1,
0.2901154, -0.3478205, 3.380892, 0, 0.3882353, 1, 1,
0.2906412, 0.8859472, 0.01558932, 0, 0.3803922, 1, 1,
0.2960624, 1.307005, 1.123343, 0, 0.3764706, 1, 1,
0.2966965, -0.6181065, 2.192495, 0, 0.3686275, 1, 1,
0.3053963, 2.045907, -0.7255756, 0, 0.3647059, 1, 1,
0.3093998, 2.998751, 0.7795282, 0, 0.3568628, 1, 1,
0.3225141, -0.1386645, 0.8142343, 0, 0.3529412, 1, 1,
0.3249305, -0.2505487, 2.741554, 0, 0.345098, 1, 1,
0.3260235, 0.6362359, 2.944581, 0, 0.3411765, 1, 1,
0.3267742, -1.494642, 3.571887, 0, 0.3333333, 1, 1,
0.3268371, -1.735893, 3.187382, 0, 0.3294118, 1, 1,
0.3315558, -1.088353, 3.073794, 0, 0.3215686, 1, 1,
0.3323473, 0.3705039, 1.739159, 0, 0.3176471, 1, 1,
0.33735, -1.785742, 4.117614, 0, 0.3098039, 1, 1,
0.3395281, -0.4644464, 2.808992, 0, 0.3058824, 1, 1,
0.3448029, 0.4313575, 2.497542, 0, 0.2980392, 1, 1,
0.3471377, -0.6104633, 2.815407, 0, 0.2901961, 1, 1,
0.3482907, -2.21795, 2.764094, 0, 0.2862745, 1, 1,
0.349776, -0.6623446, 2.43932, 0, 0.2784314, 1, 1,
0.3500759, 1.542693, 0.8602216, 0, 0.2745098, 1, 1,
0.3526879, -0.5507497, 2.65212, 0, 0.2666667, 1, 1,
0.354936, 0.3779382, 0.2360435, 0, 0.2627451, 1, 1,
0.3550325, -1.36955, 2.684168, 0, 0.254902, 1, 1,
0.3552366, 0.7717193, -1.440483, 0, 0.2509804, 1, 1,
0.3552509, -0.2521201, 1.727203, 0, 0.2431373, 1, 1,
0.3564999, -1.072058, 2.973467, 0, 0.2392157, 1, 1,
0.3576533, 0.1184182, 1.386291, 0, 0.2313726, 1, 1,
0.3587323, 0.4728669, -0.6357563, 0, 0.227451, 1, 1,
0.3635035, -3.120168, 2.317315, 0, 0.2196078, 1, 1,
0.3654315, 2.151233, 0.380314, 0, 0.2156863, 1, 1,
0.3657501, -0.07586603, 2.801408, 0, 0.2078431, 1, 1,
0.3674711, 0.4234866, 1.869245, 0, 0.2039216, 1, 1,
0.3678209, 0.6530215, -1.200234, 0, 0.1960784, 1, 1,
0.3726218, 0.6846958, 2.025757, 0, 0.1882353, 1, 1,
0.3809281, 0.567693, 0.2516113, 0, 0.1843137, 1, 1,
0.3820946, 0.819038, 1.331705, 0, 0.1764706, 1, 1,
0.3824396, -0.9147614, 5.553795, 0, 0.172549, 1, 1,
0.3834498, -1.0296, 3.421789, 0, 0.1647059, 1, 1,
0.3842942, 1.449271, -0.2465146, 0, 0.1607843, 1, 1,
0.3868024, 0.9368873, 2.847333, 0, 0.1529412, 1, 1,
0.3909162, 2.821081, -0.6341996, 0, 0.1490196, 1, 1,
0.3986842, -0.9097081, 2.784123, 0, 0.1411765, 1, 1,
0.4032597, -0.5048657, 2.931359, 0, 0.1372549, 1, 1,
0.4060831, -0.8533399, 1.985476, 0, 0.1294118, 1, 1,
0.4069527, -0.9543085, 3.453086, 0, 0.1254902, 1, 1,
0.4098272, -0.004092031, 0.5783052, 0, 0.1176471, 1, 1,
0.4114051, -1.749972, 3.385692, 0, 0.1137255, 1, 1,
0.4124553, 0.3689613, 0.5596487, 0, 0.1058824, 1, 1,
0.4137824, 0.2387666, 2.2049, 0, 0.09803922, 1, 1,
0.41425, 0.2290216, 1.019856, 0, 0.09411765, 1, 1,
0.4163916, -0.4224873, 1.882932, 0, 0.08627451, 1, 1,
0.4215861, -0.1475896, 2.859283, 0, 0.08235294, 1, 1,
0.4253587, -1.022208, 3.024684, 0, 0.07450981, 1, 1,
0.4277072, -1.48982, 2.804652, 0, 0.07058824, 1, 1,
0.4315459, -0.6771347, 3.365985, 0, 0.0627451, 1, 1,
0.4318317, -1.014819, 2.969342, 0, 0.05882353, 1, 1,
0.4319794, 1.775046, -0.4445685, 0, 0.05098039, 1, 1,
0.4494537, -1.076456, 2.277438, 0, 0.04705882, 1, 1,
0.4511832, -0.2387696, 1.642449, 0, 0.03921569, 1, 1,
0.4514737, -0.8831776, 2.354028, 0, 0.03529412, 1, 1,
0.4563127, -0.3975039, 2.417049, 0, 0.02745098, 1, 1,
0.4601148, -1.155526, 2.186608, 0, 0.02352941, 1, 1,
0.4675008, 1.507785, -0.3004565, 0, 0.01568628, 1, 1,
0.4730305, -0.4586485, 1.1089, 0, 0.01176471, 1, 1,
0.4782135, -1.441092, 3.224531, 0, 0.003921569, 1, 1,
0.4792629, 1.505906, 2.330551, 0.003921569, 0, 1, 1,
0.4805939, 0.6031464, 1.008317, 0.007843138, 0, 1, 1,
0.4880577, -2.500668, 3.839129, 0.01568628, 0, 1, 1,
0.4929491, -2.07669, 2.601477, 0.01960784, 0, 1, 1,
0.494868, 0.3828644, -0.1718201, 0.02745098, 0, 1, 1,
0.4952806, -0.6857309, 4.350118, 0.03137255, 0, 1, 1,
0.5010151, -0.804653, 1.515391, 0.03921569, 0, 1, 1,
0.5027379, 1.402845, 2.225833, 0.04313726, 0, 1, 1,
0.503162, 1.316941, 1.83167, 0.05098039, 0, 1, 1,
0.505138, -1.215585, 2.381158, 0.05490196, 0, 1, 1,
0.5062805, 0.2903596, 2.370746, 0.0627451, 0, 1, 1,
0.5147038, 1.229264, 0.04112102, 0.06666667, 0, 1, 1,
0.5191566, -1.387524, 4.427286, 0.07450981, 0, 1, 1,
0.5201337, -1.093001, 2.704533, 0.07843138, 0, 1, 1,
0.5218877, 0.08504956, 1.52992, 0.08627451, 0, 1, 1,
0.522823, -0.4738031, 1.716398, 0.09019608, 0, 1, 1,
0.5257878, -0.1712721, 2.724525, 0.09803922, 0, 1, 1,
0.5258034, -0.9673574, 0.6509045, 0.1058824, 0, 1, 1,
0.5317677, 0.80343, 1.025963, 0.1098039, 0, 1, 1,
0.5348272, -2.616245, 4.308464, 0.1176471, 0, 1, 1,
0.5457762, -0.286059, 1.232881, 0.1215686, 0, 1, 1,
0.5464205, 0.6197615, 1.593047, 0.1294118, 0, 1, 1,
0.549875, -0.1208034, 1.384037, 0.1333333, 0, 1, 1,
0.5502957, -0.1494247, 2.730278, 0.1411765, 0, 1, 1,
0.5507492, -0.5220512, 4.021187, 0.145098, 0, 1, 1,
0.5526828, -0.6774469, 4.474647, 0.1529412, 0, 1, 1,
0.5534847, -0.3647977, 3.550262, 0.1568628, 0, 1, 1,
0.5543638, -0.07254691, 1.329669, 0.1647059, 0, 1, 1,
0.5586628, -1.077092, 1.964863, 0.1686275, 0, 1, 1,
0.5604874, -0.3675407, 2.440389, 0.1764706, 0, 1, 1,
0.5650912, 0.2399129, 1.77312, 0.1803922, 0, 1, 1,
0.5651901, -0.9313088, 2.719101, 0.1882353, 0, 1, 1,
0.5677913, -0.7441186, 1.821609, 0.1921569, 0, 1, 1,
0.5689141, -2.479064, 4.092541, 0.2, 0, 1, 1,
0.5717106, 0.3720379, 1.441435, 0.2078431, 0, 1, 1,
0.5758268, 0.484345, 0.2639447, 0.2117647, 0, 1, 1,
0.5758832, -1.052948, 2.557302, 0.2196078, 0, 1, 1,
0.5760176, 2.052858, 0.1864626, 0.2235294, 0, 1, 1,
0.5817656, -0.3755217, 1.728596, 0.2313726, 0, 1, 1,
0.5861588, -1.718606, 3.956703, 0.2352941, 0, 1, 1,
0.5873411, -0.5826846, 2.60263, 0.2431373, 0, 1, 1,
0.5887308, 0.05865767, 1.350635, 0.2470588, 0, 1, 1,
0.5890635, -1.26067, 2.80153, 0.254902, 0, 1, 1,
0.5935648, 0.9041933, 0.8689681, 0.2588235, 0, 1, 1,
0.5973563, 1.5418, -0.6085522, 0.2666667, 0, 1, 1,
0.6028579, 0.4570786, 0.9172659, 0.2705882, 0, 1, 1,
0.6045712, -2.575555, 3.632733, 0.2784314, 0, 1, 1,
0.6084415, 1.601437, 0.4923143, 0.282353, 0, 1, 1,
0.615428, 0.1869017, 0.856339, 0.2901961, 0, 1, 1,
0.6157015, 0.5035235, 0.2809328, 0.2941177, 0, 1, 1,
0.6176167, -1.457023, 2.300193, 0.3019608, 0, 1, 1,
0.6190903, -0.09485821, 2.080484, 0.3098039, 0, 1, 1,
0.6204044, 0.1960334, 0.442905, 0.3137255, 0, 1, 1,
0.6276231, -0.8779593, 0.9837978, 0.3215686, 0, 1, 1,
0.6357128, 0.857032, 0.3503399, 0.3254902, 0, 1, 1,
0.6410185, 0.765818, 0.9634621, 0.3333333, 0, 1, 1,
0.6459414, -0.4283807, 3.328546, 0.3372549, 0, 1, 1,
0.648997, 0.1820457, 1.845922, 0.345098, 0, 1, 1,
0.6506945, 0.1288285, 1.14698, 0.3490196, 0, 1, 1,
0.6550134, 0.7278784, 0.4624648, 0.3568628, 0, 1, 1,
0.6585131, -0.5220554, 0.9846998, 0.3607843, 0, 1, 1,
0.659266, -0.7791937, 3.123257, 0.3686275, 0, 1, 1,
0.6613007, 0.4450224, 0.9640285, 0.372549, 0, 1, 1,
0.6661456, 0.1367333, -0.1146284, 0.3803922, 0, 1, 1,
0.6679833, 0.4019528, 0.2846361, 0.3843137, 0, 1, 1,
0.6725231, -0.6484022, 2.577036, 0.3921569, 0, 1, 1,
0.6746968, 0.1718713, 0.4044195, 0.3960784, 0, 1, 1,
0.6761996, 0.1469947, 2.017805, 0.4039216, 0, 1, 1,
0.6780884, 1.296712, 0.1113045, 0.4117647, 0, 1, 1,
0.6798764, 0.7655362, 1.502761, 0.4156863, 0, 1, 1,
0.6828388, 0.6789559, -0.2286942, 0.4235294, 0, 1, 1,
0.6900103, 0.9821997, 0.09154961, 0.427451, 0, 1, 1,
0.6903414, 1.128751, 2.057715, 0.4352941, 0, 1, 1,
0.6925959, -0.08745939, 2.299709, 0.4392157, 0, 1, 1,
0.6976744, 2.432827, -0.3730315, 0.4470588, 0, 1, 1,
0.6980962, 0.8479709, -0.6105423, 0.4509804, 0, 1, 1,
0.6987616, 0.8471521, 0.5489563, 0.4588235, 0, 1, 1,
0.7008897, -1.627461, 3.595887, 0.4627451, 0, 1, 1,
0.7025911, 0.3504219, 1.092404, 0.4705882, 0, 1, 1,
0.7073041, -1.209143, 1.434077, 0.4745098, 0, 1, 1,
0.7077748, 0.6256921, 1.457152, 0.4823529, 0, 1, 1,
0.7090939, -1.27287, 1.808124, 0.4862745, 0, 1, 1,
0.7097825, 0.4108109, 1.426663, 0.4941176, 0, 1, 1,
0.7108644, -0.2156904, 2.344925, 0.5019608, 0, 1, 1,
0.7146265, -0.0740307, 1.721344, 0.5058824, 0, 1, 1,
0.7151033, 0.4344333, 1.344665, 0.5137255, 0, 1, 1,
0.726061, 0.1236001, -1.125228, 0.5176471, 0, 1, 1,
0.7275435, 0.2442988, 1.589048, 0.5254902, 0, 1, 1,
0.7295418, 0.435264, 2.599194, 0.5294118, 0, 1, 1,
0.7320037, 0.1321068, 2.473427, 0.5372549, 0, 1, 1,
0.734911, -1.132407, 3.460492, 0.5411765, 0, 1, 1,
0.7353005, 0.9726282, 1.290814, 0.5490196, 0, 1, 1,
0.7359135, 0.5207053, 0.8780229, 0.5529412, 0, 1, 1,
0.7388421, 0.564612, 0.6840309, 0.5607843, 0, 1, 1,
0.7418768, -0.712407, 4.024726, 0.5647059, 0, 1, 1,
0.7423628, -0.6214414, 2.620467, 0.572549, 0, 1, 1,
0.7470937, 0.9885971, 1.644386, 0.5764706, 0, 1, 1,
0.7491205, 0.4155493, 1.921204, 0.5843138, 0, 1, 1,
0.74942, -2.269815, 4.236513, 0.5882353, 0, 1, 1,
0.7502657, -1.357185, 2.972802, 0.5960785, 0, 1, 1,
0.752132, -0.9678484, 1.792338, 0.6039216, 0, 1, 1,
0.7548144, 0.3028671, 2.745279, 0.6078432, 0, 1, 1,
0.7571684, 0.8016663, 1.172194, 0.6156863, 0, 1, 1,
0.7675784, 1.88886, 0.281197, 0.6196079, 0, 1, 1,
0.7678421, 1.722898, -0.8238678, 0.627451, 0, 1, 1,
0.7682213, 0.4287976, 1.139712, 0.6313726, 0, 1, 1,
0.7690533, -1.155754, 2.501178, 0.6392157, 0, 1, 1,
0.7700644, -1.708054, 3.257686, 0.6431373, 0, 1, 1,
0.773122, 0.8193377, 2.146396, 0.6509804, 0, 1, 1,
0.7754281, 1.590661, 1.698753, 0.654902, 0, 1, 1,
0.7779945, 1.527808, -0.2874236, 0.6627451, 0, 1, 1,
0.7787778, 1.402297, 0.2654319, 0.6666667, 0, 1, 1,
0.7792074, 1.355809, -1.206918, 0.6745098, 0, 1, 1,
0.7803043, 1.399271, 3.012105, 0.6784314, 0, 1, 1,
0.7822069, -0.7193272, 2.053533, 0.6862745, 0, 1, 1,
0.7861663, 0.4001173, 1.532342, 0.6901961, 0, 1, 1,
0.7866139, 2.989268, -0.726016, 0.6980392, 0, 1, 1,
0.7915644, 0.4594216, 0.17044, 0.7058824, 0, 1, 1,
0.7971882, -0.04246351, 0.9416422, 0.7098039, 0, 1, 1,
0.8004318, -1.457794, 3.122815, 0.7176471, 0, 1, 1,
0.8162779, -0.1106333, 1.693525, 0.7215686, 0, 1, 1,
0.8189927, -1.606159, 4.080561, 0.7294118, 0, 1, 1,
0.8209157, 0.6477113, 2.662695, 0.7333333, 0, 1, 1,
0.8217365, -0.9675461, 3.627489, 0.7411765, 0, 1, 1,
0.8222378, -0.1528229, 2.842395, 0.7450981, 0, 1, 1,
0.8234097, -0.01251922, 2.634779, 0.7529412, 0, 1, 1,
0.8248466, 0.04143199, 1.064195, 0.7568628, 0, 1, 1,
0.8273326, -1.009281, 3.374652, 0.7647059, 0, 1, 1,
0.828272, 1.754043, -0.7261859, 0.7686275, 0, 1, 1,
0.8299822, 1.229458, -1.000713, 0.7764706, 0, 1, 1,
0.8309483, -0.05880715, 1.013688, 0.7803922, 0, 1, 1,
0.8311219, -1.908149, 4.270387, 0.7882353, 0, 1, 1,
0.8326079, -0.006650899, 2.331871, 0.7921569, 0, 1, 1,
0.8342475, 0.2307235, 0.3302526, 0.8, 0, 1, 1,
0.8357471, 1.142503, 0.5970929, 0.8078431, 0, 1, 1,
0.8393135, -0.049613, 1.124603, 0.8117647, 0, 1, 1,
0.8432915, -2.347284, 3.125304, 0.8196079, 0, 1, 1,
0.8449078, 0.5803029, 2.481603, 0.8235294, 0, 1, 1,
0.8469013, -0.3954234, 3.523391, 0.8313726, 0, 1, 1,
0.8485137, -1.627846, 4.283741, 0.8352941, 0, 1, 1,
0.8500957, -0.7839823, 5.076495, 0.8431373, 0, 1, 1,
0.8578836, 1.353695, 0.6977447, 0.8470588, 0, 1, 1,
0.8591119, 0.1892657, 0.8220345, 0.854902, 0, 1, 1,
0.8630165, 0.5815847, 0.596566, 0.8588235, 0, 1, 1,
0.8638875, 1.124741, 0.8366181, 0.8666667, 0, 1, 1,
0.8692762, 0.2701453, 1.743222, 0.8705882, 0, 1, 1,
0.8731316, -0.3618109, 2.504778, 0.8784314, 0, 1, 1,
0.8815774, 1.114198, -1.220714, 0.8823529, 0, 1, 1,
0.8831645, 0.3065985, 0.8211717, 0.8901961, 0, 1, 1,
0.883441, -0.523147, 2.186712, 0.8941177, 0, 1, 1,
0.8862105, -0.306244, 0.7815253, 0.9019608, 0, 1, 1,
0.8894542, -1.925233, 1.509891, 0.9098039, 0, 1, 1,
0.8918778, 0.5053806, 0.8342081, 0.9137255, 0, 1, 1,
0.8957621, -0.1268452, 2.543028, 0.9215686, 0, 1, 1,
0.8986896, 0.308911, 1.366987, 0.9254902, 0, 1, 1,
0.8990195, -0.6883272, 2.25259, 0.9333333, 0, 1, 1,
0.9044113, 0.5520025, 1.121736, 0.9372549, 0, 1, 1,
0.906027, -0.2716365, 2.575103, 0.945098, 0, 1, 1,
0.9061978, -1.304799, 1.145584, 0.9490196, 0, 1, 1,
0.9085245, 1.690901, 0.66632, 0.9568627, 0, 1, 1,
0.9302393, 0.2310144, 1.808733, 0.9607843, 0, 1, 1,
0.9329762, 1.385865, 1.373111, 0.9686275, 0, 1, 1,
0.9348968, -0.3845656, 2.1922, 0.972549, 0, 1, 1,
0.9381682, -0.1893578, 2.445653, 0.9803922, 0, 1, 1,
0.9398398, -0.1281034, -0.05190289, 0.9843137, 0, 1, 1,
0.9425887, 1.12464, 2.252253, 0.9921569, 0, 1, 1,
0.9428339, -0.5248901, 0.9203506, 0.9960784, 0, 1, 1,
0.9429486, -0.2705881, 1.453603, 1, 0, 0.9960784, 1,
0.9503326, -0.4460483, 2.094368, 1, 0, 0.9882353, 1,
0.9544173, 0.7002239, 0.4672349, 1, 0, 0.9843137, 1,
0.958176, 0.04237443, 2.62189, 1, 0, 0.9764706, 1,
0.9665979, 0.3344281, 2.662672, 1, 0, 0.972549, 1,
0.9695371, -0.553911, 1.949608, 1, 0, 0.9647059, 1,
0.9854794, -0.6787267, 2.095346, 1, 0, 0.9607843, 1,
0.9875522, -0.5300438, 1.656389, 1, 0, 0.9529412, 1,
0.9885315, -0.9662672, 2.732371, 1, 0, 0.9490196, 1,
0.9967127, 1.022269, 1.448388, 1, 0, 0.9411765, 1,
0.9994752, -0.07510889, 1.435788, 1, 0, 0.9372549, 1,
1.005176, 0.4988917, 2.507358, 1, 0, 0.9294118, 1,
1.00544, -0.1408381, 0.9633496, 1, 0, 0.9254902, 1,
1.005615, 0.3119943, 0.2755312, 1, 0, 0.9176471, 1,
1.011631, 0.6034689, 2.130047, 1, 0, 0.9137255, 1,
1.015833, 0.9039988, -0.07871895, 1, 0, 0.9058824, 1,
1.017592, -0.8523344, 3.174292, 1, 0, 0.9019608, 1,
1.021273, -0.4814923, 1.452068, 1, 0, 0.8941177, 1,
1.023288, 0.2748614, 2.427648, 1, 0, 0.8862745, 1,
1.033652, -1.318989, 1.37527, 1, 0, 0.8823529, 1,
1.041724, 0.4144156, 2.031125, 1, 0, 0.8745098, 1,
1.048349, -0.9255468, 2.891937, 1, 0, 0.8705882, 1,
1.048774, 1.135536, -0.2133281, 1, 0, 0.8627451, 1,
1.058584, 0.7957629, 1.229144, 1, 0, 0.8588235, 1,
1.063712, -1.754785, 1.975229, 1, 0, 0.8509804, 1,
1.066218, 0.7009835, 1.348162, 1, 0, 0.8470588, 1,
1.068914, 0.72395, 3.089939, 1, 0, 0.8392157, 1,
1.076943, 0.1161697, 3.032666, 1, 0, 0.8352941, 1,
1.08168, -0.6217864, 2.123374, 1, 0, 0.827451, 1,
1.08688, -0.2872345, 1.513862, 1, 0, 0.8235294, 1,
1.094823, 0.3374257, 1.937951, 1, 0, 0.8156863, 1,
1.098593, -0.4961698, 1.933438, 1, 0, 0.8117647, 1,
1.102733, -1.103758, 0.7069388, 1, 0, 0.8039216, 1,
1.106335, 0.5646616, 1.534446, 1, 0, 0.7960784, 1,
1.114615, 0.6396597, 1.138969, 1, 0, 0.7921569, 1,
1.116156, -0.6491564, 3.159061, 1, 0, 0.7843137, 1,
1.117312, -0.1080265, 1.027184, 1, 0, 0.7803922, 1,
1.120798, 0.8510805, 2.763226, 1, 0, 0.772549, 1,
1.121493, 0.624708, 0.3697987, 1, 0, 0.7686275, 1,
1.128644, -0.2053531, 2.183891, 1, 0, 0.7607843, 1,
1.133896, -0.313949, 2.576553, 1, 0, 0.7568628, 1,
1.138035, -1.0583, 1.615365, 1, 0, 0.7490196, 1,
1.140721, 0.8686679, 0.3673131, 1, 0, 0.7450981, 1,
1.151516, -0.8059212, 0.2361814, 1, 0, 0.7372549, 1,
1.155585, -0.4738034, 1.16516, 1, 0, 0.7333333, 1,
1.164205, 0.4147806, 4.15897, 1, 0, 0.7254902, 1,
1.168832, 0.06949555, 1.024047, 1, 0, 0.7215686, 1,
1.172446, 0.5013773, 1.439486, 1, 0, 0.7137255, 1,
1.172947, 1.152786, -0.9683051, 1, 0, 0.7098039, 1,
1.176721, 0.8149213, 0.4923673, 1, 0, 0.7019608, 1,
1.178498, 1.731494, -0.2318501, 1, 0, 0.6941177, 1,
1.180762, -0.7165542, 2.134091, 1, 0, 0.6901961, 1,
1.181018, -0.2165845, 4.082161, 1, 0, 0.682353, 1,
1.190714, -0.1819992, 1.609442, 1, 0, 0.6784314, 1,
1.191363, 2.718293, 0.9803445, 1, 0, 0.6705883, 1,
1.195233, 0.2359743, 3.591844, 1, 0, 0.6666667, 1,
1.206298, 0.2506649, 0.9890534, 1, 0, 0.6588235, 1,
1.210183, -1.390303, 3.750229, 1, 0, 0.654902, 1,
1.223028, 0.0569978, 2.963251, 1, 0, 0.6470588, 1,
1.22997, -0.4170916, 1.171333, 1, 0, 0.6431373, 1,
1.231234, 0.1151742, 1.601609, 1, 0, 0.6352941, 1,
1.233276, -0.03082431, -1.024191, 1, 0, 0.6313726, 1,
1.238058, -2.193265, 3.443274, 1, 0, 0.6235294, 1,
1.266711, 1.368859, 0.17375, 1, 0, 0.6196079, 1,
1.273073, 0.7500184, 0.7730273, 1, 0, 0.6117647, 1,
1.298622, -1.200118, 4.206727, 1, 0, 0.6078432, 1,
1.315591, -0.6622527, 2.394745, 1, 0, 0.6, 1,
1.316201, -0.2402518, 2.413201, 1, 0, 0.5921569, 1,
1.324543, 0.9516084, 0.5075396, 1, 0, 0.5882353, 1,
1.324989, 0.03152181, -0.06118576, 1, 0, 0.5803922, 1,
1.337151, 0.07089604, 1.474698, 1, 0, 0.5764706, 1,
1.339424, -0.3973156, 2.764119, 1, 0, 0.5686275, 1,
1.345718, -0.3252737, 1.264351, 1, 0, 0.5647059, 1,
1.347513, 1.88595, -0.1748665, 1, 0, 0.5568628, 1,
1.355104, -0.003667517, 1.941471, 1, 0, 0.5529412, 1,
1.358066, 1.399852, 1.181762, 1, 0, 0.5450981, 1,
1.361285, 0.5098393, 2.63187, 1, 0, 0.5411765, 1,
1.364818, 1.656797, 2.635214, 1, 0, 0.5333334, 1,
1.374551, 0.5758013, 0.6776775, 1, 0, 0.5294118, 1,
1.375385, -0.2482001, 0.6966987, 1, 0, 0.5215687, 1,
1.381073, -0.9889947, 2.975929, 1, 0, 0.5176471, 1,
1.406968, -0.9486949, 4.851938, 1, 0, 0.509804, 1,
1.409364, -0.5625927, 3.465071, 1, 0, 0.5058824, 1,
1.415953, -0.8362597, 2.826393, 1, 0, 0.4980392, 1,
1.42222, -0.8201137, 1.972702, 1, 0, 0.4901961, 1,
1.426754, -2.216957, 3.047513, 1, 0, 0.4862745, 1,
1.440795, -0.2888937, 2.008852, 1, 0, 0.4784314, 1,
1.450207, 1.262195, 1.251433, 1, 0, 0.4745098, 1,
1.459831, -1.204523, 2.231006, 1, 0, 0.4666667, 1,
1.460807, -1.716321, 0.8845647, 1, 0, 0.4627451, 1,
1.470694, -0.5459226, 1.903911, 1, 0, 0.454902, 1,
1.475723, -0.283985, 1.487958, 1, 0, 0.4509804, 1,
1.48075, -0.5419371, 2.640107, 1, 0, 0.4431373, 1,
1.482055, 1.516045, 0.1885148, 1, 0, 0.4392157, 1,
1.482446, 1.101078, 1.984983, 1, 0, 0.4313726, 1,
1.485782, 0.6287948, 0.6363912, 1, 0, 0.427451, 1,
1.486462, 1.738976, -0.2454639, 1, 0, 0.4196078, 1,
1.488483, -0.5124213, 0.3687929, 1, 0, 0.4156863, 1,
1.490199, -1.308088, 0.8738281, 1, 0, 0.4078431, 1,
1.490775, -1.114029, 1.892646, 1, 0, 0.4039216, 1,
1.492104, 1.61248, 1.144127, 1, 0, 0.3960784, 1,
1.497871, 0.7266375, 0.4376973, 1, 0, 0.3882353, 1,
1.506154, -0.001804497, 2.016932, 1, 0, 0.3843137, 1,
1.52024, 1.185813, -0.360139, 1, 0, 0.3764706, 1,
1.520377, -1.209198, 2.226978, 1, 0, 0.372549, 1,
1.524619, 1.505622, 0.9684735, 1, 0, 0.3647059, 1,
1.538801, 0.5110123, 0.5158622, 1, 0, 0.3607843, 1,
1.539757, -2.205156, 0.7879241, 1, 0, 0.3529412, 1,
1.541207, -0.08353432, 1.49905, 1, 0, 0.3490196, 1,
1.55811, -0.7414395, 3.19054, 1, 0, 0.3411765, 1,
1.564879, -0.1069153, 2.210613, 1, 0, 0.3372549, 1,
1.578676, -0.6417968, 2.006999, 1, 0, 0.3294118, 1,
1.57915, -0.1817971, 1.669745, 1, 0, 0.3254902, 1,
1.590575, -0.9001759, 2.489918, 1, 0, 0.3176471, 1,
1.613279, -0.4148035, 1.269258, 1, 0, 0.3137255, 1,
1.615906, 2.151025, -0.311769, 1, 0, 0.3058824, 1,
1.616989, 0.2175758, 2.191983, 1, 0, 0.2980392, 1,
1.61877, -1.105727, 2.585848, 1, 0, 0.2941177, 1,
1.622345, -0.3918121, 0.3015293, 1, 0, 0.2862745, 1,
1.637592, -1.236505, 1.006576, 1, 0, 0.282353, 1,
1.63998, 1.917285, 1.056508, 1, 0, 0.2745098, 1,
1.640544, -0.1504004, 1.023784, 1, 0, 0.2705882, 1,
1.673326, -0.6042935, -0.6203308, 1, 0, 0.2627451, 1,
1.678511, 2.122993, -0.848184, 1, 0, 0.2588235, 1,
1.680586, -0.1633303, 2.828403, 1, 0, 0.2509804, 1,
1.698905, 0.4270678, -0.3375048, 1, 0, 0.2470588, 1,
1.699337, 0.2179803, 1.431603, 1, 0, 0.2392157, 1,
1.715457, 0.4873208, 1.238564, 1, 0, 0.2352941, 1,
1.734673, 2.032925, 0.1458898, 1, 0, 0.227451, 1,
1.745439, 0.4344307, 1.730291, 1, 0, 0.2235294, 1,
1.802115, 0.2909998, 1.014617, 1, 0, 0.2156863, 1,
1.812791, -0.7061102, 0.2465127, 1, 0, 0.2117647, 1,
1.83372, -1.211054, 2.389096, 1, 0, 0.2039216, 1,
1.850737, 0.48985, 1.401537, 1, 0, 0.1960784, 1,
1.86812, 0.5490428, 2.395818, 1, 0, 0.1921569, 1,
1.878391, 0.08726532, 0.6945421, 1, 0, 0.1843137, 1,
1.879711, 0.5369701, 0.7111399, 1, 0, 0.1803922, 1,
1.89784, 0.8801352, 1.795269, 1, 0, 0.172549, 1,
1.938998, 1.437893, -1.168783, 1, 0, 0.1686275, 1,
1.960367, -0.5448318, 1.877422, 1, 0, 0.1607843, 1,
1.962053, -0.8430299, 1.660962, 1, 0, 0.1568628, 1,
2.008222, 0.827076, 2.994313, 1, 0, 0.1490196, 1,
2.014324, -0.7506591, 2.552841, 1, 0, 0.145098, 1,
2.018545, 0.05708624, 1.087021, 1, 0, 0.1372549, 1,
2.02853, -0.3060213, -0.2970967, 1, 0, 0.1333333, 1,
2.051003, -1.609128, 2.231423, 1, 0, 0.1254902, 1,
2.071074, 0.1135404, 1.33648, 1, 0, 0.1215686, 1,
2.087584, 0.9709084, 0.4764291, 1, 0, 0.1137255, 1,
2.088665, 0.05621655, 1.892341, 1, 0, 0.1098039, 1,
2.098067, 0.7510696, 2.909721, 1, 0, 0.1019608, 1,
2.11414, -0.2063418, 1.607903, 1, 0, 0.09411765, 1,
2.140911, 0.1364664, 0.4815488, 1, 0, 0.09019608, 1,
2.145699, 1.59108, 2.4579, 1, 0, 0.08235294, 1,
2.148418, 0.07837173, 3.614767, 1, 0, 0.07843138, 1,
2.155705, 1.862613, 0.09206393, 1, 0, 0.07058824, 1,
2.157994, 1.611104, 1.320069, 1, 0, 0.06666667, 1,
2.184447, 0.2218576, 1.793787, 1, 0, 0.05882353, 1,
2.235344, 0.2487473, 3.090126, 1, 0, 0.05490196, 1,
2.303555, -1.08346, 1.794504, 1, 0, 0.04705882, 1,
2.31981, 0.158568, 0.05507257, 1, 0, 0.04313726, 1,
2.343623, 1.176455, 2.283828, 1, 0, 0.03529412, 1,
2.383069, -0.8247068, 1.962247, 1, 0, 0.03137255, 1,
2.408186, -0.02652355, 2.344116, 1, 0, 0.02352941, 1,
2.450668, 0.9266613, 0.9662446, 1, 0, 0.01960784, 1,
2.624747, -0.7525908, 1.811956, 1, 0, 0.01176471, 1,
2.829651, 0.574758, 2.128903, 1, 0, 0.007843138, 1
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
-0.1372781, -4.401595, -6.516883, 0, -0.5, 0.5, 0.5,
-0.1372781, -4.401595, -6.516883, 1, -0.5, 0.5, 0.5,
-0.1372781, -4.401595, -6.516883, 1, 1.5, 0.5, 0.5,
-0.1372781, -4.401595, -6.516883, 0, 1.5, 0.5, 0.5
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
-4.109996, -0.1651424, -6.516883, 0, -0.5, 0.5, 0.5,
-4.109996, -0.1651424, -6.516883, 1, -0.5, 0.5, 0.5,
-4.109996, -0.1651424, -6.516883, 1, 1.5, 0.5, 0.5,
-4.109996, -0.1651424, -6.516883, 0, 1.5, 0.5, 0.5
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
-4.109996, -4.401595, 0.3931799, 0, -0.5, 0.5, 0.5,
-4.109996, -4.401595, 0.3931799, 1, -0.5, 0.5, 0.5,
-4.109996, -4.401595, 0.3931799, 1, 1.5, 0.5, 0.5,
-4.109996, -4.401595, 0.3931799, 0, 1.5, 0.5, 0.5
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
-3, -3.423952, -4.922254,
2, -3.423952, -4.922254,
-3, -3.423952, -4.922254,
-3, -3.586893, -5.188025,
-2, -3.423952, -4.922254,
-2, -3.586893, -5.188025,
-1, -3.423952, -4.922254,
-1, -3.586893, -5.188025,
0, -3.423952, -4.922254,
0, -3.586893, -5.188025,
1, -3.423952, -4.922254,
1, -3.586893, -5.188025,
2, -3.423952, -4.922254,
2, -3.586893, -5.188025
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
-3, -3.912774, -5.719569, 0, -0.5, 0.5, 0.5,
-3, -3.912774, -5.719569, 1, -0.5, 0.5, 0.5,
-3, -3.912774, -5.719569, 1, 1.5, 0.5, 0.5,
-3, -3.912774, -5.719569, 0, 1.5, 0.5, 0.5,
-2, -3.912774, -5.719569, 0, -0.5, 0.5, 0.5,
-2, -3.912774, -5.719569, 1, -0.5, 0.5, 0.5,
-2, -3.912774, -5.719569, 1, 1.5, 0.5, 0.5,
-2, -3.912774, -5.719569, 0, 1.5, 0.5, 0.5,
-1, -3.912774, -5.719569, 0, -0.5, 0.5, 0.5,
-1, -3.912774, -5.719569, 1, -0.5, 0.5, 0.5,
-1, -3.912774, -5.719569, 1, 1.5, 0.5, 0.5,
-1, -3.912774, -5.719569, 0, 1.5, 0.5, 0.5,
0, -3.912774, -5.719569, 0, -0.5, 0.5, 0.5,
0, -3.912774, -5.719569, 1, -0.5, 0.5, 0.5,
0, -3.912774, -5.719569, 1, 1.5, 0.5, 0.5,
0, -3.912774, -5.719569, 0, 1.5, 0.5, 0.5,
1, -3.912774, -5.719569, 0, -0.5, 0.5, 0.5,
1, -3.912774, -5.719569, 1, -0.5, 0.5, 0.5,
1, -3.912774, -5.719569, 1, 1.5, 0.5, 0.5,
1, -3.912774, -5.719569, 0, 1.5, 0.5, 0.5,
2, -3.912774, -5.719569, 0, -0.5, 0.5, 0.5,
2, -3.912774, -5.719569, 1, -0.5, 0.5, 0.5,
2, -3.912774, -5.719569, 1, 1.5, 0.5, 0.5,
2, -3.912774, -5.719569, 0, 1.5, 0.5, 0.5
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
-3.193215, -3, -4.922254,
-3.193215, 2, -4.922254,
-3.193215, -3, -4.922254,
-3.346012, -3, -5.188025,
-3.193215, -2, -4.922254,
-3.346012, -2, -5.188025,
-3.193215, -1, -4.922254,
-3.346012, -1, -5.188025,
-3.193215, 0, -4.922254,
-3.346012, 0, -5.188025,
-3.193215, 1, -4.922254,
-3.346012, 1, -5.188025,
-3.193215, 2, -4.922254,
-3.346012, 2, -5.188025
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
-3.651606, -3, -5.719569, 0, -0.5, 0.5, 0.5,
-3.651606, -3, -5.719569, 1, -0.5, 0.5, 0.5,
-3.651606, -3, -5.719569, 1, 1.5, 0.5, 0.5,
-3.651606, -3, -5.719569, 0, 1.5, 0.5, 0.5,
-3.651606, -2, -5.719569, 0, -0.5, 0.5, 0.5,
-3.651606, -2, -5.719569, 1, -0.5, 0.5, 0.5,
-3.651606, -2, -5.719569, 1, 1.5, 0.5, 0.5,
-3.651606, -2, -5.719569, 0, 1.5, 0.5, 0.5,
-3.651606, -1, -5.719569, 0, -0.5, 0.5, 0.5,
-3.651606, -1, -5.719569, 1, -0.5, 0.5, 0.5,
-3.651606, -1, -5.719569, 1, 1.5, 0.5, 0.5,
-3.651606, -1, -5.719569, 0, 1.5, 0.5, 0.5,
-3.651606, 0, -5.719569, 0, -0.5, 0.5, 0.5,
-3.651606, 0, -5.719569, 1, -0.5, 0.5, 0.5,
-3.651606, 0, -5.719569, 1, 1.5, 0.5, 0.5,
-3.651606, 0, -5.719569, 0, 1.5, 0.5, 0.5,
-3.651606, 1, -5.719569, 0, -0.5, 0.5, 0.5,
-3.651606, 1, -5.719569, 1, -0.5, 0.5, 0.5,
-3.651606, 1, -5.719569, 1, 1.5, 0.5, 0.5,
-3.651606, 1, -5.719569, 0, 1.5, 0.5, 0.5,
-3.651606, 2, -5.719569, 0, -0.5, 0.5, 0.5,
-3.651606, 2, -5.719569, 1, -0.5, 0.5, 0.5,
-3.651606, 2, -5.719569, 1, 1.5, 0.5, 0.5,
-3.651606, 2, -5.719569, 0, 1.5, 0.5, 0.5
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
-3.193215, -3.423952, -4,
-3.193215, -3.423952, 4,
-3.193215, -3.423952, -4,
-3.346012, -3.586893, -4,
-3.193215, -3.423952, -2,
-3.346012, -3.586893, -2,
-3.193215, -3.423952, 0,
-3.346012, -3.586893, 0,
-3.193215, -3.423952, 2,
-3.346012, -3.586893, 2,
-3.193215, -3.423952, 4,
-3.346012, -3.586893, 4
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
-3.651606, -3.912774, -4, 0, -0.5, 0.5, 0.5,
-3.651606, -3.912774, -4, 1, -0.5, 0.5, 0.5,
-3.651606, -3.912774, -4, 1, 1.5, 0.5, 0.5,
-3.651606, -3.912774, -4, 0, 1.5, 0.5, 0.5,
-3.651606, -3.912774, -2, 0, -0.5, 0.5, 0.5,
-3.651606, -3.912774, -2, 1, -0.5, 0.5, 0.5,
-3.651606, -3.912774, -2, 1, 1.5, 0.5, 0.5,
-3.651606, -3.912774, -2, 0, 1.5, 0.5, 0.5,
-3.651606, -3.912774, 0, 0, -0.5, 0.5, 0.5,
-3.651606, -3.912774, 0, 1, -0.5, 0.5, 0.5,
-3.651606, -3.912774, 0, 1, 1.5, 0.5, 0.5,
-3.651606, -3.912774, 0, 0, 1.5, 0.5, 0.5,
-3.651606, -3.912774, 2, 0, -0.5, 0.5, 0.5,
-3.651606, -3.912774, 2, 1, -0.5, 0.5, 0.5,
-3.651606, -3.912774, 2, 1, 1.5, 0.5, 0.5,
-3.651606, -3.912774, 2, 0, 1.5, 0.5, 0.5,
-3.651606, -3.912774, 4, 0, -0.5, 0.5, 0.5,
-3.651606, -3.912774, 4, 1, -0.5, 0.5, 0.5,
-3.651606, -3.912774, 4, 1, 1.5, 0.5, 0.5,
-3.651606, -3.912774, 4, 0, 1.5, 0.5, 0.5
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
-3.193215, -3.423952, -4.922254,
-3.193215, 3.093668, -4.922254,
-3.193215, -3.423952, 5.708613,
-3.193215, 3.093668, 5.708613,
-3.193215, -3.423952, -4.922254,
-3.193215, -3.423952, 5.708613,
-3.193215, 3.093668, -4.922254,
-3.193215, 3.093668, 5.708613,
-3.193215, -3.423952, -4.922254,
2.918659, -3.423952, -4.922254,
-3.193215, -3.423952, 5.708613,
2.918659, -3.423952, 5.708613,
-3.193215, 3.093668, -4.922254,
2.918659, 3.093668, -4.922254,
-3.193215, 3.093668, 5.708613,
2.918659, 3.093668, 5.708613,
2.918659, -3.423952, -4.922254,
2.918659, 3.093668, -4.922254,
2.918659, -3.423952, 5.708613,
2.918659, 3.093668, 5.708613,
2.918659, -3.423952, -4.922254,
2.918659, -3.423952, 5.708613,
2.918659, 3.093668, -4.922254,
2.918659, 3.093668, 5.708613
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
var radius = 7.415406;
var distance = 32.99198;
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
mvMatrix.translate( 0.1372781, 0.1651424, -0.3931799 );
mvMatrix.scale( 1.311821, 1.230155, 0.754189 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.99198);
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
TFC<-read.table("TFC.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-TFC$V2
```

```
## Error in eval(expr, envir, enclos): object 'TFC' not found
```

```r
y<-TFC$V3
```

```
## Error in eval(expr, envir, enclos): object 'TFC' not found
```

```r
z<-TFC$V4
```

```
## Error in eval(expr, envir, enclos): object 'TFC' not found
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
-3.104207, -1.374703, -1.792921, 0, 0, 1, 1, 1,
-3.104078, -1.25464, -0.493942, 1, 0, 0, 1, 1,
-2.876806, -0.6752733, -1.337692, 1, 0, 0, 1, 1,
-2.678629, -0.02442847, -0.8279742, 1, 0, 0, 1, 1,
-2.631076, -1.413611, -2.906959, 1, 0, 0, 1, 1,
-2.627588, 0.09661719, -1.376784, 1, 0, 0, 1, 1,
-2.467334, 1.072079, -1.875423, 0, 0, 0, 1, 1,
-2.412268, -0.7832164, -2.904422, 0, 0, 0, 1, 1,
-2.356452, 0.5337538, -1.801125, 0, 0, 0, 1, 1,
-2.34968, 2.12416, -1.886131, 0, 0, 0, 1, 1,
-2.268149, -0.9374216, -1.976879, 0, 0, 0, 1, 1,
-2.251173, 0.2260533, -3.289607, 0, 0, 0, 1, 1,
-2.215844, -1.704229, -2.838656, 0, 0, 0, 1, 1,
-2.166882, 0.4428294, -0.3384579, 1, 1, 1, 1, 1,
-2.16442, -1.73958, -2.775275, 1, 1, 1, 1, 1,
-2.154629, 0.3907843, -2.179465, 1, 1, 1, 1, 1,
-2.01434, -0.2254738, -2.176892, 1, 1, 1, 1, 1,
-1.967055, -1.67055, -1.859149, 1, 1, 1, 1, 1,
-1.963526, 0.05434905, -1.45835, 1, 1, 1, 1, 1,
-1.959758, 1.249775, -1.066594, 1, 1, 1, 1, 1,
-1.925079, -0.3052988, -1.467639, 1, 1, 1, 1, 1,
-1.921437, -0.4329855, -1.398834, 1, 1, 1, 1, 1,
-1.913508, 0.2547146, 0.3860627, 1, 1, 1, 1, 1,
-1.908733, -0.8044992, -1.524248, 1, 1, 1, 1, 1,
-1.86161, -1.148695, -1.502612, 1, 1, 1, 1, 1,
-1.851119, 2.6068, -1.713617, 1, 1, 1, 1, 1,
-1.846387, -0.4873277, -2.506047, 1, 1, 1, 1, 1,
-1.840086, -1.463871, -1.539107, 1, 1, 1, 1, 1,
-1.837701, 2.911245, 0.1014381, 0, 0, 1, 1, 1,
-1.805539, 1.382275, 0.06840511, 1, 0, 0, 1, 1,
-1.800231, 1.173159, -1.034438, 1, 0, 0, 1, 1,
-1.788023, -1.179641, -1.892885, 1, 0, 0, 1, 1,
-1.782851, 0.6481373, -3.767231, 1, 0, 0, 1, 1,
-1.764637, 0.1965477, -1.998067, 1, 0, 0, 1, 1,
-1.757518, 1.215538, -0.9453408, 0, 0, 0, 1, 1,
-1.742961, 1.113057, -2.678095, 0, 0, 0, 1, 1,
-1.739127, -0.1031095, -2.530622, 0, 0, 0, 1, 1,
-1.727544, -0.157798, -0.3663056, 0, 0, 0, 1, 1,
-1.721812, 0.9227455, -0.5271749, 0, 0, 0, 1, 1,
-1.699431, -0.6119634, -1.810839, 0, 0, 0, 1, 1,
-1.686198, 1.811001, 0.7139053, 0, 0, 0, 1, 1,
-1.674821, -0.118363, -1.422503, 1, 1, 1, 1, 1,
-1.663607, 0.876433, -1.105116, 1, 1, 1, 1, 1,
-1.660954, -1.649327, -3.851693, 1, 1, 1, 1, 1,
-1.657351, -1.426956, -2.439221, 1, 1, 1, 1, 1,
-1.653746, -0.9674518, -1.577492, 1, 1, 1, 1, 1,
-1.633936, 0.8454785, 0.0432982, 1, 1, 1, 1, 1,
-1.629544, 0.1534124, -2.704206, 1, 1, 1, 1, 1,
-1.618114, 1.001786, -1.405605, 1, 1, 1, 1, 1,
-1.570548, 0.7030383, -0.1605594, 1, 1, 1, 1, 1,
-1.563192, -0.132465, -0.08494046, 1, 1, 1, 1, 1,
-1.548573, -1.069397, -4.418747, 1, 1, 1, 1, 1,
-1.54111, 1.662888, -0.8296854, 1, 1, 1, 1, 1,
-1.540977, -1.364218, -2.031122, 1, 1, 1, 1, 1,
-1.538393, 1.599378, -1.114767, 1, 1, 1, 1, 1,
-1.526, -0.7213281, -2.109609, 1, 1, 1, 1, 1,
-1.514601, -0.2912718, -2.119222, 0, 0, 1, 1, 1,
-1.505162, -1.057632, -1.766586, 1, 0, 0, 1, 1,
-1.503693, 0.4533869, -2.395432, 1, 0, 0, 1, 1,
-1.500328, -1.283734, -4.389992, 1, 0, 0, 1, 1,
-1.500189, -1.402556, -1.942773, 1, 0, 0, 1, 1,
-1.499584, 0.07415207, -2.907801, 1, 0, 0, 1, 1,
-1.493608, 1.048587, 0.4767897, 0, 0, 0, 1, 1,
-1.486706, 0.298123, -1.540491, 0, 0, 0, 1, 1,
-1.473717, -0.09472038, -0.2328445, 0, 0, 0, 1, 1,
-1.469669, -0.9903442, -2.422026, 0, 0, 0, 1, 1,
-1.458556, -0.0003046406, -0.7035497, 0, 0, 0, 1, 1,
-1.456527, -0.593344, -2.426485, 0, 0, 0, 1, 1,
-1.435336, 0.8020912, -1.528725, 0, 0, 0, 1, 1,
-1.431417, 0.8249795, -0.1362629, 1, 1, 1, 1, 1,
-1.430922, 0.6309583, -1.784803, 1, 1, 1, 1, 1,
-1.427001, -1.854404, -2.457722, 1, 1, 1, 1, 1,
-1.424075, -0.3995706, -1.003758, 1, 1, 1, 1, 1,
-1.423649, -1.168792, 0.08318085, 1, 1, 1, 1, 1,
-1.405642, -0.7039454, -1.345773, 1, 1, 1, 1, 1,
-1.399061, -0.2109642, -3.699407, 1, 1, 1, 1, 1,
-1.397149, 0.6573741, -0.7197645, 1, 1, 1, 1, 1,
-1.388992, 1.031512, -0.850475, 1, 1, 1, 1, 1,
-1.379764, 0.246496, -0.7691098, 1, 1, 1, 1, 1,
-1.377597, 1.650284, -1.630339, 1, 1, 1, 1, 1,
-1.377523, -0.4587739, -3.971769, 1, 1, 1, 1, 1,
-1.376501, -0.1969912, -0.7161187, 1, 1, 1, 1, 1,
-1.359487, 1.301071, -1.590783, 1, 1, 1, 1, 1,
-1.357068, -0.304702, -1.418116, 1, 1, 1, 1, 1,
-1.34423, 0.4941444, -0.130855, 0, 0, 1, 1, 1,
-1.343891, 0.9341641, -0.8878273, 1, 0, 0, 1, 1,
-1.340121, 0.5508381, -1.197648, 1, 0, 0, 1, 1,
-1.328164, -0.926932, -2.383964, 1, 0, 0, 1, 1,
-1.324871, 0.2162927, -1.337118, 1, 0, 0, 1, 1,
-1.318768, 0.05437504, 0.2499628, 1, 0, 0, 1, 1,
-1.314012, -1.101991, -2.856083, 0, 0, 0, 1, 1,
-1.303846, 0.228164, -1.92161, 0, 0, 0, 1, 1,
-1.297112, -0.09247495, -1.675548, 0, 0, 0, 1, 1,
-1.293538, -0.6811993, -3.255106, 0, 0, 0, 1, 1,
-1.285288, -1.11396, -3.765523, 0, 0, 0, 1, 1,
-1.278418, 1.597636, 1.351953, 0, 0, 0, 1, 1,
-1.276248, -1.34389, -4.219219, 0, 0, 0, 1, 1,
-1.251803, -0.1696444, -0.7534435, 1, 1, 1, 1, 1,
-1.250648, -1.844709, -2.117371, 1, 1, 1, 1, 1,
-1.249587, -0.5191296, -0.05169139, 1, 1, 1, 1, 1,
-1.248032, -1.18699, 0.3916607, 1, 1, 1, 1, 1,
-1.241117, -1.650027, -3.319591, 1, 1, 1, 1, 1,
-1.23043, 0.6184254, -0.1612558, 1, 1, 1, 1, 1,
-1.2164, 0.8412528, -0.7967646, 1, 1, 1, 1, 1,
-1.207992, -2.081816, -3.273718, 1, 1, 1, 1, 1,
-1.200558, 1.131112, -0.01676171, 1, 1, 1, 1, 1,
-1.187906, -1.120577, -3.675193, 1, 1, 1, 1, 1,
-1.180326, 0.1289824, -1.380166, 1, 1, 1, 1, 1,
-1.175959, -0.752811, -0.4007704, 1, 1, 1, 1, 1,
-1.175953, -0.2573375, -1.406982, 1, 1, 1, 1, 1,
-1.174585, -3.329036, -2.507582, 1, 1, 1, 1, 1,
-1.173497, -1.35119, -2.932522, 1, 1, 1, 1, 1,
-1.173254, -0.3934808, -1.991821, 0, 0, 1, 1, 1,
-1.17198, 1.709278, 0.512132, 1, 0, 0, 1, 1,
-1.170026, -1.077945, -2.083145, 1, 0, 0, 1, 1,
-1.169837, -0.06289648, -1.548298, 1, 0, 0, 1, 1,
-1.163619, 1.156647, 0.3405617, 1, 0, 0, 1, 1,
-1.162325, 1.420183, -0.1005925, 1, 0, 0, 1, 1,
-1.152267, -0.2963404, -2.279842, 0, 0, 0, 1, 1,
-1.148089, -0.1847, -1.519783, 0, 0, 0, 1, 1,
-1.139862, -1.280876, -2.060823, 0, 0, 0, 1, 1,
-1.138923, -0.43411, -2.345076, 0, 0, 0, 1, 1,
-1.135833, -0.9578044, -3.831472, 0, 0, 0, 1, 1,
-1.135278, 0.8906111, 0.8623989, 0, 0, 0, 1, 1,
-1.13476, -0.2655852, -1.867458, 0, 0, 0, 1, 1,
-1.131349, -0.9871545, -1.289528, 1, 1, 1, 1, 1,
-1.125117, 0.2599438, -1.240564, 1, 1, 1, 1, 1,
-1.122321, -1.523137, -3.946589, 1, 1, 1, 1, 1,
-1.12227, 0.04527732, -2.729882, 1, 1, 1, 1, 1,
-1.116619, -1.856337, -2.713134, 1, 1, 1, 1, 1,
-1.107985, 0.08781562, -1.14463, 1, 1, 1, 1, 1,
-1.106822, -0.4373774, -1.601486, 1, 1, 1, 1, 1,
-1.106351, 0.3245953, -1.475702, 1, 1, 1, 1, 1,
-1.10156, 1.279687, 0.5470863, 1, 1, 1, 1, 1,
-1.086055, -0.5267866, -2.479867, 1, 1, 1, 1, 1,
-1.082634, -0.2374435, -1.838078, 1, 1, 1, 1, 1,
-1.082171, 0.2658744, -1.502985, 1, 1, 1, 1, 1,
-1.080094, -1.393906, -3.058976, 1, 1, 1, 1, 1,
-1.073292, 0.6324363, -1.867701, 1, 1, 1, 1, 1,
-1.070218, -0.1266696, -2.004143, 1, 1, 1, 1, 1,
-1.068019, -0.2466451, -2.627867, 0, 0, 1, 1, 1,
-1.064123, -0.4089074, -1.576804, 1, 0, 0, 1, 1,
-1.057747, -0.9505036, -2.207554, 1, 0, 0, 1, 1,
-1.046389, 0.9635868, -1.097582, 1, 0, 0, 1, 1,
-1.03509, -1.421918, -3.357565, 1, 0, 0, 1, 1,
-1.031539, 0.6485929, 0.8291452, 1, 0, 0, 1, 1,
-1.029089, 1.206603, -1.894837, 0, 0, 0, 1, 1,
-1.027525, -0.3644283, -2.418555, 0, 0, 0, 1, 1,
-1.025313, -0.401059, -2.539917, 0, 0, 0, 1, 1,
-1.023119, -0.9569968, -2.168435, 0, 0, 0, 1, 1,
-1.022878, 0.7517741, -1.711968, 0, 0, 0, 1, 1,
-1.021065, 0.2470994, -1.864967, 0, 0, 0, 1, 1,
-1.019654, 0.8816185, -2.131696, 0, 0, 0, 1, 1,
-1.016805, -0.1002236, -1.826114, 1, 1, 1, 1, 1,
-1.016247, 1.043006, 0.8032175, 1, 1, 1, 1, 1,
-1.011721, 0.8912175, -1.741508, 1, 1, 1, 1, 1,
-1.006936, 0.2317669, -3.255426, 1, 1, 1, 1, 1,
-1.004781, 1.228089, -0.2962418, 1, 1, 1, 1, 1,
-1.000607, -0.05834264, -2.052554, 1, 1, 1, 1, 1,
-0.9964404, 0.6806454, -0.8360836, 1, 1, 1, 1, 1,
-0.9962346, 0.4486229, -0.935783, 1, 1, 1, 1, 1,
-0.9937941, 1.288503, -0.8009676, 1, 1, 1, 1, 1,
-0.9837415, -0.2752281, -0.4615381, 1, 1, 1, 1, 1,
-0.9800507, 0.3182454, -2.21156, 1, 1, 1, 1, 1,
-0.9785514, -0.07181025, -1.174958, 1, 1, 1, 1, 1,
-0.9739112, -0.6369071, -2.448803, 1, 1, 1, 1, 1,
-0.9733236, -0.5221057, -1.619341, 1, 1, 1, 1, 1,
-0.9722279, 0.04281043, -1.920761, 1, 1, 1, 1, 1,
-0.9694045, -0.2522189, -1.674124, 0, 0, 1, 1, 1,
-0.9641061, -0.5018424, -2.065586, 1, 0, 0, 1, 1,
-0.9626732, -0.1427643, -3.104055, 1, 0, 0, 1, 1,
-0.9530776, -0.1486374, -2.232365, 1, 0, 0, 1, 1,
-0.9474172, 0.7085676, -0.1043855, 1, 0, 0, 1, 1,
-0.9445646, -2.030281, -3.892199, 1, 0, 0, 1, 1,
-0.942626, -1.035669, -3.341271, 0, 0, 0, 1, 1,
-0.9381489, -0.7378449, -2.335943, 0, 0, 0, 1, 1,
-0.9374902, 0.861786, -1.822877, 0, 0, 0, 1, 1,
-0.9356769, -0.01609652, -1.245467, 0, 0, 0, 1, 1,
-0.927615, 0.4103962, -1.604679, 0, 0, 0, 1, 1,
-0.926458, -0.5867346, -2.253387, 0, 0, 0, 1, 1,
-0.9260145, -1.262618, -1.945872, 0, 0, 0, 1, 1,
-0.9236737, 1.888641, -2.557681, 1, 1, 1, 1, 1,
-0.9204782, -0.4300466, -1.13341, 1, 1, 1, 1, 1,
-0.9181392, -1.454398, -3.218488, 1, 1, 1, 1, 1,
-0.9164749, 0.9085309, -0.9315723, 1, 1, 1, 1, 1,
-0.914881, 0.71548, -1.628615, 1, 1, 1, 1, 1,
-0.9114659, 0.3612993, -3.437759, 1, 1, 1, 1, 1,
-0.9107802, 0.1339023, 0.2899558, 1, 1, 1, 1, 1,
-0.9002841, 0.7130949, -0.3838928, 1, 1, 1, 1, 1,
-0.896159, -0.2287712, -2.249248, 1, 1, 1, 1, 1,
-0.8958659, -0.02136155, -2.090861, 1, 1, 1, 1, 1,
-0.8873219, -1.544708, -2.701857, 1, 1, 1, 1, 1,
-0.8857454, 0.4329244, -0.08328556, 1, 1, 1, 1, 1,
-0.8822322, 1.129968, -0.56635, 1, 1, 1, 1, 1,
-0.8799574, 0.4022644, 0.6354529, 1, 1, 1, 1, 1,
-0.8788809, 0.9380728, -1.523407, 1, 1, 1, 1, 1,
-0.8783833, -0.1540037, -2.523114, 0, 0, 1, 1, 1,
-0.8743607, 0.1810933, -1.044658, 1, 0, 0, 1, 1,
-0.8714242, -0.8978894, -1.353794, 1, 0, 0, 1, 1,
-0.8690355, 1.509815, -1.366483, 1, 0, 0, 1, 1,
-0.8648456, 0.5529007, -2.372279, 1, 0, 0, 1, 1,
-0.8629767, -0.7050572, -3.196346, 1, 0, 0, 1, 1,
-0.8594939, 1.453518, -1.066756, 0, 0, 0, 1, 1,
-0.8580641, -0.5396025, -0.9578215, 0, 0, 0, 1, 1,
-0.8539503, 1.198821, -0.3539586, 0, 0, 0, 1, 1,
-0.8524569, 0.9422789, -1.233139, 0, 0, 0, 1, 1,
-0.8509256, 0.7752159, -0.9972526, 0, 0, 0, 1, 1,
-0.8480669, 1.112939, 0.7230241, 0, 0, 0, 1, 1,
-0.8392273, 0.4985543, -1.548884, 0, 0, 0, 1, 1,
-0.8369442, -0.8173988, -1.617616, 1, 1, 1, 1, 1,
-0.836644, -1.396908, -1.739688, 1, 1, 1, 1, 1,
-0.8353019, 0.7106789, -1.016798, 1, 1, 1, 1, 1,
-0.8270605, -1.284998, -3.284839, 1, 1, 1, 1, 1,
-0.8215851, 0.3361787, -0.04447482, 1, 1, 1, 1, 1,
-0.8174682, -0.9123373, -2.802588, 1, 1, 1, 1, 1,
-0.8128062, -0.4379247, -3.120038, 1, 1, 1, 1, 1,
-0.811673, -0.3543077, -1.116031, 1, 1, 1, 1, 1,
-0.8022969, 2.318005, -0.9519582, 1, 1, 1, 1, 1,
-0.7865123, -1.346077, -2.483035, 1, 1, 1, 1, 1,
-0.7810052, -2.381059, -3.514354, 1, 1, 1, 1, 1,
-0.7791043, -0.1475997, -1.570105, 1, 1, 1, 1, 1,
-0.7776358, 1.135536, -0.2998284, 1, 1, 1, 1, 1,
-0.7762319, -0.9212106, -1.794834, 1, 1, 1, 1, 1,
-0.7744976, -1.446193, -4.024431, 1, 1, 1, 1, 1,
-0.7739371, -0.8351324, -1.454825, 0, 0, 1, 1, 1,
-0.7732008, 0.1428209, -1.483189, 1, 0, 0, 1, 1,
-0.7602763, 0.2855283, -1.502033, 1, 0, 0, 1, 1,
-0.7592094, 0.4691401, -2.825069, 1, 0, 0, 1, 1,
-0.7574356, -0.7334492, -1.333323, 1, 0, 0, 1, 1,
-0.7570707, 0.2021227, -1.991592, 1, 0, 0, 1, 1,
-0.7557514, -0.7601442, -2.721523, 0, 0, 0, 1, 1,
-0.744211, 0.1271486, -1.412928, 0, 0, 0, 1, 1,
-0.7435352, -1.006611, -1.950822, 0, 0, 0, 1, 1,
-0.7412931, -0.04851046, -2.253068, 0, 0, 0, 1, 1,
-0.7402536, 0.4567025, -1.820454, 0, 0, 0, 1, 1,
-0.7398112, 1.26258, 1.905651, 0, 0, 0, 1, 1,
-0.7356724, 0.6042944, -0.6620386, 0, 0, 0, 1, 1,
-0.7320323, 1.592868, 0.734553, 1, 1, 1, 1, 1,
-0.7318742, -1.212586, -3.324763, 1, 1, 1, 1, 1,
-0.7272652, 1.05121, 0.002686817, 1, 1, 1, 1, 1,
-0.7267668, 0.341114, -0.5499592, 1, 1, 1, 1, 1,
-0.7266828, 0.8323452, 0.09763962, 1, 1, 1, 1, 1,
-0.7237188, 0.9357743, -1.036391, 1, 1, 1, 1, 1,
-0.7186633, -0.4733474, -2.095281, 1, 1, 1, 1, 1,
-0.7174764, 0.2737086, -1.651233, 1, 1, 1, 1, 1,
-0.7166654, 1.093958, -0.573994, 1, 1, 1, 1, 1,
-0.7161859, -2.396067, -1.745017, 1, 1, 1, 1, 1,
-0.7149222, 0.6564684, -1.036276, 1, 1, 1, 1, 1,
-0.713501, 0.4041516, 0.5935633, 1, 1, 1, 1, 1,
-0.7117208, -0.3502457, -2.31093, 1, 1, 1, 1, 1,
-0.7098444, -0.4368822, -2.758821, 1, 1, 1, 1, 1,
-0.7037399, 1.967408, -0.5061375, 1, 1, 1, 1, 1,
-0.7014616, 0.7403575, -1.432891, 0, 0, 1, 1, 1,
-0.6991931, 0.6413868, -0.2445612, 1, 0, 0, 1, 1,
-0.6947285, 0.4370798, -0.7013682, 1, 0, 0, 1, 1,
-0.6930006, -0.08585283, -1.383601, 1, 0, 0, 1, 1,
-0.6929969, 0.6836519, -0.340953, 1, 0, 0, 1, 1,
-0.691415, -0.3602433, -1.714295, 1, 0, 0, 1, 1,
-0.6853013, 0.9137931, -1.644317, 0, 0, 0, 1, 1,
-0.6852617, -1.020557, -1.945762, 0, 0, 0, 1, 1,
-0.6844853, -1.085894, -2.983812, 0, 0, 0, 1, 1,
-0.6807246, -1.977782, -3.596052, 0, 0, 0, 1, 1,
-0.6799099, -0.9284267, -2.995409, 0, 0, 0, 1, 1,
-0.6770037, 0.5967826, -1.01246, 0, 0, 0, 1, 1,
-0.6766782, 1.07518, -1.405488, 0, 0, 0, 1, 1,
-0.6750925, 1.70646, 0.3121324, 1, 1, 1, 1, 1,
-0.6592636, -0.5364574, -2.599672, 1, 1, 1, 1, 1,
-0.6579197, -1.507348, -1.834399, 1, 1, 1, 1, 1,
-0.6533027, -0.7664139, -3.819048, 1, 1, 1, 1, 1,
-0.641352, -0.7092642, -2.297633, 1, 1, 1, 1, 1,
-0.6403708, 1.61849, -0.1289481, 1, 1, 1, 1, 1,
-0.6370515, 0.1080159, -2.289344, 1, 1, 1, 1, 1,
-0.636836, 1.479329, 0.3833485, 1, 1, 1, 1, 1,
-0.6364089, 0.2634115, -2.490212, 1, 1, 1, 1, 1,
-0.6354599, -0.8355063, -1.99108, 1, 1, 1, 1, 1,
-0.6338512, -0.8331453, -4.204583, 1, 1, 1, 1, 1,
-0.6325496, -1.734715, -2.856879, 1, 1, 1, 1, 1,
-0.6314595, -0.2041168, -0.1387371, 1, 1, 1, 1, 1,
-0.6295242, -1.53395, -1.913836, 1, 1, 1, 1, 1,
-0.626367, 0.2887967, -1.068713, 1, 1, 1, 1, 1,
-0.620829, -0.1174497, -1.078231, 0, 0, 1, 1, 1,
-0.6203334, 2.212183, -0.8106602, 1, 0, 0, 1, 1,
-0.6193534, -1.064197, -0.7779896, 1, 0, 0, 1, 1,
-0.6085876, 0.124316, -1.780686, 1, 0, 0, 1, 1,
-0.6065454, -1.293288, -2.47481, 1, 0, 0, 1, 1,
-0.6045477, 0.3001569, -0.2486033, 1, 0, 0, 1, 1,
-0.6040471, -0.7814305, -2.384208, 0, 0, 0, 1, 1,
-0.5928439, 0.2300976, -1.368698, 0, 0, 0, 1, 1,
-0.5904481, 0.5390162, -0.8599647, 0, 0, 0, 1, 1,
-0.5887658, 1.096746, 0.2142601, 0, 0, 0, 1, 1,
-0.5806535, -0.6653737, -2.546995, 0, 0, 0, 1, 1,
-0.577003, 1.961297, 0.525234, 0, 0, 0, 1, 1,
-0.5765858, -0.265757, -2.328362, 0, 0, 0, 1, 1,
-0.5711295, -0.545314, -2.811127, 1, 1, 1, 1, 1,
-0.5696488, 0.3296186, 0.3381764, 1, 1, 1, 1, 1,
-0.5689778, -0.2026252, -0.8883408, 1, 1, 1, 1, 1,
-0.5689595, -0.6962905, -3.398554, 1, 1, 1, 1, 1,
-0.5689234, 0.5929758, 0.8651628, 1, 1, 1, 1, 1,
-0.5678792, -2.31266, -3.562588, 1, 1, 1, 1, 1,
-0.5632412, 0.9021536, -2.056081, 1, 1, 1, 1, 1,
-0.5632095, 1.134227, -1.38053, 1, 1, 1, 1, 1,
-0.5626121, -0.6310584, -1.605267, 1, 1, 1, 1, 1,
-0.56088, -0.8443367, -2.483566, 1, 1, 1, 1, 1,
-0.5541558, 0.9713405, -2.092583, 1, 1, 1, 1, 1,
-0.5514899, -0.2235613, -0.8274, 1, 1, 1, 1, 1,
-0.550373, 1.020917, -0.3113235, 1, 1, 1, 1, 1,
-0.5457017, -1.4062, -2.382351, 1, 1, 1, 1, 1,
-0.5448132, -0.1342761, -2.070239, 1, 1, 1, 1, 1,
-0.5437543, 1.03328, 0.6859375, 0, 0, 1, 1, 1,
-0.5285857, 0.08666225, -3.692187, 1, 0, 0, 1, 1,
-0.5268416, -0.01252776, -0.8366139, 1, 0, 0, 1, 1,
-0.52178, 0.1051133, -0.001151507, 1, 0, 0, 1, 1,
-0.5198085, 0.5443817, -0.09124903, 1, 0, 0, 1, 1,
-0.515057, 2.072453, -1.01177, 1, 0, 0, 1, 1,
-0.5102571, 1.550384, -0.5189605, 0, 0, 0, 1, 1,
-0.50978, 0.002865186, 0.003042776, 0, 0, 0, 1, 1,
-0.5089676, -0.3688172, -3.75218, 0, 0, 0, 1, 1,
-0.5077228, 0.8796996, -0.2890459, 0, 0, 0, 1, 1,
-0.5072166, 0.7947995, -1.02564, 0, 0, 0, 1, 1,
-0.5069374, 0.00565836, -2.473022, 0, 0, 0, 1, 1,
-0.5030684, -1.810897, -2.32549, 0, 0, 0, 1, 1,
-0.502261, -1.990822, -3.679303, 1, 1, 1, 1, 1,
-0.5008487, 0.1512545, -0.9483557, 1, 1, 1, 1, 1,
-0.4959492, 1.763116, 1.927603, 1, 1, 1, 1, 1,
-0.4948055, -1.383187, -2.642526, 1, 1, 1, 1, 1,
-0.4866239, 0.7436597, 0.5819346, 1, 1, 1, 1, 1,
-0.4834651, 1.273963, 0.7173759, 1, 1, 1, 1, 1,
-0.4820658, -0.4609012, -2.4015, 1, 1, 1, 1, 1,
-0.4795257, -0.967261, -3.205258, 1, 1, 1, 1, 1,
-0.4781094, 0.8202744, -0.7141872, 1, 1, 1, 1, 1,
-0.4707068, 1.897656, -0.8152368, 1, 1, 1, 1, 1,
-0.464823, 0.7649459, 0.25721, 1, 1, 1, 1, 1,
-0.4585911, -0.2024231, -2.758886, 1, 1, 1, 1, 1,
-0.4578301, -0.8100412, -1.445648, 1, 1, 1, 1, 1,
-0.4565925, -1.190491, -2.588447, 1, 1, 1, 1, 1,
-0.4517569, 0.8913017, -1.040335, 1, 1, 1, 1, 1,
-0.4489223, -0.6601926, -2.342484, 0, 0, 1, 1, 1,
-0.4479403, 0.7275582, -1.007242, 1, 0, 0, 1, 1,
-0.4474327, -0.4137021, -2.42585, 1, 0, 0, 1, 1,
-0.4472575, 0.4650122, -0.2831297, 1, 0, 0, 1, 1,
-0.4469882, -0.8796808, -2.707388, 1, 0, 0, 1, 1,
-0.4425701, -1.663637, -1.183138, 1, 0, 0, 1, 1,
-0.4424309, 0.07970912, -0.2176274, 0, 0, 0, 1, 1,
-0.437195, -1.08001, -0.9041404, 0, 0, 0, 1, 1,
-0.4364848, 0.6855831, 0.6702166, 0, 0, 0, 1, 1,
-0.4330255, 0.2649228, -1.187284, 0, 0, 0, 1, 1,
-0.4249018, -0.3734097, -1.901955, 0, 0, 0, 1, 1,
-0.4195936, -0.7394148, -3.806235, 0, 0, 0, 1, 1,
-0.4190651, 0.9794447, 1.03001, 0, 0, 0, 1, 1,
-0.4190121, 0.5032988, -0.9717144, 1, 1, 1, 1, 1,
-0.4183457, 1.168975, -1.048378, 1, 1, 1, 1, 1,
-0.4174288, -0.947165, -2.15997, 1, 1, 1, 1, 1,
-0.4156809, 0.4080547, 1.418118, 1, 1, 1, 1, 1,
-0.4056539, -0.6790045, -1.477874, 1, 1, 1, 1, 1,
-0.4052293, 0.1858264, -1.438951, 1, 1, 1, 1, 1,
-0.401965, -0.1707443, -3.265248, 1, 1, 1, 1, 1,
-0.401052, 0.2901923, -1.376285, 1, 1, 1, 1, 1,
-0.3989053, -0.6638221, -4.29617, 1, 1, 1, 1, 1,
-0.3974502, -0.3652036, -3.634805, 1, 1, 1, 1, 1,
-0.3926608, -0.1666269, -2.105961, 1, 1, 1, 1, 1,
-0.3905836, -1.118191, -4.767435, 1, 1, 1, 1, 1,
-0.3898757, -0.8999801, -3.401645, 1, 1, 1, 1, 1,
-0.3840713, -0.9359536, -2.580514, 1, 1, 1, 1, 1,
-0.3813674, -1.369149, -0.5589276, 1, 1, 1, 1, 1,
-0.3807549, -0.4043896, -1.871178, 0, 0, 1, 1, 1,
-0.3713672, -0.9909815, -3.944749, 1, 0, 0, 1, 1,
-0.3687664, 1.087477, 0.4558401, 1, 0, 0, 1, 1,
-0.3643353, -0.2544776, -1.749168, 1, 0, 0, 1, 1,
-0.357517, -0.9805413, -2.856217, 1, 0, 0, 1, 1,
-0.3525484, 0.4071917, -1.078287, 1, 0, 0, 1, 1,
-0.3525192, 1.183933, 1.135581, 0, 0, 0, 1, 1,
-0.3502078, 0.2554564, -1.160877, 0, 0, 0, 1, 1,
-0.3487518, -0.6368175, -2.957932, 0, 0, 0, 1, 1,
-0.3486145, -0.6457988, -4.426743, 0, 0, 0, 1, 1,
-0.3474163, -1.385403, -3.954133, 0, 0, 0, 1, 1,
-0.3434668, -1.321465, -3.405246, 0, 0, 0, 1, 1,
-0.3433096, 0.5952837, -0.5931948, 0, 0, 0, 1, 1,
-0.3432779, 0.7635239, -0.6013799, 1, 1, 1, 1, 1,
-0.342454, -1.259826, -1.673272, 1, 1, 1, 1, 1,
-0.3419659, 0.8422807, 0.4106829, 1, 1, 1, 1, 1,
-0.3407629, 0.4726462, 0.2310078, 1, 1, 1, 1, 1,
-0.3406446, 0.03385443, -0.711265, 1, 1, 1, 1, 1,
-0.3384814, 2.007337, 0.2986494, 1, 1, 1, 1, 1,
-0.3286167, -1.133813, -1.683849, 1, 1, 1, 1, 1,
-0.3254489, -0.1002798, -0.8680028, 1, 1, 1, 1, 1,
-0.3179879, 2.078599, -0.2888758, 1, 1, 1, 1, 1,
-0.3080526, -0.1741441, -0.8771228, 1, 1, 1, 1, 1,
-0.3062332, -0.4174573, -2.386204, 1, 1, 1, 1, 1,
-0.3060722, -0.5689628, -3.28676, 1, 1, 1, 1, 1,
-0.3055718, -1.13132, -3.714212, 1, 1, 1, 1, 1,
-0.3010376, -0.1046726, -1.753817, 1, 1, 1, 1, 1,
-0.3005344, 0.1925171, -1.519398, 1, 1, 1, 1, 1,
-0.2980269, -0.007767211, -1.134551, 0, 0, 1, 1, 1,
-0.2976562, -0.7344732, -2.645211, 1, 0, 0, 1, 1,
-0.2932461, 1.098118, -0.1959692, 1, 0, 0, 1, 1,
-0.2861111, -0.3952732, -4.178524, 1, 0, 0, 1, 1,
-0.2851707, -0.164429, -1.995963, 1, 0, 0, 1, 1,
-0.2795824, 0.8522041, 0.07413018, 1, 0, 0, 1, 1,
-0.2786375, -1.135018, -2.32431, 0, 0, 0, 1, 1,
-0.2759227, -0.8001536, -3.169766, 0, 0, 0, 1, 1,
-0.2731595, 0.7950395, 0.3503721, 0, 0, 0, 1, 1,
-0.2721186, -0.4583343, -2.513759, 0, 0, 0, 1, 1,
-0.2694296, -1.81946, -2.764951, 0, 0, 0, 1, 1,
-0.2677376, -0.9228464, -1.659412, 0, 0, 0, 1, 1,
-0.2662722, -0.6262625, -0.6950134, 0, 0, 0, 1, 1,
-0.2623122, 1.284464, -3.123737, 1, 1, 1, 1, 1,
-0.2553499, 0.7080807, -0.6271449, 1, 1, 1, 1, 1,
-0.2526519, 1.52206, -0.1002257, 1, 1, 1, 1, 1,
-0.2508999, 0.03060114, -3.269803, 1, 1, 1, 1, 1,
-0.248651, -0.1552222, -1.402736, 1, 1, 1, 1, 1,
-0.2485786, 0.5574183, -0.3701404, 1, 1, 1, 1, 1,
-0.2403003, 1.467328, -0.3331149, 1, 1, 1, 1, 1,
-0.2379751, -0.8745413, -4.158903, 1, 1, 1, 1, 1,
-0.2378284, -1.084684, -2.070608, 1, 1, 1, 1, 1,
-0.2360184, -0.6685095, -2.607319, 1, 1, 1, 1, 1,
-0.234262, -1.447297, -4.182648, 1, 1, 1, 1, 1,
-0.2320415, -1.321243, -0.8741324, 1, 1, 1, 1, 1,
-0.2285758, 0.5079473, -1.694278, 1, 1, 1, 1, 1,
-0.2271126, -0.3012279, -2.719795, 1, 1, 1, 1, 1,
-0.218902, -0.0208803, 1.07847, 1, 1, 1, 1, 1,
-0.2100213, -0.1605308, -2.027986, 0, 0, 1, 1, 1,
-0.209039, 1.192192, -0.7025512, 1, 0, 0, 1, 1,
-0.2084328, 0.6386611, -1.589554, 1, 0, 0, 1, 1,
-0.2075712, 1.052215, -0.1148763, 1, 0, 0, 1, 1,
-0.2055074, -1.018919, -2.775351, 1, 0, 0, 1, 1,
-0.205364, 1.240449, 0.9340546, 1, 0, 0, 1, 1,
-0.197273, -0.6726618, -3.589542, 0, 0, 0, 1, 1,
-0.195958, 1.67197, -0.5442232, 0, 0, 0, 1, 1,
-0.1937387, 0.3451473, 0.4959999, 0, 0, 0, 1, 1,
-0.1912352, 1.280618, -0.594767, 0, 0, 0, 1, 1,
-0.1897051, 0.2011849, -2.311517, 0, 0, 0, 1, 1,
-0.1867371, -1.23796, -1.967038, 0, 0, 0, 1, 1,
-0.184585, -0.4573456, -0.6214448, 0, 0, 0, 1, 1,
-0.1808297, 0.1235302, -1.865623, 1, 1, 1, 1, 1,
-0.1794558, 1.45749, -0.5536696, 1, 1, 1, 1, 1,
-0.1751178, -0.1851659, -2.532337, 1, 1, 1, 1, 1,
-0.1740085, -0.6596597, -1.609663, 1, 1, 1, 1, 1,
-0.1717311, -0.04572687, -2.233588, 1, 1, 1, 1, 1,
-0.1665755, -0.5409621, -3.720338, 1, 1, 1, 1, 1,
-0.1529164, -0.9356079, -3.481465, 1, 1, 1, 1, 1,
-0.1524982, 1.904792, -2.213423, 1, 1, 1, 1, 1,
-0.1436537, -0.5281798, -3.3934, 1, 1, 1, 1, 1,
-0.1406077, 0.2290682, -1.048468, 1, 1, 1, 1, 1,
-0.1369202, 0.3950021, 0.9700815, 1, 1, 1, 1, 1,
-0.1362849, -1.261824, -1.297315, 1, 1, 1, 1, 1,
-0.13202, -0.06381455, -2.791989, 1, 1, 1, 1, 1,
-0.1319094, -0.5441287, -3.299449, 1, 1, 1, 1, 1,
-0.1294897, 0.4314324, 1.22663, 1, 1, 1, 1, 1,
-0.1239742, -0.9979685, -1.772069, 0, 0, 1, 1, 1,
-0.1231869, -0.593659, -3.608834, 1, 0, 0, 1, 1,
-0.1225717, -0.03038123, -1.73744, 1, 0, 0, 1, 1,
-0.1220189, 1.353761, 0.1856024, 1, 0, 0, 1, 1,
-0.121363, -0.1605248, -2.998491, 1, 0, 0, 1, 1,
-0.1212091, 0.08327329, -0.4389971, 1, 0, 0, 1, 1,
-0.1173773, 0.1374183, -0.7278405, 0, 0, 0, 1, 1,
-0.1145674, -0.04153617, -1.021888, 0, 0, 0, 1, 1,
-0.1048683, 0.3630363, 0.9907578, 0, 0, 0, 1, 1,
-0.1011167, 1.442003, -0.1888449, 0, 0, 0, 1, 1,
-0.09856883, 0.5793716, 0.7005429, 0, 0, 0, 1, 1,
-0.09568149, -0.4583985, -2.229058, 0, 0, 0, 1, 1,
-0.09099757, 0.1657698, -0.5514423, 0, 0, 0, 1, 1,
-0.088609, 0.1116132, -0.908681, 1, 1, 1, 1, 1,
-0.0872995, 0.7689551, -0.6356988, 1, 1, 1, 1, 1,
-0.0828584, 1.812192, -0.5369689, 1, 1, 1, 1, 1,
-0.08248641, -0.03269201, -0.4342691, 1, 1, 1, 1, 1,
-0.08242448, -0.3135644, -3.998143, 1, 1, 1, 1, 1,
-0.07535111, -0.3019181, -2.514376, 1, 1, 1, 1, 1,
-0.07338842, 0.5780115, -0.2827369, 1, 1, 1, 1, 1,
-0.06962569, -0.7326562, -2.238667, 1, 1, 1, 1, 1,
-0.06528511, 1.050296, -0.7778314, 1, 1, 1, 1, 1,
-0.05926401, 0.287593, -0.3234157, 1, 1, 1, 1, 1,
-0.05899495, 0.4651449, -0.8660567, 1, 1, 1, 1, 1,
-0.05512853, -1.179204, -2.740192, 1, 1, 1, 1, 1,
-0.04797329, 0.4418191, 1.698855, 1, 1, 1, 1, 1,
-0.04589555, -1.55622, -2.46158, 1, 1, 1, 1, 1,
-0.04313563, 0.2944917, -0.2166089, 1, 1, 1, 1, 1,
-0.04074007, -1.097398, -2.482756, 0, 0, 1, 1, 1,
-0.03903173, -1.240258, -2.819493, 1, 0, 0, 1, 1,
-0.03889041, 1.958914, 1.739885, 1, 0, 0, 1, 1,
-0.03042015, -0.9913867, -1.655703, 1, 0, 0, 1, 1,
-0.02840018, -0.5055329, -3.420499, 1, 0, 0, 1, 1,
-0.02740024, -0.6787054, -1.583727, 1, 0, 0, 1, 1,
-0.02661867, -0.4328533, -2.541888, 0, 0, 0, 1, 1,
-0.0242849, 1.098189, 0.295209, 0, 0, 0, 1, 1,
-0.02412023, -0.9010864, -1.842017, 0, 0, 0, 1, 1,
-0.02384458, 0.8808601, 0.6771068, 0, 0, 0, 1, 1,
-0.02159821, 1.785205, -0.3125527, 0, 0, 0, 1, 1,
-0.01819077, -0.7860405, -3.517403, 0, 0, 0, 1, 1,
-0.01566303, -1.13281, -3.467675, 0, 0, 0, 1, 1,
-0.01447727, 0.3155845, -1.696575, 1, 1, 1, 1, 1,
-0.01392589, 0.4667211, 0.8528075, 1, 1, 1, 1, 1,
-0.01157091, 0.8790749, 1.228758, 1, 1, 1, 1, 1,
-0.006123415, 0.3972478, 2.59079, 1, 1, 1, 1, 1,
-0.004868468, -1.609252, -3.453641, 1, 1, 1, 1, 1,
-0.004390484, 1.366673, 0.5701228, 1, 1, 1, 1, 1,
-0.002675478, -0.8656132, -2.581856, 1, 1, 1, 1, 1,
-0.0004678002, -1.375595, -2.678444, 1, 1, 1, 1, 1,
0.003746101, 0.9143047, 0.201818, 1, 1, 1, 1, 1,
0.01057454, 0.08611835, 0.1512953, 1, 1, 1, 1, 1,
0.01075502, 0.05779672, 0.3267949, 1, 1, 1, 1, 1,
0.01193245, -0.007178396, 4.113554, 1, 1, 1, 1, 1,
0.01315667, -0.2072749, 2.737553, 1, 1, 1, 1, 1,
0.0143265, 0.4147763, -0.01309365, 1, 1, 1, 1, 1,
0.01504336, -0.7333289, 3.51195, 1, 1, 1, 1, 1,
0.0160546, -0.2941255, 3.170974, 0, 0, 1, 1, 1,
0.01755887, -0.1068548, 2.098639, 1, 0, 0, 1, 1,
0.01787249, 0.02772115, 1.024387, 1, 0, 0, 1, 1,
0.01848065, -0.3931355, 3.064543, 1, 0, 0, 1, 1,
0.02171192, -1.56548, 1.298378, 1, 0, 0, 1, 1,
0.02600266, -0.2841761, 4.000014, 1, 0, 0, 1, 1,
0.03329872, 1.984391, -0.9724642, 0, 0, 0, 1, 1,
0.03561183, -0.4673988, 1.940983, 0, 0, 0, 1, 1,
0.03882829, -1.229031, 2.209922, 0, 0, 0, 1, 1,
0.0389734, 2.3121, 0.5768673, 0, 0, 0, 1, 1,
0.04126682, 0.8003817, 1.245241, 0, 0, 0, 1, 1,
0.04591877, 0.3890916, 0.9295442, 0, 0, 0, 1, 1,
0.04617487, -0.2950865, 3.593522, 0, 0, 0, 1, 1,
0.04693562, 0.2268023, -0.1619682, 1, 1, 1, 1, 1,
0.04807443, 0.1802016, 0.1575347, 1, 1, 1, 1, 1,
0.04900235, 1.154548, 0.6550086, 1, 1, 1, 1, 1,
0.04902131, 2.155067, -0.5541862, 1, 1, 1, 1, 1,
0.05076235, 1.001286, 0.02933192, 1, 1, 1, 1, 1,
0.05864001, -0.5641035, 1.400702, 1, 1, 1, 1, 1,
0.06032649, -0.8487037, 3.34718, 1, 1, 1, 1, 1,
0.06216468, 0.06512896, 2.42305, 1, 1, 1, 1, 1,
0.06296092, -0.6024547, 3.062089, 1, 1, 1, 1, 1,
0.06734514, -1.98562, 3.568738, 1, 1, 1, 1, 1,
0.07060862, 0.3867953, 0.6562623, 1, 1, 1, 1, 1,
0.07084355, 0.9250377, -0.3789208, 1, 1, 1, 1, 1,
0.07218985, 0.8398221, 0.9928163, 1, 1, 1, 1, 1,
0.07373884, 0.7112094, -1.178583, 1, 1, 1, 1, 1,
0.07591054, -0.9017227, 1.943989, 1, 1, 1, 1, 1,
0.07787719, -1.244838, 3.041993, 0, 0, 1, 1, 1,
0.08249795, -0.3389581, 1.655559, 1, 0, 0, 1, 1,
0.08291581, 1.828413, -0.6776804, 1, 0, 0, 1, 1,
0.08990552, 0.1180632, 1.27271, 1, 0, 0, 1, 1,
0.09479155, 0.08010523, -0.06113845, 1, 0, 0, 1, 1,
0.09733811, -0.5878151, 2.659127, 1, 0, 0, 1, 1,
0.09739996, -2.214547, 1.777097, 0, 0, 0, 1, 1,
0.0989337, -1.093538, 2.888495, 0, 0, 0, 1, 1,
0.10152, -1.940133, 2.983278, 0, 0, 0, 1, 1,
0.1017362, -1.041646, 2.425146, 0, 0, 0, 1, 1,
0.102093, -0.07354929, 1.498727, 0, 0, 0, 1, 1,
0.1021385, -0.9591117, 4.169789, 0, 0, 0, 1, 1,
0.1114843, 0.4707395, 1.162309, 0, 0, 0, 1, 1,
0.1129699, -0.2743329, 2.340067, 1, 1, 1, 1, 1,
0.115723, -0.8548867, 2.33888, 1, 1, 1, 1, 1,
0.118826, -1.535415, 1.884522, 1, 1, 1, 1, 1,
0.121079, -0.886507, 3.68035, 1, 1, 1, 1, 1,
0.12687, 0.09185822, -0.6356582, 1, 1, 1, 1, 1,
0.1272136, 0.06974389, 2.599696, 1, 1, 1, 1, 1,
0.129162, 0.2881368, -2.324101, 1, 1, 1, 1, 1,
0.1302659, 0.4248294, -1.083082, 1, 1, 1, 1, 1,
0.1335677, -0.2276462, 4.240458, 1, 1, 1, 1, 1,
0.1336959, 0.7828074, -0.991711, 1, 1, 1, 1, 1,
0.1416188, -0.508361, 2.090364, 1, 1, 1, 1, 1,
0.1472449, 0.4814847, 2.285285, 1, 1, 1, 1, 1,
0.14763, 0.1515101, 0.6702054, 1, 1, 1, 1, 1,
0.1503616, -0.9340059, 2.033968, 1, 1, 1, 1, 1,
0.1539529, -0.8708855, 2.004082, 1, 1, 1, 1, 1,
0.1570808, 0.8007016, 0.9459284, 0, 0, 1, 1, 1,
0.166605, 0.9169382, -0.6425005, 1, 0, 0, 1, 1,
0.1681186, -0.827604, 4.206344, 1, 0, 0, 1, 1,
0.1683329, -0.5164735, 2.777305, 1, 0, 0, 1, 1,
0.1696552, -1.719678, 4.711654, 1, 0, 0, 1, 1,
0.1700497, 0.1000321, 1.280422, 1, 0, 0, 1, 1,
0.1799819, -1.1845, 2.307342, 0, 0, 0, 1, 1,
0.1850093, -0.8594251, 3.100453, 0, 0, 0, 1, 1,
0.1874212, -0.04259739, 0.7720123, 0, 0, 0, 1, 1,
0.1875162, 0.5201219, -0.5810935, 0, 0, 0, 1, 1,
0.1901473, 1.398063, -0.1284718, 0, 0, 0, 1, 1,
0.1919236, -1.205321, 2.601578, 0, 0, 0, 1, 1,
0.1966448, 0.8043126, -0.8977075, 0, 0, 0, 1, 1,
0.2034514, 0.6906518, 1.055924, 1, 1, 1, 1, 1,
0.206415, -1.25296, 2.497963, 1, 1, 1, 1, 1,
0.2082849, 0.5161192, -0.3178672, 1, 1, 1, 1, 1,
0.2112797, -0.6346076, 0.9225673, 1, 1, 1, 1, 1,
0.2142877, -0.9464512, 3.04935, 1, 1, 1, 1, 1,
0.2148421, -1.459654, 2.752815, 1, 1, 1, 1, 1,
0.2174333, 0.2486243, 0.5492571, 1, 1, 1, 1, 1,
0.2264696, -0.1075588, 2.786461, 1, 1, 1, 1, 1,
0.2311023, -1.075327, 1.486323, 1, 1, 1, 1, 1,
0.2312234, 2.371736, 0.3650242, 1, 1, 1, 1, 1,
0.2375224, -0.2963099, 2.425659, 1, 1, 1, 1, 1,
0.2439367, 0.8428536, -1.386603, 1, 1, 1, 1, 1,
0.2443123, 0.2187226, 1.191303, 1, 1, 1, 1, 1,
0.2466571, 0.5247673, 0.8198147, 1, 1, 1, 1, 1,
0.2522938, 0.2894309, 1.376653, 1, 1, 1, 1, 1,
0.2528287, -1.865287, 3.137993, 0, 0, 1, 1, 1,
0.2536063, -0.7530611, 2.144795, 1, 0, 0, 1, 1,
0.2545972, 0.5423169, -1.097526, 1, 0, 0, 1, 1,
0.2550159, 0.002134259, 3.927563, 1, 0, 0, 1, 1,
0.2567912, 0.6068084, -0.2013077, 1, 0, 0, 1, 1,
0.25792, -0.2946335, 1.837363, 1, 0, 0, 1, 1,
0.2583112, -0.3946225, 1.510602, 0, 0, 0, 1, 1,
0.2633599, -1.108541, 4.365379, 0, 0, 0, 1, 1,
0.2647305, -0.007170753, 1.550096, 0, 0, 0, 1, 1,
0.2693923, -0.8969269, 2.829712, 0, 0, 0, 1, 1,
0.2695873, 0.369155, 1.914152, 0, 0, 0, 1, 1,
0.2777733, -0.3533719, 1.836502, 0, 0, 0, 1, 1,
0.2779945, -0.7054971, 3.080592, 0, 0, 0, 1, 1,
0.2798413, 0.6925846, 0.353018, 1, 1, 1, 1, 1,
0.2901154, -0.3478205, 3.380892, 1, 1, 1, 1, 1,
0.2906412, 0.8859472, 0.01558932, 1, 1, 1, 1, 1,
0.2960624, 1.307005, 1.123343, 1, 1, 1, 1, 1,
0.2966965, -0.6181065, 2.192495, 1, 1, 1, 1, 1,
0.3053963, 2.045907, -0.7255756, 1, 1, 1, 1, 1,
0.3093998, 2.998751, 0.7795282, 1, 1, 1, 1, 1,
0.3225141, -0.1386645, 0.8142343, 1, 1, 1, 1, 1,
0.3249305, -0.2505487, 2.741554, 1, 1, 1, 1, 1,
0.3260235, 0.6362359, 2.944581, 1, 1, 1, 1, 1,
0.3267742, -1.494642, 3.571887, 1, 1, 1, 1, 1,
0.3268371, -1.735893, 3.187382, 1, 1, 1, 1, 1,
0.3315558, -1.088353, 3.073794, 1, 1, 1, 1, 1,
0.3323473, 0.3705039, 1.739159, 1, 1, 1, 1, 1,
0.33735, -1.785742, 4.117614, 1, 1, 1, 1, 1,
0.3395281, -0.4644464, 2.808992, 0, 0, 1, 1, 1,
0.3448029, 0.4313575, 2.497542, 1, 0, 0, 1, 1,
0.3471377, -0.6104633, 2.815407, 1, 0, 0, 1, 1,
0.3482907, -2.21795, 2.764094, 1, 0, 0, 1, 1,
0.349776, -0.6623446, 2.43932, 1, 0, 0, 1, 1,
0.3500759, 1.542693, 0.8602216, 1, 0, 0, 1, 1,
0.3526879, -0.5507497, 2.65212, 0, 0, 0, 1, 1,
0.354936, 0.3779382, 0.2360435, 0, 0, 0, 1, 1,
0.3550325, -1.36955, 2.684168, 0, 0, 0, 1, 1,
0.3552366, 0.7717193, -1.440483, 0, 0, 0, 1, 1,
0.3552509, -0.2521201, 1.727203, 0, 0, 0, 1, 1,
0.3564999, -1.072058, 2.973467, 0, 0, 0, 1, 1,
0.3576533, 0.1184182, 1.386291, 0, 0, 0, 1, 1,
0.3587323, 0.4728669, -0.6357563, 1, 1, 1, 1, 1,
0.3635035, -3.120168, 2.317315, 1, 1, 1, 1, 1,
0.3654315, 2.151233, 0.380314, 1, 1, 1, 1, 1,
0.3657501, -0.07586603, 2.801408, 1, 1, 1, 1, 1,
0.3674711, 0.4234866, 1.869245, 1, 1, 1, 1, 1,
0.3678209, 0.6530215, -1.200234, 1, 1, 1, 1, 1,
0.3726218, 0.6846958, 2.025757, 1, 1, 1, 1, 1,
0.3809281, 0.567693, 0.2516113, 1, 1, 1, 1, 1,
0.3820946, 0.819038, 1.331705, 1, 1, 1, 1, 1,
0.3824396, -0.9147614, 5.553795, 1, 1, 1, 1, 1,
0.3834498, -1.0296, 3.421789, 1, 1, 1, 1, 1,
0.3842942, 1.449271, -0.2465146, 1, 1, 1, 1, 1,
0.3868024, 0.9368873, 2.847333, 1, 1, 1, 1, 1,
0.3909162, 2.821081, -0.6341996, 1, 1, 1, 1, 1,
0.3986842, -0.9097081, 2.784123, 1, 1, 1, 1, 1,
0.4032597, -0.5048657, 2.931359, 0, 0, 1, 1, 1,
0.4060831, -0.8533399, 1.985476, 1, 0, 0, 1, 1,
0.4069527, -0.9543085, 3.453086, 1, 0, 0, 1, 1,
0.4098272, -0.004092031, 0.5783052, 1, 0, 0, 1, 1,
0.4114051, -1.749972, 3.385692, 1, 0, 0, 1, 1,
0.4124553, 0.3689613, 0.5596487, 1, 0, 0, 1, 1,
0.4137824, 0.2387666, 2.2049, 0, 0, 0, 1, 1,
0.41425, 0.2290216, 1.019856, 0, 0, 0, 1, 1,
0.4163916, -0.4224873, 1.882932, 0, 0, 0, 1, 1,
0.4215861, -0.1475896, 2.859283, 0, 0, 0, 1, 1,
0.4253587, -1.022208, 3.024684, 0, 0, 0, 1, 1,
0.4277072, -1.48982, 2.804652, 0, 0, 0, 1, 1,
0.4315459, -0.6771347, 3.365985, 0, 0, 0, 1, 1,
0.4318317, -1.014819, 2.969342, 1, 1, 1, 1, 1,
0.4319794, 1.775046, -0.4445685, 1, 1, 1, 1, 1,
0.4494537, -1.076456, 2.277438, 1, 1, 1, 1, 1,
0.4511832, -0.2387696, 1.642449, 1, 1, 1, 1, 1,
0.4514737, -0.8831776, 2.354028, 1, 1, 1, 1, 1,
0.4563127, -0.3975039, 2.417049, 1, 1, 1, 1, 1,
0.4601148, -1.155526, 2.186608, 1, 1, 1, 1, 1,
0.4675008, 1.507785, -0.3004565, 1, 1, 1, 1, 1,
0.4730305, -0.4586485, 1.1089, 1, 1, 1, 1, 1,
0.4782135, -1.441092, 3.224531, 1, 1, 1, 1, 1,
0.4792629, 1.505906, 2.330551, 1, 1, 1, 1, 1,
0.4805939, 0.6031464, 1.008317, 1, 1, 1, 1, 1,
0.4880577, -2.500668, 3.839129, 1, 1, 1, 1, 1,
0.4929491, -2.07669, 2.601477, 1, 1, 1, 1, 1,
0.494868, 0.3828644, -0.1718201, 1, 1, 1, 1, 1,
0.4952806, -0.6857309, 4.350118, 0, 0, 1, 1, 1,
0.5010151, -0.804653, 1.515391, 1, 0, 0, 1, 1,
0.5027379, 1.402845, 2.225833, 1, 0, 0, 1, 1,
0.503162, 1.316941, 1.83167, 1, 0, 0, 1, 1,
0.505138, -1.215585, 2.381158, 1, 0, 0, 1, 1,
0.5062805, 0.2903596, 2.370746, 1, 0, 0, 1, 1,
0.5147038, 1.229264, 0.04112102, 0, 0, 0, 1, 1,
0.5191566, -1.387524, 4.427286, 0, 0, 0, 1, 1,
0.5201337, -1.093001, 2.704533, 0, 0, 0, 1, 1,
0.5218877, 0.08504956, 1.52992, 0, 0, 0, 1, 1,
0.522823, -0.4738031, 1.716398, 0, 0, 0, 1, 1,
0.5257878, -0.1712721, 2.724525, 0, 0, 0, 1, 1,
0.5258034, -0.9673574, 0.6509045, 0, 0, 0, 1, 1,
0.5317677, 0.80343, 1.025963, 1, 1, 1, 1, 1,
0.5348272, -2.616245, 4.308464, 1, 1, 1, 1, 1,
0.5457762, -0.286059, 1.232881, 1, 1, 1, 1, 1,
0.5464205, 0.6197615, 1.593047, 1, 1, 1, 1, 1,
0.549875, -0.1208034, 1.384037, 1, 1, 1, 1, 1,
0.5502957, -0.1494247, 2.730278, 1, 1, 1, 1, 1,
0.5507492, -0.5220512, 4.021187, 1, 1, 1, 1, 1,
0.5526828, -0.6774469, 4.474647, 1, 1, 1, 1, 1,
0.5534847, -0.3647977, 3.550262, 1, 1, 1, 1, 1,
0.5543638, -0.07254691, 1.329669, 1, 1, 1, 1, 1,
0.5586628, -1.077092, 1.964863, 1, 1, 1, 1, 1,
0.5604874, -0.3675407, 2.440389, 1, 1, 1, 1, 1,
0.5650912, 0.2399129, 1.77312, 1, 1, 1, 1, 1,
0.5651901, -0.9313088, 2.719101, 1, 1, 1, 1, 1,
0.5677913, -0.7441186, 1.821609, 1, 1, 1, 1, 1,
0.5689141, -2.479064, 4.092541, 0, 0, 1, 1, 1,
0.5717106, 0.3720379, 1.441435, 1, 0, 0, 1, 1,
0.5758268, 0.484345, 0.2639447, 1, 0, 0, 1, 1,
0.5758832, -1.052948, 2.557302, 1, 0, 0, 1, 1,
0.5760176, 2.052858, 0.1864626, 1, 0, 0, 1, 1,
0.5817656, -0.3755217, 1.728596, 1, 0, 0, 1, 1,
0.5861588, -1.718606, 3.956703, 0, 0, 0, 1, 1,
0.5873411, -0.5826846, 2.60263, 0, 0, 0, 1, 1,
0.5887308, 0.05865767, 1.350635, 0, 0, 0, 1, 1,
0.5890635, -1.26067, 2.80153, 0, 0, 0, 1, 1,
0.5935648, 0.9041933, 0.8689681, 0, 0, 0, 1, 1,
0.5973563, 1.5418, -0.6085522, 0, 0, 0, 1, 1,
0.6028579, 0.4570786, 0.9172659, 0, 0, 0, 1, 1,
0.6045712, -2.575555, 3.632733, 1, 1, 1, 1, 1,
0.6084415, 1.601437, 0.4923143, 1, 1, 1, 1, 1,
0.615428, 0.1869017, 0.856339, 1, 1, 1, 1, 1,
0.6157015, 0.5035235, 0.2809328, 1, 1, 1, 1, 1,
0.6176167, -1.457023, 2.300193, 1, 1, 1, 1, 1,
0.6190903, -0.09485821, 2.080484, 1, 1, 1, 1, 1,
0.6204044, 0.1960334, 0.442905, 1, 1, 1, 1, 1,
0.6276231, -0.8779593, 0.9837978, 1, 1, 1, 1, 1,
0.6357128, 0.857032, 0.3503399, 1, 1, 1, 1, 1,
0.6410185, 0.765818, 0.9634621, 1, 1, 1, 1, 1,
0.6459414, -0.4283807, 3.328546, 1, 1, 1, 1, 1,
0.648997, 0.1820457, 1.845922, 1, 1, 1, 1, 1,
0.6506945, 0.1288285, 1.14698, 1, 1, 1, 1, 1,
0.6550134, 0.7278784, 0.4624648, 1, 1, 1, 1, 1,
0.6585131, -0.5220554, 0.9846998, 1, 1, 1, 1, 1,
0.659266, -0.7791937, 3.123257, 0, 0, 1, 1, 1,
0.6613007, 0.4450224, 0.9640285, 1, 0, 0, 1, 1,
0.6661456, 0.1367333, -0.1146284, 1, 0, 0, 1, 1,
0.6679833, 0.4019528, 0.2846361, 1, 0, 0, 1, 1,
0.6725231, -0.6484022, 2.577036, 1, 0, 0, 1, 1,
0.6746968, 0.1718713, 0.4044195, 1, 0, 0, 1, 1,
0.6761996, 0.1469947, 2.017805, 0, 0, 0, 1, 1,
0.6780884, 1.296712, 0.1113045, 0, 0, 0, 1, 1,
0.6798764, 0.7655362, 1.502761, 0, 0, 0, 1, 1,
0.6828388, 0.6789559, -0.2286942, 0, 0, 0, 1, 1,
0.6900103, 0.9821997, 0.09154961, 0, 0, 0, 1, 1,
0.6903414, 1.128751, 2.057715, 0, 0, 0, 1, 1,
0.6925959, -0.08745939, 2.299709, 0, 0, 0, 1, 1,
0.6976744, 2.432827, -0.3730315, 1, 1, 1, 1, 1,
0.6980962, 0.8479709, -0.6105423, 1, 1, 1, 1, 1,
0.6987616, 0.8471521, 0.5489563, 1, 1, 1, 1, 1,
0.7008897, -1.627461, 3.595887, 1, 1, 1, 1, 1,
0.7025911, 0.3504219, 1.092404, 1, 1, 1, 1, 1,
0.7073041, -1.209143, 1.434077, 1, 1, 1, 1, 1,
0.7077748, 0.6256921, 1.457152, 1, 1, 1, 1, 1,
0.7090939, -1.27287, 1.808124, 1, 1, 1, 1, 1,
0.7097825, 0.4108109, 1.426663, 1, 1, 1, 1, 1,
0.7108644, -0.2156904, 2.344925, 1, 1, 1, 1, 1,
0.7146265, -0.0740307, 1.721344, 1, 1, 1, 1, 1,
0.7151033, 0.4344333, 1.344665, 1, 1, 1, 1, 1,
0.726061, 0.1236001, -1.125228, 1, 1, 1, 1, 1,
0.7275435, 0.2442988, 1.589048, 1, 1, 1, 1, 1,
0.7295418, 0.435264, 2.599194, 1, 1, 1, 1, 1,
0.7320037, 0.1321068, 2.473427, 0, 0, 1, 1, 1,
0.734911, -1.132407, 3.460492, 1, 0, 0, 1, 1,
0.7353005, 0.9726282, 1.290814, 1, 0, 0, 1, 1,
0.7359135, 0.5207053, 0.8780229, 1, 0, 0, 1, 1,
0.7388421, 0.564612, 0.6840309, 1, 0, 0, 1, 1,
0.7418768, -0.712407, 4.024726, 1, 0, 0, 1, 1,
0.7423628, -0.6214414, 2.620467, 0, 0, 0, 1, 1,
0.7470937, 0.9885971, 1.644386, 0, 0, 0, 1, 1,
0.7491205, 0.4155493, 1.921204, 0, 0, 0, 1, 1,
0.74942, -2.269815, 4.236513, 0, 0, 0, 1, 1,
0.7502657, -1.357185, 2.972802, 0, 0, 0, 1, 1,
0.752132, -0.9678484, 1.792338, 0, 0, 0, 1, 1,
0.7548144, 0.3028671, 2.745279, 0, 0, 0, 1, 1,
0.7571684, 0.8016663, 1.172194, 1, 1, 1, 1, 1,
0.7675784, 1.88886, 0.281197, 1, 1, 1, 1, 1,
0.7678421, 1.722898, -0.8238678, 1, 1, 1, 1, 1,
0.7682213, 0.4287976, 1.139712, 1, 1, 1, 1, 1,
0.7690533, -1.155754, 2.501178, 1, 1, 1, 1, 1,
0.7700644, -1.708054, 3.257686, 1, 1, 1, 1, 1,
0.773122, 0.8193377, 2.146396, 1, 1, 1, 1, 1,
0.7754281, 1.590661, 1.698753, 1, 1, 1, 1, 1,
0.7779945, 1.527808, -0.2874236, 1, 1, 1, 1, 1,
0.7787778, 1.402297, 0.2654319, 1, 1, 1, 1, 1,
0.7792074, 1.355809, -1.206918, 1, 1, 1, 1, 1,
0.7803043, 1.399271, 3.012105, 1, 1, 1, 1, 1,
0.7822069, -0.7193272, 2.053533, 1, 1, 1, 1, 1,
0.7861663, 0.4001173, 1.532342, 1, 1, 1, 1, 1,
0.7866139, 2.989268, -0.726016, 1, 1, 1, 1, 1,
0.7915644, 0.4594216, 0.17044, 0, 0, 1, 1, 1,
0.7971882, -0.04246351, 0.9416422, 1, 0, 0, 1, 1,
0.8004318, -1.457794, 3.122815, 1, 0, 0, 1, 1,
0.8162779, -0.1106333, 1.693525, 1, 0, 0, 1, 1,
0.8189927, -1.606159, 4.080561, 1, 0, 0, 1, 1,
0.8209157, 0.6477113, 2.662695, 1, 0, 0, 1, 1,
0.8217365, -0.9675461, 3.627489, 0, 0, 0, 1, 1,
0.8222378, -0.1528229, 2.842395, 0, 0, 0, 1, 1,
0.8234097, -0.01251922, 2.634779, 0, 0, 0, 1, 1,
0.8248466, 0.04143199, 1.064195, 0, 0, 0, 1, 1,
0.8273326, -1.009281, 3.374652, 0, 0, 0, 1, 1,
0.828272, 1.754043, -0.7261859, 0, 0, 0, 1, 1,
0.8299822, 1.229458, -1.000713, 0, 0, 0, 1, 1,
0.8309483, -0.05880715, 1.013688, 1, 1, 1, 1, 1,
0.8311219, -1.908149, 4.270387, 1, 1, 1, 1, 1,
0.8326079, -0.006650899, 2.331871, 1, 1, 1, 1, 1,
0.8342475, 0.2307235, 0.3302526, 1, 1, 1, 1, 1,
0.8357471, 1.142503, 0.5970929, 1, 1, 1, 1, 1,
0.8393135, -0.049613, 1.124603, 1, 1, 1, 1, 1,
0.8432915, -2.347284, 3.125304, 1, 1, 1, 1, 1,
0.8449078, 0.5803029, 2.481603, 1, 1, 1, 1, 1,
0.8469013, -0.3954234, 3.523391, 1, 1, 1, 1, 1,
0.8485137, -1.627846, 4.283741, 1, 1, 1, 1, 1,
0.8500957, -0.7839823, 5.076495, 1, 1, 1, 1, 1,
0.8578836, 1.353695, 0.6977447, 1, 1, 1, 1, 1,
0.8591119, 0.1892657, 0.8220345, 1, 1, 1, 1, 1,
0.8630165, 0.5815847, 0.596566, 1, 1, 1, 1, 1,
0.8638875, 1.124741, 0.8366181, 1, 1, 1, 1, 1,
0.8692762, 0.2701453, 1.743222, 0, 0, 1, 1, 1,
0.8731316, -0.3618109, 2.504778, 1, 0, 0, 1, 1,
0.8815774, 1.114198, -1.220714, 1, 0, 0, 1, 1,
0.8831645, 0.3065985, 0.8211717, 1, 0, 0, 1, 1,
0.883441, -0.523147, 2.186712, 1, 0, 0, 1, 1,
0.8862105, -0.306244, 0.7815253, 1, 0, 0, 1, 1,
0.8894542, -1.925233, 1.509891, 0, 0, 0, 1, 1,
0.8918778, 0.5053806, 0.8342081, 0, 0, 0, 1, 1,
0.8957621, -0.1268452, 2.543028, 0, 0, 0, 1, 1,
0.8986896, 0.308911, 1.366987, 0, 0, 0, 1, 1,
0.8990195, -0.6883272, 2.25259, 0, 0, 0, 1, 1,
0.9044113, 0.5520025, 1.121736, 0, 0, 0, 1, 1,
0.906027, -0.2716365, 2.575103, 0, 0, 0, 1, 1,
0.9061978, -1.304799, 1.145584, 1, 1, 1, 1, 1,
0.9085245, 1.690901, 0.66632, 1, 1, 1, 1, 1,
0.9302393, 0.2310144, 1.808733, 1, 1, 1, 1, 1,
0.9329762, 1.385865, 1.373111, 1, 1, 1, 1, 1,
0.9348968, -0.3845656, 2.1922, 1, 1, 1, 1, 1,
0.9381682, -0.1893578, 2.445653, 1, 1, 1, 1, 1,
0.9398398, -0.1281034, -0.05190289, 1, 1, 1, 1, 1,
0.9425887, 1.12464, 2.252253, 1, 1, 1, 1, 1,
0.9428339, -0.5248901, 0.9203506, 1, 1, 1, 1, 1,
0.9429486, -0.2705881, 1.453603, 1, 1, 1, 1, 1,
0.9503326, -0.4460483, 2.094368, 1, 1, 1, 1, 1,
0.9544173, 0.7002239, 0.4672349, 1, 1, 1, 1, 1,
0.958176, 0.04237443, 2.62189, 1, 1, 1, 1, 1,
0.9665979, 0.3344281, 2.662672, 1, 1, 1, 1, 1,
0.9695371, -0.553911, 1.949608, 1, 1, 1, 1, 1,
0.9854794, -0.6787267, 2.095346, 0, 0, 1, 1, 1,
0.9875522, -0.5300438, 1.656389, 1, 0, 0, 1, 1,
0.9885315, -0.9662672, 2.732371, 1, 0, 0, 1, 1,
0.9967127, 1.022269, 1.448388, 1, 0, 0, 1, 1,
0.9994752, -0.07510889, 1.435788, 1, 0, 0, 1, 1,
1.005176, 0.4988917, 2.507358, 1, 0, 0, 1, 1,
1.00544, -0.1408381, 0.9633496, 0, 0, 0, 1, 1,
1.005615, 0.3119943, 0.2755312, 0, 0, 0, 1, 1,
1.011631, 0.6034689, 2.130047, 0, 0, 0, 1, 1,
1.015833, 0.9039988, -0.07871895, 0, 0, 0, 1, 1,
1.017592, -0.8523344, 3.174292, 0, 0, 0, 1, 1,
1.021273, -0.4814923, 1.452068, 0, 0, 0, 1, 1,
1.023288, 0.2748614, 2.427648, 0, 0, 0, 1, 1,
1.033652, -1.318989, 1.37527, 1, 1, 1, 1, 1,
1.041724, 0.4144156, 2.031125, 1, 1, 1, 1, 1,
1.048349, -0.9255468, 2.891937, 1, 1, 1, 1, 1,
1.048774, 1.135536, -0.2133281, 1, 1, 1, 1, 1,
1.058584, 0.7957629, 1.229144, 1, 1, 1, 1, 1,
1.063712, -1.754785, 1.975229, 1, 1, 1, 1, 1,
1.066218, 0.7009835, 1.348162, 1, 1, 1, 1, 1,
1.068914, 0.72395, 3.089939, 1, 1, 1, 1, 1,
1.076943, 0.1161697, 3.032666, 1, 1, 1, 1, 1,
1.08168, -0.6217864, 2.123374, 1, 1, 1, 1, 1,
1.08688, -0.2872345, 1.513862, 1, 1, 1, 1, 1,
1.094823, 0.3374257, 1.937951, 1, 1, 1, 1, 1,
1.098593, -0.4961698, 1.933438, 1, 1, 1, 1, 1,
1.102733, -1.103758, 0.7069388, 1, 1, 1, 1, 1,
1.106335, 0.5646616, 1.534446, 1, 1, 1, 1, 1,
1.114615, 0.6396597, 1.138969, 0, 0, 1, 1, 1,
1.116156, -0.6491564, 3.159061, 1, 0, 0, 1, 1,
1.117312, -0.1080265, 1.027184, 1, 0, 0, 1, 1,
1.120798, 0.8510805, 2.763226, 1, 0, 0, 1, 1,
1.121493, 0.624708, 0.3697987, 1, 0, 0, 1, 1,
1.128644, -0.2053531, 2.183891, 1, 0, 0, 1, 1,
1.133896, -0.313949, 2.576553, 0, 0, 0, 1, 1,
1.138035, -1.0583, 1.615365, 0, 0, 0, 1, 1,
1.140721, 0.8686679, 0.3673131, 0, 0, 0, 1, 1,
1.151516, -0.8059212, 0.2361814, 0, 0, 0, 1, 1,
1.155585, -0.4738034, 1.16516, 0, 0, 0, 1, 1,
1.164205, 0.4147806, 4.15897, 0, 0, 0, 1, 1,
1.168832, 0.06949555, 1.024047, 0, 0, 0, 1, 1,
1.172446, 0.5013773, 1.439486, 1, 1, 1, 1, 1,
1.172947, 1.152786, -0.9683051, 1, 1, 1, 1, 1,
1.176721, 0.8149213, 0.4923673, 1, 1, 1, 1, 1,
1.178498, 1.731494, -0.2318501, 1, 1, 1, 1, 1,
1.180762, -0.7165542, 2.134091, 1, 1, 1, 1, 1,
1.181018, -0.2165845, 4.082161, 1, 1, 1, 1, 1,
1.190714, -0.1819992, 1.609442, 1, 1, 1, 1, 1,
1.191363, 2.718293, 0.9803445, 1, 1, 1, 1, 1,
1.195233, 0.2359743, 3.591844, 1, 1, 1, 1, 1,
1.206298, 0.2506649, 0.9890534, 1, 1, 1, 1, 1,
1.210183, -1.390303, 3.750229, 1, 1, 1, 1, 1,
1.223028, 0.0569978, 2.963251, 1, 1, 1, 1, 1,
1.22997, -0.4170916, 1.171333, 1, 1, 1, 1, 1,
1.231234, 0.1151742, 1.601609, 1, 1, 1, 1, 1,
1.233276, -0.03082431, -1.024191, 1, 1, 1, 1, 1,
1.238058, -2.193265, 3.443274, 0, 0, 1, 1, 1,
1.266711, 1.368859, 0.17375, 1, 0, 0, 1, 1,
1.273073, 0.7500184, 0.7730273, 1, 0, 0, 1, 1,
1.298622, -1.200118, 4.206727, 1, 0, 0, 1, 1,
1.315591, -0.6622527, 2.394745, 1, 0, 0, 1, 1,
1.316201, -0.2402518, 2.413201, 1, 0, 0, 1, 1,
1.324543, 0.9516084, 0.5075396, 0, 0, 0, 1, 1,
1.324989, 0.03152181, -0.06118576, 0, 0, 0, 1, 1,
1.337151, 0.07089604, 1.474698, 0, 0, 0, 1, 1,
1.339424, -0.3973156, 2.764119, 0, 0, 0, 1, 1,
1.345718, -0.3252737, 1.264351, 0, 0, 0, 1, 1,
1.347513, 1.88595, -0.1748665, 0, 0, 0, 1, 1,
1.355104, -0.003667517, 1.941471, 0, 0, 0, 1, 1,
1.358066, 1.399852, 1.181762, 1, 1, 1, 1, 1,
1.361285, 0.5098393, 2.63187, 1, 1, 1, 1, 1,
1.364818, 1.656797, 2.635214, 1, 1, 1, 1, 1,
1.374551, 0.5758013, 0.6776775, 1, 1, 1, 1, 1,
1.375385, -0.2482001, 0.6966987, 1, 1, 1, 1, 1,
1.381073, -0.9889947, 2.975929, 1, 1, 1, 1, 1,
1.406968, -0.9486949, 4.851938, 1, 1, 1, 1, 1,
1.409364, -0.5625927, 3.465071, 1, 1, 1, 1, 1,
1.415953, -0.8362597, 2.826393, 1, 1, 1, 1, 1,
1.42222, -0.8201137, 1.972702, 1, 1, 1, 1, 1,
1.426754, -2.216957, 3.047513, 1, 1, 1, 1, 1,
1.440795, -0.2888937, 2.008852, 1, 1, 1, 1, 1,
1.450207, 1.262195, 1.251433, 1, 1, 1, 1, 1,
1.459831, -1.204523, 2.231006, 1, 1, 1, 1, 1,
1.460807, -1.716321, 0.8845647, 1, 1, 1, 1, 1,
1.470694, -0.5459226, 1.903911, 0, 0, 1, 1, 1,
1.475723, -0.283985, 1.487958, 1, 0, 0, 1, 1,
1.48075, -0.5419371, 2.640107, 1, 0, 0, 1, 1,
1.482055, 1.516045, 0.1885148, 1, 0, 0, 1, 1,
1.482446, 1.101078, 1.984983, 1, 0, 0, 1, 1,
1.485782, 0.6287948, 0.6363912, 1, 0, 0, 1, 1,
1.486462, 1.738976, -0.2454639, 0, 0, 0, 1, 1,
1.488483, -0.5124213, 0.3687929, 0, 0, 0, 1, 1,
1.490199, -1.308088, 0.8738281, 0, 0, 0, 1, 1,
1.490775, -1.114029, 1.892646, 0, 0, 0, 1, 1,
1.492104, 1.61248, 1.144127, 0, 0, 0, 1, 1,
1.497871, 0.7266375, 0.4376973, 0, 0, 0, 1, 1,
1.506154, -0.001804497, 2.016932, 0, 0, 0, 1, 1,
1.52024, 1.185813, -0.360139, 1, 1, 1, 1, 1,
1.520377, -1.209198, 2.226978, 1, 1, 1, 1, 1,
1.524619, 1.505622, 0.9684735, 1, 1, 1, 1, 1,
1.538801, 0.5110123, 0.5158622, 1, 1, 1, 1, 1,
1.539757, -2.205156, 0.7879241, 1, 1, 1, 1, 1,
1.541207, -0.08353432, 1.49905, 1, 1, 1, 1, 1,
1.55811, -0.7414395, 3.19054, 1, 1, 1, 1, 1,
1.564879, -0.1069153, 2.210613, 1, 1, 1, 1, 1,
1.578676, -0.6417968, 2.006999, 1, 1, 1, 1, 1,
1.57915, -0.1817971, 1.669745, 1, 1, 1, 1, 1,
1.590575, -0.9001759, 2.489918, 1, 1, 1, 1, 1,
1.613279, -0.4148035, 1.269258, 1, 1, 1, 1, 1,
1.615906, 2.151025, -0.311769, 1, 1, 1, 1, 1,
1.616989, 0.2175758, 2.191983, 1, 1, 1, 1, 1,
1.61877, -1.105727, 2.585848, 1, 1, 1, 1, 1,
1.622345, -0.3918121, 0.3015293, 0, 0, 1, 1, 1,
1.637592, -1.236505, 1.006576, 1, 0, 0, 1, 1,
1.63998, 1.917285, 1.056508, 1, 0, 0, 1, 1,
1.640544, -0.1504004, 1.023784, 1, 0, 0, 1, 1,
1.673326, -0.6042935, -0.6203308, 1, 0, 0, 1, 1,
1.678511, 2.122993, -0.848184, 1, 0, 0, 1, 1,
1.680586, -0.1633303, 2.828403, 0, 0, 0, 1, 1,
1.698905, 0.4270678, -0.3375048, 0, 0, 0, 1, 1,
1.699337, 0.2179803, 1.431603, 0, 0, 0, 1, 1,
1.715457, 0.4873208, 1.238564, 0, 0, 0, 1, 1,
1.734673, 2.032925, 0.1458898, 0, 0, 0, 1, 1,
1.745439, 0.4344307, 1.730291, 0, 0, 0, 1, 1,
1.802115, 0.2909998, 1.014617, 0, 0, 0, 1, 1,
1.812791, -0.7061102, 0.2465127, 1, 1, 1, 1, 1,
1.83372, -1.211054, 2.389096, 1, 1, 1, 1, 1,
1.850737, 0.48985, 1.401537, 1, 1, 1, 1, 1,
1.86812, 0.5490428, 2.395818, 1, 1, 1, 1, 1,
1.878391, 0.08726532, 0.6945421, 1, 1, 1, 1, 1,
1.879711, 0.5369701, 0.7111399, 1, 1, 1, 1, 1,
1.89784, 0.8801352, 1.795269, 1, 1, 1, 1, 1,
1.938998, 1.437893, -1.168783, 1, 1, 1, 1, 1,
1.960367, -0.5448318, 1.877422, 1, 1, 1, 1, 1,
1.962053, -0.8430299, 1.660962, 1, 1, 1, 1, 1,
2.008222, 0.827076, 2.994313, 1, 1, 1, 1, 1,
2.014324, -0.7506591, 2.552841, 1, 1, 1, 1, 1,
2.018545, 0.05708624, 1.087021, 1, 1, 1, 1, 1,
2.02853, -0.3060213, -0.2970967, 1, 1, 1, 1, 1,
2.051003, -1.609128, 2.231423, 1, 1, 1, 1, 1,
2.071074, 0.1135404, 1.33648, 0, 0, 1, 1, 1,
2.087584, 0.9709084, 0.4764291, 1, 0, 0, 1, 1,
2.088665, 0.05621655, 1.892341, 1, 0, 0, 1, 1,
2.098067, 0.7510696, 2.909721, 1, 0, 0, 1, 1,
2.11414, -0.2063418, 1.607903, 1, 0, 0, 1, 1,
2.140911, 0.1364664, 0.4815488, 1, 0, 0, 1, 1,
2.145699, 1.59108, 2.4579, 0, 0, 0, 1, 1,
2.148418, 0.07837173, 3.614767, 0, 0, 0, 1, 1,
2.155705, 1.862613, 0.09206393, 0, 0, 0, 1, 1,
2.157994, 1.611104, 1.320069, 0, 0, 0, 1, 1,
2.184447, 0.2218576, 1.793787, 0, 0, 0, 1, 1,
2.235344, 0.2487473, 3.090126, 0, 0, 0, 1, 1,
2.303555, -1.08346, 1.794504, 0, 0, 0, 1, 1,
2.31981, 0.158568, 0.05507257, 1, 1, 1, 1, 1,
2.343623, 1.176455, 2.283828, 1, 1, 1, 1, 1,
2.383069, -0.8247068, 1.962247, 1, 1, 1, 1, 1,
2.408186, -0.02652355, 2.344116, 1, 1, 1, 1, 1,
2.450668, 0.9266613, 0.9662446, 1, 1, 1, 1, 1,
2.624747, -0.7525908, 1.811956, 1, 1, 1, 1, 1,
2.829651, 0.574758, 2.128903, 1, 1, 1, 1, 1
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
var radius = 9.270573;
var distance = 32.56249;
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
mvMatrix.translate( 0.137278, 0.1651425, -0.3931799 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.56249);
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
