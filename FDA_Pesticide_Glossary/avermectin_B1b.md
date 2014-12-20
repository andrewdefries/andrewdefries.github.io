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
-2.965845, 2.180678, -1.999291, 1, 0, 0, 1,
-2.710989, -0.09137761, -1.401849, 1, 0.007843138, 0, 1,
-2.6573, 1.298548, -0.9562762, 1, 0.01176471, 0, 1,
-2.652657, -1.459984, -2.70101, 1, 0.01960784, 0, 1,
-2.479807, 0.1375354, 0.3621518, 1, 0.02352941, 0, 1,
-2.277118, 0.2031861, -1.440582, 1, 0.03137255, 0, 1,
-2.260191, 1.192167, -0.4459456, 1, 0.03529412, 0, 1,
-2.200185, 0.5513812, -3.383476, 1, 0.04313726, 0, 1,
-2.134469, 0.4447745, -1.820844, 1, 0.04705882, 0, 1,
-2.110179, -1.030479, -1.69835, 1, 0.05490196, 0, 1,
-2.107871, -1.168143, -3.321439, 1, 0.05882353, 0, 1,
-2.084072, -0.007843601, -4.576673, 1, 0.06666667, 0, 1,
-2.080207, 0.4079217, -0.7243844, 1, 0.07058824, 0, 1,
-2.066726, -0.4796371, -3.982524, 1, 0.07843138, 0, 1,
-2.013074, -0.9127091, -0.8330314, 1, 0.08235294, 0, 1,
-2.007297, 0.1711188, -1.492419, 1, 0.09019608, 0, 1,
-1.979512, -1.071471, -0.6250279, 1, 0.09411765, 0, 1,
-1.974334, 1.805808, -0.1659601, 1, 0.1019608, 0, 1,
-1.958558, 0.6990266, 0.2381782, 1, 0.1098039, 0, 1,
-1.940349, 0.2958711, -1.021448, 1, 0.1137255, 0, 1,
-1.934706, 1.202616, -0.6180541, 1, 0.1215686, 0, 1,
-1.930233, -1.109173, -1.908212, 1, 0.1254902, 0, 1,
-1.917341, -0.4253238, -1.646045, 1, 0.1333333, 0, 1,
-1.914961, 1.640411, -1.137461, 1, 0.1372549, 0, 1,
-1.88903, -0.5641438, -1.90644, 1, 0.145098, 0, 1,
-1.885811, 0.5047778, -1.956185, 1, 0.1490196, 0, 1,
-1.86821, 0.07182146, -2.768391, 1, 0.1568628, 0, 1,
-1.829938, 0.0653111, -2.730436, 1, 0.1607843, 0, 1,
-1.826337, -0.05137423, -1.538491, 1, 0.1686275, 0, 1,
-1.821549, 1.205737, -0.2435414, 1, 0.172549, 0, 1,
-1.817377, -0.1038545, -2.206035, 1, 0.1803922, 0, 1,
-1.808195, -0.9987754, -2.054493, 1, 0.1843137, 0, 1,
-1.807519, -1.594752, -2.084882, 1, 0.1921569, 0, 1,
-1.803849, 1.152377, -1.029805, 1, 0.1960784, 0, 1,
-1.777901, 1.085253, -0.1429632, 1, 0.2039216, 0, 1,
-1.772504, 0.6288867, -1.271138, 1, 0.2117647, 0, 1,
-1.771815, 0.4132484, 1.087584, 1, 0.2156863, 0, 1,
-1.761274, -3.517973, -1.657557, 1, 0.2235294, 0, 1,
-1.755484, 0.8895688, -0.5991191, 1, 0.227451, 0, 1,
-1.749205, 0.3528693, -1.841057, 1, 0.2352941, 0, 1,
-1.739052, -1.372263, -0.7256687, 1, 0.2392157, 0, 1,
-1.731326, 1.900076, -1.096996, 1, 0.2470588, 0, 1,
-1.72957, -2.210857, -3.037338, 1, 0.2509804, 0, 1,
-1.724957, 1.494092, -0.3110279, 1, 0.2588235, 0, 1,
-1.721074, -0.147913, 1.075003, 1, 0.2627451, 0, 1,
-1.704327, -0.7853324, -2.079058, 1, 0.2705882, 0, 1,
-1.700873, 1.523045, 0.3427956, 1, 0.2745098, 0, 1,
-1.686114, 0.2693706, -1.246659, 1, 0.282353, 0, 1,
-1.66518, 0.007343018, -2.300218, 1, 0.2862745, 0, 1,
-1.657323, -0.5858328, -1.088272, 1, 0.2941177, 0, 1,
-1.649255, -0.1635174, 0.2067404, 1, 0.3019608, 0, 1,
-1.642907, -1.005554, -1.242021, 1, 0.3058824, 0, 1,
-1.635827, -0.4216896, -1.105647, 1, 0.3137255, 0, 1,
-1.630977, -1.321485, -3.471905, 1, 0.3176471, 0, 1,
-1.614731, 0.1519089, -2.748835, 1, 0.3254902, 0, 1,
-1.611658, -1.493671, -2.609792, 1, 0.3294118, 0, 1,
-1.605023, -0.3054233, -1.477621, 1, 0.3372549, 0, 1,
-1.592629, 0.2578476, -1.787888, 1, 0.3411765, 0, 1,
-1.589667, 0.4628621, -0.7084156, 1, 0.3490196, 0, 1,
-1.56488, -1.227975, -3.211661, 1, 0.3529412, 0, 1,
-1.552829, 0.9664065, -1.550466, 1, 0.3607843, 0, 1,
-1.534074, -1.479343, -2.427465, 1, 0.3647059, 0, 1,
-1.529662, 0.04458443, -1.055513, 1, 0.372549, 0, 1,
-1.527542, 0.2418611, 0.3036493, 1, 0.3764706, 0, 1,
-1.496061, -0.3695914, -0.1000578, 1, 0.3843137, 0, 1,
-1.481546, -0.7954353, -2.715938, 1, 0.3882353, 0, 1,
-1.480072, -0.6125938, -1.736099, 1, 0.3960784, 0, 1,
-1.454429, -0.3685378, -2.161332, 1, 0.4039216, 0, 1,
-1.450633, 1.693633, 0.3451195, 1, 0.4078431, 0, 1,
-1.443603, -1.247051, -2.960959, 1, 0.4156863, 0, 1,
-1.435392, 0.5574794, -1.200128, 1, 0.4196078, 0, 1,
-1.43067, 0.4327148, -1.612989, 1, 0.427451, 0, 1,
-1.420862, 0.1609243, -3.113433, 1, 0.4313726, 0, 1,
-1.416043, -1.147169, -2.17811, 1, 0.4392157, 0, 1,
-1.409222, -1.504513, -3.479947, 1, 0.4431373, 0, 1,
-1.406954, 0.5545176, -1.217382, 1, 0.4509804, 0, 1,
-1.398398, 1.012759, -1.433639, 1, 0.454902, 0, 1,
-1.396319, -0.7038027, -3.10727, 1, 0.4627451, 0, 1,
-1.385995, 0.2753731, -1.650122, 1, 0.4666667, 0, 1,
-1.381207, 0.8757733, -1.907722, 1, 0.4745098, 0, 1,
-1.369004, 1.570809, -1.04213, 1, 0.4784314, 0, 1,
-1.363937, 0.1452013, -0.9542883, 1, 0.4862745, 0, 1,
-1.351594, -0.5147911, -1.394964, 1, 0.4901961, 0, 1,
-1.348143, 0.05909044, -2.072862, 1, 0.4980392, 0, 1,
-1.33382, 2.118829, 0.6380709, 1, 0.5058824, 0, 1,
-1.333264, 0.577379, -1.118266, 1, 0.509804, 0, 1,
-1.331891, -0.4804627, -1.104339, 1, 0.5176471, 0, 1,
-1.327826, 1.194254, -0.1494949, 1, 0.5215687, 0, 1,
-1.32089, -0.9614806, -1.591156, 1, 0.5294118, 0, 1,
-1.313734, 0.1159079, -3.185353, 1, 0.5333334, 0, 1,
-1.310522, 0.2304305, -1.63068, 1, 0.5411765, 0, 1,
-1.309418, -2.236172, -2.645346, 1, 0.5450981, 0, 1,
-1.301438, -0.2460917, -1.530822, 1, 0.5529412, 0, 1,
-1.297219, 0.4603472, -1.850486, 1, 0.5568628, 0, 1,
-1.295576, -0.5668167, -1.915551, 1, 0.5647059, 0, 1,
-1.286004, 1.196011, -0.3099338, 1, 0.5686275, 0, 1,
-1.284892, -0.5758165, -0.2248571, 1, 0.5764706, 0, 1,
-1.258679, -1.893363, -2.681704, 1, 0.5803922, 0, 1,
-1.256095, -0.3589501, -4.517955, 1, 0.5882353, 0, 1,
-1.250304, -1.320203, -3.107381, 1, 0.5921569, 0, 1,
-1.249681, 1.369532, -1.406366, 1, 0.6, 0, 1,
-1.246293, 0.8106193, -0.2979181, 1, 0.6078432, 0, 1,
-1.246099, 1.220483, -1.167133, 1, 0.6117647, 0, 1,
-1.236842, 0.1284786, -0.1630252, 1, 0.6196079, 0, 1,
-1.233223, -1.928061, -1.532607, 1, 0.6235294, 0, 1,
-1.228777, -0.2152702, -1.017507, 1, 0.6313726, 0, 1,
-1.220731, -0.5702365, -2.320345, 1, 0.6352941, 0, 1,
-1.210238, 0.1579384, 0.09898072, 1, 0.6431373, 0, 1,
-1.202327, -0.6305866, -2.922943, 1, 0.6470588, 0, 1,
-1.196857, -1.230482, -0.02935742, 1, 0.654902, 0, 1,
-1.195537, 0.8542135, -0.3449325, 1, 0.6588235, 0, 1,
-1.189777, 0.9581869, -1.328885, 1, 0.6666667, 0, 1,
-1.184319, 1.439239, -0.1679256, 1, 0.6705883, 0, 1,
-1.183797, 0.1404139, -1.586778, 1, 0.6784314, 0, 1,
-1.178472, 0.2584321, -1.173805, 1, 0.682353, 0, 1,
-1.174139, -1.445169, -4.448802, 1, 0.6901961, 0, 1,
-1.17281, -0.08664256, -3.59979, 1, 0.6941177, 0, 1,
-1.156397, 0.9611297, -2.660687, 1, 0.7019608, 0, 1,
-1.142875, 1.049757, 0.05015815, 1, 0.7098039, 0, 1,
-1.141304, 0.8686705, -1.020224, 1, 0.7137255, 0, 1,
-1.136804, 0.680939, 0.5439588, 1, 0.7215686, 0, 1,
-1.134732, -0.1905705, 0.2379149, 1, 0.7254902, 0, 1,
-1.133768, 0.08198047, -1.417945, 1, 0.7333333, 0, 1,
-1.115941, -0.02684763, -3.364613, 1, 0.7372549, 0, 1,
-1.113166, 1.679748, -0.4289823, 1, 0.7450981, 0, 1,
-1.103375, -0.5438843, -1.420849, 1, 0.7490196, 0, 1,
-1.10022, 0.4338959, -2.744319, 1, 0.7568628, 0, 1,
-1.097532, 1.158452, -0.5899585, 1, 0.7607843, 0, 1,
-1.081741, -1.203408, -1.261445, 1, 0.7686275, 0, 1,
-1.077815, -1.718635, -4.164902, 1, 0.772549, 0, 1,
-1.077491, -0.8325951, -0.8697115, 1, 0.7803922, 0, 1,
-1.076652, 0.269728, -1.359743, 1, 0.7843137, 0, 1,
-1.070262, -0.9606102, -3.840081, 1, 0.7921569, 0, 1,
-1.053775, 0.05702665, -0.5203987, 1, 0.7960784, 0, 1,
-1.052069, -0.9296978, -2.189214, 1, 0.8039216, 0, 1,
-1.049328, -0.7590331, -2.828717, 1, 0.8117647, 0, 1,
-1.043488, -0.114062, -2.818688, 1, 0.8156863, 0, 1,
-1.04249, 2.135102, -0.5869833, 1, 0.8235294, 0, 1,
-1.042328, 0.4073226, -2.655475, 1, 0.827451, 0, 1,
-1.04033, -0.522913, -2.259092, 1, 0.8352941, 0, 1,
-1.032503, 0.06831037, -2.503443, 1, 0.8392157, 0, 1,
-1.029915, 0.4869607, -0.6272164, 1, 0.8470588, 0, 1,
-1.029633, -0.1371536, -2.249736, 1, 0.8509804, 0, 1,
-1.027199, -0.9429414, -2.799146, 1, 0.8588235, 0, 1,
-1.02037, -0.1019266, -2.412208, 1, 0.8627451, 0, 1,
-1.020284, -0.5041535, -3.864153, 1, 0.8705882, 0, 1,
-1.01302, -1.363079, -2.74304, 1, 0.8745098, 0, 1,
-1.008638, 2.699238, 2.07255, 1, 0.8823529, 0, 1,
-1.005809, 1.642264, -3.603175, 1, 0.8862745, 0, 1,
-1.004953, 0.4042527, -2.277742, 1, 0.8941177, 0, 1,
-0.999511, -0.1216352, -1.733373, 1, 0.8980392, 0, 1,
-0.9961761, -0.5331655, -3.94784, 1, 0.9058824, 0, 1,
-0.9909511, -1.84565, -2.015845, 1, 0.9137255, 0, 1,
-0.9844249, -0.9776286, -3.182574, 1, 0.9176471, 0, 1,
-0.9784731, 1.254678, 0.2503559, 1, 0.9254902, 0, 1,
-0.974057, 0.4765792, -1.807701, 1, 0.9294118, 0, 1,
-0.9731236, -1.538831, -3.968389, 1, 0.9372549, 0, 1,
-0.96341, -0.3172948, -3.52223, 1, 0.9411765, 0, 1,
-0.958392, -0.5886712, -2.206779, 1, 0.9490196, 0, 1,
-0.944326, -1.402046, -4.272914, 1, 0.9529412, 0, 1,
-0.9403985, 0.3548317, -2.381733, 1, 0.9607843, 0, 1,
-0.9346946, 0.4464755, -1.047264, 1, 0.9647059, 0, 1,
-0.9334767, -1.726498, -2.394801, 1, 0.972549, 0, 1,
-0.931655, -1.043442, -2.031087, 1, 0.9764706, 0, 1,
-0.9272484, -0.791334, -1.604139, 1, 0.9843137, 0, 1,
-0.9232048, 0.5218899, -0.363656, 1, 0.9882353, 0, 1,
-0.9186184, -1.140197, -4.232679, 1, 0.9960784, 0, 1,
-0.9183165, -1.264679, -2.60293, 0.9960784, 1, 0, 1,
-0.9173852, -0.1742406, -1.870045, 0.9921569, 1, 0, 1,
-0.9076324, -0.1573298, -1.447204, 0.9843137, 1, 0, 1,
-0.9072696, -0.2361189, -1.972366, 0.9803922, 1, 0, 1,
-0.9042823, 0.8566396, 0.1208979, 0.972549, 1, 0, 1,
-0.9038026, -0.06825407, -2.029147, 0.9686275, 1, 0, 1,
-0.9004557, -0.8552204, -2.235945, 0.9607843, 1, 0, 1,
-0.899284, 0.7026805, -1.633344, 0.9568627, 1, 0, 1,
-0.8983792, -0.7226672, -3.485602, 0.9490196, 1, 0, 1,
-0.8883315, -0.5615153, -1.163354, 0.945098, 1, 0, 1,
-0.8874658, -1.168612, -2.45741, 0.9372549, 1, 0, 1,
-0.8845159, 0.03130451, -4.291522, 0.9333333, 1, 0, 1,
-0.8823048, 0.1335571, -1.624089, 0.9254902, 1, 0, 1,
-0.8819912, 0.2224573, -1.914376, 0.9215686, 1, 0, 1,
-0.8813838, 1.329527, -1.218667, 0.9137255, 1, 0, 1,
-0.8755131, -1.42223, -4.599643, 0.9098039, 1, 0, 1,
-0.8754337, -0.2831709, -1.92989, 0.9019608, 1, 0, 1,
-0.8729035, -0.5226671, -1.513732, 0.8941177, 1, 0, 1,
-0.8631985, -0.206361, 0.2878379, 0.8901961, 1, 0, 1,
-0.8620185, -2.355842, -2.141541, 0.8823529, 1, 0, 1,
-0.8575285, 0.2175972, -3.431856, 0.8784314, 1, 0, 1,
-0.8563939, 0.8408903, 2.261466, 0.8705882, 1, 0, 1,
-0.8526772, 0.3102225, -2.19137, 0.8666667, 1, 0, 1,
-0.8524874, -0.3429534, -2.944103, 0.8588235, 1, 0, 1,
-0.8514061, -0.5559198, -2.799242, 0.854902, 1, 0, 1,
-0.8506642, -0.7086672, -3.422778, 0.8470588, 1, 0, 1,
-0.8494626, 1.430022, 0.1130591, 0.8431373, 1, 0, 1,
-0.8477286, -0.9195341, -1.955152, 0.8352941, 1, 0, 1,
-0.8437431, 0.3475716, -2.817554, 0.8313726, 1, 0, 1,
-0.8422093, -0.3411851, -1.245932, 0.8235294, 1, 0, 1,
-0.8386319, -1.286342, -2.015591, 0.8196079, 1, 0, 1,
-0.8381631, -0.5502732, -3.890313, 0.8117647, 1, 0, 1,
-0.8379772, 2.202072, -0.4028955, 0.8078431, 1, 0, 1,
-0.8305747, 1.647127, -1.322619, 0.8, 1, 0, 1,
-0.8278339, 0.6417562, 0.03678589, 0.7921569, 1, 0, 1,
-0.8230736, 1.394295, -0.2821515, 0.7882353, 1, 0, 1,
-0.8190829, 0.5323468, -1.906557, 0.7803922, 1, 0, 1,
-0.8148826, 0.03322347, -1.137232, 0.7764706, 1, 0, 1,
-0.8146413, -1.404811, -1.034434, 0.7686275, 1, 0, 1,
-0.8131893, -1.102802, -2.170055, 0.7647059, 1, 0, 1,
-0.8053486, -0.1789987, -1.773356, 0.7568628, 1, 0, 1,
-0.7938018, -0.3573768, -0.248266, 0.7529412, 1, 0, 1,
-0.7910598, -0.3734511, -1.395147, 0.7450981, 1, 0, 1,
-0.790692, 0.6891983, -1.204116, 0.7411765, 1, 0, 1,
-0.7786179, -2.715194, -0.6284539, 0.7333333, 1, 0, 1,
-0.7747686, -0.04331867, -2.251031, 0.7294118, 1, 0, 1,
-0.7739277, -0.1703853, -3.609735, 0.7215686, 1, 0, 1,
-0.7731387, -0.06961784, -2.953104, 0.7176471, 1, 0, 1,
-0.7696037, -0.3496242, -3.69625, 0.7098039, 1, 0, 1,
-0.7660432, -0.7941022, -2.775004, 0.7058824, 1, 0, 1,
-0.7658576, 0.9817457, -1.737998, 0.6980392, 1, 0, 1,
-0.7598734, 0.06855045, -2.07516, 0.6901961, 1, 0, 1,
-0.7576318, -0.7559251, -1.753232, 0.6862745, 1, 0, 1,
-0.7570579, -2.376915, -2.193861, 0.6784314, 1, 0, 1,
-0.7558997, -0.1440662, -3.005991, 0.6745098, 1, 0, 1,
-0.7495514, -0.7257599, -2.170972, 0.6666667, 1, 0, 1,
-0.7461638, -1.350296, -3.761271, 0.6627451, 1, 0, 1,
-0.7412298, 1.523446, 1.037716, 0.654902, 1, 0, 1,
-0.7379687, -1.447582, -2.455245, 0.6509804, 1, 0, 1,
-0.7307212, -0.850032, -2.27344, 0.6431373, 1, 0, 1,
-0.728166, -1.226427, -3.871071, 0.6392157, 1, 0, 1,
-0.7213711, -0.5818028, -3.606898, 0.6313726, 1, 0, 1,
-0.720906, -1.281189, -2.58846, 0.627451, 1, 0, 1,
-0.7197168, -1.028334, -3.378077, 0.6196079, 1, 0, 1,
-0.7176749, 1.219939, 0.1439729, 0.6156863, 1, 0, 1,
-0.7156209, 0.4602866, -1.324652, 0.6078432, 1, 0, 1,
-0.7093357, 1.079599, -1.732251, 0.6039216, 1, 0, 1,
-0.7064217, -0.1083121, -1.626438, 0.5960785, 1, 0, 1,
-0.6989065, -0.2519303, -2.779804, 0.5882353, 1, 0, 1,
-0.6965356, 0.8993784, -2.416537, 0.5843138, 1, 0, 1,
-0.6964895, 0.1796644, -1.868423, 0.5764706, 1, 0, 1,
-0.6926088, -0.2000397, -1.358294, 0.572549, 1, 0, 1,
-0.6882157, 0.3570574, -0.7427014, 0.5647059, 1, 0, 1,
-0.6848544, 2.350575, 0.2885517, 0.5607843, 1, 0, 1,
-0.6819795, 0.258734, -1.64719, 0.5529412, 1, 0, 1,
-0.6784396, -0.01808899, -2.393469, 0.5490196, 1, 0, 1,
-0.6774136, -0.3309418, -2.440322, 0.5411765, 1, 0, 1,
-0.6707178, -0.8056186, -1.80165, 0.5372549, 1, 0, 1,
-0.6645938, -0.7156261, -3.139926, 0.5294118, 1, 0, 1,
-0.6627848, 0.6670248, -2.69725, 0.5254902, 1, 0, 1,
-0.6620904, -1.43306, -4.69692, 0.5176471, 1, 0, 1,
-0.6616666, 1.099894, 0.5701382, 0.5137255, 1, 0, 1,
-0.6600502, 1.080665, -0.1302176, 0.5058824, 1, 0, 1,
-0.6545988, -0.5967962, -2.844804, 0.5019608, 1, 0, 1,
-0.6542453, 0.7072033, -2.109347, 0.4941176, 1, 0, 1,
-0.6499, 0.7074647, 0.4047621, 0.4862745, 1, 0, 1,
-0.6461085, 1.667176, 0.3761654, 0.4823529, 1, 0, 1,
-0.6446841, 0.9464051, -0.2309662, 0.4745098, 1, 0, 1,
-0.6429783, -0.6876693, -1.962009, 0.4705882, 1, 0, 1,
-0.6407421, 0.1747032, -1.97466, 0.4627451, 1, 0, 1,
-0.6379034, -1.274337, -3.300868, 0.4588235, 1, 0, 1,
-0.6334024, -0.3166226, -1.824099, 0.4509804, 1, 0, 1,
-0.6320067, 0.4297168, -0.8089601, 0.4470588, 1, 0, 1,
-0.6302965, 1.035952, -0.02549153, 0.4392157, 1, 0, 1,
-0.6256751, 0.9709602, -1.177989, 0.4352941, 1, 0, 1,
-0.618993, -0.8637589, -2.886051, 0.427451, 1, 0, 1,
-0.6169068, 0.7450171, -1.828732, 0.4235294, 1, 0, 1,
-0.6153303, 0.6179796, -1.157941, 0.4156863, 1, 0, 1,
-0.6141732, 1.13805, -0.1009717, 0.4117647, 1, 0, 1,
-0.6102758, 1.16076, -1.287484, 0.4039216, 1, 0, 1,
-0.6061648, 0.116953, -3.541187, 0.3960784, 1, 0, 1,
-0.6059076, -0.5008438, -1.537513, 0.3921569, 1, 0, 1,
-0.5956367, -1.112975, -3.105854, 0.3843137, 1, 0, 1,
-0.5952684, -0.1200835, -1.945284, 0.3803922, 1, 0, 1,
-0.5928545, 1.997034, -0.2125081, 0.372549, 1, 0, 1,
-0.5902082, 0.03467071, -1.273643, 0.3686275, 1, 0, 1,
-0.5850528, 0.4482971, -0.8163992, 0.3607843, 1, 0, 1,
-0.5847219, 2.007671, -1.346774, 0.3568628, 1, 0, 1,
-0.5847186, 1.130954, -2.001764, 0.3490196, 1, 0, 1,
-0.5838044, -1.543573, -2.880739, 0.345098, 1, 0, 1,
-0.5829692, -0.5032774, -3.025841, 0.3372549, 1, 0, 1,
-0.582167, -0.6396678, -2.540205, 0.3333333, 1, 0, 1,
-0.5787656, 0.8652284, -0.8105024, 0.3254902, 1, 0, 1,
-0.5724052, 0.5918771, -0.535932, 0.3215686, 1, 0, 1,
-0.5693666, -0.1545518, -0.955344, 0.3137255, 1, 0, 1,
-0.5648316, 0.05129745, -2.570972, 0.3098039, 1, 0, 1,
-0.5643926, -0.2507903, -1.97567, 0.3019608, 1, 0, 1,
-0.5623635, -0.733124, -2.583276, 0.2941177, 1, 0, 1,
-0.5622116, -1.279029, -1.700936, 0.2901961, 1, 0, 1,
-0.5577673, -0.3878794, -1.927905, 0.282353, 1, 0, 1,
-0.5562037, -0.3750962, -3.794331, 0.2784314, 1, 0, 1,
-0.5549558, -0.7077445, -2.491589, 0.2705882, 1, 0, 1,
-0.5546415, 0.1273529, -0.8863438, 0.2666667, 1, 0, 1,
-0.5542275, 0.4634109, -0.628395, 0.2588235, 1, 0, 1,
-0.5497683, 0.6546062, -0.04742834, 0.254902, 1, 0, 1,
-0.5469707, 0.9707927, 1.671106, 0.2470588, 1, 0, 1,
-0.5447081, -0.07800962, -1.199877, 0.2431373, 1, 0, 1,
-0.5435435, 0.6286907, -1.695292, 0.2352941, 1, 0, 1,
-0.5389434, 1.155306, 0.1285799, 0.2313726, 1, 0, 1,
-0.5387043, -0.2524058, -1.00333, 0.2235294, 1, 0, 1,
-0.5383264, -0.4433733, -2.265431, 0.2196078, 1, 0, 1,
-0.5372927, -0.8976575, -1.621192, 0.2117647, 1, 0, 1,
-0.535785, 0.3023838, 0.2901463, 0.2078431, 1, 0, 1,
-0.5353234, 0.3340207, -2.020322, 0.2, 1, 0, 1,
-0.5327111, -0.8519516, -1.091652, 0.1921569, 1, 0, 1,
-0.5315574, 1.254439, -1.095164, 0.1882353, 1, 0, 1,
-0.5264121, -0.06762878, -1.116501, 0.1803922, 1, 0, 1,
-0.5194007, -0.8650281, -2.019651, 0.1764706, 1, 0, 1,
-0.5184047, -1.745167, -4.882644, 0.1686275, 1, 0, 1,
-0.5167247, -1.529148, -3.95567, 0.1647059, 1, 0, 1,
-0.5160664, 0.7166709, -0.8111781, 0.1568628, 1, 0, 1,
-0.5157112, -0.02593618, -0.4723981, 0.1529412, 1, 0, 1,
-0.515388, -0.7878914, -2.60396, 0.145098, 1, 0, 1,
-0.5124372, 0.713295, -2.700135, 0.1411765, 1, 0, 1,
-0.5076821, 1.383737, -0.7583056, 0.1333333, 1, 0, 1,
-0.5039333, -0.6953267, -2.771957, 0.1294118, 1, 0, 1,
-0.4995569, -0.3670949, -2.611575, 0.1215686, 1, 0, 1,
-0.4985646, 1.391878, -0.9288013, 0.1176471, 1, 0, 1,
-0.4945261, 0.6057892, 0.2987069, 0.1098039, 1, 0, 1,
-0.4942875, -0.4025506, -2.477581, 0.1058824, 1, 0, 1,
-0.4916514, 0.1256266, -0.2276712, 0.09803922, 1, 0, 1,
-0.4883865, 1.224589, -1.294489, 0.09019608, 1, 0, 1,
-0.4883116, -0.6444541, -2.607349, 0.08627451, 1, 0, 1,
-0.4869545, 0.004438949, -0.07503534, 0.07843138, 1, 0, 1,
-0.4865772, -1.063005, -3.055479, 0.07450981, 1, 0, 1,
-0.4801473, -1.073937, -2.751019, 0.06666667, 1, 0, 1,
-0.4797603, 1.656713, -0.6760368, 0.0627451, 1, 0, 1,
-0.4731598, -0.5892843, -1.798678, 0.05490196, 1, 0, 1,
-0.472895, 1.692905, -0.6953903, 0.05098039, 1, 0, 1,
-0.4666437, -1.690553, -2.657259, 0.04313726, 1, 0, 1,
-0.465233, 1.425505, -1.621632, 0.03921569, 1, 0, 1,
-0.4518867, 0.1607755, -0.7414866, 0.03137255, 1, 0, 1,
-0.4508433, -1.140754, -2.052923, 0.02745098, 1, 0, 1,
-0.4424232, -0.1654166, -2.403124, 0.01960784, 1, 0, 1,
-0.4415942, -1.822693, -3.219143, 0.01568628, 1, 0, 1,
-0.4399884, -0.03178316, -3.250027, 0.007843138, 1, 0, 1,
-0.4398113, 0.5873619, 0.3826526, 0.003921569, 1, 0, 1,
-0.4397923, 1.181126, -0.7011097, 0, 1, 0.003921569, 1,
-0.4397809, 0.2673431, -0.6795206, 0, 1, 0.01176471, 1,
-0.4365839, 0.2127684, -1.171818, 0, 1, 0.01568628, 1,
-0.4359297, 1.314979, -0.8314525, 0, 1, 0.02352941, 1,
-0.4291315, 0.0749236, 0.04621198, 0, 1, 0.02745098, 1,
-0.4266007, -0.3884335, -2.166825, 0, 1, 0.03529412, 1,
-0.4245965, -1.444678, -3.385582, 0, 1, 0.03921569, 1,
-0.4242923, 0.501315, -0.7733523, 0, 1, 0.04705882, 1,
-0.4167985, 0.01991663, -1.558849, 0, 1, 0.05098039, 1,
-0.416709, -1.065708, -3.256711, 0, 1, 0.05882353, 1,
-0.4104126, 0.4689538, -1.191636, 0, 1, 0.0627451, 1,
-0.4067203, -0.4882101, -1.997521, 0, 1, 0.07058824, 1,
-0.4063366, -0.3225616, -2.863098, 0, 1, 0.07450981, 1,
-0.4056313, -1.117523, -2.314234, 0, 1, 0.08235294, 1,
-0.4025616, 0.4195723, -0.5470517, 0, 1, 0.08627451, 1,
-0.3976924, 0.7123034, -0.7683112, 0, 1, 0.09411765, 1,
-0.3862488, -0.2634309, -0.5073071, 0, 1, 0.1019608, 1,
-0.382333, -0.3257958, -2.111085, 0, 1, 0.1058824, 1,
-0.3675605, -0.01620348, -1.772362, 0, 1, 0.1137255, 1,
-0.3657076, 1.253988, -0.9768639, 0, 1, 0.1176471, 1,
-0.365495, -0.08230544, -1.496957, 0, 1, 0.1254902, 1,
-0.3617101, -0.01854131, -2.429313, 0, 1, 0.1294118, 1,
-0.3613231, 0.2714427, -2.612156, 0, 1, 0.1372549, 1,
-0.3577554, 0.05685707, -1.798401, 0, 1, 0.1411765, 1,
-0.3536358, 1.069591, 0.9221842, 0, 1, 0.1490196, 1,
-0.3518914, -0.4607361, -1.993185, 0, 1, 0.1529412, 1,
-0.3472925, 0.3677436, -1.433384, 0, 1, 0.1607843, 1,
-0.3456694, -0.2764362, -1.438876, 0, 1, 0.1647059, 1,
-0.3448611, 0.8178215, -0.04360796, 0, 1, 0.172549, 1,
-0.3415198, 0.1634077, -2.82167, 0, 1, 0.1764706, 1,
-0.3371556, -1.598561, -3.394253, 0, 1, 0.1843137, 1,
-0.3314125, -0.2321122, -2.459743, 0, 1, 0.1882353, 1,
-0.329592, -1.16702, -2.034918, 0, 1, 0.1960784, 1,
-0.3281355, -1.248363, -3.573442, 0, 1, 0.2039216, 1,
-0.321988, -1.788399, -1.626836, 0, 1, 0.2078431, 1,
-0.3178658, -0.2811659, -0.8103399, 0, 1, 0.2156863, 1,
-0.3156089, -0.6757037, -2.130409, 0, 1, 0.2196078, 1,
-0.3128372, 1.343134, 0.3507233, 0, 1, 0.227451, 1,
-0.3121555, -0.8641469, -3.268771, 0, 1, 0.2313726, 1,
-0.3093516, 0.4529053, -1.031252, 0, 1, 0.2392157, 1,
-0.3079221, 0.1383869, -0.9918517, 0, 1, 0.2431373, 1,
-0.3051202, -1.321663, -3.816202, 0, 1, 0.2509804, 1,
-0.2975143, 2.643284, 1.352196, 0, 1, 0.254902, 1,
-0.2974599, 0.3832492, 0.2762005, 0, 1, 0.2627451, 1,
-0.2948121, -0.2028694, -2.333927, 0, 1, 0.2666667, 1,
-0.2902833, 0.2177633, -0.155972, 0, 1, 0.2745098, 1,
-0.2897479, 0.5170512, -0.6084039, 0, 1, 0.2784314, 1,
-0.2832604, -0.1986515, -2.013234, 0, 1, 0.2862745, 1,
-0.2776035, -3.293358, -3.4912, 0, 1, 0.2901961, 1,
-0.2762082, -0.3097782, -4.859868, 0, 1, 0.2980392, 1,
-0.2762063, -0.5135023, -2.299727, 0, 1, 0.3058824, 1,
-0.274571, 0.1662671, -0.1894053, 0, 1, 0.3098039, 1,
-0.2731986, 0.591845, -0.5521047, 0, 1, 0.3176471, 1,
-0.2698888, -0.3836489, -3.442776, 0, 1, 0.3215686, 1,
-0.2671797, 0.9434782, -1.081833, 0, 1, 0.3294118, 1,
-0.2634872, -0.4420669, -3.05455, 0, 1, 0.3333333, 1,
-0.2622171, -0.1016117, -1.973042, 0, 1, 0.3411765, 1,
-0.2592512, 0.2100348, -1.086189, 0, 1, 0.345098, 1,
-0.2584275, 0.2844158, -2.133666, 0, 1, 0.3529412, 1,
-0.2578436, 0.8020576, -0.9909145, 0, 1, 0.3568628, 1,
-0.2578249, -1.674054, -3.598685, 0, 1, 0.3647059, 1,
-0.2572843, -0.09466034, -0.6988824, 0, 1, 0.3686275, 1,
-0.2559046, -0.6563861, -4.689679, 0, 1, 0.3764706, 1,
-0.2532746, 0.2962019, -1.365732, 0, 1, 0.3803922, 1,
-0.250265, 0.8324431, -0.1814817, 0, 1, 0.3882353, 1,
-0.2463521, -1.898908, -2.081141, 0, 1, 0.3921569, 1,
-0.2408623, -0.3198049, -2.205842, 0, 1, 0.4, 1,
-0.2404153, 1.715535, 0.007932505, 0, 1, 0.4078431, 1,
-0.2355316, -0.978933, -0.990917, 0, 1, 0.4117647, 1,
-0.2304438, -1.137789, -3.621418, 0, 1, 0.4196078, 1,
-0.229854, -1.102913, -1.98778, 0, 1, 0.4235294, 1,
-0.2280676, 0.3635104, -0.8475856, 0, 1, 0.4313726, 1,
-0.2279945, -1.616294, -3.100487, 0, 1, 0.4352941, 1,
-0.2237849, -0.585822, -2.873386, 0, 1, 0.4431373, 1,
-0.222798, 0.3620588, -0.6362093, 0, 1, 0.4470588, 1,
-0.2204632, -1.317455, -2.26431, 0, 1, 0.454902, 1,
-0.2185905, 0.1602677, -2.514252, 0, 1, 0.4588235, 1,
-0.2121852, 0.5679056, -2.099002, 0, 1, 0.4666667, 1,
-0.2095654, 1.400296, -0.4974839, 0, 1, 0.4705882, 1,
-0.2092074, -0.8118238, -1.969998, 0, 1, 0.4784314, 1,
-0.2060082, -0.3544815, -3.239179, 0, 1, 0.4823529, 1,
-0.2042201, -1.0199, -3.18299, 0, 1, 0.4901961, 1,
-0.1988701, 2.059829, -0.5938995, 0, 1, 0.4941176, 1,
-0.1983381, 1.030087, 0.5096658, 0, 1, 0.5019608, 1,
-0.1973306, -0.3112855, -1.560704, 0, 1, 0.509804, 1,
-0.1901779, 0.1013688, -1.746002, 0, 1, 0.5137255, 1,
-0.1885764, -0.1282992, -1.876205, 0, 1, 0.5215687, 1,
-0.188107, 2.552902, 0.4491026, 0, 1, 0.5254902, 1,
-0.1855738, 0.3527658, 0.9999373, 0, 1, 0.5333334, 1,
-0.1850219, -0.2235197, -0.9412457, 0, 1, 0.5372549, 1,
-0.1752306, 0.58315, -1.080711, 0, 1, 0.5450981, 1,
-0.1751639, -0.2372539, -3.346961, 0, 1, 0.5490196, 1,
-0.1730974, 0.1290584, -1.569535, 0, 1, 0.5568628, 1,
-0.1717764, -1.377504, -3.985873, 0, 1, 0.5607843, 1,
-0.1715078, -1.03498, -2.717507, 0, 1, 0.5686275, 1,
-0.1686179, 0.3297057, 1.132688, 0, 1, 0.572549, 1,
-0.1667179, -0.1797312, -3.248184, 0, 1, 0.5803922, 1,
-0.1620039, 0.08768441, -1.094415, 0, 1, 0.5843138, 1,
-0.1614594, -0.1736784, -2.640112, 0, 1, 0.5921569, 1,
-0.1551927, -2.24529, -1.437342, 0, 1, 0.5960785, 1,
-0.1551696, 1.87136, -0.4351833, 0, 1, 0.6039216, 1,
-0.1535487, -0.3444724, -4.783574, 0, 1, 0.6117647, 1,
-0.1486249, -0.1871065, -3.267325, 0, 1, 0.6156863, 1,
-0.1470601, 0.9254672, 0.5598112, 0, 1, 0.6235294, 1,
-0.1447302, 1.425025, 1.854849, 0, 1, 0.627451, 1,
-0.1445155, -1.107484, -3.041785, 0, 1, 0.6352941, 1,
-0.1413371, 0.1487739, 0.8805996, 0, 1, 0.6392157, 1,
-0.1400997, -1.832295, -4.312251, 0, 1, 0.6470588, 1,
-0.1397613, 0.9454787, -1.206486, 0, 1, 0.6509804, 1,
-0.1393246, -0.3598489, -3.302481, 0, 1, 0.6588235, 1,
-0.1367159, -0.4832134, -3.758233, 0, 1, 0.6627451, 1,
-0.1364689, 0.3636075, -0.810355, 0, 1, 0.6705883, 1,
-0.1338675, -0.2783091, -2.126177, 0, 1, 0.6745098, 1,
-0.1307086, -1.387304, -2.51368, 0, 1, 0.682353, 1,
-0.1243905, 0.8883759, 0.3433153, 0, 1, 0.6862745, 1,
-0.1241331, -0.1728104, -4.128726, 0, 1, 0.6941177, 1,
-0.1222308, -0.4223901, -3.960932, 0, 1, 0.7019608, 1,
-0.1221806, 2.361907, -0.7079761, 0, 1, 0.7058824, 1,
-0.1138558, 0.3568233, -1.677245, 0, 1, 0.7137255, 1,
-0.1098455, -0.06031817, -0.3272823, 0, 1, 0.7176471, 1,
-0.1025785, 0.6638465, 0.1545088, 0, 1, 0.7254902, 1,
-0.08732301, 0.9696657, -1.430731, 0, 1, 0.7294118, 1,
-0.0872062, 0.9908331, -0.03667933, 0, 1, 0.7372549, 1,
-0.08178805, 0.1958005, 0.400647, 0, 1, 0.7411765, 1,
-0.0787666, 0.5291946, 0.08942941, 0, 1, 0.7490196, 1,
-0.07650122, 0.7256286, 1.60066, 0, 1, 0.7529412, 1,
-0.07577669, -0.2358712, -2.71358, 0, 1, 0.7607843, 1,
-0.07484999, 0.7251714, 0.2837219, 0, 1, 0.7647059, 1,
-0.07477403, -1.372164, -3.01643, 0, 1, 0.772549, 1,
-0.07333697, 0.0104426, -1.368141, 0, 1, 0.7764706, 1,
-0.0731537, 0.2622941, 0.7793605, 0, 1, 0.7843137, 1,
-0.06491198, -0.9678194, -4.608594, 0, 1, 0.7882353, 1,
-0.06285376, -1.795975, -2.538965, 0, 1, 0.7960784, 1,
-0.06160065, -0.3954484, -1.610105, 0, 1, 0.8039216, 1,
-0.06051483, -0.9376345, -2.056716, 0, 1, 0.8078431, 1,
-0.05793603, 0.6979454, 1.08601, 0, 1, 0.8156863, 1,
-0.05725664, -1.68103, -2.439135, 0, 1, 0.8196079, 1,
-0.05681536, -0.782961, -5.913476, 0, 1, 0.827451, 1,
-0.05384603, -0.198504, -3.650228, 0, 1, 0.8313726, 1,
-0.05169122, 0.28142, -1.864817, 0, 1, 0.8392157, 1,
-0.05032352, 0.1040074, 0.02108876, 0, 1, 0.8431373, 1,
-0.0484528, 0.7509559, 0.6973644, 0, 1, 0.8509804, 1,
-0.0462752, -1.67149, -3.03076, 0, 1, 0.854902, 1,
-0.04550368, 0.4815733, -0.3445425, 0, 1, 0.8627451, 1,
-0.04279239, -3.434809, -3.664191, 0, 1, 0.8666667, 1,
-0.03672913, 1.607798, 0.7482513, 0, 1, 0.8745098, 1,
-0.03651509, -0.6845548, -4.101938, 0, 1, 0.8784314, 1,
-0.0357997, -0.2019422, -1.876722, 0, 1, 0.8862745, 1,
-0.03411353, 0.2262151, -0.6534297, 0, 1, 0.8901961, 1,
-0.03183036, -0.2149267, -2.625755, 0, 1, 0.8980392, 1,
-0.02254444, 0.1399115, -1.149548, 0, 1, 0.9058824, 1,
-0.02154424, -0.5284162, -3.206095, 0, 1, 0.9098039, 1,
-0.01189753, -1.078514, -3.160162, 0, 1, 0.9176471, 1,
-0.01184831, 1.786582, 0.2193786, 0, 1, 0.9215686, 1,
-0.01121289, 1.417146, 2.202606, 0, 1, 0.9294118, 1,
-0.007257479, 1.848287, 0.3109511, 0, 1, 0.9333333, 1,
-0.006353215, -0.5045003, -3.292512, 0, 1, 0.9411765, 1,
-0.005721621, 1.552492, 2.001352, 0, 1, 0.945098, 1,
-0.005411914, -0.5088379, -1.538847, 0, 1, 0.9529412, 1,
-0.001387084, 0.1505648, 1.438806, 0, 1, 0.9568627, 1,
-0.0004300461, -0.3212266, -4.360112, 0, 1, 0.9647059, 1,
0.00244345, -1.336204, 1.632285, 0, 1, 0.9686275, 1,
0.002944863, 0.2305069, 0.6637846, 0, 1, 0.9764706, 1,
0.006103035, -0.4275513, 1.987263, 0, 1, 0.9803922, 1,
0.01121947, -0.1945242, 2.980111, 0, 1, 0.9882353, 1,
0.01467156, -0.7334262, 2.426829, 0, 1, 0.9921569, 1,
0.01611212, -0.4320631, 2.832677, 0, 1, 1, 1,
0.01756106, 0.4260276, -0.6836708, 0, 0.9921569, 1, 1,
0.01972369, -1.368496, 4.251684, 0, 0.9882353, 1, 1,
0.0266789, 0.1563938, 0.2329514, 0, 0.9803922, 1, 1,
0.02871771, -0.3139799, 2.449482, 0, 0.9764706, 1, 1,
0.03328869, -0.8412516, 3.230182, 0, 0.9686275, 1, 1,
0.03366612, 0.278427, 0.3712935, 0, 0.9647059, 1, 1,
0.03647795, -0.1565161, 2.493521, 0, 0.9568627, 1, 1,
0.03861292, -0.4947214, 3.6657, 0, 0.9529412, 1, 1,
0.05107931, -1.92619, 3.417568, 0, 0.945098, 1, 1,
0.05307122, -0.327653, 0.8607584, 0, 0.9411765, 1, 1,
0.0541124, -1.003878, 0.6605816, 0, 0.9333333, 1, 1,
0.05981972, 0.05044279, 0.1372095, 0, 0.9294118, 1, 1,
0.06840427, -0.5607961, 2.978011, 0, 0.9215686, 1, 1,
0.07150723, 1.003308, 0.204573, 0, 0.9176471, 1, 1,
0.0724766, 0.571362, 2.423871, 0, 0.9098039, 1, 1,
0.07339906, -0.5725886, 1.611705, 0, 0.9058824, 1, 1,
0.07354278, 0.7013739, -1.28291, 0, 0.8980392, 1, 1,
0.07357339, 0.1701187, 0.3718883, 0, 0.8901961, 1, 1,
0.07725854, -0.2643808, 4.126325, 0, 0.8862745, 1, 1,
0.08145957, -0.1887387, 1.45227, 0, 0.8784314, 1, 1,
0.08181924, 1.817284, -0.20501, 0, 0.8745098, 1, 1,
0.08322806, 1.526203, -1.483821, 0, 0.8666667, 1, 1,
0.08334056, 0.9563959, 0.09620823, 0, 0.8627451, 1, 1,
0.08354688, -1.55336, 4.025237, 0, 0.854902, 1, 1,
0.09035682, -0.1536417, 1.80136, 0, 0.8509804, 1, 1,
0.09237, 2.489702, -0.2231122, 0, 0.8431373, 1, 1,
0.09333436, -0.2895996, 1.859806, 0, 0.8392157, 1, 1,
0.09839649, -1.481972, 3.898978, 0, 0.8313726, 1, 1,
0.1005507, -1.29336, 3.822564, 0, 0.827451, 1, 1,
0.1026029, -1.034894, 2.983201, 0, 0.8196079, 1, 1,
0.1043834, 0.5966451, 0.8090384, 0, 0.8156863, 1, 1,
0.1050167, 1.138353, -0.01537329, 0, 0.8078431, 1, 1,
0.105487, 0.9059561, 0.9561298, 0, 0.8039216, 1, 1,
0.1101986, 0.6280122, -0.1006048, 0, 0.7960784, 1, 1,
0.1123448, -0.6784943, 2.739849, 0, 0.7882353, 1, 1,
0.1169878, 0.04000225, 1.914087, 0, 0.7843137, 1, 1,
0.1177829, -0.3359877, 5.037463, 0, 0.7764706, 1, 1,
0.1188268, -0.4710966, 2.509793, 0, 0.772549, 1, 1,
0.1255974, 0.9161375, 0.9859451, 0, 0.7647059, 1, 1,
0.1259423, -1.249797, 1.782243, 0, 0.7607843, 1, 1,
0.1261643, -0.9585091, 3.659948, 0, 0.7529412, 1, 1,
0.1312968, 1.174934, -2.270329, 0, 0.7490196, 1, 1,
0.1332671, 0.9363706, -0.7782296, 0, 0.7411765, 1, 1,
0.1385778, 0.3261812, 0.6121676, 0, 0.7372549, 1, 1,
0.1427724, 2.182856, -0.4569448, 0, 0.7294118, 1, 1,
0.1446369, -0.2651624, 3.164352, 0, 0.7254902, 1, 1,
0.1455187, -0.516353, 3.242714, 0, 0.7176471, 1, 1,
0.1497329, -1.423903, 3.665555, 0, 0.7137255, 1, 1,
0.1514472, -0.8384278, 3.968029, 0, 0.7058824, 1, 1,
0.1515178, -1.519977, 2.642308, 0, 0.6980392, 1, 1,
0.1532214, 1.251135, -0.4104324, 0, 0.6941177, 1, 1,
0.1567585, 0.6755536, 1.257542, 0, 0.6862745, 1, 1,
0.1619798, -0.5072336, 3.731076, 0, 0.682353, 1, 1,
0.1621251, -0.8096371, 1.708187, 0, 0.6745098, 1, 1,
0.1646964, 0.5866702, -0.6440222, 0, 0.6705883, 1, 1,
0.1652093, 0.431591, 0.3735977, 0, 0.6627451, 1, 1,
0.1675984, 0.805851, -0.7383541, 0, 0.6588235, 1, 1,
0.1717709, 1.368931, 0.1330632, 0, 0.6509804, 1, 1,
0.1742826, -0.1402735, 2.328282, 0, 0.6470588, 1, 1,
0.1754583, -0.4953012, 2.755882, 0, 0.6392157, 1, 1,
0.1769428, 0.1840311, -0.4629295, 0, 0.6352941, 1, 1,
0.1791262, -0.06511449, 1.349656, 0, 0.627451, 1, 1,
0.1811526, 0.2525619, 0.9182023, 0, 0.6235294, 1, 1,
0.1830346, 0.2348876, 0.6135109, 0, 0.6156863, 1, 1,
0.1871534, 0.5212479, 0.4271177, 0, 0.6117647, 1, 1,
0.188791, 0.1369747, 1.211531, 0, 0.6039216, 1, 1,
0.1926097, 0.541267, 0.3699493, 0, 0.5960785, 1, 1,
0.195331, -1.619117, 5.08582, 0, 0.5921569, 1, 1,
0.1954763, 0.2388152, 1.838191, 0, 0.5843138, 1, 1,
0.204185, 2.146571, 0.7427047, 0, 0.5803922, 1, 1,
0.2054319, 0.1470542, -0.7981869, 0, 0.572549, 1, 1,
0.2068531, 0.3491016, 0.3082734, 0, 0.5686275, 1, 1,
0.2068988, -1.178689, 2.644675, 0, 0.5607843, 1, 1,
0.214338, -0.09113974, 0.6042832, 0, 0.5568628, 1, 1,
0.2155344, 0.6631755, 2.16328, 0, 0.5490196, 1, 1,
0.2157131, 0.04074639, 0.1146877, 0, 0.5450981, 1, 1,
0.2158324, -1.076467, 4.228839, 0, 0.5372549, 1, 1,
0.2171271, 0.7606372, -0.8376566, 0, 0.5333334, 1, 1,
0.2173801, -1.855339, 3.061472, 0, 0.5254902, 1, 1,
0.2181594, 0.4229034, 2.388841, 0, 0.5215687, 1, 1,
0.2205533, -0.603174, 1.65044, 0, 0.5137255, 1, 1,
0.2218646, 1.38319, -0.5135214, 0, 0.509804, 1, 1,
0.2279017, 1.018067, -0.1658025, 0, 0.5019608, 1, 1,
0.2325027, -0.8820412, 3.451081, 0, 0.4941176, 1, 1,
0.2327912, 1.721649, -0.9393759, 0, 0.4901961, 1, 1,
0.2356197, -0.5115719, 3.3141, 0, 0.4823529, 1, 1,
0.2358328, 2.064422, 0.4540751, 0, 0.4784314, 1, 1,
0.2417272, -0.8346281, 3.758443, 0, 0.4705882, 1, 1,
0.2446553, -1.316578, 2.76665, 0, 0.4666667, 1, 1,
0.24588, -1.68266, 4.274013, 0, 0.4588235, 1, 1,
0.2481155, 1.165266, 0.9285732, 0, 0.454902, 1, 1,
0.2487523, -0.4798389, 2.530403, 0, 0.4470588, 1, 1,
0.2509093, -1.696489, 3.315621, 0, 0.4431373, 1, 1,
0.2573982, 0.742499, -0.6503857, 0, 0.4352941, 1, 1,
0.2586077, -1.513438, 2.996198, 0, 0.4313726, 1, 1,
0.2650406, 1.213631, 1.028749, 0, 0.4235294, 1, 1,
0.2660554, 1.304415, 1.791392, 0, 0.4196078, 1, 1,
0.2666101, -0.1659108, 2.018607, 0, 0.4117647, 1, 1,
0.2687985, -0.654402, 2.40003, 0, 0.4078431, 1, 1,
0.2701256, -0.6753742, 2.757118, 0, 0.4, 1, 1,
0.2703159, 0.8086987, 1.396712, 0, 0.3921569, 1, 1,
0.2765664, 0.2440263, 0.7091458, 0, 0.3882353, 1, 1,
0.2767546, 0.9098982, 1.176588, 0, 0.3803922, 1, 1,
0.2768611, -0.873157, 2.875648, 0, 0.3764706, 1, 1,
0.2802437, -0.7488064, 0.464315, 0, 0.3686275, 1, 1,
0.2803415, 0.9488269, -0.4850193, 0, 0.3647059, 1, 1,
0.2868868, 0.1093168, 1.212225, 0, 0.3568628, 1, 1,
0.2884498, 0.7931474, 1.81131, 0, 0.3529412, 1, 1,
0.2894247, -0.8032205, 2.115248, 0, 0.345098, 1, 1,
0.2958483, 0.2028038, 0.8727218, 0, 0.3411765, 1, 1,
0.299015, -0.1086512, 0.8104898, 0, 0.3333333, 1, 1,
0.3047244, 0.1371946, 0.8760459, 0, 0.3294118, 1, 1,
0.3108727, -1.257074, 3.203246, 0, 0.3215686, 1, 1,
0.3121699, -0.354557, 2.544563, 0, 0.3176471, 1, 1,
0.313664, 0.7683951, -0.7489497, 0, 0.3098039, 1, 1,
0.3164258, -0.1274675, 1.875526, 0, 0.3058824, 1, 1,
0.3167011, 0.5728846, 0.4466124, 0, 0.2980392, 1, 1,
0.3180953, -0.1033028, 1.372325, 0, 0.2901961, 1, 1,
0.3219992, -1.326692, 2.696326, 0, 0.2862745, 1, 1,
0.3309234, -0.1017682, 2.736192, 0, 0.2784314, 1, 1,
0.3360482, -0.3225918, 1.66363, 0, 0.2745098, 1, 1,
0.3371146, 0.3468178, 0.7885541, 0, 0.2666667, 1, 1,
0.3388788, 0.1651616, 1.707117, 0, 0.2627451, 1, 1,
0.3401745, 0.002061095, 0.4274495, 0, 0.254902, 1, 1,
0.3416875, -0.3931532, 2.231711, 0, 0.2509804, 1, 1,
0.3419719, -0.7899798, 2.675754, 0, 0.2431373, 1, 1,
0.3420494, -0.7771112, 3.398578, 0, 0.2392157, 1, 1,
0.3420524, -0.422515, 2.796961, 0, 0.2313726, 1, 1,
0.3429203, 0.2467393, 1.571399, 0, 0.227451, 1, 1,
0.3433368, 0.1426969, 0.6624511, 0, 0.2196078, 1, 1,
0.3472368, 1.130784, -0.1853622, 0, 0.2156863, 1, 1,
0.3496196, 0.646713, 1.795674, 0, 0.2078431, 1, 1,
0.3506259, 0.507248, 1.016052, 0, 0.2039216, 1, 1,
0.3575487, 0.5656551, 0.6153649, 0, 0.1960784, 1, 1,
0.3590295, 1.296883, -0.5158513, 0, 0.1882353, 1, 1,
0.3665011, -0.2678384, 2.819582, 0, 0.1843137, 1, 1,
0.3672336, 0.8305296, 0.8943145, 0, 0.1764706, 1, 1,
0.3673491, -0.9279922, 2.914926, 0, 0.172549, 1, 1,
0.3675644, -0.4647618, 2.249584, 0, 0.1647059, 1, 1,
0.3764763, 0.5339103, 0.5646722, 0, 0.1607843, 1, 1,
0.3773602, 1.091497, -1.398834, 0, 0.1529412, 1, 1,
0.3823579, 0.4883933, 0.2245483, 0, 0.1490196, 1, 1,
0.3828862, 0.6381673, 0.4820617, 0, 0.1411765, 1, 1,
0.3838865, 0.6801868, -0.2449422, 0, 0.1372549, 1, 1,
0.3873481, -0.2995245, 0.3926859, 0, 0.1294118, 1, 1,
0.3883375, -1.621536, 2.99616, 0, 0.1254902, 1, 1,
0.3891321, 1.008898, -0.02415242, 0, 0.1176471, 1, 1,
0.3895443, 0.09256072, 0.5334522, 0, 0.1137255, 1, 1,
0.3939711, -0.1028585, 1.450075, 0, 0.1058824, 1, 1,
0.3951497, -2.281554, 3.192711, 0, 0.09803922, 1, 1,
0.4064931, -1.767107, 2.34414, 0, 0.09411765, 1, 1,
0.4096473, 2.103192, -0.598186, 0, 0.08627451, 1, 1,
0.4130091, 0.8778504, 0.829227, 0, 0.08235294, 1, 1,
0.4203182, -1.582479, 4.008839, 0, 0.07450981, 1, 1,
0.4211275, -1.195911, 1.273559, 0, 0.07058824, 1, 1,
0.4295357, 0.3276878, 2.059179, 0, 0.0627451, 1, 1,
0.4337216, 0.06026828, 1.013352, 0, 0.05882353, 1, 1,
0.4337468, -0.319483, 0.9503371, 0, 0.05098039, 1, 1,
0.435043, 2.50061, 0.6667821, 0, 0.04705882, 1, 1,
0.4355335, -0.04194343, 0.1104129, 0, 0.03921569, 1, 1,
0.4356778, -0.8786065, 0.05231969, 0, 0.03529412, 1, 1,
0.4387914, -0.3773538, 1.015982, 0, 0.02745098, 1, 1,
0.4410888, -0.8448731, 2.5987, 0, 0.02352941, 1, 1,
0.4481225, 0.7362859, 1.823754, 0, 0.01568628, 1, 1,
0.4500025, 0.1807979, 0.1663198, 0, 0.01176471, 1, 1,
0.4506361, 0.8333045, 2.284652, 0, 0.003921569, 1, 1,
0.4513003, -2.115175, 2.500072, 0.003921569, 0, 1, 1,
0.4527122, 0.3008228, 2.678936, 0.007843138, 0, 1, 1,
0.4589482, 1.586034, -0.35974, 0.01568628, 0, 1, 1,
0.4606612, -2.636217, 2.300059, 0.01960784, 0, 1, 1,
0.4621928, 0.2941843, 1.410955, 0.02745098, 0, 1, 1,
0.4635384, -1.892316, 3.05583, 0.03137255, 0, 1, 1,
0.4641795, 0.3320069, -0.200528, 0.03921569, 0, 1, 1,
0.4691747, -0.7932801, 1.969758, 0.04313726, 0, 1, 1,
0.4700266, -1.12777, 2.462601, 0.05098039, 0, 1, 1,
0.4727884, -0.2286502, 2.538432, 0.05490196, 0, 1, 1,
0.4754971, 1.302153, -0.6582621, 0.0627451, 0, 1, 1,
0.4773294, -0.289475, 1.111547, 0.06666667, 0, 1, 1,
0.4835892, 0.8766472, 0.8322883, 0.07450981, 0, 1, 1,
0.4839313, -1.614391, 3.178262, 0.07843138, 0, 1, 1,
0.4871477, -0.5046645, 2.50804, 0.08627451, 0, 1, 1,
0.4882084, -0.2867166, 2.06657, 0.09019608, 0, 1, 1,
0.4885212, 0.967354, 2.523967, 0.09803922, 0, 1, 1,
0.4895757, 2.595491, 1.374839, 0.1058824, 0, 1, 1,
0.5084892, 0.03717668, 1.5423, 0.1098039, 0, 1, 1,
0.5091032, -0.4333019, 2.082401, 0.1176471, 0, 1, 1,
0.5091761, 0.2040588, -0.7737997, 0.1215686, 0, 1, 1,
0.5105865, -0.8105673, 2.767178, 0.1294118, 0, 1, 1,
0.511992, 0.7105411, 0.3079926, 0.1333333, 0, 1, 1,
0.5120084, 0.1740937, 1.806316, 0.1411765, 0, 1, 1,
0.5187483, 1.059033, -0.2554451, 0.145098, 0, 1, 1,
0.5310788, 0.3101317, -1.593863, 0.1529412, 0, 1, 1,
0.532105, 0.3880262, 1.301445, 0.1568628, 0, 1, 1,
0.5440816, -0.969013, 2.510775, 0.1647059, 0, 1, 1,
0.544158, -1.207598, 2.707762, 0.1686275, 0, 1, 1,
0.5483345, -2.451179, 2.228673, 0.1764706, 0, 1, 1,
0.5524039, -0.3001256, 2.493077, 0.1803922, 0, 1, 1,
0.552425, 0.5204903, 0.5378125, 0.1882353, 0, 1, 1,
0.5524927, -0.6853007, 2.85011, 0.1921569, 0, 1, 1,
0.552599, 0.7317134, -0.5191743, 0.2, 0, 1, 1,
0.5526975, 0.3892423, 0.03036205, 0.2078431, 0, 1, 1,
0.5556406, 1.576586, -0.7129603, 0.2117647, 0, 1, 1,
0.5579034, 1.191436, 1.65268, 0.2196078, 0, 1, 1,
0.5582845, 1.429897, -0.6198095, 0.2235294, 0, 1, 1,
0.5624893, -0.179154, -0.4620057, 0.2313726, 0, 1, 1,
0.5678638, -0.7615672, 3.011156, 0.2352941, 0, 1, 1,
0.5718538, -2.050355, 3.197024, 0.2431373, 0, 1, 1,
0.5792332, -0.5707248, 3.79909, 0.2470588, 0, 1, 1,
0.5805838, 0.2416795, 0.8461913, 0.254902, 0, 1, 1,
0.5837461, 0.8357471, 0.1683846, 0.2588235, 0, 1, 1,
0.5989532, -2.213183, 2.922714, 0.2666667, 0, 1, 1,
0.6012645, 0.2442358, 0.9752288, 0.2705882, 0, 1, 1,
0.6017841, -1.651363, 1.998451, 0.2784314, 0, 1, 1,
0.6039518, 0.5197254, -0.9109821, 0.282353, 0, 1, 1,
0.6054558, -0.3019952, 1.786896, 0.2901961, 0, 1, 1,
0.6139632, -1.353056, 1.470795, 0.2941177, 0, 1, 1,
0.6147708, 1.177776, -0.3965046, 0.3019608, 0, 1, 1,
0.6162046, 0.3867302, 2.35877, 0.3098039, 0, 1, 1,
0.6171368, -0.113753, 1.670237, 0.3137255, 0, 1, 1,
0.6215533, 0.2110024, 1.620279, 0.3215686, 0, 1, 1,
0.6361128, -0.468892, 1.918157, 0.3254902, 0, 1, 1,
0.6382459, -0.3152916, 2.128463, 0.3333333, 0, 1, 1,
0.6489643, 0.06738575, 1.49938, 0.3372549, 0, 1, 1,
0.6540592, 0.7672318, 1.352421, 0.345098, 0, 1, 1,
0.6584281, 0.07483058, 1.056091, 0.3490196, 0, 1, 1,
0.6587622, 1.496603, 1.919263, 0.3568628, 0, 1, 1,
0.6610718, -1.581571, 3.056769, 0.3607843, 0, 1, 1,
0.6643637, -2.213265, 3.748064, 0.3686275, 0, 1, 1,
0.6657805, 0.792517, 1.393028, 0.372549, 0, 1, 1,
0.6669837, -0.7101735, 2.032961, 0.3803922, 0, 1, 1,
0.6729214, -0.7968984, 2.838248, 0.3843137, 0, 1, 1,
0.6731707, -0.7969736, 0.9854693, 0.3921569, 0, 1, 1,
0.6793826, -1.37873, 4.079718, 0.3960784, 0, 1, 1,
0.6805751, 0.2917796, -0.5860523, 0.4039216, 0, 1, 1,
0.6814183, -1.894489, 1.980644, 0.4117647, 0, 1, 1,
0.6826195, -0.7045425, 1.820065, 0.4156863, 0, 1, 1,
0.6863074, 0.2120758, 1.028395, 0.4235294, 0, 1, 1,
0.6866142, -0.3336951, 3.294812, 0.427451, 0, 1, 1,
0.6898299, -1.446755, 1.882021, 0.4352941, 0, 1, 1,
0.6916003, -0.08683912, -0.2981184, 0.4392157, 0, 1, 1,
0.6933548, 0.09987944, -0.2596762, 0.4470588, 0, 1, 1,
0.6958022, 0.1142768, 1.826575, 0.4509804, 0, 1, 1,
0.6965031, 0.9806349, 1.562806, 0.4588235, 0, 1, 1,
0.6972749, 0.06070426, 2.108874, 0.4627451, 0, 1, 1,
0.6995735, 0.3774697, 1.465704, 0.4705882, 0, 1, 1,
0.7021416, 0.4303247, 2.7168, 0.4745098, 0, 1, 1,
0.7027754, -0.7727403, 4.415519, 0.4823529, 0, 1, 1,
0.7030323, -0.3308913, 1.975929, 0.4862745, 0, 1, 1,
0.7054138, -0.4659435, 2.289513, 0.4941176, 0, 1, 1,
0.7108731, -0.1737683, 2.105329, 0.5019608, 0, 1, 1,
0.7120155, 0.5327685, 1.214866, 0.5058824, 0, 1, 1,
0.7157268, -0.05083742, -0.9151588, 0.5137255, 0, 1, 1,
0.7158025, 0.2524678, 1.40799, 0.5176471, 0, 1, 1,
0.7197069, 1.364632, -0.03313669, 0.5254902, 0, 1, 1,
0.7234134, 0.9919142, 1.286598, 0.5294118, 0, 1, 1,
0.724593, -0.3026395, 0.2746887, 0.5372549, 0, 1, 1,
0.7256201, 0.2227486, -0.6116561, 0.5411765, 0, 1, 1,
0.7259881, 0.8599923, 1.131345, 0.5490196, 0, 1, 1,
0.726849, -0.5472866, 3.368133, 0.5529412, 0, 1, 1,
0.727667, 2.401797, 1.814406, 0.5607843, 0, 1, 1,
0.7297588, 1.517954, 0.2464489, 0.5647059, 0, 1, 1,
0.7302415, -0.6172895, 2.140365, 0.572549, 0, 1, 1,
0.7306038, -1.714808, 4.370639, 0.5764706, 0, 1, 1,
0.7409471, -1.727019, 0.8592305, 0.5843138, 0, 1, 1,
0.745496, -0.2460184, 2.034729, 0.5882353, 0, 1, 1,
0.7458671, -0.2187815, 0.07124747, 0.5960785, 0, 1, 1,
0.7460375, 0.5964085, 1.256937, 0.6039216, 0, 1, 1,
0.7471186, 0.4045721, 0.5820014, 0.6078432, 0, 1, 1,
0.7491507, 0.1872703, 1.148371, 0.6156863, 0, 1, 1,
0.7663783, 0.9827533, 1.054419, 0.6196079, 0, 1, 1,
0.7724335, 0.4946804, 1.867576, 0.627451, 0, 1, 1,
0.7735663, -0.7489453, 2.808366, 0.6313726, 0, 1, 1,
0.783596, -0.475935, 3.038788, 0.6392157, 0, 1, 1,
0.7848567, 1.208805, 1.572715, 0.6431373, 0, 1, 1,
0.784881, -2.138715, 2.267871, 0.6509804, 0, 1, 1,
0.7977509, -0.9719087, 2.738994, 0.654902, 0, 1, 1,
0.8003857, 0.6315864, 0.6801946, 0.6627451, 0, 1, 1,
0.8004437, 1.364323, 1.298723, 0.6666667, 0, 1, 1,
0.8027071, 0.02275741, 0.7733121, 0.6745098, 0, 1, 1,
0.8057522, -0.1758789, 2.337726, 0.6784314, 0, 1, 1,
0.80709, -0.3128762, 3.672126, 0.6862745, 0, 1, 1,
0.8155717, 1.421446, 0.2744542, 0.6901961, 0, 1, 1,
0.8230456, -0.3924375, 2.730494, 0.6980392, 0, 1, 1,
0.8293045, -1.636161, 3.640584, 0.7058824, 0, 1, 1,
0.8294408, 1.157495, 0.9237404, 0.7098039, 0, 1, 1,
0.830193, -1.284807, 2.059141, 0.7176471, 0, 1, 1,
0.8351137, -1.013463, 3.014696, 0.7215686, 0, 1, 1,
0.8351868, -0.4012806, 1.527564, 0.7294118, 0, 1, 1,
0.8371591, -0.4170295, 0.591257, 0.7333333, 0, 1, 1,
0.8401748, 0.2553788, 2.64114, 0.7411765, 0, 1, 1,
0.8408992, 0.4670545, -0.4118246, 0.7450981, 0, 1, 1,
0.8447354, 1.311497, 1.561141, 0.7529412, 0, 1, 1,
0.8457302, -0.009294193, -0.1275783, 0.7568628, 0, 1, 1,
0.8543612, -0.1790526, 1.954173, 0.7647059, 0, 1, 1,
0.8543755, 0.7208498, 0.8941519, 0.7686275, 0, 1, 1,
0.8544193, 0.3369074, 2.706381, 0.7764706, 0, 1, 1,
0.8551572, -1.183664, 0.822089, 0.7803922, 0, 1, 1,
0.8551994, -0.1240769, 1.201242, 0.7882353, 0, 1, 1,
0.8573306, -1.705427, 3.667261, 0.7921569, 0, 1, 1,
0.8581942, -0.8781459, 4.244576, 0.8, 0, 1, 1,
0.8586796, -0.2292074, 2.159435, 0.8078431, 0, 1, 1,
0.8672307, -0.5439467, 3.081479, 0.8117647, 0, 1, 1,
0.8687643, 0.04561557, 1.674533, 0.8196079, 0, 1, 1,
0.8722847, -0.0597855, 0.8379391, 0.8235294, 0, 1, 1,
0.8783683, 0.6212763, 0.3623961, 0.8313726, 0, 1, 1,
0.8802833, -1.246916, 1.97878, 0.8352941, 0, 1, 1,
0.8910136, 0.6282175, 1.054964, 0.8431373, 0, 1, 1,
0.8935322, 0.3436262, 1.427745, 0.8470588, 0, 1, 1,
0.8971214, 0.7302601, 2.283932, 0.854902, 0, 1, 1,
0.8974288, 0.2912495, 1.015626, 0.8588235, 0, 1, 1,
0.8990688, -0.4492385, 3.399195, 0.8666667, 0, 1, 1,
0.9008981, 1.044057, 1.149942, 0.8705882, 0, 1, 1,
0.9028906, 0.410006, 2.183103, 0.8784314, 0, 1, 1,
0.9060805, -0.1094445, 2.769474, 0.8823529, 0, 1, 1,
0.9074928, -0.7491106, 4.495525, 0.8901961, 0, 1, 1,
0.9086959, -1.312942, 2.947064, 0.8941177, 0, 1, 1,
0.9096926, 0.1116504, 0.9132349, 0.9019608, 0, 1, 1,
0.9154162, 0.3089518, 1.609681, 0.9098039, 0, 1, 1,
0.9255913, 0.5604424, 0.7620176, 0.9137255, 0, 1, 1,
0.9323612, 0.1635227, -0.1096015, 0.9215686, 0, 1, 1,
0.9336639, 0.7139063, 2.246719, 0.9254902, 0, 1, 1,
0.9408959, -0.8276962, 3.058415, 0.9333333, 0, 1, 1,
0.9411564, -1.121292, 3.908437, 0.9372549, 0, 1, 1,
0.9428197, 0.8090959, -0.3141314, 0.945098, 0, 1, 1,
0.9456599, -1.008205, 1.197993, 0.9490196, 0, 1, 1,
0.9486844, -0.1566299, 1.202402, 0.9568627, 0, 1, 1,
0.9604995, 1.044206, 0.8167691, 0.9607843, 0, 1, 1,
0.9650043, -1.102384, 0.845594, 0.9686275, 0, 1, 1,
0.9685221, 0.2825447, 0.1615525, 0.972549, 0, 1, 1,
0.9709517, 1.860925, 0.6834127, 0.9803922, 0, 1, 1,
0.9728609, -2.560156, 2.12858, 0.9843137, 0, 1, 1,
0.9744549, 0.4648493, 0.9932989, 0.9921569, 0, 1, 1,
0.9744903, 3.05665, -0.4624574, 0.9960784, 0, 1, 1,
0.9790539, 0.9889981, -0.1417302, 1, 0, 0.9960784, 1,
0.9795715, 0.8619508, 1.175701, 1, 0, 0.9882353, 1,
0.9845361, -1.142606, 3.435528, 1, 0, 0.9843137, 1,
0.9847707, -1.620028, 4.481086, 1, 0, 0.9764706, 1,
0.9849721, 0.2548323, 3.701246, 1, 0, 0.972549, 1,
0.9851993, 0.5611997, 1.087178, 1, 0, 0.9647059, 1,
0.9917766, 0.3549584, 2.727935, 1, 0, 0.9607843, 1,
0.9984623, -0.03531846, 0.4243866, 1, 0, 0.9529412, 1,
1.003818, 1.71119, 0.2050566, 1, 0, 0.9490196, 1,
1.005044, 0.5321525, -0.2068747, 1, 0, 0.9411765, 1,
1.008264, 0.5988612, 1.517082, 1, 0, 0.9372549, 1,
1.01133, -0.5621708, 1.700851, 1, 0, 0.9294118, 1,
1.013604, 0.6557826, 1.200668, 1, 0, 0.9254902, 1,
1.016076, 1.646883, 0.4558859, 1, 0, 0.9176471, 1,
1.01673, -0.6256738, 1.762751, 1, 0, 0.9137255, 1,
1.024815, -0.1200637, 0.6640182, 1, 0, 0.9058824, 1,
1.034837, 1.601739, 0.688296, 1, 0, 0.9019608, 1,
1.035371, -0.8154157, 1.093963, 1, 0, 0.8941177, 1,
1.050193, 0.5857729, 1.417868, 1, 0, 0.8862745, 1,
1.051672, -0.5013992, -0.17047, 1, 0, 0.8823529, 1,
1.052831, -1.729764, 3.376866, 1, 0, 0.8745098, 1,
1.053995, 0.8779982, 0.1809072, 1, 0, 0.8705882, 1,
1.056363, 2.583443, -0.5439113, 1, 0, 0.8627451, 1,
1.057348, -0.3798045, -0.4924319, 1, 0, 0.8588235, 1,
1.061962, -0.9460523, 2.055209, 1, 0, 0.8509804, 1,
1.075038, 1.150041, 0.8660818, 1, 0, 0.8470588, 1,
1.076595, 0.6946929, -0.6951545, 1, 0, 0.8392157, 1,
1.07988, 1.036351, 1.217536, 1, 0, 0.8352941, 1,
1.083871, -0.2643842, 1.312185, 1, 0, 0.827451, 1,
1.087368, -0.8579413, 1.420633, 1, 0, 0.8235294, 1,
1.098969, 0.9200073, 1.065581, 1, 0, 0.8156863, 1,
1.1041, -0.5516977, 4.20753, 1, 0, 0.8117647, 1,
1.105916, -1.228876, 1.446916, 1, 0, 0.8039216, 1,
1.107564, -0.9276873, 1.641922, 1, 0, 0.7960784, 1,
1.112146, 0.03589666, 1.288082, 1, 0, 0.7921569, 1,
1.11608, -2.584596, 2.818511, 1, 0, 0.7843137, 1,
1.117871, -0.2437127, 2.674381, 1, 0, 0.7803922, 1,
1.134221, -2.473421, 1.629774, 1, 0, 0.772549, 1,
1.13527, -0.5473437, 3.665061, 1, 0, 0.7686275, 1,
1.138379, -1.52233, 1.935447, 1, 0, 0.7607843, 1,
1.141915, -0.7025307, 3.314608, 1, 0, 0.7568628, 1,
1.147814, -0.4526908, 0.5190607, 1, 0, 0.7490196, 1,
1.150275, 1.554093, 1.438064, 1, 0, 0.7450981, 1,
1.151027, -2.744776, 3.429756, 1, 0, 0.7372549, 1,
1.158071, 1.845196, -0.8439968, 1, 0, 0.7333333, 1,
1.15883, -1.170388, 4.491403, 1, 0, 0.7254902, 1,
1.159465, -0.2801021, 2.482358, 1, 0, 0.7215686, 1,
1.177641, 0.108859, 1.592383, 1, 0, 0.7137255, 1,
1.183827, 1.62819, -0.007621615, 1, 0, 0.7098039, 1,
1.184181, 0.01894718, 2.092151, 1, 0, 0.7019608, 1,
1.191362, 1.092215, -0.2566034, 1, 0, 0.6941177, 1,
1.207357, 1.572687, 0.5972977, 1, 0, 0.6901961, 1,
1.243222, -1.835361, 2.107774, 1, 0, 0.682353, 1,
1.246171, -1.921623, 1.835581, 1, 0, 0.6784314, 1,
1.248054, 0.2377397, 1.880195, 1, 0, 0.6705883, 1,
1.254318, 0.4796388, 2.077075, 1, 0, 0.6666667, 1,
1.264544, -1.352032, 2.590496, 1, 0, 0.6588235, 1,
1.276291, -1.88363, 2.326943, 1, 0, 0.654902, 1,
1.279277, -0.363042, 2.784077, 1, 0, 0.6470588, 1,
1.286848, 0.8033761, 1.983294, 1, 0, 0.6431373, 1,
1.299173, 0.194064, -0.1712652, 1, 0, 0.6352941, 1,
1.29968, 0.6100355, 0.9926787, 1, 0, 0.6313726, 1,
1.299915, -0.5706148, 1.053002, 1, 0, 0.6235294, 1,
1.306913, 1.445067, 0.2363767, 1, 0, 0.6196079, 1,
1.317533, 0.4999993, 1.39153, 1, 0, 0.6117647, 1,
1.324158, 0.1182658, 1.809139, 1, 0, 0.6078432, 1,
1.327705, -0.4032461, 3.706757, 1, 0, 0.6, 1,
1.328613, 0.5025735, 0.4513079, 1, 0, 0.5921569, 1,
1.335697, 0.2562505, 1.271488, 1, 0, 0.5882353, 1,
1.337913, 0.5489205, 1.876409, 1, 0, 0.5803922, 1,
1.344586, 0.9451892, 3.394397, 1, 0, 0.5764706, 1,
1.345711, -0.1919837, 2.514675, 1, 0, 0.5686275, 1,
1.363638, -1.14087, 2.629138, 1, 0, 0.5647059, 1,
1.373885, 0.06308886, 0.3236435, 1, 0, 0.5568628, 1,
1.376396, -0.1575841, 1.04014, 1, 0, 0.5529412, 1,
1.379539, -0.3258477, 2.35114, 1, 0, 0.5450981, 1,
1.379733, 0.7275854, 1.567475, 1, 0, 0.5411765, 1,
1.399529, 1.121236, 1.605654, 1, 0, 0.5333334, 1,
1.401942, -0.4097433, 1.116673, 1, 0, 0.5294118, 1,
1.417195, 0.6999938, 0.5383635, 1, 0, 0.5215687, 1,
1.438228, -0.7119583, 2.149321, 1, 0, 0.5176471, 1,
1.438997, 0.9637612, -0.6360862, 1, 0, 0.509804, 1,
1.440492, -0.3780537, 1.358348, 1, 0, 0.5058824, 1,
1.440666, 3.499408, 0.1154905, 1, 0, 0.4980392, 1,
1.442842, 0.3303133, 2.890626, 1, 0, 0.4901961, 1,
1.45046, -1.368373, 2.174467, 1, 0, 0.4862745, 1,
1.452378, 1.004797, -0.9198653, 1, 0, 0.4784314, 1,
1.453008, -0.3871694, 1.880849, 1, 0, 0.4745098, 1,
1.458647, -1.252123, 1.171824, 1, 0, 0.4666667, 1,
1.459311, 1.103206, -0.9962498, 1, 0, 0.4627451, 1,
1.461222, -1.111994, 1.308578, 1, 0, 0.454902, 1,
1.464675, -0.04184129, -1.569584, 1, 0, 0.4509804, 1,
1.46773, -1.145938, 0.8349339, 1, 0, 0.4431373, 1,
1.468942, -1.074922, 2.431443, 1, 0, 0.4392157, 1,
1.482299, -1.381133, 4.951436, 1, 0, 0.4313726, 1,
1.485331, -0.1449237, 1.479344, 1, 0, 0.427451, 1,
1.489794, -1.583099, 3.584523, 1, 0, 0.4196078, 1,
1.501508, 1.489452, 1.16033, 1, 0, 0.4156863, 1,
1.50886, -0.5887824, 2.895683, 1, 0, 0.4078431, 1,
1.538491, -0.7386147, 1.73537, 1, 0, 0.4039216, 1,
1.543, 0.7972039, 2.300228, 1, 0, 0.3960784, 1,
1.556463, -0.5882592, 1.540179, 1, 0, 0.3882353, 1,
1.567481, -0.06748788, 0.5331414, 1, 0, 0.3843137, 1,
1.571945, 0.2246812, 1.456553, 1, 0, 0.3764706, 1,
1.572001, 1.441358, -0.062833, 1, 0, 0.372549, 1,
1.580012, -0.849481, 2.043405, 1, 0, 0.3647059, 1,
1.581852, 0.1474827, 3.285373, 1, 0, 0.3607843, 1,
1.585283, -0.07804047, 0.1793076, 1, 0, 0.3529412, 1,
1.589134, 1.485395, 2.89281, 1, 0, 0.3490196, 1,
1.589872, 0.5931827, 0.5521604, 1, 0, 0.3411765, 1,
1.599968, 1.537398, 1.003985, 1, 0, 0.3372549, 1,
1.606477, 0.1267996, 1.956858, 1, 0, 0.3294118, 1,
1.609196, -0.2985964, 1.871489, 1, 0, 0.3254902, 1,
1.628395, 0.4707235, 1.830492, 1, 0, 0.3176471, 1,
1.630149, 1.022791, 1.375836, 1, 0, 0.3137255, 1,
1.632692, -2.356252, 2.865986, 1, 0, 0.3058824, 1,
1.682291, 0.3729605, 1.200389, 1, 0, 0.2980392, 1,
1.691409, 0.3190834, 1.341899, 1, 0, 0.2941177, 1,
1.69363, 0.7318154, 3.080942, 1, 0, 0.2862745, 1,
1.703809, 0.7705145, 2.986341, 1, 0, 0.282353, 1,
1.716359, 0.145348, 1.67365, 1, 0, 0.2745098, 1,
1.720656, -0.5978654, 0.4441, 1, 0, 0.2705882, 1,
1.721434, 0.4426585, 2.867689, 1, 0, 0.2627451, 1,
1.730195, 0.2163304, 0.3569704, 1, 0, 0.2588235, 1,
1.731188, 0.9477525, 3.151866, 1, 0, 0.2509804, 1,
1.739215, -0.884162, 2.98933, 1, 0, 0.2470588, 1,
1.752387, -1.996685, 3.082443, 1, 0, 0.2392157, 1,
1.756651, -0.01797331, 1.698865, 1, 0, 0.2352941, 1,
1.770172, 0.4004956, 1.537293, 1, 0, 0.227451, 1,
1.779498, 1.17798, 2.500508, 1, 0, 0.2235294, 1,
1.783635, 1.161043, 1.98411, 1, 0, 0.2156863, 1,
1.785482, 0.2726374, 1.511064, 1, 0, 0.2117647, 1,
1.800329, -1.769768, 1.88916, 1, 0, 0.2039216, 1,
1.803492, 1.463342, 1.381008, 1, 0, 0.1960784, 1,
1.846142, 0.6595602, 1.849373, 1, 0, 0.1921569, 1,
1.859061, -0.4318733, 2.539195, 1, 0, 0.1843137, 1,
1.86349, 1.877352, -0.1666855, 1, 0, 0.1803922, 1,
1.864686, -0.6450633, 2.266008, 1, 0, 0.172549, 1,
1.873597, -0.9964572, 2.492083, 1, 0, 0.1686275, 1,
1.881341, 0.859912, 0.1058521, 1, 0, 0.1607843, 1,
1.881362, -0.3861355, 2.149326, 1, 0, 0.1568628, 1,
1.920373, -0.6788827, 2.274643, 1, 0, 0.1490196, 1,
1.957031, 0.7134784, 1.326784, 1, 0, 0.145098, 1,
2.00462, -1.0233, 4.860918, 1, 0, 0.1372549, 1,
2.030677, 0.2151391, 1.617729, 1, 0, 0.1333333, 1,
2.034167, 1.463179, 0.5045331, 1, 0, 0.1254902, 1,
2.040066, 0.5531766, 1.928427, 1, 0, 0.1215686, 1,
2.053052, -0.8202262, 2.738998, 1, 0, 0.1137255, 1,
2.06174, 0.7189248, -0.3844016, 1, 0, 0.1098039, 1,
2.068892, 0.9217772, -0.01231277, 1, 0, 0.1019608, 1,
2.092958, -0.6553735, 2.178929, 1, 0, 0.09411765, 1,
2.115544, -0.8419812, 2.11622, 1, 0, 0.09019608, 1,
2.194746, 1.749671, -0.190951, 1, 0, 0.08235294, 1,
2.229883, -0.673687, 1.469895, 1, 0, 0.07843138, 1,
2.245653, -1.860586, 3.37273, 1, 0, 0.07058824, 1,
2.25446, 1.767385, -0.04549947, 1, 0, 0.06666667, 1,
2.412693, -0.6027241, 1.522644, 1, 0, 0.05882353, 1,
2.420905, 1.221454, 0.9625512, 1, 0, 0.05490196, 1,
2.497998, -0.7321286, 1.97327, 1, 0, 0.04705882, 1,
2.524136, 1.151584, 1.372477, 1, 0, 0.04313726, 1,
2.580391, -1.675644, 2.812327, 1, 0, 0.03529412, 1,
2.749274, -0.362345, 2.604921, 1, 0, 0.03137255, 1,
2.802646, 1.271657, 2.650234, 1, 0, 0.02352941, 1,
2.836591, 0.1575397, 1.464578, 1, 0, 0.01960784, 1,
2.88822, -1.212571, 1.698748, 1, 0, 0.01176471, 1,
3.318685, -0.09347422, 3.843228, 1, 0, 0.007843138, 1
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
0.1764199, -4.707419, -7.777857, 0, -0.5, 0.5, 0.5,
0.1764199, -4.707419, -7.777857, 1, -0.5, 0.5, 0.5,
0.1764199, -4.707419, -7.777857, 1, 1.5, 0.5, 0.5,
0.1764199, -4.707419, -7.777857, 0, 1.5, 0.5, 0.5
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
-4.031073, -0.009282589, -7.777857, 0, -0.5, 0.5, 0.5,
-4.031073, -0.009282589, -7.777857, 1, -0.5, 0.5, 0.5,
-4.031073, -0.009282589, -7.777857, 1, 1.5, 0.5, 0.5,
-4.031073, -0.009282589, -7.777857, 0, 1.5, 0.5, 0.5
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
-4.031073, -4.707419, -0.4138281, 0, -0.5, 0.5, 0.5,
-4.031073, -4.707419, -0.4138281, 1, -0.5, 0.5, 0.5,
-4.031073, -4.707419, -0.4138281, 1, 1.5, 0.5, 0.5,
-4.031073, -4.707419, -0.4138281, 0, 1.5, 0.5, 0.5
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
-2, -3.623234, -6.078465,
3, -3.623234, -6.078465,
-2, -3.623234, -6.078465,
-2, -3.803932, -6.361697,
-1, -3.623234, -6.078465,
-1, -3.803932, -6.361697,
0, -3.623234, -6.078465,
0, -3.803932, -6.361697,
1, -3.623234, -6.078465,
1, -3.803932, -6.361697,
2, -3.623234, -6.078465,
2, -3.803932, -6.361697,
3, -3.623234, -6.078465,
3, -3.803932, -6.361697
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
-2, -4.165327, -6.928161, 0, -0.5, 0.5, 0.5,
-2, -4.165327, -6.928161, 1, -0.5, 0.5, 0.5,
-2, -4.165327, -6.928161, 1, 1.5, 0.5, 0.5,
-2, -4.165327, -6.928161, 0, 1.5, 0.5, 0.5,
-1, -4.165327, -6.928161, 0, -0.5, 0.5, 0.5,
-1, -4.165327, -6.928161, 1, -0.5, 0.5, 0.5,
-1, -4.165327, -6.928161, 1, 1.5, 0.5, 0.5,
-1, -4.165327, -6.928161, 0, 1.5, 0.5, 0.5,
0, -4.165327, -6.928161, 0, -0.5, 0.5, 0.5,
0, -4.165327, -6.928161, 1, -0.5, 0.5, 0.5,
0, -4.165327, -6.928161, 1, 1.5, 0.5, 0.5,
0, -4.165327, -6.928161, 0, 1.5, 0.5, 0.5,
1, -4.165327, -6.928161, 0, -0.5, 0.5, 0.5,
1, -4.165327, -6.928161, 1, -0.5, 0.5, 0.5,
1, -4.165327, -6.928161, 1, 1.5, 0.5, 0.5,
1, -4.165327, -6.928161, 0, 1.5, 0.5, 0.5,
2, -4.165327, -6.928161, 0, -0.5, 0.5, 0.5,
2, -4.165327, -6.928161, 1, -0.5, 0.5, 0.5,
2, -4.165327, -6.928161, 1, 1.5, 0.5, 0.5,
2, -4.165327, -6.928161, 0, 1.5, 0.5, 0.5,
3, -4.165327, -6.928161, 0, -0.5, 0.5, 0.5,
3, -4.165327, -6.928161, 1, -0.5, 0.5, 0.5,
3, -4.165327, -6.928161, 1, 1.5, 0.5, 0.5,
3, -4.165327, -6.928161, 0, 1.5, 0.5, 0.5
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
-3.060113, -2, -6.078465,
-3.060113, 2, -6.078465,
-3.060113, -2, -6.078465,
-3.22194, -2, -6.361697,
-3.060113, 0, -6.078465,
-3.22194, 0, -6.361697,
-3.060113, 2, -6.078465,
-3.22194, 2, -6.361697
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
-3.545593, -2, -6.928161, 0, -0.5, 0.5, 0.5,
-3.545593, -2, -6.928161, 1, -0.5, 0.5, 0.5,
-3.545593, -2, -6.928161, 1, 1.5, 0.5, 0.5,
-3.545593, -2, -6.928161, 0, 1.5, 0.5, 0.5,
-3.545593, 0, -6.928161, 0, -0.5, 0.5, 0.5,
-3.545593, 0, -6.928161, 1, -0.5, 0.5, 0.5,
-3.545593, 0, -6.928161, 1, 1.5, 0.5, 0.5,
-3.545593, 0, -6.928161, 0, 1.5, 0.5, 0.5,
-3.545593, 2, -6.928161, 0, -0.5, 0.5, 0.5,
-3.545593, 2, -6.928161, 1, -0.5, 0.5, 0.5,
-3.545593, 2, -6.928161, 1, 1.5, 0.5, 0.5,
-3.545593, 2, -6.928161, 0, 1.5, 0.5, 0.5
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
-3.060113, -3.623234, -4,
-3.060113, -3.623234, 4,
-3.060113, -3.623234, -4,
-3.22194, -3.803932, -4,
-3.060113, -3.623234, -2,
-3.22194, -3.803932, -2,
-3.060113, -3.623234, 0,
-3.22194, -3.803932, 0,
-3.060113, -3.623234, 2,
-3.22194, -3.803932, 2,
-3.060113, -3.623234, 4,
-3.22194, -3.803932, 4
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
-3.545593, -4.165327, -4, 0, -0.5, 0.5, 0.5,
-3.545593, -4.165327, -4, 1, -0.5, 0.5, 0.5,
-3.545593, -4.165327, -4, 1, 1.5, 0.5, 0.5,
-3.545593, -4.165327, -4, 0, 1.5, 0.5, 0.5,
-3.545593, -4.165327, -2, 0, -0.5, 0.5, 0.5,
-3.545593, -4.165327, -2, 1, -0.5, 0.5, 0.5,
-3.545593, -4.165327, -2, 1, 1.5, 0.5, 0.5,
-3.545593, -4.165327, -2, 0, 1.5, 0.5, 0.5,
-3.545593, -4.165327, 0, 0, -0.5, 0.5, 0.5,
-3.545593, -4.165327, 0, 1, -0.5, 0.5, 0.5,
-3.545593, -4.165327, 0, 1, 1.5, 0.5, 0.5,
-3.545593, -4.165327, 0, 0, 1.5, 0.5, 0.5,
-3.545593, -4.165327, 2, 0, -0.5, 0.5, 0.5,
-3.545593, -4.165327, 2, 1, -0.5, 0.5, 0.5,
-3.545593, -4.165327, 2, 1, 1.5, 0.5, 0.5,
-3.545593, -4.165327, 2, 0, 1.5, 0.5, 0.5,
-3.545593, -4.165327, 4, 0, -0.5, 0.5, 0.5,
-3.545593, -4.165327, 4, 1, -0.5, 0.5, 0.5,
-3.545593, -4.165327, 4, 1, 1.5, 0.5, 0.5,
-3.545593, -4.165327, 4, 0, 1.5, 0.5, 0.5
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
-3.060113, -3.623234, -6.078465,
-3.060113, 3.604669, -6.078465,
-3.060113, -3.623234, 5.250809,
-3.060113, 3.604669, 5.250809,
-3.060113, -3.623234, -6.078465,
-3.060113, -3.623234, 5.250809,
-3.060113, 3.604669, -6.078465,
-3.060113, 3.604669, 5.250809,
-3.060113, -3.623234, -6.078465,
3.412953, -3.623234, -6.078465,
-3.060113, -3.623234, 5.250809,
3.412953, -3.623234, 5.250809,
-3.060113, 3.604669, -6.078465,
3.412953, 3.604669, -6.078465,
-3.060113, 3.604669, 5.250809,
3.412953, 3.604669, 5.250809,
3.412953, -3.623234, -6.078465,
3.412953, 3.604669, -6.078465,
3.412953, -3.623234, 5.250809,
3.412953, 3.604669, 5.250809,
3.412953, -3.623234, -6.078465,
3.412953, -3.623234, 5.250809,
3.412953, 3.604669, -6.078465,
3.412953, 3.604669, 5.250809
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
var radius = 7.965008;
var distance = 35.43722;
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
mvMatrix.translate( -0.1764199, 0.009282589, 0.4138281 );
mvMatrix.scale( 1.330424, 1.191483, 0.7601478 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.43722);
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
avermectin_B1b<-read.table("avermectin_B1b.xyz")
```

```
## Error in read.table("avermectin_B1b.xyz"): no lines available in input
```

```r
x<-avermectin_B1b$V2
```

```
## Error in eval(expr, envir, enclos): object 'avermectin_B1b' not found
```

```r
y<-avermectin_B1b$V3
```

```
## Error in eval(expr, envir, enclos): object 'avermectin_B1b' not found
```

```r
z<-avermectin_B1b$V4
```

```
## Error in eval(expr, envir, enclos): object 'avermectin_B1b' not found
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
-2.965845, 2.180678, -1.999291, 0, 0, 1, 1, 1,
-2.710989, -0.09137761, -1.401849, 1, 0, 0, 1, 1,
-2.6573, 1.298548, -0.9562762, 1, 0, 0, 1, 1,
-2.652657, -1.459984, -2.70101, 1, 0, 0, 1, 1,
-2.479807, 0.1375354, 0.3621518, 1, 0, 0, 1, 1,
-2.277118, 0.2031861, -1.440582, 1, 0, 0, 1, 1,
-2.260191, 1.192167, -0.4459456, 0, 0, 0, 1, 1,
-2.200185, 0.5513812, -3.383476, 0, 0, 0, 1, 1,
-2.134469, 0.4447745, -1.820844, 0, 0, 0, 1, 1,
-2.110179, -1.030479, -1.69835, 0, 0, 0, 1, 1,
-2.107871, -1.168143, -3.321439, 0, 0, 0, 1, 1,
-2.084072, -0.007843601, -4.576673, 0, 0, 0, 1, 1,
-2.080207, 0.4079217, -0.7243844, 0, 0, 0, 1, 1,
-2.066726, -0.4796371, -3.982524, 1, 1, 1, 1, 1,
-2.013074, -0.9127091, -0.8330314, 1, 1, 1, 1, 1,
-2.007297, 0.1711188, -1.492419, 1, 1, 1, 1, 1,
-1.979512, -1.071471, -0.6250279, 1, 1, 1, 1, 1,
-1.974334, 1.805808, -0.1659601, 1, 1, 1, 1, 1,
-1.958558, 0.6990266, 0.2381782, 1, 1, 1, 1, 1,
-1.940349, 0.2958711, -1.021448, 1, 1, 1, 1, 1,
-1.934706, 1.202616, -0.6180541, 1, 1, 1, 1, 1,
-1.930233, -1.109173, -1.908212, 1, 1, 1, 1, 1,
-1.917341, -0.4253238, -1.646045, 1, 1, 1, 1, 1,
-1.914961, 1.640411, -1.137461, 1, 1, 1, 1, 1,
-1.88903, -0.5641438, -1.90644, 1, 1, 1, 1, 1,
-1.885811, 0.5047778, -1.956185, 1, 1, 1, 1, 1,
-1.86821, 0.07182146, -2.768391, 1, 1, 1, 1, 1,
-1.829938, 0.0653111, -2.730436, 1, 1, 1, 1, 1,
-1.826337, -0.05137423, -1.538491, 0, 0, 1, 1, 1,
-1.821549, 1.205737, -0.2435414, 1, 0, 0, 1, 1,
-1.817377, -0.1038545, -2.206035, 1, 0, 0, 1, 1,
-1.808195, -0.9987754, -2.054493, 1, 0, 0, 1, 1,
-1.807519, -1.594752, -2.084882, 1, 0, 0, 1, 1,
-1.803849, 1.152377, -1.029805, 1, 0, 0, 1, 1,
-1.777901, 1.085253, -0.1429632, 0, 0, 0, 1, 1,
-1.772504, 0.6288867, -1.271138, 0, 0, 0, 1, 1,
-1.771815, 0.4132484, 1.087584, 0, 0, 0, 1, 1,
-1.761274, -3.517973, -1.657557, 0, 0, 0, 1, 1,
-1.755484, 0.8895688, -0.5991191, 0, 0, 0, 1, 1,
-1.749205, 0.3528693, -1.841057, 0, 0, 0, 1, 1,
-1.739052, -1.372263, -0.7256687, 0, 0, 0, 1, 1,
-1.731326, 1.900076, -1.096996, 1, 1, 1, 1, 1,
-1.72957, -2.210857, -3.037338, 1, 1, 1, 1, 1,
-1.724957, 1.494092, -0.3110279, 1, 1, 1, 1, 1,
-1.721074, -0.147913, 1.075003, 1, 1, 1, 1, 1,
-1.704327, -0.7853324, -2.079058, 1, 1, 1, 1, 1,
-1.700873, 1.523045, 0.3427956, 1, 1, 1, 1, 1,
-1.686114, 0.2693706, -1.246659, 1, 1, 1, 1, 1,
-1.66518, 0.007343018, -2.300218, 1, 1, 1, 1, 1,
-1.657323, -0.5858328, -1.088272, 1, 1, 1, 1, 1,
-1.649255, -0.1635174, 0.2067404, 1, 1, 1, 1, 1,
-1.642907, -1.005554, -1.242021, 1, 1, 1, 1, 1,
-1.635827, -0.4216896, -1.105647, 1, 1, 1, 1, 1,
-1.630977, -1.321485, -3.471905, 1, 1, 1, 1, 1,
-1.614731, 0.1519089, -2.748835, 1, 1, 1, 1, 1,
-1.611658, -1.493671, -2.609792, 1, 1, 1, 1, 1,
-1.605023, -0.3054233, -1.477621, 0, 0, 1, 1, 1,
-1.592629, 0.2578476, -1.787888, 1, 0, 0, 1, 1,
-1.589667, 0.4628621, -0.7084156, 1, 0, 0, 1, 1,
-1.56488, -1.227975, -3.211661, 1, 0, 0, 1, 1,
-1.552829, 0.9664065, -1.550466, 1, 0, 0, 1, 1,
-1.534074, -1.479343, -2.427465, 1, 0, 0, 1, 1,
-1.529662, 0.04458443, -1.055513, 0, 0, 0, 1, 1,
-1.527542, 0.2418611, 0.3036493, 0, 0, 0, 1, 1,
-1.496061, -0.3695914, -0.1000578, 0, 0, 0, 1, 1,
-1.481546, -0.7954353, -2.715938, 0, 0, 0, 1, 1,
-1.480072, -0.6125938, -1.736099, 0, 0, 0, 1, 1,
-1.454429, -0.3685378, -2.161332, 0, 0, 0, 1, 1,
-1.450633, 1.693633, 0.3451195, 0, 0, 0, 1, 1,
-1.443603, -1.247051, -2.960959, 1, 1, 1, 1, 1,
-1.435392, 0.5574794, -1.200128, 1, 1, 1, 1, 1,
-1.43067, 0.4327148, -1.612989, 1, 1, 1, 1, 1,
-1.420862, 0.1609243, -3.113433, 1, 1, 1, 1, 1,
-1.416043, -1.147169, -2.17811, 1, 1, 1, 1, 1,
-1.409222, -1.504513, -3.479947, 1, 1, 1, 1, 1,
-1.406954, 0.5545176, -1.217382, 1, 1, 1, 1, 1,
-1.398398, 1.012759, -1.433639, 1, 1, 1, 1, 1,
-1.396319, -0.7038027, -3.10727, 1, 1, 1, 1, 1,
-1.385995, 0.2753731, -1.650122, 1, 1, 1, 1, 1,
-1.381207, 0.8757733, -1.907722, 1, 1, 1, 1, 1,
-1.369004, 1.570809, -1.04213, 1, 1, 1, 1, 1,
-1.363937, 0.1452013, -0.9542883, 1, 1, 1, 1, 1,
-1.351594, -0.5147911, -1.394964, 1, 1, 1, 1, 1,
-1.348143, 0.05909044, -2.072862, 1, 1, 1, 1, 1,
-1.33382, 2.118829, 0.6380709, 0, 0, 1, 1, 1,
-1.333264, 0.577379, -1.118266, 1, 0, 0, 1, 1,
-1.331891, -0.4804627, -1.104339, 1, 0, 0, 1, 1,
-1.327826, 1.194254, -0.1494949, 1, 0, 0, 1, 1,
-1.32089, -0.9614806, -1.591156, 1, 0, 0, 1, 1,
-1.313734, 0.1159079, -3.185353, 1, 0, 0, 1, 1,
-1.310522, 0.2304305, -1.63068, 0, 0, 0, 1, 1,
-1.309418, -2.236172, -2.645346, 0, 0, 0, 1, 1,
-1.301438, -0.2460917, -1.530822, 0, 0, 0, 1, 1,
-1.297219, 0.4603472, -1.850486, 0, 0, 0, 1, 1,
-1.295576, -0.5668167, -1.915551, 0, 0, 0, 1, 1,
-1.286004, 1.196011, -0.3099338, 0, 0, 0, 1, 1,
-1.284892, -0.5758165, -0.2248571, 0, 0, 0, 1, 1,
-1.258679, -1.893363, -2.681704, 1, 1, 1, 1, 1,
-1.256095, -0.3589501, -4.517955, 1, 1, 1, 1, 1,
-1.250304, -1.320203, -3.107381, 1, 1, 1, 1, 1,
-1.249681, 1.369532, -1.406366, 1, 1, 1, 1, 1,
-1.246293, 0.8106193, -0.2979181, 1, 1, 1, 1, 1,
-1.246099, 1.220483, -1.167133, 1, 1, 1, 1, 1,
-1.236842, 0.1284786, -0.1630252, 1, 1, 1, 1, 1,
-1.233223, -1.928061, -1.532607, 1, 1, 1, 1, 1,
-1.228777, -0.2152702, -1.017507, 1, 1, 1, 1, 1,
-1.220731, -0.5702365, -2.320345, 1, 1, 1, 1, 1,
-1.210238, 0.1579384, 0.09898072, 1, 1, 1, 1, 1,
-1.202327, -0.6305866, -2.922943, 1, 1, 1, 1, 1,
-1.196857, -1.230482, -0.02935742, 1, 1, 1, 1, 1,
-1.195537, 0.8542135, -0.3449325, 1, 1, 1, 1, 1,
-1.189777, 0.9581869, -1.328885, 1, 1, 1, 1, 1,
-1.184319, 1.439239, -0.1679256, 0, 0, 1, 1, 1,
-1.183797, 0.1404139, -1.586778, 1, 0, 0, 1, 1,
-1.178472, 0.2584321, -1.173805, 1, 0, 0, 1, 1,
-1.174139, -1.445169, -4.448802, 1, 0, 0, 1, 1,
-1.17281, -0.08664256, -3.59979, 1, 0, 0, 1, 1,
-1.156397, 0.9611297, -2.660687, 1, 0, 0, 1, 1,
-1.142875, 1.049757, 0.05015815, 0, 0, 0, 1, 1,
-1.141304, 0.8686705, -1.020224, 0, 0, 0, 1, 1,
-1.136804, 0.680939, 0.5439588, 0, 0, 0, 1, 1,
-1.134732, -0.1905705, 0.2379149, 0, 0, 0, 1, 1,
-1.133768, 0.08198047, -1.417945, 0, 0, 0, 1, 1,
-1.115941, -0.02684763, -3.364613, 0, 0, 0, 1, 1,
-1.113166, 1.679748, -0.4289823, 0, 0, 0, 1, 1,
-1.103375, -0.5438843, -1.420849, 1, 1, 1, 1, 1,
-1.10022, 0.4338959, -2.744319, 1, 1, 1, 1, 1,
-1.097532, 1.158452, -0.5899585, 1, 1, 1, 1, 1,
-1.081741, -1.203408, -1.261445, 1, 1, 1, 1, 1,
-1.077815, -1.718635, -4.164902, 1, 1, 1, 1, 1,
-1.077491, -0.8325951, -0.8697115, 1, 1, 1, 1, 1,
-1.076652, 0.269728, -1.359743, 1, 1, 1, 1, 1,
-1.070262, -0.9606102, -3.840081, 1, 1, 1, 1, 1,
-1.053775, 0.05702665, -0.5203987, 1, 1, 1, 1, 1,
-1.052069, -0.9296978, -2.189214, 1, 1, 1, 1, 1,
-1.049328, -0.7590331, -2.828717, 1, 1, 1, 1, 1,
-1.043488, -0.114062, -2.818688, 1, 1, 1, 1, 1,
-1.04249, 2.135102, -0.5869833, 1, 1, 1, 1, 1,
-1.042328, 0.4073226, -2.655475, 1, 1, 1, 1, 1,
-1.04033, -0.522913, -2.259092, 1, 1, 1, 1, 1,
-1.032503, 0.06831037, -2.503443, 0, 0, 1, 1, 1,
-1.029915, 0.4869607, -0.6272164, 1, 0, 0, 1, 1,
-1.029633, -0.1371536, -2.249736, 1, 0, 0, 1, 1,
-1.027199, -0.9429414, -2.799146, 1, 0, 0, 1, 1,
-1.02037, -0.1019266, -2.412208, 1, 0, 0, 1, 1,
-1.020284, -0.5041535, -3.864153, 1, 0, 0, 1, 1,
-1.01302, -1.363079, -2.74304, 0, 0, 0, 1, 1,
-1.008638, 2.699238, 2.07255, 0, 0, 0, 1, 1,
-1.005809, 1.642264, -3.603175, 0, 0, 0, 1, 1,
-1.004953, 0.4042527, -2.277742, 0, 0, 0, 1, 1,
-0.999511, -0.1216352, -1.733373, 0, 0, 0, 1, 1,
-0.9961761, -0.5331655, -3.94784, 0, 0, 0, 1, 1,
-0.9909511, -1.84565, -2.015845, 0, 0, 0, 1, 1,
-0.9844249, -0.9776286, -3.182574, 1, 1, 1, 1, 1,
-0.9784731, 1.254678, 0.2503559, 1, 1, 1, 1, 1,
-0.974057, 0.4765792, -1.807701, 1, 1, 1, 1, 1,
-0.9731236, -1.538831, -3.968389, 1, 1, 1, 1, 1,
-0.96341, -0.3172948, -3.52223, 1, 1, 1, 1, 1,
-0.958392, -0.5886712, -2.206779, 1, 1, 1, 1, 1,
-0.944326, -1.402046, -4.272914, 1, 1, 1, 1, 1,
-0.9403985, 0.3548317, -2.381733, 1, 1, 1, 1, 1,
-0.9346946, 0.4464755, -1.047264, 1, 1, 1, 1, 1,
-0.9334767, -1.726498, -2.394801, 1, 1, 1, 1, 1,
-0.931655, -1.043442, -2.031087, 1, 1, 1, 1, 1,
-0.9272484, -0.791334, -1.604139, 1, 1, 1, 1, 1,
-0.9232048, 0.5218899, -0.363656, 1, 1, 1, 1, 1,
-0.9186184, -1.140197, -4.232679, 1, 1, 1, 1, 1,
-0.9183165, -1.264679, -2.60293, 1, 1, 1, 1, 1,
-0.9173852, -0.1742406, -1.870045, 0, 0, 1, 1, 1,
-0.9076324, -0.1573298, -1.447204, 1, 0, 0, 1, 1,
-0.9072696, -0.2361189, -1.972366, 1, 0, 0, 1, 1,
-0.9042823, 0.8566396, 0.1208979, 1, 0, 0, 1, 1,
-0.9038026, -0.06825407, -2.029147, 1, 0, 0, 1, 1,
-0.9004557, -0.8552204, -2.235945, 1, 0, 0, 1, 1,
-0.899284, 0.7026805, -1.633344, 0, 0, 0, 1, 1,
-0.8983792, -0.7226672, -3.485602, 0, 0, 0, 1, 1,
-0.8883315, -0.5615153, -1.163354, 0, 0, 0, 1, 1,
-0.8874658, -1.168612, -2.45741, 0, 0, 0, 1, 1,
-0.8845159, 0.03130451, -4.291522, 0, 0, 0, 1, 1,
-0.8823048, 0.1335571, -1.624089, 0, 0, 0, 1, 1,
-0.8819912, 0.2224573, -1.914376, 0, 0, 0, 1, 1,
-0.8813838, 1.329527, -1.218667, 1, 1, 1, 1, 1,
-0.8755131, -1.42223, -4.599643, 1, 1, 1, 1, 1,
-0.8754337, -0.2831709, -1.92989, 1, 1, 1, 1, 1,
-0.8729035, -0.5226671, -1.513732, 1, 1, 1, 1, 1,
-0.8631985, -0.206361, 0.2878379, 1, 1, 1, 1, 1,
-0.8620185, -2.355842, -2.141541, 1, 1, 1, 1, 1,
-0.8575285, 0.2175972, -3.431856, 1, 1, 1, 1, 1,
-0.8563939, 0.8408903, 2.261466, 1, 1, 1, 1, 1,
-0.8526772, 0.3102225, -2.19137, 1, 1, 1, 1, 1,
-0.8524874, -0.3429534, -2.944103, 1, 1, 1, 1, 1,
-0.8514061, -0.5559198, -2.799242, 1, 1, 1, 1, 1,
-0.8506642, -0.7086672, -3.422778, 1, 1, 1, 1, 1,
-0.8494626, 1.430022, 0.1130591, 1, 1, 1, 1, 1,
-0.8477286, -0.9195341, -1.955152, 1, 1, 1, 1, 1,
-0.8437431, 0.3475716, -2.817554, 1, 1, 1, 1, 1,
-0.8422093, -0.3411851, -1.245932, 0, 0, 1, 1, 1,
-0.8386319, -1.286342, -2.015591, 1, 0, 0, 1, 1,
-0.8381631, -0.5502732, -3.890313, 1, 0, 0, 1, 1,
-0.8379772, 2.202072, -0.4028955, 1, 0, 0, 1, 1,
-0.8305747, 1.647127, -1.322619, 1, 0, 0, 1, 1,
-0.8278339, 0.6417562, 0.03678589, 1, 0, 0, 1, 1,
-0.8230736, 1.394295, -0.2821515, 0, 0, 0, 1, 1,
-0.8190829, 0.5323468, -1.906557, 0, 0, 0, 1, 1,
-0.8148826, 0.03322347, -1.137232, 0, 0, 0, 1, 1,
-0.8146413, -1.404811, -1.034434, 0, 0, 0, 1, 1,
-0.8131893, -1.102802, -2.170055, 0, 0, 0, 1, 1,
-0.8053486, -0.1789987, -1.773356, 0, 0, 0, 1, 1,
-0.7938018, -0.3573768, -0.248266, 0, 0, 0, 1, 1,
-0.7910598, -0.3734511, -1.395147, 1, 1, 1, 1, 1,
-0.790692, 0.6891983, -1.204116, 1, 1, 1, 1, 1,
-0.7786179, -2.715194, -0.6284539, 1, 1, 1, 1, 1,
-0.7747686, -0.04331867, -2.251031, 1, 1, 1, 1, 1,
-0.7739277, -0.1703853, -3.609735, 1, 1, 1, 1, 1,
-0.7731387, -0.06961784, -2.953104, 1, 1, 1, 1, 1,
-0.7696037, -0.3496242, -3.69625, 1, 1, 1, 1, 1,
-0.7660432, -0.7941022, -2.775004, 1, 1, 1, 1, 1,
-0.7658576, 0.9817457, -1.737998, 1, 1, 1, 1, 1,
-0.7598734, 0.06855045, -2.07516, 1, 1, 1, 1, 1,
-0.7576318, -0.7559251, -1.753232, 1, 1, 1, 1, 1,
-0.7570579, -2.376915, -2.193861, 1, 1, 1, 1, 1,
-0.7558997, -0.1440662, -3.005991, 1, 1, 1, 1, 1,
-0.7495514, -0.7257599, -2.170972, 1, 1, 1, 1, 1,
-0.7461638, -1.350296, -3.761271, 1, 1, 1, 1, 1,
-0.7412298, 1.523446, 1.037716, 0, 0, 1, 1, 1,
-0.7379687, -1.447582, -2.455245, 1, 0, 0, 1, 1,
-0.7307212, -0.850032, -2.27344, 1, 0, 0, 1, 1,
-0.728166, -1.226427, -3.871071, 1, 0, 0, 1, 1,
-0.7213711, -0.5818028, -3.606898, 1, 0, 0, 1, 1,
-0.720906, -1.281189, -2.58846, 1, 0, 0, 1, 1,
-0.7197168, -1.028334, -3.378077, 0, 0, 0, 1, 1,
-0.7176749, 1.219939, 0.1439729, 0, 0, 0, 1, 1,
-0.7156209, 0.4602866, -1.324652, 0, 0, 0, 1, 1,
-0.7093357, 1.079599, -1.732251, 0, 0, 0, 1, 1,
-0.7064217, -0.1083121, -1.626438, 0, 0, 0, 1, 1,
-0.6989065, -0.2519303, -2.779804, 0, 0, 0, 1, 1,
-0.6965356, 0.8993784, -2.416537, 0, 0, 0, 1, 1,
-0.6964895, 0.1796644, -1.868423, 1, 1, 1, 1, 1,
-0.6926088, -0.2000397, -1.358294, 1, 1, 1, 1, 1,
-0.6882157, 0.3570574, -0.7427014, 1, 1, 1, 1, 1,
-0.6848544, 2.350575, 0.2885517, 1, 1, 1, 1, 1,
-0.6819795, 0.258734, -1.64719, 1, 1, 1, 1, 1,
-0.6784396, -0.01808899, -2.393469, 1, 1, 1, 1, 1,
-0.6774136, -0.3309418, -2.440322, 1, 1, 1, 1, 1,
-0.6707178, -0.8056186, -1.80165, 1, 1, 1, 1, 1,
-0.6645938, -0.7156261, -3.139926, 1, 1, 1, 1, 1,
-0.6627848, 0.6670248, -2.69725, 1, 1, 1, 1, 1,
-0.6620904, -1.43306, -4.69692, 1, 1, 1, 1, 1,
-0.6616666, 1.099894, 0.5701382, 1, 1, 1, 1, 1,
-0.6600502, 1.080665, -0.1302176, 1, 1, 1, 1, 1,
-0.6545988, -0.5967962, -2.844804, 1, 1, 1, 1, 1,
-0.6542453, 0.7072033, -2.109347, 1, 1, 1, 1, 1,
-0.6499, 0.7074647, 0.4047621, 0, 0, 1, 1, 1,
-0.6461085, 1.667176, 0.3761654, 1, 0, 0, 1, 1,
-0.6446841, 0.9464051, -0.2309662, 1, 0, 0, 1, 1,
-0.6429783, -0.6876693, -1.962009, 1, 0, 0, 1, 1,
-0.6407421, 0.1747032, -1.97466, 1, 0, 0, 1, 1,
-0.6379034, -1.274337, -3.300868, 1, 0, 0, 1, 1,
-0.6334024, -0.3166226, -1.824099, 0, 0, 0, 1, 1,
-0.6320067, 0.4297168, -0.8089601, 0, 0, 0, 1, 1,
-0.6302965, 1.035952, -0.02549153, 0, 0, 0, 1, 1,
-0.6256751, 0.9709602, -1.177989, 0, 0, 0, 1, 1,
-0.618993, -0.8637589, -2.886051, 0, 0, 0, 1, 1,
-0.6169068, 0.7450171, -1.828732, 0, 0, 0, 1, 1,
-0.6153303, 0.6179796, -1.157941, 0, 0, 0, 1, 1,
-0.6141732, 1.13805, -0.1009717, 1, 1, 1, 1, 1,
-0.6102758, 1.16076, -1.287484, 1, 1, 1, 1, 1,
-0.6061648, 0.116953, -3.541187, 1, 1, 1, 1, 1,
-0.6059076, -0.5008438, -1.537513, 1, 1, 1, 1, 1,
-0.5956367, -1.112975, -3.105854, 1, 1, 1, 1, 1,
-0.5952684, -0.1200835, -1.945284, 1, 1, 1, 1, 1,
-0.5928545, 1.997034, -0.2125081, 1, 1, 1, 1, 1,
-0.5902082, 0.03467071, -1.273643, 1, 1, 1, 1, 1,
-0.5850528, 0.4482971, -0.8163992, 1, 1, 1, 1, 1,
-0.5847219, 2.007671, -1.346774, 1, 1, 1, 1, 1,
-0.5847186, 1.130954, -2.001764, 1, 1, 1, 1, 1,
-0.5838044, -1.543573, -2.880739, 1, 1, 1, 1, 1,
-0.5829692, -0.5032774, -3.025841, 1, 1, 1, 1, 1,
-0.582167, -0.6396678, -2.540205, 1, 1, 1, 1, 1,
-0.5787656, 0.8652284, -0.8105024, 1, 1, 1, 1, 1,
-0.5724052, 0.5918771, -0.535932, 0, 0, 1, 1, 1,
-0.5693666, -0.1545518, -0.955344, 1, 0, 0, 1, 1,
-0.5648316, 0.05129745, -2.570972, 1, 0, 0, 1, 1,
-0.5643926, -0.2507903, -1.97567, 1, 0, 0, 1, 1,
-0.5623635, -0.733124, -2.583276, 1, 0, 0, 1, 1,
-0.5622116, -1.279029, -1.700936, 1, 0, 0, 1, 1,
-0.5577673, -0.3878794, -1.927905, 0, 0, 0, 1, 1,
-0.5562037, -0.3750962, -3.794331, 0, 0, 0, 1, 1,
-0.5549558, -0.7077445, -2.491589, 0, 0, 0, 1, 1,
-0.5546415, 0.1273529, -0.8863438, 0, 0, 0, 1, 1,
-0.5542275, 0.4634109, -0.628395, 0, 0, 0, 1, 1,
-0.5497683, 0.6546062, -0.04742834, 0, 0, 0, 1, 1,
-0.5469707, 0.9707927, 1.671106, 0, 0, 0, 1, 1,
-0.5447081, -0.07800962, -1.199877, 1, 1, 1, 1, 1,
-0.5435435, 0.6286907, -1.695292, 1, 1, 1, 1, 1,
-0.5389434, 1.155306, 0.1285799, 1, 1, 1, 1, 1,
-0.5387043, -0.2524058, -1.00333, 1, 1, 1, 1, 1,
-0.5383264, -0.4433733, -2.265431, 1, 1, 1, 1, 1,
-0.5372927, -0.8976575, -1.621192, 1, 1, 1, 1, 1,
-0.535785, 0.3023838, 0.2901463, 1, 1, 1, 1, 1,
-0.5353234, 0.3340207, -2.020322, 1, 1, 1, 1, 1,
-0.5327111, -0.8519516, -1.091652, 1, 1, 1, 1, 1,
-0.5315574, 1.254439, -1.095164, 1, 1, 1, 1, 1,
-0.5264121, -0.06762878, -1.116501, 1, 1, 1, 1, 1,
-0.5194007, -0.8650281, -2.019651, 1, 1, 1, 1, 1,
-0.5184047, -1.745167, -4.882644, 1, 1, 1, 1, 1,
-0.5167247, -1.529148, -3.95567, 1, 1, 1, 1, 1,
-0.5160664, 0.7166709, -0.8111781, 1, 1, 1, 1, 1,
-0.5157112, -0.02593618, -0.4723981, 0, 0, 1, 1, 1,
-0.515388, -0.7878914, -2.60396, 1, 0, 0, 1, 1,
-0.5124372, 0.713295, -2.700135, 1, 0, 0, 1, 1,
-0.5076821, 1.383737, -0.7583056, 1, 0, 0, 1, 1,
-0.5039333, -0.6953267, -2.771957, 1, 0, 0, 1, 1,
-0.4995569, -0.3670949, -2.611575, 1, 0, 0, 1, 1,
-0.4985646, 1.391878, -0.9288013, 0, 0, 0, 1, 1,
-0.4945261, 0.6057892, 0.2987069, 0, 0, 0, 1, 1,
-0.4942875, -0.4025506, -2.477581, 0, 0, 0, 1, 1,
-0.4916514, 0.1256266, -0.2276712, 0, 0, 0, 1, 1,
-0.4883865, 1.224589, -1.294489, 0, 0, 0, 1, 1,
-0.4883116, -0.6444541, -2.607349, 0, 0, 0, 1, 1,
-0.4869545, 0.004438949, -0.07503534, 0, 0, 0, 1, 1,
-0.4865772, -1.063005, -3.055479, 1, 1, 1, 1, 1,
-0.4801473, -1.073937, -2.751019, 1, 1, 1, 1, 1,
-0.4797603, 1.656713, -0.6760368, 1, 1, 1, 1, 1,
-0.4731598, -0.5892843, -1.798678, 1, 1, 1, 1, 1,
-0.472895, 1.692905, -0.6953903, 1, 1, 1, 1, 1,
-0.4666437, -1.690553, -2.657259, 1, 1, 1, 1, 1,
-0.465233, 1.425505, -1.621632, 1, 1, 1, 1, 1,
-0.4518867, 0.1607755, -0.7414866, 1, 1, 1, 1, 1,
-0.4508433, -1.140754, -2.052923, 1, 1, 1, 1, 1,
-0.4424232, -0.1654166, -2.403124, 1, 1, 1, 1, 1,
-0.4415942, -1.822693, -3.219143, 1, 1, 1, 1, 1,
-0.4399884, -0.03178316, -3.250027, 1, 1, 1, 1, 1,
-0.4398113, 0.5873619, 0.3826526, 1, 1, 1, 1, 1,
-0.4397923, 1.181126, -0.7011097, 1, 1, 1, 1, 1,
-0.4397809, 0.2673431, -0.6795206, 1, 1, 1, 1, 1,
-0.4365839, 0.2127684, -1.171818, 0, 0, 1, 1, 1,
-0.4359297, 1.314979, -0.8314525, 1, 0, 0, 1, 1,
-0.4291315, 0.0749236, 0.04621198, 1, 0, 0, 1, 1,
-0.4266007, -0.3884335, -2.166825, 1, 0, 0, 1, 1,
-0.4245965, -1.444678, -3.385582, 1, 0, 0, 1, 1,
-0.4242923, 0.501315, -0.7733523, 1, 0, 0, 1, 1,
-0.4167985, 0.01991663, -1.558849, 0, 0, 0, 1, 1,
-0.416709, -1.065708, -3.256711, 0, 0, 0, 1, 1,
-0.4104126, 0.4689538, -1.191636, 0, 0, 0, 1, 1,
-0.4067203, -0.4882101, -1.997521, 0, 0, 0, 1, 1,
-0.4063366, -0.3225616, -2.863098, 0, 0, 0, 1, 1,
-0.4056313, -1.117523, -2.314234, 0, 0, 0, 1, 1,
-0.4025616, 0.4195723, -0.5470517, 0, 0, 0, 1, 1,
-0.3976924, 0.7123034, -0.7683112, 1, 1, 1, 1, 1,
-0.3862488, -0.2634309, -0.5073071, 1, 1, 1, 1, 1,
-0.382333, -0.3257958, -2.111085, 1, 1, 1, 1, 1,
-0.3675605, -0.01620348, -1.772362, 1, 1, 1, 1, 1,
-0.3657076, 1.253988, -0.9768639, 1, 1, 1, 1, 1,
-0.365495, -0.08230544, -1.496957, 1, 1, 1, 1, 1,
-0.3617101, -0.01854131, -2.429313, 1, 1, 1, 1, 1,
-0.3613231, 0.2714427, -2.612156, 1, 1, 1, 1, 1,
-0.3577554, 0.05685707, -1.798401, 1, 1, 1, 1, 1,
-0.3536358, 1.069591, 0.9221842, 1, 1, 1, 1, 1,
-0.3518914, -0.4607361, -1.993185, 1, 1, 1, 1, 1,
-0.3472925, 0.3677436, -1.433384, 1, 1, 1, 1, 1,
-0.3456694, -0.2764362, -1.438876, 1, 1, 1, 1, 1,
-0.3448611, 0.8178215, -0.04360796, 1, 1, 1, 1, 1,
-0.3415198, 0.1634077, -2.82167, 1, 1, 1, 1, 1,
-0.3371556, -1.598561, -3.394253, 0, 0, 1, 1, 1,
-0.3314125, -0.2321122, -2.459743, 1, 0, 0, 1, 1,
-0.329592, -1.16702, -2.034918, 1, 0, 0, 1, 1,
-0.3281355, -1.248363, -3.573442, 1, 0, 0, 1, 1,
-0.321988, -1.788399, -1.626836, 1, 0, 0, 1, 1,
-0.3178658, -0.2811659, -0.8103399, 1, 0, 0, 1, 1,
-0.3156089, -0.6757037, -2.130409, 0, 0, 0, 1, 1,
-0.3128372, 1.343134, 0.3507233, 0, 0, 0, 1, 1,
-0.3121555, -0.8641469, -3.268771, 0, 0, 0, 1, 1,
-0.3093516, 0.4529053, -1.031252, 0, 0, 0, 1, 1,
-0.3079221, 0.1383869, -0.9918517, 0, 0, 0, 1, 1,
-0.3051202, -1.321663, -3.816202, 0, 0, 0, 1, 1,
-0.2975143, 2.643284, 1.352196, 0, 0, 0, 1, 1,
-0.2974599, 0.3832492, 0.2762005, 1, 1, 1, 1, 1,
-0.2948121, -0.2028694, -2.333927, 1, 1, 1, 1, 1,
-0.2902833, 0.2177633, -0.155972, 1, 1, 1, 1, 1,
-0.2897479, 0.5170512, -0.6084039, 1, 1, 1, 1, 1,
-0.2832604, -0.1986515, -2.013234, 1, 1, 1, 1, 1,
-0.2776035, -3.293358, -3.4912, 1, 1, 1, 1, 1,
-0.2762082, -0.3097782, -4.859868, 1, 1, 1, 1, 1,
-0.2762063, -0.5135023, -2.299727, 1, 1, 1, 1, 1,
-0.274571, 0.1662671, -0.1894053, 1, 1, 1, 1, 1,
-0.2731986, 0.591845, -0.5521047, 1, 1, 1, 1, 1,
-0.2698888, -0.3836489, -3.442776, 1, 1, 1, 1, 1,
-0.2671797, 0.9434782, -1.081833, 1, 1, 1, 1, 1,
-0.2634872, -0.4420669, -3.05455, 1, 1, 1, 1, 1,
-0.2622171, -0.1016117, -1.973042, 1, 1, 1, 1, 1,
-0.2592512, 0.2100348, -1.086189, 1, 1, 1, 1, 1,
-0.2584275, 0.2844158, -2.133666, 0, 0, 1, 1, 1,
-0.2578436, 0.8020576, -0.9909145, 1, 0, 0, 1, 1,
-0.2578249, -1.674054, -3.598685, 1, 0, 0, 1, 1,
-0.2572843, -0.09466034, -0.6988824, 1, 0, 0, 1, 1,
-0.2559046, -0.6563861, -4.689679, 1, 0, 0, 1, 1,
-0.2532746, 0.2962019, -1.365732, 1, 0, 0, 1, 1,
-0.250265, 0.8324431, -0.1814817, 0, 0, 0, 1, 1,
-0.2463521, -1.898908, -2.081141, 0, 0, 0, 1, 1,
-0.2408623, -0.3198049, -2.205842, 0, 0, 0, 1, 1,
-0.2404153, 1.715535, 0.007932505, 0, 0, 0, 1, 1,
-0.2355316, -0.978933, -0.990917, 0, 0, 0, 1, 1,
-0.2304438, -1.137789, -3.621418, 0, 0, 0, 1, 1,
-0.229854, -1.102913, -1.98778, 0, 0, 0, 1, 1,
-0.2280676, 0.3635104, -0.8475856, 1, 1, 1, 1, 1,
-0.2279945, -1.616294, -3.100487, 1, 1, 1, 1, 1,
-0.2237849, -0.585822, -2.873386, 1, 1, 1, 1, 1,
-0.222798, 0.3620588, -0.6362093, 1, 1, 1, 1, 1,
-0.2204632, -1.317455, -2.26431, 1, 1, 1, 1, 1,
-0.2185905, 0.1602677, -2.514252, 1, 1, 1, 1, 1,
-0.2121852, 0.5679056, -2.099002, 1, 1, 1, 1, 1,
-0.2095654, 1.400296, -0.4974839, 1, 1, 1, 1, 1,
-0.2092074, -0.8118238, -1.969998, 1, 1, 1, 1, 1,
-0.2060082, -0.3544815, -3.239179, 1, 1, 1, 1, 1,
-0.2042201, -1.0199, -3.18299, 1, 1, 1, 1, 1,
-0.1988701, 2.059829, -0.5938995, 1, 1, 1, 1, 1,
-0.1983381, 1.030087, 0.5096658, 1, 1, 1, 1, 1,
-0.1973306, -0.3112855, -1.560704, 1, 1, 1, 1, 1,
-0.1901779, 0.1013688, -1.746002, 1, 1, 1, 1, 1,
-0.1885764, -0.1282992, -1.876205, 0, 0, 1, 1, 1,
-0.188107, 2.552902, 0.4491026, 1, 0, 0, 1, 1,
-0.1855738, 0.3527658, 0.9999373, 1, 0, 0, 1, 1,
-0.1850219, -0.2235197, -0.9412457, 1, 0, 0, 1, 1,
-0.1752306, 0.58315, -1.080711, 1, 0, 0, 1, 1,
-0.1751639, -0.2372539, -3.346961, 1, 0, 0, 1, 1,
-0.1730974, 0.1290584, -1.569535, 0, 0, 0, 1, 1,
-0.1717764, -1.377504, -3.985873, 0, 0, 0, 1, 1,
-0.1715078, -1.03498, -2.717507, 0, 0, 0, 1, 1,
-0.1686179, 0.3297057, 1.132688, 0, 0, 0, 1, 1,
-0.1667179, -0.1797312, -3.248184, 0, 0, 0, 1, 1,
-0.1620039, 0.08768441, -1.094415, 0, 0, 0, 1, 1,
-0.1614594, -0.1736784, -2.640112, 0, 0, 0, 1, 1,
-0.1551927, -2.24529, -1.437342, 1, 1, 1, 1, 1,
-0.1551696, 1.87136, -0.4351833, 1, 1, 1, 1, 1,
-0.1535487, -0.3444724, -4.783574, 1, 1, 1, 1, 1,
-0.1486249, -0.1871065, -3.267325, 1, 1, 1, 1, 1,
-0.1470601, 0.9254672, 0.5598112, 1, 1, 1, 1, 1,
-0.1447302, 1.425025, 1.854849, 1, 1, 1, 1, 1,
-0.1445155, -1.107484, -3.041785, 1, 1, 1, 1, 1,
-0.1413371, 0.1487739, 0.8805996, 1, 1, 1, 1, 1,
-0.1400997, -1.832295, -4.312251, 1, 1, 1, 1, 1,
-0.1397613, 0.9454787, -1.206486, 1, 1, 1, 1, 1,
-0.1393246, -0.3598489, -3.302481, 1, 1, 1, 1, 1,
-0.1367159, -0.4832134, -3.758233, 1, 1, 1, 1, 1,
-0.1364689, 0.3636075, -0.810355, 1, 1, 1, 1, 1,
-0.1338675, -0.2783091, -2.126177, 1, 1, 1, 1, 1,
-0.1307086, -1.387304, -2.51368, 1, 1, 1, 1, 1,
-0.1243905, 0.8883759, 0.3433153, 0, 0, 1, 1, 1,
-0.1241331, -0.1728104, -4.128726, 1, 0, 0, 1, 1,
-0.1222308, -0.4223901, -3.960932, 1, 0, 0, 1, 1,
-0.1221806, 2.361907, -0.7079761, 1, 0, 0, 1, 1,
-0.1138558, 0.3568233, -1.677245, 1, 0, 0, 1, 1,
-0.1098455, -0.06031817, -0.3272823, 1, 0, 0, 1, 1,
-0.1025785, 0.6638465, 0.1545088, 0, 0, 0, 1, 1,
-0.08732301, 0.9696657, -1.430731, 0, 0, 0, 1, 1,
-0.0872062, 0.9908331, -0.03667933, 0, 0, 0, 1, 1,
-0.08178805, 0.1958005, 0.400647, 0, 0, 0, 1, 1,
-0.0787666, 0.5291946, 0.08942941, 0, 0, 0, 1, 1,
-0.07650122, 0.7256286, 1.60066, 0, 0, 0, 1, 1,
-0.07577669, -0.2358712, -2.71358, 0, 0, 0, 1, 1,
-0.07484999, 0.7251714, 0.2837219, 1, 1, 1, 1, 1,
-0.07477403, -1.372164, -3.01643, 1, 1, 1, 1, 1,
-0.07333697, 0.0104426, -1.368141, 1, 1, 1, 1, 1,
-0.0731537, 0.2622941, 0.7793605, 1, 1, 1, 1, 1,
-0.06491198, -0.9678194, -4.608594, 1, 1, 1, 1, 1,
-0.06285376, -1.795975, -2.538965, 1, 1, 1, 1, 1,
-0.06160065, -0.3954484, -1.610105, 1, 1, 1, 1, 1,
-0.06051483, -0.9376345, -2.056716, 1, 1, 1, 1, 1,
-0.05793603, 0.6979454, 1.08601, 1, 1, 1, 1, 1,
-0.05725664, -1.68103, -2.439135, 1, 1, 1, 1, 1,
-0.05681536, -0.782961, -5.913476, 1, 1, 1, 1, 1,
-0.05384603, -0.198504, -3.650228, 1, 1, 1, 1, 1,
-0.05169122, 0.28142, -1.864817, 1, 1, 1, 1, 1,
-0.05032352, 0.1040074, 0.02108876, 1, 1, 1, 1, 1,
-0.0484528, 0.7509559, 0.6973644, 1, 1, 1, 1, 1,
-0.0462752, -1.67149, -3.03076, 0, 0, 1, 1, 1,
-0.04550368, 0.4815733, -0.3445425, 1, 0, 0, 1, 1,
-0.04279239, -3.434809, -3.664191, 1, 0, 0, 1, 1,
-0.03672913, 1.607798, 0.7482513, 1, 0, 0, 1, 1,
-0.03651509, -0.6845548, -4.101938, 1, 0, 0, 1, 1,
-0.0357997, -0.2019422, -1.876722, 1, 0, 0, 1, 1,
-0.03411353, 0.2262151, -0.6534297, 0, 0, 0, 1, 1,
-0.03183036, -0.2149267, -2.625755, 0, 0, 0, 1, 1,
-0.02254444, 0.1399115, -1.149548, 0, 0, 0, 1, 1,
-0.02154424, -0.5284162, -3.206095, 0, 0, 0, 1, 1,
-0.01189753, -1.078514, -3.160162, 0, 0, 0, 1, 1,
-0.01184831, 1.786582, 0.2193786, 0, 0, 0, 1, 1,
-0.01121289, 1.417146, 2.202606, 0, 0, 0, 1, 1,
-0.007257479, 1.848287, 0.3109511, 1, 1, 1, 1, 1,
-0.006353215, -0.5045003, -3.292512, 1, 1, 1, 1, 1,
-0.005721621, 1.552492, 2.001352, 1, 1, 1, 1, 1,
-0.005411914, -0.5088379, -1.538847, 1, 1, 1, 1, 1,
-0.001387084, 0.1505648, 1.438806, 1, 1, 1, 1, 1,
-0.0004300461, -0.3212266, -4.360112, 1, 1, 1, 1, 1,
0.00244345, -1.336204, 1.632285, 1, 1, 1, 1, 1,
0.002944863, 0.2305069, 0.6637846, 1, 1, 1, 1, 1,
0.006103035, -0.4275513, 1.987263, 1, 1, 1, 1, 1,
0.01121947, -0.1945242, 2.980111, 1, 1, 1, 1, 1,
0.01467156, -0.7334262, 2.426829, 1, 1, 1, 1, 1,
0.01611212, -0.4320631, 2.832677, 1, 1, 1, 1, 1,
0.01756106, 0.4260276, -0.6836708, 1, 1, 1, 1, 1,
0.01972369, -1.368496, 4.251684, 1, 1, 1, 1, 1,
0.0266789, 0.1563938, 0.2329514, 1, 1, 1, 1, 1,
0.02871771, -0.3139799, 2.449482, 0, 0, 1, 1, 1,
0.03328869, -0.8412516, 3.230182, 1, 0, 0, 1, 1,
0.03366612, 0.278427, 0.3712935, 1, 0, 0, 1, 1,
0.03647795, -0.1565161, 2.493521, 1, 0, 0, 1, 1,
0.03861292, -0.4947214, 3.6657, 1, 0, 0, 1, 1,
0.05107931, -1.92619, 3.417568, 1, 0, 0, 1, 1,
0.05307122, -0.327653, 0.8607584, 0, 0, 0, 1, 1,
0.0541124, -1.003878, 0.6605816, 0, 0, 0, 1, 1,
0.05981972, 0.05044279, 0.1372095, 0, 0, 0, 1, 1,
0.06840427, -0.5607961, 2.978011, 0, 0, 0, 1, 1,
0.07150723, 1.003308, 0.204573, 0, 0, 0, 1, 1,
0.0724766, 0.571362, 2.423871, 0, 0, 0, 1, 1,
0.07339906, -0.5725886, 1.611705, 0, 0, 0, 1, 1,
0.07354278, 0.7013739, -1.28291, 1, 1, 1, 1, 1,
0.07357339, 0.1701187, 0.3718883, 1, 1, 1, 1, 1,
0.07725854, -0.2643808, 4.126325, 1, 1, 1, 1, 1,
0.08145957, -0.1887387, 1.45227, 1, 1, 1, 1, 1,
0.08181924, 1.817284, -0.20501, 1, 1, 1, 1, 1,
0.08322806, 1.526203, -1.483821, 1, 1, 1, 1, 1,
0.08334056, 0.9563959, 0.09620823, 1, 1, 1, 1, 1,
0.08354688, -1.55336, 4.025237, 1, 1, 1, 1, 1,
0.09035682, -0.1536417, 1.80136, 1, 1, 1, 1, 1,
0.09237, 2.489702, -0.2231122, 1, 1, 1, 1, 1,
0.09333436, -0.2895996, 1.859806, 1, 1, 1, 1, 1,
0.09839649, -1.481972, 3.898978, 1, 1, 1, 1, 1,
0.1005507, -1.29336, 3.822564, 1, 1, 1, 1, 1,
0.1026029, -1.034894, 2.983201, 1, 1, 1, 1, 1,
0.1043834, 0.5966451, 0.8090384, 1, 1, 1, 1, 1,
0.1050167, 1.138353, -0.01537329, 0, 0, 1, 1, 1,
0.105487, 0.9059561, 0.9561298, 1, 0, 0, 1, 1,
0.1101986, 0.6280122, -0.1006048, 1, 0, 0, 1, 1,
0.1123448, -0.6784943, 2.739849, 1, 0, 0, 1, 1,
0.1169878, 0.04000225, 1.914087, 1, 0, 0, 1, 1,
0.1177829, -0.3359877, 5.037463, 1, 0, 0, 1, 1,
0.1188268, -0.4710966, 2.509793, 0, 0, 0, 1, 1,
0.1255974, 0.9161375, 0.9859451, 0, 0, 0, 1, 1,
0.1259423, -1.249797, 1.782243, 0, 0, 0, 1, 1,
0.1261643, -0.9585091, 3.659948, 0, 0, 0, 1, 1,
0.1312968, 1.174934, -2.270329, 0, 0, 0, 1, 1,
0.1332671, 0.9363706, -0.7782296, 0, 0, 0, 1, 1,
0.1385778, 0.3261812, 0.6121676, 0, 0, 0, 1, 1,
0.1427724, 2.182856, -0.4569448, 1, 1, 1, 1, 1,
0.1446369, -0.2651624, 3.164352, 1, 1, 1, 1, 1,
0.1455187, -0.516353, 3.242714, 1, 1, 1, 1, 1,
0.1497329, -1.423903, 3.665555, 1, 1, 1, 1, 1,
0.1514472, -0.8384278, 3.968029, 1, 1, 1, 1, 1,
0.1515178, -1.519977, 2.642308, 1, 1, 1, 1, 1,
0.1532214, 1.251135, -0.4104324, 1, 1, 1, 1, 1,
0.1567585, 0.6755536, 1.257542, 1, 1, 1, 1, 1,
0.1619798, -0.5072336, 3.731076, 1, 1, 1, 1, 1,
0.1621251, -0.8096371, 1.708187, 1, 1, 1, 1, 1,
0.1646964, 0.5866702, -0.6440222, 1, 1, 1, 1, 1,
0.1652093, 0.431591, 0.3735977, 1, 1, 1, 1, 1,
0.1675984, 0.805851, -0.7383541, 1, 1, 1, 1, 1,
0.1717709, 1.368931, 0.1330632, 1, 1, 1, 1, 1,
0.1742826, -0.1402735, 2.328282, 1, 1, 1, 1, 1,
0.1754583, -0.4953012, 2.755882, 0, 0, 1, 1, 1,
0.1769428, 0.1840311, -0.4629295, 1, 0, 0, 1, 1,
0.1791262, -0.06511449, 1.349656, 1, 0, 0, 1, 1,
0.1811526, 0.2525619, 0.9182023, 1, 0, 0, 1, 1,
0.1830346, 0.2348876, 0.6135109, 1, 0, 0, 1, 1,
0.1871534, 0.5212479, 0.4271177, 1, 0, 0, 1, 1,
0.188791, 0.1369747, 1.211531, 0, 0, 0, 1, 1,
0.1926097, 0.541267, 0.3699493, 0, 0, 0, 1, 1,
0.195331, -1.619117, 5.08582, 0, 0, 0, 1, 1,
0.1954763, 0.2388152, 1.838191, 0, 0, 0, 1, 1,
0.204185, 2.146571, 0.7427047, 0, 0, 0, 1, 1,
0.2054319, 0.1470542, -0.7981869, 0, 0, 0, 1, 1,
0.2068531, 0.3491016, 0.3082734, 0, 0, 0, 1, 1,
0.2068988, -1.178689, 2.644675, 1, 1, 1, 1, 1,
0.214338, -0.09113974, 0.6042832, 1, 1, 1, 1, 1,
0.2155344, 0.6631755, 2.16328, 1, 1, 1, 1, 1,
0.2157131, 0.04074639, 0.1146877, 1, 1, 1, 1, 1,
0.2158324, -1.076467, 4.228839, 1, 1, 1, 1, 1,
0.2171271, 0.7606372, -0.8376566, 1, 1, 1, 1, 1,
0.2173801, -1.855339, 3.061472, 1, 1, 1, 1, 1,
0.2181594, 0.4229034, 2.388841, 1, 1, 1, 1, 1,
0.2205533, -0.603174, 1.65044, 1, 1, 1, 1, 1,
0.2218646, 1.38319, -0.5135214, 1, 1, 1, 1, 1,
0.2279017, 1.018067, -0.1658025, 1, 1, 1, 1, 1,
0.2325027, -0.8820412, 3.451081, 1, 1, 1, 1, 1,
0.2327912, 1.721649, -0.9393759, 1, 1, 1, 1, 1,
0.2356197, -0.5115719, 3.3141, 1, 1, 1, 1, 1,
0.2358328, 2.064422, 0.4540751, 1, 1, 1, 1, 1,
0.2417272, -0.8346281, 3.758443, 0, 0, 1, 1, 1,
0.2446553, -1.316578, 2.76665, 1, 0, 0, 1, 1,
0.24588, -1.68266, 4.274013, 1, 0, 0, 1, 1,
0.2481155, 1.165266, 0.9285732, 1, 0, 0, 1, 1,
0.2487523, -0.4798389, 2.530403, 1, 0, 0, 1, 1,
0.2509093, -1.696489, 3.315621, 1, 0, 0, 1, 1,
0.2573982, 0.742499, -0.6503857, 0, 0, 0, 1, 1,
0.2586077, -1.513438, 2.996198, 0, 0, 0, 1, 1,
0.2650406, 1.213631, 1.028749, 0, 0, 0, 1, 1,
0.2660554, 1.304415, 1.791392, 0, 0, 0, 1, 1,
0.2666101, -0.1659108, 2.018607, 0, 0, 0, 1, 1,
0.2687985, -0.654402, 2.40003, 0, 0, 0, 1, 1,
0.2701256, -0.6753742, 2.757118, 0, 0, 0, 1, 1,
0.2703159, 0.8086987, 1.396712, 1, 1, 1, 1, 1,
0.2765664, 0.2440263, 0.7091458, 1, 1, 1, 1, 1,
0.2767546, 0.9098982, 1.176588, 1, 1, 1, 1, 1,
0.2768611, -0.873157, 2.875648, 1, 1, 1, 1, 1,
0.2802437, -0.7488064, 0.464315, 1, 1, 1, 1, 1,
0.2803415, 0.9488269, -0.4850193, 1, 1, 1, 1, 1,
0.2868868, 0.1093168, 1.212225, 1, 1, 1, 1, 1,
0.2884498, 0.7931474, 1.81131, 1, 1, 1, 1, 1,
0.2894247, -0.8032205, 2.115248, 1, 1, 1, 1, 1,
0.2958483, 0.2028038, 0.8727218, 1, 1, 1, 1, 1,
0.299015, -0.1086512, 0.8104898, 1, 1, 1, 1, 1,
0.3047244, 0.1371946, 0.8760459, 1, 1, 1, 1, 1,
0.3108727, -1.257074, 3.203246, 1, 1, 1, 1, 1,
0.3121699, -0.354557, 2.544563, 1, 1, 1, 1, 1,
0.313664, 0.7683951, -0.7489497, 1, 1, 1, 1, 1,
0.3164258, -0.1274675, 1.875526, 0, 0, 1, 1, 1,
0.3167011, 0.5728846, 0.4466124, 1, 0, 0, 1, 1,
0.3180953, -0.1033028, 1.372325, 1, 0, 0, 1, 1,
0.3219992, -1.326692, 2.696326, 1, 0, 0, 1, 1,
0.3309234, -0.1017682, 2.736192, 1, 0, 0, 1, 1,
0.3360482, -0.3225918, 1.66363, 1, 0, 0, 1, 1,
0.3371146, 0.3468178, 0.7885541, 0, 0, 0, 1, 1,
0.3388788, 0.1651616, 1.707117, 0, 0, 0, 1, 1,
0.3401745, 0.002061095, 0.4274495, 0, 0, 0, 1, 1,
0.3416875, -0.3931532, 2.231711, 0, 0, 0, 1, 1,
0.3419719, -0.7899798, 2.675754, 0, 0, 0, 1, 1,
0.3420494, -0.7771112, 3.398578, 0, 0, 0, 1, 1,
0.3420524, -0.422515, 2.796961, 0, 0, 0, 1, 1,
0.3429203, 0.2467393, 1.571399, 1, 1, 1, 1, 1,
0.3433368, 0.1426969, 0.6624511, 1, 1, 1, 1, 1,
0.3472368, 1.130784, -0.1853622, 1, 1, 1, 1, 1,
0.3496196, 0.646713, 1.795674, 1, 1, 1, 1, 1,
0.3506259, 0.507248, 1.016052, 1, 1, 1, 1, 1,
0.3575487, 0.5656551, 0.6153649, 1, 1, 1, 1, 1,
0.3590295, 1.296883, -0.5158513, 1, 1, 1, 1, 1,
0.3665011, -0.2678384, 2.819582, 1, 1, 1, 1, 1,
0.3672336, 0.8305296, 0.8943145, 1, 1, 1, 1, 1,
0.3673491, -0.9279922, 2.914926, 1, 1, 1, 1, 1,
0.3675644, -0.4647618, 2.249584, 1, 1, 1, 1, 1,
0.3764763, 0.5339103, 0.5646722, 1, 1, 1, 1, 1,
0.3773602, 1.091497, -1.398834, 1, 1, 1, 1, 1,
0.3823579, 0.4883933, 0.2245483, 1, 1, 1, 1, 1,
0.3828862, 0.6381673, 0.4820617, 1, 1, 1, 1, 1,
0.3838865, 0.6801868, -0.2449422, 0, 0, 1, 1, 1,
0.3873481, -0.2995245, 0.3926859, 1, 0, 0, 1, 1,
0.3883375, -1.621536, 2.99616, 1, 0, 0, 1, 1,
0.3891321, 1.008898, -0.02415242, 1, 0, 0, 1, 1,
0.3895443, 0.09256072, 0.5334522, 1, 0, 0, 1, 1,
0.3939711, -0.1028585, 1.450075, 1, 0, 0, 1, 1,
0.3951497, -2.281554, 3.192711, 0, 0, 0, 1, 1,
0.4064931, -1.767107, 2.34414, 0, 0, 0, 1, 1,
0.4096473, 2.103192, -0.598186, 0, 0, 0, 1, 1,
0.4130091, 0.8778504, 0.829227, 0, 0, 0, 1, 1,
0.4203182, -1.582479, 4.008839, 0, 0, 0, 1, 1,
0.4211275, -1.195911, 1.273559, 0, 0, 0, 1, 1,
0.4295357, 0.3276878, 2.059179, 0, 0, 0, 1, 1,
0.4337216, 0.06026828, 1.013352, 1, 1, 1, 1, 1,
0.4337468, -0.319483, 0.9503371, 1, 1, 1, 1, 1,
0.435043, 2.50061, 0.6667821, 1, 1, 1, 1, 1,
0.4355335, -0.04194343, 0.1104129, 1, 1, 1, 1, 1,
0.4356778, -0.8786065, 0.05231969, 1, 1, 1, 1, 1,
0.4387914, -0.3773538, 1.015982, 1, 1, 1, 1, 1,
0.4410888, -0.8448731, 2.5987, 1, 1, 1, 1, 1,
0.4481225, 0.7362859, 1.823754, 1, 1, 1, 1, 1,
0.4500025, 0.1807979, 0.1663198, 1, 1, 1, 1, 1,
0.4506361, 0.8333045, 2.284652, 1, 1, 1, 1, 1,
0.4513003, -2.115175, 2.500072, 1, 1, 1, 1, 1,
0.4527122, 0.3008228, 2.678936, 1, 1, 1, 1, 1,
0.4589482, 1.586034, -0.35974, 1, 1, 1, 1, 1,
0.4606612, -2.636217, 2.300059, 1, 1, 1, 1, 1,
0.4621928, 0.2941843, 1.410955, 1, 1, 1, 1, 1,
0.4635384, -1.892316, 3.05583, 0, 0, 1, 1, 1,
0.4641795, 0.3320069, -0.200528, 1, 0, 0, 1, 1,
0.4691747, -0.7932801, 1.969758, 1, 0, 0, 1, 1,
0.4700266, -1.12777, 2.462601, 1, 0, 0, 1, 1,
0.4727884, -0.2286502, 2.538432, 1, 0, 0, 1, 1,
0.4754971, 1.302153, -0.6582621, 1, 0, 0, 1, 1,
0.4773294, -0.289475, 1.111547, 0, 0, 0, 1, 1,
0.4835892, 0.8766472, 0.8322883, 0, 0, 0, 1, 1,
0.4839313, -1.614391, 3.178262, 0, 0, 0, 1, 1,
0.4871477, -0.5046645, 2.50804, 0, 0, 0, 1, 1,
0.4882084, -0.2867166, 2.06657, 0, 0, 0, 1, 1,
0.4885212, 0.967354, 2.523967, 0, 0, 0, 1, 1,
0.4895757, 2.595491, 1.374839, 0, 0, 0, 1, 1,
0.5084892, 0.03717668, 1.5423, 1, 1, 1, 1, 1,
0.5091032, -0.4333019, 2.082401, 1, 1, 1, 1, 1,
0.5091761, 0.2040588, -0.7737997, 1, 1, 1, 1, 1,
0.5105865, -0.8105673, 2.767178, 1, 1, 1, 1, 1,
0.511992, 0.7105411, 0.3079926, 1, 1, 1, 1, 1,
0.5120084, 0.1740937, 1.806316, 1, 1, 1, 1, 1,
0.5187483, 1.059033, -0.2554451, 1, 1, 1, 1, 1,
0.5310788, 0.3101317, -1.593863, 1, 1, 1, 1, 1,
0.532105, 0.3880262, 1.301445, 1, 1, 1, 1, 1,
0.5440816, -0.969013, 2.510775, 1, 1, 1, 1, 1,
0.544158, -1.207598, 2.707762, 1, 1, 1, 1, 1,
0.5483345, -2.451179, 2.228673, 1, 1, 1, 1, 1,
0.5524039, -0.3001256, 2.493077, 1, 1, 1, 1, 1,
0.552425, 0.5204903, 0.5378125, 1, 1, 1, 1, 1,
0.5524927, -0.6853007, 2.85011, 1, 1, 1, 1, 1,
0.552599, 0.7317134, -0.5191743, 0, 0, 1, 1, 1,
0.5526975, 0.3892423, 0.03036205, 1, 0, 0, 1, 1,
0.5556406, 1.576586, -0.7129603, 1, 0, 0, 1, 1,
0.5579034, 1.191436, 1.65268, 1, 0, 0, 1, 1,
0.5582845, 1.429897, -0.6198095, 1, 0, 0, 1, 1,
0.5624893, -0.179154, -0.4620057, 1, 0, 0, 1, 1,
0.5678638, -0.7615672, 3.011156, 0, 0, 0, 1, 1,
0.5718538, -2.050355, 3.197024, 0, 0, 0, 1, 1,
0.5792332, -0.5707248, 3.79909, 0, 0, 0, 1, 1,
0.5805838, 0.2416795, 0.8461913, 0, 0, 0, 1, 1,
0.5837461, 0.8357471, 0.1683846, 0, 0, 0, 1, 1,
0.5989532, -2.213183, 2.922714, 0, 0, 0, 1, 1,
0.6012645, 0.2442358, 0.9752288, 0, 0, 0, 1, 1,
0.6017841, -1.651363, 1.998451, 1, 1, 1, 1, 1,
0.6039518, 0.5197254, -0.9109821, 1, 1, 1, 1, 1,
0.6054558, -0.3019952, 1.786896, 1, 1, 1, 1, 1,
0.6139632, -1.353056, 1.470795, 1, 1, 1, 1, 1,
0.6147708, 1.177776, -0.3965046, 1, 1, 1, 1, 1,
0.6162046, 0.3867302, 2.35877, 1, 1, 1, 1, 1,
0.6171368, -0.113753, 1.670237, 1, 1, 1, 1, 1,
0.6215533, 0.2110024, 1.620279, 1, 1, 1, 1, 1,
0.6361128, -0.468892, 1.918157, 1, 1, 1, 1, 1,
0.6382459, -0.3152916, 2.128463, 1, 1, 1, 1, 1,
0.6489643, 0.06738575, 1.49938, 1, 1, 1, 1, 1,
0.6540592, 0.7672318, 1.352421, 1, 1, 1, 1, 1,
0.6584281, 0.07483058, 1.056091, 1, 1, 1, 1, 1,
0.6587622, 1.496603, 1.919263, 1, 1, 1, 1, 1,
0.6610718, -1.581571, 3.056769, 1, 1, 1, 1, 1,
0.6643637, -2.213265, 3.748064, 0, 0, 1, 1, 1,
0.6657805, 0.792517, 1.393028, 1, 0, 0, 1, 1,
0.6669837, -0.7101735, 2.032961, 1, 0, 0, 1, 1,
0.6729214, -0.7968984, 2.838248, 1, 0, 0, 1, 1,
0.6731707, -0.7969736, 0.9854693, 1, 0, 0, 1, 1,
0.6793826, -1.37873, 4.079718, 1, 0, 0, 1, 1,
0.6805751, 0.2917796, -0.5860523, 0, 0, 0, 1, 1,
0.6814183, -1.894489, 1.980644, 0, 0, 0, 1, 1,
0.6826195, -0.7045425, 1.820065, 0, 0, 0, 1, 1,
0.6863074, 0.2120758, 1.028395, 0, 0, 0, 1, 1,
0.6866142, -0.3336951, 3.294812, 0, 0, 0, 1, 1,
0.6898299, -1.446755, 1.882021, 0, 0, 0, 1, 1,
0.6916003, -0.08683912, -0.2981184, 0, 0, 0, 1, 1,
0.6933548, 0.09987944, -0.2596762, 1, 1, 1, 1, 1,
0.6958022, 0.1142768, 1.826575, 1, 1, 1, 1, 1,
0.6965031, 0.9806349, 1.562806, 1, 1, 1, 1, 1,
0.6972749, 0.06070426, 2.108874, 1, 1, 1, 1, 1,
0.6995735, 0.3774697, 1.465704, 1, 1, 1, 1, 1,
0.7021416, 0.4303247, 2.7168, 1, 1, 1, 1, 1,
0.7027754, -0.7727403, 4.415519, 1, 1, 1, 1, 1,
0.7030323, -0.3308913, 1.975929, 1, 1, 1, 1, 1,
0.7054138, -0.4659435, 2.289513, 1, 1, 1, 1, 1,
0.7108731, -0.1737683, 2.105329, 1, 1, 1, 1, 1,
0.7120155, 0.5327685, 1.214866, 1, 1, 1, 1, 1,
0.7157268, -0.05083742, -0.9151588, 1, 1, 1, 1, 1,
0.7158025, 0.2524678, 1.40799, 1, 1, 1, 1, 1,
0.7197069, 1.364632, -0.03313669, 1, 1, 1, 1, 1,
0.7234134, 0.9919142, 1.286598, 1, 1, 1, 1, 1,
0.724593, -0.3026395, 0.2746887, 0, 0, 1, 1, 1,
0.7256201, 0.2227486, -0.6116561, 1, 0, 0, 1, 1,
0.7259881, 0.8599923, 1.131345, 1, 0, 0, 1, 1,
0.726849, -0.5472866, 3.368133, 1, 0, 0, 1, 1,
0.727667, 2.401797, 1.814406, 1, 0, 0, 1, 1,
0.7297588, 1.517954, 0.2464489, 1, 0, 0, 1, 1,
0.7302415, -0.6172895, 2.140365, 0, 0, 0, 1, 1,
0.7306038, -1.714808, 4.370639, 0, 0, 0, 1, 1,
0.7409471, -1.727019, 0.8592305, 0, 0, 0, 1, 1,
0.745496, -0.2460184, 2.034729, 0, 0, 0, 1, 1,
0.7458671, -0.2187815, 0.07124747, 0, 0, 0, 1, 1,
0.7460375, 0.5964085, 1.256937, 0, 0, 0, 1, 1,
0.7471186, 0.4045721, 0.5820014, 0, 0, 0, 1, 1,
0.7491507, 0.1872703, 1.148371, 1, 1, 1, 1, 1,
0.7663783, 0.9827533, 1.054419, 1, 1, 1, 1, 1,
0.7724335, 0.4946804, 1.867576, 1, 1, 1, 1, 1,
0.7735663, -0.7489453, 2.808366, 1, 1, 1, 1, 1,
0.783596, -0.475935, 3.038788, 1, 1, 1, 1, 1,
0.7848567, 1.208805, 1.572715, 1, 1, 1, 1, 1,
0.784881, -2.138715, 2.267871, 1, 1, 1, 1, 1,
0.7977509, -0.9719087, 2.738994, 1, 1, 1, 1, 1,
0.8003857, 0.6315864, 0.6801946, 1, 1, 1, 1, 1,
0.8004437, 1.364323, 1.298723, 1, 1, 1, 1, 1,
0.8027071, 0.02275741, 0.7733121, 1, 1, 1, 1, 1,
0.8057522, -0.1758789, 2.337726, 1, 1, 1, 1, 1,
0.80709, -0.3128762, 3.672126, 1, 1, 1, 1, 1,
0.8155717, 1.421446, 0.2744542, 1, 1, 1, 1, 1,
0.8230456, -0.3924375, 2.730494, 1, 1, 1, 1, 1,
0.8293045, -1.636161, 3.640584, 0, 0, 1, 1, 1,
0.8294408, 1.157495, 0.9237404, 1, 0, 0, 1, 1,
0.830193, -1.284807, 2.059141, 1, 0, 0, 1, 1,
0.8351137, -1.013463, 3.014696, 1, 0, 0, 1, 1,
0.8351868, -0.4012806, 1.527564, 1, 0, 0, 1, 1,
0.8371591, -0.4170295, 0.591257, 1, 0, 0, 1, 1,
0.8401748, 0.2553788, 2.64114, 0, 0, 0, 1, 1,
0.8408992, 0.4670545, -0.4118246, 0, 0, 0, 1, 1,
0.8447354, 1.311497, 1.561141, 0, 0, 0, 1, 1,
0.8457302, -0.009294193, -0.1275783, 0, 0, 0, 1, 1,
0.8543612, -0.1790526, 1.954173, 0, 0, 0, 1, 1,
0.8543755, 0.7208498, 0.8941519, 0, 0, 0, 1, 1,
0.8544193, 0.3369074, 2.706381, 0, 0, 0, 1, 1,
0.8551572, -1.183664, 0.822089, 1, 1, 1, 1, 1,
0.8551994, -0.1240769, 1.201242, 1, 1, 1, 1, 1,
0.8573306, -1.705427, 3.667261, 1, 1, 1, 1, 1,
0.8581942, -0.8781459, 4.244576, 1, 1, 1, 1, 1,
0.8586796, -0.2292074, 2.159435, 1, 1, 1, 1, 1,
0.8672307, -0.5439467, 3.081479, 1, 1, 1, 1, 1,
0.8687643, 0.04561557, 1.674533, 1, 1, 1, 1, 1,
0.8722847, -0.0597855, 0.8379391, 1, 1, 1, 1, 1,
0.8783683, 0.6212763, 0.3623961, 1, 1, 1, 1, 1,
0.8802833, -1.246916, 1.97878, 1, 1, 1, 1, 1,
0.8910136, 0.6282175, 1.054964, 1, 1, 1, 1, 1,
0.8935322, 0.3436262, 1.427745, 1, 1, 1, 1, 1,
0.8971214, 0.7302601, 2.283932, 1, 1, 1, 1, 1,
0.8974288, 0.2912495, 1.015626, 1, 1, 1, 1, 1,
0.8990688, -0.4492385, 3.399195, 1, 1, 1, 1, 1,
0.9008981, 1.044057, 1.149942, 0, 0, 1, 1, 1,
0.9028906, 0.410006, 2.183103, 1, 0, 0, 1, 1,
0.9060805, -0.1094445, 2.769474, 1, 0, 0, 1, 1,
0.9074928, -0.7491106, 4.495525, 1, 0, 0, 1, 1,
0.9086959, -1.312942, 2.947064, 1, 0, 0, 1, 1,
0.9096926, 0.1116504, 0.9132349, 1, 0, 0, 1, 1,
0.9154162, 0.3089518, 1.609681, 0, 0, 0, 1, 1,
0.9255913, 0.5604424, 0.7620176, 0, 0, 0, 1, 1,
0.9323612, 0.1635227, -0.1096015, 0, 0, 0, 1, 1,
0.9336639, 0.7139063, 2.246719, 0, 0, 0, 1, 1,
0.9408959, -0.8276962, 3.058415, 0, 0, 0, 1, 1,
0.9411564, -1.121292, 3.908437, 0, 0, 0, 1, 1,
0.9428197, 0.8090959, -0.3141314, 0, 0, 0, 1, 1,
0.9456599, -1.008205, 1.197993, 1, 1, 1, 1, 1,
0.9486844, -0.1566299, 1.202402, 1, 1, 1, 1, 1,
0.9604995, 1.044206, 0.8167691, 1, 1, 1, 1, 1,
0.9650043, -1.102384, 0.845594, 1, 1, 1, 1, 1,
0.9685221, 0.2825447, 0.1615525, 1, 1, 1, 1, 1,
0.9709517, 1.860925, 0.6834127, 1, 1, 1, 1, 1,
0.9728609, -2.560156, 2.12858, 1, 1, 1, 1, 1,
0.9744549, 0.4648493, 0.9932989, 1, 1, 1, 1, 1,
0.9744903, 3.05665, -0.4624574, 1, 1, 1, 1, 1,
0.9790539, 0.9889981, -0.1417302, 1, 1, 1, 1, 1,
0.9795715, 0.8619508, 1.175701, 1, 1, 1, 1, 1,
0.9845361, -1.142606, 3.435528, 1, 1, 1, 1, 1,
0.9847707, -1.620028, 4.481086, 1, 1, 1, 1, 1,
0.9849721, 0.2548323, 3.701246, 1, 1, 1, 1, 1,
0.9851993, 0.5611997, 1.087178, 1, 1, 1, 1, 1,
0.9917766, 0.3549584, 2.727935, 0, 0, 1, 1, 1,
0.9984623, -0.03531846, 0.4243866, 1, 0, 0, 1, 1,
1.003818, 1.71119, 0.2050566, 1, 0, 0, 1, 1,
1.005044, 0.5321525, -0.2068747, 1, 0, 0, 1, 1,
1.008264, 0.5988612, 1.517082, 1, 0, 0, 1, 1,
1.01133, -0.5621708, 1.700851, 1, 0, 0, 1, 1,
1.013604, 0.6557826, 1.200668, 0, 0, 0, 1, 1,
1.016076, 1.646883, 0.4558859, 0, 0, 0, 1, 1,
1.01673, -0.6256738, 1.762751, 0, 0, 0, 1, 1,
1.024815, -0.1200637, 0.6640182, 0, 0, 0, 1, 1,
1.034837, 1.601739, 0.688296, 0, 0, 0, 1, 1,
1.035371, -0.8154157, 1.093963, 0, 0, 0, 1, 1,
1.050193, 0.5857729, 1.417868, 0, 0, 0, 1, 1,
1.051672, -0.5013992, -0.17047, 1, 1, 1, 1, 1,
1.052831, -1.729764, 3.376866, 1, 1, 1, 1, 1,
1.053995, 0.8779982, 0.1809072, 1, 1, 1, 1, 1,
1.056363, 2.583443, -0.5439113, 1, 1, 1, 1, 1,
1.057348, -0.3798045, -0.4924319, 1, 1, 1, 1, 1,
1.061962, -0.9460523, 2.055209, 1, 1, 1, 1, 1,
1.075038, 1.150041, 0.8660818, 1, 1, 1, 1, 1,
1.076595, 0.6946929, -0.6951545, 1, 1, 1, 1, 1,
1.07988, 1.036351, 1.217536, 1, 1, 1, 1, 1,
1.083871, -0.2643842, 1.312185, 1, 1, 1, 1, 1,
1.087368, -0.8579413, 1.420633, 1, 1, 1, 1, 1,
1.098969, 0.9200073, 1.065581, 1, 1, 1, 1, 1,
1.1041, -0.5516977, 4.20753, 1, 1, 1, 1, 1,
1.105916, -1.228876, 1.446916, 1, 1, 1, 1, 1,
1.107564, -0.9276873, 1.641922, 1, 1, 1, 1, 1,
1.112146, 0.03589666, 1.288082, 0, 0, 1, 1, 1,
1.11608, -2.584596, 2.818511, 1, 0, 0, 1, 1,
1.117871, -0.2437127, 2.674381, 1, 0, 0, 1, 1,
1.134221, -2.473421, 1.629774, 1, 0, 0, 1, 1,
1.13527, -0.5473437, 3.665061, 1, 0, 0, 1, 1,
1.138379, -1.52233, 1.935447, 1, 0, 0, 1, 1,
1.141915, -0.7025307, 3.314608, 0, 0, 0, 1, 1,
1.147814, -0.4526908, 0.5190607, 0, 0, 0, 1, 1,
1.150275, 1.554093, 1.438064, 0, 0, 0, 1, 1,
1.151027, -2.744776, 3.429756, 0, 0, 0, 1, 1,
1.158071, 1.845196, -0.8439968, 0, 0, 0, 1, 1,
1.15883, -1.170388, 4.491403, 0, 0, 0, 1, 1,
1.159465, -0.2801021, 2.482358, 0, 0, 0, 1, 1,
1.177641, 0.108859, 1.592383, 1, 1, 1, 1, 1,
1.183827, 1.62819, -0.007621615, 1, 1, 1, 1, 1,
1.184181, 0.01894718, 2.092151, 1, 1, 1, 1, 1,
1.191362, 1.092215, -0.2566034, 1, 1, 1, 1, 1,
1.207357, 1.572687, 0.5972977, 1, 1, 1, 1, 1,
1.243222, -1.835361, 2.107774, 1, 1, 1, 1, 1,
1.246171, -1.921623, 1.835581, 1, 1, 1, 1, 1,
1.248054, 0.2377397, 1.880195, 1, 1, 1, 1, 1,
1.254318, 0.4796388, 2.077075, 1, 1, 1, 1, 1,
1.264544, -1.352032, 2.590496, 1, 1, 1, 1, 1,
1.276291, -1.88363, 2.326943, 1, 1, 1, 1, 1,
1.279277, -0.363042, 2.784077, 1, 1, 1, 1, 1,
1.286848, 0.8033761, 1.983294, 1, 1, 1, 1, 1,
1.299173, 0.194064, -0.1712652, 1, 1, 1, 1, 1,
1.29968, 0.6100355, 0.9926787, 1, 1, 1, 1, 1,
1.299915, -0.5706148, 1.053002, 0, 0, 1, 1, 1,
1.306913, 1.445067, 0.2363767, 1, 0, 0, 1, 1,
1.317533, 0.4999993, 1.39153, 1, 0, 0, 1, 1,
1.324158, 0.1182658, 1.809139, 1, 0, 0, 1, 1,
1.327705, -0.4032461, 3.706757, 1, 0, 0, 1, 1,
1.328613, 0.5025735, 0.4513079, 1, 0, 0, 1, 1,
1.335697, 0.2562505, 1.271488, 0, 0, 0, 1, 1,
1.337913, 0.5489205, 1.876409, 0, 0, 0, 1, 1,
1.344586, 0.9451892, 3.394397, 0, 0, 0, 1, 1,
1.345711, -0.1919837, 2.514675, 0, 0, 0, 1, 1,
1.363638, -1.14087, 2.629138, 0, 0, 0, 1, 1,
1.373885, 0.06308886, 0.3236435, 0, 0, 0, 1, 1,
1.376396, -0.1575841, 1.04014, 0, 0, 0, 1, 1,
1.379539, -0.3258477, 2.35114, 1, 1, 1, 1, 1,
1.379733, 0.7275854, 1.567475, 1, 1, 1, 1, 1,
1.399529, 1.121236, 1.605654, 1, 1, 1, 1, 1,
1.401942, -0.4097433, 1.116673, 1, 1, 1, 1, 1,
1.417195, 0.6999938, 0.5383635, 1, 1, 1, 1, 1,
1.438228, -0.7119583, 2.149321, 1, 1, 1, 1, 1,
1.438997, 0.9637612, -0.6360862, 1, 1, 1, 1, 1,
1.440492, -0.3780537, 1.358348, 1, 1, 1, 1, 1,
1.440666, 3.499408, 0.1154905, 1, 1, 1, 1, 1,
1.442842, 0.3303133, 2.890626, 1, 1, 1, 1, 1,
1.45046, -1.368373, 2.174467, 1, 1, 1, 1, 1,
1.452378, 1.004797, -0.9198653, 1, 1, 1, 1, 1,
1.453008, -0.3871694, 1.880849, 1, 1, 1, 1, 1,
1.458647, -1.252123, 1.171824, 1, 1, 1, 1, 1,
1.459311, 1.103206, -0.9962498, 1, 1, 1, 1, 1,
1.461222, -1.111994, 1.308578, 0, 0, 1, 1, 1,
1.464675, -0.04184129, -1.569584, 1, 0, 0, 1, 1,
1.46773, -1.145938, 0.8349339, 1, 0, 0, 1, 1,
1.468942, -1.074922, 2.431443, 1, 0, 0, 1, 1,
1.482299, -1.381133, 4.951436, 1, 0, 0, 1, 1,
1.485331, -0.1449237, 1.479344, 1, 0, 0, 1, 1,
1.489794, -1.583099, 3.584523, 0, 0, 0, 1, 1,
1.501508, 1.489452, 1.16033, 0, 0, 0, 1, 1,
1.50886, -0.5887824, 2.895683, 0, 0, 0, 1, 1,
1.538491, -0.7386147, 1.73537, 0, 0, 0, 1, 1,
1.543, 0.7972039, 2.300228, 0, 0, 0, 1, 1,
1.556463, -0.5882592, 1.540179, 0, 0, 0, 1, 1,
1.567481, -0.06748788, 0.5331414, 0, 0, 0, 1, 1,
1.571945, 0.2246812, 1.456553, 1, 1, 1, 1, 1,
1.572001, 1.441358, -0.062833, 1, 1, 1, 1, 1,
1.580012, -0.849481, 2.043405, 1, 1, 1, 1, 1,
1.581852, 0.1474827, 3.285373, 1, 1, 1, 1, 1,
1.585283, -0.07804047, 0.1793076, 1, 1, 1, 1, 1,
1.589134, 1.485395, 2.89281, 1, 1, 1, 1, 1,
1.589872, 0.5931827, 0.5521604, 1, 1, 1, 1, 1,
1.599968, 1.537398, 1.003985, 1, 1, 1, 1, 1,
1.606477, 0.1267996, 1.956858, 1, 1, 1, 1, 1,
1.609196, -0.2985964, 1.871489, 1, 1, 1, 1, 1,
1.628395, 0.4707235, 1.830492, 1, 1, 1, 1, 1,
1.630149, 1.022791, 1.375836, 1, 1, 1, 1, 1,
1.632692, -2.356252, 2.865986, 1, 1, 1, 1, 1,
1.682291, 0.3729605, 1.200389, 1, 1, 1, 1, 1,
1.691409, 0.3190834, 1.341899, 1, 1, 1, 1, 1,
1.69363, 0.7318154, 3.080942, 0, 0, 1, 1, 1,
1.703809, 0.7705145, 2.986341, 1, 0, 0, 1, 1,
1.716359, 0.145348, 1.67365, 1, 0, 0, 1, 1,
1.720656, -0.5978654, 0.4441, 1, 0, 0, 1, 1,
1.721434, 0.4426585, 2.867689, 1, 0, 0, 1, 1,
1.730195, 0.2163304, 0.3569704, 1, 0, 0, 1, 1,
1.731188, 0.9477525, 3.151866, 0, 0, 0, 1, 1,
1.739215, -0.884162, 2.98933, 0, 0, 0, 1, 1,
1.752387, -1.996685, 3.082443, 0, 0, 0, 1, 1,
1.756651, -0.01797331, 1.698865, 0, 0, 0, 1, 1,
1.770172, 0.4004956, 1.537293, 0, 0, 0, 1, 1,
1.779498, 1.17798, 2.500508, 0, 0, 0, 1, 1,
1.783635, 1.161043, 1.98411, 0, 0, 0, 1, 1,
1.785482, 0.2726374, 1.511064, 1, 1, 1, 1, 1,
1.800329, -1.769768, 1.88916, 1, 1, 1, 1, 1,
1.803492, 1.463342, 1.381008, 1, 1, 1, 1, 1,
1.846142, 0.6595602, 1.849373, 1, 1, 1, 1, 1,
1.859061, -0.4318733, 2.539195, 1, 1, 1, 1, 1,
1.86349, 1.877352, -0.1666855, 1, 1, 1, 1, 1,
1.864686, -0.6450633, 2.266008, 1, 1, 1, 1, 1,
1.873597, -0.9964572, 2.492083, 1, 1, 1, 1, 1,
1.881341, 0.859912, 0.1058521, 1, 1, 1, 1, 1,
1.881362, -0.3861355, 2.149326, 1, 1, 1, 1, 1,
1.920373, -0.6788827, 2.274643, 1, 1, 1, 1, 1,
1.957031, 0.7134784, 1.326784, 1, 1, 1, 1, 1,
2.00462, -1.0233, 4.860918, 1, 1, 1, 1, 1,
2.030677, 0.2151391, 1.617729, 1, 1, 1, 1, 1,
2.034167, 1.463179, 0.5045331, 1, 1, 1, 1, 1,
2.040066, 0.5531766, 1.928427, 0, 0, 1, 1, 1,
2.053052, -0.8202262, 2.738998, 1, 0, 0, 1, 1,
2.06174, 0.7189248, -0.3844016, 1, 0, 0, 1, 1,
2.068892, 0.9217772, -0.01231277, 1, 0, 0, 1, 1,
2.092958, -0.6553735, 2.178929, 1, 0, 0, 1, 1,
2.115544, -0.8419812, 2.11622, 1, 0, 0, 1, 1,
2.194746, 1.749671, -0.190951, 0, 0, 0, 1, 1,
2.229883, -0.673687, 1.469895, 0, 0, 0, 1, 1,
2.245653, -1.860586, 3.37273, 0, 0, 0, 1, 1,
2.25446, 1.767385, -0.04549947, 0, 0, 0, 1, 1,
2.412693, -0.6027241, 1.522644, 0, 0, 0, 1, 1,
2.420905, 1.221454, 0.9625512, 0, 0, 0, 1, 1,
2.497998, -0.7321286, 1.97327, 0, 0, 0, 1, 1,
2.524136, 1.151584, 1.372477, 1, 1, 1, 1, 1,
2.580391, -1.675644, 2.812327, 1, 1, 1, 1, 1,
2.749274, -0.362345, 2.604921, 1, 1, 1, 1, 1,
2.802646, 1.271657, 2.650234, 1, 1, 1, 1, 1,
2.836591, 0.1575397, 1.464578, 1, 1, 1, 1, 1,
2.88822, -1.212571, 1.698748, 1, 1, 1, 1, 1,
3.318685, -0.09347422, 3.843228, 1, 1, 1, 1, 1
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
var radius = 9.82221;
var distance = 34.5001;
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
mvMatrix.translate( -0.1764197, 0.009282589, 0.4138281 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.5001);
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
