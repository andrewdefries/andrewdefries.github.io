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
-2.953227, 1.137988, -0.7831759, 1, 0, 0, 1,
-2.86317, 0.8549362, -3.903858, 1, 0.007843138, 0, 1,
-2.787288, -1.306412, -1.805625, 1, 0.01176471, 0, 1,
-2.749989, -1.636631, -0.7810454, 1, 0.01960784, 0, 1,
-2.688604, -1.114263, -0.5577144, 1, 0.02352941, 0, 1,
-2.608177, -0.8751618, -3.50915, 1, 0.03137255, 0, 1,
-2.549136, -0.6495327, -2.33978, 1, 0.03529412, 0, 1,
-2.478837, -0.049948, -1.804837, 1, 0.04313726, 0, 1,
-2.398511, -0.7997907, -3.39901, 1, 0.04705882, 0, 1,
-2.326281, 0.4835964, -2.315027, 1, 0.05490196, 0, 1,
-2.247889, -0.1678746, -1.624079, 1, 0.05882353, 0, 1,
-2.211329, -1.981228, -3.383761, 1, 0.06666667, 0, 1,
-2.164832, -0.126812, -1.350543, 1, 0.07058824, 0, 1,
-2.161545, -0.6466441, -2.83113, 1, 0.07843138, 0, 1,
-2.132978, 1.593022, -0.6211958, 1, 0.08235294, 0, 1,
-2.112235, -0.7793159, -0.8465204, 1, 0.09019608, 0, 1,
-2.052961, 0.111071, -1.834458, 1, 0.09411765, 0, 1,
-2.050867, 0.8633543, -0.7188135, 1, 0.1019608, 0, 1,
-2.031966, -0.7168639, -3.137836, 1, 0.1098039, 0, 1,
-2.021122, -0.4800238, -0.2270903, 1, 0.1137255, 0, 1,
-2.008973, 0.02986886, -3.02646, 1, 0.1215686, 0, 1,
-1.97834, 1.742905, -2.483873, 1, 0.1254902, 0, 1,
-1.940243, -0.3556263, 0.4854284, 1, 0.1333333, 0, 1,
-1.926705, 0.1279076, -1.248935, 1, 0.1372549, 0, 1,
-1.919451, 0.2219893, -1.817333, 1, 0.145098, 0, 1,
-1.908524, 1.291267, -0.7677236, 1, 0.1490196, 0, 1,
-1.864091, -0.8877387, -1.321801, 1, 0.1568628, 0, 1,
-1.829162, 0.6309857, -0.5886813, 1, 0.1607843, 0, 1,
-1.822736, 1.028906, -2.225442, 1, 0.1686275, 0, 1,
-1.810584, 0.122927, -1.477214, 1, 0.172549, 0, 1,
-1.790872, 0.9539773, -2.474884, 1, 0.1803922, 0, 1,
-1.75351, -0.445093, -1.686356, 1, 0.1843137, 0, 1,
-1.74625, -0.5834576, -3.221984, 1, 0.1921569, 0, 1,
-1.738823, 0.9463847, -2.087217, 1, 0.1960784, 0, 1,
-1.731041, 1.334297, -0.6707356, 1, 0.2039216, 0, 1,
-1.725241, 0.7350162, -2.155167, 1, 0.2117647, 0, 1,
-1.719838, -1.144265, -1.119139, 1, 0.2156863, 0, 1,
-1.712416, 0.5771235, -1.757727, 1, 0.2235294, 0, 1,
-1.707502, 1.064218, -1.656936, 1, 0.227451, 0, 1,
-1.690846, -0.2947966, -2.88291, 1, 0.2352941, 0, 1,
-1.68654, 1.897104, -0.3642142, 1, 0.2392157, 0, 1,
-1.683563, -0.1749585, -1.678925, 1, 0.2470588, 0, 1,
-1.673015, -1.927724, -3.920229, 1, 0.2509804, 0, 1,
-1.671739, -1.865684, -3.144185, 1, 0.2588235, 0, 1,
-1.671022, -1.250451, -4.744874, 1, 0.2627451, 0, 1,
-1.669873, -0.5208215, -2.206397, 1, 0.2705882, 0, 1,
-1.663726, 0.9701513, -1.840178, 1, 0.2745098, 0, 1,
-1.65658, -1.011234, -3.977112, 1, 0.282353, 0, 1,
-1.656473, -0.5587299, -3.596783, 1, 0.2862745, 0, 1,
-1.655434, -0.004986529, -0.8697069, 1, 0.2941177, 0, 1,
-1.649661, -0.7919299, -2.234326, 1, 0.3019608, 0, 1,
-1.648581, -0.800366, -3.658638, 1, 0.3058824, 0, 1,
-1.631562, -1.826212, -1.017748, 1, 0.3137255, 0, 1,
-1.626266, -0.7884551, -1.23114, 1, 0.3176471, 0, 1,
-1.62538, 1.592584, -1.137382, 1, 0.3254902, 0, 1,
-1.604503, -1.487526, -2.932999, 1, 0.3294118, 0, 1,
-1.596009, 0.2478562, -1.113659, 1, 0.3372549, 0, 1,
-1.579368, -0.2961804, -1.440902, 1, 0.3411765, 0, 1,
-1.578056, -0.505281, -1.671096, 1, 0.3490196, 0, 1,
-1.577481, -0.005807271, -0.156245, 1, 0.3529412, 0, 1,
-1.571999, 1.389763, -3.511596, 1, 0.3607843, 0, 1,
-1.566046, 0.5888107, -0.4562619, 1, 0.3647059, 0, 1,
-1.56425, 0.5148549, -2.635147, 1, 0.372549, 0, 1,
-1.55396, -0.9857823, -1.555435, 1, 0.3764706, 0, 1,
-1.522017, 0.1016049, -0.8616911, 1, 0.3843137, 0, 1,
-1.520496, 0.744363, 0.8649725, 1, 0.3882353, 0, 1,
-1.509135, 0.8747258, -1.934682, 1, 0.3960784, 0, 1,
-1.505596, -0.02558111, -2.592276, 1, 0.4039216, 0, 1,
-1.486795, 0.7322823, -1.098366, 1, 0.4078431, 0, 1,
-1.475658, 0.4470108, -0.3916005, 1, 0.4156863, 0, 1,
-1.474753, 0.5919591, -1.344606, 1, 0.4196078, 0, 1,
-1.457584, -1.178123, -2.039778, 1, 0.427451, 0, 1,
-1.444663, 0.6619752, -1.208447, 1, 0.4313726, 0, 1,
-1.443344, -0.2370929, -3.544749, 1, 0.4392157, 0, 1,
-1.442034, 0.3726404, -0.7901946, 1, 0.4431373, 0, 1,
-1.436809, 1.798589, -2.076055, 1, 0.4509804, 0, 1,
-1.428086, 0.06568174, -0.03096379, 1, 0.454902, 0, 1,
-1.416694, 1.176257, -0.9190013, 1, 0.4627451, 0, 1,
-1.415631, 0.6849584, -1.215752, 1, 0.4666667, 0, 1,
-1.40487, -0.8802374, -2.987462, 1, 0.4745098, 0, 1,
-1.381253, -1.555439, -2.81307, 1, 0.4784314, 0, 1,
-1.371589, 0.843977, -1.571105, 1, 0.4862745, 0, 1,
-1.336628, 0.4177911, -0.6849483, 1, 0.4901961, 0, 1,
-1.334644, -1.433201, -3.766911, 1, 0.4980392, 0, 1,
-1.332552, 0.3549405, -1.529895, 1, 0.5058824, 0, 1,
-1.322888, 0.296333, -0.8629186, 1, 0.509804, 0, 1,
-1.311988, -0.8112556, 0.02262078, 1, 0.5176471, 0, 1,
-1.311239, 0.3895122, -1.811373, 1, 0.5215687, 0, 1,
-1.31039, -1.928637, -1.736514, 1, 0.5294118, 0, 1,
-1.30672, -1.815807, -2.433132, 1, 0.5333334, 0, 1,
-1.305512, 0.05331662, -0.06575187, 1, 0.5411765, 0, 1,
-1.299343, 0.8503284, -0.99155, 1, 0.5450981, 0, 1,
-1.29678, 0.4844463, -0.9039313, 1, 0.5529412, 0, 1,
-1.286915, -0.4936511, -2.534359, 1, 0.5568628, 0, 1,
-1.284406, 0.255527, -3.44272, 1, 0.5647059, 0, 1,
-1.28289, -0.2631764, -1.924309, 1, 0.5686275, 0, 1,
-1.281878, -1.313167, -3.230268, 1, 0.5764706, 0, 1,
-1.276702, -0.3239575, -0.8133129, 1, 0.5803922, 0, 1,
-1.27589, 0.2361876, -1.389752, 1, 0.5882353, 0, 1,
-1.26, 0.5398215, -0.4240276, 1, 0.5921569, 0, 1,
-1.258237, -0.02149667, -1.425092, 1, 0.6, 0, 1,
-1.252694, 1.375099, -2.450813, 1, 0.6078432, 0, 1,
-1.241642, -0.6267707, -1.677341, 1, 0.6117647, 0, 1,
-1.239515, -0.4605051, -2.054612, 1, 0.6196079, 0, 1,
-1.236576, -0.7362047, -2.147262, 1, 0.6235294, 0, 1,
-1.233685, -0.9181659, -0.1973822, 1, 0.6313726, 0, 1,
-1.232072, 0.02304208, -1.616348, 1, 0.6352941, 0, 1,
-1.231807, -0.7104649, -2.100353, 1, 0.6431373, 0, 1,
-1.226262, -0.6980353, -2.627625, 1, 0.6470588, 0, 1,
-1.221573, -0.7940984, -2.57249, 1, 0.654902, 0, 1,
-1.214157, -0.3186255, -0.7806241, 1, 0.6588235, 0, 1,
-1.205787, 0.7026106, -0.3716119, 1, 0.6666667, 0, 1,
-1.197777, 0.2547383, -0.4867766, 1, 0.6705883, 0, 1,
-1.189427, -1.309226, -3.553739, 1, 0.6784314, 0, 1,
-1.172701, 0.6534383, -1.316606, 1, 0.682353, 0, 1,
-1.168759, 0.1086126, -0.8312916, 1, 0.6901961, 0, 1,
-1.168148, -2.421934, -3.63369, 1, 0.6941177, 0, 1,
-1.16727, 1.22083, -1.397451, 1, 0.7019608, 0, 1,
-1.164885, -1.566177, -2.231853, 1, 0.7098039, 0, 1,
-1.156707, 0.03486456, -1.7565, 1, 0.7137255, 0, 1,
-1.151938, 1.593979, -0.722621, 1, 0.7215686, 0, 1,
-1.140873, 0.970507, -1.719987, 1, 0.7254902, 0, 1,
-1.133821, 2.77818, 0.7454271, 1, 0.7333333, 0, 1,
-1.132082, 0.9178537, -0.3871049, 1, 0.7372549, 0, 1,
-1.121184, -0.03633054, -3.09845, 1, 0.7450981, 0, 1,
-1.115738, 2.485431, -0.5515223, 1, 0.7490196, 0, 1,
-1.113562, -1.863986, -2.69884, 1, 0.7568628, 0, 1,
-1.113097, 0.1279321, -0.9997586, 1, 0.7607843, 0, 1,
-1.10837, -1.725855, -2.0182, 1, 0.7686275, 0, 1,
-1.103328, -1.907382, 0.2877555, 1, 0.772549, 0, 1,
-1.09487, 0.6489516, -1.183045, 1, 0.7803922, 0, 1,
-1.094617, -0.5623367, -0.03612362, 1, 0.7843137, 0, 1,
-1.086727, -0.2637267, -2.365172, 1, 0.7921569, 0, 1,
-1.080896, -0.3185942, -2.187365, 1, 0.7960784, 0, 1,
-1.065103, -1.936163, -4.238214, 1, 0.8039216, 0, 1,
-1.064857, 0.918929, -0.2890417, 1, 0.8117647, 0, 1,
-1.062277, 2.791749, -1.287085, 1, 0.8156863, 0, 1,
-1.060832, -0.1721574, -0.8783721, 1, 0.8235294, 0, 1,
-1.059625, 1.784095, 2.74806, 1, 0.827451, 0, 1,
-1.05608, -0.7304857, -2.307594, 1, 0.8352941, 0, 1,
-1.055792, -0.5443149, -1.445971, 1, 0.8392157, 0, 1,
-1.053033, 0.1043801, -0.5274053, 1, 0.8470588, 0, 1,
-1.052441, -0.07776835, -0.5714672, 1, 0.8509804, 0, 1,
-1.048995, -1.658883, -2.673531, 1, 0.8588235, 0, 1,
-1.044113, -0.6461891, -3.386705, 1, 0.8627451, 0, 1,
-1.043081, 1.354637, 0.04031486, 1, 0.8705882, 0, 1,
-1.042209, 3.268748, -0.9976376, 1, 0.8745098, 0, 1,
-1.04154, 0.9729064, -2.608032, 1, 0.8823529, 0, 1,
-1.038452, -1.052598, -2.203401, 1, 0.8862745, 0, 1,
-1.033063, -1.430602, -3.412334, 1, 0.8941177, 0, 1,
-1.020807, 0.791773, -2.131078, 1, 0.8980392, 0, 1,
-1.01424, -0.9914927, -1.18745, 1, 0.9058824, 0, 1,
-1.009049, 0.7027024, -0.636566, 1, 0.9137255, 0, 1,
-1.008676, -0.01799654, -1.978763, 1, 0.9176471, 0, 1,
-0.9968629, 0.7170068, 0.5807657, 1, 0.9254902, 0, 1,
-0.9958686, -1.140179, -2.310228, 1, 0.9294118, 0, 1,
-0.9949103, 0.5248007, -0.1576111, 1, 0.9372549, 0, 1,
-0.9928103, 0.8864347, -0.181998, 1, 0.9411765, 0, 1,
-0.9877264, 0.8121424, 0.8563955, 1, 0.9490196, 0, 1,
-0.98678, -2.113194, -1.982767, 1, 0.9529412, 0, 1,
-0.9831183, 0.217701, -1.219157, 1, 0.9607843, 0, 1,
-0.966077, 0.2600715, -1.369162, 1, 0.9647059, 0, 1,
-0.9640464, -1.182215, -4.220687, 1, 0.972549, 0, 1,
-0.9597003, -0.2794218, -1.079417, 1, 0.9764706, 0, 1,
-0.9579368, -2.181144, -1.051723, 1, 0.9843137, 0, 1,
-0.9572772, 1.225201, 0.07080367, 1, 0.9882353, 0, 1,
-0.9558372, 2.231486, -2.956269, 1, 0.9960784, 0, 1,
-0.9509826, -0.1544206, -1.156311, 0.9960784, 1, 0, 1,
-0.9502036, -0.6712968, -0.9230583, 0.9921569, 1, 0, 1,
-0.938595, -0.9797687, -4.049424, 0.9843137, 1, 0, 1,
-0.9371674, 1.529791, -0.06328037, 0.9803922, 1, 0, 1,
-0.9356952, -0.8401535, -1.790233, 0.972549, 1, 0, 1,
-0.9330618, -0.8262196, -3.292737, 0.9686275, 1, 0, 1,
-0.9325135, -0.2184594, -2.394624, 0.9607843, 1, 0, 1,
-0.9317011, 0.8954502, -2.93518, 0.9568627, 1, 0, 1,
-0.9282494, -0.3691258, -3.60029, 0.9490196, 1, 0, 1,
-0.9165614, -0.5229051, -2.339403, 0.945098, 1, 0, 1,
-0.9165461, 0.1494923, -2.116422, 0.9372549, 1, 0, 1,
-0.9160854, 0.697989, -1.308353, 0.9333333, 1, 0, 1,
-0.914535, -0.282844, -1.735643, 0.9254902, 1, 0, 1,
-0.9142809, 2.12008, -0.5382653, 0.9215686, 1, 0, 1,
-0.9128489, 0.9122403, -0.6609445, 0.9137255, 1, 0, 1,
-0.9079392, -0.9068197, -1.938622, 0.9098039, 1, 0, 1,
-0.905687, -0.3275277, -1.998886, 0.9019608, 1, 0, 1,
-0.9056106, -0.4364704, -1.833416, 0.8941177, 1, 0, 1,
-0.9031578, -0.2152598, -2.795021, 0.8901961, 1, 0, 1,
-0.8946801, 2.19274, -2.779663, 0.8823529, 1, 0, 1,
-0.8919007, -1.296982, -3.178735, 0.8784314, 1, 0, 1,
-0.8911036, -0.04756868, -0.4342711, 0.8705882, 1, 0, 1,
-0.8848797, 1.24099, -1.530775, 0.8666667, 1, 0, 1,
-0.8837513, -1.541575, -2.510948, 0.8588235, 1, 0, 1,
-0.8836297, 0.7932338, -0.9972559, 0.854902, 1, 0, 1,
-0.8777413, 0.150821, -3.346993, 0.8470588, 1, 0, 1,
-0.8772423, -0.1538191, -1.814383, 0.8431373, 1, 0, 1,
-0.875695, 0.4827382, -0.2199573, 0.8352941, 1, 0, 1,
-0.8732246, 0.5790744, -2.805899, 0.8313726, 1, 0, 1,
-0.8730147, 1.007313, -0.2932751, 0.8235294, 1, 0, 1,
-0.8675181, -1.503742, -1.614761, 0.8196079, 1, 0, 1,
-0.8632898, 0.7824222, -1.949638, 0.8117647, 1, 0, 1,
-0.8620304, 0.06071652, -0.974985, 0.8078431, 1, 0, 1,
-0.8611103, 0.6696808, -1.920209, 0.8, 1, 0, 1,
-0.8569538, -0.06807616, -2.531182, 0.7921569, 1, 0, 1,
-0.855862, 0.7138425, 0.4680861, 0.7882353, 1, 0, 1,
-0.8501363, -0.3785709, -0.9212761, 0.7803922, 1, 0, 1,
-0.8409706, 0.1429567, 0.05510253, 0.7764706, 1, 0, 1,
-0.8360805, 0.6939235, 0.7746314, 0.7686275, 1, 0, 1,
-0.8360351, -1.474269, -1.169207, 0.7647059, 1, 0, 1,
-0.8341872, 0.582417, -2.585213, 0.7568628, 1, 0, 1,
-0.8289065, -0.2465552, -1.373843, 0.7529412, 1, 0, 1,
-0.82444, 0.03838748, -1.654027, 0.7450981, 1, 0, 1,
-0.8231393, 0.6543195, -0.5235559, 0.7411765, 1, 0, 1,
-0.818737, -0.3683929, -3.171794, 0.7333333, 1, 0, 1,
-0.8124475, 0.9941086, -1.28866, 0.7294118, 1, 0, 1,
-0.8107065, -1.953608, -3.311308, 0.7215686, 1, 0, 1,
-0.8092499, -0.02852297, -2.684902, 0.7176471, 1, 0, 1,
-0.7974377, -1.616497, -3.286555, 0.7098039, 1, 0, 1,
-0.7897515, 2.250244, -0.9868654, 0.7058824, 1, 0, 1,
-0.7887963, 0.04357595, -1.074587, 0.6980392, 1, 0, 1,
-0.7805352, 0.0009922886, -0.4393608, 0.6901961, 1, 0, 1,
-0.7796822, -2.276225, -2.318754, 0.6862745, 1, 0, 1,
-0.771084, -1.214382, -1.956571, 0.6784314, 1, 0, 1,
-0.7654768, 0.8832258, 0.2494378, 0.6745098, 1, 0, 1,
-0.7653254, -2.354988, -3.370606, 0.6666667, 1, 0, 1,
-0.7651752, 1.431742, -2.126784, 0.6627451, 1, 0, 1,
-0.7588761, 0.7691982, -1.498855, 0.654902, 1, 0, 1,
-0.7569763, -0.4542583, -2.475883, 0.6509804, 1, 0, 1,
-0.7548136, 2.247513, -0.1716459, 0.6431373, 1, 0, 1,
-0.7504158, 1.621193, -1.215926, 0.6392157, 1, 0, 1,
-0.7476737, -1.615197, -2.954, 0.6313726, 1, 0, 1,
-0.7441826, 1.263176, 0.03907504, 0.627451, 1, 0, 1,
-0.7348426, 0.8062887, -0.4298698, 0.6196079, 1, 0, 1,
-0.7333617, -1.554751, -3.730324, 0.6156863, 1, 0, 1,
-0.7282305, 1.098236, -1.885133, 0.6078432, 1, 0, 1,
-0.7258482, -0.1725632, -3.712606, 0.6039216, 1, 0, 1,
-0.7239968, -1.478484, -2.122904, 0.5960785, 1, 0, 1,
-0.7224163, -0.4554459, -2.188418, 0.5882353, 1, 0, 1,
-0.7208598, -0.7439731, -2.979834, 0.5843138, 1, 0, 1,
-0.7150732, 0.5389889, 0.9700086, 0.5764706, 1, 0, 1,
-0.7128907, 0.9883769, 1.398062, 0.572549, 1, 0, 1,
-0.7061405, 0.6879215, -0.4211947, 0.5647059, 1, 0, 1,
-0.7046761, 1.392674, -0.9090522, 0.5607843, 1, 0, 1,
-0.7029713, 1.669948, -1.95976, 0.5529412, 1, 0, 1,
-0.697457, 0.7540272, -0.05818969, 0.5490196, 1, 0, 1,
-0.6923987, 1.927788, -1.813377, 0.5411765, 1, 0, 1,
-0.6909657, -0.3840718, -2.614685, 0.5372549, 1, 0, 1,
-0.6891199, -0.7050586, -2.265065, 0.5294118, 1, 0, 1,
-0.6794116, -1.216462, -2.403925, 0.5254902, 1, 0, 1,
-0.6793497, 0.9103954, 1.664413, 0.5176471, 1, 0, 1,
-0.6694756, 0.2321299, -1.027613, 0.5137255, 1, 0, 1,
-0.6693739, 0.1223148, -0.236066, 0.5058824, 1, 0, 1,
-0.6692905, -1.390848, -1.014012, 0.5019608, 1, 0, 1,
-0.6666193, -0.6380199, -1.751352, 0.4941176, 1, 0, 1,
-0.6615571, 0.4547355, -0.6444069, 0.4862745, 1, 0, 1,
-0.6545726, -1.192667, -1.718123, 0.4823529, 1, 0, 1,
-0.6537401, 0.1100115, -0.9614345, 0.4745098, 1, 0, 1,
-0.6536576, 1.454605, -1.007284, 0.4705882, 1, 0, 1,
-0.6519761, 1.31364, 0.3451243, 0.4627451, 1, 0, 1,
-0.6514894, -1.82011, -6.134305, 0.4588235, 1, 0, 1,
-0.6496252, 0.002144378, -0.1864234, 0.4509804, 1, 0, 1,
-0.6482195, 0.2250496, -3.172679, 0.4470588, 1, 0, 1,
-0.6446275, -0.8724419, -0.509734, 0.4392157, 1, 0, 1,
-0.6432559, 1.059352, 0.9042704, 0.4352941, 1, 0, 1,
-0.6382956, -0.425796, -2.396858, 0.427451, 1, 0, 1,
-0.6336451, -1.700656, -2.948767, 0.4235294, 1, 0, 1,
-0.6327848, 0.1802299, 0.1535986, 0.4156863, 1, 0, 1,
-0.6298253, 1.010672, 0.4732601, 0.4117647, 1, 0, 1,
-0.6257645, 0.09382818, -0.9709265, 0.4039216, 1, 0, 1,
-0.6254306, 0.02496668, -2.149601, 0.3960784, 1, 0, 1,
-0.6224774, -0.8123967, -2.733426, 0.3921569, 1, 0, 1,
-0.6183599, -0.6649038, -2.344673, 0.3843137, 1, 0, 1,
-0.6179827, -0.4890519, -2.208294, 0.3803922, 1, 0, 1,
-0.6131412, -0.6708443, -0.712041, 0.372549, 1, 0, 1,
-0.6130313, -0.2157101, -2.804016, 0.3686275, 1, 0, 1,
-0.6105548, 0.6434381, -0.976519, 0.3607843, 1, 0, 1,
-0.6040336, -2.481794, -4.504209, 0.3568628, 1, 0, 1,
-0.5987249, -0.1012389, -1.728643, 0.3490196, 1, 0, 1,
-0.5949184, -0.2618593, -2.749635, 0.345098, 1, 0, 1,
-0.5923911, -0.3478263, -2.474914, 0.3372549, 1, 0, 1,
-0.591833, -0.01562769, -0.2017021, 0.3333333, 1, 0, 1,
-0.5910848, 1.555652, -1.738904, 0.3254902, 1, 0, 1,
-0.5887632, -0.01529153, -2.436157, 0.3215686, 1, 0, 1,
-0.5855051, 0.2600773, -0.4679927, 0.3137255, 1, 0, 1,
-0.5841754, 0.3342119, -0.4952726, 0.3098039, 1, 0, 1,
-0.5798249, -2.192407, -3.259943, 0.3019608, 1, 0, 1,
-0.5791275, -0.2667652, -0.4105757, 0.2941177, 1, 0, 1,
-0.5788875, 0.4001405, 1.029249, 0.2901961, 1, 0, 1,
-0.5786242, -0.3038532, -1.773507, 0.282353, 1, 0, 1,
-0.5753446, -2.502634, -2.492894, 0.2784314, 1, 0, 1,
-0.574898, 0.2737342, -1.895646, 0.2705882, 1, 0, 1,
-0.5733292, 1.154201, -1.62451, 0.2666667, 1, 0, 1,
-0.5696079, -1.018555, -2.887995, 0.2588235, 1, 0, 1,
-0.5668796, 0.5623053, -0.7792329, 0.254902, 1, 0, 1,
-0.5645484, -0.3077086, -1.820361, 0.2470588, 1, 0, 1,
-0.5645477, 0.9722477, -0.408242, 0.2431373, 1, 0, 1,
-0.5624149, -1.775825, -2.909456, 0.2352941, 1, 0, 1,
-0.5607646, 0.872758, -1.00582, 0.2313726, 1, 0, 1,
-0.5586597, -1.662605, -3.873796, 0.2235294, 1, 0, 1,
-0.5539038, -0.03736544, -1.452178, 0.2196078, 1, 0, 1,
-0.5522063, -0.3474794, 0.8865913, 0.2117647, 1, 0, 1,
-0.5376317, 0.4666061, -0.8860765, 0.2078431, 1, 0, 1,
-0.5357633, -0.4787376, -2.546248, 0.2, 1, 0, 1,
-0.5356317, -1.42407, -3.318763, 0.1921569, 1, 0, 1,
-0.5342932, 0.9152719, -1.856191, 0.1882353, 1, 0, 1,
-0.5333031, -0.2914524, -2.416301, 0.1803922, 1, 0, 1,
-0.5312326, -0.61704, -3.234451, 0.1764706, 1, 0, 1,
-0.5252963, -0.4272077, -2.182472, 0.1686275, 1, 0, 1,
-0.5245852, -0.05619912, -2.328306, 0.1647059, 1, 0, 1,
-0.5193253, 0.1862829, -4.141254, 0.1568628, 1, 0, 1,
-0.5130997, 0.01665909, -3.952052, 0.1529412, 1, 0, 1,
-0.5094245, -0.3841273, -2.405829, 0.145098, 1, 0, 1,
-0.5027224, -0.9276131, -1.56966, 0.1411765, 1, 0, 1,
-0.4955652, -0.2061531, -0.1914099, 0.1333333, 1, 0, 1,
-0.4920787, 1.176874, -0.2030465, 0.1294118, 1, 0, 1,
-0.4902081, -1.181023, -3.515563, 0.1215686, 1, 0, 1,
-0.4871505, -0.3625397, -2.283876, 0.1176471, 1, 0, 1,
-0.4809666, 0.4566877, -1.430892, 0.1098039, 1, 0, 1,
-0.4765628, -0.2223323, -2.007242, 0.1058824, 1, 0, 1,
-0.4720506, 0.7783558, -1.161039, 0.09803922, 1, 0, 1,
-0.4644909, 1.51607, -1.07759, 0.09019608, 1, 0, 1,
-0.4609169, 2.41547, 0.3081214, 0.08627451, 1, 0, 1,
-0.4606947, -1.055383, -2.649913, 0.07843138, 1, 0, 1,
-0.4534876, 1.042687, -0.03481287, 0.07450981, 1, 0, 1,
-0.4507729, -0.3255053, -2.719822, 0.06666667, 1, 0, 1,
-0.4478114, 1.448619, -0.9198956, 0.0627451, 1, 0, 1,
-0.4432095, -0.07235173, 0.5223352, 0.05490196, 1, 0, 1,
-0.4355301, 0.1360517, -1.600485, 0.05098039, 1, 0, 1,
-0.4348721, -0.8177691, -0.9047423, 0.04313726, 1, 0, 1,
-0.4347296, 0.1524193, -2.744642, 0.03921569, 1, 0, 1,
-0.431321, 0.8354462, -0.4429543, 0.03137255, 1, 0, 1,
-0.4306646, -0.8270718, -3.158948, 0.02745098, 1, 0, 1,
-0.4299726, 1.380579, 0.2011121, 0.01960784, 1, 0, 1,
-0.4288168, 0.8406195, 1.163432, 0.01568628, 1, 0, 1,
-0.425629, -1.323094, -3.723663, 0.007843138, 1, 0, 1,
-0.4206326, -0.0644768, -1.874857, 0.003921569, 1, 0, 1,
-0.4199687, 1.883136, 0.8152376, 0, 1, 0.003921569, 1,
-0.415475, 0.269784, -1.113078, 0, 1, 0.01176471, 1,
-0.4138727, -0.09149305, -0.8807424, 0, 1, 0.01568628, 1,
-0.4134333, 1.558938, 1.253574, 0, 1, 0.02352941, 1,
-0.4131531, -1.023609, -2.309086, 0, 1, 0.02745098, 1,
-0.4121932, 0.4575581, 0.6841122, 0, 1, 0.03529412, 1,
-0.4084684, -0.6103017, -2.561966, 0, 1, 0.03921569, 1,
-0.4055831, -0.1126401, -0.1136467, 0, 1, 0.04705882, 1,
-0.4052373, -0.3733016, -1.89077, 0, 1, 0.05098039, 1,
-0.3961425, 0.8408092, -1.123538, 0, 1, 0.05882353, 1,
-0.3944618, 0.2938584, -0.2143668, 0, 1, 0.0627451, 1,
-0.3927114, -0.888326, -2.603924, 0, 1, 0.07058824, 1,
-0.3852061, 0.3068446, -0.1212678, 0, 1, 0.07450981, 1,
-0.3849748, 0.7412288, 0.982124, 0, 1, 0.08235294, 1,
-0.3807906, 1.177189, 0.6455446, 0, 1, 0.08627451, 1,
-0.3753807, -0.6478983, -3.449395, 0, 1, 0.09411765, 1,
-0.3747322, -0.3361768, -0.4898148, 0, 1, 0.1019608, 1,
-0.3718962, -0.4082994, -2.237058, 0, 1, 0.1058824, 1,
-0.3678842, -0.6228127, -2.492463, 0, 1, 0.1137255, 1,
-0.3620711, -0.08546609, -2.019267, 0, 1, 0.1176471, 1,
-0.3606424, 0.1520993, -1.882702, 0, 1, 0.1254902, 1,
-0.358786, -0.5919459, -1.91116, 0, 1, 0.1294118, 1,
-0.3515318, -0.3589965, -1.730263, 0, 1, 0.1372549, 1,
-0.3498133, -0.1345826, -2.16817, 0, 1, 0.1411765, 1,
-0.3456366, -0.1335763, 0.296615, 0, 1, 0.1490196, 1,
-0.3434096, 1.283275, -0.9134027, 0, 1, 0.1529412, 1,
-0.3401234, -1.664318, -2.555307, 0, 1, 0.1607843, 1,
-0.3354797, 0.461435, 1.085291, 0, 1, 0.1647059, 1,
-0.3320902, 0.2858399, -2.33477, 0, 1, 0.172549, 1,
-0.3300565, -0.2598662, -1.671997, 0, 1, 0.1764706, 1,
-0.327288, 0.9751076, -0.001446547, 0, 1, 0.1843137, 1,
-0.3259099, -1.234158, -4.464281, 0, 1, 0.1882353, 1,
-0.3252205, 0.8487582, -0.8486881, 0, 1, 0.1960784, 1,
-0.3230643, 0.01469377, -2.621936, 0, 1, 0.2039216, 1,
-0.32265, -0.7494797, -4.252532, 0, 1, 0.2078431, 1,
-0.3207678, 0.7756667, 0.5799496, 0, 1, 0.2156863, 1,
-0.3160433, -0.1959348, -1.167045, 0, 1, 0.2196078, 1,
-0.3155262, -0.2724552, -2.568743, 0, 1, 0.227451, 1,
-0.3150647, -0.6825914, -2.066125, 0, 1, 0.2313726, 1,
-0.3124349, 1.363732, 0.3829038, 0, 1, 0.2392157, 1,
-0.3037692, -0.9451995, -1.742796, 0, 1, 0.2431373, 1,
-0.3016641, 0.9701753, 2.828031, 0, 1, 0.2509804, 1,
-0.3015288, 0.2695571, -0.0311556, 0, 1, 0.254902, 1,
-0.2894896, 1.427318, -1.047851, 0, 1, 0.2627451, 1,
-0.2876737, -0.3092059, -3.353487, 0, 1, 0.2666667, 1,
-0.287407, 0.009326086, -0.8445733, 0, 1, 0.2745098, 1,
-0.2865269, 0.3204972, 0.6317587, 0, 1, 0.2784314, 1,
-0.284254, -1.317815, -1.744285, 0, 1, 0.2862745, 1,
-0.2829083, 1.129998, -0.2888864, 0, 1, 0.2901961, 1,
-0.2817942, 0.169583, -0.6091898, 0, 1, 0.2980392, 1,
-0.279706, -0.7703476, -4.373421, 0, 1, 0.3058824, 1,
-0.2769434, 0.860129, -0.4426983, 0, 1, 0.3098039, 1,
-0.2766915, -0.465032, -0.2537502, 0, 1, 0.3176471, 1,
-0.2744125, 0.9066247, -0.8853989, 0, 1, 0.3215686, 1,
-0.2730502, -1.223453, -3.28722, 0, 1, 0.3294118, 1,
-0.2669949, 1.099982, -1.107833, 0, 1, 0.3333333, 1,
-0.2668464, 0.03207438, -1.286756, 0, 1, 0.3411765, 1,
-0.2607925, -0.4770997, -2.813852, 0, 1, 0.345098, 1,
-0.2595335, -1.334983, -2.673829, 0, 1, 0.3529412, 1,
-0.2590148, 0.4684681, -1.68357, 0, 1, 0.3568628, 1,
-0.258677, 1.56999, -0.07754117, 0, 1, 0.3647059, 1,
-0.2582904, 0.3065974, -1.174326, 0, 1, 0.3686275, 1,
-0.2572208, -0.824061, -4.30836, 0, 1, 0.3764706, 1,
-0.2561731, 0.1070436, -2.319265, 0, 1, 0.3803922, 1,
-0.2539787, 1.174719, 1.005912, 0, 1, 0.3882353, 1,
-0.2530959, 0.8441612, -0.4059984, 0, 1, 0.3921569, 1,
-0.2502757, -0.9666396, -2.583863, 0, 1, 0.4, 1,
-0.2490547, -0.4301075, -1.432554, 0, 1, 0.4078431, 1,
-0.241154, -0.7152308, -3.989539, 0, 1, 0.4117647, 1,
-0.2406166, -1.069093, -2.3393, 0, 1, 0.4196078, 1,
-0.2386676, -1.444004, -2.891493, 0, 1, 0.4235294, 1,
-0.2341052, -1.476323, -4.417186, 0, 1, 0.4313726, 1,
-0.2313969, -0.1455684, -1.181462, 0, 1, 0.4352941, 1,
-0.2292669, -0.07852437, -3.200376, 0, 1, 0.4431373, 1,
-0.2264183, 0.9058576, 0.8250587, 0, 1, 0.4470588, 1,
-0.2224408, 1.596095, 0.3083908, 0, 1, 0.454902, 1,
-0.2213575, 0.7076187, -0.6665502, 0, 1, 0.4588235, 1,
-0.2189219, 1.099547, 0.2961122, 0, 1, 0.4666667, 1,
-0.2148361, -0.2680495, -1.727443, 0, 1, 0.4705882, 1,
-0.2097853, 0.9378312, -1.861174, 0, 1, 0.4784314, 1,
-0.2087476, -0.6947755, -1.894946, 0, 1, 0.4823529, 1,
-0.202135, -0.9937029, -2.88795, 0, 1, 0.4901961, 1,
-0.2018235, -1.208799, -5.305426, 0, 1, 0.4941176, 1,
-0.2013996, -1.233318, -3.030811, 0, 1, 0.5019608, 1,
-0.2012993, 0.737293, 0.1054862, 0, 1, 0.509804, 1,
-0.1995778, 0.3559673, -1.560546, 0, 1, 0.5137255, 1,
-0.1984144, -0.1874764, -2.660029, 0, 1, 0.5215687, 1,
-0.1947023, -0.5167686, -4.399291, 0, 1, 0.5254902, 1,
-0.1944781, 1.021828, 0.6563411, 0, 1, 0.5333334, 1,
-0.1936011, 0.08948171, -2.653761, 0, 1, 0.5372549, 1,
-0.1831298, 1.285581, -0.5656366, 0, 1, 0.5450981, 1,
-0.1817933, 0.4854018, 0.4728828, 0, 1, 0.5490196, 1,
-0.1810455, 0.5940067, -0.4252045, 0, 1, 0.5568628, 1,
-0.1804802, 0.9540405, 1.016785, 0, 1, 0.5607843, 1,
-0.1753221, 0.4441901, -0.546684, 0, 1, 0.5686275, 1,
-0.1695982, -0.189357, -2.355181, 0, 1, 0.572549, 1,
-0.1683588, -1.513256, -2.078492, 0, 1, 0.5803922, 1,
-0.1665059, 1.776346, -0.2714792, 0, 1, 0.5843138, 1,
-0.1636928, -1.942811, -3.551174, 0, 1, 0.5921569, 1,
-0.1588681, 0.2827252, -0.9858664, 0, 1, 0.5960785, 1,
-0.1494148, 1.287068, -0.4950185, 0, 1, 0.6039216, 1,
-0.148822, -1.072494, -3.740064, 0, 1, 0.6117647, 1,
-0.1466704, 0.3406077, -0.3983675, 0, 1, 0.6156863, 1,
-0.1448407, 2.709435, 0.7556683, 0, 1, 0.6235294, 1,
-0.1432706, 1.497445, -1.375495, 0, 1, 0.627451, 1,
-0.1426797, -0.5448745, -2.076709, 0, 1, 0.6352941, 1,
-0.1426346, 0.3900069, -2.131209, 0, 1, 0.6392157, 1,
-0.1408527, 0.3768047, 0.8255614, 0, 1, 0.6470588, 1,
-0.1389769, 2.490497, -0.1921131, 0, 1, 0.6509804, 1,
-0.1350243, -0.03436672, -2.362633, 0, 1, 0.6588235, 1,
-0.1311815, -1.141279, -4.28357, 0, 1, 0.6627451, 1,
-0.1255769, -1.118239, -3.520371, 0, 1, 0.6705883, 1,
-0.1218616, -0.9153279, -2.992506, 0, 1, 0.6745098, 1,
-0.1213202, -0.1080551, -2.082187, 0, 1, 0.682353, 1,
-0.1203909, 1.19759, -0.2250513, 0, 1, 0.6862745, 1,
-0.1197245, -1.931401, -4.746392, 0, 1, 0.6941177, 1,
-0.1126493, 0.7612981, -0.5041213, 0, 1, 0.7019608, 1,
-0.1109354, 0.8745835, 0.4728319, 0, 1, 0.7058824, 1,
-0.1104685, -0.1585931, -1.075447, 0, 1, 0.7137255, 1,
-0.09765945, 0.1223954, -1.391321, 0, 1, 0.7176471, 1,
-0.09756313, 0.5059586, -0.1130149, 0, 1, 0.7254902, 1,
-0.09565093, 1.874603, 0.7908977, 0, 1, 0.7294118, 1,
-0.09516208, -1.495979, -3.341606, 0, 1, 0.7372549, 1,
-0.09455483, -0.703977, -2.176808, 0, 1, 0.7411765, 1,
-0.09452298, -0.9175315, -2.647472, 0, 1, 0.7490196, 1,
-0.09390352, -0.6960883, -2.436207, 0, 1, 0.7529412, 1,
-0.08523405, 1.845437, 1.210693, 0, 1, 0.7607843, 1,
-0.08438836, 0.3326067, 0.3345293, 0, 1, 0.7647059, 1,
-0.08375365, -1.553653, -2.110823, 0, 1, 0.772549, 1,
-0.07858758, -0.1436024, -2.06705, 0, 1, 0.7764706, 1,
-0.07816764, -2.826073, -3.846774, 0, 1, 0.7843137, 1,
-0.07656974, 0.06008943, -0.8305179, 0, 1, 0.7882353, 1,
-0.06718722, -0.4922252, -2.595512, 0, 1, 0.7960784, 1,
-0.06559499, -1.118829, -3.217974, 0, 1, 0.8039216, 1,
-0.06553046, 0.8869581, 0.4553106, 0, 1, 0.8078431, 1,
-0.0651933, 1.218517, 0.3521188, 0, 1, 0.8156863, 1,
-0.06373672, 1.301137, -2.352436, 0, 1, 0.8196079, 1,
-0.0614705, -1.021742, -4.083953, 0, 1, 0.827451, 1,
-0.06005371, -0.2032052, -2.532474, 0, 1, 0.8313726, 1,
-0.0598319, -0.6824343, -2.709351, 0, 1, 0.8392157, 1,
-0.05735221, 0.5440426, -0.777131, 0, 1, 0.8431373, 1,
-0.05733249, 0.6956109, -1.204884, 0, 1, 0.8509804, 1,
-0.05709082, -0.498033, -2.359012, 0, 1, 0.854902, 1,
-0.05587714, -0.155133, -2.706264, 0, 1, 0.8627451, 1,
-0.05547066, -1.613191, -4.247568, 0, 1, 0.8666667, 1,
-0.05437991, 0.448524, 0.3968545, 0, 1, 0.8745098, 1,
-0.05094209, -0.5646383, -3.136023, 0, 1, 0.8784314, 1,
-0.04313, -1.518296, -1.492365, 0, 1, 0.8862745, 1,
-0.04291211, -1.156067, -4.214072, 0, 1, 0.8901961, 1,
-0.04133122, -0.1289432, -2.333144, 0, 1, 0.8980392, 1,
-0.04028654, 0.5907607, 0.846085, 0, 1, 0.9058824, 1,
-0.0365892, -1.127624, -6.512374, 0, 1, 0.9098039, 1,
-0.03589913, 0.2424646, -2.094742, 0, 1, 0.9176471, 1,
-0.03519783, -0.5900173, -3.187603, 0, 1, 0.9215686, 1,
-0.03413642, -2.00529, -3.597579, 0, 1, 0.9294118, 1,
-0.03254522, -0.1905191, -2.537994, 0, 1, 0.9333333, 1,
-0.03103715, 0.6327936, -1.838959, 0, 1, 0.9411765, 1,
-0.03067927, -2.075606, -2.70325, 0, 1, 0.945098, 1,
-0.02943949, -0.6143384, -3.146771, 0, 1, 0.9529412, 1,
-0.02838007, 1.321392, 0.3522348, 0, 1, 0.9568627, 1,
-0.02436428, -0.4281052, -3.799372, 0, 1, 0.9647059, 1,
-0.02046262, -1.779588, -3.402053, 0, 1, 0.9686275, 1,
-0.01869304, -1.349904, -3.613173, 0, 1, 0.9764706, 1,
-0.01037573, -1.768563, -2.1387, 0, 1, 0.9803922, 1,
-0.00915889, 0.3467433, -0.09718527, 0, 1, 0.9882353, 1,
-0.00833689, 0.1358175, 0.01059015, 0, 1, 0.9921569, 1,
-0.006436288, 0.8611095, -2.173318, 0, 1, 1, 1,
-0.003883632, -0.1045131, -1.601055, 0, 0.9921569, 1, 1,
-0.001762182, 1.064471, 0.683486, 0, 0.9882353, 1, 1,
-0.001719745, -0.6141097, -4.259305, 0, 0.9803922, 1, 1,
0.007476896, -1.869397, 3.269588, 0, 0.9764706, 1, 1,
0.01241935, -0.0437878, 4.447264, 0, 0.9686275, 1, 1,
0.01491032, -0.5410846, 3.625584, 0, 0.9647059, 1, 1,
0.01523182, 0.4943405, -1.951089, 0, 0.9568627, 1, 1,
0.0186359, 0.5585591, -2.240179, 0, 0.9529412, 1, 1,
0.02262078, -2.592979, 1.409996, 0, 0.945098, 1, 1,
0.02305225, 0.5477163, -0.8299614, 0, 0.9411765, 1, 1,
0.02323416, 1.670023, 1.198718, 0, 0.9333333, 1, 1,
0.02376217, 1.120625, -1.106392, 0, 0.9294118, 1, 1,
0.02411089, 1.527765, -1.092238, 0, 0.9215686, 1, 1,
0.02596448, -0.8826279, 4.863989, 0, 0.9176471, 1, 1,
0.02633885, 0.1510492, 1.479315, 0, 0.9098039, 1, 1,
0.02815654, 0.1566317, 0.6985346, 0, 0.9058824, 1, 1,
0.02895448, -0.7322163, 3.519393, 0, 0.8980392, 1, 1,
0.02965683, 0.2538496, 0.2114695, 0, 0.8901961, 1, 1,
0.0319403, -1.44102, 3.972815, 0, 0.8862745, 1, 1,
0.0363919, 0.09361213, 1.712172, 0, 0.8784314, 1, 1,
0.03704757, 0.9677892, -1.64007, 0, 0.8745098, 1, 1,
0.03908939, 2.746903, 0.3998844, 0, 0.8666667, 1, 1,
0.03925833, -0.04065558, 2.973698, 0, 0.8627451, 1, 1,
0.03968861, -0.06244645, 2.224694, 0, 0.854902, 1, 1,
0.03972413, -0.5011492, 4.258621, 0, 0.8509804, 1, 1,
0.04067562, -0.2969341, 2.894288, 0, 0.8431373, 1, 1,
0.04134924, -1.224825, 4.302181, 0, 0.8392157, 1, 1,
0.0414641, 0.824147, 0.4033584, 0, 0.8313726, 1, 1,
0.04826805, 0.8135411, 0.5250118, 0, 0.827451, 1, 1,
0.05265877, 1.725525, -1.440372, 0, 0.8196079, 1, 1,
0.05463723, 0.211576, -0.9284269, 0, 0.8156863, 1, 1,
0.05674708, -2.056531, 4.458575, 0, 0.8078431, 1, 1,
0.05840736, 1.275437, -0.2131951, 0, 0.8039216, 1, 1,
0.06187327, 0.02247906, 3.15587, 0, 0.7960784, 1, 1,
0.06382016, 0.6105614, 0.5849935, 0, 0.7882353, 1, 1,
0.07088909, 1.091807, 0.6352075, 0, 0.7843137, 1, 1,
0.08019577, 0.5217042, -0.2981729, 0, 0.7764706, 1, 1,
0.08042342, 2.067504, -0.2344721, 0, 0.772549, 1, 1,
0.08399406, 2.343437, 0.258955, 0, 0.7647059, 1, 1,
0.08564975, -1.567938, 3.197179, 0, 0.7607843, 1, 1,
0.08769587, -0.3279686, 5.339216, 0, 0.7529412, 1, 1,
0.08938448, -0.1523726, 3.657718, 0, 0.7490196, 1, 1,
0.09225336, -0.2388142, 0.3100846, 0, 0.7411765, 1, 1,
0.09714286, 2.120873, 0.2061309, 0, 0.7372549, 1, 1,
0.09788541, 0.2067812, -0.2586013, 0, 0.7294118, 1, 1,
0.09834082, -1.355845, 3.629119, 0, 0.7254902, 1, 1,
0.09862877, -0.03133819, 2.915039, 0, 0.7176471, 1, 1,
0.1001323, -1.426795, 1.786379, 0, 0.7137255, 1, 1,
0.1085688, 3.239042, -0.5689214, 0, 0.7058824, 1, 1,
0.1089856, 0.5358062, -0.715993, 0, 0.6980392, 1, 1,
0.1124231, -0.9759028, 4.678611, 0, 0.6941177, 1, 1,
0.1188795, -1.924061, 1.220104, 0, 0.6862745, 1, 1,
0.1230509, 1.727614, 0.2740581, 0, 0.682353, 1, 1,
0.1243018, 1.797787, 1.025017, 0, 0.6745098, 1, 1,
0.1259227, 0.1924356, 0.7494211, 0, 0.6705883, 1, 1,
0.1316451, -0.1198773, 2.028144, 0, 0.6627451, 1, 1,
0.1332984, 0.662864, -0.09895688, 0, 0.6588235, 1, 1,
0.1338221, -0.3948999, 2.764447, 0, 0.6509804, 1, 1,
0.1398697, -0.2542928, 3.259618, 0, 0.6470588, 1, 1,
0.140634, -1.465171, 3.281875, 0, 0.6392157, 1, 1,
0.141624, -0.3226749, 2.985791, 0, 0.6352941, 1, 1,
0.1465498, -0.6960746, 4.095618, 0, 0.627451, 1, 1,
0.1466396, -0.1982372, 1.5195, 0, 0.6235294, 1, 1,
0.1469171, -0.5960088, 2.391263, 0, 0.6156863, 1, 1,
0.1472435, -0.07599829, 1.496829, 0, 0.6117647, 1, 1,
0.1572455, -0.3435644, 4.298798, 0, 0.6039216, 1, 1,
0.158186, -0.2440552, 2.662895, 0, 0.5960785, 1, 1,
0.1586955, -0.8544008, 1.753711, 0, 0.5921569, 1, 1,
0.1600002, -1.441144, 2.360668, 0, 0.5843138, 1, 1,
0.1601308, -0.7105388, 3.64423, 0, 0.5803922, 1, 1,
0.1631673, -0.06303471, 1.950263, 0, 0.572549, 1, 1,
0.1687067, 0.8818196, -0.359019, 0, 0.5686275, 1, 1,
0.1690441, 0.9095207, -0.8356406, 0, 0.5607843, 1, 1,
0.1713908, -0.06589963, 1.479436, 0, 0.5568628, 1, 1,
0.1728161, 0.7652466, 0.2671306, 0, 0.5490196, 1, 1,
0.174039, 1.123854, 0.2456947, 0, 0.5450981, 1, 1,
0.1765009, -0.08217764, 0.9429373, 0, 0.5372549, 1, 1,
0.1838465, -1.273232, 3.463376, 0, 0.5333334, 1, 1,
0.1877556, -0.3535526, 1.989599, 0, 0.5254902, 1, 1,
0.1936669, 1.202497, -0.3147999, 0, 0.5215687, 1, 1,
0.1937483, -0.6000957, 3.505439, 0, 0.5137255, 1, 1,
0.1957747, -0.7529125, 3.349888, 0, 0.509804, 1, 1,
0.1992648, -0.6211405, 1.800448, 0, 0.5019608, 1, 1,
0.2013717, -0.6994635, 3.705088, 0, 0.4941176, 1, 1,
0.2017739, -0.5045337, 2.426665, 0, 0.4901961, 1, 1,
0.2020587, 1.663738, 0.7519749, 0, 0.4823529, 1, 1,
0.2026205, -0.1502201, 1.595005, 0, 0.4784314, 1, 1,
0.2035663, 1.349943, 0.3407415, 0, 0.4705882, 1, 1,
0.2046519, 1.881176, -1.783511, 0, 0.4666667, 1, 1,
0.2099207, 0.7205363, 1.375741, 0, 0.4588235, 1, 1,
0.2188954, 0.2828971, 0.9502885, 0, 0.454902, 1, 1,
0.2191256, 0.4974692, 0.1873624, 0, 0.4470588, 1, 1,
0.220837, 0.09712482, 1.58821, 0, 0.4431373, 1, 1,
0.2236302, 1.965956, -1.361723, 0, 0.4352941, 1, 1,
0.2236435, -0.841672, 1.862772, 0, 0.4313726, 1, 1,
0.2249841, -0.03526439, 1.02283, 0, 0.4235294, 1, 1,
0.227754, -0.8379467, 3.661048, 0, 0.4196078, 1, 1,
0.2284629, -0.5588934, 2.389324, 0, 0.4117647, 1, 1,
0.2332255, 0.5719587, 0.499244, 0, 0.4078431, 1, 1,
0.2347483, -0.5798934, 2.110682, 0, 0.4, 1, 1,
0.2396851, 0.2218106, 0.8996119, 0, 0.3921569, 1, 1,
0.2409573, -0.3946722, 2.007718, 0, 0.3882353, 1, 1,
0.2427365, 0.3163092, 1.418402, 0, 0.3803922, 1, 1,
0.2432291, 1.283071, 0.4341848, 0, 0.3764706, 1, 1,
0.2450609, 0.4378874, 1.551256, 0, 0.3686275, 1, 1,
0.2451883, -0.0799479, 1.695514, 0, 0.3647059, 1, 1,
0.2453309, 0.2952772, 1.262031, 0, 0.3568628, 1, 1,
0.250498, 0.0897043, 2.35353, 0, 0.3529412, 1, 1,
0.2507083, 0.3786121, 0.8849602, 0, 0.345098, 1, 1,
0.2565027, 1.423027, -0.6090368, 0, 0.3411765, 1, 1,
0.2599958, -0.4418782, 2.537863, 0, 0.3333333, 1, 1,
0.2609671, -0.3432276, 0.9426365, 0, 0.3294118, 1, 1,
0.2631261, 0.8712181, 1.644734, 0, 0.3215686, 1, 1,
0.2639472, 0.2743935, 1.228099, 0, 0.3176471, 1, 1,
0.2698489, -0.8363256, 2.799414, 0, 0.3098039, 1, 1,
0.2702794, 0.3010571, 3.045985, 0, 0.3058824, 1, 1,
0.2720706, -0.1063977, 0.9022726, 0, 0.2980392, 1, 1,
0.2744999, 1.191305, -0.1353819, 0, 0.2901961, 1, 1,
0.2746885, 0.7724429, -0.8027672, 0, 0.2862745, 1, 1,
0.2907536, 1.777396, 0.6390919, 0, 0.2784314, 1, 1,
0.2918217, 1.189656, -0.7932395, 0, 0.2745098, 1, 1,
0.2928955, -0.3546804, 1.740603, 0, 0.2666667, 1, 1,
0.2936509, 1.455747, 0.9043683, 0, 0.2627451, 1, 1,
0.2942592, -1.457208, 2.785899, 0, 0.254902, 1, 1,
0.2943161, -0.6201077, 1.919891, 0, 0.2509804, 1, 1,
0.2965611, 0.1727001, -0.05696746, 0, 0.2431373, 1, 1,
0.296837, 0.4130937, -0.1249675, 0, 0.2392157, 1, 1,
0.2977107, 0.9732992, -0.3730832, 0, 0.2313726, 1, 1,
0.2979461, -1.057277, 2.415505, 0, 0.227451, 1, 1,
0.2989755, 1.197335, 0.7813684, 0, 0.2196078, 1, 1,
0.3015774, -1.130342, 2.834478, 0, 0.2156863, 1, 1,
0.3025563, 0.03029021, 1.298341, 0, 0.2078431, 1, 1,
0.3094244, -1.893268, 3.788739, 0, 0.2039216, 1, 1,
0.3105125, -1.091815, 4.411684, 0, 0.1960784, 1, 1,
0.3148549, 1.36368, 0.210942, 0, 0.1882353, 1, 1,
0.3173926, 1.088842, -0.1224862, 0, 0.1843137, 1, 1,
0.3221573, -0.03523631, 2.379706, 0, 0.1764706, 1, 1,
0.3291867, 0.4411222, 1.773488, 0, 0.172549, 1, 1,
0.3297553, -0.3196945, 0.7030643, 0, 0.1647059, 1, 1,
0.3315572, 0.2876547, 0.8929181, 0, 0.1607843, 1, 1,
0.3332759, 1.586317, 0.002216683, 0, 0.1529412, 1, 1,
0.3354715, 0.2828928, 3.196104, 0, 0.1490196, 1, 1,
0.3402535, 1.000865, 0.496762, 0, 0.1411765, 1, 1,
0.3427574, -1.645381, 1.465737, 0, 0.1372549, 1, 1,
0.348195, 2.037274, 1.571085, 0, 0.1294118, 1, 1,
0.3598418, 0.6312592, 0.4248626, 0, 0.1254902, 1, 1,
0.3630938, 0.1713602, 1.672043, 0, 0.1176471, 1, 1,
0.3639784, -0.5784969, 2.815426, 0, 0.1137255, 1, 1,
0.3654518, -0.4175212, 2.381394, 0, 0.1058824, 1, 1,
0.3663185, 1.015363, 1.001855, 0, 0.09803922, 1, 1,
0.367808, -0.4334688, 2.02731, 0, 0.09411765, 1, 1,
0.3682175, 0.07253885, 2.487989, 0, 0.08627451, 1, 1,
0.3775768, -0.8308784, 1.808352, 0, 0.08235294, 1, 1,
0.3800825, 0.6205065, 0.6554168, 0, 0.07450981, 1, 1,
0.3830065, 0.7211781, -0.1818918, 0, 0.07058824, 1, 1,
0.3830253, -0.1158737, 2.347803, 0, 0.0627451, 1, 1,
0.3875003, 1.266755, 2.767709, 0, 0.05882353, 1, 1,
0.3921371, 0.2334016, 1.514357, 0, 0.05098039, 1, 1,
0.3950664, -0.6143262, 2.653993, 0, 0.04705882, 1, 1,
0.3970314, -0.1462328, 0.7357466, 0, 0.03921569, 1, 1,
0.3981925, 0.8263066, 3.070074, 0, 0.03529412, 1, 1,
0.400822, -0.7598122, 2.249368, 0, 0.02745098, 1, 1,
0.4019755, 0.1555307, 0.9468617, 0, 0.02352941, 1, 1,
0.4056527, -0.6032115, 3.581333, 0, 0.01568628, 1, 1,
0.4092203, 0.1717759, 0.7532689, 0, 0.01176471, 1, 1,
0.4096164, 2.36843, 8.631831e-05, 0, 0.003921569, 1, 1,
0.4160058, 1.010186, 1.214101, 0.003921569, 0, 1, 1,
0.4245919, -0.6292107, 5.113527, 0.007843138, 0, 1, 1,
0.4248329, 0.514107, 0.3197646, 0.01568628, 0, 1, 1,
0.4251256, -0.2166589, 2.775637, 0.01960784, 0, 1, 1,
0.4260656, 1.379264, 0.9581947, 0.02745098, 0, 1, 1,
0.4281648, 1.410751, -0.3163342, 0.03137255, 0, 1, 1,
0.4460817, 0.6298178, 0.02456375, 0.03921569, 0, 1, 1,
0.4484766, -0.4155091, 3.289011, 0.04313726, 0, 1, 1,
0.452467, 0.05193658, 1.461275, 0.05098039, 0, 1, 1,
0.4543036, -1.259132, 2.626672, 0.05490196, 0, 1, 1,
0.4563034, 1.957551, -1.067864, 0.0627451, 0, 1, 1,
0.4566382, 1.737744, 1.092055, 0.06666667, 0, 1, 1,
0.4576299, -0.420245, 1.260209, 0.07450981, 0, 1, 1,
0.4637529, 0.5558386, -0.1412082, 0.07843138, 0, 1, 1,
0.4638322, 0.1283296, 0.03586217, 0.08627451, 0, 1, 1,
0.4724132, -0.6263773, 3.037153, 0.09019608, 0, 1, 1,
0.4819746, -0.5724912, 2.013337, 0.09803922, 0, 1, 1,
0.4821025, -0.5623082, 3.034068, 0.1058824, 0, 1, 1,
0.486036, 0.3090247, 2.884561, 0.1098039, 0, 1, 1,
0.4867649, 0.7825745, 0.6896689, 0.1176471, 0, 1, 1,
0.4883828, 0.9373683, 0.4207375, 0.1215686, 0, 1, 1,
0.4934345, -0.174551, 2.707941, 0.1294118, 0, 1, 1,
0.5012913, 0.1717789, 0.9733394, 0.1333333, 0, 1, 1,
0.5066438, -0.619388, 1.808495, 0.1411765, 0, 1, 1,
0.5077741, -0.1267375, 3.048732, 0.145098, 0, 1, 1,
0.5171025, -1.127148, 3.98749, 0.1529412, 0, 1, 1,
0.5192626, 2.036489, 0.297867, 0.1568628, 0, 1, 1,
0.5238559, -1.385505, 3.484366, 0.1647059, 0, 1, 1,
0.5257457, -0.1205333, 1.962277, 0.1686275, 0, 1, 1,
0.5270203, -1.044505, 2.412421, 0.1764706, 0, 1, 1,
0.5296147, 0.7413346, 0.8659633, 0.1803922, 0, 1, 1,
0.5316449, 0.1870716, 0.8241365, 0.1882353, 0, 1, 1,
0.5363464, -0.8067684, 3.524459, 0.1921569, 0, 1, 1,
0.5472151, -0.4468324, 1.079267, 0.2, 0, 1, 1,
0.5498959, 1.813244, 0.4780014, 0.2078431, 0, 1, 1,
0.5543823, -1.251319, 3.952281, 0.2117647, 0, 1, 1,
0.5579895, 0.154899, 2.227762, 0.2196078, 0, 1, 1,
0.5585554, 0.5458968, 0.1840028, 0.2235294, 0, 1, 1,
0.559964, -1.185446, 4.182061, 0.2313726, 0, 1, 1,
0.5609693, 0.5962048, -0.9060073, 0.2352941, 0, 1, 1,
0.5647653, -0.06771516, 1.318536, 0.2431373, 0, 1, 1,
0.5679874, 0.5126773, -0.05958595, 0.2470588, 0, 1, 1,
0.5708426, -0.5628523, 1.784296, 0.254902, 0, 1, 1,
0.5774767, 0.01403415, 2.975036, 0.2588235, 0, 1, 1,
0.581616, -0.3752399, 2.54553, 0.2666667, 0, 1, 1,
0.5834349, -0.2140892, 2.758517, 0.2705882, 0, 1, 1,
0.5838974, 1.549326, 0.3874247, 0.2784314, 0, 1, 1,
0.5849401, -0.4019315, 0.8933916, 0.282353, 0, 1, 1,
0.5988786, -0.02674456, 1.836389, 0.2901961, 0, 1, 1,
0.6025788, -2.14592, 1.936931, 0.2941177, 0, 1, 1,
0.6041155, 0.793426, -1.417645, 0.3019608, 0, 1, 1,
0.604295, -1.13302, 1.636912, 0.3098039, 0, 1, 1,
0.6050896, 0.1680107, 3.273976, 0.3137255, 0, 1, 1,
0.6132175, 1.231406, -0.551343, 0.3215686, 0, 1, 1,
0.6140769, -1.148121, 2.648879, 0.3254902, 0, 1, 1,
0.615482, -0.2385181, 3.342233, 0.3333333, 0, 1, 1,
0.6216893, 0.1328645, 1.522923, 0.3372549, 0, 1, 1,
0.6224961, 0.2233391, 2.312722, 0.345098, 0, 1, 1,
0.625282, -1.256308, 1.534433, 0.3490196, 0, 1, 1,
0.6259176, -0.681156, 2.690027, 0.3568628, 0, 1, 1,
0.626941, 1.535746, 1.018895, 0.3607843, 0, 1, 1,
0.6300281, 1.256878, 1.021475, 0.3686275, 0, 1, 1,
0.6306897, 1.936299, 0.4984096, 0.372549, 0, 1, 1,
0.6341712, -0.604624, 4.243898, 0.3803922, 0, 1, 1,
0.6347172, -0.02545243, -0.4004563, 0.3843137, 0, 1, 1,
0.6471283, 0.3054167, 1.731514, 0.3921569, 0, 1, 1,
0.6544564, 0.4039164, 0.6691095, 0.3960784, 0, 1, 1,
0.6556994, 0.1435066, 1.793414, 0.4039216, 0, 1, 1,
0.6575829, -0.3443218, 2.021766, 0.4117647, 0, 1, 1,
0.6579177, 0.3949661, 1.297851, 0.4156863, 0, 1, 1,
0.6592772, 0.9520613, 1.007371, 0.4235294, 0, 1, 1,
0.6638827, -0.7916526, 2.040173, 0.427451, 0, 1, 1,
0.6728243, -2.337416, 2.893383, 0.4352941, 0, 1, 1,
0.6728529, -0.3945271, 1.799797, 0.4392157, 0, 1, 1,
0.6751873, 0.04553167, 2.724067, 0.4470588, 0, 1, 1,
0.6783448, 0.122669, 2.749743, 0.4509804, 0, 1, 1,
0.6825721, -0.1122681, 1.043821, 0.4588235, 0, 1, 1,
0.6833729, -0.4847009, 2.497045, 0.4627451, 0, 1, 1,
0.685694, 0.3463575, 2.258941, 0.4705882, 0, 1, 1,
0.6931074, 0.3130513, 1.910036, 0.4745098, 0, 1, 1,
0.6951247, -0.9002296, 2.254354, 0.4823529, 0, 1, 1,
0.695527, -0.3407534, 2.335073, 0.4862745, 0, 1, 1,
0.6990325, -0.112412, 1.12903, 0.4941176, 0, 1, 1,
0.6993153, 1.138376, 1.018911, 0.5019608, 0, 1, 1,
0.6995796, -0.03876384, 2.118064, 0.5058824, 0, 1, 1,
0.7006273, -1.296939, 3.134522, 0.5137255, 0, 1, 1,
0.703586, 0.2584409, 2.653526, 0.5176471, 0, 1, 1,
0.710622, 0.06645977, 2.153568, 0.5254902, 0, 1, 1,
0.7114987, 0.6018955, 1.017763, 0.5294118, 0, 1, 1,
0.713361, -0.02257234, 3.318847, 0.5372549, 0, 1, 1,
0.7135947, -1.635558, 2.203099, 0.5411765, 0, 1, 1,
0.7149494, 1.592025, 0.9855141, 0.5490196, 0, 1, 1,
0.7164856, 0.8132248, 1.29821, 0.5529412, 0, 1, 1,
0.7174189, -0.06904782, 0.2744495, 0.5607843, 0, 1, 1,
0.7213385, -0.06233935, 0.7277075, 0.5647059, 0, 1, 1,
0.7239491, -0.4900769, 1.968166, 0.572549, 0, 1, 1,
0.7322814, -0.3860645, 1.45418, 0.5764706, 0, 1, 1,
0.7323769, 0.938814, 0.1447616, 0.5843138, 0, 1, 1,
0.7372659, -0.1709818, 1.340218, 0.5882353, 0, 1, 1,
0.7392784, -0.8499153, 1.883236, 0.5960785, 0, 1, 1,
0.743634, 0.06998349, 2.433624, 0.6039216, 0, 1, 1,
0.7455488, -0.3517919, 2.468692, 0.6078432, 0, 1, 1,
0.7493866, 0.7012024, 1.607057, 0.6156863, 0, 1, 1,
0.7508656, 0.05481855, 1.5213, 0.6196079, 0, 1, 1,
0.7513103, -0.5764359, 1.977275, 0.627451, 0, 1, 1,
0.7543413, 1.816216, 0.7965819, 0.6313726, 0, 1, 1,
0.7545844, 0.07525537, -0.3815644, 0.6392157, 0, 1, 1,
0.7558305, -0.4566546, 2.085117, 0.6431373, 0, 1, 1,
0.757942, -1.192192, 1.860589, 0.6509804, 0, 1, 1,
0.7637328, -0.7763578, 1.044363, 0.654902, 0, 1, 1,
0.7799683, 0.6055101, -0.05510918, 0.6627451, 0, 1, 1,
0.7958734, 0.8092946, -0.494035, 0.6666667, 0, 1, 1,
0.7958896, 2.189535, 0.2614168, 0.6745098, 0, 1, 1,
0.7959921, -1.185701, 3.203005, 0.6784314, 0, 1, 1,
0.7982906, -0.2745535, 2.497914, 0.6862745, 0, 1, 1,
0.7985596, -2.315002, 2.473874, 0.6901961, 0, 1, 1,
0.8107204, -0.05672191, 2.009958, 0.6980392, 0, 1, 1,
0.8184664, -0.1157717, 3.497106, 0.7058824, 0, 1, 1,
0.8239681, -1.284494, 2.146374, 0.7098039, 0, 1, 1,
0.8307926, -0.4183326, 2.650312, 0.7176471, 0, 1, 1,
0.8390669, 0.4788534, 0.8727435, 0.7215686, 0, 1, 1,
0.8490997, 0.5398518, -0.04123967, 0.7294118, 0, 1, 1,
0.8496305, 0.3745477, 2.682418, 0.7333333, 0, 1, 1,
0.8519716, -0.1599738, -0.6372488, 0.7411765, 0, 1, 1,
0.8525257, -1.246507, 0.8955144, 0.7450981, 0, 1, 1,
0.8561858, 0.9600677, 2.190878, 0.7529412, 0, 1, 1,
0.8582796, -0.6593603, 1.470406, 0.7568628, 0, 1, 1,
0.8595045, 1.254707, -0.473435, 0.7647059, 0, 1, 1,
0.8629974, 1.159469, -0.0148638, 0.7686275, 0, 1, 1,
0.8630307, 0.1033771, 1.433362, 0.7764706, 0, 1, 1,
0.8684392, 0.04815285, 3.265135, 0.7803922, 0, 1, 1,
0.8699886, -1.484297, 2.36878, 0.7882353, 0, 1, 1,
0.872488, -0.5791884, 3.187859, 0.7921569, 0, 1, 1,
0.8736547, 1.506284, -0.3755515, 0.8, 0, 1, 1,
0.877553, -1.878229, 1.844412, 0.8078431, 0, 1, 1,
0.879985, 1.508562, 2.25398, 0.8117647, 0, 1, 1,
0.8842052, -0.241167, 2.782566, 0.8196079, 0, 1, 1,
0.8893138, -0.4278397, 2.464202, 0.8235294, 0, 1, 1,
0.8900381, -0.03048449, 1.338382, 0.8313726, 0, 1, 1,
0.8983847, -0.0057256, 1.13261, 0.8352941, 0, 1, 1,
0.8999295, -0.9565113, 2.299796, 0.8431373, 0, 1, 1,
0.9001281, -0.8339574, 2.313553, 0.8470588, 0, 1, 1,
0.9001492, -0.7172018, 2.780299, 0.854902, 0, 1, 1,
0.9004187, -2.21692, 2.240836, 0.8588235, 0, 1, 1,
0.9097878, -1.138811, 1.863055, 0.8666667, 0, 1, 1,
0.911129, 1.41572, 1.137872, 0.8705882, 0, 1, 1,
0.913168, -0.2514418, 2.614246, 0.8784314, 0, 1, 1,
0.9148301, 0.8836425, 2.502543, 0.8823529, 0, 1, 1,
0.9164581, -0.6527513, 3.004207, 0.8901961, 0, 1, 1,
0.9205441, -0.06443592, 1.03872, 0.8941177, 0, 1, 1,
0.9216877, -0.7692183, 2.230521, 0.9019608, 0, 1, 1,
0.9256499, 0.4585505, 0.4105684, 0.9098039, 0, 1, 1,
0.929126, -0.2700541, 1.459448, 0.9137255, 0, 1, 1,
0.9323448, -2.120899, 0.8022867, 0.9215686, 0, 1, 1,
0.9379142, -0.371931, 2.330804, 0.9254902, 0, 1, 1,
0.9397873, 0.621777, -0.1473475, 0.9333333, 0, 1, 1,
0.9447659, -0.4153365, 2.456919, 0.9372549, 0, 1, 1,
0.946477, 0.5845755, 1.236486, 0.945098, 0, 1, 1,
0.9545116, 0.4128943, 1.498797, 0.9490196, 0, 1, 1,
0.967176, -0.1077229, 2.369667, 0.9568627, 0, 1, 1,
0.9737558, 1.027722, 1.153099, 0.9607843, 0, 1, 1,
0.9761731, -0.398937, 1.784968, 0.9686275, 0, 1, 1,
0.9771371, -2.244843, 3.021603, 0.972549, 0, 1, 1,
0.9810714, -1.501713, 2.349467, 0.9803922, 0, 1, 1,
0.9831631, 1.057282, 0.8672891, 0.9843137, 0, 1, 1,
0.983265, 0.2928304, 0.6129703, 0.9921569, 0, 1, 1,
0.9863391, 1.278551, 1.381752, 0.9960784, 0, 1, 1,
0.9867183, -0.2824124, 0.7148293, 1, 0, 0.9960784, 1,
0.9924339, 0.7400976, 2.391595, 1, 0, 0.9882353, 1,
1.001006, 0.01371816, 2.437926, 1, 0, 0.9843137, 1,
1.002247, 0.584989, 1.015644, 1, 0, 0.9764706, 1,
1.003635, 0.9583886, 1.146192, 1, 0, 0.972549, 1,
1.01567, 1.970851, 0.7653262, 1, 0, 0.9647059, 1,
1.021683, 1.093805, 0.331758, 1, 0, 0.9607843, 1,
1.027753, -1.499793, 2.292669, 1, 0, 0.9529412, 1,
1.027845, -0.4144199, 3.171809, 1, 0, 0.9490196, 1,
1.032511, 1.43895, 0.2313503, 1, 0, 0.9411765, 1,
1.035952, 0.03851581, 0.8129948, 1, 0, 0.9372549, 1,
1.039267, 0.7641844, 0.3357817, 1, 0, 0.9294118, 1,
1.040696, 1.593951, 0.1058349, 1, 0, 0.9254902, 1,
1.050074, -0.1991388, 1.59316, 1, 0, 0.9176471, 1,
1.054058, -1.490835, 3.691549, 1, 0, 0.9137255, 1,
1.062317, -0.3192227, 1.616852, 1, 0, 0.9058824, 1,
1.065537, -0.198879, 1.981708, 1, 0, 0.9019608, 1,
1.065954, 1.132064, 0.3256596, 1, 0, 0.8941177, 1,
1.073229, 0.2258583, 0.8480307, 1, 0, 0.8862745, 1,
1.075431, -0.3334776, 1.431289, 1, 0, 0.8823529, 1,
1.083258, 0.06444327, 2.255469, 1, 0, 0.8745098, 1,
1.084162, -1.363631, 2.360293, 1, 0, 0.8705882, 1,
1.097687, 1.541495, 2.692467, 1, 0, 0.8627451, 1,
1.103109, 0.4666739, 0.6220124, 1, 0, 0.8588235, 1,
1.104108, 1.63145, 1.164179, 1, 0, 0.8509804, 1,
1.104137, -1.371019, 2.709535, 1, 0, 0.8470588, 1,
1.116176, -0.9041197, 2.397115, 1, 0, 0.8392157, 1,
1.116447, -0.3845681, 4.345842, 1, 0, 0.8352941, 1,
1.117851, 0.6232106, 0.6747876, 1, 0, 0.827451, 1,
1.11903, -0.8563128, 1.495613, 1, 0, 0.8235294, 1,
1.121201, -0.08328836, 2.850277, 1, 0, 0.8156863, 1,
1.121677, -0.9793846, 1.861727, 1, 0, 0.8117647, 1,
1.128165, -1.187242, 2.184265, 1, 0, 0.8039216, 1,
1.129358, 1.189292, 1.153074, 1, 0, 0.7960784, 1,
1.130414, 0.7215445, 2.440472, 1, 0, 0.7921569, 1,
1.134011, -2.10845, 3.441726, 1, 0, 0.7843137, 1,
1.140118, 0.4880542, 0.3146309, 1, 0, 0.7803922, 1,
1.143321, -0.6191089, 1.33374, 1, 0, 0.772549, 1,
1.15024, 1.753469, -0.1052763, 1, 0, 0.7686275, 1,
1.151824, -0.6516448, 1.958474, 1, 0, 0.7607843, 1,
1.156815, -0.1017562, 2.493248, 1, 0, 0.7568628, 1,
1.158377, 0.7251046, 0.5286239, 1, 0, 0.7490196, 1,
1.160911, -0.7580419, 3.421343, 1, 0, 0.7450981, 1,
1.166268, 0.8366044, 0.9762385, 1, 0, 0.7372549, 1,
1.168503, -0.2949108, 2.260849, 1, 0, 0.7333333, 1,
1.17327, -0.3366278, 2.908803, 1, 0, 0.7254902, 1,
1.185518, -2.157855, 1.363935, 1, 0, 0.7215686, 1,
1.196302, -0.1647228, 0.7541489, 1, 0, 0.7137255, 1,
1.197336, 0.1552737, -0.1583569, 1, 0, 0.7098039, 1,
1.199562, 1.810155, 0.2514703, 1, 0, 0.7019608, 1,
1.216052, -0.5009023, 1.50484, 1, 0, 0.6941177, 1,
1.223472, -1.716749, 2.558537, 1, 0, 0.6901961, 1,
1.23908, -0.1491624, 2.133951, 1, 0, 0.682353, 1,
1.256151, 0.5671547, 2.214685, 1, 0, 0.6784314, 1,
1.260496, 0.5166809, 0.5416653, 1, 0, 0.6705883, 1,
1.262232, -0.2170002, 1.53338, 1, 0, 0.6666667, 1,
1.272344, -0.2848825, 2.773728, 1, 0, 0.6588235, 1,
1.273608, -0.7070169, 1.018613, 1, 0, 0.654902, 1,
1.291218, 1.456612, 1.734769, 1, 0, 0.6470588, 1,
1.291476, 1.249218, 2.335901, 1, 0, 0.6431373, 1,
1.299241, -1.582556, 3.59605, 1, 0, 0.6352941, 1,
1.303268, -0.5735431, 2.394198, 1, 0, 0.6313726, 1,
1.304998, 0.4079642, 2.96232, 1, 0, 0.6235294, 1,
1.309122, -1.071811, 1.478456, 1, 0, 0.6196079, 1,
1.316129, 0.651318, 2.923259, 1, 0, 0.6117647, 1,
1.321888, 0.3808433, 1.867261, 1, 0, 0.6078432, 1,
1.322238, -0.6598587, 2.713382, 1, 0, 0.6, 1,
1.322254, -0.7449194, 0.8781119, 1, 0, 0.5921569, 1,
1.328099, 0.935021, 1.846111, 1, 0, 0.5882353, 1,
1.329479, 1.385904, 0.3787598, 1, 0, 0.5803922, 1,
1.335224, -0.7313057, 4.110214, 1, 0, 0.5764706, 1,
1.335554, -0.0002094341, 2.19617, 1, 0, 0.5686275, 1,
1.338492, -0.6095381, 2.115748, 1, 0, 0.5647059, 1,
1.34502, -0.3473268, 3.139525, 1, 0, 0.5568628, 1,
1.34814, -1.188843, 2.133727, 1, 0, 0.5529412, 1,
1.348598, -1.416636, 2.691798, 1, 0, 0.5450981, 1,
1.358389, 1.062101, -0.4884462, 1, 0, 0.5411765, 1,
1.362997, -0.1066553, 3.774386, 1, 0, 0.5333334, 1,
1.365393, -0.3034582, 2.013979, 1, 0, 0.5294118, 1,
1.369773, -0.971315, 0.6977065, 1, 0, 0.5215687, 1,
1.380312, 0.6073661, 0.7781866, 1, 0, 0.5176471, 1,
1.384684, -0.5563542, 3.347841, 1, 0, 0.509804, 1,
1.395751, -1.255498, 1.969903, 1, 0, 0.5058824, 1,
1.396018, 1.711869, 1.170843, 1, 0, 0.4980392, 1,
1.39958, -1.067324, 3.026426, 1, 0, 0.4901961, 1,
1.400213, 1.017129, 0.7821397, 1, 0, 0.4862745, 1,
1.405058, -0.4342299, 2.84712, 1, 0, 0.4784314, 1,
1.433586, 0.3197117, 0.9352363, 1, 0, 0.4745098, 1,
1.437059, 1.000169, 1.850885, 1, 0, 0.4666667, 1,
1.439424, -1.368653, 0.3330068, 1, 0, 0.4627451, 1,
1.442423, -0.1341412, 2.870508, 1, 0, 0.454902, 1,
1.442778, -0.07717399, 2.630831, 1, 0, 0.4509804, 1,
1.447471, -1.876289, 3.523825, 1, 0, 0.4431373, 1,
1.44986, -0.4899985, 1.226937, 1, 0, 0.4392157, 1,
1.451292, -0.7479738, 2.357556, 1, 0, 0.4313726, 1,
1.455337, -1.491942, 2.461587, 1, 0, 0.427451, 1,
1.464111, 1.086559, -0.5130418, 1, 0, 0.4196078, 1,
1.467694, -0.5600409, 2.440477, 1, 0, 0.4156863, 1,
1.470727, 0.9246497, 0.9442868, 1, 0, 0.4078431, 1,
1.482924, -2.75822, 4.706116, 1, 0, 0.4039216, 1,
1.499129, -0.7191556, 0.9105272, 1, 0, 0.3960784, 1,
1.51063, 1.357412, 0.7006597, 1, 0, 0.3882353, 1,
1.513688, -0.9912615, 3.064596, 1, 0, 0.3843137, 1,
1.514457, 0.1735289, 2.214016, 1, 0, 0.3764706, 1,
1.517054, -0.09404019, 2.776084, 1, 0, 0.372549, 1,
1.535811, 0.9076487, 1.011388, 1, 0, 0.3647059, 1,
1.537494, -0.1919003, 1.329029, 1, 0, 0.3607843, 1,
1.546535, 1.002124, 0.8762489, 1, 0, 0.3529412, 1,
1.563612, -1.756797, 0.7734871, 1, 0, 0.3490196, 1,
1.573037, -0.7103951, 2.442956, 1, 0, 0.3411765, 1,
1.57921, 0.9616182, 0.1833035, 1, 0, 0.3372549, 1,
1.582775, -1.547569, 1.840222, 1, 0, 0.3294118, 1,
1.608062, -0.2942655, 2.015622, 1, 0, 0.3254902, 1,
1.608885, 0.9667414, 2.431116, 1, 0, 0.3176471, 1,
1.61479, -1.492762, 1.997906, 1, 0, 0.3137255, 1,
1.624894, -2.050337, -0.8137949, 1, 0, 0.3058824, 1,
1.627506, 0.4822241, 0.7149739, 1, 0, 0.2980392, 1,
1.638945, 0.1527076, 2.00225, 1, 0, 0.2941177, 1,
1.655792, -0.7358181, 3.330147, 1, 0, 0.2862745, 1,
1.662339, 0.9916469, 1.191245, 1, 0, 0.282353, 1,
1.677498, -0.5819668, 1.924787, 1, 0, 0.2745098, 1,
1.684993, -0.02260171, 1.520691, 1, 0, 0.2705882, 1,
1.711067, 0.7035276, 0.9848601, 1, 0, 0.2627451, 1,
1.712595, 0.4636068, 1.530218, 1, 0, 0.2588235, 1,
1.712701, -1.5078, 4.931536, 1, 0, 0.2509804, 1,
1.735033, -2.007888, 1.511222, 1, 0, 0.2470588, 1,
1.735422, 0.606558, 2.84332, 1, 0, 0.2392157, 1,
1.744016, -1.449602, 2.116747, 1, 0, 0.2352941, 1,
1.757112, 0.5814418, 2.332516, 1, 0, 0.227451, 1,
1.769797, -1.394982, 2.711836, 1, 0, 0.2235294, 1,
1.79266, -1.13524, 4.575799, 1, 0, 0.2156863, 1,
1.79659, -1.229679, 3.099438, 1, 0, 0.2117647, 1,
1.821086, -1.670142, 4.379005, 1, 0, 0.2039216, 1,
1.836142, -0.9686435, 2.463726, 1, 0, 0.1960784, 1,
1.841082, -0.6426228, 2.510168, 1, 0, 0.1921569, 1,
1.888548, 0.9302034, 0.1075088, 1, 0, 0.1843137, 1,
1.913565, 0.4015576, 1.909869, 1, 0, 0.1803922, 1,
1.921299, 0.6226315, 2.442037, 1, 0, 0.172549, 1,
1.984003, 0.5633628, 0.7046971, 1, 0, 0.1686275, 1,
2.058527, 1.951338, 0.5174689, 1, 0, 0.1607843, 1,
2.081487, 3.285856, -0.5526052, 1, 0, 0.1568628, 1,
2.103139, 1.594079, -0.8147147, 1, 0, 0.1490196, 1,
2.121585, 0.8417579, 1.694351, 1, 0, 0.145098, 1,
2.20799, -0.1734447, -0.1927655, 1, 0, 0.1372549, 1,
2.232277, -1.007271, 2.548075, 1, 0, 0.1333333, 1,
2.244984, 1.311123, 2.361527, 1, 0, 0.1254902, 1,
2.249709, 1.48883, 2.749095, 1, 0, 0.1215686, 1,
2.280453, -0.3823175, 3.548518, 1, 0, 0.1137255, 1,
2.300819, 0.1244608, 2.717661, 1, 0, 0.1098039, 1,
2.305581, 1.746929, 1.639523, 1, 0, 0.1019608, 1,
2.321661, 0.8742877, 0.3705086, 1, 0, 0.09411765, 1,
2.331297, -1.376206, 4.281871, 1, 0, 0.09019608, 1,
2.339412, 0.3326042, 1.901642, 1, 0, 0.08235294, 1,
2.359767, 1.417452, 0.04798324, 1, 0, 0.07843138, 1,
2.402525, -0.05205104, 0.4854442, 1, 0, 0.07058824, 1,
2.560543, 1.153982, 1.722295, 1, 0, 0.06666667, 1,
2.590958, -0.864523, 0.6235999, 1, 0, 0.05882353, 1,
2.625983, 0.154449, 2.443195, 1, 0, 0.05490196, 1,
2.788937, -0.3852791, 3.8236, 1, 0, 0.04705882, 1,
2.856711, 0.4503312, 1.135916, 1, 0, 0.04313726, 1,
2.864038, 0.1245356, 0.9960061, 1, 0, 0.03529412, 1,
2.920377, -0.3883052, 1.557792, 1, 0, 0.03137255, 1,
2.927834, 0.8056239, 1.750017, 1, 0, 0.02352941, 1,
3.010264, -2.117177, 2.013445, 1, 0, 0.01960784, 1,
3.017505, -0.5678762, 1.495344, 1, 0, 0.01176471, 1,
3.074158, 0.5616655, -0.5232425, 1, 0, 0.007843138, 1
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
0.06046593, -3.862045, -8.521218, 0, -0.5, 0.5, 0.5,
0.06046593, -3.862045, -8.521218, 1, -0.5, 0.5, 0.5,
0.06046593, -3.862045, -8.521218, 1, 1.5, 0.5, 0.5,
0.06046593, -3.862045, -8.521218, 0, 1.5, 0.5, 0.5
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
-3.974868, 0.2298913, -8.521218, 0, -0.5, 0.5, 0.5,
-3.974868, 0.2298913, -8.521218, 1, -0.5, 0.5, 0.5,
-3.974868, 0.2298913, -8.521218, 1, 1.5, 0.5, 0.5,
-3.974868, 0.2298913, -8.521218, 0, 1.5, 0.5, 0.5
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
-3.974868, -3.862045, -0.5865788, 0, -0.5, 0.5, 0.5,
-3.974868, -3.862045, -0.5865788, 1, -0.5, 0.5, 0.5,
-3.974868, -3.862045, -0.5865788, 1, 1.5, 0.5, 0.5,
-3.974868, -3.862045, -0.5865788, 0, 1.5, 0.5, 0.5
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
-2, -2.917752, -6.690148,
3, -2.917752, -6.690148,
-2, -2.917752, -6.690148,
-2, -3.075134, -6.995326,
-1, -2.917752, -6.690148,
-1, -3.075134, -6.995326,
0, -2.917752, -6.690148,
0, -3.075134, -6.995326,
1, -2.917752, -6.690148,
1, -3.075134, -6.995326,
2, -2.917752, -6.690148,
2, -3.075134, -6.995326,
3, -2.917752, -6.690148,
3, -3.075134, -6.995326
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
-2, -3.389899, -7.605683, 0, -0.5, 0.5, 0.5,
-2, -3.389899, -7.605683, 1, -0.5, 0.5, 0.5,
-2, -3.389899, -7.605683, 1, 1.5, 0.5, 0.5,
-2, -3.389899, -7.605683, 0, 1.5, 0.5, 0.5,
-1, -3.389899, -7.605683, 0, -0.5, 0.5, 0.5,
-1, -3.389899, -7.605683, 1, -0.5, 0.5, 0.5,
-1, -3.389899, -7.605683, 1, 1.5, 0.5, 0.5,
-1, -3.389899, -7.605683, 0, 1.5, 0.5, 0.5,
0, -3.389899, -7.605683, 0, -0.5, 0.5, 0.5,
0, -3.389899, -7.605683, 1, -0.5, 0.5, 0.5,
0, -3.389899, -7.605683, 1, 1.5, 0.5, 0.5,
0, -3.389899, -7.605683, 0, 1.5, 0.5, 0.5,
1, -3.389899, -7.605683, 0, -0.5, 0.5, 0.5,
1, -3.389899, -7.605683, 1, -0.5, 0.5, 0.5,
1, -3.389899, -7.605683, 1, 1.5, 0.5, 0.5,
1, -3.389899, -7.605683, 0, 1.5, 0.5, 0.5,
2, -3.389899, -7.605683, 0, -0.5, 0.5, 0.5,
2, -3.389899, -7.605683, 1, -0.5, 0.5, 0.5,
2, -3.389899, -7.605683, 1, 1.5, 0.5, 0.5,
2, -3.389899, -7.605683, 0, 1.5, 0.5, 0.5,
3, -3.389899, -7.605683, 0, -0.5, 0.5, 0.5,
3, -3.389899, -7.605683, 1, -0.5, 0.5, 0.5,
3, -3.389899, -7.605683, 1, 1.5, 0.5, 0.5,
3, -3.389899, -7.605683, 0, 1.5, 0.5, 0.5
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
-3.043637, -2, -6.690148,
-3.043637, 3, -6.690148,
-3.043637, -2, -6.690148,
-3.198843, -2, -6.995326,
-3.043637, -1, -6.690148,
-3.198843, -1, -6.995326,
-3.043637, 0, -6.690148,
-3.198843, 0, -6.995326,
-3.043637, 1, -6.690148,
-3.198843, 1, -6.995326,
-3.043637, 2, -6.690148,
-3.198843, 2, -6.995326,
-3.043637, 3, -6.690148,
-3.198843, 3, -6.995326
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
-3.509253, -2, -7.605683, 0, -0.5, 0.5, 0.5,
-3.509253, -2, -7.605683, 1, -0.5, 0.5, 0.5,
-3.509253, -2, -7.605683, 1, 1.5, 0.5, 0.5,
-3.509253, -2, -7.605683, 0, 1.5, 0.5, 0.5,
-3.509253, -1, -7.605683, 0, -0.5, 0.5, 0.5,
-3.509253, -1, -7.605683, 1, -0.5, 0.5, 0.5,
-3.509253, -1, -7.605683, 1, 1.5, 0.5, 0.5,
-3.509253, -1, -7.605683, 0, 1.5, 0.5, 0.5,
-3.509253, 0, -7.605683, 0, -0.5, 0.5, 0.5,
-3.509253, 0, -7.605683, 1, -0.5, 0.5, 0.5,
-3.509253, 0, -7.605683, 1, 1.5, 0.5, 0.5,
-3.509253, 0, -7.605683, 0, 1.5, 0.5, 0.5,
-3.509253, 1, -7.605683, 0, -0.5, 0.5, 0.5,
-3.509253, 1, -7.605683, 1, -0.5, 0.5, 0.5,
-3.509253, 1, -7.605683, 1, 1.5, 0.5, 0.5,
-3.509253, 1, -7.605683, 0, 1.5, 0.5, 0.5,
-3.509253, 2, -7.605683, 0, -0.5, 0.5, 0.5,
-3.509253, 2, -7.605683, 1, -0.5, 0.5, 0.5,
-3.509253, 2, -7.605683, 1, 1.5, 0.5, 0.5,
-3.509253, 2, -7.605683, 0, 1.5, 0.5, 0.5,
-3.509253, 3, -7.605683, 0, -0.5, 0.5, 0.5,
-3.509253, 3, -7.605683, 1, -0.5, 0.5, 0.5,
-3.509253, 3, -7.605683, 1, 1.5, 0.5, 0.5,
-3.509253, 3, -7.605683, 0, 1.5, 0.5, 0.5
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
-3.043637, -2.917752, -6,
-3.043637, -2.917752, 4,
-3.043637, -2.917752, -6,
-3.198843, -3.075134, -6,
-3.043637, -2.917752, -4,
-3.198843, -3.075134, -4,
-3.043637, -2.917752, -2,
-3.198843, -3.075134, -2,
-3.043637, -2.917752, 0,
-3.198843, -3.075134, 0,
-3.043637, -2.917752, 2,
-3.198843, -3.075134, 2,
-3.043637, -2.917752, 4,
-3.198843, -3.075134, 4
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
"-6",
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
-3.509253, -3.389899, -6, 0, -0.5, 0.5, 0.5,
-3.509253, -3.389899, -6, 1, -0.5, 0.5, 0.5,
-3.509253, -3.389899, -6, 1, 1.5, 0.5, 0.5,
-3.509253, -3.389899, -6, 0, 1.5, 0.5, 0.5,
-3.509253, -3.389899, -4, 0, -0.5, 0.5, 0.5,
-3.509253, -3.389899, -4, 1, -0.5, 0.5, 0.5,
-3.509253, -3.389899, -4, 1, 1.5, 0.5, 0.5,
-3.509253, -3.389899, -4, 0, 1.5, 0.5, 0.5,
-3.509253, -3.389899, -2, 0, -0.5, 0.5, 0.5,
-3.509253, -3.389899, -2, 1, -0.5, 0.5, 0.5,
-3.509253, -3.389899, -2, 1, 1.5, 0.5, 0.5,
-3.509253, -3.389899, -2, 0, 1.5, 0.5, 0.5,
-3.509253, -3.389899, 0, 0, -0.5, 0.5, 0.5,
-3.509253, -3.389899, 0, 1, -0.5, 0.5, 0.5,
-3.509253, -3.389899, 0, 1, 1.5, 0.5, 0.5,
-3.509253, -3.389899, 0, 0, 1.5, 0.5, 0.5,
-3.509253, -3.389899, 2, 0, -0.5, 0.5, 0.5,
-3.509253, -3.389899, 2, 1, -0.5, 0.5, 0.5,
-3.509253, -3.389899, 2, 1, 1.5, 0.5, 0.5,
-3.509253, -3.389899, 2, 0, 1.5, 0.5, 0.5,
-3.509253, -3.389899, 4, 0, -0.5, 0.5, 0.5,
-3.509253, -3.389899, 4, 1, -0.5, 0.5, 0.5,
-3.509253, -3.389899, 4, 1, 1.5, 0.5, 0.5,
-3.509253, -3.389899, 4, 0, 1.5, 0.5, 0.5
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
-3.043637, -2.917752, -6.690148,
-3.043637, 3.377535, -6.690148,
-3.043637, -2.917752, 5.51699,
-3.043637, 3.377535, 5.51699,
-3.043637, -2.917752, -6.690148,
-3.043637, -2.917752, 5.51699,
-3.043637, 3.377535, -6.690148,
-3.043637, 3.377535, 5.51699,
-3.043637, -2.917752, -6.690148,
3.164569, -2.917752, -6.690148,
-3.043637, -2.917752, 5.51699,
3.164569, -2.917752, 5.51699,
-3.043637, 3.377535, -6.690148,
3.164569, 3.377535, -6.690148,
-3.043637, 3.377535, 5.51699,
3.164569, 3.377535, 5.51699,
3.164569, -2.917752, -6.690148,
3.164569, 3.377535, -6.690148,
3.164569, -2.917752, 5.51699,
3.164569, 3.377535, 5.51699,
3.164569, -2.917752, -6.690148,
3.164569, -2.917752, 5.51699,
3.164569, 3.377535, -6.690148,
3.164569, 3.377535, 5.51699
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
var radius = 8.048536;
var distance = 35.80885;
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
mvMatrix.translate( -0.06046593, -0.2298913, 0.5865788 );
mvMatrix.scale( 1.401731, 1.382341, 0.7128808 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.80885);
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
cafenstrole<-read.table("cafenstrole.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cafenstrole$V2
```

```
## Error in eval(expr, envir, enclos): object 'cafenstrole' not found
```

```r
y<-cafenstrole$V3
```

```
## Error in eval(expr, envir, enclos): object 'cafenstrole' not found
```

```r
z<-cafenstrole$V4
```

```
## Error in eval(expr, envir, enclos): object 'cafenstrole' not found
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
-2.953227, 1.137988, -0.7831759, 0, 0, 1, 1, 1,
-2.86317, 0.8549362, -3.903858, 1, 0, 0, 1, 1,
-2.787288, -1.306412, -1.805625, 1, 0, 0, 1, 1,
-2.749989, -1.636631, -0.7810454, 1, 0, 0, 1, 1,
-2.688604, -1.114263, -0.5577144, 1, 0, 0, 1, 1,
-2.608177, -0.8751618, -3.50915, 1, 0, 0, 1, 1,
-2.549136, -0.6495327, -2.33978, 0, 0, 0, 1, 1,
-2.478837, -0.049948, -1.804837, 0, 0, 0, 1, 1,
-2.398511, -0.7997907, -3.39901, 0, 0, 0, 1, 1,
-2.326281, 0.4835964, -2.315027, 0, 0, 0, 1, 1,
-2.247889, -0.1678746, -1.624079, 0, 0, 0, 1, 1,
-2.211329, -1.981228, -3.383761, 0, 0, 0, 1, 1,
-2.164832, -0.126812, -1.350543, 0, 0, 0, 1, 1,
-2.161545, -0.6466441, -2.83113, 1, 1, 1, 1, 1,
-2.132978, 1.593022, -0.6211958, 1, 1, 1, 1, 1,
-2.112235, -0.7793159, -0.8465204, 1, 1, 1, 1, 1,
-2.052961, 0.111071, -1.834458, 1, 1, 1, 1, 1,
-2.050867, 0.8633543, -0.7188135, 1, 1, 1, 1, 1,
-2.031966, -0.7168639, -3.137836, 1, 1, 1, 1, 1,
-2.021122, -0.4800238, -0.2270903, 1, 1, 1, 1, 1,
-2.008973, 0.02986886, -3.02646, 1, 1, 1, 1, 1,
-1.97834, 1.742905, -2.483873, 1, 1, 1, 1, 1,
-1.940243, -0.3556263, 0.4854284, 1, 1, 1, 1, 1,
-1.926705, 0.1279076, -1.248935, 1, 1, 1, 1, 1,
-1.919451, 0.2219893, -1.817333, 1, 1, 1, 1, 1,
-1.908524, 1.291267, -0.7677236, 1, 1, 1, 1, 1,
-1.864091, -0.8877387, -1.321801, 1, 1, 1, 1, 1,
-1.829162, 0.6309857, -0.5886813, 1, 1, 1, 1, 1,
-1.822736, 1.028906, -2.225442, 0, 0, 1, 1, 1,
-1.810584, 0.122927, -1.477214, 1, 0, 0, 1, 1,
-1.790872, 0.9539773, -2.474884, 1, 0, 0, 1, 1,
-1.75351, -0.445093, -1.686356, 1, 0, 0, 1, 1,
-1.74625, -0.5834576, -3.221984, 1, 0, 0, 1, 1,
-1.738823, 0.9463847, -2.087217, 1, 0, 0, 1, 1,
-1.731041, 1.334297, -0.6707356, 0, 0, 0, 1, 1,
-1.725241, 0.7350162, -2.155167, 0, 0, 0, 1, 1,
-1.719838, -1.144265, -1.119139, 0, 0, 0, 1, 1,
-1.712416, 0.5771235, -1.757727, 0, 0, 0, 1, 1,
-1.707502, 1.064218, -1.656936, 0, 0, 0, 1, 1,
-1.690846, -0.2947966, -2.88291, 0, 0, 0, 1, 1,
-1.68654, 1.897104, -0.3642142, 0, 0, 0, 1, 1,
-1.683563, -0.1749585, -1.678925, 1, 1, 1, 1, 1,
-1.673015, -1.927724, -3.920229, 1, 1, 1, 1, 1,
-1.671739, -1.865684, -3.144185, 1, 1, 1, 1, 1,
-1.671022, -1.250451, -4.744874, 1, 1, 1, 1, 1,
-1.669873, -0.5208215, -2.206397, 1, 1, 1, 1, 1,
-1.663726, 0.9701513, -1.840178, 1, 1, 1, 1, 1,
-1.65658, -1.011234, -3.977112, 1, 1, 1, 1, 1,
-1.656473, -0.5587299, -3.596783, 1, 1, 1, 1, 1,
-1.655434, -0.004986529, -0.8697069, 1, 1, 1, 1, 1,
-1.649661, -0.7919299, -2.234326, 1, 1, 1, 1, 1,
-1.648581, -0.800366, -3.658638, 1, 1, 1, 1, 1,
-1.631562, -1.826212, -1.017748, 1, 1, 1, 1, 1,
-1.626266, -0.7884551, -1.23114, 1, 1, 1, 1, 1,
-1.62538, 1.592584, -1.137382, 1, 1, 1, 1, 1,
-1.604503, -1.487526, -2.932999, 1, 1, 1, 1, 1,
-1.596009, 0.2478562, -1.113659, 0, 0, 1, 1, 1,
-1.579368, -0.2961804, -1.440902, 1, 0, 0, 1, 1,
-1.578056, -0.505281, -1.671096, 1, 0, 0, 1, 1,
-1.577481, -0.005807271, -0.156245, 1, 0, 0, 1, 1,
-1.571999, 1.389763, -3.511596, 1, 0, 0, 1, 1,
-1.566046, 0.5888107, -0.4562619, 1, 0, 0, 1, 1,
-1.56425, 0.5148549, -2.635147, 0, 0, 0, 1, 1,
-1.55396, -0.9857823, -1.555435, 0, 0, 0, 1, 1,
-1.522017, 0.1016049, -0.8616911, 0, 0, 0, 1, 1,
-1.520496, 0.744363, 0.8649725, 0, 0, 0, 1, 1,
-1.509135, 0.8747258, -1.934682, 0, 0, 0, 1, 1,
-1.505596, -0.02558111, -2.592276, 0, 0, 0, 1, 1,
-1.486795, 0.7322823, -1.098366, 0, 0, 0, 1, 1,
-1.475658, 0.4470108, -0.3916005, 1, 1, 1, 1, 1,
-1.474753, 0.5919591, -1.344606, 1, 1, 1, 1, 1,
-1.457584, -1.178123, -2.039778, 1, 1, 1, 1, 1,
-1.444663, 0.6619752, -1.208447, 1, 1, 1, 1, 1,
-1.443344, -0.2370929, -3.544749, 1, 1, 1, 1, 1,
-1.442034, 0.3726404, -0.7901946, 1, 1, 1, 1, 1,
-1.436809, 1.798589, -2.076055, 1, 1, 1, 1, 1,
-1.428086, 0.06568174, -0.03096379, 1, 1, 1, 1, 1,
-1.416694, 1.176257, -0.9190013, 1, 1, 1, 1, 1,
-1.415631, 0.6849584, -1.215752, 1, 1, 1, 1, 1,
-1.40487, -0.8802374, -2.987462, 1, 1, 1, 1, 1,
-1.381253, -1.555439, -2.81307, 1, 1, 1, 1, 1,
-1.371589, 0.843977, -1.571105, 1, 1, 1, 1, 1,
-1.336628, 0.4177911, -0.6849483, 1, 1, 1, 1, 1,
-1.334644, -1.433201, -3.766911, 1, 1, 1, 1, 1,
-1.332552, 0.3549405, -1.529895, 0, 0, 1, 1, 1,
-1.322888, 0.296333, -0.8629186, 1, 0, 0, 1, 1,
-1.311988, -0.8112556, 0.02262078, 1, 0, 0, 1, 1,
-1.311239, 0.3895122, -1.811373, 1, 0, 0, 1, 1,
-1.31039, -1.928637, -1.736514, 1, 0, 0, 1, 1,
-1.30672, -1.815807, -2.433132, 1, 0, 0, 1, 1,
-1.305512, 0.05331662, -0.06575187, 0, 0, 0, 1, 1,
-1.299343, 0.8503284, -0.99155, 0, 0, 0, 1, 1,
-1.29678, 0.4844463, -0.9039313, 0, 0, 0, 1, 1,
-1.286915, -0.4936511, -2.534359, 0, 0, 0, 1, 1,
-1.284406, 0.255527, -3.44272, 0, 0, 0, 1, 1,
-1.28289, -0.2631764, -1.924309, 0, 0, 0, 1, 1,
-1.281878, -1.313167, -3.230268, 0, 0, 0, 1, 1,
-1.276702, -0.3239575, -0.8133129, 1, 1, 1, 1, 1,
-1.27589, 0.2361876, -1.389752, 1, 1, 1, 1, 1,
-1.26, 0.5398215, -0.4240276, 1, 1, 1, 1, 1,
-1.258237, -0.02149667, -1.425092, 1, 1, 1, 1, 1,
-1.252694, 1.375099, -2.450813, 1, 1, 1, 1, 1,
-1.241642, -0.6267707, -1.677341, 1, 1, 1, 1, 1,
-1.239515, -0.4605051, -2.054612, 1, 1, 1, 1, 1,
-1.236576, -0.7362047, -2.147262, 1, 1, 1, 1, 1,
-1.233685, -0.9181659, -0.1973822, 1, 1, 1, 1, 1,
-1.232072, 0.02304208, -1.616348, 1, 1, 1, 1, 1,
-1.231807, -0.7104649, -2.100353, 1, 1, 1, 1, 1,
-1.226262, -0.6980353, -2.627625, 1, 1, 1, 1, 1,
-1.221573, -0.7940984, -2.57249, 1, 1, 1, 1, 1,
-1.214157, -0.3186255, -0.7806241, 1, 1, 1, 1, 1,
-1.205787, 0.7026106, -0.3716119, 1, 1, 1, 1, 1,
-1.197777, 0.2547383, -0.4867766, 0, 0, 1, 1, 1,
-1.189427, -1.309226, -3.553739, 1, 0, 0, 1, 1,
-1.172701, 0.6534383, -1.316606, 1, 0, 0, 1, 1,
-1.168759, 0.1086126, -0.8312916, 1, 0, 0, 1, 1,
-1.168148, -2.421934, -3.63369, 1, 0, 0, 1, 1,
-1.16727, 1.22083, -1.397451, 1, 0, 0, 1, 1,
-1.164885, -1.566177, -2.231853, 0, 0, 0, 1, 1,
-1.156707, 0.03486456, -1.7565, 0, 0, 0, 1, 1,
-1.151938, 1.593979, -0.722621, 0, 0, 0, 1, 1,
-1.140873, 0.970507, -1.719987, 0, 0, 0, 1, 1,
-1.133821, 2.77818, 0.7454271, 0, 0, 0, 1, 1,
-1.132082, 0.9178537, -0.3871049, 0, 0, 0, 1, 1,
-1.121184, -0.03633054, -3.09845, 0, 0, 0, 1, 1,
-1.115738, 2.485431, -0.5515223, 1, 1, 1, 1, 1,
-1.113562, -1.863986, -2.69884, 1, 1, 1, 1, 1,
-1.113097, 0.1279321, -0.9997586, 1, 1, 1, 1, 1,
-1.10837, -1.725855, -2.0182, 1, 1, 1, 1, 1,
-1.103328, -1.907382, 0.2877555, 1, 1, 1, 1, 1,
-1.09487, 0.6489516, -1.183045, 1, 1, 1, 1, 1,
-1.094617, -0.5623367, -0.03612362, 1, 1, 1, 1, 1,
-1.086727, -0.2637267, -2.365172, 1, 1, 1, 1, 1,
-1.080896, -0.3185942, -2.187365, 1, 1, 1, 1, 1,
-1.065103, -1.936163, -4.238214, 1, 1, 1, 1, 1,
-1.064857, 0.918929, -0.2890417, 1, 1, 1, 1, 1,
-1.062277, 2.791749, -1.287085, 1, 1, 1, 1, 1,
-1.060832, -0.1721574, -0.8783721, 1, 1, 1, 1, 1,
-1.059625, 1.784095, 2.74806, 1, 1, 1, 1, 1,
-1.05608, -0.7304857, -2.307594, 1, 1, 1, 1, 1,
-1.055792, -0.5443149, -1.445971, 0, 0, 1, 1, 1,
-1.053033, 0.1043801, -0.5274053, 1, 0, 0, 1, 1,
-1.052441, -0.07776835, -0.5714672, 1, 0, 0, 1, 1,
-1.048995, -1.658883, -2.673531, 1, 0, 0, 1, 1,
-1.044113, -0.6461891, -3.386705, 1, 0, 0, 1, 1,
-1.043081, 1.354637, 0.04031486, 1, 0, 0, 1, 1,
-1.042209, 3.268748, -0.9976376, 0, 0, 0, 1, 1,
-1.04154, 0.9729064, -2.608032, 0, 0, 0, 1, 1,
-1.038452, -1.052598, -2.203401, 0, 0, 0, 1, 1,
-1.033063, -1.430602, -3.412334, 0, 0, 0, 1, 1,
-1.020807, 0.791773, -2.131078, 0, 0, 0, 1, 1,
-1.01424, -0.9914927, -1.18745, 0, 0, 0, 1, 1,
-1.009049, 0.7027024, -0.636566, 0, 0, 0, 1, 1,
-1.008676, -0.01799654, -1.978763, 1, 1, 1, 1, 1,
-0.9968629, 0.7170068, 0.5807657, 1, 1, 1, 1, 1,
-0.9958686, -1.140179, -2.310228, 1, 1, 1, 1, 1,
-0.9949103, 0.5248007, -0.1576111, 1, 1, 1, 1, 1,
-0.9928103, 0.8864347, -0.181998, 1, 1, 1, 1, 1,
-0.9877264, 0.8121424, 0.8563955, 1, 1, 1, 1, 1,
-0.98678, -2.113194, -1.982767, 1, 1, 1, 1, 1,
-0.9831183, 0.217701, -1.219157, 1, 1, 1, 1, 1,
-0.966077, 0.2600715, -1.369162, 1, 1, 1, 1, 1,
-0.9640464, -1.182215, -4.220687, 1, 1, 1, 1, 1,
-0.9597003, -0.2794218, -1.079417, 1, 1, 1, 1, 1,
-0.9579368, -2.181144, -1.051723, 1, 1, 1, 1, 1,
-0.9572772, 1.225201, 0.07080367, 1, 1, 1, 1, 1,
-0.9558372, 2.231486, -2.956269, 1, 1, 1, 1, 1,
-0.9509826, -0.1544206, -1.156311, 1, 1, 1, 1, 1,
-0.9502036, -0.6712968, -0.9230583, 0, 0, 1, 1, 1,
-0.938595, -0.9797687, -4.049424, 1, 0, 0, 1, 1,
-0.9371674, 1.529791, -0.06328037, 1, 0, 0, 1, 1,
-0.9356952, -0.8401535, -1.790233, 1, 0, 0, 1, 1,
-0.9330618, -0.8262196, -3.292737, 1, 0, 0, 1, 1,
-0.9325135, -0.2184594, -2.394624, 1, 0, 0, 1, 1,
-0.9317011, 0.8954502, -2.93518, 0, 0, 0, 1, 1,
-0.9282494, -0.3691258, -3.60029, 0, 0, 0, 1, 1,
-0.9165614, -0.5229051, -2.339403, 0, 0, 0, 1, 1,
-0.9165461, 0.1494923, -2.116422, 0, 0, 0, 1, 1,
-0.9160854, 0.697989, -1.308353, 0, 0, 0, 1, 1,
-0.914535, -0.282844, -1.735643, 0, 0, 0, 1, 1,
-0.9142809, 2.12008, -0.5382653, 0, 0, 0, 1, 1,
-0.9128489, 0.9122403, -0.6609445, 1, 1, 1, 1, 1,
-0.9079392, -0.9068197, -1.938622, 1, 1, 1, 1, 1,
-0.905687, -0.3275277, -1.998886, 1, 1, 1, 1, 1,
-0.9056106, -0.4364704, -1.833416, 1, 1, 1, 1, 1,
-0.9031578, -0.2152598, -2.795021, 1, 1, 1, 1, 1,
-0.8946801, 2.19274, -2.779663, 1, 1, 1, 1, 1,
-0.8919007, -1.296982, -3.178735, 1, 1, 1, 1, 1,
-0.8911036, -0.04756868, -0.4342711, 1, 1, 1, 1, 1,
-0.8848797, 1.24099, -1.530775, 1, 1, 1, 1, 1,
-0.8837513, -1.541575, -2.510948, 1, 1, 1, 1, 1,
-0.8836297, 0.7932338, -0.9972559, 1, 1, 1, 1, 1,
-0.8777413, 0.150821, -3.346993, 1, 1, 1, 1, 1,
-0.8772423, -0.1538191, -1.814383, 1, 1, 1, 1, 1,
-0.875695, 0.4827382, -0.2199573, 1, 1, 1, 1, 1,
-0.8732246, 0.5790744, -2.805899, 1, 1, 1, 1, 1,
-0.8730147, 1.007313, -0.2932751, 0, 0, 1, 1, 1,
-0.8675181, -1.503742, -1.614761, 1, 0, 0, 1, 1,
-0.8632898, 0.7824222, -1.949638, 1, 0, 0, 1, 1,
-0.8620304, 0.06071652, -0.974985, 1, 0, 0, 1, 1,
-0.8611103, 0.6696808, -1.920209, 1, 0, 0, 1, 1,
-0.8569538, -0.06807616, -2.531182, 1, 0, 0, 1, 1,
-0.855862, 0.7138425, 0.4680861, 0, 0, 0, 1, 1,
-0.8501363, -0.3785709, -0.9212761, 0, 0, 0, 1, 1,
-0.8409706, 0.1429567, 0.05510253, 0, 0, 0, 1, 1,
-0.8360805, 0.6939235, 0.7746314, 0, 0, 0, 1, 1,
-0.8360351, -1.474269, -1.169207, 0, 0, 0, 1, 1,
-0.8341872, 0.582417, -2.585213, 0, 0, 0, 1, 1,
-0.8289065, -0.2465552, -1.373843, 0, 0, 0, 1, 1,
-0.82444, 0.03838748, -1.654027, 1, 1, 1, 1, 1,
-0.8231393, 0.6543195, -0.5235559, 1, 1, 1, 1, 1,
-0.818737, -0.3683929, -3.171794, 1, 1, 1, 1, 1,
-0.8124475, 0.9941086, -1.28866, 1, 1, 1, 1, 1,
-0.8107065, -1.953608, -3.311308, 1, 1, 1, 1, 1,
-0.8092499, -0.02852297, -2.684902, 1, 1, 1, 1, 1,
-0.7974377, -1.616497, -3.286555, 1, 1, 1, 1, 1,
-0.7897515, 2.250244, -0.9868654, 1, 1, 1, 1, 1,
-0.7887963, 0.04357595, -1.074587, 1, 1, 1, 1, 1,
-0.7805352, 0.0009922886, -0.4393608, 1, 1, 1, 1, 1,
-0.7796822, -2.276225, -2.318754, 1, 1, 1, 1, 1,
-0.771084, -1.214382, -1.956571, 1, 1, 1, 1, 1,
-0.7654768, 0.8832258, 0.2494378, 1, 1, 1, 1, 1,
-0.7653254, -2.354988, -3.370606, 1, 1, 1, 1, 1,
-0.7651752, 1.431742, -2.126784, 1, 1, 1, 1, 1,
-0.7588761, 0.7691982, -1.498855, 0, 0, 1, 1, 1,
-0.7569763, -0.4542583, -2.475883, 1, 0, 0, 1, 1,
-0.7548136, 2.247513, -0.1716459, 1, 0, 0, 1, 1,
-0.7504158, 1.621193, -1.215926, 1, 0, 0, 1, 1,
-0.7476737, -1.615197, -2.954, 1, 0, 0, 1, 1,
-0.7441826, 1.263176, 0.03907504, 1, 0, 0, 1, 1,
-0.7348426, 0.8062887, -0.4298698, 0, 0, 0, 1, 1,
-0.7333617, -1.554751, -3.730324, 0, 0, 0, 1, 1,
-0.7282305, 1.098236, -1.885133, 0, 0, 0, 1, 1,
-0.7258482, -0.1725632, -3.712606, 0, 0, 0, 1, 1,
-0.7239968, -1.478484, -2.122904, 0, 0, 0, 1, 1,
-0.7224163, -0.4554459, -2.188418, 0, 0, 0, 1, 1,
-0.7208598, -0.7439731, -2.979834, 0, 0, 0, 1, 1,
-0.7150732, 0.5389889, 0.9700086, 1, 1, 1, 1, 1,
-0.7128907, 0.9883769, 1.398062, 1, 1, 1, 1, 1,
-0.7061405, 0.6879215, -0.4211947, 1, 1, 1, 1, 1,
-0.7046761, 1.392674, -0.9090522, 1, 1, 1, 1, 1,
-0.7029713, 1.669948, -1.95976, 1, 1, 1, 1, 1,
-0.697457, 0.7540272, -0.05818969, 1, 1, 1, 1, 1,
-0.6923987, 1.927788, -1.813377, 1, 1, 1, 1, 1,
-0.6909657, -0.3840718, -2.614685, 1, 1, 1, 1, 1,
-0.6891199, -0.7050586, -2.265065, 1, 1, 1, 1, 1,
-0.6794116, -1.216462, -2.403925, 1, 1, 1, 1, 1,
-0.6793497, 0.9103954, 1.664413, 1, 1, 1, 1, 1,
-0.6694756, 0.2321299, -1.027613, 1, 1, 1, 1, 1,
-0.6693739, 0.1223148, -0.236066, 1, 1, 1, 1, 1,
-0.6692905, -1.390848, -1.014012, 1, 1, 1, 1, 1,
-0.6666193, -0.6380199, -1.751352, 1, 1, 1, 1, 1,
-0.6615571, 0.4547355, -0.6444069, 0, 0, 1, 1, 1,
-0.6545726, -1.192667, -1.718123, 1, 0, 0, 1, 1,
-0.6537401, 0.1100115, -0.9614345, 1, 0, 0, 1, 1,
-0.6536576, 1.454605, -1.007284, 1, 0, 0, 1, 1,
-0.6519761, 1.31364, 0.3451243, 1, 0, 0, 1, 1,
-0.6514894, -1.82011, -6.134305, 1, 0, 0, 1, 1,
-0.6496252, 0.002144378, -0.1864234, 0, 0, 0, 1, 1,
-0.6482195, 0.2250496, -3.172679, 0, 0, 0, 1, 1,
-0.6446275, -0.8724419, -0.509734, 0, 0, 0, 1, 1,
-0.6432559, 1.059352, 0.9042704, 0, 0, 0, 1, 1,
-0.6382956, -0.425796, -2.396858, 0, 0, 0, 1, 1,
-0.6336451, -1.700656, -2.948767, 0, 0, 0, 1, 1,
-0.6327848, 0.1802299, 0.1535986, 0, 0, 0, 1, 1,
-0.6298253, 1.010672, 0.4732601, 1, 1, 1, 1, 1,
-0.6257645, 0.09382818, -0.9709265, 1, 1, 1, 1, 1,
-0.6254306, 0.02496668, -2.149601, 1, 1, 1, 1, 1,
-0.6224774, -0.8123967, -2.733426, 1, 1, 1, 1, 1,
-0.6183599, -0.6649038, -2.344673, 1, 1, 1, 1, 1,
-0.6179827, -0.4890519, -2.208294, 1, 1, 1, 1, 1,
-0.6131412, -0.6708443, -0.712041, 1, 1, 1, 1, 1,
-0.6130313, -0.2157101, -2.804016, 1, 1, 1, 1, 1,
-0.6105548, 0.6434381, -0.976519, 1, 1, 1, 1, 1,
-0.6040336, -2.481794, -4.504209, 1, 1, 1, 1, 1,
-0.5987249, -0.1012389, -1.728643, 1, 1, 1, 1, 1,
-0.5949184, -0.2618593, -2.749635, 1, 1, 1, 1, 1,
-0.5923911, -0.3478263, -2.474914, 1, 1, 1, 1, 1,
-0.591833, -0.01562769, -0.2017021, 1, 1, 1, 1, 1,
-0.5910848, 1.555652, -1.738904, 1, 1, 1, 1, 1,
-0.5887632, -0.01529153, -2.436157, 0, 0, 1, 1, 1,
-0.5855051, 0.2600773, -0.4679927, 1, 0, 0, 1, 1,
-0.5841754, 0.3342119, -0.4952726, 1, 0, 0, 1, 1,
-0.5798249, -2.192407, -3.259943, 1, 0, 0, 1, 1,
-0.5791275, -0.2667652, -0.4105757, 1, 0, 0, 1, 1,
-0.5788875, 0.4001405, 1.029249, 1, 0, 0, 1, 1,
-0.5786242, -0.3038532, -1.773507, 0, 0, 0, 1, 1,
-0.5753446, -2.502634, -2.492894, 0, 0, 0, 1, 1,
-0.574898, 0.2737342, -1.895646, 0, 0, 0, 1, 1,
-0.5733292, 1.154201, -1.62451, 0, 0, 0, 1, 1,
-0.5696079, -1.018555, -2.887995, 0, 0, 0, 1, 1,
-0.5668796, 0.5623053, -0.7792329, 0, 0, 0, 1, 1,
-0.5645484, -0.3077086, -1.820361, 0, 0, 0, 1, 1,
-0.5645477, 0.9722477, -0.408242, 1, 1, 1, 1, 1,
-0.5624149, -1.775825, -2.909456, 1, 1, 1, 1, 1,
-0.5607646, 0.872758, -1.00582, 1, 1, 1, 1, 1,
-0.5586597, -1.662605, -3.873796, 1, 1, 1, 1, 1,
-0.5539038, -0.03736544, -1.452178, 1, 1, 1, 1, 1,
-0.5522063, -0.3474794, 0.8865913, 1, 1, 1, 1, 1,
-0.5376317, 0.4666061, -0.8860765, 1, 1, 1, 1, 1,
-0.5357633, -0.4787376, -2.546248, 1, 1, 1, 1, 1,
-0.5356317, -1.42407, -3.318763, 1, 1, 1, 1, 1,
-0.5342932, 0.9152719, -1.856191, 1, 1, 1, 1, 1,
-0.5333031, -0.2914524, -2.416301, 1, 1, 1, 1, 1,
-0.5312326, -0.61704, -3.234451, 1, 1, 1, 1, 1,
-0.5252963, -0.4272077, -2.182472, 1, 1, 1, 1, 1,
-0.5245852, -0.05619912, -2.328306, 1, 1, 1, 1, 1,
-0.5193253, 0.1862829, -4.141254, 1, 1, 1, 1, 1,
-0.5130997, 0.01665909, -3.952052, 0, 0, 1, 1, 1,
-0.5094245, -0.3841273, -2.405829, 1, 0, 0, 1, 1,
-0.5027224, -0.9276131, -1.56966, 1, 0, 0, 1, 1,
-0.4955652, -0.2061531, -0.1914099, 1, 0, 0, 1, 1,
-0.4920787, 1.176874, -0.2030465, 1, 0, 0, 1, 1,
-0.4902081, -1.181023, -3.515563, 1, 0, 0, 1, 1,
-0.4871505, -0.3625397, -2.283876, 0, 0, 0, 1, 1,
-0.4809666, 0.4566877, -1.430892, 0, 0, 0, 1, 1,
-0.4765628, -0.2223323, -2.007242, 0, 0, 0, 1, 1,
-0.4720506, 0.7783558, -1.161039, 0, 0, 0, 1, 1,
-0.4644909, 1.51607, -1.07759, 0, 0, 0, 1, 1,
-0.4609169, 2.41547, 0.3081214, 0, 0, 0, 1, 1,
-0.4606947, -1.055383, -2.649913, 0, 0, 0, 1, 1,
-0.4534876, 1.042687, -0.03481287, 1, 1, 1, 1, 1,
-0.4507729, -0.3255053, -2.719822, 1, 1, 1, 1, 1,
-0.4478114, 1.448619, -0.9198956, 1, 1, 1, 1, 1,
-0.4432095, -0.07235173, 0.5223352, 1, 1, 1, 1, 1,
-0.4355301, 0.1360517, -1.600485, 1, 1, 1, 1, 1,
-0.4348721, -0.8177691, -0.9047423, 1, 1, 1, 1, 1,
-0.4347296, 0.1524193, -2.744642, 1, 1, 1, 1, 1,
-0.431321, 0.8354462, -0.4429543, 1, 1, 1, 1, 1,
-0.4306646, -0.8270718, -3.158948, 1, 1, 1, 1, 1,
-0.4299726, 1.380579, 0.2011121, 1, 1, 1, 1, 1,
-0.4288168, 0.8406195, 1.163432, 1, 1, 1, 1, 1,
-0.425629, -1.323094, -3.723663, 1, 1, 1, 1, 1,
-0.4206326, -0.0644768, -1.874857, 1, 1, 1, 1, 1,
-0.4199687, 1.883136, 0.8152376, 1, 1, 1, 1, 1,
-0.415475, 0.269784, -1.113078, 1, 1, 1, 1, 1,
-0.4138727, -0.09149305, -0.8807424, 0, 0, 1, 1, 1,
-0.4134333, 1.558938, 1.253574, 1, 0, 0, 1, 1,
-0.4131531, -1.023609, -2.309086, 1, 0, 0, 1, 1,
-0.4121932, 0.4575581, 0.6841122, 1, 0, 0, 1, 1,
-0.4084684, -0.6103017, -2.561966, 1, 0, 0, 1, 1,
-0.4055831, -0.1126401, -0.1136467, 1, 0, 0, 1, 1,
-0.4052373, -0.3733016, -1.89077, 0, 0, 0, 1, 1,
-0.3961425, 0.8408092, -1.123538, 0, 0, 0, 1, 1,
-0.3944618, 0.2938584, -0.2143668, 0, 0, 0, 1, 1,
-0.3927114, -0.888326, -2.603924, 0, 0, 0, 1, 1,
-0.3852061, 0.3068446, -0.1212678, 0, 0, 0, 1, 1,
-0.3849748, 0.7412288, 0.982124, 0, 0, 0, 1, 1,
-0.3807906, 1.177189, 0.6455446, 0, 0, 0, 1, 1,
-0.3753807, -0.6478983, -3.449395, 1, 1, 1, 1, 1,
-0.3747322, -0.3361768, -0.4898148, 1, 1, 1, 1, 1,
-0.3718962, -0.4082994, -2.237058, 1, 1, 1, 1, 1,
-0.3678842, -0.6228127, -2.492463, 1, 1, 1, 1, 1,
-0.3620711, -0.08546609, -2.019267, 1, 1, 1, 1, 1,
-0.3606424, 0.1520993, -1.882702, 1, 1, 1, 1, 1,
-0.358786, -0.5919459, -1.91116, 1, 1, 1, 1, 1,
-0.3515318, -0.3589965, -1.730263, 1, 1, 1, 1, 1,
-0.3498133, -0.1345826, -2.16817, 1, 1, 1, 1, 1,
-0.3456366, -0.1335763, 0.296615, 1, 1, 1, 1, 1,
-0.3434096, 1.283275, -0.9134027, 1, 1, 1, 1, 1,
-0.3401234, -1.664318, -2.555307, 1, 1, 1, 1, 1,
-0.3354797, 0.461435, 1.085291, 1, 1, 1, 1, 1,
-0.3320902, 0.2858399, -2.33477, 1, 1, 1, 1, 1,
-0.3300565, -0.2598662, -1.671997, 1, 1, 1, 1, 1,
-0.327288, 0.9751076, -0.001446547, 0, 0, 1, 1, 1,
-0.3259099, -1.234158, -4.464281, 1, 0, 0, 1, 1,
-0.3252205, 0.8487582, -0.8486881, 1, 0, 0, 1, 1,
-0.3230643, 0.01469377, -2.621936, 1, 0, 0, 1, 1,
-0.32265, -0.7494797, -4.252532, 1, 0, 0, 1, 1,
-0.3207678, 0.7756667, 0.5799496, 1, 0, 0, 1, 1,
-0.3160433, -0.1959348, -1.167045, 0, 0, 0, 1, 1,
-0.3155262, -0.2724552, -2.568743, 0, 0, 0, 1, 1,
-0.3150647, -0.6825914, -2.066125, 0, 0, 0, 1, 1,
-0.3124349, 1.363732, 0.3829038, 0, 0, 0, 1, 1,
-0.3037692, -0.9451995, -1.742796, 0, 0, 0, 1, 1,
-0.3016641, 0.9701753, 2.828031, 0, 0, 0, 1, 1,
-0.3015288, 0.2695571, -0.0311556, 0, 0, 0, 1, 1,
-0.2894896, 1.427318, -1.047851, 1, 1, 1, 1, 1,
-0.2876737, -0.3092059, -3.353487, 1, 1, 1, 1, 1,
-0.287407, 0.009326086, -0.8445733, 1, 1, 1, 1, 1,
-0.2865269, 0.3204972, 0.6317587, 1, 1, 1, 1, 1,
-0.284254, -1.317815, -1.744285, 1, 1, 1, 1, 1,
-0.2829083, 1.129998, -0.2888864, 1, 1, 1, 1, 1,
-0.2817942, 0.169583, -0.6091898, 1, 1, 1, 1, 1,
-0.279706, -0.7703476, -4.373421, 1, 1, 1, 1, 1,
-0.2769434, 0.860129, -0.4426983, 1, 1, 1, 1, 1,
-0.2766915, -0.465032, -0.2537502, 1, 1, 1, 1, 1,
-0.2744125, 0.9066247, -0.8853989, 1, 1, 1, 1, 1,
-0.2730502, -1.223453, -3.28722, 1, 1, 1, 1, 1,
-0.2669949, 1.099982, -1.107833, 1, 1, 1, 1, 1,
-0.2668464, 0.03207438, -1.286756, 1, 1, 1, 1, 1,
-0.2607925, -0.4770997, -2.813852, 1, 1, 1, 1, 1,
-0.2595335, -1.334983, -2.673829, 0, 0, 1, 1, 1,
-0.2590148, 0.4684681, -1.68357, 1, 0, 0, 1, 1,
-0.258677, 1.56999, -0.07754117, 1, 0, 0, 1, 1,
-0.2582904, 0.3065974, -1.174326, 1, 0, 0, 1, 1,
-0.2572208, -0.824061, -4.30836, 1, 0, 0, 1, 1,
-0.2561731, 0.1070436, -2.319265, 1, 0, 0, 1, 1,
-0.2539787, 1.174719, 1.005912, 0, 0, 0, 1, 1,
-0.2530959, 0.8441612, -0.4059984, 0, 0, 0, 1, 1,
-0.2502757, -0.9666396, -2.583863, 0, 0, 0, 1, 1,
-0.2490547, -0.4301075, -1.432554, 0, 0, 0, 1, 1,
-0.241154, -0.7152308, -3.989539, 0, 0, 0, 1, 1,
-0.2406166, -1.069093, -2.3393, 0, 0, 0, 1, 1,
-0.2386676, -1.444004, -2.891493, 0, 0, 0, 1, 1,
-0.2341052, -1.476323, -4.417186, 1, 1, 1, 1, 1,
-0.2313969, -0.1455684, -1.181462, 1, 1, 1, 1, 1,
-0.2292669, -0.07852437, -3.200376, 1, 1, 1, 1, 1,
-0.2264183, 0.9058576, 0.8250587, 1, 1, 1, 1, 1,
-0.2224408, 1.596095, 0.3083908, 1, 1, 1, 1, 1,
-0.2213575, 0.7076187, -0.6665502, 1, 1, 1, 1, 1,
-0.2189219, 1.099547, 0.2961122, 1, 1, 1, 1, 1,
-0.2148361, -0.2680495, -1.727443, 1, 1, 1, 1, 1,
-0.2097853, 0.9378312, -1.861174, 1, 1, 1, 1, 1,
-0.2087476, -0.6947755, -1.894946, 1, 1, 1, 1, 1,
-0.202135, -0.9937029, -2.88795, 1, 1, 1, 1, 1,
-0.2018235, -1.208799, -5.305426, 1, 1, 1, 1, 1,
-0.2013996, -1.233318, -3.030811, 1, 1, 1, 1, 1,
-0.2012993, 0.737293, 0.1054862, 1, 1, 1, 1, 1,
-0.1995778, 0.3559673, -1.560546, 1, 1, 1, 1, 1,
-0.1984144, -0.1874764, -2.660029, 0, 0, 1, 1, 1,
-0.1947023, -0.5167686, -4.399291, 1, 0, 0, 1, 1,
-0.1944781, 1.021828, 0.6563411, 1, 0, 0, 1, 1,
-0.1936011, 0.08948171, -2.653761, 1, 0, 0, 1, 1,
-0.1831298, 1.285581, -0.5656366, 1, 0, 0, 1, 1,
-0.1817933, 0.4854018, 0.4728828, 1, 0, 0, 1, 1,
-0.1810455, 0.5940067, -0.4252045, 0, 0, 0, 1, 1,
-0.1804802, 0.9540405, 1.016785, 0, 0, 0, 1, 1,
-0.1753221, 0.4441901, -0.546684, 0, 0, 0, 1, 1,
-0.1695982, -0.189357, -2.355181, 0, 0, 0, 1, 1,
-0.1683588, -1.513256, -2.078492, 0, 0, 0, 1, 1,
-0.1665059, 1.776346, -0.2714792, 0, 0, 0, 1, 1,
-0.1636928, -1.942811, -3.551174, 0, 0, 0, 1, 1,
-0.1588681, 0.2827252, -0.9858664, 1, 1, 1, 1, 1,
-0.1494148, 1.287068, -0.4950185, 1, 1, 1, 1, 1,
-0.148822, -1.072494, -3.740064, 1, 1, 1, 1, 1,
-0.1466704, 0.3406077, -0.3983675, 1, 1, 1, 1, 1,
-0.1448407, 2.709435, 0.7556683, 1, 1, 1, 1, 1,
-0.1432706, 1.497445, -1.375495, 1, 1, 1, 1, 1,
-0.1426797, -0.5448745, -2.076709, 1, 1, 1, 1, 1,
-0.1426346, 0.3900069, -2.131209, 1, 1, 1, 1, 1,
-0.1408527, 0.3768047, 0.8255614, 1, 1, 1, 1, 1,
-0.1389769, 2.490497, -0.1921131, 1, 1, 1, 1, 1,
-0.1350243, -0.03436672, -2.362633, 1, 1, 1, 1, 1,
-0.1311815, -1.141279, -4.28357, 1, 1, 1, 1, 1,
-0.1255769, -1.118239, -3.520371, 1, 1, 1, 1, 1,
-0.1218616, -0.9153279, -2.992506, 1, 1, 1, 1, 1,
-0.1213202, -0.1080551, -2.082187, 1, 1, 1, 1, 1,
-0.1203909, 1.19759, -0.2250513, 0, 0, 1, 1, 1,
-0.1197245, -1.931401, -4.746392, 1, 0, 0, 1, 1,
-0.1126493, 0.7612981, -0.5041213, 1, 0, 0, 1, 1,
-0.1109354, 0.8745835, 0.4728319, 1, 0, 0, 1, 1,
-0.1104685, -0.1585931, -1.075447, 1, 0, 0, 1, 1,
-0.09765945, 0.1223954, -1.391321, 1, 0, 0, 1, 1,
-0.09756313, 0.5059586, -0.1130149, 0, 0, 0, 1, 1,
-0.09565093, 1.874603, 0.7908977, 0, 0, 0, 1, 1,
-0.09516208, -1.495979, -3.341606, 0, 0, 0, 1, 1,
-0.09455483, -0.703977, -2.176808, 0, 0, 0, 1, 1,
-0.09452298, -0.9175315, -2.647472, 0, 0, 0, 1, 1,
-0.09390352, -0.6960883, -2.436207, 0, 0, 0, 1, 1,
-0.08523405, 1.845437, 1.210693, 0, 0, 0, 1, 1,
-0.08438836, 0.3326067, 0.3345293, 1, 1, 1, 1, 1,
-0.08375365, -1.553653, -2.110823, 1, 1, 1, 1, 1,
-0.07858758, -0.1436024, -2.06705, 1, 1, 1, 1, 1,
-0.07816764, -2.826073, -3.846774, 1, 1, 1, 1, 1,
-0.07656974, 0.06008943, -0.8305179, 1, 1, 1, 1, 1,
-0.06718722, -0.4922252, -2.595512, 1, 1, 1, 1, 1,
-0.06559499, -1.118829, -3.217974, 1, 1, 1, 1, 1,
-0.06553046, 0.8869581, 0.4553106, 1, 1, 1, 1, 1,
-0.0651933, 1.218517, 0.3521188, 1, 1, 1, 1, 1,
-0.06373672, 1.301137, -2.352436, 1, 1, 1, 1, 1,
-0.0614705, -1.021742, -4.083953, 1, 1, 1, 1, 1,
-0.06005371, -0.2032052, -2.532474, 1, 1, 1, 1, 1,
-0.0598319, -0.6824343, -2.709351, 1, 1, 1, 1, 1,
-0.05735221, 0.5440426, -0.777131, 1, 1, 1, 1, 1,
-0.05733249, 0.6956109, -1.204884, 1, 1, 1, 1, 1,
-0.05709082, -0.498033, -2.359012, 0, 0, 1, 1, 1,
-0.05587714, -0.155133, -2.706264, 1, 0, 0, 1, 1,
-0.05547066, -1.613191, -4.247568, 1, 0, 0, 1, 1,
-0.05437991, 0.448524, 0.3968545, 1, 0, 0, 1, 1,
-0.05094209, -0.5646383, -3.136023, 1, 0, 0, 1, 1,
-0.04313, -1.518296, -1.492365, 1, 0, 0, 1, 1,
-0.04291211, -1.156067, -4.214072, 0, 0, 0, 1, 1,
-0.04133122, -0.1289432, -2.333144, 0, 0, 0, 1, 1,
-0.04028654, 0.5907607, 0.846085, 0, 0, 0, 1, 1,
-0.0365892, -1.127624, -6.512374, 0, 0, 0, 1, 1,
-0.03589913, 0.2424646, -2.094742, 0, 0, 0, 1, 1,
-0.03519783, -0.5900173, -3.187603, 0, 0, 0, 1, 1,
-0.03413642, -2.00529, -3.597579, 0, 0, 0, 1, 1,
-0.03254522, -0.1905191, -2.537994, 1, 1, 1, 1, 1,
-0.03103715, 0.6327936, -1.838959, 1, 1, 1, 1, 1,
-0.03067927, -2.075606, -2.70325, 1, 1, 1, 1, 1,
-0.02943949, -0.6143384, -3.146771, 1, 1, 1, 1, 1,
-0.02838007, 1.321392, 0.3522348, 1, 1, 1, 1, 1,
-0.02436428, -0.4281052, -3.799372, 1, 1, 1, 1, 1,
-0.02046262, -1.779588, -3.402053, 1, 1, 1, 1, 1,
-0.01869304, -1.349904, -3.613173, 1, 1, 1, 1, 1,
-0.01037573, -1.768563, -2.1387, 1, 1, 1, 1, 1,
-0.00915889, 0.3467433, -0.09718527, 1, 1, 1, 1, 1,
-0.00833689, 0.1358175, 0.01059015, 1, 1, 1, 1, 1,
-0.006436288, 0.8611095, -2.173318, 1, 1, 1, 1, 1,
-0.003883632, -0.1045131, -1.601055, 1, 1, 1, 1, 1,
-0.001762182, 1.064471, 0.683486, 1, 1, 1, 1, 1,
-0.001719745, -0.6141097, -4.259305, 1, 1, 1, 1, 1,
0.007476896, -1.869397, 3.269588, 0, 0, 1, 1, 1,
0.01241935, -0.0437878, 4.447264, 1, 0, 0, 1, 1,
0.01491032, -0.5410846, 3.625584, 1, 0, 0, 1, 1,
0.01523182, 0.4943405, -1.951089, 1, 0, 0, 1, 1,
0.0186359, 0.5585591, -2.240179, 1, 0, 0, 1, 1,
0.02262078, -2.592979, 1.409996, 1, 0, 0, 1, 1,
0.02305225, 0.5477163, -0.8299614, 0, 0, 0, 1, 1,
0.02323416, 1.670023, 1.198718, 0, 0, 0, 1, 1,
0.02376217, 1.120625, -1.106392, 0, 0, 0, 1, 1,
0.02411089, 1.527765, -1.092238, 0, 0, 0, 1, 1,
0.02596448, -0.8826279, 4.863989, 0, 0, 0, 1, 1,
0.02633885, 0.1510492, 1.479315, 0, 0, 0, 1, 1,
0.02815654, 0.1566317, 0.6985346, 0, 0, 0, 1, 1,
0.02895448, -0.7322163, 3.519393, 1, 1, 1, 1, 1,
0.02965683, 0.2538496, 0.2114695, 1, 1, 1, 1, 1,
0.0319403, -1.44102, 3.972815, 1, 1, 1, 1, 1,
0.0363919, 0.09361213, 1.712172, 1, 1, 1, 1, 1,
0.03704757, 0.9677892, -1.64007, 1, 1, 1, 1, 1,
0.03908939, 2.746903, 0.3998844, 1, 1, 1, 1, 1,
0.03925833, -0.04065558, 2.973698, 1, 1, 1, 1, 1,
0.03968861, -0.06244645, 2.224694, 1, 1, 1, 1, 1,
0.03972413, -0.5011492, 4.258621, 1, 1, 1, 1, 1,
0.04067562, -0.2969341, 2.894288, 1, 1, 1, 1, 1,
0.04134924, -1.224825, 4.302181, 1, 1, 1, 1, 1,
0.0414641, 0.824147, 0.4033584, 1, 1, 1, 1, 1,
0.04826805, 0.8135411, 0.5250118, 1, 1, 1, 1, 1,
0.05265877, 1.725525, -1.440372, 1, 1, 1, 1, 1,
0.05463723, 0.211576, -0.9284269, 1, 1, 1, 1, 1,
0.05674708, -2.056531, 4.458575, 0, 0, 1, 1, 1,
0.05840736, 1.275437, -0.2131951, 1, 0, 0, 1, 1,
0.06187327, 0.02247906, 3.15587, 1, 0, 0, 1, 1,
0.06382016, 0.6105614, 0.5849935, 1, 0, 0, 1, 1,
0.07088909, 1.091807, 0.6352075, 1, 0, 0, 1, 1,
0.08019577, 0.5217042, -0.2981729, 1, 0, 0, 1, 1,
0.08042342, 2.067504, -0.2344721, 0, 0, 0, 1, 1,
0.08399406, 2.343437, 0.258955, 0, 0, 0, 1, 1,
0.08564975, -1.567938, 3.197179, 0, 0, 0, 1, 1,
0.08769587, -0.3279686, 5.339216, 0, 0, 0, 1, 1,
0.08938448, -0.1523726, 3.657718, 0, 0, 0, 1, 1,
0.09225336, -0.2388142, 0.3100846, 0, 0, 0, 1, 1,
0.09714286, 2.120873, 0.2061309, 0, 0, 0, 1, 1,
0.09788541, 0.2067812, -0.2586013, 1, 1, 1, 1, 1,
0.09834082, -1.355845, 3.629119, 1, 1, 1, 1, 1,
0.09862877, -0.03133819, 2.915039, 1, 1, 1, 1, 1,
0.1001323, -1.426795, 1.786379, 1, 1, 1, 1, 1,
0.1085688, 3.239042, -0.5689214, 1, 1, 1, 1, 1,
0.1089856, 0.5358062, -0.715993, 1, 1, 1, 1, 1,
0.1124231, -0.9759028, 4.678611, 1, 1, 1, 1, 1,
0.1188795, -1.924061, 1.220104, 1, 1, 1, 1, 1,
0.1230509, 1.727614, 0.2740581, 1, 1, 1, 1, 1,
0.1243018, 1.797787, 1.025017, 1, 1, 1, 1, 1,
0.1259227, 0.1924356, 0.7494211, 1, 1, 1, 1, 1,
0.1316451, -0.1198773, 2.028144, 1, 1, 1, 1, 1,
0.1332984, 0.662864, -0.09895688, 1, 1, 1, 1, 1,
0.1338221, -0.3948999, 2.764447, 1, 1, 1, 1, 1,
0.1398697, -0.2542928, 3.259618, 1, 1, 1, 1, 1,
0.140634, -1.465171, 3.281875, 0, 0, 1, 1, 1,
0.141624, -0.3226749, 2.985791, 1, 0, 0, 1, 1,
0.1465498, -0.6960746, 4.095618, 1, 0, 0, 1, 1,
0.1466396, -0.1982372, 1.5195, 1, 0, 0, 1, 1,
0.1469171, -0.5960088, 2.391263, 1, 0, 0, 1, 1,
0.1472435, -0.07599829, 1.496829, 1, 0, 0, 1, 1,
0.1572455, -0.3435644, 4.298798, 0, 0, 0, 1, 1,
0.158186, -0.2440552, 2.662895, 0, 0, 0, 1, 1,
0.1586955, -0.8544008, 1.753711, 0, 0, 0, 1, 1,
0.1600002, -1.441144, 2.360668, 0, 0, 0, 1, 1,
0.1601308, -0.7105388, 3.64423, 0, 0, 0, 1, 1,
0.1631673, -0.06303471, 1.950263, 0, 0, 0, 1, 1,
0.1687067, 0.8818196, -0.359019, 0, 0, 0, 1, 1,
0.1690441, 0.9095207, -0.8356406, 1, 1, 1, 1, 1,
0.1713908, -0.06589963, 1.479436, 1, 1, 1, 1, 1,
0.1728161, 0.7652466, 0.2671306, 1, 1, 1, 1, 1,
0.174039, 1.123854, 0.2456947, 1, 1, 1, 1, 1,
0.1765009, -0.08217764, 0.9429373, 1, 1, 1, 1, 1,
0.1838465, -1.273232, 3.463376, 1, 1, 1, 1, 1,
0.1877556, -0.3535526, 1.989599, 1, 1, 1, 1, 1,
0.1936669, 1.202497, -0.3147999, 1, 1, 1, 1, 1,
0.1937483, -0.6000957, 3.505439, 1, 1, 1, 1, 1,
0.1957747, -0.7529125, 3.349888, 1, 1, 1, 1, 1,
0.1992648, -0.6211405, 1.800448, 1, 1, 1, 1, 1,
0.2013717, -0.6994635, 3.705088, 1, 1, 1, 1, 1,
0.2017739, -0.5045337, 2.426665, 1, 1, 1, 1, 1,
0.2020587, 1.663738, 0.7519749, 1, 1, 1, 1, 1,
0.2026205, -0.1502201, 1.595005, 1, 1, 1, 1, 1,
0.2035663, 1.349943, 0.3407415, 0, 0, 1, 1, 1,
0.2046519, 1.881176, -1.783511, 1, 0, 0, 1, 1,
0.2099207, 0.7205363, 1.375741, 1, 0, 0, 1, 1,
0.2188954, 0.2828971, 0.9502885, 1, 0, 0, 1, 1,
0.2191256, 0.4974692, 0.1873624, 1, 0, 0, 1, 1,
0.220837, 0.09712482, 1.58821, 1, 0, 0, 1, 1,
0.2236302, 1.965956, -1.361723, 0, 0, 0, 1, 1,
0.2236435, -0.841672, 1.862772, 0, 0, 0, 1, 1,
0.2249841, -0.03526439, 1.02283, 0, 0, 0, 1, 1,
0.227754, -0.8379467, 3.661048, 0, 0, 0, 1, 1,
0.2284629, -0.5588934, 2.389324, 0, 0, 0, 1, 1,
0.2332255, 0.5719587, 0.499244, 0, 0, 0, 1, 1,
0.2347483, -0.5798934, 2.110682, 0, 0, 0, 1, 1,
0.2396851, 0.2218106, 0.8996119, 1, 1, 1, 1, 1,
0.2409573, -0.3946722, 2.007718, 1, 1, 1, 1, 1,
0.2427365, 0.3163092, 1.418402, 1, 1, 1, 1, 1,
0.2432291, 1.283071, 0.4341848, 1, 1, 1, 1, 1,
0.2450609, 0.4378874, 1.551256, 1, 1, 1, 1, 1,
0.2451883, -0.0799479, 1.695514, 1, 1, 1, 1, 1,
0.2453309, 0.2952772, 1.262031, 1, 1, 1, 1, 1,
0.250498, 0.0897043, 2.35353, 1, 1, 1, 1, 1,
0.2507083, 0.3786121, 0.8849602, 1, 1, 1, 1, 1,
0.2565027, 1.423027, -0.6090368, 1, 1, 1, 1, 1,
0.2599958, -0.4418782, 2.537863, 1, 1, 1, 1, 1,
0.2609671, -0.3432276, 0.9426365, 1, 1, 1, 1, 1,
0.2631261, 0.8712181, 1.644734, 1, 1, 1, 1, 1,
0.2639472, 0.2743935, 1.228099, 1, 1, 1, 1, 1,
0.2698489, -0.8363256, 2.799414, 1, 1, 1, 1, 1,
0.2702794, 0.3010571, 3.045985, 0, 0, 1, 1, 1,
0.2720706, -0.1063977, 0.9022726, 1, 0, 0, 1, 1,
0.2744999, 1.191305, -0.1353819, 1, 0, 0, 1, 1,
0.2746885, 0.7724429, -0.8027672, 1, 0, 0, 1, 1,
0.2907536, 1.777396, 0.6390919, 1, 0, 0, 1, 1,
0.2918217, 1.189656, -0.7932395, 1, 0, 0, 1, 1,
0.2928955, -0.3546804, 1.740603, 0, 0, 0, 1, 1,
0.2936509, 1.455747, 0.9043683, 0, 0, 0, 1, 1,
0.2942592, -1.457208, 2.785899, 0, 0, 0, 1, 1,
0.2943161, -0.6201077, 1.919891, 0, 0, 0, 1, 1,
0.2965611, 0.1727001, -0.05696746, 0, 0, 0, 1, 1,
0.296837, 0.4130937, -0.1249675, 0, 0, 0, 1, 1,
0.2977107, 0.9732992, -0.3730832, 0, 0, 0, 1, 1,
0.2979461, -1.057277, 2.415505, 1, 1, 1, 1, 1,
0.2989755, 1.197335, 0.7813684, 1, 1, 1, 1, 1,
0.3015774, -1.130342, 2.834478, 1, 1, 1, 1, 1,
0.3025563, 0.03029021, 1.298341, 1, 1, 1, 1, 1,
0.3094244, -1.893268, 3.788739, 1, 1, 1, 1, 1,
0.3105125, -1.091815, 4.411684, 1, 1, 1, 1, 1,
0.3148549, 1.36368, 0.210942, 1, 1, 1, 1, 1,
0.3173926, 1.088842, -0.1224862, 1, 1, 1, 1, 1,
0.3221573, -0.03523631, 2.379706, 1, 1, 1, 1, 1,
0.3291867, 0.4411222, 1.773488, 1, 1, 1, 1, 1,
0.3297553, -0.3196945, 0.7030643, 1, 1, 1, 1, 1,
0.3315572, 0.2876547, 0.8929181, 1, 1, 1, 1, 1,
0.3332759, 1.586317, 0.002216683, 1, 1, 1, 1, 1,
0.3354715, 0.2828928, 3.196104, 1, 1, 1, 1, 1,
0.3402535, 1.000865, 0.496762, 1, 1, 1, 1, 1,
0.3427574, -1.645381, 1.465737, 0, 0, 1, 1, 1,
0.348195, 2.037274, 1.571085, 1, 0, 0, 1, 1,
0.3598418, 0.6312592, 0.4248626, 1, 0, 0, 1, 1,
0.3630938, 0.1713602, 1.672043, 1, 0, 0, 1, 1,
0.3639784, -0.5784969, 2.815426, 1, 0, 0, 1, 1,
0.3654518, -0.4175212, 2.381394, 1, 0, 0, 1, 1,
0.3663185, 1.015363, 1.001855, 0, 0, 0, 1, 1,
0.367808, -0.4334688, 2.02731, 0, 0, 0, 1, 1,
0.3682175, 0.07253885, 2.487989, 0, 0, 0, 1, 1,
0.3775768, -0.8308784, 1.808352, 0, 0, 0, 1, 1,
0.3800825, 0.6205065, 0.6554168, 0, 0, 0, 1, 1,
0.3830065, 0.7211781, -0.1818918, 0, 0, 0, 1, 1,
0.3830253, -0.1158737, 2.347803, 0, 0, 0, 1, 1,
0.3875003, 1.266755, 2.767709, 1, 1, 1, 1, 1,
0.3921371, 0.2334016, 1.514357, 1, 1, 1, 1, 1,
0.3950664, -0.6143262, 2.653993, 1, 1, 1, 1, 1,
0.3970314, -0.1462328, 0.7357466, 1, 1, 1, 1, 1,
0.3981925, 0.8263066, 3.070074, 1, 1, 1, 1, 1,
0.400822, -0.7598122, 2.249368, 1, 1, 1, 1, 1,
0.4019755, 0.1555307, 0.9468617, 1, 1, 1, 1, 1,
0.4056527, -0.6032115, 3.581333, 1, 1, 1, 1, 1,
0.4092203, 0.1717759, 0.7532689, 1, 1, 1, 1, 1,
0.4096164, 2.36843, 8.631831e-05, 1, 1, 1, 1, 1,
0.4160058, 1.010186, 1.214101, 1, 1, 1, 1, 1,
0.4245919, -0.6292107, 5.113527, 1, 1, 1, 1, 1,
0.4248329, 0.514107, 0.3197646, 1, 1, 1, 1, 1,
0.4251256, -0.2166589, 2.775637, 1, 1, 1, 1, 1,
0.4260656, 1.379264, 0.9581947, 1, 1, 1, 1, 1,
0.4281648, 1.410751, -0.3163342, 0, 0, 1, 1, 1,
0.4460817, 0.6298178, 0.02456375, 1, 0, 0, 1, 1,
0.4484766, -0.4155091, 3.289011, 1, 0, 0, 1, 1,
0.452467, 0.05193658, 1.461275, 1, 0, 0, 1, 1,
0.4543036, -1.259132, 2.626672, 1, 0, 0, 1, 1,
0.4563034, 1.957551, -1.067864, 1, 0, 0, 1, 1,
0.4566382, 1.737744, 1.092055, 0, 0, 0, 1, 1,
0.4576299, -0.420245, 1.260209, 0, 0, 0, 1, 1,
0.4637529, 0.5558386, -0.1412082, 0, 0, 0, 1, 1,
0.4638322, 0.1283296, 0.03586217, 0, 0, 0, 1, 1,
0.4724132, -0.6263773, 3.037153, 0, 0, 0, 1, 1,
0.4819746, -0.5724912, 2.013337, 0, 0, 0, 1, 1,
0.4821025, -0.5623082, 3.034068, 0, 0, 0, 1, 1,
0.486036, 0.3090247, 2.884561, 1, 1, 1, 1, 1,
0.4867649, 0.7825745, 0.6896689, 1, 1, 1, 1, 1,
0.4883828, 0.9373683, 0.4207375, 1, 1, 1, 1, 1,
0.4934345, -0.174551, 2.707941, 1, 1, 1, 1, 1,
0.5012913, 0.1717789, 0.9733394, 1, 1, 1, 1, 1,
0.5066438, -0.619388, 1.808495, 1, 1, 1, 1, 1,
0.5077741, -0.1267375, 3.048732, 1, 1, 1, 1, 1,
0.5171025, -1.127148, 3.98749, 1, 1, 1, 1, 1,
0.5192626, 2.036489, 0.297867, 1, 1, 1, 1, 1,
0.5238559, -1.385505, 3.484366, 1, 1, 1, 1, 1,
0.5257457, -0.1205333, 1.962277, 1, 1, 1, 1, 1,
0.5270203, -1.044505, 2.412421, 1, 1, 1, 1, 1,
0.5296147, 0.7413346, 0.8659633, 1, 1, 1, 1, 1,
0.5316449, 0.1870716, 0.8241365, 1, 1, 1, 1, 1,
0.5363464, -0.8067684, 3.524459, 1, 1, 1, 1, 1,
0.5472151, -0.4468324, 1.079267, 0, 0, 1, 1, 1,
0.5498959, 1.813244, 0.4780014, 1, 0, 0, 1, 1,
0.5543823, -1.251319, 3.952281, 1, 0, 0, 1, 1,
0.5579895, 0.154899, 2.227762, 1, 0, 0, 1, 1,
0.5585554, 0.5458968, 0.1840028, 1, 0, 0, 1, 1,
0.559964, -1.185446, 4.182061, 1, 0, 0, 1, 1,
0.5609693, 0.5962048, -0.9060073, 0, 0, 0, 1, 1,
0.5647653, -0.06771516, 1.318536, 0, 0, 0, 1, 1,
0.5679874, 0.5126773, -0.05958595, 0, 0, 0, 1, 1,
0.5708426, -0.5628523, 1.784296, 0, 0, 0, 1, 1,
0.5774767, 0.01403415, 2.975036, 0, 0, 0, 1, 1,
0.581616, -0.3752399, 2.54553, 0, 0, 0, 1, 1,
0.5834349, -0.2140892, 2.758517, 0, 0, 0, 1, 1,
0.5838974, 1.549326, 0.3874247, 1, 1, 1, 1, 1,
0.5849401, -0.4019315, 0.8933916, 1, 1, 1, 1, 1,
0.5988786, -0.02674456, 1.836389, 1, 1, 1, 1, 1,
0.6025788, -2.14592, 1.936931, 1, 1, 1, 1, 1,
0.6041155, 0.793426, -1.417645, 1, 1, 1, 1, 1,
0.604295, -1.13302, 1.636912, 1, 1, 1, 1, 1,
0.6050896, 0.1680107, 3.273976, 1, 1, 1, 1, 1,
0.6132175, 1.231406, -0.551343, 1, 1, 1, 1, 1,
0.6140769, -1.148121, 2.648879, 1, 1, 1, 1, 1,
0.615482, -0.2385181, 3.342233, 1, 1, 1, 1, 1,
0.6216893, 0.1328645, 1.522923, 1, 1, 1, 1, 1,
0.6224961, 0.2233391, 2.312722, 1, 1, 1, 1, 1,
0.625282, -1.256308, 1.534433, 1, 1, 1, 1, 1,
0.6259176, -0.681156, 2.690027, 1, 1, 1, 1, 1,
0.626941, 1.535746, 1.018895, 1, 1, 1, 1, 1,
0.6300281, 1.256878, 1.021475, 0, 0, 1, 1, 1,
0.6306897, 1.936299, 0.4984096, 1, 0, 0, 1, 1,
0.6341712, -0.604624, 4.243898, 1, 0, 0, 1, 1,
0.6347172, -0.02545243, -0.4004563, 1, 0, 0, 1, 1,
0.6471283, 0.3054167, 1.731514, 1, 0, 0, 1, 1,
0.6544564, 0.4039164, 0.6691095, 1, 0, 0, 1, 1,
0.6556994, 0.1435066, 1.793414, 0, 0, 0, 1, 1,
0.6575829, -0.3443218, 2.021766, 0, 0, 0, 1, 1,
0.6579177, 0.3949661, 1.297851, 0, 0, 0, 1, 1,
0.6592772, 0.9520613, 1.007371, 0, 0, 0, 1, 1,
0.6638827, -0.7916526, 2.040173, 0, 0, 0, 1, 1,
0.6728243, -2.337416, 2.893383, 0, 0, 0, 1, 1,
0.6728529, -0.3945271, 1.799797, 0, 0, 0, 1, 1,
0.6751873, 0.04553167, 2.724067, 1, 1, 1, 1, 1,
0.6783448, 0.122669, 2.749743, 1, 1, 1, 1, 1,
0.6825721, -0.1122681, 1.043821, 1, 1, 1, 1, 1,
0.6833729, -0.4847009, 2.497045, 1, 1, 1, 1, 1,
0.685694, 0.3463575, 2.258941, 1, 1, 1, 1, 1,
0.6931074, 0.3130513, 1.910036, 1, 1, 1, 1, 1,
0.6951247, -0.9002296, 2.254354, 1, 1, 1, 1, 1,
0.695527, -0.3407534, 2.335073, 1, 1, 1, 1, 1,
0.6990325, -0.112412, 1.12903, 1, 1, 1, 1, 1,
0.6993153, 1.138376, 1.018911, 1, 1, 1, 1, 1,
0.6995796, -0.03876384, 2.118064, 1, 1, 1, 1, 1,
0.7006273, -1.296939, 3.134522, 1, 1, 1, 1, 1,
0.703586, 0.2584409, 2.653526, 1, 1, 1, 1, 1,
0.710622, 0.06645977, 2.153568, 1, 1, 1, 1, 1,
0.7114987, 0.6018955, 1.017763, 1, 1, 1, 1, 1,
0.713361, -0.02257234, 3.318847, 0, 0, 1, 1, 1,
0.7135947, -1.635558, 2.203099, 1, 0, 0, 1, 1,
0.7149494, 1.592025, 0.9855141, 1, 0, 0, 1, 1,
0.7164856, 0.8132248, 1.29821, 1, 0, 0, 1, 1,
0.7174189, -0.06904782, 0.2744495, 1, 0, 0, 1, 1,
0.7213385, -0.06233935, 0.7277075, 1, 0, 0, 1, 1,
0.7239491, -0.4900769, 1.968166, 0, 0, 0, 1, 1,
0.7322814, -0.3860645, 1.45418, 0, 0, 0, 1, 1,
0.7323769, 0.938814, 0.1447616, 0, 0, 0, 1, 1,
0.7372659, -0.1709818, 1.340218, 0, 0, 0, 1, 1,
0.7392784, -0.8499153, 1.883236, 0, 0, 0, 1, 1,
0.743634, 0.06998349, 2.433624, 0, 0, 0, 1, 1,
0.7455488, -0.3517919, 2.468692, 0, 0, 0, 1, 1,
0.7493866, 0.7012024, 1.607057, 1, 1, 1, 1, 1,
0.7508656, 0.05481855, 1.5213, 1, 1, 1, 1, 1,
0.7513103, -0.5764359, 1.977275, 1, 1, 1, 1, 1,
0.7543413, 1.816216, 0.7965819, 1, 1, 1, 1, 1,
0.7545844, 0.07525537, -0.3815644, 1, 1, 1, 1, 1,
0.7558305, -0.4566546, 2.085117, 1, 1, 1, 1, 1,
0.757942, -1.192192, 1.860589, 1, 1, 1, 1, 1,
0.7637328, -0.7763578, 1.044363, 1, 1, 1, 1, 1,
0.7799683, 0.6055101, -0.05510918, 1, 1, 1, 1, 1,
0.7958734, 0.8092946, -0.494035, 1, 1, 1, 1, 1,
0.7958896, 2.189535, 0.2614168, 1, 1, 1, 1, 1,
0.7959921, -1.185701, 3.203005, 1, 1, 1, 1, 1,
0.7982906, -0.2745535, 2.497914, 1, 1, 1, 1, 1,
0.7985596, -2.315002, 2.473874, 1, 1, 1, 1, 1,
0.8107204, -0.05672191, 2.009958, 1, 1, 1, 1, 1,
0.8184664, -0.1157717, 3.497106, 0, 0, 1, 1, 1,
0.8239681, -1.284494, 2.146374, 1, 0, 0, 1, 1,
0.8307926, -0.4183326, 2.650312, 1, 0, 0, 1, 1,
0.8390669, 0.4788534, 0.8727435, 1, 0, 0, 1, 1,
0.8490997, 0.5398518, -0.04123967, 1, 0, 0, 1, 1,
0.8496305, 0.3745477, 2.682418, 1, 0, 0, 1, 1,
0.8519716, -0.1599738, -0.6372488, 0, 0, 0, 1, 1,
0.8525257, -1.246507, 0.8955144, 0, 0, 0, 1, 1,
0.8561858, 0.9600677, 2.190878, 0, 0, 0, 1, 1,
0.8582796, -0.6593603, 1.470406, 0, 0, 0, 1, 1,
0.8595045, 1.254707, -0.473435, 0, 0, 0, 1, 1,
0.8629974, 1.159469, -0.0148638, 0, 0, 0, 1, 1,
0.8630307, 0.1033771, 1.433362, 0, 0, 0, 1, 1,
0.8684392, 0.04815285, 3.265135, 1, 1, 1, 1, 1,
0.8699886, -1.484297, 2.36878, 1, 1, 1, 1, 1,
0.872488, -0.5791884, 3.187859, 1, 1, 1, 1, 1,
0.8736547, 1.506284, -0.3755515, 1, 1, 1, 1, 1,
0.877553, -1.878229, 1.844412, 1, 1, 1, 1, 1,
0.879985, 1.508562, 2.25398, 1, 1, 1, 1, 1,
0.8842052, -0.241167, 2.782566, 1, 1, 1, 1, 1,
0.8893138, -0.4278397, 2.464202, 1, 1, 1, 1, 1,
0.8900381, -0.03048449, 1.338382, 1, 1, 1, 1, 1,
0.8983847, -0.0057256, 1.13261, 1, 1, 1, 1, 1,
0.8999295, -0.9565113, 2.299796, 1, 1, 1, 1, 1,
0.9001281, -0.8339574, 2.313553, 1, 1, 1, 1, 1,
0.9001492, -0.7172018, 2.780299, 1, 1, 1, 1, 1,
0.9004187, -2.21692, 2.240836, 1, 1, 1, 1, 1,
0.9097878, -1.138811, 1.863055, 1, 1, 1, 1, 1,
0.911129, 1.41572, 1.137872, 0, 0, 1, 1, 1,
0.913168, -0.2514418, 2.614246, 1, 0, 0, 1, 1,
0.9148301, 0.8836425, 2.502543, 1, 0, 0, 1, 1,
0.9164581, -0.6527513, 3.004207, 1, 0, 0, 1, 1,
0.9205441, -0.06443592, 1.03872, 1, 0, 0, 1, 1,
0.9216877, -0.7692183, 2.230521, 1, 0, 0, 1, 1,
0.9256499, 0.4585505, 0.4105684, 0, 0, 0, 1, 1,
0.929126, -0.2700541, 1.459448, 0, 0, 0, 1, 1,
0.9323448, -2.120899, 0.8022867, 0, 0, 0, 1, 1,
0.9379142, -0.371931, 2.330804, 0, 0, 0, 1, 1,
0.9397873, 0.621777, -0.1473475, 0, 0, 0, 1, 1,
0.9447659, -0.4153365, 2.456919, 0, 0, 0, 1, 1,
0.946477, 0.5845755, 1.236486, 0, 0, 0, 1, 1,
0.9545116, 0.4128943, 1.498797, 1, 1, 1, 1, 1,
0.967176, -0.1077229, 2.369667, 1, 1, 1, 1, 1,
0.9737558, 1.027722, 1.153099, 1, 1, 1, 1, 1,
0.9761731, -0.398937, 1.784968, 1, 1, 1, 1, 1,
0.9771371, -2.244843, 3.021603, 1, 1, 1, 1, 1,
0.9810714, -1.501713, 2.349467, 1, 1, 1, 1, 1,
0.9831631, 1.057282, 0.8672891, 1, 1, 1, 1, 1,
0.983265, 0.2928304, 0.6129703, 1, 1, 1, 1, 1,
0.9863391, 1.278551, 1.381752, 1, 1, 1, 1, 1,
0.9867183, -0.2824124, 0.7148293, 1, 1, 1, 1, 1,
0.9924339, 0.7400976, 2.391595, 1, 1, 1, 1, 1,
1.001006, 0.01371816, 2.437926, 1, 1, 1, 1, 1,
1.002247, 0.584989, 1.015644, 1, 1, 1, 1, 1,
1.003635, 0.9583886, 1.146192, 1, 1, 1, 1, 1,
1.01567, 1.970851, 0.7653262, 1, 1, 1, 1, 1,
1.021683, 1.093805, 0.331758, 0, 0, 1, 1, 1,
1.027753, -1.499793, 2.292669, 1, 0, 0, 1, 1,
1.027845, -0.4144199, 3.171809, 1, 0, 0, 1, 1,
1.032511, 1.43895, 0.2313503, 1, 0, 0, 1, 1,
1.035952, 0.03851581, 0.8129948, 1, 0, 0, 1, 1,
1.039267, 0.7641844, 0.3357817, 1, 0, 0, 1, 1,
1.040696, 1.593951, 0.1058349, 0, 0, 0, 1, 1,
1.050074, -0.1991388, 1.59316, 0, 0, 0, 1, 1,
1.054058, -1.490835, 3.691549, 0, 0, 0, 1, 1,
1.062317, -0.3192227, 1.616852, 0, 0, 0, 1, 1,
1.065537, -0.198879, 1.981708, 0, 0, 0, 1, 1,
1.065954, 1.132064, 0.3256596, 0, 0, 0, 1, 1,
1.073229, 0.2258583, 0.8480307, 0, 0, 0, 1, 1,
1.075431, -0.3334776, 1.431289, 1, 1, 1, 1, 1,
1.083258, 0.06444327, 2.255469, 1, 1, 1, 1, 1,
1.084162, -1.363631, 2.360293, 1, 1, 1, 1, 1,
1.097687, 1.541495, 2.692467, 1, 1, 1, 1, 1,
1.103109, 0.4666739, 0.6220124, 1, 1, 1, 1, 1,
1.104108, 1.63145, 1.164179, 1, 1, 1, 1, 1,
1.104137, -1.371019, 2.709535, 1, 1, 1, 1, 1,
1.116176, -0.9041197, 2.397115, 1, 1, 1, 1, 1,
1.116447, -0.3845681, 4.345842, 1, 1, 1, 1, 1,
1.117851, 0.6232106, 0.6747876, 1, 1, 1, 1, 1,
1.11903, -0.8563128, 1.495613, 1, 1, 1, 1, 1,
1.121201, -0.08328836, 2.850277, 1, 1, 1, 1, 1,
1.121677, -0.9793846, 1.861727, 1, 1, 1, 1, 1,
1.128165, -1.187242, 2.184265, 1, 1, 1, 1, 1,
1.129358, 1.189292, 1.153074, 1, 1, 1, 1, 1,
1.130414, 0.7215445, 2.440472, 0, 0, 1, 1, 1,
1.134011, -2.10845, 3.441726, 1, 0, 0, 1, 1,
1.140118, 0.4880542, 0.3146309, 1, 0, 0, 1, 1,
1.143321, -0.6191089, 1.33374, 1, 0, 0, 1, 1,
1.15024, 1.753469, -0.1052763, 1, 0, 0, 1, 1,
1.151824, -0.6516448, 1.958474, 1, 0, 0, 1, 1,
1.156815, -0.1017562, 2.493248, 0, 0, 0, 1, 1,
1.158377, 0.7251046, 0.5286239, 0, 0, 0, 1, 1,
1.160911, -0.7580419, 3.421343, 0, 0, 0, 1, 1,
1.166268, 0.8366044, 0.9762385, 0, 0, 0, 1, 1,
1.168503, -0.2949108, 2.260849, 0, 0, 0, 1, 1,
1.17327, -0.3366278, 2.908803, 0, 0, 0, 1, 1,
1.185518, -2.157855, 1.363935, 0, 0, 0, 1, 1,
1.196302, -0.1647228, 0.7541489, 1, 1, 1, 1, 1,
1.197336, 0.1552737, -0.1583569, 1, 1, 1, 1, 1,
1.199562, 1.810155, 0.2514703, 1, 1, 1, 1, 1,
1.216052, -0.5009023, 1.50484, 1, 1, 1, 1, 1,
1.223472, -1.716749, 2.558537, 1, 1, 1, 1, 1,
1.23908, -0.1491624, 2.133951, 1, 1, 1, 1, 1,
1.256151, 0.5671547, 2.214685, 1, 1, 1, 1, 1,
1.260496, 0.5166809, 0.5416653, 1, 1, 1, 1, 1,
1.262232, -0.2170002, 1.53338, 1, 1, 1, 1, 1,
1.272344, -0.2848825, 2.773728, 1, 1, 1, 1, 1,
1.273608, -0.7070169, 1.018613, 1, 1, 1, 1, 1,
1.291218, 1.456612, 1.734769, 1, 1, 1, 1, 1,
1.291476, 1.249218, 2.335901, 1, 1, 1, 1, 1,
1.299241, -1.582556, 3.59605, 1, 1, 1, 1, 1,
1.303268, -0.5735431, 2.394198, 1, 1, 1, 1, 1,
1.304998, 0.4079642, 2.96232, 0, 0, 1, 1, 1,
1.309122, -1.071811, 1.478456, 1, 0, 0, 1, 1,
1.316129, 0.651318, 2.923259, 1, 0, 0, 1, 1,
1.321888, 0.3808433, 1.867261, 1, 0, 0, 1, 1,
1.322238, -0.6598587, 2.713382, 1, 0, 0, 1, 1,
1.322254, -0.7449194, 0.8781119, 1, 0, 0, 1, 1,
1.328099, 0.935021, 1.846111, 0, 0, 0, 1, 1,
1.329479, 1.385904, 0.3787598, 0, 0, 0, 1, 1,
1.335224, -0.7313057, 4.110214, 0, 0, 0, 1, 1,
1.335554, -0.0002094341, 2.19617, 0, 0, 0, 1, 1,
1.338492, -0.6095381, 2.115748, 0, 0, 0, 1, 1,
1.34502, -0.3473268, 3.139525, 0, 0, 0, 1, 1,
1.34814, -1.188843, 2.133727, 0, 0, 0, 1, 1,
1.348598, -1.416636, 2.691798, 1, 1, 1, 1, 1,
1.358389, 1.062101, -0.4884462, 1, 1, 1, 1, 1,
1.362997, -0.1066553, 3.774386, 1, 1, 1, 1, 1,
1.365393, -0.3034582, 2.013979, 1, 1, 1, 1, 1,
1.369773, -0.971315, 0.6977065, 1, 1, 1, 1, 1,
1.380312, 0.6073661, 0.7781866, 1, 1, 1, 1, 1,
1.384684, -0.5563542, 3.347841, 1, 1, 1, 1, 1,
1.395751, -1.255498, 1.969903, 1, 1, 1, 1, 1,
1.396018, 1.711869, 1.170843, 1, 1, 1, 1, 1,
1.39958, -1.067324, 3.026426, 1, 1, 1, 1, 1,
1.400213, 1.017129, 0.7821397, 1, 1, 1, 1, 1,
1.405058, -0.4342299, 2.84712, 1, 1, 1, 1, 1,
1.433586, 0.3197117, 0.9352363, 1, 1, 1, 1, 1,
1.437059, 1.000169, 1.850885, 1, 1, 1, 1, 1,
1.439424, -1.368653, 0.3330068, 1, 1, 1, 1, 1,
1.442423, -0.1341412, 2.870508, 0, 0, 1, 1, 1,
1.442778, -0.07717399, 2.630831, 1, 0, 0, 1, 1,
1.447471, -1.876289, 3.523825, 1, 0, 0, 1, 1,
1.44986, -0.4899985, 1.226937, 1, 0, 0, 1, 1,
1.451292, -0.7479738, 2.357556, 1, 0, 0, 1, 1,
1.455337, -1.491942, 2.461587, 1, 0, 0, 1, 1,
1.464111, 1.086559, -0.5130418, 0, 0, 0, 1, 1,
1.467694, -0.5600409, 2.440477, 0, 0, 0, 1, 1,
1.470727, 0.9246497, 0.9442868, 0, 0, 0, 1, 1,
1.482924, -2.75822, 4.706116, 0, 0, 0, 1, 1,
1.499129, -0.7191556, 0.9105272, 0, 0, 0, 1, 1,
1.51063, 1.357412, 0.7006597, 0, 0, 0, 1, 1,
1.513688, -0.9912615, 3.064596, 0, 0, 0, 1, 1,
1.514457, 0.1735289, 2.214016, 1, 1, 1, 1, 1,
1.517054, -0.09404019, 2.776084, 1, 1, 1, 1, 1,
1.535811, 0.9076487, 1.011388, 1, 1, 1, 1, 1,
1.537494, -0.1919003, 1.329029, 1, 1, 1, 1, 1,
1.546535, 1.002124, 0.8762489, 1, 1, 1, 1, 1,
1.563612, -1.756797, 0.7734871, 1, 1, 1, 1, 1,
1.573037, -0.7103951, 2.442956, 1, 1, 1, 1, 1,
1.57921, 0.9616182, 0.1833035, 1, 1, 1, 1, 1,
1.582775, -1.547569, 1.840222, 1, 1, 1, 1, 1,
1.608062, -0.2942655, 2.015622, 1, 1, 1, 1, 1,
1.608885, 0.9667414, 2.431116, 1, 1, 1, 1, 1,
1.61479, -1.492762, 1.997906, 1, 1, 1, 1, 1,
1.624894, -2.050337, -0.8137949, 1, 1, 1, 1, 1,
1.627506, 0.4822241, 0.7149739, 1, 1, 1, 1, 1,
1.638945, 0.1527076, 2.00225, 1, 1, 1, 1, 1,
1.655792, -0.7358181, 3.330147, 0, 0, 1, 1, 1,
1.662339, 0.9916469, 1.191245, 1, 0, 0, 1, 1,
1.677498, -0.5819668, 1.924787, 1, 0, 0, 1, 1,
1.684993, -0.02260171, 1.520691, 1, 0, 0, 1, 1,
1.711067, 0.7035276, 0.9848601, 1, 0, 0, 1, 1,
1.712595, 0.4636068, 1.530218, 1, 0, 0, 1, 1,
1.712701, -1.5078, 4.931536, 0, 0, 0, 1, 1,
1.735033, -2.007888, 1.511222, 0, 0, 0, 1, 1,
1.735422, 0.606558, 2.84332, 0, 0, 0, 1, 1,
1.744016, -1.449602, 2.116747, 0, 0, 0, 1, 1,
1.757112, 0.5814418, 2.332516, 0, 0, 0, 1, 1,
1.769797, -1.394982, 2.711836, 0, 0, 0, 1, 1,
1.79266, -1.13524, 4.575799, 0, 0, 0, 1, 1,
1.79659, -1.229679, 3.099438, 1, 1, 1, 1, 1,
1.821086, -1.670142, 4.379005, 1, 1, 1, 1, 1,
1.836142, -0.9686435, 2.463726, 1, 1, 1, 1, 1,
1.841082, -0.6426228, 2.510168, 1, 1, 1, 1, 1,
1.888548, 0.9302034, 0.1075088, 1, 1, 1, 1, 1,
1.913565, 0.4015576, 1.909869, 1, 1, 1, 1, 1,
1.921299, 0.6226315, 2.442037, 1, 1, 1, 1, 1,
1.984003, 0.5633628, 0.7046971, 1, 1, 1, 1, 1,
2.058527, 1.951338, 0.5174689, 1, 1, 1, 1, 1,
2.081487, 3.285856, -0.5526052, 1, 1, 1, 1, 1,
2.103139, 1.594079, -0.8147147, 1, 1, 1, 1, 1,
2.121585, 0.8417579, 1.694351, 1, 1, 1, 1, 1,
2.20799, -0.1734447, -0.1927655, 1, 1, 1, 1, 1,
2.232277, -1.007271, 2.548075, 1, 1, 1, 1, 1,
2.244984, 1.311123, 2.361527, 1, 1, 1, 1, 1,
2.249709, 1.48883, 2.749095, 0, 0, 1, 1, 1,
2.280453, -0.3823175, 3.548518, 1, 0, 0, 1, 1,
2.300819, 0.1244608, 2.717661, 1, 0, 0, 1, 1,
2.305581, 1.746929, 1.639523, 1, 0, 0, 1, 1,
2.321661, 0.8742877, 0.3705086, 1, 0, 0, 1, 1,
2.331297, -1.376206, 4.281871, 1, 0, 0, 1, 1,
2.339412, 0.3326042, 1.901642, 0, 0, 0, 1, 1,
2.359767, 1.417452, 0.04798324, 0, 0, 0, 1, 1,
2.402525, -0.05205104, 0.4854442, 0, 0, 0, 1, 1,
2.560543, 1.153982, 1.722295, 0, 0, 0, 1, 1,
2.590958, -0.864523, 0.6235999, 0, 0, 0, 1, 1,
2.625983, 0.154449, 2.443195, 0, 0, 0, 1, 1,
2.788937, -0.3852791, 3.8236, 0, 0, 0, 1, 1,
2.856711, 0.4503312, 1.135916, 1, 1, 1, 1, 1,
2.864038, 0.1245356, 0.9960061, 1, 1, 1, 1, 1,
2.920377, -0.3883052, 1.557792, 1, 1, 1, 1, 1,
2.927834, 0.8056239, 1.750017, 1, 1, 1, 1, 1,
3.010264, -2.117177, 2.013445, 1, 1, 1, 1, 1,
3.017505, -0.5678762, 1.495344, 1, 1, 1, 1, 1,
3.074158, 0.5616655, -0.5232425, 1, 1, 1, 1, 1
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
var radius = 9.871065;
var distance = 34.6717;
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
mvMatrix.translate( -0.06046605, -0.2298913, 0.5865788 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.6717);
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
