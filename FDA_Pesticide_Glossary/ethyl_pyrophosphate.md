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
-3.751029, 0.2965304, -2.067946, 1, 0, 0, 1,
-3.325239, -1.065302, -1.51822, 1, 0.007843138, 0, 1,
-2.98319, 0.8814641, -1.389758, 1, 0.01176471, 0, 1,
-2.964129, 1.251024, -1.019552, 1, 0.01960784, 0, 1,
-2.794585, -0.8576658, -3.226172, 1, 0.02352941, 0, 1,
-2.776659, -0.7610044, -0.5460017, 1, 0.03137255, 0, 1,
-2.76902, -0.7706273, -3.057996, 1, 0.03529412, 0, 1,
-2.733353, -1.58773, -2.135231, 1, 0.04313726, 0, 1,
-2.716459, 2.083616, 0.5948644, 1, 0.04705882, 0, 1,
-2.681014, 0.4481492, -2.342461, 1, 0.05490196, 0, 1,
-2.560788, 0.3819677, -1.223838, 1, 0.05882353, 0, 1,
-2.542016, 1.091672, -1.272834, 1, 0.06666667, 0, 1,
-2.476457, -0.8196956, -1.820073, 1, 0.07058824, 0, 1,
-2.458406, 0.6050844, -0.8995469, 1, 0.07843138, 0, 1,
-2.423846, -0.6800205, -2.642468, 1, 0.08235294, 0, 1,
-2.407915, 1.045936, -0.3048563, 1, 0.09019608, 0, 1,
-2.38051, -0.3368446, -1.519265, 1, 0.09411765, 0, 1,
-2.365508, -0.4884501, -1.963133, 1, 0.1019608, 0, 1,
-2.249954, -1.248375, -3.552454, 1, 0.1098039, 0, 1,
-2.180895, 0.4532211, -0.9338859, 1, 0.1137255, 0, 1,
-2.135544, 1.187565, 0.07699207, 1, 0.1215686, 0, 1,
-2.13291, -0.9326447, -3.521078, 1, 0.1254902, 0, 1,
-2.124418, -0.7074022, -2.646964, 1, 0.1333333, 0, 1,
-2.122293, -1.491951, -2.573062, 1, 0.1372549, 0, 1,
-2.086142, 0.6488062, 0.09919047, 1, 0.145098, 0, 1,
-2.074883, -1.045297, -2.201744, 1, 0.1490196, 0, 1,
-2.036694, -0.06193854, -1.60235, 1, 0.1568628, 0, 1,
-2.030061, 1.776817, 0.5882037, 1, 0.1607843, 0, 1,
-2.024279, -0.8988417, -1.525702, 1, 0.1686275, 0, 1,
-2.014216, 0.6514016, -0.6862253, 1, 0.172549, 0, 1,
-2.009135, 0.8306395, -1.342452, 1, 0.1803922, 0, 1,
-2.00491, 1.330531, -0.6912458, 1, 0.1843137, 0, 1,
-2.002774, -1.657065, -1.17868, 1, 0.1921569, 0, 1,
-1.96349, 0.6271791, -2.851836, 1, 0.1960784, 0, 1,
-1.939081, 0.01824933, -1.938114, 1, 0.2039216, 0, 1,
-1.937662, -1.233685, -1.284291, 1, 0.2117647, 0, 1,
-1.913937, -0.7911279, -2.463664, 1, 0.2156863, 0, 1,
-1.902721, -0.1936296, -2.283439, 1, 0.2235294, 0, 1,
-1.871719, -1.089263, -2.431802, 1, 0.227451, 0, 1,
-1.862836, -1.179742, -2.117613, 1, 0.2352941, 0, 1,
-1.854415, -0.3988914, -1.196404, 1, 0.2392157, 0, 1,
-1.839207, 0.9037003, -0.4371053, 1, 0.2470588, 0, 1,
-1.832713, 0.06009961, -1.376975, 1, 0.2509804, 0, 1,
-1.814201, 1.097178, 0.08978081, 1, 0.2588235, 0, 1,
-1.808403, -1.262741, -2.008759, 1, 0.2627451, 0, 1,
-1.799718, 1.032175, -1.078361, 1, 0.2705882, 0, 1,
-1.778847, -1.792514, -1.843513, 1, 0.2745098, 0, 1,
-1.773047, -0.7909319, -1.906022, 1, 0.282353, 0, 1,
-1.752069, 1.737546, -1.09368, 1, 0.2862745, 0, 1,
-1.751143, -0.2074369, -1.933223, 1, 0.2941177, 0, 1,
-1.740768, 1.474938, -0.8126996, 1, 0.3019608, 0, 1,
-1.712558, 0.605764, -0.3431129, 1, 0.3058824, 0, 1,
-1.703889, -0.4054937, -2.468675, 1, 0.3137255, 0, 1,
-1.697628, -0.465147, -2.938436, 1, 0.3176471, 0, 1,
-1.673236, -0.05132177, -2.341398, 1, 0.3254902, 0, 1,
-1.669511, 0.9945275, -0.4535584, 1, 0.3294118, 0, 1,
-1.663357, -1.286738, -2.018854, 1, 0.3372549, 0, 1,
-1.659781, -0.3556399, -3.005811, 1, 0.3411765, 0, 1,
-1.657235, -2.056343, -2.706077, 1, 0.3490196, 0, 1,
-1.650804, -0.6295283, -2.550756, 1, 0.3529412, 0, 1,
-1.641088, 0.7561418, -2.290995, 1, 0.3607843, 0, 1,
-1.637194, -0.3767227, -1.869555, 1, 0.3647059, 0, 1,
-1.626946, 1.085196, 0.5177212, 1, 0.372549, 0, 1,
-1.624667, -0.7585026, -2.025679, 1, 0.3764706, 0, 1,
-1.614405, -1.271137, -2.543885, 1, 0.3843137, 0, 1,
-1.56841, 0.6942629, -2.489829, 1, 0.3882353, 0, 1,
-1.560525, 0.6488881, -0.9269787, 1, 0.3960784, 0, 1,
-1.550866, -0.5574608, -0.119838, 1, 0.4039216, 0, 1,
-1.547003, 0.620591, -1.363431, 1, 0.4078431, 0, 1,
-1.54325, -1.991417, -1.484398, 1, 0.4156863, 0, 1,
-1.543187, 0.611735, -1.829991, 1, 0.4196078, 0, 1,
-1.54091, -0.1169987, -0.7837005, 1, 0.427451, 0, 1,
-1.537107, 1.773995, 0.2508275, 1, 0.4313726, 0, 1,
-1.523266, 0.31822, -2.147952, 1, 0.4392157, 0, 1,
-1.517044, -1.2816, -2.249888, 1, 0.4431373, 0, 1,
-1.516919, -0.6551111, -2.261012, 1, 0.4509804, 0, 1,
-1.510145, 2.092953, -1.460694, 1, 0.454902, 0, 1,
-1.503458, 1.025501, -1.663628, 1, 0.4627451, 0, 1,
-1.500431, -0.3255147, -1.114863, 1, 0.4666667, 0, 1,
-1.497786, 0.02443924, 1.611274, 1, 0.4745098, 0, 1,
-1.485166, 0.621052, -0.05114667, 1, 0.4784314, 0, 1,
-1.48322, -0.9059718, -2.182489, 1, 0.4862745, 0, 1,
-1.482509, -0.5026177, -2.682833, 1, 0.4901961, 0, 1,
-1.471375, 0.3091293, -1.109378, 1, 0.4980392, 0, 1,
-1.469326, -0.8683422, -1.053964, 1, 0.5058824, 0, 1,
-1.467474, 0.5273054, -0.7692904, 1, 0.509804, 0, 1,
-1.456462, 0.2749555, -1.5232, 1, 0.5176471, 0, 1,
-1.445198, 0.160494, -1.72911, 1, 0.5215687, 0, 1,
-1.444232, -0.2885638, -1.990094, 1, 0.5294118, 0, 1,
-1.437137, 0.2636216, -1.512519, 1, 0.5333334, 0, 1,
-1.432352, 0.3441485, -2.163841, 1, 0.5411765, 0, 1,
-1.415635, -1.2426, -2.381832, 1, 0.5450981, 0, 1,
-1.411133, -0.5792645, -1.404613, 1, 0.5529412, 0, 1,
-1.40856, 0.7612597, -1.326028, 1, 0.5568628, 0, 1,
-1.407243, -2.557444, -1.451656, 1, 0.5647059, 0, 1,
-1.399094, 0.4313563, -0.7333719, 1, 0.5686275, 0, 1,
-1.396079, 0.9320268, -0.6837311, 1, 0.5764706, 0, 1,
-1.390375, -0.3893593, -1.879995, 1, 0.5803922, 0, 1,
-1.345516, -0.5363572, -2.599317, 1, 0.5882353, 0, 1,
-1.337827, 1.071235, -1.696891, 1, 0.5921569, 0, 1,
-1.310485, -0.2969449, -1.745322, 1, 0.6, 0, 1,
-1.308656, 0.8242677, -0.4891344, 1, 0.6078432, 0, 1,
-1.300945, -0.8534806, -1.631361, 1, 0.6117647, 0, 1,
-1.289744, 0.9697436, -0.4902779, 1, 0.6196079, 0, 1,
-1.287519, -1.983316, -2.309443, 1, 0.6235294, 0, 1,
-1.28588, 1.988938, -1.419928, 1, 0.6313726, 0, 1,
-1.280817, -0.585309, -0.1973745, 1, 0.6352941, 0, 1,
-1.279991, 1.111255, -0.4572922, 1, 0.6431373, 0, 1,
-1.279025, -0.1374061, -0.008180344, 1, 0.6470588, 0, 1,
-1.276957, -0.5256505, -1.997126, 1, 0.654902, 0, 1,
-1.274461, -1.578414, -2.9963, 1, 0.6588235, 0, 1,
-1.269888, 0.6177875, -1.757231, 1, 0.6666667, 0, 1,
-1.269426, -0.2637838, -1.107172, 1, 0.6705883, 0, 1,
-1.2694, 0.6008081, 0.0647176, 1, 0.6784314, 0, 1,
-1.256621, 0.4146188, -0.4916388, 1, 0.682353, 0, 1,
-1.255495, 0.485252, -3.243865, 1, 0.6901961, 0, 1,
-1.232306, 1.583734, -2.632238, 1, 0.6941177, 0, 1,
-1.21932, -0.5011449, -3.06552, 1, 0.7019608, 0, 1,
-1.21767, 0.7078297, -2.293769, 1, 0.7098039, 0, 1,
-1.215868, 0.8189734, -0.8917896, 1, 0.7137255, 0, 1,
-1.20818, 1.666128, 0.7103006, 1, 0.7215686, 0, 1,
-1.205884, 0.04094609, -2.706301, 1, 0.7254902, 0, 1,
-1.205384, 0.5521141, -0.5353461, 1, 0.7333333, 0, 1,
-1.19724, 0.2481437, -2.157798, 1, 0.7372549, 0, 1,
-1.190294, 0.1497117, -0.09578921, 1, 0.7450981, 0, 1,
-1.185228, 1.267585, 0.7182319, 1, 0.7490196, 0, 1,
-1.183982, 1.416536, -1.298489, 1, 0.7568628, 0, 1,
-1.180978, 0.0978817, -1.321789, 1, 0.7607843, 0, 1,
-1.180642, -0.6969667, -4.501796, 1, 0.7686275, 0, 1,
-1.164754, -0.5204711, -1.99937, 1, 0.772549, 0, 1,
-1.163731, -0.8310004, -2.813555, 1, 0.7803922, 0, 1,
-1.162436, -1.836606, -3.934926, 1, 0.7843137, 0, 1,
-1.162035, 0.3497841, -1.056048, 1, 0.7921569, 0, 1,
-1.161492, 2.186013, -0.5769531, 1, 0.7960784, 0, 1,
-1.158377, -1.067216, -1.898641, 1, 0.8039216, 0, 1,
-1.158241, -0.7148655, -1.279408, 1, 0.8117647, 0, 1,
-1.151951, 0.8277777, 0.5256969, 1, 0.8156863, 0, 1,
-1.151691, 0.4586333, 1.086967, 1, 0.8235294, 0, 1,
-1.146462, 0.294163, -1.780057, 1, 0.827451, 0, 1,
-1.138916, 0.6984883, -0.5029734, 1, 0.8352941, 0, 1,
-1.137274, 0.3072729, -1.002305, 1, 0.8392157, 0, 1,
-1.133238, 1.417912, -0.9460021, 1, 0.8470588, 0, 1,
-1.13236, -0.7171302, -0.9193569, 1, 0.8509804, 0, 1,
-1.126902, -1.549241, -2.994733, 1, 0.8588235, 0, 1,
-1.12665, 1.130021, -0.2269046, 1, 0.8627451, 0, 1,
-1.12005, 1.556177, -1.381969, 1, 0.8705882, 0, 1,
-1.113558, -0.6807359, -0.1718975, 1, 0.8745098, 0, 1,
-1.108329, -0.3499075, -0.1134503, 1, 0.8823529, 0, 1,
-1.107314, -1.510177, -3.315768, 1, 0.8862745, 0, 1,
-1.105242, 1.669948, -1.843709, 1, 0.8941177, 0, 1,
-1.101438, -0.6207482, -2.867398, 1, 0.8980392, 0, 1,
-1.099075, -1.310024, -1.362487, 1, 0.9058824, 0, 1,
-1.079737, -1.778569, -3.061524, 1, 0.9137255, 0, 1,
-1.065273, 2.579849, -2.976613, 1, 0.9176471, 0, 1,
-1.061514, 1.029536, -1.450183, 1, 0.9254902, 0, 1,
-1.060479, 0.4259421, -2.837524, 1, 0.9294118, 0, 1,
-1.060428, -3.10055, -2.932932, 1, 0.9372549, 0, 1,
-1.056569, 0.1330608, -0.2005558, 1, 0.9411765, 0, 1,
-1.056389, -0.5361604, -1.220389, 1, 0.9490196, 0, 1,
-1.053365, -1.698725, -1.736958, 1, 0.9529412, 0, 1,
-1.053002, -1.629856, -2.702623, 1, 0.9607843, 0, 1,
-1.052751, 1.046466, 0.2135278, 1, 0.9647059, 0, 1,
-1.048424, -0.3996791, -2.794918, 1, 0.972549, 0, 1,
-1.045027, -0.4990629, -2.13442, 1, 0.9764706, 0, 1,
-1.040227, 0.08459146, -0.1630406, 1, 0.9843137, 0, 1,
-1.039614, -0.3428602, -1.157977, 1, 0.9882353, 0, 1,
-1.034512, -0.7011292, -2.872601, 1, 0.9960784, 0, 1,
-1.030422, 0.957826, 0.626967, 0.9960784, 1, 0, 1,
-1.026449, 0.1702305, -1.836538, 0.9921569, 1, 0, 1,
-1.026248, 0.6651346, -1.412794, 0.9843137, 1, 0, 1,
-1.025538, -0.5036253, -3.685825, 0.9803922, 1, 0, 1,
-1.022924, 0.6371323, -1.570408, 0.972549, 1, 0, 1,
-1.015039, -2.095597, -3.77561, 0.9686275, 1, 0, 1,
-1.010926, 0.397472, -1.192504, 0.9607843, 1, 0, 1,
-1.010237, 0.8582522, -2.31848, 0.9568627, 1, 0, 1,
-1.009359, -1.94666, 0.4560367, 0.9490196, 1, 0, 1,
-1.007111, -0.2445712, -2.999536, 0.945098, 1, 0, 1,
-0.9950841, 0.8503208, -1.333806, 0.9372549, 1, 0, 1,
-0.9893878, -0.7627935, -2.094579, 0.9333333, 1, 0, 1,
-0.9891869, 0.863885, -1.788082, 0.9254902, 1, 0, 1,
-0.9872679, -1.707595, -2.471592, 0.9215686, 1, 0, 1,
-0.9867923, -0.1459053, -1.344674, 0.9137255, 1, 0, 1,
-0.9823758, 0.8874102, 0.2274425, 0.9098039, 1, 0, 1,
-0.980979, 1.819246, -0.8687201, 0.9019608, 1, 0, 1,
-0.9803122, -1.600912, -2.549905, 0.8941177, 1, 0, 1,
-0.9802163, 0.1337878, -1.547251, 0.8901961, 1, 0, 1,
-0.979352, -0.595804, -2.661037, 0.8823529, 1, 0, 1,
-0.9762347, 2.517753, 0.05582125, 0.8784314, 1, 0, 1,
-0.9753463, 0.7029101, -1.186266, 0.8705882, 1, 0, 1,
-0.9716327, -2.203495, -2.36688, 0.8666667, 1, 0, 1,
-0.9688436, -0.1536339, -4.090138, 0.8588235, 1, 0, 1,
-0.9667367, 0.2492786, 0.4366244, 0.854902, 1, 0, 1,
-0.955782, 1.04246, -0.9870642, 0.8470588, 1, 0, 1,
-0.9539516, 0.2238212, -2.834206, 0.8431373, 1, 0, 1,
-0.9506084, 1.573263, -1.776252, 0.8352941, 1, 0, 1,
-0.9495243, -1.425076, -0.3940834, 0.8313726, 1, 0, 1,
-0.9443092, -1.859621, -3.053203, 0.8235294, 1, 0, 1,
-0.9439335, 0.1440842, -1.435592, 0.8196079, 1, 0, 1,
-0.9404718, -0.9701397, -3.987387, 0.8117647, 1, 0, 1,
-0.9382878, -2.072512, -4.206263, 0.8078431, 1, 0, 1,
-0.9377323, -1.200123, -3.304741, 0.8, 1, 0, 1,
-0.9376026, 1.470864, -1.810341, 0.7921569, 1, 0, 1,
-0.9361738, 0.02200849, -1.483578, 0.7882353, 1, 0, 1,
-0.933478, -0.4133274, -0.9674973, 0.7803922, 1, 0, 1,
-0.9247956, 1.176106, -2.181118, 0.7764706, 1, 0, 1,
-0.9242882, 0.8696815, -0.3808209, 0.7686275, 1, 0, 1,
-0.9195832, 1.215091, -2.713423, 0.7647059, 1, 0, 1,
-0.9183717, 0.4496791, -1.895655, 0.7568628, 1, 0, 1,
-0.9087948, 0.9339973, 0.1498386, 0.7529412, 1, 0, 1,
-0.9055718, 0.5357054, 0.1084673, 0.7450981, 1, 0, 1,
-0.9042799, -1.98559, -3.39513, 0.7411765, 1, 0, 1,
-0.899652, -0.5448242, -2.192207, 0.7333333, 1, 0, 1,
-0.8991644, 0.4707284, -1.465173, 0.7294118, 1, 0, 1,
-0.8965248, -2.960241, -2.991352, 0.7215686, 1, 0, 1,
-0.8944999, 1.043951, -1.087662, 0.7176471, 1, 0, 1,
-0.891152, 0.135256, -1.339601, 0.7098039, 1, 0, 1,
-0.8879877, -0.7701872, -1.831428, 0.7058824, 1, 0, 1,
-0.8874717, 0.5379604, -0.6113196, 0.6980392, 1, 0, 1,
-0.8874204, -0.7105764, -2.752988, 0.6901961, 1, 0, 1,
-0.8829271, 0.3733306, -0.7409485, 0.6862745, 1, 0, 1,
-0.8812835, -1.238653, -1.744402, 0.6784314, 1, 0, 1,
-0.8780835, 0.7442315, -0.5064968, 0.6745098, 1, 0, 1,
-0.877056, -0.3810822, 0.04225802, 0.6666667, 1, 0, 1,
-0.8747693, -0.8373179, -2.491526, 0.6627451, 1, 0, 1,
-0.8714921, 1.631676, -0.7036365, 0.654902, 1, 0, 1,
-0.8696266, -0.6243368, -1.693437, 0.6509804, 1, 0, 1,
-0.8684805, 0.3648204, 0.8875552, 0.6431373, 1, 0, 1,
-0.8666567, 0.04867081, -0.8520189, 0.6392157, 1, 0, 1,
-0.8634817, -0.5825094, -3.392253, 0.6313726, 1, 0, 1,
-0.8621763, -0.6304092, -2.898157, 0.627451, 1, 0, 1,
-0.8621237, 0.05321539, -2.559409, 0.6196079, 1, 0, 1,
-0.8609153, -1.304079, -1.175059, 0.6156863, 1, 0, 1,
-0.8527766, 0.7254883, -2.91683, 0.6078432, 1, 0, 1,
-0.8443176, 1.617977, 1.028217, 0.6039216, 1, 0, 1,
-0.8413078, -1.168302, -2.549537, 0.5960785, 1, 0, 1,
-0.8366625, 1.214403, -3.359416, 0.5882353, 1, 0, 1,
-0.8344303, 2.349188, -0.7276857, 0.5843138, 1, 0, 1,
-0.8335114, -1.181546, -3.311398, 0.5764706, 1, 0, 1,
-0.8203073, -0.0009961504, -3.580824, 0.572549, 1, 0, 1,
-0.8110952, 0.1860778, -1.833176, 0.5647059, 1, 0, 1,
-0.8090319, -0.5151372, 0.3708562, 0.5607843, 1, 0, 1,
-0.8085259, 0.1378411, -1.633203, 0.5529412, 1, 0, 1,
-0.799723, 0.01439075, -1.391274, 0.5490196, 1, 0, 1,
-0.7932068, -0.08202732, -3.155257, 0.5411765, 1, 0, 1,
-0.7931431, -0.3921371, -5.131307, 0.5372549, 1, 0, 1,
-0.7927851, -0.8844085, -3.59675, 0.5294118, 1, 0, 1,
-0.7859997, 1.657876, -0.4505511, 0.5254902, 1, 0, 1,
-0.7848041, -1.202066, -3.067726, 0.5176471, 1, 0, 1,
-0.7799745, 0.4570464, -2.290222, 0.5137255, 1, 0, 1,
-0.7782434, -0.867748, -2.939697, 0.5058824, 1, 0, 1,
-0.7769607, -0.9126009, -2.86465, 0.5019608, 1, 0, 1,
-0.7764326, 1.108918, -1.407998, 0.4941176, 1, 0, 1,
-0.7726056, 0.346089, -0.1164746, 0.4862745, 1, 0, 1,
-0.7675555, 0.7804847, -1.441586, 0.4823529, 1, 0, 1,
-0.7674416, 1.072692, -0.6110625, 0.4745098, 1, 0, 1,
-0.7646906, 1.413995, -0.3298895, 0.4705882, 1, 0, 1,
-0.7643387, 0.9767317, 0.4809307, 0.4627451, 1, 0, 1,
-0.7633573, 0.03773656, -0.7904635, 0.4588235, 1, 0, 1,
-0.7628341, 0.5031433, -2.588236, 0.4509804, 1, 0, 1,
-0.7602049, 0.01657455, -2.326325, 0.4470588, 1, 0, 1,
-0.7583063, -1.374303, -2.884321, 0.4392157, 1, 0, 1,
-0.7315058, 0.6608425, -2.155603, 0.4352941, 1, 0, 1,
-0.7224489, 2.992097, 1.010338, 0.427451, 1, 0, 1,
-0.7222681, 0.6872615, -2.227845, 0.4235294, 1, 0, 1,
-0.7209864, 0.2758273, 0.2810874, 0.4156863, 1, 0, 1,
-0.7207549, 1.409083, -0.06181221, 0.4117647, 1, 0, 1,
-0.7191296, 1.776746, -2.143677, 0.4039216, 1, 0, 1,
-0.7135051, -0.03659321, -1.572357, 0.3960784, 1, 0, 1,
-0.7071527, -0.5306972, -2.914814, 0.3921569, 1, 0, 1,
-0.7043664, -1.572029, -1.698891, 0.3843137, 1, 0, 1,
-0.7035708, -0.6566177, -2.240613, 0.3803922, 1, 0, 1,
-0.6885515, 1.886137, -1.366704, 0.372549, 1, 0, 1,
-0.6880894, -0.7920731, -3.656772, 0.3686275, 1, 0, 1,
-0.6843277, 0.01731475, -1.441319, 0.3607843, 1, 0, 1,
-0.675546, 0.1625797, -0.8063568, 0.3568628, 1, 0, 1,
-0.6638411, -1.483085, -2.225396, 0.3490196, 1, 0, 1,
-0.6614529, 0.5141428, 0.03859863, 0.345098, 1, 0, 1,
-0.6607658, -0.07317375, -2.974491, 0.3372549, 1, 0, 1,
-0.6606689, 0.6700072, -0.2466242, 0.3333333, 1, 0, 1,
-0.6605269, -0.7971411, -4.455559, 0.3254902, 1, 0, 1,
-0.6551753, 1.196194, 0.7650845, 0.3215686, 1, 0, 1,
-0.6527523, 1.558999, -0.531289, 0.3137255, 1, 0, 1,
-0.6509985, 0.3568524, -0.6530324, 0.3098039, 1, 0, 1,
-0.6437007, 0.2605703, -0.6201298, 0.3019608, 1, 0, 1,
-0.639816, 1.127052, 1.005016, 0.2941177, 1, 0, 1,
-0.6323496, 1.25095, 1.61685, 0.2901961, 1, 0, 1,
-0.6303621, -1.211191, -1.651746, 0.282353, 1, 0, 1,
-0.6299467, -0.7349745, -2.418225, 0.2784314, 1, 0, 1,
-0.6299461, 1.056739, -1.727398, 0.2705882, 1, 0, 1,
-0.6298583, 0.3190158, -2.355255, 0.2666667, 1, 0, 1,
-0.6275837, 0.3200171, -1.046046, 0.2588235, 1, 0, 1,
-0.6264185, 1.071851, -1.065241, 0.254902, 1, 0, 1,
-0.6250235, 1.871292, -0.249534, 0.2470588, 1, 0, 1,
-0.623251, -1.033716, -1.571081, 0.2431373, 1, 0, 1,
-0.6203797, 0.1737686, -1.275105, 0.2352941, 1, 0, 1,
-0.6199824, -0.7372603, -1.535955, 0.2313726, 1, 0, 1,
-0.6172598, -2.218287, -1.765585, 0.2235294, 1, 0, 1,
-0.6131971, -1.637911, -1.357994, 0.2196078, 1, 0, 1,
-0.6109482, 0.7281134, -0.4110133, 0.2117647, 1, 0, 1,
-0.6031728, -2.027178, -3.140901, 0.2078431, 1, 0, 1,
-0.5983096, 0.9428318, -0.1431028, 0.2, 1, 0, 1,
-0.5970221, -0.3731844, -2.156656, 0.1921569, 1, 0, 1,
-0.5968773, 0.4874314, -1.559744, 0.1882353, 1, 0, 1,
-0.5881386, 0.1940814, -1.40893, 0.1803922, 1, 0, 1,
-0.5854805, -0.5523195, -4.535408, 0.1764706, 1, 0, 1,
-0.5828166, -2.24434, -3.28371, 0.1686275, 1, 0, 1,
-0.5788837, -0.02106388, -0.7340449, 0.1647059, 1, 0, 1,
-0.5773266, -0.2914337, -1.099738, 0.1568628, 1, 0, 1,
-0.5711702, 0.7523461, -1.139617, 0.1529412, 1, 0, 1,
-0.5702358, 0.5384634, -1.061823, 0.145098, 1, 0, 1,
-0.565554, 2.593355, 2.341416, 0.1411765, 1, 0, 1,
-0.5648442, 1.416594, -1.622359, 0.1333333, 1, 0, 1,
-0.5605271, -2.20207, -3.300885, 0.1294118, 1, 0, 1,
-0.5600373, -0.9458466, -1.991957, 0.1215686, 1, 0, 1,
-0.5566806, -0.3594018, -3.656806, 0.1176471, 1, 0, 1,
-0.5556108, 0.709483, -1.678152, 0.1098039, 1, 0, 1,
-0.5552037, 0.8042986, 0.8202638, 0.1058824, 1, 0, 1,
-0.5540084, 1.012058, -1.230769, 0.09803922, 1, 0, 1,
-0.5507624, -0.6239725, -3.667292, 0.09019608, 1, 0, 1,
-0.550089, 1.478479, -1.842198, 0.08627451, 1, 0, 1,
-0.5489761, 1.519943, -2.028142, 0.07843138, 1, 0, 1,
-0.5458356, 0.9742998, -0.2427323, 0.07450981, 1, 0, 1,
-0.5456234, -0.8522189, -1.720918, 0.06666667, 1, 0, 1,
-0.5432618, 0.03678518, -0.8273214, 0.0627451, 1, 0, 1,
-0.5406201, -0.4014041, -1.573854, 0.05490196, 1, 0, 1,
-0.5384334, -0.4087216, -3.063141, 0.05098039, 1, 0, 1,
-0.5378175, 1.351919, -0.5204442, 0.04313726, 1, 0, 1,
-0.5351593, -1.792726, -2.703333, 0.03921569, 1, 0, 1,
-0.5327802, -1.472575, -2.824498, 0.03137255, 1, 0, 1,
-0.526646, -0.8027673, -2.65691, 0.02745098, 1, 0, 1,
-0.522963, 0.2412633, -2.148195, 0.01960784, 1, 0, 1,
-0.514746, -0.4631963, -0.5642347, 0.01568628, 1, 0, 1,
-0.5122007, -0.4022924, -3.185217, 0.007843138, 1, 0, 1,
-0.5090316, -0.3541542, -3.855437, 0.003921569, 1, 0, 1,
-0.5054883, -1.013481, -0.878956, 0, 1, 0.003921569, 1,
-0.5049781, 0.5799484, -0.4212549, 0, 1, 0.01176471, 1,
-0.5043108, -1.425876, -4.635253, 0, 1, 0.01568628, 1,
-0.5016604, 0.3174005, 0.3750555, 0, 1, 0.02352941, 1,
-0.5012657, -1.295575, -1.696525, 0, 1, 0.02745098, 1,
-0.4979356, 1.923815, -0.1424956, 0, 1, 0.03529412, 1,
-0.4967449, -0.1564096, -2.372982, 0, 1, 0.03921569, 1,
-0.4917374, -0.05771377, -2.840101, 0, 1, 0.04705882, 1,
-0.4895863, 1.595844, 0.2063137, 0, 1, 0.05098039, 1,
-0.487626, -0.503569, -2.21891, 0, 1, 0.05882353, 1,
-0.4874249, 0.5358236, -2.318342, 0, 1, 0.0627451, 1,
-0.4858462, 0.6447684, -0.009249733, 0, 1, 0.07058824, 1,
-0.484716, -1.238036, -0.4734879, 0, 1, 0.07450981, 1,
-0.4816245, 0.3832392, 0.06339447, 0, 1, 0.08235294, 1,
-0.4801366, 1.052301, -1.710598, 0, 1, 0.08627451, 1,
-0.4796603, 1.828929, 0.9284694, 0, 1, 0.09411765, 1,
-0.4737809, 1.078156, -0.6140168, 0, 1, 0.1019608, 1,
-0.4722154, -0.2899079, -1.140454, 0, 1, 0.1058824, 1,
-0.4639902, 0.02693469, -1.946749, 0, 1, 0.1137255, 1,
-0.4624495, 0.4257149, 0.5968999, 0, 1, 0.1176471, 1,
-0.4618858, -0.5013048, -3.113137, 0, 1, 0.1254902, 1,
-0.4591072, 0.8051823, 0.1687181, 0, 1, 0.1294118, 1,
-0.4574225, -0.6783925, -1.772639, 0, 1, 0.1372549, 1,
-0.4524017, 0.03933103, -0.7313822, 0, 1, 0.1411765, 1,
-0.4496651, 0.3520875, -1.195929, 0, 1, 0.1490196, 1,
-0.4476006, 0.03030193, -1.656274, 0, 1, 0.1529412, 1,
-0.4425789, -1.155096, -2.340471, 0, 1, 0.1607843, 1,
-0.4377548, 1.530002, 1.113989, 0, 1, 0.1647059, 1,
-0.4305025, -1.239334, -4.25597, 0, 1, 0.172549, 1,
-0.4297263, 1.506026, -0.07853424, 0, 1, 0.1764706, 1,
-0.4266927, 0.7163628, -2.63081, 0, 1, 0.1843137, 1,
-0.4245346, 0.2997253, 0.6531928, 0, 1, 0.1882353, 1,
-0.4228095, -0.04821435, -2.507427, 0, 1, 0.1960784, 1,
-0.419967, -0.1475211, -2.25103, 0, 1, 0.2039216, 1,
-0.4139185, -0.4712723, -2.948508, 0, 1, 0.2078431, 1,
-0.4136947, -0.9773781, -1.915121, 0, 1, 0.2156863, 1,
-0.413672, 0.9538652, -0.4353867, 0, 1, 0.2196078, 1,
-0.4116409, 2.134272, 1.699053, 0, 1, 0.227451, 1,
-0.408659, -1.097361, -3.671617, 0, 1, 0.2313726, 1,
-0.3985702, 0.267544, -0.02316774, 0, 1, 0.2392157, 1,
-0.3928147, 0.4083451, -1.463213, 0, 1, 0.2431373, 1,
-0.3926253, 1.67413, -1.465891, 0, 1, 0.2509804, 1,
-0.3896065, 1.134228, -1.061412, 0, 1, 0.254902, 1,
-0.3819822, -0.1301235, -3.120864, 0, 1, 0.2627451, 1,
-0.3814213, 1.096465, 0.3369159, 0, 1, 0.2666667, 1,
-0.3789891, -0.122991, -4.634572, 0, 1, 0.2745098, 1,
-0.3771115, -0.767429, -2.20596, 0, 1, 0.2784314, 1,
-0.3767381, -0.2896662, -3.589505, 0, 1, 0.2862745, 1,
-0.3761908, -0.9198065, -2.367669, 0, 1, 0.2901961, 1,
-0.3760731, -0.8566488, -1.787322, 0, 1, 0.2980392, 1,
-0.3748882, -0.29631, -2.724037, 0, 1, 0.3058824, 1,
-0.3711284, 0.5741084, 1.900981, 0, 1, 0.3098039, 1,
-0.3705936, -0.4518158, -2.108158, 0, 1, 0.3176471, 1,
-0.3703153, -0.1598965, -3.298003, 0, 1, 0.3215686, 1,
-0.3682158, -1.857995, -2.23225, 0, 1, 0.3294118, 1,
-0.3659144, 0.230929, 0.06756806, 0, 1, 0.3333333, 1,
-0.3645725, 1.884758, 0.575835, 0, 1, 0.3411765, 1,
-0.3639979, -1.040777, -3.32788, 0, 1, 0.345098, 1,
-0.3595318, -0.4898408, -2.629614, 0, 1, 0.3529412, 1,
-0.3589194, -0.004138251, -1.239151, 0, 1, 0.3568628, 1,
-0.3513819, 0.4420294, -0.9628158, 0, 1, 0.3647059, 1,
-0.3508749, 1.10625, -1.345485, 0, 1, 0.3686275, 1,
-0.3498826, -0.6568466, -3.239047, 0, 1, 0.3764706, 1,
-0.3414879, 0.04131229, -2.762076, 0, 1, 0.3803922, 1,
-0.3391756, -0.2551922, -3.375892, 0, 1, 0.3882353, 1,
-0.3390156, 0.3916912, 0.2524827, 0, 1, 0.3921569, 1,
-0.3268081, 1.076235, 0.8154303, 0, 1, 0.4, 1,
-0.3256364, 0.06725201, -0.823527, 0, 1, 0.4078431, 1,
-0.3200324, 0.5690166, -0.9953415, 0, 1, 0.4117647, 1,
-0.319193, 1.171774, 0.08583006, 0, 1, 0.4196078, 1,
-0.3185863, -0.2424717, -2.222111, 0, 1, 0.4235294, 1,
-0.3180207, -1.757792, -3.646077, 0, 1, 0.4313726, 1,
-0.3144519, 0.7929593, 0.4107025, 0, 1, 0.4352941, 1,
-0.3124928, -0.01194522, -0.8053893, 0, 1, 0.4431373, 1,
-0.3068111, -0.4511661, -3.479113, 0, 1, 0.4470588, 1,
-0.3045608, -0.7864209, -2.494823, 0, 1, 0.454902, 1,
-0.2955815, 1.917328, -3.03221, 0, 1, 0.4588235, 1,
-0.2924195, -0.02869584, -2.671621, 0, 1, 0.4666667, 1,
-0.291552, -0.1485551, -1.298622, 0, 1, 0.4705882, 1,
-0.2883686, 0.530384, 0.5985962, 0, 1, 0.4784314, 1,
-0.2845927, -1.519309, -2.662275, 0, 1, 0.4823529, 1,
-0.2843806, 1.060173, -0.08248463, 0, 1, 0.4901961, 1,
-0.2824452, 0.5895699, 0.3516586, 0, 1, 0.4941176, 1,
-0.2796891, 0.2012351, -1.160021, 0, 1, 0.5019608, 1,
-0.2792863, -0.01605032, -2.048345, 0, 1, 0.509804, 1,
-0.278666, 1.565174, -1.210242, 0, 1, 0.5137255, 1,
-0.2729789, 0.3291392, 0.7975166, 0, 1, 0.5215687, 1,
-0.2680116, -0.9889225, -4.415989, 0, 1, 0.5254902, 1,
-0.2679363, 0.5971119, -1.200992, 0, 1, 0.5333334, 1,
-0.2677381, 0.151417, -1.180531, 0, 1, 0.5372549, 1,
-0.2608675, -1.024175, -2.039217, 0, 1, 0.5450981, 1,
-0.2580726, 1.507684, -1.87361, 0, 1, 0.5490196, 1,
-0.2548369, -0.09489547, -1.768388, 0, 1, 0.5568628, 1,
-0.2545979, -0.01508147, -0.9938993, 0, 1, 0.5607843, 1,
-0.25203, -0.9560629, -2.943594, 0, 1, 0.5686275, 1,
-0.2479097, 0.01869852, -2.61307, 0, 1, 0.572549, 1,
-0.2433815, -1.688375, -2.759884, 0, 1, 0.5803922, 1,
-0.2412673, -0.5852435, -2.281051, 0, 1, 0.5843138, 1,
-0.238499, -0.8079394, -3.600658, 0, 1, 0.5921569, 1,
-0.2383516, -0.7155622, -4.226173, 0, 1, 0.5960785, 1,
-0.2380528, -0.1677141, -2.013804, 0, 1, 0.6039216, 1,
-0.2365741, 0.3000863, -2.065605, 0, 1, 0.6117647, 1,
-0.2354545, -1.118245, -4.194139, 0, 1, 0.6156863, 1,
-0.2317195, 0.5635993, -1.639176, 0, 1, 0.6235294, 1,
-0.2302054, -0.9027247, -3.199339, 0, 1, 0.627451, 1,
-0.2298228, -1.291333, -4.211497, 0, 1, 0.6352941, 1,
-0.2279831, 1.61474, -0.2663878, 0, 1, 0.6392157, 1,
-0.2239261, 0.2340523, -0.08184302, 0, 1, 0.6470588, 1,
-0.2211354, 0.7403621, -0.6376453, 0, 1, 0.6509804, 1,
-0.216805, 0.3918175, 0.3221413, 0, 1, 0.6588235, 1,
-0.215223, -0.03591773, 0.3311915, 0, 1, 0.6627451, 1,
-0.2044503, -0.081324, -2.776267, 0, 1, 0.6705883, 1,
-0.2014255, 0.8952965, -1.012595, 0, 1, 0.6745098, 1,
-0.2011775, 0.2955835, -1.954114, 0, 1, 0.682353, 1,
-0.2010083, -0.6563648, -1.885647, 0, 1, 0.6862745, 1,
-0.1995385, -2.234643, -3.354594, 0, 1, 0.6941177, 1,
-0.1987359, 0.7845246, 0.03506043, 0, 1, 0.7019608, 1,
-0.1962855, -3.32127, -3.810013, 0, 1, 0.7058824, 1,
-0.1961655, -0.9869682, -4.448051, 0, 1, 0.7137255, 1,
-0.1954798, -0.2267699, -2.28899, 0, 1, 0.7176471, 1,
-0.1837111, 0.292953, -0.2359255, 0, 1, 0.7254902, 1,
-0.1802571, 0.2529698, -2.090477, 0, 1, 0.7294118, 1,
-0.1790542, -0.3554068, -2.344949, 0, 1, 0.7372549, 1,
-0.1789445, -0.9903868, -3.127427, 0, 1, 0.7411765, 1,
-0.1787223, 1.607702, 0.620618, 0, 1, 0.7490196, 1,
-0.1725159, 0.5499141, 0.1703067, 0, 1, 0.7529412, 1,
-0.1709485, 0.5759017, -2.324116, 0, 1, 0.7607843, 1,
-0.1707095, 0.4517213, -0.01942874, 0, 1, 0.7647059, 1,
-0.168573, 0.9858882, -1.794047, 0, 1, 0.772549, 1,
-0.1652171, 1.570079, 1.965256, 0, 1, 0.7764706, 1,
-0.1600946, -0.3332144, -3.329501, 0, 1, 0.7843137, 1,
-0.1535109, 1.365595, 0.4367401, 0, 1, 0.7882353, 1,
-0.1520848, -0.9163927, -3.960166, 0, 1, 0.7960784, 1,
-0.1514962, -1.047943, -2.077022, 0, 1, 0.8039216, 1,
-0.1512622, -0.4453394, -2.179957, 0, 1, 0.8078431, 1,
-0.1508461, 1.57362, 0.4312099, 0, 1, 0.8156863, 1,
-0.1494795, -0.9033626, -3.706863, 0, 1, 0.8196079, 1,
-0.1488277, 0.6594688, 0.4422143, 0, 1, 0.827451, 1,
-0.1468172, 1.19301, -0.7079459, 0, 1, 0.8313726, 1,
-0.1423217, 0.6451414, 0.8601975, 0, 1, 0.8392157, 1,
-0.1421862, -1.05085, -4.653567, 0, 1, 0.8431373, 1,
-0.1387413, 1.701994, 0.4841264, 0, 1, 0.8509804, 1,
-0.1368732, -1.854897, -3.863497, 0, 1, 0.854902, 1,
-0.1368125, -1.224297, -2.958939, 0, 1, 0.8627451, 1,
-0.1345488, 1.759581, -0.7356672, 0, 1, 0.8666667, 1,
-0.1336675, -0.2415424, -1.767167, 0, 1, 0.8745098, 1,
-0.1272566, -0.9635212, -3.297806, 0, 1, 0.8784314, 1,
-0.1165733, -0.8840035, -1.128847, 0, 1, 0.8862745, 1,
-0.1133983, -0.6143634, -3.739523, 0, 1, 0.8901961, 1,
-0.1099549, -0.1307754, -2.474048, 0, 1, 0.8980392, 1,
-0.1090186, -0.04942248, -0.407246, 0, 1, 0.9058824, 1,
-0.1085062, -1.095498, -4.144714, 0, 1, 0.9098039, 1,
-0.100794, -0.3045784, -3.276598, 0, 1, 0.9176471, 1,
-0.09913175, -0.06501364, -2.161804, 0, 1, 0.9215686, 1,
-0.094028, 0.5591842, 0.4649225, 0, 1, 0.9294118, 1,
-0.09040473, -1.091368, -2.763874, 0, 1, 0.9333333, 1,
-0.08959024, -1.535084, -2.286976, 0, 1, 0.9411765, 1,
-0.0885781, -0.2510222, -2.360085, 0, 1, 0.945098, 1,
-0.08749059, -0.3411257, -1.953845, 0, 1, 0.9529412, 1,
-0.08231873, 0.2763604, -2.096046, 0, 1, 0.9568627, 1,
-0.07678673, 1.844431, 0.6709394, 0, 1, 0.9647059, 1,
-0.0754981, 0.09474892, -1.458972, 0, 1, 0.9686275, 1,
-0.07249246, -0.4940695, -2.851048, 0, 1, 0.9764706, 1,
-0.06834073, 1.638189, -0.8334569, 0, 1, 0.9803922, 1,
-0.06828579, -0.6288309, -2.108514, 0, 1, 0.9882353, 1,
-0.0677047, -0.3486939, -4.092895, 0, 1, 0.9921569, 1,
-0.06700104, -0.799332, -2.169935, 0, 1, 1, 1,
-0.06288929, -0.9206377, -0.8333197, 0, 0.9921569, 1, 1,
-0.06048957, -1.301572, -1.41078, 0, 0.9882353, 1, 1,
-0.06026338, -0.7623216, -3.518513, 0, 0.9803922, 1, 1,
-0.05888755, 1.084215, 0.3947456, 0, 0.9764706, 1, 1,
-0.05798362, -1.192055, -3.254611, 0, 0.9686275, 1, 1,
-0.05765468, 0.4710681, 0.9220449, 0, 0.9647059, 1, 1,
-0.0546574, 1.191383, -0.6136802, 0, 0.9568627, 1, 1,
-0.0465204, -1.058822, -2.166015, 0, 0.9529412, 1, 1,
-0.04424756, 0.1059745, 1.443423, 0, 0.945098, 1, 1,
-0.04388115, -0.4091376, -3.027834, 0, 0.9411765, 1, 1,
-0.03987405, -1.082095, -2.899379, 0, 0.9333333, 1, 1,
-0.029004, 0.6048403, -0.3980893, 0, 0.9294118, 1, 1,
-0.02888179, 0.09373743, 1.122257, 0, 0.9215686, 1, 1,
-0.02368873, -0.7633467, -3.414092, 0, 0.9176471, 1, 1,
-0.02347563, -0.8889419, -3.162597, 0, 0.9098039, 1, 1,
-0.0230102, -0.1936989, -2.798144, 0, 0.9058824, 1, 1,
-0.02284528, -1.175668, -4.411236, 0, 0.8980392, 1, 1,
-0.02121433, -3.08201, -4.912544, 0, 0.8901961, 1, 1,
-0.02079517, -1.208882, -4.152795, 0, 0.8862745, 1, 1,
-0.01543176, 2.528503, 1.265331, 0, 0.8784314, 1, 1,
-0.01375523, -1.202951, -3.405268, 0, 0.8745098, 1, 1,
-0.01362619, -0.2687918, -3.735093, 0, 0.8666667, 1, 1,
-0.008649125, -0.9122945, -3.464053, 0, 0.8627451, 1, 1,
-0.005679343, 0.05507642, 1.180152, 0, 0.854902, 1, 1,
0.001251114, 0.3186882, 1.228198, 0, 0.8509804, 1, 1,
0.00682908, -0.2080641, 1.322016, 0, 0.8431373, 1, 1,
0.007635876, 0.8246151, -0.844409, 0, 0.8392157, 1, 1,
0.008807247, -0.9192097, 3.47701, 0, 0.8313726, 1, 1,
0.01250642, 2.029727, 1.448691, 0, 0.827451, 1, 1,
0.01363967, -0.1605602, 4.042495, 0, 0.8196079, 1, 1,
0.01772756, 0.771908, -0.6323391, 0, 0.8156863, 1, 1,
0.01843651, 0.05801735, 0.9643205, 0, 0.8078431, 1, 1,
0.01969031, 1.965064, -0.484785, 0, 0.8039216, 1, 1,
0.02286919, -0.329313, 2.531414, 0, 0.7960784, 1, 1,
0.02376887, -2.888386, 3.151678, 0, 0.7882353, 1, 1,
0.02569404, -1.33241, 1.990937, 0, 0.7843137, 1, 1,
0.02569456, -0.6403586, 3.568083, 0, 0.7764706, 1, 1,
0.02761302, -1.053088, 3.450423, 0, 0.772549, 1, 1,
0.0291377, -2.002668, 4.493567, 0, 0.7647059, 1, 1,
0.03069265, -0.917967, 1.304813, 0, 0.7607843, 1, 1,
0.0315646, 0.7185794, 0.3546613, 0, 0.7529412, 1, 1,
0.03516161, 1.352144, -0.7969397, 0, 0.7490196, 1, 1,
0.03617447, 1.211847, -0.7351137, 0, 0.7411765, 1, 1,
0.03892495, 0.5515535, 0.5738373, 0, 0.7372549, 1, 1,
0.04121795, -0.6313825, 3.757949, 0, 0.7294118, 1, 1,
0.04215578, -1.265286, 3.412162, 0, 0.7254902, 1, 1,
0.04733674, 0.1561535, 0.186749, 0, 0.7176471, 1, 1,
0.04742698, -0.509513, 3.502659, 0, 0.7137255, 1, 1,
0.05000758, 0.4971279, 0.09537515, 0, 0.7058824, 1, 1,
0.05248553, 0.6797367, -1.601544, 0, 0.6980392, 1, 1,
0.05285758, 0.1024956, 1.229108, 0, 0.6941177, 1, 1,
0.05454715, 0.6121002, 1.431745, 0, 0.6862745, 1, 1,
0.05561876, -1.144364, 3.402586, 0, 0.682353, 1, 1,
0.05634113, 2.576189, 0.1566625, 0, 0.6745098, 1, 1,
0.06281137, 0.3618529, 1.679085, 0, 0.6705883, 1, 1,
0.06746411, -0.8592016, 2.642857, 0, 0.6627451, 1, 1,
0.06852026, 0.9527748, 0.6968926, 0, 0.6588235, 1, 1,
0.07080024, 0.4193159, 0.5785738, 0, 0.6509804, 1, 1,
0.07128602, -0.7919759, 2.675268, 0, 0.6470588, 1, 1,
0.07606409, -0.118673, 1.941796, 0, 0.6392157, 1, 1,
0.08390292, -1.974998, 2.876894, 0, 0.6352941, 1, 1,
0.08456467, -0.5823367, 3.055662, 0, 0.627451, 1, 1,
0.08739286, -0.5257303, 1.623692, 0, 0.6235294, 1, 1,
0.09045143, 0.5971057, -0.8291634, 0, 0.6156863, 1, 1,
0.09611633, -0.2064187, 2.231776, 0, 0.6117647, 1, 1,
0.09837288, 1.281111, -0.7528328, 0, 0.6039216, 1, 1,
0.09985695, 0.8697221, 1.16474, 0, 0.5960785, 1, 1,
0.1008117, -0.4679438, 1.564363, 0, 0.5921569, 1, 1,
0.1026545, 1.129611, 0.1468806, 0, 0.5843138, 1, 1,
0.1068637, 0.4855196, -0.3499352, 0, 0.5803922, 1, 1,
0.107886, -0.6360744, 3.007452, 0, 0.572549, 1, 1,
0.1102129, -0.5503082, 2.554173, 0, 0.5686275, 1, 1,
0.1103072, 1.322105, 0.01671954, 0, 0.5607843, 1, 1,
0.1103781, 0.8320031, -1.361796, 0, 0.5568628, 1, 1,
0.1128916, -0.09077563, 1.955219, 0, 0.5490196, 1, 1,
0.1147588, -0.7111843, 4.457496, 0, 0.5450981, 1, 1,
0.1165276, 0.370187, -0.8002763, 0, 0.5372549, 1, 1,
0.117707, 0.4020189, 0.03521108, 0, 0.5333334, 1, 1,
0.1199092, 0.1644703, 0.502776, 0, 0.5254902, 1, 1,
0.1204713, 0.8367438, 0.5481024, 0, 0.5215687, 1, 1,
0.1217475, -1.199827, 4.007895, 0, 0.5137255, 1, 1,
0.1232974, 0.8874747, 0.7306047, 0, 0.509804, 1, 1,
0.1259543, 0.2677934, 0.2168168, 0, 0.5019608, 1, 1,
0.1268662, 1.151651, 0.8379812, 0, 0.4941176, 1, 1,
0.1328046, 0.6788462, 0.933993, 0, 0.4901961, 1, 1,
0.1332928, 0.6488787, 0.006075523, 0, 0.4823529, 1, 1,
0.1341555, -0.9820771, 1.263421, 0, 0.4784314, 1, 1,
0.1366012, 0.1551655, 3.124385, 0, 0.4705882, 1, 1,
0.1367842, -0.5908558, 3.513256, 0, 0.4666667, 1, 1,
0.1372258, -0.3350809, 4.456392, 0, 0.4588235, 1, 1,
0.1393503, -1.086743, 2.868503, 0, 0.454902, 1, 1,
0.1429127, 0.2719029, 1.21306, 0, 0.4470588, 1, 1,
0.1441157, -0.8660993, 3.247609, 0, 0.4431373, 1, 1,
0.1480115, -1.326583, 4.222847, 0, 0.4352941, 1, 1,
0.1482127, 1.379888, -0.480253, 0, 0.4313726, 1, 1,
0.1561724, 0.8805328, 0.2271832, 0, 0.4235294, 1, 1,
0.1583861, 0.3399324, 1.900714, 0, 0.4196078, 1, 1,
0.1590601, 1.404786, -0.5783392, 0, 0.4117647, 1, 1,
0.1605311, 0.08145925, 3.262239, 0, 0.4078431, 1, 1,
0.1634846, -1.195197, 4.018939, 0, 0.4, 1, 1,
0.1652192, 0.9365895, 2.133955, 0, 0.3921569, 1, 1,
0.167975, -0.404038, 4.423825, 0, 0.3882353, 1, 1,
0.1708021, 0.5498036, -0.2134633, 0, 0.3803922, 1, 1,
0.1713231, -1.477874, 1.200944, 0, 0.3764706, 1, 1,
0.1718038, 0.6392613, -0.6700274, 0, 0.3686275, 1, 1,
0.172892, 1.222538, -0.2983451, 0, 0.3647059, 1, 1,
0.1760159, -0.8169378, 2.428461, 0, 0.3568628, 1, 1,
0.1770215, 0.1125774, 1.180349, 0, 0.3529412, 1, 1,
0.1856381, 0.9743494, -0.1490968, 0, 0.345098, 1, 1,
0.1860356, -0.9655425, 2.258819, 0, 0.3411765, 1, 1,
0.1884261, -1.94013, 3.96071, 0, 0.3333333, 1, 1,
0.1899447, -0.4243418, 3.972833, 0, 0.3294118, 1, 1,
0.1929469, 0.0766625, -0.260838, 0, 0.3215686, 1, 1,
0.1957088, -0.3237779, 3.254695, 0, 0.3176471, 1, 1,
0.196374, 0.4174519, 1.129299, 0, 0.3098039, 1, 1,
0.1991712, -0.06465305, 1.013097, 0, 0.3058824, 1, 1,
0.2004155, 0.3089264, 0.7701904, 0, 0.2980392, 1, 1,
0.2009584, 0.4233944, 1.958374, 0, 0.2901961, 1, 1,
0.2033459, -1.359528, 1.792312, 0, 0.2862745, 1, 1,
0.2049175, -0.3717239, 2.447237, 0, 0.2784314, 1, 1,
0.2055529, 0.4951525, 1.021745, 0, 0.2745098, 1, 1,
0.2070392, 1.133403, -0.2312024, 0, 0.2666667, 1, 1,
0.2137047, -0.2145723, 2.271893, 0, 0.2627451, 1, 1,
0.2170701, -1.513959, 3.020196, 0, 0.254902, 1, 1,
0.2181128, 1.205594, 0.6713336, 0, 0.2509804, 1, 1,
0.2182138, -0.5037352, 2.193821, 0, 0.2431373, 1, 1,
0.2189696, -1.448438, 2.547984, 0, 0.2392157, 1, 1,
0.2310725, 1.589895, -0.2940954, 0, 0.2313726, 1, 1,
0.2340828, 1.024231, -0.1947156, 0, 0.227451, 1, 1,
0.2411085, 0.5193267, -0.143682, 0, 0.2196078, 1, 1,
0.2411893, -1.4339, 3.46184, 0, 0.2156863, 1, 1,
0.2452243, 0.06824925, 2.297753, 0, 0.2078431, 1, 1,
0.2465651, -0.7804726, 2.371253, 0, 0.2039216, 1, 1,
0.2505307, 0.2232864, 2.432014, 0, 0.1960784, 1, 1,
0.2516703, -1.095113, 3.266511, 0, 0.1882353, 1, 1,
0.2576204, -1.209949, 3.278883, 0, 0.1843137, 1, 1,
0.2588497, -1.053616, 3.416987, 0, 0.1764706, 1, 1,
0.2682309, -0.1748173, 2.521289, 0, 0.172549, 1, 1,
0.273275, -0.3671325, 2.640891, 0, 0.1647059, 1, 1,
0.2735916, 0.4105639, 1.49484, 0, 0.1607843, 1, 1,
0.2736944, 0.1537974, 0.07857091, 0, 0.1529412, 1, 1,
0.2762744, -0.8753148, 2.103333, 0, 0.1490196, 1, 1,
0.2840794, 0.6017523, 0.7980816, 0, 0.1411765, 1, 1,
0.2885938, 1.213717, 0.0217187, 0, 0.1372549, 1, 1,
0.2891938, -1.930229, 3.784079, 0, 0.1294118, 1, 1,
0.295188, -1.731929, 2.190415, 0, 0.1254902, 1, 1,
0.2954662, -0.2689575, 1.774072, 0, 0.1176471, 1, 1,
0.3011863, -0.4634628, 2.804222, 0, 0.1137255, 1, 1,
0.3101574, -2.141407, 1.479077, 0, 0.1058824, 1, 1,
0.3114595, 0.5920404, 0.671455, 0, 0.09803922, 1, 1,
0.315383, 0.7581159, -1.014478, 0, 0.09411765, 1, 1,
0.3163148, -0.8999917, 2.469154, 0, 0.08627451, 1, 1,
0.3225229, 1.645094, 1.350454, 0, 0.08235294, 1, 1,
0.3239552, 0.1019267, 1.214108, 0, 0.07450981, 1, 1,
0.3254929, 0.6117773, 0.903225, 0, 0.07058824, 1, 1,
0.3283358, 0.09860303, 0.4927024, 0, 0.0627451, 1, 1,
0.3284214, 0.06303574, 0.2150392, 0, 0.05882353, 1, 1,
0.3302257, -0.9992425, 2.983446, 0, 0.05098039, 1, 1,
0.3335598, 0.1010541, 1.651658, 0, 0.04705882, 1, 1,
0.3378994, -0.5841967, 2.14063, 0, 0.03921569, 1, 1,
0.3409678, -0.08494371, 4.494538, 0, 0.03529412, 1, 1,
0.3429333, -1.231066, 3.074892, 0, 0.02745098, 1, 1,
0.3432926, 0.5583409, 1.823743, 0, 0.02352941, 1, 1,
0.3437059, 1.167771, 0.6898202, 0, 0.01568628, 1, 1,
0.3478345, -1.914411, 2.726425, 0, 0.01176471, 1, 1,
0.3540164, -0.3765662, 3.119794, 0, 0.003921569, 1, 1,
0.3546041, -0.2113426, 1.298846, 0.003921569, 0, 1, 1,
0.3589888, 1.658615, 0.8463125, 0.007843138, 0, 1, 1,
0.363748, 0.4359779, 1.945112, 0.01568628, 0, 1, 1,
0.369055, -2.132787, 3.069916, 0.01960784, 0, 1, 1,
0.3702116, 0.4524481, 1.906327, 0.02745098, 0, 1, 1,
0.3756415, -1.629107, 4.585218, 0.03137255, 0, 1, 1,
0.3797005, -1.064839, 1.601258, 0.03921569, 0, 1, 1,
0.3799687, -0.5778832, 2.938825, 0.04313726, 0, 1, 1,
0.3805834, -1.382436, 1.221043, 0.05098039, 0, 1, 1,
0.3846094, -0.05439017, 2.891474, 0.05490196, 0, 1, 1,
0.386225, -1.153998, 1.018543, 0.0627451, 0, 1, 1,
0.3869916, -0.5374596, 2.921828, 0.06666667, 0, 1, 1,
0.3959051, -1.170906, 3.458022, 0.07450981, 0, 1, 1,
0.4043703, -1.866137, 3.595896, 0.07843138, 0, 1, 1,
0.4049822, 0.86351, 1.217391, 0.08627451, 0, 1, 1,
0.405789, -2.513031, 1.109015, 0.09019608, 0, 1, 1,
0.4059978, -0.4301857, 1.973114, 0.09803922, 0, 1, 1,
0.4064644, -0.1161761, 2.287269, 0.1058824, 0, 1, 1,
0.4073069, 0.5005433, -0.2179738, 0.1098039, 0, 1, 1,
0.4163947, 0.2760454, 1.664507, 0.1176471, 0, 1, 1,
0.4233013, -1.125097, 3.290046, 0.1215686, 0, 1, 1,
0.4238077, 1.407758, 1.578536, 0.1294118, 0, 1, 1,
0.4264932, -1.086398, 4.296102, 0.1333333, 0, 1, 1,
0.4348402, 0.5287915, -0.3216542, 0.1411765, 0, 1, 1,
0.4361587, -0.9107364, 1.304241, 0.145098, 0, 1, 1,
0.4381053, 1.728799, -0.3314453, 0.1529412, 0, 1, 1,
0.4398678, 1.251793, 1.241033, 0.1568628, 0, 1, 1,
0.4406092, 1.353734, -0.4868153, 0.1647059, 0, 1, 1,
0.4410126, 0.2649016, 0.8653381, 0.1686275, 0, 1, 1,
0.448915, 0.2917358, 1.918376, 0.1764706, 0, 1, 1,
0.4513, -0.3716789, 0.06297581, 0.1803922, 0, 1, 1,
0.4536378, 0.5669116, 0.7642943, 0.1882353, 0, 1, 1,
0.456008, 0.5238006, 0.4093429, 0.1921569, 0, 1, 1,
0.4578367, -0.3255461, 3.36063, 0.2, 0, 1, 1,
0.4601091, -1.361882, 3.708518, 0.2078431, 0, 1, 1,
0.4607953, 0.8673525, 0.9118916, 0.2117647, 0, 1, 1,
0.4616956, 2.190023, 1.432434, 0.2196078, 0, 1, 1,
0.4659184, 0.7181723, 2.73228, 0.2235294, 0, 1, 1,
0.4677666, -0.8501989, 2.770913, 0.2313726, 0, 1, 1,
0.4826484, 1.201282, 1.052832, 0.2352941, 0, 1, 1,
0.4830327, -1.220008, 3.250431, 0.2431373, 0, 1, 1,
0.489315, 1.517302, 0.1606913, 0.2470588, 0, 1, 1,
0.4910968, -0.1129694, 1.88124, 0.254902, 0, 1, 1,
0.5027414, 0.4489169, 1.880011, 0.2588235, 0, 1, 1,
0.5057035, 0.7143492, 3.331131, 0.2666667, 0, 1, 1,
0.5062994, 2.72429, -0.5950907, 0.2705882, 0, 1, 1,
0.5074149, -0.9357343, 2.668107, 0.2784314, 0, 1, 1,
0.5086863, -0.4919233, 3.258316, 0.282353, 0, 1, 1,
0.5144641, -0.9137161, 3.291612, 0.2901961, 0, 1, 1,
0.519353, -1.651432, 1.704711, 0.2941177, 0, 1, 1,
0.520889, 2.647718, 0.4859746, 0.3019608, 0, 1, 1,
0.5216076, -0.8432009, 3.964605, 0.3098039, 0, 1, 1,
0.5246764, -0.09135773, 2.570809, 0.3137255, 0, 1, 1,
0.526144, -0.8703768, 2.677875, 0.3215686, 0, 1, 1,
0.5267043, 2.364501, -0.2743061, 0.3254902, 0, 1, 1,
0.5284789, -1.386663, 2.354932, 0.3333333, 0, 1, 1,
0.5304552, -0.1472709, 2.461478, 0.3372549, 0, 1, 1,
0.5326371, 0.6078347, 2.188842, 0.345098, 0, 1, 1,
0.5378447, -2.299816, 4.632484, 0.3490196, 0, 1, 1,
0.5494404, -0.1823664, 0.8643048, 0.3568628, 0, 1, 1,
0.5543989, 0.1384021, 3.590959, 0.3607843, 0, 1, 1,
0.5547856, -0.004665847, 1.56315, 0.3686275, 0, 1, 1,
0.5553609, -0.007394955, 1.453003, 0.372549, 0, 1, 1,
0.5650981, 0.9135279, 1.236151, 0.3803922, 0, 1, 1,
0.571008, -0.6934746, 4.384305, 0.3843137, 0, 1, 1,
0.5732557, -0.2851995, 3.803682, 0.3921569, 0, 1, 1,
0.588217, -0.4295088, 2.653889, 0.3960784, 0, 1, 1,
0.5912301, 1.394056, 1.080397, 0.4039216, 0, 1, 1,
0.5914901, -2.20226, 3.284505, 0.4117647, 0, 1, 1,
0.5940194, 0.834978, 1.120686, 0.4156863, 0, 1, 1,
0.5943277, -0.2583126, 1.424679, 0.4235294, 0, 1, 1,
0.5975789, -0.8523651, 2.399725, 0.427451, 0, 1, 1,
0.5996718, -0.9675339, 2.010146, 0.4352941, 0, 1, 1,
0.6017765, 0.5640947, -0.3783853, 0.4392157, 0, 1, 1,
0.6048582, -0.3841931, 1.073965, 0.4470588, 0, 1, 1,
0.6089937, 1.134532, 0.8704686, 0.4509804, 0, 1, 1,
0.6125227, -1.041932, 4.159474, 0.4588235, 0, 1, 1,
0.6130091, 0.6237544, 0.2786687, 0.4627451, 0, 1, 1,
0.614137, -1.755474, 2.203014, 0.4705882, 0, 1, 1,
0.6154943, 0.9367254, 0.1611722, 0.4745098, 0, 1, 1,
0.6191956, 2.197214, -1.273145, 0.4823529, 0, 1, 1,
0.620844, -0.1760257, 0.6734591, 0.4862745, 0, 1, 1,
0.6256627, 0.4347697, 0.9098852, 0.4941176, 0, 1, 1,
0.6259553, 0.3913957, 1.115615, 0.5019608, 0, 1, 1,
0.6272891, 0.4570691, 0.5613871, 0.5058824, 0, 1, 1,
0.6330978, 0.6048223, 0.5573691, 0.5137255, 0, 1, 1,
0.6341263, 0.7607722, 1.376221, 0.5176471, 0, 1, 1,
0.6394495, -0.4396352, 1.948913, 0.5254902, 0, 1, 1,
0.6435087, -0.9835793, 3.451988, 0.5294118, 0, 1, 1,
0.6455207, -0.2390046, 2.220649, 0.5372549, 0, 1, 1,
0.6490372, 0.6155482, -1.317616, 0.5411765, 0, 1, 1,
0.6509985, -0.8627024, 2.922922, 0.5490196, 0, 1, 1,
0.6542733, 0.00630429, 2.215316, 0.5529412, 0, 1, 1,
0.6566884, -0.236238, 1.258024, 0.5607843, 0, 1, 1,
0.6609512, 0.5846723, 1.690128, 0.5647059, 0, 1, 1,
0.6618826, -0.03998662, 2.757679, 0.572549, 0, 1, 1,
0.6750336, 1.40449, 0.5419258, 0.5764706, 0, 1, 1,
0.6778064, 0.2178026, 1.401598, 0.5843138, 0, 1, 1,
0.6792852, -0.3440194, 1.974229, 0.5882353, 0, 1, 1,
0.7037368, -0.2494075, 1.831298, 0.5960785, 0, 1, 1,
0.7061004, -1.069457, 3.801277, 0.6039216, 0, 1, 1,
0.706811, -1.489004, 1.702846, 0.6078432, 0, 1, 1,
0.7106411, 0.04446921, 2.285343, 0.6156863, 0, 1, 1,
0.7158985, 0.5961451, -0.1863484, 0.6196079, 0, 1, 1,
0.7179992, 0.5008831, 0.4964256, 0.627451, 0, 1, 1,
0.7201045, -0.4105292, 0.09004797, 0.6313726, 0, 1, 1,
0.7241836, -2.408614, 2.270108, 0.6392157, 0, 1, 1,
0.7248242, 0.3490541, 0.8494316, 0.6431373, 0, 1, 1,
0.7278543, -0.357145, 2.305084, 0.6509804, 0, 1, 1,
0.7296154, -0.3575103, 2.552461, 0.654902, 0, 1, 1,
0.7421374, 0.7071785, 2.087402, 0.6627451, 0, 1, 1,
0.7444534, 0.7462808, 1.459702, 0.6666667, 0, 1, 1,
0.7464074, -1.123993, 2.076388, 0.6745098, 0, 1, 1,
0.7488222, 0.2052572, 1.203477, 0.6784314, 0, 1, 1,
0.7495072, 0.08928457, 1.490573, 0.6862745, 0, 1, 1,
0.7519994, 0.9433518, -0.09332226, 0.6901961, 0, 1, 1,
0.7541057, 0.2094037, -0.8718715, 0.6980392, 0, 1, 1,
0.761474, -0.7325218, 5.314772, 0.7058824, 0, 1, 1,
0.7651492, -0.431594, 2.272637, 0.7098039, 0, 1, 1,
0.7656727, -0.6176975, 2.889184, 0.7176471, 0, 1, 1,
0.7671122, 0.5847353, 0.5525765, 0.7215686, 0, 1, 1,
0.7675097, 0.02595521, 2.069495, 0.7294118, 0, 1, 1,
0.774364, -0.5779374, 1.104399, 0.7333333, 0, 1, 1,
0.777842, 0.2401798, 0.6165101, 0.7411765, 0, 1, 1,
0.7801868, -0.5233188, 0.2535183, 0.7450981, 0, 1, 1,
0.7886719, -0.3823889, 2.064664, 0.7529412, 0, 1, 1,
0.7894517, 0.6433723, 1.601886, 0.7568628, 0, 1, 1,
0.7986019, 0.02721699, 2.06559, 0.7647059, 0, 1, 1,
0.8004944, 0.09044713, 1.57155, 0.7686275, 0, 1, 1,
0.8034838, -0.711999, 3.276958, 0.7764706, 0, 1, 1,
0.8041158, -0.06302727, 0.8936853, 0.7803922, 0, 1, 1,
0.8110229, -0.6361917, 2.050068, 0.7882353, 0, 1, 1,
0.8121409, 1.615453, 1.642228, 0.7921569, 0, 1, 1,
0.8183749, -0.7320673, 1.27224, 0.8, 0, 1, 1,
0.8228849, 0.2400841, 1.11373, 0.8078431, 0, 1, 1,
0.8265066, -0.3032584, 3.181421, 0.8117647, 0, 1, 1,
0.8361238, -0.9894345, 3.078809, 0.8196079, 0, 1, 1,
0.8375073, -2.264516, 2.149745, 0.8235294, 0, 1, 1,
0.8380465, -2.267657, 3.989933, 0.8313726, 0, 1, 1,
0.8400926, 1.048728, 1.233228, 0.8352941, 0, 1, 1,
0.8446177, -0.9339424, 2.407137, 0.8431373, 0, 1, 1,
0.8485523, -0.02115695, 0.4971426, 0.8470588, 0, 1, 1,
0.849806, -3.276159, 5.242233, 0.854902, 0, 1, 1,
0.8499007, 0.223832, 0.2813314, 0.8588235, 0, 1, 1,
0.8544292, 1.01023, 0.06478634, 0.8666667, 0, 1, 1,
0.8546016, 0.4559705, 1.208495, 0.8705882, 0, 1, 1,
0.855083, -0.4681154, -0.3545772, 0.8784314, 0, 1, 1,
0.8595949, -0.4298469, 2.635069, 0.8823529, 0, 1, 1,
0.8661674, 0.1554154, 1.819356, 0.8901961, 0, 1, 1,
0.8720215, 1.695749, 0.2676372, 0.8941177, 0, 1, 1,
0.8747814, 0.6048541, 1.170463, 0.9019608, 0, 1, 1,
0.8771233, -0.3439437, -0.004315259, 0.9098039, 0, 1, 1,
0.8853213, 0.200807, 1.26045, 0.9137255, 0, 1, 1,
0.8902857, -0.3925179, 2.442286, 0.9215686, 0, 1, 1,
0.8914742, -2.179642, 2.219787, 0.9254902, 0, 1, 1,
0.9004562, -0.5657251, 1.310367, 0.9333333, 0, 1, 1,
0.9101431, -1.462907, 2.579128, 0.9372549, 0, 1, 1,
0.9151706, -0.01577405, 2.726128, 0.945098, 0, 1, 1,
0.9196693, -1.051965, 2.711216, 0.9490196, 0, 1, 1,
0.9211234, -0.1643617, 0.9070525, 0.9568627, 0, 1, 1,
0.9229699, -0.7117502, 3.268203, 0.9607843, 0, 1, 1,
0.9285225, 0.138083, 1.738508, 0.9686275, 0, 1, 1,
0.9294866, 0.8869928, 2.455836, 0.972549, 0, 1, 1,
0.930139, -0.4111076, 4.113982, 0.9803922, 0, 1, 1,
0.9302571, -0.1206606, 1.814754, 0.9843137, 0, 1, 1,
0.9342337, -0.225759, 0.9920967, 0.9921569, 0, 1, 1,
0.9356033, 1.002185, 1.487226, 0.9960784, 0, 1, 1,
0.9359587, -0.4878116, 3.319163, 1, 0, 0.9960784, 1,
0.9361235, -0.301098, 0.9385884, 1, 0, 0.9882353, 1,
0.9373521, -0.9173471, 2.544574, 1, 0, 0.9843137, 1,
0.9414058, -0.09327022, 1.80964, 1, 0, 0.9764706, 1,
0.9528347, 0.4429982, 1.404408, 1, 0, 0.972549, 1,
0.9574549, -0.04891745, 1.477962, 1, 0, 0.9647059, 1,
0.9677692, 0.7213556, 0.5565218, 1, 0, 0.9607843, 1,
0.9869442, 0.5844275, 0.9935473, 1, 0, 0.9529412, 1,
1.000864, 0.8145307, 0.3004, 1, 0, 0.9490196, 1,
1.003909, 0.910509, 1.14527, 1, 0, 0.9411765, 1,
1.004847, -1.396103, 0.7509874, 1, 0, 0.9372549, 1,
1.006847, -0.149476, 1.352741, 1, 0, 0.9294118, 1,
1.007303, 0.1140936, 1.691781, 1, 0, 0.9254902, 1,
1.016657, 0.08190191, 1.225709, 1, 0, 0.9176471, 1,
1.018343, 0.7833075, 0.9087957, 1, 0, 0.9137255, 1,
1.025089, 0.7691029, -0.07946376, 1, 0, 0.9058824, 1,
1.02888, 0.8322663, 1.146726, 1, 0, 0.9019608, 1,
1.029664, 0.4721706, 1.316927, 1, 0, 0.8941177, 1,
1.030765, -0.8621747, 1.632723, 1, 0, 0.8862745, 1,
1.036302, 0.02762416, 1.256534, 1, 0, 0.8823529, 1,
1.036656, 0.7011395, 1.590449, 1, 0, 0.8745098, 1,
1.037089, -1.867898, 2.152545, 1, 0, 0.8705882, 1,
1.037128, -1.066725, 2.480953, 1, 0, 0.8627451, 1,
1.037558, 0.73843, 1.89237, 1, 0, 0.8588235, 1,
1.0384, 0.9756127, 1.176976, 1, 0, 0.8509804, 1,
1.042474, 1.09645, 0.8131607, 1, 0, 0.8470588, 1,
1.045163, 0.4062361, 0.5157099, 1, 0, 0.8392157, 1,
1.046384, -0.4690063, 0.9384677, 1, 0, 0.8352941, 1,
1.047411, -0.3107625, 2.264397, 1, 0, 0.827451, 1,
1.051316, -0.01394887, -0.6068724, 1, 0, 0.8235294, 1,
1.066915, -0.2276179, 2.539936, 1, 0, 0.8156863, 1,
1.077684, 0.007837939, 2.011873, 1, 0, 0.8117647, 1,
1.082129, 0.4041372, 1.710111, 1, 0, 0.8039216, 1,
1.088598, 0.9558429, 1.031103, 1, 0, 0.7960784, 1,
1.097227, 0.1473024, 2.592618, 1, 0, 0.7921569, 1,
1.099657, 0.3750429, 1.026661, 1, 0, 0.7843137, 1,
1.111358, 1.597197, -0.4505066, 1, 0, 0.7803922, 1,
1.120028, -0.1443794, 2.073329, 1, 0, 0.772549, 1,
1.121696, -0.7205229, 1.876991, 1, 0, 0.7686275, 1,
1.123377, 0.2682296, 1.050322, 1, 0, 0.7607843, 1,
1.130045, 0.897364, 0.8717456, 1, 0, 0.7568628, 1,
1.16439, 0.5362282, 1.598427, 1, 0, 0.7490196, 1,
1.166324, -0.4887047, 0.04405676, 1, 0, 0.7450981, 1,
1.168937, -0.4462101, 0.762634, 1, 0, 0.7372549, 1,
1.171758, -0.8724767, 2.15225, 1, 0, 0.7333333, 1,
1.180013, 0.8999209, 2.621321, 1, 0, 0.7254902, 1,
1.19, 0.6148559, 1.094791, 1, 0, 0.7215686, 1,
1.191732, 0.01370428, 1.998992, 1, 0, 0.7137255, 1,
1.195808, -0.0008906274, 2.505438, 1, 0, 0.7098039, 1,
1.197405, 0.9855669, 1.023798, 1, 0, 0.7019608, 1,
1.201366, 1.203636, 1.265286, 1, 0, 0.6941177, 1,
1.207128, -0.5951054, 0.8850382, 1, 0, 0.6901961, 1,
1.209137, 0.77438, 0.5020712, 1, 0, 0.682353, 1,
1.210047, 0.2230057, 0.5069436, 1, 0, 0.6784314, 1,
1.233377, -0.1052571, 1.165374, 1, 0, 0.6705883, 1,
1.237541, -0.7832792, 1.874154, 1, 0, 0.6666667, 1,
1.248302, 0.3603558, 1.94162, 1, 0, 0.6588235, 1,
1.250484, -0.7181642, 5.540991, 1, 0, 0.654902, 1,
1.256432, -0.9858241, 1.844719, 1, 0, 0.6470588, 1,
1.257269, 0.5299527, 0.1274574, 1, 0, 0.6431373, 1,
1.267328, 1.432163, 1.860772, 1, 0, 0.6352941, 1,
1.272734, -0.2858559, 3.696354, 1, 0, 0.6313726, 1,
1.282204, -0.3521255, 1.160423, 1, 0, 0.6235294, 1,
1.284574, -0.08969068, 1.077123, 1, 0, 0.6196079, 1,
1.28677, 0.08363862, 0.6005356, 1, 0, 0.6117647, 1,
1.302817, -0.3557169, 3.117515, 1, 0, 0.6078432, 1,
1.303331, -0.2275452, 4.935883, 1, 0, 0.6, 1,
1.308623, -0.5360163, 3.433474, 1, 0, 0.5921569, 1,
1.310757, -1.191932, 3.860228, 1, 0, 0.5882353, 1,
1.318102, -0.9347015, 0.8785953, 1, 0, 0.5803922, 1,
1.319167, 0.7015421, 1.350029, 1, 0, 0.5764706, 1,
1.324034, 1.088173, 0.1694607, 1, 0, 0.5686275, 1,
1.326664, -0.2398716, 1.424638, 1, 0, 0.5647059, 1,
1.32847, 1.660898, -0.07179239, 1, 0, 0.5568628, 1,
1.344115, 0.6836644, -0.0770978, 1, 0, 0.5529412, 1,
1.349679, -1.070636, 0.5618922, 1, 0, 0.5450981, 1,
1.355487, 0.3900297, 1.870394, 1, 0, 0.5411765, 1,
1.355774, 1.491537, 1.920042, 1, 0, 0.5333334, 1,
1.357289, -0.02483153, 1.410953, 1, 0, 0.5294118, 1,
1.361951, 2.12306, 1.511543, 1, 0, 0.5215687, 1,
1.370692, 1.478577, -0.5208284, 1, 0, 0.5176471, 1,
1.372314, -0.5162868, 1.010585, 1, 0, 0.509804, 1,
1.38016, -0.7347947, 0.1628069, 1, 0, 0.5058824, 1,
1.387167, 1.72657, 0.5622892, 1, 0, 0.4980392, 1,
1.391528, -1.692277, 1.425696, 1, 0, 0.4901961, 1,
1.398998, 0.6963139, 0.08371721, 1, 0, 0.4862745, 1,
1.400804, 0.9821457, 1.609362, 1, 0, 0.4784314, 1,
1.413723, -0.1100098, 2.340505, 1, 0, 0.4745098, 1,
1.419157, 1.39405, 1.409583, 1, 0, 0.4666667, 1,
1.423496, -0.2893789, 0.8779246, 1, 0, 0.4627451, 1,
1.445081, 0.684741, 1.337934, 1, 0, 0.454902, 1,
1.448365, -1.160295, 0.6353875, 1, 0, 0.4509804, 1,
1.451601, 1.406901, 0.6573383, 1, 0, 0.4431373, 1,
1.460209, 0.7792538, -0.2285951, 1, 0, 0.4392157, 1,
1.472121, -1.762728, 5.330485, 1, 0, 0.4313726, 1,
1.474365, 0.7882782, 1.308537, 1, 0, 0.427451, 1,
1.475216, -0.02281242, 0.5945982, 1, 0, 0.4196078, 1,
1.486499, 1.107948, 0.0164719, 1, 0, 0.4156863, 1,
1.489116, -0.3908946, 3.112937, 1, 0, 0.4078431, 1,
1.496063, 0.3721336, -0.7501893, 1, 0, 0.4039216, 1,
1.496475, 0.1430082, 2.599705, 1, 0, 0.3960784, 1,
1.512935, -0.4990265, 1.305286, 1, 0, 0.3882353, 1,
1.519818, -2.165376, 4.453249, 1, 0, 0.3843137, 1,
1.527193, 0.6076283, -0.2653448, 1, 0, 0.3764706, 1,
1.539626, -1.495581, 1.021803, 1, 0, 0.372549, 1,
1.543443, 2.40462, 0.6211534, 1, 0, 0.3647059, 1,
1.543741, -1.064337, 4.798523, 1, 0, 0.3607843, 1,
1.564539, 1.223311, 1.469314, 1, 0, 0.3529412, 1,
1.569896, -1.733441, 1.045512, 1, 0, 0.3490196, 1,
1.584864, -3.249807, 2.532924, 1, 0, 0.3411765, 1,
1.588674, -0.1110743, 2.194719, 1, 0, 0.3372549, 1,
1.598842, -0.2171262, 1.446763, 1, 0, 0.3294118, 1,
1.612601, 0.7377955, 1.881617, 1, 0, 0.3254902, 1,
1.63265, 0.2147955, 1.354705, 1, 0, 0.3176471, 1,
1.636931, -0.005359641, 1.56944, 1, 0, 0.3137255, 1,
1.652342, 0.5548439, 2.733585, 1, 0, 0.3058824, 1,
1.661092, 0.05814909, 1.629699, 1, 0, 0.2980392, 1,
1.661775, -0.4010307, 0.2923776, 1, 0, 0.2941177, 1,
1.678179, -0.2187127, 0.9479119, 1, 0, 0.2862745, 1,
1.678883, 0.9430249, 1.28242, 1, 0, 0.282353, 1,
1.685833, -0.9780993, 1.762579, 1, 0, 0.2745098, 1,
1.707569, 0.6402405, 1.418808, 1, 0, 0.2705882, 1,
1.72117, 0.09142458, 1.954569, 1, 0, 0.2627451, 1,
1.743734, 0.5645448, 2.567291, 1, 0, 0.2588235, 1,
1.749372, -0.5573466, 1.459382, 1, 0, 0.2509804, 1,
1.768255, 2.515455, 1.926966, 1, 0, 0.2470588, 1,
1.817362, -2.086244, 2.233607, 1, 0, 0.2392157, 1,
1.844328, 1.718958, 0.5471875, 1, 0, 0.2352941, 1,
1.847873, 2.088389, 2.236063, 1, 0, 0.227451, 1,
1.870062, -1.082508, 2.169667, 1, 0, 0.2235294, 1,
1.906044, -0.2478311, 0.4597766, 1, 0, 0.2156863, 1,
1.955364, 0.07701604, 1.104308, 1, 0, 0.2117647, 1,
1.963878, -0.7678382, 0.1913377, 1, 0, 0.2039216, 1,
1.966627, -0.1610829, 0.8763259, 1, 0, 0.1960784, 1,
1.97507, 0.04841204, 2.116834, 1, 0, 0.1921569, 1,
1.98527, 0.124238, 2.173558, 1, 0, 0.1843137, 1,
1.989693, 0.2146958, 0.1513412, 1, 0, 0.1803922, 1,
1.9978, 0.6773433, 1.471988, 1, 0, 0.172549, 1,
1.997977, 0.6348352, 0.7289377, 1, 0, 0.1686275, 1,
2.000979, 0.6653373, 0.998068, 1, 0, 0.1607843, 1,
2.005783, 0.06279042, 0.3809897, 1, 0, 0.1568628, 1,
2.02918, -0.7102664, 1.696736, 1, 0, 0.1490196, 1,
2.110736, -0.6496427, 1.490887, 1, 0, 0.145098, 1,
2.122486, -2.014944, 1.857728, 1, 0, 0.1372549, 1,
2.140241, -1.062086, 2.157962, 1, 0, 0.1333333, 1,
2.161196, 0.9873087, 0.4675392, 1, 0, 0.1254902, 1,
2.168458, -0.4474183, 3.787515, 1, 0, 0.1215686, 1,
2.185381, -1.107508, 1.157104, 1, 0, 0.1137255, 1,
2.186669, -0.3506823, 1.820554, 1, 0, 0.1098039, 1,
2.187231, 0.4492632, 0.8466323, 1, 0, 0.1019608, 1,
2.217236, 1.367706, -0.5912381, 1, 0, 0.09411765, 1,
2.228492, 1.759373, 3.52368, 1, 0, 0.09019608, 1,
2.275373, -2.3585, 1.762891, 1, 0, 0.08235294, 1,
2.311237, 0.0175196, 1.888283, 1, 0, 0.07843138, 1,
2.321285, -0.2977913, 0.9884626, 1, 0, 0.07058824, 1,
2.343679, 1.278421, 1.615512, 1, 0, 0.06666667, 1,
2.348714, 1.050076, 0.7980499, 1, 0, 0.05882353, 1,
2.417006, -0.929085, 3.187762, 1, 0, 0.05490196, 1,
2.450173, -0.6921383, 0.9614992, 1, 0, 0.04705882, 1,
2.575424, -1.430308, 3.118014, 1, 0, 0.04313726, 1,
2.653267, 0.8061463, -1.102761, 1, 0, 0.03529412, 1,
2.712505, -0.1899842, 1.945916, 1, 0, 0.03137255, 1,
2.739939, 0.5268996, 1.158922, 1, 0, 0.02352941, 1,
2.755931, -0.4925166, 2.64053, 1, 0, 0.01960784, 1,
3.082931, 1.222688, 0.9896409, 1, 0, 0.01176471, 1,
3.27176, 2.225435, 0.853501, 1, 0, 0.007843138, 1
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
-0.2396348, -4.391385, -6.940261, 0, -0.5, 0.5, 0.5,
-0.2396348, -4.391385, -6.940261, 1, -0.5, 0.5, 0.5,
-0.2396348, -4.391385, -6.940261, 1, 1.5, 0.5, 0.5,
-0.2396348, -4.391385, -6.940261, 0, 1.5, 0.5, 0.5
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
-4.941392, -0.1645863, -6.940261, 0, -0.5, 0.5, 0.5,
-4.941392, -0.1645863, -6.940261, 1, -0.5, 0.5, 0.5,
-4.941392, -0.1645863, -6.940261, 1, 1.5, 0.5, 0.5,
-4.941392, -0.1645863, -6.940261, 0, 1.5, 0.5, 0.5
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
-4.941392, -4.391385, 0.2048423, 0, -0.5, 0.5, 0.5,
-4.941392, -4.391385, 0.2048423, 1, -0.5, 0.5, 0.5,
-4.941392, -4.391385, 0.2048423, 1, 1.5, 0.5, 0.5,
-4.941392, -4.391385, 0.2048423, 0, 1.5, 0.5, 0.5
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
-2, -3.41597, -5.291391,
2, -3.41597, -5.291391,
-2, -3.41597, -5.291391,
-2, -3.578539, -5.566203,
0, -3.41597, -5.291391,
0, -3.578539, -5.566203,
2, -3.41597, -5.291391,
2, -3.578539, -5.566203
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
-2, -3.903677, -6.115826, 0, -0.5, 0.5, 0.5,
-2, -3.903677, -6.115826, 1, -0.5, 0.5, 0.5,
-2, -3.903677, -6.115826, 1, 1.5, 0.5, 0.5,
-2, -3.903677, -6.115826, 0, 1.5, 0.5, 0.5,
0, -3.903677, -6.115826, 0, -0.5, 0.5, 0.5,
0, -3.903677, -6.115826, 1, -0.5, 0.5, 0.5,
0, -3.903677, -6.115826, 1, 1.5, 0.5, 0.5,
0, -3.903677, -6.115826, 0, 1.5, 0.5, 0.5,
2, -3.903677, -6.115826, 0, -0.5, 0.5, 0.5,
2, -3.903677, -6.115826, 1, -0.5, 0.5, 0.5,
2, -3.903677, -6.115826, 1, 1.5, 0.5, 0.5,
2, -3.903677, -6.115826, 0, 1.5, 0.5, 0.5
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
-3.856371, -3, -5.291391,
-3.856371, 2, -5.291391,
-3.856371, -3, -5.291391,
-4.037208, -3, -5.566203,
-3.856371, -2, -5.291391,
-4.037208, -2, -5.566203,
-3.856371, -1, -5.291391,
-4.037208, -1, -5.566203,
-3.856371, 0, -5.291391,
-4.037208, 0, -5.566203,
-3.856371, 1, -5.291391,
-4.037208, 1, -5.566203,
-3.856371, 2, -5.291391,
-4.037208, 2, -5.566203
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
-4.398882, -3, -6.115826, 0, -0.5, 0.5, 0.5,
-4.398882, -3, -6.115826, 1, -0.5, 0.5, 0.5,
-4.398882, -3, -6.115826, 1, 1.5, 0.5, 0.5,
-4.398882, -3, -6.115826, 0, 1.5, 0.5, 0.5,
-4.398882, -2, -6.115826, 0, -0.5, 0.5, 0.5,
-4.398882, -2, -6.115826, 1, -0.5, 0.5, 0.5,
-4.398882, -2, -6.115826, 1, 1.5, 0.5, 0.5,
-4.398882, -2, -6.115826, 0, 1.5, 0.5, 0.5,
-4.398882, -1, -6.115826, 0, -0.5, 0.5, 0.5,
-4.398882, -1, -6.115826, 1, -0.5, 0.5, 0.5,
-4.398882, -1, -6.115826, 1, 1.5, 0.5, 0.5,
-4.398882, -1, -6.115826, 0, 1.5, 0.5, 0.5,
-4.398882, 0, -6.115826, 0, -0.5, 0.5, 0.5,
-4.398882, 0, -6.115826, 1, -0.5, 0.5, 0.5,
-4.398882, 0, -6.115826, 1, 1.5, 0.5, 0.5,
-4.398882, 0, -6.115826, 0, 1.5, 0.5, 0.5,
-4.398882, 1, -6.115826, 0, -0.5, 0.5, 0.5,
-4.398882, 1, -6.115826, 1, -0.5, 0.5, 0.5,
-4.398882, 1, -6.115826, 1, 1.5, 0.5, 0.5,
-4.398882, 1, -6.115826, 0, 1.5, 0.5, 0.5,
-4.398882, 2, -6.115826, 0, -0.5, 0.5, 0.5,
-4.398882, 2, -6.115826, 1, -0.5, 0.5, 0.5,
-4.398882, 2, -6.115826, 1, 1.5, 0.5, 0.5,
-4.398882, 2, -6.115826, 0, 1.5, 0.5, 0.5
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
-3.856371, -3.41597, -4,
-3.856371, -3.41597, 4,
-3.856371, -3.41597, -4,
-4.037208, -3.578539, -4,
-3.856371, -3.41597, -2,
-4.037208, -3.578539, -2,
-3.856371, -3.41597, 0,
-4.037208, -3.578539, 0,
-3.856371, -3.41597, 2,
-4.037208, -3.578539, 2,
-3.856371, -3.41597, 4,
-4.037208, -3.578539, 4
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
-4.398882, -3.903677, -4, 0, -0.5, 0.5, 0.5,
-4.398882, -3.903677, -4, 1, -0.5, 0.5, 0.5,
-4.398882, -3.903677, -4, 1, 1.5, 0.5, 0.5,
-4.398882, -3.903677, -4, 0, 1.5, 0.5, 0.5,
-4.398882, -3.903677, -2, 0, -0.5, 0.5, 0.5,
-4.398882, -3.903677, -2, 1, -0.5, 0.5, 0.5,
-4.398882, -3.903677, -2, 1, 1.5, 0.5, 0.5,
-4.398882, -3.903677, -2, 0, 1.5, 0.5, 0.5,
-4.398882, -3.903677, 0, 0, -0.5, 0.5, 0.5,
-4.398882, -3.903677, 0, 1, -0.5, 0.5, 0.5,
-4.398882, -3.903677, 0, 1, 1.5, 0.5, 0.5,
-4.398882, -3.903677, 0, 0, 1.5, 0.5, 0.5,
-4.398882, -3.903677, 2, 0, -0.5, 0.5, 0.5,
-4.398882, -3.903677, 2, 1, -0.5, 0.5, 0.5,
-4.398882, -3.903677, 2, 1, 1.5, 0.5, 0.5,
-4.398882, -3.903677, 2, 0, 1.5, 0.5, 0.5,
-4.398882, -3.903677, 4, 0, -0.5, 0.5, 0.5,
-4.398882, -3.903677, 4, 1, -0.5, 0.5, 0.5,
-4.398882, -3.903677, 4, 1, 1.5, 0.5, 0.5,
-4.398882, -3.903677, 4, 0, 1.5, 0.5, 0.5
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
-3.856371, -3.41597, -5.291391,
-3.856371, 3.086797, -5.291391,
-3.856371, -3.41597, 5.701076,
-3.856371, 3.086797, 5.701076,
-3.856371, -3.41597, -5.291391,
-3.856371, -3.41597, 5.701076,
-3.856371, 3.086797, -5.291391,
-3.856371, 3.086797, 5.701076,
-3.856371, -3.41597, -5.291391,
3.377102, -3.41597, -5.291391,
-3.856371, -3.41597, 5.701076,
3.377102, -3.41597, 5.701076,
-3.856371, 3.086797, -5.291391,
3.377102, 3.086797, -5.291391,
-3.856371, 3.086797, 5.701076,
3.377102, 3.086797, 5.701076,
3.377102, -3.41597, -5.291391,
3.377102, 3.086797, -5.291391,
3.377102, -3.41597, 5.701076,
3.377102, 3.086797, 5.701076,
3.377102, -3.41597, -5.291391,
3.377102, -3.41597, 5.701076,
3.377102, 3.086797, -5.291391,
3.377102, 3.086797, 5.701076
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
var radius = 7.837763;
var distance = 34.87109;
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
mvMatrix.translate( 0.2396348, 0.1645863, -0.2048423 );
mvMatrix.scale( 1.171546, 1.30319, 0.7709227 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.87109);
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
ethyl_pyrophosphate<-read.table("ethyl_pyrophosphate.xyz")
```

```
## Error in read.table("ethyl_pyrophosphate.xyz"): no lines available in input
```

```r
x<-ethyl_pyrophosphate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_pyrophosphate' not found
```

```r
y<-ethyl_pyrophosphate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_pyrophosphate' not found
```

```r
z<-ethyl_pyrophosphate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_pyrophosphate' not found
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
-3.751029, 0.2965304, -2.067946, 0, 0, 1, 1, 1,
-3.325239, -1.065302, -1.51822, 1, 0, 0, 1, 1,
-2.98319, 0.8814641, -1.389758, 1, 0, 0, 1, 1,
-2.964129, 1.251024, -1.019552, 1, 0, 0, 1, 1,
-2.794585, -0.8576658, -3.226172, 1, 0, 0, 1, 1,
-2.776659, -0.7610044, -0.5460017, 1, 0, 0, 1, 1,
-2.76902, -0.7706273, -3.057996, 0, 0, 0, 1, 1,
-2.733353, -1.58773, -2.135231, 0, 0, 0, 1, 1,
-2.716459, 2.083616, 0.5948644, 0, 0, 0, 1, 1,
-2.681014, 0.4481492, -2.342461, 0, 0, 0, 1, 1,
-2.560788, 0.3819677, -1.223838, 0, 0, 0, 1, 1,
-2.542016, 1.091672, -1.272834, 0, 0, 0, 1, 1,
-2.476457, -0.8196956, -1.820073, 0, 0, 0, 1, 1,
-2.458406, 0.6050844, -0.8995469, 1, 1, 1, 1, 1,
-2.423846, -0.6800205, -2.642468, 1, 1, 1, 1, 1,
-2.407915, 1.045936, -0.3048563, 1, 1, 1, 1, 1,
-2.38051, -0.3368446, -1.519265, 1, 1, 1, 1, 1,
-2.365508, -0.4884501, -1.963133, 1, 1, 1, 1, 1,
-2.249954, -1.248375, -3.552454, 1, 1, 1, 1, 1,
-2.180895, 0.4532211, -0.9338859, 1, 1, 1, 1, 1,
-2.135544, 1.187565, 0.07699207, 1, 1, 1, 1, 1,
-2.13291, -0.9326447, -3.521078, 1, 1, 1, 1, 1,
-2.124418, -0.7074022, -2.646964, 1, 1, 1, 1, 1,
-2.122293, -1.491951, -2.573062, 1, 1, 1, 1, 1,
-2.086142, 0.6488062, 0.09919047, 1, 1, 1, 1, 1,
-2.074883, -1.045297, -2.201744, 1, 1, 1, 1, 1,
-2.036694, -0.06193854, -1.60235, 1, 1, 1, 1, 1,
-2.030061, 1.776817, 0.5882037, 1, 1, 1, 1, 1,
-2.024279, -0.8988417, -1.525702, 0, 0, 1, 1, 1,
-2.014216, 0.6514016, -0.6862253, 1, 0, 0, 1, 1,
-2.009135, 0.8306395, -1.342452, 1, 0, 0, 1, 1,
-2.00491, 1.330531, -0.6912458, 1, 0, 0, 1, 1,
-2.002774, -1.657065, -1.17868, 1, 0, 0, 1, 1,
-1.96349, 0.6271791, -2.851836, 1, 0, 0, 1, 1,
-1.939081, 0.01824933, -1.938114, 0, 0, 0, 1, 1,
-1.937662, -1.233685, -1.284291, 0, 0, 0, 1, 1,
-1.913937, -0.7911279, -2.463664, 0, 0, 0, 1, 1,
-1.902721, -0.1936296, -2.283439, 0, 0, 0, 1, 1,
-1.871719, -1.089263, -2.431802, 0, 0, 0, 1, 1,
-1.862836, -1.179742, -2.117613, 0, 0, 0, 1, 1,
-1.854415, -0.3988914, -1.196404, 0, 0, 0, 1, 1,
-1.839207, 0.9037003, -0.4371053, 1, 1, 1, 1, 1,
-1.832713, 0.06009961, -1.376975, 1, 1, 1, 1, 1,
-1.814201, 1.097178, 0.08978081, 1, 1, 1, 1, 1,
-1.808403, -1.262741, -2.008759, 1, 1, 1, 1, 1,
-1.799718, 1.032175, -1.078361, 1, 1, 1, 1, 1,
-1.778847, -1.792514, -1.843513, 1, 1, 1, 1, 1,
-1.773047, -0.7909319, -1.906022, 1, 1, 1, 1, 1,
-1.752069, 1.737546, -1.09368, 1, 1, 1, 1, 1,
-1.751143, -0.2074369, -1.933223, 1, 1, 1, 1, 1,
-1.740768, 1.474938, -0.8126996, 1, 1, 1, 1, 1,
-1.712558, 0.605764, -0.3431129, 1, 1, 1, 1, 1,
-1.703889, -0.4054937, -2.468675, 1, 1, 1, 1, 1,
-1.697628, -0.465147, -2.938436, 1, 1, 1, 1, 1,
-1.673236, -0.05132177, -2.341398, 1, 1, 1, 1, 1,
-1.669511, 0.9945275, -0.4535584, 1, 1, 1, 1, 1,
-1.663357, -1.286738, -2.018854, 0, 0, 1, 1, 1,
-1.659781, -0.3556399, -3.005811, 1, 0, 0, 1, 1,
-1.657235, -2.056343, -2.706077, 1, 0, 0, 1, 1,
-1.650804, -0.6295283, -2.550756, 1, 0, 0, 1, 1,
-1.641088, 0.7561418, -2.290995, 1, 0, 0, 1, 1,
-1.637194, -0.3767227, -1.869555, 1, 0, 0, 1, 1,
-1.626946, 1.085196, 0.5177212, 0, 0, 0, 1, 1,
-1.624667, -0.7585026, -2.025679, 0, 0, 0, 1, 1,
-1.614405, -1.271137, -2.543885, 0, 0, 0, 1, 1,
-1.56841, 0.6942629, -2.489829, 0, 0, 0, 1, 1,
-1.560525, 0.6488881, -0.9269787, 0, 0, 0, 1, 1,
-1.550866, -0.5574608, -0.119838, 0, 0, 0, 1, 1,
-1.547003, 0.620591, -1.363431, 0, 0, 0, 1, 1,
-1.54325, -1.991417, -1.484398, 1, 1, 1, 1, 1,
-1.543187, 0.611735, -1.829991, 1, 1, 1, 1, 1,
-1.54091, -0.1169987, -0.7837005, 1, 1, 1, 1, 1,
-1.537107, 1.773995, 0.2508275, 1, 1, 1, 1, 1,
-1.523266, 0.31822, -2.147952, 1, 1, 1, 1, 1,
-1.517044, -1.2816, -2.249888, 1, 1, 1, 1, 1,
-1.516919, -0.6551111, -2.261012, 1, 1, 1, 1, 1,
-1.510145, 2.092953, -1.460694, 1, 1, 1, 1, 1,
-1.503458, 1.025501, -1.663628, 1, 1, 1, 1, 1,
-1.500431, -0.3255147, -1.114863, 1, 1, 1, 1, 1,
-1.497786, 0.02443924, 1.611274, 1, 1, 1, 1, 1,
-1.485166, 0.621052, -0.05114667, 1, 1, 1, 1, 1,
-1.48322, -0.9059718, -2.182489, 1, 1, 1, 1, 1,
-1.482509, -0.5026177, -2.682833, 1, 1, 1, 1, 1,
-1.471375, 0.3091293, -1.109378, 1, 1, 1, 1, 1,
-1.469326, -0.8683422, -1.053964, 0, 0, 1, 1, 1,
-1.467474, 0.5273054, -0.7692904, 1, 0, 0, 1, 1,
-1.456462, 0.2749555, -1.5232, 1, 0, 0, 1, 1,
-1.445198, 0.160494, -1.72911, 1, 0, 0, 1, 1,
-1.444232, -0.2885638, -1.990094, 1, 0, 0, 1, 1,
-1.437137, 0.2636216, -1.512519, 1, 0, 0, 1, 1,
-1.432352, 0.3441485, -2.163841, 0, 0, 0, 1, 1,
-1.415635, -1.2426, -2.381832, 0, 0, 0, 1, 1,
-1.411133, -0.5792645, -1.404613, 0, 0, 0, 1, 1,
-1.40856, 0.7612597, -1.326028, 0, 0, 0, 1, 1,
-1.407243, -2.557444, -1.451656, 0, 0, 0, 1, 1,
-1.399094, 0.4313563, -0.7333719, 0, 0, 0, 1, 1,
-1.396079, 0.9320268, -0.6837311, 0, 0, 0, 1, 1,
-1.390375, -0.3893593, -1.879995, 1, 1, 1, 1, 1,
-1.345516, -0.5363572, -2.599317, 1, 1, 1, 1, 1,
-1.337827, 1.071235, -1.696891, 1, 1, 1, 1, 1,
-1.310485, -0.2969449, -1.745322, 1, 1, 1, 1, 1,
-1.308656, 0.8242677, -0.4891344, 1, 1, 1, 1, 1,
-1.300945, -0.8534806, -1.631361, 1, 1, 1, 1, 1,
-1.289744, 0.9697436, -0.4902779, 1, 1, 1, 1, 1,
-1.287519, -1.983316, -2.309443, 1, 1, 1, 1, 1,
-1.28588, 1.988938, -1.419928, 1, 1, 1, 1, 1,
-1.280817, -0.585309, -0.1973745, 1, 1, 1, 1, 1,
-1.279991, 1.111255, -0.4572922, 1, 1, 1, 1, 1,
-1.279025, -0.1374061, -0.008180344, 1, 1, 1, 1, 1,
-1.276957, -0.5256505, -1.997126, 1, 1, 1, 1, 1,
-1.274461, -1.578414, -2.9963, 1, 1, 1, 1, 1,
-1.269888, 0.6177875, -1.757231, 1, 1, 1, 1, 1,
-1.269426, -0.2637838, -1.107172, 0, 0, 1, 1, 1,
-1.2694, 0.6008081, 0.0647176, 1, 0, 0, 1, 1,
-1.256621, 0.4146188, -0.4916388, 1, 0, 0, 1, 1,
-1.255495, 0.485252, -3.243865, 1, 0, 0, 1, 1,
-1.232306, 1.583734, -2.632238, 1, 0, 0, 1, 1,
-1.21932, -0.5011449, -3.06552, 1, 0, 0, 1, 1,
-1.21767, 0.7078297, -2.293769, 0, 0, 0, 1, 1,
-1.215868, 0.8189734, -0.8917896, 0, 0, 0, 1, 1,
-1.20818, 1.666128, 0.7103006, 0, 0, 0, 1, 1,
-1.205884, 0.04094609, -2.706301, 0, 0, 0, 1, 1,
-1.205384, 0.5521141, -0.5353461, 0, 0, 0, 1, 1,
-1.19724, 0.2481437, -2.157798, 0, 0, 0, 1, 1,
-1.190294, 0.1497117, -0.09578921, 0, 0, 0, 1, 1,
-1.185228, 1.267585, 0.7182319, 1, 1, 1, 1, 1,
-1.183982, 1.416536, -1.298489, 1, 1, 1, 1, 1,
-1.180978, 0.0978817, -1.321789, 1, 1, 1, 1, 1,
-1.180642, -0.6969667, -4.501796, 1, 1, 1, 1, 1,
-1.164754, -0.5204711, -1.99937, 1, 1, 1, 1, 1,
-1.163731, -0.8310004, -2.813555, 1, 1, 1, 1, 1,
-1.162436, -1.836606, -3.934926, 1, 1, 1, 1, 1,
-1.162035, 0.3497841, -1.056048, 1, 1, 1, 1, 1,
-1.161492, 2.186013, -0.5769531, 1, 1, 1, 1, 1,
-1.158377, -1.067216, -1.898641, 1, 1, 1, 1, 1,
-1.158241, -0.7148655, -1.279408, 1, 1, 1, 1, 1,
-1.151951, 0.8277777, 0.5256969, 1, 1, 1, 1, 1,
-1.151691, 0.4586333, 1.086967, 1, 1, 1, 1, 1,
-1.146462, 0.294163, -1.780057, 1, 1, 1, 1, 1,
-1.138916, 0.6984883, -0.5029734, 1, 1, 1, 1, 1,
-1.137274, 0.3072729, -1.002305, 0, 0, 1, 1, 1,
-1.133238, 1.417912, -0.9460021, 1, 0, 0, 1, 1,
-1.13236, -0.7171302, -0.9193569, 1, 0, 0, 1, 1,
-1.126902, -1.549241, -2.994733, 1, 0, 0, 1, 1,
-1.12665, 1.130021, -0.2269046, 1, 0, 0, 1, 1,
-1.12005, 1.556177, -1.381969, 1, 0, 0, 1, 1,
-1.113558, -0.6807359, -0.1718975, 0, 0, 0, 1, 1,
-1.108329, -0.3499075, -0.1134503, 0, 0, 0, 1, 1,
-1.107314, -1.510177, -3.315768, 0, 0, 0, 1, 1,
-1.105242, 1.669948, -1.843709, 0, 0, 0, 1, 1,
-1.101438, -0.6207482, -2.867398, 0, 0, 0, 1, 1,
-1.099075, -1.310024, -1.362487, 0, 0, 0, 1, 1,
-1.079737, -1.778569, -3.061524, 0, 0, 0, 1, 1,
-1.065273, 2.579849, -2.976613, 1, 1, 1, 1, 1,
-1.061514, 1.029536, -1.450183, 1, 1, 1, 1, 1,
-1.060479, 0.4259421, -2.837524, 1, 1, 1, 1, 1,
-1.060428, -3.10055, -2.932932, 1, 1, 1, 1, 1,
-1.056569, 0.1330608, -0.2005558, 1, 1, 1, 1, 1,
-1.056389, -0.5361604, -1.220389, 1, 1, 1, 1, 1,
-1.053365, -1.698725, -1.736958, 1, 1, 1, 1, 1,
-1.053002, -1.629856, -2.702623, 1, 1, 1, 1, 1,
-1.052751, 1.046466, 0.2135278, 1, 1, 1, 1, 1,
-1.048424, -0.3996791, -2.794918, 1, 1, 1, 1, 1,
-1.045027, -0.4990629, -2.13442, 1, 1, 1, 1, 1,
-1.040227, 0.08459146, -0.1630406, 1, 1, 1, 1, 1,
-1.039614, -0.3428602, -1.157977, 1, 1, 1, 1, 1,
-1.034512, -0.7011292, -2.872601, 1, 1, 1, 1, 1,
-1.030422, 0.957826, 0.626967, 1, 1, 1, 1, 1,
-1.026449, 0.1702305, -1.836538, 0, 0, 1, 1, 1,
-1.026248, 0.6651346, -1.412794, 1, 0, 0, 1, 1,
-1.025538, -0.5036253, -3.685825, 1, 0, 0, 1, 1,
-1.022924, 0.6371323, -1.570408, 1, 0, 0, 1, 1,
-1.015039, -2.095597, -3.77561, 1, 0, 0, 1, 1,
-1.010926, 0.397472, -1.192504, 1, 0, 0, 1, 1,
-1.010237, 0.8582522, -2.31848, 0, 0, 0, 1, 1,
-1.009359, -1.94666, 0.4560367, 0, 0, 0, 1, 1,
-1.007111, -0.2445712, -2.999536, 0, 0, 0, 1, 1,
-0.9950841, 0.8503208, -1.333806, 0, 0, 0, 1, 1,
-0.9893878, -0.7627935, -2.094579, 0, 0, 0, 1, 1,
-0.9891869, 0.863885, -1.788082, 0, 0, 0, 1, 1,
-0.9872679, -1.707595, -2.471592, 0, 0, 0, 1, 1,
-0.9867923, -0.1459053, -1.344674, 1, 1, 1, 1, 1,
-0.9823758, 0.8874102, 0.2274425, 1, 1, 1, 1, 1,
-0.980979, 1.819246, -0.8687201, 1, 1, 1, 1, 1,
-0.9803122, -1.600912, -2.549905, 1, 1, 1, 1, 1,
-0.9802163, 0.1337878, -1.547251, 1, 1, 1, 1, 1,
-0.979352, -0.595804, -2.661037, 1, 1, 1, 1, 1,
-0.9762347, 2.517753, 0.05582125, 1, 1, 1, 1, 1,
-0.9753463, 0.7029101, -1.186266, 1, 1, 1, 1, 1,
-0.9716327, -2.203495, -2.36688, 1, 1, 1, 1, 1,
-0.9688436, -0.1536339, -4.090138, 1, 1, 1, 1, 1,
-0.9667367, 0.2492786, 0.4366244, 1, 1, 1, 1, 1,
-0.955782, 1.04246, -0.9870642, 1, 1, 1, 1, 1,
-0.9539516, 0.2238212, -2.834206, 1, 1, 1, 1, 1,
-0.9506084, 1.573263, -1.776252, 1, 1, 1, 1, 1,
-0.9495243, -1.425076, -0.3940834, 1, 1, 1, 1, 1,
-0.9443092, -1.859621, -3.053203, 0, 0, 1, 1, 1,
-0.9439335, 0.1440842, -1.435592, 1, 0, 0, 1, 1,
-0.9404718, -0.9701397, -3.987387, 1, 0, 0, 1, 1,
-0.9382878, -2.072512, -4.206263, 1, 0, 0, 1, 1,
-0.9377323, -1.200123, -3.304741, 1, 0, 0, 1, 1,
-0.9376026, 1.470864, -1.810341, 1, 0, 0, 1, 1,
-0.9361738, 0.02200849, -1.483578, 0, 0, 0, 1, 1,
-0.933478, -0.4133274, -0.9674973, 0, 0, 0, 1, 1,
-0.9247956, 1.176106, -2.181118, 0, 0, 0, 1, 1,
-0.9242882, 0.8696815, -0.3808209, 0, 0, 0, 1, 1,
-0.9195832, 1.215091, -2.713423, 0, 0, 0, 1, 1,
-0.9183717, 0.4496791, -1.895655, 0, 0, 0, 1, 1,
-0.9087948, 0.9339973, 0.1498386, 0, 0, 0, 1, 1,
-0.9055718, 0.5357054, 0.1084673, 1, 1, 1, 1, 1,
-0.9042799, -1.98559, -3.39513, 1, 1, 1, 1, 1,
-0.899652, -0.5448242, -2.192207, 1, 1, 1, 1, 1,
-0.8991644, 0.4707284, -1.465173, 1, 1, 1, 1, 1,
-0.8965248, -2.960241, -2.991352, 1, 1, 1, 1, 1,
-0.8944999, 1.043951, -1.087662, 1, 1, 1, 1, 1,
-0.891152, 0.135256, -1.339601, 1, 1, 1, 1, 1,
-0.8879877, -0.7701872, -1.831428, 1, 1, 1, 1, 1,
-0.8874717, 0.5379604, -0.6113196, 1, 1, 1, 1, 1,
-0.8874204, -0.7105764, -2.752988, 1, 1, 1, 1, 1,
-0.8829271, 0.3733306, -0.7409485, 1, 1, 1, 1, 1,
-0.8812835, -1.238653, -1.744402, 1, 1, 1, 1, 1,
-0.8780835, 0.7442315, -0.5064968, 1, 1, 1, 1, 1,
-0.877056, -0.3810822, 0.04225802, 1, 1, 1, 1, 1,
-0.8747693, -0.8373179, -2.491526, 1, 1, 1, 1, 1,
-0.8714921, 1.631676, -0.7036365, 0, 0, 1, 1, 1,
-0.8696266, -0.6243368, -1.693437, 1, 0, 0, 1, 1,
-0.8684805, 0.3648204, 0.8875552, 1, 0, 0, 1, 1,
-0.8666567, 0.04867081, -0.8520189, 1, 0, 0, 1, 1,
-0.8634817, -0.5825094, -3.392253, 1, 0, 0, 1, 1,
-0.8621763, -0.6304092, -2.898157, 1, 0, 0, 1, 1,
-0.8621237, 0.05321539, -2.559409, 0, 0, 0, 1, 1,
-0.8609153, -1.304079, -1.175059, 0, 0, 0, 1, 1,
-0.8527766, 0.7254883, -2.91683, 0, 0, 0, 1, 1,
-0.8443176, 1.617977, 1.028217, 0, 0, 0, 1, 1,
-0.8413078, -1.168302, -2.549537, 0, 0, 0, 1, 1,
-0.8366625, 1.214403, -3.359416, 0, 0, 0, 1, 1,
-0.8344303, 2.349188, -0.7276857, 0, 0, 0, 1, 1,
-0.8335114, -1.181546, -3.311398, 1, 1, 1, 1, 1,
-0.8203073, -0.0009961504, -3.580824, 1, 1, 1, 1, 1,
-0.8110952, 0.1860778, -1.833176, 1, 1, 1, 1, 1,
-0.8090319, -0.5151372, 0.3708562, 1, 1, 1, 1, 1,
-0.8085259, 0.1378411, -1.633203, 1, 1, 1, 1, 1,
-0.799723, 0.01439075, -1.391274, 1, 1, 1, 1, 1,
-0.7932068, -0.08202732, -3.155257, 1, 1, 1, 1, 1,
-0.7931431, -0.3921371, -5.131307, 1, 1, 1, 1, 1,
-0.7927851, -0.8844085, -3.59675, 1, 1, 1, 1, 1,
-0.7859997, 1.657876, -0.4505511, 1, 1, 1, 1, 1,
-0.7848041, -1.202066, -3.067726, 1, 1, 1, 1, 1,
-0.7799745, 0.4570464, -2.290222, 1, 1, 1, 1, 1,
-0.7782434, -0.867748, -2.939697, 1, 1, 1, 1, 1,
-0.7769607, -0.9126009, -2.86465, 1, 1, 1, 1, 1,
-0.7764326, 1.108918, -1.407998, 1, 1, 1, 1, 1,
-0.7726056, 0.346089, -0.1164746, 0, 0, 1, 1, 1,
-0.7675555, 0.7804847, -1.441586, 1, 0, 0, 1, 1,
-0.7674416, 1.072692, -0.6110625, 1, 0, 0, 1, 1,
-0.7646906, 1.413995, -0.3298895, 1, 0, 0, 1, 1,
-0.7643387, 0.9767317, 0.4809307, 1, 0, 0, 1, 1,
-0.7633573, 0.03773656, -0.7904635, 1, 0, 0, 1, 1,
-0.7628341, 0.5031433, -2.588236, 0, 0, 0, 1, 1,
-0.7602049, 0.01657455, -2.326325, 0, 0, 0, 1, 1,
-0.7583063, -1.374303, -2.884321, 0, 0, 0, 1, 1,
-0.7315058, 0.6608425, -2.155603, 0, 0, 0, 1, 1,
-0.7224489, 2.992097, 1.010338, 0, 0, 0, 1, 1,
-0.7222681, 0.6872615, -2.227845, 0, 0, 0, 1, 1,
-0.7209864, 0.2758273, 0.2810874, 0, 0, 0, 1, 1,
-0.7207549, 1.409083, -0.06181221, 1, 1, 1, 1, 1,
-0.7191296, 1.776746, -2.143677, 1, 1, 1, 1, 1,
-0.7135051, -0.03659321, -1.572357, 1, 1, 1, 1, 1,
-0.7071527, -0.5306972, -2.914814, 1, 1, 1, 1, 1,
-0.7043664, -1.572029, -1.698891, 1, 1, 1, 1, 1,
-0.7035708, -0.6566177, -2.240613, 1, 1, 1, 1, 1,
-0.6885515, 1.886137, -1.366704, 1, 1, 1, 1, 1,
-0.6880894, -0.7920731, -3.656772, 1, 1, 1, 1, 1,
-0.6843277, 0.01731475, -1.441319, 1, 1, 1, 1, 1,
-0.675546, 0.1625797, -0.8063568, 1, 1, 1, 1, 1,
-0.6638411, -1.483085, -2.225396, 1, 1, 1, 1, 1,
-0.6614529, 0.5141428, 0.03859863, 1, 1, 1, 1, 1,
-0.6607658, -0.07317375, -2.974491, 1, 1, 1, 1, 1,
-0.6606689, 0.6700072, -0.2466242, 1, 1, 1, 1, 1,
-0.6605269, -0.7971411, -4.455559, 1, 1, 1, 1, 1,
-0.6551753, 1.196194, 0.7650845, 0, 0, 1, 1, 1,
-0.6527523, 1.558999, -0.531289, 1, 0, 0, 1, 1,
-0.6509985, 0.3568524, -0.6530324, 1, 0, 0, 1, 1,
-0.6437007, 0.2605703, -0.6201298, 1, 0, 0, 1, 1,
-0.639816, 1.127052, 1.005016, 1, 0, 0, 1, 1,
-0.6323496, 1.25095, 1.61685, 1, 0, 0, 1, 1,
-0.6303621, -1.211191, -1.651746, 0, 0, 0, 1, 1,
-0.6299467, -0.7349745, -2.418225, 0, 0, 0, 1, 1,
-0.6299461, 1.056739, -1.727398, 0, 0, 0, 1, 1,
-0.6298583, 0.3190158, -2.355255, 0, 0, 0, 1, 1,
-0.6275837, 0.3200171, -1.046046, 0, 0, 0, 1, 1,
-0.6264185, 1.071851, -1.065241, 0, 0, 0, 1, 1,
-0.6250235, 1.871292, -0.249534, 0, 0, 0, 1, 1,
-0.623251, -1.033716, -1.571081, 1, 1, 1, 1, 1,
-0.6203797, 0.1737686, -1.275105, 1, 1, 1, 1, 1,
-0.6199824, -0.7372603, -1.535955, 1, 1, 1, 1, 1,
-0.6172598, -2.218287, -1.765585, 1, 1, 1, 1, 1,
-0.6131971, -1.637911, -1.357994, 1, 1, 1, 1, 1,
-0.6109482, 0.7281134, -0.4110133, 1, 1, 1, 1, 1,
-0.6031728, -2.027178, -3.140901, 1, 1, 1, 1, 1,
-0.5983096, 0.9428318, -0.1431028, 1, 1, 1, 1, 1,
-0.5970221, -0.3731844, -2.156656, 1, 1, 1, 1, 1,
-0.5968773, 0.4874314, -1.559744, 1, 1, 1, 1, 1,
-0.5881386, 0.1940814, -1.40893, 1, 1, 1, 1, 1,
-0.5854805, -0.5523195, -4.535408, 1, 1, 1, 1, 1,
-0.5828166, -2.24434, -3.28371, 1, 1, 1, 1, 1,
-0.5788837, -0.02106388, -0.7340449, 1, 1, 1, 1, 1,
-0.5773266, -0.2914337, -1.099738, 1, 1, 1, 1, 1,
-0.5711702, 0.7523461, -1.139617, 0, 0, 1, 1, 1,
-0.5702358, 0.5384634, -1.061823, 1, 0, 0, 1, 1,
-0.565554, 2.593355, 2.341416, 1, 0, 0, 1, 1,
-0.5648442, 1.416594, -1.622359, 1, 0, 0, 1, 1,
-0.5605271, -2.20207, -3.300885, 1, 0, 0, 1, 1,
-0.5600373, -0.9458466, -1.991957, 1, 0, 0, 1, 1,
-0.5566806, -0.3594018, -3.656806, 0, 0, 0, 1, 1,
-0.5556108, 0.709483, -1.678152, 0, 0, 0, 1, 1,
-0.5552037, 0.8042986, 0.8202638, 0, 0, 0, 1, 1,
-0.5540084, 1.012058, -1.230769, 0, 0, 0, 1, 1,
-0.5507624, -0.6239725, -3.667292, 0, 0, 0, 1, 1,
-0.550089, 1.478479, -1.842198, 0, 0, 0, 1, 1,
-0.5489761, 1.519943, -2.028142, 0, 0, 0, 1, 1,
-0.5458356, 0.9742998, -0.2427323, 1, 1, 1, 1, 1,
-0.5456234, -0.8522189, -1.720918, 1, 1, 1, 1, 1,
-0.5432618, 0.03678518, -0.8273214, 1, 1, 1, 1, 1,
-0.5406201, -0.4014041, -1.573854, 1, 1, 1, 1, 1,
-0.5384334, -0.4087216, -3.063141, 1, 1, 1, 1, 1,
-0.5378175, 1.351919, -0.5204442, 1, 1, 1, 1, 1,
-0.5351593, -1.792726, -2.703333, 1, 1, 1, 1, 1,
-0.5327802, -1.472575, -2.824498, 1, 1, 1, 1, 1,
-0.526646, -0.8027673, -2.65691, 1, 1, 1, 1, 1,
-0.522963, 0.2412633, -2.148195, 1, 1, 1, 1, 1,
-0.514746, -0.4631963, -0.5642347, 1, 1, 1, 1, 1,
-0.5122007, -0.4022924, -3.185217, 1, 1, 1, 1, 1,
-0.5090316, -0.3541542, -3.855437, 1, 1, 1, 1, 1,
-0.5054883, -1.013481, -0.878956, 1, 1, 1, 1, 1,
-0.5049781, 0.5799484, -0.4212549, 1, 1, 1, 1, 1,
-0.5043108, -1.425876, -4.635253, 0, 0, 1, 1, 1,
-0.5016604, 0.3174005, 0.3750555, 1, 0, 0, 1, 1,
-0.5012657, -1.295575, -1.696525, 1, 0, 0, 1, 1,
-0.4979356, 1.923815, -0.1424956, 1, 0, 0, 1, 1,
-0.4967449, -0.1564096, -2.372982, 1, 0, 0, 1, 1,
-0.4917374, -0.05771377, -2.840101, 1, 0, 0, 1, 1,
-0.4895863, 1.595844, 0.2063137, 0, 0, 0, 1, 1,
-0.487626, -0.503569, -2.21891, 0, 0, 0, 1, 1,
-0.4874249, 0.5358236, -2.318342, 0, 0, 0, 1, 1,
-0.4858462, 0.6447684, -0.009249733, 0, 0, 0, 1, 1,
-0.484716, -1.238036, -0.4734879, 0, 0, 0, 1, 1,
-0.4816245, 0.3832392, 0.06339447, 0, 0, 0, 1, 1,
-0.4801366, 1.052301, -1.710598, 0, 0, 0, 1, 1,
-0.4796603, 1.828929, 0.9284694, 1, 1, 1, 1, 1,
-0.4737809, 1.078156, -0.6140168, 1, 1, 1, 1, 1,
-0.4722154, -0.2899079, -1.140454, 1, 1, 1, 1, 1,
-0.4639902, 0.02693469, -1.946749, 1, 1, 1, 1, 1,
-0.4624495, 0.4257149, 0.5968999, 1, 1, 1, 1, 1,
-0.4618858, -0.5013048, -3.113137, 1, 1, 1, 1, 1,
-0.4591072, 0.8051823, 0.1687181, 1, 1, 1, 1, 1,
-0.4574225, -0.6783925, -1.772639, 1, 1, 1, 1, 1,
-0.4524017, 0.03933103, -0.7313822, 1, 1, 1, 1, 1,
-0.4496651, 0.3520875, -1.195929, 1, 1, 1, 1, 1,
-0.4476006, 0.03030193, -1.656274, 1, 1, 1, 1, 1,
-0.4425789, -1.155096, -2.340471, 1, 1, 1, 1, 1,
-0.4377548, 1.530002, 1.113989, 1, 1, 1, 1, 1,
-0.4305025, -1.239334, -4.25597, 1, 1, 1, 1, 1,
-0.4297263, 1.506026, -0.07853424, 1, 1, 1, 1, 1,
-0.4266927, 0.7163628, -2.63081, 0, 0, 1, 1, 1,
-0.4245346, 0.2997253, 0.6531928, 1, 0, 0, 1, 1,
-0.4228095, -0.04821435, -2.507427, 1, 0, 0, 1, 1,
-0.419967, -0.1475211, -2.25103, 1, 0, 0, 1, 1,
-0.4139185, -0.4712723, -2.948508, 1, 0, 0, 1, 1,
-0.4136947, -0.9773781, -1.915121, 1, 0, 0, 1, 1,
-0.413672, 0.9538652, -0.4353867, 0, 0, 0, 1, 1,
-0.4116409, 2.134272, 1.699053, 0, 0, 0, 1, 1,
-0.408659, -1.097361, -3.671617, 0, 0, 0, 1, 1,
-0.3985702, 0.267544, -0.02316774, 0, 0, 0, 1, 1,
-0.3928147, 0.4083451, -1.463213, 0, 0, 0, 1, 1,
-0.3926253, 1.67413, -1.465891, 0, 0, 0, 1, 1,
-0.3896065, 1.134228, -1.061412, 0, 0, 0, 1, 1,
-0.3819822, -0.1301235, -3.120864, 1, 1, 1, 1, 1,
-0.3814213, 1.096465, 0.3369159, 1, 1, 1, 1, 1,
-0.3789891, -0.122991, -4.634572, 1, 1, 1, 1, 1,
-0.3771115, -0.767429, -2.20596, 1, 1, 1, 1, 1,
-0.3767381, -0.2896662, -3.589505, 1, 1, 1, 1, 1,
-0.3761908, -0.9198065, -2.367669, 1, 1, 1, 1, 1,
-0.3760731, -0.8566488, -1.787322, 1, 1, 1, 1, 1,
-0.3748882, -0.29631, -2.724037, 1, 1, 1, 1, 1,
-0.3711284, 0.5741084, 1.900981, 1, 1, 1, 1, 1,
-0.3705936, -0.4518158, -2.108158, 1, 1, 1, 1, 1,
-0.3703153, -0.1598965, -3.298003, 1, 1, 1, 1, 1,
-0.3682158, -1.857995, -2.23225, 1, 1, 1, 1, 1,
-0.3659144, 0.230929, 0.06756806, 1, 1, 1, 1, 1,
-0.3645725, 1.884758, 0.575835, 1, 1, 1, 1, 1,
-0.3639979, -1.040777, -3.32788, 1, 1, 1, 1, 1,
-0.3595318, -0.4898408, -2.629614, 0, 0, 1, 1, 1,
-0.3589194, -0.004138251, -1.239151, 1, 0, 0, 1, 1,
-0.3513819, 0.4420294, -0.9628158, 1, 0, 0, 1, 1,
-0.3508749, 1.10625, -1.345485, 1, 0, 0, 1, 1,
-0.3498826, -0.6568466, -3.239047, 1, 0, 0, 1, 1,
-0.3414879, 0.04131229, -2.762076, 1, 0, 0, 1, 1,
-0.3391756, -0.2551922, -3.375892, 0, 0, 0, 1, 1,
-0.3390156, 0.3916912, 0.2524827, 0, 0, 0, 1, 1,
-0.3268081, 1.076235, 0.8154303, 0, 0, 0, 1, 1,
-0.3256364, 0.06725201, -0.823527, 0, 0, 0, 1, 1,
-0.3200324, 0.5690166, -0.9953415, 0, 0, 0, 1, 1,
-0.319193, 1.171774, 0.08583006, 0, 0, 0, 1, 1,
-0.3185863, -0.2424717, -2.222111, 0, 0, 0, 1, 1,
-0.3180207, -1.757792, -3.646077, 1, 1, 1, 1, 1,
-0.3144519, 0.7929593, 0.4107025, 1, 1, 1, 1, 1,
-0.3124928, -0.01194522, -0.8053893, 1, 1, 1, 1, 1,
-0.3068111, -0.4511661, -3.479113, 1, 1, 1, 1, 1,
-0.3045608, -0.7864209, -2.494823, 1, 1, 1, 1, 1,
-0.2955815, 1.917328, -3.03221, 1, 1, 1, 1, 1,
-0.2924195, -0.02869584, -2.671621, 1, 1, 1, 1, 1,
-0.291552, -0.1485551, -1.298622, 1, 1, 1, 1, 1,
-0.2883686, 0.530384, 0.5985962, 1, 1, 1, 1, 1,
-0.2845927, -1.519309, -2.662275, 1, 1, 1, 1, 1,
-0.2843806, 1.060173, -0.08248463, 1, 1, 1, 1, 1,
-0.2824452, 0.5895699, 0.3516586, 1, 1, 1, 1, 1,
-0.2796891, 0.2012351, -1.160021, 1, 1, 1, 1, 1,
-0.2792863, -0.01605032, -2.048345, 1, 1, 1, 1, 1,
-0.278666, 1.565174, -1.210242, 1, 1, 1, 1, 1,
-0.2729789, 0.3291392, 0.7975166, 0, 0, 1, 1, 1,
-0.2680116, -0.9889225, -4.415989, 1, 0, 0, 1, 1,
-0.2679363, 0.5971119, -1.200992, 1, 0, 0, 1, 1,
-0.2677381, 0.151417, -1.180531, 1, 0, 0, 1, 1,
-0.2608675, -1.024175, -2.039217, 1, 0, 0, 1, 1,
-0.2580726, 1.507684, -1.87361, 1, 0, 0, 1, 1,
-0.2548369, -0.09489547, -1.768388, 0, 0, 0, 1, 1,
-0.2545979, -0.01508147, -0.9938993, 0, 0, 0, 1, 1,
-0.25203, -0.9560629, -2.943594, 0, 0, 0, 1, 1,
-0.2479097, 0.01869852, -2.61307, 0, 0, 0, 1, 1,
-0.2433815, -1.688375, -2.759884, 0, 0, 0, 1, 1,
-0.2412673, -0.5852435, -2.281051, 0, 0, 0, 1, 1,
-0.238499, -0.8079394, -3.600658, 0, 0, 0, 1, 1,
-0.2383516, -0.7155622, -4.226173, 1, 1, 1, 1, 1,
-0.2380528, -0.1677141, -2.013804, 1, 1, 1, 1, 1,
-0.2365741, 0.3000863, -2.065605, 1, 1, 1, 1, 1,
-0.2354545, -1.118245, -4.194139, 1, 1, 1, 1, 1,
-0.2317195, 0.5635993, -1.639176, 1, 1, 1, 1, 1,
-0.2302054, -0.9027247, -3.199339, 1, 1, 1, 1, 1,
-0.2298228, -1.291333, -4.211497, 1, 1, 1, 1, 1,
-0.2279831, 1.61474, -0.2663878, 1, 1, 1, 1, 1,
-0.2239261, 0.2340523, -0.08184302, 1, 1, 1, 1, 1,
-0.2211354, 0.7403621, -0.6376453, 1, 1, 1, 1, 1,
-0.216805, 0.3918175, 0.3221413, 1, 1, 1, 1, 1,
-0.215223, -0.03591773, 0.3311915, 1, 1, 1, 1, 1,
-0.2044503, -0.081324, -2.776267, 1, 1, 1, 1, 1,
-0.2014255, 0.8952965, -1.012595, 1, 1, 1, 1, 1,
-0.2011775, 0.2955835, -1.954114, 1, 1, 1, 1, 1,
-0.2010083, -0.6563648, -1.885647, 0, 0, 1, 1, 1,
-0.1995385, -2.234643, -3.354594, 1, 0, 0, 1, 1,
-0.1987359, 0.7845246, 0.03506043, 1, 0, 0, 1, 1,
-0.1962855, -3.32127, -3.810013, 1, 0, 0, 1, 1,
-0.1961655, -0.9869682, -4.448051, 1, 0, 0, 1, 1,
-0.1954798, -0.2267699, -2.28899, 1, 0, 0, 1, 1,
-0.1837111, 0.292953, -0.2359255, 0, 0, 0, 1, 1,
-0.1802571, 0.2529698, -2.090477, 0, 0, 0, 1, 1,
-0.1790542, -0.3554068, -2.344949, 0, 0, 0, 1, 1,
-0.1789445, -0.9903868, -3.127427, 0, 0, 0, 1, 1,
-0.1787223, 1.607702, 0.620618, 0, 0, 0, 1, 1,
-0.1725159, 0.5499141, 0.1703067, 0, 0, 0, 1, 1,
-0.1709485, 0.5759017, -2.324116, 0, 0, 0, 1, 1,
-0.1707095, 0.4517213, -0.01942874, 1, 1, 1, 1, 1,
-0.168573, 0.9858882, -1.794047, 1, 1, 1, 1, 1,
-0.1652171, 1.570079, 1.965256, 1, 1, 1, 1, 1,
-0.1600946, -0.3332144, -3.329501, 1, 1, 1, 1, 1,
-0.1535109, 1.365595, 0.4367401, 1, 1, 1, 1, 1,
-0.1520848, -0.9163927, -3.960166, 1, 1, 1, 1, 1,
-0.1514962, -1.047943, -2.077022, 1, 1, 1, 1, 1,
-0.1512622, -0.4453394, -2.179957, 1, 1, 1, 1, 1,
-0.1508461, 1.57362, 0.4312099, 1, 1, 1, 1, 1,
-0.1494795, -0.9033626, -3.706863, 1, 1, 1, 1, 1,
-0.1488277, 0.6594688, 0.4422143, 1, 1, 1, 1, 1,
-0.1468172, 1.19301, -0.7079459, 1, 1, 1, 1, 1,
-0.1423217, 0.6451414, 0.8601975, 1, 1, 1, 1, 1,
-0.1421862, -1.05085, -4.653567, 1, 1, 1, 1, 1,
-0.1387413, 1.701994, 0.4841264, 1, 1, 1, 1, 1,
-0.1368732, -1.854897, -3.863497, 0, 0, 1, 1, 1,
-0.1368125, -1.224297, -2.958939, 1, 0, 0, 1, 1,
-0.1345488, 1.759581, -0.7356672, 1, 0, 0, 1, 1,
-0.1336675, -0.2415424, -1.767167, 1, 0, 0, 1, 1,
-0.1272566, -0.9635212, -3.297806, 1, 0, 0, 1, 1,
-0.1165733, -0.8840035, -1.128847, 1, 0, 0, 1, 1,
-0.1133983, -0.6143634, -3.739523, 0, 0, 0, 1, 1,
-0.1099549, -0.1307754, -2.474048, 0, 0, 0, 1, 1,
-0.1090186, -0.04942248, -0.407246, 0, 0, 0, 1, 1,
-0.1085062, -1.095498, -4.144714, 0, 0, 0, 1, 1,
-0.100794, -0.3045784, -3.276598, 0, 0, 0, 1, 1,
-0.09913175, -0.06501364, -2.161804, 0, 0, 0, 1, 1,
-0.094028, 0.5591842, 0.4649225, 0, 0, 0, 1, 1,
-0.09040473, -1.091368, -2.763874, 1, 1, 1, 1, 1,
-0.08959024, -1.535084, -2.286976, 1, 1, 1, 1, 1,
-0.0885781, -0.2510222, -2.360085, 1, 1, 1, 1, 1,
-0.08749059, -0.3411257, -1.953845, 1, 1, 1, 1, 1,
-0.08231873, 0.2763604, -2.096046, 1, 1, 1, 1, 1,
-0.07678673, 1.844431, 0.6709394, 1, 1, 1, 1, 1,
-0.0754981, 0.09474892, -1.458972, 1, 1, 1, 1, 1,
-0.07249246, -0.4940695, -2.851048, 1, 1, 1, 1, 1,
-0.06834073, 1.638189, -0.8334569, 1, 1, 1, 1, 1,
-0.06828579, -0.6288309, -2.108514, 1, 1, 1, 1, 1,
-0.0677047, -0.3486939, -4.092895, 1, 1, 1, 1, 1,
-0.06700104, -0.799332, -2.169935, 1, 1, 1, 1, 1,
-0.06288929, -0.9206377, -0.8333197, 1, 1, 1, 1, 1,
-0.06048957, -1.301572, -1.41078, 1, 1, 1, 1, 1,
-0.06026338, -0.7623216, -3.518513, 1, 1, 1, 1, 1,
-0.05888755, 1.084215, 0.3947456, 0, 0, 1, 1, 1,
-0.05798362, -1.192055, -3.254611, 1, 0, 0, 1, 1,
-0.05765468, 0.4710681, 0.9220449, 1, 0, 0, 1, 1,
-0.0546574, 1.191383, -0.6136802, 1, 0, 0, 1, 1,
-0.0465204, -1.058822, -2.166015, 1, 0, 0, 1, 1,
-0.04424756, 0.1059745, 1.443423, 1, 0, 0, 1, 1,
-0.04388115, -0.4091376, -3.027834, 0, 0, 0, 1, 1,
-0.03987405, -1.082095, -2.899379, 0, 0, 0, 1, 1,
-0.029004, 0.6048403, -0.3980893, 0, 0, 0, 1, 1,
-0.02888179, 0.09373743, 1.122257, 0, 0, 0, 1, 1,
-0.02368873, -0.7633467, -3.414092, 0, 0, 0, 1, 1,
-0.02347563, -0.8889419, -3.162597, 0, 0, 0, 1, 1,
-0.0230102, -0.1936989, -2.798144, 0, 0, 0, 1, 1,
-0.02284528, -1.175668, -4.411236, 1, 1, 1, 1, 1,
-0.02121433, -3.08201, -4.912544, 1, 1, 1, 1, 1,
-0.02079517, -1.208882, -4.152795, 1, 1, 1, 1, 1,
-0.01543176, 2.528503, 1.265331, 1, 1, 1, 1, 1,
-0.01375523, -1.202951, -3.405268, 1, 1, 1, 1, 1,
-0.01362619, -0.2687918, -3.735093, 1, 1, 1, 1, 1,
-0.008649125, -0.9122945, -3.464053, 1, 1, 1, 1, 1,
-0.005679343, 0.05507642, 1.180152, 1, 1, 1, 1, 1,
0.001251114, 0.3186882, 1.228198, 1, 1, 1, 1, 1,
0.00682908, -0.2080641, 1.322016, 1, 1, 1, 1, 1,
0.007635876, 0.8246151, -0.844409, 1, 1, 1, 1, 1,
0.008807247, -0.9192097, 3.47701, 1, 1, 1, 1, 1,
0.01250642, 2.029727, 1.448691, 1, 1, 1, 1, 1,
0.01363967, -0.1605602, 4.042495, 1, 1, 1, 1, 1,
0.01772756, 0.771908, -0.6323391, 1, 1, 1, 1, 1,
0.01843651, 0.05801735, 0.9643205, 0, 0, 1, 1, 1,
0.01969031, 1.965064, -0.484785, 1, 0, 0, 1, 1,
0.02286919, -0.329313, 2.531414, 1, 0, 0, 1, 1,
0.02376887, -2.888386, 3.151678, 1, 0, 0, 1, 1,
0.02569404, -1.33241, 1.990937, 1, 0, 0, 1, 1,
0.02569456, -0.6403586, 3.568083, 1, 0, 0, 1, 1,
0.02761302, -1.053088, 3.450423, 0, 0, 0, 1, 1,
0.0291377, -2.002668, 4.493567, 0, 0, 0, 1, 1,
0.03069265, -0.917967, 1.304813, 0, 0, 0, 1, 1,
0.0315646, 0.7185794, 0.3546613, 0, 0, 0, 1, 1,
0.03516161, 1.352144, -0.7969397, 0, 0, 0, 1, 1,
0.03617447, 1.211847, -0.7351137, 0, 0, 0, 1, 1,
0.03892495, 0.5515535, 0.5738373, 0, 0, 0, 1, 1,
0.04121795, -0.6313825, 3.757949, 1, 1, 1, 1, 1,
0.04215578, -1.265286, 3.412162, 1, 1, 1, 1, 1,
0.04733674, 0.1561535, 0.186749, 1, 1, 1, 1, 1,
0.04742698, -0.509513, 3.502659, 1, 1, 1, 1, 1,
0.05000758, 0.4971279, 0.09537515, 1, 1, 1, 1, 1,
0.05248553, 0.6797367, -1.601544, 1, 1, 1, 1, 1,
0.05285758, 0.1024956, 1.229108, 1, 1, 1, 1, 1,
0.05454715, 0.6121002, 1.431745, 1, 1, 1, 1, 1,
0.05561876, -1.144364, 3.402586, 1, 1, 1, 1, 1,
0.05634113, 2.576189, 0.1566625, 1, 1, 1, 1, 1,
0.06281137, 0.3618529, 1.679085, 1, 1, 1, 1, 1,
0.06746411, -0.8592016, 2.642857, 1, 1, 1, 1, 1,
0.06852026, 0.9527748, 0.6968926, 1, 1, 1, 1, 1,
0.07080024, 0.4193159, 0.5785738, 1, 1, 1, 1, 1,
0.07128602, -0.7919759, 2.675268, 1, 1, 1, 1, 1,
0.07606409, -0.118673, 1.941796, 0, 0, 1, 1, 1,
0.08390292, -1.974998, 2.876894, 1, 0, 0, 1, 1,
0.08456467, -0.5823367, 3.055662, 1, 0, 0, 1, 1,
0.08739286, -0.5257303, 1.623692, 1, 0, 0, 1, 1,
0.09045143, 0.5971057, -0.8291634, 1, 0, 0, 1, 1,
0.09611633, -0.2064187, 2.231776, 1, 0, 0, 1, 1,
0.09837288, 1.281111, -0.7528328, 0, 0, 0, 1, 1,
0.09985695, 0.8697221, 1.16474, 0, 0, 0, 1, 1,
0.1008117, -0.4679438, 1.564363, 0, 0, 0, 1, 1,
0.1026545, 1.129611, 0.1468806, 0, 0, 0, 1, 1,
0.1068637, 0.4855196, -0.3499352, 0, 0, 0, 1, 1,
0.107886, -0.6360744, 3.007452, 0, 0, 0, 1, 1,
0.1102129, -0.5503082, 2.554173, 0, 0, 0, 1, 1,
0.1103072, 1.322105, 0.01671954, 1, 1, 1, 1, 1,
0.1103781, 0.8320031, -1.361796, 1, 1, 1, 1, 1,
0.1128916, -0.09077563, 1.955219, 1, 1, 1, 1, 1,
0.1147588, -0.7111843, 4.457496, 1, 1, 1, 1, 1,
0.1165276, 0.370187, -0.8002763, 1, 1, 1, 1, 1,
0.117707, 0.4020189, 0.03521108, 1, 1, 1, 1, 1,
0.1199092, 0.1644703, 0.502776, 1, 1, 1, 1, 1,
0.1204713, 0.8367438, 0.5481024, 1, 1, 1, 1, 1,
0.1217475, -1.199827, 4.007895, 1, 1, 1, 1, 1,
0.1232974, 0.8874747, 0.7306047, 1, 1, 1, 1, 1,
0.1259543, 0.2677934, 0.2168168, 1, 1, 1, 1, 1,
0.1268662, 1.151651, 0.8379812, 1, 1, 1, 1, 1,
0.1328046, 0.6788462, 0.933993, 1, 1, 1, 1, 1,
0.1332928, 0.6488787, 0.006075523, 1, 1, 1, 1, 1,
0.1341555, -0.9820771, 1.263421, 1, 1, 1, 1, 1,
0.1366012, 0.1551655, 3.124385, 0, 0, 1, 1, 1,
0.1367842, -0.5908558, 3.513256, 1, 0, 0, 1, 1,
0.1372258, -0.3350809, 4.456392, 1, 0, 0, 1, 1,
0.1393503, -1.086743, 2.868503, 1, 0, 0, 1, 1,
0.1429127, 0.2719029, 1.21306, 1, 0, 0, 1, 1,
0.1441157, -0.8660993, 3.247609, 1, 0, 0, 1, 1,
0.1480115, -1.326583, 4.222847, 0, 0, 0, 1, 1,
0.1482127, 1.379888, -0.480253, 0, 0, 0, 1, 1,
0.1561724, 0.8805328, 0.2271832, 0, 0, 0, 1, 1,
0.1583861, 0.3399324, 1.900714, 0, 0, 0, 1, 1,
0.1590601, 1.404786, -0.5783392, 0, 0, 0, 1, 1,
0.1605311, 0.08145925, 3.262239, 0, 0, 0, 1, 1,
0.1634846, -1.195197, 4.018939, 0, 0, 0, 1, 1,
0.1652192, 0.9365895, 2.133955, 1, 1, 1, 1, 1,
0.167975, -0.404038, 4.423825, 1, 1, 1, 1, 1,
0.1708021, 0.5498036, -0.2134633, 1, 1, 1, 1, 1,
0.1713231, -1.477874, 1.200944, 1, 1, 1, 1, 1,
0.1718038, 0.6392613, -0.6700274, 1, 1, 1, 1, 1,
0.172892, 1.222538, -0.2983451, 1, 1, 1, 1, 1,
0.1760159, -0.8169378, 2.428461, 1, 1, 1, 1, 1,
0.1770215, 0.1125774, 1.180349, 1, 1, 1, 1, 1,
0.1856381, 0.9743494, -0.1490968, 1, 1, 1, 1, 1,
0.1860356, -0.9655425, 2.258819, 1, 1, 1, 1, 1,
0.1884261, -1.94013, 3.96071, 1, 1, 1, 1, 1,
0.1899447, -0.4243418, 3.972833, 1, 1, 1, 1, 1,
0.1929469, 0.0766625, -0.260838, 1, 1, 1, 1, 1,
0.1957088, -0.3237779, 3.254695, 1, 1, 1, 1, 1,
0.196374, 0.4174519, 1.129299, 1, 1, 1, 1, 1,
0.1991712, -0.06465305, 1.013097, 0, 0, 1, 1, 1,
0.2004155, 0.3089264, 0.7701904, 1, 0, 0, 1, 1,
0.2009584, 0.4233944, 1.958374, 1, 0, 0, 1, 1,
0.2033459, -1.359528, 1.792312, 1, 0, 0, 1, 1,
0.2049175, -0.3717239, 2.447237, 1, 0, 0, 1, 1,
0.2055529, 0.4951525, 1.021745, 1, 0, 0, 1, 1,
0.2070392, 1.133403, -0.2312024, 0, 0, 0, 1, 1,
0.2137047, -0.2145723, 2.271893, 0, 0, 0, 1, 1,
0.2170701, -1.513959, 3.020196, 0, 0, 0, 1, 1,
0.2181128, 1.205594, 0.6713336, 0, 0, 0, 1, 1,
0.2182138, -0.5037352, 2.193821, 0, 0, 0, 1, 1,
0.2189696, -1.448438, 2.547984, 0, 0, 0, 1, 1,
0.2310725, 1.589895, -0.2940954, 0, 0, 0, 1, 1,
0.2340828, 1.024231, -0.1947156, 1, 1, 1, 1, 1,
0.2411085, 0.5193267, -0.143682, 1, 1, 1, 1, 1,
0.2411893, -1.4339, 3.46184, 1, 1, 1, 1, 1,
0.2452243, 0.06824925, 2.297753, 1, 1, 1, 1, 1,
0.2465651, -0.7804726, 2.371253, 1, 1, 1, 1, 1,
0.2505307, 0.2232864, 2.432014, 1, 1, 1, 1, 1,
0.2516703, -1.095113, 3.266511, 1, 1, 1, 1, 1,
0.2576204, -1.209949, 3.278883, 1, 1, 1, 1, 1,
0.2588497, -1.053616, 3.416987, 1, 1, 1, 1, 1,
0.2682309, -0.1748173, 2.521289, 1, 1, 1, 1, 1,
0.273275, -0.3671325, 2.640891, 1, 1, 1, 1, 1,
0.2735916, 0.4105639, 1.49484, 1, 1, 1, 1, 1,
0.2736944, 0.1537974, 0.07857091, 1, 1, 1, 1, 1,
0.2762744, -0.8753148, 2.103333, 1, 1, 1, 1, 1,
0.2840794, 0.6017523, 0.7980816, 1, 1, 1, 1, 1,
0.2885938, 1.213717, 0.0217187, 0, 0, 1, 1, 1,
0.2891938, -1.930229, 3.784079, 1, 0, 0, 1, 1,
0.295188, -1.731929, 2.190415, 1, 0, 0, 1, 1,
0.2954662, -0.2689575, 1.774072, 1, 0, 0, 1, 1,
0.3011863, -0.4634628, 2.804222, 1, 0, 0, 1, 1,
0.3101574, -2.141407, 1.479077, 1, 0, 0, 1, 1,
0.3114595, 0.5920404, 0.671455, 0, 0, 0, 1, 1,
0.315383, 0.7581159, -1.014478, 0, 0, 0, 1, 1,
0.3163148, -0.8999917, 2.469154, 0, 0, 0, 1, 1,
0.3225229, 1.645094, 1.350454, 0, 0, 0, 1, 1,
0.3239552, 0.1019267, 1.214108, 0, 0, 0, 1, 1,
0.3254929, 0.6117773, 0.903225, 0, 0, 0, 1, 1,
0.3283358, 0.09860303, 0.4927024, 0, 0, 0, 1, 1,
0.3284214, 0.06303574, 0.2150392, 1, 1, 1, 1, 1,
0.3302257, -0.9992425, 2.983446, 1, 1, 1, 1, 1,
0.3335598, 0.1010541, 1.651658, 1, 1, 1, 1, 1,
0.3378994, -0.5841967, 2.14063, 1, 1, 1, 1, 1,
0.3409678, -0.08494371, 4.494538, 1, 1, 1, 1, 1,
0.3429333, -1.231066, 3.074892, 1, 1, 1, 1, 1,
0.3432926, 0.5583409, 1.823743, 1, 1, 1, 1, 1,
0.3437059, 1.167771, 0.6898202, 1, 1, 1, 1, 1,
0.3478345, -1.914411, 2.726425, 1, 1, 1, 1, 1,
0.3540164, -0.3765662, 3.119794, 1, 1, 1, 1, 1,
0.3546041, -0.2113426, 1.298846, 1, 1, 1, 1, 1,
0.3589888, 1.658615, 0.8463125, 1, 1, 1, 1, 1,
0.363748, 0.4359779, 1.945112, 1, 1, 1, 1, 1,
0.369055, -2.132787, 3.069916, 1, 1, 1, 1, 1,
0.3702116, 0.4524481, 1.906327, 1, 1, 1, 1, 1,
0.3756415, -1.629107, 4.585218, 0, 0, 1, 1, 1,
0.3797005, -1.064839, 1.601258, 1, 0, 0, 1, 1,
0.3799687, -0.5778832, 2.938825, 1, 0, 0, 1, 1,
0.3805834, -1.382436, 1.221043, 1, 0, 0, 1, 1,
0.3846094, -0.05439017, 2.891474, 1, 0, 0, 1, 1,
0.386225, -1.153998, 1.018543, 1, 0, 0, 1, 1,
0.3869916, -0.5374596, 2.921828, 0, 0, 0, 1, 1,
0.3959051, -1.170906, 3.458022, 0, 0, 0, 1, 1,
0.4043703, -1.866137, 3.595896, 0, 0, 0, 1, 1,
0.4049822, 0.86351, 1.217391, 0, 0, 0, 1, 1,
0.405789, -2.513031, 1.109015, 0, 0, 0, 1, 1,
0.4059978, -0.4301857, 1.973114, 0, 0, 0, 1, 1,
0.4064644, -0.1161761, 2.287269, 0, 0, 0, 1, 1,
0.4073069, 0.5005433, -0.2179738, 1, 1, 1, 1, 1,
0.4163947, 0.2760454, 1.664507, 1, 1, 1, 1, 1,
0.4233013, -1.125097, 3.290046, 1, 1, 1, 1, 1,
0.4238077, 1.407758, 1.578536, 1, 1, 1, 1, 1,
0.4264932, -1.086398, 4.296102, 1, 1, 1, 1, 1,
0.4348402, 0.5287915, -0.3216542, 1, 1, 1, 1, 1,
0.4361587, -0.9107364, 1.304241, 1, 1, 1, 1, 1,
0.4381053, 1.728799, -0.3314453, 1, 1, 1, 1, 1,
0.4398678, 1.251793, 1.241033, 1, 1, 1, 1, 1,
0.4406092, 1.353734, -0.4868153, 1, 1, 1, 1, 1,
0.4410126, 0.2649016, 0.8653381, 1, 1, 1, 1, 1,
0.448915, 0.2917358, 1.918376, 1, 1, 1, 1, 1,
0.4513, -0.3716789, 0.06297581, 1, 1, 1, 1, 1,
0.4536378, 0.5669116, 0.7642943, 1, 1, 1, 1, 1,
0.456008, 0.5238006, 0.4093429, 1, 1, 1, 1, 1,
0.4578367, -0.3255461, 3.36063, 0, 0, 1, 1, 1,
0.4601091, -1.361882, 3.708518, 1, 0, 0, 1, 1,
0.4607953, 0.8673525, 0.9118916, 1, 0, 0, 1, 1,
0.4616956, 2.190023, 1.432434, 1, 0, 0, 1, 1,
0.4659184, 0.7181723, 2.73228, 1, 0, 0, 1, 1,
0.4677666, -0.8501989, 2.770913, 1, 0, 0, 1, 1,
0.4826484, 1.201282, 1.052832, 0, 0, 0, 1, 1,
0.4830327, -1.220008, 3.250431, 0, 0, 0, 1, 1,
0.489315, 1.517302, 0.1606913, 0, 0, 0, 1, 1,
0.4910968, -0.1129694, 1.88124, 0, 0, 0, 1, 1,
0.5027414, 0.4489169, 1.880011, 0, 0, 0, 1, 1,
0.5057035, 0.7143492, 3.331131, 0, 0, 0, 1, 1,
0.5062994, 2.72429, -0.5950907, 0, 0, 0, 1, 1,
0.5074149, -0.9357343, 2.668107, 1, 1, 1, 1, 1,
0.5086863, -0.4919233, 3.258316, 1, 1, 1, 1, 1,
0.5144641, -0.9137161, 3.291612, 1, 1, 1, 1, 1,
0.519353, -1.651432, 1.704711, 1, 1, 1, 1, 1,
0.520889, 2.647718, 0.4859746, 1, 1, 1, 1, 1,
0.5216076, -0.8432009, 3.964605, 1, 1, 1, 1, 1,
0.5246764, -0.09135773, 2.570809, 1, 1, 1, 1, 1,
0.526144, -0.8703768, 2.677875, 1, 1, 1, 1, 1,
0.5267043, 2.364501, -0.2743061, 1, 1, 1, 1, 1,
0.5284789, -1.386663, 2.354932, 1, 1, 1, 1, 1,
0.5304552, -0.1472709, 2.461478, 1, 1, 1, 1, 1,
0.5326371, 0.6078347, 2.188842, 1, 1, 1, 1, 1,
0.5378447, -2.299816, 4.632484, 1, 1, 1, 1, 1,
0.5494404, -0.1823664, 0.8643048, 1, 1, 1, 1, 1,
0.5543989, 0.1384021, 3.590959, 1, 1, 1, 1, 1,
0.5547856, -0.004665847, 1.56315, 0, 0, 1, 1, 1,
0.5553609, -0.007394955, 1.453003, 1, 0, 0, 1, 1,
0.5650981, 0.9135279, 1.236151, 1, 0, 0, 1, 1,
0.571008, -0.6934746, 4.384305, 1, 0, 0, 1, 1,
0.5732557, -0.2851995, 3.803682, 1, 0, 0, 1, 1,
0.588217, -0.4295088, 2.653889, 1, 0, 0, 1, 1,
0.5912301, 1.394056, 1.080397, 0, 0, 0, 1, 1,
0.5914901, -2.20226, 3.284505, 0, 0, 0, 1, 1,
0.5940194, 0.834978, 1.120686, 0, 0, 0, 1, 1,
0.5943277, -0.2583126, 1.424679, 0, 0, 0, 1, 1,
0.5975789, -0.8523651, 2.399725, 0, 0, 0, 1, 1,
0.5996718, -0.9675339, 2.010146, 0, 0, 0, 1, 1,
0.6017765, 0.5640947, -0.3783853, 0, 0, 0, 1, 1,
0.6048582, -0.3841931, 1.073965, 1, 1, 1, 1, 1,
0.6089937, 1.134532, 0.8704686, 1, 1, 1, 1, 1,
0.6125227, -1.041932, 4.159474, 1, 1, 1, 1, 1,
0.6130091, 0.6237544, 0.2786687, 1, 1, 1, 1, 1,
0.614137, -1.755474, 2.203014, 1, 1, 1, 1, 1,
0.6154943, 0.9367254, 0.1611722, 1, 1, 1, 1, 1,
0.6191956, 2.197214, -1.273145, 1, 1, 1, 1, 1,
0.620844, -0.1760257, 0.6734591, 1, 1, 1, 1, 1,
0.6256627, 0.4347697, 0.9098852, 1, 1, 1, 1, 1,
0.6259553, 0.3913957, 1.115615, 1, 1, 1, 1, 1,
0.6272891, 0.4570691, 0.5613871, 1, 1, 1, 1, 1,
0.6330978, 0.6048223, 0.5573691, 1, 1, 1, 1, 1,
0.6341263, 0.7607722, 1.376221, 1, 1, 1, 1, 1,
0.6394495, -0.4396352, 1.948913, 1, 1, 1, 1, 1,
0.6435087, -0.9835793, 3.451988, 1, 1, 1, 1, 1,
0.6455207, -0.2390046, 2.220649, 0, 0, 1, 1, 1,
0.6490372, 0.6155482, -1.317616, 1, 0, 0, 1, 1,
0.6509985, -0.8627024, 2.922922, 1, 0, 0, 1, 1,
0.6542733, 0.00630429, 2.215316, 1, 0, 0, 1, 1,
0.6566884, -0.236238, 1.258024, 1, 0, 0, 1, 1,
0.6609512, 0.5846723, 1.690128, 1, 0, 0, 1, 1,
0.6618826, -0.03998662, 2.757679, 0, 0, 0, 1, 1,
0.6750336, 1.40449, 0.5419258, 0, 0, 0, 1, 1,
0.6778064, 0.2178026, 1.401598, 0, 0, 0, 1, 1,
0.6792852, -0.3440194, 1.974229, 0, 0, 0, 1, 1,
0.7037368, -0.2494075, 1.831298, 0, 0, 0, 1, 1,
0.7061004, -1.069457, 3.801277, 0, 0, 0, 1, 1,
0.706811, -1.489004, 1.702846, 0, 0, 0, 1, 1,
0.7106411, 0.04446921, 2.285343, 1, 1, 1, 1, 1,
0.7158985, 0.5961451, -0.1863484, 1, 1, 1, 1, 1,
0.7179992, 0.5008831, 0.4964256, 1, 1, 1, 1, 1,
0.7201045, -0.4105292, 0.09004797, 1, 1, 1, 1, 1,
0.7241836, -2.408614, 2.270108, 1, 1, 1, 1, 1,
0.7248242, 0.3490541, 0.8494316, 1, 1, 1, 1, 1,
0.7278543, -0.357145, 2.305084, 1, 1, 1, 1, 1,
0.7296154, -0.3575103, 2.552461, 1, 1, 1, 1, 1,
0.7421374, 0.7071785, 2.087402, 1, 1, 1, 1, 1,
0.7444534, 0.7462808, 1.459702, 1, 1, 1, 1, 1,
0.7464074, -1.123993, 2.076388, 1, 1, 1, 1, 1,
0.7488222, 0.2052572, 1.203477, 1, 1, 1, 1, 1,
0.7495072, 0.08928457, 1.490573, 1, 1, 1, 1, 1,
0.7519994, 0.9433518, -0.09332226, 1, 1, 1, 1, 1,
0.7541057, 0.2094037, -0.8718715, 1, 1, 1, 1, 1,
0.761474, -0.7325218, 5.314772, 0, 0, 1, 1, 1,
0.7651492, -0.431594, 2.272637, 1, 0, 0, 1, 1,
0.7656727, -0.6176975, 2.889184, 1, 0, 0, 1, 1,
0.7671122, 0.5847353, 0.5525765, 1, 0, 0, 1, 1,
0.7675097, 0.02595521, 2.069495, 1, 0, 0, 1, 1,
0.774364, -0.5779374, 1.104399, 1, 0, 0, 1, 1,
0.777842, 0.2401798, 0.6165101, 0, 0, 0, 1, 1,
0.7801868, -0.5233188, 0.2535183, 0, 0, 0, 1, 1,
0.7886719, -0.3823889, 2.064664, 0, 0, 0, 1, 1,
0.7894517, 0.6433723, 1.601886, 0, 0, 0, 1, 1,
0.7986019, 0.02721699, 2.06559, 0, 0, 0, 1, 1,
0.8004944, 0.09044713, 1.57155, 0, 0, 0, 1, 1,
0.8034838, -0.711999, 3.276958, 0, 0, 0, 1, 1,
0.8041158, -0.06302727, 0.8936853, 1, 1, 1, 1, 1,
0.8110229, -0.6361917, 2.050068, 1, 1, 1, 1, 1,
0.8121409, 1.615453, 1.642228, 1, 1, 1, 1, 1,
0.8183749, -0.7320673, 1.27224, 1, 1, 1, 1, 1,
0.8228849, 0.2400841, 1.11373, 1, 1, 1, 1, 1,
0.8265066, -0.3032584, 3.181421, 1, 1, 1, 1, 1,
0.8361238, -0.9894345, 3.078809, 1, 1, 1, 1, 1,
0.8375073, -2.264516, 2.149745, 1, 1, 1, 1, 1,
0.8380465, -2.267657, 3.989933, 1, 1, 1, 1, 1,
0.8400926, 1.048728, 1.233228, 1, 1, 1, 1, 1,
0.8446177, -0.9339424, 2.407137, 1, 1, 1, 1, 1,
0.8485523, -0.02115695, 0.4971426, 1, 1, 1, 1, 1,
0.849806, -3.276159, 5.242233, 1, 1, 1, 1, 1,
0.8499007, 0.223832, 0.2813314, 1, 1, 1, 1, 1,
0.8544292, 1.01023, 0.06478634, 1, 1, 1, 1, 1,
0.8546016, 0.4559705, 1.208495, 0, 0, 1, 1, 1,
0.855083, -0.4681154, -0.3545772, 1, 0, 0, 1, 1,
0.8595949, -0.4298469, 2.635069, 1, 0, 0, 1, 1,
0.8661674, 0.1554154, 1.819356, 1, 0, 0, 1, 1,
0.8720215, 1.695749, 0.2676372, 1, 0, 0, 1, 1,
0.8747814, 0.6048541, 1.170463, 1, 0, 0, 1, 1,
0.8771233, -0.3439437, -0.004315259, 0, 0, 0, 1, 1,
0.8853213, 0.200807, 1.26045, 0, 0, 0, 1, 1,
0.8902857, -0.3925179, 2.442286, 0, 0, 0, 1, 1,
0.8914742, -2.179642, 2.219787, 0, 0, 0, 1, 1,
0.9004562, -0.5657251, 1.310367, 0, 0, 0, 1, 1,
0.9101431, -1.462907, 2.579128, 0, 0, 0, 1, 1,
0.9151706, -0.01577405, 2.726128, 0, 0, 0, 1, 1,
0.9196693, -1.051965, 2.711216, 1, 1, 1, 1, 1,
0.9211234, -0.1643617, 0.9070525, 1, 1, 1, 1, 1,
0.9229699, -0.7117502, 3.268203, 1, 1, 1, 1, 1,
0.9285225, 0.138083, 1.738508, 1, 1, 1, 1, 1,
0.9294866, 0.8869928, 2.455836, 1, 1, 1, 1, 1,
0.930139, -0.4111076, 4.113982, 1, 1, 1, 1, 1,
0.9302571, -0.1206606, 1.814754, 1, 1, 1, 1, 1,
0.9342337, -0.225759, 0.9920967, 1, 1, 1, 1, 1,
0.9356033, 1.002185, 1.487226, 1, 1, 1, 1, 1,
0.9359587, -0.4878116, 3.319163, 1, 1, 1, 1, 1,
0.9361235, -0.301098, 0.9385884, 1, 1, 1, 1, 1,
0.9373521, -0.9173471, 2.544574, 1, 1, 1, 1, 1,
0.9414058, -0.09327022, 1.80964, 1, 1, 1, 1, 1,
0.9528347, 0.4429982, 1.404408, 1, 1, 1, 1, 1,
0.9574549, -0.04891745, 1.477962, 1, 1, 1, 1, 1,
0.9677692, 0.7213556, 0.5565218, 0, 0, 1, 1, 1,
0.9869442, 0.5844275, 0.9935473, 1, 0, 0, 1, 1,
1.000864, 0.8145307, 0.3004, 1, 0, 0, 1, 1,
1.003909, 0.910509, 1.14527, 1, 0, 0, 1, 1,
1.004847, -1.396103, 0.7509874, 1, 0, 0, 1, 1,
1.006847, -0.149476, 1.352741, 1, 0, 0, 1, 1,
1.007303, 0.1140936, 1.691781, 0, 0, 0, 1, 1,
1.016657, 0.08190191, 1.225709, 0, 0, 0, 1, 1,
1.018343, 0.7833075, 0.9087957, 0, 0, 0, 1, 1,
1.025089, 0.7691029, -0.07946376, 0, 0, 0, 1, 1,
1.02888, 0.8322663, 1.146726, 0, 0, 0, 1, 1,
1.029664, 0.4721706, 1.316927, 0, 0, 0, 1, 1,
1.030765, -0.8621747, 1.632723, 0, 0, 0, 1, 1,
1.036302, 0.02762416, 1.256534, 1, 1, 1, 1, 1,
1.036656, 0.7011395, 1.590449, 1, 1, 1, 1, 1,
1.037089, -1.867898, 2.152545, 1, 1, 1, 1, 1,
1.037128, -1.066725, 2.480953, 1, 1, 1, 1, 1,
1.037558, 0.73843, 1.89237, 1, 1, 1, 1, 1,
1.0384, 0.9756127, 1.176976, 1, 1, 1, 1, 1,
1.042474, 1.09645, 0.8131607, 1, 1, 1, 1, 1,
1.045163, 0.4062361, 0.5157099, 1, 1, 1, 1, 1,
1.046384, -0.4690063, 0.9384677, 1, 1, 1, 1, 1,
1.047411, -0.3107625, 2.264397, 1, 1, 1, 1, 1,
1.051316, -0.01394887, -0.6068724, 1, 1, 1, 1, 1,
1.066915, -0.2276179, 2.539936, 1, 1, 1, 1, 1,
1.077684, 0.007837939, 2.011873, 1, 1, 1, 1, 1,
1.082129, 0.4041372, 1.710111, 1, 1, 1, 1, 1,
1.088598, 0.9558429, 1.031103, 1, 1, 1, 1, 1,
1.097227, 0.1473024, 2.592618, 0, 0, 1, 1, 1,
1.099657, 0.3750429, 1.026661, 1, 0, 0, 1, 1,
1.111358, 1.597197, -0.4505066, 1, 0, 0, 1, 1,
1.120028, -0.1443794, 2.073329, 1, 0, 0, 1, 1,
1.121696, -0.7205229, 1.876991, 1, 0, 0, 1, 1,
1.123377, 0.2682296, 1.050322, 1, 0, 0, 1, 1,
1.130045, 0.897364, 0.8717456, 0, 0, 0, 1, 1,
1.16439, 0.5362282, 1.598427, 0, 0, 0, 1, 1,
1.166324, -0.4887047, 0.04405676, 0, 0, 0, 1, 1,
1.168937, -0.4462101, 0.762634, 0, 0, 0, 1, 1,
1.171758, -0.8724767, 2.15225, 0, 0, 0, 1, 1,
1.180013, 0.8999209, 2.621321, 0, 0, 0, 1, 1,
1.19, 0.6148559, 1.094791, 0, 0, 0, 1, 1,
1.191732, 0.01370428, 1.998992, 1, 1, 1, 1, 1,
1.195808, -0.0008906274, 2.505438, 1, 1, 1, 1, 1,
1.197405, 0.9855669, 1.023798, 1, 1, 1, 1, 1,
1.201366, 1.203636, 1.265286, 1, 1, 1, 1, 1,
1.207128, -0.5951054, 0.8850382, 1, 1, 1, 1, 1,
1.209137, 0.77438, 0.5020712, 1, 1, 1, 1, 1,
1.210047, 0.2230057, 0.5069436, 1, 1, 1, 1, 1,
1.233377, -0.1052571, 1.165374, 1, 1, 1, 1, 1,
1.237541, -0.7832792, 1.874154, 1, 1, 1, 1, 1,
1.248302, 0.3603558, 1.94162, 1, 1, 1, 1, 1,
1.250484, -0.7181642, 5.540991, 1, 1, 1, 1, 1,
1.256432, -0.9858241, 1.844719, 1, 1, 1, 1, 1,
1.257269, 0.5299527, 0.1274574, 1, 1, 1, 1, 1,
1.267328, 1.432163, 1.860772, 1, 1, 1, 1, 1,
1.272734, -0.2858559, 3.696354, 1, 1, 1, 1, 1,
1.282204, -0.3521255, 1.160423, 0, 0, 1, 1, 1,
1.284574, -0.08969068, 1.077123, 1, 0, 0, 1, 1,
1.28677, 0.08363862, 0.6005356, 1, 0, 0, 1, 1,
1.302817, -0.3557169, 3.117515, 1, 0, 0, 1, 1,
1.303331, -0.2275452, 4.935883, 1, 0, 0, 1, 1,
1.308623, -0.5360163, 3.433474, 1, 0, 0, 1, 1,
1.310757, -1.191932, 3.860228, 0, 0, 0, 1, 1,
1.318102, -0.9347015, 0.8785953, 0, 0, 0, 1, 1,
1.319167, 0.7015421, 1.350029, 0, 0, 0, 1, 1,
1.324034, 1.088173, 0.1694607, 0, 0, 0, 1, 1,
1.326664, -0.2398716, 1.424638, 0, 0, 0, 1, 1,
1.32847, 1.660898, -0.07179239, 0, 0, 0, 1, 1,
1.344115, 0.6836644, -0.0770978, 0, 0, 0, 1, 1,
1.349679, -1.070636, 0.5618922, 1, 1, 1, 1, 1,
1.355487, 0.3900297, 1.870394, 1, 1, 1, 1, 1,
1.355774, 1.491537, 1.920042, 1, 1, 1, 1, 1,
1.357289, -0.02483153, 1.410953, 1, 1, 1, 1, 1,
1.361951, 2.12306, 1.511543, 1, 1, 1, 1, 1,
1.370692, 1.478577, -0.5208284, 1, 1, 1, 1, 1,
1.372314, -0.5162868, 1.010585, 1, 1, 1, 1, 1,
1.38016, -0.7347947, 0.1628069, 1, 1, 1, 1, 1,
1.387167, 1.72657, 0.5622892, 1, 1, 1, 1, 1,
1.391528, -1.692277, 1.425696, 1, 1, 1, 1, 1,
1.398998, 0.6963139, 0.08371721, 1, 1, 1, 1, 1,
1.400804, 0.9821457, 1.609362, 1, 1, 1, 1, 1,
1.413723, -0.1100098, 2.340505, 1, 1, 1, 1, 1,
1.419157, 1.39405, 1.409583, 1, 1, 1, 1, 1,
1.423496, -0.2893789, 0.8779246, 1, 1, 1, 1, 1,
1.445081, 0.684741, 1.337934, 0, 0, 1, 1, 1,
1.448365, -1.160295, 0.6353875, 1, 0, 0, 1, 1,
1.451601, 1.406901, 0.6573383, 1, 0, 0, 1, 1,
1.460209, 0.7792538, -0.2285951, 1, 0, 0, 1, 1,
1.472121, -1.762728, 5.330485, 1, 0, 0, 1, 1,
1.474365, 0.7882782, 1.308537, 1, 0, 0, 1, 1,
1.475216, -0.02281242, 0.5945982, 0, 0, 0, 1, 1,
1.486499, 1.107948, 0.0164719, 0, 0, 0, 1, 1,
1.489116, -0.3908946, 3.112937, 0, 0, 0, 1, 1,
1.496063, 0.3721336, -0.7501893, 0, 0, 0, 1, 1,
1.496475, 0.1430082, 2.599705, 0, 0, 0, 1, 1,
1.512935, -0.4990265, 1.305286, 0, 0, 0, 1, 1,
1.519818, -2.165376, 4.453249, 0, 0, 0, 1, 1,
1.527193, 0.6076283, -0.2653448, 1, 1, 1, 1, 1,
1.539626, -1.495581, 1.021803, 1, 1, 1, 1, 1,
1.543443, 2.40462, 0.6211534, 1, 1, 1, 1, 1,
1.543741, -1.064337, 4.798523, 1, 1, 1, 1, 1,
1.564539, 1.223311, 1.469314, 1, 1, 1, 1, 1,
1.569896, -1.733441, 1.045512, 1, 1, 1, 1, 1,
1.584864, -3.249807, 2.532924, 1, 1, 1, 1, 1,
1.588674, -0.1110743, 2.194719, 1, 1, 1, 1, 1,
1.598842, -0.2171262, 1.446763, 1, 1, 1, 1, 1,
1.612601, 0.7377955, 1.881617, 1, 1, 1, 1, 1,
1.63265, 0.2147955, 1.354705, 1, 1, 1, 1, 1,
1.636931, -0.005359641, 1.56944, 1, 1, 1, 1, 1,
1.652342, 0.5548439, 2.733585, 1, 1, 1, 1, 1,
1.661092, 0.05814909, 1.629699, 1, 1, 1, 1, 1,
1.661775, -0.4010307, 0.2923776, 1, 1, 1, 1, 1,
1.678179, -0.2187127, 0.9479119, 0, 0, 1, 1, 1,
1.678883, 0.9430249, 1.28242, 1, 0, 0, 1, 1,
1.685833, -0.9780993, 1.762579, 1, 0, 0, 1, 1,
1.707569, 0.6402405, 1.418808, 1, 0, 0, 1, 1,
1.72117, 0.09142458, 1.954569, 1, 0, 0, 1, 1,
1.743734, 0.5645448, 2.567291, 1, 0, 0, 1, 1,
1.749372, -0.5573466, 1.459382, 0, 0, 0, 1, 1,
1.768255, 2.515455, 1.926966, 0, 0, 0, 1, 1,
1.817362, -2.086244, 2.233607, 0, 0, 0, 1, 1,
1.844328, 1.718958, 0.5471875, 0, 0, 0, 1, 1,
1.847873, 2.088389, 2.236063, 0, 0, 0, 1, 1,
1.870062, -1.082508, 2.169667, 0, 0, 0, 1, 1,
1.906044, -0.2478311, 0.4597766, 0, 0, 0, 1, 1,
1.955364, 0.07701604, 1.104308, 1, 1, 1, 1, 1,
1.963878, -0.7678382, 0.1913377, 1, 1, 1, 1, 1,
1.966627, -0.1610829, 0.8763259, 1, 1, 1, 1, 1,
1.97507, 0.04841204, 2.116834, 1, 1, 1, 1, 1,
1.98527, 0.124238, 2.173558, 1, 1, 1, 1, 1,
1.989693, 0.2146958, 0.1513412, 1, 1, 1, 1, 1,
1.9978, 0.6773433, 1.471988, 1, 1, 1, 1, 1,
1.997977, 0.6348352, 0.7289377, 1, 1, 1, 1, 1,
2.000979, 0.6653373, 0.998068, 1, 1, 1, 1, 1,
2.005783, 0.06279042, 0.3809897, 1, 1, 1, 1, 1,
2.02918, -0.7102664, 1.696736, 1, 1, 1, 1, 1,
2.110736, -0.6496427, 1.490887, 1, 1, 1, 1, 1,
2.122486, -2.014944, 1.857728, 1, 1, 1, 1, 1,
2.140241, -1.062086, 2.157962, 1, 1, 1, 1, 1,
2.161196, 0.9873087, 0.4675392, 1, 1, 1, 1, 1,
2.168458, -0.4474183, 3.787515, 0, 0, 1, 1, 1,
2.185381, -1.107508, 1.157104, 1, 0, 0, 1, 1,
2.186669, -0.3506823, 1.820554, 1, 0, 0, 1, 1,
2.187231, 0.4492632, 0.8466323, 1, 0, 0, 1, 1,
2.217236, 1.367706, -0.5912381, 1, 0, 0, 1, 1,
2.228492, 1.759373, 3.52368, 1, 0, 0, 1, 1,
2.275373, -2.3585, 1.762891, 0, 0, 0, 1, 1,
2.311237, 0.0175196, 1.888283, 0, 0, 0, 1, 1,
2.321285, -0.2977913, 0.9884626, 0, 0, 0, 1, 1,
2.343679, 1.278421, 1.615512, 0, 0, 0, 1, 1,
2.348714, 1.050076, 0.7980499, 0, 0, 0, 1, 1,
2.417006, -0.929085, 3.187762, 0, 0, 0, 1, 1,
2.450173, -0.6921383, 0.9614992, 0, 0, 0, 1, 1,
2.575424, -1.430308, 3.118014, 1, 1, 1, 1, 1,
2.653267, 0.8061463, -1.102761, 1, 1, 1, 1, 1,
2.712505, -0.1899842, 1.945916, 1, 1, 1, 1, 1,
2.739939, 0.5268996, 1.158922, 1, 1, 1, 1, 1,
2.755931, -0.4925166, 2.64053, 1, 1, 1, 1, 1,
3.082931, 1.222688, 0.9896409, 1, 1, 1, 1, 1,
3.27176, 2.225435, 0.853501, 1, 1, 1, 1, 1
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
var radius = 9.70107;
var distance = 34.07459;
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
mvMatrix.translate( 0.2396348, 0.1645863, -0.2048423 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.07459);
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
