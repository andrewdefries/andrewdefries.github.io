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
-2.936051, -0.9195715, -1.254752, 1, 0, 0, 1,
-2.722112, -1.027343, -2.06488, 1, 0.007843138, 0, 1,
-2.702558, -0.3462382, -0.07934181, 1, 0.01176471, 0, 1,
-2.651771, 0.3080578, -1.91909, 1, 0.01960784, 0, 1,
-2.489931, -0.5938043, -1.883688, 1, 0.02352941, 0, 1,
-2.457332, -0.1894728, -2.664543, 1, 0.03137255, 0, 1,
-2.41035, -0.1669585, -1.745919, 1, 0.03529412, 0, 1,
-2.368841, 1.32502, 0.05329124, 1, 0.04313726, 0, 1,
-2.351001, 0.06707111, 1.036566, 1, 0.04705882, 0, 1,
-2.33226, -0.8801499, -1.011212, 1, 0.05490196, 0, 1,
-2.327243, 1.505166, -0.6876869, 1, 0.05882353, 0, 1,
-2.317152, 1.229731, -0.9871903, 1, 0.06666667, 0, 1,
-2.28291, 0.2441643, -0.4083074, 1, 0.07058824, 0, 1,
-2.264461, 0.1023125, -1.350379, 1, 0.07843138, 0, 1,
-2.258703, -0.8527607, -2.25011, 1, 0.08235294, 0, 1,
-2.24563, 0.3432519, -4.475724, 1, 0.09019608, 0, 1,
-2.183589, 0.06075556, -1.528329, 1, 0.09411765, 0, 1,
-2.155782, 0.3661338, 0.807886, 1, 0.1019608, 0, 1,
-2.154721, 0.1394619, -1.882175, 1, 0.1098039, 0, 1,
-2.139254, -0.6480573, -1.826375, 1, 0.1137255, 0, 1,
-2.133856, 0.4921758, -1.86632, 1, 0.1215686, 0, 1,
-2.119429, -0.1417838, -1.691144, 1, 0.1254902, 0, 1,
-2.087062, -0.7043598, -1.065267, 1, 0.1333333, 0, 1,
-2.047298, 1.359591, -1.520536, 1, 0.1372549, 0, 1,
-2.007796, -0.6019862, -1.805548, 1, 0.145098, 0, 1,
-2.001341, -1.185296, -3.131227, 1, 0.1490196, 0, 1,
-1.997006, -1.443269, -3.447619, 1, 0.1568628, 0, 1,
-1.989594, 0.4693668, -1.802626, 1, 0.1607843, 0, 1,
-1.983237, 1.058291, -0.8506497, 1, 0.1686275, 0, 1,
-1.98194, 1.320814, -0.1703675, 1, 0.172549, 0, 1,
-1.980294, -1.449268, -2.839063, 1, 0.1803922, 0, 1,
-1.967244, -0.1059333, -3.325261, 1, 0.1843137, 0, 1,
-1.953195, 0.06991374, -0.5011738, 1, 0.1921569, 0, 1,
-1.95257, 1.966818, -2.569317, 1, 0.1960784, 0, 1,
-1.943107, -0.4052248, -2.44748, 1, 0.2039216, 0, 1,
-1.905136, 0.2633084, -1.355193, 1, 0.2117647, 0, 1,
-1.899174, -0.1783515, -1.79883, 1, 0.2156863, 0, 1,
-1.892052, 1.793165, -0.5153854, 1, 0.2235294, 0, 1,
-1.889384, -0.4620924, -1.900848, 1, 0.227451, 0, 1,
-1.865921, -0.09097677, -1.869962, 1, 0.2352941, 0, 1,
-1.86493, -0.3016661, -1.002038, 1, 0.2392157, 0, 1,
-1.845942, 0.2558834, -3.412178, 1, 0.2470588, 0, 1,
-1.810478, -1.170618, -3.413303, 1, 0.2509804, 0, 1,
-1.786344, 0.5696346, -0.0489146, 1, 0.2588235, 0, 1,
-1.730818, 0.5965634, -1.348378, 1, 0.2627451, 0, 1,
-1.729625, -0.4006856, -2.250149, 1, 0.2705882, 0, 1,
-1.726308, 2.14691, -0.2802282, 1, 0.2745098, 0, 1,
-1.71119, -0.2893004, -1.828845, 1, 0.282353, 0, 1,
-1.692784, 0.6723422, -1.472075, 1, 0.2862745, 0, 1,
-1.690583, -0.2676008, -3.62411, 1, 0.2941177, 0, 1,
-1.689695, 2.162059, -0.9697286, 1, 0.3019608, 0, 1,
-1.686736, 1.010472, -1.831725, 1, 0.3058824, 0, 1,
-1.679684, 1.482594, -1.549615, 1, 0.3137255, 0, 1,
-1.679323, -0.6198874, -1.93975, 1, 0.3176471, 0, 1,
-1.677461, -0.6627392, -4.004708, 1, 0.3254902, 0, 1,
-1.674793, -1.153116, -3.007978, 1, 0.3294118, 0, 1,
-1.67234, 0.2151498, 0.04439303, 1, 0.3372549, 0, 1,
-1.669968, -1.107816, -1.038811, 1, 0.3411765, 0, 1,
-1.667924, -0.2573161, -1.750075, 1, 0.3490196, 0, 1,
-1.665833, 0.8683943, -1.143521, 1, 0.3529412, 0, 1,
-1.662027, -0.8605359, -1.759183, 1, 0.3607843, 0, 1,
-1.650503, 1.352423, 0.5011885, 1, 0.3647059, 0, 1,
-1.640782, 0.6106781, -1.358113, 1, 0.372549, 0, 1,
-1.629311, -1.72664, -0.6679592, 1, 0.3764706, 0, 1,
-1.621014, -0.7244521, -1.500639, 1, 0.3843137, 0, 1,
-1.619519, 0.09861425, -0.6897493, 1, 0.3882353, 0, 1,
-1.611848, 0.2408068, -0.6820406, 1, 0.3960784, 0, 1,
-1.6086, 2.044774, -1.437879, 1, 0.4039216, 0, 1,
-1.604735, 0.4126888, -1.442505, 1, 0.4078431, 0, 1,
-1.59053, -0.5564201, -3.324064, 1, 0.4156863, 0, 1,
-1.587324, -1.477011, -2.416838, 1, 0.4196078, 0, 1,
-1.57477, -0.171559, -0.6445301, 1, 0.427451, 0, 1,
-1.568225, 0.8495988, -2.003277, 1, 0.4313726, 0, 1,
-1.555653, -0.9956579, -1.279914, 1, 0.4392157, 0, 1,
-1.539974, -0.564535, -2.275697, 1, 0.4431373, 0, 1,
-1.532356, -0.7442922, -2.358093, 1, 0.4509804, 0, 1,
-1.504415, 0.7920374, -0.6840732, 1, 0.454902, 0, 1,
-1.491658, -0.6500041, -3.705792, 1, 0.4627451, 0, 1,
-1.487476, -0.6193069, -2.207681, 1, 0.4666667, 0, 1,
-1.482644, -2.394746, -1.792573, 1, 0.4745098, 0, 1,
-1.481719, -0.1796758, -1.00809, 1, 0.4784314, 0, 1,
-1.473538, -1.46133, -2.503444, 1, 0.4862745, 0, 1,
-1.468063, 0.1978974, -1.258406, 1, 0.4901961, 0, 1,
-1.45036, 0.2601433, -0.3264658, 1, 0.4980392, 0, 1,
-1.443574, 0.8070572, -0.6923554, 1, 0.5058824, 0, 1,
-1.427191, -1.424834, -2.309817, 1, 0.509804, 0, 1,
-1.423095, -0.04178156, -1.293781, 1, 0.5176471, 0, 1,
-1.420294, -0.5369713, -0.8612577, 1, 0.5215687, 0, 1,
-1.409746, 0.135891, 0.2491595, 1, 0.5294118, 0, 1,
-1.401303, 0.4972894, 0.1666067, 1, 0.5333334, 0, 1,
-1.391018, 0.2650156, -2.062801, 1, 0.5411765, 0, 1,
-1.389599, 0.203847, -2.339295, 1, 0.5450981, 0, 1,
-1.384512, 0.06192525, -0.9725672, 1, 0.5529412, 0, 1,
-1.374928, 0.3982255, -2.574394, 1, 0.5568628, 0, 1,
-1.372223, -1.223566, -4.792389, 1, 0.5647059, 0, 1,
-1.372077, -0.8207373, -3.262703, 1, 0.5686275, 0, 1,
-1.371376, 0.9040471, -0.1077413, 1, 0.5764706, 0, 1,
-1.367327, 0.01134961, -1.521434, 1, 0.5803922, 0, 1,
-1.357043, 0.9774578, -2.01061, 1, 0.5882353, 0, 1,
-1.35659, 1.459178, -1.877271, 1, 0.5921569, 0, 1,
-1.353568, 0.8556003, -1.03353, 1, 0.6, 0, 1,
-1.351319, -0.612438, -2.305015, 1, 0.6078432, 0, 1,
-1.348035, -0.5970373, -2.264246, 1, 0.6117647, 0, 1,
-1.33798, -0.1525604, 0.6830853, 1, 0.6196079, 0, 1,
-1.335148, -1.279013, -1.986617, 1, 0.6235294, 0, 1,
-1.32726, 0.4260055, -1.222321, 1, 0.6313726, 0, 1,
-1.327102, -1.476659, -3.361977, 1, 0.6352941, 0, 1,
-1.324958, 0.1558934, -2.355817, 1, 0.6431373, 0, 1,
-1.321827, -0.947814, -1.883894, 1, 0.6470588, 0, 1,
-1.319793, -0.8614191, -0.9842348, 1, 0.654902, 0, 1,
-1.317761, -0.4944237, -2.555691, 1, 0.6588235, 0, 1,
-1.314666, 0.0443701, -1.060095, 1, 0.6666667, 0, 1,
-1.311673, -1.017055, -3.791906, 1, 0.6705883, 0, 1,
-1.309362, -1.5679, -3.72331, 1, 0.6784314, 0, 1,
-1.301468, -0.2991601, -1.938008, 1, 0.682353, 0, 1,
-1.294362, -1.387957, -2.136144, 1, 0.6901961, 0, 1,
-1.287169, -0.934571, -0.9954936, 1, 0.6941177, 0, 1,
-1.286861, -0.9900748, -4.052003, 1, 0.7019608, 0, 1,
-1.283889, -1.11409, -2.851411, 1, 0.7098039, 0, 1,
-1.281628, 0.6943659, -1.43586, 1, 0.7137255, 0, 1,
-1.281249, -0.8786999, -1.878907, 1, 0.7215686, 0, 1,
-1.277306, 1.1573, -0.8553025, 1, 0.7254902, 0, 1,
-1.275766, -0.2277711, -2.373006, 1, 0.7333333, 0, 1,
-1.265015, -1.490619, -0.4912341, 1, 0.7372549, 0, 1,
-1.256794, -0.701039, -2.892539, 1, 0.7450981, 0, 1,
-1.256653, 0.1284193, -1.577241, 1, 0.7490196, 0, 1,
-1.231306, 1.686994, 0.5412639, 1, 0.7568628, 0, 1,
-1.219129, -1.287341, -1.888132, 1, 0.7607843, 0, 1,
-1.216827, -1.645383, -2.610541, 1, 0.7686275, 0, 1,
-1.215852, 0.1189396, -3.39147, 1, 0.772549, 0, 1,
-1.206287, 0.7052605, -0.1962977, 1, 0.7803922, 0, 1,
-1.199294, -1.24387, -2.581017, 1, 0.7843137, 0, 1,
-1.19709, -0.3086817, -1.274955, 1, 0.7921569, 0, 1,
-1.194385, -0.353383, -2.271446, 1, 0.7960784, 0, 1,
-1.193394, -0.1882804, -2.357832, 1, 0.8039216, 0, 1,
-1.180929, -0.2266841, -0.1281897, 1, 0.8117647, 0, 1,
-1.180354, 0.3864872, 0.9203114, 1, 0.8156863, 0, 1,
-1.17701, 1.229677, 0.3352525, 1, 0.8235294, 0, 1,
-1.176104, 0.2920663, -0.8002558, 1, 0.827451, 0, 1,
-1.175716, 0.6611538, -1.874639, 1, 0.8352941, 0, 1,
-1.173147, -0.4498261, -1.61537, 1, 0.8392157, 0, 1,
-1.171507, -0.9329932, 0.2253302, 1, 0.8470588, 0, 1,
-1.170305, 0.6668193, -0.6347319, 1, 0.8509804, 0, 1,
-1.146385, -1.756048, -2.548295, 1, 0.8588235, 0, 1,
-1.141779, 0.2802842, 1.282771, 1, 0.8627451, 0, 1,
-1.137461, -0.7317284, -1.127298, 1, 0.8705882, 0, 1,
-1.136496, 0.5365188, 0.167424, 1, 0.8745098, 0, 1,
-1.124902, 0.62621, -1.126406, 1, 0.8823529, 0, 1,
-1.095856, 0.8477049, -0.6133807, 1, 0.8862745, 0, 1,
-1.084616, 1.88608, -0.7957273, 1, 0.8941177, 0, 1,
-1.073685, -0.4374306, -1.042176, 1, 0.8980392, 0, 1,
-1.070817, -1.411616, -1.503916, 1, 0.9058824, 0, 1,
-1.066302, -0.06510939, -0.5415107, 1, 0.9137255, 0, 1,
-1.064083, 1.131945, 0.6590147, 1, 0.9176471, 0, 1,
-1.063196, 0.07748834, -2.876345, 1, 0.9254902, 0, 1,
-1.061147, -2.163441, -3.29089, 1, 0.9294118, 0, 1,
-1.047615, 2.015384, -0.7079874, 1, 0.9372549, 0, 1,
-1.047128, 0.2627864, -0.7309521, 1, 0.9411765, 0, 1,
-1.043206, -0.4882784, -4.276262, 1, 0.9490196, 0, 1,
-1.036512, -0.5864583, -2.288188, 1, 0.9529412, 0, 1,
-1.032901, 1.511049, 0.09177793, 1, 0.9607843, 0, 1,
-1.031764, 1.203227, -0.8835012, 1, 0.9647059, 0, 1,
-1.029788, 0.05413651, -1.513787, 1, 0.972549, 0, 1,
-1.028652, -0.4563744, -1.094624, 1, 0.9764706, 0, 1,
-1.025771, -0.08065829, -2.443035, 1, 0.9843137, 0, 1,
-1.017432, -0.4197425, -1.645985, 1, 0.9882353, 0, 1,
-1.016404, 0.1770359, -1.55362, 1, 0.9960784, 0, 1,
-1.016136, 0.7787685, -2.057006, 0.9960784, 1, 0, 1,
-1.013944, -0.5354807, -1.256203, 0.9921569, 1, 0, 1,
-1.011167, -0.0265129, -1.146114, 0.9843137, 1, 0, 1,
-1.010989, -0.5269792, -2.413068, 0.9803922, 1, 0, 1,
-1.00856, -0.7825601, -4.191367, 0.972549, 1, 0, 1,
-1.005207, -0.5937446, -2.116692, 0.9686275, 1, 0, 1,
-0.9968197, 0.2325619, -1.639553, 0.9607843, 1, 0, 1,
-0.9922956, -1.686966, -1.002582, 0.9568627, 1, 0, 1,
-0.9893171, 0.3493226, -1.955222, 0.9490196, 1, 0, 1,
-0.9847982, 1.658852, 1.070588, 0.945098, 1, 0, 1,
-0.9832961, 0.7953109, -0.7196977, 0.9372549, 1, 0, 1,
-0.9709892, 1.26879, -0.02360469, 0.9333333, 1, 0, 1,
-0.9707412, -0.5875363, -2.430649, 0.9254902, 1, 0, 1,
-0.9707004, 1.385295, -0.7007315, 0.9215686, 1, 0, 1,
-0.9683356, 1.485643, -2.42484, 0.9137255, 1, 0, 1,
-0.9612278, -0.6641814, -1.578289, 0.9098039, 1, 0, 1,
-0.9596084, 0.8761153, -1.891676, 0.9019608, 1, 0, 1,
-0.9576387, -0.1562116, -2.375361, 0.8941177, 1, 0, 1,
-0.9554296, -0.5543637, -1.830456, 0.8901961, 1, 0, 1,
-0.9521024, 0.8341978, -0.1318381, 0.8823529, 1, 0, 1,
-0.950949, 0.7265873, -0.1566855, 0.8784314, 1, 0, 1,
-0.946537, 1.179446, -1.524648, 0.8705882, 1, 0, 1,
-0.9450139, 1.479203, 0.8381099, 0.8666667, 1, 0, 1,
-0.9445803, -0.0855246, -0.2747073, 0.8588235, 1, 0, 1,
-0.9324221, 0.4999226, -1.833769, 0.854902, 1, 0, 1,
-0.9241226, 0.17954, -4.195301, 0.8470588, 1, 0, 1,
-0.9223605, 1.471471, -0.317545, 0.8431373, 1, 0, 1,
-0.9216368, -1.901561, -2.160783, 0.8352941, 1, 0, 1,
-0.916042, 0.359901, 0.3822873, 0.8313726, 1, 0, 1,
-0.9157518, -0.07600117, -1.243689, 0.8235294, 1, 0, 1,
-0.9133852, 1.086658, -0.2226492, 0.8196079, 1, 0, 1,
-0.9128656, -0.6189224, -2.765105, 0.8117647, 1, 0, 1,
-0.9120694, -0.8070698, -2.266365, 0.8078431, 1, 0, 1,
-0.8992853, 0.9289185, -1.246089, 0.8, 1, 0, 1,
-0.8966402, 0.7561597, -0.447433, 0.7921569, 1, 0, 1,
-0.8949373, -0.6014563, -1.007575, 0.7882353, 1, 0, 1,
-0.8934625, 2.422265, 1.62806, 0.7803922, 1, 0, 1,
-0.8903598, -0.8375556, -4.912014, 0.7764706, 1, 0, 1,
-0.8875233, -0.768947, -1.59101, 0.7686275, 1, 0, 1,
-0.8834423, -2.399549, -2.028239, 0.7647059, 1, 0, 1,
-0.8811523, 0.5522973, -1.979915, 0.7568628, 1, 0, 1,
-0.8782772, 0.3348768, -0.8417311, 0.7529412, 1, 0, 1,
-0.8774362, -0.3759675, -2.461869, 0.7450981, 1, 0, 1,
-0.8728718, 1.007929, -0.2081945, 0.7411765, 1, 0, 1,
-0.8657627, -0.6213918, -0.002814426, 0.7333333, 1, 0, 1,
-0.8623337, -0.2734487, -3.088756, 0.7294118, 1, 0, 1,
-0.8605824, -0.4170126, -2.434123, 0.7215686, 1, 0, 1,
-0.858381, -1.684404, -2.776779, 0.7176471, 1, 0, 1,
-0.8583311, -0.06985869, -1.052076, 0.7098039, 1, 0, 1,
-0.8557546, 0.887731, -0.2639726, 0.7058824, 1, 0, 1,
-0.8554693, 0.3336579, 0.9749313, 0.6980392, 1, 0, 1,
-0.8525445, -0.4323632, -2.736168, 0.6901961, 1, 0, 1,
-0.850834, -0.7846832, -1.260662, 0.6862745, 1, 0, 1,
-0.8505513, 1.302426, 0.9735229, 0.6784314, 1, 0, 1,
-0.8435915, -0.8110256, -1.215421, 0.6745098, 1, 0, 1,
-0.8370764, -1.071784, -2.484061, 0.6666667, 1, 0, 1,
-0.8351668, 0.2261552, -2.94385, 0.6627451, 1, 0, 1,
-0.833943, -1.564087, -2.484729, 0.654902, 1, 0, 1,
-0.8335202, -1.225556, -1.997464, 0.6509804, 1, 0, 1,
-0.8304855, 0.1699934, -0.4574129, 0.6431373, 1, 0, 1,
-0.8282047, -0.02534747, -2.058358, 0.6392157, 1, 0, 1,
-0.8241583, 1.009398, -1.379037, 0.6313726, 1, 0, 1,
-0.8233441, 0.6788135, -2.450512, 0.627451, 1, 0, 1,
-0.8213044, -0.6325838, -0.9306731, 0.6196079, 1, 0, 1,
-0.818806, 0.00756655, -1.395368, 0.6156863, 1, 0, 1,
-0.8186319, -1.513561, -3.231063, 0.6078432, 1, 0, 1,
-0.8125243, 0.1838026, -0.4383882, 0.6039216, 1, 0, 1,
-0.8100832, -0.9957806, -1.970344, 0.5960785, 1, 0, 1,
-0.8083329, -0.5968174, -2.495056, 0.5882353, 1, 0, 1,
-0.7959529, -1.176903, -3.644481, 0.5843138, 1, 0, 1,
-0.7938952, -0.502345, -2.544735, 0.5764706, 1, 0, 1,
-0.7905601, 0.6600909, -0.4771119, 0.572549, 1, 0, 1,
-0.7902116, 0.9034514, -0.8437479, 0.5647059, 1, 0, 1,
-0.7854689, -0.1074553, -0.9168364, 0.5607843, 1, 0, 1,
-0.7836447, -0.4287214, -2.534743, 0.5529412, 1, 0, 1,
-0.7830011, 1.134442, -0.02375672, 0.5490196, 1, 0, 1,
-0.7815224, 0.6900468, -1.673001, 0.5411765, 1, 0, 1,
-0.7709377, 0.6616555, -2.002142, 0.5372549, 1, 0, 1,
-0.768025, 0.1150277, -1.403031, 0.5294118, 1, 0, 1,
-0.7669748, -0.7697833, -1.435796, 0.5254902, 1, 0, 1,
-0.7576393, 0.4095468, -0.2254791, 0.5176471, 1, 0, 1,
-0.7492549, 0.9880782, -0.08933685, 0.5137255, 1, 0, 1,
-0.7354379, -0.3935686, -1.698404, 0.5058824, 1, 0, 1,
-0.7340179, -1.460669, -4.011059, 0.5019608, 1, 0, 1,
-0.7334039, 0.9747006, 0.9338206, 0.4941176, 1, 0, 1,
-0.7290094, 0.4637175, -0.7357591, 0.4862745, 1, 0, 1,
-0.7218754, -0.6379961, -2.593211, 0.4823529, 1, 0, 1,
-0.7199951, 0.09717599, -0.5548276, 0.4745098, 1, 0, 1,
-0.7170569, -2.381149, -3.628806, 0.4705882, 1, 0, 1,
-0.7156483, -0.2906643, -2.231312, 0.4627451, 1, 0, 1,
-0.7086561, -0.8981732, -2.965448, 0.4588235, 1, 0, 1,
-0.693829, 0.7180849, -0.8406854, 0.4509804, 1, 0, 1,
-0.6885052, -0.4183185, -3.312727, 0.4470588, 1, 0, 1,
-0.6871054, 1.367989, 0.078756, 0.4392157, 1, 0, 1,
-0.6862849, -1.172053, -1.88222, 0.4352941, 1, 0, 1,
-0.6846152, 1.458177, -2.514374, 0.427451, 1, 0, 1,
-0.6842273, -0.7252136, -1.841905, 0.4235294, 1, 0, 1,
-0.6781013, 1.66707, -0.7332157, 0.4156863, 1, 0, 1,
-0.6762657, 0.3086203, -1.276253, 0.4117647, 1, 0, 1,
-0.6740506, 0.3667124, 0.1134757, 0.4039216, 1, 0, 1,
-0.6734469, 0.8944026, 0.641144, 0.3960784, 1, 0, 1,
-0.6718296, 0.543787, -0.4168571, 0.3921569, 1, 0, 1,
-0.6714343, -0.03593007, -2.831592, 0.3843137, 1, 0, 1,
-0.6634902, -0.182018, -3.056023, 0.3803922, 1, 0, 1,
-0.658201, 0.4652217, -1.308018, 0.372549, 1, 0, 1,
-0.6581447, -0.695381, -1.039103, 0.3686275, 1, 0, 1,
-0.653936, -0.4125731, -4.175416, 0.3607843, 1, 0, 1,
-0.6523777, -0.2831954, -1.841494, 0.3568628, 1, 0, 1,
-0.6515052, -1.653679, -2.88125, 0.3490196, 1, 0, 1,
-0.6432719, 0.01500226, -2.14203, 0.345098, 1, 0, 1,
-0.639711, -0.2508202, -2.90118, 0.3372549, 1, 0, 1,
-0.6377991, -0.2643009, -2.54826, 0.3333333, 1, 0, 1,
-0.6327779, -1.715095, -3.30083, 0.3254902, 1, 0, 1,
-0.6322281, 1.105555, 0.1189974, 0.3215686, 1, 0, 1,
-0.6321155, 0.7096219, -2.319348, 0.3137255, 1, 0, 1,
-0.6292651, 0.7300677, -1.192434, 0.3098039, 1, 0, 1,
-0.6292612, -0.2753401, -2.969276, 0.3019608, 1, 0, 1,
-0.625185, 1.293862, -1.167698, 0.2941177, 1, 0, 1,
-0.6245515, 0.02379612, -0.4815695, 0.2901961, 1, 0, 1,
-0.6218667, 0.06230579, -1.101512, 0.282353, 1, 0, 1,
-0.6180964, -0.2703975, -0.7445709, 0.2784314, 1, 0, 1,
-0.6136769, -0.3587839, -1.730855, 0.2705882, 1, 0, 1,
-0.6103536, -2.062451, -1.631477, 0.2666667, 1, 0, 1,
-0.6102138, -1.160818, -3.052812, 0.2588235, 1, 0, 1,
-0.6090274, -1.074583, -1.690449, 0.254902, 1, 0, 1,
-0.6085821, 0.7498264, 0.01949819, 0.2470588, 1, 0, 1,
-0.6005629, 0.4328504, -0.3979537, 0.2431373, 1, 0, 1,
-0.6004363, -2.247668, -2.884599, 0.2352941, 1, 0, 1,
-0.5962235, 0.1054113, -1.584289, 0.2313726, 1, 0, 1,
-0.5937133, -0.3608588, -1.77251, 0.2235294, 1, 0, 1,
-0.5892193, 1.528758, -0.2354667, 0.2196078, 1, 0, 1,
-0.5890924, 0.05421148, -1.92382, 0.2117647, 1, 0, 1,
-0.5861886, -0.8314692, -2.778319, 0.2078431, 1, 0, 1,
-0.5858102, -1.149893, -5.306805, 0.2, 1, 0, 1,
-0.5779189, 0.5183951, -0.1224981, 0.1921569, 1, 0, 1,
-0.5766604, 0.080492, -1.167834, 0.1882353, 1, 0, 1,
-0.5710946, 0.4248082, -2.287143, 0.1803922, 1, 0, 1,
-0.5644436, 0.5330394, -1.37126, 0.1764706, 1, 0, 1,
-0.5558315, 0.7521691, -0.3660772, 0.1686275, 1, 0, 1,
-0.5539257, 0.3064526, -0.3228174, 0.1647059, 1, 0, 1,
-0.5514352, -0.5440998, -1.47425, 0.1568628, 1, 0, 1,
-0.5476937, 0.9304544, -1.0227, 0.1529412, 1, 0, 1,
-0.5475477, -1.732342, -5.339373, 0.145098, 1, 0, 1,
-0.545049, -1.170522, -2.826001, 0.1411765, 1, 0, 1,
-0.5343979, 0.675423, -0.3721659, 0.1333333, 1, 0, 1,
-0.5284455, -0.1334742, -0.1286419, 0.1294118, 1, 0, 1,
-0.5256833, 1.54861, 0.9219727, 0.1215686, 1, 0, 1,
-0.5208539, -0.2579219, -2.194251, 0.1176471, 1, 0, 1,
-0.5192396, 0.3579042, 0.1589229, 0.1098039, 1, 0, 1,
-0.5174059, -0.1422249, -2.448013, 0.1058824, 1, 0, 1,
-0.516812, 1.382855, -0.260248, 0.09803922, 1, 0, 1,
-0.5120719, -0.9329928, -2.605561, 0.09019608, 1, 0, 1,
-0.5116102, 0.7970337, -1.009343, 0.08627451, 1, 0, 1,
-0.5055099, -0.03008162, -1.535479, 0.07843138, 1, 0, 1,
-0.5053592, -1.031588, -2.72918, 0.07450981, 1, 0, 1,
-0.501504, -0.681204, -4.184909, 0.06666667, 1, 0, 1,
-0.4996868, 0.6525282, -1.954123, 0.0627451, 1, 0, 1,
-0.4984849, -0.6097834, -1.639996, 0.05490196, 1, 0, 1,
-0.4977567, -0.3822899, -2.040958, 0.05098039, 1, 0, 1,
-0.4964162, -0.2783127, -2.470326, 0.04313726, 1, 0, 1,
-0.4951549, -0.551172, -1.61099, 0.03921569, 1, 0, 1,
-0.4933374, -0.5445267, -0.8224557, 0.03137255, 1, 0, 1,
-0.4894119, -0.3044944, -0.056517, 0.02745098, 1, 0, 1,
-0.4840758, 0.8790713, 0.0601937, 0.01960784, 1, 0, 1,
-0.4798434, -0.06499915, -1.120416, 0.01568628, 1, 0, 1,
-0.4740644, -1.305257, -2.337868, 0.007843138, 1, 0, 1,
-0.4723083, 1.000642, -1.762939, 0.003921569, 1, 0, 1,
-0.4716673, 0.08368704, -2.508073, 0, 1, 0.003921569, 1,
-0.4709275, 0.63911, -1.977299, 0, 1, 0.01176471, 1,
-0.4695968, -0.5213407, -4.748096, 0, 1, 0.01568628, 1,
-0.4637339, -0.5742581, -1.591454, 0, 1, 0.02352941, 1,
-0.463688, -0.01987937, -0.6788604, 0, 1, 0.02745098, 1,
-0.4557328, 0.3043497, -2.173803, 0, 1, 0.03529412, 1,
-0.4439641, 0.319591, -0.4301389, 0, 1, 0.03921569, 1,
-0.4435918, 0.1548594, -0.2637697, 0, 1, 0.04705882, 1,
-0.4430761, 0.1925166, -2.013601, 0, 1, 0.05098039, 1,
-0.440896, -0.8364663, -2.880528, 0, 1, 0.05882353, 1,
-0.4403846, 0.735878, 0.4646024, 0, 1, 0.0627451, 1,
-0.4385605, -0.5613208, -0.145305, 0, 1, 0.07058824, 1,
-0.4374863, 1.050042, -0.8080158, 0, 1, 0.07450981, 1,
-0.4268163, 1.053558, 0.02198414, 0, 1, 0.08235294, 1,
-0.4259765, 1.335201, 0.3160461, 0, 1, 0.08627451, 1,
-0.422319, 1.006856, -1.640045, 0, 1, 0.09411765, 1,
-0.4157902, 0.2589079, -1.880246, 0, 1, 0.1019608, 1,
-0.4144499, 0.2673472, -1.445992, 0, 1, 0.1058824, 1,
-0.4123348, 0.162535, -0.9157864, 0, 1, 0.1137255, 1,
-0.4107454, 1.187224, 1.200918, 0, 1, 0.1176471, 1,
-0.4078871, -0.2035765, -4.374236, 0, 1, 0.1254902, 1,
-0.4055682, -0.8655733, -3.650835, 0, 1, 0.1294118, 1,
-0.3910506, 0.4280026, -0.1523927, 0, 1, 0.1372549, 1,
-0.3905568, 0.9279326, -2.417643, 0, 1, 0.1411765, 1,
-0.3808593, -0.6952521, -2.393883, 0, 1, 0.1490196, 1,
-0.3786117, -0.234011, -3.386263, 0, 1, 0.1529412, 1,
-0.3786081, -0.3978794, -2.176233, 0, 1, 0.1607843, 1,
-0.3755573, -0.348444, -0.8194816, 0, 1, 0.1647059, 1,
-0.3753012, -1.188451, -2.905063, 0, 1, 0.172549, 1,
-0.3734369, -0.4762849, -0.2855393, 0, 1, 0.1764706, 1,
-0.369712, 1.091526, -0.4579978, 0, 1, 0.1843137, 1,
-0.3578493, 0.9945094, -0.0826088, 0, 1, 0.1882353, 1,
-0.3566502, -0.9189061, -1.332588, 0, 1, 0.1960784, 1,
-0.3549785, -0.1164439, -1.720606, 0, 1, 0.2039216, 1,
-0.3517248, 0.5227799, 0.1050016, 0, 1, 0.2078431, 1,
-0.3511322, 0.5738838, -0.398495, 0, 1, 0.2156863, 1,
-0.3503912, 0.4399992, -0.3717066, 0, 1, 0.2196078, 1,
-0.3497335, -0.2960131, -4.396266, 0, 1, 0.227451, 1,
-0.3492329, 1.194657, -0.9953015, 0, 1, 0.2313726, 1,
-0.3470767, 0.3790509, -1.723403, 0, 1, 0.2392157, 1,
-0.3468688, 0.73327, 1.360536, 0, 1, 0.2431373, 1,
-0.338848, 0.8127289, 0.4974706, 0, 1, 0.2509804, 1,
-0.3356853, 0.5434292, -0.4079166, 0, 1, 0.254902, 1,
-0.335401, -0.8996023, -3.369715, 0, 1, 0.2627451, 1,
-0.3342101, 1.658805, 0.4841375, 0, 1, 0.2666667, 1,
-0.322992, 1.499464, -0.4919786, 0, 1, 0.2745098, 1,
-0.3163753, 0.3112551, -1.362504, 0, 1, 0.2784314, 1,
-0.3159273, 1.261007, -1.154509, 0, 1, 0.2862745, 1,
-0.3152748, 1.260725, -0.6127822, 0, 1, 0.2901961, 1,
-0.3094816, 0.4284699, 1.003183, 0, 1, 0.2980392, 1,
-0.2977459, -0.2317049, -2.618858, 0, 1, 0.3058824, 1,
-0.295161, 0.5980294, -1.542018, 0, 1, 0.3098039, 1,
-0.2930561, -0.8489078, -2.662196, 0, 1, 0.3176471, 1,
-0.2875949, -1.340183, -2.982348, 0, 1, 0.3215686, 1,
-0.2874779, 2.213518, 2.050123, 0, 1, 0.3294118, 1,
-0.2804364, -0.069529, -2.020782, 0, 1, 0.3333333, 1,
-0.279911, 0.8902249, -0.9446557, 0, 1, 0.3411765, 1,
-0.2746266, 0.04375052, -0.5992131, 0, 1, 0.345098, 1,
-0.2730716, -0.4443964, -1.578135, 0, 1, 0.3529412, 1,
-0.2694683, 0.9432909, -0.6195654, 0, 1, 0.3568628, 1,
-0.2689869, -0.0003027809, 0.5757615, 0, 1, 0.3647059, 1,
-0.2679283, -1.602583, -2.545558, 0, 1, 0.3686275, 1,
-0.2676979, 0.5455869, 1.814206, 0, 1, 0.3764706, 1,
-0.2670976, -1.194498, -2.366657, 0, 1, 0.3803922, 1,
-0.2659323, -1.467607, -1.354301, 0, 1, 0.3882353, 1,
-0.262855, -1.037471, -5.163789, 0, 1, 0.3921569, 1,
-0.2585303, -0.6361901, -3.579857, 0, 1, 0.4, 1,
-0.2584383, -0.7373161, -2.548107, 0, 1, 0.4078431, 1,
-0.2564792, -2.427386, -4.174076, 0, 1, 0.4117647, 1,
-0.255243, 0.3017941, -0.5410031, 0, 1, 0.4196078, 1,
-0.2551218, 1.254882, 1.478622, 0, 1, 0.4235294, 1,
-0.2536691, 0.11237, -1.863025, 0, 1, 0.4313726, 1,
-0.2531636, -1.126835, -1.915662, 0, 1, 0.4352941, 1,
-0.2528387, -0.1199782, -2.106327, 0, 1, 0.4431373, 1,
-0.251321, 2.074298, 0.9402146, 0, 1, 0.4470588, 1,
-0.2510113, -0.1157577, -0.9532169, 0, 1, 0.454902, 1,
-0.2310465, 0.8984631, 1.424253, 0, 1, 0.4588235, 1,
-0.2307402, -0.3999389, -2.669819, 0, 1, 0.4666667, 1,
-0.2292089, -0.7499236, -3.362968, 0, 1, 0.4705882, 1,
-0.2280261, -0.4420962, -1.864237, 0, 1, 0.4784314, 1,
-0.2242869, 0.2030353, -2.733953, 0, 1, 0.4823529, 1,
-0.2195144, -0.5598068, -3.24427, 0, 1, 0.4901961, 1,
-0.2161541, 0.4701697, 1.188997, 0, 1, 0.4941176, 1,
-0.2121775, -0.4654651, -1.985139, 0, 1, 0.5019608, 1,
-0.2119247, -1.265201, -1.963854, 0, 1, 0.509804, 1,
-0.2115422, 0.4250117, -1.377005, 0, 1, 0.5137255, 1,
-0.2087915, 0.01461683, -0.1369721, 0, 1, 0.5215687, 1,
-0.2005085, -0.5204259, -4.604897, 0, 1, 0.5254902, 1,
-0.1986829, 0.5489067, -0.809602, 0, 1, 0.5333334, 1,
-0.1955892, -0.7982014, -2.492023, 0, 1, 0.5372549, 1,
-0.1939783, -0.01582577, -2.986846, 0, 1, 0.5450981, 1,
-0.1933043, 1.576355, -1.001363, 0, 1, 0.5490196, 1,
-0.1929617, -0.2452396, -3.318149, 0, 1, 0.5568628, 1,
-0.1924193, 1.125749, -1.225423, 0, 1, 0.5607843, 1,
-0.1915618, -0.05776396, -2.401805, 0, 1, 0.5686275, 1,
-0.1851249, -0.8146315, -2.277056, 0, 1, 0.572549, 1,
-0.1755555, 0.3506025, -2.025104, 0, 1, 0.5803922, 1,
-0.1722802, -0.136899, -1.787775, 0, 1, 0.5843138, 1,
-0.1677313, -1.081711, -2.467072, 0, 1, 0.5921569, 1,
-0.1639325, 0.1018292, -2.135176, 0, 1, 0.5960785, 1,
-0.1632198, 0.7654203, -0.7221019, 0, 1, 0.6039216, 1,
-0.1621112, 2.404543, 0.1466096, 0, 1, 0.6117647, 1,
-0.1608773, -0.2849926, -4.098606, 0, 1, 0.6156863, 1,
-0.1585314, -1.089464, -1.003327, 0, 1, 0.6235294, 1,
-0.1549651, 1.094926, 1.645145, 0, 1, 0.627451, 1,
-0.1546686, -0.4262022, -2.555958, 0, 1, 0.6352941, 1,
-0.1519225, 0.2571639, -0.12283, 0, 1, 0.6392157, 1,
-0.1459103, 0.1486318, -2.818422, 0, 1, 0.6470588, 1,
-0.145313, 0.3030379, -0.298819, 0, 1, 0.6509804, 1,
-0.1424484, -0.1780932, -3.823071, 0, 1, 0.6588235, 1,
-0.1341858, -0.6093056, -3.509432, 0, 1, 0.6627451, 1,
-0.1341116, -1.866202, -2.668763, 0, 1, 0.6705883, 1,
-0.1320318, 0.7069569, -0.5153187, 0, 1, 0.6745098, 1,
-0.1295193, 0.7445878, -0.1224606, 0, 1, 0.682353, 1,
-0.1294232, 1.385312, -0.03602076, 0, 1, 0.6862745, 1,
-0.1287261, 2.412253, 0.5952817, 0, 1, 0.6941177, 1,
-0.1285795, 0.5228251, -1.737666, 0, 1, 0.7019608, 1,
-0.1280125, -0.3786033, -4.456054, 0, 1, 0.7058824, 1,
-0.1252132, -2.495879, -1.581771, 0, 1, 0.7137255, 1,
-0.1242829, 0.9822022, 2.195013, 0, 1, 0.7176471, 1,
-0.1229056, -0.7375886, -2.707612, 0, 1, 0.7254902, 1,
-0.1221332, 0.1627299, -0.504078, 0, 1, 0.7294118, 1,
-0.1215729, -0.977959, -1.972222, 0, 1, 0.7372549, 1,
-0.118625, 1.023585, -1.97232, 0, 1, 0.7411765, 1,
-0.1161297, -0.990296, -2.848707, 0, 1, 0.7490196, 1,
-0.1127188, 0.8095273, 0.1739702, 0, 1, 0.7529412, 1,
-0.1092179, -0.2343685, -2.733936, 0, 1, 0.7607843, 1,
-0.1085404, -0.9393458, -3.000393, 0, 1, 0.7647059, 1,
-0.1029432, -0.3853641, -3.487355, 0, 1, 0.772549, 1,
-0.1027272, -1.40645, -2.325712, 0, 1, 0.7764706, 1,
-0.09547544, -1.455702, -1.892903, 0, 1, 0.7843137, 1,
-0.09374464, -0.5302355, -3.570577, 0, 1, 0.7882353, 1,
-0.09285838, -0.2228349, -1.955704, 0, 1, 0.7960784, 1,
-0.08822207, 1.168069, -0.9523407, 0, 1, 0.8039216, 1,
-0.08592797, 0.09877805, -1.858177, 0, 1, 0.8078431, 1,
-0.0852746, -0.8383127, -3.095709, 0, 1, 0.8156863, 1,
-0.08437423, 0.2134789, 0.9662111, 0, 1, 0.8196079, 1,
-0.083677, -0.09490936, -3.132614, 0, 1, 0.827451, 1,
-0.08316451, 0.6735224, -0.6899858, 0, 1, 0.8313726, 1,
-0.0828415, 0.3590451, -0.7181578, 0, 1, 0.8392157, 1,
-0.08276381, -1.890474, -2.529333, 0, 1, 0.8431373, 1,
-0.08089162, 0.3078727, 0.5006235, 0, 1, 0.8509804, 1,
-0.07911604, -0.1439698, -1.928982, 0, 1, 0.854902, 1,
-0.07417846, 1.519639, 0.8981185, 0, 1, 0.8627451, 1,
-0.07393842, 0.3004637, -0.6962138, 0, 1, 0.8666667, 1,
-0.07360847, -0.09366766, -3.308559, 0, 1, 0.8745098, 1,
-0.0692763, 0.4419919, -0.2996529, 0, 1, 0.8784314, 1,
-0.05944576, -0.9712132, -2.283706, 0, 1, 0.8862745, 1,
-0.05770813, 0.8330337, -0.6268748, 0, 1, 0.8901961, 1,
-0.05433724, -0.1355622, -3.102005, 0, 1, 0.8980392, 1,
-0.05054221, -0.5961115, -4.165863, 0, 1, 0.9058824, 1,
-0.04948369, -0.9345002, -2.468317, 0, 1, 0.9098039, 1,
-0.04684074, -0.6593685, -1.869822, 0, 1, 0.9176471, 1,
-0.04591573, -1.170964, -3.355818, 0, 1, 0.9215686, 1,
-0.04330456, 0.1505747, -1.558228, 0, 1, 0.9294118, 1,
-0.04284032, 1.079302, 0.3787014, 0, 1, 0.9333333, 1,
-0.04057176, -0.8440868, -2.411087, 0, 1, 0.9411765, 1,
-0.03867255, -1.419812, -2.842492, 0, 1, 0.945098, 1,
-0.03661914, 0.369207, 0.2781018, 0, 1, 0.9529412, 1,
-0.035345, 0.8804905, -0.7503914, 0, 1, 0.9568627, 1,
-0.03208539, -0.7202242, -5.326442, 0, 1, 0.9647059, 1,
-0.03020709, -0.9004925, -0.8701563, 0, 1, 0.9686275, 1,
-0.02832725, 1.204955, 1.065035, 0, 1, 0.9764706, 1,
-0.02388927, 0.6362131, -0.1788615, 0, 1, 0.9803922, 1,
-0.02036576, -0.08581258, -3.368479, 0, 1, 0.9882353, 1,
-0.01907322, -0.6840472, -2.608677, 0, 1, 0.9921569, 1,
-0.01647217, -2.040714, -3.703124, 0, 1, 1, 1,
-0.01644479, -0.1791584, -1.219707, 0, 0.9921569, 1, 1,
-0.01405789, -1.239119, -2.103025, 0, 0.9882353, 1, 1,
-0.009683144, -0.2531276, -1.014851, 0, 0.9803922, 1, 1,
-0.007534954, 0.9065154, -0.7714356, 0, 0.9764706, 1, 1,
-0.005307325, 1.2469, -0.1517078, 0, 0.9686275, 1, 1,
-0.0007585719, 0.04835594, 0.9948903, 0, 0.9647059, 1, 1,
0.004358481, -1.820112, 4.888949, 0, 0.9568627, 1, 1,
0.004533951, -1.10763, 2.238199, 0, 0.9529412, 1, 1,
0.005127385, 0.2120932, 0.2404611, 0, 0.945098, 1, 1,
0.008591729, 0.4890084, 1.529152, 0, 0.9411765, 1, 1,
0.009340401, -0.5904778, 4.087256, 0, 0.9333333, 1, 1,
0.009798912, 0.02243682, -0.8665046, 0, 0.9294118, 1, 1,
0.01046361, 0.2199419, -0.1455231, 0, 0.9215686, 1, 1,
0.01067193, -0.3431945, 2.052713, 0, 0.9176471, 1, 1,
0.01127861, -1.795188, 2.35351, 0, 0.9098039, 1, 1,
0.01133338, 2.629025, 0.7032297, 0, 0.9058824, 1, 1,
0.01220558, -0.6389203, 2.019643, 0, 0.8980392, 1, 1,
0.01222301, -0.5489439, 4.345738, 0, 0.8901961, 1, 1,
0.01356348, -1.358926, 2.316114, 0, 0.8862745, 1, 1,
0.01510894, 1.314704, 0.1504327, 0, 0.8784314, 1, 1,
0.01743416, -0.009910133, 2.980649, 0, 0.8745098, 1, 1,
0.01804489, 0.1234614, 0.3269401, 0, 0.8666667, 1, 1,
0.02579206, -0.6730093, 4.01939, 0, 0.8627451, 1, 1,
0.03760283, -0.8342628, 2.596743, 0, 0.854902, 1, 1,
0.04533399, -0.09003191, 3.697939, 0, 0.8509804, 1, 1,
0.04639972, -1.023573, 3.834924, 0, 0.8431373, 1, 1,
0.05190767, 0.1013626, 0.6986276, 0, 0.8392157, 1, 1,
0.05869931, -0.3042529, 3.642419, 0, 0.8313726, 1, 1,
0.06274379, 0.1145619, 0.651342, 0, 0.827451, 1, 1,
0.06932507, 0.1469742, 0.3899284, 0, 0.8196079, 1, 1,
0.07228202, 1.812358, 0.01752057, 0, 0.8156863, 1, 1,
0.07603125, 0.009103879, 1.767288, 0, 0.8078431, 1, 1,
0.0764645, -0.5668931, 0.4251654, 0, 0.8039216, 1, 1,
0.07904562, 1.775928, 0.1621765, 0, 0.7960784, 1, 1,
0.0835102, 0.195556, 0.2872483, 0, 0.7882353, 1, 1,
0.08650354, -0.3511961, 2.054066, 0, 0.7843137, 1, 1,
0.0868884, 0.8837107, -0.4801228, 0, 0.7764706, 1, 1,
0.09391417, 0.4684578, -2.523797, 0, 0.772549, 1, 1,
0.09692378, 0.5943102, 0.07315145, 0, 0.7647059, 1, 1,
0.105575, 0.1109699, -0.1617695, 0, 0.7607843, 1, 1,
0.1059036, -1.14216, 2.883592, 0, 0.7529412, 1, 1,
0.1065301, -1.730743, 3.121303, 0, 0.7490196, 1, 1,
0.1098053, -1.787805, 4.892068, 0, 0.7411765, 1, 1,
0.1105602, 1.023717, 0.03302618, 0, 0.7372549, 1, 1,
0.1106317, 0.5399752, 2.651979, 0, 0.7294118, 1, 1,
0.113576, -0.126586, 2.197781, 0, 0.7254902, 1, 1,
0.1192549, -0.5203567, 3.900279, 0, 0.7176471, 1, 1,
0.1218761, -0.1595762, 3.739681, 0, 0.7137255, 1, 1,
0.1270517, -1.160277, 3.387247, 0, 0.7058824, 1, 1,
0.1270863, 0.2471429, 0.963571, 0, 0.6980392, 1, 1,
0.1303495, -1.030549, 2.762783, 0, 0.6941177, 1, 1,
0.1327777, 0.3257725, 1.172358, 0, 0.6862745, 1, 1,
0.1378781, 0.2696654, -0.8745363, 0, 0.682353, 1, 1,
0.1389917, 0.06482895, 0.6489841, 0, 0.6745098, 1, 1,
0.1399748, 1.512154, -0.02483498, 0, 0.6705883, 1, 1,
0.144773, 0.2639257, 0.3021348, 0, 0.6627451, 1, 1,
0.1474366, 0.07979289, 1.165626, 0, 0.6588235, 1, 1,
0.1485669, 0.987972, 0.4665347, 0, 0.6509804, 1, 1,
0.1510637, 1.935624, 0.07861039, 0, 0.6470588, 1, 1,
0.1569175, -0.4511415, 2.646521, 0, 0.6392157, 1, 1,
0.158784, 1.225956, 0.3854493, 0, 0.6352941, 1, 1,
0.1639255, -1.078256, 2.303989, 0, 0.627451, 1, 1,
0.1641904, 0.7994072, 2.537895, 0, 0.6235294, 1, 1,
0.1652287, 0.1421734, 1.291789, 0, 0.6156863, 1, 1,
0.1661034, 1.200927, -1.111238, 0, 0.6117647, 1, 1,
0.1688466, -0.8563205, 1.357902, 0, 0.6039216, 1, 1,
0.1704035, -0.01105286, 0.2303442, 0, 0.5960785, 1, 1,
0.1739088, 2.3472, 1.239225, 0, 0.5921569, 1, 1,
0.1751105, 1.405263, 0.545848, 0, 0.5843138, 1, 1,
0.1755333, 0.4592042, 2.53098, 0, 0.5803922, 1, 1,
0.1778318, -0.1230536, 3.005545, 0, 0.572549, 1, 1,
0.1823028, 0.3664456, -1.063015, 0, 0.5686275, 1, 1,
0.1832124, -1.071826, 2.979568, 0, 0.5607843, 1, 1,
0.1845134, 0.003618223, 1.631658, 0, 0.5568628, 1, 1,
0.1846001, 0.4659992, -0.9478663, 0, 0.5490196, 1, 1,
0.190272, -0.2510269, 4.057661, 0, 0.5450981, 1, 1,
0.1937209, 0.4188143, 0.7347067, 0, 0.5372549, 1, 1,
0.1938943, 1.782352, 0.2964061, 0, 0.5333334, 1, 1,
0.1960945, 0.3735195, 0.877816, 0, 0.5254902, 1, 1,
0.1988479, -0.2168289, 1.762649, 0, 0.5215687, 1, 1,
0.1988867, 0.5606458, -0.7158652, 0, 0.5137255, 1, 1,
0.1999721, 0.811853, -0.3518073, 0, 0.509804, 1, 1,
0.2014248, -1.417983, 3.599825, 0, 0.5019608, 1, 1,
0.2036052, -1.496991, 1.732619, 0, 0.4941176, 1, 1,
0.2067689, -0.6604626, 2.513373, 0, 0.4901961, 1, 1,
0.207813, -0.1599488, 1.539268, 0, 0.4823529, 1, 1,
0.2099007, -0.0005202015, -0.06676751, 0, 0.4784314, 1, 1,
0.2134449, 0.5384684, -0.05788569, 0, 0.4705882, 1, 1,
0.2159054, 0.03604711, 0.8910003, 0, 0.4666667, 1, 1,
0.2189093, -1.163716, 3.358181, 0, 0.4588235, 1, 1,
0.2196198, 0.04559472, 1.478831, 0, 0.454902, 1, 1,
0.2268051, 0.4640737, 0.2124255, 0, 0.4470588, 1, 1,
0.2299674, -0.677505, 2.472633, 0, 0.4431373, 1, 1,
0.2388244, 0.4437044, -0.8601425, 0, 0.4352941, 1, 1,
0.2451187, 0.1371295, 0.6562624, 0, 0.4313726, 1, 1,
0.253529, -0.8310239, 4.244177, 0, 0.4235294, 1, 1,
0.2537732, -0.5965919, 3.014449, 0, 0.4196078, 1, 1,
0.2553625, -0.8987824, 2.062729, 0, 0.4117647, 1, 1,
0.2558582, 2.154819, 0.8463042, 0, 0.4078431, 1, 1,
0.2563328, -0.3441984, 1.966125, 0, 0.4, 1, 1,
0.2575608, 0.2832541, 0.2301206, 0, 0.3921569, 1, 1,
0.2622892, 0.6373525, 0.6473703, 0, 0.3882353, 1, 1,
0.2649141, 0.4290337, 0.5781371, 0, 0.3803922, 1, 1,
0.2683371, -2.507848, 3.814577, 0, 0.3764706, 1, 1,
0.2829688, 0.6148777, 1.514234, 0, 0.3686275, 1, 1,
0.2876061, -2.928649, 3.210237, 0, 0.3647059, 1, 1,
0.2883781, 0.1596368, -0.03364562, 0, 0.3568628, 1, 1,
0.2907302, 1.376685, -0.1749876, 0, 0.3529412, 1, 1,
0.2909416, 0.1665549, 1.635892, 0, 0.345098, 1, 1,
0.2952986, 0.329329, 2.357168, 0, 0.3411765, 1, 1,
0.2957939, 1.806091, 0.906084, 0, 0.3333333, 1, 1,
0.2970449, 0.5492267, 1.593588, 0, 0.3294118, 1, 1,
0.2973008, -0.6811219, 2.638208, 0, 0.3215686, 1, 1,
0.2994964, -2.346027, 4.377728, 0, 0.3176471, 1, 1,
0.3013481, -0.3275141, 1.947955, 0, 0.3098039, 1, 1,
0.3023384, -0.1083899, 0.3605338, 0, 0.3058824, 1, 1,
0.3032977, -0.07798411, 1.624852, 0, 0.2980392, 1, 1,
0.313598, -0.3123828, 0.08848015, 0, 0.2901961, 1, 1,
0.3142779, -0.3807002, 1.838615, 0, 0.2862745, 1, 1,
0.3147363, 0.8973796, 0.5347566, 0, 0.2784314, 1, 1,
0.3174286, 1.501151, -0.1707102, 0, 0.2745098, 1, 1,
0.3181607, -0.983382, 2.019098, 0, 0.2666667, 1, 1,
0.3186074, 1.233148, -0.5775337, 0, 0.2627451, 1, 1,
0.3207455, -0.2896428, 3.060282, 0, 0.254902, 1, 1,
0.3224684, -0.680052, 1.710707, 0, 0.2509804, 1, 1,
0.3245173, -1.871101, 2.729796, 0, 0.2431373, 1, 1,
0.3260188, -1.132862, 2.717847, 0, 0.2392157, 1, 1,
0.3269704, -0.2040784, 0.5775849, 0, 0.2313726, 1, 1,
0.3287737, -1.472665, 3.108502, 0, 0.227451, 1, 1,
0.3292775, 1.456077, -0.2255078, 0, 0.2196078, 1, 1,
0.3297099, -0.06159714, 2.350311, 0, 0.2156863, 1, 1,
0.3319716, -1.659374, 2.235018, 0, 0.2078431, 1, 1,
0.3319782, 0.2538762, 0.4185915, 0, 0.2039216, 1, 1,
0.332223, -0.6164295, 1.9625, 0, 0.1960784, 1, 1,
0.3328875, 0.5584074, 0.1499459, 0, 0.1882353, 1, 1,
0.3473107, -1.097784, 3.191139, 0, 0.1843137, 1, 1,
0.3476745, 2.494078, -0.3180105, 0, 0.1764706, 1, 1,
0.3490678, -0.4005141, 0.4124901, 0, 0.172549, 1, 1,
0.3491177, -0.5531915, 1.957057, 0, 0.1647059, 1, 1,
0.352822, -0.3025365, 1.302651, 0, 0.1607843, 1, 1,
0.3568831, -2.212565, 3.013462, 0, 0.1529412, 1, 1,
0.3606008, -2.72732, 1.569625, 0, 0.1490196, 1, 1,
0.3629451, 0.6151388, 0.9642251, 0, 0.1411765, 1, 1,
0.3637736, 0.1410319, 0.3445467, 0, 0.1372549, 1, 1,
0.364477, 0.6309257, -1.06475, 0, 0.1294118, 1, 1,
0.3688793, 0.1974581, -1.235598, 0, 0.1254902, 1, 1,
0.37044, -0.3174778, 2.162726, 0, 0.1176471, 1, 1,
0.3730108, 1.185833, -1.104393, 0, 0.1137255, 1, 1,
0.3766441, -0.4453332, 0.8111635, 0, 0.1058824, 1, 1,
0.3780215, 0.7846339, -2.920997, 0, 0.09803922, 1, 1,
0.3809861, 1.269868, 0.0929804, 0, 0.09411765, 1, 1,
0.3812395, 0.6098326, -0.1178733, 0, 0.08627451, 1, 1,
0.3838789, -0.5716494, 2.603624, 0, 0.08235294, 1, 1,
0.384887, 0.6302147, 0.03352199, 0, 0.07450981, 1, 1,
0.3858061, 0.6981806, -2.033467, 0, 0.07058824, 1, 1,
0.3885232, 1.191205, -0.970969, 0, 0.0627451, 1, 1,
0.3916732, -0.3609623, 1.831567, 0, 0.05882353, 1, 1,
0.393001, 0.08444874, 2.378818, 0, 0.05098039, 1, 1,
0.3934441, 0.1941111, 0.1081492, 0, 0.04705882, 1, 1,
0.3947594, 1.087885, 0.6108847, 0, 0.03921569, 1, 1,
0.3959644, -0.2163925, 0.6541911, 0, 0.03529412, 1, 1,
0.3969315, -0.4034063, 2.678108, 0, 0.02745098, 1, 1,
0.3975968, 0.6985137, -0.4697012, 0, 0.02352941, 1, 1,
0.4089428, 1.507988, -0.07880722, 0, 0.01568628, 1, 1,
0.4089881, 0.08322734, 1.648692, 0, 0.01176471, 1, 1,
0.4183209, 0.09121999, 0.09576795, 0, 0.003921569, 1, 1,
0.4185898, 1.271839, -0.5332109, 0.003921569, 0, 1, 1,
0.4233677, 0.8559492, -0.8704158, 0.007843138, 0, 1, 1,
0.4247564, 0.3296219, 1.853304, 0.01568628, 0, 1, 1,
0.4254065, -1.209504, 0.448029, 0.01960784, 0, 1, 1,
0.425494, 0.3778444, 0.07002349, 0.02745098, 0, 1, 1,
0.4281312, 0.0492411, 1.371022, 0.03137255, 0, 1, 1,
0.439182, 0.6572933, 0.0006394939, 0.03921569, 0, 1, 1,
0.4418713, -2.253099, 2.043925, 0.04313726, 0, 1, 1,
0.4471921, -0.8834467, 2.68668, 0.05098039, 0, 1, 1,
0.4476512, 2.788577, -0.9905772, 0.05490196, 0, 1, 1,
0.4482584, 1.430441, 0.9452655, 0.0627451, 0, 1, 1,
0.4488772, 2.232532, 0.7870296, 0.06666667, 0, 1, 1,
0.4490885, 0.2943601, -0.3800929, 0.07450981, 0, 1, 1,
0.4491184, -0.8365538, 3.176563, 0.07843138, 0, 1, 1,
0.4529158, 2.129663, 0.6181085, 0.08627451, 0, 1, 1,
0.457317, -2.87631, 2.35007, 0.09019608, 0, 1, 1,
0.4588676, -0.4521604, 2.951439, 0.09803922, 0, 1, 1,
0.4608483, -0.4535926, 1.87705, 0.1058824, 0, 1, 1,
0.46714, 2.02597, 0.1850577, 0.1098039, 0, 1, 1,
0.4675196, 0.9588428, -0.2550662, 0.1176471, 0, 1, 1,
0.4755897, 2.869735, 0.9464109, 0.1215686, 0, 1, 1,
0.4776671, -0.4310663, 2.804856, 0.1294118, 0, 1, 1,
0.481728, 1.536054, 1.871797, 0.1333333, 0, 1, 1,
0.4821191, -0.2192009, 1.100514, 0.1411765, 0, 1, 1,
0.4837323, 0.3746803, 1.519739, 0.145098, 0, 1, 1,
0.495729, -0.4754441, 1.110855, 0.1529412, 0, 1, 1,
0.4968454, -0.279363, 0.8432084, 0.1568628, 0, 1, 1,
0.4979655, -1.766038, 3.239402, 0.1647059, 0, 1, 1,
0.4984938, -0.5001407, 2.523473, 0.1686275, 0, 1, 1,
0.5004457, 0.3916245, 1.525346, 0.1764706, 0, 1, 1,
0.5021341, 0.8097919, -0.5075455, 0.1803922, 0, 1, 1,
0.5033396, 0.4974528, 0.2374139, 0.1882353, 0, 1, 1,
0.5108, 0.05982722, 0.07973319, 0.1921569, 0, 1, 1,
0.5265702, 1.01385, 0.1111, 0.2, 0, 1, 1,
0.5332878, -0.1506391, 2.317955, 0.2078431, 0, 1, 1,
0.5343906, 0.2505218, 0.6788705, 0.2117647, 0, 1, 1,
0.5494072, 0.3383124, -0.05957058, 0.2196078, 0, 1, 1,
0.5549484, 0.2920553, 2.34207, 0.2235294, 0, 1, 1,
0.5616669, -0.4218348, 1.09191, 0.2313726, 0, 1, 1,
0.5637007, 1.171827, 0.5255502, 0.2352941, 0, 1, 1,
0.565143, 0.8908312, 0.7281584, 0.2431373, 0, 1, 1,
0.574106, 0.01169413, 0.5316408, 0.2470588, 0, 1, 1,
0.5754914, -0.9456189, 2.691464, 0.254902, 0, 1, 1,
0.5794798, 1.041888, 2.956717, 0.2588235, 0, 1, 1,
0.5808454, -0.3448352, 2.845934, 0.2666667, 0, 1, 1,
0.5831478, -1.256776, 3.605839, 0.2705882, 0, 1, 1,
0.5834476, -0.06735084, 1.97735, 0.2784314, 0, 1, 1,
0.5875453, 0.9518765, 1.234735, 0.282353, 0, 1, 1,
0.5904703, 0.6933095, 1.212296, 0.2901961, 0, 1, 1,
0.5938523, 0.6321784, 0.1081489, 0.2941177, 0, 1, 1,
0.5981891, -1.132981, 3.018805, 0.3019608, 0, 1, 1,
0.5998408, 0.1857786, 0.5541641, 0.3098039, 0, 1, 1,
0.6008511, 0.4307712, 0.7039861, 0.3137255, 0, 1, 1,
0.6009461, 0.2292172, 1.104734, 0.3215686, 0, 1, 1,
0.6060855, 0.3281699, 1.708569, 0.3254902, 0, 1, 1,
0.6079524, 1.704383, 2.210614, 0.3333333, 0, 1, 1,
0.6135483, 0.642187, 2.232291, 0.3372549, 0, 1, 1,
0.6137947, 1.020155, -0.000776513, 0.345098, 0, 1, 1,
0.613971, -1.617183, 3.700125, 0.3490196, 0, 1, 1,
0.6146297, 1.731797, -1.187924, 0.3568628, 0, 1, 1,
0.6174862, 0.900174, -0.9029577, 0.3607843, 0, 1, 1,
0.6219099, 0.4422266, 2.321476, 0.3686275, 0, 1, 1,
0.6250123, -0.4415142, 2.310836, 0.372549, 0, 1, 1,
0.6295535, -0.129979, 3.824291, 0.3803922, 0, 1, 1,
0.6313994, -1.651782, 2.341511, 0.3843137, 0, 1, 1,
0.6409991, -0.804943, 3.079995, 0.3921569, 0, 1, 1,
0.6410495, -1.01371, 2.272739, 0.3960784, 0, 1, 1,
0.6483915, -1.067564, 4.229989, 0.4039216, 0, 1, 1,
0.6521055, -2.095851, 3.148617, 0.4117647, 0, 1, 1,
0.6530107, 0.1716776, 2.005321, 0.4156863, 0, 1, 1,
0.6550485, -1.098414, 2.036216, 0.4235294, 0, 1, 1,
0.6553599, 0.8634552, 0.7416834, 0.427451, 0, 1, 1,
0.6595596, -1.229273, 2.767369, 0.4352941, 0, 1, 1,
0.659655, 0.1279824, 3.105553, 0.4392157, 0, 1, 1,
0.6596604, -0.8708698, 2.044775, 0.4470588, 0, 1, 1,
0.6612695, -1.640158, 4.006649, 0.4509804, 0, 1, 1,
0.6618721, -0.849207, 1.456268, 0.4588235, 0, 1, 1,
0.6631259, -0.2550669, 1.710398, 0.4627451, 0, 1, 1,
0.6678337, -0.37091, 2.032572, 0.4705882, 0, 1, 1,
0.682726, 0.1761643, 2.331742, 0.4745098, 0, 1, 1,
0.6896896, 0.6257951, 0.2203306, 0.4823529, 0, 1, 1,
0.6975442, 1.752635, -0.1373789, 0.4862745, 0, 1, 1,
0.7004448, -1.795305, 3.907899, 0.4941176, 0, 1, 1,
0.7054405, -1.095451, 1.648423, 0.5019608, 0, 1, 1,
0.7072976, 0.2227903, 3.705647, 0.5058824, 0, 1, 1,
0.7078872, 0.4808814, 0.6870384, 0.5137255, 0, 1, 1,
0.7082647, -0.7294994, 1.645303, 0.5176471, 0, 1, 1,
0.7090766, 0.4570159, 0.3604078, 0.5254902, 0, 1, 1,
0.7230945, -0.3274372, 2.11869, 0.5294118, 0, 1, 1,
0.7265114, -0.4805333, 2.854064, 0.5372549, 0, 1, 1,
0.7299974, -0.1116417, 0.1624222, 0.5411765, 0, 1, 1,
0.7325815, 1.23175, -0.1482532, 0.5490196, 0, 1, 1,
0.7335348, -0.6926509, 2.568921, 0.5529412, 0, 1, 1,
0.7348258, -1.227363, 3.655437, 0.5607843, 0, 1, 1,
0.7385103, -0.1421498, 0.6676458, 0.5647059, 0, 1, 1,
0.7394005, -0.3030403, 1.403721, 0.572549, 0, 1, 1,
0.742541, 0.2350352, 0.501295, 0.5764706, 0, 1, 1,
0.745582, 0.7204506, -0.2140972, 0.5843138, 0, 1, 1,
0.7472101, 1.174991, 0.195364, 0.5882353, 0, 1, 1,
0.7473344, -0.3363287, 2.932125, 0.5960785, 0, 1, 1,
0.7546672, -1.456113, 3.467324, 0.6039216, 0, 1, 1,
0.756259, -0.591414, 1.449525, 0.6078432, 0, 1, 1,
0.7573124, -1.766321, 2.754218, 0.6156863, 0, 1, 1,
0.7622926, -0.6629958, 3.049178, 0.6196079, 0, 1, 1,
0.7652438, -0.1138836, 2.157011, 0.627451, 0, 1, 1,
0.7657796, 1.108479, 2.396734, 0.6313726, 0, 1, 1,
0.7708317, 0.7238923, 0.3749653, 0.6392157, 0, 1, 1,
0.7760864, -1.64039, 1.697729, 0.6431373, 0, 1, 1,
0.7784706, -0.7343629, 2.274412, 0.6509804, 0, 1, 1,
0.7805432, -0.2395805, 2.233085, 0.654902, 0, 1, 1,
0.7817183, -0.8127732, 2.452961, 0.6627451, 0, 1, 1,
0.7823284, -0.1797549, 3.627303, 0.6666667, 0, 1, 1,
0.7847921, -0.7236811, 4.035377, 0.6745098, 0, 1, 1,
0.7848545, -0.003049013, 1.535893, 0.6784314, 0, 1, 1,
0.7863238, -0.9612622, 2.76298, 0.6862745, 0, 1, 1,
0.7880218, -0.8842841, 0.8029295, 0.6901961, 0, 1, 1,
0.7960039, 0.5509945, 0.6442892, 0.6980392, 0, 1, 1,
0.8046679, -0.3188328, 2.747552, 0.7058824, 0, 1, 1,
0.8075428, 0.7732725, 1.483327, 0.7098039, 0, 1, 1,
0.8105902, 1.077288, 1.383843, 0.7176471, 0, 1, 1,
0.8112106, 0.5320842, -0.7597836, 0.7215686, 0, 1, 1,
0.8154873, 1.78769, 0.08745013, 0.7294118, 0, 1, 1,
0.8242998, 0.7532042, 0.6195492, 0.7333333, 0, 1, 1,
0.8284022, 1.579819, 0.3044847, 0.7411765, 0, 1, 1,
0.8296955, -1.015241, 3.346155, 0.7450981, 0, 1, 1,
0.8331285, 0.4883962, 2.451791, 0.7529412, 0, 1, 1,
0.8334045, 0.8914265, 1.954596, 0.7568628, 0, 1, 1,
0.83719, -0.3210976, 1.573519, 0.7647059, 0, 1, 1,
0.8409323, -0.3580995, 0.4732572, 0.7686275, 0, 1, 1,
0.8453594, -0.06828882, 0.4915198, 0.7764706, 0, 1, 1,
0.8599182, -1.33611, 2.614898, 0.7803922, 0, 1, 1,
0.865239, 0.7637913, 0.9811999, 0.7882353, 0, 1, 1,
0.8771803, 0.469148, -0.1034387, 0.7921569, 0, 1, 1,
0.877838, -0.7389044, 2.354406, 0.8, 0, 1, 1,
0.8787937, -0.4976425, 3.314957, 0.8078431, 0, 1, 1,
0.8793666, -0.02422365, 2.672955, 0.8117647, 0, 1, 1,
0.8808802, 0.242563, 2.113398, 0.8196079, 0, 1, 1,
0.8839053, -0.6494301, 2.148024, 0.8235294, 0, 1, 1,
0.8878819, 0.4765564, 1.643369, 0.8313726, 0, 1, 1,
0.8905086, 0.1201317, 0.1532242, 0.8352941, 0, 1, 1,
0.8971476, 0.8846822, 1.54027, 0.8431373, 0, 1, 1,
0.8972023, -0.9002372, 2.656409, 0.8470588, 0, 1, 1,
0.8997974, -0.05822946, 1.972191, 0.854902, 0, 1, 1,
0.9024155, 1.271893, 0.2279962, 0.8588235, 0, 1, 1,
0.9041629, -0.1774589, 1.719346, 0.8666667, 0, 1, 1,
0.9103374, -0.9236937, 3.120482, 0.8705882, 0, 1, 1,
0.9160079, 0.3038432, -0.1064547, 0.8784314, 0, 1, 1,
0.9200591, -1.175847, 2.966857, 0.8823529, 0, 1, 1,
0.9281496, 0.7437041, 2.012322, 0.8901961, 0, 1, 1,
0.9345381, -0.3376859, 3.009479, 0.8941177, 0, 1, 1,
0.9358522, 0.1820072, 0.5133548, 0.9019608, 0, 1, 1,
0.9378769, -1.193904, 2.95274, 0.9098039, 0, 1, 1,
0.9393909, -0.9177867, 2.316605, 0.9137255, 0, 1, 1,
0.9401987, -0.6326911, 2.214912, 0.9215686, 0, 1, 1,
0.9406095, 0.2937844, -0.2770249, 0.9254902, 0, 1, 1,
0.9409609, 0.3509639, 1.940697, 0.9333333, 0, 1, 1,
0.9416648, -1.66597, 2.077245, 0.9372549, 0, 1, 1,
0.9483249, 2.556469, -0.6263641, 0.945098, 0, 1, 1,
0.949101, 0.1926299, 1.816853, 0.9490196, 0, 1, 1,
0.9759617, -0.6240576, 2.806669, 0.9568627, 0, 1, 1,
0.9775642, -0.750529, 2.183414, 0.9607843, 0, 1, 1,
0.9786879, 0.09765786, 3.627558, 0.9686275, 0, 1, 1,
0.9803476, -0.1211805, 0.8873017, 0.972549, 0, 1, 1,
0.9814739, -0.03358202, 0.05126579, 0.9803922, 0, 1, 1,
0.9844493, 0.4470579, 1.214304, 0.9843137, 0, 1, 1,
0.9936579, -0.2638589, 0.6085333, 0.9921569, 0, 1, 1,
0.996048, 0.08049653, 0.5549001, 0.9960784, 0, 1, 1,
1.00055, 0.2435159, -0.2807339, 1, 0, 0.9960784, 1,
1.011345, 0.13223, -0.1420705, 1, 0, 0.9882353, 1,
1.013703, -0.3866036, 2.904437, 1, 0, 0.9843137, 1,
1.02936, -1.560261, 2.36947, 1, 0, 0.9764706, 1,
1.034347, -0.5643936, 3.639084, 1, 0, 0.972549, 1,
1.034613, -0.3155681, 2.360276, 1, 0, 0.9647059, 1,
1.034894, 0.6989677, 0.9743274, 1, 0, 0.9607843, 1,
1.036364, -0.3171359, 3.00789, 1, 0, 0.9529412, 1,
1.037899, -0.4903408, -0.8169285, 1, 0, 0.9490196, 1,
1.037965, -0.6422973, 3.134244, 1, 0, 0.9411765, 1,
1.041484, -0.3789669, 2.481694, 1, 0, 0.9372549, 1,
1.043327, -0.8159566, 2.11055, 1, 0, 0.9294118, 1,
1.043695, 0.1866617, 1.396253, 1, 0, 0.9254902, 1,
1.046993, -0.4037686, 2.000417, 1, 0, 0.9176471, 1,
1.048058, -1.4457, 3.483978, 1, 0, 0.9137255, 1,
1.049272, -1.573793, 2.679949, 1, 0, 0.9058824, 1,
1.062062, 0.6202379, -0.394636, 1, 0, 0.9019608, 1,
1.068914, 0.0366248, 1.696775, 1, 0, 0.8941177, 1,
1.071819, 1.665082, -0.3338117, 1, 0, 0.8862745, 1,
1.07219, -0.3237112, 1.658035, 1, 0, 0.8823529, 1,
1.073307, 0.8287632, 1.742955, 1, 0, 0.8745098, 1,
1.080757, 0.2946773, 1.285903, 1, 0, 0.8705882, 1,
1.081889, -0.8708245, 1.938809, 1, 0, 0.8627451, 1,
1.083328, 1.015389, -0.3720529, 1, 0, 0.8588235, 1,
1.083483, 1.013064, 1.117536, 1, 0, 0.8509804, 1,
1.088046, 1.134239, 0.1822889, 1, 0, 0.8470588, 1,
1.088075, -0.145381, 1.641496, 1, 0, 0.8392157, 1,
1.088765, 1.941163, 1.075057, 1, 0, 0.8352941, 1,
1.094979, -0.2981402, 0.6781659, 1, 0, 0.827451, 1,
1.099979, 1.066202, -0.4848009, 1, 0, 0.8235294, 1,
1.10326, 1.18564, 0.535313, 1, 0, 0.8156863, 1,
1.106997, -0.6851851, 1.886046, 1, 0, 0.8117647, 1,
1.10702, -0.4467287, 2.244801, 1, 0, 0.8039216, 1,
1.114068, -1.298411, 4.472254, 1, 0, 0.7960784, 1,
1.121639, -0.4660399, 1.559526, 1, 0, 0.7921569, 1,
1.128168, 1.409686, 1.704577, 1, 0, 0.7843137, 1,
1.129481, -0.1376521, 0.4296201, 1, 0, 0.7803922, 1,
1.129487, 0.4113392, 0.05214079, 1, 0, 0.772549, 1,
1.131981, 0.3465602, 1.309041, 1, 0, 0.7686275, 1,
1.136018, 0.6604382, 0.5453079, 1, 0, 0.7607843, 1,
1.1383, -0.05955729, 2.067567, 1, 0, 0.7568628, 1,
1.142167, 0.928422, 1.999387, 1, 0, 0.7490196, 1,
1.151976, -0.7727956, 3.836518, 1, 0, 0.7450981, 1,
1.152785, -2.393725, 4.565732, 1, 0, 0.7372549, 1,
1.15747, 0.5685766, 1.23364, 1, 0, 0.7333333, 1,
1.158729, -0.7893984, 3.040299, 1, 0, 0.7254902, 1,
1.159821, 0.5082077, 1.788715, 1, 0, 0.7215686, 1,
1.170182, 1.249426, 1.181112, 1, 0, 0.7137255, 1,
1.176123, 1.528695, -0.001408142, 1, 0, 0.7098039, 1,
1.177724, 0.4871319, 1.309324, 1, 0, 0.7019608, 1,
1.189106, 0.8627948, 2.023043, 1, 0, 0.6941177, 1,
1.196046, 0.190573, 1.316024, 1, 0, 0.6901961, 1,
1.200674, 1.394639, 1.589067, 1, 0, 0.682353, 1,
1.204613, -0.003460812, 1.789374, 1, 0, 0.6784314, 1,
1.204674, 1.040295, 0.9397959, 1, 0, 0.6705883, 1,
1.207364, -1.223694, 3.140727, 1, 0, 0.6666667, 1,
1.210752, -0.2893468, 1.521562, 1, 0, 0.6588235, 1,
1.212556, 0.9986955, 1.108671, 1, 0, 0.654902, 1,
1.21814, 0.8604808, -0.1772081, 1, 0, 0.6470588, 1,
1.222422, 0.6317248, 1.36495, 1, 0, 0.6431373, 1,
1.223063, 0.01039162, 0.8749011, 1, 0, 0.6352941, 1,
1.230465, -0.0183131, 1.492335, 1, 0, 0.6313726, 1,
1.233362, -0.1807206, 3.454648, 1, 0, 0.6235294, 1,
1.238252, 0.1619551, 1.808466, 1, 0, 0.6196079, 1,
1.241769, -0.4965654, 3.101243, 1, 0, 0.6117647, 1,
1.243018, 0.5003372, 0.4407331, 1, 0, 0.6078432, 1,
1.249046, -2.377184, 1.427621, 1, 0, 0.6, 1,
1.252138, 0.5113844, 0.3371736, 1, 0, 0.5921569, 1,
1.260153, 0.4418501, 2.413679, 1, 0, 0.5882353, 1,
1.263277, -0.05023357, 1.273079, 1, 0, 0.5803922, 1,
1.268022, 0.05551841, 0.86132, 1, 0, 0.5764706, 1,
1.270964, 0.3346377, -0.2809502, 1, 0, 0.5686275, 1,
1.276062, -0.3523902, 1.823089, 1, 0, 0.5647059, 1,
1.278212, -2.050704, 3.55045, 1, 0, 0.5568628, 1,
1.278891, -0.7242445, 3.653363, 1, 0, 0.5529412, 1,
1.285842, 0.6620231, 0.4004693, 1, 0, 0.5450981, 1,
1.292067, 0.2289756, 1.652677, 1, 0, 0.5411765, 1,
1.303859, -0.8206522, 1.383173, 1, 0, 0.5333334, 1,
1.304607, -0.4280155, 3.426207, 1, 0, 0.5294118, 1,
1.310726, 1.458673, 2.109553, 1, 0, 0.5215687, 1,
1.315002, 0.06350592, 1.437921, 1, 0, 0.5176471, 1,
1.319941, 0.7183741, 2.968963, 1, 0, 0.509804, 1,
1.328243, 0.1328271, 2.309331, 1, 0, 0.5058824, 1,
1.332044, 1.026935, 0.8981251, 1, 0, 0.4980392, 1,
1.338304, -0.1284795, 2.639557, 1, 0, 0.4901961, 1,
1.350051, -0.1866476, 0.4341097, 1, 0, 0.4862745, 1,
1.350268, 1.184671, 2.269134, 1, 0, 0.4784314, 1,
1.364223, -1.607899, 1.841129, 1, 0, 0.4745098, 1,
1.375973, -1.348115, 3.58414, 1, 0, 0.4666667, 1,
1.377617, 1.150753, 1.955938, 1, 0, 0.4627451, 1,
1.381935, 1.333299, 1.583194, 1, 0, 0.454902, 1,
1.386083, -1.076552, 0.952149, 1, 0, 0.4509804, 1,
1.386603, 1.782039, 0.005464916, 1, 0, 0.4431373, 1,
1.398205, -0.213109, 2.938512, 1, 0, 0.4392157, 1,
1.399999, 0.862017, 0.9349083, 1, 0, 0.4313726, 1,
1.401924, 0.3475433, 1.374015, 1, 0, 0.427451, 1,
1.413952, -0.161293, 0.4319618, 1, 0, 0.4196078, 1,
1.416255, -0.7730749, 2.099599, 1, 0, 0.4156863, 1,
1.419361, 0.08656336, 1.420063, 1, 0, 0.4078431, 1,
1.444232, 0.3519774, 1.23124, 1, 0, 0.4039216, 1,
1.453157, 0.6435728, -0.05581811, 1, 0, 0.3960784, 1,
1.46473, 1.5216, 0.7244332, 1, 0, 0.3882353, 1,
1.474905, 0.4876031, 2.27473, 1, 0, 0.3843137, 1,
1.493514, 0.5591682, 1.28768, 1, 0, 0.3764706, 1,
1.500033, -0.1856633, 1.364502, 1, 0, 0.372549, 1,
1.501185, -0.4158139, 1.933866, 1, 0, 0.3647059, 1,
1.505981, 0.7509435, 0.05721391, 1, 0, 0.3607843, 1,
1.506837, 1.030312, 2.459389, 1, 0, 0.3529412, 1,
1.507025, 1.310205, 0.9963683, 1, 0, 0.3490196, 1,
1.517535, -0.6303771, 1.645083, 1, 0, 0.3411765, 1,
1.517894, 1.759055, 0.6801364, 1, 0, 0.3372549, 1,
1.528839, -1.070547, 2.49791, 1, 0, 0.3294118, 1,
1.54551, -0.6258038, 2.153411, 1, 0, 0.3254902, 1,
1.57107, 1.272364, -0.05956456, 1, 0, 0.3176471, 1,
1.578959, -2.115309, 2.185464, 1, 0, 0.3137255, 1,
1.587256, -1.546402, 4.507802, 1, 0, 0.3058824, 1,
1.591002, 0.8388578, 1.442448, 1, 0, 0.2980392, 1,
1.594415, -0.1575129, 1.59857, 1, 0, 0.2941177, 1,
1.599551, 0.2595004, 2.430151, 1, 0, 0.2862745, 1,
1.614518, 0.7788208, 1.274011, 1, 0, 0.282353, 1,
1.616833, 0.5790986, 1.457959, 1, 0, 0.2745098, 1,
1.648382, -0.5421016, 1.550703, 1, 0, 0.2705882, 1,
1.649334, 2.210361, 2.599885, 1, 0, 0.2627451, 1,
1.652062, 0.3945825, 0.1384366, 1, 0, 0.2588235, 1,
1.654123, -0.5191558, 1.074799, 1, 0, 0.2509804, 1,
1.660217, -0.6216451, 3.979474, 1, 0, 0.2470588, 1,
1.669212, 1.869548, -0.767984, 1, 0, 0.2392157, 1,
1.699115, -1.116867, -0.6448359, 1, 0, 0.2352941, 1,
1.715498, -0.5927292, 1.759357, 1, 0, 0.227451, 1,
1.724935, -1.8891, 2.843073, 1, 0, 0.2235294, 1,
1.73404, 1.418938, 0.3955893, 1, 0, 0.2156863, 1,
1.754382, -1.207038, 3.4661, 1, 0, 0.2117647, 1,
1.758948, 2.153558, 0.5599018, 1, 0, 0.2039216, 1,
1.781127, 0.4294112, 3.361762, 1, 0, 0.1960784, 1,
1.806249, -0.1457671, 2.337914, 1, 0, 0.1921569, 1,
1.808696, 0.5612584, 1.286992, 1, 0, 0.1843137, 1,
1.81208, -0.3238803, 2.508001, 1, 0, 0.1803922, 1,
1.85832, 0.7379158, 1.36104, 1, 0, 0.172549, 1,
1.878717, 1.580554, 2.842893, 1, 0, 0.1686275, 1,
1.901296, 1.529098, 0.3699214, 1, 0, 0.1607843, 1,
1.918957, 2.730731, 0.4313388, 1, 0, 0.1568628, 1,
1.929321, 0.06992581, 0.4294761, 1, 0, 0.1490196, 1,
1.934854, -0.4989764, 1.622347, 1, 0, 0.145098, 1,
1.980979, -1.439949, 3.071841, 1, 0, 0.1372549, 1,
1.990527, -1.457363, 2.501125, 1, 0, 0.1333333, 1,
2.001104, 0.5295041, 0.6687713, 1, 0, 0.1254902, 1,
2.071449, 1.529954, 1.064908, 1, 0, 0.1215686, 1,
2.074634, -0.9015313, 1.002463, 1, 0, 0.1137255, 1,
2.082961, -0.9302534, 3.178726, 1, 0, 0.1098039, 1,
2.109235, 0.9328336, 2.272277, 1, 0, 0.1019608, 1,
2.124915, 1.357402, 0.6581382, 1, 0, 0.09411765, 1,
2.144643, 1.115789, 1.096023, 1, 0, 0.09019608, 1,
2.158072, -0.4385857, 2.686133, 1, 0, 0.08235294, 1,
2.161514, -1.147595, 1.793844, 1, 0, 0.07843138, 1,
2.18968, -1.170639, 2.371435, 1, 0, 0.07058824, 1,
2.199202, -0.2255673, 2.860408, 1, 0, 0.06666667, 1,
2.204714, -0.367585, 2.215738, 1, 0, 0.05882353, 1,
2.259202, 0.1366611, 1.224543, 1, 0, 0.05490196, 1,
2.313093, -0.0216702, 2.251392, 1, 0, 0.04705882, 1,
2.340463, 1.479504, 2.181396, 1, 0, 0.04313726, 1,
2.362139, 1.352856, 0.9470664, 1, 0, 0.03529412, 1,
2.500273, -0.7059512, 2.515776, 1, 0, 0.03137255, 1,
2.506199, -0.3997189, 1.904821, 1, 0, 0.02352941, 1,
2.698496, -0.03503596, 2.207909, 1, 0, 0.01960784, 1,
2.758321, 2.29099, 0.1899247, 1, 0, 0.01176471, 1,
2.795309, -0.0450655, 1.109428, 1, 0, 0.007843138, 1
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
-0.07037127, -3.911475, -7.073602, 0, -0.5, 0.5, 0.5,
-0.07037127, -3.911475, -7.073602, 1, -0.5, 0.5, 0.5,
-0.07037127, -3.911475, -7.073602, 1, 1.5, 0.5, 0.5,
-0.07037127, -3.911475, -7.073602, 0, 1.5, 0.5, 0.5
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
-3.907517, -0.02945685, -7.073602, 0, -0.5, 0.5, 0.5,
-3.907517, -0.02945685, -7.073602, 1, -0.5, 0.5, 0.5,
-3.907517, -0.02945685, -7.073602, 1, 1.5, 0.5, 0.5,
-3.907517, -0.02945685, -7.073602, 0, 1.5, 0.5, 0.5
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
-3.907517, -3.911475, -0.2236526, 0, -0.5, 0.5, 0.5,
-3.907517, -3.911475, -0.2236526, 1, -0.5, 0.5, 0.5,
-3.907517, -3.911475, -0.2236526, 1, 1.5, 0.5, 0.5,
-3.907517, -3.911475, -0.2236526, 0, 1.5, 0.5, 0.5
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
-2, -3.015625, -5.492845,
2, -3.015625, -5.492845,
-2, -3.015625, -5.492845,
-2, -3.164933, -5.756304,
-1, -3.015625, -5.492845,
-1, -3.164933, -5.756304,
0, -3.015625, -5.492845,
0, -3.164933, -5.756304,
1, -3.015625, -5.492845,
1, -3.164933, -5.756304,
2, -3.015625, -5.492845,
2, -3.164933, -5.756304
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
-2, -3.46355, -6.283224, 0, -0.5, 0.5, 0.5,
-2, -3.46355, -6.283224, 1, -0.5, 0.5, 0.5,
-2, -3.46355, -6.283224, 1, 1.5, 0.5, 0.5,
-2, -3.46355, -6.283224, 0, 1.5, 0.5, 0.5,
-1, -3.46355, -6.283224, 0, -0.5, 0.5, 0.5,
-1, -3.46355, -6.283224, 1, -0.5, 0.5, 0.5,
-1, -3.46355, -6.283224, 1, 1.5, 0.5, 0.5,
-1, -3.46355, -6.283224, 0, 1.5, 0.5, 0.5,
0, -3.46355, -6.283224, 0, -0.5, 0.5, 0.5,
0, -3.46355, -6.283224, 1, -0.5, 0.5, 0.5,
0, -3.46355, -6.283224, 1, 1.5, 0.5, 0.5,
0, -3.46355, -6.283224, 0, 1.5, 0.5, 0.5,
1, -3.46355, -6.283224, 0, -0.5, 0.5, 0.5,
1, -3.46355, -6.283224, 1, -0.5, 0.5, 0.5,
1, -3.46355, -6.283224, 1, 1.5, 0.5, 0.5,
1, -3.46355, -6.283224, 0, 1.5, 0.5, 0.5,
2, -3.46355, -6.283224, 0, -0.5, 0.5, 0.5,
2, -3.46355, -6.283224, 1, -0.5, 0.5, 0.5,
2, -3.46355, -6.283224, 1, 1.5, 0.5, 0.5,
2, -3.46355, -6.283224, 0, 1.5, 0.5, 0.5
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
-3.022022, -2, -5.492845,
-3.022022, 2, -5.492845,
-3.022022, -2, -5.492845,
-3.169604, -2, -5.756304,
-3.022022, -1, -5.492845,
-3.169604, -1, -5.756304,
-3.022022, 0, -5.492845,
-3.169604, 0, -5.756304,
-3.022022, 1, -5.492845,
-3.169604, 1, -5.756304,
-3.022022, 2, -5.492845,
-3.169604, 2, -5.756304
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
-3.464769, -2, -6.283224, 0, -0.5, 0.5, 0.5,
-3.464769, -2, -6.283224, 1, -0.5, 0.5, 0.5,
-3.464769, -2, -6.283224, 1, 1.5, 0.5, 0.5,
-3.464769, -2, -6.283224, 0, 1.5, 0.5, 0.5,
-3.464769, -1, -6.283224, 0, -0.5, 0.5, 0.5,
-3.464769, -1, -6.283224, 1, -0.5, 0.5, 0.5,
-3.464769, -1, -6.283224, 1, 1.5, 0.5, 0.5,
-3.464769, -1, -6.283224, 0, 1.5, 0.5, 0.5,
-3.464769, 0, -6.283224, 0, -0.5, 0.5, 0.5,
-3.464769, 0, -6.283224, 1, -0.5, 0.5, 0.5,
-3.464769, 0, -6.283224, 1, 1.5, 0.5, 0.5,
-3.464769, 0, -6.283224, 0, 1.5, 0.5, 0.5,
-3.464769, 1, -6.283224, 0, -0.5, 0.5, 0.5,
-3.464769, 1, -6.283224, 1, -0.5, 0.5, 0.5,
-3.464769, 1, -6.283224, 1, 1.5, 0.5, 0.5,
-3.464769, 1, -6.283224, 0, 1.5, 0.5, 0.5,
-3.464769, 2, -6.283224, 0, -0.5, 0.5, 0.5,
-3.464769, 2, -6.283224, 1, -0.5, 0.5, 0.5,
-3.464769, 2, -6.283224, 1, 1.5, 0.5, 0.5,
-3.464769, 2, -6.283224, 0, 1.5, 0.5, 0.5
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
-3.022022, -3.015625, -4,
-3.022022, -3.015625, 4,
-3.022022, -3.015625, -4,
-3.169604, -3.164933, -4,
-3.022022, -3.015625, -2,
-3.169604, -3.164933, -2,
-3.022022, -3.015625, 0,
-3.169604, -3.164933, 0,
-3.022022, -3.015625, 2,
-3.169604, -3.164933, 2,
-3.022022, -3.015625, 4,
-3.169604, -3.164933, 4
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
-3.464769, -3.46355, -4, 0, -0.5, 0.5, 0.5,
-3.464769, -3.46355, -4, 1, -0.5, 0.5, 0.5,
-3.464769, -3.46355, -4, 1, 1.5, 0.5, 0.5,
-3.464769, -3.46355, -4, 0, 1.5, 0.5, 0.5,
-3.464769, -3.46355, -2, 0, -0.5, 0.5, 0.5,
-3.464769, -3.46355, -2, 1, -0.5, 0.5, 0.5,
-3.464769, -3.46355, -2, 1, 1.5, 0.5, 0.5,
-3.464769, -3.46355, -2, 0, 1.5, 0.5, 0.5,
-3.464769, -3.46355, 0, 0, -0.5, 0.5, 0.5,
-3.464769, -3.46355, 0, 1, -0.5, 0.5, 0.5,
-3.464769, -3.46355, 0, 1, 1.5, 0.5, 0.5,
-3.464769, -3.46355, 0, 0, 1.5, 0.5, 0.5,
-3.464769, -3.46355, 2, 0, -0.5, 0.5, 0.5,
-3.464769, -3.46355, 2, 1, -0.5, 0.5, 0.5,
-3.464769, -3.46355, 2, 1, 1.5, 0.5, 0.5,
-3.464769, -3.46355, 2, 0, 1.5, 0.5, 0.5,
-3.464769, -3.46355, 4, 0, -0.5, 0.5, 0.5,
-3.464769, -3.46355, 4, 1, -0.5, 0.5, 0.5,
-3.464769, -3.46355, 4, 1, 1.5, 0.5, 0.5,
-3.464769, -3.46355, 4, 0, 1.5, 0.5, 0.5
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
-3.022022, -3.015625, -5.492845,
-3.022022, 2.956711, -5.492845,
-3.022022, -3.015625, 5.045539,
-3.022022, 2.956711, 5.045539,
-3.022022, -3.015625, -5.492845,
-3.022022, -3.015625, 5.045539,
-3.022022, 2.956711, -5.492845,
-3.022022, 2.956711, 5.045539,
-3.022022, -3.015625, -5.492845,
2.881279, -3.015625, -5.492845,
-3.022022, -3.015625, 5.045539,
2.881279, -3.015625, 5.045539,
-3.022022, 2.956711, -5.492845,
2.881279, 2.956711, -5.492845,
-3.022022, 2.956711, 5.045539,
2.881279, 2.956711, 5.045539,
2.881279, -3.015625, -5.492845,
2.881279, 2.956711, -5.492845,
2.881279, -3.015625, 5.045539,
2.881279, 2.956711, 5.045539,
2.881279, -3.015625, -5.492845,
2.881279, -3.015625, 5.045539,
2.881279, 2.956711, -5.492845,
2.881279, 2.956711, 5.045539
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
var radius = 7.195382;
var distance = 32.01307;
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
mvMatrix.translate( 0.07037127, 0.02945685, 0.2236526 );
mvMatrix.scale( 1.317871, 1.302637, 0.7382334 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.01307);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
chlozolinate<-read.table("chlozolinate.xyz")
```

```
## Error in read.table("chlozolinate.xyz"): no lines available in input
```

```r
x<-chlozolinate$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlozolinate' not found
```

```r
y<-chlozolinate$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlozolinate' not found
```

```r
z<-chlozolinate$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlozolinate' not found
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
-2.936051, -0.9195715, -1.254752, 0, 0, 1, 1, 1,
-2.722112, -1.027343, -2.06488, 1, 0, 0, 1, 1,
-2.702558, -0.3462382, -0.07934181, 1, 0, 0, 1, 1,
-2.651771, 0.3080578, -1.91909, 1, 0, 0, 1, 1,
-2.489931, -0.5938043, -1.883688, 1, 0, 0, 1, 1,
-2.457332, -0.1894728, -2.664543, 1, 0, 0, 1, 1,
-2.41035, -0.1669585, -1.745919, 0, 0, 0, 1, 1,
-2.368841, 1.32502, 0.05329124, 0, 0, 0, 1, 1,
-2.351001, 0.06707111, 1.036566, 0, 0, 0, 1, 1,
-2.33226, -0.8801499, -1.011212, 0, 0, 0, 1, 1,
-2.327243, 1.505166, -0.6876869, 0, 0, 0, 1, 1,
-2.317152, 1.229731, -0.9871903, 0, 0, 0, 1, 1,
-2.28291, 0.2441643, -0.4083074, 0, 0, 0, 1, 1,
-2.264461, 0.1023125, -1.350379, 1, 1, 1, 1, 1,
-2.258703, -0.8527607, -2.25011, 1, 1, 1, 1, 1,
-2.24563, 0.3432519, -4.475724, 1, 1, 1, 1, 1,
-2.183589, 0.06075556, -1.528329, 1, 1, 1, 1, 1,
-2.155782, 0.3661338, 0.807886, 1, 1, 1, 1, 1,
-2.154721, 0.1394619, -1.882175, 1, 1, 1, 1, 1,
-2.139254, -0.6480573, -1.826375, 1, 1, 1, 1, 1,
-2.133856, 0.4921758, -1.86632, 1, 1, 1, 1, 1,
-2.119429, -0.1417838, -1.691144, 1, 1, 1, 1, 1,
-2.087062, -0.7043598, -1.065267, 1, 1, 1, 1, 1,
-2.047298, 1.359591, -1.520536, 1, 1, 1, 1, 1,
-2.007796, -0.6019862, -1.805548, 1, 1, 1, 1, 1,
-2.001341, -1.185296, -3.131227, 1, 1, 1, 1, 1,
-1.997006, -1.443269, -3.447619, 1, 1, 1, 1, 1,
-1.989594, 0.4693668, -1.802626, 1, 1, 1, 1, 1,
-1.983237, 1.058291, -0.8506497, 0, 0, 1, 1, 1,
-1.98194, 1.320814, -0.1703675, 1, 0, 0, 1, 1,
-1.980294, -1.449268, -2.839063, 1, 0, 0, 1, 1,
-1.967244, -0.1059333, -3.325261, 1, 0, 0, 1, 1,
-1.953195, 0.06991374, -0.5011738, 1, 0, 0, 1, 1,
-1.95257, 1.966818, -2.569317, 1, 0, 0, 1, 1,
-1.943107, -0.4052248, -2.44748, 0, 0, 0, 1, 1,
-1.905136, 0.2633084, -1.355193, 0, 0, 0, 1, 1,
-1.899174, -0.1783515, -1.79883, 0, 0, 0, 1, 1,
-1.892052, 1.793165, -0.5153854, 0, 0, 0, 1, 1,
-1.889384, -0.4620924, -1.900848, 0, 0, 0, 1, 1,
-1.865921, -0.09097677, -1.869962, 0, 0, 0, 1, 1,
-1.86493, -0.3016661, -1.002038, 0, 0, 0, 1, 1,
-1.845942, 0.2558834, -3.412178, 1, 1, 1, 1, 1,
-1.810478, -1.170618, -3.413303, 1, 1, 1, 1, 1,
-1.786344, 0.5696346, -0.0489146, 1, 1, 1, 1, 1,
-1.730818, 0.5965634, -1.348378, 1, 1, 1, 1, 1,
-1.729625, -0.4006856, -2.250149, 1, 1, 1, 1, 1,
-1.726308, 2.14691, -0.2802282, 1, 1, 1, 1, 1,
-1.71119, -0.2893004, -1.828845, 1, 1, 1, 1, 1,
-1.692784, 0.6723422, -1.472075, 1, 1, 1, 1, 1,
-1.690583, -0.2676008, -3.62411, 1, 1, 1, 1, 1,
-1.689695, 2.162059, -0.9697286, 1, 1, 1, 1, 1,
-1.686736, 1.010472, -1.831725, 1, 1, 1, 1, 1,
-1.679684, 1.482594, -1.549615, 1, 1, 1, 1, 1,
-1.679323, -0.6198874, -1.93975, 1, 1, 1, 1, 1,
-1.677461, -0.6627392, -4.004708, 1, 1, 1, 1, 1,
-1.674793, -1.153116, -3.007978, 1, 1, 1, 1, 1,
-1.67234, 0.2151498, 0.04439303, 0, 0, 1, 1, 1,
-1.669968, -1.107816, -1.038811, 1, 0, 0, 1, 1,
-1.667924, -0.2573161, -1.750075, 1, 0, 0, 1, 1,
-1.665833, 0.8683943, -1.143521, 1, 0, 0, 1, 1,
-1.662027, -0.8605359, -1.759183, 1, 0, 0, 1, 1,
-1.650503, 1.352423, 0.5011885, 1, 0, 0, 1, 1,
-1.640782, 0.6106781, -1.358113, 0, 0, 0, 1, 1,
-1.629311, -1.72664, -0.6679592, 0, 0, 0, 1, 1,
-1.621014, -0.7244521, -1.500639, 0, 0, 0, 1, 1,
-1.619519, 0.09861425, -0.6897493, 0, 0, 0, 1, 1,
-1.611848, 0.2408068, -0.6820406, 0, 0, 0, 1, 1,
-1.6086, 2.044774, -1.437879, 0, 0, 0, 1, 1,
-1.604735, 0.4126888, -1.442505, 0, 0, 0, 1, 1,
-1.59053, -0.5564201, -3.324064, 1, 1, 1, 1, 1,
-1.587324, -1.477011, -2.416838, 1, 1, 1, 1, 1,
-1.57477, -0.171559, -0.6445301, 1, 1, 1, 1, 1,
-1.568225, 0.8495988, -2.003277, 1, 1, 1, 1, 1,
-1.555653, -0.9956579, -1.279914, 1, 1, 1, 1, 1,
-1.539974, -0.564535, -2.275697, 1, 1, 1, 1, 1,
-1.532356, -0.7442922, -2.358093, 1, 1, 1, 1, 1,
-1.504415, 0.7920374, -0.6840732, 1, 1, 1, 1, 1,
-1.491658, -0.6500041, -3.705792, 1, 1, 1, 1, 1,
-1.487476, -0.6193069, -2.207681, 1, 1, 1, 1, 1,
-1.482644, -2.394746, -1.792573, 1, 1, 1, 1, 1,
-1.481719, -0.1796758, -1.00809, 1, 1, 1, 1, 1,
-1.473538, -1.46133, -2.503444, 1, 1, 1, 1, 1,
-1.468063, 0.1978974, -1.258406, 1, 1, 1, 1, 1,
-1.45036, 0.2601433, -0.3264658, 1, 1, 1, 1, 1,
-1.443574, 0.8070572, -0.6923554, 0, 0, 1, 1, 1,
-1.427191, -1.424834, -2.309817, 1, 0, 0, 1, 1,
-1.423095, -0.04178156, -1.293781, 1, 0, 0, 1, 1,
-1.420294, -0.5369713, -0.8612577, 1, 0, 0, 1, 1,
-1.409746, 0.135891, 0.2491595, 1, 0, 0, 1, 1,
-1.401303, 0.4972894, 0.1666067, 1, 0, 0, 1, 1,
-1.391018, 0.2650156, -2.062801, 0, 0, 0, 1, 1,
-1.389599, 0.203847, -2.339295, 0, 0, 0, 1, 1,
-1.384512, 0.06192525, -0.9725672, 0, 0, 0, 1, 1,
-1.374928, 0.3982255, -2.574394, 0, 0, 0, 1, 1,
-1.372223, -1.223566, -4.792389, 0, 0, 0, 1, 1,
-1.372077, -0.8207373, -3.262703, 0, 0, 0, 1, 1,
-1.371376, 0.9040471, -0.1077413, 0, 0, 0, 1, 1,
-1.367327, 0.01134961, -1.521434, 1, 1, 1, 1, 1,
-1.357043, 0.9774578, -2.01061, 1, 1, 1, 1, 1,
-1.35659, 1.459178, -1.877271, 1, 1, 1, 1, 1,
-1.353568, 0.8556003, -1.03353, 1, 1, 1, 1, 1,
-1.351319, -0.612438, -2.305015, 1, 1, 1, 1, 1,
-1.348035, -0.5970373, -2.264246, 1, 1, 1, 1, 1,
-1.33798, -0.1525604, 0.6830853, 1, 1, 1, 1, 1,
-1.335148, -1.279013, -1.986617, 1, 1, 1, 1, 1,
-1.32726, 0.4260055, -1.222321, 1, 1, 1, 1, 1,
-1.327102, -1.476659, -3.361977, 1, 1, 1, 1, 1,
-1.324958, 0.1558934, -2.355817, 1, 1, 1, 1, 1,
-1.321827, -0.947814, -1.883894, 1, 1, 1, 1, 1,
-1.319793, -0.8614191, -0.9842348, 1, 1, 1, 1, 1,
-1.317761, -0.4944237, -2.555691, 1, 1, 1, 1, 1,
-1.314666, 0.0443701, -1.060095, 1, 1, 1, 1, 1,
-1.311673, -1.017055, -3.791906, 0, 0, 1, 1, 1,
-1.309362, -1.5679, -3.72331, 1, 0, 0, 1, 1,
-1.301468, -0.2991601, -1.938008, 1, 0, 0, 1, 1,
-1.294362, -1.387957, -2.136144, 1, 0, 0, 1, 1,
-1.287169, -0.934571, -0.9954936, 1, 0, 0, 1, 1,
-1.286861, -0.9900748, -4.052003, 1, 0, 0, 1, 1,
-1.283889, -1.11409, -2.851411, 0, 0, 0, 1, 1,
-1.281628, 0.6943659, -1.43586, 0, 0, 0, 1, 1,
-1.281249, -0.8786999, -1.878907, 0, 0, 0, 1, 1,
-1.277306, 1.1573, -0.8553025, 0, 0, 0, 1, 1,
-1.275766, -0.2277711, -2.373006, 0, 0, 0, 1, 1,
-1.265015, -1.490619, -0.4912341, 0, 0, 0, 1, 1,
-1.256794, -0.701039, -2.892539, 0, 0, 0, 1, 1,
-1.256653, 0.1284193, -1.577241, 1, 1, 1, 1, 1,
-1.231306, 1.686994, 0.5412639, 1, 1, 1, 1, 1,
-1.219129, -1.287341, -1.888132, 1, 1, 1, 1, 1,
-1.216827, -1.645383, -2.610541, 1, 1, 1, 1, 1,
-1.215852, 0.1189396, -3.39147, 1, 1, 1, 1, 1,
-1.206287, 0.7052605, -0.1962977, 1, 1, 1, 1, 1,
-1.199294, -1.24387, -2.581017, 1, 1, 1, 1, 1,
-1.19709, -0.3086817, -1.274955, 1, 1, 1, 1, 1,
-1.194385, -0.353383, -2.271446, 1, 1, 1, 1, 1,
-1.193394, -0.1882804, -2.357832, 1, 1, 1, 1, 1,
-1.180929, -0.2266841, -0.1281897, 1, 1, 1, 1, 1,
-1.180354, 0.3864872, 0.9203114, 1, 1, 1, 1, 1,
-1.17701, 1.229677, 0.3352525, 1, 1, 1, 1, 1,
-1.176104, 0.2920663, -0.8002558, 1, 1, 1, 1, 1,
-1.175716, 0.6611538, -1.874639, 1, 1, 1, 1, 1,
-1.173147, -0.4498261, -1.61537, 0, 0, 1, 1, 1,
-1.171507, -0.9329932, 0.2253302, 1, 0, 0, 1, 1,
-1.170305, 0.6668193, -0.6347319, 1, 0, 0, 1, 1,
-1.146385, -1.756048, -2.548295, 1, 0, 0, 1, 1,
-1.141779, 0.2802842, 1.282771, 1, 0, 0, 1, 1,
-1.137461, -0.7317284, -1.127298, 1, 0, 0, 1, 1,
-1.136496, 0.5365188, 0.167424, 0, 0, 0, 1, 1,
-1.124902, 0.62621, -1.126406, 0, 0, 0, 1, 1,
-1.095856, 0.8477049, -0.6133807, 0, 0, 0, 1, 1,
-1.084616, 1.88608, -0.7957273, 0, 0, 0, 1, 1,
-1.073685, -0.4374306, -1.042176, 0, 0, 0, 1, 1,
-1.070817, -1.411616, -1.503916, 0, 0, 0, 1, 1,
-1.066302, -0.06510939, -0.5415107, 0, 0, 0, 1, 1,
-1.064083, 1.131945, 0.6590147, 1, 1, 1, 1, 1,
-1.063196, 0.07748834, -2.876345, 1, 1, 1, 1, 1,
-1.061147, -2.163441, -3.29089, 1, 1, 1, 1, 1,
-1.047615, 2.015384, -0.7079874, 1, 1, 1, 1, 1,
-1.047128, 0.2627864, -0.7309521, 1, 1, 1, 1, 1,
-1.043206, -0.4882784, -4.276262, 1, 1, 1, 1, 1,
-1.036512, -0.5864583, -2.288188, 1, 1, 1, 1, 1,
-1.032901, 1.511049, 0.09177793, 1, 1, 1, 1, 1,
-1.031764, 1.203227, -0.8835012, 1, 1, 1, 1, 1,
-1.029788, 0.05413651, -1.513787, 1, 1, 1, 1, 1,
-1.028652, -0.4563744, -1.094624, 1, 1, 1, 1, 1,
-1.025771, -0.08065829, -2.443035, 1, 1, 1, 1, 1,
-1.017432, -0.4197425, -1.645985, 1, 1, 1, 1, 1,
-1.016404, 0.1770359, -1.55362, 1, 1, 1, 1, 1,
-1.016136, 0.7787685, -2.057006, 1, 1, 1, 1, 1,
-1.013944, -0.5354807, -1.256203, 0, 0, 1, 1, 1,
-1.011167, -0.0265129, -1.146114, 1, 0, 0, 1, 1,
-1.010989, -0.5269792, -2.413068, 1, 0, 0, 1, 1,
-1.00856, -0.7825601, -4.191367, 1, 0, 0, 1, 1,
-1.005207, -0.5937446, -2.116692, 1, 0, 0, 1, 1,
-0.9968197, 0.2325619, -1.639553, 1, 0, 0, 1, 1,
-0.9922956, -1.686966, -1.002582, 0, 0, 0, 1, 1,
-0.9893171, 0.3493226, -1.955222, 0, 0, 0, 1, 1,
-0.9847982, 1.658852, 1.070588, 0, 0, 0, 1, 1,
-0.9832961, 0.7953109, -0.7196977, 0, 0, 0, 1, 1,
-0.9709892, 1.26879, -0.02360469, 0, 0, 0, 1, 1,
-0.9707412, -0.5875363, -2.430649, 0, 0, 0, 1, 1,
-0.9707004, 1.385295, -0.7007315, 0, 0, 0, 1, 1,
-0.9683356, 1.485643, -2.42484, 1, 1, 1, 1, 1,
-0.9612278, -0.6641814, -1.578289, 1, 1, 1, 1, 1,
-0.9596084, 0.8761153, -1.891676, 1, 1, 1, 1, 1,
-0.9576387, -0.1562116, -2.375361, 1, 1, 1, 1, 1,
-0.9554296, -0.5543637, -1.830456, 1, 1, 1, 1, 1,
-0.9521024, 0.8341978, -0.1318381, 1, 1, 1, 1, 1,
-0.950949, 0.7265873, -0.1566855, 1, 1, 1, 1, 1,
-0.946537, 1.179446, -1.524648, 1, 1, 1, 1, 1,
-0.9450139, 1.479203, 0.8381099, 1, 1, 1, 1, 1,
-0.9445803, -0.0855246, -0.2747073, 1, 1, 1, 1, 1,
-0.9324221, 0.4999226, -1.833769, 1, 1, 1, 1, 1,
-0.9241226, 0.17954, -4.195301, 1, 1, 1, 1, 1,
-0.9223605, 1.471471, -0.317545, 1, 1, 1, 1, 1,
-0.9216368, -1.901561, -2.160783, 1, 1, 1, 1, 1,
-0.916042, 0.359901, 0.3822873, 1, 1, 1, 1, 1,
-0.9157518, -0.07600117, -1.243689, 0, 0, 1, 1, 1,
-0.9133852, 1.086658, -0.2226492, 1, 0, 0, 1, 1,
-0.9128656, -0.6189224, -2.765105, 1, 0, 0, 1, 1,
-0.9120694, -0.8070698, -2.266365, 1, 0, 0, 1, 1,
-0.8992853, 0.9289185, -1.246089, 1, 0, 0, 1, 1,
-0.8966402, 0.7561597, -0.447433, 1, 0, 0, 1, 1,
-0.8949373, -0.6014563, -1.007575, 0, 0, 0, 1, 1,
-0.8934625, 2.422265, 1.62806, 0, 0, 0, 1, 1,
-0.8903598, -0.8375556, -4.912014, 0, 0, 0, 1, 1,
-0.8875233, -0.768947, -1.59101, 0, 0, 0, 1, 1,
-0.8834423, -2.399549, -2.028239, 0, 0, 0, 1, 1,
-0.8811523, 0.5522973, -1.979915, 0, 0, 0, 1, 1,
-0.8782772, 0.3348768, -0.8417311, 0, 0, 0, 1, 1,
-0.8774362, -0.3759675, -2.461869, 1, 1, 1, 1, 1,
-0.8728718, 1.007929, -0.2081945, 1, 1, 1, 1, 1,
-0.8657627, -0.6213918, -0.002814426, 1, 1, 1, 1, 1,
-0.8623337, -0.2734487, -3.088756, 1, 1, 1, 1, 1,
-0.8605824, -0.4170126, -2.434123, 1, 1, 1, 1, 1,
-0.858381, -1.684404, -2.776779, 1, 1, 1, 1, 1,
-0.8583311, -0.06985869, -1.052076, 1, 1, 1, 1, 1,
-0.8557546, 0.887731, -0.2639726, 1, 1, 1, 1, 1,
-0.8554693, 0.3336579, 0.9749313, 1, 1, 1, 1, 1,
-0.8525445, -0.4323632, -2.736168, 1, 1, 1, 1, 1,
-0.850834, -0.7846832, -1.260662, 1, 1, 1, 1, 1,
-0.8505513, 1.302426, 0.9735229, 1, 1, 1, 1, 1,
-0.8435915, -0.8110256, -1.215421, 1, 1, 1, 1, 1,
-0.8370764, -1.071784, -2.484061, 1, 1, 1, 1, 1,
-0.8351668, 0.2261552, -2.94385, 1, 1, 1, 1, 1,
-0.833943, -1.564087, -2.484729, 0, 0, 1, 1, 1,
-0.8335202, -1.225556, -1.997464, 1, 0, 0, 1, 1,
-0.8304855, 0.1699934, -0.4574129, 1, 0, 0, 1, 1,
-0.8282047, -0.02534747, -2.058358, 1, 0, 0, 1, 1,
-0.8241583, 1.009398, -1.379037, 1, 0, 0, 1, 1,
-0.8233441, 0.6788135, -2.450512, 1, 0, 0, 1, 1,
-0.8213044, -0.6325838, -0.9306731, 0, 0, 0, 1, 1,
-0.818806, 0.00756655, -1.395368, 0, 0, 0, 1, 1,
-0.8186319, -1.513561, -3.231063, 0, 0, 0, 1, 1,
-0.8125243, 0.1838026, -0.4383882, 0, 0, 0, 1, 1,
-0.8100832, -0.9957806, -1.970344, 0, 0, 0, 1, 1,
-0.8083329, -0.5968174, -2.495056, 0, 0, 0, 1, 1,
-0.7959529, -1.176903, -3.644481, 0, 0, 0, 1, 1,
-0.7938952, -0.502345, -2.544735, 1, 1, 1, 1, 1,
-0.7905601, 0.6600909, -0.4771119, 1, 1, 1, 1, 1,
-0.7902116, 0.9034514, -0.8437479, 1, 1, 1, 1, 1,
-0.7854689, -0.1074553, -0.9168364, 1, 1, 1, 1, 1,
-0.7836447, -0.4287214, -2.534743, 1, 1, 1, 1, 1,
-0.7830011, 1.134442, -0.02375672, 1, 1, 1, 1, 1,
-0.7815224, 0.6900468, -1.673001, 1, 1, 1, 1, 1,
-0.7709377, 0.6616555, -2.002142, 1, 1, 1, 1, 1,
-0.768025, 0.1150277, -1.403031, 1, 1, 1, 1, 1,
-0.7669748, -0.7697833, -1.435796, 1, 1, 1, 1, 1,
-0.7576393, 0.4095468, -0.2254791, 1, 1, 1, 1, 1,
-0.7492549, 0.9880782, -0.08933685, 1, 1, 1, 1, 1,
-0.7354379, -0.3935686, -1.698404, 1, 1, 1, 1, 1,
-0.7340179, -1.460669, -4.011059, 1, 1, 1, 1, 1,
-0.7334039, 0.9747006, 0.9338206, 1, 1, 1, 1, 1,
-0.7290094, 0.4637175, -0.7357591, 0, 0, 1, 1, 1,
-0.7218754, -0.6379961, -2.593211, 1, 0, 0, 1, 1,
-0.7199951, 0.09717599, -0.5548276, 1, 0, 0, 1, 1,
-0.7170569, -2.381149, -3.628806, 1, 0, 0, 1, 1,
-0.7156483, -0.2906643, -2.231312, 1, 0, 0, 1, 1,
-0.7086561, -0.8981732, -2.965448, 1, 0, 0, 1, 1,
-0.693829, 0.7180849, -0.8406854, 0, 0, 0, 1, 1,
-0.6885052, -0.4183185, -3.312727, 0, 0, 0, 1, 1,
-0.6871054, 1.367989, 0.078756, 0, 0, 0, 1, 1,
-0.6862849, -1.172053, -1.88222, 0, 0, 0, 1, 1,
-0.6846152, 1.458177, -2.514374, 0, 0, 0, 1, 1,
-0.6842273, -0.7252136, -1.841905, 0, 0, 0, 1, 1,
-0.6781013, 1.66707, -0.7332157, 0, 0, 0, 1, 1,
-0.6762657, 0.3086203, -1.276253, 1, 1, 1, 1, 1,
-0.6740506, 0.3667124, 0.1134757, 1, 1, 1, 1, 1,
-0.6734469, 0.8944026, 0.641144, 1, 1, 1, 1, 1,
-0.6718296, 0.543787, -0.4168571, 1, 1, 1, 1, 1,
-0.6714343, -0.03593007, -2.831592, 1, 1, 1, 1, 1,
-0.6634902, -0.182018, -3.056023, 1, 1, 1, 1, 1,
-0.658201, 0.4652217, -1.308018, 1, 1, 1, 1, 1,
-0.6581447, -0.695381, -1.039103, 1, 1, 1, 1, 1,
-0.653936, -0.4125731, -4.175416, 1, 1, 1, 1, 1,
-0.6523777, -0.2831954, -1.841494, 1, 1, 1, 1, 1,
-0.6515052, -1.653679, -2.88125, 1, 1, 1, 1, 1,
-0.6432719, 0.01500226, -2.14203, 1, 1, 1, 1, 1,
-0.639711, -0.2508202, -2.90118, 1, 1, 1, 1, 1,
-0.6377991, -0.2643009, -2.54826, 1, 1, 1, 1, 1,
-0.6327779, -1.715095, -3.30083, 1, 1, 1, 1, 1,
-0.6322281, 1.105555, 0.1189974, 0, 0, 1, 1, 1,
-0.6321155, 0.7096219, -2.319348, 1, 0, 0, 1, 1,
-0.6292651, 0.7300677, -1.192434, 1, 0, 0, 1, 1,
-0.6292612, -0.2753401, -2.969276, 1, 0, 0, 1, 1,
-0.625185, 1.293862, -1.167698, 1, 0, 0, 1, 1,
-0.6245515, 0.02379612, -0.4815695, 1, 0, 0, 1, 1,
-0.6218667, 0.06230579, -1.101512, 0, 0, 0, 1, 1,
-0.6180964, -0.2703975, -0.7445709, 0, 0, 0, 1, 1,
-0.6136769, -0.3587839, -1.730855, 0, 0, 0, 1, 1,
-0.6103536, -2.062451, -1.631477, 0, 0, 0, 1, 1,
-0.6102138, -1.160818, -3.052812, 0, 0, 0, 1, 1,
-0.6090274, -1.074583, -1.690449, 0, 0, 0, 1, 1,
-0.6085821, 0.7498264, 0.01949819, 0, 0, 0, 1, 1,
-0.6005629, 0.4328504, -0.3979537, 1, 1, 1, 1, 1,
-0.6004363, -2.247668, -2.884599, 1, 1, 1, 1, 1,
-0.5962235, 0.1054113, -1.584289, 1, 1, 1, 1, 1,
-0.5937133, -0.3608588, -1.77251, 1, 1, 1, 1, 1,
-0.5892193, 1.528758, -0.2354667, 1, 1, 1, 1, 1,
-0.5890924, 0.05421148, -1.92382, 1, 1, 1, 1, 1,
-0.5861886, -0.8314692, -2.778319, 1, 1, 1, 1, 1,
-0.5858102, -1.149893, -5.306805, 1, 1, 1, 1, 1,
-0.5779189, 0.5183951, -0.1224981, 1, 1, 1, 1, 1,
-0.5766604, 0.080492, -1.167834, 1, 1, 1, 1, 1,
-0.5710946, 0.4248082, -2.287143, 1, 1, 1, 1, 1,
-0.5644436, 0.5330394, -1.37126, 1, 1, 1, 1, 1,
-0.5558315, 0.7521691, -0.3660772, 1, 1, 1, 1, 1,
-0.5539257, 0.3064526, -0.3228174, 1, 1, 1, 1, 1,
-0.5514352, -0.5440998, -1.47425, 1, 1, 1, 1, 1,
-0.5476937, 0.9304544, -1.0227, 0, 0, 1, 1, 1,
-0.5475477, -1.732342, -5.339373, 1, 0, 0, 1, 1,
-0.545049, -1.170522, -2.826001, 1, 0, 0, 1, 1,
-0.5343979, 0.675423, -0.3721659, 1, 0, 0, 1, 1,
-0.5284455, -0.1334742, -0.1286419, 1, 0, 0, 1, 1,
-0.5256833, 1.54861, 0.9219727, 1, 0, 0, 1, 1,
-0.5208539, -0.2579219, -2.194251, 0, 0, 0, 1, 1,
-0.5192396, 0.3579042, 0.1589229, 0, 0, 0, 1, 1,
-0.5174059, -0.1422249, -2.448013, 0, 0, 0, 1, 1,
-0.516812, 1.382855, -0.260248, 0, 0, 0, 1, 1,
-0.5120719, -0.9329928, -2.605561, 0, 0, 0, 1, 1,
-0.5116102, 0.7970337, -1.009343, 0, 0, 0, 1, 1,
-0.5055099, -0.03008162, -1.535479, 0, 0, 0, 1, 1,
-0.5053592, -1.031588, -2.72918, 1, 1, 1, 1, 1,
-0.501504, -0.681204, -4.184909, 1, 1, 1, 1, 1,
-0.4996868, 0.6525282, -1.954123, 1, 1, 1, 1, 1,
-0.4984849, -0.6097834, -1.639996, 1, 1, 1, 1, 1,
-0.4977567, -0.3822899, -2.040958, 1, 1, 1, 1, 1,
-0.4964162, -0.2783127, -2.470326, 1, 1, 1, 1, 1,
-0.4951549, -0.551172, -1.61099, 1, 1, 1, 1, 1,
-0.4933374, -0.5445267, -0.8224557, 1, 1, 1, 1, 1,
-0.4894119, -0.3044944, -0.056517, 1, 1, 1, 1, 1,
-0.4840758, 0.8790713, 0.0601937, 1, 1, 1, 1, 1,
-0.4798434, -0.06499915, -1.120416, 1, 1, 1, 1, 1,
-0.4740644, -1.305257, -2.337868, 1, 1, 1, 1, 1,
-0.4723083, 1.000642, -1.762939, 1, 1, 1, 1, 1,
-0.4716673, 0.08368704, -2.508073, 1, 1, 1, 1, 1,
-0.4709275, 0.63911, -1.977299, 1, 1, 1, 1, 1,
-0.4695968, -0.5213407, -4.748096, 0, 0, 1, 1, 1,
-0.4637339, -0.5742581, -1.591454, 1, 0, 0, 1, 1,
-0.463688, -0.01987937, -0.6788604, 1, 0, 0, 1, 1,
-0.4557328, 0.3043497, -2.173803, 1, 0, 0, 1, 1,
-0.4439641, 0.319591, -0.4301389, 1, 0, 0, 1, 1,
-0.4435918, 0.1548594, -0.2637697, 1, 0, 0, 1, 1,
-0.4430761, 0.1925166, -2.013601, 0, 0, 0, 1, 1,
-0.440896, -0.8364663, -2.880528, 0, 0, 0, 1, 1,
-0.4403846, 0.735878, 0.4646024, 0, 0, 0, 1, 1,
-0.4385605, -0.5613208, -0.145305, 0, 0, 0, 1, 1,
-0.4374863, 1.050042, -0.8080158, 0, 0, 0, 1, 1,
-0.4268163, 1.053558, 0.02198414, 0, 0, 0, 1, 1,
-0.4259765, 1.335201, 0.3160461, 0, 0, 0, 1, 1,
-0.422319, 1.006856, -1.640045, 1, 1, 1, 1, 1,
-0.4157902, 0.2589079, -1.880246, 1, 1, 1, 1, 1,
-0.4144499, 0.2673472, -1.445992, 1, 1, 1, 1, 1,
-0.4123348, 0.162535, -0.9157864, 1, 1, 1, 1, 1,
-0.4107454, 1.187224, 1.200918, 1, 1, 1, 1, 1,
-0.4078871, -0.2035765, -4.374236, 1, 1, 1, 1, 1,
-0.4055682, -0.8655733, -3.650835, 1, 1, 1, 1, 1,
-0.3910506, 0.4280026, -0.1523927, 1, 1, 1, 1, 1,
-0.3905568, 0.9279326, -2.417643, 1, 1, 1, 1, 1,
-0.3808593, -0.6952521, -2.393883, 1, 1, 1, 1, 1,
-0.3786117, -0.234011, -3.386263, 1, 1, 1, 1, 1,
-0.3786081, -0.3978794, -2.176233, 1, 1, 1, 1, 1,
-0.3755573, -0.348444, -0.8194816, 1, 1, 1, 1, 1,
-0.3753012, -1.188451, -2.905063, 1, 1, 1, 1, 1,
-0.3734369, -0.4762849, -0.2855393, 1, 1, 1, 1, 1,
-0.369712, 1.091526, -0.4579978, 0, 0, 1, 1, 1,
-0.3578493, 0.9945094, -0.0826088, 1, 0, 0, 1, 1,
-0.3566502, -0.9189061, -1.332588, 1, 0, 0, 1, 1,
-0.3549785, -0.1164439, -1.720606, 1, 0, 0, 1, 1,
-0.3517248, 0.5227799, 0.1050016, 1, 0, 0, 1, 1,
-0.3511322, 0.5738838, -0.398495, 1, 0, 0, 1, 1,
-0.3503912, 0.4399992, -0.3717066, 0, 0, 0, 1, 1,
-0.3497335, -0.2960131, -4.396266, 0, 0, 0, 1, 1,
-0.3492329, 1.194657, -0.9953015, 0, 0, 0, 1, 1,
-0.3470767, 0.3790509, -1.723403, 0, 0, 0, 1, 1,
-0.3468688, 0.73327, 1.360536, 0, 0, 0, 1, 1,
-0.338848, 0.8127289, 0.4974706, 0, 0, 0, 1, 1,
-0.3356853, 0.5434292, -0.4079166, 0, 0, 0, 1, 1,
-0.335401, -0.8996023, -3.369715, 1, 1, 1, 1, 1,
-0.3342101, 1.658805, 0.4841375, 1, 1, 1, 1, 1,
-0.322992, 1.499464, -0.4919786, 1, 1, 1, 1, 1,
-0.3163753, 0.3112551, -1.362504, 1, 1, 1, 1, 1,
-0.3159273, 1.261007, -1.154509, 1, 1, 1, 1, 1,
-0.3152748, 1.260725, -0.6127822, 1, 1, 1, 1, 1,
-0.3094816, 0.4284699, 1.003183, 1, 1, 1, 1, 1,
-0.2977459, -0.2317049, -2.618858, 1, 1, 1, 1, 1,
-0.295161, 0.5980294, -1.542018, 1, 1, 1, 1, 1,
-0.2930561, -0.8489078, -2.662196, 1, 1, 1, 1, 1,
-0.2875949, -1.340183, -2.982348, 1, 1, 1, 1, 1,
-0.2874779, 2.213518, 2.050123, 1, 1, 1, 1, 1,
-0.2804364, -0.069529, -2.020782, 1, 1, 1, 1, 1,
-0.279911, 0.8902249, -0.9446557, 1, 1, 1, 1, 1,
-0.2746266, 0.04375052, -0.5992131, 1, 1, 1, 1, 1,
-0.2730716, -0.4443964, -1.578135, 0, 0, 1, 1, 1,
-0.2694683, 0.9432909, -0.6195654, 1, 0, 0, 1, 1,
-0.2689869, -0.0003027809, 0.5757615, 1, 0, 0, 1, 1,
-0.2679283, -1.602583, -2.545558, 1, 0, 0, 1, 1,
-0.2676979, 0.5455869, 1.814206, 1, 0, 0, 1, 1,
-0.2670976, -1.194498, -2.366657, 1, 0, 0, 1, 1,
-0.2659323, -1.467607, -1.354301, 0, 0, 0, 1, 1,
-0.262855, -1.037471, -5.163789, 0, 0, 0, 1, 1,
-0.2585303, -0.6361901, -3.579857, 0, 0, 0, 1, 1,
-0.2584383, -0.7373161, -2.548107, 0, 0, 0, 1, 1,
-0.2564792, -2.427386, -4.174076, 0, 0, 0, 1, 1,
-0.255243, 0.3017941, -0.5410031, 0, 0, 0, 1, 1,
-0.2551218, 1.254882, 1.478622, 0, 0, 0, 1, 1,
-0.2536691, 0.11237, -1.863025, 1, 1, 1, 1, 1,
-0.2531636, -1.126835, -1.915662, 1, 1, 1, 1, 1,
-0.2528387, -0.1199782, -2.106327, 1, 1, 1, 1, 1,
-0.251321, 2.074298, 0.9402146, 1, 1, 1, 1, 1,
-0.2510113, -0.1157577, -0.9532169, 1, 1, 1, 1, 1,
-0.2310465, 0.8984631, 1.424253, 1, 1, 1, 1, 1,
-0.2307402, -0.3999389, -2.669819, 1, 1, 1, 1, 1,
-0.2292089, -0.7499236, -3.362968, 1, 1, 1, 1, 1,
-0.2280261, -0.4420962, -1.864237, 1, 1, 1, 1, 1,
-0.2242869, 0.2030353, -2.733953, 1, 1, 1, 1, 1,
-0.2195144, -0.5598068, -3.24427, 1, 1, 1, 1, 1,
-0.2161541, 0.4701697, 1.188997, 1, 1, 1, 1, 1,
-0.2121775, -0.4654651, -1.985139, 1, 1, 1, 1, 1,
-0.2119247, -1.265201, -1.963854, 1, 1, 1, 1, 1,
-0.2115422, 0.4250117, -1.377005, 1, 1, 1, 1, 1,
-0.2087915, 0.01461683, -0.1369721, 0, 0, 1, 1, 1,
-0.2005085, -0.5204259, -4.604897, 1, 0, 0, 1, 1,
-0.1986829, 0.5489067, -0.809602, 1, 0, 0, 1, 1,
-0.1955892, -0.7982014, -2.492023, 1, 0, 0, 1, 1,
-0.1939783, -0.01582577, -2.986846, 1, 0, 0, 1, 1,
-0.1933043, 1.576355, -1.001363, 1, 0, 0, 1, 1,
-0.1929617, -0.2452396, -3.318149, 0, 0, 0, 1, 1,
-0.1924193, 1.125749, -1.225423, 0, 0, 0, 1, 1,
-0.1915618, -0.05776396, -2.401805, 0, 0, 0, 1, 1,
-0.1851249, -0.8146315, -2.277056, 0, 0, 0, 1, 1,
-0.1755555, 0.3506025, -2.025104, 0, 0, 0, 1, 1,
-0.1722802, -0.136899, -1.787775, 0, 0, 0, 1, 1,
-0.1677313, -1.081711, -2.467072, 0, 0, 0, 1, 1,
-0.1639325, 0.1018292, -2.135176, 1, 1, 1, 1, 1,
-0.1632198, 0.7654203, -0.7221019, 1, 1, 1, 1, 1,
-0.1621112, 2.404543, 0.1466096, 1, 1, 1, 1, 1,
-0.1608773, -0.2849926, -4.098606, 1, 1, 1, 1, 1,
-0.1585314, -1.089464, -1.003327, 1, 1, 1, 1, 1,
-0.1549651, 1.094926, 1.645145, 1, 1, 1, 1, 1,
-0.1546686, -0.4262022, -2.555958, 1, 1, 1, 1, 1,
-0.1519225, 0.2571639, -0.12283, 1, 1, 1, 1, 1,
-0.1459103, 0.1486318, -2.818422, 1, 1, 1, 1, 1,
-0.145313, 0.3030379, -0.298819, 1, 1, 1, 1, 1,
-0.1424484, -0.1780932, -3.823071, 1, 1, 1, 1, 1,
-0.1341858, -0.6093056, -3.509432, 1, 1, 1, 1, 1,
-0.1341116, -1.866202, -2.668763, 1, 1, 1, 1, 1,
-0.1320318, 0.7069569, -0.5153187, 1, 1, 1, 1, 1,
-0.1295193, 0.7445878, -0.1224606, 1, 1, 1, 1, 1,
-0.1294232, 1.385312, -0.03602076, 0, 0, 1, 1, 1,
-0.1287261, 2.412253, 0.5952817, 1, 0, 0, 1, 1,
-0.1285795, 0.5228251, -1.737666, 1, 0, 0, 1, 1,
-0.1280125, -0.3786033, -4.456054, 1, 0, 0, 1, 1,
-0.1252132, -2.495879, -1.581771, 1, 0, 0, 1, 1,
-0.1242829, 0.9822022, 2.195013, 1, 0, 0, 1, 1,
-0.1229056, -0.7375886, -2.707612, 0, 0, 0, 1, 1,
-0.1221332, 0.1627299, -0.504078, 0, 0, 0, 1, 1,
-0.1215729, -0.977959, -1.972222, 0, 0, 0, 1, 1,
-0.118625, 1.023585, -1.97232, 0, 0, 0, 1, 1,
-0.1161297, -0.990296, -2.848707, 0, 0, 0, 1, 1,
-0.1127188, 0.8095273, 0.1739702, 0, 0, 0, 1, 1,
-0.1092179, -0.2343685, -2.733936, 0, 0, 0, 1, 1,
-0.1085404, -0.9393458, -3.000393, 1, 1, 1, 1, 1,
-0.1029432, -0.3853641, -3.487355, 1, 1, 1, 1, 1,
-0.1027272, -1.40645, -2.325712, 1, 1, 1, 1, 1,
-0.09547544, -1.455702, -1.892903, 1, 1, 1, 1, 1,
-0.09374464, -0.5302355, -3.570577, 1, 1, 1, 1, 1,
-0.09285838, -0.2228349, -1.955704, 1, 1, 1, 1, 1,
-0.08822207, 1.168069, -0.9523407, 1, 1, 1, 1, 1,
-0.08592797, 0.09877805, -1.858177, 1, 1, 1, 1, 1,
-0.0852746, -0.8383127, -3.095709, 1, 1, 1, 1, 1,
-0.08437423, 0.2134789, 0.9662111, 1, 1, 1, 1, 1,
-0.083677, -0.09490936, -3.132614, 1, 1, 1, 1, 1,
-0.08316451, 0.6735224, -0.6899858, 1, 1, 1, 1, 1,
-0.0828415, 0.3590451, -0.7181578, 1, 1, 1, 1, 1,
-0.08276381, -1.890474, -2.529333, 1, 1, 1, 1, 1,
-0.08089162, 0.3078727, 0.5006235, 1, 1, 1, 1, 1,
-0.07911604, -0.1439698, -1.928982, 0, 0, 1, 1, 1,
-0.07417846, 1.519639, 0.8981185, 1, 0, 0, 1, 1,
-0.07393842, 0.3004637, -0.6962138, 1, 0, 0, 1, 1,
-0.07360847, -0.09366766, -3.308559, 1, 0, 0, 1, 1,
-0.0692763, 0.4419919, -0.2996529, 1, 0, 0, 1, 1,
-0.05944576, -0.9712132, -2.283706, 1, 0, 0, 1, 1,
-0.05770813, 0.8330337, -0.6268748, 0, 0, 0, 1, 1,
-0.05433724, -0.1355622, -3.102005, 0, 0, 0, 1, 1,
-0.05054221, -0.5961115, -4.165863, 0, 0, 0, 1, 1,
-0.04948369, -0.9345002, -2.468317, 0, 0, 0, 1, 1,
-0.04684074, -0.6593685, -1.869822, 0, 0, 0, 1, 1,
-0.04591573, -1.170964, -3.355818, 0, 0, 0, 1, 1,
-0.04330456, 0.1505747, -1.558228, 0, 0, 0, 1, 1,
-0.04284032, 1.079302, 0.3787014, 1, 1, 1, 1, 1,
-0.04057176, -0.8440868, -2.411087, 1, 1, 1, 1, 1,
-0.03867255, -1.419812, -2.842492, 1, 1, 1, 1, 1,
-0.03661914, 0.369207, 0.2781018, 1, 1, 1, 1, 1,
-0.035345, 0.8804905, -0.7503914, 1, 1, 1, 1, 1,
-0.03208539, -0.7202242, -5.326442, 1, 1, 1, 1, 1,
-0.03020709, -0.9004925, -0.8701563, 1, 1, 1, 1, 1,
-0.02832725, 1.204955, 1.065035, 1, 1, 1, 1, 1,
-0.02388927, 0.6362131, -0.1788615, 1, 1, 1, 1, 1,
-0.02036576, -0.08581258, -3.368479, 1, 1, 1, 1, 1,
-0.01907322, -0.6840472, -2.608677, 1, 1, 1, 1, 1,
-0.01647217, -2.040714, -3.703124, 1, 1, 1, 1, 1,
-0.01644479, -0.1791584, -1.219707, 1, 1, 1, 1, 1,
-0.01405789, -1.239119, -2.103025, 1, 1, 1, 1, 1,
-0.009683144, -0.2531276, -1.014851, 1, 1, 1, 1, 1,
-0.007534954, 0.9065154, -0.7714356, 0, 0, 1, 1, 1,
-0.005307325, 1.2469, -0.1517078, 1, 0, 0, 1, 1,
-0.0007585719, 0.04835594, 0.9948903, 1, 0, 0, 1, 1,
0.004358481, -1.820112, 4.888949, 1, 0, 0, 1, 1,
0.004533951, -1.10763, 2.238199, 1, 0, 0, 1, 1,
0.005127385, 0.2120932, 0.2404611, 1, 0, 0, 1, 1,
0.008591729, 0.4890084, 1.529152, 0, 0, 0, 1, 1,
0.009340401, -0.5904778, 4.087256, 0, 0, 0, 1, 1,
0.009798912, 0.02243682, -0.8665046, 0, 0, 0, 1, 1,
0.01046361, 0.2199419, -0.1455231, 0, 0, 0, 1, 1,
0.01067193, -0.3431945, 2.052713, 0, 0, 0, 1, 1,
0.01127861, -1.795188, 2.35351, 0, 0, 0, 1, 1,
0.01133338, 2.629025, 0.7032297, 0, 0, 0, 1, 1,
0.01220558, -0.6389203, 2.019643, 1, 1, 1, 1, 1,
0.01222301, -0.5489439, 4.345738, 1, 1, 1, 1, 1,
0.01356348, -1.358926, 2.316114, 1, 1, 1, 1, 1,
0.01510894, 1.314704, 0.1504327, 1, 1, 1, 1, 1,
0.01743416, -0.009910133, 2.980649, 1, 1, 1, 1, 1,
0.01804489, 0.1234614, 0.3269401, 1, 1, 1, 1, 1,
0.02579206, -0.6730093, 4.01939, 1, 1, 1, 1, 1,
0.03760283, -0.8342628, 2.596743, 1, 1, 1, 1, 1,
0.04533399, -0.09003191, 3.697939, 1, 1, 1, 1, 1,
0.04639972, -1.023573, 3.834924, 1, 1, 1, 1, 1,
0.05190767, 0.1013626, 0.6986276, 1, 1, 1, 1, 1,
0.05869931, -0.3042529, 3.642419, 1, 1, 1, 1, 1,
0.06274379, 0.1145619, 0.651342, 1, 1, 1, 1, 1,
0.06932507, 0.1469742, 0.3899284, 1, 1, 1, 1, 1,
0.07228202, 1.812358, 0.01752057, 1, 1, 1, 1, 1,
0.07603125, 0.009103879, 1.767288, 0, 0, 1, 1, 1,
0.0764645, -0.5668931, 0.4251654, 1, 0, 0, 1, 1,
0.07904562, 1.775928, 0.1621765, 1, 0, 0, 1, 1,
0.0835102, 0.195556, 0.2872483, 1, 0, 0, 1, 1,
0.08650354, -0.3511961, 2.054066, 1, 0, 0, 1, 1,
0.0868884, 0.8837107, -0.4801228, 1, 0, 0, 1, 1,
0.09391417, 0.4684578, -2.523797, 0, 0, 0, 1, 1,
0.09692378, 0.5943102, 0.07315145, 0, 0, 0, 1, 1,
0.105575, 0.1109699, -0.1617695, 0, 0, 0, 1, 1,
0.1059036, -1.14216, 2.883592, 0, 0, 0, 1, 1,
0.1065301, -1.730743, 3.121303, 0, 0, 0, 1, 1,
0.1098053, -1.787805, 4.892068, 0, 0, 0, 1, 1,
0.1105602, 1.023717, 0.03302618, 0, 0, 0, 1, 1,
0.1106317, 0.5399752, 2.651979, 1, 1, 1, 1, 1,
0.113576, -0.126586, 2.197781, 1, 1, 1, 1, 1,
0.1192549, -0.5203567, 3.900279, 1, 1, 1, 1, 1,
0.1218761, -0.1595762, 3.739681, 1, 1, 1, 1, 1,
0.1270517, -1.160277, 3.387247, 1, 1, 1, 1, 1,
0.1270863, 0.2471429, 0.963571, 1, 1, 1, 1, 1,
0.1303495, -1.030549, 2.762783, 1, 1, 1, 1, 1,
0.1327777, 0.3257725, 1.172358, 1, 1, 1, 1, 1,
0.1378781, 0.2696654, -0.8745363, 1, 1, 1, 1, 1,
0.1389917, 0.06482895, 0.6489841, 1, 1, 1, 1, 1,
0.1399748, 1.512154, -0.02483498, 1, 1, 1, 1, 1,
0.144773, 0.2639257, 0.3021348, 1, 1, 1, 1, 1,
0.1474366, 0.07979289, 1.165626, 1, 1, 1, 1, 1,
0.1485669, 0.987972, 0.4665347, 1, 1, 1, 1, 1,
0.1510637, 1.935624, 0.07861039, 1, 1, 1, 1, 1,
0.1569175, -0.4511415, 2.646521, 0, 0, 1, 1, 1,
0.158784, 1.225956, 0.3854493, 1, 0, 0, 1, 1,
0.1639255, -1.078256, 2.303989, 1, 0, 0, 1, 1,
0.1641904, 0.7994072, 2.537895, 1, 0, 0, 1, 1,
0.1652287, 0.1421734, 1.291789, 1, 0, 0, 1, 1,
0.1661034, 1.200927, -1.111238, 1, 0, 0, 1, 1,
0.1688466, -0.8563205, 1.357902, 0, 0, 0, 1, 1,
0.1704035, -0.01105286, 0.2303442, 0, 0, 0, 1, 1,
0.1739088, 2.3472, 1.239225, 0, 0, 0, 1, 1,
0.1751105, 1.405263, 0.545848, 0, 0, 0, 1, 1,
0.1755333, 0.4592042, 2.53098, 0, 0, 0, 1, 1,
0.1778318, -0.1230536, 3.005545, 0, 0, 0, 1, 1,
0.1823028, 0.3664456, -1.063015, 0, 0, 0, 1, 1,
0.1832124, -1.071826, 2.979568, 1, 1, 1, 1, 1,
0.1845134, 0.003618223, 1.631658, 1, 1, 1, 1, 1,
0.1846001, 0.4659992, -0.9478663, 1, 1, 1, 1, 1,
0.190272, -0.2510269, 4.057661, 1, 1, 1, 1, 1,
0.1937209, 0.4188143, 0.7347067, 1, 1, 1, 1, 1,
0.1938943, 1.782352, 0.2964061, 1, 1, 1, 1, 1,
0.1960945, 0.3735195, 0.877816, 1, 1, 1, 1, 1,
0.1988479, -0.2168289, 1.762649, 1, 1, 1, 1, 1,
0.1988867, 0.5606458, -0.7158652, 1, 1, 1, 1, 1,
0.1999721, 0.811853, -0.3518073, 1, 1, 1, 1, 1,
0.2014248, -1.417983, 3.599825, 1, 1, 1, 1, 1,
0.2036052, -1.496991, 1.732619, 1, 1, 1, 1, 1,
0.2067689, -0.6604626, 2.513373, 1, 1, 1, 1, 1,
0.207813, -0.1599488, 1.539268, 1, 1, 1, 1, 1,
0.2099007, -0.0005202015, -0.06676751, 1, 1, 1, 1, 1,
0.2134449, 0.5384684, -0.05788569, 0, 0, 1, 1, 1,
0.2159054, 0.03604711, 0.8910003, 1, 0, 0, 1, 1,
0.2189093, -1.163716, 3.358181, 1, 0, 0, 1, 1,
0.2196198, 0.04559472, 1.478831, 1, 0, 0, 1, 1,
0.2268051, 0.4640737, 0.2124255, 1, 0, 0, 1, 1,
0.2299674, -0.677505, 2.472633, 1, 0, 0, 1, 1,
0.2388244, 0.4437044, -0.8601425, 0, 0, 0, 1, 1,
0.2451187, 0.1371295, 0.6562624, 0, 0, 0, 1, 1,
0.253529, -0.8310239, 4.244177, 0, 0, 0, 1, 1,
0.2537732, -0.5965919, 3.014449, 0, 0, 0, 1, 1,
0.2553625, -0.8987824, 2.062729, 0, 0, 0, 1, 1,
0.2558582, 2.154819, 0.8463042, 0, 0, 0, 1, 1,
0.2563328, -0.3441984, 1.966125, 0, 0, 0, 1, 1,
0.2575608, 0.2832541, 0.2301206, 1, 1, 1, 1, 1,
0.2622892, 0.6373525, 0.6473703, 1, 1, 1, 1, 1,
0.2649141, 0.4290337, 0.5781371, 1, 1, 1, 1, 1,
0.2683371, -2.507848, 3.814577, 1, 1, 1, 1, 1,
0.2829688, 0.6148777, 1.514234, 1, 1, 1, 1, 1,
0.2876061, -2.928649, 3.210237, 1, 1, 1, 1, 1,
0.2883781, 0.1596368, -0.03364562, 1, 1, 1, 1, 1,
0.2907302, 1.376685, -0.1749876, 1, 1, 1, 1, 1,
0.2909416, 0.1665549, 1.635892, 1, 1, 1, 1, 1,
0.2952986, 0.329329, 2.357168, 1, 1, 1, 1, 1,
0.2957939, 1.806091, 0.906084, 1, 1, 1, 1, 1,
0.2970449, 0.5492267, 1.593588, 1, 1, 1, 1, 1,
0.2973008, -0.6811219, 2.638208, 1, 1, 1, 1, 1,
0.2994964, -2.346027, 4.377728, 1, 1, 1, 1, 1,
0.3013481, -0.3275141, 1.947955, 1, 1, 1, 1, 1,
0.3023384, -0.1083899, 0.3605338, 0, 0, 1, 1, 1,
0.3032977, -0.07798411, 1.624852, 1, 0, 0, 1, 1,
0.313598, -0.3123828, 0.08848015, 1, 0, 0, 1, 1,
0.3142779, -0.3807002, 1.838615, 1, 0, 0, 1, 1,
0.3147363, 0.8973796, 0.5347566, 1, 0, 0, 1, 1,
0.3174286, 1.501151, -0.1707102, 1, 0, 0, 1, 1,
0.3181607, -0.983382, 2.019098, 0, 0, 0, 1, 1,
0.3186074, 1.233148, -0.5775337, 0, 0, 0, 1, 1,
0.3207455, -0.2896428, 3.060282, 0, 0, 0, 1, 1,
0.3224684, -0.680052, 1.710707, 0, 0, 0, 1, 1,
0.3245173, -1.871101, 2.729796, 0, 0, 0, 1, 1,
0.3260188, -1.132862, 2.717847, 0, 0, 0, 1, 1,
0.3269704, -0.2040784, 0.5775849, 0, 0, 0, 1, 1,
0.3287737, -1.472665, 3.108502, 1, 1, 1, 1, 1,
0.3292775, 1.456077, -0.2255078, 1, 1, 1, 1, 1,
0.3297099, -0.06159714, 2.350311, 1, 1, 1, 1, 1,
0.3319716, -1.659374, 2.235018, 1, 1, 1, 1, 1,
0.3319782, 0.2538762, 0.4185915, 1, 1, 1, 1, 1,
0.332223, -0.6164295, 1.9625, 1, 1, 1, 1, 1,
0.3328875, 0.5584074, 0.1499459, 1, 1, 1, 1, 1,
0.3473107, -1.097784, 3.191139, 1, 1, 1, 1, 1,
0.3476745, 2.494078, -0.3180105, 1, 1, 1, 1, 1,
0.3490678, -0.4005141, 0.4124901, 1, 1, 1, 1, 1,
0.3491177, -0.5531915, 1.957057, 1, 1, 1, 1, 1,
0.352822, -0.3025365, 1.302651, 1, 1, 1, 1, 1,
0.3568831, -2.212565, 3.013462, 1, 1, 1, 1, 1,
0.3606008, -2.72732, 1.569625, 1, 1, 1, 1, 1,
0.3629451, 0.6151388, 0.9642251, 1, 1, 1, 1, 1,
0.3637736, 0.1410319, 0.3445467, 0, 0, 1, 1, 1,
0.364477, 0.6309257, -1.06475, 1, 0, 0, 1, 1,
0.3688793, 0.1974581, -1.235598, 1, 0, 0, 1, 1,
0.37044, -0.3174778, 2.162726, 1, 0, 0, 1, 1,
0.3730108, 1.185833, -1.104393, 1, 0, 0, 1, 1,
0.3766441, -0.4453332, 0.8111635, 1, 0, 0, 1, 1,
0.3780215, 0.7846339, -2.920997, 0, 0, 0, 1, 1,
0.3809861, 1.269868, 0.0929804, 0, 0, 0, 1, 1,
0.3812395, 0.6098326, -0.1178733, 0, 0, 0, 1, 1,
0.3838789, -0.5716494, 2.603624, 0, 0, 0, 1, 1,
0.384887, 0.6302147, 0.03352199, 0, 0, 0, 1, 1,
0.3858061, 0.6981806, -2.033467, 0, 0, 0, 1, 1,
0.3885232, 1.191205, -0.970969, 0, 0, 0, 1, 1,
0.3916732, -0.3609623, 1.831567, 1, 1, 1, 1, 1,
0.393001, 0.08444874, 2.378818, 1, 1, 1, 1, 1,
0.3934441, 0.1941111, 0.1081492, 1, 1, 1, 1, 1,
0.3947594, 1.087885, 0.6108847, 1, 1, 1, 1, 1,
0.3959644, -0.2163925, 0.6541911, 1, 1, 1, 1, 1,
0.3969315, -0.4034063, 2.678108, 1, 1, 1, 1, 1,
0.3975968, 0.6985137, -0.4697012, 1, 1, 1, 1, 1,
0.4089428, 1.507988, -0.07880722, 1, 1, 1, 1, 1,
0.4089881, 0.08322734, 1.648692, 1, 1, 1, 1, 1,
0.4183209, 0.09121999, 0.09576795, 1, 1, 1, 1, 1,
0.4185898, 1.271839, -0.5332109, 1, 1, 1, 1, 1,
0.4233677, 0.8559492, -0.8704158, 1, 1, 1, 1, 1,
0.4247564, 0.3296219, 1.853304, 1, 1, 1, 1, 1,
0.4254065, -1.209504, 0.448029, 1, 1, 1, 1, 1,
0.425494, 0.3778444, 0.07002349, 1, 1, 1, 1, 1,
0.4281312, 0.0492411, 1.371022, 0, 0, 1, 1, 1,
0.439182, 0.6572933, 0.0006394939, 1, 0, 0, 1, 1,
0.4418713, -2.253099, 2.043925, 1, 0, 0, 1, 1,
0.4471921, -0.8834467, 2.68668, 1, 0, 0, 1, 1,
0.4476512, 2.788577, -0.9905772, 1, 0, 0, 1, 1,
0.4482584, 1.430441, 0.9452655, 1, 0, 0, 1, 1,
0.4488772, 2.232532, 0.7870296, 0, 0, 0, 1, 1,
0.4490885, 0.2943601, -0.3800929, 0, 0, 0, 1, 1,
0.4491184, -0.8365538, 3.176563, 0, 0, 0, 1, 1,
0.4529158, 2.129663, 0.6181085, 0, 0, 0, 1, 1,
0.457317, -2.87631, 2.35007, 0, 0, 0, 1, 1,
0.4588676, -0.4521604, 2.951439, 0, 0, 0, 1, 1,
0.4608483, -0.4535926, 1.87705, 0, 0, 0, 1, 1,
0.46714, 2.02597, 0.1850577, 1, 1, 1, 1, 1,
0.4675196, 0.9588428, -0.2550662, 1, 1, 1, 1, 1,
0.4755897, 2.869735, 0.9464109, 1, 1, 1, 1, 1,
0.4776671, -0.4310663, 2.804856, 1, 1, 1, 1, 1,
0.481728, 1.536054, 1.871797, 1, 1, 1, 1, 1,
0.4821191, -0.2192009, 1.100514, 1, 1, 1, 1, 1,
0.4837323, 0.3746803, 1.519739, 1, 1, 1, 1, 1,
0.495729, -0.4754441, 1.110855, 1, 1, 1, 1, 1,
0.4968454, -0.279363, 0.8432084, 1, 1, 1, 1, 1,
0.4979655, -1.766038, 3.239402, 1, 1, 1, 1, 1,
0.4984938, -0.5001407, 2.523473, 1, 1, 1, 1, 1,
0.5004457, 0.3916245, 1.525346, 1, 1, 1, 1, 1,
0.5021341, 0.8097919, -0.5075455, 1, 1, 1, 1, 1,
0.5033396, 0.4974528, 0.2374139, 1, 1, 1, 1, 1,
0.5108, 0.05982722, 0.07973319, 1, 1, 1, 1, 1,
0.5265702, 1.01385, 0.1111, 0, 0, 1, 1, 1,
0.5332878, -0.1506391, 2.317955, 1, 0, 0, 1, 1,
0.5343906, 0.2505218, 0.6788705, 1, 0, 0, 1, 1,
0.5494072, 0.3383124, -0.05957058, 1, 0, 0, 1, 1,
0.5549484, 0.2920553, 2.34207, 1, 0, 0, 1, 1,
0.5616669, -0.4218348, 1.09191, 1, 0, 0, 1, 1,
0.5637007, 1.171827, 0.5255502, 0, 0, 0, 1, 1,
0.565143, 0.8908312, 0.7281584, 0, 0, 0, 1, 1,
0.574106, 0.01169413, 0.5316408, 0, 0, 0, 1, 1,
0.5754914, -0.9456189, 2.691464, 0, 0, 0, 1, 1,
0.5794798, 1.041888, 2.956717, 0, 0, 0, 1, 1,
0.5808454, -0.3448352, 2.845934, 0, 0, 0, 1, 1,
0.5831478, -1.256776, 3.605839, 0, 0, 0, 1, 1,
0.5834476, -0.06735084, 1.97735, 1, 1, 1, 1, 1,
0.5875453, 0.9518765, 1.234735, 1, 1, 1, 1, 1,
0.5904703, 0.6933095, 1.212296, 1, 1, 1, 1, 1,
0.5938523, 0.6321784, 0.1081489, 1, 1, 1, 1, 1,
0.5981891, -1.132981, 3.018805, 1, 1, 1, 1, 1,
0.5998408, 0.1857786, 0.5541641, 1, 1, 1, 1, 1,
0.6008511, 0.4307712, 0.7039861, 1, 1, 1, 1, 1,
0.6009461, 0.2292172, 1.104734, 1, 1, 1, 1, 1,
0.6060855, 0.3281699, 1.708569, 1, 1, 1, 1, 1,
0.6079524, 1.704383, 2.210614, 1, 1, 1, 1, 1,
0.6135483, 0.642187, 2.232291, 1, 1, 1, 1, 1,
0.6137947, 1.020155, -0.000776513, 1, 1, 1, 1, 1,
0.613971, -1.617183, 3.700125, 1, 1, 1, 1, 1,
0.6146297, 1.731797, -1.187924, 1, 1, 1, 1, 1,
0.6174862, 0.900174, -0.9029577, 1, 1, 1, 1, 1,
0.6219099, 0.4422266, 2.321476, 0, 0, 1, 1, 1,
0.6250123, -0.4415142, 2.310836, 1, 0, 0, 1, 1,
0.6295535, -0.129979, 3.824291, 1, 0, 0, 1, 1,
0.6313994, -1.651782, 2.341511, 1, 0, 0, 1, 1,
0.6409991, -0.804943, 3.079995, 1, 0, 0, 1, 1,
0.6410495, -1.01371, 2.272739, 1, 0, 0, 1, 1,
0.6483915, -1.067564, 4.229989, 0, 0, 0, 1, 1,
0.6521055, -2.095851, 3.148617, 0, 0, 0, 1, 1,
0.6530107, 0.1716776, 2.005321, 0, 0, 0, 1, 1,
0.6550485, -1.098414, 2.036216, 0, 0, 0, 1, 1,
0.6553599, 0.8634552, 0.7416834, 0, 0, 0, 1, 1,
0.6595596, -1.229273, 2.767369, 0, 0, 0, 1, 1,
0.659655, 0.1279824, 3.105553, 0, 0, 0, 1, 1,
0.6596604, -0.8708698, 2.044775, 1, 1, 1, 1, 1,
0.6612695, -1.640158, 4.006649, 1, 1, 1, 1, 1,
0.6618721, -0.849207, 1.456268, 1, 1, 1, 1, 1,
0.6631259, -0.2550669, 1.710398, 1, 1, 1, 1, 1,
0.6678337, -0.37091, 2.032572, 1, 1, 1, 1, 1,
0.682726, 0.1761643, 2.331742, 1, 1, 1, 1, 1,
0.6896896, 0.6257951, 0.2203306, 1, 1, 1, 1, 1,
0.6975442, 1.752635, -0.1373789, 1, 1, 1, 1, 1,
0.7004448, -1.795305, 3.907899, 1, 1, 1, 1, 1,
0.7054405, -1.095451, 1.648423, 1, 1, 1, 1, 1,
0.7072976, 0.2227903, 3.705647, 1, 1, 1, 1, 1,
0.7078872, 0.4808814, 0.6870384, 1, 1, 1, 1, 1,
0.7082647, -0.7294994, 1.645303, 1, 1, 1, 1, 1,
0.7090766, 0.4570159, 0.3604078, 1, 1, 1, 1, 1,
0.7230945, -0.3274372, 2.11869, 1, 1, 1, 1, 1,
0.7265114, -0.4805333, 2.854064, 0, 0, 1, 1, 1,
0.7299974, -0.1116417, 0.1624222, 1, 0, 0, 1, 1,
0.7325815, 1.23175, -0.1482532, 1, 0, 0, 1, 1,
0.7335348, -0.6926509, 2.568921, 1, 0, 0, 1, 1,
0.7348258, -1.227363, 3.655437, 1, 0, 0, 1, 1,
0.7385103, -0.1421498, 0.6676458, 1, 0, 0, 1, 1,
0.7394005, -0.3030403, 1.403721, 0, 0, 0, 1, 1,
0.742541, 0.2350352, 0.501295, 0, 0, 0, 1, 1,
0.745582, 0.7204506, -0.2140972, 0, 0, 0, 1, 1,
0.7472101, 1.174991, 0.195364, 0, 0, 0, 1, 1,
0.7473344, -0.3363287, 2.932125, 0, 0, 0, 1, 1,
0.7546672, -1.456113, 3.467324, 0, 0, 0, 1, 1,
0.756259, -0.591414, 1.449525, 0, 0, 0, 1, 1,
0.7573124, -1.766321, 2.754218, 1, 1, 1, 1, 1,
0.7622926, -0.6629958, 3.049178, 1, 1, 1, 1, 1,
0.7652438, -0.1138836, 2.157011, 1, 1, 1, 1, 1,
0.7657796, 1.108479, 2.396734, 1, 1, 1, 1, 1,
0.7708317, 0.7238923, 0.3749653, 1, 1, 1, 1, 1,
0.7760864, -1.64039, 1.697729, 1, 1, 1, 1, 1,
0.7784706, -0.7343629, 2.274412, 1, 1, 1, 1, 1,
0.7805432, -0.2395805, 2.233085, 1, 1, 1, 1, 1,
0.7817183, -0.8127732, 2.452961, 1, 1, 1, 1, 1,
0.7823284, -0.1797549, 3.627303, 1, 1, 1, 1, 1,
0.7847921, -0.7236811, 4.035377, 1, 1, 1, 1, 1,
0.7848545, -0.003049013, 1.535893, 1, 1, 1, 1, 1,
0.7863238, -0.9612622, 2.76298, 1, 1, 1, 1, 1,
0.7880218, -0.8842841, 0.8029295, 1, 1, 1, 1, 1,
0.7960039, 0.5509945, 0.6442892, 1, 1, 1, 1, 1,
0.8046679, -0.3188328, 2.747552, 0, 0, 1, 1, 1,
0.8075428, 0.7732725, 1.483327, 1, 0, 0, 1, 1,
0.8105902, 1.077288, 1.383843, 1, 0, 0, 1, 1,
0.8112106, 0.5320842, -0.7597836, 1, 0, 0, 1, 1,
0.8154873, 1.78769, 0.08745013, 1, 0, 0, 1, 1,
0.8242998, 0.7532042, 0.6195492, 1, 0, 0, 1, 1,
0.8284022, 1.579819, 0.3044847, 0, 0, 0, 1, 1,
0.8296955, -1.015241, 3.346155, 0, 0, 0, 1, 1,
0.8331285, 0.4883962, 2.451791, 0, 0, 0, 1, 1,
0.8334045, 0.8914265, 1.954596, 0, 0, 0, 1, 1,
0.83719, -0.3210976, 1.573519, 0, 0, 0, 1, 1,
0.8409323, -0.3580995, 0.4732572, 0, 0, 0, 1, 1,
0.8453594, -0.06828882, 0.4915198, 0, 0, 0, 1, 1,
0.8599182, -1.33611, 2.614898, 1, 1, 1, 1, 1,
0.865239, 0.7637913, 0.9811999, 1, 1, 1, 1, 1,
0.8771803, 0.469148, -0.1034387, 1, 1, 1, 1, 1,
0.877838, -0.7389044, 2.354406, 1, 1, 1, 1, 1,
0.8787937, -0.4976425, 3.314957, 1, 1, 1, 1, 1,
0.8793666, -0.02422365, 2.672955, 1, 1, 1, 1, 1,
0.8808802, 0.242563, 2.113398, 1, 1, 1, 1, 1,
0.8839053, -0.6494301, 2.148024, 1, 1, 1, 1, 1,
0.8878819, 0.4765564, 1.643369, 1, 1, 1, 1, 1,
0.8905086, 0.1201317, 0.1532242, 1, 1, 1, 1, 1,
0.8971476, 0.8846822, 1.54027, 1, 1, 1, 1, 1,
0.8972023, -0.9002372, 2.656409, 1, 1, 1, 1, 1,
0.8997974, -0.05822946, 1.972191, 1, 1, 1, 1, 1,
0.9024155, 1.271893, 0.2279962, 1, 1, 1, 1, 1,
0.9041629, -0.1774589, 1.719346, 1, 1, 1, 1, 1,
0.9103374, -0.9236937, 3.120482, 0, 0, 1, 1, 1,
0.9160079, 0.3038432, -0.1064547, 1, 0, 0, 1, 1,
0.9200591, -1.175847, 2.966857, 1, 0, 0, 1, 1,
0.9281496, 0.7437041, 2.012322, 1, 0, 0, 1, 1,
0.9345381, -0.3376859, 3.009479, 1, 0, 0, 1, 1,
0.9358522, 0.1820072, 0.5133548, 1, 0, 0, 1, 1,
0.9378769, -1.193904, 2.95274, 0, 0, 0, 1, 1,
0.9393909, -0.9177867, 2.316605, 0, 0, 0, 1, 1,
0.9401987, -0.6326911, 2.214912, 0, 0, 0, 1, 1,
0.9406095, 0.2937844, -0.2770249, 0, 0, 0, 1, 1,
0.9409609, 0.3509639, 1.940697, 0, 0, 0, 1, 1,
0.9416648, -1.66597, 2.077245, 0, 0, 0, 1, 1,
0.9483249, 2.556469, -0.6263641, 0, 0, 0, 1, 1,
0.949101, 0.1926299, 1.816853, 1, 1, 1, 1, 1,
0.9759617, -0.6240576, 2.806669, 1, 1, 1, 1, 1,
0.9775642, -0.750529, 2.183414, 1, 1, 1, 1, 1,
0.9786879, 0.09765786, 3.627558, 1, 1, 1, 1, 1,
0.9803476, -0.1211805, 0.8873017, 1, 1, 1, 1, 1,
0.9814739, -0.03358202, 0.05126579, 1, 1, 1, 1, 1,
0.9844493, 0.4470579, 1.214304, 1, 1, 1, 1, 1,
0.9936579, -0.2638589, 0.6085333, 1, 1, 1, 1, 1,
0.996048, 0.08049653, 0.5549001, 1, 1, 1, 1, 1,
1.00055, 0.2435159, -0.2807339, 1, 1, 1, 1, 1,
1.011345, 0.13223, -0.1420705, 1, 1, 1, 1, 1,
1.013703, -0.3866036, 2.904437, 1, 1, 1, 1, 1,
1.02936, -1.560261, 2.36947, 1, 1, 1, 1, 1,
1.034347, -0.5643936, 3.639084, 1, 1, 1, 1, 1,
1.034613, -0.3155681, 2.360276, 1, 1, 1, 1, 1,
1.034894, 0.6989677, 0.9743274, 0, 0, 1, 1, 1,
1.036364, -0.3171359, 3.00789, 1, 0, 0, 1, 1,
1.037899, -0.4903408, -0.8169285, 1, 0, 0, 1, 1,
1.037965, -0.6422973, 3.134244, 1, 0, 0, 1, 1,
1.041484, -0.3789669, 2.481694, 1, 0, 0, 1, 1,
1.043327, -0.8159566, 2.11055, 1, 0, 0, 1, 1,
1.043695, 0.1866617, 1.396253, 0, 0, 0, 1, 1,
1.046993, -0.4037686, 2.000417, 0, 0, 0, 1, 1,
1.048058, -1.4457, 3.483978, 0, 0, 0, 1, 1,
1.049272, -1.573793, 2.679949, 0, 0, 0, 1, 1,
1.062062, 0.6202379, -0.394636, 0, 0, 0, 1, 1,
1.068914, 0.0366248, 1.696775, 0, 0, 0, 1, 1,
1.071819, 1.665082, -0.3338117, 0, 0, 0, 1, 1,
1.07219, -0.3237112, 1.658035, 1, 1, 1, 1, 1,
1.073307, 0.8287632, 1.742955, 1, 1, 1, 1, 1,
1.080757, 0.2946773, 1.285903, 1, 1, 1, 1, 1,
1.081889, -0.8708245, 1.938809, 1, 1, 1, 1, 1,
1.083328, 1.015389, -0.3720529, 1, 1, 1, 1, 1,
1.083483, 1.013064, 1.117536, 1, 1, 1, 1, 1,
1.088046, 1.134239, 0.1822889, 1, 1, 1, 1, 1,
1.088075, -0.145381, 1.641496, 1, 1, 1, 1, 1,
1.088765, 1.941163, 1.075057, 1, 1, 1, 1, 1,
1.094979, -0.2981402, 0.6781659, 1, 1, 1, 1, 1,
1.099979, 1.066202, -0.4848009, 1, 1, 1, 1, 1,
1.10326, 1.18564, 0.535313, 1, 1, 1, 1, 1,
1.106997, -0.6851851, 1.886046, 1, 1, 1, 1, 1,
1.10702, -0.4467287, 2.244801, 1, 1, 1, 1, 1,
1.114068, -1.298411, 4.472254, 1, 1, 1, 1, 1,
1.121639, -0.4660399, 1.559526, 0, 0, 1, 1, 1,
1.128168, 1.409686, 1.704577, 1, 0, 0, 1, 1,
1.129481, -0.1376521, 0.4296201, 1, 0, 0, 1, 1,
1.129487, 0.4113392, 0.05214079, 1, 0, 0, 1, 1,
1.131981, 0.3465602, 1.309041, 1, 0, 0, 1, 1,
1.136018, 0.6604382, 0.5453079, 1, 0, 0, 1, 1,
1.1383, -0.05955729, 2.067567, 0, 0, 0, 1, 1,
1.142167, 0.928422, 1.999387, 0, 0, 0, 1, 1,
1.151976, -0.7727956, 3.836518, 0, 0, 0, 1, 1,
1.152785, -2.393725, 4.565732, 0, 0, 0, 1, 1,
1.15747, 0.5685766, 1.23364, 0, 0, 0, 1, 1,
1.158729, -0.7893984, 3.040299, 0, 0, 0, 1, 1,
1.159821, 0.5082077, 1.788715, 0, 0, 0, 1, 1,
1.170182, 1.249426, 1.181112, 1, 1, 1, 1, 1,
1.176123, 1.528695, -0.001408142, 1, 1, 1, 1, 1,
1.177724, 0.4871319, 1.309324, 1, 1, 1, 1, 1,
1.189106, 0.8627948, 2.023043, 1, 1, 1, 1, 1,
1.196046, 0.190573, 1.316024, 1, 1, 1, 1, 1,
1.200674, 1.394639, 1.589067, 1, 1, 1, 1, 1,
1.204613, -0.003460812, 1.789374, 1, 1, 1, 1, 1,
1.204674, 1.040295, 0.9397959, 1, 1, 1, 1, 1,
1.207364, -1.223694, 3.140727, 1, 1, 1, 1, 1,
1.210752, -0.2893468, 1.521562, 1, 1, 1, 1, 1,
1.212556, 0.9986955, 1.108671, 1, 1, 1, 1, 1,
1.21814, 0.8604808, -0.1772081, 1, 1, 1, 1, 1,
1.222422, 0.6317248, 1.36495, 1, 1, 1, 1, 1,
1.223063, 0.01039162, 0.8749011, 1, 1, 1, 1, 1,
1.230465, -0.0183131, 1.492335, 1, 1, 1, 1, 1,
1.233362, -0.1807206, 3.454648, 0, 0, 1, 1, 1,
1.238252, 0.1619551, 1.808466, 1, 0, 0, 1, 1,
1.241769, -0.4965654, 3.101243, 1, 0, 0, 1, 1,
1.243018, 0.5003372, 0.4407331, 1, 0, 0, 1, 1,
1.249046, -2.377184, 1.427621, 1, 0, 0, 1, 1,
1.252138, 0.5113844, 0.3371736, 1, 0, 0, 1, 1,
1.260153, 0.4418501, 2.413679, 0, 0, 0, 1, 1,
1.263277, -0.05023357, 1.273079, 0, 0, 0, 1, 1,
1.268022, 0.05551841, 0.86132, 0, 0, 0, 1, 1,
1.270964, 0.3346377, -0.2809502, 0, 0, 0, 1, 1,
1.276062, -0.3523902, 1.823089, 0, 0, 0, 1, 1,
1.278212, -2.050704, 3.55045, 0, 0, 0, 1, 1,
1.278891, -0.7242445, 3.653363, 0, 0, 0, 1, 1,
1.285842, 0.6620231, 0.4004693, 1, 1, 1, 1, 1,
1.292067, 0.2289756, 1.652677, 1, 1, 1, 1, 1,
1.303859, -0.8206522, 1.383173, 1, 1, 1, 1, 1,
1.304607, -0.4280155, 3.426207, 1, 1, 1, 1, 1,
1.310726, 1.458673, 2.109553, 1, 1, 1, 1, 1,
1.315002, 0.06350592, 1.437921, 1, 1, 1, 1, 1,
1.319941, 0.7183741, 2.968963, 1, 1, 1, 1, 1,
1.328243, 0.1328271, 2.309331, 1, 1, 1, 1, 1,
1.332044, 1.026935, 0.8981251, 1, 1, 1, 1, 1,
1.338304, -0.1284795, 2.639557, 1, 1, 1, 1, 1,
1.350051, -0.1866476, 0.4341097, 1, 1, 1, 1, 1,
1.350268, 1.184671, 2.269134, 1, 1, 1, 1, 1,
1.364223, -1.607899, 1.841129, 1, 1, 1, 1, 1,
1.375973, -1.348115, 3.58414, 1, 1, 1, 1, 1,
1.377617, 1.150753, 1.955938, 1, 1, 1, 1, 1,
1.381935, 1.333299, 1.583194, 0, 0, 1, 1, 1,
1.386083, -1.076552, 0.952149, 1, 0, 0, 1, 1,
1.386603, 1.782039, 0.005464916, 1, 0, 0, 1, 1,
1.398205, -0.213109, 2.938512, 1, 0, 0, 1, 1,
1.399999, 0.862017, 0.9349083, 1, 0, 0, 1, 1,
1.401924, 0.3475433, 1.374015, 1, 0, 0, 1, 1,
1.413952, -0.161293, 0.4319618, 0, 0, 0, 1, 1,
1.416255, -0.7730749, 2.099599, 0, 0, 0, 1, 1,
1.419361, 0.08656336, 1.420063, 0, 0, 0, 1, 1,
1.444232, 0.3519774, 1.23124, 0, 0, 0, 1, 1,
1.453157, 0.6435728, -0.05581811, 0, 0, 0, 1, 1,
1.46473, 1.5216, 0.7244332, 0, 0, 0, 1, 1,
1.474905, 0.4876031, 2.27473, 0, 0, 0, 1, 1,
1.493514, 0.5591682, 1.28768, 1, 1, 1, 1, 1,
1.500033, -0.1856633, 1.364502, 1, 1, 1, 1, 1,
1.501185, -0.4158139, 1.933866, 1, 1, 1, 1, 1,
1.505981, 0.7509435, 0.05721391, 1, 1, 1, 1, 1,
1.506837, 1.030312, 2.459389, 1, 1, 1, 1, 1,
1.507025, 1.310205, 0.9963683, 1, 1, 1, 1, 1,
1.517535, -0.6303771, 1.645083, 1, 1, 1, 1, 1,
1.517894, 1.759055, 0.6801364, 1, 1, 1, 1, 1,
1.528839, -1.070547, 2.49791, 1, 1, 1, 1, 1,
1.54551, -0.6258038, 2.153411, 1, 1, 1, 1, 1,
1.57107, 1.272364, -0.05956456, 1, 1, 1, 1, 1,
1.578959, -2.115309, 2.185464, 1, 1, 1, 1, 1,
1.587256, -1.546402, 4.507802, 1, 1, 1, 1, 1,
1.591002, 0.8388578, 1.442448, 1, 1, 1, 1, 1,
1.594415, -0.1575129, 1.59857, 1, 1, 1, 1, 1,
1.599551, 0.2595004, 2.430151, 0, 0, 1, 1, 1,
1.614518, 0.7788208, 1.274011, 1, 0, 0, 1, 1,
1.616833, 0.5790986, 1.457959, 1, 0, 0, 1, 1,
1.648382, -0.5421016, 1.550703, 1, 0, 0, 1, 1,
1.649334, 2.210361, 2.599885, 1, 0, 0, 1, 1,
1.652062, 0.3945825, 0.1384366, 1, 0, 0, 1, 1,
1.654123, -0.5191558, 1.074799, 0, 0, 0, 1, 1,
1.660217, -0.6216451, 3.979474, 0, 0, 0, 1, 1,
1.669212, 1.869548, -0.767984, 0, 0, 0, 1, 1,
1.699115, -1.116867, -0.6448359, 0, 0, 0, 1, 1,
1.715498, -0.5927292, 1.759357, 0, 0, 0, 1, 1,
1.724935, -1.8891, 2.843073, 0, 0, 0, 1, 1,
1.73404, 1.418938, 0.3955893, 0, 0, 0, 1, 1,
1.754382, -1.207038, 3.4661, 1, 1, 1, 1, 1,
1.758948, 2.153558, 0.5599018, 1, 1, 1, 1, 1,
1.781127, 0.4294112, 3.361762, 1, 1, 1, 1, 1,
1.806249, -0.1457671, 2.337914, 1, 1, 1, 1, 1,
1.808696, 0.5612584, 1.286992, 1, 1, 1, 1, 1,
1.81208, -0.3238803, 2.508001, 1, 1, 1, 1, 1,
1.85832, 0.7379158, 1.36104, 1, 1, 1, 1, 1,
1.878717, 1.580554, 2.842893, 1, 1, 1, 1, 1,
1.901296, 1.529098, 0.3699214, 1, 1, 1, 1, 1,
1.918957, 2.730731, 0.4313388, 1, 1, 1, 1, 1,
1.929321, 0.06992581, 0.4294761, 1, 1, 1, 1, 1,
1.934854, -0.4989764, 1.622347, 1, 1, 1, 1, 1,
1.980979, -1.439949, 3.071841, 1, 1, 1, 1, 1,
1.990527, -1.457363, 2.501125, 1, 1, 1, 1, 1,
2.001104, 0.5295041, 0.6687713, 1, 1, 1, 1, 1,
2.071449, 1.529954, 1.064908, 0, 0, 1, 1, 1,
2.074634, -0.9015313, 1.002463, 1, 0, 0, 1, 1,
2.082961, -0.9302534, 3.178726, 1, 0, 0, 1, 1,
2.109235, 0.9328336, 2.272277, 1, 0, 0, 1, 1,
2.124915, 1.357402, 0.6581382, 1, 0, 0, 1, 1,
2.144643, 1.115789, 1.096023, 1, 0, 0, 1, 1,
2.158072, -0.4385857, 2.686133, 0, 0, 0, 1, 1,
2.161514, -1.147595, 1.793844, 0, 0, 0, 1, 1,
2.18968, -1.170639, 2.371435, 0, 0, 0, 1, 1,
2.199202, -0.2255673, 2.860408, 0, 0, 0, 1, 1,
2.204714, -0.367585, 2.215738, 0, 0, 0, 1, 1,
2.259202, 0.1366611, 1.224543, 0, 0, 0, 1, 1,
2.313093, -0.0216702, 2.251392, 0, 0, 0, 1, 1,
2.340463, 1.479504, 2.181396, 1, 1, 1, 1, 1,
2.362139, 1.352856, 0.9470664, 1, 1, 1, 1, 1,
2.500273, -0.7059512, 2.515776, 1, 1, 1, 1, 1,
2.506199, -0.3997189, 1.904821, 1, 1, 1, 1, 1,
2.698496, -0.03503596, 2.207909, 1, 1, 1, 1, 1,
2.758321, 2.29099, 0.1899247, 1, 1, 1, 1, 1,
2.795309, -0.0450655, 1.109428, 1, 1, 1, 1, 1
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
var radius = 9.040716;
var distance = 31.75513;
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
mvMatrix.translate( 0.07037127, 0.02945685, 0.2236526 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.75513);
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
