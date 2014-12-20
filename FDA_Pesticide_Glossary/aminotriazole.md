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
-3.075311, -1.839886, -2.610221, 1, 0, 0, 1,
-2.722121, -0.9666883, -1.310827, 1, 0.007843138, 0, 1,
-2.61288, -0.3693875, 0.03783425, 1, 0.01176471, 0, 1,
-2.603975, 0.5372369, -3.604228, 1, 0.01960784, 0, 1,
-2.521876, -0.4503152, -2.003524, 1, 0.02352941, 0, 1,
-2.464457, -0.002930555, -1.871281, 1, 0.03137255, 0, 1,
-2.423704, 0.9766664, 0.4626074, 1, 0.03529412, 0, 1,
-2.351755, -0.05920003, -3.525974, 1, 0.04313726, 0, 1,
-2.349525, -0.1212949, -3.359917, 1, 0.04705882, 0, 1,
-2.2361, -0.568005, -1.117937, 1, 0.05490196, 0, 1,
-2.219584, -0.07150973, -0.9530921, 1, 0.05882353, 0, 1,
-2.192083, 2.456804, -0.2338995, 1, 0.06666667, 0, 1,
-2.18928, -1.442079, -1.640194, 1, 0.07058824, 0, 1,
-2.169816, 0.8567253, -0.4367036, 1, 0.07843138, 0, 1,
-2.16475, -0.338992, -1.406043, 1, 0.08235294, 0, 1,
-2.160809, -0.859211, -0.3571964, 1, 0.09019608, 0, 1,
-2.145382, 1.065665, -0.02784046, 1, 0.09411765, 0, 1,
-2.114641, 0.4148661, -2.414258, 1, 0.1019608, 0, 1,
-2.109309, -1.784368, -1.946697, 1, 0.1098039, 0, 1,
-2.051211, 1.155491, -2.376015, 1, 0.1137255, 0, 1,
-2.031228, -0.2108852, -2.115055, 1, 0.1215686, 0, 1,
-1.980104, -0.6617443, -0.9747615, 1, 0.1254902, 0, 1,
-1.973849, -1.343307, -2.905032, 1, 0.1333333, 0, 1,
-1.970116, 0.3532405, -2.720018, 1, 0.1372549, 0, 1,
-1.954599, 0.1646553, -1.065408, 1, 0.145098, 0, 1,
-1.934464, 1.198541, -1.010725, 1, 0.1490196, 0, 1,
-1.902327, 0.484344, -1.047033, 1, 0.1568628, 0, 1,
-1.902113, 1.009398, -1.313693, 1, 0.1607843, 0, 1,
-1.894885, -0.1725816, -1.887399, 1, 0.1686275, 0, 1,
-1.893672, -0.7752096, -0.6472159, 1, 0.172549, 0, 1,
-1.888787, -0.2485767, -1.558996, 1, 0.1803922, 0, 1,
-1.863612, -0.1054171, -0.9657657, 1, 0.1843137, 0, 1,
-1.847777, -0.6705808, -0.7904273, 1, 0.1921569, 0, 1,
-1.844176, -0.2051641, -0.9227817, 1, 0.1960784, 0, 1,
-1.8201, -0.5006345, -3.150563, 1, 0.2039216, 0, 1,
-1.810058, -0.0834305, -3.125173, 1, 0.2117647, 0, 1,
-1.798487, 0.8104593, -3.122901, 1, 0.2156863, 0, 1,
-1.781448, 0.2661273, -0.4857046, 1, 0.2235294, 0, 1,
-1.764092, -0.01617534, -1.668212, 1, 0.227451, 0, 1,
-1.72883, -0.3025955, -1.359655, 1, 0.2352941, 0, 1,
-1.723738, -0.1565665, -1.960773, 1, 0.2392157, 0, 1,
-1.708458, -1.800925, -2.635315, 1, 0.2470588, 0, 1,
-1.70241, 0.05969871, -1.988747, 1, 0.2509804, 0, 1,
-1.699042, -0.1986139, -1.228959, 1, 0.2588235, 0, 1,
-1.682671, 0.8919416, -1.691238, 1, 0.2627451, 0, 1,
-1.676328, -1.107141, -3.970022, 1, 0.2705882, 0, 1,
-1.662424, 1.978076, -1.154934, 1, 0.2745098, 0, 1,
-1.647683, 1.103747, -0.6724381, 1, 0.282353, 0, 1,
-1.636642, 0.6815004, 1.203496, 1, 0.2862745, 0, 1,
-1.621881, 0.5958144, -0.8263524, 1, 0.2941177, 0, 1,
-1.616851, -1.620401, -2.018099, 1, 0.3019608, 0, 1,
-1.607359, -0.4798604, -2.215751, 1, 0.3058824, 0, 1,
-1.592698, -0.5150681, -0.796169, 1, 0.3137255, 0, 1,
-1.57989, 0.3637981, -2.151947, 1, 0.3176471, 0, 1,
-1.570717, 0.7412164, -0.6939921, 1, 0.3254902, 0, 1,
-1.570677, 1.803627, 1.325997, 1, 0.3294118, 0, 1,
-1.561728, 1.069291, -2.728315, 1, 0.3372549, 0, 1,
-1.561144, -0.6628482, -1.489886, 1, 0.3411765, 0, 1,
-1.549591, -0.3116888, -1.33963, 1, 0.3490196, 0, 1,
-1.52277, 1.728057, 0.4461369, 1, 0.3529412, 0, 1,
-1.519609, -0.2419014, -0.3530329, 1, 0.3607843, 0, 1,
-1.502313, 0.7618582, -1.215194, 1, 0.3647059, 0, 1,
-1.464824, 0.05874752, -1.338257, 1, 0.372549, 0, 1,
-1.445059, -0.05374356, -2.888137, 1, 0.3764706, 0, 1,
-1.445008, -0.7971091, -2.868297, 1, 0.3843137, 0, 1,
-1.436581, 1.192244, -0.4920248, 1, 0.3882353, 0, 1,
-1.427118, -0.4658338, -1.781836, 1, 0.3960784, 0, 1,
-1.425148, 2.688829, 0.3773987, 1, 0.4039216, 0, 1,
-1.419497, 1.635372, -1.765757, 1, 0.4078431, 0, 1,
-1.415825, 0.01357579, -1.76762, 1, 0.4156863, 0, 1,
-1.404492, -0.5531694, -2.796396, 1, 0.4196078, 0, 1,
-1.402388, 0.3882128, -0.6753964, 1, 0.427451, 0, 1,
-1.402118, 0.8781935, -1.699306, 1, 0.4313726, 0, 1,
-1.387647, 0.9570867, -1.322606, 1, 0.4392157, 0, 1,
-1.379838, 0.7761707, -1.550509, 1, 0.4431373, 0, 1,
-1.371221, 0.2104964, -0.8243407, 1, 0.4509804, 0, 1,
-1.356614, -1.509393, -0.5642605, 1, 0.454902, 0, 1,
-1.345614, -0.9301831, -2.098394, 1, 0.4627451, 0, 1,
-1.340937, -2.831884, -2.469207, 1, 0.4666667, 0, 1,
-1.332097, -0.2502212, -1.616381, 1, 0.4745098, 0, 1,
-1.324218, -1.375168, -0.2777984, 1, 0.4784314, 0, 1,
-1.323064, -1.321391, -2.944315, 1, 0.4862745, 0, 1,
-1.316442, 0.09431902, -0.2273515, 1, 0.4901961, 0, 1,
-1.299526, 0.1043674, -2.12423, 1, 0.4980392, 0, 1,
-1.297855, 0.07256324, -1.279623, 1, 0.5058824, 0, 1,
-1.293019, 0.4166269, -1.192075, 1, 0.509804, 0, 1,
-1.286559, 0.7012129, 0.2818076, 1, 0.5176471, 0, 1,
-1.282156, 0.2003032, -2.170656, 1, 0.5215687, 0, 1,
-1.282057, -0.503346, -0.05351921, 1, 0.5294118, 0, 1,
-1.274744, 1.376725, 0.8397697, 1, 0.5333334, 0, 1,
-1.274035, -0.8924779, -1.751682, 1, 0.5411765, 0, 1,
-1.273286, 1.657512, -0.6148903, 1, 0.5450981, 0, 1,
-1.27079, -2.11625, -1.942797, 1, 0.5529412, 0, 1,
-1.269727, -0.2843524, -0.5777156, 1, 0.5568628, 0, 1,
-1.267617, -0.5042739, -3.660244, 1, 0.5647059, 0, 1,
-1.262295, 0.9329191, -2.418292, 1, 0.5686275, 0, 1,
-1.26102, 0.2231001, -2.075363, 1, 0.5764706, 0, 1,
-1.257615, -0.745683, -2.234637, 1, 0.5803922, 0, 1,
-1.255332, 0.7549954, 0.3101458, 1, 0.5882353, 0, 1,
-1.250538, -0.9660885, -1.579245, 1, 0.5921569, 0, 1,
-1.248957, -0.002986152, -2.629618, 1, 0.6, 0, 1,
-1.246207, 0.5994633, -2.418675, 1, 0.6078432, 0, 1,
-1.245546, 0.8440275, 0.5913659, 1, 0.6117647, 0, 1,
-1.245335, -2.02087, -1.442974, 1, 0.6196079, 0, 1,
-1.243285, -0.7237976, -2.431452, 1, 0.6235294, 0, 1,
-1.241347, 0.1710999, -0.5902109, 1, 0.6313726, 0, 1,
-1.240892, 1.21152, -0.1650286, 1, 0.6352941, 0, 1,
-1.240362, -0.504132, -1.389965, 1, 0.6431373, 0, 1,
-1.231229, -0.3674948, -2.407547, 1, 0.6470588, 0, 1,
-1.230078, 0.7642107, -1.405967, 1, 0.654902, 0, 1,
-1.223214, 0.5108094, -0.3806736, 1, 0.6588235, 0, 1,
-1.216801, 0.01072899, -1.244427, 1, 0.6666667, 0, 1,
-1.208028, 0.5082442, -1.840581, 1, 0.6705883, 0, 1,
-1.207111, -1.130462, -2.75518, 1, 0.6784314, 0, 1,
-1.206715, -0.2256843, -1.713782, 1, 0.682353, 0, 1,
-1.206294, -1.234254, -2.988047, 1, 0.6901961, 0, 1,
-1.194893, 0.4296789, -1.810514, 1, 0.6941177, 0, 1,
-1.193434, 1.924196, 0.8884045, 1, 0.7019608, 0, 1,
-1.188421, 0.2703529, -0.2553516, 1, 0.7098039, 0, 1,
-1.185741, 0.04523246, -1.139547, 1, 0.7137255, 0, 1,
-1.183332, 1.170072, -1.62329, 1, 0.7215686, 0, 1,
-1.181315, 0.2250719, -1.207675, 1, 0.7254902, 0, 1,
-1.180931, -0.3971016, -1.988983, 1, 0.7333333, 0, 1,
-1.180405, -0.1255826, -0.2675947, 1, 0.7372549, 0, 1,
-1.172606, -1.965304, -2.696977, 1, 0.7450981, 0, 1,
-1.170129, 0.03025739, -1.633286, 1, 0.7490196, 0, 1,
-1.157053, -0.9953884, -1.28091, 1, 0.7568628, 0, 1,
-1.146318, -1.514935, -4.616189, 1, 0.7607843, 0, 1,
-1.144538, 1.193294, -0.4419466, 1, 0.7686275, 0, 1,
-1.141086, 0.5947025, 0.3688538, 1, 0.772549, 0, 1,
-1.137327, 0.04561714, -3.13851, 1, 0.7803922, 0, 1,
-1.130047, 1.71374, -1.323027, 1, 0.7843137, 0, 1,
-1.124584, 0.1387157, 0.8954433, 1, 0.7921569, 0, 1,
-1.118454, -0.0891801, -1.297348, 1, 0.7960784, 0, 1,
-1.113716, 1.412137, -1.528559, 1, 0.8039216, 0, 1,
-1.11107, 0.5745057, -1.962713, 1, 0.8117647, 0, 1,
-1.099086, -0.1455913, -2.307817, 1, 0.8156863, 0, 1,
-1.096156, 1.081427, -0.5597349, 1, 0.8235294, 0, 1,
-1.091336, -0.1217237, -1.989262, 1, 0.827451, 0, 1,
-1.090811, -1.835088, -2.526887, 1, 0.8352941, 0, 1,
-1.088743, 0.8752173, -2.364559, 1, 0.8392157, 0, 1,
-1.08768, -0.67975, -0.8116091, 1, 0.8470588, 0, 1,
-1.083578, 0.6810811, -1.619629, 1, 0.8509804, 0, 1,
-1.081041, 0.1042271, -1.592679, 1, 0.8588235, 0, 1,
-1.079494, -1.576861, -2.195184, 1, 0.8627451, 0, 1,
-1.077956, -1.219237, -1.183837, 1, 0.8705882, 0, 1,
-1.069584, 0.6607938, -1.401336, 1, 0.8745098, 0, 1,
-1.058296, -0.5838278, -1.45744, 1, 0.8823529, 0, 1,
-1.049223, -2.302687, -3.113362, 1, 0.8862745, 0, 1,
-1.045855, 0.691346, -3.234148, 1, 0.8941177, 0, 1,
-1.042643, 1.137306, -0.01700081, 1, 0.8980392, 0, 1,
-1.030072, 0.9347594, -2.462426, 1, 0.9058824, 0, 1,
-1.025479, -1.539594, -3.598338, 1, 0.9137255, 0, 1,
-1.024971, 0.0864078, -2.422082, 1, 0.9176471, 0, 1,
-1.016984, 1.019758, -2.15069, 1, 0.9254902, 0, 1,
-1.010836, 0.6722707, -1.833609, 1, 0.9294118, 0, 1,
-1.010346, -0.8493178, -2.133478, 1, 0.9372549, 0, 1,
-1.007163, -1.212889, -2.051095, 1, 0.9411765, 0, 1,
-1.005512, 0.358891, -0.598563, 1, 0.9490196, 0, 1,
-1.003081, -0.6154227, -2.167254, 1, 0.9529412, 0, 1,
-0.9885939, 0.9631409, -2.498577, 1, 0.9607843, 0, 1,
-0.9869282, 0.09918156, -0.5645041, 1, 0.9647059, 0, 1,
-0.9832311, -2.070367, -3.221606, 1, 0.972549, 0, 1,
-0.9786319, 0.3118971, -1.505816, 1, 0.9764706, 0, 1,
-0.9679561, 0.3609222, -2.325919, 1, 0.9843137, 0, 1,
-0.9676196, -0.130019, -0.1985081, 1, 0.9882353, 0, 1,
-0.966793, -1.141801, -2.626055, 1, 0.9960784, 0, 1,
-0.9658911, 0.5963491, -1.609605, 0.9960784, 1, 0, 1,
-0.9641603, -0.4436039, -2.193189, 0.9921569, 1, 0, 1,
-0.9567105, -0.962148, -1.15334, 0.9843137, 1, 0, 1,
-0.9559701, -1.871742, -3.704526, 0.9803922, 1, 0, 1,
-0.9483442, -0.9447791, -2.044413, 0.972549, 1, 0, 1,
-0.9470838, -0.4695919, -3.118487, 0.9686275, 1, 0, 1,
-0.9443133, 1.008402, -1.193775, 0.9607843, 1, 0, 1,
-0.9441851, -0.9410231, -3.34287, 0.9568627, 1, 0, 1,
-0.9394151, 0.1017333, -0.1944367, 0.9490196, 1, 0, 1,
-0.932871, 1.04602, -1.503878, 0.945098, 1, 0, 1,
-0.9320548, -2.315237, -0.8064519, 0.9372549, 1, 0, 1,
-0.9315448, -0.5182487, -1.974126, 0.9333333, 1, 0, 1,
-0.9210595, 0.2272164, -1.817957, 0.9254902, 1, 0, 1,
-0.9183511, 2.091224, -1.443905, 0.9215686, 1, 0, 1,
-0.9153877, -0.555207, -1.198146, 0.9137255, 1, 0, 1,
-0.9132898, 0.4080063, -0.8070301, 0.9098039, 1, 0, 1,
-0.9096514, 1.555881, -2.170527, 0.9019608, 1, 0, 1,
-0.8958852, -0.08081796, -0.8401878, 0.8941177, 1, 0, 1,
-0.8951836, -0.9926907, -1.692593, 0.8901961, 1, 0, 1,
-0.8934484, -0.2683252, -3.153035, 0.8823529, 1, 0, 1,
-0.8845133, 0.6806807, -2.436029, 0.8784314, 1, 0, 1,
-0.8829154, 1.658962, -1.609352, 0.8705882, 1, 0, 1,
-0.8802949, 0.3033819, -2.380384, 0.8666667, 1, 0, 1,
-0.8774328, -1.080038, -3.808349, 0.8588235, 1, 0, 1,
-0.8767958, -0.364142, -1.170205, 0.854902, 1, 0, 1,
-0.8737631, 0.7191182, 0.589236, 0.8470588, 1, 0, 1,
-0.870637, 0.1449721, -0.3996588, 0.8431373, 1, 0, 1,
-0.866907, 1.197179, -1.16078, 0.8352941, 1, 0, 1,
-0.8657992, 0.1172086, -0.5462747, 0.8313726, 1, 0, 1,
-0.8627814, -0.9623356, -1.22796, 0.8235294, 1, 0, 1,
-0.8612655, -0.3189077, -1.293708, 0.8196079, 1, 0, 1,
-0.8511115, 2.316783, 0.2221148, 0.8117647, 1, 0, 1,
-0.8407395, 1.109093, -2.103302, 0.8078431, 1, 0, 1,
-0.8324121, -0.9914039, -3.296842, 0.8, 1, 0, 1,
-0.8322822, -0.4769363, -2.721481, 0.7921569, 1, 0, 1,
-0.8280122, -0.4100862, -2.947608, 0.7882353, 1, 0, 1,
-0.8274624, -0.8760749, -2.277267, 0.7803922, 1, 0, 1,
-0.8265035, -0.8221036, -0.8349297, 0.7764706, 1, 0, 1,
-0.8264474, -0.4239295, -0.4778092, 0.7686275, 1, 0, 1,
-0.8224096, -1.100551, -2.79476, 0.7647059, 1, 0, 1,
-0.8200147, -0.9227851, -1.502872, 0.7568628, 1, 0, 1,
-0.8143801, 0.01406169, -1.836748, 0.7529412, 1, 0, 1,
-0.8135513, 1.818808, -0.7782997, 0.7450981, 1, 0, 1,
-0.8100619, 0.862213, -0.449836, 0.7411765, 1, 0, 1,
-0.8092731, 0.1713115, -2.851936, 0.7333333, 1, 0, 1,
-0.8036845, -0.7754088, -2.331272, 0.7294118, 1, 0, 1,
-0.8010898, 0.9999278, 0.7174882, 0.7215686, 1, 0, 1,
-0.8006331, -0.199064, -1.520501, 0.7176471, 1, 0, 1,
-0.7994739, -1.790623, -2.647574, 0.7098039, 1, 0, 1,
-0.7980163, -0.07978509, -4.003893, 0.7058824, 1, 0, 1,
-0.7902677, -1.216803, -1.977937, 0.6980392, 1, 0, 1,
-0.7878959, -0.134536, -1.765604, 0.6901961, 1, 0, 1,
-0.7866539, -0.137087, -2.647364, 0.6862745, 1, 0, 1,
-0.7789021, 0.7956579, -2.658775, 0.6784314, 1, 0, 1,
-0.7768029, 1.326086, -2.165079, 0.6745098, 1, 0, 1,
-0.7725985, 0.4607676, 0.4871205, 0.6666667, 1, 0, 1,
-0.771297, 0.2450158, -2.297765, 0.6627451, 1, 0, 1,
-0.7704744, 0.07456943, -1.335333, 0.654902, 1, 0, 1,
-0.7660786, -0.2063615, -1.502839, 0.6509804, 1, 0, 1,
-0.7643673, 1.374486, -0.5153159, 0.6431373, 1, 0, 1,
-0.763252, 0.005622543, -0.004834428, 0.6392157, 1, 0, 1,
-0.7576803, -0.1326364, -2.088924, 0.6313726, 1, 0, 1,
-0.7505327, 2.035487, 1.044217, 0.627451, 1, 0, 1,
-0.7472159, -0.104413, -0.001560614, 0.6196079, 1, 0, 1,
-0.7415615, 0.06563573, -0.7430099, 0.6156863, 1, 0, 1,
-0.7391099, -1.218112, -2.297489, 0.6078432, 1, 0, 1,
-0.7323649, -1.13099, -2.664112, 0.6039216, 1, 0, 1,
-0.7289756, -0.7429945, -2.550711, 0.5960785, 1, 0, 1,
-0.7278659, -0.5932118, -3.112908, 0.5882353, 1, 0, 1,
-0.7221578, -0.4503667, -3.458735, 0.5843138, 1, 0, 1,
-0.7171922, -0.4419467, -0.7053785, 0.5764706, 1, 0, 1,
-0.7151467, 0.2407248, -1.193731, 0.572549, 1, 0, 1,
-0.7137292, -1.626745, -1.961883, 0.5647059, 1, 0, 1,
-0.7133232, -1.38201, -0.02768863, 0.5607843, 1, 0, 1,
-0.7124141, 0.4837426, -0.4992926, 0.5529412, 1, 0, 1,
-0.7111642, -1.571672, -1.565365, 0.5490196, 1, 0, 1,
-0.709464, -0.2666108, -2.571794, 0.5411765, 1, 0, 1,
-0.7094211, -1.355159, -2.310015, 0.5372549, 1, 0, 1,
-0.7056048, -0.6399203, -1.839655, 0.5294118, 1, 0, 1,
-0.7024699, -0.08442067, 0.4975426, 0.5254902, 1, 0, 1,
-0.6996336, 1.846746, 0.4725814, 0.5176471, 1, 0, 1,
-0.6995201, 0.4472623, -0.4620825, 0.5137255, 1, 0, 1,
-0.6993012, -0.4667229, -3.085438, 0.5058824, 1, 0, 1,
-0.6975048, 0.9787354, -2.052589, 0.5019608, 1, 0, 1,
-0.6973668, -0.7275524, -1.232643, 0.4941176, 1, 0, 1,
-0.6934307, 0.8060411, -1.463948, 0.4862745, 1, 0, 1,
-0.692873, 1.237601, -1.356956, 0.4823529, 1, 0, 1,
-0.6877692, 0.1861856, -2.086537, 0.4745098, 1, 0, 1,
-0.6831112, -1.262562, -3.123714, 0.4705882, 1, 0, 1,
-0.6828395, -0.2349989, -1.522682, 0.4627451, 1, 0, 1,
-0.6770876, 0.1078448, -2.12526, 0.4588235, 1, 0, 1,
-0.675585, -0.5917714, -1.361536, 0.4509804, 1, 0, 1,
-0.6731788, 0.1411496, -2.784998, 0.4470588, 1, 0, 1,
-0.6666492, 1.568304, -0.9082521, 0.4392157, 1, 0, 1,
-0.6664991, 0.02316408, -1.889492, 0.4352941, 1, 0, 1,
-0.6628881, -2.519645, -1.925662, 0.427451, 1, 0, 1,
-0.6625085, 0.2781582, -2.015475, 0.4235294, 1, 0, 1,
-0.6618212, -0.5332224, -2.577474, 0.4156863, 1, 0, 1,
-0.6593685, 1.026034, -0.4446109, 0.4117647, 1, 0, 1,
-0.6576902, -1.266381, -4.701628, 0.4039216, 1, 0, 1,
-0.6547483, 0.4662173, -1.59191, 0.3960784, 1, 0, 1,
-0.6454089, -0.3538915, -2.04617, 0.3921569, 1, 0, 1,
-0.6441347, -0.3435279, -1.589091, 0.3843137, 1, 0, 1,
-0.6376624, -1.033969, -2.386022, 0.3803922, 1, 0, 1,
-0.6311573, 0.171085, -2.088388, 0.372549, 1, 0, 1,
-0.6261005, 1.492869, 0.4247534, 0.3686275, 1, 0, 1,
-0.6242985, 0.8203049, -0.7641487, 0.3607843, 1, 0, 1,
-0.6226394, 0.1141776, -0.1936946, 0.3568628, 1, 0, 1,
-0.6180373, -0.2265254, -0.1699346, 0.3490196, 1, 0, 1,
-0.6176238, 0.6511099, -0.5985721, 0.345098, 1, 0, 1,
-0.6158329, 1.661042, -0.04695113, 0.3372549, 1, 0, 1,
-0.6090002, 0.3037644, 0.3667214, 0.3333333, 1, 0, 1,
-0.6071501, -1.172161, -3.334479, 0.3254902, 1, 0, 1,
-0.6071489, 0.4806607, -1.834172, 0.3215686, 1, 0, 1,
-0.6035268, -0.008911598, -2.09063, 0.3137255, 1, 0, 1,
-0.6034643, -0.009853918, -4.321641, 0.3098039, 1, 0, 1,
-0.6022559, 1.374303, -0.6036174, 0.3019608, 1, 0, 1,
-0.6011019, -0.4648026, -1.788445, 0.2941177, 1, 0, 1,
-0.5994346, 0.06709784, -2.038724, 0.2901961, 1, 0, 1,
-0.5964672, -0.8002832, -2.213317, 0.282353, 1, 0, 1,
-0.5948609, -2.25001, -2.96752, 0.2784314, 1, 0, 1,
-0.5937835, 1.156861, -0.1309151, 0.2705882, 1, 0, 1,
-0.5929099, 0.04428218, -3.175786, 0.2666667, 1, 0, 1,
-0.5928451, 2.54908, -1.441776, 0.2588235, 1, 0, 1,
-0.5922807, -2.074914, -2.059247, 0.254902, 1, 0, 1,
-0.5844091, 0.1975837, -0.969809, 0.2470588, 1, 0, 1,
-0.583483, 1.940689, -0.136832, 0.2431373, 1, 0, 1,
-0.5792081, 1.842427, 1.141608, 0.2352941, 1, 0, 1,
-0.5789968, 1.792376, 2.610148, 0.2313726, 1, 0, 1,
-0.5738307, 0.5401489, 1.287252, 0.2235294, 1, 0, 1,
-0.573024, 1.194405, -0.8948409, 0.2196078, 1, 0, 1,
-0.5727074, 0.2795516, -1.433666, 0.2117647, 1, 0, 1,
-0.5706089, -0.217362, -1.986888, 0.2078431, 1, 0, 1,
-0.5620194, -0.5142881, -1.569268, 0.2, 1, 0, 1,
-0.5585588, -1.096647, -2.454514, 0.1921569, 1, 0, 1,
-0.5535535, -0.2931693, -2.375676, 0.1882353, 1, 0, 1,
-0.5531194, -2.242696, -5.807552, 0.1803922, 1, 0, 1,
-0.5491381, 2.772977, -0.3850147, 0.1764706, 1, 0, 1,
-0.5450991, -1.458461, -3.389158, 0.1686275, 1, 0, 1,
-0.5440989, -1.648478, -1.027682, 0.1647059, 1, 0, 1,
-0.5438982, -1.378469, -4.036875, 0.1568628, 1, 0, 1,
-0.5400631, 1.72512, -0.7434475, 0.1529412, 1, 0, 1,
-0.5345325, 0.8888298, -2.92116, 0.145098, 1, 0, 1,
-0.5324501, 0.7386062, -0.4705529, 0.1411765, 1, 0, 1,
-0.5320743, 0.4444297, -0.4037994, 0.1333333, 1, 0, 1,
-0.5253935, -0.7001623, -4.012226, 0.1294118, 1, 0, 1,
-0.5208493, -0.5833079, -1.016532, 0.1215686, 1, 0, 1,
-0.5134773, 1.400041, -0.6255622, 0.1176471, 1, 0, 1,
-0.5130052, 0.6568789, 0.008748915, 0.1098039, 1, 0, 1,
-0.5066003, -0.6244193, -2.991134, 0.1058824, 1, 0, 1,
-0.5051414, -1.377594, -1.961323, 0.09803922, 1, 0, 1,
-0.5030137, -0.2114011, -2.209491, 0.09019608, 1, 0, 1,
-0.5013728, 0.7701349, -0.5443785, 0.08627451, 1, 0, 1,
-0.4990498, -0.7694484, -3.562137, 0.07843138, 1, 0, 1,
-0.4980775, -0.2356228, -2.510886, 0.07450981, 1, 0, 1,
-0.4967311, 1.213689, -2.65863, 0.06666667, 1, 0, 1,
-0.4869502, -1.641562, -4.300529, 0.0627451, 1, 0, 1,
-0.4851064, 1.048482, 0.4472863, 0.05490196, 1, 0, 1,
-0.4832331, 1.168768, 0.356111, 0.05098039, 1, 0, 1,
-0.4830455, 1.028045, -1.080509, 0.04313726, 1, 0, 1,
-0.4769188, 0.6831769, -0.8642591, 0.03921569, 1, 0, 1,
-0.4767635, 1.276548, -0.05102847, 0.03137255, 1, 0, 1,
-0.4722368, -0.8342844, -2.618819, 0.02745098, 1, 0, 1,
-0.4705018, -1.10071, -3.044137, 0.01960784, 1, 0, 1,
-0.470058, 0.9769762, -0.1335038, 0.01568628, 1, 0, 1,
-0.460282, -0.1338804, -0.5935941, 0.007843138, 1, 0, 1,
-0.4582641, -1.578188, -0.6269633, 0.003921569, 1, 0, 1,
-0.4550588, -0.04322958, -2.459135, 0, 1, 0.003921569, 1,
-0.4523921, -0.6795711, -1.470451, 0, 1, 0.01176471, 1,
-0.4518528, -0.5925317, -3.454388, 0, 1, 0.01568628, 1,
-0.449109, 1.155436, -1.469878, 0, 1, 0.02352941, 1,
-0.4464249, -0.5048348, -2.652922, 0, 1, 0.02745098, 1,
-0.4423277, 0.3561716, -1.512426, 0, 1, 0.03529412, 1,
-0.4409842, 0.2804598, -1.569533, 0, 1, 0.03921569, 1,
-0.4403673, -0.6595315, -3.59449, 0, 1, 0.04705882, 1,
-0.4359523, 1.301199, 0.1521534, 0, 1, 0.05098039, 1,
-0.4351328, 1.757586, 0.9768209, 0, 1, 0.05882353, 1,
-0.435074, -0.6885879, -2.74432, 0, 1, 0.0627451, 1,
-0.4327545, 0.3362705, -1.577192, 0, 1, 0.07058824, 1,
-0.4298478, -1.760481, -1.642857, 0, 1, 0.07450981, 1,
-0.4295203, 0.3177635, 0.7610867, 0, 1, 0.08235294, 1,
-0.4247444, 0.103115, -0.9335607, 0, 1, 0.08627451, 1,
-0.4247294, 0.3903038, 0.241163, 0, 1, 0.09411765, 1,
-0.4235281, -2.140798, -2.226769, 0, 1, 0.1019608, 1,
-0.4213423, -2.096023, -3.478032, 0, 1, 0.1058824, 1,
-0.41945, 0.5707953, -0.3549634, 0, 1, 0.1137255, 1,
-0.4189112, -0.8440325, -2.672897, 0, 1, 0.1176471, 1,
-0.4128437, -0.3822335, -3.492521, 0, 1, 0.1254902, 1,
-0.4067027, -0.9255532, -5.25657, 0, 1, 0.1294118, 1,
-0.3990592, -0.4614438, -2.418864, 0, 1, 0.1372549, 1,
-0.3937442, -1.522516, -3.989575, 0, 1, 0.1411765, 1,
-0.391193, -0.3436773, -2.480231, 0, 1, 0.1490196, 1,
-0.3888091, -0.06878369, -1.762087, 0, 1, 0.1529412, 1,
-0.381556, -0.0159295, -0.7609088, 0, 1, 0.1607843, 1,
-0.380501, -0.09500393, -0.5213785, 0, 1, 0.1647059, 1,
-0.3792884, 0.4459392, -0.6227441, 0, 1, 0.172549, 1,
-0.3778327, -1.593437, -2.907516, 0, 1, 0.1764706, 1,
-0.3762057, -1.01556, -3.134123, 0, 1, 0.1843137, 1,
-0.3739734, 0.4559523, -1.851647, 0, 1, 0.1882353, 1,
-0.3733363, 0.1198922, -3.782944, 0, 1, 0.1960784, 1,
-0.3732575, 1.84282, -0.7076428, 0, 1, 0.2039216, 1,
-0.3721233, -2.189848, -2.621552, 0, 1, 0.2078431, 1,
-0.3687158, -0.6825804, -2.978743, 0, 1, 0.2156863, 1,
-0.3662871, -1.055208, -3.259523, 0, 1, 0.2196078, 1,
-0.3606504, 2.190431, -0.5837896, 0, 1, 0.227451, 1,
-0.3593194, 0.3244607, -0.8228258, 0, 1, 0.2313726, 1,
-0.3382162, -0.7837751, -3.33988, 0, 1, 0.2392157, 1,
-0.3376302, 2.365839, 0.7640538, 0, 1, 0.2431373, 1,
-0.3321691, 0.237695, -0.6081984, 0, 1, 0.2509804, 1,
-0.3293471, -0.2559282, -3.384795, 0, 1, 0.254902, 1,
-0.3213825, -1.036711, -3.53914, 0, 1, 0.2627451, 1,
-0.3200585, 1.697942, -0.5702125, 0, 1, 0.2666667, 1,
-0.3176591, -0.01673092, -1.647039, 0, 1, 0.2745098, 1,
-0.3172861, -0.05973733, -1.558872, 0, 1, 0.2784314, 1,
-0.3159736, -1.046009, -2.338355, 0, 1, 0.2862745, 1,
-0.3140523, -0.359773, -2.665208, 0, 1, 0.2901961, 1,
-0.3125018, 0.5536316, 1.728518, 0, 1, 0.2980392, 1,
-0.3070341, 1.170348, 0.09430054, 0, 1, 0.3058824, 1,
-0.3057373, -0.222663, -1.828504, 0, 1, 0.3098039, 1,
-0.3026247, 0.8450266, 0.137891, 0, 1, 0.3176471, 1,
-0.3003113, 1.183448, -1.055527, 0, 1, 0.3215686, 1,
-0.2950636, 2.650275, 0.02244986, 0, 1, 0.3294118, 1,
-0.2932757, 0.7421109, -0.1379904, 0, 1, 0.3333333, 1,
-0.291017, 0.7399701, 0.3272757, 0, 1, 0.3411765, 1,
-0.28383, 0.08872548, -0.1403395, 0, 1, 0.345098, 1,
-0.2827754, 1.686661, 0.2589163, 0, 1, 0.3529412, 1,
-0.273872, -1.243379, -3.321678, 0, 1, 0.3568628, 1,
-0.2653722, -0.9761864, -2.796153, 0, 1, 0.3647059, 1,
-0.2610229, 0.64908, -0.466892, 0, 1, 0.3686275, 1,
-0.2579778, 1.061971, -0.01297065, 0, 1, 0.3764706, 1,
-0.2569467, -0.3645561, -3.401572, 0, 1, 0.3803922, 1,
-0.2546692, 0.1476129, -4.262188, 0, 1, 0.3882353, 1,
-0.2515667, 0.491815, -0.5573084, 0, 1, 0.3921569, 1,
-0.2505622, -0.5717643, -0.1291256, 0, 1, 0.4, 1,
-0.247739, -1.181918, -2.284816, 0, 1, 0.4078431, 1,
-0.2464646, -1.649011, -2.007283, 0, 1, 0.4117647, 1,
-0.2455009, 0.1047139, -0.8087245, 0, 1, 0.4196078, 1,
-0.2453329, 0.04467293, -1.334289, 0, 1, 0.4235294, 1,
-0.2407169, -0.006563247, -0.9448136, 0, 1, 0.4313726, 1,
-0.2362316, 2.10011, -0.6518288, 0, 1, 0.4352941, 1,
-0.2332316, -0.3597991, -0.8866901, 0, 1, 0.4431373, 1,
-0.2321584, -0.6302907, -1.168126, 0, 1, 0.4470588, 1,
-0.2309476, 1.353462, 0.41918, 0, 1, 0.454902, 1,
-0.2285598, 1.823335, -0.006487765, 0, 1, 0.4588235, 1,
-0.2226956, -0.6620535, -2.983203, 0, 1, 0.4666667, 1,
-0.2121424, 0.4342134, -1.085437, 0, 1, 0.4705882, 1,
-0.206483, 0.1132546, 0.4280998, 0, 1, 0.4784314, 1,
-0.2046319, -0.8587393, -2.82976, 0, 1, 0.4823529, 1,
-0.2034362, -0.8488853, -1.626061, 0, 1, 0.4901961, 1,
-0.2008909, -1.603863, -3.062577, 0, 1, 0.4941176, 1,
-0.2003115, -0.01469168, -0.5201498, 0, 1, 0.5019608, 1,
-0.1983843, -1.227238, -2.42821, 0, 1, 0.509804, 1,
-0.1954797, 0.2328565, -1.557655, 0, 1, 0.5137255, 1,
-0.1902937, 0.2209452, -2.770139, 0, 1, 0.5215687, 1,
-0.1855363, 0.7063928, -0.3525998, 0, 1, 0.5254902, 1,
-0.181796, 0.2195911, -0.9962551, 0, 1, 0.5333334, 1,
-0.1817362, 0.5458379, -0.03515539, 0, 1, 0.5372549, 1,
-0.1816076, -0.5240124, -4.128076, 0, 1, 0.5450981, 1,
-0.1802459, -0.4978236, -1.77868, 0, 1, 0.5490196, 1,
-0.1802422, -0.202137, -2.746603, 0, 1, 0.5568628, 1,
-0.1797578, -0.3256516, -1.514137, 0, 1, 0.5607843, 1,
-0.1785028, 1.419531, 0.8947989, 0, 1, 0.5686275, 1,
-0.1784003, 0.9498048, -1.56506, 0, 1, 0.572549, 1,
-0.1771439, -0.7305322, -2.547654, 0, 1, 0.5803922, 1,
-0.1767997, 0.2065742, -1.242318, 0, 1, 0.5843138, 1,
-0.1738215, 0.6523185, -1.71039, 0, 1, 0.5921569, 1,
-0.1736214, 0.5640658, -0.4270454, 0, 1, 0.5960785, 1,
-0.172417, 0.3657108, -0.7079902, 0, 1, 0.6039216, 1,
-0.169462, -0.04511118, -2.744533, 0, 1, 0.6117647, 1,
-0.1689399, -1.011962, -3.59001, 0, 1, 0.6156863, 1,
-0.1639873, 0.7251089, -0.2137209, 0, 1, 0.6235294, 1,
-0.1629091, 1.763251, 1.928099, 0, 1, 0.627451, 1,
-0.1628633, -0.4579493, -2.109782, 0, 1, 0.6352941, 1,
-0.1623427, 0.3642889, -0.6301079, 0, 1, 0.6392157, 1,
-0.1618491, 1.497903, -0.6579978, 0, 1, 0.6470588, 1,
-0.1610673, -0.1683709, -3.102408, 0, 1, 0.6509804, 1,
-0.1585942, 0.4617452, -2.288409, 0, 1, 0.6588235, 1,
-0.1557366, -0.7305297, -3.397687, 0, 1, 0.6627451, 1,
-0.155569, -1.428573, -2.494951, 0, 1, 0.6705883, 1,
-0.1552142, 0.4878149, 0.536711, 0, 1, 0.6745098, 1,
-0.1547046, -0.2754892, -2.141582, 0, 1, 0.682353, 1,
-0.1539492, 0.8208186, 1.811842, 0, 1, 0.6862745, 1,
-0.152472, 0.916291, 0.1390609, 0, 1, 0.6941177, 1,
-0.1479126, 1.501447, 0.3117976, 0, 1, 0.7019608, 1,
-0.1457159, -1.636587, -2.570489, 0, 1, 0.7058824, 1,
-0.1447087, -0.3815886, -1.884116, 0, 1, 0.7137255, 1,
-0.1364447, 0.2717776, -0.4720175, 0, 1, 0.7176471, 1,
-0.131216, -0.4736519, -3.354546, 0, 1, 0.7254902, 1,
-0.127792, 0.7574738, 0.6055127, 0, 1, 0.7294118, 1,
-0.1275944, 0.6301095, -1.077644, 0, 1, 0.7372549, 1,
-0.1238484, 1.530172, -0.7021338, 0, 1, 0.7411765, 1,
-0.1226651, -0.1401667, -2.064152, 0, 1, 0.7490196, 1,
-0.1221718, -1.157468, -2.312637, 0, 1, 0.7529412, 1,
-0.1173714, -1.488855, -3.204731, 0, 1, 0.7607843, 1,
-0.1172898, 1.005247, 1.113896, 0, 1, 0.7647059, 1,
-0.1115908, -0.4529473, -0.177368, 0, 1, 0.772549, 1,
-0.1079251, -1.724598, -2.249818, 0, 1, 0.7764706, 1,
-0.1071664, -0.0260945, 0.09900209, 0, 1, 0.7843137, 1,
-0.1043938, 0.6073197, -0.7854066, 0, 1, 0.7882353, 1,
-0.1025562, 0.5535643, 1.058635, 0, 1, 0.7960784, 1,
-0.09876526, -1.38977, -3.132161, 0, 1, 0.8039216, 1,
-0.09253068, -0.5531456, -4.631763, 0, 1, 0.8078431, 1,
-0.08975861, -0.5103679, -3.291335, 0, 1, 0.8156863, 1,
-0.08966117, -0.5323461, -3.036266, 0, 1, 0.8196079, 1,
-0.08695034, -1.128513, -2.07622, 0, 1, 0.827451, 1,
-0.08636084, -0.09153716, -2.952209, 0, 1, 0.8313726, 1,
-0.07904419, 0.02306103, -0.1995008, 0, 1, 0.8392157, 1,
-0.07861674, -0.07438137, -1.229925, 0, 1, 0.8431373, 1,
-0.07182324, -1.965397, -2.953714, 0, 1, 0.8509804, 1,
-0.06828332, 0.8918517, -0.4610853, 0, 1, 0.854902, 1,
-0.06561683, 0.504355, 1.481676, 0, 1, 0.8627451, 1,
-0.06454159, 0.5058473, -0.7517887, 0, 1, 0.8666667, 1,
-0.06067169, 0.3675649, -0.01773461, 0, 1, 0.8745098, 1,
-0.05820307, 0.2304163, 0.6264447, 0, 1, 0.8784314, 1,
-0.05811613, -0.7523355, -2.323982, 0, 1, 0.8862745, 1,
-0.05635619, -0.0002055109, -2.298672, 0, 1, 0.8901961, 1,
-0.0486591, -0.6516111, -2.888655, 0, 1, 0.8980392, 1,
-0.0478313, 1.034838, -1.346123, 0, 1, 0.9058824, 1,
-0.04763978, 0.4467522, -0.3223028, 0, 1, 0.9098039, 1,
-0.04598457, -0.944662, -3.744233, 0, 1, 0.9176471, 1,
-0.04462608, 1.223872, -1.327767, 0, 1, 0.9215686, 1,
-0.04421605, -1.428374, -3.617273, 0, 1, 0.9294118, 1,
-0.0408373, -0.3649875, -3.703439, 0, 1, 0.9333333, 1,
-0.03877728, 0.9411919, -0.7652586, 0, 1, 0.9411765, 1,
-0.03669996, -0.1023809, -3.673419, 0, 1, 0.945098, 1,
-0.03083673, -0.3255631, -2.588989, 0, 1, 0.9529412, 1,
-0.02335926, -0.6637405, -3.698814, 0, 1, 0.9568627, 1,
-0.01703106, -0.6252946, -3.530312, 0, 1, 0.9647059, 1,
-0.01424493, 0.4994984, 0.1092123, 0, 1, 0.9686275, 1,
-0.01065556, 0.8903815, -0.0938196, 0, 1, 0.9764706, 1,
-0.008570775, 0.9063321, 1.120388, 0, 1, 0.9803922, 1,
-0.00588529, 0.7377289, -0.8605925, 0, 1, 0.9882353, 1,
-0.004321742, -0.4545549, -2.473727, 0, 1, 0.9921569, 1,
-0.00247974, 0.4700327, 0.1430361, 0, 1, 1, 1,
-0.002041765, 0.05214702, -0.8649344, 0, 0.9921569, 1, 1,
0.002534241, 0.3265914, -0.6266637, 0, 0.9882353, 1, 1,
0.004458031, -0.8866984, 3.768044, 0, 0.9803922, 1, 1,
0.005020059, -0.7461055, 3.497787, 0, 0.9764706, 1, 1,
0.008695908, -0.2832555, 2.051703, 0, 0.9686275, 1, 1,
0.009882288, -0.3494633, 2.735626, 0, 0.9647059, 1, 1,
0.01043416, -2.194919, 3.397277, 0, 0.9568627, 1, 1,
0.01209705, 0.8703901, 1.759191, 0, 0.9529412, 1, 1,
0.01448718, 1.120789, 0.9097067, 0, 0.945098, 1, 1,
0.01651032, 0.7113326, -0.07323088, 0, 0.9411765, 1, 1,
0.01982534, 0.8848364, -0.2854128, 0, 0.9333333, 1, 1,
0.02144792, 1.306505, 0.3443176, 0, 0.9294118, 1, 1,
0.02849364, -0.5619996, 3.640272, 0, 0.9215686, 1, 1,
0.02866491, 0.3553057, -0.5806991, 0, 0.9176471, 1, 1,
0.02885083, -0.9384521, 3.914471, 0, 0.9098039, 1, 1,
0.03268427, 0.1937608, 0.04200328, 0, 0.9058824, 1, 1,
0.03679697, 0.6969305, 0.1850635, 0, 0.8980392, 1, 1,
0.03705094, -0.0966939, 3.931838, 0, 0.8901961, 1, 1,
0.03846801, -0.2285982, 3.760701, 0, 0.8862745, 1, 1,
0.04546185, -1.788178, 3.163438, 0, 0.8784314, 1, 1,
0.04889413, -0.318942, 2.299482, 0, 0.8745098, 1, 1,
0.04937378, -1.128563, 2.607489, 0, 0.8666667, 1, 1,
0.05044125, -1.433705, 2.348589, 0, 0.8627451, 1, 1,
0.05546331, 0.2285053, 0.5666883, 0, 0.854902, 1, 1,
0.05703618, 2.144803, -0.7720452, 0, 0.8509804, 1, 1,
0.06012668, 0.8778704, -0.3980405, 0, 0.8431373, 1, 1,
0.06157534, -0.6887914, 3.823641, 0, 0.8392157, 1, 1,
0.06348661, 1.179035, -0.7225012, 0, 0.8313726, 1, 1,
0.06719165, -0.8991296, 3.598084, 0, 0.827451, 1, 1,
0.06727623, -3.364659, 4.010451, 0, 0.8196079, 1, 1,
0.06877378, -2.215694, 3.919512, 0, 0.8156863, 1, 1,
0.06897052, -0.3535021, 2.25582, 0, 0.8078431, 1, 1,
0.07089575, 0.3657465, 0.9995096, 0, 0.8039216, 1, 1,
0.07299551, -0.09196045, 3.618007, 0, 0.7960784, 1, 1,
0.07456612, 0.9605951, -0.006442223, 0, 0.7882353, 1, 1,
0.0763019, 1.336774, -0.6408387, 0, 0.7843137, 1, 1,
0.07664996, 0.3075197, 0.3899766, 0, 0.7764706, 1, 1,
0.07785258, -0.4385693, 2.058051, 0, 0.772549, 1, 1,
0.08527131, -0.1632957, 2.52378, 0, 0.7647059, 1, 1,
0.08555968, -0.2367222, 3.169178, 0, 0.7607843, 1, 1,
0.0919028, 1.086188, 0.5092617, 0, 0.7529412, 1, 1,
0.09860861, -0.4005713, 2.621197, 0, 0.7490196, 1, 1,
0.09991144, -1.054341, 3.135096, 0, 0.7411765, 1, 1,
0.110029, 0.03718605, 0.1304241, 0, 0.7372549, 1, 1,
0.1113752, 1.270214, 0.5082038, 0, 0.7294118, 1, 1,
0.1127489, 0.1562618, 1.317, 0, 0.7254902, 1, 1,
0.1138099, -1.975844, 5.305199, 0, 0.7176471, 1, 1,
0.1143126, 1.1328, 0.05660648, 0, 0.7137255, 1, 1,
0.1144826, -0.6047543, 2.708965, 0, 0.7058824, 1, 1,
0.115768, 0.4798166, -1.78153, 0, 0.6980392, 1, 1,
0.1178777, -0.05360217, 1.319691, 0, 0.6941177, 1, 1,
0.1212351, 0.172023, 1.371418, 0, 0.6862745, 1, 1,
0.1246402, 0.5208886, -0.7370895, 0, 0.682353, 1, 1,
0.1260489, 0.09249352, 0.5008255, 0, 0.6745098, 1, 1,
0.127238, -1.081534, 3.72991, 0, 0.6705883, 1, 1,
0.1279571, 1.570872, 1.43113, 0, 0.6627451, 1, 1,
0.1317721, 0.4879238, 0.9634604, 0, 0.6588235, 1, 1,
0.1373817, -0.005629356, 0.7233682, 0, 0.6509804, 1, 1,
0.1388067, 0.8261321, 1.486338, 0, 0.6470588, 1, 1,
0.1428252, 0.9410403, -0.5756561, 0, 0.6392157, 1, 1,
0.1487179, -0.5355843, 2.445126, 0, 0.6352941, 1, 1,
0.1488792, 2.083333, 1.157924, 0, 0.627451, 1, 1,
0.1550658, -0.933112, 3.059916, 0, 0.6235294, 1, 1,
0.1596808, -0.8703811, 4.546284, 0, 0.6156863, 1, 1,
0.1616166, 1.07725, -0.8273299, 0, 0.6117647, 1, 1,
0.1652355, -0.1370824, -0.6176034, 0, 0.6039216, 1, 1,
0.1661397, 2.396521, -0.9631425, 0, 0.5960785, 1, 1,
0.1720447, -1.192627, 2.529989, 0, 0.5921569, 1, 1,
0.1739324, -0.410041, 1.639628, 0, 0.5843138, 1, 1,
0.1743785, 0.824802, 1.717729, 0, 0.5803922, 1, 1,
0.1747983, 0.8236032, 0.3624618, 0, 0.572549, 1, 1,
0.1753541, 0.8049546, -0.175739, 0, 0.5686275, 1, 1,
0.1786773, -1.118507, 2.831776, 0, 0.5607843, 1, 1,
0.1794548, -0.1238661, 2.575657, 0, 0.5568628, 1, 1,
0.1826282, 2.02114, -1.360948, 0, 0.5490196, 1, 1,
0.1827975, 0.3446735, 2.566893, 0, 0.5450981, 1, 1,
0.1829014, 0.2707756, 0.2190716, 0, 0.5372549, 1, 1,
0.1836993, -1.682362, 2.687727, 0, 0.5333334, 1, 1,
0.1838812, 1.538107, 1.073879, 0, 0.5254902, 1, 1,
0.1904948, 0.8024511, 0.8023764, 0, 0.5215687, 1, 1,
0.2074274, 0.5756755, -0.554688, 0, 0.5137255, 1, 1,
0.2086778, -0.3249126, 2.110284, 0, 0.509804, 1, 1,
0.214893, 0.01726674, -0.3130276, 0, 0.5019608, 1, 1,
0.2178664, 0.6427129, -0.8757961, 0, 0.4941176, 1, 1,
0.2189471, 0.05867008, 1.948312, 0, 0.4901961, 1, 1,
0.2202844, 0.2018555, 1.925372, 0, 0.4823529, 1, 1,
0.2232447, -0.965759, 1.137004, 0, 0.4784314, 1, 1,
0.2251651, 0.1037578, 1.612497, 0, 0.4705882, 1, 1,
0.226928, -0.2299167, 4.557913, 0, 0.4666667, 1, 1,
0.2290042, 0.5053721, 0.4836162, 0, 0.4588235, 1, 1,
0.2302882, -0.2920116, 2.512998, 0, 0.454902, 1, 1,
0.2304014, 0.6061143, -0.6357238, 0, 0.4470588, 1, 1,
0.2333531, 1.101747, 1.616552, 0, 0.4431373, 1, 1,
0.2388952, -1.849208, 3.305213, 0, 0.4352941, 1, 1,
0.2427763, -1.107759, 3.870858, 0, 0.4313726, 1, 1,
0.2444906, 0.7778379, -0.008005485, 0, 0.4235294, 1, 1,
0.2462344, -0.8871666, 2.777055, 0, 0.4196078, 1, 1,
0.2494867, 0.5220212, -0.9767151, 0, 0.4117647, 1, 1,
0.2500551, -1.465177, 1.31166, 0, 0.4078431, 1, 1,
0.2507322, -0.2494829, 2.599746, 0, 0.4, 1, 1,
0.2531326, 0.5688276, 0.07731822, 0, 0.3921569, 1, 1,
0.2536791, -0.1801695, 1.040423, 0, 0.3882353, 1, 1,
0.2538266, 0.5502667, 0.6495158, 0, 0.3803922, 1, 1,
0.2564508, 0.9292737, -0.8222446, 0, 0.3764706, 1, 1,
0.2577569, 1.306164, -0.7343851, 0, 0.3686275, 1, 1,
0.2590497, -1.0142, 2.93395, 0, 0.3647059, 1, 1,
0.2632849, 0.4201031, 1.259375, 0, 0.3568628, 1, 1,
0.2641447, 0.3024854, 1.820081, 0, 0.3529412, 1, 1,
0.2641602, 0.6403252, 0.1184308, 0, 0.345098, 1, 1,
0.2651021, 0.7451218, -0.6572175, 0, 0.3411765, 1, 1,
0.2656364, -0.9148515, 1.435684, 0, 0.3333333, 1, 1,
0.269188, -0.2055223, 1.571514, 0, 0.3294118, 1, 1,
0.2742474, -0.2795154, 4.378882, 0, 0.3215686, 1, 1,
0.2764727, 0.7334776, 0.7837304, 0, 0.3176471, 1, 1,
0.2819216, -0.21108, 1.321324, 0, 0.3098039, 1, 1,
0.2834313, 0.7427112, 0.4441595, 0, 0.3058824, 1, 1,
0.2872006, 1.002824, -0.2038822, 0, 0.2980392, 1, 1,
0.2894768, -0.6709539, 3.617794, 0, 0.2901961, 1, 1,
0.2927159, 2.435573, 0.5151657, 0, 0.2862745, 1, 1,
0.2980458, 0.7489764, 2.447907, 0, 0.2784314, 1, 1,
0.2981295, 1.147299, 0.4077047, 0, 0.2745098, 1, 1,
0.3047754, 2.442239, 0.1867866, 0, 0.2666667, 1, 1,
0.3076797, 1.329035, 1.153176, 0, 0.2627451, 1, 1,
0.3085852, 1.725335, -1.396413, 0, 0.254902, 1, 1,
0.3088914, 1.452341, -0.4610585, 0, 0.2509804, 1, 1,
0.3176777, -0.9936593, 2.833435, 0, 0.2431373, 1, 1,
0.3226356, -1.158745, 2.749061, 0, 0.2392157, 1, 1,
0.3241289, -1.050014, 3.684466, 0, 0.2313726, 1, 1,
0.3243784, -0.4679843, 2.25752, 0, 0.227451, 1, 1,
0.3258971, -0.6634153, 4.458938, 0, 0.2196078, 1, 1,
0.3279769, -0.5570191, 2.222411, 0, 0.2156863, 1, 1,
0.3338664, -0.3357441, 1.789103, 0, 0.2078431, 1, 1,
0.3350433, 0.209834, 0.3858995, 0, 0.2039216, 1, 1,
0.3459187, -1.107635, 2.026078, 0, 0.1960784, 1, 1,
0.3496194, -1.365115, 0.9291162, 0, 0.1882353, 1, 1,
0.3515763, -0.3790212, 1.154382, 0, 0.1843137, 1, 1,
0.3565094, -0.1674381, 2.655014, 0, 0.1764706, 1, 1,
0.3585126, 0.117857, -0.1658789, 0, 0.172549, 1, 1,
0.361277, 1.563124, 0.876, 0, 0.1647059, 1, 1,
0.3630214, 0.1974278, 0.8095163, 0, 0.1607843, 1, 1,
0.3638909, 0.8656077, 0.9314133, 0, 0.1529412, 1, 1,
0.3648643, 0.6986228, 2.60345, 0, 0.1490196, 1, 1,
0.3654008, 1.212135, -0.7287953, 0, 0.1411765, 1, 1,
0.3660457, -0.6692237, 4.096272, 0, 0.1372549, 1, 1,
0.3669829, -0.7767096, 2.847589, 0, 0.1294118, 1, 1,
0.3741986, 0.05151584, 2.032636, 0, 0.1254902, 1, 1,
0.3762902, 0.4204831, -0.8390757, 0, 0.1176471, 1, 1,
0.3773656, 0.9904045, -0.08518735, 0, 0.1137255, 1, 1,
0.3800177, 0.3528838, 3.297832, 0, 0.1058824, 1, 1,
0.3835452, 0.6704289, 0.6781291, 0, 0.09803922, 1, 1,
0.3895269, -0.06933279, 2.477164, 0, 0.09411765, 1, 1,
0.3896262, -0.8113045, 2.384096, 0, 0.08627451, 1, 1,
0.3930475, 0.8005623, 1.89771, 0, 0.08235294, 1, 1,
0.3959686, -0.07075817, 1.630277, 0, 0.07450981, 1, 1,
0.3998021, -1.642078, 3.739413, 0, 0.07058824, 1, 1,
0.4014092, -0.08084808, 0.5830626, 0, 0.0627451, 1, 1,
0.4019595, 0.3768399, 1.42608, 0, 0.05882353, 1, 1,
0.4142108, 0.812874, 0.617797, 0, 0.05098039, 1, 1,
0.4180698, -0.5049573, 3.37014, 0, 0.04705882, 1, 1,
0.4207773, -0.2460933, 0.8478599, 0, 0.03921569, 1, 1,
0.4243435, -0.7417683, 3.005181, 0, 0.03529412, 1, 1,
0.4256846, -0.2618614, 2.906021, 0, 0.02745098, 1, 1,
0.4276804, -1.035113, 3.442199, 0, 0.02352941, 1, 1,
0.4367755, -0.2724503, 3.788724, 0, 0.01568628, 1, 1,
0.4387946, 0.9494566, -0.603881, 0, 0.01176471, 1, 1,
0.4411753, -0.8970542, 2.39009, 0, 0.003921569, 1, 1,
0.4420029, 0.8776961, -1.627506, 0.003921569, 0, 1, 1,
0.444764, 0.3705424, 0.9334923, 0.007843138, 0, 1, 1,
0.4487939, 2.92989, 0.9656645, 0.01568628, 0, 1, 1,
0.4490874, 0.3025142, 1.136762, 0.01960784, 0, 1, 1,
0.4505842, 1.386427, 0.1490602, 0.02745098, 0, 1, 1,
0.4513825, -0.3185388, 1.698972, 0.03137255, 0, 1, 1,
0.458116, -0.6266071, 3.403223, 0.03921569, 0, 1, 1,
0.4597996, -0.1504046, 2.378552, 0.04313726, 0, 1, 1,
0.4654105, 0.4026107, 1.639742, 0.05098039, 0, 1, 1,
0.46741, 0.2888118, -0.1563039, 0.05490196, 0, 1, 1,
0.4732705, 0.627182, 2.092826, 0.0627451, 0, 1, 1,
0.4766425, -1.31277, 0.8234749, 0.06666667, 0, 1, 1,
0.4774055, -1.443872, 4.157469, 0.07450981, 0, 1, 1,
0.4849112, -0.03780701, 1.715206, 0.07843138, 0, 1, 1,
0.4857771, 1.998906, 0.1545066, 0.08627451, 0, 1, 1,
0.4861585, -0.3276495, 2.599286, 0.09019608, 0, 1, 1,
0.4867876, 0.8716295, 0.369276, 0.09803922, 0, 1, 1,
0.4868346, -0.07966591, 0.8595181, 0.1058824, 0, 1, 1,
0.4939344, -0.8996984, 3.628621, 0.1098039, 0, 1, 1,
0.495029, -1.728027, 1.434305, 0.1176471, 0, 1, 1,
0.4966764, -0.3816334, 2.026315, 0.1215686, 0, 1, 1,
0.4976139, -0.5491163, 1.736879, 0.1294118, 0, 1, 1,
0.4978839, 1.558913, 0.8210692, 0.1333333, 0, 1, 1,
0.4993827, 1.23407, 1.289453, 0.1411765, 0, 1, 1,
0.501138, -1.242444, 5.037857, 0.145098, 0, 1, 1,
0.5012038, -2.469913, 2.949733, 0.1529412, 0, 1, 1,
0.5028942, -0.1908639, 0.9650189, 0.1568628, 0, 1, 1,
0.5067911, -0.01742614, 4.100543, 0.1647059, 0, 1, 1,
0.5108861, 0.4851672, 2.872242, 0.1686275, 0, 1, 1,
0.5193211, -0.484989, -0.08983996, 0.1764706, 0, 1, 1,
0.5238472, -0.9207467, 0.9114383, 0.1803922, 0, 1, 1,
0.5263709, -0.3204804, 1.842049, 0.1882353, 0, 1, 1,
0.5286933, -0.8452979, 3.570907, 0.1921569, 0, 1, 1,
0.5325202, 1.030082, 1.702403, 0.2, 0, 1, 1,
0.5350051, -1.01613, 2.832221, 0.2078431, 0, 1, 1,
0.5439589, 0.2876393, -0.8318283, 0.2117647, 0, 1, 1,
0.5556597, -2.716192, 3.166013, 0.2196078, 0, 1, 1,
0.5572905, 1.535558, -0.3455958, 0.2235294, 0, 1, 1,
0.5573474, 1.298249, 1.382053, 0.2313726, 0, 1, 1,
0.5578977, 1.862157, -0.6186407, 0.2352941, 0, 1, 1,
0.5588831, -0.9402555, 2.792951, 0.2431373, 0, 1, 1,
0.5661405, -1.128023, 1.053933, 0.2470588, 0, 1, 1,
0.5664493, 0.1863387, 2.055343, 0.254902, 0, 1, 1,
0.5713708, -0.7390114, 4.460138, 0.2588235, 0, 1, 1,
0.5757629, 1.123378, 1.61631, 0.2666667, 0, 1, 1,
0.5789848, 0.05038942, 1.549816, 0.2705882, 0, 1, 1,
0.5797392, 1.555191, -0.08836355, 0.2784314, 0, 1, 1,
0.5804124, -1.528772, 3.457201, 0.282353, 0, 1, 1,
0.5804672, 0.9989243, 0.4263176, 0.2901961, 0, 1, 1,
0.5822716, 0.253511, 1.39366, 0.2941177, 0, 1, 1,
0.5848578, 1.960222, -0.3347259, 0.3019608, 0, 1, 1,
0.5895904, 0.5592051, -0.4288092, 0.3098039, 0, 1, 1,
0.5971305, 0.1568833, 0.3520085, 0.3137255, 0, 1, 1,
0.6002016, 0.6880552, -0.4794247, 0.3215686, 0, 1, 1,
0.6005891, 0.205616, 0.2365668, 0.3254902, 0, 1, 1,
0.6014184, -0.3203288, 2.072799, 0.3333333, 0, 1, 1,
0.6020043, -1.256962, 2.881981, 0.3372549, 0, 1, 1,
0.603573, 1.061197, 0.8524444, 0.345098, 0, 1, 1,
0.6101518, -0.03354196, 0.481381, 0.3490196, 0, 1, 1,
0.6101667, 1.008308, 0.334943, 0.3568628, 0, 1, 1,
0.6120258, -2.328794, 2.860868, 0.3607843, 0, 1, 1,
0.6130887, -0.5879287, 3.650246, 0.3686275, 0, 1, 1,
0.6160596, -0.1655458, 3.054863, 0.372549, 0, 1, 1,
0.6246651, -0.197218, 0.9910685, 0.3803922, 0, 1, 1,
0.6262908, 0.5846105, -0.0865268, 0.3843137, 0, 1, 1,
0.6277353, -0.03497029, 2.228307, 0.3921569, 0, 1, 1,
0.6278095, -0.6345633, 3.179305, 0.3960784, 0, 1, 1,
0.6291264, -0.694359, -0.1213484, 0.4039216, 0, 1, 1,
0.6334961, 1.548462, 1.167328, 0.4117647, 0, 1, 1,
0.6440852, 1.187807, 0.8038674, 0.4156863, 0, 1, 1,
0.6474605, -1.529204, 2.500446, 0.4235294, 0, 1, 1,
0.6524474, 1.034497, 1.992941, 0.427451, 0, 1, 1,
0.6527027, -1.424751, 2.707933, 0.4352941, 0, 1, 1,
0.6562395, -1.716295, 0.9805968, 0.4392157, 0, 1, 1,
0.6575419, 0.3027212, 0.4917682, 0.4470588, 0, 1, 1,
0.6578203, 0.4836452, 0.3901064, 0.4509804, 0, 1, 1,
0.6583723, -1.248241, 2.821683, 0.4588235, 0, 1, 1,
0.6605685, 0.1395148, 1.426407, 0.4627451, 0, 1, 1,
0.6608595, -0.4404207, -0.06903893, 0.4705882, 0, 1, 1,
0.6623804, 0.3087362, 2.250384, 0.4745098, 0, 1, 1,
0.6623856, -0.3396741, 0.9826781, 0.4823529, 0, 1, 1,
0.6707582, -2.616208, 2.369142, 0.4862745, 0, 1, 1,
0.6716514, -0.2677803, 0.5155886, 0.4941176, 0, 1, 1,
0.6732589, 0.6330431, -0.132031, 0.5019608, 0, 1, 1,
0.6738673, -0.7483746, 4.320139, 0.5058824, 0, 1, 1,
0.67858, -0.3370385, 2.140688, 0.5137255, 0, 1, 1,
0.6832674, 0.1727683, 2.906972, 0.5176471, 0, 1, 1,
0.6853073, 0.08987793, -0.1317152, 0.5254902, 0, 1, 1,
0.6867196, -1.380085, 2.828238, 0.5294118, 0, 1, 1,
0.6872475, -0.5876387, 2.647165, 0.5372549, 0, 1, 1,
0.6949434, -1.01309, 1.62535, 0.5411765, 0, 1, 1,
0.695133, -0.1010522, 1.193824, 0.5490196, 0, 1, 1,
0.6993075, 0.1532699, 1.342228, 0.5529412, 0, 1, 1,
0.6994005, 1.119864, 0.2137268, 0.5607843, 0, 1, 1,
0.7017739, 0.415545, 1.042051, 0.5647059, 0, 1, 1,
0.70749, 0.7062125, 0.6634411, 0.572549, 0, 1, 1,
0.70842, 0.3391207, 1.957823, 0.5764706, 0, 1, 1,
0.7103851, 0.6950707, 1.403656, 0.5843138, 0, 1, 1,
0.7122355, 0.9970366, 0.9155558, 0.5882353, 0, 1, 1,
0.7226202, -0.7981489, 2.565968, 0.5960785, 0, 1, 1,
0.7262132, 0.2957697, 0.6984073, 0.6039216, 0, 1, 1,
0.7304305, 0.3158955, 1.599743, 0.6078432, 0, 1, 1,
0.7326258, -1.085534, 1.499853, 0.6156863, 0, 1, 1,
0.7385721, 1.020618, 0.6863664, 0.6196079, 0, 1, 1,
0.738616, 1.517336, 0.6402185, 0.627451, 0, 1, 1,
0.7411779, -1.230539, 2.166533, 0.6313726, 0, 1, 1,
0.7424452, -2.026046, 2.394302, 0.6392157, 0, 1, 1,
0.7452136, -0.2236682, 2.069117, 0.6431373, 0, 1, 1,
0.7457361, -0.06155589, 1.771753, 0.6509804, 0, 1, 1,
0.7471122, 1.49553, 0.8815556, 0.654902, 0, 1, 1,
0.7494099, -1.63163, 0.7572966, 0.6627451, 0, 1, 1,
0.7495348, -0.251799, 1.413953, 0.6666667, 0, 1, 1,
0.7497881, -0.3947202, 0.6931663, 0.6745098, 0, 1, 1,
0.750048, -1.032037, 1.838496, 0.6784314, 0, 1, 1,
0.7510142, -0.4459494, 3.479342, 0.6862745, 0, 1, 1,
0.7547511, -0.5310718, 2.692606, 0.6901961, 0, 1, 1,
0.7628342, 1.226295, 0.8709238, 0.6980392, 0, 1, 1,
0.7681174, -0.02999294, 2.838257, 0.7058824, 0, 1, 1,
0.772181, -0.05607552, 2.14254, 0.7098039, 0, 1, 1,
0.7818859, 1.460846, 1.171866, 0.7176471, 0, 1, 1,
0.7828499, -0.4248666, 3.224756, 0.7215686, 0, 1, 1,
0.7904993, -0.2658741, 1.966924, 0.7294118, 0, 1, 1,
0.7969159, 0.4899586, 0.9195886, 0.7333333, 0, 1, 1,
0.7971388, -0.1238197, 1.780128, 0.7411765, 0, 1, 1,
0.8119157, -0.0050916, -0.8397536, 0.7450981, 0, 1, 1,
0.8157282, 0.8069808, 0.4862495, 0.7529412, 0, 1, 1,
0.8158385, -0.2787422, 0.8645087, 0.7568628, 0, 1, 1,
0.817961, 0.355459, 2.215807, 0.7647059, 0, 1, 1,
0.8210433, 0.6179571, 0.8835116, 0.7686275, 0, 1, 1,
0.829949, -0.6123887, 1.266812, 0.7764706, 0, 1, 1,
0.8300855, -1.258331, 3.291831, 0.7803922, 0, 1, 1,
0.8350597, 0.4704394, -0.1977571, 0.7882353, 0, 1, 1,
0.8351658, 0.796995, 0.8742629, 0.7921569, 0, 1, 1,
0.8351972, 0.9163542, 0.8307275, 0.8, 0, 1, 1,
0.8408177, -1.293321, 2.840744, 0.8078431, 0, 1, 1,
0.8478196, 0.4568226, 0.2061733, 0.8117647, 0, 1, 1,
0.8494641, 1.016353, 0.2666255, 0.8196079, 0, 1, 1,
0.8514758, -1.667907, 0.9876145, 0.8235294, 0, 1, 1,
0.8528231, -1.159771, 0.7956745, 0.8313726, 0, 1, 1,
0.8553625, 0.6548868, 0.3007321, 0.8352941, 0, 1, 1,
0.8564639, -0.8711322, 3.441284, 0.8431373, 0, 1, 1,
0.8575274, 0.02218351, 1.703565, 0.8470588, 0, 1, 1,
0.8630264, -0.8897442, 2.530678, 0.854902, 0, 1, 1,
0.870154, -2.010856, 2.543412, 0.8588235, 0, 1, 1,
0.8712986, 0.6361092, 2.092241, 0.8666667, 0, 1, 1,
0.8726348, -0.764609, 2.810884, 0.8705882, 0, 1, 1,
0.8770809, -2.407991, 2.74426, 0.8784314, 0, 1, 1,
0.8773777, 0.2717394, 1.520681, 0.8823529, 0, 1, 1,
0.8782316, -0.07497478, 0.842428, 0.8901961, 0, 1, 1,
0.8827833, 1.194765, -0.8129836, 0.8941177, 0, 1, 1,
0.8846876, 0.3306872, 1.908127, 0.9019608, 0, 1, 1,
0.8908828, -0.03427002, 1.236247, 0.9098039, 0, 1, 1,
0.8964141, -0.1484298, 1.767104, 0.9137255, 0, 1, 1,
0.8965064, 0.007629305, 1.342937, 0.9215686, 0, 1, 1,
0.8969808, -0.09722629, 1.892253, 0.9254902, 0, 1, 1,
0.8990357, 1.331983, 0.3506974, 0.9333333, 0, 1, 1,
0.8991432, -0.1243844, 1.94626, 0.9372549, 0, 1, 1,
0.8995486, 0.526974, 1.679949, 0.945098, 0, 1, 1,
0.901535, 1.139684, 0.4071282, 0.9490196, 0, 1, 1,
0.9056671, -0.04137006, 1.324326, 0.9568627, 0, 1, 1,
0.9076898, 1.12954, 0.5643317, 0.9607843, 0, 1, 1,
0.9159577, 0.2996174, -0.01089651, 0.9686275, 0, 1, 1,
0.9168889, -0.1504961, 0.8340984, 0.972549, 0, 1, 1,
0.9175742, -0.2496627, 0.9697225, 0.9803922, 0, 1, 1,
0.9188474, 0.2345388, 2.35141, 0.9843137, 0, 1, 1,
0.9226418, 0.6270708, 0.1464561, 0.9921569, 0, 1, 1,
0.924414, 0.2854097, 3.996431, 0.9960784, 0, 1, 1,
0.9269825, -0.3614315, 0.9604366, 1, 0, 0.9960784, 1,
0.9287714, -0.05651915, 1.564613, 1, 0, 0.9882353, 1,
0.9347017, -0.4558411, 0.134967, 1, 0, 0.9843137, 1,
0.9435391, 0.03199612, 1.411258, 1, 0, 0.9764706, 1,
0.9531771, -1.696723, 2.159245, 1, 0, 0.972549, 1,
0.9555064, -0.6947497, 2.614475, 1, 0, 0.9647059, 1,
0.9593832, 0.8260925, -0.3207511, 1, 0, 0.9607843, 1,
0.961665, -0.8721747, 3.822257, 1, 0, 0.9529412, 1,
0.9672991, -0.9909053, 0.2305053, 1, 0, 0.9490196, 1,
0.9710032, 0.07001329, -0.6164591, 1, 0, 0.9411765, 1,
0.9730042, 0.6577311, 0.8711938, 1, 0, 0.9372549, 1,
0.9769903, -0.8435391, 2.371763, 1, 0, 0.9294118, 1,
0.9773929, -1.910756, 3.486863, 1, 0, 0.9254902, 1,
0.9881461, 0.4325553, 0.9190703, 1, 0, 0.9176471, 1,
0.9892464, -0.3058285, 0.1750015, 1, 0, 0.9137255, 1,
0.9919422, 1.401176, -0.06744486, 1, 0, 0.9058824, 1,
1.0013, 1.147487, 2.234535, 1, 0, 0.9019608, 1,
1.003654, -0.1627792, 2.313692, 1, 0, 0.8941177, 1,
1.004785, -0.4735557, 1.046297, 1, 0, 0.8862745, 1,
1.006985, -0.06407487, 0.9039328, 1, 0, 0.8823529, 1,
1.011855, -0.3477848, 0.4371314, 1, 0, 0.8745098, 1,
1.012501, -0.7820923, 5.481318, 1, 0, 0.8705882, 1,
1.015106, -0.6159258, 4.308593, 1, 0, 0.8627451, 1,
1.041424, 2.240997, 0.8749471, 1, 0, 0.8588235, 1,
1.041631, 0.2994118, 0.3328413, 1, 0, 0.8509804, 1,
1.044784, 0.1812466, 2.279387, 1, 0, 0.8470588, 1,
1.045792, 0.9549488, -0.3309911, 1, 0, 0.8392157, 1,
1.05778, 1.31269, 2.771555, 1, 0, 0.8352941, 1,
1.072852, 0.7265347, -0.8088082, 1, 0, 0.827451, 1,
1.075883, 0.0002415647, 0.9525957, 1, 0, 0.8235294, 1,
1.079065, -1.232087, 3.708811, 1, 0, 0.8156863, 1,
1.080438, 0.9313358, 0.3889652, 1, 0, 0.8117647, 1,
1.09225, 1.549164, 0.4826377, 1, 0, 0.8039216, 1,
1.092387, -0.3030799, 1.372924, 1, 0, 0.7960784, 1,
1.094424, 1.557158, -0.5758528, 1, 0, 0.7921569, 1,
1.098987, -0.0299309, -0.02258343, 1, 0, 0.7843137, 1,
1.100429, -0.7533907, 1.676602, 1, 0, 0.7803922, 1,
1.101027, -1.20908, 1.614657, 1, 0, 0.772549, 1,
1.102064, -0.6814973, 1.929179, 1, 0, 0.7686275, 1,
1.102073, -0.5693429, 2.395752, 1, 0, 0.7607843, 1,
1.106175, 0.1903344, 0.5811747, 1, 0, 0.7568628, 1,
1.108763, 0.8162037, -0.4512628, 1, 0, 0.7490196, 1,
1.111041, -0.1953458, 0.8513596, 1, 0, 0.7450981, 1,
1.142751, 1.109516, 2.658006, 1, 0, 0.7372549, 1,
1.149514, 0.6862394, 1.755503, 1, 0, 0.7333333, 1,
1.14956, 1.08715, 1.658597, 1, 0, 0.7254902, 1,
1.15052, 0.3702908, -0.5541881, 1, 0, 0.7215686, 1,
1.151556, -0.3533952, 0.4105625, 1, 0, 0.7137255, 1,
1.151586, -0.03824344, 1.067384, 1, 0, 0.7098039, 1,
1.152036, 0.7051647, 0.5559854, 1, 0, 0.7019608, 1,
1.163006, 0.3160874, 2.031045, 1, 0, 0.6941177, 1,
1.165136, -0.9805415, 1.667638, 1, 0, 0.6901961, 1,
1.166628, -0.5645532, 2.191501, 1, 0, 0.682353, 1,
1.173072, -0.716309, 1.721489, 1, 0, 0.6784314, 1,
1.178682, 0.1563674, 1.025438, 1, 0, 0.6705883, 1,
1.182154, -0.7216011, 4.027571, 1, 0, 0.6666667, 1,
1.197664, -1.921197, 1.740753, 1, 0, 0.6588235, 1,
1.197705, 1.51696, 0.7344686, 1, 0, 0.654902, 1,
1.202629, 0.4405327, 2.483377, 1, 0, 0.6470588, 1,
1.203977, 0.3743138, 1.746264, 1, 0, 0.6431373, 1,
1.208661, 1.228071, 2.945732, 1, 0, 0.6352941, 1,
1.213906, -1.592731, 2.388133, 1, 0, 0.6313726, 1,
1.214569, 0.8562573, 0.8353918, 1, 0, 0.6235294, 1,
1.215816, 0.785473, 2.283764, 1, 0, 0.6196079, 1,
1.222051, 0.5116581, 1.504429, 1, 0, 0.6117647, 1,
1.222376, -0.1032625, 0.2821984, 1, 0, 0.6078432, 1,
1.22286, 0.6046968, 1.794017, 1, 0, 0.6, 1,
1.227914, 0.5773141, 0.6096284, 1, 0, 0.5921569, 1,
1.243466, 0.3504133, 0.09770042, 1, 0, 0.5882353, 1,
1.24608, -0.7931335, 1.275942, 1, 0, 0.5803922, 1,
1.27426, 0.3886446, 1.140524, 1, 0, 0.5764706, 1,
1.278274, -0.8991442, -0.2724548, 1, 0, 0.5686275, 1,
1.288326, 1.466495, 0.652743, 1, 0, 0.5647059, 1,
1.289795, 0.8073904, 1.901992, 1, 0, 0.5568628, 1,
1.30281, 1.068934, -0.2074799, 1, 0, 0.5529412, 1,
1.305155, 0.05404072, 2.561763, 1, 0, 0.5450981, 1,
1.307402, -0.8360303, 2.797031, 1, 0, 0.5411765, 1,
1.316051, -0.5467864, 1.645774, 1, 0, 0.5333334, 1,
1.322187, 0.8038582, 0.4713254, 1, 0, 0.5294118, 1,
1.322963, 0.4023062, 0.8379213, 1, 0, 0.5215687, 1,
1.328743, -0.6997402, 5.270621, 1, 0, 0.5176471, 1,
1.328874, -0.2235299, 1.424606, 1, 0, 0.509804, 1,
1.329692, 0.5271928, 1.411352, 1, 0, 0.5058824, 1,
1.335169, -2.230644, 2.75056, 1, 0, 0.4980392, 1,
1.337757, -0.2395007, 1.069539, 1, 0, 0.4901961, 1,
1.342106, 0.09028374, 1.834123, 1, 0, 0.4862745, 1,
1.351983, 0.8340283, 1.057782, 1, 0, 0.4784314, 1,
1.361619, -0.1661945, 1.240887, 1, 0, 0.4745098, 1,
1.3649, -0.6484126, 4.514694, 1, 0, 0.4666667, 1,
1.374727, 1.346243, 0.257713, 1, 0, 0.4627451, 1,
1.37947, -0.896125, 0.9600524, 1, 0, 0.454902, 1,
1.384835, -1.180838, 0.8503727, 1, 0, 0.4509804, 1,
1.405319, -1.087991, 3.309297, 1, 0, 0.4431373, 1,
1.415691, 1.515894, -1.382459, 1, 0, 0.4392157, 1,
1.422121, -0.7726257, 1.562716, 1, 0, 0.4313726, 1,
1.432418, -0.6932221, 2.757904, 1, 0, 0.427451, 1,
1.43882, 0.8133792, 0.842592, 1, 0, 0.4196078, 1,
1.46331, 1.111328, -0.5841239, 1, 0, 0.4156863, 1,
1.471047, -1.413372, 2.415834, 1, 0, 0.4078431, 1,
1.479507, 0.2640664, 0.3297096, 1, 0, 0.4039216, 1,
1.501328, 0.314726, 2.67245, 1, 0, 0.3960784, 1,
1.509249, -0.3931112, 1.720873, 1, 0, 0.3882353, 1,
1.514871, -0.451606, 0.919761, 1, 0, 0.3843137, 1,
1.550827, -0.4674489, 2.256337, 1, 0, 0.3764706, 1,
1.572519, -0.1765157, 1.652479, 1, 0, 0.372549, 1,
1.590358, 2.608099, -0.2153143, 1, 0, 0.3647059, 1,
1.613967, 1.000729, 2.127616, 1, 0, 0.3607843, 1,
1.615391, -0.8261471, 2.228359, 1, 0, 0.3529412, 1,
1.627813, -0.2729833, 0.7604537, 1, 0, 0.3490196, 1,
1.658445, -0.4161098, 2.858335, 1, 0, 0.3411765, 1,
1.68192, 0.1500452, 4.785538, 1, 0, 0.3372549, 1,
1.688388, 0.1465098, 1.535676, 1, 0, 0.3294118, 1,
1.70251, -0.7357717, 0.611999, 1, 0, 0.3254902, 1,
1.704443, -0.6414967, 1.966309, 1, 0, 0.3176471, 1,
1.722629, -1.287213, 3.736818, 1, 0, 0.3137255, 1,
1.747553, 1.051151, 0.736326, 1, 0, 0.3058824, 1,
1.755148, -0.9506686, 2.533663, 1, 0, 0.2980392, 1,
1.766781, 0.9760529, 2.286962, 1, 0, 0.2941177, 1,
1.776418, 0.5896973, -0.1458633, 1, 0, 0.2862745, 1,
1.778036, 0.748328, 2.593159, 1, 0, 0.282353, 1,
1.791083, 1.657569, 0.3794558, 1, 0, 0.2745098, 1,
1.79839, 0.4566341, 2.213138, 1, 0, 0.2705882, 1,
1.806103, -1.459454, 2.237768, 1, 0, 0.2627451, 1,
1.819937, -0.8903177, 0.3329258, 1, 0, 0.2588235, 1,
1.835318, 0.7289168, -0.02008091, 1, 0, 0.2509804, 1,
1.842755, -0.4318073, 0.4888073, 1, 0, 0.2470588, 1,
1.843555, -0.05588871, 2.896051, 1, 0, 0.2392157, 1,
1.855147, 0.8347701, 1.505581, 1, 0, 0.2352941, 1,
1.855886, 0.7844605, 0.527402, 1, 0, 0.227451, 1,
1.863836, -1.83636, 2.302173, 1, 0, 0.2235294, 1,
1.870282, -0.4485481, 2.582442, 1, 0, 0.2156863, 1,
1.874115, -0.2650717, 1.048995, 1, 0, 0.2117647, 1,
1.874334, 0.5101573, 1.72202, 1, 0, 0.2039216, 1,
1.902709, 0.1543631, 1.000497, 1, 0, 0.1960784, 1,
1.903794, -0.9087319, 1.761009, 1, 0, 0.1921569, 1,
1.940911, 1.863815, 0.7097448, 1, 0, 0.1843137, 1,
1.96886, -0.8570112, 1.026657, 1, 0, 0.1803922, 1,
1.969946, 0.9045011, -0.8771273, 1, 0, 0.172549, 1,
2.006789, -0.6836496, 2.429453, 1, 0, 0.1686275, 1,
2.008449, -0.3916055, 1.967424, 1, 0, 0.1607843, 1,
2.041536, 1.459112, 1.105955, 1, 0, 0.1568628, 1,
2.082036, 0.3199154, 2.082832, 1, 0, 0.1490196, 1,
2.105802, 0.5754319, 1.402869, 1, 0, 0.145098, 1,
2.107592, 0.2556167, -0.9934379, 1, 0, 0.1372549, 1,
2.144078, 2.038502, 0.2613814, 1, 0, 0.1333333, 1,
2.173934, 1.469378, 1.048731, 1, 0, 0.1254902, 1,
2.190631, -1.634546, 3.739868, 1, 0, 0.1215686, 1,
2.230417, 1.685912, 2.757924, 1, 0, 0.1137255, 1,
2.254371, -0.7873845, 3.226123, 1, 0, 0.1098039, 1,
2.274806, 1.244755, 2.491942, 1, 0, 0.1019608, 1,
2.277192, -0.1216414, 0.305145, 1, 0, 0.09411765, 1,
2.278062, 1.812402, 0.4974457, 1, 0, 0.09019608, 1,
2.283871, 0.2133536, 1.024677, 1, 0, 0.08235294, 1,
2.382664, -0.6172944, 0.810872, 1, 0, 0.07843138, 1,
2.390985, -1.047862, 4.45025, 1, 0, 0.07058824, 1,
2.448454, 0.5914956, 1.851195, 1, 0, 0.06666667, 1,
2.448475, 0.1283808, 1.258529, 1, 0, 0.05882353, 1,
2.52575, 0.5649014, 1.704605, 1, 0, 0.05490196, 1,
2.539735, 1.958355, 0.9336247, 1, 0, 0.04705882, 1,
2.562744, 0.02704309, 1.821116, 1, 0, 0.04313726, 1,
2.563108, 0.4034612, 0.9536822, 1, 0, 0.03529412, 1,
2.717643, 1.398715, 2.598953, 1, 0, 0.03137255, 1,
2.726088, 0.1109751, 1.381319, 1, 0, 0.02352941, 1,
3.067722, -1.047343, 1.944792, 1, 0, 0.01960784, 1,
3.631122, -0.1275626, 1.57297, 1, 0, 0.01176471, 1,
3.94628, -2.142373, 2.806182, 1, 0, 0.007843138, 1
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
0.4354841, -4.431585, -7.721015, 0, -0.5, 0.5, 0.5,
0.4354841, -4.431585, -7.721015, 1, -0.5, 0.5, 0.5,
0.4354841, -4.431585, -7.721015, 1, 1.5, 0.5, 0.5,
0.4354841, -4.431585, -7.721015, 0, 1.5, 0.5, 0.5
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
-4.265471, -0.2173846, -7.721015, 0, -0.5, 0.5, 0.5,
-4.265471, -0.2173846, -7.721015, 1, -0.5, 0.5, 0.5,
-4.265471, -0.2173846, -7.721015, 1, 1.5, 0.5, 0.5,
-4.265471, -0.2173846, -7.721015, 0, 1.5, 0.5, 0.5
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
-4.265471, -4.431585, -0.1631167, 0, -0.5, 0.5, 0.5,
-4.265471, -4.431585, -0.1631167, 1, -0.5, 0.5, 0.5,
-4.265471, -4.431585, -0.1631167, 1, 1.5, 0.5, 0.5,
-4.265471, -4.431585, -0.1631167, 0, 1.5, 0.5, 0.5
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
-2, -3.459078, -5.976885,
2, -3.459078, -5.976885,
-2, -3.459078, -5.976885,
-2, -3.621162, -6.267573,
0, -3.459078, -5.976885,
0, -3.621162, -6.267573,
2, -3.459078, -5.976885,
2, -3.621162, -6.267573
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
-2, -3.945332, -6.84895, 0, -0.5, 0.5, 0.5,
-2, -3.945332, -6.84895, 1, -0.5, 0.5, 0.5,
-2, -3.945332, -6.84895, 1, 1.5, 0.5, 0.5,
-2, -3.945332, -6.84895, 0, 1.5, 0.5, 0.5,
0, -3.945332, -6.84895, 0, -0.5, 0.5, 0.5,
0, -3.945332, -6.84895, 1, -0.5, 0.5, 0.5,
0, -3.945332, -6.84895, 1, 1.5, 0.5, 0.5,
0, -3.945332, -6.84895, 0, 1.5, 0.5, 0.5,
2, -3.945332, -6.84895, 0, -0.5, 0.5, 0.5,
2, -3.945332, -6.84895, 1, -0.5, 0.5, 0.5,
2, -3.945332, -6.84895, 1, 1.5, 0.5, 0.5,
2, -3.945332, -6.84895, 0, 1.5, 0.5, 0.5
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
-3.180635, -3, -5.976885,
-3.180635, 2, -5.976885,
-3.180635, -3, -5.976885,
-3.361441, -3, -6.267573,
-3.180635, -2, -5.976885,
-3.361441, -2, -6.267573,
-3.180635, -1, -5.976885,
-3.361441, -1, -6.267573,
-3.180635, 0, -5.976885,
-3.361441, 0, -6.267573,
-3.180635, 1, -5.976885,
-3.361441, 1, -6.267573,
-3.180635, 2, -5.976885,
-3.361441, 2, -6.267573
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
-3.723053, -3, -6.84895, 0, -0.5, 0.5, 0.5,
-3.723053, -3, -6.84895, 1, -0.5, 0.5, 0.5,
-3.723053, -3, -6.84895, 1, 1.5, 0.5, 0.5,
-3.723053, -3, -6.84895, 0, 1.5, 0.5, 0.5,
-3.723053, -2, -6.84895, 0, -0.5, 0.5, 0.5,
-3.723053, -2, -6.84895, 1, -0.5, 0.5, 0.5,
-3.723053, -2, -6.84895, 1, 1.5, 0.5, 0.5,
-3.723053, -2, -6.84895, 0, 1.5, 0.5, 0.5,
-3.723053, -1, -6.84895, 0, -0.5, 0.5, 0.5,
-3.723053, -1, -6.84895, 1, -0.5, 0.5, 0.5,
-3.723053, -1, -6.84895, 1, 1.5, 0.5, 0.5,
-3.723053, -1, -6.84895, 0, 1.5, 0.5, 0.5,
-3.723053, 0, -6.84895, 0, -0.5, 0.5, 0.5,
-3.723053, 0, -6.84895, 1, -0.5, 0.5, 0.5,
-3.723053, 0, -6.84895, 1, 1.5, 0.5, 0.5,
-3.723053, 0, -6.84895, 0, 1.5, 0.5, 0.5,
-3.723053, 1, -6.84895, 0, -0.5, 0.5, 0.5,
-3.723053, 1, -6.84895, 1, -0.5, 0.5, 0.5,
-3.723053, 1, -6.84895, 1, 1.5, 0.5, 0.5,
-3.723053, 1, -6.84895, 0, 1.5, 0.5, 0.5,
-3.723053, 2, -6.84895, 0, -0.5, 0.5, 0.5,
-3.723053, 2, -6.84895, 1, -0.5, 0.5, 0.5,
-3.723053, 2, -6.84895, 1, 1.5, 0.5, 0.5,
-3.723053, 2, -6.84895, 0, 1.5, 0.5, 0.5
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
-3.180635, -3.459078, -4,
-3.180635, -3.459078, 4,
-3.180635, -3.459078, -4,
-3.361441, -3.621162, -4,
-3.180635, -3.459078, -2,
-3.361441, -3.621162, -2,
-3.180635, -3.459078, 0,
-3.361441, -3.621162, 0,
-3.180635, -3.459078, 2,
-3.361441, -3.621162, 2,
-3.180635, -3.459078, 4,
-3.361441, -3.621162, 4
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
-3.723053, -3.945332, -4, 0, -0.5, 0.5, 0.5,
-3.723053, -3.945332, -4, 1, -0.5, 0.5, 0.5,
-3.723053, -3.945332, -4, 1, 1.5, 0.5, 0.5,
-3.723053, -3.945332, -4, 0, 1.5, 0.5, 0.5,
-3.723053, -3.945332, -2, 0, -0.5, 0.5, 0.5,
-3.723053, -3.945332, -2, 1, -0.5, 0.5, 0.5,
-3.723053, -3.945332, -2, 1, 1.5, 0.5, 0.5,
-3.723053, -3.945332, -2, 0, 1.5, 0.5, 0.5,
-3.723053, -3.945332, 0, 0, -0.5, 0.5, 0.5,
-3.723053, -3.945332, 0, 1, -0.5, 0.5, 0.5,
-3.723053, -3.945332, 0, 1, 1.5, 0.5, 0.5,
-3.723053, -3.945332, 0, 0, 1.5, 0.5, 0.5,
-3.723053, -3.945332, 2, 0, -0.5, 0.5, 0.5,
-3.723053, -3.945332, 2, 1, -0.5, 0.5, 0.5,
-3.723053, -3.945332, 2, 1, 1.5, 0.5, 0.5,
-3.723053, -3.945332, 2, 0, 1.5, 0.5, 0.5,
-3.723053, -3.945332, 4, 0, -0.5, 0.5, 0.5,
-3.723053, -3.945332, 4, 1, -0.5, 0.5, 0.5,
-3.723053, -3.945332, 4, 1, 1.5, 0.5, 0.5,
-3.723053, -3.945332, 4, 0, 1.5, 0.5, 0.5
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
-3.180635, -3.459078, -5.976885,
-3.180635, 3.024308, -5.976885,
-3.180635, -3.459078, 5.650651,
-3.180635, 3.024308, 5.650651,
-3.180635, -3.459078, -5.976885,
-3.180635, -3.459078, 5.650651,
-3.180635, 3.024308, -5.976885,
-3.180635, 3.024308, 5.650651,
-3.180635, -3.459078, -5.976885,
4.051603, -3.459078, -5.976885,
-3.180635, -3.459078, 5.650651,
4.051603, -3.459078, 5.650651,
-3.180635, 3.024308, -5.976885,
4.051603, 3.024308, -5.976885,
-3.180635, 3.024308, 5.650651,
4.051603, 3.024308, 5.650651,
4.051603, -3.459078, -5.976885,
4.051603, 3.024308, -5.976885,
4.051603, -3.459078, 5.650651,
4.051603, 3.024308, 5.650651,
4.051603, -3.459078, -5.976885,
4.051603, -3.459078, 5.650651,
4.051603, 3.024308, -5.976885,
4.051603, 3.024308, 5.650651
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
var radius = 8.0901;
var distance = 35.99377;
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
mvMatrix.translate( -0.4354841, 0.2173846, 0.1631167 );
mvMatrix.scale( 1.20947, 1.349168, 0.752281 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.99377);
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
aminotriazole<-read.table("aminotriazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-aminotriazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'aminotriazole' not found
```

```r
y<-aminotriazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'aminotriazole' not found
```

```r
z<-aminotriazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'aminotriazole' not found
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
-3.075311, -1.839886, -2.610221, 0, 0, 1, 1, 1,
-2.722121, -0.9666883, -1.310827, 1, 0, 0, 1, 1,
-2.61288, -0.3693875, 0.03783425, 1, 0, 0, 1, 1,
-2.603975, 0.5372369, -3.604228, 1, 0, 0, 1, 1,
-2.521876, -0.4503152, -2.003524, 1, 0, 0, 1, 1,
-2.464457, -0.002930555, -1.871281, 1, 0, 0, 1, 1,
-2.423704, 0.9766664, 0.4626074, 0, 0, 0, 1, 1,
-2.351755, -0.05920003, -3.525974, 0, 0, 0, 1, 1,
-2.349525, -0.1212949, -3.359917, 0, 0, 0, 1, 1,
-2.2361, -0.568005, -1.117937, 0, 0, 0, 1, 1,
-2.219584, -0.07150973, -0.9530921, 0, 0, 0, 1, 1,
-2.192083, 2.456804, -0.2338995, 0, 0, 0, 1, 1,
-2.18928, -1.442079, -1.640194, 0, 0, 0, 1, 1,
-2.169816, 0.8567253, -0.4367036, 1, 1, 1, 1, 1,
-2.16475, -0.338992, -1.406043, 1, 1, 1, 1, 1,
-2.160809, -0.859211, -0.3571964, 1, 1, 1, 1, 1,
-2.145382, 1.065665, -0.02784046, 1, 1, 1, 1, 1,
-2.114641, 0.4148661, -2.414258, 1, 1, 1, 1, 1,
-2.109309, -1.784368, -1.946697, 1, 1, 1, 1, 1,
-2.051211, 1.155491, -2.376015, 1, 1, 1, 1, 1,
-2.031228, -0.2108852, -2.115055, 1, 1, 1, 1, 1,
-1.980104, -0.6617443, -0.9747615, 1, 1, 1, 1, 1,
-1.973849, -1.343307, -2.905032, 1, 1, 1, 1, 1,
-1.970116, 0.3532405, -2.720018, 1, 1, 1, 1, 1,
-1.954599, 0.1646553, -1.065408, 1, 1, 1, 1, 1,
-1.934464, 1.198541, -1.010725, 1, 1, 1, 1, 1,
-1.902327, 0.484344, -1.047033, 1, 1, 1, 1, 1,
-1.902113, 1.009398, -1.313693, 1, 1, 1, 1, 1,
-1.894885, -0.1725816, -1.887399, 0, 0, 1, 1, 1,
-1.893672, -0.7752096, -0.6472159, 1, 0, 0, 1, 1,
-1.888787, -0.2485767, -1.558996, 1, 0, 0, 1, 1,
-1.863612, -0.1054171, -0.9657657, 1, 0, 0, 1, 1,
-1.847777, -0.6705808, -0.7904273, 1, 0, 0, 1, 1,
-1.844176, -0.2051641, -0.9227817, 1, 0, 0, 1, 1,
-1.8201, -0.5006345, -3.150563, 0, 0, 0, 1, 1,
-1.810058, -0.0834305, -3.125173, 0, 0, 0, 1, 1,
-1.798487, 0.8104593, -3.122901, 0, 0, 0, 1, 1,
-1.781448, 0.2661273, -0.4857046, 0, 0, 0, 1, 1,
-1.764092, -0.01617534, -1.668212, 0, 0, 0, 1, 1,
-1.72883, -0.3025955, -1.359655, 0, 0, 0, 1, 1,
-1.723738, -0.1565665, -1.960773, 0, 0, 0, 1, 1,
-1.708458, -1.800925, -2.635315, 1, 1, 1, 1, 1,
-1.70241, 0.05969871, -1.988747, 1, 1, 1, 1, 1,
-1.699042, -0.1986139, -1.228959, 1, 1, 1, 1, 1,
-1.682671, 0.8919416, -1.691238, 1, 1, 1, 1, 1,
-1.676328, -1.107141, -3.970022, 1, 1, 1, 1, 1,
-1.662424, 1.978076, -1.154934, 1, 1, 1, 1, 1,
-1.647683, 1.103747, -0.6724381, 1, 1, 1, 1, 1,
-1.636642, 0.6815004, 1.203496, 1, 1, 1, 1, 1,
-1.621881, 0.5958144, -0.8263524, 1, 1, 1, 1, 1,
-1.616851, -1.620401, -2.018099, 1, 1, 1, 1, 1,
-1.607359, -0.4798604, -2.215751, 1, 1, 1, 1, 1,
-1.592698, -0.5150681, -0.796169, 1, 1, 1, 1, 1,
-1.57989, 0.3637981, -2.151947, 1, 1, 1, 1, 1,
-1.570717, 0.7412164, -0.6939921, 1, 1, 1, 1, 1,
-1.570677, 1.803627, 1.325997, 1, 1, 1, 1, 1,
-1.561728, 1.069291, -2.728315, 0, 0, 1, 1, 1,
-1.561144, -0.6628482, -1.489886, 1, 0, 0, 1, 1,
-1.549591, -0.3116888, -1.33963, 1, 0, 0, 1, 1,
-1.52277, 1.728057, 0.4461369, 1, 0, 0, 1, 1,
-1.519609, -0.2419014, -0.3530329, 1, 0, 0, 1, 1,
-1.502313, 0.7618582, -1.215194, 1, 0, 0, 1, 1,
-1.464824, 0.05874752, -1.338257, 0, 0, 0, 1, 1,
-1.445059, -0.05374356, -2.888137, 0, 0, 0, 1, 1,
-1.445008, -0.7971091, -2.868297, 0, 0, 0, 1, 1,
-1.436581, 1.192244, -0.4920248, 0, 0, 0, 1, 1,
-1.427118, -0.4658338, -1.781836, 0, 0, 0, 1, 1,
-1.425148, 2.688829, 0.3773987, 0, 0, 0, 1, 1,
-1.419497, 1.635372, -1.765757, 0, 0, 0, 1, 1,
-1.415825, 0.01357579, -1.76762, 1, 1, 1, 1, 1,
-1.404492, -0.5531694, -2.796396, 1, 1, 1, 1, 1,
-1.402388, 0.3882128, -0.6753964, 1, 1, 1, 1, 1,
-1.402118, 0.8781935, -1.699306, 1, 1, 1, 1, 1,
-1.387647, 0.9570867, -1.322606, 1, 1, 1, 1, 1,
-1.379838, 0.7761707, -1.550509, 1, 1, 1, 1, 1,
-1.371221, 0.2104964, -0.8243407, 1, 1, 1, 1, 1,
-1.356614, -1.509393, -0.5642605, 1, 1, 1, 1, 1,
-1.345614, -0.9301831, -2.098394, 1, 1, 1, 1, 1,
-1.340937, -2.831884, -2.469207, 1, 1, 1, 1, 1,
-1.332097, -0.2502212, -1.616381, 1, 1, 1, 1, 1,
-1.324218, -1.375168, -0.2777984, 1, 1, 1, 1, 1,
-1.323064, -1.321391, -2.944315, 1, 1, 1, 1, 1,
-1.316442, 0.09431902, -0.2273515, 1, 1, 1, 1, 1,
-1.299526, 0.1043674, -2.12423, 1, 1, 1, 1, 1,
-1.297855, 0.07256324, -1.279623, 0, 0, 1, 1, 1,
-1.293019, 0.4166269, -1.192075, 1, 0, 0, 1, 1,
-1.286559, 0.7012129, 0.2818076, 1, 0, 0, 1, 1,
-1.282156, 0.2003032, -2.170656, 1, 0, 0, 1, 1,
-1.282057, -0.503346, -0.05351921, 1, 0, 0, 1, 1,
-1.274744, 1.376725, 0.8397697, 1, 0, 0, 1, 1,
-1.274035, -0.8924779, -1.751682, 0, 0, 0, 1, 1,
-1.273286, 1.657512, -0.6148903, 0, 0, 0, 1, 1,
-1.27079, -2.11625, -1.942797, 0, 0, 0, 1, 1,
-1.269727, -0.2843524, -0.5777156, 0, 0, 0, 1, 1,
-1.267617, -0.5042739, -3.660244, 0, 0, 0, 1, 1,
-1.262295, 0.9329191, -2.418292, 0, 0, 0, 1, 1,
-1.26102, 0.2231001, -2.075363, 0, 0, 0, 1, 1,
-1.257615, -0.745683, -2.234637, 1, 1, 1, 1, 1,
-1.255332, 0.7549954, 0.3101458, 1, 1, 1, 1, 1,
-1.250538, -0.9660885, -1.579245, 1, 1, 1, 1, 1,
-1.248957, -0.002986152, -2.629618, 1, 1, 1, 1, 1,
-1.246207, 0.5994633, -2.418675, 1, 1, 1, 1, 1,
-1.245546, 0.8440275, 0.5913659, 1, 1, 1, 1, 1,
-1.245335, -2.02087, -1.442974, 1, 1, 1, 1, 1,
-1.243285, -0.7237976, -2.431452, 1, 1, 1, 1, 1,
-1.241347, 0.1710999, -0.5902109, 1, 1, 1, 1, 1,
-1.240892, 1.21152, -0.1650286, 1, 1, 1, 1, 1,
-1.240362, -0.504132, -1.389965, 1, 1, 1, 1, 1,
-1.231229, -0.3674948, -2.407547, 1, 1, 1, 1, 1,
-1.230078, 0.7642107, -1.405967, 1, 1, 1, 1, 1,
-1.223214, 0.5108094, -0.3806736, 1, 1, 1, 1, 1,
-1.216801, 0.01072899, -1.244427, 1, 1, 1, 1, 1,
-1.208028, 0.5082442, -1.840581, 0, 0, 1, 1, 1,
-1.207111, -1.130462, -2.75518, 1, 0, 0, 1, 1,
-1.206715, -0.2256843, -1.713782, 1, 0, 0, 1, 1,
-1.206294, -1.234254, -2.988047, 1, 0, 0, 1, 1,
-1.194893, 0.4296789, -1.810514, 1, 0, 0, 1, 1,
-1.193434, 1.924196, 0.8884045, 1, 0, 0, 1, 1,
-1.188421, 0.2703529, -0.2553516, 0, 0, 0, 1, 1,
-1.185741, 0.04523246, -1.139547, 0, 0, 0, 1, 1,
-1.183332, 1.170072, -1.62329, 0, 0, 0, 1, 1,
-1.181315, 0.2250719, -1.207675, 0, 0, 0, 1, 1,
-1.180931, -0.3971016, -1.988983, 0, 0, 0, 1, 1,
-1.180405, -0.1255826, -0.2675947, 0, 0, 0, 1, 1,
-1.172606, -1.965304, -2.696977, 0, 0, 0, 1, 1,
-1.170129, 0.03025739, -1.633286, 1, 1, 1, 1, 1,
-1.157053, -0.9953884, -1.28091, 1, 1, 1, 1, 1,
-1.146318, -1.514935, -4.616189, 1, 1, 1, 1, 1,
-1.144538, 1.193294, -0.4419466, 1, 1, 1, 1, 1,
-1.141086, 0.5947025, 0.3688538, 1, 1, 1, 1, 1,
-1.137327, 0.04561714, -3.13851, 1, 1, 1, 1, 1,
-1.130047, 1.71374, -1.323027, 1, 1, 1, 1, 1,
-1.124584, 0.1387157, 0.8954433, 1, 1, 1, 1, 1,
-1.118454, -0.0891801, -1.297348, 1, 1, 1, 1, 1,
-1.113716, 1.412137, -1.528559, 1, 1, 1, 1, 1,
-1.11107, 0.5745057, -1.962713, 1, 1, 1, 1, 1,
-1.099086, -0.1455913, -2.307817, 1, 1, 1, 1, 1,
-1.096156, 1.081427, -0.5597349, 1, 1, 1, 1, 1,
-1.091336, -0.1217237, -1.989262, 1, 1, 1, 1, 1,
-1.090811, -1.835088, -2.526887, 1, 1, 1, 1, 1,
-1.088743, 0.8752173, -2.364559, 0, 0, 1, 1, 1,
-1.08768, -0.67975, -0.8116091, 1, 0, 0, 1, 1,
-1.083578, 0.6810811, -1.619629, 1, 0, 0, 1, 1,
-1.081041, 0.1042271, -1.592679, 1, 0, 0, 1, 1,
-1.079494, -1.576861, -2.195184, 1, 0, 0, 1, 1,
-1.077956, -1.219237, -1.183837, 1, 0, 0, 1, 1,
-1.069584, 0.6607938, -1.401336, 0, 0, 0, 1, 1,
-1.058296, -0.5838278, -1.45744, 0, 0, 0, 1, 1,
-1.049223, -2.302687, -3.113362, 0, 0, 0, 1, 1,
-1.045855, 0.691346, -3.234148, 0, 0, 0, 1, 1,
-1.042643, 1.137306, -0.01700081, 0, 0, 0, 1, 1,
-1.030072, 0.9347594, -2.462426, 0, 0, 0, 1, 1,
-1.025479, -1.539594, -3.598338, 0, 0, 0, 1, 1,
-1.024971, 0.0864078, -2.422082, 1, 1, 1, 1, 1,
-1.016984, 1.019758, -2.15069, 1, 1, 1, 1, 1,
-1.010836, 0.6722707, -1.833609, 1, 1, 1, 1, 1,
-1.010346, -0.8493178, -2.133478, 1, 1, 1, 1, 1,
-1.007163, -1.212889, -2.051095, 1, 1, 1, 1, 1,
-1.005512, 0.358891, -0.598563, 1, 1, 1, 1, 1,
-1.003081, -0.6154227, -2.167254, 1, 1, 1, 1, 1,
-0.9885939, 0.9631409, -2.498577, 1, 1, 1, 1, 1,
-0.9869282, 0.09918156, -0.5645041, 1, 1, 1, 1, 1,
-0.9832311, -2.070367, -3.221606, 1, 1, 1, 1, 1,
-0.9786319, 0.3118971, -1.505816, 1, 1, 1, 1, 1,
-0.9679561, 0.3609222, -2.325919, 1, 1, 1, 1, 1,
-0.9676196, -0.130019, -0.1985081, 1, 1, 1, 1, 1,
-0.966793, -1.141801, -2.626055, 1, 1, 1, 1, 1,
-0.9658911, 0.5963491, -1.609605, 1, 1, 1, 1, 1,
-0.9641603, -0.4436039, -2.193189, 0, 0, 1, 1, 1,
-0.9567105, -0.962148, -1.15334, 1, 0, 0, 1, 1,
-0.9559701, -1.871742, -3.704526, 1, 0, 0, 1, 1,
-0.9483442, -0.9447791, -2.044413, 1, 0, 0, 1, 1,
-0.9470838, -0.4695919, -3.118487, 1, 0, 0, 1, 1,
-0.9443133, 1.008402, -1.193775, 1, 0, 0, 1, 1,
-0.9441851, -0.9410231, -3.34287, 0, 0, 0, 1, 1,
-0.9394151, 0.1017333, -0.1944367, 0, 0, 0, 1, 1,
-0.932871, 1.04602, -1.503878, 0, 0, 0, 1, 1,
-0.9320548, -2.315237, -0.8064519, 0, 0, 0, 1, 1,
-0.9315448, -0.5182487, -1.974126, 0, 0, 0, 1, 1,
-0.9210595, 0.2272164, -1.817957, 0, 0, 0, 1, 1,
-0.9183511, 2.091224, -1.443905, 0, 0, 0, 1, 1,
-0.9153877, -0.555207, -1.198146, 1, 1, 1, 1, 1,
-0.9132898, 0.4080063, -0.8070301, 1, 1, 1, 1, 1,
-0.9096514, 1.555881, -2.170527, 1, 1, 1, 1, 1,
-0.8958852, -0.08081796, -0.8401878, 1, 1, 1, 1, 1,
-0.8951836, -0.9926907, -1.692593, 1, 1, 1, 1, 1,
-0.8934484, -0.2683252, -3.153035, 1, 1, 1, 1, 1,
-0.8845133, 0.6806807, -2.436029, 1, 1, 1, 1, 1,
-0.8829154, 1.658962, -1.609352, 1, 1, 1, 1, 1,
-0.8802949, 0.3033819, -2.380384, 1, 1, 1, 1, 1,
-0.8774328, -1.080038, -3.808349, 1, 1, 1, 1, 1,
-0.8767958, -0.364142, -1.170205, 1, 1, 1, 1, 1,
-0.8737631, 0.7191182, 0.589236, 1, 1, 1, 1, 1,
-0.870637, 0.1449721, -0.3996588, 1, 1, 1, 1, 1,
-0.866907, 1.197179, -1.16078, 1, 1, 1, 1, 1,
-0.8657992, 0.1172086, -0.5462747, 1, 1, 1, 1, 1,
-0.8627814, -0.9623356, -1.22796, 0, 0, 1, 1, 1,
-0.8612655, -0.3189077, -1.293708, 1, 0, 0, 1, 1,
-0.8511115, 2.316783, 0.2221148, 1, 0, 0, 1, 1,
-0.8407395, 1.109093, -2.103302, 1, 0, 0, 1, 1,
-0.8324121, -0.9914039, -3.296842, 1, 0, 0, 1, 1,
-0.8322822, -0.4769363, -2.721481, 1, 0, 0, 1, 1,
-0.8280122, -0.4100862, -2.947608, 0, 0, 0, 1, 1,
-0.8274624, -0.8760749, -2.277267, 0, 0, 0, 1, 1,
-0.8265035, -0.8221036, -0.8349297, 0, 0, 0, 1, 1,
-0.8264474, -0.4239295, -0.4778092, 0, 0, 0, 1, 1,
-0.8224096, -1.100551, -2.79476, 0, 0, 0, 1, 1,
-0.8200147, -0.9227851, -1.502872, 0, 0, 0, 1, 1,
-0.8143801, 0.01406169, -1.836748, 0, 0, 0, 1, 1,
-0.8135513, 1.818808, -0.7782997, 1, 1, 1, 1, 1,
-0.8100619, 0.862213, -0.449836, 1, 1, 1, 1, 1,
-0.8092731, 0.1713115, -2.851936, 1, 1, 1, 1, 1,
-0.8036845, -0.7754088, -2.331272, 1, 1, 1, 1, 1,
-0.8010898, 0.9999278, 0.7174882, 1, 1, 1, 1, 1,
-0.8006331, -0.199064, -1.520501, 1, 1, 1, 1, 1,
-0.7994739, -1.790623, -2.647574, 1, 1, 1, 1, 1,
-0.7980163, -0.07978509, -4.003893, 1, 1, 1, 1, 1,
-0.7902677, -1.216803, -1.977937, 1, 1, 1, 1, 1,
-0.7878959, -0.134536, -1.765604, 1, 1, 1, 1, 1,
-0.7866539, -0.137087, -2.647364, 1, 1, 1, 1, 1,
-0.7789021, 0.7956579, -2.658775, 1, 1, 1, 1, 1,
-0.7768029, 1.326086, -2.165079, 1, 1, 1, 1, 1,
-0.7725985, 0.4607676, 0.4871205, 1, 1, 1, 1, 1,
-0.771297, 0.2450158, -2.297765, 1, 1, 1, 1, 1,
-0.7704744, 0.07456943, -1.335333, 0, 0, 1, 1, 1,
-0.7660786, -0.2063615, -1.502839, 1, 0, 0, 1, 1,
-0.7643673, 1.374486, -0.5153159, 1, 0, 0, 1, 1,
-0.763252, 0.005622543, -0.004834428, 1, 0, 0, 1, 1,
-0.7576803, -0.1326364, -2.088924, 1, 0, 0, 1, 1,
-0.7505327, 2.035487, 1.044217, 1, 0, 0, 1, 1,
-0.7472159, -0.104413, -0.001560614, 0, 0, 0, 1, 1,
-0.7415615, 0.06563573, -0.7430099, 0, 0, 0, 1, 1,
-0.7391099, -1.218112, -2.297489, 0, 0, 0, 1, 1,
-0.7323649, -1.13099, -2.664112, 0, 0, 0, 1, 1,
-0.7289756, -0.7429945, -2.550711, 0, 0, 0, 1, 1,
-0.7278659, -0.5932118, -3.112908, 0, 0, 0, 1, 1,
-0.7221578, -0.4503667, -3.458735, 0, 0, 0, 1, 1,
-0.7171922, -0.4419467, -0.7053785, 1, 1, 1, 1, 1,
-0.7151467, 0.2407248, -1.193731, 1, 1, 1, 1, 1,
-0.7137292, -1.626745, -1.961883, 1, 1, 1, 1, 1,
-0.7133232, -1.38201, -0.02768863, 1, 1, 1, 1, 1,
-0.7124141, 0.4837426, -0.4992926, 1, 1, 1, 1, 1,
-0.7111642, -1.571672, -1.565365, 1, 1, 1, 1, 1,
-0.709464, -0.2666108, -2.571794, 1, 1, 1, 1, 1,
-0.7094211, -1.355159, -2.310015, 1, 1, 1, 1, 1,
-0.7056048, -0.6399203, -1.839655, 1, 1, 1, 1, 1,
-0.7024699, -0.08442067, 0.4975426, 1, 1, 1, 1, 1,
-0.6996336, 1.846746, 0.4725814, 1, 1, 1, 1, 1,
-0.6995201, 0.4472623, -0.4620825, 1, 1, 1, 1, 1,
-0.6993012, -0.4667229, -3.085438, 1, 1, 1, 1, 1,
-0.6975048, 0.9787354, -2.052589, 1, 1, 1, 1, 1,
-0.6973668, -0.7275524, -1.232643, 1, 1, 1, 1, 1,
-0.6934307, 0.8060411, -1.463948, 0, 0, 1, 1, 1,
-0.692873, 1.237601, -1.356956, 1, 0, 0, 1, 1,
-0.6877692, 0.1861856, -2.086537, 1, 0, 0, 1, 1,
-0.6831112, -1.262562, -3.123714, 1, 0, 0, 1, 1,
-0.6828395, -0.2349989, -1.522682, 1, 0, 0, 1, 1,
-0.6770876, 0.1078448, -2.12526, 1, 0, 0, 1, 1,
-0.675585, -0.5917714, -1.361536, 0, 0, 0, 1, 1,
-0.6731788, 0.1411496, -2.784998, 0, 0, 0, 1, 1,
-0.6666492, 1.568304, -0.9082521, 0, 0, 0, 1, 1,
-0.6664991, 0.02316408, -1.889492, 0, 0, 0, 1, 1,
-0.6628881, -2.519645, -1.925662, 0, 0, 0, 1, 1,
-0.6625085, 0.2781582, -2.015475, 0, 0, 0, 1, 1,
-0.6618212, -0.5332224, -2.577474, 0, 0, 0, 1, 1,
-0.6593685, 1.026034, -0.4446109, 1, 1, 1, 1, 1,
-0.6576902, -1.266381, -4.701628, 1, 1, 1, 1, 1,
-0.6547483, 0.4662173, -1.59191, 1, 1, 1, 1, 1,
-0.6454089, -0.3538915, -2.04617, 1, 1, 1, 1, 1,
-0.6441347, -0.3435279, -1.589091, 1, 1, 1, 1, 1,
-0.6376624, -1.033969, -2.386022, 1, 1, 1, 1, 1,
-0.6311573, 0.171085, -2.088388, 1, 1, 1, 1, 1,
-0.6261005, 1.492869, 0.4247534, 1, 1, 1, 1, 1,
-0.6242985, 0.8203049, -0.7641487, 1, 1, 1, 1, 1,
-0.6226394, 0.1141776, -0.1936946, 1, 1, 1, 1, 1,
-0.6180373, -0.2265254, -0.1699346, 1, 1, 1, 1, 1,
-0.6176238, 0.6511099, -0.5985721, 1, 1, 1, 1, 1,
-0.6158329, 1.661042, -0.04695113, 1, 1, 1, 1, 1,
-0.6090002, 0.3037644, 0.3667214, 1, 1, 1, 1, 1,
-0.6071501, -1.172161, -3.334479, 1, 1, 1, 1, 1,
-0.6071489, 0.4806607, -1.834172, 0, 0, 1, 1, 1,
-0.6035268, -0.008911598, -2.09063, 1, 0, 0, 1, 1,
-0.6034643, -0.009853918, -4.321641, 1, 0, 0, 1, 1,
-0.6022559, 1.374303, -0.6036174, 1, 0, 0, 1, 1,
-0.6011019, -0.4648026, -1.788445, 1, 0, 0, 1, 1,
-0.5994346, 0.06709784, -2.038724, 1, 0, 0, 1, 1,
-0.5964672, -0.8002832, -2.213317, 0, 0, 0, 1, 1,
-0.5948609, -2.25001, -2.96752, 0, 0, 0, 1, 1,
-0.5937835, 1.156861, -0.1309151, 0, 0, 0, 1, 1,
-0.5929099, 0.04428218, -3.175786, 0, 0, 0, 1, 1,
-0.5928451, 2.54908, -1.441776, 0, 0, 0, 1, 1,
-0.5922807, -2.074914, -2.059247, 0, 0, 0, 1, 1,
-0.5844091, 0.1975837, -0.969809, 0, 0, 0, 1, 1,
-0.583483, 1.940689, -0.136832, 1, 1, 1, 1, 1,
-0.5792081, 1.842427, 1.141608, 1, 1, 1, 1, 1,
-0.5789968, 1.792376, 2.610148, 1, 1, 1, 1, 1,
-0.5738307, 0.5401489, 1.287252, 1, 1, 1, 1, 1,
-0.573024, 1.194405, -0.8948409, 1, 1, 1, 1, 1,
-0.5727074, 0.2795516, -1.433666, 1, 1, 1, 1, 1,
-0.5706089, -0.217362, -1.986888, 1, 1, 1, 1, 1,
-0.5620194, -0.5142881, -1.569268, 1, 1, 1, 1, 1,
-0.5585588, -1.096647, -2.454514, 1, 1, 1, 1, 1,
-0.5535535, -0.2931693, -2.375676, 1, 1, 1, 1, 1,
-0.5531194, -2.242696, -5.807552, 1, 1, 1, 1, 1,
-0.5491381, 2.772977, -0.3850147, 1, 1, 1, 1, 1,
-0.5450991, -1.458461, -3.389158, 1, 1, 1, 1, 1,
-0.5440989, -1.648478, -1.027682, 1, 1, 1, 1, 1,
-0.5438982, -1.378469, -4.036875, 1, 1, 1, 1, 1,
-0.5400631, 1.72512, -0.7434475, 0, 0, 1, 1, 1,
-0.5345325, 0.8888298, -2.92116, 1, 0, 0, 1, 1,
-0.5324501, 0.7386062, -0.4705529, 1, 0, 0, 1, 1,
-0.5320743, 0.4444297, -0.4037994, 1, 0, 0, 1, 1,
-0.5253935, -0.7001623, -4.012226, 1, 0, 0, 1, 1,
-0.5208493, -0.5833079, -1.016532, 1, 0, 0, 1, 1,
-0.5134773, 1.400041, -0.6255622, 0, 0, 0, 1, 1,
-0.5130052, 0.6568789, 0.008748915, 0, 0, 0, 1, 1,
-0.5066003, -0.6244193, -2.991134, 0, 0, 0, 1, 1,
-0.5051414, -1.377594, -1.961323, 0, 0, 0, 1, 1,
-0.5030137, -0.2114011, -2.209491, 0, 0, 0, 1, 1,
-0.5013728, 0.7701349, -0.5443785, 0, 0, 0, 1, 1,
-0.4990498, -0.7694484, -3.562137, 0, 0, 0, 1, 1,
-0.4980775, -0.2356228, -2.510886, 1, 1, 1, 1, 1,
-0.4967311, 1.213689, -2.65863, 1, 1, 1, 1, 1,
-0.4869502, -1.641562, -4.300529, 1, 1, 1, 1, 1,
-0.4851064, 1.048482, 0.4472863, 1, 1, 1, 1, 1,
-0.4832331, 1.168768, 0.356111, 1, 1, 1, 1, 1,
-0.4830455, 1.028045, -1.080509, 1, 1, 1, 1, 1,
-0.4769188, 0.6831769, -0.8642591, 1, 1, 1, 1, 1,
-0.4767635, 1.276548, -0.05102847, 1, 1, 1, 1, 1,
-0.4722368, -0.8342844, -2.618819, 1, 1, 1, 1, 1,
-0.4705018, -1.10071, -3.044137, 1, 1, 1, 1, 1,
-0.470058, 0.9769762, -0.1335038, 1, 1, 1, 1, 1,
-0.460282, -0.1338804, -0.5935941, 1, 1, 1, 1, 1,
-0.4582641, -1.578188, -0.6269633, 1, 1, 1, 1, 1,
-0.4550588, -0.04322958, -2.459135, 1, 1, 1, 1, 1,
-0.4523921, -0.6795711, -1.470451, 1, 1, 1, 1, 1,
-0.4518528, -0.5925317, -3.454388, 0, 0, 1, 1, 1,
-0.449109, 1.155436, -1.469878, 1, 0, 0, 1, 1,
-0.4464249, -0.5048348, -2.652922, 1, 0, 0, 1, 1,
-0.4423277, 0.3561716, -1.512426, 1, 0, 0, 1, 1,
-0.4409842, 0.2804598, -1.569533, 1, 0, 0, 1, 1,
-0.4403673, -0.6595315, -3.59449, 1, 0, 0, 1, 1,
-0.4359523, 1.301199, 0.1521534, 0, 0, 0, 1, 1,
-0.4351328, 1.757586, 0.9768209, 0, 0, 0, 1, 1,
-0.435074, -0.6885879, -2.74432, 0, 0, 0, 1, 1,
-0.4327545, 0.3362705, -1.577192, 0, 0, 0, 1, 1,
-0.4298478, -1.760481, -1.642857, 0, 0, 0, 1, 1,
-0.4295203, 0.3177635, 0.7610867, 0, 0, 0, 1, 1,
-0.4247444, 0.103115, -0.9335607, 0, 0, 0, 1, 1,
-0.4247294, 0.3903038, 0.241163, 1, 1, 1, 1, 1,
-0.4235281, -2.140798, -2.226769, 1, 1, 1, 1, 1,
-0.4213423, -2.096023, -3.478032, 1, 1, 1, 1, 1,
-0.41945, 0.5707953, -0.3549634, 1, 1, 1, 1, 1,
-0.4189112, -0.8440325, -2.672897, 1, 1, 1, 1, 1,
-0.4128437, -0.3822335, -3.492521, 1, 1, 1, 1, 1,
-0.4067027, -0.9255532, -5.25657, 1, 1, 1, 1, 1,
-0.3990592, -0.4614438, -2.418864, 1, 1, 1, 1, 1,
-0.3937442, -1.522516, -3.989575, 1, 1, 1, 1, 1,
-0.391193, -0.3436773, -2.480231, 1, 1, 1, 1, 1,
-0.3888091, -0.06878369, -1.762087, 1, 1, 1, 1, 1,
-0.381556, -0.0159295, -0.7609088, 1, 1, 1, 1, 1,
-0.380501, -0.09500393, -0.5213785, 1, 1, 1, 1, 1,
-0.3792884, 0.4459392, -0.6227441, 1, 1, 1, 1, 1,
-0.3778327, -1.593437, -2.907516, 1, 1, 1, 1, 1,
-0.3762057, -1.01556, -3.134123, 0, 0, 1, 1, 1,
-0.3739734, 0.4559523, -1.851647, 1, 0, 0, 1, 1,
-0.3733363, 0.1198922, -3.782944, 1, 0, 0, 1, 1,
-0.3732575, 1.84282, -0.7076428, 1, 0, 0, 1, 1,
-0.3721233, -2.189848, -2.621552, 1, 0, 0, 1, 1,
-0.3687158, -0.6825804, -2.978743, 1, 0, 0, 1, 1,
-0.3662871, -1.055208, -3.259523, 0, 0, 0, 1, 1,
-0.3606504, 2.190431, -0.5837896, 0, 0, 0, 1, 1,
-0.3593194, 0.3244607, -0.8228258, 0, 0, 0, 1, 1,
-0.3382162, -0.7837751, -3.33988, 0, 0, 0, 1, 1,
-0.3376302, 2.365839, 0.7640538, 0, 0, 0, 1, 1,
-0.3321691, 0.237695, -0.6081984, 0, 0, 0, 1, 1,
-0.3293471, -0.2559282, -3.384795, 0, 0, 0, 1, 1,
-0.3213825, -1.036711, -3.53914, 1, 1, 1, 1, 1,
-0.3200585, 1.697942, -0.5702125, 1, 1, 1, 1, 1,
-0.3176591, -0.01673092, -1.647039, 1, 1, 1, 1, 1,
-0.3172861, -0.05973733, -1.558872, 1, 1, 1, 1, 1,
-0.3159736, -1.046009, -2.338355, 1, 1, 1, 1, 1,
-0.3140523, -0.359773, -2.665208, 1, 1, 1, 1, 1,
-0.3125018, 0.5536316, 1.728518, 1, 1, 1, 1, 1,
-0.3070341, 1.170348, 0.09430054, 1, 1, 1, 1, 1,
-0.3057373, -0.222663, -1.828504, 1, 1, 1, 1, 1,
-0.3026247, 0.8450266, 0.137891, 1, 1, 1, 1, 1,
-0.3003113, 1.183448, -1.055527, 1, 1, 1, 1, 1,
-0.2950636, 2.650275, 0.02244986, 1, 1, 1, 1, 1,
-0.2932757, 0.7421109, -0.1379904, 1, 1, 1, 1, 1,
-0.291017, 0.7399701, 0.3272757, 1, 1, 1, 1, 1,
-0.28383, 0.08872548, -0.1403395, 1, 1, 1, 1, 1,
-0.2827754, 1.686661, 0.2589163, 0, 0, 1, 1, 1,
-0.273872, -1.243379, -3.321678, 1, 0, 0, 1, 1,
-0.2653722, -0.9761864, -2.796153, 1, 0, 0, 1, 1,
-0.2610229, 0.64908, -0.466892, 1, 0, 0, 1, 1,
-0.2579778, 1.061971, -0.01297065, 1, 0, 0, 1, 1,
-0.2569467, -0.3645561, -3.401572, 1, 0, 0, 1, 1,
-0.2546692, 0.1476129, -4.262188, 0, 0, 0, 1, 1,
-0.2515667, 0.491815, -0.5573084, 0, 0, 0, 1, 1,
-0.2505622, -0.5717643, -0.1291256, 0, 0, 0, 1, 1,
-0.247739, -1.181918, -2.284816, 0, 0, 0, 1, 1,
-0.2464646, -1.649011, -2.007283, 0, 0, 0, 1, 1,
-0.2455009, 0.1047139, -0.8087245, 0, 0, 0, 1, 1,
-0.2453329, 0.04467293, -1.334289, 0, 0, 0, 1, 1,
-0.2407169, -0.006563247, -0.9448136, 1, 1, 1, 1, 1,
-0.2362316, 2.10011, -0.6518288, 1, 1, 1, 1, 1,
-0.2332316, -0.3597991, -0.8866901, 1, 1, 1, 1, 1,
-0.2321584, -0.6302907, -1.168126, 1, 1, 1, 1, 1,
-0.2309476, 1.353462, 0.41918, 1, 1, 1, 1, 1,
-0.2285598, 1.823335, -0.006487765, 1, 1, 1, 1, 1,
-0.2226956, -0.6620535, -2.983203, 1, 1, 1, 1, 1,
-0.2121424, 0.4342134, -1.085437, 1, 1, 1, 1, 1,
-0.206483, 0.1132546, 0.4280998, 1, 1, 1, 1, 1,
-0.2046319, -0.8587393, -2.82976, 1, 1, 1, 1, 1,
-0.2034362, -0.8488853, -1.626061, 1, 1, 1, 1, 1,
-0.2008909, -1.603863, -3.062577, 1, 1, 1, 1, 1,
-0.2003115, -0.01469168, -0.5201498, 1, 1, 1, 1, 1,
-0.1983843, -1.227238, -2.42821, 1, 1, 1, 1, 1,
-0.1954797, 0.2328565, -1.557655, 1, 1, 1, 1, 1,
-0.1902937, 0.2209452, -2.770139, 0, 0, 1, 1, 1,
-0.1855363, 0.7063928, -0.3525998, 1, 0, 0, 1, 1,
-0.181796, 0.2195911, -0.9962551, 1, 0, 0, 1, 1,
-0.1817362, 0.5458379, -0.03515539, 1, 0, 0, 1, 1,
-0.1816076, -0.5240124, -4.128076, 1, 0, 0, 1, 1,
-0.1802459, -0.4978236, -1.77868, 1, 0, 0, 1, 1,
-0.1802422, -0.202137, -2.746603, 0, 0, 0, 1, 1,
-0.1797578, -0.3256516, -1.514137, 0, 0, 0, 1, 1,
-0.1785028, 1.419531, 0.8947989, 0, 0, 0, 1, 1,
-0.1784003, 0.9498048, -1.56506, 0, 0, 0, 1, 1,
-0.1771439, -0.7305322, -2.547654, 0, 0, 0, 1, 1,
-0.1767997, 0.2065742, -1.242318, 0, 0, 0, 1, 1,
-0.1738215, 0.6523185, -1.71039, 0, 0, 0, 1, 1,
-0.1736214, 0.5640658, -0.4270454, 1, 1, 1, 1, 1,
-0.172417, 0.3657108, -0.7079902, 1, 1, 1, 1, 1,
-0.169462, -0.04511118, -2.744533, 1, 1, 1, 1, 1,
-0.1689399, -1.011962, -3.59001, 1, 1, 1, 1, 1,
-0.1639873, 0.7251089, -0.2137209, 1, 1, 1, 1, 1,
-0.1629091, 1.763251, 1.928099, 1, 1, 1, 1, 1,
-0.1628633, -0.4579493, -2.109782, 1, 1, 1, 1, 1,
-0.1623427, 0.3642889, -0.6301079, 1, 1, 1, 1, 1,
-0.1618491, 1.497903, -0.6579978, 1, 1, 1, 1, 1,
-0.1610673, -0.1683709, -3.102408, 1, 1, 1, 1, 1,
-0.1585942, 0.4617452, -2.288409, 1, 1, 1, 1, 1,
-0.1557366, -0.7305297, -3.397687, 1, 1, 1, 1, 1,
-0.155569, -1.428573, -2.494951, 1, 1, 1, 1, 1,
-0.1552142, 0.4878149, 0.536711, 1, 1, 1, 1, 1,
-0.1547046, -0.2754892, -2.141582, 1, 1, 1, 1, 1,
-0.1539492, 0.8208186, 1.811842, 0, 0, 1, 1, 1,
-0.152472, 0.916291, 0.1390609, 1, 0, 0, 1, 1,
-0.1479126, 1.501447, 0.3117976, 1, 0, 0, 1, 1,
-0.1457159, -1.636587, -2.570489, 1, 0, 0, 1, 1,
-0.1447087, -0.3815886, -1.884116, 1, 0, 0, 1, 1,
-0.1364447, 0.2717776, -0.4720175, 1, 0, 0, 1, 1,
-0.131216, -0.4736519, -3.354546, 0, 0, 0, 1, 1,
-0.127792, 0.7574738, 0.6055127, 0, 0, 0, 1, 1,
-0.1275944, 0.6301095, -1.077644, 0, 0, 0, 1, 1,
-0.1238484, 1.530172, -0.7021338, 0, 0, 0, 1, 1,
-0.1226651, -0.1401667, -2.064152, 0, 0, 0, 1, 1,
-0.1221718, -1.157468, -2.312637, 0, 0, 0, 1, 1,
-0.1173714, -1.488855, -3.204731, 0, 0, 0, 1, 1,
-0.1172898, 1.005247, 1.113896, 1, 1, 1, 1, 1,
-0.1115908, -0.4529473, -0.177368, 1, 1, 1, 1, 1,
-0.1079251, -1.724598, -2.249818, 1, 1, 1, 1, 1,
-0.1071664, -0.0260945, 0.09900209, 1, 1, 1, 1, 1,
-0.1043938, 0.6073197, -0.7854066, 1, 1, 1, 1, 1,
-0.1025562, 0.5535643, 1.058635, 1, 1, 1, 1, 1,
-0.09876526, -1.38977, -3.132161, 1, 1, 1, 1, 1,
-0.09253068, -0.5531456, -4.631763, 1, 1, 1, 1, 1,
-0.08975861, -0.5103679, -3.291335, 1, 1, 1, 1, 1,
-0.08966117, -0.5323461, -3.036266, 1, 1, 1, 1, 1,
-0.08695034, -1.128513, -2.07622, 1, 1, 1, 1, 1,
-0.08636084, -0.09153716, -2.952209, 1, 1, 1, 1, 1,
-0.07904419, 0.02306103, -0.1995008, 1, 1, 1, 1, 1,
-0.07861674, -0.07438137, -1.229925, 1, 1, 1, 1, 1,
-0.07182324, -1.965397, -2.953714, 1, 1, 1, 1, 1,
-0.06828332, 0.8918517, -0.4610853, 0, 0, 1, 1, 1,
-0.06561683, 0.504355, 1.481676, 1, 0, 0, 1, 1,
-0.06454159, 0.5058473, -0.7517887, 1, 0, 0, 1, 1,
-0.06067169, 0.3675649, -0.01773461, 1, 0, 0, 1, 1,
-0.05820307, 0.2304163, 0.6264447, 1, 0, 0, 1, 1,
-0.05811613, -0.7523355, -2.323982, 1, 0, 0, 1, 1,
-0.05635619, -0.0002055109, -2.298672, 0, 0, 0, 1, 1,
-0.0486591, -0.6516111, -2.888655, 0, 0, 0, 1, 1,
-0.0478313, 1.034838, -1.346123, 0, 0, 0, 1, 1,
-0.04763978, 0.4467522, -0.3223028, 0, 0, 0, 1, 1,
-0.04598457, -0.944662, -3.744233, 0, 0, 0, 1, 1,
-0.04462608, 1.223872, -1.327767, 0, 0, 0, 1, 1,
-0.04421605, -1.428374, -3.617273, 0, 0, 0, 1, 1,
-0.0408373, -0.3649875, -3.703439, 1, 1, 1, 1, 1,
-0.03877728, 0.9411919, -0.7652586, 1, 1, 1, 1, 1,
-0.03669996, -0.1023809, -3.673419, 1, 1, 1, 1, 1,
-0.03083673, -0.3255631, -2.588989, 1, 1, 1, 1, 1,
-0.02335926, -0.6637405, -3.698814, 1, 1, 1, 1, 1,
-0.01703106, -0.6252946, -3.530312, 1, 1, 1, 1, 1,
-0.01424493, 0.4994984, 0.1092123, 1, 1, 1, 1, 1,
-0.01065556, 0.8903815, -0.0938196, 1, 1, 1, 1, 1,
-0.008570775, 0.9063321, 1.120388, 1, 1, 1, 1, 1,
-0.00588529, 0.7377289, -0.8605925, 1, 1, 1, 1, 1,
-0.004321742, -0.4545549, -2.473727, 1, 1, 1, 1, 1,
-0.00247974, 0.4700327, 0.1430361, 1, 1, 1, 1, 1,
-0.002041765, 0.05214702, -0.8649344, 1, 1, 1, 1, 1,
0.002534241, 0.3265914, -0.6266637, 1, 1, 1, 1, 1,
0.004458031, -0.8866984, 3.768044, 1, 1, 1, 1, 1,
0.005020059, -0.7461055, 3.497787, 0, 0, 1, 1, 1,
0.008695908, -0.2832555, 2.051703, 1, 0, 0, 1, 1,
0.009882288, -0.3494633, 2.735626, 1, 0, 0, 1, 1,
0.01043416, -2.194919, 3.397277, 1, 0, 0, 1, 1,
0.01209705, 0.8703901, 1.759191, 1, 0, 0, 1, 1,
0.01448718, 1.120789, 0.9097067, 1, 0, 0, 1, 1,
0.01651032, 0.7113326, -0.07323088, 0, 0, 0, 1, 1,
0.01982534, 0.8848364, -0.2854128, 0, 0, 0, 1, 1,
0.02144792, 1.306505, 0.3443176, 0, 0, 0, 1, 1,
0.02849364, -0.5619996, 3.640272, 0, 0, 0, 1, 1,
0.02866491, 0.3553057, -0.5806991, 0, 0, 0, 1, 1,
0.02885083, -0.9384521, 3.914471, 0, 0, 0, 1, 1,
0.03268427, 0.1937608, 0.04200328, 0, 0, 0, 1, 1,
0.03679697, 0.6969305, 0.1850635, 1, 1, 1, 1, 1,
0.03705094, -0.0966939, 3.931838, 1, 1, 1, 1, 1,
0.03846801, -0.2285982, 3.760701, 1, 1, 1, 1, 1,
0.04546185, -1.788178, 3.163438, 1, 1, 1, 1, 1,
0.04889413, -0.318942, 2.299482, 1, 1, 1, 1, 1,
0.04937378, -1.128563, 2.607489, 1, 1, 1, 1, 1,
0.05044125, -1.433705, 2.348589, 1, 1, 1, 1, 1,
0.05546331, 0.2285053, 0.5666883, 1, 1, 1, 1, 1,
0.05703618, 2.144803, -0.7720452, 1, 1, 1, 1, 1,
0.06012668, 0.8778704, -0.3980405, 1, 1, 1, 1, 1,
0.06157534, -0.6887914, 3.823641, 1, 1, 1, 1, 1,
0.06348661, 1.179035, -0.7225012, 1, 1, 1, 1, 1,
0.06719165, -0.8991296, 3.598084, 1, 1, 1, 1, 1,
0.06727623, -3.364659, 4.010451, 1, 1, 1, 1, 1,
0.06877378, -2.215694, 3.919512, 1, 1, 1, 1, 1,
0.06897052, -0.3535021, 2.25582, 0, 0, 1, 1, 1,
0.07089575, 0.3657465, 0.9995096, 1, 0, 0, 1, 1,
0.07299551, -0.09196045, 3.618007, 1, 0, 0, 1, 1,
0.07456612, 0.9605951, -0.006442223, 1, 0, 0, 1, 1,
0.0763019, 1.336774, -0.6408387, 1, 0, 0, 1, 1,
0.07664996, 0.3075197, 0.3899766, 1, 0, 0, 1, 1,
0.07785258, -0.4385693, 2.058051, 0, 0, 0, 1, 1,
0.08527131, -0.1632957, 2.52378, 0, 0, 0, 1, 1,
0.08555968, -0.2367222, 3.169178, 0, 0, 0, 1, 1,
0.0919028, 1.086188, 0.5092617, 0, 0, 0, 1, 1,
0.09860861, -0.4005713, 2.621197, 0, 0, 0, 1, 1,
0.09991144, -1.054341, 3.135096, 0, 0, 0, 1, 1,
0.110029, 0.03718605, 0.1304241, 0, 0, 0, 1, 1,
0.1113752, 1.270214, 0.5082038, 1, 1, 1, 1, 1,
0.1127489, 0.1562618, 1.317, 1, 1, 1, 1, 1,
0.1138099, -1.975844, 5.305199, 1, 1, 1, 1, 1,
0.1143126, 1.1328, 0.05660648, 1, 1, 1, 1, 1,
0.1144826, -0.6047543, 2.708965, 1, 1, 1, 1, 1,
0.115768, 0.4798166, -1.78153, 1, 1, 1, 1, 1,
0.1178777, -0.05360217, 1.319691, 1, 1, 1, 1, 1,
0.1212351, 0.172023, 1.371418, 1, 1, 1, 1, 1,
0.1246402, 0.5208886, -0.7370895, 1, 1, 1, 1, 1,
0.1260489, 0.09249352, 0.5008255, 1, 1, 1, 1, 1,
0.127238, -1.081534, 3.72991, 1, 1, 1, 1, 1,
0.1279571, 1.570872, 1.43113, 1, 1, 1, 1, 1,
0.1317721, 0.4879238, 0.9634604, 1, 1, 1, 1, 1,
0.1373817, -0.005629356, 0.7233682, 1, 1, 1, 1, 1,
0.1388067, 0.8261321, 1.486338, 1, 1, 1, 1, 1,
0.1428252, 0.9410403, -0.5756561, 0, 0, 1, 1, 1,
0.1487179, -0.5355843, 2.445126, 1, 0, 0, 1, 1,
0.1488792, 2.083333, 1.157924, 1, 0, 0, 1, 1,
0.1550658, -0.933112, 3.059916, 1, 0, 0, 1, 1,
0.1596808, -0.8703811, 4.546284, 1, 0, 0, 1, 1,
0.1616166, 1.07725, -0.8273299, 1, 0, 0, 1, 1,
0.1652355, -0.1370824, -0.6176034, 0, 0, 0, 1, 1,
0.1661397, 2.396521, -0.9631425, 0, 0, 0, 1, 1,
0.1720447, -1.192627, 2.529989, 0, 0, 0, 1, 1,
0.1739324, -0.410041, 1.639628, 0, 0, 0, 1, 1,
0.1743785, 0.824802, 1.717729, 0, 0, 0, 1, 1,
0.1747983, 0.8236032, 0.3624618, 0, 0, 0, 1, 1,
0.1753541, 0.8049546, -0.175739, 0, 0, 0, 1, 1,
0.1786773, -1.118507, 2.831776, 1, 1, 1, 1, 1,
0.1794548, -0.1238661, 2.575657, 1, 1, 1, 1, 1,
0.1826282, 2.02114, -1.360948, 1, 1, 1, 1, 1,
0.1827975, 0.3446735, 2.566893, 1, 1, 1, 1, 1,
0.1829014, 0.2707756, 0.2190716, 1, 1, 1, 1, 1,
0.1836993, -1.682362, 2.687727, 1, 1, 1, 1, 1,
0.1838812, 1.538107, 1.073879, 1, 1, 1, 1, 1,
0.1904948, 0.8024511, 0.8023764, 1, 1, 1, 1, 1,
0.2074274, 0.5756755, -0.554688, 1, 1, 1, 1, 1,
0.2086778, -0.3249126, 2.110284, 1, 1, 1, 1, 1,
0.214893, 0.01726674, -0.3130276, 1, 1, 1, 1, 1,
0.2178664, 0.6427129, -0.8757961, 1, 1, 1, 1, 1,
0.2189471, 0.05867008, 1.948312, 1, 1, 1, 1, 1,
0.2202844, 0.2018555, 1.925372, 1, 1, 1, 1, 1,
0.2232447, -0.965759, 1.137004, 1, 1, 1, 1, 1,
0.2251651, 0.1037578, 1.612497, 0, 0, 1, 1, 1,
0.226928, -0.2299167, 4.557913, 1, 0, 0, 1, 1,
0.2290042, 0.5053721, 0.4836162, 1, 0, 0, 1, 1,
0.2302882, -0.2920116, 2.512998, 1, 0, 0, 1, 1,
0.2304014, 0.6061143, -0.6357238, 1, 0, 0, 1, 1,
0.2333531, 1.101747, 1.616552, 1, 0, 0, 1, 1,
0.2388952, -1.849208, 3.305213, 0, 0, 0, 1, 1,
0.2427763, -1.107759, 3.870858, 0, 0, 0, 1, 1,
0.2444906, 0.7778379, -0.008005485, 0, 0, 0, 1, 1,
0.2462344, -0.8871666, 2.777055, 0, 0, 0, 1, 1,
0.2494867, 0.5220212, -0.9767151, 0, 0, 0, 1, 1,
0.2500551, -1.465177, 1.31166, 0, 0, 0, 1, 1,
0.2507322, -0.2494829, 2.599746, 0, 0, 0, 1, 1,
0.2531326, 0.5688276, 0.07731822, 1, 1, 1, 1, 1,
0.2536791, -0.1801695, 1.040423, 1, 1, 1, 1, 1,
0.2538266, 0.5502667, 0.6495158, 1, 1, 1, 1, 1,
0.2564508, 0.9292737, -0.8222446, 1, 1, 1, 1, 1,
0.2577569, 1.306164, -0.7343851, 1, 1, 1, 1, 1,
0.2590497, -1.0142, 2.93395, 1, 1, 1, 1, 1,
0.2632849, 0.4201031, 1.259375, 1, 1, 1, 1, 1,
0.2641447, 0.3024854, 1.820081, 1, 1, 1, 1, 1,
0.2641602, 0.6403252, 0.1184308, 1, 1, 1, 1, 1,
0.2651021, 0.7451218, -0.6572175, 1, 1, 1, 1, 1,
0.2656364, -0.9148515, 1.435684, 1, 1, 1, 1, 1,
0.269188, -0.2055223, 1.571514, 1, 1, 1, 1, 1,
0.2742474, -0.2795154, 4.378882, 1, 1, 1, 1, 1,
0.2764727, 0.7334776, 0.7837304, 1, 1, 1, 1, 1,
0.2819216, -0.21108, 1.321324, 1, 1, 1, 1, 1,
0.2834313, 0.7427112, 0.4441595, 0, 0, 1, 1, 1,
0.2872006, 1.002824, -0.2038822, 1, 0, 0, 1, 1,
0.2894768, -0.6709539, 3.617794, 1, 0, 0, 1, 1,
0.2927159, 2.435573, 0.5151657, 1, 0, 0, 1, 1,
0.2980458, 0.7489764, 2.447907, 1, 0, 0, 1, 1,
0.2981295, 1.147299, 0.4077047, 1, 0, 0, 1, 1,
0.3047754, 2.442239, 0.1867866, 0, 0, 0, 1, 1,
0.3076797, 1.329035, 1.153176, 0, 0, 0, 1, 1,
0.3085852, 1.725335, -1.396413, 0, 0, 0, 1, 1,
0.3088914, 1.452341, -0.4610585, 0, 0, 0, 1, 1,
0.3176777, -0.9936593, 2.833435, 0, 0, 0, 1, 1,
0.3226356, -1.158745, 2.749061, 0, 0, 0, 1, 1,
0.3241289, -1.050014, 3.684466, 0, 0, 0, 1, 1,
0.3243784, -0.4679843, 2.25752, 1, 1, 1, 1, 1,
0.3258971, -0.6634153, 4.458938, 1, 1, 1, 1, 1,
0.3279769, -0.5570191, 2.222411, 1, 1, 1, 1, 1,
0.3338664, -0.3357441, 1.789103, 1, 1, 1, 1, 1,
0.3350433, 0.209834, 0.3858995, 1, 1, 1, 1, 1,
0.3459187, -1.107635, 2.026078, 1, 1, 1, 1, 1,
0.3496194, -1.365115, 0.9291162, 1, 1, 1, 1, 1,
0.3515763, -0.3790212, 1.154382, 1, 1, 1, 1, 1,
0.3565094, -0.1674381, 2.655014, 1, 1, 1, 1, 1,
0.3585126, 0.117857, -0.1658789, 1, 1, 1, 1, 1,
0.361277, 1.563124, 0.876, 1, 1, 1, 1, 1,
0.3630214, 0.1974278, 0.8095163, 1, 1, 1, 1, 1,
0.3638909, 0.8656077, 0.9314133, 1, 1, 1, 1, 1,
0.3648643, 0.6986228, 2.60345, 1, 1, 1, 1, 1,
0.3654008, 1.212135, -0.7287953, 1, 1, 1, 1, 1,
0.3660457, -0.6692237, 4.096272, 0, 0, 1, 1, 1,
0.3669829, -0.7767096, 2.847589, 1, 0, 0, 1, 1,
0.3741986, 0.05151584, 2.032636, 1, 0, 0, 1, 1,
0.3762902, 0.4204831, -0.8390757, 1, 0, 0, 1, 1,
0.3773656, 0.9904045, -0.08518735, 1, 0, 0, 1, 1,
0.3800177, 0.3528838, 3.297832, 1, 0, 0, 1, 1,
0.3835452, 0.6704289, 0.6781291, 0, 0, 0, 1, 1,
0.3895269, -0.06933279, 2.477164, 0, 0, 0, 1, 1,
0.3896262, -0.8113045, 2.384096, 0, 0, 0, 1, 1,
0.3930475, 0.8005623, 1.89771, 0, 0, 0, 1, 1,
0.3959686, -0.07075817, 1.630277, 0, 0, 0, 1, 1,
0.3998021, -1.642078, 3.739413, 0, 0, 0, 1, 1,
0.4014092, -0.08084808, 0.5830626, 0, 0, 0, 1, 1,
0.4019595, 0.3768399, 1.42608, 1, 1, 1, 1, 1,
0.4142108, 0.812874, 0.617797, 1, 1, 1, 1, 1,
0.4180698, -0.5049573, 3.37014, 1, 1, 1, 1, 1,
0.4207773, -0.2460933, 0.8478599, 1, 1, 1, 1, 1,
0.4243435, -0.7417683, 3.005181, 1, 1, 1, 1, 1,
0.4256846, -0.2618614, 2.906021, 1, 1, 1, 1, 1,
0.4276804, -1.035113, 3.442199, 1, 1, 1, 1, 1,
0.4367755, -0.2724503, 3.788724, 1, 1, 1, 1, 1,
0.4387946, 0.9494566, -0.603881, 1, 1, 1, 1, 1,
0.4411753, -0.8970542, 2.39009, 1, 1, 1, 1, 1,
0.4420029, 0.8776961, -1.627506, 1, 1, 1, 1, 1,
0.444764, 0.3705424, 0.9334923, 1, 1, 1, 1, 1,
0.4487939, 2.92989, 0.9656645, 1, 1, 1, 1, 1,
0.4490874, 0.3025142, 1.136762, 1, 1, 1, 1, 1,
0.4505842, 1.386427, 0.1490602, 1, 1, 1, 1, 1,
0.4513825, -0.3185388, 1.698972, 0, 0, 1, 1, 1,
0.458116, -0.6266071, 3.403223, 1, 0, 0, 1, 1,
0.4597996, -0.1504046, 2.378552, 1, 0, 0, 1, 1,
0.4654105, 0.4026107, 1.639742, 1, 0, 0, 1, 1,
0.46741, 0.2888118, -0.1563039, 1, 0, 0, 1, 1,
0.4732705, 0.627182, 2.092826, 1, 0, 0, 1, 1,
0.4766425, -1.31277, 0.8234749, 0, 0, 0, 1, 1,
0.4774055, -1.443872, 4.157469, 0, 0, 0, 1, 1,
0.4849112, -0.03780701, 1.715206, 0, 0, 0, 1, 1,
0.4857771, 1.998906, 0.1545066, 0, 0, 0, 1, 1,
0.4861585, -0.3276495, 2.599286, 0, 0, 0, 1, 1,
0.4867876, 0.8716295, 0.369276, 0, 0, 0, 1, 1,
0.4868346, -0.07966591, 0.8595181, 0, 0, 0, 1, 1,
0.4939344, -0.8996984, 3.628621, 1, 1, 1, 1, 1,
0.495029, -1.728027, 1.434305, 1, 1, 1, 1, 1,
0.4966764, -0.3816334, 2.026315, 1, 1, 1, 1, 1,
0.4976139, -0.5491163, 1.736879, 1, 1, 1, 1, 1,
0.4978839, 1.558913, 0.8210692, 1, 1, 1, 1, 1,
0.4993827, 1.23407, 1.289453, 1, 1, 1, 1, 1,
0.501138, -1.242444, 5.037857, 1, 1, 1, 1, 1,
0.5012038, -2.469913, 2.949733, 1, 1, 1, 1, 1,
0.5028942, -0.1908639, 0.9650189, 1, 1, 1, 1, 1,
0.5067911, -0.01742614, 4.100543, 1, 1, 1, 1, 1,
0.5108861, 0.4851672, 2.872242, 1, 1, 1, 1, 1,
0.5193211, -0.484989, -0.08983996, 1, 1, 1, 1, 1,
0.5238472, -0.9207467, 0.9114383, 1, 1, 1, 1, 1,
0.5263709, -0.3204804, 1.842049, 1, 1, 1, 1, 1,
0.5286933, -0.8452979, 3.570907, 1, 1, 1, 1, 1,
0.5325202, 1.030082, 1.702403, 0, 0, 1, 1, 1,
0.5350051, -1.01613, 2.832221, 1, 0, 0, 1, 1,
0.5439589, 0.2876393, -0.8318283, 1, 0, 0, 1, 1,
0.5556597, -2.716192, 3.166013, 1, 0, 0, 1, 1,
0.5572905, 1.535558, -0.3455958, 1, 0, 0, 1, 1,
0.5573474, 1.298249, 1.382053, 1, 0, 0, 1, 1,
0.5578977, 1.862157, -0.6186407, 0, 0, 0, 1, 1,
0.5588831, -0.9402555, 2.792951, 0, 0, 0, 1, 1,
0.5661405, -1.128023, 1.053933, 0, 0, 0, 1, 1,
0.5664493, 0.1863387, 2.055343, 0, 0, 0, 1, 1,
0.5713708, -0.7390114, 4.460138, 0, 0, 0, 1, 1,
0.5757629, 1.123378, 1.61631, 0, 0, 0, 1, 1,
0.5789848, 0.05038942, 1.549816, 0, 0, 0, 1, 1,
0.5797392, 1.555191, -0.08836355, 1, 1, 1, 1, 1,
0.5804124, -1.528772, 3.457201, 1, 1, 1, 1, 1,
0.5804672, 0.9989243, 0.4263176, 1, 1, 1, 1, 1,
0.5822716, 0.253511, 1.39366, 1, 1, 1, 1, 1,
0.5848578, 1.960222, -0.3347259, 1, 1, 1, 1, 1,
0.5895904, 0.5592051, -0.4288092, 1, 1, 1, 1, 1,
0.5971305, 0.1568833, 0.3520085, 1, 1, 1, 1, 1,
0.6002016, 0.6880552, -0.4794247, 1, 1, 1, 1, 1,
0.6005891, 0.205616, 0.2365668, 1, 1, 1, 1, 1,
0.6014184, -0.3203288, 2.072799, 1, 1, 1, 1, 1,
0.6020043, -1.256962, 2.881981, 1, 1, 1, 1, 1,
0.603573, 1.061197, 0.8524444, 1, 1, 1, 1, 1,
0.6101518, -0.03354196, 0.481381, 1, 1, 1, 1, 1,
0.6101667, 1.008308, 0.334943, 1, 1, 1, 1, 1,
0.6120258, -2.328794, 2.860868, 1, 1, 1, 1, 1,
0.6130887, -0.5879287, 3.650246, 0, 0, 1, 1, 1,
0.6160596, -0.1655458, 3.054863, 1, 0, 0, 1, 1,
0.6246651, -0.197218, 0.9910685, 1, 0, 0, 1, 1,
0.6262908, 0.5846105, -0.0865268, 1, 0, 0, 1, 1,
0.6277353, -0.03497029, 2.228307, 1, 0, 0, 1, 1,
0.6278095, -0.6345633, 3.179305, 1, 0, 0, 1, 1,
0.6291264, -0.694359, -0.1213484, 0, 0, 0, 1, 1,
0.6334961, 1.548462, 1.167328, 0, 0, 0, 1, 1,
0.6440852, 1.187807, 0.8038674, 0, 0, 0, 1, 1,
0.6474605, -1.529204, 2.500446, 0, 0, 0, 1, 1,
0.6524474, 1.034497, 1.992941, 0, 0, 0, 1, 1,
0.6527027, -1.424751, 2.707933, 0, 0, 0, 1, 1,
0.6562395, -1.716295, 0.9805968, 0, 0, 0, 1, 1,
0.6575419, 0.3027212, 0.4917682, 1, 1, 1, 1, 1,
0.6578203, 0.4836452, 0.3901064, 1, 1, 1, 1, 1,
0.6583723, -1.248241, 2.821683, 1, 1, 1, 1, 1,
0.6605685, 0.1395148, 1.426407, 1, 1, 1, 1, 1,
0.6608595, -0.4404207, -0.06903893, 1, 1, 1, 1, 1,
0.6623804, 0.3087362, 2.250384, 1, 1, 1, 1, 1,
0.6623856, -0.3396741, 0.9826781, 1, 1, 1, 1, 1,
0.6707582, -2.616208, 2.369142, 1, 1, 1, 1, 1,
0.6716514, -0.2677803, 0.5155886, 1, 1, 1, 1, 1,
0.6732589, 0.6330431, -0.132031, 1, 1, 1, 1, 1,
0.6738673, -0.7483746, 4.320139, 1, 1, 1, 1, 1,
0.67858, -0.3370385, 2.140688, 1, 1, 1, 1, 1,
0.6832674, 0.1727683, 2.906972, 1, 1, 1, 1, 1,
0.6853073, 0.08987793, -0.1317152, 1, 1, 1, 1, 1,
0.6867196, -1.380085, 2.828238, 1, 1, 1, 1, 1,
0.6872475, -0.5876387, 2.647165, 0, 0, 1, 1, 1,
0.6949434, -1.01309, 1.62535, 1, 0, 0, 1, 1,
0.695133, -0.1010522, 1.193824, 1, 0, 0, 1, 1,
0.6993075, 0.1532699, 1.342228, 1, 0, 0, 1, 1,
0.6994005, 1.119864, 0.2137268, 1, 0, 0, 1, 1,
0.7017739, 0.415545, 1.042051, 1, 0, 0, 1, 1,
0.70749, 0.7062125, 0.6634411, 0, 0, 0, 1, 1,
0.70842, 0.3391207, 1.957823, 0, 0, 0, 1, 1,
0.7103851, 0.6950707, 1.403656, 0, 0, 0, 1, 1,
0.7122355, 0.9970366, 0.9155558, 0, 0, 0, 1, 1,
0.7226202, -0.7981489, 2.565968, 0, 0, 0, 1, 1,
0.7262132, 0.2957697, 0.6984073, 0, 0, 0, 1, 1,
0.7304305, 0.3158955, 1.599743, 0, 0, 0, 1, 1,
0.7326258, -1.085534, 1.499853, 1, 1, 1, 1, 1,
0.7385721, 1.020618, 0.6863664, 1, 1, 1, 1, 1,
0.738616, 1.517336, 0.6402185, 1, 1, 1, 1, 1,
0.7411779, -1.230539, 2.166533, 1, 1, 1, 1, 1,
0.7424452, -2.026046, 2.394302, 1, 1, 1, 1, 1,
0.7452136, -0.2236682, 2.069117, 1, 1, 1, 1, 1,
0.7457361, -0.06155589, 1.771753, 1, 1, 1, 1, 1,
0.7471122, 1.49553, 0.8815556, 1, 1, 1, 1, 1,
0.7494099, -1.63163, 0.7572966, 1, 1, 1, 1, 1,
0.7495348, -0.251799, 1.413953, 1, 1, 1, 1, 1,
0.7497881, -0.3947202, 0.6931663, 1, 1, 1, 1, 1,
0.750048, -1.032037, 1.838496, 1, 1, 1, 1, 1,
0.7510142, -0.4459494, 3.479342, 1, 1, 1, 1, 1,
0.7547511, -0.5310718, 2.692606, 1, 1, 1, 1, 1,
0.7628342, 1.226295, 0.8709238, 1, 1, 1, 1, 1,
0.7681174, -0.02999294, 2.838257, 0, 0, 1, 1, 1,
0.772181, -0.05607552, 2.14254, 1, 0, 0, 1, 1,
0.7818859, 1.460846, 1.171866, 1, 0, 0, 1, 1,
0.7828499, -0.4248666, 3.224756, 1, 0, 0, 1, 1,
0.7904993, -0.2658741, 1.966924, 1, 0, 0, 1, 1,
0.7969159, 0.4899586, 0.9195886, 1, 0, 0, 1, 1,
0.7971388, -0.1238197, 1.780128, 0, 0, 0, 1, 1,
0.8119157, -0.0050916, -0.8397536, 0, 0, 0, 1, 1,
0.8157282, 0.8069808, 0.4862495, 0, 0, 0, 1, 1,
0.8158385, -0.2787422, 0.8645087, 0, 0, 0, 1, 1,
0.817961, 0.355459, 2.215807, 0, 0, 0, 1, 1,
0.8210433, 0.6179571, 0.8835116, 0, 0, 0, 1, 1,
0.829949, -0.6123887, 1.266812, 0, 0, 0, 1, 1,
0.8300855, -1.258331, 3.291831, 1, 1, 1, 1, 1,
0.8350597, 0.4704394, -0.1977571, 1, 1, 1, 1, 1,
0.8351658, 0.796995, 0.8742629, 1, 1, 1, 1, 1,
0.8351972, 0.9163542, 0.8307275, 1, 1, 1, 1, 1,
0.8408177, -1.293321, 2.840744, 1, 1, 1, 1, 1,
0.8478196, 0.4568226, 0.2061733, 1, 1, 1, 1, 1,
0.8494641, 1.016353, 0.2666255, 1, 1, 1, 1, 1,
0.8514758, -1.667907, 0.9876145, 1, 1, 1, 1, 1,
0.8528231, -1.159771, 0.7956745, 1, 1, 1, 1, 1,
0.8553625, 0.6548868, 0.3007321, 1, 1, 1, 1, 1,
0.8564639, -0.8711322, 3.441284, 1, 1, 1, 1, 1,
0.8575274, 0.02218351, 1.703565, 1, 1, 1, 1, 1,
0.8630264, -0.8897442, 2.530678, 1, 1, 1, 1, 1,
0.870154, -2.010856, 2.543412, 1, 1, 1, 1, 1,
0.8712986, 0.6361092, 2.092241, 1, 1, 1, 1, 1,
0.8726348, -0.764609, 2.810884, 0, 0, 1, 1, 1,
0.8770809, -2.407991, 2.74426, 1, 0, 0, 1, 1,
0.8773777, 0.2717394, 1.520681, 1, 0, 0, 1, 1,
0.8782316, -0.07497478, 0.842428, 1, 0, 0, 1, 1,
0.8827833, 1.194765, -0.8129836, 1, 0, 0, 1, 1,
0.8846876, 0.3306872, 1.908127, 1, 0, 0, 1, 1,
0.8908828, -0.03427002, 1.236247, 0, 0, 0, 1, 1,
0.8964141, -0.1484298, 1.767104, 0, 0, 0, 1, 1,
0.8965064, 0.007629305, 1.342937, 0, 0, 0, 1, 1,
0.8969808, -0.09722629, 1.892253, 0, 0, 0, 1, 1,
0.8990357, 1.331983, 0.3506974, 0, 0, 0, 1, 1,
0.8991432, -0.1243844, 1.94626, 0, 0, 0, 1, 1,
0.8995486, 0.526974, 1.679949, 0, 0, 0, 1, 1,
0.901535, 1.139684, 0.4071282, 1, 1, 1, 1, 1,
0.9056671, -0.04137006, 1.324326, 1, 1, 1, 1, 1,
0.9076898, 1.12954, 0.5643317, 1, 1, 1, 1, 1,
0.9159577, 0.2996174, -0.01089651, 1, 1, 1, 1, 1,
0.9168889, -0.1504961, 0.8340984, 1, 1, 1, 1, 1,
0.9175742, -0.2496627, 0.9697225, 1, 1, 1, 1, 1,
0.9188474, 0.2345388, 2.35141, 1, 1, 1, 1, 1,
0.9226418, 0.6270708, 0.1464561, 1, 1, 1, 1, 1,
0.924414, 0.2854097, 3.996431, 1, 1, 1, 1, 1,
0.9269825, -0.3614315, 0.9604366, 1, 1, 1, 1, 1,
0.9287714, -0.05651915, 1.564613, 1, 1, 1, 1, 1,
0.9347017, -0.4558411, 0.134967, 1, 1, 1, 1, 1,
0.9435391, 0.03199612, 1.411258, 1, 1, 1, 1, 1,
0.9531771, -1.696723, 2.159245, 1, 1, 1, 1, 1,
0.9555064, -0.6947497, 2.614475, 1, 1, 1, 1, 1,
0.9593832, 0.8260925, -0.3207511, 0, 0, 1, 1, 1,
0.961665, -0.8721747, 3.822257, 1, 0, 0, 1, 1,
0.9672991, -0.9909053, 0.2305053, 1, 0, 0, 1, 1,
0.9710032, 0.07001329, -0.6164591, 1, 0, 0, 1, 1,
0.9730042, 0.6577311, 0.8711938, 1, 0, 0, 1, 1,
0.9769903, -0.8435391, 2.371763, 1, 0, 0, 1, 1,
0.9773929, -1.910756, 3.486863, 0, 0, 0, 1, 1,
0.9881461, 0.4325553, 0.9190703, 0, 0, 0, 1, 1,
0.9892464, -0.3058285, 0.1750015, 0, 0, 0, 1, 1,
0.9919422, 1.401176, -0.06744486, 0, 0, 0, 1, 1,
1.0013, 1.147487, 2.234535, 0, 0, 0, 1, 1,
1.003654, -0.1627792, 2.313692, 0, 0, 0, 1, 1,
1.004785, -0.4735557, 1.046297, 0, 0, 0, 1, 1,
1.006985, -0.06407487, 0.9039328, 1, 1, 1, 1, 1,
1.011855, -0.3477848, 0.4371314, 1, 1, 1, 1, 1,
1.012501, -0.7820923, 5.481318, 1, 1, 1, 1, 1,
1.015106, -0.6159258, 4.308593, 1, 1, 1, 1, 1,
1.041424, 2.240997, 0.8749471, 1, 1, 1, 1, 1,
1.041631, 0.2994118, 0.3328413, 1, 1, 1, 1, 1,
1.044784, 0.1812466, 2.279387, 1, 1, 1, 1, 1,
1.045792, 0.9549488, -0.3309911, 1, 1, 1, 1, 1,
1.05778, 1.31269, 2.771555, 1, 1, 1, 1, 1,
1.072852, 0.7265347, -0.8088082, 1, 1, 1, 1, 1,
1.075883, 0.0002415647, 0.9525957, 1, 1, 1, 1, 1,
1.079065, -1.232087, 3.708811, 1, 1, 1, 1, 1,
1.080438, 0.9313358, 0.3889652, 1, 1, 1, 1, 1,
1.09225, 1.549164, 0.4826377, 1, 1, 1, 1, 1,
1.092387, -0.3030799, 1.372924, 1, 1, 1, 1, 1,
1.094424, 1.557158, -0.5758528, 0, 0, 1, 1, 1,
1.098987, -0.0299309, -0.02258343, 1, 0, 0, 1, 1,
1.100429, -0.7533907, 1.676602, 1, 0, 0, 1, 1,
1.101027, -1.20908, 1.614657, 1, 0, 0, 1, 1,
1.102064, -0.6814973, 1.929179, 1, 0, 0, 1, 1,
1.102073, -0.5693429, 2.395752, 1, 0, 0, 1, 1,
1.106175, 0.1903344, 0.5811747, 0, 0, 0, 1, 1,
1.108763, 0.8162037, -0.4512628, 0, 0, 0, 1, 1,
1.111041, -0.1953458, 0.8513596, 0, 0, 0, 1, 1,
1.142751, 1.109516, 2.658006, 0, 0, 0, 1, 1,
1.149514, 0.6862394, 1.755503, 0, 0, 0, 1, 1,
1.14956, 1.08715, 1.658597, 0, 0, 0, 1, 1,
1.15052, 0.3702908, -0.5541881, 0, 0, 0, 1, 1,
1.151556, -0.3533952, 0.4105625, 1, 1, 1, 1, 1,
1.151586, -0.03824344, 1.067384, 1, 1, 1, 1, 1,
1.152036, 0.7051647, 0.5559854, 1, 1, 1, 1, 1,
1.163006, 0.3160874, 2.031045, 1, 1, 1, 1, 1,
1.165136, -0.9805415, 1.667638, 1, 1, 1, 1, 1,
1.166628, -0.5645532, 2.191501, 1, 1, 1, 1, 1,
1.173072, -0.716309, 1.721489, 1, 1, 1, 1, 1,
1.178682, 0.1563674, 1.025438, 1, 1, 1, 1, 1,
1.182154, -0.7216011, 4.027571, 1, 1, 1, 1, 1,
1.197664, -1.921197, 1.740753, 1, 1, 1, 1, 1,
1.197705, 1.51696, 0.7344686, 1, 1, 1, 1, 1,
1.202629, 0.4405327, 2.483377, 1, 1, 1, 1, 1,
1.203977, 0.3743138, 1.746264, 1, 1, 1, 1, 1,
1.208661, 1.228071, 2.945732, 1, 1, 1, 1, 1,
1.213906, -1.592731, 2.388133, 1, 1, 1, 1, 1,
1.214569, 0.8562573, 0.8353918, 0, 0, 1, 1, 1,
1.215816, 0.785473, 2.283764, 1, 0, 0, 1, 1,
1.222051, 0.5116581, 1.504429, 1, 0, 0, 1, 1,
1.222376, -0.1032625, 0.2821984, 1, 0, 0, 1, 1,
1.22286, 0.6046968, 1.794017, 1, 0, 0, 1, 1,
1.227914, 0.5773141, 0.6096284, 1, 0, 0, 1, 1,
1.243466, 0.3504133, 0.09770042, 0, 0, 0, 1, 1,
1.24608, -0.7931335, 1.275942, 0, 0, 0, 1, 1,
1.27426, 0.3886446, 1.140524, 0, 0, 0, 1, 1,
1.278274, -0.8991442, -0.2724548, 0, 0, 0, 1, 1,
1.288326, 1.466495, 0.652743, 0, 0, 0, 1, 1,
1.289795, 0.8073904, 1.901992, 0, 0, 0, 1, 1,
1.30281, 1.068934, -0.2074799, 0, 0, 0, 1, 1,
1.305155, 0.05404072, 2.561763, 1, 1, 1, 1, 1,
1.307402, -0.8360303, 2.797031, 1, 1, 1, 1, 1,
1.316051, -0.5467864, 1.645774, 1, 1, 1, 1, 1,
1.322187, 0.8038582, 0.4713254, 1, 1, 1, 1, 1,
1.322963, 0.4023062, 0.8379213, 1, 1, 1, 1, 1,
1.328743, -0.6997402, 5.270621, 1, 1, 1, 1, 1,
1.328874, -0.2235299, 1.424606, 1, 1, 1, 1, 1,
1.329692, 0.5271928, 1.411352, 1, 1, 1, 1, 1,
1.335169, -2.230644, 2.75056, 1, 1, 1, 1, 1,
1.337757, -0.2395007, 1.069539, 1, 1, 1, 1, 1,
1.342106, 0.09028374, 1.834123, 1, 1, 1, 1, 1,
1.351983, 0.8340283, 1.057782, 1, 1, 1, 1, 1,
1.361619, -0.1661945, 1.240887, 1, 1, 1, 1, 1,
1.3649, -0.6484126, 4.514694, 1, 1, 1, 1, 1,
1.374727, 1.346243, 0.257713, 1, 1, 1, 1, 1,
1.37947, -0.896125, 0.9600524, 0, 0, 1, 1, 1,
1.384835, -1.180838, 0.8503727, 1, 0, 0, 1, 1,
1.405319, -1.087991, 3.309297, 1, 0, 0, 1, 1,
1.415691, 1.515894, -1.382459, 1, 0, 0, 1, 1,
1.422121, -0.7726257, 1.562716, 1, 0, 0, 1, 1,
1.432418, -0.6932221, 2.757904, 1, 0, 0, 1, 1,
1.43882, 0.8133792, 0.842592, 0, 0, 0, 1, 1,
1.46331, 1.111328, -0.5841239, 0, 0, 0, 1, 1,
1.471047, -1.413372, 2.415834, 0, 0, 0, 1, 1,
1.479507, 0.2640664, 0.3297096, 0, 0, 0, 1, 1,
1.501328, 0.314726, 2.67245, 0, 0, 0, 1, 1,
1.509249, -0.3931112, 1.720873, 0, 0, 0, 1, 1,
1.514871, -0.451606, 0.919761, 0, 0, 0, 1, 1,
1.550827, -0.4674489, 2.256337, 1, 1, 1, 1, 1,
1.572519, -0.1765157, 1.652479, 1, 1, 1, 1, 1,
1.590358, 2.608099, -0.2153143, 1, 1, 1, 1, 1,
1.613967, 1.000729, 2.127616, 1, 1, 1, 1, 1,
1.615391, -0.8261471, 2.228359, 1, 1, 1, 1, 1,
1.627813, -0.2729833, 0.7604537, 1, 1, 1, 1, 1,
1.658445, -0.4161098, 2.858335, 1, 1, 1, 1, 1,
1.68192, 0.1500452, 4.785538, 1, 1, 1, 1, 1,
1.688388, 0.1465098, 1.535676, 1, 1, 1, 1, 1,
1.70251, -0.7357717, 0.611999, 1, 1, 1, 1, 1,
1.704443, -0.6414967, 1.966309, 1, 1, 1, 1, 1,
1.722629, -1.287213, 3.736818, 1, 1, 1, 1, 1,
1.747553, 1.051151, 0.736326, 1, 1, 1, 1, 1,
1.755148, -0.9506686, 2.533663, 1, 1, 1, 1, 1,
1.766781, 0.9760529, 2.286962, 1, 1, 1, 1, 1,
1.776418, 0.5896973, -0.1458633, 0, 0, 1, 1, 1,
1.778036, 0.748328, 2.593159, 1, 0, 0, 1, 1,
1.791083, 1.657569, 0.3794558, 1, 0, 0, 1, 1,
1.79839, 0.4566341, 2.213138, 1, 0, 0, 1, 1,
1.806103, -1.459454, 2.237768, 1, 0, 0, 1, 1,
1.819937, -0.8903177, 0.3329258, 1, 0, 0, 1, 1,
1.835318, 0.7289168, -0.02008091, 0, 0, 0, 1, 1,
1.842755, -0.4318073, 0.4888073, 0, 0, 0, 1, 1,
1.843555, -0.05588871, 2.896051, 0, 0, 0, 1, 1,
1.855147, 0.8347701, 1.505581, 0, 0, 0, 1, 1,
1.855886, 0.7844605, 0.527402, 0, 0, 0, 1, 1,
1.863836, -1.83636, 2.302173, 0, 0, 0, 1, 1,
1.870282, -0.4485481, 2.582442, 0, 0, 0, 1, 1,
1.874115, -0.2650717, 1.048995, 1, 1, 1, 1, 1,
1.874334, 0.5101573, 1.72202, 1, 1, 1, 1, 1,
1.902709, 0.1543631, 1.000497, 1, 1, 1, 1, 1,
1.903794, -0.9087319, 1.761009, 1, 1, 1, 1, 1,
1.940911, 1.863815, 0.7097448, 1, 1, 1, 1, 1,
1.96886, -0.8570112, 1.026657, 1, 1, 1, 1, 1,
1.969946, 0.9045011, -0.8771273, 1, 1, 1, 1, 1,
2.006789, -0.6836496, 2.429453, 1, 1, 1, 1, 1,
2.008449, -0.3916055, 1.967424, 1, 1, 1, 1, 1,
2.041536, 1.459112, 1.105955, 1, 1, 1, 1, 1,
2.082036, 0.3199154, 2.082832, 1, 1, 1, 1, 1,
2.105802, 0.5754319, 1.402869, 1, 1, 1, 1, 1,
2.107592, 0.2556167, -0.9934379, 1, 1, 1, 1, 1,
2.144078, 2.038502, 0.2613814, 1, 1, 1, 1, 1,
2.173934, 1.469378, 1.048731, 1, 1, 1, 1, 1,
2.190631, -1.634546, 3.739868, 0, 0, 1, 1, 1,
2.230417, 1.685912, 2.757924, 1, 0, 0, 1, 1,
2.254371, -0.7873845, 3.226123, 1, 0, 0, 1, 1,
2.274806, 1.244755, 2.491942, 1, 0, 0, 1, 1,
2.277192, -0.1216414, 0.305145, 1, 0, 0, 1, 1,
2.278062, 1.812402, 0.4974457, 1, 0, 0, 1, 1,
2.283871, 0.2133536, 1.024677, 0, 0, 0, 1, 1,
2.382664, -0.6172944, 0.810872, 0, 0, 0, 1, 1,
2.390985, -1.047862, 4.45025, 0, 0, 0, 1, 1,
2.448454, 0.5914956, 1.851195, 0, 0, 0, 1, 1,
2.448475, 0.1283808, 1.258529, 0, 0, 0, 1, 1,
2.52575, 0.5649014, 1.704605, 0, 0, 0, 1, 1,
2.539735, 1.958355, 0.9336247, 0, 0, 0, 1, 1,
2.562744, 0.02704309, 1.821116, 1, 1, 1, 1, 1,
2.563108, 0.4034612, 0.9536822, 1, 1, 1, 1, 1,
2.717643, 1.398715, 2.598953, 1, 1, 1, 1, 1,
2.726088, 0.1109751, 1.381319, 1, 1, 1, 1, 1,
3.067722, -1.047343, 1.944792, 1, 1, 1, 1, 1,
3.631122, -0.1275626, 1.57297, 1, 1, 1, 1, 1,
3.94628, -2.142373, 2.806182, 1, 1, 1, 1, 1
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
var radius = 9.942423;
var distance = 34.92234;
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
mvMatrix.translate( -0.4354839, 0.2173846, 0.1631167 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.92234);
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
