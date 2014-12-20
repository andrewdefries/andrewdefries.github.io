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
-3.300698, 0.673511, -0.6707172, 1, 0, 0, 1,
-2.876712, 0.4568463, -1.832696, 1, 0.007843138, 0, 1,
-2.743833, -0.9857886, -0.6987137, 1, 0.01176471, 0, 1,
-2.663633, -0.6667004, -1.778223, 1, 0.01960784, 0, 1,
-2.496545, 1.557756, -0.7377779, 1, 0.02352941, 0, 1,
-2.483083, 0.2956132, -1.487291, 1, 0.03137255, 0, 1,
-2.320733, 0.7089331, -1.209724, 1, 0.03529412, 0, 1,
-2.279303, -2.008044, -2.767646, 1, 0.04313726, 0, 1,
-2.277647, 0.6298801, -2.094481, 1, 0.04705882, 0, 1,
-2.267432, -2.090516, -2.090088, 1, 0.05490196, 0, 1,
-2.163066, -1.323524, -1.359359, 1, 0.05882353, 0, 1,
-2.150034, 0.9256538, -1.383255, 1, 0.06666667, 0, 1,
-2.145607, 0.2202441, -2.195774, 1, 0.07058824, 0, 1,
-2.142781, 0.4458685, -1.018107, 1, 0.07843138, 0, 1,
-2.139476, 1.89044, -1.356866, 1, 0.08235294, 0, 1,
-2.1198, 2.139538, -0.8065628, 1, 0.09019608, 0, 1,
-2.102043, 0.7906441, -1.078126, 1, 0.09411765, 0, 1,
-2.096671, -0.0689408, -1.650927, 1, 0.1019608, 0, 1,
-2.082214, 0.6551508, -1.416139, 1, 0.1098039, 0, 1,
-2.007362, -0.1967044, -3.370865, 1, 0.1137255, 0, 1,
-1.996635, 2.479275, 0.1692591, 1, 0.1215686, 0, 1,
-1.995809, -1.096066, -0.3665882, 1, 0.1254902, 0, 1,
-1.981944, 0.2215783, 0.4206458, 1, 0.1333333, 0, 1,
-1.979291, 0.1329197, -2.47932, 1, 0.1372549, 0, 1,
-1.944682, 1.040519, -1.78786, 1, 0.145098, 0, 1,
-1.901415, -0.9270751, -1.702728, 1, 0.1490196, 0, 1,
-1.901341, 0.1779134, -1.950272, 1, 0.1568628, 0, 1,
-1.899889, 0.1010213, -2.736962, 1, 0.1607843, 0, 1,
-1.897939, -1.654052, -3.609274, 1, 0.1686275, 0, 1,
-1.88078, 0.2912506, -2.778329, 1, 0.172549, 0, 1,
-1.880684, -0.8146801, -1.058952, 1, 0.1803922, 0, 1,
-1.835296, 0.07807068, -1.565578, 1, 0.1843137, 0, 1,
-1.820609, 0.5688768, -1.233368, 1, 0.1921569, 0, 1,
-1.817087, -0.02808197, -1.233889, 1, 0.1960784, 0, 1,
-1.811261, 1.092941, -2.306139, 1, 0.2039216, 0, 1,
-1.807775, -0.6748026, -1.177158, 1, 0.2117647, 0, 1,
-1.805113, 1.566367, -1.176561, 1, 0.2156863, 0, 1,
-1.777021, -1.2459, -0.9504742, 1, 0.2235294, 0, 1,
-1.776958, 1.021709, -0.5416599, 1, 0.227451, 0, 1,
-1.769705, 1.057461, -2.08825, 1, 0.2352941, 0, 1,
-1.742266, -0.05298178, -3.351398, 1, 0.2392157, 0, 1,
-1.741237, 0.07637775, -2.762084, 1, 0.2470588, 0, 1,
-1.740903, 1.39007, -0.3840376, 1, 0.2509804, 0, 1,
-1.740193, 0.4910126, -2.046635, 1, 0.2588235, 0, 1,
-1.729403, -0.05503259, -2.507849, 1, 0.2627451, 0, 1,
-1.726268, -1.239607, -1.384625, 1, 0.2705882, 0, 1,
-1.721071, -1.290853, -2.743824, 1, 0.2745098, 0, 1,
-1.720821, 0.08441859, -2.191492, 1, 0.282353, 0, 1,
-1.714284, 0.6680807, -1.030595, 1, 0.2862745, 0, 1,
-1.709126, -2.878889, -2.064559, 1, 0.2941177, 0, 1,
-1.705106, 0.3109224, -1.104314, 1, 0.3019608, 0, 1,
-1.694201, -1.096223, -1.048389, 1, 0.3058824, 0, 1,
-1.679727, -0.2979501, -2.863457, 1, 0.3137255, 0, 1,
-1.676037, 0.5622678, -0.2119718, 1, 0.3176471, 0, 1,
-1.663443, 0.7560374, -1.412368, 1, 0.3254902, 0, 1,
-1.660125, -0.1567858, -2.422834, 1, 0.3294118, 0, 1,
-1.654539, -0.8257849, -1.75403, 1, 0.3372549, 0, 1,
-1.649049, -2.237797, -3.302407, 1, 0.3411765, 0, 1,
-1.640497, -0.4977826, -0.6223308, 1, 0.3490196, 0, 1,
-1.638702, 0.8868119, -0.5448837, 1, 0.3529412, 0, 1,
-1.638695, -0.4532254, -2.486341, 1, 0.3607843, 0, 1,
-1.623801, 0.4953742, -0.9841236, 1, 0.3647059, 0, 1,
-1.617892, -0.7681304, -0.9123992, 1, 0.372549, 0, 1,
-1.614948, -0.2725559, -2.305171, 1, 0.3764706, 0, 1,
-1.609342, 2.485901, 0.1804143, 1, 0.3843137, 0, 1,
-1.606883, 0.1027379, -3.840883, 1, 0.3882353, 0, 1,
-1.606562, -0.4887522, -1.16295, 1, 0.3960784, 0, 1,
-1.599002, 1.797251, 0.1726615, 1, 0.4039216, 0, 1,
-1.596504, 1.407194, -1.28305, 1, 0.4078431, 0, 1,
-1.592396, 1.735396, 0.1340526, 1, 0.4156863, 0, 1,
-1.571741, -1.659713, -1.839061, 1, 0.4196078, 0, 1,
-1.566346, -1.152323, -2.093273, 1, 0.427451, 0, 1,
-1.56257, 0.08265731, -1.863345, 1, 0.4313726, 0, 1,
-1.561505, 0.2450524, -3.335047, 1, 0.4392157, 0, 1,
-1.557526, 0.7778075, -0.437667, 1, 0.4431373, 0, 1,
-1.554405, 0.406927, -1.496516, 1, 0.4509804, 0, 1,
-1.552606, -0.8779954, -2.455101, 1, 0.454902, 0, 1,
-1.547255, -0.4557355, -5.515226, 1, 0.4627451, 0, 1,
-1.542472, -0.2091872, -1.78415, 1, 0.4666667, 0, 1,
-1.519253, -0.02316982, 0.1936064, 1, 0.4745098, 0, 1,
-1.516955, 0.7392094, -2.19509, 1, 0.4784314, 0, 1,
-1.509506, 0.1310441, -2.038702, 1, 0.4862745, 0, 1,
-1.490491, 0.4378109, 0.1248802, 1, 0.4901961, 0, 1,
-1.481804, -0.3920085, 0.1086683, 1, 0.4980392, 0, 1,
-1.477449, 1.585504, -1.894698, 1, 0.5058824, 0, 1,
-1.476671, 0.06639658, -1.674625, 1, 0.509804, 0, 1,
-1.47379, 0.6410524, -1.872631, 1, 0.5176471, 0, 1,
-1.471734, 1.510732, 0.1668698, 1, 0.5215687, 0, 1,
-1.460352, -1.216483, -1.731369, 1, 0.5294118, 0, 1,
-1.460187, -0.7299436, -2.044621, 1, 0.5333334, 0, 1,
-1.43953, 0.9405063, -2.057775, 1, 0.5411765, 0, 1,
-1.435724, 0.4372654, -1.619562, 1, 0.5450981, 0, 1,
-1.433247, 0.2095066, -4.186933, 1, 0.5529412, 0, 1,
-1.424249, 0.7185277, -2.460066, 1, 0.5568628, 0, 1,
-1.407531, 0.3122779, -0.01126925, 1, 0.5647059, 0, 1,
-1.404632, -1.008856, -3.608942, 1, 0.5686275, 0, 1,
-1.392298, -1.074217, -3.381993, 1, 0.5764706, 0, 1,
-1.390692, 1.057855, -2.320471, 1, 0.5803922, 0, 1,
-1.383285, 0.3141979, -2.19087, 1, 0.5882353, 0, 1,
-1.382666, -0.7385404, -3.160946, 1, 0.5921569, 0, 1,
-1.369671, 0.9404929, -1.468489, 1, 0.6, 0, 1,
-1.359794, -0.2208077, -1.886227, 1, 0.6078432, 0, 1,
-1.352665, 0.7380948, -1.604142, 1, 0.6117647, 0, 1,
-1.350709, 0.2928488, -1.108658, 1, 0.6196079, 0, 1,
-1.338645, 0.5210742, -0.4824623, 1, 0.6235294, 0, 1,
-1.336539, -0.2156431, -1.291856, 1, 0.6313726, 0, 1,
-1.325363, 0.124116, -1.833803, 1, 0.6352941, 0, 1,
-1.321093, 0.6855955, -1.028672, 1, 0.6431373, 0, 1,
-1.310777, -0.9638377, -3.325835, 1, 0.6470588, 0, 1,
-1.302854, -0.3409872, -2.312636, 1, 0.654902, 0, 1,
-1.298737, -0.06237262, -1.340032, 1, 0.6588235, 0, 1,
-1.293985, 0.7852067, 0.4800911, 1, 0.6666667, 0, 1,
-1.29189, -0.6302158, -0.8210359, 1, 0.6705883, 0, 1,
-1.288878, -1.092378, -2.064231, 1, 0.6784314, 0, 1,
-1.263859, -0.04318758, -0.9766791, 1, 0.682353, 0, 1,
-1.26132, 0.5523511, 0.9589796, 1, 0.6901961, 0, 1,
-1.25278, -0.2642248, -1.789932, 1, 0.6941177, 0, 1,
-1.25206, 0.01497405, -2.672421, 1, 0.7019608, 0, 1,
-1.249439, -1.18592, -1.3031, 1, 0.7098039, 0, 1,
-1.246487, -0.6389871, -2.683334, 1, 0.7137255, 0, 1,
-1.236572, 1.587576, -1.468656, 1, 0.7215686, 0, 1,
-1.233884, -2.13819, -3.846271, 1, 0.7254902, 0, 1,
-1.2329, 1.363354, -1.002272, 1, 0.7333333, 0, 1,
-1.22462, -1.386144, -2.589961, 1, 0.7372549, 0, 1,
-1.217045, 0.1777672, -1.84015, 1, 0.7450981, 0, 1,
-1.215969, 1.799483, 1.746674, 1, 0.7490196, 0, 1,
-1.212108, 0.3820187, -2.000984, 1, 0.7568628, 0, 1,
-1.209852, 0.6588084, -0.7728273, 1, 0.7607843, 0, 1,
-1.198522, 1.1317, -0.2859697, 1, 0.7686275, 0, 1,
-1.179889, 0.3370839, -0.7638978, 1, 0.772549, 0, 1,
-1.178972, -1.17171, -0.8791643, 1, 0.7803922, 0, 1,
-1.171215, -1.232531, -2.715494, 1, 0.7843137, 0, 1,
-1.171119, 0.3633086, -0.911216, 1, 0.7921569, 0, 1,
-1.15409, -0.1981294, -0.9230314, 1, 0.7960784, 0, 1,
-1.149318, 1.09012, -0.7934799, 1, 0.8039216, 0, 1,
-1.132043, -0.6013142, -0.8485468, 1, 0.8117647, 0, 1,
-1.126239, 0.6525992, -1.675804, 1, 0.8156863, 0, 1,
-1.116833, -0.6218135, -2.513884, 1, 0.8235294, 0, 1,
-1.112262, 0.03144839, -2.761776, 1, 0.827451, 0, 1,
-1.11216, -0.05901834, -1.336288, 1, 0.8352941, 0, 1,
-1.111975, 0.6632202, -1.718768, 1, 0.8392157, 0, 1,
-1.109177, 1.194152, -1.470301, 1, 0.8470588, 0, 1,
-1.108514, -0.2451202, -1.369943, 1, 0.8509804, 0, 1,
-1.104753, 0.7473292, -0.09161815, 1, 0.8588235, 0, 1,
-1.102506, -0.7814769, -1.886811, 1, 0.8627451, 0, 1,
-1.084451, 1.098982, -0.5530427, 1, 0.8705882, 0, 1,
-1.084129, -0.1204915, -1.417962, 1, 0.8745098, 0, 1,
-1.082486, 0.01830246, 0.1886267, 1, 0.8823529, 0, 1,
-1.080857, -0.4534827, -3.894468, 1, 0.8862745, 0, 1,
-1.07913, -0.5480002, -1.154922, 1, 0.8941177, 0, 1,
-1.076584, 1.113879, 0.2224226, 1, 0.8980392, 0, 1,
-1.073247, 1.620582, -0.2872666, 1, 0.9058824, 0, 1,
-1.072746, 0.4139241, -2.955215, 1, 0.9137255, 0, 1,
-1.051239, -0.2472381, -2.883452, 1, 0.9176471, 0, 1,
-1.037659, 1.774574, -0.345865, 1, 0.9254902, 0, 1,
-1.034789, -0.103531, -0.8159632, 1, 0.9294118, 0, 1,
-1.021381, -0.3085358, -3.161782, 1, 0.9372549, 0, 1,
-1.019003, 1.773253, -0.798578, 1, 0.9411765, 0, 1,
-1.017064, 0.2168806, -1.459683, 1, 0.9490196, 0, 1,
-1.007111, 0.08380612, -1.462905, 1, 0.9529412, 0, 1,
-0.9995237, 1.091574, -1.777595, 1, 0.9607843, 0, 1,
-0.9978765, 0.837467, -0.6362637, 1, 0.9647059, 0, 1,
-0.9976851, -1.638972, -0.9674342, 1, 0.972549, 0, 1,
-0.9832134, 0.9072565, -0.9576118, 1, 0.9764706, 0, 1,
-0.9795314, 1.084704, -1.142017, 1, 0.9843137, 0, 1,
-0.9623376, 1.325742, -0.4013115, 1, 0.9882353, 0, 1,
-0.9500865, 0.1749077, -2.536537, 1, 0.9960784, 0, 1,
-0.9500837, -1.482722, -3.038722, 0.9960784, 1, 0, 1,
-0.9434017, 1.093032, -1.52071, 0.9921569, 1, 0, 1,
-0.9275946, 0.5959278, -2.315877, 0.9843137, 1, 0, 1,
-0.9204866, 1.444529, -1.829525, 0.9803922, 1, 0, 1,
-0.9203148, -0.4842697, -1.803845, 0.972549, 1, 0, 1,
-0.9152415, 0.3577017, 0.126781, 0.9686275, 1, 0, 1,
-0.9122857, 0.9075484, -0.3203136, 0.9607843, 1, 0, 1,
-0.9019938, -0.6103725, -3.522136, 0.9568627, 1, 0, 1,
-0.8983048, 0.4367764, -0.8366663, 0.9490196, 1, 0, 1,
-0.8961611, -2.678555, -3.250747, 0.945098, 1, 0, 1,
-0.8954414, -1.536615, -2.967401, 0.9372549, 1, 0, 1,
-0.8845965, 1.076949, -1.366322, 0.9333333, 1, 0, 1,
-0.8823581, -1.068438, -1.471199, 0.9254902, 1, 0, 1,
-0.8762378, -0.7621965, -3.228093, 0.9215686, 1, 0, 1,
-0.8725488, 0.4424738, 0.2383588, 0.9137255, 1, 0, 1,
-0.8722331, 0.004839983, -2.142411, 0.9098039, 1, 0, 1,
-0.8715379, 0.07551102, -1.797474, 0.9019608, 1, 0, 1,
-0.8694576, 1.487296, -0.08910343, 0.8941177, 1, 0, 1,
-0.863048, 0.7011408, -1.531877, 0.8901961, 1, 0, 1,
-0.8613104, 0.4016635, -1.318367, 0.8823529, 1, 0, 1,
-0.8496529, -1.732677, -2.194587, 0.8784314, 1, 0, 1,
-0.8453133, -1.114534, -2.444573, 0.8705882, 1, 0, 1,
-0.8418644, -0.01944853, -2.156705, 0.8666667, 1, 0, 1,
-0.8403198, -1.306619, -1.302681, 0.8588235, 1, 0, 1,
-0.8402485, 1.113082, -1.539168, 0.854902, 1, 0, 1,
-0.8321486, 0.9962217, -0.1434591, 0.8470588, 1, 0, 1,
-0.8176029, 0.282565, -1.796347, 0.8431373, 1, 0, 1,
-0.8082001, -1.694205, -2.564058, 0.8352941, 1, 0, 1,
-0.8025901, 0.7706456, -0.06279422, 0.8313726, 1, 0, 1,
-0.8015767, -0.7482467, -2.911546, 0.8235294, 1, 0, 1,
-0.8014743, -1.328204, -1.366923, 0.8196079, 1, 0, 1,
-0.7949379, -1.255843, -2.875885, 0.8117647, 1, 0, 1,
-0.7739593, -1.624593, -1.080052, 0.8078431, 1, 0, 1,
-0.773214, 1.709551, -2.285219, 0.8, 1, 0, 1,
-0.7691867, 0.2324686, -0.8624852, 0.7921569, 1, 0, 1,
-0.7638789, 0.453223, -1.618582, 0.7882353, 1, 0, 1,
-0.762696, 0.5713142, -1.178176, 0.7803922, 1, 0, 1,
-0.7577528, -0.08829927, -0.8783089, 0.7764706, 1, 0, 1,
-0.7546726, 1.383365, -0.8134385, 0.7686275, 1, 0, 1,
-0.7471444, 0.7538146, 0.02635239, 0.7647059, 1, 0, 1,
-0.7420896, -0.5197788, -1.521005, 0.7568628, 1, 0, 1,
-0.7410698, 0.1909986, -2.188381, 0.7529412, 1, 0, 1,
-0.7392721, -0.8289717, -1.953891, 0.7450981, 1, 0, 1,
-0.7278423, 0.4114276, -1.047832, 0.7411765, 1, 0, 1,
-0.7230442, 0.2360933, -2.323214, 0.7333333, 1, 0, 1,
-0.7188596, 1.664912, 0.8920213, 0.7294118, 1, 0, 1,
-0.7155573, 0.1504061, -2.853372, 0.7215686, 1, 0, 1,
-0.7088266, -0.4964206, -2.713775, 0.7176471, 1, 0, 1,
-0.7038541, 0.3241656, -0.5545546, 0.7098039, 1, 0, 1,
-0.7017778, 1.315876, -1.312895, 0.7058824, 1, 0, 1,
-0.7013091, -0.0966619, -0.6719922, 0.6980392, 1, 0, 1,
-0.7007507, 0.07853802, -1.851654, 0.6901961, 1, 0, 1,
-0.6971449, 0.1667089, -1.318251, 0.6862745, 1, 0, 1,
-0.6955971, -0.930874, -4.697962, 0.6784314, 1, 0, 1,
-0.6942342, -0.9642283, 0.8589162, 0.6745098, 1, 0, 1,
-0.6916886, 0.1906292, -1.318585, 0.6666667, 1, 0, 1,
-0.6916748, 0.2298583, -1.993831, 0.6627451, 1, 0, 1,
-0.687714, 0.7428796, -1.349092, 0.654902, 1, 0, 1,
-0.6821496, 0.02100916, -1.930347, 0.6509804, 1, 0, 1,
-0.6804997, 1.027638, -0.1866768, 0.6431373, 1, 0, 1,
-0.6802587, -1.950227, -5.044103, 0.6392157, 1, 0, 1,
-0.6798314, -0.9548193, -1.554928, 0.6313726, 1, 0, 1,
-0.6777139, 1.969337, -1.727466, 0.627451, 1, 0, 1,
-0.6758, 2.26902, 0.1924915, 0.6196079, 1, 0, 1,
-0.6756089, 0.164515, -0.2177646, 0.6156863, 1, 0, 1,
-0.6708649, -0.2096463, -2.205843, 0.6078432, 1, 0, 1,
-0.658529, 2.100992, -0.5784582, 0.6039216, 1, 0, 1,
-0.6582317, 0.2438345, -1.302145, 0.5960785, 1, 0, 1,
-0.6577107, 1.613224, -0.7063085, 0.5882353, 1, 0, 1,
-0.6549836, 1.305385, -1.448379, 0.5843138, 1, 0, 1,
-0.6507394, 1.613945, -1.06563, 0.5764706, 1, 0, 1,
-0.6450882, -0.03435578, -0.7393234, 0.572549, 1, 0, 1,
-0.6399031, -1.839245, -2.245657, 0.5647059, 1, 0, 1,
-0.6377432, -0.780826, -4.000867, 0.5607843, 1, 0, 1,
-0.6330435, 0.6340026, -0.4935232, 0.5529412, 1, 0, 1,
-0.6328396, 0.6398018, -0.2542079, 0.5490196, 1, 0, 1,
-0.6271617, -0.3269864, -1.715013, 0.5411765, 1, 0, 1,
-0.6253112, -0.9701551, -1.376388, 0.5372549, 1, 0, 1,
-0.6203247, -1.6486, -4.027109, 0.5294118, 1, 0, 1,
-0.6189892, -1.585421, -2.217286, 0.5254902, 1, 0, 1,
-0.6186745, -0.1459637, -1.294181, 0.5176471, 1, 0, 1,
-0.6153238, 0.9344655, -0.8262902, 0.5137255, 1, 0, 1,
-0.6151437, -0.8807847, -2.026631, 0.5058824, 1, 0, 1,
-0.6132547, -1.140577, -2.835386, 0.5019608, 1, 0, 1,
-0.6096168, 0.6366198, -1.533037, 0.4941176, 1, 0, 1,
-0.6094653, -0.498576, -3.484256, 0.4862745, 1, 0, 1,
-0.607132, 0.4637612, 1.045589, 0.4823529, 1, 0, 1,
-0.6070089, 0.2988278, -1.971737, 0.4745098, 1, 0, 1,
-0.6056784, -1.356144, -3.674412, 0.4705882, 1, 0, 1,
-0.6046935, 0.08295856, -1.128416, 0.4627451, 1, 0, 1,
-0.6030155, -1.142392, -2.832187, 0.4588235, 1, 0, 1,
-0.6025198, 0.1052085, -0.7377886, 0.4509804, 1, 0, 1,
-0.6012582, -0.2498812, -3.469896, 0.4470588, 1, 0, 1,
-0.5966662, -0.3972552, -2.299039, 0.4392157, 1, 0, 1,
-0.5957839, 0.4795526, -0.7954881, 0.4352941, 1, 0, 1,
-0.5918461, 1.236771, -1.602806, 0.427451, 1, 0, 1,
-0.5867954, -0.1422934, -3.542606, 0.4235294, 1, 0, 1,
-0.5829512, -1.736952, -3.708703, 0.4156863, 1, 0, 1,
-0.5775895, 0.6032395, -1.388898, 0.4117647, 1, 0, 1,
-0.5737758, -1.420811, -3.575952, 0.4039216, 1, 0, 1,
-0.57068, -0.8543743, -4.735683, 0.3960784, 1, 0, 1,
-0.5562772, 0.1373538, -2.142488, 0.3921569, 1, 0, 1,
-0.5548071, -0.3751687, -2.24128, 0.3843137, 1, 0, 1,
-0.5546642, -0.4837149, -3.336257, 0.3803922, 1, 0, 1,
-0.5533119, 0.3046763, -1.45094, 0.372549, 1, 0, 1,
-0.5528542, 0.04570844, -2.839624, 0.3686275, 1, 0, 1,
-0.5500764, 0.8439496, -0.2636589, 0.3607843, 1, 0, 1,
-0.5493701, -0.5270538, -1.747611, 0.3568628, 1, 0, 1,
-0.5486922, 1.225032, -0.442537, 0.3490196, 1, 0, 1,
-0.547071, -1.044784, -0.6588103, 0.345098, 1, 0, 1,
-0.5468621, -2.875276, -3.973691, 0.3372549, 1, 0, 1,
-0.5444807, -1.464757, -2.635204, 0.3333333, 1, 0, 1,
-0.5428944, -0.5413359, -0.71326, 0.3254902, 1, 0, 1,
-0.5415095, 0.7048389, -0.5877309, 0.3215686, 1, 0, 1,
-0.5397564, 1.314993, -1.510284, 0.3137255, 1, 0, 1,
-0.5361329, 1.134059, -1.274885, 0.3098039, 1, 0, 1,
-0.5307329, -0.4788993, -0.9070165, 0.3019608, 1, 0, 1,
-0.5276209, 0.3122555, -1.866607, 0.2941177, 1, 0, 1,
-0.5250236, 0.1265058, -1.355021, 0.2901961, 1, 0, 1,
-0.5220951, -1.316959, -5.201874, 0.282353, 1, 0, 1,
-0.5108101, -1.253698, -4.582596, 0.2784314, 1, 0, 1,
-0.5097818, 2.672156, 1.149688, 0.2705882, 1, 0, 1,
-0.5082263, 0.3766089, -2.037745, 0.2666667, 1, 0, 1,
-0.5062564, -0.8106781, -1.844827, 0.2588235, 1, 0, 1,
-0.5052996, 1.075183, 0.2562708, 0.254902, 1, 0, 1,
-0.5047215, 0.7605432, 0.2699609, 0.2470588, 1, 0, 1,
-0.4948837, -1.769976, -3.10055, 0.2431373, 1, 0, 1,
-0.4934985, -0.5281199, -2.644602, 0.2352941, 1, 0, 1,
-0.4933477, -0.8323334, -3.030348, 0.2313726, 1, 0, 1,
-0.4791234, -0.3387431, -2.276748, 0.2235294, 1, 0, 1,
-0.4734868, -0.6365339, -3.640387, 0.2196078, 1, 0, 1,
-0.4732191, -0.543263, -1.507698, 0.2117647, 1, 0, 1,
-0.471615, -0.658687, -1.156627, 0.2078431, 1, 0, 1,
-0.4699081, -0.06953388, -2.830693, 0.2, 1, 0, 1,
-0.468545, 2.206162, -0.430448, 0.1921569, 1, 0, 1,
-0.4660385, 1.283715, -2.090583, 0.1882353, 1, 0, 1,
-0.4628603, -0.206676, -1.848826, 0.1803922, 1, 0, 1,
-0.4623609, -0.4096477, -2.878619, 0.1764706, 1, 0, 1,
-0.4617696, -0.7465018, -1.62268, 0.1686275, 1, 0, 1,
-0.4537478, 0.1495247, 0.3516788, 0.1647059, 1, 0, 1,
-0.4534774, 1.308876, -0.3137596, 0.1568628, 1, 0, 1,
-0.4525277, 0.07549132, -1.933822, 0.1529412, 1, 0, 1,
-0.4519384, 0.1599307, -1.114023, 0.145098, 1, 0, 1,
-0.4488021, 0.7604368, -1.419668, 0.1411765, 1, 0, 1,
-0.4380101, 0.2912409, -1.500822, 0.1333333, 1, 0, 1,
-0.4372523, -1.059052, -3.390383, 0.1294118, 1, 0, 1,
-0.4340953, -0.000960145, -1.107906, 0.1215686, 1, 0, 1,
-0.432866, -1.697182, -2.338712, 0.1176471, 1, 0, 1,
-0.4323888, 1.147092, -1.105344, 0.1098039, 1, 0, 1,
-0.4276493, 0.2748217, -0.9461725, 0.1058824, 1, 0, 1,
-0.4272874, -0.6797144, -3.474968, 0.09803922, 1, 0, 1,
-0.4184562, 0.0833054, -1.329908, 0.09019608, 1, 0, 1,
-0.4134671, 0.4356721, -1.371897, 0.08627451, 1, 0, 1,
-0.4126666, -0.6777149, -3.445717, 0.07843138, 1, 0, 1,
-0.4119545, -0.318235, -1.601202, 0.07450981, 1, 0, 1,
-0.409626, -0.3840261, -1.3839, 0.06666667, 1, 0, 1,
-0.4093837, -0.2496713, -2.070037, 0.0627451, 1, 0, 1,
-0.4080809, -0.2585935, -1.159642, 0.05490196, 1, 0, 1,
-0.4054559, -0.08087374, -1.934438, 0.05098039, 1, 0, 1,
-0.4038245, -0.8837865, -4.364553, 0.04313726, 1, 0, 1,
-0.3998871, 0.9183314, -0.3220483, 0.03921569, 1, 0, 1,
-0.3925807, -0.4693542, -2.947222, 0.03137255, 1, 0, 1,
-0.3923189, 0.2364752, -0.4082141, 0.02745098, 1, 0, 1,
-0.3898507, 0.6666775, -0.8648673, 0.01960784, 1, 0, 1,
-0.3897133, 0.3614954, -0.5556169, 0.01568628, 1, 0, 1,
-0.3884684, 0.2487883, 1.018357, 0.007843138, 1, 0, 1,
-0.3862509, -0.3134352, -0.1699619, 0.003921569, 1, 0, 1,
-0.3851262, -1.964296, -3.878831, 0, 1, 0.003921569, 1,
-0.3822748, 1.557522, 1.335995, 0, 1, 0.01176471, 1,
-0.380275, -1.197302, -2.556418, 0, 1, 0.01568628, 1,
-0.3722075, 0.7822881, 1.544946, 0, 1, 0.02352941, 1,
-0.3689197, -0.2689041, -2.043519, 0, 1, 0.02745098, 1,
-0.3631419, -0.5626493, -2.385269, 0, 1, 0.03529412, 1,
-0.3622053, 0.08069125, 0.09605374, 0, 1, 0.03921569, 1,
-0.3573644, -0.1573338, -0.818912, 0, 1, 0.04705882, 1,
-0.3566889, 0.9263114, -0.2131738, 0, 1, 0.05098039, 1,
-0.3566606, 0.5851955, -0.4245262, 0, 1, 0.05882353, 1,
-0.3463032, -0.4794443, -2.154136, 0, 1, 0.0627451, 1,
-0.3456645, 0.9780506, -0.1937304, 0, 1, 0.07058824, 1,
-0.3407736, 0.9655408, -0.8947276, 0, 1, 0.07450981, 1,
-0.3368073, -0.3101282, -3.125527, 0, 1, 0.08235294, 1,
-0.3351766, 0.2619354, 0.6118345, 0, 1, 0.08627451, 1,
-0.333773, -0.5786827, -0.4507283, 0, 1, 0.09411765, 1,
-0.3237453, -0.4236028, -2.005687, 0, 1, 0.1019608, 1,
-0.3205311, -0.4650692, -2.735186, 0, 1, 0.1058824, 1,
-0.3185656, -1.329852, -2.406389, 0, 1, 0.1137255, 1,
-0.3107103, 0.7708457, -0.643431, 0, 1, 0.1176471, 1,
-0.3013587, -0.1046529, -4.413621, 0, 1, 0.1254902, 1,
-0.3006056, -0.2340236, -0.2891369, 0, 1, 0.1294118, 1,
-0.2991141, 0.2841617, -0.2459928, 0, 1, 0.1372549, 1,
-0.2870028, -0.6090884, -2.050339, 0, 1, 0.1411765, 1,
-0.2861254, -1.194253, -3.241369, 0, 1, 0.1490196, 1,
-0.2823003, 0.306433, -1.738162, 0, 1, 0.1529412, 1,
-0.2817017, -0.2232444, -1.334484, 0, 1, 0.1607843, 1,
-0.2796953, -0.4760908, -4.210244, 0, 1, 0.1647059, 1,
-0.2793757, -1.201958, -2.682681, 0, 1, 0.172549, 1,
-0.2756222, 1.080933, -0.8542113, 0, 1, 0.1764706, 1,
-0.2716013, -0.6450157, -3.591009, 0, 1, 0.1843137, 1,
-0.2660167, -0.8957575, -2.657144, 0, 1, 0.1882353, 1,
-0.2631836, -0.2796016, -1.249805, 0, 1, 0.1960784, 1,
-0.25987, 0.7924387, -0.5949125, 0, 1, 0.2039216, 1,
-0.2535021, 0.3961922, 0.3075626, 0, 1, 0.2078431, 1,
-0.2522802, -0.1283209, -2.12248, 0, 1, 0.2156863, 1,
-0.2511568, 0.4923159, -0.02227352, 0, 1, 0.2196078, 1,
-0.2485961, -0.6260381, -2.645612, 0, 1, 0.227451, 1,
-0.2477096, -1.647517, -2.019218, 0, 1, 0.2313726, 1,
-0.246922, 1.179841, 0.5332576, 0, 1, 0.2392157, 1,
-0.2467276, -0.9633762, -3.509983, 0, 1, 0.2431373, 1,
-0.2379625, 1.417392, 0.2278857, 0, 1, 0.2509804, 1,
-0.2340822, 1.011773, 2.058417, 0, 1, 0.254902, 1,
-0.2328114, -0.1485914, -2.571103, 0, 1, 0.2627451, 1,
-0.2314067, 0.8406087, 0.1901963, 0, 1, 0.2666667, 1,
-0.2295279, -0.7273543, -4.141688, 0, 1, 0.2745098, 1,
-0.2289973, -1.440024, -1.707933, 0, 1, 0.2784314, 1,
-0.2282396, -0.2972705, -1.672623, 0, 1, 0.2862745, 1,
-0.2277321, 0.5229304, -0.8859505, 0, 1, 0.2901961, 1,
-0.2267966, 0.06725504, -1.965948, 0, 1, 0.2980392, 1,
-0.2264929, 0.1390438, -1.57731, 0, 1, 0.3058824, 1,
-0.2231972, -0.6811353, -2.90155, 0, 1, 0.3098039, 1,
-0.2165647, -0.9253886, -2.328275, 0, 1, 0.3176471, 1,
-0.2148505, -0.9343703, -1.528059, 0, 1, 0.3215686, 1,
-0.2128363, 0.698765, -1.267948, 0, 1, 0.3294118, 1,
-0.2116219, 0.9127116, 0.4147311, 0, 1, 0.3333333, 1,
-0.2113885, -1.13551, -4.30843, 0, 1, 0.3411765, 1,
-0.2090503, -0.4732836, -3.03814, 0, 1, 0.345098, 1,
-0.2084306, -0.9646068, -3.130173, 0, 1, 0.3529412, 1,
-0.2049693, 0.003455528, -1.445558, 0, 1, 0.3568628, 1,
-0.2042938, -0.6313734, -1.238717, 0, 1, 0.3647059, 1,
-0.2039427, 0.8568186, -0.685514, 0, 1, 0.3686275, 1,
-0.2017007, 0.1751465, -1.292611, 0, 1, 0.3764706, 1,
-0.1913855, 1.866169, -1.856434, 0, 1, 0.3803922, 1,
-0.1899592, -0.2011418, -2.291589, 0, 1, 0.3882353, 1,
-0.1876637, 0.1907277, -0.894537, 0, 1, 0.3921569, 1,
-0.1823059, 1.260786, 0.3942974, 0, 1, 0.4, 1,
-0.181081, 0.5392011, -0.4463803, 0, 1, 0.4078431, 1,
-0.1804997, -1.479728, -2.413047, 0, 1, 0.4117647, 1,
-0.1798787, -0.505464, -1.48442, 0, 1, 0.4196078, 1,
-0.1748358, 0.9954707, 0.1790284, 0, 1, 0.4235294, 1,
-0.1733265, 0.1432508, -1.59435, 0, 1, 0.4313726, 1,
-0.1688636, -1.746161, -2.158366, 0, 1, 0.4352941, 1,
-0.1658656, 0.1669916, -0.2593588, 0, 1, 0.4431373, 1,
-0.1634822, -0.5783849, -2.366322, 0, 1, 0.4470588, 1,
-0.1594002, -0.1335383, -1.603212, 0, 1, 0.454902, 1,
-0.1570975, 0.6622437, -0.2145057, 0, 1, 0.4588235, 1,
-0.1472977, -1.531799, -1.068712, 0, 1, 0.4666667, 1,
-0.1471357, 0.002369011, -0.9115363, 0, 1, 0.4705882, 1,
-0.1445205, -1.418267, -2.081755, 0, 1, 0.4784314, 1,
-0.1436332, -1.962404, -2.469116, 0, 1, 0.4823529, 1,
-0.1384012, -0.7942709, -1.994799, 0, 1, 0.4901961, 1,
-0.1362375, 0.4150266, 0.1136053, 0, 1, 0.4941176, 1,
-0.1322015, 1.639509, -0.2157257, 0, 1, 0.5019608, 1,
-0.1317184, 0.06459357, -0.2777278, 0, 1, 0.509804, 1,
-0.1269864, -0.3035231, -3.907234, 0, 1, 0.5137255, 1,
-0.1235723, -0.5506159, -2.06955, 0, 1, 0.5215687, 1,
-0.1207286, 0.8872278, -0.5722848, 0, 1, 0.5254902, 1,
-0.1183641, -0.1809714, -1.360867, 0, 1, 0.5333334, 1,
-0.1182849, 2.965261, -0.2726854, 0, 1, 0.5372549, 1,
-0.1175149, 1.012766, -0.8102412, 0, 1, 0.5450981, 1,
-0.1142366, -0.4455405, -2.444299, 0, 1, 0.5490196, 1,
-0.1116708, -1.095883, -3.101788, 0, 1, 0.5568628, 1,
-0.1109186, 0.5793382, -1.126832, 0, 1, 0.5607843, 1,
-0.109079, 0.9259314, -0.5301287, 0, 1, 0.5686275, 1,
-0.1087528, 0.2285408, -0.4666485, 0, 1, 0.572549, 1,
-0.1072629, -1.78089, -4.040866, 0, 1, 0.5803922, 1,
-0.1049417, 2.02531, 0.3197905, 0, 1, 0.5843138, 1,
-0.09892341, -1.20968, -2.243031, 0, 1, 0.5921569, 1,
-0.09712765, 1.710171, -0.2794846, 0, 1, 0.5960785, 1,
-0.09492126, -0.6787047, -1.1568, 0, 1, 0.6039216, 1,
-0.094327, 0.2723533, 1.403331, 0, 1, 0.6117647, 1,
-0.09289764, -1.685074, -2.630386, 0, 1, 0.6156863, 1,
-0.09015727, 0.4022029, -0.3002174, 0, 1, 0.6235294, 1,
-0.08916984, 0.6393243, 2.152939, 0, 1, 0.627451, 1,
-0.08760145, 0.5300881, -0.4193057, 0, 1, 0.6352941, 1,
-0.08298407, 0.7029971, 0.8112638, 0, 1, 0.6392157, 1,
-0.08244419, -0.3112524, -4.486785, 0, 1, 0.6470588, 1,
-0.0817237, 0.8301489, 0.2625475, 0, 1, 0.6509804, 1,
-0.07697494, -0.3890793, -3.550203, 0, 1, 0.6588235, 1,
-0.07529194, -0.7836299, -3.339999, 0, 1, 0.6627451, 1,
-0.0747081, -0.06687831, -2.586572, 0, 1, 0.6705883, 1,
-0.07179585, -0.9626167, -3.793237, 0, 1, 0.6745098, 1,
-0.0712098, -1.095416, -2.332969, 0, 1, 0.682353, 1,
-0.06681786, 0.07100839, 1.185816, 0, 1, 0.6862745, 1,
-0.06467924, 1.025023, -0.2694179, 0, 1, 0.6941177, 1,
-0.06438298, 0.211381, -1.824762, 0, 1, 0.7019608, 1,
-0.06331071, 0.005095189, -1.575824, 0, 1, 0.7058824, 1,
-0.06273311, 0.06496368, 1.834535, 0, 1, 0.7137255, 1,
-0.06070349, -0.9070867, -2.122639, 0, 1, 0.7176471, 1,
-0.06037969, 1.61211, 0.09244056, 0, 1, 0.7254902, 1,
-0.05546286, 1.074885, -2.243329, 0, 1, 0.7294118, 1,
-0.04719345, 0.7508652, 0.7093769, 0, 1, 0.7372549, 1,
-0.04605686, 0.5559693, -0.6317315, 0, 1, 0.7411765, 1,
-0.04507042, 1.204453, 1.038924, 0, 1, 0.7490196, 1,
-0.03837183, 0.4985478, -0.1800731, 0, 1, 0.7529412, 1,
-0.0373734, 0.03842161, 0.7724062, 0, 1, 0.7607843, 1,
-0.03649524, -1.286193, -2.313672, 0, 1, 0.7647059, 1,
-0.03263552, -1.361638, -3.198777, 0, 1, 0.772549, 1,
-0.03092585, -1.001349, -2.790493, 0, 1, 0.7764706, 1,
-0.03012415, 1.278732, -0.4698024, 0, 1, 0.7843137, 1,
-0.03012043, 1.050989, 1.512857, 0, 1, 0.7882353, 1,
-0.02841811, 0.1769294, 1.63727, 0, 1, 0.7960784, 1,
-0.0275429, 0.7200301, -0.952336, 0, 1, 0.8039216, 1,
-0.02592371, -0.1137905, -2.036438, 0, 1, 0.8078431, 1,
-0.01908285, 0.1674467, -1.135881, 0, 1, 0.8156863, 1,
-0.01055392, -0.2552081, -3.156445, 0, 1, 0.8196079, 1,
-0.008950175, -0.774516, -4.107553, 0, 1, 0.827451, 1,
-0.006062139, 0.6502945, 0.2110925, 0, 1, 0.8313726, 1,
-0.003122084, 0.926714, -0.04580413, 0, 1, 0.8392157, 1,
-0.002875419, -0.5973557, -4.393296, 0, 1, 0.8431373, 1,
0.001764905, 0.003976347, 0.2834334, 0, 1, 0.8509804, 1,
0.005016212, 0.2234847, 1.240399, 0, 1, 0.854902, 1,
0.007056172, 1.688358, -2.126535, 0, 1, 0.8627451, 1,
0.01481943, 0.6338795, -0.1307781, 0, 1, 0.8666667, 1,
0.01592795, 1.095373, -1.578479, 0, 1, 0.8745098, 1,
0.01730524, 0.02136569, 1.528712, 0, 1, 0.8784314, 1,
0.01760384, 0.8195562, -0.3467866, 0, 1, 0.8862745, 1,
0.02170556, -0.4216534, 4.848742, 0, 1, 0.8901961, 1,
0.02200889, -1.078878, 2.924425, 0, 1, 0.8980392, 1,
0.02472799, 1.146768, -0.04284947, 0, 1, 0.9058824, 1,
0.02731252, -1.843371, 4.042119, 0, 1, 0.9098039, 1,
0.02870943, -1.23477, 1.073361, 0, 1, 0.9176471, 1,
0.03342222, 0.3625757, 1.870287, 0, 1, 0.9215686, 1,
0.03448511, 0.5788788, 1.587495, 0, 1, 0.9294118, 1,
0.03636015, -1.955614, 2.096233, 0, 1, 0.9333333, 1,
0.03676157, 0.1553552, 0.002072788, 0, 1, 0.9411765, 1,
0.03857196, -0.3976396, 3.122361, 0, 1, 0.945098, 1,
0.0401881, 0.1729266, 0.7610231, 0, 1, 0.9529412, 1,
0.04434616, -1.801025, 1.03839, 0, 1, 0.9568627, 1,
0.04772194, 0.9535279, -1.117884, 0, 1, 0.9647059, 1,
0.05368968, 0.1668867, -0.4118336, 0, 1, 0.9686275, 1,
0.0575548, -0.3134095, 2.514032, 0, 1, 0.9764706, 1,
0.05922272, 0.3603599, -0.3169642, 0, 1, 0.9803922, 1,
0.06046551, -0.8989598, 1.811819, 0, 1, 0.9882353, 1,
0.06179902, 0.5583426, -0.5817167, 0, 1, 0.9921569, 1,
0.0622748, -0.04606454, 3.815362, 0, 1, 1, 1,
0.07184249, -0.7509459, 3.148951, 0, 0.9921569, 1, 1,
0.07304438, 0.2515628, -0.459087, 0, 0.9882353, 1, 1,
0.07380594, -0.3012438, 2.442378, 0, 0.9803922, 1, 1,
0.07599313, 1.025446, -0.463558, 0, 0.9764706, 1, 1,
0.08108156, 0.06366348, -0.126418, 0, 0.9686275, 1, 1,
0.0845433, -0.06003856, 2.458555, 0, 0.9647059, 1, 1,
0.08720839, -0.7760705, 2.103819, 0, 0.9568627, 1, 1,
0.09846447, -1.413819, 3.441542, 0, 0.9529412, 1, 1,
0.1020141, 1.016432, 0.09094024, 0, 0.945098, 1, 1,
0.103854, -0.006270909, 2.756982, 0, 0.9411765, 1, 1,
0.1048997, -0.5304867, 3.418151, 0, 0.9333333, 1, 1,
0.1055451, -0.4666549, 3.124385, 0, 0.9294118, 1, 1,
0.1077253, 0.1215982, 1.153978, 0, 0.9215686, 1, 1,
0.1081744, 0.8340567, 0.4745441, 0, 0.9176471, 1, 1,
0.1105202, -1.432094, 3.936648, 0, 0.9098039, 1, 1,
0.1123823, -1.358898, 1.63925, 0, 0.9058824, 1, 1,
0.1165731, 0.8572174, -0.4553778, 0, 0.8980392, 1, 1,
0.1166435, 0.3961592, 1.240218, 0, 0.8901961, 1, 1,
0.1259882, 0.1826153, -0.08657724, 0, 0.8862745, 1, 1,
0.1260391, 0.6026335, -0.7567011, 0, 0.8784314, 1, 1,
0.1274414, -0.6123883, 3.394356, 0, 0.8745098, 1, 1,
0.1285936, -0.9601886, 3.096572, 0, 0.8666667, 1, 1,
0.1300344, 0.3741055, 0.3799804, 0, 0.8627451, 1, 1,
0.1317506, 0.01188353, 1.154228, 0, 0.854902, 1, 1,
0.1321073, -0.3613199, 3.635554, 0, 0.8509804, 1, 1,
0.1327249, 0.3355179, 0.06173628, 0, 0.8431373, 1, 1,
0.1354517, -1.06228, 3.4049, 0, 0.8392157, 1, 1,
0.1366137, 0.9995676, -0.1384009, 0, 0.8313726, 1, 1,
0.1366937, 1.672669, 1.618804, 0, 0.827451, 1, 1,
0.1388198, -0.01549979, -0.2113333, 0, 0.8196079, 1, 1,
0.1454351, 1.486835, 0.7066188, 0, 0.8156863, 1, 1,
0.1540389, 0.8863851, 1.664749, 0, 0.8078431, 1, 1,
0.1618217, 0.7318555, 0.8537329, 0, 0.8039216, 1, 1,
0.1662709, -0.5487541, 1.914974, 0, 0.7960784, 1, 1,
0.1665408, 0.08438352, 1.025212, 0, 0.7882353, 1, 1,
0.1683367, -0.56679, 2.58708, 0, 0.7843137, 1, 1,
0.1703979, -0.0166123, 0.6249478, 0, 0.7764706, 1, 1,
0.1719797, 0.3809373, 0.3299808, 0, 0.772549, 1, 1,
0.1729003, 0.3100535, 1.206109, 0, 0.7647059, 1, 1,
0.177013, -0.4075965, 2.323268, 0, 0.7607843, 1, 1,
0.1779089, 0.54303, -1.14947, 0, 0.7529412, 1, 1,
0.1783788, 0.07593074, 1.972934, 0, 0.7490196, 1, 1,
0.180659, 1.378162, -0.05534166, 0, 0.7411765, 1, 1,
0.1807941, -0.2881382, 3.281246, 0, 0.7372549, 1, 1,
0.1860032, -0.2316084, 3.770172, 0, 0.7294118, 1, 1,
0.1881465, -1.443965, 2.244077, 0, 0.7254902, 1, 1,
0.1886762, -1.636275, 2.843476, 0, 0.7176471, 1, 1,
0.192801, -0.905804, 2.490226, 0, 0.7137255, 1, 1,
0.1946904, 0.3515438, 1.031216, 0, 0.7058824, 1, 1,
0.1971845, -0.1293785, 1.050349, 0, 0.6980392, 1, 1,
0.1979346, 0.1179596, 2.316023, 0, 0.6941177, 1, 1,
0.1979703, -0.04317348, 3.208049, 0, 0.6862745, 1, 1,
0.1986222, 0.1503671, 2.391914, 0, 0.682353, 1, 1,
0.2020082, 1.447506, 0.4303515, 0, 0.6745098, 1, 1,
0.2021577, -0.6171089, 3.128582, 0, 0.6705883, 1, 1,
0.2033741, -1.806865, 3.282427, 0, 0.6627451, 1, 1,
0.2036597, 0.708407, 0.1551903, 0, 0.6588235, 1, 1,
0.2038867, 0.2032574, 1.654962, 0, 0.6509804, 1, 1,
0.2075542, -1.159737, 3.343143, 0, 0.6470588, 1, 1,
0.2087278, -0.4272964, 3.040807, 0, 0.6392157, 1, 1,
0.2119427, 0.07274704, 0.4917076, 0, 0.6352941, 1, 1,
0.2128521, -0.4899406, 3.440225, 0, 0.627451, 1, 1,
0.213608, 0.3637606, 0.08021601, 0, 0.6235294, 1, 1,
0.2147918, -0.5853115, 2.075751, 0, 0.6156863, 1, 1,
0.2185654, -0.4317931, 3.412009, 0, 0.6117647, 1, 1,
0.221227, 0.4207925, 1.00931, 0, 0.6039216, 1, 1,
0.2263725, 0.02979108, 0.4420825, 0, 0.5960785, 1, 1,
0.2311828, -0.6953542, 4.54559, 0, 0.5921569, 1, 1,
0.235229, -0.3720381, 1.107719, 0, 0.5843138, 1, 1,
0.2357883, 0.4275698, -0.5563433, 0, 0.5803922, 1, 1,
0.2391901, -0.2834022, 0.05026302, 0, 0.572549, 1, 1,
0.2450854, -0.7582259, 4.139438, 0, 0.5686275, 1, 1,
0.2457692, 1.028559, 0.7147503, 0, 0.5607843, 1, 1,
0.2472296, -0.7803046, 2.344465, 0, 0.5568628, 1, 1,
0.2495976, 0.8404498, 2.504256, 0, 0.5490196, 1, 1,
0.2515604, -1.915526, 4.252897, 0, 0.5450981, 1, 1,
0.251976, 0.5116885, -0.2728774, 0, 0.5372549, 1, 1,
0.2572488, 0.8962403, 0.8769819, 0, 0.5333334, 1, 1,
0.2595868, -0.1442113, 2.730845, 0, 0.5254902, 1, 1,
0.268712, 0.3831766, 0.4796915, 0, 0.5215687, 1, 1,
0.2698626, 1.028007, -0.5313871, 0, 0.5137255, 1, 1,
0.2713553, -0.9145169, 4.261142, 0, 0.509804, 1, 1,
0.2717039, 0.4498101, 0.7858415, 0, 0.5019608, 1, 1,
0.2719162, -0.2992851, 0.7461688, 0, 0.4941176, 1, 1,
0.272393, -0.8553823, 5.248967, 0, 0.4901961, 1, 1,
0.2756916, -0.4903739, 2.802671, 0, 0.4823529, 1, 1,
0.2834976, 0.4208709, -1.2234, 0, 0.4784314, 1, 1,
0.2837369, -0.03766826, 2.434106, 0, 0.4705882, 1, 1,
0.2867728, 1.179791, 1.177162, 0, 0.4666667, 1, 1,
0.2883703, -0.4616227, 2.20115, 0, 0.4588235, 1, 1,
0.2925059, 0.5708454, 0.03508638, 0, 0.454902, 1, 1,
0.3035344, 0.1910264, 3.539732, 0, 0.4470588, 1, 1,
0.3042274, -0.3697688, 3.878022, 0, 0.4431373, 1, 1,
0.3057228, 0.7930639, 1.308177, 0, 0.4352941, 1, 1,
0.3065886, 0.7976604, 0.6771703, 0, 0.4313726, 1, 1,
0.3076334, 0.9806711, -1.342919, 0, 0.4235294, 1, 1,
0.3077164, 0.5508311, 0.9774122, 0, 0.4196078, 1, 1,
0.3084486, 1.329823, -0.002995699, 0, 0.4117647, 1, 1,
0.309655, 0.1897356, -0.2665127, 0, 0.4078431, 1, 1,
0.3104058, -0.1723845, 0.871433, 0, 0.4, 1, 1,
0.3211467, -0.2924837, 2.200391, 0, 0.3921569, 1, 1,
0.3230741, -0.3569758, 2.69461, 0, 0.3882353, 1, 1,
0.3243214, 0.01409851, 1.461535, 0, 0.3803922, 1, 1,
0.3257968, 0.9452053, 0.3469708, 0, 0.3764706, 1, 1,
0.327602, 0.4399191, 1.607536, 0, 0.3686275, 1, 1,
0.3314095, 1.198485, 0.6400513, 0, 0.3647059, 1, 1,
0.3326903, -0.5087236, 3.250587, 0, 0.3568628, 1, 1,
0.3345823, -1.175119, 2.768173, 0, 0.3529412, 1, 1,
0.3377533, -0.2487788, 1.295564, 0, 0.345098, 1, 1,
0.3449674, -0.05812613, 2.727873, 0, 0.3411765, 1, 1,
0.3455076, 0.3753752, 0.7196324, 0, 0.3333333, 1, 1,
0.3473303, -0.04281253, -0.2567798, 0, 0.3294118, 1, 1,
0.3522219, -1.654397, 2.008757, 0, 0.3215686, 1, 1,
0.3543431, -0.3280226, 3.537251, 0, 0.3176471, 1, 1,
0.3569874, -0.03592038, 3.122527, 0, 0.3098039, 1, 1,
0.3574585, -0.2817971, 1.444054, 0, 0.3058824, 1, 1,
0.3625173, 1.838388, 0.2077152, 0, 0.2980392, 1, 1,
0.3625447, 0.8394397, 1.081688, 0, 0.2901961, 1, 1,
0.362617, 1.153431, -0.234827, 0, 0.2862745, 1, 1,
0.3668234, -0.6351846, 1.226601, 0, 0.2784314, 1, 1,
0.3675428, 0.4277498, -0.737572, 0, 0.2745098, 1, 1,
0.3711958, -2.448169, 3.543186, 0, 0.2666667, 1, 1,
0.3730636, 0.9554454, 1.487461, 0, 0.2627451, 1, 1,
0.3735799, 0.231229, 1.144639, 0, 0.254902, 1, 1,
0.3736015, -1.990712, 4.246718, 0, 0.2509804, 1, 1,
0.3757151, -0.5202021, 1.407857, 0, 0.2431373, 1, 1,
0.3815211, 0.8044264, 1.003785, 0, 0.2392157, 1, 1,
0.3826349, 0.3044583, 1.690205, 0, 0.2313726, 1, 1,
0.3858985, 0.1024219, -0.289107, 0, 0.227451, 1, 1,
0.3892654, -0.3307214, 1.462335, 0, 0.2196078, 1, 1,
0.3953396, -0.8281057, 2.580447, 0, 0.2156863, 1, 1,
0.4010004, -0.8850825, 2.208043, 0, 0.2078431, 1, 1,
0.4012795, -0.5679311, 1.579112, 0, 0.2039216, 1, 1,
0.40149, 1.009078, 1.115193, 0, 0.1960784, 1, 1,
0.4022467, 0.974124, 0.6602936, 0, 0.1882353, 1, 1,
0.4029704, -1.980994, 4.164279, 0, 0.1843137, 1, 1,
0.4070244, 1.115997, 1.409365, 0, 0.1764706, 1, 1,
0.4165932, 0.7139472, 2.67502, 0, 0.172549, 1, 1,
0.4170228, 0.4537106, -0.7757548, 0, 0.1647059, 1, 1,
0.4177598, 0.170105, 0.852487, 0, 0.1607843, 1, 1,
0.4183498, 2.392933, 1.309836, 0, 0.1529412, 1, 1,
0.4193857, 1.807006, -1.158755, 0, 0.1490196, 1, 1,
0.4232005, 1.549015, -0.3943904, 0, 0.1411765, 1, 1,
0.4241071, 0.9182546, 0.3412423, 0, 0.1372549, 1, 1,
0.4249569, 1.456486, 1.089061, 0, 0.1294118, 1, 1,
0.4273152, -0.07697512, 1.682749, 0, 0.1254902, 1, 1,
0.430986, -0.0963568, 1.291312, 0, 0.1176471, 1, 1,
0.4336904, 0.06077415, 0.5908337, 0, 0.1137255, 1, 1,
0.4371541, -0.4034984, 2.091586, 0, 0.1058824, 1, 1,
0.4425207, -0.06900132, 1.604874, 0, 0.09803922, 1, 1,
0.4442155, -1.067038, 3.828273, 0, 0.09411765, 1, 1,
0.4445299, 0.6493186, 1.695411, 0, 0.08627451, 1, 1,
0.4445444, 0.2034622, 1.311407, 0, 0.08235294, 1, 1,
0.4458274, -1.304996, 1.913303, 0, 0.07450981, 1, 1,
0.4470893, 0.6714622, 1.180772, 0, 0.07058824, 1, 1,
0.4476008, 1.655784, -0.06879056, 0, 0.0627451, 1, 1,
0.4478188, -0.6406747, 2.67079, 0, 0.05882353, 1, 1,
0.4480472, -0.08301806, 0.6382182, 0, 0.05098039, 1, 1,
0.4649059, 0.6730329, -1.661827, 0, 0.04705882, 1, 1,
0.4692902, 0.8253985, -0.9887148, 0, 0.03921569, 1, 1,
0.4706462, -1.716497, 1.7162, 0, 0.03529412, 1, 1,
0.4707303, -0.2038587, 2.055982, 0, 0.02745098, 1, 1,
0.4810566, -2.02179, 4.067806, 0, 0.02352941, 1, 1,
0.4816689, -1.839637, 2.763523, 0, 0.01568628, 1, 1,
0.4844161, 2.253361, -0.4432069, 0, 0.01176471, 1, 1,
0.4862598, 1.15609, -0.6865168, 0, 0.003921569, 1, 1,
0.4876201, 0.006812758, 1.939734, 0.003921569, 0, 1, 1,
0.4905633, -1.599998, 2.654648, 0.007843138, 0, 1, 1,
0.4976003, -2.117243, 2.445722, 0.01568628, 0, 1, 1,
0.5035874, 1.611451, 0.9385026, 0.01960784, 0, 1, 1,
0.5041216, 2.683948, -1.516549, 0.02745098, 0, 1, 1,
0.5088725, 0.9916774, 0.3230616, 0.03137255, 0, 1, 1,
0.5101472, 0.6331922, 0.4227734, 0.03921569, 0, 1, 1,
0.5112233, -0.2212816, 1.517895, 0.04313726, 0, 1, 1,
0.5130045, -0.9799419, 1.224981, 0.05098039, 0, 1, 1,
0.5145444, 0.1087784, 0.4476897, 0.05490196, 0, 1, 1,
0.5156412, 0.126146, 1.067836, 0.0627451, 0, 1, 1,
0.5168152, -0.1831597, 0.8446504, 0.06666667, 0, 1, 1,
0.5218773, 0.8568107, 0.1092604, 0.07450981, 0, 1, 1,
0.5221061, -0.4348144, 0.7881418, 0.07843138, 0, 1, 1,
0.5236155, -1.723138, 0.8206459, 0.08627451, 0, 1, 1,
0.5242614, -0.1973413, 0.93516, 0.09019608, 0, 1, 1,
0.5242958, -1.061735, 1.378283, 0.09803922, 0, 1, 1,
0.5257364, -0.6810233, 2.891156, 0.1058824, 0, 1, 1,
0.5257524, -0.8122295, 0.3702796, 0.1098039, 0, 1, 1,
0.5267726, -0.9068603, 2.399904, 0.1176471, 0, 1, 1,
0.531946, 0.4266829, -0.2292654, 0.1215686, 0, 1, 1,
0.5353184, 0.9217216, 0.1942972, 0.1294118, 0, 1, 1,
0.5421923, -0.8490024, 3.27546, 0.1333333, 0, 1, 1,
0.5422382, -1.4446, 4.072565, 0.1411765, 0, 1, 1,
0.5473191, -1.02232, 2.418672, 0.145098, 0, 1, 1,
0.5507169, 1.258901, -2.360557, 0.1529412, 0, 1, 1,
0.5532027, -0.113443, 1.460983, 0.1568628, 0, 1, 1,
0.5556125, -1.708674, 2.637944, 0.1647059, 0, 1, 1,
0.5581416, -0.8435471, 3.336328, 0.1686275, 0, 1, 1,
0.5613614, -0.2610227, 1.780198, 0.1764706, 0, 1, 1,
0.562113, -0.5121346, 1.081228, 0.1803922, 0, 1, 1,
0.5625913, -1.551153, 2.708023, 0.1882353, 0, 1, 1,
0.5687517, -1.044451, 2.686542, 0.1921569, 0, 1, 1,
0.5708817, -1.686603, 4.065955, 0.2, 0, 1, 1,
0.5782331, 0.1584941, 1.75418, 0.2078431, 0, 1, 1,
0.57826, 0.2127793, 0.6159698, 0.2117647, 0, 1, 1,
0.5804147, 0.8282868, 0.248587, 0.2196078, 0, 1, 1,
0.5847839, -2.866886, 4.570826, 0.2235294, 0, 1, 1,
0.5850221, -0.7856894, 2.51908, 0.2313726, 0, 1, 1,
0.5885237, -0.700237, 2.264526, 0.2352941, 0, 1, 1,
0.5948353, -0.2727562, 1.76458, 0.2431373, 0, 1, 1,
0.6003738, -1.378467, 3.024112, 0.2470588, 0, 1, 1,
0.6034131, 1.870292, -1.734334, 0.254902, 0, 1, 1,
0.6083404, 1.10077, -0.710944, 0.2588235, 0, 1, 1,
0.6083872, 0.01053644, 2.68031, 0.2666667, 0, 1, 1,
0.6135176, 1.552821, 0.4410511, 0.2705882, 0, 1, 1,
0.6227654, 1.051726, 0.000895231, 0.2784314, 0, 1, 1,
0.6279117, -0.7855658, 2.990599, 0.282353, 0, 1, 1,
0.6364235, 0.1338573, 1.292459, 0.2901961, 0, 1, 1,
0.6377001, 0.2740859, 1.643, 0.2941177, 0, 1, 1,
0.638154, -0.4130462, 2.404482, 0.3019608, 0, 1, 1,
0.6384584, -2.862093, 1.128906, 0.3098039, 0, 1, 1,
0.643379, 0.2928184, 2.348053, 0.3137255, 0, 1, 1,
0.6433848, 0.4400261, 0.9356149, 0.3215686, 0, 1, 1,
0.6444163, -0.9429207, 2.144167, 0.3254902, 0, 1, 1,
0.6459489, -0.2734811, 2.507388, 0.3333333, 0, 1, 1,
0.6482368, -0.006649196, 2.985078, 0.3372549, 0, 1, 1,
0.6491364, -1.485246, 2.21089, 0.345098, 0, 1, 1,
0.6513687, -1.057928, 2.423578, 0.3490196, 0, 1, 1,
0.6514563, -0.09713146, 2.045694, 0.3568628, 0, 1, 1,
0.6538534, 0.9224758, 0.682624, 0.3607843, 0, 1, 1,
0.6568177, -0.3335524, 2.230017, 0.3686275, 0, 1, 1,
0.6599867, -0.2218025, 0.23517, 0.372549, 0, 1, 1,
0.6617387, 0.6883005, 0.3446578, 0.3803922, 0, 1, 1,
0.6621194, -1.418846, 3.065273, 0.3843137, 0, 1, 1,
0.6629823, -1.245254, 3.514627, 0.3921569, 0, 1, 1,
0.6659608, 0.4950271, 2.51347, 0.3960784, 0, 1, 1,
0.6672735, 0.4174224, 3.398002, 0.4039216, 0, 1, 1,
0.669716, -1.683218, 0.9660554, 0.4117647, 0, 1, 1,
0.6710107, -0.3412508, 2.547189, 0.4156863, 0, 1, 1,
0.673129, 0.4969232, -0.08949129, 0.4235294, 0, 1, 1,
0.6737985, -2.328527, 3.039114, 0.427451, 0, 1, 1,
0.6743126, 1.599478, -0.4413596, 0.4352941, 0, 1, 1,
0.674675, 2.074468, 0.2192619, 0.4392157, 0, 1, 1,
0.6756759, 1.357764, -0.7266878, 0.4470588, 0, 1, 1,
0.6787468, -0.6704559, 2.829095, 0.4509804, 0, 1, 1,
0.679604, 0.3465543, 1.139135, 0.4588235, 0, 1, 1,
0.684041, -0.1267713, -0.4779064, 0.4627451, 0, 1, 1,
0.6872749, 1.343024, -0.241081, 0.4705882, 0, 1, 1,
0.6960645, 1.143205, 0.3477911, 0.4745098, 0, 1, 1,
0.698944, -0.4724983, 1.141151, 0.4823529, 0, 1, 1,
0.7044823, 0.4493445, 2.011005, 0.4862745, 0, 1, 1,
0.706145, 0.9961014, -0.566446, 0.4941176, 0, 1, 1,
0.714243, -1.38811, 4.964377, 0.5019608, 0, 1, 1,
0.7160163, -0.3712977, 1.707423, 0.5058824, 0, 1, 1,
0.716094, -0.08541998, 1.699621, 0.5137255, 0, 1, 1,
0.7162505, 0.7607354, 0.8865201, 0.5176471, 0, 1, 1,
0.7219944, -0.08331718, 0.9740331, 0.5254902, 0, 1, 1,
0.7221726, 0.4489938, 0.4523215, 0.5294118, 0, 1, 1,
0.7226423, -0.7238736, 1.641201, 0.5372549, 0, 1, 1,
0.7290606, -0.6578724, 2.089113, 0.5411765, 0, 1, 1,
0.7322329, 1.14979, 0.4029109, 0.5490196, 0, 1, 1,
0.7335559, 1.541188, -0.7199957, 0.5529412, 0, 1, 1,
0.7364895, -0.5598965, 4.531996, 0.5607843, 0, 1, 1,
0.7371461, 0.2461545, 3.106413, 0.5647059, 0, 1, 1,
0.7379793, 0.5731804, -1.257915, 0.572549, 0, 1, 1,
0.7399586, -1.296721, 4.348453, 0.5764706, 0, 1, 1,
0.7422817, 0.1787245, 2.56408, 0.5843138, 0, 1, 1,
0.7430569, -1.644097, 2.041602, 0.5882353, 0, 1, 1,
0.7432786, 0.7712615, 2.106839, 0.5960785, 0, 1, 1,
0.7483087, 2.569761, 0.4019403, 0.6039216, 0, 1, 1,
0.7491045, -0.08749177, 0.9096301, 0.6078432, 0, 1, 1,
0.7497818, -1.06795, 2.465773, 0.6156863, 0, 1, 1,
0.7503659, -0.1040936, 0.01160622, 0.6196079, 0, 1, 1,
0.7538281, 2.142277, 1.786671, 0.627451, 0, 1, 1,
0.7542996, 1.55006, 0.5004717, 0.6313726, 0, 1, 1,
0.7562876, -0.3798786, 1.665947, 0.6392157, 0, 1, 1,
0.7668931, -0.8929536, 2.409979, 0.6431373, 0, 1, 1,
0.7688541, -0.6157812, 0.8165793, 0.6509804, 0, 1, 1,
0.7709035, 1.300667, 0.3836712, 0.654902, 0, 1, 1,
0.7716663, -0.42431, 2.022916, 0.6627451, 0, 1, 1,
0.7788226, 0.8847049, 1.034387, 0.6666667, 0, 1, 1,
0.7801294, -2.025176, 2.077926, 0.6745098, 0, 1, 1,
0.782541, 2.213687, 0.9009423, 0.6784314, 0, 1, 1,
0.7866088, 1.374923, -0.4901548, 0.6862745, 0, 1, 1,
0.7960187, -1.934193, 3.299861, 0.6901961, 0, 1, 1,
0.7994313, 0.2331639, 0.9419004, 0.6980392, 0, 1, 1,
0.8052189, -1.389796, 4.969731, 0.7058824, 0, 1, 1,
0.8068213, 0.07307798, 2.662735, 0.7098039, 0, 1, 1,
0.8126736, -0.9200307, 2.737873, 0.7176471, 0, 1, 1,
0.8203644, -0.6003401, 1.532213, 0.7215686, 0, 1, 1,
0.8213733, -0.981795, 1.114944, 0.7294118, 0, 1, 1,
0.8249668, 0.4018142, 2.216733, 0.7333333, 0, 1, 1,
0.8276636, -0.9405437, 2.681696, 0.7411765, 0, 1, 1,
0.8287356, 0.4387865, 0.910543, 0.7450981, 0, 1, 1,
0.8350864, 1.044523, 0.06627271, 0.7529412, 0, 1, 1,
0.839864, 1.122737, 0.4398265, 0.7568628, 0, 1, 1,
0.8421286, -0.06492354, 3.071706, 0.7647059, 0, 1, 1,
0.842586, 0.3231875, 0.8538745, 0.7686275, 0, 1, 1,
0.8449242, 0.328264, 2.308854, 0.7764706, 0, 1, 1,
0.8524274, 1.289582, 1.615523, 0.7803922, 0, 1, 1,
0.8604575, -0.06394501, 0.6725388, 0.7882353, 0, 1, 1,
0.8640199, -0.01586754, 1.790466, 0.7921569, 0, 1, 1,
0.8668218, -1.582407, 2.643249, 0.8, 0, 1, 1,
0.8689484, 0.4993024, -0.003160965, 0.8078431, 0, 1, 1,
0.8751646, -0.1254391, 0.4647291, 0.8117647, 0, 1, 1,
0.8757267, -0.9172841, 3.792492, 0.8196079, 0, 1, 1,
0.881966, -0.2787212, 2.094436, 0.8235294, 0, 1, 1,
0.8850572, 0.5981208, 1.494985, 0.8313726, 0, 1, 1,
0.8858801, -0.3221593, 1.441224, 0.8352941, 0, 1, 1,
0.8860856, -0.3472826, 2.101642, 0.8431373, 0, 1, 1,
0.8870073, -1.384459, 2.599506, 0.8470588, 0, 1, 1,
0.8918561, -2.372503, 5.48393, 0.854902, 0, 1, 1,
0.8947349, 0.1146455, 3.081167, 0.8588235, 0, 1, 1,
0.8959079, 0.2068427, 2.453896, 0.8666667, 0, 1, 1,
0.8969333, 0.0185381, 0.7254405, 0.8705882, 0, 1, 1,
0.8993693, -1.089983, 2.250522, 0.8784314, 0, 1, 1,
0.8998797, 0.1627267, -1.343748, 0.8823529, 0, 1, 1,
0.9061478, -0.6718181, 2.533302, 0.8901961, 0, 1, 1,
0.9119954, -1.117059, 2.834972, 0.8941177, 0, 1, 1,
0.9131548, 0.1192063, 2.202026, 0.9019608, 0, 1, 1,
0.9221345, -0.179998, 0.9495475, 0.9098039, 0, 1, 1,
0.9347852, -2.420279, 3.944023, 0.9137255, 0, 1, 1,
0.9372494, 1.195209, 0.3445864, 0.9215686, 0, 1, 1,
0.9412876, 0.6183988, 0.7710359, 0.9254902, 0, 1, 1,
0.9415854, 0.07241494, 1.584322, 0.9333333, 0, 1, 1,
0.9445029, 0.03156042, 1.715154, 0.9372549, 0, 1, 1,
0.945694, -1.498632, 2.527483, 0.945098, 0, 1, 1,
0.9532407, -1.279308, 2.06971, 0.9490196, 0, 1, 1,
0.9580514, 1.971948, 1.361113, 0.9568627, 0, 1, 1,
0.9589261, -0.5714718, 1.598808, 0.9607843, 0, 1, 1,
0.9598729, -0.5484876, 3.263846, 0.9686275, 0, 1, 1,
0.9644631, -2.007115, 3.257084, 0.972549, 0, 1, 1,
0.9648867, 0.2033351, 1.537852, 0.9803922, 0, 1, 1,
0.9675181, -0.9841416, 3.076272, 0.9843137, 0, 1, 1,
0.9700829, -1.023536, 1.715026, 0.9921569, 0, 1, 1,
0.9751047, 0.4206612, 1.18296, 0.9960784, 0, 1, 1,
0.9763977, 1.691402, 1.064349, 1, 0, 0.9960784, 1,
0.9790717, 0.1579309, 1.29616, 1, 0, 0.9882353, 1,
0.9804099, -0.1366403, -0.7351718, 1, 0, 0.9843137, 1,
0.9833955, -1.465945, 2.836868, 1, 0, 0.9764706, 1,
0.9839873, 0.6166137, 1.520964, 1, 0, 0.972549, 1,
0.9855636, -0.0991146, 1.890451, 1, 0, 0.9647059, 1,
0.9858108, -0.07128888, 0.5458848, 1, 0, 0.9607843, 1,
0.9859042, 0.07476115, 0.3122871, 1, 0, 0.9529412, 1,
0.9885714, 0.6283973, 2.177547, 1, 0, 0.9490196, 1,
0.9946221, -0.8543225, 2.75771, 1, 0, 0.9411765, 1,
0.9968078, -3.113732, 3.207812, 1, 0, 0.9372549, 1,
0.9985244, -0.515115, 2.10321, 1, 0, 0.9294118, 1,
1.002689, -1.16543, 1.807795, 1, 0, 0.9254902, 1,
1.003077, 0.7757019, 1.050013, 1, 0, 0.9176471, 1,
1.005994, -0.8943518, 2.594171, 1, 0, 0.9137255, 1,
1.00621, -1.557446, 1.68386, 1, 0, 0.9058824, 1,
1.009923, -0.2983436, 0.6970175, 1, 0, 0.9019608, 1,
1.013905, 0.7831489, 0.6874471, 1, 0, 0.8941177, 1,
1.017365, -1.77351, 1.939865, 1, 0, 0.8862745, 1,
1.023312, 1.969519, 1.999449, 1, 0, 0.8823529, 1,
1.024028, -2.32988, 2.449108, 1, 0, 0.8745098, 1,
1.024447, -1.161607, 1.969139, 1, 0, 0.8705882, 1,
1.044091, 0.07859981, 0.6482476, 1, 0, 0.8627451, 1,
1.052004, 0.1739327, 2.513355, 1, 0, 0.8588235, 1,
1.052693, -1.168409, 2.833328, 1, 0, 0.8509804, 1,
1.058072, 0.997381, -0.9772671, 1, 0, 0.8470588, 1,
1.060876, -1.234921, 1.198045, 1, 0, 0.8392157, 1,
1.065095, 1.805536, 1.022905, 1, 0, 0.8352941, 1,
1.073442, -0.4620659, 2.605329, 1, 0, 0.827451, 1,
1.076542, -0.2274245, 1.587096, 1, 0, 0.8235294, 1,
1.089116, 0.3934264, 0.4394434, 1, 0, 0.8156863, 1,
1.092308, -1.067568, 2.961906, 1, 0, 0.8117647, 1,
1.092657, -0.3596196, 1.441133, 1, 0, 0.8039216, 1,
1.092874, -2.239565, 2.821686, 1, 0, 0.7960784, 1,
1.09377, 0.2783645, 1.885717, 1, 0, 0.7921569, 1,
1.106326, 0.5645333, 2.558734, 1, 0, 0.7843137, 1,
1.111918, -0.310868, 2.555853, 1, 0, 0.7803922, 1,
1.118109, -0.1477772, 2.056873, 1, 0, 0.772549, 1,
1.144978, -0.9591501, 0.9803582, 1, 0, 0.7686275, 1,
1.145719, -0.1257935, -0.1755782, 1, 0, 0.7607843, 1,
1.14685, -0.02318459, 0.7693961, 1, 0, 0.7568628, 1,
1.148095, 0.5898119, 1.140387, 1, 0, 0.7490196, 1,
1.148269, 1.357438, 2.531642, 1, 0, 0.7450981, 1,
1.15146, 0.7197534, 1.475632, 1, 0, 0.7372549, 1,
1.152663, -0.7226189, 1.072172, 1, 0, 0.7333333, 1,
1.154168, -1.247805, 2.108553, 1, 0, 0.7254902, 1,
1.158486, -1.650319, 3.77748, 1, 0, 0.7215686, 1,
1.169479, -0.8731177, 2.36272, 1, 0, 0.7137255, 1,
1.184106, -0.5799801, 3.092731, 1, 0, 0.7098039, 1,
1.184824, 0.03894769, 2.144096, 1, 0, 0.7019608, 1,
1.188829, -0.5995365, 2.456265, 1, 0, 0.6941177, 1,
1.193337, 0.5659208, -1.177513, 1, 0, 0.6901961, 1,
1.195228, 0.9193355, 1.407539, 1, 0, 0.682353, 1,
1.209114, 0.9479442, -1.321914, 1, 0, 0.6784314, 1,
1.214569, 1.073018, 1.034429, 1, 0, 0.6705883, 1,
1.223761, -1.702661, 1.508424, 1, 0, 0.6666667, 1,
1.227146, -0.1551228, 1.270216, 1, 0, 0.6588235, 1,
1.227859, -0.496466, 1.165647, 1, 0, 0.654902, 1,
1.236214, 0.6971838, 2.019996, 1, 0, 0.6470588, 1,
1.241248, 0.4395398, 2.678934, 1, 0, 0.6431373, 1,
1.241558, 0.4942148, 3.710955, 1, 0, 0.6352941, 1,
1.241957, 0.8497285, 0.1464684, 1, 0, 0.6313726, 1,
1.242111, -1.219517, 4.056064, 1, 0, 0.6235294, 1,
1.249848, -0.02009747, 2.157818, 1, 0, 0.6196079, 1,
1.258333, 0.6428559, -0.823077, 1, 0, 0.6117647, 1,
1.259739, 0.3790734, -0.4207447, 1, 0, 0.6078432, 1,
1.272801, 1.047288, 0.87454, 1, 0, 0.6, 1,
1.275028, 0.7976061, 1.388516, 1, 0, 0.5921569, 1,
1.295027, 1.9935, -0.3723783, 1, 0, 0.5882353, 1,
1.296424, 0.8493317, -0.08793438, 1, 0, 0.5803922, 1,
1.300198, 0.6715606, -1.217309, 1, 0, 0.5764706, 1,
1.304373, 0.6133237, 1.785367, 1, 0, 0.5686275, 1,
1.314854, 0.2782897, -0.2368734, 1, 0, 0.5647059, 1,
1.318911, 1.240057, 2.121263, 1, 0, 0.5568628, 1,
1.331597, 0.8863723, 0.5957916, 1, 0, 0.5529412, 1,
1.333422, 0.4916928, 0.8891284, 1, 0, 0.5450981, 1,
1.335746, -0.2759655, 1.394132, 1, 0, 0.5411765, 1,
1.340859, 0.1477075, 3.252113, 1, 0, 0.5333334, 1,
1.346495, -0.1598189, 0.8963602, 1, 0, 0.5294118, 1,
1.346738, -0.2865956, 1.464074, 1, 0, 0.5215687, 1,
1.354779, 0.8400307, 0.4920346, 1, 0, 0.5176471, 1,
1.3564, -0.5454611, 2.257011, 1, 0, 0.509804, 1,
1.360851, -0.03450744, 1.478983, 1, 0, 0.5058824, 1,
1.361498, -1.559385, 1.920285, 1, 0, 0.4980392, 1,
1.366028, -1.025615, 1.144773, 1, 0, 0.4901961, 1,
1.368112, 1.685845, 1.127763, 1, 0, 0.4862745, 1,
1.38138, 0.06119537, 1.744636, 1, 0, 0.4784314, 1,
1.38289, -1.991895, 1.164575, 1, 0, 0.4745098, 1,
1.383221, 0.6244229, 1.896473, 1, 0, 0.4666667, 1,
1.384235, -0.1655202, 0.9281445, 1, 0, 0.4627451, 1,
1.3848, -1.105416, 1.930684, 1, 0, 0.454902, 1,
1.405392, -0.2145994, 1.014549, 1, 0, 0.4509804, 1,
1.431326, 0.7274508, 3.272691, 1, 0, 0.4431373, 1,
1.43152, 1.384393, -1.483634, 1, 0, 0.4392157, 1,
1.433457, 1.768308, -0.3358369, 1, 0, 0.4313726, 1,
1.43383, -1.463939, 3.496102, 1, 0, 0.427451, 1,
1.443447, -1.635871, 0.08028713, 1, 0, 0.4196078, 1,
1.449926, -0.05423494, 2.167097, 1, 0, 0.4156863, 1,
1.455375, 0.02732009, 1.721003, 1, 0, 0.4078431, 1,
1.474123, 0.4805886, 0.63589, 1, 0, 0.4039216, 1,
1.47558, -0.385747, 3.601697, 1, 0, 0.3960784, 1,
1.488917, -0.8552665, 2.144754, 1, 0, 0.3882353, 1,
1.506855, -0.4857018, 0.8251598, 1, 0, 0.3843137, 1,
1.526385, 1.478638, -0.3247925, 1, 0, 0.3764706, 1,
1.528826, -0.4523003, 1.725497, 1, 0, 0.372549, 1,
1.530436, -1.05466, -0.2103226, 1, 0, 0.3647059, 1,
1.541026, 0.3292867, 1.21015, 1, 0, 0.3607843, 1,
1.556227, -0.9630798, 1.486884, 1, 0, 0.3529412, 1,
1.560934, -2.163124, 3.093611, 1, 0, 0.3490196, 1,
1.561525, 1.53442, 1.871658, 1, 0, 0.3411765, 1,
1.563293, 0.895116, -0.3403547, 1, 0, 0.3372549, 1,
1.599242, 0.4871836, 0.3619386, 1, 0, 0.3294118, 1,
1.601189, -1.139269, 3.047538, 1, 0, 0.3254902, 1,
1.60676, 0.7392991, 1.279579, 1, 0, 0.3176471, 1,
1.616132, -1.381044, 1.241667, 1, 0, 0.3137255, 1,
1.622832, 0.8004304, 1.225477, 1, 0, 0.3058824, 1,
1.633905, -1.046513, 5.963077, 1, 0, 0.2980392, 1,
1.652423, -0.05377964, 2.958217, 1, 0, 0.2941177, 1,
1.656148, 0.3789904, 1.6955, 1, 0, 0.2862745, 1,
1.668495, 0.3180842, 1.912239, 1, 0, 0.282353, 1,
1.689044, -1.779076, 3.054159, 1, 0, 0.2745098, 1,
1.694462, 0.5271546, 1.693623, 1, 0, 0.2705882, 1,
1.699861, 0.8081124, 0.95048, 1, 0, 0.2627451, 1,
1.709231, 0.8824737, 2.906959, 1, 0, 0.2588235, 1,
1.722865, 1.729008, -0.2059309, 1, 0, 0.2509804, 1,
1.726633, -0.2167659, 2.21865, 1, 0, 0.2470588, 1,
1.731561, -0.1819654, 1.443234, 1, 0, 0.2392157, 1,
1.740304, -2.160726, 2.185109, 1, 0, 0.2352941, 1,
1.743901, -0.1222267, 2.063501, 1, 0, 0.227451, 1,
1.752191, -0.6315879, 2.684931, 1, 0, 0.2235294, 1,
1.757445, -0.584396, 2.102823, 1, 0, 0.2156863, 1,
1.758061, -0.1189576, -0.6844784, 1, 0, 0.2117647, 1,
1.790656, 1.004538, 0.925054, 1, 0, 0.2039216, 1,
1.790891, 0.2003421, 1.91961, 1, 0, 0.1960784, 1,
1.811141, -1.428505, 0.9146787, 1, 0, 0.1921569, 1,
1.840509, 0.8433244, 1.698884, 1, 0, 0.1843137, 1,
1.865649, 0.7267901, 2.148232, 1, 0, 0.1803922, 1,
1.866899, 0.791447, 0.8007704, 1, 0, 0.172549, 1,
1.934796, -1.660737, 2.446971, 1, 0, 0.1686275, 1,
1.937395, 0.516967, 1.447453, 1, 0, 0.1607843, 1,
1.943675, -0.17696, 1.662403, 1, 0, 0.1568628, 1,
1.952817, 0.523532, 1.415725, 1, 0, 0.1490196, 1,
1.98597, 0.5046282, 1.477471, 1, 0, 0.145098, 1,
1.991462, -0.3111073, 0.3282869, 1, 0, 0.1372549, 1,
2.00452, 1.174874, 1.147062, 1, 0, 0.1333333, 1,
2.006418, 0.5069911, 2.401292, 1, 0, 0.1254902, 1,
2.008919, -0.4271312, 1.134429, 1, 0, 0.1215686, 1,
2.015146, 0.3238426, 0.8627964, 1, 0, 0.1137255, 1,
2.028132, -0.5905089, 2.236462, 1, 0, 0.1098039, 1,
2.037597, 0.3054701, 0.8487159, 1, 0, 0.1019608, 1,
2.130989, 0.3535363, 0.670886, 1, 0, 0.09411765, 1,
2.151825, -0.3393407, 0.2446496, 1, 0, 0.09019608, 1,
2.168545, -1.833001, 3.587303, 1, 0, 0.08235294, 1,
2.183059, -0.7095309, 1.573872, 1, 0, 0.07843138, 1,
2.208037, -1.47593, 0.7463838, 1, 0, 0.07058824, 1,
2.215825, -0.09301966, 1.111619, 1, 0, 0.06666667, 1,
2.240051, 0.0547062, 3.114477, 1, 0, 0.05882353, 1,
2.299888, -0.4403464, 1.726237, 1, 0, 0.05490196, 1,
2.310571, 0.216867, 3.125544, 1, 0, 0.04705882, 1,
2.435672, -0.1332351, 1.896763, 1, 0, 0.04313726, 1,
2.53341, 0.9226484, 2.280642, 1, 0, 0.03529412, 1,
2.608759, 1.635717, 1.939142, 1, 0, 0.03137255, 1,
2.6307, -0.3479451, 2.732073, 1, 0, 0.02352941, 1,
2.674581, 1.258022, 1.431787, 1, 0, 0.01960784, 1,
2.861748, 0.9298694, 2.009852, 1, 0, 0.01176471, 1,
3.189798, 0.7071077, 1.040495, 1, 0, 0.007843138, 1
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
-0.0554502, -4.144121, -7.460798, 0, -0.5, 0.5, 0.5,
-0.0554502, -4.144121, -7.460798, 1, -0.5, 0.5, 0.5,
-0.0554502, -4.144121, -7.460798, 1, 1.5, 0.5, 0.5,
-0.0554502, -4.144121, -7.460798, 0, 1.5, 0.5, 0.5
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
-4.400837, -0.07423556, -7.460798, 0, -0.5, 0.5, 0.5,
-4.400837, -0.07423556, -7.460798, 1, -0.5, 0.5, 0.5,
-4.400837, -0.07423556, -7.460798, 1, 1.5, 0.5, 0.5,
-4.400837, -0.07423556, -7.460798, 0, 1.5, 0.5, 0.5
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
-4.400837, -4.144121, 0.2239254, 0, -0.5, 0.5, 0.5,
-4.400837, -4.144121, 0.2239254, 1, -0.5, 0.5, 0.5,
-4.400837, -4.144121, 0.2239254, 1, 1.5, 0.5, 0.5,
-4.400837, -4.144121, 0.2239254, 0, 1.5, 0.5, 0.5
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
-3, -3.204917, -5.6874,
3, -3.204917, -5.6874,
-3, -3.204917, -5.6874,
-3, -3.361451, -5.982967,
-2, -3.204917, -5.6874,
-2, -3.361451, -5.982967,
-1, -3.204917, -5.6874,
-1, -3.361451, -5.982967,
0, -3.204917, -5.6874,
0, -3.361451, -5.982967,
1, -3.204917, -5.6874,
1, -3.361451, -5.982967,
2, -3.204917, -5.6874,
2, -3.361451, -5.982967,
3, -3.204917, -5.6874,
3, -3.361451, -5.982967
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
-3, -3.674519, -6.574099, 0, -0.5, 0.5, 0.5,
-3, -3.674519, -6.574099, 1, -0.5, 0.5, 0.5,
-3, -3.674519, -6.574099, 1, 1.5, 0.5, 0.5,
-3, -3.674519, -6.574099, 0, 1.5, 0.5, 0.5,
-2, -3.674519, -6.574099, 0, -0.5, 0.5, 0.5,
-2, -3.674519, -6.574099, 1, -0.5, 0.5, 0.5,
-2, -3.674519, -6.574099, 1, 1.5, 0.5, 0.5,
-2, -3.674519, -6.574099, 0, 1.5, 0.5, 0.5,
-1, -3.674519, -6.574099, 0, -0.5, 0.5, 0.5,
-1, -3.674519, -6.574099, 1, -0.5, 0.5, 0.5,
-1, -3.674519, -6.574099, 1, 1.5, 0.5, 0.5,
-1, -3.674519, -6.574099, 0, 1.5, 0.5, 0.5,
0, -3.674519, -6.574099, 0, -0.5, 0.5, 0.5,
0, -3.674519, -6.574099, 1, -0.5, 0.5, 0.5,
0, -3.674519, -6.574099, 1, 1.5, 0.5, 0.5,
0, -3.674519, -6.574099, 0, 1.5, 0.5, 0.5,
1, -3.674519, -6.574099, 0, -0.5, 0.5, 0.5,
1, -3.674519, -6.574099, 1, -0.5, 0.5, 0.5,
1, -3.674519, -6.574099, 1, 1.5, 0.5, 0.5,
1, -3.674519, -6.574099, 0, 1.5, 0.5, 0.5,
2, -3.674519, -6.574099, 0, -0.5, 0.5, 0.5,
2, -3.674519, -6.574099, 1, -0.5, 0.5, 0.5,
2, -3.674519, -6.574099, 1, 1.5, 0.5, 0.5,
2, -3.674519, -6.574099, 0, 1.5, 0.5, 0.5,
3, -3.674519, -6.574099, 0, -0.5, 0.5, 0.5,
3, -3.674519, -6.574099, 1, -0.5, 0.5, 0.5,
3, -3.674519, -6.574099, 1, 1.5, 0.5, 0.5,
3, -3.674519, -6.574099, 0, 1.5, 0.5, 0.5
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
-3.398056, -3, -5.6874,
-3.398056, 2, -5.6874,
-3.398056, -3, -5.6874,
-3.565186, -3, -5.982967,
-3.398056, -2, -5.6874,
-3.565186, -2, -5.982967,
-3.398056, -1, -5.6874,
-3.565186, -1, -5.982967,
-3.398056, 0, -5.6874,
-3.565186, 0, -5.982967,
-3.398056, 1, -5.6874,
-3.565186, 1, -5.982967,
-3.398056, 2, -5.6874,
-3.565186, 2, -5.982967
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
-3.899446, -3, -6.574099, 0, -0.5, 0.5, 0.5,
-3.899446, -3, -6.574099, 1, -0.5, 0.5, 0.5,
-3.899446, -3, -6.574099, 1, 1.5, 0.5, 0.5,
-3.899446, -3, -6.574099, 0, 1.5, 0.5, 0.5,
-3.899446, -2, -6.574099, 0, -0.5, 0.5, 0.5,
-3.899446, -2, -6.574099, 1, -0.5, 0.5, 0.5,
-3.899446, -2, -6.574099, 1, 1.5, 0.5, 0.5,
-3.899446, -2, -6.574099, 0, 1.5, 0.5, 0.5,
-3.899446, -1, -6.574099, 0, -0.5, 0.5, 0.5,
-3.899446, -1, -6.574099, 1, -0.5, 0.5, 0.5,
-3.899446, -1, -6.574099, 1, 1.5, 0.5, 0.5,
-3.899446, -1, -6.574099, 0, 1.5, 0.5, 0.5,
-3.899446, 0, -6.574099, 0, -0.5, 0.5, 0.5,
-3.899446, 0, -6.574099, 1, -0.5, 0.5, 0.5,
-3.899446, 0, -6.574099, 1, 1.5, 0.5, 0.5,
-3.899446, 0, -6.574099, 0, 1.5, 0.5, 0.5,
-3.899446, 1, -6.574099, 0, -0.5, 0.5, 0.5,
-3.899446, 1, -6.574099, 1, -0.5, 0.5, 0.5,
-3.899446, 1, -6.574099, 1, 1.5, 0.5, 0.5,
-3.899446, 1, -6.574099, 0, 1.5, 0.5, 0.5,
-3.899446, 2, -6.574099, 0, -0.5, 0.5, 0.5,
-3.899446, 2, -6.574099, 1, -0.5, 0.5, 0.5,
-3.899446, 2, -6.574099, 1, 1.5, 0.5, 0.5,
-3.899446, 2, -6.574099, 0, 1.5, 0.5, 0.5
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
-3.398056, -3.204917, -4,
-3.398056, -3.204917, 4,
-3.398056, -3.204917, -4,
-3.565186, -3.361451, -4,
-3.398056, -3.204917, -2,
-3.565186, -3.361451, -2,
-3.398056, -3.204917, 0,
-3.565186, -3.361451, 0,
-3.398056, -3.204917, 2,
-3.565186, -3.361451, 2,
-3.398056, -3.204917, 4,
-3.565186, -3.361451, 4
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
-3.899446, -3.674519, -4, 0, -0.5, 0.5, 0.5,
-3.899446, -3.674519, -4, 1, -0.5, 0.5, 0.5,
-3.899446, -3.674519, -4, 1, 1.5, 0.5, 0.5,
-3.899446, -3.674519, -4, 0, 1.5, 0.5, 0.5,
-3.899446, -3.674519, -2, 0, -0.5, 0.5, 0.5,
-3.899446, -3.674519, -2, 1, -0.5, 0.5, 0.5,
-3.899446, -3.674519, -2, 1, 1.5, 0.5, 0.5,
-3.899446, -3.674519, -2, 0, 1.5, 0.5, 0.5,
-3.899446, -3.674519, 0, 0, -0.5, 0.5, 0.5,
-3.899446, -3.674519, 0, 1, -0.5, 0.5, 0.5,
-3.899446, -3.674519, 0, 1, 1.5, 0.5, 0.5,
-3.899446, -3.674519, 0, 0, 1.5, 0.5, 0.5,
-3.899446, -3.674519, 2, 0, -0.5, 0.5, 0.5,
-3.899446, -3.674519, 2, 1, -0.5, 0.5, 0.5,
-3.899446, -3.674519, 2, 1, 1.5, 0.5, 0.5,
-3.899446, -3.674519, 2, 0, 1.5, 0.5, 0.5,
-3.899446, -3.674519, 4, 0, -0.5, 0.5, 0.5,
-3.899446, -3.674519, 4, 1, -0.5, 0.5, 0.5,
-3.899446, -3.674519, 4, 1, 1.5, 0.5, 0.5,
-3.899446, -3.674519, 4, 0, 1.5, 0.5, 0.5
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
-3.398056, -3.204917, -5.6874,
-3.398056, 3.056446, -5.6874,
-3.398056, -3.204917, 6.135251,
-3.398056, 3.056446, 6.135251,
-3.398056, -3.204917, -5.6874,
-3.398056, -3.204917, 6.135251,
-3.398056, 3.056446, -5.6874,
-3.398056, 3.056446, 6.135251,
-3.398056, -3.204917, -5.6874,
3.287155, -3.204917, -5.6874,
-3.398056, -3.204917, 6.135251,
3.287155, -3.204917, 6.135251,
-3.398056, 3.056446, -5.6874,
3.287155, 3.056446, -5.6874,
-3.398056, 3.056446, 6.135251,
3.287155, 3.056446, 6.135251,
3.287155, -3.204917, -5.6874,
3.287155, 3.056446, -5.6874,
3.287155, -3.204917, 6.135251,
3.287155, 3.056446, 6.135251,
3.287155, -3.204917, -5.6874,
3.287155, -3.204917, 6.135251,
3.287155, 3.056446, -5.6874,
3.287155, 3.056446, 6.135251
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
var radius = 7.986033;
var distance = 35.53076;
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
mvMatrix.translate( 0.0554502, 0.07423556, -0.2239254 );
mvMatrix.scale( 1.291605, 1.379038, 0.7303484 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.53076);
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
dimethipin<-read.table("dimethipin.xyz")
```

```
## Error in read.table("dimethipin.xyz"): no lines available in input
```

```r
x<-dimethipin$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethipin' not found
```

```r
y<-dimethipin$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethipin' not found
```

```r
z<-dimethipin$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethipin' not found
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
-3.300698, 0.673511, -0.6707172, 0, 0, 1, 1, 1,
-2.876712, 0.4568463, -1.832696, 1, 0, 0, 1, 1,
-2.743833, -0.9857886, -0.6987137, 1, 0, 0, 1, 1,
-2.663633, -0.6667004, -1.778223, 1, 0, 0, 1, 1,
-2.496545, 1.557756, -0.7377779, 1, 0, 0, 1, 1,
-2.483083, 0.2956132, -1.487291, 1, 0, 0, 1, 1,
-2.320733, 0.7089331, -1.209724, 0, 0, 0, 1, 1,
-2.279303, -2.008044, -2.767646, 0, 0, 0, 1, 1,
-2.277647, 0.6298801, -2.094481, 0, 0, 0, 1, 1,
-2.267432, -2.090516, -2.090088, 0, 0, 0, 1, 1,
-2.163066, -1.323524, -1.359359, 0, 0, 0, 1, 1,
-2.150034, 0.9256538, -1.383255, 0, 0, 0, 1, 1,
-2.145607, 0.2202441, -2.195774, 0, 0, 0, 1, 1,
-2.142781, 0.4458685, -1.018107, 1, 1, 1, 1, 1,
-2.139476, 1.89044, -1.356866, 1, 1, 1, 1, 1,
-2.1198, 2.139538, -0.8065628, 1, 1, 1, 1, 1,
-2.102043, 0.7906441, -1.078126, 1, 1, 1, 1, 1,
-2.096671, -0.0689408, -1.650927, 1, 1, 1, 1, 1,
-2.082214, 0.6551508, -1.416139, 1, 1, 1, 1, 1,
-2.007362, -0.1967044, -3.370865, 1, 1, 1, 1, 1,
-1.996635, 2.479275, 0.1692591, 1, 1, 1, 1, 1,
-1.995809, -1.096066, -0.3665882, 1, 1, 1, 1, 1,
-1.981944, 0.2215783, 0.4206458, 1, 1, 1, 1, 1,
-1.979291, 0.1329197, -2.47932, 1, 1, 1, 1, 1,
-1.944682, 1.040519, -1.78786, 1, 1, 1, 1, 1,
-1.901415, -0.9270751, -1.702728, 1, 1, 1, 1, 1,
-1.901341, 0.1779134, -1.950272, 1, 1, 1, 1, 1,
-1.899889, 0.1010213, -2.736962, 1, 1, 1, 1, 1,
-1.897939, -1.654052, -3.609274, 0, 0, 1, 1, 1,
-1.88078, 0.2912506, -2.778329, 1, 0, 0, 1, 1,
-1.880684, -0.8146801, -1.058952, 1, 0, 0, 1, 1,
-1.835296, 0.07807068, -1.565578, 1, 0, 0, 1, 1,
-1.820609, 0.5688768, -1.233368, 1, 0, 0, 1, 1,
-1.817087, -0.02808197, -1.233889, 1, 0, 0, 1, 1,
-1.811261, 1.092941, -2.306139, 0, 0, 0, 1, 1,
-1.807775, -0.6748026, -1.177158, 0, 0, 0, 1, 1,
-1.805113, 1.566367, -1.176561, 0, 0, 0, 1, 1,
-1.777021, -1.2459, -0.9504742, 0, 0, 0, 1, 1,
-1.776958, 1.021709, -0.5416599, 0, 0, 0, 1, 1,
-1.769705, 1.057461, -2.08825, 0, 0, 0, 1, 1,
-1.742266, -0.05298178, -3.351398, 0, 0, 0, 1, 1,
-1.741237, 0.07637775, -2.762084, 1, 1, 1, 1, 1,
-1.740903, 1.39007, -0.3840376, 1, 1, 1, 1, 1,
-1.740193, 0.4910126, -2.046635, 1, 1, 1, 1, 1,
-1.729403, -0.05503259, -2.507849, 1, 1, 1, 1, 1,
-1.726268, -1.239607, -1.384625, 1, 1, 1, 1, 1,
-1.721071, -1.290853, -2.743824, 1, 1, 1, 1, 1,
-1.720821, 0.08441859, -2.191492, 1, 1, 1, 1, 1,
-1.714284, 0.6680807, -1.030595, 1, 1, 1, 1, 1,
-1.709126, -2.878889, -2.064559, 1, 1, 1, 1, 1,
-1.705106, 0.3109224, -1.104314, 1, 1, 1, 1, 1,
-1.694201, -1.096223, -1.048389, 1, 1, 1, 1, 1,
-1.679727, -0.2979501, -2.863457, 1, 1, 1, 1, 1,
-1.676037, 0.5622678, -0.2119718, 1, 1, 1, 1, 1,
-1.663443, 0.7560374, -1.412368, 1, 1, 1, 1, 1,
-1.660125, -0.1567858, -2.422834, 1, 1, 1, 1, 1,
-1.654539, -0.8257849, -1.75403, 0, 0, 1, 1, 1,
-1.649049, -2.237797, -3.302407, 1, 0, 0, 1, 1,
-1.640497, -0.4977826, -0.6223308, 1, 0, 0, 1, 1,
-1.638702, 0.8868119, -0.5448837, 1, 0, 0, 1, 1,
-1.638695, -0.4532254, -2.486341, 1, 0, 0, 1, 1,
-1.623801, 0.4953742, -0.9841236, 1, 0, 0, 1, 1,
-1.617892, -0.7681304, -0.9123992, 0, 0, 0, 1, 1,
-1.614948, -0.2725559, -2.305171, 0, 0, 0, 1, 1,
-1.609342, 2.485901, 0.1804143, 0, 0, 0, 1, 1,
-1.606883, 0.1027379, -3.840883, 0, 0, 0, 1, 1,
-1.606562, -0.4887522, -1.16295, 0, 0, 0, 1, 1,
-1.599002, 1.797251, 0.1726615, 0, 0, 0, 1, 1,
-1.596504, 1.407194, -1.28305, 0, 0, 0, 1, 1,
-1.592396, 1.735396, 0.1340526, 1, 1, 1, 1, 1,
-1.571741, -1.659713, -1.839061, 1, 1, 1, 1, 1,
-1.566346, -1.152323, -2.093273, 1, 1, 1, 1, 1,
-1.56257, 0.08265731, -1.863345, 1, 1, 1, 1, 1,
-1.561505, 0.2450524, -3.335047, 1, 1, 1, 1, 1,
-1.557526, 0.7778075, -0.437667, 1, 1, 1, 1, 1,
-1.554405, 0.406927, -1.496516, 1, 1, 1, 1, 1,
-1.552606, -0.8779954, -2.455101, 1, 1, 1, 1, 1,
-1.547255, -0.4557355, -5.515226, 1, 1, 1, 1, 1,
-1.542472, -0.2091872, -1.78415, 1, 1, 1, 1, 1,
-1.519253, -0.02316982, 0.1936064, 1, 1, 1, 1, 1,
-1.516955, 0.7392094, -2.19509, 1, 1, 1, 1, 1,
-1.509506, 0.1310441, -2.038702, 1, 1, 1, 1, 1,
-1.490491, 0.4378109, 0.1248802, 1, 1, 1, 1, 1,
-1.481804, -0.3920085, 0.1086683, 1, 1, 1, 1, 1,
-1.477449, 1.585504, -1.894698, 0, 0, 1, 1, 1,
-1.476671, 0.06639658, -1.674625, 1, 0, 0, 1, 1,
-1.47379, 0.6410524, -1.872631, 1, 0, 0, 1, 1,
-1.471734, 1.510732, 0.1668698, 1, 0, 0, 1, 1,
-1.460352, -1.216483, -1.731369, 1, 0, 0, 1, 1,
-1.460187, -0.7299436, -2.044621, 1, 0, 0, 1, 1,
-1.43953, 0.9405063, -2.057775, 0, 0, 0, 1, 1,
-1.435724, 0.4372654, -1.619562, 0, 0, 0, 1, 1,
-1.433247, 0.2095066, -4.186933, 0, 0, 0, 1, 1,
-1.424249, 0.7185277, -2.460066, 0, 0, 0, 1, 1,
-1.407531, 0.3122779, -0.01126925, 0, 0, 0, 1, 1,
-1.404632, -1.008856, -3.608942, 0, 0, 0, 1, 1,
-1.392298, -1.074217, -3.381993, 0, 0, 0, 1, 1,
-1.390692, 1.057855, -2.320471, 1, 1, 1, 1, 1,
-1.383285, 0.3141979, -2.19087, 1, 1, 1, 1, 1,
-1.382666, -0.7385404, -3.160946, 1, 1, 1, 1, 1,
-1.369671, 0.9404929, -1.468489, 1, 1, 1, 1, 1,
-1.359794, -0.2208077, -1.886227, 1, 1, 1, 1, 1,
-1.352665, 0.7380948, -1.604142, 1, 1, 1, 1, 1,
-1.350709, 0.2928488, -1.108658, 1, 1, 1, 1, 1,
-1.338645, 0.5210742, -0.4824623, 1, 1, 1, 1, 1,
-1.336539, -0.2156431, -1.291856, 1, 1, 1, 1, 1,
-1.325363, 0.124116, -1.833803, 1, 1, 1, 1, 1,
-1.321093, 0.6855955, -1.028672, 1, 1, 1, 1, 1,
-1.310777, -0.9638377, -3.325835, 1, 1, 1, 1, 1,
-1.302854, -0.3409872, -2.312636, 1, 1, 1, 1, 1,
-1.298737, -0.06237262, -1.340032, 1, 1, 1, 1, 1,
-1.293985, 0.7852067, 0.4800911, 1, 1, 1, 1, 1,
-1.29189, -0.6302158, -0.8210359, 0, 0, 1, 1, 1,
-1.288878, -1.092378, -2.064231, 1, 0, 0, 1, 1,
-1.263859, -0.04318758, -0.9766791, 1, 0, 0, 1, 1,
-1.26132, 0.5523511, 0.9589796, 1, 0, 0, 1, 1,
-1.25278, -0.2642248, -1.789932, 1, 0, 0, 1, 1,
-1.25206, 0.01497405, -2.672421, 1, 0, 0, 1, 1,
-1.249439, -1.18592, -1.3031, 0, 0, 0, 1, 1,
-1.246487, -0.6389871, -2.683334, 0, 0, 0, 1, 1,
-1.236572, 1.587576, -1.468656, 0, 0, 0, 1, 1,
-1.233884, -2.13819, -3.846271, 0, 0, 0, 1, 1,
-1.2329, 1.363354, -1.002272, 0, 0, 0, 1, 1,
-1.22462, -1.386144, -2.589961, 0, 0, 0, 1, 1,
-1.217045, 0.1777672, -1.84015, 0, 0, 0, 1, 1,
-1.215969, 1.799483, 1.746674, 1, 1, 1, 1, 1,
-1.212108, 0.3820187, -2.000984, 1, 1, 1, 1, 1,
-1.209852, 0.6588084, -0.7728273, 1, 1, 1, 1, 1,
-1.198522, 1.1317, -0.2859697, 1, 1, 1, 1, 1,
-1.179889, 0.3370839, -0.7638978, 1, 1, 1, 1, 1,
-1.178972, -1.17171, -0.8791643, 1, 1, 1, 1, 1,
-1.171215, -1.232531, -2.715494, 1, 1, 1, 1, 1,
-1.171119, 0.3633086, -0.911216, 1, 1, 1, 1, 1,
-1.15409, -0.1981294, -0.9230314, 1, 1, 1, 1, 1,
-1.149318, 1.09012, -0.7934799, 1, 1, 1, 1, 1,
-1.132043, -0.6013142, -0.8485468, 1, 1, 1, 1, 1,
-1.126239, 0.6525992, -1.675804, 1, 1, 1, 1, 1,
-1.116833, -0.6218135, -2.513884, 1, 1, 1, 1, 1,
-1.112262, 0.03144839, -2.761776, 1, 1, 1, 1, 1,
-1.11216, -0.05901834, -1.336288, 1, 1, 1, 1, 1,
-1.111975, 0.6632202, -1.718768, 0, 0, 1, 1, 1,
-1.109177, 1.194152, -1.470301, 1, 0, 0, 1, 1,
-1.108514, -0.2451202, -1.369943, 1, 0, 0, 1, 1,
-1.104753, 0.7473292, -0.09161815, 1, 0, 0, 1, 1,
-1.102506, -0.7814769, -1.886811, 1, 0, 0, 1, 1,
-1.084451, 1.098982, -0.5530427, 1, 0, 0, 1, 1,
-1.084129, -0.1204915, -1.417962, 0, 0, 0, 1, 1,
-1.082486, 0.01830246, 0.1886267, 0, 0, 0, 1, 1,
-1.080857, -0.4534827, -3.894468, 0, 0, 0, 1, 1,
-1.07913, -0.5480002, -1.154922, 0, 0, 0, 1, 1,
-1.076584, 1.113879, 0.2224226, 0, 0, 0, 1, 1,
-1.073247, 1.620582, -0.2872666, 0, 0, 0, 1, 1,
-1.072746, 0.4139241, -2.955215, 0, 0, 0, 1, 1,
-1.051239, -0.2472381, -2.883452, 1, 1, 1, 1, 1,
-1.037659, 1.774574, -0.345865, 1, 1, 1, 1, 1,
-1.034789, -0.103531, -0.8159632, 1, 1, 1, 1, 1,
-1.021381, -0.3085358, -3.161782, 1, 1, 1, 1, 1,
-1.019003, 1.773253, -0.798578, 1, 1, 1, 1, 1,
-1.017064, 0.2168806, -1.459683, 1, 1, 1, 1, 1,
-1.007111, 0.08380612, -1.462905, 1, 1, 1, 1, 1,
-0.9995237, 1.091574, -1.777595, 1, 1, 1, 1, 1,
-0.9978765, 0.837467, -0.6362637, 1, 1, 1, 1, 1,
-0.9976851, -1.638972, -0.9674342, 1, 1, 1, 1, 1,
-0.9832134, 0.9072565, -0.9576118, 1, 1, 1, 1, 1,
-0.9795314, 1.084704, -1.142017, 1, 1, 1, 1, 1,
-0.9623376, 1.325742, -0.4013115, 1, 1, 1, 1, 1,
-0.9500865, 0.1749077, -2.536537, 1, 1, 1, 1, 1,
-0.9500837, -1.482722, -3.038722, 1, 1, 1, 1, 1,
-0.9434017, 1.093032, -1.52071, 0, 0, 1, 1, 1,
-0.9275946, 0.5959278, -2.315877, 1, 0, 0, 1, 1,
-0.9204866, 1.444529, -1.829525, 1, 0, 0, 1, 1,
-0.9203148, -0.4842697, -1.803845, 1, 0, 0, 1, 1,
-0.9152415, 0.3577017, 0.126781, 1, 0, 0, 1, 1,
-0.9122857, 0.9075484, -0.3203136, 1, 0, 0, 1, 1,
-0.9019938, -0.6103725, -3.522136, 0, 0, 0, 1, 1,
-0.8983048, 0.4367764, -0.8366663, 0, 0, 0, 1, 1,
-0.8961611, -2.678555, -3.250747, 0, 0, 0, 1, 1,
-0.8954414, -1.536615, -2.967401, 0, 0, 0, 1, 1,
-0.8845965, 1.076949, -1.366322, 0, 0, 0, 1, 1,
-0.8823581, -1.068438, -1.471199, 0, 0, 0, 1, 1,
-0.8762378, -0.7621965, -3.228093, 0, 0, 0, 1, 1,
-0.8725488, 0.4424738, 0.2383588, 1, 1, 1, 1, 1,
-0.8722331, 0.004839983, -2.142411, 1, 1, 1, 1, 1,
-0.8715379, 0.07551102, -1.797474, 1, 1, 1, 1, 1,
-0.8694576, 1.487296, -0.08910343, 1, 1, 1, 1, 1,
-0.863048, 0.7011408, -1.531877, 1, 1, 1, 1, 1,
-0.8613104, 0.4016635, -1.318367, 1, 1, 1, 1, 1,
-0.8496529, -1.732677, -2.194587, 1, 1, 1, 1, 1,
-0.8453133, -1.114534, -2.444573, 1, 1, 1, 1, 1,
-0.8418644, -0.01944853, -2.156705, 1, 1, 1, 1, 1,
-0.8403198, -1.306619, -1.302681, 1, 1, 1, 1, 1,
-0.8402485, 1.113082, -1.539168, 1, 1, 1, 1, 1,
-0.8321486, 0.9962217, -0.1434591, 1, 1, 1, 1, 1,
-0.8176029, 0.282565, -1.796347, 1, 1, 1, 1, 1,
-0.8082001, -1.694205, -2.564058, 1, 1, 1, 1, 1,
-0.8025901, 0.7706456, -0.06279422, 1, 1, 1, 1, 1,
-0.8015767, -0.7482467, -2.911546, 0, 0, 1, 1, 1,
-0.8014743, -1.328204, -1.366923, 1, 0, 0, 1, 1,
-0.7949379, -1.255843, -2.875885, 1, 0, 0, 1, 1,
-0.7739593, -1.624593, -1.080052, 1, 0, 0, 1, 1,
-0.773214, 1.709551, -2.285219, 1, 0, 0, 1, 1,
-0.7691867, 0.2324686, -0.8624852, 1, 0, 0, 1, 1,
-0.7638789, 0.453223, -1.618582, 0, 0, 0, 1, 1,
-0.762696, 0.5713142, -1.178176, 0, 0, 0, 1, 1,
-0.7577528, -0.08829927, -0.8783089, 0, 0, 0, 1, 1,
-0.7546726, 1.383365, -0.8134385, 0, 0, 0, 1, 1,
-0.7471444, 0.7538146, 0.02635239, 0, 0, 0, 1, 1,
-0.7420896, -0.5197788, -1.521005, 0, 0, 0, 1, 1,
-0.7410698, 0.1909986, -2.188381, 0, 0, 0, 1, 1,
-0.7392721, -0.8289717, -1.953891, 1, 1, 1, 1, 1,
-0.7278423, 0.4114276, -1.047832, 1, 1, 1, 1, 1,
-0.7230442, 0.2360933, -2.323214, 1, 1, 1, 1, 1,
-0.7188596, 1.664912, 0.8920213, 1, 1, 1, 1, 1,
-0.7155573, 0.1504061, -2.853372, 1, 1, 1, 1, 1,
-0.7088266, -0.4964206, -2.713775, 1, 1, 1, 1, 1,
-0.7038541, 0.3241656, -0.5545546, 1, 1, 1, 1, 1,
-0.7017778, 1.315876, -1.312895, 1, 1, 1, 1, 1,
-0.7013091, -0.0966619, -0.6719922, 1, 1, 1, 1, 1,
-0.7007507, 0.07853802, -1.851654, 1, 1, 1, 1, 1,
-0.6971449, 0.1667089, -1.318251, 1, 1, 1, 1, 1,
-0.6955971, -0.930874, -4.697962, 1, 1, 1, 1, 1,
-0.6942342, -0.9642283, 0.8589162, 1, 1, 1, 1, 1,
-0.6916886, 0.1906292, -1.318585, 1, 1, 1, 1, 1,
-0.6916748, 0.2298583, -1.993831, 1, 1, 1, 1, 1,
-0.687714, 0.7428796, -1.349092, 0, 0, 1, 1, 1,
-0.6821496, 0.02100916, -1.930347, 1, 0, 0, 1, 1,
-0.6804997, 1.027638, -0.1866768, 1, 0, 0, 1, 1,
-0.6802587, -1.950227, -5.044103, 1, 0, 0, 1, 1,
-0.6798314, -0.9548193, -1.554928, 1, 0, 0, 1, 1,
-0.6777139, 1.969337, -1.727466, 1, 0, 0, 1, 1,
-0.6758, 2.26902, 0.1924915, 0, 0, 0, 1, 1,
-0.6756089, 0.164515, -0.2177646, 0, 0, 0, 1, 1,
-0.6708649, -0.2096463, -2.205843, 0, 0, 0, 1, 1,
-0.658529, 2.100992, -0.5784582, 0, 0, 0, 1, 1,
-0.6582317, 0.2438345, -1.302145, 0, 0, 0, 1, 1,
-0.6577107, 1.613224, -0.7063085, 0, 0, 0, 1, 1,
-0.6549836, 1.305385, -1.448379, 0, 0, 0, 1, 1,
-0.6507394, 1.613945, -1.06563, 1, 1, 1, 1, 1,
-0.6450882, -0.03435578, -0.7393234, 1, 1, 1, 1, 1,
-0.6399031, -1.839245, -2.245657, 1, 1, 1, 1, 1,
-0.6377432, -0.780826, -4.000867, 1, 1, 1, 1, 1,
-0.6330435, 0.6340026, -0.4935232, 1, 1, 1, 1, 1,
-0.6328396, 0.6398018, -0.2542079, 1, 1, 1, 1, 1,
-0.6271617, -0.3269864, -1.715013, 1, 1, 1, 1, 1,
-0.6253112, -0.9701551, -1.376388, 1, 1, 1, 1, 1,
-0.6203247, -1.6486, -4.027109, 1, 1, 1, 1, 1,
-0.6189892, -1.585421, -2.217286, 1, 1, 1, 1, 1,
-0.6186745, -0.1459637, -1.294181, 1, 1, 1, 1, 1,
-0.6153238, 0.9344655, -0.8262902, 1, 1, 1, 1, 1,
-0.6151437, -0.8807847, -2.026631, 1, 1, 1, 1, 1,
-0.6132547, -1.140577, -2.835386, 1, 1, 1, 1, 1,
-0.6096168, 0.6366198, -1.533037, 1, 1, 1, 1, 1,
-0.6094653, -0.498576, -3.484256, 0, 0, 1, 1, 1,
-0.607132, 0.4637612, 1.045589, 1, 0, 0, 1, 1,
-0.6070089, 0.2988278, -1.971737, 1, 0, 0, 1, 1,
-0.6056784, -1.356144, -3.674412, 1, 0, 0, 1, 1,
-0.6046935, 0.08295856, -1.128416, 1, 0, 0, 1, 1,
-0.6030155, -1.142392, -2.832187, 1, 0, 0, 1, 1,
-0.6025198, 0.1052085, -0.7377886, 0, 0, 0, 1, 1,
-0.6012582, -0.2498812, -3.469896, 0, 0, 0, 1, 1,
-0.5966662, -0.3972552, -2.299039, 0, 0, 0, 1, 1,
-0.5957839, 0.4795526, -0.7954881, 0, 0, 0, 1, 1,
-0.5918461, 1.236771, -1.602806, 0, 0, 0, 1, 1,
-0.5867954, -0.1422934, -3.542606, 0, 0, 0, 1, 1,
-0.5829512, -1.736952, -3.708703, 0, 0, 0, 1, 1,
-0.5775895, 0.6032395, -1.388898, 1, 1, 1, 1, 1,
-0.5737758, -1.420811, -3.575952, 1, 1, 1, 1, 1,
-0.57068, -0.8543743, -4.735683, 1, 1, 1, 1, 1,
-0.5562772, 0.1373538, -2.142488, 1, 1, 1, 1, 1,
-0.5548071, -0.3751687, -2.24128, 1, 1, 1, 1, 1,
-0.5546642, -0.4837149, -3.336257, 1, 1, 1, 1, 1,
-0.5533119, 0.3046763, -1.45094, 1, 1, 1, 1, 1,
-0.5528542, 0.04570844, -2.839624, 1, 1, 1, 1, 1,
-0.5500764, 0.8439496, -0.2636589, 1, 1, 1, 1, 1,
-0.5493701, -0.5270538, -1.747611, 1, 1, 1, 1, 1,
-0.5486922, 1.225032, -0.442537, 1, 1, 1, 1, 1,
-0.547071, -1.044784, -0.6588103, 1, 1, 1, 1, 1,
-0.5468621, -2.875276, -3.973691, 1, 1, 1, 1, 1,
-0.5444807, -1.464757, -2.635204, 1, 1, 1, 1, 1,
-0.5428944, -0.5413359, -0.71326, 1, 1, 1, 1, 1,
-0.5415095, 0.7048389, -0.5877309, 0, 0, 1, 1, 1,
-0.5397564, 1.314993, -1.510284, 1, 0, 0, 1, 1,
-0.5361329, 1.134059, -1.274885, 1, 0, 0, 1, 1,
-0.5307329, -0.4788993, -0.9070165, 1, 0, 0, 1, 1,
-0.5276209, 0.3122555, -1.866607, 1, 0, 0, 1, 1,
-0.5250236, 0.1265058, -1.355021, 1, 0, 0, 1, 1,
-0.5220951, -1.316959, -5.201874, 0, 0, 0, 1, 1,
-0.5108101, -1.253698, -4.582596, 0, 0, 0, 1, 1,
-0.5097818, 2.672156, 1.149688, 0, 0, 0, 1, 1,
-0.5082263, 0.3766089, -2.037745, 0, 0, 0, 1, 1,
-0.5062564, -0.8106781, -1.844827, 0, 0, 0, 1, 1,
-0.5052996, 1.075183, 0.2562708, 0, 0, 0, 1, 1,
-0.5047215, 0.7605432, 0.2699609, 0, 0, 0, 1, 1,
-0.4948837, -1.769976, -3.10055, 1, 1, 1, 1, 1,
-0.4934985, -0.5281199, -2.644602, 1, 1, 1, 1, 1,
-0.4933477, -0.8323334, -3.030348, 1, 1, 1, 1, 1,
-0.4791234, -0.3387431, -2.276748, 1, 1, 1, 1, 1,
-0.4734868, -0.6365339, -3.640387, 1, 1, 1, 1, 1,
-0.4732191, -0.543263, -1.507698, 1, 1, 1, 1, 1,
-0.471615, -0.658687, -1.156627, 1, 1, 1, 1, 1,
-0.4699081, -0.06953388, -2.830693, 1, 1, 1, 1, 1,
-0.468545, 2.206162, -0.430448, 1, 1, 1, 1, 1,
-0.4660385, 1.283715, -2.090583, 1, 1, 1, 1, 1,
-0.4628603, -0.206676, -1.848826, 1, 1, 1, 1, 1,
-0.4623609, -0.4096477, -2.878619, 1, 1, 1, 1, 1,
-0.4617696, -0.7465018, -1.62268, 1, 1, 1, 1, 1,
-0.4537478, 0.1495247, 0.3516788, 1, 1, 1, 1, 1,
-0.4534774, 1.308876, -0.3137596, 1, 1, 1, 1, 1,
-0.4525277, 0.07549132, -1.933822, 0, 0, 1, 1, 1,
-0.4519384, 0.1599307, -1.114023, 1, 0, 0, 1, 1,
-0.4488021, 0.7604368, -1.419668, 1, 0, 0, 1, 1,
-0.4380101, 0.2912409, -1.500822, 1, 0, 0, 1, 1,
-0.4372523, -1.059052, -3.390383, 1, 0, 0, 1, 1,
-0.4340953, -0.000960145, -1.107906, 1, 0, 0, 1, 1,
-0.432866, -1.697182, -2.338712, 0, 0, 0, 1, 1,
-0.4323888, 1.147092, -1.105344, 0, 0, 0, 1, 1,
-0.4276493, 0.2748217, -0.9461725, 0, 0, 0, 1, 1,
-0.4272874, -0.6797144, -3.474968, 0, 0, 0, 1, 1,
-0.4184562, 0.0833054, -1.329908, 0, 0, 0, 1, 1,
-0.4134671, 0.4356721, -1.371897, 0, 0, 0, 1, 1,
-0.4126666, -0.6777149, -3.445717, 0, 0, 0, 1, 1,
-0.4119545, -0.318235, -1.601202, 1, 1, 1, 1, 1,
-0.409626, -0.3840261, -1.3839, 1, 1, 1, 1, 1,
-0.4093837, -0.2496713, -2.070037, 1, 1, 1, 1, 1,
-0.4080809, -0.2585935, -1.159642, 1, 1, 1, 1, 1,
-0.4054559, -0.08087374, -1.934438, 1, 1, 1, 1, 1,
-0.4038245, -0.8837865, -4.364553, 1, 1, 1, 1, 1,
-0.3998871, 0.9183314, -0.3220483, 1, 1, 1, 1, 1,
-0.3925807, -0.4693542, -2.947222, 1, 1, 1, 1, 1,
-0.3923189, 0.2364752, -0.4082141, 1, 1, 1, 1, 1,
-0.3898507, 0.6666775, -0.8648673, 1, 1, 1, 1, 1,
-0.3897133, 0.3614954, -0.5556169, 1, 1, 1, 1, 1,
-0.3884684, 0.2487883, 1.018357, 1, 1, 1, 1, 1,
-0.3862509, -0.3134352, -0.1699619, 1, 1, 1, 1, 1,
-0.3851262, -1.964296, -3.878831, 1, 1, 1, 1, 1,
-0.3822748, 1.557522, 1.335995, 1, 1, 1, 1, 1,
-0.380275, -1.197302, -2.556418, 0, 0, 1, 1, 1,
-0.3722075, 0.7822881, 1.544946, 1, 0, 0, 1, 1,
-0.3689197, -0.2689041, -2.043519, 1, 0, 0, 1, 1,
-0.3631419, -0.5626493, -2.385269, 1, 0, 0, 1, 1,
-0.3622053, 0.08069125, 0.09605374, 1, 0, 0, 1, 1,
-0.3573644, -0.1573338, -0.818912, 1, 0, 0, 1, 1,
-0.3566889, 0.9263114, -0.2131738, 0, 0, 0, 1, 1,
-0.3566606, 0.5851955, -0.4245262, 0, 0, 0, 1, 1,
-0.3463032, -0.4794443, -2.154136, 0, 0, 0, 1, 1,
-0.3456645, 0.9780506, -0.1937304, 0, 0, 0, 1, 1,
-0.3407736, 0.9655408, -0.8947276, 0, 0, 0, 1, 1,
-0.3368073, -0.3101282, -3.125527, 0, 0, 0, 1, 1,
-0.3351766, 0.2619354, 0.6118345, 0, 0, 0, 1, 1,
-0.333773, -0.5786827, -0.4507283, 1, 1, 1, 1, 1,
-0.3237453, -0.4236028, -2.005687, 1, 1, 1, 1, 1,
-0.3205311, -0.4650692, -2.735186, 1, 1, 1, 1, 1,
-0.3185656, -1.329852, -2.406389, 1, 1, 1, 1, 1,
-0.3107103, 0.7708457, -0.643431, 1, 1, 1, 1, 1,
-0.3013587, -0.1046529, -4.413621, 1, 1, 1, 1, 1,
-0.3006056, -0.2340236, -0.2891369, 1, 1, 1, 1, 1,
-0.2991141, 0.2841617, -0.2459928, 1, 1, 1, 1, 1,
-0.2870028, -0.6090884, -2.050339, 1, 1, 1, 1, 1,
-0.2861254, -1.194253, -3.241369, 1, 1, 1, 1, 1,
-0.2823003, 0.306433, -1.738162, 1, 1, 1, 1, 1,
-0.2817017, -0.2232444, -1.334484, 1, 1, 1, 1, 1,
-0.2796953, -0.4760908, -4.210244, 1, 1, 1, 1, 1,
-0.2793757, -1.201958, -2.682681, 1, 1, 1, 1, 1,
-0.2756222, 1.080933, -0.8542113, 1, 1, 1, 1, 1,
-0.2716013, -0.6450157, -3.591009, 0, 0, 1, 1, 1,
-0.2660167, -0.8957575, -2.657144, 1, 0, 0, 1, 1,
-0.2631836, -0.2796016, -1.249805, 1, 0, 0, 1, 1,
-0.25987, 0.7924387, -0.5949125, 1, 0, 0, 1, 1,
-0.2535021, 0.3961922, 0.3075626, 1, 0, 0, 1, 1,
-0.2522802, -0.1283209, -2.12248, 1, 0, 0, 1, 1,
-0.2511568, 0.4923159, -0.02227352, 0, 0, 0, 1, 1,
-0.2485961, -0.6260381, -2.645612, 0, 0, 0, 1, 1,
-0.2477096, -1.647517, -2.019218, 0, 0, 0, 1, 1,
-0.246922, 1.179841, 0.5332576, 0, 0, 0, 1, 1,
-0.2467276, -0.9633762, -3.509983, 0, 0, 0, 1, 1,
-0.2379625, 1.417392, 0.2278857, 0, 0, 0, 1, 1,
-0.2340822, 1.011773, 2.058417, 0, 0, 0, 1, 1,
-0.2328114, -0.1485914, -2.571103, 1, 1, 1, 1, 1,
-0.2314067, 0.8406087, 0.1901963, 1, 1, 1, 1, 1,
-0.2295279, -0.7273543, -4.141688, 1, 1, 1, 1, 1,
-0.2289973, -1.440024, -1.707933, 1, 1, 1, 1, 1,
-0.2282396, -0.2972705, -1.672623, 1, 1, 1, 1, 1,
-0.2277321, 0.5229304, -0.8859505, 1, 1, 1, 1, 1,
-0.2267966, 0.06725504, -1.965948, 1, 1, 1, 1, 1,
-0.2264929, 0.1390438, -1.57731, 1, 1, 1, 1, 1,
-0.2231972, -0.6811353, -2.90155, 1, 1, 1, 1, 1,
-0.2165647, -0.9253886, -2.328275, 1, 1, 1, 1, 1,
-0.2148505, -0.9343703, -1.528059, 1, 1, 1, 1, 1,
-0.2128363, 0.698765, -1.267948, 1, 1, 1, 1, 1,
-0.2116219, 0.9127116, 0.4147311, 1, 1, 1, 1, 1,
-0.2113885, -1.13551, -4.30843, 1, 1, 1, 1, 1,
-0.2090503, -0.4732836, -3.03814, 1, 1, 1, 1, 1,
-0.2084306, -0.9646068, -3.130173, 0, 0, 1, 1, 1,
-0.2049693, 0.003455528, -1.445558, 1, 0, 0, 1, 1,
-0.2042938, -0.6313734, -1.238717, 1, 0, 0, 1, 1,
-0.2039427, 0.8568186, -0.685514, 1, 0, 0, 1, 1,
-0.2017007, 0.1751465, -1.292611, 1, 0, 0, 1, 1,
-0.1913855, 1.866169, -1.856434, 1, 0, 0, 1, 1,
-0.1899592, -0.2011418, -2.291589, 0, 0, 0, 1, 1,
-0.1876637, 0.1907277, -0.894537, 0, 0, 0, 1, 1,
-0.1823059, 1.260786, 0.3942974, 0, 0, 0, 1, 1,
-0.181081, 0.5392011, -0.4463803, 0, 0, 0, 1, 1,
-0.1804997, -1.479728, -2.413047, 0, 0, 0, 1, 1,
-0.1798787, -0.505464, -1.48442, 0, 0, 0, 1, 1,
-0.1748358, 0.9954707, 0.1790284, 0, 0, 0, 1, 1,
-0.1733265, 0.1432508, -1.59435, 1, 1, 1, 1, 1,
-0.1688636, -1.746161, -2.158366, 1, 1, 1, 1, 1,
-0.1658656, 0.1669916, -0.2593588, 1, 1, 1, 1, 1,
-0.1634822, -0.5783849, -2.366322, 1, 1, 1, 1, 1,
-0.1594002, -0.1335383, -1.603212, 1, 1, 1, 1, 1,
-0.1570975, 0.6622437, -0.2145057, 1, 1, 1, 1, 1,
-0.1472977, -1.531799, -1.068712, 1, 1, 1, 1, 1,
-0.1471357, 0.002369011, -0.9115363, 1, 1, 1, 1, 1,
-0.1445205, -1.418267, -2.081755, 1, 1, 1, 1, 1,
-0.1436332, -1.962404, -2.469116, 1, 1, 1, 1, 1,
-0.1384012, -0.7942709, -1.994799, 1, 1, 1, 1, 1,
-0.1362375, 0.4150266, 0.1136053, 1, 1, 1, 1, 1,
-0.1322015, 1.639509, -0.2157257, 1, 1, 1, 1, 1,
-0.1317184, 0.06459357, -0.2777278, 1, 1, 1, 1, 1,
-0.1269864, -0.3035231, -3.907234, 1, 1, 1, 1, 1,
-0.1235723, -0.5506159, -2.06955, 0, 0, 1, 1, 1,
-0.1207286, 0.8872278, -0.5722848, 1, 0, 0, 1, 1,
-0.1183641, -0.1809714, -1.360867, 1, 0, 0, 1, 1,
-0.1182849, 2.965261, -0.2726854, 1, 0, 0, 1, 1,
-0.1175149, 1.012766, -0.8102412, 1, 0, 0, 1, 1,
-0.1142366, -0.4455405, -2.444299, 1, 0, 0, 1, 1,
-0.1116708, -1.095883, -3.101788, 0, 0, 0, 1, 1,
-0.1109186, 0.5793382, -1.126832, 0, 0, 0, 1, 1,
-0.109079, 0.9259314, -0.5301287, 0, 0, 0, 1, 1,
-0.1087528, 0.2285408, -0.4666485, 0, 0, 0, 1, 1,
-0.1072629, -1.78089, -4.040866, 0, 0, 0, 1, 1,
-0.1049417, 2.02531, 0.3197905, 0, 0, 0, 1, 1,
-0.09892341, -1.20968, -2.243031, 0, 0, 0, 1, 1,
-0.09712765, 1.710171, -0.2794846, 1, 1, 1, 1, 1,
-0.09492126, -0.6787047, -1.1568, 1, 1, 1, 1, 1,
-0.094327, 0.2723533, 1.403331, 1, 1, 1, 1, 1,
-0.09289764, -1.685074, -2.630386, 1, 1, 1, 1, 1,
-0.09015727, 0.4022029, -0.3002174, 1, 1, 1, 1, 1,
-0.08916984, 0.6393243, 2.152939, 1, 1, 1, 1, 1,
-0.08760145, 0.5300881, -0.4193057, 1, 1, 1, 1, 1,
-0.08298407, 0.7029971, 0.8112638, 1, 1, 1, 1, 1,
-0.08244419, -0.3112524, -4.486785, 1, 1, 1, 1, 1,
-0.0817237, 0.8301489, 0.2625475, 1, 1, 1, 1, 1,
-0.07697494, -0.3890793, -3.550203, 1, 1, 1, 1, 1,
-0.07529194, -0.7836299, -3.339999, 1, 1, 1, 1, 1,
-0.0747081, -0.06687831, -2.586572, 1, 1, 1, 1, 1,
-0.07179585, -0.9626167, -3.793237, 1, 1, 1, 1, 1,
-0.0712098, -1.095416, -2.332969, 1, 1, 1, 1, 1,
-0.06681786, 0.07100839, 1.185816, 0, 0, 1, 1, 1,
-0.06467924, 1.025023, -0.2694179, 1, 0, 0, 1, 1,
-0.06438298, 0.211381, -1.824762, 1, 0, 0, 1, 1,
-0.06331071, 0.005095189, -1.575824, 1, 0, 0, 1, 1,
-0.06273311, 0.06496368, 1.834535, 1, 0, 0, 1, 1,
-0.06070349, -0.9070867, -2.122639, 1, 0, 0, 1, 1,
-0.06037969, 1.61211, 0.09244056, 0, 0, 0, 1, 1,
-0.05546286, 1.074885, -2.243329, 0, 0, 0, 1, 1,
-0.04719345, 0.7508652, 0.7093769, 0, 0, 0, 1, 1,
-0.04605686, 0.5559693, -0.6317315, 0, 0, 0, 1, 1,
-0.04507042, 1.204453, 1.038924, 0, 0, 0, 1, 1,
-0.03837183, 0.4985478, -0.1800731, 0, 0, 0, 1, 1,
-0.0373734, 0.03842161, 0.7724062, 0, 0, 0, 1, 1,
-0.03649524, -1.286193, -2.313672, 1, 1, 1, 1, 1,
-0.03263552, -1.361638, -3.198777, 1, 1, 1, 1, 1,
-0.03092585, -1.001349, -2.790493, 1, 1, 1, 1, 1,
-0.03012415, 1.278732, -0.4698024, 1, 1, 1, 1, 1,
-0.03012043, 1.050989, 1.512857, 1, 1, 1, 1, 1,
-0.02841811, 0.1769294, 1.63727, 1, 1, 1, 1, 1,
-0.0275429, 0.7200301, -0.952336, 1, 1, 1, 1, 1,
-0.02592371, -0.1137905, -2.036438, 1, 1, 1, 1, 1,
-0.01908285, 0.1674467, -1.135881, 1, 1, 1, 1, 1,
-0.01055392, -0.2552081, -3.156445, 1, 1, 1, 1, 1,
-0.008950175, -0.774516, -4.107553, 1, 1, 1, 1, 1,
-0.006062139, 0.6502945, 0.2110925, 1, 1, 1, 1, 1,
-0.003122084, 0.926714, -0.04580413, 1, 1, 1, 1, 1,
-0.002875419, -0.5973557, -4.393296, 1, 1, 1, 1, 1,
0.001764905, 0.003976347, 0.2834334, 1, 1, 1, 1, 1,
0.005016212, 0.2234847, 1.240399, 0, 0, 1, 1, 1,
0.007056172, 1.688358, -2.126535, 1, 0, 0, 1, 1,
0.01481943, 0.6338795, -0.1307781, 1, 0, 0, 1, 1,
0.01592795, 1.095373, -1.578479, 1, 0, 0, 1, 1,
0.01730524, 0.02136569, 1.528712, 1, 0, 0, 1, 1,
0.01760384, 0.8195562, -0.3467866, 1, 0, 0, 1, 1,
0.02170556, -0.4216534, 4.848742, 0, 0, 0, 1, 1,
0.02200889, -1.078878, 2.924425, 0, 0, 0, 1, 1,
0.02472799, 1.146768, -0.04284947, 0, 0, 0, 1, 1,
0.02731252, -1.843371, 4.042119, 0, 0, 0, 1, 1,
0.02870943, -1.23477, 1.073361, 0, 0, 0, 1, 1,
0.03342222, 0.3625757, 1.870287, 0, 0, 0, 1, 1,
0.03448511, 0.5788788, 1.587495, 0, 0, 0, 1, 1,
0.03636015, -1.955614, 2.096233, 1, 1, 1, 1, 1,
0.03676157, 0.1553552, 0.002072788, 1, 1, 1, 1, 1,
0.03857196, -0.3976396, 3.122361, 1, 1, 1, 1, 1,
0.0401881, 0.1729266, 0.7610231, 1, 1, 1, 1, 1,
0.04434616, -1.801025, 1.03839, 1, 1, 1, 1, 1,
0.04772194, 0.9535279, -1.117884, 1, 1, 1, 1, 1,
0.05368968, 0.1668867, -0.4118336, 1, 1, 1, 1, 1,
0.0575548, -0.3134095, 2.514032, 1, 1, 1, 1, 1,
0.05922272, 0.3603599, -0.3169642, 1, 1, 1, 1, 1,
0.06046551, -0.8989598, 1.811819, 1, 1, 1, 1, 1,
0.06179902, 0.5583426, -0.5817167, 1, 1, 1, 1, 1,
0.0622748, -0.04606454, 3.815362, 1, 1, 1, 1, 1,
0.07184249, -0.7509459, 3.148951, 1, 1, 1, 1, 1,
0.07304438, 0.2515628, -0.459087, 1, 1, 1, 1, 1,
0.07380594, -0.3012438, 2.442378, 1, 1, 1, 1, 1,
0.07599313, 1.025446, -0.463558, 0, 0, 1, 1, 1,
0.08108156, 0.06366348, -0.126418, 1, 0, 0, 1, 1,
0.0845433, -0.06003856, 2.458555, 1, 0, 0, 1, 1,
0.08720839, -0.7760705, 2.103819, 1, 0, 0, 1, 1,
0.09846447, -1.413819, 3.441542, 1, 0, 0, 1, 1,
0.1020141, 1.016432, 0.09094024, 1, 0, 0, 1, 1,
0.103854, -0.006270909, 2.756982, 0, 0, 0, 1, 1,
0.1048997, -0.5304867, 3.418151, 0, 0, 0, 1, 1,
0.1055451, -0.4666549, 3.124385, 0, 0, 0, 1, 1,
0.1077253, 0.1215982, 1.153978, 0, 0, 0, 1, 1,
0.1081744, 0.8340567, 0.4745441, 0, 0, 0, 1, 1,
0.1105202, -1.432094, 3.936648, 0, 0, 0, 1, 1,
0.1123823, -1.358898, 1.63925, 0, 0, 0, 1, 1,
0.1165731, 0.8572174, -0.4553778, 1, 1, 1, 1, 1,
0.1166435, 0.3961592, 1.240218, 1, 1, 1, 1, 1,
0.1259882, 0.1826153, -0.08657724, 1, 1, 1, 1, 1,
0.1260391, 0.6026335, -0.7567011, 1, 1, 1, 1, 1,
0.1274414, -0.6123883, 3.394356, 1, 1, 1, 1, 1,
0.1285936, -0.9601886, 3.096572, 1, 1, 1, 1, 1,
0.1300344, 0.3741055, 0.3799804, 1, 1, 1, 1, 1,
0.1317506, 0.01188353, 1.154228, 1, 1, 1, 1, 1,
0.1321073, -0.3613199, 3.635554, 1, 1, 1, 1, 1,
0.1327249, 0.3355179, 0.06173628, 1, 1, 1, 1, 1,
0.1354517, -1.06228, 3.4049, 1, 1, 1, 1, 1,
0.1366137, 0.9995676, -0.1384009, 1, 1, 1, 1, 1,
0.1366937, 1.672669, 1.618804, 1, 1, 1, 1, 1,
0.1388198, -0.01549979, -0.2113333, 1, 1, 1, 1, 1,
0.1454351, 1.486835, 0.7066188, 1, 1, 1, 1, 1,
0.1540389, 0.8863851, 1.664749, 0, 0, 1, 1, 1,
0.1618217, 0.7318555, 0.8537329, 1, 0, 0, 1, 1,
0.1662709, -0.5487541, 1.914974, 1, 0, 0, 1, 1,
0.1665408, 0.08438352, 1.025212, 1, 0, 0, 1, 1,
0.1683367, -0.56679, 2.58708, 1, 0, 0, 1, 1,
0.1703979, -0.0166123, 0.6249478, 1, 0, 0, 1, 1,
0.1719797, 0.3809373, 0.3299808, 0, 0, 0, 1, 1,
0.1729003, 0.3100535, 1.206109, 0, 0, 0, 1, 1,
0.177013, -0.4075965, 2.323268, 0, 0, 0, 1, 1,
0.1779089, 0.54303, -1.14947, 0, 0, 0, 1, 1,
0.1783788, 0.07593074, 1.972934, 0, 0, 0, 1, 1,
0.180659, 1.378162, -0.05534166, 0, 0, 0, 1, 1,
0.1807941, -0.2881382, 3.281246, 0, 0, 0, 1, 1,
0.1860032, -0.2316084, 3.770172, 1, 1, 1, 1, 1,
0.1881465, -1.443965, 2.244077, 1, 1, 1, 1, 1,
0.1886762, -1.636275, 2.843476, 1, 1, 1, 1, 1,
0.192801, -0.905804, 2.490226, 1, 1, 1, 1, 1,
0.1946904, 0.3515438, 1.031216, 1, 1, 1, 1, 1,
0.1971845, -0.1293785, 1.050349, 1, 1, 1, 1, 1,
0.1979346, 0.1179596, 2.316023, 1, 1, 1, 1, 1,
0.1979703, -0.04317348, 3.208049, 1, 1, 1, 1, 1,
0.1986222, 0.1503671, 2.391914, 1, 1, 1, 1, 1,
0.2020082, 1.447506, 0.4303515, 1, 1, 1, 1, 1,
0.2021577, -0.6171089, 3.128582, 1, 1, 1, 1, 1,
0.2033741, -1.806865, 3.282427, 1, 1, 1, 1, 1,
0.2036597, 0.708407, 0.1551903, 1, 1, 1, 1, 1,
0.2038867, 0.2032574, 1.654962, 1, 1, 1, 1, 1,
0.2075542, -1.159737, 3.343143, 1, 1, 1, 1, 1,
0.2087278, -0.4272964, 3.040807, 0, 0, 1, 1, 1,
0.2119427, 0.07274704, 0.4917076, 1, 0, 0, 1, 1,
0.2128521, -0.4899406, 3.440225, 1, 0, 0, 1, 1,
0.213608, 0.3637606, 0.08021601, 1, 0, 0, 1, 1,
0.2147918, -0.5853115, 2.075751, 1, 0, 0, 1, 1,
0.2185654, -0.4317931, 3.412009, 1, 0, 0, 1, 1,
0.221227, 0.4207925, 1.00931, 0, 0, 0, 1, 1,
0.2263725, 0.02979108, 0.4420825, 0, 0, 0, 1, 1,
0.2311828, -0.6953542, 4.54559, 0, 0, 0, 1, 1,
0.235229, -0.3720381, 1.107719, 0, 0, 0, 1, 1,
0.2357883, 0.4275698, -0.5563433, 0, 0, 0, 1, 1,
0.2391901, -0.2834022, 0.05026302, 0, 0, 0, 1, 1,
0.2450854, -0.7582259, 4.139438, 0, 0, 0, 1, 1,
0.2457692, 1.028559, 0.7147503, 1, 1, 1, 1, 1,
0.2472296, -0.7803046, 2.344465, 1, 1, 1, 1, 1,
0.2495976, 0.8404498, 2.504256, 1, 1, 1, 1, 1,
0.2515604, -1.915526, 4.252897, 1, 1, 1, 1, 1,
0.251976, 0.5116885, -0.2728774, 1, 1, 1, 1, 1,
0.2572488, 0.8962403, 0.8769819, 1, 1, 1, 1, 1,
0.2595868, -0.1442113, 2.730845, 1, 1, 1, 1, 1,
0.268712, 0.3831766, 0.4796915, 1, 1, 1, 1, 1,
0.2698626, 1.028007, -0.5313871, 1, 1, 1, 1, 1,
0.2713553, -0.9145169, 4.261142, 1, 1, 1, 1, 1,
0.2717039, 0.4498101, 0.7858415, 1, 1, 1, 1, 1,
0.2719162, -0.2992851, 0.7461688, 1, 1, 1, 1, 1,
0.272393, -0.8553823, 5.248967, 1, 1, 1, 1, 1,
0.2756916, -0.4903739, 2.802671, 1, 1, 1, 1, 1,
0.2834976, 0.4208709, -1.2234, 1, 1, 1, 1, 1,
0.2837369, -0.03766826, 2.434106, 0, 0, 1, 1, 1,
0.2867728, 1.179791, 1.177162, 1, 0, 0, 1, 1,
0.2883703, -0.4616227, 2.20115, 1, 0, 0, 1, 1,
0.2925059, 0.5708454, 0.03508638, 1, 0, 0, 1, 1,
0.3035344, 0.1910264, 3.539732, 1, 0, 0, 1, 1,
0.3042274, -0.3697688, 3.878022, 1, 0, 0, 1, 1,
0.3057228, 0.7930639, 1.308177, 0, 0, 0, 1, 1,
0.3065886, 0.7976604, 0.6771703, 0, 0, 0, 1, 1,
0.3076334, 0.9806711, -1.342919, 0, 0, 0, 1, 1,
0.3077164, 0.5508311, 0.9774122, 0, 0, 0, 1, 1,
0.3084486, 1.329823, -0.002995699, 0, 0, 0, 1, 1,
0.309655, 0.1897356, -0.2665127, 0, 0, 0, 1, 1,
0.3104058, -0.1723845, 0.871433, 0, 0, 0, 1, 1,
0.3211467, -0.2924837, 2.200391, 1, 1, 1, 1, 1,
0.3230741, -0.3569758, 2.69461, 1, 1, 1, 1, 1,
0.3243214, 0.01409851, 1.461535, 1, 1, 1, 1, 1,
0.3257968, 0.9452053, 0.3469708, 1, 1, 1, 1, 1,
0.327602, 0.4399191, 1.607536, 1, 1, 1, 1, 1,
0.3314095, 1.198485, 0.6400513, 1, 1, 1, 1, 1,
0.3326903, -0.5087236, 3.250587, 1, 1, 1, 1, 1,
0.3345823, -1.175119, 2.768173, 1, 1, 1, 1, 1,
0.3377533, -0.2487788, 1.295564, 1, 1, 1, 1, 1,
0.3449674, -0.05812613, 2.727873, 1, 1, 1, 1, 1,
0.3455076, 0.3753752, 0.7196324, 1, 1, 1, 1, 1,
0.3473303, -0.04281253, -0.2567798, 1, 1, 1, 1, 1,
0.3522219, -1.654397, 2.008757, 1, 1, 1, 1, 1,
0.3543431, -0.3280226, 3.537251, 1, 1, 1, 1, 1,
0.3569874, -0.03592038, 3.122527, 1, 1, 1, 1, 1,
0.3574585, -0.2817971, 1.444054, 0, 0, 1, 1, 1,
0.3625173, 1.838388, 0.2077152, 1, 0, 0, 1, 1,
0.3625447, 0.8394397, 1.081688, 1, 0, 0, 1, 1,
0.362617, 1.153431, -0.234827, 1, 0, 0, 1, 1,
0.3668234, -0.6351846, 1.226601, 1, 0, 0, 1, 1,
0.3675428, 0.4277498, -0.737572, 1, 0, 0, 1, 1,
0.3711958, -2.448169, 3.543186, 0, 0, 0, 1, 1,
0.3730636, 0.9554454, 1.487461, 0, 0, 0, 1, 1,
0.3735799, 0.231229, 1.144639, 0, 0, 0, 1, 1,
0.3736015, -1.990712, 4.246718, 0, 0, 0, 1, 1,
0.3757151, -0.5202021, 1.407857, 0, 0, 0, 1, 1,
0.3815211, 0.8044264, 1.003785, 0, 0, 0, 1, 1,
0.3826349, 0.3044583, 1.690205, 0, 0, 0, 1, 1,
0.3858985, 0.1024219, -0.289107, 1, 1, 1, 1, 1,
0.3892654, -0.3307214, 1.462335, 1, 1, 1, 1, 1,
0.3953396, -0.8281057, 2.580447, 1, 1, 1, 1, 1,
0.4010004, -0.8850825, 2.208043, 1, 1, 1, 1, 1,
0.4012795, -0.5679311, 1.579112, 1, 1, 1, 1, 1,
0.40149, 1.009078, 1.115193, 1, 1, 1, 1, 1,
0.4022467, 0.974124, 0.6602936, 1, 1, 1, 1, 1,
0.4029704, -1.980994, 4.164279, 1, 1, 1, 1, 1,
0.4070244, 1.115997, 1.409365, 1, 1, 1, 1, 1,
0.4165932, 0.7139472, 2.67502, 1, 1, 1, 1, 1,
0.4170228, 0.4537106, -0.7757548, 1, 1, 1, 1, 1,
0.4177598, 0.170105, 0.852487, 1, 1, 1, 1, 1,
0.4183498, 2.392933, 1.309836, 1, 1, 1, 1, 1,
0.4193857, 1.807006, -1.158755, 1, 1, 1, 1, 1,
0.4232005, 1.549015, -0.3943904, 1, 1, 1, 1, 1,
0.4241071, 0.9182546, 0.3412423, 0, 0, 1, 1, 1,
0.4249569, 1.456486, 1.089061, 1, 0, 0, 1, 1,
0.4273152, -0.07697512, 1.682749, 1, 0, 0, 1, 1,
0.430986, -0.0963568, 1.291312, 1, 0, 0, 1, 1,
0.4336904, 0.06077415, 0.5908337, 1, 0, 0, 1, 1,
0.4371541, -0.4034984, 2.091586, 1, 0, 0, 1, 1,
0.4425207, -0.06900132, 1.604874, 0, 0, 0, 1, 1,
0.4442155, -1.067038, 3.828273, 0, 0, 0, 1, 1,
0.4445299, 0.6493186, 1.695411, 0, 0, 0, 1, 1,
0.4445444, 0.2034622, 1.311407, 0, 0, 0, 1, 1,
0.4458274, -1.304996, 1.913303, 0, 0, 0, 1, 1,
0.4470893, 0.6714622, 1.180772, 0, 0, 0, 1, 1,
0.4476008, 1.655784, -0.06879056, 0, 0, 0, 1, 1,
0.4478188, -0.6406747, 2.67079, 1, 1, 1, 1, 1,
0.4480472, -0.08301806, 0.6382182, 1, 1, 1, 1, 1,
0.4649059, 0.6730329, -1.661827, 1, 1, 1, 1, 1,
0.4692902, 0.8253985, -0.9887148, 1, 1, 1, 1, 1,
0.4706462, -1.716497, 1.7162, 1, 1, 1, 1, 1,
0.4707303, -0.2038587, 2.055982, 1, 1, 1, 1, 1,
0.4810566, -2.02179, 4.067806, 1, 1, 1, 1, 1,
0.4816689, -1.839637, 2.763523, 1, 1, 1, 1, 1,
0.4844161, 2.253361, -0.4432069, 1, 1, 1, 1, 1,
0.4862598, 1.15609, -0.6865168, 1, 1, 1, 1, 1,
0.4876201, 0.006812758, 1.939734, 1, 1, 1, 1, 1,
0.4905633, -1.599998, 2.654648, 1, 1, 1, 1, 1,
0.4976003, -2.117243, 2.445722, 1, 1, 1, 1, 1,
0.5035874, 1.611451, 0.9385026, 1, 1, 1, 1, 1,
0.5041216, 2.683948, -1.516549, 1, 1, 1, 1, 1,
0.5088725, 0.9916774, 0.3230616, 0, 0, 1, 1, 1,
0.5101472, 0.6331922, 0.4227734, 1, 0, 0, 1, 1,
0.5112233, -0.2212816, 1.517895, 1, 0, 0, 1, 1,
0.5130045, -0.9799419, 1.224981, 1, 0, 0, 1, 1,
0.5145444, 0.1087784, 0.4476897, 1, 0, 0, 1, 1,
0.5156412, 0.126146, 1.067836, 1, 0, 0, 1, 1,
0.5168152, -0.1831597, 0.8446504, 0, 0, 0, 1, 1,
0.5218773, 0.8568107, 0.1092604, 0, 0, 0, 1, 1,
0.5221061, -0.4348144, 0.7881418, 0, 0, 0, 1, 1,
0.5236155, -1.723138, 0.8206459, 0, 0, 0, 1, 1,
0.5242614, -0.1973413, 0.93516, 0, 0, 0, 1, 1,
0.5242958, -1.061735, 1.378283, 0, 0, 0, 1, 1,
0.5257364, -0.6810233, 2.891156, 0, 0, 0, 1, 1,
0.5257524, -0.8122295, 0.3702796, 1, 1, 1, 1, 1,
0.5267726, -0.9068603, 2.399904, 1, 1, 1, 1, 1,
0.531946, 0.4266829, -0.2292654, 1, 1, 1, 1, 1,
0.5353184, 0.9217216, 0.1942972, 1, 1, 1, 1, 1,
0.5421923, -0.8490024, 3.27546, 1, 1, 1, 1, 1,
0.5422382, -1.4446, 4.072565, 1, 1, 1, 1, 1,
0.5473191, -1.02232, 2.418672, 1, 1, 1, 1, 1,
0.5507169, 1.258901, -2.360557, 1, 1, 1, 1, 1,
0.5532027, -0.113443, 1.460983, 1, 1, 1, 1, 1,
0.5556125, -1.708674, 2.637944, 1, 1, 1, 1, 1,
0.5581416, -0.8435471, 3.336328, 1, 1, 1, 1, 1,
0.5613614, -0.2610227, 1.780198, 1, 1, 1, 1, 1,
0.562113, -0.5121346, 1.081228, 1, 1, 1, 1, 1,
0.5625913, -1.551153, 2.708023, 1, 1, 1, 1, 1,
0.5687517, -1.044451, 2.686542, 1, 1, 1, 1, 1,
0.5708817, -1.686603, 4.065955, 0, 0, 1, 1, 1,
0.5782331, 0.1584941, 1.75418, 1, 0, 0, 1, 1,
0.57826, 0.2127793, 0.6159698, 1, 0, 0, 1, 1,
0.5804147, 0.8282868, 0.248587, 1, 0, 0, 1, 1,
0.5847839, -2.866886, 4.570826, 1, 0, 0, 1, 1,
0.5850221, -0.7856894, 2.51908, 1, 0, 0, 1, 1,
0.5885237, -0.700237, 2.264526, 0, 0, 0, 1, 1,
0.5948353, -0.2727562, 1.76458, 0, 0, 0, 1, 1,
0.6003738, -1.378467, 3.024112, 0, 0, 0, 1, 1,
0.6034131, 1.870292, -1.734334, 0, 0, 0, 1, 1,
0.6083404, 1.10077, -0.710944, 0, 0, 0, 1, 1,
0.6083872, 0.01053644, 2.68031, 0, 0, 0, 1, 1,
0.6135176, 1.552821, 0.4410511, 0, 0, 0, 1, 1,
0.6227654, 1.051726, 0.000895231, 1, 1, 1, 1, 1,
0.6279117, -0.7855658, 2.990599, 1, 1, 1, 1, 1,
0.6364235, 0.1338573, 1.292459, 1, 1, 1, 1, 1,
0.6377001, 0.2740859, 1.643, 1, 1, 1, 1, 1,
0.638154, -0.4130462, 2.404482, 1, 1, 1, 1, 1,
0.6384584, -2.862093, 1.128906, 1, 1, 1, 1, 1,
0.643379, 0.2928184, 2.348053, 1, 1, 1, 1, 1,
0.6433848, 0.4400261, 0.9356149, 1, 1, 1, 1, 1,
0.6444163, -0.9429207, 2.144167, 1, 1, 1, 1, 1,
0.6459489, -0.2734811, 2.507388, 1, 1, 1, 1, 1,
0.6482368, -0.006649196, 2.985078, 1, 1, 1, 1, 1,
0.6491364, -1.485246, 2.21089, 1, 1, 1, 1, 1,
0.6513687, -1.057928, 2.423578, 1, 1, 1, 1, 1,
0.6514563, -0.09713146, 2.045694, 1, 1, 1, 1, 1,
0.6538534, 0.9224758, 0.682624, 1, 1, 1, 1, 1,
0.6568177, -0.3335524, 2.230017, 0, 0, 1, 1, 1,
0.6599867, -0.2218025, 0.23517, 1, 0, 0, 1, 1,
0.6617387, 0.6883005, 0.3446578, 1, 0, 0, 1, 1,
0.6621194, -1.418846, 3.065273, 1, 0, 0, 1, 1,
0.6629823, -1.245254, 3.514627, 1, 0, 0, 1, 1,
0.6659608, 0.4950271, 2.51347, 1, 0, 0, 1, 1,
0.6672735, 0.4174224, 3.398002, 0, 0, 0, 1, 1,
0.669716, -1.683218, 0.9660554, 0, 0, 0, 1, 1,
0.6710107, -0.3412508, 2.547189, 0, 0, 0, 1, 1,
0.673129, 0.4969232, -0.08949129, 0, 0, 0, 1, 1,
0.6737985, -2.328527, 3.039114, 0, 0, 0, 1, 1,
0.6743126, 1.599478, -0.4413596, 0, 0, 0, 1, 1,
0.674675, 2.074468, 0.2192619, 0, 0, 0, 1, 1,
0.6756759, 1.357764, -0.7266878, 1, 1, 1, 1, 1,
0.6787468, -0.6704559, 2.829095, 1, 1, 1, 1, 1,
0.679604, 0.3465543, 1.139135, 1, 1, 1, 1, 1,
0.684041, -0.1267713, -0.4779064, 1, 1, 1, 1, 1,
0.6872749, 1.343024, -0.241081, 1, 1, 1, 1, 1,
0.6960645, 1.143205, 0.3477911, 1, 1, 1, 1, 1,
0.698944, -0.4724983, 1.141151, 1, 1, 1, 1, 1,
0.7044823, 0.4493445, 2.011005, 1, 1, 1, 1, 1,
0.706145, 0.9961014, -0.566446, 1, 1, 1, 1, 1,
0.714243, -1.38811, 4.964377, 1, 1, 1, 1, 1,
0.7160163, -0.3712977, 1.707423, 1, 1, 1, 1, 1,
0.716094, -0.08541998, 1.699621, 1, 1, 1, 1, 1,
0.7162505, 0.7607354, 0.8865201, 1, 1, 1, 1, 1,
0.7219944, -0.08331718, 0.9740331, 1, 1, 1, 1, 1,
0.7221726, 0.4489938, 0.4523215, 1, 1, 1, 1, 1,
0.7226423, -0.7238736, 1.641201, 0, 0, 1, 1, 1,
0.7290606, -0.6578724, 2.089113, 1, 0, 0, 1, 1,
0.7322329, 1.14979, 0.4029109, 1, 0, 0, 1, 1,
0.7335559, 1.541188, -0.7199957, 1, 0, 0, 1, 1,
0.7364895, -0.5598965, 4.531996, 1, 0, 0, 1, 1,
0.7371461, 0.2461545, 3.106413, 1, 0, 0, 1, 1,
0.7379793, 0.5731804, -1.257915, 0, 0, 0, 1, 1,
0.7399586, -1.296721, 4.348453, 0, 0, 0, 1, 1,
0.7422817, 0.1787245, 2.56408, 0, 0, 0, 1, 1,
0.7430569, -1.644097, 2.041602, 0, 0, 0, 1, 1,
0.7432786, 0.7712615, 2.106839, 0, 0, 0, 1, 1,
0.7483087, 2.569761, 0.4019403, 0, 0, 0, 1, 1,
0.7491045, -0.08749177, 0.9096301, 0, 0, 0, 1, 1,
0.7497818, -1.06795, 2.465773, 1, 1, 1, 1, 1,
0.7503659, -0.1040936, 0.01160622, 1, 1, 1, 1, 1,
0.7538281, 2.142277, 1.786671, 1, 1, 1, 1, 1,
0.7542996, 1.55006, 0.5004717, 1, 1, 1, 1, 1,
0.7562876, -0.3798786, 1.665947, 1, 1, 1, 1, 1,
0.7668931, -0.8929536, 2.409979, 1, 1, 1, 1, 1,
0.7688541, -0.6157812, 0.8165793, 1, 1, 1, 1, 1,
0.7709035, 1.300667, 0.3836712, 1, 1, 1, 1, 1,
0.7716663, -0.42431, 2.022916, 1, 1, 1, 1, 1,
0.7788226, 0.8847049, 1.034387, 1, 1, 1, 1, 1,
0.7801294, -2.025176, 2.077926, 1, 1, 1, 1, 1,
0.782541, 2.213687, 0.9009423, 1, 1, 1, 1, 1,
0.7866088, 1.374923, -0.4901548, 1, 1, 1, 1, 1,
0.7960187, -1.934193, 3.299861, 1, 1, 1, 1, 1,
0.7994313, 0.2331639, 0.9419004, 1, 1, 1, 1, 1,
0.8052189, -1.389796, 4.969731, 0, 0, 1, 1, 1,
0.8068213, 0.07307798, 2.662735, 1, 0, 0, 1, 1,
0.8126736, -0.9200307, 2.737873, 1, 0, 0, 1, 1,
0.8203644, -0.6003401, 1.532213, 1, 0, 0, 1, 1,
0.8213733, -0.981795, 1.114944, 1, 0, 0, 1, 1,
0.8249668, 0.4018142, 2.216733, 1, 0, 0, 1, 1,
0.8276636, -0.9405437, 2.681696, 0, 0, 0, 1, 1,
0.8287356, 0.4387865, 0.910543, 0, 0, 0, 1, 1,
0.8350864, 1.044523, 0.06627271, 0, 0, 0, 1, 1,
0.839864, 1.122737, 0.4398265, 0, 0, 0, 1, 1,
0.8421286, -0.06492354, 3.071706, 0, 0, 0, 1, 1,
0.842586, 0.3231875, 0.8538745, 0, 0, 0, 1, 1,
0.8449242, 0.328264, 2.308854, 0, 0, 0, 1, 1,
0.8524274, 1.289582, 1.615523, 1, 1, 1, 1, 1,
0.8604575, -0.06394501, 0.6725388, 1, 1, 1, 1, 1,
0.8640199, -0.01586754, 1.790466, 1, 1, 1, 1, 1,
0.8668218, -1.582407, 2.643249, 1, 1, 1, 1, 1,
0.8689484, 0.4993024, -0.003160965, 1, 1, 1, 1, 1,
0.8751646, -0.1254391, 0.4647291, 1, 1, 1, 1, 1,
0.8757267, -0.9172841, 3.792492, 1, 1, 1, 1, 1,
0.881966, -0.2787212, 2.094436, 1, 1, 1, 1, 1,
0.8850572, 0.5981208, 1.494985, 1, 1, 1, 1, 1,
0.8858801, -0.3221593, 1.441224, 1, 1, 1, 1, 1,
0.8860856, -0.3472826, 2.101642, 1, 1, 1, 1, 1,
0.8870073, -1.384459, 2.599506, 1, 1, 1, 1, 1,
0.8918561, -2.372503, 5.48393, 1, 1, 1, 1, 1,
0.8947349, 0.1146455, 3.081167, 1, 1, 1, 1, 1,
0.8959079, 0.2068427, 2.453896, 1, 1, 1, 1, 1,
0.8969333, 0.0185381, 0.7254405, 0, 0, 1, 1, 1,
0.8993693, -1.089983, 2.250522, 1, 0, 0, 1, 1,
0.8998797, 0.1627267, -1.343748, 1, 0, 0, 1, 1,
0.9061478, -0.6718181, 2.533302, 1, 0, 0, 1, 1,
0.9119954, -1.117059, 2.834972, 1, 0, 0, 1, 1,
0.9131548, 0.1192063, 2.202026, 1, 0, 0, 1, 1,
0.9221345, -0.179998, 0.9495475, 0, 0, 0, 1, 1,
0.9347852, -2.420279, 3.944023, 0, 0, 0, 1, 1,
0.9372494, 1.195209, 0.3445864, 0, 0, 0, 1, 1,
0.9412876, 0.6183988, 0.7710359, 0, 0, 0, 1, 1,
0.9415854, 0.07241494, 1.584322, 0, 0, 0, 1, 1,
0.9445029, 0.03156042, 1.715154, 0, 0, 0, 1, 1,
0.945694, -1.498632, 2.527483, 0, 0, 0, 1, 1,
0.9532407, -1.279308, 2.06971, 1, 1, 1, 1, 1,
0.9580514, 1.971948, 1.361113, 1, 1, 1, 1, 1,
0.9589261, -0.5714718, 1.598808, 1, 1, 1, 1, 1,
0.9598729, -0.5484876, 3.263846, 1, 1, 1, 1, 1,
0.9644631, -2.007115, 3.257084, 1, 1, 1, 1, 1,
0.9648867, 0.2033351, 1.537852, 1, 1, 1, 1, 1,
0.9675181, -0.9841416, 3.076272, 1, 1, 1, 1, 1,
0.9700829, -1.023536, 1.715026, 1, 1, 1, 1, 1,
0.9751047, 0.4206612, 1.18296, 1, 1, 1, 1, 1,
0.9763977, 1.691402, 1.064349, 1, 1, 1, 1, 1,
0.9790717, 0.1579309, 1.29616, 1, 1, 1, 1, 1,
0.9804099, -0.1366403, -0.7351718, 1, 1, 1, 1, 1,
0.9833955, -1.465945, 2.836868, 1, 1, 1, 1, 1,
0.9839873, 0.6166137, 1.520964, 1, 1, 1, 1, 1,
0.9855636, -0.0991146, 1.890451, 1, 1, 1, 1, 1,
0.9858108, -0.07128888, 0.5458848, 0, 0, 1, 1, 1,
0.9859042, 0.07476115, 0.3122871, 1, 0, 0, 1, 1,
0.9885714, 0.6283973, 2.177547, 1, 0, 0, 1, 1,
0.9946221, -0.8543225, 2.75771, 1, 0, 0, 1, 1,
0.9968078, -3.113732, 3.207812, 1, 0, 0, 1, 1,
0.9985244, -0.515115, 2.10321, 1, 0, 0, 1, 1,
1.002689, -1.16543, 1.807795, 0, 0, 0, 1, 1,
1.003077, 0.7757019, 1.050013, 0, 0, 0, 1, 1,
1.005994, -0.8943518, 2.594171, 0, 0, 0, 1, 1,
1.00621, -1.557446, 1.68386, 0, 0, 0, 1, 1,
1.009923, -0.2983436, 0.6970175, 0, 0, 0, 1, 1,
1.013905, 0.7831489, 0.6874471, 0, 0, 0, 1, 1,
1.017365, -1.77351, 1.939865, 0, 0, 0, 1, 1,
1.023312, 1.969519, 1.999449, 1, 1, 1, 1, 1,
1.024028, -2.32988, 2.449108, 1, 1, 1, 1, 1,
1.024447, -1.161607, 1.969139, 1, 1, 1, 1, 1,
1.044091, 0.07859981, 0.6482476, 1, 1, 1, 1, 1,
1.052004, 0.1739327, 2.513355, 1, 1, 1, 1, 1,
1.052693, -1.168409, 2.833328, 1, 1, 1, 1, 1,
1.058072, 0.997381, -0.9772671, 1, 1, 1, 1, 1,
1.060876, -1.234921, 1.198045, 1, 1, 1, 1, 1,
1.065095, 1.805536, 1.022905, 1, 1, 1, 1, 1,
1.073442, -0.4620659, 2.605329, 1, 1, 1, 1, 1,
1.076542, -0.2274245, 1.587096, 1, 1, 1, 1, 1,
1.089116, 0.3934264, 0.4394434, 1, 1, 1, 1, 1,
1.092308, -1.067568, 2.961906, 1, 1, 1, 1, 1,
1.092657, -0.3596196, 1.441133, 1, 1, 1, 1, 1,
1.092874, -2.239565, 2.821686, 1, 1, 1, 1, 1,
1.09377, 0.2783645, 1.885717, 0, 0, 1, 1, 1,
1.106326, 0.5645333, 2.558734, 1, 0, 0, 1, 1,
1.111918, -0.310868, 2.555853, 1, 0, 0, 1, 1,
1.118109, -0.1477772, 2.056873, 1, 0, 0, 1, 1,
1.144978, -0.9591501, 0.9803582, 1, 0, 0, 1, 1,
1.145719, -0.1257935, -0.1755782, 1, 0, 0, 1, 1,
1.14685, -0.02318459, 0.7693961, 0, 0, 0, 1, 1,
1.148095, 0.5898119, 1.140387, 0, 0, 0, 1, 1,
1.148269, 1.357438, 2.531642, 0, 0, 0, 1, 1,
1.15146, 0.7197534, 1.475632, 0, 0, 0, 1, 1,
1.152663, -0.7226189, 1.072172, 0, 0, 0, 1, 1,
1.154168, -1.247805, 2.108553, 0, 0, 0, 1, 1,
1.158486, -1.650319, 3.77748, 0, 0, 0, 1, 1,
1.169479, -0.8731177, 2.36272, 1, 1, 1, 1, 1,
1.184106, -0.5799801, 3.092731, 1, 1, 1, 1, 1,
1.184824, 0.03894769, 2.144096, 1, 1, 1, 1, 1,
1.188829, -0.5995365, 2.456265, 1, 1, 1, 1, 1,
1.193337, 0.5659208, -1.177513, 1, 1, 1, 1, 1,
1.195228, 0.9193355, 1.407539, 1, 1, 1, 1, 1,
1.209114, 0.9479442, -1.321914, 1, 1, 1, 1, 1,
1.214569, 1.073018, 1.034429, 1, 1, 1, 1, 1,
1.223761, -1.702661, 1.508424, 1, 1, 1, 1, 1,
1.227146, -0.1551228, 1.270216, 1, 1, 1, 1, 1,
1.227859, -0.496466, 1.165647, 1, 1, 1, 1, 1,
1.236214, 0.6971838, 2.019996, 1, 1, 1, 1, 1,
1.241248, 0.4395398, 2.678934, 1, 1, 1, 1, 1,
1.241558, 0.4942148, 3.710955, 1, 1, 1, 1, 1,
1.241957, 0.8497285, 0.1464684, 1, 1, 1, 1, 1,
1.242111, -1.219517, 4.056064, 0, 0, 1, 1, 1,
1.249848, -0.02009747, 2.157818, 1, 0, 0, 1, 1,
1.258333, 0.6428559, -0.823077, 1, 0, 0, 1, 1,
1.259739, 0.3790734, -0.4207447, 1, 0, 0, 1, 1,
1.272801, 1.047288, 0.87454, 1, 0, 0, 1, 1,
1.275028, 0.7976061, 1.388516, 1, 0, 0, 1, 1,
1.295027, 1.9935, -0.3723783, 0, 0, 0, 1, 1,
1.296424, 0.8493317, -0.08793438, 0, 0, 0, 1, 1,
1.300198, 0.6715606, -1.217309, 0, 0, 0, 1, 1,
1.304373, 0.6133237, 1.785367, 0, 0, 0, 1, 1,
1.314854, 0.2782897, -0.2368734, 0, 0, 0, 1, 1,
1.318911, 1.240057, 2.121263, 0, 0, 0, 1, 1,
1.331597, 0.8863723, 0.5957916, 0, 0, 0, 1, 1,
1.333422, 0.4916928, 0.8891284, 1, 1, 1, 1, 1,
1.335746, -0.2759655, 1.394132, 1, 1, 1, 1, 1,
1.340859, 0.1477075, 3.252113, 1, 1, 1, 1, 1,
1.346495, -0.1598189, 0.8963602, 1, 1, 1, 1, 1,
1.346738, -0.2865956, 1.464074, 1, 1, 1, 1, 1,
1.354779, 0.8400307, 0.4920346, 1, 1, 1, 1, 1,
1.3564, -0.5454611, 2.257011, 1, 1, 1, 1, 1,
1.360851, -0.03450744, 1.478983, 1, 1, 1, 1, 1,
1.361498, -1.559385, 1.920285, 1, 1, 1, 1, 1,
1.366028, -1.025615, 1.144773, 1, 1, 1, 1, 1,
1.368112, 1.685845, 1.127763, 1, 1, 1, 1, 1,
1.38138, 0.06119537, 1.744636, 1, 1, 1, 1, 1,
1.38289, -1.991895, 1.164575, 1, 1, 1, 1, 1,
1.383221, 0.6244229, 1.896473, 1, 1, 1, 1, 1,
1.384235, -0.1655202, 0.9281445, 1, 1, 1, 1, 1,
1.3848, -1.105416, 1.930684, 0, 0, 1, 1, 1,
1.405392, -0.2145994, 1.014549, 1, 0, 0, 1, 1,
1.431326, 0.7274508, 3.272691, 1, 0, 0, 1, 1,
1.43152, 1.384393, -1.483634, 1, 0, 0, 1, 1,
1.433457, 1.768308, -0.3358369, 1, 0, 0, 1, 1,
1.43383, -1.463939, 3.496102, 1, 0, 0, 1, 1,
1.443447, -1.635871, 0.08028713, 0, 0, 0, 1, 1,
1.449926, -0.05423494, 2.167097, 0, 0, 0, 1, 1,
1.455375, 0.02732009, 1.721003, 0, 0, 0, 1, 1,
1.474123, 0.4805886, 0.63589, 0, 0, 0, 1, 1,
1.47558, -0.385747, 3.601697, 0, 0, 0, 1, 1,
1.488917, -0.8552665, 2.144754, 0, 0, 0, 1, 1,
1.506855, -0.4857018, 0.8251598, 0, 0, 0, 1, 1,
1.526385, 1.478638, -0.3247925, 1, 1, 1, 1, 1,
1.528826, -0.4523003, 1.725497, 1, 1, 1, 1, 1,
1.530436, -1.05466, -0.2103226, 1, 1, 1, 1, 1,
1.541026, 0.3292867, 1.21015, 1, 1, 1, 1, 1,
1.556227, -0.9630798, 1.486884, 1, 1, 1, 1, 1,
1.560934, -2.163124, 3.093611, 1, 1, 1, 1, 1,
1.561525, 1.53442, 1.871658, 1, 1, 1, 1, 1,
1.563293, 0.895116, -0.3403547, 1, 1, 1, 1, 1,
1.599242, 0.4871836, 0.3619386, 1, 1, 1, 1, 1,
1.601189, -1.139269, 3.047538, 1, 1, 1, 1, 1,
1.60676, 0.7392991, 1.279579, 1, 1, 1, 1, 1,
1.616132, -1.381044, 1.241667, 1, 1, 1, 1, 1,
1.622832, 0.8004304, 1.225477, 1, 1, 1, 1, 1,
1.633905, -1.046513, 5.963077, 1, 1, 1, 1, 1,
1.652423, -0.05377964, 2.958217, 1, 1, 1, 1, 1,
1.656148, 0.3789904, 1.6955, 0, 0, 1, 1, 1,
1.668495, 0.3180842, 1.912239, 1, 0, 0, 1, 1,
1.689044, -1.779076, 3.054159, 1, 0, 0, 1, 1,
1.694462, 0.5271546, 1.693623, 1, 0, 0, 1, 1,
1.699861, 0.8081124, 0.95048, 1, 0, 0, 1, 1,
1.709231, 0.8824737, 2.906959, 1, 0, 0, 1, 1,
1.722865, 1.729008, -0.2059309, 0, 0, 0, 1, 1,
1.726633, -0.2167659, 2.21865, 0, 0, 0, 1, 1,
1.731561, -0.1819654, 1.443234, 0, 0, 0, 1, 1,
1.740304, -2.160726, 2.185109, 0, 0, 0, 1, 1,
1.743901, -0.1222267, 2.063501, 0, 0, 0, 1, 1,
1.752191, -0.6315879, 2.684931, 0, 0, 0, 1, 1,
1.757445, -0.584396, 2.102823, 0, 0, 0, 1, 1,
1.758061, -0.1189576, -0.6844784, 1, 1, 1, 1, 1,
1.790656, 1.004538, 0.925054, 1, 1, 1, 1, 1,
1.790891, 0.2003421, 1.91961, 1, 1, 1, 1, 1,
1.811141, -1.428505, 0.9146787, 1, 1, 1, 1, 1,
1.840509, 0.8433244, 1.698884, 1, 1, 1, 1, 1,
1.865649, 0.7267901, 2.148232, 1, 1, 1, 1, 1,
1.866899, 0.791447, 0.8007704, 1, 1, 1, 1, 1,
1.934796, -1.660737, 2.446971, 1, 1, 1, 1, 1,
1.937395, 0.516967, 1.447453, 1, 1, 1, 1, 1,
1.943675, -0.17696, 1.662403, 1, 1, 1, 1, 1,
1.952817, 0.523532, 1.415725, 1, 1, 1, 1, 1,
1.98597, 0.5046282, 1.477471, 1, 1, 1, 1, 1,
1.991462, -0.3111073, 0.3282869, 1, 1, 1, 1, 1,
2.00452, 1.174874, 1.147062, 1, 1, 1, 1, 1,
2.006418, 0.5069911, 2.401292, 1, 1, 1, 1, 1,
2.008919, -0.4271312, 1.134429, 0, 0, 1, 1, 1,
2.015146, 0.3238426, 0.8627964, 1, 0, 0, 1, 1,
2.028132, -0.5905089, 2.236462, 1, 0, 0, 1, 1,
2.037597, 0.3054701, 0.8487159, 1, 0, 0, 1, 1,
2.130989, 0.3535363, 0.670886, 1, 0, 0, 1, 1,
2.151825, -0.3393407, 0.2446496, 1, 0, 0, 1, 1,
2.168545, -1.833001, 3.587303, 0, 0, 0, 1, 1,
2.183059, -0.7095309, 1.573872, 0, 0, 0, 1, 1,
2.208037, -1.47593, 0.7463838, 0, 0, 0, 1, 1,
2.215825, -0.09301966, 1.111619, 0, 0, 0, 1, 1,
2.240051, 0.0547062, 3.114477, 0, 0, 0, 1, 1,
2.299888, -0.4403464, 1.726237, 0, 0, 0, 1, 1,
2.310571, 0.216867, 3.125544, 0, 0, 0, 1, 1,
2.435672, -0.1332351, 1.896763, 1, 1, 1, 1, 1,
2.53341, 0.9226484, 2.280642, 1, 1, 1, 1, 1,
2.608759, 1.635717, 1.939142, 1, 1, 1, 1, 1,
2.6307, -0.3479451, 2.732073, 1, 1, 1, 1, 1,
2.674581, 1.258022, 1.431787, 1, 1, 1, 1, 1,
2.861748, 0.9298694, 2.009852, 1, 1, 1, 1, 1,
3.189798, 0.7071077, 1.040495, 1, 1, 1, 1, 1
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
var radius = 9.823673;
var distance = 34.50523;
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
mvMatrix.translate( 0.0554502, 0.07423556, -0.2239254 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.50523);
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
