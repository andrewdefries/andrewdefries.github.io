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
-3.056672, -0.4202269, -0.4357342, 1, 0, 0, 1,
-2.641271, 1.304007, -2.016933, 1, 0.007843138, 0, 1,
-2.55027, 1.029794, 0.7063497, 1, 0.01176471, 0, 1,
-2.359154, 0.4503874, -0.9533247, 1, 0.01960784, 0, 1,
-2.355851, 1.00797, 0.07491349, 1, 0.02352941, 0, 1,
-2.31574, -1.348992, -1.091835, 1, 0.03137255, 0, 1,
-2.281489, 2.109568, -0.5258255, 1, 0.03529412, 0, 1,
-2.26357, -0.8789439, -2.359367, 1, 0.04313726, 0, 1,
-2.260679, 0.1846304, -3.324624, 1, 0.04705882, 0, 1,
-2.22954, -0.3688677, -3.20451, 1, 0.05490196, 0, 1,
-2.228224, 0.02101192, -2.121552, 1, 0.05882353, 0, 1,
-2.211343, -0.2166739, -3.213285, 1, 0.06666667, 0, 1,
-2.210845, 1.097378, -1.375148, 1, 0.07058824, 0, 1,
-2.172062, 0.3216207, -2.433128, 1, 0.07843138, 0, 1,
-2.14083, -0.1418031, -0.6115627, 1, 0.08235294, 0, 1,
-2.135331, -1.227685, -4.219345, 1, 0.09019608, 0, 1,
-2.1246, 1.298623, -2.652939, 1, 0.09411765, 0, 1,
-2.112756, 1.625796, -1.158363, 1, 0.1019608, 0, 1,
-2.075791, 0.3561809, -0.9598804, 1, 0.1098039, 0, 1,
-1.973958, -0.05108544, -3.263817, 1, 0.1137255, 0, 1,
-1.971298, 1.582581, 0.9239064, 1, 0.1215686, 0, 1,
-1.956528, -1.803526, -2.571276, 1, 0.1254902, 0, 1,
-1.866852, 0.7163581, -0.3280384, 1, 0.1333333, 0, 1,
-1.83231, 0.4006349, 0.2982946, 1, 0.1372549, 0, 1,
-1.782959, -1.988373, -3.03883, 1, 0.145098, 0, 1,
-1.777085, 0.6088817, 0.2624848, 1, 0.1490196, 0, 1,
-1.768325, -0.1889507, 0.1723407, 1, 0.1568628, 0, 1,
-1.767417, 0.01172849, 0.4874499, 1, 0.1607843, 0, 1,
-1.765393, 0.8326147, -1.444968, 1, 0.1686275, 0, 1,
-1.764794, -1.597605, -2.432354, 1, 0.172549, 0, 1,
-1.762682, 1.037394, -1.143551, 1, 0.1803922, 0, 1,
-1.756844, -0.0614427, -2.449106, 1, 0.1843137, 0, 1,
-1.754601, -0.5141318, -1.541673, 1, 0.1921569, 0, 1,
-1.732386, -0.1445525, -2.041896, 1, 0.1960784, 0, 1,
-1.7137, -2.126268, -1.311557, 1, 0.2039216, 0, 1,
-1.698384, -0.130132, -0.4847175, 1, 0.2117647, 0, 1,
-1.688638, 1.94539, -1.308948, 1, 0.2156863, 0, 1,
-1.681009, -0.3632725, -2.722169, 1, 0.2235294, 0, 1,
-1.666782, -0.7268143, -1.730782, 1, 0.227451, 0, 1,
-1.643747, 0.8176455, -0.8069751, 1, 0.2352941, 0, 1,
-1.635939, -1.196359, -1.022523, 1, 0.2392157, 0, 1,
-1.629095, 0.2296588, -2.557651, 1, 0.2470588, 0, 1,
-1.628349, -1.536753, -2.459817, 1, 0.2509804, 0, 1,
-1.616903, 0.6638858, -0.1508303, 1, 0.2588235, 0, 1,
-1.616661, -0.1498065, -2.566539, 1, 0.2627451, 0, 1,
-1.614912, 1.536461, -1.96207, 1, 0.2705882, 0, 1,
-1.613646, 0.786323, 1.142171, 1, 0.2745098, 0, 1,
-1.593037, -0.6929231, 0.05811954, 1, 0.282353, 0, 1,
-1.592342, 0.5023741, -2.458068, 1, 0.2862745, 0, 1,
-1.577805, -1.955533, -1.47051, 1, 0.2941177, 0, 1,
-1.544001, 0.216149, 0.05692719, 1, 0.3019608, 0, 1,
-1.527433, -1.053089, -1.475814, 1, 0.3058824, 0, 1,
-1.526762, -0.5067032, -0.7378373, 1, 0.3137255, 0, 1,
-1.52651, -0.3650961, -4.064338, 1, 0.3176471, 0, 1,
-1.521351, -0.5903145, -1.604099, 1, 0.3254902, 0, 1,
-1.52018, 0.5526226, -1.263297, 1, 0.3294118, 0, 1,
-1.507841, -0.08302906, -1.881056, 1, 0.3372549, 0, 1,
-1.507299, -0.972614, -3.669335, 1, 0.3411765, 0, 1,
-1.486523, 0.5931616, -1.291037, 1, 0.3490196, 0, 1,
-1.478317, -0.1194947, -3.313307, 1, 0.3529412, 0, 1,
-1.46522, 1.585104, -0.6405023, 1, 0.3607843, 0, 1,
-1.457389, -0.6709312, -0.8344104, 1, 0.3647059, 0, 1,
-1.441653, 0.4176603, -1.823899, 1, 0.372549, 0, 1,
-1.436628, -0.1594917, -0.6632589, 1, 0.3764706, 0, 1,
-1.430847, -1.983027, -2.36683, 1, 0.3843137, 0, 1,
-1.422849, -1.179208, -2.597455, 1, 0.3882353, 0, 1,
-1.411012, 0.8375758, -1.967408, 1, 0.3960784, 0, 1,
-1.407563, -1.596157, -1.890346, 1, 0.4039216, 0, 1,
-1.405793, -2.440985, -1.28063, 1, 0.4078431, 0, 1,
-1.401645, 0.1661608, 0.2802194, 1, 0.4156863, 0, 1,
-1.38112, -0.1302476, -2.120658, 1, 0.4196078, 0, 1,
-1.378617, 0.293635, -2.327343, 1, 0.427451, 0, 1,
-1.378, -1.184275, -1.639097, 1, 0.4313726, 0, 1,
-1.370021, -0.6827552, -2.232957, 1, 0.4392157, 0, 1,
-1.361515, -0.9582236, -2.761855, 1, 0.4431373, 0, 1,
-1.360089, 0.974587, -1.465346, 1, 0.4509804, 0, 1,
-1.357698, 0.8191195, -0.7692456, 1, 0.454902, 0, 1,
-1.346154, 1.379372, 0.905048, 1, 0.4627451, 0, 1,
-1.339402, -0.6315241, -3.354048, 1, 0.4666667, 0, 1,
-1.335513, -0.5290794, -1.64574, 1, 0.4745098, 0, 1,
-1.321218, -0.1386391, -0.4429466, 1, 0.4784314, 0, 1,
-1.318168, 1.639609, 0.5032042, 1, 0.4862745, 0, 1,
-1.314554, 1.525732, -0.08447516, 1, 0.4901961, 0, 1,
-1.310108, -0.8444226, -1.8217, 1, 0.4980392, 0, 1,
-1.305533, -1.091862, -2.495511, 1, 0.5058824, 0, 1,
-1.301333, -0.5204438, -1.077935, 1, 0.509804, 0, 1,
-1.298069, 0.7608786, -1.73867, 1, 0.5176471, 0, 1,
-1.292365, -0.02329199, -0.7373548, 1, 0.5215687, 0, 1,
-1.283363, -0.3155378, -0.7250436, 1, 0.5294118, 0, 1,
-1.281863, -0.4654369, -1.082119, 1, 0.5333334, 0, 1,
-1.280448, -0.7325658, -1.504578, 1, 0.5411765, 0, 1,
-1.272182, 1.233854, -1.056818, 1, 0.5450981, 0, 1,
-1.271809, 1.013444, -1.417486, 1, 0.5529412, 0, 1,
-1.261648, -0.1739744, -1.153618, 1, 0.5568628, 0, 1,
-1.261447, -0.8915022, -1.6377, 1, 0.5647059, 0, 1,
-1.249484, -0.01823731, -0.8259416, 1, 0.5686275, 0, 1,
-1.245427, 2.326489, 0.6435233, 1, 0.5764706, 0, 1,
-1.227855, -2.516255, -2.657934, 1, 0.5803922, 0, 1,
-1.227563, 0.8577275, -3.661303, 1, 0.5882353, 0, 1,
-1.226585, -0.797012, -0.498135, 1, 0.5921569, 0, 1,
-1.225432, 1.056294, -1.795703, 1, 0.6, 0, 1,
-1.225297, 0.705652, -0.333174, 1, 0.6078432, 0, 1,
-1.220714, -0.637695, -3.207612, 1, 0.6117647, 0, 1,
-1.21144, -1.094897, -2.864605, 1, 0.6196079, 0, 1,
-1.207247, -0.6406271, -0.4337788, 1, 0.6235294, 0, 1,
-1.203479, -1.152452, -1.68764, 1, 0.6313726, 0, 1,
-1.196942, -1.712555, -2.089399, 1, 0.6352941, 0, 1,
-1.192204, -0.4311903, -2.549005, 1, 0.6431373, 0, 1,
-1.189447, -0.004725666, -1.075095, 1, 0.6470588, 0, 1,
-1.176144, 1.438504, -1.23175, 1, 0.654902, 0, 1,
-1.169497, -0.9065163, -1.67197, 1, 0.6588235, 0, 1,
-1.165091, 0.4001634, -1.605233, 1, 0.6666667, 0, 1,
-1.155802, 1.553649, -1.284946, 1, 0.6705883, 0, 1,
-1.153487, -0.2680124, -2.41778, 1, 0.6784314, 0, 1,
-1.145101, -0.1108744, -3.176317, 1, 0.682353, 0, 1,
-1.138776, -0.5239165, -3.460884, 1, 0.6901961, 0, 1,
-1.136692, 0.2281805, -0.09227534, 1, 0.6941177, 0, 1,
-1.135415, -0.05546399, -1.73884, 1, 0.7019608, 0, 1,
-1.128427, 1.406686, -0.7759222, 1, 0.7098039, 0, 1,
-1.126832, -1.534425, -1.37757, 1, 0.7137255, 0, 1,
-1.122019, 1.842714, -0.6956837, 1, 0.7215686, 0, 1,
-1.120451, -1.316794, -5.552864, 1, 0.7254902, 0, 1,
-1.11854, -1.554299, -2.115276, 1, 0.7333333, 0, 1,
-1.117743, -2.530267, -1.785441, 1, 0.7372549, 0, 1,
-1.113887, -1.360764, -0.2948084, 1, 0.7450981, 0, 1,
-1.112964, -1.26044, -0.552054, 1, 0.7490196, 0, 1,
-1.110954, -0.03404302, -2.183615, 1, 0.7568628, 0, 1,
-1.109954, 1.201672, -0.0236063, 1, 0.7607843, 0, 1,
-1.10347, 0.04735428, -1.623556, 1, 0.7686275, 0, 1,
-1.088137, -0.4047282, -3.991374, 1, 0.772549, 0, 1,
-1.08767, -1.153451, -0.9393365, 1, 0.7803922, 0, 1,
-1.085123, -0.6022787, -2.889555, 1, 0.7843137, 0, 1,
-1.085102, 0.4898917, -0.6603158, 1, 0.7921569, 0, 1,
-1.07436, 1.081726, -0.9788516, 1, 0.7960784, 0, 1,
-1.0716, -1.451401, -3.076781, 1, 0.8039216, 0, 1,
-1.063008, 0.1804019, -1.784148, 1, 0.8117647, 0, 1,
-1.059095, 1.358535, -0.6005753, 1, 0.8156863, 0, 1,
-1.054023, 0.08305487, -0.9889048, 1, 0.8235294, 0, 1,
-1.052103, -0.6402285, -2.431011, 1, 0.827451, 0, 1,
-1.040777, -0.8626531, -2.203436, 1, 0.8352941, 0, 1,
-1.038066, -1.699925, -2.997384, 1, 0.8392157, 0, 1,
-1.037461, 0.5365723, -1.930493, 1, 0.8470588, 0, 1,
-1.035201, -0.08281355, -0.5372785, 1, 0.8509804, 0, 1,
-1.033067, 0.000322745, -0.4693258, 1, 0.8588235, 0, 1,
-1.025631, 0.2972493, -0.8111318, 1, 0.8627451, 0, 1,
-1.02462, 0.4686635, -1.055333, 1, 0.8705882, 0, 1,
-1.021018, 0.2097835, -2.404849, 1, 0.8745098, 0, 1,
-1.019904, 0.01165267, -1.315734, 1, 0.8823529, 0, 1,
-1.01079, -0.6212249, -1.749528, 1, 0.8862745, 0, 1,
-1.01078, 0.4838806, -1.843305, 1, 0.8941177, 0, 1,
-1.007226, 0.9132228, 0.2018314, 1, 0.8980392, 0, 1,
-1.006588, -0.8472214, -0.7171852, 1, 0.9058824, 0, 1,
-1.005105, 0.07961827, -1.818272, 1, 0.9137255, 0, 1,
-1.000715, -2.625639, -4.59936, 1, 0.9176471, 0, 1,
-0.9978169, 0.2569141, -2.526803, 1, 0.9254902, 0, 1,
-0.9977451, -0.2402087, 0.1698256, 1, 0.9294118, 0, 1,
-0.9971479, -0.5954449, -2.176661, 1, 0.9372549, 0, 1,
-0.9869188, 0.657424, -1.581646, 1, 0.9411765, 0, 1,
-0.9831372, -0.5956286, -3.943286, 1, 0.9490196, 0, 1,
-0.9789064, 0.9277672, -1.455822, 1, 0.9529412, 0, 1,
-0.977161, 0.5343192, -1.176363, 1, 0.9607843, 0, 1,
-0.9768289, -0.3171002, -1.064115, 1, 0.9647059, 0, 1,
-0.972759, -1.587843, -3.987481, 1, 0.972549, 0, 1,
-0.9688545, 1.613065, -0.7624117, 1, 0.9764706, 0, 1,
-0.9683241, 0.7012259, 0.5685982, 1, 0.9843137, 0, 1,
-0.9681715, 0.1152774, -2.181826, 1, 0.9882353, 0, 1,
-0.9654456, 0.4773603, 0.1721304, 1, 0.9960784, 0, 1,
-0.9634018, -1.112963, -2.463267, 0.9960784, 1, 0, 1,
-0.9573939, 1.301506, -0.2679024, 0.9921569, 1, 0, 1,
-0.9532716, -0.8569309, -3.188928, 0.9843137, 1, 0, 1,
-0.9465814, 0.2064861, -3.059468, 0.9803922, 1, 0, 1,
-0.9399944, 0.2996063, 0.8619823, 0.972549, 1, 0, 1,
-0.9390359, -0.07376078, -3.698717, 0.9686275, 1, 0, 1,
-0.9362741, 1.527304, 0.1416222, 0.9607843, 1, 0, 1,
-0.9230481, 0.09140375, -0.4180852, 0.9568627, 1, 0, 1,
-0.920559, 0.6555892, -1.65279, 0.9490196, 1, 0, 1,
-0.9203253, -1.440398, -1.303931, 0.945098, 1, 0, 1,
-0.9187754, -0.4650241, -0.4888681, 0.9372549, 1, 0, 1,
-0.9098979, 0.6285189, -1.579545, 0.9333333, 1, 0, 1,
-0.9036953, -0.9631006, -0.7995678, 0.9254902, 1, 0, 1,
-0.8958127, 1.615799, -0.62106, 0.9215686, 1, 0, 1,
-0.895182, -0.4987295, -1.243752, 0.9137255, 1, 0, 1,
-0.8948923, -1.921617, -3.706506, 0.9098039, 1, 0, 1,
-0.8913126, 1.119601, -0.9445165, 0.9019608, 1, 0, 1,
-0.8749118, 0.3107897, 0.1637063, 0.8941177, 1, 0, 1,
-0.8726704, -0.9471033, -2.358294, 0.8901961, 1, 0, 1,
-0.8698705, 0.4205704, -0.4688089, 0.8823529, 1, 0, 1,
-0.8676578, 0.3222125, -0.63517, 0.8784314, 1, 0, 1,
-0.8654178, -0.594416, -2.139648, 0.8705882, 1, 0, 1,
-0.8641728, -0.5846887, -3.458132, 0.8666667, 1, 0, 1,
-0.8610036, -0.3596711, -3.763068, 0.8588235, 1, 0, 1,
-0.8606823, 0.4281618, -0.9127026, 0.854902, 1, 0, 1,
-0.8605819, -0.3562573, -0.9036952, 0.8470588, 1, 0, 1,
-0.850047, -1.023951, -3.713809, 0.8431373, 1, 0, 1,
-0.8467424, 0.09128521, -0.9052014, 0.8352941, 1, 0, 1,
-0.8452278, -0.4016573, -0.8336949, 0.8313726, 1, 0, 1,
-0.8411463, -0.5623018, -2.294832, 0.8235294, 1, 0, 1,
-0.827006, 0.5733641, -2.574219, 0.8196079, 1, 0, 1,
-0.8266709, 0.2179161, -1.746439, 0.8117647, 1, 0, 1,
-0.8250457, -0.6690001, -1.274038, 0.8078431, 1, 0, 1,
-0.824145, 0.08342384, -1.149971, 0.8, 1, 0, 1,
-0.8213257, 0.6814365, 1.190538, 0.7921569, 1, 0, 1,
-0.8103066, 0.582656, -0.679112, 0.7882353, 1, 0, 1,
-0.8074583, 0.01766188, -2.521626, 0.7803922, 1, 0, 1,
-0.8069298, -0.1510923, -2.16002, 0.7764706, 1, 0, 1,
-0.8047257, -1.154465, -3.842946, 0.7686275, 1, 0, 1,
-0.8045627, 0.5677062, -0.9531492, 0.7647059, 1, 0, 1,
-0.8010488, 2.624951, -0.1237839, 0.7568628, 1, 0, 1,
-0.7831632, -0.3668035, -1.369513, 0.7529412, 1, 0, 1,
-0.7807918, -0.21862, -2.27156, 0.7450981, 1, 0, 1,
-0.7786804, -0.2308911, -1.021489, 0.7411765, 1, 0, 1,
-0.7755795, -1.486032, -2.894244, 0.7333333, 1, 0, 1,
-0.7732514, -2.319784, -2.528493, 0.7294118, 1, 0, 1,
-0.7639095, 1.449971, -0.3231644, 0.7215686, 1, 0, 1,
-0.7633723, -0.832279, -3.232044, 0.7176471, 1, 0, 1,
-0.7600209, -0.6544243, -3.118282, 0.7098039, 1, 0, 1,
-0.7566463, -0.94481, -3.599788, 0.7058824, 1, 0, 1,
-0.7514793, -1.037125, -2.306413, 0.6980392, 1, 0, 1,
-0.750929, -1.562128, -0.9310464, 0.6901961, 1, 0, 1,
-0.7484681, -1.142491, -0.2589181, 0.6862745, 1, 0, 1,
-0.7458128, 0.07465366, -2.727142, 0.6784314, 1, 0, 1,
-0.7352943, -0.3679733, -2.732909, 0.6745098, 1, 0, 1,
-0.7338685, 0.5314432, -1.303502, 0.6666667, 1, 0, 1,
-0.7337286, -0.985889, -0.4231023, 0.6627451, 1, 0, 1,
-0.7279722, 0.9079294, 0.8680799, 0.654902, 1, 0, 1,
-0.7229322, -0.3835866, -3.101978, 0.6509804, 1, 0, 1,
-0.7165829, -0.4110492, -2.468759, 0.6431373, 1, 0, 1,
-0.7097194, 0.03118495, -1.791264, 0.6392157, 1, 0, 1,
-0.7029654, 1.779588, -1.296132, 0.6313726, 1, 0, 1,
-0.6971837, -0.8079773, -1.921628, 0.627451, 1, 0, 1,
-0.6967924, -0.4275041, -3.841909, 0.6196079, 1, 0, 1,
-0.6884444, -0.4583482, -3.008363, 0.6156863, 1, 0, 1,
-0.6867026, -0.926286, -3.614034, 0.6078432, 1, 0, 1,
-0.6855518, -0.6346722, -2.401146, 0.6039216, 1, 0, 1,
-0.684868, 0.1695333, -1.617404, 0.5960785, 1, 0, 1,
-0.6835065, -1.260905, -2.930048, 0.5882353, 1, 0, 1,
-0.6771432, 2.037861, 0.5453517, 0.5843138, 1, 0, 1,
-0.6748068, 1.068161, -0.4706714, 0.5764706, 1, 0, 1,
-0.665484, -0.7630091, -0.5907202, 0.572549, 1, 0, 1,
-0.6637706, -0.5713131, -3.454369, 0.5647059, 1, 0, 1,
-0.6634445, -0.8562891, -0.5268142, 0.5607843, 1, 0, 1,
-0.6611292, 1.306249, 1.432884, 0.5529412, 1, 0, 1,
-0.6595832, 1.641167, -0.3114214, 0.5490196, 1, 0, 1,
-0.6510028, 1.094756, -0.4617237, 0.5411765, 1, 0, 1,
-0.6506115, -1.127612, -2.25297, 0.5372549, 1, 0, 1,
-0.6476232, -0.6981974, -3.263716, 0.5294118, 1, 0, 1,
-0.646356, -1.282026, -0.6719986, 0.5254902, 1, 0, 1,
-0.6454037, -0.5748865, -1.782028, 0.5176471, 1, 0, 1,
-0.6439973, -0.05680886, -1.99858, 0.5137255, 1, 0, 1,
-0.6436642, 0.06716656, -0.931304, 0.5058824, 1, 0, 1,
-0.6435555, 1.129924, 0.14368, 0.5019608, 1, 0, 1,
-0.6419973, -0.3187743, -1.187449, 0.4941176, 1, 0, 1,
-0.6401173, -0.1168934, -0.1258836, 0.4862745, 1, 0, 1,
-0.6305314, 0.4016269, -0.6557828, 0.4823529, 1, 0, 1,
-0.6244938, -0.3016758, -0.9917544, 0.4745098, 1, 0, 1,
-0.6241372, 1.23495, -1.452731, 0.4705882, 1, 0, 1,
-0.6219754, 0.493111, -1.549739, 0.4627451, 1, 0, 1,
-0.6114252, -0.7403164, -3.459728, 0.4588235, 1, 0, 1,
-0.6099502, 1.190994, 1.575269, 0.4509804, 1, 0, 1,
-0.6030818, 0.7812276, -0.7698997, 0.4470588, 1, 0, 1,
-0.6026327, 0.2465025, -1.643969, 0.4392157, 1, 0, 1,
-0.6019753, -0.670113, -2.106415, 0.4352941, 1, 0, 1,
-0.600489, -0.7232483, -3.257396, 0.427451, 1, 0, 1,
-0.5989377, 0.3481137, -0.8752306, 0.4235294, 1, 0, 1,
-0.5943722, 2.080745, -1.058974, 0.4156863, 1, 0, 1,
-0.5912653, -1.172385, -2.122608, 0.4117647, 1, 0, 1,
-0.5885382, 0.8664135, -3.065172, 0.4039216, 1, 0, 1,
-0.5848705, -0.5253586, -0.2205458, 0.3960784, 1, 0, 1,
-0.5798939, -0.2108509, -2.064808, 0.3921569, 1, 0, 1,
-0.577516, 0.8170285, -0.1331596, 0.3843137, 1, 0, 1,
-0.5750821, -0.1555118, -2.492954, 0.3803922, 1, 0, 1,
-0.5725456, -1.852277, -3.693297, 0.372549, 1, 0, 1,
-0.5725134, -1.111726, -3.675223, 0.3686275, 1, 0, 1,
-0.5691898, 1.191022, 0.06660467, 0.3607843, 1, 0, 1,
-0.5647926, -0.09150463, -1.338155, 0.3568628, 1, 0, 1,
-0.5493706, 0.5813271, -0.6203872, 0.3490196, 1, 0, 1,
-0.5409414, -0.3749164, -2.277343, 0.345098, 1, 0, 1,
-0.5402854, 1.372903, -0.5489869, 0.3372549, 1, 0, 1,
-0.5377965, -1.251888, -1.891784, 0.3333333, 1, 0, 1,
-0.5340816, 0.6832859, 1.416361, 0.3254902, 1, 0, 1,
-0.5249454, 0.2003167, -1.340662, 0.3215686, 1, 0, 1,
-0.5219868, -0.2548694, -1.115088, 0.3137255, 1, 0, 1,
-0.520149, -0.4261019, -4.004133, 0.3098039, 1, 0, 1,
-0.518689, -0.7701521, -3.172221, 0.3019608, 1, 0, 1,
-0.51785, 0.3641272, -1.092319, 0.2941177, 1, 0, 1,
-0.5155315, -1.060424, -4.218795, 0.2901961, 1, 0, 1,
-0.506101, -0.03247374, -2.783706, 0.282353, 1, 0, 1,
-0.5051987, -1.201101, -2.684133, 0.2784314, 1, 0, 1,
-0.4965713, -0.05207383, -1.868185, 0.2705882, 1, 0, 1,
-0.4961458, 0.9578995, -1.216424, 0.2666667, 1, 0, 1,
-0.4934587, -0.754257, -1.151474, 0.2588235, 1, 0, 1,
-0.4877245, -0.4638234, -3.219683, 0.254902, 1, 0, 1,
-0.4854417, 0.6183882, 1.127761, 0.2470588, 1, 0, 1,
-0.4842578, 0.90601, -0.7490214, 0.2431373, 1, 0, 1,
-0.4822327, 0.7850076, 0.8771856, 0.2352941, 1, 0, 1,
-0.4718347, 1.371749, -0.1037003, 0.2313726, 1, 0, 1,
-0.4695378, -1.134604, -3.22931, 0.2235294, 1, 0, 1,
-0.4679098, 1.231307, 0.4913357, 0.2196078, 1, 0, 1,
-0.465221, -0.4729081, -3.956319, 0.2117647, 1, 0, 1,
-0.4636976, 1.021691, 0.7959228, 0.2078431, 1, 0, 1,
-0.4603589, -0.1528692, -1.372637, 0.2, 1, 0, 1,
-0.4593401, 0.7861896, -1.099158, 0.1921569, 1, 0, 1,
-0.4583878, 0.1595193, -1.455153, 0.1882353, 1, 0, 1,
-0.4577787, 0.5211955, 0.3231467, 0.1803922, 1, 0, 1,
-0.4558015, -0.5248293, -3.233048, 0.1764706, 1, 0, 1,
-0.4493532, -0.9397219, -1.500238, 0.1686275, 1, 0, 1,
-0.4454972, -0.08141228, -0.5335245, 0.1647059, 1, 0, 1,
-0.4413726, 0.1991059, -2.039618, 0.1568628, 1, 0, 1,
-0.4385127, 0.8665198, -0.2121405, 0.1529412, 1, 0, 1,
-0.43523, -0.6099553, -2.581627, 0.145098, 1, 0, 1,
-0.4346764, 0.1934978, -2.786894, 0.1411765, 1, 0, 1,
-0.4324649, 1.401698, -1.325623, 0.1333333, 1, 0, 1,
-0.4315554, -1.104998, -4.494987, 0.1294118, 1, 0, 1,
-0.4303389, 1.739889, 1.556524, 0.1215686, 1, 0, 1,
-0.4270567, 0.0368781, -0.6534616, 0.1176471, 1, 0, 1,
-0.4142669, -0.7620252, -1.957355, 0.1098039, 1, 0, 1,
-0.4105548, -0.2529604, -0.4118333, 0.1058824, 1, 0, 1,
-0.4041729, 0.03221837, -1.338272, 0.09803922, 1, 0, 1,
-0.4008524, -1.126898, -3.550334, 0.09019608, 1, 0, 1,
-0.3964112, -0.7878689, -1.238216, 0.08627451, 1, 0, 1,
-0.3894257, 1.065845, -0.5902995, 0.07843138, 1, 0, 1,
-0.3887974, -0.9598519, -3.158632, 0.07450981, 1, 0, 1,
-0.3825827, 0.5412598, -0.9782357, 0.06666667, 1, 0, 1,
-0.3804236, -0.2972575, -2.995395, 0.0627451, 1, 0, 1,
-0.3744184, 0.4808502, -0.1155959, 0.05490196, 1, 0, 1,
-0.3701607, -0.1153933, -3.556913, 0.05098039, 1, 0, 1,
-0.3666097, 0.447737, 0.6025172, 0.04313726, 1, 0, 1,
-0.3596183, -0.3382068, -3.491864, 0.03921569, 1, 0, 1,
-0.3570169, 0.4502844, 0.1485672, 0.03137255, 1, 0, 1,
-0.3560114, 0.05359878, 0.7209092, 0.02745098, 1, 0, 1,
-0.35577, 3.167569, -0.02852665, 0.01960784, 1, 0, 1,
-0.3537914, -0.2401436, -1.994859, 0.01568628, 1, 0, 1,
-0.3526464, 0.1213331, -1.749149, 0.007843138, 1, 0, 1,
-0.3519891, 0.7954377, -0.51943, 0.003921569, 1, 0, 1,
-0.3518484, 0.03954627, -0.3484044, 0, 1, 0.003921569, 1,
-0.3464508, -0.1829889, -3.517008, 0, 1, 0.01176471, 1,
-0.3417439, -1.365469, -1.796095, 0, 1, 0.01568628, 1,
-0.3392182, -0.101331, -0.9374586, 0, 1, 0.02352941, 1,
-0.3372303, -0.5381356, -3.576618, 0, 1, 0.02745098, 1,
-0.3371017, 0.05636278, -1.871402, 0, 1, 0.03529412, 1,
-0.3356559, 0.192067, -0.575677, 0, 1, 0.03921569, 1,
-0.3343018, 0.6233559, -0.4806879, 0, 1, 0.04705882, 1,
-0.3324605, 1.993637, -0.3585351, 0, 1, 0.05098039, 1,
-0.3316222, 0.3995265, -0.6678711, 0, 1, 0.05882353, 1,
-0.3308448, 1.284977, 0.442311, 0, 1, 0.0627451, 1,
-0.330812, 0.2758928, -1.305161, 0, 1, 0.07058824, 1,
-0.3303277, -0.778303, -3.153896, 0, 1, 0.07450981, 1,
-0.3298853, 0.3358736, -0.1223884, 0, 1, 0.08235294, 1,
-0.3285852, -0.1706128, -0.9487646, 0, 1, 0.08627451, 1,
-0.3271418, -0.3979397, -2.274537, 0, 1, 0.09411765, 1,
-0.3205721, -2.752238, -3.179588, 0, 1, 0.1019608, 1,
-0.3186322, -0.5828921, -2.545727, 0, 1, 0.1058824, 1,
-0.317796, -0.765504, -2.778404, 0, 1, 0.1137255, 1,
-0.3140699, 1.147672, -0.3455424, 0, 1, 0.1176471, 1,
-0.3082195, -0.2846852, -2.762084, 0, 1, 0.1254902, 1,
-0.3048207, -0.6316295, -1.401043, 0, 1, 0.1294118, 1,
-0.302399, -0.06431014, -2.188349, 0, 1, 0.1372549, 1,
-0.3020844, 1.314026, -0.840749, 0, 1, 0.1411765, 1,
-0.2956154, -0.03980118, -2.083606, 0, 1, 0.1490196, 1,
-0.2854124, -1.039597, -3.781287, 0, 1, 0.1529412, 1,
-0.2838033, 0.5956353, 0.2515812, 0, 1, 0.1607843, 1,
-0.283468, -0.0067948, -1.916563, 0, 1, 0.1647059, 1,
-0.2756295, 1.53714, 0.7549408, 0, 1, 0.172549, 1,
-0.2750328, 0.7026287, -1.788449, 0, 1, 0.1764706, 1,
-0.2749138, 1.393381, -0.9280368, 0, 1, 0.1843137, 1,
-0.2741018, 0.0274445, -1.590549, 0, 1, 0.1882353, 1,
-0.2733943, -0.480513, -2.998083, 0, 1, 0.1960784, 1,
-0.2726644, -1.492644, -2.359338, 0, 1, 0.2039216, 1,
-0.2663682, -0.6402022, -2.534302, 0, 1, 0.2078431, 1,
-0.2636294, -0.9011286, -3.749132, 0, 1, 0.2156863, 1,
-0.2623599, 0.4835434, -0.5970417, 0, 1, 0.2196078, 1,
-0.2599302, -1.800853, -1.819966, 0, 1, 0.227451, 1,
-0.2550476, -0.242954, -2.397643, 0, 1, 0.2313726, 1,
-0.2547023, 2.529899, 0.5779119, 0, 1, 0.2392157, 1,
-0.2531682, -0.8332613, -2.258836, 0, 1, 0.2431373, 1,
-0.2481759, 0.1404272, -2.372405, 0, 1, 0.2509804, 1,
-0.2438717, 1.606627, 0.5465308, 0, 1, 0.254902, 1,
-0.2425422, 1.228158, 0.08639019, 0, 1, 0.2627451, 1,
-0.2398598, 0.588328, -1.180095, 0, 1, 0.2666667, 1,
-0.2391255, -2.018196, -2.657121, 0, 1, 0.2745098, 1,
-0.2389003, -0.0516961, -1.724316, 0, 1, 0.2784314, 1,
-0.238655, 0.4264773, 1.793521, 0, 1, 0.2862745, 1,
-0.2375774, 2.055473, -1.8151, 0, 1, 0.2901961, 1,
-0.235267, -0.4633898, -2.90601, 0, 1, 0.2980392, 1,
-0.234263, -0.2094108, -1.460174, 0, 1, 0.3058824, 1,
-0.2339217, -1.489442, -2.759263, 0, 1, 0.3098039, 1,
-0.2320484, 1.705631, 0.3407342, 0, 1, 0.3176471, 1,
-0.2319687, -0.477253, -3.052363, 0, 1, 0.3215686, 1,
-0.2281118, -1.833284, -2.395211, 0, 1, 0.3294118, 1,
-0.2239951, -0.3471875, -1.063733, 0, 1, 0.3333333, 1,
-0.2238919, -1.272315, -3.06287, 0, 1, 0.3411765, 1,
-0.2225362, 0.1034749, -1.483078, 0, 1, 0.345098, 1,
-0.2221, -0.8953618, -3.669633, 0, 1, 0.3529412, 1,
-0.2176929, 1.82445, -0.1156088, 0, 1, 0.3568628, 1,
-0.2159671, 0.8982344, -1.371311, 0, 1, 0.3647059, 1,
-0.2159598, 0.7697521, 0.3735113, 0, 1, 0.3686275, 1,
-0.2157581, 0.9187809, -0.5523053, 0, 1, 0.3764706, 1,
-0.2155259, 2.042151, -1.040543, 0, 1, 0.3803922, 1,
-0.2146332, -0.3760593, -3.820496, 0, 1, 0.3882353, 1,
-0.2124033, -1.085295, -3.084289, 0, 1, 0.3921569, 1,
-0.210882, 1.769294, -0.2745017, 0, 1, 0.4, 1,
-0.203237, 0.5073894, 0.7448809, 0, 1, 0.4078431, 1,
-0.2012942, 0.2881051, -0.09644371, 0, 1, 0.4117647, 1,
-0.1996101, 0.7262191, 2.182892, 0, 1, 0.4196078, 1,
-0.1981489, -0.5225509, -3.060111, 0, 1, 0.4235294, 1,
-0.1970909, 0.7218981, -0.1896558, 0, 1, 0.4313726, 1,
-0.1948794, -1.721441, -3.934436, 0, 1, 0.4352941, 1,
-0.1925833, 0.07019652, -2.675962, 0, 1, 0.4431373, 1,
-0.1904083, 2.464994, 0.7330155, 0, 1, 0.4470588, 1,
-0.189554, -1.151907, -3.39383, 0, 1, 0.454902, 1,
-0.1895504, -0.4179713, -1.851415, 0, 1, 0.4588235, 1,
-0.1875079, -0.7592828, -1.711719, 0, 1, 0.4666667, 1,
-0.186178, -1.111837, -3.583458, 0, 1, 0.4705882, 1,
-0.1851334, -0.7272888, -2.642994, 0, 1, 0.4784314, 1,
-0.1831838, -0.1972809, -2.383808, 0, 1, 0.4823529, 1,
-0.1813979, -1.568624, -3.232699, 0, 1, 0.4901961, 1,
-0.1776683, 0.1030497, -1.786504, 0, 1, 0.4941176, 1,
-0.1771671, 1.612332, -0.7318543, 0, 1, 0.5019608, 1,
-0.1771022, 1.1557, 1.420509, 0, 1, 0.509804, 1,
-0.1761751, 2.193069, 1.707035, 0, 1, 0.5137255, 1,
-0.1720703, 0.5730307, -1.012138, 0, 1, 0.5215687, 1,
-0.1718855, -0.5239832, -4.263602, 0, 1, 0.5254902, 1,
-0.1718093, 0.5150518, -0.1683792, 0, 1, 0.5333334, 1,
-0.1685184, 1.444714, -0.4268323, 0, 1, 0.5372549, 1,
-0.1637111, 0.4423409, 0.1930541, 0, 1, 0.5450981, 1,
-0.1598926, 0.5451675, -0.4735762, 0, 1, 0.5490196, 1,
-0.1556018, 0.6889768, -0.2638556, 0, 1, 0.5568628, 1,
-0.1522661, 2.657117, -0.8202274, 0, 1, 0.5607843, 1,
-0.1405759, 0.1456026, -0.2438424, 0, 1, 0.5686275, 1,
-0.1328204, 1.247086, -0.5518427, 0, 1, 0.572549, 1,
-0.1293674, 0.1298579, 1.550408, 0, 1, 0.5803922, 1,
-0.129119, 0.8714598, -2.276509, 0, 1, 0.5843138, 1,
-0.1263301, -0.8063437, -3.606798, 0, 1, 0.5921569, 1,
-0.1206182, -0.04062893, -1.90824, 0, 1, 0.5960785, 1,
-0.1136533, -1.538586, -5.054885, 0, 1, 0.6039216, 1,
-0.1075484, -1.300402, -1.720153, 0, 1, 0.6117647, 1,
-0.1070128, 1.184792, -1.336608, 0, 1, 0.6156863, 1,
-0.1056796, 0.3384268, -1.228787, 0, 1, 0.6235294, 1,
-0.1028928, -2.243289, -3.397603, 0, 1, 0.627451, 1,
-0.0988659, -0.218204, -1.463634, 0, 1, 0.6352941, 1,
-0.09737968, -0.2145885, -3.090152, 0, 1, 0.6392157, 1,
-0.09350231, 0.9831286, -0.7029471, 0, 1, 0.6470588, 1,
-0.0925277, -0.2131966, -2.345243, 0, 1, 0.6509804, 1,
-0.08901112, -0.8668648, -2.629717, 0, 1, 0.6588235, 1,
-0.08871073, 0.8986821, -0.3702855, 0, 1, 0.6627451, 1,
-0.08627505, 0.1998621, 0.5187672, 0, 1, 0.6705883, 1,
-0.0841835, -1.446729, -4.109638, 0, 1, 0.6745098, 1,
-0.07908202, 1.55371, -1.162543, 0, 1, 0.682353, 1,
-0.07267665, -0.2141407, -2.612945, 0, 1, 0.6862745, 1,
-0.07231795, 0.3511551, -0.8702989, 0, 1, 0.6941177, 1,
-0.06875138, -0.7296937, -4.08962, 0, 1, 0.7019608, 1,
-0.06519014, -1.389485, -3.908791, 0, 1, 0.7058824, 1,
-0.06469387, 0.5677183, 0.1023742, 0, 1, 0.7137255, 1,
-0.06389599, 0.9700513, 0.7311525, 0, 1, 0.7176471, 1,
-0.06203565, -2.471585, -3.865554, 0, 1, 0.7254902, 1,
-0.05372578, 1.661783, 0.2757019, 0, 1, 0.7294118, 1,
-0.04796539, -0.6651154, -2.727582, 0, 1, 0.7372549, 1,
-0.04564674, -2.09727, -2.831447, 0, 1, 0.7411765, 1,
-0.04425592, -0.3451558, -1.813143, 0, 1, 0.7490196, 1,
-0.04362799, 0.03454123, 1.2227, 0, 1, 0.7529412, 1,
-0.04318282, -0.3548702, -4.768239, 0, 1, 0.7607843, 1,
-0.04075511, 1.010242, -0.6955569, 0, 1, 0.7647059, 1,
-0.04025412, 0.5990217, -1.494575, 0, 1, 0.772549, 1,
-0.03733916, -0.2853527, -1.352066, 0, 1, 0.7764706, 1,
-0.03361021, 0.1544875, 1.990401, 0, 1, 0.7843137, 1,
-0.0330303, -0.2493197, -4.215848, 0, 1, 0.7882353, 1,
-0.03269416, -0.3627353, -4.493169, 0, 1, 0.7960784, 1,
-0.03097674, -0.9141764, -3.246067, 0, 1, 0.8039216, 1,
-0.02850294, 0.6822127, -0.3885788, 0, 1, 0.8078431, 1,
-0.02477017, 0.1038713, 0.07625841, 0, 1, 0.8156863, 1,
-0.02390261, -0.7468348, -0.4675429, 0, 1, 0.8196079, 1,
-0.01431298, 0.9095195, -0.3163992, 0, 1, 0.827451, 1,
-0.01190339, 1.708427, -0.688514, 0, 1, 0.8313726, 1,
-0.01026993, 0.9568138, 0.4436233, 0, 1, 0.8392157, 1,
-0.006764123, 1.018789, -1.522762, 0, 1, 0.8431373, 1,
-0.003831477, 0.8044339, 2.058503, 0, 1, 0.8509804, 1,
-0.0003181355, -0.6735151, -1.511847, 0, 1, 0.854902, 1,
0.0002936944, 0.5819003, 0.5650972, 0, 1, 0.8627451, 1,
0.006428806, 0.4632269, -0.8329701, 0, 1, 0.8666667, 1,
0.007081752, 0.8643421, -1.318328, 0, 1, 0.8745098, 1,
0.008435181, 0.8234588, 2.157897, 0, 1, 0.8784314, 1,
0.008460368, -1.032922, 3.647798, 0, 1, 0.8862745, 1,
0.009656531, 0.6560336, 1.702101, 0, 1, 0.8901961, 1,
0.01102892, 1.386859, -0.05026929, 0, 1, 0.8980392, 1,
0.01567551, 0.7739731, 0.2430459, 0, 1, 0.9058824, 1,
0.01696216, 1.272366, 0.7409375, 0, 1, 0.9098039, 1,
0.03007759, 0.9458123, -1.548433, 0, 1, 0.9176471, 1,
0.03281124, 0.1089508, 1.417917, 0, 1, 0.9215686, 1,
0.04464362, 1.661389, 0.8408331, 0, 1, 0.9294118, 1,
0.04493307, -0.7066733, 3.87078, 0, 1, 0.9333333, 1,
0.04508126, -0.1291783, 3.098335, 0, 1, 0.9411765, 1,
0.04568148, 1.735928, -1.49902, 0, 1, 0.945098, 1,
0.04636059, -0.7005889, 1.858257, 0, 1, 0.9529412, 1,
0.04744671, -0.6493046, 3.375666, 0, 1, 0.9568627, 1,
0.05311489, -0.9108053, 4.350451, 0, 1, 0.9647059, 1,
0.05744535, -1.906407, 5.147397, 0, 1, 0.9686275, 1,
0.06075089, 0.8552392, -0.7005662, 0, 1, 0.9764706, 1,
0.06402864, -1.223759, 3.996799, 0, 1, 0.9803922, 1,
0.06637183, 0.3545123, 1.168442, 0, 1, 0.9882353, 1,
0.06875151, -0.669703, 1.997389, 0, 1, 0.9921569, 1,
0.06958745, 0.6694046, -1.849208, 0, 1, 1, 1,
0.07153531, -2.476315, 1.018366, 0, 0.9921569, 1, 1,
0.0775862, 1.633436, -1.477337, 0, 0.9882353, 1, 1,
0.07950573, 1.203648, 0.8646668, 0, 0.9803922, 1, 1,
0.08286998, 1.784036, 2.027368, 0, 0.9764706, 1, 1,
0.08372365, -0.7224471, 3.78269, 0, 0.9686275, 1, 1,
0.08482365, 0.7742102, 0.7588675, 0, 0.9647059, 1, 1,
0.08692287, 1.369832, -2.1986, 0, 0.9568627, 1, 1,
0.0931927, -0.384831, 2.623042, 0, 0.9529412, 1, 1,
0.09461404, -0.7613048, 3.963689, 0, 0.945098, 1, 1,
0.09639537, 0.6092584, -0.06675478, 0, 0.9411765, 1, 1,
0.09658648, -1.583658, 3.709979, 0, 0.9333333, 1, 1,
0.09961923, -0.7100166, 3.727695, 0, 0.9294118, 1, 1,
0.1005891, 0.22103, 0.3310983, 0, 0.9215686, 1, 1,
0.1008573, -0.2524065, 2.690656, 0, 0.9176471, 1, 1,
0.1009194, -1.053764, 2.450201, 0, 0.9098039, 1, 1,
0.1014507, 0.5807328, 2.525441, 0, 0.9058824, 1, 1,
0.1036985, 0.656929, 0.2571511, 0, 0.8980392, 1, 1,
0.1064021, -0.00484516, 3.193215, 0, 0.8901961, 1, 1,
0.1076493, 0.6621439, 1.031266, 0, 0.8862745, 1, 1,
0.108375, -2.12909, 4.084969, 0, 0.8784314, 1, 1,
0.1095812, 1.182718, 0.9024761, 0, 0.8745098, 1, 1,
0.1113883, -0.7856625, 3.808164, 0, 0.8666667, 1, 1,
0.1121413, 1.365972, -1.585616, 0, 0.8627451, 1, 1,
0.1129816, 0.8708515, -0.7169704, 0, 0.854902, 1, 1,
0.1236168, 1.462721, 0.3503267, 0, 0.8509804, 1, 1,
0.1284758, 1.400246, 0.6244677, 0, 0.8431373, 1, 1,
0.1310337, -1.378963, 3.102276, 0, 0.8392157, 1, 1,
0.1354102, 0.6478252, 1.901921, 0, 0.8313726, 1, 1,
0.1394159, -1.344698, 2.070621, 0, 0.827451, 1, 1,
0.1428707, -1.370559, 1.533818, 0, 0.8196079, 1, 1,
0.1442827, -0.3724715, 1.592438, 0, 0.8156863, 1, 1,
0.1456256, -1.822119, 4.569739, 0, 0.8078431, 1, 1,
0.1461179, 0.3692234, 2.541232, 0, 0.8039216, 1, 1,
0.14929, -0.7677373, 1.861822, 0, 0.7960784, 1, 1,
0.1510382, -1.321641, 3.892706, 0, 0.7882353, 1, 1,
0.1554377, 0.2882524, -0.4079086, 0, 0.7843137, 1, 1,
0.1614973, 2.512309, -0.7930067, 0, 0.7764706, 1, 1,
0.1634506, 0.549444, -0.9426166, 0, 0.772549, 1, 1,
0.1643522, 0.672594, -0.2674611, 0, 0.7647059, 1, 1,
0.1715062, -0.3293919, 2.127823, 0, 0.7607843, 1, 1,
0.177904, 0.8106886, -0.6695734, 0, 0.7529412, 1, 1,
0.1796342, 0.4421071, -0.2696318, 0, 0.7490196, 1, 1,
0.1851458, 0.5805272, 1.37924, 0, 0.7411765, 1, 1,
0.1860881, 0.9218861, 0.7951193, 0, 0.7372549, 1, 1,
0.191378, -0.9388072, 4.514323, 0, 0.7294118, 1, 1,
0.1960469, 0.2324075, 0.867353, 0, 0.7254902, 1, 1,
0.1969892, -0.3609084, 2.70604, 0, 0.7176471, 1, 1,
0.1992233, -0.7164779, 2.335707, 0, 0.7137255, 1, 1,
0.2004908, -0.3714024, 3.803808, 0, 0.7058824, 1, 1,
0.2011676, 0.3466571, 0.3776737, 0, 0.6980392, 1, 1,
0.2013679, 0.5453905, -0.130726, 0, 0.6941177, 1, 1,
0.2032708, 0.4538627, 1.364508, 0, 0.6862745, 1, 1,
0.2039351, -0.6210225, 2.640619, 0, 0.682353, 1, 1,
0.2062712, 1.971928, -1.334073, 0, 0.6745098, 1, 1,
0.2112826, 0.3624582, 1.409364, 0, 0.6705883, 1, 1,
0.2202873, -0.7638261, 2.063338, 0, 0.6627451, 1, 1,
0.2206985, -0.5721301, 2.291935, 0, 0.6588235, 1, 1,
0.2223532, -0.03382937, 1.508096, 0, 0.6509804, 1, 1,
0.2238372, -0.3119977, 1.711104, 0, 0.6470588, 1, 1,
0.2246693, -1.415211, 1.852918, 0, 0.6392157, 1, 1,
0.2249043, -0.7226431, 3.262041, 0, 0.6352941, 1, 1,
0.2274075, -1.645703, 3.764447, 0, 0.627451, 1, 1,
0.2324516, -0.01694763, 2.508248, 0, 0.6235294, 1, 1,
0.2328987, -0.1428488, 2.131105, 0, 0.6156863, 1, 1,
0.2350031, -1.015047, 4.040617, 0, 0.6117647, 1, 1,
0.2350993, 1.120844, -1.319017, 0, 0.6039216, 1, 1,
0.2419192, 0.3933275, 0.2800531, 0, 0.5960785, 1, 1,
0.2452448, -1.641311, 4.194323, 0, 0.5921569, 1, 1,
0.24733, -0.2811681, 2.248312, 0, 0.5843138, 1, 1,
0.2482792, -0.6405755, 1.736791, 0, 0.5803922, 1, 1,
0.255514, 0.8544679, -0.2477383, 0, 0.572549, 1, 1,
0.255917, -0.7332333, 2.162157, 0, 0.5686275, 1, 1,
0.2569951, 0.09667328, 1.426943, 0, 0.5607843, 1, 1,
0.2599563, 0.9190201, 1.829133, 0, 0.5568628, 1, 1,
0.260421, 0.0669724, 0.9817111, 0, 0.5490196, 1, 1,
0.2638344, 1.371782, -0.2043386, 0, 0.5450981, 1, 1,
0.2657763, 0.01136556, 1.415672, 0, 0.5372549, 1, 1,
0.2682383, 0.782436, 0.9424812, 0, 0.5333334, 1, 1,
0.2686473, 0.5467265, 1.535138, 0, 0.5254902, 1, 1,
0.2689812, -0.1395359, 2.649902, 0, 0.5215687, 1, 1,
0.2695363, -1.126099, 1.96372, 0, 0.5137255, 1, 1,
0.2824582, -2.11829, 3.347095, 0, 0.509804, 1, 1,
0.2847669, -0.09112513, 1.75168, 0, 0.5019608, 1, 1,
0.2916112, -0.7085052, 4.121758, 0, 0.4941176, 1, 1,
0.2919365, 0.2843502, -0.4529218, 0, 0.4901961, 1, 1,
0.2933045, -0.3666578, 1.544359, 0, 0.4823529, 1, 1,
0.2943965, -0.6691571, 2.805902, 0, 0.4784314, 1, 1,
0.2957855, 0.8978919, -0.1540193, 0, 0.4705882, 1, 1,
0.2970244, 0.4231976, -0.9221595, 0, 0.4666667, 1, 1,
0.297797, -1.021056, 2.165437, 0, 0.4588235, 1, 1,
0.2990915, -0.1598562, 0.3500937, 0, 0.454902, 1, 1,
0.3042376, 1.783466, 0.2040087, 0, 0.4470588, 1, 1,
0.3050407, -1.341514, 3.002145, 0, 0.4431373, 1, 1,
0.3051184, -0.5331041, 0.723108, 0, 0.4352941, 1, 1,
0.3051917, 1.845312, -0.3541506, 0, 0.4313726, 1, 1,
0.3065506, -0.2848408, 2.930965, 0, 0.4235294, 1, 1,
0.307631, 0.1486814, 1.081733, 0, 0.4196078, 1, 1,
0.3103684, -2.572576, 3.881225, 0, 0.4117647, 1, 1,
0.313159, 1.326767, -1.577056, 0, 0.4078431, 1, 1,
0.315486, 0.1514237, 1.19373, 0, 0.4, 1, 1,
0.3168105, 1.817983, -0.0137889, 0, 0.3921569, 1, 1,
0.3189589, 0.2613869, 2.422583, 0, 0.3882353, 1, 1,
0.320059, 2.318493, -0.5796678, 0, 0.3803922, 1, 1,
0.3206487, 1.219237, 1.020658, 0, 0.3764706, 1, 1,
0.3250555, -1.686721, 4.535614, 0, 0.3686275, 1, 1,
0.3274833, -0.5761611, 2.971474, 0, 0.3647059, 1, 1,
0.3315914, -0.7284071, 2.274894, 0, 0.3568628, 1, 1,
0.331617, 1.247131, 0.7900712, 0, 0.3529412, 1, 1,
0.3368287, -0.3344731, 1.905539, 0, 0.345098, 1, 1,
0.3374515, 1.084792, -0.09991333, 0, 0.3411765, 1, 1,
0.3418907, -0.863827, 3.599194, 0, 0.3333333, 1, 1,
0.3439403, -0.8372207, 2.749177, 0, 0.3294118, 1, 1,
0.3441158, -0.1825248, 2.790643, 0, 0.3215686, 1, 1,
0.3451492, 0.4681139, -0.6119201, 0, 0.3176471, 1, 1,
0.3492296, -0.6378217, 3.809835, 0, 0.3098039, 1, 1,
0.3492747, -1.116047, 2.405394, 0, 0.3058824, 1, 1,
0.3568745, -0.6012627, 0.8842085, 0, 0.2980392, 1, 1,
0.3590491, 0.689705, -0.2834608, 0, 0.2901961, 1, 1,
0.3602813, -1.088378, 0.9794838, 0, 0.2862745, 1, 1,
0.3610694, 2.218971, 1.502778, 0, 0.2784314, 1, 1,
0.3631236, -0.06054953, 2.873961, 0, 0.2745098, 1, 1,
0.3649585, -0.2280948, -0.1025768, 0, 0.2666667, 1, 1,
0.3706966, -1.657741, 3.548294, 0, 0.2627451, 1, 1,
0.3768994, -0.05509196, 2.664433, 0, 0.254902, 1, 1,
0.3791429, -0.621558, 2.002526, 0, 0.2509804, 1, 1,
0.3799188, 1.226464, 0.9325785, 0, 0.2431373, 1, 1,
0.3815838, 1.329144, -0.2016296, 0, 0.2392157, 1, 1,
0.3869789, -0.8672571, 1.640779, 0, 0.2313726, 1, 1,
0.3889328, 1.703642, -0.7352632, 0, 0.227451, 1, 1,
0.3901443, 0.3574402, 1.956403, 0, 0.2196078, 1, 1,
0.3927404, -0.7137977, 2.972837, 0, 0.2156863, 1, 1,
0.3960467, 0.3762304, 0.6671833, 0, 0.2078431, 1, 1,
0.3964264, 0.5172537, -0.5736264, 0, 0.2039216, 1, 1,
0.4032038, 1.194015, 2.386205, 0, 0.1960784, 1, 1,
0.4084328, -0.7994031, 3.453395, 0, 0.1882353, 1, 1,
0.4157041, -1.307439, 2.665722, 0, 0.1843137, 1, 1,
0.4166172, -0.03173543, 1.126459, 0, 0.1764706, 1, 1,
0.417175, -1.971749, 2.157983, 0, 0.172549, 1, 1,
0.4193676, -0.1164437, 1.895907, 0, 0.1647059, 1, 1,
0.4217448, 0.3879075, 1.826886, 0, 0.1607843, 1, 1,
0.4258786, 1.645082, -0.9172648, 0, 0.1529412, 1, 1,
0.4266364, 0.3399683, 1.672819, 0, 0.1490196, 1, 1,
0.4279636, -0.455876, 2.120901, 0, 0.1411765, 1, 1,
0.4297603, 0.06954799, -0.7365867, 0, 0.1372549, 1, 1,
0.4333017, 1.235739, -1.430949, 0, 0.1294118, 1, 1,
0.4341131, -0.08412439, 1.871655, 0, 0.1254902, 1, 1,
0.4342201, 1.174072, 1.584569, 0, 0.1176471, 1, 1,
0.4355779, 0.7319604, 0.9840407, 0, 0.1137255, 1, 1,
0.4376582, 0.7841425, 1.735093, 0, 0.1058824, 1, 1,
0.4437717, 0.1226096, 1.29055, 0, 0.09803922, 1, 1,
0.4449599, -0.5404926, 3.507975, 0, 0.09411765, 1, 1,
0.4463819, 1.334969, -0.2926739, 0, 0.08627451, 1, 1,
0.4470155, -1.730102, 3.894432, 0, 0.08235294, 1, 1,
0.4481139, -0.3470243, 1.74278, 0, 0.07450981, 1, 1,
0.4522906, -1.022243, 2.973329, 0, 0.07058824, 1, 1,
0.4580524, 0.1801265, 1.340283, 0, 0.0627451, 1, 1,
0.4581471, -0.8094289, 3.140221, 0, 0.05882353, 1, 1,
0.4601403, 0.6901819, 0.538137, 0, 0.05098039, 1, 1,
0.4633065, -0.1758729, -0.2015153, 0, 0.04705882, 1, 1,
0.4640706, -1.498678, 3.208882, 0, 0.03921569, 1, 1,
0.4657618, -0.01327021, -0.1768804, 0, 0.03529412, 1, 1,
0.4663436, 2.666175, 0.3020369, 0, 0.02745098, 1, 1,
0.4692628, 0.3929819, 0.7496778, 0, 0.02352941, 1, 1,
0.4709585, 1.284642, -0.2339596, 0, 0.01568628, 1, 1,
0.4724397, -0.898865, 2.024915, 0, 0.01176471, 1, 1,
0.4799342, 1.240612, 1.774627, 0, 0.003921569, 1, 1,
0.4805461, -1.246327, 3.018422, 0.003921569, 0, 1, 1,
0.4806931, -0.745909, 1.878988, 0.007843138, 0, 1, 1,
0.482144, -2.226724, 2.400783, 0.01568628, 0, 1, 1,
0.4853082, 0.2816835, 0.8251526, 0.01960784, 0, 1, 1,
0.4857377, 1.014295, 0.129235, 0.02745098, 0, 1, 1,
0.4888835, 0.003675827, 0.6118899, 0.03137255, 0, 1, 1,
0.4933513, -1.069081, 3.508063, 0.03921569, 0, 1, 1,
0.4963289, -1.585698, 3.361562, 0.04313726, 0, 1, 1,
0.4978704, -0.01055064, 0.04214937, 0.05098039, 0, 1, 1,
0.4994822, 0.03716196, 1.164306, 0.05490196, 0, 1, 1,
0.501945, -0.2925994, 2.376989, 0.0627451, 0, 1, 1,
0.5029751, -0.0664698, 2.3537, 0.06666667, 0, 1, 1,
0.5030542, 1.073745, 0.05786227, 0.07450981, 0, 1, 1,
0.505935, 0.8735063, -0.6164624, 0.07843138, 0, 1, 1,
0.5108772, 0.3642762, -0.3904911, 0.08627451, 0, 1, 1,
0.5124488, -0.1529699, 2.079612, 0.09019608, 0, 1, 1,
0.51414, -0.04365401, 2.540161, 0.09803922, 0, 1, 1,
0.5145975, -1.665866, 1.982475, 0.1058824, 0, 1, 1,
0.5192482, 0.4960649, -0.1516234, 0.1098039, 0, 1, 1,
0.5207468, -1.330096, 2.795875, 0.1176471, 0, 1, 1,
0.5219083, -1.428212, 2.56708, 0.1215686, 0, 1, 1,
0.5224618, -0.07094098, 1.810515, 0.1294118, 0, 1, 1,
0.5227971, -1.270781, 2.357218, 0.1333333, 0, 1, 1,
0.5261332, -1.398394, 2.090058, 0.1411765, 0, 1, 1,
0.5262233, 0.04570946, 2.561673, 0.145098, 0, 1, 1,
0.5276142, -0.4931901, 1.631964, 0.1529412, 0, 1, 1,
0.5276577, 1.469745, -0.2750971, 0.1568628, 0, 1, 1,
0.5296059, 1.009197, 1.186941, 0.1647059, 0, 1, 1,
0.5363542, 1.091962, 0.3117471, 0.1686275, 0, 1, 1,
0.5404494, 0.6988093, 1.080794, 0.1764706, 0, 1, 1,
0.5404997, -0.6038528, 1.919886, 0.1803922, 0, 1, 1,
0.541527, -0.3975365, 4.313216, 0.1882353, 0, 1, 1,
0.5506245, 1.393419, 0.8852991, 0.1921569, 0, 1, 1,
0.5550386, 0.06205784, 1.37704, 0.2, 0, 1, 1,
0.5601251, 1.459695, 1.643503, 0.2078431, 0, 1, 1,
0.5604268, -0.8478757, 1.302827, 0.2117647, 0, 1, 1,
0.5632248, 0.3381518, 0.9477152, 0.2196078, 0, 1, 1,
0.563522, 0.7494084, 1.748667, 0.2235294, 0, 1, 1,
0.5641721, -0.01362588, 1.083926, 0.2313726, 0, 1, 1,
0.5643826, 0.5706961, -0.0647634, 0.2352941, 0, 1, 1,
0.5706174, 1.412251, 1.314393, 0.2431373, 0, 1, 1,
0.5709986, -1.761099, 2.852558, 0.2470588, 0, 1, 1,
0.5720096, -0.4887938, 3.623061, 0.254902, 0, 1, 1,
0.5726367, 0.1452394, 1.346863, 0.2588235, 0, 1, 1,
0.572846, 1.209903, 0.6795569, 0.2666667, 0, 1, 1,
0.5754654, 0.015406, -0.7244482, 0.2705882, 0, 1, 1,
0.5817217, 1.462813, 0.7424027, 0.2784314, 0, 1, 1,
0.5841389, 0.4255145, 0.3948757, 0.282353, 0, 1, 1,
0.6010379, -1.230054, 5.209071, 0.2901961, 0, 1, 1,
0.6028169, -0.4919544, 1.211865, 0.2941177, 0, 1, 1,
0.6048816, 0.06869349, 2.112917, 0.3019608, 0, 1, 1,
0.6062769, 0.8857439, -0.1732303, 0.3098039, 0, 1, 1,
0.6109132, -0.76166, 2.437304, 0.3137255, 0, 1, 1,
0.6124352, 0.5361869, -0.5720729, 0.3215686, 0, 1, 1,
0.6133139, 0.9811375, 1.706988, 0.3254902, 0, 1, 1,
0.6155463, 0.2407968, 1.504924, 0.3333333, 0, 1, 1,
0.6158503, -0.5404714, 2.810282, 0.3372549, 0, 1, 1,
0.6159525, -0.9485224, 3.344723, 0.345098, 0, 1, 1,
0.616536, -0.005931519, 2.066722, 0.3490196, 0, 1, 1,
0.6231412, -0.1732628, 1.805812, 0.3568628, 0, 1, 1,
0.6246661, -1.867894, 4.665631, 0.3607843, 0, 1, 1,
0.6261132, -1.388938, 3.272472, 0.3686275, 0, 1, 1,
0.6302004, -1.880995, 2.11033, 0.372549, 0, 1, 1,
0.63925, -0.6221983, 1.991987, 0.3803922, 0, 1, 1,
0.6406234, 0.1887089, 0.6101488, 0.3843137, 0, 1, 1,
0.6411381, 0.2634857, 2.438998, 0.3921569, 0, 1, 1,
0.6431513, -0.631677, 2.825146, 0.3960784, 0, 1, 1,
0.6439925, -1.483452, 2.191206, 0.4039216, 0, 1, 1,
0.6468381, -0.1214203, 1.691004, 0.4117647, 0, 1, 1,
0.6482888, -0.8653815, 1.638823, 0.4156863, 0, 1, 1,
0.6485111, 0.6011178, 1.684896, 0.4235294, 0, 1, 1,
0.6587759, 0.07657066, 2.618911, 0.427451, 0, 1, 1,
0.6625097, 0.2985798, 1.575648, 0.4352941, 0, 1, 1,
0.6625385, -0.7550687, 0.7590069, 0.4392157, 0, 1, 1,
0.6671759, -0.6165278, 0.3565066, 0.4470588, 0, 1, 1,
0.6764393, -1.744112, 2.683438, 0.4509804, 0, 1, 1,
0.6793892, -1.036802, 3.511443, 0.4588235, 0, 1, 1,
0.6819831, -0.4073726, 3.202289, 0.4627451, 0, 1, 1,
0.6852925, -0.2153108, 1.019946, 0.4705882, 0, 1, 1,
0.6865603, -1.323692, 1.706436, 0.4745098, 0, 1, 1,
0.6873231, -0.9247977, 2.588712, 0.4823529, 0, 1, 1,
0.6877737, -1.074428, 3.079491, 0.4862745, 0, 1, 1,
0.6877838, -0.06317524, 1.737543, 0.4941176, 0, 1, 1,
0.6954162, 1.127689, -1.352685, 0.5019608, 0, 1, 1,
0.6984454, -0.9531386, 2.047611, 0.5058824, 0, 1, 1,
0.6997662, -0.670491, 4.301815, 0.5137255, 0, 1, 1,
0.7021258, 0.1961295, 1.257825, 0.5176471, 0, 1, 1,
0.7033929, -0.3572832, 1.993551, 0.5254902, 0, 1, 1,
0.7076901, 1.390085, 1.007163, 0.5294118, 0, 1, 1,
0.7139332, 0.3212396, -0.4278978, 0.5372549, 0, 1, 1,
0.7149593, -0.4249553, 0.2204446, 0.5411765, 0, 1, 1,
0.7158101, -0.5988969, 1.569102, 0.5490196, 0, 1, 1,
0.7169668, 0.6496447, -0.08696056, 0.5529412, 0, 1, 1,
0.7176311, 1.167042, -0.9450315, 0.5607843, 0, 1, 1,
0.720994, -0.3160957, 1.132391, 0.5647059, 0, 1, 1,
0.7281494, 0.2224992, 2.803684, 0.572549, 0, 1, 1,
0.7351801, -0.6189287, 2.218722, 0.5764706, 0, 1, 1,
0.7380823, -0.1717255, 0.649297, 0.5843138, 0, 1, 1,
0.7418321, -0.687829, 2.431726, 0.5882353, 0, 1, 1,
0.7439566, 0.04315409, -0.3615556, 0.5960785, 0, 1, 1,
0.7547858, -0.2443101, 3.047394, 0.6039216, 0, 1, 1,
0.7654362, 2.461355, 0.8631418, 0.6078432, 0, 1, 1,
0.7666516, 0.4529764, 0.6404123, 0.6156863, 0, 1, 1,
0.7726442, -1.244098, 3.564394, 0.6196079, 0, 1, 1,
0.7777277, 1.330091, -0.6348757, 0.627451, 0, 1, 1,
0.7804772, 0.4843025, 1.559013, 0.6313726, 0, 1, 1,
0.7838748, -0.2494525, 4.152749, 0.6392157, 0, 1, 1,
0.7899247, 0.7519473, 2.359677, 0.6431373, 0, 1, 1,
0.7917641, 0.2701108, 1.933394, 0.6509804, 0, 1, 1,
0.7971995, 0.06320765, 0.2887261, 0.654902, 0, 1, 1,
0.7983516, 0.6895229, 1.915477, 0.6627451, 0, 1, 1,
0.8046755, -0.8771778, 1.745648, 0.6666667, 0, 1, 1,
0.8081846, 0.0071321, 0.8783332, 0.6745098, 0, 1, 1,
0.8116778, -0.339994, 0.5297596, 0.6784314, 0, 1, 1,
0.8120819, 0.9713572, 2.842064, 0.6862745, 0, 1, 1,
0.8137357, -0.5500605, 3.076254, 0.6901961, 0, 1, 1,
0.8162078, 0.2985136, -0.1954031, 0.6980392, 0, 1, 1,
0.8381815, -0.5428468, 3.931253, 0.7058824, 0, 1, 1,
0.8395306, -0.3153568, -0.05471924, 0.7098039, 0, 1, 1,
0.840472, -0.3390553, 2.143824, 0.7176471, 0, 1, 1,
0.844886, 0.5314963, 0.4549028, 0.7215686, 0, 1, 1,
0.8475157, 0.003663681, 1.669504, 0.7294118, 0, 1, 1,
0.8550873, 0.3567094, 0.8543684, 0.7333333, 0, 1, 1,
0.8560601, 0.5451255, 1.804815, 0.7411765, 0, 1, 1,
0.8570173, 1.752197, 1.678322, 0.7450981, 0, 1, 1,
0.8578911, -0.004051667, 1.426562, 0.7529412, 0, 1, 1,
0.8602117, -0.509298, 1.40069, 0.7568628, 0, 1, 1,
0.864747, -0.1623801, 1.863779, 0.7647059, 0, 1, 1,
0.8677002, -0.6423938, 2.211441, 0.7686275, 0, 1, 1,
0.8690801, -0.4006167, 2.46275, 0.7764706, 0, 1, 1,
0.870129, -0.6544662, 3.354689, 0.7803922, 0, 1, 1,
0.8724037, -0.8397003, 2.682345, 0.7882353, 0, 1, 1,
0.8729664, 1.462324, 1.601489, 0.7921569, 0, 1, 1,
0.8764847, -1.920711, 2.958463, 0.8, 0, 1, 1,
0.8780847, -1.171376, 3.775561, 0.8078431, 0, 1, 1,
0.8802451, 0.3121592, -0.7467536, 0.8117647, 0, 1, 1,
0.8973907, -2.04654, 2.889114, 0.8196079, 0, 1, 1,
0.9020238, -0.6951523, 3.380998, 0.8235294, 0, 1, 1,
0.9047604, 0.1173651, 1.560971, 0.8313726, 0, 1, 1,
0.916061, -0.07271136, -2.323274, 0.8352941, 0, 1, 1,
0.9160622, -3.182889, 3.871073, 0.8431373, 0, 1, 1,
0.9161958, -0.1083729, -0.05593349, 0.8470588, 0, 1, 1,
0.9225648, 1.340486, 1.598161, 0.854902, 0, 1, 1,
0.9239013, -0.8354647, 2.608333, 0.8588235, 0, 1, 1,
0.9271245, -1.834202, 2.207966, 0.8666667, 0, 1, 1,
0.9377439, 0.4020391, 2.75566, 0.8705882, 0, 1, 1,
0.9510608, 0.6357279, 0.7295501, 0.8784314, 0, 1, 1,
0.9544656, -0.2625001, 0.3428994, 0.8823529, 0, 1, 1,
0.9563252, -1.277252, 1.570524, 0.8901961, 0, 1, 1,
0.9577366, 1.375772, -0.5068234, 0.8941177, 0, 1, 1,
0.9577736, -0.02409725, -0.7358788, 0.9019608, 0, 1, 1,
0.9597227, -1.059978, 3.423868, 0.9098039, 0, 1, 1,
0.9691377, 0.2934213, 2.332303, 0.9137255, 0, 1, 1,
0.972876, -0.1069096, 1.152121, 0.9215686, 0, 1, 1,
0.9736255, -1.770992, 3.69521, 0.9254902, 0, 1, 1,
0.9736891, 0.2634076, 2.00655, 0.9333333, 0, 1, 1,
0.9802461, -0.05164081, 2.905034, 0.9372549, 0, 1, 1,
0.9910206, 0.757662, 2.763401, 0.945098, 0, 1, 1,
0.9968736, 0.08217466, 0.008521344, 0.9490196, 0, 1, 1,
1.008667, -0.2101152, 2.334212, 0.9568627, 0, 1, 1,
1.011648, -0.3329902, -0.393692, 0.9607843, 0, 1, 1,
1.016445, -0.2236698, 2.289178, 0.9686275, 0, 1, 1,
1.018323, 0.9207001, 3.779877, 0.972549, 0, 1, 1,
1.023586, 1.831484, -0.2198289, 0.9803922, 0, 1, 1,
1.026064, -0.3353714, 1.422455, 0.9843137, 0, 1, 1,
1.028924, -0.8996339, 3.112056, 0.9921569, 0, 1, 1,
1.032672, 0.6557673, 1.483375, 0.9960784, 0, 1, 1,
1.038838, 0.145982, 0.9411039, 1, 0, 0.9960784, 1,
1.045474, 0.9977289, 0.5662658, 1, 0, 0.9882353, 1,
1.046287, 0.02050401, 0.7142693, 1, 0, 0.9843137, 1,
1.052804, 1.055629, 0.5796767, 1, 0, 0.9764706, 1,
1.052873, -0.5757903, 1.623775, 1, 0, 0.972549, 1,
1.053102, 0.3046589, 4.697171, 1, 0, 0.9647059, 1,
1.053426, 0.09211645, 1.382981, 1, 0, 0.9607843, 1,
1.055268, 0.7877533, 0.4917854, 1, 0, 0.9529412, 1,
1.058582, 0.1301372, 1.984717, 1, 0, 0.9490196, 1,
1.060771, 0.1342369, 1.215004, 1, 0, 0.9411765, 1,
1.063508, 2.357481, 0.7355227, 1, 0, 0.9372549, 1,
1.067747, -1.724268, 2.706942, 1, 0, 0.9294118, 1,
1.072298, 1.626648, -0.299507, 1, 0, 0.9254902, 1,
1.08179, 0.1150006, 0.0387907, 1, 0, 0.9176471, 1,
1.082355, -2.166077, 2.715746, 1, 0, 0.9137255, 1,
1.082437, -0.3405568, 0.03215726, 1, 0, 0.9058824, 1,
1.083675, 0.1494229, 0.2027946, 1, 0, 0.9019608, 1,
1.098358, 0.1245911, 2.106123, 1, 0, 0.8941177, 1,
1.099122, -1.1641, 1.179441, 1, 0, 0.8862745, 1,
1.108507, -0.3454279, 1.665091, 1, 0, 0.8823529, 1,
1.112862, 0.801294, 1.886202, 1, 0, 0.8745098, 1,
1.114369, -0.008286808, 2.368598, 1, 0, 0.8705882, 1,
1.125415, 0.9374914, 0.6653377, 1, 0, 0.8627451, 1,
1.127812, -1.244522, 2.022336, 1, 0, 0.8588235, 1,
1.133855, -0.02363851, 3.687154, 1, 0, 0.8509804, 1,
1.136956, 0.0858309, 1.800429, 1, 0, 0.8470588, 1,
1.137402, 0.262637, 3.147836, 1, 0, 0.8392157, 1,
1.140041, -0.7373129, 0.9827948, 1, 0, 0.8352941, 1,
1.147471, 0.4407551, 0.6685844, 1, 0, 0.827451, 1,
1.15028, -0.5773174, 2.490241, 1, 0, 0.8235294, 1,
1.153902, 0.8689361, 1.709836, 1, 0, 0.8156863, 1,
1.155479, -1.563072, 2.708607, 1, 0, 0.8117647, 1,
1.156473, 0.6023096, 1.096137, 1, 0, 0.8039216, 1,
1.170895, -1.171359, 3.004833, 1, 0, 0.7960784, 1,
1.179471, 0.2708673, 1.265092, 1, 0, 0.7921569, 1,
1.183897, -1.488832, 1.832702, 1, 0, 0.7843137, 1,
1.186065, -0.1498714, 1.610713, 1, 0, 0.7803922, 1,
1.189605, 0.4871141, -0.2227482, 1, 0, 0.772549, 1,
1.194265, -1.312858, 2.228971, 1, 0, 0.7686275, 1,
1.19891, 1.653396, 1.633738, 1, 0, 0.7607843, 1,
1.204022, -0.8889341, 0.7765737, 1, 0, 0.7568628, 1,
1.207895, 1.036587, -0.5700969, 1, 0, 0.7490196, 1,
1.21375, -0.3236657, 1.390597, 1, 0, 0.7450981, 1,
1.21914, -1.901267, 2.866179, 1, 0, 0.7372549, 1,
1.229999, 0.1116215, 1.719301, 1, 0, 0.7333333, 1,
1.234896, 0.5670367, 0.124681, 1, 0, 0.7254902, 1,
1.240299, -0.2678715, 2.049642, 1, 0, 0.7215686, 1,
1.243144, 0.9804569, 0.9162134, 1, 0, 0.7137255, 1,
1.24701, 1.219664, 0.374005, 1, 0, 0.7098039, 1,
1.2507, -0.3264883, 2.288917, 1, 0, 0.7019608, 1,
1.25324, -0.9057387, 1.374495, 1, 0, 0.6941177, 1,
1.260943, -0.4438339, 3.196047, 1, 0, 0.6901961, 1,
1.275434, 0.05777514, 1.504997, 1, 0, 0.682353, 1,
1.275996, -0.1095736, 2.868701, 1, 0, 0.6784314, 1,
1.283807, 0.8155864, -0.2835926, 1, 0, 0.6705883, 1,
1.286856, -0.735446, 4.656943, 1, 0, 0.6666667, 1,
1.291628, -1.160745, 3.49004, 1, 0, 0.6588235, 1,
1.298089, -0.04157018, 1.297187, 1, 0, 0.654902, 1,
1.312898, 1.491609, 3.049792, 1, 0, 0.6470588, 1,
1.314137, -0.04621362, 0.3035249, 1, 0, 0.6431373, 1,
1.320415, 1.852102, 0.9396788, 1, 0, 0.6352941, 1,
1.332087, -0.1606335, 2.199695, 1, 0, 0.6313726, 1,
1.333689, 0.9038239, 1.21011, 1, 0, 0.6235294, 1,
1.342226, -0.6006966, 1.319991, 1, 0, 0.6196079, 1,
1.343142, 0.2774019, 1.091443, 1, 0, 0.6117647, 1,
1.344833, -0.6048767, 3.296606, 1, 0, 0.6078432, 1,
1.345133, 0.1611221, 3.050116, 1, 0, 0.6, 1,
1.348124, 0.974744, 0.811841, 1, 0, 0.5921569, 1,
1.359635, -0.8537093, 1.595989, 1, 0, 0.5882353, 1,
1.370695, 0.1053916, 0.5527421, 1, 0, 0.5803922, 1,
1.401287, 1.314348, 1.313546, 1, 0, 0.5764706, 1,
1.401453, 1.12633, 0.4636036, 1, 0, 0.5686275, 1,
1.436108, -2.010948, 4.724478, 1, 0, 0.5647059, 1,
1.446388, -1.875578, 1.396769, 1, 0, 0.5568628, 1,
1.457991, 1.198113, 0.9497021, 1, 0, 0.5529412, 1,
1.460133, 1.302045, 0.9739424, 1, 0, 0.5450981, 1,
1.477816, 0.2959603, 1.860206, 1, 0, 0.5411765, 1,
1.479794, -0.1348694, 1.685792, 1, 0, 0.5333334, 1,
1.489284, 0.3657736, 0.6194548, 1, 0, 0.5294118, 1,
1.491553, 0.3360549, 1.879202, 1, 0, 0.5215687, 1,
1.49648, -0.9917136, -0.1967437, 1, 0, 0.5176471, 1,
1.501754, 0.6090673, 0.02553226, 1, 0, 0.509804, 1,
1.509702, -0.2669552, -0.4310268, 1, 0, 0.5058824, 1,
1.51792, 0.2637805, 2.12887, 1, 0, 0.4980392, 1,
1.518583, 1.01446, 0.7227725, 1, 0, 0.4901961, 1,
1.526271, -1.137062, 3.222127, 1, 0, 0.4862745, 1,
1.529814, -0.9403625, 3.114436, 1, 0, 0.4784314, 1,
1.531531, -1.813228, 1.348489, 1, 0, 0.4745098, 1,
1.534065, -1.126875, 4.54746, 1, 0, 0.4666667, 1,
1.545134, -1.083491, 1.662385, 1, 0, 0.4627451, 1,
1.545262, 0.5734423, 0.9037766, 1, 0, 0.454902, 1,
1.55043, -1.170255, 1.067052, 1, 0, 0.4509804, 1,
1.571657, 0.3587619, 2.217937, 1, 0, 0.4431373, 1,
1.571992, -1.112034, 2.853078, 1, 0, 0.4392157, 1,
1.584098, 1.520943, 1.239407, 1, 0, 0.4313726, 1,
1.589297, 1.998982, -0.7329531, 1, 0, 0.427451, 1,
1.59544, 0.3854821, 1.670993, 1, 0, 0.4196078, 1,
1.596752, -0.4161675, 1.944378, 1, 0, 0.4156863, 1,
1.604067, 0.4541849, 1.05456, 1, 0, 0.4078431, 1,
1.604204, 1.734421, -0.4543985, 1, 0, 0.4039216, 1,
1.607509, 0.7601286, 1.529722, 1, 0, 0.3960784, 1,
1.607945, 0.9061682, 1.082654, 1, 0, 0.3882353, 1,
1.608348, 0.07335494, -0.4619767, 1, 0, 0.3843137, 1,
1.609904, 0.2031222, 0.159776, 1, 0, 0.3764706, 1,
1.611473, -0.4363019, 0.919134, 1, 0, 0.372549, 1,
1.619012, 2.001272, 0.7243497, 1, 0, 0.3647059, 1,
1.619014, -0.6670727, 4.300625, 1, 0, 0.3607843, 1,
1.635511, 0.4259094, 1.658912, 1, 0, 0.3529412, 1,
1.647198, 0.4456926, 1.798251, 1, 0, 0.3490196, 1,
1.648538, 0.08429015, 0.8196996, 1, 0, 0.3411765, 1,
1.649306, 0.07309497, 1.761837, 1, 0, 0.3372549, 1,
1.654341, -0.2952295, 2.414107, 1, 0, 0.3294118, 1,
1.664389, 0.2142034, 0.961849, 1, 0, 0.3254902, 1,
1.687299, 0.4905238, 1.13279, 1, 0, 0.3176471, 1,
1.688631, -0.03824072, 2.171071, 1, 0, 0.3137255, 1,
1.704453, -0.1315227, 2.152634, 1, 0, 0.3058824, 1,
1.714151, 0.2513837, -0.02385661, 1, 0, 0.2980392, 1,
1.729331, -0.1148407, 2.121431, 1, 0, 0.2941177, 1,
1.731013, 0.4362221, 0.1269709, 1, 0, 0.2862745, 1,
1.731878, -0.4760709, 2.261765, 1, 0, 0.282353, 1,
1.74086, -1.095922, 1.70048, 1, 0, 0.2745098, 1,
1.755918, 1.091304, 1.315681, 1, 0, 0.2705882, 1,
1.758138, -1.952695, 3.245666, 1, 0, 0.2627451, 1,
1.76193, -1.041538, 1.727823, 1, 0, 0.2588235, 1,
1.786809, 0.9756734, 1.01445, 1, 0, 0.2509804, 1,
1.800787, 0.556789, 0.684324, 1, 0, 0.2470588, 1,
1.815594, -0.9929993, 3.516578, 1, 0, 0.2392157, 1,
1.824301, 0.8339667, 1.146733, 1, 0, 0.2352941, 1,
1.825944, -0.5004012, 1.06305, 1, 0, 0.227451, 1,
1.844179, 0.1923094, 2.315145, 1, 0, 0.2235294, 1,
1.847618, 1.169766, 1.053161, 1, 0, 0.2156863, 1,
1.859702, -0.3969131, 1.592597, 1, 0, 0.2117647, 1,
1.898338, -0.5421803, 1.867838, 1, 0, 0.2039216, 1,
1.911852, 0.7502472, 1.425764, 1, 0, 0.1960784, 1,
1.918464, -0.8369007, 1.479252, 1, 0, 0.1921569, 1,
1.950065, 0.2051013, 3.526384, 1, 0, 0.1843137, 1,
1.954686, -1.211106, 1.638325, 1, 0, 0.1803922, 1,
1.974477, 0.09845788, 1.123234, 1, 0, 0.172549, 1,
1.984814, 0.3570302, 1.460019, 1, 0, 0.1686275, 1,
1.994492, -0.6424214, 2.980926, 1, 0, 0.1607843, 1,
2.052219, -0.5564224, 1.348102, 1, 0, 0.1568628, 1,
2.059123, 0.6411832, 1.748364, 1, 0, 0.1490196, 1,
2.066371, -1.247732, 0.3528415, 1, 0, 0.145098, 1,
2.136893, 0.2559228, 0.3528837, 1, 0, 0.1372549, 1,
2.14409, 0.9584998, 0.7808535, 1, 0, 0.1333333, 1,
2.188076, -0.6139766, 1.97277, 1, 0, 0.1254902, 1,
2.193884, -0.7696508, 0.5401667, 1, 0, 0.1215686, 1,
2.196119, -0.5199992, -0.006341566, 1, 0, 0.1137255, 1,
2.21682, -1.24191, 2.621624, 1, 0, 0.1098039, 1,
2.230046, -1.639669, 3.001175, 1, 0, 0.1019608, 1,
2.257045, 0.3930807, 1.869864, 1, 0, 0.09411765, 1,
2.293395, 1.093575, 2.460955, 1, 0, 0.09019608, 1,
2.330271, -0.1747548, 4.284067, 1, 0, 0.08235294, 1,
2.331222, -0.04433826, 2.423722, 1, 0, 0.07843138, 1,
2.358364, -0.2473548, 2.060942, 1, 0, 0.07058824, 1,
2.440557, 2.234611, 1.187327, 1, 0, 0.06666667, 1,
2.449447, -0.06975722, 1.618477, 1, 0, 0.05882353, 1,
2.463207, -0.6799436, 1.767553, 1, 0, 0.05490196, 1,
2.469115, -1.029848, 3.016863, 1, 0, 0.04705882, 1,
2.502919, 1.569195, 0.9557694, 1, 0, 0.04313726, 1,
2.591023, -0.9608296, 3.383967, 1, 0, 0.03529412, 1,
2.707393, 0.3125709, 1.321055, 1, 0, 0.03137255, 1,
2.759356, -1.082158, 4.186245, 1, 0, 0.02352941, 1,
2.76091, 0.3324574, 1.119795, 1, 0, 0.01960784, 1,
2.874715, 0.869872, 1.770891, 1, 0, 0.01176471, 1,
3.277374, -1.275272, 2.034693, 1, 0, 0.007843138, 1
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
0.110351, -4.259292, -7.377012, 0, -0.5, 0.5, 0.5,
0.110351, -4.259292, -7.377012, 1, -0.5, 0.5, 0.5,
0.110351, -4.259292, -7.377012, 1, 1.5, 0.5, 0.5,
0.110351, -4.259292, -7.377012, 0, 1.5, 0.5, 0.5
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
-4.130293, -0.007660151, -7.377012, 0, -0.5, 0.5, 0.5,
-4.130293, -0.007660151, -7.377012, 1, -0.5, 0.5, 0.5,
-4.130293, -0.007660151, -7.377012, 1, 1.5, 0.5, 0.5,
-4.130293, -0.007660151, -7.377012, 0, 1.5, 0.5, 0.5
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
-4.130293, -4.259292, -0.1718962, 0, -0.5, 0.5, 0.5,
-4.130293, -4.259292, -0.1718962, 1, -0.5, 0.5, 0.5,
-4.130293, -4.259292, -0.1718962, 1, 1.5, 0.5, 0.5,
-4.130293, -4.259292, -0.1718962, 0, 1.5, 0.5, 0.5
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
-3, -3.278146, -5.714293,
3, -3.278146, -5.714293,
-3, -3.278146, -5.714293,
-3, -3.441671, -5.991413,
-2, -3.278146, -5.714293,
-2, -3.441671, -5.991413,
-1, -3.278146, -5.714293,
-1, -3.441671, -5.991413,
0, -3.278146, -5.714293,
0, -3.441671, -5.991413,
1, -3.278146, -5.714293,
1, -3.441671, -5.991413,
2, -3.278146, -5.714293,
2, -3.441671, -5.991413,
3, -3.278146, -5.714293,
3, -3.441671, -5.991413
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
-3, -3.768719, -6.545652, 0, -0.5, 0.5, 0.5,
-3, -3.768719, -6.545652, 1, -0.5, 0.5, 0.5,
-3, -3.768719, -6.545652, 1, 1.5, 0.5, 0.5,
-3, -3.768719, -6.545652, 0, 1.5, 0.5, 0.5,
-2, -3.768719, -6.545652, 0, -0.5, 0.5, 0.5,
-2, -3.768719, -6.545652, 1, -0.5, 0.5, 0.5,
-2, -3.768719, -6.545652, 1, 1.5, 0.5, 0.5,
-2, -3.768719, -6.545652, 0, 1.5, 0.5, 0.5,
-1, -3.768719, -6.545652, 0, -0.5, 0.5, 0.5,
-1, -3.768719, -6.545652, 1, -0.5, 0.5, 0.5,
-1, -3.768719, -6.545652, 1, 1.5, 0.5, 0.5,
-1, -3.768719, -6.545652, 0, 1.5, 0.5, 0.5,
0, -3.768719, -6.545652, 0, -0.5, 0.5, 0.5,
0, -3.768719, -6.545652, 1, -0.5, 0.5, 0.5,
0, -3.768719, -6.545652, 1, 1.5, 0.5, 0.5,
0, -3.768719, -6.545652, 0, 1.5, 0.5, 0.5,
1, -3.768719, -6.545652, 0, -0.5, 0.5, 0.5,
1, -3.768719, -6.545652, 1, -0.5, 0.5, 0.5,
1, -3.768719, -6.545652, 1, 1.5, 0.5, 0.5,
1, -3.768719, -6.545652, 0, 1.5, 0.5, 0.5,
2, -3.768719, -6.545652, 0, -0.5, 0.5, 0.5,
2, -3.768719, -6.545652, 1, -0.5, 0.5, 0.5,
2, -3.768719, -6.545652, 1, 1.5, 0.5, 0.5,
2, -3.768719, -6.545652, 0, 1.5, 0.5, 0.5,
3, -3.768719, -6.545652, 0, -0.5, 0.5, 0.5,
3, -3.768719, -6.545652, 1, -0.5, 0.5, 0.5,
3, -3.768719, -6.545652, 1, 1.5, 0.5, 0.5,
3, -3.768719, -6.545652, 0, 1.5, 0.5, 0.5
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
-3.151683, -3, -5.714293,
-3.151683, 3, -5.714293,
-3.151683, -3, -5.714293,
-3.314785, -3, -5.991413,
-3.151683, -2, -5.714293,
-3.314785, -2, -5.991413,
-3.151683, -1, -5.714293,
-3.314785, -1, -5.991413,
-3.151683, 0, -5.714293,
-3.314785, 0, -5.991413,
-3.151683, 1, -5.714293,
-3.314785, 1, -5.991413,
-3.151683, 2, -5.714293,
-3.314785, 2, -5.991413,
-3.151683, 3, -5.714293,
-3.314785, 3, -5.991413
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
-3.640988, -3, -6.545652, 0, -0.5, 0.5, 0.5,
-3.640988, -3, -6.545652, 1, -0.5, 0.5, 0.5,
-3.640988, -3, -6.545652, 1, 1.5, 0.5, 0.5,
-3.640988, -3, -6.545652, 0, 1.5, 0.5, 0.5,
-3.640988, -2, -6.545652, 0, -0.5, 0.5, 0.5,
-3.640988, -2, -6.545652, 1, -0.5, 0.5, 0.5,
-3.640988, -2, -6.545652, 1, 1.5, 0.5, 0.5,
-3.640988, -2, -6.545652, 0, 1.5, 0.5, 0.5,
-3.640988, -1, -6.545652, 0, -0.5, 0.5, 0.5,
-3.640988, -1, -6.545652, 1, -0.5, 0.5, 0.5,
-3.640988, -1, -6.545652, 1, 1.5, 0.5, 0.5,
-3.640988, -1, -6.545652, 0, 1.5, 0.5, 0.5,
-3.640988, 0, -6.545652, 0, -0.5, 0.5, 0.5,
-3.640988, 0, -6.545652, 1, -0.5, 0.5, 0.5,
-3.640988, 0, -6.545652, 1, 1.5, 0.5, 0.5,
-3.640988, 0, -6.545652, 0, 1.5, 0.5, 0.5,
-3.640988, 1, -6.545652, 0, -0.5, 0.5, 0.5,
-3.640988, 1, -6.545652, 1, -0.5, 0.5, 0.5,
-3.640988, 1, -6.545652, 1, 1.5, 0.5, 0.5,
-3.640988, 1, -6.545652, 0, 1.5, 0.5, 0.5,
-3.640988, 2, -6.545652, 0, -0.5, 0.5, 0.5,
-3.640988, 2, -6.545652, 1, -0.5, 0.5, 0.5,
-3.640988, 2, -6.545652, 1, 1.5, 0.5, 0.5,
-3.640988, 2, -6.545652, 0, 1.5, 0.5, 0.5,
-3.640988, 3, -6.545652, 0, -0.5, 0.5, 0.5,
-3.640988, 3, -6.545652, 1, -0.5, 0.5, 0.5,
-3.640988, 3, -6.545652, 1, 1.5, 0.5, 0.5,
-3.640988, 3, -6.545652, 0, 1.5, 0.5, 0.5
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
-3.151683, -3.278146, -4,
-3.151683, -3.278146, 4,
-3.151683, -3.278146, -4,
-3.314785, -3.441671, -4,
-3.151683, -3.278146, -2,
-3.314785, -3.441671, -2,
-3.151683, -3.278146, 0,
-3.314785, -3.441671, 0,
-3.151683, -3.278146, 2,
-3.314785, -3.441671, 2,
-3.151683, -3.278146, 4,
-3.314785, -3.441671, 4
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
-3.640988, -3.768719, -4, 0, -0.5, 0.5, 0.5,
-3.640988, -3.768719, -4, 1, -0.5, 0.5, 0.5,
-3.640988, -3.768719, -4, 1, 1.5, 0.5, 0.5,
-3.640988, -3.768719, -4, 0, 1.5, 0.5, 0.5,
-3.640988, -3.768719, -2, 0, -0.5, 0.5, 0.5,
-3.640988, -3.768719, -2, 1, -0.5, 0.5, 0.5,
-3.640988, -3.768719, -2, 1, 1.5, 0.5, 0.5,
-3.640988, -3.768719, -2, 0, 1.5, 0.5, 0.5,
-3.640988, -3.768719, 0, 0, -0.5, 0.5, 0.5,
-3.640988, -3.768719, 0, 1, -0.5, 0.5, 0.5,
-3.640988, -3.768719, 0, 1, 1.5, 0.5, 0.5,
-3.640988, -3.768719, 0, 0, 1.5, 0.5, 0.5,
-3.640988, -3.768719, 2, 0, -0.5, 0.5, 0.5,
-3.640988, -3.768719, 2, 1, -0.5, 0.5, 0.5,
-3.640988, -3.768719, 2, 1, 1.5, 0.5, 0.5,
-3.640988, -3.768719, 2, 0, 1.5, 0.5, 0.5,
-3.640988, -3.768719, 4, 0, -0.5, 0.5, 0.5,
-3.640988, -3.768719, 4, 1, -0.5, 0.5, 0.5,
-3.640988, -3.768719, 4, 1, 1.5, 0.5, 0.5,
-3.640988, -3.768719, 4, 0, 1.5, 0.5, 0.5
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
-3.151683, -3.278146, -5.714293,
-3.151683, 3.262826, -5.714293,
-3.151683, -3.278146, 5.3705,
-3.151683, 3.262826, 5.3705,
-3.151683, -3.278146, -5.714293,
-3.151683, -3.278146, 5.3705,
-3.151683, 3.262826, -5.714293,
-3.151683, 3.262826, 5.3705,
-3.151683, -3.278146, -5.714293,
3.372385, -3.278146, -5.714293,
-3.151683, -3.278146, 5.3705,
3.372385, -3.278146, 5.3705,
-3.151683, 3.262826, -5.714293,
3.372385, 3.262826, -5.714293,
-3.151683, 3.262826, 5.3705,
3.372385, 3.262826, 5.3705,
3.372385, -3.278146, -5.714293,
3.372385, 3.262826, -5.714293,
3.372385, -3.278146, 5.3705,
3.372385, 3.262826, 5.3705,
3.372385, -3.278146, -5.714293,
3.372385, -3.278146, 5.3705,
3.372385, 3.262826, -5.714293,
3.372385, 3.262826, 5.3705
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
var radius = 7.705257;
var distance = 34.28156;
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
mvMatrix.translate( -0.110351, 0.007660151, 0.1718962 );
mvMatrix.scale( 1.276975, 1.273675, 0.751577 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.28156);
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
Ziram<-read.table("Ziram.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Ziram$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ziram' not found
```

```r
y<-Ziram$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ziram' not found
```

```r
z<-Ziram$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ziram' not found
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
-3.056672, -0.4202269, -0.4357342, 0, 0, 1, 1, 1,
-2.641271, 1.304007, -2.016933, 1, 0, 0, 1, 1,
-2.55027, 1.029794, 0.7063497, 1, 0, 0, 1, 1,
-2.359154, 0.4503874, -0.9533247, 1, 0, 0, 1, 1,
-2.355851, 1.00797, 0.07491349, 1, 0, 0, 1, 1,
-2.31574, -1.348992, -1.091835, 1, 0, 0, 1, 1,
-2.281489, 2.109568, -0.5258255, 0, 0, 0, 1, 1,
-2.26357, -0.8789439, -2.359367, 0, 0, 0, 1, 1,
-2.260679, 0.1846304, -3.324624, 0, 0, 0, 1, 1,
-2.22954, -0.3688677, -3.20451, 0, 0, 0, 1, 1,
-2.228224, 0.02101192, -2.121552, 0, 0, 0, 1, 1,
-2.211343, -0.2166739, -3.213285, 0, 0, 0, 1, 1,
-2.210845, 1.097378, -1.375148, 0, 0, 0, 1, 1,
-2.172062, 0.3216207, -2.433128, 1, 1, 1, 1, 1,
-2.14083, -0.1418031, -0.6115627, 1, 1, 1, 1, 1,
-2.135331, -1.227685, -4.219345, 1, 1, 1, 1, 1,
-2.1246, 1.298623, -2.652939, 1, 1, 1, 1, 1,
-2.112756, 1.625796, -1.158363, 1, 1, 1, 1, 1,
-2.075791, 0.3561809, -0.9598804, 1, 1, 1, 1, 1,
-1.973958, -0.05108544, -3.263817, 1, 1, 1, 1, 1,
-1.971298, 1.582581, 0.9239064, 1, 1, 1, 1, 1,
-1.956528, -1.803526, -2.571276, 1, 1, 1, 1, 1,
-1.866852, 0.7163581, -0.3280384, 1, 1, 1, 1, 1,
-1.83231, 0.4006349, 0.2982946, 1, 1, 1, 1, 1,
-1.782959, -1.988373, -3.03883, 1, 1, 1, 1, 1,
-1.777085, 0.6088817, 0.2624848, 1, 1, 1, 1, 1,
-1.768325, -0.1889507, 0.1723407, 1, 1, 1, 1, 1,
-1.767417, 0.01172849, 0.4874499, 1, 1, 1, 1, 1,
-1.765393, 0.8326147, -1.444968, 0, 0, 1, 1, 1,
-1.764794, -1.597605, -2.432354, 1, 0, 0, 1, 1,
-1.762682, 1.037394, -1.143551, 1, 0, 0, 1, 1,
-1.756844, -0.0614427, -2.449106, 1, 0, 0, 1, 1,
-1.754601, -0.5141318, -1.541673, 1, 0, 0, 1, 1,
-1.732386, -0.1445525, -2.041896, 1, 0, 0, 1, 1,
-1.7137, -2.126268, -1.311557, 0, 0, 0, 1, 1,
-1.698384, -0.130132, -0.4847175, 0, 0, 0, 1, 1,
-1.688638, 1.94539, -1.308948, 0, 0, 0, 1, 1,
-1.681009, -0.3632725, -2.722169, 0, 0, 0, 1, 1,
-1.666782, -0.7268143, -1.730782, 0, 0, 0, 1, 1,
-1.643747, 0.8176455, -0.8069751, 0, 0, 0, 1, 1,
-1.635939, -1.196359, -1.022523, 0, 0, 0, 1, 1,
-1.629095, 0.2296588, -2.557651, 1, 1, 1, 1, 1,
-1.628349, -1.536753, -2.459817, 1, 1, 1, 1, 1,
-1.616903, 0.6638858, -0.1508303, 1, 1, 1, 1, 1,
-1.616661, -0.1498065, -2.566539, 1, 1, 1, 1, 1,
-1.614912, 1.536461, -1.96207, 1, 1, 1, 1, 1,
-1.613646, 0.786323, 1.142171, 1, 1, 1, 1, 1,
-1.593037, -0.6929231, 0.05811954, 1, 1, 1, 1, 1,
-1.592342, 0.5023741, -2.458068, 1, 1, 1, 1, 1,
-1.577805, -1.955533, -1.47051, 1, 1, 1, 1, 1,
-1.544001, 0.216149, 0.05692719, 1, 1, 1, 1, 1,
-1.527433, -1.053089, -1.475814, 1, 1, 1, 1, 1,
-1.526762, -0.5067032, -0.7378373, 1, 1, 1, 1, 1,
-1.52651, -0.3650961, -4.064338, 1, 1, 1, 1, 1,
-1.521351, -0.5903145, -1.604099, 1, 1, 1, 1, 1,
-1.52018, 0.5526226, -1.263297, 1, 1, 1, 1, 1,
-1.507841, -0.08302906, -1.881056, 0, 0, 1, 1, 1,
-1.507299, -0.972614, -3.669335, 1, 0, 0, 1, 1,
-1.486523, 0.5931616, -1.291037, 1, 0, 0, 1, 1,
-1.478317, -0.1194947, -3.313307, 1, 0, 0, 1, 1,
-1.46522, 1.585104, -0.6405023, 1, 0, 0, 1, 1,
-1.457389, -0.6709312, -0.8344104, 1, 0, 0, 1, 1,
-1.441653, 0.4176603, -1.823899, 0, 0, 0, 1, 1,
-1.436628, -0.1594917, -0.6632589, 0, 0, 0, 1, 1,
-1.430847, -1.983027, -2.36683, 0, 0, 0, 1, 1,
-1.422849, -1.179208, -2.597455, 0, 0, 0, 1, 1,
-1.411012, 0.8375758, -1.967408, 0, 0, 0, 1, 1,
-1.407563, -1.596157, -1.890346, 0, 0, 0, 1, 1,
-1.405793, -2.440985, -1.28063, 0, 0, 0, 1, 1,
-1.401645, 0.1661608, 0.2802194, 1, 1, 1, 1, 1,
-1.38112, -0.1302476, -2.120658, 1, 1, 1, 1, 1,
-1.378617, 0.293635, -2.327343, 1, 1, 1, 1, 1,
-1.378, -1.184275, -1.639097, 1, 1, 1, 1, 1,
-1.370021, -0.6827552, -2.232957, 1, 1, 1, 1, 1,
-1.361515, -0.9582236, -2.761855, 1, 1, 1, 1, 1,
-1.360089, 0.974587, -1.465346, 1, 1, 1, 1, 1,
-1.357698, 0.8191195, -0.7692456, 1, 1, 1, 1, 1,
-1.346154, 1.379372, 0.905048, 1, 1, 1, 1, 1,
-1.339402, -0.6315241, -3.354048, 1, 1, 1, 1, 1,
-1.335513, -0.5290794, -1.64574, 1, 1, 1, 1, 1,
-1.321218, -0.1386391, -0.4429466, 1, 1, 1, 1, 1,
-1.318168, 1.639609, 0.5032042, 1, 1, 1, 1, 1,
-1.314554, 1.525732, -0.08447516, 1, 1, 1, 1, 1,
-1.310108, -0.8444226, -1.8217, 1, 1, 1, 1, 1,
-1.305533, -1.091862, -2.495511, 0, 0, 1, 1, 1,
-1.301333, -0.5204438, -1.077935, 1, 0, 0, 1, 1,
-1.298069, 0.7608786, -1.73867, 1, 0, 0, 1, 1,
-1.292365, -0.02329199, -0.7373548, 1, 0, 0, 1, 1,
-1.283363, -0.3155378, -0.7250436, 1, 0, 0, 1, 1,
-1.281863, -0.4654369, -1.082119, 1, 0, 0, 1, 1,
-1.280448, -0.7325658, -1.504578, 0, 0, 0, 1, 1,
-1.272182, 1.233854, -1.056818, 0, 0, 0, 1, 1,
-1.271809, 1.013444, -1.417486, 0, 0, 0, 1, 1,
-1.261648, -0.1739744, -1.153618, 0, 0, 0, 1, 1,
-1.261447, -0.8915022, -1.6377, 0, 0, 0, 1, 1,
-1.249484, -0.01823731, -0.8259416, 0, 0, 0, 1, 1,
-1.245427, 2.326489, 0.6435233, 0, 0, 0, 1, 1,
-1.227855, -2.516255, -2.657934, 1, 1, 1, 1, 1,
-1.227563, 0.8577275, -3.661303, 1, 1, 1, 1, 1,
-1.226585, -0.797012, -0.498135, 1, 1, 1, 1, 1,
-1.225432, 1.056294, -1.795703, 1, 1, 1, 1, 1,
-1.225297, 0.705652, -0.333174, 1, 1, 1, 1, 1,
-1.220714, -0.637695, -3.207612, 1, 1, 1, 1, 1,
-1.21144, -1.094897, -2.864605, 1, 1, 1, 1, 1,
-1.207247, -0.6406271, -0.4337788, 1, 1, 1, 1, 1,
-1.203479, -1.152452, -1.68764, 1, 1, 1, 1, 1,
-1.196942, -1.712555, -2.089399, 1, 1, 1, 1, 1,
-1.192204, -0.4311903, -2.549005, 1, 1, 1, 1, 1,
-1.189447, -0.004725666, -1.075095, 1, 1, 1, 1, 1,
-1.176144, 1.438504, -1.23175, 1, 1, 1, 1, 1,
-1.169497, -0.9065163, -1.67197, 1, 1, 1, 1, 1,
-1.165091, 0.4001634, -1.605233, 1, 1, 1, 1, 1,
-1.155802, 1.553649, -1.284946, 0, 0, 1, 1, 1,
-1.153487, -0.2680124, -2.41778, 1, 0, 0, 1, 1,
-1.145101, -0.1108744, -3.176317, 1, 0, 0, 1, 1,
-1.138776, -0.5239165, -3.460884, 1, 0, 0, 1, 1,
-1.136692, 0.2281805, -0.09227534, 1, 0, 0, 1, 1,
-1.135415, -0.05546399, -1.73884, 1, 0, 0, 1, 1,
-1.128427, 1.406686, -0.7759222, 0, 0, 0, 1, 1,
-1.126832, -1.534425, -1.37757, 0, 0, 0, 1, 1,
-1.122019, 1.842714, -0.6956837, 0, 0, 0, 1, 1,
-1.120451, -1.316794, -5.552864, 0, 0, 0, 1, 1,
-1.11854, -1.554299, -2.115276, 0, 0, 0, 1, 1,
-1.117743, -2.530267, -1.785441, 0, 0, 0, 1, 1,
-1.113887, -1.360764, -0.2948084, 0, 0, 0, 1, 1,
-1.112964, -1.26044, -0.552054, 1, 1, 1, 1, 1,
-1.110954, -0.03404302, -2.183615, 1, 1, 1, 1, 1,
-1.109954, 1.201672, -0.0236063, 1, 1, 1, 1, 1,
-1.10347, 0.04735428, -1.623556, 1, 1, 1, 1, 1,
-1.088137, -0.4047282, -3.991374, 1, 1, 1, 1, 1,
-1.08767, -1.153451, -0.9393365, 1, 1, 1, 1, 1,
-1.085123, -0.6022787, -2.889555, 1, 1, 1, 1, 1,
-1.085102, 0.4898917, -0.6603158, 1, 1, 1, 1, 1,
-1.07436, 1.081726, -0.9788516, 1, 1, 1, 1, 1,
-1.0716, -1.451401, -3.076781, 1, 1, 1, 1, 1,
-1.063008, 0.1804019, -1.784148, 1, 1, 1, 1, 1,
-1.059095, 1.358535, -0.6005753, 1, 1, 1, 1, 1,
-1.054023, 0.08305487, -0.9889048, 1, 1, 1, 1, 1,
-1.052103, -0.6402285, -2.431011, 1, 1, 1, 1, 1,
-1.040777, -0.8626531, -2.203436, 1, 1, 1, 1, 1,
-1.038066, -1.699925, -2.997384, 0, 0, 1, 1, 1,
-1.037461, 0.5365723, -1.930493, 1, 0, 0, 1, 1,
-1.035201, -0.08281355, -0.5372785, 1, 0, 0, 1, 1,
-1.033067, 0.000322745, -0.4693258, 1, 0, 0, 1, 1,
-1.025631, 0.2972493, -0.8111318, 1, 0, 0, 1, 1,
-1.02462, 0.4686635, -1.055333, 1, 0, 0, 1, 1,
-1.021018, 0.2097835, -2.404849, 0, 0, 0, 1, 1,
-1.019904, 0.01165267, -1.315734, 0, 0, 0, 1, 1,
-1.01079, -0.6212249, -1.749528, 0, 0, 0, 1, 1,
-1.01078, 0.4838806, -1.843305, 0, 0, 0, 1, 1,
-1.007226, 0.9132228, 0.2018314, 0, 0, 0, 1, 1,
-1.006588, -0.8472214, -0.7171852, 0, 0, 0, 1, 1,
-1.005105, 0.07961827, -1.818272, 0, 0, 0, 1, 1,
-1.000715, -2.625639, -4.59936, 1, 1, 1, 1, 1,
-0.9978169, 0.2569141, -2.526803, 1, 1, 1, 1, 1,
-0.9977451, -0.2402087, 0.1698256, 1, 1, 1, 1, 1,
-0.9971479, -0.5954449, -2.176661, 1, 1, 1, 1, 1,
-0.9869188, 0.657424, -1.581646, 1, 1, 1, 1, 1,
-0.9831372, -0.5956286, -3.943286, 1, 1, 1, 1, 1,
-0.9789064, 0.9277672, -1.455822, 1, 1, 1, 1, 1,
-0.977161, 0.5343192, -1.176363, 1, 1, 1, 1, 1,
-0.9768289, -0.3171002, -1.064115, 1, 1, 1, 1, 1,
-0.972759, -1.587843, -3.987481, 1, 1, 1, 1, 1,
-0.9688545, 1.613065, -0.7624117, 1, 1, 1, 1, 1,
-0.9683241, 0.7012259, 0.5685982, 1, 1, 1, 1, 1,
-0.9681715, 0.1152774, -2.181826, 1, 1, 1, 1, 1,
-0.9654456, 0.4773603, 0.1721304, 1, 1, 1, 1, 1,
-0.9634018, -1.112963, -2.463267, 1, 1, 1, 1, 1,
-0.9573939, 1.301506, -0.2679024, 0, 0, 1, 1, 1,
-0.9532716, -0.8569309, -3.188928, 1, 0, 0, 1, 1,
-0.9465814, 0.2064861, -3.059468, 1, 0, 0, 1, 1,
-0.9399944, 0.2996063, 0.8619823, 1, 0, 0, 1, 1,
-0.9390359, -0.07376078, -3.698717, 1, 0, 0, 1, 1,
-0.9362741, 1.527304, 0.1416222, 1, 0, 0, 1, 1,
-0.9230481, 0.09140375, -0.4180852, 0, 0, 0, 1, 1,
-0.920559, 0.6555892, -1.65279, 0, 0, 0, 1, 1,
-0.9203253, -1.440398, -1.303931, 0, 0, 0, 1, 1,
-0.9187754, -0.4650241, -0.4888681, 0, 0, 0, 1, 1,
-0.9098979, 0.6285189, -1.579545, 0, 0, 0, 1, 1,
-0.9036953, -0.9631006, -0.7995678, 0, 0, 0, 1, 1,
-0.8958127, 1.615799, -0.62106, 0, 0, 0, 1, 1,
-0.895182, -0.4987295, -1.243752, 1, 1, 1, 1, 1,
-0.8948923, -1.921617, -3.706506, 1, 1, 1, 1, 1,
-0.8913126, 1.119601, -0.9445165, 1, 1, 1, 1, 1,
-0.8749118, 0.3107897, 0.1637063, 1, 1, 1, 1, 1,
-0.8726704, -0.9471033, -2.358294, 1, 1, 1, 1, 1,
-0.8698705, 0.4205704, -0.4688089, 1, 1, 1, 1, 1,
-0.8676578, 0.3222125, -0.63517, 1, 1, 1, 1, 1,
-0.8654178, -0.594416, -2.139648, 1, 1, 1, 1, 1,
-0.8641728, -0.5846887, -3.458132, 1, 1, 1, 1, 1,
-0.8610036, -0.3596711, -3.763068, 1, 1, 1, 1, 1,
-0.8606823, 0.4281618, -0.9127026, 1, 1, 1, 1, 1,
-0.8605819, -0.3562573, -0.9036952, 1, 1, 1, 1, 1,
-0.850047, -1.023951, -3.713809, 1, 1, 1, 1, 1,
-0.8467424, 0.09128521, -0.9052014, 1, 1, 1, 1, 1,
-0.8452278, -0.4016573, -0.8336949, 1, 1, 1, 1, 1,
-0.8411463, -0.5623018, -2.294832, 0, 0, 1, 1, 1,
-0.827006, 0.5733641, -2.574219, 1, 0, 0, 1, 1,
-0.8266709, 0.2179161, -1.746439, 1, 0, 0, 1, 1,
-0.8250457, -0.6690001, -1.274038, 1, 0, 0, 1, 1,
-0.824145, 0.08342384, -1.149971, 1, 0, 0, 1, 1,
-0.8213257, 0.6814365, 1.190538, 1, 0, 0, 1, 1,
-0.8103066, 0.582656, -0.679112, 0, 0, 0, 1, 1,
-0.8074583, 0.01766188, -2.521626, 0, 0, 0, 1, 1,
-0.8069298, -0.1510923, -2.16002, 0, 0, 0, 1, 1,
-0.8047257, -1.154465, -3.842946, 0, 0, 0, 1, 1,
-0.8045627, 0.5677062, -0.9531492, 0, 0, 0, 1, 1,
-0.8010488, 2.624951, -0.1237839, 0, 0, 0, 1, 1,
-0.7831632, -0.3668035, -1.369513, 0, 0, 0, 1, 1,
-0.7807918, -0.21862, -2.27156, 1, 1, 1, 1, 1,
-0.7786804, -0.2308911, -1.021489, 1, 1, 1, 1, 1,
-0.7755795, -1.486032, -2.894244, 1, 1, 1, 1, 1,
-0.7732514, -2.319784, -2.528493, 1, 1, 1, 1, 1,
-0.7639095, 1.449971, -0.3231644, 1, 1, 1, 1, 1,
-0.7633723, -0.832279, -3.232044, 1, 1, 1, 1, 1,
-0.7600209, -0.6544243, -3.118282, 1, 1, 1, 1, 1,
-0.7566463, -0.94481, -3.599788, 1, 1, 1, 1, 1,
-0.7514793, -1.037125, -2.306413, 1, 1, 1, 1, 1,
-0.750929, -1.562128, -0.9310464, 1, 1, 1, 1, 1,
-0.7484681, -1.142491, -0.2589181, 1, 1, 1, 1, 1,
-0.7458128, 0.07465366, -2.727142, 1, 1, 1, 1, 1,
-0.7352943, -0.3679733, -2.732909, 1, 1, 1, 1, 1,
-0.7338685, 0.5314432, -1.303502, 1, 1, 1, 1, 1,
-0.7337286, -0.985889, -0.4231023, 1, 1, 1, 1, 1,
-0.7279722, 0.9079294, 0.8680799, 0, 0, 1, 1, 1,
-0.7229322, -0.3835866, -3.101978, 1, 0, 0, 1, 1,
-0.7165829, -0.4110492, -2.468759, 1, 0, 0, 1, 1,
-0.7097194, 0.03118495, -1.791264, 1, 0, 0, 1, 1,
-0.7029654, 1.779588, -1.296132, 1, 0, 0, 1, 1,
-0.6971837, -0.8079773, -1.921628, 1, 0, 0, 1, 1,
-0.6967924, -0.4275041, -3.841909, 0, 0, 0, 1, 1,
-0.6884444, -0.4583482, -3.008363, 0, 0, 0, 1, 1,
-0.6867026, -0.926286, -3.614034, 0, 0, 0, 1, 1,
-0.6855518, -0.6346722, -2.401146, 0, 0, 0, 1, 1,
-0.684868, 0.1695333, -1.617404, 0, 0, 0, 1, 1,
-0.6835065, -1.260905, -2.930048, 0, 0, 0, 1, 1,
-0.6771432, 2.037861, 0.5453517, 0, 0, 0, 1, 1,
-0.6748068, 1.068161, -0.4706714, 1, 1, 1, 1, 1,
-0.665484, -0.7630091, -0.5907202, 1, 1, 1, 1, 1,
-0.6637706, -0.5713131, -3.454369, 1, 1, 1, 1, 1,
-0.6634445, -0.8562891, -0.5268142, 1, 1, 1, 1, 1,
-0.6611292, 1.306249, 1.432884, 1, 1, 1, 1, 1,
-0.6595832, 1.641167, -0.3114214, 1, 1, 1, 1, 1,
-0.6510028, 1.094756, -0.4617237, 1, 1, 1, 1, 1,
-0.6506115, -1.127612, -2.25297, 1, 1, 1, 1, 1,
-0.6476232, -0.6981974, -3.263716, 1, 1, 1, 1, 1,
-0.646356, -1.282026, -0.6719986, 1, 1, 1, 1, 1,
-0.6454037, -0.5748865, -1.782028, 1, 1, 1, 1, 1,
-0.6439973, -0.05680886, -1.99858, 1, 1, 1, 1, 1,
-0.6436642, 0.06716656, -0.931304, 1, 1, 1, 1, 1,
-0.6435555, 1.129924, 0.14368, 1, 1, 1, 1, 1,
-0.6419973, -0.3187743, -1.187449, 1, 1, 1, 1, 1,
-0.6401173, -0.1168934, -0.1258836, 0, 0, 1, 1, 1,
-0.6305314, 0.4016269, -0.6557828, 1, 0, 0, 1, 1,
-0.6244938, -0.3016758, -0.9917544, 1, 0, 0, 1, 1,
-0.6241372, 1.23495, -1.452731, 1, 0, 0, 1, 1,
-0.6219754, 0.493111, -1.549739, 1, 0, 0, 1, 1,
-0.6114252, -0.7403164, -3.459728, 1, 0, 0, 1, 1,
-0.6099502, 1.190994, 1.575269, 0, 0, 0, 1, 1,
-0.6030818, 0.7812276, -0.7698997, 0, 0, 0, 1, 1,
-0.6026327, 0.2465025, -1.643969, 0, 0, 0, 1, 1,
-0.6019753, -0.670113, -2.106415, 0, 0, 0, 1, 1,
-0.600489, -0.7232483, -3.257396, 0, 0, 0, 1, 1,
-0.5989377, 0.3481137, -0.8752306, 0, 0, 0, 1, 1,
-0.5943722, 2.080745, -1.058974, 0, 0, 0, 1, 1,
-0.5912653, -1.172385, -2.122608, 1, 1, 1, 1, 1,
-0.5885382, 0.8664135, -3.065172, 1, 1, 1, 1, 1,
-0.5848705, -0.5253586, -0.2205458, 1, 1, 1, 1, 1,
-0.5798939, -0.2108509, -2.064808, 1, 1, 1, 1, 1,
-0.577516, 0.8170285, -0.1331596, 1, 1, 1, 1, 1,
-0.5750821, -0.1555118, -2.492954, 1, 1, 1, 1, 1,
-0.5725456, -1.852277, -3.693297, 1, 1, 1, 1, 1,
-0.5725134, -1.111726, -3.675223, 1, 1, 1, 1, 1,
-0.5691898, 1.191022, 0.06660467, 1, 1, 1, 1, 1,
-0.5647926, -0.09150463, -1.338155, 1, 1, 1, 1, 1,
-0.5493706, 0.5813271, -0.6203872, 1, 1, 1, 1, 1,
-0.5409414, -0.3749164, -2.277343, 1, 1, 1, 1, 1,
-0.5402854, 1.372903, -0.5489869, 1, 1, 1, 1, 1,
-0.5377965, -1.251888, -1.891784, 1, 1, 1, 1, 1,
-0.5340816, 0.6832859, 1.416361, 1, 1, 1, 1, 1,
-0.5249454, 0.2003167, -1.340662, 0, 0, 1, 1, 1,
-0.5219868, -0.2548694, -1.115088, 1, 0, 0, 1, 1,
-0.520149, -0.4261019, -4.004133, 1, 0, 0, 1, 1,
-0.518689, -0.7701521, -3.172221, 1, 0, 0, 1, 1,
-0.51785, 0.3641272, -1.092319, 1, 0, 0, 1, 1,
-0.5155315, -1.060424, -4.218795, 1, 0, 0, 1, 1,
-0.506101, -0.03247374, -2.783706, 0, 0, 0, 1, 1,
-0.5051987, -1.201101, -2.684133, 0, 0, 0, 1, 1,
-0.4965713, -0.05207383, -1.868185, 0, 0, 0, 1, 1,
-0.4961458, 0.9578995, -1.216424, 0, 0, 0, 1, 1,
-0.4934587, -0.754257, -1.151474, 0, 0, 0, 1, 1,
-0.4877245, -0.4638234, -3.219683, 0, 0, 0, 1, 1,
-0.4854417, 0.6183882, 1.127761, 0, 0, 0, 1, 1,
-0.4842578, 0.90601, -0.7490214, 1, 1, 1, 1, 1,
-0.4822327, 0.7850076, 0.8771856, 1, 1, 1, 1, 1,
-0.4718347, 1.371749, -0.1037003, 1, 1, 1, 1, 1,
-0.4695378, -1.134604, -3.22931, 1, 1, 1, 1, 1,
-0.4679098, 1.231307, 0.4913357, 1, 1, 1, 1, 1,
-0.465221, -0.4729081, -3.956319, 1, 1, 1, 1, 1,
-0.4636976, 1.021691, 0.7959228, 1, 1, 1, 1, 1,
-0.4603589, -0.1528692, -1.372637, 1, 1, 1, 1, 1,
-0.4593401, 0.7861896, -1.099158, 1, 1, 1, 1, 1,
-0.4583878, 0.1595193, -1.455153, 1, 1, 1, 1, 1,
-0.4577787, 0.5211955, 0.3231467, 1, 1, 1, 1, 1,
-0.4558015, -0.5248293, -3.233048, 1, 1, 1, 1, 1,
-0.4493532, -0.9397219, -1.500238, 1, 1, 1, 1, 1,
-0.4454972, -0.08141228, -0.5335245, 1, 1, 1, 1, 1,
-0.4413726, 0.1991059, -2.039618, 1, 1, 1, 1, 1,
-0.4385127, 0.8665198, -0.2121405, 0, 0, 1, 1, 1,
-0.43523, -0.6099553, -2.581627, 1, 0, 0, 1, 1,
-0.4346764, 0.1934978, -2.786894, 1, 0, 0, 1, 1,
-0.4324649, 1.401698, -1.325623, 1, 0, 0, 1, 1,
-0.4315554, -1.104998, -4.494987, 1, 0, 0, 1, 1,
-0.4303389, 1.739889, 1.556524, 1, 0, 0, 1, 1,
-0.4270567, 0.0368781, -0.6534616, 0, 0, 0, 1, 1,
-0.4142669, -0.7620252, -1.957355, 0, 0, 0, 1, 1,
-0.4105548, -0.2529604, -0.4118333, 0, 0, 0, 1, 1,
-0.4041729, 0.03221837, -1.338272, 0, 0, 0, 1, 1,
-0.4008524, -1.126898, -3.550334, 0, 0, 0, 1, 1,
-0.3964112, -0.7878689, -1.238216, 0, 0, 0, 1, 1,
-0.3894257, 1.065845, -0.5902995, 0, 0, 0, 1, 1,
-0.3887974, -0.9598519, -3.158632, 1, 1, 1, 1, 1,
-0.3825827, 0.5412598, -0.9782357, 1, 1, 1, 1, 1,
-0.3804236, -0.2972575, -2.995395, 1, 1, 1, 1, 1,
-0.3744184, 0.4808502, -0.1155959, 1, 1, 1, 1, 1,
-0.3701607, -0.1153933, -3.556913, 1, 1, 1, 1, 1,
-0.3666097, 0.447737, 0.6025172, 1, 1, 1, 1, 1,
-0.3596183, -0.3382068, -3.491864, 1, 1, 1, 1, 1,
-0.3570169, 0.4502844, 0.1485672, 1, 1, 1, 1, 1,
-0.3560114, 0.05359878, 0.7209092, 1, 1, 1, 1, 1,
-0.35577, 3.167569, -0.02852665, 1, 1, 1, 1, 1,
-0.3537914, -0.2401436, -1.994859, 1, 1, 1, 1, 1,
-0.3526464, 0.1213331, -1.749149, 1, 1, 1, 1, 1,
-0.3519891, 0.7954377, -0.51943, 1, 1, 1, 1, 1,
-0.3518484, 0.03954627, -0.3484044, 1, 1, 1, 1, 1,
-0.3464508, -0.1829889, -3.517008, 1, 1, 1, 1, 1,
-0.3417439, -1.365469, -1.796095, 0, 0, 1, 1, 1,
-0.3392182, -0.101331, -0.9374586, 1, 0, 0, 1, 1,
-0.3372303, -0.5381356, -3.576618, 1, 0, 0, 1, 1,
-0.3371017, 0.05636278, -1.871402, 1, 0, 0, 1, 1,
-0.3356559, 0.192067, -0.575677, 1, 0, 0, 1, 1,
-0.3343018, 0.6233559, -0.4806879, 1, 0, 0, 1, 1,
-0.3324605, 1.993637, -0.3585351, 0, 0, 0, 1, 1,
-0.3316222, 0.3995265, -0.6678711, 0, 0, 0, 1, 1,
-0.3308448, 1.284977, 0.442311, 0, 0, 0, 1, 1,
-0.330812, 0.2758928, -1.305161, 0, 0, 0, 1, 1,
-0.3303277, -0.778303, -3.153896, 0, 0, 0, 1, 1,
-0.3298853, 0.3358736, -0.1223884, 0, 0, 0, 1, 1,
-0.3285852, -0.1706128, -0.9487646, 0, 0, 0, 1, 1,
-0.3271418, -0.3979397, -2.274537, 1, 1, 1, 1, 1,
-0.3205721, -2.752238, -3.179588, 1, 1, 1, 1, 1,
-0.3186322, -0.5828921, -2.545727, 1, 1, 1, 1, 1,
-0.317796, -0.765504, -2.778404, 1, 1, 1, 1, 1,
-0.3140699, 1.147672, -0.3455424, 1, 1, 1, 1, 1,
-0.3082195, -0.2846852, -2.762084, 1, 1, 1, 1, 1,
-0.3048207, -0.6316295, -1.401043, 1, 1, 1, 1, 1,
-0.302399, -0.06431014, -2.188349, 1, 1, 1, 1, 1,
-0.3020844, 1.314026, -0.840749, 1, 1, 1, 1, 1,
-0.2956154, -0.03980118, -2.083606, 1, 1, 1, 1, 1,
-0.2854124, -1.039597, -3.781287, 1, 1, 1, 1, 1,
-0.2838033, 0.5956353, 0.2515812, 1, 1, 1, 1, 1,
-0.283468, -0.0067948, -1.916563, 1, 1, 1, 1, 1,
-0.2756295, 1.53714, 0.7549408, 1, 1, 1, 1, 1,
-0.2750328, 0.7026287, -1.788449, 1, 1, 1, 1, 1,
-0.2749138, 1.393381, -0.9280368, 0, 0, 1, 1, 1,
-0.2741018, 0.0274445, -1.590549, 1, 0, 0, 1, 1,
-0.2733943, -0.480513, -2.998083, 1, 0, 0, 1, 1,
-0.2726644, -1.492644, -2.359338, 1, 0, 0, 1, 1,
-0.2663682, -0.6402022, -2.534302, 1, 0, 0, 1, 1,
-0.2636294, -0.9011286, -3.749132, 1, 0, 0, 1, 1,
-0.2623599, 0.4835434, -0.5970417, 0, 0, 0, 1, 1,
-0.2599302, -1.800853, -1.819966, 0, 0, 0, 1, 1,
-0.2550476, -0.242954, -2.397643, 0, 0, 0, 1, 1,
-0.2547023, 2.529899, 0.5779119, 0, 0, 0, 1, 1,
-0.2531682, -0.8332613, -2.258836, 0, 0, 0, 1, 1,
-0.2481759, 0.1404272, -2.372405, 0, 0, 0, 1, 1,
-0.2438717, 1.606627, 0.5465308, 0, 0, 0, 1, 1,
-0.2425422, 1.228158, 0.08639019, 1, 1, 1, 1, 1,
-0.2398598, 0.588328, -1.180095, 1, 1, 1, 1, 1,
-0.2391255, -2.018196, -2.657121, 1, 1, 1, 1, 1,
-0.2389003, -0.0516961, -1.724316, 1, 1, 1, 1, 1,
-0.238655, 0.4264773, 1.793521, 1, 1, 1, 1, 1,
-0.2375774, 2.055473, -1.8151, 1, 1, 1, 1, 1,
-0.235267, -0.4633898, -2.90601, 1, 1, 1, 1, 1,
-0.234263, -0.2094108, -1.460174, 1, 1, 1, 1, 1,
-0.2339217, -1.489442, -2.759263, 1, 1, 1, 1, 1,
-0.2320484, 1.705631, 0.3407342, 1, 1, 1, 1, 1,
-0.2319687, -0.477253, -3.052363, 1, 1, 1, 1, 1,
-0.2281118, -1.833284, -2.395211, 1, 1, 1, 1, 1,
-0.2239951, -0.3471875, -1.063733, 1, 1, 1, 1, 1,
-0.2238919, -1.272315, -3.06287, 1, 1, 1, 1, 1,
-0.2225362, 0.1034749, -1.483078, 1, 1, 1, 1, 1,
-0.2221, -0.8953618, -3.669633, 0, 0, 1, 1, 1,
-0.2176929, 1.82445, -0.1156088, 1, 0, 0, 1, 1,
-0.2159671, 0.8982344, -1.371311, 1, 0, 0, 1, 1,
-0.2159598, 0.7697521, 0.3735113, 1, 0, 0, 1, 1,
-0.2157581, 0.9187809, -0.5523053, 1, 0, 0, 1, 1,
-0.2155259, 2.042151, -1.040543, 1, 0, 0, 1, 1,
-0.2146332, -0.3760593, -3.820496, 0, 0, 0, 1, 1,
-0.2124033, -1.085295, -3.084289, 0, 0, 0, 1, 1,
-0.210882, 1.769294, -0.2745017, 0, 0, 0, 1, 1,
-0.203237, 0.5073894, 0.7448809, 0, 0, 0, 1, 1,
-0.2012942, 0.2881051, -0.09644371, 0, 0, 0, 1, 1,
-0.1996101, 0.7262191, 2.182892, 0, 0, 0, 1, 1,
-0.1981489, -0.5225509, -3.060111, 0, 0, 0, 1, 1,
-0.1970909, 0.7218981, -0.1896558, 1, 1, 1, 1, 1,
-0.1948794, -1.721441, -3.934436, 1, 1, 1, 1, 1,
-0.1925833, 0.07019652, -2.675962, 1, 1, 1, 1, 1,
-0.1904083, 2.464994, 0.7330155, 1, 1, 1, 1, 1,
-0.189554, -1.151907, -3.39383, 1, 1, 1, 1, 1,
-0.1895504, -0.4179713, -1.851415, 1, 1, 1, 1, 1,
-0.1875079, -0.7592828, -1.711719, 1, 1, 1, 1, 1,
-0.186178, -1.111837, -3.583458, 1, 1, 1, 1, 1,
-0.1851334, -0.7272888, -2.642994, 1, 1, 1, 1, 1,
-0.1831838, -0.1972809, -2.383808, 1, 1, 1, 1, 1,
-0.1813979, -1.568624, -3.232699, 1, 1, 1, 1, 1,
-0.1776683, 0.1030497, -1.786504, 1, 1, 1, 1, 1,
-0.1771671, 1.612332, -0.7318543, 1, 1, 1, 1, 1,
-0.1771022, 1.1557, 1.420509, 1, 1, 1, 1, 1,
-0.1761751, 2.193069, 1.707035, 1, 1, 1, 1, 1,
-0.1720703, 0.5730307, -1.012138, 0, 0, 1, 1, 1,
-0.1718855, -0.5239832, -4.263602, 1, 0, 0, 1, 1,
-0.1718093, 0.5150518, -0.1683792, 1, 0, 0, 1, 1,
-0.1685184, 1.444714, -0.4268323, 1, 0, 0, 1, 1,
-0.1637111, 0.4423409, 0.1930541, 1, 0, 0, 1, 1,
-0.1598926, 0.5451675, -0.4735762, 1, 0, 0, 1, 1,
-0.1556018, 0.6889768, -0.2638556, 0, 0, 0, 1, 1,
-0.1522661, 2.657117, -0.8202274, 0, 0, 0, 1, 1,
-0.1405759, 0.1456026, -0.2438424, 0, 0, 0, 1, 1,
-0.1328204, 1.247086, -0.5518427, 0, 0, 0, 1, 1,
-0.1293674, 0.1298579, 1.550408, 0, 0, 0, 1, 1,
-0.129119, 0.8714598, -2.276509, 0, 0, 0, 1, 1,
-0.1263301, -0.8063437, -3.606798, 0, 0, 0, 1, 1,
-0.1206182, -0.04062893, -1.90824, 1, 1, 1, 1, 1,
-0.1136533, -1.538586, -5.054885, 1, 1, 1, 1, 1,
-0.1075484, -1.300402, -1.720153, 1, 1, 1, 1, 1,
-0.1070128, 1.184792, -1.336608, 1, 1, 1, 1, 1,
-0.1056796, 0.3384268, -1.228787, 1, 1, 1, 1, 1,
-0.1028928, -2.243289, -3.397603, 1, 1, 1, 1, 1,
-0.0988659, -0.218204, -1.463634, 1, 1, 1, 1, 1,
-0.09737968, -0.2145885, -3.090152, 1, 1, 1, 1, 1,
-0.09350231, 0.9831286, -0.7029471, 1, 1, 1, 1, 1,
-0.0925277, -0.2131966, -2.345243, 1, 1, 1, 1, 1,
-0.08901112, -0.8668648, -2.629717, 1, 1, 1, 1, 1,
-0.08871073, 0.8986821, -0.3702855, 1, 1, 1, 1, 1,
-0.08627505, 0.1998621, 0.5187672, 1, 1, 1, 1, 1,
-0.0841835, -1.446729, -4.109638, 1, 1, 1, 1, 1,
-0.07908202, 1.55371, -1.162543, 1, 1, 1, 1, 1,
-0.07267665, -0.2141407, -2.612945, 0, 0, 1, 1, 1,
-0.07231795, 0.3511551, -0.8702989, 1, 0, 0, 1, 1,
-0.06875138, -0.7296937, -4.08962, 1, 0, 0, 1, 1,
-0.06519014, -1.389485, -3.908791, 1, 0, 0, 1, 1,
-0.06469387, 0.5677183, 0.1023742, 1, 0, 0, 1, 1,
-0.06389599, 0.9700513, 0.7311525, 1, 0, 0, 1, 1,
-0.06203565, -2.471585, -3.865554, 0, 0, 0, 1, 1,
-0.05372578, 1.661783, 0.2757019, 0, 0, 0, 1, 1,
-0.04796539, -0.6651154, -2.727582, 0, 0, 0, 1, 1,
-0.04564674, -2.09727, -2.831447, 0, 0, 0, 1, 1,
-0.04425592, -0.3451558, -1.813143, 0, 0, 0, 1, 1,
-0.04362799, 0.03454123, 1.2227, 0, 0, 0, 1, 1,
-0.04318282, -0.3548702, -4.768239, 0, 0, 0, 1, 1,
-0.04075511, 1.010242, -0.6955569, 1, 1, 1, 1, 1,
-0.04025412, 0.5990217, -1.494575, 1, 1, 1, 1, 1,
-0.03733916, -0.2853527, -1.352066, 1, 1, 1, 1, 1,
-0.03361021, 0.1544875, 1.990401, 1, 1, 1, 1, 1,
-0.0330303, -0.2493197, -4.215848, 1, 1, 1, 1, 1,
-0.03269416, -0.3627353, -4.493169, 1, 1, 1, 1, 1,
-0.03097674, -0.9141764, -3.246067, 1, 1, 1, 1, 1,
-0.02850294, 0.6822127, -0.3885788, 1, 1, 1, 1, 1,
-0.02477017, 0.1038713, 0.07625841, 1, 1, 1, 1, 1,
-0.02390261, -0.7468348, -0.4675429, 1, 1, 1, 1, 1,
-0.01431298, 0.9095195, -0.3163992, 1, 1, 1, 1, 1,
-0.01190339, 1.708427, -0.688514, 1, 1, 1, 1, 1,
-0.01026993, 0.9568138, 0.4436233, 1, 1, 1, 1, 1,
-0.006764123, 1.018789, -1.522762, 1, 1, 1, 1, 1,
-0.003831477, 0.8044339, 2.058503, 1, 1, 1, 1, 1,
-0.0003181355, -0.6735151, -1.511847, 0, 0, 1, 1, 1,
0.0002936944, 0.5819003, 0.5650972, 1, 0, 0, 1, 1,
0.006428806, 0.4632269, -0.8329701, 1, 0, 0, 1, 1,
0.007081752, 0.8643421, -1.318328, 1, 0, 0, 1, 1,
0.008435181, 0.8234588, 2.157897, 1, 0, 0, 1, 1,
0.008460368, -1.032922, 3.647798, 1, 0, 0, 1, 1,
0.009656531, 0.6560336, 1.702101, 0, 0, 0, 1, 1,
0.01102892, 1.386859, -0.05026929, 0, 0, 0, 1, 1,
0.01567551, 0.7739731, 0.2430459, 0, 0, 0, 1, 1,
0.01696216, 1.272366, 0.7409375, 0, 0, 0, 1, 1,
0.03007759, 0.9458123, -1.548433, 0, 0, 0, 1, 1,
0.03281124, 0.1089508, 1.417917, 0, 0, 0, 1, 1,
0.04464362, 1.661389, 0.8408331, 0, 0, 0, 1, 1,
0.04493307, -0.7066733, 3.87078, 1, 1, 1, 1, 1,
0.04508126, -0.1291783, 3.098335, 1, 1, 1, 1, 1,
0.04568148, 1.735928, -1.49902, 1, 1, 1, 1, 1,
0.04636059, -0.7005889, 1.858257, 1, 1, 1, 1, 1,
0.04744671, -0.6493046, 3.375666, 1, 1, 1, 1, 1,
0.05311489, -0.9108053, 4.350451, 1, 1, 1, 1, 1,
0.05744535, -1.906407, 5.147397, 1, 1, 1, 1, 1,
0.06075089, 0.8552392, -0.7005662, 1, 1, 1, 1, 1,
0.06402864, -1.223759, 3.996799, 1, 1, 1, 1, 1,
0.06637183, 0.3545123, 1.168442, 1, 1, 1, 1, 1,
0.06875151, -0.669703, 1.997389, 1, 1, 1, 1, 1,
0.06958745, 0.6694046, -1.849208, 1, 1, 1, 1, 1,
0.07153531, -2.476315, 1.018366, 1, 1, 1, 1, 1,
0.0775862, 1.633436, -1.477337, 1, 1, 1, 1, 1,
0.07950573, 1.203648, 0.8646668, 1, 1, 1, 1, 1,
0.08286998, 1.784036, 2.027368, 0, 0, 1, 1, 1,
0.08372365, -0.7224471, 3.78269, 1, 0, 0, 1, 1,
0.08482365, 0.7742102, 0.7588675, 1, 0, 0, 1, 1,
0.08692287, 1.369832, -2.1986, 1, 0, 0, 1, 1,
0.0931927, -0.384831, 2.623042, 1, 0, 0, 1, 1,
0.09461404, -0.7613048, 3.963689, 1, 0, 0, 1, 1,
0.09639537, 0.6092584, -0.06675478, 0, 0, 0, 1, 1,
0.09658648, -1.583658, 3.709979, 0, 0, 0, 1, 1,
0.09961923, -0.7100166, 3.727695, 0, 0, 0, 1, 1,
0.1005891, 0.22103, 0.3310983, 0, 0, 0, 1, 1,
0.1008573, -0.2524065, 2.690656, 0, 0, 0, 1, 1,
0.1009194, -1.053764, 2.450201, 0, 0, 0, 1, 1,
0.1014507, 0.5807328, 2.525441, 0, 0, 0, 1, 1,
0.1036985, 0.656929, 0.2571511, 1, 1, 1, 1, 1,
0.1064021, -0.00484516, 3.193215, 1, 1, 1, 1, 1,
0.1076493, 0.6621439, 1.031266, 1, 1, 1, 1, 1,
0.108375, -2.12909, 4.084969, 1, 1, 1, 1, 1,
0.1095812, 1.182718, 0.9024761, 1, 1, 1, 1, 1,
0.1113883, -0.7856625, 3.808164, 1, 1, 1, 1, 1,
0.1121413, 1.365972, -1.585616, 1, 1, 1, 1, 1,
0.1129816, 0.8708515, -0.7169704, 1, 1, 1, 1, 1,
0.1236168, 1.462721, 0.3503267, 1, 1, 1, 1, 1,
0.1284758, 1.400246, 0.6244677, 1, 1, 1, 1, 1,
0.1310337, -1.378963, 3.102276, 1, 1, 1, 1, 1,
0.1354102, 0.6478252, 1.901921, 1, 1, 1, 1, 1,
0.1394159, -1.344698, 2.070621, 1, 1, 1, 1, 1,
0.1428707, -1.370559, 1.533818, 1, 1, 1, 1, 1,
0.1442827, -0.3724715, 1.592438, 1, 1, 1, 1, 1,
0.1456256, -1.822119, 4.569739, 0, 0, 1, 1, 1,
0.1461179, 0.3692234, 2.541232, 1, 0, 0, 1, 1,
0.14929, -0.7677373, 1.861822, 1, 0, 0, 1, 1,
0.1510382, -1.321641, 3.892706, 1, 0, 0, 1, 1,
0.1554377, 0.2882524, -0.4079086, 1, 0, 0, 1, 1,
0.1614973, 2.512309, -0.7930067, 1, 0, 0, 1, 1,
0.1634506, 0.549444, -0.9426166, 0, 0, 0, 1, 1,
0.1643522, 0.672594, -0.2674611, 0, 0, 0, 1, 1,
0.1715062, -0.3293919, 2.127823, 0, 0, 0, 1, 1,
0.177904, 0.8106886, -0.6695734, 0, 0, 0, 1, 1,
0.1796342, 0.4421071, -0.2696318, 0, 0, 0, 1, 1,
0.1851458, 0.5805272, 1.37924, 0, 0, 0, 1, 1,
0.1860881, 0.9218861, 0.7951193, 0, 0, 0, 1, 1,
0.191378, -0.9388072, 4.514323, 1, 1, 1, 1, 1,
0.1960469, 0.2324075, 0.867353, 1, 1, 1, 1, 1,
0.1969892, -0.3609084, 2.70604, 1, 1, 1, 1, 1,
0.1992233, -0.7164779, 2.335707, 1, 1, 1, 1, 1,
0.2004908, -0.3714024, 3.803808, 1, 1, 1, 1, 1,
0.2011676, 0.3466571, 0.3776737, 1, 1, 1, 1, 1,
0.2013679, 0.5453905, -0.130726, 1, 1, 1, 1, 1,
0.2032708, 0.4538627, 1.364508, 1, 1, 1, 1, 1,
0.2039351, -0.6210225, 2.640619, 1, 1, 1, 1, 1,
0.2062712, 1.971928, -1.334073, 1, 1, 1, 1, 1,
0.2112826, 0.3624582, 1.409364, 1, 1, 1, 1, 1,
0.2202873, -0.7638261, 2.063338, 1, 1, 1, 1, 1,
0.2206985, -0.5721301, 2.291935, 1, 1, 1, 1, 1,
0.2223532, -0.03382937, 1.508096, 1, 1, 1, 1, 1,
0.2238372, -0.3119977, 1.711104, 1, 1, 1, 1, 1,
0.2246693, -1.415211, 1.852918, 0, 0, 1, 1, 1,
0.2249043, -0.7226431, 3.262041, 1, 0, 0, 1, 1,
0.2274075, -1.645703, 3.764447, 1, 0, 0, 1, 1,
0.2324516, -0.01694763, 2.508248, 1, 0, 0, 1, 1,
0.2328987, -0.1428488, 2.131105, 1, 0, 0, 1, 1,
0.2350031, -1.015047, 4.040617, 1, 0, 0, 1, 1,
0.2350993, 1.120844, -1.319017, 0, 0, 0, 1, 1,
0.2419192, 0.3933275, 0.2800531, 0, 0, 0, 1, 1,
0.2452448, -1.641311, 4.194323, 0, 0, 0, 1, 1,
0.24733, -0.2811681, 2.248312, 0, 0, 0, 1, 1,
0.2482792, -0.6405755, 1.736791, 0, 0, 0, 1, 1,
0.255514, 0.8544679, -0.2477383, 0, 0, 0, 1, 1,
0.255917, -0.7332333, 2.162157, 0, 0, 0, 1, 1,
0.2569951, 0.09667328, 1.426943, 1, 1, 1, 1, 1,
0.2599563, 0.9190201, 1.829133, 1, 1, 1, 1, 1,
0.260421, 0.0669724, 0.9817111, 1, 1, 1, 1, 1,
0.2638344, 1.371782, -0.2043386, 1, 1, 1, 1, 1,
0.2657763, 0.01136556, 1.415672, 1, 1, 1, 1, 1,
0.2682383, 0.782436, 0.9424812, 1, 1, 1, 1, 1,
0.2686473, 0.5467265, 1.535138, 1, 1, 1, 1, 1,
0.2689812, -0.1395359, 2.649902, 1, 1, 1, 1, 1,
0.2695363, -1.126099, 1.96372, 1, 1, 1, 1, 1,
0.2824582, -2.11829, 3.347095, 1, 1, 1, 1, 1,
0.2847669, -0.09112513, 1.75168, 1, 1, 1, 1, 1,
0.2916112, -0.7085052, 4.121758, 1, 1, 1, 1, 1,
0.2919365, 0.2843502, -0.4529218, 1, 1, 1, 1, 1,
0.2933045, -0.3666578, 1.544359, 1, 1, 1, 1, 1,
0.2943965, -0.6691571, 2.805902, 1, 1, 1, 1, 1,
0.2957855, 0.8978919, -0.1540193, 0, 0, 1, 1, 1,
0.2970244, 0.4231976, -0.9221595, 1, 0, 0, 1, 1,
0.297797, -1.021056, 2.165437, 1, 0, 0, 1, 1,
0.2990915, -0.1598562, 0.3500937, 1, 0, 0, 1, 1,
0.3042376, 1.783466, 0.2040087, 1, 0, 0, 1, 1,
0.3050407, -1.341514, 3.002145, 1, 0, 0, 1, 1,
0.3051184, -0.5331041, 0.723108, 0, 0, 0, 1, 1,
0.3051917, 1.845312, -0.3541506, 0, 0, 0, 1, 1,
0.3065506, -0.2848408, 2.930965, 0, 0, 0, 1, 1,
0.307631, 0.1486814, 1.081733, 0, 0, 0, 1, 1,
0.3103684, -2.572576, 3.881225, 0, 0, 0, 1, 1,
0.313159, 1.326767, -1.577056, 0, 0, 0, 1, 1,
0.315486, 0.1514237, 1.19373, 0, 0, 0, 1, 1,
0.3168105, 1.817983, -0.0137889, 1, 1, 1, 1, 1,
0.3189589, 0.2613869, 2.422583, 1, 1, 1, 1, 1,
0.320059, 2.318493, -0.5796678, 1, 1, 1, 1, 1,
0.3206487, 1.219237, 1.020658, 1, 1, 1, 1, 1,
0.3250555, -1.686721, 4.535614, 1, 1, 1, 1, 1,
0.3274833, -0.5761611, 2.971474, 1, 1, 1, 1, 1,
0.3315914, -0.7284071, 2.274894, 1, 1, 1, 1, 1,
0.331617, 1.247131, 0.7900712, 1, 1, 1, 1, 1,
0.3368287, -0.3344731, 1.905539, 1, 1, 1, 1, 1,
0.3374515, 1.084792, -0.09991333, 1, 1, 1, 1, 1,
0.3418907, -0.863827, 3.599194, 1, 1, 1, 1, 1,
0.3439403, -0.8372207, 2.749177, 1, 1, 1, 1, 1,
0.3441158, -0.1825248, 2.790643, 1, 1, 1, 1, 1,
0.3451492, 0.4681139, -0.6119201, 1, 1, 1, 1, 1,
0.3492296, -0.6378217, 3.809835, 1, 1, 1, 1, 1,
0.3492747, -1.116047, 2.405394, 0, 0, 1, 1, 1,
0.3568745, -0.6012627, 0.8842085, 1, 0, 0, 1, 1,
0.3590491, 0.689705, -0.2834608, 1, 0, 0, 1, 1,
0.3602813, -1.088378, 0.9794838, 1, 0, 0, 1, 1,
0.3610694, 2.218971, 1.502778, 1, 0, 0, 1, 1,
0.3631236, -0.06054953, 2.873961, 1, 0, 0, 1, 1,
0.3649585, -0.2280948, -0.1025768, 0, 0, 0, 1, 1,
0.3706966, -1.657741, 3.548294, 0, 0, 0, 1, 1,
0.3768994, -0.05509196, 2.664433, 0, 0, 0, 1, 1,
0.3791429, -0.621558, 2.002526, 0, 0, 0, 1, 1,
0.3799188, 1.226464, 0.9325785, 0, 0, 0, 1, 1,
0.3815838, 1.329144, -0.2016296, 0, 0, 0, 1, 1,
0.3869789, -0.8672571, 1.640779, 0, 0, 0, 1, 1,
0.3889328, 1.703642, -0.7352632, 1, 1, 1, 1, 1,
0.3901443, 0.3574402, 1.956403, 1, 1, 1, 1, 1,
0.3927404, -0.7137977, 2.972837, 1, 1, 1, 1, 1,
0.3960467, 0.3762304, 0.6671833, 1, 1, 1, 1, 1,
0.3964264, 0.5172537, -0.5736264, 1, 1, 1, 1, 1,
0.4032038, 1.194015, 2.386205, 1, 1, 1, 1, 1,
0.4084328, -0.7994031, 3.453395, 1, 1, 1, 1, 1,
0.4157041, -1.307439, 2.665722, 1, 1, 1, 1, 1,
0.4166172, -0.03173543, 1.126459, 1, 1, 1, 1, 1,
0.417175, -1.971749, 2.157983, 1, 1, 1, 1, 1,
0.4193676, -0.1164437, 1.895907, 1, 1, 1, 1, 1,
0.4217448, 0.3879075, 1.826886, 1, 1, 1, 1, 1,
0.4258786, 1.645082, -0.9172648, 1, 1, 1, 1, 1,
0.4266364, 0.3399683, 1.672819, 1, 1, 1, 1, 1,
0.4279636, -0.455876, 2.120901, 1, 1, 1, 1, 1,
0.4297603, 0.06954799, -0.7365867, 0, 0, 1, 1, 1,
0.4333017, 1.235739, -1.430949, 1, 0, 0, 1, 1,
0.4341131, -0.08412439, 1.871655, 1, 0, 0, 1, 1,
0.4342201, 1.174072, 1.584569, 1, 0, 0, 1, 1,
0.4355779, 0.7319604, 0.9840407, 1, 0, 0, 1, 1,
0.4376582, 0.7841425, 1.735093, 1, 0, 0, 1, 1,
0.4437717, 0.1226096, 1.29055, 0, 0, 0, 1, 1,
0.4449599, -0.5404926, 3.507975, 0, 0, 0, 1, 1,
0.4463819, 1.334969, -0.2926739, 0, 0, 0, 1, 1,
0.4470155, -1.730102, 3.894432, 0, 0, 0, 1, 1,
0.4481139, -0.3470243, 1.74278, 0, 0, 0, 1, 1,
0.4522906, -1.022243, 2.973329, 0, 0, 0, 1, 1,
0.4580524, 0.1801265, 1.340283, 0, 0, 0, 1, 1,
0.4581471, -0.8094289, 3.140221, 1, 1, 1, 1, 1,
0.4601403, 0.6901819, 0.538137, 1, 1, 1, 1, 1,
0.4633065, -0.1758729, -0.2015153, 1, 1, 1, 1, 1,
0.4640706, -1.498678, 3.208882, 1, 1, 1, 1, 1,
0.4657618, -0.01327021, -0.1768804, 1, 1, 1, 1, 1,
0.4663436, 2.666175, 0.3020369, 1, 1, 1, 1, 1,
0.4692628, 0.3929819, 0.7496778, 1, 1, 1, 1, 1,
0.4709585, 1.284642, -0.2339596, 1, 1, 1, 1, 1,
0.4724397, -0.898865, 2.024915, 1, 1, 1, 1, 1,
0.4799342, 1.240612, 1.774627, 1, 1, 1, 1, 1,
0.4805461, -1.246327, 3.018422, 1, 1, 1, 1, 1,
0.4806931, -0.745909, 1.878988, 1, 1, 1, 1, 1,
0.482144, -2.226724, 2.400783, 1, 1, 1, 1, 1,
0.4853082, 0.2816835, 0.8251526, 1, 1, 1, 1, 1,
0.4857377, 1.014295, 0.129235, 1, 1, 1, 1, 1,
0.4888835, 0.003675827, 0.6118899, 0, 0, 1, 1, 1,
0.4933513, -1.069081, 3.508063, 1, 0, 0, 1, 1,
0.4963289, -1.585698, 3.361562, 1, 0, 0, 1, 1,
0.4978704, -0.01055064, 0.04214937, 1, 0, 0, 1, 1,
0.4994822, 0.03716196, 1.164306, 1, 0, 0, 1, 1,
0.501945, -0.2925994, 2.376989, 1, 0, 0, 1, 1,
0.5029751, -0.0664698, 2.3537, 0, 0, 0, 1, 1,
0.5030542, 1.073745, 0.05786227, 0, 0, 0, 1, 1,
0.505935, 0.8735063, -0.6164624, 0, 0, 0, 1, 1,
0.5108772, 0.3642762, -0.3904911, 0, 0, 0, 1, 1,
0.5124488, -0.1529699, 2.079612, 0, 0, 0, 1, 1,
0.51414, -0.04365401, 2.540161, 0, 0, 0, 1, 1,
0.5145975, -1.665866, 1.982475, 0, 0, 0, 1, 1,
0.5192482, 0.4960649, -0.1516234, 1, 1, 1, 1, 1,
0.5207468, -1.330096, 2.795875, 1, 1, 1, 1, 1,
0.5219083, -1.428212, 2.56708, 1, 1, 1, 1, 1,
0.5224618, -0.07094098, 1.810515, 1, 1, 1, 1, 1,
0.5227971, -1.270781, 2.357218, 1, 1, 1, 1, 1,
0.5261332, -1.398394, 2.090058, 1, 1, 1, 1, 1,
0.5262233, 0.04570946, 2.561673, 1, 1, 1, 1, 1,
0.5276142, -0.4931901, 1.631964, 1, 1, 1, 1, 1,
0.5276577, 1.469745, -0.2750971, 1, 1, 1, 1, 1,
0.5296059, 1.009197, 1.186941, 1, 1, 1, 1, 1,
0.5363542, 1.091962, 0.3117471, 1, 1, 1, 1, 1,
0.5404494, 0.6988093, 1.080794, 1, 1, 1, 1, 1,
0.5404997, -0.6038528, 1.919886, 1, 1, 1, 1, 1,
0.541527, -0.3975365, 4.313216, 1, 1, 1, 1, 1,
0.5506245, 1.393419, 0.8852991, 1, 1, 1, 1, 1,
0.5550386, 0.06205784, 1.37704, 0, 0, 1, 1, 1,
0.5601251, 1.459695, 1.643503, 1, 0, 0, 1, 1,
0.5604268, -0.8478757, 1.302827, 1, 0, 0, 1, 1,
0.5632248, 0.3381518, 0.9477152, 1, 0, 0, 1, 1,
0.563522, 0.7494084, 1.748667, 1, 0, 0, 1, 1,
0.5641721, -0.01362588, 1.083926, 1, 0, 0, 1, 1,
0.5643826, 0.5706961, -0.0647634, 0, 0, 0, 1, 1,
0.5706174, 1.412251, 1.314393, 0, 0, 0, 1, 1,
0.5709986, -1.761099, 2.852558, 0, 0, 0, 1, 1,
0.5720096, -0.4887938, 3.623061, 0, 0, 0, 1, 1,
0.5726367, 0.1452394, 1.346863, 0, 0, 0, 1, 1,
0.572846, 1.209903, 0.6795569, 0, 0, 0, 1, 1,
0.5754654, 0.015406, -0.7244482, 0, 0, 0, 1, 1,
0.5817217, 1.462813, 0.7424027, 1, 1, 1, 1, 1,
0.5841389, 0.4255145, 0.3948757, 1, 1, 1, 1, 1,
0.6010379, -1.230054, 5.209071, 1, 1, 1, 1, 1,
0.6028169, -0.4919544, 1.211865, 1, 1, 1, 1, 1,
0.6048816, 0.06869349, 2.112917, 1, 1, 1, 1, 1,
0.6062769, 0.8857439, -0.1732303, 1, 1, 1, 1, 1,
0.6109132, -0.76166, 2.437304, 1, 1, 1, 1, 1,
0.6124352, 0.5361869, -0.5720729, 1, 1, 1, 1, 1,
0.6133139, 0.9811375, 1.706988, 1, 1, 1, 1, 1,
0.6155463, 0.2407968, 1.504924, 1, 1, 1, 1, 1,
0.6158503, -0.5404714, 2.810282, 1, 1, 1, 1, 1,
0.6159525, -0.9485224, 3.344723, 1, 1, 1, 1, 1,
0.616536, -0.005931519, 2.066722, 1, 1, 1, 1, 1,
0.6231412, -0.1732628, 1.805812, 1, 1, 1, 1, 1,
0.6246661, -1.867894, 4.665631, 1, 1, 1, 1, 1,
0.6261132, -1.388938, 3.272472, 0, 0, 1, 1, 1,
0.6302004, -1.880995, 2.11033, 1, 0, 0, 1, 1,
0.63925, -0.6221983, 1.991987, 1, 0, 0, 1, 1,
0.6406234, 0.1887089, 0.6101488, 1, 0, 0, 1, 1,
0.6411381, 0.2634857, 2.438998, 1, 0, 0, 1, 1,
0.6431513, -0.631677, 2.825146, 1, 0, 0, 1, 1,
0.6439925, -1.483452, 2.191206, 0, 0, 0, 1, 1,
0.6468381, -0.1214203, 1.691004, 0, 0, 0, 1, 1,
0.6482888, -0.8653815, 1.638823, 0, 0, 0, 1, 1,
0.6485111, 0.6011178, 1.684896, 0, 0, 0, 1, 1,
0.6587759, 0.07657066, 2.618911, 0, 0, 0, 1, 1,
0.6625097, 0.2985798, 1.575648, 0, 0, 0, 1, 1,
0.6625385, -0.7550687, 0.7590069, 0, 0, 0, 1, 1,
0.6671759, -0.6165278, 0.3565066, 1, 1, 1, 1, 1,
0.6764393, -1.744112, 2.683438, 1, 1, 1, 1, 1,
0.6793892, -1.036802, 3.511443, 1, 1, 1, 1, 1,
0.6819831, -0.4073726, 3.202289, 1, 1, 1, 1, 1,
0.6852925, -0.2153108, 1.019946, 1, 1, 1, 1, 1,
0.6865603, -1.323692, 1.706436, 1, 1, 1, 1, 1,
0.6873231, -0.9247977, 2.588712, 1, 1, 1, 1, 1,
0.6877737, -1.074428, 3.079491, 1, 1, 1, 1, 1,
0.6877838, -0.06317524, 1.737543, 1, 1, 1, 1, 1,
0.6954162, 1.127689, -1.352685, 1, 1, 1, 1, 1,
0.6984454, -0.9531386, 2.047611, 1, 1, 1, 1, 1,
0.6997662, -0.670491, 4.301815, 1, 1, 1, 1, 1,
0.7021258, 0.1961295, 1.257825, 1, 1, 1, 1, 1,
0.7033929, -0.3572832, 1.993551, 1, 1, 1, 1, 1,
0.7076901, 1.390085, 1.007163, 1, 1, 1, 1, 1,
0.7139332, 0.3212396, -0.4278978, 0, 0, 1, 1, 1,
0.7149593, -0.4249553, 0.2204446, 1, 0, 0, 1, 1,
0.7158101, -0.5988969, 1.569102, 1, 0, 0, 1, 1,
0.7169668, 0.6496447, -0.08696056, 1, 0, 0, 1, 1,
0.7176311, 1.167042, -0.9450315, 1, 0, 0, 1, 1,
0.720994, -0.3160957, 1.132391, 1, 0, 0, 1, 1,
0.7281494, 0.2224992, 2.803684, 0, 0, 0, 1, 1,
0.7351801, -0.6189287, 2.218722, 0, 0, 0, 1, 1,
0.7380823, -0.1717255, 0.649297, 0, 0, 0, 1, 1,
0.7418321, -0.687829, 2.431726, 0, 0, 0, 1, 1,
0.7439566, 0.04315409, -0.3615556, 0, 0, 0, 1, 1,
0.7547858, -0.2443101, 3.047394, 0, 0, 0, 1, 1,
0.7654362, 2.461355, 0.8631418, 0, 0, 0, 1, 1,
0.7666516, 0.4529764, 0.6404123, 1, 1, 1, 1, 1,
0.7726442, -1.244098, 3.564394, 1, 1, 1, 1, 1,
0.7777277, 1.330091, -0.6348757, 1, 1, 1, 1, 1,
0.7804772, 0.4843025, 1.559013, 1, 1, 1, 1, 1,
0.7838748, -0.2494525, 4.152749, 1, 1, 1, 1, 1,
0.7899247, 0.7519473, 2.359677, 1, 1, 1, 1, 1,
0.7917641, 0.2701108, 1.933394, 1, 1, 1, 1, 1,
0.7971995, 0.06320765, 0.2887261, 1, 1, 1, 1, 1,
0.7983516, 0.6895229, 1.915477, 1, 1, 1, 1, 1,
0.8046755, -0.8771778, 1.745648, 1, 1, 1, 1, 1,
0.8081846, 0.0071321, 0.8783332, 1, 1, 1, 1, 1,
0.8116778, -0.339994, 0.5297596, 1, 1, 1, 1, 1,
0.8120819, 0.9713572, 2.842064, 1, 1, 1, 1, 1,
0.8137357, -0.5500605, 3.076254, 1, 1, 1, 1, 1,
0.8162078, 0.2985136, -0.1954031, 1, 1, 1, 1, 1,
0.8381815, -0.5428468, 3.931253, 0, 0, 1, 1, 1,
0.8395306, -0.3153568, -0.05471924, 1, 0, 0, 1, 1,
0.840472, -0.3390553, 2.143824, 1, 0, 0, 1, 1,
0.844886, 0.5314963, 0.4549028, 1, 0, 0, 1, 1,
0.8475157, 0.003663681, 1.669504, 1, 0, 0, 1, 1,
0.8550873, 0.3567094, 0.8543684, 1, 0, 0, 1, 1,
0.8560601, 0.5451255, 1.804815, 0, 0, 0, 1, 1,
0.8570173, 1.752197, 1.678322, 0, 0, 0, 1, 1,
0.8578911, -0.004051667, 1.426562, 0, 0, 0, 1, 1,
0.8602117, -0.509298, 1.40069, 0, 0, 0, 1, 1,
0.864747, -0.1623801, 1.863779, 0, 0, 0, 1, 1,
0.8677002, -0.6423938, 2.211441, 0, 0, 0, 1, 1,
0.8690801, -0.4006167, 2.46275, 0, 0, 0, 1, 1,
0.870129, -0.6544662, 3.354689, 1, 1, 1, 1, 1,
0.8724037, -0.8397003, 2.682345, 1, 1, 1, 1, 1,
0.8729664, 1.462324, 1.601489, 1, 1, 1, 1, 1,
0.8764847, -1.920711, 2.958463, 1, 1, 1, 1, 1,
0.8780847, -1.171376, 3.775561, 1, 1, 1, 1, 1,
0.8802451, 0.3121592, -0.7467536, 1, 1, 1, 1, 1,
0.8973907, -2.04654, 2.889114, 1, 1, 1, 1, 1,
0.9020238, -0.6951523, 3.380998, 1, 1, 1, 1, 1,
0.9047604, 0.1173651, 1.560971, 1, 1, 1, 1, 1,
0.916061, -0.07271136, -2.323274, 1, 1, 1, 1, 1,
0.9160622, -3.182889, 3.871073, 1, 1, 1, 1, 1,
0.9161958, -0.1083729, -0.05593349, 1, 1, 1, 1, 1,
0.9225648, 1.340486, 1.598161, 1, 1, 1, 1, 1,
0.9239013, -0.8354647, 2.608333, 1, 1, 1, 1, 1,
0.9271245, -1.834202, 2.207966, 1, 1, 1, 1, 1,
0.9377439, 0.4020391, 2.75566, 0, 0, 1, 1, 1,
0.9510608, 0.6357279, 0.7295501, 1, 0, 0, 1, 1,
0.9544656, -0.2625001, 0.3428994, 1, 0, 0, 1, 1,
0.9563252, -1.277252, 1.570524, 1, 0, 0, 1, 1,
0.9577366, 1.375772, -0.5068234, 1, 0, 0, 1, 1,
0.9577736, -0.02409725, -0.7358788, 1, 0, 0, 1, 1,
0.9597227, -1.059978, 3.423868, 0, 0, 0, 1, 1,
0.9691377, 0.2934213, 2.332303, 0, 0, 0, 1, 1,
0.972876, -0.1069096, 1.152121, 0, 0, 0, 1, 1,
0.9736255, -1.770992, 3.69521, 0, 0, 0, 1, 1,
0.9736891, 0.2634076, 2.00655, 0, 0, 0, 1, 1,
0.9802461, -0.05164081, 2.905034, 0, 0, 0, 1, 1,
0.9910206, 0.757662, 2.763401, 0, 0, 0, 1, 1,
0.9968736, 0.08217466, 0.008521344, 1, 1, 1, 1, 1,
1.008667, -0.2101152, 2.334212, 1, 1, 1, 1, 1,
1.011648, -0.3329902, -0.393692, 1, 1, 1, 1, 1,
1.016445, -0.2236698, 2.289178, 1, 1, 1, 1, 1,
1.018323, 0.9207001, 3.779877, 1, 1, 1, 1, 1,
1.023586, 1.831484, -0.2198289, 1, 1, 1, 1, 1,
1.026064, -0.3353714, 1.422455, 1, 1, 1, 1, 1,
1.028924, -0.8996339, 3.112056, 1, 1, 1, 1, 1,
1.032672, 0.6557673, 1.483375, 1, 1, 1, 1, 1,
1.038838, 0.145982, 0.9411039, 1, 1, 1, 1, 1,
1.045474, 0.9977289, 0.5662658, 1, 1, 1, 1, 1,
1.046287, 0.02050401, 0.7142693, 1, 1, 1, 1, 1,
1.052804, 1.055629, 0.5796767, 1, 1, 1, 1, 1,
1.052873, -0.5757903, 1.623775, 1, 1, 1, 1, 1,
1.053102, 0.3046589, 4.697171, 1, 1, 1, 1, 1,
1.053426, 0.09211645, 1.382981, 0, 0, 1, 1, 1,
1.055268, 0.7877533, 0.4917854, 1, 0, 0, 1, 1,
1.058582, 0.1301372, 1.984717, 1, 0, 0, 1, 1,
1.060771, 0.1342369, 1.215004, 1, 0, 0, 1, 1,
1.063508, 2.357481, 0.7355227, 1, 0, 0, 1, 1,
1.067747, -1.724268, 2.706942, 1, 0, 0, 1, 1,
1.072298, 1.626648, -0.299507, 0, 0, 0, 1, 1,
1.08179, 0.1150006, 0.0387907, 0, 0, 0, 1, 1,
1.082355, -2.166077, 2.715746, 0, 0, 0, 1, 1,
1.082437, -0.3405568, 0.03215726, 0, 0, 0, 1, 1,
1.083675, 0.1494229, 0.2027946, 0, 0, 0, 1, 1,
1.098358, 0.1245911, 2.106123, 0, 0, 0, 1, 1,
1.099122, -1.1641, 1.179441, 0, 0, 0, 1, 1,
1.108507, -0.3454279, 1.665091, 1, 1, 1, 1, 1,
1.112862, 0.801294, 1.886202, 1, 1, 1, 1, 1,
1.114369, -0.008286808, 2.368598, 1, 1, 1, 1, 1,
1.125415, 0.9374914, 0.6653377, 1, 1, 1, 1, 1,
1.127812, -1.244522, 2.022336, 1, 1, 1, 1, 1,
1.133855, -0.02363851, 3.687154, 1, 1, 1, 1, 1,
1.136956, 0.0858309, 1.800429, 1, 1, 1, 1, 1,
1.137402, 0.262637, 3.147836, 1, 1, 1, 1, 1,
1.140041, -0.7373129, 0.9827948, 1, 1, 1, 1, 1,
1.147471, 0.4407551, 0.6685844, 1, 1, 1, 1, 1,
1.15028, -0.5773174, 2.490241, 1, 1, 1, 1, 1,
1.153902, 0.8689361, 1.709836, 1, 1, 1, 1, 1,
1.155479, -1.563072, 2.708607, 1, 1, 1, 1, 1,
1.156473, 0.6023096, 1.096137, 1, 1, 1, 1, 1,
1.170895, -1.171359, 3.004833, 1, 1, 1, 1, 1,
1.179471, 0.2708673, 1.265092, 0, 0, 1, 1, 1,
1.183897, -1.488832, 1.832702, 1, 0, 0, 1, 1,
1.186065, -0.1498714, 1.610713, 1, 0, 0, 1, 1,
1.189605, 0.4871141, -0.2227482, 1, 0, 0, 1, 1,
1.194265, -1.312858, 2.228971, 1, 0, 0, 1, 1,
1.19891, 1.653396, 1.633738, 1, 0, 0, 1, 1,
1.204022, -0.8889341, 0.7765737, 0, 0, 0, 1, 1,
1.207895, 1.036587, -0.5700969, 0, 0, 0, 1, 1,
1.21375, -0.3236657, 1.390597, 0, 0, 0, 1, 1,
1.21914, -1.901267, 2.866179, 0, 0, 0, 1, 1,
1.229999, 0.1116215, 1.719301, 0, 0, 0, 1, 1,
1.234896, 0.5670367, 0.124681, 0, 0, 0, 1, 1,
1.240299, -0.2678715, 2.049642, 0, 0, 0, 1, 1,
1.243144, 0.9804569, 0.9162134, 1, 1, 1, 1, 1,
1.24701, 1.219664, 0.374005, 1, 1, 1, 1, 1,
1.2507, -0.3264883, 2.288917, 1, 1, 1, 1, 1,
1.25324, -0.9057387, 1.374495, 1, 1, 1, 1, 1,
1.260943, -0.4438339, 3.196047, 1, 1, 1, 1, 1,
1.275434, 0.05777514, 1.504997, 1, 1, 1, 1, 1,
1.275996, -0.1095736, 2.868701, 1, 1, 1, 1, 1,
1.283807, 0.8155864, -0.2835926, 1, 1, 1, 1, 1,
1.286856, -0.735446, 4.656943, 1, 1, 1, 1, 1,
1.291628, -1.160745, 3.49004, 1, 1, 1, 1, 1,
1.298089, -0.04157018, 1.297187, 1, 1, 1, 1, 1,
1.312898, 1.491609, 3.049792, 1, 1, 1, 1, 1,
1.314137, -0.04621362, 0.3035249, 1, 1, 1, 1, 1,
1.320415, 1.852102, 0.9396788, 1, 1, 1, 1, 1,
1.332087, -0.1606335, 2.199695, 1, 1, 1, 1, 1,
1.333689, 0.9038239, 1.21011, 0, 0, 1, 1, 1,
1.342226, -0.6006966, 1.319991, 1, 0, 0, 1, 1,
1.343142, 0.2774019, 1.091443, 1, 0, 0, 1, 1,
1.344833, -0.6048767, 3.296606, 1, 0, 0, 1, 1,
1.345133, 0.1611221, 3.050116, 1, 0, 0, 1, 1,
1.348124, 0.974744, 0.811841, 1, 0, 0, 1, 1,
1.359635, -0.8537093, 1.595989, 0, 0, 0, 1, 1,
1.370695, 0.1053916, 0.5527421, 0, 0, 0, 1, 1,
1.401287, 1.314348, 1.313546, 0, 0, 0, 1, 1,
1.401453, 1.12633, 0.4636036, 0, 0, 0, 1, 1,
1.436108, -2.010948, 4.724478, 0, 0, 0, 1, 1,
1.446388, -1.875578, 1.396769, 0, 0, 0, 1, 1,
1.457991, 1.198113, 0.9497021, 0, 0, 0, 1, 1,
1.460133, 1.302045, 0.9739424, 1, 1, 1, 1, 1,
1.477816, 0.2959603, 1.860206, 1, 1, 1, 1, 1,
1.479794, -0.1348694, 1.685792, 1, 1, 1, 1, 1,
1.489284, 0.3657736, 0.6194548, 1, 1, 1, 1, 1,
1.491553, 0.3360549, 1.879202, 1, 1, 1, 1, 1,
1.49648, -0.9917136, -0.1967437, 1, 1, 1, 1, 1,
1.501754, 0.6090673, 0.02553226, 1, 1, 1, 1, 1,
1.509702, -0.2669552, -0.4310268, 1, 1, 1, 1, 1,
1.51792, 0.2637805, 2.12887, 1, 1, 1, 1, 1,
1.518583, 1.01446, 0.7227725, 1, 1, 1, 1, 1,
1.526271, -1.137062, 3.222127, 1, 1, 1, 1, 1,
1.529814, -0.9403625, 3.114436, 1, 1, 1, 1, 1,
1.531531, -1.813228, 1.348489, 1, 1, 1, 1, 1,
1.534065, -1.126875, 4.54746, 1, 1, 1, 1, 1,
1.545134, -1.083491, 1.662385, 1, 1, 1, 1, 1,
1.545262, 0.5734423, 0.9037766, 0, 0, 1, 1, 1,
1.55043, -1.170255, 1.067052, 1, 0, 0, 1, 1,
1.571657, 0.3587619, 2.217937, 1, 0, 0, 1, 1,
1.571992, -1.112034, 2.853078, 1, 0, 0, 1, 1,
1.584098, 1.520943, 1.239407, 1, 0, 0, 1, 1,
1.589297, 1.998982, -0.7329531, 1, 0, 0, 1, 1,
1.59544, 0.3854821, 1.670993, 0, 0, 0, 1, 1,
1.596752, -0.4161675, 1.944378, 0, 0, 0, 1, 1,
1.604067, 0.4541849, 1.05456, 0, 0, 0, 1, 1,
1.604204, 1.734421, -0.4543985, 0, 0, 0, 1, 1,
1.607509, 0.7601286, 1.529722, 0, 0, 0, 1, 1,
1.607945, 0.9061682, 1.082654, 0, 0, 0, 1, 1,
1.608348, 0.07335494, -0.4619767, 0, 0, 0, 1, 1,
1.609904, 0.2031222, 0.159776, 1, 1, 1, 1, 1,
1.611473, -0.4363019, 0.919134, 1, 1, 1, 1, 1,
1.619012, 2.001272, 0.7243497, 1, 1, 1, 1, 1,
1.619014, -0.6670727, 4.300625, 1, 1, 1, 1, 1,
1.635511, 0.4259094, 1.658912, 1, 1, 1, 1, 1,
1.647198, 0.4456926, 1.798251, 1, 1, 1, 1, 1,
1.648538, 0.08429015, 0.8196996, 1, 1, 1, 1, 1,
1.649306, 0.07309497, 1.761837, 1, 1, 1, 1, 1,
1.654341, -0.2952295, 2.414107, 1, 1, 1, 1, 1,
1.664389, 0.2142034, 0.961849, 1, 1, 1, 1, 1,
1.687299, 0.4905238, 1.13279, 1, 1, 1, 1, 1,
1.688631, -0.03824072, 2.171071, 1, 1, 1, 1, 1,
1.704453, -0.1315227, 2.152634, 1, 1, 1, 1, 1,
1.714151, 0.2513837, -0.02385661, 1, 1, 1, 1, 1,
1.729331, -0.1148407, 2.121431, 1, 1, 1, 1, 1,
1.731013, 0.4362221, 0.1269709, 0, 0, 1, 1, 1,
1.731878, -0.4760709, 2.261765, 1, 0, 0, 1, 1,
1.74086, -1.095922, 1.70048, 1, 0, 0, 1, 1,
1.755918, 1.091304, 1.315681, 1, 0, 0, 1, 1,
1.758138, -1.952695, 3.245666, 1, 0, 0, 1, 1,
1.76193, -1.041538, 1.727823, 1, 0, 0, 1, 1,
1.786809, 0.9756734, 1.01445, 0, 0, 0, 1, 1,
1.800787, 0.556789, 0.684324, 0, 0, 0, 1, 1,
1.815594, -0.9929993, 3.516578, 0, 0, 0, 1, 1,
1.824301, 0.8339667, 1.146733, 0, 0, 0, 1, 1,
1.825944, -0.5004012, 1.06305, 0, 0, 0, 1, 1,
1.844179, 0.1923094, 2.315145, 0, 0, 0, 1, 1,
1.847618, 1.169766, 1.053161, 0, 0, 0, 1, 1,
1.859702, -0.3969131, 1.592597, 1, 1, 1, 1, 1,
1.898338, -0.5421803, 1.867838, 1, 1, 1, 1, 1,
1.911852, 0.7502472, 1.425764, 1, 1, 1, 1, 1,
1.918464, -0.8369007, 1.479252, 1, 1, 1, 1, 1,
1.950065, 0.2051013, 3.526384, 1, 1, 1, 1, 1,
1.954686, -1.211106, 1.638325, 1, 1, 1, 1, 1,
1.974477, 0.09845788, 1.123234, 1, 1, 1, 1, 1,
1.984814, 0.3570302, 1.460019, 1, 1, 1, 1, 1,
1.994492, -0.6424214, 2.980926, 1, 1, 1, 1, 1,
2.052219, -0.5564224, 1.348102, 1, 1, 1, 1, 1,
2.059123, 0.6411832, 1.748364, 1, 1, 1, 1, 1,
2.066371, -1.247732, 0.3528415, 1, 1, 1, 1, 1,
2.136893, 0.2559228, 0.3528837, 1, 1, 1, 1, 1,
2.14409, 0.9584998, 0.7808535, 1, 1, 1, 1, 1,
2.188076, -0.6139766, 1.97277, 1, 1, 1, 1, 1,
2.193884, -0.7696508, 0.5401667, 0, 0, 1, 1, 1,
2.196119, -0.5199992, -0.006341566, 1, 0, 0, 1, 1,
2.21682, -1.24191, 2.621624, 1, 0, 0, 1, 1,
2.230046, -1.639669, 3.001175, 1, 0, 0, 1, 1,
2.257045, 0.3930807, 1.869864, 1, 0, 0, 1, 1,
2.293395, 1.093575, 2.460955, 1, 0, 0, 1, 1,
2.330271, -0.1747548, 4.284067, 0, 0, 0, 1, 1,
2.331222, -0.04433826, 2.423722, 0, 0, 0, 1, 1,
2.358364, -0.2473548, 2.060942, 0, 0, 0, 1, 1,
2.440557, 2.234611, 1.187327, 0, 0, 0, 1, 1,
2.449447, -0.06975722, 1.618477, 0, 0, 0, 1, 1,
2.463207, -0.6799436, 1.767553, 0, 0, 0, 1, 1,
2.469115, -1.029848, 3.016863, 0, 0, 0, 1, 1,
2.502919, 1.569195, 0.9557694, 1, 1, 1, 1, 1,
2.591023, -0.9608296, 3.383967, 1, 1, 1, 1, 1,
2.707393, 0.3125709, 1.321055, 1, 1, 1, 1, 1,
2.759356, -1.082158, 4.186245, 1, 1, 1, 1, 1,
2.76091, 0.3324574, 1.119795, 1, 1, 1, 1, 1,
2.874715, 0.869872, 1.770891, 1, 1, 1, 1, 1,
3.277374, -1.275272, 2.034693, 1, 1, 1, 1, 1
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
var radius = 9.558827;
var distance = 33.57498;
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
mvMatrix.translate( -0.1103511, 0.007660151, 0.1718962 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.57498);
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
