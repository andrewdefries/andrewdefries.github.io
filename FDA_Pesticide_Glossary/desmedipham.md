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
-3.251329, -1.152963, -2.227276, 1, 0, 0, 1,
-3.166743, 1.665311, -2.455761, 1, 0.007843138, 0, 1,
-3.105118, -0.2099141, -1.740019, 1, 0.01176471, 0, 1,
-2.822563, -0.7716137, -2.325566, 1, 0.01960784, 0, 1,
-2.598857, 2.113212, 0.6066043, 1, 0.02352941, 0, 1,
-2.519873, 0.8184576, 0.3988115, 1, 0.03137255, 0, 1,
-2.436239, -0.3752468, -2.879326, 1, 0.03529412, 0, 1,
-2.347524, -0.5845769, -2.847288, 1, 0.04313726, 0, 1,
-2.347278, -1.292583, -1.027398, 1, 0.04705882, 0, 1,
-2.340694, -0.2137137, -3.243511, 1, 0.05490196, 0, 1,
-2.318046, -0.2022779, -1.619353, 1, 0.05882353, 0, 1,
-2.186328, -2.72116, -4.868304, 1, 0.06666667, 0, 1,
-2.165764, 0.9114026, -1.091061, 1, 0.07058824, 0, 1,
-2.148087, -0.1602626, -1.065409, 1, 0.07843138, 0, 1,
-2.120818, 0.1105113, -1.856143, 1, 0.08235294, 0, 1,
-2.029593, -0.1540396, -1.031649, 1, 0.09019608, 0, 1,
-2.025273, -1.185215, -1.925357, 1, 0.09411765, 0, 1,
-2.013693, -0.5371121, -1.48858, 1, 0.1019608, 0, 1,
-1.946866, -1.3906, -1.834155, 1, 0.1098039, 0, 1,
-1.94213, 0.7368131, -1.411141, 1, 0.1137255, 0, 1,
-1.918076, -0.2469816, -2.157174, 1, 0.1215686, 0, 1,
-1.9079, -1.110551, -1.27959, 1, 0.1254902, 0, 1,
-1.907612, -0.7068309, -2.592736, 1, 0.1333333, 0, 1,
-1.906733, 0.05080293, 0.5949305, 1, 0.1372549, 0, 1,
-1.890814, 1.256837, -1.130237, 1, 0.145098, 0, 1,
-1.862693, 3.256809, -1.298314, 1, 0.1490196, 0, 1,
-1.843759, -1.581019, -2.631115, 1, 0.1568628, 0, 1,
-1.822749, 1.075594, -0.6298501, 1, 0.1607843, 0, 1,
-1.819759, -0.6785604, -2.039456, 1, 0.1686275, 0, 1,
-1.800694, 1.01723, 1.231151, 1, 0.172549, 0, 1,
-1.79843, -1.080063, -3.06089, 1, 0.1803922, 0, 1,
-1.796177, 0.4965446, -1.66552, 1, 0.1843137, 0, 1,
-1.781555, -0.2515766, -1.259404, 1, 0.1921569, 0, 1,
-1.777291, -0.3144154, -2.575073, 1, 0.1960784, 0, 1,
-1.764042, 0.07072065, -0.6391565, 1, 0.2039216, 0, 1,
-1.758839, -0.2056755, -1.836175, 1, 0.2117647, 0, 1,
-1.742383, 1.206631, -1.75589, 1, 0.2156863, 0, 1,
-1.741091, -0.2814881, -2.043377, 1, 0.2235294, 0, 1,
-1.737689, -0.8636641, -3.828329, 1, 0.227451, 0, 1,
-1.732775, 0.4087127, -2.170104, 1, 0.2352941, 0, 1,
-1.730817, -0.29747, -0.2033771, 1, 0.2392157, 0, 1,
-1.720202, 1.866367, -1.553791, 1, 0.2470588, 0, 1,
-1.694423, 0.7127904, -0.6722124, 1, 0.2509804, 0, 1,
-1.694242, -1.475086, -1.756968, 1, 0.2588235, 0, 1,
-1.693888, -0.02105885, 0.322887, 1, 0.2627451, 0, 1,
-1.690413, -1.87055, -1.597586, 1, 0.2705882, 0, 1,
-1.687541, 1.097854, -1.328134, 1, 0.2745098, 0, 1,
-1.684671, 0.7867824, -0.9706819, 1, 0.282353, 0, 1,
-1.684398, -0.3266782, -1.600759, 1, 0.2862745, 0, 1,
-1.682595, 0.3080188, 0.2187109, 1, 0.2941177, 0, 1,
-1.681694, 1.816318, 0.2932474, 1, 0.3019608, 0, 1,
-1.668887, 0.6027247, 0.1020274, 1, 0.3058824, 0, 1,
-1.645168, 0.8099139, -3.644436, 1, 0.3137255, 0, 1,
-1.644068, -1.657803, -2.75571, 1, 0.3176471, 0, 1,
-1.620932, 1.309397, -2.072579, 1, 0.3254902, 0, 1,
-1.608696, -0.1052816, -2.350006, 1, 0.3294118, 0, 1,
-1.603899, 2.077662, 0.6778023, 1, 0.3372549, 0, 1,
-1.591152, 0.03464033, -2.706719, 1, 0.3411765, 0, 1,
-1.589371, -0.03286558, -2.110069, 1, 0.3490196, 0, 1,
-1.574768, -1.69794, -2.211899, 1, 0.3529412, 0, 1,
-1.572414, -0.7338433, -2.349791, 1, 0.3607843, 0, 1,
-1.558691, 0.2307828, -2.386322, 1, 0.3647059, 0, 1,
-1.540507, 1.258854, -1.274782, 1, 0.372549, 0, 1,
-1.529475, -0.5078089, 0.08587516, 1, 0.3764706, 0, 1,
-1.526694, 0.831734, -1.365816, 1, 0.3843137, 0, 1,
-1.516222, -0.7364945, -2.157221, 1, 0.3882353, 0, 1,
-1.503485, -1.436729, -3.046243, 1, 0.3960784, 0, 1,
-1.478098, 0.4862694, -1.113129, 1, 0.4039216, 0, 1,
-1.47186, 1.342093, -1.062874, 1, 0.4078431, 0, 1,
-1.471065, 0.04858122, -1.868828, 1, 0.4156863, 0, 1,
-1.470636, -1.165862, -1.54169, 1, 0.4196078, 0, 1,
-1.468749, -0.9382333, -1.343284, 1, 0.427451, 0, 1,
-1.468061, -0.6551879, -2.555066, 1, 0.4313726, 0, 1,
-1.458013, -0.7366282, -1.628433, 1, 0.4392157, 0, 1,
-1.458006, -0.7500581, -2.523254, 1, 0.4431373, 0, 1,
-1.444987, -0.7725962, -3.014007, 1, 0.4509804, 0, 1,
-1.426598, 0.5059285, -0.9168386, 1, 0.454902, 0, 1,
-1.422572, 1.559604, -2.062714, 1, 0.4627451, 0, 1,
-1.408905, -1.000012, -2.383616, 1, 0.4666667, 0, 1,
-1.406278, -2.176499, -4.022633, 1, 0.4745098, 0, 1,
-1.401779, 1.511104, -1.435548, 1, 0.4784314, 0, 1,
-1.395514, 1.629101, -1.585642, 1, 0.4862745, 0, 1,
-1.3907, 0.9629506, -0.9446021, 1, 0.4901961, 0, 1,
-1.385295, 0.5142213, 0.5879644, 1, 0.4980392, 0, 1,
-1.37769, -1.595404, -1.880517, 1, 0.5058824, 0, 1,
-1.360304, -0.4511247, -1.602224, 1, 0.509804, 0, 1,
-1.35824, 1.544827, 0.5979881, 1, 0.5176471, 0, 1,
-1.34717, -0.3804669, -1.773131, 1, 0.5215687, 0, 1,
-1.343585, -0.6387051, -2.612074, 1, 0.5294118, 0, 1,
-1.340394, -1.92669, -3.675298, 1, 0.5333334, 0, 1,
-1.338059, -1.093257, -2.869296, 1, 0.5411765, 0, 1,
-1.333801, 0.5484872, -1.209768, 1, 0.5450981, 0, 1,
-1.328148, -1.584621, -2.64143, 1, 0.5529412, 0, 1,
-1.327691, -2.084129, -2.054183, 1, 0.5568628, 0, 1,
-1.31587, 0.2755086, -1.549158, 1, 0.5647059, 0, 1,
-1.31108, 1.120961, -0.5787015, 1, 0.5686275, 0, 1,
-1.294069, -0.3027571, -3.130442, 1, 0.5764706, 0, 1,
-1.290582, 0.7101348, -1.849962, 1, 0.5803922, 0, 1,
-1.290061, 0.5404329, -1.980476, 1, 0.5882353, 0, 1,
-1.285266, -0.2521599, -2.48849, 1, 0.5921569, 0, 1,
-1.280167, 1.914768, -1.107114, 1, 0.6, 0, 1,
-1.275289, 0.2828557, -1.69816, 1, 0.6078432, 0, 1,
-1.275101, 1.690732, -1.544404, 1, 0.6117647, 0, 1,
-1.274259, 0.08559822, -2.043085, 1, 0.6196079, 0, 1,
-1.269427, -1.055349, -0.6502777, 1, 0.6235294, 0, 1,
-1.264652, 0.03838891, -1.277831, 1, 0.6313726, 0, 1,
-1.25017, -0.7804093, -1.750857, 1, 0.6352941, 0, 1,
-1.247692, 0.2750823, -1.31847, 1, 0.6431373, 0, 1,
-1.23836, 1.318089, -0.2699857, 1, 0.6470588, 0, 1,
-1.235073, 0.9254856, -0.2244514, 1, 0.654902, 0, 1,
-1.234987, 0.1427744, -0.1368122, 1, 0.6588235, 0, 1,
-1.225373, 2.413264, -0.4622829, 1, 0.6666667, 0, 1,
-1.223439, 0.6224862, -3.288976, 1, 0.6705883, 0, 1,
-1.221552, 1.365851, -1.263433, 1, 0.6784314, 0, 1,
-1.192356, -1.412117, -3.044109, 1, 0.682353, 0, 1,
-1.189164, -0.429404, -1.704055, 1, 0.6901961, 0, 1,
-1.189138, -0.1824578, -2.11835, 1, 0.6941177, 0, 1,
-1.182164, -0.003433094, -2.493648, 1, 0.7019608, 0, 1,
-1.177815, 0.4830903, -2.633167, 1, 0.7098039, 0, 1,
-1.176252, 0.6454659, 0.0729393, 1, 0.7137255, 0, 1,
-1.174878, 0.237645, -1.623145, 1, 0.7215686, 0, 1,
-1.173611, 0.5926546, -0.8988786, 1, 0.7254902, 0, 1,
-1.169304, -2.60143, -3.302233, 1, 0.7333333, 0, 1,
-1.155841, 1.869901, 0.2083103, 1, 0.7372549, 0, 1,
-1.155748, -1.032275, -0.9401666, 1, 0.7450981, 0, 1,
-1.144866, -0.07794388, -0.8193041, 1, 0.7490196, 0, 1,
-1.14317, -1.288461, -3.19711, 1, 0.7568628, 0, 1,
-1.134116, 0.35376, -2.8703, 1, 0.7607843, 0, 1,
-1.131569, 0.04300573, -2.974982, 1, 0.7686275, 0, 1,
-1.1308, 2.035934, 1.061661, 1, 0.772549, 0, 1,
-1.128736, 0.02926537, -3.074021, 1, 0.7803922, 0, 1,
-1.124465, 2.391191, -0.3693142, 1, 0.7843137, 0, 1,
-1.120727, -0.4868348, -1.614379, 1, 0.7921569, 0, 1,
-1.119747, 0.05699879, -0.2277104, 1, 0.7960784, 0, 1,
-1.111094, 0.6110194, -2.813909, 1, 0.8039216, 0, 1,
-1.108313, -0.9732263, -1.354314, 1, 0.8117647, 0, 1,
-1.102085, -1.28599, -3.352475, 1, 0.8156863, 0, 1,
-1.091465, 0.6895744, -0.2469196, 1, 0.8235294, 0, 1,
-1.091274, 1.408361, 0.4327245, 1, 0.827451, 0, 1,
-1.087383, 0.1575198, -1.22441, 1, 0.8352941, 0, 1,
-1.082726, -1.097276, -2.747895, 1, 0.8392157, 0, 1,
-1.078223, 1.046607, -0.055976, 1, 0.8470588, 0, 1,
-1.066294, -0.8610517, -1.506208, 1, 0.8509804, 0, 1,
-1.064077, 0.304733, -2.224831, 1, 0.8588235, 0, 1,
-1.062971, 0.1116458, -1.656016, 1, 0.8627451, 0, 1,
-1.058422, -0.4616762, -2.687744, 1, 0.8705882, 0, 1,
-1.054618, 1.844934, -0.4316728, 1, 0.8745098, 0, 1,
-1.05148, 2.30336, -0.2168699, 1, 0.8823529, 0, 1,
-1.050419, -0.8227952, -1.386288, 1, 0.8862745, 0, 1,
-1.048381, -1.103414, -2.830323, 1, 0.8941177, 0, 1,
-1.047876, -0.8907331, -2.254299, 1, 0.8980392, 0, 1,
-1.044587, -1.36963, -3.115572, 1, 0.9058824, 0, 1,
-1.044204, 0.5719203, 0.5618259, 1, 0.9137255, 0, 1,
-1.035639, -0.4445248, -1.891709, 1, 0.9176471, 0, 1,
-1.029119, -0.9951103, -1.692697, 1, 0.9254902, 0, 1,
-1.027221, 0.02637373, -1.829634, 1, 0.9294118, 0, 1,
-1.02667, 0.3476556, 0.1372222, 1, 0.9372549, 0, 1,
-1.022414, 0.9568066, 1.56614, 1, 0.9411765, 0, 1,
-1.021641, 1.557711, -0.3413414, 1, 0.9490196, 0, 1,
-1.020066, -0.2680748, -2.305686, 1, 0.9529412, 0, 1,
-1.019813, 0.7677242, -1.096383, 1, 0.9607843, 0, 1,
-1.012936, 1.325484, -0.8282115, 1, 0.9647059, 0, 1,
-1.011505, 1.744025, -1.623741, 1, 0.972549, 0, 1,
-1.010777, -0.4414395, -1.260014, 1, 0.9764706, 0, 1,
-1.009079, 0.1011615, -2.539908, 1, 0.9843137, 0, 1,
-1.008642, -0.4262381, -0.977282, 1, 0.9882353, 0, 1,
-1.005833, -1.418082, -1.877435, 1, 0.9960784, 0, 1,
-1.00399, 0.6009698, -0.4041536, 0.9960784, 1, 0, 1,
-1.001876, -0.5425797, -4.942357, 0.9921569, 1, 0, 1,
-1.001249, 0.6567358, -0.3311256, 0.9843137, 1, 0, 1,
-0.9966486, -0.2858819, -2.108953, 0.9803922, 1, 0, 1,
-0.9952589, -0.07774796, -1.876473, 0.972549, 1, 0, 1,
-0.9924557, 0.6938289, -1.570603, 0.9686275, 1, 0, 1,
-0.992256, 0.591962, -3.086765, 0.9607843, 1, 0, 1,
-0.991716, 0.2350238, -0.7601991, 0.9568627, 1, 0, 1,
-0.9916201, 1.632508, 0.414411, 0.9490196, 1, 0, 1,
-0.986056, 1.653386, -0.7219023, 0.945098, 1, 0, 1,
-0.9852227, 1.040954, -0.6026495, 0.9372549, 1, 0, 1,
-0.9825061, -0.02814306, -1.178134, 0.9333333, 1, 0, 1,
-0.9801113, 3.721328, -1.866981, 0.9254902, 1, 0, 1,
-0.9772905, 0.6425549, -0.2690528, 0.9215686, 1, 0, 1,
-0.9739084, 0.6417298, -2.299727, 0.9137255, 1, 0, 1,
-0.9693705, -1.734224, -2.11465, 0.9098039, 1, 0, 1,
-0.960853, -0.08182648, -0.33735, 0.9019608, 1, 0, 1,
-0.9588373, 1.513426, -1.500121, 0.8941177, 1, 0, 1,
-0.9565709, -0.8443216, -3.567729, 0.8901961, 1, 0, 1,
-0.9506051, -1.179035, -4.819933, 0.8823529, 1, 0, 1,
-0.9474787, 0.2323452, -1.224106, 0.8784314, 1, 0, 1,
-0.9465277, 0.7147784, -3.051059, 0.8705882, 1, 0, 1,
-0.9403633, 0.5500777, 0.5320624, 0.8666667, 1, 0, 1,
-0.9367433, -0.3664841, -2.115024, 0.8588235, 1, 0, 1,
-0.9335182, -0.03498933, -0.8298375, 0.854902, 1, 0, 1,
-0.9306272, -0.1123827, -2.266659, 0.8470588, 1, 0, 1,
-0.9284748, 1.000386, -0.3460621, 0.8431373, 1, 0, 1,
-0.9280536, 1.242907, 1.01896, 0.8352941, 1, 0, 1,
-0.9268311, 0.3570434, -2.046373, 0.8313726, 1, 0, 1,
-0.9217128, -0.5297, -1.0464, 0.8235294, 1, 0, 1,
-0.9140885, 1.226192, -1.489927, 0.8196079, 1, 0, 1,
-0.9100485, -0.175459, -3.199838, 0.8117647, 1, 0, 1,
-0.9025033, -0.9247839, -2.872746, 0.8078431, 1, 0, 1,
-0.8971739, -0.7835363, -1.617255, 0.8, 1, 0, 1,
-0.8966289, 0.1832701, -2.638352, 0.7921569, 1, 0, 1,
-0.8827049, -1.286472, -2.777823, 0.7882353, 1, 0, 1,
-0.8791743, 0.5896935, -2.431154, 0.7803922, 1, 0, 1,
-0.8786583, -1.052482, -1.790902, 0.7764706, 1, 0, 1,
-0.8747844, 0.2390748, -2.002745, 0.7686275, 1, 0, 1,
-0.87153, -0.761506, -3.116477, 0.7647059, 1, 0, 1,
-0.8700091, 1.133475, -0.8594939, 0.7568628, 1, 0, 1,
-0.8693112, -1.42704, -0.8738739, 0.7529412, 1, 0, 1,
-0.8683755, -0.05868245, -0.5485429, 0.7450981, 1, 0, 1,
-0.8678433, 0.3611457, -2.726862, 0.7411765, 1, 0, 1,
-0.8662789, 0.6159009, -1.001419, 0.7333333, 1, 0, 1,
-0.8634544, 2.01286, -0.7189568, 0.7294118, 1, 0, 1,
-0.8617663, -0.8899888, -3.329443, 0.7215686, 1, 0, 1,
-0.8605427, -1.470224, -1.694297, 0.7176471, 1, 0, 1,
-0.8591877, 2.2255, 0.8386292, 0.7098039, 1, 0, 1,
-0.8551731, -1.170239, -2.202151, 0.7058824, 1, 0, 1,
-0.8537813, -0.6596777, -0.9540676, 0.6980392, 1, 0, 1,
-0.8527703, 1.163022, -0.2283663, 0.6901961, 1, 0, 1,
-0.8497151, -0.5331501, -2.256113, 0.6862745, 1, 0, 1,
-0.8492618, 1.116619, -0.4946318, 0.6784314, 1, 0, 1,
-0.8467778, -0.2048186, -0.4629358, 0.6745098, 1, 0, 1,
-0.8458436, 1.542438, -1.433501, 0.6666667, 1, 0, 1,
-0.8372251, 0.4899606, -1.234554, 0.6627451, 1, 0, 1,
-0.8332445, -0.3996337, -2.662225, 0.654902, 1, 0, 1,
-0.8275784, -1.667228, -5.724416, 0.6509804, 1, 0, 1,
-0.8241701, -1.398015, -2.714122, 0.6431373, 1, 0, 1,
-0.8225753, 0.4630785, -1.197162, 0.6392157, 1, 0, 1,
-0.8209183, -0.5680327, -2.321483, 0.6313726, 1, 0, 1,
-0.8205545, 0.4371547, -1.099649, 0.627451, 1, 0, 1,
-0.8144445, 0.799789, -1.428174, 0.6196079, 1, 0, 1,
-0.7995339, -0.3106343, -2.778024, 0.6156863, 1, 0, 1,
-0.7977384, -1.036031, -2.424265, 0.6078432, 1, 0, 1,
-0.7917044, 1.083676, -0.1694179, 0.6039216, 1, 0, 1,
-0.7914568, 1.334665, 0.6574743, 0.5960785, 1, 0, 1,
-0.7894755, 0.2868785, -2.839303, 0.5882353, 1, 0, 1,
-0.7883474, -0.3401618, -2.051744, 0.5843138, 1, 0, 1,
-0.7878151, 0.4017504, -2.059752, 0.5764706, 1, 0, 1,
-0.783799, -0.429375, -2.130351, 0.572549, 1, 0, 1,
-0.7795205, 1.856512, -1.721943, 0.5647059, 1, 0, 1,
-0.7724236, -0.6056261, -3.041654, 0.5607843, 1, 0, 1,
-0.7669382, 0.6991413, -0.4503545, 0.5529412, 1, 0, 1,
-0.7653471, 0.004503929, -1.530644, 0.5490196, 1, 0, 1,
-0.764622, 1.234809, 1.366096, 0.5411765, 1, 0, 1,
-0.7642713, 0.9019807, -0.637886, 0.5372549, 1, 0, 1,
-0.7633683, -2.210834, -3.038444, 0.5294118, 1, 0, 1,
-0.763337, -0.2396747, -0.9991063, 0.5254902, 1, 0, 1,
-0.7626023, -1.385931, -2.321667, 0.5176471, 1, 0, 1,
-0.7619982, 0.5582298, 0.04777804, 0.5137255, 1, 0, 1,
-0.7585555, 0.6238563, 0.2658555, 0.5058824, 1, 0, 1,
-0.7458433, 0.1738394, -0.8396541, 0.5019608, 1, 0, 1,
-0.7407033, -0.6432779, -2.906701, 0.4941176, 1, 0, 1,
-0.7346253, -1.272603, -2.210692, 0.4862745, 1, 0, 1,
-0.7341506, -0.5504003, -4.047501, 0.4823529, 1, 0, 1,
-0.732899, -1.850025, -2.702272, 0.4745098, 1, 0, 1,
-0.7318395, 0.7028118, 0.1093852, 0.4705882, 1, 0, 1,
-0.7282892, 1.688911, 0.3380985, 0.4627451, 1, 0, 1,
-0.7255324, -0.2049713, -2.552834, 0.4588235, 1, 0, 1,
-0.71986, -0.6240755, -0.5670089, 0.4509804, 1, 0, 1,
-0.7195366, -0.7390893, -4.01404, 0.4470588, 1, 0, 1,
-0.7187699, -0.5954636, -1.25392, 0.4392157, 1, 0, 1,
-0.7170641, 0.3089497, -3.910154, 0.4352941, 1, 0, 1,
-0.7147644, -0.2916063, -1.255105, 0.427451, 1, 0, 1,
-0.7113818, -0.08034594, -2.251641, 0.4235294, 1, 0, 1,
-0.7035556, 1.009558, -1.241752, 0.4156863, 1, 0, 1,
-0.7009869, -1.147433, -3.720731, 0.4117647, 1, 0, 1,
-0.7004829, 0.4416633, -3.559322, 0.4039216, 1, 0, 1,
-0.6980756, 1.47333, -0.1658337, 0.3960784, 1, 0, 1,
-0.6957686, 0.2240145, -0.3718538, 0.3921569, 1, 0, 1,
-0.6946852, 1.0584, -1.945175, 0.3843137, 1, 0, 1,
-0.6931273, -1.031668, -1.799585, 0.3803922, 1, 0, 1,
-0.6866544, -0.9477385, -3.420742, 0.372549, 1, 0, 1,
-0.6763789, -0.2481972, -2.460539, 0.3686275, 1, 0, 1,
-0.6736942, -0.002218788, -0.3130317, 0.3607843, 1, 0, 1,
-0.6683846, -2.574675, -3.011057, 0.3568628, 1, 0, 1,
-0.6647862, 1.094128, 0.4949135, 0.3490196, 1, 0, 1,
-0.6645152, 0.04168653, -1.927167, 0.345098, 1, 0, 1,
-0.6614748, 0.3797081, -0.9981801, 0.3372549, 1, 0, 1,
-0.6614094, 0.09931528, -1.560178, 0.3333333, 1, 0, 1,
-0.661375, 1.12691, -0.02276028, 0.3254902, 1, 0, 1,
-0.6601308, -1.476877, -3.405649, 0.3215686, 1, 0, 1,
-0.6597475, -2.01923, -2.59868, 0.3137255, 1, 0, 1,
-0.6533423, -0.3514741, -0.5995091, 0.3098039, 1, 0, 1,
-0.6401926, -0.4811668, -1.698457, 0.3019608, 1, 0, 1,
-0.6388555, 0.0859371, -1.026692, 0.2941177, 1, 0, 1,
-0.6337667, 1.930266, -1.024971, 0.2901961, 1, 0, 1,
-0.6173654, -0.01258049, -0.841699, 0.282353, 1, 0, 1,
-0.6164508, 0.2856343, -0.3232944, 0.2784314, 1, 0, 1,
-0.6157886, 2.785216, -0.08403894, 0.2705882, 1, 0, 1,
-0.6084398, -0.3417508, -1.807588, 0.2666667, 1, 0, 1,
-0.6078718, -1.036787, -2.911912, 0.2588235, 1, 0, 1,
-0.6041599, 1.30791, 0.5609608, 0.254902, 1, 0, 1,
-0.6033224, 0.3706247, -0.9786594, 0.2470588, 1, 0, 1,
-0.6008167, 2.556591, -0.1468998, 0.2431373, 1, 0, 1,
-0.5994903, -1.7678, -0.2143612, 0.2352941, 1, 0, 1,
-0.5928633, -1.03587, -2.380829, 0.2313726, 1, 0, 1,
-0.5889865, 0.7690266, -0.3545852, 0.2235294, 1, 0, 1,
-0.5883207, 2.557526, 0.8129133, 0.2196078, 1, 0, 1,
-0.5865784, 1.890196, -0.5362, 0.2117647, 1, 0, 1,
-0.584508, -0.5333146, -3.155997, 0.2078431, 1, 0, 1,
-0.5834678, 1.379319, -0.3379291, 0.2, 1, 0, 1,
-0.5822189, 0.2606378, -1.232613, 0.1921569, 1, 0, 1,
-0.5682976, -0.2008224, -1.595049, 0.1882353, 1, 0, 1,
-0.5673439, -1.592677, -2.093975, 0.1803922, 1, 0, 1,
-0.5668927, -1.884077, -1.919487, 0.1764706, 1, 0, 1,
-0.561851, -0.9096184, -1.557869, 0.1686275, 1, 0, 1,
-0.560315, -0.137762, -1.558488, 0.1647059, 1, 0, 1,
-0.5554723, -1.170641, -2.233733, 0.1568628, 1, 0, 1,
-0.5547848, 0.2900186, -0.8401849, 0.1529412, 1, 0, 1,
-0.5542815, 0.3353994, -0.9889138, 0.145098, 1, 0, 1,
-0.5528646, 0.8641146, -0.1318813, 0.1411765, 1, 0, 1,
-0.5527361, 0.6144166, 1.401086, 0.1333333, 1, 0, 1,
-0.5483538, -1.121415, -2.473185, 0.1294118, 1, 0, 1,
-0.5478277, -0.4068283, -0.6531466, 0.1215686, 1, 0, 1,
-0.5462041, -1.086393, -2.951842, 0.1176471, 1, 0, 1,
-0.5413262, -1.420956, -2.080683, 0.1098039, 1, 0, 1,
-0.5301723, 0.1002398, -1.024723, 0.1058824, 1, 0, 1,
-0.5297515, -0.7292367, -1.152792, 0.09803922, 1, 0, 1,
-0.5191262, 0.8180697, 0.799345, 0.09019608, 1, 0, 1,
-0.5177137, -0.6638977, -3.603169, 0.08627451, 1, 0, 1,
-0.5150583, 0.8856168, 0.1109496, 0.07843138, 1, 0, 1,
-0.5141704, 2.103152, -1.196465, 0.07450981, 1, 0, 1,
-0.5132657, 0.2047232, -1.730095, 0.06666667, 1, 0, 1,
-0.5115228, -1.148228, -3.003793, 0.0627451, 1, 0, 1,
-0.5078987, 0.407836, -1.565525, 0.05490196, 1, 0, 1,
-0.5056173, 0.972909, -1.422032, 0.05098039, 1, 0, 1,
-0.5052632, -0.05861406, -2.037736, 0.04313726, 1, 0, 1,
-0.5046515, -0.8387414, -1.881945, 0.03921569, 1, 0, 1,
-0.503557, 0.5238482, -1.037913, 0.03137255, 1, 0, 1,
-0.5020556, -0.4278377, -2.706249, 0.02745098, 1, 0, 1,
-0.489641, -0.1561337, -0.3565171, 0.01960784, 1, 0, 1,
-0.4892562, 1.552942, -0.4281032, 0.01568628, 1, 0, 1,
-0.4794888, -0.2734936, -3.074608, 0.007843138, 1, 0, 1,
-0.4705644, -0.1967451, -2.280478, 0.003921569, 1, 0, 1,
-0.4601725, -1.965758, -4.45286, 0, 1, 0.003921569, 1,
-0.4546714, 0.4230596, -1.138247, 0, 1, 0.01176471, 1,
-0.4529496, -0.3845258, -3.015342, 0, 1, 0.01568628, 1,
-0.4507802, -1.541322, -1.806442, 0, 1, 0.02352941, 1,
-0.4475024, 0.5765529, -1.064579, 0, 1, 0.02745098, 1,
-0.4473453, -1.690753, -3.405911, 0, 1, 0.03529412, 1,
-0.4453492, 0.8626849, 0.1892908, 0, 1, 0.03921569, 1,
-0.4435204, -0.1186334, -0.4298984, 0, 1, 0.04705882, 1,
-0.432216, -0.00377651, -1.985389, 0, 1, 0.05098039, 1,
-0.4275724, -0.433879, -4.055542, 0, 1, 0.05882353, 1,
-0.4271427, -0.9850692, -3.403064, 0, 1, 0.0627451, 1,
-0.4260018, 0.9360803, -1.607706, 0, 1, 0.07058824, 1,
-0.4195135, 1.720675, 0.4505968, 0, 1, 0.07450981, 1,
-0.41659, -0.9207277, -1.810301, 0, 1, 0.08235294, 1,
-0.4149951, -0.8254488, -3.85066, 0, 1, 0.08627451, 1,
-0.4144293, 0.3481065, -1.944272, 0, 1, 0.09411765, 1,
-0.4143401, -0.3534584, -2.662326, 0, 1, 0.1019608, 1,
-0.4131326, -1.705309, -5.676872, 0, 1, 0.1058824, 1,
-0.4088529, 1.332147, 0.3478702, 0, 1, 0.1137255, 1,
-0.4064768, 0.05803663, -1.46164, 0, 1, 0.1176471, 1,
-0.4028118, 0.06031021, -1.371735, 0, 1, 0.1254902, 1,
-0.3985066, 0.22333, -3.499246, 0, 1, 0.1294118, 1,
-0.3882846, 0.823851, 2.331721, 0, 1, 0.1372549, 1,
-0.3869683, 1.248426, 0.9943873, 0, 1, 0.1411765, 1,
-0.3854698, -1.988217, -2.419501, 0, 1, 0.1490196, 1,
-0.3842072, 0.2633116, 0.3724823, 0, 1, 0.1529412, 1,
-0.384177, 0.07575433, -0.8546032, 0, 1, 0.1607843, 1,
-0.3731584, -0.6750414, -1.125664, 0, 1, 0.1647059, 1,
-0.3710034, -0.6274034, -2.569315, 0, 1, 0.172549, 1,
-0.3705411, -0.858753, -2.32737, 0, 1, 0.1764706, 1,
-0.3674009, -0.6147673, -1.770387, 0, 1, 0.1843137, 1,
-0.3659424, 0.8870667, -1.335618, 0, 1, 0.1882353, 1,
-0.3532057, -0.939263, -3.45305, 0, 1, 0.1960784, 1,
-0.3481687, -0.41461, -2.820853, 0, 1, 0.2039216, 1,
-0.3460276, 0.07811071, -1.718419, 0, 1, 0.2078431, 1,
-0.3387503, 0.5106733, -0.8549341, 0, 1, 0.2156863, 1,
-0.3345802, 0.3386015, -1.703289, 0, 1, 0.2196078, 1,
-0.3316836, -0.6423005, -1.362719, 0, 1, 0.227451, 1,
-0.3301953, -0.2996142, -3.078061, 0, 1, 0.2313726, 1,
-0.329746, -0.246186, -1.067847, 0, 1, 0.2392157, 1,
-0.324655, -1.157574, -1.97375, 0, 1, 0.2431373, 1,
-0.3231092, -0.5978729, -2.215099, 0, 1, 0.2509804, 1,
-0.3212605, 0.5670595, -0.0166764, 0, 1, 0.254902, 1,
-0.320473, -0.3196605, -3.006837, 0, 1, 0.2627451, 1,
-0.3197159, 0.7969475, -0.4694133, 0, 1, 0.2666667, 1,
-0.3191539, 0.1326098, -0.8810683, 0, 1, 0.2745098, 1,
-0.3180304, -0.4038447, -3.163714, 0, 1, 0.2784314, 1,
-0.3076086, 0.8584321, -0.296906, 0, 1, 0.2862745, 1,
-0.3059781, -0.2139845, -2.876598, 0, 1, 0.2901961, 1,
-0.3015586, -1.45248, -3.269518, 0, 1, 0.2980392, 1,
-0.2973894, 0.3545211, 0.5058135, 0, 1, 0.3058824, 1,
-0.2958399, -0.9581493, -1.124884, 0, 1, 0.3098039, 1,
-0.2884456, 0.9502091, -0.5651411, 0, 1, 0.3176471, 1,
-0.2881626, -0.7159952, -1.995049, 0, 1, 0.3215686, 1,
-0.2867562, -0.6462258, -3.754326, 0, 1, 0.3294118, 1,
-0.2855848, 0.4067658, 1.665014, 0, 1, 0.3333333, 1,
-0.2850059, -0.2100402, -1.456581, 0, 1, 0.3411765, 1,
-0.2843103, -2.28942, -3.611434, 0, 1, 0.345098, 1,
-0.2787063, -0.2972012, -1.836304, 0, 1, 0.3529412, 1,
-0.2753782, -0.2800313, -1.078378, 0, 1, 0.3568628, 1,
-0.2749776, 1.69947, 1.071156, 0, 1, 0.3647059, 1,
-0.2730591, 2.965934, 1.085863, 0, 1, 0.3686275, 1,
-0.2728424, 0.9404871, -1.006529, 0, 1, 0.3764706, 1,
-0.2727306, -0.6998723, -3.250633, 0, 1, 0.3803922, 1,
-0.267921, 3.490075, 0.8077211, 0, 1, 0.3882353, 1,
-0.267864, 0.4367295, -0.3558333, 0, 1, 0.3921569, 1,
-0.2662444, -0.7144181, -3.355878, 0, 1, 0.4, 1,
-0.2614525, -0.4798071, -1.527094, 0, 1, 0.4078431, 1,
-0.260494, -0.3655949, -0.9807561, 0, 1, 0.4117647, 1,
-0.2589812, -1.85413, -2.110949, 0, 1, 0.4196078, 1,
-0.2589686, 0.03926376, -0.4280086, 0, 1, 0.4235294, 1,
-0.2560436, 0.3403658, -0.133182, 0, 1, 0.4313726, 1,
-0.2559682, 0.5627695, -2.776595, 0, 1, 0.4352941, 1,
-0.2487783, -0.8609155, -2.59642, 0, 1, 0.4431373, 1,
-0.244977, 0.2811896, -2.501217, 0, 1, 0.4470588, 1,
-0.2441862, -0.5084512, -2.037002, 0, 1, 0.454902, 1,
-0.2403541, 0.9511243, 1.316348, 0, 1, 0.4588235, 1,
-0.2373789, -0.8743401, -2.815797, 0, 1, 0.4666667, 1,
-0.233593, 0.09711145, 0.2828103, 0, 1, 0.4705882, 1,
-0.2330548, 1.026685, 0.2902554, 0, 1, 0.4784314, 1,
-0.2276568, 1.250148, -0.1457126, 0, 1, 0.4823529, 1,
-0.2265007, -0.8067882, -1.985428, 0, 1, 0.4901961, 1,
-0.2223682, -1.00192, -3.897025, 0, 1, 0.4941176, 1,
-0.2213556, 0.04073572, 0.2348156, 0, 1, 0.5019608, 1,
-0.2211903, -0.8241459, -2.284476, 0, 1, 0.509804, 1,
-0.2179765, 0.2793699, -1.420721, 0, 1, 0.5137255, 1,
-0.21644, 0.5211062, -1.388714, 0, 1, 0.5215687, 1,
-0.2117938, -2.266361, -2.740647, 0, 1, 0.5254902, 1,
-0.211674, -1.068978, -3.417988, 0, 1, 0.5333334, 1,
-0.2090781, -0.5849364, -1.809868, 0, 1, 0.5372549, 1,
-0.2079999, 0.5298347, 0.1028617, 0, 1, 0.5450981, 1,
-0.2029194, -0.5435151, -1.212726, 0, 1, 0.5490196, 1,
-0.2018375, 0.4496061, 1.492884, 0, 1, 0.5568628, 1,
-0.2013222, 0.8163115, -0.6976913, 0, 1, 0.5607843, 1,
-0.199524, -0.1762845, -2.537576, 0, 1, 0.5686275, 1,
-0.1993658, 0.7580728, -0.1655011, 0, 1, 0.572549, 1,
-0.1979578, -0.07234505, -0.952067, 0, 1, 0.5803922, 1,
-0.1970468, 0.2601136, -0.8941352, 0, 1, 0.5843138, 1,
-0.1929705, 0.4437596, 0.6464351, 0, 1, 0.5921569, 1,
-0.1852217, -0.9217873, -3.519524, 0, 1, 0.5960785, 1,
-0.1842367, -2.020345, -3.23507, 0, 1, 0.6039216, 1,
-0.1839274, -0.1777381, -2.842129, 0, 1, 0.6117647, 1,
-0.1818054, -1.098622, -2.549544, 0, 1, 0.6156863, 1,
-0.1789117, -0.3531238, -2.723992, 0, 1, 0.6235294, 1,
-0.1789071, 0.06908026, -1.25427, 0, 1, 0.627451, 1,
-0.1774226, -0.5260549, -2.290999, 0, 1, 0.6352941, 1,
-0.1747924, -0.3814819, -0.4753773, 0, 1, 0.6392157, 1,
-0.1745305, 0.4675839, -0.8637957, 0, 1, 0.6470588, 1,
-0.1714042, 0.7624474, 0.9830408, 0, 1, 0.6509804, 1,
-0.1698305, -1.31343, -3.409941, 0, 1, 0.6588235, 1,
-0.1690283, 2.409402, 0.7607049, 0, 1, 0.6627451, 1,
-0.1643454, -0.3952602, -1.93426, 0, 1, 0.6705883, 1,
-0.161175, 0.5509387, -0.1138708, 0, 1, 0.6745098, 1,
-0.1606739, 1.008198, 0.02066659, 0, 1, 0.682353, 1,
-0.1570082, 0.5053345, -1.296017, 0, 1, 0.6862745, 1,
-0.1519941, -0.3906149, -2.736327, 0, 1, 0.6941177, 1,
-0.1510442, 1.37109, -0.8678251, 0, 1, 0.7019608, 1,
-0.15041, 0.9440246, -0.2273127, 0, 1, 0.7058824, 1,
-0.1498784, -0.1534301, -4.267974, 0, 1, 0.7137255, 1,
-0.1458769, -1.644639, -2.648112, 0, 1, 0.7176471, 1,
-0.145576, -1.67191, -2.860679, 0, 1, 0.7254902, 1,
-0.1455286, 0.699285, -2.858305, 0, 1, 0.7294118, 1,
-0.1423532, 0.02179789, -1.433252, 0, 1, 0.7372549, 1,
-0.1408186, -1.256598, -2.786844, 0, 1, 0.7411765, 1,
-0.1395729, 1.154337, -0.8533194, 0, 1, 0.7490196, 1,
-0.1362473, -0.9547983, -4.971052, 0, 1, 0.7529412, 1,
-0.1347619, -0.248843, -4.025926, 0, 1, 0.7607843, 1,
-0.1344043, -0.2197668, -1.271971, 0, 1, 0.7647059, 1,
-0.1340688, -0.6289401, 0.1425918, 0, 1, 0.772549, 1,
-0.1308331, -1.06769, -3.855273, 0, 1, 0.7764706, 1,
-0.1259413, -1.99849, -3.906258, 0, 1, 0.7843137, 1,
-0.1247156, -0.1398352, -3.059446, 0, 1, 0.7882353, 1,
-0.1233607, 0.7819002, 1.008961, 0, 1, 0.7960784, 1,
-0.1204437, -0.3919792, -2.963579, 0, 1, 0.8039216, 1,
-0.1134648, 0.6046878, -2.288849, 0, 1, 0.8078431, 1,
-0.1114815, 1.886067, 0.7586815, 0, 1, 0.8156863, 1,
-0.1101274, -0.119376, -0.9460919, 0, 1, 0.8196079, 1,
-0.1092661, 1.285744, 0.2305305, 0, 1, 0.827451, 1,
-0.1090822, -0.1081444, -2.242333, 0, 1, 0.8313726, 1,
-0.1068279, -0.755688, -2.379684, 0, 1, 0.8392157, 1,
-0.1063438, 0.1343836, 0.1133835, 0, 1, 0.8431373, 1,
-0.1055719, -0.4635167, -2.867446, 0, 1, 0.8509804, 1,
-0.1034497, 0.2652178, 0.4048115, 0, 1, 0.854902, 1,
-0.1025814, 0.02326182, 0.3417425, 0, 1, 0.8627451, 1,
-0.1007715, -2.569642, -4.232186, 0, 1, 0.8666667, 1,
-0.09939857, -0.3502746, -3.742017, 0, 1, 0.8745098, 1,
-0.09929679, 0.3406579, 1.674049, 0, 1, 0.8784314, 1,
-0.09822984, -0.4714664, -4.055142, 0, 1, 0.8862745, 1,
-0.09768304, -0.4403507, -3.736667, 0, 1, 0.8901961, 1,
-0.09578705, 0.9490672, -0.3063791, 0, 1, 0.8980392, 1,
-0.09166498, 0.1431782, -1.502337, 0, 1, 0.9058824, 1,
-0.08779645, 0.394953, -0.4198773, 0, 1, 0.9098039, 1,
-0.08335689, 1.916628, -1.076555, 0, 1, 0.9176471, 1,
-0.0820963, 0.4314116, -1.372673, 0, 1, 0.9215686, 1,
-0.08162607, -0.476796, -2.204243, 0, 1, 0.9294118, 1,
-0.07997815, -0.3131806, -3.163546, 0, 1, 0.9333333, 1,
-0.07937454, 1.512107, 0.5456998, 0, 1, 0.9411765, 1,
-0.07597791, -0.6524082, -3.783024, 0, 1, 0.945098, 1,
-0.06999451, 0.4258892, 0.9928115, 0, 1, 0.9529412, 1,
-0.06173764, 0.3374855, 1.530844, 0, 1, 0.9568627, 1,
-0.0593243, -0.09017613, -1.528543, 0, 1, 0.9647059, 1,
-0.05913375, 0.7342796, 0.02471893, 0, 1, 0.9686275, 1,
-0.05671966, -0.1291058, -2.889051, 0, 1, 0.9764706, 1,
-0.0527863, 0.05555721, -1.667854, 0, 1, 0.9803922, 1,
-0.05219706, -0.272461, -2.182958, 0, 1, 0.9882353, 1,
-0.05046642, -0.2824146, -4.506312, 0, 1, 0.9921569, 1,
-0.04820047, 0.2686653, 2.341639, 0, 1, 1, 1,
-0.04233169, 0.1683875, -1.302768, 0, 0.9921569, 1, 1,
-0.04007188, 1.085205, 1.919832, 0, 0.9882353, 1, 1,
-0.03627469, -0.9501914, -2.028568, 0, 0.9803922, 1, 1,
-0.03202888, 0.7519912, -0.6680031, 0, 0.9764706, 1, 1,
-0.03161416, 0.05292449, 0.1959213, 0, 0.9686275, 1, 1,
-0.03001136, -0.7114491, -4.1122, 0, 0.9647059, 1, 1,
-0.0299529, -1.911799, -2.86477, 0, 0.9568627, 1, 1,
-0.029213, 0.5549876, -1.267316, 0, 0.9529412, 1, 1,
-0.02637247, -0.8673481, -1.964355, 0, 0.945098, 1, 1,
-0.02356848, -0.1888569, -2.915661, 0, 0.9411765, 1, 1,
-0.02154736, 2.706719, 0.639511, 0, 0.9333333, 1, 1,
-0.02133391, 0.4034649, -0.6942146, 0, 0.9294118, 1, 1,
-0.01534939, -1.61286, -3.43462, 0, 0.9215686, 1, 1,
-0.01459418, -1.834131, -2.55083, 0, 0.9176471, 1, 1,
-0.01319662, -0.2567253, -3.90756, 0, 0.9098039, 1, 1,
-0.01247935, 0.7019675, 0.07645128, 0, 0.9058824, 1, 1,
-0.0117108, -0.4646406, -4.339088, 0, 0.8980392, 1, 1,
-0.008194606, 0.1393458, 0.2867008, 0, 0.8901961, 1, 1,
-0.005842642, -2.695266, -2.898103, 0, 0.8862745, 1, 1,
0.006502252, 0.9243219, -1.1039, 0, 0.8784314, 1, 1,
0.009186282, -0.4878815, 2.903837, 0, 0.8745098, 1, 1,
0.009973483, 0.431448, 0.7724738, 0, 0.8666667, 1, 1,
0.01139758, -1.492709, 2.732894, 0, 0.8627451, 1, 1,
0.01524905, 0.6794301, 0.7166347, 0, 0.854902, 1, 1,
0.02288269, -1.834268, 2.865187, 0, 0.8509804, 1, 1,
0.02343318, 0.8338246, -1.165795, 0, 0.8431373, 1, 1,
0.02600343, -0.7617848, 1.833115, 0, 0.8392157, 1, 1,
0.02944062, 6.070817e-05, 3.150179, 0, 0.8313726, 1, 1,
0.03102717, -1.472717, 2.265944, 0, 0.827451, 1, 1,
0.03377594, 0.007244794, 1.499345, 0, 0.8196079, 1, 1,
0.03396364, 2.147839, -0.4061294, 0, 0.8156863, 1, 1,
0.03435541, -0.3635167, 2.428793, 0, 0.8078431, 1, 1,
0.03547667, 0.4200953, 1.253818, 0, 0.8039216, 1, 1,
0.03634549, -0.7641467, 3.887165, 0, 0.7960784, 1, 1,
0.03797832, 0.4494573, -0.007730468, 0, 0.7882353, 1, 1,
0.03895167, -0.5097147, 3.28957, 0, 0.7843137, 1, 1,
0.04853642, -1.536074, 2.220466, 0, 0.7764706, 1, 1,
0.05369079, -0.5761519, 3.288152, 0, 0.772549, 1, 1,
0.0547681, 0.4136852, 0.318332, 0, 0.7647059, 1, 1,
0.05649495, 0.385293, -0.5484776, 0, 0.7607843, 1, 1,
0.06442817, -1.173593, 4.051385, 0, 0.7529412, 1, 1,
0.07090785, -0.703263, 2.987707, 0, 0.7490196, 1, 1,
0.07217714, -0.0840301, 2.380876, 0, 0.7411765, 1, 1,
0.07507188, 2.068847, -1.291569, 0, 0.7372549, 1, 1,
0.08131785, 2.185901, 1.709372, 0, 0.7294118, 1, 1,
0.08269892, -0.80347, 5.602585, 0, 0.7254902, 1, 1,
0.086419, 0.6620048, 0.2722433, 0, 0.7176471, 1, 1,
0.09470793, -1.815793, 2.011061, 0, 0.7137255, 1, 1,
0.09471852, 0.3648378, -0.2723153, 0, 0.7058824, 1, 1,
0.09491296, -0.824278, 2.641126, 0, 0.6980392, 1, 1,
0.09560272, 0.2681735, 0.1487649, 0, 0.6941177, 1, 1,
0.09631757, -1.263735, 4.737547, 0, 0.6862745, 1, 1,
0.09732508, -0.2358077, 2.561758, 0, 0.682353, 1, 1,
0.1023194, 0.2597823, -0.4050929, 0, 0.6745098, 1, 1,
0.1032721, -0.4943856, 2.786753, 0, 0.6705883, 1, 1,
0.1056043, 0.8105775, 0.1555169, 0, 0.6627451, 1, 1,
0.1060873, -0.1161066, 3.919485, 0, 0.6588235, 1, 1,
0.1080148, -0.2894207, 2.834395, 0, 0.6509804, 1, 1,
0.1189461, -0.6070579, 2.704075, 0, 0.6470588, 1, 1,
0.1258184, -0.08125475, 2.094684, 0, 0.6392157, 1, 1,
0.1289914, -0.1889744, 3.000277, 0, 0.6352941, 1, 1,
0.1304061, 0.8242714, -1.519383, 0, 0.627451, 1, 1,
0.1309828, 0.5588079, -0.2419787, 0, 0.6235294, 1, 1,
0.1313431, -0.6827772, 1.944656, 0, 0.6156863, 1, 1,
0.135399, -0.4351607, 1.470764, 0, 0.6117647, 1, 1,
0.1354011, -0.6379222, 2.674392, 0, 0.6039216, 1, 1,
0.1362414, -0.0334104, 1.771879, 0, 0.5960785, 1, 1,
0.1374761, 0.7473495, 1.288647, 0, 0.5921569, 1, 1,
0.1397357, 1.252183, -1.02816, 0, 0.5843138, 1, 1,
0.1460595, -1.702474, 2.626027, 0, 0.5803922, 1, 1,
0.1486182, 1.041037, 0.2593207, 0, 0.572549, 1, 1,
0.14905, 0.3951482, 2.092392, 0, 0.5686275, 1, 1,
0.1495871, -1.870126, 2.112128, 0, 0.5607843, 1, 1,
0.1500262, -1.721812, 2.501856, 0, 0.5568628, 1, 1,
0.1542798, 0.9202073, -0.06435613, 0, 0.5490196, 1, 1,
0.1562715, -1.473274, 4.876797, 0, 0.5450981, 1, 1,
0.1563114, -0.375743, 0.7262614, 0, 0.5372549, 1, 1,
0.1577938, -0.5847318, 4.283128, 0, 0.5333334, 1, 1,
0.1599289, 0.230089, -0.6485669, 0, 0.5254902, 1, 1,
0.1620409, -1.713318, 2.951202, 0, 0.5215687, 1, 1,
0.1651833, 0.6256742, 0.5400655, 0, 0.5137255, 1, 1,
0.1666075, -0.05790189, 2.460514, 0, 0.509804, 1, 1,
0.1681888, 1.358906, 1.41478, 0, 0.5019608, 1, 1,
0.1691115, -0.8269464, 3.203153, 0, 0.4941176, 1, 1,
0.1718056, 0.04965015, 1.014716, 0, 0.4901961, 1, 1,
0.1741498, -1.382039, 3.632515, 0, 0.4823529, 1, 1,
0.1758611, 0.7077316, 0.3166151, 0, 0.4784314, 1, 1,
0.1765909, -0.4863889, 1.611679, 0, 0.4705882, 1, 1,
0.1769625, -1.238014, 2.56822, 0, 0.4666667, 1, 1,
0.179392, 0.789646, -1.08772, 0, 0.4588235, 1, 1,
0.1800261, -0.3451266, 0.864439, 0, 0.454902, 1, 1,
0.1818046, 0.0415595, 1.58669, 0, 0.4470588, 1, 1,
0.1855986, 1.463725, -1.343616, 0, 0.4431373, 1, 1,
0.1894466, 0.02807997, 1.482488, 0, 0.4352941, 1, 1,
0.1897864, -0.4003361, 3.148483, 0, 0.4313726, 1, 1,
0.1925936, 2.273914, 0.009060952, 0, 0.4235294, 1, 1,
0.1934065, -0.8727686, 1.938141, 0, 0.4196078, 1, 1,
0.1936412, -0.2004061, 0.6925954, 0, 0.4117647, 1, 1,
0.1940114, -1.228737, 1.711781, 0, 0.4078431, 1, 1,
0.1996688, 0.1672931, 0.3084313, 0, 0.4, 1, 1,
0.2013645, -1.932047, 2.954491, 0, 0.3921569, 1, 1,
0.2175952, -0.244419, 6.159824, 0, 0.3882353, 1, 1,
0.2258571, 1.371583, 1.27097, 0, 0.3803922, 1, 1,
0.2263821, 0.6506852, 1.059619, 0, 0.3764706, 1, 1,
0.2268753, -0.1881569, 2.309465, 0, 0.3686275, 1, 1,
0.233359, 0.4697913, 0.1898605, 0, 0.3647059, 1, 1,
0.2342457, -1.860846, 3.466754, 0, 0.3568628, 1, 1,
0.2352705, -1.931867, 2.424001, 0, 0.3529412, 1, 1,
0.2353275, -0.3585968, 3.457753, 0, 0.345098, 1, 1,
0.2378915, 0.588033, 1.000545, 0, 0.3411765, 1, 1,
0.2420944, 0.1036926, 1.030024, 0, 0.3333333, 1, 1,
0.2430777, 0.3808086, 0.8115658, 0, 0.3294118, 1, 1,
0.2493804, 1.218544, 0.3568598, 0, 0.3215686, 1, 1,
0.2510767, -1.173941, 4.030004, 0, 0.3176471, 1, 1,
0.251303, -0.4182009, 1.538194, 0, 0.3098039, 1, 1,
0.254119, -1.532672, 2.70408, 0, 0.3058824, 1, 1,
0.2599666, -1.194356, 1.263745, 0, 0.2980392, 1, 1,
0.2601421, 0.5267521, 1.631267, 0, 0.2901961, 1, 1,
0.2645365, 0.7326333, 2.920128, 0, 0.2862745, 1, 1,
0.2647106, -1.410337, 1.561195, 0, 0.2784314, 1, 1,
0.2707581, -0.7552866, 3.004848, 0, 0.2745098, 1, 1,
0.2734743, 1.043104, 0.09666099, 0, 0.2666667, 1, 1,
0.2811927, -0.8664711, 3.847758, 0, 0.2627451, 1, 1,
0.2814359, 0.0117543, 1.696235, 0, 0.254902, 1, 1,
0.283366, 1.009802, 1.051549, 0, 0.2509804, 1, 1,
0.2839237, 0.05375842, 0.9720681, 0, 0.2431373, 1, 1,
0.2882283, -0.8471109, 3.1881, 0, 0.2392157, 1, 1,
0.2902348, 2.24072, 2.589083, 0, 0.2313726, 1, 1,
0.2928033, 0.4583964, -0.7032176, 0, 0.227451, 1, 1,
0.2937054, -0.09480501, 2.614269, 0, 0.2196078, 1, 1,
0.2980832, 0.9343682, -0.5844271, 0, 0.2156863, 1, 1,
0.3029125, 1.572319, 1.295254, 0, 0.2078431, 1, 1,
0.3112483, 0.9787012, 0.8685533, 0, 0.2039216, 1, 1,
0.3129249, -0.7680559, 1.755161, 0, 0.1960784, 1, 1,
0.313768, 0.747452, 2.705352, 0, 0.1882353, 1, 1,
0.3216002, -0.09474403, 2.720657, 0, 0.1843137, 1, 1,
0.3256243, -0.00859551, 1.026105, 0, 0.1764706, 1, 1,
0.3292571, -1.208689, 3.459868, 0, 0.172549, 1, 1,
0.3327377, 1.446661, 0.5118854, 0, 0.1647059, 1, 1,
0.3327488, -0.2502312, 1.586745, 0, 0.1607843, 1, 1,
0.3348201, 0.4834875, -0.4680631, 0, 0.1529412, 1, 1,
0.3350753, 0.934978, 0.8611608, 0, 0.1490196, 1, 1,
0.3366814, 0.7782942, -1.609072, 0, 0.1411765, 1, 1,
0.3441543, -1.956289, 2.694168, 0, 0.1372549, 1, 1,
0.3541023, -1.155321, 2.789975, 0, 0.1294118, 1, 1,
0.3549626, 1.72102, 0.9769896, 0, 0.1254902, 1, 1,
0.3581372, 1.324186, -1.427975, 0, 0.1176471, 1, 1,
0.3582728, -0.6766404, 1.919724, 0, 0.1137255, 1, 1,
0.358628, -1.727572, 3.646043, 0, 0.1058824, 1, 1,
0.3652979, -1.870481, 1.506514, 0, 0.09803922, 1, 1,
0.3684976, 0.6100264, 0.4505446, 0, 0.09411765, 1, 1,
0.3715037, -0.5507465, 1.757982, 0, 0.08627451, 1, 1,
0.3721892, 0.4181348, 0.8236746, 0, 0.08235294, 1, 1,
0.3745621, 0.2031418, -0.3536947, 0, 0.07450981, 1, 1,
0.3784822, 0.8363271, 0.8107005, 0, 0.07058824, 1, 1,
0.3817627, -0.5694351, 2.674292, 0, 0.0627451, 1, 1,
0.3832751, -0.9819635, 3.287099, 0, 0.05882353, 1, 1,
0.3834598, -0.4435919, 3.27739, 0, 0.05098039, 1, 1,
0.3848838, 1.13597, 1.198782, 0, 0.04705882, 1, 1,
0.3868073, 0.04342822, 1.966217, 0, 0.03921569, 1, 1,
0.3883096, 1.279662, -0.8517318, 0, 0.03529412, 1, 1,
0.389466, -2.288242, 1.024091, 0, 0.02745098, 1, 1,
0.3921794, 0.7356699, -0.8453532, 0, 0.02352941, 1, 1,
0.3949177, 0.5464178, 0.5937361, 0, 0.01568628, 1, 1,
0.3953992, 0.7093409, -0.1057706, 0, 0.01176471, 1, 1,
0.3955639, 0.1440227, -0.6057507, 0, 0.003921569, 1, 1,
0.3964979, 0.04529966, 2.786803, 0.003921569, 0, 1, 1,
0.3980776, -0.02456969, 0.1131134, 0.007843138, 0, 1, 1,
0.4015112, 1.134234, -0.8707826, 0.01568628, 0, 1, 1,
0.4028591, -1.838303, 2.656588, 0.01960784, 0, 1, 1,
0.4037377, -0.9759361, 0.5680531, 0.02745098, 0, 1, 1,
0.4069563, -1.345237, 1.943003, 0.03137255, 0, 1, 1,
0.4133767, 0.5102996, 1.623725, 0.03921569, 0, 1, 1,
0.4155222, -0.7053282, 2.902538, 0.04313726, 0, 1, 1,
0.4182225, 0.005930428, 2.751548, 0.05098039, 0, 1, 1,
0.4235356, 1.94326, -0.416301, 0.05490196, 0, 1, 1,
0.4238881, -0.1709272, 0.8622485, 0.0627451, 0, 1, 1,
0.4315942, -0.3554071, 1.189006, 0.06666667, 0, 1, 1,
0.4464434, 0.4468927, 1.094352, 0.07450981, 0, 1, 1,
0.4532261, 0.4737009, -0.5542498, 0.07843138, 0, 1, 1,
0.4535699, 0.314806, 1.339687, 0.08627451, 0, 1, 1,
0.4572334, 0.3410046, 1.366872, 0.09019608, 0, 1, 1,
0.4607208, -0.3319206, 3.236346, 0.09803922, 0, 1, 1,
0.4616841, 1.843879, 0.4038553, 0.1058824, 0, 1, 1,
0.4643629, -0.1577082, 2.685683, 0.1098039, 0, 1, 1,
0.4655924, 0.7378305, 1.213789, 0.1176471, 0, 1, 1,
0.468796, -1.503403, 1.597431, 0.1215686, 0, 1, 1,
0.4695786, 0.9713011, -0.7305766, 0.1294118, 0, 1, 1,
0.4735153, 0.2430321, 2.166441, 0.1333333, 0, 1, 1,
0.4787519, -0.5128772, 2.086328, 0.1411765, 0, 1, 1,
0.4870766, 1.691261, 0.9939489, 0.145098, 0, 1, 1,
0.488022, -2.040824, 4.515037, 0.1529412, 0, 1, 1,
0.4882629, 1.683872, 1.467497, 0.1568628, 0, 1, 1,
0.490185, -1.358425, 2.987634, 0.1647059, 0, 1, 1,
0.492965, 0.5309507, -0.2900342, 0.1686275, 0, 1, 1,
0.4974541, 0.2903043, 1.457323, 0.1764706, 0, 1, 1,
0.5147783, -0.1518984, 0.5506483, 0.1803922, 0, 1, 1,
0.5176246, -1.919462, 4.442017, 0.1882353, 0, 1, 1,
0.5211985, 2.151728, 0.225714, 0.1921569, 0, 1, 1,
0.5229542, -0.2923229, 2.008981, 0.2, 0, 1, 1,
0.5251504, -0.6931636, 2.385259, 0.2078431, 0, 1, 1,
0.52622, -0.886572, 4.092477, 0.2117647, 0, 1, 1,
0.5376216, 0.528454, 0.6137376, 0.2196078, 0, 1, 1,
0.5424471, -0.4863057, 2.203967, 0.2235294, 0, 1, 1,
0.545066, 0.3605213, 0.1793629, 0.2313726, 0, 1, 1,
0.5519159, -0.5272755, 1.634975, 0.2352941, 0, 1, 1,
0.5523221, 0.4152683, 1.445066, 0.2431373, 0, 1, 1,
0.5560732, 0.2106856, 1.553555, 0.2470588, 0, 1, 1,
0.5572259, 0.9324316, 0.8902498, 0.254902, 0, 1, 1,
0.5573008, -1.592768, 2.634568, 0.2588235, 0, 1, 1,
0.5583026, -0.4057654, 2.517152, 0.2666667, 0, 1, 1,
0.5701345, 0.7219229, 1.67232, 0.2705882, 0, 1, 1,
0.5714688, 0.3550776, 1.66042, 0.2784314, 0, 1, 1,
0.5720744, -0.06696915, 0.4398117, 0.282353, 0, 1, 1,
0.5775017, 0.8886137, -0.5871832, 0.2901961, 0, 1, 1,
0.5775641, 0.5352951, 0.5609039, 0.2941177, 0, 1, 1,
0.5776954, 0.4415568, 1.25234, 0.3019608, 0, 1, 1,
0.5779236, -0.8353457, 1.09566, 0.3098039, 0, 1, 1,
0.5789645, -0.9935024, 2.767445, 0.3137255, 0, 1, 1,
0.5806848, 1.415604, 0.4971042, 0.3215686, 0, 1, 1,
0.5858427, -2.241979, 2.956258, 0.3254902, 0, 1, 1,
0.5878446, 2.212825, -0.7546253, 0.3333333, 0, 1, 1,
0.5932794, 0.3094198, 0.7687425, 0.3372549, 0, 1, 1,
0.593731, -0.8339655, 3.327309, 0.345098, 0, 1, 1,
0.5947109, 1.156892, 1.660259, 0.3490196, 0, 1, 1,
0.5973018, 0.9925979, 0.6673446, 0.3568628, 0, 1, 1,
0.5986332, -0.646055, 2.948567, 0.3607843, 0, 1, 1,
0.604021, 1.585778, -0.2912923, 0.3686275, 0, 1, 1,
0.6051641, 0.3915282, 0.6571782, 0.372549, 0, 1, 1,
0.6055171, 0.3844741, 0.2798665, 0.3803922, 0, 1, 1,
0.6056144, 0.09076124, 0.4619386, 0.3843137, 0, 1, 1,
0.6062108, 1.349557, -1.945256, 0.3921569, 0, 1, 1,
0.6076406, -0.8517507, 1.906868, 0.3960784, 0, 1, 1,
0.6077069, 1.665134, -0.1190706, 0.4039216, 0, 1, 1,
0.6093709, 0.2240087, 0.4479942, 0.4117647, 0, 1, 1,
0.6131513, 0.9045839, 2.298073, 0.4156863, 0, 1, 1,
0.6134028, -0.03696762, -0.6428267, 0.4235294, 0, 1, 1,
0.6148038, 0.6175914, 1.13911, 0.427451, 0, 1, 1,
0.6149395, 1.550104, 0.4007728, 0.4352941, 0, 1, 1,
0.615791, 0.07241858, 2.81665, 0.4392157, 0, 1, 1,
0.6158828, -0.05175915, 1.118113, 0.4470588, 0, 1, 1,
0.6162613, -0.9668483, 3.765175, 0.4509804, 0, 1, 1,
0.6180326, -1.87872, 2.926778, 0.4588235, 0, 1, 1,
0.6200522, -1.128281, 2.937113, 0.4627451, 0, 1, 1,
0.6203555, 0.2191995, 0.7024388, 0.4705882, 0, 1, 1,
0.6255898, 0.3600541, 0.9253595, 0.4745098, 0, 1, 1,
0.6328571, -2.014815, 2.944575, 0.4823529, 0, 1, 1,
0.6358523, 0.5349307, 1.279871, 0.4862745, 0, 1, 1,
0.6446665, 0.8655338, 0.9349402, 0.4941176, 0, 1, 1,
0.6513288, -1.052989, 2.2977, 0.5019608, 0, 1, 1,
0.6533723, -0.9135028, 4.459879, 0.5058824, 0, 1, 1,
0.6593839, -0.4315844, 3.659329, 0.5137255, 0, 1, 1,
0.6600232, -0.4367003, 1.968731, 0.5176471, 0, 1, 1,
0.661979, -0.9327114, 0.1832062, 0.5254902, 0, 1, 1,
0.6676387, 0.8566629, 0.4541401, 0.5294118, 0, 1, 1,
0.6735425, 0.2404207, 1.945542, 0.5372549, 0, 1, 1,
0.6761283, -0.0614226, 0.8515778, 0.5411765, 0, 1, 1,
0.6825014, -0.2315901, 2.209725, 0.5490196, 0, 1, 1,
0.6939948, 1.058876, 0.06150819, 0.5529412, 0, 1, 1,
0.6974934, 1.432776, 0.3803489, 0.5607843, 0, 1, 1,
0.7005072, 1.037996, 2.668377, 0.5647059, 0, 1, 1,
0.7066302, -1.336622, 1.159538, 0.572549, 0, 1, 1,
0.7111465, 0.8644818, 1.169102, 0.5764706, 0, 1, 1,
0.7129984, -0.2682606, 2.401344, 0.5843138, 0, 1, 1,
0.7233257, 1.725213, -0.4087645, 0.5882353, 0, 1, 1,
0.7284371, 0.3318849, 1.069183, 0.5960785, 0, 1, 1,
0.7354766, 1.658181, 0.549744, 0.6039216, 0, 1, 1,
0.7367359, 0.6702028, 1.653227, 0.6078432, 0, 1, 1,
0.740047, -0.2285327, 1.141558, 0.6156863, 0, 1, 1,
0.740824, 0.9401085, 1.402482, 0.6196079, 0, 1, 1,
0.7417435, 1.685784, -0.1311292, 0.627451, 0, 1, 1,
0.7517233, 0.2416445, 2.195144, 0.6313726, 0, 1, 1,
0.7691546, -0.2002008, 2.885737, 0.6392157, 0, 1, 1,
0.7730539, 1.026179, 1.865998, 0.6431373, 0, 1, 1,
0.7733674, 0.6710288, 0.427363, 0.6509804, 0, 1, 1,
0.7736715, -0.4899601, 1.680594, 0.654902, 0, 1, 1,
0.7746916, -1.019339, 2.746029, 0.6627451, 0, 1, 1,
0.7762114, 0.5112954, -0.1436345, 0.6666667, 0, 1, 1,
0.7814919, -1.446841, 2.304785, 0.6745098, 0, 1, 1,
0.7828727, 1.022424, -0.5863779, 0.6784314, 0, 1, 1,
0.7872046, 1.482025, -1.80069, 0.6862745, 0, 1, 1,
0.7881589, 0.8992578, 0.2994328, 0.6901961, 0, 1, 1,
0.7884694, 1.600149, -0.4585449, 0.6980392, 0, 1, 1,
0.7885326, -0.2204321, 2.437557, 0.7058824, 0, 1, 1,
0.7889407, -1.22001, 1.96542, 0.7098039, 0, 1, 1,
0.7914183, 0.4134832, -0.06482582, 0.7176471, 0, 1, 1,
0.7932597, -0.2475444, 2.376654, 0.7215686, 0, 1, 1,
0.7945309, -0.03361104, 2.109602, 0.7294118, 0, 1, 1,
0.8012322, -0.73878, 3.632272, 0.7333333, 0, 1, 1,
0.8069272, -0.4593918, 2.190485, 0.7411765, 0, 1, 1,
0.8079883, -0.5661969, 0.7885902, 0.7450981, 0, 1, 1,
0.8244266, -0.1932746, 2.63243, 0.7529412, 0, 1, 1,
0.8281955, 0.008060784, 3.069054, 0.7568628, 0, 1, 1,
0.8288124, 0.2499795, 0.280505, 0.7647059, 0, 1, 1,
0.8371075, -0.9940597, 1.60536, 0.7686275, 0, 1, 1,
0.8392631, 0.2279682, 0.5940387, 0.7764706, 0, 1, 1,
0.8528525, -0.4220263, 4.374405, 0.7803922, 0, 1, 1,
0.8528922, 1.394893, 0.2622385, 0.7882353, 0, 1, 1,
0.8534628, -0.06051994, 0.7926598, 0.7921569, 0, 1, 1,
0.8613557, -0.7225985, 3.726936, 0.8, 0, 1, 1,
0.8617571, 0.4971574, 1.29572, 0.8078431, 0, 1, 1,
0.8620239, -1.02147, 2.621176, 0.8117647, 0, 1, 1,
0.863013, -0.6799737, 3.051847, 0.8196079, 0, 1, 1,
0.8634444, -0.07040299, 1.823642, 0.8235294, 0, 1, 1,
0.8639063, 0.4827064, 1.695823, 0.8313726, 0, 1, 1,
0.8639451, -0.2397424, 1.612919, 0.8352941, 0, 1, 1,
0.8691672, 0.5726867, 1.922434, 0.8431373, 0, 1, 1,
0.8692394, -0.1057883, 2.113244, 0.8470588, 0, 1, 1,
0.8702201, 0.08431593, 3.271908, 0.854902, 0, 1, 1,
0.8741349, -2.373627, 3.731038, 0.8588235, 0, 1, 1,
0.8759177, 0.3997138, 1.261618, 0.8666667, 0, 1, 1,
0.8777378, 1.447644, -0.4267445, 0.8705882, 0, 1, 1,
0.8809256, -0.7113905, 2.520077, 0.8784314, 0, 1, 1,
0.8823292, 0.4334916, 0.04523993, 0.8823529, 0, 1, 1,
0.8827689, -0.1257925, 0.6837587, 0.8901961, 0, 1, 1,
0.8865255, 0.4314044, 1.703321, 0.8941177, 0, 1, 1,
0.8936857, -0.989025, 2.267007, 0.9019608, 0, 1, 1,
0.8949162, 0.08101105, 1.109431, 0.9098039, 0, 1, 1,
0.9002122, 0.5776097, -0.5217842, 0.9137255, 0, 1, 1,
0.905533, 0.3160614, 2.311065, 0.9215686, 0, 1, 1,
0.9057307, 0.241811, 0.5383698, 0.9254902, 0, 1, 1,
0.9061574, -0.3202126, 2.050534, 0.9333333, 0, 1, 1,
0.9071345, 0.4595414, 0.9841691, 0.9372549, 0, 1, 1,
0.9076884, -0.6639259, 1.463802, 0.945098, 0, 1, 1,
0.9077096, 0.5387648, 2.166073, 0.9490196, 0, 1, 1,
0.9100213, 1.584295, 0.001847462, 0.9568627, 0, 1, 1,
0.9108859, -0.3336767, 3.429691, 0.9607843, 0, 1, 1,
0.9198196, -1.778155, 1.529461, 0.9686275, 0, 1, 1,
0.9251695, 1.432113, -0.5754075, 0.972549, 0, 1, 1,
0.9266879, -0.2394357, 2.588406, 0.9803922, 0, 1, 1,
0.9391612, 1.113451, 1.276315, 0.9843137, 0, 1, 1,
0.9391837, -0.04934995, 0.9876778, 0.9921569, 0, 1, 1,
0.9412476, -0.4396158, 2.062158, 0.9960784, 0, 1, 1,
0.9465466, -0.03795158, 0.8159761, 1, 0, 0.9960784, 1,
0.9467545, -0.4246242, 1.327911, 1, 0, 0.9882353, 1,
0.949183, 0.2251326, 0.001147508, 1, 0, 0.9843137, 1,
0.9495711, 0.521647, 1.562337, 1, 0, 0.9764706, 1,
0.9517377, 0.1378205, 1.448705, 1, 0, 0.972549, 1,
0.9627073, 0.3739851, 1.723836, 1, 0, 0.9647059, 1,
0.9731979, 0.1756417, 1.88517, 1, 0, 0.9607843, 1,
0.9738085, -0.8356721, 2.517645, 1, 0, 0.9529412, 1,
0.985021, -1.744822, 4.246472, 1, 0, 0.9490196, 1,
0.992615, -0.1074678, 1.946339, 1, 0, 0.9411765, 1,
0.993782, -0.6158484, 1.624714, 1, 0, 0.9372549, 1,
0.9990949, -1.208242, 1.932904, 1, 0, 0.9294118, 1,
1.008976, 0.6507112, 0.3473173, 1, 0, 0.9254902, 1,
1.009346, 0.1713347, -0.569133, 1, 0, 0.9176471, 1,
1.020971, -0.7622664, 2.329699, 1, 0, 0.9137255, 1,
1.023177, -0.5903437, 0.4920543, 1, 0, 0.9058824, 1,
1.023426, 0.124734, 2.362236, 1, 0, 0.9019608, 1,
1.028622, -1.218351, 2.878662, 1, 0, 0.8941177, 1,
1.029698, -0.3354518, 1.732895, 1, 0, 0.8862745, 1,
1.034042, -2.376249, 2.367702, 1, 0, 0.8823529, 1,
1.039953, 0.09930553, 1.847971, 1, 0, 0.8745098, 1,
1.043711, 1.085233, 0.4834536, 1, 0, 0.8705882, 1,
1.050022, -0.7312104, 0.9963194, 1, 0, 0.8627451, 1,
1.063088, -0.1213151, 3.245786, 1, 0, 0.8588235, 1,
1.067752, 0.6588115, 0.1739066, 1, 0, 0.8509804, 1,
1.076068, -0.7150087, 2.196755, 1, 0, 0.8470588, 1,
1.086091, 1.012792, 0.6638691, 1, 0, 0.8392157, 1,
1.091447, 0.08870073, 2.248553, 1, 0, 0.8352941, 1,
1.096017, -1.635813, 2.115182, 1, 0, 0.827451, 1,
1.109937, 0.1931275, 0.005800561, 1, 0, 0.8235294, 1,
1.111759, -2.125926, 3.006273, 1, 0, 0.8156863, 1,
1.123414, -0.1915058, 1.919469, 1, 0, 0.8117647, 1,
1.133976, -1.241177, 1.615684, 1, 0, 0.8039216, 1,
1.151275, -1.990281, 2.084875, 1, 0, 0.7960784, 1,
1.153897, -1.689762, 3.149025, 1, 0, 0.7921569, 1,
1.154898, -0.1139033, 0.5591457, 1, 0, 0.7843137, 1,
1.155196, -1.455723, 3.679202, 1, 0, 0.7803922, 1,
1.157619, 0.6904438, 0.4408979, 1, 0, 0.772549, 1,
1.159977, 0.1047746, 0.07450878, 1, 0, 0.7686275, 1,
1.164791, 2.815314, 0.1839987, 1, 0, 0.7607843, 1,
1.166203, 0.9087555, 0.3483133, 1, 0, 0.7568628, 1,
1.173956, -1.124178, 1.379725, 1, 0, 0.7490196, 1,
1.17837, 2.085915, 1.025436, 1, 0, 0.7450981, 1,
1.17886, 0.4306771, 2.418433, 1, 0, 0.7372549, 1,
1.181495, 0.6657938, 2.73527, 1, 0, 0.7333333, 1,
1.182125, -0.681788, 2.229324, 1, 0, 0.7254902, 1,
1.186983, 0.7117841, 1.482617, 1, 0, 0.7215686, 1,
1.201731, -0.6162633, 2.253856, 1, 0, 0.7137255, 1,
1.202529, 0.7188187, 2.700653, 1, 0, 0.7098039, 1,
1.21563, 0.7300149, -0.8233197, 1, 0, 0.7019608, 1,
1.22251, -1.419676, 3.76658, 1, 0, 0.6941177, 1,
1.222744, -0.2414822, 1.987601, 1, 0, 0.6901961, 1,
1.223888, 0.7052668, 0.669413, 1, 0, 0.682353, 1,
1.224442, 0.6727918, -0.06777826, 1, 0, 0.6784314, 1,
1.245808, -0.5904177, 1.01531, 1, 0, 0.6705883, 1,
1.259025, 1.310675, 0.6386338, 1, 0, 0.6666667, 1,
1.260808, -1.214491, 0.1225666, 1, 0, 0.6588235, 1,
1.261551, -0.05790969, -0.8389253, 1, 0, 0.654902, 1,
1.264532, 0.4446712, 0.9027959, 1, 0, 0.6470588, 1,
1.267053, 0.7214985, 2.063445, 1, 0, 0.6431373, 1,
1.270313, -0.6709992, 1.990696, 1, 0, 0.6352941, 1,
1.274556, -1.893687, 3.10243, 1, 0, 0.6313726, 1,
1.278679, 0.3107091, 2.560052, 1, 0, 0.6235294, 1,
1.2815, 1.081694, 0.6771514, 1, 0, 0.6196079, 1,
1.28333, -0.1737827, 0.2998699, 1, 0, 0.6117647, 1,
1.286792, 0.1009834, -0.3688136, 1, 0, 0.6078432, 1,
1.301845, -0.4048906, 1.76872, 1, 0, 0.6, 1,
1.303563, -1.645234, 1.851654, 1, 0, 0.5921569, 1,
1.312523, 1.8398, 2.483781, 1, 0, 0.5882353, 1,
1.314514, -0.05279714, 0.3644112, 1, 0, 0.5803922, 1,
1.318356, 0.2629619, 1.39924, 1, 0, 0.5764706, 1,
1.322494, 0.08688991, 1.91464, 1, 0, 0.5686275, 1,
1.326285, -0.3901563, 1.707, 1, 0, 0.5647059, 1,
1.330824, 1.636411, 2.899123, 1, 0, 0.5568628, 1,
1.333424, -0.5054706, 1.835415, 1, 0, 0.5529412, 1,
1.342986, -1.285964, 4.509065, 1, 0, 0.5450981, 1,
1.353138, 0.03080109, -0.08804406, 1, 0, 0.5411765, 1,
1.373317, 0.5602412, 0.9466354, 1, 0, 0.5333334, 1,
1.373428, -2.292104, 2.770483, 1, 0, 0.5294118, 1,
1.388074, -1.549831, 3.624887, 1, 0, 0.5215687, 1,
1.394273, 1.490122, 2.183903, 1, 0, 0.5176471, 1,
1.41094, 0.5209402, 1.598912, 1, 0, 0.509804, 1,
1.413759, -0.2156841, 1.245447, 1, 0, 0.5058824, 1,
1.413769, -1.745084, -0.006804794, 1, 0, 0.4980392, 1,
1.420295, 0.8171958, 0.8648433, 1, 0, 0.4901961, 1,
1.426149, 0.36811, 1.541281, 1, 0, 0.4862745, 1,
1.45272, 0.4817267, 0.8436604, 1, 0, 0.4784314, 1,
1.453134, 0.10293, 0.2145701, 1, 0, 0.4745098, 1,
1.462906, -1.443417, 2.022019, 1, 0, 0.4666667, 1,
1.478569, -0.7181512, 1.52878, 1, 0, 0.4627451, 1,
1.483636, -1.719441, 3.173239, 1, 0, 0.454902, 1,
1.488942, 1.700436, 1.091462, 1, 0, 0.4509804, 1,
1.503859, -2.073277, 1.823258, 1, 0, 0.4431373, 1,
1.511268, -0.1550493, 1.320418, 1, 0, 0.4392157, 1,
1.512841, -0.4520879, 2.718373, 1, 0, 0.4313726, 1,
1.518721, 2.343729, -0.6557301, 1, 0, 0.427451, 1,
1.520809, 0.7040747, 2.106536, 1, 0, 0.4196078, 1,
1.529357, 1.067225, 2.109271, 1, 0, 0.4156863, 1,
1.551679, -0.948105, 3.273882, 1, 0, 0.4078431, 1,
1.55187, -1.49275, 2.347741, 1, 0, 0.4039216, 1,
1.554492, 0.3625928, -0.8635852, 1, 0, 0.3960784, 1,
1.555383, -0.6151924, 1.909263, 1, 0, 0.3882353, 1,
1.562359, 0.2351608, 1.772099, 1, 0, 0.3843137, 1,
1.572068, 1.641793, 2.555056, 1, 0, 0.3764706, 1,
1.595998, -1.482803, 3.104981, 1, 0, 0.372549, 1,
1.602931, -0.3917308, 3.539876, 1, 0, 0.3647059, 1,
1.610465, -0.3845214, 0.7472226, 1, 0, 0.3607843, 1,
1.614377, 0.05837313, 2.575052, 1, 0, 0.3529412, 1,
1.616114, -0.3453958, 2.325784, 1, 0, 0.3490196, 1,
1.619555, 0.636292, 1.112198, 1, 0, 0.3411765, 1,
1.64921, -0.07126953, 2.815567, 1, 0, 0.3372549, 1,
1.649919, -0.3581531, 1.758283, 1, 0, 0.3294118, 1,
1.656022, 0.4217826, 1.575091, 1, 0, 0.3254902, 1,
1.659235, 0.1065702, -0.06490789, 1, 0, 0.3176471, 1,
1.688045, 0.3966526, 3.347125, 1, 0, 0.3137255, 1,
1.692777, -0.4929921, 2.485507, 1, 0, 0.3058824, 1,
1.70346, -0.820792, 1.170818, 1, 0, 0.2980392, 1,
1.707663, -1.694855, 2.29781, 1, 0, 0.2941177, 1,
1.727772, -1.105263, 0.641589, 1, 0, 0.2862745, 1,
1.754406, -0.8923381, 2.829122, 1, 0, 0.282353, 1,
1.769393, 0.8461154, 0.9779341, 1, 0, 0.2745098, 1,
1.774424, -1.472014, 0.8782207, 1, 0, 0.2705882, 1,
1.795089, -0.5520998, 1.21895, 1, 0, 0.2627451, 1,
1.797998, -1.180948, 2.102752, 1, 0, 0.2588235, 1,
1.814566, 0.6435202, 0.8698171, 1, 0, 0.2509804, 1,
1.834871, 0.6760876, -0.04018236, 1, 0, 0.2470588, 1,
1.842786, 0.03503599, 1.755279, 1, 0, 0.2392157, 1,
1.850873, -0.01494435, 0.699064, 1, 0, 0.2352941, 1,
1.85118, 0.881892, 0.4481598, 1, 0, 0.227451, 1,
1.851771, -1.425029, 0.8340426, 1, 0, 0.2235294, 1,
1.861958, 0.9888725, 0.1961525, 1, 0, 0.2156863, 1,
1.864518, 0.01269436, 0.6295124, 1, 0, 0.2117647, 1,
1.871758, 0.2909406, 0.9846727, 1, 0, 0.2039216, 1,
1.880222, 0.1731185, 0.8860051, 1, 0, 0.1960784, 1,
1.880743, -0.3932867, 1.936839, 1, 0, 0.1921569, 1,
1.895962, 0.4565116, 2.321335, 1, 0, 0.1843137, 1,
1.897173, -0.5979576, 0.3069488, 1, 0, 0.1803922, 1,
1.897201, -1.428226, 1.554142, 1, 0, 0.172549, 1,
1.899523, -0.9117107, 2.267991, 1, 0, 0.1686275, 1,
1.903423, 0.1766656, 2.300672, 1, 0, 0.1607843, 1,
1.909826, -1.511169, 2.853733, 1, 0, 0.1568628, 1,
1.929546, 0.2808262, 3.305684, 1, 0, 0.1490196, 1,
1.933917, -0.6484842, 2.379901, 1, 0, 0.145098, 1,
1.938547, -0.9945891, 2.736444, 1, 0, 0.1372549, 1,
1.963076, 0.5579728, 1.921925, 1, 0, 0.1333333, 1,
2.019511, -1.740671, 1.744532, 1, 0, 0.1254902, 1,
2.031723, 0.7533243, 1.642869, 1, 0, 0.1215686, 1,
2.069313, 1.169205, 1.220472, 1, 0, 0.1137255, 1,
2.102663, 0.3381435, 0.3208198, 1, 0, 0.1098039, 1,
2.138405, 0.369766, 0.9049001, 1, 0, 0.1019608, 1,
2.144466, 0.5826212, 0.7918944, 1, 0, 0.09411765, 1,
2.168694, -0.2538735, 1.963243, 1, 0, 0.09019608, 1,
2.171066, 3.218548, -1.235767, 1, 0, 0.08235294, 1,
2.193181, 1.084363, 0.6245147, 1, 0, 0.07843138, 1,
2.216364, -0.9804225, 1.48154, 1, 0, 0.07058824, 1,
2.233242, -0.3397562, 1.267119, 1, 0, 0.06666667, 1,
2.28073, 0.8259339, 2.013734, 1, 0, 0.05882353, 1,
2.301515, -1.728896, 2.891713, 1, 0, 0.05490196, 1,
2.312575, 0.04036827, 3.361032, 1, 0, 0.04705882, 1,
2.377038, -0.1165645, 1.341981, 1, 0, 0.04313726, 1,
2.522311, -0.5366597, 2.621581, 1, 0, 0.03529412, 1,
2.601997, 0.8510166, 0.4911182, 1, 0, 0.03137255, 1,
2.639964, -1.659963, 2.697921, 1, 0, 0.02352941, 1,
2.873201, -0.3599167, 0.3734295, 1, 0, 0.01960784, 1,
2.938733, -0.1416862, 1.148083, 1, 0, 0.01176471, 1,
2.975863, 1.974118, 0.5031177, 1, 0, 0.007843138, 1
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
-0.1377326, -3.813162, -7.738794, 0, -0.5, 0.5, 0.5,
-0.1377326, -3.813162, -7.738794, 1, -0.5, 0.5, 0.5,
-0.1377326, -3.813162, -7.738794, 1, 1.5, 0.5, 0.5,
-0.1377326, -3.813162, -7.738794, 0, 1.5, 0.5, 0.5
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
-4.306838, 0.500084, -7.738794, 0, -0.5, 0.5, 0.5,
-4.306838, 0.500084, -7.738794, 1, -0.5, 0.5, 0.5,
-4.306838, 0.500084, -7.738794, 1, 1.5, 0.5, 0.5,
-4.306838, 0.500084, -7.738794, 0, 1.5, 0.5, 0.5
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
-4.306838, -3.813162, 0.2177041, 0, -0.5, 0.5, 0.5,
-4.306838, -3.813162, 0.2177041, 1, -0.5, 0.5, 0.5,
-4.306838, -3.813162, 0.2177041, 1, 1.5, 0.5, 0.5,
-4.306838, -3.813162, 0.2177041, 0, 1.5, 0.5, 0.5
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
-3, -2.817797, -5.902679,
2, -2.817797, -5.902679,
-3, -2.817797, -5.902679,
-3, -2.983692, -6.208699,
-2, -2.817797, -5.902679,
-2, -2.983692, -6.208699,
-1, -2.817797, -5.902679,
-1, -2.983692, -6.208699,
0, -2.817797, -5.902679,
0, -2.983692, -6.208699,
1, -2.817797, -5.902679,
1, -2.983692, -6.208699,
2, -2.817797, -5.902679,
2, -2.983692, -6.208699
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
-3, -3.31548, -6.820737, 0, -0.5, 0.5, 0.5,
-3, -3.31548, -6.820737, 1, -0.5, 0.5, 0.5,
-3, -3.31548, -6.820737, 1, 1.5, 0.5, 0.5,
-3, -3.31548, -6.820737, 0, 1.5, 0.5, 0.5,
-2, -3.31548, -6.820737, 0, -0.5, 0.5, 0.5,
-2, -3.31548, -6.820737, 1, -0.5, 0.5, 0.5,
-2, -3.31548, -6.820737, 1, 1.5, 0.5, 0.5,
-2, -3.31548, -6.820737, 0, 1.5, 0.5, 0.5,
-1, -3.31548, -6.820737, 0, -0.5, 0.5, 0.5,
-1, -3.31548, -6.820737, 1, -0.5, 0.5, 0.5,
-1, -3.31548, -6.820737, 1, 1.5, 0.5, 0.5,
-1, -3.31548, -6.820737, 0, 1.5, 0.5, 0.5,
0, -3.31548, -6.820737, 0, -0.5, 0.5, 0.5,
0, -3.31548, -6.820737, 1, -0.5, 0.5, 0.5,
0, -3.31548, -6.820737, 1, 1.5, 0.5, 0.5,
0, -3.31548, -6.820737, 0, 1.5, 0.5, 0.5,
1, -3.31548, -6.820737, 0, -0.5, 0.5, 0.5,
1, -3.31548, -6.820737, 1, -0.5, 0.5, 0.5,
1, -3.31548, -6.820737, 1, 1.5, 0.5, 0.5,
1, -3.31548, -6.820737, 0, 1.5, 0.5, 0.5,
2, -3.31548, -6.820737, 0, -0.5, 0.5, 0.5,
2, -3.31548, -6.820737, 1, -0.5, 0.5, 0.5,
2, -3.31548, -6.820737, 1, 1.5, 0.5, 0.5,
2, -3.31548, -6.820737, 0, 1.5, 0.5, 0.5
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
-3.344737, -2, -5.902679,
-3.344737, 3, -5.902679,
-3.344737, -2, -5.902679,
-3.505087, -2, -6.208699,
-3.344737, -1, -5.902679,
-3.505087, -1, -6.208699,
-3.344737, 0, -5.902679,
-3.505087, 0, -6.208699,
-3.344737, 1, -5.902679,
-3.505087, 1, -6.208699,
-3.344737, 2, -5.902679,
-3.505087, 2, -6.208699,
-3.344737, 3, -5.902679,
-3.505087, 3, -6.208699
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
-3.825787, -2, -6.820737, 0, -0.5, 0.5, 0.5,
-3.825787, -2, -6.820737, 1, -0.5, 0.5, 0.5,
-3.825787, -2, -6.820737, 1, 1.5, 0.5, 0.5,
-3.825787, -2, -6.820737, 0, 1.5, 0.5, 0.5,
-3.825787, -1, -6.820737, 0, -0.5, 0.5, 0.5,
-3.825787, -1, -6.820737, 1, -0.5, 0.5, 0.5,
-3.825787, -1, -6.820737, 1, 1.5, 0.5, 0.5,
-3.825787, -1, -6.820737, 0, 1.5, 0.5, 0.5,
-3.825787, 0, -6.820737, 0, -0.5, 0.5, 0.5,
-3.825787, 0, -6.820737, 1, -0.5, 0.5, 0.5,
-3.825787, 0, -6.820737, 1, 1.5, 0.5, 0.5,
-3.825787, 0, -6.820737, 0, 1.5, 0.5, 0.5,
-3.825787, 1, -6.820737, 0, -0.5, 0.5, 0.5,
-3.825787, 1, -6.820737, 1, -0.5, 0.5, 0.5,
-3.825787, 1, -6.820737, 1, 1.5, 0.5, 0.5,
-3.825787, 1, -6.820737, 0, 1.5, 0.5, 0.5,
-3.825787, 2, -6.820737, 0, -0.5, 0.5, 0.5,
-3.825787, 2, -6.820737, 1, -0.5, 0.5, 0.5,
-3.825787, 2, -6.820737, 1, 1.5, 0.5, 0.5,
-3.825787, 2, -6.820737, 0, 1.5, 0.5, 0.5,
-3.825787, 3, -6.820737, 0, -0.5, 0.5, 0.5,
-3.825787, 3, -6.820737, 1, -0.5, 0.5, 0.5,
-3.825787, 3, -6.820737, 1, 1.5, 0.5, 0.5,
-3.825787, 3, -6.820737, 0, 1.5, 0.5, 0.5
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
-3.344737, -2.817797, -4,
-3.344737, -2.817797, 6,
-3.344737, -2.817797, -4,
-3.505087, -2.983692, -4,
-3.344737, -2.817797, -2,
-3.505087, -2.983692, -2,
-3.344737, -2.817797, 0,
-3.505087, -2.983692, 0,
-3.344737, -2.817797, 2,
-3.505087, -2.983692, 2,
-3.344737, -2.817797, 4,
-3.505087, -2.983692, 4,
-3.344737, -2.817797, 6,
-3.505087, -2.983692, 6
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
-3.825787, -3.31548, -4, 0, -0.5, 0.5, 0.5,
-3.825787, -3.31548, -4, 1, -0.5, 0.5, 0.5,
-3.825787, -3.31548, -4, 1, 1.5, 0.5, 0.5,
-3.825787, -3.31548, -4, 0, 1.5, 0.5, 0.5,
-3.825787, -3.31548, -2, 0, -0.5, 0.5, 0.5,
-3.825787, -3.31548, -2, 1, -0.5, 0.5, 0.5,
-3.825787, -3.31548, -2, 1, 1.5, 0.5, 0.5,
-3.825787, -3.31548, -2, 0, 1.5, 0.5, 0.5,
-3.825787, -3.31548, 0, 0, -0.5, 0.5, 0.5,
-3.825787, -3.31548, 0, 1, -0.5, 0.5, 0.5,
-3.825787, -3.31548, 0, 1, 1.5, 0.5, 0.5,
-3.825787, -3.31548, 0, 0, 1.5, 0.5, 0.5,
-3.825787, -3.31548, 2, 0, -0.5, 0.5, 0.5,
-3.825787, -3.31548, 2, 1, -0.5, 0.5, 0.5,
-3.825787, -3.31548, 2, 1, 1.5, 0.5, 0.5,
-3.825787, -3.31548, 2, 0, 1.5, 0.5, 0.5,
-3.825787, -3.31548, 4, 0, -0.5, 0.5, 0.5,
-3.825787, -3.31548, 4, 1, -0.5, 0.5, 0.5,
-3.825787, -3.31548, 4, 1, 1.5, 0.5, 0.5,
-3.825787, -3.31548, 4, 0, 1.5, 0.5, 0.5,
-3.825787, -3.31548, 6, 0, -0.5, 0.5, 0.5,
-3.825787, -3.31548, 6, 1, -0.5, 0.5, 0.5,
-3.825787, -3.31548, 6, 1, 1.5, 0.5, 0.5,
-3.825787, -3.31548, 6, 0, 1.5, 0.5, 0.5
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
-3.344737, -2.817797, -5.902679,
-3.344737, 3.817966, -5.902679,
-3.344737, -2.817797, 6.338088,
-3.344737, 3.817966, 6.338088,
-3.344737, -2.817797, -5.902679,
-3.344737, -2.817797, 6.338088,
-3.344737, 3.817966, -5.902679,
-3.344737, 3.817966, 6.338088,
-3.344737, -2.817797, -5.902679,
3.069271, -2.817797, -5.902679,
-3.344737, -2.817797, 6.338088,
3.069271, -2.817797, 6.338088,
-3.344737, 3.817966, -5.902679,
3.069271, 3.817966, -5.902679,
-3.344737, 3.817966, 6.338088,
3.069271, 3.817966, 6.338088,
3.069271, -2.817797, -5.902679,
3.069271, 3.817966, -5.902679,
3.069271, -2.817797, 6.338088,
3.069271, 3.817966, 6.338088,
3.069271, -2.817797, -5.902679,
3.069271, -2.817797, 6.338088,
3.069271, 3.817966, -5.902679,
3.069271, 3.817966, 6.338088
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
var radius = 8.185928;
var distance = 36.42012;
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
mvMatrix.translate( 0.1377326, -0.500084, -0.2177041 );
mvMatrix.scale( 1.379915, 1.333801, 0.7230581 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.42012);
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
desmedipham<-read.table("desmedipham.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-desmedipham$V2
```

```
## Error in eval(expr, envir, enclos): object 'desmedipham' not found
```

```r
y<-desmedipham$V3
```

```
## Error in eval(expr, envir, enclos): object 'desmedipham' not found
```

```r
z<-desmedipham$V4
```

```
## Error in eval(expr, envir, enclos): object 'desmedipham' not found
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
-3.251329, -1.152963, -2.227276, 0, 0, 1, 1, 1,
-3.166743, 1.665311, -2.455761, 1, 0, 0, 1, 1,
-3.105118, -0.2099141, -1.740019, 1, 0, 0, 1, 1,
-2.822563, -0.7716137, -2.325566, 1, 0, 0, 1, 1,
-2.598857, 2.113212, 0.6066043, 1, 0, 0, 1, 1,
-2.519873, 0.8184576, 0.3988115, 1, 0, 0, 1, 1,
-2.436239, -0.3752468, -2.879326, 0, 0, 0, 1, 1,
-2.347524, -0.5845769, -2.847288, 0, 0, 0, 1, 1,
-2.347278, -1.292583, -1.027398, 0, 0, 0, 1, 1,
-2.340694, -0.2137137, -3.243511, 0, 0, 0, 1, 1,
-2.318046, -0.2022779, -1.619353, 0, 0, 0, 1, 1,
-2.186328, -2.72116, -4.868304, 0, 0, 0, 1, 1,
-2.165764, 0.9114026, -1.091061, 0, 0, 0, 1, 1,
-2.148087, -0.1602626, -1.065409, 1, 1, 1, 1, 1,
-2.120818, 0.1105113, -1.856143, 1, 1, 1, 1, 1,
-2.029593, -0.1540396, -1.031649, 1, 1, 1, 1, 1,
-2.025273, -1.185215, -1.925357, 1, 1, 1, 1, 1,
-2.013693, -0.5371121, -1.48858, 1, 1, 1, 1, 1,
-1.946866, -1.3906, -1.834155, 1, 1, 1, 1, 1,
-1.94213, 0.7368131, -1.411141, 1, 1, 1, 1, 1,
-1.918076, -0.2469816, -2.157174, 1, 1, 1, 1, 1,
-1.9079, -1.110551, -1.27959, 1, 1, 1, 1, 1,
-1.907612, -0.7068309, -2.592736, 1, 1, 1, 1, 1,
-1.906733, 0.05080293, 0.5949305, 1, 1, 1, 1, 1,
-1.890814, 1.256837, -1.130237, 1, 1, 1, 1, 1,
-1.862693, 3.256809, -1.298314, 1, 1, 1, 1, 1,
-1.843759, -1.581019, -2.631115, 1, 1, 1, 1, 1,
-1.822749, 1.075594, -0.6298501, 1, 1, 1, 1, 1,
-1.819759, -0.6785604, -2.039456, 0, 0, 1, 1, 1,
-1.800694, 1.01723, 1.231151, 1, 0, 0, 1, 1,
-1.79843, -1.080063, -3.06089, 1, 0, 0, 1, 1,
-1.796177, 0.4965446, -1.66552, 1, 0, 0, 1, 1,
-1.781555, -0.2515766, -1.259404, 1, 0, 0, 1, 1,
-1.777291, -0.3144154, -2.575073, 1, 0, 0, 1, 1,
-1.764042, 0.07072065, -0.6391565, 0, 0, 0, 1, 1,
-1.758839, -0.2056755, -1.836175, 0, 0, 0, 1, 1,
-1.742383, 1.206631, -1.75589, 0, 0, 0, 1, 1,
-1.741091, -0.2814881, -2.043377, 0, 0, 0, 1, 1,
-1.737689, -0.8636641, -3.828329, 0, 0, 0, 1, 1,
-1.732775, 0.4087127, -2.170104, 0, 0, 0, 1, 1,
-1.730817, -0.29747, -0.2033771, 0, 0, 0, 1, 1,
-1.720202, 1.866367, -1.553791, 1, 1, 1, 1, 1,
-1.694423, 0.7127904, -0.6722124, 1, 1, 1, 1, 1,
-1.694242, -1.475086, -1.756968, 1, 1, 1, 1, 1,
-1.693888, -0.02105885, 0.322887, 1, 1, 1, 1, 1,
-1.690413, -1.87055, -1.597586, 1, 1, 1, 1, 1,
-1.687541, 1.097854, -1.328134, 1, 1, 1, 1, 1,
-1.684671, 0.7867824, -0.9706819, 1, 1, 1, 1, 1,
-1.684398, -0.3266782, -1.600759, 1, 1, 1, 1, 1,
-1.682595, 0.3080188, 0.2187109, 1, 1, 1, 1, 1,
-1.681694, 1.816318, 0.2932474, 1, 1, 1, 1, 1,
-1.668887, 0.6027247, 0.1020274, 1, 1, 1, 1, 1,
-1.645168, 0.8099139, -3.644436, 1, 1, 1, 1, 1,
-1.644068, -1.657803, -2.75571, 1, 1, 1, 1, 1,
-1.620932, 1.309397, -2.072579, 1, 1, 1, 1, 1,
-1.608696, -0.1052816, -2.350006, 1, 1, 1, 1, 1,
-1.603899, 2.077662, 0.6778023, 0, 0, 1, 1, 1,
-1.591152, 0.03464033, -2.706719, 1, 0, 0, 1, 1,
-1.589371, -0.03286558, -2.110069, 1, 0, 0, 1, 1,
-1.574768, -1.69794, -2.211899, 1, 0, 0, 1, 1,
-1.572414, -0.7338433, -2.349791, 1, 0, 0, 1, 1,
-1.558691, 0.2307828, -2.386322, 1, 0, 0, 1, 1,
-1.540507, 1.258854, -1.274782, 0, 0, 0, 1, 1,
-1.529475, -0.5078089, 0.08587516, 0, 0, 0, 1, 1,
-1.526694, 0.831734, -1.365816, 0, 0, 0, 1, 1,
-1.516222, -0.7364945, -2.157221, 0, 0, 0, 1, 1,
-1.503485, -1.436729, -3.046243, 0, 0, 0, 1, 1,
-1.478098, 0.4862694, -1.113129, 0, 0, 0, 1, 1,
-1.47186, 1.342093, -1.062874, 0, 0, 0, 1, 1,
-1.471065, 0.04858122, -1.868828, 1, 1, 1, 1, 1,
-1.470636, -1.165862, -1.54169, 1, 1, 1, 1, 1,
-1.468749, -0.9382333, -1.343284, 1, 1, 1, 1, 1,
-1.468061, -0.6551879, -2.555066, 1, 1, 1, 1, 1,
-1.458013, -0.7366282, -1.628433, 1, 1, 1, 1, 1,
-1.458006, -0.7500581, -2.523254, 1, 1, 1, 1, 1,
-1.444987, -0.7725962, -3.014007, 1, 1, 1, 1, 1,
-1.426598, 0.5059285, -0.9168386, 1, 1, 1, 1, 1,
-1.422572, 1.559604, -2.062714, 1, 1, 1, 1, 1,
-1.408905, -1.000012, -2.383616, 1, 1, 1, 1, 1,
-1.406278, -2.176499, -4.022633, 1, 1, 1, 1, 1,
-1.401779, 1.511104, -1.435548, 1, 1, 1, 1, 1,
-1.395514, 1.629101, -1.585642, 1, 1, 1, 1, 1,
-1.3907, 0.9629506, -0.9446021, 1, 1, 1, 1, 1,
-1.385295, 0.5142213, 0.5879644, 1, 1, 1, 1, 1,
-1.37769, -1.595404, -1.880517, 0, 0, 1, 1, 1,
-1.360304, -0.4511247, -1.602224, 1, 0, 0, 1, 1,
-1.35824, 1.544827, 0.5979881, 1, 0, 0, 1, 1,
-1.34717, -0.3804669, -1.773131, 1, 0, 0, 1, 1,
-1.343585, -0.6387051, -2.612074, 1, 0, 0, 1, 1,
-1.340394, -1.92669, -3.675298, 1, 0, 0, 1, 1,
-1.338059, -1.093257, -2.869296, 0, 0, 0, 1, 1,
-1.333801, 0.5484872, -1.209768, 0, 0, 0, 1, 1,
-1.328148, -1.584621, -2.64143, 0, 0, 0, 1, 1,
-1.327691, -2.084129, -2.054183, 0, 0, 0, 1, 1,
-1.31587, 0.2755086, -1.549158, 0, 0, 0, 1, 1,
-1.31108, 1.120961, -0.5787015, 0, 0, 0, 1, 1,
-1.294069, -0.3027571, -3.130442, 0, 0, 0, 1, 1,
-1.290582, 0.7101348, -1.849962, 1, 1, 1, 1, 1,
-1.290061, 0.5404329, -1.980476, 1, 1, 1, 1, 1,
-1.285266, -0.2521599, -2.48849, 1, 1, 1, 1, 1,
-1.280167, 1.914768, -1.107114, 1, 1, 1, 1, 1,
-1.275289, 0.2828557, -1.69816, 1, 1, 1, 1, 1,
-1.275101, 1.690732, -1.544404, 1, 1, 1, 1, 1,
-1.274259, 0.08559822, -2.043085, 1, 1, 1, 1, 1,
-1.269427, -1.055349, -0.6502777, 1, 1, 1, 1, 1,
-1.264652, 0.03838891, -1.277831, 1, 1, 1, 1, 1,
-1.25017, -0.7804093, -1.750857, 1, 1, 1, 1, 1,
-1.247692, 0.2750823, -1.31847, 1, 1, 1, 1, 1,
-1.23836, 1.318089, -0.2699857, 1, 1, 1, 1, 1,
-1.235073, 0.9254856, -0.2244514, 1, 1, 1, 1, 1,
-1.234987, 0.1427744, -0.1368122, 1, 1, 1, 1, 1,
-1.225373, 2.413264, -0.4622829, 1, 1, 1, 1, 1,
-1.223439, 0.6224862, -3.288976, 0, 0, 1, 1, 1,
-1.221552, 1.365851, -1.263433, 1, 0, 0, 1, 1,
-1.192356, -1.412117, -3.044109, 1, 0, 0, 1, 1,
-1.189164, -0.429404, -1.704055, 1, 0, 0, 1, 1,
-1.189138, -0.1824578, -2.11835, 1, 0, 0, 1, 1,
-1.182164, -0.003433094, -2.493648, 1, 0, 0, 1, 1,
-1.177815, 0.4830903, -2.633167, 0, 0, 0, 1, 1,
-1.176252, 0.6454659, 0.0729393, 0, 0, 0, 1, 1,
-1.174878, 0.237645, -1.623145, 0, 0, 0, 1, 1,
-1.173611, 0.5926546, -0.8988786, 0, 0, 0, 1, 1,
-1.169304, -2.60143, -3.302233, 0, 0, 0, 1, 1,
-1.155841, 1.869901, 0.2083103, 0, 0, 0, 1, 1,
-1.155748, -1.032275, -0.9401666, 0, 0, 0, 1, 1,
-1.144866, -0.07794388, -0.8193041, 1, 1, 1, 1, 1,
-1.14317, -1.288461, -3.19711, 1, 1, 1, 1, 1,
-1.134116, 0.35376, -2.8703, 1, 1, 1, 1, 1,
-1.131569, 0.04300573, -2.974982, 1, 1, 1, 1, 1,
-1.1308, 2.035934, 1.061661, 1, 1, 1, 1, 1,
-1.128736, 0.02926537, -3.074021, 1, 1, 1, 1, 1,
-1.124465, 2.391191, -0.3693142, 1, 1, 1, 1, 1,
-1.120727, -0.4868348, -1.614379, 1, 1, 1, 1, 1,
-1.119747, 0.05699879, -0.2277104, 1, 1, 1, 1, 1,
-1.111094, 0.6110194, -2.813909, 1, 1, 1, 1, 1,
-1.108313, -0.9732263, -1.354314, 1, 1, 1, 1, 1,
-1.102085, -1.28599, -3.352475, 1, 1, 1, 1, 1,
-1.091465, 0.6895744, -0.2469196, 1, 1, 1, 1, 1,
-1.091274, 1.408361, 0.4327245, 1, 1, 1, 1, 1,
-1.087383, 0.1575198, -1.22441, 1, 1, 1, 1, 1,
-1.082726, -1.097276, -2.747895, 0, 0, 1, 1, 1,
-1.078223, 1.046607, -0.055976, 1, 0, 0, 1, 1,
-1.066294, -0.8610517, -1.506208, 1, 0, 0, 1, 1,
-1.064077, 0.304733, -2.224831, 1, 0, 0, 1, 1,
-1.062971, 0.1116458, -1.656016, 1, 0, 0, 1, 1,
-1.058422, -0.4616762, -2.687744, 1, 0, 0, 1, 1,
-1.054618, 1.844934, -0.4316728, 0, 0, 0, 1, 1,
-1.05148, 2.30336, -0.2168699, 0, 0, 0, 1, 1,
-1.050419, -0.8227952, -1.386288, 0, 0, 0, 1, 1,
-1.048381, -1.103414, -2.830323, 0, 0, 0, 1, 1,
-1.047876, -0.8907331, -2.254299, 0, 0, 0, 1, 1,
-1.044587, -1.36963, -3.115572, 0, 0, 0, 1, 1,
-1.044204, 0.5719203, 0.5618259, 0, 0, 0, 1, 1,
-1.035639, -0.4445248, -1.891709, 1, 1, 1, 1, 1,
-1.029119, -0.9951103, -1.692697, 1, 1, 1, 1, 1,
-1.027221, 0.02637373, -1.829634, 1, 1, 1, 1, 1,
-1.02667, 0.3476556, 0.1372222, 1, 1, 1, 1, 1,
-1.022414, 0.9568066, 1.56614, 1, 1, 1, 1, 1,
-1.021641, 1.557711, -0.3413414, 1, 1, 1, 1, 1,
-1.020066, -0.2680748, -2.305686, 1, 1, 1, 1, 1,
-1.019813, 0.7677242, -1.096383, 1, 1, 1, 1, 1,
-1.012936, 1.325484, -0.8282115, 1, 1, 1, 1, 1,
-1.011505, 1.744025, -1.623741, 1, 1, 1, 1, 1,
-1.010777, -0.4414395, -1.260014, 1, 1, 1, 1, 1,
-1.009079, 0.1011615, -2.539908, 1, 1, 1, 1, 1,
-1.008642, -0.4262381, -0.977282, 1, 1, 1, 1, 1,
-1.005833, -1.418082, -1.877435, 1, 1, 1, 1, 1,
-1.00399, 0.6009698, -0.4041536, 1, 1, 1, 1, 1,
-1.001876, -0.5425797, -4.942357, 0, 0, 1, 1, 1,
-1.001249, 0.6567358, -0.3311256, 1, 0, 0, 1, 1,
-0.9966486, -0.2858819, -2.108953, 1, 0, 0, 1, 1,
-0.9952589, -0.07774796, -1.876473, 1, 0, 0, 1, 1,
-0.9924557, 0.6938289, -1.570603, 1, 0, 0, 1, 1,
-0.992256, 0.591962, -3.086765, 1, 0, 0, 1, 1,
-0.991716, 0.2350238, -0.7601991, 0, 0, 0, 1, 1,
-0.9916201, 1.632508, 0.414411, 0, 0, 0, 1, 1,
-0.986056, 1.653386, -0.7219023, 0, 0, 0, 1, 1,
-0.9852227, 1.040954, -0.6026495, 0, 0, 0, 1, 1,
-0.9825061, -0.02814306, -1.178134, 0, 0, 0, 1, 1,
-0.9801113, 3.721328, -1.866981, 0, 0, 0, 1, 1,
-0.9772905, 0.6425549, -0.2690528, 0, 0, 0, 1, 1,
-0.9739084, 0.6417298, -2.299727, 1, 1, 1, 1, 1,
-0.9693705, -1.734224, -2.11465, 1, 1, 1, 1, 1,
-0.960853, -0.08182648, -0.33735, 1, 1, 1, 1, 1,
-0.9588373, 1.513426, -1.500121, 1, 1, 1, 1, 1,
-0.9565709, -0.8443216, -3.567729, 1, 1, 1, 1, 1,
-0.9506051, -1.179035, -4.819933, 1, 1, 1, 1, 1,
-0.9474787, 0.2323452, -1.224106, 1, 1, 1, 1, 1,
-0.9465277, 0.7147784, -3.051059, 1, 1, 1, 1, 1,
-0.9403633, 0.5500777, 0.5320624, 1, 1, 1, 1, 1,
-0.9367433, -0.3664841, -2.115024, 1, 1, 1, 1, 1,
-0.9335182, -0.03498933, -0.8298375, 1, 1, 1, 1, 1,
-0.9306272, -0.1123827, -2.266659, 1, 1, 1, 1, 1,
-0.9284748, 1.000386, -0.3460621, 1, 1, 1, 1, 1,
-0.9280536, 1.242907, 1.01896, 1, 1, 1, 1, 1,
-0.9268311, 0.3570434, -2.046373, 1, 1, 1, 1, 1,
-0.9217128, -0.5297, -1.0464, 0, 0, 1, 1, 1,
-0.9140885, 1.226192, -1.489927, 1, 0, 0, 1, 1,
-0.9100485, -0.175459, -3.199838, 1, 0, 0, 1, 1,
-0.9025033, -0.9247839, -2.872746, 1, 0, 0, 1, 1,
-0.8971739, -0.7835363, -1.617255, 1, 0, 0, 1, 1,
-0.8966289, 0.1832701, -2.638352, 1, 0, 0, 1, 1,
-0.8827049, -1.286472, -2.777823, 0, 0, 0, 1, 1,
-0.8791743, 0.5896935, -2.431154, 0, 0, 0, 1, 1,
-0.8786583, -1.052482, -1.790902, 0, 0, 0, 1, 1,
-0.8747844, 0.2390748, -2.002745, 0, 0, 0, 1, 1,
-0.87153, -0.761506, -3.116477, 0, 0, 0, 1, 1,
-0.8700091, 1.133475, -0.8594939, 0, 0, 0, 1, 1,
-0.8693112, -1.42704, -0.8738739, 0, 0, 0, 1, 1,
-0.8683755, -0.05868245, -0.5485429, 1, 1, 1, 1, 1,
-0.8678433, 0.3611457, -2.726862, 1, 1, 1, 1, 1,
-0.8662789, 0.6159009, -1.001419, 1, 1, 1, 1, 1,
-0.8634544, 2.01286, -0.7189568, 1, 1, 1, 1, 1,
-0.8617663, -0.8899888, -3.329443, 1, 1, 1, 1, 1,
-0.8605427, -1.470224, -1.694297, 1, 1, 1, 1, 1,
-0.8591877, 2.2255, 0.8386292, 1, 1, 1, 1, 1,
-0.8551731, -1.170239, -2.202151, 1, 1, 1, 1, 1,
-0.8537813, -0.6596777, -0.9540676, 1, 1, 1, 1, 1,
-0.8527703, 1.163022, -0.2283663, 1, 1, 1, 1, 1,
-0.8497151, -0.5331501, -2.256113, 1, 1, 1, 1, 1,
-0.8492618, 1.116619, -0.4946318, 1, 1, 1, 1, 1,
-0.8467778, -0.2048186, -0.4629358, 1, 1, 1, 1, 1,
-0.8458436, 1.542438, -1.433501, 1, 1, 1, 1, 1,
-0.8372251, 0.4899606, -1.234554, 1, 1, 1, 1, 1,
-0.8332445, -0.3996337, -2.662225, 0, 0, 1, 1, 1,
-0.8275784, -1.667228, -5.724416, 1, 0, 0, 1, 1,
-0.8241701, -1.398015, -2.714122, 1, 0, 0, 1, 1,
-0.8225753, 0.4630785, -1.197162, 1, 0, 0, 1, 1,
-0.8209183, -0.5680327, -2.321483, 1, 0, 0, 1, 1,
-0.8205545, 0.4371547, -1.099649, 1, 0, 0, 1, 1,
-0.8144445, 0.799789, -1.428174, 0, 0, 0, 1, 1,
-0.7995339, -0.3106343, -2.778024, 0, 0, 0, 1, 1,
-0.7977384, -1.036031, -2.424265, 0, 0, 0, 1, 1,
-0.7917044, 1.083676, -0.1694179, 0, 0, 0, 1, 1,
-0.7914568, 1.334665, 0.6574743, 0, 0, 0, 1, 1,
-0.7894755, 0.2868785, -2.839303, 0, 0, 0, 1, 1,
-0.7883474, -0.3401618, -2.051744, 0, 0, 0, 1, 1,
-0.7878151, 0.4017504, -2.059752, 1, 1, 1, 1, 1,
-0.783799, -0.429375, -2.130351, 1, 1, 1, 1, 1,
-0.7795205, 1.856512, -1.721943, 1, 1, 1, 1, 1,
-0.7724236, -0.6056261, -3.041654, 1, 1, 1, 1, 1,
-0.7669382, 0.6991413, -0.4503545, 1, 1, 1, 1, 1,
-0.7653471, 0.004503929, -1.530644, 1, 1, 1, 1, 1,
-0.764622, 1.234809, 1.366096, 1, 1, 1, 1, 1,
-0.7642713, 0.9019807, -0.637886, 1, 1, 1, 1, 1,
-0.7633683, -2.210834, -3.038444, 1, 1, 1, 1, 1,
-0.763337, -0.2396747, -0.9991063, 1, 1, 1, 1, 1,
-0.7626023, -1.385931, -2.321667, 1, 1, 1, 1, 1,
-0.7619982, 0.5582298, 0.04777804, 1, 1, 1, 1, 1,
-0.7585555, 0.6238563, 0.2658555, 1, 1, 1, 1, 1,
-0.7458433, 0.1738394, -0.8396541, 1, 1, 1, 1, 1,
-0.7407033, -0.6432779, -2.906701, 1, 1, 1, 1, 1,
-0.7346253, -1.272603, -2.210692, 0, 0, 1, 1, 1,
-0.7341506, -0.5504003, -4.047501, 1, 0, 0, 1, 1,
-0.732899, -1.850025, -2.702272, 1, 0, 0, 1, 1,
-0.7318395, 0.7028118, 0.1093852, 1, 0, 0, 1, 1,
-0.7282892, 1.688911, 0.3380985, 1, 0, 0, 1, 1,
-0.7255324, -0.2049713, -2.552834, 1, 0, 0, 1, 1,
-0.71986, -0.6240755, -0.5670089, 0, 0, 0, 1, 1,
-0.7195366, -0.7390893, -4.01404, 0, 0, 0, 1, 1,
-0.7187699, -0.5954636, -1.25392, 0, 0, 0, 1, 1,
-0.7170641, 0.3089497, -3.910154, 0, 0, 0, 1, 1,
-0.7147644, -0.2916063, -1.255105, 0, 0, 0, 1, 1,
-0.7113818, -0.08034594, -2.251641, 0, 0, 0, 1, 1,
-0.7035556, 1.009558, -1.241752, 0, 0, 0, 1, 1,
-0.7009869, -1.147433, -3.720731, 1, 1, 1, 1, 1,
-0.7004829, 0.4416633, -3.559322, 1, 1, 1, 1, 1,
-0.6980756, 1.47333, -0.1658337, 1, 1, 1, 1, 1,
-0.6957686, 0.2240145, -0.3718538, 1, 1, 1, 1, 1,
-0.6946852, 1.0584, -1.945175, 1, 1, 1, 1, 1,
-0.6931273, -1.031668, -1.799585, 1, 1, 1, 1, 1,
-0.6866544, -0.9477385, -3.420742, 1, 1, 1, 1, 1,
-0.6763789, -0.2481972, -2.460539, 1, 1, 1, 1, 1,
-0.6736942, -0.002218788, -0.3130317, 1, 1, 1, 1, 1,
-0.6683846, -2.574675, -3.011057, 1, 1, 1, 1, 1,
-0.6647862, 1.094128, 0.4949135, 1, 1, 1, 1, 1,
-0.6645152, 0.04168653, -1.927167, 1, 1, 1, 1, 1,
-0.6614748, 0.3797081, -0.9981801, 1, 1, 1, 1, 1,
-0.6614094, 0.09931528, -1.560178, 1, 1, 1, 1, 1,
-0.661375, 1.12691, -0.02276028, 1, 1, 1, 1, 1,
-0.6601308, -1.476877, -3.405649, 0, 0, 1, 1, 1,
-0.6597475, -2.01923, -2.59868, 1, 0, 0, 1, 1,
-0.6533423, -0.3514741, -0.5995091, 1, 0, 0, 1, 1,
-0.6401926, -0.4811668, -1.698457, 1, 0, 0, 1, 1,
-0.6388555, 0.0859371, -1.026692, 1, 0, 0, 1, 1,
-0.6337667, 1.930266, -1.024971, 1, 0, 0, 1, 1,
-0.6173654, -0.01258049, -0.841699, 0, 0, 0, 1, 1,
-0.6164508, 0.2856343, -0.3232944, 0, 0, 0, 1, 1,
-0.6157886, 2.785216, -0.08403894, 0, 0, 0, 1, 1,
-0.6084398, -0.3417508, -1.807588, 0, 0, 0, 1, 1,
-0.6078718, -1.036787, -2.911912, 0, 0, 0, 1, 1,
-0.6041599, 1.30791, 0.5609608, 0, 0, 0, 1, 1,
-0.6033224, 0.3706247, -0.9786594, 0, 0, 0, 1, 1,
-0.6008167, 2.556591, -0.1468998, 1, 1, 1, 1, 1,
-0.5994903, -1.7678, -0.2143612, 1, 1, 1, 1, 1,
-0.5928633, -1.03587, -2.380829, 1, 1, 1, 1, 1,
-0.5889865, 0.7690266, -0.3545852, 1, 1, 1, 1, 1,
-0.5883207, 2.557526, 0.8129133, 1, 1, 1, 1, 1,
-0.5865784, 1.890196, -0.5362, 1, 1, 1, 1, 1,
-0.584508, -0.5333146, -3.155997, 1, 1, 1, 1, 1,
-0.5834678, 1.379319, -0.3379291, 1, 1, 1, 1, 1,
-0.5822189, 0.2606378, -1.232613, 1, 1, 1, 1, 1,
-0.5682976, -0.2008224, -1.595049, 1, 1, 1, 1, 1,
-0.5673439, -1.592677, -2.093975, 1, 1, 1, 1, 1,
-0.5668927, -1.884077, -1.919487, 1, 1, 1, 1, 1,
-0.561851, -0.9096184, -1.557869, 1, 1, 1, 1, 1,
-0.560315, -0.137762, -1.558488, 1, 1, 1, 1, 1,
-0.5554723, -1.170641, -2.233733, 1, 1, 1, 1, 1,
-0.5547848, 0.2900186, -0.8401849, 0, 0, 1, 1, 1,
-0.5542815, 0.3353994, -0.9889138, 1, 0, 0, 1, 1,
-0.5528646, 0.8641146, -0.1318813, 1, 0, 0, 1, 1,
-0.5527361, 0.6144166, 1.401086, 1, 0, 0, 1, 1,
-0.5483538, -1.121415, -2.473185, 1, 0, 0, 1, 1,
-0.5478277, -0.4068283, -0.6531466, 1, 0, 0, 1, 1,
-0.5462041, -1.086393, -2.951842, 0, 0, 0, 1, 1,
-0.5413262, -1.420956, -2.080683, 0, 0, 0, 1, 1,
-0.5301723, 0.1002398, -1.024723, 0, 0, 0, 1, 1,
-0.5297515, -0.7292367, -1.152792, 0, 0, 0, 1, 1,
-0.5191262, 0.8180697, 0.799345, 0, 0, 0, 1, 1,
-0.5177137, -0.6638977, -3.603169, 0, 0, 0, 1, 1,
-0.5150583, 0.8856168, 0.1109496, 0, 0, 0, 1, 1,
-0.5141704, 2.103152, -1.196465, 1, 1, 1, 1, 1,
-0.5132657, 0.2047232, -1.730095, 1, 1, 1, 1, 1,
-0.5115228, -1.148228, -3.003793, 1, 1, 1, 1, 1,
-0.5078987, 0.407836, -1.565525, 1, 1, 1, 1, 1,
-0.5056173, 0.972909, -1.422032, 1, 1, 1, 1, 1,
-0.5052632, -0.05861406, -2.037736, 1, 1, 1, 1, 1,
-0.5046515, -0.8387414, -1.881945, 1, 1, 1, 1, 1,
-0.503557, 0.5238482, -1.037913, 1, 1, 1, 1, 1,
-0.5020556, -0.4278377, -2.706249, 1, 1, 1, 1, 1,
-0.489641, -0.1561337, -0.3565171, 1, 1, 1, 1, 1,
-0.4892562, 1.552942, -0.4281032, 1, 1, 1, 1, 1,
-0.4794888, -0.2734936, -3.074608, 1, 1, 1, 1, 1,
-0.4705644, -0.1967451, -2.280478, 1, 1, 1, 1, 1,
-0.4601725, -1.965758, -4.45286, 1, 1, 1, 1, 1,
-0.4546714, 0.4230596, -1.138247, 1, 1, 1, 1, 1,
-0.4529496, -0.3845258, -3.015342, 0, 0, 1, 1, 1,
-0.4507802, -1.541322, -1.806442, 1, 0, 0, 1, 1,
-0.4475024, 0.5765529, -1.064579, 1, 0, 0, 1, 1,
-0.4473453, -1.690753, -3.405911, 1, 0, 0, 1, 1,
-0.4453492, 0.8626849, 0.1892908, 1, 0, 0, 1, 1,
-0.4435204, -0.1186334, -0.4298984, 1, 0, 0, 1, 1,
-0.432216, -0.00377651, -1.985389, 0, 0, 0, 1, 1,
-0.4275724, -0.433879, -4.055542, 0, 0, 0, 1, 1,
-0.4271427, -0.9850692, -3.403064, 0, 0, 0, 1, 1,
-0.4260018, 0.9360803, -1.607706, 0, 0, 0, 1, 1,
-0.4195135, 1.720675, 0.4505968, 0, 0, 0, 1, 1,
-0.41659, -0.9207277, -1.810301, 0, 0, 0, 1, 1,
-0.4149951, -0.8254488, -3.85066, 0, 0, 0, 1, 1,
-0.4144293, 0.3481065, -1.944272, 1, 1, 1, 1, 1,
-0.4143401, -0.3534584, -2.662326, 1, 1, 1, 1, 1,
-0.4131326, -1.705309, -5.676872, 1, 1, 1, 1, 1,
-0.4088529, 1.332147, 0.3478702, 1, 1, 1, 1, 1,
-0.4064768, 0.05803663, -1.46164, 1, 1, 1, 1, 1,
-0.4028118, 0.06031021, -1.371735, 1, 1, 1, 1, 1,
-0.3985066, 0.22333, -3.499246, 1, 1, 1, 1, 1,
-0.3882846, 0.823851, 2.331721, 1, 1, 1, 1, 1,
-0.3869683, 1.248426, 0.9943873, 1, 1, 1, 1, 1,
-0.3854698, -1.988217, -2.419501, 1, 1, 1, 1, 1,
-0.3842072, 0.2633116, 0.3724823, 1, 1, 1, 1, 1,
-0.384177, 0.07575433, -0.8546032, 1, 1, 1, 1, 1,
-0.3731584, -0.6750414, -1.125664, 1, 1, 1, 1, 1,
-0.3710034, -0.6274034, -2.569315, 1, 1, 1, 1, 1,
-0.3705411, -0.858753, -2.32737, 1, 1, 1, 1, 1,
-0.3674009, -0.6147673, -1.770387, 0, 0, 1, 1, 1,
-0.3659424, 0.8870667, -1.335618, 1, 0, 0, 1, 1,
-0.3532057, -0.939263, -3.45305, 1, 0, 0, 1, 1,
-0.3481687, -0.41461, -2.820853, 1, 0, 0, 1, 1,
-0.3460276, 0.07811071, -1.718419, 1, 0, 0, 1, 1,
-0.3387503, 0.5106733, -0.8549341, 1, 0, 0, 1, 1,
-0.3345802, 0.3386015, -1.703289, 0, 0, 0, 1, 1,
-0.3316836, -0.6423005, -1.362719, 0, 0, 0, 1, 1,
-0.3301953, -0.2996142, -3.078061, 0, 0, 0, 1, 1,
-0.329746, -0.246186, -1.067847, 0, 0, 0, 1, 1,
-0.324655, -1.157574, -1.97375, 0, 0, 0, 1, 1,
-0.3231092, -0.5978729, -2.215099, 0, 0, 0, 1, 1,
-0.3212605, 0.5670595, -0.0166764, 0, 0, 0, 1, 1,
-0.320473, -0.3196605, -3.006837, 1, 1, 1, 1, 1,
-0.3197159, 0.7969475, -0.4694133, 1, 1, 1, 1, 1,
-0.3191539, 0.1326098, -0.8810683, 1, 1, 1, 1, 1,
-0.3180304, -0.4038447, -3.163714, 1, 1, 1, 1, 1,
-0.3076086, 0.8584321, -0.296906, 1, 1, 1, 1, 1,
-0.3059781, -0.2139845, -2.876598, 1, 1, 1, 1, 1,
-0.3015586, -1.45248, -3.269518, 1, 1, 1, 1, 1,
-0.2973894, 0.3545211, 0.5058135, 1, 1, 1, 1, 1,
-0.2958399, -0.9581493, -1.124884, 1, 1, 1, 1, 1,
-0.2884456, 0.9502091, -0.5651411, 1, 1, 1, 1, 1,
-0.2881626, -0.7159952, -1.995049, 1, 1, 1, 1, 1,
-0.2867562, -0.6462258, -3.754326, 1, 1, 1, 1, 1,
-0.2855848, 0.4067658, 1.665014, 1, 1, 1, 1, 1,
-0.2850059, -0.2100402, -1.456581, 1, 1, 1, 1, 1,
-0.2843103, -2.28942, -3.611434, 1, 1, 1, 1, 1,
-0.2787063, -0.2972012, -1.836304, 0, 0, 1, 1, 1,
-0.2753782, -0.2800313, -1.078378, 1, 0, 0, 1, 1,
-0.2749776, 1.69947, 1.071156, 1, 0, 0, 1, 1,
-0.2730591, 2.965934, 1.085863, 1, 0, 0, 1, 1,
-0.2728424, 0.9404871, -1.006529, 1, 0, 0, 1, 1,
-0.2727306, -0.6998723, -3.250633, 1, 0, 0, 1, 1,
-0.267921, 3.490075, 0.8077211, 0, 0, 0, 1, 1,
-0.267864, 0.4367295, -0.3558333, 0, 0, 0, 1, 1,
-0.2662444, -0.7144181, -3.355878, 0, 0, 0, 1, 1,
-0.2614525, -0.4798071, -1.527094, 0, 0, 0, 1, 1,
-0.260494, -0.3655949, -0.9807561, 0, 0, 0, 1, 1,
-0.2589812, -1.85413, -2.110949, 0, 0, 0, 1, 1,
-0.2589686, 0.03926376, -0.4280086, 0, 0, 0, 1, 1,
-0.2560436, 0.3403658, -0.133182, 1, 1, 1, 1, 1,
-0.2559682, 0.5627695, -2.776595, 1, 1, 1, 1, 1,
-0.2487783, -0.8609155, -2.59642, 1, 1, 1, 1, 1,
-0.244977, 0.2811896, -2.501217, 1, 1, 1, 1, 1,
-0.2441862, -0.5084512, -2.037002, 1, 1, 1, 1, 1,
-0.2403541, 0.9511243, 1.316348, 1, 1, 1, 1, 1,
-0.2373789, -0.8743401, -2.815797, 1, 1, 1, 1, 1,
-0.233593, 0.09711145, 0.2828103, 1, 1, 1, 1, 1,
-0.2330548, 1.026685, 0.2902554, 1, 1, 1, 1, 1,
-0.2276568, 1.250148, -0.1457126, 1, 1, 1, 1, 1,
-0.2265007, -0.8067882, -1.985428, 1, 1, 1, 1, 1,
-0.2223682, -1.00192, -3.897025, 1, 1, 1, 1, 1,
-0.2213556, 0.04073572, 0.2348156, 1, 1, 1, 1, 1,
-0.2211903, -0.8241459, -2.284476, 1, 1, 1, 1, 1,
-0.2179765, 0.2793699, -1.420721, 1, 1, 1, 1, 1,
-0.21644, 0.5211062, -1.388714, 0, 0, 1, 1, 1,
-0.2117938, -2.266361, -2.740647, 1, 0, 0, 1, 1,
-0.211674, -1.068978, -3.417988, 1, 0, 0, 1, 1,
-0.2090781, -0.5849364, -1.809868, 1, 0, 0, 1, 1,
-0.2079999, 0.5298347, 0.1028617, 1, 0, 0, 1, 1,
-0.2029194, -0.5435151, -1.212726, 1, 0, 0, 1, 1,
-0.2018375, 0.4496061, 1.492884, 0, 0, 0, 1, 1,
-0.2013222, 0.8163115, -0.6976913, 0, 0, 0, 1, 1,
-0.199524, -0.1762845, -2.537576, 0, 0, 0, 1, 1,
-0.1993658, 0.7580728, -0.1655011, 0, 0, 0, 1, 1,
-0.1979578, -0.07234505, -0.952067, 0, 0, 0, 1, 1,
-0.1970468, 0.2601136, -0.8941352, 0, 0, 0, 1, 1,
-0.1929705, 0.4437596, 0.6464351, 0, 0, 0, 1, 1,
-0.1852217, -0.9217873, -3.519524, 1, 1, 1, 1, 1,
-0.1842367, -2.020345, -3.23507, 1, 1, 1, 1, 1,
-0.1839274, -0.1777381, -2.842129, 1, 1, 1, 1, 1,
-0.1818054, -1.098622, -2.549544, 1, 1, 1, 1, 1,
-0.1789117, -0.3531238, -2.723992, 1, 1, 1, 1, 1,
-0.1789071, 0.06908026, -1.25427, 1, 1, 1, 1, 1,
-0.1774226, -0.5260549, -2.290999, 1, 1, 1, 1, 1,
-0.1747924, -0.3814819, -0.4753773, 1, 1, 1, 1, 1,
-0.1745305, 0.4675839, -0.8637957, 1, 1, 1, 1, 1,
-0.1714042, 0.7624474, 0.9830408, 1, 1, 1, 1, 1,
-0.1698305, -1.31343, -3.409941, 1, 1, 1, 1, 1,
-0.1690283, 2.409402, 0.7607049, 1, 1, 1, 1, 1,
-0.1643454, -0.3952602, -1.93426, 1, 1, 1, 1, 1,
-0.161175, 0.5509387, -0.1138708, 1, 1, 1, 1, 1,
-0.1606739, 1.008198, 0.02066659, 1, 1, 1, 1, 1,
-0.1570082, 0.5053345, -1.296017, 0, 0, 1, 1, 1,
-0.1519941, -0.3906149, -2.736327, 1, 0, 0, 1, 1,
-0.1510442, 1.37109, -0.8678251, 1, 0, 0, 1, 1,
-0.15041, 0.9440246, -0.2273127, 1, 0, 0, 1, 1,
-0.1498784, -0.1534301, -4.267974, 1, 0, 0, 1, 1,
-0.1458769, -1.644639, -2.648112, 1, 0, 0, 1, 1,
-0.145576, -1.67191, -2.860679, 0, 0, 0, 1, 1,
-0.1455286, 0.699285, -2.858305, 0, 0, 0, 1, 1,
-0.1423532, 0.02179789, -1.433252, 0, 0, 0, 1, 1,
-0.1408186, -1.256598, -2.786844, 0, 0, 0, 1, 1,
-0.1395729, 1.154337, -0.8533194, 0, 0, 0, 1, 1,
-0.1362473, -0.9547983, -4.971052, 0, 0, 0, 1, 1,
-0.1347619, -0.248843, -4.025926, 0, 0, 0, 1, 1,
-0.1344043, -0.2197668, -1.271971, 1, 1, 1, 1, 1,
-0.1340688, -0.6289401, 0.1425918, 1, 1, 1, 1, 1,
-0.1308331, -1.06769, -3.855273, 1, 1, 1, 1, 1,
-0.1259413, -1.99849, -3.906258, 1, 1, 1, 1, 1,
-0.1247156, -0.1398352, -3.059446, 1, 1, 1, 1, 1,
-0.1233607, 0.7819002, 1.008961, 1, 1, 1, 1, 1,
-0.1204437, -0.3919792, -2.963579, 1, 1, 1, 1, 1,
-0.1134648, 0.6046878, -2.288849, 1, 1, 1, 1, 1,
-0.1114815, 1.886067, 0.7586815, 1, 1, 1, 1, 1,
-0.1101274, -0.119376, -0.9460919, 1, 1, 1, 1, 1,
-0.1092661, 1.285744, 0.2305305, 1, 1, 1, 1, 1,
-0.1090822, -0.1081444, -2.242333, 1, 1, 1, 1, 1,
-0.1068279, -0.755688, -2.379684, 1, 1, 1, 1, 1,
-0.1063438, 0.1343836, 0.1133835, 1, 1, 1, 1, 1,
-0.1055719, -0.4635167, -2.867446, 1, 1, 1, 1, 1,
-0.1034497, 0.2652178, 0.4048115, 0, 0, 1, 1, 1,
-0.1025814, 0.02326182, 0.3417425, 1, 0, 0, 1, 1,
-0.1007715, -2.569642, -4.232186, 1, 0, 0, 1, 1,
-0.09939857, -0.3502746, -3.742017, 1, 0, 0, 1, 1,
-0.09929679, 0.3406579, 1.674049, 1, 0, 0, 1, 1,
-0.09822984, -0.4714664, -4.055142, 1, 0, 0, 1, 1,
-0.09768304, -0.4403507, -3.736667, 0, 0, 0, 1, 1,
-0.09578705, 0.9490672, -0.3063791, 0, 0, 0, 1, 1,
-0.09166498, 0.1431782, -1.502337, 0, 0, 0, 1, 1,
-0.08779645, 0.394953, -0.4198773, 0, 0, 0, 1, 1,
-0.08335689, 1.916628, -1.076555, 0, 0, 0, 1, 1,
-0.0820963, 0.4314116, -1.372673, 0, 0, 0, 1, 1,
-0.08162607, -0.476796, -2.204243, 0, 0, 0, 1, 1,
-0.07997815, -0.3131806, -3.163546, 1, 1, 1, 1, 1,
-0.07937454, 1.512107, 0.5456998, 1, 1, 1, 1, 1,
-0.07597791, -0.6524082, -3.783024, 1, 1, 1, 1, 1,
-0.06999451, 0.4258892, 0.9928115, 1, 1, 1, 1, 1,
-0.06173764, 0.3374855, 1.530844, 1, 1, 1, 1, 1,
-0.0593243, -0.09017613, -1.528543, 1, 1, 1, 1, 1,
-0.05913375, 0.7342796, 0.02471893, 1, 1, 1, 1, 1,
-0.05671966, -0.1291058, -2.889051, 1, 1, 1, 1, 1,
-0.0527863, 0.05555721, -1.667854, 1, 1, 1, 1, 1,
-0.05219706, -0.272461, -2.182958, 1, 1, 1, 1, 1,
-0.05046642, -0.2824146, -4.506312, 1, 1, 1, 1, 1,
-0.04820047, 0.2686653, 2.341639, 1, 1, 1, 1, 1,
-0.04233169, 0.1683875, -1.302768, 1, 1, 1, 1, 1,
-0.04007188, 1.085205, 1.919832, 1, 1, 1, 1, 1,
-0.03627469, -0.9501914, -2.028568, 1, 1, 1, 1, 1,
-0.03202888, 0.7519912, -0.6680031, 0, 0, 1, 1, 1,
-0.03161416, 0.05292449, 0.1959213, 1, 0, 0, 1, 1,
-0.03001136, -0.7114491, -4.1122, 1, 0, 0, 1, 1,
-0.0299529, -1.911799, -2.86477, 1, 0, 0, 1, 1,
-0.029213, 0.5549876, -1.267316, 1, 0, 0, 1, 1,
-0.02637247, -0.8673481, -1.964355, 1, 0, 0, 1, 1,
-0.02356848, -0.1888569, -2.915661, 0, 0, 0, 1, 1,
-0.02154736, 2.706719, 0.639511, 0, 0, 0, 1, 1,
-0.02133391, 0.4034649, -0.6942146, 0, 0, 0, 1, 1,
-0.01534939, -1.61286, -3.43462, 0, 0, 0, 1, 1,
-0.01459418, -1.834131, -2.55083, 0, 0, 0, 1, 1,
-0.01319662, -0.2567253, -3.90756, 0, 0, 0, 1, 1,
-0.01247935, 0.7019675, 0.07645128, 0, 0, 0, 1, 1,
-0.0117108, -0.4646406, -4.339088, 1, 1, 1, 1, 1,
-0.008194606, 0.1393458, 0.2867008, 1, 1, 1, 1, 1,
-0.005842642, -2.695266, -2.898103, 1, 1, 1, 1, 1,
0.006502252, 0.9243219, -1.1039, 1, 1, 1, 1, 1,
0.009186282, -0.4878815, 2.903837, 1, 1, 1, 1, 1,
0.009973483, 0.431448, 0.7724738, 1, 1, 1, 1, 1,
0.01139758, -1.492709, 2.732894, 1, 1, 1, 1, 1,
0.01524905, 0.6794301, 0.7166347, 1, 1, 1, 1, 1,
0.02288269, -1.834268, 2.865187, 1, 1, 1, 1, 1,
0.02343318, 0.8338246, -1.165795, 1, 1, 1, 1, 1,
0.02600343, -0.7617848, 1.833115, 1, 1, 1, 1, 1,
0.02944062, 6.070817e-05, 3.150179, 1, 1, 1, 1, 1,
0.03102717, -1.472717, 2.265944, 1, 1, 1, 1, 1,
0.03377594, 0.007244794, 1.499345, 1, 1, 1, 1, 1,
0.03396364, 2.147839, -0.4061294, 1, 1, 1, 1, 1,
0.03435541, -0.3635167, 2.428793, 0, 0, 1, 1, 1,
0.03547667, 0.4200953, 1.253818, 1, 0, 0, 1, 1,
0.03634549, -0.7641467, 3.887165, 1, 0, 0, 1, 1,
0.03797832, 0.4494573, -0.007730468, 1, 0, 0, 1, 1,
0.03895167, -0.5097147, 3.28957, 1, 0, 0, 1, 1,
0.04853642, -1.536074, 2.220466, 1, 0, 0, 1, 1,
0.05369079, -0.5761519, 3.288152, 0, 0, 0, 1, 1,
0.0547681, 0.4136852, 0.318332, 0, 0, 0, 1, 1,
0.05649495, 0.385293, -0.5484776, 0, 0, 0, 1, 1,
0.06442817, -1.173593, 4.051385, 0, 0, 0, 1, 1,
0.07090785, -0.703263, 2.987707, 0, 0, 0, 1, 1,
0.07217714, -0.0840301, 2.380876, 0, 0, 0, 1, 1,
0.07507188, 2.068847, -1.291569, 0, 0, 0, 1, 1,
0.08131785, 2.185901, 1.709372, 1, 1, 1, 1, 1,
0.08269892, -0.80347, 5.602585, 1, 1, 1, 1, 1,
0.086419, 0.6620048, 0.2722433, 1, 1, 1, 1, 1,
0.09470793, -1.815793, 2.011061, 1, 1, 1, 1, 1,
0.09471852, 0.3648378, -0.2723153, 1, 1, 1, 1, 1,
0.09491296, -0.824278, 2.641126, 1, 1, 1, 1, 1,
0.09560272, 0.2681735, 0.1487649, 1, 1, 1, 1, 1,
0.09631757, -1.263735, 4.737547, 1, 1, 1, 1, 1,
0.09732508, -0.2358077, 2.561758, 1, 1, 1, 1, 1,
0.1023194, 0.2597823, -0.4050929, 1, 1, 1, 1, 1,
0.1032721, -0.4943856, 2.786753, 1, 1, 1, 1, 1,
0.1056043, 0.8105775, 0.1555169, 1, 1, 1, 1, 1,
0.1060873, -0.1161066, 3.919485, 1, 1, 1, 1, 1,
0.1080148, -0.2894207, 2.834395, 1, 1, 1, 1, 1,
0.1189461, -0.6070579, 2.704075, 1, 1, 1, 1, 1,
0.1258184, -0.08125475, 2.094684, 0, 0, 1, 1, 1,
0.1289914, -0.1889744, 3.000277, 1, 0, 0, 1, 1,
0.1304061, 0.8242714, -1.519383, 1, 0, 0, 1, 1,
0.1309828, 0.5588079, -0.2419787, 1, 0, 0, 1, 1,
0.1313431, -0.6827772, 1.944656, 1, 0, 0, 1, 1,
0.135399, -0.4351607, 1.470764, 1, 0, 0, 1, 1,
0.1354011, -0.6379222, 2.674392, 0, 0, 0, 1, 1,
0.1362414, -0.0334104, 1.771879, 0, 0, 0, 1, 1,
0.1374761, 0.7473495, 1.288647, 0, 0, 0, 1, 1,
0.1397357, 1.252183, -1.02816, 0, 0, 0, 1, 1,
0.1460595, -1.702474, 2.626027, 0, 0, 0, 1, 1,
0.1486182, 1.041037, 0.2593207, 0, 0, 0, 1, 1,
0.14905, 0.3951482, 2.092392, 0, 0, 0, 1, 1,
0.1495871, -1.870126, 2.112128, 1, 1, 1, 1, 1,
0.1500262, -1.721812, 2.501856, 1, 1, 1, 1, 1,
0.1542798, 0.9202073, -0.06435613, 1, 1, 1, 1, 1,
0.1562715, -1.473274, 4.876797, 1, 1, 1, 1, 1,
0.1563114, -0.375743, 0.7262614, 1, 1, 1, 1, 1,
0.1577938, -0.5847318, 4.283128, 1, 1, 1, 1, 1,
0.1599289, 0.230089, -0.6485669, 1, 1, 1, 1, 1,
0.1620409, -1.713318, 2.951202, 1, 1, 1, 1, 1,
0.1651833, 0.6256742, 0.5400655, 1, 1, 1, 1, 1,
0.1666075, -0.05790189, 2.460514, 1, 1, 1, 1, 1,
0.1681888, 1.358906, 1.41478, 1, 1, 1, 1, 1,
0.1691115, -0.8269464, 3.203153, 1, 1, 1, 1, 1,
0.1718056, 0.04965015, 1.014716, 1, 1, 1, 1, 1,
0.1741498, -1.382039, 3.632515, 1, 1, 1, 1, 1,
0.1758611, 0.7077316, 0.3166151, 1, 1, 1, 1, 1,
0.1765909, -0.4863889, 1.611679, 0, 0, 1, 1, 1,
0.1769625, -1.238014, 2.56822, 1, 0, 0, 1, 1,
0.179392, 0.789646, -1.08772, 1, 0, 0, 1, 1,
0.1800261, -0.3451266, 0.864439, 1, 0, 0, 1, 1,
0.1818046, 0.0415595, 1.58669, 1, 0, 0, 1, 1,
0.1855986, 1.463725, -1.343616, 1, 0, 0, 1, 1,
0.1894466, 0.02807997, 1.482488, 0, 0, 0, 1, 1,
0.1897864, -0.4003361, 3.148483, 0, 0, 0, 1, 1,
0.1925936, 2.273914, 0.009060952, 0, 0, 0, 1, 1,
0.1934065, -0.8727686, 1.938141, 0, 0, 0, 1, 1,
0.1936412, -0.2004061, 0.6925954, 0, 0, 0, 1, 1,
0.1940114, -1.228737, 1.711781, 0, 0, 0, 1, 1,
0.1996688, 0.1672931, 0.3084313, 0, 0, 0, 1, 1,
0.2013645, -1.932047, 2.954491, 1, 1, 1, 1, 1,
0.2175952, -0.244419, 6.159824, 1, 1, 1, 1, 1,
0.2258571, 1.371583, 1.27097, 1, 1, 1, 1, 1,
0.2263821, 0.6506852, 1.059619, 1, 1, 1, 1, 1,
0.2268753, -0.1881569, 2.309465, 1, 1, 1, 1, 1,
0.233359, 0.4697913, 0.1898605, 1, 1, 1, 1, 1,
0.2342457, -1.860846, 3.466754, 1, 1, 1, 1, 1,
0.2352705, -1.931867, 2.424001, 1, 1, 1, 1, 1,
0.2353275, -0.3585968, 3.457753, 1, 1, 1, 1, 1,
0.2378915, 0.588033, 1.000545, 1, 1, 1, 1, 1,
0.2420944, 0.1036926, 1.030024, 1, 1, 1, 1, 1,
0.2430777, 0.3808086, 0.8115658, 1, 1, 1, 1, 1,
0.2493804, 1.218544, 0.3568598, 1, 1, 1, 1, 1,
0.2510767, -1.173941, 4.030004, 1, 1, 1, 1, 1,
0.251303, -0.4182009, 1.538194, 1, 1, 1, 1, 1,
0.254119, -1.532672, 2.70408, 0, 0, 1, 1, 1,
0.2599666, -1.194356, 1.263745, 1, 0, 0, 1, 1,
0.2601421, 0.5267521, 1.631267, 1, 0, 0, 1, 1,
0.2645365, 0.7326333, 2.920128, 1, 0, 0, 1, 1,
0.2647106, -1.410337, 1.561195, 1, 0, 0, 1, 1,
0.2707581, -0.7552866, 3.004848, 1, 0, 0, 1, 1,
0.2734743, 1.043104, 0.09666099, 0, 0, 0, 1, 1,
0.2811927, -0.8664711, 3.847758, 0, 0, 0, 1, 1,
0.2814359, 0.0117543, 1.696235, 0, 0, 0, 1, 1,
0.283366, 1.009802, 1.051549, 0, 0, 0, 1, 1,
0.2839237, 0.05375842, 0.9720681, 0, 0, 0, 1, 1,
0.2882283, -0.8471109, 3.1881, 0, 0, 0, 1, 1,
0.2902348, 2.24072, 2.589083, 0, 0, 0, 1, 1,
0.2928033, 0.4583964, -0.7032176, 1, 1, 1, 1, 1,
0.2937054, -0.09480501, 2.614269, 1, 1, 1, 1, 1,
0.2980832, 0.9343682, -0.5844271, 1, 1, 1, 1, 1,
0.3029125, 1.572319, 1.295254, 1, 1, 1, 1, 1,
0.3112483, 0.9787012, 0.8685533, 1, 1, 1, 1, 1,
0.3129249, -0.7680559, 1.755161, 1, 1, 1, 1, 1,
0.313768, 0.747452, 2.705352, 1, 1, 1, 1, 1,
0.3216002, -0.09474403, 2.720657, 1, 1, 1, 1, 1,
0.3256243, -0.00859551, 1.026105, 1, 1, 1, 1, 1,
0.3292571, -1.208689, 3.459868, 1, 1, 1, 1, 1,
0.3327377, 1.446661, 0.5118854, 1, 1, 1, 1, 1,
0.3327488, -0.2502312, 1.586745, 1, 1, 1, 1, 1,
0.3348201, 0.4834875, -0.4680631, 1, 1, 1, 1, 1,
0.3350753, 0.934978, 0.8611608, 1, 1, 1, 1, 1,
0.3366814, 0.7782942, -1.609072, 1, 1, 1, 1, 1,
0.3441543, -1.956289, 2.694168, 0, 0, 1, 1, 1,
0.3541023, -1.155321, 2.789975, 1, 0, 0, 1, 1,
0.3549626, 1.72102, 0.9769896, 1, 0, 0, 1, 1,
0.3581372, 1.324186, -1.427975, 1, 0, 0, 1, 1,
0.3582728, -0.6766404, 1.919724, 1, 0, 0, 1, 1,
0.358628, -1.727572, 3.646043, 1, 0, 0, 1, 1,
0.3652979, -1.870481, 1.506514, 0, 0, 0, 1, 1,
0.3684976, 0.6100264, 0.4505446, 0, 0, 0, 1, 1,
0.3715037, -0.5507465, 1.757982, 0, 0, 0, 1, 1,
0.3721892, 0.4181348, 0.8236746, 0, 0, 0, 1, 1,
0.3745621, 0.2031418, -0.3536947, 0, 0, 0, 1, 1,
0.3784822, 0.8363271, 0.8107005, 0, 0, 0, 1, 1,
0.3817627, -0.5694351, 2.674292, 0, 0, 0, 1, 1,
0.3832751, -0.9819635, 3.287099, 1, 1, 1, 1, 1,
0.3834598, -0.4435919, 3.27739, 1, 1, 1, 1, 1,
0.3848838, 1.13597, 1.198782, 1, 1, 1, 1, 1,
0.3868073, 0.04342822, 1.966217, 1, 1, 1, 1, 1,
0.3883096, 1.279662, -0.8517318, 1, 1, 1, 1, 1,
0.389466, -2.288242, 1.024091, 1, 1, 1, 1, 1,
0.3921794, 0.7356699, -0.8453532, 1, 1, 1, 1, 1,
0.3949177, 0.5464178, 0.5937361, 1, 1, 1, 1, 1,
0.3953992, 0.7093409, -0.1057706, 1, 1, 1, 1, 1,
0.3955639, 0.1440227, -0.6057507, 1, 1, 1, 1, 1,
0.3964979, 0.04529966, 2.786803, 1, 1, 1, 1, 1,
0.3980776, -0.02456969, 0.1131134, 1, 1, 1, 1, 1,
0.4015112, 1.134234, -0.8707826, 1, 1, 1, 1, 1,
0.4028591, -1.838303, 2.656588, 1, 1, 1, 1, 1,
0.4037377, -0.9759361, 0.5680531, 1, 1, 1, 1, 1,
0.4069563, -1.345237, 1.943003, 0, 0, 1, 1, 1,
0.4133767, 0.5102996, 1.623725, 1, 0, 0, 1, 1,
0.4155222, -0.7053282, 2.902538, 1, 0, 0, 1, 1,
0.4182225, 0.005930428, 2.751548, 1, 0, 0, 1, 1,
0.4235356, 1.94326, -0.416301, 1, 0, 0, 1, 1,
0.4238881, -0.1709272, 0.8622485, 1, 0, 0, 1, 1,
0.4315942, -0.3554071, 1.189006, 0, 0, 0, 1, 1,
0.4464434, 0.4468927, 1.094352, 0, 0, 0, 1, 1,
0.4532261, 0.4737009, -0.5542498, 0, 0, 0, 1, 1,
0.4535699, 0.314806, 1.339687, 0, 0, 0, 1, 1,
0.4572334, 0.3410046, 1.366872, 0, 0, 0, 1, 1,
0.4607208, -0.3319206, 3.236346, 0, 0, 0, 1, 1,
0.4616841, 1.843879, 0.4038553, 0, 0, 0, 1, 1,
0.4643629, -0.1577082, 2.685683, 1, 1, 1, 1, 1,
0.4655924, 0.7378305, 1.213789, 1, 1, 1, 1, 1,
0.468796, -1.503403, 1.597431, 1, 1, 1, 1, 1,
0.4695786, 0.9713011, -0.7305766, 1, 1, 1, 1, 1,
0.4735153, 0.2430321, 2.166441, 1, 1, 1, 1, 1,
0.4787519, -0.5128772, 2.086328, 1, 1, 1, 1, 1,
0.4870766, 1.691261, 0.9939489, 1, 1, 1, 1, 1,
0.488022, -2.040824, 4.515037, 1, 1, 1, 1, 1,
0.4882629, 1.683872, 1.467497, 1, 1, 1, 1, 1,
0.490185, -1.358425, 2.987634, 1, 1, 1, 1, 1,
0.492965, 0.5309507, -0.2900342, 1, 1, 1, 1, 1,
0.4974541, 0.2903043, 1.457323, 1, 1, 1, 1, 1,
0.5147783, -0.1518984, 0.5506483, 1, 1, 1, 1, 1,
0.5176246, -1.919462, 4.442017, 1, 1, 1, 1, 1,
0.5211985, 2.151728, 0.225714, 1, 1, 1, 1, 1,
0.5229542, -0.2923229, 2.008981, 0, 0, 1, 1, 1,
0.5251504, -0.6931636, 2.385259, 1, 0, 0, 1, 1,
0.52622, -0.886572, 4.092477, 1, 0, 0, 1, 1,
0.5376216, 0.528454, 0.6137376, 1, 0, 0, 1, 1,
0.5424471, -0.4863057, 2.203967, 1, 0, 0, 1, 1,
0.545066, 0.3605213, 0.1793629, 1, 0, 0, 1, 1,
0.5519159, -0.5272755, 1.634975, 0, 0, 0, 1, 1,
0.5523221, 0.4152683, 1.445066, 0, 0, 0, 1, 1,
0.5560732, 0.2106856, 1.553555, 0, 0, 0, 1, 1,
0.5572259, 0.9324316, 0.8902498, 0, 0, 0, 1, 1,
0.5573008, -1.592768, 2.634568, 0, 0, 0, 1, 1,
0.5583026, -0.4057654, 2.517152, 0, 0, 0, 1, 1,
0.5701345, 0.7219229, 1.67232, 0, 0, 0, 1, 1,
0.5714688, 0.3550776, 1.66042, 1, 1, 1, 1, 1,
0.5720744, -0.06696915, 0.4398117, 1, 1, 1, 1, 1,
0.5775017, 0.8886137, -0.5871832, 1, 1, 1, 1, 1,
0.5775641, 0.5352951, 0.5609039, 1, 1, 1, 1, 1,
0.5776954, 0.4415568, 1.25234, 1, 1, 1, 1, 1,
0.5779236, -0.8353457, 1.09566, 1, 1, 1, 1, 1,
0.5789645, -0.9935024, 2.767445, 1, 1, 1, 1, 1,
0.5806848, 1.415604, 0.4971042, 1, 1, 1, 1, 1,
0.5858427, -2.241979, 2.956258, 1, 1, 1, 1, 1,
0.5878446, 2.212825, -0.7546253, 1, 1, 1, 1, 1,
0.5932794, 0.3094198, 0.7687425, 1, 1, 1, 1, 1,
0.593731, -0.8339655, 3.327309, 1, 1, 1, 1, 1,
0.5947109, 1.156892, 1.660259, 1, 1, 1, 1, 1,
0.5973018, 0.9925979, 0.6673446, 1, 1, 1, 1, 1,
0.5986332, -0.646055, 2.948567, 1, 1, 1, 1, 1,
0.604021, 1.585778, -0.2912923, 0, 0, 1, 1, 1,
0.6051641, 0.3915282, 0.6571782, 1, 0, 0, 1, 1,
0.6055171, 0.3844741, 0.2798665, 1, 0, 0, 1, 1,
0.6056144, 0.09076124, 0.4619386, 1, 0, 0, 1, 1,
0.6062108, 1.349557, -1.945256, 1, 0, 0, 1, 1,
0.6076406, -0.8517507, 1.906868, 1, 0, 0, 1, 1,
0.6077069, 1.665134, -0.1190706, 0, 0, 0, 1, 1,
0.6093709, 0.2240087, 0.4479942, 0, 0, 0, 1, 1,
0.6131513, 0.9045839, 2.298073, 0, 0, 0, 1, 1,
0.6134028, -0.03696762, -0.6428267, 0, 0, 0, 1, 1,
0.6148038, 0.6175914, 1.13911, 0, 0, 0, 1, 1,
0.6149395, 1.550104, 0.4007728, 0, 0, 0, 1, 1,
0.615791, 0.07241858, 2.81665, 0, 0, 0, 1, 1,
0.6158828, -0.05175915, 1.118113, 1, 1, 1, 1, 1,
0.6162613, -0.9668483, 3.765175, 1, 1, 1, 1, 1,
0.6180326, -1.87872, 2.926778, 1, 1, 1, 1, 1,
0.6200522, -1.128281, 2.937113, 1, 1, 1, 1, 1,
0.6203555, 0.2191995, 0.7024388, 1, 1, 1, 1, 1,
0.6255898, 0.3600541, 0.9253595, 1, 1, 1, 1, 1,
0.6328571, -2.014815, 2.944575, 1, 1, 1, 1, 1,
0.6358523, 0.5349307, 1.279871, 1, 1, 1, 1, 1,
0.6446665, 0.8655338, 0.9349402, 1, 1, 1, 1, 1,
0.6513288, -1.052989, 2.2977, 1, 1, 1, 1, 1,
0.6533723, -0.9135028, 4.459879, 1, 1, 1, 1, 1,
0.6593839, -0.4315844, 3.659329, 1, 1, 1, 1, 1,
0.6600232, -0.4367003, 1.968731, 1, 1, 1, 1, 1,
0.661979, -0.9327114, 0.1832062, 1, 1, 1, 1, 1,
0.6676387, 0.8566629, 0.4541401, 1, 1, 1, 1, 1,
0.6735425, 0.2404207, 1.945542, 0, 0, 1, 1, 1,
0.6761283, -0.0614226, 0.8515778, 1, 0, 0, 1, 1,
0.6825014, -0.2315901, 2.209725, 1, 0, 0, 1, 1,
0.6939948, 1.058876, 0.06150819, 1, 0, 0, 1, 1,
0.6974934, 1.432776, 0.3803489, 1, 0, 0, 1, 1,
0.7005072, 1.037996, 2.668377, 1, 0, 0, 1, 1,
0.7066302, -1.336622, 1.159538, 0, 0, 0, 1, 1,
0.7111465, 0.8644818, 1.169102, 0, 0, 0, 1, 1,
0.7129984, -0.2682606, 2.401344, 0, 0, 0, 1, 1,
0.7233257, 1.725213, -0.4087645, 0, 0, 0, 1, 1,
0.7284371, 0.3318849, 1.069183, 0, 0, 0, 1, 1,
0.7354766, 1.658181, 0.549744, 0, 0, 0, 1, 1,
0.7367359, 0.6702028, 1.653227, 0, 0, 0, 1, 1,
0.740047, -0.2285327, 1.141558, 1, 1, 1, 1, 1,
0.740824, 0.9401085, 1.402482, 1, 1, 1, 1, 1,
0.7417435, 1.685784, -0.1311292, 1, 1, 1, 1, 1,
0.7517233, 0.2416445, 2.195144, 1, 1, 1, 1, 1,
0.7691546, -0.2002008, 2.885737, 1, 1, 1, 1, 1,
0.7730539, 1.026179, 1.865998, 1, 1, 1, 1, 1,
0.7733674, 0.6710288, 0.427363, 1, 1, 1, 1, 1,
0.7736715, -0.4899601, 1.680594, 1, 1, 1, 1, 1,
0.7746916, -1.019339, 2.746029, 1, 1, 1, 1, 1,
0.7762114, 0.5112954, -0.1436345, 1, 1, 1, 1, 1,
0.7814919, -1.446841, 2.304785, 1, 1, 1, 1, 1,
0.7828727, 1.022424, -0.5863779, 1, 1, 1, 1, 1,
0.7872046, 1.482025, -1.80069, 1, 1, 1, 1, 1,
0.7881589, 0.8992578, 0.2994328, 1, 1, 1, 1, 1,
0.7884694, 1.600149, -0.4585449, 1, 1, 1, 1, 1,
0.7885326, -0.2204321, 2.437557, 0, 0, 1, 1, 1,
0.7889407, -1.22001, 1.96542, 1, 0, 0, 1, 1,
0.7914183, 0.4134832, -0.06482582, 1, 0, 0, 1, 1,
0.7932597, -0.2475444, 2.376654, 1, 0, 0, 1, 1,
0.7945309, -0.03361104, 2.109602, 1, 0, 0, 1, 1,
0.8012322, -0.73878, 3.632272, 1, 0, 0, 1, 1,
0.8069272, -0.4593918, 2.190485, 0, 0, 0, 1, 1,
0.8079883, -0.5661969, 0.7885902, 0, 0, 0, 1, 1,
0.8244266, -0.1932746, 2.63243, 0, 0, 0, 1, 1,
0.8281955, 0.008060784, 3.069054, 0, 0, 0, 1, 1,
0.8288124, 0.2499795, 0.280505, 0, 0, 0, 1, 1,
0.8371075, -0.9940597, 1.60536, 0, 0, 0, 1, 1,
0.8392631, 0.2279682, 0.5940387, 0, 0, 0, 1, 1,
0.8528525, -0.4220263, 4.374405, 1, 1, 1, 1, 1,
0.8528922, 1.394893, 0.2622385, 1, 1, 1, 1, 1,
0.8534628, -0.06051994, 0.7926598, 1, 1, 1, 1, 1,
0.8613557, -0.7225985, 3.726936, 1, 1, 1, 1, 1,
0.8617571, 0.4971574, 1.29572, 1, 1, 1, 1, 1,
0.8620239, -1.02147, 2.621176, 1, 1, 1, 1, 1,
0.863013, -0.6799737, 3.051847, 1, 1, 1, 1, 1,
0.8634444, -0.07040299, 1.823642, 1, 1, 1, 1, 1,
0.8639063, 0.4827064, 1.695823, 1, 1, 1, 1, 1,
0.8639451, -0.2397424, 1.612919, 1, 1, 1, 1, 1,
0.8691672, 0.5726867, 1.922434, 1, 1, 1, 1, 1,
0.8692394, -0.1057883, 2.113244, 1, 1, 1, 1, 1,
0.8702201, 0.08431593, 3.271908, 1, 1, 1, 1, 1,
0.8741349, -2.373627, 3.731038, 1, 1, 1, 1, 1,
0.8759177, 0.3997138, 1.261618, 1, 1, 1, 1, 1,
0.8777378, 1.447644, -0.4267445, 0, 0, 1, 1, 1,
0.8809256, -0.7113905, 2.520077, 1, 0, 0, 1, 1,
0.8823292, 0.4334916, 0.04523993, 1, 0, 0, 1, 1,
0.8827689, -0.1257925, 0.6837587, 1, 0, 0, 1, 1,
0.8865255, 0.4314044, 1.703321, 1, 0, 0, 1, 1,
0.8936857, -0.989025, 2.267007, 1, 0, 0, 1, 1,
0.8949162, 0.08101105, 1.109431, 0, 0, 0, 1, 1,
0.9002122, 0.5776097, -0.5217842, 0, 0, 0, 1, 1,
0.905533, 0.3160614, 2.311065, 0, 0, 0, 1, 1,
0.9057307, 0.241811, 0.5383698, 0, 0, 0, 1, 1,
0.9061574, -0.3202126, 2.050534, 0, 0, 0, 1, 1,
0.9071345, 0.4595414, 0.9841691, 0, 0, 0, 1, 1,
0.9076884, -0.6639259, 1.463802, 0, 0, 0, 1, 1,
0.9077096, 0.5387648, 2.166073, 1, 1, 1, 1, 1,
0.9100213, 1.584295, 0.001847462, 1, 1, 1, 1, 1,
0.9108859, -0.3336767, 3.429691, 1, 1, 1, 1, 1,
0.9198196, -1.778155, 1.529461, 1, 1, 1, 1, 1,
0.9251695, 1.432113, -0.5754075, 1, 1, 1, 1, 1,
0.9266879, -0.2394357, 2.588406, 1, 1, 1, 1, 1,
0.9391612, 1.113451, 1.276315, 1, 1, 1, 1, 1,
0.9391837, -0.04934995, 0.9876778, 1, 1, 1, 1, 1,
0.9412476, -0.4396158, 2.062158, 1, 1, 1, 1, 1,
0.9465466, -0.03795158, 0.8159761, 1, 1, 1, 1, 1,
0.9467545, -0.4246242, 1.327911, 1, 1, 1, 1, 1,
0.949183, 0.2251326, 0.001147508, 1, 1, 1, 1, 1,
0.9495711, 0.521647, 1.562337, 1, 1, 1, 1, 1,
0.9517377, 0.1378205, 1.448705, 1, 1, 1, 1, 1,
0.9627073, 0.3739851, 1.723836, 1, 1, 1, 1, 1,
0.9731979, 0.1756417, 1.88517, 0, 0, 1, 1, 1,
0.9738085, -0.8356721, 2.517645, 1, 0, 0, 1, 1,
0.985021, -1.744822, 4.246472, 1, 0, 0, 1, 1,
0.992615, -0.1074678, 1.946339, 1, 0, 0, 1, 1,
0.993782, -0.6158484, 1.624714, 1, 0, 0, 1, 1,
0.9990949, -1.208242, 1.932904, 1, 0, 0, 1, 1,
1.008976, 0.6507112, 0.3473173, 0, 0, 0, 1, 1,
1.009346, 0.1713347, -0.569133, 0, 0, 0, 1, 1,
1.020971, -0.7622664, 2.329699, 0, 0, 0, 1, 1,
1.023177, -0.5903437, 0.4920543, 0, 0, 0, 1, 1,
1.023426, 0.124734, 2.362236, 0, 0, 0, 1, 1,
1.028622, -1.218351, 2.878662, 0, 0, 0, 1, 1,
1.029698, -0.3354518, 1.732895, 0, 0, 0, 1, 1,
1.034042, -2.376249, 2.367702, 1, 1, 1, 1, 1,
1.039953, 0.09930553, 1.847971, 1, 1, 1, 1, 1,
1.043711, 1.085233, 0.4834536, 1, 1, 1, 1, 1,
1.050022, -0.7312104, 0.9963194, 1, 1, 1, 1, 1,
1.063088, -0.1213151, 3.245786, 1, 1, 1, 1, 1,
1.067752, 0.6588115, 0.1739066, 1, 1, 1, 1, 1,
1.076068, -0.7150087, 2.196755, 1, 1, 1, 1, 1,
1.086091, 1.012792, 0.6638691, 1, 1, 1, 1, 1,
1.091447, 0.08870073, 2.248553, 1, 1, 1, 1, 1,
1.096017, -1.635813, 2.115182, 1, 1, 1, 1, 1,
1.109937, 0.1931275, 0.005800561, 1, 1, 1, 1, 1,
1.111759, -2.125926, 3.006273, 1, 1, 1, 1, 1,
1.123414, -0.1915058, 1.919469, 1, 1, 1, 1, 1,
1.133976, -1.241177, 1.615684, 1, 1, 1, 1, 1,
1.151275, -1.990281, 2.084875, 1, 1, 1, 1, 1,
1.153897, -1.689762, 3.149025, 0, 0, 1, 1, 1,
1.154898, -0.1139033, 0.5591457, 1, 0, 0, 1, 1,
1.155196, -1.455723, 3.679202, 1, 0, 0, 1, 1,
1.157619, 0.6904438, 0.4408979, 1, 0, 0, 1, 1,
1.159977, 0.1047746, 0.07450878, 1, 0, 0, 1, 1,
1.164791, 2.815314, 0.1839987, 1, 0, 0, 1, 1,
1.166203, 0.9087555, 0.3483133, 0, 0, 0, 1, 1,
1.173956, -1.124178, 1.379725, 0, 0, 0, 1, 1,
1.17837, 2.085915, 1.025436, 0, 0, 0, 1, 1,
1.17886, 0.4306771, 2.418433, 0, 0, 0, 1, 1,
1.181495, 0.6657938, 2.73527, 0, 0, 0, 1, 1,
1.182125, -0.681788, 2.229324, 0, 0, 0, 1, 1,
1.186983, 0.7117841, 1.482617, 0, 0, 0, 1, 1,
1.201731, -0.6162633, 2.253856, 1, 1, 1, 1, 1,
1.202529, 0.7188187, 2.700653, 1, 1, 1, 1, 1,
1.21563, 0.7300149, -0.8233197, 1, 1, 1, 1, 1,
1.22251, -1.419676, 3.76658, 1, 1, 1, 1, 1,
1.222744, -0.2414822, 1.987601, 1, 1, 1, 1, 1,
1.223888, 0.7052668, 0.669413, 1, 1, 1, 1, 1,
1.224442, 0.6727918, -0.06777826, 1, 1, 1, 1, 1,
1.245808, -0.5904177, 1.01531, 1, 1, 1, 1, 1,
1.259025, 1.310675, 0.6386338, 1, 1, 1, 1, 1,
1.260808, -1.214491, 0.1225666, 1, 1, 1, 1, 1,
1.261551, -0.05790969, -0.8389253, 1, 1, 1, 1, 1,
1.264532, 0.4446712, 0.9027959, 1, 1, 1, 1, 1,
1.267053, 0.7214985, 2.063445, 1, 1, 1, 1, 1,
1.270313, -0.6709992, 1.990696, 1, 1, 1, 1, 1,
1.274556, -1.893687, 3.10243, 1, 1, 1, 1, 1,
1.278679, 0.3107091, 2.560052, 0, 0, 1, 1, 1,
1.2815, 1.081694, 0.6771514, 1, 0, 0, 1, 1,
1.28333, -0.1737827, 0.2998699, 1, 0, 0, 1, 1,
1.286792, 0.1009834, -0.3688136, 1, 0, 0, 1, 1,
1.301845, -0.4048906, 1.76872, 1, 0, 0, 1, 1,
1.303563, -1.645234, 1.851654, 1, 0, 0, 1, 1,
1.312523, 1.8398, 2.483781, 0, 0, 0, 1, 1,
1.314514, -0.05279714, 0.3644112, 0, 0, 0, 1, 1,
1.318356, 0.2629619, 1.39924, 0, 0, 0, 1, 1,
1.322494, 0.08688991, 1.91464, 0, 0, 0, 1, 1,
1.326285, -0.3901563, 1.707, 0, 0, 0, 1, 1,
1.330824, 1.636411, 2.899123, 0, 0, 0, 1, 1,
1.333424, -0.5054706, 1.835415, 0, 0, 0, 1, 1,
1.342986, -1.285964, 4.509065, 1, 1, 1, 1, 1,
1.353138, 0.03080109, -0.08804406, 1, 1, 1, 1, 1,
1.373317, 0.5602412, 0.9466354, 1, 1, 1, 1, 1,
1.373428, -2.292104, 2.770483, 1, 1, 1, 1, 1,
1.388074, -1.549831, 3.624887, 1, 1, 1, 1, 1,
1.394273, 1.490122, 2.183903, 1, 1, 1, 1, 1,
1.41094, 0.5209402, 1.598912, 1, 1, 1, 1, 1,
1.413759, -0.2156841, 1.245447, 1, 1, 1, 1, 1,
1.413769, -1.745084, -0.006804794, 1, 1, 1, 1, 1,
1.420295, 0.8171958, 0.8648433, 1, 1, 1, 1, 1,
1.426149, 0.36811, 1.541281, 1, 1, 1, 1, 1,
1.45272, 0.4817267, 0.8436604, 1, 1, 1, 1, 1,
1.453134, 0.10293, 0.2145701, 1, 1, 1, 1, 1,
1.462906, -1.443417, 2.022019, 1, 1, 1, 1, 1,
1.478569, -0.7181512, 1.52878, 1, 1, 1, 1, 1,
1.483636, -1.719441, 3.173239, 0, 0, 1, 1, 1,
1.488942, 1.700436, 1.091462, 1, 0, 0, 1, 1,
1.503859, -2.073277, 1.823258, 1, 0, 0, 1, 1,
1.511268, -0.1550493, 1.320418, 1, 0, 0, 1, 1,
1.512841, -0.4520879, 2.718373, 1, 0, 0, 1, 1,
1.518721, 2.343729, -0.6557301, 1, 0, 0, 1, 1,
1.520809, 0.7040747, 2.106536, 0, 0, 0, 1, 1,
1.529357, 1.067225, 2.109271, 0, 0, 0, 1, 1,
1.551679, -0.948105, 3.273882, 0, 0, 0, 1, 1,
1.55187, -1.49275, 2.347741, 0, 0, 0, 1, 1,
1.554492, 0.3625928, -0.8635852, 0, 0, 0, 1, 1,
1.555383, -0.6151924, 1.909263, 0, 0, 0, 1, 1,
1.562359, 0.2351608, 1.772099, 0, 0, 0, 1, 1,
1.572068, 1.641793, 2.555056, 1, 1, 1, 1, 1,
1.595998, -1.482803, 3.104981, 1, 1, 1, 1, 1,
1.602931, -0.3917308, 3.539876, 1, 1, 1, 1, 1,
1.610465, -0.3845214, 0.7472226, 1, 1, 1, 1, 1,
1.614377, 0.05837313, 2.575052, 1, 1, 1, 1, 1,
1.616114, -0.3453958, 2.325784, 1, 1, 1, 1, 1,
1.619555, 0.636292, 1.112198, 1, 1, 1, 1, 1,
1.64921, -0.07126953, 2.815567, 1, 1, 1, 1, 1,
1.649919, -0.3581531, 1.758283, 1, 1, 1, 1, 1,
1.656022, 0.4217826, 1.575091, 1, 1, 1, 1, 1,
1.659235, 0.1065702, -0.06490789, 1, 1, 1, 1, 1,
1.688045, 0.3966526, 3.347125, 1, 1, 1, 1, 1,
1.692777, -0.4929921, 2.485507, 1, 1, 1, 1, 1,
1.70346, -0.820792, 1.170818, 1, 1, 1, 1, 1,
1.707663, -1.694855, 2.29781, 1, 1, 1, 1, 1,
1.727772, -1.105263, 0.641589, 0, 0, 1, 1, 1,
1.754406, -0.8923381, 2.829122, 1, 0, 0, 1, 1,
1.769393, 0.8461154, 0.9779341, 1, 0, 0, 1, 1,
1.774424, -1.472014, 0.8782207, 1, 0, 0, 1, 1,
1.795089, -0.5520998, 1.21895, 1, 0, 0, 1, 1,
1.797998, -1.180948, 2.102752, 1, 0, 0, 1, 1,
1.814566, 0.6435202, 0.8698171, 0, 0, 0, 1, 1,
1.834871, 0.6760876, -0.04018236, 0, 0, 0, 1, 1,
1.842786, 0.03503599, 1.755279, 0, 0, 0, 1, 1,
1.850873, -0.01494435, 0.699064, 0, 0, 0, 1, 1,
1.85118, 0.881892, 0.4481598, 0, 0, 0, 1, 1,
1.851771, -1.425029, 0.8340426, 0, 0, 0, 1, 1,
1.861958, 0.9888725, 0.1961525, 0, 0, 0, 1, 1,
1.864518, 0.01269436, 0.6295124, 1, 1, 1, 1, 1,
1.871758, 0.2909406, 0.9846727, 1, 1, 1, 1, 1,
1.880222, 0.1731185, 0.8860051, 1, 1, 1, 1, 1,
1.880743, -0.3932867, 1.936839, 1, 1, 1, 1, 1,
1.895962, 0.4565116, 2.321335, 1, 1, 1, 1, 1,
1.897173, -0.5979576, 0.3069488, 1, 1, 1, 1, 1,
1.897201, -1.428226, 1.554142, 1, 1, 1, 1, 1,
1.899523, -0.9117107, 2.267991, 1, 1, 1, 1, 1,
1.903423, 0.1766656, 2.300672, 1, 1, 1, 1, 1,
1.909826, -1.511169, 2.853733, 1, 1, 1, 1, 1,
1.929546, 0.2808262, 3.305684, 1, 1, 1, 1, 1,
1.933917, -0.6484842, 2.379901, 1, 1, 1, 1, 1,
1.938547, -0.9945891, 2.736444, 1, 1, 1, 1, 1,
1.963076, 0.5579728, 1.921925, 1, 1, 1, 1, 1,
2.019511, -1.740671, 1.744532, 1, 1, 1, 1, 1,
2.031723, 0.7533243, 1.642869, 0, 0, 1, 1, 1,
2.069313, 1.169205, 1.220472, 1, 0, 0, 1, 1,
2.102663, 0.3381435, 0.3208198, 1, 0, 0, 1, 1,
2.138405, 0.369766, 0.9049001, 1, 0, 0, 1, 1,
2.144466, 0.5826212, 0.7918944, 1, 0, 0, 1, 1,
2.168694, -0.2538735, 1.963243, 1, 0, 0, 1, 1,
2.171066, 3.218548, -1.235767, 0, 0, 0, 1, 1,
2.193181, 1.084363, 0.6245147, 0, 0, 0, 1, 1,
2.216364, -0.9804225, 1.48154, 0, 0, 0, 1, 1,
2.233242, -0.3397562, 1.267119, 0, 0, 0, 1, 1,
2.28073, 0.8259339, 2.013734, 0, 0, 0, 1, 1,
2.301515, -1.728896, 2.891713, 0, 0, 0, 1, 1,
2.312575, 0.04036827, 3.361032, 0, 0, 0, 1, 1,
2.377038, -0.1165645, 1.341981, 1, 1, 1, 1, 1,
2.522311, -0.5366597, 2.621581, 1, 1, 1, 1, 1,
2.601997, 0.8510166, 0.4911182, 1, 1, 1, 1, 1,
2.639964, -1.659963, 2.697921, 1, 1, 1, 1, 1,
2.873201, -0.3599167, 0.3734295, 1, 1, 1, 1, 1,
2.938733, -0.1416862, 1.148083, 1, 1, 1, 1, 1,
2.975863, 1.974118, 0.5031177, 1, 1, 1, 1, 1
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
var radius = 10.01747;
var distance = 35.18593;
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
mvMatrix.translate( 0.1377325, -0.500084, -0.2177041 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.18593);
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