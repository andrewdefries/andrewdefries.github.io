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
-3.857798, 0.1837552, -1.009957, 1, 0, 0, 1,
-2.865272, 0.1845969, -1.745326, 1, 0.007843138, 0, 1,
-2.709268, 0.4566349, -0.0006779853, 1, 0.01176471, 0, 1,
-2.673163, -2.162721, -1.201497, 1, 0.01960784, 0, 1,
-2.66784, 0.3673572, -3.150203, 1, 0.02352941, 0, 1,
-2.622868, -1.747995, -2.526075, 1, 0.03137255, 0, 1,
-2.603004, 1.606639, -1.363223, 1, 0.03529412, 0, 1,
-2.597443, 1.826719, -2.013391, 1, 0.04313726, 0, 1,
-2.52213, -0.7860177, -1.68224, 1, 0.04705882, 0, 1,
-2.520875, -2.047001, -1.607381, 1, 0.05490196, 0, 1,
-2.481949, 0.8501215, -0.5721056, 1, 0.05882353, 0, 1,
-2.312874, -0.4119828, -1.077412, 1, 0.06666667, 0, 1,
-2.311763, -0.9890207, -1.656986, 1, 0.07058824, 0, 1,
-2.290127, -0.7466885, -2.486445, 1, 0.07843138, 0, 1,
-2.280929, -0.166658, -0.8574026, 1, 0.08235294, 0, 1,
-2.247645, 0.5240009, -0.7861314, 1, 0.09019608, 0, 1,
-2.181196, 0.3115579, -1.53753, 1, 0.09411765, 0, 1,
-2.179827, 0.5119865, -1.385088, 1, 0.1019608, 0, 1,
-2.173951, -1.52625, 0.381463, 1, 0.1098039, 0, 1,
-2.154434, 0.4128415, -2.11908, 1, 0.1137255, 0, 1,
-2.149435, 0.9039696, -1.502818, 1, 0.1215686, 0, 1,
-2.124207, -0.7307807, 0.4571106, 1, 0.1254902, 0, 1,
-2.117488, 0.7912462, -0.4860367, 1, 0.1333333, 0, 1,
-2.101556, 0.5267028, 0.7560623, 1, 0.1372549, 0, 1,
-2.057219, -1.944047, -3.200444, 1, 0.145098, 0, 1,
-2.054234, 0.020112, 0.3119946, 1, 0.1490196, 0, 1,
-2.032246, 0.4954448, 0.2369818, 1, 0.1568628, 0, 1,
-2.024496, 0.4252402, -0.8270617, 1, 0.1607843, 0, 1,
-2.017685, -2.341728, -2.321039, 1, 0.1686275, 0, 1,
-1.981484, 0.8544238, 1.086538, 1, 0.172549, 0, 1,
-1.964806, -0.8425992, -1.137213, 1, 0.1803922, 0, 1,
-1.908945, -0.7015891, -3.291521, 1, 0.1843137, 0, 1,
-1.888758, 0.7825163, -1.483986, 1, 0.1921569, 0, 1,
-1.88505, 1.833257, -1.775894, 1, 0.1960784, 0, 1,
-1.877212, -1.047527, -1.39566, 1, 0.2039216, 0, 1,
-1.87382, 1.245818, -2.519991, 1, 0.2117647, 0, 1,
-1.871267, -1.728171, -2.23077, 1, 0.2156863, 0, 1,
-1.868168, -1.22174, -2.870895, 1, 0.2235294, 0, 1,
-1.857994, 0.73602, -0.3049352, 1, 0.227451, 0, 1,
-1.850701, 0.327873, 0.06493811, 1, 0.2352941, 0, 1,
-1.841252, 1.0115, -2.449207, 1, 0.2392157, 0, 1,
-1.83415, -0.6963056, -2.318709, 1, 0.2470588, 0, 1,
-1.821953, 0.8010313, 0.5471578, 1, 0.2509804, 0, 1,
-1.808632, -0.1819614, -2.030101, 1, 0.2588235, 0, 1,
-1.801554, 1.219507, -1.031218, 1, 0.2627451, 0, 1,
-1.794191, 1.083872, -0.3504575, 1, 0.2705882, 0, 1,
-1.788323, -0.4278066, -2.217825, 1, 0.2745098, 0, 1,
-1.780541, -0.04807412, -1.664213, 1, 0.282353, 0, 1,
-1.778457, 0.3419714, -1.300121, 1, 0.2862745, 0, 1,
-1.778311, 1.703883, -0.9978694, 1, 0.2941177, 0, 1,
-1.772319, 0.4617883, -1.082477, 1, 0.3019608, 0, 1,
-1.761775, 0.01513627, -1.344094, 1, 0.3058824, 0, 1,
-1.752606, 0.4822044, 0.4675143, 1, 0.3137255, 0, 1,
-1.748099, -0.9181997, -0.5911521, 1, 0.3176471, 0, 1,
-1.71301, 0.984953, -0.6013445, 1, 0.3254902, 0, 1,
-1.705622, 1.029532, -1.170444, 1, 0.3294118, 0, 1,
-1.700292, -0.1141964, -2.135061, 1, 0.3372549, 0, 1,
-1.663588, -2.21034, -1.462653, 1, 0.3411765, 0, 1,
-1.660304, 1.303728, -1.96601, 1, 0.3490196, 0, 1,
-1.65757, -1.568472, -2.513644, 1, 0.3529412, 0, 1,
-1.65591, -1.048095, -2.352543, 1, 0.3607843, 0, 1,
-1.654, 0.5969338, -1.637366, 1, 0.3647059, 0, 1,
-1.651069, 0.5998619, -3.43544, 1, 0.372549, 0, 1,
-1.646882, 0.1757615, -1.222094, 1, 0.3764706, 0, 1,
-1.639439, 0.1176322, -2.88675, 1, 0.3843137, 0, 1,
-1.628837, -2.530059, -1.874721, 1, 0.3882353, 0, 1,
-1.618393, 0.4913905, -1.750959, 1, 0.3960784, 0, 1,
-1.598316, 0.8272876, -0.3307786, 1, 0.4039216, 0, 1,
-1.594493, 0.4137283, -1.474187, 1, 0.4078431, 0, 1,
-1.588031, 0.5521415, -1.602411, 1, 0.4156863, 0, 1,
-1.577867, -0.8127652, -2.851017, 1, 0.4196078, 0, 1,
-1.576788, -1.544529, -1.889965, 1, 0.427451, 0, 1,
-1.57373, 0.8622725, -2.193461, 1, 0.4313726, 0, 1,
-1.572925, 1.248886, -0.6540953, 1, 0.4392157, 0, 1,
-1.56641, -0.5185392, -2.139899, 1, 0.4431373, 0, 1,
-1.558458, 0.947529, -1.45212, 1, 0.4509804, 0, 1,
-1.524462, -0.6502824, -1.560748, 1, 0.454902, 0, 1,
-1.5223, 0.8295012, -1.487942, 1, 0.4627451, 0, 1,
-1.516747, 1.095556, -1.138823, 1, 0.4666667, 0, 1,
-1.516339, -0.5974892, -0.5287598, 1, 0.4745098, 0, 1,
-1.516323, -1.127103, -0.7471902, 1, 0.4784314, 0, 1,
-1.515644, -0.901078, -3.142088, 1, 0.4862745, 0, 1,
-1.476889, 1.423268, -1.958739, 1, 0.4901961, 0, 1,
-1.474526, -0.8082716, -3.834989, 1, 0.4980392, 0, 1,
-1.466691, 0.2810539, -2.288492, 1, 0.5058824, 0, 1,
-1.466601, 0.5795, -1.372104, 1, 0.509804, 0, 1,
-1.461665, 0.3660459, -0.7467412, 1, 0.5176471, 0, 1,
-1.458398, -0.7176574, -1.825253, 1, 0.5215687, 0, 1,
-1.448848, -1.753964, -3.740811, 1, 0.5294118, 0, 1,
-1.444073, -0.8693554, -1.355051, 1, 0.5333334, 0, 1,
-1.427565, 1.237428, -1.504334, 1, 0.5411765, 0, 1,
-1.415047, -0.2220844, -2.265948, 1, 0.5450981, 0, 1,
-1.413157, -0.07280581, -1.959954, 1, 0.5529412, 0, 1,
-1.412506, -0.05330231, -0.6502459, 1, 0.5568628, 0, 1,
-1.411318, 0.1370177, -0.1986942, 1, 0.5647059, 0, 1,
-1.402745, 0.8412828, -1.465332, 1, 0.5686275, 0, 1,
-1.393868, -0.8469121, -2.84428, 1, 0.5764706, 0, 1,
-1.374953, 0.4269775, -1.637679, 1, 0.5803922, 0, 1,
-1.373796, 0.4809426, -0.2461888, 1, 0.5882353, 0, 1,
-1.365276, 0.2073975, -0.6478692, 1, 0.5921569, 0, 1,
-1.336426, -0.05530451, -2.54422, 1, 0.6, 0, 1,
-1.333671, -1.398269, -2.670805, 1, 0.6078432, 0, 1,
-1.327177, -0.2045366, -1.957948, 1, 0.6117647, 0, 1,
-1.316733, -0.4657688, -2.790517, 1, 0.6196079, 0, 1,
-1.304309, 1.353139, -0.9608015, 1, 0.6235294, 0, 1,
-1.300007, -0.1003184, -1.038518, 1, 0.6313726, 0, 1,
-1.296214, -0.2899578, -2.871779, 1, 0.6352941, 0, 1,
-1.293003, -0.1127718, -1.790188, 1, 0.6431373, 0, 1,
-1.275679, 0.7710302, -0.594575, 1, 0.6470588, 0, 1,
-1.27362, -2.263823, -2.081856, 1, 0.654902, 0, 1,
-1.272063, 0.1747948, -2.264692, 1, 0.6588235, 0, 1,
-1.264508, 0.7743905, -0.4962202, 1, 0.6666667, 0, 1,
-1.262004, -0.2114427, -0.7566538, 1, 0.6705883, 0, 1,
-1.259634, 0.4582956, -2.361739, 1, 0.6784314, 0, 1,
-1.258135, 0.06981851, -1.227354, 1, 0.682353, 0, 1,
-1.255867, -1.321793, -2.030889, 1, 0.6901961, 0, 1,
-1.237663, -0.5877479, -2.285994, 1, 0.6941177, 0, 1,
-1.233716, -0.9218335, -0.8996334, 1, 0.7019608, 0, 1,
-1.225975, 0.5717521, -0.3005114, 1, 0.7098039, 0, 1,
-1.225243, 1.375302, 0.5476576, 1, 0.7137255, 0, 1,
-1.21355, -0.3497546, -1.373301, 1, 0.7215686, 0, 1,
-1.204291, -0.5610087, -2.359005, 1, 0.7254902, 0, 1,
-1.197009, -1.642011, -2.394203, 1, 0.7333333, 0, 1,
-1.188554, 1.090999, -0.5314269, 1, 0.7372549, 0, 1,
-1.170284, 0.2071676, -1.817633, 1, 0.7450981, 0, 1,
-1.168982, 0.7824295, -0.1337018, 1, 0.7490196, 0, 1,
-1.156861, -0.171722, -3.013646, 1, 0.7568628, 0, 1,
-1.156723, 0.1125809, -1.831091, 1, 0.7607843, 0, 1,
-1.154867, -0.5343705, -2.109048, 1, 0.7686275, 0, 1,
-1.152787, -0.09287553, -3.111377, 1, 0.772549, 0, 1,
-1.141558, -0.9599396, -2.860369, 1, 0.7803922, 0, 1,
-1.122047, 0.3334536, -1.734929, 1, 0.7843137, 0, 1,
-1.118861, 0.3041932, -1.018983, 1, 0.7921569, 0, 1,
-1.111447, 0.6904292, -1.498183, 1, 0.7960784, 0, 1,
-1.107602, 0.2378026, -1.662966, 1, 0.8039216, 0, 1,
-1.102847, -0.5723805, -2.388542, 1, 0.8117647, 0, 1,
-1.100882, -0.340958, -2.108531, 1, 0.8156863, 0, 1,
-1.094248, -0.7768227, -3.613472, 1, 0.8235294, 0, 1,
-1.085941, 0.4128073, -1.782195, 1, 0.827451, 0, 1,
-1.08558, 0.7045867, -1.915548, 1, 0.8352941, 0, 1,
-1.083367, 2.140717, -1.08919, 1, 0.8392157, 0, 1,
-1.076852, 1.46688, -0.6308882, 1, 0.8470588, 0, 1,
-1.060001, 0.9087096, -0.1051642, 1, 0.8509804, 0, 1,
-1.059796, 0.05028887, -1.354842, 1, 0.8588235, 0, 1,
-1.056644, 0.8569258, -1.326353, 1, 0.8627451, 0, 1,
-1.047777, -2.013527, -4.631809, 1, 0.8705882, 0, 1,
-1.045636, 0.7113875, -2.293297, 1, 0.8745098, 0, 1,
-1.040713, -0.1517372, -1.186437, 1, 0.8823529, 0, 1,
-1.040315, -1.052244, 0.9176689, 1, 0.8862745, 0, 1,
-1.040293, 0.1915407, -2.762747, 1, 0.8941177, 0, 1,
-1.039591, 1.122815, -0.6036441, 1, 0.8980392, 0, 1,
-1.037761, 0.543231, -1.152136, 1, 0.9058824, 0, 1,
-1.032174, 0.5239387, -1.538819, 1, 0.9137255, 0, 1,
-1.0313, 0.6378464, -0.6224654, 1, 0.9176471, 0, 1,
-1.029122, 0.2049939, -2.370128, 1, 0.9254902, 0, 1,
-1.025281, -0.1417537, -1.974335, 1, 0.9294118, 0, 1,
-1.018859, -0.03412991, -1.22881, 1, 0.9372549, 0, 1,
-1.017474, -1.093091, -2.652391, 1, 0.9411765, 0, 1,
-1.017279, -0.3591592, -1.595616, 1, 0.9490196, 0, 1,
-1.009835, 0.378951, 0.4319884, 1, 0.9529412, 0, 1,
-1.006466, -1.263527, -3.295354, 1, 0.9607843, 0, 1,
-1.004509, -1.424495, -3.288262, 1, 0.9647059, 0, 1,
-1.004418, -2.439645, -1.491893, 1, 0.972549, 0, 1,
-1.004205, 1.359236, 0.2040068, 1, 0.9764706, 0, 1,
-1.003729, 0.1266013, -0.2074157, 1, 0.9843137, 0, 1,
-0.9982601, -2.150746, -3.447967, 1, 0.9882353, 0, 1,
-0.9936018, 1.725446, -1.095359, 1, 0.9960784, 0, 1,
-0.9917858, -0.9669677, -1.475976, 0.9960784, 1, 0, 1,
-0.9911183, 0.2373521, 0.1181858, 0.9921569, 1, 0, 1,
-0.9854838, -0.1153933, -2.843181, 0.9843137, 1, 0, 1,
-0.9763557, -1.592347, -2.848597, 0.9803922, 1, 0, 1,
-0.9756234, -0.4902143, -0.3546406, 0.972549, 1, 0, 1,
-0.9751267, -1.01432, -0.7139739, 0.9686275, 1, 0, 1,
-0.9622566, 1.738932, -1.095627, 0.9607843, 1, 0, 1,
-0.9579266, 0.03899611, -2.139227, 0.9568627, 1, 0, 1,
-0.957914, -0.1132174, -0.8848445, 0.9490196, 1, 0, 1,
-0.9549112, 1.297621, -0.9185199, 0.945098, 1, 0, 1,
-0.9543501, 1.187349, -1.583561, 0.9372549, 1, 0, 1,
-0.9455446, -0.8931935, -1.412512, 0.9333333, 1, 0, 1,
-0.9445366, 0.275352, -3.279387, 0.9254902, 1, 0, 1,
-0.9312183, -0.4221056, -3.492146, 0.9215686, 1, 0, 1,
-0.9184831, -0.8894755, -2.965657, 0.9137255, 1, 0, 1,
-0.9137928, 0.07506903, -0.6511946, 0.9098039, 1, 0, 1,
-0.9020867, 0.9271061, -1.08683, 0.9019608, 1, 0, 1,
-0.9017284, -0.1780093, 1.915779, 0.8941177, 1, 0, 1,
-0.8944659, -1.845643, -3.467764, 0.8901961, 1, 0, 1,
-0.8880094, 0.6895013, -0.5123037, 0.8823529, 1, 0, 1,
-0.8862063, -1.334887, -1.249708, 0.8784314, 1, 0, 1,
-0.8750897, 1.078855, -0.4113122, 0.8705882, 1, 0, 1,
-0.8691431, 0.423694, -2.888681, 0.8666667, 1, 0, 1,
-0.8624837, -0.7069893, -3.224504, 0.8588235, 1, 0, 1,
-0.8621529, 3.165288, -0.9052773, 0.854902, 1, 0, 1,
-0.8613456, -2.172966, -1.45783, 0.8470588, 1, 0, 1,
-0.8576137, 0.6950194, -1.07649, 0.8431373, 1, 0, 1,
-0.8554876, 0.4394791, -2.47093, 0.8352941, 1, 0, 1,
-0.8482231, 1.305223, -0.1967002, 0.8313726, 1, 0, 1,
-0.8388108, -1.098747, -0.8730081, 0.8235294, 1, 0, 1,
-0.83447, -0.9150632, -1.204778, 0.8196079, 1, 0, 1,
-0.8340316, 0.08922872, 0.5388471, 0.8117647, 1, 0, 1,
-0.826764, 0.07882639, -0.908486, 0.8078431, 1, 0, 1,
-0.8212835, 1.351934, -0.6963392, 0.8, 1, 0, 1,
-0.821149, -0.8225242, -2.340008, 0.7921569, 1, 0, 1,
-0.8190106, -1.526175, -2.4025, 0.7882353, 1, 0, 1,
-0.8189768, 0.4821739, -3.132163, 0.7803922, 1, 0, 1,
-0.8046836, 1.936122, -1.362702, 0.7764706, 1, 0, 1,
-0.8027667, 0.9550843, -0.265021, 0.7686275, 1, 0, 1,
-0.7989274, 1.223121, -0.1412739, 0.7647059, 1, 0, 1,
-0.7985912, -1.71745, -2.567337, 0.7568628, 1, 0, 1,
-0.7940833, -0.07570621, -2.442366, 0.7529412, 1, 0, 1,
-0.7924182, 0.348994, -1.391676, 0.7450981, 1, 0, 1,
-0.7917357, 0.08455821, -1.273804, 0.7411765, 1, 0, 1,
-0.7888539, 0.8369303, 0.3639674, 0.7333333, 1, 0, 1,
-0.7864015, -1.80785, -2.697714, 0.7294118, 1, 0, 1,
-0.784951, -1.065134, -2.539153, 0.7215686, 1, 0, 1,
-0.7822724, 0.1295113, -0.111508, 0.7176471, 1, 0, 1,
-0.7796904, -0.2144598, 0.3989266, 0.7098039, 1, 0, 1,
-0.7765692, 0.1065391, -2.692154, 0.7058824, 1, 0, 1,
-0.7739207, -0.1047053, -1.439059, 0.6980392, 1, 0, 1,
-0.7699892, 0.5873167, -1.062984, 0.6901961, 1, 0, 1,
-0.7663581, 0.7328319, -0.6759749, 0.6862745, 1, 0, 1,
-0.766003, 1.007233, -1.528291, 0.6784314, 1, 0, 1,
-0.7658679, 0.8274095, -2.654832, 0.6745098, 1, 0, 1,
-0.760756, -0.0689938, -2.14509, 0.6666667, 1, 0, 1,
-0.7599738, 1.672287, 0.01136843, 0.6627451, 1, 0, 1,
-0.757642, 1.866603, -0.7973769, 0.654902, 1, 0, 1,
-0.7510403, -1.833472, -2.392145, 0.6509804, 1, 0, 1,
-0.7400501, -0.5065303, -4.394366, 0.6431373, 1, 0, 1,
-0.7399949, 0.6829039, -1.236216, 0.6392157, 1, 0, 1,
-0.7377335, 0.6484056, -1.460707, 0.6313726, 1, 0, 1,
-0.7331484, 1.675395, -1.528341, 0.627451, 1, 0, 1,
-0.7308655, -1.142576, -2.020023, 0.6196079, 1, 0, 1,
-0.7273026, 0.5648326, 0.4705959, 0.6156863, 1, 0, 1,
-0.7260942, 1.877164, -1.225725, 0.6078432, 1, 0, 1,
-0.7220739, 0.8926725, 0.01200383, 0.6039216, 1, 0, 1,
-0.7126853, -1.717985, -4.47186, 0.5960785, 1, 0, 1,
-0.7107037, 1.149184, -0.5817779, 0.5882353, 1, 0, 1,
-0.7062219, -1.746087, -3.316153, 0.5843138, 1, 0, 1,
-0.6974913, 0.2653086, -0.9143358, 0.5764706, 1, 0, 1,
-0.6877569, 0.04204321, -2.012496, 0.572549, 1, 0, 1,
-0.6848685, -0.133871, -0.9031982, 0.5647059, 1, 0, 1,
-0.6836615, -0.4505583, -1.628798, 0.5607843, 1, 0, 1,
-0.683475, -0.5192924, -2.157687, 0.5529412, 1, 0, 1,
-0.6805838, 1.725625, 0.1835309, 0.5490196, 1, 0, 1,
-0.6789325, -1.228159, -4.036802, 0.5411765, 1, 0, 1,
-0.677901, -0.02420881, -0.3968776, 0.5372549, 1, 0, 1,
-0.6720275, -0.5890776, -2.62785, 0.5294118, 1, 0, 1,
-0.6712621, -0.5534925, -1.977505, 0.5254902, 1, 0, 1,
-0.6710676, 1.878437, -0.4163732, 0.5176471, 1, 0, 1,
-0.6708399, 1.042331, 0.5657406, 0.5137255, 1, 0, 1,
-0.6700433, 0.5879492, 0.5562326, 0.5058824, 1, 0, 1,
-0.6696161, 0.3382998, -1.063373, 0.5019608, 1, 0, 1,
-0.6595173, -0.2255672, -1.870394, 0.4941176, 1, 0, 1,
-0.6571311, -0.5608863, -2.203119, 0.4862745, 1, 0, 1,
-0.6557192, -0.5175896, -2.074355, 0.4823529, 1, 0, 1,
-0.6507999, -1.489983, -3.013667, 0.4745098, 1, 0, 1,
-0.6506884, -0.0110876, -1.727892, 0.4705882, 1, 0, 1,
-0.6506482, -0.21255, -2.988548, 0.4627451, 1, 0, 1,
-0.6497166, -0.4032187, -1.188714, 0.4588235, 1, 0, 1,
-0.647553, -2.162231, -3.432544, 0.4509804, 1, 0, 1,
-0.6462458, 0.3015617, -0.8591919, 0.4470588, 1, 0, 1,
-0.6451334, 0.2583561, 0.510056, 0.4392157, 1, 0, 1,
-0.6434335, -0.9053245, -2.507982, 0.4352941, 1, 0, 1,
-0.6359245, -2.437192, -3.534467, 0.427451, 1, 0, 1,
-0.6295412, -0.1480057, -4.10957, 0.4235294, 1, 0, 1,
-0.6274944, -0.961073, -3.994402, 0.4156863, 1, 0, 1,
-0.6263152, 1.386047, 0.7227663, 0.4117647, 1, 0, 1,
-0.6212074, -0.7359266, -2.818599, 0.4039216, 1, 0, 1,
-0.6162413, -0.6286569, -1.872904, 0.3960784, 1, 0, 1,
-0.6140334, -0.9508864, -2.181919, 0.3921569, 1, 0, 1,
-0.598523, 0.7098722, -1.00341, 0.3843137, 1, 0, 1,
-0.5980318, 1.920182, -0.7498372, 0.3803922, 1, 0, 1,
-0.5968339, -0.6942647, -1.492406, 0.372549, 1, 0, 1,
-0.594474, -0.8583853, -0.4113772, 0.3686275, 1, 0, 1,
-0.5909657, -1.194755, -1.246636, 0.3607843, 1, 0, 1,
-0.5909104, 1.090337, -2.217046, 0.3568628, 1, 0, 1,
-0.5816274, 0.5364332, 0.6493953, 0.3490196, 1, 0, 1,
-0.568656, -1.736109, -2.501175, 0.345098, 1, 0, 1,
-0.5643353, -0.8541358, -2.777568, 0.3372549, 1, 0, 1,
-0.5638683, 0.9249005, 0.8627006, 0.3333333, 1, 0, 1,
-0.5623909, -0.3726656, -3.158176, 0.3254902, 1, 0, 1,
-0.5619199, -0.1793269, -2.331206, 0.3215686, 1, 0, 1,
-0.5612327, -0.306229, -1.446631, 0.3137255, 1, 0, 1,
-0.5578588, 1.512362, -3.010867, 0.3098039, 1, 0, 1,
-0.5555353, -0.01202106, -1.372157, 0.3019608, 1, 0, 1,
-0.5540228, -0.09503391, -2.250187, 0.2941177, 1, 0, 1,
-0.5524009, -1.406395, -0.7523588, 0.2901961, 1, 0, 1,
-0.5500454, -0.1043757, -2.011105, 0.282353, 1, 0, 1,
-0.5439469, -0.4847987, -1.787684, 0.2784314, 1, 0, 1,
-0.5395601, -0.5464031, -2.741911, 0.2705882, 1, 0, 1,
-0.5357494, 1.629201, 0.250726, 0.2666667, 1, 0, 1,
-0.5325125, 0.2437384, -3.120886, 0.2588235, 1, 0, 1,
-0.5299138, -0.3567797, -1.475515, 0.254902, 1, 0, 1,
-0.5298439, 0.03689201, -0.9675957, 0.2470588, 1, 0, 1,
-0.5288693, 1.096812, 0.1725058, 0.2431373, 1, 0, 1,
-0.5245867, -0.5861475, -2.985989, 0.2352941, 1, 0, 1,
-0.5229067, 1.14739, 0.08561134, 0.2313726, 1, 0, 1,
-0.5200427, 0.7227882, -2.253166, 0.2235294, 1, 0, 1,
-0.5129049, 1.066524, -0.714674, 0.2196078, 1, 0, 1,
-0.5107412, 0.6633787, -2.623227, 0.2117647, 1, 0, 1,
-0.5096152, -0.6091155, -1.576524, 0.2078431, 1, 0, 1,
-0.5042673, -0.050466, -1.061374, 0.2, 1, 0, 1,
-0.5032353, 1.254247, -3.532873, 0.1921569, 1, 0, 1,
-0.4965504, -0.1379336, -1.503026, 0.1882353, 1, 0, 1,
-0.4955066, 0.07042164, -2.67606, 0.1803922, 1, 0, 1,
-0.4805922, -0.07470615, -1.869661, 0.1764706, 1, 0, 1,
-0.480421, 0.6988674, -2.286595, 0.1686275, 1, 0, 1,
-0.4757273, 0.9083467, -0.3433186, 0.1647059, 1, 0, 1,
-0.4753628, 0.637039, -0.5707022, 0.1568628, 1, 0, 1,
-0.4721112, 0.4437637, 0.1982282, 0.1529412, 1, 0, 1,
-0.4698798, -0.1921196, -1.599591, 0.145098, 1, 0, 1,
-0.4698351, 0.3869122, 0.3455572, 0.1411765, 1, 0, 1,
-0.4687363, -2.436567, -2.864907, 0.1333333, 1, 0, 1,
-0.4658059, 1.273406, 0.04735778, 0.1294118, 1, 0, 1,
-0.4610285, 0.02427362, -2.930303, 0.1215686, 1, 0, 1,
-0.4607594, -0.4458882, -1.265702, 0.1176471, 1, 0, 1,
-0.4586961, -0.2232237, -2.949578, 0.1098039, 1, 0, 1,
-0.4525623, 0.8884399, -0.8984111, 0.1058824, 1, 0, 1,
-0.4521788, -0.7760698, -3.34725, 0.09803922, 1, 0, 1,
-0.452115, 0.6085063, -1.576654, 0.09019608, 1, 0, 1,
-0.4484878, -1.643336, -2.219738, 0.08627451, 1, 0, 1,
-0.4480179, -0.3080519, -2.990394, 0.07843138, 1, 0, 1,
-0.4477689, 0.7290223, -0.1270652, 0.07450981, 1, 0, 1,
-0.4422311, 0.6834064, -3.361086, 0.06666667, 1, 0, 1,
-0.4406666, -0.545932, -3.940585, 0.0627451, 1, 0, 1,
-0.4393263, -0.4841794, -1.792361, 0.05490196, 1, 0, 1,
-0.4380913, -0.4943307, -2.630482, 0.05098039, 1, 0, 1,
-0.4377656, -0.4625124, -3.223973, 0.04313726, 1, 0, 1,
-0.4367229, -0.02175002, -2.646186, 0.03921569, 1, 0, 1,
-0.4354224, 1.225743, -0.9417044, 0.03137255, 1, 0, 1,
-0.430963, 0.280137, -1.373244, 0.02745098, 1, 0, 1,
-0.4285274, -0.204386, -2.177201, 0.01960784, 1, 0, 1,
-0.4279781, -0.9139144, -2.072208, 0.01568628, 1, 0, 1,
-0.4273804, 1.172474, -0.8967411, 0.007843138, 1, 0, 1,
-0.4169215, 0.628333, -0.3784995, 0.003921569, 1, 0, 1,
-0.4121954, -0.5915844, -3.531683, 0, 1, 0.003921569, 1,
-0.4071687, 1.572154, 1.210957, 0, 1, 0.01176471, 1,
-0.4060416, 0.2200529, -0.1645142, 0, 1, 0.01568628, 1,
-0.4016998, -1.601602, -1.842345, 0, 1, 0.02352941, 1,
-0.3987868, 0.7816117, -0.6979462, 0, 1, 0.02745098, 1,
-0.3946534, -0.8919563, -1.816245, 0, 1, 0.03529412, 1,
-0.3917872, 2.864967, -0.6659752, 0, 1, 0.03921569, 1,
-0.3875041, -0.4120996, -4.212447, 0, 1, 0.04705882, 1,
-0.3854054, 0.6220636, -2.004523, 0, 1, 0.05098039, 1,
-0.3818628, 1.111369, -0.8499529, 0, 1, 0.05882353, 1,
-0.3816495, 1.756474, 0.1962713, 0, 1, 0.0627451, 1,
-0.3807523, 1.114327, 0.2422974, 0, 1, 0.07058824, 1,
-0.3774232, 1.106739, -0.9496716, 0, 1, 0.07450981, 1,
-0.3753689, -1.939881, -3.672385, 0, 1, 0.08235294, 1,
-0.3743145, -2.177472, -1.987356, 0, 1, 0.08627451, 1,
-0.3646886, -0.3632307, -1.772559, 0, 1, 0.09411765, 1,
-0.3622877, -0.1044516, -2.786827, 0, 1, 0.1019608, 1,
-0.361152, 0.01421688, -2.482791, 0, 1, 0.1058824, 1,
-0.3568596, -0.3612877, -1.257931, 0, 1, 0.1137255, 1,
-0.3562948, -1.418943, -2.644116, 0, 1, 0.1176471, 1,
-0.3503408, -0.311216, -3.008399, 0, 1, 0.1254902, 1,
-0.345797, 0.4137972, -0.4854744, 0, 1, 0.1294118, 1,
-0.3370497, 0.006909827, -1.866737, 0, 1, 0.1372549, 1,
-0.3299901, -0.01191578, -2.37936, 0, 1, 0.1411765, 1,
-0.3298341, -0.4317203, -2.447259, 0, 1, 0.1490196, 1,
-0.3295012, -0.4308199, -1.669971, 0, 1, 0.1529412, 1,
-0.3285002, 0.610567, 1.53902, 0, 1, 0.1607843, 1,
-0.3225771, 1.094218, -1.279057, 0, 1, 0.1647059, 1,
-0.3179844, -0.8452702, -2.426323, 0, 1, 0.172549, 1,
-0.3172162, -0.5125182, -2.735651, 0, 1, 0.1764706, 1,
-0.3166905, 0.002117438, -2.075756, 0, 1, 0.1843137, 1,
-0.3145426, 0.8540851, -0.6602633, 0, 1, 0.1882353, 1,
-0.3066012, -0.6811675, -2.230223, 0, 1, 0.1960784, 1,
-0.3052876, -0.03354736, -1.165072, 0, 1, 0.2039216, 1,
-0.3044392, 0.2564211, -0.7683933, 0, 1, 0.2078431, 1,
-0.3015149, -0.1144574, -2.816462, 0, 1, 0.2156863, 1,
-0.2987122, -0.744122, -4.18689, 0, 1, 0.2196078, 1,
-0.2934507, -1.046029, -1.642642, 0, 1, 0.227451, 1,
-0.292482, 1.066445, 0.08212169, 0, 1, 0.2313726, 1,
-0.2880599, 0.5897282, -1.861261, 0, 1, 0.2392157, 1,
-0.2844737, 0.7005574, 0.3876057, 0, 1, 0.2431373, 1,
-0.2839598, -1.492925, -3.05741, 0, 1, 0.2509804, 1,
-0.2755316, 1.467813, -0.7313156, 0, 1, 0.254902, 1,
-0.2665481, 1.517135, -1.444871, 0, 1, 0.2627451, 1,
-0.2660685, -1.466937, -2.837408, 0, 1, 0.2666667, 1,
-0.2651884, -0.8754658, -1.484111, 0, 1, 0.2745098, 1,
-0.256709, -1.116418, -3.576929, 0, 1, 0.2784314, 1,
-0.2562449, 0.1273575, -0.900782, 0, 1, 0.2862745, 1,
-0.2507176, -0.1305302, -2.217861, 0, 1, 0.2901961, 1,
-0.2491043, -2.133089, -2.145978, 0, 1, 0.2980392, 1,
-0.2482154, -1.600127, -1.913297, 0, 1, 0.3058824, 1,
-0.2408954, -1.807348, -2.169461, 0, 1, 0.3098039, 1,
-0.2394638, 0.04181014, -0.02829713, 0, 1, 0.3176471, 1,
-0.2379734, 0.07486517, -0.3561302, 0, 1, 0.3215686, 1,
-0.2360692, -2.044219, -3.160034, 0, 1, 0.3294118, 1,
-0.2351847, -0.08283303, -2.769832, 0, 1, 0.3333333, 1,
-0.234402, 1.113448, -1.447933, 0, 1, 0.3411765, 1,
-0.2291774, -0.5775377, -3.857811, 0, 1, 0.345098, 1,
-0.2273244, -0.4237235, -3.994555, 0, 1, 0.3529412, 1,
-0.2245667, 0.05035694, -1.042622, 0, 1, 0.3568628, 1,
-0.2231879, -0.6147691, -1.562387, 0, 1, 0.3647059, 1,
-0.222669, 1.367913, -1.033612, 0, 1, 0.3686275, 1,
-0.2221111, 1.241047, 0.5986402, 0, 1, 0.3764706, 1,
-0.2195565, -0.1021841, -2.211961, 0, 1, 0.3803922, 1,
-0.2139875, -1.059377, -2.542304, 0, 1, 0.3882353, 1,
-0.205816, 2.406391, 0.6344922, 0, 1, 0.3921569, 1,
-0.2053952, -0.5793331, -2.838795, 0, 1, 0.4, 1,
-0.2047383, 0.3770674, -1.316168, 0, 1, 0.4078431, 1,
-0.2034497, 2.085843, -2.527142, 0, 1, 0.4117647, 1,
-0.199569, -1.0595, -4.741577, 0, 1, 0.4196078, 1,
-0.1973654, 0.8026733, -0.5462944, 0, 1, 0.4235294, 1,
-0.1965572, 0.6129372, 0.9137291, 0, 1, 0.4313726, 1,
-0.1954107, -0.1713963, -3.19932, 0, 1, 0.4352941, 1,
-0.193995, -0.3668258, -1.644765, 0, 1, 0.4431373, 1,
-0.1930891, 1.652835, 0.4223369, 0, 1, 0.4470588, 1,
-0.1898971, -1.556616, -3.225657, 0, 1, 0.454902, 1,
-0.1893074, -0.3459672, -3.544773, 0, 1, 0.4588235, 1,
-0.1864228, -0.5919906, -4.049363, 0, 1, 0.4666667, 1,
-0.1782575, -0.959963, -1.505485, 0, 1, 0.4705882, 1,
-0.1745729, 1.496936, -1.312598, 0, 1, 0.4784314, 1,
-0.1742053, 0.6841654, -2.095145, 0, 1, 0.4823529, 1,
-0.1741413, -0.5279573, -3.740299, 0, 1, 0.4901961, 1,
-0.1703023, -0.3666434, -1.245805, 0, 1, 0.4941176, 1,
-0.1656081, -0.8295065, -2.858051, 0, 1, 0.5019608, 1,
-0.1620625, -0.4103871, -3.650505, 0, 1, 0.509804, 1,
-0.1617057, -1.122405, -3.9632, 0, 1, 0.5137255, 1,
-0.1577726, 1.288047, -0.7294975, 0, 1, 0.5215687, 1,
-0.1538299, 0.293907, -2.450356, 0, 1, 0.5254902, 1,
-0.152495, -1.852861, -3.340833, 0, 1, 0.5333334, 1,
-0.1462548, 1.491089, -0.9603343, 0, 1, 0.5372549, 1,
-0.1443152, -0.07358132, -3.55311, 0, 1, 0.5450981, 1,
-0.1416553, 0.9783577, -0.4554155, 0, 1, 0.5490196, 1,
-0.1413623, 0.06451528, -0.352695, 0, 1, 0.5568628, 1,
-0.1412317, -1.60033, -3.849327, 0, 1, 0.5607843, 1,
-0.1395092, -0.2529615, -2.701131, 0, 1, 0.5686275, 1,
-0.1377302, -0.2487809, -3.217085, 0, 1, 0.572549, 1,
-0.1332679, -0.1392868, -4.048585, 0, 1, 0.5803922, 1,
-0.1317822, 0.3924598, -1.310153, 0, 1, 0.5843138, 1,
-0.1305179, -1.737363, -1.367182, 0, 1, 0.5921569, 1,
-0.1297807, 1.2779, -2.407199, 0, 1, 0.5960785, 1,
-0.1293151, 0.44924, -2.787985, 0, 1, 0.6039216, 1,
-0.1281295, -0.4853078, -2.829476, 0, 1, 0.6117647, 1,
-0.1278461, -0.9284387, -3.536144, 0, 1, 0.6156863, 1,
-0.1138399, -0.7968685, -3.789192, 0, 1, 0.6235294, 1,
-0.112816, -2.053538, -4.299364, 0, 1, 0.627451, 1,
-0.1102713, -1.075032, -4.7882, 0, 1, 0.6352941, 1,
-0.1086798, 0.9357731, -1.592559, 0, 1, 0.6392157, 1,
-0.1055341, -0.3582479, -2.743163, 0, 1, 0.6470588, 1,
-0.1055069, -0.8967739, -0.9547954, 0, 1, 0.6509804, 1,
-0.1049872, -0.4243889, -3.331338, 0, 1, 0.6588235, 1,
-0.104625, 1.288827, -1.69913, 0, 1, 0.6627451, 1,
-0.1043765, -0.2772782, -2.708884, 0, 1, 0.6705883, 1,
-0.09943146, 0.5387899, -0.2638889, 0, 1, 0.6745098, 1,
-0.0993966, 2.085664, 0.07636739, 0, 1, 0.682353, 1,
-0.09834673, 1.214339, 0.1306638, 0, 1, 0.6862745, 1,
-0.09612036, 0.9793028, -1.79281, 0, 1, 0.6941177, 1,
-0.09341297, -1.743617, -2.076776, 0, 1, 0.7019608, 1,
-0.09159014, 0.5717714, 1.090873, 0, 1, 0.7058824, 1,
-0.08589559, -0.8572167, -3.1174, 0, 1, 0.7137255, 1,
-0.08565991, 2.394545, 0.3861147, 0, 1, 0.7176471, 1,
-0.08018794, -0.9684159, -4.107472, 0, 1, 0.7254902, 1,
-0.07736042, -0.4107232, -2.208276, 0, 1, 0.7294118, 1,
-0.075041, -0.5791564, -2.102109, 0, 1, 0.7372549, 1,
-0.07213176, 0.02725962, -1.751378, 0, 1, 0.7411765, 1,
-0.06888124, 1.056336, -0.6897796, 0, 1, 0.7490196, 1,
-0.06775612, 1.710689, -0.186545, 0, 1, 0.7529412, 1,
-0.06655835, 0.7634016, 0.8696642, 0, 1, 0.7607843, 1,
-0.0661465, 0.001084081, -0.5995736, 0, 1, 0.7647059, 1,
-0.06455322, -0.08616304, -2.01684, 0, 1, 0.772549, 1,
-0.06059443, 0.3126173, -0.8509114, 0, 1, 0.7764706, 1,
-0.05805134, -0.1932623, -2.193209, 0, 1, 0.7843137, 1,
-0.05353492, -1.469234, -3.174066, 0, 1, 0.7882353, 1,
-0.04643801, -0.1424397, -3.913973, 0, 1, 0.7960784, 1,
-0.04100822, 2.464138, 1.040549, 0, 1, 0.8039216, 1,
-0.03934184, 2.102291, -0.884003, 0, 1, 0.8078431, 1,
-0.0393098, -0.08543199, -3.998564, 0, 1, 0.8156863, 1,
-0.03468806, -1.285576, -1.67915, 0, 1, 0.8196079, 1,
-0.03018187, 0.7276076, -1.208, 0, 1, 0.827451, 1,
-0.02932985, -0.1446518, -4.270586, 0, 1, 0.8313726, 1,
-0.02809644, 0.2369093, -0.6222368, 0, 1, 0.8392157, 1,
-0.02620657, -0.5213208, -3.163121, 0, 1, 0.8431373, 1,
-0.02454524, 0.848587, -1.784058, 0, 1, 0.8509804, 1,
-0.02419679, -1.534582, -2.967752, 0, 1, 0.854902, 1,
-0.02414695, 0.327922, -2.281137, 0, 1, 0.8627451, 1,
-0.02030431, 0.427031, 0.4501719, 0, 1, 0.8666667, 1,
-0.01964924, 1.210587, 0.9034104, 0, 1, 0.8745098, 1,
-0.01699114, -1.1955, -3.111859, 0, 1, 0.8784314, 1,
-0.01636752, 1.928449, -1.869514, 0, 1, 0.8862745, 1,
-0.01614246, -0.6971644, -2.226484, 0, 1, 0.8901961, 1,
-0.009063697, -0.3019607, -2.71111, 0, 1, 0.8980392, 1,
-0.004367262, 0.7982779, -0.1805417, 0, 1, 0.9058824, 1,
-0.002298845, 1.100764, 0.2228784, 0, 1, 0.9098039, 1,
0.0005616829, -0.3427131, 1.387159, 0, 1, 0.9176471, 1,
0.001041886, 0.1563209, 0.06497398, 0, 1, 0.9215686, 1,
0.004168027, 2.328603, -0.0503119, 0, 1, 0.9294118, 1,
0.01280638, 1.146919, -0.4952095, 0, 1, 0.9333333, 1,
0.01363757, 0.7815242, 0.5694918, 0, 1, 0.9411765, 1,
0.01399622, -0.05465199, 4.299862, 0, 1, 0.945098, 1,
0.01569884, -0.7067817, 5.239631, 0, 1, 0.9529412, 1,
0.01762952, -1.317292, 2.055742, 0, 1, 0.9568627, 1,
0.01950949, 0.07529009, -0.7302475, 0, 1, 0.9647059, 1,
0.01992408, -0.3003862, 2.55218, 0, 1, 0.9686275, 1,
0.02330168, -1.332875, 3.578686, 0, 1, 0.9764706, 1,
0.02447081, -1.016535, 2.335787, 0, 1, 0.9803922, 1,
0.02558313, -0.1731667, 1.40939, 0, 1, 0.9882353, 1,
0.02813128, 0.2539459, -2.295816, 0, 1, 0.9921569, 1,
0.02881926, -0.6195839, 3.584377, 0, 1, 1, 1,
0.03179829, -0.3176059, 2.373573, 0, 0.9921569, 1, 1,
0.03783927, 1.830156, -0.3081631, 0, 0.9882353, 1, 1,
0.03861635, -0.08339918, 3.294969, 0, 0.9803922, 1, 1,
0.04287265, -1.22852, 1.124159, 0, 0.9764706, 1, 1,
0.04691548, 0.3203598, 0.9385039, 0, 0.9686275, 1, 1,
0.0470865, 1.468182, 0.004342106, 0, 0.9647059, 1, 1,
0.04844142, -0.2959349, 3.017626, 0, 0.9568627, 1, 1,
0.04861981, -1.465075, 2.69387, 0, 0.9529412, 1, 1,
0.04865916, 0.2288889, -0.486944, 0, 0.945098, 1, 1,
0.04951557, 0.3602713, -1.730436, 0, 0.9411765, 1, 1,
0.05199409, -0.4759049, 4.403376, 0, 0.9333333, 1, 1,
0.05537488, 0.7666357, 0.02806277, 0, 0.9294118, 1, 1,
0.05922969, -0.8893669, 2.684442, 0, 0.9215686, 1, 1,
0.06227126, 1.445345, 1.223126, 0, 0.9176471, 1, 1,
0.06272678, -0.5272858, 0.8834308, 0, 0.9098039, 1, 1,
0.06849335, -0.804517, 3.316097, 0, 0.9058824, 1, 1,
0.07047348, -0.5763746, 3.489029, 0, 0.8980392, 1, 1,
0.07507621, -0.2481181, 2.670962, 0, 0.8901961, 1, 1,
0.08132905, 0.6700044, 1.061054, 0, 0.8862745, 1, 1,
0.08223464, -1.312742, 3.882345, 0, 0.8784314, 1, 1,
0.08283554, -1.025402, 2.580172, 0, 0.8745098, 1, 1,
0.08323052, -0.4809012, 3.552212, 0, 0.8666667, 1, 1,
0.08423775, -0.7962764, 1.304277, 0, 0.8627451, 1, 1,
0.08488403, -1.276282, 3.687158, 0, 0.854902, 1, 1,
0.08984801, -0.8531108, 2.537937, 0, 0.8509804, 1, 1,
0.08989035, -1.488826, 2.63054, 0, 0.8431373, 1, 1,
0.09138598, 0.2363638, 1.432385, 0, 0.8392157, 1, 1,
0.09512437, 0.3447662, 0.6432396, 0, 0.8313726, 1, 1,
0.09843054, -1.779951, 2.62875, 0, 0.827451, 1, 1,
0.1020446, -1.925568, 3.556572, 0, 0.8196079, 1, 1,
0.1055011, -0.4421461, 1.826298, 0, 0.8156863, 1, 1,
0.1073112, -0.5302954, 3.39986, 0, 0.8078431, 1, 1,
0.1076302, -0.5228794, 2.526045, 0, 0.8039216, 1, 1,
0.1081846, -1.025504, 4.247858, 0, 0.7960784, 1, 1,
0.1103832, -1.596333, 2.181318, 0, 0.7882353, 1, 1,
0.1131247, -0.5699646, 3.859324, 0, 0.7843137, 1, 1,
0.1143136, -0.2196195, 2.791963, 0, 0.7764706, 1, 1,
0.1163639, 0.2413646, 0.8892512, 0, 0.772549, 1, 1,
0.1195407, -0.6049453, 2.041203, 0, 0.7647059, 1, 1,
0.1200395, 1.109439, 0.2146665, 0, 0.7607843, 1, 1,
0.1267156, 0.1814775, 0.1971608, 0, 0.7529412, 1, 1,
0.1277121, -1.372428, 1.595176, 0, 0.7490196, 1, 1,
0.1290852, -0.03657497, 0.9571678, 0, 0.7411765, 1, 1,
0.1293435, 0.08752199, 1.914125, 0, 0.7372549, 1, 1,
0.1319056, 0.339961, 1.335256, 0, 0.7294118, 1, 1,
0.132677, 0.3321095, 0.5381377, 0, 0.7254902, 1, 1,
0.1330166, -2.188895, 3.875199, 0, 0.7176471, 1, 1,
0.1335229, -0.019838, 1.893339, 0, 0.7137255, 1, 1,
0.1348724, 1.488782, -0.4554052, 0, 0.7058824, 1, 1,
0.1360398, -0.4483282, 3.908108, 0, 0.6980392, 1, 1,
0.1393194, -1.253612, 3.529658, 0, 0.6941177, 1, 1,
0.1396984, 0.2618479, 0.2848403, 0, 0.6862745, 1, 1,
0.1441515, 2.340983, 2.068017, 0, 0.682353, 1, 1,
0.1468565, -1.801008, 4.904845, 0, 0.6745098, 1, 1,
0.1474792, -1.527633, 3.740305, 0, 0.6705883, 1, 1,
0.1493048, -2.62062, 2.024688, 0, 0.6627451, 1, 1,
0.1507628, 2.658803, 0.3876316, 0, 0.6588235, 1, 1,
0.1514184, -0.3718718, 2.261528, 0, 0.6509804, 1, 1,
0.1523729, -1.19351, 2.733948, 0, 0.6470588, 1, 1,
0.1538391, -0.1587598, 1.559655, 0, 0.6392157, 1, 1,
0.1564874, -0.3846431, 2.946877, 0, 0.6352941, 1, 1,
0.1565629, -0.696121, 3.544377, 0, 0.627451, 1, 1,
0.1601943, 0.03436309, 3.222167, 0, 0.6235294, 1, 1,
0.1616861, -0.062635, 2.741307, 0, 0.6156863, 1, 1,
0.1633111, 0.2923699, 0.6047087, 0, 0.6117647, 1, 1,
0.1646355, -1.0688, 4.118202, 0, 0.6039216, 1, 1,
0.1744819, 0.9433134, -0.4446967, 0, 0.5960785, 1, 1,
0.1749243, 0.2944207, 0.07443182, 0, 0.5921569, 1, 1,
0.1777739, -1.271393, 2.908739, 0, 0.5843138, 1, 1,
0.1810524, -0.8998895, 1.263344, 0, 0.5803922, 1, 1,
0.1871974, -0.3428611, 1.766883, 0, 0.572549, 1, 1,
0.1874625, 0.3265492, -0.2362773, 0, 0.5686275, 1, 1,
0.1913647, -0.5397798, 2.405558, 0, 0.5607843, 1, 1,
0.1958251, -0.3530399, 4.525341, 0, 0.5568628, 1, 1,
0.1964143, 1.064951, -0.5961229, 0, 0.5490196, 1, 1,
0.1970391, 1.329703, 0.9816499, 0, 0.5450981, 1, 1,
0.1987268, 1.394474, 0.2132976, 0, 0.5372549, 1, 1,
0.1992454, 0.4003081, -0.4441959, 0, 0.5333334, 1, 1,
0.2042179, 1.189225, 0.343458, 0, 0.5254902, 1, 1,
0.205511, -1.247165, 2.625498, 0, 0.5215687, 1, 1,
0.2077293, 2.167345, -0.3917851, 0, 0.5137255, 1, 1,
0.2105404, -0.185591, 2.655316, 0, 0.509804, 1, 1,
0.2129748, -1.163644, 2.50736, 0, 0.5019608, 1, 1,
0.2131471, 1.018203, 0.2360621, 0, 0.4941176, 1, 1,
0.2162974, 0.284722, 1.318592, 0, 0.4901961, 1, 1,
0.2169653, -0.1123853, 1.597681, 0, 0.4823529, 1, 1,
0.2237827, 0.6770587, 0.8056037, 0, 0.4784314, 1, 1,
0.2249312, -0.6732157, 3.340533, 0, 0.4705882, 1, 1,
0.2249903, -1.122545, 4.716264, 0, 0.4666667, 1, 1,
0.2273631, 1.027124, -0.5062126, 0, 0.4588235, 1, 1,
0.236571, -0.4513139, 4.451016, 0, 0.454902, 1, 1,
0.2381646, 0.1562167, 1.106739, 0, 0.4470588, 1, 1,
0.2386912, -0.6288506, 2.808635, 0, 0.4431373, 1, 1,
0.2398089, -0.1224117, 4.191255, 0, 0.4352941, 1, 1,
0.2486687, 7.161662e-05, 0.5352047, 0, 0.4313726, 1, 1,
0.254024, -0.07439874, 3.032624, 0, 0.4235294, 1, 1,
0.2545386, -1.14591, 1.27843, 0, 0.4196078, 1, 1,
0.2569341, -0.229402, 2.737433, 0, 0.4117647, 1, 1,
0.2576576, -1.093322, 3.477824, 0, 0.4078431, 1, 1,
0.2608121, 0.3227014, -0.4983501, 0, 0.4, 1, 1,
0.2631876, -0.1620876, 1.719616, 0, 0.3921569, 1, 1,
0.2634985, -0.3811671, 4.189634, 0, 0.3882353, 1, 1,
0.2686458, -0.8501495, 4.759488, 0, 0.3803922, 1, 1,
0.2696785, 0.2213588, -1.259863, 0, 0.3764706, 1, 1,
0.270617, -0.03183778, 1.963586, 0, 0.3686275, 1, 1,
0.270932, -0.7002989, 4.82833, 0, 0.3647059, 1, 1,
0.2734559, -0.01795697, 0.716902, 0, 0.3568628, 1, 1,
0.2835287, 0.4193189, 0.4185435, 0, 0.3529412, 1, 1,
0.2839042, 1.506099, 1.55601, 0, 0.345098, 1, 1,
0.2898491, 0.5368944, -1.644007, 0, 0.3411765, 1, 1,
0.290025, -1.491783, 4.452428, 0, 0.3333333, 1, 1,
0.2910949, -0.6268516, 2.009435, 0, 0.3294118, 1, 1,
0.3003973, -0.3094721, 4.460957, 0, 0.3215686, 1, 1,
0.3016379, -0.2061736, 2.8594, 0, 0.3176471, 1, 1,
0.302656, -1.168102, 2.648174, 0, 0.3098039, 1, 1,
0.3049124, 0.3624637, 1.691, 0, 0.3058824, 1, 1,
0.306284, 0.5556564, 1.905524, 0, 0.2980392, 1, 1,
0.3110175, -0.4265314, 3.441219, 0, 0.2901961, 1, 1,
0.3201648, 0.534535, -0.8222803, 0, 0.2862745, 1, 1,
0.3309688, -0.3750579, 2.742978, 0, 0.2784314, 1, 1,
0.3312833, 0.5752959, 1.626687, 0, 0.2745098, 1, 1,
0.3319532, -0.221104, 1.799277, 0, 0.2666667, 1, 1,
0.3323013, 0.4842898, 0.8061625, 0, 0.2627451, 1, 1,
0.337565, -1.321134, 1.903521, 0, 0.254902, 1, 1,
0.3405665, -0.9504393, 5.065713, 0, 0.2509804, 1, 1,
0.3432673, 1.443856, -0.2413351, 0, 0.2431373, 1, 1,
0.3449846, 0.07120361, 0.3550878, 0, 0.2392157, 1, 1,
0.3480632, -1.355067, 1.404697, 0, 0.2313726, 1, 1,
0.3493429, 0.2073519, 3.250985, 0, 0.227451, 1, 1,
0.3498602, -0.8664344, 1.784419, 0, 0.2196078, 1, 1,
0.3570449, 0.979387, 0.9358534, 0, 0.2156863, 1, 1,
0.361685, 0.9557362, 0.9123987, 0, 0.2078431, 1, 1,
0.3686472, -0.1676145, 3.411192, 0, 0.2039216, 1, 1,
0.3751405, -0.6063306, -0.03023523, 0, 0.1960784, 1, 1,
0.3768856, 1.087388, 0.9572817, 0, 0.1882353, 1, 1,
0.377317, 0.3631327, 1.50172, 0, 0.1843137, 1, 1,
0.3837016, -0.2935842, 2.497499, 0, 0.1764706, 1, 1,
0.3854012, -0.003189289, 3.043033, 0, 0.172549, 1, 1,
0.3908741, -1.188757, 2.091415, 0, 0.1647059, 1, 1,
0.3917607, 0.403264, 1.434247, 0, 0.1607843, 1, 1,
0.3944815, -0.1422315, 2.978604, 0, 0.1529412, 1, 1,
0.3951081, 1.351244, 1.439251, 0, 0.1490196, 1, 1,
0.3958365, 0.2192533, 0.592793, 0, 0.1411765, 1, 1,
0.396816, 1.094286, 1.05598, 0, 0.1372549, 1, 1,
0.3974785, 1.311013, -0.2112661, 0, 0.1294118, 1, 1,
0.3980486, 0.9661688, 2.323542, 0, 0.1254902, 1, 1,
0.4005977, 2.142356, 0.4589921, 0, 0.1176471, 1, 1,
0.4085006, -0.1446307, 2.00225, 0, 0.1137255, 1, 1,
0.4086633, -0.2260376, 3.992427, 0, 0.1058824, 1, 1,
0.4098802, -1.742584, 3.965441, 0, 0.09803922, 1, 1,
0.4130494, -0.7040011, 2.079672, 0, 0.09411765, 1, 1,
0.4152459, -1.135152, 3.417056, 0, 0.08627451, 1, 1,
0.4165969, 0.05053933, 2.154988, 0, 0.08235294, 1, 1,
0.4188334, -1.158065, 2.538722, 0, 0.07450981, 1, 1,
0.4265304, -0.004604659, 0.5698058, 0, 0.07058824, 1, 1,
0.4298099, -0.5903594, 3.053448, 0, 0.0627451, 1, 1,
0.4322008, -0.2263204, 1.555017, 0, 0.05882353, 1, 1,
0.4346744, -0.986422, 1.990812, 0, 0.05098039, 1, 1,
0.437022, 0.6216791, 0.5263608, 0, 0.04705882, 1, 1,
0.4401353, 0.4955147, 1.113293, 0, 0.03921569, 1, 1,
0.4403201, 0.5445255, 1.287645, 0, 0.03529412, 1, 1,
0.4411729, -0.3393713, 1.32887, 0, 0.02745098, 1, 1,
0.444227, -0.8637266, 4.322148, 0, 0.02352941, 1, 1,
0.4445942, 0.7906032, -1.206417, 0, 0.01568628, 1, 1,
0.4503683, -1.1742, 3.974306, 0, 0.01176471, 1, 1,
0.4593193, 0.9052857, 1.105021, 0, 0.003921569, 1, 1,
0.4655977, 0.1865276, 1.891798, 0.003921569, 0, 1, 1,
0.4717574, 1.425247, 1.545628, 0.007843138, 0, 1, 1,
0.4718494, -1.197522, 2.932557, 0.01568628, 0, 1, 1,
0.4751571, -1.113395, 2.623373, 0.01960784, 0, 1, 1,
0.4762989, 0.5679303, 0.6236623, 0.02745098, 0, 1, 1,
0.4781621, 1.170787, 1.264418, 0.03137255, 0, 1, 1,
0.479147, 0.3566098, -0.4082305, 0.03921569, 0, 1, 1,
0.4852578, 1.759414, -1.426745, 0.04313726, 0, 1, 1,
0.4857353, 1.006649, 1.060592, 0.05098039, 0, 1, 1,
0.4866418, -0.379836, 2.774225, 0.05490196, 0, 1, 1,
0.4889484, -1.283502, 3.932225, 0.0627451, 0, 1, 1,
0.4889651, 0.4521516, 1.519352, 0.06666667, 0, 1, 1,
0.490207, 0.2797465, 2.055331, 0.07450981, 0, 1, 1,
0.4910793, 0.5101789, 0.05388138, 0.07843138, 0, 1, 1,
0.4935065, -0.9405239, 1.71774, 0.08627451, 0, 1, 1,
0.4964949, 1.57856, 0.451064, 0.09019608, 0, 1, 1,
0.5065555, 1.155987, 0.8074023, 0.09803922, 0, 1, 1,
0.5067571, -0.7434263, 1.594501, 0.1058824, 0, 1, 1,
0.5077026, 0.289035, 1.551112, 0.1098039, 0, 1, 1,
0.5086285, 0.3481292, 3.610292, 0.1176471, 0, 1, 1,
0.5089059, -0.3738635, 4.072227, 0.1215686, 0, 1, 1,
0.5099563, 1.814236, 1.432148, 0.1294118, 0, 1, 1,
0.5113283, -0.2657392, 2.738983, 0.1333333, 0, 1, 1,
0.5121568, 0.03788026, 1.484956, 0.1411765, 0, 1, 1,
0.5144193, 1.043133, 0.05853084, 0.145098, 0, 1, 1,
0.5144357, 0.6474475, 1.36032, 0.1529412, 0, 1, 1,
0.5220194, -1.022476, 2.665043, 0.1568628, 0, 1, 1,
0.5223551, 0.6269059, -1.242483, 0.1647059, 0, 1, 1,
0.5236768, -1.368283, 3.319073, 0.1686275, 0, 1, 1,
0.5245179, -1.01015, 2.245122, 0.1764706, 0, 1, 1,
0.5263872, -1.962095, 2.863104, 0.1803922, 0, 1, 1,
0.5290915, -1.971999, 3.459185, 0.1882353, 0, 1, 1,
0.5291423, -0.7014227, 4.899424, 0.1921569, 0, 1, 1,
0.5296271, 1.113342, 0.2077116, 0.2, 0, 1, 1,
0.5363414, 0.9354882, -0.4967524, 0.2078431, 0, 1, 1,
0.5372273, 0.6380886, 2.225963, 0.2117647, 0, 1, 1,
0.5466335, 0.1190454, 2.55909, 0.2196078, 0, 1, 1,
0.5482849, -0.5823754, 2.124136, 0.2235294, 0, 1, 1,
0.56554, 1.318606, -0.07920656, 0.2313726, 0, 1, 1,
0.5688421, -0.2124026, 2.769373, 0.2352941, 0, 1, 1,
0.5694382, -1.297223, 2.140533, 0.2431373, 0, 1, 1,
0.5696482, -0.4724453, 1.487611, 0.2470588, 0, 1, 1,
0.5736722, 0.4500836, 2.512725, 0.254902, 0, 1, 1,
0.5743506, 0.8373823, 2.246785, 0.2588235, 0, 1, 1,
0.5746549, -0.3625843, 1.358233, 0.2666667, 0, 1, 1,
0.577247, -0.7173093, 3.606555, 0.2705882, 0, 1, 1,
0.5809438, 0.5921038, -0.1446565, 0.2784314, 0, 1, 1,
0.5853002, -1.876014, 2.227466, 0.282353, 0, 1, 1,
0.595083, 0.0375336, 0.3731723, 0.2901961, 0, 1, 1,
0.5959064, -0.2091995, 1.402055, 0.2941177, 0, 1, 1,
0.5965472, -0.9580213, 2.209197, 0.3019608, 0, 1, 1,
0.6090749, 0.3831056, 2.674584, 0.3098039, 0, 1, 1,
0.6106696, -2.103849, 4.050844, 0.3137255, 0, 1, 1,
0.6111088, 0.1887715, 2.519808, 0.3215686, 0, 1, 1,
0.6140644, 0.4495726, 2.283943, 0.3254902, 0, 1, 1,
0.6142446, 0.4274971, 1.029861, 0.3333333, 0, 1, 1,
0.615299, 0.6019911, 1.133969, 0.3372549, 0, 1, 1,
0.6190903, 1.379273, 0.7436278, 0.345098, 0, 1, 1,
0.6205865, -0.3120846, 2.03241, 0.3490196, 0, 1, 1,
0.6212355, -1.701031, 1.462063, 0.3568628, 0, 1, 1,
0.6236229, 1.438953, -0.2114494, 0.3607843, 0, 1, 1,
0.6304141, -0.4721482, 2.610563, 0.3686275, 0, 1, 1,
0.631012, 0.3412857, -1.534614, 0.372549, 0, 1, 1,
0.6340052, -0.09788007, 2.198632, 0.3803922, 0, 1, 1,
0.640223, 0.04041765, 0.3627093, 0.3843137, 0, 1, 1,
0.6462033, -0.8337836, 2.750439, 0.3921569, 0, 1, 1,
0.6575977, 0.01036946, 2.295642, 0.3960784, 0, 1, 1,
0.6589196, -0.09737716, 0.6963896, 0.4039216, 0, 1, 1,
0.662719, 0.2257537, 0.5669498, 0.4117647, 0, 1, 1,
0.6650097, 0.446588, 0.8280423, 0.4156863, 0, 1, 1,
0.6703894, 0.2198518, 0.8118778, 0.4235294, 0, 1, 1,
0.678039, 0.6573524, 1.511447, 0.427451, 0, 1, 1,
0.6783901, -0.2750666, 1.645499, 0.4352941, 0, 1, 1,
0.681717, -1.134449, 1.71666, 0.4392157, 0, 1, 1,
0.6820115, -0.2903656, 0.9670179, 0.4470588, 0, 1, 1,
0.6836169, 0.2101228, 2.388904, 0.4509804, 0, 1, 1,
0.6840102, 0.229738, 0.1264444, 0.4588235, 0, 1, 1,
0.6844652, 1.264733, 0.1328535, 0.4627451, 0, 1, 1,
0.6871276, 1.201947, -0.04107058, 0.4705882, 0, 1, 1,
0.6911132, 0.06094962, 2.152927, 0.4745098, 0, 1, 1,
0.6933869, -1.661657, 3.626781, 0.4823529, 0, 1, 1,
0.6959291, 0.07487173, 0.8693791, 0.4862745, 0, 1, 1,
0.6971627, 0.2938659, 0.6674269, 0.4941176, 0, 1, 1,
0.6980461, 0.02966054, 0.6399551, 0.5019608, 0, 1, 1,
0.6981537, 1.568623, -0.4888132, 0.5058824, 0, 1, 1,
0.7012244, -0.3810383, 3.715988, 0.5137255, 0, 1, 1,
0.7117296, 1.564211, -0.5366367, 0.5176471, 0, 1, 1,
0.7139561, -0.5163649, 1.252058, 0.5254902, 0, 1, 1,
0.7147797, 1.2577, 0.8847002, 0.5294118, 0, 1, 1,
0.7217538, 2.408749, 0.7663108, 0.5372549, 0, 1, 1,
0.7292816, -0.8727173, 3.250859, 0.5411765, 0, 1, 1,
0.7296917, -0.4773827, 3.262713, 0.5490196, 0, 1, 1,
0.7377159, -0.8259045, 3.077525, 0.5529412, 0, 1, 1,
0.7384402, 0.4300421, 1.059613, 0.5607843, 0, 1, 1,
0.7446941, 1.841788, 1.66731, 0.5647059, 0, 1, 1,
0.745121, -0.2018154, 1.226843, 0.572549, 0, 1, 1,
0.7521665, 1.835818, -2.584397, 0.5764706, 0, 1, 1,
0.7524204, -0.3859251, 0.9468599, 0.5843138, 0, 1, 1,
0.754205, 1.318599, 2.043212, 0.5882353, 0, 1, 1,
0.7560925, -0.06178001, 3.098592, 0.5960785, 0, 1, 1,
0.757544, -1.795656, 4.607805, 0.6039216, 0, 1, 1,
0.7584664, -0.7944076, 3.251498, 0.6078432, 0, 1, 1,
0.7622488, 0.5562963, 0.7658812, 0.6156863, 0, 1, 1,
0.7696402, -1.88858, 4.936066, 0.6196079, 0, 1, 1,
0.770363, -0.02724187, 2.178258, 0.627451, 0, 1, 1,
0.7765373, -1.664652, 2.738439, 0.6313726, 0, 1, 1,
0.7778484, -0.2569659, 2.128448, 0.6392157, 0, 1, 1,
0.7795847, 2.026912, -1.370262, 0.6431373, 0, 1, 1,
0.7828901, -2.565118, 0.2424382, 0.6509804, 0, 1, 1,
0.7854357, -0.4916373, 2.056542, 0.654902, 0, 1, 1,
0.7941267, -0.2524143, 2.31372, 0.6627451, 0, 1, 1,
0.798601, 1.974714, -0.8905889, 0.6666667, 0, 1, 1,
0.7993317, 0.4701631, -0.9622589, 0.6745098, 0, 1, 1,
0.7997656, -0.2163544, 2.164114, 0.6784314, 0, 1, 1,
0.800689, -1.097905, 2.712752, 0.6862745, 0, 1, 1,
0.8010923, 0.454133, 3.045591, 0.6901961, 0, 1, 1,
0.8121371, -0.9893389, 4.268179, 0.6980392, 0, 1, 1,
0.8128417, -0.3811822, 3.128371, 0.7058824, 0, 1, 1,
0.815445, -0.04028615, 1.727015, 0.7098039, 0, 1, 1,
0.8164746, -1.686707, 3.092885, 0.7176471, 0, 1, 1,
0.8174115, 1.248399, 0.1186646, 0.7215686, 0, 1, 1,
0.819007, 0.8254989, 0.2405632, 0.7294118, 0, 1, 1,
0.8196745, 1.959249, -1.322217, 0.7333333, 0, 1, 1,
0.8275919, -0.7612792, 2.185433, 0.7411765, 0, 1, 1,
0.83386, 1.008268, 0.9460967, 0.7450981, 0, 1, 1,
0.8399147, 1.448665, 0.2711122, 0.7529412, 0, 1, 1,
0.8437433, -0.2873021, 1.246381, 0.7568628, 0, 1, 1,
0.844011, -1.161071, 3.420891, 0.7647059, 0, 1, 1,
0.8481534, 0.7735044, 0.05191215, 0.7686275, 0, 1, 1,
0.8525895, 1.560112, 0.3964593, 0.7764706, 0, 1, 1,
0.8552952, -1.016434, 2.292051, 0.7803922, 0, 1, 1,
0.8559898, -2.309464, 2.276282, 0.7882353, 0, 1, 1,
0.8677496, 0.5997505, 0.2795435, 0.7921569, 0, 1, 1,
0.8679637, 2.014117, 0.7608776, 0.8, 0, 1, 1,
0.8691478, 1.249645, 1.153036, 0.8078431, 0, 1, 1,
0.8710237, -0.3886809, 0.3764268, 0.8117647, 0, 1, 1,
0.8746826, 1.144611, -0.4634529, 0.8196079, 0, 1, 1,
0.8748536, 0.4107095, 2.355559, 0.8235294, 0, 1, 1,
0.8763285, 0.6800849, 0.874087, 0.8313726, 0, 1, 1,
0.879011, 0.2472495, 0.2135845, 0.8352941, 0, 1, 1,
0.8824172, 0.6436312, 1.123623, 0.8431373, 0, 1, 1,
0.8837009, 0.8463942, 0.1986049, 0.8470588, 0, 1, 1,
0.8850667, -0.2515074, 2.856864, 0.854902, 0, 1, 1,
0.8880154, 0.7002755, 1.250938, 0.8588235, 0, 1, 1,
0.8900229, -0.6867526, 2.137713, 0.8666667, 0, 1, 1,
0.8921381, -0.2290813, 2.891289, 0.8705882, 0, 1, 1,
0.8931967, 0.06431267, 0.5382646, 0.8784314, 0, 1, 1,
0.8964481, -0.02448849, 1.801005, 0.8823529, 0, 1, 1,
0.9088575, 0.1765686, 1.078242, 0.8901961, 0, 1, 1,
0.9110945, 0.4852816, 1.290114, 0.8941177, 0, 1, 1,
0.9120005, -0.8685377, 3.733447, 0.9019608, 0, 1, 1,
0.9152895, 0.3969471, 0.1454445, 0.9098039, 0, 1, 1,
0.9178533, 0.4859807, -0.6654436, 0.9137255, 0, 1, 1,
0.9192009, -0.002148443, 0.9437338, 0.9215686, 0, 1, 1,
0.9200405, -0.2059534, 2.692251, 0.9254902, 0, 1, 1,
0.922052, 1.320057, -0.7067418, 0.9333333, 0, 1, 1,
0.9221483, -1.332522, 2.838441, 0.9372549, 0, 1, 1,
0.9256484, 2.219719, 1.161612, 0.945098, 0, 1, 1,
0.933508, 0.1267606, 0.6619498, 0.9490196, 0, 1, 1,
0.93511, 1.133605, 0.07177649, 0.9568627, 0, 1, 1,
0.9368185, 0.8377116, 1.321621, 0.9607843, 0, 1, 1,
0.9442019, 0.8588462, 1.414923, 0.9686275, 0, 1, 1,
0.9442968, -0.9165345, 1.487615, 0.972549, 0, 1, 1,
0.9453567, -0.8277237, 1.083488, 0.9803922, 0, 1, 1,
0.9525055, 0.6507652, 0.9601172, 0.9843137, 0, 1, 1,
0.9556049, -1.244845, 4.089715, 0.9921569, 0, 1, 1,
0.9563804, -0.4837555, 2.17291, 0.9960784, 0, 1, 1,
0.9600436, -0.3509665, 3.276335, 1, 0, 0.9960784, 1,
0.9611138, -0.858401, 1.430729, 1, 0, 0.9882353, 1,
0.9627832, -0.4509122, 3.13279, 1, 0, 0.9843137, 1,
0.9668118, 0.9586481, 2.098741, 1, 0, 0.9764706, 1,
0.9673131, -1.884738, 1.941725, 1, 0, 0.972549, 1,
0.9675669, -0.2338968, 0.1076478, 1, 0, 0.9647059, 1,
0.9779744, 0.7788467, -0.1472705, 1, 0, 0.9607843, 1,
0.9796711, 1.755658, 0.1053594, 1, 0, 0.9529412, 1,
0.9797451, -0.3815767, 3.503623, 1, 0, 0.9490196, 1,
0.9836898, 3.297294, -0.6325489, 1, 0, 0.9411765, 1,
0.996867, -0.916378, 2.377399, 1, 0, 0.9372549, 1,
1.002638, -0.4553067, 3.226869, 1, 0, 0.9294118, 1,
1.004746, -1.034647, 2.699279, 1, 0, 0.9254902, 1,
1.007828, -0.7227819, 3.77729, 1, 0, 0.9176471, 1,
1.007871, -0.7857068, 1.040207, 1, 0, 0.9137255, 1,
1.008684, 1.090697, 1.994816, 1, 0, 0.9058824, 1,
1.01511, 1.556004, 0.5808756, 1, 0, 0.9019608, 1,
1.015281, 0.9317816, 1.184585, 1, 0, 0.8941177, 1,
1.024801, -0.1711621, 0.6656088, 1, 0, 0.8862745, 1,
1.03292, 1.484432, 1.070742, 1, 0, 0.8823529, 1,
1.033843, 0.3208686, 1.520396, 1, 0, 0.8745098, 1,
1.038233, -0.5110388, 1.522452, 1, 0, 0.8705882, 1,
1.039251, 0.7328423, 0.2581175, 1, 0, 0.8627451, 1,
1.045487, 0.2006394, 2.080223, 1, 0, 0.8588235, 1,
1.045937, 2.027833, -0.2813404, 1, 0, 0.8509804, 1,
1.049724, -0.3233855, 1.390781, 1, 0, 0.8470588, 1,
1.050973, -1.48376, 3.090246, 1, 0, 0.8392157, 1,
1.053384, 0.7893078, 1.307678, 1, 0, 0.8352941, 1,
1.059342, -0.6032956, 1.965198, 1, 0, 0.827451, 1,
1.061113, 0.1921459, 2.182542, 1, 0, 0.8235294, 1,
1.066756, -1.649823, 3.2924, 1, 0, 0.8156863, 1,
1.069536, 0.1937376, 2.076971, 1, 0, 0.8117647, 1,
1.077269, 0.6325227, 1.157328, 1, 0, 0.8039216, 1,
1.080599, 2.044685, 1.331112, 1, 0, 0.7960784, 1,
1.091848, 0.5015867, -0.06272867, 1, 0, 0.7921569, 1,
1.101924, 0.565987, 0.9496845, 1, 0, 0.7843137, 1,
1.116044, 0.5649762, 1.32033, 1, 0, 0.7803922, 1,
1.118486, -0.1839394, 1.655417, 1, 0, 0.772549, 1,
1.13423, -0.3961774, 1.439862, 1, 0, 0.7686275, 1,
1.142067, -1.59984, 2.669351, 1, 0, 0.7607843, 1,
1.146046, 0.1839548, 1.104322, 1, 0, 0.7568628, 1,
1.148402, -0.2811419, -0.1281542, 1, 0, 0.7490196, 1,
1.149889, -0.3091593, 2.155331, 1, 0, 0.7450981, 1,
1.151678, -0.2782717, 2.108689, 1, 0, 0.7372549, 1,
1.157408, 1.327967, 0.05961839, 1, 0, 0.7333333, 1,
1.158675, 1.097773, -0.1218277, 1, 0, 0.7254902, 1,
1.166741, -0.7012973, 3.669194, 1, 0, 0.7215686, 1,
1.170194, -0.7940321, 3.594234, 1, 0, 0.7137255, 1,
1.170874, 0.5217775, 0.8816271, 1, 0, 0.7098039, 1,
1.177595, -0.222217, 2.715586, 1, 0, 0.7019608, 1,
1.185237, 0.131913, 0.174311, 1, 0, 0.6941177, 1,
1.193217, -1.210163, 2.067942, 1, 0, 0.6901961, 1,
1.19656, 0.01644569, 1.429123, 1, 0, 0.682353, 1,
1.198115, -0.04067721, 1.586284, 1, 0, 0.6784314, 1,
1.202032, -1.740325, 1.996139, 1, 0, 0.6705883, 1,
1.202197, -0.4982238, 2.032135, 1, 0, 0.6666667, 1,
1.226259, -0.2009912, 1.425074, 1, 0, 0.6588235, 1,
1.236241, 0.01201667, 2.036393, 1, 0, 0.654902, 1,
1.239863, 0.6735989, 2.320022, 1, 0, 0.6470588, 1,
1.242067, 0.5651848, 0.5868943, 1, 0, 0.6431373, 1,
1.24586, -0.9002675, 3.046341, 1, 0, 0.6352941, 1,
1.247745, -0.5265351, 0.6600366, 1, 0, 0.6313726, 1,
1.248323, -0.9117735, 1.052951, 1, 0, 0.6235294, 1,
1.255784, -1.195647, 1.890966, 1, 0, 0.6196079, 1,
1.257931, 0.2654853, 2.053096, 1, 0, 0.6117647, 1,
1.263826, -0.201586, 1.20104, 1, 0, 0.6078432, 1,
1.273036, 1.428619, 1.772505, 1, 0, 0.6, 1,
1.275871, 0.1917814, 1.5956, 1, 0, 0.5921569, 1,
1.277923, -0.4584541, 1.477731, 1, 0, 0.5882353, 1,
1.279064, 1.33306, -0.5920326, 1, 0, 0.5803922, 1,
1.298055, 0.1899315, 3.068389, 1, 0, 0.5764706, 1,
1.302489, 0.1002721, -0.1035587, 1, 0, 0.5686275, 1,
1.30272, 0.2895578, 1.642768, 1, 0, 0.5647059, 1,
1.330728, -1.709296, 1.920635, 1, 0, 0.5568628, 1,
1.336185, 0.06238727, 1.997359, 1, 0, 0.5529412, 1,
1.338943, -1.967473, 3.489507, 1, 0, 0.5450981, 1,
1.339265, 0.5227696, 1.357817, 1, 0, 0.5411765, 1,
1.339785, -0.1918457, 0.963811, 1, 0, 0.5333334, 1,
1.34117, 1.316819, 0.299909, 1, 0, 0.5294118, 1,
1.343014, 0.1906143, 2.689304, 1, 0, 0.5215687, 1,
1.353884, -0.2114598, 1.693375, 1, 0, 0.5176471, 1,
1.35764, 0.5186587, 1.679649, 1, 0, 0.509804, 1,
1.358486, -1.190294, 2.814617, 1, 0, 0.5058824, 1,
1.359375, -0.52303, 2.0281, 1, 0, 0.4980392, 1,
1.360254, -0.7377688, 2.630924, 1, 0, 0.4901961, 1,
1.373657, -1.294314, 2.256282, 1, 0, 0.4862745, 1,
1.395894, -0.3518173, 2.42111, 1, 0, 0.4784314, 1,
1.398578, 0.4578006, 0.9753116, 1, 0, 0.4745098, 1,
1.398805, -0.5209476, 1.476402, 1, 0, 0.4666667, 1,
1.400679, -0.2583176, 1.823497, 1, 0, 0.4627451, 1,
1.402695, -1.021607, 2.032634, 1, 0, 0.454902, 1,
1.404101, 0.3367457, 1.214238, 1, 0, 0.4509804, 1,
1.404609, -0.2962431, 2.668854, 1, 0, 0.4431373, 1,
1.408742, 0.007878536, 2.194793, 1, 0, 0.4392157, 1,
1.410228, -1.275669, 1.610998, 1, 0, 0.4313726, 1,
1.41247, -1.228974, 3.265691, 1, 0, 0.427451, 1,
1.417157, 0.3216728, 1.567813, 1, 0, 0.4196078, 1,
1.417483, 0.3055152, 1.034506, 1, 0, 0.4156863, 1,
1.418797, -0.5623301, 0.04756038, 1, 0, 0.4078431, 1,
1.419906, -2.172884, 3.561188, 1, 0, 0.4039216, 1,
1.420599, -1.069703, 2.135666, 1, 0, 0.3960784, 1,
1.42217, 0.9006271, 1.496011, 1, 0, 0.3882353, 1,
1.422644, -0.4541461, 1.33205, 1, 0, 0.3843137, 1,
1.42371, 1.513441, -0.9840944, 1, 0, 0.3764706, 1,
1.425638, 1.309615, 1.520729, 1, 0, 0.372549, 1,
1.430457, -0.1689501, 2.129257, 1, 0, 0.3647059, 1,
1.434677, -0.1794343, -0.03605928, 1, 0, 0.3607843, 1,
1.44002, -0.588201, 1.056695, 1, 0, 0.3529412, 1,
1.443177, -0.449635, 1.487658, 1, 0, 0.3490196, 1,
1.46456, -1.204589, 1.854588, 1, 0, 0.3411765, 1,
1.481222, 0.6787753, 1.422393, 1, 0, 0.3372549, 1,
1.508138, -0.08870939, 3.544607, 1, 0, 0.3294118, 1,
1.521601, 1.983239, 1.452332, 1, 0, 0.3254902, 1,
1.54387, 0.8373611, 1.23457, 1, 0, 0.3176471, 1,
1.546861, 1.037487, 0.03851064, 1, 0, 0.3137255, 1,
1.560447, 0.5847108, 0.9413536, 1, 0, 0.3058824, 1,
1.565772, 1.361383, -0.3319571, 1, 0, 0.2980392, 1,
1.571674, -1.185388, 1.365702, 1, 0, 0.2941177, 1,
1.593915, 0.3669263, -0.216328, 1, 0, 0.2862745, 1,
1.608681, 1.414196, 0.4963772, 1, 0, 0.282353, 1,
1.608739, 0.9057788, -0.7533362, 1, 0, 0.2745098, 1,
1.636065, -1.660954, 3.463785, 1, 0, 0.2705882, 1,
1.677399, 0.01366578, 1.609693, 1, 0, 0.2627451, 1,
1.683476, 1.803867, 1.126581, 1, 0, 0.2588235, 1,
1.686792, 1.466715, 1.688042, 1, 0, 0.2509804, 1,
1.689498, -1.101131, 1.985948, 1, 0, 0.2470588, 1,
1.697422, -0.298819, 1.049776, 1, 0, 0.2392157, 1,
1.717162, 0.440284, 1.77945, 1, 0, 0.2352941, 1,
1.727136, 0.6196809, 2.991362, 1, 0, 0.227451, 1,
1.730579, -1.50278, 1.669881, 1, 0, 0.2235294, 1,
1.730579, 0.4636459, -0.1964487, 1, 0, 0.2156863, 1,
1.73979, -1.38533, 2.618193, 1, 0, 0.2117647, 1,
1.742652, -1.101663, 0.8031698, 1, 0, 0.2039216, 1,
1.743955, 0.5778252, -0.136867, 1, 0, 0.1960784, 1,
1.750061, 0.05527668, 2.783571, 1, 0, 0.1921569, 1,
1.777428, -0.01967737, 1.735832, 1, 0, 0.1843137, 1,
1.778714, -0.5102108, 3.125763, 1, 0, 0.1803922, 1,
1.779215, 1.094477, 0.6445267, 1, 0, 0.172549, 1,
1.784783, -0.9380187, 2.394441, 1, 0, 0.1686275, 1,
1.796612, -0.6438826, 1.444487, 1, 0, 0.1607843, 1,
1.804461, -0.1822663, 1.774448, 1, 0, 0.1568628, 1,
1.827242, -1.968708, 1.37109, 1, 0, 0.1490196, 1,
1.836105, 0.879235, 1.896494, 1, 0, 0.145098, 1,
1.87221, 2.000524, -0.6982404, 1, 0, 0.1372549, 1,
1.877438, 0.7545394, 0.9947308, 1, 0, 0.1333333, 1,
1.879572, -0.5849512, 3.99466, 1, 0, 0.1254902, 1,
1.926939, 0.8520319, 0.4969192, 1, 0, 0.1215686, 1,
1.927122, 0.4330556, 1.449948, 1, 0, 0.1137255, 1,
1.966431, 0.6373312, 0.5553845, 1, 0, 0.1098039, 1,
1.975449, -0.6614439, 1.204778, 1, 0, 0.1019608, 1,
2.007597, -0.6151257, 0.6500333, 1, 0, 0.09411765, 1,
2.008516, 1.024845, 0.8413076, 1, 0, 0.09019608, 1,
2.022735, -0.3440391, 1.682201, 1, 0, 0.08235294, 1,
2.059727, -1.633941, 0.6690089, 1, 0, 0.07843138, 1,
2.063953, -0.3388734, 2.89601, 1, 0, 0.07058824, 1,
2.085951, -0.5210024, 0.9413046, 1, 0, 0.06666667, 1,
2.137213, 0.7680924, 0.9963555, 1, 0, 0.05882353, 1,
2.364614, 0.161659, -0.4440706, 1, 0, 0.05490196, 1,
2.414509, 0.4043522, 1.322033, 1, 0, 0.04705882, 1,
2.41527, 0.8449956, 1.804491, 1, 0, 0.04313726, 1,
2.429572, 0.3892145, 2.022768, 1, 0, 0.03529412, 1,
2.470433, -1.585154, 1.128691, 1, 0, 0.03137255, 1,
2.473341, -0.8291289, 1.062981, 1, 0, 0.02352941, 1,
2.526009, -0.8702791, 2.640872, 1, 0, 0.01960784, 1,
2.612765, 1.554508, 0.0370437, 1, 0, 0.01176471, 1,
2.638344, -1.371172, 1.3707, 1, 0, 0.007843138, 1
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
-0.6097269, -3.623707, -6.487918, 0, -0.5, 0.5, 0.5,
-0.6097269, -3.623707, -6.487918, 1, -0.5, 0.5, 0.5,
-0.6097269, -3.623707, -6.487918, 1, 1.5, 0.5, 0.5,
-0.6097269, -3.623707, -6.487918, 0, 1.5, 0.5, 0.5
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
-4.958894, 0.3383366, -6.487918, 0, -0.5, 0.5, 0.5,
-4.958894, 0.3383366, -6.487918, 1, -0.5, 0.5, 0.5,
-4.958894, 0.3383366, -6.487918, 1, 1.5, 0.5, 0.5,
-4.958894, 0.3383366, -6.487918, 0, 1.5, 0.5, 0.5
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
-4.958894, -3.623707, 0.2257152, 0, -0.5, 0.5, 0.5,
-4.958894, -3.623707, 0.2257152, 1, -0.5, 0.5, 0.5,
-4.958894, -3.623707, 0.2257152, 1, 1.5, 0.5, 0.5,
-4.958894, -3.623707, 0.2257152, 0, 1.5, 0.5, 0.5
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
-3, -2.709389, -4.938618,
2, -2.709389, -4.938618,
-3, -2.709389, -4.938618,
-3, -2.861775, -5.196835,
-2, -2.709389, -4.938618,
-2, -2.861775, -5.196835,
-1, -2.709389, -4.938618,
-1, -2.861775, -5.196835,
0, -2.709389, -4.938618,
0, -2.861775, -5.196835,
1, -2.709389, -4.938618,
1, -2.861775, -5.196835,
2, -2.709389, -4.938618,
2, -2.861775, -5.196835
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
-3, -3.166548, -5.713268, 0, -0.5, 0.5, 0.5,
-3, -3.166548, -5.713268, 1, -0.5, 0.5, 0.5,
-3, -3.166548, -5.713268, 1, 1.5, 0.5, 0.5,
-3, -3.166548, -5.713268, 0, 1.5, 0.5, 0.5,
-2, -3.166548, -5.713268, 0, -0.5, 0.5, 0.5,
-2, -3.166548, -5.713268, 1, -0.5, 0.5, 0.5,
-2, -3.166548, -5.713268, 1, 1.5, 0.5, 0.5,
-2, -3.166548, -5.713268, 0, 1.5, 0.5, 0.5,
-1, -3.166548, -5.713268, 0, -0.5, 0.5, 0.5,
-1, -3.166548, -5.713268, 1, -0.5, 0.5, 0.5,
-1, -3.166548, -5.713268, 1, 1.5, 0.5, 0.5,
-1, -3.166548, -5.713268, 0, 1.5, 0.5, 0.5,
0, -3.166548, -5.713268, 0, -0.5, 0.5, 0.5,
0, -3.166548, -5.713268, 1, -0.5, 0.5, 0.5,
0, -3.166548, -5.713268, 1, 1.5, 0.5, 0.5,
0, -3.166548, -5.713268, 0, 1.5, 0.5, 0.5,
1, -3.166548, -5.713268, 0, -0.5, 0.5, 0.5,
1, -3.166548, -5.713268, 1, -0.5, 0.5, 0.5,
1, -3.166548, -5.713268, 1, 1.5, 0.5, 0.5,
1, -3.166548, -5.713268, 0, 1.5, 0.5, 0.5,
2, -3.166548, -5.713268, 0, -0.5, 0.5, 0.5,
2, -3.166548, -5.713268, 1, -0.5, 0.5, 0.5,
2, -3.166548, -5.713268, 1, 1.5, 0.5, 0.5,
2, -3.166548, -5.713268, 0, 1.5, 0.5, 0.5
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
-3.95524, -2, -4.938618,
-3.95524, 3, -4.938618,
-3.95524, -2, -4.938618,
-4.122516, -2, -5.196835,
-3.95524, -1, -4.938618,
-4.122516, -1, -5.196835,
-3.95524, 0, -4.938618,
-4.122516, 0, -5.196835,
-3.95524, 1, -4.938618,
-4.122516, 1, -5.196835,
-3.95524, 2, -4.938618,
-4.122516, 2, -5.196835,
-3.95524, 3, -4.938618,
-4.122516, 3, -5.196835
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
-4.457067, -2, -5.713268, 0, -0.5, 0.5, 0.5,
-4.457067, -2, -5.713268, 1, -0.5, 0.5, 0.5,
-4.457067, -2, -5.713268, 1, 1.5, 0.5, 0.5,
-4.457067, -2, -5.713268, 0, 1.5, 0.5, 0.5,
-4.457067, -1, -5.713268, 0, -0.5, 0.5, 0.5,
-4.457067, -1, -5.713268, 1, -0.5, 0.5, 0.5,
-4.457067, -1, -5.713268, 1, 1.5, 0.5, 0.5,
-4.457067, -1, -5.713268, 0, 1.5, 0.5, 0.5,
-4.457067, 0, -5.713268, 0, -0.5, 0.5, 0.5,
-4.457067, 0, -5.713268, 1, -0.5, 0.5, 0.5,
-4.457067, 0, -5.713268, 1, 1.5, 0.5, 0.5,
-4.457067, 0, -5.713268, 0, 1.5, 0.5, 0.5,
-4.457067, 1, -5.713268, 0, -0.5, 0.5, 0.5,
-4.457067, 1, -5.713268, 1, -0.5, 0.5, 0.5,
-4.457067, 1, -5.713268, 1, 1.5, 0.5, 0.5,
-4.457067, 1, -5.713268, 0, 1.5, 0.5, 0.5,
-4.457067, 2, -5.713268, 0, -0.5, 0.5, 0.5,
-4.457067, 2, -5.713268, 1, -0.5, 0.5, 0.5,
-4.457067, 2, -5.713268, 1, 1.5, 0.5, 0.5,
-4.457067, 2, -5.713268, 0, 1.5, 0.5, 0.5,
-4.457067, 3, -5.713268, 0, -0.5, 0.5, 0.5,
-4.457067, 3, -5.713268, 1, -0.5, 0.5, 0.5,
-4.457067, 3, -5.713268, 1, 1.5, 0.5, 0.5,
-4.457067, 3, -5.713268, 0, 1.5, 0.5, 0.5
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
-3.95524, -2.709389, -4,
-3.95524, -2.709389, 4,
-3.95524, -2.709389, -4,
-4.122516, -2.861775, -4,
-3.95524, -2.709389, -2,
-4.122516, -2.861775, -2,
-3.95524, -2.709389, 0,
-4.122516, -2.861775, 0,
-3.95524, -2.709389, 2,
-4.122516, -2.861775, 2,
-3.95524, -2.709389, 4,
-4.122516, -2.861775, 4
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
-4.457067, -3.166548, -4, 0, -0.5, 0.5, 0.5,
-4.457067, -3.166548, -4, 1, -0.5, 0.5, 0.5,
-4.457067, -3.166548, -4, 1, 1.5, 0.5, 0.5,
-4.457067, -3.166548, -4, 0, 1.5, 0.5, 0.5,
-4.457067, -3.166548, -2, 0, -0.5, 0.5, 0.5,
-4.457067, -3.166548, -2, 1, -0.5, 0.5, 0.5,
-4.457067, -3.166548, -2, 1, 1.5, 0.5, 0.5,
-4.457067, -3.166548, -2, 0, 1.5, 0.5, 0.5,
-4.457067, -3.166548, 0, 0, -0.5, 0.5, 0.5,
-4.457067, -3.166548, 0, 1, -0.5, 0.5, 0.5,
-4.457067, -3.166548, 0, 1, 1.5, 0.5, 0.5,
-4.457067, -3.166548, 0, 0, 1.5, 0.5, 0.5,
-4.457067, -3.166548, 2, 0, -0.5, 0.5, 0.5,
-4.457067, -3.166548, 2, 1, -0.5, 0.5, 0.5,
-4.457067, -3.166548, 2, 1, 1.5, 0.5, 0.5,
-4.457067, -3.166548, 2, 0, 1.5, 0.5, 0.5,
-4.457067, -3.166548, 4, 0, -0.5, 0.5, 0.5,
-4.457067, -3.166548, 4, 1, -0.5, 0.5, 0.5,
-4.457067, -3.166548, 4, 1, 1.5, 0.5, 0.5,
-4.457067, -3.166548, 4, 0, 1.5, 0.5, 0.5
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
-3.95524, -2.709389, -4.938618,
-3.95524, 3.386062, -4.938618,
-3.95524, -2.709389, 5.390048,
-3.95524, 3.386062, 5.390048,
-3.95524, -2.709389, -4.938618,
-3.95524, -2.709389, 5.390048,
-3.95524, 3.386062, -4.938618,
-3.95524, 3.386062, 5.390048,
-3.95524, -2.709389, -4.938618,
2.735786, -2.709389, -4.938618,
-3.95524, -2.709389, 5.390048,
2.735786, -2.709389, 5.390048,
-3.95524, 3.386062, -4.938618,
2.735786, 3.386062, -4.938618,
-3.95524, 3.386062, 5.390048,
2.735786, 3.386062, 5.390048,
2.735786, -2.709389, -4.938618,
2.735786, 3.386062, -4.938618,
2.735786, -2.709389, 5.390048,
2.735786, 3.386062, 5.390048,
2.735786, -2.709389, -4.938618,
2.735786, -2.709389, 5.390048,
2.735786, 3.386062, -4.938618,
2.735786, 3.386062, 5.390048
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
var radius = 7.333358;
var distance = 32.62694;
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
mvMatrix.translate( 0.6097269, -0.3383366, -0.2257152 );
mvMatrix.scale( 1.185016, 1.300801, 0.7676664 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.62694);
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
copper_arsenate_copp<-read.table("copper_arsenate_copp.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 5 elements
```

```r
x<-copper_arsenate_copp$V2
```

```
## Error in eval(expr, envir, enclos): object 'copper_arsenate_copp' not found
```

```r
y<-copper_arsenate_copp$V3
```

```
## Error in eval(expr, envir, enclos): object 'copper_arsenate_copp' not found
```

```r
z<-copper_arsenate_copp$V4
```

```
## Error in eval(expr, envir, enclos): object 'copper_arsenate_copp' not found
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
-3.857798, 0.1837552, -1.009957, 0, 0, 1, 1, 1,
-2.865272, 0.1845969, -1.745326, 1, 0, 0, 1, 1,
-2.709268, 0.4566349, -0.0006779853, 1, 0, 0, 1, 1,
-2.673163, -2.162721, -1.201497, 1, 0, 0, 1, 1,
-2.66784, 0.3673572, -3.150203, 1, 0, 0, 1, 1,
-2.622868, -1.747995, -2.526075, 1, 0, 0, 1, 1,
-2.603004, 1.606639, -1.363223, 0, 0, 0, 1, 1,
-2.597443, 1.826719, -2.013391, 0, 0, 0, 1, 1,
-2.52213, -0.7860177, -1.68224, 0, 0, 0, 1, 1,
-2.520875, -2.047001, -1.607381, 0, 0, 0, 1, 1,
-2.481949, 0.8501215, -0.5721056, 0, 0, 0, 1, 1,
-2.312874, -0.4119828, -1.077412, 0, 0, 0, 1, 1,
-2.311763, -0.9890207, -1.656986, 0, 0, 0, 1, 1,
-2.290127, -0.7466885, -2.486445, 1, 1, 1, 1, 1,
-2.280929, -0.166658, -0.8574026, 1, 1, 1, 1, 1,
-2.247645, 0.5240009, -0.7861314, 1, 1, 1, 1, 1,
-2.181196, 0.3115579, -1.53753, 1, 1, 1, 1, 1,
-2.179827, 0.5119865, -1.385088, 1, 1, 1, 1, 1,
-2.173951, -1.52625, 0.381463, 1, 1, 1, 1, 1,
-2.154434, 0.4128415, -2.11908, 1, 1, 1, 1, 1,
-2.149435, 0.9039696, -1.502818, 1, 1, 1, 1, 1,
-2.124207, -0.7307807, 0.4571106, 1, 1, 1, 1, 1,
-2.117488, 0.7912462, -0.4860367, 1, 1, 1, 1, 1,
-2.101556, 0.5267028, 0.7560623, 1, 1, 1, 1, 1,
-2.057219, -1.944047, -3.200444, 1, 1, 1, 1, 1,
-2.054234, 0.020112, 0.3119946, 1, 1, 1, 1, 1,
-2.032246, 0.4954448, 0.2369818, 1, 1, 1, 1, 1,
-2.024496, 0.4252402, -0.8270617, 1, 1, 1, 1, 1,
-2.017685, -2.341728, -2.321039, 0, 0, 1, 1, 1,
-1.981484, 0.8544238, 1.086538, 1, 0, 0, 1, 1,
-1.964806, -0.8425992, -1.137213, 1, 0, 0, 1, 1,
-1.908945, -0.7015891, -3.291521, 1, 0, 0, 1, 1,
-1.888758, 0.7825163, -1.483986, 1, 0, 0, 1, 1,
-1.88505, 1.833257, -1.775894, 1, 0, 0, 1, 1,
-1.877212, -1.047527, -1.39566, 0, 0, 0, 1, 1,
-1.87382, 1.245818, -2.519991, 0, 0, 0, 1, 1,
-1.871267, -1.728171, -2.23077, 0, 0, 0, 1, 1,
-1.868168, -1.22174, -2.870895, 0, 0, 0, 1, 1,
-1.857994, 0.73602, -0.3049352, 0, 0, 0, 1, 1,
-1.850701, 0.327873, 0.06493811, 0, 0, 0, 1, 1,
-1.841252, 1.0115, -2.449207, 0, 0, 0, 1, 1,
-1.83415, -0.6963056, -2.318709, 1, 1, 1, 1, 1,
-1.821953, 0.8010313, 0.5471578, 1, 1, 1, 1, 1,
-1.808632, -0.1819614, -2.030101, 1, 1, 1, 1, 1,
-1.801554, 1.219507, -1.031218, 1, 1, 1, 1, 1,
-1.794191, 1.083872, -0.3504575, 1, 1, 1, 1, 1,
-1.788323, -0.4278066, -2.217825, 1, 1, 1, 1, 1,
-1.780541, -0.04807412, -1.664213, 1, 1, 1, 1, 1,
-1.778457, 0.3419714, -1.300121, 1, 1, 1, 1, 1,
-1.778311, 1.703883, -0.9978694, 1, 1, 1, 1, 1,
-1.772319, 0.4617883, -1.082477, 1, 1, 1, 1, 1,
-1.761775, 0.01513627, -1.344094, 1, 1, 1, 1, 1,
-1.752606, 0.4822044, 0.4675143, 1, 1, 1, 1, 1,
-1.748099, -0.9181997, -0.5911521, 1, 1, 1, 1, 1,
-1.71301, 0.984953, -0.6013445, 1, 1, 1, 1, 1,
-1.705622, 1.029532, -1.170444, 1, 1, 1, 1, 1,
-1.700292, -0.1141964, -2.135061, 0, 0, 1, 1, 1,
-1.663588, -2.21034, -1.462653, 1, 0, 0, 1, 1,
-1.660304, 1.303728, -1.96601, 1, 0, 0, 1, 1,
-1.65757, -1.568472, -2.513644, 1, 0, 0, 1, 1,
-1.65591, -1.048095, -2.352543, 1, 0, 0, 1, 1,
-1.654, 0.5969338, -1.637366, 1, 0, 0, 1, 1,
-1.651069, 0.5998619, -3.43544, 0, 0, 0, 1, 1,
-1.646882, 0.1757615, -1.222094, 0, 0, 0, 1, 1,
-1.639439, 0.1176322, -2.88675, 0, 0, 0, 1, 1,
-1.628837, -2.530059, -1.874721, 0, 0, 0, 1, 1,
-1.618393, 0.4913905, -1.750959, 0, 0, 0, 1, 1,
-1.598316, 0.8272876, -0.3307786, 0, 0, 0, 1, 1,
-1.594493, 0.4137283, -1.474187, 0, 0, 0, 1, 1,
-1.588031, 0.5521415, -1.602411, 1, 1, 1, 1, 1,
-1.577867, -0.8127652, -2.851017, 1, 1, 1, 1, 1,
-1.576788, -1.544529, -1.889965, 1, 1, 1, 1, 1,
-1.57373, 0.8622725, -2.193461, 1, 1, 1, 1, 1,
-1.572925, 1.248886, -0.6540953, 1, 1, 1, 1, 1,
-1.56641, -0.5185392, -2.139899, 1, 1, 1, 1, 1,
-1.558458, 0.947529, -1.45212, 1, 1, 1, 1, 1,
-1.524462, -0.6502824, -1.560748, 1, 1, 1, 1, 1,
-1.5223, 0.8295012, -1.487942, 1, 1, 1, 1, 1,
-1.516747, 1.095556, -1.138823, 1, 1, 1, 1, 1,
-1.516339, -0.5974892, -0.5287598, 1, 1, 1, 1, 1,
-1.516323, -1.127103, -0.7471902, 1, 1, 1, 1, 1,
-1.515644, -0.901078, -3.142088, 1, 1, 1, 1, 1,
-1.476889, 1.423268, -1.958739, 1, 1, 1, 1, 1,
-1.474526, -0.8082716, -3.834989, 1, 1, 1, 1, 1,
-1.466691, 0.2810539, -2.288492, 0, 0, 1, 1, 1,
-1.466601, 0.5795, -1.372104, 1, 0, 0, 1, 1,
-1.461665, 0.3660459, -0.7467412, 1, 0, 0, 1, 1,
-1.458398, -0.7176574, -1.825253, 1, 0, 0, 1, 1,
-1.448848, -1.753964, -3.740811, 1, 0, 0, 1, 1,
-1.444073, -0.8693554, -1.355051, 1, 0, 0, 1, 1,
-1.427565, 1.237428, -1.504334, 0, 0, 0, 1, 1,
-1.415047, -0.2220844, -2.265948, 0, 0, 0, 1, 1,
-1.413157, -0.07280581, -1.959954, 0, 0, 0, 1, 1,
-1.412506, -0.05330231, -0.6502459, 0, 0, 0, 1, 1,
-1.411318, 0.1370177, -0.1986942, 0, 0, 0, 1, 1,
-1.402745, 0.8412828, -1.465332, 0, 0, 0, 1, 1,
-1.393868, -0.8469121, -2.84428, 0, 0, 0, 1, 1,
-1.374953, 0.4269775, -1.637679, 1, 1, 1, 1, 1,
-1.373796, 0.4809426, -0.2461888, 1, 1, 1, 1, 1,
-1.365276, 0.2073975, -0.6478692, 1, 1, 1, 1, 1,
-1.336426, -0.05530451, -2.54422, 1, 1, 1, 1, 1,
-1.333671, -1.398269, -2.670805, 1, 1, 1, 1, 1,
-1.327177, -0.2045366, -1.957948, 1, 1, 1, 1, 1,
-1.316733, -0.4657688, -2.790517, 1, 1, 1, 1, 1,
-1.304309, 1.353139, -0.9608015, 1, 1, 1, 1, 1,
-1.300007, -0.1003184, -1.038518, 1, 1, 1, 1, 1,
-1.296214, -0.2899578, -2.871779, 1, 1, 1, 1, 1,
-1.293003, -0.1127718, -1.790188, 1, 1, 1, 1, 1,
-1.275679, 0.7710302, -0.594575, 1, 1, 1, 1, 1,
-1.27362, -2.263823, -2.081856, 1, 1, 1, 1, 1,
-1.272063, 0.1747948, -2.264692, 1, 1, 1, 1, 1,
-1.264508, 0.7743905, -0.4962202, 1, 1, 1, 1, 1,
-1.262004, -0.2114427, -0.7566538, 0, 0, 1, 1, 1,
-1.259634, 0.4582956, -2.361739, 1, 0, 0, 1, 1,
-1.258135, 0.06981851, -1.227354, 1, 0, 0, 1, 1,
-1.255867, -1.321793, -2.030889, 1, 0, 0, 1, 1,
-1.237663, -0.5877479, -2.285994, 1, 0, 0, 1, 1,
-1.233716, -0.9218335, -0.8996334, 1, 0, 0, 1, 1,
-1.225975, 0.5717521, -0.3005114, 0, 0, 0, 1, 1,
-1.225243, 1.375302, 0.5476576, 0, 0, 0, 1, 1,
-1.21355, -0.3497546, -1.373301, 0, 0, 0, 1, 1,
-1.204291, -0.5610087, -2.359005, 0, 0, 0, 1, 1,
-1.197009, -1.642011, -2.394203, 0, 0, 0, 1, 1,
-1.188554, 1.090999, -0.5314269, 0, 0, 0, 1, 1,
-1.170284, 0.2071676, -1.817633, 0, 0, 0, 1, 1,
-1.168982, 0.7824295, -0.1337018, 1, 1, 1, 1, 1,
-1.156861, -0.171722, -3.013646, 1, 1, 1, 1, 1,
-1.156723, 0.1125809, -1.831091, 1, 1, 1, 1, 1,
-1.154867, -0.5343705, -2.109048, 1, 1, 1, 1, 1,
-1.152787, -0.09287553, -3.111377, 1, 1, 1, 1, 1,
-1.141558, -0.9599396, -2.860369, 1, 1, 1, 1, 1,
-1.122047, 0.3334536, -1.734929, 1, 1, 1, 1, 1,
-1.118861, 0.3041932, -1.018983, 1, 1, 1, 1, 1,
-1.111447, 0.6904292, -1.498183, 1, 1, 1, 1, 1,
-1.107602, 0.2378026, -1.662966, 1, 1, 1, 1, 1,
-1.102847, -0.5723805, -2.388542, 1, 1, 1, 1, 1,
-1.100882, -0.340958, -2.108531, 1, 1, 1, 1, 1,
-1.094248, -0.7768227, -3.613472, 1, 1, 1, 1, 1,
-1.085941, 0.4128073, -1.782195, 1, 1, 1, 1, 1,
-1.08558, 0.7045867, -1.915548, 1, 1, 1, 1, 1,
-1.083367, 2.140717, -1.08919, 0, 0, 1, 1, 1,
-1.076852, 1.46688, -0.6308882, 1, 0, 0, 1, 1,
-1.060001, 0.9087096, -0.1051642, 1, 0, 0, 1, 1,
-1.059796, 0.05028887, -1.354842, 1, 0, 0, 1, 1,
-1.056644, 0.8569258, -1.326353, 1, 0, 0, 1, 1,
-1.047777, -2.013527, -4.631809, 1, 0, 0, 1, 1,
-1.045636, 0.7113875, -2.293297, 0, 0, 0, 1, 1,
-1.040713, -0.1517372, -1.186437, 0, 0, 0, 1, 1,
-1.040315, -1.052244, 0.9176689, 0, 0, 0, 1, 1,
-1.040293, 0.1915407, -2.762747, 0, 0, 0, 1, 1,
-1.039591, 1.122815, -0.6036441, 0, 0, 0, 1, 1,
-1.037761, 0.543231, -1.152136, 0, 0, 0, 1, 1,
-1.032174, 0.5239387, -1.538819, 0, 0, 0, 1, 1,
-1.0313, 0.6378464, -0.6224654, 1, 1, 1, 1, 1,
-1.029122, 0.2049939, -2.370128, 1, 1, 1, 1, 1,
-1.025281, -0.1417537, -1.974335, 1, 1, 1, 1, 1,
-1.018859, -0.03412991, -1.22881, 1, 1, 1, 1, 1,
-1.017474, -1.093091, -2.652391, 1, 1, 1, 1, 1,
-1.017279, -0.3591592, -1.595616, 1, 1, 1, 1, 1,
-1.009835, 0.378951, 0.4319884, 1, 1, 1, 1, 1,
-1.006466, -1.263527, -3.295354, 1, 1, 1, 1, 1,
-1.004509, -1.424495, -3.288262, 1, 1, 1, 1, 1,
-1.004418, -2.439645, -1.491893, 1, 1, 1, 1, 1,
-1.004205, 1.359236, 0.2040068, 1, 1, 1, 1, 1,
-1.003729, 0.1266013, -0.2074157, 1, 1, 1, 1, 1,
-0.9982601, -2.150746, -3.447967, 1, 1, 1, 1, 1,
-0.9936018, 1.725446, -1.095359, 1, 1, 1, 1, 1,
-0.9917858, -0.9669677, -1.475976, 1, 1, 1, 1, 1,
-0.9911183, 0.2373521, 0.1181858, 0, 0, 1, 1, 1,
-0.9854838, -0.1153933, -2.843181, 1, 0, 0, 1, 1,
-0.9763557, -1.592347, -2.848597, 1, 0, 0, 1, 1,
-0.9756234, -0.4902143, -0.3546406, 1, 0, 0, 1, 1,
-0.9751267, -1.01432, -0.7139739, 1, 0, 0, 1, 1,
-0.9622566, 1.738932, -1.095627, 1, 0, 0, 1, 1,
-0.9579266, 0.03899611, -2.139227, 0, 0, 0, 1, 1,
-0.957914, -0.1132174, -0.8848445, 0, 0, 0, 1, 1,
-0.9549112, 1.297621, -0.9185199, 0, 0, 0, 1, 1,
-0.9543501, 1.187349, -1.583561, 0, 0, 0, 1, 1,
-0.9455446, -0.8931935, -1.412512, 0, 0, 0, 1, 1,
-0.9445366, 0.275352, -3.279387, 0, 0, 0, 1, 1,
-0.9312183, -0.4221056, -3.492146, 0, 0, 0, 1, 1,
-0.9184831, -0.8894755, -2.965657, 1, 1, 1, 1, 1,
-0.9137928, 0.07506903, -0.6511946, 1, 1, 1, 1, 1,
-0.9020867, 0.9271061, -1.08683, 1, 1, 1, 1, 1,
-0.9017284, -0.1780093, 1.915779, 1, 1, 1, 1, 1,
-0.8944659, -1.845643, -3.467764, 1, 1, 1, 1, 1,
-0.8880094, 0.6895013, -0.5123037, 1, 1, 1, 1, 1,
-0.8862063, -1.334887, -1.249708, 1, 1, 1, 1, 1,
-0.8750897, 1.078855, -0.4113122, 1, 1, 1, 1, 1,
-0.8691431, 0.423694, -2.888681, 1, 1, 1, 1, 1,
-0.8624837, -0.7069893, -3.224504, 1, 1, 1, 1, 1,
-0.8621529, 3.165288, -0.9052773, 1, 1, 1, 1, 1,
-0.8613456, -2.172966, -1.45783, 1, 1, 1, 1, 1,
-0.8576137, 0.6950194, -1.07649, 1, 1, 1, 1, 1,
-0.8554876, 0.4394791, -2.47093, 1, 1, 1, 1, 1,
-0.8482231, 1.305223, -0.1967002, 1, 1, 1, 1, 1,
-0.8388108, -1.098747, -0.8730081, 0, 0, 1, 1, 1,
-0.83447, -0.9150632, -1.204778, 1, 0, 0, 1, 1,
-0.8340316, 0.08922872, 0.5388471, 1, 0, 0, 1, 1,
-0.826764, 0.07882639, -0.908486, 1, 0, 0, 1, 1,
-0.8212835, 1.351934, -0.6963392, 1, 0, 0, 1, 1,
-0.821149, -0.8225242, -2.340008, 1, 0, 0, 1, 1,
-0.8190106, -1.526175, -2.4025, 0, 0, 0, 1, 1,
-0.8189768, 0.4821739, -3.132163, 0, 0, 0, 1, 1,
-0.8046836, 1.936122, -1.362702, 0, 0, 0, 1, 1,
-0.8027667, 0.9550843, -0.265021, 0, 0, 0, 1, 1,
-0.7989274, 1.223121, -0.1412739, 0, 0, 0, 1, 1,
-0.7985912, -1.71745, -2.567337, 0, 0, 0, 1, 1,
-0.7940833, -0.07570621, -2.442366, 0, 0, 0, 1, 1,
-0.7924182, 0.348994, -1.391676, 1, 1, 1, 1, 1,
-0.7917357, 0.08455821, -1.273804, 1, 1, 1, 1, 1,
-0.7888539, 0.8369303, 0.3639674, 1, 1, 1, 1, 1,
-0.7864015, -1.80785, -2.697714, 1, 1, 1, 1, 1,
-0.784951, -1.065134, -2.539153, 1, 1, 1, 1, 1,
-0.7822724, 0.1295113, -0.111508, 1, 1, 1, 1, 1,
-0.7796904, -0.2144598, 0.3989266, 1, 1, 1, 1, 1,
-0.7765692, 0.1065391, -2.692154, 1, 1, 1, 1, 1,
-0.7739207, -0.1047053, -1.439059, 1, 1, 1, 1, 1,
-0.7699892, 0.5873167, -1.062984, 1, 1, 1, 1, 1,
-0.7663581, 0.7328319, -0.6759749, 1, 1, 1, 1, 1,
-0.766003, 1.007233, -1.528291, 1, 1, 1, 1, 1,
-0.7658679, 0.8274095, -2.654832, 1, 1, 1, 1, 1,
-0.760756, -0.0689938, -2.14509, 1, 1, 1, 1, 1,
-0.7599738, 1.672287, 0.01136843, 1, 1, 1, 1, 1,
-0.757642, 1.866603, -0.7973769, 0, 0, 1, 1, 1,
-0.7510403, -1.833472, -2.392145, 1, 0, 0, 1, 1,
-0.7400501, -0.5065303, -4.394366, 1, 0, 0, 1, 1,
-0.7399949, 0.6829039, -1.236216, 1, 0, 0, 1, 1,
-0.7377335, 0.6484056, -1.460707, 1, 0, 0, 1, 1,
-0.7331484, 1.675395, -1.528341, 1, 0, 0, 1, 1,
-0.7308655, -1.142576, -2.020023, 0, 0, 0, 1, 1,
-0.7273026, 0.5648326, 0.4705959, 0, 0, 0, 1, 1,
-0.7260942, 1.877164, -1.225725, 0, 0, 0, 1, 1,
-0.7220739, 0.8926725, 0.01200383, 0, 0, 0, 1, 1,
-0.7126853, -1.717985, -4.47186, 0, 0, 0, 1, 1,
-0.7107037, 1.149184, -0.5817779, 0, 0, 0, 1, 1,
-0.7062219, -1.746087, -3.316153, 0, 0, 0, 1, 1,
-0.6974913, 0.2653086, -0.9143358, 1, 1, 1, 1, 1,
-0.6877569, 0.04204321, -2.012496, 1, 1, 1, 1, 1,
-0.6848685, -0.133871, -0.9031982, 1, 1, 1, 1, 1,
-0.6836615, -0.4505583, -1.628798, 1, 1, 1, 1, 1,
-0.683475, -0.5192924, -2.157687, 1, 1, 1, 1, 1,
-0.6805838, 1.725625, 0.1835309, 1, 1, 1, 1, 1,
-0.6789325, -1.228159, -4.036802, 1, 1, 1, 1, 1,
-0.677901, -0.02420881, -0.3968776, 1, 1, 1, 1, 1,
-0.6720275, -0.5890776, -2.62785, 1, 1, 1, 1, 1,
-0.6712621, -0.5534925, -1.977505, 1, 1, 1, 1, 1,
-0.6710676, 1.878437, -0.4163732, 1, 1, 1, 1, 1,
-0.6708399, 1.042331, 0.5657406, 1, 1, 1, 1, 1,
-0.6700433, 0.5879492, 0.5562326, 1, 1, 1, 1, 1,
-0.6696161, 0.3382998, -1.063373, 1, 1, 1, 1, 1,
-0.6595173, -0.2255672, -1.870394, 1, 1, 1, 1, 1,
-0.6571311, -0.5608863, -2.203119, 0, 0, 1, 1, 1,
-0.6557192, -0.5175896, -2.074355, 1, 0, 0, 1, 1,
-0.6507999, -1.489983, -3.013667, 1, 0, 0, 1, 1,
-0.6506884, -0.0110876, -1.727892, 1, 0, 0, 1, 1,
-0.6506482, -0.21255, -2.988548, 1, 0, 0, 1, 1,
-0.6497166, -0.4032187, -1.188714, 1, 0, 0, 1, 1,
-0.647553, -2.162231, -3.432544, 0, 0, 0, 1, 1,
-0.6462458, 0.3015617, -0.8591919, 0, 0, 0, 1, 1,
-0.6451334, 0.2583561, 0.510056, 0, 0, 0, 1, 1,
-0.6434335, -0.9053245, -2.507982, 0, 0, 0, 1, 1,
-0.6359245, -2.437192, -3.534467, 0, 0, 0, 1, 1,
-0.6295412, -0.1480057, -4.10957, 0, 0, 0, 1, 1,
-0.6274944, -0.961073, -3.994402, 0, 0, 0, 1, 1,
-0.6263152, 1.386047, 0.7227663, 1, 1, 1, 1, 1,
-0.6212074, -0.7359266, -2.818599, 1, 1, 1, 1, 1,
-0.6162413, -0.6286569, -1.872904, 1, 1, 1, 1, 1,
-0.6140334, -0.9508864, -2.181919, 1, 1, 1, 1, 1,
-0.598523, 0.7098722, -1.00341, 1, 1, 1, 1, 1,
-0.5980318, 1.920182, -0.7498372, 1, 1, 1, 1, 1,
-0.5968339, -0.6942647, -1.492406, 1, 1, 1, 1, 1,
-0.594474, -0.8583853, -0.4113772, 1, 1, 1, 1, 1,
-0.5909657, -1.194755, -1.246636, 1, 1, 1, 1, 1,
-0.5909104, 1.090337, -2.217046, 1, 1, 1, 1, 1,
-0.5816274, 0.5364332, 0.6493953, 1, 1, 1, 1, 1,
-0.568656, -1.736109, -2.501175, 1, 1, 1, 1, 1,
-0.5643353, -0.8541358, -2.777568, 1, 1, 1, 1, 1,
-0.5638683, 0.9249005, 0.8627006, 1, 1, 1, 1, 1,
-0.5623909, -0.3726656, -3.158176, 1, 1, 1, 1, 1,
-0.5619199, -0.1793269, -2.331206, 0, 0, 1, 1, 1,
-0.5612327, -0.306229, -1.446631, 1, 0, 0, 1, 1,
-0.5578588, 1.512362, -3.010867, 1, 0, 0, 1, 1,
-0.5555353, -0.01202106, -1.372157, 1, 0, 0, 1, 1,
-0.5540228, -0.09503391, -2.250187, 1, 0, 0, 1, 1,
-0.5524009, -1.406395, -0.7523588, 1, 0, 0, 1, 1,
-0.5500454, -0.1043757, -2.011105, 0, 0, 0, 1, 1,
-0.5439469, -0.4847987, -1.787684, 0, 0, 0, 1, 1,
-0.5395601, -0.5464031, -2.741911, 0, 0, 0, 1, 1,
-0.5357494, 1.629201, 0.250726, 0, 0, 0, 1, 1,
-0.5325125, 0.2437384, -3.120886, 0, 0, 0, 1, 1,
-0.5299138, -0.3567797, -1.475515, 0, 0, 0, 1, 1,
-0.5298439, 0.03689201, -0.9675957, 0, 0, 0, 1, 1,
-0.5288693, 1.096812, 0.1725058, 1, 1, 1, 1, 1,
-0.5245867, -0.5861475, -2.985989, 1, 1, 1, 1, 1,
-0.5229067, 1.14739, 0.08561134, 1, 1, 1, 1, 1,
-0.5200427, 0.7227882, -2.253166, 1, 1, 1, 1, 1,
-0.5129049, 1.066524, -0.714674, 1, 1, 1, 1, 1,
-0.5107412, 0.6633787, -2.623227, 1, 1, 1, 1, 1,
-0.5096152, -0.6091155, -1.576524, 1, 1, 1, 1, 1,
-0.5042673, -0.050466, -1.061374, 1, 1, 1, 1, 1,
-0.5032353, 1.254247, -3.532873, 1, 1, 1, 1, 1,
-0.4965504, -0.1379336, -1.503026, 1, 1, 1, 1, 1,
-0.4955066, 0.07042164, -2.67606, 1, 1, 1, 1, 1,
-0.4805922, -0.07470615, -1.869661, 1, 1, 1, 1, 1,
-0.480421, 0.6988674, -2.286595, 1, 1, 1, 1, 1,
-0.4757273, 0.9083467, -0.3433186, 1, 1, 1, 1, 1,
-0.4753628, 0.637039, -0.5707022, 1, 1, 1, 1, 1,
-0.4721112, 0.4437637, 0.1982282, 0, 0, 1, 1, 1,
-0.4698798, -0.1921196, -1.599591, 1, 0, 0, 1, 1,
-0.4698351, 0.3869122, 0.3455572, 1, 0, 0, 1, 1,
-0.4687363, -2.436567, -2.864907, 1, 0, 0, 1, 1,
-0.4658059, 1.273406, 0.04735778, 1, 0, 0, 1, 1,
-0.4610285, 0.02427362, -2.930303, 1, 0, 0, 1, 1,
-0.4607594, -0.4458882, -1.265702, 0, 0, 0, 1, 1,
-0.4586961, -0.2232237, -2.949578, 0, 0, 0, 1, 1,
-0.4525623, 0.8884399, -0.8984111, 0, 0, 0, 1, 1,
-0.4521788, -0.7760698, -3.34725, 0, 0, 0, 1, 1,
-0.452115, 0.6085063, -1.576654, 0, 0, 0, 1, 1,
-0.4484878, -1.643336, -2.219738, 0, 0, 0, 1, 1,
-0.4480179, -0.3080519, -2.990394, 0, 0, 0, 1, 1,
-0.4477689, 0.7290223, -0.1270652, 1, 1, 1, 1, 1,
-0.4422311, 0.6834064, -3.361086, 1, 1, 1, 1, 1,
-0.4406666, -0.545932, -3.940585, 1, 1, 1, 1, 1,
-0.4393263, -0.4841794, -1.792361, 1, 1, 1, 1, 1,
-0.4380913, -0.4943307, -2.630482, 1, 1, 1, 1, 1,
-0.4377656, -0.4625124, -3.223973, 1, 1, 1, 1, 1,
-0.4367229, -0.02175002, -2.646186, 1, 1, 1, 1, 1,
-0.4354224, 1.225743, -0.9417044, 1, 1, 1, 1, 1,
-0.430963, 0.280137, -1.373244, 1, 1, 1, 1, 1,
-0.4285274, -0.204386, -2.177201, 1, 1, 1, 1, 1,
-0.4279781, -0.9139144, -2.072208, 1, 1, 1, 1, 1,
-0.4273804, 1.172474, -0.8967411, 1, 1, 1, 1, 1,
-0.4169215, 0.628333, -0.3784995, 1, 1, 1, 1, 1,
-0.4121954, -0.5915844, -3.531683, 1, 1, 1, 1, 1,
-0.4071687, 1.572154, 1.210957, 1, 1, 1, 1, 1,
-0.4060416, 0.2200529, -0.1645142, 0, 0, 1, 1, 1,
-0.4016998, -1.601602, -1.842345, 1, 0, 0, 1, 1,
-0.3987868, 0.7816117, -0.6979462, 1, 0, 0, 1, 1,
-0.3946534, -0.8919563, -1.816245, 1, 0, 0, 1, 1,
-0.3917872, 2.864967, -0.6659752, 1, 0, 0, 1, 1,
-0.3875041, -0.4120996, -4.212447, 1, 0, 0, 1, 1,
-0.3854054, 0.6220636, -2.004523, 0, 0, 0, 1, 1,
-0.3818628, 1.111369, -0.8499529, 0, 0, 0, 1, 1,
-0.3816495, 1.756474, 0.1962713, 0, 0, 0, 1, 1,
-0.3807523, 1.114327, 0.2422974, 0, 0, 0, 1, 1,
-0.3774232, 1.106739, -0.9496716, 0, 0, 0, 1, 1,
-0.3753689, -1.939881, -3.672385, 0, 0, 0, 1, 1,
-0.3743145, -2.177472, -1.987356, 0, 0, 0, 1, 1,
-0.3646886, -0.3632307, -1.772559, 1, 1, 1, 1, 1,
-0.3622877, -0.1044516, -2.786827, 1, 1, 1, 1, 1,
-0.361152, 0.01421688, -2.482791, 1, 1, 1, 1, 1,
-0.3568596, -0.3612877, -1.257931, 1, 1, 1, 1, 1,
-0.3562948, -1.418943, -2.644116, 1, 1, 1, 1, 1,
-0.3503408, -0.311216, -3.008399, 1, 1, 1, 1, 1,
-0.345797, 0.4137972, -0.4854744, 1, 1, 1, 1, 1,
-0.3370497, 0.006909827, -1.866737, 1, 1, 1, 1, 1,
-0.3299901, -0.01191578, -2.37936, 1, 1, 1, 1, 1,
-0.3298341, -0.4317203, -2.447259, 1, 1, 1, 1, 1,
-0.3295012, -0.4308199, -1.669971, 1, 1, 1, 1, 1,
-0.3285002, 0.610567, 1.53902, 1, 1, 1, 1, 1,
-0.3225771, 1.094218, -1.279057, 1, 1, 1, 1, 1,
-0.3179844, -0.8452702, -2.426323, 1, 1, 1, 1, 1,
-0.3172162, -0.5125182, -2.735651, 1, 1, 1, 1, 1,
-0.3166905, 0.002117438, -2.075756, 0, 0, 1, 1, 1,
-0.3145426, 0.8540851, -0.6602633, 1, 0, 0, 1, 1,
-0.3066012, -0.6811675, -2.230223, 1, 0, 0, 1, 1,
-0.3052876, -0.03354736, -1.165072, 1, 0, 0, 1, 1,
-0.3044392, 0.2564211, -0.7683933, 1, 0, 0, 1, 1,
-0.3015149, -0.1144574, -2.816462, 1, 0, 0, 1, 1,
-0.2987122, -0.744122, -4.18689, 0, 0, 0, 1, 1,
-0.2934507, -1.046029, -1.642642, 0, 0, 0, 1, 1,
-0.292482, 1.066445, 0.08212169, 0, 0, 0, 1, 1,
-0.2880599, 0.5897282, -1.861261, 0, 0, 0, 1, 1,
-0.2844737, 0.7005574, 0.3876057, 0, 0, 0, 1, 1,
-0.2839598, -1.492925, -3.05741, 0, 0, 0, 1, 1,
-0.2755316, 1.467813, -0.7313156, 0, 0, 0, 1, 1,
-0.2665481, 1.517135, -1.444871, 1, 1, 1, 1, 1,
-0.2660685, -1.466937, -2.837408, 1, 1, 1, 1, 1,
-0.2651884, -0.8754658, -1.484111, 1, 1, 1, 1, 1,
-0.256709, -1.116418, -3.576929, 1, 1, 1, 1, 1,
-0.2562449, 0.1273575, -0.900782, 1, 1, 1, 1, 1,
-0.2507176, -0.1305302, -2.217861, 1, 1, 1, 1, 1,
-0.2491043, -2.133089, -2.145978, 1, 1, 1, 1, 1,
-0.2482154, -1.600127, -1.913297, 1, 1, 1, 1, 1,
-0.2408954, -1.807348, -2.169461, 1, 1, 1, 1, 1,
-0.2394638, 0.04181014, -0.02829713, 1, 1, 1, 1, 1,
-0.2379734, 0.07486517, -0.3561302, 1, 1, 1, 1, 1,
-0.2360692, -2.044219, -3.160034, 1, 1, 1, 1, 1,
-0.2351847, -0.08283303, -2.769832, 1, 1, 1, 1, 1,
-0.234402, 1.113448, -1.447933, 1, 1, 1, 1, 1,
-0.2291774, -0.5775377, -3.857811, 1, 1, 1, 1, 1,
-0.2273244, -0.4237235, -3.994555, 0, 0, 1, 1, 1,
-0.2245667, 0.05035694, -1.042622, 1, 0, 0, 1, 1,
-0.2231879, -0.6147691, -1.562387, 1, 0, 0, 1, 1,
-0.222669, 1.367913, -1.033612, 1, 0, 0, 1, 1,
-0.2221111, 1.241047, 0.5986402, 1, 0, 0, 1, 1,
-0.2195565, -0.1021841, -2.211961, 1, 0, 0, 1, 1,
-0.2139875, -1.059377, -2.542304, 0, 0, 0, 1, 1,
-0.205816, 2.406391, 0.6344922, 0, 0, 0, 1, 1,
-0.2053952, -0.5793331, -2.838795, 0, 0, 0, 1, 1,
-0.2047383, 0.3770674, -1.316168, 0, 0, 0, 1, 1,
-0.2034497, 2.085843, -2.527142, 0, 0, 0, 1, 1,
-0.199569, -1.0595, -4.741577, 0, 0, 0, 1, 1,
-0.1973654, 0.8026733, -0.5462944, 0, 0, 0, 1, 1,
-0.1965572, 0.6129372, 0.9137291, 1, 1, 1, 1, 1,
-0.1954107, -0.1713963, -3.19932, 1, 1, 1, 1, 1,
-0.193995, -0.3668258, -1.644765, 1, 1, 1, 1, 1,
-0.1930891, 1.652835, 0.4223369, 1, 1, 1, 1, 1,
-0.1898971, -1.556616, -3.225657, 1, 1, 1, 1, 1,
-0.1893074, -0.3459672, -3.544773, 1, 1, 1, 1, 1,
-0.1864228, -0.5919906, -4.049363, 1, 1, 1, 1, 1,
-0.1782575, -0.959963, -1.505485, 1, 1, 1, 1, 1,
-0.1745729, 1.496936, -1.312598, 1, 1, 1, 1, 1,
-0.1742053, 0.6841654, -2.095145, 1, 1, 1, 1, 1,
-0.1741413, -0.5279573, -3.740299, 1, 1, 1, 1, 1,
-0.1703023, -0.3666434, -1.245805, 1, 1, 1, 1, 1,
-0.1656081, -0.8295065, -2.858051, 1, 1, 1, 1, 1,
-0.1620625, -0.4103871, -3.650505, 1, 1, 1, 1, 1,
-0.1617057, -1.122405, -3.9632, 1, 1, 1, 1, 1,
-0.1577726, 1.288047, -0.7294975, 0, 0, 1, 1, 1,
-0.1538299, 0.293907, -2.450356, 1, 0, 0, 1, 1,
-0.152495, -1.852861, -3.340833, 1, 0, 0, 1, 1,
-0.1462548, 1.491089, -0.9603343, 1, 0, 0, 1, 1,
-0.1443152, -0.07358132, -3.55311, 1, 0, 0, 1, 1,
-0.1416553, 0.9783577, -0.4554155, 1, 0, 0, 1, 1,
-0.1413623, 0.06451528, -0.352695, 0, 0, 0, 1, 1,
-0.1412317, -1.60033, -3.849327, 0, 0, 0, 1, 1,
-0.1395092, -0.2529615, -2.701131, 0, 0, 0, 1, 1,
-0.1377302, -0.2487809, -3.217085, 0, 0, 0, 1, 1,
-0.1332679, -0.1392868, -4.048585, 0, 0, 0, 1, 1,
-0.1317822, 0.3924598, -1.310153, 0, 0, 0, 1, 1,
-0.1305179, -1.737363, -1.367182, 0, 0, 0, 1, 1,
-0.1297807, 1.2779, -2.407199, 1, 1, 1, 1, 1,
-0.1293151, 0.44924, -2.787985, 1, 1, 1, 1, 1,
-0.1281295, -0.4853078, -2.829476, 1, 1, 1, 1, 1,
-0.1278461, -0.9284387, -3.536144, 1, 1, 1, 1, 1,
-0.1138399, -0.7968685, -3.789192, 1, 1, 1, 1, 1,
-0.112816, -2.053538, -4.299364, 1, 1, 1, 1, 1,
-0.1102713, -1.075032, -4.7882, 1, 1, 1, 1, 1,
-0.1086798, 0.9357731, -1.592559, 1, 1, 1, 1, 1,
-0.1055341, -0.3582479, -2.743163, 1, 1, 1, 1, 1,
-0.1055069, -0.8967739, -0.9547954, 1, 1, 1, 1, 1,
-0.1049872, -0.4243889, -3.331338, 1, 1, 1, 1, 1,
-0.104625, 1.288827, -1.69913, 1, 1, 1, 1, 1,
-0.1043765, -0.2772782, -2.708884, 1, 1, 1, 1, 1,
-0.09943146, 0.5387899, -0.2638889, 1, 1, 1, 1, 1,
-0.0993966, 2.085664, 0.07636739, 1, 1, 1, 1, 1,
-0.09834673, 1.214339, 0.1306638, 0, 0, 1, 1, 1,
-0.09612036, 0.9793028, -1.79281, 1, 0, 0, 1, 1,
-0.09341297, -1.743617, -2.076776, 1, 0, 0, 1, 1,
-0.09159014, 0.5717714, 1.090873, 1, 0, 0, 1, 1,
-0.08589559, -0.8572167, -3.1174, 1, 0, 0, 1, 1,
-0.08565991, 2.394545, 0.3861147, 1, 0, 0, 1, 1,
-0.08018794, -0.9684159, -4.107472, 0, 0, 0, 1, 1,
-0.07736042, -0.4107232, -2.208276, 0, 0, 0, 1, 1,
-0.075041, -0.5791564, -2.102109, 0, 0, 0, 1, 1,
-0.07213176, 0.02725962, -1.751378, 0, 0, 0, 1, 1,
-0.06888124, 1.056336, -0.6897796, 0, 0, 0, 1, 1,
-0.06775612, 1.710689, -0.186545, 0, 0, 0, 1, 1,
-0.06655835, 0.7634016, 0.8696642, 0, 0, 0, 1, 1,
-0.0661465, 0.001084081, -0.5995736, 1, 1, 1, 1, 1,
-0.06455322, -0.08616304, -2.01684, 1, 1, 1, 1, 1,
-0.06059443, 0.3126173, -0.8509114, 1, 1, 1, 1, 1,
-0.05805134, -0.1932623, -2.193209, 1, 1, 1, 1, 1,
-0.05353492, -1.469234, -3.174066, 1, 1, 1, 1, 1,
-0.04643801, -0.1424397, -3.913973, 1, 1, 1, 1, 1,
-0.04100822, 2.464138, 1.040549, 1, 1, 1, 1, 1,
-0.03934184, 2.102291, -0.884003, 1, 1, 1, 1, 1,
-0.0393098, -0.08543199, -3.998564, 1, 1, 1, 1, 1,
-0.03468806, -1.285576, -1.67915, 1, 1, 1, 1, 1,
-0.03018187, 0.7276076, -1.208, 1, 1, 1, 1, 1,
-0.02932985, -0.1446518, -4.270586, 1, 1, 1, 1, 1,
-0.02809644, 0.2369093, -0.6222368, 1, 1, 1, 1, 1,
-0.02620657, -0.5213208, -3.163121, 1, 1, 1, 1, 1,
-0.02454524, 0.848587, -1.784058, 1, 1, 1, 1, 1,
-0.02419679, -1.534582, -2.967752, 0, 0, 1, 1, 1,
-0.02414695, 0.327922, -2.281137, 1, 0, 0, 1, 1,
-0.02030431, 0.427031, 0.4501719, 1, 0, 0, 1, 1,
-0.01964924, 1.210587, 0.9034104, 1, 0, 0, 1, 1,
-0.01699114, -1.1955, -3.111859, 1, 0, 0, 1, 1,
-0.01636752, 1.928449, -1.869514, 1, 0, 0, 1, 1,
-0.01614246, -0.6971644, -2.226484, 0, 0, 0, 1, 1,
-0.009063697, -0.3019607, -2.71111, 0, 0, 0, 1, 1,
-0.004367262, 0.7982779, -0.1805417, 0, 0, 0, 1, 1,
-0.002298845, 1.100764, 0.2228784, 0, 0, 0, 1, 1,
0.0005616829, -0.3427131, 1.387159, 0, 0, 0, 1, 1,
0.001041886, 0.1563209, 0.06497398, 0, 0, 0, 1, 1,
0.004168027, 2.328603, -0.0503119, 0, 0, 0, 1, 1,
0.01280638, 1.146919, -0.4952095, 1, 1, 1, 1, 1,
0.01363757, 0.7815242, 0.5694918, 1, 1, 1, 1, 1,
0.01399622, -0.05465199, 4.299862, 1, 1, 1, 1, 1,
0.01569884, -0.7067817, 5.239631, 1, 1, 1, 1, 1,
0.01762952, -1.317292, 2.055742, 1, 1, 1, 1, 1,
0.01950949, 0.07529009, -0.7302475, 1, 1, 1, 1, 1,
0.01992408, -0.3003862, 2.55218, 1, 1, 1, 1, 1,
0.02330168, -1.332875, 3.578686, 1, 1, 1, 1, 1,
0.02447081, -1.016535, 2.335787, 1, 1, 1, 1, 1,
0.02558313, -0.1731667, 1.40939, 1, 1, 1, 1, 1,
0.02813128, 0.2539459, -2.295816, 1, 1, 1, 1, 1,
0.02881926, -0.6195839, 3.584377, 1, 1, 1, 1, 1,
0.03179829, -0.3176059, 2.373573, 1, 1, 1, 1, 1,
0.03783927, 1.830156, -0.3081631, 1, 1, 1, 1, 1,
0.03861635, -0.08339918, 3.294969, 1, 1, 1, 1, 1,
0.04287265, -1.22852, 1.124159, 0, 0, 1, 1, 1,
0.04691548, 0.3203598, 0.9385039, 1, 0, 0, 1, 1,
0.0470865, 1.468182, 0.004342106, 1, 0, 0, 1, 1,
0.04844142, -0.2959349, 3.017626, 1, 0, 0, 1, 1,
0.04861981, -1.465075, 2.69387, 1, 0, 0, 1, 1,
0.04865916, 0.2288889, -0.486944, 1, 0, 0, 1, 1,
0.04951557, 0.3602713, -1.730436, 0, 0, 0, 1, 1,
0.05199409, -0.4759049, 4.403376, 0, 0, 0, 1, 1,
0.05537488, 0.7666357, 0.02806277, 0, 0, 0, 1, 1,
0.05922969, -0.8893669, 2.684442, 0, 0, 0, 1, 1,
0.06227126, 1.445345, 1.223126, 0, 0, 0, 1, 1,
0.06272678, -0.5272858, 0.8834308, 0, 0, 0, 1, 1,
0.06849335, -0.804517, 3.316097, 0, 0, 0, 1, 1,
0.07047348, -0.5763746, 3.489029, 1, 1, 1, 1, 1,
0.07507621, -0.2481181, 2.670962, 1, 1, 1, 1, 1,
0.08132905, 0.6700044, 1.061054, 1, 1, 1, 1, 1,
0.08223464, -1.312742, 3.882345, 1, 1, 1, 1, 1,
0.08283554, -1.025402, 2.580172, 1, 1, 1, 1, 1,
0.08323052, -0.4809012, 3.552212, 1, 1, 1, 1, 1,
0.08423775, -0.7962764, 1.304277, 1, 1, 1, 1, 1,
0.08488403, -1.276282, 3.687158, 1, 1, 1, 1, 1,
0.08984801, -0.8531108, 2.537937, 1, 1, 1, 1, 1,
0.08989035, -1.488826, 2.63054, 1, 1, 1, 1, 1,
0.09138598, 0.2363638, 1.432385, 1, 1, 1, 1, 1,
0.09512437, 0.3447662, 0.6432396, 1, 1, 1, 1, 1,
0.09843054, -1.779951, 2.62875, 1, 1, 1, 1, 1,
0.1020446, -1.925568, 3.556572, 1, 1, 1, 1, 1,
0.1055011, -0.4421461, 1.826298, 1, 1, 1, 1, 1,
0.1073112, -0.5302954, 3.39986, 0, 0, 1, 1, 1,
0.1076302, -0.5228794, 2.526045, 1, 0, 0, 1, 1,
0.1081846, -1.025504, 4.247858, 1, 0, 0, 1, 1,
0.1103832, -1.596333, 2.181318, 1, 0, 0, 1, 1,
0.1131247, -0.5699646, 3.859324, 1, 0, 0, 1, 1,
0.1143136, -0.2196195, 2.791963, 1, 0, 0, 1, 1,
0.1163639, 0.2413646, 0.8892512, 0, 0, 0, 1, 1,
0.1195407, -0.6049453, 2.041203, 0, 0, 0, 1, 1,
0.1200395, 1.109439, 0.2146665, 0, 0, 0, 1, 1,
0.1267156, 0.1814775, 0.1971608, 0, 0, 0, 1, 1,
0.1277121, -1.372428, 1.595176, 0, 0, 0, 1, 1,
0.1290852, -0.03657497, 0.9571678, 0, 0, 0, 1, 1,
0.1293435, 0.08752199, 1.914125, 0, 0, 0, 1, 1,
0.1319056, 0.339961, 1.335256, 1, 1, 1, 1, 1,
0.132677, 0.3321095, 0.5381377, 1, 1, 1, 1, 1,
0.1330166, -2.188895, 3.875199, 1, 1, 1, 1, 1,
0.1335229, -0.019838, 1.893339, 1, 1, 1, 1, 1,
0.1348724, 1.488782, -0.4554052, 1, 1, 1, 1, 1,
0.1360398, -0.4483282, 3.908108, 1, 1, 1, 1, 1,
0.1393194, -1.253612, 3.529658, 1, 1, 1, 1, 1,
0.1396984, 0.2618479, 0.2848403, 1, 1, 1, 1, 1,
0.1441515, 2.340983, 2.068017, 1, 1, 1, 1, 1,
0.1468565, -1.801008, 4.904845, 1, 1, 1, 1, 1,
0.1474792, -1.527633, 3.740305, 1, 1, 1, 1, 1,
0.1493048, -2.62062, 2.024688, 1, 1, 1, 1, 1,
0.1507628, 2.658803, 0.3876316, 1, 1, 1, 1, 1,
0.1514184, -0.3718718, 2.261528, 1, 1, 1, 1, 1,
0.1523729, -1.19351, 2.733948, 1, 1, 1, 1, 1,
0.1538391, -0.1587598, 1.559655, 0, 0, 1, 1, 1,
0.1564874, -0.3846431, 2.946877, 1, 0, 0, 1, 1,
0.1565629, -0.696121, 3.544377, 1, 0, 0, 1, 1,
0.1601943, 0.03436309, 3.222167, 1, 0, 0, 1, 1,
0.1616861, -0.062635, 2.741307, 1, 0, 0, 1, 1,
0.1633111, 0.2923699, 0.6047087, 1, 0, 0, 1, 1,
0.1646355, -1.0688, 4.118202, 0, 0, 0, 1, 1,
0.1744819, 0.9433134, -0.4446967, 0, 0, 0, 1, 1,
0.1749243, 0.2944207, 0.07443182, 0, 0, 0, 1, 1,
0.1777739, -1.271393, 2.908739, 0, 0, 0, 1, 1,
0.1810524, -0.8998895, 1.263344, 0, 0, 0, 1, 1,
0.1871974, -0.3428611, 1.766883, 0, 0, 0, 1, 1,
0.1874625, 0.3265492, -0.2362773, 0, 0, 0, 1, 1,
0.1913647, -0.5397798, 2.405558, 1, 1, 1, 1, 1,
0.1958251, -0.3530399, 4.525341, 1, 1, 1, 1, 1,
0.1964143, 1.064951, -0.5961229, 1, 1, 1, 1, 1,
0.1970391, 1.329703, 0.9816499, 1, 1, 1, 1, 1,
0.1987268, 1.394474, 0.2132976, 1, 1, 1, 1, 1,
0.1992454, 0.4003081, -0.4441959, 1, 1, 1, 1, 1,
0.2042179, 1.189225, 0.343458, 1, 1, 1, 1, 1,
0.205511, -1.247165, 2.625498, 1, 1, 1, 1, 1,
0.2077293, 2.167345, -0.3917851, 1, 1, 1, 1, 1,
0.2105404, -0.185591, 2.655316, 1, 1, 1, 1, 1,
0.2129748, -1.163644, 2.50736, 1, 1, 1, 1, 1,
0.2131471, 1.018203, 0.2360621, 1, 1, 1, 1, 1,
0.2162974, 0.284722, 1.318592, 1, 1, 1, 1, 1,
0.2169653, -0.1123853, 1.597681, 1, 1, 1, 1, 1,
0.2237827, 0.6770587, 0.8056037, 1, 1, 1, 1, 1,
0.2249312, -0.6732157, 3.340533, 0, 0, 1, 1, 1,
0.2249903, -1.122545, 4.716264, 1, 0, 0, 1, 1,
0.2273631, 1.027124, -0.5062126, 1, 0, 0, 1, 1,
0.236571, -0.4513139, 4.451016, 1, 0, 0, 1, 1,
0.2381646, 0.1562167, 1.106739, 1, 0, 0, 1, 1,
0.2386912, -0.6288506, 2.808635, 1, 0, 0, 1, 1,
0.2398089, -0.1224117, 4.191255, 0, 0, 0, 1, 1,
0.2486687, 7.161662e-05, 0.5352047, 0, 0, 0, 1, 1,
0.254024, -0.07439874, 3.032624, 0, 0, 0, 1, 1,
0.2545386, -1.14591, 1.27843, 0, 0, 0, 1, 1,
0.2569341, -0.229402, 2.737433, 0, 0, 0, 1, 1,
0.2576576, -1.093322, 3.477824, 0, 0, 0, 1, 1,
0.2608121, 0.3227014, -0.4983501, 0, 0, 0, 1, 1,
0.2631876, -0.1620876, 1.719616, 1, 1, 1, 1, 1,
0.2634985, -0.3811671, 4.189634, 1, 1, 1, 1, 1,
0.2686458, -0.8501495, 4.759488, 1, 1, 1, 1, 1,
0.2696785, 0.2213588, -1.259863, 1, 1, 1, 1, 1,
0.270617, -0.03183778, 1.963586, 1, 1, 1, 1, 1,
0.270932, -0.7002989, 4.82833, 1, 1, 1, 1, 1,
0.2734559, -0.01795697, 0.716902, 1, 1, 1, 1, 1,
0.2835287, 0.4193189, 0.4185435, 1, 1, 1, 1, 1,
0.2839042, 1.506099, 1.55601, 1, 1, 1, 1, 1,
0.2898491, 0.5368944, -1.644007, 1, 1, 1, 1, 1,
0.290025, -1.491783, 4.452428, 1, 1, 1, 1, 1,
0.2910949, -0.6268516, 2.009435, 1, 1, 1, 1, 1,
0.3003973, -0.3094721, 4.460957, 1, 1, 1, 1, 1,
0.3016379, -0.2061736, 2.8594, 1, 1, 1, 1, 1,
0.302656, -1.168102, 2.648174, 1, 1, 1, 1, 1,
0.3049124, 0.3624637, 1.691, 0, 0, 1, 1, 1,
0.306284, 0.5556564, 1.905524, 1, 0, 0, 1, 1,
0.3110175, -0.4265314, 3.441219, 1, 0, 0, 1, 1,
0.3201648, 0.534535, -0.8222803, 1, 0, 0, 1, 1,
0.3309688, -0.3750579, 2.742978, 1, 0, 0, 1, 1,
0.3312833, 0.5752959, 1.626687, 1, 0, 0, 1, 1,
0.3319532, -0.221104, 1.799277, 0, 0, 0, 1, 1,
0.3323013, 0.4842898, 0.8061625, 0, 0, 0, 1, 1,
0.337565, -1.321134, 1.903521, 0, 0, 0, 1, 1,
0.3405665, -0.9504393, 5.065713, 0, 0, 0, 1, 1,
0.3432673, 1.443856, -0.2413351, 0, 0, 0, 1, 1,
0.3449846, 0.07120361, 0.3550878, 0, 0, 0, 1, 1,
0.3480632, -1.355067, 1.404697, 0, 0, 0, 1, 1,
0.3493429, 0.2073519, 3.250985, 1, 1, 1, 1, 1,
0.3498602, -0.8664344, 1.784419, 1, 1, 1, 1, 1,
0.3570449, 0.979387, 0.9358534, 1, 1, 1, 1, 1,
0.361685, 0.9557362, 0.9123987, 1, 1, 1, 1, 1,
0.3686472, -0.1676145, 3.411192, 1, 1, 1, 1, 1,
0.3751405, -0.6063306, -0.03023523, 1, 1, 1, 1, 1,
0.3768856, 1.087388, 0.9572817, 1, 1, 1, 1, 1,
0.377317, 0.3631327, 1.50172, 1, 1, 1, 1, 1,
0.3837016, -0.2935842, 2.497499, 1, 1, 1, 1, 1,
0.3854012, -0.003189289, 3.043033, 1, 1, 1, 1, 1,
0.3908741, -1.188757, 2.091415, 1, 1, 1, 1, 1,
0.3917607, 0.403264, 1.434247, 1, 1, 1, 1, 1,
0.3944815, -0.1422315, 2.978604, 1, 1, 1, 1, 1,
0.3951081, 1.351244, 1.439251, 1, 1, 1, 1, 1,
0.3958365, 0.2192533, 0.592793, 1, 1, 1, 1, 1,
0.396816, 1.094286, 1.05598, 0, 0, 1, 1, 1,
0.3974785, 1.311013, -0.2112661, 1, 0, 0, 1, 1,
0.3980486, 0.9661688, 2.323542, 1, 0, 0, 1, 1,
0.4005977, 2.142356, 0.4589921, 1, 0, 0, 1, 1,
0.4085006, -0.1446307, 2.00225, 1, 0, 0, 1, 1,
0.4086633, -0.2260376, 3.992427, 1, 0, 0, 1, 1,
0.4098802, -1.742584, 3.965441, 0, 0, 0, 1, 1,
0.4130494, -0.7040011, 2.079672, 0, 0, 0, 1, 1,
0.4152459, -1.135152, 3.417056, 0, 0, 0, 1, 1,
0.4165969, 0.05053933, 2.154988, 0, 0, 0, 1, 1,
0.4188334, -1.158065, 2.538722, 0, 0, 0, 1, 1,
0.4265304, -0.004604659, 0.5698058, 0, 0, 0, 1, 1,
0.4298099, -0.5903594, 3.053448, 0, 0, 0, 1, 1,
0.4322008, -0.2263204, 1.555017, 1, 1, 1, 1, 1,
0.4346744, -0.986422, 1.990812, 1, 1, 1, 1, 1,
0.437022, 0.6216791, 0.5263608, 1, 1, 1, 1, 1,
0.4401353, 0.4955147, 1.113293, 1, 1, 1, 1, 1,
0.4403201, 0.5445255, 1.287645, 1, 1, 1, 1, 1,
0.4411729, -0.3393713, 1.32887, 1, 1, 1, 1, 1,
0.444227, -0.8637266, 4.322148, 1, 1, 1, 1, 1,
0.4445942, 0.7906032, -1.206417, 1, 1, 1, 1, 1,
0.4503683, -1.1742, 3.974306, 1, 1, 1, 1, 1,
0.4593193, 0.9052857, 1.105021, 1, 1, 1, 1, 1,
0.4655977, 0.1865276, 1.891798, 1, 1, 1, 1, 1,
0.4717574, 1.425247, 1.545628, 1, 1, 1, 1, 1,
0.4718494, -1.197522, 2.932557, 1, 1, 1, 1, 1,
0.4751571, -1.113395, 2.623373, 1, 1, 1, 1, 1,
0.4762989, 0.5679303, 0.6236623, 1, 1, 1, 1, 1,
0.4781621, 1.170787, 1.264418, 0, 0, 1, 1, 1,
0.479147, 0.3566098, -0.4082305, 1, 0, 0, 1, 1,
0.4852578, 1.759414, -1.426745, 1, 0, 0, 1, 1,
0.4857353, 1.006649, 1.060592, 1, 0, 0, 1, 1,
0.4866418, -0.379836, 2.774225, 1, 0, 0, 1, 1,
0.4889484, -1.283502, 3.932225, 1, 0, 0, 1, 1,
0.4889651, 0.4521516, 1.519352, 0, 0, 0, 1, 1,
0.490207, 0.2797465, 2.055331, 0, 0, 0, 1, 1,
0.4910793, 0.5101789, 0.05388138, 0, 0, 0, 1, 1,
0.4935065, -0.9405239, 1.71774, 0, 0, 0, 1, 1,
0.4964949, 1.57856, 0.451064, 0, 0, 0, 1, 1,
0.5065555, 1.155987, 0.8074023, 0, 0, 0, 1, 1,
0.5067571, -0.7434263, 1.594501, 0, 0, 0, 1, 1,
0.5077026, 0.289035, 1.551112, 1, 1, 1, 1, 1,
0.5086285, 0.3481292, 3.610292, 1, 1, 1, 1, 1,
0.5089059, -0.3738635, 4.072227, 1, 1, 1, 1, 1,
0.5099563, 1.814236, 1.432148, 1, 1, 1, 1, 1,
0.5113283, -0.2657392, 2.738983, 1, 1, 1, 1, 1,
0.5121568, 0.03788026, 1.484956, 1, 1, 1, 1, 1,
0.5144193, 1.043133, 0.05853084, 1, 1, 1, 1, 1,
0.5144357, 0.6474475, 1.36032, 1, 1, 1, 1, 1,
0.5220194, -1.022476, 2.665043, 1, 1, 1, 1, 1,
0.5223551, 0.6269059, -1.242483, 1, 1, 1, 1, 1,
0.5236768, -1.368283, 3.319073, 1, 1, 1, 1, 1,
0.5245179, -1.01015, 2.245122, 1, 1, 1, 1, 1,
0.5263872, -1.962095, 2.863104, 1, 1, 1, 1, 1,
0.5290915, -1.971999, 3.459185, 1, 1, 1, 1, 1,
0.5291423, -0.7014227, 4.899424, 1, 1, 1, 1, 1,
0.5296271, 1.113342, 0.2077116, 0, 0, 1, 1, 1,
0.5363414, 0.9354882, -0.4967524, 1, 0, 0, 1, 1,
0.5372273, 0.6380886, 2.225963, 1, 0, 0, 1, 1,
0.5466335, 0.1190454, 2.55909, 1, 0, 0, 1, 1,
0.5482849, -0.5823754, 2.124136, 1, 0, 0, 1, 1,
0.56554, 1.318606, -0.07920656, 1, 0, 0, 1, 1,
0.5688421, -0.2124026, 2.769373, 0, 0, 0, 1, 1,
0.5694382, -1.297223, 2.140533, 0, 0, 0, 1, 1,
0.5696482, -0.4724453, 1.487611, 0, 0, 0, 1, 1,
0.5736722, 0.4500836, 2.512725, 0, 0, 0, 1, 1,
0.5743506, 0.8373823, 2.246785, 0, 0, 0, 1, 1,
0.5746549, -0.3625843, 1.358233, 0, 0, 0, 1, 1,
0.577247, -0.7173093, 3.606555, 0, 0, 0, 1, 1,
0.5809438, 0.5921038, -0.1446565, 1, 1, 1, 1, 1,
0.5853002, -1.876014, 2.227466, 1, 1, 1, 1, 1,
0.595083, 0.0375336, 0.3731723, 1, 1, 1, 1, 1,
0.5959064, -0.2091995, 1.402055, 1, 1, 1, 1, 1,
0.5965472, -0.9580213, 2.209197, 1, 1, 1, 1, 1,
0.6090749, 0.3831056, 2.674584, 1, 1, 1, 1, 1,
0.6106696, -2.103849, 4.050844, 1, 1, 1, 1, 1,
0.6111088, 0.1887715, 2.519808, 1, 1, 1, 1, 1,
0.6140644, 0.4495726, 2.283943, 1, 1, 1, 1, 1,
0.6142446, 0.4274971, 1.029861, 1, 1, 1, 1, 1,
0.615299, 0.6019911, 1.133969, 1, 1, 1, 1, 1,
0.6190903, 1.379273, 0.7436278, 1, 1, 1, 1, 1,
0.6205865, -0.3120846, 2.03241, 1, 1, 1, 1, 1,
0.6212355, -1.701031, 1.462063, 1, 1, 1, 1, 1,
0.6236229, 1.438953, -0.2114494, 1, 1, 1, 1, 1,
0.6304141, -0.4721482, 2.610563, 0, 0, 1, 1, 1,
0.631012, 0.3412857, -1.534614, 1, 0, 0, 1, 1,
0.6340052, -0.09788007, 2.198632, 1, 0, 0, 1, 1,
0.640223, 0.04041765, 0.3627093, 1, 0, 0, 1, 1,
0.6462033, -0.8337836, 2.750439, 1, 0, 0, 1, 1,
0.6575977, 0.01036946, 2.295642, 1, 0, 0, 1, 1,
0.6589196, -0.09737716, 0.6963896, 0, 0, 0, 1, 1,
0.662719, 0.2257537, 0.5669498, 0, 0, 0, 1, 1,
0.6650097, 0.446588, 0.8280423, 0, 0, 0, 1, 1,
0.6703894, 0.2198518, 0.8118778, 0, 0, 0, 1, 1,
0.678039, 0.6573524, 1.511447, 0, 0, 0, 1, 1,
0.6783901, -0.2750666, 1.645499, 0, 0, 0, 1, 1,
0.681717, -1.134449, 1.71666, 0, 0, 0, 1, 1,
0.6820115, -0.2903656, 0.9670179, 1, 1, 1, 1, 1,
0.6836169, 0.2101228, 2.388904, 1, 1, 1, 1, 1,
0.6840102, 0.229738, 0.1264444, 1, 1, 1, 1, 1,
0.6844652, 1.264733, 0.1328535, 1, 1, 1, 1, 1,
0.6871276, 1.201947, -0.04107058, 1, 1, 1, 1, 1,
0.6911132, 0.06094962, 2.152927, 1, 1, 1, 1, 1,
0.6933869, -1.661657, 3.626781, 1, 1, 1, 1, 1,
0.6959291, 0.07487173, 0.8693791, 1, 1, 1, 1, 1,
0.6971627, 0.2938659, 0.6674269, 1, 1, 1, 1, 1,
0.6980461, 0.02966054, 0.6399551, 1, 1, 1, 1, 1,
0.6981537, 1.568623, -0.4888132, 1, 1, 1, 1, 1,
0.7012244, -0.3810383, 3.715988, 1, 1, 1, 1, 1,
0.7117296, 1.564211, -0.5366367, 1, 1, 1, 1, 1,
0.7139561, -0.5163649, 1.252058, 1, 1, 1, 1, 1,
0.7147797, 1.2577, 0.8847002, 1, 1, 1, 1, 1,
0.7217538, 2.408749, 0.7663108, 0, 0, 1, 1, 1,
0.7292816, -0.8727173, 3.250859, 1, 0, 0, 1, 1,
0.7296917, -0.4773827, 3.262713, 1, 0, 0, 1, 1,
0.7377159, -0.8259045, 3.077525, 1, 0, 0, 1, 1,
0.7384402, 0.4300421, 1.059613, 1, 0, 0, 1, 1,
0.7446941, 1.841788, 1.66731, 1, 0, 0, 1, 1,
0.745121, -0.2018154, 1.226843, 0, 0, 0, 1, 1,
0.7521665, 1.835818, -2.584397, 0, 0, 0, 1, 1,
0.7524204, -0.3859251, 0.9468599, 0, 0, 0, 1, 1,
0.754205, 1.318599, 2.043212, 0, 0, 0, 1, 1,
0.7560925, -0.06178001, 3.098592, 0, 0, 0, 1, 1,
0.757544, -1.795656, 4.607805, 0, 0, 0, 1, 1,
0.7584664, -0.7944076, 3.251498, 0, 0, 0, 1, 1,
0.7622488, 0.5562963, 0.7658812, 1, 1, 1, 1, 1,
0.7696402, -1.88858, 4.936066, 1, 1, 1, 1, 1,
0.770363, -0.02724187, 2.178258, 1, 1, 1, 1, 1,
0.7765373, -1.664652, 2.738439, 1, 1, 1, 1, 1,
0.7778484, -0.2569659, 2.128448, 1, 1, 1, 1, 1,
0.7795847, 2.026912, -1.370262, 1, 1, 1, 1, 1,
0.7828901, -2.565118, 0.2424382, 1, 1, 1, 1, 1,
0.7854357, -0.4916373, 2.056542, 1, 1, 1, 1, 1,
0.7941267, -0.2524143, 2.31372, 1, 1, 1, 1, 1,
0.798601, 1.974714, -0.8905889, 1, 1, 1, 1, 1,
0.7993317, 0.4701631, -0.9622589, 1, 1, 1, 1, 1,
0.7997656, -0.2163544, 2.164114, 1, 1, 1, 1, 1,
0.800689, -1.097905, 2.712752, 1, 1, 1, 1, 1,
0.8010923, 0.454133, 3.045591, 1, 1, 1, 1, 1,
0.8121371, -0.9893389, 4.268179, 1, 1, 1, 1, 1,
0.8128417, -0.3811822, 3.128371, 0, 0, 1, 1, 1,
0.815445, -0.04028615, 1.727015, 1, 0, 0, 1, 1,
0.8164746, -1.686707, 3.092885, 1, 0, 0, 1, 1,
0.8174115, 1.248399, 0.1186646, 1, 0, 0, 1, 1,
0.819007, 0.8254989, 0.2405632, 1, 0, 0, 1, 1,
0.8196745, 1.959249, -1.322217, 1, 0, 0, 1, 1,
0.8275919, -0.7612792, 2.185433, 0, 0, 0, 1, 1,
0.83386, 1.008268, 0.9460967, 0, 0, 0, 1, 1,
0.8399147, 1.448665, 0.2711122, 0, 0, 0, 1, 1,
0.8437433, -0.2873021, 1.246381, 0, 0, 0, 1, 1,
0.844011, -1.161071, 3.420891, 0, 0, 0, 1, 1,
0.8481534, 0.7735044, 0.05191215, 0, 0, 0, 1, 1,
0.8525895, 1.560112, 0.3964593, 0, 0, 0, 1, 1,
0.8552952, -1.016434, 2.292051, 1, 1, 1, 1, 1,
0.8559898, -2.309464, 2.276282, 1, 1, 1, 1, 1,
0.8677496, 0.5997505, 0.2795435, 1, 1, 1, 1, 1,
0.8679637, 2.014117, 0.7608776, 1, 1, 1, 1, 1,
0.8691478, 1.249645, 1.153036, 1, 1, 1, 1, 1,
0.8710237, -0.3886809, 0.3764268, 1, 1, 1, 1, 1,
0.8746826, 1.144611, -0.4634529, 1, 1, 1, 1, 1,
0.8748536, 0.4107095, 2.355559, 1, 1, 1, 1, 1,
0.8763285, 0.6800849, 0.874087, 1, 1, 1, 1, 1,
0.879011, 0.2472495, 0.2135845, 1, 1, 1, 1, 1,
0.8824172, 0.6436312, 1.123623, 1, 1, 1, 1, 1,
0.8837009, 0.8463942, 0.1986049, 1, 1, 1, 1, 1,
0.8850667, -0.2515074, 2.856864, 1, 1, 1, 1, 1,
0.8880154, 0.7002755, 1.250938, 1, 1, 1, 1, 1,
0.8900229, -0.6867526, 2.137713, 1, 1, 1, 1, 1,
0.8921381, -0.2290813, 2.891289, 0, 0, 1, 1, 1,
0.8931967, 0.06431267, 0.5382646, 1, 0, 0, 1, 1,
0.8964481, -0.02448849, 1.801005, 1, 0, 0, 1, 1,
0.9088575, 0.1765686, 1.078242, 1, 0, 0, 1, 1,
0.9110945, 0.4852816, 1.290114, 1, 0, 0, 1, 1,
0.9120005, -0.8685377, 3.733447, 1, 0, 0, 1, 1,
0.9152895, 0.3969471, 0.1454445, 0, 0, 0, 1, 1,
0.9178533, 0.4859807, -0.6654436, 0, 0, 0, 1, 1,
0.9192009, -0.002148443, 0.9437338, 0, 0, 0, 1, 1,
0.9200405, -0.2059534, 2.692251, 0, 0, 0, 1, 1,
0.922052, 1.320057, -0.7067418, 0, 0, 0, 1, 1,
0.9221483, -1.332522, 2.838441, 0, 0, 0, 1, 1,
0.9256484, 2.219719, 1.161612, 0, 0, 0, 1, 1,
0.933508, 0.1267606, 0.6619498, 1, 1, 1, 1, 1,
0.93511, 1.133605, 0.07177649, 1, 1, 1, 1, 1,
0.9368185, 0.8377116, 1.321621, 1, 1, 1, 1, 1,
0.9442019, 0.8588462, 1.414923, 1, 1, 1, 1, 1,
0.9442968, -0.9165345, 1.487615, 1, 1, 1, 1, 1,
0.9453567, -0.8277237, 1.083488, 1, 1, 1, 1, 1,
0.9525055, 0.6507652, 0.9601172, 1, 1, 1, 1, 1,
0.9556049, -1.244845, 4.089715, 1, 1, 1, 1, 1,
0.9563804, -0.4837555, 2.17291, 1, 1, 1, 1, 1,
0.9600436, -0.3509665, 3.276335, 1, 1, 1, 1, 1,
0.9611138, -0.858401, 1.430729, 1, 1, 1, 1, 1,
0.9627832, -0.4509122, 3.13279, 1, 1, 1, 1, 1,
0.9668118, 0.9586481, 2.098741, 1, 1, 1, 1, 1,
0.9673131, -1.884738, 1.941725, 1, 1, 1, 1, 1,
0.9675669, -0.2338968, 0.1076478, 1, 1, 1, 1, 1,
0.9779744, 0.7788467, -0.1472705, 0, 0, 1, 1, 1,
0.9796711, 1.755658, 0.1053594, 1, 0, 0, 1, 1,
0.9797451, -0.3815767, 3.503623, 1, 0, 0, 1, 1,
0.9836898, 3.297294, -0.6325489, 1, 0, 0, 1, 1,
0.996867, -0.916378, 2.377399, 1, 0, 0, 1, 1,
1.002638, -0.4553067, 3.226869, 1, 0, 0, 1, 1,
1.004746, -1.034647, 2.699279, 0, 0, 0, 1, 1,
1.007828, -0.7227819, 3.77729, 0, 0, 0, 1, 1,
1.007871, -0.7857068, 1.040207, 0, 0, 0, 1, 1,
1.008684, 1.090697, 1.994816, 0, 0, 0, 1, 1,
1.01511, 1.556004, 0.5808756, 0, 0, 0, 1, 1,
1.015281, 0.9317816, 1.184585, 0, 0, 0, 1, 1,
1.024801, -0.1711621, 0.6656088, 0, 0, 0, 1, 1,
1.03292, 1.484432, 1.070742, 1, 1, 1, 1, 1,
1.033843, 0.3208686, 1.520396, 1, 1, 1, 1, 1,
1.038233, -0.5110388, 1.522452, 1, 1, 1, 1, 1,
1.039251, 0.7328423, 0.2581175, 1, 1, 1, 1, 1,
1.045487, 0.2006394, 2.080223, 1, 1, 1, 1, 1,
1.045937, 2.027833, -0.2813404, 1, 1, 1, 1, 1,
1.049724, -0.3233855, 1.390781, 1, 1, 1, 1, 1,
1.050973, -1.48376, 3.090246, 1, 1, 1, 1, 1,
1.053384, 0.7893078, 1.307678, 1, 1, 1, 1, 1,
1.059342, -0.6032956, 1.965198, 1, 1, 1, 1, 1,
1.061113, 0.1921459, 2.182542, 1, 1, 1, 1, 1,
1.066756, -1.649823, 3.2924, 1, 1, 1, 1, 1,
1.069536, 0.1937376, 2.076971, 1, 1, 1, 1, 1,
1.077269, 0.6325227, 1.157328, 1, 1, 1, 1, 1,
1.080599, 2.044685, 1.331112, 1, 1, 1, 1, 1,
1.091848, 0.5015867, -0.06272867, 0, 0, 1, 1, 1,
1.101924, 0.565987, 0.9496845, 1, 0, 0, 1, 1,
1.116044, 0.5649762, 1.32033, 1, 0, 0, 1, 1,
1.118486, -0.1839394, 1.655417, 1, 0, 0, 1, 1,
1.13423, -0.3961774, 1.439862, 1, 0, 0, 1, 1,
1.142067, -1.59984, 2.669351, 1, 0, 0, 1, 1,
1.146046, 0.1839548, 1.104322, 0, 0, 0, 1, 1,
1.148402, -0.2811419, -0.1281542, 0, 0, 0, 1, 1,
1.149889, -0.3091593, 2.155331, 0, 0, 0, 1, 1,
1.151678, -0.2782717, 2.108689, 0, 0, 0, 1, 1,
1.157408, 1.327967, 0.05961839, 0, 0, 0, 1, 1,
1.158675, 1.097773, -0.1218277, 0, 0, 0, 1, 1,
1.166741, -0.7012973, 3.669194, 0, 0, 0, 1, 1,
1.170194, -0.7940321, 3.594234, 1, 1, 1, 1, 1,
1.170874, 0.5217775, 0.8816271, 1, 1, 1, 1, 1,
1.177595, -0.222217, 2.715586, 1, 1, 1, 1, 1,
1.185237, 0.131913, 0.174311, 1, 1, 1, 1, 1,
1.193217, -1.210163, 2.067942, 1, 1, 1, 1, 1,
1.19656, 0.01644569, 1.429123, 1, 1, 1, 1, 1,
1.198115, -0.04067721, 1.586284, 1, 1, 1, 1, 1,
1.202032, -1.740325, 1.996139, 1, 1, 1, 1, 1,
1.202197, -0.4982238, 2.032135, 1, 1, 1, 1, 1,
1.226259, -0.2009912, 1.425074, 1, 1, 1, 1, 1,
1.236241, 0.01201667, 2.036393, 1, 1, 1, 1, 1,
1.239863, 0.6735989, 2.320022, 1, 1, 1, 1, 1,
1.242067, 0.5651848, 0.5868943, 1, 1, 1, 1, 1,
1.24586, -0.9002675, 3.046341, 1, 1, 1, 1, 1,
1.247745, -0.5265351, 0.6600366, 1, 1, 1, 1, 1,
1.248323, -0.9117735, 1.052951, 0, 0, 1, 1, 1,
1.255784, -1.195647, 1.890966, 1, 0, 0, 1, 1,
1.257931, 0.2654853, 2.053096, 1, 0, 0, 1, 1,
1.263826, -0.201586, 1.20104, 1, 0, 0, 1, 1,
1.273036, 1.428619, 1.772505, 1, 0, 0, 1, 1,
1.275871, 0.1917814, 1.5956, 1, 0, 0, 1, 1,
1.277923, -0.4584541, 1.477731, 0, 0, 0, 1, 1,
1.279064, 1.33306, -0.5920326, 0, 0, 0, 1, 1,
1.298055, 0.1899315, 3.068389, 0, 0, 0, 1, 1,
1.302489, 0.1002721, -0.1035587, 0, 0, 0, 1, 1,
1.30272, 0.2895578, 1.642768, 0, 0, 0, 1, 1,
1.330728, -1.709296, 1.920635, 0, 0, 0, 1, 1,
1.336185, 0.06238727, 1.997359, 0, 0, 0, 1, 1,
1.338943, -1.967473, 3.489507, 1, 1, 1, 1, 1,
1.339265, 0.5227696, 1.357817, 1, 1, 1, 1, 1,
1.339785, -0.1918457, 0.963811, 1, 1, 1, 1, 1,
1.34117, 1.316819, 0.299909, 1, 1, 1, 1, 1,
1.343014, 0.1906143, 2.689304, 1, 1, 1, 1, 1,
1.353884, -0.2114598, 1.693375, 1, 1, 1, 1, 1,
1.35764, 0.5186587, 1.679649, 1, 1, 1, 1, 1,
1.358486, -1.190294, 2.814617, 1, 1, 1, 1, 1,
1.359375, -0.52303, 2.0281, 1, 1, 1, 1, 1,
1.360254, -0.7377688, 2.630924, 1, 1, 1, 1, 1,
1.373657, -1.294314, 2.256282, 1, 1, 1, 1, 1,
1.395894, -0.3518173, 2.42111, 1, 1, 1, 1, 1,
1.398578, 0.4578006, 0.9753116, 1, 1, 1, 1, 1,
1.398805, -0.5209476, 1.476402, 1, 1, 1, 1, 1,
1.400679, -0.2583176, 1.823497, 1, 1, 1, 1, 1,
1.402695, -1.021607, 2.032634, 0, 0, 1, 1, 1,
1.404101, 0.3367457, 1.214238, 1, 0, 0, 1, 1,
1.404609, -0.2962431, 2.668854, 1, 0, 0, 1, 1,
1.408742, 0.007878536, 2.194793, 1, 0, 0, 1, 1,
1.410228, -1.275669, 1.610998, 1, 0, 0, 1, 1,
1.41247, -1.228974, 3.265691, 1, 0, 0, 1, 1,
1.417157, 0.3216728, 1.567813, 0, 0, 0, 1, 1,
1.417483, 0.3055152, 1.034506, 0, 0, 0, 1, 1,
1.418797, -0.5623301, 0.04756038, 0, 0, 0, 1, 1,
1.419906, -2.172884, 3.561188, 0, 0, 0, 1, 1,
1.420599, -1.069703, 2.135666, 0, 0, 0, 1, 1,
1.42217, 0.9006271, 1.496011, 0, 0, 0, 1, 1,
1.422644, -0.4541461, 1.33205, 0, 0, 0, 1, 1,
1.42371, 1.513441, -0.9840944, 1, 1, 1, 1, 1,
1.425638, 1.309615, 1.520729, 1, 1, 1, 1, 1,
1.430457, -0.1689501, 2.129257, 1, 1, 1, 1, 1,
1.434677, -0.1794343, -0.03605928, 1, 1, 1, 1, 1,
1.44002, -0.588201, 1.056695, 1, 1, 1, 1, 1,
1.443177, -0.449635, 1.487658, 1, 1, 1, 1, 1,
1.46456, -1.204589, 1.854588, 1, 1, 1, 1, 1,
1.481222, 0.6787753, 1.422393, 1, 1, 1, 1, 1,
1.508138, -0.08870939, 3.544607, 1, 1, 1, 1, 1,
1.521601, 1.983239, 1.452332, 1, 1, 1, 1, 1,
1.54387, 0.8373611, 1.23457, 1, 1, 1, 1, 1,
1.546861, 1.037487, 0.03851064, 1, 1, 1, 1, 1,
1.560447, 0.5847108, 0.9413536, 1, 1, 1, 1, 1,
1.565772, 1.361383, -0.3319571, 1, 1, 1, 1, 1,
1.571674, -1.185388, 1.365702, 1, 1, 1, 1, 1,
1.593915, 0.3669263, -0.216328, 0, 0, 1, 1, 1,
1.608681, 1.414196, 0.4963772, 1, 0, 0, 1, 1,
1.608739, 0.9057788, -0.7533362, 1, 0, 0, 1, 1,
1.636065, -1.660954, 3.463785, 1, 0, 0, 1, 1,
1.677399, 0.01366578, 1.609693, 1, 0, 0, 1, 1,
1.683476, 1.803867, 1.126581, 1, 0, 0, 1, 1,
1.686792, 1.466715, 1.688042, 0, 0, 0, 1, 1,
1.689498, -1.101131, 1.985948, 0, 0, 0, 1, 1,
1.697422, -0.298819, 1.049776, 0, 0, 0, 1, 1,
1.717162, 0.440284, 1.77945, 0, 0, 0, 1, 1,
1.727136, 0.6196809, 2.991362, 0, 0, 0, 1, 1,
1.730579, -1.50278, 1.669881, 0, 0, 0, 1, 1,
1.730579, 0.4636459, -0.1964487, 0, 0, 0, 1, 1,
1.73979, -1.38533, 2.618193, 1, 1, 1, 1, 1,
1.742652, -1.101663, 0.8031698, 1, 1, 1, 1, 1,
1.743955, 0.5778252, -0.136867, 1, 1, 1, 1, 1,
1.750061, 0.05527668, 2.783571, 1, 1, 1, 1, 1,
1.777428, -0.01967737, 1.735832, 1, 1, 1, 1, 1,
1.778714, -0.5102108, 3.125763, 1, 1, 1, 1, 1,
1.779215, 1.094477, 0.6445267, 1, 1, 1, 1, 1,
1.784783, -0.9380187, 2.394441, 1, 1, 1, 1, 1,
1.796612, -0.6438826, 1.444487, 1, 1, 1, 1, 1,
1.804461, -0.1822663, 1.774448, 1, 1, 1, 1, 1,
1.827242, -1.968708, 1.37109, 1, 1, 1, 1, 1,
1.836105, 0.879235, 1.896494, 1, 1, 1, 1, 1,
1.87221, 2.000524, -0.6982404, 1, 1, 1, 1, 1,
1.877438, 0.7545394, 0.9947308, 1, 1, 1, 1, 1,
1.879572, -0.5849512, 3.99466, 1, 1, 1, 1, 1,
1.926939, 0.8520319, 0.4969192, 0, 0, 1, 1, 1,
1.927122, 0.4330556, 1.449948, 1, 0, 0, 1, 1,
1.966431, 0.6373312, 0.5553845, 1, 0, 0, 1, 1,
1.975449, -0.6614439, 1.204778, 1, 0, 0, 1, 1,
2.007597, -0.6151257, 0.6500333, 1, 0, 0, 1, 1,
2.008516, 1.024845, 0.8413076, 1, 0, 0, 1, 1,
2.022735, -0.3440391, 1.682201, 0, 0, 0, 1, 1,
2.059727, -1.633941, 0.6690089, 0, 0, 0, 1, 1,
2.063953, -0.3388734, 2.89601, 0, 0, 0, 1, 1,
2.085951, -0.5210024, 0.9413046, 0, 0, 0, 1, 1,
2.137213, 0.7680924, 0.9963555, 0, 0, 0, 1, 1,
2.364614, 0.161659, -0.4440706, 0, 0, 0, 1, 1,
2.414509, 0.4043522, 1.322033, 0, 0, 0, 1, 1,
2.41527, 0.8449956, 1.804491, 1, 1, 1, 1, 1,
2.429572, 0.3892145, 2.022768, 1, 1, 1, 1, 1,
2.470433, -1.585154, 1.128691, 1, 1, 1, 1, 1,
2.473341, -0.8291289, 1.062981, 1, 1, 1, 1, 1,
2.526009, -0.8702791, 2.640872, 1, 1, 1, 1, 1,
2.612765, 1.554508, 0.0370437, 1, 1, 1, 1, 1,
2.638344, -1.371172, 1.3707, 1, 1, 1, 1, 1
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
var radius = 9.195804;
var distance = 32.29987;
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
mvMatrix.translate( 0.6097268, -0.3383366, -0.2257152 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.29987);
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
