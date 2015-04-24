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
-3.554599, -0.5042053, -1.480743, 1, 0, 0, 1,
-3.386322, -0.4632601, -1.438783, 1, 0.007843138, 0, 1,
-2.914583, 0.3640021, -0.8655922, 1, 0.01176471, 0, 1,
-2.727008, 0.03344174, -0.6863039, 1, 0.01960784, 0, 1,
-2.624381, 1.478035, -0.7716455, 1, 0.02352941, 0, 1,
-2.525175, 0.6969671, -0.6455582, 1, 0.03137255, 0, 1,
-2.482241, 0.8995145, -1.217689, 1, 0.03529412, 0, 1,
-2.470269, -0.4765346, -2.349905, 1, 0.04313726, 0, 1,
-2.405379, 0.7800294, -2.904837, 1, 0.04705882, 0, 1,
-2.386264, -0.3486384, -1.133855, 1, 0.05490196, 0, 1,
-2.350779, 0.7972234, -1.351137, 1, 0.05882353, 0, 1,
-2.309243, 1.17952, 0.4878828, 1, 0.06666667, 0, 1,
-2.242608, 0.5180496, -2.628772, 1, 0.07058824, 0, 1,
-2.238662, -0.6882865, -2.273024, 1, 0.07843138, 0, 1,
-2.236722, -0.3051546, 0.02333728, 1, 0.08235294, 0, 1,
-2.232619, 1.068092, -1.160173, 1, 0.09019608, 0, 1,
-2.210815, -0.4162023, -1.154428, 1, 0.09411765, 0, 1,
-2.196595, -0.7121369, -1.519192, 1, 0.1019608, 0, 1,
-2.145166, -1.400285, -2.054012, 1, 0.1098039, 0, 1,
-2.129871, -0.3821573, -1.601295, 1, 0.1137255, 0, 1,
-2.128058, -0.2489763, -1.089201, 1, 0.1215686, 0, 1,
-2.107218, -1.5444, -4.160841, 1, 0.1254902, 0, 1,
-2.081867, -0.3584612, -2.485103, 1, 0.1333333, 0, 1,
-2.067709, -1.46792, -1.109416, 1, 0.1372549, 0, 1,
-2.032746, 0.6559333, -1.724536, 1, 0.145098, 0, 1,
-2.023445, -0.7559682, -0.4316564, 1, 0.1490196, 0, 1,
-2.022583, -1.136812, -1.769333, 1, 0.1568628, 0, 1,
-2.01706, -0.744002, -1.101912, 1, 0.1607843, 0, 1,
-2.006668, -0.6786904, -3.522058, 1, 0.1686275, 0, 1,
-2.004894, -0.246142, -1.94972, 1, 0.172549, 0, 1,
-1.97962, 0.6302646, -0.6146793, 1, 0.1803922, 0, 1,
-1.972392, -0.1462675, -1.241989, 1, 0.1843137, 0, 1,
-1.972211, -0.1018217, -1.385446, 1, 0.1921569, 0, 1,
-1.96278, 0.7338542, -1.205535, 1, 0.1960784, 0, 1,
-1.962205, 0.158326, -0.2317132, 1, 0.2039216, 0, 1,
-1.957202, 0.8581587, -1.654266, 1, 0.2117647, 0, 1,
-1.956215, 0.9048759, -1.34206, 1, 0.2156863, 0, 1,
-1.940723, -0.628499, -0.7941803, 1, 0.2235294, 0, 1,
-1.935571, -0.5993416, -0.2715012, 1, 0.227451, 0, 1,
-1.92413, -0.6896163, -0.7818329, 1, 0.2352941, 0, 1,
-1.900271, -1.190535, -0.9185807, 1, 0.2392157, 0, 1,
-1.898867, -0.04308695, -2.200108, 1, 0.2470588, 0, 1,
-1.896503, 0.6998735, -1.531103, 1, 0.2509804, 0, 1,
-1.884474, 0.9053071, 0.1730316, 1, 0.2588235, 0, 1,
-1.87924, -0.4719747, -2.601799, 1, 0.2627451, 0, 1,
-1.872144, 1.396224, -1.168237, 1, 0.2705882, 0, 1,
-1.858625, -0.08812199, -2.930168, 1, 0.2745098, 0, 1,
-1.8233, -0.3312427, -1.56829, 1, 0.282353, 0, 1,
-1.813771, 1.148716, -1.728401, 1, 0.2862745, 0, 1,
-1.806262, -0.2873585, -0.5137816, 1, 0.2941177, 0, 1,
-1.798467, 0.1958237, -2.020664, 1, 0.3019608, 0, 1,
-1.797758, 1.190202, 0.6675727, 1, 0.3058824, 0, 1,
-1.773958, -1.305314, -0.447905, 1, 0.3137255, 0, 1,
-1.773636, 0.245755, -3.307688, 1, 0.3176471, 0, 1,
-1.752192, -0.8399619, -1.859447, 1, 0.3254902, 0, 1,
-1.730448, -1.351578, -1.774395, 1, 0.3294118, 0, 1,
-1.728173, 1.37163, -0.9257098, 1, 0.3372549, 0, 1,
-1.719776, 0.08333757, -1.362508, 1, 0.3411765, 0, 1,
-1.717353, -0.6868125, -1.182649, 1, 0.3490196, 0, 1,
-1.711206, 0.007375269, -2.585489, 1, 0.3529412, 0, 1,
-1.708758, -1.5132, -3.051082, 1, 0.3607843, 0, 1,
-1.682949, 0.3417208, -0.5123211, 1, 0.3647059, 0, 1,
-1.667941, -1.449372, -0.587495, 1, 0.372549, 0, 1,
-1.663507, -0.3687706, -2.669646, 1, 0.3764706, 0, 1,
-1.647859, -0.1942707, -0.7192417, 1, 0.3843137, 0, 1,
-1.635896, 0.4424855, -0.6068699, 1, 0.3882353, 0, 1,
-1.61699, -0.6092334, -2.133943, 1, 0.3960784, 0, 1,
-1.599418, 0.2978371, -1.260929, 1, 0.4039216, 0, 1,
-1.574055, -0.3676648, -3.429188, 1, 0.4078431, 0, 1,
-1.55198, 0.1961693, -0.8164576, 1, 0.4156863, 0, 1,
-1.528704, -1.310763, -3.21296, 1, 0.4196078, 0, 1,
-1.526941, -1.906951, -3.064081, 1, 0.427451, 0, 1,
-1.522929, 0.3284166, -2.061136, 1, 0.4313726, 0, 1,
-1.49456, 0.5211267, -1.878949, 1, 0.4392157, 0, 1,
-1.484796, 0.0693135, -1.204883, 1, 0.4431373, 0, 1,
-1.482901, 2.044291, 0.6794548, 1, 0.4509804, 0, 1,
-1.479652, -1.739914, -2.806803, 1, 0.454902, 0, 1,
-1.475589, -0.1784777, -1.437237, 1, 0.4627451, 0, 1,
-1.474234, 0.6207894, -1.374394, 1, 0.4666667, 0, 1,
-1.471132, -0.4628106, -4.808233, 1, 0.4745098, 0, 1,
-1.468014, 1.158773, -1.823349, 1, 0.4784314, 0, 1,
-1.448973, -0.6724401, -3.44722, 1, 0.4862745, 0, 1,
-1.441202, -0.03797233, -1.832987, 1, 0.4901961, 0, 1,
-1.433867, -0.8922305, -1.954678, 1, 0.4980392, 0, 1,
-1.432608, 2.423357, 0.06425618, 1, 0.5058824, 0, 1,
-1.420101, -0.7983925, -3.583357, 1, 0.509804, 0, 1,
-1.415873, -3.575003, -2.630959, 1, 0.5176471, 0, 1,
-1.405899, 1.696839, 1.263575, 1, 0.5215687, 0, 1,
-1.403244, 0.0919573, -1.471084, 1, 0.5294118, 0, 1,
-1.388641, 1.800191, 0.186983, 1, 0.5333334, 0, 1,
-1.375184, -0.3990999, -2.362905, 1, 0.5411765, 0, 1,
-1.373191, 1.234967, -0.7342685, 1, 0.5450981, 0, 1,
-1.371774, 0.889829, 0.3486732, 1, 0.5529412, 0, 1,
-1.368353, 0.2949493, -1.412696, 1, 0.5568628, 0, 1,
-1.367004, 0.5289643, 1.208182, 1, 0.5647059, 0, 1,
-1.366115, 0.7250719, -0.4643309, 1, 0.5686275, 0, 1,
-1.366052, -1.175047, -2.629098, 1, 0.5764706, 0, 1,
-1.362903, 0.2116117, -1.541225, 1, 0.5803922, 0, 1,
-1.359182, -0.5537734, 0.3968711, 1, 0.5882353, 0, 1,
-1.349799, 1.982758, 0.8721131, 1, 0.5921569, 0, 1,
-1.344012, 1.189953, -0.5085354, 1, 0.6, 0, 1,
-1.336119, -1.916187, -4.66513, 1, 0.6078432, 0, 1,
-1.333209, -0.8158501, -2.075326, 1, 0.6117647, 0, 1,
-1.32631, 0.3288469, -1.342212, 1, 0.6196079, 0, 1,
-1.315268, 1.932673, -1.015356, 1, 0.6235294, 0, 1,
-1.305908, -0.201961, -2.761502, 1, 0.6313726, 0, 1,
-1.301363, -0.5296497, -1.398219, 1, 0.6352941, 0, 1,
-1.295859, 0.2164249, -0.483382, 1, 0.6431373, 0, 1,
-1.290109, 0.4707323, -2.113728, 1, 0.6470588, 0, 1,
-1.287027, 0.9759492, -0.459828, 1, 0.654902, 0, 1,
-1.281083, -1.184648, -2.193883, 1, 0.6588235, 0, 1,
-1.278003, 2.543549, -0.358863, 1, 0.6666667, 0, 1,
-1.27054, 1.151397, -0.8248762, 1, 0.6705883, 0, 1,
-1.260666, -1.070079, -2.862646, 1, 0.6784314, 0, 1,
-1.257771, -2.057668, -2.126573, 1, 0.682353, 0, 1,
-1.236111, 1.472541, -3.548192, 1, 0.6901961, 0, 1,
-1.235498, -0.2444034, -2.462013, 1, 0.6941177, 0, 1,
-1.233023, 0.7877526, -1.402372, 1, 0.7019608, 0, 1,
-1.217866, -1.575314, -1.745833, 1, 0.7098039, 0, 1,
-1.210986, 0.2889192, -1.187791, 1, 0.7137255, 0, 1,
-1.210872, -1.383011, -1.525372, 1, 0.7215686, 0, 1,
-1.210655, 1.140451, -1.231749, 1, 0.7254902, 0, 1,
-1.20428, 0.5884849, -0.5782225, 1, 0.7333333, 0, 1,
-1.203304, -0.6457691, -1.602876, 1, 0.7372549, 0, 1,
-1.201348, 0.9602227, 0.2123124, 1, 0.7450981, 0, 1,
-1.200418, -0.2772938, -1.267184, 1, 0.7490196, 0, 1,
-1.187759, -0.3407167, -2.398468, 1, 0.7568628, 0, 1,
-1.186025, -0.2269261, -2.124668, 1, 0.7607843, 0, 1,
-1.179775, -0.354359, -0.1280648, 1, 0.7686275, 0, 1,
-1.172531, -2.347504, -3.598889, 1, 0.772549, 0, 1,
-1.167392, -0.5429247, -1.335417, 1, 0.7803922, 0, 1,
-1.161821, 0.6771621, -1.073203, 1, 0.7843137, 0, 1,
-1.159426, 0.8442362, -1.253241, 1, 0.7921569, 0, 1,
-1.149498, 0.190926, -1.420421, 1, 0.7960784, 0, 1,
-1.149244, -0.6072152, -2.547506, 1, 0.8039216, 0, 1,
-1.148427, -2.661963, -3.234308, 1, 0.8117647, 0, 1,
-1.14628, 0.06442736, -1.302121, 1, 0.8156863, 0, 1,
-1.143259, -0.2883172, -2.773806, 1, 0.8235294, 0, 1,
-1.142852, -1.878207, -3.163841, 1, 0.827451, 0, 1,
-1.123181, -0.9397509, -2.993572, 1, 0.8352941, 0, 1,
-1.121566, 1.652786, -0.8370892, 1, 0.8392157, 0, 1,
-1.119533, 0.7340814, -0.8053925, 1, 0.8470588, 0, 1,
-1.118487, -1.499708, -2.78109, 1, 0.8509804, 0, 1,
-1.102314, -0.6114148, -0.5222197, 1, 0.8588235, 0, 1,
-1.099068, 0.5506485, -1.191414, 1, 0.8627451, 0, 1,
-1.096307, -0.2637689, -2.792955, 1, 0.8705882, 0, 1,
-1.092753, -0.6622845, -3.309558, 1, 0.8745098, 0, 1,
-1.091457, -0.08255991, -1.603968, 1, 0.8823529, 0, 1,
-1.085439, 0.4665675, -0.1790161, 1, 0.8862745, 0, 1,
-1.07868, -0.3124199, -1.27435, 1, 0.8941177, 0, 1,
-1.07749, 0.1480594, -2.195235, 1, 0.8980392, 0, 1,
-1.070803, 0.9190261, -1.368894, 1, 0.9058824, 0, 1,
-1.064139, 0.7949194, -2.104333, 1, 0.9137255, 0, 1,
-1.059033, 0.3448363, -0.551491, 1, 0.9176471, 0, 1,
-1.057945, -0.6498035, -1.467454, 1, 0.9254902, 0, 1,
-1.057644, -0.4959813, -0.1790714, 1, 0.9294118, 0, 1,
-1.057524, 1.610286, 0.1780082, 1, 0.9372549, 0, 1,
-1.043523, 0.6258678, -0.542084, 1, 0.9411765, 0, 1,
-1.043445, -0.3538623, 0.4057475, 1, 0.9490196, 0, 1,
-1.041827, 0.8123927, -1.679754, 1, 0.9529412, 0, 1,
-1.039674, 0.02306107, -2.91809, 1, 0.9607843, 0, 1,
-1.032354, -0.3790956, -2.535806, 1, 0.9647059, 0, 1,
-1.022036, -1.855469, -4.730785, 1, 0.972549, 0, 1,
-1.019184, -0.5408782, -0.6989221, 1, 0.9764706, 0, 1,
-1.013698, 0.530404, -1.858756, 1, 0.9843137, 0, 1,
-1.012219, -0.3556398, -2.045127, 1, 0.9882353, 0, 1,
-1.010647, -0.6103573, -2.14851, 1, 0.9960784, 0, 1,
-1.00997, -0.3449585, -0.9646484, 0.9960784, 1, 0, 1,
-1.003276, 0.3639886, -1.697478, 0.9921569, 1, 0, 1,
-0.9979036, -0.03654811, -1.121074, 0.9843137, 1, 0, 1,
-0.9971371, 0.9220157, -0.3386458, 0.9803922, 1, 0, 1,
-0.9879904, -1.873148, -2.558313, 0.972549, 1, 0, 1,
-0.9876446, 1.723227, -1.084604, 0.9686275, 1, 0, 1,
-0.9874049, 3.1009, -0.3390732, 0.9607843, 1, 0, 1,
-0.9868457, -2.06056, -1.568529, 0.9568627, 1, 0, 1,
-0.984822, 0.1172404, -0.9226258, 0.9490196, 1, 0, 1,
-0.9844154, 0.8709025, -2.875379, 0.945098, 1, 0, 1,
-0.9822552, -1.481156, -1.024066, 0.9372549, 1, 0, 1,
-0.9768022, 1.265756, 0.0852192, 0.9333333, 1, 0, 1,
-0.9724873, -2.191638, -1.917267, 0.9254902, 1, 0, 1,
-0.972362, 1.521717, -0.8280089, 0.9215686, 1, 0, 1,
-0.9717797, 0.986328, -1.597149, 0.9137255, 1, 0, 1,
-0.9665278, -0.1509167, -2.805728, 0.9098039, 1, 0, 1,
-0.9661373, 0.3070762, -1.039089, 0.9019608, 1, 0, 1,
-0.963896, 0.05564889, -1.682445, 0.8941177, 1, 0, 1,
-0.9637787, -1.794706, -1.717927, 0.8901961, 1, 0, 1,
-0.9595813, 0.6936895, -0.8481719, 0.8823529, 1, 0, 1,
-0.9463829, -0.2969066, -1.782488, 0.8784314, 1, 0, 1,
-0.9445128, -0.2133978, -2.888398, 0.8705882, 1, 0, 1,
-0.9381312, -0.7525649, -2.244095, 0.8666667, 1, 0, 1,
-0.9261164, 0.4996886, 0.1496299, 0.8588235, 1, 0, 1,
-0.9180269, 0.8325775, -0.5348255, 0.854902, 1, 0, 1,
-0.9095023, 0.7382966, -1.077351, 0.8470588, 1, 0, 1,
-0.9085887, 1.464754, -0.8873322, 0.8431373, 1, 0, 1,
-0.9024925, -0.483988, -1.038359, 0.8352941, 1, 0, 1,
-0.8760861, 0.4692935, -1.648339, 0.8313726, 1, 0, 1,
-0.8693213, 1.65997, 0.2391061, 0.8235294, 1, 0, 1,
-0.8649812, 1.060394, 1.199073, 0.8196079, 1, 0, 1,
-0.8611882, -0.2149321, -3.957137, 0.8117647, 1, 0, 1,
-0.8600963, 0.117078, -0.8519761, 0.8078431, 1, 0, 1,
-0.8518545, -0.2226876, -2.097664, 0.8, 1, 0, 1,
-0.8296888, 0.3151678, -1.102367, 0.7921569, 1, 0, 1,
-0.8249602, -0.4503474, -1.77035, 0.7882353, 1, 0, 1,
-0.8232743, 0.4497056, -1.687399, 0.7803922, 1, 0, 1,
-0.8195584, -1.226699, -2.347283, 0.7764706, 1, 0, 1,
-0.8073486, -2.111248, -1.083271, 0.7686275, 1, 0, 1,
-0.8036417, -0.5751013, -2.833779, 0.7647059, 1, 0, 1,
-0.8017571, -0.03497842, -2.815135, 0.7568628, 1, 0, 1,
-0.7995842, -1.376472, -3.850151, 0.7529412, 1, 0, 1,
-0.7970732, 1.262863, -0.5039721, 0.7450981, 1, 0, 1,
-0.7942774, -0.4646959, -2.376762, 0.7411765, 1, 0, 1,
-0.7920467, 0.5303438, 0.2561561, 0.7333333, 1, 0, 1,
-0.7851202, 0.4550456, 0.8891429, 0.7294118, 1, 0, 1,
-0.7809826, -1.818735, -3.618256, 0.7215686, 1, 0, 1,
-0.7805433, -0.867712, -1.489769, 0.7176471, 1, 0, 1,
-0.7758875, -2.706965, -3.155989, 0.7098039, 1, 0, 1,
-0.7752723, -0.8651631, -3.299556, 0.7058824, 1, 0, 1,
-0.772362, -0.8454019, -1.988583, 0.6980392, 1, 0, 1,
-0.7670949, 0.4150628, 0.3048853, 0.6901961, 1, 0, 1,
-0.7656857, -0.8138196, -3.319459, 0.6862745, 1, 0, 1,
-0.7619948, 0.1926858, -2.006875, 0.6784314, 1, 0, 1,
-0.7598202, -0.2263294, -3.362678, 0.6745098, 1, 0, 1,
-0.7538805, 0.4010989, -2.32356, 0.6666667, 1, 0, 1,
-0.7510517, 0.131298, -1.18642, 0.6627451, 1, 0, 1,
-0.7502999, 0.7754561, -1.326321, 0.654902, 1, 0, 1,
-0.7432383, -0.8284217, -4.427897, 0.6509804, 1, 0, 1,
-0.7403883, -1.246215, -3.391336, 0.6431373, 1, 0, 1,
-0.7344522, -0.3644427, -2.372148, 0.6392157, 1, 0, 1,
-0.7344421, 1.005504, 1.463206, 0.6313726, 1, 0, 1,
-0.7325464, 1.163313, -0.3758875, 0.627451, 1, 0, 1,
-0.7291762, 0.2494219, -2.391661, 0.6196079, 1, 0, 1,
-0.7282295, 0.6771072, 0.2155948, 0.6156863, 1, 0, 1,
-0.7268118, -1.772301, -2.053259, 0.6078432, 1, 0, 1,
-0.7155145, 1.580126, 0.4567143, 0.6039216, 1, 0, 1,
-0.7152701, 1.41787, -0.672596, 0.5960785, 1, 0, 1,
-0.708286, 0.9624614, -1.126044, 0.5882353, 1, 0, 1,
-0.7053996, -0.05411024, -1.260483, 0.5843138, 1, 0, 1,
-0.7012894, 1.567225, -1.828457, 0.5764706, 1, 0, 1,
-0.7005205, 1.197122, -0.4388033, 0.572549, 1, 0, 1,
-0.6995662, -0.1143852, -2.825488, 0.5647059, 1, 0, 1,
-0.6987324, 0.8964792, -0.7669452, 0.5607843, 1, 0, 1,
-0.6951866, -0.2850313, -3.243325, 0.5529412, 1, 0, 1,
-0.6909423, 0.8716323, -2.90064, 0.5490196, 1, 0, 1,
-0.6887662, 0.04990252, -1.51199, 0.5411765, 1, 0, 1,
-0.683104, -1.386917, -2.652855, 0.5372549, 1, 0, 1,
-0.6828725, 1.01202, -0.5671995, 0.5294118, 1, 0, 1,
-0.6814333, 1.205298, -0.9959162, 0.5254902, 1, 0, 1,
-0.6760971, -1.209204, -2.968817, 0.5176471, 1, 0, 1,
-0.6741889, 0.1490852, -1.220047, 0.5137255, 1, 0, 1,
-0.6728845, 0.9710963, 0.5941107, 0.5058824, 1, 0, 1,
-0.671052, -3.363992, -2.479882, 0.5019608, 1, 0, 1,
-0.6610883, -0.1891505, -0.6701424, 0.4941176, 1, 0, 1,
-0.6603884, 0.1226163, -1.753951, 0.4862745, 1, 0, 1,
-0.6567016, 0.4975773, -0.1841539, 0.4823529, 1, 0, 1,
-0.6506394, -1.078775, -3.150604, 0.4745098, 1, 0, 1,
-0.6503246, -0.1383532, 0.04739196, 0.4705882, 1, 0, 1,
-0.6477441, -0.357033, -1.215477, 0.4627451, 1, 0, 1,
-0.6464722, -0.5391897, -2.402105, 0.4588235, 1, 0, 1,
-0.6447956, 0.1585938, -1.540879, 0.4509804, 1, 0, 1,
-0.6422253, -0.9546421, -2.458399, 0.4470588, 1, 0, 1,
-0.6397398, -0.3628356, -1.741958, 0.4392157, 1, 0, 1,
-0.6358594, -0.8325783, -1.303468, 0.4352941, 1, 0, 1,
-0.633352, -0.2998949, -1.028667, 0.427451, 1, 0, 1,
-0.6288114, 1.184386, 0.03972219, 0.4235294, 1, 0, 1,
-0.6273679, -1.68115, -2.435436, 0.4156863, 1, 0, 1,
-0.6115118, -0.4230137, -1.167569, 0.4117647, 1, 0, 1,
-0.6105644, 1.195705, -0.05880972, 0.4039216, 1, 0, 1,
-0.6090639, -1.08132, -1.969049, 0.3960784, 1, 0, 1,
-0.6081945, -0.8552674, -1.411886, 0.3921569, 1, 0, 1,
-0.5987031, -0.4303515, -2.775833, 0.3843137, 1, 0, 1,
-0.5917107, 1.817725, -1.613073, 0.3803922, 1, 0, 1,
-0.5875161, 2.280952, -0.672045, 0.372549, 1, 0, 1,
-0.5859282, -0.3023918, -1.111742, 0.3686275, 1, 0, 1,
-0.5853247, 1.699354, -0.1979948, 0.3607843, 1, 0, 1,
-0.5814095, -1.050741, -3.491726, 0.3568628, 1, 0, 1,
-0.5765814, 0.2351834, -0.8621243, 0.3490196, 1, 0, 1,
-0.5741778, 1.37189, -0.09961825, 0.345098, 1, 0, 1,
-0.5678961, -0.3894704, -3.34103, 0.3372549, 1, 0, 1,
-0.5673352, 1.44241, -0.995841, 0.3333333, 1, 0, 1,
-0.5655939, -1.409032, -1.695349, 0.3254902, 1, 0, 1,
-0.5621676, -0.2193535, -3.049953, 0.3215686, 1, 0, 1,
-0.5612326, 2.02876, 0.2320308, 0.3137255, 1, 0, 1,
-0.5611446, -1.728646, -2.087773, 0.3098039, 1, 0, 1,
-0.5594624, -0.3701396, -2.439905, 0.3019608, 1, 0, 1,
-0.5521168, -0.3288481, -1.028908, 0.2941177, 1, 0, 1,
-0.549514, -0.3880473, -2.465196, 0.2901961, 1, 0, 1,
-0.5488814, -0.5324172, -1.93928, 0.282353, 1, 0, 1,
-0.5477713, 0.6420717, 1.127243, 0.2784314, 1, 0, 1,
-0.5366162, -0.06143032, -2.230232, 0.2705882, 1, 0, 1,
-0.536067, 0.1446276, -0.6722882, 0.2666667, 1, 0, 1,
-0.527728, -2.535354, -3.57448, 0.2588235, 1, 0, 1,
-0.5265712, -0.4862824, -0.8070867, 0.254902, 1, 0, 1,
-0.519643, 0.9108065, 1.858192, 0.2470588, 1, 0, 1,
-0.5188974, 2.342994, -2.18346, 0.2431373, 1, 0, 1,
-0.5148897, 1.219036, -0.3653568, 0.2352941, 1, 0, 1,
-0.5136194, -0.6124825, -2.44552, 0.2313726, 1, 0, 1,
-0.511136, 0.367234, 1.662325, 0.2235294, 1, 0, 1,
-0.5105479, 0.06795324, -4.161336, 0.2196078, 1, 0, 1,
-0.5074387, -1.697513, -4.102243, 0.2117647, 1, 0, 1,
-0.5065348, -0.8724232, -2.945695, 0.2078431, 1, 0, 1,
-0.5026845, -0.9688966, -0.8580447, 0.2, 1, 0, 1,
-0.5013219, -0.1429243, -2.476205, 0.1921569, 1, 0, 1,
-0.4941324, -0.2691287, -1.910367, 0.1882353, 1, 0, 1,
-0.4925737, -1.202426, -3.813264, 0.1803922, 1, 0, 1,
-0.4921429, 0.2216906, -2.225351, 0.1764706, 1, 0, 1,
-0.4873873, 1.958588, 0.3028961, 0.1686275, 1, 0, 1,
-0.4868897, 0.3279283, -2.083274, 0.1647059, 1, 0, 1,
-0.4710702, 0.9767516, -0.06806045, 0.1568628, 1, 0, 1,
-0.4662385, 0.2507289, 0.2377487, 0.1529412, 1, 0, 1,
-0.4657599, 0.9742224, -1.338849, 0.145098, 1, 0, 1,
-0.4614224, -0.2563106, -1.849316, 0.1411765, 1, 0, 1,
-0.4612537, -0.2319837, -0.499903, 0.1333333, 1, 0, 1,
-0.4595254, -1.178454, -2.218427, 0.1294118, 1, 0, 1,
-0.4578504, -0.7824164, -2.321552, 0.1215686, 1, 0, 1,
-0.4553961, 0.4526423, 2.106925, 0.1176471, 1, 0, 1,
-0.4551424, 1.241099, -1.255353, 0.1098039, 1, 0, 1,
-0.4542509, 0.5662231, -0.8765303, 0.1058824, 1, 0, 1,
-0.4521393, 0.2232742, -2.449482, 0.09803922, 1, 0, 1,
-0.4512414, 1.614597, 1.046763, 0.09019608, 1, 0, 1,
-0.4415677, 0.9065083, -1.334325, 0.08627451, 1, 0, 1,
-0.4352708, 0.224892, -0.6687754, 0.07843138, 1, 0, 1,
-0.4315, -1.277451, -3.669318, 0.07450981, 1, 0, 1,
-0.4298088, -2.930076, -1.576346, 0.06666667, 1, 0, 1,
-0.4269577, 1.347228, -0.963765, 0.0627451, 1, 0, 1,
-0.4230593, -1.063198, -2.739836, 0.05490196, 1, 0, 1,
-0.4227497, -0.4766891, -2.039958, 0.05098039, 1, 0, 1,
-0.4220542, -0.1206694, 0.1916931, 0.04313726, 1, 0, 1,
-0.4210643, -2.066898, -1.995833, 0.03921569, 1, 0, 1,
-0.419256, -0.8583391, -1.225038, 0.03137255, 1, 0, 1,
-0.4164485, -3.104346, -2.924501, 0.02745098, 1, 0, 1,
-0.4157771, -1.660482, -3.483291, 0.01960784, 1, 0, 1,
-0.4152795, -1.351453, -2.986722, 0.01568628, 1, 0, 1,
-0.4090593, 0.8420883, -0.8389289, 0.007843138, 1, 0, 1,
-0.4068552, -0.6821404, -3.182405, 0.003921569, 1, 0, 1,
-0.4046877, 0.6195117, -0.8064909, 0, 1, 0.003921569, 1,
-0.4044074, -1.062241, -4.477594, 0, 1, 0.01176471, 1,
-0.4010828, 0.495777, 0.2298512, 0, 1, 0.01568628, 1,
-0.3980238, 0.6246759, -0.4176638, 0, 1, 0.02352941, 1,
-0.3976701, 0.04506688, -0.9867998, 0, 1, 0.02745098, 1,
-0.3970474, -0.8166919, -1.271647, 0, 1, 0.03529412, 1,
-0.3949201, 0.350105, -0.7121713, 0, 1, 0.03921569, 1,
-0.390723, 1.144784, -1.509847, 0, 1, 0.04705882, 1,
-0.390555, 0.1063839, -1.471103, 0, 1, 0.05098039, 1,
-0.3884027, 0.9959408, -1.613533, 0, 1, 0.05882353, 1,
-0.3880554, 0.1382299, -0.948727, 0, 1, 0.0627451, 1,
-0.3835342, -0.9223087, -4.198769, 0, 1, 0.07058824, 1,
-0.3808064, 0.54252, -1.535663, 0, 1, 0.07450981, 1,
-0.380585, 0.2548543, 0.8886894, 0, 1, 0.08235294, 1,
-0.3754263, -0.1407161, -1.757337, 0, 1, 0.08627451, 1,
-0.3754103, 0.6689798, 0.6620398, 0, 1, 0.09411765, 1,
-0.3752687, -0.05684767, -1.250555, 0, 1, 0.1019608, 1,
-0.3733555, 2.023702, 0.9406779, 0, 1, 0.1058824, 1,
-0.3732078, -0.4525657, -4.375684, 0, 1, 0.1137255, 1,
-0.3697917, 1.766423, -0.2548379, 0, 1, 0.1176471, 1,
-0.3682654, -1.734796, -3.830542, 0, 1, 0.1254902, 1,
-0.3640426, 0.3437681, -0.0815016, 0, 1, 0.1294118, 1,
-0.3614329, -1.325775, -2.274675, 0, 1, 0.1372549, 1,
-0.3533677, 0.3552191, -0.4896497, 0, 1, 0.1411765, 1,
-0.352829, -0.7365339, -2.105364, 0, 1, 0.1490196, 1,
-0.3515595, -0.2081643, -3.231704, 0, 1, 0.1529412, 1,
-0.3506517, 0.2055922, 0.9046364, 0, 1, 0.1607843, 1,
-0.3498787, 1.36842, 0.5975108, 0, 1, 0.1647059, 1,
-0.3478848, -2.212285, -3.524088, 0, 1, 0.172549, 1,
-0.3446383, -0.1227122, -0.3228461, 0, 1, 0.1764706, 1,
-0.3414036, -0.03754519, -2.278253, 0, 1, 0.1843137, 1,
-0.3339426, -0.3091361, -2.612754, 0, 1, 0.1882353, 1,
-0.3317405, 1.413042, -0.4549657, 0, 1, 0.1960784, 1,
-0.3308495, 1.396829, -0.6067074, 0, 1, 0.2039216, 1,
-0.3307221, -1.003956, -1.716417, 0, 1, 0.2078431, 1,
-0.3288967, 0.3166344, -0.6145893, 0, 1, 0.2156863, 1,
-0.3287829, 0.08663019, -0.4727083, 0, 1, 0.2196078, 1,
-0.3246731, 0.07630019, -1.14964, 0, 1, 0.227451, 1,
-0.3232819, -0.1688246, -2.042904, 0, 1, 0.2313726, 1,
-0.3178459, 2.022008, -0.8162566, 0, 1, 0.2392157, 1,
-0.3174838, 0.9032737, -2.426718, 0, 1, 0.2431373, 1,
-0.3167181, 1.683894, 0.6095747, 0, 1, 0.2509804, 1,
-0.3140895, -0.332416, -2.180986, 0, 1, 0.254902, 1,
-0.3118422, -1.078101, -2.280758, 0, 1, 0.2627451, 1,
-0.3076536, 0.3608799, 0.003043673, 0, 1, 0.2666667, 1,
-0.3061917, -1.530378, -4.297674, 0, 1, 0.2745098, 1,
-0.3025327, -0.2070296, -1.638831, 0, 1, 0.2784314, 1,
-0.2940785, 1.347438, -0.486362, 0, 1, 0.2862745, 1,
-0.2857956, 1.524207, 1.389393, 0, 1, 0.2901961, 1,
-0.2818637, -1.034088, -2.610384, 0, 1, 0.2980392, 1,
-0.2814506, -0.367892, -2.364769, 0, 1, 0.3058824, 1,
-0.2801719, -0.7640523, -1.219808, 0, 1, 0.3098039, 1,
-0.2737479, -0.1994497, -2.038675, 0, 1, 0.3176471, 1,
-0.2735817, 0.2892519, 0.5523533, 0, 1, 0.3215686, 1,
-0.2726852, 0.773834, 0.5018603, 0, 1, 0.3294118, 1,
-0.272623, -1.022828, -3.218533, 0, 1, 0.3333333, 1,
-0.2713149, -0.1521665, -3.29502, 0, 1, 0.3411765, 1,
-0.266672, 0.4713403, -0.1866758, 0, 1, 0.345098, 1,
-0.2628188, 0.7239648, 1.284704, 0, 1, 0.3529412, 1,
-0.2557331, -0.2004044, -1.528326, 0, 1, 0.3568628, 1,
-0.2551176, 0.003490467, -2.830519, 0, 1, 0.3647059, 1,
-0.2535812, -0.2161809, -1.939892, 0, 1, 0.3686275, 1,
-0.2533629, 0.9434234, 1.923722, 0, 1, 0.3764706, 1,
-0.2503559, -0.2213125, -3.392533, 0, 1, 0.3803922, 1,
-0.2419506, -0.452631, -2.78458, 0, 1, 0.3882353, 1,
-0.2365249, 0.4546967, -1.503008, 0, 1, 0.3921569, 1,
-0.2352621, -0.3475327, -2.366837, 0, 1, 0.4, 1,
-0.2351212, 0.7989703, 0.1476498, 0, 1, 0.4078431, 1,
-0.2287598, -0.0298792, -0.4277262, 0, 1, 0.4117647, 1,
-0.228106, -2.359774, -0.8631355, 0, 1, 0.4196078, 1,
-0.2261014, -0.5849618, -3.435122, 0, 1, 0.4235294, 1,
-0.2237217, 0.489296, 1.673695, 0, 1, 0.4313726, 1,
-0.2236232, -2.28354, -2.779639, 0, 1, 0.4352941, 1,
-0.2234117, -1.395122, -4.442695, 0, 1, 0.4431373, 1,
-0.2229707, -0.454331, -2.609693, 0, 1, 0.4470588, 1,
-0.2172349, 1.840985, -1.341444, 0, 1, 0.454902, 1,
-0.2136303, -0.2708036, -1.291903, 0, 1, 0.4588235, 1,
-0.2129667, 0.8754126, -1.603983, 0, 1, 0.4666667, 1,
-0.2115017, -1.137817, -4.037022, 0, 1, 0.4705882, 1,
-0.2101622, 2.149679, 0.7696286, 0, 1, 0.4784314, 1,
-0.2035003, 0.3655675, -1.565238, 0, 1, 0.4823529, 1,
-0.2017756, -0.2396024, -1.45353, 0, 1, 0.4901961, 1,
-0.1997541, -0.06636752, -0.5061747, 0, 1, 0.4941176, 1,
-0.1964315, 1.083637, 1.520322, 0, 1, 0.5019608, 1,
-0.1943482, -0.6144068, -2.746879, 0, 1, 0.509804, 1,
-0.1903555, 0.06708437, 0.7559378, 0, 1, 0.5137255, 1,
-0.1878676, 0.1989129, -1.953369, 0, 1, 0.5215687, 1,
-0.1869038, 0.5677621, 0.7605355, 0, 1, 0.5254902, 1,
-0.1838947, 1.802303, -1.116338, 0, 1, 0.5333334, 1,
-0.1838392, 0.5082685, 0.643206, 0, 1, 0.5372549, 1,
-0.1822078, 0.630968, 1.117765, 0, 1, 0.5450981, 1,
-0.1772542, -1.359831, -3.204199, 0, 1, 0.5490196, 1,
-0.1771401, -0.8390018, -2.667803, 0, 1, 0.5568628, 1,
-0.1757349, 0.2138889, -3.732394, 0, 1, 0.5607843, 1,
-0.1735398, 0.821665, -0.8338295, 0, 1, 0.5686275, 1,
-0.1694391, -1.236176, -4.036047, 0, 1, 0.572549, 1,
-0.1649186, 0.8908821, -1.376742, 0, 1, 0.5803922, 1,
-0.1648082, 0.4169876, -0.3008404, 0, 1, 0.5843138, 1,
-0.1622391, -1.267833, -3.367655, 0, 1, 0.5921569, 1,
-0.1584617, -0.8543097, -3.06741, 0, 1, 0.5960785, 1,
-0.1523366, 3.29307, -0.05966311, 0, 1, 0.6039216, 1,
-0.1474453, -1.0335, -2.189591, 0, 1, 0.6117647, 1,
-0.1473981, 1.185448, 1.546658, 0, 1, 0.6156863, 1,
-0.1463958, -2.030557, -3.157938, 0, 1, 0.6235294, 1,
-0.1418842, 1.25595, -0.2593144, 0, 1, 0.627451, 1,
-0.1398518, -1.628205, -3.14997, 0, 1, 0.6352941, 1,
-0.13382, -0.3570372, -4.308312, 0, 1, 0.6392157, 1,
-0.1293354, 1.080023, -0.1383112, 0, 1, 0.6470588, 1,
-0.1290503, -0.2434704, -3.672821, 0, 1, 0.6509804, 1,
-0.128998, 0.5645707, -0.4415645, 0, 1, 0.6588235, 1,
-0.1287413, 0.1175953, -1.220572, 0, 1, 0.6627451, 1,
-0.1245509, -0.6232101, -3.909684, 0, 1, 0.6705883, 1,
-0.1239969, -0.344218, -3.031494, 0, 1, 0.6745098, 1,
-0.1227188, -1.873655, -4.308471, 0, 1, 0.682353, 1,
-0.1110161, -1.740238, -3.291996, 0, 1, 0.6862745, 1,
-0.1097591, 0.8774235, -1.208601, 0, 1, 0.6941177, 1,
-0.107331, -1.114381, -3.258408, 0, 1, 0.7019608, 1,
-0.09457587, -1.285459, -3.316756, 0, 1, 0.7058824, 1,
-0.09353852, -0.08796421, -3.923357, 0, 1, 0.7137255, 1,
-0.09069715, -0.07607447, -1.885768, 0, 1, 0.7176471, 1,
-0.08586761, 1.964379, -0.8115205, 0, 1, 0.7254902, 1,
-0.08511881, 0.7239522, -0.1388949, 0, 1, 0.7294118, 1,
-0.0850611, -1.641401, -3.712362, 0, 1, 0.7372549, 1,
-0.08308613, 1.529002, 0.2094747, 0, 1, 0.7411765, 1,
-0.0810719, 0.180747, -1.736917, 0, 1, 0.7490196, 1,
-0.07826314, 0.5318884, -0.4506167, 0, 1, 0.7529412, 1,
-0.07158986, -0.06645255, -3.259697, 0, 1, 0.7607843, 1,
-0.0678375, 0.3347259, 0.1700872, 0, 1, 0.7647059, 1,
-0.065562, -1.937165, -1.625074, 0, 1, 0.772549, 1,
-0.06459614, 1.217774, 0.683942, 0, 1, 0.7764706, 1,
-0.06404103, -0.7083395, -2.9579, 0, 1, 0.7843137, 1,
-0.06395565, -0.5498754, -3.820338, 0, 1, 0.7882353, 1,
-0.05211687, 0.2535041, 0.01098769, 0, 1, 0.7960784, 1,
-0.04999175, -0.373622, -4.394788, 0, 1, 0.8039216, 1,
-0.04751495, 0.7930671, -0.5642633, 0, 1, 0.8078431, 1,
-0.04738123, -0.1027753, -0.7001854, 0, 1, 0.8156863, 1,
-0.040339, -0.5777939, -2.812322, 0, 1, 0.8196079, 1,
-0.02918066, -0.8950427, -3.299205, 0, 1, 0.827451, 1,
-0.02778608, -1.786072, -3.741815, 0, 1, 0.8313726, 1,
-0.02531505, -0.4006396, -1.902217, 0, 1, 0.8392157, 1,
-0.02304386, -2.051287, -2.708835, 0, 1, 0.8431373, 1,
-0.02201297, -0.03019069, -2.72643, 0, 1, 0.8509804, 1,
-0.0215889, -0.09805389, -0.7028457, 0, 1, 0.854902, 1,
-0.02087576, -1.719471, -1.911251, 0, 1, 0.8627451, 1,
-0.0194998, 0.5654188, 1.594074, 0, 1, 0.8666667, 1,
-0.01642427, -0.9212533, -3.515698, 0, 1, 0.8745098, 1,
-0.01263251, 0.06382655, -0.2379279, 0, 1, 0.8784314, 1,
-0.007370729, -0.5471064, -2.736386, 0, 1, 0.8862745, 1,
-0.004660062, 0.9647977, 0.773442, 0, 1, 0.8901961, 1,
-0.002744698, 1.274302, 0.8476019, 0, 1, 0.8980392, 1,
-0.001325743, -0.4270234, -2.194222, 0, 1, 0.9058824, 1,
0.00678037, -0.04408341, 3.585899, 0, 1, 0.9098039, 1,
0.008256947, 0.1686276, -0.1715749, 0, 1, 0.9176471, 1,
0.01140404, -0.03562856, 3.379261, 0, 1, 0.9215686, 1,
0.01733495, -2.830667, 3.650272, 0, 1, 0.9294118, 1,
0.02036074, -0.01726367, 2.060078, 0, 1, 0.9333333, 1,
0.02899119, -1.890041, 2.765043, 0, 1, 0.9411765, 1,
0.03079198, -1.987165, 1.159486, 0, 1, 0.945098, 1,
0.03094662, -1.888185, 4.1001, 0, 1, 0.9529412, 1,
0.03292762, -0.4190724, 2.656458, 0, 1, 0.9568627, 1,
0.03941824, -0.8449475, 3.916837, 0, 1, 0.9647059, 1,
0.04167515, 0.165134, -0.4148679, 0, 1, 0.9686275, 1,
0.04585203, 1.077812, -0.2974156, 0, 1, 0.9764706, 1,
0.04592186, -1.119167, 0.1043465, 0, 1, 0.9803922, 1,
0.04618576, -1.181249, 4.021532, 0, 1, 0.9882353, 1,
0.04732872, -0.873487, 1.421056, 0, 1, 0.9921569, 1,
0.04900313, 2.240749, 0.1589228, 0, 1, 1, 1,
0.04907474, 1.884543, 0.7779888, 0, 0.9921569, 1, 1,
0.04909219, 0.08810852, 0.6819702, 0, 0.9882353, 1, 1,
0.05343332, 0.2878748, 1.618302, 0, 0.9803922, 1, 1,
0.05962408, 0.1865495, 0.3033966, 0, 0.9764706, 1, 1,
0.06251005, -0.4956856, 2.338849, 0, 0.9686275, 1, 1,
0.06341164, -1.154431, 2.809022, 0, 0.9647059, 1, 1,
0.06556386, -0.9330424, 3.58157, 0, 0.9568627, 1, 1,
0.06901816, 1.660672, 0.4074861, 0, 0.9529412, 1, 1,
0.07483263, 0.4375722, 1.242296, 0, 0.945098, 1, 1,
0.07656118, -0.633644, 1.997919, 0, 0.9411765, 1, 1,
0.0797084, 0.8268855, -0.2173349, 0, 0.9333333, 1, 1,
0.08339003, -0.3436395, 3.403146, 0, 0.9294118, 1, 1,
0.08676764, -0.8951288, 1.784799, 0, 0.9215686, 1, 1,
0.08705901, -0.08609888, 4.623167, 0, 0.9176471, 1, 1,
0.09325207, -0.828058, 3.34749, 0, 0.9098039, 1, 1,
0.09412074, 0.9974419, -0.06641631, 0, 0.9058824, 1, 1,
0.09577864, -0.7157829, 2.046424, 0, 0.8980392, 1, 1,
0.09676509, 1.161405, -0.7719529, 0, 0.8901961, 1, 1,
0.09682906, -0.5644398, 1.374881, 0, 0.8862745, 1, 1,
0.09760573, -0.5372491, 4.574325, 0, 0.8784314, 1, 1,
0.1032259, -1.333039, 3.352759, 0, 0.8745098, 1, 1,
0.1069189, -0.2317199, 0.3221194, 0, 0.8666667, 1, 1,
0.1081936, -0.2444089, 2.210364, 0, 0.8627451, 1, 1,
0.1114329, 1.177374, 0.0831827, 0, 0.854902, 1, 1,
0.1156388, 1.789822, 0.4453913, 0, 0.8509804, 1, 1,
0.1170656, -0.3583136, 2.879872, 0, 0.8431373, 1, 1,
0.1180002, -1.094469, 2.199834, 0, 0.8392157, 1, 1,
0.1263157, -0.2439104, 3.602009, 0, 0.8313726, 1, 1,
0.1278612, -0.42387, 2.862708, 0, 0.827451, 1, 1,
0.1281906, 0.6813835, 1.028663, 0, 0.8196079, 1, 1,
0.1350049, -1.730929, 1.976956, 0, 0.8156863, 1, 1,
0.1389951, -1.485269, 4.26306, 0, 0.8078431, 1, 1,
0.1408557, -0.5998285, 1.628385, 0, 0.8039216, 1, 1,
0.1453219, 1.306267, 1.857695, 0, 0.7960784, 1, 1,
0.1464112, 0.3396714, 0.4693174, 0, 0.7882353, 1, 1,
0.1467145, 0.8847609, 0.4985701, 0, 0.7843137, 1, 1,
0.1468617, 0.7463034, 0.6038643, 0, 0.7764706, 1, 1,
0.1468683, -0.1288827, 1.647147, 0, 0.772549, 1, 1,
0.1478372, 1.006892, 0.5915759, 0, 0.7647059, 1, 1,
0.1498672, 0.5129985, 0.4166757, 0, 0.7607843, 1, 1,
0.1518643, -0.1002284, 3.302794, 0, 0.7529412, 1, 1,
0.152907, -0.4663865, 2.727569, 0, 0.7490196, 1, 1,
0.1541618, 0.02260813, 0.3890438, 0, 0.7411765, 1, 1,
0.1602289, -0.9348943, 2.069569, 0, 0.7372549, 1, 1,
0.1644063, 0.2753542, 1.138254, 0, 0.7294118, 1, 1,
0.1662187, 0.2280984, 2.113799, 0, 0.7254902, 1, 1,
0.1665095, 0.8849049, 1.069664, 0, 0.7176471, 1, 1,
0.1724707, -0.09701964, 4.02692, 0, 0.7137255, 1, 1,
0.1745219, 1.718286, -0.1537051, 0, 0.7058824, 1, 1,
0.1758855, -0.02440636, 2.528708, 0, 0.6980392, 1, 1,
0.1784705, -0.1252429, 0.2872196, 0, 0.6941177, 1, 1,
0.178548, -0.983954, 2.581082, 0, 0.6862745, 1, 1,
0.1791912, -1.653195, 4.228125, 0, 0.682353, 1, 1,
0.1794609, -0.2486956, 3.153781, 0, 0.6745098, 1, 1,
0.1806175, 1.364035, 0.08013148, 0, 0.6705883, 1, 1,
0.181365, 0.6501058, 0.6678672, 0, 0.6627451, 1, 1,
0.1829148, 0.8394445, 0.2342819, 0, 0.6588235, 1, 1,
0.1851202, -0.9239597, 3.227719, 0, 0.6509804, 1, 1,
0.1882369, 1.293053, 0.02065585, 0, 0.6470588, 1, 1,
0.1901269, -0.06741108, 3.264956, 0, 0.6392157, 1, 1,
0.2018467, -2.740793, 1.592831, 0, 0.6352941, 1, 1,
0.2077118, 1.125257, 0.8488033, 0, 0.627451, 1, 1,
0.2116734, 0.5952473, 0.5514296, 0, 0.6235294, 1, 1,
0.2122968, 1.657622, 1.364185, 0, 0.6156863, 1, 1,
0.212871, -0.2203192, 2.648777, 0, 0.6117647, 1, 1,
0.2133192, 2.369573, 1.30086, 0, 0.6039216, 1, 1,
0.2139245, 1.2487, 1.987054, 0, 0.5960785, 1, 1,
0.2159057, 0.6604303, -1.049532, 0, 0.5921569, 1, 1,
0.2181012, 1.499618, 0.7030542, 0, 0.5843138, 1, 1,
0.2189141, -0.08727621, 0.6582471, 0, 0.5803922, 1, 1,
0.2210647, -0.3019299, 4.095626, 0, 0.572549, 1, 1,
0.225638, 0.3009757, -1.253932, 0, 0.5686275, 1, 1,
0.2259143, 0.414828, -0.1395301, 0, 0.5607843, 1, 1,
0.2268461, 0.5142421, 1.120737, 0, 0.5568628, 1, 1,
0.228109, 0.07612154, 1.965365, 0, 0.5490196, 1, 1,
0.2306945, -1.800726, 4.681289, 0, 0.5450981, 1, 1,
0.231216, -1.711619, 2.953842, 0, 0.5372549, 1, 1,
0.2355867, 0.7726955, -0.3673135, 0, 0.5333334, 1, 1,
0.2384833, -1.200743, 4.928123, 0, 0.5254902, 1, 1,
0.240611, -1.373415, 4.056019, 0, 0.5215687, 1, 1,
0.2441769, -0.4163761, 2.784592, 0, 0.5137255, 1, 1,
0.2491758, 1.606448, -0.3975238, 0, 0.509804, 1, 1,
0.2505631, -0.9927903, 3.235854, 0, 0.5019608, 1, 1,
0.2519271, -0.2868848, 3.346633, 0, 0.4941176, 1, 1,
0.255802, -0.5072754, 3.047197, 0, 0.4901961, 1, 1,
0.260619, 0.9467346, -0.005051902, 0, 0.4823529, 1, 1,
0.2618946, -0.5781822, 2.497739, 0, 0.4784314, 1, 1,
0.2637269, -1.814885, 3.015649, 0, 0.4705882, 1, 1,
0.2644144, -0.1708329, 2.811125, 0, 0.4666667, 1, 1,
0.2644497, 1.966207, -0.7052017, 0, 0.4588235, 1, 1,
0.2652295, -0.07279621, 1.221246, 0, 0.454902, 1, 1,
0.2716763, -1.014215, 5.034732, 0, 0.4470588, 1, 1,
0.2733679, -0.3112537, 2.735797, 0, 0.4431373, 1, 1,
0.2737558, -1.454627, 0.9512375, 0, 0.4352941, 1, 1,
0.2758158, 1.595159, 0.5784262, 0, 0.4313726, 1, 1,
0.2815862, 0.8383881, 1.947012, 0, 0.4235294, 1, 1,
0.2845991, -1.72908, 2.259107, 0, 0.4196078, 1, 1,
0.2907712, -0.829762, 3.190138, 0, 0.4117647, 1, 1,
0.29602, 0.6562096, 0.2557715, 0, 0.4078431, 1, 1,
0.3047709, -0.2361009, 2.201895, 0, 0.4, 1, 1,
0.305384, -2.260566, 3.58003, 0, 0.3921569, 1, 1,
0.3066911, -0.4388825, 1.432693, 0, 0.3882353, 1, 1,
0.3070465, -2.186455, 2.229892, 0, 0.3803922, 1, 1,
0.3180892, 0.1695533, 0.4980735, 0, 0.3764706, 1, 1,
0.3191411, -0.7479418, 2.919587, 0, 0.3686275, 1, 1,
0.3207219, -0.3168797, 0.7380255, 0, 0.3647059, 1, 1,
0.3220489, 0.7425675, 0.6181056, 0, 0.3568628, 1, 1,
0.3293868, -0.7228239, 3.69066, 0, 0.3529412, 1, 1,
0.3312843, 0.4068983, -0.9463505, 0, 0.345098, 1, 1,
0.3321331, 1.545807, -0.09681328, 0, 0.3411765, 1, 1,
0.3333047, 0.05093716, 0.4616692, 0, 0.3333333, 1, 1,
0.3340469, 0.8902789, 0.00558805, 0, 0.3294118, 1, 1,
0.33587, 1.095022, 1.308295, 0, 0.3215686, 1, 1,
0.3415609, 1.282817, -0.1238466, 0, 0.3176471, 1, 1,
0.3457687, -0.1353407, 1.329798, 0, 0.3098039, 1, 1,
0.3486532, -1.361442, 4.213939, 0, 0.3058824, 1, 1,
0.3512446, 0.5911099, 1.169968, 0, 0.2980392, 1, 1,
0.3543682, -0.9486384, 1.426525, 0, 0.2901961, 1, 1,
0.3567539, -1.636974, 2.497575, 0, 0.2862745, 1, 1,
0.3571127, -1.344633, 3.881949, 0, 0.2784314, 1, 1,
0.3584179, 2.326675, -0.6682494, 0, 0.2745098, 1, 1,
0.3621517, 0.530751, 1.074818, 0, 0.2666667, 1, 1,
0.3626287, 0.777656, -0.06615798, 0, 0.2627451, 1, 1,
0.3627101, -1.144679, 1.603485, 0, 0.254902, 1, 1,
0.366145, -0.07203233, 2.693488, 0, 0.2509804, 1, 1,
0.3695721, 0.3045984, 0.6419219, 0, 0.2431373, 1, 1,
0.3696717, -1.733145, 3.09384, 0, 0.2392157, 1, 1,
0.3699197, -0.840483, 2.243443, 0, 0.2313726, 1, 1,
0.3727832, 0.3357785, 1.542213, 0, 0.227451, 1, 1,
0.3761384, 0.1867421, 1.412438, 0, 0.2196078, 1, 1,
0.3783309, 0.8241618, 1.181569, 0, 0.2156863, 1, 1,
0.3819097, -0.1722807, 1.121748, 0, 0.2078431, 1, 1,
0.384698, -0.9818411, 1.675979, 0, 0.2039216, 1, 1,
0.3850238, -0.3549609, 2.401185, 0, 0.1960784, 1, 1,
0.3853503, 1.699326, -1.022555, 0, 0.1882353, 1, 1,
0.3864588, -0.4663874, -0.3888923, 0, 0.1843137, 1, 1,
0.3925277, 0.7742513, 1.624139, 0, 0.1764706, 1, 1,
0.3936311, -1.305007, 1.105271, 0, 0.172549, 1, 1,
0.3936841, -0.2433143, 1.045896, 0, 0.1647059, 1, 1,
0.3940837, 0.4276544, 2.566599, 0, 0.1607843, 1, 1,
0.396707, -0.5804732, 3.053286, 0, 0.1529412, 1, 1,
0.3973901, 1.361927, 0.3903029, 0, 0.1490196, 1, 1,
0.3985914, -1.111965, 2.797591, 0, 0.1411765, 1, 1,
0.3992447, 0.6035697, -0.08621949, 0, 0.1372549, 1, 1,
0.4018631, -0.3025809, 1.937229, 0, 0.1294118, 1, 1,
0.4058177, -0.9777951, 3.137189, 0, 0.1254902, 1, 1,
0.4065245, 0.8138596, -0.7979702, 0, 0.1176471, 1, 1,
0.4121942, 0.1351848, 0.02612244, 0, 0.1137255, 1, 1,
0.4152165, 0.1496661, 2.456593, 0, 0.1058824, 1, 1,
0.4208102, 2.377043, 0.9507248, 0, 0.09803922, 1, 1,
0.4226433, 0.4395641, -0.4326622, 0, 0.09411765, 1, 1,
0.4229264, 0.6102774, 0.6830693, 0, 0.08627451, 1, 1,
0.4255961, 0.02558919, 1.082512, 0, 0.08235294, 1, 1,
0.4285605, -0.4684378, 3.290669, 0, 0.07450981, 1, 1,
0.4289318, 0.06468588, 2.528828, 0, 0.07058824, 1, 1,
0.429801, 0.6619562, -0.3853966, 0, 0.0627451, 1, 1,
0.4335389, 1.292792, -0.5380387, 0, 0.05882353, 1, 1,
0.4350961, 0.6075615, 0.08125463, 0, 0.05098039, 1, 1,
0.4377403, 1.236219, 1.93464, 0, 0.04705882, 1, 1,
0.4443525, 0.5102172, 0.4041327, 0, 0.03921569, 1, 1,
0.4452231, -0.3801585, 1.706488, 0, 0.03529412, 1, 1,
0.4484831, -1.070303, 3.468786, 0, 0.02745098, 1, 1,
0.4509792, -2.327951, 3.019333, 0, 0.02352941, 1, 1,
0.4562999, 1.748353, 1.154441, 0, 0.01568628, 1, 1,
0.4578982, -0.915996, 2.444812, 0, 0.01176471, 1, 1,
0.4589114, -0.5846565, 2.444716, 0, 0.003921569, 1, 1,
0.4613587, -1.689436, 3.07834, 0.003921569, 0, 1, 1,
0.4641023, 1.094372, 1.484806, 0.007843138, 0, 1, 1,
0.4658093, -0.0008659003, 1.44715, 0.01568628, 0, 1, 1,
0.4681201, 0.9333583, -0.4405058, 0.01960784, 0, 1, 1,
0.4751839, 1.876201, 0.1022703, 0.02745098, 0, 1, 1,
0.4755793, -1.543938, 1.300127, 0.03137255, 0, 1, 1,
0.4784144, 1.118103, 1.14414, 0.03921569, 0, 1, 1,
0.4790538, 1.060975, 0.3480327, 0.04313726, 0, 1, 1,
0.4795175, 0.2470728, 2.161288, 0.05098039, 0, 1, 1,
0.4800927, -0.0866618, 1.471257, 0.05490196, 0, 1, 1,
0.4850377, 0.3020954, 3.833512, 0.0627451, 0, 1, 1,
0.4868552, -0.9876834, 2.823286, 0.06666667, 0, 1, 1,
0.4869101, -0.6426088, 2.448284, 0.07450981, 0, 1, 1,
0.4874321, 0.7328106, 0.8539608, 0.07843138, 0, 1, 1,
0.4881607, 0.8301005, 2.744387, 0.08627451, 0, 1, 1,
0.4997613, -0.3689114, 1.777061, 0.09019608, 0, 1, 1,
0.5010112, 0.3980239, 0.2503314, 0.09803922, 0, 1, 1,
0.5023848, -2.533808, 2.902257, 0.1058824, 0, 1, 1,
0.503333, -0.0194972, 1.75503, 0.1098039, 0, 1, 1,
0.5116037, -1.086912, 1.959095, 0.1176471, 0, 1, 1,
0.5161613, 0.2333725, 0.2517736, 0.1215686, 0, 1, 1,
0.5211091, -0.5602005, 4.797742, 0.1294118, 0, 1, 1,
0.5247984, -0.6234536, 2.605045, 0.1333333, 0, 1, 1,
0.5267419, -0.2750717, 1.446337, 0.1411765, 0, 1, 1,
0.5269338, 0.1552933, 1.99888, 0.145098, 0, 1, 1,
0.5290704, 0.3232226, 2.851077, 0.1529412, 0, 1, 1,
0.532642, 1.195329, 0.7763084, 0.1568628, 0, 1, 1,
0.5345045, -0.6183484, 2.489632, 0.1647059, 0, 1, 1,
0.5383143, -0.1816273, 2.043978, 0.1686275, 0, 1, 1,
0.539305, -2.066096, 3.478709, 0.1764706, 0, 1, 1,
0.5414971, 0.612379, -0.6010217, 0.1803922, 0, 1, 1,
0.547998, 0.4670154, 0.614724, 0.1882353, 0, 1, 1,
0.5480527, -0.6545491, 1.887443, 0.1921569, 0, 1, 1,
0.5483418, -0.5965164, 2.541036, 0.2, 0, 1, 1,
0.5573286, 0.8050277, 1.77604, 0.2078431, 0, 1, 1,
0.5576206, -0.2055677, 1.132876, 0.2117647, 0, 1, 1,
0.5672404, -1.446324, 2.524345, 0.2196078, 0, 1, 1,
0.5794122, 0.6857712, 3.761361, 0.2235294, 0, 1, 1,
0.5912853, -0.9425715, 2.549825, 0.2313726, 0, 1, 1,
0.6081135, -0.2608704, 2.250899, 0.2352941, 0, 1, 1,
0.6088033, -1.97892, 3.241924, 0.2431373, 0, 1, 1,
0.6088177, 1.078956, 0.5335647, 0.2470588, 0, 1, 1,
0.6111591, -0.8009764, 2.133829, 0.254902, 0, 1, 1,
0.6117369, -0.1763292, 2.757013, 0.2588235, 0, 1, 1,
0.6123128, -1.202827, 1.637674, 0.2666667, 0, 1, 1,
0.6152332, 2.704987, -1.261196, 0.2705882, 0, 1, 1,
0.6155601, -1.671855, 3.511392, 0.2784314, 0, 1, 1,
0.619737, -0.7007974, 3.057686, 0.282353, 0, 1, 1,
0.620546, 0.273146, 1.247592, 0.2901961, 0, 1, 1,
0.6206576, -0.215953, 1.689717, 0.2941177, 0, 1, 1,
0.6220276, 2.144561, -0.2502043, 0.3019608, 0, 1, 1,
0.6228042, 0.6509786, -0.4864348, 0.3098039, 0, 1, 1,
0.62685, -1.77414, 1.701137, 0.3137255, 0, 1, 1,
0.6293722, 0.2263848, -0.1550885, 0.3215686, 0, 1, 1,
0.6312855, -1.456938, 1.743198, 0.3254902, 0, 1, 1,
0.6319841, 0.1008795, -0.4595859, 0.3333333, 0, 1, 1,
0.633, 0.183645, 0.9047186, 0.3372549, 0, 1, 1,
0.6336646, -1.458686, 2.136212, 0.345098, 0, 1, 1,
0.6379065, -1.060056, -0.04618701, 0.3490196, 0, 1, 1,
0.6392471, -1.027715, 2.246038, 0.3568628, 0, 1, 1,
0.6401907, -1.097219, 2.34007, 0.3607843, 0, 1, 1,
0.6407722, 0.247927, 2.515922, 0.3686275, 0, 1, 1,
0.6443475, 1.517631, -0.965448, 0.372549, 0, 1, 1,
0.6479633, 0.1235066, 1.276857, 0.3803922, 0, 1, 1,
0.6495841, -0.04908609, 2.070807, 0.3843137, 0, 1, 1,
0.6503713, 0.2327528, 1.33004, 0.3921569, 0, 1, 1,
0.6556941, 0.9657048, 0.597635, 0.3960784, 0, 1, 1,
0.6567526, 1.179396, 0.8464322, 0.4039216, 0, 1, 1,
0.6634368, -1.150846, 4.311858, 0.4117647, 0, 1, 1,
0.6692793, 0.1373208, 0.3944476, 0.4156863, 0, 1, 1,
0.6700463, -0.09322374, 1.698491, 0.4235294, 0, 1, 1,
0.6713372, -1.255389, 3.625142, 0.427451, 0, 1, 1,
0.6727106, 1.318896, 0.4953976, 0.4352941, 0, 1, 1,
0.6739104, 0.05668784, 2.609002, 0.4392157, 0, 1, 1,
0.6798329, -0.153799, 2.569933, 0.4470588, 0, 1, 1,
0.6816225, 0.4943244, 0.6065313, 0.4509804, 0, 1, 1,
0.6827415, 0.7848278, 0.7227359, 0.4588235, 0, 1, 1,
0.6831824, -0.05671336, 2.82942, 0.4627451, 0, 1, 1,
0.6841374, -0.2658038, 0.7024807, 0.4705882, 0, 1, 1,
0.6855833, 0.6460531, -0.4352556, 0.4745098, 0, 1, 1,
0.6880051, 0.9535522, 0.6178883, 0.4823529, 0, 1, 1,
0.6934217, 0.773209, 1.756728, 0.4862745, 0, 1, 1,
0.694387, -2.053984, 2.444827, 0.4941176, 0, 1, 1,
0.709559, 1.701032, 0.6973007, 0.5019608, 0, 1, 1,
0.7107382, 0.7296998, -0.04164921, 0.5058824, 0, 1, 1,
0.7120188, -1.438856, 2.119858, 0.5137255, 0, 1, 1,
0.7121218, -0.3687461, 3.148372, 0.5176471, 0, 1, 1,
0.7130138, 1.070159, 1.111685, 0.5254902, 0, 1, 1,
0.7163858, -1.839148, 4.131875, 0.5294118, 0, 1, 1,
0.7195973, 0.1465044, 0.2224399, 0.5372549, 0, 1, 1,
0.7292498, -0.5170825, 3.14195, 0.5411765, 0, 1, 1,
0.7313777, -0.7302308, 1.250388, 0.5490196, 0, 1, 1,
0.7347288, -0.2005838, 0.07456099, 0.5529412, 0, 1, 1,
0.7362897, 0.5534292, 1.62273, 0.5607843, 0, 1, 1,
0.7364381, -0.3415543, 1.501814, 0.5647059, 0, 1, 1,
0.7418691, 1.049725, 1.272687, 0.572549, 0, 1, 1,
0.7423161, -0.6308539, 1.959935, 0.5764706, 0, 1, 1,
0.7423281, -0.8241617, 2.250978, 0.5843138, 0, 1, 1,
0.742333, -0.9327386, 2.149728, 0.5882353, 0, 1, 1,
0.7429703, -0.1913215, 2.020947, 0.5960785, 0, 1, 1,
0.7457206, -0.90279, 2.298284, 0.6039216, 0, 1, 1,
0.7458268, -0.4765667, -0.09301852, 0.6078432, 0, 1, 1,
0.7511169, 0.5804996, 1.777279, 0.6156863, 0, 1, 1,
0.7535793, -2.828908, 2.392969, 0.6196079, 0, 1, 1,
0.7547303, -0.2312852, 2.467051, 0.627451, 0, 1, 1,
0.7571868, 0.04289328, 0.8189449, 0.6313726, 0, 1, 1,
0.7577319, 0.7176895, 1.060192, 0.6392157, 0, 1, 1,
0.7606755, -0.7590752, 4.241375, 0.6431373, 0, 1, 1,
0.7650096, -1.065498, 2.648655, 0.6509804, 0, 1, 1,
0.7746759, 1.231738, 1.301872, 0.654902, 0, 1, 1,
0.7853131, -0.5204044, 1.466661, 0.6627451, 0, 1, 1,
0.7856127, 0.8186736, 0.4060068, 0.6666667, 0, 1, 1,
0.7889238, 0.1265909, 4.039791, 0.6745098, 0, 1, 1,
0.78921, 1.636476, -0.1847955, 0.6784314, 0, 1, 1,
0.7928455, 0.05599144, 0.8536798, 0.6862745, 0, 1, 1,
0.7962409, -0.5756874, 2.29487, 0.6901961, 0, 1, 1,
0.7975411, 1.029118, 0.3728008, 0.6980392, 0, 1, 1,
0.8010327, 0.5714035, 0.6247199, 0.7058824, 0, 1, 1,
0.8064926, 0.6785935, -0.07409302, 0.7098039, 0, 1, 1,
0.8096081, -0.3254825, 3.648762, 0.7176471, 0, 1, 1,
0.8112468, 1.056351, -0.08373729, 0.7215686, 0, 1, 1,
0.8113633, 0.4705666, -0.03220655, 0.7294118, 0, 1, 1,
0.8139778, -0.8189251, 0.2822262, 0.7333333, 0, 1, 1,
0.8172505, 0.1487664, 0.2231764, 0.7411765, 0, 1, 1,
0.819668, -0.8015662, 1.841557, 0.7450981, 0, 1, 1,
0.8249095, -0.8012801, 2.018788, 0.7529412, 0, 1, 1,
0.8268029, 2.696468, 0.6711308, 0.7568628, 0, 1, 1,
0.8291643, -0.05186019, 2.835263, 0.7647059, 0, 1, 1,
0.8312699, -0.7967823, 0.884033, 0.7686275, 0, 1, 1,
0.8314838, -0.7734695, 0.5631268, 0.7764706, 0, 1, 1,
0.836656, -0.03528832, 1.962343, 0.7803922, 0, 1, 1,
0.8400716, -0.549027, 2.451501, 0.7882353, 0, 1, 1,
0.8468021, -0.8645476, 1.715305, 0.7921569, 0, 1, 1,
0.8549201, -0.6476426, 2.955522, 0.8, 0, 1, 1,
0.857577, 1.948558, 0.2328177, 0.8078431, 0, 1, 1,
0.8578765, 1.440574, 1.369202, 0.8117647, 0, 1, 1,
0.8612198, -0.3003544, -0.4146728, 0.8196079, 0, 1, 1,
0.8636277, 0.8305143, 1.343074, 0.8235294, 0, 1, 1,
0.8654978, -1.708453, 3.124941, 0.8313726, 0, 1, 1,
0.866201, 0.414454, 1.014089, 0.8352941, 0, 1, 1,
0.8675131, 1.814309, 2.273681, 0.8431373, 0, 1, 1,
0.8687118, 0.9514743, 1.933535, 0.8470588, 0, 1, 1,
0.8694167, -0.9766808, 2.337287, 0.854902, 0, 1, 1,
0.8829572, 1.467494, 0.9313285, 0.8588235, 0, 1, 1,
0.8851781, 0.2662431, 2.214069, 0.8666667, 0, 1, 1,
0.9014665, -0.4782059, 3.913977, 0.8705882, 0, 1, 1,
0.9102013, 1.90576, -0.7433454, 0.8784314, 0, 1, 1,
0.9109657, 0.7139695, 2.319238, 0.8823529, 0, 1, 1,
0.9111614, -0.3113925, 4.41608, 0.8901961, 0, 1, 1,
0.9135001, -0.6388845, 1.010423, 0.8941177, 0, 1, 1,
0.9149934, -0.6915897, 2.90333, 0.9019608, 0, 1, 1,
0.9193836, 1.771848, 1.657062, 0.9098039, 0, 1, 1,
0.92373, -2.407813, 2.913398, 0.9137255, 0, 1, 1,
0.9284781, 1.020347, 1.883751, 0.9215686, 0, 1, 1,
0.9332401, 0.3648541, 0.5956794, 0.9254902, 0, 1, 1,
0.9338941, 0.2016, -0.02756377, 0.9333333, 0, 1, 1,
0.9350548, 0.8413656, 0.7949153, 0.9372549, 0, 1, 1,
0.9387504, -0.8864442, 2.290132, 0.945098, 0, 1, 1,
0.9454616, -0.2634907, 2.495461, 0.9490196, 0, 1, 1,
0.9495055, -1.301009, 3.000829, 0.9568627, 0, 1, 1,
0.9519011, 1.43413, -0.8006967, 0.9607843, 0, 1, 1,
0.9555284, -1.265316, 3.3081, 0.9686275, 0, 1, 1,
0.9557206, -1.144009, 1.423645, 0.972549, 0, 1, 1,
0.9580125, 0.1562354, 0.9320403, 0.9803922, 0, 1, 1,
0.960077, 0.4456676, 2.894064, 0.9843137, 0, 1, 1,
0.96538, -0.09063432, 2.475727, 0.9921569, 0, 1, 1,
0.971702, -1.478976, 3.073215, 0.9960784, 0, 1, 1,
0.9757337, 0.4119289, 2.364453, 1, 0, 0.9960784, 1,
0.9762833, -1.044477, 3.291651, 1, 0, 0.9882353, 1,
0.9789055, -2.300508, 4.322707, 1, 0, 0.9843137, 1,
0.9882736, 0.1921561, 1.09164, 1, 0, 0.9764706, 1,
0.9886529, 0.07203215, 2.319374, 1, 0, 0.972549, 1,
0.9897151, 0.03920839, 1.98937, 1, 0, 0.9647059, 1,
0.9980686, -0.05847761, 1.703056, 1, 0, 0.9607843, 1,
1.006123, -0.2570558, 1.051887, 1, 0, 0.9529412, 1,
1.008611, -0.3934628, 1.521726, 1, 0, 0.9490196, 1,
1.00969, 0.2302948, 1.513323, 1, 0, 0.9411765, 1,
1.015344, 0.5181206, 1.024797, 1, 0, 0.9372549, 1,
1.021152, 0.5070447, 1.363766, 1, 0, 0.9294118, 1,
1.022753, 0.6353593, 0.7319431, 1, 0, 0.9254902, 1,
1.022815, 0.09916498, 0.2914501, 1, 0, 0.9176471, 1,
1.03258, -2.044408, 2.365787, 1, 0, 0.9137255, 1,
1.044266, -0.4421492, 2.133143, 1, 0, 0.9058824, 1,
1.046986, -0.1398045, 1.647647, 1, 0, 0.9019608, 1,
1.051536, 0.6510927, 0.3969553, 1, 0, 0.8941177, 1,
1.052373, 1.785418, 0.1540914, 1, 0, 0.8862745, 1,
1.054427, 0.4522912, 1.535015, 1, 0, 0.8823529, 1,
1.058082, 0.8663424, 2.050292, 1, 0, 0.8745098, 1,
1.061717, -0.5722948, 1.543512, 1, 0, 0.8705882, 1,
1.07066, 0.9556993, 1.476812, 1, 0, 0.8627451, 1,
1.071643, -2.103075, 3.076327, 1, 0, 0.8588235, 1,
1.083995, -0.03540333, 3.157214, 1, 0, 0.8509804, 1,
1.085162, 0.9352414, -1.790443, 1, 0, 0.8470588, 1,
1.093028, -0.5250764, 1.65927, 1, 0, 0.8392157, 1,
1.094018, -0.8888847, 2.245671, 1, 0, 0.8352941, 1,
1.099342, 1.27324, 0.8542878, 1, 0, 0.827451, 1,
1.107672, -1.468684, 3.501612, 1, 0, 0.8235294, 1,
1.112118, 0.5297366, 1.303174, 1, 0, 0.8156863, 1,
1.113282, 0.9017507, 2.421124, 1, 0, 0.8117647, 1,
1.118034, 1.597747, 0.407023, 1, 0, 0.8039216, 1,
1.118428, 0.3441325, 0.8681023, 1, 0, 0.7960784, 1,
1.122064, 0.7348738, -1.966399, 1, 0, 0.7921569, 1,
1.122208, -1.32692, 0.9515523, 1, 0, 0.7843137, 1,
1.128153, 0.2981125, 0.6362811, 1, 0, 0.7803922, 1,
1.134093, 0.6201403, 1.947564, 1, 0, 0.772549, 1,
1.145324, -0.9633142, 2.742547, 1, 0, 0.7686275, 1,
1.145384, 0.1339537, 1.267028, 1, 0, 0.7607843, 1,
1.156261, 1.570934, -1.127303, 1, 0, 0.7568628, 1,
1.156876, -0.2591463, 1.910863, 1, 0, 0.7490196, 1,
1.159079, 0.02392685, 2.087354, 1, 0, 0.7450981, 1,
1.168921, 0.8149173, 0.6911857, 1, 0, 0.7372549, 1,
1.170614, 1.530414, 2.300063, 1, 0, 0.7333333, 1,
1.177089, -1.711478, 2.154617, 1, 0, 0.7254902, 1,
1.17848, 0.5528231, 1.715493, 1, 0, 0.7215686, 1,
1.191398, -0.5611907, 1.529211, 1, 0, 0.7137255, 1,
1.194496, -0.7109479, 4.075608, 1, 0, 0.7098039, 1,
1.195304, 0.9191087, 2.072848, 1, 0, 0.7019608, 1,
1.195326, 0.3860742, 1.18995, 1, 0, 0.6941177, 1,
1.19731, 0.191458, 0.8282185, 1, 0, 0.6901961, 1,
1.199006, 0.4806027, 1.600454, 1, 0, 0.682353, 1,
1.207794, -0.01038053, 0.7227895, 1, 0, 0.6784314, 1,
1.219816, 0.1545393, 2.281894, 1, 0, 0.6705883, 1,
1.223093, -2.026913, 2.346748, 1, 0, 0.6666667, 1,
1.227055, -0.7832905, 1.897948, 1, 0, 0.6588235, 1,
1.230184, 0.1201101, 1.760154, 1, 0, 0.654902, 1,
1.236747, -0.07195022, 1.327816, 1, 0, 0.6470588, 1,
1.248362, 1.283108, 3.056559, 1, 0, 0.6431373, 1,
1.248828, 0.02364803, 0.4777198, 1, 0, 0.6352941, 1,
1.258103, -1.093482, 4.943051, 1, 0, 0.6313726, 1,
1.265688, -1.098698, 2.006181, 1, 0, 0.6235294, 1,
1.273609, 0.8366107, 1.627453, 1, 0, 0.6196079, 1,
1.274285, -0.9203148, 0.8293114, 1, 0, 0.6117647, 1,
1.282816, 0.1380292, 1.583715, 1, 0, 0.6078432, 1,
1.293756, 0.4880213, -0.1203061, 1, 0, 0.6, 1,
1.304188, -0.07650553, -0.5207042, 1, 0, 0.5921569, 1,
1.309832, -0.1223485, 1.072154, 1, 0, 0.5882353, 1,
1.312664, -0.1982326, 2.738235, 1, 0, 0.5803922, 1,
1.318998, 1.220195, -0.5789143, 1, 0, 0.5764706, 1,
1.326309, 0.2651432, 1.724838, 1, 0, 0.5686275, 1,
1.335695, 0.3503621, 1.871041, 1, 0, 0.5647059, 1,
1.339036, 0.2990488, -1.078683, 1, 0, 0.5568628, 1,
1.339718, 0.02745454, 1.09589, 1, 0, 0.5529412, 1,
1.343248, -0.6612584, 2.894039, 1, 0, 0.5450981, 1,
1.357116, -1.60744, 2.716708, 1, 0, 0.5411765, 1,
1.358584, -1.714009, 3.273461, 1, 0, 0.5333334, 1,
1.3646, 0.6040294, 1.263104, 1, 0, 0.5294118, 1,
1.368549, 0.7887753, -0.5332732, 1, 0, 0.5215687, 1,
1.371001, -0.4415076, 3.686829, 1, 0, 0.5176471, 1,
1.373586, -0.7953042, 0.7801168, 1, 0, 0.509804, 1,
1.379112, -0.09779624, 0.4683615, 1, 0, 0.5058824, 1,
1.385259, -0.2257906, 2.930854, 1, 0, 0.4980392, 1,
1.389817, 0.7599072, 1.538471, 1, 0, 0.4901961, 1,
1.391383, 0.6661652, 1.97887, 1, 0, 0.4862745, 1,
1.412022, 1.411007, 0.9368806, 1, 0, 0.4784314, 1,
1.427508, -0.593329, 0.2889767, 1, 0, 0.4745098, 1,
1.436772, -0.5724236, 2.272324, 1, 0, 0.4666667, 1,
1.445241, -1.992568, 3.240537, 1, 0, 0.4627451, 1,
1.445307, -1.898886, 2.556757, 1, 0, 0.454902, 1,
1.450904, 1.325944, 1.307425, 1, 0, 0.4509804, 1,
1.462539, 0.6738174, 1.873821, 1, 0, 0.4431373, 1,
1.477054, 1.282369, -0.605498, 1, 0, 0.4392157, 1,
1.48015, 1.818578, 2.143312, 1, 0, 0.4313726, 1,
1.486553, 1.663212, 1.304037, 1, 0, 0.427451, 1,
1.500589, 0.910551, 2.519083, 1, 0, 0.4196078, 1,
1.511753, 0.2834232, 1.011163, 1, 0, 0.4156863, 1,
1.548289, 0.04485574, 2.136621, 1, 0, 0.4078431, 1,
1.557603, -0.1745434, 2.295918, 1, 0, 0.4039216, 1,
1.560703, 0.6604959, 3.03089, 1, 0, 0.3960784, 1,
1.580139, 0.6917875, 3.610941, 1, 0, 0.3882353, 1,
1.585116, 0.07044476, 2.071936, 1, 0, 0.3843137, 1,
1.595259, 0.4236811, 1.475619, 1, 0, 0.3764706, 1,
1.595597, 0.2528437, 2.77587, 1, 0, 0.372549, 1,
1.608226, 1.207246, -0.5486628, 1, 0, 0.3647059, 1,
1.610779, 0.2597814, 0.6979734, 1, 0, 0.3607843, 1,
1.614922, 2.539353, 0.04788835, 1, 0, 0.3529412, 1,
1.621779, 0.1479414, 0.4828461, 1, 0, 0.3490196, 1,
1.635989, 0.4947601, 0.7202139, 1, 0, 0.3411765, 1,
1.644024, 0.7417533, 1.184476, 1, 0, 0.3372549, 1,
1.649771, -0.2492887, 2.580472, 1, 0, 0.3294118, 1,
1.651105, 0.5928625, 1.423737, 1, 0, 0.3254902, 1,
1.659601, -0.4225787, 2.634408, 1, 0, 0.3176471, 1,
1.666065, 0.3519307, 0.6832374, 1, 0, 0.3137255, 1,
1.673768, 0.8827703, 2.23235, 1, 0, 0.3058824, 1,
1.708803, -1.473087, 0.9762744, 1, 0, 0.2980392, 1,
1.712389, 1.44509, 1.671219, 1, 0, 0.2941177, 1,
1.727826, 1.350041, 1.254847, 1, 0, 0.2862745, 1,
1.74068, 0.3359075, 2.055823, 1, 0, 0.282353, 1,
1.744487, 1.516515, 1.638466, 1, 0, 0.2745098, 1,
1.794406, -0.01604893, 0.05938424, 1, 0, 0.2705882, 1,
1.809386, -0.5926632, 1.444351, 1, 0, 0.2627451, 1,
1.831931, 1.693927, 0.4742264, 1, 0, 0.2588235, 1,
1.835749, -0.08091909, 1.468932, 1, 0, 0.2509804, 1,
1.840753, -0.2398127, 1.152108, 1, 0, 0.2470588, 1,
1.86208, -0.2037686, 1.389338, 1, 0, 0.2392157, 1,
1.863068, -0.325223, 1.079256, 1, 0, 0.2352941, 1,
1.875559, -1.945576, 0.6584514, 1, 0, 0.227451, 1,
1.880708, 1.109287, -0.6921707, 1, 0, 0.2235294, 1,
1.88318, 0.7853818, 0.3903612, 1, 0, 0.2156863, 1,
1.885767, 0.4210322, 0.9988741, 1, 0, 0.2117647, 1,
1.901422, -0.1391869, 1.73189, 1, 0, 0.2039216, 1,
1.920428, -0.4488541, 1.938676, 1, 0, 0.1960784, 1,
1.960131, 0.6215015, 3.031026, 1, 0, 0.1921569, 1,
1.96329, -0.9251992, -0.211702, 1, 0, 0.1843137, 1,
1.974939, -0.5880159, 2.791773, 1, 0, 0.1803922, 1,
1.986446, 1.354761, 1.226404, 1, 0, 0.172549, 1,
1.987705, 1.997289, 0.004205954, 1, 0, 0.1686275, 1,
1.993103, 1.361607, 0.5627411, 1, 0, 0.1607843, 1,
1.994083, -0.1543793, 0.5894585, 1, 0, 0.1568628, 1,
2.03002, 0.5228485, 3.72543, 1, 0, 0.1490196, 1,
2.036038, 0.3751737, 1.643781, 1, 0, 0.145098, 1,
2.038141, -0.7467319, 3.123832, 1, 0, 0.1372549, 1,
2.04862, 0.6881416, 0.1618022, 1, 0, 0.1333333, 1,
2.050834, 2.666537, 0.2601477, 1, 0, 0.1254902, 1,
2.063307, -0.3903631, 1.378053, 1, 0, 0.1215686, 1,
2.085702, -0.2120249, 0.9840682, 1, 0, 0.1137255, 1,
2.092742, -0.4613081, 1.954495, 1, 0, 0.1098039, 1,
2.105207, -0.8906017, 1.67132, 1, 0, 0.1019608, 1,
2.121634, 0.01679461, 1.646592, 1, 0, 0.09411765, 1,
2.129543, -0.1427511, 2.436522, 1, 0, 0.09019608, 1,
2.167434, 1.651581, -0.7741993, 1, 0, 0.08235294, 1,
2.174228, -0.5175852, 1.972288, 1, 0, 0.07843138, 1,
2.207853, -0.0614608, 1.811532, 1, 0, 0.07058824, 1,
2.214758, -0.663654, 1.080283, 1, 0, 0.06666667, 1,
2.28085, 0.9530948, 0.2555278, 1, 0, 0.05882353, 1,
2.328926, 0.8142207, 2.065864, 1, 0, 0.05490196, 1,
2.338568, -1.200877, 0.963192, 1, 0, 0.04705882, 1,
2.444912, -0.1936017, 2.627083, 1, 0, 0.04313726, 1,
2.494616, 0.8552116, 0.8314774, 1, 0, 0.03529412, 1,
2.5371, -0.7555733, 0.1204297, 1, 0, 0.03137255, 1,
2.585051, -0.8992544, 2.652408, 1, 0, 0.02352941, 1,
2.615802, -1.832526, 1.973264, 1, 0, 0.01960784, 1,
2.815713, 0.01083713, 0.976639, 1, 0, 0.01176471, 1,
3.173316, -2.073373, 1.05462, 1, 0, 0.007843138, 1
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
-0.1906414, -4.739141, -6.476615, 0, -0.5, 0.5, 0.5,
-0.1906414, -4.739141, -6.476615, 1, -0.5, 0.5, 0.5,
-0.1906414, -4.739141, -6.476615, 1, 1.5, 0.5, 0.5,
-0.1906414, -4.739141, -6.476615, 0, 1.5, 0.5, 0.5
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
-4.694981, -0.1409664, -6.476615, 0, -0.5, 0.5, 0.5,
-4.694981, -0.1409664, -6.476615, 1, -0.5, 0.5, 0.5,
-4.694981, -0.1409664, -6.476615, 1, 1.5, 0.5, 0.5,
-4.694981, -0.1409664, -6.476615, 0, 1.5, 0.5, 0.5
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
-4.694981, -4.739141, 0.1132498, 0, -0.5, 0.5, 0.5,
-4.694981, -4.739141, 0.1132498, 1, -0.5, 0.5, 0.5,
-4.694981, -4.739141, 0.1132498, 1, 1.5, 0.5, 0.5,
-4.694981, -4.739141, 0.1132498, 0, 1.5, 0.5, 0.5
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
-3, -3.678024, -4.955877,
3, -3.678024, -4.955877,
-3, -3.678024, -4.955877,
-3, -3.854877, -5.209333,
-2, -3.678024, -4.955877,
-2, -3.854877, -5.209333,
-1, -3.678024, -4.955877,
-1, -3.854877, -5.209333,
0, -3.678024, -4.955877,
0, -3.854877, -5.209333,
1, -3.678024, -4.955877,
1, -3.854877, -5.209333,
2, -3.678024, -4.955877,
2, -3.854877, -5.209333,
3, -3.678024, -4.955877,
3, -3.854877, -5.209333
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
-3, -4.208582, -5.716246, 0, -0.5, 0.5, 0.5,
-3, -4.208582, -5.716246, 1, -0.5, 0.5, 0.5,
-3, -4.208582, -5.716246, 1, 1.5, 0.5, 0.5,
-3, -4.208582, -5.716246, 0, 1.5, 0.5, 0.5,
-2, -4.208582, -5.716246, 0, -0.5, 0.5, 0.5,
-2, -4.208582, -5.716246, 1, -0.5, 0.5, 0.5,
-2, -4.208582, -5.716246, 1, 1.5, 0.5, 0.5,
-2, -4.208582, -5.716246, 0, 1.5, 0.5, 0.5,
-1, -4.208582, -5.716246, 0, -0.5, 0.5, 0.5,
-1, -4.208582, -5.716246, 1, -0.5, 0.5, 0.5,
-1, -4.208582, -5.716246, 1, 1.5, 0.5, 0.5,
-1, -4.208582, -5.716246, 0, 1.5, 0.5, 0.5,
0, -4.208582, -5.716246, 0, -0.5, 0.5, 0.5,
0, -4.208582, -5.716246, 1, -0.5, 0.5, 0.5,
0, -4.208582, -5.716246, 1, 1.5, 0.5, 0.5,
0, -4.208582, -5.716246, 0, 1.5, 0.5, 0.5,
1, -4.208582, -5.716246, 0, -0.5, 0.5, 0.5,
1, -4.208582, -5.716246, 1, -0.5, 0.5, 0.5,
1, -4.208582, -5.716246, 1, 1.5, 0.5, 0.5,
1, -4.208582, -5.716246, 0, 1.5, 0.5, 0.5,
2, -4.208582, -5.716246, 0, -0.5, 0.5, 0.5,
2, -4.208582, -5.716246, 1, -0.5, 0.5, 0.5,
2, -4.208582, -5.716246, 1, 1.5, 0.5, 0.5,
2, -4.208582, -5.716246, 0, 1.5, 0.5, 0.5,
3, -4.208582, -5.716246, 0, -0.5, 0.5, 0.5,
3, -4.208582, -5.716246, 1, -0.5, 0.5, 0.5,
3, -4.208582, -5.716246, 1, 1.5, 0.5, 0.5,
3, -4.208582, -5.716246, 0, 1.5, 0.5, 0.5
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
-3.655518, -3, -4.955877,
-3.655518, 3, -4.955877,
-3.655518, -3, -4.955877,
-3.828762, -3, -5.209333,
-3.655518, -2, -4.955877,
-3.828762, -2, -5.209333,
-3.655518, -1, -4.955877,
-3.828762, -1, -5.209333,
-3.655518, 0, -4.955877,
-3.828762, 0, -5.209333,
-3.655518, 1, -4.955877,
-3.828762, 1, -5.209333,
-3.655518, 2, -4.955877,
-3.828762, 2, -5.209333,
-3.655518, 3, -4.955877,
-3.828762, 3, -5.209333
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
-4.17525, -3, -5.716246, 0, -0.5, 0.5, 0.5,
-4.17525, -3, -5.716246, 1, -0.5, 0.5, 0.5,
-4.17525, -3, -5.716246, 1, 1.5, 0.5, 0.5,
-4.17525, -3, -5.716246, 0, 1.5, 0.5, 0.5,
-4.17525, -2, -5.716246, 0, -0.5, 0.5, 0.5,
-4.17525, -2, -5.716246, 1, -0.5, 0.5, 0.5,
-4.17525, -2, -5.716246, 1, 1.5, 0.5, 0.5,
-4.17525, -2, -5.716246, 0, 1.5, 0.5, 0.5,
-4.17525, -1, -5.716246, 0, -0.5, 0.5, 0.5,
-4.17525, -1, -5.716246, 1, -0.5, 0.5, 0.5,
-4.17525, -1, -5.716246, 1, 1.5, 0.5, 0.5,
-4.17525, -1, -5.716246, 0, 1.5, 0.5, 0.5,
-4.17525, 0, -5.716246, 0, -0.5, 0.5, 0.5,
-4.17525, 0, -5.716246, 1, -0.5, 0.5, 0.5,
-4.17525, 0, -5.716246, 1, 1.5, 0.5, 0.5,
-4.17525, 0, -5.716246, 0, 1.5, 0.5, 0.5,
-4.17525, 1, -5.716246, 0, -0.5, 0.5, 0.5,
-4.17525, 1, -5.716246, 1, -0.5, 0.5, 0.5,
-4.17525, 1, -5.716246, 1, 1.5, 0.5, 0.5,
-4.17525, 1, -5.716246, 0, 1.5, 0.5, 0.5,
-4.17525, 2, -5.716246, 0, -0.5, 0.5, 0.5,
-4.17525, 2, -5.716246, 1, -0.5, 0.5, 0.5,
-4.17525, 2, -5.716246, 1, 1.5, 0.5, 0.5,
-4.17525, 2, -5.716246, 0, 1.5, 0.5, 0.5,
-4.17525, 3, -5.716246, 0, -0.5, 0.5, 0.5,
-4.17525, 3, -5.716246, 1, -0.5, 0.5, 0.5,
-4.17525, 3, -5.716246, 1, 1.5, 0.5, 0.5,
-4.17525, 3, -5.716246, 0, 1.5, 0.5, 0.5
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
-3.655518, -3.678024, -4,
-3.655518, -3.678024, 4,
-3.655518, -3.678024, -4,
-3.828762, -3.854877, -4,
-3.655518, -3.678024, -2,
-3.828762, -3.854877, -2,
-3.655518, -3.678024, 0,
-3.828762, -3.854877, 0,
-3.655518, -3.678024, 2,
-3.828762, -3.854877, 2,
-3.655518, -3.678024, 4,
-3.828762, -3.854877, 4
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
-4.17525, -4.208582, -4, 0, -0.5, 0.5, 0.5,
-4.17525, -4.208582, -4, 1, -0.5, 0.5, 0.5,
-4.17525, -4.208582, -4, 1, 1.5, 0.5, 0.5,
-4.17525, -4.208582, -4, 0, 1.5, 0.5, 0.5,
-4.17525, -4.208582, -2, 0, -0.5, 0.5, 0.5,
-4.17525, -4.208582, -2, 1, -0.5, 0.5, 0.5,
-4.17525, -4.208582, -2, 1, 1.5, 0.5, 0.5,
-4.17525, -4.208582, -2, 0, 1.5, 0.5, 0.5,
-4.17525, -4.208582, 0, 0, -0.5, 0.5, 0.5,
-4.17525, -4.208582, 0, 1, -0.5, 0.5, 0.5,
-4.17525, -4.208582, 0, 1, 1.5, 0.5, 0.5,
-4.17525, -4.208582, 0, 0, 1.5, 0.5, 0.5,
-4.17525, -4.208582, 2, 0, -0.5, 0.5, 0.5,
-4.17525, -4.208582, 2, 1, -0.5, 0.5, 0.5,
-4.17525, -4.208582, 2, 1, 1.5, 0.5, 0.5,
-4.17525, -4.208582, 2, 0, 1.5, 0.5, 0.5,
-4.17525, -4.208582, 4, 0, -0.5, 0.5, 0.5,
-4.17525, -4.208582, 4, 1, -0.5, 0.5, 0.5,
-4.17525, -4.208582, 4, 1, 1.5, 0.5, 0.5,
-4.17525, -4.208582, 4, 0, 1.5, 0.5, 0.5
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
-3.655518, -3.678024, -4.955877,
-3.655518, 3.396091, -4.955877,
-3.655518, -3.678024, 5.182377,
-3.655518, 3.396091, 5.182377,
-3.655518, -3.678024, -4.955877,
-3.655518, -3.678024, 5.182377,
-3.655518, 3.396091, -4.955877,
-3.655518, 3.396091, 5.182377,
-3.655518, -3.678024, -4.955877,
3.274235, -3.678024, -4.955877,
-3.655518, -3.678024, 5.182377,
3.274235, -3.678024, 5.182377,
-3.655518, 3.396091, -4.955877,
3.274235, 3.396091, -4.955877,
-3.655518, 3.396091, 5.182377,
3.274235, 3.396091, 5.182377,
3.274235, -3.678024, -4.955877,
3.274235, 3.396091, -4.955877,
3.274235, -3.678024, 5.182377,
3.274235, 3.396091, 5.182377,
3.274235, -3.678024, -4.955877,
3.274235, -3.678024, 5.182377,
3.274235, 3.396091, -4.955877,
3.274235, 3.396091, 5.182377
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
var radius = 7.567633;
var distance = 33.66925;
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
mvMatrix.translate( 0.1906414, 0.1409664, -0.1132498 );
mvMatrix.scale( 1.180745, 1.15665, 0.8070692 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.66925);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
diethatyl<-read.table("diethatyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diethatyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'diethatyl' not found
```

```r
y<-diethatyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'diethatyl' not found
```

```r
z<-diethatyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'diethatyl' not found
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
-3.554599, -0.5042053, -1.480743, 0, 0, 1, 1, 1,
-3.386322, -0.4632601, -1.438783, 1, 0, 0, 1, 1,
-2.914583, 0.3640021, -0.8655922, 1, 0, 0, 1, 1,
-2.727008, 0.03344174, -0.6863039, 1, 0, 0, 1, 1,
-2.624381, 1.478035, -0.7716455, 1, 0, 0, 1, 1,
-2.525175, 0.6969671, -0.6455582, 1, 0, 0, 1, 1,
-2.482241, 0.8995145, -1.217689, 0, 0, 0, 1, 1,
-2.470269, -0.4765346, -2.349905, 0, 0, 0, 1, 1,
-2.405379, 0.7800294, -2.904837, 0, 0, 0, 1, 1,
-2.386264, -0.3486384, -1.133855, 0, 0, 0, 1, 1,
-2.350779, 0.7972234, -1.351137, 0, 0, 0, 1, 1,
-2.309243, 1.17952, 0.4878828, 0, 0, 0, 1, 1,
-2.242608, 0.5180496, -2.628772, 0, 0, 0, 1, 1,
-2.238662, -0.6882865, -2.273024, 1, 1, 1, 1, 1,
-2.236722, -0.3051546, 0.02333728, 1, 1, 1, 1, 1,
-2.232619, 1.068092, -1.160173, 1, 1, 1, 1, 1,
-2.210815, -0.4162023, -1.154428, 1, 1, 1, 1, 1,
-2.196595, -0.7121369, -1.519192, 1, 1, 1, 1, 1,
-2.145166, -1.400285, -2.054012, 1, 1, 1, 1, 1,
-2.129871, -0.3821573, -1.601295, 1, 1, 1, 1, 1,
-2.128058, -0.2489763, -1.089201, 1, 1, 1, 1, 1,
-2.107218, -1.5444, -4.160841, 1, 1, 1, 1, 1,
-2.081867, -0.3584612, -2.485103, 1, 1, 1, 1, 1,
-2.067709, -1.46792, -1.109416, 1, 1, 1, 1, 1,
-2.032746, 0.6559333, -1.724536, 1, 1, 1, 1, 1,
-2.023445, -0.7559682, -0.4316564, 1, 1, 1, 1, 1,
-2.022583, -1.136812, -1.769333, 1, 1, 1, 1, 1,
-2.01706, -0.744002, -1.101912, 1, 1, 1, 1, 1,
-2.006668, -0.6786904, -3.522058, 0, 0, 1, 1, 1,
-2.004894, -0.246142, -1.94972, 1, 0, 0, 1, 1,
-1.97962, 0.6302646, -0.6146793, 1, 0, 0, 1, 1,
-1.972392, -0.1462675, -1.241989, 1, 0, 0, 1, 1,
-1.972211, -0.1018217, -1.385446, 1, 0, 0, 1, 1,
-1.96278, 0.7338542, -1.205535, 1, 0, 0, 1, 1,
-1.962205, 0.158326, -0.2317132, 0, 0, 0, 1, 1,
-1.957202, 0.8581587, -1.654266, 0, 0, 0, 1, 1,
-1.956215, 0.9048759, -1.34206, 0, 0, 0, 1, 1,
-1.940723, -0.628499, -0.7941803, 0, 0, 0, 1, 1,
-1.935571, -0.5993416, -0.2715012, 0, 0, 0, 1, 1,
-1.92413, -0.6896163, -0.7818329, 0, 0, 0, 1, 1,
-1.900271, -1.190535, -0.9185807, 0, 0, 0, 1, 1,
-1.898867, -0.04308695, -2.200108, 1, 1, 1, 1, 1,
-1.896503, 0.6998735, -1.531103, 1, 1, 1, 1, 1,
-1.884474, 0.9053071, 0.1730316, 1, 1, 1, 1, 1,
-1.87924, -0.4719747, -2.601799, 1, 1, 1, 1, 1,
-1.872144, 1.396224, -1.168237, 1, 1, 1, 1, 1,
-1.858625, -0.08812199, -2.930168, 1, 1, 1, 1, 1,
-1.8233, -0.3312427, -1.56829, 1, 1, 1, 1, 1,
-1.813771, 1.148716, -1.728401, 1, 1, 1, 1, 1,
-1.806262, -0.2873585, -0.5137816, 1, 1, 1, 1, 1,
-1.798467, 0.1958237, -2.020664, 1, 1, 1, 1, 1,
-1.797758, 1.190202, 0.6675727, 1, 1, 1, 1, 1,
-1.773958, -1.305314, -0.447905, 1, 1, 1, 1, 1,
-1.773636, 0.245755, -3.307688, 1, 1, 1, 1, 1,
-1.752192, -0.8399619, -1.859447, 1, 1, 1, 1, 1,
-1.730448, -1.351578, -1.774395, 1, 1, 1, 1, 1,
-1.728173, 1.37163, -0.9257098, 0, 0, 1, 1, 1,
-1.719776, 0.08333757, -1.362508, 1, 0, 0, 1, 1,
-1.717353, -0.6868125, -1.182649, 1, 0, 0, 1, 1,
-1.711206, 0.007375269, -2.585489, 1, 0, 0, 1, 1,
-1.708758, -1.5132, -3.051082, 1, 0, 0, 1, 1,
-1.682949, 0.3417208, -0.5123211, 1, 0, 0, 1, 1,
-1.667941, -1.449372, -0.587495, 0, 0, 0, 1, 1,
-1.663507, -0.3687706, -2.669646, 0, 0, 0, 1, 1,
-1.647859, -0.1942707, -0.7192417, 0, 0, 0, 1, 1,
-1.635896, 0.4424855, -0.6068699, 0, 0, 0, 1, 1,
-1.61699, -0.6092334, -2.133943, 0, 0, 0, 1, 1,
-1.599418, 0.2978371, -1.260929, 0, 0, 0, 1, 1,
-1.574055, -0.3676648, -3.429188, 0, 0, 0, 1, 1,
-1.55198, 0.1961693, -0.8164576, 1, 1, 1, 1, 1,
-1.528704, -1.310763, -3.21296, 1, 1, 1, 1, 1,
-1.526941, -1.906951, -3.064081, 1, 1, 1, 1, 1,
-1.522929, 0.3284166, -2.061136, 1, 1, 1, 1, 1,
-1.49456, 0.5211267, -1.878949, 1, 1, 1, 1, 1,
-1.484796, 0.0693135, -1.204883, 1, 1, 1, 1, 1,
-1.482901, 2.044291, 0.6794548, 1, 1, 1, 1, 1,
-1.479652, -1.739914, -2.806803, 1, 1, 1, 1, 1,
-1.475589, -0.1784777, -1.437237, 1, 1, 1, 1, 1,
-1.474234, 0.6207894, -1.374394, 1, 1, 1, 1, 1,
-1.471132, -0.4628106, -4.808233, 1, 1, 1, 1, 1,
-1.468014, 1.158773, -1.823349, 1, 1, 1, 1, 1,
-1.448973, -0.6724401, -3.44722, 1, 1, 1, 1, 1,
-1.441202, -0.03797233, -1.832987, 1, 1, 1, 1, 1,
-1.433867, -0.8922305, -1.954678, 1, 1, 1, 1, 1,
-1.432608, 2.423357, 0.06425618, 0, 0, 1, 1, 1,
-1.420101, -0.7983925, -3.583357, 1, 0, 0, 1, 1,
-1.415873, -3.575003, -2.630959, 1, 0, 0, 1, 1,
-1.405899, 1.696839, 1.263575, 1, 0, 0, 1, 1,
-1.403244, 0.0919573, -1.471084, 1, 0, 0, 1, 1,
-1.388641, 1.800191, 0.186983, 1, 0, 0, 1, 1,
-1.375184, -0.3990999, -2.362905, 0, 0, 0, 1, 1,
-1.373191, 1.234967, -0.7342685, 0, 0, 0, 1, 1,
-1.371774, 0.889829, 0.3486732, 0, 0, 0, 1, 1,
-1.368353, 0.2949493, -1.412696, 0, 0, 0, 1, 1,
-1.367004, 0.5289643, 1.208182, 0, 0, 0, 1, 1,
-1.366115, 0.7250719, -0.4643309, 0, 0, 0, 1, 1,
-1.366052, -1.175047, -2.629098, 0, 0, 0, 1, 1,
-1.362903, 0.2116117, -1.541225, 1, 1, 1, 1, 1,
-1.359182, -0.5537734, 0.3968711, 1, 1, 1, 1, 1,
-1.349799, 1.982758, 0.8721131, 1, 1, 1, 1, 1,
-1.344012, 1.189953, -0.5085354, 1, 1, 1, 1, 1,
-1.336119, -1.916187, -4.66513, 1, 1, 1, 1, 1,
-1.333209, -0.8158501, -2.075326, 1, 1, 1, 1, 1,
-1.32631, 0.3288469, -1.342212, 1, 1, 1, 1, 1,
-1.315268, 1.932673, -1.015356, 1, 1, 1, 1, 1,
-1.305908, -0.201961, -2.761502, 1, 1, 1, 1, 1,
-1.301363, -0.5296497, -1.398219, 1, 1, 1, 1, 1,
-1.295859, 0.2164249, -0.483382, 1, 1, 1, 1, 1,
-1.290109, 0.4707323, -2.113728, 1, 1, 1, 1, 1,
-1.287027, 0.9759492, -0.459828, 1, 1, 1, 1, 1,
-1.281083, -1.184648, -2.193883, 1, 1, 1, 1, 1,
-1.278003, 2.543549, -0.358863, 1, 1, 1, 1, 1,
-1.27054, 1.151397, -0.8248762, 0, 0, 1, 1, 1,
-1.260666, -1.070079, -2.862646, 1, 0, 0, 1, 1,
-1.257771, -2.057668, -2.126573, 1, 0, 0, 1, 1,
-1.236111, 1.472541, -3.548192, 1, 0, 0, 1, 1,
-1.235498, -0.2444034, -2.462013, 1, 0, 0, 1, 1,
-1.233023, 0.7877526, -1.402372, 1, 0, 0, 1, 1,
-1.217866, -1.575314, -1.745833, 0, 0, 0, 1, 1,
-1.210986, 0.2889192, -1.187791, 0, 0, 0, 1, 1,
-1.210872, -1.383011, -1.525372, 0, 0, 0, 1, 1,
-1.210655, 1.140451, -1.231749, 0, 0, 0, 1, 1,
-1.20428, 0.5884849, -0.5782225, 0, 0, 0, 1, 1,
-1.203304, -0.6457691, -1.602876, 0, 0, 0, 1, 1,
-1.201348, 0.9602227, 0.2123124, 0, 0, 0, 1, 1,
-1.200418, -0.2772938, -1.267184, 1, 1, 1, 1, 1,
-1.187759, -0.3407167, -2.398468, 1, 1, 1, 1, 1,
-1.186025, -0.2269261, -2.124668, 1, 1, 1, 1, 1,
-1.179775, -0.354359, -0.1280648, 1, 1, 1, 1, 1,
-1.172531, -2.347504, -3.598889, 1, 1, 1, 1, 1,
-1.167392, -0.5429247, -1.335417, 1, 1, 1, 1, 1,
-1.161821, 0.6771621, -1.073203, 1, 1, 1, 1, 1,
-1.159426, 0.8442362, -1.253241, 1, 1, 1, 1, 1,
-1.149498, 0.190926, -1.420421, 1, 1, 1, 1, 1,
-1.149244, -0.6072152, -2.547506, 1, 1, 1, 1, 1,
-1.148427, -2.661963, -3.234308, 1, 1, 1, 1, 1,
-1.14628, 0.06442736, -1.302121, 1, 1, 1, 1, 1,
-1.143259, -0.2883172, -2.773806, 1, 1, 1, 1, 1,
-1.142852, -1.878207, -3.163841, 1, 1, 1, 1, 1,
-1.123181, -0.9397509, -2.993572, 1, 1, 1, 1, 1,
-1.121566, 1.652786, -0.8370892, 0, 0, 1, 1, 1,
-1.119533, 0.7340814, -0.8053925, 1, 0, 0, 1, 1,
-1.118487, -1.499708, -2.78109, 1, 0, 0, 1, 1,
-1.102314, -0.6114148, -0.5222197, 1, 0, 0, 1, 1,
-1.099068, 0.5506485, -1.191414, 1, 0, 0, 1, 1,
-1.096307, -0.2637689, -2.792955, 1, 0, 0, 1, 1,
-1.092753, -0.6622845, -3.309558, 0, 0, 0, 1, 1,
-1.091457, -0.08255991, -1.603968, 0, 0, 0, 1, 1,
-1.085439, 0.4665675, -0.1790161, 0, 0, 0, 1, 1,
-1.07868, -0.3124199, -1.27435, 0, 0, 0, 1, 1,
-1.07749, 0.1480594, -2.195235, 0, 0, 0, 1, 1,
-1.070803, 0.9190261, -1.368894, 0, 0, 0, 1, 1,
-1.064139, 0.7949194, -2.104333, 0, 0, 0, 1, 1,
-1.059033, 0.3448363, -0.551491, 1, 1, 1, 1, 1,
-1.057945, -0.6498035, -1.467454, 1, 1, 1, 1, 1,
-1.057644, -0.4959813, -0.1790714, 1, 1, 1, 1, 1,
-1.057524, 1.610286, 0.1780082, 1, 1, 1, 1, 1,
-1.043523, 0.6258678, -0.542084, 1, 1, 1, 1, 1,
-1.043445, -0.3538623, 0.4057475, 1, 1, 1, 1, 1,
-1.041827, 0.8123927, -1.679754, 1, 1, 1, 1, 1,
-1.039674, 0.02306107, -2.91809, 1, 1, 1, 1, 1,
-1.032354, -0.3790956, -2.535806, 1, 1, 1, 1, 1,
-1.022036, -1.855469, -4.730785, 1, 1, 1, 1, 1,
-1.019184, -0.5408782, -0.6989221, 1, 1, 1, 1, 1,
-1.013698, 0.530404, -1.858756, 1, 1, 1, 1, 1,
-1.012219, -0.3556398, -2.045127, 1, 1, 1, 1, 1,
-1.010647, -0.6103573, -2.14851, 1, 1, 1, 1, 1,
-1.00997, -0.3449585, -0.9646484, 1, 1, 1, 1, 1,
-1.003276, 0.3639886, -1.697478, 0, 0, 1, 1, 1,
-0.9979036, -0.03654811, -1.121074, 1, 0, 0, 1, 1,
-0.9971371, 0.9220157, -0.3386458, 1, 0, 0, 1, 1,
-0.9879904, -1.873148, -2.558313, 1, 0, 0, 1, 1,
-0.9876446, 1.723227, -1.084604, 1, 0, 0, 1, 1,
-0.9874049, 3.1009, -0.3390732, 1, 0, 0, 1, 1,
-0.9868457, -2.06056, -1.568529, 0, 0, 0, 1, 1,
-0.984822, 0.1172404, -0.9226258, 0, 0, 0, 1, 1,
-0.9844154, 0.8709025, -2.875379, 0, 0, 0, 1, 1,
-0.9822552, -1.481156, -1.024066, 0, 0, 0, 1, 1,
-0.9768022, 1.265756, 0.0852192, 0, 0, 0, 1, 1,
-0.9724873, -2.191638, -1.917267, 0, 0, 0, 1, 1,
-0.972362, 1.521717, -0.8280089, 0, 0, 0, 1, 1,
-0.9717797, 0.986328, -1.597149, 1, 1, 1, 1, 1,
-0.9665278, -0.1509167, -2.805728, 1, 1, 1, 1, 1,
-0.9661373, 0.3070762, -1.039089, 1, 1, 1, 1, 1,
-0.963896, 0.05564889, -1.682445, 1, 1, 1, 1, 1,
-0.9637787, -1.794706, -1.717927, 1, 1, 1, 1, 1,
-0.9595813, 0.6936895, -0.8481719, 1, 1, 1, 1, 1,
-0.9463829, -0.2969066, -1.782488, 1, 1, 1, 1, 1,
-0.9445128, -0.2133978, -2.888398, 1, 1, 1, 1, 1,
-0.9381312, -0.7525649, -2.244095, 1, 1, 1, 1, 1,
-0.9261164, 0.4996886, 0.1496299, 1, 1, 1, 1, 1,
-0.9180269, 0.8325775, -0.5348255, 1, 1, 1, 1, 1,
-0.9095023, 0.7382966, -1.077351, 1, 1, 1, 1, 1,
-0.9085887, 1.464754, -0.8873322, 1, 1, 1, 1, 1,
-0.9024925, -0.483988, -1.038359, 1, 1, 1, 1, 1,
-0.8760861, 0.4692935, -1.648339, 1, 1, 1, 1, 1,
-0.8693213, 1.65997, 0.2391061, 0, 0, 1, 1, 1,
-0.8649812, 1.060394, 1.199073, 1, 0, 0, 1, 1,
-0.8611882, -0.2149321, -3.957137, 1, 0, 0, 1, 1,
-0.8600963, 0.117078, -0.8519761, 1, 0, 0, 1, 1,
-0.8518545, -0.2226876, -2.097664, 1, 0, 0, 1, 1,
-0.8296888, 0.3151678, -1.102367, 1, 0, 0, 1, 1,
-0.8249602, -0.4503474, -1.77035, 0, 0, 0, 1, 1,
-0.8232743, 0.4497056, -1.687399, 0, 0, 0, 1, 1,
-0.8195584, -1.226699, -2.347283, 0, 0, 0, 1, 1,
-0.8073486, -2.111248, -1.083271, 0, 0, 0, 1, 1,
-0.8036417, -0.5751013, -2.833779, 0, 0, 0, 1, 1,
-0.8017571, -0.03497842, -2.815135, 0, 0, 0, 1, 1,
-0.7995842, -1.376472, -3.850151, 0, 0, 0, 1, 1,
-0.7970732, 1.262863, -0.5039721, 1, 1, 1, 1, 1,
-0.7942774, -0.4646959, -2.376762, 1, 1, 1, 1, 1,
-0.7920467, 0.5303438, 0.2561561, 1, 1, 1, 1, 1,
-0.7851202, 0.4550456, 0.8891429, 1, 1, 1, 1, 1,
-0.7809826, -1.818735, -3.618256, 1, 1, 1, 1, 1,
-0.7805433, -0.867712, -1.489769, 1, 1, 1, 1, 1,
-0.7758875, -2.706965, -3.155989, 1, 1, 1, 1, 1,
-0.7752723, -0.8651631, -3.299556, 1, 1, 1, 1, 1,
-0.772362, -0.8454019, -1.988583, 1, 1, 1, 1, 1,
-0.7670949, 0.4150628, 0.3048853, 1, 1, 1, 1, 1,
-0.7656857, -0.8138196, -3.319459, 1, 1, 1, 1, 1,
-0.7619948, 0.1926858, -2.006875, 1, 1, 1, 1, 1,
-0.7598202, -0.2263294, -3.362678, 1, 1, 1, 1, 1,
-0.7538805, 0.4010989, -2.32356, 1, 1, 1, 1, 1,
-0.7510517, 0.131298, -1.18642, 1, 1, 1, 1, 1,
-0.7502999, 0.7754561, -1.326321, 0, 0, 1, 1, 1,
-0.7432383, -0.8284217, -4.427897, 1, 0, 0, 1, 1,
-0.7403883, -1.246215, -3.391336, 1, 0, 0, 1, 1,
-0.7344522, -0.3644427, -2.372148, 1, 0, 0, 1, 1,
-0.7344421, 1.005504, 1.463206, 1, 0, 0, 1, 1,
-0.7325464, 1.163313, -0.3758875, 1, 0, 0, 1, 1,
-0.7291762, 0.2494219, -2.391661, 0, 0, 0, 1, 1,
-0.7282295, 0.6771072, 0.2155948, 0, 0, 0, 1, 1,
-0.7268118, -1.772301, -2.053259, 0, 0, 0, 1, 1,
-0.7155145, 1.580126, 0.4567143, 0, 0, 0, 1, 1,
-0.7152701, 1.41787, -0.672596, 0, 0, 0, 1, 1,
-0.708286, 0.9624614, -1.126044, 0, 0, 0, 1, 1,
-0.7053996, -0.05411024, -1.260483, 0, 0, 0, 1, 1,
-0.7012894, 1.567225, -1.828457, 1, 1, 1, 1, 1,
-0.7005205, 1.197122, -0.4388033, 1, 1, 1, 1, 1,
-0.6995662, -0.1143852, -2.825488, 1, 1, 1, 1, 1,
-0.6987324, 0.8964792, -0.7669452, 1, 1, 1, 1, 1,
-0.6951866, -0.2850313, -3.243325, 1, 1, 1, 1, 1,
-0.6909423, 0.8716323, -2.90064, 1, 1, 1, 1, 1,
-0.6887662, 0.04990252, -1.51199, 1, 1, 1, 1, 1,
-0.683104, -1.386917, -2.652855, 1, 1, 1, 1, 1,
-0.6828725, 1.01202, -0.5671995, 1, 1, 1, 1, 1,
-0.6814333, 1.205298, -0.9959162, 1, 1, 1, 1, 1,
-0.6760971, -1.209204, -2.968817, 1, 1, 1, 1, 1,
-0.6741889, 0.1490852, -1.220047, 1, 1, 1, 1, 1,
-0.6728845, 0.9710963, 0.5941107, 1, 1, 1, 1, 1,
-0.671052, -3.363992, -2.479882, 1, 1, 1, 1, 1,
-0.6610883, -0.1891505, -0.6701424, 1, 1, 1, 1, 1,
-0.6603884, 0.1226163, -1.753951, 0, 0, 1, 1, 1,
-0.6567016, 0.4975773, -0.1841539, 1, 0, 0, 1, 1,
-0.6506394, -1.078775, -3.150604, 1, 0, 0, 1, 1,
-0.6503246, -0.1383532, 0.04739196, 1, 0, 0, 1, 1,
-0.6477441, -0.357033, -1.215477, 1, 0, 0, 1, 1,
-0.6464722, -0.5391897, -2.402105, 1, 0, 0, 1, 1,
-0.6447956, 0.1585938, -1.540879, 0, 0, 0, 1, 1,
-0.6422253, -0.9546421, -2.458399, 0, 0, 0, 1, 1,
-0.6397398, -0.3628356, -1.741958, 0, 0, 0, 1, 1,
-0.6358594, -0.8325783, -1.303468, 0, 0, 0, 1, 1,
-0.633352, -0.2998949, -1.028667, 0, 0, 0, 1, 1,
-0.6288114, 1.184386, 0.03972219, 0, 0, 0, 1, 1,
-0.6273679, -1.68115, -2.435436, 0, 0, 0, 1, 1,
-0.6115118, -0.4230137, -1.167569, 1, 1, 1, 1, 1,
-0.6105644, 1.195705, -0.05880972, 1, 1, 1, 1, 1,
-0.6090639, -1.08132, -1.969049, 1, 1, 1, 1, 1,
-0.6081945, -0.8552674, -1.411886, 1, 1, 1, 1, 1,
-0.5987031, -0.4303515, -2.775833, 1, 1, 1, 1, 1,
-0.5917107, 1.817725, -1.613073, 1, 1, 1, 1, 1,
-0.5875161, 2.280952, -0.672045, 1, 1, 1, 1, 1,
-0.5859282, -0.3023918, -1.111742, 1, 1, 1, 1, 1,
-0.5853247, 1.699354, -0.1979948, 1, 1, 1, 1, 1,
-0.5814095, -1.050741, -3.491726, 1, 1, 1, 1, 1,
-0.5765814, 0.2351834, -0.8621243, 1, 1, 1, 1, 1,
-0.5741778, 1.37189, -0.09961825, 1, 1, 1, 1, 1,
-0.5678961, -0.3894704, -3.34103, 1, 1, 1, 1, 1,
-0.5673352, 1.44241, -0.995841, 1, 1, 1, 1, 1,
-0.5655939, -1.409032, -1.695349, 1, 1, 1, 1, 1,
-0.5621676, -0.2193535, -3.049953, 0, 0, 1, 1, 1,
-0.5612326, 2.02876, 0.2320308, 1, 0, 0, 1, 1,
-0.5611446, -1.728646, -2.087773, 1, 0, 0, 1, 1,
-0.5594624, -0.3701396, -2.439905, 1, 0, 0, 1, 1,
-0.5521168, -0.3288481, -1.028908, 1, 0, 0, 1, 1,
-0.549514, -0.3880473, -2.465196, 1, 0, 0, 1, 1,
-0.5488814, -0.5324172, -1.93928, 0, 0, 0, 1, 1,
-0.5477713, 0.6420717, 1.127243, 0, 0, 0, 1, 1,
-0.5366162, -0.06143032, -2.230232, 0, 0, 0, 1, 1,
-0.536067, 0.1446276, -0.6722882, 0, 0, 0, 1, 1,
-0.527728, -2.535354, -3.57448, 0, 0, 0, 1, 1,
-0.5265712, -0.4862824, -0.8070867, 0, 0, 0, 1, 1,
-0.519643, 0.9108065, 1.858192, 0, 0, 0, 1, 1,
-0.5188974, 2.342994, -2.18346, 1, 1, 1, 1, 1,
-0.5148897, 1.219036, -0.3653568, 1, 1, 1, 1, 1,
-0.5136194, -0.6124825, -2.44552, 1, 1, 1, 1, 1,
-0.511136, 0.367234, 1.662325, 1, 1, 1, 1, 1,
-0.5105479, 0.06795324, -4.161336, 1, 1, 1, 1, 1,
-0.5074387, -1.697513, -4.102243, 1, 1, 1, 1, 1,
-0.5065348, -0.8724232, -2.945695, 1, 1, 1, 1, 1,
-0.5026845, -0.9688966, -0.8580447, 1, 1, 1, 1, 1,
-0.5013219, -0.1429243, -2.476205, 1, 1, 1, 1, 1,
-0.4941324, -0.2691287, -1.910367, 1, 1, 1, 1, 1,
-0.4925737, -1.202426, -3.813264, 1, 1, 1, 1, 1,
-0.4921429, 0.2216906, -2.225351, 1, 1, 1, 1, 1,
-0.4873873, 1.958588, 0.3028961, 1, 1, 1, 1, 1,
-0.4868897, 0.3279283, -2.083274, 1, 1, 1, 1, 1,
-0.4710702, 0.9767516, -0.06806045, 1, 1, 1, 1, 1,
-0.4662385, 0.2507289, 0.2377487, 0, 0, 1, 1, 1,
-0.4657599, 0.9742224, -1.338849, 1, 0, 0, 1, 1,
-0.4614224, -0.2563106, -1.849316, 1, 0, 0, 1, 1,
-0.4612537, -0.2319837, -0.499903, 1, 0, 0, 1, 1,
-0.4595254, -1.178454, -2.218427, 1, 0, 0, 1, 1,
-0.4578504, -0.7824164, -2.321552, 1, 0, 0, 1, 1,
-0.4553961, 0.4526423, 2.106925, 0, 0, 0, 1, 1,
-0.4551424, 1.241099, -1.255353, 0, 0, 0, 1, 1,
-0.4542509, 0.5662231, -0.8765303, 0, 0, 0, 1, 1,
-0.4521393, 0.2232742, -2.449482, 0, 0, 0, 1, 1,
-0.4512414, 1.614597, 1.046763, 0, 0, 0, 1, 1,
-0.4415677, 0.9065083, -1.334325, 0, 0, 0, 1, 1,
-0.4352708, 0.224892, -0.6687754, 0, 0, 0, 1, 1,
-0.4315, -1.277451, -3.669318, 1, 1, 1, 1, 1,
-0.4298088, -2.930076, -1.576346, 1, 1, 1, 1, 1,
-0.4269577, 1.347228, -0.963765, 1, 1, 1, 1, 1,
-0.4230593, -1.063198, -2.739836, 1, 1, 1, 1, 1,
-0.4227497, -0.4766891, -2.039958, 1, 1, 1, 1, 1,
-0.4220542, -0.1206694, 0.1916931, 1, 1, 1, 1, 1,
-0.4210643, -2.066898, -1.995833, 1, 1, 1, 1, 1,
-0.419256, -0.8583391, -1.225038, 1, 1, 1, 1, 1,
-0.4164485, -3.104346, -2.924501, 1, 1, 1, 1, 1,
-0.4157771, -1.660482, -3.483291, 1, 1, 1, 1, 1,
-0.4152795, -1.351453, -2.986722, 1, 1, 1, 1, 1,
-0.4090593, 0.8420883, -0.8389289, 1, 1, 1, 1, 1,
-0.4068552, -0.6821404, -3.182405, 1, 1, 1, 1, 1,
-0.4046877, 0.6195117, -0.8064909, 1, 1, 1, 1, 1,
-0.4044074, -1.062241, -4.477594, 1, 1, 1, 1, 1,
-0.4010828, 0.495777, 0.2298512, 0, 0, 1, 1, 1,
-0.3980238, 0.6246759, -0.4176638, 1, 0, 0, 1, 1,
-0.3976701, 0.04506688, -0.9867998, 1, 0, 0, 1, 1,
-0.3970474, -0.8166919, -1.271647, 1, 0, 0, 1, 1,
-0.3949201, 0.350105, -0.7121713, 1, 0, 0, 1, 1,
-0.390723, 1.144784, -1.509847, 1, 0, 0, 1, 1,
-0.390555, 0.1063839, -1.471103, 0, 0, 0, 1, 1,
-0.3884027, 0.9959408, -1.613533, 0, 0, 0, 1, 1,
-0.3880554, 0.1382299, -0.948727, 0, 0, 0, 1, 1,
-0.3835342, -0.9223087, -4.198769, 0, 0, 0, 1, 1,
-0.3808064, 0.54252, -1.535663, 0, 0, 0, 1, 1,
-0.380585, 0.2548543, 0.8886894, 0, 0, 0, 1, 1,
-0.3754263, -0.1407161, -1.757337, 0, 0, 0, 1, 1,
-0.3754103, 0.6689798, 0.6620398, 1, 1, 1, 1, 1,
-0.3752687, -0.05684767, -1.250555, 1, 1, 1, 1, 1,
-0.3733555, 2.023702, 0.9406779, 1, 1, 1, 1, 1,
-0.3732078, -0.4525657, -4.375684, 1, 1, 1, 1, 1,
-0.3697917, 1.766423, -0.2548379, 1, 1, 1, 1, 1,
-0.3682654, -1.734796, -3.830542, 1, 1, 1, 1, 1,
-0.3640426, 0.3437681, -0.0815016, 1, 1, 1, 1, 1,
-0.3614329, -1.325775, -2.274675, 1, 1, 1, 1, 1,
-0.3533677, 0.3552191, -0.4896497, 1, 1, 1, 1, 1,
-0.352829, -0.7365339, -2.105364, 1, 1, 1, 1, 1,
-0.3515595, -0.2081643, -3.231704, 1, 1, 1, 1, 1,
-0.3506517, 0.2055922, 0.9046364, 1, 1, 1, 1, 1,
-0.3498787, 1.36842, 0.5975108, 1, 1, 1, 1, 1,
-0.3478848, -2.212285, -3.524088, 1, 1, 1, 1, 1,
-0.3446383, -0.1227122, -0.3228461, 1, 1, 1, 1, 1,
-0.3414036, -0.03754519, -2.278253, 0, 0, 1, 1, 1,
-0.3339426, -0.3091361, -2.612754, 1, 0, 0, 1, 1,
-0.3317405, 1.413042, -0.4549657, 1, 0, 0, 1, 1,
-0.3308495, 1.396829, -0.6067074, 1, 0, 0, 1, 1,
-0.3307221, -1.003956, -1.716417, 1, 0, 0, 1, 1,
-0.3288967, 0.3166344, -0.6145893, 1, 0, 0, 1, 1,
-0.3287829, 0.08663019, -0.4727083, 0, 0, 0, 1, 1,
-0.3246731, 0.07630019, -1.14964, 0, 0, 0, 1, 1,
-0.3232819, -0.1688246, -2.042904, 0, 0, 0, 1, 1,
-0.3178459, 2.022008, -0.8162566, 0, 0, 0, 1, 1,
-0.3174838, 0.9032737, -2.426718, 0, 0, 0, 1, 1,
-0.3167181, 1.683894, 0.6095747, 0, 0, 0, 1, 1,
-0.3140895, -0.332416, -2.180986, 0, 0, 0, 1, 1,
-0.3118422, -1.078101, -2.280758, 1, 1, 1, 1, 1,
-0.3076536, 0.3608799, 0.003043673, 1, 1, 1, 1, 1,
-0.3061917, -1.530378, -4.297674, 1, 1, 1, 1, 1,
-0.3025327, -0.2070296, -1.638831, 1, 1, 1, 1, 1,
-0.2940785, 1.347438, -0.486362, 1, 1, 1, 1, 1,
-0.2857956, 1.524207, 1.389393, 1, 1, 1, 1, 1,
-0.2818637, -1.034088, -2.610384, 1, 1, 1, 1, 1,
-0.2814506, -0.367892, -2.364769, 1, 1, 1, 1, 1,
-0.2801719, -0.7640523, -1.219808, 1, 1, 1, 1, 1,
-0.2737479, -0.1994497, -2.038675, 1, 1, 1, 1, 1,
-0.2735817, 0.2892519, 0.5523533, 1, 1, 1, 1, 1,
-0.2726852, 0.773834, 0.5018603, 1, 1, 1, 1, 1,
-0.272623, -1.022828, -3.218533, 1, 1, 1, 1, 1,
-0.2713149, -0.1521665, -3.29502, 1, 1, 1, 1, 1,
-0.266672, 0.4713403, -0.1866758, 1, 1, 1, 1, 1,
-0.2628188, 0.7239648, 1.284704, 0, 0, 1, 1, 1,
-0.2557331, -0.2004044, -1.528326, 1, 0, 0, 1, 1,
-0.2551176, 0.003490467, -2.830519, 1, 0, 0, 1, 1,
-0.2535812, -0.2161809, -1.939892, 1, 0, 0, 1, 1,
-0.2533629, 0.9434234, 1.923722, 1, 0, 0, 1, 1,
-0.2503559, -0.2213125, -3.392533, 1, 0, 0, 1, 1,
-0.2419506, -0.452631, -2.78458, 0, 0, 0, 1, 1,
-0.2365249, 0.4546967, -1.503008, 0, 0, 0, 1, 1,
-0.2352621, -0.3475327, -2.366837, 0, 0, 0, 1, 1,
-0.2351212, 0.7989703, 0.1476498, 0, 0, 0, 1, 1,
-0.2287598, -0.0298792, -0.4277262, 0, 0, 0, 1, 1,
-0.228106, -2.359774, -0.8631355, 0, 0, 0, 1, 1,
-0.2261014, -0.5849618, -3.435122, 0, 0, 0, 1, 1,
-0.2237217, 0.489296, 1.673695, 1, 1, 1, 1, 1,
-0.2236232, -2.28354, -2.779639, 1, 1, 1, 1, 1,
-0.2234117, -1.395122, -4.442695, 1, 1, 1, 1, 1,
-0.2229707, -0.454331, -2.609693, 1, 1, 1, 1, 1,
-0.2172349, 1.840985, -1.341444, 1, 1, 1, 1, 1,
-0.2136303, -0.2708036, -1.291903, 1, 1, 1, 1, 1,
-0.2129667, 0.8754126, -1.603983, 1, 1, 1, 1, 1,
-0.2115017, -1.137817, -4.037022, 1, 1, 1, 1, 1,
-0.2101622, 2.149679, 0.7696286, 1, 1, 1, 1, 1,
-0.2035003, 0.3655675, -1.565238, 1, 1, 1, 1, 1,
-0.2017756, -0.2396024, -1.45353, 1, 1, 1, 1, 1,
-0.1997541, -0.06636752, -0.5061747, 1, 1, 1, 1, 1,
-0.1964315, 1.083637, 1.520322, 1, 1, 1, 1, 1,
-0.1943482, -0.6144068, -2.746879, 1, 1, 1, 1, 1,
-0.1903555, 0.06708437, 0.7559378, 1, 1, 1, 1, 1,
-0.1878676, 0.1989129, -1.953369, 0, 0, 1, 1, 1,
-0.1869038, 0.5677621, 0.7605355, 1, 0, 0, 1, 1,
-0.1838947, 1.802303, -1.116338, 1, 0, 0, 1, 1,
-0.1838392, 0.5082685, 0.643206, 1, 0, 0, 1, 1,
-0.1822078, 0.630968, 1.117765, 1, 0, 0, 1, 1,
-0.1772542, -1.359831, -3.204199, 1, 0, 0, 1, 1,
-0.1771401, -0.8390018, -2.667803, 0, 0, 0, 1, 1,
-0.1757349, 0.2138889, -3.732394, 0, 0, 0, 1, 1,
-0.1735398, 0.821665, -0.8338295, 0, 0, 0, 1, 1,
-0.1694391, -1.236176, -4.036047, 0, 0, 0, 1, 1,
-0.1649186, 0.8908821, -1.376742, 0, 0, 0, 1, 1,
-0.1648082, 0.4169876, -0.3008404, 0, 0, 0, 1, 1,
-0.1622391, -1.267833, -3.367655, 0, 0, 0, 1, 1,
-0.1584617, -0.8543097, -3.06741, 1, 1, 1, 1, 1,
-0.1523366, 3.29307, -0.05966311, 1, 1, 1, 1, 1,
-0.1474453, -1.0335, -2.189591, 1, 1, 1, 1, 1,
-0.1473981, 1.185448, 1.546658, 1, 1, 1, 1, 1,
-0.1463958, -2.030557, -3.157938, 1, 1, 1, 1, 1,
-0.1418842, 1.25595, -0.2593144, 1, 1, 1, 1, 1,
-0.1398518, -1.628205, -3.14997, 1, 1, 1, 1, 1,
-0.13382, -0.3570372, -4.308312, 1, 1, 1, 1, 1,
-0.1293354, 1.080023, -0.1383112, 1, 1, 1, 1, 1,
-0.1290503, -0.2434704, -3.672821, 1, 1, 1, 1, 1,
-0.128998, 0.5645707, -0.4415645, 1, 1, 1, 1, 1,
-0.1287413, 0.1175953, -1.220572, 1, 1, 1, 1, 1,
-0.1245509, -0.6232101, -3.909684, 1, 1, 1, 1, 1,
-0.1239969, -0.344218, -3.031494, 1, 1, 1, 1, 1,
-0.1227188, -1.873655, -4.308471, 1, 1, 1, 1, 1,
-0.1110161, -1.740238, -3.291996, 0, 0, 1, 1, 1,
-0.1097591, 0.8774235, -1.208601, 1, 0, 0, 1, 1,
-0.107331, -1.114381, -3.258408, 1, 0, 0, 1, 1,
-0.09457587, -1.285459, -3.316756, 1, 0, 0, 1, 1,
-0.09353852, -0.08796421, -3.923357, 1, 0, 0, 1, 1,
-0.09069715, -0.07607447, -1.885768, 1, 0, 0, 1, 1,
-0.08586761, 1.964379, -0.8115205, 0, 0, 0, 1, 1,
-0.08511881, 0.7239522, -0.1388949, 0, 0, 0, 1, 1,
-0.0850611, -1.641401, -3.712362, 0, 0, 0, 1, 1,
-0.08308613, 1.529002, 0.2094747, 0, 0, 0, 1, 1,
-0.0810719, 0.180747, -1.736917, 0, 0, 0, 1, 1,
-0.07826314, 0.5318884, -0.4506167, 0, 0, 0, 1, 1,
-0.07158986, -0.06645255, -3.259697, 0, 0, 0, 1, 1,
-0.0678375, 0.3347259, 0.1700872, 1, 1, 1, 1, 1,
-0.065562, -1.937165, -1.625074, 1, 1, 1, 1, 1,
-0.06459614, 1.217774, 0.683942, 1, 1, 1, 1, 1,
-0.06404103, -0.7083395, -2.9579, 1, 1, 1, 1, 1,
-0.06395565, -0.5498754, -3.820338, 1, 1, 1, 1, 1,
-0.05211687, 0.2535041, 0.01098769, 1, 1, 1, 1, 1,
-0.04999175, -0.373622, -4.394788, 1, 1, 1, 1, 1,
-0.04751495, 0.7930671, -0.5642633, 1, 1, 1, 1, 1,
-0.04738123, -0.1027753, -0.7001854, 1, 1, 1, 1, 1,
-0.040339, -0.5777939, -2.812322, 1, 1, 1, 1, 1,
-0.02918066, -0.8950427, -3.299205, 1, 1, 1, 1, 1,
-0.02778608, -1.786072, -3.741815, 1, 1, 1, 1, 1,
-0.02531505, -0.4006396, -1.902217, 1, 1, 1, 1, 1,
-0.02304386, -2.051287, -2.708835, 1, 1, 1, 1, 1,
-0.02201297, -0.03019069, -2.72643, 1, 1, 1, 1, 1,
-0.0215889, -0.09805389, -0.7028457, 0, 0, 1, 1, 1,
-0.02087576, -1.719471, -1.911251, 1, 0, 0, 1, 1,
-0.0194998, 0.5654188, 1.594074, 1, 0, 0, 1, 1,
-0.01642427, -0.9212533, -3.515698, 1, 0, 0, 1, 1,
-0.01263251, 0.06382655, -0.2379279, 1, 0, 0, 1, 1,
-0.007370729, -0.5471064, -2.736386, 1, 0, 0, 1, 1,
-0.004660062, 0.9647977, 0.773442, 0, 0, 0, 1, 1,
-0.002744698, 1.274302, 0.8476019, 0, 0, 0, 1, 1,
-0.001325743, -0.4270234, -2.194222, 0, 0, 0, 1, 1,
0.00678037, -0.04408341, 3.585899, 0, 0, 0, 1, 1,
0.008256947, 0.1686276, -0.1715749, 0, 0, 0, 1, 1,
0.01140404, -0.03562856, 3.379261, 0, 0, 0, 1, 1,
0.01733495, -2.830667, 3.650272, 0, 0, 0, 1, 1,
0.02036074, -0.01726367, 2.060078, 1, 1, 1, 1, 1,
0.02899119, -1.890041, 2.765043, 1, 1, 1, 1, 1,
0.03079198, -1.987165, 1.159486, 1, 1, 1, 1, 1,
0.03094662, -1.888185, 4.1001, 1, 1, 1, 1, 1,
0.03292762, -0.4190724, 2.656458, 1, 1, 1, 1, 1,
0.03941824, -0.8449475, 3.916837, 1, 1, 1, 1, 1,
0.04167515, 0.165134, -0.4148679, 1, 1, 1, 1, 1,
0.04585203, 1.077812, -0.2974156, 1, 1, 1, 1, 1,
0.04592186, -1.119167, 0.1043465, 1, 1, 1, 1, 1,
0.04618576, -1.181249, 4.021532, 1, 1, 1, 1, 1,
0.04732872, -0.873487, 1.421056, 1, 1, 1, 1, 1,
0.04900313, 2.240749, 0.1589228, 1, 1, 1, 1, 1,
0.04907474, 1.884543, 0.7779888, 1, 1, 1, 1, 1,
0.04909219, 0.08810852, 0.6819702, 1, 1, 1, 1, 1,
0.05343332, 0.2878748, 1.618302, 1, 1, 1, 1, 1,
0.05962408, 0.1865495, 0.3033966, 0, 0, 1, 1, 1,
0.06251005, -0.4956856, 2.338849, 1, 0, 0, 1, 1,
0.06341164, -1.154431, 2.809022, 1, 0, 0, 1, 1,
0.06556386, -0.9330424, 3.58157, 1, 0, 0, 1, 1,
0.06901816, 1.660672, 0.4074861, 1, 0, 0, 1, 1,
0.07483263, 0.4375722, 1.242296, 1, 0, 0, 1, 1,
0.07656118, -0.633644, 1.997919, 0, 0, 0, 1, 1,
0.0797084, 0.8268855, -0.2173349, 0, 0, 0, 1, 1,
0.08339003, -0.3436395, 3.403146, 0, 0, 0, 1, 1,
0.08676764, -0.8951288, 1.784799, 0, 0, 0, 1, 1,
0.08705901, -0.08609888, 4.623167, 0, 0, 0, 1, 1,
0.09325207, -0.828058, 3.34749, 0, 0, 0, 1, 1,
0.09412074, 0.9974419, -0.06641631, 0, 0, 0, 1, 1,
0.09577864, -0.7157829, 2.046424, 1, 1, 1, 1, 1,
0.09676509, 1.161405, -0.7719529, 1, 1, 1, 1, 1,
0.09682906, -0.5644398, 1.374881, 1, 1, 1, 1, 1,
0.09760573, -0.5372491, 4.574325, 1, 1, 1, 1, 1,
0.1032259, -1.333039, 3.352759, 1, 1, 1, 1, 1,
0.1069189, -0.2317199, 0.3221194, 1, 1, 1, 1, 1,
0.1081936, -0.2444089, 2.210364, 1, 1, 1, 1, 1,
0.1114329, 1.177374, 0.0831827, 1, 1, 1, 1, 1,
0.1156388, 1.789822, 0.4453913, 1, 1, 1, 1, 1,
0.1170656, -0.3583136, 2.879872, 1, 1, 1, 1, 1,
0.1180002, -1.094469, 2.199834, 1, 1, 1, 1, 1,
0.1263157, -0.2439104, 3.602009, 1, 1, 1, 1, 1,
0.1278612, -0.42387, 2.862708, 1, 1, 1, 1, 1,
0.1281906, 0.6813835, 1.028663, 1, 1, 1, 1, 1,
0.1350049, -1.730929, 1.976956, 1, 1, 1, 1, 1,
0.1389951, -1.485269, 4.26306, 0, 0, 1, 1, 1,
0.1408557, -0.5998285, 1.628385, 1, 0, 0, 1, 1,
0.1453219, 1.306267, 1.857695, 1, 0, 0, 1, 1,
0.1464112, 0.3396714, 0.4693174, 1, 0, 0, 1, 1,
0.1467145, 0.8847609, 0.4985701, 1, 0, 0, 1, 1,
0.1468617, 0.7463034, 0.6038643, 1, 0, 0, 1, 1,
0.1468683, -0.1288827, 1.647147, 0, 0, 0, 1, 1,
0.1478372, 1.006892, 0.5915759, 0, 0, 0, 1, 1,
0.1498672, 0.5129985, 0.4166757, 0, 0, 0, 1, 1,
0.1518643, -0.1002284, 3.302794, 0, 0, 0, 1, 1,
0.152907, -0.4663865, 2.727569, 0, 0, 0, 1, 1,
0.1541618, 0.02260813, 0.3890438, 0, 0, 0, 1, 1,
0.1602289, -0.9348943, 2.069569, 0, 0, 0, 1, 1,
0.1644063, 0.2753542, 1.138254, 1, 1, 1, 1, 1,
0.1662187, 0.2280984, 2.113799, 1, 1, 1, 1, 1,
0.1665095, 0.8849049, 1.069664, 1, 1, 1, 1, 1,
0.1724707, -0.09701964, 4.02692, 1, 1, 1, 1, 1,
0.1745219, 1.718286, -0.1537051, 1, 1, 1, 1, 1,
0.1758855, -0.02440636, 2.528708, 1, 1, 1, 1, 1,
0.1784705, -0.1252429, 0.2872196, 1, 1, 1, 1, 1,
0.178548, -0.983954, 2.581082, 1, 1, 1, 1, 1,
0.1791912, -1.653195, 4.228125, 1, 1, 1, 1, 1,
0.1794609, -0.2486956, 3.153781, 1, 1, 1, 1, 1,
0.1806175, 1.364035, 0.08013148, 1, 1, 1, 1, 1,
0.181365, 0.6501058, 0.6678672, 1, 1, 1, 1, 1,
0.1829148, 0.8394445, 0.2342819, 1, 1, 1, 1, 1,
0.1851202, -0.9239597, 3.227719, 1, 1, 1, 1, 1,
0.1882369, 1.293053, 0.02065585, 1, 1, 1, 1, 1,
0.1901269, -0.06741108, 3.264956, 0, 0, 1, 1, 1,
0.2018467, -2.740793, 1.592831, 1, 0, 0, 1, 1,
0.2077118, 1.125257, 0.8488033, 1, 0, 0, 1, 1,
0.2116734, 0.5952473, 0.5514296, 1, 0, 0, 1, 1,
0.2122968, 1.657622, 1.364185, 1, 0, 0, 1, 1,
0.212871, -0.2203192, 2.648777, 1, 0, 0, 1, 1,
0.2133192, 2.369573, 1.30086, 0, 0, 0, 1, 1,
0.2139245, 1.2487, 1.987054, 0, 0, 0, 1, 1,
0.2159057, 0.6604303, -1.049532, 0, 0, 0, 1, 1,
0.2181012, 1.499618, 0.7030542, 0, 0, 0, 1, 1,
0.2189141, -0.08727621, 0.6582471, 0, 0, 0, 1, 1,
0.2210647, -0.3019299, 4.095626, 0, 0, 0, 1, 1,
0.225638, 0.3009757, -1.253932, 0, 0, 0, 1, 1,
0.2259143, 0.414828, -0.1395301, 1, 1, 1, 1, 1,
0.2268461, 0.5142421, 1.120737, 1, 1, 1, 1, 1,
0.228109, 0.07612154, 1.965365, 1, 1, 1, 1, 1,
0.2306945, -1.800726, 4.681289, 1, 1, 1, 1, 1,
0.231216, -1.711619, 2.953842, 1, 1, 1, 1, 1,
0.2355867, 0.7726955, -0.3673135, 1, 1, 1, 1, 1,
0.2384833, -1.200743, 4.928123, 1, 1, 1, 1, 1,
0.240611, -1.373415, 4.056019, 1, 1, 1, 1, 1,
0.2441769, -0.4163761, 2.784592, 1, 1, 1, 1, 1,
0.2491758, 1.606448, -0.3975238, 1, 1, 1, 1, 1,
0.2505631, -0.9927903, 3.235854, 1, 1, 1, 1, 1,
0.2519271, -0.2868848, 3.346633, 1, 1, 1, 1, 1,
0.255802, -0.5072754, 3.047197, 1, 1, 1, 1, 1,
0.260619, 0.9467346, -0.005051902, 1, 1, 1, 1, 1,
0.2618946, -0.5781822, 2.497739, 1, 1, 1, 1, 1,
0.2637269, -1.814885, 3.015649, 0, 0, 1, 1, 1,
0.2644144, -0.1708329, 2.811125, 1, 0, 0, 1, 1,
0.2644497, 1.966207, -0.7052017, 1, 0, 0, 1, 1,
0.2652295, -0.07279621, 1.221246, 1, 0, 0, 1, 1,
0.2716763, -1.014215, 5.034732, 1, 0, 0, 1, 1,
0.2733679, -0.3112537, 2.735797, 1, 0, 0, 1, 1,
0.2737558, -1.454627, 0.9512375, 0, 0, 0, 1, 1,
0.2758158, 1.595159, 0.5784262, 0, 0, 0, 1, 1,
0.2815862, 0.8383881, 1.947012, 0, 0, 0, 1, 1,
0.2845991, -1.72908, 2.259107, 0, 0, 0, 1, 1,
0.2907712, -0.829762, 3.190138, 0, 0, 0, 1, 1,
0.29602, 0.6562096, 0.2557715, 0, 0, 0, 1, 1,
0.3047709, -0.2361009, 2.201895, 0, 0, 0, 1, 1,
0.305384, -2.260566, 3.58003, 1, 1, 1, 1, 1,
0.3066911, -0.4388825, 1.432693, 1, 1, 1, 1, 1,
0.3070465, -2.186455, 2.229892, 1, 1, 1, 1, 1,
0.3180892, 0.1695533, 0.4980735, 1, 1, 1, 1, 1,
0.3191411, -0.7479418, 2.919587, 1, 1, 1, 1, 1,
0.3207219, -0.3168797, 0.7380255, 1, 1, 1, 1, 1,
0.3220489, 0.7425675, 0.6181056, 1, 1, 1, 1, 1,
0.3293868, -0.7228239, 3.69066, 1, 1, 1, 1, 1,
0.3312843, 0.4068983, -0.9463505, 1, 1, 1, 1, 1,
0.3321331, 1.545807, -0.09681328, 1, 1, 1, 1, 1,
0.3333047, 0.05093716, 0.4616692, 1, 1, 1, 1, 1,
0.3340469, 0.8902789, 0.00558805, 1, 1, 1, 1, 1,
0.33587, 1.095022, 1.308295, 1, 1, 1, 1, 1,
0.3415609, 1.282817, -0.1238466, 1, 1, 1, 1, 1,
0.3457687, -0.1353407, 1.329798, 1, 1, 1, 1, 1,
0.3486532, -1.361442, 4.213939, 0, 0, 1, 1, 1,
0.3512446, 0.5911099, 1.169968, 1, 0, 0, 1, 1,
0.3543682, -0.9486384, 1.426525, 1, 0, 0, 1, 1,
0.3567539, -1.636974, 2.497575, 1, 0, 0, 1, 1,
0.3571127, -1.344633, 3.881949, 1, 0, 0, 1, 1,
0.3584179, 2.326675, -0.6682494, 1, 0, 0, 1, 1,
0.3621517, 0.530751, 1.074818, 0, 0, 0, 1, 1,
0.3626287, 0.777656, -0.06615798, 0, 0, 0, 1, 1,
0.3627101, -1.144679, 1.603485, 0, 0, 0, 1, 1,
0.366145, -0.07203233, 2.693488, 0, 0, 0, 1, 1,
0.3695721, 0.3045984, 0.6419219, 0, 0, 0, 1, 1,
0.3696717, -1.733145, 3.09384, 0, 0, 0, 1, 1,
0.3699197, -0.840483, 2.243443, 0, 0, 0, 1, 1,
0.3727832, 0.3357785, 1.542213, 1, 1, 1, 1, 1,
0.3761384, 0.1867421, 1.412438, 1, 1, 1, 1, 1,
0.3783309, 0.8241618, 1.181569, 1, 1, 1, 1, 1,
0.3819097, -0.1722807, 1.121748, 1, 1, 1, 1, 1,
0.384698, -0.9818411, 1.675979, 1, 1, 1, 1, 1,
0.3850238, -0.3549609, 2.401185, 1, 1, 1, 1, 1,
0.3853503, 1.699326, -1.022555, 1, 1, 1, 1, 1,
0.3864588, -0.4663874, -0.3888923, 1, 1, 1, 1, 1,
0.3925277, 0.7742513, 1.624139, 1, 1, 1, 1, 1,
0.3936311, -1.305007, 1.105271, 1, 1, 1, 1, 1,
0.3936841, -0.2433143, 1.045896, 1, 1, 1, 1, 1,
0.3940837, 0.4276544, 2.566599, 1, 1, 1, 1, 1,
0.396707, -0.5804732, 3.053286, 1, 1, 1, 1, 1,
0.3973901, 1.361927, 0.3903029, 1, 1, 1, 1, 1,
0.3985914, -1.111965, 2.797591, 1, 1, 1, 1, 1,
0.3992447, 0.6035697, -0.08621949, 0, 0, 1, 1, 1,
0.4018631, -0.3025809, 1.937229, 1, 0, 0, 1, 1,
0.4058177, -0.9777951, 3.137189, 1, 0, 0, 1, 1,
0.4065245, 0.8138596, -0.7979702, 1, 0, 0, 1, 1,
0.4121942, 0.1351848, 0.02612244, 1, 0, 0, 1, 1,
0.4152165, 0.1496661, 2.456593, 1, 0, 0, 1, 1,
0.4208102, 2.377043, 0.9507248, 0, 0, 0, 1, 1,
0.4226433, 0.4395641, -0.4326622, 0, 0, 0, 1, 1,
0.4229264, 0.6102774, 0.6830693, 0, 0, 0, 1, 1,
0.4255961, 0.02558919, 1.082512, 0, 0, 0, 1, 1,
0.4285605, -0.4684378, 3.290669, 0, 0, 0, 1, 1,
0.4289318, 0.06468588, 2.528828, 0, 0, 0, 1, 1,
0.429801, 0.6619562, -0.3853966, 0, 0, 0, 1, 1,
0.4335389, 1.292792, -0.5380387, 1, 1, 1, 1, 1,
0.4350961, 0.6075615, 0.08125463, 1, 1, 1, 1, 1,
0.4377403, 1.236219, 1.93464, 1, 1, 1, 1, 1,
0.4443525, 0.5102172, 0.4041327, 1, 1, 1, 1, 1,
0.4452231, -0.3801585, 1.706488, 1, 1, 1, 1, 1,
0.4484831, -1.070303, 3.468786, 1, 1, 1, 1, 1,
0.4509792, -2.327951, 3.019333, 1, 1, 1, 1, 1,
0.4562999, 1.748353, 1.154441, 1, 1, 1, 1, 1,
0.4578982, -0.915996, 2.444812, 1, 1, 1, 1, 1,
0.4589114, -0.5846565, 2.444716, 1, 1, 1, 1, 1,
0.4613587, -1.689436, 3.07834, 1, 1, 1, 1, 1,
0.4641023, 1.094372, 1.484806, 1, 1, 1, 1, 1,
0.4658093, -0.0008659003, 1.44715, 1, 1, 1, 1, 1,
0.4681201, 0.9333583, -0.4405058, 1, 1, 1, 1, 1,
0.4751839, 1.876201, 0.1022703, 1, 1, 1, 1, 1,
0.4755793, -1.543938, 1.300127, 0, 0, 1, 1, 1,
0.4784144, 1.118103, 1.14414, 1, 0, 0, 1, 1,
0.4790538, 1.060975, 0.3480327, 1, 0, 0, 1, 1,
0.4795175, 0.2470728, 2.161288, 1, 0, 0, 1, 1,
0.4800927, -0.0866618, 1.471257, 1, 0, 0, 1, 1,
0.4850377, 0.3020954, 3.833512, 1, 0, 0, 1, 1,
0.4868552, -0.9876834, 2.823286, 0, 0, 0, 1, 1,
0.4869101, -0.6426088, 2.448284, 0, 0, 0, 1, 1,
0.4874321, 0.7328106, 0.8539608, 0, 0, 0, 1, 1,
0.4881607, 0.8301005, 2.744387, 0, 0, 0, 1, 1,
0.4997613, -0.3689114, 1.777061, 0, 0, 0, 1, 1,
0.5010112, 0.3980239, 0.2503314, 0, 0, 0, 1, 1,
0.5023848, -2.533808, 2.902257, 0, 0, 0, 1, 1,
0.503333, -0.0194972, 1.75503, 1, 1, 1, 1, 1,
0.5116037, -1.086912, 1.959095, 1, 1, 1, 1, 1,
0.5161613, 0.2333725, 0.2517736, 1, 1, 1, 1, 1,
0.5211091, -0.5602005, 4.797742, 1, 1, 1, 1, 1,
0.5247984, -0.6234536, 2.605045, 1, 1, 1, 1, 1,
0.5267419, -0.2750717, 1.446337, 1, 1, 1, 1, 1,
0.5269338, 0.1552933, 1.99888, 1, 1, 1, 1, 1,
0.5290704, 0.3232226, 2.851077, 1, 1, 1, 1, 1,
0.532642, 1.195329, 0.7763084, 1, 1, 1, 1, 1,
0.5345045, -0.6183484, 2.489632, 1, 1, 1, 1, 1,
0.5383143, -0.1816273, 2.043978, 1, 1, 1, 1, 1,
0.539305, -2.066096, 3.478709, 1, 1, 1, 1, 1,
0.5414971, 0.612379, -0.6010217, 1, 1, 1, 1, 1,
0.547998, 0.4670154, 0.614724, 1, 1, 1, 1, 1,
0.5480527, -0.6545491, 1.887443, 1, 1, 1, 1, 1,
0.5483418, -0.5965164, 2.541036, 0, 0, 1, 1, 1,
0.5573286, 0.8050277, 1.77604, 1, 0, 0, 1, 1,
0.5576206, -0.2055677, 1.132876, 1, 0, 0, 1, 1,
0.5672404, -1.446324, 2.524345, 1, 0, 0, 1, 1,
0.5794122, 0.6857712, 3.761361, 1, 0, 0, 1, 1,
0.5912853, -0.9425715, 2.549825, 1, 0, 0, 1, 1,
0.6081135, -0.2608704, 2.250899, 0, 0, 0, 1, 1,
0.6088033, -1.97892, 3.241924, 0, 0, 0, 1, 1,
0.6088177, 1.078956, 0.5335647, 0, 0, 0, 1, 1,
0.6111591, -0.8009764, 2.133829, 0, 0, 0, 1, 1,
0.6117369, -0.1763292, 2.757013, 0, 0, 0, 1, 1,
0.6123128, -1.202827, 1.637674, 0, 0, 0, 1, 1,
0.6152332, 2.704987, -1.261196, 0, 0, 0, 1, 1,
0.6155601, -1.671855, 3.511392, 1, 1, 1, 1, 1,
0.619737, -0.7007974, 3.057686, 1, 1, 1, 1, 1,
0.620546, 0.273146, 1.247592, 1, 1, 1, 1, 1,
0.6206576, -0.215953, 1.689717, 1, 1, 1, 1, 1,
0.6220276, 2.144561, -0.2502043, 1, 1, 1, 1, 1,
0.6228042, 0.6509786, -0.4864348, 1, 1, 1, 1, 1,
0.62685, -1.77414, 1.701137, 1, 1, 1, 1, 1,
0.6293722, 0.2263848, -0.1550885, 1, 1, 1, 1, 1,
0.6312855, -1.456938, 1.743198, 1, 1, 1, 1, 1,
0.6319841, 0.1008795, -0.4595859, 1, 1, 1, 1, 1,
0.633, 0.183645, 0.9047186, 1, 1, 1, 1, 1,
0.6336646, -1.458686, 2.136212, 1, 1, 1, 1, 1,
0.6379065, -1.060056, -0.04618701, 1, 1, 1, 1, 1,
0.6392471, -1.027715, 2.246038, 1, 1, 1, 1, 1,
0.6401907, -1.097219, 2.34007, 1, 1, 1, 1, 1,
0.6407722, 0.247927, 2.515922, 0, 0, 1, 1, 1,
0.6443475, 1.517631, -0.965448, 1, 0, 0, 1, 1,
0.6479633, 0.1235066, 1.276857, 1, 0, 0, 1, 1,
0.6495841, -0.04908609, 2.070807, 1, 0, 0, 1, 1,
0.6503713, 0.2327528, 1.33004, 1, 0, 0, 1, 1,
0.6556941, 0.9657048, 0.597635, 1, 0, 0, 1, 1,
0.6567526, 1.179396, 0.8464322, 0, 0, 0, 1, 1,
0.6634368, -1.150846, 4.311858, 0, 0, 0, 1, 1,
0.6692793, 0.1373208, 0.3944476, 0, 0, 0, 1, 1,
0.6700463, -0.09322374, 1.698491, 0, 0, 0, 1, 1,
0.6713372, -1.255389, 3.625142, 0, 0, 0, 1, 1,
0.6727106, 1.318896, 0.4953976, 0, 0, 0, 1, 1,
0.6739104, 0.05668784, 2.609002, 0, 0, 0, 1, 1,
0.6798329, -0.153799, 2.569933, 1, 1, 1, 1, 1,
0.6816225, 0.4943244, 0.6065313, 1, 1, 1, 1, 1,
0.6827415, 0.7848278, 0.7227359, 1, 1, 1, 1, 1,
0.6831824, -0.05671336, 2.82942, 1, 1, 1, 1, 1,
0.6841374, -0.2658038, 0.7024807, 1, 1, 1, 1, 1,
0.6855833, 0.6460531, -0.4352556, 1, 1, 1, 1, 1,
0.6880051, 0.9535522, 0.6178883, 1, 1, 1, 1, 1,
0.6934217, 0.773209, 1.756728, 1, 1, 1, 1, 1,
0.694387, -2.053984, 2.444827, 1, 1, 1, 1, 1,
0.709559, 1.701032, 0.6973007, 1, 1, 1, 1, 1,
0.7107382, 0.7296998, -0.04164921, 1, 1, 1, 1, 1,
0.7120188, -1.438856, 2.119858, 1, 1, 1, 1, 1,
0.7121218, -0.3687461, 3.148372, 1, 1, 1, 1, 1,
0.7130138, 1.070159, 1.111685, 1, 1, 1, 1, 1,
0.7163858, -1.839148, 4.131875, 1, 1, 1, 1, 1,
0.7195973, 0.1465044, 0.2224399, 0, 0, 1, 1, 1,
0.7292498, -0.5170825, 3.14195, 1, 0, 0, 1, 1,
0.7313777, -0.7302308, 1.250388, 1, 0, 0, 1, 1,
0.7347288, -0.2005838, 0.07456099, 1, 0, 0, 1, 1,
0.7362897, 0.5534292, 1.62273, 1, 0, 0, 1, 1,
0.7364381, -0.3415543, 1.501814, 1, 0, 0, 1, 1,
0.7418691, 1.049725, 1.272687, 0, 0, 0, 1, 1,
0.7423161, -0.6308539, 1.959935, 0, 0, 0, 1, 1,
0.7423281, -0.8241617, 2.250978, 0, 0, 0, 1, 1,
0.742333, -0.9327386, 2.149728, 0, 0, 0, 1, 1,
0.7429703, -0.1913215, 2.020947, 0, 0, 0, 1, 1,
0.7457206, -0.90279, 2.298284, 0, 0, 0, 1, 1,
0.7458268, -0.4765667, -0.09301852, 0, 0, 0, 1, 1,
0.7511169, 0.5804996, 1.777279, 1, 1, 1, 1, 1,
0.7535793, -2.828908, 2.392969, 1, 1, 1, 1, 1,
0.7547303, -0.2312852, 2.467051, 1, 1, 1, 1, 1,
0.7571868, 0.04289328, 0.8189449, 1, 1, 1, 1, 1,
0.7577319, 0.7176895, 1.060192, 1, 1, 1, 1, 1,
0.7606755, -0.7590752, 4.241375, 1, 1, 1, 1, 1,
0.7650096, -1.065498, 2.648655, 1, 1, 1, 1, 1,
0.7746759, 1.231738, 1.301872, 1, 1, 1, 1, 1,
0.7853131, -0.5204044, 1.466661, 1, 1, 1, 1, 1,
0.7856127, 0.8186736, 0.4060068, 1, 1, 1, 1, 1,
0.7889238, 0.1265909, 4.039791, 1, 1, 1, 1, 1,
0.78921, 1.636476, -0.1847955, 1, 1, 1, 1, 1,
0.7928455, 0.05599144, 0.8536798, 1, 1, 1, 1, 1,
0.7962409, -0.5756874, 2.29487, 1, 1, 1, 1, 1,
0.7975411, 1.029118, 0.3728008, 1, 1, 1, 1, 1,
0.8010327, 0.5714035, 0.6247199, 0, 0, 1, 1, 1,
0.8064926, 0.6785935, -0.07409302, 1, 0, 0, 1, 1,
0.8096081, -0.3254825, 3.648762, 1, 0, 0, 1, 1,
0.8112468, 1.056351, -0.08373729, 1, 0, 0, 1, 1,
0.8113633, 0.4705666, -0.03220655, 1, 0, 0, 1, 1,
0.8139778, -0.8189251, 0.2822262, 1, 0, 0, 1, 1,
0.8172505, 0.1487664, 0.2231764, 0, 0, 0, 1, 1,
0.819668, -0.8015662, 1.841557, 0, 0, 0, 1, 1,
0.8249095, -0.8012801, 2.018788, 0, 0, 0, 1, 1,
0.8268029, 2.696468, 0.6711308, 0, 0, 0, 1, 1,
0.8291643, -0.05186019, 2.835263, 0, 0, 0, 1, 1,
0.8312699, -0.7967823, 0.884033, 0, 0, 0, 1, 1,
0.8314838, -0.7734695, 0.5631268, 0, 0, 0, 1, 1,
0.836656, -0.03528832, 1.962343, 1, 1, 1, 1, 1,
0.8400716, -0.549027, 2.451501, 1, 1, 1, 1, 1,
0.8468021, -0.8645476, 1.715305, 1, 1, 1, 1, 1,
0.8549201, -0.6476426, 2.955522, 1, 1, 1, 1, 1,
0.857577, 1.948558, 0.2328177, 1, 1, 1, 1, 1,
0.8578765, 1.440574, 1.369202, 1, 1, 1, 1, 1,
0.8612198, -0.3003544, -0.4146728, 1, 1, 1, 1, 1,
0.8636277, 0.8305143, 1.343074, 1, 1, 1, 1, 1,
0.8654978, -1.708453, 3.124941, 1, 1, 1, 1, 1,
0.866201, 0.414454, 1.014089, 1, 1, 1, 1, 1,
0.8675131, 1.814309, 2.273681, 1, 1, 1, 1, 1,
0.8687118, 0.9514743, 1.933535, 1, 1, 1, 1, 1,
0.8694167, -0.9766808, 2.337287, 1, 1, 1, 1, 1,
0.8829572, 1.467494, 0.9313285, 1, 1, 1, 1, 1,
0.8851781, 0.2662431, 2.214069, 1, 1, 1, 1, 1,
0.9014665, -0.4782059, 3.913977, 0, 0, 1, 1, 1,
0.9102013, 1.90576, -0.7433454, 1, 0, 0, 1, 1,
0.9109657, 0.7139695, 2.319238, 1, 0, 0, 1, 1,
0.9111614, -0.3113925, 4.41608, 1, 0, 0, 1, 1,
0.9135001, -0.6388845, 1.010423, 1, 0, 0, 1, 1,
0.9149934, -0.6915897, 2.90333, 1, 0, 0, 1, 1,
0.9193836, 1.771848, 1.657062, 0, 0, 0, 1, 1,
0.92373, -2.407813, 2.913398, 0, 0, 0, 1, 1,
0.9284781, 1.020347, 1.883751, 0, 0, 0, 1, 1,
0.9332401, 0.3648541, 0.5956794, 0, 0, 0, 1, 1,
0.9338941, 0.2016, -0.02756377, 0, 0, 0, 1, 1,
0.9350548, 0.8413656, 0.7949153, 0, 0, 0, 1, 1,
0.9387504, -0.8864442, 2.290132, 0, 0, 0, 1, 1,
0.9454616, -0.2634907, 2.495461, 1, 1, 1, 1, 1,
0.9495055, -1.301009, 3.000829, 1, 1, 1, 1, 1,
0.9519011, 1.43413, -0.8006967, 1, 1, 1, 1, 1,
0.9555284, -1.265316, 3.3081, 1, 1, 1, 1, 1,
0.9557206, -1.144009, 1.423645, 1, 1, 1, 1, 1,
0.9580125, 0.1562354, 0.9320403, 1, 1, 1, 1, 1,
0.960077, 0.4456676, 2.894064, 1, 1, 1, 1, 1,
0.96538, -0.09063432, 2.475727, 1, 1, 1, 1, 1,
0.971702, -1.478976, 3.073215, 1, 1, 1, 1, 1,
0.9757337, 0.4119289, 2.364453, 1, 1, 1, 1, 1,
0.9762833, -1.044477, 3.291651, 1, 1, 1, 1, 1,
0.9789055, -2.300508, 4.322707, 1, 1, 1, 1, 1,
0.9882736, 0.1921561, 1.09164, 1, 1, 1, 1, 1,
0.9886529, 0.07203215, 2.319374, 1, 1, 1, 1, 1,
0.9897151, 0.03920839, 1.98937, 1, 1, 1, 1, 1,
0.9980686, -0.05847761, 1.703056, 0, 0, 1, 1, 1,
1.006123, -0.2570558, 1.051887, 1, 0, 0, 1, 1,
1.008611, -0.3934628, 1.521726, 1, 0, 0, 1, 1,
1.00969, 0.2302948, 1.513323, 1, 0, 0, 1, 1,
1.015344, 0.5181206, 1.024797, 1, 0, 0, 1, 1,
1.021152, 0.5070447, 1.363766, 1, 0, 0, 1, 1,
1.022753, 0.6353593, 0.7319431, 0, 0, 0, 1, 1,
1.022815, 0.09916498, 0.2914501, 0, 0, 0, 1, 1,
1.03258, -2.044408, 2.365787, 0, 0, 0, 1, 1,
1.044266, -0.4421492, 2.133143, 0, 0, 0, 1, 1,
1.046986, -0.1398045, 1.647647, 0, 0, 0, 1, 1,
1.051536, 0.6510927, 0.3969553, 0, 0, 0, 1, 1,
1.052373, 1.785418, 0.1540914, 0, 0, 0, 1, 1,
1.054427, 0.4522912, 1.535015, 1, 1, 1, 1, 1,
1.058082, 0.8663424, 2.050292, 1, 1, 1, 1, 1,
1.061717, -0.5722948, 1.543512, 1, 1, 1, 1, 1,
1.07066, 0.9556993, 1.476812, 1, 1, 1, 1, 1,
1.071643, -2.103075, 3.076327, 1, 1, 1, 1, 1,
1.083995, -0.03540333, 3.157214, 1, 1, 1, 1, 1,
1.085162, 0.9352414, -1.790443, 1, 1, 1, 1, 1,
1.093028, -0.5250764, 1.65927, 1, 1, 1, 1, 1,
1.094018, -0.8888847, 2.245671, 1, 1, 1, 1, 1,
1.099342, 1.27324, 0.8542878, 1, 1, 1, 1, 1,
1.107672, -1.468684, 3.501612, 1, 1, 1, 1, 1,
1.112118, 0.5297366, 1.303174, 1, 1, 1, 1, 1,
1.113282, 0.9017507, 2.421124, 1, 1, 1, 1, 1,
1.118034, 1.597747, 0.407023, 1, 1, 1, 1, 1,
1.118428, 0.3441325, 0.8681023, 1, 1, 1, 1, 1,
1.122064, 0.7348738, -1.966399, 0, 0, 1, 1, 1,
1.122208, -1.32692, 0.9515523, 1, 0, 0, 1, 1,
1.128153, 0.2981125, 0.6362811, 1, 0, 0, 1, 1,
1.134093, 0.6201403, 1.947564, 1, 0, 0, 1, 1,
1.145324, -0.9633142, 2.742547, 1, 0, 0, 1, 1,
1.145384, 0.1339537, 1.267028, 1, 0, 0, 1, 1,
1.156261, 1.570934, -1.127303, 0, 0, 0, 1, 1,
1.156876, -0.2591463, 1.910863, 0, 0, 0, 1, 1,
1.159079, 0.02392685, 2.087354, 0, 0, 0, 1, 1,
1.168921, 0.8149173, 0.6911857, 0, 0, 0, 1, 1,
1.170614, 1.530414, 2.300063, 0, 0, 0, 1, 1,
1.177089, -1.711478, 2.154617, 0, 0, 0, 1, 1,
1.17848, 0.5528231, 1.715493, 0, 0, 0, 1, 1,
1.191398, -0.5611907, 1.529211, 1, 1, 1, 1, 1,
1.194496, -0.7109479, 4.075608, 1, 1, 1, 1, 1,
1.195304, 0.9191087, 2.072848, 1, 1, 1, 1, 1,
1.195326, 0.3860742, 1.18995, 1, 1, 1, 1, 1,
1.19731, 0.191458, 0.8282185, 1, 1, 1, 1, 1,
1.199006, 0.4806027, 1.600454, 1, 1, 1, 1, 1,
1.207794, -0.01038053, 0.7227895, 1, 1, 1, 1, 1,
1.219816, 0.1545393, 2.281894, 1, 1, 1, 1, 1,
1.223093, -2.026913, 2.346748, 1, 1, 1, 1, 1,
1.227055, -0.7832905, 1.897948, 1, 1, 1, 1, 1,
1.230184, 0.1201101, 1.760154, 1, 1, 1, 1, 1,
1.236747, -0.07195022, 1.327816, 1, 1, 1, 1, 1,
1.248362, 1.283108, 3.056559, 1, 1, 1, 1, 1,
1.248828, 0.02364803, 0.4777198, 1, 1, 1, 1, 1,
1.258103, -1.093482, 4.943051, 1, 1, 1, 1, 1,
1.265688, -1.098698, 2.006181, 0, 0, 1, 1, 1,
1.273609, 0.8366107, 1.627453, 1, 0, 0, 1, 1,
1.274285, -0.9203148, 0.8293114, 1, 0, 0, 1, 1,
1.282816, 0.1380292, 1.583715, 1, 0, 0, 1, 1,
1.293756, 0.4880213, -0.1203061, 1, 0, 0, 1, 1,
1.304188, -0.07650553, -0.5207042, 1, 0, 0, 1, 1,
1.309832, -0.1223485, 1.072154, 0, 0, 0, 1, 1,
1.312664, -0.1982326, 2.738235, 0, 0, 0, 1, 1,
1.318998, 1.220195, -0.5789143, 0, 0, 0, 1, 1,
1.326309, 0.2651432, 1.724838, 0, 0, 0, 1, 1,
1.335695, 0.3503621, 1.871041, 0, 0, 0, 1, 1,
1.339036, 0.2990488, -1.078683, 0, 0, 0, 1, 1,
1.339718, 0.02745454, 1.09589, 0, 0, 0, 1, 1,
1.343248, -0.6612584, 2.894039, 1, 1, 1, 1, 1,
1.357116, -1.60744, 2.716708, 1, 1, 1, 1, 1,
1.358584, -1.714009, 3.273461, 1, 1, 1, 1, 1,
1.3646, 0.6040294, 1.263104, 1, 1, 1, 1, 1,
1.368549, 0.7887753, -0.5332732, 1, 1, 1, 1, 1,
1.371001, -0.4415076, 3.686829, 1, 1, 1, 1, 1,
1.373586, -0.7953042, 0.7801168, 1, 1, 1, 1, 1,
1.379112, -0.09779624, 0.4683615, 1, 1, 1, 1, 1,
1.385259, -0.2257906, 2.930854, 1, 1, 1, 1, 1,
1.389817, 0.7599072, 1.538471, 1, 1, 1, 1, 1,
1.391383, 0.6661652, 1.97887, 1, 1, 1, 1, 1,
1.412022, 1.411007, 0.9368806, 1, 1, 1, 1, 1,
1.427508, -0.593329, 0.2889767, 1, 1, 1, 1, 1,
1.436772, -0.5724236, 2.272324, 1, 1, 1, 1, 1,
1.445241, -1.992568, 3.240537, 1, 1, 1, 1, 1,
1.445307, -1.898886, 2.556757, 0, 0, 1, 1, 1,
1.450904, 1.325944, 1.307425, 1, 0, 0, 1, 1,
1.462539, 0.6738174, 1.873821, 1, 0, 0, 1, 1,
1.477054, 1.282369, -0.605498, 1, 0, 0, 1, 1,
1.48015, 1.818578, 2.143312, 1, 0, 0, 1, 1,
1.486553, 1.663212, 1.304037, 1, 0, 0, 1, 1,
1.500589, 0.910551, 2.519083, 0, 0, 0, 1, 1,
1.511753, 0.2834232, 1.011163, 0, 0, 0, 1, 1,
1.548289, 0.04485574, 2.136621, 0, 0, 0, 1, 1,
1.557603, -0.1745434, 2.295918, 0, 0, 0, 1, 1,
1.560703, 0.6604959, 3.03089, 0, 0, 0, 1, 1,
1.580139, 0.6917875, 3.610941, 0, 0, 0, 1, 1,
1.585116, 0.07044476, 2.071936, 0, 0, 0, 1, 1,
1.595259, 0.4236811, 1.475619, 1, 1, 1, 1, 1,
1.595597, 0.2528437, 2.77587, 1, 1, 1, 1, 1,
1.608226, 1.207246, -0.5486628, 1, 1, 1, 1, 1,
1.610779, 0.2597814, 0.6979734, 1, 1, 1, 1, 1,
1.614922, 2.539353, 0.04788835, 1, 1, 1, 1, 1,
1.621779, 0.1479414, 0.4828461, 1, 1, 1, 1, 1,
1.635989, 0.4947601, 0.7202139, 1, 1, 1, 1, 1,
1.644024, 0.7417533, 1.184476, 1, 1, 1, 1, 1,
1.649771, -0.2492887, 2.580472, 1, 1, 1, 1, 1,
1.651105, 0.5928625, 1.423737, 1, 1, 1, 1, 1,
1.659601, -0.4225787, 2.634408, 1, 1, 1, 1, 1,
1.666065, 0.3519307, 0.6832374, 1, 1, 1, 1, 1,
1.673768, 0.8827703, 2.23235, 1, 1, 1, 1, 1,
1.708803, -1.473087, 0.9762744, 1, 1, 1, 1, 1,
1.712389, 1.44509, 1.671219, 1, 1, 1, 1, 1,
1.727826, 1.350041, 1.254847, 0, 0, 1, 1, 1,
1.74068, 0.3359075, 2.055823, 1, 0, 0, 1, 1,
1.744487, 1.516515, 1.638466, 1, 0, 0, 1, 1,
1.794406, -0.01604893, 0.05938424, 1, 0, 0, 1, 1,
1.809386, -0.5926632, 1.444351, 1, 0, 0, 1, 1,
1.831931, 1.693927, 0.4742264, 1, 0, 0, 1, 1,
1.835749, -0.08091909, 1.468932, 0, 0, 0, 1, 1,
1.840753, -0.2398127, 1.152108, 0, 0, 0, 1, 1,
1.86208, -0.2037686, 1.389338, 0, 0, 0, 1, 1,
1.863068, -0.325223, 1.079256, 0, 0, 0, 1, 1,
1.875559, -1.945576, 0.6584514, 0, 0, 0, 1, 1,
1.880708, 1.109287, -0.6921707, 0, 0, 0, 1, 1,
1.88318, 0.7853818, 0.3903612, 0, 0, 0, 1, 1,
1.885767, 0.4210322, 0.9988741, 1, 1, 1, 1, 1,
1.901422, -0.1391869, 1.73189, 1, 1, 1, 1, 1,
1.920428, -0.4488541, 1.938676, 1, 1, 1, 1, 1,
1.960131, 0.6215015, 3.031026, 1, 1, 1, 1, 1,
1.96329, -0.9251992, -0.211702, 1, 1, 1, 1, 1,
1.974939, -0.5880159, 2.791773, 1, 1, 1, 1, 1,
1.986446, 1.354761, 1.226404, 1, 1, 1, 1, 1,
1.987705, 1.997289, 0.004205954, 1, 1, 1, 1, 1,
1.993103, 1.361607, 0.5627411, 1, 1, 1, 1, 1,
1.994083, -0.1543793, 0.5894585, 1, 1, 1, 1, 1,
2.03002, 0.5228485, 3.72543, 1, 1, 1, 1, 1,
2.036038, 0.3751737, 1.643781, 1, 1, 1, 1, 1,
2.038141, -0.7467319, 3.123832, 1, 1, 1, 1, 1,
2.04862, 0.6881416, 0.1618022, 1, 1, 1, 1, 1,
2.050834, 2.666537, 0.2601477, 1, 1, 1, 1, 1,
2.063307, -0.3903631, 1.378053, 0, 0, 1, 1, 1,
2.085702, -0.2120249, 0.9840682, 1, 0, 0, 1, 1,
2.092742, -0.4613081, 1.954495, 1, 0, 0, 1, 1,
2.105207, -0.8906017, 1.67132, 1, 0, 0, 1, 1,
2.121634, 0.01679461, 1.646592, 1, 0, 0, 1, 1,
2.129543, -0.1427511, 2.436522, 1, 0, 0, 1, 1,
2.167434, 1.651581, -0.7741993, 0, 0, 0, 1, 1,
2.174228, -0.5175852, 1.972288, 0, 0, 0, 1, 1,
2.207853, -0.0614608, 1.811532, 0, 0, 0, 1, 1,
2.214758, -0.663654, 1.080283, 0, 0, 0, 1, 1,
2.28085, 0.9530948, 0.2555278, 0, 0, 0, 1, 1,
2.328926, 0.8142207, 2.065864, 0, 0, 0, 1, 1,
2.338568, -1.200877, 0.963192, 0, 0, 0, 1, 1,
2.444912, -0.1936017, 2.627083, 1, 1, 1, 1, 1,
2.494616, 0.8552116, 0.8314774, 1, 1, 1, 1, 1,
2.5371, -0.7555733, 0.1204297, 1, 1, 1, 1, 1,
2.585051, -0.8992544, 2.652408, 1, 1, 1, 1, 1,
2.615802, -1.832526, 1.973264, 1, 1, 1, 1, 1,
2.815713, 0.01083713, 0.976639, 1, 1, 1, 1, 1,
3.173316, -2.073373, 1.05462, 1, 1, 1, 1, 1
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
var radius = 9.447762;
var distance = 33.18486;
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
mvMatrix.translate( 0.1906414, 0.1409664, -0.1132498 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.18486);
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