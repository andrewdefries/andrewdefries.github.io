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
var width = 257;  var height = 257;
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
-3.146844, 0.8333161, -0.8046989, 1, 0, 0, 1,
-2.930119, 0.2870251, 0.4411331, 1, 0.007843138, 0, 1,
-2.61696, -0.0006329797, -2.600965, 1, 0.01176471, 0, 1,
-2.576289, 1.145694, -1.52471, 1, 0.01960784, 0, 1,
-2.554228, -1.441221, -1.33437, 1, 0.02352941, 0, 1,
-2.496878, 0.4558517, -0.7205124, 1, 0.03137255, 0, 1,
-2.401834, 1.22556, 0.1135826, 1, 0.03529412, 0, 1,
-2.362906, -0.3108252, -1.295369, 1, 0.04313726, 0, 1,
-2.333698, -0.2864471, -0.5573533, 1, 0.04705882, 0, 1,
-2.254425, -0.003665643, -4.047564, 1, 0.05490196, 0, 1,
-2.20553, -0.5915779, -0.968859, 1, 0.05882353, 0, 1,
-2.188987, -0.9245448, -2.020694, 1, 0.06666667, 0, 1,
-2.172999, 0.5944319, -1.496054, 1, 0.07058824, 0, 1,
-2.163283, -1.966364, -0.2431006, 1, 0.07843138, 0, 1,
-2.158354, -0.9975531, -1.424693, 1, 0.08235294, 0, 1,
-2.083231, 0.6181011, -2.083148, 1, 0.09019608, 0, 1,
-2.006629, -1.156575, -0.9456819, 1, 0.09411765, 0, 1,
-2.003673, 0.9526606, -2.466694, 1, 0.1019608, 0, 1,
-1.998923, 0.2927175, -2.435364, 1, 0.1098039, 0, 1,
-1.976725, 0.8295391, -3.225162, 1, 0.1137255, 0, 1,
-1.968803, -1.417109, -2.338318, 1, 0.1215686, 0, 1,
-1.914248, -1.062986, -1.020938, 1, 0.1254902, 0, 1,
-1.912137, -0.5663992, -1.441761, 1, 0.1333333, 0, 1,
-1.912102, -0.5318089, 0.6890609, 1, 0.1372549, 0, 1,
-1.901593, -0.9406826, -1.666009, 1, 0.145098, 0, 1,
-1.874321, -0.3037494, -1.298166, 1, 0.1490196, 0, 1,
-1.871655, 0.4228387, -0.5149806, 1, 0.1568628, 0, 1,
-1.870737, -0.08246449, -2.161014, 1, 0.1607843, 0, 1,
-1.852058, 0.1682457, -1.738371, 1, 0.1686275, 0, 1,
-1.851496, -1.670978, -2.76154, 1, 0.172549, 0, 1,
-1.836649, 0.7647846, -0.9355329, 1, 0.1803922, 0, 1,
-1.806408, 0.5857713, -1.680052, 1, 0.1843137, 0, 1,
-1.802485, -0.7916039, -3.313892, 1, 0.1921569, 0, 1,
-1.794787, 0.82915, -1.400443, 1, 0.1960784, 0, 1,
-1.783681, 0.2424133, -2.812236, 1, 0.2039216, 0, 1,
-1.76155, -1.412401, -1.521089, 1, 0.2117647, 0, 1,
-1.734853, -1.194074, -1.316487, 1, 0.2156863, 0, 1,
-1.732303, -0.03133469, 0.1676052, 1, 0.2235294, 0, 1,
-1.720929, -0.0437076, -1.187542, 1, 0.227451, 0, 1,
-1.72047, 0.04207451, -1.831565, 1, 0.2352941, 0, 1,
-1.698891, 0.4084943, -1.555305, 1, 0.2392157, 0, 1,
-1.691787, 0.922136, 0.1265012, 1, 0.2470588, 0, 1,
-1.684204, 2.621633, 0.3664037, 1, 0.2509804, 0, 1,
-1.683541, -0.6995332, 0.2073196, 1, 0.2588235, 0, 1,
-1.679373, -0.557519, -0.6790351, 1, 0.2627451, 0, 1,
-1.657494, 0.3861313, -1.816836, 1, 0.2705882, 0, 1,
-1.63309, 0.8703982, -0.2030085, 1, 0.2745098, 0, 1,
-1.625883, 0.4901047, 0.4551618, 1, 0.282353, 0, 1,
-1.624899, 0.646504, -2.647105, 1, 0.2862745, 0, 1,
-1.61611, -0.3680443, -3.284065, 1, 0.2941177, 0, 1,
-1.615009, 0.5936791, -1.077793, 1, 0.3019608, 0, 1,
-1.614941, 0.1138746, -1.563832, 1, 0.3058824, 0, 1,
-1.595929, 2.235308, -0.1510809, 1, 0.3137255, 0, 1,
-1.58609, -0.4065517, -2.120203, 1, 0.3176471, 0, 1,
-1.572796, -0.3368937, -0.2746899, 1, 0.3254902, 0, 1,
-1.539445, -1.379579, -4.867348, 1, 0.3294118, 0, 1,
-1.523427, -0.9966987, -1.594794, 1, 0.3372549, 0, 1,
-1.516984, 0.2450564, -1.384769, 1, 0.3411765, 0, 1,
-1.516878, -0.3458907, -0.832864, 1, 0.3490196, 0, 1,
-1.504142, 0.4338734, -0.86054, 1, 0.3529412, 0, 1,
-1.493896, -0.458236, -1.138231, 1, 0.3607843, 0, 1,
-1.493658, 0.5368394, -2.451952, 1, 0.3647059, 0, 1,
-1.488199, 0.00492789, -3.238106, 1, 0.372549, 0, 1,
-1.485474, 1.533349, -0.2890526, 1, 0.3764706, 0, 1,
-1.474481, -0.492871, -1.989215, 1, 0.3843137, 0, 1,
-1.471581, 0.4995771, -2.119764, 1, 0.3882353, 0, 1,
-1.471025, 0.1074964, -0.7838407, 1, 0.3960784, 0, 1,
-1.468145, -0.02385112, -0.4806176, 1, 0.4039216, 0, 1,
-1.463315, 1.789199, -0.6683155, 1, 0.4078431, 0, 1,
-1.454021, 0.2707362, 0.04120839, 1, 0.4156863, 0, 1,
-1.452719, 1.473601, -1.633576, 1, 0.4196078, 0, 1,
-1.446358, -1.138858, -2.161154, 1, 0.427451, 0, 1,
-1.435517, -0.2028741, -1.184874, 1, 0.4313726, 0, 1,
-1.433993, 0.3712169, -0.4641138, 1, 0.4392157, 0, 1,
-1.432709, -0.6555204, -2.196293, 1, 0.4431373, 0, 1,
-1.432436, 0.6128353, -2.395149, 1, 0.4509804, 0, 1,
-1.427823, 0.9620838, 0.04517437, 1, 0.454902, 0, 1,
-1.415364, -0.3727251, -1.532612, 1, 0.4627451, 0, 1,
-1.412157, -0.7657422, -2.778364, 1, 0.4666667, 0, 1,
-1.411779, 0.1935309, -0.1359881, 1, 0.4745098, 0, 1,
-1.409156, 0.06492884, -1.591791, 1, 0.4784314, 0, 1,
-1.405121, 1.346403, -0.3793718, 1, 0.4862745, 0, 1,
-1.401258, 0.01312341, -0.5121953, 1, 0.4901961, 0, 1,
-1.394815, 0.1738281, -1.608791, 1, 0.4980392, 0, 1,
-1.393099, 0.9880138, -3.733747, 1, 0.5058824, 0, 1,
-1.384931, 0.9189106, -0.4219965, 1, 0.509804, 0, 1,
-1.383904, 0.5938528, -1.313021, 1, 0.5176471, 0, 1,
-1.376387, -0.8138523, -1.738479, 1, 0.5215687, 0, 1,
-1.368108, 0.9125128, -2.459792, 1, 0.5294118, 0, 1,
-1.363111, 0.3586282, -2.028178, 1, 0.5333334, 0, 1,
-1.35537, -0.1334552, -1.743654, 1, 0.5411765, 0, 1,
-1.344167, 0.2420062, -1.465976, 1, 0.5450981, 0, 1,
-1.34074, 0.6429855, -1.451021, 1, 0.5529412, 0, 1,
-1.339165, -0.4312858, -0.8301935, 1, 0.5568628, 0, 1,
-1.326826, -0.6129825, -2.678548, 1, 0.5647059, 0, 1,
-1.319438, -0.0287353, -2.300471, 1, 0.5686275, 0, 1,
-1.317802, 0.04236926, -2.179191, 1, 0.5764706, 0, 1,
-1.31386, -0.728869, -3.053328, 1, 0.5803922, 0, 1,
-1.310202, 0.1989408, -0.5005013, 1, 0.5882353, 0, 1,
-1.304369, -0.4093333, -0.1641137, 1, 0.5921569, 0, 1,
-1.304264, 0.1105324, -2.047579, 1, 0.6, 0, 1,
-1.295306, -0.7026503, -1.321455, 1, 0.6078432, 0, 1,
-1.294042, 1.185032, -0.9083968, 1, 0.6117647, 0, 1,
-1.292989, -0.4245549, -3.787054, 1, 0.6196079, 0, 1,
-1.290516, 1.563672, -1.374335, 1, 0.6235294, 0, 1,
-1.287602, 1.317667, -2.478585, 1, 0.6313726, 0, 1,
-1.2851, 0.4680749, -2.691586, 1, 0.6352941, 0, 1,
-1.279549, 0.2440962, -0.7039693, 1, 0.6431373, 0, 1,
-1.254408, -0.7058758, -2.260949, 1, 0.6470588, 0, 1,
-1.253633, 0.5085922, -1.374007, 1, 0.654902, 0, 1,
-1.250465, -0.5881467, -1.688769, 1, 0.6588235, 0, 1,
-1.244858, -1.150477, -2.649297, 1, 0.6666667, 0, 1,
-1.242845, 0.5551965, -1.190467, 1, 0.6705883, 0, 1,
-1.238611, 0.04058937, -4.6281, 1, 0.6784314, 0, 1,
-1.232517, -1.496794, -2.556132, 1, 0.682353, 0, 1,
-1.224216, -0.9046699, -1.47568, 1, 0.6901961, 0, 1,
-1.221432, 0.7080411, -0.9772773, 1, 0.6941177, 0, 1,
-1.219494, -0.01088126, 0.0267112, 1, 0.7019608, 0, 1,
-1.189801, -0.3297574, -2.009748, 1, 0.7098039, 0, 1,
-1.183998, 0.1614067, -1.428352, 1, 0.7137255, 0, 1,
-1.182775, 0.1026925, -1.424296, 1, 0.7215686, 0, 1,
-1.181125, -0.4208061, -2.791903, 1, 0.7254902, 0, 1,
-1.168153, 0.8039703, -1.638731, 1, 0.7333333, 0, 1,
-1.162089, 0.4421369, -1.451255, 1, 0.7372549, 0, 1,
-1.156101, -1.119343, -1.452488, 1, 0.7450981, 0, 1,
-1.153746, -0.3320384, 0.8772318, 1, 0.7490196, 0, 1,
-1.147553, 0.4099896, -1.642564, 1, 0.7568628, 0, 1,
-1.140788, -0.484911, -0.4740651, 1, 0.7607843, 0, 1,
-1.125751, 1.469, -0.1736348, 1, 0.7686275, 0, 1,
-1.119075, 1.443047, 1.598459, 1, 0.772549, 0, 1,
-1.116441, -0.1385791, -0.9485037, 1, 0.7803922, 0, 1,
-1.113948, 2.730175, 0.5299982, 1, 0.7843137, 0, 1,
-1.111823, 1.417732, -0.6374835, 1, 0.7921569, 0, 1,
-1.102855, 1.224553, -1.218239, 1, 0.7960784, 0, 1,
-1.101617, -0.02035428, -1.818101, 1, 0.8039216, 0, 1,
-1.094408, 0.6362412, -0.1906062, 1, 0.8117647, 0, 1,
-1.091468, 0.01339088, -1.370146, 1, 0.8156863, 0, 1,
-1.090445, 1.080311, -0.6242185, 1, 0.8235294, 0, 1,
-1.085865, 2.082823, 0.14211, 1, 0.827451, 0, 1,
-1.081017, -1.202225, -2.059421, 1, 0.8352941, 0, 1,
-1.079299, 1.733589, 1.285678, 1, 0.8392157, 0, 1,
-1.077374, -0.9088469, -3.772088, 1, 0.8470588, 0, 1,
-1.069085, -0.146457, -1.203917, 1, 0.8509804, 0, 1,
-1.061944, -0.492786, -1.412804, 1, 0.8588235, 0, 1,
-1.060857, -0.8855382, -2.53696, 1, 0.8627451, 0, 1,
-1.058084, -0.07204685, -0.8995927, 1, 0.8705882, 0, 1,
-1.041873, 0.9147018, -1.126667, 1, 0.8745098, 0, 1,
-1.040533, 0.6207164, -0.6771109, 1, 0.8823529, 0, 1,
-1.040289, 0.2935829, -2.781501, 1, 0.8862745, 0, 1,
-1.028938, 0.4146714, -0.6552958, 1, 0.8941177, 0, 1,
-1.022298, -0.09290787, -0.1633567, 1, 0.8980392, 0, 1,
-1.009166, 0.552036, 0.363622, 1, 0.9058824, 0, 1,
-1.004079, 0.7661715, -0.4451041, 1, 0.9137255, 0, 1,
-1.003281, -0.7123019, -3.592538, 1, 0.9176471, 0, 1,
-0.991986, -0.6866462, -2.910345, 1, 0.9254902, 0, 1,
-0.987535, -0.1245319, -0.6152601, 1, 0.9294118, 0, 1,
-0.9831927, -0.9147334, -1.613536, 1, 0.9372549, 0, 1,
-0.9825186, -0.620036, -3.043885, 1, 0.9411765, 0, 1,
-0.9676917, 0.5872203, -0.4359837, 1, 0.9490196, 0, 1,
-0.963432, -0.5478772, -1.754246, 1, 0.9529412, 0, 1,
-0.9595498, 1.047955, -1.39072, 1, 0.9607843, 0, 1,
-0.9593804, 1.04308, -0.9646834, 1, 0.9647059, 0, 1,
-0.9568863, 0.1092424, -3.194313, 1, 0.972549, 0, 1,
-0.9565709, 0.3200802, -0.1677167, 1, 0.9764706, 0, 1,
-0.9504747, -1.047488, -3.220683, 1, 0.9843137, 0, 1,
-0.9487817, -0.09201787, -1.21281, 1, 0.9882353, 0, 1,
-0.9364814, 1.276994, -1.133248, 1, 0.9960784, 0, 1,
-0.9315012, 0.365116, -0.716159, 0.9960784, 1, 0, 1,
-0.9307703, -0.5025284, -2.100695, 0.9921569, 1, 0, 1,
-0.9206854, 0.8038499, -0.2285936, 0.9843137, 1, 0, 1,
-0.9174731, 0.2191706, -3.309304, 0.9803922, 1, 0, 1,
-0.9162132, -1.232767, -2.507866, 0.972549, 1, 0, 1,
-0.9097609, 1.318536, -0.6998453, 0.9686275, 1, 0, 1,
-0.9091458, -0.32693, -3.382962, 0.9607843, 1, 0, 1,
-0.9079323, -0.3441229, -2.471616, 0.9568627, 1, 0, 1,
-0.9062533, 2.542097, -1.999517, 0.9490196, 1, 0, 1,
-0.9052632, 0.6852003, 0.1823081, 0.945098, 1, 0, 1,
-0.9016114, 0.5415741, 0.8360965, 0.9372549, 1, 0, 1,
-0.8920976, -1.326611, -3.552098, 0.9333333, 1, 0, 1,
-0.8864079, 0.1057054, -1.394331, 0.9254902, 1, 0, 1,
-0.8769261, -0.1065825, -1.000633, 0.9215686, 1, 0, 1,
-0.8728523, -0.6676658, -1.486059, 0.9137255, 1, 0, 1,
-0.8698418, -0.4046673, -1.844936, 0.9098039, 1, 0, 1,
-0.869252, 2.626508, -0.32733, 0.9019608, 1, 0, 1,
-0.856446, -0.717862, -2.264772, 0.8941177, 1, 0, 1,
-0.8527658, 2.015813, 0.2779565, 0.8901961, 1, 0, 1,
-0.8526194, -0.3312865, -2.412556, 0.8823529, 1, 0, 1,
-0.8513375, -0.1727135, -1.570194, 0.8784314, 1, 0, 1,
-0.8468812, -1.921206, -2.582317, 0.8705882, 1, 0, 1,
-0.8455397, 0.4799077, -2.70224, 0.8666667, 1, 0, 1,
-0.8454426, 1.444218, 0.8189237, 0.8588235, 1, 0, 1,
-0.8447881, 0.6503972, -0.004148924, 0.854902, 1, 0, 1,
-0.8398843, 0.08880357, -2.188426, 0.8470588, 1, 0, 1,
-0.8374161, -0.7105293, -0.9134728, 0.8431373, 1, 0, 1,
-0.8369718, 0.4011668, -1.452554, 0.8352941, 1, 0, 1,
-0.8336638, 1.470822, -0.7809349, 0.8313726, 1, 0, 1,
-0.8336532, 0.9896098, -0.7623577, 0.8235294, 1, 0, 1,
-0.8289708, -2.317074, -3.805786, 0.8196079, 1, 0, 1,
-0.8144167, 1.688901, 0.1712293, 0.8117647, 1, 0, 1,
-0.8117689, 0.4961761, -2.769367, 0.8078431, 1, 0, 1,
-0.8111365, -2.178217, -2.084467, 0.8, 1, 0, 1,
-0.8094085, 0.6139498, -0.006122749, 0.7921569, 1, 0, 1,
-0.7957973, -1.40397, -2.379494, 0.7882353, 1, 0, 1,
-0.7917204, 0.8870747, -1.694675, 0.7803922, 1, 0, 1,
-0.7913425, -1.24126, -3.049407, 0.7764706, 1, 0, 1,
-0.7903402, -0.2023135, -0.7052304, 0.7686275, 1, 0, 1,
-0.7886047, 0.6287746, -1.446238, 0.7647059, 1, 0, 1,
-0.7864876, -0.07308645, -1.505249, 0.7568628, 1, 0, 1,
-0.7793035, 1.815851, -0.6747031, 0.7529412, 1, 0, 1,
-0.776532, -1.45922, -3.049816, 0.7450981, 1, 0, 1,
-0.7705296, 0.3736919, -2.049157, 0.7411765, 1, 0, 1,
-0.7692446, -0.505259, -0.3106631, 0.7333333, 1, 0, 1,
-0.7683493, -0.5478593, -1.264671, 0.7294118, 1, 0, 1,
-0.7516722, 0.4112752, -0.9011882, 0.7215686, 1, 0, 1,
-0.7475761, 2.06079, -0.5973641, 0.7176471, 1, 0, 1,
-0.7472156, 0.2341228, -2.364677, 0.7098039, 1, 0, 1,
-0.7461057, -0.3161398, -1.385846, 0.7058824, 1, 0, 1,
-0.7441748, -1.4172, -2.705493, 0.6980392, 1, 0, 1,
-0.7373666, -1.17959, -2.865809, 0.6901961, 1, 0, 1,
-0.7344639, -0.6633216, -2.118338, 0.6862745, 1, 0, 1,
-0.7333502, -0.9303659, -2.181204, 0.6784314, 1, 0, 1,
-0.7330034, 0.1765826, -0.9926165, 0.6745098, 1, 0, 1,
-0.7307348, -0.7986441, -2.730743, 0.6666667, 1, 0, 1,
-0.7248831, 0.6283724, -0.275705, 0.6627451, 1, 0, 1,
-0.7191383, 0.6760097, -0.8012985, 0.654902, 1, 0, 1,
-0.7185014, 0.05950473, -0.8667391, 0.6509804, 1, 0, 1,
-0.7169737, -0.2774166, -2.265245, 0.6431373, 1, 0, 1,
-0.7144554, -0.3874352, -3.016609, 0.6392157, 1, 0, 1,
-0.7138779, -1.934406, -1.978051, 0.6313726, 1, 0, 1,
-0.7128894, -0.3163875, -1.846408, 0.627451, 1, 0, 1,
-0.7077991, -1.86259, -1.878389, 0.6196079, 1, 0, 1,
-0.7072204, -1.661423, -3.221456, 0.6156863, 1, 0, 1,
-0.7046739, -1.161192, -1.785244, 0.6078432, 1, 0, 1,
-0.6972687, 0.3686644, -1.824325, 0.6039216, 1, 0, 1,
-0.6916991, -0.394039, -2.617549, 0.5960785, 1, 0, 1,
-0.6909646, 1.025536, 1.827483, 0.5882353, 1, 0, 1,
-0.6881516, 1.114956, -1.159494, 0.5843138, 1, 0, 1,
-0.6873543, -1.828727, -3.334779, 0.5764706, 1, 0, 1,
-0.6858388, -0.3984589, -0.8201016, 0.572549, 1, 0, 1,
-0.6834397, 0.1208081, -1.950497, 0.5647059, 1, 0, 1,
-0.6833969, -0.1888744, -2.166104, 0.5607843, 1, 0, 1,
-0.6769711, -0.1261424, -0.4506978, 0.5529412, 1, 0, 1,
-0.6757506, 1.281572, -0.7248813, 0.5490196, 1, 0, 1,
-0.6747015, 1.121605, -1.442846, 0.5411765, 1, 0, 1,
-0.6745752, 2.46879, -0.1823064, 0.5372549, 1, 0, 1,
-0.6698188, -0.9228642, -1.933869, 0.5294118, 1, 0, 1,
-0.6666298, 0.02267677, -0.1034582, 0.5254902, 1, 0, 1,
-0.6628427, -1.157282, -2.603778, 0.5176471, 1, 0, 1,
-0.6626067, -1.197074, -1.382384, 0.5137255, 1, 0, 1,
-0.6602832, 0.7132261, -0.6658158, 0.5058824, 1, 0, 1,
-0.6543082, -0.08245555, -2.462631, 0.5019608, 1, 0, 1,
-0.6537681, -0.8483742, -2.148408, 0.4941176, 1, 0, 1,
-0.649121, -0.4697753, -1.464539, 0.4862745, 1, 0, 1,
-0.6431394, -0.9844038, -2.19726, 0.4823529, 1, 0, 1,
-0.6425782, 1.044957, -1.300327, 0.4745098, 1, 0, 1,
-0.6418626, -0.01664098, -2.679543, 0.4705882, 1, 0, 1,
-0.6385334, 0.3096269, -0.5786088, 0.4627451, 1, 0, 1,
-0.6366319, -0.2966717, -1.232184, 0.4588235, 1, 0, 1,
-0.6335073, 0.4419399, 0.6048291, 0.4509804, 1, 0, 1,
-0.6240762, 1.387496, -1.032498, 0.4470588, 1, 0, 1,
-0.6227955, 0.3127148, -0.07218415, 0.4392157, 1, 0, 1,
-0.6189914, -0.8257214, -1.901541, 0.4352941, 1, 0, 1,
-0.6131612, -0.5620772, -1.366242, 0.427451, 1, 0, 1,
-0.6112677, -0.5261476, -2.08164, 0.4235294, 1, 0, 1,
-0.608117, -0.3575103, -2.112932, 0.4156863, 1, 0, 1,
-0.6061388, -0.2653852, 0.3972142, 0.4117647, 1, 0, 1,
-0.6034286, -0.9500524, -1.025854, 0.4039216, 1, 0, 1,
-0.5980105, 0.4358111, -0.419551, 0.3960784, 1, 0, 1,
-0.5951539, 0.3229, -0.06495914, 0.3921569, 1, 0, 1,
-0.5851326, 0.1204416, -1.467004, 0.3843137, 1, 0, 1,
-0.5830182, -0.6184953, -2.38639, 0.3803922, 1, 0, 1,
-0.5817451, -1.054144, -2.281324, 0.372549, 1, 0, 1,
-0.5747195, 0.7366292, 1.546906, 0.3686275, 1, 0, 1,
-0.5673084, -0.3677702, -2.958081, 0.3607843, 1, 0, 1,
-0.5653159, -0.9398773, -2.067018, 0.3568628, 1, 0, 1,
-0.5645472, -1.114208, -2.614264, 0.3490196, 1, 0, 1,
-0.56451, 0.2767724, -1.957383, 0.345098, 1, 0, 1,
-0.5568961, 0.3011939, -2.548237, 0.3372549, 1, 0, 1,
-0.5547929, -1.057399, -4.153613, 0.3333333, 1, 0, 1,
-0.5528615, -0.6725626, -1.895746, 0.3254902, 1, 0, 1,
-0.547646, -0.3757513, -1.492858, 0.3215686, 1, 0, 1,
-0.544279, 0.6322626, -1.457067, 0.3137255, 1, 0, 1,
-0.542134, 2.728368, -0.8071851, 0.3098039, 1, 0, 1,
-0.5412574, -1.435389, -3.166761, 0.3019608, 1, 0, 1,
-0.531615, 1.209444, -0.8907446, 0.2941177, 1, 0, 1,
-0.5250023, -1.289164, -1.397739, 0.2901961, 1, 0, 1,
-0.5162564, -1.982581, -3.62099, 0.282353, 1, 0, 1,
-0.5136266, -1.726464, -2.999322, 0.2784314, 1, 0, 1,
-0.5034492, 0.1704238, -2.144712, 0.2705882, 1, 0, 1,
-0.5021002, 0.346966, -0.5754466, 0.2666667, 1, 0, 1,
-0.498911, 1.727636, -0.6065632, 0.2588235, 1, 0, 1,
-0.4982967, -0.3424074, -2.996056, 0.254902, 1, 0, 1,
-0.4961991, 0.3788899, -0.0603325, 0.2470588, 1, 0, 1,
-0.4950306, -0.8058336, -3.987493, 0.2431373, 1, 0, 1,
-0.4932784, 0.987228, -0.5519838, 0.2352941, 1, 0, 1,
-0.4929476, 1.105065, -1.505254, 0.2313726, 1, 0, 1,
-0.4928448, -0.02602974, -0.3296401, 0.2235294, 1, 0, 1,
-0.4901077, -0.1073855, -1.63039, 0.2196078, 1, 0, 1,
-0.4871801, -1.539915, -3.947641, 0.2117647, 1, 0, 1,
-0.4858862, 1.646734, -1.8527, 0.2078431, 1, 0, 1,
-0.4781037, -1.155676, -1.392126, 0.2, 1, 0, 1,
-0.4780527, 0.06734424, -1.17586, 0.1921569, 1, 0, 1,
-0.4742065, -0.05857152, -2.226189, 0.1882353, 1, 0, 1,
-0.4660383, -1.00177, -2.190781, 0.1803922, 1, 0, 1,
-0.4653614, 1.12282, -0.373781, 0.1764706, 1, 0, 1,
-0.4634931, -0.8822805, -2.879167, 0.1686275, 1, 0, 1,
-0.4584377, -1.11676, -3.659293, 0.1647059, 1, 0, 1,
-0.4482345, 1.42273, -0.04007715, 0.1568628, 1, 0, 1,
-0.4467682, 0.04287469, -2.572297, 0.1529412, 1, 0, 1,
-0.446734, 0.7236987, -0.5267042, 0.145098, 1, 0, 1,
-0.4460359, 0.4052786, -1.858302, 0.1411765, 1, 0, 1,
-0.445791, 0.7349706, 0.2327921, 0.1333333, 1, 0, 1,
-0.4425545, 1.944829, -0.3993582, 0.1294118, 1, 0, 1,
-0.4405156, -2.261979, -1.894615, 0.1215686, 1, 0, 1,
-0.4347953, -0.2522278, -1.30707, 0.1176471, 1, 0, 1,
-0.429835, -0.3272942, -3.001677, 0.1098039, 1, 0, 1,
-0.4280726, 1.179682, -0.461297, 0.1058824, 1, 0, 1,
-0.4203701, 0.297198, -1.887554, 0.09803922, 1, 0, 1,
-0.4151973, -1.502775, -2.047084, 0.09019608, 1, 0, 1,
-0.414519, 0.424442, -0.2440379, 0.08627451, 1, 0, 1,
-0.4139987, 0.2156737, -0.3114138, 0.07843138, 1, 0, 1,
-0.4113194, -0.8006937, -2.980923, 0.07450981, 1, 0, 1,
-0.4101133, -1.131676, -1.364637, 0.06666667, 1, 0, 1,
-0.4087434, 1.455367, 1.443776, 0.0627451, 1, 0, 1,
-0.4049646, -1.414316, -1.522679, 0.05490196, 1, 0, 1,
-0.4046095, 1.705206, 1.255843, 0.05098039, 1, 0, 1,
-0.3956629, 0.9562155, -0.804285, 0.04313726, 1, 0, 1,
-0.3951281, 0.7600373, -2.168495, 0.03921569, 1, 0, 1,
-0.3885754, -0.6889806, -1.839325, 0.03137255, 1, 0, 1,
-0.3883624, -0.2103365, -2.507348, 0.02745098, 1, 0, 1,
-0.387496, 0.3461276, -1.336945, 0.01960784, 1, 0, 1,
-0.3853698, -0.4209635, -2.12891, 0.01568628, 1, 0, 1,
-0.3847064, 0.8427678, -1.362319, 0.007843138, 1, 0, 1,
-0.3806627, 0.1666385, -0.7481306, 0.003921569, 1, 0, 1,
-0.3758497, 2.08706, 0.8258222, 0, 1, 0.003921569, 1,
-0.3717195, -1.006609, -3.010921, 0, 1, 0.01176471, 1,
-0.3696683, -0.757546, -2.95166, 0, 1, 0.01568628, 1,
-0.36814, -1.579277, -1.899139, 0, 1, 0.02352941, 1,
-0.3676741, 0.242028, -2.437518, 0, 1, 0.02745098, 1,
-0.364104, 0.4704697, 0.3862223, 0, 1, 0.03529412, 1,
-0.3592266, -0.6118971, -2.347899, 0, 1, 0.03921569, 1,
-0.3589048, -1.185663, -3.409622, 0, 1, 0.04705882, 1,
-0.3567682, -0.2670934, -2.074509, 0, 1, 0.05098039, 1,
-0.3562989, -1.850569, -3.199451, 0, 1, 0.05882353, 1,
-0.356073, -1.411358, -2.977034, 0, 1, 0.0627451, 1,
-0.3512266, 0.7363125, -2.075862, 0, 1, 0.07058824, 1,
-0.3511989, -0.6832264, -3.603767, 0, 1, 0.07450981, 1,
-0.3477601, 0.3685502, -1.421751, 0, 1, 0.08235294, 1,
-0.3472015, -0.07878138, -2.052151, 0, 1, 0.08627451, 1,
-0.3438954, 1.007061, -0.06967071, 0, 1, 0.09411765, 1,
-0.3427201, 0.5311903, -1.559732, 0, 1, 0.1019608, 1,
-0.3422624, 0.5506389, 0.8337157, 0, 1, 0.1058824, 1,
-0.3418124, 0.05968468, -0.1236478, 0, 1, 0.1137255, 1,
-0.3405132, -0.09055108, -2.077544, 0, 1, 0.1176471, 1,
-0.3376357, -0.7225462, -4.227384, 0, 1, 0.1254902, 1,
-0.3362573, 1.391476, -1.811132, 0, 1, 0.1294118, 1,
-0.3357463, 0.6155404, -0.3842725, 0, 1, 0.1372549, 1,
-0.3354642, -0.6407921, -2.877538, 0, 1, 0.1411765, 1,
-0.3344779, -0.8026586, -3.429395, 0, 1, 0.1490196, 1,
-0.3303336, -0.5225757, -2.844235, 0, 1, 0.1529412, 1,
-0.3284768, -0.9359646, -2.423956, 0, 1, 0.1607843, 1,
-0.3250229, -1.023199, -3.046699, 0, 1, 0.1647059, 1,
-0.3193934, 1.717083, 0.1521608, 0, 1, 0.172549, 1,
-0.3186524, 0.2226889, -1.453277, 0, 1, 0.1764706, 1,
-0.3155471, 1.107182, 0.9215497, 0, 1, 0.1843137, 1,
-0.309449, -0.4224007, -2.25054, 0, 1, 0.1882353, 1,
-0.3074383, -0.05205845, -0.5614368, 0, 1, 0.1960784, 1,
-0.2957464, -0.6289418, -3.855139, 0, 1, 0.2039216, 1,
-0.2953931, 0.8699044, 0.04395655, 0, 1, 0.2078431, 1,
-0.2950474, -0.006097867, -2.38278, 0, 1, 0.2156863, 1,
-0.290902, -0.5740237, -2.982726, 0, 1, 0.2196078, 1,
-0.2903228, 0.7175838, -1.261154, 0, 1, 0.227451, 1,
-0.286399, -0.1391459, -1.228235, 0, 1, 0.2313726, 1,
-0.2845389, -0.8721218, -1.982537, 0, 1, 0.2392157, 1,
-0.2828061, 1.390067, 1.105286, 0, 1, 0.2431373, 1,
-0.2802002, -0.376456, -0.8729675, 0, 1, 0.2509804, 1,
-0.2766394, 0.07426761, -2.51111, 0, 1, 0.254902, 1,
-0.2749949, -0.2213975, -2.21729, 0, 1, 0.2627451, 1,
-0.2707956, -0.1193352, -2.165146, 0, 1, 0.2666667, 1,
-0.2684463, -0.1555609, -0.7298394, 0, 1, 0.2745098, 1,
-0.2683402, -0.6869557, -2.153488, 0, 1, 0.2784314, 1,
-0.2665085, -0.001247491, -3.125926, 0, 1, 0.2862745, 1,
-0.2623021, -1.9483, -2.899776, 0, 1, 0.2901961, 1,
-0.26033, -0.10769, -3.653656, 0, 1, 0.2980392, 1,
-0.2572426, 0.3640732, -1.188119, 0, 1, 0.3058824, 1,
-0.2557974, 0.6683637, -0.3532726, 0, 1, 0.3098039, 1,
-0.2509587, -0.9619246, -2.40511, 0, 1, 0.3176471, 1,
-0.250481, -0.4212256, -2.168026, 0, 1, 0.3215686, 1,
-0.247688, 0.8521, -0.9863002, 0, 1, 0.3294118, 1,
-0.2468723, -0.4207497, -2.53712, 0, 1, 0.3333333, 1,
-0.24147, 1.578932, 1.091066, 0, 1, 0.3411765, 1,
-0.2398922, -0.09615479, -0.8040119, 0, 1, 0.345098, 1,
-0.2358365, -0.01283071, -2.112679, 0, 1, 0.3529412, 1,
-0.2324422, -0.1274972, -1.506034, 0, 1, 0.3568628, 1,
-0.2314629, 0.5802656, -2.044874, 0, 1, 0.3647059, 1,
-0.2301769, 0.06996869, -4.271979, 0, 1, 0.3686275, 1,
-0.2267751, 1.456967, 0.9723999, 0, 1, 0.3764706, 1,
-0.2248073, 0.3811751, -1.49875, 0, 1, 0.3803922, 1,
-0.2241853, -0.4381821, -0.7841243, 0, 1, 0.3882353, 1,
-0.2238114, 0.7104409, 1.396121, 0, 1, 0.3921569, 1,
-0.2231321, -0.2830076, -1.271593, 0, 1, 0.4, 1,
-0.223007, 1.003927, -0.8199739, 0, 1, 0.4078431, 1,
-0.2205745, -0.1955955, -4.45563, 0, 1, 0.4117647, 1,
-0.2204859, -0.9061914, -4.217169, 0, 1, 0.4196078, 1,
-0.2201235, 0.2655352, -0.5375324, 0, 1, 0.4235294, 1,
-0.2188395, 0.5828893, 0.5498065, 0, 1, 0.4313726, 1,
-0.2184978, 0.9661805, 1.723734, 0, 1, 0.4352941, 1,
-0.216313, 2.40042, 0.4681108, 0, 1, 0.4431373, 1,
-0.213948, 0.1618889, 0.5115512, 0, 1, 0.4470588, 1,
-0.2093705, -0.7860055, -3.87416, 0, 1, 0.454902, 1,
-0.2086853, -0.4753605, -1.248605, 0, 1, 0.4588235, 1,
-0.2011463, -1.485801, -3.61841, 0, 1, 0.4666667, 1,
-0.199668, -0.07040053, -3.462613, 0, 1, 0.4705882, 1,
-0.1987144, 0.7007737, -0.3407418, 0, 1, 0.4784314, 1,
-0.193358, 0.9012536, -0.5512378, 0, 1, 0.4823529, 1,
-0.1890903, -0.2758909, -3.069674, 0, 1, 0.4901961, 1,
-0.1886995, 0.4495432, 0.5364864, 0, 1, 0.4941176, 1,
-0.1883596, 1.258253, 0.1152519, 0, 1, 0.5019608, 1,
-0.1877619, 0.9797318, 1.7013, 0, 1, 0.509804, 1,
-0.1855816, 0.9335799, -0.187761, 0, 1, 0.5137255, 1,
-0.181874, -2.117388, -2.300205, 0, 1, 0.5215687, 1,
-0.1796974, 0.7640669, -1.168511, 0, 1, 0.5254902, 1,
-0.176737, -1.92235, -3.151842, 0, 1, 0.5333334, 1,
-0.1706924, -0.2511233, -3.488167, 0, 1, 0.5372549, 1,
-0.1678781, 0.5203372, -0.07793441, 0, 1, 0.5450981, 1,
-0.1655498, 0.3089513, -0.05504883, 0, 1, 0.5490196, 1,
-0.1641947, 0.9320858, -0.3377233, 0, 1, 0.5568628, 1,
-0.163908, -0.04475455, -1.650558, 0, 1, 0.5607843, 1,
-0.1631452, 0.5867152, -1.52595, 0, 1, 0.5686275, 1,
-0.1615615, 0.4430018, 0.6104035, 0, 1, 0.572549, 1,
-0.1614177, 2.082041, -0.4979178, 0, 1, 0.5803922, 1,
-0.1592543, -1.011782, -4.013759, 0, 1, 0.5843138, 1,
-0.1589505, 1.395355, 0.1311391, 0, 1, 0.5921569, 1,
-0.1469063, 0.1025141, -0.4087271, 0, 1, 0.5960785, 1,
-0.1417919, -0.5091746, -3.348546, 0, 1, 0.6039216, 1,
-0.141458, 0.3015345, -0.561201, 0, 1, 0.6117647, 1,
-0.1344569, 0.4078157, -0.4014441, 0, 1, 0.6156863, 1,
-0.1321162, -0.0815629, -2.083936, 0, 1, 0.6235294, 1,
-0.1315797, 0.2224751, -1.944303, 0, 1, 0.627451, 1,
-0.127592, -0.8998796, -2.905982, 0, 1, 0.6352941, 1,
-0.1226267, -0.347875, -3.340626, 0, 1, 0.6392157, 1,
-0.1216892, 0.349388, -2.004211, 0, 1, 0.6470588, 1,
-0.1199334, 0.2795381, -1.814327, 0, 1, 0.6509804, 1,
-0.1178638, -0.8149441, -2.910089, 0, 1, 0.6588235, 1,
-0.1169319, -0.9952024, -1.931463, 0, 1, 0.6627451, 1,
-0.1166748, -0.9545451, -1.697907, 0, 1, 0.6705883, 1,
-0.1036619, 0.1672063, -0.5326227, 0, 1, 0.6745098, 1,
-0.1021045, 1.566072, -1.837802, 0, 1, 0.682353, 1,
-0.09919636, -0.3402217, -2.484576, 0, 1, 0.6862745, 1,
-0.09768237, 1.412788, 1.371112, 0, 1, 0.6941177, 1,
-0.09571107, 0.6739458, -0.7412993, 0, 1, 0.7019608, 1,
-0.09529904, -0.2744657, -1.006122, 0, 1, 0.7058824, 1,
-0.09458639, -0.2646039, -1.376773, 0, 1, 0.7137255, 1,
-0.08917575, -0.2841198, -3.806199, 0, 1, 0.7176471, 1,
-0.08590719, -1.483147, -3.247842, 0, 1, 0.7254902, 1,
-0.08185552, 0.3007434, -0.2542181, 0, 1, 0.7294118, 1,
-0.07882342, -0.6703849, -2.986479, 0, 1, 0.7372549, 1,
-0.07279446, 2.296842, -0.2806444, 0, 1, 0.7411765, 1,
-0.07230046, 0.4980201, -1.217402, 0, 1, 0.7490196, 1,
-0.0707738, -1.00787, -2.50948, 0, 1, 0.7529412, 1,
-0.06873754, -1.537589, -2.259206, 0, 1, 0.7607843, 1,
-0.0591895, -1.881639, -2.45703, 0, 1, 0.7647059, 1,
-0.05901317, -0.1085087, -4.398146, 0, 1, 0.772549, 1,
-0.0580769, 0.7694011, -0.1012799, 0, 1, 0.7764706, 1,
-0.05666282, -0.04041373, -2.182842, 0, 1, 0.7843137, 1,
-0.05565638, -0.8364792, -2.487818, 0, 1, 0.7882353, 1,
-0.05496287, 1.269761, -1.195235, 0, 1, 0.7960784, 1,
-0.05222696, 0.2930349, -2.138503, 0, 1, 0.8039216, 1,
-0.04880161, 0.9685858, -0.8760679, 0, 1, 0.8078431, 1,
-0.0467488, 0.9078871, 1.053868, 0, 1, 0.8156863, 1,
-0.04587579, 0.5029446, -0.2580545, 0, 1, 0.8196079, 1,
-0.04444114, -0.6635317, -1.53965, 0, 1, 0.827451, 1,
-0.04397335, 0.734265, 0.7316427, 0, 1, 0.8313726, 1,
-0.04270466, 0.117637, -0.843523, 0, 1, 0.8392157, 1,
-0.04260993, -0.1559427, -3.759077, 0, 1, 0.8431373, 1,
-0.03918713, 0.6061795, 0.5243186, 0, 1, 0.8509804, 1,
-0.0354455, 0.2063524, -0.8733523, 0, 1, 0.854902, 1,
-0.0347602, -0.6034442, -2.517386, 0, 1, 0.8627451, 1,
-0.02915353, 0.4619671, 0.5111027, 0, 1, 0.8666667, 1,
-0.02270309, -0.1006463, -3.684102, 0, 1, 0.8745098, 1,
-0.02102034, -0.6439228, -4.266307, 0, 1, 0.8784314, 1,
-0.02068759, 0.9270774, -0.09802877, 0, 1, 0.8862745, 1,
-0.02002843, 1.808174, 0.01790098, 0, 1, 0.8901961, 1,
-0.01942651, -1.749864, -6.279442, 0, 1, 0.8980392, 1,
-0.01913676, 0.3642228, -0.883055, 0, 1, 0.9058824, 1,
-0.01887737, -0.04213474, -4.461323, 0, 1, 0.9098039, 1,
-0.01689851, -0.7417509, -3.323019, 0, 1, 0.9176471, 1,
-0.01463892, 1.220188, 2.84159, 0, 1, 0.9215686, 1,
-0.009273185, 1.124884, -0.1989581, 0, 1, 0.9294118, 1,
-0.009226364, -1.423072, -2.475276, 0, 1, 0.9333333, 1,
-0.005829542, -1.062974, -4.59786, 0, 1, 0.9411765, 1,
-0.004220414, -0.3205775, -3.847039, 0, 1, 0.945098, 1,
-0.003097641, 1.25794, -1.58878, 0, 1, 0.9529412, 1,
-0.00242785, -0.4734671, -1.894428, 0, 1, 0.9568627, 1,
-0.001014579, -0.769299, -4.298157, 0, 1, 0.9647059, 1,
0.004452137, 2.237788, -0.223515, 0, 1, 0.9686275, 1,
0.005480368, -1.281718, 3.520226, 0, 1, 0.9764706, 1,
0.01209504, 0.5335181, 1.346425, 0, 1, 0.9803922, 1,
0.01370842, -0.2027778, 3.057804, 0, 1, 0.9882353, 1,
0.01754842, 0.02453337, 0.4702781, 0, 1, 0.9921569, 1,
0.02125099, -0.500838, 3.633286, 0, 1, 1, 1,
0.02150046, 0.747122, 0.4883934, 0, 0.9921569, 1, 1,
0.02820629, 0.8703366, -0.330004, 0, 0.9882353, 1, 1,
0.0284905, 0.2020075, -0.2744521, 0, 0.9803922, 1, 1,
0.03431993, -0.3249049, 2.974225, 0, 0.9764706, 1, 1,
0.03572103, 0.7306034, -0.9872559, 0, 0.9686275, 1, 1,
0.03621823, 0.5313081, -0.1019906, 0, 0.9647059, 1, 1,
0.03660027, -0.1361112, 2.442649, 0, 0.9568627, 1, 1,
0.03786644, -1.005541, 2.788382, 0, 0.9529412, 1, 1,
0.04305707, 0.3951223, 0.6049958, 0, 0.945098, 1, 1,
0.05240999, 0.2745107, 1.822644, 0, 0.9411765, 1, 1,
0.05786817, 0.3047818, 1.052005, 0, 0.9333333, 1, 1,
0.05970085, 1.330752, -0.07906419, 0, 0.9294118, 1, 1,
0.06069363, 0.9382809, -0.4275771, 0, 0.9215686, 1, 1,
0.06098522, -2.789074, 2.399177, 0, 0.9176471, 1, 1,
0.06163253, -0.02794372, 1.588752, 0, 0.9098039, 1, 1,
0.06354902, -0.4587631, 3.941553, 0, 0.9058824, 1, 1,
0.06362127, 0.3828283, 0.09789243, 0, 0.8980392, 1, 1,
0.06414311, -2.024852, 1.674251, 0, 0.8901961, 1, 1,
0.06556807, -1.257475, 2.843826, 0, 0.8862745, 1, 1,
0.06680609, 1.459805, -0.197214, 0, 0.8784314, 1, 1,
0.06773102, -0.09523892, 2.844078, 0, 0.8745098, 1, 1,
0.07124845, 2.125025, -0.343574, 0, 0.8666667, 1, 1,
0.07536297, -2.744896, 4.048738, 0, 0.8627451, 1, 1,
0.07537626, -0.5195119, 2.836392, 0, 0.854902, 1, 1,
0.08666702, 1.558426, -0.8647384, 0, 0.8509804, 1, 1,
0.08761556, -0.5803195, 2.028469, 0, 0.8431373, 1, 1,
0.08802202, 0.6667107, 0.9451051, 0, 0.8392157, 1, 1,
0.09015076, 0.9461791, -1.077153, 0, 0.8313726, 1, 1,
0.09207756, -0.9276361, 4.041695, 0, 0.827451, 1, 1,
0.09583043, 0.4127451, -0.1020386, 0, 0.8196079, 1, 1,
0.09793949, -0.2264284, 2.668166, 0, 0.8156863, 1, 1,
0.100256, 0.7116801, -0.05197924, 0, 0.8078431, 1, 1,
0.1028683, -0.4043326, 2.159133, 0, 0.8039216, 1, 1,
0.1031045, -0.3955607, 4.338045, 0, 0.7960784, 1, 1,
0.1036009, -1.591763, 4.128748, 0, 0.7882353, 1, 1,
0.1039461, -0.3190804, 3.207508, 0, 0.7843137, 1, 1,
0.1061429, -0.07300044, 0.9719962, 0, 0.7764706, 1, 1,
0.1077955, 0.9990548, -0.5389503, 0, 0.772549, 1, 1,
0.108976, 0.5589039, 0.6958712, 0, 0.7647059, 1, 1,
0.1094518, -1.056759, 2.067966, 0, 0.7607843, 1, 1,
0.1097229, -0.2474127, 2.083694, 0, 0.7529412, 1, 1,
0.1119562, -1.024534, 2.69065, 0, 0.7490196, 1, 1,
0.1169577, -1.677104, 3.481402, 0, 0.7411765, 1, 1,
0.1174574, -0.7487492, 3.38468, 0, 0.7372549, 1, 1,
0.1187575, 1.131452, -1.049888, 0, 0.7294118, 1, 1,
0.120265, -0.03307125, 1.471213, 0, 0.7254902, 1, 1,
0.121777, -0.9466275, 5.158372, 0, 0.7176471, 1, 1,
0.1220436, 0.02295974, 2.734455, 0, 0.7137255, 1, 1,
0.1234011, 0.2249572, -0.4065088, 0, 0.7058824, 1, 1,
0.1296498, -0.2843034, 3.476366, 0, 0.6980392, 1, 1,
0.1327213, 0.1253438, 1.110007, 0, 0.6941177, 1, 1,
0.1343269, -0.6437999, 2.642106, 0, 0.6862745, 1, 1,
0.1361711, -0.5276403, 1.463371, 0, 0.682353, 1, 1,
0.1376088, 0.4731464, -0.1834189, 0, 0.6745098, 1, 1,
0.1400909, 0.03226728, 2.202259, 0, 0.6705883, 1, 1,
0.144818, -1.050336, 4.818156, 0, 0.6627451, 1, 1,
0.1480753, -1.691244, 4.17306, 0, 0.6588235, 1, 1,
0.1502197, -0.3738421, 2.843712, 0, 0.6509804, 1, 1,
0.1519837, 0.4549117, 0.468368, 0, 0.6470588, 1, 1,
0.1530293, 0.3807834, 0.9580155, 0, 0.6392157, 1, 1,
0.1536879, -0.1826986, 1.316332, 0, 0.6352941, 1, 1,
0.1538717, -0.3036293, 1.327348, 0, 0.627451, 1, 1,
0.1568854, -1.42562, 0.9043475, 0, 0.6235294, 1, 1,
0.1573765, -0.4442783, 3.06112, 0, 0.6156863, 1, 1,
0.1632164, -0.07591103, 0.4391722, 0, 0.6117647, 1, 1,
0.1634377, -0.1930897, 1.048784, 0, 0.6039216, 1, 1,
0.1679206, -1.162054, 3.808542, 0, 0.5960785, 1, 1,
0.171705, 0.09651534, 0.630482, 0, 0.5921569, 1, 1,
0.1722382, -0.9761226, 4.069935, 0, 0.5843138, 1, 1,
0.1739109, -1.985709, 3.072676, 0, 0.5803922, 1, 1,
0.1776512, -0.05590613, 1.906014, 0, 0.572549, 1, 1,
0.1802675, 1.314396, -0.21194, 0, 0.5686275, 1, 1,
0.1816658, -1.0914, 3.554815, 0, 0.5607843, 1, 1,
0.186322, -0.8323846, 2.021426, 0, 0.5568628, 1, 1,
0.1904325, 0.2145215, 0.5464109, 0, 0.5490196, 1, 1,
0.190659, -1.027744, 3.436218, 0, 0.5450981, 1, 1,
0.1950644, -1.043616, 1.886981, 0, 0.5372549, 1, 1,
0.1952129, -1.586208, 1.85286, 0, 0.5333334, 1, 1,
0.1979022, 0.6609028, 0.5891613, 0, 0.5254902, 1, 1,
0.1981788, -0.9192001, 1.751856, 0, 0.5215687, 1, 1,
0.202473, -1.991668, 2.611013, 0, 0.5137255, 1, 1,
0.2028475, 1.613956, 0.1997143, 0, 0.509804, 1, 1,
0.2050469, 2.923357, 0.06900473, 0, 0.5019608, 1, 1,
0.2062785, 0.769046, 0.670156, 0, 0.4941176, 1, 1,
0.2064842, 0.4000773, 2.352234, 0, 0.4901961, 1, 1,
0.2066103, 0.02035163, 1.98024, 0, 0.4823529, 1, 1,
0.2075881, 1.652661, 0.03243966, 0, 0.4784314, 1, 1,
0.2108009, -0.9224144, 3.379461, 0, 0.4705882, 1, 1,
0.2121082, 0.6194733, 0.8317193, 0, 0.4666667, 1, 1,
0.2179019, 0.3454363, -1.081595, 0, 0.4588235, 1, 1,
0.2203084, 0.03403626, 1.886968, 0, 0.454902, 1, 1,
0.2205157, -1.134534, 3.061919, 0, 0.4470588, 1, 1,
0.2222673, 0.6797088, -0.03004033, 0, 0.4431373, 1, 1,
0.2274854, -1.310977, 3.058953, 0, 0.4352941, 1, 1,
0.2384431, 0.6604456, -1.958927, 0, 0.4313726, 1, 1,
0.2487078, 0.8696878, 1.265416, 0, 0.4235294, 1, 1,
0.2490406, 1.477755, -0.9208116, 0, 0.4196078, 1, 1,
0.2521166, 1.244351, -0.05341322, 0, 0.4117647, 1, 1,
0.2561904, 0.6935655, -0.1614824, 0, 0.4078431, 1, 1,
0.2587605, -1.006918, 2.575962, 0, 0.4, 1, 1,
0.2627384, 0.8382814, 2.475271, 0, 0.3921569, 1, 1,
0.2642601, -1.862298, 3.033483, 0, 0.3882353, 1, 1,
0.2643273, -0.07789438, 2.014268, 0, 0.3803922, 1, 1,
0.2672774, -1.829168, 3.450426, 0, 0.3764706, 1, 1,
0.2691287, 0.01360375, 0.6663338, 0, 0.3686275, 1, 1,
0.2691592, -1.612251, 1.693802, 0, 0.3647059, 1, 1,
0.2751269, 0.888556, 1.272391, 0, 0.3568628, 1, 1,
0.2762097, -0.66783, 2.138798, 0, 0.3529412, 1, 1,
0.2821101, 0.02158979, 1.126663, 0, 0.345098, 1, 1,
0.2827912, -0.01323716, 2.589741, 0, 0.3411765, 1, 1,
0.2979729, 1.629959, 1.720883, 0, 0.3333333, 1, 1,
0.3016106, 1.320041, 1.079061, 0, 0.3294118, 1, 1,
0.302927, 1.903915, -0.1220352, 0, 0.3215686, 1, 1,
0.3055309, 0.1894149, 1.624879, 0, 0.3176471, 1, 1,
0.3095943, 1.20803, -0.2912095, 0, 0.3098039, 1, 1,
0.3102991, 0.3337802, -0.7525144, 0, 0.3058824, 1, 1,
0.3130596, 0.5431293, -0.01660928, 0, 0.2980392, 1, 1,
0.3182223, -0.7002239, 3.861213, 0, 0.2901961, 1, 1,
0.3186205, -2.593077, 1.536032, 0, 0.2862745, 1, 1,
0.321752, 0.100883, 1.433979, 0, 0.2784314, 1, 1,
0.3224386, -0.1523034, 3.122218, 0, 0.2745098, 1, 1,
0.3238506, 0.5894436, 1.436308, 0, 0.2666667, 1, 1,
0.3256857, 0.6897485, -1.385833, 0, 0.2627451, 1, 1,
0.326188, -1.273887, 2.730783, 0, 0.254902, 1, 1,
0.3266216, 0.01343879, 2.463181, 0, 0.2509804, 1, 1,
0.3268735, -0.4420413, 1.831681, 0, 0.2431373, 1, 1,
0.326931, -1.20337, 3.778647, 0, 0.2392157, 1, 1,
0.3293053, -0.1130461, 0.6915002, 0, 0.2313726, 1, 1,
0.3327094, -0.01744827, 3.644867, 0, 0.227451, 1, 1,
0.3333355, -0.5460426, 2.195236, 0, 0.2196078, 1, 1,
0.3578123, -1.187307, 2.033854, 0, 0.2156863, 1, 1,
0.3630053, 0.6102967, -0.676623, 0, 0.2078431, 1, 1,
0.3639916, -0.9060187, 2.233586, 0, 0.2039216, 1, 1,
0.3656137, -0.03932817, 2.414685, 0, 0.1960784, 1, 1,
0.3659048, 0.9603723, 0.2042557, 0, 0.1882353, 1, 1,
0.3659266, -0.6813102, 2.201118, 0, 0.1843137, 1, 1,
0.3693012, 0.5547034, -0.05979901, 0, 0.1764706, 1, 1,
0.369406, -1.159974, 2.632179, 0, 0.172549, 1, 1,
0.3699358, 0.1836849, -0.4897692, 0, 0.1647059, 1, 1,
0.3729747, 0.4483515, -0.2391105, 0, 0.1607843, 1, 1,
0.3761064, -0.01829499, 2.134499, 0, 0.1529412, 1, 1,
0.3776275, -0.3185402, 3.255344, 0, 0.1490196, 1, 1,
0.3785672, 1.391767, -0.2534966, 0, 0.1411765, 1, 1,
0.3847942, 0.9154457, -0.7904873, 0, 0.1372549, 1, 1,
0.388958, -0.3122105, 2.092057, 0, 0.1294118, 1, 1,
0.3889831, -2.567292, 3.002699, 0, 0.1254902, 1, 1,
0.3898278, -0.4866326, 3.950761, 0, 0.1176471, 1, 1,
0.3904886, -0.9031642, 3.106671, 0, 0.1137255, 1, 1,
0.3905221, 0.3343246, 1.534717, 0, 0.1058824, 1, 1,
0.3943644, -0.9623913, 3.50958, 0, 0.09803922, 1, 1,
0.3946086, 0.1866919, 0.1322778, 0, 0.09411765, 1, 1,
0.4037427, 0.3704287, -0.2617964, 0, 0.08627451, 1, 1,
0.4149287, -0.8197826, 0.1441734, 0, 0.08235294, 1, 1,
0.4179072, -0.3253157, 1.785406, 0, 0.07450981, 1, 1,
0.4190628, -0.8297576, 2.491513, 0, 0.07058824, 1, 1,
0.4193503, -0.4910548, 0.9946549, 0, 0.0627451, 1, 1,
0.4283387, -0.7780735, 2.805725, 0, 0.05882353, 1, 1,
0.4292054, -1.41425, 3.255615, 0, 0.05098039, 1, 1,
0.4304096, -0.7612578, 3.234953, 0, 0.04705882, 1, 1,
0.432237, 0.6579036, 2.0655, 0, 0.03921569, 1, 1,
0.4331299, 2.136884, 0.2743909, 0, 0.03529412, 1, 1,
0.4356062, -0.4323138, 2.914053, 0, 0.02745098, 1, 1,
0.4376533, -0.2408633, 1.417278, 0, 0.02352941, 1, 1,
0.4422814, 0.3892999, 1.670921, 0, 0.01568628, 1, 1,
0.4476858, -0.100537, 1.151302, 0, 0.01176471, 1, 1,
0.4480444, -0.1286855, 2.411358, 0, 0.003921569, 1, 1,
0.4502526, 0.8107138, 0.1903526, 0.003921569, 0, 1, 1,
0.4505894, -0.2505016, 1.061943, 0.007843138, 0, 1, 1,
0.4532346, -0.4736658, 2.316097, 0.01568628, 0, 1, 1,
0.4540945, -1.265866, 3.796058, 0.01960784, 0, 1, 1,
0.4557193, 0.2608595, 1.029303, 0.02745098, 0, 1, 1,
0.4584427, -1.214661, 2.571348, 0.03137255, 0, 1, 1,
0.4603751, 0.2259971, 1.168688, 0.03921569, 0, 1, 1,
0.4613486, -1.28378, 2.731603, 0.04313726, 0, 1, 1,
0.4663188, -0.3013737, 1.962744, 0.05098039, 0, 1, 1,
0.4677794, -2.376796, 2.131827, 0.05490196, 0, 1, 1,
0.47248, -0.3477131, 3.096498, 0.0627451, 0, 1, 1,
0.4761035, -0.06943563, 1.648324, 0.06666667, 0, 1, 1,
0.4848384, -0.05707765, 2.145215, 0.07450981, 0, 1, 1,
0.4857752, -1.067119, 3.343058, 0.07843138, 0, 1, 1,
0.4964215, -0.3589669, 2.401524, 0.08627451, 0, 1, 1,
0.4974115, -0.5978189, 0.5455009, 0.09019608, 0, 1, 1,
0.4989125, 1.427956, -1.15391, 0.09803922, 0, 1, 1,
0.5019064, 0.9403924, 2.697539, 0.1058824, 0, 1, 1,
0.5067387, -2.184538, 1.123028, 0.1098039, 0, 1, 1,
0.5068725, 1.5628, 1.680641, 0.1176471, 0, 1, 1,
0.5092577, 0.1119735, 0.7715899, 0.1215686, 0, 1, 1,
0.5093016, -0.9401019, 2.9511, 0.1294118, 0, 1, 1,
0.510323, 0.1565036, 1.334108, 0.1333333, 0, 1, 1,
0.5171601, 0.31801, 1.2195, 0.1411765, 0, 1, 1,
0.5192508, -1.010227, 3.243114, 0.145098, 0, 1, 1,
0.5236052, -0.6172587, -0.03812741, 0.1529412, 0, 1, 1,
0.5241762, -1.479135, 2.853681, 0.1568628, 0, 1, 1,
0.524321, 0.4743616, 1.766374, 0.1647059, 0, 1, 1,
0.5267529, 0.4766135, 2.338088, 0.1686275, 0, 1, 1,
0.5334237, -0.7548688, 3.550102, 0.1764706, 0, 1, 1,
0.5343739, -0.8043839, 2.816014, 0.1803922, 0, 1, 1,
0.5352238, -0.7901863, 3.027705, 0.1882353, 0, 1, 1,
0.5374637, 0.3399397, 0.3186322, 0.1921569, 0, 1, 1,
0.5387608, -0.4566786, 1.894149, 0.2, 0, 1, 1,
0.5416197, -0.7798762, 3.105736, 0.2078431, 0, 1, 1,
0.5423792, 0.7997833, 1.147577, 0.2117647, 0, 1, 1,
0.5448488, 0.8687088, 1.379697, 0.2196078, 0, 1, 1,
0.5571674, 0.1416103, 1.657065, 0.2235294, 0, 1, 1,
0.559104, 0.0292926, 1.658846, 0.2313726, 0, 1, 1,
0.5603344, -0.2998138, 2.593022, 0.2352941, 0, 1, 1,
0.5617318, 0.02966133, 0.9495285, 0.2431373, 0, 1, 1,
0.5666038, 1.300149, 1.343127, 0.2470588, 0, 1, 1,
0.5700259, 0.4298949, 2.348532, 0.254902, 0, 1, 1,
0.5761656, 2.583567, 0.3638335, 0.2588235, 0, 1, 1,
0.5829643, -0.6181247, 2.595908, 0.2666667, 0, 1, 1,
0.5841837, 0.5007617, 1.530663, 0.2705882, 0, 1, 1,
0.5848009, -0.2938645, 3.904505, 0.2784314, 0, 1, 1,
0.5856563, 0.03206845, -0.03282312, 0.282353, 0, 1, 1,
0.5903222, -1.368985, 2.020073, 0.2901961, 0, 1, 1,
0.594553, -1.653094, 3.54295, 0.2941177, 0, 1, 1,
0.594678, -0.7098289, 3.615283, 0.3019608, 0, 1, 1,
0.5973635, -0.9433607, 1.405719, 0.3098039, 0, 1, 1,
0.6012789, 0.4225088, 0.7312025, 0.3137255, 0, 1, 1,
0.6080898, 0.5064967, -0.6625087, 0.3215686, 0, 1, 1,
0.6081521, 1.500888, 0.4551195, 0.3254902, 0, 1, 1,
0.6153876, -0.2828363, 2.3506, 0.3333333, 0, 1, 1,
0.621219, 0.2164438, -0.2299074, 0.3372549, 0, 1, 1,
0.623212, 0.1680731, 2.310011, 0.345098, 0, 1, 1,
0.6249936, -0.2851804, 0.3489851, 0.3490196, 0, 1, 1,
0.6294864, 0.83145, 1.539195, 0.3568628, 0, 1, 1,
0.6295035, 1.381855, 1.177513, 0.3607843, 0, 1, 1,
0.6330653, -0.8956048, 1.815817, 0.3686275, 0, 1, 1,
0.6386017, 0.1515841, -0.3740837, 0.372549, 0, 1, 1,
0.6502215, -0.3821689, 2.418583, 0.3803922, 0, 1, 1,
0.653659, 0.5561869, 1.678542, 0.3843137, 0, 1, 1,
0.6550969, 1.494022, 0.2449615, 0.3921569, 0, 1, 1,
0.6560802, -0.6787728, 3.103357, 0.3960784, 0, 1, 1,
0.6586957, 2.08109, 0.4182215, 0.4039216, 0, 1, 1,
0.6590368, -0.3949193, 1.812385, 0.4117647, 0, 1, 1,
0.6651716, -1.240315, 2.327125, 0.4156863, 0, 1, 1,
0.6662349, 1.46328, -0.828245, 0.4235294, 0, 1, 1,
0.6667616, -1.167163, 3.713336, 0.427451, 0, 1, 1,
0.6676439, 0.4306838, 0.9400523, 0.4352941, 0, 1, 1,
0.6717423, -0.01644922, 2.012262, 0.4392157, 0, 1, 1,
0.6785175, -0.112535, 1.153534, 0.4470588, 0, 1, 1,
0.6807113, -0.8207248, 2.766605, 0.4509804, 0, 1, 1,
0.6838762, 0.2651725, 0.3618626, 0.4588235, 0, 1, 1,
0.6925251, 0.9740109, -0.02873009, 0.4627451, 0, 1, 1,
0.696219, 0.06581593, 1.648461, 0.4705882, 0, 1, 1,
0.6983615, 0.2103872, 0.2342761, 0.4745098, 0, 1, 1,
0.6983862, 0.202467, -1.023419, 0.4823529, 0, 1, 1,
0.6989688, 1.029919, 1.302287, 0.4862745, 0, 1, 1,
0.7041949, -0.895614, 1.770454, 0.4941176, 0, 1, 1,
0.7069569, -0.5449878, 0.2352349, 0.5019608, 0, 1, 1,
0.714313, 1.052526, 1.093054, 0.5058824, 0, 1, 1,
0.7191566, -1.048435, 2.383911, 0.5137255, 0, 1, 1,
0.725369, -0.4430666, 3.196719, 0.5176471, 0, 1, 1,
0.7256743, 1.609602, 1.60938, 0.5254902, 0, 1, 1,
0.7306294, -0.884867, 2.182882, 0.5294118, 0, 1, 1,
0.7365544, 1.173042, -0.8783228, 0.5372549, 0, 1, 1,
0.7446007, 1.046304, -1.098754, 0.5411765, 0, 1, 1,
0.752649, 3.338155, -0.2350913, 0.5490196, 0, 1, 1,
0.7536901, 0.4090142, 1.524444, 0.5529412, 0, 1, 1,
0.7541352, -0.4260164, 1.176534, 0.5607843, 0, 1, 1,
0.754513, 0.7026246, 0.3549068, 0.5647059, 0, 1, 1,
0.754539, -0.2388003, 0.9980993, 0.572549, 0, 1, 1,
0.7560326, -0.7542917, 2.670837, 0.5764706, 0, 1, 1,
0.757183, 0.8229131, -2.177835, 0.5843138, 0, 1, 1,
0.7683074, 2.792282, 0.5948121, 0.5882353, 0, 1, 1,
0.7718633, 1.773194, 0.6208873, 0.5960785, 0, 1, 1,
0.7726568, 0.87222, 1.322221, 0.6039216, 0, 1, 1,
0.7770846, -0.9285294, 2.491676, 0.6078432, 0, 1, 1,
0.7777894, 0.1146019, 2.704395, 0.6156863, 0, 1, 1,
0.7796265, 1.056093, 0.09253205, 0.6196079, 0, 1, 1,
0.7849934, 0.8665122, 1.413644, 0.627451, 0, 1, 1,
0.7865381, -0.963484, 1.514996, 0.6313726, 0, 1, 1,
0.7888014, 0.108346, 3.550813, 0.6392157, 0, 1, 1,
0.7913244, 0.08518489, 1.055176, 0.6431373, 0, 1, 1,
0.7930027, -0.7769173, 3.457437, 0.6509804, 0, 1, 1,
0.7959145, -1.932796, 1.09488, 0.654902, 0, 1, 1,
0.8032485, 0.3906589, 0.8598064, 0.6627451, 0, 1, 1,
0.803792, 0.1393972, -0.04388886, 0.6666667, 0, 1, 1,
0.8062749, 0.6688274, 1.601596, 0.6745098, 0, 1, 1,
0.8067527, -1.183333, 1.902356, 0.6784314, 0, 1, 1,
0.8177965, 0.3470483, 1.107029, 0.6862745, 0, 1, 1,
0.8193351, 1.451567, 0.04383648, 0.6901961, 0, 1, 1,
0.8230582, 0.5105081, 0.8112009, 0.6980392, 0, 1, 1,
0.8245707, 0.5030719, 1.852797, 0.7058824, 0, 1, 1,
0.8250492, -0.3423816, 1.680188, 0.7098039, 0, 1, 1,
0.8343069, 0.5099878, 0.4286171, 0.7176471, 0, 1, 1,
0.8408993, -1.644373, 2.576303, 0.7215686, 0, 1, 1,
0.8466138, -0.6687284, 1.492654, 0.7294118, 0, 1, 1,
0.8475757, 0.6020895, 2.119093, 0.7333333, 0, 1, 1,
0.8503624, 0.9922339, 0.7855827, 0.7411765, 0, 1, 1,
0.8509641, 2.135412, -0.1062611, 0.7450981, 0, 1, 1,
0.8530095, -0.6143903, 1.878607, 0.7529412, 0, 1, 1,
0.8553504, 0.3060636, 1.742959, 0.7568628, 0, 1, 1,
0.856259, -0.5162065, 2.985583, 0.7647059, 0, 1, 1,
0.8577802, -0.1770678, 0.9412158, 0.7686275, 0, 1, 1,
0.8582533, 1.58576, 2.694127, 0.7764706, 0, 1, 1,
0.861901, 1.371965, -0.7703857, 0.7803922, 0, 1, 1,
0.8659418, 0.6180844, 1.241601, 0.7882353, 0, 1, 1,
0.8693428, -1.917145, 1.930845, 0.7921569, 0, 1, 1,
0.8738561, 1.444387, 0.1789588, 0.8, 0, 1, 1,
0.8746535, 1.113862, 0.4799411, 0.8078431, 0, 1, 1,
0.8751579, -0.2195861, 1.82338, 0.8117647, 0, 1, 1,
0.8827171, -0.9877616, 1.965232, 0.8196079, 0, 1, 1,
0.8875738, -0.4753068, 1.436102, 0.8235294, 0, 1, 1,
0.8888001, 1.626448, 2.008252, 0.8313726, 0, 1, 1,
0.8893039, -1.824986, 3.015919, 0.8352941, 0, 1, 1,
0.8896533, -0.923803, 0.9720761, 0.8431373, 0, 1, 1,
0.8971242, 1.577123, 2.070175, 0.8470588, 0, 1, 1,
0.8991969, 1.370886, 0.2364003, 0.854902, 0, 1, 1,
0.9080139, 0.1197053, -0.00982475, 0.8588235, 0, 1, 1,
0.9086542, -0.3037465, 1.065933, 0.8666667, 0, 1, 1,
0.9089065, -1.035065, 2.440615, 0.8705882, 0, 1, 1,
0.9110191, 0.9779669, 1.835289, 0.8784314, 0, 1, 1,
0.928981, 0.3274927, 0.6646929, 0.8823529, 0, 1, 1,
0.9315149, 0.410212, 0.3775063, 0.8901961, 0, 1, 1,
0.9321426, -0.4778987, 3.476143, 0.8941177, 0, 1, 1,
0.9324612, 0.1098657, 2.570769, 0.9019608, 0, 1, 1,
0.9327017, 1.781105, 0.8708345, 0.9098039, 0, 1, 1,
0.9372077, 0.04353261, 1.4475, 0.9137255, 0, 1, 1,
0.9402716, 0.1024261, 0.3507246, 0.9215686, 0, 1, 1,
0.9419194, 0.008804059, 2.812267, 0.9254902, 0, 1, 1,
0.9441217, -0.5645476, 2.39933, 0.9333333, 0, 1, 1,
0.9473677, 0.3261007, 0.9398687, 0.9372549, 0, 1, 1,
0.9575297, -1.13356, 3.637891, 0.945098, 0, 1, 1,
0.9624565, 1.489742, -0.1452494, 0.9490196, 0, 1, 1,
0.9642398, -0.1534012, 2.417816, 0.9568627, 0, 1, 1,
0.9642746, -0.3603392, 2.643384, 0.9607843, 0, 1, 1,
0.9643064, 1.517942, -0.1691648, 0.9686275, 0, 1, 1,
0.9647137, 0.5454081, 1.528687, 0.972549, 0, 1, 1,
0.9713409, 0.1223065, 1.851243, 0.9803922, 0, 1, 1,
0.9747831, 0.9931815, 0.2305419, 0.9843137, 0, 1, 1,
0.982122, -0.1640677, 1.731985, 0.9921569, 0, 1, 1,
0.9830033, -0.5322347, 3.360974, 0.9960784, 0, 1, 1,
0.9884721, -0.2946899, 3.054097, 1, 0, 0.9960784, 1,
0.9921162, -1.763308, 4.201733, 1, 0, 0.9882353, 1,
0.9960865, -1.822656, 3.03164, 1, 0, 0.9843137, 1,
0.9992862, -1.326177, 2.089295, 1, 0, 0.9764706, 1,
1.000253, 0.3243642, 0.8415969, 1, 0, 0.972549, 1,
1.003058, 0.1032792, -0.6636992, 1, 0, 0.9647059, 1,
1.012809, 0.2610695, 0.2297394, 1, 0, 0.9607843, 1,
1.025624, 0.3401458, 1.03459, 1, 0, 0.9529412, 1,
1.028055, 0.5689374, 0.531343, 1, 0, 0.9490196, 1,
1.029077, 0.04827844, 2.892923, 1, 0, 0.9411765, 1,
1.036836, 1.616702, 1.518412, 1, 0, 0.9372549, 1,
1.038053, -0.07476763, 2.127459, 1, 0, 0.9294118, 1,
1.044199, -0.3723368, 2.384626, 1, 0, 0.9254902, 1,
1.051058, 0.7632458, 0.2788428, 1, 0, 0.9176471, 1,
1.052863, 0.07909681, 1.247925, 1, 0, 0.9137255, 1,
1.055607, 0.3497929, 2.278736, 1, 0, 0.9058824, 1,
1.056984, -0.1516185, 1.504805, 1, 0, 0.9019608, 1,
1.057431, -0.9866921, 1.611073, 1, 0, 0.8941177, 1,
1.064658, -0.3005104, 2.768497, 1, 0, 0.8862745, 1,
1.0748, -2.882993, 3.887692, 1, 0, 0.8823529, 1,
1.082641, -1.060701, 1.723554, 1, 0, 0.8745098, 1,
1.092136, 0.03055109, -0.01169241, 1, 0, 0.8705882, 1,
1.100748, -0.02519054, 0.9104651, 1, 0, 0.8627451, 1,
1.103171, 0.3728327, 1.194328, 1, 0, 0.8588235, 1,
1.103349, 0.6362192, -1.258138, 1, 0, 0.8509804, 1,
1.103989, -2.119779, 2.503411, 1, 0, 0.8470588, 1,
1.108223, 1.543168, 1.881589, 1, 0, 0.8392157, 1,
1.119526, 0.9131643, 2.569181, 1, 0, 0.8352941, 1,
1.121276, -0.9267282, 3.598308, 1, 0, 0.827451, 1,
1.128011, 0.262803, 2.102397, 1, 0, 0.8235294, 1,
1.136828, 0.3832287, 0.5156401, 1, 0, 0.8156863, 1,
1.161155, 0.6784078, 0.5468796, 1, 0, 0.8117647, 1,
1.163538, 0.2530531, 0.2574342, 1, 0, 0.8039216, 1,
1.165527, 0.2434409, 0.8078129, 1, 0, 0.7960784, 1,
1.170629, 1.547676, 0.2081261, 1, 0, 0.7921569, 1,
1.176222, 0.1150916, 1.483354, 1, 0, 0.7843137, 1,
1.18871, 0.04146904, 1.173199, 1, 0, 0.7803922, 1,
1.189429, 0.5114484, 2.419239, 1, 0, 0.772549, 1,
1.198597, 2.035145, 0.6749678, 1, 0, 0.7686275, 1,
1.201821, -1.314512, 1.77118, 1, 0, 0.7607843, 1,
1.204652, -1.124592, 2.960892, 1, 0, 0.7568628, 1,
1.205746, -0.1582659, 1.534284, 1, 0, 0.7490196, 1,
1.20576, 0.5798195, 1.938845, 1, 0, 0.7450981, 1,
1.210801, -1.04278, 2.61583, 1, 0, 0.7372549, 1,
1.217835, -0.01157843, 3.180127, 1, 0, 0.7333333, 1,
1.223241, -1.989864, 0.7481108, 1, 0, 0.7254902, 1,
1.228067, -0.6833791, 1.91896, 1, 0, 0.7215686, 1,
1.230935, 0.3362718, 1.174062, 1, 0, 0.7137255, 1,
1.231966, -1.258974, 1.979237, 1, 0, 0.7098039, 1,
1.234311, -0.4825234, 1.555456, 1, 0, 0.7019608, 1,
1.235042, -0.7534421, 2.453429, 1, 0, 0.6941177, 1,
1.248241, -0.07930701, 1.535232, 1, 0, 0.6901961, 1,
1.2564, 1.503866, 1.287488, 1, 0, 0.682353, 1,
1.261904, 0.4997313, 1.037487, 1, 0, 0.6784314, 1,
1.270587, -0.610521, 1.371985, 1, 0, 0.6705883, 1,
1.274896, 0.5445654, 1.82412, 1, 0, 0.6666667, 1,
1.275767, 0.2499935, 1.464027, 1, 0, 0.6588235, 1,
1.276855, 1.922766, 1.114581, 1, 0, 0.654902, 1,
1.298118, 0.5683417, 0.2851743, 1, 0, 0.6470588, 1,
1.320912, -1.396449, 2.786494, 1, 0, 0.6431373, 1,
1.322719, -1.006013, 3.978507, 1, 0, 0.6352941, 1,
1.332931, 0.5042105, 2.594168, 1, 0, 0.6313726, 1,
1.335465, 1.058379, -0.7475759, 1, 0, 0.6235294, 1,
1.337005, 0.24925, 0.2549486, 1, 0, 0.6196079, 1,
1.345382, -1.15701, 2.734934, 1, 0, 0.6117647, 1,
1.348353, 1.624286, 1.006194, 1, 0, 0.6078432, 1,
1.359448, 0.9565339, 0.8510393, 1, 0, 0.6, 1,
1.361431, 0.4377856, 1.405287, 1, 0, 0.5921569, 1,
1.365191, 0.0677167, 1.370414, 1, 0, 0.5882353, 1,
1.373708, -1.743198, 3.608114, 1, 0, 0.5803922, 1,
1.38957, 0.02288814, 1.617459, 1, 0, 0.5764706, 1,
1.391926, -0.07043263, 2.104997, 1, 0, 0.5686275, 1,
1.394358, -1.026729, 2.746494, 1, 0, 0.5647059, 1,
1.39944, 1.453905, 1.138367, 1, 0, 0.5568628, 1,
1.401551, 1.212242, -0.06952972, 1, 0, 0.5529412, 1,
1.407774, -0.8420414, 3.140255, 1, 0, 0.5450981, 1,
1.40878, -1.716151, 2.862265, 1, 0, 0.5411765, 1,
1.416811, 0.4908972, 0.2364064, 1, 0, 0.5333334, 1,
1.418918, -0.2335051, 1.945329, 1, 0, 0.5294118, 1,
1.424296, 0.08393627, 2.577092, 1, 0, 0.5215687, 1,
1.443365, -1.250375, 3.326306, 1, 0, 0.5176471, 1,
1.451635, 0.7879531, 2.047184, 1, 0, 0.509804, 1,
1.453042, -0.8685284, 2.037506, 1, 0, 0.5058824, 1,
1.454102, -0.1760812, 3.299255, 1, 0, 0.4980392, 1,
1.45741, 0.2563246, 1.924197, 1, 0, 0.4901961, 1,
1.470238, 0.6434854, 1.180563, 1, 0, 0.4862745, 1,
1.470571, -1.188658, 1.241712, 1, 0, 0.4784314, 1,
1.475574, 0.1926378, 1.908778, 1, 0, 0.4745098, 1,
1.480753, 1.818287, -1.468736, 1, 0, 0.4666667, 1,
1.484156, 1.245215, 0.7511532, 1, 0, 0.4627451, 1,
1.487797, 0.5180271, 0.9313452, 1, 0, 0.454902, 1,
1.496107, -1.042696, 2.312672, 1, 0, 0.4509804, 1,
1.503867, 0.1940346, 1.872149, 1, 0, 0.4431373, 1,
1.511578, 1.260194, 1.801528, 1, 0, 0.4392157, 1,
1.51543, -3.21783, 2.95795, 1, 0, 0.4313726, 1,
1.525882, 2.255673, 0.2915431, 1, 0, 0.427451, 1,
1.532118, 0.1119294, -0.1495046, 1, 0, 0.4196078, 1,
1.53387, -0.2858142, 0.7746856, 1, 0, 0.4156863, 1,
1.535664, 1.73807, 1.01563, 1, 0, 0.4078431, 1,
1.537356, 1.087644, 1.029506, 1, 0, 0.4039216, 1,
1.538976, -1.64293, 1.478365, 1, 0, 0.3960784, 1,
1.539915, 0.562495, 0.3264595, 1, 0, 0.3882353, 1,
1.540447, 0.7606429, 2.062766, 1, 0, 0.3843137, 1,
1.551467, -0.7463142, 3.005465, 1, 0, 0.3764706, 1,
1.554331, -0.4608515, 2.680685, 1, 0, 0.372549, 1,
1.570839, 0.9805551, 1.152215, 1, 0, 0.3647059, 1,
1.588796, 1.184985, -0.03565929, 1, 0, 0.3607843, 1,
1.593823, -1.040652, 1.68718, 1, 0, 0.3529412, 1,
1.619273, -0.1619552, 0.8576406, 1, 0, 0.3490196, 1,
1.627556, 0.958452, 1.304202, 1, 0, 0.3411765, 1,
1.63033, 0.2189234, 1.351621, 1, 0, 0.3372549, 1,
1.633499, 0.6203482, 0.07465263, 1, 0, 0.3294118, 1,
1.643504, -0.3189101, 0.7320772, 1, 0, 0.3254902, 1,
1.643855, -0.4850437, 1.144469, 1, 0, 0.3176471, 1,
1.644936, 0.2991842, 4.699332, 1, 0, 0.3137255, 1,
1.660018, -0.541795, 2.260931, 1, 0, 0.3058824, 1,
1.661048, -0.02626154, 1.328377, 1, 0, 0.2980392, 1,
1.663274, -0.09306932, 0.6776434, 1, 0, 0.2941177, 1,
1.677328, 0.319855, 1.450937, 1, 0, 0.2862745, 1,
1.690532, -1.016148, 3.570347, 1, 0, 0.282353, 1,
1.691454, 0.4586193, 1.910441, 1, 0, 0.2745098, 1,
1.707152, -0.6412391, 3.156086, 1, 0, 0.2705882, 1,
1.708723, 0.9179788, 1.008879, 1, 0, 0.2627451, 1,
1.722637, 0.9434808, 3.405811, 1, 0, 0.2588235, 1,
1.724345, -1.407999, 2.801622, 1, 0, 0.2509804, 1,
1.727995, 0.01411231, 1.171769, 1, 0, 0.2470588, 1,
1.754018, 0.6160508, 1.068313, 1, 0, 0.2392157, 1,
1.766213, -0.4000034, 0.7268201, 1, 0, 0.2352941, 1,
1.814487, 0.1667176, 1.639883, 1, 0, 0.227451, 1,
1.825578, -0.5714352, 1.332264, 1, 0, 0.2235294, 1,
1.827758, -0.2782109, 0.6151573, 1, 0, 0.2156863, 1,
1.841496, -1.208513, 1.945819, 1, 0, 0.2117647, 1,
1.870652, -0.5812948, 0.8181813, 1, 0, 0.2039216, 1,
1.882453, -0.2110071, -0.08666364, 1, 0, 0.1960784, 1,
1.889137, 0.07230835, 1.669665, 1, 0, 0.1921569, 1,
1.927033, 1.606298, 1.887589, 1, 0, 0.1843137, 1,
1.932699, -0.5504334, 1.255269, 1, 0, 0.1803922, 1,
1.936706, 0.2104147, 2.314286, 1, 0, 0.172549, 1,
1.941542, 0.05132955, 3.340588, 1, 0, 0.1686275, 1,
1.963791, -0.7846507, 2.647787, 1, 0, 0.1607843, 1,
1.989243, -1.04829, 0.3194285, 1, 0, 0.1568628, 1,
2.002676, -1.063545, 1.564861, 1, 0, 0.1490196, 1,
2.008721, -0.06662495, 2.133734, 1, 0, 0.145098, 1,
2.010467, -0.07677992, 1.314785, 1, 0, 0.1372549, 1,
2.017528, 0.03805447, 1.164526, 1, 0, 0.1333333, 1,
2.018492, -0.870104, 3.379868, 1, 0, 0.1254902, 1,
2.019757, 0.983176, 1.218038, 1, 0, 0.1215686, 1,
2.021355, 1.346466, 1.099693, 1, 0, 0.1137255, 1,
2.046536, 0.004052508, 0.9642056, 1, 0, 0.1098039, 1,
2.04865, 0.1120074, 0.8990209, 1, 0, 0.1019608, 1,
2.082828, -1.638383, 1.978044, 1, 0, 0.09411765, 1,
2.108244, -0.4463325, 0.8423482, 1, 0, 0.09019608, 1,
2.150345, -0.3207016, 2.489784, 1, 0, 0.08235294, 1,
2.176267, 0.3746785, 1.048893, 1, 0, 0.07843138, 1,
2.217422, 0.49889, 1.427541, 1, 0, 0.07058824, 1,
2.217599, -0.3985086, 2.391477, 1, 0, 0.06666667, 1,
2.245227, 0.8677487, 0.6470252, 1, 0, 0.05882353, 1,
2.254422, -1.451394, 2.1847, 1, 0, 0.05490196, 1,
2.255843, -0.0105793, 1.640854, 1, 0, 0.04705882, 1,
2.350345, -0.6569095, 2.222226, 1, 0, 0.04313726, 1,
2.392524, -0.6794794, 2.824176, 1, 0, 0.03529412, 1,
2.513686, -1.955827, 0.4345312, 1, 0, 0.03137255, 1,
2.593353, 0.3909894, 1.314169, 1, 0, 0.02352941, 1,
2.820639, 0.4946009, 1.145797, 1, 0, 0.01960784, 1,
2.957993, -0.8846515, 1.763999, 1, 0, 0.01176471, 1,
3.375695, 1.308842, 1.855183, 1, 0, 0.007843138, 1
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
0.1144251, -4.32907, -8.218151, 0, -0.5, 0.5, 0.5,
0.1144251, -4.32907, -8.218151, 1, -0.5, 0.5, 0.5,
0.1144251, -4.32907, -8.218151, 1, 1.5, 0.5, 0.5,
0.1144251, -4.32907, -8.218151, 0, 1.5, 0.5, 0.5
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
-4.252415, 0.06016219, -8.218151, 0, -0.5, 0.5, 0.5,
-4.252415, 0.06016219, -8.218151, 1, -0.5, 0.5, 0.5,
-4.252415, 0.06016219, -8.218151, 1, 1.5, 0.5, 0.5,
-4.252415, 0.06016219, -8.218151, 0, 1.5, 0.5, 0.5
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
-4.252415, -4.32907, -0.5605347, 0, -0.5, 0.5, 0.5,
-4.252415, -4.32907, -0.5605347, 1, -0.5, 0.5, 0.5,
-4.252415, -4.32907, -0.5605347, 1, 1.5, 0.5, 0.5,
-4.252415, -4.32907, -0.5605347, 0, 1.5, 0.5, 0.5
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
-3, -3.31617, -6.451009,
3, -3.31617, -6.451009,
-3, -3.31617, -6.451009,
-3, -3.484987, -6.745533,
-2, -3.31617, -6.451009,
-2, -3.484987, -6.745533,
-1, -3.31617, -6.451009,
-1, -3.484987, -6.745533,
0, -3.31617, -6.451009,
0, -3.484987, -6.745533,
1, -3.31617, -6.451009,
1, -3.484987, -6.745533,
2, -3.31617, -6.451009,
2, -3.484987, -6.745533,
3, -3.31617, -6.451009,
3, -3.484987, -6.745533
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
-3, -3.82262, -7.33458, 0, -0.5, 0.5, 0.5,
-3, -3.82262, -7.33458, 1, -0.5, 0.5, 0.5,
-3, -3.82262, -7.33458, 1, 1.5, 0.5, 0.5,
-3, -3.82262, -7.33458, 0, 1.5, 0.5, 0.5,
-2, -3.82262, -7.33458, 0, -0.5, 0.5, 0.5,
-2, -3.82262, -7.33458, 1, -0.5, 0.5, 0.5,
-2, -3.82262, -7.33458, 1, 1.5, 0.5, 0.5,
-2, -3.82262, -7.33458, 0, 1.5, 0.5, 0.5,
-1, -3.82262, -7.33458, 0, -0.5, 0.5, 0.5,
-1, -3.82262, -7.33458, 1, -0.5, 0.5, 0.5,
-1, -3.82262, -7.33458, 1, 1.5, 0.5, 0.5,
-1, -3.82262, -7.33458, 0, 1.5, 0.5, 0.5,
0, -3.82262, -7.33458, 0, -0.5, 0.5, 0.5,
0, -3.82262, -7.33458, 1, -0.5, 0.5, 0.5,
0, -3.82262, -7.33458, 1, 1.5, 0.5, 0.5,
0, -3.82262, -7.33458, 0, 1.5, 0.5, 0.5,
1, -3.82262, -7.33458, 0, -0.5, 0.5, 0.5,
1, -3.82262, -7.33458, 1, -0.5, 0.5, 0.5,
1, -3.82262, -7.33458, 1, 1.5, 0.5, 0.5,
1, -3.82262, -7.33458, 0, 1.5, 0.5, 0.5,
2, -3.82262, -7.33458, 0, -0.5, 0.5, 0.5,
2, -3.82262, -7.33458, 1, -0.5, 0.5, 0.5,
2, -3.82262, -7.33458, 1, 1.5, 0.5, 0.5,
2, -3.82262, -7.33458, 0, 1.5, 0.5, 0.5,
3, -3.82262, -7.33458, 0, -0.5, 0.5, 0.5,
3, -3.82262, -7.33458, 1, -0.5, 0.5, 0.5,
3, -3.82262, -7.33458, 1, 1.5, 0.5, 0.5,
3, -3.82262, -7.33458, 0, 1.5, 0.5, 0.5
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
-3.244683, -3, -6.451009,
-3.244683, 3, -6.451009,
-3.244683, -3, -6.451009,
-3.412638, -3, -6.745533,
-3.244683, -2, -6.451009,
-3.412638, -2, -6.745533,
-3.244683, -1, -6.451009,
-3.412638, -1, -6.745533,
-3.244683, 0, -6.451009,
-3.412638, 0, -6.745533,
-3.244683, 1, -6.451009,
-3.412638, 1, -6.745533,
-3.244683, 2, -6.451009,
-3.412638, 2, -6.745533,
-3.244683, 3, -6.451009,
-3.412638, 3, -6.745533
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
-3.748549, -3, -7.33458, 0, -0.5, 0.5, 0.5,
-3.748549, -3, -7.33458, 1, -0.5, 0.5, 0.5,
-3.748549, -3, -7.33458, 1, 1.5, 0.5, 0.5,
-3.748549, -3, -7.33458, 0, 1.5, 0.5, 0.5,
-3.748549, -2, -7.33458, 0, -0.5, 0.5, 0.5,
-3.748549, -2, -7.33458, 1, -0.5, 0.5, 0.5,
-3.748549, -2, -7.33458, 1, 1.5, 0.5, 0.5,
-3.748549, -2, -7.33458, 0, 1.5, 0.5, 0.5,
-3.748549, -1, -7.33458, 0, -0.5, 0.5, 0.5,
-3.748549, -1, -7.33458, 1, -0.5, 0.5, 0.5,
-3.748549, -1, -7.33458, 1, 1.5, 0.5, 0.5,
-3.748549, -1, -7.33458, 0, 1.5, 0.5, 0.5,
-3.748549, 0, -7.33458, 0, -0.5, 0.5, 0.5,
-3.748549, 0, -7.33458, 1, -0.5, 0.5, 0.5,
-3.748549, 0, -7.33458, 1, 1.5, 0.5, 0.5,
-3.748549, 0, -7.33458, 0, 1.5, 0.5, 0.5,
-3.748549, 1, -7.33458, 0, -0.5, 0.5, 0.5,
-3.748549, 1, -7.33458, 1, -0.5, 0.5, 0.5,
-3.748549, 1, -7.33458, 1, 1.5, 0.5, 0.5,
-3.748549, 1, -7.33458, 0, 1.5, 0.5, 0.5,
-3.748549, 2, -7.33458, 0, -0.5, 0.5, 0.5,
-3.748549, 2, -7.33458, 1, -0.5, 0.5, 0.5,
-3.748549, 2, -7.33458, 1, 1.5, 0.5, 0.5,
-3.748549, 2, -7.33458, 0, 1.5, 0.5, 0.5,
-3.748549, 3, -7.33458, 0, -0.5, 0.5, 0.5,
-3.748549, 3, -7.33458, 1, -0.5, 0.5, 0.5,
-3.748549, 3, -7.33458, 1, 1.5, 0.5, 0.5,
-3.748549, 3, -7.33458, 0, 1.5, 0.5, 0.5
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
-3.244683, -3.31617, -6,
-3.244683, -3.31617, 4,
-3.244683, -3.31617, -6,
-3.412638, -3.484987, -6,
-3.244683, -3.31617, -4,
-3.412638, -3.484987, -4,
-3.244683, -3.31617, -2,
-3.412638, -3.484987, -2,
-3.244683, -3.31617, 0,
-3.412638, -3.484987, 0,
-3.244683, -3.31617, 2,
-3.412638, -3.484987, 2,
-3.244683, -3.31617, 4,
-3.412638, -3.484987, 4
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
-3.748549, -3.82262, -6, 0, -0.5, 0.5, 0.5,
-3.748549, -3.82262, -6, 1, -0.5, 0.5, 0.5,
-3.748549, -3.82262, -6, 1, 1.5, 0.5, 0.5,
-3.748549, -3.82262, -6, 0, 1.5, 0.5, 0.5,
-3.748549, -3.82262, -4, 0, -0.5, 0.5, 0.5,
-3.748549, -3.82262, -4, 1, -0.5, 0.5, 0.5,
-3.748549, -3.82262, -4, 1, 1.5, 0.5, 0.5,
-3.748549, -3.82262, -4, 0, 1.5, 0.5, 0.5,
-3.748549, -3.82262, -2, 0, -0.5, 0.5, 0.5,
-3.748549, -3.82262, -2, 1, -0.5, 0.5, 0.5,
-3.748549, -3.82262, -2, 1, 1.5, 0.5, 0.5,
-3.748549, -3.82262, -2, 0, 1.5, 0.5, 0.5,
-3.748549, -3.82262, 0, 0, -0.5, 0.5, 0.5,
-3.748549, -3.82262, 0, 1, -0.5, 0.5, 0.5,
-3.748549, -3.82262, 0, 1, 1.5, 0.5, 0.5,
-3.748549, -3.82262, 0, 0, 1.5, 0.5, 0.5,
-3.748549, -3.82262, 2, 0, -0.5, 0.5, 0.5,
-3.748549, -3.82262, 2, 1, -0.5, 0.5, 0.5,
-3.748549, -3.82262, 2, 1, 1.5, 0.5, 0.5,
-3.748549, -3.82262, 2, 0, 1.5, 0.5, 0.5,
-3.748549, -3.82262, 4, 0, -0.5, 0.5, 0.5,
-3.748549, -3.82262, 4, 1, -0.5, 0.5, 0.5,
-3.748549, -3.82262, 4, 1, 1.5, 0.5, 0.5,
-3.748549, -3.82262, 4, 0, 1.5, 0.5, 0.5
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
-3.244683, -3.31617, -6.451009,
-3.244683, 3.436494, -6.451009,
-3.244683, -3.31617, 5.32994,
-3.244683, 3.436494, 5.32994,
-3.244683, -3.31617, -6.451009,
-3.244683, -3.31617, 5.32994,
-3.244683, 3.436494, -6.451009,
-3.244683, 3.436494, 5.32994,
-3.244683, -3.31617, -6.451009,
3.473533, -3.31617, -6.451009,
-3.244683, -3.31617, 5.32994,
3.473533, -3.31617, 5.32994,
-3.244683, 3.436494, -6.451009,
3.473533, 3.436494, -6.451009,
-3.244683, 3.436494, 5.32994,
3.473533, 3.436494, 5.32994,
3.473533, -3.31617, -6.451009,
3.473533, 3.436494, -6.451009,
3.473533, -3.31617, 5.32994,
3.473533, 3.436494, 5.32994,
3.473533, -3.31617, -6.451009,
3.473533, -3.31617, 5.32994,
3.473533, 3.436494, -6.451009,
3.473533, 3.436494, 5.32994
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
gl.viewport(0, 0, 256, 256);
gl.scissor(0, 0, 256, 256);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 8.089826;
var distance = 35.99255;
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
mvMatrix.translate( -0.1144251, -0.06016219, 0.5605347 );
mvMatrix.scale( 1.301965, 1.295323, 0.7424596 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.99255);
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
gl.uniform2f( textScaleLoc9, 0.002929688, 0.002929688);
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
gl.uniform2f( textScaleLoc10, 0.002929688, 0.002929688);
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
gl.uniform2f( textScaleLoc11, 0.002929688, 0.002929688);
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
gl.uniform2f( textScaleLoc13, 0.002929688, 0.002929688);
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
gl.uniform2f( textScaleLoc15, 0.002929688, 0.002929688);
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
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.002929688, 0.002929688);
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
1: 256
};
var vpHeights = {
1: 256
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 256 && 0 <= coords.y && coords.y <= 256) return(1);
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


