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
-3.30283, 1.395146, -1.165545, 1, 0, 0, 1,
-3.239693, -1.12778, 0.02818645, 1, 0.007843138, 0, 1,
-3.208797, -1.218391, -1.69708, 1, 0.01176471, 0, 1,
-3.152654, 1.135002, 0.8702029, 1, 0.01960784, 0, 1,
-3.042645, -1.301501, -0.2521034, 1, 0.02352941, 0, 1,
-2.964998, -1.539582, -1.756973, 1, 0.03137255, 0, 1,
-2.88343, -0.4400471, -2.036122, 1, 0.03529412, 0, 1,
-2.719668, -0.6920265, -2.848069, 1, 0.04313726, 0, 1,
-2.673795, -1.258793, -1.351005, 1, 0.04705882, 0, 1,
-2.629137, 0.5405764, -1.243864, 1, 0.05490196, 0, 1,
-2.572157, -0.5132068, -0.8416184, 1, 0.05882353, 0, 1,
-2.496097, -0.2484958, -1.650484, 1, 0.06666667, 0, 1,
-2.476192, -0.8246495, -2.304595, 1, 0.07058824, 0, 1,
-2.462458, 0.61887, -0.9246218, 1, 0.07843138, 0, 1,
-2.455707, -1.625612, 0.4931992, 1, 0.08235294, 0, 1,
-2.443595, 1.242798, -2.1933, 1, 0.09019608, 0, 1,
-2.405319, 0.03927904, -0.6869817, 1, 0.09411765, 0, 1,
-2.399042, -0.3686893, -2.139271, 1, 0.1019608, 0, 1,
-2.384589, -1.263712, -0.06167985, 1, 0.1098039, 0, 1,
-2.349084, -1.768672, -1.567119, 1, 0.1137255, 0, 1,
-2.252278, 0.4760993, -1.564422, 1, 0.1215686, 0, 1,
-2.216118, 0.183588, -0.4838322, 1, 0.1254902, 0, 1,
-2.097486, 1.446946, -0.2208208, 1, 0.1333333, 0, 1,
-2.094904, 0.5393412, -0.9733357, 1, 0.1372549, 0, 1,
-2.079564, 1.035937, -0.8527946, 1, 0.145098, 0, 1,
-2.069538, 0.2720972, -0.3585534, 1, 0.1490196, 0, 1,
-2.059136, -0.4603282, -1.545926, 1, 0.1568628, 0, 1,
-2.058646, -0.7073943, -0.7571565, 1, 0.1607843, 0, 1,
-2.020139, -0.2621936, -0.5667207, 1, 0.1686275, 0, 1,
-2.002647, 1.57115, -1.211784, 1, 0.172549, 0, 1,
-1.976003, 1.429738, 0.4485454, 1, 0.1803922, 0, 1,
-1.975821, -0.04627234, -1.072999, 1, 0.1843137, 0, 1,
-1.97272, -0.2970206, -0.9465746, 1, 0.1921569, 0, 1,
-1.954352, 0.3389642, -2.424501, 1, 0.1960784, 0, 1,
-1.919935, 2.138296, -0.1664768, 1, 0.2039216, 0, 1,
-1.89833, 1.85917, -1.439111, 1, 0.2117647, 0, 1,
-1.897572, 0.4831613, -1.514725, 1, 0.2156863, 0, 1,
-1.894121, 1.352516, -1.496264, 1, 0.2235294, 0, 1,
-1.873003, 0.5681334, -1.999987, 1, 0.227451, 0, 1,
-1.85214, 0.603608, -1.024502, 1, 0.2352941, 0, 1,
-1.823987, 0.1796154, -1.076742, 1, 0.2392157, 0, 1,
-1.788581, 0.1159066, -1.02698, 1, 0.2470588, 0, 1,
-1.762838, 0.8797807, 0.8369784, 1, 0.2509804, 0, 1,
-1.743787, -1.514022, -1.884323, 1, 0.2588235, 0, 1,
-1.734259, 1.753122, 0.02519936, 1, 0.2627451, 0, 1,
-1.733254, -1.147591, -3.150756, 1, 0.2705882, 0, 1,
-1.722034, 0.4679416, -0.3563488, 1, 0.2745098, 0, 1,
-1.7072, -1.252769, -0.8191296, 1, 0.282353, 0, 1,
-1.697972, -0.4829697, -1.791167, 1, 0.2862745, 0, 1,
-1.689405, 1.653138, -1.067684, 1, 0.2941177, 0, 1,
-1.681701, 1.064361, -1.74622, 1, 0.3019608, 0, 1,
-1.658391, -0.5537483, -2.346381, 1, 0.3058824, 0, 1,
-1.646482, 0.4061847, -1.68253, 1, 0.3137255, 0, 1,
-1.635462, 1.009081, -0.3974546, 1, 0.3176471, 0, 1,
-1.632628, -2.067006, -3.309749, 1, 0.3254902, 0, 1,
-1.623591, 0.149929, -1.419909, 1, 0.3294118, 0, 1,
-1.614854, 1.349914, -2.273442, 1, 0.3372549, 0, 1,
-1.613089, 0.6918477, 0.02773743, 1, 0.3411765, 0, 1,
-1.609996, 2.829266, -1.296367, 1, 0.3490196, 0, 1,
-1.608412, 1.818634, -0.334059, 1, 0.3529412, 0, 1,
-1.591146, -1.181069, -2.437234, 1, 0.3607843, 0, 1,
-1.571011, -0.08122316, -0.6353891, 1, 0.3647059, 0, 1,
-1.557517, 0.8207545, -1.316934, 1, 0.372549, 0, 1,
-1.555583, -1.467221, -1.281511, 1, 0.3764706, 0, 1,
-1.551849, -0.7093322, -3.274813, 1, 0.3843137, 0, 1,
-1.548578, -1.338352, -2.852203, 1, 0.3882353, 0, 1,
-1.548486, 0.07969505, -0.6712922, 1, 0.3960784, 0, 1,
-1.541317, 1.450181, -0.4873568, 1, 0.4039216, 0, 1,
-1.518871, -1.33554, -2.654794, 1, 0.4078431, 0, 1,
-1.517809, 0.4387758, -2.210458, 1, 0.4156863, 0, 1,
-1.514714, 1.312885, -2.282641, 1, 0.4196078, 0, 1,
-1.513073, 0.5767914, -0.6841481, 1, 0.427451, 0, 1,
-1.513062, 1.072537, 0.1653032, 1, 0.4313726, 0, 1,
-1.508588, -0.829294, -2.328293, 1, 0.4392157, 0, 1,
-1.505299, 1.763146, -0.05715956, 1, 0.4431373, 0, 1,
-1.489009, 1.300748, -0.5162095, 1, 0.4509804, 0, 1,
-1.478966, -0.7230855, -3.051313, 1, 0.454902, 0, 1,
-1.464267, 1.811376, -2.521872, 1, 0.4627451, 0, 1,
-1.462821, -0.4493049, -1.743026, 1, 0.4666667, 0, 1,
-1.450349, -1.401837, -1.34331, 1, 0.4745098, 0, 1,
-1.432384, -0.6099742, -4.370454, 1, 0.4784314, 0, 1,
-1.432141, -0.3629051, -2.013067, 1, 0.4862745, 0, 1,
-1.43148, -0.8804342, -3.297509, 1, 0.4901961, 0, 1,
-1.424231, 0.9893003, -1.669193, 1, 0.4980392, 0, 1,
-1.42368, 0.2155017, -0.8793561, 1, 0.5058824, 0, 1,
-1.423553, 2.25799, 0.2549705, 1, 0.509804, 0, 1,
-1.418186, -2.709904, -2.642335, 1, 0.5176471, 0, 1,
-1.384503, 0.6110067, -1.801742, 1, 0.5215687, 0, 1,
-1.383567, -1.994377, -2.052215, 1, 0.5294118, 0, 1,
-1.375675, -1.223303, -1.419853, 1, 0.5333334, 0, 1,
-1.375407, -2.422833, -4.426493, 1, 0.5411765, 0, 1,
-1.371004, -0.8237182, -2.853481, 1, 0.5450981, 0, 1,
-1.370393, 1.03283, -0.8928823, 1, 0.5529412, 0, 1,
-1.348114, -0.9613429, -1.212744, 1, 0.5568628, 0, 1,
-1.347451, -1.055499, -3.630937, 1, 0.5647059, 0, 1,
-1.347119, -0.05356003, -0.8712277, 1, 0.5686275, 0, 1,
-1.32481, -0.1252242, -1.900931, 1, 0.5764706, 0, 1,
-1.321804, 0.6277781, -1.46465, 1, 0.5803922, 0, 1,
-1.293594, 0.7896024, -1.007787, 1, 0.5882353, 0, 1,
-1.292824, 0.6113731, -1.67659, 1, 0.5921569, 0, 1,
-1.278038, 1.148733, -0.8532087, 1, 0.6, 0, 1,
-1.253047, 0.3786961, -0.6022222, 1, 0.6078432, 0, 1,
-1.238436, 0.4971806, -1.130482, 1, 0.6117647, 0, 1,
-1.23574, -0.3707882, -4.207944, 1, 0.6196079, 0, 1,
-1.235078, 0.6606053, -0.3228912, 1, 0.6235294, 0, 1,
-1.224797, -0.6548787, -1.107074, 1, 0.6313726, 0, 1,
-1.215334, -2.374901, -2.379741, 1, 0.6352941, 0, 1,
-1.213687, 1.041237, -0.5499262, 1, 0.6431373, 0, 1,
-1.20697, -0.167567, -0.6605456, 1, 0.6470588, 0, 1,
-1.203497, 0.141, -1.395758, 1, 0.654902, 0, 1,
-1.203262, 0.4262687, -0.9533181, 1, 0.6588235, 0, 1,
-1.202251, 1.04982, 0.2757108, 1, 0.6666667, 0, 1,
-1.18988, 1.815806, -0.2119286, 1, 0.6705883, 0, 1,
-1.188404, 1.227432, -1.005183, 1, 0.6784314, 0, 1,
-1.173392, -0.7613831, -1.888463, 1, 0.682353, 0, 1,
-1.1676, -1.521938, -2.655537, 1, 0.6901961, 0, 1,
-1.167016, -0.4193889, -2.583785, 1, 0.6941177, 0, 1,
-1.161932, 1.869504, 0.3271151, 1, 0.7019608, 0, 1,
-1.158986, 0.2267679, -3.261301, 1, 0.7098039, 0, 1,
-1.151669, -1.459599, -1.960222, 1, 0.7137255, 0, 1,
-1.15006, 0.4186372, -1.729238, 1, 0.7215686, 0, 1,
-1.134176, 0.6313829, -1.010022, 1, 0.7254902, 0, 1,
-1.129068, 0.2966867, -1.17403, 1, 0.7333333, 0, 1,
-1.12106, 0.5705515, -2.66768, 1, 0.7372549, 0, 1,
-1.119821, -2.106392, -4.834453, 1, 0.7450981, 0, 1,
-1.118988, 0.3381445, -1.038333, 1, 0.7490196, 0, 1,
-1.112539, -0.3984208, -3.036955, 1, 0.7568628, 0, 1,
-1.109235, 0.4483202, -0.4094642, 1, 0.7607843, 0, 1,
-1.10871, -0.5577028, -1.786057, 1, 0.7686275, 0, 1,
-1.103646, 0.09731676, -1.374753, 1, 0.772549, 0, 1,
-1.103344, 0.08228055, -2.469676, 1, 0.7803922, 0, 1,
-1.101377, -0.6376943, -1.529748, 1, 0.7843137, 0, 1,
-1.0996, 0.2839852, -1.308925, 1, 0.7921569, 0, 1,
-1.097101, 0.8103067, -0.1887404, 1, 0.7960784, 0, 1,
-1.094859, 0.07247337, -2.011805, 1, 0.8039216, 0, 1,
-1.091405, 0.805729, -1.03754, 1, 0.8117647, 0, 1,
-1.085406, 1.122316, -1.915118, 1, 0.8156863, 0, 1,
-1.082571, 1.267995, 0.8752468, 1, 0.8235294, 0, 1,
-1.078503, 1.621231, 0.4084978, 1, 0.827451, 0, 1,
-1.075211, 0.1137128, -1.745749, 1, 0.8352941, 0, 1,
-1.070271, 0.3871022, -0.7211523, 1, 0.8392157, 0, 1,
-1.068278, 0.5307901, 0.193935, 1, 0.8470588, 0, 1,
-1.067741, -0.4519235, -1.860293, 1, 0.8509804, 0, 1,
-1.066715, 1.069811, -0.5105474, 1, 0.8588235, 0, 1,
-1.046515, 0.7566338, -2.206033, 1, 0.8627451, 0, 1,
-1.044245, 1.137454, -0.4307745, 1, 0.8705882, 0, 1,
-1.03273, -1.86131, -1.742934, 1, 0.8745098, 0, 1,
-1.027007, 0.05940318, -3.438634, 1, 0.8823529, 0, 1,
-1.024365, -2.923093, -1.246316, 1, 0.8862745, 0, 1,
-1.018965, 0.2916756, 0.3332313, 1, 0.8941177, 0, 1,
-0.9966627, -0.3804372, -1.942222, 1, 0.8980392, 0, 1,
-0.9931007, 2.116257, 1.052906, 1, 0.9058824, 0, 1,
-0.989249, -1.379214, -3.350138, 1, 0.9137255, 0, 1,
-0.9883811, 0.7064072, -1.62087, 1, 0.9176471, 0, 1,
-0.9875232, 1.38112, 0.9834086, 1, 0.9254902, 0, 1,
-0.9855614, 1.162576, 2.005296, 1, 0.9294118, 0, 1,
-0.9755144, -2.463049, -2.520025, 1, 0.9372549, 0, 1,
-0.9747196, 1.445412, -0.976191, 1, 0.9411765, 0, 1,
-0.9709427, 1.302066, -1.57303, 1, 0.9490196, 0, 1,
-0.9630224, 1.747633, -0.3900541, 1, 0.9529412, 0, 1,
-0.9611986, -0.1346753, -1.565485, 1, 0.9607843, 0, 1,
-0.9546555, 1.669949, -0.4573683, 1, 0.9647059, 0, 1,
-0.9541323, -0.06210696, -0.8730976, 1, 0.972549, 0, 1,
-0.9524022, -0.6732824, -2.286769, 1, 0.9764706, 0, 1,
-0.9394023, -0.820641, -2.747638, 1, 0.9843137, 0, 1,
-0.9386007, -0.1862266, -2.946631, 1, 0.9882353, 0, 1,
-0.9372872, 0.1730069, -0.8698719, 1, 0.9960784, 0, 1,
-0.9358387, -1.992606, -4.293285, 0.9960784, 1, 0, 1,
-0.9330413, 2.124254, 1.010782, 0.9921569, 1, 0, 1,
-0.9306688, 0.1583539, -1.937819, 0.9843137, 1, 0, 1,
-0.928075, -0.4647023, -3.077964, 0.9803922, 1, 0, 1,
-0.9274206, -0.07169317, -2.363256, 0.972549, 1, 0, 1,
-0.9172666, -1.320833, -1.868515, 0.9686275, 1, 0, 1,
-0.9171945, -0.4005876, -2.898205, 0.9607843, 1, 0, 1,
-0.9083905, 0.05571495, -2.113585, 0.9568627, 1, 0, 1,
-0.9078442, -0.3024103, -1.151677, 0.9490196, 1, 0, 1,
-0.9051666, 1.753371, 0.2526986, 0.945098, 1, 0, 1,
-0.9030291, 0.4498877, -1.055364, 0.9372549, 1, 0, 1,
-0.9016488, 0.8042525, -1.472434, 0.9333333, 1, 0, 1,
-0.8910696, 0.05519535, -0.6359528, 0.9254902, 1, 0, 1,
-0.8886909, -1.206264, -3.10586, 0.9215686, 1, 0, 1,
-0.8855507, -1.608195, -3.445924, 0.9137255, 1, 0, 1,
-0.878316, 1.461532, -0.3358634, 0.9098039, 1, 0, 1,
-0.8781844, 0.6247819, -0.00705704, 0.9019608, 1, 0, 1,
-0.8779306, 1.337895, -1.573429, 0.8941177, 1, 0, 1,
-0.8628022, -0.03819894, -2.706301, 0.8901961, 1, 0, 1,
-0.8619321, -1.117111, -4.213058, 0.8823529, 1, 0, 1,
-0.8589969, 0.368715, -2.745852, 0.8784314, 1, 0, 1,
-0.855728, -1.44933, -2.977216, 0.8705882, 1, 0, 1,
-0.8507584, 0.373835, 0.4627545, 0.8666667, 1, 0, 1,
-0.8488369, 0.2648258, -1.101438, 0.8588235, 1, 0, 1,
-0.8458398, -0.8991398, -1.610829, 0.854902, 1, 0, 1,
-0.843619, 1.278876, -2.265916, 0.8470588, 1, 0, 1,
-0.8408977, -0.8126384, -3.189195, 0.8431373, 1, 0, 1,
-0.8392867, -0.3031217, -0.8891289, 0.8352941, 1, 0, 1,
-0.8380293, 1.014532, -1.122973, 0.8313726, 1, 0, 1,
-0.8370493, 0.2519396, 0.05401923, 0.8235294, 1, 0, 1,
-0.8361835, -0.1616371, -1.223574, 0.8196079, 1, 0, 1,
-0.8290794, -0.7148371, -2.974197, 0.8117647, 1, 0, 1,
-0.8290522, -0.7142616, -0.8042176, 0.8078431, 1, 0, 1,
-0.8268237, -0.3244233, -2.236245, 0.8, 1, 0, 1,
-0.8182966, -1.065553, -3.41259, 0.7921569, 1, 0, 1,
-0.8180555, -1.36895, -2.565906, 0.7882353, 1, 0, 1,
-0.8179633, 1.010269, -1.433148, 0.7803922, 1, 0, 1,
-0.811755, 1.893445, -0.9121078, 0.7764706, 1, 0, 1,
-0.8081614, -1.384258, -1.997572, 0.7686275, 1, 0, 1,
-0.8068876, -1.040681, -1.920281, 0.7647059, 1, 0, 1,
-0.8056094, -0.6873801, -3.129034, 0.7568628, 1, 0, 1,
-0.7978436, 0.4648551, -0.972176, 0.7529412, 1, 0, 1,
-0.791377, 1.896608, 0.2964505, 0.7450981, 1, 0, 1,
-0.7912943, 1.226917, -2.115031, 0.7411765, 1, 0, 1,
-0.7882297, -1.708768, -1.970275, 0.7333333, 1, 0, 1,
-0.7876526, 0.9180172, -1.120916, 0.7294118, 1, 0, 1,
-0.782454, -1.483704, -3.72802, 0.7215686, 1, 0, 1,
-0.776367, -1.243164, -4.331017, 0.7176471, 1, 0, 1,
-0.7760164, 1.159699, -0.40222, 0.7098039, 1, 0, 1,
-0.775201, 0.5427772, -0.6594349, 0.7058824, 1, 0, 1,
-0.7707745, 1.243401, -0.07671039, 0.6980392, 1, 0, 1,
-0.7692789, -0.8562006, -4.145495, 0.6901961, 1, 0, 1,
-0.7660581, -0.1077698, -1.439888, 0.6862745, 1, 0, 1,
-0.7659792, 1.112212, -0.612527, 0.6784314, 1, 0, 1,
-0.7646692, -0.3025963, -3.514346, 0.6745098, 1, 0, 1,
-0.7639716, 1.539694, -1.031629, 0.6666667, 1, 0, 1,
-0.7616025, -0.2300899, -1.726031, 0.6627451, 1, 0, 1,
-0.7583338, -0.02022613, -1.924225, 0.654902, 1, 0, 1,
-0.7569999, 0.1890191, -0.2966409, 0.6509804, 1, 0, 1,
-0.7544265, -0.238404, -0.576641, 0.6431373, 1, 0, 1,
-0.753328, 1.514931, 0.251564, 0.6392157, 1, 0, 1,
-0.7512454, -0.8554941, -1.36062, 0.6313726, 1, 0, 1,
-0.7424164, -0.5403625, -3.503408, 0.627451, 1, 0, 1,
-0.7389939, 0.3701946, -0.8216555, 0.6196079, 1, 0, 1,
-0.7370698, -0.5523227, -1.222189, 0.6156863, 1, 0, 1,
-0.7360603, -0.02607598, -0.275103, 0.6078432, 1, 0, 1,
-0.7358678, 0.1989425, -3.4164, 0.6039216, 1, 0, 1,
-0.7349443, 0.6083426, -1.259779, 0.5960785, 1, 0, 1,
-0.7342685, 0.3021147, -3.174114, 0.5882353, 1, 0, 1,
-0.7331902, 0.1401841, -0.01307201, 0.5843138, 1, 0, 1,
-0.7310126, -0.9932771, -1.632475, 0.5764706, 1, 0, 1,
-0.7261883, -0.03895168, -0.9955232, 0.572549, 1, 0, 1,
-0.7254483, -1.092847, -0.840404, 0.5647059, 1, 0, 1,
-0.722716, 2.097216, -2.709802, 0.5607843, 1, 0, 1,
-0.7180837, -0.4341441, -0.2869931, 0.5529412, 1, 0, 1,
-0.7170123, 1.114838, -1.320948, 0.5490196, 1, 0, 1,
-0.7169037, 0.4186833, -0.9781016, 0.5411765, 1, 0, 1,
-0.7164635, -0.4008682, -2.80331, 0.5372549, 1, 0, 1,
-0.7005267, -1.150203, -3.676698, 0.5294118, 1, 0, 1,
-0.6940129, -0.1167863, -1.574184, 0.5254902, 1, 0, 1,
-0.6903821, -0.4954813, -1.307208, 0.5176471, 1, 0, 1,
-0.6897821, 0.6096849, -1.443143, 0.5137255, 1, 0, 1,
-0.6894002, -2.679616, -1.579762, 0.5058824, 1, 0, 1,
-0.6870181, 1.190353, -1.79633, 0.5019608, 1, 0, 1,
-0.681579, 0.05441321, -1.975228, 0.4941176, 1, 0, 1,
-0.6809018, -0.7225759, -0.64333, 0.4862745, 1, 0, 1,
-0.6721793, -0.06352872, -1.531057, 0.4823529, 1, 0, 1,
-0.6665558, -0.4455734, -1.135686, 0.4745098, 1, 0, 1,
-0.6641383, 1.493434, -0.8607618, 0.4705882, 1, 0, 1,
-0.6572189, -0.448155, -1.598512, 0.4627451, 1, 0, 1,
-0.655312, -0.3173467, -2.449359, 0.4588235, 1, 0, 1,
-0.6473935, -1.035121, -1.816353, 0.4509804, 1, 0, 1,
-0.6456882, -2.15578, -1.562052, 0.4470588, 1, 0, 1,
-0.6424918, -0.2473725, -1.131386, 0.4392157, 1, 0, 1,
-0.638381, -0.3116466, -1.973504, 0.4352941, 1, 0, 1,
-0.6348301, -0.3443042, -2.726974, 0.427451, 1, 0, 1,
-0.6289632, -0.7999229, -4.291259, 0.4235294, 1, 0, 1,
-0.6234348, -0.3774298, -1.631306, 0.4156863, 1, 0, 1,
-0.614343, 1.001119, 1.284121, 0.4117647, 1, 0, 1,
-0.6110538, -0.6247317, -3.243237, 0.4039216, 1, 0, 1,
-0.610026, -1.663486, -1.515264, 0.3960784, 1, 0, 1,
-0.5999343, -0.1796106, 0.5180718, 0.3921569, 1, 0, 1,
-0.5956199, -2.160512, -3.880769, 0.3843137, 1, 0, 1,
-0.5922223, 0.9059595, -0.5154002, 0.3803922, 1, 0, 1,
-0.5901715, -0.5629411, -2.045836, 0.372549, 1, 0, 1,
-0.5895976, 1.385267, 0.3411175, 0.3686275, 1, 0, 1,
-0.5862086, 0.8861047, -1.208313, 0.3607843, 1, 0, 1,
-0.5723811, -1.555083, -1.810271, 0.3568628, 1, 0, 1,
-0.5699728, -0.7406778, -3.067907, 0.3490196, 1, 0, 1,
-0.5698015, -1.098577, -1.198606, 0.345098, 1, 0, 1,
-0.5693706, -0.1757958, -1.892535, 0.3372549, 1, 0, 1,
-0.5675631, 0.9237356, 0.7685422, 0.3333333, 1, 0, 1,
-0.5646774, 0.613593, -1.521033, 0.3254902, 1, 0, 1,
-0.5618864, 0.04102344, -0.9181188, 0.3215686, 1, 0, 1,
-0.5568435, 1.096033, -0.837849, 0.3137255, 1, 0, 1,
-0.5543253, 1.311394, 0.2413191, 0.3098039, 1, 0, 1,
-0.5528026, -0.3745576, -0.4911832, 0.3019608, 1, 0, 1,
-0.5461944, -0.9454772, -1.676537, 0.2941177, 1, 0, 1,
-0.543092, 0.6657172, -1.50059, 0.2901961, 1, 0, 1,
-0.5416282, -0.5605669, -1.545649, 0.282353, 1, 0, 1,
-0.5403466, -1.197625, -3.58054, 0.2784314, 1, 0, 1,
-0.5399262, 0.8304853, -1.910138, 0.2705882, 1, 0, 1,
-0.5384325, 0.8980693, -0.7283453, 0.2666667, 1, 0, 1,
-0.5326064, -0.6132135, -3.625304, 0.2588235, 1, 0, 1,
-0.5311944, -0.001541987, -1.533906, 0.254902, 1, 0, 1,
-0.5295908, 0.9358523, -0.2128484, 0.2470588, 1, 0, 1,
-0.5295712, 1.106576, 0.1677542, 0.2431373, 1, 0, 1,
-0.5288504, -0.1624296, -1.807515, 0.2352941, 1, 0, 1,
-0.5271803, 1.592931, -1.723594, 0.2313726, 1, 0, 1,
-0.5267838, 2.171675, -1.246747, 0.2235294, 1, 0, 1,
-0.5258434, -1.711205, -1.067209, 0.2196078, 1, 0, 1,
-0.5254968, 0.2659112, -0.4491206, 0.2117647, 1, 0, 1,
-0.5160903, 0.4706445, -0.6187129, 0.2078431, 1, 0, 1,
-0.5148695, 1.643452, -0.1225084, 0.2, 1, 0, 1,
-0.5145863, -0.8497599, -1.641597, 0.1921569, 1, 0, 1,
-0.5122388, 0.4250281, 0.06997262, 0.1882353, 1, 0, 1,
-0.5106303, 0.7063055, 0.8939213, 0.1803922, 1, 0, 1,
-0.4988066, -0.9531705, -3.644606, 0.1764706, 1, 0, 1,
-0.4969825, -1.253005, -2.134405, 0.1686275, 1, 0, 1,
-0.4944638, 0.5210754, -0.4378586, 0.1647059, 1, 0, 1,
-0.4891447, -0.5196592, -2.234849, 0.1568628, 1, 0, 1,
-0.4843599, -0.2966915, -3.495308, 0.1529412, 1, 0, 1,
-0.481704, 0.06987145, -1.648867, 0.145098, 1, 0, 1,
-0.4763654, 1.358329, 0.8861662, 0.1411765, 1, 0, 1,
-0.4760554, 0.4435725, -0.6318772, 0.1333333, 1, 0, 1,
-0.4757594, 0.4434138, 0.1384972, 0.1294118, 1, 0, 1,
-0.4749903, 0.2662939, -1.863127, 0.1215686, 1, 0, 1,
-0.4747875, 1.088524, -0.3275377, 0.1176471, 1, 0, 1,
-0.4741577, 1.493324, -0.2074321, 0.1098039, 1, 0, 1,
-0.4704574, 1.355452, -0.4439327, 0.1058824, 1, 0, 1,
-0.4670668, 0.06907077, -0.4054538, 0.09803922, 1, 0, 1,
-0.466583, 0.5998025, -0.9238064, 0.09019608, 1, 0, 1,
-0.463159, -1.045501, -4.956896, 0.08627451, 1, 0, 1,
-0.4598881, -0.1605856, -0.9916538, 0.07843138, 1, 0, 1,
-0.4596764, -1.663079, -3.803708, 0.07450981, 1, 0, 1,
-0.4596756, -0.4558023, -2.03207, 0.06666667, 1, 0, 1,
-0.4587506, -1.151362, -3.54624, 0.0627451, 1, 0, 1,
-0.4551229, 0.1211313, -2.357113, 0.05490196, 1, 0, 1,
-0.4512127, 1.195194, -1.740592, 0.05098039, 1, 0, 1,
-0.4499652, -0.7987398, -2.909921, 0.04313726, 1, 0, 1,
-0.442293, 0.8877103, -0.4511315, 0.03921569, 1, 0, 1,
-0.4401103, -0.3314827, -2.735033, 0.03137255, 1, 0, 1,
-0.44004, 0.507499, 0.09086782, 0.02745098, 1, 0, 1,
-0.4400016, 0.1052244, -1.498076, 0.01960784, 1, 0, 1,
-0.4373536, 0.01546547, -0.1522903, 0.01568628, 1, 0, 1,
-0.4363142, -0.1595261, -0.4350901, 0.007843138, 1, 0, 1,
-0.4354185, -0.07926644, -0.5219012, 0.003921569, 1, 0, 1,
-0.4351178, 1.234227, -0.5044054, 0, 1, 0.003921569, 1,
-0.4344654, 0.2610981, 0.6911987, 0, 1, 0.01176471, 1,
-0.4344366, 2.017088, 0.4940647, 0, 1, 0.01568628, 1,
-0.4343736, 0.3431963, -1.757501, 0, 1, 0.02352941, 1,
-0.4326132, 0.8032334, -0.4878929, 0, 1, 0.02745098, 1,
-0.4322082, -1.403382, -2.614735, 0, 1, 0.03529412, 1,
-0.4281419, -0.1390443, -1.622918, 0, 1, 0.03921569, 1,
-0.428032, -1.521109, -2.289549, 0, 1, 0.04705882, 1,
-0.4276681, -0.1752697, -2.654323, 0, 1, 0.05098039, 1,
-0.4267532, 0.1614257, -1.888388, 0, 1, 0.05882353, 1,
-0.4265815, -1.580051, -3.308537, 0, 1, 0.0627451, 1,
-0.4200112, -0.4194724, -2.779643, 0, 1, 0.07058824, 1,
-0.4198351, -1.776117, -2.333215, 0, 1, 0.07450981, 1,
-0.4124958, -0.3760854, -2.821314, 0, 1, 0.08235294, 1,
-0.4121542, -0.9357236, -2.193667, 0, 1, 0.08627451, 1,
-0.4117421, 0.7142784, -2.277499, 0, 1, 0.09411765, 1,
-0.4106027, 1.29919, 0.002754353, 0, 1, 0.1019608, 1,
-0.4101909, -1.710407, -3.792233, 0, 1, 0.1058824, 1,
-0.408318, 0.7007688, -1.02451, 0, 1, 0.1137255, 1,
-0.407059, 0.8265153, -0.1243238, 0, 1, 0.1176471, 1,
-0.4047299, -0.6503261, -2.872286, 0, 1, 0.1254902, 1,
-0.4039027, 1.729471, -1.154628, 0, 1, 0.1294118, 1,
-0.4005919, 0.2935326, -1.140534, 0, 1, 0.1372549, 1,
-0.3988413, -1.629627, -3.38536, 0, 1, 0.1411765, 1,
-0.3979113, -1.338313, -2.027211, 0, 1, 0.1490196, 1,
-0.3962304, -0.1072213, -3.10235, 0, 1, 0.1529412, 1,
-0.3950794, 0.2755731, -1.276051, 0, 1, 0.1607843, 1,
-0.3931866, -0.7924702, -1.872676, 0, 1, 0.1647059, 1,
-0.3863306, -1.306332, -3.950367, 0, 1, 0.172549, 1,
-0.3827785, 0.4299782, -0.2307162, 0, 1, 0.1764706, 1,
-0.3809153, -0.3572865, -3.615464, 0, 1, 0.1843137, 1,
-0.3788491, 0.6280291, -2.45673, 0, 1, 0.1882353, 1,
-0.3759458, 0.3442929, -0.5944903, 0, 1, 0.1960784, 1,
-0.3752281, -0.6217075, -4.679105, 0, 1, 0.2039216, 1,
-0.3704225, 0.3265377, 2.569557, 0, 1, 0.2078431, 1,
-0.3684212, -0.413775, -1.305366, 0, 1, 0.2156863, 1,
-0.3667771, -1.208106, -2.593543, 0, 1, 0.2196078, 1,
-0.3654319, 0.08386464, -0.6186877, 0, 1, 0.227451, 1,
-0.3645103, 0.09021906, -2.078983, 0, 1, 0.2313726, 1,
-0.364353, -0.7163143, -4.877287, 0, 1, 0.2392157, 1,
-0.3534373, 0.09191228, -0.8593784, 0, 1, 0.2431373, 1,
-0.3507509, -0.3748489, -5.000318, 0, 1, 0.2509804, 1,
-0.3486657, 0.3865673, -1.439841, 0, 1, 0.254902, 1,
-0.3481879, -1.439016, -2.378568, 0, 1, 0.2627451, 1,
-0.3449607, -1.428469, -4.392515, 0, 1, 0.2666667, 1,
-0.3416763, 0.8243695, 0.891677, 0, 1, 0.2745098, 1,
-0.3393517, -0.3802631, -2.600075, 0, 1, 0.2784314, 1,
-0.338752, -0.3171836, -3.06686, 0, 1, 0.2862745, 1,
-0.3382474, 0.7878662, -1.81428, 0, 1, 0.2901961, 1,
-0.3291461, 0.6423811, -0.5794827, 0, 1, 0.2980392, 1,
-0.3280908, 0.223154, -0.931558, 0, 1, 0.3058824, 1,
-0.3251194, -0.8029144, -1.683751, 0, 1, 0.3098039, 1,
-0.3250767, 1.471447, -1.666469, 0, 1, 0.3176471, 1,
-0.3216035, -0.1025554, -2.067873, 0, 1, 0.3215686, 1,
-0.32134, 0.9262056, -0.648175, 0, 1, 0.3294118, 1,
-0.3204619, -0.6840679, -1.765251, 0, 1, 0.3333333, 1,
-0.3189706, -0.4286052, -0.9050797, 0, 1, 0.3411765, 1,
-0.3162645, -0.8142238, -3.749343, 0, 1, 0.345098, 1,
-0.311781, -0.6453182, -1.048903, 0, 1, 0.3529412, 1,
-0.3035134, 0.1080396, 0.8186766, 0, 1, 0.3568628, 1,
-0.303311, -1.649181, -2.493481, 0, 1, 0.3647059, 1,
-0.3026958, 0.4819348, -0.7412691, 0, 1, 0.3686275, 1,
-0.2966577, 1.451807, 0.5172886, 0, 1, 0.3764706, 1,
-0.2936135, -2.002521, -2.580002, 0, 1, 0.3803922, 1,
-0.2911376, 0.7115895, -0.4257447, 0, 1, 0.3882353, 1,
-0.2889177, 0.1048255, -1.653989, 0, 1, 0.3921569, 1,
-0.2877109, 0.09884541, -1.60595, 0, 1, 0.4, 1,
-0.2860023, 0.415408, -0.9848251, 0, 1, 0.4078431, 1,
-0.2821291, 1.054772, 0.3959047, 0, 1, 0.4117647, 1,
-0.2744581, -1.324443, -4.648938, 0, 1, 0.4196078, 1,
-0.2738493, -0.2140107, -3.136989, 0, 1, 0.4235294, 1,
-0.269958, 0.5791864, -3.132777, 0, 1, 0.4313726, 1,
-0.2653676, -1.032985, -3.124341, 0, 1, 0.4352941, 1,
-0.265048, -1.203108, -4.585338, 0, 1, 0.4431373, 1,
-0.2647846, 0.4108209, 0.6478992, 0, 1, 0.4470588, 1,
-0.262672, -0.03364878, -0.9211212, 0, 1, 0.454902, 1,
-0.2561887, 0.5422292, -0.1059224, 0, 1, 0.4588235, 1,
-0.2558093, -1.597625, -4.513151, 0, 1, 0.4666667, 1,
-0.2557489, -1.817207, -3.091233, 0, 1, 0.4705882, 1,
-0.2551282, 0.01352182, -2.49082, 0, 1, 0.4784314, 1,
-0.2449853, 1.536923, -0.646606, 0, 1, 0.4823529, 1,
-0.2415109, -1.377071, -3.710258, 0, 1, 0.4901961, 1,
-0.2379476, -0.1146264, -0.6805246, 0, 1, 0.4941176, 1,
-0.2377653, -0.2004953, -2.925056, 0, 1, 0.5019608, 1,
-0.2359825, 0.1312366, -2.200782, 0, 1, 0.509804, 1,
-0.2359069, 0.02658573, 1.026303, 0, 1, 0.5137255, 1,
-0.2354506, -0.9839219, -3.37089, 0, 1, 0.5215687, 1,
-0.2352393, -0.377298, -3.068968, 0, 1, 0.5254902, 1,
-0.2292204, 0.6032252, 0.3047602, 0, 1, 0.5333334, 1,
-0.224656, -0.6582127, -2.056073, 0, 1, 0.5372549, 1,
-0.2242261, 1.03678, 0.4621199, 0, 1, 0.5450981, 1,
-0.2235463, 1.416147, -0.6705372, 0, 1, 0.5490196, 1,
-0.2193042, -2.3407, -0.904606, 0, 1, 0.5568628, 1,
-0.2111492, 0.07267247, -1.644666, 0, 1, 0.5607843, 1,
-0.1995812, -0.2639658, -1.495596, 0, 1, 0.5686275, 1,
-0.1995612, 1.459966, -2.633119, 0, 1, 0.572549, 1,
-0.1993019, -0.5294344, -2.515503, 0, 1, 0.5803922, 1,
-0.192695, -0.08204897, -3.472994, 0, 1, 0.5843138, 1,
-0.1907527, 0.3334935, -0.6387048, 0, 1, 0.5921569, 1,
-0.1841604, 0.09221306, -1.472421, 0, 1, 0.5960785, 1,
-0.1825865, 0.1963506, -0.3443175, 0, 1, 0.6039216, 1,
-0.181637, -0.807543, -1.850331, 0, 1, 0.6117647, 1,
-0.1747959, 0.4284923, -1.773322, 0, 1, 0.6156863, 1,
-0.168004, -0.4888378, -1.706643, 0, 1, 0.6235294, 1,
-0.1678007, 2.448503, 1.301785, 0, 1, 0.627451, 1,
-0.1667724, -0.2827139, -1.577974, 0, 1, 0.6352941, 1,
-0.163154, -0.6396479, -3.062987, 0, 1, 0.6392157, 1,
-0.1572295, -0.8930987, -2.420439, 0, 1, 0.6470588, 1,
-0.1491412, 0.7292734, 0.3010244, 0, 1, 0.6509804, 1,
-0.1477299, -0.5950482, -4.970118, 0, 1, 0.6588235, 1,
-0.1476123, -1.898078, -2.475402, 0, 1, 0.6627451, 1,
-0.1447866, 0.7788326, -2.173245, 0, 1, 0.6705883, 1,
-0.1428958, -1.441602, -3.17994, 0, 1, 0.6745098, 1,
-0.1376141, -0.1084327, -3.241979, 0, 1, 0.682353, 1,
-0.1369562, 0.9421832, 0.2970615, 0, 1, 0.6862745, 1,
-0.1281594, 1.15767, -0.1868285, 0, 1, 0.6941177, 1,
-0.1275246, 0.9277106, -1.011969, 0, 1, 0.7019608, 1,
-0.1253219, -1.575827, -1.632085, 0, 1, 0.7058824, 1,
-0.1240709, -0.1958698, -3.791323, 0, 1, 0.7137255, 1,
-0.119616, -2.547093, -2.55064, 0, 1, 0.7176471, 1,
-0.1196027, -0.06223847, -1.134765, 0, 1, 0.7254902, 1,
-0.1163375, 2.323228, 0.519568, 0, 1, 0.7294118, 1,
-0.1102575, -0.3073108, -3.135752, 0, 1, 0.7372549, 1,
-0.1050951, -0.1745506, -3.020781, 0, 1, 0.7411765, 1,
-0.1031523, 2.234286, 0.9828092, 0, 1, 0.7490196, 1,
-0.1003243, 0.3386209, 1.963918, 0, 1, 0.7529412, 1,
-0.09936808, 1.038848, -0.2387469, 0, 1, 0.7607843, 1,
-0.0990849, -0.5600268, -3.876645, 0, 1, 0.7647059, 1,
-0.09793178, -1.606232, -1.896464, 0, 1, 0.772549, 1,
-0.09704389, 1.414535, 0.09408537, 0, 1, 0.7764706, 1,
-0.09574275, -0.6718443, -2.639071, 0, 1, 0.7843137, 1,
-0.09313367, -1.149666, -3.50444, 0, 1, 0.7882353, 1,
-0.09262224, -0.03442386, -3.155396, 0, 1, 0.7960784, 1,
-0.09042729, 1.215834, -0.9179847, 0, 1, 0.8039216, 1,
-0.08812711, -0.9046197, -0.4753445, 0, 1, 0.8078431, 1,
-0.08785201, -0.8934842, -3.552249, 0, 1, 0.8156863, 1,
-0.08669737, -0.6560441, -2.481476, 0, 1, 0.8196079, 1,
-0.07658422, -0.9056052, -2.882375, 0, 1, 0.827451, 1,
-0.07444897, -1.211593, -3.181776, 0, 1, 0.8313726, 1,
-0.07335296, -1.110733, -3.110679, 0, 1, 0.8392157, 1,
-0.07185514, 1.122242, 1.039291, 0, 1, 0.8431373, 1,
-0.06496238, -0.5650882, -4.092013, 0, 1, 0.8509804, 1,
-0.06290498, 0.0139373, -2.883743, 0, 1, 0.854902, 1,
-0.06143077, 0.298139, -0.11671, 0, 1, 0.8627451, 1,
-0.05678442, -1.191835, -0.9430599, 0, 1, 0.8666667, 1,
-0.05509967, -1.921904, -3.916929, 0, 1, 0.8745098, 1,
-0.0548029, -0.2319256, -2.537888, 0, 1, 0.8784314, 1,
-0.05439411, -2.266438, -3.804405, 0, 1, 0.8862745, 1,
-0.05322942, 0.972503, 0.9704754, 0, 1, 0.8901961, 1,
-0.05068852, 1.52069, -1.112271, 0, 1, 0.8980392, 1,
-0.04506712, 1.34781, -1.053171, 0, 1, 0.9058824, 1,
-0.04302273, -0.08325621, -2.819994, 0, 1, 0.9098039, 1,
-0.04171398, 0.6685655, 0.1622693, 0, 1, 0.9176471, 1,
-0.04171088, 0.1112373, 0.6384254, 0, 1, 0.9215686, 1,
-0.03409684, -1.689104, -2.713379, 0, 1, 0.9294118, 1,
-0.02784923, -0.3098001, -1.771457, 0, 1, 0.9333333, 1,
-0.02494035, 0.2360859, 0.713983, 0, 1, 0.9411765, 1,
-0.02428203, -0.2482981, -3.985368, 0, 1, 0.945098, 1,
-0.01895425, -1.422722, -4.534684, 0, 1, 0.9529412, 1,
-0.01735115, 1.463979, -0.9602178, 0, 1, 0.9568627, 1,
-0.01651228, -1.584918, -3.748866, 0, 1, 0.9647059, 1,
-0.01559058, 1.41506, -1.039266, 0, 1, 0.9686275, 1,
-0.01154527, -2.03842, -3.406909, 0, 1, 0.9764706, 1,
-0.01012508, -0.8235438, -3.62706, 0, 1, 0.9803922, 1,
-0.008510685, -0.4539339, -3.440576, 0, 1, 0.9882353, 1,
-0.005238732, 0.2600672, -0.4433181, 0, 1, 0.9921569, 1,
-0.004044515, -0.4874687, -2.262603, 0, 1, 1, 1,
-0.0007501758, 0.5223244, 2.002316, 0, 0.9921569, 1, 1,
-0.0003703583, 0.2312888, 0.2405838, 0, 0.9882353, 1, 1,
0.00329367, -0.7931823, 2.880418, 0, 0.9803922, 1, 1,
0.01102039, -0.3197979, 4.857456, 0, 0.9764706, 1, 1,
0.01158015, -0.257827, 2.591499, 0, 0.9686275, 1, 1,
0.01221739, -1.897323, 2.830718, 0, 0.9647059, 1, 1,
0.01287371, -0.3128686, 4.709455, 0, 0.9568627, 1, 1,
0.01522602, 0.2434153, -1.450254, 0, 0.9529412, 1, 1,
0.02299801, -0.3175404, 3.492628, 0, 0.945098, 1, 1,
0.02523983, 1.741069, -0.1383263, 0, 0.9411765, 1, 1,
0.02602583, -0.1924376, 3.429022, 0, 0.9333333, 1, 1,
0.02677555, 1.609559, 0.2630275, 0, 0.9294118, 1, 1,
0.02882069, 0.6362902, -0.4544672, 0, 0.9215686, 1, 1,
0.03048511, 0.7070245, 0.9557611, 0, 0.9176471, 1, 1,
0.03048834, 1.157829, 1.24749, 0, 0.9098039, 1, 1,
0.03092714, 0.6555732, -0.3004436, 0, 0.9058824, 1, 1,
0.03317336, 0.4847508, -0.3054916, 0, 0.8980392, 1, 1,
0.03496021, -0.444763, 2.102982, 0, 0.8901961, 1, 1,
0.039594, 1.14503, -0.1859635, 0, 0.8862745, 1, 1,
0.04272125, 0.8026571, 0.5024911, 0, 0.8784314, 1, 1,
0.04294452, 0.1359771, -0.8446663, 0, 0.8745098, 1, 1,
0.05128308, -0.4859263, 5.302521, 0, 0.8666667, 1, 1,
0.05205163, -0.1819174, 3.391881, 0, 0.8627451, 1, 1,
0.05252919, -0.1735687, 3.559292, 0, 0.854902, 1, 1,
0.0532714, 0.5970314, 0.6296436, 0, 0.8509804, 1, 1,
0.05591385, 0.1064961, 0.4085442, 0, 0.8431373, 1, 1,
0.05605611, 0.6336781, -1.084824, 0, 0.8392157, 1, 1,
0.05837848, -0.3370063, 1.885096, 0, 0.8313726, 1, 1,
0.0612648, -0.9952932, 4.466927, 0, 0.827451, 1, 1,
0.06149174, 1.237264, 1.012424, 0, 0.8196079, 1, 1,
0.06316764, 1.409275, 0.02097692, 0, 0.8156863, 1, 1,
0.06502088, -0.2498091, 1.65408, 0, 0.8078431, 1, 1,
0.07014013, 1.150781, -0.3917334, 0, 0.8039216, 1, 1,
0.07052573, 0.8047296, 0.3554588, 0, 0.7960784, 1, 1,
0.07298819, 0.06456249, 1.194077, 0, 0.7882353, 1, 1,
0.0739639, 2.140191, 0.8295593, 0, 0.7843137, 1, 1,
0.07397287, 1.002757, -0.2473266, 0, 0.7764706, 1, 1,
0.07608741, 0.4778023, 1.928409, 0, 0.772549, 1, 1,
0.07716367, -0.364235, 1.116815, 0, 0.7647059, 1, 1,
0.07778502, -1.11104, 2.771655, 0, 0.7607843, 1, 1,
0.08080865, -1.936223, 1.625613, 0, 0.7529412, 1, 1,
0.08260024, 0.1840785, 1.586212, 0, 0.7490196, 1, 1,
0.08358364, -0.1159527, 2.142526, 0, 0.7411765, 1, 1,
0.08810864, -0.3374726, 1.382187, 0, 0.7372549, 1, 1,
0.09077819, -0.8682228, 4.47917, 0, 0.7294118, 1, 1,
0.09110858, -0.1537473, 2.931615, 0, 0.7254902, 1, 1,
0.09207024, 0.387623, 0.7918646, 0, 0.7176471, 1, 1,
0.0930783, -1.007328, 2.447627, 0, 0.7137255, 1, 1,
0.09572411, -0.8886956, 2.061947, 0, 0.7058824, 1, 1,
0.09572938, -0.9185095, 1.658172, 0, 0.6980392, 1, 1,
0.09751199, -0.7692182, 2.657684, 0, 0.6941177, 1, 1,
0.09779882, -1.006842, 1.635111, 0, 0.6862745, 1, 1,
0.1022362, 0.01573996, 1.107469, 0, 0.682353, 1, 1,
0.106089, -0.7972189, 3.790859, 0, 0.6745098, 1, 1,
0.1080492, 0.4728085, -1.019156, 0, 0.6705883, 1, 1,
0.1106726, -0.8425087, 3.179831, 0, 0.6627451, 1, 1,
0.112655, -0.8892337, 2.317141, 0, 0.6588235, 1, 1,
0.1129094, -1.423809, 2.670022, 0, 0.6509804, 1, 1,
0.1149802, -1.160075, 2.734868, 0, 0.6470588, 1, 1,
0.1272591, -0.9298825, 4.440301, 0, 0.6392157, 1, 1,
0.1301406, -1.728573, 2.785004, 0, 0.6352941, 1, 1,
0.1334426, -0.7970777, 3.275465, 0, 0.627451, 1, 1,
0.1373235, -1.268792, 2.484248, 0, 0.6235294, 1, 1,
0.1375794, -1.330194, 2.481761, 0, 0.6156863, 1, 1,
0.1406111, -0.08282675, 1.948575, 0, 0.6117647, 1, 1,
0.1410101, 0.3598179, -0.358955, 0, 0.6039216, 1, 1,
0.1438175, 0.6942695, 0.01342825, 0, 0.5960785, 1, 1,
0.1447882, -1.313576, 3.730964, 0, 0.5921569, 1, 1,
0.1478819, -0.1670003, 2.042976, 0, 0.5843138, 1, 1,
0.1483435, 0.8033269, 2.648715, 0, 0.5803922, 1, 1,
0.1506044, 0.3206393, -0.6625761, 0, 0.572549, 1, 1,
0.1559645, 0.6676344, -0.3113351, 0, 0.5686275, 1, 1,
0.1567882, -1.25501, 3.144132, 0, 0.5607843, 1, 1,
0.1571956, -0.09473282, 0.9890953, 0, 0.5568628, 1, 1,
0.16102, -1.13121, 3.45769, 0, 0.5490196, 1, 1,
0.1625452, -0.2650436, 1.672356, 0, 0.5450981, 1, 1,
0.1644367, 0.8730735, -0.7266914, 0, 0.5372549, 1, 1,
0.1673664, -1.008185, 2.941112, 0, 0.5333334, 1, 1,
0.1711685, -0.9866219, 4.283497, 0, 0.5254902, 1, 1,
0.1712359, -0.5600617, 3.504722, 0, 0.5215687, 1, 1,
0.176064, -0.4126925, 3.713775, 0, 0.5137255, 1, 1,
0.1779896, -0.233433, 2.057218, 0, 0.509804, 1, 1,
0.1785158, 0.2713812, 1.392091, 0, 0.5019608, 1, 1,
0.1815569, 0.3865565, 1.121862, 0, 0.4941176, 1, 1,
0.1820199, 0.3617859, 1.668954, 0, 0.4901961, 1, 1,
0.1871055, 1.47419, -1.757592, 0, 0.4823529, 1, 1,
0.187188, -0.1915216, 2.053764, 0, 0.4784314, 1, 1,
0.1885523, 0.9441968, 0.4150704, 0, 0.4705882, 1, 1,
0.1926571, 0.02237092, 3.160784, 0, 0.4666667, 1, 1,
0.195046, 1.126437, -1.18648, 0, 0.4588235, 1, 1,
0.1963906, 0.1015497, -0.02861315, 0, 0.454902, 1, 1,
0.2014743, 0.1127059, 1.000747, 0, 0.4470588, 1, 1,
0.2026581, -1.660203, 2.357268, 0, 0.4431373, 1, 1,
0.2037909, 0.110057, 2.031509, 0, 0.4352941, 1, 1,
0.2045773, 0.148123, 0.9977164, 0, 0.4313726, 1, 1,
0.2095092, 0.0675092, 1.549827, 0, 0.4235294, 1, 1,
0.2130027, 0.4040301, 0.353361, 0, 0.4196078, 1, 1,
0.2139463, 2.011878, 0.7400761, 0, 0.4117647, 1, 1,
0.2150777, -0.3258938, 2.578203, 0, 0.4078431, 1, 1,
0.2156905, -1.958855, 2.913178, 0, 0.4, 1, 1,
0.215792, -0.4376413, 3.799579, 0, 0.3921569, 1, 1,
0.2250821, 1.096871, 0.002097569, 0, 0.3882353, 1, 1,
0.2290015, 1.362401, 0.05517476, 0, 0.3803922, 1, 1,
0.2344219, -1.61187, 3.272964, 0, 0.3764706, 1, 1,
0.2359266, 0.6248411, -0.06929373, 0, 0.3686275, 1, 1,
0.2392438, 0.2723633, -1.800717, 0, 0.3647059, 1, 1,
0.2428358, -1.02837, 3.724793, 0, 0.3568628, 1, 1,
0.247975, 0.5145732, 1.563692, 0, 0.3529412, 1, 1,
0.2485346, -0.8447234, 2.612933, 0, 0.345098, 1, 1,
0.2488372, 0.2646202, -0.1350182, 0, 0.3411765, 1, 1,
0.2492294, -0.5295255, 4.440935, 0, 0.3333333, 1, 1,
0.2509347, -0.2648064, 3.483984, 0, 0.3294118, 1, 1,
0.2514352, 2.353723, 0.1495161, 0, 0.3215686, 1, 1,
0.2570934, 0.5069005, 0.3133655, 0, 0.3176471, 1, 1,
0.261593, 0.4225414, 1.544043, 0, 0.3098039, 1, 1,
0.2617038, -0.2732736, 1.231317, 0, 0.3058824, 1, 1,
0.2629835, -0.2574243, 3.016167, 0, 0.2980392, 1, 1,
0.2640665, 1.752754, 0.3706376, 0, 0.2901961, 1, 1,
0.2657518, -1.040131, 1.998008, 0, 0.2862745, 1, 1,
0.2670483, -1.129436, 3.968126, 0, 0.2784314, 1, 1,
0.2776709, 0.2915735, 0.5693154, 0, 0.2745098, 1, 1,
0.2817229, -1.339048, 1.39644, 0, 0.2666667, 1, 1,
0.2819644, -0.5371395, 2.478531, 0, 0.2627451, 1, 1,
0.290321, -0.3678284, 1.956178, 0, 0.254902, 1, 1,
0.2950146, -1.161309, 3.826054, 0, 0.2509804, 1, 1,
0.2957841, -1.742274, 1.762263, 0, 0.2431373, 1, 1,
0.2962529, -0.7809573, 3.30746, 0, 0.2392157, 1, 1,
0.3034403, 0.2063286, 1.227679, 0, 0.2313726, 1, 1,
0.3121391, 1.409152, -0.711092, 0, 0.227451, 1, 1,
0.3122908, -1.233758, 4.0667, 0, 0.2196078, 1, 1,
0.3130846, 0.8657727, 0.02513826, 0, 0.2156863, 1, 1,
0.3149504, 1.083889, -1.111455, 0, 0.2078431, 1, 1,
0.3201709, -0.180443, 2.11648, 0, 0.2039216, 1, 1,
0.3263952, 1.671787, -1.245914, 0, 0.1960784, 1, 1,
0.3268756, 0.4013247, 0.1682905, 0, 0.1882353, 1, 1,
0.3288417, -0.7116735, 5.356499, 0, 0.1843137, 1, 1,
0.3290127, -1.02179, 2.28989, 0, 0.1764706, 1, 1,
0.3290837, 0.155395, 2.292063, 0, 0.172549, 1, 1,
0.3295463, -2.433905, 4.243359, 0, 0.1647059, 1, 1,
0.3302712, -0.3200853, 2.114686, 0, 0.1607843, 1, 1,
0.3315554, 0.08703953, 0.5849041, 0, 0.1529412, 1, 1,
0.3320175, 0.5261465, -1.776475, 0, 0.1490196, 1, 1,
0.3369618, -0.4420678, 1.765386, 0, 0.1411765, 1, 1,
0.3411693, -0.05874917, 2.543559, 0, 0.1372549, 1, 1,
0.344791, 0.3729355, -0.1649559, 0, 0.1294118, 1, 1,
0.3451185, 0.3067751, 1.070844, 0, 0.1254902, 1, 1,
0.3458228, 2.491627, -0.1620735, 0, 0.1176471, 1, 1,
0.3463455, -0.3882424, 3.036645, 0, 0.1137255, 1, 1,
0.3470141, 0.9925321, 0.3500817, 0, 0.1058824, 1, 1,
0.3474836, 0.5269822, 1.210546, 0, 0.09803922, 1, 1,
0.3577788, -1.198271, 4.092068, 0, 0.09411765, 1, 1,
0.3643316, 1.367418, 0.745202, 0, 0.08627451, 1, 1,
0.3658708, 0.5817946, -0.303368, 0, 0.08235294, 1, 1,
0.3678983, -2.169702, 3.748631, 0, 0.07450981, 1, 1,
0.3715688, -0.03586583, 0.6183672, 0, 0.07058824, 1, 1,
0.3740417, 0.2187147, 0.5386761, 0, 0.0627451, 1, 1,
0.3804221, 0.2068912, 0.3240995, 0, 0.05882353, 1, 1,
0.38257, -0.005687349, 1.117098, 0, 0.05098039, 1, 1,
0.3839105, 1.896111, -0.3782371, 0, 0.04705882, 1, 1,
0.3841435, 0.03061841, 0.8553062, 0, 0.03921569, 1, 1,
0.385114, -0.6883636, 3.506711, 0, 0.03529412, 1, 1,
0.3932907, -1.244806, 3.190938, 0, 0.02745098, 1, 1,
0.3979559, -1.692172, 2.815445, 0, 0.02352941, 1, 1,
0.3996465, 0.2034819, 0.773986, 0, 0.01568628, 1, 1,
0.4014717, 0.7133833, 1.980869, 0, 0.01176471, 1, 1,
0.4022936, 1.819402, -0.2837244, 0, 0.003921569, 1, 1,
0.4040317, -1.230668, 2.578693, 0.003921569, 0, 1, 1,
0.4122018, 0.2140487, 1.431783, 0.007843138, 0, 1, 1,
0.4133972, 0.8581291, -1.512046, 0.01568628, 0, 1, 1,
0.4180042, 0.669703, 1.073891, 0.01960784, 0, 1, 1,
0.4299447, 0.4409597, -0.09782571, 0.02745098, 0, 1, 1,
0.4327499, 2.573352, 2.371123, 0.03137255, 0, 1, 1,
0.4332745, 0.07286604, 1.942862, 0.03921569, 0, 1, 1,
0.4355194, -0.3012588, 2.03186, 0.04313726, 0, 1, 1,
0.4358085, -0.1399722, 3.51841, 0.05098039, 0, 1, 1,
0.4359598, -0.5324477, 1.583212, 0.05490196, 0, 1, 1,
0.4367495, 1.474492, 0.7798536, 0.0627451, 0, 1, 1,
0.4456362, -0.8757969, 1.640636, 0.06666667, 0, 1, 1,
0.4512354, 0.8971863, -0.2100534, 0.07450981, 0, 1, 1,
0.4517367, -0.2535214, 0.9238701, 0.07843138, 0, 1, 1,
0.4526967, -0.6512856, 2.242786, 0.08627451, 0, 1, 1,
0.4576846, 0.06162477, -0.2677538, 0.09019608, 0, 1, 1,
0.4589683, -0.5703148, 2.712617, 0.09803922, 0, 1, 1,
0.4602778, 0.02140764, 1.15923, 0.1058824, 0, 1, 1,
0.4619108, -0.2073854, 0.7564061, 0.1098039, 0, 1, 1,
0.4625627, 0.5696341, 0.5329752, 0.1176471, 0, 1, 1,
0.465232, 0.09340426, 2.923302, 0.1215686, 0, 1, 1,
0.4669962, -0.1131652, 1.794167, 0.1294118, 0, 1, 1,
0.4671278, -0.171517, 0.8782873, 0.1333333, 0, 1, 1,
0.4674924, 0.8218254, 2.300558, 0.1411765, 0, 1, 1,
0.4716516, 1.820852, 0.9727732, 0.145098, 0, 1, 1,
0.4780915, -1.53209, 2.872141, 0.1529412, 0, 1, 1,
0.4792569, -0.3405851, 3.52259, 0.1568628, 0, 1, 1,
0.4813118, -1.316028, 3.115904, 0.1647059, 0, 1, 1,
0.4816642, -1.864295, 2.305539, 0.1686275, 0, 1, 1,
0.4819558, -0.3583806, 1.182827, 0.1764706, 0, 1, 1,
0.4839266, 0.4412655, 1.177528, 0.1803922, 0, 1, 1,
0.4842768, 0.5732352, -1.587305, 0.1882353, 0, 1, 1,
0.4908259, -0.842531, 2.869446, 0.1921569, 0, 1, 1,
0.4942292, -0.4415082, 2.241613, 0.2, 0, 1, 1,
0.4986448, -1.246293, 2.14426, 0.2078431, 0, 1, 1,
0.5035462, -0.7939842, 5.585717, 0.2117647, 0, 1, 1,
0.5061249, -0.09660063, 1.574014, 0.2196078, 0, 1, 1,
0.511106, -0.1266695, 1.502692, 0.2235294, 0, 1, 1,
0.5166569, 0.5273771, -0.6694215, 0.2313726, 0, 1, 1,
0.5204142, 0.9499898, 1.327959, 0.2352941, 0, 1, 1,
0.5267388, -0.706776, 1.216125, 0.2431373, 0, 1, 1,
0.5310485, -0.1785768, 2.953573, 0.2470588, 0, 1, 1,
0.5357681, -1.094967, 3.334339, 0.254902, 0, 1, 1,
0.5393359, 0.3794484, 1.543857, 0.2588235, 0, 1, 1,
0.5421057, -0.8568417, 3.418552, 0.2666667, 0, 1, 1,
0.5454556, -0.5380909, 1.495477, 0.2705882, 0, 1, 1,
0.5459316, -0.09983492, 1.643709, 0.2784314, 0, 1, 1,
0.5463082, -1.166476, 0.8349746, 0.282353, 0, 1, 1,
0.5500108, -2.068003, 4.90609, 0.2901961, 0, 1, 1,
0.5543289, 1.287439, 2.451855, 0.2941177, 0, 1, 1,
0.555791, -0.1767476, 2.772592, 0.3019608, 0, 1, 1,
0.5617861, 1.234925, 1.18537, 0.3098039, 0, 1, 1,
0.5630748, -0.5002974, 2.835997, 0.3137255, 0, 1, 1,
0.5743732, 1.097163, 0.704155, 0.3215686, 0, 1, 1,
0.5756323, 0.4689828, 1.192225, 0.3254902, 0, 1, 1,
0.5796551, 1.505814, 0.1872136, 0.3333333, 0, 1, 1,
0.5804017, -0.9917571, 3.105928, 0.3372549, 0, 1, 1,
0.5855766, 1.300178, 0.5935274, 0.345098, 0, 1, 1,
0.5867476, 0.4979017, -1.731583, 0.3490196, 0, 1, 1,
0.5947408, -0.2093627, 0.4848625, 0.3568628, 0, 1, 1,
0.5950596, -0.889793, 3.154468, 0.3607843, 0, 1, 1,
0.5962198, 0.951374, 1.013768, 0.3686275, 0, 1, 1,
0.6023371, 0.1760238, 1.533302, 0.372549, 0, 1, 1,
0.6036316, 1.079719, 0.07283684, 0.3803922, 0, 1, 1,
0.6047096, -0.1089977, 1.145788, 0.3843137, 0, 1, 1,
0.6050867, -0.2463674, -0.8070051, 0.3921569, 0, 1, 1,
0.6061541, -0.93831, 1.599017, 0.3960784, 0, 1, 1,
0.6066444, -0.5680871, 4.378333, 0.4039216, 0, 1, 1,
0.607801, 0.2257692, 0.3890911, 0.4117647, 0, 1, 1,
0.6112989, 0.8477517, 1.608278, 0.4156863, 0, 1, 1,
0.6143619, -1.573303, 4.0995, 0.4235294, 0, 1, 1,
0.6164921, -0.04947096, 2.237694, 0.427451, 0, 1, 1,
0.6220473, 1.090848, 1.89751, 0.4352941, 0, 1, 1,
0.622301, -2.035364, 2.977552, 0.4392157, 0, 1, 1,
0.6230819, 0.1363092, 0.8714746, 0.4470588, 0, 1, 1,
0.6245085, 0.2685502, 0.5343628, 0.4509804, 0, 1, 1,
0.6248809, 0.5656106, 0.8601711, 0.4588235, 0, 1, 1,
0.6310969, 0.5638588, 0.9395456, 0.4627451, 0, 1, 1,
0.6314149, -1.07531, 0.9252892, 0.4705882, 0, 1, 1,
0.6336456, 0.675904, 0.3120131, 0.4745098, 0, 1, 1,
0.637848, -1.475703, 2.815078, 0.4823529, 0, 1, 1,
0.6387396, -0.2921949, 0.5661954, 0.4862745, 0, 1, 1,
0.6403182, 0.2310226, -0.187464, 0.4941176, 0, 1, 1,
0.6498411, 1.75164, 0.8099771, 0.5019608, 0, 1, 1,
0.6548556, 0.2171745, 1.742968, 0.5058824, 0, 1, 1,
0.6618279, -0.2413997, 2.538826, 0.5137255, 0, 1, 1,
0.6621397, 0.03069652, 2.510031, 0.5176471, 0, 1, 1,
0.6628885, 1.863064, 0.9552563, 0.5254902, 0, 1, 1,
0.6649341, 0.9839173, -0.4928378, 0.5294118, 0, 1, 1,
0.667969, -0.8514673, 3.267062, 0.5372549, 0, 1, 1,
0.6688773, 0.90878, 0.7946429, 0.5411765, 0, 1, 1,
0.6712945, -1.260431, 2.148218, 0.5490196, 0, 1, 1,
0.6735902, -0.5847972, 1.388412, 0.5529412, 0, 1, 1,
0.6770172, -1.124789, 3.511873, 0.5607843, 0, 1, 1,
0.6771839, 1.065524, 1.421356, 0.5647059, 0, 1, 1,
0.6796514, -1.303338, 2.254323, 0.572549, 0, 1, 1,
0.6836313, -1.05436, 4.169238, 0.5764706, 0, 1, 1,
0.689482, -0.5771853, 1.337668, 0.5843138, 0, 1, 1,
0.6917378, -0.01688876, 2.236992, 0.5882353, 0, 1, 1,
0.6929678, 0.1320882, 0.09886912, 0.5960785, 0, 1, 1,
0.6937531, 1.294774, 1.000561, 0.6039216, 0, 1, 1,
0.7132027, -1.147037, 2.95003, 0.6078432, 0, 1, 1,
0.7138613, 0.86759, 0.486799, 0.6156863, 0, 1, 1,
0.7190625, 0.4885871, 0.04849218, 0.6196079, 0, 1, 1,
0.7290357, -0.7850821, 2.663911, 0.627451, 0, 1, 1,
0.7326783, -0.376718, 1.511709, 0.6313726, 0, 1, 1,
0.7340912, 0.4579698, 2.286623, 0.6392157, 0, 1, 1,
0.7377582, 0.3946456, 2.224081, 0.6431373, 0, 1, 1,
0.7424477, -1.047943, 3.868374, 0.6509804, 0, 1, 1,
0.7441713, 0.6789986, 0.4107914, 0.654902, 0, 1, 1,
0.7471543, 0.7193106, 2.128046, 0.6627451, 0, 1, 1,
0.7499591, -0.3749832, 0.8056222, 0.6666667, 0, 1, 1,
0.7499794, -0.4287122, 1.607083, 0.6745098, 0, 1, 1,
0.7693026, -0.6648594, 2.423368, 0.6784314, 0, 1, 1,
0.7737018, 1.276356, 0.08393927, 0.6862745, 0, 1, 1,
0.776755, -0.5199246, 3.754292, 0.6901961, 0, 1, 1,
0.7784747, 0.7831287, -0.2347895, 0.6980392, 0, 1, 1,
0.7793419, 1.732423, 0.5795074, 0.7058824, 0, 1, 1,
0.7807191, 0.0327678, 1.477439, 0.7098039, 0, 1, 1,
0.7871702, -1.225366, 2.740047, 0.7176471, 0, 1, 1,
0.7885615, -0.66864, 1.361235, 0.7215686, 0, 1, 1,
0.7906919, -0.7515287, 2.983505, 0.7294118, 0, 1, 1,
0.7950045, -0.0315459, 2.013895, 0.7333333, 0, 1, 1,
0.795091, -1.022727, 3.002947, 0.7411765, 0, 1, 1,
0.7957802, 0.9203952, 1.857292, 0.7450981, 0, 1, 1,
0.7975636, -1.123555, 1.813599, 0.7529412, 0, 1, 1,
0.8004952, 1.519908, -0.6854188, 0.7568628, 0, 1, 1,
0.8017145, 0.1701478, 2.559531, 0.7647059, 0, 1, 1,
0.8071685, -1.11981, 2.990644, 0.7686275, 0, 1, 1,
0.8084717, 0.769441, -0.360771, 0.7764706, 0, 1, 1,
0.8091832, -0.4316666, 0.4251327, 0.7803922, 0, 1, 1,
0.8092092, -0.1788016, 4.279296, 0.7882353, 0, 1, 1,
0.8184502, -0.4213107, 1.234923, 0.7921569, 0, 1, 1,
0.8196412, -0.1437415, 0.8716421, 0.8, 0, 1, 1,
0.8205588, 0.6830405, 1.314497, 0.8078431, 0, 1, 1,
0.8231219, 0.7959301, 2.071117, 0.8117647, 0, 1, 1,
0.8273132, 0.2319693, 1.426171, 0.8196079, 0, 1, 1,
0.8273196, -0.3050137, 0.320394, 0.8235294, 0, 1, 1,
0.8300548, -0.3173634, 2.594588, 0.8313726, 0, 1, 1,
0.8363639, -1.01617, 3.769842, 0.8352941, 0, 1, 1,
0.8382668, 0.7656286, 1.973029, 0.8431373, 0, 1, 1,
0.8385059, -0.7468054, 3.259281, 0.8470588, 0, 1, 1,
0.8455594, 1.28332, 0.3564545, 0.854902, 0, 1, 1,
0.8465776, 1.15596, 0.01900988, 0.8588235, 0, 1, 1,
0.8503734, 0.6651334, 0.6923473, 0.8666667, 0, 1, 1,
0.8665304, -2.251631, 3.427966, 0.8705882, 0, 1, 1,
0.8688031, -0.01797748, 2.227348, 0.8784314, 0, 1, 1,
0.8717559, 0.8847875, 1.402976, 0.8823529, 0, 1, 1,
0.8847057, 0.4639223, 1.901983, 0.8901961, 0, 1, 1,
0.8905702, 0.03173441, 0.7562369, 0.8941177, 0, 1, 1,
0.8968691, -0.8520512, 2.098655, 0.9019608, 0, 1, 1,
0.897658, -0.5252771, 2.932086, 0.9098039, 0, 1, 1,
0.9056417, -0.3856763, 2.131913, 0.9137255, 0, 1, 1,
0.9131632, 0.2420412, 1.882885, 0.9215686, 0, 1, 1,
0.9164358, 0.6015427, 3.239296, 0.9254902, 0, 1, 1,
0.9166968, 1.247086, 1.131435, 0.9333333, 0, 1, 1,
0.9169441, -0.7253096, 3.117999, 0.9372549, 0, 1, 1,
0.9213871, 0.2223058, 1.410518, 0.945098, 0, 1, 1,
0.9223393, -0.1393744, 0.8364875, 0.9490196, 0, 1, 1,
0.9237899, 0.4978733, 0.8649094, 0.9568627, 0, 1, 1,
0.9254837, -0.02690977, 1.718785, 0.9607843, 0, 1, 1,
0.9271467, -1.327492, 2.541933, 0.9686275, 0, 1, 1,
0.9272254, -1.123225, 1.81544, 0.972549, 0, 1, 1,
0.9330299, 0.8604707, 3.207288, 0.9803922, 0, 1, 1,
0.9333732, 0.2499882, 1.476953, 0.9843137, 0, 1, 1,
0.935639, 0.4757428, 1.997712, 0.9921569, 0, 1, 1,
0.9444402, -1.080209, 2.886049, 0.9960784, 0, 1, 1,
0.950246, -0.6854671, 3.045852, 1, 0, 0.9960784, 1,
0.9548672, -0.6160402, 0.899491, 1, 0, 0.9882353, 1,
0.9563419, -1.159733, 1.213514, 1, 0, 0.9843137, 1,
0.9626623, 0.4407642, 0.05519246, 1, 0, 0.9764706, 1,
0.9634041, 1.737785, -0.1826735, 1, 0, 0.972549, 1,
0.9645685, -0.6385925, 1.920287, 1, 0, 0.9647059, 1,
0.9669252, -1.234027, 1.717299, 1, 0, 0.9607843, 1,
0.9732323, 0.009295241, 1.474685, 1, 0, 0.9529412, 1,
0.980616, 0.7487825, 2.955974, 1, 0, 0.9490196, 1,
0.985999, 0.8892047, 1.01588, 1, 0, 0.9411765, 1,
0.9877533, 0.3474024, 1.646235, 1, 0, 0.9372549, 1,
0.9889052, -1.136971, 4.189496, 1, 0, 0.9294118, 1,
0.9906091, -1.408844, 3.241116, 1, 0, 0.9254902, 1,
0.9937833, 0.370707, 2.544697, 1, 0, 0.9176471, 1,
0.9998508, 0.3447815, 1.464557, 1, 0, 0.9137255, 1,
1.002295, -0.9798934, 2.409895, 1, 0, 0.9058824, 1,
1.008902, 0.9043882, -0.04302471, 1, 0, 0.9019608, 1,
1.011082, 0.5781137, 0.9015091, 1, 0, 0.8941177, 1,
1.011527, -0.06801186, 0.3658243, 1, 0, 0.8862745, 1,
1.016488, -0.9624791, 2.433179, 1, 0, 0.8823529, 1,
1.018523, -0.3790751, 3.578933, 1, 0, 0.8745098, 1,
1.018822, 0.1940856, 1.082099, 1, 0, 0.8705882, 1,
1.031092, 0.9857219, 2.085785, 1, 0, 0.8627451, 1,
1.039617, -0.3847762, 1.75679, 1, 0, 0.8588235, 1,
1.041831, 0.3951859, 0.9447122, 1, 0, 0.8509804, 1,
1.043604, 1.344067, 0.4359892, 1, 0, 0.8470588, 1,
1.054732, 0.02845138, 1.365963, 1, 0, 0.8392157, 1,
1.056663, -2.146988, 2.70408, 1, 0, 0.8352941, 1,
1.058912, -0.5773588, 2.976414, 1, 0, 0.827451, 1,
1.061734, -0.3394883, 0.6092288, 1, 0, 0.8235294, 1,
1.06358, 0.1114681, 1.131797, 1, 0, 0.8156863, 1,
1.068456, -0.7676786, 1.959707, 1, 0, 0.8117647, 1,
1.070896, -1.956265, 3.637129, 1, 0, 0.8039216, 1,
1.075143, 0.0002938653, 1.752951, 1, 0, 0.7960784, 1,
1.07765, -0.7202519, 2.704852, 1, 0, 0.7921569, 1,
1.082384, -0.1911303, 0.2676369, 1, 0, 0.7843137, 1,
1.090838, 1.77948, -0.3562455, 1, 0, 0.7803922, 1,
1.101981, 0.2000881, 2.068207, 1, 0, 0.772549, 1,
1.111677, 0.5151395, 1.158426, 1, 0, 0.7686275, 1,
1.112163, 0.2397719, 0.5047915, 1, 0, 0.7607843, 1,
1.121215, 0.2362931, 1.660149, 1, 0, 0.7568628, 1,
1.130948, -0.5910277, 0.4798508, 1, 0, 0.7490196, 1,
1.141288, -0.2332552, 2.296535, 1, 0, 0.7450981, 1,
1.145047, 0.5915504, -0.1869392, 1, 0, 0.7372549, 1,
1.146164, -1.509967, 2.668425, 1, 0, 0.7333333, 1,
1.148051, 1.386469, 0.02202334, 1, 0, 0.7254902, 1,
1.152945, 0.8907586, 1.703711, 1, 0, 0.7215686, 1,
1.168732, -1.212684, 1.885602, 1, 0, 0.7137255, 1,
1.169745, -0.02858771, 1.489211, 1, 0, 0.7098039, 1,
1.171253, 2.06544, 1.016277, 1, 0, 0.7019608, 1,
1.173267, 0.8510292, 1.005381, 1, 0, 0.6941177, 1,
1.173323, -0.01062553, 2.33594, 1, 0, 0.6901961, 1,
1.186565, -0.1920355, 1.084541, 1, 0, 0.682353, 1,
1.187025, 1.068179, -0.4317429, 1, 0, 0.6784314, 1,
1.201108, 0.7213146, 0.8648879, 1, 0, 0.6705883, 1,
1.208357, 1.255994, 0.501834, 1, 0, 0.6666667, 1,
1.212897, 0.7875934, 1.054347, 1, 0, 0.6588235, 1,
1.214323, -1.327355, 2.972617, 1, 0, 0.654902, 1,
1.218059, -0.4282073, 1.1656, 1, 0, 0.6470588, 1,
1.224913, 0.4935766, 0.9517529, 1, 0, 0.6431373, 1,
1.241542, 2.192194, -1.87666, 1, 0, 0.6352941, 1,
1.246474, -0.3347368, 1.290947, 1, 0, 0.6313726, 1,
1.247744, 0.05025968, 3.099242, 1, 0, 0.6235294, 1,
1.251076, -0.937454, 2.278755, 1, 0, 0.6196079, 1,
1.260304, -1.561887, 2.293799, 1, 0, 0.6117647, 1,
1.260903, 0.217026, 0.6697862, 1, 0, 0.6078432, 1,
1.289011, -0.2277984, -0.4442779, 1, 0, 0.6, 1,
1.291428, -0.7370796, 4.204042, 1, 0, 0.5921569, 1,
1.29371, 0.4835878, 1.070721, 1, 0, 0.5882353, 1,
1.30259, 0.7991917, 0.04071342, 1, 0, 0.5803922, 1,
1.306588, 0.9365051, 1.748692, 1, 0, 0.5764706, 1,
1.310883, -2.449206, 1.176129, 1, 0, 0.5686275, 1,
1.312374, 1.393133, 0.4401959, 1, 0, 0.5647059, 1,
1.316177, -0.06710415, 0.2659148, 1, 0, 0.5568628, 1,
1.325125, -0.2216617, 2.053891, 1, 0, 0.5529412, 1,
1.336274, -0.119662, 1.94544, 1, 0, 0.5450981, 1,
1.348908, -0.5732545, 2.715252, 1, 0, 0.5411765, 1,
1.358146, 1.05995, -0.1506709, 1, 0, 0.5333334, 1,
1.359165, 0.8896046, 1.326489, 1, 0, 0.5294118, 1,
1.366472, -1.302056, 2.426586, 1, 0, 0.5215687, 1,
1.368593, -1.37794, 1.615393, 1, 0, 0.5176471, 1,
1.371171, 0.5442466, 0.8109591, 1, 0, 0.509804, 1,
1.375809, -0.05285765, 1.204256, 1, 0, 0.5058824, 1,
1.376397, 1.931928, 2.209182, 1, 0, 0.4980392, 1,
1.37669, -0.6455688, 1.188446, 1, 0, 0.4901961, 1,
1.377792, 0.6286445, -0.2079986, 1, 0, 0.4862745, 1,
1.386511, -0.9385921, 1.037077, 1, 0, 0.4784314, 1,
1.409774, 0.2123596, 0.2765646, 1, 0, 0.4745098, 1,
1.432732, 0.7590731, 1.045238, 1, 0, 0.4666667, 1,
1.437599, 1.362295, 1.430217, 1, 0, 0.4627451, 1,
1.457474, -0.8577368, 2.256116, 1, 0, 0.454902, 1,
1.457981, 0.690483, 0.704737, 1, 0, 0.4509804, 1,
1.463839, -0.8268573, 2.4558, 1, 0, 0.4431373, 1,
1.476061, 0.09415288, 2.199263, 1, 0, 0.4392157, 1,
1.494471, 0.9553798, 1.484223, 1, 0, 0.4313726, 1,
1.494996, 1.356927, 1.009863, 1, 0, 0.427451, 1,
1.498397, 0.8095929, 2.309433, 1, 0, 0.4196078, 1,
1.49934, -0.1040579, 2.366166, 1, 0, 0.4156863, 1,
1.499987, 0.6249585, 3.062244, 1, 0, 0.4078431, 1,
1.500885, 0.3253311, 2.288544, 1, 0, 0.4039216, 1,
1.502326, 0.4788179, 2.522229, 1, 0, 0.3960784, 1,
1.506247, -1.626023, 3.342287, 1, 0, 0.3882353, 1,
1.523123, -0.03350312, 1.1654, 1, 0, 0.3843137, 1,
1.531501, 1.241925, 1.151482, 1, 0, 0.3764706, 1,
1.535417, 1.876495, 0.9270152, 1, 0, 0.372549, 1,
1.535881, -0.650197, 0.8211774, 1, 0, 0.3647059, 1,
1.537359, 0.237676, 1.781275, 1, 0, 0.3607843, 1,
1.561653, 0.418102, 0.8137013, 1, 0, 0.3529412, 1,
1.57026, -0.6165264, 0.7290617, 1, 0, 0.3490196, 1,
1.584725, 0.1305096, 1.068479, 1, 0, 0.3411765, 1,
1.60854, -1.114217, 0.9534347, 1, 0, 0.3372549, 1,
1.624308, 0.3902724, 1.224227, 1, 0, 0.3294118, 1,
1.632528, 0.5098019, 1.419147, 1, 0, 0.3254902, 1,
1.634537, 0.3669209, 1.731723, 1, 0, 0.3176471, 1,
1.640149, 1.291165, 0.816588, 1, 0, 0.3137255, 1,
1.668972, 1.85382, 0.9791004, 1, 0, 0.3058824, 1,
1.688572, 2.375185, 2.713767, 1, 0, 0.2980392, 1,
1.693272, 0.8466035, 0.6736635, 1, 0, 0.2941177, 1,
1.699168, -1.434545, 3.457831, 1, 0, 0.2862745, 1,
1.705062, -0.09342737, 3.464688, 1, 0, 0.282353, 1,
1.727907, 1.273042, 1.436579, 1, 0, 0.2745098, 1,
1.735543, 0.5614994, -0.1347658, 1, 0, 0.2705882, 1,
1.73599, 1.073676, 2.300553, 1, 0, 0.2627451, 1,
1.737022, -0.2236509, 2.933229, 1, 0, 0.2588235, 1,
1.746775, -0.7073758, 3.065281, 1, 0, 0.2509804, 1,
1.74988, -0.2099225, 2.615761, 1, 0, 0.2470588, 1,
1.773145, 0.5240993, 2.722553, 1, 0, 0.2392157, 1,
1.779834, -0.03956292, 2.40038, 1, 0, 0.2352941, 1,
1.781514, -0.6851883, 1.456808, 1, 0, 0.227451, 1,
1.81135, 0.2629777, -0.223368, 1, 0, 0.2235294, 1,
1.819908, -0.2779029, -0.1727101, 1, 0, 0.2156863, 1,
1.824461, -0.5289288, 2.257841, 1, 0, 0.2117647, 1,
1.853202, 1.311921, 1.817823, 1, 0, 0.2039216, 1,
1.858086, 1.007698, 1.002889, 1, 0, 0.1960784, 1,
1.871618, 1.70015, 0.02510761, 1, 0, 0.1921569, 1,
1.876197, -0.8851858, 2.030897, 1, 0, 0.1843137, 1,
1.881268, -0.06583215, 1.884392, 1, 0, 0.1803922, 1,
1.898916, 1.337185, 0.236014, 1, 0, 0.172549, 1,
1.924048, -0.4798933, 1.373735, 1, 0, 0.1686275, 1,
1.932778, 0.9629444, -0.02631747, 1, 0, 0.1607843, 1,
1.937543, 0.637315, 0.06509659, 1, 0, 0.1568628, 1,
1.959601, -0.2375358, 2.881745, 1, 0, 0.1490196, 1,
1.966414, -1.703355, 3.05164, 1, 0, 0.145098, 1,
1.97024, 0.91545, 1.853053, 1, 0, 0.1372549, 1,
1.972679, -0.04619415, 1.631108, 1, 0, 0.1333333, 1,
1.996534, -0.6759968, 3.025017, 1, 0, 0.1254902, 1,
2.001066, -1.19459, 2.866668, 1, 0, 0.1215686, 1,
2.010314, -0.6535938, 2.503904, 1, 0, 0.1137255, 1,
2.020625, 0.5333216, 1.905479, 1, 0, 0.1098039, 1,
2.046069, -0.9730061, 1.24004, 1, 0, 0.1019608, 1,
2.057556, 0.1851518, 1.052714, 1, 0, 0.09411765, 1,
2.067171, 1.664902, 2.464428, 1, 0, 0.09019608, 1,
2.11182, -1.219489, 3.888676, 1, 0, 0.08235294, 1,
2.114125, -0.09811021, 0.3200696, 1, 0, 0.07843138, 1,
2.218748, -0.5283892, 2.25818, 1, 0, 0.07058824, 1,
2.281508, -1.563483, 3.375282, 1, 0, 0.06666667, 1,
2.296608, -0.785321, 1.92878, 1, 0, 0.05882353, 1,
2.314914, 0.06641877, 1.829166, 1, 0, 0.05490196, 1,
2.345254, 1.428427, -0.229533, 1, 0, 0.04705882, 1,
2.358494, 0.6906792, 0.3935402, 1, 0, 0.04313726, 1,
2.43796, -0.3991386, 1.350501, 1, 0, 0.03529412, 1,
2.438875, -0.3476523, 1.569309, 1, 0, 0.03137255, 1,
2.440133, -0.3974558, -0.5847449, 1, 0, 0.02352941, 1,
2.546372, -2.152313, 1.953687, 1, 0, 0.01960784, 1,
2.633464, -0.9733812, 2.980095, 1, 0, 0.01176471, 1,
2.693783, -1.898376, 1.705283, 1, 0, 0.007843138, 1
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
-0.3045232, -3.898118, -6.794651, 0, -0.5, 0.5, 0.5,
-0.3045232, -3.898118, -6.794651, 1, -0.5, 0.5, 0.5,
-0.3045232, -3.898118, -6.794651, 1, 1.5, 0.5, 0.5,
-0.3045232, -3.898118, -6.794651, 0, 1.5, 0.5, 0.5
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
-4.319255, -0.04691374, -6.794651, 0, -0.5, 0.5, 0.5,
-4.319255, -0.04691374, -6.794651, 1, -0.5, 0.5, 0.5,
-4.319255, -0.04691374, -6.794651, 1, 1.5, 0.5, 0.5,
-4.319255, -0.04691374, -6.794651, 0, 1.5, 0.5, 0.5
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
-4.319255, -3.898118, 0.2926993, 0, -0.5, 0.5, 0.5,
-4.319255, -3.898118, 0.2926993, 1, -0.5, 0.5, 0.5,
-4.319255, -3.898118, 0.2926993, 1, 1.5, 0.5, 0.5,
-4.319255, -3.898118, 0.2926993, 0, 1.5, 0.5, 0.5
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
-3, -3.009378, -5.159109,
2, -3.009378, -5.159109,
-3, -3.009378, -5.159109,
-3, -3.157502, -5.431699,
-2, -3.009378, -5.159109,
-2, -3.157502, -5.431699,
-1, -3.009378, -5.159109,
-1, -3.157502, -5.431699,
0, -3.009378, -5.159109,
0, -3.157502, -5.431699,
1, -3.009378, -5.159109,
1, -3.157502, -5.431699,
2, -3.009378, -5.159109,
2, -3.157502, -5.431699
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
-3, -3.453748, -5.97688, 0, -0.5, 0.5, 0.5,
-3, -3.453748, -5.97688, 1, -0.5, 0.5, 0.5,
-3, -3.453748, -5.97688, 1, 1.5, 0.5, 0.5,
-3, -3.453748, -5.97688, 0, 1.5, 0.5, 0.5,
-2, -3.453748, -5.97688, 0, -0.5, 0.5, 0.5,
-2, -3.453748, -5.97688, 1, -0.5, 0.5, 0.5,
-2, -3.453748, -5.97688, 1, 1.5, 0.5, 0.5,
-2, -3.453748, -5.97688, 0, 1.5, 0.5, 0.5,
-1, -3.453748, -5.97688, 0, -0.5, 0.5, 0.5,
-1, -3.453748, -5.97688, 1, -0.5, 0.5, 0.5,
-1, -3.453748, -5.97688, 1, 1.5, 0.5, 0.5,
-1, -3.453748, -5.97688, 0, 1.5, 0.5, 0.5,
0, -3.453748, -5.97688, 0, -0.5, 0.5, 0.5,
0, -3.453748, -5.97688, 1, -0.5, 0.5, 0.5,
0, -3.453748, -5.97688, 1, 1.5, 0.5, 0.5,
0, -3.453748, -5.97688, 0, 1.5, 0.5, 0.5,
1, -3.453748, -5.97688, 0, -0.5, 0.5, 0.5,
1, -3.453748, -5.97688, 1, -0.5, 0.5, 0.5,
1, -3.453748, -5.97688, 1, 1.5, 0.5, 0.5,
1, -3.453748, -5.97688, 0, 1.5, 0.5, 0.5,
2, -3.453748, -5.97688, 0, -0.5, 0.5, 0.5,
2, -3.453748, -5.97688, 1, -0.5, 0.5, 0.5,
2, -3.453748, -5.97688, 1, 1.5, 0.5, 0.5,
2, -3.453748, -5.97688, 0, 1.5, 0.5, 0.5
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
-3.392779, -2, -5.159109,
-3.392779, 2, -5.159109,
-3.392779, -2, -5.159109,
-3.547191, -2, -5.431699,
-3.392779, -1, -5.159109,
-3.547191, -1, -5.431699,
-3.392779, 0, -5.159109,
-3.547191, 0, -5.431699,
-3.392779, 1, -5.159109,
-3.547191, 1, -5.431699,
-3.392779, 2, -5.159109,
-3.547191, 2, -5.431699
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
-3.856017, -2, -5.97688, 0, -0.5, 0.5, 0.5,
-3.856017, -2, -5.97688, 1, -0.5, 0.5, 0.5,
-3.856017, -2, -5.97688, 1, 1.5, 0.5, 0.5,
-3.856017, -2, -5.97688, 0, 1.5, 0.5, 0.5,
-3.856017, -1, -5.97688, 0, -0.5, 0.5, 0.5,
-3.856017, -1, -5.97688, 1, -0.5, 0.5, 0.5,
-3.856017, -1, -5.97688, 1, 1.5, 0.5, 0.5,
-3.856017, -1, -5.97688, 0, 1.5, 0.5, 0.5,
-3.856017, 0, -5.97688, 0, -0.5, 0.5, 0.5,
-3.856017, 0, -5.97688, 1, -0.5, 0.5, 0.5,
-3.856017, 0, -5.97688, 1, 1.5, 0.5, 0.5,
-3.856017, 0, -5.97688, 0, 1.5, 0.5, 0.5,
-3.856017, 1, -5.97688, 0, -0.5, 0.5, 0.5,
-3.856017, 1, -5.97688, 1, -0.5, 0.5, 0.5,
-3.856017, 1, -5.97688, 1, 1.5, 0.5, 0.5,
-3.856017, 1, -5.97688, 0, 1.5, 0.5, 0.5,
-3.856017, 2, -5.97688, 0, -0.5, 0.5, 0.5,
-3.856017, 2, -5.97688, 1, -0.5, 0.5, 0.5,
-3.856017, 2, -5.97688, 1, 1.5, 0.5, 0.5,
-3.856017, 2, -5.97688, 0, 1.5, 0.5, 0.5
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
-3.392779, -3.009378, -4,
-3.392779, -3.009378, 4,
-3.392779, -3.009378, -4,
-3.547191, -3.157502, -4,
-3.392779, -3.009378, -2,
-3.547191, -3.157502, -2,
-3.392779, -3.009378, 0,
-3.547191, -3.157502, 0,
-3.392779, -3.009378, 2,
-3.547191, -3.157502, 2,
-3.392779, -3.009378, 4,
-3.547191, -3.157502, 4
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
-3.856017, -3.453748, -4, 0, -0.5, 0.5, 0.5,
-3.856017, -3.453748, -4, 1, -0.5, 0.5, 0.5,
-3.856017, -3.453748, -4, 1, 1.5, 0.5, 0.5,
-3.856017, -3.453748, -4, 0, 1.5, 0.5, 0.5,
-3.856017, -3.453748, -2, 0, -0.5, 0.5, 0.5,
-3.856017, -3.453748, -2, 1, -0.5, 0.5, 0.5,
-3.856017, -3.453748, -2, 1, 1.5, 0.5, 0.5,
-3.856017, -3.453748, -2, 0, 1.5, 0.5, 0.5,
-3.856017, -3.453748, 0, 0, -0.5, 0.5, 0.5,
-3.856017, -3.453748, 0, 1, -0.5, 0.5, 0.5,
-3.856017, -3.453748, 0, 1, 1.5, 0.5, 0.5,
-3.856017, -3.453748, 0, 0, 1.5, 0.5, 0.5,
-3.856017, -3.453748, 2, 0, -0.5, 0.5, 0.5,
-3.856017, -3.453748, 2, 1, -0.5, 0.5, 0.5,
-3.856017, -3.453748, 2, 1, 1.5, 0.5, 0.5,
-3.856017, -3.453748, 2, 0, 1.5, 0.5, 0.5,
-3.856017, -3.453748, 4, 0, -0.5, 0.5, 0.5,
-3.856017, -3.453748, 4, 1, -0.5, 0.5, 0.5,
-3.856017, -3.453748, 4, 1, 1.5, 0.5, 0.5,
-3.856017, -3.453748, 4, 0, 1.5, 0.5, 0.5
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
-3.392779, -3.009378, -5.159109,
-3.392779, 2.915551, -5.159109,
-3.392779, -3.009378, 5.744507,
-3.392779, 2.915551, 5.744507,
-3.392779, -3.009378, -5.159109,
-3.392779, -3.009378, 5.744507,
-3.392779, 2.915551, -5.159109,
-3.392779, 2.915551, 5.744507,
-3.392779, -3.009378, -5.159109,
2.783732, -3.009378, -5.159109,
-3.392779, -3.009378, 5.744507,
2.783732, -3.009378, 5.744507,
-3.392779, 2.915551, -5.159109,
2.783732, 2.915551, -5.159109,
-3.392779, 2.915551, 5.744507,
2.783732, 2.915551, 5.744507,
2.783732, -3.009378, -5.159109,
2.783732, 2.915551, -5.159109,
2.783732, -3.009378, 5.744507,
2.783732, 2.915551, 5.744507,
2.783732, -3.009378, -5.159109,
2.783732, -3.009378, 5.744507,
2.783732, 2.915551, -5.159109,
2.783732, 2.915551, 5.744507
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
var radius = 7.401805;
var distance = 32.93147;
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
mvMatrix.translate( 0.3045232, 0.04691374, -0.2926993 );
mvMatrix.scale( 1.295712, 1.350729, 0.7339746 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.93147);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
chinomethionat<-read.table("chinomethionat.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chinomethionat$V2
```

```
## Error in eval(expr, envir, enclos): object 'chinomethionat' not found
```

```r
y<-chinomethionat$V3
```

```
## Error in eval(expr, envir, enclos): object 'chinomethionat' not found
```

```r
z<-chinomethionat$V4
```

```
## Error in eval(expr, envir, enclos): object 'chinomethionat' not found
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
-3.30283, 1.395146, -1.165545, 0, 0, 1, 1, 1,
-3.239693, -1.12778, 0.02818645, 1, 0, 0, 1, 1,
-3.208797, -1.218391, -1.69708, 1, 0, 0, 1, 1,
-3.152654, 1.135002, 0.8702029, 1, 0, 0, 1, 1,
-3.042645, -1.301501, -0.2521034, 1, 0, 0, 1, 1,
-2.964998, -1.539582, -1.756973, 1, 0, 0, 1, 1,
-2.88343, -0.4400471, -2.036122, 0, 0, 0, 1, 1,
-2.719668, -0.6920265, -2.848069, 0, 0, 0, 1, 1,
-2.673795, -1.258793, -1.351005, 0, 0, 0, 1, 1,
-2.629137, 0.5405764, -1.243864, 0, 0, 0, 1, 1,
-2.572157, -0.5132068, -0.8416184, 0, 0, 0, 1, 1,
-2.496097, -0.2484958, -1.650484, 0, 0, 0, 1, 1,
-2.476192, -0.8246495, -2.304595, 0, 0, 0, 1, 1,
-2.462458, 0.61887, -0.9246218, 1, 1, 1, 1, 1,
-2.455707, -1.625612, 0.4931992, 1, 1, 1, 1, 1,
-2.443595, 1.242798, -2.1933, 1, 1, 1, 1, 1,
-2.405319, 0.03927904, -0.6869817, 1, 1, 1, 1, 1,
-2.399042, -0.3686893, -2.139271, 1, 1, 1, 1, 1,
-2.384589, -1.263712, -0.06167985, 1, 1, 1, 1, 1,
-2.349084, -1.768672, -1.567119, 1, 1, 1, 1, 1,
-2.252278, 0.4760993, -1.564422, 1, 1, 1, 1, 1,
-2.216118, 0.183588, -0.4838322, 1, 1, 1, 1, 1,
-2.097486, 1.446946, -0.2208208, 1, 1, 1, 1, 1,
-2.094904, 0.5393412, -0.9733357, 1, 1, 1, 1, 1,
-2.079564, 1.035937, -0.8527946, 1, 1, 1, 1, 1,
-2.069538, 0.2720972, -0.3585534, 1, 1, 1, 1, 1,
-2.059136, -0.4603282, -1.545926, 1, 1, 1, 1, 1,
-2.058646, -0.7073943, -0.7571565, 1, 1, 1, 1, 1,
-2.020139, -0.2621936, -0.5667207, 0, 0, 1, 1, 1,
-2.002647, 1.57115, -1.211784, 1, 0, 0, 1, 1,
-1.976003, 1.429738, 0.4485454, 1, 0, 0, 1, 1,
-1.975821, -0.04627234, -1.072999, 1, 0, 0, 1, 1,
-1.97272, -0.2970206, -0.9465746, 1, 0, 0, 1, 1,
-1.954352, 0.3389642, -2.424501, 1, 0, 0, 1, 1,
-1.919935, 2.138296, -0.1664768, 0, 0, 0, 1, 1,
-1.89833, 1.85917, -1.439111, 0, 0, 0, 1, 1,
-1.897572, 0.4831613, -1.514725, 0, 0, 0, 1, 1,
-1.894121, 1.352516, -1.496264, 0, 0, 0, 1, 1,
-1.873003, 0.5681334, -1.999987, 0, 0, 0, 1, 1,
-1.85214, 0.603608, -1.024502, 0, 0, 0, 1, 1,
-1.823987, 0.1796154, -1.076742, 0, 0, 0, 1, 1,
-1.788581, 0.1159066, -1.02698, 1, 1, 1, 1, 1,
-1.762838, 0.8797807, 0.8369784, 1, 1, 1, 1, 1,
-1.743787, -1.514022, -1.884323, 1, 1, 1, 1, 1,
-1.734259, 1.753122, 0.02519936, 1, 1, 1, 1, 1,
-1.733254, -1.147591, -3.150756, 1, 1, 1, 1, 1,
-1.722034, 0.4679416, -0.3563488, 1, 1, 1, 1, 1,
-1.7072, -1.252769, -0.8191296, 1, 1, 1, 1, 1,
-1.697972, -0.4829697, -1.791167, 1, 1, 1, 1, 1,
-1.689405, 1.653138, -1.067684, 1, 1, 1, 1, 1,
-1.681701, 1.064361, -1.74622, 1, 1, 1, 1, 1,
-1.658391, -0.5537483, -2.346381, 1, 1, 1, 1, 1,
-1.646482, 0.4061847, -1.68253, 1, 1, 1, 1, 1,
-1.635462, 1.009081, -0.3974546, 1, 1, 1, 1, 1,
-1.632628, -2.067006, -3.309749, 1, 1, 1, 1, 1,
-1.623591, 0.149929, -1.419909, 1, 1, 1, 1, 1,
-1.614854, 1.349914, -2.273442, 0, 0, 1, 1, 1,
-1.613089, 0.6918477, 0.02773743, 1, 0, 0, 1, 1,
-1.609996, 2.829266, -1.296367, 1, 0, 0, 1, 1,
-1.608412, 1.818634, -0.334059, 1, 0, 0, 1, 1,
-1.591146, -1.181069, -2.437234, 1, 0, 0, 1, 1,
-1.571011, -0.08122316, -0.6353891, 1, 0, 0, 1, 1,
-1.557517, 0.8207545, -1.316934, 0, 0, 0, 1, 1,
-1.555583, -1.467221, -1.281511, 0, 0, 0, 1, 1,
-1.551849, -0.7093322, -3.274813, 0, 0, 0, 1, 1,
-1.548578, -1.338352, -2.852203, 0, 0, 0, 1, 1,
-1.548486, 0.07969505, -0.6712922, 0, 0, 0, 1, 1,
-1.541317, 1.450181, -0.4873568, 0, 0, 0, 1, 1,
-1.518871, -1.33554, -2.654794, 0, 0, 0, 1, 1,
-1.517809, 0.4387758, -2.210458, 1, 1, 1, 1, 1,
-1.514714, 1.312885, -2.282641, 1, 1, 1, 1, 1,
-1.513073, 0.5767914, -0.6841481, 1, 1, 1, 1, 1,
-1.513062, 1.072537, 0.1653032, 1, 1, 1, 1, 1,
-1.508588, -0.829294, -2.328293, 1, 1, 1, 1, 1,
-1.505299, 1.763146, -0.05715956, 1, 1, 1, 1, 1,
-1.489009, 1.300748, -0.5162095, 1, 1, 1, 1, 1,
-1.478966, -0.7230855, -3.051313, 1, 1, 1, 1, 1,
-1.464267, 1.811376, -2.521872, 1, 1, 1, 1, 1,
-1.462821, -0.4493049, -1.743026, 1, 1, 1, 1, 1,
-1.450349, -1.401837, -1.34331, 1, 1, 1, 1, 1,
-1.432384, -0.6099742, -4.370454, 1, 1, 1, 1, 1,
-1.432141, -0.3629051, -2.013067, 1, 1, 1, 1, 1,
-1.43148, -0.8804342, -3.297509, 1, 1, 1, 1, 1,
-1.424231, 0.9893003, -1.669193, 1, 1, 1, 1, 1,
-1.42368, 0.2155017, -0.8793561, 0, 0, 1, 1, 1,
-1.423553, 2.25799, 0.2549705, 1, 0, 0, 1, 1,
-1.418186, -2.709904, -2.642335, 1, 0, 0, 1, 1,
-1.384503, 0.6110067, -1.801742, 1, 0, 0, 1, 1,
-1.383567, -1.994377, -2.052215, 1, 0, 0, 1, 1,
-1.375675, -1.223303, -1.419853, 1, 0, 0, 1, 1,
-1.375407, -2.422833, -4.426493, 0, 0, 0, 1, 1,
-1.371004, -0.8237182, -2.853481, 0, 0, 0, 1, 1,
-1.370393, 1.03283, -0.8928823, 0, 0, 0, 1, 1,
-1.348114, -0.9613429, -1.212744, 0, 0, 0, 1, 1,
-1.347451, -1.055499, -3.630937, 0, 0, 0, 1, 1,
-1.347119, -0.05356003, -0.8712277, 0, 0, 0, 1, 1,
-1.32481, -0.1252242, -1.900931, 0, 0, 0, 1, 1,
-1.321804, 0.6277781, -1.46465, 1, 1, 1, 1, 1,
-1.293594, 0.7896024, -1.007787, 1, 1, 1, 1, 1,
-1.292824, 0.6113731, -1.67659, 1, 1, 1, 1, 1,
-1.278038, 1.148733, -0.8532087, 1, 1, 1, 1, 1,
-1.253047, 0.3786961, -0.6022222, 1, 1, 1, 1, 1,
-1.238436, 0.4971806, -1.130482, 1, 1, 1, 1, 1,
-1.23574, -0.3707882, -4.207944, 1, 1, 1, 1, 1,
-1.235078, 0.6606053, -0.3228912, 1, 1, 1, 1, 1,
-1.224797, -0.6548787, -1.107074, 1, 1, 1, 1, 1,
-1.215334, -2.374901, -2.379741, 1, 1, 1, 1, 1,
-1.213687, 1.041237, -0.5499262, 1, 1, 1, 1, 1,
-1.20697, -0.167567, -0.6605456, 1, 1, 1, 1, 1,
-1.203497, 0.141, -1.395758, 1, 1, 1, 1, 1,
-1.203262, 0.4262687, -0.9533181, 1, 1, 1, 1, 1,
-1.202251, 1.04982, 0.2757108, 1, 1, 1, 1, 1,
-1.18988, 1.815806, -0.2119286, 0, 0, 1, 1, 1,
-1.188404, 1.227432, -1.005183, 1, 0, 0, 1, 1,
-1.173392, -0.7613831, -1.888463, 1, 0, 0, 1, 1,
-1.1676, -1.521938, -2.655537, 1, 0, 0, 1, 1,
-1.167016, -0.4193889, -2.583785, 1, 0, 0, 1, 1,
-1.161932, 1.869504, 0.3271151, 1, 0, 0, 1, 1,
-1.158986, 0.2267679, -3.261301, 0, 0, 0, 1, 1,
-1.151669, -1.459599, -1.960222, 0, 0, 0, 1, 1,
-1.15006, 0.4186372, -1.729238, 0, 0, 0, 1, 1,
-1.134176, 0.6313829, -1.010022, 0, 0, 0, 1, 1,
-1.129068, 0.2966867, -1.17403, 0, 0, 0, 1, 1,
-1.12106, 0.5705515, -2.66768, 0, 0, 0, 1, 1,
-1.119821, -2.106392, -4.834453, 0, 0, 0, 1, 1,
-1.118988, 0.3381445, -1.038333, 1, 1, 1, 1, 1,
-1.112539, -0.3984208, -3.036955, 1, 1, 1, 1, 1,
-1.109235, 0.4483202, -0.4094642, 1, 1, 1, 1, 1,
-1.10871, -0.5577028, -1.786057, 1, 1, 1, 1, 1,
-1.103646, 0.09731676, -1.374753, 1, 1, 1, 1, 1,
-1.103344, 0.08228055, -2.469676, 1, 1, 1, 1, 1,
-1.101377, -0.6376943, -1.529748, 1, 1, 1, 1, 1,
-1.0996, 0.2839852, -1.308925, 1, 1, 1, 1, 1,
-1.097101, 0.8103067, -0.1887404, 1, 1, 1, 1, 1,
-1.094859, 0.07247337, -2.011805, 1, 1, 1, 1, 1,
-1.091405, 0.805729, -1.03754, 1, 1, 1, 1, 1,
-1.085406, 1.122316, -1.915118, 1, 1, 1, 1, 1,
-1.082571, 1.267995, 0.8752468, 1, 1, 1, 1, 1,
-1.078503, 1.621231, 0.4084978, 1, 1, 1, 1, 1,
-1.075211, 0.1137128, -1.745749, 1, 1, 1, 1, 1,
-1.070271, 0.3871022, -0.7211523, 0, 0, 1, 1, 1,
-1.068278, 0.5307901, 0.193935, 1, 0, 0, 1, 1,
-1.067741, -0.4519235, -1.860293, 1, 0, 0, 1, 1,
-1.066715, 1.069811, -0.5105474, 1, 0, 0, 1, 1,
-1.046515, 0.7566338, -2.206033, 1, 0, 0, 1, 1,
-1.044245, 1.137454, -0.4307745, 1, 0, 0, 1, 1,
-1.03273, -1.86131, -1.742934, 0, 0, 0, 1, 1,
-1.027007, 0.05940318, -3.438634, 0, 0, 0, 1, 1,
-1.024365, -2.923093, -1.246316, 0, 0, 0, 1, 1,
-1.018965, 0.2916756, 0.3332313, 0, 0, 0, 1, 1,
-0.9966627, -0.3804372, -1.942222, 0, 0, 0, 1, 1,
-0.9931007, 2.116257, 1.052906, 0, 0, 0, 1, 1,
-0.989249, -1.379214, -3.350138, 0, 0, 0, 1, 1,
-0.9883811, 0.7064072, -1.62087, 1, 1, 1, 1, 1,
-0.9875232, 1.38112, 0.9834086, 1, 1, 1, 1, 1,
-0.9855614, 1.162576, 2.005296, 1, 1, 1, 1, 1,
-0.9755144, -2.463049, -2.520025, 1, 1, 1, 1, 1,
-0.9747196, 1.445412, -0.976191, 1, 1, 1, 1, 1,
-0.9709427, 1.302066, -1.57303, 1, 1, 1, 1, 1,
-0.9630224, 1.747633, -0.3900541, 1, 1, 1, 1, 1,
-0.9611986, -0.1346753, -1.565485, 1, 1, 1, 1, 1,
-0.9546555, 1.669949, -0.4573683, 1, 1, 1, 1, 1,
-0.9541323, -0.06210696, -0.8730976, 1, 1, 1, 1, 1,
-0.9524022, -0.6732824, -2.286769, 1, 1, 1, 1, 1,
-0.9394023, -0.820641, -2.747638, 1, 1, 1, 1, 1,
-0.9386007, -0.1862266, -2.946631, 1, 1, 1, 1, 1,
-0.9372872, 0.1730069, -0.8698719, 1, 1, 1, 1, 1,
-0.9358387, -1.992606, -4.293285, 1, 1, 1, 1, 1,
-0.9330413, 2.124254, 1.010782, 0, 0, 1, 1, 1,
-0.9306688, 0.1583539, -1.937819, 1, 0, 0, 1, 1,
-0.928075, -0.4647023, -3.077964, 1, 0, 0, 1, 1,
-0.9274206, -0.07169317, -2.363256, 1, 0, 0, 1, 1,
-0.9172666, -1.320833, -1.868515, 1, 0, 0, 1, 1,
-0.9171945, -0.4005876, -2.898205, 1, 0, 0, 1, 1,
-0.9083905, 0.05571495, -2.113585, 0, 0, 0, 1, 1,
-0.9078442, -0.3024103, -1.151677, 0, 0, 0, 1, 1,
-0.9051666, 1.753371, 0.2526986, 0, 0, 0, 1, 1,
-0.9030291, 0.4498877, -1.055364, 0, 0, 0, 1, 1,
-0.9016488, 0.8042525, -1.472434, 0, 0, 0, 1, 1,
-0.8910696, 0.05519535, -0.6359528, 0, 0, 0, 1, 1,
-0.8886909, -1.206264, -3.10586, 0, 0, 0, 1, 1,
-0.8855507, -1.608195, -3.445924, 1, 1, 1, 1, 1,
-0.878316, 1.461532, -0.3358634, 1, 1, 1, 1, 1,
-0.8781844, 0.6247819, -0.00705704, 1, 1, 1, 1, 1,
-0.8779306, 1.337895, -1.573429, 1, 1, 1, 1, 1,
-0.8628022, -0.03819894, -2.706301, 1, 1, 1, 1, 1,
-0.8619321, -1.117111, -4.213058, 1, 1, 1, 1, 1,
-0.8589969, 0.368715, -2.745852, 1, 1, 1, 1, 1,
-0.855728, -1.44933, -2.977216, 1, 1, 1, 1, 1,
-0.8507584, 0.373835, 0.4627545, 1, 1, 1, 1, 1,
-0.8488369, 0.2648258, -1.101438, 1, 1, 1, 1, 1,
-0.8458398, -0.8991398, -1.610829, 1, 1, 1, 1, 1,
-0.843619, 1.278876, -2.265916, 1, 1, 1, 1, 1,
-0.8408977, -0.8126384, -3.189195, 1, 1, 1, 1, 1,
-0.8392867, -0.3031217, -0.8891289, 1, 1, 1, 1, 1,
-0.8380293, 1.014532, -1.122973, 1, 1, 1, 1, 1,
-0.8370493, 0.2519396, 0.05401923, 0, 0, 1, 1, 1,
-0.8361835, -0.1616371, -1.223574, 1, 0, 0, 1, 1,
-0.8290794, -0.7148371, -2.974197, 1, 0, 0, 1, 1,
-0.8290522, -0.7142616, -0.8042176, 1, 0, 0, 1, 1,
-0.8268237, -0.3244233, -2.236245, 1, 0, 0, 1, 1,
-0.8182966, -1.065553, -3.41259, 1, 0, 0, 1, 1,
-0.8180555, -1.36895, -2.565906, 0, 0, 0, 1, 1,
-0.8179633, 1.010269, -1.433148, 0, 0, 0, 1, 1,
-0.811755, 1.893445, -0.9121078, 0, 0, 0, 1, 1,
-0.8081614, -1.384258, -1.997572, 0, 0, 0, 1, 1,
-0.8068876, -1.040681, -1.920281, 0, 0, 0, 1, 1,
-0.8056094, -0.6873801, -3.129034, 0, 0, 0, 1, 1,
-0.7978436, 0.4648551, -0.972176, 0, 0, 0, 1, 1,
-0.791377, 1.896608, 0.2964505, 1, 1, 1, 1, 1,
-0.7912943, 1.226917, -2.115031, 1, 1, 1, 1, 1,
-0.7882297, -1.708768, -1.970275, 1, 1, 1, 1, 1,
-0.7876526, 0.9180172, -1.120916, 1, 1, 1, 1, 1,
-0.782454, -1.483704, -3.72802, 1, 1, 1, 1, 1,
-0.776367, -1.243164, -4.331017, 1, 1, 1, 1, 1,
-0.7760164, 1.159699, -0.40222, 1, 1, 1, 1, 1,
-0.775201, 0.5427772, -0.6594349, 1, 1, 1, 1, 1,
-0.7707745, 1.243401, -0.07671039, 1, 1, 1, 1, 1,
-0.7692789, -0.8562006, -4.145495, 1, 1, 1, 1, 1,
-0.7660581, -0.1077698, -1.439888, 1, 1, 1, 1, 1,
-0.7659792, 1.112212, -0.612527, 1, 1, 1, 1, 1,
-0.7646692, -0.3025963, -3.514346, 1, 1, 1, 1, 1,
-0.7639716, 1.539694, -1.031629, 1, 1, 1, 1, 1,
-0.7616025, -0.2300899, -1.726031, 1, 1, 1, 1, 1,
-0.7583338, -0.02022613, -1.924225, 0, 0, 1, 1, 1,
-0.7569999, 0.1890191, -0.2966409, 1, 0, 0, 1, 1,
-0.7544265, -0.238404, -0.576641, 1, 0, 0, 1, 1,
-0.753328, 1.514931, 0.251564, 1, 0, 0, 1, 1,
-0.7512454, -0.8554941, -1.36062, 1, 0, 0, 1, 1,
-0.7424164, -0.5403625, -3.503408, 1, 0, 0, 1, 1,
-0.7389939, 0.3701946, -0.8216555, 0, 0, 0, 1, 1,
-0.7370698, -0.5523227, -1.222189, 0, 0, 0, 1, 1,
-0.7360603, -0.02607598, -0.275103, 0, 0, 0, 1, 1,
-0.7358678, 0.1989425, -3.4164, 0, 0, 0, 1, 1,
-0.7349443, 0.6083426, -1.259779, 0, 0, 0, 1, 1,
-0.7342685, 0.3021147, -3.174114, 0, 0, 0, 1, 1,
-0.7331902, 0.1401841, -0.01307201, 0, 0, 0, 1, 1,
-0.7310126, -0.9932771, -1.632475, 1, 1, 1, 1, 1,
-0.7261883, -0.03895168, -0.9955232, 1, 1, 1, 1, 1,
-0.7254483, -1.092847, -0.840404, 1, 1, 1, 1, 1,
-0.722716, 2.097216, -2.709802, 1, 1, 1, 1, 1,
-0.7180837, -0.4341441, -0.2869931, 1, 1, 1, 1, 1,
-0.7170123, 1.114838, -1.320948, 1, 1, 1, 1, 1,
-0.7169037, 0.4186833, -0.9781016, 1, 1, 1, 1, 1,
-0.7164635, -0.4008682, -2.80331, 1, 1, 1, 1, 1,
-0.7005267, -1.150203, -3.676698, 1, 1, 1, 1, 1,
-0.6940129, -0.1167863, -1.574184, 1, 1, 1, 1, 1,
-0.6903821, -0.4954813, -1.307208, 1, 1, 1, 1, 1,
-0.6897821, 0.6096849, -1.443143, 1, 1, 1, 1, 1,
-0.6894002, -2.679616, -1.579762, 1, 1, 1, 1, 1,
-0.6870181, 1.190353, -1.79633, 1, 1, 1, 1, 1,
-0.681579, 0.05441321, -1.975228, 1, 1, 1, 1, 1,
-0.6809018, -0.7225759, -0.64333, 0, 0, 1, 1, 1,
-0.6721793, -0.06352872, -1.531057, 1, 0, 0, 1, 1,
-0.6665558, -0.4455734, -1.135686, 1, 0, 0, 1, 1,
-0.6641383, 1.493434, -0.8607618, 1, 0, 0, 1, 1,
-0.6572189, -0.448155, -1.598512, 1, 0, 0, 1, 1,
-0.655312, -0.3173467, -2.449359, 1, 0, 0, 1, 1,
-0.6473935, -1.035121, -1.816353, 0, 0, 0, 1, 1,
-0.6456882, -2.15578, -1.562052, 0, 0, 0, 1, 1,
-0.6424918, -0.2473725, -1.131386, 0, 0, 0, 1, 1,
-0.638381, -0.3116466, -1.973504, 0, 0, 0, 1, 1,
-0.6348301, -0.3443042, -2.726974, 0, 0, 0, 1, 1,
-0.6289632, -0.7999229, -4.291259, 0, 0, 0, 1, 1,
-0.6234348, -0.3774298, -1.631306, 0, 0, 0, 1, 1,
-0.614343, 1.001119, 1.284121, 1, 1, 1, 1, 1,
-0.6110538, -0.6247317, -3.243237, 1, 1, 1, 1, 1,
-0.610026, -1.663486, -1.515264, 1, 1, 1, 1, 1,
-0.5999343, -0.1796106, 0.5180718, 1, 1, 1, 1, 1,
-0.5956199, -2.160512, -3.880769, 1, 1, 1, 1, 1,
-0.5922223, 0.9059595, -0.5154002, 1, 1, 1, 1, 1,
-0.5901715, -0.5629411, -2.045836, 1, 1, 1, 1, 1,
-0.5895976, 1.385267, 0.3411175, 1, 1, 1, 1, 1,
-0.5862086, 0.8861047, -1.208313, 1, 1, 1, 1, 1,
-0.5723811, -1.555083, -1.810271, 1, 1, 1, 1, 1,
-0.5699728, -0.7406778, -3.067907, 1, 1, 1, 1, 1,
-0.5698015, -1.098577, -1.198606, 1, 1, 1, 1, 1,
-0.5693706, -0.1757958, -1.892535, 1, 1, 1, 1, 1,
-0.5675631, 0.9237356, 0.7685422, 1, 1, 1, 1, 1,
-0.5646774, 0.613593, -1.521033, 1, 1, 1, 1, 1,
-0.5618864, 0.04102344, -0.9181188, 0, 0, 1, 1, 1,
-0.5568435, 1.096033, -0.837849, 1, 0, 0, 1, 1,
-0.5543253, 1.311394, 0.2413191, 1, 0, 0, 1, 1,
-0.5528026, -0.3745576, -0.4911832, 1, 0, 0, 1, 1,
-0.5461944, -0.9454772, -1.676537, 1, 0, 0, 1, 1,
-0.543092, 0.6657172, -1.50059, 1, 0, 0, 1, 1,
-0.5416282, -0.5605669, -1.545649, 0, 0, 0, 1, 1,
-0.5403466, -1.197625, -3.58054, 0, 0, 0, 1, 1,
-0.5399262, 0.8304853, -1.910138, 0, 0, 0, 1, 1,
-0.5384325, 0.8980693, -0.7283453, 0, 0, 0, 1, 1,
-0.5326064, -0.6132135, -3.625304, 0, 0, 0, 1, 1,
-0.5311944, -0.001541987, -1.533906, 0, 0, 0, 1, 1,
-0.5295908, 0.9358523, -0.2128484, 0, 0, 0, 1, 1,
-0.5295712, 1.106576, 0.1677542, 1, 1, 1, 1, 1,
-0.5288504, -0.1624296, -1.807515, 1, 1, 1, 1, 1,
-0.5271803, 1.592931, -1.723594, 1, 1, 1, 1, 1,
-0.5267838, 2.171675, -1.246747, 1, 1, 1, 1, 1,
-0.5258434, -1.711205, -1.067209, 1, 1, 1, 1, 1,
-0.5254968, 0.2659112, -0.4491206, 1, 1, 1, 1, 1,
-0.5160903, 0.4706445, -0.6187129, 1, 1, 1, 1, 1,
-0.5148695, 1.643452, -0.1225084, 1, 1, 1, 1, 1,
-0.5145863, -0.8497599, -1.641597, 1, 1, 1, 1, 1,
-0.5122388, 0.4250281, 0.06997262, 1, 1, 1, 1, 1,
-0.5106303, 0.7063055, 0.8939213, 1, 1, 1, 1, 1,
-0.4988066, -0.9531705, -3.644606, 1, 1, 1, 1, 1,
-0.4969825, -1.253005, -2.134405, 1, 1, 1, 1, 1,
-0.4944638, 0.5210754, -0.4378586, 1, 1, 1, 1, 1,
-0.4891447, -0.5196592, -2.234849, 1, 1, 1, 1, 1,
-0.4843599, -0.2966915, -3.495308, 0, 0, 1, 1, 1,
-0.481704, 0.06987145, -1.648867, 1, 0, 0, 1, 1,
-0.4763654, 1.358329, 0.8861662, 1, 0, 0, 1, 1,
-0.4760554, 0.4435725, -0.6318772, 1, 0, 0, 1, 1,
-0.4757594, 0.4434138, 0.1384972, 1, 0, 0, 1, 1,
-0.4749903, 0.2662939, -1.863127, 1, 0, 0, 1, 1,
-0.4747875, 1.088524, -0.3275377, 0, 0, 0, 1, 1,
-0.4741577, 1.493324, -0.2074321, 0, 0, 0, 1, 1,
-0.4704574, 1.355452, -0.4439327, 0, 0, 0, 1, 1,
-0.4670668, 0.06907077, -0.4054538, 0, 0, 0, 1, 1,
-0.466583, 0.5998025, -0.9238064, 0, 0, 0, 1, 1,
-0.463159, -1.045501, -4.956896, 0, 0, 0, 1, 1,
-0.4598881, -0.1605856, -0.9916538, 0, 0, 0, 1, 1,
-0.4596764, -1.663079, -3.803708, 1, 1, 1, 1, 1,
-0.4596756, -0.4558023, -2.03207, 1, 1, 1, 1, 1,
-0.4587506, -1.151362, -3.54624, 1, 1, 1, 1, 1,
-0.4551229, 0.1211313, -2.357113, 1, 1, 1, 1, 1,
-0.4512127, 1.195194, -1.740592, 1, 1, 1, 1, 1,
-0.4499652, -0.7987398, -2.909921, 1, 1, 1, 1, 1,
-0.442293, 0.8877103, -0.4511315, 1, 1, 1, 1, 1,
-0.4401103, -0.3314827, -2.735033, 1, 1, 1, 1, 1,
-0.44004, 0.507499, 0.09086782, 1, 1, 1, 1, 1,
-0.4400016, 0.1052244, -1.498076, 1, 1, 1, 1, 1,
-0.4373536, 0.01546547, -0.1522903, 1, 1, 1, 1, 1,
-0.4363142, -0.1595261, -0.4350901, 1, 1, 1, 1, 1,
-0.4354185, -0.07926644, -0.5219012, 1, 1, 1, 1, 1,
-0.4351178, 1.234227, -0.5044054, 1, 1, 1, 1, 1,
-0.4344654, 0.2610981, 0.6911987, 1, 1, 1, 1, 1,
-0.4344366, 2.017088, 0.4940647, 0, 0, 1, 1, 1,
-0.4343736, 0.3431963, -1.757501, 1, 0, 0, 1, 1,
-0.4326132, 0.8032334, -0.4878929, 1, 0, 0, 1, 1,
-0.4322082, -1.403382, -2.614735, 1, 0, 0, 1, 1,
-0.4281419, -0.1390443, -1.622918, 1, 0, 0, 1, 1,
-0.428032, -1.521109, -2.289549, 1, 0, 0, 1, 1,
-0.4276681, -0.1752697, -2.654323, 0, 0, 0, 1, 1,
-0.4267532, 0.1614257, -1.888388, 0, 0, 0, 1, 1,
-0.4265815, -1.580051, -3.308537, 0, 0, 0, 1, 1,
-0.4200112, -0.4194724, -2.779643, 0, 0, 0, 1, 1,
-0.4198351, -1.776117, -2.333215, 0, 0, 0, 1, 1,
-0.4124958, -0.3760854, -2.821314, 0, 0, 0, 1, 1,
-0.4121542, -0.9357236, -2.193667, 0, 0, 0, 1, 1,
-0.4117421, 0.7142784, -2.277499, 1, 1, 1, 1, 1,
-0.4106027, 1.29919, 0.002754353, 1, 1, 1, 1, 1,
-0.4101909, -1.710407, -3.792233, 1, 1, 1, 1, 1,
-0.408318, 0.7007688, -1.02451, 1, 1, 1, 1, 1,
-0.407059, 0.8265153, -0.1243238, 1, 1, 1, 1, 1,
-0.4047299, -0.6503261, -2.872286, 1, 1, 1, 1, 1,
-0.4039027, 1.729471, -1.154628, 1, 1, 1, 1, 1,
-0.4005919, 0.2935326, -1.140534, 1, 1, 1, 1, 1,
-0.3988413, -1.629627, -3.38536, 1, 1, 1, 1, 1,
-0.3979113, -1.338313, -2.027211, 1, 1, 1, 1, 1,
-0.3962304, -0.1072213, -3.10235, 1, 1, 1, 1, 1,
-0.3950794, 0.2755731, -1.276051, 1, 1, 1, 1, 1,
-0.3931866, -0.7924702, -1.872676, 1, 1, 1, 1, 1,
-0.3863306, -1.306332, -3.950367, 1, 1, 1, 1, 1,
-0.3827785, 0.4299782, -0.2307162, 1, 1, 1, 1, 1,
-0.3809153, -0.3572865, -3.615464, 0, 0, 1, 1, 1,
-0.3788491, 0.6280291, -2.45673, 1, 0, 0, 1, 1,
-0.3759458, 0.3442929, -0.5944903, 1, 0, 0, 1, 1,
-0.3752281, -0.6217075, -4.679105, 1, 0, 0, 1, 1,
-0.3704225, 0.3265377, 2.569557, 1, 0, 0, 1, 1,
-0.3684212, -0.413775, -1.305366, 1, 0, 0, 1, 1,
-0.3667771, -1.208106, -2.593543, 0, 0, 0, 1, 1,
-0.3654319, 0.08386464, -0.6186877, 0, 0, 0, 1, 1,
-0.3645103, 0.09021906, -2.078983, 0, 0, 0, 1, 1,
-0.364353, -0.7163143, -4.877287, 0, 0, 0, 1, 1,
-0.3534373, 0.09191228, -0.8593784, 0, 0, 0, 1, 1,
-0.3507509, -0.3748489, -5.000318, 0, 0, 0, 1, 1,
-0.3486657, 0.3865673, -1.439841, 0, 0, 0, 1, 1,
-0.3481879, -1.439016, -2.378568, 1, 1, 1, 1, 1,
-0.3449607, -1.428469, -4.392515, 1, 1, 1, 1, 1,
-0.3416763, 0.8243695, 0.891677, 1, 1, 1, 1, 1,
-0.3393517, -0.3802631, -2.600075, 1, 1, 1, 1, 1,
-0.338752, -0.3171836, -3.06686, 1, 1, 1, 1, 1,
-0.3382474, 0.7878662, -1.81428, 1, 1, 1, 1, 1,
-0.3291461, 0.6423811, -0.5794827, 1, 1, 1, 1, 1,
-0.3280908, 0.223154, -0.931558, 1, 1, 1, 1, 1,
-0.3251194, -0.8029144, -1.683751, 1, 1, 1, 1, 1,
-0.3250767, 1.471447, -1.666469, 1, 1, 1, 1, 1,
-0.3216035, -0.1025554, -2.067873, 1, 1, 1, 1, 1,
-0.32134, 0.9262056, -0.648175, 1, 1, 1, 1, 1,
-0.3204619, -0.6840679, -1.765251, 1, 1, 1, 1, 1,
-0.3189706, -0.4286052, -0.9050797, 1, 1, 1, 1, 1,
-0.3162645, -0.8142238, -3.749343, 1, 1, 1, 1, 1,
-0.311781, -0.6453182, -1.048903, 0, 0, 1, 1, 1,
-0.3035134, 0.1080396, 0.8186766, 1, 0, 0, 1, 1,
-0.303311, -1.649181, -2.493481, 1, 0, 0, 1, 1,
-0.3026958, 0.4819348, -0.7412691, 1, 0, 0, 1, 1,
-0.2966577, 1.451807, 0.5172886, 1, 0, 0, 1, 1,
-0.2936135, -2.002521, -2.580002, 1, 0, 0, 1, 1,
-0.2911376, 0.7115895, -0.4257447, 0, 0, 0, 1, 1,
-0.2889177, 0.1048255, -1.653989, 0, 0, 0, 1, 1,
-0.2877109, 0.09884541, -1.60595, 0, 0, 0, 1, 1,
-0.2860023, 0.415408, -0.9848251, 0, 0, 0, 1, 1,
-0.2821291, 1.054772, 0.3959047, 0, 0, 0, 1, 1,
-0.2744581, -1.324443, -4.648938, 0, 0, 0, 1, 1,
-0.2738493, -0.2140107, -3.136989, 0, 0, 0, 1, 1,
-0.269958, 0.5791864, -3.132777, 1, 1, 1, 1, 1,
-0.2653676, -1.032985, -3.124341, 1, 1, 1, 1, 1,
-0.265048, -1.203108, -4.585338, 1, 1, 1, 1, 1,
-0.2647846, 0.4108209, 0.6478992, 1, 1, 1, 1, 1,
-0.262672, -0.03364878, -0.9211212, 1, 1, 1, 1, 1,
-0.2561887, 0.5422292, -0.1059224, 1, 1, 1, 1, 1,
-0.2558093, -1.597625, -4.513151, 1, 1, 1, 1, 1,
-0.2557489, -1.817207, -3.091233, 1, 1, 1, 1, 1,
-0.2551282, 0.01352182, -2.49082, 1, 1, 1, 1, 1,
-0.2449853, 1.536923, -0.646606, 1, 1, 1, 1, 1,
-0.2415109, -1.377071, -3.710258, 1, 1, 1, 1, 1,
-0.2379476, -0.1146264, -0.6805246, 1, 1, 1, 1, 1,
-0.2377653, -0.2004953, -2.925056, 1, 1, 1, 1, 1,
-0.2359825, 0.1312366, -2.200782, 1, 1, 1, 1, 1,
-0.2359069, 0.02658573, 1.026303, 1, 1, 1, 1, 1,
-0.2354506, -0.9839219, -3.37089, 0, 0, 1, 1, 1,
-0.2352393, -0.377298, -3.068968, 1, 0, 0, 1, 1,
-0.2292204, 0.6032252, 0.3047602, 1, 0, 0, 1, 1,
-0.224656, -0.6582127, -2.056073, 1, 0, 0, 1, 1,
-0.2242261, 1.03678, 0.4621199, 1, 0, 0, 1, 1,
-0.2235463, 1.416147, -0.6705372, 1, 0, 0, 1, 1,
-0.2193042, -2.3407, -0.904606, 0, 0, 0, 1, 1,
-0.2111492, 0.07267247, -1.644666, 0, 0, 0, 1, 1,
-0.1995812, -0.2639658, -1.495596, 0, 0, 0, 1, 1,
-0.1995612, 1.459966, -2.633119, 0, 0, 0, 1, 1,
-0.1993019, -0.5294344, -2.515503, 0, 0, 0, 1, 1,
-0.192695, -0.08204897, -3.472994, 0, 0, 0, 1, 1,
-0.1907527, 0.3334935, -0.6387048, 0, 0, 0, 1, 1,
-0.1841604, 0.09221306, -1.472421, 1, 1, 1, 1, 1,
-0.1825865, 0.1963506, -0.3443175, 1, 1, 1, 1, 1,
-0.181637, -0.807543, -1.850331, 1, 1, 1, 1, 1,
-0.1747959, 0.4284923, -1.773322, 1, 1, 1, 1, 1,
-0.168004, -0.4888378, -1.706643, 1, 1, 1, 1, 1,
-0.1678007, 2.448503, 1.301785, 1, 1, 1, 1, 1,
-0.1667724, -0.2827139, -1.577974, 1, 1, 1, 1, 1,
-0.163154, -0.6396479, -3.062987, 1, 1, 1, 1, 1,
-0.1572295, -0.8930987, -2.420439, 1, 1, 1, 1, 1,
-0.1491412, 0.7292734, 0.3010244, 1, 1, 1, 1, 1,
-0.1477299, -0.5950482, -4.970118, 1, 1, 1, 1, 1,
-0.1476123, -1.898078, -2.475402, 1, 1, 1, 1, 1,
-0.1447866, 0.7788326, -2.173245, 1, 1, 1, 1, 1,
-0.1428958, -1.441602, -3.17994, 1, 1, 1, 1, 1,
-0.1376141, -0.1084327, -3.241979, 1, 1, 1, 1, 1,
-0.1369562, 0.9421832, 0.2970615, 0, 0, 1, 1, 1,
-0.1281594, 1.15767, -0.1868285, 1, 0, 0, 1, 1,
-0.1275246, 0.9277106, -1.011969, 1, 0, 0, 1, 1,
-0.1253219, -1.575827, -1.632085, 1, 0, 0, 1, 1,
-0.1240709, -0.1958698, -3.791323, 1, 0, 0, 1, 1,
-0.119616, -2.547093, -2.55064, 1, 0, 0, 1, 1,
-0.1196027, -0.06223847, -1.134765, 0, 0, 0, 1, 1,
-0.1163375, 2.323228, 0.519568, 0, 0, 0, 1, 1,
-0.1102575, -0.3073108, -3.135752, 0, 0, 0, 1, 1,
-0.1050951, -0.1745506, -3.020781, 0, 0, 0, 1, 1,
-0.1031523, 2.234286, 0.9828092, 0, 0, 0, 1, 1,
-0.1003243, 0.3386209, 1.963918, 0, 0, 0, 1, 1,
-0.09936808, 1.038848, -0.2387469, 0, 0, 0, 1, 1,
-0.0990849, -0.5600268, -3.876645, 1, 1, 1, 1, 1,
-0.09793178, -1.606232, -1.896464, 1, 1, 1, 1, 1,
-0.09704389, 1.414535, 0.09408537, 1, 1, 1, 1, 1,
-0.09574275, -0.6718443, -2.639071, 1, 1, 1, 1, 1,
-0.09313367, -1.149666, -3.50444, 1, 1, 1, 1, 1,
-0.09262224, -0.03442386, -3.155396, 1, 1, 1, 1, 1,
-0.09042729, 1.215834, -0.9179847, 1, 1, 1, 1, 1,
-0.08812711, -0.9046197, -0.4753445, 1, 1, 1, 1, 1,
-0.08785201, -0.8934842, -3.552249, 1, 1, 1, 1, 1,
-0.08669737, -0.6560441, -2.481476, 1, 1, 1, 1, 1,
-0.07658422, -0.9056052, -2.882375, 1, 1, 1, 1, 1,
-0.07444897, -1.211593, -3.181776, 1, 1, 1, 1, 1,
-0.07335296, -1.110733, -3.110679, 1, 1, 1, 1, 1,
-0.07185514, 1.122242, 1.039291, 1, 1, 1, 1, 1,
-0.06496238, -0.5650882, -4.092013, 1, 1, 1, 1, 1,
-0.06290498, 0.0139373, -2.883743, 0, 0, 1, 1, 1,
-0.06143077, 0.298139, -0.11671, 1, 0, 0, 1, 1,
-0.05678442, -1.191835, -0.9430599, 1, 0, 0, 1, 1,
-0.05509967, -1.921904, -3.916929, 1, 0, 0, 1, 1,
-0.0548029, -0.2319256, -2.537888, 1, 0, 0, 1, 1,
-0.05439411, -2.266438, -3.804405, 1, 0, 0, 1, 1,
-0.05322942, 0.972503, 0.9704754, 0, 0, 0, 1, 1,
-0.05068852, 1.52069, -1.112271, 0, 0, 0, 1, 1,
-0.04506712, 1.34781, -1.053171, 0, 0, 0, 1, 1,
-0.04302273, -0.08325621, -2.819994, 0, 0, 0, 1, 1,
-0.04171398, 0.6685655, 0.1622693, 0, 0, 0, 1, 1,
-0.04171088, 0.1112373, 0.6384254, 0, 0, 0, 1, 1,
-0.03409684, -1.689104, -2.713379, 0, 0, 0, 1, 1,
-0.02784923, -0.3098001, -1.771457, 1, 1, 1, 1, 1,
-0.02494035, 0.2360859, 0.713983, 1, 1, 1, 1, 1,
-0.02428203, -0.2482981, -3.985368, 1, 1, 1, 1, 1,
-0.01895425, -1.422722, -4.534684, 1, 1, 1, 1, 1,
-0.01735115, 1.463979, -0.9602178, 1, 1, 1, 1, 1,
-0.01651228, -1.584918, -3.748866, 1, 1, 1, 1, 1,
-0.01559058, 1.41506, -1.039266, 1, 1, 1, 1, 1,
-0.01154527, -2.03842, -3.406909, 1, 1, 1, 1, 1,
-0.01012508, -0.8235438, -3.62706, 1, 1, 1, 1, 1,
-0.008510685, -0.4539339, -3.440576, 1, 1, 1, 1, 1,
-0.005238732, 0.2600672, -0.4433181, 1, 1, 1, 1, 1,
-0.004044515, -0.4874687, -2.262603, 1, 1, 1, 1, 1,
-0.0007501758, 0.5223244, 2.002316, 1, 1, 1, 1, 1,
-0.0003703583, 0.2312888, 0.2405838, 1, 1, 1, 1, 1,
0.00329367, -0.7931823, 2.880418, 1, 1, 1, 1, 1,
0.01102039, -0.3197979, 4.857456, 0, 0, 1, 1, 1,
0.01158015, -0.257827, 2.591499, 1, 0, 0, 1, 1,
0.01221739, -1.897323, 2.830718, 1, 0, 0, 1, 1,
0.01287371, -0.3128686, 4.709455, 1, 0, 0, 1, 1,
0.01522602, 0.2434153, -1.450254, 1, 0, 0, 1, 1,
0.02299801, -0.3175404, 3.492628, 1, 0, 0, 1, 1,
0.02523983, 1.741069, -0.1383263, 0, 0, 0, 1, 1,
0.02602583, -0.1924376, 3.429022, 0, 0, 0, 1, 1,
0.02677555, 1.609559, 0.2630275, 0, 0, 0, 1, 1,
0.02882069, 0.6362902, -0.4544672, 0, 0, 0, 1, 1,
0.03048511, 0.7070245, 0.9557611, 0, 0, 0, 1, 1,
0.03048834, 1.157829, 1.24749, 0, 0, 0, 1, 1,
0.03092714, 0.6555732, -0.3004436, 0, 0, 0, 1, 1,
0.03317336, 0.4847508, -0.3054916, 1, 1, 1, 1, 1,
0.03496021, -0.444763, 2.102982, 1, 1, 1, 1, 1,
0.039594, 1.14503, -0.1859635, 1, 1, 1, 1, 1,
0.04272125, 0.8026571, 0.5024911, 1, 1, 1, 1, 1,
0.04294452, 0.1359771, -0.8446663, 1, 1, 1, 1, 1,
0.05128308, -0.4859263, 5.302521, 1, 1, 1, 1, 1,
0.05205163, -0.1819174, 3.391881, 1, 1, 1, 1, 1,
0.05252919, -0.1735687, 3.559292, 1, 1, 1, 1, 1,
0.0532714, 0.5970314, 0.6296436, 1, 1, 1, 1, 1,
0.05591385, 0.1064961, 0.4085442, 1, 1, 1, 1, 1,
0.05605611, 0.6336781, -1.084824, 1, 1, 1, 1, 1,
0.05837848, -0.3370063, 1.885096, 1, 1, 1, 1, 1,
0.0612648, -0.9952932, 4.466927, 1, 1, 1, 1, 1,
0.06149174, 1.237264, 1.012424, 1, 1, 1, 1, 1,
0.06316764, 1.409275, 0.02097692, 1, 1, 1, 1, 1,
0.06502088, -0.2498091, 1.65408, 0, 0, 1, 1, 1,
0.07014013, 1.150781, -0.3917334, 1, 0, 0, 1, 1,
0.07052573, 0.8047296, 0.3554588, 1, 0, 0, 1, 1,
0.07298819, 0.06456249, 1.194077, 1, 0, 0, 1, 1,
0.0739639, 2.140191, 0.8295593, 1, 0, 0, 1, 1,
0.07397287, 1.002757, -0.2473266, 1, 0, 0, 1, 1,
0.07608741, 0.4778023, 1.928409, 0, 0, 0, 1, 1,
0.07716367, -0.364235, 1.116815, 0, 0, 0, 1, 1,
0.07778502, -1.11104, 2.771655, 0, 0, 0, 1, 1,
0.08080865, -1.936223, 1.625613, 0, 0, 0, 1, 1,
0.08260024, 0.1840785, 1.586212, 0, 0, 0, 1, 1,
0.08358364, -0.1159527, 2.142526, 0, 0, 0, 1, 1,
0.08810864, -0.3374726, 1.382187, 0, 0, 0, 1, 1,
0.09077819, -0.8682228, 4.47917, 1, 1, 1, 1, 1,
0.09110858, -0.1537473, 2.931615, 1, 1, 1, 1, 1,
0.09207024, 0.387623, 0.7918646, 1, 1, 1, 1, 1,
0.0930783, -1.007328, 2.447627, 1, 1, 1, 1, 1,
0.09572411, -0.8886956, 2.061947, 1, 1, 1, 1, 1,
0.09572938, -0.9185095, 1.658172, 1, 1, 1, 1, 1,
0.09751199, -0.7692182, 2.657684, 1, 1, 1, 1, 1,
0.09779882, -1.006842, 1.635111, 1, 1, 1, 1, 1,
0.1022362, 0.01573996, 1.107469, 1, 1, 1, 1, 1,
0.106089, -0.7972189, 3.790859, 1, 1, 1, 1, 1,
0.1080492, 0.4728085, -1.019156, 1, 1, 1, 1, 1,
0.1106726, -0.8425087, 3.179831, 1, 1, 1, 1, 1,
0.112655, -0.8892337, 2.317141, 1, 1, 1, 1, 1,
0.1129094, -1.423809, 2.670022, 1, 1, 1, 1, 1,
0.1149802, -1.160075, 2.734868, 1, 1, 1, 1, 1,
0.1272591, -0.9298825, 4.440301, 0, 0, 1, 1, 1,
0.1301406, -1.728573, 2.785004, 1, 0, 0, 1, 1,
0.1334426, -0.7970777, 3.275465, 1, 0, 0, 1, 1,
0.1373235, -1.268792, 2.484248, 1, 0, 0, 1, 1,
0.1375794, -1.330194, 2.481761, 1, 0, 0, 1, 1,
0.1406111, -0.08282675, 1.948575, 1, 0, 0, 1, 1,
0.1410101, 0.3598179, -0.358955, 0, 0, 0, 1, 1,
0.1438175, 0.6942695, 0.01342825, 0, 0, 0, 1, 1,
0.1447882, -1.313576, 3.730964, 0, 0, 0, 1, 1,
0.1478819, -0.1670003, 2.042976, 0, 0, 0, 1, 1,
0.1483435, 0.8033269, 2.648715, 0, 0, 0, 1, 1,
0.1506044, 0.3206393, -0.6625761, 0, 0, 0, 1, 1,
0.1559645, 0.6676344, -0.3113351, 0, 0, 0, 1, 1,
0.1567882, -1.25501, 3.144132, 1, 1, 1, 1, 1,
0.1571956, -0.09473282, 0.9890953, 1, 1, 1, 1, 1,
0.16102, -1.13121, 3.45769, 1, 1, 1, 1, 1,
0.1625452, -0.2650436, 1.672356, 1, 1, 1, 1, 1,
0.1644367, 0.8730735, -0.7266914, 1, 1, 1, 1, 1,
0.1673664, -1.008185, 2.941112, 1, 1, 1, 1, 1,
0.1711685, -0.9866219, 4.283497, 1, 1, 1, 1, 1,
0.1712359, -0.5600617, 3.504722, 1, 1, 1, 1, 1,
0.176064, -0.4126925, 3.713775, 1, 1, 1, 1, 1,
0.1779896, -0.233433, 2.057218, 1, 1, 1, 1, 1,
0.1785158, 0.2713812, 1.392091, 1, 1, 1, 1, 1,
0.1815569, 0.3865565, 1.121862, 1, 1, 1, 1, 1,
0.1820199, 0.3617859, 1.668954, 1, 1, 1, 1, 1,
0.1871055, 1.47419, -1.757592, 1, 1, 1, 1, 1,
0.187188, -0.1915216, 2.053764, 1, 1, 1, 1, 1,
0.1885523, 0.9441968, 0.4150704, 0, 0, 1, 1, 1,
0.1926571, 0.02237092, 3.160784, 1, 0, 0, 1, 1,
0.195046, 1.126437, -1.18648, 1, 0, 0, 1, 1,
0.1963906, 0.1015497, -0.02861315, 1, 0, 0, 1, 1,
0.2014743, 0.1127059, 1.000747, 1, 0, 0, 1, 1,
0.2026581, -1.660203, 2.357268, 1, 0, 0, 1, 1,
0.2037909, 0.110057, 2.031509, 0, 0, 0, 1, 1,
0.2045773, 0.148123, 0.9977164, 0, 0, 0, 1, 1,
0.2095092, 0.0675092, 1.549827, 0, 0, 0, 1, 1,
0.2130027, 0.4040301, 0.353361, 0, 0, 0, 1, 1,
0.2139463, 2.011878, 0.7400761, 0, 0, 0, 1, 1,
0.2150777, -0.3258938, 2.578203, 0, 0, 0, 1, 1,
0.2156905, -1.958855, 2.913178, 0, 0, 0, 1, 1,
0.215792, -0.4376413, 3.799579, 1, 1, 1, 1, 1,
0.2250821, 1.096871, 0.002097569, 1, 1, 1, 1, 1,
0.2290015, 1.362401, 0.05517476, 1, 1, 1, 1, 1,
0.2344219, -1.61187, 3.272964, 1, 1, 1, 1, 1,
0.2359266, 0.6248411, -0.06929373, 1, 1, 1, 1, 1,
0.2392438, 0.2723633, -1.800717, 1, 1, 1, 1, 1,
0.2428358, -1.02837, 3.724793, 1, 1, 1, 1, 1,
0.247975, 0.5145732, 1.563692, 1, 1, 1, 1, 1,
0.2485346, -0.8447234, 2.612933, 1, 1, 1, 1, 1,
0.2488372, 0.2646202, -0.1350182, 1, 1, 1, 1, 1,
0.2492294, -0.5295255, 4.440935, 1, 1, 1, 1, 1,
0.2509347, -0.2648064, 3.483984, 1, 1, 1, 1, 1,
0.2514352, 2.353723, 0.1495161, 1, 1, 1, 1, 1,
0.2570934, 0.5069005, 0.3133655, 1, 1, 1, 1, 1,
0.261593, 0.4225414, 1.544043, 1, 1, 1, 1, 1,
0.2617038, -0.2732736, 1.231317, 0, 0, 1, 1, 1,
0.2629835, -0.2574243, 3.016167, 1, 0, 0, 1, 1,
0.2640665, 1.752754, 0.3706376, 1, 0, 0, 1, 1,
0.2657518, -1.040131, 1.998008, 1, 0, 0, 1, 1,
0.2670483, -1.129436, 3.968126, 1, 0, 0, 1, 1,
0.2776709, 0.2915735, 0.5693154, 1, 0, 0, 1, 1,
0.2817229, -1.339048, 1.39644, 0, 0, 0, 1, 1,
0.2819644, -0.5371395, 2.478531, 0, 0, 0, 1, 1,
0.290321, -0.3678284, 1.956178, 0, 0, 0, 1, 1,
0.2950146, -1.161309, 3.826054, 0, 0, 0, 1, 1,
0.2957841, -1.742274, 1.762263, 0, 0, 0, 1, 1,
0.2962529, -0.7809573, 3.30746, 0, 0, 0, 1, 1,
0.3034403, 0.2063286, 1.227679, 0, 0, 0, 1, 1,
0.3121391, 1.409152, -0.711092, 1, 1, 1, 1, 1,
0.3122908, -1.233758, 4.0667, 1, 1, 1, 1, 1,
0.3130846, 0.8657727, 0.02513826, 1, 1, 1, 1, 1,
0.3149504, 1.083889, -1.111455, 1, 1, 1, 1, 1,
0.3201709, -0.180443, 2.11648, 1, 1, 1, 1, 1,
0.3263952, 1.671787, -1.245914, 1, 1, 1, 1, 1,
0.3268756, 0.4013247, 0.1682905, 1, 1, 1, 1, 1,
0.3288417, -0.7116735, 5.356499, 1, 1, 1, 1, 1,
0.3290127, -1.02179, 2.28989, 1, 1, 1, 1, 1,
0.3290837, 0.155395, 2.292063, 1, 1, 1, 1, 1,
0.3295463, -2.433905, 4.243359, 1, 1, 1, 1, 1,
0.3302712, -0.3200853, 2.114686, 1, 1, 1, 1, 1,
0.3315554, 0.08703953, 0.5849041, 1, 1, 1, 1, 1,
0.3320175, 0.5261465, -1.776475, 1, 1, 1, 1, 1,
0.3369618, -0.4420678, 1.765386, 1, 1, 1, 1, 1,
0.3411693, -0.05874917, 2.543559, 0, 0, 1, 1, 1,
0.344791, 0.3729355, -0.1649559, 1, 0, 0, 1, 1,
0.3451185, 0.3067751, 1.070844, 1, 0, 0, 1, 1,
0.3458228, 2.491627, -0.1620735, 1, 0, 0, 1, 1,
0.3463455, -0.3882424, 3.036645, 1, 0, 0, 1, 1,
0.3470141, 0.9925321, 0.3500817, 1, 0, 0, 1, 1,
0.3474836, 0.5269822, 1.210546, 0, 0, 0, 1, 1,
0.3577788, -1.198271, 4.092068, 0, 0, 0, 1, 1,
0.3643316, 1.367418, 0.745202, 0, 0, 0, 1, 1,
0.3658708, 0.5817946, -0.303368, 0, 0, 0, 1, 1,
0.3678983, -2.169702, 3.748631, 0, 0, 0, 1, 1,
0.3715688, -0.03586583, 0.6183672, 0, 0, 0, 1, 1,
0.3740417, 0.2187147, 0.5386761, 0, 0, 0, 1, 1,
0.3804221, 0.2068912, 0.3240995, 1, 1, 1, 1, 1,
0.38257, -0.005687349, 1.117098, 1, 1, 1, 1, 1,
0.3839105, 1.896111, -0.3782371, 1, 1, 1, 1, 1,
0.3841435, 0.03061841, 0.8553062, 1, 1, 1, 1, 1,
0.385114, -0.6883636, 3.506711, 1, 1, 1, 1, 1,
0.3932907, -1.244806, 3.190938, 1, 1, 1, 1, 1,
0.3979559, -1.692172, 2.815445, 1, 1, 1, 1, 1,
0.3996465, 0.2034819, 0.773986, 1, 1, 1, 1, 1,
0.4014717, 0.7133833, 1.980869, 1, 1, 1, 1, 1,
0.4022936, 1.819402, -0.2837244, 1, 1, 1, 1, 1,
0.4040317, -1.230668, 2.578693, 1, 1, 1, 1, 1,
0.4122018, 0.2140487, 1.431783, 1, 1, 1, 1, 1,
0.4133972, 0.8581291, -1.512046, 1, 1, 1, 1, 1,
0.4180042, 0.669703, 1.073891, 1, 1, 1, 1, 1,
0.4299447, 0.4409597, -0.09782571, 1, 1, 1, 1, 1,
0.4327499, 2.573352, 2.371123, 0, 0, 1, 1, 1,
0.4332745, 0.07286604, 1.942862, 1, 0, 0, 1, 1,
0.4355194, -0.3012588, 2.03186, 1, 0, 0, 1, 1,
0.4358085, -0.1399722, 3.51841, 1, 0, 0, 1, 1,
0.4359598, -0.5324477, 1.583212, 1, 0, 0, 1, 1,
0.4367495, 1.474492, 0.7798536, 1, 0, 0, 1, 1,
0.4456362, -0.8757969, 1.640636, 0, 0, 0, 1, 1,
0.4512354, 0.8971863, -0.2100534, 0, 0, 0, 1, 1,
0.4517367, -0.2535214, 0.9238701, 0, 0, 0, 1, 1,
0.4526967, -0.6512856, 2.242786, 0, 0, 0, 1, 1,
0.4576846, 0.06162477, -0.2677538, 0, 0, 0, 1, 1,
0.4589683, -0.5703148, 2.712617, 0, 0, 0, 1, 1,
0.4602778, 0.02140764, 1.15923, 0, 0, 0, 1, 1,
0.4619108, -0.2073854, 0.7564061, 1, 1, 1, 1, 1,
0.4625627, 0.5696341, 0.5329752, 1, 1, 1, 1, 1,
0.465232, 0.09340426, 2.923302, 1, 1, 1, 1, 1,
0.4669962, -0.1131652, 1.794167, 1, 1, 1, 1, 1,
0.4671278, -0.171517, 0.8782873, 1, 1, 1, 1, 1,
0.4674924, 0.8218254, 2.300558, 1, 1, 1, 1, 1,
0.4716516, 1.820852, 0.9727732, 1, 1, 1, 1, 1,
0.4780915, -1.53209, 2.872141, 1, 1, 1, 1, 1,
0.4792569, -0.3405851, 3.52259, 1, 1, 1, 1, 1,
0.4813118, -1.316028, 3.115904, 1, 1, 1, 1, 1,
0.4816642, -1.864295, 2.305539, 1, 1, 1, 1, 1,
0.4819558, -0.3583806, 1.182827, 1, 1, 1, 1, 1,
0.4839266, 0.4412655, 1.177528, 1, 1, 1, 1, 1,
0.4842768, 0.5732352, -1.587305, 1, 1, 1, 1, 1,
0.4908259, -0.842531, 2.869446, 1, 1, 1, 1, 1,
0.4942292, -0.4415082, 2.241613, 0, 0, 1, 1, 1,
0.4986448, -1.246293, 2.14426, 1, 0, 0, 1, 1,
0.5035462, -0.7939842, 5.585717, 1, 0, 0, 1, 1,
0.5061249, -0.09660063, 1.574014, 1, 0, 0, 1, 1,
0.511106, -0.1266695, 1.502692, 1, 0, 0, 1, 1,
0.5166569, 0.5273771, -0.6694215, 1, 0, 0, 1, 1,
0.5204142, 0.9499898, 1.327959, 0, 0, 0, 1, 1,
0.5267388, -0.706776, 1.216125, 0, 0, 0, 1, 1,
0.5310485, -0.1785768, 2.953573, 0, 0, 0, 1, 1,
0.5357681, -1.094967, 3.334339, 0, 0, 0, 1, 1,
0.5393359, 0.3794484, 1.543857, 0, 0, 0, 1, 1,
0.5421057, -0.8568417, 3.418552, 0, 0, 0, 1, 1,
0.5454556, -0.5380909, 1.495477, 0, 0, 0, 1, 1,
0.5459316, -0.09983492, 1.643709, 1, 1, 1, 1, 1,
0.5463082, -1.166476, 0.8349746, 1, 1, 1, 1, 1,
0.5500108, -2.068003, 4.90609, 1, 1, 1, 1, 1,
0.5543289, 1.287439, 2.451855, 1, 1, 1, 1, 1,
0.555791, -0.1767476, 2.772592, 1, 1, 1, 1, 1,
0.5617861, 1.234925, 1.18537, 1, 1, 1, 1, 1,
0.5630748, -0.5002974, 2.835997, 1, 1, 1, 1, 1,
0.5743732, 1.097163, 0.704155, 1, 1, 1, 1, 1,
0.5756323, 0.4689828, 1.192225, 1, 1, 1, 1, 1,
0.5796551, 1.505814, 0.1872136, 1, 1, 1, 1, 1,
0.5804017, -0.9917571, 3.105928, 1, 1, 1, 1, 1,
0.5855766, 1.300178, 0.5935274, 1, 1, 1, 1, 1,
0.5867476, 0.4979017, -1.731583, 1, 1, 1, 1, 1,
0.5947408, -0.2093627, 0.4848625, 1, 1, 1, 1, 1,
0.5950596, -0.889793, 3.154468, 1, 1, 1, 1, 1,
0.5962198, 0.951374, 1.013768, 0, 0, 1, 1, 1,
0.6023371, 0.1760238, 1.533302, 1, 0, 0, 1, 1,
0.6036316, 1.079719, 0.07283684, 1, 0, 0, 1, 1,
0.6047096, -0.1089977, 1.145788, 1, 0, 0, 1, 1,
0.6050867, -0.2463674, -0.8070051, 1, 0, 0, 1, 1,
0.6061541, -0.93831, 1.599017, 1, 0, 0, 1, 1,
0.6066444, -0.5680871, 4.378333, 0, 0, 0, 1, 1,
0.607801, 0.2257692, 0.3890911, 0, 0, 0, 1, 1,
0.6112989, 0.8477517, 1.608278, 0, 0, 0, 1, 1,
0.6143619, -1.573303, 4.0995, 0, 0, 0, 1, 1,
0.6164921, -0.04947096, 2.237694, 0, 0, 0, 1, 1,
0.6220473, 1.090848, 1.89751, 0, 0, 0, 1, 1,
0.622301, -2.035364, 2.977552, 0, 0, 0, 1, 1,
0.6230819, 0.1363092, 0.8714746, 1, 1, 1, 1, 1,
0.6245085, 0.2685502, 0.5343628, 1, 1, 1, 1, 1,
0.6248809, 0.5656106, 0.8601711, 1, 1, 1, 1, 1,
0.6310969, 0.5638588, 0.9395456, 1, 1, 1, 1, 1,
0.6314149, -1.07531, 0.9252892, 1, 1, 1, 1, 1,
0.6336456, 0.675904, 0.3120131, 1, 1, 1, 1, 1,
0.637848, -1.475703, 2.815078, 1, 1, 1, 1, 1,
0.6387396, -0.2921949, 0.5661954, 1, 1, 1, 1, 1,
0.6403182, 0.2310226, -0.187464, 1, 1, 1, 1, 1,
0.6498411, 1.75164, 0.8099771, 1, 1, 1, 1, 1,
0.6548556, 0.2171745, 1.742968, 1, 1, 1, 1, 1,
0.6618279, -0.2413997, 2.538826, 1, 1, 1, 1, 1,
0.6621397, 0.03069652, 2.510031, 1, 1, 1, 1, 1,
0.6628885, 1.863064, 0.9552563, 1, 1, 1, 1, 1,
0.6649341, 0.9839173, -0.4928378, 1, 1, 1, 1, 1,
0.667969, -0.8514673, 3.267062, 0, 0, 1, 1, 1,
0.6688773, 0.90878, 0.7946429, 1, 0, 0, 1, 1,
0.6712945, -1.260431, 2.148218, 1, 0, 0, 1, 1,
0.6735902, -0.5847972, 1.388412, 1, 0, 0, 1, 1,
0.6770172, -1.124789, 3.511873, 1, 0, 0, 1, 1,
0.6771839, 1.065524, 1.421356, 1, 0, 0, 1, 1,
0.6796514, -1.303338, 2.254323, 0, 0, 0, 1, 1,
0.6836313, -1.05436, 4.169238, 0, 0, 0, 1, 1,
0.689482, -0.5771853, 1.337668, 0, 0, 0, 1, 1,
0.6917378, -0.01688876, 2.236992, 0, 0, 0, 1, 1,
0.6929678, 0.1320882, 0.09886912, 0, 0, 0, 1, 1,
0.6937531, 1.294774, 1.000561, 0, 0, 0, 1, 1,
0.7132027, -1.147037, 2.95003, 0, 0, 0, 1, 1,
0.7138613, 0.86759, 0.486799, 1, 1, 1, 1, 1,
0.7190625, 0.4885871, 0.04849218, 1, 1, 1, 1, 1,
0.7290357, -0.7850821, 2.663911, 1, 1, 1, 1, 1,
0.7326783, -0.376718, 1.511709, 1, 1, 1, 1, 1,
0.7340912, 0.4579698, 2.286623, 1, 1, 1, 1, 1,
0.7377582, 0.3946456, 2.224081, 1, 1, 1, 1, 1,
0.7424477, -1.047943, 3.868374, 1, 1, 1, 1, 1,
0.7441713, 0.6789986, 0.4107914, 1, 1, 1, 1, 1,
0.7471543, 0.7193106, 2.128046, 1, 1, 1, 1, 1,
0.7499591, -0.3749832, 0.8056222, 1, 1, 1, 1, 1,
0.7499794, -0.4287122, 1.607083, 1, 1, 1, 1, 1,
0.7693026, -0.6648594, 2.423368, 1, 1, 1, 1, 1,
0.7737018, 1.276356, 0.08393927, 1, 1, 1, 1, 1,
0.776755, -0.5199246, 3.754292, 1, 1, 1, 1, 1,
0.7784747, 0.7831287, -0.2347895, 1, 1, 1, 1, 1,
0.7793419, 1.732423, 0.5795074, 0, 0, 1, 1, 1,
0.7807191, 0.0327678, 1.477439, 1, 0, 0, 1, 1,
0.7871702, -1.225366, 2.740047, 1, 0, 0, 1, 1,
0.7885615, -0.66864, 1.361235, 1, 0, 0, 1, 1,
0.7906919, -0.7515287, 2.983505, 1, 0, 0, 1, 1,
0.7950045, -0.0315459, 2.013895, 1, 0, 0, 1, 1,
0.795091, -1.022727, 3.002947, 0, 0, 0, 1, 1,
0.7957802, 0.9203952, 1.857292, 0, 0, 0, 1, 1,
0.7975636, -1.123555, 1.813599, 0, 0, 0, 1, 1,
0.8004952, 1.519908, -0.6854188, 0, 0, 0, 1, 1,
0.8017145, 0.1701478, 2.559531, 0, 0, 0, 1, 1,
0.8071685, -1.11981, 2.990644, 0, 0, 0, 1, 1,
0.8084717, 0.769441, -0.360771, 0, 0, 0, 1, 1,
0.8091832, -0.4316666, 0.4251327, 1, 1, 1, 1, 1,
0.8092092, -0.1788016, 4.279296, 1, 1, 1, 1, 1,
0.8184502, -0.4213107, 1.234923, 1, 1, 1, 1, 1,
0.8196412, -0.1437415, 0.8716421, 1, 1, 1, 1, 1,
0.8205588, 0.6830405, 1.314497, 1, 1, 1, 1, 1,
0.8231219, 0.7959301, 2.071117, 1, 1, 1, 1, 1,
0.8273132, 0.2319693, 1.426171, 1, 1, 1, 1, 1,
0.8273196, -0.3050137, 0.320394, 1, 1, 1, 1, 1,
0.8300548, -0.3173634, 2.594588, 1, 1, 1, 1, 1,
0.8363639, -1.01617, 3.769842, 1, 1, 1, 1, 1,
0.8382668, 0.7656286, 1.973029, 1, 1, 1, 1, 1,
0.8385059, -0.7468054, 3.259281, 1, 1, 1, 1, 1,
0.8455594, 1.28332, 0.3564545, 1, 1, 1, 1, 1,
0.8465776, 1.15596, 0.01900988, 1, 1, 1, 1, 1,
0.8503734, 0.6651334, 0.6923473, 1, 1, 1, 1, 1,
0.8665304, -2.251631, 3.427966, 0, 0, 1, 1, 1,
0.8688031, -0.01797748, 2.227348, 1, 0, 0, 1, 1,
0.8717559, 0.8847875, 1.402976, 1, 0, 0, 1, 1,
0.8847057, 0.4639223, 1.901983, 1, 0, 0, 1, 1,
0.8905702, 0.03173441, 0.7562369, 1, 0, 0, 1, 1,
0.8968691, -0.8520512, 2.098655, 1, 0, 0, 1, 1,
0.897658, -0.5252771, 2.932086, 0, 0, 0, 1, 1,
0.9056417, -0.3856763, 2.131913, 0, 0, 0, 1, 1,
0.9131632, 0.2420412, 1.882885, 0, 0, 0, 1, 1,
0.9164358, 0.6015427, 3.239296, 0, 0, 0, 1, 1,
0.9166968, 1.247086, 1.131435, 0, 0, 0, 1, 1,
0.9169441, -0.7253096, 3.117999, 0, 0, 0, 1, 1,
0.9213871, 0.2223058, 1.410518, 0, 0, 0, 1, 1,
0.9223393, -0.1393744, 0.8364875, 1, 1, 1, 1, 1,
0.9237899, 0.4978733, 0.8649094, 1, 1, 1, 1, 1,
0.9254837, -0.02690977, 1.718785, 1, 1, 1, 1, 1,
0.9271467, -1.327492, 2.541933, 1, 1, 1, 1, 1,
0.9272254, -1.123225, 1.81544, 1, 1, 1, 1, 1,
0.9330299, 0.8604707, 3.207288, 1, 1, 1, 1, 1,
0.9333732, 0.2499882, 1.476953, 1, 1, 1, 1, 1,
0.935639, 0.4757428, 1.997712, 1, 1, 1, 1, 1,
0.9444402, -1.080209, 2.886049, 1, 1, 1, 1, 1,
0.950246, -0.6854671, 3.045852, 1, 1, 1, 1, 1,
0.9548672, -0.6160402, 0.899491, 1, 1, 1, 1, 1,
0.9563419, -1.159733, 1.213514, 1, 1, 1, 1, 1,
0.9626623, 0.4407642, 0.05519246, 1, 1, 1, 1, 1,
0.9634041, 1.737785, -0.1826735, 1, 1, 1, 1, 1,
0.9645685, -0.6385925, 1.920287, 1, 1, 1, 1, 1,
0.9669252, -1.234027, 1.717299, 0, 0, 1, 1, 1,
0.9732323, 0.009295241, 1.474685, 1, 0, 0, 1, 1,
0.980616, 0.7487825, 2.955974, 1, 0, 0, 1, 1,
0.985999, 0.8892047, 1.01588, 1, 0, 0, 1, 1,
0.9877533, 0.3474024, 1.646235, 1, 0, 0, 1, 1,
0.9889052, -1.136971, 4.189496, 1, 0, 0, 1, 1,
0.9906091, -1.408844, 3.241116, 0, 0, 0, 1, 1,
0.9937833, 0.370707, 2.544697, 0, 0, 0, 1, 1,
0.9998508, 0.3447815, 1.464557, 0, 0, 0, 1, 1,
1.002295, -0.9798934, 2.409895, 0, 0, 0, 1, 1,
1.008902, 0.9043882, -0.04302471, 0, 0, 0, 1, 1,
1.011082, 0.5781137, 0.9015091, 0, 0, 0, 1, 1,
1.011527, -0.06801186, 0.3658243, 0, 0, 0, 1, 1,
1.016488, -0.9624791, 2.433179, 1, 1, 1, 1, 1,
1.018523, -0.3790751, 3.578933, 1, 1, 1, 1, 1,
1.018822, 0.1940856, 1.082099, 1, 1, 1, 1, 1,
1.031092, 0.9857219, 2.085785, 1, 1, 1, 1, 1,
1.039617, -0.3847762, 1.75679, 1, 1, 1, 1, 1,
1.041831, 0.3951859, 0.9447122, 1, 1, 1, 1, 1,
1.043604, 1.344067, 0.4359892, 1, 1, 1, 1, 1,
1.054732, 0.02845138, 1.365963, 1, 1, 1, 1, 1,
1.056663, -2.146988, 2.70408, 1, 1, 1, 1, 1,
1.058912, -0.5773588, 2.976414, 1, 1, 1, 1, 1,
1.061734, -0.3394883, 0.6092288, 1, 1, 1, 1, 1,
1.06358, 0.1114681, 1.131797, 1, 1, 1, 1, 1,
1.068456, -0.7676786, 1.959707, 1, 1, 1, 1, 1,
1.070896, -1.956265, 3.637129, 1, 1, 1, 1, 1,
1.075143, 0.0002938653, 1.752951, 1, 1, 1, 1, 1,
1.07765, -0.7202519, 2.704852, 0, 0, 1, 1, 1,
1.082384, -0.1911303, 0.2676369, 1, 0, 0, 1, 1,
1.090838, 1.77948, -0.3562455, 1, 0, 0, 1, 1,
1.101981, 0.2000881, 2.068207, 1, 0, 0, 1, 1,
1.111677, 0.5151395, 1.158426, 1, 0, 0, 1, 1,
1.112163, 0.2397719, 0.5047915, 1, 0, 0, 1, 1,
1.121215, 0.2362931, 1.660149, 0, 0, 0, 1, 1,
1.130948, -0.5910277, 0.4798508, 0, 0, 0, 1, 1,
1.141288, -0.2332552, 2.296535, 0, 0, 0, 1, 1,
1.145047, 0.5915504, -0.1869392, 0, 0, 0, 1, 1,
1.146164, -1.509967, 2.668425, 0, 0, 0, 1, 1,
1.148051, 1.386469, 0.02202334, 0, 0, 0, 1, 1,
1.152945, 0.8907586, 1.703711, 0, 0, 0, 1, 1,
1.168732, -1.212684, 1.885602, 1, 1, 1, 1, 1,
1.169745, -0.02858771, 1.489211, 1, 1, 1, 1, 1,
1.171253, 2.06544, 1.016277, 1, 1, 1, 1, 1,
1.173267, 0.8510292, 1.005381, 1, 1, 1, 1, 1,
1.173323, -0.01062553, 2.33594, 1, 1, 1, 1, 1,
1.186565, -0.1920355, 1.084541, 1, 1, 1, 1, 1,
1.187025, 1.068179, -0.4317429, 1, 1, 1, 1, 1,
1.201108, 0.7213146, 0.8648879, 1, 1, 1, 1, 1,
1.208357, 1.255994, 0.501834, 1, 1, 1, 1, 1,
1.212897, 0.7875934, 1.054347, 1, 1, 1, 1, 1,
1.214323, -1.327355, 2.972617, 1, 1, 1, 1, 1,
1.218059, -0.4282073, 1.1656, 1, 1, 1, 1, 1,
1.224913, 0.4935766, 0.9517529, 1, 1, 1, 1, 1,
1.241542, 2.192194, -1.87666, 1, 1, 1, 1, 1,
1.246474, -0.3347368, 1.290947, 1, 1, 1, 1, 1,
1.247744, 0.05025968, 3.099242, 0, 0, 1, 1, 1,
1.251076, -0.937454, 2.278755, 1, 0, 0, 1, 1,
1.260304, -1.561887, 2.293799, 1, 0, 0, 1, 1,
1.260903, 0.217026, 0.6697862, 1, 0, 0, 1, 1,
1.289011, -0.2277984, -0.4442779, 1, 0, 0, 1, 1,
1.291428, -0.7370796, 4.204042, 1, 0, 0, 1, 1,
1.29371, 0.4835878, 1.070721, 0, 0, 0, 1, 1,
1.30259, 0.7991917, 0.04071342, 0, 0, 0, 1, 1,
1.306588, 0.9365051, 1.748692, 0, 0, 0, 1, 1,
1.310883, -2.449206, 1.176129, 0, 0, 0, 1, 1,
1.312374, 1.393133, 0.4401959, 0, 0, 0, 1, 1,
1.316177, -0.06710415, 0.2659148, 0, 0, 0, 1, 1,
1.325125, -0.2216617, 2.053891, 0, 0, 0, 1, 1,
1.336274, -0.119662, 1.94544, 1, 1, 1, 1, 1,
1.348908, -0.5732545, 2.715252, 1, 1, 1, 1, 1,
1.358146, 1.05995, -0.1506709, 1, 1, 1, 1, 1,
1.359165, 0.8896046, 1.326489, 1, 1, 1, 1, 1,
1.366472, -1.302056, 2.426586, 1, 1, 1, 1, 1,
1.368593, -1.37794, 1.615393, 1, 1, 1, 1, 1,
1.371171, 0.5442466, 0.8109591, 1, 1, 1, 1, 1,
1.375809, -0.05285765, 1.204256, 1, 1, 1, 1, 1,
1.376397, 1.931928, 2.209182, 1, 1, 1, 1, 1,
1.37669, -0.6455688, 1.188446, 1, 1, 1, 1, 1,
1.377792, 0.6286445, -0.2079986, 1, 1, 1, 1, 1,
1.386511, -0.9385921, 1.037077, 1, 1, 1, 1, 1,
1.409774, 0.2123596, 0.2765646, 1, 1, 1, 1, 1,
1.432732, 0.7590731, 1.045238, 1, 1, 1, 1, 1,
1.437599, 1.362295, 1.430217, 1, 1, 1, 1, 1,
1.457474, -0.8577368, 2.256116, 0, 0, 1, 1, 1,
1.457981, 0.690483, 0.704737, 1, 0, 0, 1, 1,
1.463839, -0.8268573, 2.4558, 1, 0, 0, 1, 1,
1.476061, 0.09415288, 2.199263, 1, 0, 0, 1, 1,
1.494471, 0.9553798, 1.484223, 1, 0, 0, 1, 1,
1.494996, 1.356927, 1.009863, 1, 0, 0, 1, 1,
1.498397, 0.8095929, 2.309433, 0, 0, 0, 1, 1,
1.49934, -0.1040579, 2.366166, 0, 0, 0, 1, 1,
1.499987, 0.6249585, 3.062244, 0, 0, 0, 1, 1,
1.500885, 0.3253311, 2.288544, 0, 0, 0, 1, 1,
1.502326, 0.4788179, 2.522229, 0, 0, 0, 1, 1,
1.506247, -1.626023, 3.342287, 0, 0, 0, 1, 1,
1.523123, -0.03350312, 1.1654, 0, 0, 0, 1, 1,
1.531501, 1.241925, 1.151482, 1, 1, 1, 1, 1,
1.535417, 1.876495, 0.9270152, 1, 1, 1, 1, 1,
1.535881, -0.650197, 0.8211774, 1, 1, 1, 1, 1,
1.537359, 0.237676, 1.781275, 1, 1, 1, 1, 1,
1.561653, 0.418102, 0.8137013, 1, 1, 1, 1, 1,
1.57026, -0.6165264, 0.7290617, 1, 1, 1, 1, 1,
1.584725, 0.1305096, 1.068479, 1, 1, 1, 1, 1,
1.60854, -1.114217, 0.9534347, 1, 1, 1, 1, 1,
1.624308, 0.3902724, 1.224227, 1, 1, 1, 1, 1,
1.632528, 0.5098019, 1.419147, 1, 1, 1, 1, 1,
1.634537, 0.3669209, 1.731723, 1, 1, 1, 1, 1,
1.640149, 1.291165, 0.816588, 1, 1, 1, 1, 1,
1.668972, 1.85382, 0.9791004, 1, 1, 1, 1, 1,
1.688572, 2.375185, 2.713767, 1, 1, 1, 1, 1,
1.693272, 0.8466035, 0.6736635, 1, 1, 1, 1, 1,
1.699168, -1.434545, 3.457831, 0, 0, 1, 1, 1,
1.705062, -0.09342737, 3.464688, 1, 0, 0, 1, 1,
1.727907, 1.273042, 1.436579, 1, 0, 0, 1, 1,
1.735543, 0.5614994, -0.1347658, 1, 0, 0, 1, 1,
1.73599, 1.073676, 2.300553, 1, 0, 0, 1, 1,
1.737022, -0.2236509, 2.933229, 1, 0, 0, 1, 1,
1.746775, -0.7073758, 3.065281, 0, 0, 0, 1, 1,
1.74988, -0.2099225, 2.615761, 0, 0, 0, 1, 1,
1.773145, 0.5240993, 2.722553, 0, 0, 0, 1, 1,
1.779834, -0.03956292, 2.40038, 0, 0, 0, 1, 1,
1.781514, -0.6851883, 1.456808, 0, 0, 0, 1, 1,
1.81135, 0.2629777, -0.223368, 0, 0, 0, 1, 1,
1.819908, -0.2779029, -0.1727101, 0, 0, 0, 1, 1,
1.824461, -0.5289288, 2.257841, 1, 1, 1, 1, 1,
1.853202, 1.311921, 1.817823, 1, 1, 1, 1, 1,
1.858086, 1.007698, 1.002889, 1, 1, 1, 1, 1,
1.871618, 1.70015, 0.02510761, 1, 1, 1, 1, 1,
1.876197, -0.8851858, 2.030897, 1, 1, 1, 1, 1,
1.881268, -0.06583215, 1.884392, 1, 1, 1, 1, 1,
1.898916, 1.337185, 0.236014, 1, 1, 1, 1, 1,
1.924048, -0.4798933, 1.373735, 1, 1, 1, 1, 1,
1.932778, 0.9629444, -0.02631747, 1, 1, 1, 1, 1,
1.937543, 0.637315, 0.06509659, 1, 1, 1, 1, 1,
1.959601, -0.2375358, 2.881745, 1, 1, 1, 1, 1,
1.966414, -1.703355, 3.05164, 1, 1, 1, 1, 1,
1.97024, 0.91545, 1.853053, 1, 1, 1, 1, 1,
1.972679, -0.04619415, 1.631108, 1, 1, 1, 1, 1,
1.996534, -0.6759968, 3.025017, 1, 1, 1, 1, 1,
2.001066, -1.19459, 2.866668, 0, 0, 1, 1, 1,
2.010314, -0.6535938, 2.503904, 1, 0, 0, 1, 1,
2.020625, 0.5333216, 1.905479, 1, 0, 0, 1, 1,
2.046069, -0.9730061, 1.24004, 1, 0, 0, 1, 1,
2.057556, 0.1851518, 1.052714, 1, 0, 0, 1, 1,
2.067171, 1.664902, 2.464428, 1, 0, 0, 1, 1,
2.11182, -1.219489, 3.888676, 0, 0, 0, 1, 1,
2.114125, -0.09811021, 0.3200696, 0, 0, 0, 1, 1,
2.218748, -0.5283892, 2.25818, 0, 0, 0, 1, 1,
2.281508, -1.563483, 3.375282, 0, 0, 0, 1, 1,
2.296608, -0.785321, 1.92878, 0, 0, 0, 1, 1,
2.314914, 0.06641877, 1.829166, 0, 0, 0, 1, 1,
2.345254, 1.428427, -0.229533, 0, 0, 0, 1, 1,
2.358494, 0.6906792, 0.3935402, 1, 1, 1, 1, 1,
2.43796, -0.3991386, 1.350501, 1, 1, 1, 1, 1,
2.438875, -0.3476523, 1.569309, 1, 1, 1, 1, 1,
2.440133, -0.3974558, -0.5847449, 1, 1, 1, 1, 1,
2.546372, -2.152313, 1.953687, 1, 1, 1, 1, 1,
2.633464, -0.9733812, 2.980095, 1, 1, 1, 1, 1,
2.693783, -1.898376, 1.705283, 1, 1, 1, 1, 1
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
var radius = 9.243488;
var distance = 32.46736;
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
mvMatrix.translate( 0.3045233, 0.04691374, -0.2926993 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.46736);
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