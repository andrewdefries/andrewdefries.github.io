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
-3.70096, 0.03729814, -0.304648, 1, 0, 0, 1,
-2.652663, -1.471811, -1.959528, 1, 0.007843138, 0, 1,
-2.608028, 0.7714378, 0.6864967, 1, 0.01176471, 0, 1,
-2.539723, -0.2924448, -1.006029, 1, 0.01960784, 0, 1,
-2.429616, 0.9722255, -1.780039, 1, 0.02352941, 0, 1,
-2.399876, -0.6809329, -2.371369, 1, 0.03137255, 0, 1,
-2.399087, 0.3988723, 0.7748168, 1, 0.03529412, 0, 1,
-2.325087, 0.5184671, -0.6800128, 1, 0.04313726, 0, 1,
-2.324071, 0.7410481, -0.4704643, 1, 0.04705882, 0, 1,
-2.286096, -0.5333054, -2.56616, 1, 0.05490196, 0, 1,
-2.258775, -0.1357775, -0.6673336, 1, 0.05882353, 0, 1,
-2.242458, -1.452405, -1.687731, 1, 0.06666667, 0, 1,
-2.112864, 1.657805, -1.078728, 1, 0.07058824, 0, 1,
-2.064933, -0.9427579, -1.699317, 1, 0.07843138, 0, 1,
-2.062733, -0.8721491, -2.50925, 1, 0.08235294, 0, 1,
-2.01942, 2.055682, -1.532307, 1, 0.09019608, 0, 1,
-2.017281, -0.2683757, -1.443868, 1, 0.09411765, 0, 1,
-2.012277, -1.223482, -1.836735, 1, 0.1019608, 0, 1,
-2.004423, 1.240348, -1.32802, 1, 0.1098039, 0, 1,
-1.99025, 0.6639157, -1.534015, 1, 0.1137255, 0, 1,
-1.966486, 1.250483, -0.7010985, 1, 0.1215686, 0, 1,
-1.9102, -0.7660657, -3.099363, 1, 0.1254902, 0, 1,
-1.901109, -0.4206118, -1.531494, 1, 0.1333333, 0, 1,
-1.898038, 0.7714071, -1.96609, 1, 0.1372549, 0, 1,
-1.861694, 0.7016846, -2.58693, 1, 0.145098, 0, 1,
-1.86119, 0.7229005, -1.413695, 1, 0.1490196, 0, 1,
-1.858368, -0.9733322, -1.657114, 1, 0.1568628, 0, 1,
-1.856162, 0.9674653, -1.57467, 1, 0.1607843, 0, 1,
-1.834815, 0.2236886, -0.2812208, 1, 0.1686275, 0, 1,
-1.831577, 0.0148048, -3.014126, 1, 0.172549, 0, 1,
-1.810041, -0.6656265, -0.8748088, 1, 0.1803922, 0, 1,
-1.79778, 0.2322721, -0.7525035, 1, 0.1843137, 0, 1,
-1.795885, 1.308851, -1.745844, 1, 0.1921569, 0, 1,
-1.794251, -2.149716, -2.619766, 1, 0.1960784, 0, 1,
-1.789076, -0.7196245, -2.171887, 1, 0.2039216, 0, 1,
-1.773012, 0.06318517, -2.235806, 1, 0.2117647, 0, 1,
-1.770057, -1.291715, -2.68252, 1, 0.2156863, 0, 1,
-1.762426, 0.008659449, -1.220679, 1, 0.2235294, 0, 1,
-1.760117, -1.82266, -2.685687, 1, 0.227451, 0, 1,
-1.713183, 0.897943, -0.2239357, 1, 0.2352941, 0, 1,
-1.709141, 0.1971698, 0.1498584, 1, 0.2392157, 0, 1,
-1.66923, 0.1792499, -1.643757, 1, 0.2470588, 0, 1,
-1.663547, -0.7981122, -0.9791816, 1, 0.2509804, 0, 1,
-1.663243, 0.5858936, -2.346104, 1, 0.2588235, 0, 1,
-1.65291, 0.947729, -0.2368645, 1, 0.2627451, 0, 1,
-1.652795, 0.06257062, -0.7797564, 1, 0.2705882, 0, 1,
-1.645174, -1.203813, -1.106951, 1, 0.2745098, 0, 1,
-1.637996, -0.8656259, -1.872501, 1, 0.282353, 0, 1,
-1.637387, -0.2010324, -2.336562, 1, 0.2862745, 0, 1,
-1.630349, 1.348023, -1.179142, 1, 0.2941177, 0, 1,
-1.619774, 0.4613731, -1.135889, 1, 0.3019608, 0, 1,
-1.606239, 0.6306959, -0.2847345, 1, 0.3058824, 0, 1,
-1.600889, 0.6474311, -1.429328, 1, 0.3137255, 0, 1,
-1.599115, -0.7477877, -2.141223, 1, 0.3176471, 0, 1,
-1.594884, -0.8295082, -0.1724739, 1, 0.3254902, 0, 1,
-1.591575, 1.727773, 1.493696, 1, 0.3294118, 0, 1,
-1.579157, 1.462558, -2.334738, 1, 0.3372549, 0, 1,
-1.576925, -1.557735, -3.654727, 1, 0.3411765, 0, 1,
-1.574355, -0.3145096, -0.6027532, 1, 0.3490196, 0, 1,
-1.57309, 0.01562592, -0.4131178, 1, 0.3529412, 0, 1,
-1.570825, -0.1358339, -1.602379, 1, 0.3607843, 0, 1,
-1.567147, 0.7997657, -2.395115, 1, 0.3647059, 0, 1,
-1.560143, 0.6758204, 0.6761869, 1, 0.372549, 0, 1,
-1.557627, 0.8054177, -0.5160491, 1, 0.3764706, 0, 1,
-1.554269, -0.2437921, -2.066853, 1, 0.3843137, 0, 1,
-1.55348, 3.487208, -1.922366, 1, 0.3882353, 0, 1,
-1.550583, -0.847126, -1.849676, 1, 0.3960784, 0, 1,
-1.546019, 0.7490435, -0.7253027, 1, 0.4039216, 0, 1,
-1.54468, 1.152589, -1.042456, 1, 0.4078431, 0, 1,
-1.52323, 0.7678917, -0.4503852, 1, 0.4156863, 0, 1,
-1.510264, -0.1940788, -0.8056703, 1, 0.4196078, 0, 1,
-1.496689, 1.08826, -2.268901, 1, 0.427451, 0, 1,
-1.492285, -1.251601, -0.7338952, 1, 0.4313726, 0, 1,
-1.476721, 0.633395, 0.5096731, 1, 0.4392157, 0, 1,
-1.472481, 0.7210284, -1.689836, 1, 0.4431373, 0, 1,
-1.470299, -0.07761808, -0.1715821, 1, 0.4509804, 0, 1,
-1.46656, -1.434652, -2.282864, 1, 0.454902, 0, 1,
-1.458517, 3.007589, -0.4790649, 1, 0.4627451, 0, 1,
-1.452527, 0.0898539, -1.223603, 1, 0.4666667, 0, 1,
-1.435759, -1.098298, -2.790835, 1, 0.4745098, 0, 1,
-1.431658, -0.4964139, -1.22809, 1, 0.4784314, 0, 1,
-1.431371, -0.5337126, -2.048473, 1, 0.4862745, 0, 1,
-1.416345, -0.06105008, -1.863759, 1, 0.4901961, 0, 1,
-1.416089, -0.4994679, -1.275341, 1, 0.4980392, 0, 1,
-1.407775, -0.6400499, -2.492983, 1, 0.5058824, 0, 1,
-1.397731, -1.817589, -1.959488, 1, 0.509804, 0, 1,
-1.393887, 0.4416368, -3.0616, 1, 0.5176471, 0, 1,
-1.381458, -0.9195154, -3.95444, 1, 0.5215687, 0, 1,
-1.372872, -0.9500757, -3.95863, 1, 0.5294118, 0, 1,
-1.368998, 0.8845382, -2.379488, 1, 0.5333334, 0, 1,
-1.357067, 0.4017926, -1.15549, 1, 0.5411765, 0, 1,
-1.340204, -0.1454215, -1.681774, 1, 0.5450981, 0, 1,
-1.337218, 1.87796, -2.331649, 1, 0.5529412, 0, 1,
-1.328646, 0.443196, -0.08974677, 1, 0.5568628, 0, 1,
-1.327368, 0.2904015, -1.058406, 1, 0.5647059, 0, 1,
-1.323753, -0.02404088, -0.2373477, 1, 0.5686275, 0, 1,
-1.320471, 1.160861, -2.144591, 1, 0.5764706, 0, 1,
-1.316806, -0.4678477, -2.615454, 1, 0.5803922, 0, 1,
-1.30416, -0.3787189, -1.013861, 1, 0.5882353, 0, 1,
-1.301468, 1.081424, -0.4207128, 1, 0.5921569, 0, 1,
-1.301106, 1.802162, -2.416897, 1, 0.6, 0, 1,
-1.299821, 0.2853095, -1.097881, 1, 0.6078432, 0, 1,
-1.298761, 0.7812429, 0.9383298, 1, 0.6117647, 0, 1,
-1.296238, 0.4199742, -1.903727, 1, 0.6196079, 0, 1,
-1.29577, 0.6646203, 1.173252, 1, 0.6235294, 0, 1,
-1.286562, -1.298238, -3.071264, 1, 0.6313726, 0, 1,
-1.283149, -0.003105999, -2.495802, 1, 0.6352941, 0, 1,
-1.280929, 0.8145043, -0.3215734, 1, 0.6431373, 0, 1,
-1.271383, -1.085477, -2.722108, 1, 0.6470588, 0, 1,
-1.267495, -2.028039, -3.909758, 1, 0.654902, 0, 1,
-1.262758, 0.1537508, -3.67821, 1, 0.6588235, 0, 1,
-1.259695, -0.5302093, -4.109892, 1, 0.6666667, 0, 1,
-1.258441, -0.4361741, -1.628712, 1, 0.6705883, 0, 1,
-1.251789, -0.4819931, -2.451246, 1, 0.6784314, 0, 1,
-1.249378, 0.3250327, -1.895977, 1, 0.682353, 0, 1,
-1.2446, -0.4297448, -0.3984057, 1, 0.6901961, 0, 1,
-1.244202, 1.042373, -1.163897, 1, 0.6941177, 0, 1,
-1.243098, 1.317896, 0.1416036, 1, 0.7019608, 0, 1,
-1.240552, -0.03150314, -2.214969, 1, 0.7098039, 0, 1,
-1.236507, -0.4707646, -2.072844, 1, 0.7137255, 0, 1,
-1.23064, 0.1112535, -3.29954, 1, 0.7215686, 0, 1,
-1.226385, -1.978986, -2.105387, 1, 0.7254902, 0, 1,
-1.225358, 1.811213, 0.3041462, 1, 0.7333333, 0, 1,
-1.224795, -0.02942361, -2.411291, 1, 0.7372549, 0, 1,
-1.219824, -0.03517207, -2.761959, 1, 0.7450981, 0, 1,
-1.212599, -1.323666, -4.654072, 1, 0.7490196, 0, 1,
-1.211425, 0.5024404, -1.004427, 1, 0.7568628, 0, 1,
-1.208122, 0.5904511, 0.472708, 1, 0.7607843, 0, 1,
-1.200175, 0.9495934, -0.3664013, 1, 0.7686275, 0, 1,
-1.19906, 0.1944543, -0.3204994, 1, 0.772549, 0, 1,
-1.174642, -0.6511332, -1.365977, 1, 0.7803922, 0, 1,
-1.168735, 0.1505104, -1.56916, 1, 0.7843137, 0, 1,
-1.158, 0.6881655, -1.944009, 1, 0.7921569, 0, 1,
-1.153872, 1.170394, 1.71588, 1, 0.7960784, 0, 1,
-1.152642, -1.657804, -3.061748, 1, 0.8039216, 0, 1,
-1.151916, -0.7820422, -2.075629, 1, 0.8117647, 0, 1,
-1.146536, -0.7325984, -1.964251, 1, 0.8156863, 0, 1,
-1.146252, 1.095544, 0.3888485, 1, 0.8235294, 0, 1,
-1.143529, 0.0278045, -0.9798466, 1, 0.827451, 0, 1,
-1.143391, -0.4624746, -0.08678859, 1, 0.8352941, 0, 1,
-1.140109, -0.5788133, -0.5844418, 1, 0.8392157, 0, 1,
-1.139704, -0.04261054, -2.211174, 1, 0.8470588, 0, 1,
-1.131599, -1.131637, -2.965958, 1, 0.8509804, 0, 1,
-1.128945, 0.8846458, -2.770028, 1, 0.8588235, 0, 1,
-1.126035, 0.4391744, -1.327918, 1, 0.8627451, 0, 1,
-1.11849, -0.5315439, 0.02660048, 1, 0.8705882, 0, 1,
-1.117507, -0.628253, -1.51325, 1, 0.8745098, 0, 1,
-1.1161, 0.5260374, -3.068344, 1, 0.8823529, 0, 1,
-1.1087, 1.922741, -0.4672979, 1, 0.8862745, 0, 1,
-1.101754, 0.01563483, -2.39693, 1, 0.8941177, 0, 1,
-1.101611, 1.041443, -1.775342, 1, 0.8980392, 0, 1,
-1.099141, 0.5736097, -2.001376, 1, 0.9058824, 0, 1,
-1.097927, 0.7818165, -1.536048, 1, 0.9137255, 0, 1,
-1.080697, 0.1734961, 0.8505713, 1, 0.9176471, 0, 1,
-1.079884, -0.4432479, -2.517401, 1, 0.9254902, 0, 1,
-1.079307, -0.6515543, -1.27796, 1, 0.9294118, 0, 1,
-1.07687, -0.4208611, -0.4837883, 1, 0.9372549, 0, 1,
-1.066343, -0.1064589, -2.406155, 1, 0.9411765, 0, 1,
-1.060405, 1.095153, -2.748142, 1, 0.9490196, 0, 1,
-1.0504, -0.9691602, -4.455166, 1, 0.9529412, 0, 1,
-1.049299, -0.9111006, -1.485392, 1, 0.9607843, 0, 1,
-1.045238, -1.405928, -4.451088, 1, 0.9647059, 0, 1,
-1.035934, 0.7679753, 0.1231402, 1, 0.972549, 0, 1,
-1.034796, -0.5236386, -2.480397, 1, 0.9764706, 0, 1,
-1.029613, -0.4022101, -1.754696, 1, 0.9843137, 0, 1,
-1.026576, 1.2226, -2.516209, 1, 0.9882353, 0, 1,
-1.021334, -0.6040764, -4.310925, 1, 0.9960784, 0, 1,
-1.01849, 1.434432, -1.0736, 0.9960784, 1, 0, 1,
-1.01566, -0.6313685, -0.3500375, 0.9921569, 1, 0, 1,
-1.011983, -0.7015671, -2.461898, 0.9843137, 1, 0, 1,
-1.009317, 0.8306506, -1.978764, 0.9803922, 1, 0, 1,
-1.008162, -0.5315945, -3.468189, 0.972549, 1, 0, 1,
-1.0056, 0.1281803, -1.516966, 0.9686275, 1, 0, 1,
-1.002351, 1.239866, -1.925285, 0.9607843, 1, 0, 1,
-1.001093, 0.1689109, 0.1656662, 0.9568627, 1, 0, 1,
-0.9978529, 0.3392456, -1.148988, 0.9490196, 1, 0, 1,
-0.991439, 2.014239, -1.121812, 0.945098, 1, 0, 1,
-0.9898079, -0.9677338, -1.880346, 0.9372549, 1, 0, 1,
-0.9842206, -1.935964, -4.70663, 0.9333333, 1, 0, 1,
-0.9733372, -0.3477933, -2.478653, 0.9254902, 1, 0, 1,
-0.9707233, 0.715912, -1.646147, 0.9215686, 1, 0, 1,
-0.9686542, 0.7593395, -1.222641, 0.9137255, 1, 0, 1,
-0.9680566, -1.552025, -4.304992, 0.9098039, 1, 0, 1,
-0.9676539, 0.2564831, -0.7108014, 0.9019608, 1, 0, 1,
-0.9662547, -1.784428, -4.02701, 0.8941177, 1, 0, 1,
-0.9656372, 0.4126157, -1.203972, 0.8901961, 1, 0, 1,
-0.964644, 1.634408, -0.6582152, 0.8823529, 1, 0, 1,
-0.9531168, 0.5737105, -0.8515656, 0.8784314, 1, 0, 1,
-0.9453569, -0.2343987, -0.8320354, 0.8705882, 1, 0, 1,
-0.9450292, -1.21845, -2.932568, 0.8666667, 1, 0, 1,
-0.9442577, -1.214141, -2.460834, 0.8588235, 1, 0, 1,
-0.942855, -0.5426924, -3.666786, 0.854902, 1, 0, 1,
-0.9373607, 0.8445605, -1.135028, 0.8470588, 1, 0, 1,
-0.9270504, 0.1933346, -1.075025, 0.8431373, 1, 0, 1,
-0.9261234, 0.1619416, -3.003888, 0.8352941, 1, 0, 1,
-0.9249732, 0.7020073, -1.501903, 0.8313726, 1, 0, 1,
-0.9223376, -0.4237405, -2.825496, 0.8235294, 1, 0, 1,
-0.9204902, 0.3698853, 0.2257513, 0.8196079, 1, 0, 1,
-0.9168689, 0.2712568, -2.346571, 0.8117647, 1, 0, 1,
-0.9044384, -0.002893228, -0.2840889, 0.8078431, 1, 0, 1,
-0.898599, 0.7264496, -1.276686, 0.8, 1, 0, 1,
-0.8936928, 0.07021999, -1.047925, 0.7921569, 1, 0, 1,
-0.8934191, 0.5093074, -1.415811, 0.7882353, 1, 0, 1,
-0.885614, 1.363469, 0.4620661, 0.7803922, 1, 0, 1,
-0.8837951, 0.2872249, -2.798963, 0.7764706, 1, 0, 1,
-0.8806635, 0.0002681072, -0.5923799, 0.7686275, 1, 0, 1,
-0.8790467, 0.1038951, -2.839439, 0.7647059, 1, 0, 1,
-0.8752841, -0.100573, -1.585366, 0.7568628, 1, 0, 1,
-0.8743578, 0.4607233, -1.429071, 0.7529412, 1, 0, 1,
-0.8704129, -0.8454284, -1.945666, 0.7450981, 1, 0, 1,
-0.8687236, -0.5383865, -2.958231, 0.7411765, 1, 0, 1,
-0.8624764, 0.951198, -1.788779, 0.7333333, 1, 0, 1,
-0.8582945, -0.3932033, -3.483081, 0.7294118, 1, 0, 1,
-0.8512962, 2.412716, -0.4370376, 0.7215686, 1, 0, 1,
-0.8453682, 1.775036, -2.558788, 0.7176471, 1, 0, 1,
-0.8428199, -0.09111661, -0.34535, 0.7098039, 1, 0, 1,
-0.8388698, -0.3084072, -2.3958, 0.7058824, 1, 0, 1,
-0.8386323, -0.3901976, -2.589789, 0.6980392, 1, 0, 1,
-0.8190296, 2.011552, -0.2376038, 0.6901961, 1, 0, 1,
-0.816166, -0.4241056, -3.312733, 0.6862745, 1, 0, 1,
-0.8123538, 0.458187, -1.386651, 0.6784314, 1, 0, 1,
-0.811524, -1.144215, -2.260268, 0.6745098, 1, 0, 1,
-0.8076837, 0.8224485, 1.437967, 0.6666667, 1, 0, 1,
-0.8072368, 0.5432954, -1.190986, 0.6627451, 1, 0, 1,
-0.8064513, 1.29939, -0.9637128, 0.654902, 1, 0, 1,
-0.7993279, 1.732996, -0.5657626, 0.6509804, 1, 0, 1,
-0.7984778, 0.4711193, -0.05910209, 0.6431373, 1, 0, 1,
-0.7969521, -0.1807044, -1.411737, 0.6392157, 1, 0, 1,
-0.7908857, 0.1518099, 0.6395752, 0.6313726, 1, 0, 1,
-0.7847918, -0.8193254, -1.767287, 0.627451, 1, 0, 1,
-0.7831253, 0.6795376, -1.444411, 0.6196079, 1, 0, 1,
-0.7799498, 0.5856056, -1.668266, 0.6156863, 1, 0, 1,
-0.777068, -1.177805, -4.123024, 0.6078432, 1, 0, 1,
-0.774742, -0.6702503, -1.797381, 0.6039216, 1, 0, 1,
-0.7725711, 2.113435, 0.5766099, 0.5960785, 1, 0, 1,
-0.7720177, 0.3808089, -2.100209, 0.5882353, 1, 0, 1,
-0.7687469, 0.2398753, -1.689426, 0.5843138, 1, 0, 1,
-0.7673419, 1.469112, -0.4832211, 0.5764706, 1, 0, 1,
-0.7634745, -0.09263571, -2.075415, 0.572549, 1, 0, 1,
-0.7621067, -0.4318303, -4.98489, 0.5647059, 1, 0, 1,
-0.7601544, 1.491218, -1.052372, 0.5607843, 1, 0, 1,
-0.756166, -1.103855, -3.945733, 0.5529412, 1, 0, 1,
-0.7555062, -0.08871026, -1.858387, 0.5490196, 1, 0, 1,
-0.7526063, 1.984063, -0.1595282, 0.5411765, 1, 0, 1,
-0.7499701, 0.5932518, -1.479717, 0.5372549, 1, 0, 1,
-0.7433919, 1.123039, -0.313389, 0.5294118, 1, 0, 1,
-0.7373044, -0.9827567, -3.578191, 0.5254902, 1, 0, 1,
-0.7348069, -1.323917, -1.533992, 0.5176471, 1, 0, 1,
-0.7345135, 0.2818275, -0.8828111, 0.5137255, 1, 0, 1,
-0.7304905, -0.8598392, -1.924921, 0.5058824, 1, 0, 1,
-0.7277165, 1.025259, -1.056785, 0.5019608, 1, 0, 1,
-0.7269067, 1.232402, -0.947041, 0.4941176, 1, 0, 1,
-0.725158, 2.035476, -0.8377587, 0.4862745, 1, 0, 1,
-0.7231621, 0.2240504, -0.3911122, 0.4823529, 1, 0, 1,
-0.7199642, 0.04141446, -2.184094, 0.4745098, 1, 0, 1,
-0.7142981, -1.761621, -1.087141, 0.4705882, 1, 0, 1,
-0.7137701, 0.2200287, 0.5536005, 0.4627451, 1, 0, 1,
-0.7121353, 1.288936, -0.2339515, 0.4588235, 1, 0, 1,
-0.7093917, 0.3119226, 0.2084152, 0.4509804, 1, 0, 1,
-0.7084447, 0.414848, -1.00897, 0.4470588, 1, 0, 1,
-0.7048364, -1.929272, -1.821745, 0.4392157, 1, 0, 1,
-0.7031997, 0.8343939, -0.04779855, 0.4352941, 1, 0, 1,
-0.7014427, 0.8946525, -1.125678, 0.427451, 1, 0, 1,
-0.7013243, 2.339772, -1.22356, 0.4235294, 1, 0, 1,
-0.6956005, 1.212707, -0.2662111, 0.4156863, 1, 0, 1,
-0.6940102, -0.938303, -4.736985, 0.4117647, 1, 0, 1,
-0.6888322, 1.010159, -0.03588862, 0.4039216, 1, 0, 1,
-0.6811285, -0.1375882, 0.2526901, 0.3960784, 1, 0, 1,
-0.6790499, -1.247445, -3.882949, 0.3921569, 1, 0, 1,
-0.6773272, 1.175838, 0.0281796, 0.3843137, 1, 0, 1,
-0.6755247, -0.9936029, -1.385277, 0.3803922, 1, 0, 1,
-0.6626111, 1.19287, -0.830839, 0.372549, 1, 0, 1,
-0.6530778, 0.8965027, -1.890673, 0.3686275, 1, 0, 1,
-0.6474263, -0.3012005, -2.932779, 0.3607843, 1, 0, 1,
-0.6466033, 0.1836607, -2.083352, 0.3568628, 1, 0, 1,
-0.644763, -1.798796, -1.077049, 0.3490196, 1, 0, 1,
-0.6435968, -0.5649734, -1.55661, 0.345098, 1, 0, 1,
-0.6434788, -0.3612348, -1.872606, 0.3372549, 1, 0, 1,
-0.6415467, 0.248822, -3.094039, 0.3333333, 1, 0, 1,
-0.6354008, -0.1439704, -2.433413, 0.3254902, 1, 0, 1,
-0.6327742, 1.659515, 0.2159135, 0.3215686, 1, 0, 1,
-0.6321669, 0.2892663, -0.3769024, 0.3137255, 1, 0, 1,
-0.6270599, 0.5326496, 1.0749, 0.3098039, 1, 0, 1,
-0.6237545, 0.5488871, -2.543223, 0.3019608, 1, 0, 1,
-0.6232033, 0.2261314, -0.6480525, 0.2941177, 1, 0, 1,
-0.6201909, 0.1412957, -2.851333, 0.2901961, 1, 0, 1,
-0.6198047, -0.6157061, -1.696289, 0.282353, 1, 0, 1,
-0.6160419, -0.09442563, -1.151606, 0.2784314, 1, 0, 1,
-0.6047461, -1.468302, -4.180165, 0.2705882, 1, 0, 1,
-0.6027662, -0.2804172, -2.519201, 0.2666667, 1, 0, 1,
-0.5991781, -0.158839, -2.387019, 0.2588235, 1, 0, 1,
-0.5976158, 0.3518175, 0.3163384, 0.254902, 1, 0, 1,
-0.5925174, 0.4432715, -3.190454, 0.2470588, 1, 0, 1,
-0.5910847, 0.9084594, -2.588995, 0.2431373, 1, 0, 1,
-0.5908182, -0.988346, -3.685548, 0.2352941, 1, 0, 1,
-0.5877181, 0.3818783, -2.608271, 0.2313726, 1, 0, 1,
-0.5855811, -0.5494446, -1.49998, 0.2235294, 1, 0, 1,
-0.5736355, -1.079574, -3.068827, 0.2196078, 1, 0, 1,
-0.5736116, 1.1572, -0.4420204, 0.2117647, 1, 0, 1,
-0.5706806, 1.237073, -1.226462, 0.2078431, 1, 0, 1,
-0.5585103, -1.845582, -3.114712, 0.2, 1, 0, 1,
-0.5572426, -1.172785, -2.588878, 0.1921569, 1, 0, 1,
-0.5546975, 2.716956, -0.006312117, 0.1882353, 1, 0, 1,
-0.5501897, 0.246441, -0.7846829, 0.1803922, 1, 0, 1,
-0.5493147, -0.3774803, -0.2347392, 0.1764706, 1, 0, 1,
-0.5466913, -0.01714937, -0.9058336, 0.1686275, 1, 0, 1,
-0.5456917, -0.6060508, -3.340822, 0.1647059, 1, 0, 1,
-0.5428512, 1.889634, -0.7764141, 0.1568628, 1, 0, 1,
-0.5398784, -0.5923143, -2.174367, 0.1529412, 1, 0, 1,
-0.5387843, -1.219401, -3.443232, 0.145098, 1, 0, 1,
-0.5354615, -0.3758059, -2.134702, 0.1411765, 1, 0, 1,
-0.5345148, 0.4993242, 0.8264769, 0.1333333, 1, 0, 1,
-0.5287948, -0.9338316, -2.460036, 0.1294118, 1, 0, 1,
-0.5278788, -1.388848, -3.693626, 0.1215686, 1, 0, 1,
-0.5237826, 0.2414092, -1.237405, 0.1176471, 1, 0, 1,
-0.5222075, 0.3599592, -1.472533, 0.1098039, 1, 0, 1,
-0.520746, 2.311012, -0.1359501, 0.1058824, 1, 0, 1,
-0.519495, 1.989054, 2.325353, 0.09803922, 1, 0, 1,
-0.5188529, -0.7172581, -3.437393, 0.09019608, 1, 0, 1,
-0.5162533, 0.7210122, -1.452545, 0.08627451, 1, 0, 1,
-0.516067, -0.920379, -4.791343, 0.07843138, 1, 0, 1,
-0.5125502, 1.566983, 0.363326, 0.07450981, 1, 0, 1,
-0.5080392, 1.152519, 0.03343224, 0.06666667, 1, 0, 1,
-0.5067295, -0.1551395, -1.226057, 0.0627451, 1, 0, 1,
-0.5014597, -0.7440972, -1.503519, 0.05490196, 1, 0, 1,
-0.4991957, -0.179075, -2.847631, 0.05098039, 1, 0, 1,
-0.495162, -3.624067, -3.294079, 0.04313726, 1, 0, 1,
-0.4941171, 1.285855, -1.456632, 0.03921569, 1, 0, 1,
-0.4900887, -1.804981, -2.079044, 0.03137255, 1, 0, 1,
-0.4876882, 0.8839707, 0.5978822, 0.02745098, 1, 0, 1,
-0.4838882, -1.120368, -3.308892, 0.01960784, 1, 0, 1,
-0.481906, -0.7094483, -2.251108, 0.01568628, 1, 0, 1,
-0.4798246, -0.06989197, -1.282119, 0.007843138, 1, 0, 1,
-0.4797311, 0.9798356, -1.482151, 0.003921569, 1, 0, 1,
-0.4778124, -0.1368766, -2.452873, 0, 1, 0.003921569, 1,
-0.476815, 0.1279187, -2.091474, 0, 1, 0.01176471, 1,
-0.4703312, 2.326321, 0.03637058, 0, 1, 0.01568628, 1,
-0.4674597, -1.938428, -2.89927, 0, 1, 0.02352941, 1,
-0.4583604, -0.7845589, -4.055516, 0, 1, 0.02745098, 1,
-0.4530057, -0.4184545, -2.122202, 0, 1, 0.03529412, 1,
-0.4477007, 0.3960276, -0.7465826, 0, 1, 0.03921569, 1,
-0.4471443, -0.05937395, -3.722934, 0, 1, 0.04705882, 1,
-0.4463297, 1.293599, 1.330346, 0, 1, 0.05098039, 1,
-0.4454848, -1.129488, -3.37341, 0, 1, 0.05882353, 1,
-0.444308, 1.163598, 0.5228836, 0, 1, 0.0627451, 1,
-0.441712, -0.3510548, -2.482075, 0, 1, 0.07058824, 1,
-0.4373464, -0.4275405, -3.122624, 0, 1, 0.07450981, 1,
-0.4276928, 0.03146845, 0.6009893, 0, 1, 0.08235294, 1,
-0.42557, -1.208673, -2.715891, 0, 1, 0.08627451, 1,
-0.4238229, -1.289617, -2.746473, 0, 1, 0.09411765, 1,
-0.4124276, 0.1449916, 0.4998452, 0, 1, 0.1019608, 1,
-0.4102297, 0.3452369, -1.491718, 0, 1, 0.1058824, 1,
-0.4083608, 0.08622245, -0.5591375, 0, 1, 0.1137255, 1,
-0.403847, -1.520685, -3.57001, 0, 1, 0.1176471, 1,
-0.3973288, -0.7255514, -1.781002, 0, 1, 0.1254902, 1,
-0.3917724, 0.8043525, -1.006108, 0, 1, 0.1294118, 1,
-0.389041, 0.09318437, -0.01801258, 0, 1, 0.1372549, 1,
-0.3879941, -0.9385952, -1.895591, 0, 1, 0.1411765, 1,
-0.3870829, 0.3660796, -0.5093852, 0, 1, 0.1490196, 1,
-0.3864733, 0.2974921, 0.3035755, 0, 1, 0.1529412, 1,
-0.3846322, 0.2195513, 0.5285872, 0, 1, 0.1607843, 1,
-0.3805886, -1.388404, -4.979174, 0, 1, 0.1647059, 1,
-0.377115, -0.2032885, -2.667207, 0, 1, 0.172549, 1,
-0.3696117, 0.02494445, -1.33722, 0, 1, 0.1764706, 1,
-0.3687162, 0.8656234, 0.157335, 0, 1, 0.1843137, 1,
-0.3684021, -0.8948427, -0.972874, 0, 1, 0.1882353, 1,
-0.3683469, 0.2808534, -1.92143, 0, 1, 0.1960784, 1,
-0.3648385, -1.28545, -2.336895, 0, 1, 0.2039216, 1,
-0.3636284, -1.018281, -1.851957, 0, 1, 0.2078431, 1,
-0.3611604, 0.8617088, -3.199327, 0, 1, 0.2156863, 1,
-0.3569262, 1.626675, -1.067312, 0, 1, 0.2196078, 1,
-0.3564254, -0.9620916, -4.23509, 0, 1, 0.227451, 1,
-0.3558052, 1.081154, 1.110292, 0, 1, 0.2313726, 1,
-0.3556703, 0.9639558, -1.068816, 0, 1, 0.2392157, 1,
-0.3542498, -0.3071083, -3.48957, 0, 1, 0.2431373, 1,
-0.3511494, -0.3105089, -0.2574789, 0, 1, 0.2509804, 1,
-0.3476528, 1.100083, 1.056568, 0, 1, 0.254902, 1,
-0.3456725, 0.7013013, -1.730421, 0, 1, 0.2627451, 1,
-0.3423398, -0.3964536, -2.961056, 0, 1, 0.2666667, 1,
-0.3358621, 0.09068714, -2.342532, 0, 1, 0.2745098, 1,
-0.3337997, 1.617536, 1.862769, 0, 1, 0.2784314, 1,
-0.3308446, -0.1925057, -4.281027, 0, 1, 0.2862745, 1,
-0.3279992, 1.561698, -0.18387, 0, 1, 0.2901961, 1,
-0.3265583, -1.127246, -3.468714, 0, 1, 0.2980392, 1,
-0.3263206, -0.541763, -1.973847, 0, 1, 0.3058824, 1,
-0.3258825, 0.2207637, -0.3984947, 0, 1, 0.3098039, 1,
-0.3249876, -1.689137, -2.561219, 0, 1, 0.3176471, 1,
-0.3225479, -0.1065713, -2.268933, 0, 1, 0.3215686, 1,
-0.3224018, -0.7672824, -0.5560352, 0, 1, 0.3294118, 1,
-0.3221325, 0.5345131, -0.9808671, 0, 1, 0.3333333, 1,
-0.3207361, -0.0622995, -2.891409, 0, 1, 0.3411765, 1,
-0.3184745, 0.460042, 0.3585681, 0, 1, 0.345098, 1,
-0.3176176, 2.062563, -0.616826, 0, 1, 0.3529412, 1,
-0.3162997, -0.8729024, -1.730693, 0, 1, 0.3568628, 1,
-0.3143112, 0.7472568, -1.413124, 0, 1, 0.3647059, 1,
-0.3127218, 1.013256, -1.30012, 0, 1, 0.3686275, 1,
-0.3091771, 0.4310749, -2.309963, 0, 1, 0.3764706, 1,
-0.3085349, 0.4093646, -0.9589524, 0, 1, 0.3803922, 1,
-0.3082902, -1.506771, -2.036147, 0, 1, 0.3882353, 1,
-0.3080278, -0.289655, -3.974409, 0, 1, 0.3921569, 1,
-0.3043904, 0.5853226, 0.2810897, 0, 1, 0.4, 1,
-0.3013169, -0.3009386, -1.071981, 0, 1, 0.4078431, 1,
-0.300952, -0.6728488, -2.530157, 0, 1, 0.4117647, 1,
-0.2973567, -0.3643584, -1.606103, 0, 1, 0.4196078, 1,
-0.2947513, -1.245129, -2.108823, 0, 1, 0.4235294, 1,
-0.2934234, 1.613739, 0.8839873, 0, 1, 0.4313726, 1,
-0.2927911, -1.237143, -3.864489, 0, 1, 0.4352941, 1,
-0.2925354, 1.105828, -0.3959286, 0, 1, 0.4431373, 1,
-0.28641, -0.8125875, -1.963385, 0, 1, 0.4470588, 1,
-0.2863096, 0.2116179, -1.880562, 0, 1, 0.454902, 1,
-0.2782108, -0.07448032, -1.672323, 0, 1, 0.4588235, 1,
-0.272871, -0.3577076, -1.472231, 0, 1, 0.4666667, 1,
-0.2613796, -1.697869, -3.167371, 0, 1, 0.4705882, 1,
-0.2557229, 0.5394472, -1.91588, 0, 1, 0.4784314, 1,
-0.2549856, 0.2053351, 0.09392329, 0, 1, 0.4823529, 1,
-0.2540818, 0.3551947, -1.704203, 0, 1, 0.4901961, 1,
-0.2533325, 0.1160508, -0.9684387, 0, 1, 0.4941176, 1,
-0.2441637, 1.117425, -2.444109, 0, 1, 0.5019608, 1,
-0.2430702, -1.609901, -3.80363, 0, 1, 0.509804, 1,
-0.2409121, -0.7995106, -2.71914, 0, 1, 0.5137255, 1,
-0.2375491, -0.9460598, -3.721678, 0, 1, 0.5215687, 1,
-0.2328766, -0.9979605, -2.921687, 0, 1, 0.5254902, 1,
-0.2315861, -0.8400261, -2.401267, 0, 1, 0.5333334, 1,
-0.2309841, 0.6824083, -0.4254524, 0, 1, 0.5372549, 1,
-0.2308463, 2.082747, 1.958823, 0, 1, 0.5450981, 1,
-0.227763, 0.7186545, -0.9702784, 0, 1, 0.5490196, 1,
-0.2256056, -0.5549501, -3.010433, 0, 1, 0.5568628, 1,
-0.2219847, -0.8320883, -3.227655, 0, 1, 0.5607843, 1,
-0.2188513, -0.4778939, -1.470087, 0, 1, 0.5686275, 1,
-0.2163193, 0.2704661, 1.146342, 0, 1, 0.572549, 1,
-0.2152387, 0.7002037, 0.2621367, 0, 1, 0.5803922, 1,
-0.2134151, 0.4943897, -0.117372, 0, 1, 0.5843138, 1,
-0.2111833, -0.1655732, -1.869191, 0, 1, 0.5921569, 1,
-0.2043533, 1.761817, 1.392874, 0, 1, 0.5960785, 1,
-0.2035666, 0.2503864, 0.8567766, 0, 1, 0.6039216, 1,
-0.2019715, -0.2567281, -3.126954, 0, 1, 0.6117647, 1,
-0.2016106, 0.7325132, 1.22564, 0, 1, 0.6156863, 1,
-0.1999555, 1.355772, 0.7849978, 0, 1, 0.6235294, 1,
-0.1997169, -0.3151282, -4.615241, 0, 1, 0.627451, 1,
-0.196717, 0.2961365, -1.490377, 0, 1, 0.6352941, 1,
-0.1966733, -1.226844, -3.670163, 0, 1, 0.6392157, 1,
-0.1903438, -0.5157501, -2.243341, 0, 1, 0.6470588, 1,
-0.1900639, -0.4925956, -2.47539, 0, 1, 0.6509804, 1,
-0.1844716, 1.043557, 0.6866065, 0, 1, 0.6588235, 1,
-0.1815271, 0.5537554, 0.2743697, 0, 1, 0.6627451, 1,
-0.1782727, -0.9412127, -1.606766, 0, 1, 0.6705883, 1,
-0.1671234, -0.9908322, -3.663157, 0, 1, 0.6745098, 1,
-0.1648663, 0.6023409, 0.592282, 0, 1, 0.682353, 1,
-0.1501515, -1.207591, -2.752241, 0, 1, 0.6862745, 1,
-0.1491296, 0.01479496, -2.164833, 0, 1, 0.6941177, 1,
-0.1450595, 1.602238, -0.888815, 0, 1, 0.7019608, 1,
-0.1445098, 0.05529343, 0.9557169, 0, 1, 0.7058824, 1,
-0.1390579, 1.026957, -0.8904473, 0, 1, 0.7137255, 1,
-0.1360589, -0.786874, -2.624034, 0, 1, 0.7176471, 1,
-0.1331164, 0.4996378, -0.03556721, 0, 1, 0.7254902, 1,
-0.1254544, 1.087859, -0.767009, 0, 1, 0.7294118, 1,
-0.1245472, -0.3702485, -3.151174, 0, 1, 0.7372549, 1,
-0.1211606, -0.5564133, -3.217675, 0, 1, 0.7411765, 1,
-0.1178237, 0.3800071, -1.272591, 0, 1, 0.7490196, 1,
-0.1177065, -1.056877, -5.004235, 0, 1, 0.7529412, 1,
-0.1121966, 0.5162819, 0.514494, 0, 1, 0.7607843, 1,
-0.1108536, 0.3257987, -0.8253747, 0, 1, 0.7647059, 1,
-0.1089817, 0.9999498, -1.400991, 0, 1, 0.772549, 1,
-0.1083327, 1.536158, -0.2233889, 0, 1, 0.7764706, 1,
-0.1075057, -1.409823, -2.309425, 0, 1, 0.7843137, 1,
-0.1049572, -1.755615, -2.108595, 0, 1, 0.7882353, 1,
-0.1037589, 0.7448358, 0.1832986, 0, 1, 0.7960784, 1,
-0.09294261, 1.24661, -0.644013, 0, 1, 0.8039216, 1,
-0.09282857, 1.888101, 0.612915, 0, 1, 0.8078431, 1,
-0.09170568, -0.5801456, -3.207196, 0, 1, 0.8156863, 1,
-0.09004595, -0.8753704, -2.819301, 0, 1, 0.8196079, 1,
-0.08928041, 0.7064784, -0.3888202, 0, 1, 0.827451, 1,
-0.08823405, -1.041014, -3.93988, 0, 1, 0.8313726, 1,
-0.0877075, 1.620873, -0.5741636, 0, 1, 0.8392157, 1,
-0.0835162, -0.6232525, -3.825299, 0, 1, 0.8431373, 1,
-0.07850778, 0.9882937, -0.8281913, 0, 1, 0.8509804, 1,
-0.07551283, -0.1966373, -2.252501, 0, 1, 0.854902, 1,
-0.07431103, -1.542575, -2.680862, 0, 1, 0.8627451, 1,
-0.06961203, -0.3810704, -2.146515, 0, 1, 0.8666667, 1,
-0.06312041, 1.649453, -0.7042105, 0, 1, 0.8745098, 1,
-0.05941569, 0.351164, -2.411483, 0, 1, 0.8784314, 1,
-0.05608433, -1.058037, -3.721012, 0, 1, 0.8862745, 1,
-0.05511782, -1.258322, -4.238991, 0, 1, 0.8901961, 1,
-0.05378342, -0.6480694, -2.391354, 0, 1, 0.8980392, 1,
-0.05164886, -0.7253529, -2.819447, 0, 1, 0.9058824, 1,
-0.04945615, 0.9855996, -0.7482878, 0, 1, 0.9098039, 1,
-0.04827953, 0.4817803, 0.8469434, 0, 1, 0.9176471, 1,
-0.03875561, 1.207742, 1.270341, 0, 1, 0.9215686, 1,
-0.03826338, -0.3317189, -3.015972, 0, 1, 0.9294118, 1,
-0.0375005, -0.309587, -2.18413, 0, 1, 0.9333333, 1,
-0.03683943, 0.6914332, 0.08653767, 0, 1, 0.9411765, 1,
-0.02988615, -2.03549, -3.045439, 0, 1, 0.945098, 1,
-0.02922982, -1.017236, -2.945881, 0, 1, 0.9529412, 1,
-0.02922855, -0.3214152, -4.412577, 0, 1, 0.9568627, 1,
-0.02111101, -0.549688, -4.2066, 0, 1, 0.9647059, 1,
-0.0204932, -0.2863641, -3.034282, 0, 1, 0.9686275, 1,
-0.01980447, -0.07978848, -2.459932, 0, 1, 0.9764706, 1,
-0.01567233, 0.4312405, -0.1220915, 0, 1, 0.9803922, 1,
-0.01420613, 0.8185627, 0.7550578, 0, 1, 0.9882353, 1,
-0.01343242, -0.4891297, -3.73714, 0, 1, 0.9921569, 1,
-0.01301766, -0.6557254, -3.207329, 0, 1, 1, 1,
-0.01122355, 0.1030235, 0.224333, 0, 0.9921569, 1, 1,
-0.008276817, 0.08978679, 0.3979241, 0, 0.9882353, 1, 1,
-0.004639261, 0.2061285, -0.1382077, 0, 0.9803922, 1, 1,
-0.001334707, -1.760081, -3.819225, 0, 0.9764706, 1, 1,
-0.0009174278, -0.1336629, -2.459697, 0, 0.9686275, 1, 1,
0.001212527, -0.7644763, 2.6914, 0, 0.9647059, 1, 1,
0.001670466, 0.8004379, -0.1785096, 0, 0.9568627, 1, 1,
0.005408761, 0.8634163, -1.193153, 0, 0.9529412, 1, 1,
0.01087608, -2.328898, 3.363061, 0, 0.945098, 1, 1,
0.01100802, 0.1964132, 0.4476909, 0, 0.9411765, 1, 1,
0.01147626, -1.605875, 0.9222044, 0, 0.9333333, 1, 1,
0.01384673, 0.847845, 0.5530515, 0, 0.9294118, 1, 1,
0.01640945, 0.01870138, 1.03841, 0, 0.9215686, 1, 1,
0.01732269, -0.7459819, 3.242181, 0, 0.9176471, 1, 1,
0.01771209, -1.191409, 2.355129, 0, 0.9098039, 1, 1,
0.01901117, -0.7725568, 3.08017, 0, 0.9058824, 1, 1,
0.021214, -0.06679673, 3.143459, 0, 0.8980392, 1, 1,
0.02152788, 0.820143, 0.1208815, 0, 0.8901961, 1, 1,
0.02160649, 1.174326, -2.077878, 0, 0.8862745, 1, 1,
0.02570342, 0.2368102, -0.7138559, 0, 0.8784314, 1, 1,
0.02753715, -0.252886, 3.180073, 0, 0.8745098, 1, 1,
0.03059098, -0.6015166, 4.00721, 0, 0.8666667, 1, 1,
0.03793583, -0.8307135, 4.353355, 0, 0.8627451, 1, 1,
0.0385018, 0.08640023, 0.5951515, 0, 0.854902, 1, 1,
0.04138582, -1.35966, 1.080357, 0, 0.8509804, 1, 1,
0.04355528, 0.4389473, 0.1662836, 0, 0.8431373, 1, 1,
0.04402452, -1.554341, 3.137308, 0, 0.8392157, 1, 1,
0.05158172, 1.376672, -0.4207485, 0, 0.8313726, 1, 1,
0.05369281, 0.03422, 1.199525, 0, 0.827451, 1, 1,
0.06625419, -0.3529347, 3.085053, 0, 0.8196079, 1, 1,
0.06672525, 0.8132896, 1.264197, 0, 0.8156863, 1, 1,
0.06807222, -0.3159956, 4.297217, 0, 0.8078431, 1, 1,
0.07072408, 0.9293504, 0.2257364, 0, 0.8039216, 1, 1,
0.07272346, -0.3437382, 3.075634, 0, 0.7960784, 1, 1,
0.07272744, 1.162707, 0.8527343, 0, 0.7882353, 1, 1,
0.07452744, -0.5382458, 3.51918, 0, 0.7843137, 1, 1,
0.07457214, -0.5846466, 2.75836, 0, 0.7764706, 1, 1,
0.07710069, 1.081131, -0.4555681, 0, 0.772549, 1, 1,
0.0833327, 1.954084, -0.3921372, 0, 0.7647059, 1, 1,
0.08487777, -0.167162, 2.1794, 0, 0.7607843, 1, 1,
0.08524853, 0.5561953, 0.4451296, 0, 0.7529412, 1, 1,
0.08636638, 1.365059, -0.925602, 0, 0.7490196, 1, 1,
0.08979056, 0.9483532, 0.4695006, 0, 0.7411765, 1, 1,
0.09564805, -0.8337522, 3.817978, 0, 0.7372549, 1, 1,
0.1026752, 1.684034, 0.633861, 0, 0.7294118, 1, 1,
0.1059194, 0.5629424, 0.5359713, 0, 0.7254902, 1, 1,
0.1075079, -0.6599997, 3.471252, 0, 0.7176471, 1, 1,
0.1114096, 1.272797, -2.467814, 0, 0.7137255, 1, 1,
0.1157611, 0.1449618, 2.182347, 0, 0.7058824, 1, 1,
0.1161932, -0.03094456, 2.735461, 0, 0.6980392, 1, 1,
0.1169343, 0.698966, -0.7106723, 0, 0.6941177, 1, 1,
0.1185843, 2.752903, -0.2012731, 0, 0.6862745, 1, 1,
0.1243251, 1.190838, 0.2279524, 0, 0.682353, 1, 1,
0.1301801, 0.2461867, 0.7085143, 0, 0.6745098, 1, 1,
0.1326166, 1.39032, -0.1210072, 0, 0.6705883, 1, 1,
0.133227, -0.323374, 1.26619, 0, 0.6627451, 1, 1,
0.1362894, -1.897926, 3.652786, 0, 0.6588235, 1, 1,
0.1377233, -0.8738024, 3.264016, 0, 0.6509804, 1, 1,
0.1391823, 1.64391, -0.3907835, 0, 0.6470588, 1, 1,
0.1395018, 0.2822593, 0.65055, 0, 0.6392157, 1, 1,
0.1476622, 0.5254604, 0.8325382, 0, 0.6352941, 1, 1,
0.1479339, -2.515896, 2.124078, 0, 0.627451, 1, 1,
0.1519852, -0.2011811, 1.268281, 0, 0.6235294, 1, 1,
0.1525065, -0.04638269, 0.7434309, 0, 0.6156863, 1, 1,
0.1561984, -0.8848336, 3.664119, 0, 0.6117647, 1, 1,
0.1572259, 0.6077023, 0.06177336, 0, 0.6039216, 1, 1,
0.1581548, 0.5013003, 0.8723494, 0, 0.5960785, 1, 1,
0.1733025, -1.091181, 3.651498, 0, 0.5921569, 1, 1,
0.1802675, -0.06428602, 2.226093, 0, 0.5843138, 1, 1,
0.1855332, -0.01499887, 0.5356791, 0, 0.5803922, 1, 1,
0.1863627, -0.4696673, 5.178074, 0, 0.572549, 1, 1,
0.188354, -1.10874, 1.889562, 0, 0.5686275, 1, 1,
0.1889663, 1.041141, 0.6748527, 0, 0.5607843, 1, 1,
0.1944919, 0.3713361, 0.7792979, 0, 0.5568628, 1, 1,
0.1960226, 1.7681, 0.5097247, 0, 0.5490196, 1, 1,
0.20054, -0.8133782, 4.2606, 0, 0.5450981, 1, 1,
0.2020031, -1.128285, 2.490833, 0, 0.5372549, 1, 1,
0.2046014, -0.9926676, 4.489979, 0, 0.5333334, 1, 1,
0.2094487, 1.612134, -0.656669, 0, 0.5254902, 1, 1,
0.2104573, 0.8284414, 0.04558773, 0, 0.5215687, 1, 1,
0.2129729, 0.3229334, -0.8044655, 0, 0.5137255, 1, 1,
0.2136968, -2.292034, 4.460833, 0, 0.509804, 1, 1,
0.2155351, -0.1813338, 2.200662, 0, 0.5019608, 1, 1,
0.2158429, -0.7201651, 2.230902, 0, 0.4941176, 1, 1,
0.2160684, -0.2512493, 3.096565, 0, 0.4901961, 1, 1,
0.2161789, 1.323641, -0.6269436, 0, 0.4823529, 1, 1,
0.2182114, -0.9624573, 1.67259, 0, 0.4784314, 1, 1,
0.2200242, 0.5374827, 0.8526516, 0, 0.4705882, 1, 1,
0.221626, 0.2187991, 1.065688, 0, 0.4666667, 1, 1,
0.2216632, 1.358183, 1.229997, 0, 0.4588235, 1, 1,
0.2232565, 1.153298, 0.07029315, 0, 0.454902, 1, 1,
0.229132, 0.04227423, 1.85909, 0, 0.4470588, 1, 1,
0.2296399, -0.1058265, 1.445289, 0, 0.4431373, 1, 1,
0.2321406, -1.117486, 3.474635, 0, 0.4352941, 1, 1,
0.2364137, -0.9107701, 3.64174, 0, 0.4313726, 1, 1,
0.2448926, -0.7743478, 2.148204, 0, 0.4235294, 1, 1,
0.2463846, 0.07126404, 0.7933328, 0, 0.4196078, 1, 1,
0.247119, 0.5769054, 0.1889926, 0, 0.4117647, 1, 1,
0.247887, -1.739362, 3.246681, 0, 0.4078431, 1, 1,
0.2488476, 0.75845, 1.31337, 0, 0.4, 1, 1,
0.2501048, -0.8296795, 1.639982, 0, 0.3921569, 1, 1,
0.2527259, -1.257243, 2.695637, 0, 0.3882353, 1, 1,
0.2543052, -0.7781023, 3.599965, 0, 0.3803922, 1, 1,
0.2562124, -0.6558656, 4.613575, 0, 0.3764706, 1, 1,
0.2614586, -1.076358, 4.536974, 0, 0.3686275, 1, 1,
0.2641523, -0.2581504, 1.283328, 0, 0.3647059, 1, 1,
0.2642079, 1.382179, -0.9211442, 0, 0.3568628, 1, 1,
0.2724712, 0.1321623, 1.492497, 0, 0.3529412, 1, 1,
0.2738666, 0.5198165, 0.6178303, 0, 0.345098, 1, 1,
0.2743251, -1.341655, 3.684115, 0, 0.3411765, 1, 1,
0.2761942, 1.95233, 0.09415054, 0, 0.3333333, 1, 1,
0.2772785, 0.1108242, 1.037306, 0, 0.3294118, 1, 1,
0.2786242, 1.115613, 0.6308059, 0, 0.3215686, 1, 1,
0.2788975, -1.681491, 1.900845, 0, 0.3176471, 1, 1,
0.2856177, 0.3554335, 0.2721601, 0, 0.3098039, 1, 1,
0.2899523, 0.9361274, -0.5915988, 0, 0.3058824, 1, 1,
0.2947728, -1.449143, 2.522823, 0, 0.2980392, 1, 1,
0.2952436, -1.39428, 4.788745, 0, 0.2901961, 1, 1,
0.2953518, 1.180778, -0.02163813, 0, 0.2862745, 1, 1,
0.2995326, -1.572535, 3.960249, 0, 0.2784314, 1, 1,
0.3024918, 2.663847, 0.059658, 0, 0.2745098, 1, 1,
0.3032754, 0.7468935, -0.7252487, 0, 0.2666667, 1, 1,
0.30843, -0.127619, 2.010671, 0, 0.2627451, 1, 1,
0.3107825, -0.7545297, 2.547115, 0, 0.254902, 1, 1,
0.3108042, 1.025928, 2.580538, 0, 0.2509804, 1, 1,
0.3110119, 0.2109357, 0.7412891, 0, 0.2431373, 1, 1,
0.3112132, -1.176728, 3.033605, 0, 0.2392157, 1, 1,
0.3146116, 0.3667766, 0.9334059, 0, 0.2313726, 1, 1,
0.3161187, 1.385704, -0.9981896, 0, 0.227451, 1, 1,
0.3180283, -0.3507044, 3.089948, 0, 0.2196078, 1, 1,
0.3203493, -0.3873086, 3.582553, 0, 0.2156863, 1, 1,
0.3235174, -0.8433086, 2.664549, 0, 0.2078431, 1, 1,
0.3235521, -0.3385343, 1.771171, 0, 0.2039216, 1, 1,
0.3301172, 0.6019362, -0.9378949, 0, 0.1960784, 1, 1,
0.3348579, -0.07690441, 2.049956, 0, 0.1882353, 1, 1,
0.3349154, -1.313568, 2.880949, 0, 0.1843137, 1, 1,
0.3395149, -0.7012822, 2.765748, 0, 0.1764706, 1, 1,
0.3410853, 0.2753802, 1.952107, 0, 0.172549, 1, 1,
0.343504, 1.429105, 0.6252364, 0, 0.1647059, 1, 1,
0.3489859, 0.2736289, 2.395913, 0, 0.1607843, 1, 1,
0.3495664, 1.985401, 0.9419556, 0, 0.1529412, 1, 1,
0.3576252, -1.980448, 4.471107, 0, 0.1490196, 1, 1,
0.3596897, -0.3258577, 0.02689763, 0, 0.1411765, 1, 1,
0.3610239, -1.446813, 2.915343, 0, 0.1372549, 1, 1,
0.3623023, -0.1873855, 1.416801, 0, 0.1294118, 1, 1,
0.3758592, -1.292968, 2.539383, 0, 0.1254902, 1, 1,
0.3774175, 0.8924984, 0.6529743, 0, 0.1176471, 1, 1,
0.3810953, -0.4626729, 1.326061, 0, 0.1137255, 1, 1,
0.3873855, 0.01525232, 2.378756, 0, 0.1058824, 1, 1,
0.3882861, -0.02247914, 1.941965, 0, 0.09803922, 1, 1,
0.3900289, -0.8797418, 1.215793, 0, 0.09411765, 1, 1,
0.3979486, -1.057511, 3.02124, 0, 0.08627451, 1, 1,
0.400016, 0.8011531, 0.7169353, 0, 0.08235294, 1, 1,
0.4008147, -0.4164481, 2.244877, 0, 0.07450981, 1, 1,
0.4023007, -0.281179, 1.939176, 0, 0.07058824, 1, 1,
0.403264, 0.8533247, 0.7747836, 0, 0.0627451, 1, 1,
0.4069403, 1.233758, 1.854228, 0, 0.05882353, 1, 1,
0.4102356, 0.1274485, 0.9710419, 0, 0.05098039, 1, 1,
0.4152278, -0.2215304, 2.089874, 0, 0.04705882, 1, 1,
0.4155495, -0.5351985, 2.938311, 0, 0.03921569, 1, 1,
0.4217652, 1.405536, 0.2869646, 0, 0.03529412, 1, 1,
0.4252374, 1.598948, 0.4491219, 0, 0.02745098, 1, 1,
0.4257987, 1.187834, 0.3673614, 0, 0.02352941, 1, 1,
0.4277893, 1.149392, 0.2709514, 0, 0.01568628, 1, 1,
0.4311004, 0.3723142, -0.7427778, 0, 0.01176471, 1, 1,
0.4331809, -1.835741, 2.392238, 0, 0.003921569, 1, 1,
0.4358229, -1.61841, 2.735408, 0.003921569, 0, 1, 1,
0.436322, 0.2658779, 0.8178216, 0.007843138, 0, 1, 1,
0.4376504, -0.16723, 0.8742647, 0.01568628, 0, 1, 1,
0.4388165, 1.065669, 0.2753938, 0.01960784, 0, 1, 1,
0.4413581, -0.2562842, 0.9526675, 0.02745098, 0, 1, 1,
0.4417554, 0.6399105, 2.244112, 0.03137255, 0, 1, 1,
0.4439532, -1.292823, 1.83396, 0.03921569, 0, 1, 1,
0.4442489, -0.8885701, 3.275301, 0.04313726, 0, 1, 1,
0.4458764, 1.862381, 0.7129954, 0.05098039, 0, 1, 1,
0.4508737, 0.1256208, 2.523796, 0.05490196, 0, 1, 1,
0.4546657, 0.464613, -0.516126, 0.0627451, 0, 1, 1,
0.4552887, 0.716027, 0.4568465, 0.06666667, 0, 1, 1,
0.4600796, -0.3970256, 2.29773, 0.07450981, 0, 1, 1,
0.4628872, 0.07204872, 2.784458, 0.07843138, 0, 1, 1,
0.4690586, -0.8718997, 1.333457, 0.08627451, 0, 1, 1,
0.469111, 2.019617, 0.8564029, 0.09019608, 0, 1, 1,
0.4710791, -0.08797054, 2.44017, 0.09803922, 0, 1, 1,
0.4758674, 1.19003, -0.4798639, 0.1058824, 0, 1, 1,
0.4808159, 0.1407628, 3.123893, 0.1098039, 0, 1, 1,
0.485285, -0.5191178, 2.809284, 0.1176471, 0, 1, 1,
0.4946463, -0.5353725, 2.973498, 0.1215686, 0, 1, 1,
0.5008372, -2.153069, 4.115854, 0.1294118, 0, 1, 1,
0.5031363, 1.120584, 0.1253813, 0.1333333, 0, 1, 1,
0.512679, 1.060791, 0.353015, 0.1411765, 0, 1, 1,
0.5128518, 0.2376667, 1.366826, 0.145098, 0, 1, 1,
0.5146614, -2.530062, 4.470151, 0.1529412, 0, 1, 1,
0.5219027, -0.2737664, 0.9944403, 0.1568628, 0, 1, 1,
0.5222287, 0.8063523, 1.54872, 0.1647059, 0, 1, 1,
0.5229425, 1.628176, -0.4104535, 0.1686275, 0, 1, 1,
0.5305269, -0.6944787, 2.214809, 0.1764706, 0, 1, 1,
0.532245, -0.3175364, 3.339296, 0.1803922, 0, 1, 1,
0.5393866, -0.9001678, 2.585851, 0.1882353, 0, 1, 1,
0.5461798, -0.1347362, 1.33804, 0.1921569, 0, 1, 1,
0.5472281, -0.1562951, 1.090374, 0.2, 0, 1, 1,
0.5483857, 0.3955132, -0.8608993, 0.2078431, 0, 1, 1,
0.5538003, -0.9330364, 1.621554, 0.2117647, 0, 1, 1,
0.5543629, -0.8569877, 2.641388, 0.2196078, 0, 1, 1,
0.5550888, 0.08328325, -1.198921, 0.2235294, 0, 1, 1,
0.5569767, -1.254411, 2.570119, 0.2313726, 0, 1, 1,
0.5596022, -0.1315738, 3.267655, 0.2352941, 0, 1, 1,
0.5688166, -0.1735751, 4.00486, 0.2431373, 0, 1, 1,
0.5700054, -0.08603222, 1.487803, 0.2470588, 0, 1, 1,
0.5730487, -0.2518681, 1.721842, 0.254902, 0, 1, 1,
0.574702, 1.608804, -0.1538181, 0.2588235, 0, 1, 1,
0.5748582, 1.628493, 0.7693242, 0.2666667, 0, 1, 1,
0.579161, 0.8923969, 1.088344, 0.2705882, 0, 1, 1,
0.5807195, -0.2304753, 0.8130345, 0.2784314, 0, 1, 1,
0.587402, -0.8039966, 2.186417, 0.282353, 0, 1, 1,
0.5983043, -1.139327, 4.070351, 0.2901961, 0, 1, 1,
0.6022542, -0.5301507, 0.5076066, 0.2941177, 0, 1, 1,
0.6036225, -0.4724973, 2.777109, 0.3019608, 0, 1, 1,
0.6068943, -0.1600995, 3.11641, 0.3098039, 0, 1, 1,
0.6078289, 0.607016, 1.5105, 0.3137255, 0, 1, 1,
0.6101462, -0.5337932, 3.548342, 0.3215686, 0, 1, 1,
0.6158113, 1.416816, -1.540653, 0.3254902, 0, 1, 1,
0.6174939, 0.1201548, 0.4572064, 0.3333333, 0, 1, 1,
0.6178343, 0.07656209, 3.369333, 0.3372549, 0, 1, 1,
0.6196657, -0.1506039, 2.715126, 0.345098, 0, 1, 1,
0.6197894, -0.3036031, 1.238952, 0.3490196, 0, 1, 1,
0.6201611, -0.6313003, 0.6018668, 0.3568628, 0, 1, 1,
0.6211793, 0.5022135, 1.55692, 0.3607843, 0, 1, 1,
0.6272276, 0.4641778, 1.149501, 0.3686275, 0, 1, 1,
0.6287957, 1.057581, 2.209769, 0.372549, 0, 1, 1,
0.6289663, 0.04449305, 1.12447, 0.3803922, 0, 1, 1,
0.6310545, -1.461614, 3.736962, 0.3843137, 0, 1, 1,
0.6310726, -0.9244988, 4.067287, 0.3921569, 0, 1, 1,
0.6333553, 0.8972622, 1.230194, 0.3960784, 0, 1, 1,
0.6401468, 1.452699, 0.9157546, 0.4039216, 0, 1, 1,
0.6464123, -0.02473493, 0.9126197, 0.4117647, 0, 1, 1,
0.6467746, 0.5073926, -0.6010305, 0.4156863, 0, 1, 1,
0.6470732, -1.065251, 4.579862, 0.4235294, 0, 1, 1,
0.6494006, -0.8129032, 3.705498, 0.427451, 0, 1, 1,
0.6505578, 0.7422263, 0.6273926, 0.4352941, 0, 1, 1,
0.6506886, 0.723724, 1.638204, 0.4392157, 0, 1, 1,
0.6508979, 1.553016, 1.16394, 0.4470588, 0, 1, 1,
0.6537807, -0.2321517, 1.484169, 0.4509804, 0, 1, 1,
0.6539936, -0.4563189, 2.54963, 0.4588235, 0, 1, 1,
0.6632684, -0.2993902, 1.959727, 0.4627451, 0, 1, 1,
0.6682613, -2.903444, 2.898763, 0.4705882, 0, 1, 1,
0.6746597, 0.01151953, 2.838113, 0.4745098, 0, 1, 1,
0.6755981, 1.320908, 0.04485489, 0.4823529, 0, 1, 1,
0.6760443, -0.03750894, 1.132851, 0.4862745, 0, 1, 1,
0.6780592, -0.877286, 2.850139, 0.4941176, 0, 1, 1,
0.6791968, -0.3761261, 1.191102, 0.5019608, 0, 1, 1,
0.6808302, -0.1485875, 1.778672, 0.5058824, 0, 1, 1,
0.6826528, -1.32262, 3.762397, 0.5137255, 0, 1, 1,
0.683898, -1.29765, 1.388052, 0.5176471, 0, 1, 1,
0.6841725, 0.07916048, 3.057661, 0.5254902, 0, 1, 1,
0.6843194, 1.271501, 1.554611, 0.5294118, 0, 1, 1,
0.6889003, 0.2785786, 1.547516, 0.5372549, 0, 1, 1,
0.6947108, 1.371327, -0.7600642, 0.5411765, 0, 1, 1,
0.6971237, 1.145629, -0.6527719, 0.5490196, 0, 1, 1,
0.7013642, 0.9046109, 1.501831, 0.5529412, 0, 1, 1,
0.7058616, -0.1478869, 1.880598, 0.5607843, 0, 1, 1,
0.7106665, 0.213479, 0.7422031, 0.5647059, 0, 1, 1,
0.7166265, -0.009123904, 1.738349, 0.572549, 0, 1, 1,
0.7179949, 1.334626, 0.5372899, 0.5764706, 0, 1, 1,
0.7194863, -0.2833163, 1.396954, 0.5843138, 0, 1, 1,
0.7225471, 1.777604, -1.054982, 0.5882353, 0, 1, 1,
0.7229195, 0.03867904, 0.783828, 0.5960785, 0, 1, 1,
0.7251867, 0.6423395, 1.534709, 0.6039216, 0, 1, 1,
0.7253704, 0.4165306, 0.616877, 0.6078432, 0, 1, 1,
0.7262207, 0.936163, 0.6888901, 0.6156863, 0, 1, 1,
0.7310292, 0.3516418, 1.775499, 0.6196079, 0, 1, 1,
0.7313567, -1.675567, 3.448349, 0.627451, 0, 1, 1,
0.7314833, -0.8191103, 3.509197, 0.6313726, 0, 1, 1,
0.7353005, 0.7917566, 1.835013, 0.6392157, 0, 1, 1,
0.7365143, -0.5554983, 5.156223, 0.6431373, 0, 1, 1,
0.7386218, 3.259257, -0.8957401, 0.6509804, 0, 1, 1,
0.7437319, -1.045542, 2.342313, 0.654902, 0, 1, 1,
0.7481335, -0.8511868, 2.164891, 0.6627451, 0, 1, 1,
0.7503762, -1.523518, 3.721121, 0.6666667, 0, 1, 1,
0.7507287, -0.1014688, 0.6485445, 0.6745098, 0, 1, 1,
0.7584635, -0.2062318, 0.9519898, 0.6784314, 0, 1, 1,
0.762993, 0.1166341, 0.6022709, 0.6862745, 0, 1, 1,
0.767767, 1.541665, -0.5910034, 0.6901961, 0, 1, 1,
0.7704223, 1.315621, -0.5592387, 0.6980392, 0, 1, 1,
0.7706657, 1.103154, 1.299936, 0.7058824, 0, 1, 1,
0.771017, 0.8194885, 0.3643553, 0.7098039, 0, 1, 1,
0.7728074, -0.4856333, 2.567826, 0.7176471, 0, 1, 1,
0.7801888, 0.1876112, 0.6692604, 0.7215686, 0, 1, 1,
0.78609, -1.742051, 2.523659, 0.7294118, 0, 1, 1,
0.788789, 0.9741744, -0.4003189, 0.7333333, 0, 1, 1,
0.7897421, 1.09593, 0.2801969, 0.7411765, 0, 1, 1,
0.7913513, 1.089504, 0.84407, 0.7450981, 0, 1, 1,
0.8015513, 0.5247734, -0.2686487, 0.7529412, 0, 1, 1,
0.8038532, 1.32926, -0.4972301, 0.7568628, 0, 1, 1,
0.8057905, -1.524896, 3.650043, 0.7647059, 0, 1, 1,
0.8067342, -0.3691022, 3.26757, 0.7686275, 0, 1, 1,
0.8078794, 0.9915162, -0.6611223, 0.7764706, 0, 1, 1,
0.8096194, -0.1544541, 0.1581351, 0.7803922, 0, 1, 1,
0.8103537, -0.9565622, 3.07646, 0.7882353, 0, 1, 1,
0.8118261, 2.873814, 0.6215464, 0.7921569, 0, 1, 1,
0.8125495, 1.228326, -0.7771606, 0.8, 0, 1, 1,
0.8148213, -0.4591826, 2.847275, 0.8078431, 0, 1, 1,
0.8194376, -0.3787946, 2.562714, 0.8117647, 0, 1, 1,
0.8199612, -0.8975381, 3.132403, 0.8196079, 0, 1, 1,
0.8237097, -1.692935, 3.747533, 0.8235294, 0, 1, 1,
0.8259732, -0.1751311, 4.517552, 0.8313726, 0, 1, 1,
0.8266254, 1.915257, -0.7611033, 0.8352941, 0, 1, 1,
0.8267373, -0.2785342, 2.222096, 0.8431373, 0, 1, 1,
0.8334282, 0.7071148, -0.29455, 0.8470588, 0, 1, 1,
0.8393098, -0.298658, 1.453005, 0.854902, 0, 1, 1,
0.8421525, 0.1450511, 1.049373, 0.8588235, 0, 1, 1,
0.8465389, 0.3298861, 0.141234, 0.8666667, 0, 1, 1,
0.8554363, -0.0007427029, 1.655988, 0.8705882, 0, 1, 1,
0.856108, 0.9059938, -0.2988791, 0.8784314, 0, 1, 1,
0.8586383, 0.1053236, 1.836669, 0.8823529, 0, 1, 1,
0.859604, -0.1207728, 4.077562, 0.8901961, 0, 1, 1,
0.8693821, 0.02707105, 2.279324, 0.8941177, 0, 1, 1,
0.8694123, 1.035673, 0.7564915, 0.9019608, 0, 1, 1,
0.8696851, 0.5198923, 1.026695, 0.9098039, 0, 1, 1,
0.8702826, 1.877178, 2.565667, 0.9137255, 0, 1, 1,
0.8708641, 2.029022, 1.389386, 0.9215686, 0, 1, 1,
0.8718891, -1.662042, 1.938754, 0.9254902, 0, 1, 1,
0.8726552, -0.950928, 2.470063, 0.9333333, 0, 1, 1,
0.882315, 0.2007518, 0.009042748, 0.9372549, 0, 1, 1,
0.8908954, 0.6935891, 0.5700903, 0.945098, 0, 1, 1,
0.8914897, -0.5531081, 0.9770567, 0.9490196, 0, 1, 1,
0.8928958, -0.2908049, 2.208009, 0.9568627, 0, 1, 1,
0.8940526, 1.265583, 1.188546, 0.9607843, 0, 1, 1,
0.898492, -0.5084007, 1.852358, 0.9686275, 0, 1, 1,
0.9013028, -1.249604, 2.107346, 0.972549, 0, 1, 1,
0.9030598, 1.085641, 2.29477, 0.9803922, 0, 1, 1,
0.9142664, -1.063109, 3.048168, 0.9843137, 0, 1, 1,
0.9172877, 0.3369661, 1.149446, 0.9921569, 0, 1, 1,
0.9207761, -0.3607379, 1.24025, 0.9960784, 0, 1, 1,
0.9255812, -1.474217, 2.141252, 1, 0, 0.9960784, 1,
0.9264358, 0.8863336, -0.9971985, 1, 0, 0.9882353, 1,
0.9413273, 0.3035276, 1.221775, 1, 0, 0.9843137, 1,
0.9467333, 1.972456, 0.4018561, 1, 0, 0.9764706, 1,
0.9498171, -0.7727683, 2.096585, 1, 0, 0.972549, 1,
0.9629855, 0.5862217, -0.04830328, 1, 0, 0.9647059, 1,
0.9703788, -0.2329706, 1.699158, 1, 0, 0.9607843, 1,
0.9725118, -0.5472285, 1.691967, 1, 0, 0.9529412, 1,
0.9861788, 0.5979323, 0.9678273, 1, 0, 0.9490196, 1,
0.99405, -0.2128962, -0.02498732, 1, 0, 0.9411765, 1,
0.9989079, -0.9056243, 0.6924193, 1, 0, 0.9372549, 1,
1.000474, 0.3616174, 1.869007, 1, 0, 0.9294118, 1,
1.005671, 0.4125767, 0.9627392, 1, 0, 0.9254902, 1,
1.006042, 0.3495537, 0.2635181, 1, 0, 0.9176471, 1,
1.010682, -0.5423411, 3.171877, 1, 0, 0.9137255, 1,
1.021407, 1.572812, 0.007220321, 1, 0, 0.9058824, 1,
1.023541, -1.321414, 4.675107, 1, 0, 0.9019608, 1,
1.027021, 0.3444112, 0.13159, 1, 0, 0.8941177, 1,
1.031723, 0.05465234, 0.5744846, 1, 0, 0.8862745, 1,
1.034175, 0.2492965, 2.000523, 1, 0, 0.8823529, 1,
1.035863, -1.667626, 0.9053537, 1, 0, 0.8745098, 1,
1.043612, 0.01894834, -1.005863, 1, 0, 0.8705882, 1,
1.049329, 0.2840568, 1.475572, 1, 0, 0.8627451, 1,
1.054836, 1.130426, 0.204934, 1, 0, 0.8588235, 1,
1.060771, 0.5381361, 2.859658, 1, 0, 0.8509804, 1,
1.0629, -1.473622, 4.523323, 1, 0, 0.8470588, 1,
1.070926, 1.590909, -0.5373814, 1, 0, 0.8392157, 1,
1.074648, -1.398776, 2.21769, 1, 0, 0.8352941, 1,
1.076474, 0.6897515, 1.05856, 1, 0, 0.827451, 1,
1.080062, -0.4451964, 2.416507, 1, 0, 0.8235294, 1,
1.081274, 0.1684718, 0.7815329, 1, 0, 0.8156863, 1,
1.08156, -0.8478461, 1.88836, 1, 0, 0.8117647, 1,
1.083399, 1.146827, 1.034295, 1, 0, 0.8039216, 1,
1.090895, 0.9295429, 0.5072534, 1, 0, 0.7960784, 1,
1.092819, 1.328668, 2.820958, 1, 0, 0.7921569, 1,
1.100316, -0.7503037, 2.970633, 1, 0, 0.7843137, 1,
1.103544, 1.582965, 1.413273, 1, 0, 0.7803922, 1,
1.110737, -0.5909879, 2.865552, 1, 0, 0.772549, 1,
1.128862, -0.03121907, 1.430772, 1, 0, 0.7686275, 1,
1.131433, 2.023274, 0.002234405, 1, 0, 0.7607843, 1,
1.136377, 1.361811, 1.344639, 1, 0, 0.7568628, 1,
1.137473, -0.7271203, 3.254393, 1, 0, 0.7490196, 1,
1.137948, 1.571573, 1.70768, 1, 0, 0.7450981, 1,
1.143859, -1.620599, 2.809425, 1, 0, 0.7372549, 1,
1.144999, 0.7105939, 2.155426, 1, 0, 0.7333333, 1,
1.151841, -0.3355485, 0.8886232, 1, 0, 0.7254902, 1,
1.158162, -0.004418309, 2.21596, 1, 0, 0.7215686, 1,
1.159432, 1.52051, 0.41211, 1, 0, 0.7137255, 1,
1.159923, 2.135495, 0.741745, 1, 0, 0.7098039, 1,
1.165513, -1.071082, 1.455654, 1, 0, 0.7019608, 1,
1.166626, -0.8741272, 3.048393, 1, 0, 0.6941177, 1,
1.168771, 1.220059, 1.727972, 1, 0, 0.6901961, 1,
1.175587, -1.25448, 1.953549, 1, 0, 0.682353, 1,
1.178124, -0.7542894, 2.189364, 1, 0, 0.6784314, 1,
1.183334, -1.279187, 0.2228418, 1, 0, 0.6705883, 1,
1.185907, 0.6501472, 0.3634517, 1, 0, 0.6666667, 1,
1.188313, -0.2880335, 1.184492, 1, 0, 0.6588235, 1,
1.191756, -0.178937, 0.2293536, 1, 0, 0.654902, 1,
1.192536, 0.6402512, -0.4583542, 1, 0, 0.6470588, 1,
1.19526, 0.293118, -1.041648, 1, 0, 0.6431373, 1,
1.203122, 0.4381991, 0.3862145, 1, 0, 0.6352941, 1,
1.205464, -1.818482, 4.371695, 1, 0, 0.6313726, 1,
1.220522, -0.09993766, 1.005203, 1, 0, 0.6235294, 1,
1.221842, -0.6837689, 1.322835, 1, 0, 0.6196079, 1,
1.22456, 0.4824078, 0.9843723, 1, 0, 0.6117647, 1,
1.22533, 0.8380597, 2.835414, 1, 0, 0.6078432, 1,
1.227362, -0.2979677, 1.461734, 1, 0, 0.6, 1,
1.22877, 1.886311, 0.6699761, 1, 0, 0.5921569, 1,
1.24001, -0.216325, 0.4488654, 1, 0, 0.5882353, 1,
1.240683, 0.1603665, 1.768583, 1, 0, 0.5803922, 1,
1.244031, -0.01296389, 2.255203, 1, 0, 0.5764706, 1,
1.244342, -0.9432544, 3.18631, 1, 0, 0.5686275, 1,
1.245375, -1.178797, 3.794696, 1, 0, 0.5647059, 1,
1.247966, -0.502252, 1.480744, 1, 0, 0.5568628, 1,
1.250399, 1.436546, -0.2496776, 1, 0, 0.5529412, 1,
1.26178, 0.6777476, 0.5331065, 1, 0, 0.5450981, 1,
1.263282, -1.711724, 1.101537, 1, 0, 0.5411765, 1,
1.267232, 0.1638107, 1.969331, 1, 0, 0.5333334, 1,
1.268749, -0.4470242, 2.308238, 1, 0, 0.5294118, 1,
1.305706, 1.224769, 0.6087435, 1, 0, 0.5215687, 1,
1.307757, -0.1391211, 1.448408, 1, 0, 0.5176471, 1,
1.332859, 1.333351, 1.334709, 1, 0, 0.509804, 1,
1.347451, -1.016302, 3.027806, 1, 0, 0.5058824, 1,
1.35578, -1.119736, 1.292143, 1, 0, 0.4980392, 1,
1.35753, 1.038895, 2.442287, 1, 0, 0.4901961, 1,
1.360928, 1.401311, 0.6914721, 1, 0, 0.4862745, 1,
1.362469, 0.05103667, 1.436884, 1, 0, 0.4784314, 1,
1.370218, 0.1501579, 2.12065, 1, 0, 0.4745098, 1,
1.376413, 0.8938932, 2.870661, 1, 0, 0.4666667, 1,
1.377852, 0.5573949, 2.478873, 1, 0, 0.4627451, 1,
1.412316, -0.2316491, 2.211051, 1, 0, 0.454902, 1,
1.413405, 0.3913677, -1.174821, 1, 0, 0.4509804, 1,
1.435085, 0.4760644, 0.8602311, 1, 0, 0.4431373, 1,
1.43538, 0.02269311, 0.3124037, 1, 0, 0.4392157, 1,
1.437521, -0.1796948, 0.9206252, 1, 0, 0.4313726, 1,
1.456523, -1.156867, 4.014216, 1, 0, 0.427451, 1,
1.458696, 0.3306116, 1.460445, 1, 0, 0.4196078, 1,
1.472999, 1.7447, 1.302307, 1, 0, 0.4156863, 1,
1.475925, -0.4949062, 2.565438, 1, 0, 0.4078431, 1,
1.498973, 0.6959629, 0.6411709, 1, 0, 0.4039216, 1,
1.505347, 0.8903359, -0.05021797, 1, 0, 0.3960784, 1,
1.508909, 0.1422135, 1.70313, 1, 0, 0.3882353, 1,
1.509821, 0.02947563, 1.780987, 1, 0, 0.3843137, 1,
1.512141, -0.42679, 2.332749, 1, 0, 0.3764706, 1,
1.527288, 0.1894196, -0.9016598, 1, 0, 0.372549, 1,
1.546988, 0.7182095, -0.2607198, 1, 0, 0.3647059, 1,
1.549658, -0.4972733, 1.801085, 1, 0, 0.3607843, 1,
1.566097, 0.02239965, 1.74302, 1, 0, 0.3529412, 1,
1.569836, -0.5661213, 1.383116, 1, 0, 0.3490196, 1,
1.574168, -0.05643079, 3.445832, 1, 0, 0.3411765, 1,
1.580146, -0.4882399, 2.134007, 1, 0, 0.3372549, 1,
1.586489, 0.5970718, 0.831569, 1, 0, 0.3294118, 1,
1.587942, -1.083319, 3.128457, 1, 0, 0.3254902, 1,
1.600362, -2.15974, 2.253815, 1, 0, 0.3176471, 1,
1.627132, -0.348367, 3.455713, 1, 0, 0.3137255, 1,
1.643377, -0.1521733, 2.204106, 1, 0, 0.3058824, 1,
1.657413, -0.867597, 0.08484242, 1, 0, 0.2980392, 1,
1.662184, 1.156034, 3.016287, 1, 0, 0.2941177, 1,
1.666401, 0.9516131, 0.5514876, 1, 0, 0.2862745, 1,
1.669587, 0.3707964, 1.381789, 1, 0, 0.282353, 1,
1.672731, -0.836686, 1.63432, 1, 0, 0.2745098, 1,
1.686449, -0.9094764, 1.54018, 1, 0, 0.2705882, 1,
1.706679, -0.8212718, 0.6069003, 1, 0, 0.2627451, 1,
1.710696, -0.6148896, 2.478525, 1, 0, 0.2588235, 1,
1.711721, 0.9266262, 1.405224, 1, 0, 0.2509804, 1,
1.76568, 0.04986909, 1.148206, 1, 0, 0.2470588, 1,
1.803892, -0.4118104, 1.941267, 1, 0, 0.2392157, 1,
1.82734, -0.6978947, 1.320754, 1, 0, 0.2352941, 1,
1.832893, -1.455293, 2.977987, 1, 0, 0.227451, 1,
1.83661, -0.446812, 2.132445, 1, 0, 0.2235294, 1,
1.841355, 0.6764346, 2.76281, 1, 0, 0.2156863, 1,
1.855857, -0.05132239, 3.512845, 1, 0, 0.2117647, 1,
1.861209, -0.6055533, 1.777074, 1, 0, 0.2039216, 1,
1.872773, -1.37455, 2.616616, 1, 0, 0.1960784, 1,
1.889059, 0.520673, 1.233269, 1, 0, 0.1921569, 1,
1.899603, 1.48119, 1.343854, 1, 0, 0.1843137, 1,
1.915817, -0.1991332, 0.5224397, 1, 0, 0.1803922, 1,
1.942798, -1.286413, 1.702308, 1, 0, 0.172549, 1,
1.947785, -0.7115977, 1.452234, 1, 0, 0.1686275, 1,
1.95044, -0.4903326, 1.58255, 1, 0, 0.1607843, 1,
1.96897, 0.09497719, 1.635986, 1, 0, 0.1568628, 1,
1.971453, 1.269486, -0.09998055, 1, 0, 0.1490196, 1,
1.973519, -1.775023, 1.959515, 1, 0, 0.145098, 1,
1.994631, -1.720833, 0.7417892, 1, 0, 0.1372549, 1,
2.002478, 1.209281, 0.2531762, 1, 0, 0.1333333, 1,
2.028137, -1.874366, 1.793777, 1, 0, 0.1254902, 1,
2.106172, 0.4181815, -0.4565257, 1, 0, 0.1215686, 1,
2.115022, 1.398091, 1.407031, 1, 0, 0.1137255, 1,
2.180252, 1.957258, 1.529443, 1, 0, 0.1098039, 1,
2.187785, -0.9823554, 2.44978, 1, 0, 0.1019608, 1,
2.193184, -0.133234, 1.399452, 1, 0, 0.09411765, 1,
2.232351, 1.75716, 2.042106, 1, 0, 0.09019608, 1,
2.237181, -0.3444372, 1.653153, 1, 0, 0.08235294, 1,
2.314382, 0.1203258, 3.043948, 1, 0, 0.07843138, 1,
2.321739, -0.1833896, 1.513281, 1, 0, 0.07058824, 1,
2.351453, 0.06158798, 1.14909, 1, 0, 0.06666667, 1,
2.494716, 0.007683558, 0.8939832, 1, 0, 0.05882353, 1,
2.533573, 2.106552, 0.8490224, 1, 0, 0.05490196, 1,
2.544155, -0.6031399, 2.88878, 1, 0, 0.04705882, 1,
2.562589, -1.661746, 2.357148, 1, 0, 0.04313726, 1,
2.586599, -1.809708, 2.76574, 1, 0, 0.03529412, 1,
2.629459, -0.6714007, 2.271916, 1, 0, 0.03137255, 1,
2.796152, 0.3356095, 2.865308, 1, 0, 0.02352941, 1,
3.055148, 1.965384, 0.8542449, 1, 0, 0.01960784, 1,
3.409361, 1.083035, 0.3669678, 1, 0, 0.01176471, 1,
3.767292, 2.086476, 0.3408586, 1, 0, 0.007843138, 1
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
0.03316557, -4.829428, -6.730137, 0, -0.5, 0.5, 0.5,
0.03316557, -4.829428, -6.730137, 1, -0.5, 0.5, 0.5,
0.03316557, -4.829428, -6.730137, 1, 1.5, 0.5, 0.5,
0.03316557, -4.829428, -6.730137, 0, 1.5, 0.5, 0.5
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
-4.966829, -0.06842983, -6.730137, 0, -0.5, 0.5, 0.5,
-4.966829, -0.06842983, -6.730137, 1, -0.5, 0.5, 0.5,
-4.966829, -0.06842983, -6.730137, 1, 1.5, 0.5, 0.5,
-4.966829, -0.06842983, -6.730137, 0, 1.5, 0.5, 0.5
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
-4.966829, -4.829428, 0.08691931, 0, -0.5, 0.5, 0.5,
-4.966829, -4.829428, 0.08691931, 1, -0.5, 0.5, 0.5,
-4.966829, -4.829428, 0.08691931, 1, 1.5, 0.5, 0.5,
-4.966829, -4.829428, 0.08691931, 0, 1.5, 0.5, 0.5
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
-2, -3.730736, -5.15697,
2, -3.730736, -5.15697,
-2, -3.730736, -5.15697,
-2, -3.913852, -5.419164,
0, -3.730736, -5.15697,
0, -3.913852, -5.419164,
2, -3.730736, -5.15697,
2, -3.913852, -5.419164
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
-2, -4.280082, -5.943553, 0, -0.5, 0.5, 0.5,
-2, -4.280082, -5.943553, 1, -0.5, 0.5, 0.5,
-2, -4.280082, -5.943553, 1, 1.5, 0.5, 0.5,
-2, -4.280082, -5.943553, 0, 1.5, 0.5, 0.5,
0, -4.280082, -5.943553, 0, -0.5, 0.5, 0.5,
0, -4.280082, -5.943553, 1, -0.5, 0.5, 0.5,
0, -4.280082, -5.943553, 1, 1.5, 0.5, 0.5,
0, -4.280082, -5.943553, 0, 1.5, 0.5, 0.5,
2, -4.280082, -5.943553, 0, -0.5, 0.5, 0.5,
2, -4.280082, -5.943553, 1, -0.5, 0.5, 0.5,
2, -4.280082, -5.943553, 1, 1.5, 0.5, 0.5,
2, -4.280082, -5.943553, 0, 1.5, 0.5, 0.5
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
-3.812984, -2, -5.15697,
-3.812984, 2, -5.15697,
-3.812984, -2, -5.15697,
-4.005291, -2, -5.419164,
-3.812984, 0, -5.15697,
-4.005291, 0, -5.419164,
-3.812984, 2, -5.15697,
-4.005291, 2, -5.419164
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
-4.389906, -2, -5.943553, 0, -0.5, 0.5, 0.5,
-4.389906, -2, -5.943553, 1, -0.5, 0.5, 0.5,
-4.389906, -2, -5.943553, 1, 1.5, 0.5, 0.5,
-4.389906, -2, -5.943553, 0, 1.5, 0.5, 0.5,
-4.389906, 0, -5.943553, 0, -0.5, 0.5, 0.5,
-4.389906, 0, -5.943553, 1, -0.5, 0.5, 0.5,
-4.389906, 0, -5.943553, 1, 1.5, 0.5, 0.5,
-4.389906, 0, -5.943553, 0, 1.5, 0.5, 0.5,
-4.389906, 2, -5.943553, 0, -0.5, 0.5, 0.5,
-4.389906, 2, -5.943553, 1, -0.5, 0.5, 0.5,
-4.389906, 2, -5.943553, 1, 1.5, 0.5, 0.5,
-4.389906, 2, -5.943553, 0, 1.5, 0.5, 0.5
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
-3.812984, -3.730736, -4,
-3.812984, -3.730736, 4,
-3.812984, -3.730736, -4,
-4.005291, -3.913852, -4,
-3.812984, -3.730736, -2,
-4.005291, -3.913852, -2,
-3.812984, -3.730736, 0,
-4.005291, -3.913852, 0,
-3.812984, -3.730736, 2,
-4.005291, -3.913852, 2,
-3.812984, -3.730736, 4,
-4.005291, -3.913852, 4
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
-4.389906, -4.280082, -4, 0, -0.5, 0.5, 0.5,
-4.389906, -4.280082, -4, 1, -0.5, 0.5, 0.5,
-4.389906, -4.280082, -4, 1, 1.5, 0.5, 0.5,
-4.389906, -4.280082, -4, 0, 1.5, 0.5, 0.5,
-4.389906, -4.280082, -2, 0, -0.5, 0.5, 0.5,
-4.389906, -4.280082, -2, 1, -0.5, 0.5, 0.5,
-4.389906, -4.280082, -2, 1, 1.5, 0.5, 0.5,
-4.389906, -4.280082, -2, 0, 1.5, 0.5, 0.5,
-4.389906, -4.280082, 0, 0, -0.5, 0.5, 0.5,
-4.389906, -4.280082, 0, 1, -0.5, 0.5, 0.5,
-4.389906, -4.280082, 0, 1, 1.5, 0.5, 0.5,
-4.389906, -4.280082, 0, 0, 1.5, 0.5, 0.5,
-4.389906, -4.280082, 2, 0, -0.5, 0.5, 0.5,
-4.389906, -4.280082, 2, 1, -0.5, 0.5, 0.5,
-4.389906, -4.280082, 2, 1, 1.5, 0.5, 0.5,
-4.389906, -4.280082, 2, 0, 1.5, 0.5, 0.5,
-4.389906, -4.280082, 4, 0, -0.5, 0.5, 0.5,
-4.389906, -4.280082, 4, 1, -0.5, 0.5, 0.5,
-4.389906, -4.280082, 4, 1, 1.5, 0.5, 0.5,
-4.389906, -4.280082, 4, 0, 1.5, 0.5, 0.5
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
-3.812984, -3.730736, -5.15697,
-3.812984, 3.593877, -5.15697,
-3.812984, -3.730736, 5.330809,
-3.812984, 3.593877, 5.330809,
-3.812984, -3.730736, -5.15697,
-3.812984, -3.730736, 5.330809,
-3.812984, 3.593877, -5.15697,
-3.812984, 3.593877, 5.330809,
-3.812984, -3.730736, -5.15697,
3.879315, -3.730736, -5.15697,
-3.812984, -3.730736, 5.330809,
3.879315, -3.730736, 5.330809,
-3.812984, 3.593877, -5.15697,
3.879315, 3.593877, -5.15697,
-3.812984, 3.593877, 5.330809,
3.879315, 3.593877, 5.330809,
3.879315, -3.730736, -5.15697,
3.879315, 3.593877, -5.15697,
3.879315, -3.730736, 5.330809,
3.879315, 3.593877, 5.330809,
3.879315, -3.730736, -5.15697,
3.879315, -3.730736, 5.330809,
3.879315, 3.593877, -5.15697,
3.879315, 3.593877, 5.330809
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
var radius = 7.970721;
var distance = 35.46264;
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
mvMatrix.translate( -0.03316557, 0.06842983, -0.08691931 );
mvMatrix.scale( 1.120354, 1.176594, 0.8217279 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.46264);
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
cyclopropyloxycarbon<-read.table("cyclopropyloxycarbon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyclopropyloxycarbon$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropyloxycarbon' not found
```

```r
y<-cyclopropyloxycarbon$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropyloxycarbon' not found
```

```r
z<-cyclopropyloxycarbon$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropyloxycarbon' not found
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
-3.70096, 0.03729814, -0.304648, 0, 0, 1, 1, 1,
-2.652663, -1.471811, -1.959528, 1, 0, 0, 1, 1,
-2.608028, 0.7714378, 0.6864967, 1, 0, 0, 1, 1,
-2.539723, -0.2924448, -1.006029, 1, 0, 0, 1, 1,
-2.429616, 0.9722255, -1.780039, 1, 0, 0, 1, 1,
-2.399876, -0.6809329, -2.371369, 1, 0, 0, 1, 1,
-2.399087, 0.3988723, 0.7748168, 0, 0, 0, 1, 1,
-2.325087, 0.5184671, -0.6800128, 0, 0, 0, 1, 1,
-2.324071, 0.7410481, -0.4704643, 0, 0, 0, 1, 1,
-2.286096, -0.5333054, -2.56616, 0, 0, 0, 1, 1,
-2.258775, -0.1357775, -0.6673336, 0, 0, 0, 1, 1,
-2.242458, -1.452405, -1.687731, 0, 0, 0, 1, 1,
-2.112864, 1.657805, -1.078728, 0, 0, 0, 1, 1,
-2.064933, -0.9427579, -1.699317, 1, 1, 1, 1, 1,
-2.062733, -0.8721491, -2.50925, 1, 1, 1, 1, 1,
-2.01942, 2.055682, -1.532307, 1, 1, 1, 1, 1,
-2.017281, -0.2683757, -1.443868, 1, 1, 1, 1, 1,
-2.012277, -1.223482, -1.836735, 1, 1, 1, 1, 1,
-2.004423, 1.240348, -1.32802, 1, 1, 1, 1, 1,
-1.99025, 0.6639157, -1.534015, 1, 1, 1, 1, 1,
-1.966486, 1.250483, -0.7010985, 1, 1, 1, 1, 1,
-1.9102, -0.7660657, -3.099363, 1, 1, 1, 1, 1,
-1.901109, -0.4206118, -1.531494, 1, 1, 1, 1, 1,
-1.898038, 0.7714071, -1.96609, 1, 1, 1, 1, 1,
-1.861694, 0.7016846, -2.58693, 1, 1, 1, 1, 1,
-1.86119, 0.7229005, -1.413695, 1, 1, 1, 1, 1,
-1.858368, -0.9733322, -1.657114, 1, 1, 1, 1, 1,
-1.856162, 0.9674653, -1.57467, 1, 1, 1, 1, 1,
-1.834815, 0.2236886, -0.2812208, 0, 0, 1, 1, 1,
-1.831577, 0.0148048, -3.014126, 1, 0, 0, 1, 1,
-1.810041, -0.6656265, -0.8748088, 1, 0, 0, 1, 1,
-1.79778, 0.2322721, -0.7525035, 1, 0, 0, 1, 1,
-1.795885, 1.308851, -1.745844, 1, 0, 0, 1, 1,
-1.794251, -2.149716, -2.619766, 1, 0, 0, 1, 1,
-1.789076, -0.7196245, -2.171887, 0, 0, 0, 1, 1,
-1.773012, 0.06318517, -2.235806, 0, 0, 0, 1, 1,
-1.770057, -1.291715, -2.68252, 0, 0, 0, 1, 1,
-1.762426, 0.008659449, -1.220679, 0, 0, 0, 1, 1,
-1.760117, -1.82266, -2.685687, 0, 0, 0, 1, 1,
-1.713183, 0.897943, -0.2239357, 0, 0, 0, 1, 1,
-1.709141, 0.1971698, 0.1498584, 0, 0, 0, 1, 1,
-1.66923, 0.1792499, -1.643757, 1, 1, 1, 1, 1,
-1.663547, -0.7981122, -0.9791816, 1, 1, 1, 1, 1,
-1.663243, 0.5858936, -2.346104, 1, 1, 1, 1, 1,
-1.65291, 0.947729, -0.2368645, 1, 1, 1, 1, 1,
-1.652795, 0.06257062, -0.7797564, 1, 1, 1, 1, 1,
-1.645174, -1.203813, -1.106951, 1, 1, 1, 1, 1,
-1.637996, -0.8656259, -1.872501, 1, 1, 1, 1, 1,
-1.637387, -0.2010324, -2.336562, 1, 1, 1, 1, 1,
-1.630349, 1.348023, -1.179142, 1, 1, 1, 1, 1,
-1.619774, 0.4613731, -1.135889, 1, 1, 1, 1, 1,
-1.606239, 0.6306959, -0.2847345, 1, 1, 1, 1, 1,
-1.600889, 0.6474311, -1.429328, 1, 1, 1, 1, 1,
-1.599115, -0.7477877, -2.141223, 1, 1, 1, 1, 1,
-1.594884, -0.8295082, -0.1724739, 1, 1, 1, 1, 1,
-1.591575, 1.727773, 1.493696, 1, 1, 1, 1, 1,
-1.579157, 1.462558, -2.334738, 0, 0, 1, 1, 1,
-1.576925, -1.557735, -3.654727, 1, 0, 0, 1, 1,
-1.574355, -0.3145096, -0.6027532, 1, 0, 0, 1, 1,
-1.57309, 0.01562592, -0.4131178, 1, 0, 0, 1, 1,
-1.570825, -0.1358339, -1.602379, 1, 0, 0, 1, 1,
-1.567147, 0.7997657, -2.395115, 1, 0, 0, 1, 1,
-1.560143, 0.6758204, 0.6761869, 0, 0, 0, 1, 1,
-1.557627, 0.8054177, -0.5160491, 0, 0, 0, 1, 1,
-1.554269, -0.2437921, -2.066853, 0, 0, 0, 1, 1,
-1.55348, 3.487208, -1.922366, 0, 0, 0, 1, 1,
-1.550583, -0.847126, -1.849676, 0, 0, 0, 1, 1,
-1.546019, 0.7490435, -0.7253027, 0, 0, 0, 1, 1,
-1.54468, 1.152589, -1.042456, 0, 0, 0, 1, 1,
-1.52323, 0.7678917, -0.4503852, 1, 1, 1, 1, 1,
-1.510264, -0.1940788, -0.8056703, 1, 1, 1, 1, 1,
-1.496689, 1.08826, -2.268901, 1, 1, 1, 1, 1,
-1.492285, -1.251601, -0.7338952, 1, 1, 1, 1, 1,
-1.476721, 0.633395, 0.5096731, 1, 1, 1, 1, 1,
-1.472481, 0.7210284, -1.689836, 1, 1, 1, 1, 1,
-1.470299, -0.07761808, -0.1715821, 1, 1, 1, 1, 1,
-1.46656, -1.434652, -2.282864, 1, 1, 1, 1, 1,
-1.458517, 3.007589, -0.4790649, 1, 1, 1, 1, 1,
-1.452527, 0.0898539, -1.223603, 1, 1, 1, 1, 1,
-1.435759, -1.098298, -2.790835, 1, 1, 1, 1, 1,
-1.431658, -0.4964139, -1.22809, 1, 1, 1, 1, 1,
-1.431371, -0.5337126, -2.048473, 1, 1, 1, 1, 1,
-1.416345, -0.06105008, -1.863759, 1, 1, 1, 1, 1,
-1.416089, -0.4994679, -1.275341, 1, 1, 1, 1, 1,
-1.407775, -0.6400499, -2.492983, 0, 0, 1, 1, 1,
-1.397731, -1.817589, -1.959488, 1, 0, 0, 1, 1,
-1.393887, 0.4416368, -3.0616, 1, 0, 0, 1, 1,
-1.381458, -0.9195154, -3.95444, 1, 0, 0, 1, 1,
-1.372872, -0.9500757, -3.95863, 1, 0, 0, 1, 1,
-1.368998, 0.8845382, -2.379488, 1, 0, 0, 1, 1,
-1.357067, 0.4017926, -1.15549, 0, 0, 0, 1, 1,
-1.340204, -0.1454215, -1.681774, 0, 0, 0, 1, 1,
-1.337218, 1.87796, -2.331649, 0, 0, 0, 1, 1,
-1.328646, 0.443196, -0.08974677, 0, 0, 0, 1, 1,
-1.327368, 0.2904015, -1.058406, 0, 0, 0, 1, 1,
-1.323753, -0.02404088, -0.2373477, 0, 0, 0, 1, 1,
-1.320471, 1.160861, -2.144591, 0, 0, 0, 1, 1,
-1.316806, -0.4678477, -2.615454, 1, 1, 1, 1, 1,
-1.30416, -0.3787189, -1.013861, 1, 1, 1, 1, 1,
-1.301468, 1.081424, -0.4207128, 1, 1, 1, 1, 1,
-1.301106, 1.802162, -2.416897, 1, 1, 1, 1, 1,
-1.299821, 0.2853095, -1.097881, 1, 1, 1, 1, 1,
-1.298761, 0.7812429, 0.9383298, 1, 1, 1, 1, 1,
-1.296238, 0.4199742, -1.903727, 1, 1, 1, 1, 1,
-1.29577, 0.6646203, 1.173252, 1, 1, 1, 1, 1,
-1.286562, -1.298238, -3.071264, 1, 1, 1, 1, 1,
-1.283149, -0.003105999, -2.495802, 1, 1, 1, 1, 1,
-1.280929, 0.8145043, -0.3215734, 1, 1, 1, 1, 1,
-1.271383, -1.085477, -2.722108, 1, 1, 1, 1, 1,
-1.267495, -2.028039, -3.909758, 1, 1, 1, 1, 1,
-1.262758, 0.1537508, -3.67821, 1, 1, 1, 1, 1,
-1.259695, -0.5302093, -4.109892, 1, 1, 1, 1, 1,
-1.258441, -0.4361741, -1.628712, 0, 0, 1, 1, 1,
-1.251789, -0.4819931, -2.451246, 1, 0, 0, 1, 1,
-1.249378, 0.3250327, -1.895977, 1, 0, 0, 1, 1,
-1.2446, -0.4297448, -0.3984057, 1, 0, 0, 1, 1,
-1.244202, 1.042373, -1.163897, 1, 0, 0, 1, 1,
-1.243098, 1.317896, 0.1416036, 1, 0, 0, 1, 1,
-1.240552, -0.03150314, -2.214969, 0, 0, 0, 1, 1,
-1.236507, -0.4707646, -2.072844, 0, 0, 0, 1, 1,
-1.23064, 0.1112535, -3.29954, 0, 0, 0, 1, 1,
-1.226385, -1.978986, -2.105387, 0, 0, 0, 1, 1,
-1.225358, 1.811213, 0.3041462, 0, 0, 0, 1, 1,
-1.224795, -0.02942361, -2.411291, 0, 0, 0, 1, 1,
-1.219824, -0.03517207, -2.761959, 0, 0, 0, 1, 1,
-1.212599, -1.323666, -4.654072, 1, 1, 1, 1, 1,
-1.211425, 0.5024404, -1.004427, 1, 1, 1, 1, 1,
-1.208122, 0.5904511, 0.472708, 1, 1, 1, 1, 1,
-1.200175, 0.9495934, -0.3664013, 1, 1, 1, 1, 1,
-1.19906, 0.1944543, -0.3204994, 1, 1, 1, 1, 1,
-1.174642, -0.6511332, -1.365977, 1, 1, 1, 1, 1,
-1.168735, 0.1505104, -1.56916, 1, 1, 1, 1, 1,
-1.158, 0.6881655, -1.944009, 1, 1, 1, 1, 1,
-1.153872, 1.170394, 1.71588, 1, 1, 1, 1, 1,
-1.152642, -1.657804, -3.061748, 1, 1, 1, 1, 1,
-1.151916, -0.7820422, -2.075629, 1, 1, 1, 1, 1,
-1.146536, -0.7325984, -1.964251, 1, 1, 1, 1, 1,
-1.146252, 1.095544, 0.3888485, 1, 1, 1, 1, 1,
-1.143529, 0.0278045, -0.9798466, 1, 1, 1, 1, 1,
-1.143391, -0.4624746, -0.08678859, 1, 1, 1, 1, 1,
-1.140109, -0.5788133, -0.5844418, 0, 0, 1, 1, 1,
-1.139704, -0.04261054, -2.211174, 1, 0, 0, 1, 1,
-1.131599, -1.131637, -2.965958, 1, 0, 0, 1, 1,
-1.128945, 0.8846458, -2.770028, 1, 0, 0, 1, 1,
-1.126035, 0.4391744, -1.327918, 1, 0, 0, 1, 1,
-1.11849, -0.5315439, 0.02660048, 1, 0, 0, 1, 1,
-1.117507, -0.628253, -1.51325, 0, 0, 0, 1, 1,
-1.1161, 0.5260374, -3.068344, 0, 0, 0, 1, 1,
-1.1087, 1.922741, -0.4672979, 0, 0, 0, 1, 1,
-1.101754, 0.01563483, -2.39693, 0, 0, 0, 1, 1,
-1.101611, 1.041443, -1.775342, 0, 0, 0, 1, 1,
-1.099141, 0.5736097, -2.001376, 0, 0, 0, 1, 1,
-1.097927, 0.7818165, -1.536048, 0, 0, 0, 1, 1,
-1.080697, 0.1734961, 0.8505713, 1, 1, 1, 1, 1,
-1.079884, -0.4432479, -2.517401, 1, 1, 1, 1, 1,
-1.079307, -0.6515543, -1.27796, 1, 1, 1, 1, 1,
-1.07687, -0.4208611, -0.4837883, 1, 1, 1, 1, 1,
-1.066343, -0.1064589, -2.406155, 1, 1, 1, 1, 1,
-1.060405, 1.095153, -2.748142, 1, 1, 1, 1, 1,
-1.0504, -0.9691602, -4.455166, 1, 1, 1, 1, 1,
-1.049299, -0.9111006, -1.485392, 1, 1, 1, 1, 1,
-1.045238, -1.405928, -4.451088, 1, 1, 1, 1, 1,
-1.035934, 0.7679753, 0.1231402, 1, 1, 1, 1, 1,
-1.034796, -0.5236386, -2.480397, 1, 1, 1, 1, 1,
-1.029613, -0.4022101, -1.754696, 1, 1, 1, 1, 1,
-1.026576, 1.2226, -2.516209, 1, 1, 1, 1, 1,
-1.021334, -0.6040764, -4.310925, 1, 1, 1, 1, 1,
-1.01849, 1.434432, -1.0736, 1, 1, 1, 1, 1,
-1.01566, -0.6313685, -0.3500375, 0, 0, 1, 1, 1,
-1.011983, -0.7015671, -2.461898, 1, 0, 0, 1, 1,
-1.009317, 0.8306506, -1.978764, 1, 0, 0, 1, 1,
-1.008162, -0.5315945, -3.468189, 1, 0, 0, 1, 1,
-1.0056, 0.1281803, -1.516966, 1, 0, 0, 1, 1,
-1.002351, 1.239866, -1.925285, 1, 0, 0, 1, 1,
-1.001093, 0.1689109, 0.1656662, 0, 0, 0, 1, 1,
-0.9978529, 0.3392456, -1.148988, 0, 0, 0, 1, 1,
-0.991439, 2.014239, -1.121812, 0, 0, 0, 1, 1,
-0.9898079, -0.9677338, -1.880346, 0, 0, 0, 1, 1,
-0.9842206, -1.935964, -4.70663, 0, 0, 0, 1, 1,
-0.9733372, -0.3477933, -2.478653, 0, 0, 0, 1, 1,
-0.9707233, 0.715912, -1.646147, 0, 0, 0, 1, 1,
-0.9686542, 0.7593395, -1.222641, 1, 1, 1, 1, 1,
-0.9680566, -1.552025, -4.304992, 1, 1, 1, 1, 1,
-0.9676539, 0.2564831, -0.7108014, 1, 1, 1, 1, 1,
-0.9662547, -1.784428, -4.02701, 1, 1, 1, 1, 1,
-0.9656372, 0.4126157, -1.203972, 1, 1, 1, 1, 1,
-0.964644, 1.634408, -0.6582152, 1, 1, 1, 1, 1,
-0.9531168, 0.5737105, -0.8515656, 1, 1, 1, 1, 1,
-0.9453569, -0.2343987, -0.8320354, 1, 1, 1, 1, 1,
-0.9450292, -1.21845, -2.932568, 1, 1, 1, 1, 1,
-0.9442577, -1.214141, -2.460834, 1, 1, 1, 1, 1,
-0.942855, -0.5426924, -3.666786, 1, 1, 1, 1, 1,
-0.9373607, 0.8445605, -1.135028, 1, 1, 1, 1, 1,
-0.9270504, 0.1933346, -1.075025, 1, 1, 1, 1, 1,
-0.9261234, 0.1619416, -3.003888, 1, 1, 1, 1, 1,
-0.9249732, 0.7020073, -1.501903, 1, 1, 1, 1, 1,
-0.9223376, -0.4237405, -2.825496, 0, 0, 1, 1, 1,
-0.9204902, 0.3698853, 0.2257513, 1, 0, 0, 1, 1,
-0.9168689, 0.2712568, -2.346571, 1, 0, 0, 1, 1,
-0.9044384, -0.002893228, -0.2840889, 1, 0, 0, 1, 1,
-0.898599, 0.7264496, -1.276686, 1, 0, 0, 1, 1,
-0.8936928, 0.07021999, -1.047925, 1, 0, 0, 1, 1,
-0.8934191, 0.5093074, -1.415811, 0, 0, 0, 1, 1,
-0.885614, 1.363469, 0.4620661, 0, 0, 0, 1, 1,
-0.8837951, 0.2872249, -2.798963, 0, 0, 0, 1, 1,
-0.8806635, 0.0002681072, -0.5923799, 0, 0, 0, 1, 1,
-0.8790467, 0.1038951, -2.839439, 0, 0, 0, 1, 1,
-0.8752841, -0.100573, -1.585366, 0, 0, 0, 1, 1,
-0.8743578, 0.4607233, -1.429071, 0, 0, 0, 1, 1,
-0.8704129, -0.8454284, -1.945666, 1, 1, 1, 1, 1,
-0.8687236, -0.5383865, -2.958231, 1, 1, 1, 1, 1,
-0.8624764, 0.951198, -1.788779, 1, 1, 1, 1, 1,
-0.8582945, -0.3932033, -3.483081, 1, 1, 1, 1, 1,
-0.8512962, 2.412716, -0.4370376, 1, 1, 1, 1, 1,
-0.8453682, 1.775036, -2.558788, 1, 1, 1, 1, 1,
-0.8428199, -0.09111661, -0.34535, 1, 1, 1, 1, 1,
-0.8388698, -0.3084072, -2.3958, 1, 1, 1, 1, 1,
-0.8386323, -0.3901976, -2.589789, 1, 1, 1, 1, 1,
-0.8190296, 2.011552, -0.2376038, 1, 1, 1, 1, 1,
-0.816166, -0.4241056, -3.312733, 1, 1, 1, 1, 1,
-0.8123538, 0.458187, -1.386651, 1, 1, 1, 1, 1,
-0.811524, -1.144215, -2.260268, 1, 1, 1, 1, 1,
-0.8076837, 0.8224485, 1.437967, 1, 1, 1, 1, 1,
-0.8072368, 0.5432954, -1.190986, 1, 1, 1, 1, 1,
-0.8064513, 1.29939, -0.9637128, 0, 0, 1, 1, 1,
-0.7993279, 1.732996, -0.5657626, 1, 0, 0, 1, 1,
-0.7984778, 0.4711193, -0.05910209, 1, 0, 0, 1, 1,
-0.7969521, -0.1807044, -1.411737, 1, 0, 0, 1, 1,
-0.7908857, 0.1518099, 0.6395752, 1, 0, 0, 1, 1,
-0.7847918, -0.8193254, -1.767287, 1, 0, 0, 1, 1,
-0.7831253, 0.6795376, -1.444411, 0, 0, 0, 1, 1,
-0.7799498, 0.5856056, -1.668266, 0, 0, 0, 1, 1,
-0.777068, -1.177805, -4.123024, 0, 0, 0, 1, 1,
-0.774742, -0.6702503, -1.797381, 0, 0, 0, 1, 1,
-0.7725711, 2.113435, 0.5766099, 0, 0, 0, 1, 1,
-0.7720177, 0.3808089, -2.100209, 0, 0, 0, 1, 1,
-0.7687469, 0.2398753, -1.689426, 0, 0, 0, 1, 1,
-0.7673419, 1.469112, -0.4832211, 1, 1, 1, 1, 1,
-0.7634745, -0.09263571, -2.075415, 1, 1, 1, 1, 1,
-0.7621067, -0.4318303, -4.98489, 1, 1, 1, 1, 1,
-0.7601544, 1.491218, -1.052372, 1, 1, 1, 1, 1,
-0.756166, -1.103855, -3.945733, 1, 1, 1, 1, 1,
-0.7555062, -0.08871026, -1.858387, 1, 1, 1, 1, 1,
-0.7526063, 1.984063, -0.1595282, 1, 1, 1, 1, 1,
-0.7499701, 0.5932518, -1.479717, 1, 1, 1, 1, 1,
-0.7433919, 1.123039, -0.313389, 1, 1, 1, 1, 1,
-0.7373044, -0.9827567, -3.578191, 1, 1, 1, 1, 1,
-0.7348069, -1.323917, -1.533992, 1, 1, 1, 1, 1,
-0.7345135, 0.2818275, -0.8828111, 1, 1, 1, 1, 1,
-0.7304905, -0.8598392, -1.924921, 1, 1, 1, 1, 1,
-0.7277165, 1.025259, -1.056785, 1, 1, 1, 1, 1,
-0.7269067, 1.232402, -0.947041, 1, 1, 1, 1, 1,
-0.725158, 2.035476, -0.8377587, 0, 0, 1, 1, 1,
-0.7231621, 0.2240504, -0.3911122, 1, 0, 0, 1, 1,
-0.7199642, 0.04141446, -2.184094, 1, 0, 0, 1, 1,
-0.7142981, -1.761621, -1.087141, 1, 0, 0, 1, 1,
-0.7137701, 0.2200287, 0.5536005, 1, 0, 0, 1, 1,
-0.7121353, 1.288936, -0.2339515, 1, 0, 0, 1, 1,
-0.7093917, 0.3119226, 0.2084152, 0, 0, 0, 1, 1,
-0.7084447, 0.414848, -1.00897, 0, 0, 0, 1, 1,
-0.7048364, -1.929272, -1.821745, 0, 0, 0, 1, 1,
-0.7031997, 0.8343939, -0.04779855, 0, 0, 0, 1, 1,
-0.7014427, 0.8946525, -1.125678, 0, 0, 0, 1, 1,
-0.7013243, 2.339772, -1.22356, 0, 0, 0, 1, 1,
-0.6956005, 1.212707, -0.2662111, 0, 0, 0, 1, 1,
-0.6940102, -0.938303, -4.736985, 1, 1, 1, 1, 1,
-0.6888322, 1.010159, -0.03588862, 1, 1, 1, 1, 1,
-0.6811285, -0.1375882, 0.2526901, 1, 1, 1, 1, 1,
-0.6790499, -1.247445, -3.882949, 1, 1, 1, 1, 1,
-0.6773272, 1.175838, 0.0281796, 1, 1, 1, 1, 1,
-0.6755247, -0.9936029, -1.385277, 1, 1, 1, 1, 1,
-0.6626111, 1.19287, -0.830839, 1, 1, 1, 1, 1,
-0.6530778, 0.8965027, -1.890673, 1, 1, 1, 1, 1,
-0.6474263, -0.3012005, -2.932779, 1, 1, 1, 1, 1,
-0.6466033, 0.1836607, -2.083352, 1, 1, 1, 1, 1,
-0.644763, -1.798796, -1.077049, 1, 1, 1, 1, 1,
-0.6435968, -0.5649734, -1.55661, 1, 1, 1, 1, 1,
-0.6434788, -0.3612348, -1.872606, 1, 1, 1, 1, 1,
-0.6415467, 0.248822, -3.094039, 1, 1, 1, 1, 1,
-0.6354008, -0.1439704, -2.433413, 1, 1, 1, 1, 1,
-0.6327742, 1.659515, 0.2159135, 0, 0, 1, 1, 1,
-0.6321669, 0.2892663, -0.3769024, 1, 0, 0, 1, 1,
-0.6270599, 0.5326496, 1.0749, 1, 0, 0, 1, 1,
-0.6237545, 0.5488871, -2.543223, 1, 0, 0, 1, 1,
-0.6232033, 0.2261314, -0.6480525, 1, 0, 0, 1, 1,
-0.6201909, 0.1412957, -2.851333, 1, 0, 0, 1, 1,
-0.6198047, -0.6157061, -1.696289, 0, 0, 0, 1, 1,
-0.6160419, -0.09442563, -1.151606, 0, 0, 0, 1, 1,
-0.6047461, -1.468302, -4.180165, 0, 0, 0, 1, 1,
-0.6027662, -0.2804172, -2.519201, 0, 0, 0, 1, 1,
-0.5991781, -0.158839, -2.387019, 0, 0, 0, 1, 1,
-0.5976158, 0.3518175, 0.3163384, 0, 0, 0, 1, 1,
-0.5925174, 0.4432715, -3.190454, 0, 0, 0, 1, 1,
-0.5910847, 0.9084594, -2.588995, 1, 1, 1, 1, 1,
-0.5908182, -0.988346, -3.685548, 1, 1, 1, 1, 1,
-0.5877181, 0.3818783, -2.608271, 1, 1, 1, 1, 1,
-0.5855811, -0.5494446, -1.49998, 1, 1, 1, 1, 1,
-0.5736355, -1.079574, -3.068827, 1, 1, 1, 1, 1,
-0.5736116, 1.1572, -0.4420204, 1, 1, 1, 1, 1,
-0.5706806, 1.237073, -1.226462, 1, 1, 1, 1, 1,
-0.5585103, -1.845582, -3.114712, 1, 1, 1, 1, 1,
-0.5572426, -1.172785, -2.588878, 1, 1, 1, 1, 1,
-0.5546975, 2.716956, -0.006312117, 1, 1, 1, 1, 1,
-0.5501897, 0.246441, -0.7846829, 1, 1, 1, 1, 1,
-0.5493147, -0.3774803, -0.2347392, 1, 1, 1, 1, 1,
-0.5466913, -0.01714937, -0.9058336, 1, 1, 1, 1, 1,
-0.5456917, -0.6060508, -3.340822, 1, 1, 1, 1, 1,
-0.5428512, 1.889634, -0.7764141, 1, 1, 1, 1, 1,
-0.5398784, -0.5923143, -2.174367, 0, 0, 1, 1, 1,
-0.5387843, -1.219401, -3.443232, 1, 0, 0, 1, 1,
-0.5354615, -0.3758059, -2.134702, 1, 0, 0, 1, 1,
-0.5345148, 0.4993242, 0.8264769, 1, 0, 0, 1, 1,
-0.5287948, -0.9338316, -2.460036, 1, 0, 0, 1, 1,
-0.5278788, -1.388848, -3.693626, 1, 0, 0, 1, 1,
-0.5237826, 0.2414092, -1.237405, 0, 0, 0, 1, 1,
-0.5222075, 0.3599592, -1.472533, 0, 0, 0, 1, 1,
-0.520746, 2.311012, -0.1359501, 0, 0, 0, 1, 1,
-0.519495, 1.989054, 2.325353, 0, 0, 0, 1, 1,
-0.5188529, -0.7172581, -3.437393, 0, 0, 0, 1, 1,
-0.5162533, 0.7210122, -1.452545, 0, 0, 0, 1, 1,
-0.516067, -0.920379, -4.791343, 0, 0, 0, 1, 1,
-0.5125502, 1.566983, 0.363326, 1, 1, 1, 1, 1,
-0.5080392, 1.152519, 0.03343224, 1, 1, 1, 1, 1,
-0.5067295, -0.1551395, -1.226057, 1, 1, 1, 1, 1,
-0.5014597, -0.7440972, -1.503519, 1, 1, 1, 1, 1,
-0.4991957, -0.179075, -2.847631, 1, 1, 1, 1, 1,
-0.495162, -3.624067, -3.294079, 1, 1, 1, 1, 1,
-0.4941171, 1.285855, -1.456632, 1, 1, 1, 1, 1,
-0.4900887, -1.804981, -2.079044, 1, 1, 1, 1, 1,
-0.4876882, 0.8839707, 0.5978822, 1, 1, 1, 1, 1,
-0.4838882, -1.120368, -3.308892, 1, 1, 1, 1, 1,
-0.481906, -0.7094483, -2.251108, 1, 1, 1, 1, 1,
-0.4798246, -0.06989197, -1.282119, 1, 1, 1, 1, 1,
-0.4797311, 0.9798356, -1.482151, 1, 1, 1, 1, 1,
-0.4778124, -0.1368766, -2.452873, 1, 1, 1, 1, 1,
-0.476815, 0.1279187, -2.091474, 1, 1, 1, 1, 1,
-0.4703312, 2.326321, 0.03637058, 0, 0, 1, 1, 1,
-0.4674597, -1.938428, -2.89927, 1, 0, 0, 1, 1,
-0.4583604, -0.7845589, -4.055516, 1, 0, 0, 1, 1,
-0.4530057, -0.4184545, -2.122202, 1, 0, 0, 1, 1,
-0.4477007, 0.3960276, -0.7465826, 1, 0, 0, 1, 1,
-0.4471443, -0.05937395, -3.722934, 1, 0, 0, 1, 1,
-0.4463297, 1.293599, 1.330346, 0, 0, 0, 1, 1,
-0.4454848, -1.129488, -3.37341, 0, 0, 0, 1, 1,
-0.444308, 1.163598, 0.5228836, 0, 0, 0, 1, 1,
-0.441712, -0.3510548, -2.482075, 0, 0, 0, 1, 1,
-0.4373464, -0.4275405, -3.122624, 0, 0, 0, 1, 1,
-0.4276928, 0.03146845, 0.6009893, 0, 0, 0, 1, 1,
-0.42557, -1.208673, -2.715891, 0, 0, 0, 1, 1,
-0.4238229, -1.289617, -2.746473, 1, 1, 1, 1, 1,
-0.4124276, 0.1449916, 0.4998452, 1, 1, 1, 1, 1,
-0.4102297, 0.3452369, -1.491718, 1, 1, 1, 1, 1,
-0.4083608, 0.08622245, -0.5591375, 1, 1, 1, 1, 1,
-0.403847, -1.520685, -3.57001, 1, 1, 1, 1, 1,
-0.3973288, -0.7255514, -1.781002, 1, 1, 1, 1, 1,
-0.3917724, 0.8043525, -1.006108, 1, 1, 1, 1, 1,
-0.389041, 0.09318437, -0.01801258, 1, 1, 1, 1, 1,
-0.3879941, -0.9385952, -1.895591, 1, 1, 1, 1, 1,
-0.3870829, 0.3660796, -0.5093852, 1, 1, 1, 1, 1,
-0.3864733, 0.2974921, 0.3035755, 1, 1, 1, 1, 1,
-0.3846322, 0.2195513, 0.5285872, 1, 1, 1, 1, 1,
-0.3805886, -1.388404, -4.979174, 1, 1, 1, 1, 1,
-0.377115, -0.2032885, -2.667207, 1, 1, 1, 1, 1,
-0.3696117, 0.02494445, -1.33722, 1, 1, 1, 1, 1,
-0.3687162, 0.8656234, 0.157335, 0, 0, 1, 1, 1,
-0.3684021, -0.8948427, -0.972874, 1, 0, 0, 1, 1,
-0.3683469, 0.2808534, -1.92143, 1, 0, 0, 1, 1,
-0.3648385, -1.28545, -2.336895, 1, 0, 0, 1, 1,
-0.3636284, -1.018281, -1.851957, 1, 0, 0, 1, 1,
-0.3611604, 0.8617088, -3.199327, 1, 0, 0, 1, 1,
-0.3569262, 1.626675, -1.067312, 0, 0, 0, 1, 1,
-0.3564254, -0.9620916, -4.23509, 0, 0, 0, 1, 1,
-0.3558052, 1.081154, 1.110292, 0, 0, 0, 1, 1,
-0.3556703, 0.9639558, -1.068816, 0, 0, 0, 1, 1,
-0.3542498, -0.3071083, -3.48957, 0, 0, 0, 1, 1,
-0.3511494, -0.3105089, -0.2574789, 0, 0, 0, 1, 1,
-0.3476528, 1.100083, 1.056568, 0, 0, 0, 1, 1,
-0.3456725, 0.7013013, -1.730421, 1, 1, 1, 1, 1,
-0.3423398, -0.3964536, -2.961056, 1, 1, 1, 1, 1,
-0.3358621, 0.09068714, -2.342532, 1, 1, 1, 1, 1,
-0.3337997, 1.617536, 1.862769, 1, 1, 1, 1, 1,
-0.3308446, -0.1925057, -4.281027, 1, 1, 1, 1, 1,
-0.3279992, 1.561698, -0.18387, 1, 1, 1, 1, 1,
-0.3265583, -1.127246, -3.468714, 1, 1, 1, 1, 1,
-0.3263206, -0.541763, -1.973847, 1, 1, 1, 1, 1,
-0.3258825, 0.2207637, -0.3984947, 1, 1, 1, 1, 1,
-0.3249876, -1.689137, -2.561219, 1, 1, 1, 1, 1,
-0.3225479, -0.1065713, -2.268933, 1, 1, 1, 1, 1,
-0.3224018, -0.7672824, -0.5560352, 1, 1, 1, 1, 1,
-0.3221325, 0.5345131, -0.9808671, 1, 1, 1, 1, 1,
-0.3207361, -0.0622995, -2.891409, 1, 1, 1, 1, 1,
-0.3184745, 0.460042, 0.3585681, 1, 1, 1, 1, 1,
-0.3176176, 2.062563, -0.616826, 0, 0, 1, 1, 1,
-0.3162997, -0.8729024, -1.730693, 1, 0, 0, 1, 1,
-0.3143112, 0.7472568, -1.413124, 1, 0, 0, 1, 1,
-0.3127218, 1.013256, -1.30012, 1, 0, 0, 1, 1,
-0.3091771, 0.4310749, -2.309963, 1, 0, 0, 1, 1,
-0.3085349, 0.4093646, -0.9589524, 1, 0, 0, 1, 1,
-0.3082902, -1.506771, -2.036147, 0, 0, 0, 1, 1,
-0.3080278, -0.289655, -3.974409, 0, 0, 0, 1, 1,
-0.3043904, 0.5853226, 0.2810897, 0, 0, 0, 1, 1,
-0.3013169, -0.3009386, -1.071981, 0, 0, 0, 1, 1,
-0.300952, -0.6728488, -2.530157, 0, 0, 0, 1, 1,
-0.2973567, -0.3643584, -1.606103, 0, 0, 0, 1, 1,
-0.2947513, -1.245129, -2.108823, 0, 0, 0, 1, 1,
-0.2934234, 1.613739, 0.8839873, 1, 1, 1, 1, 1,
-0.2927911, -1.237143, -3.864489, 1, 1, 1, 1, 1,
-0.2925354, 1.105828, -0.3959286, 1, 1, 1, 1, 1,
-0.28641, -0.8125875, -1.963385, 1, 1, 1, 1, 1,
-0.2863096, 0.2116179, -1.880562, 1, 1, 1, 1, 1,
-0.2782108, -0.07448032, -1.672323, 1, 1, 1, 1, 1,
-0.272871, -0.3577076, -1.472231, 1, 1, 1, 1, 1,
-0.2613796, -1.697869, -3.167371, 1, 1, 1, 1, 1,
-0.2557229, 0.5394472, -1.91588, 1, 1, 1, 1, 1,
-0.2549856, 0.2053351, 0.09392329, 1, 1, 1, 1, 1,
-0.2540818, 0.3551947, -1.704203, 1, 1, 1, 1, 1,
-0.2533325, 0.1160508, -0.9684387, 1, 1, 1, 1, 1,
-0.2441637, 1.117425, -2.444109, 1, 1, 1, 1, 1,
-0.2430702, -1.609901, -3.80363, 1, 1, 1, 1, 1,
-0.2409121, -0.7995106, -2.71914, 1, 1, 1, 1, 1,
-0.2375491, -0.9460598, -3.721678, 0, 0, 1, 1, 1,
-0.2328766, -0.9979605, -2.921687, 1, 0, 0, 1, 1,
-0.2315861, -0.8400261, -2.401267, 1, 0, 0, 1, 1,
-0.2309841, 0.6824083, -0.4254524, 1, 0, 0, 1, 1,
-0.2308463, 2.082747, 1.958823, 1, 0, 0, 1, 1,
-0.227763, 0.7186545, -0.9702784, 1, 0, 0, 1, 1,
-0.2256056, -0.5549501, -3.010433, 0, 0, 0, 1, 1,
-0.2219847, -0.8320883, -3.227655, 0, 0, 0, 1, 1,
-0.2188513, -0.4778939, -1.470087, 0, 0, 0, 1, 1,
-0.2163193, 0.2704661, 1.146342, 0, 0, 0, 1, 1,
-0.2152387, 0.7002037, 0.2621367, 0, 0, 0, 1, 1,
-0.2134151, 0.4943897, -0.117372, 0, 0, 0, 1, 1,
-0.2111833, -0.1655732, -1.869191, 0, 0, 0, 1, 1,
-0.2043533, 1.761817, 1.392874, 1, 1, 1, 1, 1,
-0.2035666, 0.2503864, 0.8567766, 1, 1, 1, 1, 1,
-0.2019715, -0.2567281, -3.126954, 1, 1, 1, 1, 1,
-0.2016106, 0.7325132, 1.22564, 1, 1, 1, 1, 1,
-0.1999555, 1.355772, 0.7849978, 1, 1, 1, 1, 1,
-0.1997169, -0.3151282, -4.615241, 1, 1, 1, 1, 1,
-0.196717, 0.2961365, -1.490377, 1, 1, 1, 1, 1,
-0.1966733, -1.226844, -3.670163, 1, 1, 1, 1, 1,
-0.1903438, -0.5157501, -2.243341, 1, 1, 1, 1, 1,
-0.1900639, -0.4925956, -2.47539, 1, 1, 1, 1, 1,
-0.1844716, 1.043557, 0.6866065, 1, 1, 1, 1, 1,
-0.1815271, 0.5537554, 0.2743697, 1, 1, 1, 1, 1,
-0.1782727, -0.9412127, -1.606766, 1, 1, 1, 1, 1,
-0.1671234, -0.9908322, -3.663157, 1, 1, 1, 1, 1,
-0.1648663, 0.6023409, 0.592282, 1, 1, 1, 1, 1,
-0.1501515, -1.207591, -2.752241, 0, 0, 1, 1, 1,
-0.1491296, 0.01479496, -2.164833, 1, 0, 0, 1, 1,
-0.1450595, 1.602238, -0.888815, 1, 0, 0, 1, 1,
-0.1445098, 0.05529343, 0.9557169, 1, 0, 0, 1, 1,
-0.1390579, 1.026957, -0.8904473, 1, 0, 0, 1, 1,
-0.1360589, -0.786874, -2.624034, 1, 0, 0, 1, 1,
-0.1331164, 0.4996378, -0.03556721, 0, 0, 0, 1, 1,
-0.1254544, 1.087859, -0.767009, 0, 0, 0, 1, 1,
-0.1245472, -0.3702485, -3.151174, 0, 0, 0, 1, 1,
-0.1211606, -0.5564133, -3.217675, 0, 0, 0, 1, 1,
-0.1178237, 0.3800071, -1.272591, 0, 0, 0, 1, 1,
-0.1177065, -1.056877, -5.004235, 0, 0, 0, 1, 1,
-0.1121966, 0.5162819, 0.514494, 0, 0, 0, 1, 1,
-0.1108536, 0.3257987, -0.8253747, 1, 1, 1, 1, 1,
-0.1089817, 0.9999498, -1.400991, 1, 1, 1, 1, 1,
-0.1083327, 1.536158, -0.2233889, 1, 1, 1, 1, 1,
-0.1075057, -1.409823, -2.309425, 1, 1, 1, 1, 1,
-0.1049572, -1.755615, -2.108595, 1, 1, 1, 1, 1,
-0.1037589, 0.7448358, 0.1832986, 1, 1, 1, 1, 1,
-0.09294261, 1.24661, -0.644013, 1, 1, 1, 1, 1,
-0.09282857, 1.888101, 0.612915, 1, 1, 1, 1, 1,
-0.09170568, -0.5801456, -3.207196, 1, 1, 1, 1, 1,
-0.09004595, -0.8753704, -2.819301, 1, 1, 1, 1, 1,
-0.08928041, 0.7064784, -0.3888202, 1, 1, 1, 1, 1,
-0.08823405, -1.041014, -3.93988, 1, 1, 1, 1, 1,
-0.0877075, 1.620873, -0.5741636, 1, 1, 1, 1, 1,
-0.0835162, -0.6232525, -3.825299, 1, 1, 1, 1, 1,
-0.07850778, 0.9882937, -0.8281913, 1, 1, 1, 1, 1,
-0.07551283, -0.1966373, -2.252501, 0, 0, 1, 1, 1,
-0.07431103, -1.542575, -2.680862, 1, 0, 0, 1, 1,
-0.06961203, -0.3810704, -2.146515, 1, 0, 0, 1, 1,
-0.06312041, 1.649453, -0.7042105, 1, 0, 0, 1, 1,
-0.05941569, 0.351164, -2.411483, 1, 0, 0, 1, 1,
-0.05608433, -1.058037, -3.721012, 1, 0, 0, 1, 1,
-0.05511782, -1.258322, -4.238991, 0, 0, 0, 1, 1,
-0.05378342, -0.6480694, -2.391354, 0, 0, 0, 1, 1,
-0.05164886, -0.7253529, -2.819447, 0, 0, 0, 1, 1,
-0.04945615, 0.9855996, -0.7482878, 0, 0, 0, 1, 1,
-0.04827953, 0.4817803, 0.8469434, 0, 0, 0, 1, 1,
-0.03875561, 1.207742, 1.270341, 0, 0, 0, 1, 1,
-0.03826338, -0.3317189, -3.015972, 0, 0, 0, 1, 1,
-0.0375005, -0.309587, -2.18413, 1, 1, 1, 1, 1,
-0.03683943, 0.6914332, 0.08653767, 1, 1, 1, 1, 1,
-0.02988615, -2.03549, -3.045439, 1, 1, 1, 1, 1,
-0.02922982, -1.017236, -2.945881, 1, 1, 1, 1, 1,
-0.02922855, -0.3214152, -4.412577, 1, 1, 1, 1, 1,
-0.02111101, -0.549688, -4.2066, 1, 1, 1, 1, 1,
-0.0204932, -0.2863641, -3.034282, 1, 1, 1, 1, 1,
-0.01980447, -0.07978848, -2.459932, 1, 1, 1, 1, 1,
-0.01567233, 0.4312405, -0.1220915, 1, 1, 1, 1, 1,
-0.01420613, 0.8185627, 0.7550578, 1, 1, 1, 1, 1,
-0.01343242, -0.4891297, -3.73714, 1, 1, 1, 1, 1,
-0.01301766, -0.6557254, -3.207329, 1, 1, 1, 1, 1,
-0.01122355, 0.1030235, 0.224333, 1, 1, 1, 1, 1,
-0.008276817, 0.08978679, 0.3979241, 1, 1, 1, 1, 1,
-0.004639261, 0.2061285, -0.1382077, 1, 1, 1, 1, 1,
-0.001334707, -1.760081, -3.819225, 0, 0, 1, 1, 1,
-0.0009174278, -0.1336629, -2.459697, 1, 0, 0, 1, 1,
0.001212527, -0.7644763, 2.6914, 1, 0, 0, 1, 1,
0.001670466, 0.8004379, -0.1785096, 1, 0, 0, 1, 1,
0.005408761, 0.8634163, -1.193153, 1, 0, 0, 1, 1,
0.01087608, -2.328898, 3.363061, 1, 0, 0, 1, 1,
0.01100802, 0.1964132, 0.4476909, 0, 0, 0, 1, 1,
0.01147626, -1.605875, 0.9222044, 0, 0, 0, 1, 1,
0.01384673, 0.847845, 0.5530515, 0, 0, 0, 1, 1,
0.01640945, 0.01870138, 1.03841, 0, 0, 0, 1, 1,
0.01732269, -0.7459819, 3.242181, 0, 0, 0, 1, 1,
0.01771209, -1.191409, 2.355129, 0, 0, 0, 1, 1,
0.01901117, -0.7725568, 3.08017, 0, 0, 0, 1, 1,
0.021214, -0.06679673, 3.143459, 1, 1, 1, 1, 1,
0.02152788, 0.820143, 0.1208815, 1, 1, 1, 1, 1,
0.02160649, 1.174326, -2.077878, 1, 1, 1, 1, 1,
0.02570342, 0.2368102, -0.7138559, 1, 1, 1, 1, 1,
0.02753715, -0.252886, 3.180073, 1, 1, 1, 1, 1,
0.03059098, -0.6015166, 4.00721, 1, 1, 1, 1, 1,
0.03793583, -0.8307135, 4.353355, 1, 1, 1, 1, 1,
0.0385018, 0.08640023, 0.5951515, 1, 1, 1, 1, 1,
0.04138582, -1.35966, 1.080357, 1, 1, 1, 1, 1,
0.04355528, 0.4389473, 0.1662836, 1, 1, 1, 1, 1,
0.04402452, -1.554341, 3.137308, 1, 1, 1, 1, 1,
0.05158172, 1.376672, -0.4207485, 1, 1, 1, 1, 1,
0.05369281, 0.03422, 1.199525, 1, 1, 1, 1, 1,
0.06625419, -0.3529347, 3.085053, 1, 1, 1, 1, 1,
0.06672525, 0.8132896, 1.264197, 1, 1, 1, 1, 1,
0.06807222, -0.3159956, 4.297217, 0, 0, 1, 1, 1,
0.07072408, 0.9293504, 0.2257364, 1, 0, 0, 1, 1,
0.07272346, -0.3437382, 3.075634, 1, 0, 0, 1, 1,
0.07272744, 1.162707, 0.8527343, 1, 0, 0, 1, 1,
0.07452744, -0.5382458, 3.51918, 1, 0, 0, 1, 1,
0.07457214, -0.5846466, 2.75836, 1, 0, 0, 1, 1,
0.07710069, 1.081131, -0.4555681, 0, 0, 0, 1, 1,
0.0833327, 1.954084, -0.3921372, 0, 0, 0, 1, 1,
0.08487777, -0.167162, 2.1794, 0, 0, 0, 1, 1,
0.08524853, 0.5561953, 0.4451296, 0, 0, 0, 1, 1,
0.08636638, 1.365059, -0.925602, 0, 0, 0, 1, 1,
0.08979056, 0.9483532, 0.4695006, 0, 0, 0, 1, 1,
0.09564805, -0.8337522, 3.817978, 0, 0, 0, 1, 1,
0.1026752, 1.684034, 0.633861, 1, 1, 1, 1, 1,
0.1059194, 0.5629424, 0.5359713, 1, 1, 1, 1, 1,
0.1075079, -0.6599997, 3.471252, 1, 1, 1, 1, 1,
0.1114096, 1.272797, -2.467814, 1, 1, 1, 1, 1,
0.1157611, 0.1449618, 2.182347, 1, 1, 1, 1, 1,
0.1161932, -0.03094456, 2.735461, 1, 1, 1, 1, 1,
0.1169343, 0.698966, -0.7106723, 1, 1, 1, 1, 1,
0.1185843, 2.752903, -0.2012731, 1, 1, 1, 1, 1,
0.1243251, 1.190838, 0.2279524, 1, 1, 1, 1, 1,
0.1301801, 0.2461867, 0.7085143, 1, 1, 1, 1, 1,
0.1326166, 1.39032, -0.1210072, 1, 1, 1, 1, 1,
0.133227, -0.323374, 1.26619, 1, 1, 1, 1, 1,
0.1362894, -1.897926, 3.652786, 1, 1, 1, 1, 1,
0.1377233, -0.8738024, 3.264016, 1, 1, 1, 1, 1,
0.1391823, 1.64391, -0.3907835, 1, 1, 1, 1, 1,
0.1395018, 0.2822593, 0.65055, 0, 0, 1, 1, 1,
0.1476622, 0.5254604, 0.8325382, 1, 0, 0, 1, 1,
0.1479339, -2.515896, 2.124078, 1, 0, 0, 1, 1,
0.1519852, -0.2011811, 1.268281, 1, 0, 0, 1, 1,
0.1525065, -0.04638269, 0.7434309, 1, 0, 0, 1, 1,
0.1561984, -0.8848336, 3.664119, 1, 0, 0, 1, 1,
0.1572259, 0.6077023, 0.06177336, 0, 0, 0, 1, 1,
0.1581548, 0.5013003, 0.8723494, 0, 0, 0, 1, 1,
0.1733025, -1.091181, 3.651498, 0, 0, 0, 1, 1,
0.1802675, -0.06428602, 2.226093, 0, 0, 0, 1, 1,
0.1855332, -0.01499887, 0.5356791, 0, 0, 0, 1, 1,
0.1863627, -0.4696673, 5.178074, 0, 0, 0, 1, 1,
0.188354, -1.10874, 1.889562, 0, 0, 0, 1, 1,
0.1889663, 1.041141, 0.6748527, 1, 1, 1, 1, 1,
0.1944919, 0.3713361, 0.7792979, 1, 1, 1, 1, 1,
0.1960226, 1.7681, 0.5097247, 1, 1, 1, 1, 1,
0.20054, -0.8133782, 4.2606, 1, 1, 1, 1, 1,
0.2020031, -1.128285, 2.490833, 1, 1, 1, 1, 1,
0.2046014, -0.9926676, 4.489979, 1, 1, 1, 1, 1,
0.2094487, 1.612134, -0.656669, 1, 1, 1, 1, 1,
0.2104573, 0.8284414, 0.04558773, 1, 1, 1, 1, 1,
0.2129729, 0.3229334, -0.8044655, 1, 1, 1, 1, 1,
0.2136968, -2.292034, 4.460833, 1, 1, 1, 1, 1,
0.2155351, -0.1813338, 2.200662, 1, 1, 1, 1, 1,
0.2158429, -0.7201651, 2.230902, 1, 1, 1, 1, 1,
0.2160684, -0.2512493, 3.096565, 1, 1, 1, 1, 1,
0.2161789, 1.323641, -0.6269436, 1, 1, 1, 1, 1,
0.2182114, -0.9624573, 1.67259, 1, 1, 1, 1, 1,
0.2200242, 0.5374827, 0.8526516, 0, 0, 1, 1, 1,
0.221626, 0.2187991, 1.065688, 1, 0, 0, 1, 1,
0.2216632, 1.358183, 1.229997, 1, 0, 0, 1, 1,
0.2232565, 1.153298, 0.07029315, 1, 0, 0, 1, 1,
0.229132, 0.04227423, 1.85909, 1, 0, 0, 1, 1,
0.2296399, -0.1058265, 1.445289, 1, 0, 0, 1, 1,
0.2321406, -1.117486, 3.474635, 0, 0, 0, 1, 1,
0.2364137, -0.9107701, 3.64174, 0, 0, 0, 1, 1,
0.2448926, -0.7743478, 2.148204, 0, 0, 0, 1, 1,
0.2463846, 0.07126404, 0.7933328, 0, 0, 0, 1, 1,
0.247119, 0.5769054, 0.1889926, 0, 0, 0, 1, 1,
0.247887, -1.739362, 3.246681, 0, 0, 0, 1, 1,
0.2488476, 0.75845, 1.31337, 0, 0, 0, 1, 1,
0.2501048, -0.8296795, 1.639982, 1, 1, 1, 1, 1,
0.2527259, -1.257243, 2.695637, 1, 1, 1, 1, 1,
0.2543052, -0.7781023, 3.599965, 1, 1, 1, 1, 1,
0.2562124, -0.6558656, 4.613575, 1, 1, 1, 1, 1,
0.2614586, -1.076358, 4.536974, 1, 1, 1, 1, 1,
0.2641523, -0.2581504, 1.283328, 1, 1, 1, 1, 1,
0.2642079, 1.382179, -0.9211442, 1, 1, 1, 1, 1,
0.2724712, 0.1321623, 1.492497, 1, 1, 1, 1, 1,
0.2738666, 0.5198165, 0.6178303, 1, 1, 1, 1, 1,
0.2743251, -1.341655, 3.684115, 1, 1, 1, 1, 1,
0.2761942, 1.95233, 0.09415054, 1, 1, 1, 1, 1,
0.2772785, 0.1108242, 1.037306, 1, 1, 1, 1, 1,
0.2786242, 1.115613, 0.6308059, 1, 1, 1, 1, 1,
0.2788975, -1.681491, 1.900845, 1, 1, 1, 1, 1,
0.2856177, 0.3554335, 0.2721601, 1, 1, 1, 1, 1,
0.2899523, 0.9361274, -0.5915988, 0, 0, 1, 1, 1,
0.2947728, -1.449143, 2.522823, 1, 0, 0, 1, 1,
0.2952436, -1.39428, 4.788745, 1, 0, 0, 1, 1,
0.2953518, 1.180778, -0.02163813, 1, 0, 0, 1, 1,
0.2995326, -1.572535, 3.960249, 1, 0, 0, 1, 1,
0.3024918, 2.663847, 0.059658, 1, 0, 0, 1, 1,
0.3032754, 0.7468935, -0.7252487, 0, 0, 0, 1, 1,
0.30843, -0.127619, 2.010671, 0, 0, 0, 1, 1,
0.3107825, -0.7545297, 2.547115, 0, 0, 0, 1, 1,
0.3108042, 1.025928, 2.580538, 0, 0, 0, 1, 1,
0.3110119, 0.2109357, 0.7412891, 0, 0, 0, 1, 1,
0.3112132, -1.176728, 3.033605, 0, 0, 0, 1, 1,
0.3146116, 0.3667766, 0.9334059, 0, 0, 0, 1, 1,
0.3161187, 1.385704, -0.9981896, 1, 1, 1, 1, 1,
0.3180283, -0.3507044, 3.089948, 1, 1, 1, 1, 1,
0.3203493, -0.3873086, 3.582553, 1, 1, 1, 1, 1,
0.3235174, -0.8433086, 2.664549, 1, 1, 1, 1, 1,
0.3235521, -0.3385343, 1.771171, 1, 1, 1, 1, 1,
0.3301172, 0.6019362, -0.9378949, 1, 1, 1, 1, 1,
0.3348579, -0.07690441, 2.049956, 1, 1, 1, 1, 1,
0.3349154, -1.313568, 2.880949, 1, 1, 1, 1, 1,
0.3395149, -0.7012822, 2.765748, 1, 1, 1, 1, 1,
0.3410853, 0.2753802, 1.952107, 1, 1, 1, 1, 1,
0.343504, 1.429105, 0.6252364, 1, 1, 1, 1, 1,
0.3489859, 0.2736289, 2.395913, 1, 1, 1, 1, 1,
0.3495664, 1.985401, 0.9419556, 1, 1, 1, 1, 1,
0.3576252, -1.980448, 4.471107, 1, 1, 1, 1, 1,
0.3596897, -0.3258577, 0.02689763, 1, 1, 1, 1, 1,
0.3610239, -1.446813, 2.915343, 0, 0, 1, 1, 1,
0.3623023, -0.1873855, 1.416801, 1, 0, 0, 1, 1,
0.3758592, -1.292968, 2.539383, 1, 0, 0, 1, 1,
0.3774175, 0.8924984, 0.6529743, 1, 0, 0, 1, 1,
0.3810953, -0.4626729, 1.326061, 1, 0, 0, 1, 1,
0.3873855, 0.01525232, 2.378756, 1, 0, 0, 1, 1,
0.3882861, -0.02247914, 1.941965, 0, 0, 0, 1, 1,
0.3900289, -0.8797418, 1.215793, 0, 0, 0, 1, 1,
0.3979486, -1.057511, 3.02124, 0, 0, 0, 1, 1,
0.400016, 0.8011531, 0.7169353, 0, 0, 0, 1, 1,
0.4008147, -0.4164481, 2.244877, 0, 0, 0, 1, 1,
0.4023007, -0.281179, 1.939176, 0, 0, 0, 1, 1,
0.403264, 0.8533247, 0.7747836, 0, 0, 0, 1, 1,
0.4069403, 1.233758, 1.854228, 1, 1, 1, 1, 1,
0.4102356, 0.1274485, 0.9710419, 1, 1, 1, 1, 1,
0.4152278, -0.2215304, 2.089874, 1, 1, 1, 1, 1,
0.4155495, -0.5351985, 2.938311, 1, 1, 1, 1, 1,
0.4217652, 1.405536, 0.2869646, 1, 1, 1, 1, 1,
0.4252374, 1.598948, 0.4491219, 1, 1, 1, 1, 1,
0.4257987, 1.187834, 0.3673614, 1, 1, 1, 1, 1,
0.4277893, 1.149392, 0.2709514, 1, 1, 1, 1, 1,
0.4311004, 0.3723142, -0.7427778, 1, 1, 1, 1, 1,
0.4331809, -1.835741, 2.392238, 1, 1, 1, 1, 1,
0.4358229, -1.61841, 2.735408, 1, 1, 1, 1, 1,
0.436322, 0.2658779, 0.8178216, 1, 1, 1, 1, 1,
0.4376504, -0.16723, 0.8742647, 1, 1, 1, 1, 1,
0.4388165, 1.065669, 0.2753938, 1, 1, 1, 1, 1,
0.4413581, -0.2562842, 0.9526675, 1, 1, 1, 1, 1,
0.4417554, 0.6399105, 2.244112, 0, 0, 1, 1, 1,
0.4439532, -1.292823, 1.83396, 1, 0, 0, 1, 1,
0.4442489, -0.8885701, 3.275301, 1, 0, 0, 1, 1,
0.4458764, 1.862381, 0.7129954, 1, 0, 0, 1, 1,
0.4508737, 0.1256208, 2.523796, 1, 0, 0, 1, 1,
0.4546657, 0.464613, -0.516126, 1, 0, 0, 1, 1,
0.4552887, 0.716027, 0.4568465, 0, 0, 0, 1, 1,
0.4600796, -0.3970256, 2.29773, 0, 0, 0, 1, 1,
0.4628872, 0.07204872, 2.784458, 0, 0, 0, 1, 1,
0.4690586, -0.8718997, 1.333457, 0, 0, 0, 1, 1,
0.469111, 2.019617, 0.8564029, 0, 0, 0, 1, 1,
0.4710791, -0.08797054, 2.44017, 0, 0, 0, 1, 1,
0.4758674, 1.19003, -0.4798639, 0, 0, 0, 1, 1,
0.4808159, 0.1407628, 3.123893, 1, 1, 1, 1, 1,
0.485285, -0.5191178, 2.809284, 1, 1, 1, 1, 1,
0.4946463, -0.5353725, 2.973498, 1, 1, 1, 1, 1,
0.5008372, -2.153069, 4.115854, 1, 1, 1, 1, 1,
0.5031363, 1.120584, 0.1253813, 1, 1, 1, 1, 1,
0.512679, 1.060791, 0.353015, 1, 1, 1, 1, 1,
0.5128518, 0.2376667, 1.366826, 1, 1, 1, 1, 1,
0.5146614, -2.530062, 4.470151, 1, 1, 1, 1, 1,
0.5219027, -0.2737664, 0.9944403, 1, 1, 1, 1, 1,
0.5222287, 0.8063523, 1.54872, 1, 1, 1, 1, 1,
0.5229425, 1.628176, -0.4104535, 1, 1, 1, 1, 1,
0.5305269, -0.6944787, 2.214809, 1, 1, 1, 1, 1,
0.532245, -0.3175364, 3.339296, 1, 1, 1, 1, 1,
0.5393866, -0.9001678, 2.585851, 1, 1, 1, 1, 1,
0.5461798, -0.1347362, 1.33804, 1, 1, 1, 1, 1,
0.5472281, -0.1562951, 1.090374, 0, 0, 1, 1, 1,
0.5483857, 0.3955132, -0.8608993, 1, 0, 0, 1, 1,
0.5538003, -0.9330364, 1.621554, 1, 0, 0, 1, 1,
0.5543629, -0.8569877, 2.641388, 1, 0, 0, 1, 1,
0.5550888, 0.08328325, -1.198921, 1, 0, 0, 1, 1,
0.5569767, -1.254411, 2.570119, 1, 0, 0, 1, 1,
0.5596022, -0.1315738, 3.267655, 0, 0, 0, 1, 1,
0.5688166, -0.1735751, 4.00486, 0, 0, 0, 1, 1,
0.5700054, -0.08603222, 1.487803, 0, 0, 0, 1, 1,
0.5730487, -0.2518681, 1.721842, 0, 0, 0, 1, 1,
0.574702, 1.608804, -0.1538181, 0, 0, 0, 1, 1,
0.5748582, 1.628493, 0.7693242, 0, 0, 0, 1, 1,
0.579161, 0.8923969, 1.088344, 0, 0, 0, 1, 1,
0.5807195, -0.2304753, 0.8130345, 1, 1, 1, 1, 1,
0.587402, -0.8039966, 2.186417, 1, 1, 1, 1, 1,
0.5983043, -1.139327, 4.070351, 1, 1, 1, 1, 1,
0.6022542, -0.5301507, 0.5076066, 1, 1, 1, 1, 1,
0.6036225, -0.4724973, 2.777109, 1, 1, 1, 1, 1,
0.6068943, -0.1600995, 3.11641, 1, 1, 1, 1, 1,
0.6078289, 0.607016, 1.5105, 1, 1, 1, 1, 1,
0.6101462, -0.5337932, 3.548342, 1, 1, 1, 1, 1,
0.6158113, 1.416816, -1.540653, 1, 1, 1, 1, 1,
0.6174939, 0.1201548, 0.4572064, 1, 1, 1, 1, 1,
0.6178343, 0.07656209, 3.369333, 1, 1, 1, 1, 1,
0.6196657, -0.1506039, 2.715126, 1, 1, 1, 1, 1,
0.6197894, -0.3036031, 1.238952, 1, 1, 1, 1, 1,
0.6201611, -0.6313003, 0.6018668, 1, 1, 1, 1, 1,
0.6211793, 0.5022135, 1.55692, 1, 1, 1, 1, 1,
0.6272276, 0.4641778, 1.149501, 0, 0, 1, 1, 1,
0.6287957, 1.057581, 2.209769, 1, 0, 0, 1, 1,
0.6289663, 0.04449305, 1.12447, 1, 0, 0, 1, 1,
0.6310545, -1.461614, 3.736962, 1, 0, 0, 1, 1,
0.6310726, -0.9244988, 4.067287, 1, 0, 0, 1, 1,
0.6333553, 0.8972622, 1.230194, 1, 0, 0, 1, 1,
0.6401468, 1.452699, 0.9157546, 0, 0, 0, 1, 1,
0.6464123, -0.02473493, 0.9126197, 0, 0, 0, 1, 1,
0.6467746, 0.5073926, -0.6010305, 0, 0, 0, 1, 1,
0.6470732, -1.065251, 4.579862, 0, 0, 0, 1, 1,
0.6494006, -0.8129032, 3.705498, 0, 0, 0, 1, 1,
0.6505578, 0.7422263, 0.6273926, 0, 0, 0, 1, 1,
0.6506886, 0.723724, 1.638204, 0, 0, 0, 1, 1,
0.6508979, 1.553016, 1.16394, 1, 1, 1, 1, 1,
0.6537807, -0.2321517, 1.484169, 1, 1, 1, 1, 1,
0.6539936, -0.4563189, 2.54963, 1, 1, 1, 1, 1,
0.6632684, -0.2993902, 1.959727, 1, 1, 1, 1, 1,
0.6682613, -2.903444, 2.898763, 1, 1, 1, 1, 1,
0.6746597, 0.01151953, 2.838113, 1, 1, 1, 1, 1,
0.6755981, 1.320908, 0.04485489, 1, 1, 1, 1, 1,
0.6760443, -0.03750894, 1.132851, 1, 1, 1, 1, 1,
0.6780592, -0.877286, 2.850139, 1, 1, 1, 1, 1,
0.6791968, -0.3761261, 1.191102, 1, 1, 1, 1, 1,
0.6808302, -0.1485875, 1.778672, 1, 1, 1, 1, 1,
0.6826528, -1.32262, 3.762397, 1, 1, 1, 1, 1,
0.683898, -1.29765, 1.388052, 1, 1, 1, 1, 1,
0.6841725, 0.07916048, 3.057661, 1, 1, 1, 1, 1,
0.6843194, 1.271501, 1.554611, 1, 1, 1, 1, 1,
0.6889003, 0.2785786, 1.547516, 0, 0, 1, 1, 1,
0.6947108, 1.371327, -0.7600642, 1, 0, 0, 1, 1,
0.6971237, 1.145629, -0.6527719, 1, 0, 0, 1, 1,
0.7013642, 0.9046109, 1.501831, 1, 0, 0, 1, 1,
0.7058616, -0.1478869, 1.880598, 1, 0, 0, 1, 1,
0.7106665, 0.213479, 0.7422031, 1, 0, 0, 1, 1,
0.7166265, -0.009123904, 1.738349, 0, 0, 0, 1, 1,
0.7179949, 1.334626, 0.5372899, 0, 0, 0, 1, 1,
0.7194863, -0.2833163, 1.396954, 0, 0, 0, 1, 1,
0.7225471, 1.777604, -1.054982, 0, 0, 0, 1, 1,
0.7229195, 0.03867904, 0.783828, 0, 0, 0, 1, 1,
0.7251867, 0.6423395, 1.534709, 0, 0, 0, 1, 1,
0.7253704, 0.4165306, 0.616877, 0, 0, 0, 1, 1,
0.7262207, 0.936163, 0.6888901, 1, 1, 1, 1, 1,
0.7310292, 0.3516418, 1.775499, 1, 1, 1, 1, 1,
0.7313567, -1.675567, 3.448349, 1, 1, 1, 1, 1,
0.7314833, -0.8191103, 3.509197, 1, 1, 1, 1, 1,
0.7353005, 0.7917566, 1.835013, 1, 1, 1, 1, 1,
0.7365143, -0.5554983, 5.156223, 1, 1, 1, 1, 1,
0.7386218, 3.259257, -0.8957401, 1, 1, 1, 1, 1,
0.7437319, -1.045542, 2.342313, 1, 1, 1, 1, 1,
0.7481335, -0.8511868, 2.164891, 1, 1, 1, 1, 1,
0.7503762, -1.523518, 3.721121, 1, 1, 1, 1, 1,
0.7507287, -0.1014688, 0.6485445, 1, 1, 1, 1, 1,
0.7584635, -0.2062318, 0.9519898, 1, 1, 1, 1, 1,
0.762993, 0.1166341, 0.6022709, 1, 1, 1, 1, 1,
0.767767, 1.541665, -0.5910034, 1, 1, 1, 1, 1,
0.7704223, 1.315621, -0.5592387, 1, 1, 1, 1, 1,
0.7706657, 1.103154, 1.299936, 0, 0, 1, 1, 1,
0.771017, 0.8194885, 0.3643553, 1, 0, 0, 1, 1,
0.7728074, -0.4856333, 2.567826, 1, 0, 0, 1, 1,
0.7801888, 0.1876112, 0.6692604, 1, 0, 0, 1, 1,
0.78609, -1.742051, 2.523659, 1, 0, 0, 1, 1,
0.788789, 0.9741744, -0.4003189, 1, 0, 0, 1, 1,
0.7897421, 1.09593, 0.2801969, 0, 0, 0, 1, 1,
0.7913513, 1.089504, 0.84407, 0, 0, 0, 1, 1,
0.8015513, 0.5247734, -0.2686487, 0, 0, 0, 1, 1,
0.8038532, 1.32926, -0.4972301, 0, 0, 0, 1, 1,
0.8057905, -1.524896, 3.650043, 0, 0, 0, 1, 1,
0.8067342, -0.3691022, 3.26757, 0, 0, 0, 1, 1,
0.8078794, 0.9915162, -0.6611223, 0, 0, 0, 1, 1,
0.8096194, -0.1544541, 0.1581351, 1, 1, 1, 1, 1,
0.8103537, -0.9565622, 3.07646, 1, 1, 1, 1, 1,
0.8118261, 2.873814, 0.6215464, 1, 1, 1, 1, 1,
0.8125495, 1.228326, -0.7771606, 1, 1, 1, 1, 1,
0.8148213, -0.4591826, 2.847275, 1, 1, 1, 1, 1,
0.8194376, -0.3787946, 2.562714, 1, 1, 1, 1, 1,
0.8199612, -0.8975381, 3.132403, 1, 1, 1, 1, 1,
0.8237097, -1.692935, 3.747533, 1, 1, 1, 1, 1,
0.8259732, -0.1751311, 4.517552, 1, 1, 1, 1, 1,
0.8266254, 1.915257, -0.7611033, 1, 1, 1, 1, 1,
0.8267373, -0.2785342, 2.222096, 1, 1, 1, 1, 1,
0.8334282, 0.7071148, -0.29455, 1, 1, 1, 1, 1,
0.8393098, -0.298658, 1.453005, 1, 1, 1, 1, 1,
0.8421525, 0.1450511, 1.049373, 1, 1, 1, 1, 1,
0.8465389, 0.3298861, 0.141234, 1, 1, 1, 1, 1,
0.8554363, -0.0007427029, 1.655988, 0, 0, 1, 1, 1,
0.856108, 0.9059938, -0.2988791, 1, 0, 0, 1, 1,
0.8586383, 0.1053236, 1.836669, 1, 0, 0, 1, 1,
0.859604, -0.1207728, 4.077562, 1, 0, 0, 1, 1,
0.8693821, 0.02707105, 2.279324, 1, 0, 0, 1, 1,
0.8694123, 1.035673, 0.7564915, 1, 0, 0, 1, 1,
0.8696851, 0.5198923, 1.026695, 0, 0, 0, 1, 1,
0.8702826, 1.877178, 2.565667, 0, 0, 0, 1, 1,
0.8708641, 2.029022, 1.389386, 0, 0, 0, 1, 1,
0.8718891, -1.662042, 1.938754, 0, 0, 0, 1, 1,
0.8726552, -0.950928, 2.470063, 0, 0, 0, 1, 1,
0.882315, 0.2007518, 0.009042748, 0, 0, 0, 1, 1,
0.8908954, 0.6935891, 0.5700903, 0, 0, 0, 1, 1,
0.8914897, -0.5531081, 0.9770567, 1, 1, 1, 1, 1,
0.8928958, -0.2908049, 2.208009, 1, 1, 1, 1, 1,
0.8940526, 1.265583, 1.188546, 1, 1, 1, 1, 1,
0.898492, -0.5084007, 1.852358, 1, 1, 1, 1, 1,
0.9013028, -1.249604, 2.107346, 1, 1, 1, 1, 1,
0.9030598, 1.085641, 2.29477, 1, 1, 1, 1, 1,
0.9142664, -1.063109, 3.048168, 1, 1, 1, 1, 1,
0.9172877, 0.3369661, 1.149446, 1, 1, 1, 1, 1,
0.9207761, -0.3607379, 1.24025, 1, 1, 1, 1, 1,
0.9255812, -1.474217, 2.141252, 1, 1, 1, 1, 1,
0.9264358, 0.8863336, -0.9971985, 1, 1, 1, 1, 1,
0.9413273, 0.3035276, 1.221775, 1, 1, 1, 1, 1,
0.9467333, 1.972456, 0.4018561, 1, 1, 1, 1, 1,
0.9498171, -0.7727683, 2.096585, 1, 1, 1, 1, 1,
0.9629855, 0.5862217, -0.04830328, 1, 1, 1, 1, 1,
0.9703788, -0.2329706, 1.699158, 0, 0, 1, 1, 1,
0.9725118, -0.5472285, 1.691967, 1, 0, 0, 1, 1,
0.9861788, 0.5979323, 0.9678273, 1, 0, 0, 1, 1,
0.99405, -0.2128962, -0.02498732, 1, 0, 0, 1, 1,
0.9989079, -0.9056243, 0.6924193, 1, 0, 0, 1, 1,
1.000474, 0.3616174, 1.869007, 1, 0, 0, 1, 1,
1.005671, 0.4125767, 0.9627392, 0, 0, 0, 1, 1,
1.006042, 0.3495537, 0.2635181, 0, 0, 0, 1, 1,
1.010682, -0.5423411, 3.171877, 0, 0, 0, 1, 1,
1.021407, 1.572812, 0.007220321, 0, 0, 0, 1, 1,
1.023541, -1.321414, 4.675107, 0, 0, 0, 1, 1,
1.027021, 0.3444112, 0.13159, 0, 0, 0, 1, 1,
1.031723, 0.05465234, 0.5744846, 0, 0, 0, 1, 1,
1.034175, 0.2492965, 2.000523, 1, 1, 1, 1, 1,
1.035863, -1.667626, 0.9053537, 1, 1, 1, 1, 1,
1.043612, 0.01894834, -1.005863, 1, 1, 1, 1, 1,
1.049329, 0.2840568, 1.475572, 1, 1, 1, 1, 1,
1.054836, 1.130426, 0.204934, 1, 1, 1, 1, 1,
1.060771, 0.5381361, 2.859658, 1, 1, 1, 1, 1,
1.0629, -1.473622, 4.523323, 1, 1, 1, 1, 1,
1.070926, 1.590909, -0.5373814, 1, 1, 1, 1, 1,
1.074648, -1.398776, 2.21769, 1, 1, 1, 1, 1,
1.076474, 0.6897515, 1.05856, 1, 1, 1, 1, 1,
1.080062, -0.4451964, 2.416507, 1, 1, 1, 1, 1,
1.081274, 0.1684718, 0.7815329, 1, 1, 1, 1, 1,
1.08156, -0.8478461, 1.88836, 1, 1, 1, 1, 1,
1.083399, 1.146827, 1.034295, 1, 1, 1, 1, 1,
1.090895, 0.9295429, 0.5072534, 1, 1, 1, 1, 1,
1.092819, 1.328668, 2.820958, 0, 0, 1, 1, 1,
1.100316, -0.7503037, 2.970633, 1, 0, 0, 1, 1,
1.103544, 1.582965, 1.413273, 1, 0, 0, 1, 1,
1.110737, -0.5909879, 2.865552, 1, 0, 0, 1, 1,
1.128862, -0.03121907, 1.430772, 1, 0, 0, 1, 1,
1.131433, 2.023274, 0.002234405, 1, 0, 0, 1, 1,
1.136377, 1.361811, 1.344639, 0, 0, 0, 1, 1,
1.137473, -0.7271203, 3.254393, 0, 0, 0, 1, 1,
1.137948, 1.571573, 1.70768, 0, 0, 0, 1, 1,
1.143859, -1.620599, 2.809425, 0, 0, 0, 1, 1,
1.144999, 0.7105939, 2.155426, 0, 0, 0, 1, 1,
1.151841, -0.3355485, 0.8886232, 0, 0, 0, 1, 1,
1.158162, -0.004418309, 2.21596, 0, 0, 0, 1, 1,
1.159432, 1.52051, 0.41211, 1, 1, 1, 1, 1,
1.159923, 2.135495, 0.741745, 1, 1, 1, 1, 1,
1.165513, -1.071082, 1.455654, 1, 1, 1, 1, 1,
1.166626, -0.8741272, 3.048393, 1, 1, 1, 1, 1,
1.168771, 1.220059, 1.727972, 1, 1, 1, 1, 1,
1.175587, -1.25448, 1.953549, 1, 1, 1, 1, 1,
1.178124, -0.7542894, 2.189364, 1, 1, 1, 1, 1,
1.183334, -1.279187, 0.2228418, 1, 1, 1, 1, 1,
1.185907, 0.6501472, 0.3634517, 1, 1, 1, 1, 1,
1.188313, -0.2880335, 1.184492, 1, 1, 1, 1, 1,
1.191756, -0.178937, 0.2293536, 1, 1, 1, 1, 1,
1.192536, 0.6402512, -0.4583542, 1, 1, 1, 1, 1,
1.19526, 0.293118, -1.041648, 1, 1, 1, 1, 1,
1.203122, 0.4381991, 0.3862145, 1, 1, 1, 1, 1,
1.205464, -1.818482, 4.371695, 1, 1, 1, 1, 1,
1.220522, -0.09993766, 1.005203, 0, 0, 1, 1, 1,
1.221842, -0.6837689, 1.322835, 1, 0, 0, 1, 1,
1.22456, 0.4824078, 0.9843723, 1, 0, 0, 1, 1,
1.22533, 0.8380597, 2.835414, 1, 0, 0, 1, 1,
1.227362, -0.2979677, 1.461734, 1, 0, 0, 1, 1,
1.22877, 1.886311, 0.6699761, 1, 0, 0, 1, 1,
1.24001, -0.216325, 0.4488654, 0, 0, 0, 1, 1,
1.240683, 0.1603665, 1.768583, 0, 0, 0, 1, 1,
1.244031, -0.01296389, 2.255203, 0, 0, 0, 1, 1,
1.244342, -0.9432544, 3.18631, 0, 0, 0, 1, 1,
1.245375, -1.178797, 3.794696, 0, 0, 0, 1, 1,
1.247966, -0.502252, 1.480744, 0, 0, 0, 1, 1,
1.250399, 1.436546, -0.2496776, 0, 0, 0, 1, 1,
1.26178, 0.6777476, 0.5331065, 1, 1, 1, 1, 1,
1.263282, -1.711724, 1.101537, 1, 1, 1, 1, 1,
1.267232, 0.1638107, 1.969331, 1, 1, 1, 1, 1,
1.268749, -0.4470242, 2.308238, 1, 1, 1, 1, 1,
1.305706, 1.224769, 0.6087435, 1, 1, 1, 1, 1,
1.307757, -0.1391211, 1.448408, 1, 1, 1, 1, 1,
1.332859, 1.333351, 1.334709, 1, 1, 1, 1, 1,
1.347451, -1.016302, 3.027806, 1, 1, 1, 1, 1,
1.35578, -1.119736, 1.292143, 1, 1, 1, 1, 1,
1.35753, 1.038895, 2.442287, 1, 1, 1, 1, 1,
1.360928, 1.401311, 0.6914721, 1, 1, 1, 1, 1,
1.362469, 0.05103667, 1.436884, 1, 1, 1, 1, 1,
1.370218, 0.1501579, 2.12065, 1, 1, 1, 1, 1,
1.376413, 0.8938932, 2.870661, 1, 1, 1, 1, 1,
1.377852, 0.5573949, 2.478873, 1, 1, 1, 1, 1,
1.412316, -0.2316491, 2.211051, 0, 0, 1, 1, 1,
1.413405, 0.3913677, -1.174821, 1, 0, 0, 1, 1,
1.435085, 0.4760644, 0.8602311, 1, 0, 0, 1, 1,
1.43538, 0.02269311, 0.3124037, 1, 0, 0, 1, 1,
1.437521, -0.1796948, 0.9206252, 1, 0, 0, 1, 1,
1.456523, -1.156867, 4.014216, 1, 0, 0, 1, 1,
1.458696, 0.3306116, 1.460445, 0, 0, 0, 1, 1,
1.472999, 1.7447, 1.302307, 0, 0, 0, 1, 1,
1.475925, -0.4949062, 2.565438, 0, 0, 0, 1, 1,
1.498973, 0.6959629, 0.6411709, 0, 0, 0, 1, 1,
1.505347, 0.8903359, -0.05021797, 0, 0, 0, 1, 1,
1.508909, 0.1422135, 1.70313, 0, 0, 0, 1, 1,
1.509821, 0.02947563, 1.780987, 0, 0, 0, 1, 1,
1.512141, -0.42679, 2.332749, 1, 1, 1, 1, 1,
1.527288, 0.1894196, -0.9016598, 1, 1, 1, 1, 1,
1.546988, 0.7182095, -0.2607198, 1, 1, 1, 1, 1,
1.549658, -0.4972733, 1.801085, 1, 1, 1, 1, 1,
1.566097, 0.02239965, 1.74302, 1, 1, 1, 1, 1,
1.569836, -0.5661213, 1.383116, 1, 1, 1, 1, 1,
1.574168, -0.05643079, 3.445832, 1, 1, 1, 1, 1,
1.580146, -0.4882399, 2.134007, 1, 1, 1, 1, 1,
1.586489, 0.5970718, 0.831569, 1, 1, 1, 1, 1,
1.587942, -1.083319, 3.128457, 1, 1, 1, 1, 1,
1.600362, -2.15974, 2.253815, 1, 1, 1, 1, 1,
1.627132, -0.348367, 3.455713, 1, 1, 1, 1, 1,
1.643377, -0.1521733, 2.204106, 1, 1, 1, 1, 1,
1.657413, -0.867597, 0.08484242, 1, 1, 1, 1, 1,
1.662184, 1.156034, 3.016287, 1, 1, 1, 1, 1,
1.666401, 0.9516131, 0.5514876, 0, 0, 1, 1, 1,
1.669587, 0.3707964, 1.381789, 1, 0, 0, 1, 1,
1.672731, -0.836686, 1.63432, 1, 0, 0, 1, 1,
1.686449, -0.9094764, 1.54018, 1, 0, 0, 1, 1,
1.706679, -0.8212718, 0.6069003, 1, 0, 0, 1, 1,
1.710696, -0.6148896, 2.478525, 1, 0, 0, 1, 1,
1.711721, 0.9266262, 1.405224, 0, 0, 0, 1, 1,
1.76568, 0.04986909, 1.148206, 0, 0, 0, 1, 1,
1.803892, -0.4118104, 1.941267, 0, 0, 0, 1, 1,
1.82734, -0.6978947, 1.320754, 0, 0, 0, 1, 1,
1.832893, -1.455293, 2.977987, 0, 0, 0, 1, 1,
1.83661, -0.446812, 2.132445, 0, 0, 0, 1, 1,
1.841355, 0.6764346, 2.76281, 0, 0, 0, 1, 1,
1.855857, -0.05132239, 3.512845, 1, 1, 1, 1, 1,
1.861209, -0.6055533, 1.777074, 1, 1, 1, 1, 1,
1.872773, -1.37455, 2.616616, 1, 1, 1, 1, 1,
1.889059, 0.520673, 1.233269, 1, 1, 1, 1, 1,
1.899603, 1.48119, 1.343854, 1, 1, 1, 1, 1,
1.915817, -0.1991332, 0.5224397, 1, 1, 1, 1, 1,
1.942798, -1.286413, 1.702308, 1, 1, 1, 1, 1,
1.947785, -0.7115977, 1.452234, 1, 1, 1, 1, 1,
1.95044, -0.4903326, 1.58255, 1, 1, 1, 1, 1,
1.96897, 0.09497719, 1.635986, 1, 1, 1, 1, 1,
1.971453, 1.269486, -0.09998055, 1, 1, 1, 1, 1,
1.973519, -1.775023, 1.959515, 1, 1, 1, 1, 1,
1.994631, -1.720833, 0.7417892, 1, 1, 1, 1, 1,
2.002478, 1.209281, 0.2531762, 1, 1, 1, 1, 1,
2.028137, -1.874366, 1.793777, 1, 1, 1, 1, 1,
2.106172, 0.4181815, -0.4565257, 0, 0, 1, 1, 1,
2.115022, 1.398091, 1.407031, 1, 0, 0, 1, 1,
2.180252, 1.957258, 1.529443, 1, 0, 0, 1, 1,
2.187785, -0.9823554, 2.44978, 1, 0, 0, 1, 1,
2.193184, -0.133234, 1.399452, 1, 0, 0, 1, 1,
2.232351, 1.75716, 2.042106, 1, 0, 0, 1, 1,
2.237181, -0.3444372, 1.653153, 0, 0, 0, 1, 1,
2.314382, 0.1203258, 3.043948, 0, 0, 0, 1, 1,
2.321739, -0.1833896, 1.513281, 0, 0, 0, 1, 1,
2.351453, 0.06158798, 1.14909, 0, 0, 0, 1, 1,
2.494716, 0.007683558, 0.8939832, 0, 0, 0, 1, 1,
2.533573, 2.106552, 0.8490224, 0, 0, 0, 1, 1,
2.544155, -0.6031399, 2.88878, 0, 0, 0, 1, 1,
2.562589, -1.661746, 2.357148, 1, 1, 1, 1, 1,
2.586599, -1.809708, 2.76574, 1, 1, 1, 1, 1,
2.629459, -0.6714007, 2.271916, 1, 1, 1, 1, 1,
2.796152, 0.3356095, 2.865308, 1, 1, 1, 1, 1,
3.055148, 1.965384, 0.8542449, 1, 1, 1, 1, 1,
3.409361, 1.083035, 0.3669678, 1, 1, 1, 1, 1,
3.767292, 2.086476, 0.3408586, 1, 1, 1, 1, 1
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
var radius = 9.855162;
var distance = 34.61584;
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
mvMatrix.translate( -0.03316569, 0.06842995, -0.08691931 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.61584);
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
