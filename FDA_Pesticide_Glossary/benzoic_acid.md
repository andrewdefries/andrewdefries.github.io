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
-3.552016, -0.7893629, -2.83617, 1, 0, 0, 1,
-2.807739, -0.9124023, -2.466689, 1, 0.007843138, 0, 1,
-2.681407, -1.16725, -1.359333, 1, 0.01176471, 0, 1,
-2.67603, 0.2170126, -2.462758, 1, 0.01960784, 0, 1,
-2.666544, 1.180533, 0.2749848, 1, 0.02352941, 0, 1,
-2.571275, 0.3208571, -2.588104, 1, 0.03137255, 0, 1,
-2.517061, -0.356546, 1.328801, 1, 0.03529412, 0, 1,
-2.507563, 0.1734123, -0.5527284, 1, 0.04313726, 0, 1,
-2.501462, 0.4524135, -2.825104, 1, 0.04705882, 0, 1,
-2.446877, 0.7223141, -1.294735, 1, 0.05490196, 0, 1,
-2.41064, 0.1241885, -2.528837, 1, 0.05882353, 0, 1,
-2.406328, -0.6436289, -2.953809, 1, 0.06666667, 0, 1,
-2.372638, -0.7787723, -2.161275, 1, 0.07058824, 0, 1,
-2.336013, 1.245955, -0.1949937, 1, 0.07843138, 0, 1,
-2.324486, 0.9992201, -2.473356, 1, 0.08235294, 0, 1,
-2.282112, 1.386245, -0.1924821, 1, 0.09019608, 0, 1,
-2.268701, -0.1417673, -1.296055, 1, 0.09411765, 0, 1,
-2.254717, 3.401869, 0.5424176, 1, 0.1019608, 0, 1,
-2.151165, -0.7509443, 0.1599137, 1, 0.1098039, 0, 1,
-2.146445, -1.102283, -2.946552, 1, 0.1137255, 0, 1,
-2.098128, 1.270227, -1.671373, 1, 0.1215686, 0, 1,
-2.092562, 1.288802, -0.06264007, 1, 0.1254902, 0, 1,
-2.091758, 0.388336, -1.361419, 1, 0.1333333, 0, 1,
-2.071194, 0.9422473, -2.086113, 1, 0.1372549, 0, 1,
-2.070644, -0.1450468, -2.216964, 1, 0.145098, 0, 1,
-2.069479, -0.1847329, -1.585416, 1, 0.1490196, 0, 1,
-2.017568, 1.619605, 0.8163384, 1, 0.1568628, 0, 1,
-2.007476, -0.7592306, -0.351794, 1, 0.1607843, 0, 1,
-1.998941, -0.09964208, -3.70726, 1, 0.1686275, 0, 1,
-1.994531, 0.3103444, -1.531019, 1, 0.172549, 0, 1,
-1.952403, 2.20459, 1.069404, 1, 0.1803922, 0, 1,
-1.927339, -1.93482, -2.885481, 1, 0.1843137, 0, 1,
-1.909423, -1.253163, -4.579952, 1, 0.1921569, 0, 1,
-1.877354, 0.7177436, -1.947851, 1, 0.1960784, 0, 1,
-1.860123, -1.096017, -2.950317, 1, 0.2039216, 0, 1,
-1.842282, -1.823699, -3.466149, 1, 0.2117647, 0, 1,
-1.835038, -0.07601958, -1.043383, 1, 0.2156863, 0, 1,
-1.828094, 0.1731979, -2.593939, 1, 0.2235294, 0, 1,
-1.819445, -0.5547836, -1.170105, 1, 0.227451, 0, 1,
-1.81534, 1.294714, -1.476973, 1, 0.2352941, 0, 1,
-1.815042, 0.05620014, -2.20205, 1, 0.2392157, 0, 1,
-1.801878, 0.005750046, -1.393071, 1, 0.2470588, 0, 1,
-1.785434, -1.486927, -2.355333, 1, 0.2509804, 0, 1,
-1.775783, -0.2422933, -1.084269, 1, 0.2588235, 0, 1,
-1.752756, 2.492857, -0.7077405, 1, 0.2627451, 0, 1,
-1.749633, 1.212122, -0.4564453, 1, 0.2705882, 0, 1,
-1.743301, 0.6993551, -0.9832022, 1, 0.2745098, 0, 1,
-1.733221, 0.3109379, -0.19262, 1, 0.282353, 0, 1,
-1.732124, -1.920133, -0.08477042, 1, 0.2862745, 0, 1,
-1.727061, 0.5027112, -1.004132, 1, 0.2941177, 0, 1,
-1.724606, 0.06887389, -0.5868787, 1, 0.3019608, 0, 1,
-1.718238, 0.395517, -2.291403, 1, 0.3058824, 0, 1,
-1.715877, 1.446918, -1.129883, 1, 0.3137255, 0, 1,
-1.708059, -0.5392868, -0.485602, 1, 0.3176471, 0, 1,
-1.700724, -0.4476275, -2.44425, 1, 0.3254902, 0, 1,
-1.683385, -0.07256271, -3.176341, 1, 0.3294118, 0, 1,
-1.682682, 1.286889, -1.613029, 1, 0.3372549, 0, 1,
-1.681694, -0.4503109, -2.095993, 1, 0.3411765, 0, 1,
-1.680496, 1.002084, -1.684042, 1, 0.3490196, 0, 1,
-1.660541, 1.310118, 0.71525, 1, 0.3529412, 0, 1,
-1.656546, -1.32966, -3.673626, 1, 0.3607843, 0, 1,
-1.645005, 0.07672449, -1.239868, 1, 0.3647059, 0, 1,
-1.637972, -0.7307624, -1.717954, 1, 0.372549, 0, 1,
-1.612949, 0.4092917, -1.301119, 1, 0.3764706, 0, 1,
-1.582122, -0.04138478, -2.250046, 1, 0.3843137, 0, 1,
-1.578217, 0.5374767, -2.702725, 1, 0.3882353, 0, 1,
-1.554061, 0.5722917, -0.2402869, 1, 0.3960784, 0, 1,
-1.549509, 0.7540659, -0.7320973, 1, 0.4039216, 0, 1,
-1.54687, -1.033024, -0.6189425, 1, 0.4078431, 0, 1,
-1.541782, 0.1573727, -0.3429419, 1, 0.4156863, 0, 1,
-1.539327, -0.7050261, -1.086096, 1, 0.4196078, 0, 1,
-1.530248, -0.5360461, -1.85439, 1, 0.427451, 0, 1,
-1.525759, -0.8537137, -2.664461, 1, 0.4313726, 0, 1,
-1.518665, -0.0687348, -0.1391504, 1, 0.4392157, 0, 1,
-1.496027, 0.8840332, -0.4591437, 1, 0.4431373, 0, 1,
-1.490564, -0.5769699, -0.9661088, 1, 0.4509804, 0, 1,
-1.487421, 1.391752, -0.9554275, 1, 0.454902, 0, 1,
-1.48521, -0.5808878, -2.44155, 1, 0.4627451, 0, 1,
-1.455422, 1.060768, -0.6518082, 1, 0.4666667, 0, 1,
-1.436567, 1.369155, -0.823028, 1, 0.4745098, 0, 1,
-1.423304, -0.1329767, -1.378573, 1, 0.4784314, 0, 1,
-1.417914, 1.27043, -0.3952149, 1, 0.4862745, 0, 1,
-1.416618, 0.6580347, -1.013806, 1, 0.4901961, 0, 1,
-1.414372, 0.8829514, -0.2191032, 1, 0.4980392, 0, 1,
-1.409431, -1.206796, -3.375292, 1, 0.5058824, 0, 1,
-1.396453, -1.41981, -2.857308, 1, 0.509804, 0, 1,
-1.378151, 0.6888939, -0.9888567, 1, 0.5176471, 0, 1,
-1.374445, -0.02047056, -1.005173, 1, 0.5215687, 0, 1,
-1.365547, -1.006947, -2.310964, 1, 0.5294118, 0, 1,
-1.36486, 0.3446175, -2.173714, 1, 0.5333334, 0, 1,
-1.358301, 0.162478, -2.005734, 1, 0.5411765, 0, 1,
-1.353681, -1.699591, -2.883419, 1, 0.5450981, 0, 1,
-1.346769, 0.9380482, -0.987864, 1, 0.5529412, 0, 1,
-1.346653, 0.3157474, -0.7265412, 1, 0.5568628, 0, 1,
-1.343395, 0.3484365, -1.580669, 1, 0.5647059, 0, 1,
-1.342887, 1.668249, 0.3007843, 1, 0.5686275, 0, 1,
-1.342106, -0.4674525, -2.344872, 1, 0.5764706, 0, 1,
-1.337288, -1.33429, 0.2348717, 1, 0.5803922, 0, 1,
-1.335906, 1.544606, 0.2115071, 1, 0.5882353, 0, 1,
-1.332967, -0.1413498, -1.039971, 1, 0.5921569, 0, 1,
-1.327171, -0.2563906, -0.5655841, 1, 0.6, 0, 1,
-1.320025, 2.205865, -0.09663498, 1, 0.6078432, 0, 1,
-1.304762, -3.158235, -3.542845, 1, 0.6117647, 0, 1,
-1.302, -0.7959857, -2.131642, 1, 0.6196079, 0, 1,
-1.298622, -0.300032, -2.496053, 1, 0.6235294, 0, 1,
-1.293818, -1.407476, -3.222025, 1, 0.6313726, 0, 1,
-1.279986, 1.38, -0.3525052, 1, 0.6352941, 0, 1,
-1.279162, -0.1567256, -0.6223686, 1, 0.6431373, 0, 1,
-1.275951, 0.5598227, 0.06717316, 1, 0.6470588, 0, 1,
-1.27435, -0.671845, -1.384545, 1, 0.654902, 0, 1,
-1.273362, -0.733292, -1.805476, 1, 0.6588235, 0, 1,
-1.272799, -0.4926525, -0.2694887, 1, 0.6666667, 0, 1,
-1.264, 0.3751701, -0.8895772, 1, 0.6705883, 0, 1,
-1.255436, 0.3905964, -0.5222521, 1, 0.6784314, 0, 1,
-1.247167, 0.07376786, -0.9457245, 1, 0.682353, 0, 1,
-1.234428, 1.512985, -0.2528922, 1, 0.6901961, 0, 1,
-1.231196, 0.0316351, -0.7045925, 1, 0.6941177, 0, 1,
-1.229524, -2.556948, -1.826603, 1, 0.7019608, 0, 1,
-1.217008, 0.1576259, -0.4015303, 1, 0.7098039, 0, 1,
-1.208069, -0.4864413, -2.171725, 1, 0.7137255, 0, 1,
-1.200714, 1.16571, -0.00360843, 1, 0.7215686, 0, 1,
-1.198268, -1.157939, -1.812822, 1, 0.7254902, 0, 1,
-1.19284, 1.029542, -1.118718, 1, 0.7333333, 0, 1,
-1.184186, 1.170254, 0.02133696, 1, 0.7372549, 0, 1,
-1.183948, -0.03820249, -2.432783, 1, 0.7450981, 0, 1,
-1.183123, 1.738357, -0.800523, 1, 0.7490196, 0, 1,
-1.165486, -1.137911, -3.603927, 1, 0.7568628, 0, 1,
-1.163684, 1.051702, -0.2045396, 1, 0.7607843, 0, 1,
-1.144804, 0.1536693, -1.561058, 1, 0.7686275, 0, 1,
-1.141051, 0.6515078, -1.234341, 1, 0.772549, 0, 1,
-1.129597, 0.8389168, -0.3683048, 1, 0.7803922, 0, 1,
-1.127319, 1.837149, 0.1777821, 1, 0.7843137, 0, 1,
-1.123045, -0.4703352, -2.975417, 1, 0.7921569, 0, 1,
-1.12245, 0.6313434, -1.509778, 1, 0.7960784, 0, 1,
-1.120685, 0.1849298, -2.853568, 1, 0.8039216, 0, 1,
-1.120286, -1.207661, -1.850462, 1, 0.8117647, 0, 1,
-1.117366, -1.040376, -2.710228, 1, 0.8156863, 0, 1,
-1.113429, -0.5402312, -0.7146984, 1, 0.8235294, 0, 1,
-1.113093, -0.8335881, -2.404756, 1, 0.827451, 0, 1,
-1.11138, 0.4833349, -2.884005, 1, 0.8352941, 0, 1,
-1.107505, 1.758083, -1.789834, 1, 0.8392157, 0, 1,
-1.104557, 0.05309614, -0.9332357, 1, 0.8470588, 0, 1,
-1.095252, -0.01774838, -0.4102151, 1, 0.8509804, 0, 1,
-1.084322, -1.445073, -2.130773, 1, 0.8588235, 0, 1,
-1.081512, -3.382111, -3.962301, 1, 0.8627451, 0, 1,
-1.079521, -1.645742, -2.024132, 1, 0.8705882, 0, 1,
-1.076371, -0.7072485, -2.622275, 1, 0.8745098, 0, 1,
-1.07381, 1.3982, -0.5630208, 1, 0.8823529, 0, 1,
-1.069353, -0.9002423, -1.458633, 1, 0.8862745, 0, 1,
-1.069211, -0.2199965, -2.84978, 1, 0.8941177, 0, 1,
-1.067204, -0.831654, -2.856622, 1, 0.8980392, 0, 1,
-1.066639, -0.237321, -0.9498648, 1, 0.9058824, 0, 1,
-1.058833, -0.4550565, -2.791787, 1, 0.9137255, 0, 1,
-1.054979, -1.355955, -2.087878, 1, 0.9176471, 0, 1,
-1.053269, -0.5887693, -2.899687, 1, 0.9254902, 0, 1,
-1.051265, -0.7085136, -2.712892, 1, 0.9294118, 0, 1,
-1.050254, 1.206041, 1.133662, 1, 0.9372549, 0, 1,
-1.042162, -0.01037358, -0.7253962, 1, 0.9411765, 0, 1,
-1.037863, -0.1766721, -2.590535, 1, 0.9490196, 0, 1,
-1.033795, -0.0990977, -3.03432, 1, 0.9529412, 0, 1,
-1.031237, 0.515722, -2.291035, 1, 0.9607843, 0, 1,
-1.025367, 0.09646272, -0.8484762, 1, 0.9647059, 0, 1,
-1.023648, -1.614893, -4.825949, 1, 0.972549, 0, 1,
-1.022772, -0.6128597, -2.809879, 1, 0.9764706, 0, 1,
-1.019516, -0.617137, -1.060576, 1, 0.9843137, 0, 1,
-1.018622, 0.9306338, -0.2122678, 1, 0.9882353, 0, 1,
-1.013841, 1.073336, -1.457341, 1, 0.9960784, 0, 1,
-1.010834, 0.7589852, -0.2021564, 0.9960784, 1, 0, 1,
-1.008214, 0.1588813, -3.324125, 0.9921569, 1, 0, 1,
-1.00492, -2.076397, -0.6681045, 0.9843137, 1, 0, 1,
-1.002476, 0.01325466, -1.769642, 0.9803922, 1, 0, 1,
-0.9987948, 0.8478958, -1.120191, 0.972549, 1, 0, 1,
-0.9944323, 0.05439792, -0.6197636, 0.9686275, 1, 0, 1,
-0.9918807, 0.8712665, -1.842992, 0.9607843, 1, 0, 1,
-0.9883343, -0.5165784, -2.518188, 0.9568627, 1, 0, 1,
-0.987128, 1.05625, 0.3210634, 0.9490196, 1, 0, 1,
-0.9864002, -0.03275137, -1.561693, 0.945098, 1, 0, 1,
-0.9843283, 2.298546, 0.1459348, 0.9372549, 1, 0, 1,
-0.9764063, 1.226661, 0.4026201, 0.9333333, 1, 0, 1,
-0.9647462, -1.373369, -2.823541, 0.9254902, 1, 0, 1,
-0.9624576, -1.622355, -2.11357, 0.9215686, 1, 0, 1,
-0.9519663, -0.2637004, -2.373829, 0.9137255, 1, 0, 1,
-0.9511186, 0.6954606, -1.475857, 0.9098039, 1, 0, 1,
-0.9469948, 1.249751, -1.33921, 0.9019608, 1, 0, 1,
-0.9427299, -0.2439028, -0.453235, 0.8941177, 1, 0, 1,
-0.9382559, 1.655054, -0.9558601, 0.8901961, 1, 0, 1,
-0.9275166, -1.940704, -1.390625, 0.8823529, 1, 0, 1,
-0.92658, -0.8791413, -2.049321, 0.8784314, 1, 0, 1,
-0.9200035, 1.261102, 1.134402, 0.8705882, 1, 0, 1,
-0.9136937, 0.2580689, -1.581715, 0.8666667, 1, 0, 1,
-0.912966, 0.04929517, -1.951516, 0.8588235, 1, 0, 1,
-0.9065133, 0.2483209, -0.3032691, 0.854902, 1, 0, 1,
-0.9064863, 0.4287223, 0.5301561, 0.8470588, 1, 0, 1,
-0.905396, -0.3140154, -1.570247, 0.8431373, 1, 0, 1,
-0.8994105, -1.200353, -1.487415, 0.8352941, 1, 0, 1,
-0.895843, -1.212759, -2.421509, 0.8313726, 1, 0, 1,
-0.8847516, 1.09883, 1.04215, 0.8235294, 1, 0, 1,
-0.8837297, 0.5302775, -0.59872, 0.8196079, 1, 0, 1,
-0.8782078, -0.1306095, -2.236385, 0.8117647, 1, 0, 1,
-0.8726543, 0.5723157, -1.490746, 0.8078431, 1, 0, 1,
-0.8677383, 1.374788, -0.5670836, 0.8, 1, 0, 1,
-0.8654895, 1.098027, -0.553521, 0.7921569, 1, 0, 1,
-0.8607207, 2.660585, -0.07602167, 0.7882353, 1, 0, 1,
-0.860665, 0.1525235, -1.625628, 0.7803922, 1, 0, 1,
-0.8591657, 0.9912519, 0.2388263, 0.7764706, 1, 0, 1,
-0.858164, 1.149314, 0.1548494, 0.7686275, 1, 0, 1,
-0.855342, -0.6472819, -2.503706, 0.7647059, 1, 0, 1,
-0.8549343, 0.2998258, -0.5006904, 0.7568628, 1, 0, 1,
-0.8497354, 1.147682, -1.228132, 0.7529412, 1, 0, 1,
-0.8486168, -0.5415308, -2.3719, 0.7450981, 1, 0, 1,
-0.8477514, -0.9174773, -1.973753, 0.7411765, 1, 0, 1,
-0.8447043, -1.561327, -4.034395, 0.7333333, 1, 0, 1,
-0.8435022, 0.9517972, -1.639496, 0.7294118, 1, 0, 1,
-0.8392414, 0.1047169, -1.48022, 0.7215686, 1, 0, 1,
-0.8364179, 1.362601, 0.4970186, 0.7176471, 1, 0, 1,
-0.823939, 0.9978506, -1.409977, 0.7098039, 1, 0, 1,
-0.8232412, -1.307056, -2.981833, 0.7058824, 1, 0, 1,
-0.8224056, 0.3629681, -1.813428, 0.6980392, 1, 0, 1,
-0.8188015, 0.6155195, -0.2497923, 0.6901961, 1, 0, 1,
-0.8169858, 1.547469, -0.6900122, 0.6862745, 1, 0, 1,
-0.815091, -1.823236, -3.533952, 0.6784314, 1, 0, 1,
-0.8109246, -1.368742, -4.11176, 0.6745098, 1, 0, 1,
-0.8008612, 1.06599, -0.1705167, 0.6666667, 1, 0, 1,
-0.7998707, -0.7625336, -1.474084, 0.6627451, 1, 0, 1,
-0.7994167, -0.4250068, -4.209775, 0.654902, 1, 0, 1,
-0.7988542, 1.406338, -0.720597, 0.6509804, 1, 0, 1,
-0.7786074, -1.442424, -2.3712, 0.6431373, 1, 0, 1,
-0.7758566, 0.5808235, -1.531319, 0.6392157, 1, 0, 1,
-0.7753681, -0.5544966, -0.1966634, 0.6313726, 1, 0, 1,
-0.771308, 0.140818, -1.715905, 0.627451, 1, 0, 1,
-0.7702125, 0.4232559, -0.7105138, 0.6196079, 1, 0, 1,
-0.7694164, -1.121688, -2.181211, 0.6156863, 1, 0, 1,
-0.7684747, -0.1299739, -1.776184, 0.6078432, 1, 0, 1,
-0.759222, 0.6104841, -1.506678, 0.6039216, 1, 0, 1,
-0.7565762, 0.307346, -1.96107, 0.5960785, 1, 0, 1,
-0.7533435, 1.650916, -0.8267652, 0.5882353, 1, 0, 1,
-0.7508456, -1.354647, -3.011172, 0.5843138, 1, 0, 1,
-0.7494708, 0.7458177, 1.859018, 0.5764706, 1, 0, 1,
-0.7352639, 2.016617, -1.009341, 0.572549, 1, 0, 1,
-0.7318013, 0.582384, -1.697088, 0.5647059, 1, 0, 1,
-0.7268238, -0.2282394, -2.083248, 0.5607843, 1, 0, 1,
-0.7261955, 0.02952648, -1.356812, 0.5529412, 1, 0, 1,
-0.7232108, 1.863036, 0.271319, 0.5490196, 1, 0, 1,
-0.7180252, 1.816213, -0.9031901, 0.5411765, 1, 0, 1,
-0.717145, 1.493105, 0.4898523, 0.5372549, 1, 0, 1,
-0.7129697, 1.598204, -0.5878102, 0.5294118, 1, 0, 1,
-0.7128648, 1.542169, 0.3023238, 0.5254902, 1, 0, 1,
-0.7027737, 2.202912, -0.3333543, 0.5176471, 1, 0, 1,
-0.6998742, -0.985718, -3.036593, 0.5137255, 1, 0, 1,
-0.696708, 0.4917648, -2.629805, 0.5058824, 1, 0, 1,
-0.6948946, 2.336553, -0.8903421, 0.5019608, 1, 0, 1,
-0.6915061, 0.2452109, -1.41978, 0.4941176, 1, 0, 1,
-0.6900102, -1.584332, -1.890981, 0.4862745, 1, 0, 1,
-0.6894075, 0.236154, -2.788841, 0.4823529, 1, 0, 1,
-0.6843791, 0.9680513, 2.449333, 0.4745098, 1, 0, 1,
-0.6842727, 0.350457, -0.03228709, 0.4705882, 1, 0, 1,
-0.6811104, -0.3636967, -2.624906, 0.4627451, 1, 0, 1,
-0.6791309, 1.633168, -0.4179891, 0.4588235, 1, 0, 1,
-0.6765771, -1.815797, -2.193633, 0.4509804, 1, 0, 1,
-0.6711501, -1.513353, -3.658476, 0.4470588, 1, 0, 1,
-0.6552818, -0.3229957, -1.145931, 0.4392157, 1, 0, 1,
-0.6552793, -1.280525, -2.119218, 0.4352941, 1, 0, 1,
-0.6552044, 0.5313717, -0.7557293, 0.427451, 1, 0, 1,
-0.6529225, 1.771303, -0.06894772, 0.4235294, 1, 0, 1,
-0.64654, -1.772752, -3.334882, 0.4156863, 1, 0, 1,
-0.644466, 0.9738813, 0.7666385, 0.4117647, 1, 0, 1,
-0.6416595, 1.538823, -1.004389, 0.4039216, 1, 0, 1,
-0.6411372, -0.03555844, -1.573388, 0.3960784, 1, 0, 1,
-0.6409364, 0.6024156, -0.8137637, 0.3921569, 1, 0, 1,
-0.6387326, 0.3577462, -0.2999763, 0.3843137, 1, 0, 1,
-0.6383943, -0.07426272, -3.993067, 0.3803922, 1, 0, 1,
-0.6371123, -2.289632, -2.682865, 0.372549, 1, 0, 1,
-0.6363059, 0.9524057, -0.3959275, 0.3686275, 1, 0, 1,
-0.6346443, 0.6282531, 1.279708, 0.3607843, 1, 0, 1,
-0.6344727, 0.9528758, 0.9319387, 0.3568628, 1, 0, 1,
-0.6323279, -1.178716, -3.101274, 0.3490196, 1, 0, 1,
-0.6308131, -0.4256291, -2.205686, 0.345098, 1, 0, 1,
-0.6303915, 1.533391, -1.003034, 0.3372549, 1, 0, 1,
-0.6272909, -0.1399143, -3.222999, 0.3333333, 1, 0, 1,
-0.619764, -0.7888683, -1.34884, 0.3254902, 1, 0, 1,
-0.6171549, -1.02558, -2.615331, 0.3215686, 1, 0, 1,
-0.615518, -2.28465, -2.40129, 0.3137255, 1, 0, 1,
-0.6153496, 0.03244497, -1.346042, 0.3098039, 1, 0, 1,
-0.6152102, 2.741015, -0.1795601, 0.3019608, 1, 0, 1,
-0.6107981, 0.7707804, -1.601376, 0.2941177, 1, 0, 1,
-0.6097155, 2.209154, -0.5952249, 0.2901961, 1, 0, 1,
-0.6030337, 0.07104873, -0.7881962, 0.282353, 1, 0, 1,
-0.6006377, 0.293778, 0.6088107, 0.2784314, 1, 0, 1,
-0.5975648, 0.5449616, -3.014646, 0.2705882, 1, 0, 1,
-0.5967532, 1.299676, -1.162737, 0.2666667, 1, 0, 1,
-0.5902213, 1.513143, -2.823408, 0.2588235, 1, 0, 1,
-0.5874028, 1.18905, -0.1061066, 0.254902, 1, 0, 1,
-0.5839135, -0.1449707, -2.990465, 0.2470588, 1, 0, 1,
-0.5794586, 0.9049944, -0.4742788, 0.2431373, 1, 0, 1,
-0.576189, 1.394076, -2.841822, 0.2352941, 1, 0, 1,
-0.5754486, -1.339596, -3.321099, 0.2313726, 1, 0, 1,
-0.5693519, 0.7119128, -0.6973884, 0.2235294, 1, 0, 1,
-0.5684022, -1.798627, -1.693776, 0.2196078, 1, 0, 1,
-0.5640042, 3.955399, -2.050285, 0.2117647, 1, 0, 1,
-0.5589485, 0.6031656, -0.04499522, 0.2078431, 1, 0, 1,
-0.5572465, 0.4430709, -1.202152, 0.2, 1, 0, 1,
-0.5474093, 1.782445, -0.6546836, 0.1921569, 1, 0, 1,
-0.5453842, 0.7845079, -0.93061, 0.1882353, 1, 0, 1,
-0.5451238, -0.444548, -1.367727, 0.1803922, 1, 0, 1,
-0.5383618, 0.610445, -0.8517796, 0.1764706, 1, 0, 1,
-0.5381956, -0.5639887, -1.859144, 0.1686275, 1, 0, 1,
-0.5375512, 0.200662, -1.303311, 0.1647059, 1, 0, 1,
-0.5369597, 0.3129279, -1.180269, 0.1568628, 1, 0, 1,
-0.5303467, 0.02265546, -1.731404, 0.1529412, 1, 0, 1,
-0.529669, -0.4996774, -3.824867, 0.145098, 1, 0, 1,
-0.5295911, -0.7379314, -3.087434, 0.1411765, 1, 0, 1,
-0.5283615, 0.2830604, -0.935884, 0.1333333, 1, 0, 1,
-0.5261234, 0.3857975, -1.769599, 0.1294118, 1, 0, 1,
-0.5210252, 0.09064742, -2.57835, 0.1215686, 1, 0, 1,
-0.519224, -0.1846822, -1.953009, 0.1176471, 1, 0, 1,
-0.517561, -0.7420047, -2.822033, 0.1098039, 1, 0, 1,
-0.5139859, 0.1263492, -0.7719322, 0.1058824, 1, 0, 1,
-0.5087271, -0.6352279, -1.639211, 0.09803922, 1, 0, 1,
-0.5086634, 1.510368, 0.8346366, 0.09019608, 1, 0, 1,
-0.5070139, 0.3665505, -1.282239, 0.08627451, 1, 0, 1,
-0.5038123, -0.3087972, -2.02959, 0.07843138, 1, 0, 1,
-0.5033655, 0.2941189, -2.663079, 0.07450981, 1, 0, 1,
-0.502665, 2.126173, 0.1494735, 0.06666667, 1, 0, 1,
-0.5009171, -1.450243, -2.484412, 0.0627451, 1, 0, 1,
-0.4988682, -0.01553896, -2.312507, 0.05490196, 1, 0, 1,
-0.49864, 2.348377, 1.123393, 0.05098039, 1, 0, 1,
-0.4951789, -0.3050434, -1.957869, 0.04313726, 1, 0, 1,
-0.4949961, 0.2580558, 1.596165, 0.03921569, 1, 0, 1,
-0.4914362, 1.740077, -1.152097, 0.03137255, 1, 0, 1,
-0.4882502, 2.717331, -0.4661495, 0.02745098, 1, 0, 1,
-0.4873736, 1.249759, -0.9820058, 0.01960784, 1, 0, 1,
-0.4859216, -0.9762191, -2.370137, 0.01568628, 1, 0, 1,
-0.4852242, -1.15279, -3.279156, 0.007843138, 1, 0, 1,
-0.4840999, 1.053105, -1.962056, 0.003921569, 1, 0, 1,
-0.482431, 1.80587, -0.03980439, 0, 1, 0.003921569, 1,
-0.4818394, -0.1138752, -0.7986072, 0, 1, 0.01176471, 1,
-0.4789304, 0.3984954, -0.914625, 0, 1, 0.01568628, 1,
-0.476446, -2.54731, -2.366267, 0, 1, 0.02352941, 1,
-0.4748339, -1.695565, -2.817383, 0, 1, 0.02745098, 1,
-0.4744973, 0.4464607, -0.1534662, 0, 1, 0.03529412, 1,
-0.4643499, -0.2366902, -0.7830555, 0, 1, 0.03921569, 1,
-0.4633124, 1.422228, -0.4549593, 0, 1, 0.04705882, 1,
-0.4558077, -0.08434014, -1.018618, 0, 1, 0.05098039, 1,
-0.4530973, 0.1890096, -0.3661985, 0, 1, 0.05882353, 1,
-0.4530404, 0.82039, -1.252891, 0, 1, 0.0627451, 1,
-0.4521884, 1.4565, -1.287565, 0, 1, 0.07058824, 1,
-0.4420441, 0.2466696, -0.6049853, 0, 1, 0.07450981, 1,
-0.4361199, -0.5319257, -2.857176, 0, 1, 0.08235294, 1,
-0.4355722, -0.6410991, -3.009907, 0, 1, 0.08627451, 1,
-0.4342983, 1.080735, 0.8040929, 0, 1, 0.09411765, 1,
-0.4332529, 1.732858, 0.4127719, 0, 1, 0.1019608, 1,
-0.4315935, 0.770263, -0.5773136, 0, 1, 0.1058824, 1,
-0.4276486, -0.6218431, -2.781706, 0, 1, 0.1137255, 1,
-0.4244789, -0.9804648, -2.033296, 0, 1, 0.1176471, 1,
-0.4239044, 0.465739, 0.08644519, 0, 1, 0.1254902, 1,
-0.4235594, 1.098018, -1.739992, 0, 1, 0.1294118, 1,
-0.4199443, 1.878045, 1.953768, 0, 1, 0.1372549, 1,
-0.4111604, -0.9738682, -3.496665, 0, 1, 0.1411765, 1,
-0.4096477, -0.100701, -2.206244, 0, 1, 0.1490196, 1,
-0.4068815, 1.183276, 0.1063578, 0, 1, 0.1529412, 1,
-0.4068116, -0.6269241, -2.676779, 0, 1, 0.1607843, 1,
-0.4032883, -0.002664844, -1.98331, 0, 1, 0.1647059, 1,
-0.4017303, 0.1490258, -0.1931587, 0, 1, 0.172549, 1,
-0.3967964, 2.065548, -0.1748259, 0, 1, 0.1764706, 1,
-0.3963198, -0.415994, -3.202623, 0, 1, 0.1843137, 1,
-0.3887854, -0.9223702, -3.49567, 0, 1, 0.1882353, 1,
-0.3870255, -1.292544, -2.390623, 0, 1, 0.1960784, 1,
-0.3858134, 0.287711, 0.2669728, 0, 1, 0.2039216, 1,
-0.3854234, -2.084073, -1.915842, 0, 1, 0.2078431, 1,
-0.3818419, -0.9794224, -2.256222, 0, 1, 0.2156863, 1,
-0.3815593, -0.1165028, -2.542889, 0, 1, 0.2196078, 1,
-0.3812384, -2.020907, -2.017337, 0, 1, 0.227451, 1,
-0.3801225, 1.238929, -0.03447386, 0, 1, 0.2313726, 1,
-0.3793881, 0.9887813, -1.203785, 0, 1, 0.2392157, 1,
-0.3785931, 1.794904, -0.9857565, 0, 1, 0.2431373, 1,
-0.3783862, 0.2805914, -3.407275, 0, 1, 0.2509804, 1,
-0.3767075, 1.300472, 0.01687252, 0, 1, 0.254902, 1,
-0.3684554, 0.8055257, 0.3431246, 0, 1, 0.2627451, 1,
-0.3681133, 0.04918964, -2.493848, 0, 1, 0.2666667, 1,
-0.3679295, -0.4092355, -2.36692, 0, 1, 0.2745098, 1,
-0.3645288, -0.2980724, -3.851684, 0, 1, 0.2784314, 1,
-0.3595791, -0.8131742, -0.1197322, 0, 1, 0.2862745, 1,
-0.35768, -0.710577, -2.47599, 0, 1, 0.2901961, 1,
-0.357082, 1.608501, 0.3227559, 0, 1, 0.2980392, 1,
-0.351947, 1.497762, 0.4072812, 0, 1, 0.3058824, 1,
-0.3491361, 0.4616604, -0.9382308, 0, 1, 0.3098039, 1,
-0.3473394, -1.387666, -1.933378, 0, 1, 0.3176471, 1,
-0.3461565, 0.8199021, -1.685972, 0, 1, 0.3215686, 1,
-0.3279482, 0.1822269, -2.028702, 0, 1, 0.3294118, 1,
-0.3253212, -1.646463, -4.131951, 0, 1, 0.3333333, 1,
-0.3240486, -0.3187723, -2.635238, 0, 1, 0.3411765, 1,
-0.3199533, -2.243719, -0.7079581, 0, 1, 0.345098, 1,
-0.3195631, 1.094052, -0.4304247, 0, 1, 0.3529412, 1,
-0.31515, 0.1851311, -1.76879, 0, 1, 0.3568628, 1,
-0.3147059, 0.4254534, -1.533472, 0, 1, 0.3647059, 1,
-0.3117279, 0.257484, -1.716514, 0, 1, 0.3686275, 1,
-0.3026825, -0.7180666, -4.11915, 0, 1, 0.3764706, 1,
-0.3014902, 1.390166, -0.1833774, 0, 1, 0.3803922, 1,
-0.2994615, -0.01663574, -2.879476, 0, 1, 0.3882353, 1,
-0.2978184, -0.1101024, -2.705136, 0, 1, 0.3921569, 1,
-0.2970007, 0.7068131, -0.2482983, 0, 1, 0.4, 1,
-0.2959999, 0.1392148, -1.699895, 0, 1, 0.4078431, 1,
-0.2930416, 0.7738424, -0.5754388, 0, 1, 0.4117647, 1,
-0.2925622, -0.7473426, -1.686159, 0, 1, 0.4196078, 1,
-0.2925103, -0.457351, -0.5616904, 0, 1, 0.4235294, 1,
-0.2899615, 1.442259, 1.089956, 0, 1, 0.4313726, 1,
-0.2879764, 0.5241764, 0.396382, 0, 1, 0.4352941, 1,
-0.2842161, -1.760566, -2.861791, 0, 1, 0.4431373, 1,
-0.2842038, -0.930738, -2.146307, 0, 1, 0.4470588, 1,
-0.2753438, -1.034788, -4.427495, 0, 1, 0.454902, 1,
-0.273355, -0.1113693, -1.304174, 0, 1, 0.4588235, 1,
-0.2678879, -1.474929, -2.593551, 0, 1, 0.4666667, 1,
-0.2633204, 1.345281, -0.07673038, 0, 1, 0.4705882, 1,
-0.2631774, -0.894227, -1.713473, 0, 1, 0.4784314, 1,
-0.2596498, -0.3829267, -3.994499, 0, 1, 0.4823529, 1,
-0.2533648, -0.03249954, -1.613563, 0, 1, 0.4901961, 1,
-0.2516063, -1.011138, -2.685386, 0, 1, 0.4941176, 1,
-0.2482811, 1.375451, -1.582363, 0, 1, 0.5019608, 1,
-0.2459479, 0.2586119, -1.834761, 0, 1, 0.509804, 1,
-0.2421197, 1.23624, -0.8744417, 0, 1, 0.5137255, 1,
-0.2324822, 0.9945363, 0.394712, 0, 1, 0.5215687, 1,
-0.2308264, -2.392892, -1.90992, 0, 1, 0.5254902, 1,
-0.2298669, -0.397731, -3.655435, 0, 1, 0.5333334, 1,
-0.2285151, 0.5773207, 0.1356285, 0, 1, 0.5372549, 1,
-0.2280684, -0.7368447, -0.8147174, 0, 1, 0.5450981, 1,
-0.2278087, 1.1015, -0.5134073, 0, 1, 0.5490196, 1,
-0.2212779, 0.7152194, -0.7464651, 0, 1, 0.5568628, 1,
-0.2208825, -0.5187923, -1.336143, 0, 1, 0.5607843, 1,
-0.2139219, 0.01681959, -2.670849, 0, 1, 0.5686275, 1,
-0.2046077, -0.9688194, -1.814869, 0, 1, 0.572549, 1,
-0.2023268, 0.08133846, -0.01207028, 0, 1, 0.5803922, 1,
-0.1981435, -0.2573055, -1.536132, 0, 1, 0.5843138, 1,
-0.1964029, 2.079634, 0.2396024, 0, 1, 0.5921569, 1,
-0.1891202, 1.60537, 2.059992, 0, 1, 0.5960785, 1,
-0.1844413, 0.3067941, 1.176671, 0, 1, 0.6039216, 1,
-0.1838302, 0.2551199, -1.28003, 0, 1, 0.6117647, 1,
-0.1828655, 0.580713, -1.652821, 0, 1, 0.6156863, 1,
-0.1779805, 0.1027377, -1.241088, 0, 1, 0.6235294, 1,
-0.1739576, -0.01093064, -0.9548324, 0, 1, 0.627451, 1,
-0.1735983, 0.8951805, 1.427769, 0, 1, 0.6352941, 1,
-0.1730444, 0.3305283, -0.7078553, 0, 1, 0.6392157, 1,
-0.1722752, -0.7205061, -3.632624, 0, 1, 0.6470588, 1,
-0.1697966, -0.6941579, -2.754383, 0, 1, 0.6509804, 1,
-0.1622121, -0.05581509, -1.752733, 0, 1, 0.6588235, 1,
-0.16003, -1.769705, -1.132003, 0, 1, 0.6627451, 1,
-0.1594046, 0.1031, -1.474829, 0, 1, 0.6705883, 1,
-0.1593429, 0.4765143, 1.277607, 0, 1, 0.6745098, 1,
-0.158206, 1.665425, 1.588896, 0, 1, 0.682353, 1,
-0.1528253, 0.1356945, -0.09290609, 0, 1, 0.6862745, 1,
-0.1502528, -0.09347387, -1.738292, 0, 1, 0.6941177, 1,
-0.1462496, 1.119936, 0.3480829, 0, 1, 0.7019608, 1,
-0.1450536, -0.1135247, -0.9895655, 0, 1, 0.7058824, 1,
-0.1448545, 0.8948266, 0.880684, 0, 1, 0.7137255, 1,
-0.1447868, -1.228421, -3.283314, 0, 1, 0.7176471, 1,
-0.1419005, -1.829693, -3.067203, 0, 1, 0.7254902, 1,
-0.1364544, 0.8708788, -0.2998361, 0, 1, 0.7294118, 1,
-0.1323895, 0.6095009, 0.3914971, 0, 1, 0.7372549, 1,
-0.1321746, -0.4681112, -3.466499, 0, 1, 0.7411765, 1,
-0.1316079, 1.184897, -0.841753, 0, 1, 0.7490196, 1,
-0.1312097, -0.6765325, -3.531838, 0, 1, 0.7529412, 1,
-0.1308303, 1.111867, -0.3682868, 0, 1, 0.7607843, 1,
-0.1299865, -1.537302, -4.013337, 0, 1, 0.7647059, 1,
-0.1276317, -0.6330279, -4.186843, 0, 1, 0.772549, 1,
-0.1267662, -0.8195347, -1.926217, 0, 1, 0.7764706, 1,
-0.1253104, 0.1489862, -1.118174, 0, 1, 0.7843137, 1,
-0.1225997, 0.4434122, -0.8656185, 0, 1, 0.7882353, 1,
-0.1176871, -0.5950533, -3.498422, 0, 1, 0.7960784, 1,
-0.1174523, 1.073422, -0.1026193, 0, 1, 0.8039216, 1,
-0.1162764, -0.09599517, -0.6529304, 0, 1, 0.8078431, 1,
-0.1125836, -0.3754578, -3.565383, 0, 1, 0.8156863, 1,
-0.1121026, -0.1546701, -3.972762, 0, 1, 0.8196079, 1,
-0.1098324, 0.6144192, 0.02961647, 0, 1, 0.827451, 1,
-0.1084535, 0.2095183, 0.6429693, 0, 1, 0.8313726, 1,
-0.1056907, 0.9210379, -1.008932, 0, 1, 0.8392157, 1,
-0.1018784, -0.7583477, -3.012065, 0, 1, 0.8431373, 1,
-0.09364663, 1.036854, -1.551656, 0, 1, 0.8509804, 1,
-0.09065054, -1.384704, -1.093905, 0, 1, 0.854902, 1,
-0.08653443, -0.4086282, -3.001516, 0, 1, 0.8627451, 1,
-0.08607955, -1.730154, -3.255938, 0, 1, 0.8666667, 1,
-0.08470117, 0.4112251, 0.7488116, 0, 1, 0.8745098, 1,
-0.08338957, 1.155557, 1.111049, 0, 1, 0.8784314, 1,
-0.08203997, 0.812965, -1.362715, 0, 1, 0.8862745, 1,
-0.07442325, 1.02525, -1.212204, 0, 1, 0.8901961, 1,
-0.07440925, -1.118253, -2.624277, 0, 1, 0.8980392, 1,
-0.06903311, -0.3820736, -3.22762, 0, 1, 0.9058824, 1,
-0.06292767, 1.100007, -0.7325427, 0, 1, 0.9098039, 1,
-0.0580378, 0.03658463, -0.7604676, 0, 1, 0.9176471, 1,
-0.05751695, -1.48916, -2.974532, 0, 1, 0.9215686, 1,
-0.05308236, -0.1984001, -1.52233, 0, 1, 0.9294118, 1,
-0.04655753, -2.42324, -4.118763, 0, 1, 0.9333333, 1,
-0.0460868, -0.9051502, -2.122362, 0, 1, 0.9411765, 1,
-0.04602002, 1.073854, 0.2506422, 0, 1, 0.945098, 1,
-0.04478805, -1.258362, -2.4224, 0, 1, 0.9529412, 1,
-0.03854313, -0.299483, -2.471348, 0, 1, 0.9568627, 1,
-0.03779358, 1.117552, 0.2011659, 0, 1, 0.9647059, 1,
-0.0348235, -1.060634, -3.599947, 0, 1, 0.9686275, 1,
-0.02678206, 0.4576422, 0.4149149, 0, 1, 0.9764706, 1,
-0.02538569, -0.9619706, -4.073665, 0, 1, 0.9803922, 1,
-0.02305602, -2.036856, -4.282334, 0, 1, 0.9882353, 1,
-0.02222511, 0.2437304, -0.773405, 0, 1, 0.9921569, 1,
-0.02199317, 0.2121395, 0.05209859, 0, 1, 1, 1,
-0.01976309, -0.7529015, -3.835122, 0, 0.9921569, 1, 1,
-0.01887533, -0.7258872, -5.050617, 0, 0.9882353, 1, 1,
-0.01881953, -0.4530536, -3.091189, 0, 0.9803922, 1, 1,
-0.01670981, 1.058259, -0.781147, 0, 0.9764706, 1, 1,
-0.01597849, -0.8222018, -2.720359, 0, 0.9686275, 1, 1,
-0.01460258, 0.0566352, -1.920808, 0, 0.9647059, 1, 1,
-0.01353912, -0.4855181, -2.085796, 0, 0.9568627, 1, 1,
-0.01172496, 0.2897741, -2.50831, 0, 0.9529412, 1, 1,
-0.0112039, 0.6073633, 2.011816, 0, 0.945098, 1, 1,
-0.009815629, 1.00475, -0.4607471, 0, 0.9411765, 1, 1,
-0.009455766, 0.435185, 0.9425988, 0, 0.9333333, 1, 1,
-0.007569423, -1.17048, -3.640755, 0, 0.9294118, 1, 1,
-0.006955143, -0.406935, -5.493398, 0, 0.9215686, 1, 1,
-0.003752285, -0.5244789, -2.736088, 0, 0.9176471, 1, 1,
-0.001970127, 0.3661733, 1.026425, 0, 0.9098039, 1, 1,
-0.00125192, -0.3787064, -4.231893, 0, 0.9058824, 1, 1,
0.0016505, 0.7882426, 0.4458699, 0, 0.8980392, 1, 1,
0.002867885, 0.2973123, 0.7412693, 0, 0.8901961, 1, 1,
0.00353398, -0.3824109, 4.124164, 0, 0.8862745, 1, 1,
0.005058951, 0.3285228, -0.1522177, 0, 0.8784314, 1, 1,
0.006674966, 0.8101974, 0.754076, 0, 0.8745098, 1, 1,
0.007262752, 0.743297, -0.5734949, 0, 0.8666667, 1, 1,
0.009070616, 1.174488, 0.8372657, 0, 0.8627451, 1, 1,
0.01634074, -0.6946983, 3.074928, 0, 0.854902, 1, 1,
0.025152, 1.947988, -0.9934523, 0, 0.8509804, 1, 1,
0.0271049, 0.7083403, 0.9641277, 0, 0.8431373, 1, 1,
0.03298995, 0.1499618, -0.4464176, 0, 0.8392157, 1, 1,
0.03315078, 0.8080456, -0.3389828, 0, 0.8313726, 1, 1,
0.03398916, -0.4040596, 2.884014, 0, 0.827451, 1, 1,
0.03548858, -0.0906181, 1.944301, 0, 0.8196079, 1, 1,
0.03649013, -0.4904114, 2.42464, 0, 0.8156863, 1, 1,
0.03805316, -0.1701474, 2.745832, 0, 0.8078431, 1, 1,
0.04239229, -2.463686, 2.419986, 0, 0.8039216, 1, 1,
0.04630243, -1.893204, 3.80409, 0, 0.7960784, 1, 1,
0.04632187, -0.861483, 4.343133, 0, 0.7882353, 1, 1,
0.04854714, 0.4906128, 1.049889, 0, 0.7843137, 1, 1,
0.05087153, 1.111148, -1.855121, 0, 0.7764706, 1, 1,
0.0520368, -1.704141, 2.325028, 0, 0.772549, 1, 1,
0.05229703, -0.03814092, 1.608528, 0, 0.7647059, 1, 1,
0.05416803, 0.3015061, 1.421967, 0, 0.7607843, 1, 1,
0.05460969, 0.8781014, 0.8569588, 0, 0.7529412, 1, 1,
0.05471569, 0.3339891, -0.4869741, 0, 0.7490196, 1, 1,
0.0571791, -0.7591739, 2.657825, 0, 0.7411765, 1, 1,
0.06285349, 1.55189, -1.451838, 0, 0.7372549, 1, 1,
0.06908846, 0.3337078, -0.02155048, 0, 0.7294118, 1, 1,
0.07088943, 2.075685, 0.608822, 0, 0.7254902, 1, 1,
0.07184432, -0.1731752, 1.944145, 0, 0.7176471, 1, 1,
0.07815209, 0.6833566, 1.095458, 0, 0.7137255, 1, 1,
0.07969305, 0.4187627, -0.2880826, 0, 0.7058824, 1, 1,
0.08124439, -0.5349274, 2.321047, 0, 0.6980392, 1, 1,
0.09405677, -1.041762, 1.552958, 0, 0.6941177, 1, 1,
0.09443586, 0.9720557, -1.909703, 0, 0.6862745, 1, 1,
0.09841366, -0.6213233, 4.299756, 0, 0.682353, 1, 1,
0.09915657, -0.4827422, 3.152695, 0, 0.6745098, 1, 1,
0.1016694, 2.073602, -0.3564307, 0, 0.6705883, 1, 1,
0.1022554, -0.01374897, 2.557811, 0, 0.6627451, 1, 1,
0.1029525, -1.279112, 4.375983, 0, 0.6588235, 1, 1,
0.1073784, 0.4531034, 0.9495085, 0, 0.6509804, 1, 1,
0.1100236, 1.188205, -0.6769681, 0, 0.6470588, 1, 1,
0.1103387, 1.537481, -2.676882, 0, 0.6392157, 1, 1,
0.1124785, -0.7543785, 1.129734, 0, 0.6352941, 1, 1,
0.1170548, -1.56347, 3.75088, 0, 0.627451, 1, 1,
0.1193557, 1.723634, 0.8907107, 0, 0.6235294, 1, 1,
0.1205041, -0.4006659, 3.369309, 0, 0.6156863, 1, 1,
0.1241004, -0.1147546, 2.533523, 0, 0.6117647, 1, 1,
0.1261684, -0.0108772, 1.195877, 0, 0.6039216, 1, 1,
0.128048, 0.0829316, 0.4400878, 0, 0.5960785, 1, 1,
0.1287887, 1.206366, 0.2589397, 0, 0.5921569, 1, 1,
0.1295742, 1.660643, -0.1573516, 0, 0.5843138, 1, 1,
0.1383432, 0.255303, -1.863703, 0, 0.5803922, 1, 1,
0.1393858, 0.2936046, 0.1198725, 0, 0.572549, 1, 1,
0.1395819, -0.6960758, 4.083629, 0, 0.5686275, 1, 1,
0.1411982, -2.271855, 2.112999, 0, 0.5607843, 1, 1,
0.1427816, -0.3248248, 2.80557, 0, 0.5568628, 1, 1,
0.1449073, 0.7973646, -0.3339913, 0, 0.5490196, 1, 1,
0.1479646, -0.007386495, 2.403506, 0, 0.5450981, 1, 1,
0.1498419, 1.802126, 0.2234846, 0, 0.5372549, 1, 1,
0.153079, 0.09009989, 0.5490874, 0, 0.5333334, 1, 1,
0.1555106, 0.5781495, -0.4736626, 0, 0.5254902, 1, 1,
0.1568726, -0.1430287, 3.507928, 0, 0.5215687, 1, 1,
0.1582001, -0.7750992, 1.210739, 0, 0.5137255, 1, 1,
0.1609856, 0.1013411, 0.9946465, 0, 0.509804, 1, 1,
0.1618726, 1.418889, 0.3470384, 0, 0.5019608, 1, 1,
0.1653761, -0.5405062, 2.297814, 0, 0.4941176, 1, 1,
0.1666322, -1.222512, 2.710354, 0, 0.4901961, 1, 1,
0.1677633, -2.100922, 3.264832, 0, 0.4823529, 1, 1,
0.1693629, 0.2281246, 0.7274248, 0, 0.4784314, 1, 1,
0.1754724, -0.5166559, 1.964144, 0, 0.4705882, 1, 1,
0.1761966, -0.6905704, 4.31982, 0, 0.4666667, 1, 1,
0.1768144, -1.302909, 3.60942, 0, 0.4588235, 1, 1,
0.1777917, -0.01508657, 1.577627, 0, 0.454902, 1, 1,
0.1851575, -0.307697, 2.862233, 0, 0.4470588, 1, 1,
0.1876373, 0.09826964, 3.181958, 0, 0.4431373, 1, 1,
0.187801, -1.816666, 2.698584, 0, 0.4352941, 1, 1,
0.189049, -0.816619, 3.359676, 0, 0.4313726, 1, 1,
0.1903276, 0.8986185, -1.028866, 0, 0.4235294, 1, 1,
0.1973602, -1.143108, 1.686535, 0, 0.4196078, 1, 1,
0.201089, -0.6170238, 3.512635, 0, 0.4117647, 1, 1,
0.2018981, -2.459665, 2.273053, 0, 0.4078431, 1, 1,
0.2045772, -1.822704, 2.945706, 0, 0.4, 1, 1,
0.2053594, -1.089767, 3.581362, 0, 0.3921569, 1, 1,
0.2163287, 0.8681781, -2.870986, 0, 0.3882353, 1, 1,
0.2163402, 1.083462, 0.4698464, 0, 0.3803922, 1, 1,
0.2227154, -0.8705897, 3.553199, 0, 0.3764706, 1, 1,
0.2229807, -1.375027, 0.08748933, 0, 0.3686275, 1, 1,
0.2344646, -0.05835781, 0.8976167, 0, 0.3647059, 1, 1,
0.2353031, 0.8671916, 0.2370334, 0, 0.3568628, 1, 1,
0.2356287, 0.4260855, -0.4024208, 0, 0.3529412, 1, 1,
0.2367087, -0.4797312, 3.885097, 0, 0.345098, 1, 1,
0.2370037, -0.0136112, -0.09375542, 0, 0.3411765, 1, 1,
0.2370352, 1.501441, 0.1381633, 0, 0.3333333, 1, 1,
0.2385702, -1.528527, 2.5905, 0, 0.3294118, 1, 1,
0.2389509, 0.1508184, 1.754781, 0, 0.3215686, 1, 1,
0.2416115, 2.463341, 0.423912, 0, 0.3176471, 1, 1,
0.2428768, 1.602585, 2.407034, 0, 0.3098039, 1, 1,
0.2437165, 1.618954, -0.2984546, 0, 0.3058824, 1, 1,
0.2471169, -0.4227798, 3.067609, 0, 0.2980392, 1, 1,
0.2504447, 0.02816566, 1.260294, 0, 0.2901961, 1, 1,
0.2524346, 0.005917581, 1.419978, 0, 0.2862745, 1, 1,
0.2550894, 0.05000741, 1.402081, 0, 0.2784314, 1, 1,
0.2607122, 0.4479827, -0.08313539, 0, 0.2745098, 1, 1,
0.2621317, 0.1793849, 1.795718, 0, 0.2666667, 1, 1,
0.2650199, -0.5961055, 2.82982, 0, 0.2627451, 1, 1,
0.265935, -1.335796, 3.221755, 0, 0.254902, 1, 1,
0.266821, -1.018464, 3.606783, 0, 0.2509804, 1, 1,
0.269441, 1.177871, 1.999343, 0, 0.2431373, 1, 1,
0.2704787, -0.457103, 1.125855, 0, 0.2392157, 1, 1,
0.270837, 1.217752, 0.8323729, 0, 0.2313726, 1, 1,
0.2720414, 0.01773694, 1.793734, 0, 0.227451, 1, 1,
0.272407, -0.8826404, 4.23127, 0, 0.2196078, 1, 1,
0.278349, 0.8475925, 1.464589, 0, 0.2156863, 1, 1,
0.2786793, 0.9482625, 0.4190322, 0, 0.2078431, 1, 1,
0.2801317, 1.869585, -0.9031399, 0, 0.2039216, 1, 1,
0.2804826, -1.071857, 2.879608, 0, 0.1960784, 1, 1,
0.28415, -1.838338, 3.307159, 0, 0.1882353, 1, 1,
0.2886382, 0.6646909, 2.648453, 0, 0.1843137, 1, 1,
0.2893689, 1.004891, 1.68271, 0, 0.1764706, 1, 1,
0.2940465, 0.05685481, 1.231164, 0, 0.172549, 1, 1,
0.296001, -0.3241335, 3.185474, 0, 0.1647059, 1, 1,
0.3010607, -1.347578, 1.671876, 0, 0.1607843, 1, 1,
0.3015062, -1.00957, 4.544517, 0, 0.1529412, 1, 1,
0.302026, 1.713276, 0.3644176, 0, 0.1490196, 1, 1,
0.3039041, 1.738997, 0.0118757, 0, 0.1411765, 1, 1,
0.3059258, 0.1305069, -0.6993085, 0, 0.1372549, 1, 1,
0.3108546, 2.621613, -0.126277, 0, 0.1294118, 1, 1,
0.3129385, 0.009926507, 0.8917584, 0, 0.1254902, 1, 1,
0.3167002, -1.701282, 2.595945, 0, 0.1176471, 1, 1,
0.3176422, 1.263635, 0.9536456, 0, 0.1137255, 1, 1,
0.3207114, 1.202877, -0.2033886, 0, 0.1058824, 1, 1,
0.3225598, -1.233309, 1.574142, 0, 0.09803922, 1, 1,
0.324464, 1.103372, 0.7139515, 0, 0.09411765, 1, 1,
0.327387, -0.5312428, 4.913301, 0, 0.08627451, 1, 1,
0.3280605, 0.1529351, 2.576861, 0, 0.08235294, 1, 1,
0.3291025, -0.4754427, 0.9016852, 0, 0.07450981, 1, 1,
0.3326723, 1.438551, -1.808951, 0, 0.07058824, 1, 1,
0.3327036, 0.2100944, 3.659427, 0, 0.0627451, 1, 1,
0.3329952, -0.9648754, 3.743448, 0, 0.05882353, 1, 1,
0.3410901, 0.5141336, -0.1866634, 0, 0.05098039, 1, 1,
0.3433901, 0.2625775, 0.08979263, 0, 0.04705882, 1, 1,
0.3442885, -0.1552846, 4.376342, 0, 0.03921569, 1, 1,
0.3469188, -0.2787564, 3.135674, 0, 0.03529412, 1, 1,
0.3478135, 0.4554179, -0.348284, 0, 0.02745098, 1, 1,
0.3514255, -2.494796, 3.51579, 0, 0.02352941, 1, 1,
0.352524, 0.2583538, 1.483638, 0, 0.01568628, 1, 1,
0.3588697, 0.059983, 1.079939, 0, 0.01176471, 1, 1,
0.3605949, 1.183374, -0.6697638, 0, 0.003921569, 1, 1,
0.361437, 1.945868, -0.6867896, 0.003921569, 0, 1, 1,
0.3638099, -0.4602129, 2.067925, 0.007843138, 0, 1, 1,
0.3666204, -1.214148, 0.9667374, 0.01568628, 0, 1, 1,
0.3698534, -0.310211, 1.255685, 0.01960784, 0, 1, 1,
0.3700121, -0.3526, 2.878128, 0.02745098, 0, 1, 1,
0.3729185, -1.513643, 2.776885, 0.03137255, 0, 1, 1,
0.3735661, 0.4094421, 1.536417, 0.03921569, 0, 1, 1,
0.3751318, 0.02585529, 0.7628276, 0.04313726, 0, 1, 1,
0.3757613, 0.2552221, 0.5212858, 0.05098039, 0, 1, 1,
0.3796856, 0.88994, -0.319258, 0.05490196, 0, 1, 1,
0.3803615, 0.6745513, 1.790713, 0.0627451, 0, 1, 1,
0.3811857, -2.38138, 4.725544, 0.06666667, 0, 1, 1,
0.3864508, -0.5587365, 1.006757, 0.07450981, 0, 1, 1,
0.3898783, -1.110744, 3.959332, 0.07843138, 0, 1, 1,
0.3946371, 0.1554762, 2.36605, 0.08627451, 0, 1, 1,
0.3972027, -0.6262178, 3.873553, 0.09019608, 0, 1, 1,
0.4010522, 1.550768, 0.4118364, 0.09803922, 0, 1, 1,
0.4013118, 1.365224, -0.2587921, 0.1058824, 0, 1, 1,
0.4029894, 1.342416, 0.6759814, 0.1098039, 0, 1, 1,
0.4033618, -1.339456, 2.764915, 0.1176471, 0, 1, 1,
0.4039031, 0.6886171, 0.8773665, 0.1215686, 0, 1, 1,
0.4042454, 1.128595, -0.4397471, 0.1294118, 0, 1, 1,
0.4105065, -0.310145, 2.28793, 0.1333333, 0, 1, 1,
0.4131529, -0.4189004, 3.049717, 0.1411765, 0, 1, 1,
0.417681, 1.046995, 1.365976, 0.145098, 0, 1, 1,
0.4196628, -0.5816985, 3.033589, 0.1529412, 0, 1, 1,
0.4247833, -1.080725, 2.907922, 0.1568628, 0, 1, 1,
0.4250373, 0.1156888, 0.7002381, 0.1647059, 0, 1, 1,
0.4281168, 0.8933986, 0.8171794, 0.1686275, 0, 1, 1,
0.4282114, 0.7330738, -0.3743125, 0.1764706, 0, 1, 1,
0.4320273, -0.3004961, 1.84858, 0.1803922, 0, 1, 1,
0.4328618, 0.6930405, -0.4748831, 0.1882353, 0, 1, 1,
0.4389639, -1.73008, 4.309717, 0.1921569, 0, 1, 1,
0.4406985, -0.563859, 3.548107, 0.2, 0, 1, 1,
0.4451805, -0.01800954, -1.142457, 0.2078431, 0, 1, 1,
0.4481196, 0.9808517, 0.1916479, 0.2117647, 0, 1, 1,
0.450076, 0.9828538, -1.645929, 0.2196078, 0, 1, 1,
0.4504678, 0.3285235, -0.2776169, 0.2235294, 0, 1, 1,
0.4528999, -0.6142358, 3.19774, 0.2313726, 0, 1, 1,
0.4536613, -1.002069, 3.635867, 0.2352941, 0, 1, 1,
0.4547764, -0.3764541, 2.583859, 0.2431373, 0, 1, 1,
0.4552118, -1.307577, 2.078839, 0.2470588, 0, 1, 1,
0.4589275, 0.7465604, -0.152966, 0.254902, 0, 1, 1,
0.4595772, 0.08897879, 0.3930634, 0.2588235, 0, 1, 1,
0.4642633, 0.01527977, 0.03703155, 0.2666667, 0, 1, 1,
0.469215, -1.022112, 2.590045, 0.2705882, 0, 1, 1,
0.4719463, 1.127945, -1.558147, 0.2784314, 0, 1, 1,
0.4727837, 0.8976637, 0.9135989, 0.282353, 0, 1, 1,
0.4729888, -0.487039, 4.498532, 0.2901961, 0, 1, 1,
0.4768468, -1.366703, 4.066928, 0.2941177, 0, 1, 1,
0.4792937, -1.057449, 1.532044, 0.3019608, 0, 1, 1,
0.4796699, 1.006403, -0.4145174, 0.3098039, 0, 1, 1,
0.485758, -0.7483873, 1.035575, 0.3137255, 0, 1, 1,
0.4857664, 1.122593, 1.299164, 0.3215686, 0, 1, 1,
0.4857773, -0.1854036, 2.484783, 0.3254902, 0, 1, 1,
0.4882763, -1.615711, 1.697037, 0.3333333, 0, 1, 1,
0.4997376, 2.187539, -0.4020591, 0.3372549, 0, 1, 1,
0.5016242, 1.116832, -2.355195, 0.345098, 0, 1, 1,
0.5020254, -0.9990238, 0.4098721, 0.3490196, 0, 1, 1,
0.5032978, 0.8006455, -0.9547544, 0.3568628, 0, 1, 1,
0.5043409, 0.615994, 0.7107454, 0.3607843, 0, 1, 1,
0.5119875, -1.169286, 2.291787, 0.3686275, 0, 1, 1,
0.5128119, 0.3016619, 1.047054, 0.372549, 0, 1, 1,
0.518106, 0.1008599, 0.2706851, 0.3803922, 0, 1, 1,
0.5182815, 0.9602903, 0.4500003, 0.3843137, 0, 1, 1,
0.5209924, 0.1646566, 2.839898, 0.3921569, 0, 1, 1,
0.5285143, -1.557925, 1.814262, 0.3960784, 0, 1, 1,
0.5326926, 1.811385, 0.4904853, 0.4039216, 0, 1, 1,
0.5390434, -0.4352285, 2.051358, 0.4117647, 0, 1, 1,
0.539265, 2.014516, 1.010854, 0.4156863, 0, 1, 1,
0.5602286, 0.3617579, 1.122222, 0.4235294, 0, 1, 1,
0.5734653, 0.4965919, 0.676669, 0.427451, 0, 1, 1,
0.5752707, -0.466435, 3.005858, 0.4352941, 0, 1, 1,
0.5812679, -0.9376214, 4.171012, 0.4392157, 0, 1, 1,
0.582235, 0.4345721, 0.9594685, 0.4470588, 0, 1, 1,
0.585153, 0.6336764, 0.6190407, 0.4509804, 0, 1, 1,
0.5855436, -0.9233379, 4.054533, 0.4588235, 0, 1, 1,
0.5863059, 0.2527908, 2.136316, 0.4627451, 0, 1, 1,
0.5912645, -0.2132823, 2.55711, 0.4705882, 0, 1, 1,
0.5938535, -0.5708729, 3.972127, 0.4745098, 0, 1, 1,
0.5951607, 1.513438, 0.8579701, 0.4823529, 0, 1, 1,
0.5956394, -0.7248479, 1.41873, 0.4862745, 0, 1, 1,
0.5973243, 0.9487957, -0.3640431, 0.4941176, 0, 1, 1,
0.601799, -0.1177661, 1.495786, 0.5019608, 0, 1, 1,
0.6067663, 0.007822813, 0.296433, 0.5058824, 0, 1, 1,
0.6119912, 0.7536066, 0.06780541, 0.5137255, 0, 1, 1,
0.6172588, -0.1488863, 1.011628, 0.5176471, 0, 1, 1,
0.6195225, 0.5803765, -0.9128661, 0.5254902, 0, 1, 1,
0.6203492, 0.5538162, 0.2607753, 0.5294118, 0, 1, 1,
0.6271297, -0.4149284, 1.386661, 0.5372549, 0, 1, 1,
0.632822, 0.2037339, -0.01521804, 0.5411765, 0, 1, 1,
0.6349438, -1.092459, 3.935875, 0.5490196, 0, 1, 1,
0.6448714, -0.2342677, -0.05459582, 0.5529412, 0, 1, 1,
0.651219, 0.3736103, 1.719972, 0.5607843, 0, 1, 1,
0.6555804, 0.7454481, 1.528071, 0.5647059, 0, 1, 1,
0.6559379, 1.827899, 0.7451571, 0.572549, 0, 1, 1,
0.6626558, -0.350648, 1.776566, 0.5764706, 0, 1, 1,
0.6717628, -2.994951, 3.328347, 0.5843138, 0, 1, 1,
0.6752456, -0.3680868, 1.359909, 0.5882353, 0, 1, 1,
0.675385, -1.150945, 2.546974, 0.5960785, 0, 1, 1,
0.6818163, -0.2285922, -0.03745405, 0.6039216, 0, 1, 1,
0.685516, -0.8759342, 3.736825, 0.6078432, 0, 1, 1,
0.6901265, -0.225191, 1.588327, 0.6156863, 0, 1, 1,
0.6936668, 1.094179, 0.5739058, 0.6196079, 0, 1, 1,
0.7069818, 0.130194, 2.543311, 0.627451, 0, 1, 1,
0.7203814, 0.6762568, 0.3286477, 0.6313726, 0, 1, 1,
0.722241, -1.088147, 2.383662, 0.6392157, 0, 1, 1,
0.7224845, -0.3462813, 1.629652, 0.6431373, 0, 1, 1,
0.7241791, 1.670856, 0.5376221, 0.6509804, 0, 1, 1,
0.7250361, 1.512586, 0.4954796, 0.654902, 0, 1, 1,
0.7252226, 1.189227, 2.074253, 0.6627451, 0, 1, 1,
0.726585, -0.4784891, 2.825541, 0.6666667, 0, 1, 1,
0.729438, 0.8379089, 1.729867, 0.6745098, 0, 1, 1,
0.7313818, 0.02025763, 1.691371, 0.6784314, 0, 1, 1,
0.7457042, -0.3364058, 1.409053, 0.6862745, 0, 1, 1,
0.7460071, 0.3717171, 0.8612334, 0.6901961, 0, 1, 1,
0.7471434, -1.122626, 1.92072, 0.6980392, 0, 1, 1,
0.7506709, 1.353728, 0.8247762, 0.7058824, 0, 1, 1,
0.7519416, 0.1138822, 1.632991, 0.7098039, 0, 1, 1,
0.7525548, 0.3859423, 0.9511733, 0.7176471, 0, 1, 1,
0.7557961, 0.7052076, 1.187299, 0.7215686, 0, 1, 1,
0.756871, 1.385748, 2.167204, 0.7294118, 0, 1, 1,
0.7610311, -0.4488682, 1.921789, 0.7333333, 0, 1, 1,
0.7651513, 0.9282752, 1.912028, 0.7411765, 0, 1, 1,
0.7655327, -0.4820588, 2.860795, 0.7450981, 0, 1, 1,
0.7662511, -0.6094941, 1.237296, 0.7529412, 0, 1, 1,
0.7706692, 0.1294015, 3.27722, 0.7568628, 0, 1, 1,
0.7708304, -0.2974884, 0.7805123, 0.7647059, 0, 1, 1,
0.771884, 0.2905488, 0.97918, 0.7686275, 0, 1, 1,
0.7732571, 2.62247, 0.8294558, 0.7764706, 0, 1, 1,
0.7749381, 0.7550393, -0.1865747, 0.7803922, 0, 1, 1,
0.7804694, -1.680233, 1.666747, 0.7882353, 0, 1, 1,
0.7860488, -0.576498, 2.950863, 0.7921569, 0, 1, 1,
0.7902229, -0.06127188, 2.472275, 0.8, 0, 1, 1,
0.7916824, 1.096518, 1.626989, 0.8078431, 0, 1, 1,
0.8023681, -0.8506421, 0.1616571, 0.8117647, 0, 1, 1,
0.804629, 1.114879, 1.81614, 0.8196079, 0, 1, 1,
0.8055383, 0.2531641, 1.246902, 0.8235294, 0, 1, 1,
0.8132965, -0.9451966, 1.944874, 0.8313726, 0, 1, 1,
0.8150365, -1.853073, 3.022046, 0.8352941, 0, 1, 1,
0.815977, -0.8908893, 3.172632, 0.8431373, 0, 1, 1,
0.8175967, 0.1392907, 1.837117, 0.8470588, 0, 1, 1,
0.8184174, 0.6576448, 1.147111, 0.854902, 0, 1, 1,
0.819563, -1.256369, 2.521566, 0.8588235, 0, 1, 1,
0.820782, 1.141847, -0.1867484, 0.8666667, 0, 1, 1,
0.8227165, 2.370807, 0.8991569, 0.8705882, 0, 1, 1,
0.8255218, -0.8392448, 2.068381, 0.8784314, 0, 1, 1,
0.8271459, 0.7936828, -0.1814173, 0.8823529, 0, 1, 1,
0.8289043, 0.1513586, 1.932671, 0.8901961, 0, 1, 1,
0.8295673, 0.3452526, 2.221218, 0.8941177, 0, 1, 1,
0.8447238, 0.3660882, 1.135487, 0.9019608, 0, 1, 1,
0.8456495, -1.355913, 3.985401, 0.9098039, 0, 1, 1,
0.8497599, -1.39574, 1.809949, 0.9137255, 0, 1, 1,
0.8546444, -0.9844815, 3.3789, 0.9215686, 0, 1, 1,
0.8548547, 1.512252, -0.4625133, 0.9254902, 0, 1, 1,
0.8600873, 0.5785602, 0.7841536, 0.9333333, 0, 1, 1,
0.8668362, -1.949134, 2.781034, 0.9372549, 0, 1, 1,
0.8670362, 0.6110178, 0.08958369, 0.945098, 0, 1, 1,
0.8722156, -0.8225814, 1.376837, 0.9490196, 0, 1, 1,
0.8777823, -0.006716156, 1.274269, 0.9568627, 0, 1, 1,
0.8862239, -0.2457194, 1.633762, 0.9607843, 0, 1, 1,
0.8875673, 0.5535177, 3.58896, 0.9686275, 0, 1, 1,
0.8905751, 0.1217439, 1.614621, 0.972549, 0, 1, 1,
0.8924581, 0.7058652, 0.3528313, 0.9803922, 0, 1, 1,
0.8955424, -0.2839131, 0.7700987, 0.9843137, 0, 1, 1,
0.9018359, 0.2834871, 0.8903776, 0.9921569, 0, 1, 1,
0.9093754, -1.564497, 3.203406, 0.9960784, 0, 1, 1,
0.9105586, 1.619142, 1.741135, 1, 0, 0.9960784, 1,
0.9257169, -1.902851, 3.701785, 1, 0, 0.9882353, 1,
0.926316, 0.6688731, 0.1096245, 1, 0, 0.9843137, 1,
0.9343594, -0.467486, 2.284526, 1, 0, 0.9764706, 1,
0.9453287, -0.4665362, 2.63926, 1, 0, 0.972549, 1,
0.9505911, -0.5647935, 1.930601, 1, 0, 0.9647059, 1,
0.951509, 1.738495, 1.44027, 1, 0, 0.9607843, 1,
0.9594401, -0.0183456, -1.253586, 1, 0, 0.9529412, 1,
0.9724175, -1.021037, 0.2642552, 1, 0, 0.9490196, 1,
0.9778038, 1.296027, 1.271762, 1, 0, 0.9411765, 1,
0.9824716, -0.8918093, 1.685953, 1, 0, 0.9372549, 1,
0.9906355, -0.3826606, 1.233025, 1, 0, 0.9294118, 1,
0.9924899, -0.9191607, 0.9372205, 1, 0, 0.9254902, 1,
0.9968169, 0.9180723, 0.9811916, 1, 0, 0.9176471, 1,
1.001105, 2.243661, -0.5842913, 1, 0, 0.9137255, 1,
1.001207, -1.632101, 3.840395, 1, 0, 0.9058824, 1,
1.003594, -0.9309852, 1.153409, 1, 0, 0.9019608, 1,
1.014253, -1.76515, 3.25439, 1, 0, 0.8941177, 1,
1.017297, -1.398344, 1.81456, 1, 0, 0.8862745, 1,
1.022079, 0.8733937, 0.5443107, 1, 0, 0.8823529, 1,
1.026303, -0.2068825, 2.891182, 1, 0, 0.8745098, 1,
1.034207, -1.675404, 3.493556, 1, 0, 0.8705882, 1,
1.034279, 0.7785729, 1.866015, 1, 0, 0.8627451, 1,
1.036262, -0.2751471, 2.89694, 1, 0, 0.8588235, 1,
1.037081, -1.31443, 0.9821365, 1, 0, 0.8509804, 1,
1.047675, -0.7243057, 3.592509, 1, 0, 0.8470588, 1,
1.048309, -0.3028792, 1.278621, 1, 0, 0.8392157, 1,
1.049583, -0.09893127, 1.353639, 1, 0, 0.8352941, 1,
1.053262, 0.9616624, 0.9001624, 1, 0, 0.827451, 1,
1.053448, 1.171153, 0.5722651, 1, 0, 0.8235294, 1,
1.053751, 0.8078563, -1.062253, 1, 0, 0.8156863, 1,
1.059374, -0.9308776, 3.075487, 1, 0, 0.8117647, 1,
1.060687, 0.8900339, 0.4680083, 1, 0, 0.8039216, 1,
1.060907, -0.9405251, 2.768888, 1, 0, 0.7960784, 1,
1.064483, 0.1860858, 3.388766, 1, 0, 0.7921569, 1,
1.081707, -0.5683782, 3.65253, 1, 0, 0.7843137, 1,
1.08463, -0.660006, 1.430835, 1, 0, 0.7803922, 1,
1.091374, -1.905844, 3.244314, 1, 0, 0.772549, 1,
1.10173, 0.6693459, 0.4095804, 1, 0, 0.7686275, 1,
1.107317, 0.8787047, 0.1503681, 1, 0, 0.7607843, 1,
1.119279, 1.879644, -1.342341, 1, 0, 0.7568628, 1,
1.123867, -1.12475, 2.094689, 1, 0, 0.7490196, 1,
1.124496, 2.175805, 0.2770115, 1, 0, 0.7450981, 1,
1.137767, -1.051459, 3.778404, 1, 0, 0.7372549, 1,
1.140864, -0.8399644, 2.511647, 1, 0, 0.7333333, 1,
1.144912, -0.187485, 0.04394709, 1, 0, 0.7254902, 1,
1.148237, -0.03235041, 0.1199434, 1, 0, 0.7215686, 1,
1.162135, 1.545658, 0.3795824, 1, 0, 0.7137255, 1,
1.173221, 0.8734366, -0.4040809, 1, 0, 0.7098039, 1,
1.177473, -0.5578092, 2.696987, 1, 0, 0.7019608, 1,
1.194285, 1.920532, 0.07705746, 1, 0, 0.6941177, 1,
1.196366, 1.266175, 1.614516, 1, 0, 0.6901961, 1,
1.19834, -1.145137, 3.082661, 1, 0, 0.682353, 1,
1.204432, 0.6954534, 0.1102188, 1, 0, 0.6784314, 1,
1.218854, 0.4167097, 2.330294, 1, 0, 0.6705883, 1,
1.221902, -0.7301149, 1.987987, 1, 0, 0.6666667, 1,
1.241184, 0.4842336, 1.786628, 1, 0, 0.6588235, 1,
1.241954, -1.196078, 2.290676, 1, 0, 0.654902, 1,
1.242953, -0.2484145, 1.140942, 1, 0, 0.6470588, 1,
1.250524, -1.390557, 1.308396, 1, 0, 0.6431373, 1,
1.253569, 0.01203972, 1.291315, 1, 0, 0.6352941, 1,
1.254061, -1.161804, 2.526765, 1, 0, 0.6313726, 1,
1.256184, -2.639703, 3.35247, 1, 0, 0.6235294, 1,
1.256752, -1.475088, 3.9785, 1, 0, 0.6196079, 1,
1.257297, 1.567226, 3.207317, 1, 0, 0.6117647, 1,
1.270313, 0.5142537, 3.172989, 1, 0, 0.6078432, 1,
1.283114, -1.200326, 3.023455, 1, 0, 0.6, 1,
1.283408, 1.669873, 0.1413214, 1, 0, 0.5921569, 1,
1.290232, 0.6497396, 2.590711, 1, 0, 0.5882353, 1,
1.294302, 0.007896068, 2.635142, 1, 0, 0.5803922, 1,
1.294664, -0.7443236, 1.711258, 1, 0, 0.5764706, 1,
1.300288, 0.2229564, 2.883515, 1, 0, 0.5686275, 1,
1.322968, -0.4151501, 2.800846, 1, 0, 0.5647059, 1,
1.324112, 0.4530612, 1.114329, 1, 0, 0.5568628, 1,
1.326362, 1.118125, 1.235026, 1, 0, 0.5529412, 1,
1.328656, 0.2970671, 1.696666, 1, 0, 0.5450981, 1,
1.338312, -1.046761, 2.211803, 1, 0, 0.5411765, 1,
1.340077, 1.003416, 1.532179, 1, 0, 0.5333334, 1,
1.340179, -1.290231, 1.550729, 1, 0, 0.5294118, 1,
1.341301, 0.7167031, -1.137656, 1, 0, 0.5215687, 1,
1.358605, -1.206504, 4.036721, 1, 0, 0.5176471, 1,
1.361539, -0.5826515, 1.690946, 1, 0, 0.509804, 1,
1.370768, -0.7662691, 1.929449, 1, 0, 0.5058824, 1,
1.371621, -0.5048794, 1.31357, 1, 0, 0.4980392, 1,
1.381558, 0.6020597, 2.226308, 1, 0, 0.4901961, 1,
1.381559, -0.1296484, 2.200387, 1, 0, 0.4862745, 1,
1.393263, 0.8729675, 0.4687071, 1, 0, 0.4784314, 1,
1.404392, -0.34987, 1.70243, 1, 0, 0.4745098, 1,
1.40776, 0.1219047, 1.642531, 1, 0, 0.4666667, 1,
1.41078, 0.9383313, 1.455742, 1, 0, 0.4627451, 1,
1.414698, -0.3020598, 2.026019, 1, 0, 0.454902, 1,
1.420688, 0.3741965, 1.480126, 1, 0, 0.4509804, 1,
1.423157, 0.1473741, 1.014624, 1, 0, 0.4431373, 1,
1.435268, 0.4687009, 1.12357, 1, 0, 0.4392157, 1,
1.446222, 0.1381161, 2.538317, 1, 0, 0.4313726, 1,
1.45326, 1.702829, 1.029417, 1, 0, 0.427451, 1,
1.457194, -1.52007, -0.5512243, 1, 0, 0.4196078, 1,
1.458886, -1.621778, 2.863484, 1, 0, 0.4156863, 1,
1.461012, 0.08502136, 1.778339, 1, 0, 0.4078431, 1,
1.49887, -0.4210376, 1.833999, 1, 0, 0.4039216, 1,
1.504415, -0.4032116, 1.433806, 1, 0, 0.3960784, 1,
1.521204, -0.6537446, 1.758352, 1, 0, 0.3882353, 1,
1.523182, -1.375694, 0.4287196, 1, 0, 0.3843137, 1,
1.530428, 0.3544173, 1.843894, 1, 0, 0.3764706, 1,
1.542973, 0.4157243, 1.983694, 1, 0, 0.372549, 1,
1.543435, 1.123921, 2.266295, 1, 0, 0.3647059, 1,
1.549874, -0.2653113, 1.329795, 1, 0, 0.3607843, 1,
1.5504, -0.3252008, 0.9954059, 1, 0, 0.3529412, 1,
1.555981, -0.09488824, 2.509293, 1, 0, 0.3490196, 1,
1.556407, 1.359674, 0.1298777, 1, 0, 0.3411765, 1,
1.556627, -0.8707671, 2.227114, 1, 0, 0.3372549, 1,
1.568068, 0.1378117, 0.6161594, 1, 0, 0.3294118, 1,
1.573462, -0.2806472, 1.053735, 1, 0, 0.3254902, 1,
1.605852, -0.2847922, 3.006186, 1, 0, 0.3176471, 1,
1.613316, 0.7457398, 2.626163, 1, 0, 0.3137255, 1,
1.630549, -1.392102, 1.102655, 1, 0, 0.3058824, 1,
1.633009, 0.2721535, 1.316673, 1, 0, 0.2980392, 1,
1.633074, -2.724937, 2.474277, 1, 0, 0.2941177, 1,
1.658558, -1.616351, 2.7567, 1, 0, 0.2862745, 1,
1.672823, -0.1990415, 3.181569, 1, 0, 0.282353, 1,
1.689275, 0.3040312, 1.198894, 1, 0, 0.2745098, 1,
1.719539, -0.2487315, 1.165517, 1, 0, 0.2705882, 1,
1.720918, -0.1308258, 0.1089365, 1, 0, 0.2627451, 1,
1.725457, -1.487325, 3.032558, 1, 0, 0.2588235, 1,
1.727216, 1.126996, 1.365561, 1, 0, 0.2509804, 1,
1.73251, -0.2630921, 0.9910765, 1, 0, 0.2470588, 1,
1.740124, -1.640012, 2.061454, 1, 0, 0.2392157, 1,
1.749394, -0.151884, 2.086734, 1, 0, 0.2352941, 1,
1.771048, 1.255274, 0.7548503, 1, 0, 0.227451, 1,
1.783666, -1.201545, 1.770966, 1, 0, 0.2235294, 1,
1.799539, 0.7527894, 1.025819, 1, 0, 0.2156863, 1,
1.843069, 1.364896, 1.684937, 1, 0, 0.2117647, 1,
1.883267, -0.3685343, 0.7553849, 1, 0, 0.2039216, 1,
1.912987, 0.3225234, 0.2767532, 1, 0, 0.1960784, 1,
1.916924, -0.5031751, 1.970524, 1, 0, 0.1921569, 1,
1.957036, -0.2563711, -0.2045712, 1, 0, 0.1843137, 1,
1.9864, 1.790279, 0.6629214, 1, 0, 0.1803922, 1,
1.991535, 0.6444939, 2.149246, 1, 0, 0.172549, 1,
2.001438, -0.7084621, 0.6618094, 1, 0, 0.1686275, 1,
2.00663, -0.6701816, 1.732006, 1, 0, 0.1607843, 1,
2.018101, -0.2111717, 1.661564, 1, 0, 0.1568628, 1,
2.025284, 1.774927, 1.33007, 1, 0, 0.1490196, 1,
2.027526, 1.656175, -1.226416, 1, 0, 0.145098, 1,
2.029456, 0.2316311, 1.350842, 1, 0, 0.1372549, 1,
2.050947, -2.230777, 0.7715713, 1, 0, 0.1333333, 1,
2.080736, 0.2488037, 0.6215947, 1, 0, 0.1254902, 1,
2.081659, 2.877282, 0.245619, 1, 0, 0.1215686, 1,
2.113764, 0.02185888, 0.9930439, 1, 0, 0.1137255, 1,
2.116987, -0.1970701, 0.182996, 1, 0, 0.1098039, 1,
2.217963, 0.5070447, -0.3337626, 1, 0, 0.1019608, 1,
2.22775, 0.02794465, 1.467066, 1, 0, 0.09411765, 1,
2.274757, -1.252104, 1.259393, 1, 0, 0.09019608, 1,
2.306971, 1.856749, 2.328749, 1, 0, 0.08235294, 1,
2.322081, -1.433882, 1.300692, 1, 0, 0.07843138, 1,
2.358191, -0.6758738, 1.839569, 1, 0, 0.07058824, 1,
2.363662, 0.4617364, 0.8153314, 1, 0, 0.06666667, 1,
2.37569, -1.527449, 3.873894, 1, 0, 0.05882353, 1,
2.378233, 0.8398411, -0.838066, 1, 0, 0.05490196, 1,
2.485732, 1.750176, -0.3099784, 1, 0, 0.04705882, 1,
2.509817, 0.5065564, 2.352509, 1, 0, 0.04313726, 1,
2.564745, -0.7267452, 1.505158, 1, 0, 0.03529412, 1,
2.587361, -1.255825, 0.5176365, 1, 0, 0.03137255, 1,
2.7627, -0.1346704, 0.5525163, 1, 0, 0.02352941, 1,
2.786409, 0.6246559, 2.292732, 1, 0, 0.01960784, 1,
2.82289, 2.182337, -0.7415861, 1, 0, 0.01176471, 1,
3.051684, 1.820022, -0.3316375, 1, 0, 0.007843138, 1
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
-0.2501663, -4.625819, -7.257334, 0, -0.5, 0.5, 0.5,
-0.2501663, -4.625819, -7.257334, 1, -0.5, 0.5, 0.5,
-0.2501663, -4.625819, -7.257334, 1, 1.5, 0.5, 0.5,
-0.2501663, -4.625819, -7.257334, 0, 1.5, 0.5, 0.5
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
-4.671343, 0.286644, -7.257334, 0, -0.5, 0.5, 0.5,
-4.671343, 0.286644, -7.257334, 1, -0.5, 0.5, 0.5,
-4.671343, 0.286644, -7.257334, 1, 1.5, 0.5, 0.5,
-4.671343, 0.286644, -7.257334, 0, 1.5, 0.5, 0.5
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
-4.671343, -4.625819, -0.2900486, 0, -0.5, 0.5, 0.5,
-4.671343, -4.625819, -0.2900486, 1, -0.5, 0.5, 0.5,
-4.671343, -4.625819, -0.2900486, 1, 1.5, 0.5, 0.5,
-4.671343, -4.625819, -0.2900486, 0, 1.5, 0.5, 0.5
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
-3, -3.492173, -5.649498,
3, -3.492173, -5.649498,
-3, -3.492173, -5.649498,
-3, -3.681114, -5.917471,
-2, -3.492173, -5.649498,
-2, -3.681114, -5.917471,
-1, -3.492173, -5.649498,
-1, -3.681114, -5.917471,
0, -3.492173, -5.649498,
0, -3.681114, -5.917471,
1, -3.492173, -5.649498,
1, -3.681114, -5.917471,
2, -3.492173, -5.649498,
2, -3.681114, -5.917471,
3, -3.492173, -5.649498,
3, -3.681114, -5.917471
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
-3, -4.058996, -6.453416, 0, -0.5, 0.5, 0.5,
-3, -4.058996, -6.453416, 1, -0.5, 0.5, 0.5,
-3, -4.058996, -6.453416, 1, 1.5, 0.5, 0.5,
-3, -4.058996, -6.453416, 0, 1.5, 0.5, 0.5,
-2, -4.058996, -6.453416, 0, -0.5, 0.5, 0.5,
-2, -4.058996, -6.453416, 1, -0.5, 0.5, 0.5,
-2, -4.058996, -6.453416, 1, 1.5, 0.5, 0.5,
-2, -4.058996, -6.453416, 0, 1.5, 0.5, 0.5,
-1, -4.058996, -6.453416, 0, -0.5, 0.5, 0.5,
-1, -4.058996, -6.453416, 1, -0.5, 0.5, 0.5,
-1, -4.058996, -6.453416, 1, 1.5, 0.5, 0.5,
-1, -4.058996, -6.453416, 0, 1.5, 0.5, 0.5,
0, -4.058996, -6.453416, 0, -0.5, 0.5, 0.5,
0, -4.058996, -6.453416, 1, -0.5, 0.5, 0.5,
0, -4.058996, -6.453416, 1, 1.5, 0.5, 0.5,
0, -4.058996, -6.453416, 0, 1.5, 0.5, 0.5,
1, -4.058996, -6.453416, 0, -0.5, 0.5, 0.5,
1, -4.058996, -6.453416, 1, -0.5, 0.5, 0.5,
1, -4.058996, -6.453416, 1, 1.5, 0.5, 0.5,
1, -4.058996, -6.453416, 0, 1.5, 0.5, 0.5,
2, -4.058996, -6.453416, 0, -0.5, 0.5, 0.5,
2, -4.058996, -6.453416, 1, -0.5, 0.5, 0.5,
2, -4.058996, -6.453416, 1, 1.5, 0.5, 0.5,
2, -4.058996, -6.453416, 0, 1.5, 0.5, 0.5,
3, -4.058996, -6.453416, 0, -0.5, 0.5, 0.5,
3, -4.058996, -6.453416, 1, -0.5, 0.5, 0.5,
3, -4.058996, -6.453416, 1, 1.5, 0.5, 0.5,
3, -4.058996, -6.453416, 0, 1.5, 0.5, 0.5
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
-3.651072, -2, -5.649498,
-3.651072, 2, -5.649498,
-3.651072, -2, -5.649498,
-3.821117, -2, -5.917471,
-3.651072, 0, -5.649498,
-3.821117, 0, -5.917471,
-3.651072, 2, -5.649498,
-3.821117, 2, -5.917471
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
-4.161208, -2, -6.453416, 0, -0.5, 0.5, 0.5,
-4.161208, -2, -6.453416, 1, -0.5, 0.5, 0.5,
-4.161208, -2, -6.453416, 1, 1.5, 0.5, 0.5,
-4.161208, -2, -6.453416, 0, 1.5, 0.5, 0.5,
-4.161208, 0, -6.453416, 0, -0.5, 0.5, 0.5,
-4.161208, 0, -6.453416, 1, -0.5, 0.5, 0.5,
-4.161208, 0, -6.453416, 1, 1.5, 0.5, 0.5,
-4.161208, 0, -6.453416, 0, 1.5, 0.5, 0.5,
-4.161208, 2, -6.453416, 0, -0.5, 0.5, 0.5,
-4.161208, 2, -6.453416, 1, -0.5, 0.5, 0.5,
-4.161208, 2, -6.453416, 1, 1.5, 0.5, 0.5,
-4.161208, 2, -6.453416, 0, 1.5, 0.5, 0.5
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
-3.651072, -3.492173, -4,
-3.651072, -3.492173, 4,
-3.651072, -3.492173, -4,
-3.821117, -3.681114, -4,
-3.651072, -3.492173, -2,
-3.821117, -3.681114, -2,
-3.651072, -3.492173, 0,
-3.821117, -3.681114, 0,
-3.651072, -3.492173, 2,
-3.821117, -3.681114, 2,
-3.651072, -3.492173, 4,
-3.821117, -3.681114, 4
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
-4.161208, -4.058996, -4, 0, -0.5, 0.5, 0.5,
-4.161208, -4.058996, -4, 1, -0.5, 0.5, 0.5,
-4.161208, -4.058996, -4, 1, 1.5, 0.5, 0.5,
-4.161208, -4.058996, -4, 0, 1.5, 0.5, 0.5,
-4.161208, -4.058996, -2, 0, -0.5, 0.5, 0.5,
-4.161208, -4.058996, -2, 1, -0.5, 0.5, 0.5,
-4.161208, -4.058996, -2, 1, 1.5, 0.5, 0.5,
-4.161208, -4.058996, -2, 0, 1.5, 0.5, 0.5,
-4.161208, -4.058996, 0, 0, -0.5, 0.5, 0.5,
-4.161208, -4.058996, 0, 1, -0.5, 0.5, 0.5,
-4.161208, -4.058996, 0, 1, 1.5, 0.5, 0.5,
-4.161208, -4.058996, 0, 0, 1.5, 0.5, 0.5,
-4.161208, -4.058996, 2, 0, -0.5, 0.5, 0.5,
-4.161208, -4.058996, 2, 1, -0.5, 0.5, 0.5,
-4.161208, -4.058996, 2, 1, 1.5, 0.5, 0.5,
-4.161208, -4.058996, 2, 0, 1.5, 0.5, 0.5,
-4.161208, -4.058996, 4, 0, -0.5, 0.5, 0.5,
-4.161208, -4.058996, 4, 1, -0.5, 0.5, 0.5,
-4.161208, -4.058996, 4, 1, 1.5, 0.5, 0.5,
-4.161208, -4.058996, 4, 0, 1.5, 0.5, 0.5
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
-3.651072, -3.492173, -5.649498,
-3.651072, 4.065462, -5.649498,
-3.651072, -3.492173, 5.069401,
-3.651072, 4.065462, 5.069401,
-3.651072, -3.492173, -5.649498,
-3.651072, -3.492173, 5.069401,
-3.651072, 4.065462, -5.649498,
-3.651072, 4.065462, 5.069401,
-3.651072, -3.492173, -5.649498,
3.150739, -3.492173, -5.649498,
-3.651072, -3.492173, 5.069401,
3.150739, -3.492173, 5.069401,
-3.651072, 4.065462, -5.649498,
3.150739, 4.065462, -5.649498,
-3.651072, 4.065462, 5.069401,
3.150739, 4.065462, 5.069401,
3.150739, -3.492173, -5.649498,
3.150739, 4.065462, -5.649498,
3.150739, -3.492173, 5.069401,
3.150739, 4.065462, 5.069401,
3.150739, -3.492173, -5.649498,
3.150739, -3.492173, 5.069401,
3.150739, 4.065462, -5.649498,
3.150739, 4.065462, 5.069401
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
var radius = 7.889142;
var distance = 35.09968;
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
mvMatrix.translate( 0.2501663, -0.286644, 0.2900486 );
mvMatrix.scale( 1.254062, 1.128646, 0.7957808 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.09968);
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
benzoic_acid<-read.table("benzoic_acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benzoic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzoic_acid' not found
```

```r
y<-benzoic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzoic_acid' not found
```

```r
z<-benzoic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzoic_acid' not found
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
-3.552016, -0.7893629, -2.83617, 0, 0, 1, 1, 1,
-2.807739, -0.9124023, -2.466689, 1, 0, 0, 1, 1,
-2.681407, -1.16725, -1.359333, 1, 0, 0, 1, 1,
-2.67603, 0.2170126, -2.462758, 1, 0, 0, 1, 1,
-2.666544, 1.180533, 0.2749848, 1, 0, 0, 1, 1,
-2.571275, 0.3208571, -2.588104, 1, 0, 0, 1, 1,
-2.517061, -0.356546, 1.328801, 0, 0, 0, 1, 1,
-2.507563, 0.1734123, -0.5527284, 0, 0, 0, 1, 1,
-2.501462, 0.4524135, -2.825104, 0, 0, 0, 1, 1,
-2.446877, 0.7223141, -1.294735, 0, 0, 0, 1, 1,
-2.41064, 0.1241885, -2.528837, 0, 0, 0, 1, 1,
-2.406328, -0.6436289, -2.953809, 0, 0, 0, 1, 1,
-2.372638, -0.7787723, -2.161275, 0, 0, 0, 1, 1,
-2.336013, 1.245955, -0.1949937, 1, 1, 1, 1, 1,
-2.324486, 0.9992201, -2.473356, 1, 1, 1, 1, 1,
-2.282112, 1.386245, -0.1924821, 1, 1, 1, 1, 1,
-2.268701, -0.1417673, -1.296055, 1, 1, 1, 1, 1,
-2.254717, 3.401869, 0.5424176, 1, 1, 1, 1, 1,
-2.151165, -0.7509443, 0.1599137, 1, 1, 1, 1, 1,
-2.146445, -1.102283, -2.946552, 1, 1, 1, 1, 1,
-2.098128, 1.270227, -1.671373, 1, 1, 1, 1, 1,
-2.092562, 1.288802, -0.06264007, 1, 1, 1, 1, 1,
-2.091758, 0.388336, -1.361419, 1, 1, 1, 1, 1,
-2.071194, 0.9422473, -2.086113, 1, 1, 1, 1, 1,
-2.070644, -0.1450468, -2.216964, 1, 1, 1, 1, 1,
-2.069479, -0.1847329, -1.585416, 1, 1, 1, 1, 1,
-2.017568, 1.619605, 0.8163384, 1, 1, 1, 1, 1,
-2.007476, -0.7592306, -0.351794, 1, 1, 1, 1, 1,
-1.998941, -0.09964208, -3.70726, 0, 0, 1, 1, 1,
-1.994531, 0.3103444, -1.531019, 1, 0, 0, 1, 1,
-1.952403, 2.20459, 1.069404, 1, 0, 0, 1, 1,
-1.927339, -1.93482, -2.885481, 1, 0, 0, 1, 1,
-1.909423, -1.253163, -4.579952, 1, 0, 0, 1, 1,
-1.877354, 0.7177436, -1.947851, 1, 0, 0, 1, 1,
-1.860123, -1.096017, -2.950317, 0, 0, 0, 1, 1,
-1.842282, -1.823699, -3.466149, 0, 0, 0, 1, 1,
-1.835038, -0.07601958, -1.043383, 0, 0, 0, 1, 1,
-1.828094, 0.1731979, -2.593939, 0, 0, 0, 1, 1,
-1.819445, -0.5547836, -1.170105, 0, 0, 0, 1, 1,
-1.81534, 1.294714, -1.476973, 0, 0, 0, 1, 1,
-1.815042, 0.05620014, -2.20205, 0, 0, 0, 1, 1,
-1.801878, 0.005750046, -1.393071, 1, 1, 1, 1, 1,
-1.785434, -1.486927, -2.355333, 1, 1, 1, 1, 1,
-1.775783, -0.2422933, -1.084269, 1, 1, 1, 1, 1,
-1.752756, 2.492857, -0.7077405, 1, 1, 1, 1, 1,
-1.749633, 1.212122, -0.4564453, 1, 1, 1, 1, 1,
-1.743301, 0.6993551, -0.9832022, 1, 1, 1, 1, 1,
-1.733221, 0.3109379, -0.19262, 1, 1, 1, 1, 1,
-1.732124, -1.920133, -0.08477042, 1, 1, 1, 1, 1,
-1.727061, 0.5027112, -1.004132, 1, 1, 1, 1, 1,
-1.724606, 0.06887389, -0.5868787, 1, 1, 1, 1, 1,
-1.718238, 0.395517, -2.291403, 1, 1, 1, 1, 1,
-1.715877, 1.446918, -1.129883, 1, 1, 1, 1, 1,
-1.708059, -0.5392868, -0.485602, 1, 1, 1, 1, 1,
-1.700724, -0.4476275, -2.44425, 1, 1, 1, 1, 1,
-1.683385, -0.07256271, -3.176341, 1, 1, 1, 1, 1,
-1.682682, 1.286889, -1.613029, 0, 0, 1, 1, 1,
-1.681694, -0.4503109, -2.095993, 1, 0, 0, 1, 1,
-1.680496, 1.002084, -1.684042, 1, 0, 0, 1, 1,
-1.660541, 1.310118, 0.71525, 1, 0, 0, 1, 1,
-1.656546, -1.32966, -3.673626, 1, 0, 0, 1, 1,
-1.645005, 0.07672449, -1.239868, 1, 0, 0, 1, 1,
-1.637972, -0.7307624, -1.717954, 0, 0, 0, 1, 1,
-1.612949, 0.4092917, -1.301119, 0, 0, 0, 1, 1,
-1.582122, -0.04138478, -2.250046, 0, 0, 0, 1, 1,
-1.578217, 0.5374767, -2.702725, 0, 0, 0, 1, 1,
-1.554061, 0.5722917, -0.2402869, 0, 0, 0, 1, 1,
-1.549509, 0.7540659, -0.7320973, 0, 0, 0, 1, 1,
-1.54687, -1.033024, -0.6189425, 0, 0, 0, 1, 1,
-1.541782, 0.1573727, -0.3429419, 1, 1, 1, 1, 1,
-1.539327, -0.7050261, -1.086096, 1, 1, 1, 1, 1,
-1.530248, -0.5360461, -1.85439, 1, 1, 1, 1, 1,
-1.525759, -0.8537137, -2.664461, 1, 1, 1, 1, 1,
-1.518665, -0.0687348, -0.1391504, 1, 1, 1, 1, 1,
-1.496027, 0.8840332, -0.4591437, 1, 1, 1, 1, 1,
-1.490564, -0.5769699, -0.9661088, 1, 1, 1, 1, 1,
-1.487421, 1.391752, -0.9554275, 1, 1, 1, 1, 1,
-1.48521, -0.5808878, -2.44155, 1, 1, 1, 1, 1,
-1.455422, 1.060768, -0.6518082, 1, 1, 1, 1, 1,
-1.436567, 1.369155, -0.823028, 1, 1, 1, 1, 1,
-1.423304, -0.1329767, -1.378573, 1, 1, 1, 1, 1,
-1.417914, 1.27043, -0.3952149, 1, 1, 1, 1, 1,
-1.416618, 0.6580347, -1.013806, 1, 1, 1, 1, 1,
-1.414372, 0.8829514, -0.2191032, 1, 1, 1, 1, 1,
-1.409431, -1.206796, -3.375292, 0, 0, 1, 1, 1,
-1.396453, -1.41981, -2.857308, 1, 0, 0, 1, 1,
-1.378151, 0.6888939, -0.9888567, 1, 0, 0, 1, 1,
-1.374445, -0.02047056, -1.005173, 1, 0, 0, 1, 1,
-1.365547, -1.006947, -2.310964, 1, 0, 0, 1, 1,
-1.36486, 0.3446175, -2.173714, 1, 0, 0, 1, 1,
-1.358301, 0.162478, -2.005734, 0, 0, 0, 1, 1,
-1.353681, -1.699591, -2.883419, 0, 0, 0, 1, 1,
-1.346769, 0.9380482, -0.987864, 0, 0, 0, 1, 1,
-1.346653, 0.3157474, -0.7265412, 0, 0, 0, 1, 1,
-1.343395, 0.3484365, -1.580669, 0, 0, 0, 1, 1,
-1.342887, 1.668249, 0.3007843, 0, 0, 0, 1, 1,
-1.342106, -0.4674525, -2.344872, 0, 0, 0, 1, 1,
-1.337288, -1.33429, 0.2348717, 1, 1, 1, 1, 1,
-1.335906, 1.544606, 0.2115071, 1, 1, 1, 1, 1,
-1.332967, -0.1413498, -1.039971, 1, 1, 1, 1, 1,
-1.327171, -0.2563906, -0.5655841, 1, 1, 1, 1, 1,
-1.320025, 2.205865, -0.09663498, 1, 1, 1, 1, 1,
-1.304762, -3.158235, -3.542845, 1, 1, 1, 1, 1,
-1.302, -0.7959857, -2.131642, 1, 1, 1, 1, 1,
-1.298622, -0.300032, -2.496053, 1, 1, 1, 1, 1,
-1.293818, -1.407476, -3.222025, 1, 1, 1, 1, 1,
-1.279986, 1.38, -0.3525052, 1, 1, 1, 1, 1,
-1.279162, -0.1567256, -0.6223686, 1, 1, 1, 1, 1,
-1.275951, 0.5598227, 0.06717316, 1, 1, 1, 1, 1,
-1.27435, -0.671845, -1.384545, 1, 1, 1, 1, 1,
-1.273362, -0.733292, -1.805476, 1, 1, 1, 1, 1,
-1.272799, -0.4926525, -0.2694887, 1, 1, 1, 1, 1,
-1.264, 0.3751701, -0.8895772, 0, 0, 1, 1, 1,
-1.255436, 0.3905964, -0.5222521, 1, 0, 0, 1, 1,
-1.247167, 0.07376786, -0.9457245, 1, 0, 0, 1, 1,
-1.234428, 1.512985, -0.2528922, 1, 0, 0, 1, 1,
-1.231196, 0.0316351, -0.7045925, 1, 0, 0, 1, 1,
-1.229524, -2.556948, -1.826603, 1, 0, 0, 1, 1,
-1.217008, 0.1576259, -0.4015303, 0, 0, 0, 1, 1,
-1.208069, -0.4864413, -2.171725, 0, 0, 0, 1, 1,
-1.200714, 1.16571, -0.00360843, 0, 0, 0, 1, 1,
-1.198268, -1.157939, -1.812822, 0, 0, 0, 1, 1,
-1.19284, 1.029542, -1.118718, 0, 0, 0, 1, 1,
-1.184186, 1.170254, 0.02133696, 0, 0, 0, 1, 1,
-1.183948, -0.03820249, -2.432783, 0, 0, 0, 1, 1,
-1.183123, 1.738357, -0.800523, 1, 1, 1, 1, 1,
-1.165486, -1.137911, -3.603927, 1, 1, 1, 1, 1,
-1.163684, 1.051702, -0.2045396, 1, 1, 1, 1, 1,
-1.144804, 0.1536693, -1.561058, 1, 1, 1, 1, 1,
-1.141051, 0.6515078, -1.234341, 1, 1, 1, 1, 1,
-1.129597, 0.8389168, -0.3683048, 1, 1, 1, 1, 1,
-1.127319, 1.837149, 0.1777821, 1, 1, 1, 1, 1,
-1.123045, -0.4703352, -2.975417, 1, 1, 1, 1, 1,
-1.12245, 0.6313434, -1.509778, 1, 1, 1, 1, 1,
-1.120685, 0.1849298, -2.853568, 1, 1, 1, 1, 1,
-1.120286, -1.207661, -1.850462, 1, 1, 1, 1, 1,
-1.117366, -1.040376, -2.710228, 1, 1, 1, 1, 1,
-1.113429, -0.5402312, -0.7146984, 1, 1, 1, 1, 1,
-1.113093, -0.8335881, -2.404756, 1, 1, 1, 1, 1,
-1.11138, 0.4833349, -2.884005, 1, 1, 1, 1, 1,
-1.107505, 1.758083, -1.789834, 0, 0, 1, 1, 1,
-1.104557, 0.05309614, -0.9332357, 1, 0, 0, 1, 1,
-1.095252, -0.01774838, -0.4102151, 1, 0, 0, 1, 1,
-1.084322, -1.445073, -2.130773, 1, 0, 0, 1, 1,
-1.081512, -3.382111, -3.962301, 1, 0, 0, 1, 1,
-1.079521, -1.645742, -2.024132, 1, 0, 0, 1, 1,
-1.076371, -0.7072485, -2.622275, 0, 0, 0, 1, 1,
-1.07381, 1.3982, -0.5630208, 0, 0, 0, 1, 1,
-1.069353, -0.9002423, -1.458633, 0, 0, 0, 1, 1,
-1.069211, -0.2199965, -2.84978, 0, 0, 0, 1, 1,
-1.067204, -0.831654, -2.856622, 0, 0, 0, 1, 1,
-1.066639, -0.237321, -0.9498648, 0, 0, 0, 1, 1,
-1.058833, -0.4550565, -2.791787, 0, 0, 0, 1, 1,
-1.054979, -1.355955, -2.087878, 1, 1, 1, 1, 1,
-1.053269, -0.5887693, -2.899687, 1, 1, 1, 1, 1,
-1.051265, -0.7085136, -2.712892, 1, 1, 1, 1, 1,
-1.050254, 1.206041, 1.133662, 1, 1, 1, 1, 1,
-1.042162, -0.01037358, -0.7253962, 1, 1, 1, 1, 1,
-1.037863, -0.1766721, -2.590535, 1, 1, 1, 1, 1,
-1.033795, -0.0990977, -3.03432, 1, 1, 1, 1, 1,
-1.031237, 0.515722, -2.291035, 1, 1, 1, 1, 1,
-1.025367, 0.09646272, -0.8484762, 1, 1, 1, 1, 1,
-1.023648, -1.614893, -4.825949, 1, 1, 1, 1, 1,
-1.022772, -0.6128597, -2.809879, 1, 1, 1, 1, 1,
-1.019516, -0.617137, -1.060576, 1, 1, 1, 1, 1,
-1.018622, 0.9306338, -0.2122678, 1, 1, 1, 1, 1,
-1.013841, 1.073336, -1.457341, 1, 1, 1, 1, 1,
-1.010834, 0.7589852, -0.2021564, 1, 1, 1, 1, 1,
-1.008214, 0.1588813, -3.324125, 0, 0, 1, 1, 1,
-1.00492, -2.076397, -0.6681045, 1, 0, 0, 1, 1,
-1.002476, 0.01325466, -1.769642, 1, 0, 0, 1, 1,
-0.9987948, 0.8478958, -1.120191, 1, 0, 0, 1, 1,
-0.9944323, 0.05439792, -0.6197636, 1, 0, 0, 1, 1,
-0.9918807, 0.8712665, -1.842992, 1, 0, 0, 1, 1,
-0.9883343, -0.5165784, -2.518188, 0, 0, 0, 1, 1,
-0.987128, 1.05625, 0.3210634, 0, 0, 0, 1, 1,
-0.9864002, -0.03275137, -1.561693, 0, 0, 0, 1, 1,
-0.9843283, 2.298546, 0.1459348, 0, 0, 0, 1, 1,
-0.9764063, 1.226661, 0.4026201, 0, 0, 0, 1, 1,
-0.9647462, -1.373369, -2.823541, 0, 0, 0, 1, 1,
-0.9624576, -1.622355, -2.11357, 0, 0, 0, 1, 1,
-0.9519663, -0.2637004, -2.373829, 1, 1, 1, 1, 1,
-0.9511186, 0.6954606, -1.475857, 1, 1, 1, 1, 1,
-0.9469948, 1.249751, -1.33921, 1, 1, 1, 1, 1,
-0.9427299, -0.2439028, -0.453235, 1, 1, 1, 1, 1,
-0.9382559, 1.655054, -0.9558601, 1, 1, 1, 1, 1,
-0.9275166, -1.940704, -1.390625, 1, 1, 1, 1, 1,
-0.92658, -0.8791413, -2.049321, 1, 1, 1, 1, 1,
-0.9200035, 1.261102, 1.134402, 1, 1, 1, 1, 1,
-0.9136937, 0.2580689, -1.581715, 1, 1, 1, 1, 1,
-0.912966, 0.04929517, -1.951516, 1, 1, 1, 1, 1,
-0.9065133, 0.2483209, -0.3032691, 1, 1, 1, 1, 1,
-0.9064863, 0.4287223, 0.5301561, 1, 1, 1, 1, 1,
-0.905396, -0.3140154, -1.570247, 1, 1, 1, 1, 1,
-0.8994105, -1.200353, -1.487415, 1, 1, 1, 1, 1,
-0.895843, -1.212759, -2.421509, 1, 1, 1, 1, 1,
-0.8847516, 1.09883, 1.04215, 0, 0, 1, 1, 1,
-0.8837297, 0.5302775, -0.59872, 1, 0, 0, 1, 1,
-0.8782078, -0.1306095, -2.236385, 1, 0, 0, 1, 1,
-0.8726543, 0.5723157, -1.490746, 1, 0, 0, 1, 1,
-0.8677383, 1.374788, -0.5670836, 1, 0, 0, 1, 1,
-0.8654895, 1.098027, -0.553521, 1, 0, 0, 1, 1,
-0.8607207, 2.660585, -0.07602167, 0, 0, 0, 1, 1,
-0.860665, 0.1525235, -1.625628, 0, 0, 0, 1, 1,
-0.8591657, 0.9912519, 0.2388263, 0, 0, 0, 1, 1,
-0.858164, 1.149314, 0.1548494, 0, 0, 0, 1, 1,
-0.855342, -0.6472819, -2.503706, 0, 0, 0, 1, 1,
-0.8549343, 0.2998258, -0.5006904, 0, 0, 0, 1, 1,
-0.8497354, 1.147682, -1.228132, 0, 0, 0, 1, 1,
-0.8486168, -0.5415308, -2.3719, 1, 1, 1, 1, 1,
-0.8477514, -0.9174773, -1.973753, 1, 1, 1, 1, 1,
-0.8447043, -1.561327, -4.034395, 1, 1, 1, 1, 1,
-0.8435022, 0.9517972, -1.639496, 1, 1, 1, 1, 1,
-0.8392414, 0.1047169, -1.48022, 1, 1, 1, 1, 1,
-0.8364179, 1.362601, 0.4970186, 1, 1, 1, 1, 1,
-0.823939, 0.9978506, -1.409977, 1, 1, 1, 1, 1,
-0.8232412, -1.307056, -2.981833, 1, 1, 1, 1, 1,
-0.8224056, 0.3629681, -1.813428, 1, 1, 1, 1, 1,
-0.8188015, 0.6155195, -0.2497923, 1, 1, 1, 1, 1,
-0.8169858, 1.547469, -0.6900122, 1, 1, 1, 1, 1,
-0.815091, -1.823236, -3.533952, 1, 1, 1, 1, 1,
-0.8109246, -1.368742, -4.11176, 1, 1, 1, 1, 1,
-0.8008612, 1.06599, -0.1705167, 1, 1, 1, 1, 1,
-0.7998707, -0.7625336, -1.474084, 1, 1, 1, 1, 1,
-0.7994167, -0.4250068, -4.209775, 0, 0, 1, 1, 1,
-0.7988542, 1.406338, -0.720597, 1, 0, 0, 1, 1,
-0.7786074, -1.442424, -2.3712, 1, 0, 0, 1, 1,
-0.7758566, 0.5808235, -1.531319, 1, 0, 0, 1, 1,
-0.7753681, -0.5544966, -0.1966634, 1, 0, 0, 1, 1,
-0.771308, 0.140818, -1.715905, 1, 0, 0, 1, 1,
-0.7702125, 0.4232559, -0.7105138, 0, 0, 0, 1, 1,
-0.7694164, -1.121688, -2.181211, 0, 0, 0, 1, 1,
-0.7684747, -0.1299739, -1.776184, 0, 0, 0, 1, 1,
-0.759222, 0.6104841, -1.506678, 0, 0, 0, 1, 1,
-0.7565762, 0.307346, -1.96107, 0, 0, 0, 1, 1,
-0.7533435, 1.650916, -0.8267652, 0, 0, 0, 1, 1,
-0.7508456, -1.354647, -3.011172, 0, 0, 0, 1, 1,
-0.7494708, 0.7458177, 1.859018, 1, 1, 1, 1, 1,
-0.7352639, 2.016617, -1.009341, 1, 1, 1, 1, 1,
-0.7318013, 0.582384, -1.697088, 1, 1, 1, 1, 1,
-0.7268238, -0.2282394, -2.083248, 1, 1, 1, 1, 1,
-0.7261955, 0.02952648, -1.356812, 1, 1, 1, 1, 1,
-0.7232108, 1.863036, 0.271319, 1, 1, 1, 1, 1,
-0.7180252, 1.816213, -0.9031901, 1, 1, 1, 1, 1,
-0.717145, 1.493105, 0.4898523, 1, 1, 1, 1, 1,
-0.7129697, 1.598204, -0.5878102, 1, 1, 1, 1, 1,
-0.7128648, 1.542169, 0.3023238, 1, 1, 1, 1, 1,
-0.7027737, 2.202912, -0.3333543, 1, 1, 1, 1, 1,
-0.6998742, -0.985718, -3.036593, 1, 1, 1, 1, 1,
-0.696708, 0.4917648, -2.629805, 1, 1, 1, 1, 1,
-0.6948946, 2.336553, -0.8903421, 1, 1, 1, 1, 1,
-0.6915061, 0.2452109, -1.41978, 1, 1, 1, 1, 1,
-0.6900102, -1.584332, -1.890981, 0, 0, 1, 1, 1,
-0.6894075, 0.236154, -2.788841, 1, 0, 0, 1, 1,
-0.6843791, 0.9680513, 2.449333, 1, 0, 0, 1, 1,
-0.6842727, 0.350457, -0.03228709, 1, 0, 0, 1, 1,
-0.6811104, -0.3636967, -2.624906, 1, 0, 0, 1, 1,
-0.6791309, 1.633168, -0.4179891, 1, 0, 0, 1, 1,
-0.6765771, -1.815797, -2.193633, 0, 0, 0, 1, 1,
-0.6711501, -1.513353, -3.658476, 0, 0, 0, 1, 1,
-0.6552818, -0.3229957, -1.145931, 0, 0, 0, 1, 1,
-0.6552793, -1.280525, -2.119218, 0, 0, 0, 1, 1,
-0.6552044, 0.5313717, -0.7557293, 0, 0, 0, 1, 1,
-0.6529225, 1.771303, -0.06894772, 0, 0, 0, 1, 1,
-0.64654, -1.772752, -3.334882, 0, 0, 0, 1, 1,
-0.644466, 0.9738813, 0.7666385, 1, 1, 1, 1, 1,
-0.6416595, 1.538823, -1.004389, 1, 1, 1, 1, 1,
-0.6411372, -0.03555844, -1.573388, 1, 1, 1, 1, 1,
-0.6409364, 0.6024156, -0.8137637, 1, 1, 1, 1, 1,
-0.6387326, 0.3577462, -0.2999763, 1, 1, 1, 1, 1,
-0.6383943, -0.07426272, -3.993067, 1, 1, 1, 1, 1,
-0.6371123, -2.289632, -2.682865, 1, 1, 1, 1, 1,
-0.6363059, 0.9524057, -0.3959275, 1, 1, 1, 1, 1,
-0.6346443, 0.6282531, 1.279708, 1, 1, 1, 1, 1,
-0.6344727, 0.9528758, 0.9319387, 1, 1, 1, 1, 1,
-0.6323279, -1.178716, -3.101274, 1, 1, 1, 1, 1,
-0.6308131, -0.4256291, -2.205686, 1, 1, 1, 1, 1,
-0.6303915, 1.533391, -1.003034, 1, 1, 1, 1, 1,
-0.6272909, -0.1399143, -3.222999, 1, 1, 1, 1, 1,
-0.619764, -0.7888683, -1.34884, 1, 1, 1, 1, 1,
-0.6171549, -1.02558, -2.615331, 0, 0, 1, 1, 1,
-0.615518, -2.28465, -2.40129, 1, 0, 0, 1, 1,
-0.6153496, 0.03244497, -1.346042, 1, 0, 0, 1, 1,
-0.6152102, 2.741015, -0.1795601, 1, 0, 0, 1, 1,
-0.6107981, 0.7707804, -1.601376, 1, 0, 0, 1, 1,
-0.6097155, 2.209154, -0.5952249, 1, 0, 0, 1, 1,
-0.6030337, 0.07104873, -0.7881962, 0, 0, 0, 1, 1,
-0.6006377, 0.293778, 0.6088107, 0, 0, 0, 1, 1,
-0.5975648, 0.5449616, -3.014646, 0, 0, 0, 1, 1,
-0.5967532, 1.299676, -1.162737, 0, 0, 0, 1, 1,
-0.5902213, 1.513143, -2.823408, 0, 0, 0, 1, 1,
-0.5874028, 1.18905, -0.1061066, 0, 0, 0, 1, 1,
-0.5839135, -0.1449707, -2.990465, 0, 0, 0, 1, 1,
-0.5794586, 0.9049944, -0.4742788, 1, 1, 1, 1, 1,
-0.576189, 1.394076, -2.841822, 1, 1, 1, 1, 1,
-0.5754486, -1.339596, -3.321099, 1, 1, 1, 1, 1,
-0.5693519, 0.7119128, -0.6973884, 1, 1, 1, 1, 1,
-0.5684022, -1.798627, -1.693776, 1, 1, 1, 1, 1,
-0.5640042, 3.955399, -2.050285, 1, 1, 1, 1, 1,
-0.5589485, 0.6031656, -0.04499522, 1, 1, 1, 1, 1,
-0.5572465, 0.4430709, -1.202152, 1, 1, 1, 1, 1,
-0.5474093, 1.782445, -0.6546836, 1, 1, 1, 1, 1,
-0.5453842, 0.7845079, -0.93061, 1, 1, 1, 1, 1,
-0.5451238, -0.444548, -1.367727, 1, 1, 1, 1, 1,
-0.5383618, 0.610445, -0.8517796, 1, 1, 1, 1, 1,
-0.5381956, -0.5639887, -1.859144, 1, 1, 1, 1, 1,
-0.5375512, 0.200662, -1.303311, 1, 1, 1, 1, 1,
-0.5369597, 0.3129279, -1.180269, 1, 1, 1, 1, 1,
-0.5303467, 0.02265546, -1.731404, 0, 0, 1, 1, 1,
-0.529669, -0.4996774, -3.824867, 1, 0, 0, 1, 1,
-0.5295911, -0.7379314, -3.087434, 1, 0, 0, 1, 1,
-0.5283615, 0.2830604, -0.935884, 1, 0, 0, 1, 1,
-0.5261234, 0.3857975, -1.769599, 1, 0, 0, 1, 1,
-0.5210252, 0.09064742, -2.57835, 1, 0, 0, 1, 1,
-0.519224, -0.1846822, -1.953009, 0, 0, 0, 1, 1,
-0.517561, -0.7420047, -2.822033, 0, 0, 0, 1, 1,
-0.5139859, 0.1263492, -0.7719322, 0, 0, 0, 1, 1,
-0.5087271, -0.6352279, -1.639211, 0, 0, 0, 1, 1,
-0.5086634, 1.510368, 0.8346366, 0, 0, 0, 1, 1,
-0.5070139, 0.3665505, -1.282239, 0, 0, 0, 1, 1,
-0.5038123, -0.3087972, -2.02959, 0, 0, 0, 1, 1,
-0.5033655, 0.2941189, -2.663079, 1, 1, 1, 1, 1,
-0.502665, 2.126173, 0.1494735, 1, 1, 1, 1, 1,
-0.5009171, -1.450243, -2.484412, 1, 1, 1, 1, 1,
-0.4988682, -0.01553896, -2.312507, 1, 1, 1, 1, 1,
-0.49864, 2.348377, 1.123393, 1, 1, 1, 1, 1,
-0.4951789, -0.3050434, -1.957869, 1, 1, 1, 1, 1,
-0.4949961, 0.2580558, 1.596165, 1, 1, 1, 1, 1,
-0.4914362, 1.740077, -1.152097, 1, 1, 1, 1, 1,
-0.4882502, 2.717331, -0.4661495, 1, 1, 1, 1, 1,
-0.4873736, 1.249759, -0.9820058, 1, 1, 1, 1, 1,
-0.4859216, -0.9762191, -2.370137, 1, 1, 1, 1, 1,
-0.4852242, -1.15279, -3.279156, 1, 1, 1, 1, 1,
-0.4840999, 1.053105, -1.962056, 1, 1, 1, 1, 1,
-0.482431, 1.80587, -0.03980439, 1, 1, 1, 1, 1,
-0.4818394, -0.1138752, -0.7986072, 1, 1, 1, 1, 1,
-0.4789304, 0.3984954, -0.914625, 0, 0, 1, 1, 1,
-0.476446, -2.54731, -2.366267, 1, 0, 0, 1, 1,
-0.4748339, -1.695565, -2.817383, 1, 0, 0, 1, 1,
-0.4744973, 0.4464607, -0.1534662, 1, 0, 0, 1, 1,
-0.4643499, -0.2366902, -0.7830555, 1, 0, 0, 1, 1,
-0.4633124, 1.422228, -0.4549593, 1, 0, 0, 1, 1,
-0.4558077, -0.08434014, -1.018618, 0, 0, 0, 1, 1,
-0.4530973, 0.1890096, -0.3661985, 0, 0, 0, 1, 1,
-0.4530404, 0.82039, -1.252891, 0, 0, 0, 1, 1,
-0.4521884, 1.4565, -1.287565, 0, 0, 0, 1, 1,
-0.4420441, 0.2466696, -0.6049853, 0, 0, 0, 1, 1,
-0.4361199, -0.5319257, -2.857176, 0, 0, 0, 1, 1,
-0.4355722, -0.6410991, -3.009907, 0, 0, 0, 1, 1,
-0.4342983, 1.080735, 0.8040929, 1, 1, 1, 1, 1,
-0.4332529, 1.732858, 0.4127719, 1, 1, 1, 1, 1,
-0.4315935, 0.770263, -0.5773136, 1, 1, 1, 1, 1,
-0.4276486, -0.6218431, -2.781706, 1, 1, 1, 1, 1,
-0.4244789, -0.9804648, -2.033296, 1, 1, 1, 1, 1,
-0.4239044, 0.465739, 0.08644519, 1, 1, 1, 1, 1,
-0.4235594, 1.098018, -1.739992, 1, 1, 1, 1, 1,
-0.4199443, 1.878045, 1.953768, 1, 1, 1, 1, 1,
-0.4111604, -0.9738682, -3.496665, 1, 1, 1, 1, 1,
-0.4096477, -0.100701, -2.206244, 1, 1, 1, 1, 1,
-0.4068815, 1.183276, 0.1063578, 1, 1, 1, 1, 1,
-0.4068116, -0.6269241, -2.676779, 1, 1, 1, 1, 1,
-0.4032883, -0.002664844, -1.98331, 1, 1, 1, 1, 1,
-0.4017303, 0.1490258, -0.1931587, 1, 1, 1, 1, 1,
-0.3967964, 2.065548, -0.1748259, 1, 1, 1, 1, 1,
-0.3963198, -0.415994, -3.202623, 0, 0, 1, 1, 1,
-0.3887854, -0.9223702, -3.49567, 1, 0, 0, 1, 1,
-0.3870255, -1.292544, -2.390623, 1, 0, 0, 1, 1,
-0.3858134, 0.287711, 0.2669728, 1, 0, 0, 1, 1,
-0.3854234, -2.084073, -1.915842, 1, 0, 0, 1, 1,
-0.3818419, -0.9794224, -2.256222, 1, 0, 0, 1, 1,
-0.3815593, -0.1165028, -2.542889, 0, 0, 0, 1, 1,
-0.3812384, -2.020907, -2.017337, 0, 0, 0, 1, 1,
-0.3801225, 1.238929, -0.03447386, 0, 0, 0, 1, 1,
-0.3793881, 0.9887813, -1.203785, 0, 0, 0, 1, 1,
-0.3785931, 1.794904, -0.9857565, 0, 0, 0, 1, 1,
-0.3783862, 0.2805914, -3.407275, 0, 0, 0, 1, 1,
-0.3767075, 1.300472, 0.01687252, 0, 0, 0, 1, 1,
-0.3684554, 0.8055257, 0.3431246, 1, 1, 1, 1, 1,
-0.3681133, 0.04918964, -2.493848, 1, 1, 1, 1, 1,
-0.3679295, -0.4092355, -2.36692, 1, 1, 1, 1, 1,
-0.3645288, -0.2980724, -3.851684, 1, 1, 1, 1, 1,
-0.3595791, -0.8131742, -0.1197322, 1, 1, 1, 1, 1,
-0.35768, -0.710577, -2.47599, 1, 1, 1, 1, 1,
-0.357082, 1.608501, 0.3227559, 1, 1, 1, 1, 1,
-0.351947, 1.497762, 0.4072812, 1, 1, 1, 1, 1,
-0.3491361, 0.4616604, -0.9382308, 1, 1, 1, 1, 1,
-0.3473394, -1.387666, -1.933378, 1, 1, 1, 1, 1,
-0.3461565, 0.8199021, -1.685972, 1, 1, 1, 1, 1,
-0.3279482, 0.1822269, -2.028702, 1, 1, 1, 1, 1,
-0.3253212, -1.646463, -4.131951, 1, 1, 1, 1, 1,
-0.3240486, -0.3187723, -2.635238, 1, 1, 1, 1, 1,
-0.3199533, -2.243719, -0.7079581, 1, 1, 1, 1, 1,
-0.3195631, 1.094052, -0.4304247, 0, 0, 1, 1, 1,
-0.31515, 0.1851311, -1.76879, 1, 0, 0, 1, 1,
-0.3147059, 0.4254534, -1.533472, 1, 0, 0, 1, 1,
-0.3117279, 0.257484, -1.716514, 1, 0, 0, 1, 1,
-0.3026825, -0.7180666, -4.11915, 1, 0, 0, 1, 1,
-0.3014902, 1.390166, -0.1833774, 1, 0, 0, 1, 1,
-0.2994615, -0.01663574, -2.879476, 0, 0, 0, 1, 1,
-0.2978184, -0.1101024, -2.705136, 0, 0, 0, 1, 1,
-0.2970007, 0.7068131, -0.2482983, 0, 0, 0, 1, 1,
-0.2959999, 0.1392148, -1.699895, 0, 0, 0, 1, 1,
-0.2930416, 0.7738424, -0.5754388, 0, 0, 0, 1, 1,
-0.2925622, -0.7473426, -1.686159, 0, 0, 0, 1, 1,
-0.2925103, -0.457351, -0.5616904, 0, 0, 0, 1, 1,
-0.2899615, 1.442259, 1.089956, 1, 1, 1, 1, 1,
-0.2879764, 0.5241764, 0.396382, 1, 1, 1, 1, 1,
-0.2842161, -1.760566, -2.861791, 1, 1, 1, 1, 1,
-0.2842038, -0.930738, -2.146307, 1, 1, 1, 1, 1,
-0.2753438, -1.034788, -4.427495, 1, 1, 1, 1, 1,
-0.273355, -0.1113693, -1.304174, 1, 1, 1, 1, 1,
-0.2678879, -1.474929, -2.593551, 1, 1, 1, 1, 1,
-0.2633204, 1.345281, -0.07673038, 1, 1, 1, 1, 1,
-0.2631774, -0.894227, -1.713473, 1, 1, 1, 1, 1,
-0.2596498, -0.3829267, -3.994499, 1, 1, 1, 1, 1,
-0.2533648, -0.03249954, -1.613563, 1, 1, 1, 1, 1,
-0.2516063, -1.011138, -2.685386, 1, 1, 1, 1, 1,
-0.2482811, 1.375451, -1.582363, 1, 1, 1, 1, 1,
-0.2459479, 0.2586119, -1.834761, 1, 1, 1, 1, 1,
-0.2421197, 1.23624, -0.8744417, 1, 1, 1, 1, 1,
-0.2324822, 0.9945363, 0.394712, 0, 0, 1, 1, 1,
-0.2308264, -2.392892, -1.90992, 1, 0, 0, 1, 1,
-0.2298669, -0.397731, -3.655435, 1, 0, 0, 1, 1,
-0.2285151, 0.5773207, 0.1356285, 1, 0, 0, 1, 1,
-0.2280684, -0.7368447, -0.8147174, 1, 0, 0, 1, 1,
-0.2278087, 1.1015, -0.5134073, 1, 0, 0, 1, 1,
-0.2212779, 0.7152194, -0.7464651, 0, 0, 0, 1, 1,
-0.2208825, -0.5187923, -1.336143, 0, 0, 0, 1, 1,
-0.2139219, 0.01681959, -2.670849, 0, 0, 0, 1, 1,
-0.2046077, -0.9688194, -1.814869, 0, 0, 0, 1, 1,
-0.2023268, 0.08133846, -0.01207028, 0, 0, 0, 1, 1,
-0.1981435, -0.2573055, -1.536132, 0, 0, 0, 1, 1,
-0.1964029, 2.079634, 0.2396024, 0, 0, 0, 1, 1,
-0.1891202, 1.60537, 2.059992, 1, 1, 1, 1, 1,
-0.1844413, 0.3067941, 1.176671, 1, 1, 1, 1, 1,
-0.1838302, 0.2551199, -1.28003, 1, 1, 1, 1, 1,
-0.1828655, 0.580713, -1.652821, 1, 1, 1, 1, 1,
-0.1779805, 0.1027377, -1.241088, 1, 1, 1, 1, 1,
-0.1739576, -0.01093064, -0.9548324, 1, 1, 1, 1, 1,
-0.1735983, 0.8951805, 1.427769, 1, 1, 1, 1, 1,
-0.1730444, 0.3305283, -0.7078553, 1, 1, 1, 1, 1,
-0.1722752, -0.7205061, -3.632624, 1, 1, 1, 1, 1,
-0.1697966, -0.6941579, -2.754383, 1, 1, 1, 1, 1,
-0.1622121, -0.05581509, -1.752733, 1, 1, 1, 1, 1,
-0.16003, -1.769705, -1.132003, 1, 1, 1, 1, 1,
-0.1594046, 0.1031, -1.474829, 1, 1, 1, 1, 1,
-0.1593429, 0.4765143, 1.277607, 1, 1, 1, 1, 1,
-0.158206, 1.665425, 1.588896, 1, 1, 1, 1, 1,
-0.1528253, 0.1356945, -0.09290609, 0, 0, 1, 1, 1,
-0.1502528, -0.09347387, -1.738292, 1, 0, 0, 1, 1,
-0.1462496, 1.119936, 0.3480829, 1, 0, 0, 1, 1,
-0.1450536, -0.1135247, -0.9895655, 1, 0, 0, 1, 1,
-0.1448545, 0.8948266, 0.880684, 1, 0, 0, 1, 1,
-0.1447868, -1.228421, -3.283314, 1, 0, 0, 1, 1,
-0.1419005, -1.829693, -3.067203, 0, 0, 0, 1, 1,
-0.1364544, 0.8708788, -0.2998361, 0, 0, 0, 1, 1,
-0.1323895, 0.6095009, 0.3914971, 0, 0, 0, 1, 1,
-0.1321746, -0.4681112, -3.466499, 0, 0, 0, 1, 1,
-0.1316079, 1.184897, -0.841753, 0, 0, 0, 1, 1,
-0.1312097, -0.6765325, -3.531838, 0, 0, 0, 1, 1,
-0.1308303, 1.111867, -0.3682868, 0, 0, 0, 1, 1,
-0.1299865, -1.537302, -4.013337, 1, 1, 1, 1, 1,
-0.1276317, -0.6330279, -4.186843, 1, 1, 1, 1, 1,
-0.1267662, -0.8195347, -1.926217, 1, 1, 1, 1, 1,
-0.1253104, 0.1489862, -1.118174, 1, 1, 1, 1, 1,
-0.1225997, 0.4434122, -0.8656185, 1, 1, 1, 1, 1,
-0.1176871, -0.5950533, -3.498422, 1, 1, 1, 1, 1,
-0.1174523, 1.073422, -0.1026193, 1, 1, 1, 1, 1,
-0.1162764, -0.09599517, -0.6529304, 1, 1, 1, 1, 1,
-0.1125836, -0.3754578, -3.565383, 1, 1, 1, 1, 1,
-0.1121026, -0.1546701, -3.972762, 1, 1, 1, 1, 1,
-0.1098324, 0.6144192, 0.02961647, 1, 1, 1, 1, 1,
-0.1084535, 0.2095183, 0.6429693, 1, 1, 1, 1, 1,
-0.1056907, 0.9210379, -1.008932, 1, 1, 1, 1, 1,
-0.1018784, -0.7583477, -3.012065, 1, 1, 1, 1, 1,
-0.09364663, 1.036854, -1.551656, 1, 1, 1, 1, 1,
-0.09065054, -1.384704, -1.093905, 0, 0, 1, 1, 1,
-0.08653443, -0.4086282, -3.001516, 1, 0, 0, 1, 1,
-0.08607955, -1.730154, -3.255938, 1, 0, 0, 1, 1,
-0.08470117, 0.4112251, 0.7488116, 1, 0, 0, 1, 1,
-0.08338957, 1.155557, 1.111049, 1, 0, 0, 1, 1,
-0.08203997, 0.812965, -1.362715, 1, 0, 0, 1, 1,
-0.07442325, 1.02525, -1.212204, 0, 0, 0, 1, 1,
-0.07440925, -1.118253, -2.624277, 0, 0, 0, 1, 1,
-0.06903311, -0.3820736, -3.22762, 0, 0, 0, 1, 1,
-0.06292767, 1.100007, -0.7325427, 0, 0, 0, 1, 1,
-0.0580378, 0.03658463, -0.7604676, 0, 0, 0, 1, 1,
-0.05751695, -1.48916, -2.974532, 0, 0, 0, 1, 1,
-0.05308236, -0.1984001, -1.52233, 0, 0, 0, 1, 1,
-0.04655753, -2.42324, -4.118763, 1, 1, 1, 1, 1,
-0.0460868, -0.9051502, -2.122362, 1, 1, 1, 1, 1,
-0.04602002, 1.073854, 0.2506422, 1, 1, 1, 1, 1,
-0.04478805, -1.258362, -2.4224, 1, 1, 1, 1, 1,
-0.03854313, -0.299483, -2.471348, 1, 1, 1, 1, 1,
-0.03779358, 1.117552, 0.2011659, 1, 1, 1, 1, 1,
-0.0348235, -1.060634, -3.599947, 1, 1, 1, 1, 1,
-0.02678206, 0.4576422, 0.4149149, 1, 1, 1, 1, 1,
-0.02538569, -0.9619706, -4.073665, 1, 1, 1, 1, 1,
-0.02305602, -2.036856, -4.282334, 1, 1, 1, 1, 1,
-0.02222511, 0.2437304, -0.773405, 1, 1, 1, 1, 1,
-0.02199317, 0.2121395, 0.05209859, 1, 1, 1, 1, 1,
-0.01976309, -0.7529015, -3.835122, 1, 1, 1, 1, 1,
-0.01887533, -0.7258872, -5.050617, 1, 1, 1, 1, 1,
-0.01881953, -0.4530536, -3.091189, 1, 1, 1, 1, 1,
-0.01670981, 1.058259, -0.781147, 0, 0, 1, 1, 1,
-0.01597849, -0.8222018, -2.720359, 1, 0, 0, 1, 1,
-0.01460258, 0.0566352, -1.920808, 1, 0, 0, 1, 1,
-0.01353912, -0.4855181, -2.085796, 1, 0, 0, 1, 1,
-0.01172496, 0.2897741, -2.50831, 1, 0, 0, 1, 1,
-0.0112039, 0.6073633, 2.011816, 1, 0, 0, 1, 1,
-0.009815629, 1.00475, -0.4607471, 0, 0, 0, 1, 1,
-0.009455766, 0.435185, 0.9425988, 0, 0, 0, 1, 1,
-0.007569423, -1.17048, -3.640755, 0, 0, 0, 1, 1,
-0.006955143, -0.406935, -5.493398, 0, 0, 0, 1, 1,
-0.003752285, -0.5244789, -2.736088, 0, 0, 0, 1, 1,
-0.001970127, 0.3661733, 1.026425, 0, 0, 0, 1, 1,
-0.00125192, -0.3787064, -4.231893, 0, 0, 0, 1, 1,
0.0016505, 0.7882426, 0.4458699, 1, 1, 1, 1, 1,
0.002867885, 0.2973123, 0.7412693, 1, 1, 1, 1, 1,
0.00353398, -0.3824109, 4.124164, 1, 1, 1, 1, 1,
0.005058951, 0.3285228, -0.1522177, 1, 1, 1, 1, 1,
0.006674966, 0.8101974, 0.754076, 1, 1, 1, 1, 1,
0.007262752, 0.743297, -0.5734949, 1, 1, 1, 1, 1,
0.009070616, 1.174488, 0.8372657, 1, 1, 1, 1, 1,
0.01634074, -0.6946983, 3.074928, 1, 1, 1, 1, 1,
0.025152, 1.947988, -0.9934523, 1, 1, 1, 1, 1,
0.0271049, 0.7083403, 0.9641277, 1, 1, 1, 1, 1,
0.03298995, 0.1499618, -0.4464176, 1, 1, 1, 1, 1,
0.03315078, 0.8080456, -0.3389828, 1, 1, 1, 1, 1,
0.03398916, -0.4040596, 2.884014, 1, 1, 1, 1, 1,
0.03548858, -0.0906181, 1.944301, 1, 1, 1, 1, 1,
0.03649013, -0.4904114, 2.42464, 1, 1, 1, 1, 1,
0.03805316, -0.1701474, 2.745832, 0, 0, 1, 1, 1,
0.04239229, -2.463686, 2.419986, 1, 0, 0, 1, 1,
0.04630243, -1.893204, 3.80409, 1, 0, 0, 1, 1,
0.04632187, -0.861483, 4.343133, 1, 0, 0, 1, 1,
0.04854714, 0.4906128, 1.049889, 1, 0, 0, 1, 1,
0.05087153, 1.111148, -1.855121, 1, 0, 0, 1, 1,
0.0520368, -1.704141, 2.325028, 0, 0, 0, 1, 1,
0.05229703, -0.03814092, 1.608528, 0, 0, 0, 1, 1,
0.05416803, 0.3015061, 1.421967, 0, 0, 0, 1, 1,
0.05460969, 0.8781014, 0.8569588, 0, 0, 0, 1, 1,
0.05471569, 0.3339891, -0.4869741, 0, 0, 0, 1, 1,
0.0571791, -0.7591739, 2.657825, 0, 0, 0, 1, 1,
0.06285349, 1.55189, -1.451838, 0, 0, 0, 1, 1,
0.06908846, 0.3337078, -0.02155048, 1, 1, 1, 1, 1,
0.07088943, 2.075685, 0.608822, 1, 1, 1, 1, 1,
0.07184432, -0.1731752, 1.944145, 1, 1, 1, 1, 1,
0.07815209, 0.6833566, 1.095458, 1, 1, 1, 1, 1,
0.07969305, 0.4187627, -0.2880826, 1, 1, 1, 1, 1,
0.08124439, -0.5349274, 2.321047, 1, 1, 1, 1, 1,
0.09405677, -1.041762, 1.552958, 1, 1, 1, 1, 1,
0.09443586, 0.9720557, -1.909703, 1, 1, 1, 1, 1,
0.09841366, -0.6213233, 4.299756, 1, 1, 1, 1, 1,
0.09915657, -0.4827422, 3.152695, 1, 1, 1, 1, 1,
0.1016694, 2.073602, -0.3564307, 1, 1, 1, 1, 1,
0.1022554, -0.01374897, 2.557811, 1, 1, 1, 1, 1,
0.1029525, -1.279112, 4.375983, 1, 1, 1, 1, 1,
0.1073784, 0.4531034, 0.9495085, 1, 1, 1, 1, 1,
0.1100236, 1.188205, -0.6769681, 1, 1, 1, 1, 1,
0.1103387, 1.537481, -2.676882, 0, 0, 1, 1, 1,
0.1124785, -0.7543785, 1.129734, 1, 0, 0, 1, 1,
0.1170548, -1.56347, 3.75088, 1, 0, 0, 1, 1,
0.1193557, 1.723634, 0.8907107, 1, 0, 0, 1, 1,
0.1205041, -0.4006659, 3.369309, 1, 0, 0, 1, 1,
0.1241004, -0.1147546, 2.533523, 1, 0, 0, 1, 1,
0.1261684, -0.0108772, 1.195877, 0, 0, 0, 1, 1,
0.128048, 0.0829316, 0.4400878, 0, 0, 0, 1, 1,
0.1287887, 1.206366, 0.2589397, 0, 0, 0, 1, 1,
0.1295742, 1.660643, -0.1573516, 0, 0, 0, 1, 1,
0.1383432, 0.255303, -1.863703, 0, 0, 0, 1, 1,
0.1393858, 0.2936046, 0.1198725, 0, 0, 0, 1, 1,
0.1395819, -0.6960758, 4.083629, 0, 0, 0, 1, 1,
0.1411982, -2.271855, 2.112999, 1, 1, 1, 1, 1,
0.1427816, -0.3248248, 2.80557, 1, 1, 1, 1, 1,
0.1449073, 0.7973646, -0.3339913, 1, 1, 1, 1, 1,
0.1479646, -0.007386495, 2.403506, 1, 1, 1, 1, 1,
0.1498419, 1.802126, 0.2234846, 1, 1, 1, 1, 1,
0.153079, 0.09009989, 0.5490874, 1, 1, 1, 1, 1,
0.1555106, 0.5781495, -0.4736626, 1, 1, 1, 1, 1,
0.1568726, -0.1430287, 3.507928, 1, 1, 1, 1, 1,
0.1582001, -0.7750992, 1.210739, 1, 1, 1, 1, 1,
0.1609856, 0.1013411, 0.9946465, 1, 1, 1, 1, 1,
0.1618726, 1.418889, 0.3470384, 1, 1, 1, 1, 1,
0.1653761, -0.5405062, 2.297814, 1, 1, 1, 1, 1,
0.1666322, -1.222512, 2.710354, 1, 1, 1, 1, 1,
0.1677633, -2.100922, 3.264832, 1, 1, 1, 1, 1,
0.1693629, 0.2281246, 0.7274248, 1, 1, 1, 1, 1,
0.1754724, -0.5166559, 1.964144, 0, 0, 1, 1, 1,
0.1761966, -0.6905704, 4.31982, 1, 0, 0, 1, 1,
0.1768144, -1.302909, 3.60942, 1, 0, 0, 1, 1,
0.1777917, -0.01508657, 1.577627, 1, 0, 0, 1, 1,
0.1851575, -0.307697, 2.862233, 1, 0, 0, 1, 1,
0.1876373, 0.09826964, 3.181958, 1, 0, 0, 1, 1,
0.187801, -1.816666, 2.698584, 0, 0, 0, 1, 1,
0.189049, -0.816619, 3.359676, 0, 0, 0, 1, 1,
0.1903276, 0.8986185, -1.028866, 0, 0, 0, 1, 1,
0.1973602, -1.143108, 1.686535, 0, 0, 0, 1, 1,
0.201089, -0.6170238, 3.512635, 0, 0, 0, 1, 1,
0.2018981, -2.459665, 2.273053, 0, 0, 0, 1, 1,
0.2045772, -1.822704, 2.945706, 0, 0, 0, 1, 1,
0.2053594, -1.089767, 3.581362, 1, 1, 1, 1, 1,
0.2163287, 0.8681781, -2.870986, 1, 1, 1, 1, 1,
0.2163402, 1.083462, 0.4698464, 1, 1, 1, 1, 1,
0.2227154, -0.8705897, 3.553199, 1, 1, 1, 1, 1,
0.2229807, -1.375027, 0.08748933, 1, 1, 1, 1, 1,
0.2344646, -0.05835781, 0.8976167, 1, 1, 1, 1, 1,
0.2353031, 0.8671916, 0.2370334, 1, 1, 1, 1, 1,
0.2356287, 0.4260855, -0.4024208, 1, 1, 1, 1, 1,
0.2367087, -0.4797312, 3.885097, 1, 1, 1, 1, 1,
0.2370037, -0.0136112, -0.09375542, 1, 1, 1, 1, 1,
0.2370352, 1.501441, 0.1381633, 1, 1, 1, 1, 1,
0.2385702, -1.528527, 2.5905, 1, 1, 1, 1, 1,
0.2389509, 0.1508184, 1.754781, 1, 1, 1, 1, 1,
0.2416115, 2.463341, 0.423912, 1, 1, 1, 1, 1,
0.2428768, 1.602585, 2.407034, 1, 1, 1, 1, 1,
0.2437165, 1.618954, -0.2984546, 0, 0, 1, 1, 1,
0.2471169, -0.4227798, 3.067609, 1, 0, 0, 1, 1,
0.2504447, 0.02816566, 1.260294, 1, 0, 0, 1, 1,
0.2524346, 0.005917581, 1.419978, 1, 0, 0, 1, 1,
0.2550894, 0.05000741, 1.402081, 1, 0, 0, 1, 1,
0.2607122, 0.4479827, -0.08313539, 1, 0, 0, 1, 1,
0.2621317, 0.1793849, 1.795718, 0, 0, 0, 1, 1,
0.2650199, -0.5961055, 2.82982, 0, 0, 0, 1, 1,
0.265935, -1.335796, 3.221755, 0, 0, 0, 1, 1,
0.266821, -1.018464, 3.606783, 0, 0, 0, 1, 1,
0.269441, 1.177871, 1.999343, 0, 0, 0, 1, 1,
0.2704787, -0.457103, 1.125855, 0, 0, 0, 1, 1,
0.270837, 1.217752, 0.8323729, 0, 0, 0, 1, 1,
0.2720414, 0.01773694, 1.793734, 1, 1, 1, 1, 1,
0.272407, -0.8826404, 4.23127, 1, 1, 1, 1, 1,
0.278349, 0.8475925, 1.464589, 1, 1, 1, 1, 1,
0.2786793, 0.9482625, 0.4190322, 1, 1, 1, 1, 1,
0.2801317, 1.869585, -0.9031399, 1, 1, 1, 1, 1,
0.2804826, -1.071857, 2.879608, 1, 1, 1, 1, 1,
0.28415, -1.838338, 3.307159, 1, 1, 1, 1, 1,
0.2886382, 0.6646909, 2.648453, 1, 1, 1, 1, 1,
0.2893689, 1.004891, 1.68271, 1, 1, 1, 1, 1,
0.2940465, 0.05685481, 1.231164, 1, 1, 1, 1, 1,
0.296001, -0.3241335, 3.185474, 1, 1, 1, 1, 1,
0.3010607, -1.347578, 1.671876, 1, 1, 1, 1, 1,
0.3015062, -1.00957, 4.544517, 1, 1, 1, 1, 1,
0.302026, 1.713276, 0.3644176, 1, 1, 1, 1, 1,
0.3039041, 1.738997, 0.0118757, 1, 1, 1, 1, 1,
0.3059258, 0.1305069, -0.6993085, 0, 0, 1, 1, 1,
0.3108546, 2.621613, -0.126277, 1, 0, 0, 1, 1,
0.3129385, 0.009926507, 0.8917584, 1, 0, 0, 1, 1,
0.3167002, -1.701282, 2.595945, 1, 0, 0, 1, 1,
0.3176422, 1.263635, 0.9536456, 1, 0, 0, 1, 1,
0.3207114, 1.202877, -0.2033886, 1, 0, 0, 1, 1,
0.3225598, -1.233309, 1.574142, 0, 0, 0, 1, 1,
0.324464, 1.103372, 0.7139515, 0, 0, 0, 1, 1,
0.327387, -0.5312428, 4.913301, 0, 0, 0, 1, 1,
0.3280605, 0.1529351, 2.576861, 0, 0, 0, 1, 1,
0.3291025, -0.4754427, 0.9016852, 0, 0, 0, 1, 1,
0.3326723, 1.438551, -1.808951, 0, 0, 0, 1, 1,
0.3327036, 0.2100944, 3.659427, 0, 0, 0, 1, 1,
0.3329952, -0.9648754, 3.743448, 1, 1, 1, 1, 1,
0.3410901, 0.5141336, -0.1866634, 1, 1, 1, 1, 1,
0.3433901, 0.2625775, 0.08979263, 1, 1, 1, 1, 1,
0.3442885, -0.1552846, 4.376342, 1, 1, 1, 1, 1,
0.3469188, -0.2787564, 3.135674, 1, 1, 1, 1, 1,
0.3478135, 0.4554179, -0.348284, 1, 1, 1, 1, 1,
0.3514255, -2.494796, 3.51579, 1, 1, 1, 1, 1,
0.352524, 0.2583538, 1.483638, 1, 1, 1, 1, 1,
0.3588697, 0.059983, 1.079939, 1, 1, 1, 1, 1,
0.3605949, 1.183374, -0.6697638, 1, 1, 1, 1, 1,
0.361437, 1.945868, -0.6867896, 1, 1, 1, 1, 1,
0.3638099, -0.4602129, 2.067925, 1, 1, 1, 1, 1,
0.3666204, -1.214148, 0.9667374, 1, 1, 1, 1, 1,
0.3698534, -0.310211, 1.255685, 1, 1, 1, 1, 1,
0.3700121, -0.3526, 2.878128, 1, 1, 1, 1, 1,
0.3729185, -1.513643, 2.776885, 0, 0, 1, 1, 1,
0.3735661, 0.4094421, 1.536417, 1, 0, 0, 1, 1,
0.3751318, 0.02585529, 0.7628276, 1, 0, 0, 1, 1,
0.3757613, 0.2552221, 0.5212858, 1, 0, 0, 1, 1,
0.3796856, 0.88994, -0.319258, 1, 0, 0, 1, 1,
0.3803615, 0.6745513, 1.790713, 1, 0, 0, 1, 1,
0.3811857, -2.38138, 4.725544, 0, 0, 0, 1, 1,
0.3864508, -0.5587365, 1.006757, 0, 0, 0, 1, 1,
0.3898783, -1.110744, 3.959332, 0, 0, 0, 1, 1,
0.3946371, 0.1554762, 2.36605, 0, 0, 0, 1, 1,
0.3972027, -0.6262178, 3.873553, 0, 0, 0, 1, 1,
0.4010522, 1.550768, 0.4118364, 0, 0, 0, 1, 1,
0.4013118, 1.365224, -0.2587921, 0, 0, 0, 1, 1,
0.4029894, 1.342416, 0.6759814, 1, 1, 1, 1, 1,
0.4033618, -1.339456, 2.764915, 1, 1, 1, 1, 1,
0.4039031, 0.6886171, 0.8773665, 1, 1, 1, 1, 1,
0.4042454, 1.128595, -0.4397471, 1, 1, 1, 1, 1,
0.4105065, -0.310145, 2.28793, 1, 1, 1, 1, 1,
0.4131529, -0.4189004, 3.049717, 1, 1, 1, 1, 1,
0.417681, 1.046995, 1.365976, 1, 1, 1, 1, 1,
0.4196628, -0.5816985, 3.033589, 1, 1, 1, 1, 1,
0.4247833, -1.080725, 2.907922, 1, 1, 1, 1, 1,
0.4250373, 0.1156888, 0.7002381, 1, 1, 1, 1, 1,
0.4281168, 0.8933986, 0.8171794, 1, 1, 1, 1, 1,
0.4282114, 0.7330738, -0.3743125, 1, 1, 1, 1, 1,
0.4320273, -0.3004961, 1.84858, 1, 1, 1, 1, 1,
0.4328618, 0.6930405, -0.4748831, 1, 1, 1, 1, 1,
0.4389639, -1.73008, 4.309717, 1, 1, 1, 1, 1,
0.4406985, -0.563859, 3.548107, 0, 0, 1, 1, 1,
0.4451805, -0.01800954, -1.142457, 1, 0, 0, 1, 1,
0.4481196, 0.9808517, 0.1916479, 1, 0, 0, 1, 1,
0.450076, 0.9828538, -1.645929, 1, 0, 0, 1, 1,
0.4504678, 0.3285235, -0.2776169, 1, 0, 0, 1, 1,
0.4528999, -0.6142358, 3.19774, 1, 0, 0, 1, 1,
0.4536613, -1.002069, 3.635867, 0, 0, 0, 1, 1,
0.4547764, -0.3764541, 2.583859, 0, 0, 0, 1, 1,
0.4552118, -1.307577, 2.078839, 0, 0, 0, 1, 1,
0.4589275, 0.7465604, -0.152966, 0, 0, 0, 1, 1,
0.4595772, 0.08897879, 0.3930634, 0, 0, 0, 1, 1,
0.4642633, 0.01527977, 0.03703155, 0, 0, 0, 1, 1,
0.469215, -1.022112, 2.590045, 0, 0, 0, 1, 1,
0.4719463, 1.127945, -1.558147, 1, 1, 1, 1, 1,
0.4727837, 0.8976637, 0.9135989, 1, 1, 1, 1, 1,
0.4729888, -0.487039, 4.498532, 1, 1, 1, 1, 1,
0.4768468, -1.366703, 4.066928, 1, 1, 1, 1, 1,
0.4792937, -1.057449, 1.532044, 1, 1, 1, 1, 1,
0.4796699, 1.006403, -0.4145174, 1, 1, 1, 1, 1,
0.485758, -0.7483873, 1.035575, 1, 1, 1, 1, 1,
0.4857664, 1.122593, 1.299164, 1, 1, 1, 1, 1,
0.4857773, -0.1854036, 2.484783, 1, 1, 1, 1, 1,
0.4882763, -1.615711, 1.697037, 1, 1, 1, 1, 1,
0.4997376, 2.187539, -0.4020591, 1, 1, 1, 1, 1,
0.5016242, 1.116832, -2.355195, 1, 1, 1, 1, 1,
0.5020254, -0.9990238, 0.4098721, 1, 1, 1, 1, 1,
0.5032978, 0.8006455, -0.9547544, 1, 1, 1, 1, 1,
0.5043409, 0.615994, 0.7107454, 1, 1, 1, 1, 1,
0.5119875, -1.169286, 2.291787, 0, 0, 1, 1, 1,
0.5128119, 0.3016619, 1.047054, 1, 0, 0, 1, 1,
0.518106, 0.1008599, 0.2706851, 1, 0, 0, 1, 1,
0.5182815, 0.9602903, 0.4500003, 1, 0, 0, 1, 1,
0.5209924, 0.1646566, 2.839898, 1, 0, 0, 1, 1,
0.5285143, -1.557925, 1.814262, 1, 0, 0, 1, 1,
0.5326926, 1.811385, 0.4904853, 0, 0, 0, 1, 1,
0.5390434, -0.4352285, 2.051358, 0, 0, 0, 1, 1,
0.539265, 2.014516, 1.010854, 0, 0, 0, 1, 1,
0.5602286, 0.3617579, 1.122222, 0, 0, 0, 1, 1,
0.5734653, 0.4965919, 0.676669, 0, 0, 0, 1, 1,
0.5752707, -0.466435, 3.005858, 0, 0, 0, 1, 1,
0.5812679, -0.9376214, 4.171012, 0, 0, 0, 1, 1,
0.582235, 0.4345721, 0.9594685, 1, 1, 1, 1, 1,
0.585153, 0.6336764, 0.6190407, 1, 1, 1, 1, 1,
0.5855436, -0.9233379, 4.054533, 1, 1, 1, 1, 1,
0.5863059, 0.2527908, 2.136316, 1, 1, 1, 1, 1,
0.5912645, -0.2132823, 2.55711, 1, 1, 1, 1, 1,
0.5938535, -0.5708729, 3.972127, 1, 1, 1, 1, 1,
0.5951607, 1.513438, 0.8579701, 1, 1, 1, 1, 1,
0.5956394, -0.7248479, 1.41873, 1, 1, 1, 1, 1,
0.5973243, 0.9487957, -0.3640431, 1, 1, 1, 1, 1,
0.601799, -0.1177661, 1.495786, 1, 1, 1, 1, 1,
0.6067663, 0.007822813, 0.296433, 1, 1, 1, 1, 1,
0.6119912, 0.7536066, 0.06780541, 1, 1, 1, 1, 1,
0.6172588, -0.1488863, 1.011628, 1, 1, 1, 1, 1,
0.6195225, 0.5803765, -0.9128661, 1, 1, 1, 1, 1,
0.6203492, 0.5538162, 0.2607753, 1, 1, 1, 1, 1,
0.6271297, -0.4149284, 1.386661, 0, 0, 1, 1, 1,
0.632822, 0.2037339, -0.01521804, 1, 0, 0, 1, 1,
0.6349438, -1.092459, 3.935875, 1, 0, 0, 1, 1,
0.6448714, -0.2342677, -0.05459582, 1, 0, 0, 1, 1,
0.651219, 0.3736103, 1.719972, 1, 0, 0, 1, 1,
0.6555804, 0.7454481, 1.528071, 1, 0, 0, 1, 1,
0.6559379, 1.827899, 0.7451571, 0, 0, 0, 1, 1,
0.6626558, -0.350648, 1.776566, 0, 0, 0, 1, 1,
0.6717628, -2.994951, 3.328347, 0, 0, 0, 1, 1,
0.6752456, -0.3680868, 1.359909, 0, 0, 0, 1, 1,
0.675385, -1.150945, 2.546974, 0, 0, 0, 1, 1,
0.6818163, -0.2285922, -0.03745405, 0, 0, 0, 1, 1,
0.685516, -0.8759342, 3.736825, 0, 0, 0, 1, 1,
0.6901265, -0.225191, 1.588327, 1, 1, 1, 1, 1,
0.6936668, 1.094179, 0.5739058, 1, 1, 1, 1, 1,
0.7069818, 0.130194, 2.543311, 1, 1, 1, 1, 1,
0.7203814, 0.6762568, 0.3286477, 1, 1, 1, 1, 1,
0.722241, -1.088147, 2.383662, 1, 1, 1, 1, 1,
0.7224845, -0.3462813, 1.629652, 1, 1, 1, 1, 1,
0.7241791, 1.670856, 0.5376221, 1, 1, 1, 1, 1,
0.7250361, 1.512586, 0.4954796, 1, 1, 1, 1, 1,
0.7252226, 1.189227, 2.074253, 1, 1, 1, 1, 1,
0.726585, -0.4784891, 2.825541, 1, 1, 1, 1, 1,
0.729438, 0.8379089, 1.729867, 1, 1, 1, 1, 1,
0.7313818, 0.02025763, 1.691371, 1, 1, 1, 1, 1,
0.7457042, -0.3364058, 1.409053, 1, 1, 1, 1, 1,
0.7460071, 0.3717171, 0.8612334, 1, 1, 1, 1, 1,
0.7471434, -1.122626, 1.92072, 1, 1, 1, 1, 1,
0.7506709, 1.353728, 0.8247762, 0, 0, 1, 1, 1,
0.7519416, 0.1138822, 1.632991, 1, 0, 0, 1, 1,
0.7525548, 0.3859423, 0.9511733, 1, 0, 0, 1, 1,
0.7557961, 0.7052076, 1.187299, 1, 0, 0, 1, 1,
0.756871, 1.385748, 2.167204, 1, 0, 0, 1, 1,
0.7610311, -0.4488682, 1.921789, 1, 0, 0, 1, 1,
0.7651513, 0.9282752, 1.912028, 0, 0, 0, 1, 1,
0.7655327, -0.4820588, 2.860795, 0, 0, 0, 1, 1,
0.7662511, -0.6094941, 1.237296, 0, 0, 0, 1, 1,
0.7706692, 0.1294015, 3.27722, 0, 0, 0, 1, 1,
0.7708304, -0.2974884, 0.7805123, 0, 0, 0, 1, 1,
0.771884, 0.2905488, 0.97918, 0, 0, 0, 1, 1,
0.7732571, 2.62247, 0.8294558, 0, 0, 0, 1, 1,
0.7749381, 0.7550393, -0.1865747, 1, 1, 1, 1, 1,
0.7804694, -1.680233, 1.666747, 1, 1, 1, 1, 1,
0.7860488, -0.576498, 2.950863, 1, 1, 1, 1, 1,
0.7902229, -0.06127188, 2.472275, 1, 1, 1, 1, 1,
0.7916824, 1.096518, 1.626989, 1, 1, 1, 1, 1,
0.8023681, -0.8506421, 0.1616571, 1, 1, 1, 1, 1,
0.804629, 1.114879, 1.81614, 1, 1, 1, 1, 1,
0.8055383, 0.2531641, 1.246902, 1, 1, 1, 1, 1,
0.8132965, -0.9451966, 1.944874, 1, 1, 1, 1, 1,
0.8150365, -1.853073, 3.022046, 1, 1, 1, 1, 1,
0.815977, -0.8908893, 3.172632, 1, 1, 1, 1, 1,
0.8175967, 0.1392907, 1.837117, 1, 1, 1, 1, 1,
0.8184174, 0.6576448, 1.147111, 1, 1, 1, 1, 1,
0.819563, -1.256369, 2.521566, 1, 1, 1, 1, 1,
0.820782, 1.141847, -0.1867484, 1, 1, 1, 1, 1,
0.8227165, 2.370807, 0.8991569, 0, 0, 1, 1, 1,
0.8255218, -0.8392448, 2.068381, 1, 0, 0, 1, 1,
0.8271459, 0.7936828, -0.1814173, 1, 0, 0, 1, 1,
0.8289043, 0.1513586, 1.932671, 1, 0, 0, 1, 1,
0.8295673, 0.3452526, 2.221218, 1, 0, 0, 1, 1,
0.8447238, 0.3660882, 1.135487, 1, 0, 0, 1, 1,
0.8456495, -1.355913, 3.985401, 0, 0, 0, 1, 1,
0.8497599, -1.39574, 1.809949, 0, 0, 0, 1, 1,
0.8546444, -0.9844815, 3.3789, 0, 0, 0, 1, 1,
0.8548547, 1.512252, -0.4625133, 0, 0, 0, 1, 1,
0.8600873, 0.5785602, 0.7841536, 0, 0, 0, 1, 1,
0.8668362, -1.949134, 2.781034, 0, 0, 0, 1, 1,
0.8670362, 0.6110178, 0.08958369, 0, 0, 0, 1, 1,
0.8722156, -0.8225814, 1.376837, 1, 1, 1, 1, 1,
0.8777823, -0.006716156, 1.274269, 1, 1, 1, 1, 1,
0.8862239, -0.2457194, 1.633762, 1, 1, 1, 1, 1,
0.8875673, 0.5535177, 3.58896, 1, 1, 1, 1, 1,
0.8905751, 0.1217439, 1.614621, 1, 1, 1, 1, 1,
0.8924581, 0.7058652, 0.3528313, 1, 1, 1, 1, 1,
0.8955424, -0.2839131, 0.7700987, 1, 1, 1, 1, 1,
0.9018359, 0.2834871, 0.8903776, 1, 1, 1, 1, 1,
0.9093754, -1.564497, 3.203406, 1, 1, 1, 1, 1,
0.9105586, 1.619142, 1.741135, 1, 1, 1, 1, 1,
0.9257169, -1.902851, 3.701785, 1, 1, 1, 1, 1,
0.926316, 0.6688731, 0.1096245, 1, 1, 1, 1, 1,
0.9343594, -0.467486, 2.284526, 1, 1, 1, 1, 1,
0.9453287, -0.4665362, 2.63926, 1, 1, 1, 1, 1,
0.9505911, -0.5647935, 1.930601, 1, 1, 1, 1, 1,
0.951509, 1.738495, 1.44027, 0, 0, 1, 1, 1,
0.9594401, -0.0183456, -1.253586, 1, 0, 0, 1, 1,
0.9724175, -1.021037, 0.2642552, 1, 0, 0, 1, 1,
0.9778038, 1.296027, 1.271762, 1, 0, 0, 1, 1,
0.9824716, -0.8918093, 1.685953, 1, 0, 0, 1, 1,
0.9906355, -0.3826606, 1.233025, 1, 0, 0, 1, 1,
0.9924899, -0.9191607, 0.9372205, 0, 0, 0, 1, 1,
0.9968169, 0.9180723, 0.9811916, 0, 0, 0, 1, 1,
1.001105, 2.243661, -0.5842913, 0, 0, 0, 1, 1,
1.001207, -1.632101, 3.840395, 0, 0, 0, 1, 1,
1.003594, -0.9309852, 1.153409, 0, 0, 0, 1, 1,
1.014253, -1.76515, 3.25439, 0, 0, 0, 1, 1,
1.017297, -1.398344, 1.81456, 0, 0, 0, 1, 1,
1.022079, 0.8733937, 0.5443107, 1, 1, 1, 1, 1,
1.026303, -0.2068825, 2.891182, 1, 1, 1, 1, 1,
1.034207, -1.675404, 3.493556, 1, 1, 1, 1, 1,
1.034279, 0.7785729, 1.866015, 1, 1, 1, 1, 1,
1.036262, -0.2751471, 2.89694, 1, 1, 1, 1, 1,
1.037081, -1.31443, 0.9821365, 1, 1, 1, 1, 1,
1.047675, -0.7243057, 3.592509, 1, 1, 1, 1, 1,
1.048309, -0.3028792, 1.278621, 1, 1, 1, 1, 1,
1.049583, -0.09893127, 1.353639, 1, 1, 1, 1, 1,
1.053262, 0.9616624, 0.9001624, 1, 1, 1, 1, 1,
1.053448, 1.171153, 0.5722651, 1, 1, 1, 1, 1,
1.053751, 0.8078563, -1.062253, 1, 1, 1, 1, 1,
1.059374, -0.9308776, 3.075487, 1, 1, 1, 1, 1,
1.060687, 0.8900339, 0.4680083, 1, 1, 1, 1, 1,
1.060907, -0.9405251, 2.768888, 1, 1, 1, 1, 1,
1.064483, 0.1860858, 3.388766, 0, 0, 1, 1, 1,
1.081707, -0.5683782, 3.65253, 1, 0, 0, 1, 1,
1.08463, -0.660006, 1.430835, 1, 0, 0, 1, 1,
1.091374, -1.905844, 3.244314, 1, 0, 0, 1, 1,
1.10173, 0.6693459, 0.4095804, 1, 0, 0, 1, 1,
1.107317, 0.8787047, 0.1503681, 1, 0, 0, 1, 1,
1.119279, 1.879644, -1.342341, 0, 0, 0, 1, 1,
1.123867, -1.12475, 2.094689, 0, 0, 0, 1, 1,
1.124496, 2.175805, 0.2770115, 0, 0, 0, 1, 1,
1.137767, -1.051459, 3.778404, 0, 0, 0, 1, 1,
1.140864, -0.8399644, 2.511647, 0, 0, 0, 1, 1,
1.144912, -0.187485, 0.04394709, 0, 0, 0, 1, 1,
1.148237, -0.03235041, 0.1199434, 0, 0, 0, 1, 1,
1.162135, 1.545658, 0.3795824, 1, 1, 1, 1, 1,
1.173221, 0.8734366, -0.4040809, 1, 1, 1, 1, 1,
1.177473, -0.5578092, 2.696987, 1, 1, 1, 1, 1,
1.194285, 1.920532, 0.07705746, 1, 1, 1, 1, 1,
1.196366, 1.266175, 1.614516, 1, 1, 1, 1, 1,
1.19834, -1.145137, 3.082661, 1, 1, 1, 1, 1,
1.204432, 0.6954534, 0.1102188, 1, 1, 1, 1, 1,
1.218854, 0.4167097, 2.330294, 1, 1, 1, 1, 1,
1.221902, -0.7301149, 1.987987, 1, 1, 1, 1, 1,
1.241184, 0.4842336, 1.786628, 1, 1, 1, 1, 1,
1.241954, -1.196078, 2.290676, 1, 1, 1, 1, 1,
1.242953, -0.2484145, 1.140942, 1, 1, 1, 1, 1,
1.250524, -1.390557, 1.308396, 1, 1, 1, 1, 1,
1.253569, 0.01203972, 1.291315, 1, 1, 1, 1, 1,
1.254061, -1.161804, 2.526765, 1, 1, 1, 1, 1,
1.256184, -2.639703, 3.35247, 0, 0, 1, 1, 1,
1.256752, -1.475088, 3.9785, 1, 0, 0, 1, 1,
1.257297, 1.567226, 3.207317, 1, 0, 0, 1, 1,
1.270313, 0.5142537, 3.172989, 1, 0, 0, 1, 1,
1.283114, -1.200326, 3.023455, 1, 0, 0, 1, 1,
1.283408, 1.669873, 0.1413214, 1, 0, 0, 1, 1,
1.290232, 0.6497396, 2.590711, 0, 0, 0, 1, 1,
1.294302, 0.007896068, 2.635142, 0, 0, 0, 1, 1,
1.294664, -0.7443236, 1.711258, 0, 0, 0, 1, 1,
1.300288, 0.2229564, 2.883515, 0, 0, 0, 1, 1,
1.322968, -0.4151501, 2.800846, 0, 0, 0, 1, 1,
1.324112, 0.4530612, 1.114329, 0, 0, 0, 1, 1,
1.326362, 1.118125, 1.235026, 0, 0, 0, 1, 1,
1.328656, 0.2970671, 1.696666, 1, 1, 1, 1, 1,
1.338312, -1.046761, 2.211803, 1, 1, 1, 1, 1,
1.340077, 1.003416, 1.532179, 1, 1, 1, 1, 1,
1.340179, -1.290231, 1.550729, 1, 1, 1, 1, 1,
1.341301, 0.7167031, -1.137656, 1, 1, 1, 1, 1,
1.358605, -1.206504, 4.036721, 1, 1, 1, 1, 1,
1.361539, -0.5826515, 1.690946, 1, 1, 1, 1, 1,
1.370768, -0.7662691, 1.929449, 1, 1, 1, 1, 1,
1.371621, -0.5048794, 1.31357, 1, 1, 1, 1, 1,
1.381558, 0.6020597, 2.226308, 1, 1, 1, 1, 1,
1.381559, -0.1296484, 2.200387, 1, 1, 1, 1, 1,
1.393263, 0.8729675, 0.4687071, 1, 1, 1, 1, 1,
1.404392, -0.34987, 1.70243, 1, 1, 1, 1, 1,
1.40776, 0.1219047, 1.642531, 1, 1, 1, 1, 1,
1.41078, 0.9383313, 1.455742, 1, 1, 1, 1, 1,
1.414698, -0.3020598, 2.026019, 0, 0, 1, 1, 1,
1.420688, 0.3741965, 1.480126, 1, 0, 0, 1, 1,
1.423157, 0.1473741, 1.014624, 1, 0, 0, 1, 1,
1.435268, 0.4687009, 1.12357, 1, 0, 0, 1, 1,
1.446222, 0.1381161, 2.538317, 1, 0, 0, 1, 1,
1.45326, 1.702829, 1.029417, 1, 0, 0, 1, 1,
1.457194, -1.52007, -0.5512243, 0, 0, 0, 1, 1,
1.458886, -1.621778, 2.863484, 0, 0, 0, 1, 1,
1.461012, 0.08502136, 1.778339, 0, 0, 0, 1, 1,
1.49887, -0.4210376, 1.833999, 0, 0, 0, 1, 1,
1.504415, -0.4032116, 1.433806, 0, 0, 0, 1, 1,
1.521204, -0.6537446, 1.758352, 0, 0, 0, 1, 1,
1.523182, -1.375694, 0.4287196, 0, 0, 0, 1, 1,
1.530428, 0.3544173, 1.843894, 1, 1, 1, 1, 1,
1.542973, 0.4157243, 1.983694, 1, 1, 1, 1, 1,
1.543435, 1.123921, 2.266295, 1, 1, 1, 1, 1,
1.549874, -0.2653113, 1.329795, 1, 1, 1, 1, 1,
1.5504, -0.3252008, 0.9954059, 1, 1, 1, 1, 1,
1.555981, -0.09488824, 2.509293, 1, 1, 1, 1, 1,
1.556407, 1.359674, 0.1298777, 1, 1, 1, 1, 1,
1.556627, -0.8707671, 2.227114, 1, 1, 1, 1, 1,
1.568068, 0.1378117, 0.6161594, 1, 1, 1, 1, 1,
1.573462, -0.2806472, 1.053735, 1, 1, 1, 1, 1,
1.605852, -0.2847922, 3.006186, 1, 1, 1, 1, 1,
1.613316, 0.7457398, 2.626163, 1, 1, 1, 1, 1,
1.630549, -1.392102, 1.102655, 1, 1, 1, 1, 1,
1.633009, 0.2721535, 1.316673, 1, 1, 1, 1, 1,
1.633074, -2.724937, 2.474277, 1, 1, 1, 1, 1,
1.658558, -1.616351, 2.7567, 0, 0, 1, 1, 1,
1.672823, -0.1990415, 3.181569, 1, 0, 0, 1, 1,
1.689275, 0.3040312, 1.198894, 1, 0, 0, 1, 1,
1.719539, -0.2487315, 1.165517, 1, 0, 0, 1, 1,
1.720918, -0.1308258, 0.1089365, 1, 0, 0, 1, 1,
1.725457, -1.487325, 3.032558, 1, 0, 0, 1, 1,
1.727216, 1.126996, 1.365561, 0, 0, 0, 1, 1,
1.73251, -0.2630921, 0.9910765, 0, 0, 0, 1, 1,
1.740124, -1.640012, 2.061454, 0, 0, 0, 1, 1,
1.749394, -0.151884, 2.086734, 0, 0, 0, 1, 1,
1.771048, 1.255274, 0.7548503, 0, 0, 0, 1, 1,
1.783666, -1.201545, 1.770966, 0, 0, 0, 1, 1,
1.799539, 0.7527894, 1.025819, 0, 0, 0, 1, 1,
1.843069, 1.364896, 1.684937, 1, 1, 1, 1, 1,
1.883267, -0.3685343, 0.7553849, 1, 1, 1, 1, 1,
1.912987, 0.3225234, 0.2767532, 1, 1, 1, 1, 1,
1.916924, -0.5031751, 1.970524, 1, 1, 1, 1, 1,
1.957036, -0.2563711, -0.2045712, 1, 1, 1, 1, 1,
1.9864, 1.790279, 0.6629214, 1, 1, 1, 1, 1,
1.991535, 0.6444939, 2.149246, 1, 1, 1, 1, 1,
2.001438, -0.7084621, 0.6618094, 1, 1, 1, 1, 1,
2.00663, -0.6701816, 1.732006, 1, 1, 1, 1, 1,
2.018101, -0.2111717, 1.661564, 1, 1, 1, 1, 1,
2.025284, 1.774927, 1.33007, 1, 1, 1, 1, 1,
2.027526, 1.656175, -1.226416, 1, 1, 1, 1, 1,
2.029456, 0.2316311, 1.350842, 1, 1, 1, 1, 1,
2.050947, -2.230777, 0.7715713, 1, 1, 1, 1, 1,
2.080736, 0.2488037, 0.6215947, 1, 1, 1, 1, 1,
2.081659, 2.877282, 0.245619, 0, 0, 1, 1, 1,
2.113764, 0.02185888, 0.9930439, 1, 0, 0, 1, 1,
2.116987, -0.1970701, 0.182996, 1, 0, 0, 1, 1,
2.217963, 0.5070447, -0.3337626, 1, 0, 0, 1, 1,
2.22775, 0.02794465, 1.467066, 1, 0, 0, 1, 1,
2.274757, -1.252104, 1.259393, 1, 0, 0, 1, 1,
2.306971, 1.856749, 2.328749, 0, 0, 0, 1, 1,
2.322081, -1.433882, 1.300692, 0, 0, 0, 1, 1,
2.358191, -0.6758738, 1.839569, 0, 0, 0, 1, 1,
2.363662, 0.4617364, 0.8153314, 0, 0, 0, 1, 1,
2.37569, -1.527449, 3.873894, 0, 0, 0, 1, 1,
2.378233, 0.8398411, -0.838066, 0, 0, 0, 1, 1,
2.485732, 1.750176, -0.3099784, 0, 0, 0, 1, 1,
2.509817, 0.5065564, 2.352509, 1, 1, 1, 1, 1,
2.564745, -0.7267452, 1.505158, 1, 1, 1, 1, 1,
2.587361, -1.255825, 0.5176365, 1, 1, 1, 1, 1,
2.7627, -0.1346704, 0.5525163, 1, 1, 1, 1, 1,
2.786409, 0.6246559, 2.292732, 1, 1, 1, 1, 1,
2.82289, 2.182337, -0.7415861, 1, 1, 1, 1, 1,
3.051684, 1.820022, -0.3316375, 1, 1, 1, 1, 1
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
var radius = 9.763684;
var distance = 34.29453;
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
mvMatrix.translate( 0.2501664, -0.286644, 0.2900486 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.29453);
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