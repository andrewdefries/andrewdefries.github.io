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
-3.527631, 2.06437, 0.7455693, 1, 0, 0, 1,
-3.051126, 1.639353, -2.251485, 1, 0.007843138, 0, 1,
-2.97033, -0.9874327, -2.796114, 1, 0.01176471, 0, 1,
-2.748209, 0.8171715, -2.687258, 1, 0.01960784, 0, 1,
-2.729887, 0.4483447, 2.412677, 1, 0.02352941, 0, 1,
-2.726728, -0.7116266, -3.062886, 1, 0.03137255, 0, 1,
-2.651264, 0.5202218, -0.6630878, 1, 0.03529412, 0, 1,
-2.607037, -0.939576, -1.665141, 1, 0.04313726, 0, 1,
-2.597217, -0.5874197, -2.115803, 1, 0.04705882, 0, 1,
-2.592338, 0.990675, -1.599227, 1, 0.05490196, 0, 1,
-2.568686, 1.340469, 0.4928011, 1, 0.05882353, 0, 1,
-2.521516, 0.8915297, -0.1375094, 1, 0.06666667, 0, 1,
-2.498358, 0.08118509, -1.090436, 1, 0.07058824, 0, 1,
-2.439849, 1.106584, 0.1312024, 1, 0.07843138, 0, 1,
-2.334249, 0.8253697, -0.2640091, 1, 0.08235294, 0, 1,
-2.313794, -0.2865857, -0.8762897, 1, 0.09019608, 0, 1,
-2.262156, -0.02136431, -2.535468, 1, 0.09411765, 0, 1,
-2.256591, 1.09053, -0.1871242, 1, 0.1019608, 0, 1,
-2.217911, 0.600632, -2.412018, 1, 0.1098039, 0, 1,
-2.081036, 0.06682808, -2.375566, 1, 0.1137255, 0, 1,
-2.072587, 1.584485, -0.913725, 1, 0.1215686, 0, 1,
-2.068539, -1.148248, -0.436453, 1, 0.1254902, 0, 1,
-2.05579, 0.8043467, -0.2846996, 1, 0.1333333, 0, 1,
-2.046307, -1.035945, -3.521768, 1, 0.1372549, 0, 1,
-2.013037, -0.455637, -1.012076, 1, 0.145098, 0, 1,
-1.999073, 0.6920516, -1.107815, 1, 0.1490196, 0, 1,
-1.989626, 0.6820205, -1.661085, 1, 0.1568628, 0, 1,
-1.988516, 0.5787224, -0.8143941, 1, 0.1607843, 0, 1,
-1.983242, 1.167232, -1.497326, 1, 0.1686275, 0, 1,
-1.965051, -0.286179, -2.909395, 1, 0.172549, 0, 1,
-1.940495, -0.5032043, -0.9658545, 1, 0.1803922, 0, 1,
-1.93632, 0.0659171, -2.290833, 1, 0.1843137, 0, 1,
-1.928983, 1.322735, -2.297508, 1, 0.1921569, 0, 1,
-1.91439, -0.9011964, -2.62195, 1, 0.1960784, 0, 1,
-1.912615, -0.2920693, -2.60037, 1, 0.2039216, 0, 1,
-1.87185, 1.026171, -2.434301, 1, 0.2117647, 0, 1,
-1.855302, 0.6773034, -1.376397, 1, 0.2156863, 0, 1,
-1.853325, -2.938532, -4.520586, 1, 0.2235294, 0, 1,
-1.829912, 1.456593, -0.1724956, 1, 0.227451, 0, 1,
-1.817982, -0.2879815, -3.045009, 1, 0.2352941, 0, 1,
-1.814517, -0.8817469, -0.626569, 1, 0.2392157, 0, 1,
-1.797751, -0.1494045, -3.132714, 1, 0.2470588, 0, 1,
-1.787473, 0.5781356, 1.32574, 1, 0.2509804, 0, 1,
-1.777227, -1.394539, -3.006594, 1, 0.2588235, 0, 1,
-1.772814, 0.4452854, -0.4225902, 1, 0.2627451, 0, 1,
-1.769165, -1.114273, -2.257529, 1, 0.2705882, 0, 1,
-1.769154, -0.8942019, -0.8476503, 1, 0.2745098, 0, 1,
-1.769012, 1.902012, 0.3933575, 1, 0.282353, 0, 1,
-1.766122, -1.052144, -2.710613, 1, 0.2862745, 0, 1,
-1.764564, 1.245417, -2.607547, 1, 0.2941177, 0, 1,
-1.758268, 1.11925, 1.057623, 1, 0.3019608, 0, 1,
-1.753351, 2.369927, -0.08570667, 1, 0.3058824, 0, 1,
-1.749615, -0.7079104, -2.283504, 1, 0.3137255, 0, 1,
-1.744254, 0.007660745, -1.139597, 1, 0.3176471, 0, 1,
-1.732662, -0.4729498, -0.313912, 1, 0.3254902, 0, 1,
-1.730732, -0.6149811, -2.069109, 1, 0.3294118, 0, 1,
-1.718546, 0.8265737, -1.144713, 1, 0.3372549, 0, 1,
-1.716885, -0.4808463, -1.132236, 1, 0.3411765, 0, 1,
-1.700831, -0.5040781, -1.597046, 1, 0.3490196, 0, 1,
-1.68509, -0.2026922, 0.3028072, 1, 0.3529412, 0, 1,
-1.682871, 0.7047688, -2.017377, 1, 0.3607843, 0, 1,
-1.675168, -0.00430644, -1.867266, 1, 0.3647059, 0, 1,
-1.660175, 0.9006527, -0.5162923, 1, 0.372549, 0, 1,
-1.646537, -0.3893299, -1.731811, 1, 0.3764706, 0, 1,
-1.642939, 0.3714274, -1.02017, 1, 0.3843137, 0, 1,
-1.637007, 0.5984932, -0.2621711, 1, 0.3882353, 0, 1,
-1.622368, -0.03281233, -0.4565279, 1, 0.3960784, 0, 1,
-1.618945, 0.02122545, -2.849031, 1, 0.4039216, 0, 1,
-1.587243, -0.7341692, -0.3190446, 1, 0.4078431, 0, 1,
-1.576882, 0.1344593, 0.1754654, 1, 0.4156863, 0, 1,
-1.576316, 0.7209873, 0.168642, 1, 0.4196078, 0, 1,
-1.572196, 0.7857813, 0.505443, 1, 0.427451, 0, 1,
-1.569215, -0.5135038, -1.714159, 1, 0.4313726, 0, 1,
-1.556863, 0.3654298, -3.442028, 1, 0.4392157, 0, 1,
-1.552932, -0.7681133, -3.056678, 1, 0.4431373, 0, 1,
-1.548655, -0.6235585, -0.4428135, 1, 0.4509804, 0, 1,
-1.548293, 1.311647, -0.724563, 1, 0.454902, 0, 1,
-1.537695, 0.8659056, 0.2628372, 1, 0.4627451, 0, 1,
-1.516914, 0.7832791, -0.6813757, 1, 0.4666667, 0, 1,
-1.514619, 0.9696165, -0.541967, 1, 0.4745098, 0, 1,
-1.513852, 0.6519845, -0.9135966, 1, 0.4784314, 0, 1,
-1.500873, -1.811778, -3.224725, 1, 0.4862745, 0, 1,
-1.499758, 1.953989, -1.299783, 1, 0.4901961, 0, 1,
-1.494646, 0.04692237, 0.6836298, 1, 0.4980392, 0, 1,
-1.491939, -0.0894569, -0.6166208, 1, 0.5058824, 0, 1,
-1.490888, -0.6972597, -2.976345, 1, 0.509804, 0, 1,
-1.483443, -0.2190171, -2.930347, 1, 0.5176471, 0, 1,
-1.480836, 1.653669, -0.2925251, 1, 0.5215687, 0, 1,
-1.476474, -0.6691374, -4.792888, 1, 0.5294118, 0, 1,
-1.472305, -0.4959095, -1.260684, 1, 0.5333334, 0, 1,
-1.467281, 0.5363789, -1.277711, 1, 0.5411765, 0, 1,
-1.456383, 0.5104225, -1.185105, 1, 0.5450981, 0, 1,
-1.454611, 0.375845, -2.1412, 1, 0.5529412, 0, 1,
-1.450317, 1.545309, -1.040329, 1, 0.5568628, 0, 1,
-1.431169, -2.020919, -1.237029, 1, 0.5647059, 0, 1,
-1.402622, -0.9900382, -3.102779, 1, 0.5686275, 0, 1,
-1.401231, -1.115183, -3.636971, 1, 0.5764706, 0, 1,
-1.393901, -0.7816674, -1.626665, 1, 0.5803922, 0, 1,
-1.385975, -0.5371977, -0.4194944, 1, 0.5882353, 0, 1,
-1.379666, 0.1569271, -1.307491, 1, 0.5921569, 0, 1,
-1.377558, 0.9010739, 0.2063785, 1, 0.6, 0, 1,
-1.372641, 0.3133399, -1.06109, 1, 0.6078432, 0, 1,
-1.37026, 1.397256, -1.558688, 1, 0.6117647, 0, 1,
-1.357342, 0.9520701, -0.7859517, 1, 0.6196079, 0, 1,
-1.34611, 0.2483914, -2.348644, 1, 0.6235294, 0, 1,
-1.345614, 0.4217832, -0.2312286, 1, 0.6313726, 0, 1,
-1.339324, 0.2138709, -1.263571, 1, 0.6352941, 0, 1,
-1.337652, -0.1268641, -2.038832, 1, 0.6431373, 0, 1,
-1.330927, -0.8635222, -1.624062, 1, 0.6470588, 0, 1,
-1.322056, 1.985216, 0.3244287, 1, 0.654902, 0, 1,
-1.319683, 1.701859, -1.334888, 1, 0.6588235, 0, 1,
-1.303353, -1.517596, -0.3217867, 1, 0.6666667, 0, 1,
-1.292412, -0.2603247, -1.462783, 1, 0.6705883, 0, 1,
-1.28464, -0.7745622, -2.244289, 1, 0.6784314, 0, 1,
-1.278745, -0.735087, -3.687239, 1, 0.682353, 0, 1,
-1.27529, 0.2827278, -0.4496351, 1, 0.6901961, 0, 1,
-1.266907, -1.665522, -3.449091, 1, 0.6941177, 0, 1,
-1.266375, -0.9691148, -1.905504, 1, 0.7019608, 0, 1,
-1.2588, 0.2838711, -1.931729, 1, 0.7098039, 0, 1,
-1.249251, -2.032616, -3.496154, 1, 0.7137255, 0, 1,
-1.241686, 0.7093866, -1.046542, 1, 0.7215686, 0, 1,
-1.237766, 0.02633914, -2.660551, 1, 0.7254902, 0, 1,
-1.224887, 0.1325584, -1.826176, 1, 0.7333333, 0, 1,
-1.215316, 0.5210062, -1.609632, 1, 0.7372549, 0, 1,
-1.208405, -0.1660526, -1.578026, 1, 0.7450981, 0, 1,
-1.207615, -1.543138, -1.576948, 1, 0.7490196, 0, 1,
-1.195225, -2.014298, -2.175857, 1, 0.7568628, 0, 1,
-1.190859, -1.52434, -2.552072, 1, 0.7607843, 0, 1,
-1.190636, -0.8826276, -1.939494, 1, 0.7686275, 0, 1,
-1.189985, 1.705737, -1.780156, 1, 0.772549, 0, 1,
-1.188335, -0.1770462, -2.583825, 1, 0.7803922, 0, 1,
-1.182857, -0.2764319, -1.604107, 1, 0.7843137, 0, 1,
-1.179026, -0.005788341, -1.421874, 1, 0.7921569, 0, 1,
-1.1621, 2.78552, -1.680074, 1, 0.7960784, 0, 1,
-1.154657, -0.003224013, -3.672076, 1, 0.8039216, 0, 1,
-1.150375, 1.432593, -2.373044, 1, 0.8117647, 0, 1,
-1.146176, 0.3212352, -1.10466, 1, 0.8156863, 0, 1,
-1.145201, -2.512933, -3.689382, 1, 0.8235294, 0, 1,
-1.140139, 0.5193788, -2.728003, 1, 0.827451, 0, 1,
-1.138942, -2.825313, -1.901478, 1, 0.8352941, 0, 1,
-1.136773, 0.3479352, -0.01157949, 1, 0.8392157, 0, 1,
-1.134542, -0.6601606, -1.412449, 1, 0.8470588, 0, 1,
-1.12658, -0.2484171, -0.6006103, 1, 0.8509804, 0, 1,
-1.124519, 0.9491315, -1.341045, 1, 0.8588235, 0, 1,
-1.123868, 1.94315, -1.653843, 1, 0.8627451, 0, 1,
-1.122576, -0.530917, -0.7143345, 1, 0.8705882, 0, 1,
-1.120013, 1.788579, -1.388555, 1, 0.8745098, 0, 1,
-1.110643, 2.396354, 1.713026, 1, 0.8823529, 0, 1,
-1.107274, -3.340946, -2.567811, 1, 0.8862745, 0, 1,
-1.100825, -0.8391289, -2.134148, 1, 0.8941177, 0, 1,
-1.089306, 1.221554, -0.05644063, 1, 0.8980392, 0, 1,
-1.088493, 2.298696, -0.02512207, 1, 0.9058824, 0, 1,
-1.085806, 0.1234735, -1.140231, 1, 0.9137255, 0, 1,
-1.08427, -1.967129, -1.581086, 1, 0.9176471, 0, 1,
-1.073871, -1.764352, -3.781845, 1, 0.9254902, 0, 1,
-1.064095, 0.07110612, -0.7493386, 1, 0.9294118, 0, 1,
-1.062742, -0.1237289, -0.3307345, 1, 0.9372549, 0, 1,
-1.060368, 0.8977755, -0.3828996, 1, 0.9411765, 0, 1,
-1.057765, 0.1722203, -1.919183, 1, 0.9490196, 0, 1,
-1.056942, 0.2166401, -2.411427, 1, 0.9529412, 0, 1,
-1.053897, 1.692859, -0.3122307, 1, 0.9607843, 0, 1,
-1.044977, 1.557255, -1.980276, 1, 0.9647059, 0, 1,
-1.037943, 0.7625406, -0.8477296, 1, 0.972549, 0, 1,
-1.035072, 0.01881669, -1.564777, 1, 0.9764706, 0, 1,
-1.029323, -0.7997425, -2.607372, 1, 0.9843137, 0, 1,
-1.02932, -0.3870117, -3.091222, 1, 0.9882353, 0, 1,
-1.022666, 1.155447, -1.689509, 1, 0.9960784, 0, 1,
-1.018384, 1.935548, -0.6339072, 0.9960784, 1, 0, 1,
-1.015165, -1.155435, -1.287657, 0.9921569, 1, 0, 1,
-1.015057, -0.6918586, -3.16851, 0.9843137, 1, 0, 1,
-1.007957, -0.1683156, -1.226825, 0.9803922, 1, 0, 1,
-1.003166, 0.7065741, -2.398393, 0.972549, 1, 0, 1,
-0.993441, -1.123802, -2.157005, 0.9686275, 1, 0, 1,
-0.9890711, -0.982824, -3.089509, 0.9607843, 1, 0, 1,
-0.983216, -1.028922, -1.490463, 0.9568627, 1, 0, 1,
-0.9795053, 0.2716328, -1.928125, 0.9490196, 1, 0, 1,
-0.9743495, 2.016851, -1.6184, 0.945098, 1, 0, 1,
-0.9710155, 0.3041979, -1.90295, 0.9372549, 1, 0, 1,
-0.9704375, 0.2707947, -0.6097107, 0.9333333, 1, 0, 1,
-0.9652932, 1.22167, 0.2887979, 0.9254902, 1, 0, 1,
-0.9636041, -1.243106, -3.480926, 0.9215686, 1, 0, 1,
-0.9625001, -1.043816, -2.43669, 0.9137255, 1, 0, 1,
-0.9548711, 0.6531478, -4.164437, 0.9098039, 1, 0, 1,
-0.9540376, 1.488681, -0.7126236, 0.9019608, 1, 0, 1,
-0.9516928, 1.048667, -1.609089, 0.8941177, 1, 0, 1,
-0.9505966, -0.3650333, -2.284737, 0.8901961, 1, 0, 1,
-0.9431305, -0.4515994, -2.1397, 0.8823529, 1, 0, 1,
-0.9327902, -0.6152137, -3.907768, 0.8784314, 1, 0, 1,
-0.921973, -0.5104976, -1.373662, 0.8705882, 1, 0, 1,
-0.9141745, 0.5474204, -0.1279372, 0.8666667, 1, 0, 1,
-0.9092258, 0.3506521, -2.007211, 0.8588235, 1, 0, 1,
-0.9090635, 0.8644866, -0.4886386, 0.854902, 1, 0, 1,
-0.9068975, 0.1984123, -2.61911, 0.8470588, 1, 0, 1,
-0.9011891, -1.240199, -2.786417, 0.8431373, 1, 0, 1,
-0.8948472, 1.628075, 0.2850657, 0.8352941, 1, 0, 1,
-0.8849881, 0.07049551, -0.7369962, 0.8313726, 1, 0, 1,
-0.8821804, 0.5618946, 0.01418222, 0.8235294, 1, 0, 1,
-0.8813261, 1.095818, -1.286308, 0.8196079, 1, 0, 1,
-0.8786798, 0.3150711, -1.532196, 0.8117647, 1, 0, 1,
-0.8741241, 0.9094011, 0.49196, 0.8078431, 1, 0, 1,
-0.8738741, -0.7210022, 0.2045291, 0.8, 1, 0, 1,
-0.8716154, -0.01035377, -2.421254, 0.7921569, 1, 0, 1,
-0.8698416, -0.55255, -3.199449, 0.7882353, 1, 0, 1,
-0.8684837, -0.0883837, -2.703006, 0.7803922, 1, 0, 1,
-0.8610491, -0.03225441, 0.1403207, 0.7764706, 1, 0, 1,
-0.8610262, -1.969715, -2.698618, 0.7686275, 1, 0, 1,
-0.8553756, -0.01130707, -1.241354, 0.7647059, 1, 0, 1,
-0.8536008, -0.9371516, -4.466688, 0.7568628, 1, 0, 1,
-0.8507349, 0.03441976, 0.7578318, 0.7529412, 1, 0, 1,
-0.8501198, 1.007985, -1.658839, 0.7450981, 1, 0, 1,
-0.8488371, 0.2378242, -1.049886, 0.7411765, 1, 0, 1,
-0.8487226, -0.7107167, -1.816254, 0.7333333, 1, 0, 1,
-0.8478309, -0.5057666, -2.411766, 0.7294118, 1, 0, 1,
-0.8467215, 0.1169061, -2.153242, 0.7215686, 1, 0, 1,
-0.8456543, 0.4147956, -2.0062, 0.7176471, 1, 0, 1,
-0.8453767, 0.6060147, 0.05603037, 0.7098039, 1, 0, 1,
-0.8411012, -1.126908, -2.668905, 0.7058824, 1, 0, 1,
-0.8388291, -1.153743, -2.446734, 0.6980392, 1, 0, 1,
-0.838649, 1.708847, -0.3653567, 0.6901961, 1, 0, 1,
-0.8385379, 0.3660356, -0.9247888, 0.6862745, 1, 0, 1,
-0.8384349, -1.952521, -2.088077, 0.6784314, 1, 0, 1,
-0.837338, -0.439353, -1.84931, 0.6745098, 1, 0, 1,
-0.8314934, 0.01744391, -0.6914046, 0.6666667, 1, 0, 1,
-0.8283378, 0.5015925, -2.197462, 0.6627451, 1, 0, 1,
-0.8254023, 1.406004, 0.2884272, 0.654902, 1, 0, 1,
-0.825386, 0.1762463, -0.5924066, 0.6509804, 1, 0, 1,
-0.8151799, 0.3755942, -0.9574274, 0.6431373, 1, 0, 1,
-0.8083508, 1.161359, 0.5212962, 0.6392157, 1, 0, 1,
-0.8069594, 0.5654338, 0.5086036, 0.6313726, 1, 0, 1,
-0.8026704, 1.232652, -0.07313959, 0.627451, 1, 0, 1,
-0.8019432, -0.9335543, -1.496904, 0.6196079, 1, 0, 1,
-0.7996972, -0.3869497, -0.7671825, 0.6156863, 1, 0, 1,
-0.7991594, -0.4406276, -0.1937135, 0.6078432, 1, 0, 1,
-0.7968133, -0.1665033, -2.426426, 0.6039216, 1, 0, 1,
-0.7958614, -0.5684982, -1.62477, 0.5960785, 1, 0, 1,
-0.7928087, 0.2537232, -1.676381, 0.5882353, 1, 0, 1,
-0.791257, -1.080749, -2.168869, 0.5843138, 1, 0, 1,
-0.7911333, 1.152548, -0.4579506, 0.5764706, 1, 0, 1,
-0.7909747, -1.064589, -1.626413, 0.572549, 1, 0, 1,
-0.7897279, 0.7222761, 0.2165613, 0.5647059, 1, 0, 1,
-0.786, -1.040262, -2.588825, 0.5607843, 1, 0, 1,
-0.7835879, -2.015753, -2.185877, 0.5529412, 1, 0, 1,
-0.7790408, -1.009337, -1.692184, 0.5490196, 1, 0, 1,
-0.7788103, 0.5184792, -2.448485, 0.5411765, 1, 0, 1,
-0.7758526, 0.5673975, -0.3350915, 0.5372549, 1, 0, 1,
-0.7708804, -2.057238, -4.706378, 0.5294118, 1, 0, 1,
-0.7489137, 0.8782851, -0.7527624, 0.5254902, 1, 0, 1,
-0.7486898, -1.199825, -3.414279, 0.5176471, 1, 0, 1,
-0.7417134, 2.202343, -0.6701978, 0.5137255, 1, 0, 1,
-0.7407575, -0.4475766, -3.782511, 0.5058824, 1, 0, 1,
-0.7335572, -1.867394, -2.365334, 0.5019608, 1, 0, 1,
-0.7320306, -0.5961521, -1.769181, 0.4941176, 1, 0, 1,
-0.7318383, -0.6264686, -1.368851, 0.4862745, 1, 0, 1,
-0.730638, -0.2934835, -3.324703, 0.4823529, 1, 0, 1,
-0.7270879, -0.6448212, -2.24254, 0.4745098, 1, 0, 1,
-0.7252791, 0.128918, -1.317524, 0.4705882, 1, 0, 1,
-0.7249879, 0.5849705, -0.8828747, 0.4627451, 1, 0, 1,
-0.7237365, -1.15363, -2.623825, 0.4588235, 1, 0, 1,
-0.7235405, -2.105473, -3.206283, 0.4509804, 1, 0, 1,
-0.7235006, 0.2336871, -2.931007, 0.4470588, 1, 0, 1,
-0.7222483, 0.353185, -1.761273, 0.4392157, 1, 0, 1,
-0.7215531, -1.914499, -3.463167, 0.4352941, 1, 0, 1,
-0.7193897, -0.2624351, -3.078919, 0.427451, 1, 0, 1,
-0.718751, 0.4961853, -3.229387, 0.4235294, 1, 0, 1,
-0.7183085, 1.266639, -1.906092, 0.4156863, 1, 0, 1,
-0.7181798, 0.546769, -2.142303, 0.4117647, 1, 0, 1,
-0.7177805, 0.4006996, -1.035107, 0.4039216, 1, 0, 1,
-0.7155667, 1.661763, 0.341524, 0.3960784, 1, 0, 1,
-0.7146925, -0.7839555, -4.535387, 0.3921569, 1, 0, 1,
-0.7035496, 2.068319, -1.62737, 0.3843137, 1, 0, 1,
-0.6995445, 0.2195587, -1.475467, 0.3803922, 1, 0, 1,
-0.6910109, -0.4901772, -3.196469, 0.372549, 1, 0, 1,
-0.6838263, 1.103126, -0.5676599, 0.3686275, 1, 0, 1,
-0.682813, -1.652903, -2.895986, 0.3607843, 1, 0, 1,
-0.680079, 1.223391, -0.247503, 0.3568628, 1, 0, 1,
-0.677781, 1.708411, -0.8786843, 0.3490196, 1, 0, 1,
-0.6756259, 1.534361, 1.008361, 0.345098, 1, 0, 1,
-0.6751753, 0.6028863, -0.7884893, 0.3372549, 1, 0, 1,
-0.6734102, -1.650542, -2.426281, 0.3333333, 1, 0, 1,
-0.6704285, 0.9308459, -1.423092, 0.3254902, 1, 0, 1,
-0.6685824, 0.9608143, -0.5759161, 0.3215686, 1, 0, 1,
-0.6682333, 0.1181067, -1.899991, 0.3137255, 1, 0, 1,
-0.6679286, 1.615187, 0.4563858, 0.3098039, 1, 0, 1,
-0.6612878, -0.6898974, -2.802405, 0.3019608, 1, 0, 1,
-0.6524879, 0.2370874, -0.7377313, 0.2941177, 1, 0, 1,
-0.6498759, -0.9288692, -2.889446, 0.2901961, 1, 0, 1,
-0.6455371, -0.81394, -2.346563, 0.282353, 1, 0, 1,
-0.6445473, -1.310141, -3.38348, 0.2784314, 1, 0, 1,
-0.6413797, 0.4033713, -0.7953022, 0.2705882, 1, 0, 1,
-0.6408455, -0.08998138, 0.1175532, 0.2666667, 1, 0, 1,
-0.6390754, -0.4063438, -3.690567, 0.2588235, 1, 0, 1,
-0.6377146, 0.01767883, -1.714166, 0.254902, 1, 0, 1,
-0.6317365, -0.7344801, -3.552222, 0.2470588, 1, 0, 1,
-0.6309861, -0.4950479, -1.855402, 0.2431373, 1, 0, 1,
-0.6272171, -0.8130994, -3.9122, 0.2352941, 1, 0, 1,
-0.6269481, 0.6252329, -1.201359, 0.2313726, 1, 0, 1,
-0.6230066, -0.7196651, -2.486984, 0.2235294, 1, 0, 1,
-0.6228137, -0.7693361, -4.267883, 0.2196078, 1, 0, 1,
-0.6196452, -0.7043702, -0.6850184, 0.2117647, 1, 0, 1,
-0.607583, -0.4552082, -0.1005078, 0.2078431, 1, 0, 1,
-0.5999333, -0.3130728, -2.465405, 0.2, 1, 0, 1,
-0.5997929, 0.3509196, -1.15844, 0.1921569, 1, 0, 1,
-0.5978333, -0.1586743, -1.314814, 0.1882353, 1, 0, 1,
-0.5931966, 1.648268, -0.00538718, 0.1803922, 1, 0, 1,
-0.5907624, 0.1766446, -0.6454187, 0.1764706, 1, 0, 1,
-0.5857103, -0.4112703, -1.551906, 0.1686275, 1, 0, 1,
-0.5844702, -0.7495134, -2.989439, 0.1647059, 1, 0, 1,
-0.5785081, 0.526022, -2.302697, 0.1568628, 1, 0, 1,
-0.5773062, -0.1318167, -3.862011, 0.1529412, 1, 0, 1,
-0.5654209, 0.6825038, -0.3081394, 0.145098, 1, 0, 1,
-0.5641355, -0.3567394, -0.5295004, 0.1411765, 1, 0, 1,
-0.5586179, -0.1599058, -2.085587, 0.1333333, 1, 0, 1,
-0.5553754, -1.245744, -1.958501, 0.1294118, 1, 0, 1,
-0.5524399, 0.518312, -1.159601, 0.1215686, 1, 0, 1,
-0.5521823, 1.340513, -1.025865, 0.1176471, 1, 0, 1,
-0.5508259, 0.233572, 0.4014238, 0.1098039, 1, 0, 1,
-0.5458418, -0.3642046, -2.468365, 0.1058824, 1, 0, 1,
-0.5456583, 2.009669, -0.9203587, 0.09803922, 1, 0, 1,
-0.5423895, -0.2091307, -2.032152, 0.09019608, 1, 0, 1,
-0.5349873, -2.255147, -4.36904, 0.08627451, 1, 0, 1,
-0.5346743, -1.086991, -2.9456, 0.07843138, 1, 0, 1,
-0.529852, 2.185446, 0.6631999, 0.07450981, 1, 0, 1,
-0.5284996, 0.6897724, -2.420897, 0.06666667, 1, 0, 1,
-0.5270622, 0.0245906, -3.09337, 0.0627451, 1, 0, 1,
-0.5250365, -0.7309923, -0.9948207, 0.05490196, 1, 0, 1,
-0.5236476, -0.8637578, -2.378918, 0.05098039, 1, 0, 1,
-0.5235375, -0.1157536, -3.35143, 0.04313726, 1, 0, 1,
-0.5212749, -0.1938794, -1.875642, 0.03921569, 1, 0, 1,
-0.5135813, 1.393864, -0.2596084, 0.03137255, 1, 0, 1,
-0.5104264, -0.7436894, -2.838851, 0.02745098, 1, 0, 1,
-0.5062651, -1.255208, -3.173558, 0.01960784, 1, 0, 1,
-0.5037308, 0.5258228, -1.525985, 0.01568628, 1, 0, 1,
-0.4933857, 0.01947245, -1.465351, 0.007843138, 1, 0, 1,
-0.4910037, -0.1938837, -0.7087896, 0.003921569, 1, 0, 1,
-0.4778701, 0.9004916, -0.2286755, 0, 1, 0.003921569, 1,
-0.4771717, -0.3224568, -1.352538, 0, 1, 0.01176471, 1,
-0.4751868, -1.700059, -3.604186, 0, 1, 0.01568628, 1,
-0.4750195, -2.155269, -2.614969, 0, 1, 0.02352941, 1,
-0.4608667, 0.29178, -1.116442, 0, 1, 0.02745098, 1,
-0.4583147, -0.4451552, -1.108584, 0, 1, 0.03529412, 1,
-0.4580404, 2.392405, -1.265004, 0, 1, 0.03921569, 1,
-0.4578644, 1.875085, 0.1472115, 0, 1, 0.04705882, 1,
-0.454573, 0.03401256, -0.9962415, 0, 1, 0.05098039, 1,
-0.4509956, -0.09743039, -2.437619, 0, 1, 0.05882353, 1,
-0.4479345, 0.5663244, -1.07571, 0, 1, 0.0627451, 1,
-0.4470435, -1.221989, -2.158887, 0, 1, 0.07058824, 1,
-0.4433068, -0.9732423, -3.973937, 0, 1, 0.07450981, 1,
-0.4407865, -0.6867421, -4.209154, 0, 1, 0.08235294, 1,
-0.4386831, -0.5836169, -3.148604, 0, 1, 0.08627451, 1,
-0.4341206, 1.288075, -0.8502268, 0, 1, 0.09411765, 1,
-0.4309464, -1.410898, -4.990471, 0, 1, 0.1019608, 1,
-0.4303943, 0.1540107, -3.031358, 0, 1, 0.1058824, 1,
-0.4303164, -0.2559083, -1.225043, 0, 1, 0.1137255, 1,
-0.4139522, 0.1657257, -0.7811857, 0, 1, 0.1176471, 1,
-0.4067646, 0.09390509, -0.5144083, 0, 1, 0.1254902, 1,
-0.4050051, 0.9226798, -1.208223, 0, 1, 0.1294118, 1,
-0.4047622, -0.5925063, -2.045299, 0, 1, 0.1372549, 1,
-0.4037763, 0.2774455, -0.8544342, 0, 1, 0.1411765, 1,
-0.4008808, 1.17229, -0.3227674, 0, 1, 0.1490196, 1,
-0.3998225, -1.586452, -3.971517, 0, 1, 0.1529412, 1,
-0.3982127, 2.020375, 0.2000691, 0, 1, 0.1607843, 1,
-0.3977015, 1.383099, 0.3655624, 0, 1, 0.1647059, 1,
-0.3904691, -1.370698, -2.087713, 0, 1, 0.172549, 1,
-0.3876338, -0.9059303, -2.153617, 0, 1, 0.1764706, 1,
-0.3853366, -0.6892345, -5.602715, 0, 1, 0.1843137, 1,
-0.3835124, -0.9624621, -3.033759, 0, 1, 0.1882353, 1,
-0.382137, 0.4142263, -2.090075, 0, 1, 0.1960784, 1,
-0.3810379, 1.14994, 0.3595268, 0, 1, 0.2039216, 1,
-0.3794402, -0.1578695, -2.027708, 0, 1, 0.2078431, 1,
-0.3762637, 0.2685289, -1.035759, 0, 1, 0.2156863, 1,
-0.3752171, -1.037842, -1.656143, 0, 1, 0.2196078, 1,
-0.3738693, -0.6312432, -2.692509, 0, 1, 0.227451, 1,
-0.3713979, -0.9814954, -2.643143, 0, 1, 0.2313726, 1,
-0.36458, -0.7344084, -1.593135, 0, 1, 0.2392157, 1,
-0.3552755, -1.376642, -1.706079, 0, 1, 0.2431373, 1,
-0.3535878, -1.418039, -1.546209, 0, 1, 0.2509804, 1,
-0.3405671, -0.5084094, -3.787739, 0, 1, 0.254902, 1,
-0.3389351, 0.5239595, -1.179146, 0, 1, 0.2627451, 1,
-0.3385155, 0.2203075, -1.098054, 0, 1, 0.2666667, 1,
-0.3233147, 1.259336, -0.9799913, 0, 1, 0.2745098, 1,
-0.3215165, -0.2635241, -1.937312, 0, 1, 0.2784314, 1,
-0.3212536, 0.5143542, -0.8922154, 0, 1, 0.2862745, 1,
-0.3210261, 1.144867, 0.7406783, 0, 1, 0.2901961, 1,
-0.3201408, 0.4380115, 0.5153772, 0, 1, 0.2980392, 1,
-0.3113491, -0.8772339, -3.134357, 0, 1, 0.3058824, 1,
-0.3109995, -2.571889, -2.7815, 0, 1, 0.3098039, 1,
-0.3086755, 0.8683502, 0.6468233, 0, 1, 0.3176471, 1,
-0.3076822, 1.426696, -0.4327582, 0, 1, 0.3215686, 1,
-0.3048215, 1.990835, 0.726451, 0, 1, 0.3294118, 1,
-0.3043141, 1.319939, -1.556391, 0, 1, 0.3333333, 1,
-0.2999423, 0.1923936, 0.8166063, 0, 1, 0.3411765, 1,
-0.2985341, -1.361528, -3.321888, 0, 1, 0.345098, 1,
-0.2965727, 1.320219, -0.2662249, 0, 1, 0.3529412, 1,
-0.2963244, -0.4504837, -3.316925, 0, 1, 0.3568628, 1,
-0.2944279, 0.8035164, -1.109585, 0, 1, 0.3647059, 1,
-0.2939953, -1.019523, -3.309685, 0, 1, 0.3686275, 1,
-0.2922734, 0.6991113, 0.5335414, 0, 1, 0.3764706, 1,
-0.2917133, -0.7364812, -3.792575, 0, 1, 0.3803922, 1,
-0.2908256, 2.326812, 0.09711789, 0, 1, 0.3882353, 1,
-0.2868984, -0.7933274, -2.195279, 0, 1, 0.3921569, 1,
-0.285798, -0.3006958, -1.964489, 0, 1, 0.4, 1,
-0.2766243, -0.4250538, -3.407064, 0, 1, 0.4078431, 1,
-0.2765438, 1.527865, -1.831848, 0, 1, 0.4117647, 1,
-0.2759014, -0.9115627, -4.272975, 0, 1, 0.4196078, 1,
-0.2737279, 0.7526425, 0.04866058, 0, 1, 0.4235294, 1,
-0.2720224, -0.2277246, -2.383131, 0, 1, 0.4313726, 1,
-0.2713116, 0.863802, -1.120165, 0, 1, 0.4352941, 1,
-0.2709789, 0.3574836, -1.24659, 0, 1, 0.4431373, 1,
-0.2694137, -0.4476851, -2.628022, 0, 1, 0.4470588, 1,
-0.2678319, 0.5893036, 0.3431458, 0, 1, 0.454902, 1,
-0.2642624, 0.6604119, 0.4428566, 0, 1, 0.4588235, 1,
-0.2588284, 1.00437, 0.7036306, 0, 1, 0.4666667, 1,
-0.2585681, -1.008672, -3.629606, 0, 1, 0.4705882, 1,
-0.2468729, -0.02864556, -1.589913, 0, 1, 0.4784314, 1,
-0.2383599, 0.451455, -0.5291722, 0, 1, 0.4823529, 1,
-0.2332924, 1.16363, 0.544217, 0, 1, 0.4901961, 1,
-0.2319294, -1.316163, -1.112252, 0, 1, 0.4941176, 1,
-0.230503, 0.8843643, 1.299973, 0, 1, 0.5019608, 1,
-0.220047, 1.104337, -2.745215, 0, 1, 0.509804, 1,
-0.219693, -0.843329, -2.620937, 0, 1, 0.5137255, 1,
-0.2177303, -0.2502051, -2.212361, 0, 1, 0.5215687, 1,
-0.2172348, -0.9111311, -3.309189, 0, 1, 0.5254902, 1,
-0.2130399, 0.759691, -1.128084, 0, 1, 0.5333334, 1,
-0.2120294, -1.273014, -3.181823, 0, 1, 0.5372549, 1,
-0.2115881, 0.4065911, -0.3764729, 0, 1, 0.5450981, 1,
-0.2099717, -2.146487, -4.324148, 0, 1, 0.5490196, 1,
-0.2066519, -0.4739693, -3.698905, 0, 1, 0.5568628, 1,
-0.2038522, -0.2002448, -2.370056, 0, 1, 0.5607843, 1,
-0.2005082, 0.1230326, -1.130925, 0, 1, 0.5686275, 1,
-0.1995734, 0.7251173, 1.146708, 0, 1, 0.572549, 1,
-0.1988178, -0.7909268, -3.307101, 0, 1, 0.5803922, 1,
-0.1939074, 1.290385, -0.3836268, 0, 1, 0.5843138, 1,
-0.1927852, -0.5241287, -4.299198, 0, 1, 0.5921569, 1,
-0.191991, -1.172131, -4.449672, 0, 1, 0.5960785, 1,
-0.1890845, 0.9798936, 0.5156215, 0, 1, 0.6039216, 1,
-0.1869734, 0.6077659, -0.268564, 0, 1, 0.6117647, 1,
-0.1845604, -0.6216594, -3.149673, 0, 1, 0.6156863, 1,
-0.1840048, 2.348963, -0.9304703, 0, 1, 0.6235294, 1,
-0.183347, 0.2449505, 0.7998504, 0, 1, 0.627451, 1,
-0.1761774, 0.01281429, -1.930875, 0, 1, 0.6352941, 1,
-0.1709028, -1.646873, -4.187483, 0, 1, 0.6392157, 1,
-0.1693956, -0.8574389, -3.619226, 0, 1, 0.6470588, 1,
-0.1672544, -1.069293, -1.858049, 0, 1, 0.6509804, 1,
-0.162314, 2.824517, -0.5119844, 0, 1, 0.6588235, 1,
-0.1617686, 2.729044, 0.6825701, 0, 1, 0.6627451, 1,
-0.1613802, 0.9730504, -0.0261329, 0, 1, 0.6705883, 1,
-0.1587101, 2.424183, 0.5180544, 0, 1, 0.6745098, 1,
-0.1571265, -1.494651, -1.72545, 0, 1, 0.682353, 1,
-0.1559053, 0.1502228, -1.712492, 0, 1, 0.6862745, 1,
-0.1552052, 0.9210845, 0.1600574, 0, 1, 0.6941177, 1,
-0.1545531, -1.797036, -2.183922, 0, 1, 0.7019608, 1,
-0.1511128, -0.8178846, -1.966554, 0, 1, 0.7058824, 1,
-0.1509269, 1.076115, 0.7603111, 0, 1, 0.7137255, 1,
-0.1495529, -0.6794078, -5.66859, 0, 1, 0.7176471, 1,
-0.1487631, -0.8156222, -3.66515, 0, 1, 0.7254902, 1,
-0.1469047, 0.2045202, 0.7642991, 0, 1, 0.7294118, 1,
-0.1414013, -0.336837, -3.908063, 0, 1, 0.7372549, 1,
-0.1411533, -0.597763, -2.619051, 0, 1, 0.7411765, 1,
-0.1408629, -0.4495438, -3.636051, 0, 1, 0.7490196, 1,
-0.1360935, -2.065925, -3.546593, 0, 1, 0.7529412, 1,
-0.1356625, -0.453297, -1.968436, 0, 1, 0.7607843, 1,
-0.135285, 3.264202, 0.5529862, 0, 1, 0.7647059, 1,
-0.1303487, -0.6012832, -3.108851, 0, 1, 0.772549, 1,
-0.1294866, -1.0432, -2.09821, 0, 1, 0.7764706, 1,
-0.1294536, 0.2698826, -0.4661084, 0, 1, 0.7843137, 1,
-0.1294448, 0.8408099, -1.184526, 0, 1, 0.7882353, 1,
-0.1271521, -1.232497, -3.218143, 0, 1, 0.7960784, 1,
-0.1252373, 1.740757, 0.1552822, 0, 1, 0.8039216, 1,
-0.1252246, 0.5057442, 0.04514141, 0, 1, 0.8078431, 1,
-0.1204678, -0.5079172, -1.637611, 0, 1, 0.8156863, 1,
-0.1198574, 1.413818, 0.0432926, 0, 1, 0.8196079, 1,
-0.1140814, -2.129446, -4.793491, 0, 1, 0.827451, 1,
-0.1140406, -0.2905392, -3.181883, 0, 1, 0.8313726, 1,
-0.1136752, 0.6126452, 0.6696493, 0, 1, 0.8392157, 1,
-0.109174, -0.6089159, -2.450254, 0, 1, 0.8431373, 1,
-0.1052021, -0.09974986, -0.795679, 0, 1, 0.8509804, 1,
-0.09798776, 0.8142834, 0.7754623, 0, 1, 0.854902, 1,
-0.09401896, 0.4077963, 0.8131718, 0, 1, 0.8627451, 1,
-0.08969616, 1.284212, 0.4098284, 0, 1, 0.8666667, 1,
-0.08647507, -1.180083, -2.985471, 0, 1, 0.8745098, 1,
-0.08531373, 0.3309809, -0.8389439, 0, 1, 0.8784314, 1,
-0.08402265, 0.6483353, -0.2263582, 0, 1, 0.8862745, 1,
-0.08343612, -0.6321894, -2.424353, 0, 1, 0.8901961, 1,
-0.08085044, -0.6474901, -1.912955, 0, 1, 0.8980392, 1,
-0.07794737, -0.09575704, -1.548954, 0, 1, 0.9058824, 1,
-0.07707442, -0.01839439, -1.828088, 0, 1, 0.9098039, 1,
-0.07586677, -0.987286, -1.991556, 0, 1, 0.9176471, 1,
-0.07270188, -0.8488076, -3.792834, 0, 1, 0.9215686, 1,
-0.0693345, 0.02604085, -1.338711, 0, 1, 0.9294118, 1,
-0.06542356, -0.8210937, -4.455068, 0, 1, 0.9333333, 1,
-0.06133638, 1.36955, -0.4345806, 0, 1, 0.9411765, 1,
-0.05891074, -2.359705, -2.503371, 0, 1, 0.945098, 1,
-0.05873239, -0.2303819, -5.254295, 0, 1, 0.9529412, 1,
-0.0564611, 0.51572, -0.6132118, 0, 1, 0.9568627, 1,
-0.05631733, -0.9796224, -4.570984, 0, 1, 0.9647059, 1,
-0.05149764, -0.7210292, -1.683164, 0, 1, 0.9686275, 1,
-0.0496125, -0.1722486, -3.761868, 0, 1, 0.9764706, 1,
-0.04946996, 0.02778124, -1.876759, 0, 1, 0.9803922, 1,
-0.04792713, -0.6734096, -3.097897, 0, 1, 0.9882353, 1,
-0.04733567, 1.119449, -2.270745, 0, 1, 0.9921569, 1,
-0.04042364, -0.2196757, -3.88631, 0, 1, 1, 1,
-0.04026605, 0.0916744, -1.655446, 0, 0.9921569, 1, 1,
-0.03820955, 0.4698378, 0.9987736, 0, 0.9882353, 1, 1,
-0.03796051, 0.3484109, 0.3214977, 0, 0.9803922, 1, 1,
-0.03440901, 0.3101418, -1.55072, 0, 0.9764706, 1, 1,
-0.0303327, 0.8655359, -2.814525, 0, 0.9686275, 1, 1,
-0.02275077, -1.129619, -4.136025, 0, 0.9647059, 1, 1,
-0.01902566, -1.696615, -1.499881, 0, 0.9568627, 1, 1,
-0.01880566, 0.5868394, 0.5555094, 0, 0.9529412, 1, 1,
-0.01724962, 0.8166165, -0.08244567, 0, 0.945098, 1, 1,
-0.01285045, -1.33978, -2.966518, 0, 0.9411765, 1, 1,
-0.008408215, -0.8861712, -1.147626, 0, 0.9333333, 1, 1,
-0.008085622, -0.5190938, -2.547861, 0, 0.9294118, 1, 1,
-0.002115754, -0.4503918, -2.663985, 0, 0.9215686, 1, 1,
-0.0008730007, 2.022534, -0.903103, 0, 0.9176471, 1, 1,
0.003521763, 0.02011492, -0.1326729, 0, 0.9098039, 1, 1,
0.003661719, 1.15399, -0.3517371, 0, 0.9058824, 1, 1,
0.006486381, 0.6507069, 0.9838448, 0, 0.8980392, 1, 1,
0.007106985, -1.421723, 3.654879, 0, 0.8901961, 1, 1,
0.008565289, 0.8342599, -0.8662484, 0, 0.8862745, 1, 1,
0.010763, 0.4431361, 1.13046, 0, 0.8784314, 1, 1,
0.01172216, 0.6452319, -0.6016292, 0, 0.8745098, 1, 1,
0.02015373, 0.2965201, -1.412961, 0, 0.8666667, 1, 1,
0.02244584, 0.06473081, 1.366763, 0, 0.8627451, 1, 1,
0.02374967, -0.3478823, 2.865085, 0, 0.854902, 1, 1,
0.02548145, -1.215653, 3.004815, 0, 0.8509804, 1, 1,
0.02711627, -0.4404491, 2.362127, 0, 0.8431373, 1, 1,
0.03183731, 0.881422, -0.2667652, 0, 0.8392157, 1, 1,
0.03652449, 1.682652, -0.3627995, 0, 0.8313726, 1, 1,
0.03968164, 0.3390417, -0.4101809, 0, 0.827451, 1, 1,
0.04511562, 0.9287815, -0.6409992, 0, 0.8196079, 1, 1,
0.04518007, 0.1341829, 2.295472, 0, 0.8156863, 1, 1,
0.04567282, -0.4410793, 0.2862544, 0, 0.8078431, 1, 1,
0.04805237, -0.3965948, 1.464674, 0, 0.8039216, 1, 1,
0.04826921, -0.5870613, 2.612973, 0, 0.7960784, 1, 1,
0.04948523, -0.4504195, 1.963407, 0, 0.7882353, 1, 1,
0.05051917, 0.5962808, 1.348218, 0, 0.7843137, 1, 1,
0.05641321, 0.01029846, 0.9755904, 0, 0.7764706, 1, 1,
0.05657907, -1.863618, 3.240566, 0, 0.772549, 1, 1,
0.05783736, 1.512869, 0.2946088, 0, 0.7647059, 1, 1,
0.05794423, -1.856735, 3.143858, 0, 0.7607843, 1, 1,
0.05988475, -0.8738462, 2.107466, 0, 0.7529412, 1, 1,
0.0611472, 0.4470942, 1.912401, 0, 0.7490196, 1, 1,
0.06264824, 0.09819034, -0.1718322, 0, 0.7411765, 1, 1,
0.0627071, -1.024982, 1.807199, 0, 0.7372549, 1, 1,
0.06700046, 0.04604039, -1.319056, 0, 0.7294118, 1, 1,
0.06761631, -0.6392807, 1.940624, 0, 0.7254902, 1, 1,
0.06927459, 1.414, 0.5060875, 0, 0.7176471, 1, 1,
0.07369265, 0.2974011, 0.1260327, 0, 0.7137255, 1, 1,
0.08237274, -0.3437418, 2.2463, 0, 0.7058824, 1, 1,
0.08590728, 0.06211862, 1.497984, 0, 0.6980392, 1, 1,
0.08598185, -0.9070945, 3.817797, 0, 0.6941177, 1, 1,
0.09118436, -0.1174582, 1.212894, 0, 0.6862745, 1, 1,
0.09270222, -0.8132052, 4.58412, 0, 0.682353, 1, 1,
0.09792963, -1.912379, 2.519522, 0, 0.6745098, 1, 1,
0.1040048, -0.6380337, 3.895082, 0, 0.6705883, 1, 1,
0.1089895, -0.5922502, 4.196805, 0, 0.6627451, 1, 1,
0.1112022, -0.492464, 3.588474, 0, 0.6588235, 1, 1,
0.1117668, -1.838891, 2.932873, 0, 0.6509804, 1, 1,
0.1151963, 1.634855, 0.218476, 0, 0.6470588, 1, 1,
0.1157269, -0.1981363, 3.694916, 0, 0.6392157, 1, 1,
0.1159408, 0.4331044, 0.1220507, 0, 0.6352941, 1, 1,
0.1266226, -2.40592, 2.363084, 0, 0.627451, 1, 1,
0.1272282, 1.429127, 0.2210946, 0, 0.6235294, 1, 1,
0.1309337, -0.6892828, 3.830442, 0, 0.6156863, 1, 1,
0.1312595, -1.215861, 3.182485, 0, 0.6117647, 1, 1,
0.1350747, 1.41607, 1.275865, 0, 0.6039216, 1, 1,
0.1405116, -1.95076, 3.270291, 0, 0.5960785, 1, 1,
0.1425948, -1.18261, 3.891523, 0, 0.5921569, 1, 1,
0.144513, -1.790276, 2.730331, 0, 0.5843138, 1, 1,
0.1454805, 1.307929, -0.3926013, 0, 0.5803922, 1, 1,
0.1486211, -1.398529, 3.208726, 0, 0.572549, 1, 1,
0.1544736, 1.606061, -0.005452746, 0, 0.5686275, 1, 1,
0.167846, -0.2773097, 0.3901416, 0, 0.5607843, 1, 1,
0.1705087, 1.698987, 0.7581058, 0, 0.5568628, 1, 1,
0.1708109, 0.3811971, 0.4898539, 0, 0.5490196, 1, 1,
0.1719445, -0.5044888, 2.382343, 0, 0.5450981, 1, 1,
0.1735264, -0.3834809, 2.648213, 0, 0.5372549, 1, 1,
0.1737877, 1.363425, -0.3032137, 0, 0.5333334, 1, 1,
0.1749124, -1.697489, 1.309712, 0, 0.5254902, 1, 1,
0.1790745, 1.585202, -0.01876467, 0, 0.5215687, 1, 1,
0.1799262, 0.1240631, 2.853526, 0, 0.5137255, 1, 1,
0.1852716, -0.4492445, 4.320259, 0, 0.509804, 1, 1,
0.1862584, -0.9231489, 4.055509, 0, 0.5019608, 1, 1,
0.188001, 1.004879, 0.5664386, 0, 0.4941176, 1, 1,
0.1906456, -0.9165998, 3.018393, 0, 0.4901961, 1, 1,
0.1913225, -0.3638177, 1.196173, 0, 0.4823529, 1, 1,
0.1963136, -0.4652616, 2.211094, 0, 0.4784314, 1, 1,
0.1989864, -0.1915632, 2.690181, 0, 0.4705882, 1, 1,
0.1997702, -0.3249128, 2.801774, 0, 0.4666667, 1, 1,
0.2095989, 0.06019735, 1.892001, 0, 0.4588235, 1, 1,
0.210673, -1.547839, 4.112832, 0, 0.454902, 1, 1,
0.2113506, -0.8454353, 3.259953, 0, 0.4470588, 1, 1,
0.2165687, 0.5838794, -0.0254401, 0, 0.4431373, 1, 1,
0.2181302, -0.1032402, 3.244105, 0, 0.4352941, 1, 1,
0.2211896, -0.5868154, 4.376346, 0, 0.4313726, 1, 1,
0.230915, -0.9492229, 0.9181613, 0, 0.4235294, 1, 1,
0.2328908, 1.992401, -0.2421459, 0, 0.4196078, 1, 1,
0.2370764, 0.3852768, 0.5463495, 0, 0.4117647, 1, 1,
0.239744, 1.360628, 0.2297852, 0, 0.4078431, 1, 1,
0.2415825, 0.1055465, 0.378802, 0, 0.4, 1, 1,
0.2434702, -0.06270793, 2.746699, 0, 0.3921569, 1, 1,
0.2441981, 0.2231588, 1.123197, 0, 0.3882353, 1, 1,
0.2489179, 1.250996, 1.880931, 0, 0.3803922, 1, 1,
0.2501591, -0.752791, 2.96454, 0, 0.3764706, 1, 1,
0.250583, -0.1872742, 1.3954, 0, 0.3686275, 1, 1,
0.2518305, -1.890358, 1.595192, 0, 0.3647059, 1, 1,
0.2519264, -0.4521438, 2.408643, 0, 0.3568628, 1, 1,
0.2525467, -1.932313, 2.480572, 0, 0.3529412, 1, 1,
0.2576697, 2.407503, -0.7685142, 0, 0.345098, 1, 1,
0.2595553, -0.5463637, 4.352835, 0, 0.3411765, 1, 1,
0.259654, 0.3494613, -0.4095127, 0, 0.3333333, 1, 1,
0.2670746, 0.2906164, 0.4877016, 0, 0.3294118, 1, 1,
0.26837, 0.9400199, 0.05491098, 0, 0.3215686, 1, 1,
0.2693299, 1.702689, -1.362493, 0, 0.3176471, 1, 1,
0.2737887, 0.3830003, 0.1761314, 0, 0.3098039, 1, 1,
0.2822775, -0.02353489, 0.4281075, 0, 0.3058824, 1, 1,
0.2850634, 0.23564, 1.665794, 0, 0.2980392, 1, 1,
0.2859514, -0.2449779, 2.240118, 0, 0.2901961, 1, 1,
0.2863403, 0.4188257, -1.085482, 0, 0.2862745, 1, 1,
0.2868182, 0.7180666, 0.206043, 0, 0.2784314, 1, 1,
0.2880819, -1.11331, 3.540152, 0, 0.2745098, 1, 1,
0.2906379, 0.4653737, -0.1401162, 0, 0.2666667, 1, 1,
0.2951662, -1.19667, 2.575706, 0, 0.2627451, 1, 1,
0.2998414, 0.7302303, -1.5445, 0, 0.254902, 1, 1,
0.3009041, -2.13237, 5.157718, 0, 0.2509804, 1, 1,
0.3029435, -0.5387946, 2.015337, 0, 0.2431373, 1, 1,
0.3034234, 0.2963632, -0.2992613, 0, 0.2392157, 1, 1,
0.3071506, 0.5476459, 1.273495, 0, 0.2313726, 1, 1,
0.3072213, 0.8144124, 1.367286, 0, 0.227451, 1, 1,
0.3080385, 0.03639691, 0.661549, 0, 0.2196078, 1, 1,
0.3107893, 1.719331, 0.35148, 0, 0.2156863, 1, 1,
0.3113061, -1.656426, 3.589653, 0, 0.2078431, 1, 1,
0.313094, -0.04732169, 0.2512343, 0, 0.2039216, 1, 1,
0.316885, -0.4197781, 3.424731, 0, 0.1960784, 1, 1,
0.3253869, -0.5494097, 0.9519256, 0, 0.1882353, 1, 1,
0.3269354, 0.6261817, 1.210912, 0, 0.1843137, 1, 1,
0.3297097, 0.2349216, -0.5397682, 0, 0.1764706, 1, 1,
0.3337037, 1.334041, 1.904559, 0, 0.172549, 1, 1,
0.3338834, -0.4956679, 3.737598, 0, 0.1647059, 1, 1,
0.3359283, -2.070737, 2.01402, 0, 0.1607843, 1, 1,
0.3371879, -0.4923929, 3.367157, 0, 0.1529412, 1, 1,
0.3404463, -0.2473888, 1.699252, 0, 0.1490196, 1, 1,
0.3424405, 0.146667, 1.651144, 0, 0.1411765, 1, 1,
0.3459263, 0.580456, 1.990915, 0, 0.1372549, 1, 1,
0.3470253, -0.2463237, 2.831904, 0, 0.1294118, 1, 1,
0.3489681, -0.8849229, 2.807877, 0, 0.1254902, 1, 1,
0.3589281, 0.2617301, 0.506286, 0, 0.1176471, 1, 1,
0.3627971, 1.090087, 1.097546, 0, 0.1137255, 1, 1,
0.3714922, -0.3531908, 2.591688, 0, 0.1058824, 1, 1,
0.3718769, -0.1644926, -0.4964109, 0, 0.09803922, 1, 1,
0.3726451, -2.414285, 2.292628, 0, 0.09411765, 1, 1,
0.3747876, 0.9336578, 1.577554, 0, 0.08627451, 1, 1,
0.3754521, 0.6320889, 0.06376091, 0, 0.08235294, 1, 1,
0.37718, -0.9163902, 1.981062, 0, 0.07450981, 1, 1,
0.3855541, -0.8683085, 2.737051, 0, 0.07058824, 1, 1,
0.392189, -0.2553082, 2.034541, 0, 0.0627451, 1, 1,
0.3927703, 1.474313, 0.4317651, 0, 0.05882353, 1, 1,
0.3944307, -0.9248019, 2.678607, 0, 0.05098039, 1, 1,
0.3951701, 0.5974118, 0.8049027, 0, 0.04705882, 1, 1,
0.3953109, 0.58746, -0.6968253, 0, 0.03921569, 1, 1,
0.4045947, -0.2356335, 0.3218883, 0, 0.03529412, 1, 1,
0.4064904, 1.618542, 0.1772541, 0, 0.02745098, 1, 1,
0.4086091, -0.2685953, 1.819604, 0, 0.02352941, 1, 1,
0.4095251, -0.3862833, 0.1600009, 0, 0.01568628, 1, 1,
0.4111145, -1.024164, 5.509333, 0, 0.01176471, 1, 1,
0.411773, -0.479993, -0.2339465, 0, 0.003921569, 1, 1,
0.4154674, 0.583991, 0.09894618, 0.003921569, 0, 1, 1,
0.4177469, 0.849212, -1.101086, 0.007843138, 0, 1, 1,
0.4201544, -1.396526, 3.482969, 0.01568628, 0, 1, 1,
0.4236653, 0.9152026, -0.01609591, 0.01960784, 0, 1, 1,
0.424247, -0.1101968, 3.176303, 0.02745098, 0, 1, 1,
0.428088, -0.477697, 4.337441, 0.03137255, 0, 1, 1,
0.4283448, 0.2341068, 1.694437, 0.03921569, 0, 1, 1,
0.4310666, -0.288459, 2.443976, 0.04313726, 0, 1, 1,
0.4320769, 0.3380747, 0.349879, 0.05098039, 0, 1, 1,
0.4367855, -1.004374, 3.738387, 0.05490196, 0, 1, 1,
0.4456079, -1.267054, 2.333635, 0.0627451, 0, 1, 1,
0.4472634, -0.5563868, 2.005448, 0.06666667, 0, 1, 1,
0.4506994, -0.3059106, 1.134635, 0.07450981, 0, 1, 1,
0.4614437, -0.755855, 3.195373, 0.07843138, 0, 1, 1,
0.4618923, 0.7144853, 1.143679, 0.08627451, 0, 1, 1,
0.4623173, 1.663165, -0.2298138, 0.09019608, 0, 1, 1,
0.4644333, 1.006334, 0.9635029, 0.09803922, 0, 1, 1,
0.4664966, 0.8202001, 2.030821, 0.1058824, 0, 1, 1,
0.4668703, -0.7711075, 2.490851, 0.1098039, 0, 1, 1,
0.4712237, -1.054026, 2.840911, 0.1176471, 0, 1, 1,
0.4731541, 0.9999039, 0.3539442, 0.1215686, 0, 1, 1,
0.4746659, 0.2882897, 0.2222289, 0.1294118, 0, 1, 1,
0.4761526, -0.6108171, 3.29641, 0.1333333, 0, 1, 1,
0.4848779, -1.302611, 1.785502, 0.1411765, 0, 1, 1,
0.4860872, 0.3845794, 0.9559779, 0.145098, 0, 1, 1,
0.4881162, 0.7059208, -0.3169764, 0.1529412, 0, 1, 1,
0.4896889, -1.535662, 2.518226, 0.1568628, 0, 1, 1,
0.4917206, -0.4258642, 2.486734, 0.1647059, 0, 1, 1,
0.4937667, -0.3999586, 2.343304, 0.1686275, 0, 1, 1,
0.4938934, -0.8298402, 1.777955, 0.1764706, 0, 1, 1,
0.4973249, -0.2501671, 1.301138, 0.1803922, 0, 1, 1,
0.4986735, 0.310601, 2.037248, 0.1882353, 0, 1, 1,
0.4998305, 1.434457, 2.731696, 0.1921569, 0, 1, 1,
0.5022639, 1.352482, -0.09096438, 0.2, 0, 1, 1,
0.505061, -0.4322079, 2.419147, 0.2078431, 0, 1, 1,
0.5080991, 0.748247, 0.3774672, 0.2117647, 0, 1, 1,
0.508729, -0.9991614, 3.378356, 0.2196078, 0, 1, 1,
0.5093713, 0.1389835, 0.651867, 0.2235294, 0, 1, 1,
0.5117931, 0.5955302, -0.259807, 0.2313726, 0, 1, 1,
0.5133218, 1.150245, -0.3823948, 0.2352941, 0, 1, 1,
0.5163747, 2.127259, 1.618191, 0.2431373, 0, 1, 1,
0.5192387, -0.5216333, 1.742512, 0.2470588, 0, 1, 1,
0.5233259, 0.6422184, 1.40725, 0.254902, 0, 1, 1,
0.5253551, -0.9665606, 2.020738, 0.2588235, 0, 1, 1,
0.5273247, -0.9218214, 3.690578, 0.2666667, 0, 1, 1,
0.530279, -0.5917356, 2.71887, 0.2705882, 0, 1, 1,
0.5315946, 0.3056578, 2.317121, 0.2784314, 0, 1, 1,
0.532671, -1.520295, 2.318235, 0.282353, 0, 1, 1,
0.5444518, -0.7821428, 1.998964, 0.2901961, 0, 1, 1,
0.5477045, 0.8157982, 0.2177818, 0.2941177, 0, 1, 1,
0.5479569, 0.6579567, 0.8290007, 0.3019608, 0, 1, 1,
0.5494751, 0.5322956, 0.592522, 0.3098039, 0, 1, 1,
0.5501897, 0.5129558, 1.438155, 0.3137255, 0, 1, 1,
0.5591658, -0.2833545, 1.679756, 0.3215686, 0, 1, 1,
0.5634564, -0.963879, 3.487188, 0.3254902, 0, 1, 1,
0.5663755, -1.084862, 2.708408, 0.3333333, 0, 1, 1,
0.5672069, 0.1674392, 2.768538, 0.3372549, 0, 1, 1,
0.5710225, -0.3418916, 1.638117, 0.345098, 0, 1, 1,
0.5713075, 1.410785, 0.6780022, 0.3490196, 0, 1, 1,
0.5747653, -0.3751255, 2.222741, 0.3568628, 0, 1, 1,
0.5771641, 0.174015, -0.1718016, 0.3607843, 0, 1, 1,
0.5810996, 0.6611235, -1.090536, 0.3686275, 0, 1, 1,
0.5825405, -0.8800417, 1.333079, 0.372549, 0, 1, 1,
0.5835614, -1.274262, 4.260152, 0.3803922, 0, 1, 1,
0.5889185, -0.1361842, 2.19891, 0.3843137, 0, 1, 1,
0.5893353, -0.8658528, 2.574192, 0.3921569, 0, 1, 1,
0.6078938, 0.01599054, 1.59018, 0.3960784, 0, 1, 1,
0.6083732, -0.0355731, 3.179658, 0.4039216, 0, 1, 1,
0.6140105, -0.4393483, 0.3541473, 0.4117647, 0, 1, 1,
0.614547, 1.706239, 1.628767, 0.4156863, 0, 1, 1,
0.6161909, -1.572688, 1.305375, 0.4235294, 0, 1, 1,
0.6190095, 1.151843, 1.105404, 0.427451, 0, 1, 1,
0.6200367, 1.546029, 0.2167504, 0.4352941, 0, 1, 1,
0.6210369, -0.593876, 2.14711, 0.4392157, 0, 1, 1,
0.6296067, -0.08813301, 1.668235, 0.4470588, 0, 1, 1,
0.6440753, 0.3996699, -0.3750604, 0.4509804, 0, 1, 1,
0.6445503, -2.405826, 3.206084, 0.4588235, 0, 1, 1,
0.644886, -2.107924, 5.048525, 0.4627451, 0, 1, 1,
0.6453307, -1.239868, 4.002772, 0.4705882, 0, 1, 1,
0.6599821, 0.5338366, 0.4710165, 0.4745098, 0, 1, 1,
0.661294, 0.3600208, 1.713195, 0.4823529, 0, 1, 1,
0.6622376, 1.284893, 0.1961558, 0.4862745, 0, 1, 1,
0.6643558, 3.750692, -0.1867215, 0.4941176, 0, 1, 1,
0.6683213, 0.6339336, 0.01427637, 0.5019608, 0, 1, 1,
0.6691486, 0.5964667, 2.467955, 0.5058824, 0, 1, 1,
0.6692507, -1.353485, 3.311771, 0.5137255, 0, 1, 1,
0.6714231, 1.067524, 1.618904, 0.5176471, 0, 1, 1,
0.6737267, 1.395188, -0.05703126, 0.5254902, 0, 1, 1,
0.6742414, -0.09836651, -0.7770253, 0.5294118, 0, 1, 1,
0.6805444, -1.143207, 2.005676, 0.5372549, 0, 1, 1,
0.6808822, -1.077002, 1.654146, 0.5411765, 0, 1, 1,
0.6817232, 1.509519, -1.042625, 0.5490196, 0, 1, 1,
0.6833372, -1.124531, 3.957973, 0.5529412, 0, 1, 1,
0.6880279, 1.417943, -0.5269518, 0.5607843, 0, 1, 1,
0.6956262, 1.822703, 1.141415, 0.5647059, 0, 1, 1,
0.6957308, 0.6646124, 1.45015, 0.572549, 0, 1, 1,
0.7000756, 0.7049131, 2.544159, 0.5764706, 0, 1, 1,
0.7011839, 0.3277176, 1.488168, 0.5843138, 0, 1, 1,
0.7090574, -1.406273, 2.967158, 0.5882353, 0, 1, 1,
0.7091021, 0.3631606, -0.929023, 0.5960785, 0, 1, 1,
0.716024, -0.1117143, 0.09056318, 0.6039216, 0, 1, 1,
0.716956, -1.461111, 1.39184, 0.6078432, 0, 1, 1,
0.7202047, 2.38882, -0.7688473, 0.6156863, 0, 1, 1,
0.7212976, 0.02977251, 2.494277, 0.6196079, 0, 1, 1,
0.7242255, -2.288665, 2.675222, 0.627451, 0, 1, 1,
0.7250325, -1.99296, 2.821888, 0.6313726, 0, 1, 1,
0.7254416, -1.332943, 0.5946826, 0.6392157, 0, 1, 1,
0.7304698, 1.269236, 1.074878, 0.6431373, 0, 1, 1,
0.7330142, -0.5968818, 4.374977, 0.6509804, 0, 1, 1,
0.7338256, -1.594096, 3.953321, 0.654902, 0, 1, 1,
0.7412187, 0.6206776, 1.332485, 0.6627451, 0, 1, 1,
0.7442989, 0.5842009, 1.563147, 0.6666667, 0, 1, 1,
0.7448747, -0.03742024, 0.5403302, 0.6745098, 0, 1, 1,
0.7482514, 0.08435407, 1.380661, 0.6784314, 0, 1, 1,
0.7536539, -0.2993126, 2.837817, 0.6862745, 0, 1, 1,
0.7543369, -0.1964093, 1.066294, 0.6901961, 0, 1, 1,
0.7587784, -0.3949482, 4.086718, 0.6980392, 0, 1, 1,
0.770137, -1.413546, 1.997128, 0.7058824, 0, 1, 1,
0.7739103, 0.6299945, -0.9825402, 0.7098039, 0, 1, 1,
0.7799631, 1.7126, 0.04634627, 0.7176471, 0, 1, 1,
0.7823053, 1.513516, 1.253796, 0.7215686, 0, 1, 1,
0.7857531, -0.1268129, 2.021217, 0.7294118, 0, 1, 1,
0.8046469, 0.7363799, -0.7040084, 0.7333333, 0, 1, 1,
0.816116, 0.2108617, 0.8754728, 0.7411765, 0, 1, 1,
0.8162904, 0.6306373, 1.062907, 0.7450981, 0, 1, 1,
0.8259721, 1.874822, 0.5891387, 0.7529412, 0, 1, 1,
0.8314267, -0.3421946, 0.9162802, 0.7568628, 0, 1, 1,
0.8340215, -0.3960573, 0.6277177, 0.7647059, 0, 1, 1,
0.8375091, 2.446712, 0.1207327, 0.7686275, 0, 1, 1,
0.8406366, 0.4139771, 1.521049, 0.7764706, 0, 1, 1,
0.8406748, 0.896299, -0.6287646, 0.7803922, 0, 1, 1,
0.8424332, -0.1269258, 2.179599, 0.7882353, 0, 1, 1,
0.847791, -0.8627197, 2.501, 0.7921569, 0, 1, 1,
0.8515067, 0.5801111, -1.503809, 0.8, 0, 1, 1,
0.8606819, 0.3088496, 4.21043, 0.8078431, 0, 1, 1,
0.8689632, -1.044069, 3.561704, 0.8117647, 0, 1, 1,
0.8767735, 0.2506105, 0.4711675, 0.8196079, 0, 1, 1,
0.8814012, -0.8091636, 1.759612, 0.8235294, 0, 1, 1,
0.882359, 0.3909258, 2.175226, 0.8313726, 0, 1, 1,
0.8850449, -1.438229, 2.692116, 0.8352941, 0, 1, 1,
0.8858669, -1.810442, 2.394617, 0.8431373, 0, 1, 1,
0.886699, -0.3609832, 3.293904, 0.8470588, 0, 1, 1,
0.8878493, 0.1302265, 2.547, 0.854902, 0, 1, 1,
0.8934509, 0.1218441, 1.407872, 0.8588235, 0, 1, 1,
0.898779, 0.3707192, 0.9045256, 0.8666667, 0, 1, 1,
0.9038352, 1.302298, 1.623924, 0.8705882, 0, 1, 1,
0.9108426, -0.05319325, 1.601222, 0.8784314, 0, 1, 1,
0.9124202, -1.927706, 2.328071, 0.8823529, 0, 1, 1,
0.9261935, 1.530294, -0.1687272, 0.8901961, 0, 1, 1,
0.9286481, 0.007050535, 1.897211, 0.8941177, 0, 1, 1,
0.9290721, 1.340181, 0.8542537, 0.9019608, 0, 1, 1,
0.9290875, 0.03799167, 0.4453245, 0.9098039, 0, 1, 1,
0.934623, 0.2410054, 0.0476507, 0.9137255, 0, 1, 1,
0.9368548, -0.8745189, 3.203938, 0.9215686, 0, 1, 1,
0.9473314, 0.5657263, 4.08795, 0.9254902, 0, 1, 1,
0.9526511, -0.8450035, 0.2764061, 0.9333333, 0, 1, 1,
0.9576967, 0.5417886, 1.45877, 0.9372549, 0, 1, 1,
0.9577039, 0.3250492, 2.073261, 0.945098, 0, 1, 1,
0.9585171, 1.75034, -0.1537492, 0.9490196, 0, 1, 1,
0.9594336, -0.3668987, 2.85796, 0.9568627, 0, 1, 1,
0.9595638, -1.02958, 4.759398, 0.9607843, 0, 1, 1,
0.9673783, 1.493756, 0.8134299, 0.9686275, 0, 1, 1,
0.971804, -0.4597562, 2.506489, 0.972549, 0, 1, 1,
0.9723397, -0.9120327, 2.270847, 0.9803922, 0, 1, 1,
0.9725953, -0.3483965, 2.017257, 0.9843137, 0, 1, 1,
0.9751778, -0.6152173, 3.161172, 0.9921569, 0, 1, 1,
0.9762142, 0.5464025, 1.388765, 0.9960784, 0, 1, 1,
0.9763638, -0.5396467, 1.695502, 1, 0, 0.9960784, 1,
0.9790576, -0.8806502, 3.4191, 1, 0, 0.9882353, 1,
0.9848913, -2.135879, 2.443416, 1, 0, 0.9843137, 1,
0.9907142, -0.9071139, 2.11709, 1, 0, 0.9764706, 1,
0.9949384, -1.606229, 3.581675, 1, 0, 0.972549, 1,
0.9995092, -1.0578, 4.034613, 1, 0, 0.9647059, 1,
1.001689, -1.057528, 3.012884, 1, 0, 0.9607843, 1,
1.009976, -0.5809953, 1.059637, 1, 0, 0.9529412, 1,
1.01173, -1.892066, 3.697673, 1, 0, 0.9490196, 1,
1.011985, 1.352619, 1.63538, 1, 0, 0.9411765, 1,
1.017343, -0.1956787, 1.138338, 1, 0, 0.9372549, 1,
1.02371, -0.1953932, 0.3499382, 1, 0, 0.9294118, 1,
1.029224, 1.891074, -0.4827346, 1, 0, 0.9254902, 1,
1.045848, -0.715767, 3.52088, 1, 0, 0.9176471, 1,
1.047492, -0.5794351, 1.988921, 1, 0, 0.9137255, 1,
1.047741, 0.906849, 0.6513978, 1, 0, 0.9058824, 1,
1.04972, 0.8537465, 0.1035308, 1, 0, 0.9019608, 1,
1.053345, -0.7182679, 0.577042, 1, 0, 0.8941177, 1,
1.053484, 1.568349, -0.4265517, 1, 0, 0.8862745, 1,
1.053593, 0.7606832, 2.304953, 1, 0, 0.8823529, 1,
1.055299, 0.04184528, 2.562281, 1, 0, 0.8745098, 1,
1.055834, -2.410151, 2.688732, 1, 0, 0.8705882, 1,
1.056476, 1.090924, -1.035967, 1, 0, 0.8627451, 1,
1.058549, 0.6427798, 2.125892, 1, 0, 0.8588235, 1,
1.064268, -0.221379, 1.351527, 1, 0, 0.8509804, 1,
1.066669, 0.05451335, 2.560269, 1, 0, 0.8470588, 1,
1.072178, -0.8490217, 3.266512, 1, 0, 0.8392157, 1,
1.075288, -0.1184108, 0.3302549, 1, 0, 0.8352941, 1,
1.08514, 0.6615433, 1.837485, 1, 0, 0.827451, 1,
1.085843, 1.958982, 1.238429, 1, 0, 0.8235294, 1,
1.096393, 1.51412, 1.021931, 1, 0, 0.8156863, 1,
1.100253, -0.8214569, 3.025599, 1, 0, 0.8117647, 1,
1.100354, 1.320505, 1.048217, 1, 0, 0.8039216, 1,
1.106599, 0.359598, 1.037551, 1, 0, 0.7960784, 1,
1.109397, 1.421562, 0.02267706, 1, 0, 0.7921569, 1,
1.113855, -0.7936729, 2.490639, 1, 0, 0.7843137, 1,
1.122787, -0.9634386, 2.161123, 1, 0, 0.7803922, 1,
1.127738, -0.04479826, 1.476593, 1, 0, 0.772549, 1,
1.131039, 0.3640318, 1.38312, 1, 0, 0.7686275, 1,
1.135192, -0.2211065, 3.340383, 1, 0, 0.7607843, 1,
1.1391, -0.3753864, 2.724218, 1, 0, 0.7568628, 1,
1.145639, -1.340675, 0.3364531, 1, 0, 0.7490196, 1,
1.146641, 0.1360942, 1.225233, 1, 0, 0.7450981, 1,
1.14993, 0.8711613, 1.384562, 1, 0, 0.7372549, 1,
1.159761, -1.61911, 2.165563, 1, 0, 0.7333333, 1,
1.161441, 1.145767, 0.7311173, 1, 0, 0.7254902, 1,
1.164743, 0.9520682, 2.644741, 1, 0, 0.7215686, 1,
1.167742, -0.7318931, 1.661281, 1, 0, 0.7137255, 1,
1.169232, -0.1947523, 3.217915, 1, 0, 0.7098039, 1,
1.175472, -0.526577, 2.58598, 1, 0, 0.7019608, 1,
1.17881, 2.15973, -1.16542, 1, 0, 0.6941177, 1,
1.181303, -0.476407, 1.054259, 1, 0, 0.6901961, 1,
1.181956, -0.695492, 1.341471, 1, 0, 0.682353, 1,
1.186807, -1.972667, 4.077889, 1, 0, 0.6784314, 1,
1.187933, -1.628145, 3.319484, 1, 0, 0.6705883, 1,
1.189051, 1.349359, 0.5474972, 1, 0, 0.6666667, 1,
1.194552, -2.047279, 2.87364, 1, 0, 0.6588235, 1,
1.194745, -0.03722927, 0.02270935, 1, 0, 0.654902, 1,
1.197106, 0.8271423, 2.021099, 1, 0, 0.6470588, 1,
1.20023, 0.1136456, 2.900784, 1, 0, 0.6431373, 1,
1.205204, -1.383172, 0.2907642, 1, 0, 0.6352941, 1,
1.217618, -1.533752, 2.900266, 1, 0, 0.6313726, 1,
1.223691, -0.66975, 1.337295, 1, 0, 0.6235294, 1,
1.226602, -0.2091616, 1.571479, 1, 0, 0.6196079, 1,
1.229153, -1.198596, 3.807365, 1, 0, 0.6117647, 1,
1.233509, -1.627452, 2.052892, 1, 0, 0.6078432, 1,
1.260735, 0.6388153, 0.9199702, 1, 0, 0.6, 1,
1.277908, -1.010029, 2.893466, 1, 0, 0.5921569, 1,
1.280262, 0.3812106, 0.5769146, 1, 0, 0.5882353, 1,
1.288386, -0.2363562, 1.246847, 1, 0, 0.5803922, 1,
1.290704, -1.720399, 2.773193, 1, 0, 0.5764706, 1,
1.291433, -1.522921, 2.501498, 1, 0, 0.5686275, 1,
1.292925, -0.6126915, 2.545995, 1, 0, 0.5647059, 1,
1.300085, 0.9592097, 0.3545121, 1, 0, 0.5568628, 1,
1.301655, 1.179613, 2.277123, 1, 0, 0.5529412, 1,
1.309097, -0.9594866, 2.114685, 1, 0, 0.5450981, 1,
1.320417, 0.3787976, 1.72321, 1, 0, 0.5411765, 1,
1.322227, -0.3121946, 2.070957, 1, 0, 0.5333334, 1,
1.332615, 1.70383, -0.7720336, 1, 0, 0.5294118, 1,
1.333672, -0.61147, 2.850303, 1, 0, 0.5215687, 1,
1.346115, 0.2864704, 1.17163, 1, 0, 0.5176471, 1,
1.35032, 0.4069985, 1.951684, 1, 0, 0.509804, 1,
1.355639, -0.8984371, 2.122655, 1, 0, 0.5058824, 1,
1.365145, 0.7457708, 0.9603947, 1, 0, 0.4980392, 1,
1.366175, 0.3120964, 2.002544, 1, 0, 0.4901961, 1,
1.36811, 1.239132, -0.3983728, 1, 0, 0.4862745, 1,
1.370995, -0.1617323, 1.143434, 1, 0, 0.4784314, 1,
1.371275, -0.8309911, 1.613674, 1, 0, 0.4745098, 1,
1.384687, -0.6433854, 2.987566, 1, 0, 0.4666667, 1,
1.385619, 0.9557017, -1.32917, 1, 0, 0.4627451, 1,
1.394907, -1.451504, 2.209326, 1, 0, 0.454902, 1,
1.394965, -0.3728667, 2.33847, 1, 0, 0.4509804, 1,
1.402059, 0.435859, 2.37702, 1, 0, 0.4431373, 1,
1.403727, 0.2924505, 0.4880091, 1, 0, 0.4392157, 1,
1.405571, 0.2032457, 0.9632858, 1, 0, 0.4313726, 1,
1.411143, 1.106064, 1.508471, 1, 0, 0.427451, 1,
1.414169, 0.1823792, 0.9075552, 1, 0, 0.4196078, 1,
1.433375, 0.5015414, 3.337399, 1, 0, 0.4156863, 1,
1.43506, -0.7159677, 2.91837, 1, 0, 0.4078431, 1,
1.436702, 0.3215894, -0.4498559, 1, 0, 0.4039216, 1,
1.444445, -0.7095343, 1.728542, 1, 0, 0.3960784, 1,
1.451228, -0.08465414, 0.8792829, 1, 0, 0.3882353, 1,
1.455739, -0.2690935, 1.238095, 1, 0, 0.3843137, 1,
1.456518, 0.424994, 1.616374, 1, 0, 0.3764706, 1,
1.460038, -0.053728, 1.050361, 1, 0, 0.372549, 1,
1.465061, 0.4418488, 3.434537, 1, 0, 0.3647059, 1,
1.473781, 0.5440234, -0.3117006, 1, 0, 0.3607843, 1,
1.487216, -1.18673, 2.471991, 1, 0, 0.3529412, 1,
1.542651, 0.081021, 1.04147, 1, 0, 0.3490196, 1,
1.550447, -0.8472275, 1.219416, 1, 0, 0.3411765, 1,
1.560055, 0.2296782, 1.26911, 1, 0, 0.3372549, 1,
1.576411, 2.160473, 2.155479, 1, 0, 0.3294118, 1,
1.576692, 1.109845, -0.6736832, 1, 0, 0.3254902, 1,
1.619872, -0.1251142, -1.03866, 1, 0, 0.3176471, 1,
1.624677, 0.2239891, 1.238507, 1, 0, 0.3137255, 1,
1.637871, 0.1975885, 1.92964, 1, 0, 0.3058824, 1,
1.641759, 0.6312675, 0.2690728, 1, 0, 0.2980392, 1,
1.64244, -0.8474084, 3.196488, 1, 0, 0.2941177, 1,
1.647339, 0.5851402, -2.043786, 1, 0, 0.2862745, 1,
1.662864, -0.2362696, 2.331905, 1, 0, 0.282353, 1,
1.676092, -1.947928, 3.002094, 1, 0, 0.2745098, 1,
1.677158, 0.07304935, 2.224047, 1, 0, 0.2705882, 1,
1.713545, -0.2621337, 1.653984, 1, 0, 0.2627451, 1,
1.755699, -0.5603582, 2.412432, 1, 0, 0.2588235, 1,
1.767998, 1.059561, 0.9696984, 1, 0, 0.2509804, 1,
1.786828, -0.687901, 3.506314, 1, 0, 0.2470588, 1,
1.798582, 0.4243616, 1.185666, 1, 0, 0.2392157, 1,
1.802158, -0.1837367, 1.63216, 1, 0, 0.2352941, 1,
1.8129, 0.7522852, 3.148211, 1, 0, 0.227451, 1,
1.835084, -1.284865, 1.456694, 1, 0, 0.2235294, 1,
1.835402, -0.4376275, 2.149406, 1, 0, 0.2156863, 1,
1.908627, -0.8072951, 1.815617, 1, 0, 0.2117647, 1,
1.918675, 1.69755, 0.6831387, 1, 0, 0.2039216, 1,
1.947503, 0.576462, -0.8257384, 1, 0, 0.1960784, 1,
1.95307, 0.3268608, 0.9498292, 1, 0, 0.1921569, 1,
1.988783, 0.6201991, 1.036184, 1, 0, 0.1843137, 1,
2.022579, 0.134782, 1.464408, 1, 0, 0.1803922, 1,
2.025778, -0.1526877, 0.7569447, 1, 0, 0.172549, 1,
2.028801, -0.2924125, 1.224945, 1, 0, 0.1686275, 1,
2.04024, 1.230243, 2.224079, 1, 0, 0.1607843, 1,
2.066371, 0.3942997, 0.9086275, 1, 0, 0.1568628, 1,
2.067343, -0.5313702, 0.8944095, 1, 0, 0.1490196, 1,
2.079405, -0.1347788, 3.075037, 1, 0, 0.145098, 1,
2.081481, 0.5331482, 3.066286, 1, 0, 0.1372549, 1,
2.087185, -0.1974947, 1.087893, 1, 0, 0.1333333, 1,
2.094052, 1.417641, 2.109257, 1, 0, 0.1254902, 1,
2.137048, 1.249771, 0.9119082, 1, 0, 0.1215686, 1,
2.137802, -1.108231, 2.779094, 1, 0, 0.1137255, 1,
2.13884, 0.5555691, 1.189641, 1, 0, 0.1098039, 1,
2.168826, 1.650958, 1.718683, 1, 0, 0.1019608, 1,
2.208939, -0.7643813, 1.845149, 1, 0, 0.09411765, 1,
2.225902, 0.3371855, 2.057137, 1, 0, 0.09019608, 1,
2.241205, 0.5430632, 0.9651977, 1, 0, 0.08235294, 1,
2.284337, -1.219794, 2.570031, 1, 0, 0.07843138, 1,
2.314821, 1.425129, 1.319469, 1, 0, 0.07058824, 1,
2.345752, 3.164449, 0.3707452, 1, 0, 0.06666667, 1,
2.353777, 1.508246, 1.827988, 1, 0, 0.05882353, 1,
2.406256, -1.56939, 2.285917, 1, 0, 0.05490196, 1,
2.422795, 2.70416, 1.682816, 1, 0, 0.04705882, 1,
2.425906, -0.2968667, 1.169159, 1, 0, 0.04313726, 1,
2.446009, 0.04480765, 1.975919, 1, 0, 0.03529412, 1,
2.469425, -0.6768826, 1.512648, 1, 0, 0.03137255, 1,
2.494645, -0.4319487, 0.5618163, 1, 0, 0.02352941, 1,
2.571487, 0.8869505, 0.2008712, 1, 0, 0.01960784, 1,
2.623919, -0.9776163, 2.492131, 1, 0, 0.01176471, 1,
2.6977, 0.0323094, 0.3425376, 1, 0, 0.007843138, 1
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
-0.4149655, -4.542979, -7.563248, 0, -0.5, 0.5, 0.5,
-0.4149655, -4.542979, -7.563248, 1, -0.5, 0.5, 0.5,
-0.4149655, -4.542979, -7.563248, 1, 1.5, 0.5, 0.5,
-0.4149655, -4.542979, -7.563248, 0, 1.5, 0.5, 0.5
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
-4.582824, 0.204873, -7.563248, 0, -0.5, 0.5, 0.5,
-4.582824, 0.204873, -7.563248, 1, -0.5, 0.5, 0.5,
-4.582824, 0.204873, -7.563248, 1, 1.5, 0.5, 0.5,
-4.582824, 0.204873, -7.563248, 0, 1.5, 0.5, 0.5
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
-4.582824, -4.542979, -0.07962847, 0, -0.5, 0.5, 0.5,
-4.582824, -4.542979, -0.07962847, 1, -0.5, 0.5, 0.5,
-4.582824, -4.542979, -0.07962847, 1, 1.5, 0.5, 0.5,
-4.582824, -4.542979, -0.07962847, 0, 1.5, 0.5, 0.5
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
-3, -3.44732, -5.836259,
2, -3.44732, -5.836259,
-3, -3.44732, -5.836259,
-3, -3.62993, -6.124091,
-2, -3.44732, -5.836259,
-2, -3.62993, -6.124091,
-1, -3.44732, -5.836259,
-1, -3.62993, -6.124091,
0, -3.44732, -5.836259,
0, -3.62993, -6.124091,
1, -3.44732, -5.836259,
1, -3.62993, -6.124091,
2, -3.44732, -5.836259,
2, -3.62993, -6.124091
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
-3, -3.99515, -6.699753, 0, -0.5, 0.5, 0.5,
-3, -3.99515, -6.699753, 1, -0.5, 0.5, 0.5,
-3, -3.99515, -6.699753, 1, 1.5, 0.5, 0.5,
-3, -3.99515, -6.699753, 0, 1.5, 0.5, 0.5,
-2, -3.99515, -6.699753, 0, -0.5, 0.5, 0.5,
-2, -3.99515, -6.699753, 1, -0.5, 0.5, 0.5,
-2, -3.99515, -6.699753, 1, 1.5, 0.5, 0.5,
-2, -3.99515, -6.699753, 0, 1.5, 0.5, 0.5,
-1, -3.99515, -6.699753, 0, -0.5, 0.5, 0.5,
-1, -3.99515, -6.699753, 1, -0.5, 0.5, 0.5,
-1, -3.99515, -6.699753, 1, 1.5, 0.5, 0.5,
-1, -3.99515, -6.699753, 0, 1.5, 0.5, 0.5,
0, -3.99515, -6.699753, 0, -0.5, 0.5, 0.5,
0, -3.99515, -6.699753, 1, -0.5, 0.5, 0.5,
0, -3.99515, -6.699753, 1, 1.5, 0.5, 0.5,
0, -3.99515, -6.699753, 0, 1.5, 0.5, 0.5,
1, -3.99515, -6.699753, 0, -0.5, 0.5, 0.5,
1, -3.99515, -6.699753, 1, -0.5, 0.5, 0.5,
1, -3.99515, -6.699753, 1, 1.5, 0.5, 0.5,
1, -3.99515, -6.699753, 0, 1.5, 0.5, 0.5,
2, -3.99515, -6.699753, 0, -0.5, 0.5, 0.5,
2, -3.99515, -6.699753, 1, -0.5, 0.5, 0.5,
2, -3.99515, -6.699753, 1, 1.5, 0.5, 0.5,
2, -3.99515, -6.699753, 0, 1.5, 0.5, 0.5
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
-3.621011, -2, -5.836259,
-3.621011, 2, -5.836259,
-3.621011, -2, -5.836259,
-3.781313, -2, -6.124091,
-3.621011, 0, -5.836259,
-3.781313, 0, -6.124091,
-3.621011, 2, -5.836259,
-3.781313, 2, -6.124091
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
-4.101917, -2, -6.699753, 0, -0.5, 0.5, 0.5,
-4.101917, -2, -6.699753, 1, -0.5, 0.5, 0.5,
-4.101917, -2, -6.699753, 1, 1.5, 0.5, 0.5,
-4.101917, -2, -6.699753, 0, 1.5, 0.5, 0.5,
-4.101917, 0, -6.699753, 0, -0.5, 0.5, 0.5,
-4.101917, 0, -6.699753, 1, -0.5, 0.5, 0.5,
-4.101917, 0, -6.699753, 1, 1.5, 0.5, 0.5,
-4.101917, 0, -6.699753, 0, 1.5, 0.5, 0.5,
-4.101917, 2, -6.699753, 0, -0.5, 0.5, 0.5,
-4.101917, 2, -6.699753, 1, -0.5, 0.5, 0.5,
-4.101917, 2, -6.699753, 1, 1.5, 0.5, 0.5,
-4.101917, 2, -6.699753, 0, 1.5, 0.5, 0.5
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
-3.621011, -3.44732, -4,
-3.621011, -3.44732, 4,
-3.621011, -3.44732, -4,
-3.781313, -3.62993, -4,
-3.621011, -3.44732, -2,
-3.781313, -3.62993, -2,
-3.621011, -3.44732, 0,
-3.781313, -3.62993, 0,
-3.621011, -3.44732, 2,
-3.781313, -3.62993, 2,
-3.621011, -3.44732, 4,
-3.781313, -3.62993, 4
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
-4.101917, -3.99515, -4, 0, -0.5, 0.5, 0.5,
-4.101917, -3.99515, -4, 1, -0.5, 0.5, 0.5,
-4.101917, -3.99515, -4, 1, 1.5, 0.5, 0.5,
-4.101917, -3.99515, -4, 0, 1.5, 0.5, 0.5,
-4.101917, -3.99515, -2, 0, -0.5, 0.5, 0.5,
-4.101917, -3.99515, -2, 1, -0.5, 0.5, 0.5,
-4.101917, -3.99515, -2, 1, 1.5, 0.5, 0.5,
-4.101917, -3.99515, -2, 0, 1.5, 0.5, 0.5,
-4.101917, -3.99515, 0, 0, -0.5, 0.5, 0.5,
-4.101917, -3.99515, 0, 1, -0.5, 0.5, 0.5,
-4.101917, -3.99515, 0, 1, 1.5, 0.5, 0.5,
-4.101917, -3.99515, 0, 0, 1.5, 0.5, 0.5,
-4.101917, -3.99515, 2, 0, -0.5, 0.5, 0.5,
-4.101917, -3.99515, 2, 1, -0.5, 0.5, 0.5,
-4.101917, -3.99515, 2, 1, 1.5, 0.5, 0.5,
-4.101917, -3.99515, 2, 0, 1.5, 0.5, 0.5,
-4.101917, -3.99515, 4, 0, -0.5, 0.5, 0.5,
-4.101917, -3.99515, 4, 1, -0.5, 0.5, 0.5,
-4.101917, -3.99515, 4, 1, 1.5, 0.5, 0.5,
-4.101917, -3.99515, 4, 0, 1.5, 0.5, 0.5
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
-3.621011, -3.44732, -5.836259,
-3.621011, 3.857066, -5.836259,
-3.621011, -3.44732, 5.677002,
-3.621011, 3.857066, 5.677002,
-3.621011, -3.44732, -5.836259,
-3.621011, -3.44732, 5.677002,
-3.621011, 3.857066, -5.836259,
-3.621011, 3.857066, 5.677002,
-3.621011, -3.44732, -5.836259,
2.79108, -3.44732, -5.836259,
-3.621011, -3.44732, 5.677002,
2.79108, -3.44732, 5.677002,
-3.621011, 3.857066, -5.836259,
2.79108, 3.857066, -5.836259,
-3.621011, 3.857066, 5.677002,
2.79108, 3.857066, 5.677002,
2.79108, -3.44732, -5.836259,
2.79108, 3.857066, -5.836259,
2.79108, -3.44732, 5.677002,
2.79108, 3.857066, 5.677002,
2.79108, -3.44732, -5.836259,
2.79108, -3.44732, 5.677002,
2.79108, 3.857066, -5.836259,
2.79108, 3.857066, 5.677002
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
var radius = 8.045657;
var distance = 35.79603;
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
mvMatrix.translate( 0.4149655, -0.204873, 0.07962847 );
mvMatrix.scale( 1.356675, 1.190945, 0.7555741 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.79603);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
acifluorfen<-read.table("acifluorfen.xyz")
```

```
## Error in read.table("acifluorfen.xyz"): no lines available in input
```

```r
x<-acifluorfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'acifluorfen' not found
```

```r
y<-acifluorfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'acifluorfen' not found
```

```r
z<-acifluorfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'acifluorfen' not found
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
-3.527631, 2.06437, 0.7455693, 0, 0, 1, 1, 1,
-3.051126, 1.639353, -2.251485, 1, 0, 0, 1, 1,
-2.97033, -0.9874327, -2.796114, 1, 0, 0, 1, 1,
-2.748209, 0.8171715, -2.687258, 1, 0, 0, 1, 1,
-2.729887, 0.4483447, 2.412677, 1, 0, 0, 1, 1,
-2.726728, -0.7116266, -3.062886, 1, 0, 0, 1, 1,
-2.651264, 0.5202218, -0.6630878, 0, 0, 0, 1, 1,
-2.607037, -0.939576, -1.665141, 0, 0, 0, 1, 1,
-2.597217, -0.5874197, -2.115803, 0, 0, 0, 1, 1,
-2.592338, 0.990675, -1.599227, 0, 0, 0, 1, 1,
-2.568686, 1.340469, 0.4928011, 0, 0, 0, 1, 1,
-2.521516, 0.8915297, -0.1375094, 0, 0, 0, 1, 1,
-2.498358, 0.08118509, -1.090436, 0, 0, 0, 1, 1,
-2.439849, 1.106584, 0.1312024, 1, 1, 1, 1, 1,
-2.334249, 0.8253697, -0.2640091, 1, 1, 1, 1, 1,
-2.313794, -0.2865857, -0.8762897, 1, 1, 1, 1, 1,
-2.262156, -0.02136431, -2.535468, 1, 1, 1, 1, 1,
-2.256591, 1.09053, -0.1871242, 1, 1, 1, 1, 1,
-2.217911, 0.600632, -2.412018, 1, 1, 1, 1, 1,
-2.081036, 0.06682808, -2.375566, 1, 1, 1, 1, 1,
-2.072587, 1.584485, -0.913725, 1, 1, 1, 1, 1,
-2.068539, -1.148248, -0.436453, 1, 1, 1, 1, 1,
-2.05579, 0.8043467, -0.2846996, 1, 1, 1, 1, 1,
-2.046307, -1.035945, -3.521768, 1, 1, 1, 1, 1,
-2.013037, -0.455637, -1.012076, 1, 1, 1, 1, 1,
-1.999073, 0.6920516, -1.107815, 1, 1, 1, 1, 1,
-1.989626, 0.6820205, -1.661085, 1, 1, 1, 1, 1,
-1.988516, 0.5787224, -0.8143941, 1, 1, 1, 1, 1,
-1.983242, 1.167232, -1.497326, 0, 0, 1, 1, 1,
-1.965051, -0.286179, -2.909395, 1, 0, 0, 1, 1,
-1.940495, -0.5032043, -0.9658545, 1, 0, 0, 1, 1,
-1.93632, 0.0659171, -2.290833, 1, 0, 0, 1, 1,
-1.928983, 1.322735, -2.297508, 1, 0, 0, 1, 1,
-1.91439, -0.9011964, -2.62195, 1, 0, 0, 1, 1,
-1.912615, -0.2920693, -2.60037, 0, 0, 0, 1, 1,
-1.87185, 1.026171, -2.434301, 0, 0, 0, 1, 1,
-1.855302, 0.6773034, -1.376397, 0, 0, 0, 1, 1,
-1.853325, -2.938532, -4.520586, 0, 0, 0, 1, 1,
-1.829912, 1.456593, -0.1724956, 0, 0, 0, 1, 1,
-1.817982, -0.2879815, -3.045009, 0, 0, 0, 1, 1,
-1.814517, -0.8817469, -0.626569, 0, 0, 0, 1, 1,
-1.797751, -0.1494045, -3.132714, 1, 1, 1, 1, 1,
-1.787473, 0.5781356, 1.32574, 1, 1, 1, 1, 1,
-1.777227, -1.394539, -3.006594, 1, 1, 1, 1, 1,
-1.772814, 0.4452854, -0.4225902, 1, 1, 1, 1, 1,
-1.769165, -1.114273, -2.257529, 1, 1, 1, 1, 1,
-1.769154, -0.8942019, -0.8476503, 1, 1, 1, 1, 1,
-1.769012, 1.902012, 0.3933575, 1, 1, 1, 1, 1,
-1.766122, -1.052144, -2.710613, 1, 1, 1, 1, 1,
-1.764564, 1.245417, -2.607547, 1, 1, 1, 1, 1,
-1.758268, 1.11925, 1.057623, 1, 1, 1, 1, 1,
-1.753351, 2.369927, -0.08570667, 1, 1, 1, 1, 1,
-1.749615, -0.7079104, -2.283504, 1, 1, 1, 1, 1,
-1.744254, 0.007660745, -1.139597, 1, 1, 1, 1, 1,
-1.732662, -0.4729498, -0.313912, 1, 1, 1, 1, 1,
-1.730732, -0.6149811, -2.069109, 1, 1, 1, 1, 1,
-1.718546, 0.8265737, -1.144713, 0, 0, 1, 1, 1,
-1.716885, -0.4808463, -1.132236, 1, 0, 0, 1, 1,
-1.700831, -0.5040781, -1.597046, 1, 0, 0, 1, 1,
-1.68509, -0.2026922, 0.3028072, 1, 0, 0, 1, 1,
-1.682871, 0.7047688, -2.017377, 1, 0, 0, 1, 1,
-1.675168, -0.00430644, -1.867266, 1, 0, 0, 1, 1,
-1.660175, 0.9006527, -0.5162923, 0, 0, 0, 1, 1,
-1.646537, -0.3893299, -1.731811, 0, 0, 0, 1, 1,
-1.642939, 0.3714274, -1.02017, 0, 0, 0, 1, 1,
-1.637007, 0.5984932, -0.2621711, 0, 0, 0, 1, 1,
-1.622368, -0.03281233, -0.4565279, 0, 0, 0, 1, 1,
-1.618945, 0.02122545, -2.849031, 0, 0, 0, 1, 1,
-1.587243, -0.7341692, -0.3190446, 0, 0, 0, 1, 1,
-1.576882, 0.1344593, 0.1754654, 1, 1, 1, 1, 1,
-1.576316, 0.7209873, 0.168642, 1, 1, 1, 1, 1,
-1.572196, 0.7857813, 0.505443, 1, 1, 1, 1, 1,
-1.569215, -0.5135038, -1.714159, 1, 1, 1, 1, 1,
-1.556863, 0.3654298, -3.442028, 1, 1, 1, 1, 1,
-1.552932, -0.7681133, -3.056678, 1, 1, 1, 1, 1,
-1.548655, -0.6235585, -0.4428135, 1, 1, 1, 1, 1,
-1.548293, 1.311647, -0.724563, 1, 1, 1, 1, 1,
-1.537695, 0.8659056, 0.2628372, 1, 1, 1, 1, 1,
-1.516914, 0.7832791, -0.6813757, 1, 1, 1, 1, 1,
-1.514619, 0.9696165, -0.541967, 1, 1, 1, 1, 1,
-1.513852, 0.6519845, -0.9135966, 1, 1, 1, 1, 1,
-1.500873, -1.811778, -3.224725, 1, 1, 1, 1, 1,
-1.499758, 1.953989, -1.299783, 1, 1, 1, 1, 1,
-1.494646, 0.04692237, 0.6836298, 1, 1, 1, 1, 1,
-1.491939, -0.0894569, -0.6166208, 0, 0, 1, 1, 1,
-1.490888, -0.6972597, -2.976345, 1, 0, 0, 1, 1,
-1.483443, -0.2190171, -2.930347, 1, 0, 0, 1, 1,
-1.480836, 1.653669, -0.2925251, 1, 0, 0, 1, 1,
-1.476474, -0.6691374, -4.792888, 1, 0, 0, 1, 1,
-1.472305, -0.4959095, -1.260684, 1, 0, 0, 1, 1,
-1.467281, 0.5363789, -1.277711, 0, 0, 0, 1, 1,
-1.456383, 0.5104225, -1.185105, 0, 0, 0, 1, 1,
-1.454611, 0.375845, -2.1412, 0, 0, 0, 1, 1,
-1.450317, 1.545309, -1.040329, 0, 0, 0, 1, 1,
-1.431169, -2.020919, -1.237029, 0, 0, 0, 1, 1,
-1.402622, -0.9900382, -3.102779, 0, 0, 0, 1, 1,
-1.401231, -1.115183, -3.636971, 0, 0, 0, 1, 1,
-1.393901, -0.7816674, -1.626665, 1, 1, 1, 1, 1,
-1.385975, -0.5371977, -0.4194944, 1, 1, 1, 1, 1,
-1.379666, 0.1569271, -1.307491, 1, 1, 1, 1, 1,
-1.377558, 0.9010739, 0.2063785, 1, 1, 1, 1, 1,
-1.372641, 0.3133399, -1.06109, 1, 1, 1, 1, 1,
-1.37026, 1.397256, -1.558688, 1, 1, 1, 1, 1,
-1.357342, 0.9520701, -0.7859517, 1, 1, 1, 1, 1,
-1.34611, 0.2483914, -2.348644, 1, 1, 1, 1, 1,
-1.345614, 0.4217832, -0.2312286, 1, 1, 1, 1, 1,
-1.339324, 0.2138709, -1.263571, 1, 1, 1, 1, 1,
-1.337652, -0.1268641, -2.038832, 1, 1, 1, 1, 1,
-1.330927, -0.8635222, -1.624062, 1, 1, 1, 1, 1,
-1.322056, 1.985216, 0.3244287, 1, 1, 1, 1, 1,
-1.319683, 1.701859, -1.334888, 1, 1, 1, 1, 1,
-1.303353, -1.517596, -0.3217867, 1, 1, 1, 1, 1,
-1.292412, -0.2603247, -1.462783, 0, 0, 1, 1, 1,
-1.28464, -0.7745622, -2.244289, 1, 0, 0, 1, 1,
-1.278745, -0.735087, -3.687239, 1, 0, 0, 1, 1,
-1.27529, 0.2827278, -0.4496351, 1, 0, 0, 1, 1,
-1.266907, -1.665522, -3.449091, 1, 0, 0, 1, 1,
-1.266375, -0.9691148, -1.905504, 1, 0, 0, 1, 1,
-1.2588, 0.2838711, -1.931729, 0, 0, 0, 1, 1,
-1.249251, -2.032616, -3.496154, 0, 0, 0, 1, 1,
-1.241686, 0.7093866, -1.046542, 0, 0, 0, 1, 1,
-1.237766, 0.02633914, -2.660551, 0, 0, 0, 1, 1,
-1.224887, 0.1325584, -1.826176, 0, 0, 0, 1, 1,
-1.215316, 0.5210062, -1.609632, 0, 0, 0, 1, 1,
-1.208405, -0.1660526, -1.578026, 0, 0, 0, 1, 1,
-1.207615, -1.543138, -1.576948, 1, 1, 1, 1, 1,
-1.195225, -2.014298, -2.175857, 1, 1, 1, 1, 1,
-1.190859, -1.52434, -2.552072, 1, 1, 1, 1, 1,
-1.190636, -0.8826276, -1.939494, 1, 1, 1, 1, 1,
-1.189985, 1.705737, -1.780156, 1, 1, 1, 1, 1,
-1.188335, -0.1770462, -2.583825, 1, 1, 1, 1, 1,
-1.182857, -0.2764319, -1.604107, 1, 1, 1, 1, 1,
-1.179026, -0.005788341, -1.421874, 1, 1, 1, 1, 1,
-1.1621, 2.78552, -1.680074, 1, 1, 1, 1, 1,
-1.154657, -0.003224013, -3.672076, 1, 1, 1, 1, 1,
-1.150375, 1.432593, -2.373044, 1, 1, 1, 1, 1,
-1.146176, 0.3212352, -1.10466, 1, 1, 1, 1, 1,
-1.145201, -2.512933, -3.689382, 1, 1, 1, 1, 1,
-1.140139, 0.5193788, -2.728003, 1, 1, 1, 1, 1,
-1.138942, -2.825313, -1.901478, 1, 1, 1, 1, 1,
-1.136773, 0.3479352, -0.01157949, 0, 0, 1, 1, 1,
-1.134542, -0.6601606, -1.412449, 1, 0, 0, 1, 1,
-1.12658, -0.2484171, -0.6006103, 1, 0, 0, 1, 1,
-1.124519, 0.9491315, -1.341045, 1, 0, 0, 1, 1,
-1.123868, 1.94315, -1.653843, 1, 0, 0, 1, 1,
-1.122576, -0.530917, -0.7143345, 1, 0, 0, 1, 1,
-1.120013, 1.788579, -1.388555, 0, 0, 0, 1, 1,
-1.110643, 2.396354, 1.713026, 0, 0, 0, 1, 1,
-1.107274, -3.340946, -2.567811, 0, 0, 0, 1, 1,
-1.100825, -0.8391289, -2.134148, 0, 0, 0, 1, 1,
-1.089306, 1.221554, -0.05644063, 0, 0, 0, 1, 1,
-1.088493, 2.298696, -0.02512207, 0, 0, 0, 1, 1,
-1.085806, 0.1234735, -1.140231, 0, 0, 0, 1, 1,
-1.08427, -1.967129, -1.581086, 1, 1, 1, 1, 1,
-1.073871, -1.764352, -3.781845, 1, 1, 1, 1, 1,
-1.064095, 0.07110612, -0.7493386, 1, 1, 1, 1, 1,
-1.062742, -0.1237289, -0.3307345, 1, 1, 1, 1, 1,
-1.060368, 0.8977755, -0.3828996, 1, 1, 1, 1, 1,
-1.057765, 0.1722203, -1.919183, 1, 1, 1, 1, 1,
-1.056942, 0.2166401, -2.411427, 1, 1, 1, 1, 1,
-1.053897, 1.692859, -0.3122307, 1, 1, 1, 1, 1,
-1.044977, 1.557255, -1.980276, 1, 1, 1, 1, 1,
-1.037943, 0.7625406, -0.8477296, 1, 1, 1, 1, 1,
-1.035072, 0.01881669, -1.564777, 1, 1, 1, 1, 1,
-1.029323, -0.7997425, -2.607372, 1, 1, 1, 1, 1,
-1.02932, -0.3870117, -3.091222, 1, 1, 1, 1, 1,
-1.022666, 1.155447, -1.689509, 1, 1, 1, 1, 1,
-1.018384, 1.935548, -0.6339072, 1, 1, 1, 1, 1,
-1.015165, -1.155435, -1.287657, 0, 0, 1, 1, 1,
-1.015057, -0.6918586, -3.16851, 1, 0, 0, 1, 1,
-1.007957, -0.1683156, -1.226825, 1, 0, 0, 1, 1,
-1.003166, 0.7065741, -2.398393, 1, 0, 0, 1, 1,
-0.993441, -1.123802, -2.157005, 1, 0, 0, 1, 1,
-0.9890711, -0.982824, -3.089509, 1, 0, 0, 1, 1,
-0.983216, -1.028922, -1.490463, 0, 0, 0, 1, 1,
-0.9795053, 0.2716328, -1.928125, 0, 0, 0, 1, 1,
-0.9743495, 2.016851, -1.6184, 0, 0, 0, 1, 1,
-0.9710155, 0.3041979, -1.90295, 0, 0, 0, 1, 1,
-0.9704375, 0.2707947, -0.6097107, 0, 0, 0, 1, 1,
-0.9652932, 1.22167, 0.2887979, 0, 0, 0, 1, 1,
-0.9636041, -1.243106, -3.480926, 0, 0, 0, 1, 1,
-0.9625001, -1.043816, -2.43669, 1, 1, 1, 1, 1,
-0.9548711, 0.6531478, -4.164437, 1, 1, 1, 1, 1,
-0.9540376, 1.488681, -0.7126236, 1, 1, 1, 1, 1,
-0.9516928, 1.048667, -1.609089, 1, 1, 1, 1, 1,
-0.9505966, -0.3650333, -2.284737, 1, 1, 1, 1, 1,
-0.9431305, -0.4515994, -2.1397, 1, 1, 1, 1, 1,
-0.9327902, -0.6152137, -3.907768, 1, 1, 1, 1, 1,
-0.921973, -0.5104976, -1.373662, 1, 1, 1, 1, 1,
-0.9141745, 0.5474204, -0.1279372, 1, 1, 1, 1, 1,
-0.9092258, 0.3506521, -2.007211, 1, 1, 1, 1, 1,
-0.9090635, 0.8644866, -0.4886386, 1, 1, 1, 1, 1,
-0.9068975, 0.1984123, -2.61911, 1, 1, 1, 1, 1,
-0.9011891, -1.240199, -2.786417, 1, 1, 1, 1, 1,
-0.8948472, 1.628075, 0.2850657, 1, 1, 1, 1, 1,
-0.8849881, 0.07049551, -0.7369962, 1, 1, 1, 1, 1,
-0.8821804, 0.5618946, 0.01418222, 0, 0, 1, 1, 1,
-0.8813261, 1.095818, -1.286308, 1, 0, 0, 1, 1,
-0.8786798, 0.3150711, -1.532196, 1, 0, 0, 1, 1,
-0.8741241, 0.9094011, 0.49196, 1, 0, 0, 1, 1,
-0.8738741, -0.7210022, 0.2045291, 1, 0, 0, 1, 1,
-0.8716154, -0.01035377, -2.421254, 1, 0, 0, 1, 1,
-0.8698416, -0.55255, -3.199449, 0, 0, 0, 1, 1,
-0.8684837, -0.0883837, -2.703006, 0, 0, 0, 1, 1,
-0.8610491, -0.03225441, 0.1403207, 0, 0, 0, 1, 1,
-0.8610262, -1.969715, -2.698618, 0, 0, 0, 1, 1,
-0.8553756, -0.01130707, -1.241354, 0, 0, 0, 1, 1,
-0.8536008, -0.9371516, -4.466688, 0, 0, 0, 1, 1,
-0.8507349, 0.03441976, 0.7578318, 0, 0, 0, 1, 1,
-0.8501198, 1.007985, -1.658839, 1, 1, 1, 1, 1,
-0.8488371, 0.2378242, -1.049886, 1, 1, 1, 1, 1,
-0.8487226, -0.7107167, -1.816254, 1, 1, 1, 1, 1,
-0.8478309, -0.5057666, -2.411766, 1, 1, 1, 1, 1,
-0.8467215, 0.1169061, -2.153242, 1, 1, 1, 1, 1,
-0.8456543, 0.4147956, -2.0062, 1, 1, 1, 1, 1,
-0.8453767, 0.6060147, 0.05603037, 1, 1, 1, 1, 1,
-0.8411012, -1.126908, -2.668905, 1, 1, 1, 1, 1,
-0.8388291, -1.153743, -2.446734, 1, 1, 1, 1, 1,
-0.838649, 1.708847, -0.3653567, 1, 1, 1, 1, 1,
-0.8385379, 0.3660356, -0.9247888, 1, 1, 1, 1, 1,
-0.8384349, -1.952521, -2.088077, 1, 1, 1, 1, 1,
-0.837338, -0.439353, -1.84931, 1, 1, 1, 1, 1,
-0.8314934, 0.01744391, -0.6914046, 1, 1, 1, 1, 1,
-0.8283378, 0.5015925, -2.197462, 1, 1, 1, 1, 1,
-0.8254023, 1.406004, 0.2884272, 0, 0, 1, 1, 1,
-0.825386, 0.1762463, -0.5924066, 1, 0, 0, 1, 1,
-0.8151799, 0.3755942, -0.9574274, 1, 0, 0, 1, 1,
-0.8083508, 1.161359, 0.5212962, 1, 0, 0, 1, 1,
-0.8069594, 0.5654338, 0.5086036, 1, 0, 0, 1, 1,
-0.8026704, 1.232652, -0.07313959, 1, 0, 0, 1, 1,
-0.8019432, -0.9335543, -1.496904, 0, 0, 0, 1, 1,
-0.7996972, -0.3869497, -0.7671825, 0, 0, 0, 1, 1,
-0.7991594, -0.4406276, -0.1937135, 0, 0, 0, 1, 1,
-0.7968133, -0.1665033, -2.426426, 0, 0, 0, 1, 1,
-0.7958614, -0.5684982, -1.62477, 0, 0, 0, 1, 1,
-0.7928087, 0.2537232, -1.676381, 0, 0, 0, 1, 1,
-0.791257, -1.080749, -2.168869, 0, 0, 0, 1, 1,
-0.7911333, 1.152548, -0.4579506, 1, 1, 1, 1, 1,
-0.7909747, -1.064589, -1.626413, 1, 1, 1, 1, 1,
-0.7897279, 0.7222761, 0.2165613, 1, 1, 1, 1, 1,
-0.786, -1.040262, -2.588825, 1, 1, 1, 1, 1,
-0.7835879, -2.015753, -2.185877, 1, 1, 1, 1, 1,
-0.7790408, -1.009337, -1.692184, 1, 1, 1, 1, 1,
-0.7788103, 0.5184792, -2.448485, 1, 1, 1, 1, 1,
-0.7758526, 0.5673975, -0.3350915, 1, 1, 1, 1, 1,
-0.7708804, -2.057238, -4.706378, 1, 1, 1, 1, 1,
-0.7489137, 0.8782851, -0.7527624, 1, 1, 1, 1, 1,
-0.7486898, -1.199825, -3.414279, 1, 1, 1, 1, 1,
-0.7417134, 2.202343, -0.6701978, 1, 1, 1, 1, 1,
-0.7407575, -0.4475766, -3.782511, 1, 1, 1, 1, 1,
-0.7335572, -1.867394, -2.365334, 1, 1, 1, 1, 1,
-0.7320306, -0.5961521, -1.769181, 1, 1, 1, 1, 1,
-0.7318383, -0.6264686, -1.368851, 0, 0, 1, 1, 1,
-0.730638, -0.2934835, -3.324703, 1, 0, 0, 1, 1,
-0.7270879, -0.6448212, -2.24254, 1, 0, 0, 1, 1,
-0.7252791, 0.128918, -1.317524, 1, 0, 0, 1, 1,
-0.7249879, 0.5849705, -0.8828747, 1, 0, 0, 1, 1,
-0.7237365, -1.15363, -2.623825, 1, 0, 0, 1, 1,
-0.7235405, -2.105473, -3.206283, 0, 0, 0, 1, 1,
-0.7235006, 0.2336871, -2.931007, 0, 0, 0, 1, 1,
-0.7222483, 0.353185, -1.761273, 0, 0, 0, 1, 1,
-0.7215531, -1.914499, -3.463167, 0, 0, 0, 1, 1,
-0.7193897, -0.2624351, -3.078919, 0, 0, 0, 1, 1,
-0.718751, 0.4961853, -3.229387, 0, 0, 0, 1, 1,
-0.7183085, 1.266639, -1.906092, 0, 0, 0, 1, 1,
-0.7181798, 0.546769, -2.142303, 1, 1, 1, 1, 1,
-0.7177805, 0.4006996, -1.035107, 1, 1, 1, 1, 1,
-0.7155667, 1.661763, 0.341524, 1, 1, 1, 1, 1,
-0.7146925, -0.7839555, -4.535387, 1, 1, 1, 1, 1,
-0.7035496, 2.068319, -1.62737, 1, 1, 1, 1, 1,
-0.6995445, 0.2195587, -1.475467, 1, 1, 1, 1, 1,
-0.6910109, -0.4901772, -3.196469, 1, 1, 1, 1, 1,
-0.6838263, 1.103126, -0.5676599, 1, 1, 1, 1, 1,
-0.682813, -1.652903, -2.895986, 1, 1, 1, 1, 1,
-0.680079, 1.223391, -0.247503, 1, 1, 1, 1, 1,
-0.677781, 1.708411, -0.8786843, 1, 1, 1, 1, 1,
-0.6756259, 1.534361, 1.008361, 1, 1, 1, 1, 1,
-0.6751753, 0.6028863, -0.7884893, 1, 1, 1, 1, 1,
-0.6734102, -1.650542, -2.426281, 1, 1, 1, 1, 1,
-0.6704285, 0.9308459, -1.423092, 1, 1, 1, 1, 1,
-0.6685824, 0.9608143, -0.5759161, 0, 0, 1, 1, 1,
-0.6682333, 0.1181067, -1.899991, 1, 0, 0, 1, 1,
-0.6679286, 1.615187, 0.4563858, 1, 0, 0, 1, 1,
-0.6612878, -0.6898974, -2.802405, 1, 0, 0, 1, 1,
-0.6524879, 0.2370874, -0.7377313, 1, 0, 0, 1, 1,
-0.6498759, -0.9288692, -2.889446, 1, 0, 0, 1, 1,
-0.6455371, -0.81394, -2.346563, 0, 0, 0, 1, 1,
-0.6445473, -1.310141, -3.38348, 0, 0, 0, 1, 1,
-0.6413797, 0.4033713, -0.7953022, 0, 0, 0, 1, 1,
-0.6408455, -0.08998138, 0.1175532, 0, 0, 0, 1, 1,
-0.6390754, -0.4063438, -3.690567, 0, 0, 0, 1, 1,
-0.6377146, 0.01767883, -1.714166, 0, 0, 0, 1, 1,
-0.6317365, -0.7344801, -3.552222, 0, 0, 0, 1, 1,
-0.6309861, -0.4950479, -1.855402, 1, 1, 1, 1, 1,
-0.6272171, -0.8130994, -3.9122, 1, 1, 1, 1, 1,
-0.6269481, 0.6252329, -1.201359, 1, 1, 1, 1, 1,
-0.6230066, -0.7196651, -2.486984, 1, 1, 1, 1, 1,
-0.6228137, -0.7693361, -4.267883, 1, 1, 1, 1, 1,
-0.6196452, -0.7043702, -0.6850184, 1, 1, 1, 1, 1,
-0.607583, -0.4552082, -0.1005078, 1, 1, 1, 1, 1,
-0.5999333, -0.3130728, -2.465405, 1, 1, 1, 1, 1,
-0.5997929, 0.3509196, -1.15844, 1, 1, 1, 1, 1,
-0.5978333, -0.1586743, -1.314814, 1, 1, 1, 1, 1,
-0.5931966, 1.648268, -0.00538718, 1, 1, 1, 1, 1,
-0.5907624, 0.1766446, -0.6454187, 1, 1, 1, 1, 1,
-0.5857103, -0.4112703, -1.551906, 1, 1, 1, 1, 1,
-0.5844702, -0.7495134, -2.989439, 1, 1, 1, 1, 1,
-0.5785081, 0.526022, -2.302697, 1, 1, 1, 1, 1,
-0.5773062, -0.1318167, -3.862011, 0, 0, 1, 1, 1,
-0.5654209, 0.6825038, -0.3081394, 1, 0, 0, 1, 1,
-0.5641355, -0.3567394, -0.5295004, 1, 0, 0, 1, 1,
-0.5586179, -0.1599058, -2.085587, 1, 0, 0, 1, 1,
-0.5553754, -1.245744, -1.958501, 1, 0, 0, 1, 1,
-0.5524399, 0.518312, -1.159601, 1, 0, 0, 1, 1,
-0.5521823, 1.340513, -1.025865, 0, 0, 0, 1, 1,
-0.5508259, 0.233572, 0.4014238, 0, 0, 0, 1, 1,
-0.5458418, -0.3642046, -2.468365, 0, 0, 0, 1, 1,
-0.5456583, 2.009669, -0.9203587, 0, 0, 0, 1, 1,
-0.5423895, -0.2091307, -2.032152, 0, 0, 0, 1, 1,
-0.5349873, -2.255147, -4.36904, 0, 0, 0, 1, 1,
-0.5346743, -1.086991, -2.9456, 0, 0, 0, 1, 1,
-0.529852, 2.185446, 0.6631999, 1, 1, 1, 1, 1,
-0.5284996, 0.6897724, -2.420897, 1, 1, 1, 1, 1,
-0.5270622, 0.0245906, -3.09337, 1, 1, 1, 1, 1,
-0.5250365, -0.7309923, -0.9948207, 1, 1, 1, 1, 1,
-0.5236476, -0.8637578, -2.378918, 1, 1, 1, 1, 1,
-0.5235375, -0.1157536, -3.35143, 1, 1, 1, 1, 1,
-0.5212749, -0.1938794, -1.875642, 1, 1, 1, 1, 1,
-0.5135813, 1.393864, -0.2596084, 1, 1, 1, 1, 1,
-0.5104264, -0.7436894, -2.838851, 1, 1, 1, 1, 1,
-0.5062651, -1.255208, -3.173558, 1, 1, 1, 1, 1,
-0.5037308, 0.5258228, -1.525985, 1, 1, 1, 1, 1,
-0.4933857, 0.01947245, -1.465351, 1, 1, 1, 1, 1,
-0.4910037, -0.1938837, -0.7087896, 1, 1, 1, 1, 1,
-0.4778701, 0.9004916, -0.2286755, 1, 1, 1, 1, 1,
-0.4771717, -0.3224568, -1.352538, 1, 1, 1, 1, 1,
-0.4751868, -1.700059, -3.604186, 0, 0, 1, 1, 1,
-0.4750195, -2.155269, -2.614969, 1, 0, 0, 1, 1,
-0.4608667, 0.29178, -1.116442, 1, 0, 0, 1, 1,
-0.4583147, -0.4451552, -1.108584, 1, 0, 0, 1, 1,
-0.4580404, 2.392405, -1.265004, 1, 0, 0, 1, 1,
-0.4578644, 1.875085, 0.1472115, 1, 0, 0, 1, 1,
-0.454573, 0.03401256, -0.9962415, 0, 0, 0, 1, 1,
-0.4509956, -0.09743039, -2.437619, 0, 0, 0, 1, 1,
-0.4479345, 0.5663244, -1.07571, 0, 0, 0, 1, 1,
-0.4470435, -1.221989, -2.158887, 0, 0, 0, 1, 1,
-0.4433068, -0.9732423, -3.973937, 0, 0, 0, 1, 1,
-0.4407865, -0.6867421, -4.209154, 0, 0, 0, 1, 1,
-0.4386831, -0.5836169, -3.148604, 0, 0, 0, 1, 1,
-0.4341206, 1.288075, -0.8502268, 1, 1, 1, 1, 1,
-0.4309464, -1.410898, -4.990471, 1, 1, 1, 1, 1,
-0.4303943, 0.1540107, -3.031358, 1, 1, 1, 1, 1,
-0.4303164, -0.2559083, -1.225043, 1, 1, 1, 1, 1,
-0.4139522, 0.1657257, -0.7811857, 1, 1, 1, 1, 1,
-0.4067646, 0.09390509, -0.5144083, 1, 1, 1, 1, 1,
-0.4050051, 0.9226798, -1.208223, 1, 1, 1, 1, 1,
-0.4047622, -0.5925063, -2.045299, 1, 1, 1, 1, 1,
-0.4037763, 0.2774455, -0.8544342, 1, 1, 1, 1, 1,
-0.4008808, 1.17229, -0.3227674, 1, 1, 1, 1, 1,
-0.3998225, -1.586452, -3.971517, 1, 1, 1, 1, 1,
-0.3982127, 2.020375, 0.2000691, 1, 1, 1, 1, 1,
-0.3977015, 1.383099, 0.3655624, 1, 1, 1, 1, 1,
-0.3904691, -1.370698, -2.087713, 1, 1, 1, 1, 1,
-0.3876338, -0.9059303, -2.153617, 1, 1, 1, 1, 1,
-0.3853366, -0.6892345, -5.602715, 0, 0, 1, 1, 1,
-0.3835124, -0.9624621, -3.033759, 1, 0, 0, 1, 1,
-0.382137, 0.4142263, -2.090075, 1, 0, 0, 1, 1,
-0.3810379, 1.14994, 0.3595268, 1, 0, 0, 1, 1,
-0.3794402, -0.1578695, -2.027708, 1, 0, 0, 1, 1,
-0.3762637, 0.2685289, -1.035759, 1, 0, 0, 1, 1,
-0.3752171, -1.037842, -1.656143, 0, 0, 0, 1, 1,
-0.3738693, -0.6312432, -2.692509, 0, 0, 0, 1, 1,
-0.3713979, -0.9814954, -2.643143, 0, 0, 0, 1, 1,
-0.36458, -0.7344084, -1.593135, 0, 0, 0, 1, 1,
-0.3552755, -1.376642, -1.706079, 0, 0, 0, 1, 1,
-0.3535878, -1.418039, -1.546209, 0, 0, 0, 1, 1,
-0.3405671, -0.5084094, -3.787739, 0, 0, 0, 1, 1,
-0.3389351, 0.5239595, -1.179146, 1, 1, 1, 1, 1,
-0.3385155, 0.2203075, -1.098054, 1, 1, 1, 1, 1,
-0.3233147, 1.259336, -0.9799913, 1, 1, 1, 1, 1,
-0.3215165, -0.2635241, -1.937312, 1, 1, 1, 1, 1,
-0.3212536, 0.5143542, -0.8922154, 1, 1, 1, 1, 1,
-0.3210261, 1.144867, 0.7406783, 1, 1, 1, 1, 1,
-0.3201408, 0.4380115, 0.5153772, 1, 1, 1, 1, 1,
-0.3113491, -0.8772339, -3.134357, 1, 1, 1, 1, 1,
-0.3109995, -2.571889, -2.7815, 1, 1, 1, 1, 1,
-0.3086755, 0.8683502, 0.6468233, 1, 1, 1, 1, 1,
-0.3076822, 1.426696, -0.4327582, 1, 1, 1, 1, 1,
-0.3048215, 1.990835, 0.726451, 1, 1, 1, 1, 1,
-0.3043141, 1.319939, -1.556391, 1, 1, 1, 1, 1,
-0.2999423, 0.1923936, 0.8166063, 1, 1, 1, 1, 1,
-0.2985341, -1.361528, -3.321888, 1, 1, 1, 1, 1,
-0.2965727, 1.320219, -0.2662249, 0, 0, 1, 1, 1,
-0.2963244, -0.4504837, -3.316925, 1, 0, 0, 1, 1,
-0.2944279, 0.8035164, -1.109585, 1, 0, 0, 1, 1,
-0.2939953, -1.019523, -3.309685, 1, 0, 0, 1, 1,
-0.2922734, 0.6991113, 0.5335414, 1, 0, 0, 1, 1,
-0.2917133, -0.7364812, -3.792575, 1, 0, 0, 1, 1,
-0.2908256, 2.326812, 0.09711789, 0, 0, 0, 1, 1,
-0.2868984, -0.7933274, -2.195279, 0, 0, 0, 1, 1,
-0.285798, -0.3006958, -1.964489, 0, 0, 0, 1, 1,
-0.2766243, -0.4250538, -3.407064, 0, 0, 0, 1, 1,
-0.2765438, 1.527865, -1.831848, 0, 0, 0, 1, 1,
-0.2759014, -0.9115627, -4.272975, 0, 0, 0, 1, 1,
-0.2737279, 0.7526425, 0.04866058, 0, 0, 0, 1, 1,
-0.2720224, -0.2277246, -2.383131, 1, 1, 1, 1, 1,
-0.2713116, 0.863802, -1.120165, 1, 1, 1, 1, 1,
-0.2709789, 0.3574836, -1.24659, 1, 1, 1, 1, 1,
-0.2694137, -0.4476851, -2.628022, 1, 1, 1, 1, 1,
-0.2678319, 0.5893036, 0.3431458, 1, 1, 1, 1, 1,
-0.2642624, 0.6604119, 0.4428566, 1, 1, 1, 1, 1,
-0.2588284, 1.00437, 0.7036306, 1, 1, 1, 1, 1,
-0.2585681, -1.008672, -3.629606, 1, 1, 1, 1, 1,
-0.2468729, -0.02864556, -1.589913, 1, 1, 1, 1, 1,
-0.2383599, 0.451455, -0.5291722, 1, 1, 1, 1, 1,
-0.2332924, 1.16363, 0.544217, 1, 1, 1, 1, 1,
-0.2319294, -1.316163, -1.112252, 1, 1, 1, 1, 1,
-0.230503, 0.8843643, 1.299973, 1, 1, 1, 1, 1,
-0.220047, 1.104337, -2.745215, 1, 1, 1, 1, 1,
-0.219693, -0.843329, -2.620937, 1, 1, 1, 1, 1,
-0.2177303, -0.2502051, -2.212361, 0, 0, 1, 1, 1,
-0.2172348, -0.9111311, -3.309189, 1, 0, 0, 1, 1,
-0.2130399, 0.759691, -1.128084, 1, 0, 0, 1, 1,
-0.2120294, -1.273014, -3.181823, 1, 0, 0, 1, 1,
-0.2115881, 0.4065911, -0.3764729, 1, 0, 0, 1, 1,
-0.2099717, -2.146487, -4.324148, 1, 0, 0, 1, 1,
-0.2066519, -0.4739693, -3.698905, 0, 0, 0, 1, 1,
-0.2038522, -0.2002448, -2.370056, 0, 0, 0, 1, 1,
-0.2005082, 0.1230326, -1.130925, 0, 0, 0, 1, 1,
-0.1995734, 0.7251173, 1.146708, 0, 0, 0, 1, 1,
-0.1988178, -0.7909268, -3.307101, 0, 0, 0, 1, 1,
-0.1939074, 1.290385, -0.3836268, 0, 0, 0, 1, 1,
-0.1927852, -0.5241287, -4.299198, 0, 0, 0, 1, 1,
-0.191991, -1.172131, -4.449672, 1, 1, 1, 1, 1,
-0.1890845, 0.9798936, 0.5156215, 1, 1, 1, 1, 1,
-0.1869734, 0.6077659, -0.268564, 1, 1, 1, 1, 1,
-0.1845604, -0.6216594, -3.149673, 1, 1, 1, 1, 1,
-0.1840048, 2.348963, -0.9304703, 1, 1, 1, 1, 1,
-0.183347, 0.2449505, 0.7998504, 1, 1, 1, 1, 1,
-0.1761774, 0.01281429, -1.930875, 1, 1, 1, 1, 1,
-0.1709028, -1.646873, -4.187483, 1, 1, 1, 1, 1,
-0.1693956, -0.8574389, -3.619226, 1, 1, 1, 1, 1,
-0.1672544, -1.069293, -1.858049, 1, 1, 1, 1, 1,
-0.162314, 2.824517, -0.5119844, 1, 1, 1, 1, 1,
-0.1617686, 2.729044, 0.6825701, 1, 1, 1, 1, 1,
-0.1613802, 0.9730504, -0.0261329, 1, 1, 1, 1, 1,
-0.1587101, 2.424183, 0.5180544, 1, 1, 1, 1, 1,
-0.1571265, -1.494651, -1.72545, 1, 1, 1, 1, 1,
-0.1559053, 0.1502228, -1.712492, 0, 0, 1, 1, 1,
-0.1552052, 0.9210845, 0.1600574, 1, 0, 0, 1, 1,
-0.1545531, -1.797036, -2.183922, 1, 0, 0, 1, 1,
-0.1511128, -0.8178846, -1.966554, 1, 0, 0, 1, 1,
-0.1509269, 1.076115, 0.7603111, 1, 0, 0, 1, 1,
-0.1495529, -0.6794078, -5.66859, 1, 0, 0, 1, 1,
-0.1487631, -0.8156222, -3.66515, 0, 0, 0, 1, 1,
-0.1469047, 0.2045202, 0.7642991, 0, 0, 0, 1, 1,
-0.1414013, -0.336837, -3.908063, 0, 0, 0, 1, 1,
-0.1411533, -0.597763, -2.619051, 0, 0, 0, 1, 1,
-0.1408629, -0.4495438, -3.636051, 0, 0, 0, 1, 1,
-0.1360935, -2.065925, -3.546593, 0, 0, 0, 1, 1,
-0.1356625, -0.453297, -1.968436, 0, 0, 0, 1, 1,
-0.135285, 3.264202, 0.5529862, 1, 1, 1, 1, 1,
-0.1303487, -0.6012832, -3.108851, 1, 1, 1, 1, 1,
-0.1294866, -1.0432, -2.09821, 1, 1, 1, 1, 1,
-0.1294536, 0.2698826, -0.4661084, 1, 1, 1, 1, 1,
-0.1294448, 0.8408099, -1.184526, 1, 1, 1, 1, 1,
-0.1271521, -1.232497, -3.218143, 1, 1, 1, 1, 1,
-0.1252373, 1.740757, 0.1552822, 1, 1, 1, 1, 1,
-0.1252246, 0.5057442, 0.04514141, 1, 1, 1, 1, 1,
-0.1204678, -0.5079172, -1.637611, 1, 1, 1, 1, 1,
-0.1198574, 1.413818, 0.0432926, 1, 1, 1, 1, 1,
-0.1140814, -2.129446, -4.793491, 1, 1, 1, 1, 1,
-0.1140406, -0.2905392, -3.181883, 1, 1, 1, 1, 1,
-0.1136752, 0.6126452, 0.6696493, 1, 1, 1, 1, 1,
-0.109174, -0.6089159, -2.450254, 1, 1, 1, 1, 1,
-0.1052021, -0.09974986, -0.795679, 1, 1, 1, 1, 1,
-0.09798776, 0.8142834, 0.7754623, 0, 0, 1, 1, 1,
-0.09401896, 0.4077963, 0.8131718, 1, 0, 0, 1, 1,
-0.08969616, 1.284212, 0.4098284, 1, 0, 0, 1, 1,
-0.08647507, -1.180083, -2.985471, 1, 0, 0, 1, 1,
-0.08531373, 0.3309809, -0.8389439, 1, 0, 0, 1, 1,
-0.08402265, 0.6483353, -0.2263582, 1, 0, 0, 1, 1,
-0.08343612, -0.6321894, -2.424353, 0, 0, 0, 1, 1,
-0.08085044, -0.6474901, -1.912955, 0, 0, 0, 1, 1,
-0.07794737, -0.09575704, -1.548954, 0, 0, 0, 1, 1,
-0.07707442, -0.01839439, -1.828088, 0, 0, 0, 1, 1,
-0.07586677, -0.987286, -1.991556, 0, 0, 0, 1, 1,
-0.07270188, -0.8488076, -3.792834, 0, 0, 0, 1, 1,
-0.0693345, 0.02604085, -1.338711, 0, 0, 0, 1, 1,
-0.06542356, -0.8210937, -4.455068, 1, 1, 1, 1, 1,
-0.06133638, 1.36955, -0.4345806, 1, 1, 1, 1, 1,
-0.05891074, -2.359705, -2.503371, 1, 1, 1, 1, 1,
-0.05873239, -0.2303819, -5.254295, 1, 1, 1, 1, 1,
-0.0564611, 0.51572, -0.6132118, 1, 1, 1, 1, 1,
-0.05631733, -0.9796224, -4.570984, 1, 1, 1, 1, 1,
-0.05149764, -0.7210292, -1.683164, 1, 1, 1, 1, 1,
-0.0496125, -0.1722486, -3.761868, 1, 1, 1, 1, 1,
-0.04946996, 0.02778124, -1.876759, 1, 1, 1, 1, 1,
-0.04792713, -0.6734096, -3.097897, 1, 1, 1, 1, 1,
-0.04733567, 1.119449, -2.270745, 1, 1, 1, 1, 1,
-0.04042364, -0.2196757, -3.88631, 1, 1, 1, 1, 1,
-0.04026605, 0.0916744, -1.655446, 1, 1, 1, 1, 1,
-0.03820955, 0.4698378, 0.9987736, 1, 1, 1, 1, 1,
-0.03796051, 0.3484109, 0.3214977, 1, 1, 1, 1, 1,
-0.03440901, 0.3101418, -1.55072, 0, 0, 1, 1, 1,
-0.0303327, 0.8655359, -2.814525, 1, 0, 0, 1, 1,
-0.02275077, -1.129619, -4.136025, 1, 0, 0, 1, 1,
-0.01902566, -1.696615, -1.499881, 1, 0, 0, 1, 1,
-0.01880566, 0.5868394, 0.5555094, 1, 0, 0, 1, 1,
-0.01724962, 0.8166165, -0.08244567, 1, 0, 0, 1, 1,
-0.01285045, -1.33978, -2.966518, 0, 0, 0, 1, 1,
-0.008408215, -0.8861712, -1.147626, 0, 0, 0, 1, 1,
-0.008085622, -0.5190938, -2.547861, 0, 0, 0, 1, 1,
-0.002115754, -0.4503918, -2.663985, 0, 0, 0, 1, 1,
-0.0008730007, 2.022534, -0.903103, 0, 0, 0, 1, 1,
0.003521763, 0.02011492, -0.1326729, 0, 0, 0, 1, 1,
0.003661719, 1.15399, -0.3517371, 0, 0, 0, 1, 1,
0.006486381, 0.6507069, 0.9838448, 1, 1, 1, 1, 1,
0.007106985, -1.421723, 3.654879, 1, 1, 1, 1, 1,
0.008565289, 0.8342599, -0.8662484, 1, 1, 1, 1, 1,
0.010763, 0.4431361, 1.13046, 1, 1, 1, 1, 1,
0.01172216, 0.6452319, -0.6016292, 1, 1, 1, 1, 1,
0.02015373, 0.2965201, -1.412961, 1, 1, 1, 1, 1,
0.02244584, 0.06473081, 1.366763, 1, 1, 1, 1, 1,
0.02374967, -0.3478823, 2.865085, 1, 1, 1, 1, 1,
0.02548145, -1.215653, 3.004815, 1, 1, 1, 1, 1,
0.02711627, -0.4404491, 2.362127, 1, 1, 1, 1, 1,
0.03183731, 0.881422, -0.2667652, 1, 1, 1, 1, 1,
0.03652449, 1.682652, -0.3627995, 1, 1, 1, 1, 1,
0.03968164, 0.3390417, -0.4101809, 1, 1, 1, 1, 1,
0.04511562, 0.9287815, -0.6409992, 1, 1, 1, 1, 1,
0.04518007, 0.1341829, 2.295472, 1, 1, 1, 1, 1,
0.04567282, -0.4410793, 0.2862544, 0, 0, 1, 1, 1,
0.04805237, -0.3965948, 1.464674, 1, 0, 0, 1, 1,
0.04826921, -0.5870613, 2.612973, 1, 0, 0, 1, 1,
0.04948523, -0.4504195, 1.963407, 1, 0, 0, 1, 1,
0.05051917, 0.5962808, 1.348218, 1, 0, 0, 1, 1,
0.05641321, 0.01029846, 0.9755904, 1, 0, 0, 1, 1,
0.05657907, -1.863618, 3.240566, 0, 0, 0, 1, 1,
0.05783736, 1.512869, 0.2946088, 0, 0, 0, 1, 1,
0.05794423, -1.856735, 3.143858, 0, 0, 0, 1, 1,
0.05988475, -0.8738462, 2.107466, 0, 0, 0, 1, 1,
0.0611472, 0.4470942, 1.912401, 0, 0, 0, 1, 1,
0.06264824, 0.09819034, -0.1718322, 0, 0, 0, 1, 1,
0.0627071, -1.024982, 1.807199, 0, 0, 0, 1, 1,
0.06700046, 0.04604039, -1.319056, 1, 1, 1, 1, 1,
0.06761631, -0.6392807, 1.940624, 1, 1, 1, 1, 1,
0.06927459, 1.414, 0.5060875, 1, 1, 1, 1, 1,
0.07369265, 0.2974011, 0.1260327, 1, 1, 1, 1, 1,
0.08237274, -0.3437418, 2.2463, 1, 1, 1, 1, 1,
0.08590728, 0.06211862, 1.497984, 1, 1, 1, 1, 1,
0.08598185, -0.9070945, 3.817797, 1, 1, 1, 1, 1,
0.09118436, -0.1174582, 1.212894, 1, 1, 1, 1, 1,
0.09270222, -0.8132052, 4.58412, 1, 1, 1, 1, 1,
0.09792963, -1.912379, 2.519522, 1, 1, 1, 1, 1,
0.1040048, -0.6380337, 3.895082, 1, 1, 1, 1, 1,
0.1089895, -0.5922502, 4.196805, 1, 1, 1, 1, 1,
0.1112022, -0.492464, 3.588474, 1, 1, 1, 1, 1,
0.1117668, -1.838891, 2.932873, 1, 1, 1, 1, 1,
0.1151963, 1.634855, 0.218476, 1, 1, 1, 1, 1,
0.1157269, -0.1981363, 3.694916, 0, 0, 1, 1, 1,
0.1159408, 0.4331044, 0.1220507, 1, 0, 0, 1, 1,
0.1266226, -2.40592, 2.363084, 1, 0, 0, 1, 1,
0.1272282, 1.429127, 0.2210946, 1, 0, 0, 1, 1,
0.1309337, -0.6892828, 3.830442, 1, 0, 0, 1, 1,
0.1312595, -1.215861, 3.182485, 1, 0, 0, 1, 1,
0.1350747, 1.41607, 1.275865, 0, 0, 0, 1, 1,
0.1405116, -1.95076, 3.270291, 0, 0, 0, 1, 1,
0.1425948, -1.18261, 3.891523, 0, 0, 0, 1, 1,
0.144513, -1.790276, 2.730331, 0, 0, 0, 1, 1,
0.1454805, 1.307929, -0.3926013, 0, 0, 0, 1, 1,
0.1486211, -1.398529, 3.208726, 0, 0, 0, 1, 1,
0.1544736, 1.606061, -0.005452746, 0, 0, 0, 1, 1,
0.167846, -0.2773097, 0.3901416, 1, 1, 1, 1, 1,
0.1705087, 1.698987, 0.7581058, 1, 1, 1, 1, 1,
0.1708109, 0.3811971, 0.4898539, 1, 1, 1, 1, 1,
0.1719445, -0.5044888, 2.382343, 1, 1, 1, 1, 1,
0.1735264, -0.3834809, 2.648213, 1, 1, 1, 1, 1,
0.1737877, 1.363425, -0.3032137, 1, 1, 1, 1, 1,
0.1749124, -1.697489, 1.309712, 1, 1, 1, 1, 1,
0.1790745, 1.585202, -0.01876467, 1, 1, 1, 1, 1,
0.1799262, 0.1240631, 2.853526, 1, 1, 1, 1, 1,
0.1852716, -0.4492445, 4.320259, 1, 1, 1, 1, 1,
0.1862584, -0.9231489, 4.055509, 1, 1, 1, 1, 1,
0.188001, 1.004879, 0.5664386, 1, 1, 1, 1, 1,
0.1906456, -0.9165998, 3.018393, 1, 1, 1, 1, 1,
0.1913225, -0.3638177, 1.196173, 1, 1, 1, 1, 1,
0.1963136, -0.4652616, 2.211094, 1, 1, 1, 1, 1,
0.1989864, -0.1915632, 2.690181, 0, 0, 1, 1, 1,
0.1997702, -0.3249128, 2.801774, 1, 0, 0, 1, 1,
0.2095989, 0.06019735, 1.892001, 1, 0, 0, 1, 1,
0.210673, -1.547839, 4.112832, 1, 0, 0, 1, 1,
0.2113506, -0.8454353, 3.259953, 1, 0, 0, 1, 1,
0.2165687, 0.5838794, -0.0254401, 1, 0, 0, 1, 1,
0.2181302, -0.1032402, 3.244105, 0, 0, 0, 1, 1,
0.2211896, -0.5868154, 4.376346, 0, 0, 0, 1, 1,
0.230915, -0.9492229, 0.9181613, 0, 0, 0, 1, 1,
0.2328908, 1.992401, -0.2421459, 0, 0, 0, 1, 1,
0.2370764, 0.3852768, 0.5463495, 0, 0, 0, 1, 1,
0.239744, 1.360628, 0.2297852, 0, 0, 0, 1, 1,
0.2415825, 0.1055465, 0.378802, 0, 0, 0, 1, 1,
0.2434702, -0.06270793, 2.746699, 1, 1, 1, 1, 1,
0.2441981, 0.2231588, 1.123197, 1, 1, 1, 1, 1,
0.2489179, 1.250996, 1.880931, 1, 1, 1, 1, 1,
0.2501591, -0.752791, 2.96454, 1, 1, 1, 1, 1,
0.250583, -0.1872742, 1.3954, 1, 1, 1, 1, 1,
0.2518305, -1.890358, 1.595192, 1, 1, 1, 1, 1,
0.2519264, -0.4521438, 2.408643, 1, 1, 1, 1, 1,
0.2525467, -1.932313, 2.480572, 1, 1, 1, 1, 1,
0.2576697, 2.407503, -0.7685142, 1, 1, 1, 1, 1,
0.2595553, -0.5463637, 4.352835, 1, 1, 1, 1, 1,
0.259654, 0.3494613, -0.4095127, 1, 1, 1, 1, 1,
0.2670746, 0.2906164, 0.4877016, 1, 1, 1, 1, 1,
0.26837, 0.9400199, 0.05491098, 1, 1, 1, 1, 1,
0.2693299, 1.702689, -1.362493, 1, 1, 1, 1, 1,
0.2737887, 0.3830003, 0.1761314, 1, 1, 1, 1, 1,
0.2822775, -0.02353489, 0.4281075, 0, 0, 1, 1, 1,
0.2850634, 0.23564, 1.665794, 1, 0, 0, 1, 1,
0.2859514, -0.2449779, 2.240118, 1, 0, 0, 1, 1,
0.2863403, 0.4188257, -1.085482, 1, 0, 0, 1, 1,
0.2868182, 0.7180666, 0.206043, 1, 0, 0, 1, 1,
0.2880819, -1.11331, 3.540152, 1, 0, 0, 1, 1,
0.2906379, 0.4653737, -0.1401162, 0, 0, 0, 1, 1,
0.2951662, -1.19667, 2.575706, 0, 0, 0, 1, 1,
0.2998414, 0.7302303, -1.5445, 0, 0, 0, 1, 1,
0.3009041, -2.13237, 5.157718, 0, 0, 0, 1, 1,
0.3029435, -0.5387946, 2.015337, 0, 0, 0, 1, 1,
0.3034234, 0.2963632, -0.2992613, 0, 0, 0, 1, 1,
0.3071506, 0.5476459, 1.273495, 0, 0, 0, 1, 1,
0.3072213, 0.8144124, 1.367286, 1, 1, 1, 1, 1,
0.3080385, 0.03639691, 0.661549, 1, 1, 1, 1, 1,
0.3107893, 1.719331, 0.35148, 1, 1, 1, 1, 1,
0.3113061, -1.656426, 3.589653, 1, 1, 1, 1, 1,
0.313094, -0.04732169, 0.2512343, 1, 1, 1, 1, 1,
0.316885, -0.4197781, 3.424731, 1, 1, 1, 1, 1,
0.3253869, -0.5494097, 0.9519256, 1, 1, 1, 1, 1,
0.3269354, 0.6261817, 1.210912, 1, 1, 1, 1, 1,
0.3297097, 0.2349216, -0.5397682, 1, 1, 1, 1, 1,
0.3337037, 1.334041, 1.904559, 1, 1, 1, 1, 1,
0.3338834, -0.4956679, 3.737598, 1, 1, 1, 1, 1,
0.3359283, -2.070737, 2.01402, 1, 1, 1, 1, 1,
0.3371879, -0.4923929, 3.367157, 1, 1, 1, 1, 1,
0.3404463, -0.2473888, 1.699252, 1, 1, 1, 1, 1,
0.3424405, 0.146667, 1.651144, 1, 1, 1, 1, 1,
0.3459263, 0.580456, 1.990915, 0, 0, 1, 1, 1,
0.3470253, -0.2463237, 2.831904, 1, 0, 0, 1, 1,
0.3489681, -0.8849229, 2.807877, 1, 0, 0, 1, 1,
0.3589281, 0.2617301, 0.506286, 1, 0, 0, 1, 1,
0.3627971, 1.090087, 1.097546, 1, 0, 0, 1, 1,
0.3714922, -0.3531908, 2.591688, 1, 0, 0, 1, 1,
0.3718769, -0.1644926, -0.4964109, 0, 0, 0, 1, 1,
0.3726451, -2.414285, 2.292628, 0, 0, 0, 1, 1,
0.3747876, 0.9336578, 1.577554, 0, 0, 0, 1, 1,
0.3754521, 0.6320889, 0.06376091, 0, 0, 0, 1, 1,
0.37718, -0.9163902, 1.981062, 0, 0, 0, 1, 1,
0.3855541, -0.8683085, 2.737051, 0, 0, 0, 1, 1,
0.392189, -0.2553082, 2.034541, 0, 0, 0, 1, 1,
0.3927703, 1.474313, 0.4317651, 1, 1, 1, 1, 1,
0.3944307, -0.9248019, 2.678607, 1, 1, 1, 1, 1,
0.3951701, 0.5974118, 0.8049027, 1, 1, 1, 1, 1,
0.3953109, 0.58746, -0.6968253, 1, 1, 1, 1, 1,
0.4045947, -0.2356335, 0.3218883, 1, 1, 1, 1, 1,
0.4064904, 1.618542, 0.1772541, 1, 1, 1, 1, 1,
0.4086091, -0.2685953, 1.819604, 1, 1, 1, 1, 1,
0.4095251, -0.3862833, 0.1600009, 1, 1, 1, 1, 1,
0.4111145, -1.024164, 5.509333, 1, 1, 1, 1, 1,
0.411773, -0.479993, -0.2339465, 1, 1, 1, 1, 1,
0.4154674, 0.583991, 0.09894618, 1, 1, 1, 1, 1,
0.4177469, 0.849212, -1.101086, 1, 1, 1, 1, 1,
0.4201544, -1.396526, 3.482969, 1, 1, 1, 1, 1,
0.4236653, 0.9152026, -0.01609591, 1, 1, 1, 1, 1,
0.424247, -0.1101968, 3.176303, 1, 1, 1, 1, 1,
0.428088, -0.477697, 4.337441, 0, 0, 1, 1, 1,
0.4283448, 0.2341068, 1.694437, 1, 0, 0, 1, 1,
0.4310666, -0.288459, 2.443976, 1, 0, 0, 1, 1,
0.4320769, 0.3380747, 0.349879, 1, 0, 0, 1, 1,
0.4367855, -1.004374, 3.738387, 1, 0, 0, 1, 1,
0.4456079, -1.267054, 2.333635, 1, 0, 0, 1, 1,
0.4472634, -0.5563868, 2.005448, 0, 0, 0, 1, 1,
0.4506994, -0.3059106, 1.134635, 0, 0, 0, 1, 1,
0.4614437, -0.755855, 3.195373, 0, 0, 0, 1, 1,
0.4618923, 0.7144853, 1.143679, 0, 0, 0, 1, 1,
0.4623173, 1.663165, -0.2298138, 0, 0, 0, 1, 1,
0.4644333, 1.006334, 0.9635029, 0, 0, 0, 1, 1,
0.4664966, 0.8202001, 2.030821, 0, 0, 0, 1, 1,
0.4668703, -0.7711075, 2.490851, 1, 1, 1, 1, 1,
0.4712237, -1.054026, 2.840911, 1, 1, 1, 1, 1,
0.4731541, 0.9999039, 0.3539442, 1, 1, 1, 1, 1,
0.4746659, 0.2882897, 0.2222289, 1, 1, 1, 1, 1,
0.4761526, -0.6108171, 3.29641, 1, 1, 1, 1, 1,
0.4848779, -1.302611, 1.785502, 1, 1, 1, 1, 1,
0.4860872, 0.3845794, 0.9559779, 1, 1, 1, 1, 1,
0.4881162, 0.7059208, -0.3169764, 1, 1, 1, 1, 1,
0.4896889, -1.535662, 2.518226, 1, 1, 1, 1, 1,
0.4917206, -0.4258642, 2.486734, 1, 1, 1, 1, 1,
0.4937667, -0.3999586, 2.343304, 1, 1, 1, 1, 1,
0.4938934, -0.8298402, 1.777955, 1, 1, 1, 1, 1,
0.4973249, -0.2501671, 1.301138, 1, 1, 1, 1, 1,
0.4986735, 0.310601, 2.037248, 1, 1, 1, 1, 1,
0.4998305, 1.434457, 2.731696, 1, 1, 1, 1, 1,
0.5022639, 1.352482, -0.09096438, 0, 0, 1, 1, 1,
0.505061, -0.4322079, 2.419147, 1, 0, 0, 1, 1,
0.5080991, 0.748247, 0.3774672, 1, 0, 0, 1, 1,
0.508729, -0.9991614, 3.378356, 1, 0, 0, 1, 1,
0.5093713, 0.1389835, 0.651867, 1, 0, 0, 1, 1,
0.5117931, 0.5955302, -0.259807, 1, 0, 0, 1, 1,
0.5133218, 1.150245, -0.3823948, 0, 0, 0, 1, 1,
0.5163747, 2.127259, 1.618191, 0, 0, 0, 1, 1,
0.5192387, -0.5216333, 1.742512, 0, 0, 0, 1, 1,
0.5233259, 0.6422184, 1.40725, 0, 0, 0, 1, 1,
0.5253551, -0.9665606, 2.020738, 0, 0, 0, 1, 1,
0.5273247, -0.9218214, 3.690578, 0, 0, 0, 1, 1,
0.530279, -0.5917356, 2.71887, 0, 0, 0, 1, 1,
0.5315946, 0.3056578, 2.317121, 1, 1, 1, 1, 1,
0.532671, -1.520295, 2.318235, 1, 1, 1, 1, 1,
0.5444518, -0.7821428, 1.998964, 1, 1, 1, 1, 1,
0.5477045, 0.8157982, 0.2177818, 1, 1, 1, 1, 1,
0.5479569, 0.6579567, 0.8290007, 1, 1, 1, 1, 1,
0.5494751, 0.5322956, 0.592522, 1, 1, 1, 1, 1,
0.5501897, 0.5129558, 1.438155, 1, 1, 1, 1, 1,
0.5591658, -0.2833545, 1.679756, 1, 1, 1, 1, 1,
0.5634564, -0.963879, 3.487188, 1, 1, 1, 1, 1,
0.5663755, -1.084862, 2.708408, 1, 1, 1, 1, 1,
0.5672069, 0.1674392, 2.768538, 1, 1, 1, 1, 1,
0.5710225, -0.3418916, 1.638117, 1, 1, 1, 1, 1,
0.5713075, 1.410785, 0.6780022, 1, 1, 1, 1, 1,
0.5747653, -0.3751255, 2.222741, 1, 1, 1, 1, 1,
0.5771641, 0.174015, -0.1718016, 1, 1, 1, 1, 1,
0.5810996, 0.6611235, -1.090536, 0, 0, 1, 1, 1,
0.5825405, -0.8800417, 1.333079, 1, 0, 0, 1, 1,
0.5835614, -1.274262, 4.260152, 1, 0, 0, 1, 1,
0.5889185, -0.1361842, 2.19891, 1, 0, 0, 1, 1,
0.5893353, -0.8658528, 2.574192, 1, 0, 0, 1, 1,
0.6078938, 0.01599054, 1.59018, 1, 0, 0, 1, 1,
0.6083732, -0.0355731, 3.179658, 0, 0, 0, 1, 1,
0.6140105, -0.4393483, 0.3541473, 0, 0, 0, 1, 1,
0.614547, 1.706239, 1.628767, 0, 0, 0, 1, 1,
0.6161909, -1.572688, 1.305375, 0, 0, 0, 1, 1,
0.6190095, 1.151843, 1.105404, 0, 0, 0, 1, 1,
0.6200367, 1.546029, 0.2167504, 0, 0, 0, 1, 1,
0.6210369, -0.593876, 2.14711, 0, 0, 0, 1, 1,
0.6296067, -0.08813301, 1.668235, 1, 1, 1, 1, 1,
0.6440753, 0.3996699, -0.3750604, 1, 1, 1, 1, 1,
0.6445503, -2.405826, 3.206084, 1, 1, 1, 1, 1,
0.644886, -2.107924, 5.048525, 1, 1, 1, 1, 1,
0.6453307, -1.239868, 4.002772, 1, 1, 1, 1, 1,
0.6599821, 0.5338366, 0.4710165, 1, 1, 1, 1, 1,
0.661294, 0.3600208, 1.713195, 1, 1, 1, 1, 1,
0.6622376, 1.284893, 0.1961558, 1, 1, 1, 1, 1,
0.6643558, 3.750692, -0.1867215, 1, 1, 1, 1, 1,
0.6683213, 0.6339336, 0.01427637, 1, 1, 1, 1, 1,
0.6691486, 0.5964667, 2.467955, 1, 1, 1, 1, 1,
0.6692507, -1.353485, 3.311771, 1, 1, 1, 1, 1,
0.6714231, 1.067524, 1.618904, 1, 1, 1, 1, 1,
0.6737267, 1.395188, -0.05703126, 1, 1, 1, 1, 1,
0.6742414, -0.09836651, -0.7770253, 1, 1, 1, 1, 1,
0.6805444, -1.143207, 2.005676, 0, 0, 1, 1, 1,
0.6808822, -1.077002, 1.654146, 1, 0, 0, 1, 1,
0.6817232, 1.509519, -1.042625, 1, 0, 0, 1, 1,
0.6833372, -1.124531, 3.957973, 1, 0, 0, 1, 1,
0.6880279, 1.417943, -0.5269518, 1, 0, 0, 1, 1,
0.6956262, 1.822703, 1.141415, 1, 0, 0, 1, 1,
0.6957308, 0.6646124, 1.45015, 0, 0, 0, 1, 1,
0.7000756, 0.7049131, 2.544159, 0, 0, 0, 1, 1,
0.7011839, 0.3277176, 1.488168, 0, 0, 0, 1, 1,
0.7090574, -1.406273, 2.967158, 0, 0, 0, 1, 1,
0.7091021, 0.3631606, -0.929023, 0, 0, 0, 1, 1,
0.716024, -0.1117143, 0.09056318, 0, 0, 0, 1, 1,
0.716956, -1.461111, 1.39184, 0, 0, 0, 1, 1,
0.7202047, 2.38882, -0.7688473, 1, 1, 1, 1, 1,
0.7212976, 0.02977251, 2.494277, 1, 1, 1, 1, 1,
0.7242255, -2.288665, 2.675222, 1, 1, 1, 1, 1,
0.7250325, -1.99296, 2.821888, 1, 1, 1, 1, 1,
0.7254416, -1.332943, 0.5946826, 1, 1, 1, 1, 1,
0.7304698, 1.269236, 1.074878, 1, 1, 1, 1, 1,
0.7330142, -0.5968818, 4.374977, 1, 1, 1, 1, 1,
0.7338256, -1.594096, 3.953321, 1, 1, 1, 1, 1,
0.7412187, 0.6206776, 1.332485, 1, 1, 1, 1, 1,
0.7442989, 0.5842009, 1.563147, 1, 1, 1, 1, 1,
0.7448747, -0.03742024, 0.5403302, 1, 1, 1, 1, 1,
0.7482514, 0.08435407, 1.380661, 1, 1, 1, 1, 1,
0.7536539, -0.2993126, 2.837817, 1, 1, 1, 1, 1,
0.7543369, -0.1964093, 1.066294, 1, 1, 1, 1, 1,
0.7587784, -0.3949482, 4.086718, 1, 1, 1, 1, 1,
0.770137, -1.413546, 1.997128, 0, 0, 1, 1, 1,
0.7739103, 0.6299945, -0.9825402, 1, 0, 0, 1, 1,
0.7799631, 1.7126, 0.04634627, 1, 0, 0, 1, 1,
0.7823053, 1.513516, 1.253796, 1, 0, 0, 1, 1,
0.7857531, -0.1268129, 2.021217, 1, 0, 0, 1, 1,
0.8046469, 0.7363799, -0.7040084, 1, 0, 0, 1, 1,
0.816116, 0.2108617, 0.8754728, 0, 0, 0, 1, 1,
0.8162904, 0.6306373, 1.062907, 0, 0, 0, 1, 1,
0.8259721, 1.874822, 0.5891387, 0, 0, 0, 1, 1,
0.8314267, -0.3421946, 0.9162802, 0, 0, 0, 1, 1,
0.8340215, -0.3960573, 0.6277177, 0, 0, 0, 1, 1,
0.8375091, 2.446712, 0.1207327, 0, 0, 0, 1, 1,
0.8406366, 0.4139771, 1.521049, 0, 0, 0, 1, 1,
0.8406748, 0.896299, -0.6287646, 1, 1, 1, 1, 1,
0.8424332, -0.1269258, 2.179599, 1, 1, 1, 1, 1,
0.847791, -0.8627197, 2.501, 1, 1, 1, 1, 1,
0.8515067, 0.5801111, -1.503809, 1, 1, 1, 1, 1,
0.8606819, 0.3088496, 4.21043, 1, 1, 1, 1, 1,
0.8689632, -1.044069, 3.561704, 1, 1, 1, 1, 1,
0.8767735, 0.2506105, 0.4711675, 1, 1, 1, 1, 1,
0.8814012, -0.8091636, 1.759612, 1, 1, 1, 1, 1,
0.882359, 0.3909258, 2.175226, 1, 1, 1, 1, 1,
0.8850449, -1.438229, 2.692116, 1, 1, 1, 1, 1,
0.8858669, -1.810442, 2.394617, 1, 1, 1, 1, 1,
0.886699, -0.3609832, 3.293904, 1, 1, 1, 1, 1,
0.8878493, 0.1302265, 2.547, 1, 1, 1, 1, 1,
0.8934509, 0.1218441, 1.407872, 1, 1, 1, 1, 1,
0.898779, 0.3707192, 0.9045256, 1, 1, 1, 1, 1,
0.9038352, 1.302298, 1.623924, 0, 0, 1, 1, 1,
0.9108426, -0.05319325, 1.601222, 1, 0, 0, 1, 1,
0.9124202, -1.927706, 2.328071, 1, 0, 0, 1, 1,
0.9261935, 1.530294, -0.1687272, 1, 0, 0, 1, 1,
0.9286481, 0.007050535, 1.897211, 1, 0, 0, 1, 1,
0.9290721, 1.340181, 0.8542537, 1, 0, 0, 1, 1,
0.9290875, 0.03799167, 0.4453245, 0, 0, 0, 1, 1,
0.934623, 0.2410054, 0.0476507, 0, 0, 0, 1, 1,
0.9368548, -0.8745189, 3.203938, 0, 0, 0, 1, 1,
0.9473314, 0.5657263, 4.08795, 0, 0, 0, 1, 1,
0.9526511, -0.8450035, 0.2764061, 0, 0, 0, 1, 1,
0.9576967, 0.5417886, 1.45877, 0, 0, 0, 1, 1,
0.9577039, 0.3250492, 2.073261, 0, 0, 0, 1, 1,
0.9585171, 1.75034, -0.1537492, 1, 1, 1, 1, 1,
0.9594336, -0.3668987, 2.85796, 1, 1, 1, 1, 1,
0.9595638, -1.02958, 4.759398, 1, 1, 1, 1, 1,
0.9673783, 1.493756, 0.8134299, 1, 1, 1, 1, 1,
0.971804, -0.4597562, 2.506489, 1, 1, 1, 1, 1,
0.9723397, -0.9120327, 2.270847, 1, 1, 1, 1, 1,
0.9725953, -0.3483965, 2.017257, 1, 1, 1, 1, 1,
0.9751778, -0.6152173, 3.161172, 1, 1, 1, 1, 1,
0.9762142, 0.5464025, 1.388765, 1, 1, 1, 1, 1,
0.9763638, -0.5396467, 1.695502, 1, 1, 1, 1, 1,
0.9790576, -0.8806502, 3.4191, 1, 1, 1, 1, 1,
0.9848913, -2.135879, 2.443416, 1, 1, 1, 1, 1,
0.9907142, -0.9071139, 2.11709, 1, 1, 1, 1, 1,
0.9949384, -1.606229, 3.581675, 1, 1, 1, 1, 1,
0.9995092, -1.0578, 4.034613, 1, 1, 1, 1, 1,
1.001689, -1.057528, 3.012884, 0, 0, 1, 1, 1,
1.009976, -0.5809953, 1.059637, 1, 0, 0, 1, 1,
1.01173, -1.892066, 3.697673, 1, 0, 0, 1, 1,
1.011985, 1.352619, 1.63538, 1, 0, 0, 1, 1,
1.017343, -0.1956787, 1.138338, 1, 0, 0, 1, 1,
1.02371, -0.1953932, 0.3499382, 1, 0, 0, 1, 1,
1.029224, 1.891074, -0.4827346, 0, 0, 0, 1, 1,
1.045848, -0.715767, 3.52088, 0, 0, 0, 1, 1,
1.047492, -0.5794351, 1.988921, 0, 0, 0, 1, 1,
1.047741, 0.906849, 0.6513978, 0, 0, 0, 1, 1,
1.04972, 0.8537465, 0.1035308, 0, 0, 0, 1, 1,
1.053345, -0.7182679, 0.577042, 0, 0, 0, 1, 1,
1.053484, 1.568349, -0.4265517, 0, 0, 0, 1, 1,
1.053593, 0.7606832, 2.304953, 1, 1, 1, 1, 1,
1.055299, 0.04184528, 2.562281, 1, 1, 1, 1, 1,
1.055834, -2.410151, 2.688732, 1, 1, 1, 1, 1,
1.056476, 1.090924, -1.035967, 1, 1, 1, 1, 1,
1.058549, 0.6427798, 2.125892, 1, 1, 1, 1, 1,
1.064268, -0.221379, 1.351527, 1, 1, 1, 1, 1,
1.066669, 0.05451335, 2.560269, 1, 1, 1, 1, 1,
1.072178, -0.8490217, 3.266512, 1, 1, 1, 1, 1,
1.075288, -0.1184108, 0.3302549, 1, 1, 1, 1, 1,
1.08514, 0.6615433, 1.837485, 1, 1, 1, 1, 1,
1.085843, 1.958982, 1.238429, 1, 1, 1, 1, 1,
1.096393, 1.51412, 1.021931, 1, 1, 1, 1, 1,
1.100253, -0.8214569, 3.025599, 1, 1, 1, 1, 1,
1.100354, 1.320505, 1.048217, 1, 1, 1, 1, 1,
1.106599, 0.359598, 1.037551, 1, 1, 1, 1, 1,
1.109397, 1.421562, 0.02267706, 0, 0, 1, 1, 1,
1.113855, -0.7936729, 2.490639, 1, 0, 0, 1, 1,
1.122787, -0.9634386, 2.161123, 1, 0, 0, 1, 1,
1.127738, -0.04479826, 1.476593, 1, 0, 0, 1, 1,
1.131039, 0.3640318, 1.38312, 1, 0, 0, 1, 1,
1.135192, -0.2211065, 3.340383, 1, 0, 0, 1, 1,
1.1391, -0.3753864, 2.724218, 0, 0, 0, 1, 1,
1.145639, -1.340675, 0.3364531, 0, 0, 0, 1, 1,
1.146641, 0.1360942, 1.225233, 0, 0, 0, 1, 1,
1.14993, 0.8711613, 1.384562, 0, 0, 0, 1, 1,
1.159761, -1.61911, 2.165563, 0, 0, 0, 1, 1,
1.161441, 1.145767, 0.7311173, 0, 0, 0, 1, 1,
1.164743, 0.9520682, 2.644741, 0, 0, 0, 1, 1,
1.167742, -0.7318931, 1.661281, 1, 1, 1, 1, 1,
1.169232, -0.1947523, 3.217915, 1, 1, 1, 1, 1,
1.175472, -0.526577, 2.58598, 1, 1, 1, 1, 1,
1.17881, 2.15973, -1.16542, 1, 1, 1, 1, 1,
1.181303, -0.476407, 1.054259, 1, 1, 1, 1, 1,
1.181956, -0.695492, 1.341471, 1, 1, 1, 1, 1,
1.186807, -1.972667, 4.077889, 1, 1, 1, 1, 1,
1.187933, -1.628145, 3.319484, 1, 1, 1, 1, 1,
1.189051, 1.349359, 0.5474972, 1, 1, 1, 1, 1,
1.194552, -2.047279, 2.87364, 1, 1, 1, 1, 1,
1.194745, -0.03722927, 0.02270935, 1, 1, 1, 1, 1,
1.197106, 0.8271423, 2.021099, 1, 1, 1, 1, 1,
1.20023, 0.1136456, 2.900784, 1, 1, 1, 1, 1,
1.205204, -1.383172, 0.2907642, 1, 1, 1, 1, 1,
1.217618, -1.533752, 2.900266, 1, 1, 1, 1, 1,
1.223691, -0.66975, 1.337295, 0, 0, 1, 1, 1,
1.226602, -0.2091616, 1.571479, 1, 0, 0, 1, 1,
1.229153, -1.198596, 3.807365, 1, 0, 0, 1, 1,
1.233509, -1.627452, 2.052892, 1, 0, 0, 1, 1,
1.260735, 0.6388153, 0.9199702, 1, 0, 0, 1, 1,
1.277908, -1.010029, 2.893466, 1, 0, 0, 1, 1,
1.280262, 0.3812106, 0.5769146, 0, 0, 0, 1, 1,
1.288386, -0.2363562, 1.246847, 0, 0, 0, 1, 1,
1.290704, -1.720399, 2.773193, 0, 0, 0, 1, 1,
1.291433, -1.522921, 2.501498, 0, 0, 0, 1, 1,
1.292925, -0.6126915, 2.545995, 0, 0, 0, 1, 1,
1.300085, 0.9592097, 0.3545121, 0, 0, 0, 1, 1,
1.301655, 1.179613, 2.277123, 0, 0, 0, 1, 1,
1.309097, -0.9594866, 2.114685, 1, 1, 1, 1, 1,
1.320417, 0.3787976, 1.72321, 1, 1, 1, 1, 1,
1.322227, -0.3121946, 2.070957, 1, 1, 1, 1, 1,
1.332615, 1.70383, -0.7720336, 1, 1, 1, 1, 1,
1.333672, -0.61147, 2.850303, 1, 1, 1, 1, 1,
1.346115, 0.2864704, 1.17163, 1, 1, 1, 1, 1,
1.35032, 0.4069985, 1.951684, 1, 1, 1, 1, 1,
1.355639, -0.8984371, 2.122655, 1, 1, 1, 1, 1,
1.365145, 0.7457708, 0.9603947, 1, 1, 1, 1, 1,
1.366175, 0.3120964, 2.002544, 1, 1, 1, 1, 1,
1.36811, 1.239132, -0.3983728, 1, 1, 1, 1, 1,
1.370995, -0.1617323, 1.143434, 1, 1, 1, 1, 1,
1.371275, -0.8309911, 1.613674, 1, 1, 1, 1, 1,
1.384687, -0.6433854, 2.987566, 1, 1, 1, 1, 1,
1.385619, 0.9557017, -1.32917, 1, 1, 1, 1, 1,
1.394907, -1.451504, 2.209326, 0, 0, 1, 1, 1,
1.394965, -0.3728667, 2.33847, 1, 0, 0, 1, 1,
1.402059, 0.435859, 2.37702, 1, 0, 0, 1, 1,
1.403727, 0.2924505, 0.4880091, 1, 0, 0, 1, 1,
1.405571, 0.2032457, 0.9632858, 1, 0, 0, 1, 1,
1.411143, 1.106064, 1.508471, 1, 0, 0, 1, 1,
1.414169, 0.1823792, 0.9075552, 0, 0, 0, 1, 1,
1.433375, 0.5015414, 3.337399, 0, 0, 0, 1, 1,
1.43506, -0.7159677, 2.91837, 0, 0, 0, 1, 1,
1.436702, 0.3215894, -0.4498559, 0, 0, 0, 1, 1,
1.444445, -0.7095343, 1.728542, 0, 0, 0, 1, 1,
1.451228, -0.08465414, 0.8792829, 0, 0, 0, 1, 1,
1.455739, -0.2690935, 1.238095, 0, 0, 0, 1, 1,
1.456518, 0.424994, 1.616374, 1, 1, 1, 1, 1,
1.460038, -0.053728, 1.050361, 1, 1, 1, 1, 1,
1.465061, 0.4418488, 3.434537, 1, 1, 1, 1, 1,
1.473781, 0.5440234, -0.3117006, 1, 1, 1, 1, 1,
1.487216, -1.18673, 2.471991, 1, 1, 1, 1, 1,
1.542651, 0.081021, 1.04147, 1, 1, 1, 1, 1,
1.550447, -0.8472275, 1.219416, 1, 1, 1, 1, 1,
1.560055, 0.2296782, 1.26911, 1, 1, 1, 1, 1,
1.576411, 2.160473, 2.155479, 1, 1, 1, 1, 1,
1.576692, 1.109845, -0.6736832, 1, 1, 1, 1, 1,
1.619872, -0.1251142, -1.03866, 1, 1, 1, 1, 1,
1.624677, 0.2239891, 1.238507, 1, 1, 1, 1, 1,
1.637871, 0.1975885, 1.92964, 1, 1, 1, 1, 1,
1.641759, 0.6312675, 0.2690728, 1, 1, 1, 1, 1,
1.64244, -0.8474084, 3.196488, 1, 1, 1, 1, 1,
1.647339, 0.5851402, -2.043786, 0, 0, 1, 1, 1,
1.662864, -0.2362696, 2.331905, 1, 0, 0, 1, 1,
1.676092, -1.947928, 3.002094, 1, 0, 0, 1, 1,
1.677158, 0.07304935, 2.224047, 1, 0, 0, 1, 1,
1.713545, -0.2621337, 1.653984, 1, 0, 0, 1, 1,
1.755699, -0.5603582, 2.412432, 1, 0, 0, 1, 1,
1.767998, 1.059561, 0.9696984, 0, 0, 0, 1, 1,
1.786828, -0.687901, 3.506314, 0, 0, 0, 1, 1,
1.798582, 0.4243616, 1.185666, 0, 0, 0, 1, 1,
1.802158, -0.1837367, 1.63216, 0, 0, 0, 1, 1,
1.8129, 0.7522852, 3.148211, 0, 0, 0, 1, 1,
1.835084, -1.284865, 1.456694, 0, 0, 0, 1, 1,
1.835402, -0.4376275, 2.149406, 0, 0, 0, 1, 1,
1.908627, -0.8072951, 1.815617, 1, 1, 1, 1, 1,
1.918675, 1.69755, 0.6831387, 1, 1, 1, 1, 1,
1.947503, 0.576462, -0.8257384, 1, 1, 1, 1, 1,
1.95307, 0.3268608, 0.9498292, 1, 1, 1, 1, 1,
1.988783, 0.6201991, 1.036184, 1, 1, 1, 1, 1,
2.022579, 0.134782, 1.464408, 1, 1, 1, 1, 1,
2.025778, -0.1526877, 0.7569447, 1, 1, 1, 1, 1,
2.028801, -0.2924125, 1.224945, 1, 1, 1, 1, 1,
2.04024, 1.230243, 2.224079, 1, 1, 1, 1, 1,
2.066371, 0.3942997, 0.9086275, 1, 1, 1, 1, 1,
2.067343, -0.5313702, 0.8944095, 1, 1, 1, 1, 1,
2.079405, -0.1347788, 3.075037, 1, 1, 1, 1, 1,
2.081481, 0.5331482, 3.066286, 1, 1, 1, 1, 1,
2.087185, -0.1974947, 1.087893, 1, 1, 1, 1, 1,
2.094052, 1.417641, 2.109257, 1, 1, 1, 1, 1,
2.137048, 1.249771, 0.9119082, 0, 0, 1, 1, 1,
2.137802, -1.108231, 2.779094, 1, 0, 0, 1, 1,
2.13884, 0.5555691, 1.189641, 1, 0, 0, 1, 1,
2.168826, 1.650958, 1.718683, 1, 0, 0, 1, 1,
2.208939, -0.7643813, 1.845149, 1, 0, 0, 1, 1,
2.225902, 0.3371855, 2.057137, 1, 0, 0, 1, 1,
2.241205, 0.5430632, 0.9651977, 0, 0, 0, 1, 1,
2.284337, -1.219794, 2.570031, 0, 0, 0, 1, 1,
2.314821, 1.425129, 1.319469, 0, 0, 0, 1, 1,
2.345752, 3.164449, 0.3707452, 0, 0, 0, 1, 1,
2.353777, 1.508246, 1.827988, 0, 0, 0, 1, 1,
2.406256, -1.56939, 2.285917, 0, 0, 0, 1, 1,
2.422795, 2.70416, 1.682816, 0, 0, 0, 1, 1,
2.425906, -0.2968667, 1.169159, 1, 1, 1, 1, 1,
2.446009, 0.04480765, 1.975919, 1, 1, 1, 1, 1,
2.469425, -0.6768826, 1.512648, 1, 1, 1, 1, 1,
2.494645, -0.4319487, 0.5618163, 1, 1, 1, 1, 1,
2.571487, 0.8869505, 0.2008712, 1, 1, 1, 1, 1,
2.623919, -0.9776163, 2.492131, 1, 1, 1, 1, 1,
2.6977, 0.0323094, 0.3425376, 1, 1, 1, 1, 1
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
var radius = 9.899566;
var distance = 34.77181;
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
mvMatrix.translate( 0.4149656, -0.2048728, 0.07962847 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.77181);
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
