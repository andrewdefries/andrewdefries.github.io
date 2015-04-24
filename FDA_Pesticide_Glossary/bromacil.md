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
-3.115817, -0.2405895, -2.282552, 1, 0, 0, 1,
-2.780955, -0.2219276, 0.1908178, 1, 0.007843138, 0, 1,
-2.7716, -0.7058065, -2.956168, 1, 0.01176471, 0, 1,
-2.700821, 1.109614, -0.0674376, 1, 0.01960784, 0, 1,
-2.549287, -0.9900443, -0.2246436, 1, 0.02352941, 0, 1,
-2.499971, 0.7256367, -1.459871, 1, 0.03137255, 0, 1,
-2.437599, 1.807136, -0.4071555, 1, 0.03529412, 0, 1,
-2.412642, 0.7427239, -1.718237, 1, 0.04313726, 0, 1,
-2.360469, -0.5440414, -2.593395, 1, 0.04705882, 0, 1,
-2.358294, -1.92002, -2.501456, 1, 0.05490196, 0, 1,
-2.355234, -0.2019041, -2.525585, 1, 0.05882353, 0, 1,
-2.272984, -1.071914, -1.810618, 1, 0.06666667, 0, 1,
-2.238976, 1.413148, -1.465912, 1, 0.07058824, 0, 1,
-2.231753, 0.5667397, -0.3455588, 1, 0.07843138, 0, 1,
-2.194732, -0.862056, -3.317175, 1, 0.08235294, 0, 1,
-2.18832, -0.5043209, -0.8597437, 1, 0.09019608, 0, 1,
-2.146978, -0.8350544, -0.3229938, 1, 0.09411765, 0, 1,
-2.135372, -0.5633484, -4.943721, 1, 0.1019608, 0, 1,
-2.114619, 0.4648352, -1.741848, 1, 0.1098039, 0, 1,
-2.10665, -0.6794002, -3.572915, 1, 0.1137255, 0, 1,
-2.086404, 0.4530195, -0.4569736, 1, 0.1215686, 0, 1,
-2.08122, -0.32236, -2.214232, 1, 0.1254902, 0, 1,
-2.079954, 1.370135, -0.1554423, 1, 0.1333333, 0, 1,
-2.069242, 0.6597303, -2.041434, 1, 0.1372549, 0, 1,
-2.065784, 0.9799861, -1.025264, 1, 0.145098, 0, 1,
-2.043292, 0.4383008, 0.832548, 1, 0.1490196, 0, 1,
-2.024409, 1.226125, -0.6548808, 1, 0.1568628, 0, 1,
-2.000416, 0.6293914, -0.4189273, 1, 0.1607843, 0, 1,
-1.957882, 1.589493, 0.2248628, 1, 0.1686275, 0, 1,
-1.954502, -0.07976032, -2.002922, 1, 0.172549, 0, 1,
-1.949721, 1.258278, -1.00351, 1, 0.1803922, 0, 1,
-1.913565, -2.201752, -4.375144, 1, 0.1843137, 0, 1,
-1.903597, 1.116418, -1.067565, 1, 0.1921569, 0, 1,
-1.891203, 1.829623, -0.1484851, 1, 0.1960784, 0, 1,
-1.877468, -0.1736351, -1.100885, 1, 0.2039216, 0, 1,
-1.863307, 0.280034, -1.830284, 1, 0.2117647, 0, 1,
-1.860231, -1.375372, -2.704257, 1, 0.2156863, 0, 1,
-1.829308, 0.1669161, -0.7644693, 1, 0.2235294, 0, 1,
-1.820712, -0.3402416, -2.262374, 1, 0.227451, 0, 1,
-1.806959, -0.9293331, -2.738547, 1, 0.2352941, 0, 1,
-1.802677, -2.242343, -1.574471, 1, 0.2392157, 0, 1,
-1.784898, -1.198839, -2.754107, 1, 0.2470588, 0, 1,
-1.777796, -0.9533024, -1.621768, 1, 0.2509804, 0, 1,
-1.761835, -0.8910546, -3.04526, 1, 0.2588235, 0, 1,
-1.75724, -0.4313112, -2.568095, 1, 0.2627451, 0, 1,
-1.748086, 1.109877, -1.247258, 1, 0.2705882, 0, 1,
-1.70772, 1.508458, -0.741946, 1, 0.2745098, 0, 1,
-1.706591, 0.2421863, -2.319107, 1, 0.282353, 0, 1,
-1.700717, 0.0352157, -1.263815, 1, 0.2862745, 0, 1,
-1.688044, 0.3064505, 0.4721408, 1, 0.2941177, 0, 1,
-1.679636, 0.3339753, -0.9724895, 1, 0.3019608, 0, 1,
-1.674881, 1.469595, -3.16098, 1, 0.3058824, 0, 1,
-1.662912, -0.589906, -2.335405, 1, 0.3137255, 0, 1,
-1.657951, 0.7357721, -1.22874, 1, 0.3176471, 0, 1,
-1.652776, 0.2869391, 0.08039836, 1, 0.3254902, 0, 1,
-1.637743, -1.510565, -3.803757, 1, 0.3294118, 0, 1,
-1.62172, -0.1644051, -1.273075, 1, 0.3372549, 0, 1,
-1.619695, 0.8197112, -2.21139, 1, 0.3411765, 0, 1,
-1.61694, 2.16881, -0.8918769, 1, 0.3490196, 0, 1,
-1.609622, -0.5464619, -2.578441, 1, 0.3529412, 0, 1,
-1.603912, 1.937092, -1.105359, 1, 0.3607843, 0, 1,
-1.600031, -0.7129768, -2.341781, 1, 0.3647059, 0, 1,
-1.598179, -1.392966, -0.7177189, 1, 0.372549, 0, 1,
-1.569157, 1.131613, -1.285264, 1, 0.3764706, 0, 1,
-1.558767, 0.4387786, -1.635555, 1, 0.3843137, 0, 1,
-1.549146, -1.379237, -2.683246, 1, 0.3882353, 0, 1,
-1.53148, -0.677295, -2.091088, 1, 0.3960784, 0, 1,
-1.517756, 1.168839, -0.1304391, 1, 0.4039216, 0, 1,
-1.509954, -0.6475603, -3.128802, 1, 0.4078431, 0, 1,
-1.50957, 0.7705823, -2.619671, 1, 0.4156863, 0, 1,
-1.508808, -0.01434153, -1.345111, 1, 0.4196078, 0, 1,
-1.508502, -0.06465073, -2.090247, 1, 0.427451, 0, 1,
-1.507877, -1.278172, -2.087052, 1, 0.4313726, 0, 1,
-1.504625, 0.4032045, -1.048605, 1, 0.4392157, 0, 1,
-1.501969, -1.101745, -2.382729, 1, 0.4431373, 0, 1,
-1.496765, 0.5838652, -2.966457, 1, 0.4509804, 0, 1,
-1.49476, -1.671242, -2.1251, 1, 0.454902, 0, 1,
-1.491652, 1.438572, -1.203482, 1, 0.4627451, 0, 1,
-1.489033, 0.211241, -1.861864, 1, 0.4666667, 0, 1,
-1.460596, 0.8365674, -0.2695354, 1, 0.4745098, 0, 1,
-1.448342, 0.4708435, -1.471677, 1, 0.4784314, 0, 1,
-1.446934, -1.797532, -2.028189, 1, 0.4862745, 0, 1,
-1.442328, 1.102854, -0.5545816, 1, 0.4901961, 0, 1,
-1.439478, 0.9110641, 0.3352098, 1, 0.4980392, 0, 1,
-1.422811, -0.8774192, -2.331545, 1, 0.5058824, 0, 1,
-1.413829, -1.474255, -2.16893, 1, 0.509804, 0, 1,
-1.378974, 2.208486, -1.475964, 1, 0.5176471, 0, 1,
-1.370162, -0.3361182, -1.292256, 1, 0.5215687, 0, 1,
-1.363946, 0.6510726, -2.4246, 1, 0.5294118, 0, 1,
-1.362825, 0.715823, 0.2665614, 1, 0.5333334, 0, 1,
-1.358579, -1.930291, -2.682442, 1, 0.5411765, 0, 1,
-1.356654, -0.4156972, -1.948282, 1, 0.5450981, 0, 1,
-1.346887, 0.07381915, -1.150542, 1, 0.5529412, 0, 1,
-1.343277, -1.27795, -4.359865, 1, 0.5568628, 0, 1,
-1.338003, -1.655535, -1.798972, 1, 0.5647059, 0, 1,
-1.333002, -0.9135499, -2.364252, 1, 0.5686275, 0, 1,
-1.330235, 0.1747625, -1.853725, 1, 0.5764706, 0, 1,
-1.320537, 0.5931931, -0.5150162, 1, 0.5803922, 0, 1,
-1.31978, -0.4103568, -0.6387475, 1, 0.5882353, 0, 1,
-1.312714, 0.4051225, -2.414127, 1, 0.5921569, 0, 1,
-1.30769, -0.5737812, -2.248612, 1, 0.6, 0, 1,
-1.304006, -0.09680298, -3.629723, 1, 0.6078432, 0, 1,
-1.300478, -0.7917355, -0.3763835, 1, 0.6117647, 0, 1,
-1.297143, 0.0257907, -2.305217, 1, 0.6196079, 0, 1,
-1.295313, -0.7703425, -1.588071, 1, 0.6235294, 0, 1,
-1.287522, 2.001518, -0.8175992, 1, 0.6313726, 0, 1,
-1.277121, -0.03948289, -2.931452, 1, 0.6352941, 0, 1,
-1.265472, -0.8790861, -1.519581, 1, 0.6431373, 0, 1,
-1.259131, 0.6618931, -1.36441, 1, 0.6470588, 0, 1,
-1.255663, -0.4830216, -3.503106, 1, 0.654902, 0, 1,
-1.254179, -1.310686, -1.129002, 1, 0.6588235, 0, 1,
-1.251228, 0.008598641, -1.666686, 1, 0.6666667, 0, 1,
-1.246269, 0.1852151, 0.6300682, 1, 0.6705883, 0, 1,
-1.241052, -0.7735472, -2.577886, 1, 0.6784314, 0, 1,
-1.232246, 1.558303, -1.175606, 1, 0.682353, 0, 1,
-1.231157, 0.07461973, -0.9302981, 1, 0.6901961, 0, 1,
-1.230007, -1.309448, -4.333615, 1, 0.6941177, 0, 1,
-1.229984, -1.129461, -1.806749, 1, 0.7019608, 0, 1,
-1.217467, 1.511142, -0.1090444, 1, 0.7098039, 0, 1,
-1.213872, -0.5159137, -1.445828, 1, 0.7137255, 0, 1,
-1.212198, -0.7254935, -1.590732, 1, 0.7215686, 0, 1,
-1.212004, 0.5668051, -0.868394, 1, 0.7254902, 0, 1,
-1.201803, 0.9680341, -1.239048, 1, 0.7333333, 0, 1,
-1.199549, -0.7792448, -2.058357, 1, 0.7372549, 0, 1,
-1.199117, 0.392397, -2.162639, 1, 0.7450981, 0, 1,
-1.197137, -1.471708, -0.6860638, 1, 0.7490196, 0, 1,
-1.196733, -1.240646, -3.985613, 1, 0.7568628, 0, 1,
-1.192667, 0.56084, -0.3480973, 1, 0.7607843, 0, 1,
-1.184816, 0.2316387, 0.5132584, 1, 0.7686275, 0, 1,
-1.179407, 0.7852959, -0.5523065, 1, 0.772549, 0, 1,
-1.179254, 0.287089, -1.85225, 1, 0.7803922, 0, 1,
-1.177762, 1.598963, -0.01310102, 1, 0.7843137, 0, 1,
-1.174726, 0.7228863, -0.17396, 1, 0.7921569, 0, 1,
-1.160996, 0.2528246, -2.477495, 1, 0.7960784, 0, 1,
-1.158706, 0.4387105, -0.3295885, 1, 0.8039216, 0, 1,
-1.157253, 0.03987106, -1.879197, 1, 0.8117647, 0, 1,
-1.1563, -0.5292891, -2.567319, 1, 0.8156863, 0, 1,
-1.155357, -0.6005862, -1.401497, 1, 0.8235294, 0, 1,
-1.154562, -0.1384107, -1.794659, 1, 0.827451, 0, 1,
-1.148109, 1.817376, -1.114953, 1, 0.8352941, 0, 1,
-1.144717, 2.886955, -2.525591, 1, 0.8392157, 0, 1,
-1.142784, -0.07148287, -0.6693519, 1, 0.8470588, 0, 1,
-1.142273, -0.3210629, -1.292061, 1, 0.8509804, 0, 1,
-1.137148, 1.396175, -1.206874, 1, 0.8588235, 0, 1,
-1.132773, 1.606147, -1.199831, 1, 0.8627451, 0, 1,
-1.128329, 1.068985, -0.7414284, 1, 0.8705882, 0, 1,
-1.125455, -0.1756834, -1.155045, 1, 0.8745098, 0, 1,
-1.123699, -1.552734, -1.634149, 1, 0.8823529, 0, 1,
-1.121651, -0.346505, -3.245386, 1, 0.8862745, 0, 1,
-1.112277, -0.3860503, -1.074788, 1, 0.8941177, 0, 1,
-1.110747, -1.258649, -1.773635, 1, 0.8980392, 0, 1,
-1.101959, -1.203637, -2.615206, 1, 0.9058824, 0, 1,
-1.101755, -0.6765158, -1.083491, 1, 0.9137255, 0, 1,
-1.095368, -0.8018543, -1.266853, 1, 0.9176471, 0, 1,
-1.095354, -0.6282349, -1.563987, 1, 0.9254902, 0, 1,
-1.094367, 1.03342, 0.4340983, 1, 0.9294118, 0, 1,
-1.08563, -0.2567103, -2.199496, 1, 0.9372549, 0, 1,
-1.085389, -0.5374763, -1.038719, 1, 0.9411765, 0, 1,
-1.071963, -1.442833, -2.634931, 1, 0.9490196, 0, 1,
-1.067994, 0.6912174, -2.969386, 1, 0.9529412, 0, 1,
-1.067036, 0.1592331, -1.439929, 1, 0.9607843, 0, 1,
-1.066357, -0.6150364, -2.935949, 1, 0.9647059, 0, 1,
-1.055087, 0.6135, -2.727113, 1, 0.972549, 0, 1,
-1.049943, -0.1235039, -1.138142, 1, 0.9764706, 0, 1,
-1.048331, 0.4800889, -1.067808, 1, 0.9843137, 0, 1,
-1.045525, -1.221033, -1.533181, 1, 0.9882353, 0, 1,
-1.03666, 1.089935, -1.151102, 1, 0.9960784, 0, 1,
-1.033616, 1.055933, -0.6304791, 0.9960784, 1, 0, 1,
-1.031769, 0.3475004, -0.8914188, 0.9921569, 1, 0, 1,
-1.029758, -0.5663448, -4.17241, 0.9843137, 1, 0, 1,
-1.027736, 0.5052766, -2.894652, 0.9803922, 1, 0, 1,
-1.02693, 0.4400558, -0.7988543, 0.972549, 1, 0, 1,
-1.023839, -0.08388028, -3.1676, 0.9686275, 1, 0, 1,
-1.018878, 0.773824, -1.712303, 0.9607843, 1, 0, 1,
-1.016485, 0.6918464, -2.830468, 0.9568627, 1, 0, 1,
-1.015443, -0.02617195, -1.883176, 0.9490196, 1, 0, 1,
-1.006763, -0.9990739, -1.109593, 0.945098, 1, 0, 1,
-1.005411, 0.8497005, -0.356916, 0.9372549, 1, 0, 1,
-1.004322, -2.536998, -1.437427, 0.9333333, 1, 0, 1,
-1.002753, 0.4544359, -1.885515, 0.9254902, 1, 0, 1,
-0.9996753, 0.4292266, -1.162275, 0.9215686, 1, 0, 1,
-0.9991972, 0.3701257, -0.551548, 0.9137255, 1, 0, 1,
-0.9971298, -2.710591, -3.35322, 0.9098039, 1, 0, 1,
-0.9897109, 0.8190247, -1.615616, 0.9019608, 1, 0, 1,
-0.9874297, 0.1780016, -0.5337219, 0.8941177, 1, 0, 1,
-0.9854571, -0.7485177, -2.988782, 0.8901961, 1, 0, 1,
-0.9700678, 0.7496774, -1.370436, 0.8823529, 1, 0, 1,
-0.9689171, 0.3585782, -0.583102, 0.8784314, 1, 0, 1,
-0.9657528, -1.695896, -1.061175, 0.8705882, 1, 0, 1,
-0.9655859, 0.6058894, -1.227494, 0.8666667, 1, 0, 1,
-0.9646332, 0.9768201, -1.249022, 0.8588235, 1, 0, 1,
-0.9610553, 0.633177, 0.1129711, 0.854902, 1, 0, 1,
-0.9574335, 0.2862005, -0.7473917, 0.8470588, 1, 0, 1,
-0.9557819, 0.1957077, -1.110262, 0.8431373, 1, 0, 1,
-0.9530037, 0.7435654, -1.751104, 0.8352941, 1, 0, 1,
-0.9530016, 1.470355, 0.1402131, 0.8313726, 1, 0, 1,
-0.9518924, 0.08865937, -3.097351, 0.8235294, 1, 0, 1,
-0.9515705, 0.2101247, -1.379642, 0.8196079, 1, 0, 1,
-0.949725, -0.8861477, -2.075587, 0.8117647, 1, 0, 1,
-0.9446822, 0.9663221, -0.5800619, 0.8078431, 1, 0, 1,
-0.9430405, 0.7284754, -1.868041, 0.8, 1, 0, 1,
-0.9386737, -0.9388866, -2.915431, 0.7921569, 1, 0, 1,
-0.9373484, -1.879964, -4.032478, 0.7882353, 1, 0, 1,
-0.928471, 0.068448, -2.769293, 0.7803922, 1, 0, 1,
-0.926506, 0.5545334, -1.073016, 0.7764706, 1, 0, 1,
-0.9201825, 0.8636149, -0.7676898, 0.7686275, 1, 0, 1,
-0.917792, 1.454951, -0.6386151, 0.7647059, 1, 0, 1,
-0.9034933, -0.04732757, -1.148441, 0.7568628, 1, 0, 1,
-0.8906968, 1.703236, -0.258027, 0.7529412, 1, 0, 1,
-0.8847364, 0.2526604, -1.725106, 0.7450981, 1, 0, 1,
-0.8766679, -0.8484449, -2.100114, 0.7411765, 1, 0, 1,
-0.8725622, 0.1219173, -0.9692356, 0.7333333, 1, 0, 1,
-0.8669534, 0.8406557, -0.4106074, 0.7294118, 1, 0, 1,
-0.8657625, -0.07945629, -1.242988, 0.7215686, 1, 0, 1,
-0.8628374, -0.8089175, -2.241268, 0.7176471, 1, 0, 1,
-0.8623517, -0.1538311, -3.062201, 0.7098039, 1, 0, 1,
-0.86179, 0.4074647, -1.106813, 0.7058824, 1, 0, 1,
-0.8595891, -0.07335171, -2.749047, 0.6980392, 1, 0, 1,
-0.8533915, -0.9014006, -0.9586564, 0.6901961, 1, 0, 1,
-0.85238, -0.01657851, 0.1778053, 0.6862745, 1, 0, 1,
-0.8506106, 0.9260083, -0.6163808, 0.6784314, 1, 0, 1,
-0.8492584, -0.118949, -1.463652, 0.6745098, 1, 0, 1,
-0.8467278, -0.556982, -1.552787, 0.6666667, 1, 0, 1,
-0.845551, 0.2017229, -2.401479, 0.6627451, 1, 0, 1,
-0.8406778, 0.7856361, -0.5024954, 0.654902, 1, 0, 1,
-0.8369378, -0.6037027, -3.182761, 0.6509804, 1, 0, 1,
-0.8329212, 0.116037, -1.457227, 0.6431373, 1, 0, 1,
-0.8326086, 0.9159257, -0.8981371, 0.6392157, 1, 0, 1,
-0.8270878, 0.3293183, -2.479424, 0.6313726, 1, 0, 1,
-0.826214, -1.078594, -2.561161, 0.627451, 1, 0, 1,
-0.824621, 0.5527343, -0.7646607, 0.6196079, 1, 0, 1,
-0.8058674, 0.9734848, -1.082669, 0.6156863, 1, 0, 1,
-0.8043769, -0.1381324, -2.655988, 0.6078432, 1, 0, 1,
-0.7993974, 0.5617681, -1.218025, 0.6039216, 1, 0, 1,
-0.7992975, 1.330901, -1.566791, 0.5960785, 1, 0, 1,
-0.7972311, 1.035964, -0.9820358, 0.5882353, 1, 0, 1,
-0.7970674, -0.7033771, -1.203689, 0.5843138, 1, 0, 1,
-0.7935623, 1.121339, -1.203989, 0.5764706, 1, 0, 1,
-0.7902686, 1.247956, -1.198351, 0.572549, 1, 0, 1,
-0.7899391, -1.337099, -2.763751, 0.5647059, 1, 0, 1,
-0.7867578, -0.04855907, -4.020321, 0.5607843, 1, 0, 1,
-0.7843193, -1.453857, -2.275237, 0.5529412, 1, 0, 1,
-0.779728, 0.8292561, -0.1239805, 0.5490196, 1, 0, 1,
-0.7757992, -1.323627, -2.925169, 0.5411765, 1, 0, 1,
-0.775737, 1.584516, -1.474432, 0.5372549, 1, 0, 1,
-0.7678329, 1.461, 0.201015, 0.5294118, 1, 0, 1,
-0.7670155, -1.722613, -3.452798, 0.5254902, 1, 0, 1,
-0.7658199, -0.3959894, -1.937483, 0.5176471, 1, 0, 1,
-0.7629312, -0.4622034, -2.514935, 0.5137255, 1, 0, 1,
-0.7590014, -0.6304485, -1.915695, 0.5058824, 1, 0, 1,
-0.7584103, 0.8916936, 0.3558871, 0.5019608, 1, 0, 1,
-0.7544413, 0.9625723, -0.9148264, 0.4941176, 1, 0, 1,
-0.7530065, -0.4895152, -2.505097, 0.4862745, 1, 0, 1,
-0.7477636, 1.27394, -0.9768374, 0.4823529, 1, 0, 1,
-0.74466, 1.550223, 0.4047108, 0.4745098, 1, 0, 1,
-0.7296464, 2.126843, -2.391696, 0.4705882, 1, 0, 1,
-0.7290433, 0.1177121, -1.097867, 0.4627451, 1, 0, 1,
-0.7286253, 0.1400403, -2.406394, 0.4588235, 1, 0, 1,
-0.7253178, -0.6170579, -2.707299, 0.4509804, 1, 0, 1,
-0.7251102, 1.824518, -0.5617872, 0.4470588, 1, 0, 1,
-0.7175221, -0.2652873, -2.491939, 0.4392157, 1, 0, 1,
-0.717087, 0.9357989, -0.65263, 0.4352941, 1, 0, 1,
-0.7167538, 0.08362056, -1.841753, 0.427451, 1, 0, 1,
-0.7146533, -1.617516, -3.979414, 0.4235294, 1, 0, 1,
-0.7111398, 1.84518, -1.082947, 0.4156863, 1, 0, 1,
-0.7076766, 1.408158, -0.8083108, 0.4117647, 1, 0, 1,
-0.7069352, -0.6896889, -4.567518, 0.4039216, 1, 0, 1,
-0.7027451, 0.1903827, -3.746569, 0.3960784, 1, 0, 1,
-0.7011194, -0.9762012, -3.686357, 0.3921569, 1, 0, 1,
-0.695817, -0.1749745, -1.476451, 0.3843137, 1, 0, 1,
-0.6957981, 0.6505475, -0.4344664, 0.3803922, 1, 0, 1,
-0.6943781, -0.3872121, -2.369254, 0.372549, 1, 0, 1,
-0.6936607, -0.01113406, -0.7482088, 0.3686275, 1, 0, 1,
-0.6934913, 0.8404908, -1.24844, 0.3607843, 1, 0, 1,
-0.6928255, -0.6778553, -3.357546, 0.3568628, 1, 0, 1,
-0.6884657, 0.5718821, 0.4432173, 0.3490196, 1, 0, 1,
-0.687561, -1.59386, -2.699569, 0.345098, 1, 0, 1,
-0.684761, -2.175438, -3.906806, 0.3372549, 1, 0, 1,
-0.6824479, 0.5232472, -0.8604994, 0.3333333, 1, 0, 1,
-0.679654, -1.29992, -3.113833, 0.3254902, 1, 0, 1,
-0.6745574, -0.5850766, -3.473545, 0.3215686, 1, 0, 1,
-0.6745201, -2.109871, -2.46354, 0.3137255, 1, 0, 1,
-0.6739625, 0.3812652, -3.753671, 0.3098039, 1, 0, 1,
-0.6687041, 0.1305943, 0.3114893, 0.3019608, 1, 0, 1,
-0.663473, -0.5496405, -2.989702, 0.2941177, 1, 0, 1,
-0.6616409, 0.1443961, -1.632969, 0.2901961, 1, 0, 1,
-0.6613449, 1.176681, 0.04523107, 0.282353, 1, 0, 1,
-0.6593289, -0.5907676, -1.588419, 0.2784314, 1, 0, 1,
-0.6572199, 1.91662, 0.3351607, 0.2705882, 1, 0, 1,
-0.6557873, 1.833084, -2.120741, 0.2666667, 1, 0, 1,
-0.6531693, -0.08911131, -1.986252, 0.2588235, 1, 0, 1,
-0.6505489, 0.8562896, 0.2394501, 0.254902, 1, 0, 1,
-0.6454131, 1.548755, -0.6180037, 0.2470588, 1, 0, 1,
-0.6425294, -0.2924882, -3.644621, 0.2431373, 1, 0, 1,
-0.6408647, -1.897024, -3.591, 0.2352941, 1, 0, 1,
-0.6313264, 0.001622491, -1.343346, 0.2313726, 1, 0, 1,
-0.6275733, -1.141211, -1.355785, 0.2235294, 1, 0, 1,
-0.6256856, 0.5840583, -1.217299, 0.2196078, 1, 0, 1,
-0.6227928, -1.132495, -2.630535, 0.2117647, 1, 0, 1,
-0.6211603, -1.262909, -4.353348, 0.2078431, 1, 0, 1,
-0.6189653, 0.838535, -0.4966421, 0.2, 1, 0, 1,
-0.6167253, -0.764087, -1.065001, 0.1921569, 1, 0, 1,
-0.6143973, 0.5911545, -2.982557, 0.1882353, 1, 0, 1,
-0.6142364, 0.2025302, -2.73866, 0.1803922, 1, 0, 1,
-0.6136543, -0.3618201, -2.578768, 0.1764706, 1, 0, 1,
-0.6091099, 0.9722297, 0.2008969, 0.1686275, 1, 0, 1,
-0.6062928, 0.5390998, -1.169081, 0.1647059, 1, 0, 1,
-0.5996, 1.750494, -2.05854, 0.1568628, 1, 0, 1,
-0.5992184, 0.7942746, -2.898241, 0.1529412, 1, 0, 1,
-0.5947933, 1.144718, -0.5512782, 0.145098, 1, 0, 1,
-0.5943857, -1.71491, -2.117362, 0.1411765, 1, 0, 1,
-0.5939241, -1.20681, -3.481524, 0.1333333, 1, 0, 1,
-0.5916463, 1.478525, -0.8139775, 0.1294118, 1, 0, 1,
-0.5903562, 0.2037522, -2.171559, 0.1215686, 1, 0, 1,
-0.5814453, -0.6724883, -3.441402, 0.1176471, 1, 0, 1,
-0.5781869, -0.083868, -1.499646, 0.1098039, 1, 0, 1,
-0.5774068, -0.8030639, -1.54468, 0.1058824, 1, 0, 1,
-0.5767472, -0.4223012, -1.384777, 0.09803922, 1, 0, 1,
-0.568122, -1.095106, -4.212211, 0.09019608, 1, 0, 1,
-0.5652188, -1.890965, -3.716901, 0.08627451, 1, 0, 1,
-0.5630056, 1.390885, 0.3508314, 0.07843138, 1, 0, 1,
-0.5624374, -0.08709142, -1.32943, 0.07450981, 1, 0, 1,
-0.5593596, -0.4241289, -1.902088, 0.06666667, 1, 0, 1,
-0.5562616, 0.7078581, -0.4142524, 0.0627451, 1, 0, 1,
-0.5556877, 1.403479, -0.05546321, 0.05490196, 1, 0, 1,
-0.5521793, -0.4490142, -1.889954, 0.05098039, 1, 0, 1,
-0.549503, 0.3322521, 0.2366873, 0.04313726, 1, 0, 1,
-0.5408961, 0.9212814, -0.00248582, 0.03921569, 1, 0, 1,
-0.5380519, 2.637091, 0.9089442, 0.03137255, 1, 0, 1,
-0.5316541, -0.2396505, -3.430619, 0.02745098, 1, 0, 1,
-0.5306481, 1.508554, 0.443981, 0.01960784, 1, 0, 1,
-0.5233999, -1.510413, -2.741457, 0.01568628, 1, 0, 1,
-0.5229043, 0.359157, -0.4891541, 0.007843138, 1, 0, 1,
-0.521709, 1.513406, 0.7776619, 0.003921569, 1, 0, 1,
-0.5178609, -0.4985158, -1.256225, 0, 1, 0.003921569, 1,
-0.5169691, 1.21793, -0.3456984, 0, 1, 0.01176471, 1,
-0.5129868, 1.601501, -0.8708783, 0, 1, 0.01568628, 1,
-0.5119461, 0.5204294, -0.641654, 0, 1, 0.02352941, 1,
-0.5105677, -0.290667, -2.509446, 0, 1, 0.02745098, 1,
-0.5068029, 0.1178898, -2.030439, 0, 1, 0.03529412, 1,
-0.5031557, 1.663264, -0.07555138, 0, 1, 0.03921569, 1,
-0.5021324, -0.6410503, -3.905299, 0, 1, 0.04705882, 1,
-0.5007625, -0.490038, -2.846104, 0, 1, 0.05098039, 1,
-0.4945989, 0.5333098, -1.425601, 0, 1, 0.05882353, 1,
-0.4922721, -0.9582403, -4.325606, 0, 1, 0.0627451, 1,
-0.4905973, 2.188911, 0.4109509, 0, 1, 0.07058824, 1,
-0.4881116, -0.3332603, -1.887421, 0, 1, 0.07450981, 1,
-0.4840758, -0.06448522, -1.399406, 0, 1, 0.08235294, 1,
-0.4793205, -1.415597, -4.202748, 0, 1, 0.08627451, 1,
-0.478519, -0.367948, -3.508538, 0, 1, 0.09411765, 1,
-0.4783693, 1.554994, -1.805884, 0, 1, 0.1019608, 1,
-0.4751881, 1.598991, 0.7077191, 0, 1, 0.1058824, 1,
-0.4690944, -0.5159565, -0.2317209, 0, 1, 0.1137255, 1,
-0.4689603, 1.261104, -0.4155001, 0, 1, 0.1176471, 1,
-0.4669, 0.8837777, 0.2782561, 0, 1, 0.1254902, 1,
-0.4646624, 0.8327588, 0.8108128, 0, 1, 0.1294118, 1,
-0.4624236, -0.3714189, -1.595134, 0, 1, 0.1372549, 1,
-0.459974, 0.4491907, -1.252258, 0, 1, 0.1411765, 1,
-0.4595522, -1.029566, -4.145674, 0, 1, 0.1490196, 1,
-0.4581614, -0.8908041, -4.235282, 0, 1, 0.1529412, 1,
-0.4526305, 1.447067, 0.3709446, 0, 1, 0.1607843, 1,
-0.4506887, -1.740681, -2.228107, 0, 1, 0.1647059, 1,
-0.44786, -0.41748, -2.23736, 0, 1, 0.172549, 1,
-0.4435502, -0.2345324, -1.430515, 0, 1, 0.1764706, 1,
-0.440212, -1.277611, -3.378053, 0, 1, 0.1843137, 1,
-0.4395444, -0.8535309, -2.572289, 0, 1, 0.1882353, 1,
-0.4379403, -0.7047569, -2.964844, 0, 1, 0.1960784, 1,
-0.4341877, 1.052634, 2.570287, 0, 1, 0.2039216, 1,
-0.4301608, -0.6765996, -2.162585, 0, 1, 0.2078431, 1,
-0.4262043, -0.9114336, -2.365682, 0, 1, 0.2156863, 1,
-0.4260169, -1.302266, -3.404768, 0, 1, 0.2196078, 1,
-0.4214029, -0.5047179, -2.20949, 0, 1, 0.227451, 1,
-0.4198447, -1.094686, -4.03918, 0, 1, 0.2313726, 1,
-0.4053708, 0.2704294, -1.483865, 0, 1, 0.2392157, 1,
-0.4049536, 0.02334084, -2.650415, 0, 1, 0.2431373, 1,
-0.4008315, -0.3379861, -2.637908, 0, 1, 0.2509804, 1,
-0.4003781, 0.1428266, -2.204305, 0, 1, 0.254902, 1,
-0.3987311, -0.4372404, -1.027882, 0, 1, 0.2627451, 1,
-0.394101, 1.854828, -0.643777, 0, 1, 0.2666667, 1,
-0.3912656, -0.0918934, -0.005865643, 0, 1, 0.2745098, 1,
-0.3875211, 0.3701428, 0.1548298, 0, 1, 0.2784314, 1,
-0.3847932, -0.914987, -1.835425, 0, 1, 0.2862745, 1,
-0.3847, 1.347863, -0.5621998, 0, 1, 0.2901961, 1,
-0.3846825, 0.8767858, -1.392151, 0, 1, 0.2980392, 1,
-0.3822232, 0.2156537, -0.6900687, 0, 1, 0.3058824, 1,
-0.3799805, -0.02384139, -1.391502, 0, 1, 0.3098039, 1,
-0.3719505, -0.6618946, -3.105797, 0, 1, 0.3176471, 1,
-0.3669276, 0.6328949, -1.293484, 0, 1, 0.3215686, 1,
-0.3665085, 0.5385178, -0.02453003, 0, 1, 0.3294118, 1,
-0.3644729, -0.3825903, -1.940796, 0, 1, 0.3333333, 1,
-0.3624646, -1.159787, -2.758765, 0, 1, 0.3411765, 1,
-0.3606213, -0.7528081, -3.136239, 0, 1, 0.345098, 1,
-0.3548303, -1.527988, -2.135512, 0, 1, 0.3529412, 1,
-0.3543078, 0.700635, -0.8665352, 0, 1, 0.3568628, 1,
-0.3542194, 0.5692241, -1.829566, 0, 1, 0.3647059, 1,
-0.3476471, -0.8395594, -3.964136, 0, 1, 0.3686275, 1,
-0.346097, -0.9256665, -2.114556, 0, 1, 0.3764706, 1,
-0.3456036, -1.010184, -3.060174, 0, 1, 0.3803922, 1,
-0.3445256, -0.6736817, -3.043671, 0, 1, 0.3882353, 1,
-0.3437215, -0.6992239, -2.194463, 0, 1, 0.3921569, 1,
-0.3394375, -0.0118566, -2.113768, 0, 1, 0.4, 1,
-0.3374639, -1.107582, -3.245852, 0, 1, 0.4078431, 1,
-0.3369129, -1.212197, -2.335188, 0, 1, 0.4117647, 1,
-0.3351541, 0.3612371, -0.07912514, 0, 1, 0.4196078, 1,
-0.3336011, -0.5894288, -2.313057, 0, 1, 0.4235294, 1,
-0.330957, -0.508311, -1.602506, 0, 1, 0.4313726, 1,
-0.3286645, -0.4271518, -2.522744, 0, 1, 0.4352941, 1,
-0.3284383, -0.08288158, -1.530719, 0, 1, 0.4431373, 1,
-0.3282237, 0.1932393, -0.7771798, 0, 1, 0.4470588, 1,
-0.3278689, 0.1700988, -0.9388553, 0, 1, 0.454902, 1,
-0.3270082, -2.168689, -2.613115, 0, 1, 0.4588235, 1,
-0.3248049, 0.6364284, 0.6084822, 0, 1, 0.4666667, 1,
-0.3180317, -0.6742871, -2.119591, 0, 1, 0.4705882, 1,
-0.3152943, 1.782656, -0.5118313, 0, 1, 0.4784314, 1,
-0.3125463, -0.4105739, -0.8431358, 0, 1, 0.4823529, 1,
-0.3121354, -0.07550719, -1.772019, 0, 1, 0.4901961, 1,
-0.3090347, -0.8237674, -3.57468, 0, 1, 0.4941176, 1,
-0.3011575, -0.6926268, -2.089753, 0, 1, 0.5019608, 1,
-0.2996023, -1.138623, -2.423713, 0, 1, 0.509804, 1,
-0.2949536, 0.3497994, 0.41832, 0, 1, 0.5137255, 1,
-0.2930864, -2.411667, -1.401214, 0, 1, 0.5215687, 1,
-0.2925542, -0.1569896, -1.298454, 0, 1, 0.5254902, 1,
-0.2844121, 0.1521349, -0.2092323, 0, 1, 0.5333334, 1,
-0.2819066, -0.07017048, -1.826823, 0, 1, 0.5372549, 1,
-0.2661248, 1.081252, -1.193872, 0, 1, 0.5450981, 1,
-0.258743, -1.074623, -2.668286, 0, 1, 0.5490196, 1,
-0.2579112, 1.581192, -0.258769, 0, 1, 0.5568628, 1,
-0.255951, -0.4354678, -1.850785, 0, 1, 0.5607843, 1,
-0.2516666, -1.153841, -2.795492, 0, 1, 0.5686275, 1,
-0.2399617, -1.80946, -4.664862, 0, 1, 0.572549, 1,
-0.2385276, 1.078982, -0.4265105, 0, 1, 0.5803922, 1,
-0.2380702, -0.4804978, -2.581237, 0, 1, 0.5843138, 1,
-0.2335951, -1.175698, -0.9397633, 0, 1, 0.5921569, 1,
-0.2334832, -0.6665583, -3.308478, 0, 1, 0.5960785, 1,
-0.2321257, 0.7396626, -1.768051, 0, 1, 0.6039216, 1,
-0.2297661, 0.2954339, -0.2682687, 0, 1, 0.6117647, 1,
-0.2294552, -0.6200157, -1.006957, 0, 1, 0.6156863, 1,
-0.2267339, 0.5840221, -0.5388592, 0, 1, 0.6235294, 1,
-0.2219197, 0.3342375, -0.8814991, 0, 1, 0.627451, 1,
-0.2198962, -0.2303514, -3.412309, 0, 1, 0.6352941, 1,
-0.2125411, 0.3362921, -0.5785593, 0, 1, 0.6392157, 1,
-0.2122697, -0.9922504, -2.759374, 0, 1, 0.6470588, 1,
-0.2116765, -0.5340297, -3.343341, 0, 1, 0.6509804, 1,
-0.2104806, 0.3162526, -0.7714224, 0, 1, 0.6588235, 1,
-0.208997, 0.3319117, -1.753698, 0, 1, 0.6627451, 1,
-0.2077128, 1.060815, -1.224329, 0, 1, 0.6705883, 1,
-0.2036905, 0.1948809, -1.970075, 0, 1, 0.6745098, 1,
-0.2023733, 1.05476, 0.9773273, 0, 1, 0.682353, 1,
-0.1954729, -0.6683424, -4.310031, 0, 1, 0.6862745, 1,
-0.1947652, -0.2417209, -2.620058, 0, 1, 0.6941177, 1,
-0.1947449, -0.2134142, -2.592771, 0, 1, 0.7019608, 1,
-0.1940341, -1.265435, -2.436833, 0, 1, 0.7058824, 1,
-0.1924016, 1.665444, -2.334868, 0, 1, 0.7137255, 1,
-0.1909929, 1.61865, -0.6455417, 0, 1, 0.7176471, 1,
-0.1908674, 0.2561214, 1.151433, 0, 1, 0.7254902, 1,
-0.1820057, 0.9302316, -2.308218, 0, 1, 0.7294118, 1,
-0.1793904, 0.4528999, -0.01305734, 0, 1, 0.7372549, 1,
-0.1786847, -1.165103, -1.18276, 0, 1, 0.7411765, 1,
-0.1723461, -1.645159, -0.6081949, 0, 1, 0.7490196, 1,
-0.1692647, -0.5581107, -2.530533, 0, 1, 0.7529412, 1,
-0.1685124, 2.429019, -0.8654555, 0, 1, 0.7607843, 1,
-0.1673102, 0.618618, -0.6839154, 0, 1, 0.7647059, 1,
-0.1655285, -1.311778, -3.065103, 0, 1, 0.772549, 1,
-0.165291, -1.932615, -2.288019, 0, 1, 0.7764706, 1,
-0.1612599, -2.39331, -3.689482, 0, 1, 0.7843137, 1,
-0.1592431, -0.3217168, -0.9977341, 0, 1, 0.7882353, 1,
-0.152281, 0.1561964, -1.008559, 0, 1, 0.7960784, 1,
-0.1522621, 0.3824214, 1.004349, 0, 1, 0.8039216, 1,
-0.1489402, -0.7597211, -2.354826, 0, 1, 0.8078431, 1,
-0.1460967, 0.06752742, -0.1865562, 0, 1, 0.8156863, 1,
-0.1459602, -0.5736, -1.841473, 0, 1, 0.8196079, 1,
-0.1424067, 0.3228575, -2.200786, 0, 1, 0.827451, 1,
-0.1418232, -0.9367976, -3.212557, 0, 1, 0.8313726, 1,
-0.1354628, -0.3889565, -3.267838, 0, 1, 0.8392157, 1,
-0.1335646, -0.06202836, -2.471666, 0, 1, 0.8431373, 1,
-0.1302868, 1.222754, 1.019976, 0, 1, 0.8509804, 1,
-0.130113, -0.3252921, -1.453438, 0, 1, 0.854902, 1,
-0.1237962, -0.6288342, -2.551304, 0, 1, 0.8627451, 1,
-0.1235144, -1.753794, -2.711866, 0, 1, 0.8666667, 1,
-0.12324, 0.4580807, -0.429753, 0, 1, 0.8745098, 1,
-0.1202616, -1.09596, -4.06352, 0, 1, 0.8784314, 1,
-0.1176479, -0.9770758, -1.797311, 0, 1, 0.8862745, 1,
-0.1175873, 0.1692379, 0.3343531, 0, 1, 0.8901961, 1,
-0.109836, 0.3397335, 0.8604761, 0, 1, 0.8980392, 1,
-0.1092348, -0.482799, -1.841644, 0, 1, 0.9058824, 1,
-0.1049783, 0.7648943, -1.080841, 0, 1, 0.9098039, 1,
-0.1032101, -0.5824505, -1.670055, 0, 1, 0.9176471, 1,
-0.09664901, 0.5323654, -1.717656, 0, 1, 0.9215686, 1,
-0.09495028, -0.7495301, -4.803049, 0, 1, 0.9294118, 1,
-0.08576825, -0.5090216, -3.083772, 0, 1, 0.9333333, 1,
-0.08340094, 0.2726654, -1.38753, 0, 1, 0.9411765, 1,
-0.08196007, -0.6095172, -2.433673, 0, 1, 0.945098, 1,
-0.08190675, 0.6713586, 0.264107, 0, 1, 0.9529412, 1,
-0.07563028, -0.9788924, -3.830223, 0, 1, 0.9568627, 1,
-0.07527985, -1.359073, -4.071709, 0, 1, 0.9647059, 1,
-0.0700551, -1.414736, -4.244028, 0, 1, 0.9686275, 1,
-0.06619562, -0.4356411, -2.535636, 0, 1, 0.9764706, 1,
-0.06564932, 0.3822075, -0.2953786, 0, 1, 0.9803922, 1,
-0.06503051, -0.2220152, -2.442351, 0, 1, 0.9882353, 1,
-0.06467623, 0.4445152, 0.1631038, 0, 1, 0.9921569, 1,
-0.063903, 0.965192, 1.534098, 0, 1, 1, 1,
-0.06324062, 0.1500104, 1.412057, 0, 0.9921569, 1, 1,
-0.06273889, -1.425715, -3.071222, 0, 0.9882353, 1, 1,
-0.06168367, -0.08188678, -3.414968, 0, 0.9803922, 1, 1,
-0.05874991, 0.06752767, -0.2997062, 0, 0.9764706, 1, 1,
-0.05762718, 0.3347001, 0.04158216, 0, 0.9686275, 1, 1,
-0.05098993, -1.402308, -2.081398, 0, 0.9647059, 1, 1,
-0.04731455, -0.07054701, -5.048595, 0, 0.9568627, 1, 1,
-0.04726995, 1.363585, -0.7509806, 0, 0.9529412, 1, 1,
-0.04293355, -0.5364591, -4.098711, 0, 0.945098, 1, 1,
-0.03679374, -0.127451, -3.638531, 0, 0.9411765, 1, 1,
-0.03558083, 2.395439, -0.8363241, 0, 0.9333333, 1, 1,
-0.0319102, 0.9120579, 1.618593, 0, 0.9294118, 1, 1,
-0.03146101, -2.658421, -4.63244, 0, 0.9215686, 1, 1,
-0.03066697, 0.1414827, -1.5273, 0, 0.9176471, 1, 1,
-0.03061461, -0.3066877, -2.581331, 0, 0.9098039, 1, 1,
-0.02969664, -0.06654353, -2.773366, 0, 0.9058824, 1, 1,
-0.02880031, -0.9756054, -2.826453, 0, 0.8980392, 1, 1,
-0.02612963, -0.7373254, -3.046471, 0, 0.8901961, 1, 1,
-0.02591296, -1.899776, -4.450361, 0, 0.8862745, 1, 1,
-0.0193643, 1.032336, 0.6320508, 0, 0.8784314, 1, 1,
-0.01583669, 0.4499063, 0.6661706, 0, 0.8745098, 1, 1,
-0.01486864, 1.355108, 0.9823139, 0, 0.8666667, 1, 1,
-0.006161518, 1.406238, 1.476977, 0, 0.8627451, 1, 1,
-0.005511967, 1.583996, -1.818938, 0, 0.854902, 1, 1,
0.0007200175, 1.908777, -0.2990434, 0, 0.8509804, 1, 1,
0.003465277, -0.7998149, 6.368726, 0, 0.8431373, 1, 1,
0.003720593, 0.3303393, -1.444418, 0, 0.8392157, 1, 1,
0.004278105, 0.04177055, -1.666683, 0, 0.8313726, 1, 1,
0.0106473, 0.1982412, -0.05424167, 0, 0.827451, 1, 1,
0.01649342, -0.2572048, 4.677815, 0, 0.8196079, 1, 1,
0.01835158, -1.086747, 2.291613, 0, 0.8156863, 1, 1,
0.02196827, 0.9223295, -0.3041836, 0, 0.8078431, 1, 1,
0.02590173, 0.718932, 0.7264549, 0, 0.8039216, 1, 1,
0.02792547, 0.9725465, 0.4750014, 0, 0.7960784, 1, 1,
0.02841856, 0.9588669, 0.4945461, 0, 0.7882353, 1, 1,
0.03725755, 0.002893389, 0.6717523, 0, 0.7843137, 1, 1,
0.03879489, 1.097992, 0.5717323, 0, 0.7764706, 1, 1,
0.03903653, 0.02182631, -0.03248052, 0, 0.772549, 1, 1,
0.04634907, -0.3782775, 2.544861, 0, 0.7647059, 1, 1,
0.0469878, 1.271636, -0.7043575, 0, 0.7607843, 1, 1,
0.05468727, 0.06266346, -0.5377358, 0, 0.7529412, 1, 1,
0.05598064, 0.06862681, 1.324612, 0, 0.7490196, 1, 1,
0.05825175, -0.3141381, 3.272681, 0, 0.7411765, 1, 1,
0.05975104, -1.176291, 2.363853, 0, 0.7372549, 1, 1,
0.05999613, 1.039361, 0.07298373, 0, 0.7294118, 1, 1,
0.06010497, -1.818373, 1.14476, 0, 0.7254902, 1, 1,
0.06046056, -0.4892371, 4.588971, 0, 0.7176471, 1, 1,
0.0622272, -1.343225, 3.709807, 0, 0.7137255, 1, 1,
0.06701466, -2.468646, 4.726367, 0, 0.7058824, 1, 1,
0.07507937, 0.7089303, 0.1527264, 0, 0.6980392, 1, 1,
0.07657249, 0.3367018, -0.002885274, 0, 0.6941177, 1, 1,
0.07850489, -0.0543358, 2.434643, 0, 0.6862745, 1, 1,
0.08105747, -1.160419, 1.17871, 0, 0.682353, 1, 1,
0.08594142, 0.4215023, -0.6196652, 0, 0.6745098, 1, 1,
0.08771099, -1.439534, 1.383854, 0, 0.6705883, 1, 1,
0.0885421, -0.545252, 3.926566, 0, 0.6627451, 1, 1,
0.09155805, 0.5958813, 1.002809, 0, 0.6588235, 1, 1,
0.09495867, -0.7786605, 3.824444, 0, 0.6509804, 1, 1,
0.09525076, 0.2705973, 1.277864, 0, 0.6470588, 1, 1,
0.09597176, 1.823761, -0.3061729, 0, 0.6392157, 1, 1,
0.0961187, -1.292602, 1.964409, 0, 0.6352941, 1, 1,
0.09706697, 0.7678716, -0.698424, 0, 0.627451, 1, 1,
0.09773456, -1.225843, 4.028046, 0, 0.6235294, 1, 1,
0.1006442, -0.3470566, 2.826162, 0, 0.6156863, 1, 1,
0.1036739, 0.8631313, 0.1187217, 0, 0.6117647, 1, 1,
0.1056708, 0.08323047, -0.5664716, 0, 0.6039216, 1, 1,
0.1058602, 1.607165, -0.8978996, 0, 0.5960785, 1, 1,
0.105982, -0.1865288, 2.475915, 0, 0.5921569, 1, 1,
0.1059963, 0.02031221, 2.202439, 0, 0.5843138, 1, 1,
0.109683, 0.8399715, 1.544976, 0, 0.5803922, 1, 1,
0.1103644, -0.1529098, 1.792842, 0, 0.572549, 1, 1,
0.1124335, -0.1252455, 1.951155, 0, 0.5686275, 1, 1,
0.1157867, 1.011742, -0.9909977, 0, 0.5607843, 1, 1,
0.1207713, 0.1941464, 1.577666, 0, 0.5568628, 1, 1,
0.1275335, 0.966781, -0.8561884, 0, 0.5490196, 1, 1,
0.1279933, -0.1351441, 1.014357, 0, 0.5450981, 1, 1,
0.1280704, 1.823773, 0.5278111, 0, 0.5372549, 1, 1,
0.1295718, 1.135419, 0.8115433, 0, 0.5333334, 1, 1,
0.1349693, 0.824438, 0.7411638, 0, 0.5254902, 1, 1,
0.1388779, 0.5969259, 0.1169637, 0, 0.5215687, 1, 1,
0.1448097, 0.748238, 1.354243, 0, 0.5137255, 1, 1,
0.1496463, 0.2391184, 0.4306097, 0, 0.509804, 1, 1,
0.1536065, 0.1228, 0.0357589, 0, 0.5019608, 1, 1,
0.1549491, -0.6683571, 3.778151, 0, 0.4941176, 1, 1,
0.1592041, -1.378982, 1.861678, 0, 0.4901961, 1, 1,
0.1598681, -0.7445279, 3.072962, 0, 0.4823529, 1, 1,
0.1611497, -0.01476305, 2.675597, 0, 0.4784314, 1, 1,
0.1616253, 0.8042521, 1.057019, 0, 0.4705882, 1, 1,
0.1656476, -1.491611, 3.650968, 0, 0.4666667, 1, 1,
0.1705206, -0.902018, 3.447663, 0, 0.4588235, 1, 1,
0.171017, 0.3832374, 0.9565632, 0, 0.454902, 1, 1,
0.1735994, 0.6398394, 0.6370792, 0, 0.4470588, 1, 1,
0.1756952, 0.2334841, -0.6132036, 0, 0.4431373, 1, 1,
0.1783677, -1.42327, 2.413731, 0, 0.4352941, 1, 1,
0.1826552, 0.7396469, -0.7714385, 0, 0.4313726, 1, 1,
0.1847535, 0.8357763, -0.1349128, 0, 0.4235294, 1, 1,
0.1898335, 0.5145025, 0.7276748, 0, 0.4196078, 1, 1,
0.1956518, -1.010987, 2.387823, 0, 0.4117647, 1, 1,
0.2012939, -1.208079, 2.63909, 0, 0.4078431, 1, 1,
0.2027846, 0.2465792, -0.7593375, 0, 0.4, 1, 1,
0.2050045, 1.132782, -0.4644088, 0, 0.3921569, 1, 1,
0.2064357, -0.3637962, 3.032733, 0, 0.3882353, 1, 1,
0.2072767, 1.355744, 0.6150256, 0, 0.3803922, 1, 1,
0.2109007, -1.400898, 2.404444, 0, 0.3764706, 1, 1,
0.212166, -0.7308193, 3.750202, 0, 0.3686275, 1, 1,
0.213119, 1.662307, 0.7039015, 0, 0.3647059, 1, 1,
0.2137403, 0.2361096, 0.1576006, 0, 0.3568628, 1, 1,
0.2141585, -1.501852, 4.392932, 0, 0.3529412, 1, 1,
0.2208149, 0.9540472, 0.1629749, 0, 0.345098, 1, 1,
0.2213014, 1.269831, 0.6417007, 0, 0.3411765, 1, 1,
0.2223709, -1.740732, 3.766336, 0, 0.3333333, 1, 1,
0.2237296, 0.4766547, 0.8477249, 0, 0.3294118, 1, 1,
0.2273803, 0.6666371, 0.9885396, 0, 0.3215686, 1, 1,
0.2283744, -1.568901, 1.396546, 0, 0.3176471, 1, 1,
0.2307194, 0.9106591, 0.861399, 0, 0.3098039, 1, 1,
0.2337149, -1.43016, 4.226678, 0, 0.3058824, 1, 1,
0.2339906, -0.5252931, 3.804632, 0, 0.2980392, 1, 1,
0.2403154, -0.2139659, 1.366413, 0, 0.2901961, 1, 1,
0.2415023, -0.05766556, 2.887433, 0, 0.2862745, 1, 1,
0.2442007, -1.366248, 3.155359, 0, 0.2784314, 1, 1,
0.2477844, 0.09817721, 3.40361, 0, 0.2745098, 1, 1,
0.2505895, -0.5800487, 2.638067, 0, 0.2666667, 1, 1,
0.2516879, -1.584247, 2.726834, 0, 0.2627451, 1, 1,
0.2551961, -0.9588712, 2.768253, 0, 0.254902, 1, 1,
0.2589328, -0.6017762, 2.856961, 0, 0.2509804, 1, 1,
0.2619433, -1.261176, 4.849142, 0, 0.2431373, 1, 1,
0.2635142, -1.131081, 2.496373, 0, 0.2392157, 1, 1,
0.2637011, 2.457366, -2.515577, 0, 0.2313726, 1, 1,
0.2645484, -0.5233965, 2.606503, 0, 0.227451, 1, 1,
0.2659048, 0.5316834, 0.4140393, 0, 0.2196078, 1, 1,
0.2664126, -0.3794004, 2.379919, 0, 0.2156863, 1, 1,
0.2681792, -0.7170862, 3.726919, 0, 0.2078431, 1, 1,
0.2718195, -0.4710522, 3.676783, 0, 0.2039216, 1, 1,
0.2722511, -0.9388605, 2.796654, 0, 0.1960784, 1, 1,
0.2729676, -0.02357944, 2.211111, 0, 0.1882353, 1, 1,
0.2778356, 0.1806375, 2.016226, 0, 0.1843137, 1, 1,
0.2820552, -1.155243, 2.159367, 0, 0.1764706, 1, 1,
0.2833245, 0.6329857, 1.585184, 0, 0.172549, 1, 1,
0.288033, -0.7532342, 4.327461, 0, 0.1647059, 1, 1,
0.2908511, -0.3088647, 4.180282, 0, 0.1607843, 1, 1,
0.2920313, 0.691996, -0.03217414, 0, 0.1529412, 1, 1,
0.2938043, 1.409529, 0.5575304, 0, 0.1490196, 1, 1,
0.2965063, -2.010576, 3.462213, 0, 0.1411765, 1, 1,
0.2966228, 0.4212185, 2.421726, 0, 0.1372549, 1, 1,
0.2972149, 0.8130543, -2.070012, 0, 0.1294118, 1, 1,
0.2984449, -1.027192, 2.950153, 0, 0.1254902, 1, 1,
0.2987963, 1.681542, -0.06982455, 0, 0.1176471, 1, 1,
0.2992012, -1.312066, 3.85928, 0, 0.1137255, 1, 1,
0.3008026, 0.03131439, 1.341732, 0, 0.1058824, 1, 1,
0.301578, 0.3430695, 1.456435, 0, 0.09803922, 1, 1,
0.3038763, 0.5231956, -1.621071, 0, 0.09411765, 1, 1,
0.3100732, 0.8260875, 2.666132, 0, 0.08627451, 1, 1,
0.3117909, -0.2688398, 0.6931431, 0, 0.08235294, 1, 1,
0.3130952, -0.926616, 2.495983, 0, 0.07450981, 1, 1,
0.3278838, 0.3464007, 2.569925, 0, 0.07058824, 1, 1,
0.3325676, -0.2111863, 1.628013, 0, 0.0627451, 1, 1,
0.3336441, 0.05349167, 1.533373, 0, 0.05882353, 1, 1,
0.3422508, 0.228575, 1.375523, 0, 0.05098039, 1, 1,
0.3441339, 0.9837283, 0.8639556, 0, 0.04705882, 1, 1,
0.3533938, 0.5827806, 0.5259637, 0, 0.03921569, 1, 1,
0.3625876, -2.042426, 2.318313, 0, 0.03529412, 1, 1,
0.3659279, -1.608266, 4.611141, 0, 0.02745098, 1, 1,
0.3761453, 0.6963204, -0.8824576, 0, 0.02352941, 1, 1,
0.3778923, 1.296849, -1.336846, 0, 0.01568628, 1, 1,
0.3780503, 0.7400373, 2.51884, 0, 0.01176471, 1, 1,
0.3800296, -0.3791317, 1.44584, 0, 0.003921569, 1, 1,
0.3802101, 1.484507, 0.05908057, 0.003921569, 0, 1, 1,
0.3814592, 1.836262, 0.3243327, 0.007843138, 0, 1, 1,
0.3922733, -1.152206, 3.434247, 0.01568628, 0, 1, 1,
0.3954228, 1.435448, -0.5371391, 0.01960784, 0, 1, 1,
0.3962438, -0.3851402, 2.469383, 0.02745098, 0, 1, 1,
0.4004833, -0.6536199, 2.599404, 0.03137255, 0, 1, 1,
0.4026202, 1.266216, 2.023241, 0.03921569, 0, 1, 1,
0.4026344, 0.8215544, 1.959439, 0.04313726, 0, 1, 1,
0.4075225, -1.397918, 3.300471, 0.05098039, 0, 1, 1,
0.408816, -0.3720844, 2.922469, 0.05490196, 0, 1, 1,
0.4088673, -0.6390602, 2.474171, 0.0627451, 0, 1, 1,
0.4106723, 1.255004, -0.8094417, 0.06666667, 0, 1, 1,
0.4137895, -0.5723226, 1.681378, 0.07450981, 0, 1, 1,
0.4181195, -0.2283986, 0.3542747, 0.07843138, 0, 1, 1,
0.4231818, -0.2168594, 0.9964844, 0.08627451, 0, 1, 1,
0.4267399, 0.4409493, 2.257269, 0.09019608, 0, 1, 1,
0.432885, 0.2257766, 0.5494546, 0.09803922, 0, 1, 1,
0.4373481, 0.1106346, -0.2060707, 0.1058824, 0, 1, 1,
0.43847, 0.3288854, 1.377193, 0.1098039, 0, 1, 1,
0.4419627, 0.2340104, 0.8870794, 0.1176471, 0, 1, 1,
0.4478558, 1.347231, -0.9612324, 0.1215686, 0, 1, 1,
0.4515298, 1.697933, 1.239494, 0.1294118, 0, 1, 1,
0.4540475, 0.7230347, 0.01929665, 0.1333333, 0, 1, 1,
0.4558821, 1.110263, -1.157731, 0.1411765, 0, 1, 1,
0.4593396, -0.4487936, 2.497882, 0.145098, 0, 1, 1,
0.4671816, -0.6454014, 1.913555, 0.1529412, 0, 1, 1,
0.4766082, 1.850445, 0.9113275, 0.1568628, 0, 1, 1,
0.4804362, -0.0817614, 1.996923, 0.1647059, 0, 1, 1,
0.483088, 0.09193449, 0.1853068, 0.1686275, 0, 1, 1,
0.4877048, 1.369482, -0.1213158, 0.1764706, 0, 1, 1,
0.4894844, -1.527572, 2.696424, 0.1803922, 0, 1, 1,
0.4928946, -1.659278, 2.737948, 0.1882353, 0, 1, 1,
0.497123, -1.016633, 3.858951, 0.1921569, 0, 1, 1,
0.4972364, -0.5736787, 2.128008, 0.2, 0, 1, 1,
0.4994074, 1.232298, -0.2101326, 0.2078431, 0, 1, 1,
0.5075442, 0.540879, -0.381966, 0.2117647, 0, 1, 1,
0.5085382, 2.521868, 1.247299, 0.2196078, 0, 1, 1,
0.5110525, -0.7088906, 3.522736, 0.2235294, 0, 1, 1,
0.5189365, 0.1217648, 1.818728, 0.2313726, 0, 1, 1,
0.5202645, 1.572896, -0.593478, 0.2352941, 0, 1, 1,
0.5204316, -1.18992, 3.013236, 0.2431373, 0, 1, 1,
0.5224795, -0.9046429, 3.394549, 0.2470588, 0, 1, 1,
0.5228593, 1.912699, 2.448621, 0.254902, 0, 1, 1,
0.5236027, 1.27088, -1.755579, 0.2588235, 0, 1, 1,
0.5274885, -0.728587, 3.958553, 0.2666667, 0, 1, 1,
0.5335615, -0.1635645, 3.571887, 0.2705882, 0, 1, 1,
0.53444, 0.5148716, 0.8964704, 0.2784314, 0, 1, 1,
0.5348682, -0.05644149, 0.528478, 0.282353, 0, 1, 1,
0.5370572, 1.493632, -0.3126458, 0.2901961, 0, 1, 1,
0.5389029, -0.9202312, 3.074531, 0.2941177, 0, 1, 1,
0.5410234, 0.9935539, -0.933954, 0.3019608, 0, 1, 1,
0.5448819, 1.056227, -0.2216778, 0.3098039, 0, 1, 1,
0.5523737, -0.8266683, 3.502006, 0.3137255, 0, 1, 1,
0.5537288, 0.4704951, 1.161449, 0.3215686, 0, 1, 1,
0.557212, -1.585281, 3.743317, 0.3254902, 0, 1, 1,
0.5609294, 1.04449, -1.063251, 0.3333333, 0, 1, 1,
0.5629401, -1.774713, 2.118707, 0.3372549, 0, 1, 1,
0.5635989, 1.525434, 0.08216763, 0.345098, 0, 1, 1,
0.5648818, 0.1573674, 0.2581663, 0.3490196, 0, 1, 1,
0.5682406, 0.9513379, 0.2117075, 0.3568628, 0, 1, 1,
0.5693952, 0.2785635, 1.513021, 0.3607843, 0, 1, 1,
0.5698715, 0.9039552, 1.017625, 0.3686275, 0, 1, 1,
0.5751373, -0.5535818, 2.01764, 0.372549, 0, 1, 1,
0.5765686, -0.1853129, 2.258725, 0.3803922, 0, 1, 1,
0.5795197, -0.3664954, 3.171977, 0.3843137, 0, 1, 1,
0.5800145, -0.372275, 1.016397, 0.3921569, 0, 1, 1,
0.5815757, -0.02566058, 1.185409, 0.3960784, 0, 1, 1,
0.5840595, -2.670498, 2.133372, 0.4039216, 0, 1, 1,
0.5864255, -0.07302178, 2.818498, 0.4117647, 0, 1, 1,
0.5871355, 2.777291, 1.452672, 0.4156863, 0, 1, 1,
0.587732, -1.104791, 2.534223, 0.4235294, 0, 1, 1,
0.5886948, -1.200771, 1.668907, 0.427451, 0, 1, 1,
0.5938548, -1.8792, 2.551616, 0.4352941, 0, 1, 1,
0.595782, -0.5455259, 1.910318, 0.4392157, 0, 1, 1,
0.5998822, -0.2071017, 3.002184, 0.4470588, 0, 1, 1,
0.6012927, -2.30893, 1.161341, 0.4509804, 0, 1, 1,
0.602121, 0.195434, 2.211252, 0.4588235, 0, 1, 1,
0.6054364, 0.2773153, 0.1440276, 0.4627451, 0, 1, 1,
0.60553, 1.696848, -0.8357302, 0.4705882, 0, 1, 1,
0.6086706, 0.6512678, 1.901116, 0.4745098, 0, 1, 1,
0.6128098, 0.8123775, 2.50391, 0.4823529, 0, 1, 1,
0.6137635, 1.533032, -1.420097, 0.4862745, 0, 1, 1,
0.6160995, -0.4614598, 0.8888406, 0.4941176, 0, 1, 1,
0.6182511, 0.950018, 1.141299, 0.5019608, 0, 1, 1,
0.6256303, 2.244834, 1.244545, 0.5058824, 0, 1, 1,
0.6321074, 1.214022, -0.4753325, 0.5137255, 0, 1, 1,
0.6350521, 0.2039893, 0.4109817, 0.5176471, 0, 1, 1,
0.6354805, -0.4387707, -0.7807934, 0.5254902, 0, 1, 1,
0.6365405, -0.7945468, 3.32963, 0.5294118, 0, 1, 1,
0.6384681, 0.4755439, 0.1858397, 0.5372549, 0, 1, 1,
0.6455917, -0.4212053, 2.370763, 0.5411765, 0, 1, 1,
0.6515867, -0.1355987, 1.452767, 0.5490196, 0, 1, 1,
0.652236, 0.3121605, -0.8029288, 0.5529412, 0, 1, 1,
0.6534055, -0.1703119, 2.764897, 0.5607843, 0, 1, 1,
0.6647916, 0.1047035, -0.362825, 0.5647059, 0, 1, 1,
0.6659687, -0.6577201, 2.163464, 0.572549, 0, 1, 1,
0.6688898, 0.5670087, 0.650201, 0.5764706, 0, 1, 1,
0.6782926, -0.7298686, 2.06194, 0.5843138, 0, 1, 1,
0.6789746, 1.156372, 1.387419, 0.5882353, 0, 1, 1,
0.6790431, -0.3502511, 2.140792, 0.5960785, 0, 1, 1,
0.6796975, 0.6796691, 0.4672753, 0.6039216, 0, 1, 1,
0.6896114, 1.832206, 0.2219688, 0.6078432, 0, 1, 1,
0.6905854, 0.1070984, 4.241179, 0.6156863, 0, 1, 1,
0.7024992, 0.007720356, 1.737454, 0.6196079, 0, 1, 1,
0.7042181, -0.009394968, 1.545059, 0.627451, 0, 1, 1,
0.7235354, 2.774627, 0.4721873, 0.6313726, 0, 1, 1,
0.7281908, 0.5452708, -0.1555571, 0.6392157, 0, 1, 1,
0.7312452, -0.5594175, 2.818393, 0.6431373, 0, 1, 1,
0.7325066, 0.2155699, 1.361604, 0.6509804, 0, 1, 1,
0.7329285, 1.941163, 1.110333, 0.654902, 0, 1, 1,
0.7349678, -1.13757, 3.475532, 0.6627451, 0, 1, 1,
0.7360123, 0.2155549, 3.070362, 0.6666667, 0, 1, 1,
0.7387268, -0.02406609, 1.842956, 0.6745098, 0, 1, 1,
0.7454761, -1.799061, 3.199848, 0.6784314, 0, 1, 1,
0.749103, -1.574706, 2.661688, 0.6862745, 0, 1, 1,
0.7500055, -1.337082, 1.049181, 0.6901961, 0, 1, 1,
0.7545906, 0.4328207, 0.4014657, 0.6980392, 0, 1, 1,
0.7587219, -1.275612, 2.412626, 0.7058824, 0, 1, 1,
0.7616342, 0.818374, 3.61295, 0.7098039, 0, 1, 1,
0.7676718, -0.01720086, 3.071898, 0.7176471, 0, 1, 1,
0.7691202, 0.1119197, 0.4818484, 0.7215686, 0, 1, 1,
0.7702314, 0.6782469, 1.245311, 0.7294118, 0, 1, 1,
0.7716011, 1.176737, 0.7574064, 0.7333333, 0, 1, 1,
0.7779299, -0.9133383, 1.912814, 0.7411765, 0, 1, 1,
0.7789246, -0.5518457, 2.138531, 0.7450981, 0, 1, 1,
0.7833682, 0.4869708, 3.013457, 0.7529412, 0, 1, 1,
0.7876408, 0.0217099, 0.8896279, 0.7568628, 0, 1, 1,
0.7929248, -3.028692, 0.6409979, 0.7647059, 0, 1, 1,
0.7953514, 1.204354, -0.5283476, 0.7686275, 0, 1, 1,
0.7954547, -0.4711748, 2.012877, 0.7764706, 0, 1, 1,
0.8010951, 1.073786, 0.6626412, 0.7803922, 0, 1, 1,
0.8014556, 0.861875, 0.64223, 0.7882353, 0, 1, 1,
0.8050335, -1.230288, 3.005382, 0.7921569, 0, 1, 1,
0.8076465, 2.071835, 1.071464, 0.8, 0, 1, 1,
0.8086267, -0.216572, 2.357685, 0.8078431, 0, 1, 1,
0.8088965, 0.3336841, 0.2813581, 0.8117647, 0, 1, 1,
0.8134362, -0.3803275, 1.95525, 0.8196079, 0, 1, 1,
0.8138009, -0.2390397, 1.086429, 0.8235294, 0, 1, 1,
0.8144536, 0.4498878, -0.1231581, 0.8313726, 0, 1, 1,
0.8196704, 1.171628, 0.8392484, 0.8352941, 0, 1, 1,
0.8245565, -0.9894771, 3.855801, 0.8431373, 0, 1, 1,
0.8292729, 1.919982, -2.092731, 0.8470588, 0, 1, 1,
0.8345597, 0.6569445, 2.66669, 0.854902, 0, 1, 1,
0.8393426, -0.3655399, 0.04460295, 0.8588235, 0, 1, 1,
0.8408561, 1.392423, 0.03338754, 0.8666667, 0, 1, 1,
0.8411633, 0.3775632, 1.751413, 0.8705882, 0, 1, 1,
0.8528285, -1.209729, 1.326399, 0.8784314, 0, 1, 1,
0.8533424, -0.0118033, 1.345246, 0.8823529, 0, 1, 1,
0.8572813, 1.293301, -1.238398, 0.8901961, 0, 1, 1,
0.8627632, 0.1471844, 0.5083643, 0.8941177, 0, 1, 1,
0.8657378, -1.437785, 2.442159, 0.9019608, 0, 1, 1,
0.8690292, -0.1498441, 1.269421, 0.9098039, 0, 1, 1,
0.873713, -2.597929, 2.297508, 0.9137255, 0, 1, 1,
0.875583, 1.791467, -0.2358268, 0.9215686, 0, 1, 1,
0.8832428, -0.3073429, 1.977109, 0.9254902, 0, 1, 1,
0.8834788, -1.326643, 1.974113, 0.9333333, 0, 1, 1,
0.8850835, 0.8072808, 1.522341, 0.9372549, 0, 1, 1,
0.8916689, -0.4206097, 4.224813, 0.945098, 0, 1, 1,
0.8931311, 0.7624531, 0.2761649, 0.9490196, 0, 1, 1,
0.9007916, -0.183003, 1.28761, 0.9568627, 0, 1, 1,
0.903385, -0.6765575, 2.648046, 0.9607843, 0, 1, 1,
0.9062219, -0.9476624, 0.4285398, 0.9686275, 0, 1, 1,
0.9062688, -0.6921703, 1.609652, 0.972549, 0, 1, 1,
0.9174885, -0.6221821, 2.828364, 0.9803922, 0, 1, 1,
0.9290575, 0.1595878, 1.729706, 0.9843137, 0, 1, 1,
0.937767, -0.5473101, 1.364597, 0.9921569, 0, 1, 1,
0.94867, -0.09109893, 1.33871, 0.9960784, 0, 1, 1,
0.9531327, 1.746266, 0.5657314, 1, 0, 0.9960784, 1,
0.9567324, -1.262891, 0.810617, 1, 0, 0.9882353, 1,
0.9577064, -0.9061601, 0.8939157, 1, 0, 0.9843137, 1,
0.9586719, 0.1309726, 0.8329373, 1, 0, 0.9764706, 1,
0.9655644, -0.7582809, 2.711984, 1, 0, 0.972549, 1,
0.9719364, 1.281132, 3.16215, 1, 0, 0.9647059, 1,
0.9747293, 0.7932919, -0.1303391, 1, 0, 0.9607843, 1,
0.9809933, 2.160988, 0.5362652, 1, 0, 0.9529412, 1,
0.981465, -0.5900922, 2.02537, 1, 0, 0.9490196, 1,
0.9863042, 1.663551, -0.2100731, 1, 0, 0.9411765, 1,
0.9923318, -0.07846252, 1.982394, 1, 0, 0.9372549, 1,
0.9981632, -0.07135358, 0.603094, 1, 0, 0.9294118, 1,
1.005202, -0.03555527, 1.333993, 1, 0, 0.9254902, 1,
1.012353, -0.9897532, 1.045306, 1, 0, 0.9176471, 1,
1.01834, 0.6474156, 1.301287, 1, 0, 0.9137255, 1,
1.020126, 1.24922, -0.2098111, 1, 0, 0.9058824, 1,
1.022189, 1.004206, 1.443401, 1, 0, 0.9019608, 1,
1.026798, 0.04970826, 1.490913, 1, 0, 0.8941177, 1,
1.035017, 1.503521, 0.1051588, 1, 0, 0.8862745, 1,
1.038676, -0.2086276, 1.159736, 1, 0, 0.8823529, 1,
1.042038, 1.17219, -1.110685, 1, 0, 0.8745098, 1,
1.04848, -0.2305805, 1.09253, 1, 0, 0.8705882, 1,
1.05056, -0.1283011, 1.736626, 1, 0, 0.8627451, 1,
1.065667, -0.7890143, 3.194848, 1, 0, 0.8588235, 1,
1.068152, -0.1269162, 3.096841, 1, 0, 0.8509804, 1,
1.069146, -0.4754754, 2.770056, 1, 0, 0.8470588, 1,
1.075292, -0.703408, 3.062618, 1, 0, 0.8392157, 1,
1.091515, -1.16553, 3.11427, 1, 0, 0.8352941, 1,
1.100646, -0.6777075, 1.888807, 1, 0, 0.827451, 1,
1.107627, -0.3813553, 1.246276, 1, 0, 0.8235294, 1,
1.108145, -0.436529, 2.627728, 1, 0, 0.8156863, 1,
1.113996, 1.381175, 0.5646933, 1, 0, 0.8117647, 1,
1.116874, -0.2985982, 3.172016, 1, 0, 0.8039216, 1,
1.121174, -1.169584, 3.136614, 1, 0, 0.7960784, 1,
1.127397, 0.6070112, 0.01776484, 1, 0, 0.7921569, 1,
1.134753, 0.465262, 2.393692, 1, 0, 0.7843137, 1,
1.135331, 0.1987224, -0.9076447, 1, 0, 0.7803922, 1,
1.138798, -0.06213911, 2.018126, 1, 0, 0.772549, 1,
1.14027, 1.334512, 1.148972, 1, 0, 0.7686275, 1,
1.140279, 0.3687609, 1.850039, 1, 0, 0.7607843, 1,
1.144004, 0.05202862, 1.244886, 1, 0, 0.7568628, 1,
1.147624, 1.076145, 0.6550103, 1, 0, 0.7490196, 1,
1.155889, -0.1176001, 1.842683, 1, 0, 0.7450981, 1,
1.157973, 0.6841486, 2.14608, 1, 0, 0.7372549, 1,
1.158475, -0.2713138, 2.719159, 1, 0, 0.7333333, 1,
1.167808, -0.8663369, 2.083329, 1, 0, 0.7254902, 1,
1.167994, -0.6295255, 2.720448, 1, 0, 0.7215686, 1,
1.173953, -1.455412, 1.337637, 1, 0, 0.7137255, 1,
1.178463, 0.1969258, 1.103226, 1, 0, 0.7098039, 1,
1.183004, 0.782141, 2.743634, 1, 0, 0.7019608, 1,
1.184121, 0.0647235, 2.993367, 1, 0, 0.6941177, 1,
1.187523, 0.3869367, 1.903882, 1, 0, 0.6901961, 1,
1.187925, 0.5062248, 0.07636076, 1, 0, 0.682353, 1,
1.18921, 0.6073981, 1.857013, 1, 0, 0.6784314, 1,
1.19536, -1.136833, 0.7814648, 1, 0, 0.6705883, 1,
1.199161, -1.117452, 2.11222, 1, 0, 0.6666667, 1,
1.209134, 0.4666192, 2.181071, 1, 0, 0.6588235, 1,
1.215919, -1.18006, 2.874812, 1, 0, 0.654902, 1,
1.222581, 1.792003, 0.9026453, 1, 0, 0.6470588, 1,
1.225211, -0.8555793, 1.654527, 1, 0, 0.6431373, 1,
1.227063, -0.8499242, 3.604032, 1, 0, 0.6352941, 1,
1.236373, -0.061099, 0.8067935, 1, 0, 0.6313726, 1,
1.240465, -0.1515868, 1.555677, 1, 0, 0.6235294, 1,
1.246309, -0.3345334, 1.799142, 1, 0, 0.6196079, 1,
1.254055, 0.2894602, 2.082766, 1, 0, 0.6117647, 1,
1.266762, 0.3455694, 1.113404, 1, 0, 0.6078432, 1,
1.26844, -0.3650999, 0.4786942, 1, 0, 0.6, 1,
1.270568, -0.2986075, 2.230739, 1, 0, 0.5921569, 1,
1.294106, -1.520725, 2.190118, 1, 0, 0.5882353, 1,
1.29505, -0.169071, 2.774716, 1, 0, 0.5803922, 1,
1.302426, -1.245996, 4.103786, 1, 0, 0.5764706, 1,
1.308987, 1.067434, -0.9537309, 1, 0, 0.5686275, 1,
1.314039, -0.3672822, 0.03879765, 1, 0, 0.5647059, 1,
1.319035, 1.360297, 1.249851, 1, 0, 0.5568628, 1,
1.319326, 0.2330917, 0.5031376, 1, 0, 0.5529412, 1,
1.322017, -0.6382211, 3.379162, 1, 0, 0.5450981, 1,
1.3239, -1.205544, 2.604505, 1, 0, 0.5411765, 1,
1.332485, -1.209301, 2.929746, 1, 0, 0.5333334, 1,
1.340208, -1.096313, 3.326854, 1, 0, 0.5294118, 1,
1.34415, 0.5602853, 3.441911, 1, 0, 0.5215687, 1,
1.37406, -0.578111, 2.232344, 1, 0, 0.5176471, 1,
1.381671, -0.1894299, 0.3697506, 1, 0, 0.509804, 1,
1.393258, -0.0342202, 1.884891, 1, 0, 0.5058824, 1,
1.39415, 0.414915, 1.933443, 1, 0, 0.4980392, 1,
1.398096, 0.8246767, 2.421639, 1, 0, 0.4901961, 1,
1.424019, -1.263716, 2.997742, 1, 0, 0.4862745, 1,
1.428641, 0.5530934, 0.4076657, 1, 0, 0.4784314, 1,
1.442023, -0.2833934, 2.055759, 1, 0, 0.4745098, 1,
1.444443, 0.7162708, -0.286491, 1, 0, 0.4666667, 1,
1.449223, -1.303531, 2.20807, 1, 0, 0.4627451, 1,
1.451522, 0.8999234, 2.119643, 1, 0, 0.454902, 1,
1.453773, -0.4316203, 3.471103, 1, 0, 0.4509804, 1,
1.471317, -0.2554525, 1.442077, 1, 0, 0.4431373, 1,
1.476451, -0.1385765, 0.1612035, 1, 0, 0.4392157, 1,
1.480064, -1.541577, 2.348505, 1, 0, 0.4313726, 1,
1.481516, 0.4670657, 0.3633287, 1, 0, 0.427451, 1,
1.493262, -1.371685, 2.953864, 1, 0, 0.4196078, 1,
1.494789, 1.558896, 0.2281917, 1, 0, 0.4156863, 1,
1.495883, -0.3967557, 2.443725, 1, 0, 0.4078431, 1,
1.496964, 0.718208, -1.208078, 1, 0, 0.4039216, 1,
1.505809, 0.3159671, 1.610335, 1, 0, 0.3960784, 1,
1.507302, -0.6349477, 2.248955, 1, 0, 0.3882353, 1,
1.516403, 1.498913, -0.2968566, 1, 0, 0.3843137, 1,
1.539401, -0.5833653, 1.122163, 1, 0, 0.3764706, 1,
1.54736, 0.5492278, 0.268752, 1, 0, 0.372549, 1,
1.559013, 0.8294803, -1.13185, 1, 0, 0.3647059, 1,
1.559441, 1.591342, 1.670856, 1, 0, 0.3607843, 1,
1.560202, -0.1903052, 2.085511, 1, 0, 0.3529412, 1,
1.567112, -2.473597, 1.65811, 1, 0, 0.3490196, 1,
1.5876, 0.2721758, -0.134548, 1, 0, 0.3411765, 1,
1.593967, -1.328558, 2.095423, 1, 0, 0.3372549, 1,
1.612914, 0.8730664, 0.8381491, 1, 0, 0.3294118, 1,
1.632454, -1.542985, 2.741886, 1, 0, 0.3254902, 1,
1.632982, 0.3404782, 1.998804, 1, 0, 0.3176471, 1,
1.633523, 0.07105728, 2.63484, 1, 0, 0.3137255, 1,
1.682953, -0.8605243, 2.016775, 1, 0, 0.3058824, 1,
1.688514, 1.487353, 0.7890425, 1, 0, 0.2980392, 1,
1.702395, 0.00931232, 1.494422, 1, 0, 0.2941177, 1,
1.725446, 1.622642, 1.421106, 1, 0, 0.2862745, 1,
1.731963, 0.695772, 1.690299, 1, 0, 0.282353, 1,
1.734502, -0.3706414, 1.196867, 1, 0, 0.2745098, 1,
1.744768, 0.08999581, 1.335756, 1, 0, 0.2705882, 1,
1.74894, 0.2765145, 0.128329, 1, 0, 0.2627451, 1,
1.752197, -1.228868, 3.049961, 1, 0, 0.2588235, 1,
1.768252, 0.460754, 1.728101, 1, 0, 0.2509804, 1,
1.778113, 0.9957519, 1.388713, 1, 0, 0.2470588, 1,
1.781986, -1.420204, 2.526509, 1, 0, 0.2392157, 1,
1.792352, -2.490318, 3.342357, 1, 0, 0.2352941, 1,
1.815607, 0.3115008, 2.372437, 1, 0, 0.227451, 1,
1.82836, -0.2134281, 0.3952429, 1, 0, 0.2235294, 1,
1.853144, 0.225493, 1.897065, 1, 0, 0.2156863, 1,
1.859686, -0.9409696, 3.244809, 1, 0, 0.2117647, 1,
1.873434, 0.4393053, 0.1538051, 1, 0, 0.2039216, 1,
1.875936, 0.2209594, -0.1292638, 1, 0, 0.1960784, 1,
1.876441, 0.6882679, 2.194542, 1, 0, 0.1921569, 1,
1.877086, 0.5154986, 0.9992108, 1, 0, 0.1843137, 1,
1.89726, -1.153306, 1.260046, 1, 0, 0.1803922, 1,
1.90058, -0.6468843, 1.913299, 1, 0, 0.172549, 1,
1.905772, 1.110377, 1.463192, 1, 0, 0.1686275, 1,
1.915058, 1.054339, 0.7556844, 1, 0, 0.1607843, 1,
1.928059, -0.6064869, 3.058435, 1, 0, 0.1568628, 1,
1.951877, 1.346537, 3.359155, 1, 0, 0.1490196, 1,
1.994427, -0.6666496, 1.596736, 1, 0, 0.145098, 1,
2.008334, 0.803607, 1.152596, 1, 0, 0.1372549, 1,
2.018647, 2.571982, 1.268604, 1, 0, 0.1333333, 1,
2.040436, 0.3817675, 1.860093, 1, 0, 0.1254902, 1,
2.057098, -0.8180181, 1.241833, 1, 0, 0.1215686, 1,
2.097996, 0.19636, 0.6437252, 1, 0, 0.1137255, 1,
2.121477, 0.5369946, 3.14158, 1, 0, 0.1098039, 1,
2.12301, 0.482616, 3.324365, 1, 0, 0.1019608, 1,
2.126164, -2.099154, 1.564234, 1, 0, 0.09411765, 1,
2.204647, -0.2103986, 1.655524, 1, 0, 0.09019608, 1,
2.210318, -0.643194, 2.351022, 1, 0, 0.08235294, 1,
2.219372, -0.4272471, 1.347499, 1, 0, 0.07843138, 1,
2.248579, 0.5098156, 1.655443, 1, 0, 0.07058824, 1,
2.363868, 0.9022138, 1.2148, 1, 0, 0.06666667, 1,
2.386923, 1.841276, 0.8758433, 1, 0, 0.05882353, 1,
2.407552, 0.8917037, 1.904357, 1, 0, 0.05490196, 1,
2.425047, 1.128924, 1.367072, 1, 0, 0.04705882, 1,
2.525355, 0.3200154, 0.803845, 1, 0, 0.04313726, 1,
2.611111, 0.0201724, 1.323925, 1, 0, 0.03529412, 1,
2.657609, -0.1982485, 1.595376, 1, 0, 0.03137255, 1,
2.696546, -0.9306243, 0.850757, 1, 0, 0.02352941, 1,
2.767959, -0.1459594, -0.3742952, 1, 0, 0.01960784, 1,
2.90523, -0.1376804, 2.427184, 1, 0, 0.01176471, 1,
2.958671, 2.097611, -0.2262811, 1, 0, 0.007843138, 1
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
-0.07857287, -4.031394, -6.983831, 0, -0.5, 0.5, 0.5,
-0.07857287, -4.031394, -6.983831, 1, -0.5, 0.5, 0.5,
-0.07857287, -4.031394, -6.983831, 1, 1.5, 0.5, 0.5,
-0.07857287, -4.031394, -6.983831, 0, 1.5, 0.5, 0.5
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
-4.145442, -0.07086873, -6.983831, 0, -0.5, 0.5, 0.5,
-4.145442, -0.07086873, -6.983831, 1, -0.5, 0.5, 0.5,
-4.145442, -0.07086873, -6.983831, 1, 1.5, 0.5, 0.5,
-4.145442, -0.07086873, -6.983831, 0, 1.5, 0.5, 0.5
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
-4.145442, -4.031394, 0.6600654, 0, -0.5, 0.5, 0.5,
-4.145442, -4.031394, 0.6600654, 1, -0.5, 0.5, 0.5,
-4.145442, -4.031394, 0.6600654, 1, 1.5, 0.5, 0.5,
-4.145442, -4.031394, 0.6600654, 0, 1.5, 0.5, 0.5
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
-3, -3.117427, -5.219855,
2, -3.117427, -5.219855,
-3, -3.117427, -5.219855,
-3, -3.269755, -5.513851,
-2, -3.117427, -5.219855,
-2, -3.269755, -5.513851,
-1, -3.117427, -5.219855,
-1, -3.269755, -5.513851,
0, -3.117427, -5.219855,
0, -3.269755, -5.513851,
1, -3.117427, -5.219855,
1, -3.269755, -5.513851,
2, -3.117427, -5.219855,
2, -3.269755, -5.513851
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
-3, -3.574411, -6.101843, 0, -0.5, 0.5, 0.5,
-3, -3.574411, -6.101843, 1, -0.5, 0.5, 0.5,
-3, -3.574411, -6.101843, 1, 1.5, 0.5, 0.5,
-3, -3.574411, -6.101843, 0, 1.5, 0.5, 0.5,
-2, -3.574411, -6.101843, 0, -0.5, 0.5, 0.5,
-2, -3.574411, -6.101843, 1, -0.5, 0.5, 0.5,
-2, -3.574411, -6.101843, 1, 1.5, 0.5, 0.5,
-2, -3.574411, -6.101843, 0, 1.5, 0.5, 0.5,
-1, -3.574411, -6.101843, 0, -0.5, 0.5, 0.5,
-1, -3.574411, -6.101843, 1, -0.5, 0.5, 0.5,
-1, -3.574411, -6.101843, 1, 1.5, 0.5, 0.5,
-1, -3.574411, -6.101843, 0, 1.5, 0.5, 0.5,
0, -3.574411, -6.101843, 0, -0.5, 0.5, 0.5,
0, -3.574411, -6.101843, 1, -0.5, 0.5, 0.5,
0, -3.574411, -6.101843, 1, 1.5, 0.5, 0.5,
0, -3.574411, -6.101843, 0, 1.5, 0.5, 0.5,
1, -3.574411, -6.101843, 0, -0.5, 0.5, 0.5,
1, -3.574411, -6.101843, 1, -0.5, 0.5, 0.5,
1, -3.574411, -6.101843, 1, 1.5, 0.5, 0.5,
1, -3.574411, -6.101843, 0, 1.5, 0.5, 0.5,
2, -3.574411, -6.101843, 0, -0.5, 0.5, 0.5,
2, -3.574411, -6.101843, 1, -0.5, 0.5, 0.5,
2, -3.574411, -6.101843, 1, 1.5, 0.5, 0.5,
2, -3.574411, -6.101843, 0, 1.5, 0.5, 0.5
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
-3.206934, -3, -5.219855,
-3.206934, 2, -5.219855,
-3.206934, -3, -5.219855,
-3.363352, -3, -5.513851,
-3.206934, -2, -5.219855,
-3.363352, -2, -5.513851,
-3.206934, -1, -5.219855,
-3.363352, -1, -5.513851,
-3.206934, 0, -5.219855,
-3.363352, 0, -5.513851,
-3.206934, 1, -5.219855,
-3.363352, 1, -5.513851,
-3.206934, 2, -5.219855,
-3.363352, 2, -5.513851
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
-3.676188, -3, -6.101843, 0, -0.5, 0.5, 0.5,
-3.676188, -3, -6.101843, 1, -0.5, 0.5, 0.5,
-3.676188, -3, -6.101843, 1, 1.5, 0.5, 0.5,
-3.676188, -3, -6.101843, 0, 1.5, 0.5, 0.5,
-3.676188, -2, -6.101843, 0, -0.5, 0.5, 0.5,
-3.676188, -2, -6.101843, 1, -0.5, 0.5, 0.5,
-3.676188, -2, -6.101843, 1, 1.5, 0.5, 0.5,
-3.676188, -2, -6.101843, 0, 1.5, 0.5, 0.5,
-3.676188, -1, -6.101843, 0, -0.5, 0.5, 0.5,
-3.676188, -1, -6.101843, 1, -0.5, 0.5, 0.5,
-3.676188, -1, -6.101843, 1, 1.5, 0.5, 0.5,
-3.676188, -1, -6.101843, 0, 1.5, 0.5, 0.5,
-3.676188, 0, -6.101843, 0, -0.5, 0.5, 0.5,
-3.676188, 0, -6.101843, 1, -0.5, 0.5, 0.5,
-3.676188, 0, -6.101843, 1, 1.5, 0.5, 0.5,
-3.676188, 0, -6.101843, 0, 1.5, 0.5, 0.5,
-3.676188, 1, -6.101843, 0, -0.5, 0.5, 0.5,
-3.676188, 1, -6.101843, 1, -0.5, 0.5, 0.5,
-3.676188, 1, -6.101843, 1, 1.5, 0.5, 0.5,
-3.676188, 1, -6.101843, 0, 1.5, 0.5, 0.5,
-3.676188, 2, -6.101843, 0, -0.5, 0.5, 0.5,
-3.676188, 2, -6.101843, 1, -0.5, 0.5, 0.5,
-3.676188, 2, -6.101843, 1, 1.5, 0.5, 0.5,
-3.676188, 2, -6.101843, 0, 1.5, 0.5, 0.5
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
-3.206934, -3.117427, -4,
-3.206934, -3.117427, 6,
-3.206934, -3.117427, -4,
-3.363352, -3.269755, -4,
-3.206934, -3.117427, -2,
-3.363352, -3.269755, -2,
-3.206934, -3.117427, 0,
-3.363352, -3.269755, 0,
-3.206934, -3.117427, 2,
-3.363352, -3.269755, 2,
-3.206934, -3.117427, 4,
-3.363352, -3.269755, 4,
-3.206934, -3.117427, 6,
-3.363352, -3.269755, 6
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
"4",
"6"
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
-3.676188, -3.574411, -4, 0, -0.5, 0.5, 0.5,
-3.676188, -3.574411, -4, 1, -0.5, 0.5, 0.5,
-3.676188, -3.574411, -4, 1, 1.5, 0.5, 0.5,
-3.676188, -3.574411, -4, 0, 1.5, 0.5, 0.5,
-3.676188, -3.574411, -2, 0, -0.5, 0.5, 0.5,
-3.676188, -3.574411, -2, 1, -0.5, 0.5, 0.5,
-3.676188, -3.574411, -2, 1, 1.5, 0.5, 0.5,
-3.676188, -3.574411, -2, 0, 1.5, 0.5, 0.5,
-3.676188, -3.574411, 0, 0, -0.5, 0.5, 0.5,
-3.676188, -3.574411, 0, 1, -0.5, 0.5, 0.5,
-3.676188, -3.574411, 0, 1, 1.5, 0.5, 0.5,
-3.676188, -3.574411, 0, 0, 1.5, 0.5, 0.5,
-3.676188, -3.574411, 2, 0, -0.5, 0.5, 0.5,
-3.676188, -3.574411, 2, 1, -0.5, 0.5, 0.5,
-3.676188, -3.574411, 2, 1, 1.5, 0.5, 0.5,
-3.676188, -3.574411, 2, 0, 1.5, 0.5, 0.5,
-3.676188, -3.574411, 4, 0, -0.5, 0.5, 0.5,
-3.676188, -3.574411, 4, 1, -0.5, 0.5, 0.5,
-3.676188, -3.574411, 4, 1, 1.5, 0.5, 0.5,
-3.676188, -3.574411, 4, 0, 1.5, 0.5, 0.5,
-3.676188, -3.574411, 6, 0, -0.5, 0.5, 0.5,
-3.676188, -3.574411, 6, 1, -0.5, 0.5, 0.5,
-3.676188, -3.574411, 6, 1, 1.5, 0.5, 0.5,
-3.676188, -3.574411, 6, 0, 1.5, 0.5, 0.5
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
-3.206934, -3.117427, -5.219855,
-3.206934, 2.975689, -5.219855,
-3.206934, -3.117427, 6.539986,
-3.206934, 2.975689, 6.539986,
-3.206934, -3.117427, -5.219855,
-3.206934, -3.117427, 6.539986,
-3.206934, 2.975689, -5.219855,
-3.206934, 2.975689, 6.539986,
-3.206934, -3.117427, -5.219855,
3.049788, -3.117427, -5.219855,
-3.206934, -3.117427, 6.539986,
3.049788, -3.117427, 6.539986,
-3.206934, 2.975689, -5.219855,
3.049788, 2.975689, -5.219855,
-3.206934, 2.975689, 6.539986,
3.049788, 2.975689, 6.539986,
3.049788, -3.117427, -5.219855,
3.049788, 2.975689, -5.219855,
3.049788, -3.117427, 6.539986,
3.049788, 2.975689, 6.539986,
3.049788, -3.117427, -5.219855,
3.049788, -3.117427, 6.539986,
3.049788, 2.975689, -5.219855,
3.049788, 2.975689, 6.539986
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
var radius = 7.821795;
var distance = 34.80005;
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
mvMatrix.translate( 0.07857287, 0.07086873, -0.6600654 );
mvMatrix.scale( 1.351679, 1.387972, 0.7191491 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.80005);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
bromacil<-read.table("bromacil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bromacil$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromacil' not found
```

```r
y<-bromacil$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromacil' not found
```

```r
z<-bromacil$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromacil' not found
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
-3.115817, -0.2405895, -2.282552, 0, 0, 1, 1, 1,
-2.780955, -0.2219276, 0.1908178, 1, 0, 0, 1, 1,
-2.7716, -0.7058065, -2.956168, 1, 0, 0, 1, 1,
-2.700821, 1.109614, -0.0674376, 1, 0, 0, 1, 1,
-2.549287, -0.9900443, -0.2246436, 1, 0, 0, 1, 1,
-2.499971, 0.7256367, -1.459871, 1, 0, 0, 1, 1,
-2.437599, 1.807136, -0.4071555, 0, 0, 0, 1, 1,
-2.412642, 0.7427239, -1.718237, 0, 0, 0, 1, 1,
-2.360469, -0.5440414, -2.593395, 0, 0, 0, 1, 1,
-2.358294, -1.92002, -2.501456, 0, 0, 0, 1, 1,
-2.355234, -0.2019041, -2.525585, 0, 0, 0, 1, 1,
-2.272984, -1.071914, -1.810618, 0, 0, 0, 1, 1,
-2.238976, 1.413148, -1.465912, 0, 0, 0, 1, 1,
-2.231753, 0.5667397, -0.3455588, 1, 1, 1, 1, 1,
-2.194732, -0.862056, -3.317175, 1, 1, 1, 1, 1,
-2.18832, -0.5043209, -0.8597437, 1, 1, 1, 1, 1,
-2.146978, -0.8350544, -0.3229938, 1, 1, 1, 1, 1,
-2.135372, -0.5633484, -4.943721, 1, 1, 1, 1, 1,
-2.114619, 0.4648352, -1.741848, 1, 1, 1, 1, 1,
-2.10665, -0.6794002, -3.572915, 1, 1, 1, 1, 1,
-2.086404, 0.4530195, -0.4569736, 1, 1, 1, 1, 1,
-2.08122, -0.32236, -2.214232, 1, 1, 1, 1, 1,
-2.079954, 1.370135, -0.1554423, 1, 1, 1, 1, 1,
-2.069242, 0.6597303, -2.041434, 1, 1, 1, 1, 1,
-2.065784, 0.9799861, -1.025264, 1, 1, 1, 1, 1,
-2.043292, 0.4383008, 0.832548, 1, 1, 1, 1, 1,
-2.024409, 1.226125, -0.6548808, 1, 1, 1, 1, 1,
-2.000416, 0.6293914, -0.4189273, 1, 1, 1, 1, 1,
-1.957882, 1.589493, 0.2248628, 0, 0, 1, 1, 1,
-1.954502, -0.07976032, -2.002922, 1, 0, 0, 1, 1,
-1.949721, 1.258278, -1.00351, 1, 0, 0, 1, 1,
-1.913565, -2.201752, -4.375144, 1, 0, 0, 1, 1,
-1.903597, 1.116418, -1.067565, 1, 0, 0, 1, 1,
-1.891203, 1.829623, -0.1484851, 1, 0, 0, 1, 1,
-1.877468, -0.1736351, -1.100885, 0, 0, 0, 1, 1,
-1.863307, 0.280034, -1.830284, 0, 0, 0, 1, 1,
-1.860231, -1.375372, -2.704257, 0, 0, 0, 1, 1,
-1.829308, 0.1669161, -0.7644693, 0, 0, 0, 1, 1,
-1.820712, -0.3402416, -2.262374, 0, 0, 0, 1, 1,
-1.806959, -0.9293331, -2.738547, 0, 0, 0, 1, 1,
-1.802677, -2.242343, -1.574471, 0, 0, 0, 1, 1,
-1.784898, -1.198839, -2.754107, 1, 1, 1, 1, 1,
-1.777796, -0.9533024, -1.621768, 1, 1, 1, 1, 1,
-1.761835, -0.8910546, -3.04526, 1, 1, 1, 1, 1,
-1.75724, -0.4313112, -2.568095, 1, 1, 1, 1, 1,
-1.748086, 1.109877, -1.247258, 1, 1, 1, 1, 1,
-1.70772, 1.508458, -0.741946, 1, 1, 1, 1, 1,
-1.706591, 0.2421863, -2.319107, 1, 1, 1, 1, 1,
-1.700717, 0.0352157, -1.263815, 1, 1, 1, 1, 1,
-1.688044, 0.3064505, 0.4721408, 1, 1, 1, 1, 1,
-1.679636, 0.3339753, -0.9724895, 1, 1, 1, 1, 1,
-1.674881, 1.469595, -3.16098, 1, 1, 1, 1, 1,
-1.662912, -0.589906, -2.335405, 1, 1, 1, 1, 1,
-1.657951, 0.7357721, -1.22874, 1, 1, 1, 1, 1,
-1.652776, 0.2869391, 0.08039836, 1, 1, 1, 1, 1,
-1.637743, -1.510565, -3.803757, 1, 1, 1, 1, 1,
-1.62172, -0.1644051, -1.273075, 0, 0, 1, 1, 1,
-1.619695, 0.8197112, -2.21139, 1, 0, 0, 1, 1,
-1.61694, 2.16881, -0.8918769, 1, 0, 0, 1, 1,
-1.609622, -0.5464619, -2.578441, 1, 0, 0, 1, 1,
-1.603912, 1.937092, -1.105359, 1, 0, 0, 1, 1,
-1.600031, -0.7129768, -2.341781, 1, 0, 0, 1, 1,
-1.598179, -1.392966, -0.7177189, 0, 0, 0, 1, 1,
-1.569157, 1.131613, -1.285264, 0, 0, 0, 1, 1,
-1.558767, 0.4387786, -1.635555, 0, 0, 0, 1, 1,
-1.549146, -1.379237, -2.683246, 0, 0, 0, 1, 1,
-1.53148, -0.677295, -2.091088, 0, 0, 0, 1, 1,
-1.517756, 1.168839, -0.1304391, 0, 0, 0, 1, 1,
-1.509954, -0.6475603, -3.128802, 0, 0, 0, 1, 1,
-1.50957, 0.7705823, -2.619671, 1, 1, 1, 1, 1,
-1.508808, -0.01434153, -1.345111, 1, 1, 1, 1, 1,
-1.508502, -0.06465073, -2.090247, 1, 1, 1, 1, 1,
-1.507877, -1.278172, -2.087052, 1, 1, 1, 1, 1,
-1.504625, 0.4032045, -1.048605, 1, 1, 1, 1, 1,
-1.501969, -1.101745, -2.382729, 1, 1, 1, 1, 1,
-1.496765, 0.5838652, -2.966457, 1, 1, 1, 1, 1,
-1.49476, -1.671242, -2.1251, 1, 1, 1, 1, 1,
-1.491652, 1.438572, -1.203482, 1, 1, 1, 1, 1,
-1.489033, 0.211241, -1.861864, 1, 1, 1, 1, 1,
-1.460596, 0.8365674, -0.2695354, 1, 1, 1, 1, 1,
-1.448342, 0.4708435, -1.471677, 1, 1, 1, 1, 1,
-1.446934, -1.797532, -2.028189, 1, 1, 1, 1, 1,
-1.442328, 1.102854, -0.5545816, 1, 1, 1, 1, 1,
-1.439478, 0.9110641, 0.3352098, 1, 1, 1, 1, 1,
-1.422811, -0.8774192, -2.331545, 0, 0, 1, 1, 1,
-1.413829, -1.474255, -2.16893, 1, 0, 0, 1, 1,
-1.378974, 2.208486, -1.475964, 1, 0, 0, 1, 1,
-1.370162, -0.3361182, -1.292256, 1, 0, 0, 1, 1,
-1.363946, 0.6510726, -2.4246, 1, 0, 0, 1, 1,
-1.362825, 0.715823, 0.2665614, 1, 0, 0, 1, 1,
-1.358579, -1.930291, -2.682442, 0, 0, 0, 1, 1,
-1.356654, -0.4156972, -1.948282, 0, 0, 0, 1, 1,
-1.346887, 0.07381915, -1.150542, 0, 0, 0, 1, 1,
-1.343277, -1.27795, -4.359865, 0, 0, 0, 1, 1,
-1.338003, -1.655535, -1.798972, 0, 0, 0, 1, 1,
-1.333002, -0.9135499, -2.364252, 0, 0, 0, 1, 1,
-1.330235, 0.1747625, -1.853725, 0, 0, 0, 1, 1,
-1.320537, 0.5931931, -0.5150162, 1, 1, 1, 1, 1,
-1.31978, -0.4103568, -0.6387475, 1, 1, 1, 1, 1,
-1.312714, 0.4051225, -2.414127, 1, 1, 1, 1, 1,
-1.30769, -0.5737812, -2.248612, 1, 1, 1, 1, 1,
-1.304006, -0.09680298, -3.629723, 1, 1, 1, 1, 1,
-1.300478, -0.7917355, -0.3763835, 1, 1, 1, 1, 1,
-1.297143, 0.0257907, -2.305217, 1, 1, 1, 1, 1,
-1.295313, -0.7703425, -1.588071, 1, 1, 1, 1, 1,
-1.287522, 2.001518, -0.8175992, 1, 1, 1, 1, 1,
-1.277121, -0.03948289, -2.931452, 1, 1, 1, 1, 1,
-1.265472, -0.8790861, -1.519581, 1, 1, 1, 1, 1,
-1.259131, 0.6618931, -1.36441, 1, 1, 1, 1, 1,
-1.255663, -0.4830216, -3.503106, 1, 1, 1, 1, 1,
-1.254179, -1.310686, -1.129002, 1, 1, 1, 1, 1,
-1.251228, 0.008598641, -1.666686, 1, 1, 1, 1, 1,
-1.246269, 0.1852151, 0.6300682, 0, 0, 1, 1, 1,
-1.241052, -0.7735472, -2.577886, 1, 0, 0, 1, 1,
-1.232246, 1.558303, -1.175606, 1, 0, 0, 1, 1,
-1.231157, 0.07461973, -0.9302981, 1, 0, 0, 1, 1,
-1.230007, -1.309448, -4.333615, 1, 0, 0, 1, 1,
-1.229984, -1.129461, -1.806749, 1, 0, 0, 1, 1,
-1.217467, 1.511142, -0.1090444, 0, 0, 0, 1, 1,
-1.213872, -0.5159137, -1.445828, 0, 0, 0, 1, 1,
-1.212198, -0.7254935, -1.590732, 0, 0, 0, 1, 1,
-1.212004, 0.5668051, -0.868394, 0, 0, 0, 1, 1,
-1.201803, 0.9680341, -1.239048, 0, 0, 0, 1, 1,
-1.199549, -0.7792448, -2.058357, 0, 0, 0, 1, 1,
-1.199117, 0.392397, -2.162639, 0, 0, 0, 1, 1,
-1.197137, -1.471708, -0.6860638, 1, 1, 1, 1, 1,
-1.196733, -1.240646, -3.985613, 1, 1, 1, 1, 1,
-1.192667, 0.56084, -0.3480973, 1, 1, 1, 1, 1,
-1.184816, 0.2316387, 0.5132584, 1, 1, 1, 1, 1,
-1.179407, 0.7852959, -0.5523065, 1, 1, 1, 1, 1,
-1.179254, 0.287089, -1.85225, 1, 1, 1, 1, 1,
-1.177762, 1.598963, -0.01310102, 1, 1, 1, 1, 1,
-1.174726, 0.7228863, -0.17396, 1, 1, 1, 1, 1,
-1.160996, 0.2528246, -2.477495, 1, 1, 1, 1, 1,
-1.158706, 0.4387105, -0.3295885, 1, 1, 1, 1, 1,
-1.157253, 0.03987106, -1.879197, 1, 1, 1, 1, 1,
-1.1563, -0.5292891, -2.567319, 1, 1, 1, 1, 1,
-1.155357, -0.6005862, -1.401497, 1, 1, 1, 1, 1,
-1.154562, -0.1384107, -1.794659, 1, 1, 1, 1, 1,
-1.148109, 1.817376, -1.114953, 1, 1, 1, 1, 1,
-1.144717, 2.886955, -2.525591, 0, 0, 1, 1, 1,
-1.142784, -0.07148287, -0.6693519, 1, 0, 0, 1, 1,
-1.142273, -0.3210629, -1.292061, 1, 0, 0, 1, 1,
-1.137148, 1.396175, -1.206874, 1, 0, 0, 1, 1,
-1.132773, 1.606147, -1.199831, 1, 0, 0, 1, 1,
-1.128329, 1.068985, -0.7414284, 1, 0, 0, 1, 1,
-1.125455, -0.1756834, -1.155045, 0, 0, 0, 1, 1,
-1.123699, -1.552734, -1.634149, 0, 0, 0, 1, 1,
-1.121651, -0.346505, -3.245386, 0, 0, 0, 1, 1,
-1.112277, -0.3860503, -1.074788, 0, 0, 0, 1, 1,
-1.110747, -1.258649, -1.773635, 0, 0, 0, 1, 1,
-1.101959, -1.203637, -2.615206, 0, 0, 0, 1, 1,
-1.101755, -0.6765158, -1.083491, 0, 0, 0, 1, 1,
-1.095368, -0.8018543, -1.266853, 1, 1, 1, 1, 1,
-1.095354, -0.6282349, -1.563987, 1, 1, 1, 1, 1,
-1.094367, 1.03342, 0.4340983, 1, 1, 1, 1, 1,
-1.08563, -0.2567103, -2.199496, 1, 1, 1, 1, 1,
-1.085389, -0.5374763, -1.038719, 1, 1, 1, 1, 1,
-1.071963, -1.442833, -2.634931, 1, 1, 1, 1, 1,
-1.067994, 0.6912174, -2.969386, 1, 1, 1, 1, 1,
-1.067036, 0.1592331, -1.439929, 1, 1, 1, 1, 1,
-1.066357, -0.6150364, -2.935949, 1, 1, 1, 1, 1,
-1.055087, 0.6135, -2.727113, 1, 1, 1, 1, 1,
-1.049943, -0.1235039, -1.138142, 1, 1, 1, 1, 1,
-1.048331, 0.4800889, -1.067808, 1, 1, 1, 1, 1,
-1.045525, -1.221033, -1.533181, 1, 1, 1, 1, 1,
-1.03666, 1.089935, -1.151102, 1, 1, 1, 1, 1,
-1.033616, 1.055933, -0.6304791, 1, 1, 1, 1, 1,
-1.031769, 0.3475004, -0.8914188, 0, 0, 1, 1, 1,
-1.029758, -0.5663448, -4.17241, 1, 0, 0, 1, 1,
-1.027736, 0.5052766, -2.894652, 1, 0, 0, 1, 1,
-1.02693, 0.4400558, -0.7988543, 1, 0, 0, 1, 1,
-1.023839, -0.08388028, -3.1676, 1, 0, 0, 1, 1,
-1.018878, 0.773824, -1.712303, 1, 0, 0, 1, 1,
-1.016485, 0.6918464, -2.830468, 0, 0, 0, 1, 1,
-1.015443, -0.02617195, -1.883176, 0, 0, 0, 1, 1,
-1.006763, -0.9990739, -1.109593, 0, 0, 0, 1, 1,
-1.005411, 0.8497005, -0.356916, 0, 0, 0, 1, 1,
-1.004322, -2.536998, -1.437427, 0, 0, 0, 1, 1,
-1.002753, 0.4544359, -1.885515, 0, 0, 0, 1, 1,
-0.9996753, 0.4292266, -1.162275, 0, 0, 0, 1, 1,
-0.9991972, 0.3701257, -0.551548, 1, 1, 1, 1, 1,
-0.9971298, -2.710591, -3.35322, 1, 1, 1, 1, 1,
-0.9897109, 0.8190247, -1.615616, 1, 1, 1, 1, 1,
-0.9874297, 0.1780016, -0.5337219, 1, 1, 1, 1, 1,
-0.9854571, -0.7485177, -2.988782, 1, 1, 1, 1, 1,
-0.9700678, 0.7496774, -1.370436, 1, 1, 1, 1, 1,
-0.9689171, 0.3585782, -0.583102, 1, 1, 1, 1, 1,
-0.9657528, -1.695896, -1.061175, 1, 1, 1, 1, 1,
-0.9655859, 0.6058894, -1.227494, 1, 1, 1, 1, 1,
-0.9646332, 0.9768201, -1.249022, 1, 1, 1, 1, 1,
-0.9610553, 0.633177, 0.1129711, 1, 1, 1, 1, 1,
-0.9574335, 0.2862005, -0.7473917, 1, 1, 1, 1, 1,
-0.9557819, 0.1957077, -1.110262, 1, 1, 1, 1, 1,
-0.9530037, 0.7435654, -1.751104, 1, 1, 1, 1, 1,
-0.9530016, 1.470355, 0.1402131, 1, 1, 1, 1, 1,
-0.9518924, 0.08865937, -3.097351, 0, 0, 1, 1, 1,
-0.9515705, 0.2101247, -1.379642, 1, 0, 0, 1, 1,
-0.949725, -0.8861477, -2.075587, 1, 0, 0, 1, 1,
-0.9446822, 0.9663221, -0.5800619, 1, 0, 0, 1, 1,
-0.9430405, 0.7284754, -1.868041, 1, 0, 0, 1, 1,
-0.9386737, -0.9388866, -2.915431, 1, 0, 0, 1, 1,
-0.9373484, -1.879964, -4.032478, 0, 0, 0, 1, 1,
-0.928471, 0.068448, -2.769293, 0, 0, 0, 1, 1,
-0.926506, 0.5545334, -1.073016, 0, 0, 0, 1, 1,
-0.9201825, 0.8636149, -0.7676898, 0, 0, 0, 1, 1,
-0.917792, 1.454951, -0.6386151, 0, 0, 0, 1, 1,
-0.9034933, -0.04732757, -1.148441, 0, 0, 0, 1, 1,
-0.8906968, 1.703236, -0.258027, 0, 0, 0, 1, 1,
-0.8847364, 0.2526604, -1.725106, 1, 1, 1, 1, 1,
-0.8766679, -0.8484449, -2.100114, 1, 1, 1, 1, 1,
-0.8725622, 0.1219173, -0.9692356, 1, 1, 1, 1, 1,
-0.8669534, 0.8406557, -0.4106074, 1, 1, 1, 1, 1,
-0.8657625, -0.07945629, -1.242988, 1, 1, 1, 1, 1,
-0.8628374, -0.8089175, -2.241268, 1, 1, 1, 1, 1,
-0.8623517, -0.1538311, -3.062201, 1, 1, 1, 1, 1,
-0.86179, 0.4074647, -1.106813, 1, 1, 1, 1, 1,
-0.8595891, -0.07335171, -2.749047, 1, 1, 1, 1, 1,
-0.8533915, -0.9014006, -0.9586564, 1, 1, 1, 1, 1,
-0.85238, -0.01657851, 0.1778053, 1, 1, 1, 1, 1,
-0.8506106, 0.9260083, -0.6163808, 1, 1, 1, 1, 1,
-0.8492584, -0.118949, -1.463652, 1, 1, 1, 1, 1,
-0.8467278, -0.556982, -1.552787, 1, 1, 1, 1, 1,
-0.845551, 0.2017229, -2.401479, 1, 1, 1, 1, 1,
-0.8406778, 0.7856361, -0.5024954, 0, 0, 1, 1, 1,
-0.8369378, -0.6037027, -3.182761, 1, 0, 0, 1, 1,
-0.8329212, 0.116037, -1.457227, 1, 0, 0, 1, 1,
-0.8326086, 0.9159257, -0.8981371, 1, 0, 0, 1, 1,
-0.8270878, 0.3293183, -2.479424, 1, 0, 0, 1, 1,
-0.826214, -1.078594, -2.561161, 1, 0, 0, 1, 1,
-0.824621, 0.5527343, -0.7646607, 0, 0, 0, 1, 1,
-0.8058674, 0.9734848, -1.082669, 0, 0, 0, 1, 1,
-0.8043769, -0.1381324, -2.655988, 0, 0, 0, 1, 1,
-0.7993974, 0.5617681, -1.218025, 0, 0, 0, 1, 1,
-0.7992975, 1.330901, -1.566791, 0, 0, 0, 1, 1,
-0.7972311, 1.035964, -0.9820358, 0, 0, 0, 1, 1,
-0.7970674, -0.7033771, -1.203689, 0, 0, 0, 1, 1,
-0.7935623, 1.121339, -1.203989, 1, 1, 1, 1, 1,
-0.7902686, 1.247956, -1.198351, 1, 1, 1, 1, 1,
-0.7899391, -1.337099, -2.763751, 1, 1, 1, 1, 1,
-0.7867578, -0.04855907, -4.020321, 1, 1, 1, 1, 1,
-0.7843193, -1.453857, -2.275237, 1, 1, 1, 1, 1,
-0.779728, 0.8292561, -0.1239805, 1, 1, 1, 1, 1,
-0.7757992, -1.323627, -2.925169, 1, 1, 1, 1, 1,
-0.775737, 1.584516, -1.474432, 1, 1, 1, 1, 1,
-0.7678329, 1.461, 0.201015, 1, 1, 1, 1, 1,
-0.7670155, -1.722613, -3.452798, 1, 1, 1, 1, 1,
-0.7658199, -0.3959894, -1.937483, 1, 1, 1, 1, 1,
-0.7629312, -0.4622034, -2.514935, 1, 1, 1, 1, 1,
-0.7590014, -0.6304485, -1.915695, 1, 1, 1, 1, 1,
-0.7584103, 0.8916936, 0.3558871, 1, 1, 1, 1, 1,
-0.7544413, 0.9625723, -0.9148264, 1, 1, 1, 1, 1,
-0.7530065, -0.4895152, -2.505097, 0, 0, 1, 1, 1,
-0.7477636, 1.27394, -0.9768374, 1, 0, 0, 1, 1,
-0.74466, 1.550223, 0.4047108, 1, 0, 0, 1, 1,
-0.7296464, 2.126843, -2.391696, 1, 0, 0, 1, 1,
-0.7290433, 0.1177121, -1.097867, 1, 0, 0, 1, 1,
-0.7286253, 0.1400403, -2.406394, 1, 0, 0, 1, 1,
-0.7253178, -0.6170579, -2.707299, 0, 0, 0, 1, 1,
-0.7251102, 1.824518, -0.5617872, 0, 0, 0, 1, 1,
-0.7175221, -0.2652873, -2.491939, 0, 0, 0, 1, 1,
-0.717087, 0.9357989, -0.65263, 0, 0, 0, 1, 1,
-0.7167538, 0.08362056, -1.841753, 0, 0, 0, 1, 1,
-0.7146533, -1.617516, -3.979414, 0, 0, 0, 1, 1,
-0.7111398, 1.84518, -1.082947, 0, 0, 0, 1, 1,
-0.7076766, 1.408158, -0.8083108, 1, 1, 1, 1, 1,
-0.7069352, -0.6896889, -4.567518, 1, 1, 1, 1, 1,
-0.7027451, 0.1903827, -3.746569, 1, 1, 1, 1, 1,
-0.7011194, -0.9762012, -3.686357, 1, 1, 1, 1, 1,
-0.695817, -0.1749745, -1.476451, 1, 1, 1, 1, 1,
-0.6957981, 0.6505475, -0.4344664, 1, 1, 1, 1, 1,
-0.6943781, -0.3872121, -2.369254, 1, 1, 1, 1, 1,
-0.6936607, -0.01113406, -0.7482088, 1, 1, 1, 1, 1,
-0.6934913, 0.8404908, -1.24844, 1, 1, 1, 1, 1,
-0.6928255, -0.6778553, -3.357546, 1, 1, 1, 1, 1,
-0.6884657, 0.5718821, 0.4432173, 1, 1, 1, 1, 1,
-0.687561, -1.59386, -2.699569, 1, 1, 1, 1, 1,
-0.684761, -2.175438, -3.906806, 1, 1, 1, 1, 1,
-0.6824479, 0.5232472, -0.8604994, 1, 1, 1, 1, 1,
-0.679654, -1.29992, -3.113833, 1, 1, 1, 1, 1,
-0.6745574, -0.5850766, -3.473545, 0, 0, 1, 1, 1,
-0.6745201, -2.109871, -2.46354, 1, 0, 0, 1, 1,
-0.6739625, 0.3812652, -3.753671, 1, 0, 0, 1, 1,
-0.6687041, 0.1305943, 0.3114893, 1, 0, 0, 1, 1,
-0.663473, -0.5496405, -2.989702, 1, 0, 0, 1, 1,
-0.6616409, 0.1443961, -1.632969, 1, 0, 0, 1, 1,
-0.6613449, 1.176681, 0.04523107, 0, 0, 0, 1, 1,
-0.6593289, -0.5907676, -1.588419, 0, 0, 0, 1, 1,
-0.6572199, 1.91662, 0.3351607, 0, 0, 0, 1, 1,
-0.6557873, 1.833084, -2.120741, 0, 0, 0, 1, 1,
-0.6531693, -0.08911131, -1.986252, 0, 0, 0, 1, 1,
-0.6505489, 0.8562896, 0.2394501, 0, 0, 0, 1, 1,
-0.6454131, 1.548755, -0.6180037, 0, 0, 0, 1, 1,
-0.6425294, -0.2924882, -3.644621, 1, 1, 1, 1, 1,
-0.6408647, -1.897024, -3.591, 1, 1, 1, 1, 1,
-0.6313264, 0.001622491, -1.343346, 1, 1, 1, 1, 1,
-0.6275733, -1.141211, -1.355785, 1, 1, 1, 1, 1,
-0.6256856, 0.5840583, -1.217299, 1, 1, 1, 1, 1,
-0.6227928, -1.132495, -2.630535, 1, 1, 1, 1, 1,
-0.6211603, -1.262909, -4.353348, 1, 1, 1, 1, 1,
-0.6189653, 0.838535, -0.4966421, 1, 1, 1, 1, 1,
-0.6167253, -0.764087, -1.065001, 1, 1, 1, 1, 1,
-0.6143973, 0.5911545, -2.982557, 1, 1, 1, 1, 1,
-0.6142364, 0.2025302, -2.73866, 1, 1, 1, 1, 1,
-0.6136543, -0.3618201, -2.578768, 1, 1, 1, 1, 1,
-0.6091099, 0.9722297, 0.2008969, 1, 1, 1, 1, 1,
-0.6062928, 0.5390998, -1.169081, 1, 1, 1, 1, 1,
-0.5996, 1.750494, -2.05854, 1, 1, 1, 1, 1,
-0.5992184, 0.7942746, -2.898241, 0, 0, 1, 1, 1,
-0.5947933, 1.144718, -0.5512782, 1, 0, 0, 1, 1,
-0.5943857, -1.71491, -2.117362, 1, 0, 0, 1, 1,
-0.5939241, -1.20681, -3.481524, 1, 0, 0, 1, 1,
-0.5916463, 1.478525, -0.8139775, 1, 0, 0, 1, 1,
-0.5903562, 0.2037522, -2.171559, 1, 0, 0, 1, 1,
-0.5814453, -0.6724883, -3.441402, 0, 0, 0, 1, 1,
-0.5781869, -0.083868, -1.499646, 0, 0, 0, 1, 1,
-0.5774068, -0.8030639, -1.54468, 0, 0, 0, 1, 1,
-0.5767472, -0.4223012, -1.384777, 0, 0, 0, 1, 1,
-0.568122, -1.095106, -4.212211, 0, 0, 0, 1, 1,
-0.5652188, -1.890965, -3.716901, 0, 0, 0, 1, 1,
-0.5630056, 1.390885, 0.3508314, 0, 0, 0, 1, 1,
-0.5624374, -0.08709142, -1.32943, 1, 1, 1, 1, 1,
-0.5593596, -0.4241289, -1.902088, 1, 1, 1, 1, 1,
-0.5562616, 0.7078581, -0.4142524, 1, 1, 1, 1, 1,
-0.5556877, 1.403479, -0.05546321, 1, 1, 1, 1, 1,
-0.5521793, -0.4490142, -1.889954, 1, 1, 1, 1, 1,
-0.549503, 0.3322521, 0.2366873, 1, 1, 1, 1, 1,
-0.5408961, 0.9212814, -0.00248582, 1, 1, 1, 1, 1,
-0.5380519, 2.637091, 0.9089442, 1, 1, 1, 1, 1,
-0.5316541, -0.2396505, -3.430619, 1, 1, 1, 1, 1,
-0.5306481, 1.508554, 0.443981, 1, 1, 1, 1, 1,
-0.5233999, -1.510413, -2.741457, 1, 1, 1, 1, 1,
-0.5229043, 0.359157, -0.4891541, 1, 1, 1, 1, 1,
-0.521709, 1.513406, 0.7776619, 1, 1, 1, 1, 1,
-0.5178609, -0.4985158, -1.256225, 1, 1, 1, 1, 1,
-0.5169691, 1.21793, -0.3456984, 1, 1, 1, 1, 1,
-0.5129868, 1.601501, -0.8708783, 0, 0, 1, 1, 1,
-0.5119461, 0.5204294, -0.641654, 1, 0, 0, 1, 1,
-0.5105677, -0.290667, -2.509446, 1, 0, 0, 1, 1,
-0.5068029, 0.1178898, -2.030439, 1, 0, 0, 1, 1,
-0.5031557, 1.663264, -0.07555138, 1, 0, 0, 1, 1,
-0.5021324, -0.6410503, -3.905299, 1, 0, 0, 1, 1,
-0.5007625, -0.490038, -2.846104, 0, 0, 0, 1, 1,
-0.4945989, 0.5333098, -1.425601, 0, 0, 0, 1, 1,
-0.4922721, -0.9582403, -4.325606, 0, 0, 0, 1, 1,
-0.4905973, 2.188911, 0.4109509, 0, 0, 0, 1, 1,
-0.4881116, -0.3332603, -1.887421, 0, 0, 0, 1, 1,
-0.4840758, -0.06448522, -1.399406, 0, 0, 0, 1, 1,
-0.4793205, -1.415597, -4.202748, 0, 0, 0, 1, 1,
-0.478519, -0.367948, -3.508538, 1, 1, 1, 1, 1,
-0.4783693, 1.554994, -1.805884, 1, 1, 1, 1, 1,
-0.4751881, 1.598991, 0.7077191, 1, 1, 1, 1, 1,
-0.4690944, -0.5159565, -0.2317209, 1, 1, 1, 1, 1,
-0.4689603, 1.261104, -0.4155001, 1, 1, 1, 1, 1,
-0.4669, 0.8837777, 0.2782561, 1, 1, 1, 1, 1,
-0.4646624, 0.8327588, 0.8108128, 1, 1, 1, 1, 1,
-0.4624236, -0.3714189, -1.595134, 1, 1, 1, 1, 1,
-0.459974, 0.4491907, -1.252258, 1, 1, 1, 1, 1,
-0.4595522, -1.029566, -4.145674, 1, 1, 1, 1, 1,
-0.4581614, -0.8908041, -4.235282, 1, 1, 1, 1, 1,
-0.4526305, 1.447067, 0.3709446, 1, 1, 1, 1, 1,
-0.4506887, -1.740681, -2.228107, 1, 1, 1, 1, 1,
-0.44786, -0.41748, -2.23736, 1, 1, 1, 1, 1,
-0.4435502, -0.2345324, -1.430515, 1, 1, 1, 1, 1,
-0.440212, -1.277611, -3.378053, 0, 0, 1, 1, 1,
-0.4395444, -0.8535309, -2.572289, 1, 0, 0, 1, 1,
-0.4379403, -0.7047569, -2.964844, 1, 0, 0, 1, 1,
-0.4341877, 1.052634, 2.570287, 1, 0, 0, 1, 1,
-0.4301608, -0.6765996, -2.162585, 1, 0, 0, 1, 1,
-0.4262043, -0.9114336, -2.365682, 1, 0, 0, 1, 1,
-0.4260169, -1.302266, -3.404768, 0, 0, 0, 1, 1,
-0.4214029, -0.5047179, -2.20949, 0, 0, 0, 1, 1,
-0.4198447, -1.094686, -4.03918, 0, 0, 0, 1, 1,
-0.4053708, 0.2704294, -1.483865, 0, 0, 0, 1, 1,
-0.4049536, 0.02334084, -2.650415, 0, 0, 0, 1, 1,
-0.4008315, -0.3379861, -2.637908, 0, 0, 0, 1, 1,
-0.4003781, 0.1428266, -2.204305, 0, 0, 0, 1, 1,
-0.3987311, -0.4372404, -1.027882, 1, 1, 1, 1, 1,
-0.394101, 1.854828, -0.643777, 1, 1, 1, 1, 1,
-0.3912656, -0.0918934, -0.005865643, 1, 1, 1, 1, 1,
-0.3875211, 0.3701428, 0.1548298, 1, 1, 1, 1, 1,
-0.3847932, -0.914987, -1.835425, 1, 1, 1, 1, 1,
-0.3847, 1.347863, -0.5621998, 1, 1, 1, 1, 1,
-0.3846825, 0.8767858, -1.392151, 1, 1, 1, 1, 1,
-0.3822232, 0.2156537, -0.6900687, 1, 1, 1, 1, 1,
-0.3799805, -0.02384139, -1.391502, 1, 1, 1, 1, 1,
-0.3719505, -0.6618946, -3.105797, 1, 1, 1, 1, 1,
-0.3669276, 0.6328949, -1.293484, 1, 1, 1, 1, 1,
-0.3665085, 0.5385178, -0.02453003, 1, 1, 1, 1, 1,
-0.3644729, -0.3825903, -1.940796, 1, 1, 1, 1, 1,
-0.3624646, -1.159787, -2.758765, 1, 1, 1, 1, 1,
-0.3606213, -0.7528081, -3.136239, 1, 1, 1, 1, 1,
-0.3548303, -1.527988, -2.135512, 0, 0, 1, 1, 1,
-0.3543078, 0.700635, -0.8665352, 1, 0, 0, 1, 1,
-0.3542194, 0.5692241, -1.829566, 1, 0, 0, 1, 1,
-0.3476471, -0.8395594, -3.964136, 1, 0, 0, 1, 1,
-0.346097, -0.9256665, -2.114556, 1, 0, 0, 1, 1,
-0.3456036, -1.010184, -3.060174, 1, 0, 0, 1, 1,
-0.3445256, -0.6736817, -3.043671, 0, 0, 0, 1, 1,
-0.3437215, -0.6992239, -2.194463, 0, 0, 0, 1, 1,
-0.3394375, -0.0118566, -2.113768, 0, 0, 0, 1, 1,
-0.3374639, -1.107582, -3.245852, 0, 0, 0, 1, 1,
-0.3369129, -1.212197, -2.335188, 0, 0, 0, 1, 1,
-0.3351541, 0.3612371, -0.07912514, 0, 0, 0, 1, 1,
-0.3336011, -0.5894288, -2.313057, 0, 0, 0, 1, 1,
-0.330957, -0.508311, -1.602506, 1, 1, 1, 1, 1,
-0.3286645, -0.4271518, -2.522744, 1, 1, 1, 1, 1,
-0.3284383, -0.08288158, -1.530719, 1, 1, 1, 1, 1,
-0.3282237, 0.1932393, -0.7771798, 1, 1, 1, 1, 1,
-0.3278689, 0.1700988, -0.9388553, 1, 1, 1, 1, 1,
-0.3270082, -2.168689, -2.613115, 1, 1, 1, 1, 1,
-0.3248049, 0.6364284, 0.6084822, 1, 1, 1, 1, 1,
-0.3180317, -0.6742871, -2.119591, 1, 1, 1, 1, 1,
-0.3152943, 1.782656, -0.5118313, 1, 1, 1, 1, 1,
-0.3125463, -0.4105739, -0.8431358, 1, 1, 1, 1, 1,
-0.3121354, -0.07550719, -1.772019, 1, 1, 1, 1, 1,
-0.3090347, -0.8237674, -3.57468, 1, 1, 1, 1, 1,
-0.3011575, -0.6926268, -2.089753, 1, 1, 1, 1, 1,
-0.2996023, -1.138623, -2.423713, 1, 1, 1, 1, 1,
-0.2949536, 0.3497994, 0.41832, 1, 1, 1, 1, 1,
-0.2930864, -2.411667, -1.401214, 0, 0, 1, 1, 1,
-0.2925542, -0.1569896, -1.298454, 1, 0, 0, 1, 1,
-0.2844121, 0.1521349, -0.2092323, 1, 0, 0, 1, 1,
-0.2819066, -0.07017048, -1.826823, 1, 0, 0, 1, 1,
-0.2661248, 1.081252, -1.193872, 1, 0, 0, 1, 1,
-0.258743, -1.074623, -2.668286, 1, 0, 0, 1, 1,
-0.2579112, 1.581192, -0.258769, 0, 0, 0, 1, 1,
-0.255951, -0.4354678, -1.850785, 0, 0, 0, 1, 1,
-0.2516666, -1.153841, -2.795492, 0, 0, 0, 1, 1,
-0.2399617, -1.80946, -4.664862, 0, 0, 0, 1, 1,
-0.2385276, 1.078982, -0.4265105, 0, 0, 0, 1, 1,
-0.2380702, -0.4804978, -2.581237, 0, 0, 0, 1, 1,
-0.2335951, -1.175698, -0.9397633, 0, 0, 0, 1, 1,
-0.2334832, -0.6665583, -3.308478, 1, 1, 1, 1, 1,
-0.2321257, 0.7396626, -1.768051, 1, 1, 1, 1, 1,
-0.2297661, 0.2954339, -0.2682687, 1, 1, 1, 1, 1,
-0.2294552, -0.6200157, -1.006957, 1, 1, 1, 1, 1,
-0.2267339, 0.5840221, -0.5388592, 1, 1, 1, 1, 1,
-0.2219197, 0.3342375, -0.8814991, 1, 1, 1, 1, 1,
-0.2198962, -0.2303514, -3.412309, 1, 1, 1, 1, 1,
-0.2125411, 0.3362921, -0.5785593, 1, 1, 1, 1, 1,
-0.2122697, -0.9922504, -2.759374, 1, 1, 1, 1, 1,
-0.2116765, -0.5340297, -3.343341, 1, 1, 1, 1, 1,
-0.2104806, 0.3162526, -0.7714224, 1, 1, 1, 1, 1,
-0.208997, 0.3319117, -1.753698, 1, 1, 1, 1, 1,
-0.2077128, 1.060815, -1.224329, 1, 1, 1, 1, 1,
-0.2036905, 0.1948809, -1.970075, 1, 1, 1, 1, 1,
-0.2023733, 1.05476, 0.9773273, 1, 1, 1, 1, 1,
-0.1954729, -0.6683424, -4.310031, 0, 0, 1, 1, 1,
-0.1947652, -0.2417209, -2.620058, 1, 0, 0, 1, 1,
-0.1947449, -0.2134142, -2.592771, 1, 0, 0, 1, 1,
-0.1940341, -1.265435, -2.436833, 1, 0, 0, 1, 1,
-0.1924016, 1.665444, -2.334868, 1, 0, 0, 1, 1,
-0.1909929, 1.61865, -0.6455417, 1, 0, 0, 1, 1,
-0.1908674, 0.2561214, 1.151433, 0, 0, 0, 1, 1,
-0.1820057, 0.9302316, -2.308218, 0, 0, 0, 1, 1,
-0.1793904, 0.4528999, -0.01305734, 0, 0, 0, 1, 1,
-0.1786847, -1.165103, -1.18276, 0, 0, 0, 1, 1,
-0.1723461, -1.645159, -0.6081949, 0, 0, 0, 1, 1,
-0.1692647, -0.5581107, -2.530533, 0, 0, 0, 1, 1,
-0.1685124, 2.429019, -0.8654555, 0, 0, 0, 1, 1,
-0.1673102, 0.618618, -0.6839154, 1, 1, 1, 1, 1,
-0.1655285, -1.311778, -3.065103, 1, 1, 1, 1, 1,
-0.165291, -1.932615, -2.288019, 1, 1, 1, 1, 1,
-0.1612599, -2.39331, -3.689482, 1, 1, 1, 1, 1,
-0.1592431, -0.3217168, -0.9977341, 1, 1, 1, 1, 1,
-0.152281, 0.1561964, -1.008559, 1, 1, 1, 1, 1,
-0.1522621, 0.3824214, 1.004349, 1, 1, 1, 1, 1,
-0.1489402, -0.7597211, -2.354826, 1, 1, 1, 1, 1,
-0.1460967, 0.06752742, -0.1865562, 1, 1, 1, 1, 1,
-0.1459602, -0.5736, -1.841473, 1, 1, 1, 1, 1,
-0.1424067, 0.3228575, -2.200786, 1, 1, 1, 1, 1,
-0.1418232, -0.9367976, -3.212557, 1, 1, 1, 1, 1,
-0.1354628, -0.3889565, -3.267838, 1, 1, 1, 1, 1,
-0.1335646, -0.06202836, -2.471666, 1, 1, 1, 1, 1,
-0.1302868, 1.222754, 1.019976, 1, 1, 1, 1, 1,
-0.130113, -0.3252921, -1.453438, 0, 0, 1, 1, 1,
-0.1237962, -0.6288342, -2.551304, 1, 0, 0, 1, 1,
-0.1235144, -1.753794, -2.711866, 1, 0, 0, 1, 1,
-0.12324, 0.4580807, -0.429753, 1, 0, 0, 1, 1,
-0.1202616, -1.09596, -4.06352, 1, 0, 0, 1, 1,
-0.1176479, -0.9770758, -1.797311, 1, 0, 0, 1, 1,
-0.1175873, 0.1692379, 0.3343531, 0, 0, 0, 1, 1,
-0.109836, 0.3397335, 0.8604761, 0, 0, 0, 1, 1,
-0.1092348, -0.482799, -1.841644, 0, 0, 0, 1, 1,
-0.1049783, 0.7648943, -1.080841, 0, 0, 0, 1, 1,
-0.1032101, -0.5824505, -1.670055, 0, 0, 0, 1, 1,
-0.09664901, 0.5323654, -1.717656, 0, 0, 0, 1, 1,
-0.09495028, -0.7495301, -4.803049, 0, 0, 0, 1, 1,
-0.08576825, -0.5090216, -3.083772, 1, 1, 1, 1, 1,
-0.08340094, 0.2726654, -1.38753, 1, 1, 1, 1, 1,
-0.08196007, -0.6095172, -2.433673, 1, 1, 1, 1, 1,
-0.08190675, 0.6713586, 0.264107, 1, 1, 1, 1, 1,
-0.07563028, -0.9788924, -3.830223, 1, 1, 1, 1, 1,
-0.07527985, -1.359073, -4.071709, 1, 1, 1, 1, 1,
-0.0700551, -1.414736, -4.244028, 1, 1, 1, 1, 1,
-0.06619562, -0.4356411, -2.535636, 1, 1, 1, 1, 1,
-0.06564932, 0.3822075, -0.2953786, 1, 1, 1, 1, 1,
-0.06503051, -0.2220152, -2.442351, 1, 1, 1, 1, 1,
-0.06467623, 0.4445152, 0.1631038, 1, 1, 1, 1, 1,
-0.063903, 0.965192, 1.534098, 1, 1, 1, 1, 1,
-0.06324062, 0.1500104, 1.412057, 1, 1, 1, 1, 1,
-0.06273889, -1.425715, -3.071222, 1, 1, 1, 1, 1,
-0.06168367, -0.08188678, -3.414968, 1, 1, 1, 1, 1,
-0.05874991, 0.06752767, -0.2997062, 0, 0, 1, 1, 1,
-0.05762718, 0.3347001, 0.04158216, 1, 0, 0, 1, 1,
-0.05098993, -1.402308, -2.081398, 1, 0, 0, 1, 1,
-0.04731455, -0.07054701, -5.048595, 1, 0, 0, 1, 1,
-0.04726995, 1.363585, -0.7509806, 1, 0, 0, 1, 1,
-0.04293355, -0.5364591, -4.098711, 1, 0, 0, 1, 1,
-0.03679374, -0.127451, -3.638531, 0, 0, 0, 1, 1,
-0.03558083, 2.395439, -0.8363241, 0, 0, 0, 1, 1,
-0.0319102, 0.9120579, 1.618593, 0, 0, 0, 1, 1,
-0.03146101, -2.658421, -4.63244, 0, 0, 0, 1, 1,
-0.03066697, 0.1414827, -1.5273, 0, 0, 0, 1, 1,
-0.03061461, -0.3066877, -2.581331, 0, 0, 0, 1, 1,
-0.02969664, -0.06654353, -2.773366, 0, 0, 0, 1, 1,
-0.02880031, -0.9756054, -2.826453, 1, 1, 1, 1, 1,
-0.02612963, -0.7373254, -3.046471, 1, 1, 1, 1, 1,
-0.02591296, -1.899776, -4.450361, 1, 1, 1, 1, 1,
-0.0193643, 1.032336, 0.6320508, 1, 1, 1, 1, 1,
-0.01583669, 0.4499063, 0.6661706, 1, 1, 1, 1, 1,
-0.01486864, 1.355108, 0.9823139, 1, 1, 1, 1, 1,
-0.006161518, 1.406238, 1.476977, 1, 1, 1, 1, 1,
-0.005511967, 1.583996, -1.818938, 1, 1, 1, 1, 1,
0.0007200175, 1.908777, -0.2990434, 1, 1, 1, 1, 1,
0.003465277, -0.7998149, 6.368726, 1, 1, 1, 1, 1,
0.003720593, 0.3303393, -1.444418, 1, 1, 1, 1, 1,
0.004278105, 0.04177055, -1.666683, 1, 1, 1, 1, 1,
0.0106473, 0.1982412, -0.05424167, 1, 1, 1, 1, 1,
0.01649342, -0.2572048, 4.677815, 1, 1, 1, 1, 1,
0.01835158, -1.086747, 2.291613, 1, 1, 1, 1, 1,
0.02196827, 0.9223295, -0.3041836, 0, 0, 1, 1, 1,
0.02590173, 0.718932, 0.7264549, 1, 0, 0, 1, 1,
0.02792547, 0.9725465, 0.4750014, 1, 0, 0, 1, 1,
0.02841856, 0.9588669, 0.4945461, 1, 0, 0, 1, 1,
0.03725755, 0.002893389, 0.6717523, 1, 0, 0, 1, 1,
0.03879489, 1.097992, 0.5717323, 1, 0, 0, 1, 1,
0.03903653, 0.02182631, -0.03248052, 0, 0, 0, 1, 1,
0.04634907, -0.3782775, 2.544861, 0, 0, 0, 1, 1,
0.0469878, 1.271636, -0.7043575, 0, 0, 0, 1, 1,
0.05468727, 0.06266346, -0.5377358, 0, 0, 0, 1, 1,
0.05598064, 0.06862681, 1.324612, 0, 0, 0, 1, 1,
0.05825175, -0.3141381, 3.272681, 0, 0, 0, 1, 1,
0.05975104, -1.176291, 2.363853, 0, 0, 0, 1, 1,
0.05999613, 1.039361, 0.07298373, 1, 1, 1, 1, 1,
0.06010497, -1.818373, 1.14476, 1, 1, 1, 1, 1,
0.06046056, -0.4892371, 4.588971, 1, 1, 1, 1, 1,
0.0622272, -1.343225, 3.709807, 1, 1, 1, 1, 1,
0.06701466, -2.468646, 4.726367, 1, 1, 1, 1, 1,
0.07507937, 0.7089303, 0.1527264, 1, 1, 1, 1, 1,
0.07657249, 0.3367018, -0.002885274, 1, 1, 1, 1, 1,
0.07850489, -0.0543358, 2.434643, 1, 1, 1, 1, 1,
0.08105747, -1.160419, 1.17871, 1, 1, 1, 1, 1,
0.08594142, 0.4215023, -0.6196652, 1, 1, 1, 1, 1,
0.08771099, -1.439534, 1.383854, 1, 1, 1, 1, 1,
0.0885421, -0.545252, 3.926566, 1, 1, 1, 1, 1,
0.09155805, 0.5958813, 1.002809, 1, 1, 1, 1, 1,
0.09495867, -0.7786605, 3.824444, 1, 1, 1, 1, 1,
0.09525076, 0.2705973, 1.277864, 1, 1, 1, 1, 1,
0.09597176, 1.823761, -0.3061729, 0, 0, 1, 1, 1,
0.0961187, -1.292602, 1.964409, 1, 0, 0, 1, 1,
0.09706697, 0.7678716, -0.698424, 1, 0, 0, 1, 1,
0.09773456, -1.225843, 4.028046, 1, 0, 0, 1, 1,
0.1006442, -0.3470566, 2.826162, 1, 0, 0, 1, 1,
0.1036739, 0.8631313, 0.1187217, 1, 0, 0, 1, 1,
0.1056708, 0.08323047, -0.5664716, 0, 0, 0, 1, 1,
0.1058602, 1.607165, -0.8978996, 0, 0, 0, 1, 1,
0.105982, -0.1865288, 2.475915, 0, 0, 0, 1, 1,
0.1059963, 0.02031221, 2.202439, 0, 0, 0, 1, 1,
0.109683, 0.8399715, 1.544976, 0, 0, 0, 1, 1,
0.1103644, -0.1529098, 1.792842, 0, 0, 0, 1, 1,
0.1124335, -0.1252455, 1.951155, 0, 0, 0, 1, 1,
0.1157867, 1.011742, -0.9909977, 1, 1, 1, 1, 1,
0.1207713, 0.1941464, 1.577666, 1, 1, 1, 1, 1,
0.1275335, 0.966781, -0.8561884, 1, 1, 1, 1, 1,
0.1279933, -0.1351441, 1.014357, 1, 1, 1, 1, 1,
0.1280704, 1.823773, 0.5278111, 1, 1, 1, 1, 1,
0.1295718, 1.135419, 0.8115433, 1, 1, 1, 1, 1,
0.1349693, 0.824438, 0.7411638, 1, 1, 1, 1, 1,
0.1388779, 0.5969259, 0.1169637, 1, 1, 1, 1, 1,
0.1448097, 0.748238, 1.354243, 1, 1, 1, 1, 1,
0.1496463, 0.2391184, 0.4306097, 1, 1, 1, 1, 1,
0.1536065, 0.1228, 0.0357589, 1, 1, 1, 1, 1,
0.1549491, -0.6683571, 3.778151, 1, 1, 1, 1, 1,
0.1592041, -1.378982, 1.861678, 1, 1, 1, 1, 1,
0.1598681, -0.7445279, 3.072962, 1, 1, 1, 1, 1,
0.1611497, -0.01476305, 2.675597, 1, 1, 1, 1, 1,
0.1616253, 0.8042521, 1.057019, 0, 0, 1, 1, 1,
0.1656476, -1.491611, 3.650968, 1, 0, 0, 1, 1,
0.1705206, -0.902018, 3.447663, 1, 0, 0, 1, 1,
0.171017, 0.3832374, 0.9565632, 1, 0, 0, 1, 1,
0.1735994, 0.6398394, 0.6370792, 1, 0, 0, 1, 1,
0.1756952, 0.2334841, -0.6132036, 1, 0, 0, 1, 1,
0.1783677, -1.42327, 2.413731, 0, 0, 0, 1, 1,
0.1826552, 0.7396469, -0.7714385, 0, 0, 0, 1, 1,
0.1847535, 0.8357763, -0.1349128, 0, 0, 0, 1, 1,
0.1898335, 0.5145025, 0.7276748, 0, 0, 0, 1, 1,
0.1956518, -1.010987, 2.387823, 0, 0, 0, 1, 1,
0.2012939, -1.208079, 2.63909, 0, 0, 0, 1, 1,
0.2027846, 0.2465792, -0.7593375, 0, 0, 0, 1, 1,
0.2050045, 1.132782, -0.4644088, 1, 1, 1, 1, 1,
0.2064357, -0.3637962, 3.032733, 1, 1, 1, 1, 1,
0.2072767, 1.355744, 0.6150256, 1, 1, 1, 1, 1,
0.2109007, -1.400898, 2.404444, 1, 1, 1, 1, 1,
0.212166, -0.7308193, 3.750202, 1, 1, 1, 1, 1,
0.213119, 1.662307, 0.7039015, 1, 1, 1, 1, 1,
0.2137403, 0.2361096, 0.1576006, 1, 1, 1, 1, 1,
0.2141585, -1.501852, 4.392932, 1, 1, 1, 1, 1,
0.2208149, 0.9540472, 0.1629749, 1, 1, 1, 1, 1,
0.2213014, 1.269831, 0.6417007, 1, 1, 1, 1, 1,
0.2223709, -1.740732, 3.766336, 1, 1, 1, 1, 1,
0.2237296, 0.4766547, 0.8477249, 1, 1, 1, 1, 1,
0.2273803, 0.6666371, 0.9885396, 1, 1, 1, 1, 1,
0.2283744, -1.568901, 1.396546, 1, 1, 1, 1, 1,
0.2307194, 0.9106591, 0.861399, 1, 1, 1, 1, 1,
0.2337149, -1.43016, 4.226678, 0, 0, 1, 1, 1,
0.2339906, -0.5252931, 3.804632, 1, 0, 0, 1, 1,
0.2403154, -0.2139659, 1.366413, 1, 0, 0, 1, 1,
0.2415023, -0.05766556, 2.887433, 1, 0, 0, 1, 1,
0.2442007, -1.366248, 3.155359, 1, 0, 0, 1, 1,
0.2477844, 0.09817721, 3.40361, 1, 0, 0, 1, 1,
0.2505895, -0.5800487, 2.638067, 0, 0, 0, 1, 1,
0.2516879, -1.584247, 2.726834, 0, 0, 0, 1, 1,
0.2551961, -0.9588712, 2.768253, 0, 0, 0, 1, 1,
0.2589328, -0.6017762, 2.856961, 0, 0, 0, 1, 1,
0.2619433, -1.261176, 4.849142, 0, 0, 0, 1, 1,
0.2635142, -1.131081, 2.496373, 0, 0, 0, 1, 1,
0.2637011, 2.457366, -2.515577, 0, 0, 0, 1, 1,
0.2645484, -0.5233965, 2.606503, 1, 1, 1, 1, 1,
0.2659048, 0.5316834, 0.4140393, 1, 1, 1, 1, 1,
0.2664126, -0.3794004, 2.379919, 1, 1, 1, 1, 1,
0.2681792, -0.7170862, 3.726919, 1, 1, 1, 1, 1,
0.2718195, -0.4710522, 3.676783, 1, 1, 1, 1, 1,
0.2722511, -0.9388605, 2.796654, 1, 1, 1, 1, 1,
0.2729676, -0.02357944, 2.211111, 1, 1, 1, 1, 1,
0.2778356, 0.1806375, 2.016226, 1, 1, 1, 1, 1,
0.2820552, -1.155243, 2.159367, 1, 1, 1, 1, 1,
0.2833245, 0.6329857, 1.585184, 1, 1, 1, 1, 1,
0.288033, -0.7532342, 4.327461, 1, 1, 1, 1, 1,
0.2908511, -0.3088647, 4.180282, 1, 1, 1, 1, 1,
0.2920313, 0.691996, -0.03217414, 1, 1, 1, 1, 1,
0.2938043, 1.409529, 0.5575304, 1, 1, 1, 1, 1,
0.2965063, -2.010576, 3.462213, 1, 1, 1, 1, 1,
0.2966228, 0.4212185, 2.421726, 0, 0, 1, 1, 1,
0.2972149, 0.8130543, -2.070012, 1, 0, 0, 1, 1,
0.2984449, -1.027192, 2.950153, 1, 0, 0, 1, 1,
0.2987963, 1.681542, -0.06982455, 1, 0, 0, 1, 1,
0.2992012, -1.312066, 3.85928, 1, 0, 0, 1, 1,
0.3008026, 0.03131439, 1.341732, 1, 0, 0, 1, 1,
0.301578, 0.3430695, 1.456435, 0, 0, 0, 1, 1,
0.3038763, 0.5231956, -1.621071, 0, 0, 0, 1, 1,
0.3100732, 0.8260875, 2.666132, 0, 0, 0, 1, 1,
0.3117909, -0.2688398, 0.6931431, 0, 0, 0, 1, 1,
0.3130952, -0.926616, 2.495983, 0, 0, 0, 1, 1,
0.3278838, 0.3464007, 2.569925, 0, 0, 0, 1, 1,
0.3325676, -0.2111863, 1.628013, 0, 0, 0, 1, 1,
0.3336441, 0.05349167, 1.533373, 1, 1, 1, 1, 1,
0.3422508, 0.228575, 1.375523, 1, 1, 1, 1, 1,
0.3441339, 0.9837283, 0.8639556, 1, 1, 1, 1, 1,
0.3533938, 0.5827806, 0.5259637, 1, 1, 1, 1, 1,
0.3625876, -2.042426, 2.318313, 1, 1, 1, 1, 1,
0.3659279, -1.608266, 4.611141, 1, 1, 1, 1, 1,
0.3761453, 0.6963204, -0.8824576, 1, 1, 1, 1, 1,
0.3778923, 1.296849, -1.336846, 1, 1, 1, 1, 1,
0.3780503, 0.7400373, 2.51884, 1, 1, 1, 1, 1,
0.3800296, -0.3791317, 1.44584, 1, 1, 1, 1, 1,
0.3802101, 1.484507, 0.05908057, 1, 1, 1, 1, 1,
0.3814592, 1.836262, 0.3243327, 1, 1, 1, 1, 1,
0.3922733, -1.152206, 3.434247, 1, 1, 1, 1, 1,
0.3954228, 1.435448, -0.5371391, 1, 1, 1, 1, 1,
0.3962438, -0.3851402, 2.469383, 1, 1, 1, 1, 1,
0.4004833, -0.6536199, 2.599404, 0, 0, 1, 1, 1,
0.4026202, 1.266216, 2.023241, 1, 0, 0, 1, 1,
0.4026344, 0.8215544, 1.959439, 1, 0, 0, 1, 1,
0.4075225, -1.397918, 3.300471, 1, 0, 0, 1, 1,
0.408816, -0.3720844, 2.922469, 1, 0, 0, 1, 1,
0.4088673, -0.6390602, 2.474171, 1, 0, 0, 1, 1,
0.4106723, 1.255004, -0.8094417, 0, 0, 0, 1, 1,
0.4137895, -0.5723226, 1.681378, 0, 0, 0, 1, 1,
0.4181195, -0.2283986, 0.3542747, 0, 0, 0, 1, 1,
0.4231818, -0.2168594, 0.9964844, 0, 0, 0, 1, 1,
0.4267399, 0.4409493, 2.257269, 0, 0, 0, 1, 1,
0.432885, 0.2257766, 0.5494546, 0, 0, 0, 1, 1,
0.4373481, 0.1106346, -0.2060707, 0, 0, 0, 1, 1,
0.43847, 0.3288854, 1.377193, 1, 1, 1, 1, 1,
0.4419627, 0.2340104, 0.8870794, 1, 1, 1, 1, 1,
0.4478558, 1.347231, -0.9612324, 1, 1, 1, 1, 1,
0.4515298, 1.697933, 1.239494, 1, 1, 1, 1, 1,
0.4540475, 0.7230347, 0.01929665, 1, 1, 1, 1, 1,
0.4558821, 1.110263, -1.157731, 1, 1, 1, 1, 1,
0.4593396, -0.4487936, 2.497882, 1, 1, 1, 1, 1,
0.4671816, -0.6454014, 1.913555, 1, 1, 1, 1, 1,
0.4766082, 1.850445, 0.9113275, 1, 1, 1, 1, 1,
0.4804362, -0.0817614, 1.996923, 1, 1, 1, 1, 1,
0.483088, 0.09193449, 0.1853068, 1, 1, 1, 1, 1,
0.4877048, 1.369482, -0.1213158, 1, 1, 1, 1, 1,
0.4894844, -1.527572, 2.696424, 1, 1, 1, 1, 1,
0.4928946, -1.659278, 2.737948, 1, 1, 1, 1, 1,
0.497123, -1.016633, 3.858951, 1, 1, 1, 1, 1,
0.4972364, -0.5736787, 2.128008, 0, 0, 1, 1, 1,
0.4994074, 1.232298, -0.2101326, 1, 0, 0, 1, 1,
0.5075442, 0.540879, -0.381966, 1, 0, 0, 1, 1,
0.5085382, 2.521868, 1.247299, 1, 0, 0, 1, 1,
0.5110525, -0.7088906, 3.522736, 1, 0, 0, 1, 1,
0.5189365, 0.1217648, 1.818728, 1, 0, 0, 1, 1,
0.5202645, 1.572896, -0.593478, 0, 0, 0, 1, 1,
0.5204316, -1.18992, 3.013236, 0, 0, 0, 1, 1,
0.5224795, -0.9046429, 3.394549, 0, 0, 0, 1, 1,
0.5228593, 1.912699, 2.448621, 0, 0, 0, 1, 1,
0.5236027, 1.27088, -1.755579, 0, 0, 0, 1, 1,
0.5274885, -0.728587, 3.958553, 0, 0, 0, 1, 1,
0.5335615, -0.1635645, 3.571887, 0, 0, 0, 1, 1,
0.53444, 0.5148716, 0.8964704, 1, 1, 1, 1, 1,
0.5348682, -0.05644149, 0.528478, 1, 1, 1, 1, 1,
0.5370572, 1.493632, -0.3126458, 1, 1, 1, 1, 1,
0.5389029, -0.9202312, 3.074531, 1, 1, 1, 1, 1,
0.5410234, 0.9935539, -0.933954, 1, 1, 1, 1, 1,
0.5448819, 1.056227, -0.2216778, 1, 1, 1, 1, 1,
0.5523737, -0.8266683, 3.502006, 1, 1, 1, 1, 1,
0.5537288, 0.4704951, 1.161449, 1, 1, 1, 1, 1,
0.557212, -1.585281, 3.743317, 1, 1, 1, 1, 1,
0.5609294, 1.04449, -1.063251, 1, 1, 1, 1, 1,
0.5629401, -1.774713, 2.118707, 1, 1, 1, 1, 1,
0.5635989, 1.525434, 0.08216763, 1, 1, 1, 1, 1,
0.5648818, 0.1573674, 0.2581663, 1, 1, 1, 1, 1,
0.5682406, 0.9513379, 0.2117075, 1, 1, 1, 1, 1,
0.5693952, 0.2785635, 1.513021, 1, 1, 1, 1, 1,
0.5698715, 0.9039552, 1.017625, 0, 0, 1, 1, 1,
0.5751373, -0.5535818, 2.01764, 1, 0, 0, 1, 1,
0.5765686, -0.1853129, 2.258725, 1, 0, 0, 1, 1,
0.5795197, -0.3664954, 3.171977, 1, 0, 0, 1, 1,
0.5800145, -0.372275, 1.016397, 1, 0, 0, 1, 1,
0.5815757, -0.02566058, 1.185409, 1, 0, 0, 1, 1,
0.5840595, -2.670498, 2.133372, 0, 0, 0, 1, 1,
0.5864255, -0.07302178, 2.818498, 0, 0, 0, 1, 1,
0.5871355, 2.777291, 1.452672, 0, 0, 0, 1, 1,
0.587732, -1.104791, 2.534223, 0, 0, 0, 1, 1,
0.5886948, -1.200771, 1.668907, 0, 0, 0, 1, 1,
0.5938548, -1.8792, 2.551616, 0, 0, 0, 1, 1,
0.595782, -0.5455259, 1.910318, 0, 0, 0, 1, 1,
0.5998822, -0.2071017, 3.002184, 1, 1, 1, 1, 1,
0.6012927, -2.30893, 1.161341, 1, 1, 1, 1, 1,
0.602121, 0.195434, 2.211252, 1, 1, 1, 1, 1,
0.6054364, 0.2773153, 0.1440276, 1, 1, 1, 1, 1,
0.60553, 1.696848, -0.8357302, 1, 1, 1, 1, 1,
0.6086706, 0.6512678, 1.901116, 1, 1, 1, 1, 1,
0.6128098, 0.8123775, 2.50391, 1, 1, 1, 1, 1,
0.6137635, 1.533032, -1.420097, 1, 1, 1, 1, 1,
0.6160995, -0.4614598, 0.8888406, 1, 1, 1, 1, 1,
0.6182511, 0.950018, 1.141299, 1, 1, 1, 1, 1,
0.6256303, 2.244834, 1.244545, 1, 1, 1, 1, 1,
0.6321074, 1.214022, -0.4753325, 1, 1, 1, 1, 1,
0.6350521, 0.2039893, 0.4109817, 1, 1, 1, 1, 1,
0.6354805, -0.4387707, -0.7807934, 1, 1, 1, 1, 1,
0.6365405, -0.7945468, 3.32963, 1, 1, 1, 1, 1,
0.6384681, 0.4755439, 0.1858397, 0, 0, 1, 1, 1,
0.6455917, -0.4212053, 2.370763, 1, 0, 0, 1, 1,
0.6515867, -0.1355987, 1.452767, 1, 0, 0, 1, 1,
0.652236, 0.3121605, -0.8029288, 1, 0, 0, 1, 1,
0.6534055, -0.1703119, 2.764897, 1, 0, 0, 1, 1,
0.6647916, 0.1047035, -0.362825, 1, 0, 0, 1, 1,
0.6659687, -0.6577201, 2.163464, 0, 0, 0, 1, 1,
0.6688898, 0.5670087, 0.650201, 0, 0, 0, 1, 1,
0.6782926, -0.7298686, 2.06194, 0, 0, 0, 1, 1,
0.6789746, 1.156372, 1.387419, 0, 0, 0, 1, 1,
0.6790431, -0.3502511, 2.140792, 0, 0, 0, 1, 1,
0.6796975, 0.6796691, 0.4672753, 0, 0, 0, 1, 1,
0.6896114, 1.832206, 0.2219688, 0, 0, 0, 1, 1,
0.6905854, 0.1070984, 4.241179, 1, 1, 1, 1, 1,
0.7024992, 0.007720356, 1.737454, 1, 1, 1, 1, 1,
0.7042181, -0.009394968, 1.545059, 1, 1, 1, 1, 1,
0.7235354, 2.774627, 0.4721873, 1, 1, 1, 1, 1,
0.7281908, 0.5452708, -0.1555571, 1, 1, 1, 1, 1,
0.7312452, -0.5594175, 2.818393, 1, 1, 1, 1, 1,
0.7325066, 0.2155699, 1.361604, 1, 1, 1, 1, 1,
0.7329285, 1.941163, 1.110333, 1, 1, 1, 1, 1,
0.7349678, -1.13757, 3.475532, 1, 1, 1, 1, 1,
0.7360123, 0.2155549, 3.070362, 1, 1, 1, 1, 1,
0.7387268, -0.02406609, 1.842956, 1, 1, 1, 1, 1,
0.7454761, -1.799061, 3.199848, 1, 1, 1, 1, 1,
0.749103, -1.574706, 2.661688, 1, 1, 1, 1, 1,
0.7500055, -1.337082, 1.049181, 1, 1, 1, 1, 1,
0.7545906, 0.4328207, 0.4014657, 1, 1, 1, 1, 1,
0.7587219, -1.275612, 2.412626, 0, 0, 1, 1, 1,
0.7616342, 0.818374, 3.61295, 1, 0, 0, 1, 1,
0.7676718, -0.01720086, 3.071898, 1, 0, 0, 1, 1,
0.7691202, 0.1119197, 0.4818484, 1, 0, 0, 1, 1,
0.7702314, 0.6782469, 1.245311, 1, 0, 0, 1, 1,
0.7716011, 1.176737, 0.7574064, 1, 0, 0, 1, 1,
0.7779299, -0.9133383, 1.912814, 0, 0, 0, 1, 1,
0.7789246, -0.5518457, 2.138531, 0, 0, 0, 1, 1,
0.7833682, 0.4869708, 3.013457, 0, 0, 0, 1, 1,
0.7876408, 0.0217099, 0.8896279, 0, 0, 0, 1, 1,
0.7929248, -3.028692, 0.6409979, 0, 0, 0, 1, 1,
0.7953514, 1.204354, -0.5283476, 0, 0, 0, 1, 1,
0.7954547, -0.4711748, 2.012877, 0, 0, 0, 1, 1,
0.8010951, 1.073786, 0.6626412, 1, 1, 1, 1, 1,
0.8014556, 0.861875, 0.64223, 1, 1, 1, 1, 1,
0.8050335, -1.230288, 3.005382, 1, 1, 1, 1, 1,
0.8076465, 2.071835, 1.071464, 1, 1, 1, 1, 1,
0.8086267, -0.216572, 2.357685, 1, 1, 1, 1, 1,
0.8088965, 0.3336841, 0.2813581, 1, 1, 1, 1, 1,
0.8134362, -0.3803275, 1.95525, 1, 1, 1, 1, 1,
0.8138009, -0.2390397, 1.086429, 1, 1, 1, 1, 1,
0.8144536, 0.4498878, -0.1231581, 1, 1, 1, 1, 1,
0.8196704, 1.171628, 0.8392484, 1, 1, 1, 1, 1,
0.8245565, -0.9894771, 3.855801, 1, 1, 1, 1, 1,
0.8292729, 1.919982, -2.092731, 1, 1, 1, 1, 1,
0.8345597, 0.6569445, 2.66669, 1, 1, 1, 1, 1,
0.8393426, -0.3655399, 0.04460295, 1, 1, 1, 1, 1,
0.8408561, 1.392423, 0.03338754, 1, 1, 1, 1, 1,
0.8411633, 0.3775632, 1.751413, 0, 0, 1, 1, 1,
0.8528285, -1.209729, 1.326399, 1, 0, 0, 1, 1,
0.8533424, -0.0118033, 1.345246, 1, 0, 0, 1, 1,
0.8572813, 1.293301, -1.238398, 1, 0, 0, 1, 1,
0.8627632, 0.1471844, 0.5083643, 1, 0, 0, 1, 1,
0.8657378, -1.437785, 2.442159, 1, 0, 0, 1, 1,
0.8690292, -0.1498441, 1.269421, 0, 0, 0, 1, 1,
0.873713, -2.597929, 2.297508, 0, 0, 0, 1, 1,
0.875583, 1.791467, -0.2358268, 0, 0, 0, 1, 1,
0.8832428, -0.3073429, 1.977109, 0, 0, 0, 1, 1,
0.8834788, -1.326643, 1.974113, 0, 0, 0, 1, 1,
0.8850835, 0.8072808, 1.522341, 0, 0, 0, 1, 1,
0.8916689, -0.4206097, 4.224813, 0, 0, 0, 1, 1,
0.8931311, 0.7624531, 0.2761649, 1, 1, 1, 1, 1,
0.9007916, -0.183003, 1.28761, 1, 1, 1, 1, 1,
0.903385, -0.6765575, 2.648046, 1, 1, 1, 1, 1,
0.9062219, -0.9476624, 0.4285398, 1, 1, 1, 1, 1,
0.9062688, -0.6921703, 1.609652, 1, 1, 1, 1, 1,
0.9174885, -0.6221821, 2.828364, 1, 1, 1, 1, 1,
0.9290575, 0.1595878, 1.729706, 1, 1, 1, 1, 1,
0.937767, -0.5473101, 1.364597, 1, 1, 1, 1, 1,
0.94867, -0.09109893, 1.33871, 1, 1, 1, 1, 1,
0.9531327, 1.746266, 0.5657314, 1, 1, 1, 1, 1,
0.9567324, -1.262891, 0.810617, 1, 1, 1, 1, 1,
0.9577064, -0.9061601, 0.8939157, 1, 1, 1, 1, 1,
0.9586719, 0.1309726, 0.8329373, 1, 1, 1, 1, 1,
0.9655644, -0.7582809, 2.711984, 1, 1, 1, 1, 1,
0.9719364, 1.281132, 3.16215, 1, 1, 1, 1, 1,
0.9747293, 0.7932919, -0.1303391, 0, 0, 1, 1, 1,
0.9809933, 2.160988, 0.5362652, 1, 0, 0, 1, 1,
0.981465, -0.5900922, 2.02537, 1, 0, 0, 1, 1,
0.9863042, 1.663551, -0.2100731, 1, 0, 0, 1, 1,
0.9923318, -0.07846252, 1.982394, 1, 0, 0, 1, 1,
0.9981632, -0.07135358, 0.603094, 1, 0, 0, 1, 1,
1.005202, -0.03555527, 1.333993, 0, 0, 0, 1, 1,
1.012353, -0.9897532, 1.045306, 0, 0, 0, 1, 1,
1.01834, 0.6474156, 1.301287, 0, 0, 0, 1, 1,
1.020126, 1.24922, -0.2098111, 0, 0, 0, 1, 1,
1.022189, 1.004206, 1.443401, 0, 0, 0, 1, 1,
1.026798, 0.04970826, 1.490913, 0, 0, 0, 1, 1,
1.035017, 1.503521, 0.1051588, 0, 0, 0, 1, 1,
1.038676, -0.2086276, 1.159736, 1, 1, 1, 1, 1,
1.042038, 1.17219, -1.110685, 1, 1, 1, 1, 1,
1.04848, -0.2305805, 1.09253, 1, 1, 1, 1, 1,
1.05056, -0.1283011, 1.736626, 1, 1, 1, 1, 1,
1.065667, -0.7890143, 3.194848, 1, 1, 1, 1, 1,
1.068152, -0.1269162, 3.096841, 1, 1, 1, 1, 1,
1.069146, -0.4754754, 2.770056, 1, 1, 1, 1, 1,
1.075292, -0.703408, 3.062618, 1, 1, 1, 1, 1,
1.091515, -1.16553, 3.11427, 1, 1, 1, 1, 1,
1.100646, -0.6777075, 1.888807, 1, 1, 1, 1, 1,
1.107627, -0.3813553, 1.246276, 1, 1, 1, 1, 1,
1.108145, -0.436529, 2.627728, 1, 1, 1, 1, 1,
1.113996, 1.381175, 0.5646933, 1, 1, 1, 1, 1,
1.116874, -0.2985982, 3.172016, 1, 1, 1, 1, 1,
1.121174, -1.169584, 3.136614, 1, 1, 1, 1, 1,
1.127397, 0.6070112, 0.01776484, 0, 0, 1, 1, 1,
1.134753, 0.465262, 2.393692, 1, 0, 0, 1, 1,
1.135331, 0.1987224, -0.9076447, 1, 0, 0, 1, 1,
1.138798, -0.06213911, 2.018126, 1, 0, 0, 1, 1,
1.14027, 1.334512, 1.148972, 1, 0, 0, 1, 1,
1.140279, 0.3687609, 1.850039, 1, 0, 0, 1, 1,
1.144004, 0.05202862, 1.244886, 0, 0, 0, 1, 1,
1.147624, 1.076145, 0.6550103, 0, 0, 0, 1, 1,
1.155889, -0.1176001, 1.842683, 0, 0, 0, 1, 1,
1.157973, 0.6841486, 2.14608, 0, 0, 0, 1, 1,
1.158475, -0.2713138, 2.719159, 0, 0, 0, 1, 1,
1.167808, -0.8663369, 2.083329, 0, 0, 0, 1, 1,
1.167994, -0.6295255, 2.720448, 0, 0, 0, 1, 1,
1.173953, -1.455412, 1.337637, 1, 1, 1, 1, 1,
1.178463, 0.1969258, 1.103226, 1, 1, 1, 1, 1,
1.183004, 0.782141, 2.743634, 1, 1, 1, 1, 1,
1.184121, 0.0647235, 2.993367, 1, 1, 1, 1, 1,
1.187523, 0.3869367, 1.903882, 1, 1, 1, 1, 1,
1.187925, 0.5062248, 0.07636076, 1, 1, 1, 1, 1,
1.18921, 0.6073981, 1.857013, 1, 1, 1, 1, 1,
1.19536, -1.136833, 0.7814648, 1, 1, 1, 1, 1,
1.199161, -1.117452, 2.11222, 1, 1, 1, 1, 1,
1.209134, 0.4666192, 2.181071, 1, 1, 1, 1, 1,
1.215919, -1.18006, 2.874812, 1, 1, 1, 1, 1,
1.222581, 1.792003, 0.9026453, 1, 1, 1, 1, 1,
1.225211, -0.8555793, 1.654527, 1, 1, 1, 1, 1,
1.227063, -0.8499242, 3.604032, 1, 1, 1, 1, 1,
1.236373, -0.061099, 0.8067935, 1, 1, 1, 1, 1,
1.240465, -0.1515868, 1.555677, 0, 0, 1, 1, 1,
1.246309, -0.3345334, 1.799142, 1, 0, 0, 1, 1,
1.254055, 0.2894602, 2.082766, 1, 0, 0, 1, 1,
1.266762, 0.3455694, 1.113404, 1, 0, 0, 1, 1,
1.26844, -0.3650999, 0.4786942, 1, 0, 0, 1, 1,
1.270568, -0.2986075, 2.230739, 1, 0, 0, 1, 1,
1.294106, -1.520725, 2.190118, 0, 0, 0, 1, 1,
1.29505, -0.169071, 2.774716, 0, 0, 0, 1, 1,
1.302426, -1.245996, 4.103786, 0, 0, 0, 1, 1,
1.308987, 1.067434, -0.9537309, 0, 0, 0, 1, 1,
1.314039, -0.3672822, 0.03879765, 0, 0, 0, 1, 1,
1.319035, 1.360297, 1.249851, 0, 0, 0, 1, 1,
1.319326, 0.2330917, 0.5031376, 0, 0, 0, 1, 1,
1.322017, -0.6382211, 3.379162, 1, 1, 1, 1, 1,
1.3239, -1.205544, 2.604505, 1, 1, 1, 1, 1,
1.332485, -1.209301, 2.929746, 1, 1, 1, 1, 1,
1.340208, -1.096313, 3.326854, 1, 1, 1, 1, 1,
1.34415, 0.5602853, 3.441911, 1, 1, 1, 1, 1,
1.37406, -0.578111, 2.232344, 1, 1, 1, 1, 1,
1.381671, -0.1894299, 0.3697506, 1, 1, 1, 1, 1,
1.393258, -0.0342202, 1.884891, 1, 1, 1, 1, 1,
1.39415, 0.414915, 1.933443, 1, 1, 1, 1, 1,
1.398096, 0.8246767, 2.421639, 1, 1, 1, 1, 1,
1.424019, -1.263716, 2.997742, 1, 1, 1, 1, 1,
1.428641, 0.5530934, 0.4076657, 1, 1, 1, 1, 1,
1.442023, -0.2833934, 2.055759, 1, 1, 1, 1, 1,
1.444443, 0.7162708, -0.286491, 1, 1, 1, 1, 1,
1.449223, -1.303531, 2.20807, 1, 1, 1, 1, 1,
1.451522, 0.8999234, 2.119643, 0, 0, 1, 1, 1,
1.453773, -0.4316203, 3.471103, 1, 0, 0, 1, 1,
1.471317, -0.2554525, 1.442077, 1, 0, 0, 1, 1,
1.476451, -0.1385765, 0.1612035, 1, 0, 0, 1, 1,
1.480064, -1.541577, 2.348505, 1, 0, 0, 1, 1,
1.481516, 0.4670657, 0.3633287, 1, 0, 0, 1, 1,
1.493262, -1.371685, 2.953864, 0, 0, 0, 1, 1,
1.494789, 1.558896, 0.2281917, 0, 0, 0, 1, 1,
1.495883, -0.3967557, 2.443725, 0, 0, 0, 1, 1,
1.496964, 0.718208, -1.208078, 0, 0, 0, 1, 1,
1.505809, 0.3159671, 1.610335, 0, 0, 0, 1, 1,
1.507302, -0.6349477, 2.248955, 0, 0, 0, 1, 1,
1.516403, 1.498913, -0.2968566, 0, 0, 0, 1, 1,
1.539401, -0.5833653, 1.122163, 1, 1, 1, 1, 1,
1.54736, 0.5492278, 0.268752, 1, 1, 1, 1, 1,
1.559013, 0.8294803, -1.13185, 1, 1, 1, 1, 1,
1.559441, 1.591342, 1.670856, 1, 1, 1, 1, 1,
1.560202, -0.1903052, 2.085511, 1, 1, 1, 1, 1,
1.567112, -2.473597, 1.65811, 1, 1, 1, 1, 1,
1.5876, 0.2721758, -0.134548, 1, 1, 1, 1, 1,
1.593967, -1.328558, 2.095423, 1, 1, 1, 1, 1,
1.612914, 0.8730664, 0.8381491, 1, 1, 1, 1, 1,
1.632454, -1.542985, 2.741886, 1, 1, 1, 1, 1,
1.632982, 0.3404782, 1.998804, 1, 1, 1, 1, 1,
1.633523, 0.07105728, 2.63484, 1, 1, 1, 1, 1,
1.682953, -0.8605243, 2.016775, 1, 1, 1, 1, 1,
1.688514, 1.487353, 0.7890425, 1, 1, 1, 1, 1,
1.702395, 0.00931232, 1.494422, 1, 1, 1, 1, 1,
1.725446, 1.622642, 1.421106, 0, 0, 1, 1, 1,
1.731963, 0.695772, 1.690299, 1, 0, 0, 1, 1,
1.734502, -0.3706414, 1.196867, 1, 0, 0, 1, 1,
1.744768, 0.08999581, 1.335756, 1, 0, 0, 1, 1,
1.74894, 0.2765145, 0.128329, 1, 0, 0, 1, 1,
1.752197, -1.228868, 3.049961, 1, 0, 0, 1, 1,
1.768252, 0.460754, 1.728101, 0, 0, 0, 1, 1,
1.778113, 0.9957519, 1.388713, 0, 0, 0, 1, 1,
1.781986, -1.420204, 2.526509, 0, 0, 0, 1, 1,
1.792352, -2.490318, 3.342357, 0, 0, 0, 1, 1,
1.815607, 0.3115008, 2.372437, 0, 0, 0, 1, 1,
1.82836, -0.2134281, 0.3952429, 0, 0, 0, 1, 1,
1.853144, 0.225493, 1.897065, 0, 0, 0, 1, 1,
1.859686, -0.9409696, 3.244809, 1, 1, 1, 1, 1,
1.873434, 0.4393053, 0.1538051, 1, 1, 1, 1, 1,
1.875936, 0.2209594, -0.1292638, 1, 1, 1, 1, 1,
1.876441, 0.6882679, 2.194542, 1, 1, 1, 1, 1,
1.877086, 0.5154986, 0.9992108, 1, 1, 1, 1, 1,
1.89726, -1.153306, 1.260046, 1, 1, 1, 1, 1,
1.90058, -0.6468843, 1.913299, 1, 1, 1, 1, 1,
1.905772, 1.110377, 1.463192, 1, 1, 1, 1, 1,
1.915058, 1.054339, 0.7556844, 1, 1, 1, 1, 1,
1.928059, -0.6064869, 3.058435, 1, 1, 1, 1, 1,
1.951877, 1.346537, 3.359155, 1, 1, 1, 1, 1,
1.994427, -0.6666496, 1.596736, 1, 1, 1, 1, 1,
2.008334, 0.803607, 1.152596, 1, 1, 1, 1, 1,
2.018647, 2.571982, 1.268604, 1, 1, 1, 1, 1,
2.040436, 0.3817675, 1.860093, 1, 1, 1, 1, 1,
2.057098, -0.8180181, 1.241833, 0, 0, 1, 1, 1,
2.097996, 0.19636, 0.6437252, 1, 0, 0, 1, 1,
2.121477, 0.5369946, 3.14158, 1, 0, 0, 1, 1,
2.12301, 0.482616, 3.324365, 1, 0, 0, 1, 1,
2.126164, -2.099154, 1.564234, 1, 0, 0, 1, 1,
2.204647, -0.2103986, 1.655524, 1, 0, 0, 1, 1,
2.210318, -0.643194, 2.351022, 0, 0, 0, 1, 1,
2.219372, -0.4272471, 1.347499, 0, 0, 0, 1, 1,
2.248579, 0.5098156, 1.655443, 0, 0, 0, 1, 1,
2.363868, 0.9022138, 1.2148, 0, 0, 0, 1, 1,
2.386923, 1.841276, 0.8758433, 0, 0, 0, 1, 1,
2.407552, 0.8917037, 1.904357, 0, 0, 0, 1, 1,
2.425047, 1.128924, 1.367072, 0, 0, 0, 1, 1,
2.525355, 0.3200154, 0.803845, 1, 1, 1, 1, 1,
2.611111, 0.0201724, 1.323925, 1, 1, 1, 1, 1,
2.657609, -0.1982485, 1.595376, 1, 1, 1, 1, 1,
2.696546, -0.9306243, 0.850757, 1, 1, 1, 1, 1,
2.767959, -0.1459594, -0.3742952, 1, 1, 1, 1, 1,
2.90523, -0.1376804, 2.427184, 1, 1, 1, 1, 1,
2.958671, 2.097611, -0.2262811, 1, 1, 1, 1, 1
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
var radius = 9.65057;
var distance = 33.89722;
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
mvMatrix.translate( 0.07857299, 0.07086873, -0.6600654 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.89722);
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