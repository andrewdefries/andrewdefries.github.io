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
-3.3833, -0.9592774, -1.55495, 1, 0, 0, 1,
-3.304556, -0.09151469, -0.3765519, 1, 0.007843138, 0, 1,
-3.170559, -2.926484, -2.029555, 1, 0.01176471, 0, 1,
-2.860714, -0.8538616, -1.30859, 1, 0.01960784, 0, 1,
-2.556463, -0.249869, -2.102513, 1, 0.02352941, 0, 1,
-2.530583, -1.224977, -1.978606, 1, 0.03137255, 0, 1,
-2.515452, -0.1127212, -0.1251783, 1, 0.03529412, 0, 1,
-2.474754, 0.9580961, -2.519157, 1, 0.04313726, 0, 1,
-2.457249, 0.7325861, -1.395809, 1, 0.04705882, 0, 1,
-2.43056, 0.5452238, 0.8332899, 1, 0.05490196, 0, 1,
-2.42935, 0.6264902, 0.1285269, 1, 0.05882353, 0, 1,
-2.392715, 2.693323, -0.0455735, 1, 0.06666667, 0, 1,
-2.391593, -1.556243, -1.253735, 1, 0.07058824, 0, 1,
-2.361665, -0.4944682, -0.74357, 1, 0.07843138, 0, 1,
-2.334942, -0.02245514, -0.1502691, 1, 0.08235294, 0, 1,
-2.293479, -0.3041023, -2.548826, 1, 0.09019608, 0, 1,
-2.267242, 0.4187215, -1.485376, 1, 0.09411765, 0, 1,
-2.200683, 0.2733238, -1.088317, 1, 0.1019608, 0, 1,
-2.194777, -0.1854664, -0.8175084, 1, 0.1098039, 0, 1,
-2.158859, 0.1869263, -1.328499, 1, 0.1137255, 0, 1,
-2.097765, -0.1258972, -1.637033, 1, 0.1215686, 0, 1,
-2.044212, -1.885156, -1.948532, 1, 0.1254902, 0, 1,
-2.026591, -1.204816, -2.00975, 1, 0.1333333, 0, 1,
-2.009834, 1.014532, -1.252439, 1, 0.1372549, 0, 1,
-1.994044, 1.225828, 0.441, 1, 0.145098, 0, 1,
-1.983012, -0.5735249, -1.293744, 1, 0.1490196, 0, 1,
-1.954326, 0.3318483, -1.685088, 1, 0.1568628, 0, 1,
-1.946593, -1.299073, -2.406959, 1, 0.1607843, 0, 1,
-1.935676, -1.905986, -1.60089, 1, 0.1686275, 0, 1,
-1.907659, -0.5297312, -2.036923, 1, 0.172549, 0, 1,
-1.880058, -2.439304, -1.657034, 1, 0.1803922, 0, 1,
-1.879165, 1.033654, -0.5418338, 1, 0.1843137, 0, 1,
-1.854613, 1.117933, 0.5406688, 1, 0.1921569, 0, 1,
-1.846846, -1.177701, -1.503212, 1, 0.1960784, 0, 1,
-1.815379, 1.027941, -0.1389306, 1, 0.2039216, 0, 1,
-1.795313, 0.8611234, -0.996942, 1, 0.2117647, 0, 1,
-1.784018, -0.1391116, -1.035204, 1, 0.2156863, 0, 1,
-1.768976, -0.7292055, -1.687917, 1, 0.2235294, 0, 1,
-1.749327, -0.1692313, -0.3775341, 1, 0.227451, 0, 1,
-1.744374, 0.9618345, -1.216136, 1, 0.2352941, 0, 1,
-1.737236, -0.589379, -3.118128, 1, 0.2392157, 0, 1,
-1.724616, 0.8467145, -1.159253, 1, 0.2470588, 0, 1,
-1.717076, 0.7893603, 0.3995306, 1, 0.2509804, 0, 1,
-1.701908, -0.3396562, -0.7091899, 1, 0.2588235, 0, 1,
-1.678554, 0.4497613, -0.4331638, 1, 0.2627451, 0, 1,
-1.675324, 0.9275878, -0.8678694, 1, 0.2705882, 0, 1,
-1.672645, 0.1296341, -2.410419, 1, 0.2745098, 0, 1,
-1.66823, 0.6488907, -0.7630208, 1, 0.282353, 0, 1,
-1.656649, 0.8328627, -1.622152, 1, 0.2862745, 0, 1,
-1.630257, 1.966377, 0.7487239, 1, 0.2941177, 0, 1,
-1.613152, -0.5465636, -1.714355, 1, 0.3019608, 0, 1,
-1.605266, 0.3341397, -2.50097, 1, 0.3058824, 0, 1,
-1.604571, -0.5829148, -1.404007, 1, 0.3137255, 0, 1,
-1.603204, 0.07888547, -0.5875214, 1, 0.3176471, 0, 1,
-1.596348, 0.5866673, -4.216506, 1, 0.3254902, 0, 1,
-1.59206, 0.2259055, -2.262653, 1, 0.3294118, 0, 1,
-1.584165, 0.7876236, -0.01115459, 1, 0.3372549, 0, 1,
-1.576919, -0.9282404, -0.07147988, 1, 0.3411765, 0, 1,
-1.57141, 1.185058, -0.1304157, 1, 0.3490196, 0, 1,
-1.571138, -1.525743, -1.47867, 1, 0.3529412, 0, 1,
-1.555549, 0.3482516, -1.647243, 1, 0.3607843, 0, 1,
-1.550799, -0.1717808, -2.332685, 1, 0.3647059, 0, 1,
-1.548519, 1.443861, -0.6452786, 1, 0.372549, 0, 1,
-1.547644, -1.796907, -2.27886, 1, 0.3764706, 0, 1,
-1.543446, -2.583816, -3.314328, 1, 0.3843137, 0, 1,
-1.537685, 1.383121, -2.462474, 1, 0.3882353, 0, 1,
-1.528185, -1.020502, -0.9816434, 1, 0.3960784, 0, 1,
-1.527328, 0.4148575, -1.594808, 1, 0.4039216, 0, 1,
-1.500046, 1.407762, -1.420137, 1, 0.4078431, 0, 1,
-1.496878, 1.22709, 0.2906158, 1, 0.4156863, 0, 1,
-1.491874, 1.238803, -0.3196791, 1, 0.4196078, 0, 1,
-1.485235, 0.546394, -1.520612, 1, 0.427451, 0, 1,
-1.477601, 0.7010806, -0.009056751, 1, 0.4313726, 0, 1,
-1.47051, -1.691726, -1.544434, 1, 0.4392157, 0, 1,
-1.46388, -1.854791, -3.45389, 1, 0.4431373, 0, 1,
-1.463634, 1.083572, -0.01213543, 1, 0.4509804, 0, 1,
-1.460924, 1.492568, -1.419381, 1, 0.454902, 0, 1,
-1.458612, -0.6352054, -1.338903, 1, 0.4627451, 0, 1,
-1.457422, 0.770345, -0.7863103, 1, 0.4666667, 0, 1,
-1.456665, -0.7441247, 0.1088609, 1, 0.4745098, 0, 1,
-1.439883, 1.551137, 0.2750351, 1, 0.4784314, 0, 1,
-1.439024, -0.5415153, -2.916746, 1, 0.4862745, 0, 1,
-1.433127, 0.8059654, -1.352742, 1, 0.4901961, 0, 1,
-1.429349, 1.384228, -2.336541, 1, 0.4980392, 0, 1,
-1.4244, -0.4206444, -1.889653, 1, 0.5058824, 0, 1,
-1.40983, 0.03198815, -2.727903, 1, 0.509804, 0, 1,
-1.406254, -0.9120209, -2.745442, 1, 0.5176471, 0, 1,
-1.39261, 0.7126467, -0.1015806, 1, 0.5215687, 0, 1,
-1.388619, -0.05848544, -0.8537386, 1, 0.5294118, 0, 1,
-1.382733, -1.401861, -3.509003, 1, 0.5333334, 0, 1,
-1.370865, -0.5592929, -1.792205, 1, 0.5411765, 0, 1,
-1.343621, -1.136065, -1.386194, 1, 0.5450981, 0, 1,
-1.327327, -1.254761, -1.682835, 1, 0.5529412, 0, 1,
-1.321829, 0.6972957, -1.715597, 1, 0.5568628, 0, 1,
-1.319054, 0.1758102, -1.585615, 1, 0.5647059, 0, 1,
-1.317598, -0.4146659, -0.8808632, 1, 0.5686275, 0, 1,
-1.312151, 1.564118, -0.249918, 1, 0.5764706, 0, 1,
-1.311293, -0.9481351, -2.016329, 1, 0.5803922, 0, 1,
-1.305981, -0.01847014, -1.466674, 1, 0.5882353, 0, 1,
-1.304199, 0.04226078, -1.518497, 1, 0.5921569, 0, 1,
-1.298486, 0.1740969, -1.73202, 1, 0.6, 0, 1,
-1.294798, 1.405749, -1.977724, 1, 0.6078432, 0, 1,
-1.286289, 0.223035, -0.3919981, 1, 0.6117647, 0, 1,
-1.279401, -1.027332, -0.003581653, 1, 0.6196079, 0, 1,
-1.275052, -0.1631907, -3.511225, 1, 0.6235294, 0, 1,
-1.269927, 0.5438878, -1.950574, 1, 0.6313726, 0, 1,
-1.259509, -0.0246315, -3.361466, 1, 0.6352941, 0, 1,
-1.255385, 0.5284129, 0.005919293, 1, 0.6431373, 0, 1,
-1.222825, -2.669155, -2.532409, 1, 0.6470588, 0, 1,
-1.222267, -0.5952736, -1.810263, 1, 0.654902, 0, 1,
-1.222053, 0.6322392, -0.3136663, 1, 0.6588235, 0, 1,
-1.210819, -1.000039, -1.730355, 1, 0.6666667, 0, 1,
-1.197661, -0.1746279, -1.065711, 1, 0.6705883, 0, 1,
-1.19632, -0.303452, -0.5879935, 1, 0.6784314, 0, 1,
-1.191071, 0.8759126, -0.5201162, 1, 0.682353, 0, 1,
-1.173618, 2.122146, -2.22822, 1, 0.6901961, 0, 1,
-1.156364, 0.4266832, -1.394025, 1, 0.6941177, 0, 1,
-1.155887, -0.1249323, -3.200705, 1, 0.7019608, 0, 1,
-1.131156, 1.214991, -1.231597, 1, 0.7098039, 0, 1,
-1.130917, -0.9922578, -2.07061, 1, 0.7137255, 0, 1,
-1.125156, -0.6137093, -2.809417, 1, 0.7215686, 0, 1,
-1.118663, -1.592452, -2.858342, 1, 0.7254902, 0, 1,
-1.115243, 0.3109344, -1.636206, 1, 0.7333333, 0, 1,
-1.114002, -0.5464209, -2.500251, 1, 0.7372549, 0, 1,
-1.113549, -0.6238015, -1.59663, 1, 0.7450981, 0, 1,
-1.112676, -0.6203625, -1.269599, 1, 0.7490196, 0, 1,
-1.102416, 0.2763778, 0.2277791, 1, 0.7568628, 0, 1,
-1.096204, -0.05091782, -2.139404, 1, 0.7607843, 0, 1,
-1.093745, 0.3232953, -2.170476, 1, 0.7686275, 0, 1,
-1.082257, 0.8232649, -1.399752, 1, 0.772549, 0, 1,
-1.080989, -0.08081599, -2.026101, 1, 0.7803922, 0, 1,
-1.078584, 0.2164299, -1.805188, 1, 0.7843137, 0, 1,
-1.075741, -1.512676, -2.416484, 1, 0.7921569, 0, 1,
-1.070051, 0.05426301, -0.4273234, 1, 0.7960784, 0, 1,
-1.068467, 0.4306581, -2.014393, 1, 0.8039216, 0, 1,
-1.068128, -1.160211, -2.133328, 1, 0.8117647, 0, 1,
-1.065357, -0.3836251, -1.578204, 1, 0.8156863, 0, 1,
-1.053972, -1.226214, -3.286222, 1, 0.8235294, 0, 1,
-1.052232, 0.7213592, -0.3392559, 1, 0.827451, 0, 1,
-1.051757, 0.2025284, 0.689254, 1, 0.8352941, 0, 1,
-1.047948, -0.05805269, -0.3271982, 1, 0.8392157, 0, 1,
-1.045627, 1.695723, -1.603703, 1, 0.8470588, 0, 1,
-1.040392, 0.9069526, -1.459124, 1, 0.8509804, 0, 1,
-1.033048, -0.8935513, -0.7305828, 1, 0.8588235, 0, 1,
-1.030472, -0.6948186, -1.584983, 1, 0.8627451, 0, 1,
-1.022785, -0.2685228, -0.1675619, 1, 0.8705882, 0, 1,
-1.019982, -1.158802, -2.648106, 1, 0.8745098, 0, 1,
-1.012879, 0.3107119, -2.72306, 1, 0.8823529, 0, 1,
-1.006411, -1.755489, -2.083316, 1, 0.8862745, 0, 1,
-0.9990115, -0.1877841, -0.06914668, 1, 0.8941177, 0, 1,
-0.9985495, -0.2058342, -1.021856, 1, 0.8980392, 0, 1,
-0.9984457, 1.080995, -1.335923, 1, 0.9058824, 0, 1,
-0.991649, -0.3247947, -1.0325, 1, 0.9137255, 0, 1,
-0.9855343, -1.045546, -0.9111464, 1, 0.9176471, 0, 1,
-0.9853567, -0.3868925, -1.799499, 1, 0.9254902, 0, 1,
-0.983626, -0.4041792, -1.636349, 1, 0.9294118, 0, 1,
-0.9824941, 0.3906152, -0.3444508, 1, 0.9372549, 0, 1,
-0.975625, 0.2802536, -2.001168, 1, 0.9411765, 0, 1,
-0.9738356, 0.01302141, -1.857349, 1, 0.9490196, 0, 1,
-0.9704057, 0.05692976, -2.5181, 1, 0.9529412, 0, 1,
-0.9680611, -1.18102, -2.134931, 1, 0.9607843, 0, 1,
-0.9631653, -1.748655, -3.132776, 1, 0.9647059, 0, 1,
-0.9603926, -0.006178653, -2.280401, 1, 0.972549, 0, 1,
-0.958658, -0.2623985, -3.935759, 1, 0.9764706, 0, 1,
-0.956835, -0.3625124, -3.195041, 1, 0.9843137, 0, 1,
-0.9551145, 0.4357937, -0.6079547, 1, 0.9882353, 0, 1,
-0.954841, 1.325734, -0.05536674, 1, 0.9960784, 0, 1,
-0.9545524, 0.5741808, 0.9077795, 0.9960784, 1, 0, 1,
-0.9542175, -0.2613512, -1.706843, 0.9921569, 1, 0, 1,
-0.9351908, -1.044858, -3.6132, 0.9843137, 1, 0, 1,
-0.9350633, 0.5408028, -2.582864, 0.9803922, 1, 0, 1,
-0.9347077, -0.4760436, -4.097045, 0.972549, 1, 0, 1,
-0.9335515, 1.370102, 0.5813974, 0.9686275, 1, 0, 1,
-0.9329281, -0.215824, 0.1225693, 0.9607843, 1, 0, 1,
-0.9327819, 1.234394, 0.004896193, 0.9568627, 1, 0, 1,
-0.9276761, 0.5209173, -1.924646, 0.9490196, 1, 0, 1,
-0.9260892, -1.090946, 0.08313482, 0.945098, 1, 0, 1,
-0.9247339, -0.003267027, -2.435642, 0.9372549, 1, 0, 1,
-0.9199476, 0.1196418, -0.996959, 0.9333333, 1, 0, 1,
-0.9177087, -0.1831193, -0.1509214, 0.9254902, 1, 0, 1,
-0.9044053, -0.914879, -1.88874, 0.9215686, 1, 0, 1,
-0.8979968, 0.4252749, -0.4278527, 0.9137255, 1, 0, 1,
-0.8952533, 0.3004711, -1.798373, 0.9098039, 1, 0, 1,
-0.8806614, -0.5570638, -1.698431, 0.9019608, 1, 0, 1,
-0.8804402, 1.08916, -2.418688, 0.8941177, 1, 0, 1,
-0.8783354, 0.2767167, -1.641037, 0.8901961, 1, 0, 1,
-0.8756366, 1.593875, -1.069586, 0.8823529, 1, 0, 1,
-0.8666889, 0.647175, 0.4345675, 0.8784314, 1, 0, 1,
-0.866649, 0.03052827, -1.48767, 0.8705882, 1, 0, 1,
-0.8615688, 0.3159986, -1.258144, 0.8666667, 1, 0, 1,
-0.8609629, 0.9334027, 0.8534982, 0.8588235, 1, 0, 1,
-0.8513589, -0.4553639, -2.364663, 0.854902, 1, 0, 1,
-0.849807, 0.124048, -1.036908, 0.8470588, 1, 0, 1,
-0.8445221, 1.268507, 0.2462254, 0.8431373, 1, 0, 1,
-0.842872, -0.9827704, -2.832661, 0.8352941, 1, 0, 1,
-0.8426032, -0.1924537, -2.542058, 0.8313726, 1, 0, 1,
-0.8388216, -0.5426843, -1.803359, 0.8235294, 1, 0, 1,
-0.8351033, 0.3577369, -0.2028542, 0.8196079, 1, 0, 1,
-0.8337334, 1.299147, 0.3461241, 0.8117647, 1, 0, 1,
-0.8310764, 1.571732, -0.6439857, 0.8078431, 1, 0, 1,
-0.8305664, 1.005319, 0.1199052, 0.8, 1, 0, 1,
-0.82984, -1.932755, -2.592936, 0.7921569, 1, 0, 1,
-0.8296571, -0.9879708, -3.233331, 0.7882353, 1, 0, 1,
-0.8222331, 1.572347, 1.439159, 0.7803922, 1, 0, 1,
-0.8190914, 2.069448, -0.9049922, 0.7764706, 1, 0, 1,
-0.811753, -1.646953, -2.951477, 0.7686275, 1, 0, 1,
-0.8073168, 0.6933574, -1.668069, 0.7647059, 1, 0, 1,
-0.7999045, -0.3704802, -2.684696, 0.7568628, 1, 0, 1,
-0.7984692, 0.04059204, -2.385612, 0.7529412, 1, 0, 1,
-0.7984603, 0.3560094, -1.46859, 0.7450981, 1, 0, 1,
-0.7941091, -0.807057, -2.871131, 0.7411765, 1, 0, 1,
-0.7930822, -0.585436, -2.359524, 0.7333333, 1, 0, 1,
-0.7913951, 2.571802, -1.676771, 0.7294118, 1, 0, 1,
-0.7833314, 1.509532, 0.342789, 0.7215686, 1, 0, 1,
-0.7806903, 2.046603, -1.096801, 0.7176471, 1, 0, 1,
-0.7805014, 0.582523, -1.518565, 0.7098039, 1, 0, 1,
-0.7775656, -0.2402074, -1.079381, 0.7058824, 1, 0, 1,
-0.7728136, 0.3340023, -0.6932675, 0.6980392, 1, 0, 1,
-0.7715359, -1.410427, -2.304354, 0.6901961, 1, 0, 1,
-0.7689156, -0.1677652, -1.936503, 0.6862745, 1, 0, 1,
-0.7654242, -1.484886, -2.910607, 0.6784314, 1, 0, 1,
-0.7638498, -0.4646895, -0.9162877, 0.6745098, 1, 0, 1,
-0.7632552, -0.4010599, -2.587444, 0.6666667, 1, 0, 1,
-0.7626109, -0.5771809, -1.012626, 0.6627451, 1, 0, 1,
-0.7605503, 0.5093772, -0.5324692, 0.654902, 1, 0, 1,
-0.7563749, -0.3904815, -2.714219, 0.6509804, 1, 0, 1,
-0.756303, 0.2862075, -2.730943, 0.6431373, 1, 0, 1,
-0.7537587, -0.6930507, -2.516164, 0.6392157, 1, 0, 1,
-0.7537075, 0.5216464, -1.005259, 0.6313726, 1, 0, 1,
-0.7528612, -0.7288743, -0.6098137, 0.627451, 1, 0, 1,
-0.7486175, -0.4758032, -1.086722, 0.6196079, 1, 0, 1,
-0.7467979, -0.3485219, -1.797397, 0.6156863, 1, 0, 1,
-0.742354, -1.478631, -1.728525, 0.6078432, 1, 0, 1,
-0.7417278, -0.115027, -2.850721, 0.6039216, 1, 0, 1,
-0.7364659, 0.9441533, -0.7785551, 0.5960785, 1, 0, 1,
-0.7307932, -0.8907263, -0.3367372, 0.5882353, 1, 0, 1,
-0.7271631, 0.9849604, 0.9015229, 0.5843138, 1, 0, 1,
-0.726481, -1.370704, -2.168497, 0.5764706, 1, 0, 1,
-0.7257696, -0.6321455, -1.767891, 0.572549, 1, 0, 1,
-0.7224853, -1.857092, -2.913463, 0.5647059, 1, 0, 1,
-0.7201231, 1.632872, 0.09339826, 0.5607843, 1, 0, 1,
-0.7181887, -1.024942, -1.709165, 0.5529412, 1, 0, 1,
-0.7140229, -1.369674, -3.702046, 0.5490196, 1, 0, 1,
-0.7060766, 0.5838549, -3.319171, 0.5411765, 1, 0, 1,
-0.7060446, 0.6618007, -1.566196, 0.5372549, 1, 0, 1,
-0.7057226, 0.6092731, 0.0488444, 0.5294118, 1, 0, 1,
-0.7012206, 0.765642, 0.1251114, 0.5254902, 1, 0, 1,
-0.6984792, -0.9835413, -3.27372, 0.5176471, 1, 0, 1,
-0.6974035, 0.3698784, -0.9036797, 0.5137255, 1, 0, 1,
-0.6960643, -0.4984731, -2.839113, 0.5058824, 1, 0, 1,
-0.6945494, -1.04532, -3.893209, 0.5019608, 1, 0, 1,
-0.694168, -0.9042997, -0.7388313, 0.4941176, 1, 0, 1,
-0.6934943, -1.272936, -2.308416, 0.4862745, 1, 0, 1,
-0.6916801, 1.423353, -2.814435, 0.4823529, 1, 0, 1,
-0.690875, -1.163708, -3.30655, 0.4745098, 1, 0, 1,
-0.6898755, -0.5067774, -1.998018, 0.4705882, 1, 0, 1,
-0.6889077, -1.506247, -3.24322, 0.4627451, 1, 0, 1,
-0.688683, -0.2181068, -0.7666472, 0.4588235, 1, 0, 1,
-0.6837595, -0.2014921, -2.566231, 0.4509804, 1, 0, 1,
-0.6776888, -1.491117, -1.894909, 0.4470588, 1, 0, 1,
-0.6733294, -0.5862799, -2.5577, 0.4392157, 1, 0, 1,
-0.6725993, -0.4016798, -2.732127, 0.4352941, 1, 0, 1,
-0.6724223, 0.07783598, -3.478719, 0.427451, 1, 0, 1,
-0.6656904, 1.821558, -0.05555882, 0.4235294, 1, 0, 1,
-0.6627624, -1.90374, -2.443937, 0.4156863, 1, 0, 1,
-0.661385, 0.4279941, -0.8578327, 0.4117647, 1, 0, 1,
-0.6508595, -1.329707, -2.721859, 0.4039216, 1, 0, 1,
-0.6370789, 1.252822, 0.1799411, 0.3960784, 1, 0, 1,
-0.634211, 0.3546304, -0.7990848, 0.3921569, 1, 0, 1,
-0.626619, 1.805614, 0.38152, 0.3843137, 1, 0, 1,
-0.6256026, -0.941545, -2.50915, 0.3803922, 1, 0, 1,
-0.6253417, 0.3118878, -0.6774454, 0.372549, 1, 0, 1,
-0.6242743, -0.4438099, -2.967682, 0.3686275, 1, 0, 1,
-0.6239445, -1.773648, -0.8560662, 0.3607843, 1, 0, 1,
-0.6194084, -0.1691517, -2.815567, 0.3568628, 1, 0, 1,
-0.6187158, -1.187097, -1.093681, 0.3490196, 1, 0, 1,
-0.6156025, 0.8471029, 0.305884, 0.345098, 1, 0, 1,
-0.6134036, -0.7965587, -1.780591, 0.3372549, 1, 0, 1,
-0.610719, 1.612234, -3.179213, 0.3333333, 1, 0, 1,
-0.6086931, -0.6876829, -1.375122, 0.3254902, 1, 0, 1,
-0.6069924, -0.9154665, -0.9481224, 0.3215686, 1, 0, 1,
-0.6026523, -0.2291235, -2.153604, 0.3137255, 1, 0, 1,
-0.5982332, 0.2567457, -1.495883, 0.3098039, 1, 0, 1,
-0.5936456, 0.6717719, -1.594499, 0.3019608, 1, 0, 1,
-0.5908436, 1.177724, -0.8704243, 0.2941177, 1, 0, 1,
-0.5885682, -0.3544453, -1.783127, 0.2901961, 1, 0, 1,
-0.5841451, 0.170652, -1.927822, 0.282353, 1, 0, 1,
-0.5805666, -0.8312708, -2.926987, 0.2784314, 1, 0, 1,
-0.5774243, -0.3002888, -0.6030989, 0.2705882, 1, 0, 1,
-0.5754671, 0.1774261, -0.3997638, 0.2666667, 1, 0, 1,
-0.5749657, -0.3383176, -3.291552, 0.2588235, 1, 0, 1,
-0.5723495, -1.632307, -2.364629, 0.254902, 1, 0, 1,
-0.5702286, -0.6729294, -3.151002, 0.2470588, 1, 0, 1,
-0.5692049, 0.9834139, 0.6095582, 0.2431373, 1, 0, 1,
-0.5627149, -1.066066, -4.292318, 0.2352941, 1, 0, 1,
-0.5614238, 1.140384, -0.7141963, 0.2313726, 1, 0, 1,
-0.5577601, 2.076706, -1.147311, 0.2235294, 1, 0, 1,
-0.5552089, 0.9614514, -1.441238, 0.2196078, 1, 0, 1,
-0.5549808, 2.630278, -0.1242958, 0.2117647, 1, 0, 1,
-0.5543817, 0.6483145, -1.930871, 0.2078431, 1, 0, 1,
-0.5541534, 0.6677718, -3.527692, 0.2, 1, 0, 1,
-0.5527376, -1.806789, -2.409362, 0.1921569, 1, 0, 1,
-0.5514506, -0.7117591, -2.767004, 0.1882353, 1, 0, 1,
-0.5505494, -0.2846369, -1.643557, 0.1803922, 1, 0, 1,
-0.5502881, 0.5308961, -0.7859836, 0.1764706, 1, 0, 1,
-0.5396139, -0.5950999, -2.114478, 0.1686275, 1, 0, 1,
-0.5322919, -1.91898, -3.132634, 0.1647059, 1, 0, 1,
-0.5314611, 1.690622, -1.389273, 0.1568628, 1, 0, 1,
-0.5301483, -0.8593913, -3.203553, 0.1529412, 1, 0, 1,
-0.5294092, -0.8370622, -3.552105, 0.145098, 1, 0, 1,
-0.5258654, 0.002408179, -0.654011, 0.1411765, 1, 0, 1,
-0.5196195, -0.07562631, -3.353288, 0.1333333, 1, 0, 1,
-0.5167728, 0.1188659, 0.277599, 0.1294118, 1, 0, 1,
-0.5150639, 0.7778575, -2.040768, 0.1215686, 1, 0, 1,
-0.5137228, -0.8111437, -2.371355, 0.1176471, 1, 0, 1,
-0.5130296, -0.07291403, -2.383439, 0.1098039, 1, 0, 1,
-0.5112032, -0.02610498, -2.151257, 0.1058824, 1, 0, 1,
-0.5073618, 0.8503182, 1.410372, 0.09803922, 1, 0, 1,
-0.5050291, -0.4854792, -3.687341, 0.09019608, 1, 0, 1,
-0.5035508, -0.001000597, -2.339783, 0.08627451, 1, 0, 1,
-0.5011591, 0.7398379, -0.3013551, 0.07843138, 1, 0, 1,
-0.4988141, 0.9916326, -1.129016, 0.07450981, 1, 0, 1,
-0.4986428, -0.4837633, -1.797671, 0.06666667, 1, 0, 1,
-0.498534, 0.2068033, -0.9520243, 0.0627451, 1, 0, 1,
-0.4948005, -0.8210087, -2.159046, 0.05490196, 1, 0, 1,
-0.4927732, 1.034979, -0.6150842, 0.05098039, 1, 0, 1,
-0.4862568, 1.525918, -1.154746, 0.04313726, 1, 0, 1,
-0.4833553, -1.565638, -2.415936, 0.03921569, 1, 0, 1,
-0.4781471, -2.78849, -2.364175, 0.03137255, 1, 0, 1,
-0.4779543, 0.9976625, -0.4726738, 0.02745098, 1, 0, 1,
-0.473685, -0.092646, -0.6874896, 0.01960784, 1, 0, 1,
-0.4730248, 0.2537265, -0.7161035, 0.01568628, 1, 0, 1,
-0.4689881, -0.4778045, -2.816555, 0.007843138, 1, 0, 1,
-0.4600068, -0.3421621, -2.084178, 0.003921569, 1, 0, 1,
-0.459034, -0.4413522, -2.592036, 0, 1, 0.003921569, 1,
-0.4574721, -0.3269123, -3.171069, 0, 1, 0.01176471, 1,
-0.4556742, -1.455279, -3.199704, 0, 1, 0.01568628, 1,
-0.4540541, -0.5552784, -2.201803, 0, 1, 0.02352941, 1,
-0.4477864, -0.1903035, -1.807787, 0, 1, 0.02745098, 1,
-0.4461888, -0.7948132, -2.878284, 0, 1, 0.03529412, 1,
-0.4413172, -0.3035404, -0.1179115, 0, 1, 0.03921569, 1,
-0.4387836, -1.06412, -0.2745001, 0, 1, 0.04705882, 1,
-0.437115, 0.01755412, -1.851347, 0, 1, 0.05098039, 1,
-0.4303603, -0.6811619, -3.846487, 0, 1, 0.05882353, 1,
-0.4295362, -0.7667667, -2.680863, 0, 1, 0.0627451, 1,
-0.4293132, -0.4591593, -1.262138, 0, 1, 0.07058824, 1,
-0.4284271, -0.3605302, -2.916417, 0, 1, 0.07450981, 1,
-0.4258842, -0.7198759, -2.349503, 0, 1, 0.08235294, 1,
-0.4239259, -1.309672, -3.811534, 0, 1, 0.08627451, 1,
-0.4221693, 0.08917917, -1.513803, 0, 1, 0.09411765, 1,
-0.4210747, 0.4377796, -0.7698251, 0, 1, 0.1019608, 1,
-0.419298, -0.03200066, -1.32682, 0, 1, 0.1058824, 1,
-0.419048, 1.966784, -1.64065, 0, 1, 0.1137255, 1,
-0.4187833, -0.1759821, -2.086667, 0, 1, 0.1176471, 1,
-0.4139718, 0.1064586, -2.249986, 0, 1, 0.1254902, 1,
-0.411336, 1.509585, -1.480435, 0, 1, 0.1294118, 1,
-0.4097511, -0.3195854, -1.317039, 0, 1, 0.1372549, 1,
-0.4055077, -0.6689655, -2.514006, 0, 1, 0.1411765, 1,
-0.4040492, 0.5536314, 0.09245423, 0, 1, 0.1490196, 1,
-0.3974503, -0.7662483, -3.031948, 0, 1, 0.1529412, 1,
-0.3955842, -0.2787204, -1.25041, 0, 1, 0.1607843, 1,
-0.3939827, 0.2118867, -0.9417692, 0, 1, 0.1647059, 1,
-0.3936668, 1.325727, 0.8864077, 0, 1, 0.172549, 1,
-0.375973, -0.2694881, -1.60959, 0, 1, 0.1764706, 1,
-0.3733304, 1.338843, 0.1007507, 0, 1, 0.1843137, 1,
-0.3720944, 1.045851, 0.07430658, 0, 1, 0.1882353, 1,
-0.3649505, 0.3767331, -0.9598127, 0, 1, 0.1960784, 1,
-0.3637931, 0.4829725, -0.7886486, 0, 1, 0.2039216, 1,
-0.3628892, -0.7395958, -1.304632, 0, 1, 0.2078431, 1,
-0.3596026, -1.027991, -3.986857, 0, 1, 0.2156863, 1,
-0.3594179, -0.3652483, -1.202955, 0, 1, 0.2196078, 1,
-0.34714, -1.181573, -2.600509, 0, 1, 0.227451, 1,
-0.3439498, -0.2818643, -3.206928, 0, 1, 0.2313726, 1,
-0.3413257, 1.650673, 0.3277023, 0, 1, 0.2392157, 1,
-0.3381049, 0.1004742, -0.9393811, 0, 1, 0.2431373, 1,
-0.3376664, -0.09202988, -3.384272, 0, 1, 0.2509804, 1,
-0.3362682, -0.2389889, -0.3812638, 0, 1, 0.254902, 1,
-0.3360052, -0.8866973, -1.971641, 0, 1, 0.2627451, 1,
-0.335291, -0.1072605, -0.5624949, 0, 1, 0.2666667, 1,
-0.332883, 1.983945, -0.5307042, 0, 1, 0.2745098, 1,
-0.3255349, -0.03721872, -1.816189, 0, 1, 0.2784314, 1,
-0.3230439, -0.6497446, -0.9426869, 0, 1, 0.2862745, 1,
-0.3204934, -2.184494, -4.548722, 0, 1, 0.2901961, 1,
-0.3187913, -1.45655, -1.94238, 0, 1, 0.2980392, 1,
-0.3183739, -0.470295, -3.300715, 0, 1, 0.3058824, 1,
-0.3183227, -0.9862244, -1.974467, 0, 1, 0.3098039, 1,
-0.3174274, -3.201933, -3.532455, 0, 1, 0.3176471, 1,
-0.3156107, 1.245909, 0.7759981, 0, 1, 0.3215686, 1,
-0.3093999, 0.3530284, -1.331253, 0, 1, 0.3294118, 1,
-0.3056875, 0.3232681, -1.774446, 0, 1, 0.3333333, 1,
-0.3028302, -0.5296568, -3.127982, 0, 1, 0.3411765, 1,
-0.2980307, -1.512111, -3.209588, 0, 1, 0.345098, 1,
-0.2957962, 0.1503599, -0.9019833, 0, 1, 0.3529412, 1,
-0.2930276, 0.08723249, -0.4700507, 0, 1, 0.3568628, 1,
-0.291897, 0.5381471, -0.1667545, 0, 1, 0.3647059, 1,
-0.2902837, 0.7549896, -0.573762, 0, 1, 0.3686275, 1,
-0.2880865, 0.2178787, -1.065808, 0, 1, 0.3764706, 1,
-0.2877664, -0.4491012, -2.884101, 0, 1, 0.3803922, 1,
-0.2868169, -1.131059, -2.230496, 0, 1, 0.3882353, 1,
-0.2852538, 0.6937897, -0.5590324, 0, 1, 0.3921569, 1,
-0.2829697, -0.7222615, -2.751768, 0, 1, 0.4, 1,
-0.2730694, 0.1344426, -0.9835925, 0, 1, 0.4078431, 1,
-0.2708989, -0.8419785, -3.476469, 0, 1, 0.4117647, 1,
-0.2649193, 1.045945, 0.8077141, 0, 1, 0.4196078, 1,
-0.262868, -0.4345767, -2.68327, 0, 1, 0.4235294, 1,
-0.2607317, 1.795265, -1.81606, 0, 1, 0.4313726, 1,
-0.2589572, 0.5235597, -0.3434996, 0, 1, 0.4352941, 1,
-0.2580638, 2.111437, 0.03951468, 0, 1, 0.4431373, 1,
-0.2530355, -0.9732603, -1.806052, 0, 1, 0.4470588, 1,
-0.2494676, -0.6598115, -1.785847, 0, 1, 0.454902, 1,
-0.246683, -1.661592, -4.158015, 0, 1, 0.4588235, 1,
-0.2378677, -0.5083252, -3.409269, 0, 1, 0.4666667, 1,
-0.237416, 1.311083, -2.088897, 0, 1, 0.4705882, 1,
-0.237315, 0.8605462, -0.5707498, 0, 1, 0.4784314, 1,
-0.2342114, -0.3598188, -0.5195256, 0, 1, 0.4823529, 1,
-0.2296886, 0.7124134, 0.5024111, 0, 1, 0.4901961, 1,
-0.224012, -0.440675, -3.122395, 0, 1, 0.4941176, 1,
-0.2238394, 0.6239349, -0.1788025, 0, 1, 0.5019608, 1,
-0.2188805, -0.7931088, -3.188845, 0, 1, 0.509804, 1,
-0.2171658, 0.9400634, 0.3422759, 0, 1, 0.5137255, 1,
-0.2169217, -0.03592382, -2.235731, 0, 1, 0.5215687, 1,
-0.2160166, 0.3078453, -2.283544, 0, 1, 0.5254902, 1,
-0.2086126, -0.901364, -2.938902, 0, 1, 0.5333334, 1,
-0.2067971, -0.9756498, -2.638864, 0, 1, 0.5372549, 1,
-0.2052962, 2.199966, 1.16491, 0, 1, 0.5450981, 1,
-0.2039492, -0.0954867, -1.205882, 0, 1, 0.5490196, 1,
-0.2029312, -1.842304, -3.215025, 0, 1, 0.5568628, 1,
-0.1963681, 1.243153, 1.408851, 0, 1, 0.5607843, 1,
-0.1898591, 0.8887232, -0.06007762, 0, 1, 0.5686275, 1,
-0.1849266, -0.293191, -3.512453, 0, 1, 0.572549, 1,
-0.1845913, 1.83631, -0.3168336, 0, 1, 0.5803922, 1,
-0.1835583, 0.583249, -2.83424, 0, 1, 0.5843138, 1,
-0.1830221, 0.5027359, 1.379755, 0, 1, 0.5921569, 1,
-0.1819973, 0.01850863, -0.8871886, 0, 1, 0.5960785, 1,
-0.1811568, 1.1922, -0.2191643, 0, 1, 0.6039216, 1,
-0.180374, 0.5890152, -0.6239374, 0, 1, 0.6117647, 1,
-0.1799014, -0.6240264, -2.022393, 0, 1, 0.6156863, 1,
-0.178794, 2.070873, 0.716665, 0, 1, 0.6235294, 1,
-0.1786072, -0.3975502, -3.625822, 0, 1, 0.627451, 1,
-0.1768098, -0.737821, -2.934317, 0, 1, 0.6352941, 1,
-0.175666, -0.1562232, -2.855013, 0, 1, 0.6392157, 1,
-0.1724005, -0.4457127, -4.305464, 0, 1, 0.6470588, 1,
-0.1719157, 0.1372899, -1.412573, 0, 1, 0.6509804, 1,
-0.1710738, 0.4367118, -0.4074093, 0, 1, 0.6588235, 1,
-0.1658987, 1.035055, 0.3235022, 0, 1, 0.6627451, 1,
-0.1651968, 1.613636, -0.5484473, 0, 1, 0.6705883, 1,
-0.1649326, -1.711302, -1.482622, 0, 1, 0.6745098, 1,
-0.1635094, 0.5870777, -0.3512993, 0, 1, 0.682353, 1,
-0.1629877, -1.241278, -1.575116, 0, 1, 0.6862745, 1,
-0.1612583, 1.169276, 1.7839, 0, 1, 0.6941177, 1,
-0.1595109, -0.7638103, -1.94488, 0, 1, 0.7019608, 1,
-0.1513221, -0.1273104, -3.372936, 0, 1, 0.7058824, 1,
-0.1501283, -0.1219113, -1.420068, 0, 1, 0.7137255, 1,
-0.1485348, 1.351884, -0.5951459, 0, 1, 0.7176471, 1,
-0.1462847, -0.6535694, -3.18754, 0, 1, 0.7254902, 1,
-0.1313896, 1.475992, -0.5114759, 0, 1, 0.7294118, 1,
-0.1264896, 1.2476, -1.154283, 0, 1, 0.7372549, 1,
-0.1229435, 0.2107006, 1.331944, 0, 1, 0.7411765, 1,
-0.1226193, 0.2077757, 0.8190195, 0, 1, 0.7490196, 1,
-0.1219037, -1.405581, -2.757655, 0, 1, 0.7529412, 1,
-0.1213502, 0.9350445, -1.396498, 0, 1, 0.7607843, 1,
-0.1205311, -1.260464, -2.892828, 0, 1, 0.7647059, 1,
-0.1195108, 0.8686554, -1.265941, 0, 1, 0.772549, 1,
-0.118644, 0.1388893, -1.929466, 0, 1, 0.7764706, 1,
-0.1182586, -0.6907601, -3.29785, 0, 1, 0.7843137, 1,
-0.1180851, -0.6299797, -4.719182, 0, 1, 0.7882353, 1,
-0.1162869, 0.2692115, -1.260501, 0, 1, 0.7960784, 1,
-0.1099353, -0.1498372, -3.992951, 0, 1, 0.8039216, 1,
-0.1092662, 0.9383305, 1.77908, 0, 1, 0.8078431, 1,
-0.1031671, -0.108344, -0.5281557, 0, 1, 0.8156863, 1,
-0.09895546, 2.435101, 0.7409428, 0, 1, 0.8196079, 1,
-0.09639274, -1.318807, -3.613476, 0, 1, 0.827451, 1,
-0.09279161, -0.3261516, -2.594819, 0, 1, 0.8313726, 1,
-0.09012821, 2.103519, -1.643519, 0, 1, 0.8392157, 1,
-0.08600008, 0.4512511, -0.8321663, 0, 1, 0.8431373, 1,
-0.08109999, 0.3156018, -2.066911, 0, 1, 0.8509804, 1,
-0.08023443, 2.354953, -0.9190168, 0, 1, 0.854902, 1,
-0.07925455, -0.6123503, -2.317902, 0, 1, 0.8627451, 1,
-0.07507367, 0.7828065, -1.779054, 0, 1, 0.8666667, 1,
-0.07240323, 0.5393607, 0.8997423, 0, 1, 0.8745098, 1,
-0.07093512, 1.335997, 0.3816459, 0, 1, 0.8784314, 1,
-0.06931178, 0.01024101, -0.8255066, 0, 1, 0.8862745, 1,
-0.06815826, 0.690452, -1.094003, 0, 1, 0.8901961, 1,
-0.06720526, -1.09272, -3.270989, 0, 1, 0.8980392, 1,
-0.06365706, 2.148495, -2.413062, 0, 1, 0.9058824, 1,
-0.0612119, 0.002849967, -2.247166, 0, 1, 0.9098039, 1,
-0.05638497, 0.4363922, -1.486678, 0, 1, 0.9176471, 1,
-0.05634823, 0.509312, 0.2507926, 0, 1, 0.9215686, 1,
-0.05242112, 0.05466993, 0.4220782, 0, 1, 0.9294118, 1,
-0.05162587, 0.7829381, -0.7557864, 0, 1, 0.9333333, 1,
-0.04694718, 1.52975, 0.4502485, 0, 1, 0.9411765, 1,
-0.0403032, 0.4404819, 0.8970518, 0, 1, 0.945098, 1,
-0.03908863, 0.08233556, -0.8265721, 0, 1, 0.9529412, 1,
-0.03776332, 0.4782167, 0.1759059, 0, 1, 0.9568627, 1,
-0.03746751, 0.6507049, 1.582951, 0, 1, 0.9647059, 1,
-0.03644731, 0.8702651, -0.4044068, 0, 1, 0.9686275, 1,
-0.03159852, -2.607537, -3.361301, 0, 1, 0.9764706, 1,
-0.02754844, 1.16217, 0.6374041, 0, 1, 0.9803922, 1,
-0.026324, -1.600691, -3.800752, 0, 1, 0.9882353, 1,
-0.02508818, 1.457857, 1.89774, 0, 1, 0.9921569, 1,
-0.02097672, 0.7310354, 0.0226173, 0, 1, 1, 1,
-0.02073943, 1.207453, -0.7359964, 0, 0.9921569, 1, 1,
-0.01796713, -0.1035368, -2.74657, 0, 0.9882353, 1, 1,
-0.01399057, 2.210722, -0.2951267, 0, 0.9803922, 1, 1,
-0.01364777, 1.145624, -1.0016, 0, 0.9764706, 1, 1,
-0.01161838, -0.1007802, -5.045083, 0, 0.9686275, 1, 1,
-0.01023786, 0.1340267, -0.04552159, 0, 0.9647059, 1, 1,
-0.004193332, -0.1608635, -2.819274, 0, 0.9568627, 1, 1,
-0.001227024, -1.715322, -2.143124, 0, 0.9529412, 1, 1,
-0.0007484023, 0.4631511, -1.11042, 0, 0.945098, 1, 1,
0.002543371, -0.5125001, 4.259825, 0, 0.9411765, 1, 1,
0.007902374, -0.09071425, 3.147522, 0, 0.9333333, 1, 1,
0.009959266, -0.01016859, 3.132479, 0, 0.9294118, 1, 1,
0.0149745, -0.5820737, 1.837781, 0, 0.9215686, 1, 1,
0.02002168, 0.5188386, 0.1115637, 0, 0.9176471, 1, 1,
0.02060492, -1.528582, 2.016354, 0, 0.9098039, 1, 1,
0.02066423, 0.869839, 0.8777686, 0, 0.9058824, 1, 1,
0.02163349, 1.808043, -1.23308, 0, 0.8980392, 1, 1,
0.02720965, -0.8469582, 2.427376, 0, 0.8901961, 1, 1,
0.02724343, -0.3634701, 3.608799, 0, 0.8862745, 1, 1,
0.02737425, -0.3570147, 3.650647, 0, 0.8784314, 1, 1,
0.02886965, -0.4941837, 2.979256, 0, 0.8745098, 1, 1,
0.02955385, -0.7275146, 5.085598, 0, 0.8666667, 1, 1,
0.03110896, 0.424486, 0.3224445, 0, 0.8627451, 1, 1,
0.03130955, 1.185389, -0.4362562, 0, 0.854902, 1, 1,
0.03261636, 0.1677691, 2.098377, 0, 0.8509804, 1, 1,
0.03330538, -0.4967635, 3.3127, 0, 0.8431373, 1, 1,
0.03475916, -0.5173732, 1.290285, 0, 0.8392157, 1, 1,
0.03696716, -0.5596835, 3.897829, 0, 0.8313726, 1, 1,
0.03912282, -0.5625208, 2.290373, 0, 0.827451, 1, 1,
0.04576142, 0.01968572, 0.5921663, 0, 0.8196079, 1, 1,
0.04615096, 0.02885295, 1.975905, 0, 0.8156863, 1, 1,
0.04618822, -0.3195342, 4.737736, 0, 0.8078431, 1, 1,
0.0497145, -1.266527, 2.518455, 0, 0.8039216, 1, 1,
0.05934731, 0.01579607, 1.865958, 0, 0.7960784, 1, 1,
0.0596887, 1.11634, 0.1983362, 0, 0.7882353, 1, 1,
0.05977424, 0.6888083, 1.083484, 0, 0.7843137, 1, 1,
0.06287607, -0.9228247, 2.402037, 0, 0.7764706, 1, 1,
0.06685997, -0.4174494, 2.744902, 0, 0.772549, 1, 1,
0.06763387, -1.491824, 3.668172, 0, 0.7647059, 1, 1,
0.0713088, 0.2627385, 0.1296645, 0, 0.7607843, 1, 1,
0.07455265, 2.011909, 2.091407, 0, 0.7529412, 1, 1,
0.07737766, 0.4705194, 0.94668, 0, 0.7490196, 1, 1,
0.07959008, 0.7458817, 0.3698476, 0, 0.7411765, 1, 1,
0.08480775, -1.762316, 5.144514, 0, 0.7372549, 1, 1,
0.08603844, -1.720871, 3.208346, 0, 0.7294118, 1, 1,
0.0866037, -0.42227, 3.573101, 0, 0.7254902, 1, 1,
0.08767901, 1.153904, -0.488665, 0, 0.7176471, 1, 1,
0.08830673, -0.1296937, 2.717643, 0, 0.7137255, 1, 1,
0.089897, 0.8529176, 1.182153, 0, 0.7058824, 1, 1,
0.09167023, 0.2889593, 0.5877489, 0, 0.6980392, 1, 1,
0.09676353, -1.244032, 1.050747, 0, 0.6941177, 1, 1,
0.09814329, -0.3257431, 2.673005, 0, 0.6862745, 1, 1,
0.1008856, 0.0110041, 2.282262, 0, 0.682353, 1, 1,
0.1036804, 0.1821107, -1.099849, 0, 0.6745098, 1, 1,
0.1098656, 0.9120154, 0.6452654, 0, 0.6705883, 1, 1,
0.1105588, -2.49392, 0.7012951, 0, 0.6627451, 1, 1,
0.110972, 0.7322062, -0.4948914, 0, 0.6588235, 1, 1,
0.1124291, -0.3413316, 1.972764, 0, 0.6509804, 1, 1,
0.1165044, -0.4557155, 3.65792, 0, 0.6470588, 1, 1,
0.1194487, -1.323568, 4.388897, 0, 0.6392157, 1, 1,
0.1231536, -0.7408821, 2.888412, 0, 0.6352941, 1, 1,
0.1306662, -0.4179262, 1.147074, 0, 0.627451, 1, 1,
0.130782, -0.5691278, 2.056347, 0, 0.6235294, 1, 1,
0.1313625, -0.1685443, 2.530007, 0, 0.6156863, 1, 1,
0.1399845, 1.200467, 0.9796283, 0, 0.6117647, 1, 1,
0.1414254, -1.54545, 4.536208, 0, 0.6039216, 1, 1,
0.1423256, 0.4560265, 1.727338, 0, 0.5960785, 1, 1,
0.1424762, 0.3489745, 0.666911, 0, 0.5921569, 1, 1,
0.1439059, 1.317757, 0.8991463, 0, 0.5843138, 1, 1,
0.1455268, 0.05938751, 1.460018, 0, 0.5803922, 1, 1,
0.1492091, 2.170591, 2.649017, 0, 0.572549, 1, 1,
0.1549043, 2.016441, -1.461989, 0, 0.5686275, 1, 1,
0.161251, 0.1235618, 0.4791097, 0, 0.5607843, 1, 1,
0.1693975, -0.267992, 4.148293, 0, 0.5568628, 1, 1,
0.1697488, 0.3769792, -0.1648363, 0, 0.5490196, 1, 1,
0.1744375, 0.3596691, 0.5353442, 0, 0.5450981, 1, 1,
0.1773906, -0.1430055, 2.870489, 0, 0.5372549, 1, 1,
0.1801395, 0.0584539, -0.8036803, 0, 0.5333334, 1, 1,
0.18983, 0.3622431, 0.6761375, 0, 0.5254902, 1, 1,
0.2024206, 0.2160722, -0.2899933, 0, 0.5215687, 1, 1,
0.2050985, 1.390468, 1.057661, 0, 0.5137255, 1, 1,
0.2117561, -1.08324, 4.759539, 0, 0.509804, 1, 1,
0.2119266, -0.1093679, 2.487515, 0, 0.5019608, 1, 1,
0.2122345, 0.4180955, -0.001363336, 0, 0.4941176, 1, 1,
0.2127205, -0.05506679, 1.935746, 0, 0.4901961, 1, 1,
0.2137924, -0.8906763, 5.526386, 0, 0.4823529, 1, 1,
0.2221977, 0.6375532, 0.4564722, 0, 0.4784314, 1, 1,
0.2237729, 0.2903936, -1.177378, 0, 0.4705882, 1, 1,
0.2266328, 0.3024109, 2.212936, 0, 0.4666667, 1, 1,
0.2348068, -1.690153, 2.749017, 0, 0.4588235, 1, 1,
0.235261, 0.6138713, 0.2142414, 0, 0.454902, 1, 1,
0.2381096, -0.07891446, 1.376478, 0, 0.4470588, 1, 1,
0.2423717, -1.479696, 3.396632, 0, 0.4431373, 1, 1,
0.247015, 0.480515, 2.111123, 0, 0.4352941, 1, 1,
0.2482186, 1.214244, 1.610193, 0, 0.4313726, 1, 1,
0.24957, -2.013012, 2.096212, 0, 0.4235294, 1, 1,
0.2514939, 0.7397029, -0.3979376, 0, 0.4196078, 1, 1,
0.2572405, -0.1774179, 3.136734, 0, 0.4117647, 1, 1,
0.261991, 0.5114052, 1.401661, 0, 0.4078431, 1, 1,
0.2632355, -1.673727, 2.580066, 0, 0.4, 1, 1,
0.2639088, -0.1557273, 2.529091, 0, 0.3921569, 1, 1,
0.2676325, 0.1583858, -0.02377502, 0, 0.3882353, 1, 1,
0.2687035, 0.3744796, 0.6899476, 0, 0.3803922, 1, 1,
0.2699868, 0.2586746, 1.095749, 0, 0.3764706, 1, 1,
0.270761, 0.8401089, 0.7677972, 0, 0.3686275, 1, 1,
0.2710024, 2.243834, -1.167376, 0, 0.3647059, 1, 1,
0.2710094, 0.3251887, -1.231706, 0, 0.3568628, 1, 1,
0.2734891, 0.09390522, 0.724398, 0, 0.3529412, 1, 1,
0.2741552, -0.7114568, 4.76273, 0, 0.345098, 1, 1,
0.2749402, -0.3393525, 1.879433, 0, 0.3411765, 1, 1,
0.285393, -0.9405991, 3.793826, 0, 0.3333333, 1, 1,
0.2901129, -0.6515245, 3.800156, 0, 0.3294118, 1, 1,
0.2974109, -1.158578, 3.011497, 0, 0.3215686, 1, 1,
0.2978156, -0.4474738, 1.784744, 0, 0.3176471, 1, 1,
0.3018034, -1.319058, 4.377515, 0, 0.3098039, 1, 1,
0.3026827, 0.1019832, 0.1307149, 0, 0.3058824, 1, 1,
0.3029574, -0.2145548, -0.3150744, 0, 0.2980392, 1, 1,
0.3034809, -1.281822, 1.236501, 0, 0.2901961, 1, 1,
0.3050002, -0.1067303, 3.274183, 0, 0.2862745, 1, 1,
0.3075724, -0.1469154, 1.882212, 0, 0.2784314, 1, 1,
0.308727, -0.2123618, 4.566117, 0, 0.2745098, 1, 1,
0.3125075, -0.7739041, 3.766335, 0, 0.2666667, 1, 1,
0.3186788, -0.3710212, 4.13835, 0, 0.2627451, 1, 1,
0.3195864, 0.3444019, 2.925509, 0, 0.254902, 1, 1,
0.3211672, 1.648177, 0.7979751, 0, 0.2509804, 1, 1,
0.32223, -0.1655137, 4.072204, 0, 0.2431373, 1, 1,
0.322608, 1.153083, -0.9290755, 0, 0.2392157, 1, 1,
0.3232403, 0.9354765, 0.9346585, 0, 0.2313726, 1, 1,
0.3261941, -0.9694995, 1.892374, 0, 0.227451, 1, 1,
0.3331699, 0.5442793, 0.08959966, 0, 0.2196078, 1, 1,
0.3362225, -0.4838017, 1.525138, 0, 0.2156863, 1, 1,
0.339167, 0.1986951, 1.138092, 0, 0.2078431, 1, 1,
0.3393556, -0.1355484, 1.634984, 0, 0.2039216, 1, 1,
0.35171, -0.2532164, 3.082283, 0, 0.1960784, 1, 1,
0.3522755, 0.6278002, 1.175922, 0, 0.1882353, 1, 1,
0.3543518, 2.493801, -0.7347491, 0, 0.1843137, 1, 1,
0.3560117, 0.1756524, 0.3028118, 0, 0.1764706, 1, 1,
0.3668586, -1.886629, 3.312289, 0, 0.172549, 1, 1,
0.370483, -0.7009484, 1.608754, 0, 0.1647059, 1, 1,
0.3733818, 0.161671, 0.6091924, 0, 0.1607843, 1, 1,
0.3744093, 0.5253035, 3.505519, 0, 0.1529412, 1, 1,
0.3787613, -0.3489494, 3.037152, 0, 0.1490196, 1, 1,
0.3792363, 0.1109926, 1.643663, 0, 0.1411765, 1, 1,
0.3810383, -0.9958867, 3.311328, 0, 0.1372549, 1, 1,
0.3819789, -0.2217196, 3.752915, 0, 0.1294118, 1, 1,
0.3822942, 0.1152641, -0.4274675, 0, 0.1254902, 1, 1,
0.3867086, -0.6625109, 1.360924, 0, 0.1176471, 1, 1,
0.3881517, -0.8470725, 1.070958, 0, 0.1137255, 1, 1,
0.3906656, -0.6776428, 2.23631, 0, 0.1058824, 1, 1,
0.3933088, 0.6562129, -0.6343442, 0, 0.09803922, 1, 1,
0.3934932, -0.6335226, 2.638073, 0, 0.09411765, 1, 1,
0.3945119, -1.175547, 3.884506, 0, 0.08627451, 1, 1,
0.3951986, -0.32636, 2.267954, 0, 0.08235294, 1, 1,
0.3955451, 0.8177829, 1.070003, 0, 0.07450981, 1, 1,
0.400642, 0.3990165, -0.6711782, 0, 0.07058824, 1, 1,
0.4017051, -0.7467947, 3.146158, 0, 0.0627451, 1, 1,
0.4034308, 0.6080214, -0.7195024, 0, 0.05882353, 1, 1,
0.4092918, -1.58009, 3.739739, 0, 0.05098039, 1, 1,
0.4112198, 0.5516739, 1.678264, 0, 0.04705882, 1, 1,
0.4123823, 1.557537, -0.7912694, 0, 0.03921569, 1, 1,
0.4131668, 0.4292558, 0.6707951, 0, 0.03529412, 1, 1,
0.4219671, 1.320356, 0.3943949, 0, 0.02745098, 1, 1,
0.4225687, -0.5308188, 1.981072, 0, 0.02352941, 1, 1,
0.4225718, 1.278496, -0.3222162, 0, 0.01568628, 1, 1,
0.4264108, 0.1675698, 2.081038, 0, 0.01176471, 1, 1,
0.4304403, 0.8812425, 2.276506, 0, 0.003921569, 1, 1,
0.4352225, -1.182476, 4.429523, 0.003921569, 0, 1, 1,
0.4399145, 0.1792382, 1.618914, 0.007843138, 0, 1, 1,
0.444195, 0.02983295, 1.369407, 0.01568628, 0, 1, 1,
0.4456898, 0.6058817, 0.3835376, 0.01960784, 0, 1, 1,
0.4476879, 0.7223492, 0.2473244, 0.02745098, 0, 1, 1,
0.4487599, -1.786418, 2.614996, 0.03137255, 0, 1, 1,
0.4529974, -0.5066076, 3.127278, 0.03921569, 0, 1, 1,
0.455001, -0.2545186, 2.203304, 0.04313726, 0, 1, 1,
0.4555087, -0.6304038, 1.811527, 0.05098039, 0, 1, 1,
0.4569962, 0.170656, 2.548005, 0.05490196, 0, 1, 1,
0.4625785, 0.6217766, 1.137751, 0.0627451, 0, 1, 1,
0.4631893, -2.071173, 1.895299, 0.06666667, 0, 1, 1,
0.4663855, -0.365234, 1.766811, 0.07450981, 0, 1, 1,
0.4684877, -0.7373846, 2.001027, 0.07843138, 0, 1, 1,
0.4711341, -0.8879774, 2.415855, 0.08627451, 0, 1, 1,
0.4746836, -0.4859327, 2.231585, 0.09019608, 0, 1, 1,
0.4761699, -0.1336859, 0.03545539, 0.09803922, 0, 1, 1,
0.4782774, 0.188484, 1.437983, 0.1058824, 0, 1, 1,
0.4803018, 0.5802764, 2.397939, 0.1098039, 0, 1, 1,
0.4846232, -2.336776, 2.816753, 0.1176471, 0, 1, 1,
0.490335, -1.058664, 2.889629, 0.1215686, 0, 1, 1,
0.4928474, 1.254553, -0.1548979, 0.1294118, 0, 1, 1,
0.4978255, 0.5469337, 1.043402, 0.1333333, 0, 1, 1,
0.5003089, -0.6938224, 2.691354, 0.1411765, 0, 1, 1,
0.5023875, 0.5098315, 0.8850995, 0.145098, 0, 1, 1,
0.5043277, -0.1808591, 2.297206, 0.1529412, 0, 1, 1,
0.508641, 0.5167335, -0.5648932, 0.1568628, 0, 1, 1,
0.5091591, 0.3008686, 0.2965976, 0.1647059, 0, 1, 1,
0.5111276, 0.4053479, 0.8854976, 0.1686275, 0, 1, 1,
0.5125644, -1.674384, 2.569289, 0.1764706, 0, 1, 1,
0.5126809, -1.793619, 3.526458, 0.1803922, 0, 1, 1,
0.5139334, 1.906524, 0.1100234, 0.1882353, 0, 1, 1,
0.5158419, -1.146849, 3.319251, 0.1921569, 0, 1, 1,
0.5210757, -0.3644755, 1.375192, 0.2, 0, 1, 1,
0.5236114, 0.01973075, 2.507708, 0.2078431, 0, 1, 1,
0.5289272, 0.05112027, 1.392763, 0.2117647, 0, 1, 1,
0.5292044, 0.354961, -0.2562892, 0.2196078, 0, 1, 1,
0.5298069, -0.06637984, 1.344996, 0.2235294, 0, 1, 1,
0.5312198, -0.6540442, 3.222215, 0.2313726, 0, 1, 1,
0.5346065, 0.3261715, 1.208487, 0.2352941, 0, 1, 1,
0.5372164, 0.1489856, 2.543375, 0.2431373, 0, 1, 1,
0.5376422, 0.2289467, 0.6753439, 0.2470588, 0, 1, 1,
0.538484, 1.274522, 0.4947435, 0.254902, 0, 1, 1,
0.5385908, 0.4015847, 1.339484, 0.2588235, 0, 1, 1,
0.545655, 0.2701736, 0.3189124, 0.2666667, 0, 1, 1,
0.5458736, -2.95193, 3.02626, 0.2705882, 0, 1, 1,
0.5478028, -0.5379297, 3.433433, 0.2784314, 0, 1, 1,
0.5481934, 0.2289986, 1.176935, 0.282353, 0, 1, 1,
0.5484061, -1.379243, 4.004357, 0.2901961, 0, 1, 1,
0.5518752, 0.1572805, 1.786435, 0.2941177, 0, 1, 1,
0.5579948, 0.2928442, 1.513575, 0.3019608, 0, 1, 1,
0.5584369, 0.3935707, 1.752711, 0.3098039, 0, 1, 1,
0.5602548, 0.3229961, 2.077992, 0.3137255, 0, 1, 1,
0.5611087, 0.3328877, 1.142899, 0.3215686, 0, 1, 1,
0.5647827, -0.2785251, 2.688585, 0.3254902, 0, 1, 1,
0.5703209, 0.1517483, 0.1298156, 0.3333333, 0, 1, 1,
0.5720655, -1.468459, 2.009926, 0.3372549, 0, 1, 1,
0.5722741, 0.5763789, 1.099503, 0.345098, 0, 1, 1,
0.5761421, -0.2630294, 3.175535, 0.3490196, 0, 1, 1,
0.577982, 1.239292, 0.7176626, 0.3568628, 0, 1, 1,
0.578382, -1.306284, 2.059009, 0.3607843, 0, 1, 1,
0.5841841, -0.7255479, 1.003767, 0.3686275, 0, 1, 1,
0.5850865, -0.3851877, 1.588401, 0.372549, 0, 1, 1,
0.5926641, -1.243524, 1.909802, 0.3803922, 0, 1, 1,
0.5948648, -0.09591118, 1.01726, 0.3843137, 0, 1, 1,
0.5970185, -0.3613769, 2.23179, 0.3921569, 0, 1, 1,
0.6010649, -1.304065, 1.991263, 0.3960784, 0, 1, 1,
0.6022844, 0.02132076, 2.219098, 0.4039216, 0, 1, 1,
0.6048683, -0.7389899, 2.403974, 0.4117647, 0, 1, 1,
0.6089855, 0.02981193, 1.244421, 0.4156863, 0, 1, 1,
0.6137764, -0.5166752, 3.687523, 0.4235294, 0, 1, 1,
0.6200059, -0.1586861, 1.950074, 0.427451, 0, 1, 1,
0.6227418, -0.08966999, 0.3358499, 0.4352941, 0, 1, 1,
0.6251877, 0.9454284, -0.1993363, 0.4392157, 0, 1, 1,
0.6253709, -0.1386487, 0.4212703, 0.4470588, 0, 1, 1,
0.6255938, -1.963869, 2.983241, 0.4509804, 0, 1, 1,
0.6292748, 1.435531, 0.5292988, 0.4588235, 0, 1, 1,
0.6317478, -0.5908938, 1.871836, 0.4627451, 0, 1, 1,
0.634834, 0.7453089, -0.2470154, 0.4705882, 0, 1, 1,
0.6373367, -0.4792728, 1.746538, 0.4745098, 0, 1, 1,
0.638359, 0.248987, 1.119764, 0.4823529, 0, 1, 1,
0.6391734, -0.5342643, 1.617405, 0.4862745, 0, 1, 1,
0.6404278, -0.1252598, 3.502861, 0.4941176, 0, 1, 1,
0.6430414, 0.877029, -1.280708, 0.5019608, 0, 1, 1,
0.6430929, -1.361102, 1.789726, 0.5058824, 0, 1, 1,
0.6553525, -1.33834, 3.328848, 0.5137255, 0, 1, 1,
0.6568282, -0.06619376, 0.7067083, 0.5176471, 0, 1, 1,
0.6569761, -0.4082257, 1.645928, 0.5254902, 0, 1, 1,
0.6583691, -0.1555157, 4.207717, 0.5294118, 0, 1, 1,
0.6584213, -0.5339271, 4.630797, 0.5372549, 0, 1, 1,
0.6606, -1.398641, 2.3356, 0.5411765, 0, 1, 1,
0.6651174, -1.395069, 4.075622, 0.5490196, 0, 1, 1,
0.670911, -0.7450232, 1.864444, 0.5529412, 0, 1, 1,
0.6753646, -0.3586626, 3.111854, 0.5607843, 0, 1, 1,
0.6840185, 1.269175, 0.229249, 0.5647059, 0, 1, 1,
0.6843317, -0.9143431, 2.798601, 0.572549, 0, 1, 1,
0.686944, 1.04815, 0.6999409, 0.5764706, 0, 1, 1,
0.68784, -1.835194, 3.20224, 0.5843138, 0, 1, 1,
0.6889735, -0.2304644, 1.788757, 0.5882353, 0, 1, 1,
0.690635, 0.5025267, -0.9552945, 0.5960785, 0, 1, 1,
0.6914657, -0.2110754, 1.194457, 0.6039216, 0, 1, 1,
0.6974332, 1.901569, 0.3822868, 0.6078432, 0, 1, 1,
0.7049741, 1.719361, 0.2879578, 0.6156863, 0, 1, 1,
0.7082571, -0.2559304, 2.507826, 0.6196079, 0, 1, 1,
0.7090793, 1.197667, -0.8457557, 0.627451, 0, 1, 1,
0.7095785, -0.2822922, 1.254213, 0.6313726, 0, 1, 1,
0.7125415, 1.41413, 0.3115092, 0.6392157, 0, 1, 1,
0.717203, 0.3002293, 0.3606517, 0.6431373, 0, 1, 1,
0.7175209, -1.184956, 2.286573, 0.6509804, 0, 1, 1,
0.7346978, 0.9328457, 0.8529047, 0.654902, 0, 1, 1,
0.7373021, 0.03065515, 0.4962511, 0.6627451, 0, 1, 1,
0.7386596, -0.7235873, 3.178651, 0.6666667, 0, 1, 1,
0.7405415, -0.08286305, 1.349166, 0.6745098, 0, 1, 1,
0.7435949, -0.9870789, 2.910492, 0.6784314, 0, 1, 1,
0.7500769, 1.047868, 1.152277, 0.6862745, 0, 1, 1,
0.7560755, 1.098336, 2.339896, 0.6901961, 0, 1, 1,
0.7563376, -1.411416, 2.510181, 0.6980392, 0, 1, 1,
0.7671149, 0.6877941, 0.7041632, 0.7058824, 0, 1, 1,
0.7683396, -0.1959197, 3.222596, 0.7098039, 0, 1, 1,
0.7693945, -0.6914414, 1.120466, 0.7176471, 0, 1, 1,
0.7874089, -0.03114149, 1.039231, 0.7215686, 0, 1, 1,
0.7910377, 0.8022708, 0.5772477, 0.7294118, 0, 1, 1,
0.7925074, -1.253508, 1.68171, 0.7333333, 0, 1, 1,
0.7994497, -0.2369152, 2.188743, 0.7411765, 0, 1, 1,
0.8022252, 0.999485, -0.8066924, 0.7450981, 0, 1, 1,
0.8101943, 0.681309, -0.3286495, 0.7529412, 0, 1, 1,
0.8129518, 0.8196546, 1.810293, 0.7568628, 0, 1, 1,
0.8136067, -0.9238272, 2.464362, 0.7647059, 0, 1, 1,
0.8144177, 1.439687, -0.4059563, 0.7686275, 0, 1, 1,
0.8170324, -0.744217, 1.9976, 0.7764706, 0, 1, 1,
0.8171217, -0.1464402, 0.2271102, 0.7803922, 0, 1, 1,
0.818467, 0.8028357, -0.3907089, 0.7882353, 0, 1, 1,
0.8187679, -0.7623163, 1.956572, 0.7921569, 0, 1, 1,
0.8189628, 0.3375677, 1.577543, 0.8, 0, 1, 1,
0.8232432, 0.9384623, 0.6732275, 0.8078431, 0, 1, 1,
0.8242497, -0.4901625, 1.963977, 0.8117647, 0, 1, 1,
0.8314714, -0.6918182, 0.70476, 0.8196079, 0, 1, 1,
0.8348655, 0.9739786, -0.3574702, 0.8235294, 0, 1, 1,
0.8385931, -0.2641466, 3.615741, 0.8313726, 0, 1, 1,
0.8389406, 1.29413, 0.881393, 0.8352941, 0, 1, 1,
0.8394212, 0.5724294, -0.8961464, 0.8431373, 0, 1, 1,
0.8399577, 0.4060163, -0.4687135, 0.8470588, 0, 1, 1,
0.8534353, 1.631016, -0.9143162, 0.854902, 0, 1, 1,
0.8635062, -0.351107, 2.836161, 0.8588235, 0, 1, 1,
0.8669732, 0.2849344, 0.6147873, 0.8666667, 0, 1, 1,
0.8679576, -0.0351069, 1.645604, 0.8705882, 0, 1, 1,
0.8702014, 0.8275791, 2.86005, 0.8784314, 0, 1, 1,
0.8707024, 0.9025062, -0.5988143, 0.8823529, 0, 1, 1,
0.8750931, -1.598402, 4.560354, 0.8901961, 0, 1, 1,
0.8773524, 0.4812977, 1.627821, 0.8941177, 0, 1, 1,
0.8788191, -0.06023422, 1.79027, 0.9019608, 0, 1, 1,
0.8812817, 0.3965503, 0.7407063, 0.9098039, 0, 1, 1,
0.8832097, 1.012897, 1.659966, 0.9137255, 0, 1, 1,
0.8832164, -0.08991517, 0.1143619, 0.9215686, 0, 1, 1,
0.8840955, 0.2537041, 0.9274265, 0.9254902, 0, 1, 1,
0.8891949, 0.5618539, 1.451929, 0.9333333, 0, 1, 1,
0.8906816, 0.7410826, 0.4557662, 0.9372549, 0, 1, 1,
0.8992227, -0.4351182, 3.717412, 0.945098, 0, 1, 1,
0.9043426, -1.592021, 3.299338, 0.9490196, 0, 1, 1,
0.9049857, -0.2777938, 2.492031, 0.9568627, 0, 1, 1,
0.906575, -1.756781, 1.934397, 0.9607843, 0, 1, 1,
0.9119838, -0.5946576, 2.229439, 0.9686275, 0, 1, 1,
0.9322191, -0.5290172, 2.215656, 0.972549, 0, 1, 1,
0.9345573, 1.005152, 2.458637, 0.9803922, 0, 1, 1,
0.95004, -1.029034, 1.297828, 0.9843137, 0, 1, 1,
0.958276, -0.4493337, 1.251832, 0.9921569, 0, 1, 1,
0.9630119, -0.3263295, 1.415841, 0.9960784, 0, 1, 1,
0.9680502, 0.2644568, 0.3087102, 1, 0, 0.9960784, 1,
0.977706, 0.6563117, -1.372127, 1, 0, 0.9882353, 1,
0.9810313, 0.1247117, 1.732604, 1, 0, 0.9843137, 1,
0.9848202, -1.38231, 2.847926, 1, 0, 0.9764706, 1,
0.9850575, 0.03928525, 1.05348, 1, 0, 0.972549, 1,
0.9932815, 0.2805038, 3.247556, 1, 0, 0.9647059, 1,
0.99472, 1.731242, -1.005358, 1, 0, 0.9607843, 1,
0.9984115, 1.326182, -0.59058, 1, 0, 0.9529412, 1,
1.000025, 0.7090356, -1.172884, 1, 0, 0.9490196, 1,
1.004834, -0.7999018, 3.036481, 1, 0, 0.9411765, 1,
1.006333, 1.109248, -0.2595496, 1, 0, 0.9372549, 1,
1.006607, 0.2049816, 2.646179, 1, 0, 0.9294118, 1,
1.009611, 0.5941985, 2.622676, 1, 0, 0.9254902, 1,
1.009733, 0.3309358, 1.103355, 1, 0, 0.9176471, 1,
1.017715, 0.6288404, 0.4466807, 1, 0, 0.9137255, 1,
1.019714, 0.20121, 1.635326, 1, 0, 0.9058824, 1,
1.021125, -0.7496517, 3.204607, 1, 0, 0.9019608, 1,
1.026511, -0.6746137, 2.266435, 1, 0, 0.8941177, 1,
1.026682, 0.3096902, 1.923141, 1, 0, 0.8862745, 1,
1.028069, -1.463412, 2.620116, 1, 0, 0.8823529, 1,
1.02951, 0.01891667, 0.7493432, 1, 0, 0.8745098, 1,
1.03033, 1.718249, -0.430404, 1, 0, 0.8705882, 1,
1.034104, -0.8798456, 2.650053, 1, 0, 0.8627451, 1,
1.034407, 0.7781461, -1.101276, 1, 0, 0.8588235, 1,
1.040936, -0.5337532, 0.7491869, 1, 0, 0.8509804, 1,
1.052539, -0.2395622, 0.7474439, 1, 0, 0.8470588, 1,
1.054778, -0.9160011, 2.100546, 1, 0, 0.8392157, 1,
1.055348, 0.4763841, 0.855023, 1, 0, 0.8352941, 1,
1.061029, -0.9254129, 1.895281, 1, 0, 0.827451, 1,
1.061038, -0.8129042, -0.3769719, 1, 0, 0.8235294, 1,
1.077775, 0.9569153, 0.3894127, 1, 0, 0.8156863, 1,
1.085979, -0.1183581, 1.883353, 1, 0, 0.8117647, 1,
1.086599, -0.4215179, 1.52425, 1, 0, 0.8039216, 1,
1.09334, -1.186933, 0.8910318, 1, 0, 0.7960784, 1,
1.096634, 0.3194246, 1.542683, 1, 0, 0.7921569, 1,
1.097845, 1.322609, -1.06389, 1, 0, 0.7843137, 1,
1.098338, 1.648473, 0.2591307, 1, 0, 0.7803922, 1,
1.113455, 0.3034174, 1.199411, 1, 0, 0.772549, 1,
1.118887, -0.008015185, 0.5670781, 1, 0, 0.7686275, 1,
1.120931, 1.565124, 0.5776056, 1, 0, 0.7607843, 1,
1.126369, -1.403571, 1.853326, 1, 0, 0.7568628, 1,
1.127465, 0.1784157, 0.1544457, 1, 0, 0.7490196, 1,
1.130655, -0.3862575, 0.8198428, 1, 0, 0.7450981, 1,
1.132614, -1.429335, 3.157555, 1, 0, 0.7372549, 1,
1.13743, -1.563853, 2.724721, 1, 0, 0.7333333, 1,
1.143278, -0.2277094, 3.017082, 1, 0, 0.7254902, 1,
1.152202, -1.52115, 2.739398, 1, 0, 0.7215686, 1,
1.153684, 0.0411897, 2.672174, 1, 0, 0.7137255, 1,
1.159129, -1.183242, 2.939108, 1, 0, 0.7098039, 1,
1.159156, -0.9750873, 1.719031, 1, 0, 0.7019608, 1,
1.167729, -0.9525884, 0.9498506, 1, 0, 0.6941177, 1,
1.169221, -1.239026, 2.404541, 1, 0, 0.6901961, 1,
1.184254, -1.068724, 1.875879, 1, 0, 0.682353, 1,
1.186978, 0.5756297, -0.04130761, 1, 0, 0.6784314, 1,
1.199097, 1.714132, 1.098922, 1, 0, 0.6705883, 1,
1.202675, -0.4178141, -0.6457995, 1, 0, 0.6666667, 1,
1.204764, 0.3022544, 0.5026827, 1, 0, 0.6588235, 1,
1.213957, -0.5613532, 0.592513, 1, 0, 0.654902, 1,
1.226589, -0.210597, 1.370187, 1, 0, 0.6470588, 1,
1.229013, -1.078448, 2.774311, 1, 0, 0.6431373, 1,
1.236536, -0.455476, 3.317535, 1, 0, 0.6352941, 1,
1.23718, 0.831331, -0.4324898, 1, 0, 0.6313726, 1,
1.240771, 0.6889563, 1.402267, 1, 0, 0.6235294, 1,
1.251021, -1.668308, 1.837012, 1, 0, 0.6196079, 1,
1.252115, 0.6098263, -1.144045, 1, 0, 0.6117647, 1,
1.260975, 1.81726, -0.0512481, 1, 0, 0.6078432, 1,
1.26916, -1.996212, 5.802495, 1, 0, 0.6, 1,
1.274219, -0.2897131, 1.175869, 1, 0, 0.5921569, 1,
1.276551, 1.009717, 2.481578, 1, 0, 0.5882353, 1,
1.28655, -0.1713401, 0.9160357, 1, 0, 0.5803922, 1,
1.292973, -1.868455, 3.389316, 1, 0, 0.5764706, 1,
1.301618, -1.133882, 3.78567, 1, 0, 0.5686275, 1,
1.303705, -1.90448, 3.728825, 1, 0, 0.5647059, 1,
1.313084, -1.612722, 2.673611, 1, 0, 0.5568628, 1,
1.321049, 1.362534, -0.7225242, 1, 0, 0.5529412, 1,
1.321851, -0.02697367, 1.502379, 1, 0, 0.5450981, 1,
1.324016, -0.4293218, 1.423767, 1, 0, 0.5411765, 1,
1.328816, -0.04261899, 0.1628668, 1, 0, 0.5333334, 1,
1.335773, 0.4542318, 1.413536, 1, 0, 0.5294118, 1,
1.342039, 0.5796459, 1.237813, 1, 0, 0.5215687, 1,
1.344654, -0.5985171, 1.677728, 1, 0, 0.5176471, 1,
1.360318, 0.9078907, 1.289508, 1, 0, 0.509804, 1,
1.362311, -1.279935, 0.5699773, 1, 0, 0.5058824, 1,
1.369022, 0.04866188, 1.100776, 1, 0, 0.4980392, 1,
1.370605, 1.059367, 1.274404, 1, 0, 0.4901961, 1,
1.376352, 0.06129266, 2.816658, 1, 0, 0.4862745, 1,
1.376667, -0.3916618, 1.920539, 1, 0, 0.4784314, 1,
1.391149, 0.5681044, 0.8011189, 1, 0, 0.4745098, 1,
1.395836, -1.482874, 1.982852, 1, 0, 0.4666667, 1,
1.403376, 0.511314, 2.057948, 1, 0, 0.4627451, 1,
1.404682, 1.681916, 0.3426516, 1, 0, 0.454902, 1,
1.414344, 0.4376783, 2.428055, 1, 0, 0.4509804, 1,
1.424518, -0.3270796, 2.36936, 1, 0, 0.4431373, 1,
1.439291, 0.07542986, 2.998343, 1, 0, 0.4392157, 1,
1.444841, -0.7134912, 2.107283, 1, 0, 0.4313726, 1,
1.448084, 1.178824, -0.1414582, 1, 0, 0.427451, 1,
1.451196, 1.814574, 2.189878, 1, 0, 0.4196078, 1,
1.459347, 0.4262596, 1.815404, 1, 0, 0.4156863, 1,
1.473936, -0.5174733, 1.724692, 1, 0, 0.4078431, 1,
1.477239, 0.4027606, 1.958206, 1, 0, 0.4039216, 1,
1.485908, -2.010937, 2.401256, 1, 0, 0.3960784, 1,
1.501663, 0.5393047, 1.238426, 1, 0, 0.3882353, 1,
1.515878, -0.1729872, 1.082791, 1, 0, 0.3843137, 1,
1.517961, -0.4938708, 0.4800797, 1, 0, 0.3764706, 1,
1.519828, -1.534331, 2.469457, 1, 0, 0.372549, 1,
1.525363, -0.9792837, 3.571742, 1, 0, 0.3647059, 1,
1.53927, -0.3892001, 2.669112, 1, 0, 0.3607843, 1,
1.557123, -0.3588334, 3.343183, 1, 0, 0.3529412, 1,
1.563398, -0.5636221, 2.223203, 1, 0, 0.3490196, 1,
1.566312, -0.1457395, 2.438725, 1, 0, 0.3411765, 1,
1.57252, -1.506716, 3.244581, 1, 0, 0.3372549, 1,
1.572874, -2.02278, 0.1946889, 1, 0, 0.3294118, 1,
1.576805, -1.353032, 2.654604, 1, 0, 0.3254902, 1,
1.579324, -0.9479752, 0.5167375, 1, 0, 0.3176471, 1,
1.582572, 0.5045248, 2.377458, 1, 0, 0.3137255, 1,
1.588361, 0.5330473, 0.5507029, 1, 0, 0.3058824, 1,
1.599756, 0.3708656, 0.9663368, 1, 0, 0.2980392, 1,
1.604237, -1.222896, 1.022787, 1, 0, 0.2941177, 1,
1.607965, -0.4738394, 2.632675, 1, 0, 0.2862745, 1,
1.610096, -1.233543, 2.976573, 1, 0, 0.282353, 1,
1.619607, 0.7224187, 0.352226, 1, 0, 0.2745098, 1,
1.629375, 0.1375159, 2.084741, 1, 0, 0.2705882, 1,
1.642116, 0.1776694, 3.336221, 1, 0, 0.2627451, 1,
1.645459, 0.3706867, 1.188085, 1, 0, 0.2588235, 1,
1.652331, 1.193591, 2.057816, 1, 0, 0.2509804, 1,
1.656956, -0.5600567, 1.794444, 1, 0, 0.2470588, 1,
1.661931, 0.676084, 1.278426, 1, 0, 0.2392157, 1,
1.664176, -0.644347, 2.969494, 1, 0, 0.2352941, 1,
1.687874, 0.770717, 1.854179, 1, 0, 0.227451, 1,
1.696958, 0.03774158, 2.015512, 1, 0, 0.2235294, 1,
1.698377, 0.7050468, -0.7454618, 1, 0, 0.2156863, 1,
1.744825, 0.2963932, 1.795599, 1, 0, 0.2117647, 1,
1.760568, -0.8147788, 0.8709876, 1, 0, 0.2039216, 1,
1.770294, 0.2489113, 0.5253763, 1, 0, 0.1960784, 1,
1.804597, -0.5915903, 2.748072, 1, 0, 0.1921569, 1,
1.828374, 1.759214, 1.202451, 1, 0, 0.1843137, 1,
1.839845, 0.1935271, 1.495376, 1, 0, 0.1803922, 1,
1.840461, 2.475929, 1.55409, 1, 0, 0.172549, 1,
1.919896, -0.8121781, 1.784856, 1, 0, 0.1686275, 1,
1.923429, 1.356867, 1.890938, 1, 0, 0.1607843, 1,
1.925143, -0.5962917, 2.559021, 1, 0, 0.1568628, 1,
1.927299, 0.9259604, 1.377269, 1, 0, 0.1490196, 1,
1.935036, 0.2075644, 0.9057764, 1, 0, 0.145098, 1,
2.025419, 0.8207742, 0.5639215, 1, 0, 0.1372549, 1,
2.028858, 0.04301841, 1.597205, 1, 0, 0.1333333, 1,
2.060198, 2.689591, 1.544274, 1, 0, 0.1254902, 1,
2.088969, 1.406593, 3.83974, 1, 0, 0.1215686, 1,
2.097956, -0.4919672, 2.665684, 1, 0, 0.1137255, 1,
2.111997, -2.254834, 2.975309, 1, 0, 0.1098039, 1,
2.139862, 1.102977, -0.05178668, 1, 0, 0.1019608, 1,
2.143368, 0.5770004, 1.63485, 1, 0, 0.09411765, 1,
2.274271, 2.062144, 0.1110969, 1, 0, 0.09019608, 1,
2.275056, -1.362295, 3.237242, 1, 0, 0.08235294, 1,
2.28767, -1.53817, 1.212685, 1, 0, 0.07843138, 1,
2.291141, 0.9253396, 2.607506, 1, 0, 0.07058824, 1,
2.383766, 0.1493905, 1.284695, 1, 0, 0.06666667, 1,
2.394716, 1.498621, 1.446409, 1, 0, 0.05882353, 1,
2.401975, -0.009045645, 0.8929199, 1, 0, 0.05490196, 1,
2.440701, 0.02459514, 0.4342439, 1, 0, 0.04705882, 1,
2.548979, -0.1647239, 2.926416, 1, 0, 0.04313726, 1,
2.560155, -0.3053955, 0.2480198, 1, 0, 0.03529412, 1,
2.576929, -0.3003651, 0.1493523, 1, 0, 0.03137255, 1,
2.586178, 1.321915, 1.455477, 1, 0, 0.02352941, 1,
2.736991, -0.8199167, 2.776051, 1, 0, 0.01960784, 1,
2.763586, -0.04857699, 2.835598, 1, 0, 0.01176471, 1,
2.829827, -0.2983339, 1.116905, 1, 0, 0.007843138, 1
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
-0.2767369, -4.201179, -6.883748, 0, -0.5, 0.5, 0.5,
-0.2767369, -4.201179, -6.883748, 1, -0.5, 0.5, 0.5,
-0.2767369, -4.201179, -6.883748, 1, 1.5, 0.5, 0.5,
-0.2767369, -4.201179, -6.883748, 0, 1.5, 0.5, 0.5
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
-4.436425, -0.254305, -6.883748, 0, -0.5, 0.5, 0.5,
-4.436425, -0.254305, -6.883748, 1, -0.5, 0.5, 0.5,
-4.436425, -0.254305, -6.883748, 1, 1.5, 0.5, 0.5,
-4.436425, -0.254305, -6.883748, 0, 1.5, 0.5, 0.5
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
-4.436425, -4.201179, 0.3787057, 0, -0.5, 0.5, 0.5,
-4.436425, -4.201179, 0.3787057, 1, -0.5, 0.5, 0.5,
-4.436425, -4.201179, 0.3787057, 1, 1.5, 0.5, 0.5,
-4.436425, -4.201179, 0.3787057, 0, 1.5, 0.5, 0.5
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
-3, -3.290362, -5.207797,
2, -3.290362, -5.207797,
-3, -3.290362, -5.207797,
-3, -3.442165, -5.487122,
-2, -3.290362, -5.207797,
-2, -3.442165, -5.487122,
-1, -3.290362, -5.207797,
-1, -3.442165, -5.487122,
0, -3.290362, -5.207797,
0, -3.442165, -5.487122,
1, -3.290362, -5.207797,
1, -3.442165, -5.487122,
2, -3.290362, -5.207797,
2, -3.442165, -5.487122
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
-3, -3.74577, -6.045772, 0, -0.5, 0.5, 0.5,
-3, -3.74577, -6.045772, 1, -0.5, 0.5, 0.5,
-3, -3.74577, -6.045772, 1, 1.5, 0.5, 0.5,
-3, -3.74577, -6.045772, 0, 1.5, 0.5, 0.5,
-2, -3.74577, -6.045772, 0, -0.5, 0.5, 0.5,
-2, -3.74577, -6.045772, 1, -0.5, 0.5, 0.5,
-2, -3.74577, -6.045772, 1, 1.5, 0.5, 0.5,
-2, -3.74577, -6.045772, 0, 1.5, 0.5, 0.5,
-1, -3.74577, -6.045772, 0, -0.5, 0.5, 0.5,
-1, -3.74577, -6.045772, 1, -0.5, 0.5, 0.5,
-1, -3.74577, -6.045772, 1, 1.5, 0.5, 0.5,
-1, -3.74577, -6.045772, 0, 1.5, 0.5, 0.5,
0, -3.74577, -6.045772, 0, -0.5, 0.5, 0.5,
0, -3.74577, -6.045772, 1, -0.5, 0.5, 0.5,
0, -3.74577, -6.045772, 1, 1.5, 0.5, 0.5,
0, -3.74577, -6.045772, 0, 1.5, 0.5, 0.5,
1, -3.74577, -6.045772, 0, -0.5, 0.5, 0.5,
1, -3.74577, -6.045772, 1, -0.5, 0.5, 0.5,
1, -3.74577, -6.045772, 1, 1.5, 0.5, 0.5,
1, -3.74577, -6.045772, 0, 1.5, 0.5, 0.5,
2, -3.74577, -6.045772, 0, -0.5, 0.5, 0.5,
2, -3.74577, -6.045772, 1, -0.5, 0.5, 0.5,
2, -3.74577, -6.045772, 1, 1.5, 0.5, 0.5,
2, -3.74577, -6.045772, 0, 1.5, 0.5, 0.5
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
-3.476497, -3, -5.207797,
-3.476497, 2, -5.207797,
-3.476497, -3, -5.207797,
-3.636485, -3, -5.487122,
-3.476497, -2, -5.207797,
-3.636485, -2, -5.487122,
-3.476497, -1, -5.207797,
-3.636485, -1, -5.487122,
-3.476497, 0, -5.207797,
-3.636485, 0, -5.487122,
-3.476497, 1, -5.207797,
-3.636485, 1, -5.487122,
-3.476497, 2, -5.207797,
-3.636485, 2, -5.487122
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
-3.956461, -3, -6.045772, 0, -0.5, 0.5, 0.5,
-3.956461, -3, -6.045772, 1, -0.5, 0.5, 0.5,
-3.956461, -3, -6.045772, 1, 1.5, 0.5, 0.5,
-3.956461, -3, -6.045772, 0, 1.5, 0.5, 0.5,
-3.956461, -2, -6.045772, 0, -0.5, 0.5, 0.5,
-3.956461, -2, -6.045772, 1, -0.5, 0.5, 0.5,
-3.956461, -2, -6.045772, 1, 1.5, 0.5, 0.5,
-3.956461, -2, -6.045772, 0, 1.5, 0.5, 0.5,
-3.956461, -1, -6.045772, 0, -0.5, 0.5, 0.5,
-3.956461, -1, -6.045772, 1, -0.5, 0.5, 0.5,
-3.956461, -1, -6.045772, 1, 1.5, 0.5, 0.5,
-3.956461, -1, -6.045772, 0, 1.5, 0.5, 0.5,
-3.956461, 0, -6.045772, 0, -0.5, 0.5, 0.5,
-3.956461, 0, -6.045772, 1, -0.5, 0.5, 0.5,
-3.956461, 0, -6.045772, 1, 1.5, 0.5, 0.5,
-3.956461, 0, -6.045772, 0, 1.5, 0.5, 0.5,
-3.956461, 1, -6.045772, 0, -0.5, 0.5, 0.5,
-3.956461, 1, -6.045772, 1, -0.5, 0.5, 0.5,
-3.956461, 1, -6.045772, 1, 1.5, 0.5, 0.5,
-3.956461, 1, -6.045772, 0, 1.5, 0.5, 0.5,
-3.956461, 2, -6.045772, 0, -0.5, 0.5, 0.5,
-3.956461, 2, -6.045772, 1, -0.5, 0.5, 0.5,
-3.956461, 2, -6.045772, 1, 1.5, 0.5, 0.5,
-3.956461, 2, -6.045772, 0, 1.5, 0.5, 0.5
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
-3.476497, -3.290362, -4,
-3.476497, -3.290362, 4,
-3.476497, -3.290362, -4,
-3.636485, -3.442165, -4,
-3.476497, -3.290362, -2,
-3.636485, -3.442165, -2,
-3.476497, -3.290362, 0,
-3.636485, -3.442165, 0,
-3.476497, -3.290362, 2,
-3.636485, -3.442165, 2,
-3.476497, -3.290362, 4,
-3.636485, -3.442165, 4
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
-3.956461, -3.74577, -4, 0, -0.5, 0.5, 0.5,
-3.956461, -3.74577, -4, 1, -0.5, 0.5, 0.5,
-3.956461, -3.74577, -4, 1, 1.5, 0.5, 0.5,
-3.956461, -3.74577, -4, 0, 1.5, 0.5, 0.5,
-3.956461, -3.74577, -2, 0, -0.5, 0.5, 0.5,
-3.956461, -3.74577, -2, 1, -0.5, 0.5, 0.5,
-3.956461, -3.74577, -2, 1, 1.5, 0.5, 0.5,
-3.956461, -3.74577, -2, 0, 1.5, 0.5, 0.5,
-3.956461, -3.74577, 0, 0, -0.5, 0.5, 0.5,
-3.956461, -3.74577, 0, 1, -0.5, 0.5, 0.5,
-3.956461, -3.74577, 0, 1, 1.5, 0.5, 0.5,
-3.956461, -3.74577, 0, 0, 1.5, 0.5, 0.5,
-3.956461, -3.74577, 2, 0, -0.5, 0.5, 0.5,
-3.956461, -3.74577, 2, 1, -0.5, 0.5, 0.5,
-3.956461, -3.74577, 2, 1, 1.5, 0.5, 0.5,
-3.956461, -3.74577, 2, 0, 1.5, 0.5, 0.5,
-3.956461, -3.74577, 4, 0, -0.5, 0.5, 0.5,
-3.956461, -3.74577, 4, 1, -0.5, 0.5, 0.5,
-3.956461, -3.74577, 4, 1, 1.5, 0.5, 0.5,
-3.956461, -3.74577, 4, 0, 1.5, 0.5, 0.5
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
-3.476497, -3.290362, -5.207797,
-3.476497, 2.781752, -5.207797,
-3.476497, -3.290362, 5.965208,
-3.476497, 2.781752, 5.965208,
-3.476497, -3.290362, -5.207797,
-3.476497, -3.290362, 5.965208,
-3.476497, 2.781752, -5.207797,
-3.476497, 2.781752, 5.965208,
-3.476497, -3.290362, -5.207797,
2.923023, -3.290362, -5.207797,
-3.476497, -3.290362, 5.965208,
2.923023, -3.290362, 5.965208,
-3.476497, 2.781752, -5.207797,
2.923023, 2.781752, -5.207797,
-3.476497, 2.781752, 5.965208,
2.923023, 2.781752, 5.965208,
2.923023, -3.290362, -5.207797,
2.923023, 2.781752, -5.207797,
2.923023, -3.290362, 5.965208,
2.923023, 2.781752, 5.965208,
2.923023, -3.290362, -5.207797,
2.923023, -3.290362, 5.965208,
2.923023, 2.781752, -5.207797,
2.923023, 2.781752, 5.965208
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
var radius = 7.601687;
var distance = 33.82076;
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
mvMatrix.translate( 0.2767369, 0.254305, -0.3787057 );
mvMatrix.scale( 1.284329, 1.35358, 0.7356206 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.82076);
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
Triadimenol<-read.table("Triadimenol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Triadimenol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Triadimenol' not found
```

```r
y<-Triadimenol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Triadimenol' not found
```

```r
z<-Triadimenol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Triadimenol' not found
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
-3.3833, -0.9592774, -1.55495, 0, 0, 1, 1, 1,
-3.304556, -0.09151469, -0.3765519, 1, 0, 0, 1, 1,
-3.170559, -2.926484, -2.029555, 1, 0, 0, 1, 1,
-2.860714, -0.8538616, -1.30859, 1, 0, 0, 1, 1,
-2.556463, -0.249869, -2.102513, 1, 0, 0, 1, 1,
-2.530583, -1.224977, -1.978606, 1, 0, 0, 1, 1,
-2.515452, -0.1127212, -0.1251783, 0, 0, 0, 1, 1,
-2.474754, 0.9580961, -2.519157, 0, 0, 0, 1, 1,
-2.457249, 0.7325861, -1.395809, 0, 0, 0, 1, 1,
-2.43056, 0.5452238, 0.8332899, 0, 0, 0, 1, 1,
-2.42935, 0.6264902, 0.1285269, 0, 0, 0, 1, 1,
-2.392715, 2.693323, -0.0455735, 0, 0, 0, 1, 1,
-2.391593, -1.556243, -1.253735, 0, 0, 0, 1, 1,
-2.361665, -0.4944682, -0.74357, 1, 1, 1, 1, 1,
-2.334942, -0.02245514, -0.1502691, 1, 1, 1, 1, 1,
-2.293479, -0.3041023, -2.548826, 1, 1, 1, 1, 1,
-2.267242, 0.4187215, -1.485376, 1, 1, 1, 1, 1,
-2.200683, 0.2733238, -1.088317, 1, 1, 1, 1, 1,
-2.194777, -0.1854664, -0.8175084, 1, 1, 1, 1, 1,
-2.158859, 0.1869263, -1.328499, 1, 1, 1, 1, 1,
-2.097765, -0.1258972, -1.637033, 1, 1, 1, 1, 1,
-2.044212, -1.885156, -1.948532, 1, 1, 1, 1, 1,
-2.026591, -1.204816, -2.00975, 1, 1, 1, 1, 1,
-2.009834, 1.014532, -1.252439, 1, 1, 1, 1, 1,
-1.994044, 1.225828, 0.441, 1, 1, 1, 1, 1,
-1.983012, -0.5735249, -1.293744, 1, 1, 1, 1, 1,
-1.954326, 0.3318483, -1.685088, 1, 1, 1, 1, 1,
-1.946593, -1.299073, -2.406959, 1, 1, 1, 1, 1,
-1.935676, -1.905986, -1.60089, 0, 0, 1, 1, 1,
-1.907659, -0.5297312, -2.036923, 1, 0, 0, 1, 1,
-1.880058, -2.439304, -1.657034, 1, 0, 0, 1, 1,
-1.879165, 1.033654, -0.5418338, 1, 0, 0, 1, 1,
-1.854613, 1.117933, 0.5406688, 1, 0, 0, 1, 1,
-1.846846, -1.177701, -1.503212, 1, 0, 0, 1, 1,
-1.815379, 1.027941, -0.1389306, 0, 0, 0, 1, 1,
-1.795313, 0.8611234, -0.996942, 0, 0, 0, 1, 1,
-1.784018, -0.1391116, -1.035204, 0, 0, 0, 1, 1,
-1.768976, -0.7292055, -1.687917, 0, 0, 0, 1, 1,
-1.749327, -0.1692313, -0.3775341, 0, 0, 0, 1, 1,
-1.744374, 0.9618345, -1.216136, 0, 0, 0, 1, 1,
-1.737236, -0.589379, -3.118128, 0, 0, 0, 1, 1,
-1.724616, 0.8467145, -1.159253, 1, 1, 1, 1, 1,
-1.717076, 0.7893603, 0.3995306, 1, 1, 1, 1, 1,
-1.701908, -0.3396562, -0.7091899, 1, 1, 1, 1, 1,
-1.678554, 0.4497613, -0.4331638, 1, 1, 1, 1, 1,
-1.675324, 0.9275878, -0.8678694, 1, 1, 1, 1, 1,
-1.672645, 0.1296341, -2.410419, 1, 1, 1, 1, 1,
-1.66823, 0.6488907, -0.7630208, 1, 1, 1, 1, 1,
-1.656649, 0.8328627, -1.622152, 1, 1, 1, 1, 1,
-1.630257, 1.966377, 0.7487239, 1, 1, 1, 1, 1,
-1.613152, -0.5465636, -1.714355, 1, 1, 1, 1, 1,
-1.605266, 0.3341397, -2.50097, 1, 1, 1, 1, 1,
-1.604571, -0.5829148, -1.404007, 1, 1, 1, 1, 1,
-1.603204, 0.07888547, -0.5875214, 1, 1, 1, 1, 1,
-1.596348, 0.5866673, -4.216506, 1, 1, 1, 1, 1,
-1.59206, 0.2259055, -2.262653, 1, 1, 1, 1, 1,
-1.584165, 0.7876236, -0.01115459, 0, 0, 1, 1, 1,
-1.576919, -0.9282404, -0.07147988, 1, 0, 0, 1, 1,
-1.57141, 1.185058, -0.1304157, 1, 0, 0, 1, 1,
-1.571138, -1.525743, -1.47867, 1, 0, 0, 1, 1,
-1.555549, 0.3482516, -1.647243, 1, 0, 0, 1, 1,
-1.550799, -0.1717808, -2.332685, 1, 0, 0, 1, 1,
-1.548519, 1.443861, -0.6452786, 0, 0, 0, 1, 1,
-1.547644, -1.796907, -2.27886, 0, 0, 0, 1, 1,
-1.543446, -2.583816, -3.314328, 0, 0, 0, 1, 1,
-1.537685, 1.383121, -2.462474, 0, 0, 0, 1, 1,
-1.528185, -1.020502, -0.9816434, 0, 0, 0, 1, 1,
-1.527328, 0.4148575, -1.594808, 0, 0, 0, 1, 1,
-1.500046, 1.407762, -1.420137, 0, 0, 0, 1, 1,
-1.496878, 1.22709, 0.2906158, 1, 1, 1, 1, 1,
-1.491874, 1.238803, -0.3196791, 1, 1, 1, 1, 1,
-1.485235, 0.546394, -1.520612, 1, 1, 1, 1, 1,
-1.477601, 0.7010806, -0.009056751, 1, 1, 1, 1, 1,
-1.47051, -1.691726, -1.544434, 1, 1, 1, 1, 1,
-1.46388, -1.854791, -3.45389, 1, 1, 1, 1, 1,
-1.463634, 1.083572, -0.01213543, 1, 1, 1, 1, 1,
-1.460924, 1.492568, -1.419381, 1, 1, 1, 1, 1,
-1.458612, -0.6352054, -1.338903, 1, 1, 1, 1, 1,
-1.457422, 0.770345, -0.7863103, 1, 1, 1, 1, 1,
-1.456665, -0.7441247, 0.1088609, 1, 1, 1, 1, 1,
-1.439883, 1.551137, 0.2750351, 1, 1, 1, 1, 1,
-1.439024, -0.5415153, -2.916746, 1, 1, 1, 1, 1,
-1.433127, 0.8059654, -1.352742, 1, 1, 1, 1, 1,
-1.429349, 1.384228, -2.336541, 1, 1, 1, 1, 1,
-1.4244, -0.4206444, -1.889653, 0, 0, 1, 1, 1,
-1.40983, 0.03198815, -2.727903, 1, 0, 0, 1, 1,
-1.406254, -0.9120209, -2.745442, 1, 0, 0, 1, 1,
-1.39261, 0.7126467, -0.1015806, 1, 0, 0, 1, 1,
-1.388619, -0.05848544, -0.8537386, 1, 0, 0, 1, 1,
-1.382733, -1.401861, -3.509003, 1, 0, 0, 1, 1,
-1.370865, -0.5592929, -1.792205, 0, 0, 0, 1, 1,
-1.343621, -1.136065, -1.386194, 0, 0, 0, 1, 1,
-1.327327, -1.254761, -1.682835, 0, 0, 0, 1, 1,
-1.321829, 0.6972957, -1.715597, 0, 0, 0, 1, 1,
-1.319054, 0.1758102, -1.585615, 0, 0, 0, 1, 1,
-1.317598, -0.4146659, -0.8808632, 0, 0, 0, 1, 1,
-1.312151, 1.564118, -0.249918, 0, 0, 0, 1, 1,
-1.311293, -0.9481351, -2.016329, 1, 1, 1, 1, 1,
-1.305981, -0.01847014, -1.466674, 1, 1, 1, 1, 1,
-1.304199, 0.04226078, -1.518497, 1, 1, 1, 1, 1,
-1.298486, 0.1740969, -1.73202, 1, 1, 1, 1, 1,
-1.294798, 1.405749, -1.977724, 1, 1, 1, 1, 1,
-1.286289, 0.223035, -0.3919981, 1, 1, 1, 1, 1,
-1.279401, -1.027332, -0.003581653, 1, 1, 1, 1, 1,
-1.275052, -0.1631907, -3.511225, 1, 1, 1, 1, 1,
-1.269927, 0.5438878, -1.950574, 1, 1, 1, 1, 1,
-1.259509, -0.0246315, -3.361466, 1, 1, 1, 1, 1,
-1.255385, 0.5284129, 0.005919293, 1, 1, 1, 1, 1,
-1.222825, -2.669155, -2.532409, 1, 1, 1, 1, 1,
-1.222267, -0.5952736, -1.810263, 1, 1, 1, 1, 1,
-1.222053, 0.6322392, -0.3136663, 1, 1, 1, 1, 1,
-1.210819, -1.000039, -1.730355, 1, 1, 1, 1, 1,
-1.197661, -0.1746279, -1.065711, 0, 0, 1, 1, 1,
-1.19632, -0.303452, -0.5879935, 1, 0, 0, 1, 1,
-1.191071, 0.8759126, -0.5201162, 1, 0, 0, 1, 1,
-1.173618, 2.122146, -2.22822, 1, 0, 0, 1, 1,
-1.156364, 0.4266832, -1.394025, 1, 0, 0, 1, 1,
-1.155887, -0.1249323, -3.200705, 1, 0, 0, 1, 1,
-1.131156, 1.214991, -1.231597, 0, 0, 0, 1, 1,
-1.130917, -0.9922578, -2.07061, 0, 0, 0, 1, 1,
-1.125156, -0.6137093, -2.809417, 0, 0, 0, 1, 1,
-1.118663, -1.592452, -2.858342, 0, 0, 0, 1, 1,
-1.115243, 0.3109344, -1.636206, 0, 0, 0, 1, 1,
-1.114002, -0.5464209, -2.500251, 0, 0, 0, 1, 1,
-1.113549, -0.6238015, -1.59663, 0, 0, 0, 1, 1,
-1.112676, -0.6203625, -1.269599, 1, 1, 1, 1, 1,
-1.102416, 0.2763778, 0.2277791, 1, 1, 1, 1, 1,
-1.096204, -0.05091782, -2.139404, 1, 1, 1, 1, 1,
-1.093745, 0.3232953, -2.170476, 1, 1, 1, 1, 1,
-1.082257, 0.8232649, -1.399752, 1, 1, 1, 1, 1,
-1.080989, -0.08081599, -2.026101, 1, 1, 1, 1, 1,
-1.078584, 0.2164299, -1.805188, 1, 1, 1, 1, 1,
-1.075741, -1.512676, -2.416484, 1, 1, 1, 1, 1,
-1.070051, 0.05426301, -0.4273234, 1, 1, 1, 1, 1,
-1.068467, 0.4306581, -2.014393, 1, 1, 1, 1, 1,
-1.068128, -1.160211, -2.133328, 1, 1, 1, 1, 1,
-1.065357, -0.3836251, -1.578204, 1, 1, 1, 1, 1,
-1.053972, -1.226214, -3.286222, 1, 1, 1, 1, 1,
-1.052232, 0.7213592, -0.3392559, 1, 1, 1, 1, 1,
-1.051757, 0.2025284, 0.689254, 1, 1, 1, 1, 1,
-1.047948, -0.05805269, -0.3271982, 0, 0, 1, 1, 1,
-1.045627, 1.695723, -1.603703, 1, 0, 0, 1, 1,
-1.040392, 0.9069526, -1.459124, 1, 0, 0, 1, 1,
-1.033048, -0.8935513, -0.7305828, 1, 0, 0, 1, 1,
-1.030472, -0.6948186, -1.584983, 1, 0, 0, 1, 1,
-1.022785, -0.2685228, -0.1675619, 1, 0, 0, 1, 1,
-1.019982, -1.158802, -2.648106, 0, 0, 0, 1, 1,
-1.012879, 0.3107119, -2.72306, 0, 0, 0, 1, 1,
-1.006411, -1.755489, -2.083316, 0, 0, 0, 1, 1,
-0.9990115, -0.1877841, -0.06914668, 0, 0, 0, 1, 1,
-0.9985495, -0.2058342, -1.021856, 0, 0, 0, 1, 1,
-0.9984457, 1.080995, -1.335923, 0, 0, 0, 1, 1,
-0.991649, -0.3247947, -1.0325, 0, 0, 0, 1, 1,
-0.9855343, -1.045546, -0.9111464, 1, 1, 1, 1, 1,
-0.9853567, -0.3868925, -1.799499, 1, 1, 1, 1, 1,
-0.983626, -0.4041792, -1.636349, 1, 1, 1, 1, 1,
-0.9824941, 0.3906152, -0.3444508, 1, 1, 1, 1, 1,
-0.975625, 0.2802536, -2.001168, 1, 1, 1, 1, 1,
-0.9738356, 0.01302141, -1.857349, 1, 1, 1, 1, 1,
-0.9704057, 0.05692976, -2.5181, 1, 1, 1, 1, 1,
-0.9680611, -1.18102, -2.134931, 1, 1, 1, 1, 1,
-0.9631653, -1.748655, -3.132776, 1, 1, 1, 1, 1,
-0.9603926, -0.006178653, -2.280401, 1, 1, 1, 1, 1,
-0.958658, -0.2623985, -3.935759, 1, 1, 1, 1, 1,
-0.956835, -0.3625124, -3.195041, 1, 1, 1, 1, 1,
-0.9551145, 0.4357937, -0.6079547, 1, 1, 1, 1, 1,
-0.954841, 1.325734, -0.05536674, 1, 1, 1, 1, 1,
-0.9545524, 0.5741808, 0.9077795, 1, 1, 1, 1, 1,
-0.9542175, -0.2613512, -1.706843, 0, 0, 1, 1, 1,
-0.9351908, -1.044858, -3.6132, 1, 0, 0, 1, 1,
-0.9350633, 0.5408028, -2.582864, 1, 0, 0, 1, 1,
-0.9347077, -0.4760436, -4.097045, 1, 0, 0, 1, 1,
-0.9335515, 1.370102, 0.5813974, 1, 0, 0, 1, 1,
-0.9329281, -0.215824, 0.1225693, 1, 0, 0, 1, 1,
-0.9327819, 1.234394, 0.004896193, 0, 0, 0, 1, 1,
-0.9276761, 0.5209173, -1.924646, 0, 0, 0, 1, 1,
-0.9260892, -1.090946, 0.08313482, 0, 0, 0, 1, 1,
-0.9247339, -0.003267027, -2.435642, 0, 0, 0, 1, 1,
-0.9199476, 0.1196418, -0.996959, 0, 0, 0, 1, 1,
-0.9177087, -0.1831193, -0.1509214, 0, 0, 0, 1, 1,
-0.9044053, -0.914879, -1.88874, 0, 0, 0, 1, 1,
-0.8979968, 0.4252749, -0.4278527, 1, 1, 1, 1, 1,
-0.8952533, 0.3004711, -1.798373, 1, 1, 1, 1, 1,
-0.8806614, -0.5570638, -1.698431, 1, 1, 1, 1, 1,
-0.8804402, 1.08916, -2.418688, 1, 1, 1, 1, 1,
-0.8783354, 0.2767167, -1.641037, 1, 1, 1, 1, 1,
-0.8756366, 1.593875, -1.069586, 1, 1, 1, 1, 1,
-0.8666889, 0.647175, 0.4345675, 1, 1, 1, 1, 1,
-0.866649, 0.03052827, -1.48767, 1, 1, 1, 1, 1,
-0.8615688, 0.3159986, -1.258144, 1, 1, 1, 1, 1,
-0.8609629, 0.9334027, 0.8534982, 1, 1, 1, 1, 1,
-0.8513589, -0.4553639, -2.364663, 1, 1, 1, 1, 1,
-0.849807, 0.124048, -1.036908, 1, 1, 1, 1, 1,
-0.8445221, 1.268507, 0.2462254, 1, 1, 1, 1, 1,
-0.842872, -0.9827704, -2.832661, 1, 1, 1, 1, 1,
-0.8426032, -0.1924537, -2.542058, 1, 1, 1, 1, 1,
-0.8388216, -0.5426843, -1.803359, 0, 0, 1, 1, 1,
-0.8351033, 0.3577369, -0.2028542, 1, 0, 0, 1, 1,
-0.8337334, 1.299147, 0.3461241, 1, 0, 0, 1, 1,
-0.8310764, 1.571732, -0.6439857, 1, 0, 0, 1, 1,
-0.8305664, 1.005319, 0.1199052, 1, 0, 0, 1, 1,
-0.82984, -1.932755, -2.592936, 1, 0, 0, 1, 1,
-0.8296571, -0.9879708, -3.233331, 0, 0, 0, 1, 1,
-0.8222331, 1.572347, 1.439159, 0, 0, 0, 1, 1,
-0.8190914, 2.069448, -0.9049922, 0, 0, 0, 1, 1,
-0.811753, -1.646953, -2.951477, 0, 0, 0, 1, 1,
-0.8073168, 0.6933574, -1.668069, 0, 0, 0, 1, 1,
-0.7999045, -0.3704802, -2.684696, 0, 0, 0, 1, 1,
-0.7984692, 0.04059204, -2.385612, 0, 0, 0, 1, 1,
-0.7984603, 0.3560094, -1.46859, 1, 1, 1, 1, 1,
-0.7941091, -0.807057, -2.871131, 1, 1, 1, 1, 1,
-0.7930822, -0.585436, -2.359524, 1, 1, 1, 1, 1,
-0.7913951, 2.571802, -1.676771, 1, 1, 1, 1, 1,
-0.7833314, 1.509532, 0.342789, 1, 1, 1, 1, 1,
-0.7806903, 2.046603, -1.096801, 1, 1, 1, 1, 1,
-0.7805014, 0.582523, -1.518565, 1, 1, 1, 1, 1,
-0.7775656, -0.2402074, -1.079381, 1, 1, 1, 1, 1,
-0.7728136, 0.3340023, -0.6932675, 1, 1, 1, 1, 1,
-0.7715359, -1.410427, -2.304354, 1, 1, 1, 1, 1,
-0.7689156, -0.1677652, -1.936503, 1, 1, 1, 1, 1,
-0.7654242, -1.484886, -2.910607, 1, 1, 1, 1, 1,
-0.7638498, -0.4646895, -0.9162877, 1, 1, 1, 1, 1,
-0.7632552, -0.4010599, -2.587444, 1, 1, 1, 1, 1,
-0.7626109, -0.5771809, -1.012626, 1, 1, 1, 1, 1,
-0.7605503, 0.5093772, -0.5324692, 0, 0, 1, 1, 1,
-0.7563749, -0.3904815, -2.714219, 1, 0, 0, 1, 1,
-0.756303, 0.2862075, -2.730943, 1, 0, 0, 1, 1,
-0.7537587, -0.6930507, -2.516164, 1, 0, 0, 1, 1,
-0.7537075, 0.5216464, -1.005259, 1, 0, 0, 1, 1,
-0.7528612, -0.7288743, -0.6098137, 1, 0, 0, 1, 1,
-0.7486175, -0.4758032, -1.086722, 0, 0, 0, 1, 1,
-0.7467979, -0.3485219, -1.797397, 0, 0, 0, 1, 1,
-0.742354, -1.478631, -1.728525, 0, 0, 0, 1, 1,
-0.7417278, -0.115027, -2.850721, 0, 0, 0, 1, 1,
-0.7364659, 0.9441533, -0.7785551, 0, 0, 0, 1, 1,
-0.7307932, -0.8907263, -0.3367372, 0, 0, 0, 1, 1,
-0.7271631, 0.9849604, 0.9015229, 0, 0, 0, 1, 1,
-0.726481, -1.370704, -2.168497, 1, 1, 1, 1, 1,
-0.7257696, -0.6321455, -1.767891, 1, 1, 1, 1, 1,
-0.7224853, -1.857092, -2.913463, 1, 1, 1, 1, 1,
-0.7201231, 1.632872, 0.09339826, 1, 1, 1, 1, 1,
-0.7181887, -1.024942, -1.709165, 1, 1, 1, 1, 1,
-0.7140229, -1.369674, -3.702046, 1, 1, 1, 1, 1,
-0.7060766, 0.5838549, -3.319171, 1, 1, 1, 1, 1,
-0.7060446, 0.6618007, -1.566196, 1, 1, 1, 1, 1,
-0.7057226, 0.6092731, 0.0488444, 1, 1, 1, 1, 1,
-0.7012206, 0.765642, 0.1251114, 1, 1, 1, 1, 1,
-0.6984792, -0.9835413, -3.27372, 1, 1, 1, 1, 1,
-0.6974035, 0.3698784, -0.9036797, 1, 1, 1, 1, 1,
-0.6960643, -0.4984731, -2.839113, 1, 1, 1, 1, 1,
-0.6945494, -1.04532, -3.893209, 1, 1, 1, 1, 1,
-0.694168, -0.9042997, -0.7388313, 1, 1, 1, 1, 1,
-0.6934943, -1.272936, -2.308416, 0, 0, 1, 1, 1,
-0.6916801, 1.423353, -2.814435, 1, 0, 0, 1, 1,
-0.690875, -1.163708, -3.30655, 1, 0, 0, 1, 1,
-0.6898755, -0.5067774, -1.998018, 1, 0, 0, 1, 1,
-0.6889077, -1.506247, -3.24322, 1, 0, 0, 1, 1,
-0.688683, -0.2181068, -0.7666472, 1, 0, 0, 1, 1,
-0.6837595, -0.2014921, -2.566231, 0, 0, 0, 1, 1,
-0.6776888, -1.491117, -1.894909, 0, 0, 0, 1, 1,
-0.6733294, -0.5862799, -2.5577, 0, 0, 0, 1, 1,
-0.6725993, -0.4016798, -2.732127, 0, 0, 0, 1, 1,
-0.6724223, 0.07783598, -3.478719, 0, 0, 0, 1, 1,
-0.6656904, 1.821558, -0.05555882, 0, 0, 0, 1, 1,
-0.6627624, -1.90374, -2.443937, 0, 0, 0, 1, 1,
-0.661385, 0.4279941, -0.8578327, 1, 1, 1, 1, 1,
-0.6508595, -1.329707, -2.721859, 1, 1, 1, 1, 1,
-0.6370789, 1.252822, 0.1799411, 1, 1, 1, 1, 1,
-0.634211, 0.3546304, -0.7990848, 1, 1, 1, 1, 1,
-0.626619, 1.805614, 0.38152, 1, 1, 1, 1, 1,
-0.6256026, -0.941545, -2.50915, 1, 1, 1, 1, 1,
-0.6253417, 0.3118878, -0.6774454, 1, 1, 1, 1, 1,
-0.6242743, -0.4438099, -2.967682, 1, 1, 1, 1, 1,
-0.6239445, -1.773648, -0.8560662, 1, 1, 1, 1, 1,
-0.6194084, -0.1691517, -2.815567, 1, 1, 1, 1, 1,
-0.6187158, -1.187097, -1.093681, 1, 1, 1, 1, 1,
-0.6156025, 0.8471029, 0.305884, 1, 1, 1, 1, 1,
-0.6134036, -0.7965587, -1.780591, 1, 1, 1, 1, 1,
-0.610719, 1.612234, -3.179213, 1, 1, 1, 1, 1,
-0.6086931, -0.6876829, -1.375122, 1, 1, 1, 1, 1,
-0.6069924, -0.9154665, -0.9481224, 0, 0, 1, 1, 1,
-0.6026523, -0.2291235, -2.153604, 1, 0, 0, 1, 1,
-0.5982332, 0.2567457, -1.495883, 1, 0, 0, 1, 1,
-0.5936456, 0.6717719, -1.594499, 1, 0, 0, 1, 1,
-0.5908436, 1.177724, -0.8704243, 1, 0, 0, 1, 1,
-0.5885682, -0.3544453, -1.783127, 1, 0, 0, 1, 1,
-0.5841451, 0.170652, -1.927822, 0, 0, 0, 1, 1,
-0.5805666, -0.8312708, -2.926987, 0, 0, 0, 1, 1,
-0.5774243, -0.3002888, -0.6030989, 0, 0, 0, 1, 1,
-0.5754671, 0.1774261, -0.3997638, 0, 0, 0, 1, 1,
-0.5749657, -0.3383176, -3.291552, 0, 0, 0, 1, 1,
-0.5723495, -1.632307, -2.364629, 0, 0, 0, 1, 1,
-0.5702286, -0.6729294, -3.151002, 0, 0, 0, 1, 1,
-0.5692049, 0.9834139, 0.6095582, 1, 1, 1, 1, 1,
-0.5627149, -1.066066, -4.292318, 1, 1, 1, 1, 1,
-0.5614238, 1.140384, -0.7141963, 1, 1, 1, 1, 1,
-0.5577601, 2.076706, -1.147311, 1, 1, 1, 1, 1,
-0.5552089, 0.9614514, -1.441238, 1, 1, 1, 1, 1,
-0.5549808, 2.630278, -0.1242958, 1, 1, 1, 1, 1,
-0.5543817, 0.6483145, -1.930871, 1, 1, 1, 1, 1,
-0.5541534, 0.6677718, -3.527692, 1, 1, 1, 1, 1,
-0.5527376, -1.806789, -2.409362, 1, 1, 1, 1, 1,
-0.5514506, -0.7117591, -2.767004, 1, 1, 1, 1, 1,
-0.5505494, -0.2846369, -1.643557, 1, 1, 1, 1, 1,
-0.5502881, 0.5308961, -0.7859836, 1, 1, 1, 1, 1,
-0.5396139, -0.5950999, -2.114478, 1, 1, 1, 1, 1,
-0.5322919, -1.91898, -3.132634, 1, 1, 1, 1, 1,
-0.5314611, 1.690622, -1.389273, 1, 1, 1, 1, 1,
-0.5301483, -0.8593913, -3.203553, 0, 0, 1, 1, 1,
-0.5294092, -0.8370622, -3.552105, 1, 0, 0, 1, 1,
-0.5258654, 0.002408179, -0.654011, 1, 0, 0, 1, 1,
-0.5196195, -0.07562631, -3.353288, 1, 0, 0, 1, 1,
-0.5167728, 0.1188659, 0.277599, 1, 0, 0, 1, 1,
-0.5150639, 0.7778575, -2.040768, 1, 0, 0, 1, 1,
-0.5137228, -0.8111437, -2.371355, 0, 0, 0, 1, 1,
-0.5130296, -0.07291403, -2.383439, 0, 0, 0, 1, 1,
-0.5112032, -0.02610498, -2.151257, 0, 0, 0, 1, 1,
-0.5073618, 0.8503182, 1.410372, 0, 0, 0, 1, 1,
-0.5050291, -0.4854792, -3.687341, 0, 0, 0, 1, 1,
-0.5035508, -0.001000597, -2.339783, 0, 0, 0, 1, 1,
-0.5011591, 0.7398379, -0.3013551, 0, 0, 0, 1, 1,
-0.4988141, 0.9916326, -1.129016, 1, 1, 1, 1, 1,
-0.4986428, -0.4837633, -1.797671, 1, 1, 1, 1, 1,
-0.498534, 0.2068033, -0.9520243, 1, 1, 1, 1, 1,
-0.4948005, -0.8210087, -2.159046, 1, 1, 1, 1, 1,
-0.4927732, 1.034979, -0.6150842, 1, 1, 1, 1, 1,
-0.4862568, 1.525918, -1.154746, 1, 1, 1, 1, 1,
-0.4833553, -1.565638, -2.415936, 1, 1, 1, 1, 1,
-0.4781471, -2.78849, -2.364175, 1, 1, 1, 1, 1,
-0.4779543, 0.9976625, -0.4726738, 1, 1, 1, 1, 1,
-0.473685, -0.092646, -0.6874896, 1, 1, 1, 1, 1,
-0.4730248, 0.2537265, -0.7161035, 1, 1, 1, 1, 1,
-0.4689881, -0.4778045, -2.816555, 1, 1, 1, 1, 1,
-0.4600068, -0.3421621, -2.084178, 1, 1, 1, 1, 1,
-0.459034, -0.4413522, -2.592036, 1, 1, 1, 1, 1,
-0.4574721, -0.3269123, -3.171069, 1, 1, 1, 1, 1,
-0.4556742, -1.455279, -3.199704, 0, 0, 1, 1, 1,
-0.4540541, -0.5552784, -2.201803, 1, 0, 0, 1, 1,
-0.4477864, -0.1903035, -1.807787, 1, 0, 0, 1, 1,
-0.4461888, -0.7948132, -2.878284, 1, 0, 0, 1, 1,
-0.4413172, -0.3035404, -0.1179115, 1, 0, 0, 1, 1,
-0.4387836, -1.06412, -0.2745001, 1, 0, 0, 1, 1,
-0.437115, 0.01755412, -1.851347, 0, 0, 0, 1, 1,
-0.4303603, -0.6811619, -3.846487, 0, 0, 0, 1, 1,
-0.4295362, -0.7667667, -2.680863, 0, 0, 0, 1, 1,
-0.4293132, -0.4591593, -1.262138, 0, 0, 0, 1, 1,
-0.4284271, -0.3605302, -2.916417, 0, 0, 0, 1, 1,
-0.4258842, -0.7198759, -2.349503, 0, 0, 0, 1, 1,
-0.4239259, -1.309672, -3.811534, 0, 0, 0, 1, 1,
-0.4221693, 0.08917917, -1.513803, 1, 1, 1, 1, 1,
-0.4210747, 0.4377796, -0.7698251, 1, 1, 1, 1, 1,
-0.419298, -0.03200066, -1.32682, 1, 1, 1, 1, 1,
-0.419048, 1.966784, -1.64065, 1, 1, 1, 1, 1,
-0.4187833, -0.1759821, -2.086667, 1, 1, 1, 1, 1,
-0.4139718, 0.1064586, -2.249986, 1, 1, 1, 1, 1,
-0.411336, 1.509585, -1.480435, 1, 1, 1, 1, 1,
-0.4097511, -0.3195854, -1.317039, 1, 1, 1, 1, 1,
-0.4055077, -0.6689655, -2.514006, 1, 1, 1, 1, 1,
-0.4040492, 0.5536314, 0.09245423, 1, 1, 1, 1, 1,
-0.3974503, -0.7662483, -3.031948, 1, 1, 1, 1, 1,
-0.3955842, -0.2787204, -1.25041, 1, 1, 1, 1, 1,
-0.3939827, 0.2118867, -0.9417692, 1, 1, 1, 1, 1,
-0.3936668, 1.325727, 0.8864077, 1, 1, 1, 1, 1,
-0.375973, -0.2694881, -1.60959, 1, 1, 1, 1, 1,
-0.3733304, 1.338843, 0.1007507, 0, 0, 1, 1, 1,
-0.3720944, 1.045851, 0.07430658, 1, 0, 0, 1, 1,
-0.3649505, 0.3767331, -0.9598127, 1, 0, 0, 1, 1,
-0.3637931, 0.4829725, -0.7886486, 1, 0, 0, 1, 1,
-0.3628892, -0.7395958, -1.304632, 1, 0, 0, 1, 1,
-0.3596026, -1.027991, -3.986857, 1, 0, 0, 1, 1,
-0.3594179, -0.3652483, -1.202955, 0, 0, 0, 1, 1,
-0.34714, -1.181573, -2.600509, 0, 0, 0, 1, 1,
-0.3439498, -0.2818643, -3.206928, 0, 0, 0, 1, 1,
-0.3413257, 1.650673, 0.3277023, 0, 0, 0, 1, 1,
-0.3381049, 0.1004742, -0.9393811, 0, 0, 0, 1, 1,
-0.3376664, -0.09202988, -3.384272, 0, 0, 0, 1, 1,
-0.3362682, -0.2389889, -0.3812638, 0, 0, 0, 1, 1,
-0.3360052, -0.8866973, -1.971641, 1, 1, 1, 1, 1,
-0.335291, -0.1072605, -0.5624949, 1, 1, 1, 1, 1,
-0.332883, 1.983945, -0.5307042, 1, 1, 1, 1, 1,
-0.3255349, -0.03721872, -1.816189, 1, 1, 1, 1, 1,
-0.3230439, -0.6497446, -0.9426869, 1, 1, 1, 1, 1,
-0.3204934, -2.184494, -4.548722, 1, 1, 1, 1, 1,
-0.3187913, -1.45655, -1.94238, 1, 1, 1, 1, 1,
-0.3183739, -0.470295, -3.300715, 1, 1, 1, 1, 1,
-0.3183227, -0.9862244, -1.974467, 1, 1, 1, 1, 1,
-0.3174274, -3.201933, -3.532455, 1, 1, 1, 1, 1,
-0.3156107, 1.245909, 0.7759981, 1, 1, 1, 1, 1,
-0.3093999, 0.3530284, -1.331253, 1, 1, 1, 1, 1,
-0.3056875, 0.3232681, -1.774446, 1, 1, 1, 1, 1,
-0.3028302, -0.5296568, -3.127982, 1, 1, 1, 1, 1,
-0.2980307, -1.512111, -3.209588, 1, 1, 1, 1, 1,
-0.2957962, 0.1503599, -0.9019833, 0, 0, 1, 1, 1,
-0.2930276, 0.08723249, -0.4700507, 1, 0, 0, 1, 1,
-0.291897, 0.5381471, -0.1667545, 1, 0, 0, 1, 1,
-0.2902837, 0.7549896, -0.573762, 1, 0, 0, 1, 1,
-0.2880865, 0.2178787, -1.065808, 1, 0, 0, 1, 1,
-0.2877664, -0.4491012, -2.884101, 1, 0, 0, 1, 1,
-0.2868169, -1.131059, -2.230496, 0, 0, 0, 1, 1,
-0.2852538, 0.6937897, -0.5590324, 0, 0, 0, 1, 1,
-0.2829697, -0.7222615, -2.751768, 0, 0, 0, 1, 1,
-0.2730694, 0.1344426, -0.9835925, 0, 0, 0, 1, 1,
-0.2708989, -0.8419785, -3.476469, 0, 0, 0, 1, 1,
-0.2649193, 1.045945, 0.8077141, 0, 0, 0, 1, 1,
-0.262868, -0.4345767, -2.68327, 0, 0, 0, 1, 1,
-0.2607317, 1.795265, -1.81606, 1, 1, 1, 1, 1,
-0.2589572, 0.5235597, -0.3434996, 1, 1, 1, 1, 1,
-0.2580638, 2.111437, 0.03951468, 1, 1, 1, 1, 1,
-0.2530355, -0.9732603, -1.806052, 1, 1, 1, 1, 1,
-0.2494676, -0.6598115, -1.785847, 1, 1, 1, 1, 1,
-0.246683, -1.661592, -4.158015, 1, 1, 1, 1, 1,
-0.2378677, -0.5083252, -3.409269, 1, 1, 1, 1, 1,
-0.237416, 1.311083, -2.088897, 1, 1, 1, 1, 1,
-0.237315, 0.8605462, -0.5707498, 1, 1, 1, 1, 1,
-0.2342114, -0.3598188, -0.5195256, 1, 1, 1, 1, 1,
-0.2296886, 0.7124134, 0.5024111, 1, 1, 1, 1, 1,
-0.224012, -0.440675, -3.122395, 1, 1, 1, 1, 1,
-0.2238394, 0.6239349, -0.1788025, 1, 1, 1, 1, 1,
-0.2188805, -0.7931088, -3.188845, 1, 1, 1, 1, 1,
-0.2171658, 0.9400634, 0.3422759, 1, 1, 1, 1, 1,
-0.2169217, -0.03592382, -2.235731, 0, 0, 1, 1, 1,
-0.2160166, 0.3078453, -2.283544, 1, 0, 0, 1, 1,
-0.2086126, -0.901364, -2.938902, 1, 0, 0, 1, 1,
-0.2067971, -0.9756498, -2.638864, 1, 0, 0, 1, 1,
-0.2052962, 2.199966, 1.16491, 1, 0, 0, 1, 1,
-0.2039492, -0.0954867, -1.205882, 1, 0, 0, 1, 1,
-0.2029312, -1.842304, -3.215025, 0, 0, 0, 1, 1,
-0.1963681, 1.243153, 1.408851, 0, 0, 0, 1, 1,
-0.1898591, 0.8887232, -0.06007762, 0, 0, 0, 1, 1,
-0.1849266, -0.293191, -3.512453, 0, 0, 0, 1, 1,
-0.1845913, 1.83631, -0.3168336, 0, 0, 0, 1, 1,
-0.1835583, 0.583249, -2.83424, 0, 0, 0, 1, 1,
-0.1830221, 0.5027359, 1.379755, 0, 0, 0, 1, 1,
-0.1819973, 0.01850863, -0.8871886, 1, 1, 1, 1, 1,
-0.1811568, 1.1922, -0.2191643, 1, 1, 1, 1, 1,
-0.180374, 0.5890152, -0.6239374, 1, 1, 1, 1, 1,
-0.1799014, -0.6240264, -2.022393, 1, 1, 1, 1, 1,
-0.178794, 2.070873, 0.716665, 1, 1, 1, 1, 1,
-0.1786072, -0.3975502, -3.625822, 1, 1, 1, 1, 1,
-0.1768098, -0.737821, -2.934317, 1, 1, 1, 1, 1,
-0.175666, -0.1562232, -2.855013, 1, 1, 1, 1, 1,
-0.1724005, -0.4457127, -4.305464, 1, 1, 1, 1, 1,
-0.1719157, 0.1372899, -1.412573, 1, 1, 1, 1, 1,
-0.1710738, 0.4367118, -0.4074093, 1, 1, 1, 1, 1,
-0.1658987, 1.035055, 0.3235022, 1, 1, 1, 1, 1,
-0.1651968, 1.613636, -0.5484473, 1, 1, 1, 1, 1,
-0.1649326, -1.711302, -1.482622, 1, 1, 1, 1, 1,
-0.1635094, 0.5870777, -0.3512993, 1, 1, 1, 1, 1,
-0.1629877, -1.241278, -1.575116, 0, 0, 1, 1, 1,
-0.1612583, 1.169276, 1.7839, 1, 0, 0, 1, 1,
-0.1595109, -0.7638103, -1.94488, 1, 0, 0, 1, 1,
-0.1513221, -0.1273104, -3.372936, 1, 0, 0, 1, 1,
-0.1501283, -0.1219113, -1.420068, 1, 0, 0, 1, 1,
-0.1485348, 1.351884, -0.5951459, 1, 0, 0, 1, 1,
-0.1462847, -0.6535694, -3.18754, 0, 0, 0, 1, 1,
-0.1313896, 1.475992, -0.5114759, 0, 0, 0, 1, 1,
-0.1264896, 1.2476, -1.154283, 0, 0, 0, 1, 1,
-0.1229435, 0.2107006, 1.331944, 0, 0, 0, 1, 1,
-0.1226193, 0.2077757, 0.8190195, 0, 0, 0, 1, 1,
-0.1219037, -1.405581, -2.757655, 0, 0, 0, 1, 1,
-0.1213502, 0.9350445, -1.396498, 0, 0, 0, 1, 1,
-0.1205311, -1.260464, -2.892828, 1, 1, 1, 1, 1,
-0.1195108, 0.8686554, -1.265941, 1, 1, 1, 1, 1,
-0.118644, 0.1388893, -1.929466, 1, 1, 1, 1, 1,
-0.1182586, -0.6907601, -3.29785, 1, 1, 1, 1, 1,
-0.1180851, -0.6299797, -4.719182, 1, 1, 1, 1, 1,
-0.1162869, 0.2692115, -1.260501, 1, 1, 1, 1, 1,
-0.1099353, -0.1498372, -3.992951, 1, 1, 1, 1, 1,
-0.1092662, 0.9383305, 1.77908, 1, 1, 1, 1, 1,
-0.1031671, -0.108344, -0.5281557, 1, 1, 1, 1, 1,
-0.09895546, 2.435101, 0.7409428, 1, 1, 1, 1, 1,
-0.09639274, -1.318807, -3.613476, 1, 1, 1, 1, 1,
-0.09279161, -0.3261516, -2.594819, 1, 1, 1, 1, 1,
-0.09012821, 2.103519, -1.643519, 1, 1, 1, 1, 1,
-0.08600008, 0.4512511, -0.8321663, 1, 1, 1, 1, 1,
-0.08109999, 0.3156018, -2.066911, 1, 1, 1, 1, 1,
-0.08023443, 2.354953, -0.9190168, 0, 0, 1, 1, 1,
-0.07925455, -0.6123503, -2.317902, 1, 0, 0, 1, 1,
-0.07507367, 0.7828065, -1.779054, 1, 0, 0, 1, 1,
-0.07240323, 0.5393607, 0.8997423, 1, 0, 0, 1, 1,
-0.07093512, 1.335997, 0.3816459, 1, 0, 0, 1, 1,
-0.06931178, 0.01024101, -0.8255066, 1, 0, 0, 1, 1,
-0.06815826, 0.690452, -1.094003, 0, 0, 0, 1, 1,
-0.06720526, -1.09272, -3.270989, 0, 0, 0, 1, 1,
-0.06365706, 2.148495, -2.413062, 0, 0, 0, 1, 1,
-0.0612119, 0.002849967, -2.247166, 0, 0, 0, 1, 1,
-0.05638497, 0.4363922, -1.486678, 0, 0, 0, 1, 1,
-0.05634823, 0.509312, 0.2507926, 0, 0, 0, 1, 1,
-0.05242112, 0.05466993, 0.4220782, 0, 0, 0, 1, 1,
-0.05162587, 0.7829381, -0.7557864, 1, 1, 1, 1, 1,
-0.04694718, 1.52975, 0.4502485, 1, 1, 1, 1, 1,
-0.0403032, 0.4404819, 0.8970518, 1, 1, 1, 1, 1,
-0.03908863, 0.08233556, -0.8265721, 1, 1, 1, 1, 1,
-0.03776332, 0.4782167, 0.1759059, 1, 1, 1, 1, 1,
-0.03746751, 0.6507049, 1.582951, 1, 1, 1, 1, 1,
-0.03644731, 0.8702651, -0.4044068, 1, 1, 1, 1, 1,
-0.03159852, -2.607537, -3.361301, 1, 1, 1, 1, 1,
-0.02754844, 1.16217, 0.6374041, 1, 1, 1, 1, 1,
-0.026324, -1.600691, -3.800752, 1, 1, 1, 1, 1,
-0.02508818, 1.457857, 1.89774, 1, 1, 1, 1, 1,
-0.02097672, 0.7310354, 0.0226173, 1, 1, 1, 1, 1,
-0.02073943, 1.207453, -0.7359964, 1, 1, 1, 1, 1,
-0.01796713, -0.1035368, -2.74657, 1, 1, 1, 1, 1,
-0.01399057, 2.210722, -0.2951267, 1, 1, 1, 1, 1,
-0.01364777, 1.145624, -1.0016, 0, 0, 1, 1, 1,
-0.01161838, -0.1007802, -5.045083, 1, 0, 0, 1, 1,
-0.01023786, 0.1340267, -0.04552159, 1, 0, 0, 1, 1,
-0.004193332, -0.1608635, -2.819274, 1, 0, 0, 1, 1,
-0.001227024, -1.715322, -2.143124, 1, 0, 0, 1, 1,
-0.0007484023, 0.4631511, -1.11042, 1, 0, 0, 1, 1,
0.002543371, -0.5125001, 4.259825, 0, 0, 0, 1, 1,
0.007902374, -0.09071425, 3.147522, 0, 0, 0, 1, 1,
0.009959266, -0.01016859, 3.132479, 0, 0, 0, 1, 1,
0.0149745, -0.5820737, 1.837781, 0, 0, 0, 1, 1,
0.02002168, 0.5188386, 0.1115637, 0, 0, 0, 1, 1,
0.02060492, -1.528582, 2.016354, 0, 0, 0, 1, 1,
0.02066423, 0.869839, 0.8777686, 0, 0, 0, 1, 1,
0.02163349, 1.808043, -1.23308, 1, 1, 1, 1, 1,
0.02720965, -0.8469582, 2.427376, 1, 1, 1, 1, 1,
0.02724343, -0.3634701, 3.608799, 1, 1, 1, 1, 1,
0.02737425, -0.3570147, 3.650647, 1, 1, 1, 1, 1,
0.02886965, -0.4941837, 2.979256, 1, 1, 1, 1, 1,
0.02955385, -0.7275146, 5.085598, 1, 1, 1, 1, 1,
0.03110896, 0.424486, 0.3224445, 1, 1, 1, 1, 1,
0.03130955, 1.185389, -0.4362562, 1, 1, 1, 1, 1,
0.03261636, 0.1677691, 2.098377, 1, 1, 1, 1, 1,
0.03330538, -0.4967635, 3.3127, 1, 1, 1, 1, 1,
0.03475916, -0.5173732, 1.290285, 1, 1, 1, 1, 1,
0.03696716, -0.5596835, 3.897829, 1, 1, 1, 1, 1,
0.03912282, -0.5625208, 2.290373, 1, 1, 1, 1, 1,
0.04576142, 0.01968572, 0.5921663, 1, 1, 1, 1, 1,
0.04615096, 0.02885295, 1.975905, 1, 1, 1, 1, 1,
0.04618822, -0.3195342, 4.737736, 0, 0, 1, 1, 1,
0.0497145, -1.266527, 2.518455, 1, 0, 0, 1, 1,
0.05934731, 0.01579607, 1.865958, 1, 0, 0, 1, 1,
0.0596887, 1.11634, 0.1983362, 1, 0, 0, 1, 1,
0.05977424, 0.6888083, 1.083484, 1, 0, 0, 1, 1,
0.06287607, -0.9228247, 2.402037, 1, 0, 0, 1, 1,
0.06685997, -0.4174494, 2.744902, 0, 0, 0, 1, 1,
0.06763387, -1.491824, 3.668172, 0, 0, 0, 1, 1,
0.0713088, 0.2627385, 0.1296645, 0, 0, 0, 1, 1,
0.07455265, 2.011909, 2.091407, 0, 0, 0, 1, 1,
0.07737766, 0.4705194, 0.94668, 0, 0, 0, 1, 1,
0.07959008, 0.7458817, 0.3698476, 0, 0, 0, 1, 1,
0.08480775, -1.762316, 5.144514, 0, 0, 0, 1, 1,
0.08603844, -1.720871, 3.208346, 1, 1, 1, 1, 1,
0.0866037, -0.42227, 3.573101, 1, 1, 1, 1, 1,
0.08767901, 1.153904, -0.488665, 1, 1, 1, 1, 1,
0.08830673, -0.1296937, 2.717643, 1, 1, 1, 1, 1,
0.089897, 0.8529176, 1.182153, 1, 1, 1, 1, 1,
0.09167023, 0.2889593, 0.5877489, 1, 1, 1, 1, 1,
0.09676353, -1.244032, 1.050747, 1, 1, 1, 1, 1,
0.09814329, -0.3257431, 2.673005, 1, 1, 1, 1, 1,
0.1008856, 0.0110041, 2.282262, 1, 1, 1, 1, 1,
0.1036804, 0.1821107, -1.099849, 1, 1, 1, 1, 1,
0.1098656, 0.9120154, 0.6452654, 1, 1, 1, 1, 1,
0.1105588, -2.49392, 0.7012951, 1, 1, 1, 1, 1,
0.110972, 0.7322062, -0.4948914, 1, 1, 1, 1, 1,
0.1124291, -0.3413316, 1.972764, 1, 1, 1, 1, 1,
0.1165044, -0.4557155, 3.65792, 1, 1, 1, 1, 1,
0.1194487, -1.323568, 4.388897, 0, 0, 1, 1, 1,
0.1231536, -0.7408821, 2.888412, 1, 0, 0, 1, 1,
0.1306662, -0.4179262, 1.147074, 1, 0, 0, 1, 1,
0.130782, -0.5691278, 2.056347, 1, 0, 0, 1, 1,
0.1313625, -0.1685443, 2.530007, 1, 0, 0, 1, 1,
0.1399845, 1.200467, 0.9796283, 1, 0, 0, 1, 1,
0.1414254, -1.54545, 4.536208, 0, 0, 0, 1, 1,
0.1423256, 0.4560265, 1.727338, 0, 0, 0, 1, 1,
0.1424762, 0.3489745, 0.666911, 0, 0, 0, 1, 1,
0.1439059, 1.317757, 0.8991463, 0, 0, 0, 1, 1,
0.1455268, 0.05938751, 1.460018, 0, 0, 0, 1, 1,
0.1492091, 2.170591, 2.649017, 0, 0, 0, 1, 1,
0.1549043, 2.016441, -1.461989, 0, 0, 0, 1, 1,
0.161251, 0.1235618, 0.4791097, 1, 1, 1, 1, 1,
0.1693975, -0.267992, 4.148293, 1, 1, 1, 1, 1,
0.1697488, 0.3769792, -0.1648363, 1, 1, 1, 1, 1,
0.1744375, 0.3596691, 0.5353442, 1, 1, 1, 1, 1,
0.1773906, -0.1430055, 2.870489, 1, 1, 1, 1, 1,
0.1801395, 0.0584539, -0.8036803, 1, 1, 1, 1, 1,
0.18983, 0.3622431, 0.6761375, 1, 1, 1, 1, 1,
0.2024206, 0.2160722, -0.2899933, 1, 1, 1, 1, 1,
0.2050985, 1.390468, 1.057661, 1, 1, 1, 1, 1,
0.2117561, -1.08324, 4.759539, 1, 1, 1, 1, 1,
0.2119266, -0.1093679, 2.487515, 1, 1, 1, 1, 1,
0.2122345, 0.4180955, -0.001363336, 1, 1, 1, 1, 1,
0.2127205, -0.05506679, 1.935746, 1, 1, 1, 1, 1,
0.2137924, -0.8906763, 5.526386, 1, 1, 1, 1, 1,
0.2221977, 0.6375532, 0.4564722, 1, 1, 1, 1, 1,
0.2237729, 0.2903936, -1.177378, 0, 0, 1, 1, 1,
0.2266328, 0.3024109, 2.212936, 1, 0, 0, 1, 1,
0.2348068, -1.690153, 2.749017, 1, 0, 0, 1, 1,
0.235261, 0.6138713, 0.2142414, 1, 0, 0, 1, 1,
0.2381096, -0.07891446, 1.376478, 1, 0, 0, 1, 1,
0.2423717, -1.479696, 3.396632, 1, 0, 0, 1, 1,
0.247015, 0.480515, 2.111123, 0, 0, 0, 1, 1,
0.2482186, 1.214244, 1.610193, 0, 0, 0, 1, 1,
0.24957, -2.013012, 2.096212, 0, 0, 0, 1, 1,
0.2514939, 0.7397029, -0.3979376, 0, 0, 0, 1, 1,
0.2572405, -0.1774179, 3.136734, 0, 0, 0, 1, 1,
0.261991, 0.5114052, 1.401661, 0, 0, 0, 1, 1,
0.2632355, -1.673727, 2.580066, 0, 0, 0, 1, 1,
0.2639088, -0.1557273, 2.529091, 1, 1, 1, 1, 1,
0.2676325, 0.1583858, -0.02377502, 1, 1, 1, 1, 1,
0.2687035, 0.3744796, 0.6899476, 1, 1, 1, 1, 1,
0.2699868, 0.2586746, 1.095749, 1, 1, 1, 1, 1,
0.270761, 0.8401089, 0.7677972, 1, 1, 1, 1, 1,
0.2710024, 2.243834, -1.167376, 1, 1, 1, 1, 1,
0.2710094, 0.3251887, -1.231706, 1, 1, 1, 1, 1,
0.2734891, 0.09390522, 0.724398, 1, 1, 1, 1, 1,
0.2741552, -0.7114568, 4.76273, 1, 1, 1, 1, 1,
0.2749402, -0.3393525, 1.879433, 1, 1, 1, 1, 1,
0.285393, -0.9405991, 3.793826, 1, 1, 1, 1, 1,
0.2901129, -0.6515245, 3.800156, 1, 1, 1, 1, 1,
0.2974109, -1.158578, 3.011497, 1, 1, 1, 1, 1,
0.2978156, -0.4474738, 1.784744, 1, 1, 1, 1, 1,
0.3018034, -1.319058, 4.377515, 1, 1, 1, 1, 1,
0.3026827, 0.1019832, 0.1307149, 0, 0, 1, 1, 1,
0.3029574, -0.2145548, -0.3150744, 1, 0, 0, 1, 1,
0.3034809, -1.281822, 1.236501, 1, 0, 0, 1, 1,
0.3050002, -0.1067303, 3.274183, 1, 0, 0, 1, 1,
0.3075724, -0.1469154, 1.882212, 1, 0, 0, 1, 1,
0.308727, -0.2123618, 4.566117, 1, 0, 0, 1, 1,
0.3125075, -0.7739041, 3.766335, 0, 0, 0, 1, 1,
0.3186788, -0.3710212, 4.13835, 0, 0, 0, 1, 1,
0.3195864, 0.3444019, 2.925509, 0, 0, 0, 1, 1,
0.3211672, 1.648177, 0.7979751, 0, 0, 0, 1, 1,
0.32223, -0.1655137, 4.072204, 0, 0, 0, 1, 1,
0.322608, 1.153083, -0.9290755, 0, 0, 0, 1, 1,
0.3232403, 0.9354765, 0.9346585, 0, 0, 0, 1, 1,
0.3261941, -0.9694995, 1.892374, 1, 1, 1, 1, 1,
0.3331699, 0.5442793, 0.08959966, 1, 1, 1, 1, 1,
0.3362225, -0.4838017, 1.525138, 1, 1, 1, 1, 1,
0.339167, 0.1986951, 1.138092, 1, 1, 1, 1, 1,
0.3393556, -0.1355484, 1.634984, 1, 1, 1, 1, 1,
0.35171, -0.2532164, 3.082283, 1, 1, 1, 1, 1,
0.3522755, 0.6278002, 1.175922, 1, 1, 1, 1, 1,
0.3543518, 2.493801, -0.7347491, 1, 1, 1, 1, 1,
0.3560117, 0.1756524, 0.3028118, 1, 1, 1, 1, 1,
0.3668586, -1.886629, 3.312289, 1, 1, 1, 1, 1,
0.370483, -0.7009484, 1.608754, 1, 1, 1, 1, 1,
0.3733818, 0.161671, 0.6091924, 1, 1, 1, 1, 1,
0.3744093, 0.5253035, 3.505519, 1, 1, 1, 1, 1,
0.3787613, -0.3489494, 3.037152, 1, 1, 1, 1, 1,
0.3792363, 0.1109926, 1.643663, 1, 1, 1, 1, 1,
0.3810383, -0.9958867, 3.311328, 0, 0, 1, 1, 1,
0.3819789, -0.2217196, 3.752915, 1, 0, 0, 1, 1,
0.3822942, 0.1152641, -0.4274675, 1, 0, 0, 1, 1,
0.3867086, -0.6625109, 1.360924, 1, 0, 0, 1, 1,
0.3881517, -0.8470725, 1.070958, 1, 0, 0, 1, 1,
0.3906656, -0.6776428, 2.23631, 1, 0, 0, 1, 1,
0.3933088, 0.6562129, -0.6343442, 0, 0, 0, 1, 1,
0.3934932, -0.6335226, 2.638073, 0, 0, 0, 1, 1,
0.3945119, -1.175547, 3.884506, 0, 0, 0, 1, 1,
0.3951986, -0.32636, 2.267954, 0, 0, 0, 1, 1,
0.3955451, 0.8177829, 1.070003, 0, 0, 0, 1, 1,
0.400642, 0.3990165, -0.6711782, 0, 0, 0, 1, 1,
0.4017051, -0.7467947, 3.146158, 0, 0, 0, 1, 1,
0.4034308, 0.6080214, -0.7195024, 1, 1, 1, 1, 1,
0.4092918, -1.58009, 3.739739, 1, 1, 1, 1, 1,
0.4112198, 0.5516739, 1.678264, 1, 1, 1, 1, 1,
0.4123823, 1.557537, -0.7912694, 1, 1, 1, 1, 1,
0.4131668, 0.4292558, 0.6707951, 1, 1, 1, 1, 1,
0.4219671, 1.320356, 0.3943949, 1, 1, 1, 1, 1,
0.4225687, -0.5308188, 1.981072, 1, 1, 1, 1, 1,
0.4225718, 1.278496, -0.3222162, 1, 1, 1, 1, 1,
0.4264108, 0.1675698, 2.081038, 1, 1, 1, 1, 1,
0.4304403, 0.8812425, 2.276506, 1, 1, 1, 1, 1,
0.4352225, -1.182476, 4.429523, 1, 1, 1, 1, 1,
0.4399145, 0.1792382, 1.618914, 1, 1, 1, 1, 1,
0.444195, 0.02983295, 1.369407, 1, 1, 1, 1, 1,
0.4456898, 0.6058817, 0.3835376, 1, 1, 1, 1, 1,
0.4476879, 0.7223492, 0.2473244, 1, 1, 1, 1, 1,
0.4487599, -1.786418, 2.614996, 0, 0, 1, 1, 1,
0.4529974, -0.5066076, 3.127278, 1, 0, 0, 1, 1,
0.455001, -0.2545186, 2.203304, 1, 0, 0, 1, 1,
0.4555087, -0.6304038, 1.811527, 1, 0, 0, 1, 1,
0.4569962, 0.170656, 2.548005, 1, 0, 0, 1, 1,
0.4625785, 0.6217766, 1.137751, 1, 0, 0, 1, 1,
0.4631893, -2.071173, 1.895299, 0, 0, 0, 1, 1,
0.4663855, -0.365234, 1.766811, 0, 0, 0, 1, 1,
0.4684877, -0.7373846, 2.001027, 0, 0, 0, 1, 1,
0.4711341, -0.8879774, 2.415855, 0, 0, 0, 1, 1,
0.4746836, -0.4859327, 2.231585, 0, 0, 0, 1, 1,
0.4761699, -0.1336859, 0.03545539, 0, 0, 0, 1, 1,
0.4782774, 0.188484, 1.437983, 0, 0, 0, 1, 1,
0.4803018, 0.5802764, 2.397939, 1, 1, 1, 1, 1,
0.4846232, -2.336776, 2.816753, 1, 1, 1, 1, 1,
0.490335, -1.058664, 2.889629, 1, 1, 1, 1, 1,
0.4928474, 1.254553, -0.1548979, 1, 1, 1, 1, 1,
0.4978255, 0.5469337, 1.043402, 1, 1, 1, 1, 1,
0.5003089, -0.6938224, 2.691354, 1, 1, 1, 1, 1,
0.5023875, 0.5098315, 0.8850995, 1, 1, 1, 1, 1,
0.5043277, -0.1808591, 2.297206, 1, 1, 1, 1, 1,
0.508641, 0.5167335, -0.5648932, 1, 1, 1, 1, 1,
0.5091591, 0.3008686, 0.2965976, 1, 1, 1, 1, 1,
0.5111276, 0.4053479, 0.8854976, 1, 1, 1, 1, 1,
0.5125644, -1.674384, 2.569289, 1, 1, 1, 1, 1,
0.5126809, -1.793619, 3.526458, 1, 1, 1, 1, 1,
0.5139334, 1.906524, 0.1100234, 1, 1, 1, 1, 1,
0.5158419, -1.146849, 3.319251, 1, 1, 1, 1, 1,
0.5210757, -0.3644755, 1.375192, 0, 0, 1, 1, 1,
0.5236114, 0.01973075, 2.507708, 1, 0, 0, 1, 1,
0.5289272, 0.05112027, 1.392763, 1, 0, 0, 1, 1,
0.5292044, 0.354961, -0.2562892, 1, 0, 0, 1, 1,
0.5298069, -0.06637984, 1.344996, 1, 0, 0, 1, 1,
0.5312198, -0.6540442, 3.222215, 1, 0, 0, 1, 1,
0.5346065, 0.3261715, 1.208487, 0, 0, 0, 1, 1,
0.5372164, 0.1489856, 2.543375, 0, 0, 0, 1, 1,
0.5376422, 0.2289467, 0.6753439, 0, 0, 0, 1, 1,
0.538484, 1.274522, 0.4947435, 0, 0, 0, 1, 1,
0.5385908, 0.4015847, 1.339484, 0, 0, 0, 1, 1,
0.545655, 0.2701736, 0.3189124, 0, 0, 0, 1, 1,
0.5458736, -2.95193, 3.02626, 0, 0, 0, 1, 1,
0.5478028, -0.5379297, 3.433433, 1, 1, 1, 1, 1,
0.5481934, 0.2289986, 1.176935, 1, 1, 1, 1, 1,
0.5484061, -1.379243, 4.004357, 1, 1, 1, 1, 1,
0.5518752, 0.1572805, 1.786435, 1, 1, 1, 1, 1,
0.5579948, 0.2928442, 1.513575, 1, 1, 1, 1, 1,
0.5584369, 0.3935707, 1.752711, 1, 1, 1, 1, 1,
0.5602548, 0.3229961, 2.077992, 1, 1, 1, 1, 1,
0.5611087, 0.3328877, 1.142899, 1, 1, 1, 1, 1,
0.5647827, -0.2785251, 2.688585, 1, 1, 1, 1, 1,
0.5703209, 0.1517483, 0.1298156, 1, 1, 1, 1, 1,
0.5720655, -1.468459, 2.009926, 1, 1, 1, 1, 1,
0.5722741, 0.5763789, 1.099503, 1, 1, 1, 1, 1,
0.5761421, -0.2630294, 3.175535, 1, 1, 1, 1, 1,
0.577982, 1.239292, 0.7176626, 1, 1, 1, 1, 1,
0.578382, -1.306284, 2.059009, 1, 1, 1, 1, 1,
0.5841841, -0.7255479, 1.003767, 0, 0, 1, 1, 1,
0.5850865, -0.3851877, 1.588401, 1, 0, 0, 1, 1,
0.5926641, -1.243524, 1.909802, 1, 0, 0, 1, 1,
0.5948648, -0.09591118, 1.01726, 1, 0, 0, 1, 1,
0.5970185, -0.3613769, 2.23179, 1, 0, 0, 1, 1,
0.6010649, -1.304065, 1.991263, 1, 0, 0, 1, 1,
0.6022844, 0.02132076, 2.219098, 0, 0, 0, 1, 1,
0.6048683, -0.7389899, 2.403974, 0, 0, 0, 1, 1,
0.6089855, 0.02981193, 1.244421, 0, 0, 0, 1, 1,
0.6137764, -0.5166752, 3.687523, 0, 0, 0, 1, 1,
0.6200059, -0.1586861, 1.950074, 0, 0, 0, 1, 1,
0.6227418, -0.08966999, 0.3358499, 0, 0, 0, 1, 1,
0.6251877, 0.9454284, -0.1993363, 0, 0, 0, 1, 1,
0.6253709, -0.1386487, 0.4212703, 1, 1, 1, 1, 1,
0.6255938, -1.963869, 2.983241, 1, 1, 1, 1, 1,
0.6292748, 1.435531, 0.5292988, 1, 1, 1, 1, 1,
0.6317478, -0.5908938, 1.871836, 1, 1, 1, 1, 1,
0.634834, 0.7453089, -0.2470154, 1, 1, 1, 1, 1,
0.6373367, -0.4792728, 1.746538, 1, 1, 1, 1, 1,
0.638359, 0.248987, 1.119764, 1, 1, 1, 1, 1,
0.6391734, -0.5342643, 1.617405, 1, 1, 1, 1, 1,
0.6404278, -0.1252598, 3.502861, 1, 1, 1, 1, 1,
0.6430414, 0.877029, -1.280708, 1, 1, 1, 1, 1,
0.6430929, -1.361102, 1.789726, 1, 1, 1, 1, 1,
0.6553525, -1.33834, 3.328848, 1, 1, 1, 1, 1,
0.6568282, -0.06619376, 0.7067083, 1, 1, 1, 1, 1,
0.6569761, -0.4082257, 1.645928, 1, 1, 1, 1, 1,
0.6583691, -0.1555157, 4.207717, 1, 1, 1, 1, 1,
0.6584213, -0.5339271, 4.630797, 0, 0, 1, 1, 1,
0.6606, -1.398641, 2.3356, 1, 0, 0, 1, 1,
0.6651174, -1.395069, 4.075622, 1, 0, 0, 1, 1,
0.670911, -0.7450232, 1.864444, 1, 0, 0, 1, 1,
0.6753646, -0.3586626, 3.111854, 1, 0, 0, 1, 1,
0.6840185, 1.269175, 0.229249, 1, 0, 0, 1, 1,
0.6843317, -0.9143431, 2.798601, 0, 0, 0, 1, 1,
0.686944, 1.04815, 0.6999409, 0, 0, 0, 1, 1,
0.68784, -1.835194, 3.20224, 0, 0, 0, 1, 1,
0.6889735, -0.2304644, 1.788757, 0, 0, 0, 1, 1,
0.690635, 0.5025267, -0.9552945, 0, 0, 0, 1, 1,
0.6914657, -0.2110754, 1.194457, 0, 0, 0, 1, 1,
0.6974332, 1.901569, 0.3822868, 0, 0, 0, 1, 1,
0.7049741, 1.719361, 0.2879578, 1, 1, 1, 1, 1,
0.7082571, -0.2559304, 2.507826, 1, 1, 1, 1, 1,
0.7090793, 1.197667, -0.8457557, 1, 1, 1, 1, 1,
0.7095785, -0.2822922, 1.254213, 1, 1, 1, 1, 1,
0.7125415, 1.41413, 0.3115092, 1, 1, 1, 1, 1,
0.717203, 0.3002293, 0.3606517, 1, 1, 1, 1, 1,
0.7175209, -1.184956, 2.286573, 1, 1, 1, 1, 1,
0.7346978, 0.9328457, 0.8529047, 1, 1, 1, 1, 1,
0.7373021, 0.03065515, 0.4962511, 1, 1, 1, 1, 1,
0.7386596, -0.7235873, 3.178651, 1, 1, 1, 1, 1,
0.7405415, -0.08286305, 1.349166, 1, 1, 1, 1, 1,
0.7435949, -0.9870789, 2.910492, 1, 1, 1, 1, 1,
0.7500769, 1.047868, 1.152277, 1, 1, 1, 1, 1,
0.7560755, 1.098336, 2.339896, 1, 1, 1, 1, 1,
0.7563376, -1.411416, 2.510181, 1, 1, 1, 1, 1,
0.7671149, 0.6877941, 0.7041632, 0, 0, 1, 1, 1,
0.7683396, -0.1959197, 3.222596, 1, 0, 0, 1, 1,
0.7693945, -0.6914414, 1.120466, 1, 0, 0, 1, 1,
0.7874089, -0.03114149, 1.039231, 1, 0, 0, 1, 1,
0.7910377, 0.8022708, 0.5772477, 1, 0, 0, 1, 1,
0.7925074, -1.253508, 1.68171, 1, 0, 0, 1, 1,
0.7994497, -0.2369152, 2.188743, 0, 0, 0, 1, 1,
0.8022252, 0.999485, -0.8066924, 0, 0, 0, 1, 1,
0.8101943, 0.681309, -0.3286495, 0, 0, 0, 1, 1,
0.8129518, 0.8196546, 1.810293, 0, 0, 0, 1, 1,
0.8136067, -0.9238272, 2.464362, 0, 0, 0, 1, 1,
0.8144177, 1.439687, -0.4059563, 0, 0, 0, 1, 1,
0.8170324, -0.744217, 1.9976, 0, 0, 0, 1, 1,
0.8171217, -0.1464402, 0.2271102, 1, 1, 1, 1, 1,
0.818467, 0.8028357, -0.3907089, 1, 1, 1, 1, 1,
0.8187679, -0.7623163, 1.956572, 1, 1, 1, 1, 1,
0.8189628, 0.3375677, 1.577543, 1, 1, 1, 1, 1,
0.8232432, 0.9384623, 0.6732275, 1, 1, 1, 1, 1,
0.8242497, -0.4901625, 1.963977, 1, 1, 1, 1, 1,
0.8314714, -0.6918182, 0.70476, 1, 1, 1, 1, 1,
0.8348655, 0.9739786, -0.3574702, 1, 1, 1, 1, 1,
0.8385931, -0.2641466, 3.615741, 1, 1, 1, 1, 1,
0.8389406, 1.29413, 0.881393, 1, 1, 1, 1, 1,
0.8394212, 0.5724294, -0.8961464, 1, 1, 1, 1, 1,
0.8399577, 0.4060163, -0.4687135, 1, 1, 1, 1, 1,
0.8534353, 1.631016, -0.9143162, 1, 1, 1, 1, 1,
0.8635062, -0.351107, 2.836161, 1, 1, 1, 1, 1,
0.8669732, 0.2849344, 0.6147873, 1, 1, 1, 1, 1,
0.8679576, -0.0351069, 1.645604, 0, 0, 1, 1, 1,
0.8702014, 0.8275791, 2.86005, 1, 0, 0, 1, 1,
0.8707024, 0.9025062, -0.5988143, 1, 0, 0, 1, 1,
0.8750931, -1.598402, 4.560354, 1, 0, 0, 1, 1,
0.8773524, 0.4812977, 1.627821, 1, 0, 0, 1, 1,
0.8788191, -0.06023422, 1.79027, 1, 0, 0, 1, 1,
0.8812817, 0.3965503, 0.7407063, 0, 0, 0, 1, 1,
0.8832097, 1.012897, 1.659966, 0, 0, 0, 1, 1,
0.8832164, -0.08991517, 0.1143619, 0, 0, 0, 1, 1,
0.8840955, 0.2537041, 0.9274265, 0, 0, 0, 1, 1,
0.8891949, 0.5618539, 1.451929, 0, 0, 0, 1, 1,
0.8906816, 0.7410826, 0.4557662, 0, 0, 0, 1, 1,
0.8992227, -0.4351182, 3.717412, 0, 0, 0, 1, 1,
0.9043426, -1.592021, 3.299338, 1, 1, 1, 1, 1,
0.9049857, -0.2777938, 2.492031, 1, 1, 1, 1, 1,
0.906575, -1.756781, 1.934397, 1, 1, 1, 1, 1,
0.9119838, -0.5946576, 2.229439, 1, 1, 1, 1, 1,
0.9322191, -0.5290172, 2.215656, 1, 1, 1, 1, 1,
0.9345573, 1.005152, 2.458637, 1, 1, 1, 1, 1,
0.95004, -1.029034, 1.297828, 1, 1, 1, 1, 1,
0.958276, -0.4493337, 1.251832, 1, 1, 1, 1, 1,
0.9630119, -0.3263295, 1.415841, 1, 1, 1, 1, 1,
0.9680502, 0.2644568, 0.3087102, 1, 1, 1, 1, 1,
0.977706, 0.6563117, -1.372127, 1, 1, 1, 1, 1,
0.9810313, 0.1247117, 1.732604, 1, 1, 1, 1, 1,
0.9848202, -1.38231, 2.847926, 1, 1, 1, 1, 1,
0.9850575, 0.03928525, 1.05348, 1, 1, 1, 1, 1,
0.9932815, 0.2805038, 3.247556, 1, 1, 1, 1, 1,
0.99472, 1.731242, -1.005358, 0, 0, 1, 1, 1,
0.9984115, 1.326182, -0.59058, 1, 0, 0, 1, 1,
1.000025, 0.7090356, -1.172884, 1, 0, 0, 1, 1,
1.004834, -0.7999018, 3.036481, 1, 0, 0, 1, 1,
1.006333, 1.109248, -0.2595496, 1, 0, 0, 1, 1,
1.006607, 0.2049816, 2.646179, 1, 0, 0, 1, 1,
1.009611, 0.5941985, 2.622676, 0, 0, 0, 1, 1,
1.009733, 0.3309358, 1.103355, 0, 0, 0, 1, 1,
1.017715, 0.6288404, 0.4466807, 0, 0, 0, 1, 1,
1.019714, 0.20121, 1.635326, 0, 0, 0, 1, 1,
1.021125, -0.7496517, 3.204607, 0, 0, 0, 1, 1,
1.026511, -0.6746137, 2.266435, 0, 0, 0, 1, 1,
1.026682, 0.3096902, 1.923141, 0, 0, 0, 1, 1,
1.028069, -1.463412, 2.620116, 1, 1, 1, 1, 1,
1.02951, 0.01891667, 0.7493432, 1, 1, 1, 1, 1,
1.03033, 1.718249, -0.430404, 1, 1, 1, 1, 1,
1.034104, -0.8798456, 2.650053, 1, 1, 1, 1, 1,
1.034407, 0.7781461, -1.101276, 1, 1, 1, 1, 1,
1.040936, -0.5337532, 0.7491869, 1, 1, 1, 1, 1,
1.052539, -0.2395622, 0.7474439, 1, 1, 1, 1, 1,
1.054778, -0.9160011, 2.100546, 1, 1, 1, 1, 1,
1.055348, 0.4763841, 0.855023, 1, 1, 1, 1, 1,
1.061029, -0.9254129, 1.895281, 1, 1, 1, 1, 1,
1.061038, -0.8129042, -0.3769719, 1, 1, 1, 1, 1,
1.077775, 0.9569153, 0.3894127, 1, 1, 1, 1, 1,
1.085979, -0.1183581, 1.883353, 1, 1, 1, 1, 1,
1.086599, -0.4215179, 1.52425, 1, 1, 1, 1, 1,
1.09334, -1.186933, 0.8910318, 1, 1, 1, 1, 1,
1.096634, 0.3194246, 1.542683, 0, 0, 1, 1, 1,
1.097845, 1.322609, -1.06389, 1, 0, 0, 1, 1,
1.098338, 1.648473, 0.2591307, 1, 0, 0, 1, 1,
1.113455, 0.3034174, 1.199411, 1, 0, 0, 1, 1,
1.118887, -0.008015185, 0.5670781, 1, 0, 0, 1, 1,
1.120931, 1.565124, 0.5776056, 1, 0, 0, 1, 1,
1.126369, -1.403571, 1.853326, 0, 0, 0, 1, 1,
1.127465, 0.1784157, 0.1544457, 0, 0, 0, 1, 1,
1.130655, -0.3862575, 0.8198428, 0, 0, 0, 1, 1,
1.132614, -1.429335, 3.157555, 0, 0, 0, 1, 1,
1.13743, -1.563853, 2.724721, 0, 0, 0, 1, 1,
1.143278, -0.2277094, 3.017082, 0, 0, 0, 1, 1,
1.152202, -1.52115, 2.739398, 0, 0, 0, 1, 1,
1.153684, 0.0411897, 2.672174, 1, 1, 1, 1, 1,
1.159129, -1.183242, 2.939108, 1, 1, 1, 1, 1,
1.159156, -0.9750873, 1.719031, 1, 1, 1, 1, 1,
1.167729, -0.9525884, 0.9498506, 1, 1, 1, 1, 1,
1.169221, -1.239026, 2.404541, 1, 1, 1, 1, 1,
1.184254, -1.068724, 1.875879, 1, 1, 1, 1, 1,
1.186978, 0.5756297, -0.04130761, 1, 1, 1, 1, 1,
1.199097, 1.714132, 1.098922, 1, 1, 1, 1, 1,
1.202675, -0.4178141, -0.6457995, 1, 1, 1, 1, 1,
1.204764, 0.3022544, 0.5026827, 1, 1, 1, 1, 1,
1.213957, -0.5613532, 0.592513, 1, 1, 1, 1, 1,
1.226589, -0.210597, 1.370187, 1, 1, 1, 1, 1,
1.229013, -1.078448, 2.774311, 1, 1, 1, 1, 1,
1.236536, -0.455476, 3.317535, 1, 1, 1, 1, 1,
1.23718, 0.831331, -0.4324898, 1, 1, 1, 1, 1,
1.240771, 0.6889563, 1.402267, 0, 0, 1, 1, 1,
1.251021, -1.668308, 1.837012, 1, 0, 0, 1, 1,
1.252115, 0.6098263, -1.144045, 1, 0, 0, 1, 1,
1.260975, 1.81726, -0.0512481, 1, 0, 0, 1, 1,
1.26916, -1.996212, 5.802495, 1, 0, 0, 1, 1,
1.274219, -0.2897131, 1.175869, 1, 0, 0, 1, 1,
1.276551, 1.009717, 2.481578, 0, 0, 0, 1, 1,
1.28655, -0.1713401, 0.9160357, 0, 0, 0, 1, 1,
1.292973, -1.868455, 3.389316, 0, 0, 0, 1, 1,
1.301618, -1.133882, 3.78567, 0, 0, 0, 1, 1,
1.303705, -1.90448, 3.728825, 0, 0, 0, 1, 1,
1.313084, -1.612722, 2.673611, 0, 0, 0, 1, 1,
1.321049, 1.362534, -0.7225242, 0, 0, 0, 1, 1,
1.321851, -0.02697367, 1.502379, 1, 1, 1, 1, 1,
1.324016, -0.4293218, 1.423767, 1, 1, 1, 1, 1,
1.328816, -0.04261899, 0.1628668, 1, 1, 1, 1, 1,
1.335773, 0.4542318, 1.413536, 1, 1, 1, 1, 1,
1.342039, 0.5796459, 1.237813, 1, 1, 1, 1, 1,
1.344654, -0.5985171, 1.677728, 1, 1, 1, 1, 1,
1.360318, 0.9078907, 1.289508, 1, 1, 1, 1, 1,
1.362311, -1.279935, 0.5699773, 1, 1, 1, 1, 1,
1.369022, 0.04866188, 1.100776, 1, 1, 1, 1, 1,
1.370605, 1.059367, 1.274404, 1, 1, 1, 1, 1,
1.376352, 0.06129266, 2.816658, 1, 1, 1, 1, 1,
1.376667, -0.3916618, 1.920539, 1, 1, 1, 1, 1,
1.391149, 0.5681044, 0.8011189, 1, 1, 1, 1, 1,
1.395836, -1.482874, 1.982852, 1, 1, 1, 1, 1,
1.403376, 0.511314, 2.057948, 1, 1, 1, 1, 1,
1.404682, 1.681916, 0.3426516, 0, 0, 1, 1, 1,
1.414344, 0.4376783, 2.428055, 1, 0, 0, 1, 1,
1.424518, -0.3270796, 2.36936, 1, 0, 0, 1, 1,
1.439291, 0.07542986, 2.998343, 1, 0, 0, 1, 1,
1.444841, -0.7134912, 2.107283, 1, 0, 0, 1, 1,
1.448084, 1.178824, -0.1414582, 1, 0, 0, 1, 1,
1.451196, 1.814574, 2.189878, 0, 0, 0, 1, 1,
1.459347, 0.4262596, 1.815404, 0, 0, 0, 1, 1,
1.473936, -0.5174733, 1.724692, 0, 0, 0, 1, 1,
1.477239, 0.4027606, 1.958206, 0, 0, 0, 1, 1,
1.485908, -2.010937, 2.401256, 0, 0, 0, 1, 1,
1.501663, 0.5393047, 1.238426, 0, 0, 0, 1, 1,
1.515878, -0.1729872, 1.082791, 0, 0, 0, 1, 1,
1.517961, -0.4938708, 0.4800797, 1, 1, 1, 1, 1,
1.519828, -1.534331, 2.469457, 1, 1, 1, 1, 1,
1.525363, -0.9792837, 3.571742, 1, 1, 1, 1, 1,
1.53927, -0.3892001, 2.669112, 1, 1, 1, 1, 1,
1.557123, -0.3588334, 3.343183, 1, 1, 1, 1, 1,
1.563398, -0.5636221, 2.223203, 1, 1, 1, 1, 1,
1.566312, -0.1457395, 2.438725, 1, 1, 1, 1, 1,
1.57252, -1.506716, 3.244581, 1, 1, 1, 1, 1,
1.572874, -2.02278, 0.1946889, 1, 1, 1, 1, 1,
1.576805, -1.353032, 2.654604, 1, 1, 1, 1, 1,
1.579324, -0.9479752, 0.5167375, 1, 1, 1, 1, 1,
1.582572, 0.5045248, 2.377458, 1, 1, 1, 1, 1,
1.588361, 0.5330473, 0.5507029, 1, 1, 1, 1, 1,
1.599756, 0.3708656, 0.9663368, 1, 1, 1, 1, 1,
1.604237, -1.222896, 1.022787, 1, 1, 1, 1, 1,
1.607965, -0.4738394, 2.632675, 0, 0, 1, 1, 1,
1.610096, -1.233543, 2.976573, 1, 0, 0, 1, 1,
1.619607, 0.7224187, 0.352226, 1, 0, 0, 1, 1,
1.629375, 0.1375159, 2.084741, 1, 0, 0, 1, 1,
1.642116, 0.1776694, 3.336221, 1, 0, 0, 1, 1,
1.645459, 0.3706867, 1.188085, 1, 0, 0, 1, 1,
1.652331, 1.193591, 2.057816, 0, 0, 0, 1, 1,
1.656956, -0.5600567, 1.794444, 0, 0, 0, 1, 1,
1.661931, 0.676084, 1.278426, 0, 0, 0, 1, 1,
1.664176, -0.644347, 2.969494, 0, 0, 0, 1, 1,
1.687874, 0.770717, 1.854179, 0, 0, 0, 1, 1,
1.696958, 0.03774158, 2.015512, 0, 0, 0, 1, 1,
1.698377, 0.7050468, -0.7454618, 0, 0, 0, 1, 1,
1.744825, 0.2963932, 1.795599, 1, 1, 1, 1, 1,
1.760568, -0.8147788, 0.8709876, 1, 1, 1, 1, 1,
1.770294, 0.2489113, 0.5253763, 1, 1, 1, 1, 1,
1.804597, -0.5915903, 2.748072, 1, 1, 1, 1, 1,
1.828374, 1.759214, 1.202451, 1, 1, 1, 1, 1,
1.839845, 0.1935271, 1.495376, 1, 1, 1, 1, 1,
1.840461, 2.475929, 1.55409, 1, 1, 1, 1, 1,
1.919896, -0.8121781, 1.784856, 1, 1, 1, 1, 1,
1.923429, 1.356867, 1.890938, 1, 1, 1, 1, 1,
1.925143, -0.5962917, 2.559021, 1, 1, 1, 1, 1,
1.927299, 0.9259604, 1.377269, 1, 1, 1, 1, 1,
1.935036, 0.2075644, 0.9057764, 1, 1, 1, 1, 1,
2.025419, 0.8207742, 0.5639215, 1, 1, 1, 1, 1,
2.028858, 0.04301841, 1.597205, 1, 1, 1, 1, 1,
2.060198, 2.689591, 1.544274, 1, 1, 1, 1, 1,
2.088969, 1.406593, 3.83974, 0, 0, 1, 1, 1,
2.097956, -0.4919672, 2.665684, 1, 0, 0, 1, 1,
2.111997, -2.254834, 2.975309, 1, 0, 0, 1, 1,
2.139862, 1.102977, -0.05178668, 1, 0, 0, 1, 1,
2.143368, 0.5770004, 1.63485, 1, 0, 0, 1, 1,
2.274271, 2.062144, 0.1110969, 1, 0, 0, 1, 1,
2.275056, -1.362295, 3.237242, 0, 0, 0, 1, 1,
2.28767, -1.53817, 1.212685, 0, 0, 0, 1, 1,
2.291141, 0.9253396, 2.607506, 0, 0, 0, 1, 1,
2.383766, 0.1493905, 1.284695, 0, 0, 0, 1, 1,
2.394716, 1.498621, 1.446409, 0, 0, 0, 1, 1,
2.401975, -0.009045645, 0.8929199, 0, 0, 0, 1, 1,
2.440701, 0.02459514, 0.4342439, 0, 0, 0, 1, 1,
2.548979, -0.1647239, 2.926416, 1, 1, 1, 1, 1,
2.560155, -0.3053955, 0.2480198, 1, 1, 1, 1, 1,
2.576929, -0.3003651, 0.1493523, 1, 1, 1, 1, 1,
2.586178, 1.321915, 1.455477, 1, 1, 1, 1, 1,
2.736991, -0.8199167, 2.776051, 1, 1, 1, 1, 1,
2.763586, -0.04857699, 2.835598, 1, 1, 1, 1, 1,
2.829827, -0.2983339, 1.116905, 1, 1, 1, 1, 1
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
var radius = 9.444171;
var distance = 33.17225;
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
mvMatrix.translate( 0.2767369, 0.254305, -0.3787057 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.17225);
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
