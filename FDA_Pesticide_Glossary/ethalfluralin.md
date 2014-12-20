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
-3.007723, 1.097553, -2.347524, 1, 0, 0, 1,
-2.881874, -0.9247227, -0.5564809, 1, 0.007843138, 0, 1,
-2.779934, -0.6685034, -0.8022544, 1, 0.01176471, 0, 1,
-2.767446, -0.3716973, -2.802649, 1, 0.01960784, 0, 1,
-2.685494, -0.6835344, -1.223171, 1, 0.02352941, 0, 1,
-2.628446, 0.195018, -0.5898653, 1, 0.03137255, 0, 1,
-2.565861, -0.7167937, -1.476497, 1, 0.03529412, 0, 1,
-2.485774, 0.02959871, -2.124775, 1, 0.04313726, 0, 1,
-2.255085, -0.7669899, -5.487061, 1, 0.04705882, 0, 1,
-2.250388, 2.914461, -0.6075342, 1, 0.05490196, 0, 1,
-2.191187, -0.3945177, -3.635731, 1, 0.05882353, 0, 1,
-2.187273, -0.02472766, -3.56598, 1, 0.06666667, 0, 1,
-2.173748, -1.108049, -3.803945, 1, 0.07058824, 0, 1,
-2.171539, -0.99672, -1.604685, 1, 0.07843138, 0, 1,
-2.133916, -0.8732267, -2.769013, 1, 0.08235294, 0, 1,
-2.101628, 0.4519671, -0.8242271, 1, 0.09019608, 0, 1,
-2.070747, -0.7458243, -2.683867, 1, 0.09411765, 0, 1,
-2.051462, -0.04807863, 0.4938806, 1, 0.1019608, 0, 1,
-2.026124, -0.4136767, -1.871222, 1, 0.1098039, 0, 1,
-2.012409, -0.1059509, 0.2023674, 1, 0.1137255, 0, 1,
-1.996855, -1.599373, -2.455531, 1, 0.1215686, 0, 1,
-1.995734, 1.048794, -2.087618, 1, 0.1254902, 0, 1,
-1.985056, -0.08055087, -1.141265, 1, 0.1333333, 0, 1,
-1.936048, 0.1805804, -0.8209067, 1, 0.1372549, 0, 1,
-1.930638, 0.1430489, -3.498317, 1, 0.145098, 0, 1,
-1.926096, 0.1221102, -1.923895, 1, 0.1490196, 0, 1,
-1.914333, -0.6891328, -1.307133, 1, 0.1568628, 0, 1,
-1.879205, -3.16422, -4.215038, 1, 0.1607843, 0, 1,
-1.874655, 0.7325567, -1.264166, 1, 0.1686275, 0, 1,
-1.87052, -1.480031, -0.8548473, 1, 0.172549, 0, 1,
-1.853644, 0.4886208, -2.472054, 1, 0.1803922, 0, 1,
-1.846442, 0.3046269, -0.593765, 1, 0.1843137, 0, 1,
-1.819493, 0.1280494, -0.4129743, 1, 0.1921569, 0, 1,
-1.80936, 1.517642, -1.692858, 1, 0.1960784, 0, 1,
-1.789645, -1.678117, -0.079294, 1, 0.2039216, 0, 1,
-1.778388, -1.583644, -3.206875, 1, 0.2117647, 0, 1,
-1.764814, 0.4227396, 0.1178079, 1, 0.2156863, 0, 1,
-1.759084, 0.6215495, -1.424909, 1, 0.2235294, 0, 1,
-1.732059, -0.7604219, -0.5237599, 1, 0.227451, 0, 1,
-1.729858, -0.8428766, -0.5632408, 1, 0.2352941, 0, 1,
-1.706455, 1.431114, -1.067827, 1, 0.2392157, 0, 1,
-1.704, -0.08098527, -2.171432, 1, 0.2470588, 0, 1,
-1.702557, -0.3371952, -2.910907, 1, 0.2509804, 0, 1,
-1.69276, -2.013525, -2.803396, 1, 0.2588235, 0, 1,
-1.688147, -0.4552281, -3.842656, 1, 0.2627451, 0, 1,
-1.684439, -1.913703, -3.043458, 1, 0.2705882, 0, 1,
-1.663012, 1.494693, -1.155331, 1, 0.2745098, 0, 1,
-1.654143, -1.672961, -1.073255, 1, 0.282353, 0, 1,
-1.613925, 0.3742605, -0.9127138, 1, 0.2862745, 0, 1,
-1.605438, -1.465431, -3.224442, 1, 0.2941177, 0, 1,
-1.596256, 1.150173, -2.55196, 1, 0.3019608, 0, 1,
-1.593866, -1.140615, -3.071767, 1, 0.3058824, 0, 1,
-1.593422, 1.046408, -0.8188781, 1, 0.3137255, 0, 1,
-1.588688, -0.6652007, -2.29916, 1, 0.3176471, 0, 1,
-1.575776, 0.2179302, -1.012898, 1, 0.3254902, 0, 1,
-1.569299, -0.3038161, -1.61838, 1, 0.3294118, 0, 1,
-1.552158, -0.6301386, -0.5859768, 1, 0.3372549, 0, 1,
-1.540196, 0.6563172, -2.345115, 1, 0.3411765, 0, 1,
-1.533786, -0.3705921, -1.531114, 1, 0.3490196, 0, 1,
-1.521259, -1.314884, -0.9226339, 1, 0.3529412, 0, 1,
-1.518994, 1.635309, 1.343155, 1, 0.3607843, 0, 1,
-1.512803, -0.2379702, -1.585618, 1, 0.3647059, 0, 1,
-1.505815, 0.7002078, -1.955456, 1, 0.372549, 0, 1,
-1.498962, 1.479906, -1.958131, 1, 0.3764706, 0, 1,
-1.494934, 1.073963, 0.1980251, 1, 0.3843137, 0, 1,
-1.485825, 0.6638659, -1.944025, 1, 0.3882353, 0, 1,
-1.481892, 0.3287688, -1.18057, 1, 0.3960784, 0, 1,
-1.480893, 0.747936, -2.326652, 1, 0.4039216, 0, 1,
-1.478503, -0.6964642, -1.066894, 1, 0.4078431, 0, 1,
-1.477877, 0.1444104, -1.943661, 1, 0.4156863, 0, 1,
-1.471899, 0.4405803, -0.1452743, 1, 0.4196078, 0, 1,
-1.46296, 1.390971, 1.181512, 1, 0.427451, 0, 1,
-1.459564, 0.3325214, -0.442798, 1, 0.4313726, 0, 1,
-1.458118, -0.2935821, -0.9333847, 1, 0.4392157, 0, 1,
-1.452726, -0.2326456, -2.283982, 1, 0.4431373, 0, 1,
-1.438292, -1.093412, -5.278961, 1, 0.4509804, 0, 1,
-1.436424, -0.05934642, -2.028225, 1, 0.454902, 0, 1,
-1.431946, -1.030835, -2.755177, 1, 0.4627451, 0, 1,
-1.421453, 0.4250119, 0.2400805, 1, 0.4666667, 0, 1,
-1.413087, 0.7269621, 0.7339219, 1, 0.4745098, 0, 1,
-1.412649, 1.343652, -0.5171339, 1, 0.4784314, 0, 1,
-1.410224, -1.90247, -4.277842, 1, 0.4862745, 0, 1,
-1.408188, -0.7578509, -1.431201, 1, 0.4901961, 0, 1,
-1.404449, -0.6846773, -2.531743, 1, 0.4980392, 0, 1,
-1.403481, 0.01306148, -2.007972, 1, 0.5058824, 0, 1,
-1.400292, 2.519114, -0.04173695, 1, 0.509804, 0, 1,
-1.390172, -1.192817, -3.626824, 1, 0.5176471, 0, 1,
-1.375897, -1.032576, -0.9250274, 1, 0.5215687, 0, 1,
-1.373294, 1.140618, -3.143258, 1, 0.5294118, 0, 1,
-1.367737, 0.8722321, -1.877055, 1, 0.5333334, 0, 1,
-1.357331, -1.216255, -2.564286, 1, 0.5411765, 0, 1,
-1.354465, -0.6711956, -2.663273, 1, 0.5450981, 0, 1,
-1.354226, 0.5546938, -0.8376523, 1, 0.5529412, 0, 1,
-1.352243, -0.3450557, -3.32321, 1, 0.5568628, 0, 1,
-1.350036, -0.3947162, -2.444022, 1, 0.5647059, 0, 1,
-1.344534, 0.1111723, -0.1965711, 1, 0.5686275, 0, 1,
-1.33613, -0.6783633, -3.485468, 1, 0.5764706, 0, 1,
-1.33058, -0.2542253, -2.690063, 1, 0.5803922, 0, 1,
-1.323521, -0.1142335, -2.18038, 1, 0.5882353, 0, 1,
-1.322178, 1.902254, -0.5746976, 1, 0.5921569, 0, 1,
-1.321105, 0.814221, -1.813843, 1, 0.6, 0, 1,
-1.315672, 0.05462299, -0.5135275, 1, 0.6078432, 0, 1,
-1.313242, -0.2333086, -2.418477, 1, 0.6117647, 0, 1,
-1.308348, 2.349616, -0.9285747, 1, 0.6196079, 0, 1,
-1.305432, -1.113968, -3.475437, 1, 0.6235294, 0, 1,
-1.304566, 0.5379165, -1.723965, 1, 0.6313726, 0, 1,
-1.295526, 0.8653043, -2.535587, 1, 0.6352941, 0, 1,
-1.294809, -0.4230605, -1.2961, 1, 0.6431373, 0, 1,
-1.292419, -1.158878, -2.08251, 1, 0.6470588, 0, 1,
-1.290564, -0.09563579, -1.377005, 1, 0.654902, 0, 1,
-1.289324, -0.2365724, -2.365551, 1, 0.6588235, 0, 1,
-1.288458, 1.102999, -0.3810328, 1, 0.6666667, 0, 1,
-1.279447, -0.1671623, -1.345217, 1, 0.6705883, 0, 1,
-1.279396, 0.5060357, -0.3812987, 1, 0.6784314, 0, 1,
-1.262905, -2.570941, -0.5947639, 1, 0.682353, 0, 1,
-1.261443, 1.453512, -0.5837732, 1, 0.6901961, 0, 1,
-1.260016, 0.493781, -1.293833, 1, 0.6941177, 0, 1,
-1.254871, -0.1029769, -3.910005, 1, 0.7019608, 0, 1,
-1.252574, -1.32251, -2.922385, 1, 0.7098039, 0, 1,
-1.247936, -0.2261062, -1.973493, 1, 0.7137255, 0, 1,
-1.244016, -0.7749703, -2.300498, 1, 0.7215686, 0, 1,
-1.240182, -0.3082312, -1.837438, 1, 0.7254902, 0, 1,
-1.228603, 0.09989583, -1.448453, 1, 0.7333333, 0, 1,
-1.222574, -0.3064604, -1.11357, 1, 0.7372549, 0, 1,
-1.221219, 1.427377, -1.063976, 1, 0.7450981, 0, 1,
-1.219984, -1.206005, -2.233337, 1, 0.7490196, 0, 1,
-1.219853, -1.082097, -2.541699, 1, 0.7568628, 0, 1,
-1.218853, -0.6658519, -1.49926, 1, 0.7607843, 0, 1,
-1.210265, -0.8909275, -2.041438, 1, 0.7686275, 0, 1,
-1.208151, -0.3466118, -1.569796, 1, 0.772549, 0, 1,
-1.186956, -0.4020379, -1.291803, 1, 0.7803922, 0, 1,
-1.181412, 1.756601, 0.6331604, 1, 0.7843137, 0, 1,
-1.174661, 0.770105, -1.231876, 1, 0.7921569, 0, 1,
-1.172654, 1.664639, -2.677789, 1, 0.7960784, 0, 1,
-1.169188, -1.253229, -1.672031, 1, 0.8039216, 0, 1,
-1.166803, -0.1613355, -1.990945, 1, 0.8117647, 0, 1,
-1.16193, 0.7029102, -3.717478, 1, 0.8156863, 0, 1,
-1.158354, 1.29034, -0.3859614, 1, 0.8235294, 0, 1,
-1.155864, 0.7107266, -0.1242382, 1, 0.827451, 0, 1,
-1.155603, 0.7748588, 0.6227676, 1, 0.8352941, 0, 1,
-1.14052, -0.768175, -3.17676, 1, 0.8392157, 0, 1,
-1.133509, 1.749597, 0.9410144, 1, 0.8470588, 0, 1,
-1.13209, -0.951777, -1.731225, 1, 0.8509804, 0, 1,
-1.126021, -1.574612, -2.80538, 1, 0.8588235, 0, 1,
-1.116117, -0.864006, 0.1954267, 1, 0.8627451, 0, 1,
-1.109824, 0.06172607, -1.965732, 1, 0.8705882, 0, 1,
-1.107408, 0.4556955, 0.3145748, 1, 0.8745098, 0, 1,
-1.098416, -1.320893, -2.342563, 1, 0.8823529, 0, 1,
-1.095947, 0.1494188, -0.478648, 1, 0.8862745, 0, 1,
-1.090711, -0.2694948, -1.332486, 1, 0.8941177, 0, 1,
-1.085064, -0.464543, -2.390925, 1, 0.8980392, 0, 1,
-1.084795, -1.170364, -2.367583, 1, 0.9058824, 0, 1,
-1.083636, -0.1441637, -1.210955, 1, 0.9137255, 0, 1,
-1.08115, -1.227799, -3.762707, 1, 0.9176471, 0, 1,
-1.079181, 0.155628, -0.7734348, 1, 0.9254902, 0, 1,
-1.068961, -0.4045611, -3.113176, 1, 0.9294118, 0, 1,
-1.058364, -0.6446628, -2.545895, 1, 0.9372549, 0, 1,
-1.055019, 1.026208, -2.129764, 1, 0.9411765, 0, 1,
-1.053727, 0.653, -1.511371, 1, 0.9490196, 0, 1,
-1.04905, -0.3954784, -2.129209, 1, 0.9529412, 0, 1,
-1.041194, -0.8610398, -2.329088, 1, 0.9607843, 0, 1,
-1.036815, 1.350839, -0.8386681, 1, 0.9647059, 0, 1,
-1.034093, -0.5163533, -0.8106294, 1, 0.972549, 0, 1,
-1.031637, -0.6397009, -1.341964, 1, 0.9764706, 0, 1,
-1.027198, 0.879986, -0.8906998, 1, 0.9843137, 0, 1,
-1.01961, -0.8135027, -3.10907, 1, 0.9882353, 0, 1,
-1.018101, -0.1305715, -2.315975, 1, 0.9960784, 0, 1,
-1.017245, 0.6521003, -0.397565, 0.9960784, 1, 0, 1,
-0.9937077, 1.216756, -0.1104553, 0.9921569, 1, 0, 1,
-0.9906934, 1.404585, -2.028338, 0.9843137, 1, 0, 1,
-0.9705678, 0.5150837, -2.359065, 0.9803922, 1, 0, 1,
-0.9701152, -1.375533, -1.614039, 0.972549, 1, 0, 1,
-0.9689404, -2.399752, -4.933867, 0.9686275, 1, 0, 1,
-0.9611688, 0.7173426, -3.025094, 0.9607843, 1, 0, 1,
-0.960896, 0.2564512, -1.843023, 0.9568627, 1, 0, 1,
-0.9608428, 1.449088, 2.065601, 0.9490196, 1, 0, 1,
-0.9578502, 1.189218, -1.121822, 0.945098, 1, 0, 1,
-0.9537158, -0.1500593, 0.004891044, 0.9372549, 1, 0, 1,
-0.9522606, -0.7961307, -3.023589, 0.9333333, 1, 0, 1,
-0.9486052, -0.9350861, -2.160643, 0.9254902, 1, 0, 1,
-0.9458082, 1.484383, -0.9674498, 0.9215686, 1, 0, 1,
-0.9423606, 0.07455215, -0.9643046, 0.9137255, 1, 0, 1,
-0.9410051, -0.1116121, -1.557111, 0.9098039, 1, 0, 1,
-0.9399866, -1.237549, -3.193724, 0.9019608, 1, 0, 1,
-0.9377405, 1.254316, -0.1533591, 0.8941177, 1, 0, 1,
-0.9351826, -0.9244477, -1.617812, 0.8901961, 1, 0, 1,
-0.9323397, -1.951082, -1.681785, 0.8823529, 1, 0, 1,
-0.9306069, 0.6404714, -2.158344, 0.8784314, 1, 0, 1,
-0.9221784, 0.8596326, -2.193039, 0.8705882, 1, 0, 1,
-0.9202799, 1.715524, -2.758362, 0.8666667, 1, 0, 1,
-0.9066796, -2.174212, -2.885208, 0.8588235, 1, 0, 1,
-0.9032115, 1.767652, -0.5270796, 0.854902, 1, 0, 1,
-0.9027603, 0.5265632, -3.117278, 0.8470588, 1, 0, 1,
-0.9006882, 0.6309023, -1.630851, 0.8431373, 1, 0, 1,
-0.8957723, 2.157719, -0.4298179, 0.8352941, 1, 0, 1,
-0.885659, 0.1585387, -1.102899, 0.8313726, 1, 0, 1,
-0.8786963, 0.8686457, -0.4333167, 0.8235294, 1, 0, 1,
-0.8762217, 0.6632741, -1.995398, 0.8196079, 1, 0, 1,
-0.875719, 0.4919047, -1.744077, 0.8117647, 1, 0, 1,
-0.8747011, -0.6102014, -2.757286, 0.8078431, 1, 0, 1,
-0.8723205, 0.5432729, -3.094958, 0.8, 1, 0, 1,
-0.8712335, 0.3264938, -2.082014, 0.7921569, 1, 0, 1,
-0.8643658, 1.560288, -1.482359, 0.7882353, 1, 0, 1,
-0.8627328, -0.5248169, -1.742948, 0.7803922, 1, 0, 1,
-0.8595397, 0.72655, -1.337494, 0.7764706, 1, 0, 1,
-0.8534148, -0.9865235, -4.030558, 0.7686275, 1, 0, 1,
-0.8499262, 0.2808042, -0.6626497, 0.7647059, 1, 0, 1,
-0.8454452, -0.5317999, -2.365918, 0.7568628, 1, 0, 1,
-0.8435376, -1.244926, -3.522506, 0.7529412, 1, 0, 1,
-0.8379851, -0.2766353, -3.150813, 0.7450981, 1, 0, 1,
-0.8311114, 0.6245279, 1.10094, 0.7411765, 1, 0, 1,
-0.8278053, -0.08121818, -1.374289, 0.7333333, 1, 0, 1,
-0.8213854, -0.6366084, -3.554808, 0.7294118, 1, 0, 1,
-0.8192868, -0.1785094, -2.488894, 0.7215686, 1, 0, 1,
-0.8154448, -0.1507074, -2.729764, 0.7176471, 1, 0, 1,
-0.8151368, 2.175291, 0.7249457, 0.7098039, 1, 0, 1,
-0.8123256, -1.288034, -2.417576, 0.7058824, 1, 0, 1,
-0.8118656, 0.8957506, -0.2589507, 0.6980392, 1, 0, 1,
-0.8059967, 0.9399226, 0.4068562, 0.6901961, 1, 0, 1,
-0.7955528, 0.08944202, -0.427907, 0.6862745, 1, 0, 1,
-0.7946589, -0.2094811, -1.759128, 0.6784314, 1, 0, 1,
-0.7888567, 0.9500288, 0.6236801, 0.6745098, 1, 0, 1,
-0.7864964, -1.186915, -3.254594, 0.6666667, 1, 0, 1,
-0.783932, 0.9374625, -0.8396105, 0.6627451, 1, 0, 1,
-0.7832674, 0.4201282, -2.298681, 0.654902, 1, 0, 1,
-0.7832038, 0.1200576, -0.08007909, 0.6509804, 1, 0, 1,
-0.7744412, -0.7802266, -2.550062, 0.6431373, 1, 0, 1,
-0.7669706, 2.363062, -1.213308, 0.6392157, 1, 0, 1,
-0.7545783, -1.038922, -3.927334, 0.6313726, 1, 0, 1,
-0.7453151, 0.06124304, -2.819199, 0.627451, 1, 0, 1,
-0.7448136, -1.163743, -2.613208, 0.6196079, 1, 0, 1,
-0.7401256, -0.6294226, -1.997562, 0.6156863, 1, 0, 1,
-0.737566, -0.5346627, -1.791949, 0.6078432, 1, 0, 1,
-0.7351752, -1.861843, -1.742013, 0.6039216, 1, 0, 1,
-0.7351024, -0.3368777, -1.412798, 0.5960785, 1, 0, 1,
-0.7343307, 0.2342887, -1.063692, 0.5882353, 1, 0, 1,
-0.7316262, 0.2607963, 0.4326364, 0.5843138, 1, 0, 1,
-0.7273261, 0.2160398, -1.640785, 0.5764706, 1, 0, 1,
-0.7177762, 0.6276603, -0.6401704, 0.572549, 1, 0, 1,
-0.7167156, -0.7603219, -2.220434, 0.5647059, 1, 0, 1,
-0.7165707, 0.1912542, -2.446859, 0.5607843, 1, 0, 1,
-0.7154533, 1.037018, -2.76829, 0.5529412, 1, 0, 1,
-0.7131287, -2.251262, -3.102976, 0.5490196, 1, 0, 1,
-0.7057666, -1.476249, -6.462844, 0.5411765, 1, 0, 1,
-0.7053429, 0.3423999, 0.576518, 0.5372549, 1, 0, 1,
-0.7004225, -0.1824009, 0.3210984, 0.5294118, 1, 0, 1,
-0.7002591, 1.287737, 1.307925, 0.5254902, 1, 0, 1,
-0.6980049, 0.4979293, -2.015187, 0.5176471, 1, 0, 1,
-0.6921186, -0.9903808, -0.6798389, 0.5137255, 1, 0, 1,
-0.691919, -0.3253669, -1.994495, 0.5058824, 1, 0, 1,
-0.6887763, 0.2133329, -1.029254, 0.5019608, 1, 0, 1,
-0.6864166, -0.5911266, -2.101588, 0.4941176, 1, 0, 1,
-0.6846749, -0.6650375, -0.8063909, 0.4862745, 1, 0, 1,
-0.6833273, -1.730783, -2.125771, 0.4823529, 1, 0, 1,
-0.679306, -1.196745, -1.505185, 0.4745098, 1, 0, 1,
-0.6756558, -0.1183621, -1.781491, 0.4705882, 1, 0, 1,
-0.6712142, 0.9594596, 0.9296792, 0.4627451, 1, 0, 1,
-0.6663358, 0.5988765, -1.303305, 0.4588235, 1, 0, 1,
-0.6662077, 0.9791816, 0.6884578, 0.4509804, 1, 0, 1,
-0.6632754, 0.2178158, -3.549347, 0.4470588, 1, 0, 1,
-0.6547673, 1.002878, -0.07041509, 0.4392157, 1, 0, 1,
-0.6525841, -1.191665, -3.055627, 0.4352941, 1, 0, 1,
-0.6511467, -0.09804607, -1.201972, 0.427451, 1, 0, 1,
-0.6501611, 0.4384176, -0.807434, 0.4235294, 1, 0, 1,
-0.6441324, -0.4356111, -4.098104, 0.4156863, 1, 0, 1,
-0.6405863, -1.610867, -3.427722, 0.4117647, 1, 0, 1,
-0.6404174, -0.954262, -2.950916, 0.4039216, 1, 0, 1,
-0.6402424, 0.2991391, -1.684151, 0.3960784, 1, 0, 1,
-0.6353846, -1.034124, -4.120757, 0.3921569, 1, 0, 1,
-0.6345894, -0.3974967, -3.343825, 0.3843137, 1, 0, 1,
-0.6343634, 0.4592096, -0.2311851, 0.3803922, 1, 0, 1,
-0.6287286, -0.5447795, -2.079647, 0.372549, 1, 0, 1,
-0.6186682, -1.525014, -2.574324, 0.3686275, 1, 0, 1,
-0.6178084, -0.8396887, -4.10884, 0.3607843, 1, 0, 1,
-0.6155237, 0.1945062, -2.237194, 0.3568628, 1, 0, 1,
-0.614222, -0.3490505, -1.347515, 0.3490196, 1, 0, 1,
-0.6141431, -2.815447, -3.458463, 0.345098, 1, 0, 1,
-0.61366, -0.157232, -2.019668, 0.3372549, 1, 0, 1,
-0.6132312, 0.3040699, -3.47669, 0.3333333, 1, 0, 1,
-0.6097369, 0.7669061, -0.7947347, 0.3254902, 1, 0, 1,
-0.6085976, -1.081179, -2.059902, 0.3215686, 1, 0, 1,
-0.6036626, 2.216632, -2.640341, 0.3137255, 1, 0, 1,
-0.6014537, -0.9612419, -3.098836, 0.3098039, 1, 0, 1,
-0.600134, -0.2296037, -1.303035, 0.3019608, 1, 0, 1,
-0.5994905, -1.520916, -1.78894, 0.2941177, 1, 0, 1,
-0.5955902, 0.1259858, -1.536155, 0.2901961, 1, 0, 1,
-0.5916151, -0.4516137, -1.93649, 0.282353, 1, 0, 1,
-0.5871021, 0.2150211, -2.194, 0.2784314, 1, 0, 1,
-0.5846909, -0.06057284, -1.459489, 0.2705882, 1, 0, 1,
-0.5839172, -0.9133663, -1.484877, 0.2666667, 1, 0, 1,
-0.5816917, 1.038617, 0.02477938, 0.2588235, 1, 0, 1,
-0.5811114, -1.526276, -2.17441, 0.254902, 1, 0, 1,
-0.5808156, -0.4718119, -3.575239, 0.2470588, 1, 0, 1,
-0.5729049, 0.4617906, -1.336224, 0.2431373, 1, 0, 1,
-0.5723456, -1.134176, -3.809267, 0.2352941, 1, 0, 1,
-0.5700582, -1.429836, -2.304467, 0.2313726, 1, 0, 1,
-0.5698738, 0.008920711, -3.51389, 0.2235294, 1, 0, 1,
-0.5694731, -1.199769, -2.945302, 0.2196078, 1, 0, 1,
-0.5662639, 0.481791, -0.5859154, 0.2117647, 1, 0, 1,
-0.5643274, 1.675271, -0.9067178, 0.2078431, 1, 0, 1,
-0.5639597, -1.800345, -2.73285, 0.2, 1, 0, 1,
-0.5630942, -0.280718, -1.908834, 0.1921569, 1, 0, 1,
-0.5612716, -0.05354525, -0.24236, 0.1882353, 1, 0, 1,
-0.5606132, -1.370252, -3.042241, 0.1803922, 1, 0, 1,
-0.5580692, 0.1843032, -2.988924, 0.1764706, 1, 0, 1,
-0.5565228, 0.6981814, -1.28127, 0.1686275, 1, 0, 1,
-0.5561389, 1.193781, 0.1133533, 0.1647059, 1, 0, 1,
-0.5556946, 0.6000136, -0.6241452, 0.1568628, 1, 0, 1,
-0.5550278, 1.696619, -0.9101518, 0.1529412, 1, 0, 1,
-0.5505819, 1.931266, -0.1765154, 0.145098, 1, 0, 1,
-0.5485103, 0.6640772, -0.1219355, 0.1411765, 1, 0, 1,
-0.5484865, -0.8299118, -3.151888, 0.1333333, 1, 0, 1,
-0.5481921, -0.1781954, -1.184618, 0.1294118, 1, 0, 1,
-0.546086, -0.3786423, -1.060336, 0.1215686, 1, 0, 1,
-0.5321664, 0.9742525, -1.312098, 0.1176471, 1, 0, 1,
-0.5286151, -0.9054798, -4.148676, 0.1098039, 1, 0, 1,
-0.5268133, -0.3084228, -1.530298, 0.1058824, 1, 0, 1,
-0.5233462, -0.7358158, -4.52167, 0.09803922, 1, 0, 1,
-0.517724, 1.205416, 0.4388117, 0.09019608, 1, 0, 1,
-0.5173494, 0.4998744, -1.145984, 0.08627451, 1, 0, 1,
-0.5062978, -0.8396629, -1.391231, 0.07843138, 1, 0, 1,
-0.5049694, 0.2825754, -2.179438, 0.07450981, 1, 0, 1,
-0.5045111, -0.3521338, -1.991773, 0.06666667, 1, 0, 1,
-0.5042625, 1.185923, 0.6167943, 0.0627451, 1, 0, 1,
-0.5008473, -0.6414499, -3.287689, 0.05490196, 1, 0, 1,
-0.4989718, -1.309731, -3.590816, 0.05098039, 1, 0, 1,
-0.4754889, -0.4756268, -1.504654, 0.04313726, 1, 0, 1,
-0.4746712, -0.05965723, -2.116796, 0.03921569, 1, 0, 1,
-0.4732141, 1.416569, 1.945695, 0.03137255, 1, 0, 1,
-0.4725311, 0.637966, -0.2344455, 0.02745098, 1, 0, 1,
-0.4676741, -0.2131693, -2.580971, 0.01960784, 1, 0, 1,
-0.46589, -1.114188, -2.437316, 0.01568628, 1, 0, 1,
-0.461943, 1.532507, -1.706847, 0.007843138, 1, 0, 1,
-0.4567589, -0.808033, -4.260316, 0.003921569, 1, 0, 1,
-0.45559, -0.07893687, -1.462615, 0, 1, 0.003921569, 1,
-0.4527951, -0.501087, -3.656051, 0, 1, 0.01176471, 1,
-0.451669, 1.347023, -0.2915925, 0, 1, 0.01568628, 1,
-0.4516087, -1.517069, -2.300769, 0, 1, 0.02352941, 1,
-0.449235, 0.1912277, -1.314731, 0, 1, 0.02745098, 1,
-0.4484226, -0.4348621, -1.349428, 0, 1, 0.03529412, 1,
-0.4390885, -0.280026, -0.3370863, 0, 1, 0.03921569, 1,
-0.4385323, -2.080824, -4.172139, 0, 1, 0.04705882, 1,
-0.4366794, -1.357744, -3.701097, 0, 1, 0.05098039, 1,
-0.4359667, 0.9314911, -0.9030617, 0, 1, 0.05882353, 1,
-0.4347915, -0.9249887, -4.489687, 0, 1, 0.0627451, 1,
-0.4339783, -0.2690402, -1.421762, 0, 1, 0.07058824, 1,
-0.4305638, 0.2138341, -0.3457513, 0, 1, 0.07450981, 1,
-0.4260756, -0.06756931, -2.977654, 0, 1, 0.08235294, 1,
-0.4194446, -0.3352302, -2.984791, 0, 1, 0.08627451, 1,
-0.4178501, 0.7067106, 0.02304097, 0, 1, 0.09411765, 1,
-0.4156821, 0.8771461, -0.9435124, 0, 1, 0.1019608, 1,
-0.4098223, 1.708486, 1.745174, 0, 1, 0.1058824, 1,
-0.4044202, 0.7189793, -0.6986914, 0, 1, 0.1137255, 1,
-0.399141, 1.437405, -0.8690908, 0, 1, 0.1176471, 1,
-0.3960028, 1.215142, 0.5845888, 0, 1, 0.1254902, 1,
-0.3918613, -0.7893672, -3.45739, 0, 1, 0.1294118, 1,
-0.3916574, 0.3874356, -1.495726, 0, 1, 0.1372549, 1,
-0.3893224, 0.6588119, -0.288429, 0, 1, 0.1411765, 1,
-0.3825513, 1.089206, -0.1511637, 0, 1, 0.1490196, 1,
-0.3708512, -0.6988372, -1.458674, 0, 1, 0.1529412, 1,
-0.3708174, 0.1908667, -2.78385, 0, 1, 0.1607843, 1,
-0.3690061, 2.034378, -0.1627567, 0, 1, 0.1647059, 1,
-0.3637274, 0.748459, -1.227414, 0, 1, 0.172549, 1,
-0.358332, -0.1356908, -0.9551823, 0, 1, 0.1764706, 1,
-0.3562334, -0.07095599, -2.489861, 0, 1, 0.1843137, 1,
-0.3515078, 1.527218, -2.523198, 0, 1, 0.1882353, 1,
-0.3510768, 1.632362, -0.1294248, 0, 1, 0.1960784, 1,
-0.3500368, -1.564741, -2.351215, 0, 1, 0.2039216, 1,
-0.3430538, 0.5603268, -2.118085, 0, 1, 0.2078431, 1,
-0.3374845, -1.038287, -2.485037, 0, 1, 0.2156863, 1,
-0.3352269, -0.6011537, -2.142324, 0, 1, 0.2196078, 1,
-0.3337873, -0.7353618, -2.775111, 0, 1, 0.227451, 1,
-0.33368, -2.839214, -3.010906, 0, 1, 0.2313726, 1,
-0.3306463, 0.1913663, -1.431525, 0, 1, 0.2392157, 1,
-0.3265726, 0.3816237, 0.4220499, 0, 1, 0.2431373, 1,
-0.3227706, -0.4187696, -2.552759, 0, 1, 0.2509804, 1,
-0.3195012, -1.092123, -2.639223, 0, 1, 0.254902, 1,
-0.3194541, 0.3191856, -0.9257759, 0, 1, 0.2627451, 1,
-0.3165589, -0.07389417, -2.334256, 0, 1, 0.2666667, 1,
-0.3162631, 0.4546566, 1.020772, 0, 1, 0.2745098, 1,
-0.3100273, 0.5670497, -1.059781, 0, 1, 0.2784314, 1,
-0.3092131, -0.2037657, -2.886508, 0, 1, 0.2862745, 1,
-0.3079178, -0.8869591, -2.884917, 0, 1, 0.2901961, 1,
-0.3064731, -0.4170081, -2.765725, 0, 1, 0.2980392, 1,
-0.3047966, 1.001635, -1.770639, 0, 1, 0.3058824, 1,
-0.3028902, -0.0593944, -2.789913, 0, 1, 0.3098039, 1,
-0.3017456, -0.108684, -4.54544, 0, 1, 0.3176471, 1,
-0.3001254, -1.048434, -0.2861615, 0, 1, 0.3215686, 1,
-0.2947467, 0.07088245, -3.269848, 0, 1, 0.3294118, 1,
-0.2944295, -0.9099276, -2.98142, 0, 1, 0.3333333, 1,
-0.2900093, 0.0840239, -0.03305919, 0, 1, 0.3411765, 1,
-0.2871913, 0.8686089, -0.2656209, 0, 1, 0.345098, 1,
-0.286525, 0.5693291, -0.9854597, 0, 1, 0.3529412, 1,
-0.2847809, 1.647379, 0.8547844, 0, 1, 0.3568628, 1,
-0.2783392, -1.36947, -1.121301, 0, 1, 0.3647059, 1,
-0.2754445, -1.601546, -3.674261, 0, 1, 0.3686275, 1,
-0.2728402, -0.7851009, -2.480421, 0, 1, 0.3764706, 1,
-0.2721952, 0.4182656, 0.01850004, 0, 1, 0.3803922, 1,
-0.2698482, 0.6708686, -1.204679, 0, 1, 0.3882353, 1,
-0.2683442, -0.5030239, -2.325901, 0, 1, 0.3921569, 1,
-0.2632468, 0.02298358, 0.2418638, 0, 1, 0.4, 1,
-0.2604518, 0.4216973, -0.9647662, 0, 1, 0.4078431, 1,
-0.2589985, 0.4981121, -0.7714284, 0, 1, 0.4117647, 1,
-0.2570957, 1.660548, -1.082577, 0, 1, 0.4196078, 1,
-0.256723, 0.2083886, -0.4756493, 0, 1, 0.4235294, 1,
-0.2563902, 1.377633, 0.2737714, 0, 1, 0.4313726, 1,
-0.2544203, -0.4764051, -2.485245, 0, 1, 0.4352941, 1,
-0.254248, 0.5730563, -0.1601435, 0, 1, 0.4431373, 1,
-0.245591, 0.8269789, -1.840744, 0, 1, 0.4470588, 1,
-0.2439186, -0.08236223, -1.949977, 0, 1, 0.454902, 1,
-0.2413151, 0.9194124, 0.2977124, 0, 1, 0.4588235, 1,
-0.2362876, -0.06022273, -0.5203563, 0, 1, 0.4666667, 1,
-0.2351982, -0.9566395, -1.877757, 0, 1, 0.4705882, 1,
-0.2335618, 0.4241996, 1.374863, 0, 1, 0.4784314, 1,
-0.2327759, -1.158687, -3.007194, 0, 1, 0.4823529, 1,
-0.230833, -0.3940607, -2.763073, 0, 1, 0.4901961, 1,
-0.2294182, 0.3837884, -0.5883803, 0, 1, 0.4941176, 1,
-0.2218223, -1.372666, -4.17071, 0, 1, 0.5019608, 1,
-0.221776, -1.484823, -2.045878, 0, 1, 0.509804, 1,
-0.2213182, -0.4561868, -3.097964, 0, 1, 0.5137255, 1,
-0.212222, 0.1552349, -1.445114, 0, 1, 0.5215687, 1,
-0.2042806, -1.01303, -3.401215, 0, 1, 0.5254902, 1,
-0.2042223, 1.067166, -0.3698478, 0, 1, 0.5333334, 1,
-0.2029106, -0.313898, -3.595717, 0, 1, 0.5372549, 1,
-0.2020349, -0.001609314, -1.30376, 0, 1, 0.5450981, 1,
-0.2009299, 1.064953, 0.0521016, 0, 1, 0.5490196, 1,
-0.2008361, 0.7477502, -0.3325941, 0, 1, 0.5568628, 1,
-0.2004826, 0.2160643, -1.961514, 0, 1, 0.5607843, 1,
-0.1989848, -1.398166, -4.789107, 0, 1, 0.5686275, 1,
-0.198896, -1.376021, -2.233876, 0, 1, 0.572549, 1,
-0.1959812, 1.299062, -1.233871, 0, 1, 0.5803922, 1,
-0.1946437, -1.904873, -4.453632, 0, 1, 0.5843138, 1,
-0.1934307, 0.2169813, -0.5866255, 0, 1, 0.5921569, 1,
-0.1867898, -1.628888, -3.757474, 0, 1, 0.5960785, 1,
-0.1855889, -1.38229, -1.92398, 0, 1, 0.6039216, 1,
-0.184276, 1.009327, 0.5051754, 0, 1, 0.6117647, 1,
-0.1828667, 1.561372, 0.971853, 0, 1, 0.6156863, 1,
-0.1816093, 0.4109512, -0.1313096, 0, 1, 0.6235294, 1,
-0.1768846, 0.5532845, -0.9006565, 0, 1, 0.627451, 1,
-0.1764676, 0.7934673, -1.509731, 0, 1, 0.6352941, 1,
-0.1725246, 0.1937614, -1.440143, 0, 1, 0.6392157, 1,
-0.1696085, -0.4684053, -1.815724, 0, 1, 0.6470588, 1,
-0.1670951, -0.8835852, -5.609087, 0, 1, 0.6509804, 1,
-0.1620375, 1.153244, -1.697473, 0, 1, 0.6588235, 1,
-0.161462, -1.903234, -2.802093, 0, 1, 0.6627451, 1,
-0.1585443, 0.6937441, -0.1112033, 0, 1, 0.6705883, 1,
-0.152314, -1.364389, -3.863552, 0, 1, 0.6745098, 1,
-0.1495612, 0.9383919, 0.8988083, 0, 1, 0.682353, 1,
-0.1440552, -0.517881, -2.809002, 0, 1, 0.6862745, 1,
-0.1425398, 1.490881, 0.2236518, 0, 1, 0.6941177, 1,
-0.1348732, 0.4975924, -1.342938, 0, 1, 0.7019608, 1,
-0.1334625, 1.219473, -0.5755535, 0, 1, 0.7058824, 1,
-0.1310032, 0.7097436, -0.32785, 0, 1, 0.7137255, 1,
-0.129093, 2.274978, -0.9017993, 0, 1, 0.7176471, 1,
-0.1289947, -0.3665559, -3.366578, 0, 1, 0.7254902, 1,
-0.1283038, -1.741035, -2.95926, 0, 1, 0.7294118, 1,
-0.1272226, -0.5672312, -3.164824, 0, 1, 0.7372549, 1,
-0.1249301, 0.3924854, -0.6270288, 0, 1, 0.7411765, 1,
-0.1219029, -0.4105257, -2.328926, 0, 1, 0.7490196, 1,
-0.1184891, 0.8230218, -0.8650458, 0, 1, 0.7529412, 1,
-0.1141262, -0.4521697, -1.617378, 0, 1, 0.7607843, 1,
-0.1125053, 0.8033977, -0.987706, 0, 1, 0.7647059, 1,
-0.1122346, -1.188917, -2.004097, 0, 1, 0.772549, 1,
-0.1113119, 0.5988392, 0.5988451, 0, 1, 0.7764706, 1,
-0.1091933, 0.5831084, 1.309264, 0, 1, 0.7843137, 1,
-0.1056035, -0.2251326, -2.751807, 0, 1, 0.7882353, 1,
-0.1035099, 0.2071205, -1.680968, 0, 1, 0.7960784, 1,
-0.1020697, 1.357924, 0.990078, 0, 1, 0.8039216, 1,
-0.09978987, -0.1779557, -1.001924, 0, 1, 0.8078431, 1,
-0.0993491, -0.4826588, -3.048991, 0, 1, 0.8156863, 1,
-0.09609119, 0.3197995, -0.3167835, 0, 1, 0.8196079, 1,
-0.09576557, -0.8156247, -4.379228, 0, 1, 0.827451, 1,
-0.09453177, 1.135892, -0.5038906, 0, 1, 0.8313726, 1,
-0.093897, -0.257826, -2.758047, 0, 1, 0.8392157, 1,
-0.09357424, 0.4399774, -0.4810969, 0, 1, 0.8431373, 1,
-0.09348892, -0.9212295, -3.008526, 0, 1, 0.8509804, 1,
-0.08482447, 1.464425, -1.579703, 0, 1, 0.854902, 1,
-0.08217718, 0.76465, -0.617336, 0, 1, 0.8627451, 1,
-0.08205669, 1.286591, -0.2732776, 0, 1, 0.8666667, 1,
-0.08095373, -0.4269548, -2.135787, 0, 1, 0.8745098, 1,
-0.08006947, -2.262061, -2.472891, 0, 1, 0.8784314, 1,
-0.06768177, -1.698637, -2.485305, 0, 1, 0.8862745, 1,
-0.06676432, 0.819621, -0.8681773, 0, 1, 0.8901961, 1,
-0.06663237, -0.4353074, -2.15603, 0, 1, 0.8980392, 1,
-0.06399298, 0.1921087, 0.9066973, 0, 1, 0.9058824, 1,
-0.06319125, 1.719279, 0.289199, 0, 1, 0.9098039, 1,
-0.04787629, -1.583144, -2.987405, 0, 1, 0.9176471, 1,
-0.04508828, 0.5950946, 0.3267313, 0, 1, 0.9215686, 1,
-0.04406507, 0.0646115, 0.5698993, 0, 1, 0.9294118, 1,
-0.03706253, -1.081442, -2.425868, 0, 1, 0.9333333, 1,
-0.03690194, 0.3191442, -0.9720647, 0, 1, 0.9411765, 1,
-0.03396073, 1.420025, -1.230426, 0, 1, 0.945098, 1,
-0.0328247, 1.033313, 0.5255263, 0, 1, 0.9529412, 1,
-0.03112629, -0.1046578, -2.581461, 0, 1, 0.9568627, 1,
-0.02815102, 1.459587, -1.989436, 0, 1, 0.9647059, 1,
-0.02487541, -0.2280031, -3.151969, 0, 1, 0.9686275, 1,
-0.02455092, -1.853084, -3.52633, 0, 1, 0.9764706, 1,
-0.02216166, 0.0193931, -0.5295349, 0, 1, 0.9803922, 1,
-0.02134019, 1.211698, 0.2200594, 0, 1, 0.9882353, 1,
-0.02023552, -1.214468, -5.415002, 0, 1, 0.9921569, 1,
-0.01566276, 0.4209269, -0.6222475, 0, 1, 1, 1,
-0.01405866, -0.3807131, -4.196718, 0, 0.9921569, 1, 1,
-0.01330348, -0.6622307, -0.7141124, 0, 0.9882353, 1, 1,
-0.012797, -0.2489541, -3.038908, 0, 0.9803922, 1, 1,
-0.01194805, 1.207823, -1.868554, 0, 0.9764706, 1, 1,
-0.01017124, -1.498078, -3.925796, 0, 0.9686275, 1, 1,
-0.00590015, -0.3204102, -1.449247, 0, 0.9647059, 1, 1,
-0.003982866, 0.2052701, -1.393861, 0, 0.9568627, 1, 1,
-0.002607565, -0.1545414, -1.123727, 0, 0.9529412, 1, 1,
0.0006937571, -1.33962, 3.795273, 0, 0.945098, 1, 1,
0.003174873, -0.8426611, 2.416051, 0, 0.9411765, 1, 1,
0.01692236, 1.298252, -0.2473964, 0, 0.9333333, 1, 1,
0.01779407, 0.6567721, -0.5694601, 0, 0.9294118, 1, 1,
0.02074751, 1.035314, -0.7024068, 0, 0.9215686, 1, 1,
0.02452042, -0.08611418, 3.179173, 0, 0.9176471, 1, 1,
0.02578449, -0.6977761, 3.628616, 0, 0.9098039, 1, 1,
0.02954241, -1.499171, 1.774951, 0, 0.9058824, 1, 1,
0.03394632, -0.06486141, 1.119307, 0, 0.8980392, 1, 1,
0.03755573, 0.02143631, 3.099051, 0, 0.8901961, 1, 1,
0.03828104, 1.980507, -0.01797115, 0, 0.8862745, 1, 1,
0.0410427, -2.266703, 3.493198, 0, 0.8784314, 1, 1,
0.04245127, -0.6711635, 4.326243, 0, 0.8745098, 1, 1,
0.04318393, -1.047612, 3.279673, 0, 0.8666667, 1, 1,
0.0457845, 0.2698252, 0.8471698, 0, 0.8627451, 1, 1,
0.05126932, -0.1468969, 3.243669, 0, 0.854902, 1, 1,
0.05175333, -0.04515712, 1.80321, 0, 0.8509804, 1, 1,
0.05187301, -0.4488121, 4.134408, 0, 0.8431373, 1, 1,
0.05244531, -2.047756, 1.405212, 0, 0.8392157, 1, 1,
0.05861429, 0.9337468, -1.485679, 0, 0.8313726, 1, 1,
0.06007067, -0.9433273, 3.880239, 0, 0.827451, 1, 1,
0.06276056, -1.196243, 2.908959, 0, 0.8196079, 1, 1,
0.06517804, 0.9725349, -1.146426, 0, 0.8156863, 1, 1,
0.06733642, 0.3743401, -0.7243212, 0, 0.8078431, 1, 1,
0.06747992, 0.3747942, 0.05381887, 0, 0.8039216, 1, 1,
0.06977098, -0.5022703, 2.98451, 0, 0.7960784, 1, 1,
0.07838409, -0.8130533, 1.822673, 0, 0.7882353, 1, 1,
0.08333113, -0.06123647, 1.708055, 0, 0.7843137, 1, 1,
0.08409552, -0.1229324, 1.649401, 0, 0.7764706, 1, 1,
0.08429436, -1.330911, 3.34861, 0, 0.772549, 1, 1,
0.08843535, -1.20935, 5.053554, 0, 0.7647059, 1, 1,
0.09389383, 0.5495628, -0.9133195, 0, 0.7607843, 1, 1,
0.09631709, -0.2203369, 1.832987, 0, 0.7529412, 1, 1,
0.1026241, -1.529561, 2.934704, 0, 0.7490196, 1, 1,
0.1051717, 0.2676348, 0.04173649, 0, 0.7411765, 1, 1,
0.1089834, 1.24079, 1.079922, 0, 0.7372549, 1, 1,
0.1103216, 0.1426612, 1.277274, 0, 0.7294118, 1, 1,
0.1114582, -0.1032241, 1.575137, 0, 0.7254902, 1, 1,
0.1120234, -0.01724609, 1.616586, 0, 0.7176471, 1, 1,
0.112499, 0.731216, 0.2297577, 0, 0.7137255, 1, 1,
0.11334, -0.6498739, 2.123944, 0, 0.7058824, 1, 1,
0.1152138, -0.3881395, 2.723602, 0, 0.6980392, 1, 1,
0.1154861, -0.08886694, 2.564273, 0, 0.6941177, 1, 1,
0.1167377, 0.1962843, 1.837479, 0, 0.6862745, 1, 1,
0.117231, -0.3046641, 1.909196, 0, 0.682353, 1, 1,
0.1203413, 4.188668, -0.2913151, 0, 0.6745098, 1, 1,
0.1209709, -0.2545219, 2.345277, 0, 0.6705883, 1, 1,
0.1228789, 0.4172757, 1.196985, 0, 0.6627451, 1, 1,
0.1232795, 0.3122952, 0.312703, 0, 0.6588235, 1, 1,
0.1249015, 0.2412866, 1.697557, 0, 0.6509804, 1, 1,
0.1303935, -0.5615389, 0.5725242, 0, 0.6470588, 1, 1,
0.1312357, -0.3932877, 2.58664, 0, 0.6392157, 1, 1,
0.1343272, -0.3779943, 2.122979, 0, 0.6352941, 1, 1,
0.1362619, 0.2296178, 1.191315, 0, 0.627451, 1, 1,
0.1381242, 0.8808451, 0.5458133, 0, 0.6235294, 1, 1,
0.1442699, -0.09980273, 2.434712, 0, 0.6156863, 1, 1,
0.1450809, 0.7889663, -2.047104, 0, 0.6117647, 1, 1,
0.1452941, 0.6220803, -0.6419373, 0, 0.6039216, 1, 1,
0.1474945, -0.04272358, 2.422653, 0, 0.5960785, 1, 1,
0.159113, 1.289221, 0.9601427, 0, 0.5921569, 1, 1,
0.1635279, 0.04521943, 3.716719, 0, 0.5843138, 1, 1,
0.1666972, -0.6278804, 2.327221, 0, 0.5803922, 1, 1,
0.1701258, 0.8815301, 0.2627936, 0, 0.572549, 1, 1,
0.1722967, -0.6947159, 3.497837, 0, 0.5686275, 1, 1,
0.174701, 1.639617, -0.7544223, 0, 0.5607843, 1, 1,
0.1802207, -0.4822371, 3.947368, 0, 0.5568628, 1, 1,
0.1805815, -0.8265713, 3.872689, 0, 0.5490196, 1, 1,
0.1832799, 0.2627305, -0.1624311, 0, 0.5450981, 1, 1,
0.1893558, 0.2884275, 0.6429118, 0, 0.5372549, 1, 1,
0.1901128, 0.0889869, 1.302523, 0, 0.5333334, 1, 1,
0.1902785, -1.177396, 2.448495, 0, 0.5254902, 1, 1,
0.1903683, 0.966725, 0.7875713, 0, 0.5215687, 1, 1,
0.1913013, -1.720152, 2.976414, 0, 0.5137255, 1, 1,
0.1920996, -0.3771845, 4.246881, 0, 0.509804, 1, 1,
0.1923397, 0.313596, 1.477239, 0, 0.5019608, 1, 1,
0.1929467, 0.5913835, 1.84227, 0, 0.4941176, 1, 1,
0.1937312, -0.367119, 3.289857, 0, 0.4901961, 1, 1,
0.1958202, -1.494233, 2.775353, 0, 0.4823529, 1, 1,
0.2015582, 0.9318834, -0.1003221, 0, 0.4784314, 1, 1,
0.2055336, 2.663517, -0.6679075, 0, 0.4705882, 1, 1,
0.2058779, -0.4759991, 3.150015, 0, 0.4666667, 1, 1,
0.207509, -0.227872, 2.001129, 0, 0.4588235, 1, 1,
0.2079798, -0.6203717, 2.009007, 0, 0.454902, 1, 1,
0.2097931, -1.368382, 2.543025, 0, 0.4470588, 1, 1,
0.2104771, 0.5134205, -1.11131, 0, 0.4431373, 1, 1,
0.2193018, 0.5291556, 0.5634481, 0, 0.4352941, 1, 1,
0.2227619, 0.1646822, 0.8121194, 0, 0.4313726, 1, 1,
0.2231772, -0.4025941, 1.729963, 0, 0.4235294, 1, 1,
0.2257406, -1.102297, 3.958036, 0, 0.4196078, 1, 1,
0.2301124, 0.5623584, -0.1875403, 0, 0.4117647, 1, 1,
0.2357311, 0.3951789, 0.9717495, 0, 0.4078431, 1, 1,
0.2384481, -0.7650465, 2.09768, 0, 0.4, 1, 1,
0.2396769, -0.5812631, 4.372387, 0, 0.3921569, 1, 1,
0.2425674, -1.209174, 4.688181, 0, 0.3882353, 1, 1,
0.2453844, 0.517068, -1.184472, 0, 0.3803922, 1, 1,
0.2481934, 0.6548292, 1.648574, 0, 0.3764706, 1, 1,
0.2556204, -0.09704933, 3.032455, 0, 0.3686275, 1, 1,
0.257425, 1.187021, 0.2023701, 0, 0.3647059, 1, 1,
0.2590957, 1.615137, 0.325572, 0, 0.3568628, 1, 1,
0.2673494, -1.676826, 2.345254, 0, 0.3529412, 1, 1,
0.2678525, -0.1900563, 2.739039, 0, 0.345098, 1, 1,
0.2694005, 0.8951801, -0.3222477, 0, 0.3411765, 1, 1,
0.2715472, -0.210222, 2.342049, 0, 0.3333333, 1, 1,
0.2721256, -0.1935464, 0.9324897, 0, 0.3294118, 1, 1,
0.2755164, -0.3623238, 2.15403, 0, 0.3215686, 1, 1,
0.2846588, 0.7966393, 0.4986195, 0, 0.3176471, 1, 1,
0.2889003, 0.1602098, -0.42107, 0, 0.3098039, 1, 1,
0.2921221, 0.9547629, 0.7505494, 0, 0.3058824, 1, 1,
0.2934809, 0.9590138, -0.1022906, 0, 0.2980392, 1, 1,
0.3053539, 0.06073583, 4.303389, 0, 0.2901961, 1, 1,
0.3084027, 0.687418, 0.9337094, 0, 0.2862745, 1, 1,
0.3096989, -0.09741985, 2.079757, 0, 0.2784314, 1, 1,
0.3097611, 1.10988, -0.700438, 0, 0.2745098, 1, 1,
0.3099527, 0.3889984, 1.006267, 0, 0.2666667, 1, 1,
0.3120843, -1.29702, 3.181187, 0, 0.2627451, 1, 1,
0.3143994, -0.03920068, 0.4272806, 0, 0.254902, 1, 1,
0.31555, 0.9642519, 0.9502085, 0, 0.2509804, 1, 1,
0.3252221, -0.3472819, 0.9864327, 0, 0.2431373, 1, 1,
0.3253109, -1.220205, 2.204771, 0, 0.2392157, 1, 1,
0.325964, 0.7977031, 0.6794702, 0, 0.2313726, 1, 1,
0.3370584, 0.1161404, 0.9817773, 0, 0.227451, 1, 1,
0.3371744, -1.148577, 3.089177, 0, 0.2196078, 1, 1,
0.3377306, 0.155384, 1.025247, 0, 0.2156863, 1, 1,
0.3394965, 1.352077, 1.12665, 0, 0.2078431, 1, 1,
0.3405399, -2.2222, 2.391237, 0, 0.2039216, 1, 1,
0.3415808, -1.774327, 3.929004, 0, 0.1960784, 1, 1,
0.3436018, -1.34879, 2.845288, 0, 0.1882353, 1, 1,
0.345964, 0.3144281, 2.186006, 0, 0.1843137, 1, 1,
0.3468477, 0.3632015, 1.168008, 0, 0.1764706, 1, 1,
0.3498091, -1.869881, 2.762936, 0, 0.172549, 1, 1,
0.3507512, -0.1654961, 3.654386, 0, 0.1647059, 1, 1,
0.3548766, -0.2351629, 3.114423, 0, 0.1607843, 1, 1,
0.3559287, 1.298231, 0.4840751, 0, 0.1529412, 1, 1,
0.3587496, 1.576411, 0.7948415, 0, 0.1490196, 1, 1,
0.3654781, -0.7328455, 2.132352, 0, 0.1411765, 1, 1,
0.3660214, 0.232855, 2.039963, 0, 0.1372549, 1, 1,
0.3685608, 1.648746, -0.1033725, 0, 0.1294118, 1, 1,
0.3725387, -0.7850339, 3.016679, 0, 0.1254902, 1, 1,
0.3800812, -0.5655014, 3.854813, 0, 0.1176471, 1, 1,
0.3808619, -0.8052896, 1.037864, 0, 0.1137255, 1, 1,
0.3848836, -0.507269, 2.570182, 0, 0.1058824, 1, 1,
0.3879647, -0.1367011, 1.474324, 0, 0.09803922, 1, 1,
0.399975, -0.8438483, 3.690772, 0, 0.09411765, 1, 1,
0.4003322, -0.1227272, 4.517856, 0, 0.08627451, 1, 1,
0.4015599, 0.782201, 1.425298, 0, 0.08235294, 1, 1,
0.4057985, -0.128784, 2.58309, 0, 0.07450981, 1, 1,
0.4097299, -0.4225498, 1.707277, 0, 0.07058824, 1, 1,
0.4099427, 0.9838493, 0.9484496, 0, 0.0627451, 1, 1,
0.4150033, -0.7261692, 2.529292, 0, 0.05882353, 1, 1,
0.4170442, 1.31017, 0.8106629, 0, 0.05098039, 1, 1,
0.4180356, -0.1028996, 0.9326785, 0, 0.04705882, 1, 1,
0.4217547, -0.05588181, -0.6353571, 0, 0.03921569, 1, 1,
0.4229822, 0.6539479, 0.8377654, 0, 0.03529412, 1, 1,
0.4233397, -0.1974929, 2.59123, 0, 0.02745098, 1, 1,
0.4278623, 1.296029, 2.345314, 0, 0.02352941, 1, 1,
0.4304764, -1.537512, 3.582655, 0, 0.01568628, 1, 1,
0.4322743, -0.756851, 1.74323, 0, 0.01176471, 1, 1,
0.4330418, -0.6129181, 1.90754, 0, 0.003921569, 1, 1,
0.434254, 0.4844408, -1.722037, 0.003921569, 0, 1, 1,
0.4354178, 0.3322172, 1.669886, 0.007843138, 0, 1, 1,
0.4365883, -0.5320984, 3.365449, 0.01568628, 0, 1, 1,
0.4385801, 1.124506, 0.6428634, 0.01960784, 0, 1, 1,
0.4407938, -0.6120121, 3.260103, 0.02745098, 0, 1, 1,
0.4462614, 0.1436365, 3.074961, 0.03137255, 0, 1, 1,
0.4521814, 0.8573471, -1.566236, 0.03921569, 0, 1, 1,
0.4553381, -0.9590712, 3.073264, 0.04313726, 0, 1, 1,
0.4573991, -0.5939952, 0.6047378, 0.05098039, 0, 1, 1,
0.4578273, -0.4859475, 0.6237622, 0.05490196, 0, 1, 1,
0.4608139, -0.7248901, 1.592596, 0.0627451, 0, 1, 1,
0.4609735, 0.253311, 2.41778, 0.06666667, 0, 1, 1,
0.4629685, -0.3754752, 2.343819, 0.07450981, 0, 1, 1,
0.4638857, 0.3727634, -0.07351995, 0.07843138, 0, 1, 1,
0.4808361, -0.7822056, 1.967308, 0.08627451, 0, 1, 1,
0.4835373, 1.417017, 1.406483, 0.09019608, 0, 1, 1,
0.4848298, 0.03095532, 1.184073, 0.09803922, 0, 1, 1,
0.4865515, 0.2661512, 0.6820506, 0.1058824, 0, 1, 1,
0.4905564, 1.913976, -0.4324544, 0.1098039, 0, 1, 1,
0.493313, -2.04741, 2.076815, 0.1176471, 0, 1, 1,
0.495012, -0.993397, 3.283665, 0.1215686, 0, 1, 1,
0.4966825, -1.386868, 2.643229, 0.1294118, 0, 1, 1,
0.5106618, -2.128524, 3.171737, 0.1333333, 0, 1, 1,
0.5116097, 0.1811064, 1.010403, 0.1411765, 0, 1, 1,
0.5134054, 0.4861243, -0.01185902, 0.145098, 0, 1, 1,
0.513702, 0.8097072, 0.1290911, 0.1529412, 0, 1, 1,
0.515724, -0.1280899, 1.234058, 0.1568628, 0, 1, 1,
0.5222774, -0.3308035, 2.258765, 0.1647059, 0, 1, 1,
0.531614, -0.327755, 1.816209, 0.1686275, 0, 1, 1,
0.5321367, 0.4452152, 1.417117, 0.1764706, 0, 1, 1,
0.5353354, 0.1435469, 1.095271, 0.1803922, 0, 1, 1,
0.5366702, -0.9002044, 3.38043, 0.1882353, 0, 1, 1,
0.5403289, 1.725519, -1.56357, 0.1921569, 0, 1, 1,
0.5403523, -0.8245047, 2.635522, 0.2, 0, 1, 1,
0.5410644, -0.2697071, 1.531765, 0.2078431, 0, 1, 1,
0.5472971, -0.8306059, 2.943514, 0.2117647, 0, 1, 1,
0.5508834, -1.512991, 2.701046, 0.2196078, 0, 1, 1,
0.5538597, 0.3138852, -0.7782795, 0.2235294, 0, 1, 1,
0.556593, 1.704259, -0.6889473, 0.2313726, 0, 1, 1,
0.5570801, -0.7008032, 1.084955, 0.2352941, 0, 1, 1,
0.5580851, -0.8667992, 1.820518, 0.2431373, 0, 1, 1,
0.5667958, -0.1819879, 1.559062, 0.2470588, 0, 1, 1,
0.5726218, -0.02594211, 1.920869, 0.254902, 0, 1, 1,
0.5804865, -0.7763289, 2.692899, 0.2588235, 0, 1, 1,
0.5841893, -0.636561, 4.302256, 0.2666667, 0, 1, 1,
0.587239, -0.2089608, 0.9260128, 0.2705882, 0, 1, 1,
0.5898215, -0.1488622, 1.695908, 0.2784314, 0, 1, 1,
0.5907726, 0.1776813, 2.097949, 0.282353, 0, 1, 1,
0.5960068, -0.8737743, 3.575003, 0.2901961, 0, 1, 1,
0.5968266, -0.9074031, 2.870932, 0.2941177, 0, 1, 1,
0.5971507, 1.593122, 0.5490555, 0.3019608, 0, 1, 1,
0.5985252, -0.6214987, 2.444988, 0.3098039, 0, 1, 1,
0.6019717, -0.3554008, 2.541538, 0.3137255, 0, 1, 1,
0.6083975, 0.789623, -1.013959, 0.3215686, 0, 1, 1,
0.6106952, -0.2310829, 3.69229, 0.3254902, 0, 1, 1,
0.6113646, 0.4689422, 0.224181, 0.3333333, 0, 1, 1,
0.6122961, -0.03617199, 1.667051, 0.3372549, 0, 1, 1,
0.6130038, -0.3623856, 1.862242, 0.345098, 0, 1, 1,
0.6154265, 0.1015912, 1.260649, 0.3490196, 0, 1, 1,
0.6180756, 0.8571362, 0.06752489, 0.3568628, 0, 1, 1,
0.6193739, 0.486858, 1.843365, 0.3607843, 0, 1, 1,
0.6203221, -0.2393141, 2.945464, 0.3686275, 0, 1, 1,
0.6220765, 1.733585, 0.6649031, 0.372549, 0, 1, 1,
0.6270128, 0.3113593, 0.9701374, 0.3803922, 0, 1, 1,
0.6318601, 0.8216265, 0.4358211, 0.3843137, 0, 1, 1,
0.6339885, -0.004570361, 1.56189, 0.3921569, 0, 1, 1,
0.6345256, -2.223439, 2.407126, 0.3960784, 0, 1, 1,
0.6356677, -1.283275, 1.184871, 0.4039216, 0, 1, 1,
0.6380441, 2.120771, -1.143233, 0.4117647, 0, 1, 1,
0.6396869, 0.6063637, 0.2315825, 0.4156863, 0, 1, 1,
0.6440127, 1.529455, -0.6709938, 0.4235294, 0, 1, 1,
0.6536694, -0.2422892, 2.259568, 0.427451, 0, 1, 1,
0.654116, -1.170382, 2.586779, 0.4352941, 0, 1, 1,
0.6590744, -0.1444248, 2.127952, 0.4392157, 0, 1, 1,
0.6619108, -1.480849, 2.650637, 0.4470588, 0, 1, 1,
0.6626311, -0.3300221, 3.701437, 0.4509804, 0, 1, 1,
0.6692546, -0.1741001, 0.2597073, 0.4588235, 0, 1, 1,
0.6694664, 1.957817, 0.5192387, 0.4627451, 0, 1, 1,
0.67176, -0.09588942, 0.06794836, 0.4705882, 0, 1, 1,
0.6732153, 1.698144, -0.04323907, 0.4745098, 0, 1, 1,
0.6733988, -0.1709653, 3.985413, 0.4823529, 0, 1, 1,
0.6823037, 0.04665054, 3.448667, 0.4862745, 0, 1, 1,
0.6826914, 0.7073886, 0.8567544, 0.4941176, 0, 1, 1,
0.6837181, 1.044439, 1.964402, 0.5019608, 0, 1, 1,
0.6894199, 1.925182, 2.780411, 0.5058824, 0, 1, 1,
0.6924213, -1.354477, 2.229014, 0.5137255, 0, 1, 1,
0.6956183, 0.7699617, 0.86377, 0.5176471, 0, 1, 1,
0.6962281, -0.7912868, 4.7172, 0.5254902, 0, 1, 1,
0.6979994, -1.793563, 1.756737, 0.5294118, 0, 1, 1,
0.703879, 0.07843328, 0.4414215, 0.5372549, 0, 1, 1,
0.7148813, -0.2516072, 3.315464, 0.5411765, 0, 1, 1,
0.7179286, -0.501176, 3.172278, 0.5490196, 0, 1, 1,
0.7206928, 0.4293724, 1.174508, 0.5529412, 0, 1, 1,
0.7244156, 0.875163, -0.3319943, 0.5607843, 0, 1, 1,
0.7312202, 0.2169241, 2.905093, 0.5647059, 0, 1, 1,
0.7314197, 1.717348, 1.335888, 0.572549, 0, 1, 1,
0.7317802, 0.225508, 0.9124308, 0.5764706, 0, 1, 1,
0.7332574, 0.5016509, 0.9325425, 0.5843138, 0, 1, 1,
0.7461919, 1.346342, 0.5800301, 0.5882353, 0, 1, 1,
0.7499943, 0.4786041, 0.08682732, 0.5960785, 0, 1, 1,
0.7575022, -0.371413, 0.4539312, 0.6039216, 0, 1, 1,
0.7630758, -0.767822, 1.965932, 0.6078432, 0, 1, 1,
0.7646921, 1.431814, 1.40267, 0.6156863, 0, 1, 1,
0.7656961, -1.031482, 3.956274, 0.6196079, 0, 1, 1,
0.7657766, 0.2581949, -0.2933321, 0.627451, 0, 1, 1,
0.7678491, -0.03214534, 2.115661, 0.6313726, 0, 1, 1,
0.768253, 0.09931651, 1.908408, 0.6392157, 0, 1, 1,
0.7705927, -0.104183, 3.016342, 0.6431373, 0, 1, 1,
0.7708006, 0.6143638, 1.558422, 0.6509804, 0, 1, 1,
0.7712922, 0.05326433, 3.433082, 0.654902, 0, 1, 1,
0.7738475, -1.346333, 2.367977, 0.6627451, 0, 1, 1,
0.7741125, 1.498292, -0.08024724, 0.6666667, 0, 1, 1,
0.780113, 0.3367712, 1.995009, 0.6745098, 0, 1, 1,
0.7820444, 0.09858478, -0.9624668, 0.6784314, 0, 1, 1,
0.7827747, -1.859604, 3.691989, 0.6862745, 0, 1, 1,
0.7856891, 0.9226398, -0.1186329, 0.6901961, 0, 1, 1,
0.7866853, 1.238058, 0.4338236, 0.6980392, 0, 1, 1,
0.7917027, -0.07478531, 0.4450214, 0.7058824, 0, 1, 1,
0.7928479, -0.8258969, 4.046467, 0.7098039, 0, 1, 1,
0.7967563, 1.113527, -0.07654522, 0.7176471, 0, 1, 1,
0.8020856, -1.213045, 1.311661, 0.7215686, 0, 1, 1,
0.8062282, 1.346772, 0.08135162, 0.7294118, 0, 1, 1,
0.8067807, 1.975346, 1.592622, 0.7333333, 0, 1, 1,
0.807682, -0.2354327, 1.679179, 0.7411765, 0, 1, 1,
0.8152156, 0.7571194, 0.288219, 0.7450981, 0, 1, 1,
0.816925, 1.004934, 0.7680305, 0.7529412, 0, 1, 1,
0.8171183, 2.205387, 1.16552, 0.7568628, 0, 1, 1,
0.8243309, -0.3328095, 2.378649, 0.7647059, 0, 1, 1,
0.8254823, -0.8483185, 3.763083, 0.7686275, 0, 1, 1,
0.8357659, 0.3127699, 2.370628, 0.7764706, 0, 1, 1,
0.839972, 0.3176948, 1.912271, 0.7803922, 0, 1, 1,
0.8468546, 0.5771937, 0.3335772, 0.7882353, 0, 1, 1,
0.8476446, -0.6702101, 0.6380504, 0.7921569, 0, 1, 1,
0.8491245, 0.955605, 2.220675, 0.8, 0, 1, 1,
0.8515492, -1.240615, 1.738238, 0.8078431, 0, 1, 1,
0.8565019, -1.26634, 3.524502, 0.8117647, 0, 1, 1,
0.8738348, 0.5946517, 2.468083, 0.8196079, 0, 1, 1,
0.8903107, 0.4471226, 0.1106153, 0.8235294, 0, 1, 1,
0.894803, -1.221465, 2.1335, 0.8313726, 0, 1, 1,
0.9109986, -0.7041257, 2.123454, 0.8352941, 0, 1, 1,
0.9163675, -0.392599, 2.341812, 0.8431373, 0, 1, 1,
0.9165179, 0.4689811, -0.117768, 0.8470588, 0, 1, 1,
0.9190533, -0.08050947, 3.876647, 0.854902, 0, 1, 1,
0.9315051, 0.0877035, 0.9079962, 0.8588235, 0, 1, 1,
0.9316537, 0.5105304, 2.963591, 0.8666667, 0, 1, 1,
0.9422577, -0.3494041, 2.254519, 0.8705882, 0, 1, 1,
0.9456686, 0.3693559, -1.217662, 0.8784314, 0, 1, 1,
0.9575885, 0.3969375, 0.1196638, 0.8823529, 0, 1, 1,
0.958741, -0.5350531, 3.92021, 0.8901961, 0, 1, 1,
0.9680997, 0.8841417, 0.06048142, 0.8941177, 0, 1, 1,
0.971025, 0.0761173, 1.03014, 0.9019608, 0, 1, 1,
0.9764733, 0.7724743, -0.05773042, 0.9098039, 0, 1, 1,
0.9764907, -0.3592581, 1.597564, 0.9137255, 0, 1, 1,
0.9825017, 0.6332441, 1.970897, 0.9215686, 0, 1, 1,
0.9867881, -0.7555493, 5.103024, 0.9254902, 0, 1, 1,
0.9948024, -0.1405221, 1.516633, 0.9333333, 0, 1, 1,
0.9950426, -0.1421021, 0.04035117, 0.9372549, 0, 1, 1,
0.9957906, 1.132741, -1.247329, 0.945098, 0, 1, 1,
0.9977673, -1.091142, 1.923663, 0.9490196, 0, 1, 1,
0.9980799, 0.2529096, 3.641174, 0.9568627, 0, 1, 1,
0.9982169, 1.713714, 1.57734, 0.9607843, 0, 1, 1,
0.9986973, 0.7213543, -0.1389343, 0.9686275, 0, 1, 1,
0.9988565, -0.6913891, 1.65774, 0.972549, 0, 1, 1,
0.9990782, -0.7409171, 1.418164, 0.9803922, 0, 1, 1,
0.9991081, 0.6370451, 1.188124, 0.9843137, 0, 1, 1,
1.009897, -1.429873, 3.039458, 0.9921569, 0, 1, 1,
1.011611, -0.6685968, 1.327521, 0.9960784, 0, 1, 1,
1.015291, -1.74945, 3.169082, 1, 0, 0.9960784, 1,
1.01907, 0.6200307, 0.2794685, 1, 0, 0.9882353, 1,
1.021128, 0.1953926, 1.368395, 1, 0, 0.9843137, 1,
1.021165, -0.1616524, 1.825554, 1, 0, 0.9764706, 1,
1.025263, 1.589291, 0.08094845, 1, 0, 0.972549, 1,
1.025923, 0.9192964, 1.04111, 1, 0, 0.9647059, 1,
1.027574, 0.4223838, 2.280297, 1, 0, 0.9607843, 1,
1.028869, 1.336277, 0.05741813, 1, 0, 0.9529412, 1,
1.030975, -0.2433859, 1.707979, 1, 0, 0.9490196, 1,
1.04417, 0.7615352, 2.131274, 1, 0, 0.9411765, 1,
1.045985, -0.3777699, 1.871985, 1, 0, 0.9372549, 1,
1.047437, 0.2426403, -0.511555, 1, 0, 0.9294118, 1,
1.052895, -0.6601136, 1.849714, 1, 0, 0.9254902, 1,
1.056183, -1.773471, 3.810378, 1, 0, 0.9176471, 1,
1.061929, 0.007611515, 0.8313742, 1, 0, 0.9137255, 1,
1.07789, -0.2397103, 2.403946, 1, 0, 0.9058824, 1,
1.078756, -1.249467, 1.675374, 1, 0, 0.9019608, 1,
1.081627, -0.9659923, 1.651789, 1, 0, 0.8941177, 1,
1.08236, -1.995222, 2.92233, 1, 0, 0.8862745, 1,
1.089598, 1.661486, 2.501414, 1, 0, 0.8823529, 1,
1.091102, -0.5623813, 3.602556, 1, 0, 0.8745098, 1,
1.091638, -0.6746719, 1.805059, 1, 0, 0.8705882, 1,
1.096987, -0.3642329, 1.883545, 1, 0, 0.8627451, 1,
1.097021, -0.0783079, 1.933265, 1, 0, 0.8588235, 1,
1.10001, 1.277247, 0.7655903, 1, 0, 0.8509804, 1,
1.10633, -0.1438787, 1.71635, 1, 0, 0.8470588, 1,
1.111778, 1.860798, 0.07117417, 1, 0, 0.8392157, 1,
1.115119, -0.05020163, 2.31614, 1, 0, 0.8352941, 1,
1.120175, 0.7731345, 3.09233, 1, 0, 0.827451, 1,
1.131671, -0.7492706, 0.6892725, 1, 0, 0.8235294, 1,
1.133973, 0.6870161, 1.527831, 1, 0, 0.8156863, 1,
1.138415, -1.0583, 1.092965, 1, 0, 0.8117647, 1,
1.14254, 1.22169, 0.766902, 1, 0, 0.8039216, 1,
1.146666, -0.7646827, 1.562187, 1, 0, 0.7960784, 1,
1.146744, -1.694685, 2.869821, 1, 0, 0.7921569, 1,
1.147286, 2.182334, 0.3349457, 1, 0, 0.7843137, 1,
1.158343, -0.04472461, 3.288459, 1, 0, 0.7803922, 1,
1.160588, -0.2747212, 1.00594, 1, 0, 0.772549, 1,
1.166932, -0.1996557, 0.9209985, 1, 0, 0.7686275, 1,
1.171474, -1.233793, 2.156158, 1, 0, 0.7607843, 1,
1.172238, -0.6566403, 2.204908, 1, 0, 0.7568628, 1,
1.174637, 2.185617, 0.8072392, 1, 0, 0.7490196, 1,
1.178691, -0.5769606, 1.129771, 1, 0, 0.7450981, 1,
1.188223, -0.1389923, 1.859817, 1, 0, 0.7372549, 1,
1.190726, -1.409172, 2.531527, 1, 0, 0.7333333, 1,
1.192472, -0.8289015, 2.799997, 1, 0, 0.7254902, 1,
1.192496, 0.7298108, 1.780133, 1, 0, 0.7215686, 1,
1.197274, 0.320195, 1.639727, 1, 0, 0.7137255, 1,
1.200541, 0.03154055, 1.081633, 1, 0, 0.7098039, 1,
1.212458, -1.88055, 3.605942, 1, 0, 0.7019608, 1,
1.216774, 0.4693403, 1.413978, 1, 0, 0.6941177, 1,
1.221831, -0.2044713, 2.783035, 1, 0, 0.6901961, 1,
1.222076, -0.02783511, 1.984534, 1, 0, 0.682353, 1,
1.227678, -1.297307, 2.245789, 1, 0, 0.6784314, 1,
1.230749, 1.036512, 1.676659, 1, 0, 0.6705883, 1,
1.230922, -0.4955761, 2.11941, 1, 0, 0.6666667, 1,
1.246478, -0.7944322, 3.269834, 1, 0, 0.6588235, 1,
1.250978, 0.3759967, 0.6382553, 1, 0, 0.654902, 1,
1.25999, -0.9567368, 1.830976, 1, 0, 0.6470588, 1,
1.260793, -0.5859102, 2.352639, 1, 0, 0.6431373, 1,
1.267893, 0.4662015, 1.049021, 1, 0, 0.6352941, 1,
1.271978, -0.2804466, 0.3771286, 1, 0, 0.6313726, 1,
1.272593, -0.9083161, 0.2840588, 1, 0, 0.6235294, 1,
1.279761, 0.4085571, 3.101512, 1, 0, 0.6196079, 1,
1.281057, -0.4743426, 1.997919, 1, 0, 0.6117647, 1,
1.282969, -1.353444, 1.696137, 1, 0, 0.6078432, 1,
1.289582, 1.491767, 1.750125, 1, 0, 0.6, 1,
1.301642, -0.5735916, 1.068939, 1, 0, 0.5921569, 1,
1.302796, -0.1990157, 0.7701151, 1, 0, 0.5882353, 1,
1.311809, 0.7901269, 1.030514, 1, 0, 0.5803922, 1,
1.317366, 1.859542, 2.236075, 1, 0, 0.5764706, 1,
1.346796, -0.3821931, 0.5987168, 1, 0, 0.5686275, 1,
1.346826, 0.4272376, 0.7981476, 1, 0, 0.5647059, 1,
1.354088, -0.4282026, 3.163004, 1, 0, 0.5568628, 1,
1.363522, -1.411489, 1.257752, 1, 0, 0.5529412, 1,
1.386435, -2.683688, 1.780933, 1, 0, 0.5450981, 1,
1.407254, -0.1598686, 1.68615, 1, 0, 0.5411765, 1,
1.425247, 0.8628524, 0.8428599, 1, 0, 0.5333334, 1,
1.430152, 0.3864649, 2.96313, 1, 0, 0.5294118, 1,
1.436432, -0.1219857, 1.657632, 1, 0, 0.5215687, 1,
1.441361, 0.2130046, 0.6684506, 1, 0, 0.5176471, 1,
1.445643, 0.6915215, 1.958055, 1, 0, 0.509804, 1,
1.447644, -0.9254653, 2.084898, 1, 0, 0.5058824, 1,
1.450021, 1.351973, -0.9690898, 1, 0, 0.4980392, 1,
1.463442, 2.222014, 2.072331, 1, 0, 0.4901961, 1,
1.468018, 0.005324152, 1.875836, 1, 0, 0.4862745, 1,
1.474539, -0.3702215, 1.907663, 1, 0, 0.4784314, 1,
1.495109, 1.937662, -0.4303387, 1, 0, 0.4745098, 1,
1.496563, 0.8380964, 0.2692902, 1, 0, 0.4666667, 1,
1.554991, 0.2565888, 1.485518, 1, 0, 0.4627451, 1,
1.555587, -0.1107671, -0.1340599, 1, 0, 0.454902, 1,
1.559639, 0.08107866, -0.1677846, 1, 0, 0.4509804, 1,
1.562275, -0.7253892, 0.2612998, 1, 0, 0.4431373, 1,
1.562874, 0.3056041, 1.50285, 1, 0, 0.4392157, 1,
1.568256, -1.638994, 1.906226, 1, 0, 0.4313726, 1,
1.570298, -0.3658105, 3.389714, 1, 0, 0.427451, 1,
1.574329, 0.4937646, 0.3981971, 1, 0, 0.4196078, 1,
1.576571, 0.5281599, 1.886037, 1, 0, 0.4156863, 1,
1.577677, -0.1686465, 1.808302, 1, 0, 0.4078431, 1,
1.579767, -0.1062073, 0.9609628, 1, 0, 0.4039216, 1,
1.590792, -2.302936, 1.711842, 1, 0, 0.3960784, 1,
1.595785, 0.2509483, 1.211675, 1, 0, 0.3882353, 1,
1.595998, -0.2865267, 2.371878, 1, 0, 0.3843137, 1,
1.596769, 0.5937966, -0.8256207, 1, 0, 0.3764706, 1,
1.604704, -0.009040321, 0.6346604, 1, 0, 0.372549, 1,
1.608245, 0.01195654, 2.716015, 1, 0, 0.3647059, 1,
1.613342, -0.04814602, 0.6221861, 1, 0, 0.3607843, 1,
1.619325, -1.715016, 2.818231, 1, 0, 0.3529412, 1,
1.619927, -0.3033583, 0.9345022, 1, 0, 0.3490196, 1,
1.620757, 0.1933394, 1.427492, 1, 0, 0.3411765, 1,
1.622222, -0.5562521, 2.469039, 1, 0, 0.3372549, 1,
1.622736, -1.175326, 1.154769, 1, 0, 0.3294118, 1,
1.640676, -0.4672129, 2.442338, 1, 0, 0.3254902, 1,
1.640843, -0.5004765, 1.975831, 1, 0, 0.3176471, 1,
1.64496, 0.3893383, -0.03621827, 1, 0, 0.3137255, 1,
1.663339, -0.3357304, 0.8592569, 1, 0, 0.3058824, 1,
1.676204, 0.004966717, 1.546831, 1, 0, 0.2980392, 1,
1.681306, 0.8368891, 0.8404345, 1, 0, 0.2941177, 1,
1.722841, 0.04609909, 0.8179056, 1, 0, 0.2862745, 1,
1.732975, 0.3434826, 3.844406, 1, 0, 0.282353, 1,
1.73949, -0.6536826, 2.448953, 1, 0, 0.2745098, 1,
1.784224, 0.7179939, 1.756088, 1, 0, 0.2705882, 1,
1.789226, -0.09729487, 1.739165, 1, 0, 0.2627451, 1,
1.813803, 1.337713, -0.0177044, 1, 0, 0.2588235, 1,
1.821647, 0.3538565, 0.6263012, 1, 0, 0.2509804, 1,
1.837041, -0.2548044, 1.879848, 1, 0, 0.2470588, 1,
1.850136, -1.274868, 0.6680372, 1, 0, 0.2392157, 1,
1.850294, 0.3152508, 2.635751, 1, 0, 0.2352941, 1,
1.859507, -0.5910426, 1.267043, 1, 0, 0.227451, 1,
1.861659, -0.1426718, 1.640292, 1, 0, 0.2235294, 1,
1.868054, 0.7249292, 0.3188904, 1, 0, 0.2156863, 1,
1.868295, 0.2602894, 0.7264551, 1, 0, 0.2117647, 1,
1.872912, -1.153509, 1.644488, 1, 0, 0.2039216, 1,
1.874077, 0.03665091, 2.839969, 1, 0, 0.1960784, 1,
1.878157, 0.5777615, 0.8026153, 1, 0, 0.1921569, 1,
1.904678, -1.3365, 1.272325, 1, 0, 0.1843137, 1,
1.905236, 0.2313771, 1.147485, 1, 0, 0.1803922, 1,
1.907462, -1.238844, 2.872131, 1, 0, 0.172549, 1,
1.928243, 1.338718, 0.5462741, 1, 0, 0.1686275, 1,
1.929051, 0.2443611, 2.382187, 1, 0, 0.1607843, 1,
1.956844, 0.5617678, 1.885139, 1, 0, 0.1568628, 1,
1.965824, 0.9981955, 0.2739142, 1, 0, 0.1490196, 1,
1.988922, 0.813656, 1.397191, 1, 0, 0.145098, 1,
2.042937, 0.6412708, 2.054082, 1, 0, 0.1372549, 1,
2.059871, -1.440869, 3.789418, 1, 0, 0.1333333, 1,
2.060788, 1.647941, 0.1133526, 1, 0, 0.1254902, 1,
2.106132, -0.6235674, 3.481376, 1, 0, 0.1215686, 1,
2.143236, -1.066183, 0.7483558, 1, 0, 0.1137255, 1,
2.156629, -1.056952, 2.289557, 1, 0, 0.1098039, 1,
2.159917, 0.2565537, 0.6795759, 1, 0, 0.1019608, 1,
2.176861, 0.8615646, 0.2449415, 1, 0, 0.09411765, 1,
2.20226, -0.1684564, 1.374269, 1, 0, 0.09019608, 1,
2.203373, 0.2872867, 1.37222, 1, 0, 0.08235294, 1,
2.211021, -0.544773, -0.3347876, 1, 0, 0.07843138, 1,
2.245881, 1.174407, 0.6620688, 1, 0, 0.07058824, 1,
2.261158, 0.1904445, 1.752393, 1, 0, 0.06666667, 1,
2.301143, -0.3440857, 0.1450585, 1, 0, 0.05882353, 1,
2.392643, -0.06313904, 1.466301, 1, 0, 0.05490196, 1,
2.398376, 1.646367, 2.993947, 1, 0, 0.04705882, 1,
2.490206, 1.140728, 3.333788, 1, 0, 0.04313726, 1,
2.498458, 0.054199, 2.249724, 1, 0, 0.03529412, 1,
2.573747, -0.7382489, 1.321754, 1, 0, 0.03137255, 1,
2.586555, 0.1313634, 0.197783, 1, 0, 0.02352941, 1,
2.792755, -0.8372146, 1.582483, 1, 0, 0.01960784, 1,
2.954218, -0.1974478, 1.056935, 1, 0, 0.01176471, 1,
3.145709, 0.1930401, 0.8700178, 1, 0, 0.007843138, 1
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
0.06899261, -4.410535, -8.423259, 0, -0.5, 0.5, 0.5,
0.06899261, -4.410535, -8.423259, 1, -0.5, 0.5, 0.5,
0.06899261, -4.410535, -8.423259, 1, 1.5, 0.5, 0.5,
0.06899261, -4.410535, -8.423259, 0, 1.5, 0.5, 0.5
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
-4.05073, 0.512224, -8.423259, 0, -0.5, 0.5, 0.5,
-4.05073, 0.512224, -8.423259, 1, -0.5, 0.5, 0.5,
-4.05073, 0.512224, -8.423259, 1, 1.5, 0.5, 0.5,
-4.05073, 0.512224, -8.423259, 0, 1.5, 0.5, 0.5
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
-4.05073, -4.410535, -0.6799102, 0, -0.5, 0.5, 0.5,
-4.05073, -4.410535, -0.6799102, 1, -0.5, 0.5, 0.5,
-4.05073, -4.410535, -0.6799102, 1, 1.5, 0.5, 0.5,
-4.05073, -4.410535, -0.6799102, 0, 1.5, 0.5, 0.5
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
-3, -3.274514, -6.636332,
3, -3.274514, -6.636332,
-3, -3.274514, -6.636332,
-3, -3.46385, -6.934153,
-2, -3.274514, -6.636332,
-2, -3.46385, -6.934153,
-1, -3.274514, -6.636332,
-1, -3.46385, -6.934153,
0, -3.274514, -6.636332,
0, -3.46385, -6.934153,
1, -3.274514, -6.636332,
1, -3.46385, -6.934153,
2, -3.274514, -6.636332,
2, -3.46385, -6.934153,
3, -3.274514, -6.636332,
3, -3.46385, -6.934153
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
-3, -3.842524, -7.529795, 0, -0.5, 0.5, 0.5,
-3, -3.842524, -7.529795, 1, -0.5, 0.5, 0.5,
-3, -3.842524, -7.529795, 1, 1.5, 0.5, 0.5,
-3, -3.842524, -7.529795, 0, 1.5, 0.5, 0.5,
-2, -3.842524, -7.529795, 0, -0.5, 0.5, 0.5,
-2, -3.842524, -7.529795, 1, -0.5, 0.5, 0.5,
-2, -3.842524, -7.529795, 1, 1.5, 0.5, 0.5,
-2, -3.842524, -7.529795, 0, 1.5, 0.5, 0.5,
-1, -3.842524, -7.529795, 0, -0.5, 0.5, 0.5,
-1, -3.842524, -7.529795, 1, -0.5, 0.5, 0.5,
-1, -3.842524, -7.529795, 1, 1.5, 0.5, 0.5,
-1, -3.842524, -7.529795, 0, 1.5, 0.5, 0.5,
0, -3.842524, -7.529795, 0, -0.5, 0.5, 0.5,
0, -3.842524, -7.529795, 1, -0.5, 0.5, 0.5,
0, -3.842524, -7.529795, 1, 1.5, 0.5, 0.5,
0, -3.842524, -7.529795, 0, 1.5, 0.5, 0.5,
1, -3.842524, -7.529795, 0, -0.5, 0.5, 0.5,
1, -3.842524, -7.529795, 1, -0.5, 0.5, 0.5,
1, -3.842524, -7.529795, 1, 1.5, 0.5, 0.5,
1, -3.842524, -7.529795, 0, 1.5, 0.5, 0.5,
2, -3.842524, -7.529795, 0, -0.5, 0.5, 0.5,
2, -3.842524, -7.529795, 1, -0.5, 0.5, 0.5,
2, -3.842524, -7.529795, 1, 1.5, 0.5, 0.5,
2, -3.842524, -7.529795, 0, 1.5, 0.5, 0.5,
3, -3.842524, -7.529795, 0, -0.5, 0.5, 0.5,
3, -3.842524, -7.529795, 1, -0.5, 0.5, 0.5,
3, -3.842524, -7.529795, 1, 1.5, 0.5, 0.5,
3, -3.842524, -7.529795, 0, 1.5, 0.5, 0.5
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
-3.100025, -2, -6.636332,
-3.100025, 4, -6.636332,
-3.100025, -2, -6.636332,
-3.258476, -2, -6.934153,
-3.100025, 0, -6.636332,
-3.258476, 0, -6.934153,
-3.100025, 2, -6.636332,
-3.258476, 2, -6.934153,
-3.100025, 4, -6.636332,
-3.258476, 4, -6.934153
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
"2",
"4"
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
-3.575377, -2, -7.529795, 0, -0.5, 0.5, 0.5,
-3.575377, -2, -7.529795, 1, -0.5, 0.5, 0.5,
-3.575377, -2, -7.529795, 1, 1.5, 0.5, 0.5,
-3.575377, -2, -7.529795, 0, 1.5, 0.5, 0.5,
-3.575377, 0, -7.529795, 0, -0.5, 0.5, 0.5,
-3.575377, 0, -7.529795, 1, -0.5, 0.5, 0.5,
-3.575377, 0, -7.529795, 1, 1.5, 0.5, 0.5,
-3.575377, 0, -7.529795, 0, 1.5, 0.5, 0.5,
-3.575377, 2, -7.529795, 0, -0.5, 0.5, 0.5,
-3.575377, 2, -7.529795, 1, -0.5, 0.5, 0.5,
-3.575377, 2, -7.529795, 1, 1.5, 0.5, 0.5,
-3.575377, 2, -7.529795, 0, 1.5, 0.5, 0.5,
-3.575377, 4, -7.529795, 0, -0.5, 0.5, 0.5,
-3.575377, 4, -7.529795, 1, -0.5, 0.5, 0.5,
-3.575377, 4, -7.529795, 1, 1.5, 0.5, 0.5,
-3.575377, 4, -7.529795, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.100025, -3.274514, -6,
-3.100025, -3.274514, 4,
-3.100025, -3.274514, -6,
-3.258476, -3.46385, -6,
-3.100025, -3.274514, -4,
-3.258476, -3.46385, -4,
-3.100025, -3.274514, -2,
-3.258476, -3.46385, -2,
-3.100025, -3.274514, 0,
-3.258476, -3.46385, 0,
-3.100025, -3.274514, 2,
-3.258476, -3.46385, 2,
-3.100025, -3.274514, 4,
-3.258476, -3.46385, 4
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
-3.575377, -3.842524, -6, 0, -0.5, 0.5, 0.5,
-3.575377, -3.842524, -6, 1, -0.5, 0.5, 0.5,
-3.575377, -3.842524, -6, 1, 1.5, 0.5, 0.5,
-3.575377, -3.842524, -6, 0, 1.5, 0.5, 0.5,
-3.575377, -3.842524, -4, 0, -0.5, 0.5, 0.5,
-3.575377, -3.842524, -4, 1, -0.5, 0.5, 0.5,
-3.575377, -3.842524, -4, 1, 1.5, 0.5, 0.5,
-3.575377, -3.842524, -4, 0, 1.5, 0.5, 0.5,
-3.575377, -3.842524, -2, 0, -0.5, 0.5, 0.5,
-3.575377, -3.842524, -2, 1, -0.5, 0.5, 0.5,
-3.575377, -3.842524, -2, 1, 1.5, 0.5, 0.5,
-3.575377, -3.842524, -2, 0, 1.5, 0.5, 0.5,
-3.575377, -3.842524, 0, 0, -0.5, 0.5, 0.5,
-3.575377, -3.842524, 0, 1, -0.5, 0.5, 0.5,
-3.575377, -3.842524, 0, 1, 1.5, 0.5, 0.5,
-3.575377, -3.842524, 0, 0, 1.5, 0.5, 0.5,
-3.575377, -3.842524, 2, 0, -0.5, 0.5, 0.5,
-3.575377, -3.842524, 2, 1, -0.5, 0.5, 0.5,
-3.575377, -3.842524, 2, 1, 1.5, 0.5, 0.5,
-3.575377, -3.842524, 2, 0, 1.5, 0.5, 0.5,
-3.575377, -3.842524, 4, 0, -0.5, 0.5, 0.5,
-3.575377, -3.842524, 4, 1, -0.5, 0.5, 0.5,
-3.575377, -3.842524, 4, 1, 1.5, 0.5, 0.5,
-3.575377, -3.842524, 4, 0, 1.5, 0.5, 0.5
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
-3.100025, -3.274514, -6.636332,
-3.100025, 4.298962, -6.636332,
-3.100025, -3.274514, 5.276512,
-3.100025, 4.298962, 5.276512,
-3.100025, -3.274514, -6.636332,
-3.100025, -3.274514, 5.276512,
-3.100025, 4.298962, -6.636332,
-3.100025, 4.298962, 5.276512,
-3.100025, -3.274514, -6.636332,
3.23801, -3.274514, -6.636332,
-3.100025, -3.274514, 5.276512,
3.23801, -3.274514, 5.276512,
-3.100025, 4.298962, -6.636332,
3.23801, 4.298962, -6.636332,
-3.100025, 4.298962, 5.276512,
3.23801, 4.298962, 5.276512,
3.23801, -3.274514, -6.636332,
3.23801, 4.298962, -6.636332,
3.23801, -3.274514, 5.276512,
3.23801, 4.298962, 5.276512,
3.23801, -3.274514, -6.636332,
3.23801, -3.274514, 5.276512,
3.23801, 4.298962, -6.636332,
3.23801, 4.298962, 5.276512
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
var radius = 8.262805;
var distance = 36.76215;
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
mvMatrix.translate( -0.06899261, -0.512224, 0.6799102 );
mvMatrix.scale( 1.40957, 1.179631, 0.749939 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.76215);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
ethalfluralin<-read.table("ethalfluralin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethalfluralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethalfluralin' not found
```

```r
y<-ethalfluralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethalfluralin' not found
```

```r
z<-ethalfluralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethalfluralin' not found
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
-3.007723, 1.097553, -2.347524, 0, 0, 1, 1, 1,
-2.881874, -0.9247227, -0.5564809, 1, 0, 0, 1, 1,
-2.779934, -0.6685034, -0.8022544, 1, 0, 0, 1, 1,
-2.767446, -0.3716973, -2.802649, 1, 0, 0, 1, 1,
-2.685494, -0.6835344, -1.223171, 1, 0, 0, 1, 1,
-2.628446, 0.195018, -0.5898653, 1, 0, 0, 1, 1,
-2.565861, -0.7167937, -1.476497, 0, 0, 0, 1, 1,
-2.485774, 0.02959871, -2.124775, 0, 0, 0, 1, 1,
-2.255085, -0.7669899, -5.487061, 0, 0, 0, 1, 1,
-2.250388, 2.914461, -0.6075342, 0, 0, 0, 1, 1,
-2.191187, -0.3945177, -3.635731, 0, 0, 0, 1, 1,
-2.187273, -0.02472766, -3.56598, 0, 0, 0, 1, 1,
-2.173748, -1.108049, -3.803945, 0, 0, 0, 1, 1,
-2.171539, -0.99672, -1.604685, 1, 1, 1, 1, 1,
-2.133916, -0.8732267, -2.769013, 1, 1, 1, 1, 1,
-2.101628, 0.4519671, -0.8242271, 1, 1, 1, 1, 1,
-2.070747, -0.7458243, -2.683867, 1, 1, 1, 1, 1,
-2.051462, -0.04807863, 0.4938806, 1, 1, 1, 1, 1,
-2.026124, -0.4136767, -1.871222, 1, 1, 1, 1, 1,
-2.012409, -0.1059509, 0.2023674, 1, 1, 1, 1, 1,
-1.996855, -1.599373, -2.455531, 1, 1, 1, 1, 1,
-1.995734, 1.048794, -2.087618, 1, 1, 1, 1, 1,
-1.985056, -0.08055087, -1.141265, 1, 1, 1, 1, 1,
-1.936048, 0.1805804, -0.8209067, 1, 1, 1, 1, 1,
-1.930638, 0.1430489, -3.498317, 1, 1, 1, 1, 1,
-1.926096, 0.1221102, -1.923895, 1, 1, 1, 1, 1,
-1.914333, -0.6891328, -1.307133, 1, 1, 1, 1, 1,
-1.879205, -3.16422, -4.215038, 1, 1, 1, 1, 1,
-1.874655, 0.7325567, -1.264166, 0, 0, 1, 1, 1,
-1.87052, -1.480031, -0.8548473, 1, 0, 0, 1, 1,
-1.853644, 0.4886208, -2.472054, 1, 0, 0, 1, 1,
-1.846442, 0.3046269, -0.593765, 1, 0, 0, 1, 1,
-1.819493, 0.1280494, -0.4129743, 1, 0, 0, 1, 1,
-1.80936, 1.517642, -1.692858, 1, 0, 0, 1, 1,
-1.789645, -1.678117, -0.079294, 0, 0, 0, 1, 1,
-1.778388, -1.583644, -3.206875, 0, 0, 0, 1, 1,
-1.764814, 0.4227396, 0.1178079, 0, 0, 0, 1, 1,
-1.759084, 0.6215495, -1.424909, 0, 0, 0, 1, 1,
-1.732059, -0.7604219, -0.5237599, 0, 0, 0, 1, 1,
-1.729858, -0.8428766, -0.5632408, 0, 0, 0, 1, 1,
-1.706455, 1.431114, -1.067827, 0, 0, 0, 1, 1,
-1.704, -0.08098527, -2.171432, 1, 1, 1, 1, 1,
-1.702557, -0.3371952, -2.910907, 1, 1, 1, 1, 1,
-1.69276, -2.013525, -2.803396, 1, 1, 1, 1, 1,
-1.688147, -0.4552281, -3.842656, 1, 1, 1, 1, 1,
-1.684439, -1.913703, -3.043458, 1, 1, 1, 1, 1,
-1.663012, 1.494693, -1.155331, 1, 1, 1, 1, 1,
-1.654143, -1.672961, -1.073255, 1, 1, 1, 1, 1,
-1.613925, 0.3742605, -0.9127138, 1, 1, 1, 1, 1,
-1.605438, -1.465431, -3.224442, 1, 1, 1, 1, 1,
-1.596256, 1.150173, -2.55196, 1, 1, 1, 1, 1,
-1.593866, -1.140615, -3.071767, 1, 1, 1, 1, 1,
-1.593422, 1.046408, -0.8188781, 1, 1, 1, 1, 1,
-1.588688, -0.6652007, -2.29916, 1, 1, 1, 1, 1,
-1.575776, 0.2179302, -1.012898, 1, 1, 1, 1, 1,
-1.569299, -0.3038161, -1.61838, 1, 1, 1, 1, 1,
-1.552158, -0.6301386, -0.5859768, 0, 0, 1, 1, 1,
-1.540196, 0.6563172, -2.345115, 1, 0, 0, 1, 1,
-1.533786, -0.3705921, -1.531114, 1, 0, 0, 1, 1,
-1.521259, -1.314884, -0.9226339, 1, 0, 0, 1, 1,
-1.518994, 1.635309, 1.343155, 1, 0, 0, 1, 1,
-1.512803, -0.2379702, -1.585618, 1, 0, 0, 1, 1,
-1.505815, 0.7002078, -1.955456, 0, 0, 0, 1, 1,
-1.498962, 1.479906, -1.958131, 0, 0, 0, 1, 1,
-1.494934, 1.073963, 0.1980251, 0, 0, 0, 1, 1,
-1.485825, 0.6638659, -1.944025, 0, 0, 0, 1, 1,
-1.481892, 0.3287688, -1.18057, 0, 0, 0, 1, 1,
-1.480893, 0.747936, -2.326652, 0, 0, 0, 1, 1,
-1.478503, -0.6964642, -1.066894, 0, 0, 0, 1, 1,
-1.477877, 0.1444104, -1.943661, 1, 1, 1, 1, 1,
-1.471899, 0.4405803, -0.1452743, 1, 1, 1, 1, 1,
-1.46296, 1.390971, 1.181512, 1, 1, 1, 1, 1,
-1.459564, 0.3325214, -0.442798, 1, 1, 1, 1, 1,
-1.458118, -0.2935821, -0.9333847, 1, 1, 1, 1, 1,
-1.452726, -0.2326456, -2.283982, 1, 1, 1, 1, 1,
-1.438292, -1.093412, -5.278961, 1, 1, 1, 1, 1,
-1.436424, -0.05934642, -2.028225, 1, 1, 1, 1, 1,
-1.431946, -1.030835, -2.755177, 1, 1, 1, 1, 1,
-1.421453, 0.4250119, 0.2400805, 1, 1, 1, 1, 1,
-1.413087, 0.7269621, 0.7339219, 1, 1, 1, 1, 1,
-1.412649, 1.343652, -0.5171339, 1, 1, 1, 1, 1,
-1.410224, -1.90247, -4.277842, 1, 1, 1, 1, 1,
-1.408188, -0.7578509, -1.431201, 1, 1, 1, 1, 1,
-1.404449, -0.6846773, -2.531743, 1, 1, 1, 1, 1,
-1.403481, 0.01306148, -2.007972, 0, 0, 1, 1, 1,
-1.400292, 2.519114, -0.04173695, 1, 0, 0, 1, 1,
-1.390172, -1.192817, -3.626824, 1, 0, 0, 1, 1,
-1.375897, -1.032576, -0.9250274, 1, 0, 0, 1, 1,
-1.373294, 1.140618, -3.143258, 1, 0, 0, 1, 1,
-1.367737, 0.8722321, -1.877055, 1, 0, 0, 1, 1,
-1.357331, -1.216255, -2.564286, 0, 0, 0, 1, 1,
-1.354465, -0.6711956, -2.663273, 0, 0, 0, 1, 1,
-1.354226, 0.5546938, -0.8376523, 0, 0, 0, 1, 1,
-1.352243, -0.3450557, -3.32321, 0, 0, 0, 1, 1,
-1.350036, -0.3947162, -2.444022, 0, 0, 0, 1, 1,
-1.344534, 0.1111723, -0.1965711, 0, 0, 0, 1, 1,
-1.33613, -0.6783633, -3.485468, 0, 0, 0, 1, 1,
-1.33058, -0.2542253, -2.690063, 1, 1, 1, 1, 1,
-1.323521, -0.1142335, -2.18038, 1, 1, 1, 1, 1,
-1.322178, 1.902254, -0.5746976, 1, 1, 1, 1, 1,
-1.321105, 0.814221, -1.813843, 1, 1, 1, 1, 1,
-1.315672, 0.05462299, -0.5135275, 1, 1, 1, 1, 1,
-1.313242, -0.2333086, -2.418477, 1, 1, 1, 1, 1,
-1.308348, 2.349616, -0.9285747, 1, 1, 1, 1, 1,
-1.305432, -1.113968, -3.475437, 1, 1, 1, 1, 1,
-1.304566, 0.5379165, -1.723965, 1, 1, 1, 1, 1,
-1.295526, 0.8653043, -2.535587, 1, 1, 1, 1, 1,
-1.294809, -0.4230605, -1.2961, 1, 1, 1, 1, 1,
-1.292419, -1.158878, -2.08251, 1, 1, 1, 1, 1,
-1.290564, -0.09563579, -1.377005, 1, 1, 1, 1, 1,
-1.289324, -0.2365724, -2.365551, 1, 1, 1, 1, 1,
-1.288458, 1.102999, -0.3810328, 1, 1, 1, 1, 1,
-1.279447, -0.1671623, -1.345217, 0, 0, 1, 1, 1,
-1.279396, 0.5060357, -0.3812987, 1, 0, 0, 1, 1,
-1.262905, -2.570941, -0.5947639, 1, 0, 0, 1, 1,
-1.261443, 1.453512, -0.5837732, 1, 0, 0, 1, 1,
-1.260016, 0.493781, -1.293833, 1, 0, 0, 1, 1,
-1.254871, -0.1029769, -3.910005, 1, 0, 0, 1, 1,
-1.252574, -1.32251, -2.922385, 0, 0, 0, 1, 1,
-1.247936, -0.2261062, -1.973493, 0, 0, 0, 1, 1,
-1.244016, -0.7749703, -2.300498, 0, 0, 0, 1, 1,
-1.240182, -0.3082312, -1.837438, 0, 0, 0, 1, 1,
-1.228603, 0.09989583, -1.448453, 0, 0, 0, 1, 1,
-1.222574, -0.3064604, -1.11357, 0, 0, 0, 1, 1,
-1.221219, 1.427377, -1.063976, 0, 0, 0, 1, 1,
-1.219984, -1.206005, -2.233337, 1, 1, 1, 1, 1,
-1.219853, -1.082097, -2.541699, 1, 1, 1, 1, 1,
-1.218853, -0.6658519, -1.49926, 1, 1, 1, 1, 1,
-1.210265, -0.8909275, -2.041438, 1, 1, 1, 1, 1,
-1.208151, -0.3466118, -1.569796, 1, 1, 1, 1, 1,
-1.186956, -0.4020379, -1.291803, 1, 1, 1, 1, 1,
-1.181412, 1.756601, 0.6331604, 1, 1, 1, 1, 1,
-1.174661, 0.770105, -1.231876, 1, 1, 1, 1, 1,
-1.172654, 1.664639, -2.677789, 1, 1, 1, 1, 1,
-1.169188, -1.253229, -1.672031, 1, 1, 1, 1, 1,
-1.166803, -0.1613355, -1.990945, 1, 1, 1, 1, 1,
-1.16193, 0.7029102, -3.717478, 1, 1, 1, 1, 1,
-1.158354, 1.29034, -0.3859614, 1, 1, 1, 1, 1,
-1.155864, 0.7107266, -0.1242382, 1, 1, 1, 1, 1,
-1.155603, 0.7748588, 0.6227676, 1, 1, 1, 1, 1,
-1.14052, -0.768175, -3.17676, 0, 0, 1, 1, 1,
-1.133509, 1.749597, 0.9410144, 1, 0, 0, 1, 1,
-1.13209, -0.951777, -1.731225, 1, 0, 0, 1, 1,
-1.126021, -1.574612, -2.80538, 1, 0, 0, 1, 1,
-1.116117, -0.864006, 0.1954267, 1, 0, 0, 1, 1,
-1.109824, 0.06172607, -1.965732, 1, 0, 0, 1, 1,
-1.107408, 0.4556955, 0.3145748, 0, 0, 0, 1, 1,
-1.098416, -1.320893, -2.342563, 0, 0, 0, 1, 1,
-1.095947, 0.1494188, -0.478648, 0, 0, 0, 1, 1,
-1.090711, -0.2694948, -1.332486, 0, 0, 0, 1, 1,
-1.085064, -0.464543, -2.390925, 0, 0, 0, 1, 1,
-1.084795, -1.170364, -2.367583, 0, 0, 0, 1, 1,
-1.083636, -0.1441637, -1.210955, 0, 0, 0, 1, 1,
-1.08115, -1.227799, -3.762707, 1, 1, 1, 1, 1,
-1.079181, 0.155628, -0.7734348, 1, 1, 1, 1, 1,
-1.068961, -0.4045611, -3.113176, 1, 1, 1, 1, 1,
-1.058364, -0.6446628, -2.545895, 1, 1, 1, 1, 1,
-1.055019, 1.026208, -2.129764, 1, 1, 1, 1, 1,
-1.053727, 0.653, -1.511371, 1, 1, 1, 1, 1,
-1.04905, -0.3954784, -2.129209, 1, 1, 1, 1, 1,
-1.041194, -0.8610398, -2.329088, 1, 1, 1, 1, 1,
-1.036815, 1.350839, -0.8386681, 1, 1, 1, 1, 1,
-1.034093, -0.5163533, -0.8106294, 1, 1, 1, 1, 1,
-1.031637, -0.6397009, -1.341964, 1, 1, 1, 1, 1,
-1.027198, 0.879986, -0.8906998, 1, 1, 1, 1, 1,
-1.01961, -0.8135027, -3.10907, 1, 1, 1, 1, 1,
-1.018101, -0.1305715, -2.315975, 1, 1, 1, 1, 1,
-1.017245, 0.6521003, -0.397565, 1, 1, 1, 1, 1,
-0.9937077, 1.216756, -0.1104553, 0, 0, 1, 1, 1,
-0.9906934, 1.404585, -2.028338, 1, 0, 0, 1, 1,
-0.9705678, 0.5150837, -2.359065, 1, 0, 0, 1, 1,
-0.9701152, -1.375533, -1.614039, 1, 0, 0, 1, 1,
-0.9689404, -2.399752, -4.933867, 1, 0, 0, 1, 1,
-0.9611688, 0.7173426, -3.025094, 1, 0, 0, 1, 1,
-0.960896, 0.2564512, -1.843023, 0, 0, 0, 1, 1,
-0.9608428, 1.449088, 2.065601, 0, 0, 0, 1, 1,
-0.9578502, 1.189218, -1.121822, 0, 0, 0, 1, 1,
-0.9537158, -0.1500593, 0.004891044, 0, 0, 0, 1, 1,
-0.9522606, -0.7961307, -3.023589, 0, 0, 0, 1, 1,
-0.9486052, -0.9350861, -2.160643, 0, 0, 0, 1, 1,
-0.9458082, 1.484383, -0.9674498, 0, 0, 0, 1, 1,
-0.9423606, 0.07455215, -0.9643046, 1, 1, 1, 1, 1,
-0.9410051, -0.1116121, -1.557111, 1, 1, 1, 1, 1,
-0.9399866, -1.237549, -3.193724, 1, 1, 1, 1, 1,
-0.9377405, 1.254316, -0.1533591, 1, 1, 1, 1, 1,
-0.9351826, -0.9244477, -1.617812, 1, 1, 1, 1, 1,
-0.9323397, -1.951082, -1.681785, 1, 1, 1, 1, 1,
-0.9306069, 0.6404714, -2.158344, 1, 1, 1, 1, 1,
-0.9221784, 0.8596326, -2.193039, 1, 1, 1, 1, 1,
-0.9202799, 1.715524, -2.758362, 1, 1, 1, 1, 1,
-0.9066796, -2.174212, -2.885208, 1, 1, 1, 1, 1,
-0.9032115, 1.767652, -0.5270796, 1, 1, 1, 1, 1,
-0.9027603, 0.5265632, -3.117278, 1, 1, 1, 1, 1,
-0.9006882, 0.6309023, -1.630851, 1, 1, 1, 1, 1,
-0.8957723, 2.157719, -0.4298179, 1, 1, 1, 1, 1,
-0.885659, 0.1585387, -1.102899, 1, 1, 1, 1, 1,
-0.8786963, 0.8686457, -0.4333167, 0, 0, 1, 1, 1,
-0.8762217, 0.6632741, -1.995398, 1, 0, 0, 1, 1,
-0.875719, 0.4919047, -1.744077, 1, 0, 0, 1, 1,
-0.8747011, -0.6102014, -2.757286, 1, 0, 0, 1, 1,
-0.8723205, 0.5432729, -3.094958, 1, 0, 0, 1, 1,
-0.8712335, 0.3264938, -2.082014, 1, 0, 0, 1, 1,
-0.8643658, 1.560288, -1.482359, 0, 0, 0, 1, 1,
-0.8627328, -0.5248169, -1.742948, 0, 0, 0, 1, 1,
-0.8595397, 0.72655, -1.337494, 0, 0, 0, 1, 1,
-0.8534148, -0.9865235, -4.030558, 0, 0, 0, 1, 1,
-0.8499262, 0.2808042, -0.6626497, 0, 0, 0, 1, 1,
-0.8454452, -0.5317999, -2.365918, 0, 0, 0, 1, 1,
-0.8435376, -1.244926, -3.522506, 0, 0, 0, 1, 1,
-0.8379851, -0.2766353, -3.150813, 1, 1, 1, 1, 1,
-0.8311114, 0.6245279, 1.10094, 1, 1, 1, 1, 1,
-0.8278053, -0.08121818, -1.374289, 1, 1, 1, 1, 1,
-0.8213854, -0.6366084, -3.554808, 1, 1, 1, 1, 1,
-0.8192868, -0.1785094, -2.488894, 1, 1, 1, 1, 1,
-0.8154448, -0.1507074, -2.729764, 1, 1, 1, 1, 1,
-0.8151368, 2.175291, 0.7249457, 1, 1, 1, 1, 1,
-0.8123256, -1.288034, -2.417576, 1, 1, 1, 1, 1,
-0.8118656, 0.8957506, -0.2589507, 1, 1, 1, 1, 1,
-0.8059967, 0.9399226, 0.4068562, 1, 1, 1, 1, 1,
-0.7955528, 0.08944202, -0.427907, 1, 1, 1, 1, 1,
-0.7946589, -0.2094811, -1.759128, 1, 1, 1, 1, 1,
-0.7888567, 0.9500288, 0.6236801, 1, 1, 1, 1, 1,
-0.7864964, -1.186915, -3.254594, 1, 1, 1, 1, 1,
-0.783932, 0.9374625, -0.8396105, 1, 1, 1, 1, 1,
-0.7832674, 0.4201282, -2.298681, 0, 0, 1, 1, 1,
-0.7832038, 0.1200576, -0.08007909, 1, 0, 0, 1, 1,
-0.7744412, -0.7802266, -2.550062, 1, 0, 0, 1, 1,
-0.7669706, 2.363062, -1.213308, 1, 0, 0, 1, 1,
-0.7545783, -1.038922, -3.927334, 1, 0, 0, 1, 1,
-0.7453151, 0.06124304, -2.819199, 1, 0, 0, 1, 1,
-0.7448136, -1.163743, -2.613208, 0, 0, 0, 1, 1,
-0.7401256, -0.6294226, -1.997562, 0, 0, 0, 1, 1,
-0.737566, -0.5346627, -1.791949, 0, 0, 0, 1, 1,
-0.7351752, -1.861843, -1.742013, 0, 0, 0, 1, 1,
-0.7351024, -0.3368777, -1.412798, 0, 0, 0, 1, 1,
-0.7343307, 0.2342887, -1.063692, 0, 0, 0, 1, 1,
-0.7316262, 0.2607963, 0.4326364, 0, 0, 0, 1, 1,
-0.7273261, 0.2160398, -1.640785, 1, 1, 1, 1, 1,
-0.7177762, 0.6276603, -0.6401704, 1, 1, 1, 1, 1,
-0.7167156, -0.7603219, -2.220434, 1, 1, 1, 1, 1,
-0.7165707, 0.1912542, -2.446859, 1, 1, 1, 1, 1,
-0.7154533, 1.037018, -2.76829, 1, 1, 1, 1, 1,
-0.7131287, -2.251262, -3.102976, 1, 1, 1, 1, 1,
-0.7057666, -1.476249, -6.462844, 1, 1, 1, 1, 1,
-0.7053429, 0.3423999, 0.576518, 1, 1, 1, 1, 1,
-0.7004225, -0.1824009, 0.3210984, 1, 1, 1, 1, 1,
-0.7002591, 1.287737, 1.307925, 1, 1, 1, 1, 1,
-0.6980049, 0.4979293, -2.015187, 1, 1, 1, 1, 1,
-0.6921186, -0.9903808, -0.6798389, 1, 1, 1, 1, 1,
-0.691919, -0.3253669, -1.994495, 1, 1, 1, 1, 1,
-0.6887763, 0.2133329, -1.029254, 1, 1, 1, 1, 1,
-0.6864166, -0.5911266, -2.101588, 1, 1, 1, 1, 1,
-0.6846749, -0.6650375, -0.8063909, 0, 0, 1, 1, 1,
-0.6833273, -1.730783, -2.125771, 1, 0, 0, 1, 1,
-0.679306, -1.196745, -1.505185, 1, 0, 0, 1, 1,
-0.6756558, -0.1183621, -1.781491, 1, 0, 0, 1, 1,
-0.6712142, 0.9594596, 0.9296792, 1, 0, 0, 1, 1,
-0.6663358, 0.5988765, -1.303305, 1, 0, 0, 1, 1,
-0.6662077, 0.9791816, 0.6884578, 0, 0, 0, 1, 1,
-0.6632754, 0.2178158, -3.549347, 0, 0, 0, 1, 1,
-0.6547673, 1.002878, -0.07041509, 0, 0, 0, 1, 1,
-0.6525841, -1.191665, -3.055627, 0, 0, 0, 1, 1,
-0.6511467, -0.09804607, -1.201972, 0, 0, 0, 1, 1,
-0.6501611, 0.4384176, -0.807434, 0, 0, 0, 1, 1,
-0.6441324, -0.4356111, -4.098104, 0, 0, 0, 1, 1,
-0.6405863, -1.610867, -3.427722, 1, 1, 1, 1, 1,
-0.6404174, -0.954262, -2.950916, 1, 1, 1, 1, 1,
-0.6402424, 0.2991391, -1.684151, 1, 1, 1, 1, 1,
-0.6353846, -1.034124, -4.120757, 1, 1, 1, 1, 1,
-0.6345894, -0.3974967, -3.343825, 1, 1, 1, 1, 1,
-0.6343634, 0.4592096, -0.2311851, 1, 1, 1, 1, 1,
-0.6287286, -0.5447795, -2.079647, 1, 1, 1, 1, 1,
-0.6186682, -1.525014, -2.574324, 1, 1, 1, 1, 1,
-0.6178084, -0.8396887, -4.10884, 1, 1, 1, 1, 1,
-0.6155237, 0.1945062, -2.237194, 1, 1, 1, 1, 1,
-0.614222, -0.3490505, -1.347515, 1, 1, 1, 1, 1,
-0.6141431, -2.815447, -3.458463, 1, 1, 1, 1, 1,
-0.61366, -0.157232, -2.019668, 1, 1, 1, 1, 1,
-0.6132312, 0.3040699, -3.47669, 1, 1, 1, 1, 1,
-0.6097369, 0.7669061, -0.7947347, 1, 1, 1, 1, 1,
-0.6085976, -1.081179, -2.059902, 0, 0, 1, 1, 1,
-0.6036626, 2.216632, -2.640341, 1, 0, 0, 1, 1,
-0.6014537, -0.9612419, -3.098836, 1, 0, 0, 1, 1,
-0.600134, -0.2296037, -1.303035, 1, 0, 0, 1, 1,
-0.5994905, -1.520916, -1.78894, 1, 0, 0, 1, 1,
-0.5955902, 0.1259858, -1.536155, 1, 0, 0, 1, 1,
-0.5916151, -0.4516137, -1.93649, 0, 0, 0, 1, 1,
-0.5871021, 0.2150211, -2.194, 0, 0, 0, 1, 1,
-0.5846909, -0.06057284, -1.459489, 0, 0, 0, 1, 1,
-0.5839172, -0.9133663, -1.484877, 0, 0, 0, 1, 1,
-0.5816917, 1.038617, 0.02477938, 0, 0, 0, 1, 1,
-0.5811114, -1.526276, -2.17441, 0, 0, 0, 1, 1,
-0.5808156, -0.4718119, -3.575239, 0, 0, 0, 1, 1,
-0.5729049, 0.4617906, -1.336224, 1, 1, 1, 1, 1,
-0.5723456, -1.134176, -3.809267, 1, 1, 1, 1, 1,
-0.5700582, -1.429836, -2.304467, 1, 1, 1, 1, 1,
-0.5698738, 0.008920711, -3.51389, 1, 1, 1, 1, 1,
-0.5694731, -1.199769, -2.945302, 1, 1, 1, 1, 1,
-0.5662639, 0.481791, -0.5859154, 1, 1, 1, 1, 1,
-0.5643274, 1.675271, -0.9067178, 1, 1, 1, 1, 1,
-0.5639597, -1.800345, -2.73285, 1, 1, 1, 1, 1,
-0.5630942, -0.280718, -1.908834, 1, 1, 1, 1, 1,
-0.5612716, -0.05354525, -0.24236, 1, 1, 1, 1, 1,
-0.5606132, -1.370252, -3.042241, 1, 1, 1, 1, 1,
-0.5580692, 0.1843032, -2.988924, 1, 1, 1, 1, 1,
-0.5565228, 0.6981814, -1.28127, 1, 1, 1, 1, 1,
-0.5561389, 1.193781, 0.1133533, 1, 1, 1, 1, 1,
-0.5556946, 0.6000136, -0.6241452, 1, 1, 1, 1, 1,
-0.5550278, 1.696619, -0.9101518, 0, 0, 1, 1, 1,
-0.5505819, 1.931266, -0.1765154, 1, 0, 0, 1, 1,
-0.5485103, 0.6640772, -0.1219355, 1, 0, 0, 1, 1,
-0.5484865, -0.8299118, -3.151888, 1, 0, 0, 1, 1,
-0.5481921, -0.1781954, -1.184618, 1, 0, 0, 1, 1,
-0.546086, -0.3786423, -1.060336, 1, 0, 0, 1, 1,
-0.5321664, 0.9742525, -1.312098, 0, 0, 0, 1, 1,
-0.5286151, -0.9054798, -4.148676, 0, 0, 0, 1, 1,
-0.5268133, -0.3084228, -1.530298, 0, 0, 0, 1, 1,
-0.5233462, -0.7358158, -4.52167, 0, 0, 0, 1, 1,
-0.517724, 1.205416, 0.4388117, 0, 0, 0, 1, 1,
-0.5173494, 0.4998744, -1.145984, 0, 0, 0, 1, 1,
-0.5062978, -0.8396629, -1.391231, 0, 0, 0, 1, 1,
-0.5049694, 0.2825754, -2.179438, 1, 1, 1, 1, 1,
-0.5045111, -0.3521338, -1.991773, 1, 1, 1, 1, 1,
-0.5042625, 1.185923, 0.6167943, 1, 1, 1, 1, 1,
-0.5008473, -0.6414499, -3.287689, 1, 1, 1, 1, 1,
-0.4989718, -1.309731, -3.590816, 1, 1, 1, 1, 1,
-0.4754889, -0.4756268, -1.504654, 1, 1, 1, 1, 1,
-0.4746712, -0.05965723, -2.116796, 1, 1, 1, 1, 1,
-0.4732141, 1.416569, 1.945695, 1, 1, 1, 1, 1,
-0.4725311, 0.637966, -0.2344455, 1, 1, 1, 1, 1,
-0.4676741, -0.2131693, -2.580971, 1, 1, 1, 1, 1,
-0.46589, -1.114188, -2.437316, 1, 1, 1, 1, 1,
-0.461943, 1.532507, -1.706847, 1, 1, 1, 1, 1,
-0.4567589, -0.808033, -4.260316, 1, 1, 1, 1, 1,
-0.45559, -0.07893687, -1.462615, 1, 1, 1, 1, 1,
-0.4527951, -0.501087, -3.656051, 1, 1, 1, 1, 1,
-0.451669, 1.347023, -0.2915925, 0, 0, 1, 1, 1,
-0.4516087, -1.517069, -2.300769, 1, 0, 0, 1, 1,
-0.449235, 0.1912277, -1.314731, 1, 0, 0, 1, 1,
-0.4484226, -0.4348621, -1.349428, 1, 0, 0, 1, 1,
-0.4390885, -0.280026, -0.3370863, 1, 0, 0, 1, 1,
-0.4385323, -2.080824, -4.172139, 1, 0, 0, 1, 1,
-0.4366794, -1.357744, -3.701097, 0, 0, 0, 1, 1,
-0.4359667, 0.9314911, -0.9030617, 0, 0, 0, 1, 1,
-0.4347915, -0.9249887, -4.489687, 0, 0, 0, 1, 1,
-0.4339783, -0.2690402, -1.421762, 0, 0, 0, 1, 1,
-0.4305638, 0.2138341, -0.3457513, 0, 0, 0, 1, 1,
-0.4260756, -0.06756931, -2.977654, 0, 0, 0, 1, 1,
-0.4194446, -0.3352302, -2.984791, 0, 0, 0, 1, 1,
-0.4178501, 0.7067106, 0.02304097, 1, 1, 1, 1, 1,
-0.4156821, 0.8771461, -0.9435124, 1, 1, 1, 1, 1,
-0.4098223, 1.708486, 1.745174, 1, 1, 1, 1, 1,
-0.4044202, 0.7189793, -0.6986914, 1, 1, 1, 1, 1,
-0.399141, 1.437405, -0.8690908, 1, 1, 1, 1, 1,
-0.3960028, 1.215142, 0.5845888, 1, 1, 1, 1, 1,
-0.3918613, -0.7893672, -3.45739, 1, 1, 1, 1, 1,
-0.3916574, 0.3874356, -1.495726, 1, 1, 1, 1, 1,
-0.3893224, 0.6588119, -0.288429, 1, 1, 1, 1, 1,
-0.3825513, 1.089206, -0.1511637, 1, 1, 1, 1, 1,
-0.3708512, -0.6988372, -1.458674, 1, 1, 1, 1, 1,
-0.3708174, 0.1908667, -2.78385, 1, 1, 1, 1, 1,
-0.3690061, 2.034378, -0.1627567, 1, 1, 1, 1, 1,
-0.3637274, 0.748459, -1.227414, 1, 1, 1, 1, 1,
-0.358332, -0.1356908, -0.9551823, 1, 1, 1, 1, 1,
-0.3562334, -0.07095599, -2.489861, 0, 0, 1, 1, 1,
-0.3515078, 1.527218, -2.523198, 1, 0, 0, 1, 1,
-0.3510768, 1.632362, -0.1294248, 1, 0, 0, 1, 1,
-0.3500368, -1.564741, -2.351215, 1, 0, 0, 1, 1,
-0.3430538, 0.5603268, -2.118085, 1, 0, 0, 1, 1,
-0.3374845, -1.038287, -2.485037, 1, 0, 0, 1, 1,
-0.3352269, -0.6011537, -2.142324, 0, 0, 0, 1, 1,
-0.3337873, -0.7353618, -2.775111, 0, 0, 0, 1, 1,
-0.33368, -2.839214, -3.010906, 0, 0, 0, 1, 1,
-0.3306463, 0.1913663, -1.431525, 0, 0, 0, 1, 1,
-0.3265726, 0.3816237, 0.4220499, 0, 0, 0, 1, 1,
-0.3227706, -0.4187696, -2.552759, 0, 0, 0, 1, 1,
-0.3195012, -1.092123, -2.639223, 0, 0, 0, 1, 1,
-0.3194541, 0.3191856, -0.9257759, 1, 1, 1, 1, 1,
-0.3165589, -0.07389417, -2.334256, 1, 1, 1, 1, 1,
-0.3162631, 0.4546566, 1.020772, 1, 1, 1, 1, 1,
-0.3100273, 0.5670497, -1.059781, 1, 1, 1, 1, 1,
-0.3092131, -0.2037657, -2.886508, 1, 1, 1, 1, 1,
-0.3079178, -0.8869591, -2.884917, 1, 1, 1, 1, 1,
-0.3064731, -0.4170081, -2.765725, 1, 1, 1, 1, 1,
-0.3047966, 1.001635, -1.770639, 1, 1, 1, 1, 1,
-0.3028902, -0.0593944, -2.789913, 1, 1, 1, 1, 1,
-0.3017456, -0.108684, -4.54544, 1, 1, 1, 1, 1,
-0.3001254, -1.048434, -0.2861615, 1, 1, 1, 1, 1,
-0.2947467, 0.07088245, -3.269848, 1, 1, 1, 1, 1,
-0.2944295, -0.9099276, -2.98142, 1, 1, 1, 1, 1,
-0.2900093, 0.0840239, -0.03305919, 1, 1, 1, 1, 1,
-0.2871913, 0.8686089, -0.2656209, 1, 1, 1, 1, 1,
-0.286525, 0.5693291, -0.9854597, 0, 0, 1, 1, 1,
-0.2847809, 1.647379, 0.8547844, 1, 0, 0, 1, 1,
-0.2783392, -1.36947, -1.121301, 1, 0, 0, 1, 1,
-0.2754445, -1.601546, -3.674261, 1, 0, 0, 1, 1,
-0.2728402, -0.7851009, -2.480421, 1, 0, 0, 1, 1,
-0.2721952, 0.4182656, 0.01850004, 1, 0, 0, 1, 1,
-0.2698482, 0.6708686, -1.204679, 0, 0, 0, 1, 1,
-0.2683442, -0.5030239, -2.325901, 0, 0, 0, 1, 1,
-0.2632468, 0.02298358, 0.2418638, 0, 0, 0, 1, 1,
-0.2604518, 0.4216973, -0.9647662, 0, 0, 0, 1, 1,
-0.2589985, 0.4981121, -0.7714284, 0, 0, 0, 1, 1,
-0.2570957, 1.660548, -1.082577, 0, 0, 0, 1, 1,
-0.256723, 0.2083886, -0.4756493, 0, 0, 0, 1, 1,
-0.2563902, 1.377633, 0.2737714, 1, 1, 1, 1, 1,
-0.2544203, -0.4764051, -2.485245, 1, 1, 1, 1, 1,
-0.254248, 0.5730563, -0.1601435, 1, 1, 1, 1, 1,
-0.245591, 0.8269789, -1.840744, 1, 1, 1, 1, 1,
-0.2439186, -0.08236223, -1.949977, 1, 1, 1, 1, 1,
-0.2413151, 0.9194124, 0.2977124, 1, 1, 1, 1, 1,
-0.2362876, -0.06022273, -0.5203563, 1, 1, 1, 1, 1,
-0.2351982, -0.9566395, -1.877757, 1, 1, 1, 1, 1,
-0.2335618, 0.4241996, 1.374863, 1, 1, 1, 1, 1,
-0.2327759, -1.158687, -3.007194, 1, 1, 1, 1, 1,
-0.230833, -0.3940607, -2.763073, 1, 1, 1, 1, 1,
-0.2294182, 0.3837884, -0.5883803, 1, 1, 1, 1, 1,
-0.2218223, -1.372666, -4.17071, 1, 1, 1, 1, 1,
-0.221776, -1.484823, -2.045878, 1, 1, 1, 1, 1,
-0.2213182, -0.4561868, -3.097964, 1, 1, 1, 1, 1,
-0.212222, 0.1552349, -1.445114, 0, 0, 1, 1, 1,
-0.2042806, -1.01303, -3.401215, 1, 0, 0, 1, 1,
-0.2042223, 1.067166, -0.3698478, 1, 0, 0, 1, 1,
-0.2029106, -0.313898, -3.595717, 1, 0, 0, 1, 1,
-0.2020349, -0.001609314, -1.30376, 1, 0, 0, 1, 1,
-0.2009299, 1.064953, 0.0521016, 1, 0, 0, 1, 1,
-0.2008361, 0.7477502, -0.3325941, 0, 0, 0, 1, 1,
-0.2004826, 0.2160643, -1.961514, 0, 0, 0, 1, 1,
-0.1989848, -1.398166, -4.789107, 0, 0, 0, 1, 1,
-0.198896, -1.376021, -2.233876, 0, 0, 0, 1, 1,
-0.1959812, 1.299062, -1.233871, 0, 0, 0, 1, 1,
-0.1946437, -1.904873, -4.453632, 0, 0, 0, 1, 1,
-0.1934307, 0.2169813, -0.5866255, 0, 0, 0, 1, 1,
-0.1867898, -1.628888, -3.757474, 1, 1, 1, 1, 1,
-0.1855889, -1.38229, -1.92398, 1, 1, 1, 1, 1,
-0.184276, 1.009327, 0.5051754, 1, 1, 1, 1, 1,
-0.1828667, 1.561372, 0.971853, 1, 1, 1, 1, 1,
-0.1816093, 0.4109512, -0.1313096, 1, 1, 1, 1, 1,
-0.1768846, 0.5532845, -0.9006565, 1, 1, 1, 1, 1,
-0.1764676, 0.7934673, -1.509731, 1, 1, 1, 1, 1,
-0.1725246, 0.1937614, -1.440143, 1, 1, 1, 1, 1,
-0.1696085, -0.4684053, -1.815724, 1, 1, 1, 1, 1,
-0.1670951, -0.8835852, -5.609087, 1, 1, 1, 1, 1,
-0.1620375, 1.153244, -1.697473, 1, 1, 1, 1, 1,
-0.161462, -1.903234, -2.802093, 1, 1, 1, 1, 1,
-0.1585443, 0.6937441, -0.1112033, 1, 1, 1, 1, 1,
-0.152314, -1.364389, -3.863552, 1, 1, 1, 1, 1,
-0.1495612, 0.9383919, 0.8988083, 1, 1, 1, 1, 1,
-0.1440552, -0.517881, -2.809002, 0, 0, 1, 1, 1,
-0.1425398, 1.490881, 0.2236518, 1, 0, 0, 1, 1,
-0.1348732, 0.4975924, -1.342938, 1, 0, 0, 1, 1,
-0.1334625, 1.219473, -0.5755535, 1, 0, 0, 1, 1,
-0.1310032, 0.7097436, -0.32785, 1, 0, 0, 1, 1,
-0.129093, 2.274978, -0.9017993, 1, 0, 0, 1, 1,
-0.1289947, -0.3665559, -3.366578, 0, 0, 0, 1, 1,
-0.1283038, -1.741035, -2.95926, 0, 0, 0, 1, 1,
-0.1272226, -0.5672312, -3.164824, 0, 0, 0, 1, 1,
-0.1249301, 0.3924854, -0.6270288, 0, 0, 0, 1, 1,
-0.1219029, -0.4105257, -2.328926, 0, 0, 0, 1, 1,
-0.1184891, 0.8230218, -0.8650458, 0, 0, 0, 1, 1,
-0.1141262, -0.4521697, -1.617378, 0, 0, 0, 1, 1,
-0.1125053, 0.8033977, -0.987706, 1, 1, 1, 1, 1,
-0.1122346, -1.188917, -2.004097, 1, 1, 1, 1, 1,
-0.1113119, 0.5988392, 0.5988451, 1, 1, 1, 1, 1,
-0.1091933, 0.5831084, 1.309264, 1, 1, 1, 1, 1,
-0.1056035, -0.2251326, -2.751807, 1, 1, 1, 1, 1,
-0.1035099, 0.2071205, -1.680968, 1, 1, 1, 1, 1,
-0.1020697, 1.357924, 0.990078, 1, 1, 1, 1, 1,
-0.09978987, -0.1779557, -1.001924, 1, 1, 1, 1, 1,
-0.0993491, -0.4826588, -3.048991, 1, 1, 1, 1, 1,
-0.09609119, 0.3197995, -0.3167835, 1, 1, 1, 1, 1,
-0.09576557, -0.8156247, -4.379228, 1, 1, 1, 1, 1,
-0.09453177, 1.135892, -0.5038906, 1, 1, 1, 1, 1,
-0.093897, -0.257826, -2.758047, 1, 1, 1, 1, 1,
-0.09357424, 0.4399774, -0.4810969, 1, 1, 1, 1, 1,
-0.09348892, -0.9212295, -3.008526, 1, 1, 1, 1, 1,
-0.08482447, 1.464425, -1.579703, 0, 0, 1, 1, 1,
-0.08217718, 0.76465, -0.617336, 1, 0, 0, 1, 1,
-0.08205669, 1.286591, -0.2732776, 1, 0, 0, 1, 1,
-0.08095373, -0.4269548, -2.135787, 1, 0, 0, 1, 1,
-0.08006947, -2.262061, -2.472891, 1, 0, 0, 1, 1,
-0.06768177, -1.698637, -2.485305, 1, 0, 0, 1, 1,
-0.06676432, 0.819621, -0.8681773, 0, 0, 0, 1, 1,
-0.06663237, -0.4353074, -2.15603, 0, 0, 0, 1, 1,
-0.06399298, 0.1921087, 0.9066973, 0, 0, 0, 1, 1,
-0.06319125, 1.719279, 0.289199, 0, 0, 0, 1, 1,
-0.04787629, -1.583144, -2.987405, 0, 0, 0, 1, 1,
-0.04508828, 0.5950946, 0.3267313, 0, 0, 0, 1, 1,
-0.04406507, 0.0646115, 0.5698993, 0, 0, 0, 1, 1,
-0.03706253, -1.081442, -2.425868, 1, 1, 1, 1, 1,
-0.03690194, 0.3191442, -0.9720647, 1, 1, 1, 1, 1,
-0.03396073, 1.420025, -1.230426, 1, 1, 1, 1, 1,
-0.0328247, 1.033313, 0.5255263, 1, 1, 1, 1, 1,
-0.03112629, -0.1046578, -2.581461, 1, 1, 1, 1, 1,
-0.02815102, 1.459587, -1.989436, 1, 1, 1, 1, 1,
-0.02487541, -0.2280031, -3.151969, 1, 1, 1, 1, 1,
-0.02455092, -1.853084, -3.52633, 1, 1, 1, 1, 1,
-0.02216166, 0.0193931, -0.5295349, 1, 1, 1, 1, 1,
-0.02134019, 1.211698, 0.2200594, 1, 1, 1, 1, 1,
-0.02023552, -1.214468, -5.415002, 1, 1, 1, 1, 1,
-0.01566276, 0.4209269, -0.6222475, 1, 1, 1, 1, 1,
-0.01405866, -0.3807131, -4.196718, 1, 1, 1, 1, 1,
-0.01330348, -0.6622307, -0.7141124, 1, 1, 1, 1, 1,
-0.012797, -0.2489541, -3.038908, 1, 1, 1, 1, 1,
-0.01194805, 1.207823, -1.868554, 0, 0, 1, 1, 1,
-0.01017124, -1.498078, -3.925796, 1, 0, 0, 1, 1,
-0.00590015, -0.3204102, -1.449247, 1, 0, 0, 1, 1,
-0.003982866, 0.2052701, -1.393861, 1, 0, 0, 1, 1,
-0.002607565, -0.1545414, -1.123727, 1, 0, 0, 1, 1,
0.0006937571, -1.33962, 3.795273, 1, 0, 0, 1, 1,
0.003174873, -0.8426611, 2.416051, 0, 0, 0, 1, 1,
0.01692236, 1.298252, -0.2473964, 0, 0, 0, 1, 1,
0.01779407, 0.6567721, -0.5694601, 0, 0, 0, 1, 1,
0.02074751, 1.035314, -0.7024068, 0, 0, 0, 1, 1,
0.02452042, -0.08611418, 3.179173, 0, 0, 0, 1, 1,
0.02578449, -0.6977761, 3.628616, 0, 0, 0, 1, 1,
0.02954241, -1.499171, 1.774951, 0, 0, 0, 1, 1,
0.03394632, -0.06486141, 1.119307, 1, 1, 1, 1, 1,
0.03755573, 0.02143631, 3.099051, 1, 1, 1, 1, 1,
0.03828104, 1.980507, -0.01797115, 1, 1, 1, 1, 1,
0.0410427, -2.266703, 3.493198, 1, 1, 1, 1, 1,
0.04245127, -0.6711635, 4.326243, 1, 1, 1, 1, 1,
0.04318393, -1.047612, 3.279673, 1, 1, 1, 1, 1,
0.0457845, 0.2698252, 0.8471698, 1, 1, 1, 1, 1,
0.05126932, -0.1468969, 3.243669, 1, 1, 1, 1, 1,
0.05175333, -0.04515712, 1.80321, 1, 1, 1, 1, 1,
0.05187301, -0.4488121, 4.134408, 1, 1, 1, 1, 1,
0.05244531, -2.047756, 1.405212, 1, 1, 1, 1, 1,
0.05861429, 0.9337468, -1.485679, 1, 1, 1, 1, 1,
0.06007067, -0.9433273, 3.880239, 1, 1, 1, 1, 1,
0.06276056, -1.196243, 2.908959, 1, 1, 1, 1, 1,
0.06517804, 0.9725349, -1.146426, 1, 1, 1, 1, 1,
0.06733642, 0.3743401, -0.7243212, 0, 0, 1, 1, 1,
0.06747992, 0.3747942, 0.05381887, 1, 0, 0, 1, 1,
0.06977098, -0.5022703, 2.98451, 1, 0, 0, 1, 1,
0.07838409, -0.8130533, 1.822673, 1, 0, 0, 1, 1,
0.08333113, -0.06123647, 1.708055, 1, 0, 0, 1, 1,
0.08409552, -0.1229324, 1.649401, 1, 0, 0, 1, 1,
0.08429436, -1.330911, 3.34861, 0, 0, 0, 1, 1,
0.08843535, -1.20935, 5.053554, 0, 0, 0, 1, 1,
0.09389383, 0.5495628, -0.9133195, 0, 0, 0, 1, 1,
0.09631709, -0.2203369, 1.832987, 0, 0, 0, 1, 1,
0.1026241, -1.529561, 2.934704, 0, 0, 0, 1, 1,
0.1051717, 0.2676348, 0.04173649, 0, 0, 0, 1, 1,
0.1089834, 1.24079, 1.079922, 0, 0, 0, 1, 1,
0.1103216, 0.1426612, 1.277274, 1, 1, 1, 1, 1,
0.1114582, -0.1032241, 1.575137, 1, 1, 1, 1, 1,
0.1120234, -0.01724609, 1.616586, 1, 1, 1, 1, 1,
0.112499, 0.731216, 0.2297577, 1, 1, 1, 1, 1,
0.11334, -0.6498739, 2.123944, 1, 1, 1, 1, 1,
0.1152138, -0.3881395, 2.723602, 1, 1, 1, 1, 1,
0.1154861, -0.08886694, 2.564273, 1, 1, 1, 1, 1,
0.1167377, 0.1962843, 1.837479, 1, 1, 1, 1, 1,
0.117231, -0.3046641, 1.909196, 1, 1, 1, 1, 1,
0.1203413, 4.188668, -0.2913151, 1, 1, 1, 1, 1,
0.1209709, -0.2545219, 2.345277, 1, 1, 1, 1, 1,
0.1228789, 0.4172757, 1.196985, 1, 1, 1, 1, 1,
0.1232795, 0.3122952, 0.312703, 1, 1, 1, 1, 1,
0.1249015, 0.2412866, 1.697557, 1, 1, 1, 1, 1,
0.1303935, -0.5615389, 0.5725242, 1, 1, 1, 1, 1,
0.1312357, -0.3932877, 2.58664, 0, 0, 1, 1, 1,
0.1343272, -0.3779943, 2.122979, 1, 0, 0, 1, 1,
0.1362619, 0.2296178, 1.191315, 1, 0, 0, 1, 1,
0.1381242, 0.8808451, 0.5458133, 1, 0, 0, 1, 1,
0.1442699, -0.09980273, 2.434712, 1, 0, 0, 1, 1,
0.1450809, 0.7889663, -2.047104, 1, 0, 0, 1, 1,
0.1452941, 0.6220803, -0.6419373, 0, 0, 0, 1, 1,
0.1474945, -0.04272358, 2.422653, 0, 0, 0, 1, 1,
0.159113, 1.289221, 0.9601427, 0, 0, 0, 1, 1,
0.1635279, 0.04521943, 3.716719, 0, 0, 0, 1, 1,
0.1666972, -0.6278804, 2.327221, 0, 0, 0, 1, 1,
0.1701258, 0.8815301, 0.2627936, 0, 0, 0, 1, 1,
0.1722967, -0.6947159, 3.497837, 0, 0, 0, 1, 1,
0.174701, 1.639617, -0.7544223, 1, 1, 1, 1, 1,
0.1802207, -0.4822371, 3.947368, 1, 1, 1, 1, 1,
0.1805815, -0.8265713, 3.872689, 1, 1, 1, 1, 1,
0.1832799, 0.2627305, -0.1624311, 1, 1, 1, 1, 1,
0.1893558, 0.2884275, 0.6429118, 1, 1, 1, 1, 1,
0.1901128, 0.0889869, 1.302523, 1, 1, 1, 1, 1,
0.1902785, -1.177396, 2.448495, 1, 1, 1, 1, 1,
0.1903683, 0.966725, 0.7875713, 1, 1, 1, 1, 1,
0.1913013, -1.720152, 2.976414, 1, 1, 1, 1, 1,
0.1920996, -0.3771845, 4.246881, 1, 1, 1, 1, 1,
0.1923397, 0.313596, 1.477239, 1, 1, 1, 1, 1,
0.1929467, 0.5913835, 1.84227, 1, 1, 1, 1, 1,
0.1937312, -0.367119, 3.289857, 1, 1, 1, 1, 1,
0.1958202, -1.494233, 2.775353, 1, 1, 1, 1, 1,
0.2015582, 0.9318834, -0.1003221, 1, 1, 1, 1, 1,
0.2055336, 2.663517, -0.6679075, 0, 0, 1, 1, 1,
0.2058779, -0.4759991, 3.150015, 1, 0, 0, 1, 1,
0.207509, -0.227872, 2.001129, 1, 0, 0, 1, 1,
0.2079798, -0.6203717, 2.009007, 1, 0, 0, 1, 1,
0.2097931, -1.368382, 2.543025, 1, 0, 0, 1, 1,
0.2104771, 0.5134205, -1.11131, 1, 0, 0, 1, 1,
0.2193018, 0.5291556, 0.5634481, 0, 0, 0, 1, 1,
0.2227619, 0.1646822, 0.8121194, 0, 0, 0, 1, 1,
0.2231772, -0.4025941, 1.729963, 0, 0, 0, 1, 1,
0.2257406, -1.102297, 3.958036, 0, 0, 0, 1, 1,
0.2301124, 0.5623584, -0.1875403, 0, 0, 0, 1, 1,
0.2357311, 0.3951789, 0.9717495, 0, 0, 0, 1, 1,
0.2384481, -0.7650465, 2.09768, 0, 0, 0, 1, 1,
0.2396769, -0.5812631, 4.372387, 1, 1, 1, 1, 1,
0.2425674, -1.209174, 4.688181, 1, 1, 1, 1, 1,
0.2453844, 0.517068, -1.184472, 1, 1, 1, 1, 1,
0.2481934, 0.6548292, 1.648574, 1, 1, 1, 1, 1,
0.2556204, -0.09704933, 3.032455, 1, 1, 1, 1, 1,
0.257425, 1.187021, 0.2023701, 1, 1, 1, 1, 1,
0.2590957, 1.615137, 0.325572, 1, 1, 1, 1, 1,
0.2673494, -1.676826, 2.345254, 1, 1, 1, 1, 1,
0.2678525, -0.1900563, 2.739039, 1, 1, 1, 1, 1,
0.2694005, 0.8951801, -0.3222477, 1, 1, 1, 1, 1,
0.2715472, -0.210222, 2.342049, 1, 1, 1, 1, 1,
0.2721256, -0.1935464, 0.9324897, 1, 1, 1, 1, 1,
0.2755164, -0.3623238, 2.15403, 1, 1, 1, 1, 1,
0.2846588, 0.7966393, 0.4986195, 1, 1, 1, 1, 1,
0.2889003, 0.1602098, -0.42107, 1, 1, 1, 1, 1,
0.2921221, 0.9547629, 0.7505494, 0, 0, 1, 1, 1,
0.2934809, 0.9590138, -0.1022906, 1, 0, 0, 1, 1,
0.3053539, 0.06073583, 4.303389, 1, 0, 0, 1, 1,
0.3084027, 0.687418, 0.9337094, 1, 0, 0, 1, 1,
0.3096989, -0.09741985, 2.079757, 1, 0, 0, 1, 1,
0.3097611, 1.10988, -0.700438, 1, 0, 0, 1, 1,
0.3099527, 0.3889984, 1.006267, 0, 0, 0, 1, 1,
0.3120843, -1.29702, 3.181187, 0, 0, 0, 1, 1,
0.3143994, -0.03920068, 0.4272806, 0, 0, 0, 1, 1,
0.31555, 0.9642519, 0.9502085, 0, 0, 0, 1, 1,
0.3252221, -0.3472819, 0.9864327, 0, 0, 0, 1, 1,
0.3253109, -1.220205, 2.204771, 0, 0, 0, 1, 1,
0.325964, 0.7977031, 0.6794702, 0, 0, 0, 1, 1,
0.3370584, 0.1161404, 0.9817773, 1, 1, 1, 1, 1,
0.3371744, -1.148577, 3.089177, 1, 1, 1, 1, 1,
0.3377306, 0.155384, 1.025247, 1, 1, 1, 1, 1,
0.3394965, 1.352077, 1.12665, 1, 1, 1, 1, 1,
0.3405399, -2.2222, 2.391237, 1, 1, 1, 1, 1,
0.3415808, -1.774327, 3.929004, 1, 1, 1, 1, 1,
0.3436018, -1.34879, 2.845288, 1, 1, 1, 1, 1,
0.345964, 0.3144281, 2.186006, 1, 1, 1, 1, 1,
0.3468477, 0.3632015, 1.168008, 1, 1, 1, 1, 1,
0.3498091, -1.869881, 2.762936, 1, 1, 1, 1, 1,
0.3507512, -0.1654961, 3.654386, 1, 1, 1, 1, 1,
0.3548766, -0.2351629, 3.114423, 1, 1, 1, 1, 1,
0.3559287, 1.298231, 0.4840751, 1, 1, 1, 1, 1,
0.3587496, 1.576411, 0.7948415, 1, 1, 1, 1, 1,
0.3654781, -0.7328455, 2.132352, 1, 1, 1, 1, 1,
0.3660214, 0.232855, 2.039963, 0, 0, 1, 1, 1,
0.3685608, 1.648746, -0.1033725, 1, 0, 0, 1, 1,
0.3725387, -0.7850339, 3.016679, 1, 0, 0, 1, 1,
0.3800812, -0.5655014, 3.854813, 1, 0, 0, 1, 1,
0.3808619, -0.8052896, 1.037864, 1, 0, 0, 1, 1,
0.3848836, -0.507269, 2.570182, 1, 0, 0, 1, 1,
0.3879647, -0.1367011, 1.474324, 0, 0, 0, 1, 1,
0.399975, -0.8438483, 3.690772, 0, 0, 0, 1, 1,
0.4003322, -0.1227272, 4.517856, 0, 0, 0, 1, 1,
0.4015599, 0.782201, 1.425298, 0, 0, 0, 1, 1,
0.4057985, -0.128784, 2.58309, 0, 0, 0, 1, 1,
0.4097299, -0.4225498, 1.707277, 0, 0, 0, 1, 1,
0.4099427, 0.9838493, 0.9484496, 0, 0, 0, 1, 1,
0.4150033, -0.7261692, 2.529292, 1, 1, 1, 1, 1,
0.4170442, 1.31017, 0.8106629, 1, 1, 1, 1, 1,
0.4180356, -0.1028996, 0.9326785, 1, 1, 1, 1, 1,
0.4217547, -0.05588181, -0.6353571, 1, 1, 1, 1, 1,
0.4229822, 0.6539479, 0.8377654, 1, 1, 1, 1, 1,
0.4233397, -0.1974929, 2.59123, 1, 1, 1, 1, 1,
0.4278623, 1.296029, 2.345314, 1, 1, 1, 1, 1,
0.4304764, -1.537512, 3.582655, 1, 1, 1, 1, 1,
0.4322743, -0.756851, 1.74323, 1, 1, 1, 1, 1,
0.4330418, -0.6129181, 1.90754, 1, 1, 1, 1, 1,
0.434254, 0.4844408, -1.722037, 1, 1, 1, 1, 1,
0.4354178, 0.3322172, 1.669886, 1, 1, 1, 1, 1,
0.4365883, -0.5320984, 3.365449, 1, 1, 1, 1, 1,
0.4385801, 1.124506, 0.6428634, 1, 1, 1, 1, 1,
0.4407938, -0.6120121, 3.260103, 1, 1, 1, 1, 1,
0.4462614, 0.1436365, 3.074961, 0, 0, 1, 1, 1,
0.4521814, 0.8573471, -1.566236, 1, 0, 0, 1, 1,
0.4553381, -0.9590712, 3.073264, 1, 0, 0, 1, 1,
0.4573991, -0.5939952, 0.6047378, 1, 0, 0, 1, 1,
0.4578273, -0.4859475, 0.6237622, 1, 0, 0, 1, 1,
0.4608139, -0.7248901, 1.592596, 1, 0, 0, 1, 1,
0.4609735, 0.253311, 2.41778, 0, 0, 0, 1, 1,
0.4629685, -0.3754752, 2.343819, 0, 0, 0, 1, 1,
0.4638857, 0.3727634, -0.07351995, 0, 0, 0, 1, 1,
0.4808361, -0.7822056, 1.967308, 0, 0, 0, 1, 1,
0.4835373, 1.417017, 1.406483, 0, 0, 0, 1, 1,
0.4848298, 0.03095532, 1.184073, 0, 0, 0, 1, 1,
0.4865515, 0.2661512, 0.6820506, 0, 0, 0, 1, 1,
0.4905564, 1.913976, -0.4324544, 1, 1, 1, 1, 1,
0.493313, -2.04741, 2.076815, 1, 1, 1, 1, 1,
0.495012, -0.993397, 3.283665, 1, 1, 1, 1, 1,
0.4966825, -1.386868, 2.643229, 1, 1, 1, 1, 1,
0.5106618, -2.128524, 3.171737, 1, 1, 1, 1, 1,
0.5116097, 0.1811064, 1.010403, 1, 1, 1, 1, 1,
0.5134054, 0.4861243, -0.01185902, 1, 1, 1, 1, 1,
0.513702, 0.8097072, 0.1290911, 1, 1, 1, 1, 1,
0.515724, -0.1280899, 1.234058, 1, 1, 1, 1, 1,
0.5222774, -0.3308035, 2.258765, 1, 1, 1, 1, 1,
0.531614, -0.327755, 1.816209, 1, 1, 1, 1, 1,
0.5321367, 0.4452152, 1.417117, 1, 1, 1, 1, 1,
0.5353354, 0.1435469, 1.095271, 1, 1, 1, 1, 1,
0.5366702, -0.9002044, 3.38043, 1, 1, 1, 1, 1,
0.5403289, 1.725519, -1.56357, 1, 1, 1, 1, 1,
0.5403523, -0.8245047, 2.635522, 0, 0, 1, 1, 1,
0.5410644, -0.2697071, 1.531765, 1, 0, 0, 1, 1,
0.5472971, -0.8306059, 2.943514, 1, 0, 0, 1, 1,
0.5508834, -1.512991, 2.701046, 1, 0, 0, 1, 1,
0.5538597, 0.3138852, -0.7782795, 1, 0, 0, 1, 1,
0.556593, 1.704259, -0.6889473, 1, 0, 0, 1, 1,
0.5570801, -0.7008032, 1.084955, 0, 0, 0, 1, 1,
0.5580851, -0.8667992, 1.820518, 0, 0, 0, 1, 1,
0.5667958, -0.1819879, 1.559062, 0, 0, 0, 1, 1,
0.5726218, -0.02594211, 1.920869, 0, 0, 0, 1, 1,
0.5804865, -0.7763289, 2.692899, 0, 0, 0, 1, 1,
0.5841893, -0.636561, 4.302256, 0, 0, 0, 1, 1,
0.587239, -0.2089608, 0.9260128, 0, 0, 0, 1, 1,
0.5898215, -0.1488622, 1.695908, 1, 1, 1, 1, 1,
0.5907726, 0.1776813, 2.097949, 1, 1, 1, 1, 1,
0.5960068, -0.8737743, 3.575003, 1, 1, 1, 1, 1,
0.5968266, -0.9074031, 2.870932, 1, 1, 1, 1, 1,
0.5971507, 1.593122, 0.5490555, 1, 1, 1, 1, 1,
0.5985252, -0.6214987, 2.444988, 1, 1, 1, 1, 1,
0.6019717, -0.3554008, 2.541538, 1, 1, 1, 1, 1,
0.6083975, 0.789623, -1.013959, 1, 1, 1, 1, 1,
0.6106952, -0.2310829, 3.69229, 1, 1, 1, 1, 1,
0.6113646, 0.4689422, 0.224181, 1, 1, 1, 1, 1,
0.6122961, -0.03617199, 1.667051, 1, 1, 1, 1, 1,
0.6130038, -0.3623856, 1.862242, 1, 1, 1, 1, 1,
0.6154265, 0.1015912, 1.260649, 1, 1, 1, 1, 1,
0.6180756, 0.8571362, 0.06752489, 1, 1, 1, 1, 1,
0.6193739, 0.486858, 1.843365, 1, 1, 1, 1, 1,
0.6203221, -0.2393141, 2.945464, 0, 0, 1, 1, 1,
0.6220765, 1.733585, 0.6649031, 1, 0, 0, 1, 1,
0.6270128, 0.3113593, 0.9701374, 1, 0, 0, 1, 1,
0.6318601, 0.8216265, 0.4358211, 1, 0, 0, 1, 1,
0.6339885, -0.004570361, 1.56189, 1, 0, 0, 1, 1,
0.6345256, -2.223439, 2.407126, 1, 0, 0, 1, 1,
0.6356677, -1.283275, 1.184871, 0, 0, 0, 1, 1,
0.6380441, 2.120771, -1.143233, 0, 0, 0, 1, 1,
0.6396869, 0.6063637, 0.2315825, 0, 0, 0, 1, 1,
0.6440127, 1.529455, -0.6709938, 0, 0, 0, 1, 1,
0.6536694, -0.2422892, 2.259568, 0, 0, 0, 1, 1,
0.654116, -1.170382, 2.586779, 0, 0, 0, 1, 1,
0.6590744, -0.1444248, 2.127952, 0, 0, 0, 1, 1,
0.6619108, -1.480849, 2.650637, 1, 1, 1, 1, 1,
0.6626311, -0.3300221, 3.701437, 1, 1, 1, 1, 1,
0.6692546, -0.1741001, 0.2597073, 1, 1, 1, 1, 1,
0.6694664, 1.957817, 0.5192387, 1, 1, 1, 1, 1,
0.67176, -0.09588942, 0.06794836, 1, 1, 1, 1, 1,
0.6732153, 1.698144, -0.04323907, 1, 1, 1, 1, 1,
0.6733988, -0.1709653, 3.985413, 1, 1, 1, 1, 1,
0.6823037, 0.04665054, 3.448667, 1, 1, 1, 1, 1,
0.6826914, 0.7073886, 0.8567544, 1, 1, 1, 1, 1,
0.6837181, 1.044439, 1.964402, 1, 1, 1, 1, 1,
0.6894199, 1.925182, 2.780411, 1, 1, 1, 1, 1,
0.6924213, -1.354477, 2.229014, 1, 1, 1, 1, 1,
0.6956183, 0.7699617, 0.86377, 1, 1, 1, 1, 1,
0.6962281, -0.7912868, 4.7172, 1, 1, 1, 1, 1,
0.6979994, -1.793563, 1.756737, 1, 1, 1, 1, 1,
0.703879, 0.07843328, 0.4414215, 0, 0, 1, 1, 1,
0.7148813, -0.2516072, 3.315464, 1, 0, 0, 1, 1,
0.7179286, -0.501176, 3.172278, 1, 0, 0, 1, 1,
0.7206928, 0.4293724, 1.174508, 1, 0, 0, 1, 1,
0.7244156, 0.875163, -0.3319943, 1, 0, 0, 1, 1,
0.7312202, 0.2169241, 2.905093, 1, 0, 0, 1, 1,
0.7314197, 1.717348, 1.335888, 0, 0, 0, 1, 1,
0.7317802, 0.225508, 0.9124308, 0, 0, 0, 1, 1,
0.7332574, 0.5016509, 0.9325425, 0, 0, 0, 1, 1,
0.7461919, 1.346342, 0.5800301, 0, 0, 0, 1, 1,
0.7499943, 0.4786041, 0.08682732, 0, 0, 0, 1, 1,
0.7575022, -0.371413, 0.4539312, 0, 0, 0, 1, 1,
0.7630758, -0.767822, 1.965932, 0, 0, 0, 1, 1,
0.7646921, 1.431814, 1.40267, 1, 1, 1, 1, 1,
0.7656961, -1.031482, 3.956274, 1, 1, 1, 1, 1,
0.7657766, 0.2581949, -0.2933321, 1, 1, 1, 1, 1,
0.7678491, -0.03214534, 2.115661, 1, 1, 1, 1, 1,
0.768253, 0.09931651, 1.908408, 1, 1, 1, 1, 1,
0.7705927, -0.104183, 3.016342, 1, 1, 1, 1, 1,
0.7708006, 0.6143638, 1.558422, 1, 1, 1, 1, 1,
0.7712922, 0.05326433, 3.433082, 1, 1, 1, 1, 1,
0.7738475, -1.346333, 2.367977, 1, 1, 1, 1, 1,
0.7741125, 1.498292, -0.08024724, 1, 1, 1, 1, 1,
0.780113, 0.3367712, 1.995009, 1, 1, 1, 1, 1,
0.7820444, 0.09858478, -0.9624668, 1, 1, 1, 1, 1,
0.7827747, -1.859604, 3.691989, 1, 1, 1, 1, 1,
0.7856891, 0.9226398, -0.1186329, 1, 1, 1, 1, 1,
0.7866853, 1.238058, 0.4338236, 1, 1, 1, 1, 1,
0.7917027, -0.07478531, 0.4450214, 0, 0, 1, 1, 1,
0.7928479, -0.8258969, 4.046467, 1, 0, 0, 1, 1,
0.7967563, 1.113527, -0.07654522, 1, 0, 0, 1, 1,
0.8020856, -1.213045, 1.311661, 1, 0, 0, 1, 1,
0.8062282, 1.346772, 0.08135162, 1, 0, 0, 1, 1,
0.8067807, 1.975346, 1.592622, 1, 0, 0, 1, 1,
0.807682, -0.2354327, 1.679179, 0, 0, 0, 1, 1,
0.8152156, 0.7571194, 0.288219, 0, 0, 0, 1, 1,
0.816925, 1.004934, 0.7680305, 0, 0, 0, 1, 1,
0.8171183, 2.205387, 1.16552, 0, 0, 0, 1, 1,
0.8243309, -0.3328095, 2.378649, 0, 0, 0, 1, 1,
0.8254823, -0.8483185, 3.763083, 0, 0, 0, 1, 1,
0.8357659, 0.3127699, 2.370628, 0, 0, 0, 1, 1,
0.839972, 0.3176948, 1.912271, 1, 1, 1, 1, 1,
0.8468546, 0.5771937, 0.3335772, 1, 1, 1, 1, 1,
0.8476446, -0.6702101, 0.6380504, 1, 1, 1, 1, 1,
0.8491245, 0.955605, 2.220675, 1, 1, 1, 1, 1,
0.8515492, -1.240615, 1.738238, 1, 1, 1, 1, 1,
0.8565019, -1.26634, 3.524502, 1, 1, 1, 1, 1,
0.8738348, 0.5946517, 2.468083, 1, 1, 1, 1, 1,
0.8903107, 0.4471226, 0.1106153, 1, 1, 1, 1, 1,
0.894803, -1.221465, 2.1335, 1, 1, 1, 1, 1,
0.9109986, -0.7041257, 2.123454, 1, 1, 1, 1, 1,
0.9163675, -0.392599, 2.341812, 1, 1, 1, 1, 1,
0.9165179, 0.4689811, -0.117768, 1, 1, 1, 1, 1,
0.9190533, -0.08050947, 3.876647, 1, 1, 1, 1, 1,
0.9315051, 0.0877035, 0.9079962, 1, 1, 1, 1, 1,
0.9316537, 0.5105304, 2.963591, 1, 1, 1, 1, 1,
0.9422577, -0.3494041, 2.254519, 0, 0, 1, 1, 1,
0.9456686, 0.3693559, -1.217662, 1, 0, 0, 1, 1,
0.9575885, 0.3969375, 0.1196638, 1, 0, 0, 1, 1,
0.958741, -0.5350531, 3.92021, 1, 0, 0, 1, 1,
0.9680997, 0.8841417, 0.06048142, 1, 0, 0, 1, 1,
0.971025, 0.0761173, 1.03014, 1, 0, 0, 1, 1,
0.9764733, 0.7724743, -0.05773042, 0, 0, 0, 1, 1,
0.9764907, -0.3592581, 1.597564, 0, 0, 0, 1, 1,
0.9825017, 0.6332441, 1.970897, 0, 0, 0, 1, 1,
0.9867881, -0.7555493, 5.103024, 0, 0, 0, 1, 1,
0.9948024, -0.1405221, 1.516633, 0, 0, 0, 1, 1,
0.9950426, -0.1421021, 0.04035117, 0, 0, 0, 1, 1,
0.9957906, 1.132741, -1.247329, 0, 0, 0, 1, 1,
0.9977673, -1.091142, 1.923663, 1, 1, 1, 1, 1,
0.9980799, 0.2529096, 3.641174, 1, 1, 1, 1, 1,
0.9982169, 1.713714, 1.57734, 1, 1, 1, 1, 1,
0.9986973, 0.7213543, -0.1389343, 1, 1, 1, 1, 1,
0.9988565, -0.6913891, 1.65774, 1, 1, 1, 1, 1,
0.9990782, -0.7409171, 1.418164, 1, 1, 1, 1, 1,
0.9991081, 0.6370451, 1.188124, 1, 1, 1, 1, 1,
1.009897, -1.429873, 3.039458, 1, 1, 1, 1, 1,
1.011611, -0.6685968, 1.327521, 1, 1, 1, 1, 1,
1.015291, -1.74945, 3.169082, 1, 1, 1, 1, 1,
1.01907, 0.6200307, 0.2794685, 1, 1, 1, 1, 1,
1.021128, 0.1953926, 1.368395, 1, 1, 1, 1, 1,
1.021165, -0.1616524, 1.825554, 1, 1, 1, 1, 1,
1.025263, 1.589291, 0.08094845, 1, 1, 1, 1, 1,
1.025923, 0.9192964, 1.04111, 1, 1, 1, 1, 1,
1.027574, 0.4223838, 2.280297, 0, 0, 1, 1, 1,
1.028869, 1.336277, 0.05741813, 1, 0, 0, 1, 1,
1.030975, -0.2433859, 1.707979, 1, 0, 0, 1, 1,
1.04417, 0.7615352, 2.131274, 1, 0, 0, 1, 1,
1.045985, -0.3777699, 1.871985, 1, 0, 0, 1, 1,
1.047437, 0.2426403, -0.511555, 1, 0, 0, 1, 1,
1.052895, -0.6601136, 1.849714, 0, 0, 0, 1, 1,
1.056183, -1.773471, 3.810378, 0, 0, 0, 1, 1,
1.061929, 0.007611515, 0.8313742, 0, 0, 0, 1, 1,
1.07789, -0.2397103, 2.403946, 0, 0, 0, 1, 1,
1.078756, -1.249467, 1.675374, 0, 0, 0, 1, 1,
1.081627, -0.9659923, 1.651789, 0, 0, 0, 1, 1,
1.08236, -1.995222, 2.92233, 0, 0, 0, 1, 1,
1.089598, 1.661486, 2.501414, 1, 1, 1, 1, 1,
1.091102, -0.5623813, 3.602556, 1, 1, 1, 1, 1,
1.091638, -0.6746719, 1.805059, 1, 1, 1, 1, 1,
1.096987, -0.3642329, 1.883545, 1, 1, 1, 1, 1,
1.097021, -0.0783079, 1.933265, 1, 1, 1, 1, 1,
1.10001, 1.277247, 0.7655903, 1, 1, 1, 1, 1,
1.10633, -0.1438787, 1.71635, 1, 1, 1, 1, 1,
1.111778, 1.860798, 0.07117417, 1, 1, 1, 1, 1,
1.115119, -0.05020163, 2.31614, 1, 1, 1, 1, 1,
1.120175, 0.7731345, 3.09233, 1, 1, 1, 1, 1,
1.131671, -0.7492706, 0.6892725, 1, 1, 1, 1, 1,
1.133973, 0.6870161, 1.527831, 1, 1, 1, 1, 1,
1.138415, -1.0583, 1.092965, 1, 1, 1, 1, 1,
1.14254, 1.22169, 0.766902, 1, 1, 1, 1, 1,
1.146666, -0.7646827, 1.562187, 1, 1, 1, 1, 1,
1.146744, -1.694685, 2.869821, 0, 0, 1, 1, 1,
1.147286, 2.182334, 0.3349457, 1, 0, 0, 1, 1,
1.158343, -0.04472461, 3.288459, 1, 0, 0, 1, 1,
1.160588, -0.2747212, 1.00594, 1, 0, 0, 1, 1,
1.166932, -0.1996557, 0.9209985, 1, 0, 0, 1, 1,
1.171474, -1.233793, 2.156158, 1, 0, 0, 1, 1,
1.172238, -0.6566403, 2.204908, 0, 0, 0, 1, 1,
1.174637, 2.185617, 0.8072392, 0, 0, 0, 1, 1,
1.178691, -0.5769606, 1.129771, 0, 0, 0, 1, 1,
1.188223, -0.1389923, 1.859817, 0, 0, 0, 1, 1,
1.190726, -1.409172, 2.531527, 0, 0, 0, 1, 1,
1.192472, -0.8289015, 2.799997, 0, 0, 0, 1, 1,
1.192496, 0.7298108, 1.780133, 0, 0, 0, 1, 1,
1.197274, 0.320195, 1.639727, 1, 1, 1, 1, 1,
1.200541, 0.03154055, 1.081633, 1, 1, 1, 1, 1,
1.212458, -1.88055, 3.605942, 1, 1, 1, 1, 1,
1.216774, 0.4693403, 1.413978, 1, 1, 1, 1, 1,
1.221831, -0.2044713, 2.783035, 1, 1, 1, 1, 1,
1.222076, -0.02783511, 1.984534, 1, 1, 1, 1, 1,
1.227678, -1.297307, 2.245789, 1, 1, 1, 1, 1,
1.230749, 1.036512, 1.676659, 1, 1, 1, 1, 1,
1.230922, -0.4955761, 2.11941, 1, 1, 1, 1, 1,
1.246478, -0.7944322, 3.269834, 1, 1, 1, 1, 1,
1.250978, 0.3759967, 0.6382553, 1, 1, 1, 1, 1,
1.25999, -0.9567368, 1.830976, 1, 1, 1, 1, 1,
1.260793, -0.5859102, 2.352639, 1, 1, 1, 1, 1,
1.267893, 0.4662015, 1.049021, 1, 1, 1, 1, 1,
1.271978, -0.2804466, 0.3771286, 1, 1, 1, 1, 1,
1.272593, -0.9083161, 0.2840588, 0, 0, 1, 1, 1,
1.279761, 0.4085571, 3.101512, 1, 0, 0, 1, 1,
1.281057, -0.4743426, 1.997919, 1, 0, 0, 1, 1,
1.282969, -1.353444, 1.696137, 1, 0, 0, 1, 1,
1.289582, 1.491767, 1.750125, 1, 0, 0, 1, 1,
1.301642, -0.5735916, 1.068939, 1, 0, 0, 1, 1,
1.302796, -0.1990157, 0.7701151, 0, 0, 0, 1, 1,
1.311809, 0.7901269, 1.030514, 0, 0, 0, 1, 1,
1.317366, 1.859542, 2.236075, 0, 0, 0, 1, 1,
1.346796, -0.3821931, 0.5987168, 0, 0, 0, 1, 1,
1.346826, 0.4272376, 0.7981476, 0, 0, 0, 1, 1,
1.354088, -0.4282026, 3.163004, 0, 0, 0, 1, 1,
1.363522, -1.411489, 1.257752, 0, 0, 0, 1, 1,
1.386435, -2.683688, 1.780933, 1, 1, 1, 1, 1,
1.407254, -0.1598686, 1.68615, 1, 1, 1, 1, 1,
1.425247, 0.8628524, 0.8428599, 1, 1, 1, 1, 1,
1.430152, 0.3864649, 2.96313, 1, 1, 1, 1, 1,
1.436432, -0.1219857, 1.657632, 1, 1, 1, 1, 1,
1.441361, 0.2130046, 0.6684506, 1, 1, 1, 1, 1,
1.445643, 0.6915215, 1.958055, 1, 1, 1, 1, 1,
1.447644, -0.9254653, 2.084898, 1, 1, 1, 1, 1,
1.450021, 1.351973, -0.9690898, 1, 1, 1, 1, 1,
1.463442, 2.222014, 2.072331, 1, 1, 1, 1, 1,
1.468018, 0.005324152, 1.875836, 1, 1, 1, 1, 1,
1.474539, -0.3702215, 1.907663, 1, 1, 1, 1, 1,
1.495109, 1.937662, -0.4303387, 1, 1, 1, 1, 1,
1.496563, 0.8380964, 0.2692902, 1, 1, 1, 1, 1,
1.554991, 0.2565888, 1.485518, 1, 1, 1, 1, 1,
1.555587, -0.1107671, -0.1340599, 0, 0, 1, 1, 1,
1.559639, 0.08107866, -0.1677846, 1, 0, 0, 1, 1,
1.562275, -0.7253892, 0.2612998, 1, 0, 0, 1, 1,
1.562874, 0.3056041, 1.50285, 1, 0, 0, 1, 1,
1.568256, -1.638994, 1.906226, 1, 0, 0, 1, 1,
1.570298, -0.3658105, 3.389714, 1, 0, 0, 1, 1,
1.574329, 0.4937646, 0.3981971, 0, 0, 0, 1, 1,
1.576571, 0.5281599, 1.886037, 0, 0, 0, 1, 1,
1.577677, -0.1686465, 1.808302, 0, 0, 0, 1, 1,
1.579767, -0.1062073, 0.9609628, 0, 0, 0, 1, 1,
1.590792, -2.302936, 1.711842, 0, 0, 0, 1, 1,
1.595785, 0.2509483, 1.211675, 0, 0, 0, 1, 1,
1.595998, -0.2865267, 2.371878, 0, 0, 0, 1, 1,
1.596769, 0.5937966, -0.8256207, 1, 1, 1, 1, 1,
1.604704, -0.009040321, 0.6346604, 1, 1, 1, 1, 1,
1.608245, 0.01195654, 2.716015, 1, 1, 1, 1, 1,
1.613342, -0.04814602, 0.6221861, 1, 1, 1, 1, 1,
1.619325, -1.715016, 2.818231, 1, 1, 1, 1, 1,
1.619927, -0.3033583, 0.9345022, 1, 1, 1, 1, 1,
1.620757, 0.1933394, 1.427492, 1, 1, 1, 1, 1,
1.622222, -0.5562521, 2.469039, 1, 1, 1, 1, 1,
1.622736, -1.175326, 1.154769, 1, 1, 1, 1, 1,
1.640676, -0.4672129, 2.442338, 1, 1, 1, 1, 1,
1.640843, -0.5004765, 1.975831, 1, 1, 1, 1, 1,
1.64496, 0.3893383, -0.03621827, 1, 1, 1, 1, 1,
1.663339, -0.3357304, 0.8592569, 1, 1, 1, 1, 1,
1.676204, 0.004966717, 1.546831, 1, 1, 1, 1, 1,
1.681306, 0.8368891, 0.8404345, 1, 1, 1, 1, 1,
1.722841, 0.04609909, 0.8179056, 0, 0, 1, 1, 1,
1.732975, 0.3434826, 3.844406, 1, 0, 0, 1, 1,
1.73949, -0.6536826, 2.448953, 1, 0, 0, 1, 1,
1.784224, 0.7179939, 1.756088, 1, 0, 0, 1, 1,
1.789226, -0.09729487, 1.739165, 1, 0, 0, 1, 1,
1.813803, 1.337713, -0.0177044, 1, 0, 0, 1, 1,
1.821647, 0.3538565, 0.6263012, 0, 0, 0, 1, 1,
1.837041, -0.2548044, 1.879848, 0, 0, 0, 1, 1,
1.850136, -1.274868, 0.6680372, 0, 0, 0, 1, 1,
1.850294, 0.3152508, 2.635751, 0, 0, 0, 1, 1,
1.859507, -0.5910426, 1.267043, 0, 0, 0, 1, 1,
1.861659, -0.1426718, 1.640292, 0, 0, 0, 1, 1,
1.868054, 0.7249292, 0.3188904, 0, 0, 0, 1, 1,
1.868295, 0.2602894, 0.7264551, 1, 1, 1, 1, 1,
1.872912, -1.153509, 1.644488, 1, 1, 1, 1, 1,
1.874077, 0.03665091, 2.839969, 1, 1, 1, 1, 1,
1.878157, 0.5777615, 0.8026153, 1, 1, 1, 1, 1,
1.904678, -1.3365, 1.272325, 1, 1, 1, 1, 1,
1.905236, 0.2313771, 1.147485, 1, 1, 1, 1, 1,
1.907462, -1.238844, 2.872131, 1, 1, 1, 1, 1,
1.928243, 1.338718, 0.5462741, 1, 1, 1, 1, 1,
1.929051, 0.2443611, 2.382187, 1, 1, 1, 1, 1,
1.956844, 0.5617678, 1.885139, 1, 1, 1, 1, 1,
1.965824, 0.9981955, 0.2739142, 1, 1, 1, 1, 1,
1.988922, 0.813656, 1.397191, 1, 1, 1, 1, 1,
2.042937, 0.6412708, 2.054082, 1, 1, 1, 1, 1,
2.059871, -1.440869, 3.789418, 1, 1, 1, 1, 1,
2.060788, 1.647941, 0.1133526, 1, 1, 1, 1, 1,
2.106132, -0.6235674, 3.481376, 0, 0, 1, 1, 1,
2.143236, -1.066183, 0.7483558, 1, 0, 0, 1, 1,
2.156629, -1.056952, 2.289557, 1, 0, 0, 1, 1,
2.159917, 0.2565537, 0.6795759, 1, 0, 0, 1, 1,
2.176861, 0.8615646, 0.2449415, 1, 0, 0, 1, 1,
2.20226, -0.1684564, 1.374269, 1, 0, 0, 1, 1,
2.203373, 0.2872867, 1.37222, 0, 0, 0, 1, 1,
2.211021, -0.544773, -0.3347876, 0, 0, 0, 1, 1,
2.245881, 1.174407, 0.6620688, 0, 0, 0, 1, 1,
2.261158, 0.1904445, 1.752393, 0, 0, 0, 1, 1,
2.301143, -0.3440857, 0.1450585, 0, 0, 0, 1, 1,
2.392643, -0.06313904, 1.466301, 0, 0, 0, 1, 1,
2.398376, 1.646367, 2.993947, 0, 0, 0, 1, 1,
2.490206, 1.140728, 3.333788, 1, 1, 1, 1, 1,
2.498458, 0.054199, 2.249724, 1, 1, 1, 1, 1,
2.573747, -0.7382489, 1.321754, 1, 1, 1, 1, 1,
2.586555, 0.1313634, 0.197783, 1, 1, 1, 1, 1,
2.792755, -0.8372146, 1.582483, 1, 1, 1, 1, 1,
2.954218, -0.1974478, 1.056935, 1, 1, 1, 1, 1,
3.145709, 0.1930401, 0.8700178, 1, 1, 1, 1, 1
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
var radius = 10.11144;
var distance = 35.51602;
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
mvMatrix.translate( -0.06899261, -0.512224, 0.6799102 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.51602);
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
