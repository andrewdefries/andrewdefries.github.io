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
-3.063999, -0.4041414, -3.341685, 1, 0, 0, 1,
-2.918769, 1.635016, -1.177, 1, 0.007843138, 0, 1,
-2.734626, 2.436657, 0.1328435, 1, 0.01176471, 0, 1,
-2.666161, -0.7089922, -1.784221, 1, 0.01960784, 0, 1,
-2.595089, 0.7737485, -1.302459, 1, 0.02352941, 0, 1,
-2.585864, 1.595212, -0.6698638, 1, 0.03137255, 0, 1,
-2.553263, 1.012231, -1.304147, 1, 0.03529412, 0, 1,
-2.551453, 1.978194, 0.388717, 1, 0.04313726, 0, 1,
-2.537999, -0.6150638, -1.859298, 1, 0.04705882, 0, 1,
-2.46332, 1.135566, -1.02834, 1, 0.05490196, 0, 1,
-2.314023, 1.687091, -2.128629, 1, 0.05882353, 0, 1,
-2.24838, -3.127666, -2.570804, 1, 0.06666667, 0, 1,
-2.244195, -1.305896, -1.044886, 1, 0.07058824, 0, 1,
-2.203623, -0.6554556, -1.697765, 1, 0.07843138, 0, 1,
-2.184291, -1.388189, -3.435503, 1, 0.08235294, 0, 1,
-2.179224, -0.3448201, -2.926084, 1, 0.09019608, 0, 1,
-2.131708, -0.1430168, -0.3375435, 1, 0.09411765, 0, 1,
-2.11699, -0.27757, -1.340913, 1, 0.1019608, 0, 1,
-2.024979, -0.06600705, -0.6294471, 1, 0.1098039, 0, 1,
-2.008316, -0.7182786, -4.866384, 1, 0.1137255, 0, 1,
-1.963609, -1.67975, -1.703742, 1, 0.1215686, 0, 1,
-1.946795, -0.8522217, -2.643649, 1, 0.1254902, 0, 1,
-1.938223, 1.491565, -1.240205, 1, 0.1333333, 0, 1,
-1.91091, -0.6978915, -1.123035, 1, 0.1372549, 0, 1,
-1.891406, -0.468179, -2.167056, 1, 0.145098, 0, 1,
-1.886173, -0.4763837, -1.742448, 1, 0.1490196, 0, 1,
-1.879539, 1.410629, -1.135615, 1, 0.1568628, 0, 1,
-1.877709, -0.4560118, -3.151783, 1, 0.1607843, 0, 1,
-1.875785, 1.271112, 0.3515299, 1, 0.1686275, 0, 1,
-1.826653, -1.081583, -2.905479, 1, 0.172549, 0, 1,
-1.826048, 0.5362653, -1.433876, 1, 0.1803922, 0, 1,
-1.823786, -0.3790709, -0.03506574, 1, 0.1843137, 0, 1,
-1.817491, 0.5273446, -1.106848, 1, 0.1921569, 0, 1,
-1.815998, -0.6822618, -3.681878, 1, 0.1960784, 0, 1,
-1.803591, -0.3597211, -5.018279, 1, 0.2039216, 0, 1,
-1.788945, 0.1892182, -1.395888, 1, 0.2117647, 0, 1,
-1.784431, 0.9650535, -0.2497243, 1, 0.2156863, 0, 1,
-1.77268, 2.162836, -2.921674, 1, 0.2235294, 0, 1,
-1.77006, 1.318484, -0.3710998, 1, 0.227451, 0, 1,
-1.760576, 0.8672313, -1.153289, 1, 0.2352941, 0, 1,
-1.756956, 0.08484504, -0.387375, 1, 0.2392157, 0, 1,
-1.735586, 0.2737565, 0.3037462, 1, 0.2470588, 0, 1,
-1.715127, 2.114494, -1.310163, 1, 0.2509804, 0, 1,
-1.701909, 0.1157577, -0.393602, 1, 0.2588235, 0, 1,
-1.689859, 1.815567, -1.033565, 1, 0.2627451, 0, 1,
-1.68961, -1.095587, -1.723238, 1, 0.2705882, 0, 1,
-1.685736, 0.4061159, -1.033941, 1, 0.2745098, 0, 1,
-1.675799, 1.278672, -2.040672, 1, 0.282353, 0, 1,
-1.663189, 0.2436434, -0.6005905, 1, 0.2862745, 0, 1,
-1.651506, -0.1329466, -2.693435, 1, 0.2941177, 0, 1,
-1.647357, 1.64189, -1.186663, 1, 0.3019608, 0, 1,
-1.641592, 1.9348, 0.2188404, 1, 0.3058824, 0, 1,
-1.639159, -0.1693819, -1.459109, 1, 0.3137255, 0, 1,
-1.637837, -1.345286, -2.962528, 1, 0.3176471, 0, 1,
-1.635267, -0.595252, -1.435855, 1, 0.3254902, 0, 1,
-1.620965, -1.231052, -2.720567, 1, 0.3294118, 0, 1,
-1.615491, 0.63754, -1.143336, 1, 0.3372549, 0, 1,
-1.611311, 0.05730473, -0.553561, 1, 0.3411765, 0, 1,
-1.60976, 0.8353466, -1.005139, 1, 0.3490196, 0, 1,
-1.597041, -0.7659113, -2.123358, 1, 0.3529412, 0, 1,
-1.590894, 0.1296889, -0.5289809, 1, 0.3607843, 0, 1,
-1.571331, 1.793644, -0.4716703, 1, 0.3647059, 0, 1,
-1.569929, -0.672585, -1.913592, 1, 0.372549, 0, 1,
-1.569321, -0.3098091, -0.6600326, 1, 0.3764706, 0, 1,
-1.568862, 0.5380647, -2.074898, 1, 0.3843137, 0, 1,
-1.558868, -0.8255858, -4.221644, 1, 0.3882353, 0, 1,
-1.551342, 0.9484459, -0.9381, 1, 0.3960784, 0, 1,
-1.548936, -0.700412, -3.193353, 1, 0.4039216, 0, 1,
-1.545806, 0.9764597, -0.8595178, 1, 0.4078431, 0, 1,
-1.541339, -1.019505, -2.760594, 1, 0.4156863, 0, 1,
-1.535206, 0.3210855, -0.8751934, 1, 0.4196078, 0, 1,
-1.525531, 0.03603065, -1.599461, 1, 0.427451, 0, 1,
-1.500213, 1.063612, -0.7210427, 1, 0.4313726, 0, 1,
-1.499791, -1.564963, -3.652801, 1, 0.4392157, 0, 1,
-1.483069, -0.8378118, -3.366256, 1, 0.4431373, 0, 1,
-1.481718, 0.1701596, -1.894475, 1, 0.4509804, 0, 1,
-1.477316, 0.6396368, -1.205343, 1, 0.454902, 0, 1,
-1.461319, 2.523127, -0.4658348, 1, 0.4627451, 0, 1,
-1.455532, -0.3442347, -1.88195, 1, 0.4666667, 0, 1,
-1.446736, 0.7210408, -1.51011, 1, 0.4745098, 0, 1,
-1.441458, -1.344298, -3.081157, 1, 0.4784314, 0, 1,
-1.440589, 1.398394, -1.005233, 1, 0.4862745, 0, 1,
-1.428216, 0.4716996, -2.084587, 1, 0.4901961, 0, 1,
-1.408566, -1.299812, -1.983087, 1, 0.4980392, 0, 1,
-1.395262, 0.667701, 0.2916062, 1, 0.5058824, 0, 1,
-1.381209, 0.2094099, -1.575274, 1, 0.509804, 0, 1,
-1.376308, -0.01712942, -1.386661, 1, 0.5176471, 0, 1,
-1.373457, -0.8222408, -3.28738, 1, 0.5215687, 0, 1,
-1.372319, 0.5586166, 0.7491916, 1, 0.5294118, 0, 1,
-1.358338, 0.1996214, -2.405975, 1, 0.5333334, 0, 1,
-1.356342, -2.869644, -1.774729, 1, 0.5411765, 0, 1,
-1.356163, 2.089859, -2.585934, 1, 0.5450981, 0, 1,
-1.350901, -0.7489782, -1.327422, 1, 0.5529412, 0, 1,
-1.350685, -0.3559751, -2.764204, 1, 0.5568628, 0, 1,
-1.338961, 1.479329, -3.092466, 1, 0.5647059, 0, 1,
-1.336381, 0.06406288, -1.586896, 1, 0.5686275, 0, 1,
-1.317454, -0.8278861, -2.154286, 1, 0.5764706, 0, 1,
-1.314613, -1.029668, -3.413013, 1, 0.5803922, 0, 1,
-1.31276, 0.141115, -2.38253, 1, 0.5882353, 0, 1,
-1.307362, -0.5117446, -4.2533, 1, 0.5921569, 0, 1,
-1.296446, -1.012218, -3.220301, 1, 0.6, 0, 1,
-1.294078, 2.447599, -0.443797, 1, 0.6078432, 0, 1,
-1.290643, 2.781618, 0.6407697, 1, 0.6117647, 0, 1,
-1.285765, -0.1450559, -2.136798, 1, 0.6196079, 0, 1,
-1.273698, 1.065315, -2.015761, 1, 0.6235294, 0, 1,
-1.269739, -0.4981741, -3.210841, 1, 0.6313726, 0, 1,
-1.25903, -0.03726644, -0.3701478, 1, 0.6352941, 0, 1,
-1.252217, -1.540163, -1.062815, 1, 0.6431373, 0, 1,
-1.244005, 0.7241687, -1.155164, 1, 0.6470588, 0, 1,
-1.242619, 1.360504, -0.04147242, 1, 0.654902, 0, 1,
-1.24109, 0.030675, -1.58307, 1, 0.6588235, 0, 1,
-1.237013, 0.9396684, -0.3165822, 1, 0.6666667, 0, 1,
-1.229986, 0.847416, 0.8316365, 1, 0.6705883, 0, 1,
-1.229771, 0.6362172, -1.263473, 1, 0.6784314, 0, 1,
-1.225825, -1.320442, -3.795931, 1, 0.682353, 0, 1,
-1.222953, -1.102117, -2.200301, 1, 0.6901961, 0, 1,
-1.219791, -0.4075744, -2.62942, 1, 0.6941177, 0, 1,
-1.216912, -0.4321965, 1.015039, 1, 0.7019608, 0, 1,
-1.216152, -0.1301423, -2.972524, 1, 0.7098039, 0, 1,
-1.202026, -0.7630766, -0.8618627, 1, 0.7137255, 0, 1,
-1.199585, -0.4914679, -2.136942, 1, 0.7215686, 0, 1,
-1.190177, 1.545509, -0.8069001, 1, 0.7254902, 0, 1,
-1.187784, -0.487888, -2.892252, 1, 0.7333333, 0, 1,
-1.185072, -0.6748528, -2.521445, 1, 0.7372549, 0, 1,
-1.179016, 1.14485, -1.445789, 1, 0.7450981, 0, 1,
-1.177182, -1.578302, -3.313739, 1, 0.7490196, 0, 1,
-1.167867, 1.197452, -1.27972, 1, 0.7568628, 0, 1,
-1.161445, 0.1087377, -0.4257521, 1, 0.7607843, 0, 1,
-1.150769, 0.8692203, -0.8502293, 1, 0.7686275, 0, 1,
-1.139989, -0.07817145, -1.802786, 1, 0.772549, 0, 1,
-1.13194, 0.6999239, -2.339776, 1, 0.7803922, 0, 1,
-1.112662, -0.2360297, -0.9013704, 1, 0.7843137, 0, 1,
-1.10841, 0.6273693, -1.096189, 1, 0.7921569, 0, 1,
-1.105452, -1.194864, -2.044043, 1, 0.7960784, 0, 1,
-1.100491, -1.281639, -3.086869, 1, 0.8039216, 0, 1,
-1.094932, -0.8619606, -1.48884, 1, 0.8117647, 0, 1,
-1.094317, 0.03579553, -1.933259, 1, 0.8156863, 0, 1,
-1.09287, -1.589718, -4.396979, 1, 0.8235294, 0, 1,
-1.089597, -1.041337, -0.4721133, 1, 0.827451, 0, 1,
-1.088584, 0.6731764, -0.5686386, 1, 0.8352941, 0, 1,
-1.086562, 0.1096835, -2.268251, 1, 0.8392157, 0, 1,
-1.079372, 1.214973, -1.286188, 1, 0.8470588, 0, 1,
-1.073138, -0.634195, -3.51086, 1, 0.8509804, 0, 1,
-1.064118, 2.369872, -1.926065, 1, 0.8588235, 0, 1,
-1.059438, 0.1402486, -2.788966, 1, 0.8627451, 0, 1,
-1.055036, -1.225773, -2.148284, 1, 0.8705882, 0, 1,
-1.054937, -0.3363404, -2.164224, 1, 0.8745098, 0, 1,
-1.051181, -1.414436, -1.217057, 1, 0.8823529, 0, 1,
-1.047392, 0.3264627, -1.1042, 1, 0.8862745, 0, 1,
-1.037899, 0.1736444, -2.988411, 1, 0.8941177, 0, 1,
-1.035921, 1.887184, 0.6131497, 1, 0.8980392, 0, 1,
-1.035118, -0.4725224, -1.040456, 1, 0.9058824, 0, 1,
-1.034118, -0.4236979, -1.620394, 1, 0.9137255, 0, 1,
-1.030451, -0.03205505, -2.637405, 1, 0.9176471, 0, 1,
-1.028873, 1.347664, -0.3922735, 1, 0.9254902, 0, 1,
-1.023682, -1.331681, -2.393401, 1, 0.9294118, 0, 1,
-1.022493, 1.822059, -0.9886825, 1, 0.9372549, 0, 1,
-1.021434, -0.06455624, -1.918592, 1, 0.9411765, 0, 1,
-1.000806, -0.6090876, -1.077486, 1, 0.9490196, 0, 1,
-0.9998197, -0.1781431, -2.338985, 1, 0.9529412, 0, 1,
-0.9937239, -0.1643438, -1.467865, 1, 0.9607843, 0, 1,
-0.9930583, -0.9120156, -3.943143, 1, 0.9647059, 0, 1,
-0.9897616, -0.3551993, -3.582475, 1, 0.972549, 0, 1,
-0.9867705, -0.1442288, -2.152496, 1, 0.9764706, 0, 1,
-0.9860314, 1.225457, -0.9175015, 1, 0.9843137, 0, 1,
-0.984219, 0.1892364, -1.615362, 1, 0.9882353, 0, 1,
-0.9830292, 0.2536115, -2.23088, 1, 0.9960784, 0, 1,
-0.9828292, 0.0642677, -2.75366, 0.9960784, 1, 0, 1,
-0.9760182, -0.3628209, -1.936466, 0.9921569, 1, 0, 1,
-0.9738925, -0.08519872, -0.8128633, 0.9843137, 1, 0, 1,
-0.9721964, 1.502797, 0.3668508, 0.9803922, 1, 0, 1,
-0.9690555, 0.5385329, -1.967114, 0.972549, 1, 0, 1,
-0.96394, 0.3898368, -1.397485, 0.9686275, 1, 0, 1,
-0.9614058, 1.680507, -0.225452, 0.9607843, 1, 0, 1,
-0.9536639, -0.3497573, -1.521235, 0.9568627, 1, 0, 1,
-0.9495903, -0.4189171, -2.706636, 0.9490196, 1, 0, 1,
-0.9435164, -0.6264612, -0.8009928, 0.945098, 1, 0, 1,
-0.9431281, 1.165981, -1.415006, 0.9372549, 1, 0, 1,
-0.9390317, -0.2188308, -2.66914, 0.9333333, 1, 0, 1,
-0.9385438, 0.4465788, -1.812828, 0.9254902, 1, 0, 1,
-0.9361635, 1.525468, -0.3304482, 0.9215686, 1, 0, 1,
-0.9348937, -0.2152861, -1.331879, 0.9137255, 1, 0, 1,
-0.9240162, -2.28927, -2.163298, 0.9098039, 1, 0, 1,
-0.9236354, 0.094505, -2.065752, 0.9019608, 1, 0, 1,
-0.9218488, -1.447936, -3.404696, 0.8941177, 1, 0, 1,
-0.9096, 0.6706035, -0.383896, 0.8901961, 1, 0, 1,
-0.9087561, -0.009670764, -2.322466, 0.8823529, 1, 0, 1,
-0.9079208, 0.2639156, 0.1289467, 0.8784314, 1, 0, 1,
-0.9057453, 1.130277, 0.1883129, 0.8705882, 1, 0, 1,
-0.9010118, 0.5449826, -0.6556429, 0.8666667, 1, 0, 1,
-0.8960174, 0.1008242, -0.956377, 0.8588235, 1, 0, 1,
-0.8773544, 0.8235148, -2.274544, 0.854902, 1, 0, 1,
-0.872287, 0.3469778, -0.76731, 0.8470588, 1, 0, 1,
-0.8648174, 1.636535, -0.4367512, 0.8431373, 1, 0, 1,
-0.8639121, -0.8273851, -2.735147, 0.8352941, 1, 0, 1,
-0.8636583, -1.644267, -3.768382, 0.8313726, 1, 0, 1,
-0.8633817, -1.917992, -2.45407, 0.8235294, 1, 0, 1,
-0.8606115, -0.8324605, -2.601599, 0.8196079, 1, 0, 1,
-0.8591413, -0.6899783, -3.427713, 0.8117647, 1, 0, 1,
-0.8509066, 0.8817163, -0.05815119, 0.8078431, 1, 0, 1,
-0.8505121, -0.8311701, -1.996952, 0.8, 1, 0, 1,
-0.8450602, -1.18232, -2.532613, 0.7921569, 1, 0, 1,
-0.8420396, -0.3922507, -1.791846, 0.7882353, 1, 0, 1,
-0.8385721, -0.8495259, -1.413335, 0.7803922, 1, 0, 1,
-0.8312887, 0.4424891, -3.104569, 0.7764706, 1, 0, 1,
-0.8281507, 0.04138331, -1.915246, 0.7686275, 1, 0, 1,
-0.8208145, -0.5599453, -0.5084628, 0.7647059, 1, 0, 1,
-0.8196155, 0.5782728, -0.1553462, 0.7568628, 1, 0, 1,
-0.8185809, 0.1347412, -1.862837, 0.7529412, 1, 0, 1,
-0.8181384, 1.115221, -0.4147799, 0.7450981, 1, 0, 1,
-0.8161672, 2.854376, -0.6131905, 0.7411765, 1, 0, 1,
-0.8108895, -2.195931, -2.927068, 0.7333333, 1, 0, 1,
-0.8054897, 0.1530796, -2.502917, 0.7294118, 1, 0, 1,
-0.8032392, -0.08620963, -1.61486, 0.7215686, 1, 0, 1,
-0.8025725, -0.7809321, -1.84922, 0.7176471, 1, 0, 1,
-0.7986489, 0.1304912, -2.163249, 0.7098039, 1, 0, 1,
-0.7862547, -0.387107, -2.23861, 0.7058824, 1, 0, 1,
-0.7813223, -0.5429101, -1.752711, 0.6980392, 1, 0, 1,
-0.7782567, -1.61974, -1.477143, 0.6901961, 1, 0, 1,
-0.7763228, 0.3637584, -1.566378, 0.6862745, 1, 0, 1,
-0.7759445, 0.6889906, -0.5216328, 0.6784314, 1, 0, 1,
-0.7748501, -0.7404845, -2.978581, 0.6745098, 1, 0, 1,
-0.7711588, -1.032009, -1.163268, 0.6666667, 1, 0, 1,
-0.7710388, -0.1937879, -1.439357, 0.6627451, 1, 0, 1,
-0.7604232, -1.499537, -1.970965, 0.654902, 1, 0, 1,
-0.7532145, 0.9672148, 0.6343202, 0.6509804, 1, 0, 1,
-0.75236, 0.736411, -0.9104475, 0.6431373, 1, 0, 1,
-0.7507139, 2.132535, 0.3503227, 0.6392157, 1, 0, 1,
-0.7425895, -1.026165, -3.261718, 0.6313726, 1, 0, 1,
-0.7372884, 0.9369468, 0.3632606, 0.627451, 1, 0, 1,
-0.7361385, 1.461659, 0.8372774, 0.6196079, 1, 0, 1,
-0.7351315, -1.320396, -2.948819, 0.6156863, 1, 0, 1,
-0.7324209, 0.366704, -2.229778, 0.6078432, 1, 0, 1,
-0.7320155, -1.205796, -1.764763, 0.6039216, 1, 0, 1,
-0.7264451, -0.7729607, -2.942537, 0.5960785, 1, 0, 1,
-0.7260844, 0.1078314, -1.287189, 0.5882353, 1, 0, 1,
-0.7192801, -0.59025, -3.062339, 0.5843138, 1, 0, 1,
-0.7135342, 0.9642159, 0.7798671, 0.5764706, 1, 0, 1,
-0.7066069, 0.3552871, -1.410625, 0.572549, 1, 0, 1,
-0.7057593, -1.627629, -3.846592, 0.5647059, 1, 0, 1,
-0.703961, 0.1156663, 0.327929, 0.5607843, 1, 0, 1,
-0.6934369, 1.229314, -1.098099, 0.5529412, 1, 0, 1,
-0.6907199, 0.6004221, -0.5972638, 0.5490196, 1, 0, 1,
-0.6896735, -0.02008547, -2.228675, 0.5411765, 1, 0, 1,
-0.6844847, 0.1593011, -1.679142, 0.5372549, 1, 0, 1,
-0.6828723, 0.1217366, -2.377077, 0.5294118, 1, 0, 1,
-0.6817051, -0.1724862, 0.4555145, 0.5254902, 1, 0, 1,
-0.6765421, -0.293535, -2.126037, 0.5176471, 1, 0, 1,
-0.6734716, -0.06495094, -3.701744, 0.5137255, 1, 0, 1,
-0.6721427, 0.7954791, -2.128189, 0.5058824, 1, 0, 1,
-0.6669512, 1.823512, 0.9322596, 0.5019608, 1, 0, 1,
-0.6622586, 1.033391, -2.613439, 0.4941176, 1, 0, 1,
-0.660825, 0.4349792, -0.1319162, 0.4862745, 1, 0, 1,
-0.657317, -1.146811, -2.285442, 0.4823529, 1, 0, 1,
-0.6483104, 1.701573, 0.4795808, 0.4745098, 1, 0, 1,
-0.6431829, -1.918724, -0.5704743, 0.4705882, 1, 0, 1,
-0.6429155, 0.9668819, -1.27754, 0.4627451, 1, 0, 1,
-0.6418561, 1.032292, 0.4080875, 0.4588235, 1, 0, 1,
-0.639006, -1.365687, -2.367063, 0.4509804, 1, 0, 1,
-0.6375417, -0.1734329, -0.005083793, 0.4470588, 1, 0, 1,
-0.6347781, -0.7896475, -1.940343, 0.4392157, 1, 0, 1,
-0.6299362, 0.6966487, 0.1869189, 0.4352941, 1, 0, 1,
-0.6286054, 1.32905, -0.3984661, 0.427451, 1, 0, 1,
-0.6264365, 1.148845, 0.5987257, 0.4235294, 1, 0, 1,
-0.623545, -1.362289, -1.074446, 0.4156863, 1, 0, 1,
-0.6228681, 0.1754288, -1.861707, 0.4117647, 1, 0, 1,
-0.6162761, -0.04520889, -2.8419, 0.4039216, 1, 0, 1,
-0.6146468, 0.9807877, -0.8016198, 0.3960784, 1, 0, 1,
-0.6103801, -0.6120448, -1.934718, 0.3921569, 1, 0, 1,
-0.6082669, 0.6765931, -0.6343735, 0.3843137, 1, 0, 1,
-0.6060288, -0.5821712, -1.635138, 0.3803922, 1, 0, 1,
-0.5990797, -0.77126, -2.717774, 0.372549, 1, 0, 1,
-0.5979131, -1.080466, -3.27986, 0.3686275, 1, 0, 1,
-0.596167, -1.323143, -4.19469, 0.3607843, 1, 0, 1,
-0.5929005, -0.03251661, -0.7133622, 0.3568628, 1, 0, 1,
-0.592272, 0.9715474, -0.245718, 0.3490196, 1, 0, 1,
-0.5911707, -0.5257908, -2.221116, 0.345098, 1, 0, 1,
-0.590883, -1.240931, -3.174768, 0.3372549, 1, 0, 1,
-0.589869, -0.02651339, -2.367847, 0.3333333, 1, 0, 1,
-0.588895, -0.4916797, -2.288505, 0.3254902, 1, 0, 1,
-0.5880023, 0.03778283, -1.891095, 0.3215686, 1, 0, 1,
-0.5678557, 0.1082165, -0.7853284, 0.3137255, 1, 0, 1,
-0.567118, 0.4486354, -2.337126, 0.3098039, 1, 0, 1,
-0.5668476, -0.1330014, -1.702852, 0.3019608, 1, 0, 1,
-0.5662885, -0.6456068, -0.8353884, 0.2941177, 1, 0, 1,
-0.5610203, 1.605069, 0.3530919, 0.2901961, 1, 0, 1,
-0.538429, -0.358723, -1.390333, 0.282353, 1, 0, 1,
-0.5338414, -0.768458, -1.624157, 0.2784314, 1, 0, 1,
-0.5331818, -0.7177173, -2.264591, 0.2705882, 1, 0, 1,
-0.5330866, 1.23552, 1.92191, 0.2666667, 1, 0, 1,
-0.5295994, 0.6693652, -1.682224, 0.2588235, 1, 0, 1,
-0.526655, 0.6943954, -1.539635, 0.254902, 1, 0, 1,
-0.5233959, -0.1887521, -1.174785, 0.2470588, 1, 0, 1,
-0.5185359, 1.116337, -1.100413, 0.2431373, 1, 0, 1,
-0.5163904, 0.08708736, -1.939665, 0.2352941, 1, 0, 1,
-0.5127777, -1.48239, -1.716145, 0.2313726, 1, 0, 1,
-0.5114381, -0.0597176, -1.379456, 0.2235294, 1, 0, 1,
-0.5110459, 0.5973328, -0.9085841, 0.2196078, 1, 0, 1,
-0.5049395, -0.02024754, -1.569459, 0.2117647, 1, 0, 1,
-0.5027769, 1.956337, 0.6006898, 0.2078431, 1, 0, 1,
-0.5023438, -1.234175, -4.248023, 0.2, 1, 0, 1,
-0.4992803, 0.2375446, -3.874357, 0.1921569, 1, 0, 1,
-0.4984108, 0.6502082, -1.393054, 0.1882353, 1, 0, 1,
-0.496432, -0.6625152, -2.874142, 0.1803922, 1, 0, 1,
-0.4958475, 1.305421, 0.1577801, 0.1764706, 1, 0, 1,
-0.4926267, 0.4347404, -0.7372515, 0.1686275, 1, 0, 1,
-0.4787513, 0.4787009, -0.9483169, 0.1647059, 1, 0, 1,
-0.4770189, 1.854791, -0.2631389, 0.1568628, 1, 0, 1,
-0.4735738, -1.472465, -2.647918, 0.1529412, 1, 0, 1,
-0.4734697, -1.304334, -3.846695, 0.145098, 1, 0, 1,
-0.4717014, -0.183805, -2.679279, 0.1411765, 1, 0, 1,
-0.4667877, -0.3025657, -3.9501, 0.1333333, 1, 0, 1,
-0.4601238, 0.2676792, -0.9328039, 0.1294118, 1, 0, 1,
-0.4599944, -1.635328, -2.687935, 0.1215686, 1, 0, 1,
-0.4535691, -0.4918368, -1.832189, 0.1176471, 1, 0, 1,
-0.449161, -1.312007, -3.16963, 0.1098039, 1, 0, 1,
-0.4488766, -0.4866715, -1.298093, 0.1058824, 1, 0, 1,
-0.4459196, -1.315634, -2.970606, 0.09803922, 1, 0, 1,
-0.4455974, -0.0653308, -2.567414, 0.09019608, 1, 0, 1,
-0.4451907, 0.4975282, 0.1627358, 0.08627451, 1, 0, 1,
-0.4445301, 0.8794325, 0.3589597, 0.07843138, 1, 0, 1,
-0.4407046, 1.556064, -0.9122049, 0.07450981, 1, 0, 1,
-0.4404723, -0.8823442, -3.084595, 0.06666667, 1, 0, 1,
-0.4340423, -0.3032124, -3.50202, 0.0627451, 1, 0, 1,
-0.4297826, 0.005777541, -2.665663, 0.05490196, 1, 0, 1,
-0.4219466, 0.1010669, -0.2314734, 0.05098039, 1, 0, 1,
-0.4212896, -2.961531, -2.823606, 0.04313726, 1, 0, 1,
-0.4203138, 0.2567221, -0.743803, 0.03921569, 1, 0, 1,
-0.4182006, 0.6461269, 0.3627803, 0.03137255, 1, 0, 1,
-0.4158957, -1.042161, -2.852593, 0.02745098, 1, 0, 1,
-0.4041616, 0.3153205, 0.397533, 0.01960784, 1, 0, 1,
-0.401368, 0.6419029, -0.9317774, 0.01568628, 1, 0, 1,
-0.4010914, 0.3555017, -0.610113, 0.007843138, 1, 0, 1,
-0.401016, -1.516778, -4.708711, 0.003921569, 1, 0, 1,
-0.399102, 0.2410603, -0.3612764, 0, 1, 0.003921569, 1,
-0.3981928, -1.733869, -3.463851, 0, 1, 0.01176471, 1,
-0.3980434, -0.7914189, -2.255608, 0, 1, 0.01568628, 1,
-0.3964015, -0.08202092, -2.560116, 0, 1, 0.02352941, 1,
-0.3955035, -1.248075, -3.244992, 0, 1, 0.02745098, 1,
-0.3911589, -0.3542201, -2.767525, 0, 1, 0.03529412, 1,
-0.3874443, -0.2042069, -3.064581, 0, 1, 0.03921569, 1,
-0.3849421, 1.351365, 0.6010334, 0, 1, 0.04705882, 1,
-0.3848726, -0.7715818, -2.581463, 0, 1, 0.05098039, 1,
-0.3846664, 0.1407373, -0.07904036, 0, 1, 0.05882353, 1,
-0.3797783, -1.54137, -4.319788, 0, 1, 0.0627451, 1,
-0.3784947, -0.8645245, -3.748812, 0, 1, 0.07058824, 1,
-0.3777148, -1.76504, -3.971574, 0, 1, 0.07450981, 1,
-0.3773699, 0.5220737, -0.2673731, 0, 1, 0.08235294, 1,
-0.3771234, -0.4827399, -2.811846, 0, 1, 0.08627451, 1,
-0.375329, -0.2460991, -1.607688, 0, 1, 0.09411765, 1,
-0.3702754, 0.1494453, -2.364175, 0, 1, 0.1019608, 1,
-0.3646191, 0.3926656, 0.6573752, 0, 1, 0.1058824, 1,
-0.3644633, 0.8740032, -1.666461, 0, 1, 0.1137255, 1,
-0.3631018, 0.6194487, -1.514685, 0, 1, 0.1176471, 1,
-0.3575245, 1.939693, -0.5987704, 0, 1, 0.1254902, 1,
-0.3558739, -0.6788236, -3.346593, 0, 1, 0.1294118, 1,
-0.3554486, 0.2038498, -0.6285557, 0, 1, 0.1372549, 1,
-0.3513524, -0.6687639, -3.656189, 0, 1, 0.1411765, 1,
-0.3510209, 2.416691, 0.1075716, 0, 1, 0.1490196, 1,
-0.3430524, 0.2346695, -2.382208, 0, 1, 0.1529412, 1,
-0.3422509, -0.7723755, -3.728723, 0, 1, 0.1607843, 1,
-0.336976, -1.646113, -1.879495, 0, 1, 0.1647059, 1,
-0.3356701, 1.11249, -1.000631, 0, 1, 0.172549, 1,
-0.333157, -0.9959257, -3.077827, 0, 1, 0.1764706, 1,
-0.3314868, -0.05045951, -0.9581929, 0, 1, 0.1843137, 1,
-0.3305312, -0.8173613, -1.760201, 0, 1, 0.1882353, 1,
-0.3263366, -0.05618728, -0.618581, 0, 1, 0.1960784, 1,
-0.3233896, 0.8900806, -0.2165156, 0, 1, 0.2039216, 1,
-0.3193685, 1.868366, -0.03746744, 0, 1, 0.2078431, 1,
-0.3189673, 0.9884561, -0.0253724, 0, 1, 0.2156863, 1,
-0.3179819, 0.2887835, -2.091473, 0, 1, 0.2196078, 1,
-0.3121479, 0.05890281, -1.409487, 0, 1, 0.227451, 1,
-0.3117586, 0.5478516, -1.600109, 0, 1, 0.2313726, 1,
-0.3096419, 0.2626771, -2.488383, 0, 1, 0.2392157, 1,
-0.3047099, -0.006811411, -1.236565, 0, 1, 0.2431373, 1,
-0.3011352, 0.7406489, -2.781809, 0, 1, 0.2509804, 1,
-0.2996177, 0.003936442, -1.714115, 0, 1, 0.254902, 1,
-0.2983506, -0.3515748, -1.829985, 0, 1, 0.2627451, 1,
-0.2978266, 0.6443908, -0.8121101, 0, 1, 0.2666667, 1,
-0.2934996, -0.9620308, -3.574678, 0, 1, 0.2745098, 1,
-0.2932342, -1.159412, -2.681898, 0, 1, 0.2784314, 1,
-0.2879666, -1.104775, -2.527851, 0, 1, 0.2862745, 1,
-0.2866129, -1.757406, -4.81097, 0, 1, 0.2901961, 1,
-0.2861139, -0.02118811, -1.979825, 0, 1, 0.2980392, 1,
-0.2847729, 0.5842756, -0.7876626, 0, 1, 0.3058824, 1,
-0.2841262, -0.6765589, -6.520528, 0, 1, 0.3098039, 1,
-0.2832353, -1.439143, -3.249334, 0, 1, 0.3176471, 1,
-0.2795208, 0.4095329, -2.540406, 0, 1, 0.3215686, 1,
-0.2785441, -0.640716, -3.971809, 0, 1, 0.3294118, 1,
-0.2758557, -0.4278057, -1.600836, 0, 1, 0.3333333, 1,
-0.2730888, -0.97326, -3.039593, 0, 1, 0.3411765, 1,
-0.2714574, -0.5100808, -2.534253, 0, 1, 0.345098, 1,
-0.2619395, 0.4980227, -1.360738, 0, 1, 0.3529412, 1,
-0.2550056, -2.184175, -2.380553, 0, 1, 0.3568628, 1,
-0.2542818, 0.02414703, -1.246246, 0, 1, 0.3647059, 1,
-0.2515253, 0.4345618, -0.564925, 0, 1, 0.3686275, 1,
-0.2388123, 1.374471, 1.530181, 0, 1, 0.3764706, 1,
-0.234619, 0.6054336, 0.04760928, 0, 1, 0.3803922, 1,
-0.2303738, -0.869652, -2.964945, 0, 1, 0.3882353, 1,
-0.2274606, 0.3629861, 0.05012895, 0, 1, 0.3921569, 1,
-0.2234349, -1.866279, -2.977543, 0, 1, 0.4, 1,
-0.2193187, 1.019327, 0.7219707, 0, 1, 0.4078431, 1,
-0.2166968, -1.729236, -2.66389, 0, 1, 0.4117647, 1,
-0.2157388, 0.3850949, -0.1396155, 0, 1, 0.4196078, 1,
-0.2060941, -0.5960188, -2.447927, 0, 1, 0.4235294, 1,
-0.2044079, 0.1260967, 0.3733761, 0, 1, 0.4313726, 1,
-0.2031843, -0.5687408, -1.036731, 0, 1, 0.4352941, 1,
-0.2024349, -0.1054442, -0.9488987, 0, 1, 0.4431373, 1,
-0.201256, -0.8447152, -2.186097, 0, 1, 0.4470588, 1,
-0.20106, 0.5894179, 0.9988084, 0, 1, 0.454902, 1,
-0.1988665, 1.037911, -0.06053679, 0, 1, 0.4588235, 1,
-0.1971785, -0.5758439, -3.20397, 0, 1, 0.4666667, 1,
-0.1957462, 0.3764957, -1.219563, 0, 1, 0.4705882, 1,
-0.1949545, 1.128775, 0.007958383, 0, 1, 0.4784314, 1,
-0.1916918, -0.3733535, -2.061878, 0, 1, 0.4823529, 1,
-0.1916227, 0.6004025, -1.171257, 0, 1, 0.4901961, 1,
-0.1912125, -1.786546, -3.74161, 0, 1, 0.4941176, 1,
-0.1843621, 1.004924, 0.1937102, 0, 1, 0.5019608, 1,
-0.1779556, -0.2157331, -3.563848, 0, 1, 0.509804, 1,
-0.1761318, 0.6274138, -0.4816101, 0, 1, 0.5137255, 1,
-0.1744074, -1.298781, -3.077353, 0, 1, 0.5215687, 1,
-0.1711132, 1.315701, -1.649737, 0, 1, 0.5254902, 1,
-0.1646825, 0.3362924, 0.03141318, 0, 1, 0.5333334, 1,
-0.1645137, 1.239689, -1.526742, 0, 1, 0.5372549, 1,
-0.1589114, 0.344104, 0.3512452, 0, 1, 0.5450981, 1,
-0.1533616, -1.772157, -3.181594, 0, 1, 0.5490196, 1,
-0.1516893, -0.7939419, -0.1150879, 0, 1, 0.5568628, 1,
-0.1494355, -0.3085104, -3.812262, 0, 1, 0.5607843, 1,
-0.1477755, -0.04068266, -2.073248, 0, 1, 0.5686275, 1,
-0.1462675, -0.7740985, -4.646185, 0, 1, 0.572549, 1,
-0.1367983, 0.1708697, -0.007869137, 0, 1, 0.5803922, 1,
-0.132208, 1.25795, 0.7073585, 0, 1, 0.5843138, 1,
-0.128153, -1.270032, -3.473493, 0, 1, 0.5921569, 1,
-0.1268199, -0.1386136, -2.622108, 0, 1, 0.5960785, 1,
-0.1251955, 0.7233812, 0.1290363, 0, 1, 0.6039216, 1,
-0.1240715, -2.381535, -3.012588, 0, 1, 0.6117647, 1,
-0.1216975, -0.1175054, -1.290519, 0, 1, 0.6156863, 1,
-0.1216763, 1.107047, -2.027333, 0, 1, 0.6235294, 1,
-0.1089728, -0.9796393, -3.155111, 0, 1, 0.627451, 1,
-0.1068282, -0.920624, -3.625874, 0, 1, 0.6352941, 1,
-0.1029758, -0.3317956, -2.033821, 0, 1, 0.6392157, 1,
-0.1000571, 0.05049608, -1.077893, 0, 1, 0.6470588, 1,
-0.0936293, 0.547691, -0.4153242, 0, 1, 0.6509804, 1,
-0.08815498, -0.3630025, -2.153085, 0, 1, 0.6588235, 1,
-0.08776747, 1.211653, 0.4861816, 0, 1, 0.6627451, 1,
-0.08571968, -0.7775714, -3.867411, 0, 1, 0.6705883, 1,
-0.07107131, -0.483707, -2.327887, 0, 1, 0.6745098, 1,
-0.06911521, 0.8437169, -0.5449411, 0, 1, 0.682353, 1,
-0.06867256, 0.6400945, -0.05484725, 0, 1, 0.6862745, 1,
-0.06684582, -0.980649, -2.164294, 0, 1, 0.6941177, 1,
-0.06576105, -1.734985, -2.874881, 0, 1, 0.7019608, 1,
-0.06485737, 1.970765, 0.05940768, 0, 1, 0.7058824, 1,
-0.05476224, -0.9302108, -2.094862, 0, 1, 0.7137255, 1,
-0.05277101, -0.8736958, -1.058632, 0, 1, 0.7176471, 1,
-0.05237171, -0.7181003, -3.473516, 0, 1, 0.7254902, 1,
-0.0474911, -1.601764, -2.016589, 0, 1, 0.7294118, 1,
-0.04570514, 0.3471327, 1.337346, 0, 1, 0.7372549, 1,
-0.04444584, -0.9388309, -3.152379, 0, 1, 0.7411765, 1,
-0.04344496, 0.7133957, -0.962746, 0, 1, 0.7490196, 1,
-0.0408014, -0.9618186, -2.780553, 0, 1, 0.7529412, 1,
-0.04023197, -2.150797, -3.936525, 0, 1, 0.7607843, 1,
-0.03701827, 0.5015315, 2.397267, 0, 1, 0.7647059, 1,
-0.0361848, 0.465117, -0.7704382, 0, 1, 0.772549, 1,
-0.03300744, 0.5327783, -0.8159217, 0, 1, 0.7764706, 1,
-0.03097289, -0.5543864, -1.593904, 0, 1, 0.7843137, 1,
-0.02966736, -0.9471007, -3.849649, 0, 1, 0.7882353, 1,
-0.01991935, 0.9966713, 0.9840798, 0, 1, 0.7960784, 1,
-0.01897879, 0.7057757, -0.04935011, 0, 1, 0.8039216, 1,
-0.01877464, -0.8180366, -1.844735, 0, 1, 0.8078431, 1,
-0.01301369, 0.5440876, -1.011954, 0, 1, 0.8156863, 1,
-0.01204677, 0.2687805, -2.13581, 0, 1, 0.8196079, 1,
-0.008634331, -2.351799, -1.407486, 0, 1, 0.827451, 1,
-0.00701231, 0.4536321, -0.06157845, 0, 1, 0.8313726, 1,
-0.004454203, -1.210788, -2.291553, 0, 1, 0.8392157, 1,
0.0009474336, 1.180629, 0.6996045, 0, 1, 0.8431373, 1,
0.00102866, 0.3699243, 1.037102, 0, 1, 0.8509804, 1,
0.002480261, 0.9133041, 0.5275719, 0, 1, 0.854902, 1,
0.006007377, 0.1489133, -1.651663, 0, 1, 0.8627451, 1,
0.008856275, 0.3241034, -0.3975407, 0, 1, 0.8666667, 1,
0.01590535, -0.09148891, 2.340008, 0, 1, 0.8745098, 1,
0.01686889, -1.590535, 3.077814, 0, 1, 0.8784314, 1,
0.01779368, -0.7744076, 1.844295, 0, 1, 0.8862745, 1,
0.01807897, 0.6206567, 1.0017, 0, 1, 0.8901961, 1,
0.01814033, -0.4716027, 4.617515, 0, 1, 0.8980392, 1,
0.0185433, 1.03009, 1.780763, 0, 1, 0.9058824, 1,
0.0186381, 1.266718, -0.7692626, 0, 1, 0.9098039, 1,
0.01964135, 1.958439, 0.5825305, 0, 1, 0.9176471, 1,
0.02114, -0.7696187, 3.417725, 0, 1, 0.9215686, 1,
0.02304725, 0.1991965, -0.4486389, 0, 1, 0.9294118, 1,
0.02568994, -0.5566476, 3.338791, 0, 1, 0.9333333, 1,
0.02890662, 1.009897, 0.923855, 0, 1, 0.9411765, 1,
0.0345031, -0.360871, 3.462983, 0, 1, 0.945098, 1,
0.03517165, 1.692412, -0.2876365, 0, 1, 0.9529412, 1,
0.03631307, -0.3316379, 2.541867, 0, 1, 0.9568627, 1,
0.03778363, -0.1336414, 2.717741, 0, 1, 0.9647059, 1,
0.0395197, 1.737627, -0.02263538, 0, 1, 0.9686275, 1,
0.03961545, -0.2471386, 3.157284, 0, 1, 0.9764706, 1,
0.0400135, -1.67473, 3.939512, 0, 1, 0.9803922, 1,
0.04046927, -0.5796343, 2.468688, 0, 1, 0.9882353, 1,
0.04062306, -1.381232, 3.034547, 0, 1, 0.9921569, 1,
0.04083763, -1.294431, 2.148774, 0, 1, 1, 1,
0.04197191, 0.5409136, 1.550947, 0, 0.9921569, 1, 1,
0.04355107, 0.4971917, -0.3848061, 0, 0.9882353, 1, 1,
0.04610316, 0.4436254, -0.5101355, 0, 0.9803922, 1, 1,
0.04618545, -0.8147337, 4.845185, 0, 0.9764706, 1, 1,
0.0461889, -0.5902182, 2.751053, 0, 0.9686275, 1, 1,
0.04671302, 0.0356961, 2.050993, 0, 0.9647059, 1, 1,
0.05301236, -1.201847, 4.93642, 0, 0.9568627, 1, 1,
0.05527327, 1.311263, -0.0008581294, 0, 0.9529412, 1, 1,
0.05536124, -0.4254802, 2.312692, 0, 0.945098, 1, 1,
0.05568575, 1.873555, 0.5769615, 0, 0.9411765, 1, 1,
0.05615957, -0.08068632, 2.298121, 0, 0.9333333, 1, 1,
0.0631009, -1.876817, 3.083463, 0, 0.9294118, 1, 1,
0.066521, -0.6448867, 3.11635, 0, 0.9215686, 1, 1,
0.06909192, -0.2811857, 6.03154, 0, 0.9176471, 1, 1,
0.06961274, 1.084345, 1.70218, 0, 0.9098039, 1, 1,
0.07351858, -1.092144, 3.067554, 0, 0.9058824, 1, 1,
0.07536207, 1.582976, 0.4371675, 0, 0.8980392, 1, 1,
0.07762228, -1.846469, 1.631419, 0, 0.8901961, 1, 1,
0.07796352, 0.03242682, -0.2452203, 0, 0.8862745, 1, 1,
0.07851068, -0.9548258, 2.148583, 0, 0.8784314, 1, 1,
0.08005943, -0.4291848, 3.706238, 0, 0.8745098, 1, 1,
0.0800641, 0.5154424, -0.09884002, 0, 0.8666667, 1, 1,
0.0817266, 0.2745298, 0.4967483, 0, 0.8627451, 1, 1,
0.08275533, 1.662537, -0.005674094, 0, 0.854902, 1, 1,
0.08650709, -1.445381, 2.982517, 0, 0.8509804, 1, 1,
0.08802986, 0.1859805, 0.4408784, 0, 0.8431373, 1, 1,
0.0906033, -0.02232258, 2.305859, 0, 0.8392157, 1, 1,
0.09575374, -0.796793, 3.105602, 0, 0.8313726, 1, 1,
0.09748592, -1.626481, 3.41025, 0, 0.827451, 1, 1,
0.09855537, 1.622906, -0.07538196, 0, 0.8196079, 1, 1,
0.09868551, -0.07520092, 1.931377, 0, 0.8156863, 1, 1,
0.09995068, 0.9888245, -0.4008804, 0, 0.8078431, 1, 1,
0.1088497, 0.4893585, 0.3747175, 0, 0.8039216, 1, 1,
0.1120047, -0.3522269, 1.236981, 0, 0.7960784, 1, 1,
0.1133227, -1.850338, 1.203922, 0, 0.7882353, 1, 1,
0.1161281, -0.8054761, 3.687594, 0, 0.7843137, 1, 1,
0.1192739, 0.7229607, 0.04494983, 0, 0.7764706, 1, 1,
0.1229821, 1.675692, -0.8759932, 0, 0.772549, 1, 1,
0.1244453, 1.951275, -1.912331, 0, 0.7647059, 1, 1,
0.1270801, -0.3674493, 3.141671, 0, 0.7607843, 1, 1,
0.1277038, -1.071706, 3.171409, 0, 0.7529412, 1, 1,
0.1317222, -0.6526012, 3.909213, 0, 0.7490196, 1, 1,
0.1323172, 0.9206707, 0.11348, 0, 0.7411765, 1, 1,
0.1369953, -1.132692, 4.230173, 0, 0.7372549, 1, 1,
0.1376068, 1.05529, 1.490313, 0, 0.7294118, 1, 1,
0.1392825, -0.5647576, 2.327646, 0, 0.7254902, 1, 1,
0.1409008, -2.290906, 1.366979, 0, 0.7176471, 1, 1,
0.1412602, -0.380414, 2.754724, 0, 0.7137255, 1, 1,
0.1421144, -1.542331, 3.749279, 0, 0.7058824, 1, 1,
0.1423731, -1.859405, 3.815531, 0, 0.6980392, 1, 1,
0.1457183, 1.953702, -2.93078, 0, 0.6941177, 1, 1,
0.1463887, 0.9556774, 0.9454164, 0, 0.6862745, 1, 1,
0.1527157, -0.234317, 0.7908868, 0, 0.682353, 1, 1,
0.156913, 0.4764305, -0.895357, 0, 0.6745098, 1, 1,
0.1634835, -0.5115057, 1.595306, 0, 0.6705883, 1, 1,
0.1678412, 0.7263908, -0.7725031, 0, 0.6627451, 1, 1,
0.172768, -0.007549527, 3.238339, 0, 0.6588235, 1, 1,
0.1732925, 0.9353771, 1.863081, 0, 0.6509804, 1, 1,
0.1774102, 0.379271, 1.97536, 0, 0.6470588, 1, 1,
0.1788804, 0.2243027, 1.170916, 0, 0.6392157, 1, 1,
0.187851, -0.4831594, 5.17318, 0, 0.6352941, 1, 1,
0.1884265, -1.100659, 4.141899, 0, 0.627451, 1, 1,
0.1906398, 1.066496, -1.76953, 0, 0.6235294, 1, 1,
0.1909907, 1.246202, -0.8626016, 0, 0.6156863, 1, 1,
0.1947061, -0.9305978, 1.789957, 0, 0.6117647, 1, 1,
0.1976264, -0.7513739, 2.292395, 0, 0.6039216, 1, 1,
0.1990635, 0.04297264, 0.7742092, 0, 0.5960785, 1, 1,
0.1998512, -0.3069496, 1.982052, 0, 0.5921569, 1, 1,
0.2017879, 0.01099124, 3.774035, 0, 0.5843138, 1, 1,
0.2035883, -1.030747, 2.727341, 0, 0.5803922, 1, 1,
0.2057003, -0.07788127, 1.344328, 0, 0.572549, 1, 1,
0.2087473, 0.1084476, 1.955976, 0, 0.5686275, 1, 1,
0.2098697, 0.278707, 1.315162, 0, 0.5607843, 1, 1,
0.2141564, -0.2385322, 0.5141132, 0, 0.5568628, 1, 1,
0.2170956, -0.5240489, 2.897464, 0, 0.5490196, 1, 1,
0.217706, 0.2579066, -0.1122978, 0, 0.5450981, 1, 1,
0.2206854, -0.07728815, 2.247582, 0, 0.5372549, 1, 1,
0.2215681, -0.1772011, 3.71273, 0, 0.5333334, 1, 1,
0.2227196, -0.2735915, 3.636022, 0, 0.5254902, 1, 1,
0.2232128, -0.3881077, 1.50293, 0, 0.5215687, 1, 1,
0.2280924, -0.03042882, 1.844014, 0, 0.5137255, 1, 1,
0.2310451, 0.5853714, 0.7917262, 0, 0.509804, 1, 1,
0.2318453, -0.2024664, 2.151726, 0, 0.5019608, 1, 1,
0.2324883, -2.273529, 2.698566, 0, 0.4941176, 1, 1,
0.2346928, -0.2226164, 1.98176, 0, 0.4901961, 1, 1,
0.2380267, -0.8868554, 3.036123, 0, 0.4823529, 1, 1,
0.2390592, 0.08860037, 2.441152, 0, 0.4784314, 1, 1,
0.2395581, 1.094622, 0.4768005, 0, 0.4705882, 1, 1,
0.2395607, 0.3500013, -0.07978399, 0, 0.4666667, 1, 1,
0.2414578, -0.3999563, 3.609469, 0, 0.4588235, 1, 1,
0.2454723, -0.773438, 4.22112, 0, 0.454902, 1, 1,
0.246515, 1.069862, 0.5467898, 0, 0.4470588, 1, 1,
0.2470314, -0.2496686, 2.178156, 0, 0.4431373, 1, 1,
0.2471352, 0.9932867, 0.6749994, 0, 0.4352941, 1, 1,
0.2526778, -0.08753811, 2.282511, 0, 0.4313726, 1, 1,
0.2530755, 1.46947, 0.3716046, 0, 0.4235294, 1, 1,
0.2538886, -0.9108498, 3.997845, 0, 0.4196078, 1, 1,
0.2569717, 0.5826069, 0.6309936, 0, 0.4117647, 1, 1,
0.2573012, -0.8771779, 4.273826, 0, 0.4078431, 1, 1,
0.2602543, 1.034592, 0.587796, 0, 0.4, 1, 1,
0.2602748, 2.968612, -1.873927, 0, 0.3921569, 1, 1,
0.2654978, -0.6671548, 2.742484, 0, 0.3882353, 1, 1,
0.2694398, -0.2923878, 3.241775, 0, 0.3803922, 1, 1,
0.2695446, 1.535453, 1.177464, 0, 0.3764706, 1, 1,
0.2702663, 1.090782, 0.1185586, 0, 0.3686275, 1, 1,
0.2713866, -0.2390433, 2.170508, 0, 0.3647059, 1, 1,
0.2717187, -1.099612, 3.878038, 0, 0.3568628, 1, 1,
0.2720321, 0.2212391, 0.2269158, 0, 0.3529412, 1, 1,
0.2752872, -0.4115834, 2.822272, 0, 0.345098, 1, 1,
0.2758334, -1.82353, 4.03399, 0, 0.3411765, 1, 1,
0.2762152, 1.191308, 1.726512, 0, 0.3333333, 1, 1,
0.2803829, 0.8617337, -0.5657066, 0, 0.3294118, 1, 1,
0.2837658, 0.5774194, -0.04628048, 0, 0.3215686, 1, 1,
0.284133, 1.068715, -0.2249147, 0, 0.3176471, 1, 1,
0.2920259, -0.05890248, 1.733614, 0, 0.3098039, 1, 1,
0.2938699, 0.6424914, 1.479341, 0, 0.3058824, 1, 1,
0.3070599, -0.9291037, 3.381346, 0, 0.2980392, 1, 1,
0.3096248, 0.0312301, 1.832091, 0, 0.2901961, 1, 1,
0.3193726, 0.9624432, -0.4581499, 0, 0.2862745, 1, 1,
0.3204537, 0.4250825, 0.7494604, 0, 0.2784314, 1, 1,
0.3218081, 0.3125032, -0.1914317, 0, 0.2745098, 1, 1,
0.3231865, 0.3284084, 0.4841852, 0, 0.2666667, 1, 1,
0.3232283, 0.4475808, 1.592419, 0, 0.2627451, 1, 1,
0.3278452, 1.447774, 0.9086024, 0, 0.254902, 1, 1,
0.3341681, 2.10402, 0.9394859, 0, 0.2509804, 1, 1,
0.3363739, -2.266244, 4.387371, 0, 0.2431373, 1, 1,
0.3391966, 1.468787, -0.815483, 0, 0.2392157, 1, 1,
0.3402294, -0.6204699, 1.854916, 0, 0.2313726, 1, 1,
0.3434268, -3.049921, 2.734345, 0, 0.227451, 1, 1,
0.3442422, 0.7111245, 0.7440127, 0, 0.2196078, 1, 1,
0.3449974, 1.222592, -0.2096639, 0, 0.2156863, 1, 1,
0.3460634, -1.187082, 4.148598, 0, 0.2078431, 1, 1,
0.3462967, -0.5495612, 2.416834, 0, 0.2039216, 1, 1,
0.3503146, -0.8265383, 2.278454, 0, 0.1960784, 1, 1,
0.3536123, 0.04496872, 2.992058, 0, 0.1882353, 1, 1,
0.3570101, -1.115729, 1.48086, 0, 0.1843137, 1, 1,
0.363656, -0.6209376, 0.6856312, 0, 0.1764706, 1, 1,
0.364159, -0.3114542, 3.908561, 0, 0.172549, 1, 1,
0.3643847, 0.4161983, 1.732839, 0, 0.1647059, 1, 1,
0.3676957, 1.500281, 1.19396, 0, 0.1607843, 1, 1,
0.3688008, -1.660017, 2.77487, 0, 0.1529412, 1, 1,
0.3713962, -0.1513964, 2.875429, 0, 0.1490196, 1, 1,
0.3735399, -0.1662901, 3.950834, 0, 0.1411765, 1, 1,
0.3783729, 0.9743862, -2.514902, 0, 0.1372549, 1, 1,
0.3797428, -0.8405978, 2.52197, 0, 0.1294118, 1, 1,
0.3856342, -0.3886127, 1.364403, 0, 0.1254902, 1, 1,
0.387172, -0.1726447, 2.223282, 0, 0.1176471, 1, 1,
0.3881046, 1.175617, 0.5164732, 0, 0.1137255, 1, 1,
0.3894557, 0.6169788, 0.6477186, 0, 0.1058824, 1, 1,
0.3903897, -0.34579, 1.190543, 0, 0.09803922, 1, 1,
0.3926967, -0.2360756, 1.045681, 0, 0.09411765, 1, 1,
0.3947044, -1.209536, 4.032459, 0, 0.08627451, 1, 1,
0.395407, 1.412693, 1.807981, 0, 0.08235294, 1, 1,
0.3954169, 0.965979, -0.7225259, 0, 0.07450981, 1, 1,
0.3969142, 0.2370669, 0.4974046, 0, 0.07058824, 1, 1,
0.3976457, -2.11442, 4.708439, 0, 0.0627451, 1, 1,
0.3976938, 0.6085292, 2.034931, 0, 0.05882353, 1, 1,
0.3983219, 1.566379, 0.7565961, 0, 0.05098039, 1, 1,
0.4085914, -0.7377346, 2.471884, 0, 0.04705882, 1, 1,
0.4086774, -0.1116715, 0.9360678, 0, 0.03921569, 1, 1,
0.4110647, 0.01587246, 0.1200365, 0, 0.03529412, 1, 1,
0.4138916, 2.404208, 1.355306, 0, 0.02745098, 1, 1,
0.4146167, -0.286169, 2.258432, 0, 0.02352941, 1, 1,
0.4181553, -0.2230172, 3.081315, 0, 0.01568628, 1, 1,
0.4210419, -0.08533459, 4.760231, 0, 0.01176471, 1, 1,
0.4241711, -0.9415437, 4.917938, 0, 0.003921569, 1, 1,
0.4262741, -0.7545674, 1.670892, 0.003921569, 0, 1, 1,
0.4269389, 0.6783795, 0.06998809, 0.007843138, 0, 1, 1,
0.4290745, -0.2561741, 2.444852, 0.01568628, 0, 1, 1,
0.433382, -0.9146588, 2.287414, 0.01960784, 0, 1, 1,
0.4440508, 0.6561935, 0.4017634, 0.02745098, 0, 1, 1,
0.4586459, 0.5757263, 1.404755, 0.03137255, 0, 1, 1,
0.4672337, 1.101034, -0.4391147, 0.03921569, 0, 1, 1,
0.4720774, -1.731956, 3.298238, 0.04313726, 0, 1, 1,
0.4727111, 0.3043568, 1.494901, 0.05098039, 0, 1, 1,
0.4728865, -0.4502662, 2.900669, 0.05490196, 0, 1, 1,
0.4807042, 0.7872708, 0.8527375, 0.0627451, 0, 1, 1,
0.4812353, -1.193325, 4.462935, 0.06666667, 0, 1, 1,
0.4841715, -0.5285558, 1.065546, 0.07450981, 0, 1, 1,
0.484184, -0.1860162, 1.331378, 0.07843138, 0, 1, 1,
0.4845025, 0.8327363, -0.2157024, 0.08627451, 0, 1, 1,
0.4852519, -1.372472, 4.444601, 0.09019608, 0, 1, 1,
0.4917956, -0.01266484, 1.710098, 0.09803922, 0, 1, 1,
0.4988923, 0.4485598, 0.9124005, 0.1058824, 0, 1, 1,
0.5042587, 0.6972212, -0.1322453, 0.1098039, 0, 1, 1,
0.5065014, -0.9494299, 0.8280517, 0.1176471, 0, 1, 1,
0.5118617, -1.145622, 3.31795, 0.1215686, 0, 1, 1,
0.513714, -0.160596, 3.308914, 0.1294118, 0, 1, 1,
0.5155025, -0.1602107, -0.3707171, 0.1333333, 0, 1, 1,
0.5165175, 1.076874, -0.4606571, 0.1411765, 0, 1, 1,
0.520883, -0.002033735, 1.150685, 0.145098, 0, 1, 1,
0.5222518, -0.3886041, 2.51439, 0.1529412, 0, 1, 1,
0.5241458, 0.8362216, -0.7235281, 0.1568628, 0, 1, 1,
0.5289314, 1.393285, 0.207537, 0.1647059, 0, 1, 1,
0.5293593, -2.369615, 1.894113, 0.1686275, 0, 1, 1,
0.5346829, 1.297256, 2.148863, 0.1764706, 0, 1, 1,
0.535328, 0.7739556, 1.762878, 0.1803922, 0, 1, 1,
0.538248, -0.155802, 2.499206, 0.1882353, 0, 1, 1,
0.5393641, -0.6125024, 1.351559, 0.1921569, 0, 1, 1,
0.542319, -0.09256963, 1.24755, 0.2, 0, 1, 1,
0.5425793, -0.3568673, 3.63292, 0.2078431, 0, 1, 1,
0.5432848, 1.185276, 1.186895, 0.2117647, 0, 1, 1,
0.54402, 0.3975784, 2.751063, 0.2196078, 0, 1, 1,
0.5457475, 0.8702035, -0.7432185, 0.2235294, 0, 1, 1,
0.5485679, 0.002246234, 1.661259, 0.2313726, 0, 1, 1,
0.5486367, 0.322987, 2.032685, 0.2352941, 0, 1, 1,
0.5514959, -0.5421736, 2.114563, 0.2431373, 0, 1, 1,
0.551662, -1.972448, 2.715304, 0.2470588, 0, 1, 1,
0.5541441, -1.334331, 2.878977, 0.254902, 0, 1, 1,
0.5616349, 0.740685, 0.7378153, 0.2588235, 0, 1, 1,
0.5617834, 2.597953, 0.7251416, 0.2666667, 0, 1, 1,
0.562242, -0.3455213, 1.900004, 0.2705882, 0, 1, 1,
0.5648026, 0.6797565, 0.5559105, 0.2784314, 0, 1, 1,
0.5655062, -1.038586, 1.359594, 0.282353, 0, 1, 1,
0.566898, -0.5813091, 2.947027, 0.2901961, 0, 1, 1,
0.5679384, -1.513702, 1.60123, 0.2941177, 0, 1, 1,
0.5707124, -1.190017, 1.82396, 0.3019608, 0, 1, 1,
0.5757315, 0.2029335, 2.035302, 0.3098039, 0, 1, 1,
0.5852452, -0.9497162, 0.9450497, 0.3137255, 0, 1, 1,
0.590669, 0.6564867, 0.3838798, 0.3215686, 0, 1, 1,
0.5926052, 0.539556, -0.3392039, 0.3254902, 0, 1, 1,
0.5976658, 0.824259, 0.2340914, 0.3333333, 0, 1, 1,
0.5982794, 1.861058, 0.6191638, 0.3372549, 0, 1, 1,
0.5985659, -0.23798, 1.570622, 0.345098, 0, 1, 1,
0.5991759, -1.472788, 2.499092, 0.3490196, 0, 1, 1,
0.6007885, 1.122486, 1.271029, 0.3568628, 0, 1, 1,
0.6034343, -0.6799994, 0.3937519, 0.3607843, 0, 1, 1,
0.6050715, -0.4717795, -0.02346158, 0.3686275, 0, 1, 1,
0.6119817, 0.4452729, 2.059593, 0.372549, 0, 1, 1,
0.6136854, -1.663195, 2.848857, 0.3803922, 0, 1, 1,
0.6140055, -0.9007861, 2.487867, 0.3843137, 0, 1, 1,
0.6154639, -0.04840542, 3.39179, 0.3921569, 0, 1, 1,
0.6182436, 1.194331, 0.9249138, 0.3960784, 0, 1, 1,
0.622254, -0.4034737, 1.381536, 0.4039216, 0, 1, 1,
0.6274636, 1.185549, 0.5636933, 0.4117647, 0, 1, 1,
0.6324448, 0.322852, 1.956179, 0.4156863, 0, 1, 1,
0.6330177, -0.8946807, 2.171257, 0.4235294, 0, 1, 1,
0.6384928, -0.08849655, 3.77228, 0.427451, 0, 1, 1,
0.6452051, 0.1120765, 1.566725, 0.4352941, 0, 1, 1,
0.6466126, -0.3607104, 3.452395, 0.4392157, 0, 1, 1,
0.6492233, 1.143989, -1.193536, 0.4470588, 0, 1, 1,
0.6655183, 0.2751411, 0.4075367, 0.4509804, 0, 1, 1,
0.6666381, -2.152606, 4.83395, 0.4588235, 0, 1, 1,
0.6669655, 0.2669861, 1.744682, 0.4627451, 0, 1, 1,
0.6730723, -1.627103, 3.970989, 0.4705882, 0, 1, 1,
0.6763144, 0.3850235, 1.440488, 0.4745098, 0, 1, 1,
0.6783367, -1.994262, 2.731403, 0.4823529, 0, 1, 1,
0.6789436, -0.1515264, 1.509776, 0.4862745, 0, 1, 1,
0.6790732, 0.6291753, -0.335984, 0.4941176, 0, 1, 1,
0.6812133, 0.04828347, 1.584047, 0.5019608, 0, 1, 1,
0.6812861, -0.9760424, 2.048211, 0.5058824, 0, 1, 1,
0.6818116, 0.9493501, 0.440842, 0.5137255, 0, 1, 1,
0.6888289, -1.316106, 3.445873, 0.5176471, 0, 1, 1,
0.6915924, 0.03656066, 2.147954, 0.5254902, 0, 1, 1,
0.6951935, 0.5005087, -0.6013168, 0.5294118, 0, 1, 1,
0.6986713, 1.076341, 0.1581324, 0.5372549, 0, 1, 1,
0.7032887, 0.05450444, 2.42401, 0.5411765, 0, 1, 1,
0.7041562, 0.3482589, 1.202278, 0.5490196, 0, 1, 1,
0.710337, -1.473954, 3.892904, 0.5529412, 0, 1, 1,
0.7123288, 0.3619143, 1.112197, 0.5607843, 0, 1, 1,
0.716251, -0.8891466, 2.5986, 0.5647059, 0, 1, 1,
0.7187545, -0.3766313, 1.379922, 0.572549, 0, 1, 1,
0.7217073, 0.5273302, -0.03655123, 0.5764706, 0, 1, 1,
0.7240314, -0.01658391, 1.363522, 0.5843138, 0, 1, 1,
0.7259496, -1.052129, 2.823724, 0.5882353, 0, 1, 1,
0.7334798, 0.3916247, 2.985732, 0.5960785, 0, 1, 1,
0.7421626, -1.189117, 1.299615, 0.6039216, 0, 1, 1,
0.7422302, 0.1867637, 2.665926, 0.6078432, 0, 1, 1,
0.744312, -1.174424, 3.937204, 0.6156863, 0, 1, 1,
0.7522165, 0.1275629, 1.585358, 0.6196079, 0, 1, 1,
0.7571265, 0.3526748, 0.847783, 0.627451, 0, 1, 1,
0.7621315, 0.7863171, 0.3836088, 0.6313726, 0, 1, 1,
0.7642235, 1.473973, -0.902286, 0.6392157, 0, 1, 1,
0.764508, -0.07726225, 2.116005, 0.6431373, 0, 1, 1,
0.7647067, -2.703592, 3.308313, 0.6509804, 0, 1, 1,
0.7685426, 0.5485193, 1.529643, 0.654902, 0, 1, 1,
0.7695644, -1.143169, 2.620599, 0.6627451, 0, 1, 1,
0.7795345, -1.467228, 4.369791, 0.6666667, 0, 1, 1,
0.780247, -0.03685895, 0.6945877, 0.6745098, 0, 1, 1,
0.7806327, -1.968804, 2.870634, 0.6784314, 0, 1, 1,
0.780881, 0.756366, -1.025373, 0.6862745, 0, 1, 1,
0.7819399, 0.4224705, 1.356974, 0.6901961, 0, 1, 1,
0.7828426, 0.330037, 1.125781, 0.6980392, 0, 1, 1,
0.7839035, 0.5398473, -0.01219457, 0.7058824, 0, 1, 1,
0.7851971, 0.9705629, 0.9190303, 0.7098039, 0, 1, 1,
0.7859489, -0.7153026, 1.370144, 0.7176471, 0, 1, 1,
0.7969495, -0.7825869, 1.038402, 0.7215686, 0, 1, 1,
0.7982022, 0.1285089, 0.7941126, 0.7294118, 0, 1, 1,
0.8019317, 0.009740589, 1.854684, 0.7333333, 0, 1, 1,
0.8065835, -1.180368, 3.195757, 0.7411765, 0, 1, 1,
0.8121247, -1.682694, 2.284854, 0.7450981, 0, 1, 1,
0.8145205, -0.376974, 2.825398, 0.7529412, 0, 1, 1,
0.8156536, 2.11555, -0.6641914, 0.7568628, 0, 1, 1,
0.8231734, -0.2341527, 0.5462796, 0.7647059, 0, 1, 1,
0.8239172, 1.395005, 1.388417, 0.7686275, 0, 1, 1,
0.8256222, -0.2000446, 1.296382, 0.7764706, 0, 1, 1,
0.8311162, 1.293969, 0.4179632, 0.7803922, 0, 1, 1,
0.8344578, -0.7334014, 1.698854, 0.7882353, 0, 1, 1,
0.8356912, 0.1634851, 1.703293, 0.7921569, 0, 1, 1,
0.8393608, 0.5273865, 2.191396, 0.8, 0, 1, 1,
0.8405847, 0.6332314, 0.9245086, 0.8078431, 0, 1, 1,
0.8439577, 0.8523039, 0.7143514, 0.8117647, 0, 1, 1,
0.8461614, 0.643833, 2.139045, 0.8196079, 0, 1, 1,
0.851818, 0.02396825, 1.198279, 0.8235294, 0, 1, 1,
0.8542221, -0.6076264, 2.427015, 0.8313726, 0, 1, 1,
0.8631911, -1.301086, 3.357171, 0.8352941, 0, 1, 1,
0.8688417, -0.2942224, 2.821322, 0.8431373, 0, 1, 1,
0.8755854, 1.260146, 0.210144, 0.8470588, 0, 1, 1,
0.8822777, -1.696574, 1.099108, 0.854902, 0, 1, 1,
0.8853357, 0.2096009, 0.7639736, 0.8588235, 0, 1, 1,
0.8928181, 0.02882472, 1.291548, 0.8666667, 0, 1, 1,
0.89349, 0.8291146, 0.8266656, 0.8705882, 0, 1, 1,
0.8949708, -0.5168971, 1.950736, 0.8784314, 0, 1, 1,
0.8961843, 0.1032405, 1.75784, 0.8823529, 0, 1, 1,
0.8994366, 0.1855633, 1.116356, 0.8901961, 0, 1, 1,
0.9021271, 0.3247703, 0.2770935, 0.8941177, 0, 1, 1,
0.9074159, 0.4834857, 1.619039, 0.9019608, 0, 1, 1,
0.9104454, -1.064069, 4.262382, 0.9098039, 0, 1, 1,
0.9184847, 0.3477789, -0.01916778, 0.9137255, 0, 1, 1,
0.9214293, -1.071555, 2.328469, 0.9215686, 0, 1, 1,
0.9258794, 1.101142, 0.4026279, 0.9254902, 0, 1, 1,
0.9301512, 0.5102997, 1.77858, 0.9333333, 0, 1, 1,
0.9338859, 1.146466, 2.866491, 0.9372549, 0, 1, 1,
0.9397095, 0.4263416, 3.129097, 0.945098, 0, 1, 1,
0.9407811, -0.4156019, 2.665837, 0.9490196, 0, 1, 1,
0.941571, -0.2569405, 1.025939, 0.9568627, 0, 1, 1,
0.9421416, 0.2342713, 1.337571, 0.9607843, 0, 1, 1,
0.9468653, -0.1335885, 2.61481, 0.9686275, 0, 1, 1,
0.9515139, 0.1941729, 2.142624, 0.972549, 0, 1, 1,
0.9592012, 1.318037, 2.536443, 0.9803922, 0, 1, 1,
0.9614897, -1.28195, 2.549252, 0.9843137, 0, 1, 1,
0.9627559, 0.931277, 1.232922, 0.9921569, 0, 1, 1,
0.9642751, -0.5002837, 0.4689712, 0.9960784, 0, 1, 1,
0.9658151, 0.1614585, 2.205581, 1, 0, 0.9960784, 1,
0.9669071, 0.6590744, 2.142934, 1, 0, 0.9882353, 1,
0.9740732, -0.08807807, 1.770157, 1, 0, 0.9843137, 1,
0.9774733, 0.8624337, 0.9414124, 1, 0, 0.9764706, 1,
0.9857971, 0.3784476, 1.213615, 1, 0, 0.972549, 1,
0.991927, 0.5580335, 1.754516, 1, 0, 0.9647059, 1,
0.9938574, -1.914635, 2.79842, 1, 0, 0.9607843, 1,
0.994175, 0.5210706, 2.570702, 1, 0, 0.9529412, 1,
0.9984866, 1.120898, 2.052018, 1, 0, 0.9490196, 1,
1.004925, 0.3411607, 0.5219721, 1, 0, 0.9411765, 1,
1.011344, -0.6602922, 1.535821, 1, 0, 0.9372549, 1,
1.012068, -1.724488, 0.5030402, 1, 0, 0.9294118, 1,
1.013632, 0.4211988, 0.658529, 1, 0, 0.9254902, 1,
1.015616, 0.01296222, 1.84246, 1, 0, 0.9176471, 1,
1.016016, -0.3379532, 2.230057, 1, 0, 0.9137255, 1,
1.019766, 0.3288456, 0.3567626, 1, 0, 0.9058824, 1,
1.02254, -1.161475, 1.383835, 1, 0, 0.9019608, 1,
1.024464, 0.5787821, 2.199833, 1, 0, 0.8941177, 1,
1.024828, 1.2443, 1.266623, 1, 0, 0.8862745, 1,
1.024898, 1.290364, 1.452489, 1, 0, 0.8823529, 1,
1.029072, 2.002033, -0.6824728, 1, 0, 0.8745098, 1,
1.030668, 0.4073308, -1.115121, 1, 0, 0.8705882, 1,
1.03281, -2.249847, 0.4190541, 1, 0, 0.8627451, 1,
1.044577, -0.3304982, 1.865504, 1, 0, 0.8588235, 1,
1.048265, 1.882242, -1.137059, 1, 0, 0.8509804, 1,
1.051339, -0.528016, 1.656753, 1, 0, 0.8470588, 1,
1.054775, 1.762126, 0.7676458, 1, 0, 0.8392157, 1,
1.057292, 0.1982211, 0.09431214, 1, 0, 0.8352941, 1,
1.064938, 0.1815315, 2.824589, 1, 0, 0.827451, 1,
1.065923, 0.105706, 1.015099, 1, 0, 0.8235294, 1,
1.071302, -0.7225862, 2.444021, 1, 0, 0.8156863, 1,
1.07187, -0.7686286, 1.640386, 1, 0, 0.8117647, 1,
1.073582, 0.1311391, 2.170672, 1, 0, 0.8039216, 1,
1.07441, -0.8342721, 3.47138, 1, 0, 0.7960784, 1,
1.090192, 0.03019206, 3.944915, 1, 0, 0.7921569, 1,
1.092967, 0.7856323, 1.155965, 1, 0, 0.7843137, 1,
1.094187, -1.439247, 3.584689, 1, 0, 0.7803922, 1,
1.097724, -0.5971122, 1.544978, 1, 0, 0.772549, 1,
1.100967, 0.3724815, 0.7798578, 1, 0, 0.7686275, 1,
1.119531, -0.9362584, 1.741814, 1, 0, 0.7607843, 1,
1.120637, -1.270371, 1.205017, 1, 0, 0.7568628, 1,
1.140976, -0.01704997, 1.44973, 1, 0, 0.7490196, 1,
1.146034, -2.59094, 3.172409, 1, 0, 0.7450981, 1,
1.154126, -0.8455158, 1.07996, 1, 0, 0.7372549, 1,
1.160474, -1.714128, 3.584289, 1, 0, 0.7333333, 1,
1.167885, -1.304023, 0.600854, 1, 0, 0.7254902, 1,
1.172638, 0.3413655, 2.408723, 1, 0, 0.7215686, 1,
1.181762, 0.4264506, 0.6079191, 1, 0, 0.7137255, 1,
1.182007, 1.303839, 0.7144456, 1, 0, 0.7098039, 1,
1.183088, -0.1981656, 2.673409, 1, 0, 0.7019608, 1,
1.184336, -0.1180623, 0.3644474, 1, 0, 0.6941177, 1,
1.200604, -0.1601558, 0.4661669, 1, 0, 0.6901961, 1,
1.204444, 0.5564663, -0.05729946, 1, 0, 0.682353, 1,
1.208731, 0.700641, 1.307407, 1, 0, 0.6784314, 1,
1.212116, -0.5755908, 0.913565, 1, 0, 0.6705883, 1,
1.229687, 0.6229261, 1.118427, 1, 0, 0.6666667, 1,
1.232693, -0.9493437, 2.299708, 1, 0, 0.6588235, 1,
1.233086, 0.05487989, 2.516776, 1, 0, 0.654902, 1,
1.235045, 0.9081495, 0.3321765, 1, 0, 0.6470588, 1,
1.238896, 1.571993, -1.340671, 1, 0, 0.6431373, 1,
1.246935, 0.5255221, 2.018661, 1, 0, 0.6352941, 1,
1.258629, 0.4368141, 2.015792, 1, 0, 0.6313726, 1,
1.25868, -0.5135322, 1.177124, 1, 0, 0.6235294, 1,
1.276951, 0.1459261, 1.743971, 1, 0, 0.6196079, 1,
1.277947, -0.08709039, -0.07052393, 1, 0, 0.6117647, 1,
1.278132, 0.6472346, 0.5743316, 1, 0, 0.6078432, 1,
1.280227, -0.3014312, 1.424595, 1, 0, 0.6, 1,
1.28864, -1.68325, 2.517646, 1, 0, 0.5921569, 1,
1.312047, 1.657375, 2.20032, 1, 0, 0.5882353, 1,
1.32071, 0.1284925, 1.758351, 1, 0, 0.5803922, 1,
1.328513, -0.06901863, 0.3690115, 1, 0, 0.5764706, 1,
1.329252, 2.062473, -0.1546065, 1, 0, 0.5686275, 1,
1.333629, 2.331734, 0.3788192, 1, 0, 0.5647059, 1,
1.335101, 1.464898, 0.9765027, 1, 0, 0.5568628, 1,
1.336665, -0.6860462, 3.19261, 1, 0, 0.5529412, 1,
1.337137, 1.590407, 0.9589406, 1, 0, 0.5450981, 1,
1.337307, -1.227252, 3.136251, 1, 0, 0.5411765, 1,
1.348126, -0.3692727, 1.926288, 1, 0, 0.5333334, 1,
1.355181, 1.068754, 0.6642917, 1, 0, 0.5294118, 1,
1.35911, 1.77223, -0.1053745, 1, 0, 0.5215687, 1,
1.366297, -0.2769916, 1.121678, 1, 0, 0.5176471, 1,
1.369359, 0.9747627, 0.2165839, 1, 0, 0.509804, 1,
1.373156, 0.7997495, 0.6885543, 1, 0, 0.5058824, 1,
1.376554, 2.072141, 1.276862, 1, 0, 0.4980392, 1,
1.381028, -0.8902268, 1.672307, 1, 0, 0.4901961, 1,
1.385095, 0.2636346, -0.001645341, 1, 0, 0.4862745, 1,
1.41076, 0.302698, 1.104872, 1, 0, 0.4784314, 1,
1.412624, 1.561898, 0.6452707, 1, 0, 0.4745098, 1,
1.41831, -1.107172, 2.775699, 1, 0, 0.4666667, 1,
1.42437, 0.7196564, 1.260033, 1, 0, 0.4627451, 1,
1.430391, -0.5882348, 1.361988, 1, 0, 0.454902, 1,
1.4311, 1.229476, -0.1615071, 1, 0, 0.4509804, 1,
1.438013, -0.4707142, 0.09533818, 1, 0, 0.4431373, 1,
1.439298, -0.02771146, 2.529609, 1, 0, 0.4392157, 1,
1.445296, -1.013276, 0.2150396, 1, 0, 0.4313726, 1,
1.460136, 1.029478, 1.206931, 1, 0, 0.427451, 1,
1.464164, 0.2730102, 1.430334, 1, 0, 0.4196078, 1,
1.465149, 0.6209909, 2.727667, 1, 0, 0.4156863, 1,
1.480253, -0.4684442, 1.11866, 1, 0, 0.4078431, 1,
1.490913, 1.033658, 0.8328664, 1, 0, 0.4039216, 1,
1.50304, -0.7713158, 0.5000051, 1, 0, 0.3960784, 1,
1.523877, 0.7868291, 1.782879, 1, 0, 0.3882353, 1,
1.542201, 1.078745, 1.022076, 1, 0, 0.3843137, 1,
1.544629, 0.7093831, 2.26536, 1, 0, 0.3764706, 1,
1.55683, 1.612198, 0.3701942, 1, 0, 0.372549, 1,
1.579324, 0.732231, 2.102501, 1, 0, 0.3647059, 1,
1.580437, -0.4906065, 1.066186, 1, 0, 0.3607843, 1,
1.583523, -2.528043, 2.822932, 1, 0, 0.3529412, 1,
1.596045, -0.6972307, 1.097328, 1, 0, 0.3490196, 1,
1.600255, 0.1601872, 2.071146, 1, 0, 0.3411765, 1,
1.615552, 0.3529894, 1.20461, 1, 0, 0.3372549, 1,
1.617499, -0.6313406, 0.3065123, 1, 0, 0.3294118, 1,
1.619041, 0.2685677, -0.001150822, 1, 0, 0.3254902, 1,
1.62266, -1.689451, 3.447984, 1, 0, 0.3176471, 1,
1.62333, -0.1926793, 2.561812, 1, 0, 0.3137255, 1,
1.656844, 1.527389, 0.9250956, 1, 0, 0.3058824, 1,
1.664426, -0.492403, 1.964901, 1, 0, 0.2980392, 1,
1.671905, -0.7936057, 3.360311, 1, 0, 0.2941177, 1,
1.695816, 0.7485036, 2.08214, 1, 0, 0.2862745, 1,
1.726492, 0.3415132, 1.769343, 1, 0, 0.282353, 1,
1.739908, -2.050424, 3.228716, 1, 0, 0.2745098, 1,
1.759853, 0.7712547, 1.200221, 1, 0, 0.2705882, 1,
1.765997, 1.803247, -0.4545026, 1, 0, 0.2627451, 1,
1.777555, 1.067916, 0.7876765, 1, 0, 0.2588235, 1,
1.785016, -0.1571401, 1.268028, 1, 0, 0.2509804, 1,
1.794606, 0.7997407, 0.7162054, 1, 0, 0.2470588, 1,
1.804044, -0.9288111, 1.613025, 1, 0, 0.2392157, 1,
1.806422, -1.19226, 2.327222, 1, 0, 0.2352941, 1,
1.80901, -0.9252005, 2.077629, 1, 0, 0.227451, 1,
1.835368, 2.159029, 0.972913, 1, 0, 0.2235294, 1,
1.843452, -1.419367, 4.49369, 1, 0, 0.2156863, 1,
1.8538, 0.4031235, 2.074118, 1, 0, 0.2117647, 1,
1.876348, 1.1732, 0.6522438, 1, 0, 0.2039216, 1,
1.880149, -0.9192885, 1.598802, 1, 0, 0.1960784, 1,
1.903101, -0.451595, 2.70948, 1, 0, 0.1921569, 1,
1.935502, -0.1531345, 2.993944, 1, 0, 0.1843137, 1,
1.959333, -0.6338967, 3.692897, 1, 0, 0.1803922, 1,
2.004552, 0.219693, -1.177562, 1, 0, 0.172549, 1,
2.026097, 0.7413219, -0.3223849, 1, 0, 0.1686275, 1,
2.032894, 1.176465, -0.1021514, 1, 0, 0.1607843, 1,
2.03347, -1.348966, 2.129118, 1, 0, 0.1568628, 1,
2.058754, 0.7922304, 0.2986223, 1, 0, 0.1490196, 1,
2.079137, 1.583816, -0.3061321, 1, 0, 0.145098, 1,
2.130036, -0.8360987, 1.050348, 1, 0, 0.1372549, 1,
2.135796, -1.180756, 4.570906, 1, 0, 0.1333333, 1,
2.143441, 0.9919351, -0.1733141, 1, 0, 0.1254902, 1,
2.152314, -0.5240871, 3.151032, 1, 0, 0.1215686, 1,
2.160754, -0.935839, 1.596791, 1, 0, 0.1137255, 1,
2.171552, 0.8111994, 1.881322, 1, 0, 0.1098039, 1,
2.173907, 1.2329, 0.2596405, 1, 0, 0.1019608, 1,
2.20137, 0.438753, 2.09284, 1, 0, 0.09411765, 1,
2.209586, -0.5346693, -0.3182668, 1, 0, 0.09019608, 1,
2.235388, -0.1409035, 1.915566, 1, 0, 0.08235294, 1,
2.285511, -0.2654347, 0.4406257, 1, 0, 0.07843138, 1,
2.315933, -1.252797, 2.143344, 1, 0, 0.07058824, 1,
2.331036, -0.8762268, 1.206053, 1, 0, 0.06666667, 1,
2.352564, -0.2080113, 1.90095, 1, 0, 0.05882353, 1,
2.402801, -0.1312674, 0.8873492, 1, 0, 0.05490196, 1,
2.444819, -1.527077, 2.320346, 1, 0, 0.04705882, 1,
2.48913, 1.139489, 1.902083, 1, 0, 0.04313726, 1,
2.53191, -0.1081156, 1.384188, 1, 0, 0.03529412, 1,
2.547551, -0.1688105, 1.515077, 1, 0, 0.03137255, 1,
2.622049, 0.8650129, 1.748648, 1, 0, 0.02352941, 1,
2.700449, -0.3310257, 0.7863857, 1, 0, 0.01960784, 1,
2.763381, -0.7313503, 1.859593, 1, 0, 0.01176471, 1,
2.896392, 0.04949497, 2.879747, 1, 0, 0.007843138, 1
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
-0.08380365, -4.160985, -8.648104, 0, -0.5, 0.5, 0.5,
-0.08380365, -4.160985, -8.648104, 1, -0.5, 0.5, 0.5,
-0.08380365, -4.160985, -8.648104, 1, 1.5, 0.5, 0.5,
-0.08380365, -4.160985, -8.648104, 0, 1.5, 0.5, 0.5
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
-4.074286, -0.0795269, -8.648104, 0, -0.5, 0.5, 0.5,
-4.074286, -0.0795269, -8.648104, 1, -0.5, 0.5, 0.5,
-4.074286, -0.0795269, -8.648104, 1, 1.5, 0.5, 0.5,
-4.074286, -0.0795269, -8.648104, 0, 1.5, 0.5, 0.5
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
-4.074286, -4.160985, -0.2444937, 0, -0.5, 0.5, 0.5,
-4.074286, -4.160985, -0.2444937, 1, -0.5, 0.5, 0.5,
-4.074286, -4.160985, -0.2444937, 1, 1.5, 0.5, 0.5,
-4.074286, -4.160985, -0.2444937, 0, 1.5, 0.5, 0.5
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
-3, -3.21911, -6.708809,
2, -3.21911, -6.708809,
-3, -3.21911, -6.708809,
-3, -3.376089, -7.032024,
-2, -3.21911, -6.708809,
-2, -3.376089, -7.032024,
-1, -3.21911, -6.708809,
-1, -3.376089, -7.032024,
0, -3.21911, -6.708809,
0, -3.376089, -7.032024,
1, -3.21911, -6.708809,
1, -3.376089, -7.032024,
2, -3.21911, -6.708809,
2, -3.376089, -7.032024
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
-3, -3.690048, -7.678456, 0, -0.5, 0.5, 0.5,
-3, -3.690048, -7.678456, 1, -0.5, 0.5, 0.5,
-3, -3.690048, -7.678456, 1, 1.5, 0.5, 0.5,
-3, -3.690048, -7.678456, 0, 1.5, 0.5, 0.5,
-2, -3.690048, -7.678456, 0, -0.5, 0.5, 0.5,
-2, -3.690048, -7.678456, 1, -0.5, 0.5, 0.5,
-2, -3.690048, -7.678456, 1, 1.5, 0.5, 0.5,
-2, -3.690048, -7.678456, 0, 1.5, 0.5, 0.5,
-1, -3.690048, -7.678456, 0, -0.5, 0.5, 0.5,
-1, -3.690048, -7.678456, 1, -0.5, 0.5, 0.5,
-1, -3.690048, -7.678456, 1, 1.5, 0.5, 0.5,
-1, -3.690048, -7.678456, 0, 1.5, 0.5, 0.5,
0, -3.690048, -7.678456, 0, -0.5, 0.5, 0.5,
0, -3.690048, -7.678456, 1, -0.5, 0.5, 0.5,
0, -3.690048, -7.678456, 1, 1.5, 0.5, 0.5,
0, -3.690048, -7.678456, 0, 1.5, 0.5, 0.5,
1, -3.690048, -7.678456, 0, -0.5, 0.5, 0.5,
1, -3.690048, -7.678456, 1, -0.5, 0.5, 0.5,
1, -3.690048, -7.678456, 1, 1.5, 0.5, 0.5,
1, -3.690048, -7.678456, 0, 1.5, 0.5, 0.5,
2, -3.690048, -7.678456, 0, -0.5, 0.5, 0.5,
2, -3.690048, -7.678456, 1, -0.5, 0.5, 0.5,
2, -3.690048, -7.678456, 1, 1.5, 0.5, 0.5,
2, -3.690048, -7.678456, 0, 1.5, 0.5, 0.5
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
-3.153405, -3, -6.708809,
-3.153405, 2, -6.708809,
-3.153405, -3, -6.708809,
-3.306885, -3, -7.032024,
-3.153405, -2, -6.708809,
-3.306885, -2, -7.032024,
-3.153405, -1, -6.708809,
-3.306885, -1, -7.032024,
-3.153405, 0, -6.708809,
-3.306885, 0, -7.032024,
-3.153405, 1, -6.708809,
-3.306885, 1, -7.032024,
-3.153405, 2, -6.708809,
-3.306885, 2, -7.032024
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
-3.613846, -3, -7.678456, 0, -0.5, 0.5, 0.5,
-3.613846, -3, -7.678456, 1, -0.5, 0.5, 0.5,
-3.613846, -3, -7.678456, 1, 1.5, 0.5, 0.5,
-3.613846, -3, -7.678456, 0, 1.5, 0.5, 0.5,
-3.613846, -2, -7.678456, 0, -0.5, 0.5, 0.5,
-3.613846, -2, -7.678456, 1, -0.5, 0.5, 0.5,
-3.613846, -2, -7.678456, 1, 1.5, 0.5, 0.5,
-3.613846, -2, -7.678456, 0, 1.5, 0.5, 0.5,
-3.613846, -1, -7.678456, 0, -0.5, 0.5, 0.5,
-3.613846, -1, -7.678456, 1, -0.5, 0.5, 0.5,
-3.613846, -1, -7.678456, 1, 1.5, 0.5, 0.5,
-3.613846, -1, -7.678456, 0, 1.5, 0.5, 0.5,
-3.613846, 0, -7.678456, 0, -0.5, 0.5, 0.5,
-3.613846, 0, -7.678456, 1, -0.5, 0.5, 0.5,
-3.613846, 0, -7.678456, 1, 1.5, 0.5, 0.5,
-3.613846, 0, -7.678456, 0, 1.5, 0.5, 0.5,
-3.613846, 1, -7.678456, 0, -0.5, 0.5, 0.5,
-3.613846, 1, -7.678456, 1, -0.5, 0.5, 0.5,
-3.613846, 1, -7.678456, 1, 1.5, 0.5, 0.5,
-3.613846, 1, -7.678456, 0, 1.5, 0.5, 0.5,
-3.613846, 2, -7.678456, 0, -0.5, 0.5, 0.5,
-3.613846, 2, -7.678456, 1, -0.5, 0.5, 0.5,
-3.613846, 2, -7.678456, 1, 1.5, 0.5, 0.5,
-3.613846, 2, -7.678456, 0, 1.5, 0.5, 0.5
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
-3.153405, -3.21911, -6,
-3.153405, -3.21911, 6,
-3.153405, -3.21911, -6,
-3.306885, -3.376089, -6,
-3.153405, -3.21911, -4,
-3.306885, -3.376089, -4,
-3.153405, -3.21911, -2,
-3.306885, -3.376089, -2,
-3.153405, -3.21911, 0,
-3.306885, -3.376089, 0,
-3.153405, -3.21911, 2,
-3.306885, -3.376089, 2,
-3.153405, -3.21911, 4,
-3.306885, -3.376089, 4,
-3.153405, -3.21911, 6,
-3.306885, -3.376089, 6
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
-3.613846, -3.690048, -6, 0, -0.5, 0.5, 0.5,
-3.613846, -3.690048, -6, 1, -0.5, 0.5, 0.5,
-3.613846, -3.690048, -6, 1, 1.5, 0.5, 0.5,
-3.613846, -3.690048, -6, 0, 1.5, 0.5, 0.5,
-3.613846, -3.690048, -4, 0, -0.5, 0.5, 0.5,
-3.613846, -3.690048, -4, 1, -0.5, 0.5, 0.5,
-3.613846, -3.690048, -4, 1, 1.5, 0.5, 0.5,
-3.613846, -3.690048, -4, 0, 1.5, 0.5, 0.5,
-3.613846, -3.690048, -2, 0, -0.5, 0.5, 0.5,
-3.613846, -3.690048, -2, 1, -0.5, 0.5, 0.5,
-3.613846, -3.690048, -2, 1, 1.5, 0.5, 0.5,
-3.613846, -3.690048, -2, 0, 1.5, 0.5, 0.5,
-3.613846, -3.690048, 0, 0, -0.5, 0.5, 0.5,
-3.613846, -3.690048, 0, 1, -0.5, 0.5, 0.5,
-3.613846, -3.690048, 0, 1, 1.5, 0.5, 0.5,
-3.613846, -3.690048, 0, 0, 1.5, 0.5, 0.5,
-3.613846, -3.690048, 2, 0, -0.5, 0.5, 0.5,
-3.613846, -3.690048, 2, 1, -0.5, 0.5, 0.5,
-3.613846, -3.690048, 2, 1, 1.5, 0.5, 0.5,
-3.613846, -3.690048, 2, 0, 1.5, 0.5, 0.5,
-3.613846, -3.690048, 4, 0, -0.5, 0.5, 0.5,
-3.613846, -3.690048, 4, 1, -0.5, 0.5, 0.5,
-3.613846, -3.690048, 4, 1, 1.5, 0.5, 0.5,
-3.613846, -3.690048, 4, 0, 1.5, 0.5, 0.5,
-3.613846, -3.690048, 6, 0, -0.5, 0.5, 0.5,
-3.613846, -3.690048, 6, 1, -0.5, 0.5, 0.5,
-3.613846, -3.690048, 6, 1, 1.5, 0.5, 0.5,
-3.613846, -3.690048, 6, 0, 1.5, 0.5, 0.5
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
-3.153405, -3.21911, -6.708809,
-3.153405, 3.060056, -6.708809,
-3.153405, -3.21911, 6.219821,
-3.153405, 3.060056, 6.219821,
-3.153405, -3.21911, -6.708809,
-3.153405, -3.21911, 6.219821,
-3.153405, 3.060056, -6.708809,
-3.153405, 3.060056, 6.219821,
-3.153405, -3.21911, -6.708809,
2.985798, -3.21911, -6.708809,
-3.153405, -3.21911, 6.219821,
2.985798, -3.21911, 6.219821,
-3.153405, 3.060056, -6.708809,
2.985798, 3.060056, -6.708809,
-3.153405, 3.060056, 6.219821,
2.985798, 3.060056, 6.219821,
2.985798, -3.21911, -6.708809,
2.985798, 3.060056, -6.708809,
2.985798, -3.21911, 6.219821,
2.985798, 3.060056, 6.219821,
2.985798, -3.21911, -6.708809,
2.985798, -3.21911, 6.219821,
2.985798, 3.060056, -6.708809,
2.985798, 3.060056, 6.219821
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
var radius = 8.34561;
var distance = 37.13056;
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
mvMatrix.translate( 0.08380365, 0.0795269, 0.2444937 );
mvMatrix.scale( 1.469806, 1.437044, 0.6979422 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.13056);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
felodipine<-read.table("felodipine.xyz")
```

```
## Error in read.table("felodipine.xyz"): no lines available in input
```

```r
x<-felodipine$V2
```

```
## Error in eval(expr, envir, enclos): object 'felodipine' not found
```

```r
y<-felodipine$V3
```

```
## Error in eval(expr, envir, enclos): object 'felodipine' not found
```

```r
z<-felodipine$V4
```

```
## Error in eval(expr, envir, enclos): object 'felodipine' not found
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
-3.063999, -0.4041414, -3.341685, 0, 0, 1, 1, 1,
-2.918769, 1.635016, -1.177, 1, 0, 0, 1, 1,
-2.734626, 2.436657, 0.1328435, 1, 0, 0, 1, 1,
-2.666161, -0.7089922, -1.784221, 1, 0, 0, 1, 1,
-2.595089, 0.7737485, -1.302459, 1, 0, 0, 1, 1,
-2.585864, 1.595212, -0.6698638, 1, 0, 0, 1, 1,
-2.553263, 1.012231, -1.304147, 0, 0, 0, 1, 1,
-2.551453, 1.978194, 0.388717, 0, 0, 0, 1, 1,
-2.537999, -0.6150638, -1.859298, 0, 0, 0, 1, 1,
-2.46332, 1.135566, -1.02834, 0, 0, 0, 1, 1,
-2.314023, 1.687091, -2.128629, 0, 0, 0, 1, 1,
-2.24838, -3.127666, -2.570804, 0, 0, 0, 1, 1,
-2.244195, -1.305896, -1.044886, 0, 0, 0, 1, 1,
-2.203623, -0.6554556, -1.697765, 1, 1, 1, 1, 1,
-2.184291, -1.388189, -3.435503, 1, 1, 1, 1, 1,
-2.179224, -0.3448201, -2.926084, 1, 1, 1, 1, 1,
-2.131708, -0.1430168, -0.3375435, 1, 1, 1, 1, 1,
-2.11699, -0.27757, -1.340913, 1, 1, 1, 1, 1,
-2.024979, -0.06600705, -0.6294471, 1, 1, 1, 1, 1,
-2.008316, -0.7182786, -4.866384, 1, 1, 1, 1, 1,
-1.963609, -1.67975, -1.703742, 1, 1, 1, 1, 1,
-1.946795, -0.8522217, -2.643649, 1, 1, 1, 1, 1,
-1.938223, 1.491565, -1.240205, 1, 1, 1, 1, 1,
-1.91091, -0.6978915, -1.123035, 1, 1, 1, 1, 1,
-1.891406, -0.468179, -2.167056, 1, 1, 1, 1, 1,
-1.886173, -0.4763837, -1.742448, 1, 1, 1, 1, 1,
-1.879539, 1.410629, -1.135615, 1, 1, 1, 1, 1,
-1.877709, -0.4560118, -3.151783, 1, 1, 1, 1, 1,
-1.875785, 1.271112, 0.3515299, 0, 0, 1, 1, 1,
-1.826653, -1.081583, -2.905479, 1, 0, 0, 1, 1,
-1.826048, 0.5362653, -1.433876, 1, 0, 0, 1, 1,
-1.823786, -0.3790709, -0.03506574, 1, 0, 0, 1, 1,
-1.817491, 0.5273446, -1.106848, 1, 0, 0, 1, 1,
-1.815998, -0.6822618, -3.681878, 1, 0, 0, 1, 1,
-1.803591, -0.3597211, -5.018279, 0, 0, 0, 1, 1,
-1.788945, 0.1892182, -1.395888, 0, 0, 0, 1, 1,
-1.784431, 0.9650535, -0.2497243, 0, 0, 0, 1, 1,
-1.77268, 2.162836, -2.921674, 0, 0, 0, 1, 1,
-1.77006, 1.318484, -0.3710998, 0, 0, 0, 1, 1,
-1.760576, 0.8672313, -1.153289, 0, 0, 0, 1, 1,
-1.756956, 0.08484504, -0.387375, 0, 0, 0, 1, 1,
-1.735586, 0.2737565, 0.3037462, 1, 1, 1, 1, 1,
-1.715127, 2.114494, -1.310163, 1, 1, 1, 1, 1,
-1.701909, 0.1157577, -0.393602, 1, 1, 1, 1, 1,
-1.689859, 1.815567, -1.033565, 1, 1, 1, 1, 1,
-1.68961, -1.095587, -1.723238, 1, 1, 1, 1, 1,
-1.685736, 0.4061159, -1.033941, 1, 1, 1, 1, 1,
-1.675799, 1.278672, -2.040672, 1, 1, 1, 1, 1,
-1.663189, 0.2436434, -0.6005905, 1, 1, 1, 1, 1,
-1.651506, -0.1329466, -2.693435, 1, 1, 1, 1, 1,
-1.647357, 1.64189, -1.186663, 1, 1, 1, 1, 1,
-1.641592, 1.9348, 0.2188404, 1, 1, 1, 1, 1,
-1.639159, -0.1693819, -1.459109, 1, 1, 1, 1, 1,
-1.637837, -1.345286, -2.962528, 1, 1, 1, 1, 1,
-1.635267, -0.595252, -1.435855, 1, 1, 1, 1, 1,
-1.620965, -1.231052, -2.720567, 1, 1, 1, 1, 1,
-1.615491, 0.63754, -1.143336, 0, 0, 1, 1, 1,
-1.611311, 0.05730473, -0.553561, 1, 0, 0, 1, 1,
-1.60976, 0.8353466, -1.005139, 1, 0, 0, 1, 1,
-1.597041, -0.7659113, -2.123358, 1, 0, 0, 1, 1,
-1.590894, 0.1296889, -0.5289809, 1, 0, 0, 1, 1,
-1.571331, 1.793644, -0.4716703, 1, 0, 0, 1, 1,
-1.569929, -0.672585, -1.913592, 0, 0, 0, 1, 1,
-1.569321, -0.3098091, -0.6600326, 0, 0, 0, 1, 1,
-1.568862, 0.5380647, -2.074898, 0, 0, 0, 1, 1,
-1.558868, -0.8255858, -4.221644, 0, 0, 0, 1, 1,
-1.551342, 0.9484459, -0.9381, 0, 0, 0, 1, 1,
-1.548936, -0.700412, -3.193353, 0, 0, 0, 1, 1,
-1.545806, 0.9764597, -0.8595178, 0, 0, 0, 1, 1,
-1.541339, -1.019505, -2.760594, 1, 1, 1, 1, 1,
-1.535206, 0.3210855, -0.8751934, 1, 1, 1, 1, 1,
-1.525531, 0.03603065, -1.599461, 1, 1, 1, 1, 1,
-1.500213, 1.063612, -0.7210427, 1, 1, 1, 1, 1,
-1.499791, -1.564963, -3.652801, 1, 1, 1, 1, 1,
-1.483069, -0.8378118, -3.366256, 1, 1, 1, 1, 1,
-1.481718, 0.1701596, -1.894475, 1, 1, 1, 1, 1,
-1.477316, 0.6396368, -1.205343, 1, 1, 1, 1, 1,
-1.461319, 2.523127, -0.4658348, 1, 1, 1, 1, 1,
-1.455532, -0.3442347, -1.88195, 1, 1, 1, 1, 1,
-1.446736, 0.7210408, -1.51011, 1, 1, 1, 1, 1,
-1.441458, -1.344298, -3.081157, 1, 1, 1, 1, 1,
-1.440589, 1.398394, -1.005233, 1, 1, 1, 1, 1,
-1.428216, 0.4716996, -2.084587, 1, 1, 1, 1, 1,
-1.408566, -1.299812, -1.983087, 1, 1, 1, 1, 1,
-1.395262, 0.667701, 0.2916062, 0, 0, 1, 1, 1,
-1.381209, 0.2094099, -1.575274, 1, 0, 0, 1, 1,
-1.376308, -0.01712942, -1.386661, 1, 0, 0, 1, 1,
-1.373457, -0.8222408, -3.28738, 1, 0, 0, 1, 1,
-1.372319, 0.5586166, 0.7491916, 1, 0, 0, 1, 1,
-1.358338, 0.1996214, -2.405975, 1, 0, 0, 1, 1,
-1.356342, -2.869644, -1.774729, 0, 0, 0, 1, 1,
-1.356163, 2.089859, -2.585934, 0, 0, 0, 1, 1,
-1.350901, -0.7489782, -1.327422, 0, 0, 0, 1, 1,
-1.350685, -0.3559751, -2.764204, 0, 0, 0, 1, 1,
-1.338961, 1.479329, -3.092466, 0, 0, 0, 1, 1,
-1.336381, 0.06406288, -1.586896, 0, 0, 0, 1, 1,
-1.317454, -0.8278861, -2.154286, 0, 0, 0, 1, 1,
-1.314613, -1.029668, -3.413013, 1, 1, 1, 1, 1,
-1.31276, 0.141115, -2.38253, 1, 1, 1, 1, 1,
-1.307362, -0.5117446, -4.2533, 1, 1, 1, 1, 1,
-1.296446, -1.012218, -3.220301, 1, 1, 1, 1, 1,
-1.294078, 2.447599, -0.443797, 1, 1, 1, 1, 1,
-1.290643, 2.781618, 0.6407697, 1, 1, 1, 1, 1,
-1.285765, -0.1450559, -2.136798, 1, 1, 1, 1, 1,
-1.273698, 1.065315, -2.015761, 1, 1, 1, 1, 1,
-1.269739, -0.4981741, -3.210841, 1, 1, 1, 1, 1,
-1.25903, -0.03726644, -0.3701478, 1, 1, 1, 1, 1,
-1.252217, -1.540163, -1.062815, 1, 1, 1, 1, 1,
-1.244005, 0.7241687, -1.155164, 1, 1, 1, 1, 1,
-1.242619, 1.360504, -0.04147242, 1, 1, 1, 1, 1,
-1.24109, 0.030675, -1.58307, 1, 1, 1, 1, 1,
-1.237013, 0.9396684, -0.3165822, 1, 1, 1, 1, 1,
-1.229986, 0.847416, 0.8316365, 0, 0, 1, 1, 1,
-1.229771, 0.6362172, -1.263473, 1, 0, 0, 1, 1,
-1.225825, -1.320442, -3.795931, 1, 0, 0, 1, 1,
-1.222953, -1.102117, -2.200301, 1, 0, 0, 1, 1,
-1.219791, -0.4075744, -2.62942, 1, 0, 0, 1, 1,
-1.216912, -0.4321965, 1.015039, 1, 0, 0, 1, 1,
-1.216152, -0.1301423, -2.972524, 0, 0, 0, 1, 1,
-1.202026, -0.7630766, -0.8618627, 0, 0, 0, 1, 1,
-1.199585, -0.4914679, -2.136942, 0, 0, 0, 1, 1,
-1.190177, 1.545509, -0.8069001, 0, 0, 0, 1, 1,
-1.187784, -0.487888, -2.892252, 0, 0, 0, 1, 1,
-1.185072, -0.6748528, -2.521445, 0, 0, 0, 1, 1,
-1.179016, 1.14485, -1.445789, 0, 0, 0, 1, 1,
-1.177182, -1.578302, -3.313739, 1, 1, 1, 1, 1,
-1.167867, 1.197452, -1.27972, 1, 1, 1, 1, 1,
-1.161445, 0.1087377, -0.4257521, 1, 1, 1, 1, 1,
-1.150769, 0.8692203, -0.8502293, 1, 1, 1, 1, 1,
-1.139989, -0.07817145, -1.802786, 1, 1, 1, 1, 1,
-1.13194, 0.6999239, -2.339776, 1, 1, 1, 1, 1,
-1.112662, -0.2360297, -0.9013704, 1, 1, 1, 1, 1,
-1.10841, 0.6273693, -1.096189, 1, 1, 1, 1, 1,
-1.105452, -1.194864, -2.044043, 1, 1, 1, 1, 1,
-1.100491, -1.281639, -3.086869, 1, 1, 1, 1, 1,
-1.094932, -0.8619606, -1.48884, 1, 1, 1, 1, 1,
-1.094317, 0.03579553, -1.933259, 1, 1, 1, 1, 1,
-1.09287, -1.589718, -4.396979, 1, 1, 1, 1, 1,
-1.089597, -1.041337, -0.4721133, 1, 1, 1, 1, 1,
-1.088584, 0.6731764, -0.5686386, 1, 1, 1, 1, 1,
-1.086562, 0.1096835, -2.268251, 0, 0, 1, 1, 1,
-1.079372, 1.214973, -1.286188, 1, 0, 0, 1, 1,
-1.073138, -0.634195, -3.51086, 1, 0, 0, 1, 1,
-1.064118, 2.369872, -1.926065, 1, 0, 0, 1, 1,
-1.059438, 0.1402486, -2.788966, 1, 0, 0, 1, 1,
-1.055036, -1.225773, -2.148284, 1, 0, 0, 1, 1,
-1.054937, -0.3363404, -2.164224, 0, 0, 0, 1, 1,
-1.051181, -1.414436, -1.217057, 0, 0, 0, 1, 1,
-1.047392, 0.3264627, -1.1042, 0, 0, 0, 1, 1,
-1.037899, 0.1736444, -2.988411, 0, 0, 0, 1, 1,
-1.035921, 1.887184, 0.6131497, 0, 0, 0, 1, 1,
-1.035118, -0.4725224, -1.040456, 0, 0, 0, 1, 1,
-1.034118, -0.4236979, -1.620394, 0, 0, 0, 1, 1,
-1.030451, -0.03205505, -2.637405, 1, 1, 1, 1, 1,
-1.028873, 1.347664, -0.3922735, 1, 1, 1, 1, 1,
-1.023682, -1.331681, -2.393401, 1, 1, 1, 1, 1,
-1.022493, 1.822059, -0.9886825, 1, 1, 1, 1, 1,
-1.021434, -0.06455624, -1.918592, 1, 1, 1, 1, 1,
-1.000806, -0.6090876, -1.077486, 1, 1, 1, 1, 1,
-0.9998197, -0.1781431, -2.338985, 1, 1, 1, 1, 1,
-0.9937239, -0.1643438, -1.467865, 1, 1, 1, 1, 1,
-0.9930583, -0.9120156, -3.943143, 1, 1, 1, 1, 1,
-0.9897616, -0.3551993, -3.582475, 1, 1, 1, 1, 1,
-0.9867705, -0.1442288, -2.152496, 1, 1, 1, 1, 1,
-0.9860314, 1.225457, -0.9175015, 1, 1, 1, 1, 1,
-0.984219, 0.1892364, -1.615362, 1, 1, 1, 1, 1,
-0.9830292, 0.2536115, -2.23088, 1, 1, 1, 1, 1,
-0.9828292, 0.0642677, -2.75366, 1, 1, 1, 1, 1,
-0.9760182, -0.3628209, -1.936466, 0, 0, 1, 1, 1,
-0.9738925, -0.08519872, -0.8128633, 1, 0, 0, 1, 1,
-0.9721964, 1.502797, 0.3668508, 1, 0, 0, 1, 1,
-0.9690555, 0.5385329, -1.967114, 1, 0, 0, 1, 1,
-0.96394, 0.3898368, -1.397485, 1, 0, 0, 1, 1,
-0.9614058, 1.680507, -0.225452, 1, 0, 0, 1, 1,
-0.9536639, -0.3497573, -1.521235, 0, 0, 0, 1, 1,
-0.9495903, -0.4189171, -2.706636, 0, 0, 0, 1, 1,
-0.9435164, -0.6264612, -0.8009928, 0, 0, 0, 1, 1,
-0.9431281, 1.165981, -1.415006, 0, 0, 0, 1, 1,
-0.9390317, -0.2188308, -2.66914, 0, 0, 0, 1, 1,
-0.9385438, 0.4465788, -1.812828, 0, 0, 0, 1, 1,
-0.9361635, 1.525468, -0.3304482, 0, 0, 0, 1, 1,
-0.9348937, -0.2152861, -1.331879, 1, 1, 1, 1, 1,
-0.9240162, -2.28927, -2.163298, 1, 1, 1, 1, 1,
-0.9236354, 0.094505, -2.065752, 1, 1, 1, 1, 1,
-0.9218488, -1.447936, -3.404696, 1, 1, 1, 1, 1,
-0.9096, 0.6706035, -0.383896, 1, 1, 1, 1, 1,
-0.9087561, -0.009670764, -2.322466, 1, 1, 1, 1, 1,
-0.9079208, 0.2639156, 0.1289467, 1, 1, 1, 1, 1,
-0.9057453, 1.130277, 0.1883129, 1, 1, 1, 1, 1,
-0.9010118, 0.5449826, -0.6556429, 1, 1, 1, 1, 1,
-0.8960174, 0.1008242, -0.956377, 1, 1, 1, 1, 1,
-0.8773544, 0.8235148, -2.274544, 1, 1, 1, 1, 1,
-0.872287, 0.3469778, -0.76731, 1, 1, 1, 1, 1,
-0.8648174, 1.636535, -0.4367512, 1, 1, 1, 1, 1,
-0.8639121, -0.8273851, -2.735147, 1, 1, 1, 1, 1,
-0.8636583, -1.644267, -3.768382, 1, 1, 1, 1, 1,
-0.8633817, -1.917992, -2.45407, 0, 0, 1, 1, 1,
-0.8606115, -0.8324605, -2.601599, 1, 0, 0, 1, 1,
-0.8591413, -0.6899783, -3.427713, 1, 0, 0, 1, 1,
-0.8509066, 0.8817163, -0.05815119, 1, 0, 0, 1, 1,
-0.8505121, -0.8311701, -1.996952, 1, 0, 0, 1, 1,
-0.8450602, -1.18232, -2.532613, 1, 0, 0, 1, 1,
-0.8420396, -0.3922507, -1.791846, 0, 0, 0, 1, 1,
-0.8385721, -0.8495259, -1.413335, 0, 0, 0, 1, 1,
-0.8312887, 0.4424891, -3.104569, 0, 0, 0, 1, 1,
-0.8281507, 0.04138331, -1.915246, 0, 0, 0, 1, 1,
-0.8208145, -0.5599453, -0.5084628, 0, 0, 0, 1, 1,
-0.8196155, 0.5782728, -0.1553462, 0, 0, 0, 1, 1,
-0.8185809, 0.1347412, -1.862837, 0, 0, 0, 1, 1,
-0.8181384, 1.115221, -0.4147799, 1, 1, 1, 1, 1,
-0.8161672, 2.854376, -0.6131905, 1, 1, 1, 1, 1,
-0.8108895, -2.195931, -2.927068, 1, 1, 1, 1, 1,
-0.8054897, 0.1530796, -2.502917, 1, 1, 1, 1, 1,
-0.8032392, -0.08620963, -1.61486, 1, 1, 1, 1, 1,
-0.8025725, -0.7809321, -1.84922, 1, 1, 1, 1, 1,
-0.7986489, 0.1304912, -2.163249, 1, 1, 1, 1, 1,
-0.7862547, -0.387107, -2.23861, 1, 1, 1, 1, 1,
-0.7813223, -0.5429101, -1.752711, 1, 1, 1, 1, 1,
-0.7782567, -1.61974, -1.477143, 1, 1, 1, 1, 1,
-0.7763228, 0.3637584, -1.566378, 1, 1, 1, 1, 1,
-0.7759445, 0.6889906, -0.5216328, 1, 1, 1, 1, 1,
-0.7748501, -0.7404845, -2.978581, 1, 1, 1, 1, 1,
-0.7711588, -1.032009, -1.163268, 1, 1, 1, 1, 1,
-0.7710388, -0.1937879, -1.439357, 1, 1, 1, 1, 1,
-0.7604232, -1.499537, -1.970965, 0, 0, 1, 1, 1,
-0.7532145, 0.9672148, 0.6343202, 1, 0, 0, 1, 1,
-0.75236, 0.736411, -0.9104475, 1, 0, 0, 1, 1,
-0.7507139, 2.132535, 0.3503227, 1, 0, 0, 1, 1,
-0.7425895, -1.026165, -3.261718, 1, 0, 0, 1, 1,
-0.7372884, 0.9369468, 0.3632606, 1, 0, 0, 1, 1,
-0.7361385, 1.461659, 0.8372774, 0, 0, 0, 1, 1,
-0.7351315, -1.320396, -2.948819, 0, 0, 0, 1, 1,
-0.7324209, 0.366704, -2.229778, 0, 0, 0, 1, 1,
-0.7320155, -1.205796, -1.764763, 0, 0, 0, 1, 1,
-0.7264451, -0.7729607, -2.942537, 0, 0, 0, 1, 1,
-0.7260844, 0.1078314, -1.287189, 0, 0, 0, 1, 1,
-0.7192801, -0.59025, -3.062339, 0, 0, 0, 1, 1,
-0.7135342, 0.9642159, 0.7798671, 1, 1, 1, 1, 1,
-0.7066069, 0.3552871, -1.410625, 1, 1, 1, 1, 1,
-0.7057593, -1.627629, -3.846592, 1, 1, 1, 1, 1,
-0.703961, 0.1156663, 0.327929, 1, 1, 1, 1, 1,
-0.6934369, 1.229314, -1.098099, 1, 1, 1, 1, 1,
-0.6907199, 0.6004221, -0.5972638, 1, 1, 1, 1, 1,
-0.6896735, -0.02008547, -2.228675, 1, 1, 1, 1, 1,
-0.6844847, 0.1593011, -1.679142, 1, 1, 1, 1, 1,
-0.6828723, 0.1217366, -2.377077, 1, 1, 1, 1, 1,
-0.6817051, -0.1724862, 0.4555145, 1, 1, 1, 1, 1,
-0.6765421, -0.293535, -2.126037, 1, 1, 1, 1, 1,
-0.6734716, -0.06495094, -3.701744, 1, 1, 1, 1, 1,
-0.6721427, 0.7954791, -2.128189, 1, 1, 1, 1, 1,
-0.6669512, 1.823512, 0.9322596, 1, 1, 1, 1, 1,
-0.6622586, 1.033391, -2.613439, 1, 1, 1, 1, 1,
-0.660825, 0.4349792, -0.1319162, 0, 0, 1, 1, 1,
-0.657317, -1.146811, -2.285442, 1, 0, 0, 1, 1,
-0.6483104, 1.701573, 0.4795808, 1, 0, 0, 1, 1,
-0.6431829, -1.918724, -0.5704743, 1, 0, 0, 1, 1,
-0.6429155, 0.9668819, -1.27754, 1, 0, 0, 1, 1,
-0.6418561, 1.032292, 0.4080875, 1, 0, 0, 1, 1,
-0.639006, -1.365687, -2.367063, 0, 0, 0, 1, 1,
-0.6375417, -0.1734329, -0.005083793, 0, 0, 0, 1, 1,
-0.6347781, -0.7896475, -1.940343, 0, 0, 0, 1, 1,
-0.6299362, 0.6966487, 0.1869189, 0, 0, 0, 1, 1,
-0.6286054, 1.32905, -0.3984661, 0, 0, 0, 1, 1,
-0.6264365, 1.148845, 0.5987257, 0, 0, 0, 1, 1,
-0.623545, -1.362289, -1.074446, 0, 0, 0, 1, 1,
-0.6228681, 0.1754288, -1.861707, 1, 1, 1, 1, 1,
-0.6162761, -0.04520889, -2.8419, 1, 1, 1, 1, 1,
-0.6146468, 0.9807877, -0.8016198, 1, 1, 1, 1, 1,
-0.6103801, -0.6120448, -1.934718, 1, 1, 1, 1, 1,
-0.6082669, 0.6765931, -0.6343735, 1, 1, 1, 1, 1,
-0.6060288, -0.5821712, -1.635138, 1, 1, 1, 1, 1,
-0.5990797, -0.77126, -2.717774, 1, 1, 1, 1, 1,
-0.5979131, -1.080466, -3.27986, 1, 1, 1, 1, 1,
-0.596167, -1.323143, -4.19469, 1, 1, 1, 1, 1,
-0.5929005, -0.03251661, -0.7133622, 1, 1, 1, 1, 1,
-0.592272, 0.9715474, -0.245718, 1, 1, 1, 1, 1,
-0.5911707, -0.5257908, -2.221116, 1, 1, 1, 1, 1,
-0.590883, -1.240931, -3.174768, 1, 1, 1, 1, 1,
-0.589869, -0.02651339, -2.367847, 1, 1, 1, 1, 1,
-0.588895, -0.4916797, -2.288505, 1, 1, 1, 1, 1,
-0.5880023, 0.03778283, -1.891095, 0, 0, 1, 1, 1,
-0.5678557, 0.1082165, -0.7853284, 1, 0, 0, 1, 1,
-0.567118, 0.4486354, -2.337126, 1, 0, 0, 1, 1,
-0.5668476, -0.1330014, -1.702852, 1, 0, 0, 1, 1,
-0.5662885, -0.6456068, -0.8353884, 1, 0, 0, 1, 1,
-0.5610203, 1.605069, 0.3530919, 1, 0, 0, 1, 1,
-0.538429, -0.358723, -1.390333, 0, 0, 0, 1, 1,
-0.5338414, -0.768458, -1.624157, 0, 0, 0, 1, 1,
-0.5331818, -0.7177173, -2.264591, 0, 0, 0, 1, 1,
-0.5330866, 1.23552, 1.92191, 0, 0, 0, 1, 1,
-0.5295994, 0.6693652, -1.682224, 0, 0, 0, 1, 1,
-0.526655, 0.6943954, -1.539635, 0, 0, 0, 1, 1,
-0.5233959, -0.1887521, -1.174785, 0, 0, 0, 1, 1,
-0.5185359, 1.116337, -1.100413, 1, 1, 1, 1, 1,
-0.5163904, 0.08708736, -1.939665, 1, 1, 1, 1, 1,
-0.5127777, -1.48239, -1.716145, 1, 1, 1, 1, 1,
-0.5114381, -0.0597176, -1.379456, 1, 1, 1, 1, 1,
-0.5110459, 0.5973328, -0.9085841, 1, 1, 1, 1, 1,
-0.5049395, -0.02024754, -1.569459, 1, 1, 1, 1, 1,
-0.5027769, 1.956337, 0.6006898, 1, 1, 1, 1, 1,
-0.5023438, -1.234175, -4.248023, 1, 1, 1, 1, 1,
-0.4992803, 0.2375446, -3.874357, 1, 1, 1, 1, 1,
-0.4984108, 0.6502082, -1.393054, 1, 1, 1, 1, 1,
-0.496432, -0.6625152, -2.874142, 1, 1, 1, 1, 1,
-0.4958475, 1.305421, 0.1577801, 1, 1, 1, 1, 1,
-0.4926267, 0.4347404, -0.7372515, 1, 1, 1, 1, 1,
-0.4787513, 0.4787009, -0.9483169, 1, 1, 1, 1, 1,
-0.4770189, 1.854791, -0.2631389, 1, 1, 1, 1, 1,
-0.4735738, -1.472465, -2.647918, 0, 0, 1, 1, 1,
-0.4734697, -1.304334, -3.846695, 1, 0, 0, 1, 1,
-0.4717014, -0.183805, -2.679279, 1, 0, 0, 1, 1,
-0.4667877, -0.3025657, -3.9501, 1, 0, 0, 1, 1,
-0.4601238, 0.2676792, -0.9328039, 1, 0, 0, 1, 1,
-0.4599944, -1.635328, -2.687935, 1, 0, 0, 1, 1,
-0.4535691, -0.4918368, -1.832189, 0, 0, 0, 1, 1,
-0.449161, -1.312007, -3.16963, 0, 0, 0, 1, 1,
-0.4488766, -0.4866715, -1.298093, 0, 0, 0, 1, 1,
-0.4459196, -1.315634, -2.970606, 0, 0, 0, 1, 1,
-0.4455974, -0.0653308, -2.567414, 0, 0, 0, 1, 1,
-0.4451907, 0.4975282, 0.1627358, 0, 0, 0, 1, 1,
-0.4445301, 0.8794325, 0.3589597, 0, 0, 0, 1, 1,
-0.4407046, 1.556064, -0.9122049, 1, 1, 1, 1, 1,
-0.4404723, -0.8823442, -3.084595, 1, 1, 1, 1, 1,
-0.4340423, -0.3032124, -3.50202, 1, 1, 1, 1, 1,
-0.4297826, 0.005777541, -2.665663, 1, 1, 1, 1, 1,
-0.4219466, 0.1010669, -0.2314734, 1, 1, 1, 1, 1,
-0.4212896, -2.961531, -2.823606, 1, 1, 1, 1, 1,
-0.4203138, 0.2567221, -0.743803, 1, 1, 1, 1, 1,
-0.4182006, 0.6461269, 0.3627803, 1, 1, 1, 1, 1,
-0.4158957, -1.042161, -2.852593, 1, 1, 1, 1, 1,
-0.4041616, 0.3153205, 0.397533, 1, 1, 1, 1, 1,
-0.401368, 0.6419029, -0.9317774, 1, 1, 1, 1, 1,
-0.4010914, 0.3555017, -0.610113, 1, 1, 1, 1, 1,
-0.401016, -1.516778, -4.708711, 1, 1, 1, 1, 1,
-0.399102, 0.2410603, -0.3612764, 1, 1, 1, 1, 1,
-0.3981928, -1.733869, -3.463851, 1, 1, 1, 1, 1,
-0.3980434, -0.7914189, -2.255608, 0, 0, 1, 1, 1,
-0.3964015, -0.08202092, -2.560116, 1, 0, 0, 1, 1,
-0.3955035, -1.248075, -3.244992, 1, 0, 0, 1, 1,
-0.3911589, -0.3542201, -2.767525, 1, 0, 0, 1, 1,
-0.3874443, -0.2042069, -3.064581, 1, 0, 0, 1, 1,
-0.3849421, 1.351365, 0.6010334, 1, 0, 0, 1, 1,
-0.3848726, -0.7715818, -2.581463, 0, 0, 0, 1, 1,
-0.3846664, 0.1407373, -0.07904036, 0, 0, 0, 1, 1,
-0.3797783, -1.54137, -4.319788, 0, 0, 0, 1, 1,
-0.3784947, -0.8645245, -3.748812, 0, 0, 0, 1, 1,
-0.3777148, -1.76504, -3.971574, 0, 0, 0, 1, 1,
-0.3773699, 0.5220737, -0.2673731, 0, 0, 0, 1, 1,
-0.3771234, -0.4827399, -2.811846, 0, 0, 0, 1, 1,
-0.375329, -0.2460991, -1.607688, 1, 1, 1, 1, 1,
-0.3702754, 0.1494453, -2.364175, 1, 1, 1, 1, 1,
-0.3646191, 0.3926656, 0.6573752, 1, 1, 1, 1, 1,
-0.3644633, 0.8740032, -1.666461, 1, 1, 1, 1, 1,
-0.3631018, 0.6194487, -1.514685, 1, 1, 1, 1, 1,
-0.3575245, 1.939693, -0.5987704, 1, 1, 1, 1, 1,
-0.3558739, -0.6788236, -3.346593, 1, 1, 1, 1, 1,
-0.3554486, 0.2038498, -0.6285557, 1, 1, 1, 1, 1,
-0.3513524, -0.6687639, -3.656189, 1, 1, 1, 1, 1,
-0.3510209, 2.416691, 0.1075716, 1, 1, 1, 1, 1,
-0.3430524, 0.2346695, -2.382208, 1, 1, 1, 1, 1,
-0.3422509, -0.7723755, -3.728723, 1, 1, 1, 1, 1,
-0.336976, -1.646113, -1.879495, 1, 1, 1, 1, 1,
-0.3356701, 1.11249, -1.000631, 1, 1, 1, 1, 1,
-0.333157, -0.9959257, -3.077827, 1, 1, 1, 1, 1,
-0.3314868, -0.05045951, -0.9581929, 0, 0, 1, 1, 1,
-0.3305312, -0.8173613, -1.760201, 1, 0, 0, 1, 1,
-0.3263366, -0.05618728, -0.618581, 1, 0, 0, 1, 1,
-0.3233896, 0.8900806, -0.2165156, 1, 0, 0, 1, 1,
-0.3193685, 1.868366, -0.03746744, 1, 0, 0, 1, 1,
-0.3189673, 0.9884561, -0.0253724, 1, 0, 0, 1, 1,
-0.3179819, 0.2887835, -2.091473, 0, 0, 0, 1, 1,
-0.3121479, 0.05890281, -1.409487, 0, 0, 0, 1, 1,
-0.3117586, 0.5478516, -1.600109, 0, 0, 0, 1, 1,
-0.3096419, 0.2626771, -2.488383, 0, 0, 0, 1, 1,
-0.3047099, -0.006811411, -1.236565, 0, 0, 0, 1, 1,
-0.3011352, 0.7406489, -2.781809, 0, 0, 0, 1, 1,
-0.2996177, 0.003936442, -1.714115, 0, 0, 0, 1, 1,
-0.2983506, -0.3515748, -1.829985, 1, 1, 1, 1, 1,
-0.2978266, 0.6443908, -0.8121101, 1, 1, 1, 1, 1,
-0.2934996, -0.9620308, -3.574678, 1, 1, 1, 1, 1,
-0.2932342, -1.159412, -2.681898, 1, 1, 1, 1, 1,
-0.2879666, -1.104775, -2.527851, 1, 1, 1, 1, 1,
-0.2866129, -1.757406, -4.81097, 1, 1, 1, 1, 1,
-0.2861139, -0.02118811, -1.979825, 1, 1, 1, 1, 1,
-0.2847729, 0.5842756, -0.7876626, 1, 1, 1, 1, 1,
-0.2841262, -0.6765589, -6.520528, 1, 1, 1, 1, 1,
-0.2832353, -1.439143, -3.249334, 1, 1, 1, 1, 1,
-0.2795208, 0.4095329, -2.540406, 1, 1, 1, 1, 1,
-0.2785441, -0.640716, -3.971809, 1, 1, 1, 1, 1,
-0.2758557, -0.4278057, -1.600836, 1, 1, 1, 1, 1,
-0.2730888, -0.97326, -3.039593, 1, 1, 1, 1, 1,
-0.2714574, -0.5100808, -2.534253, 1, 1, 1, 1, 1,
-0.2619395, 0.4980227, -1.360738, 0, 0, 1, 1, 1,
-0.2550056, -2.184175, -2.380553, 1, 0, 0, 1, 1,
-0.2542818, 0.02414703, -1.246246, 1, 0, 0, 1, 1,
-0.2515253, 0.4345618, -0.564925, 1, 0, 0, 1, 1,
-0.2388123, 1.374471, 1.530181, 1, 0, 0, 1, 1,
-0.234619, 0.6054336, 0.04760928, 1, 0, 0, 1, 1,
-0.2303738, -0.869652, -2.964945, 0, 0, 0, 1, 1,
-0.2274606, 0.3629861, 0.05012895, 0, 0, 0, 1, 1,
-0.2234349, -1.866279, -2.977543, 0, 0, 0, 1, 1,
-0.2193187, 1.019327, 0.7219707, 0, 0, 0, 1, 1,
-0.2166968, -1.729236, -2.66389, 0, 0, 0, 1, 1,
-0.2157388, 0.3850949, -0.1396155, 0, 0, 0, 1, 1,
-0.2060941, -0.5960188, -2.447927, 0, 0, 0, 1, 1,
-0.2044079, 0.1260967, 0.3733761, 1, 1, 1, 1, 1,
-0.2031843, -0.5687408, -1.036731, 1, 1, 1, 1, 1,
-0.2024349, -0.1054442, -0.9488987, 1, 1, 1, 1, 1,
-0.201256, -0.8447152, -2.186097, 1, 1, 1, 1, 1,
-0.20106, 0.5894179, 0.9988084, 1, 1, 1, 1, 1,
-0.1988665, 1.037911, -0.06053679, 1, 1, 1, 1, 1,
-0.1971785, -0.5758439, -3.20397, 1, 1, 1, 1, 1,
-0.1957462, 0.3764957, -1.219563, 1, 1, 1, 1, 1,
-0.1949545, 1.128775, 0.007958383, 1, 1, 1, 1, 1,
-0.1916918, -0.3733535, -2.061878, 1, 1, 1, 1, 1,
-0.1916227, 0.6004025, -1.171257, 1, 1, 1, 1, 1,
-0.1912125, -1.786546, -3.74161, 1, 1, 1, 1, 1,
-0.1843621, 1.004924, 0.1937102, 1, 1, 1, 1, 1,
-0.1779556, -0.2157331, -3.563848, 1, 1, 1, 1, 1,
-0.1761318, 0.6274138, -0.4816101, 1, 1, 1, 1, 1,
-0.1744074, -1.298781, -3.077353, 0, 0, 1, 1, 1,
-0.1711132, 1.315701, -1.649737, 1, 0, 0, 1, 1,
-0.1646825, 0.3362924, 0.03141318, 1, 0, 0, 1, 1,
-0.1645137, 1.239689, -1.526742, 1, 0, 0, 1, 1,
-0.1589114, 0.344104, 0.3512452, 1, 0, 0, 1, 1,
-0.1533616, -1.772157, -3.181594, 1, 0, 0, 1, 1,
-0.1516893, -0.7939419, -0.1150879, 0, 0, 0, 1, 1,
-0.1494355, -0.3085104, -3.812262, 0, 0, 0, 1, 1,
-0.1477755, -0.04068266, -2.073248, 0, 0, 0, 1, 1,
-0.1462675, -0.7740985, -4.646185, 0, 0, 0, 1, 1,
-0.1367983, 0.1708697, -0.007869137, 0, 0, 0, 1, 1,
-0.132208, 1.25795, 0.7073585, 0, 0, 0, 1, 1,
-0.128153, -1.270032, -3.473493, 0, 0, 0, 1, 1,
-0.1268199, -0.1386136, -2.622108, 1, 1, 1, 1, 1,
-0.1251955, 0.7233812, 0.1290363, 1, 1, 1, 1, 1,
-0.1240715, -2.381535, -3.012588, 1, 1, 1, 1, 1,
-0.1216975, -0.1175054, -1.290519, 1, 1, 1, 1, 1,
-0.1216763, 1.107047, -2.027333, 1, 1, 1, 1, 1,
-0.1089728, -0.9796393, -3.155111, 1, 1, 1, 1, 1,
-0.1068282, -0.920624, -3.625874, 1, 1, 1, 1, 1,
-0.1029758, -0.3317956, -2.033821, 1, 1, 1, 1, 1,
-0.1000571, 0.05049608, -1.077893, 1, 1, 1, 1, 1,
-0.0936293, 0.547691, -0.4153242, 1, 1, 1, 1, 1,
-0.08815498, -0.3630025, -2.153085, 1, 1, 1, 1, 1,
-0.08776747, 1.211653, 0.4861816, 1, 1, 1, 1, 1,
-0.08571968, -0.7775714, -3.867411, 1, 1, 1, 1, 1,
-0.07107131, -0.483707, -2.327887, 1, 1, 1, 1, 1,
-0.06911521, 0.8437169, -0.5449411, 1, 1, 1, 1, 1,
-0.06867256, 0.6400945, -0.05484725, 0, 0, 1, 1, 1,
-0.06684582, -0.980649, -2.164294, 1, 0, 0, 1, 1,
-0.06576105, -1.734985, -2.874881, 1, 0, 0, 1, 1,
-0.06485737, 1.970765, 0.05940768, 1, 0, 0, 1, 1,
-0.05476224, -0.9302108, -2.094862, 1, 0, 0, 1, 1,
-0.05277101, -0.8736958, -1.058632, 1, 0, 0, 1, 1,
-0.05237171, -0.7181003, -3.473516, 0, 0, 0, 1, 1,
-0.0474911, -1.601764, -2.016589, 0, 0, 0, 1, 1,
-0.04570514, 0.3471327, 1.337346, 0, 0, 0, 1, 1,
-0.04444584, -0.9388309, -3.152379, 0, 0, 0, 1, 1,
-0.04344496, 0.7133957, -0.962746, 0, 0, 0, 1, 1,
-0.0408014, -0.9618186, -2.780553, 0, 0, 0, 1, 1,
-0.04023197, -2.150797, -3.936525, 0, 0, 0, 1, 1,
-0.03701827, 0.5015315, 2.397267, 1, 1, 1, 1, 1,
-0.0361848, 0.465117, -0.7704382, 1, 1, 1, 1, 1,
-0.03300744, 0.5327783, -0.8159217, 1, 1, 1, 1, 1,
-0.03097289, -0.5543864, -1.593904, 1, 1, 1, 1, 1,
-0.02966736, -0.9471007, -3.849649, 1, 1, 1, 1, 1,
-0.01991935, 0.9966713, 0.9840798, 1, 1, 1, 1, 1,
-0.01897879, 0.7057757, -0.04935011, 1, 1, 1, 1, 1,
-0.01877464, -0.8180366, -1.844735, 1, 1, 1, 1, 1,
-0.01301369, 0.5440876, -1.011954, 1, 1, 1, 1, 1,
-0.01204677, 0.2687805, -2.13581, 1, 1, 1, 1, 1,
-0.008634331, -2.351799, -1.407486, 1, 1, 1, 1, 1,
-0.00701231, 0.4536321, -0.06157845, 1, 1, 1, 1, 1,
-0.004454203, -1.210788, -2.291553, 1, 1, 1, 1, 1,
0.0009474336, 1.180629, 0.6996045, 1, 1, 1, 1, 1,
0.00102866, 0.3699243, 1.037102, 1, 1, 1, 1, 1,
0.002480261, 0.9133041, 0.5275719, 0, 0, 1, 1, 1,
0.006007377, 0.1489133, -1.651663, 1, 0, 0, 1, 1,
0.008856275, 0.3241034, -0.3975407, 1, 0, 0, 1, 1,
0.01590535, -0.09148891, 2.340008, 1, 0, 0, 1, 1,
0.01686889, -1.590535, 3.077814, 1, 0, 0, 1, 1,
0.01779368, -0.7744076, 1.844295, 1, 0, 0, 1, 1,
0.01807897, 0.6206567, 1.0017, 0, 0, 0, 1, 1,
0.01814033, -0.4716027, 4.617515, 0, 0, 0, 1, 1,
0.0185433, 1.03009, 1.780763, 0, 0, 0, 1, 1,
0.0186381, 1.266718, -0.7692626, 0, 0, 0, 1, 1,
0.01964135, 1.958439, 0.5825305, 0, 0, 0, 1, 1,
0.02114, -0.7696187, 3.417725, 0, 0, 0, 1, 1,
0.02304725, 0.1991965, -0.4486389, 0, 0, 0, 1, 1,
0.02568994, -0.5566476, 3.338791, 1, 1, 1, 1, 1,
0.02890662, 1.009897, 0.923855, 1, 1, 1, 1, 1,
0.0345031, -0.360871, 3.462983, 1, 1, 1, 1, 1,
0.03517165, 1.692412, -0.2876365, 1, 1, 1, 1, 1,
0.03631307, -0.3316379, 2.541867, 1, 1, 1, 1, 1,
0.03778363, -0.1336414, 2.717741, 1, 1, 1, 1, 1,
0.0395197, 1.737627, -0.02263538, 1, 1, 1, 1, 1,
0.03961545, -0.2471386, 3.157284, 1, 1, 1, 1, 1,
0.0400135, -1.67473, 3.939512, 1, 1, 1, 1, 1,
0.04046927, -0.5796343, 2.468688, 1, 1, 1, 1, 1,
0.04062306, -1.381232, 3.034547, 1, 1, 1, 1, 1,
0.04083763, -1.294431, 2.148774, 1, 1, 1, 1, 1,
0.04197191, 0.5409136, 1.550947, 1, 1, 1, 1, 1,
0.04355107, 0.4971917, -0.3848061, 1, 1, 1, 1, 1,
0.04610316, 0.4436254, -0.5101355, 1, 1, 1, 1, 1,
0.04618545, -0.8147337, 4.845185, 0, 0, 1, 1, 1,
0.0461889, -0.5902182, 2.751053, 1, 0, 0, 1, 1,
0.04671302, 0.0356961, 2.050993, 1, 0, 0, 1, 1,
0.05301236, -1.201847, 4.93642, 1, 0, 0, 1, 1,
0.05527327, 1.311263, -0.0008581294, 1, 0, 0, 1, 1,
0.05536124, -0.4254802, 2.312692, 1, 0, 0, 1, 1,
0.05568575, 1.873555, 0.5769615, 0, 0, 0, 1, 1,
0.05615957, -0.08068632, 2.298121, 0, 0, 0, 1, 1,
0.0631009, -1.876817, 3.083463, 0, 0, 0, 1, 1,
0.066521, -0.6448867, 3.11635, 0, 0, 0, 1, 1,
0.06909192, -0.2811857, 6.03154, 0, 0, 0, 1, 1,
0.06961274, 1.084345, 1.70218, 0, 0, 0, 1, 1,
0.07351858, -1.092144, 3.067554, 0, 0, 0, 1, 1,
0.07536207, 1.582976, 0.4371675, 1, 1, 1, 1, 1,
0.07762228, -1.846469, 1.631419, 1, 1, 1, 1, 1,
0.07796352, 0.03242682, -0.2452203, 1, 1, 1, 1, 1,
0.07851068, -0.9548258, 2.148583, 1, 1, 1, 1, 1,
0.08005943, -0.4291848, 3.706238, 1, 1, 1, 1, 1,
0.0800641, 0.5154424, -0.09884002, 1, 1, 1, 1, 1,
0.0817266, 0.2745298, 0.4967483, 1, 1, 1, 1, 1,
0.08275533, 1.662537, -0.005674094, 1, 1, 1, 1, 1,
0.08650709, -1.445381, 2.982517, 1, 1, 1, 1, 1,
0.08802986, 0.1859805, 0.4408784, 1, 1, 1, 1, 1,
0.0906033, -0.02232258, 2.305859, 1, 1, 1, 1, 1,
0.09575374, -0.796793, 3.105602, 1, 1, 1, 1, 1,
0.09748592, -1.626481, 3.41025, 1, 1, 1, 1, 1,
0.09855537, 1.622906, -0.07538196, 1, 1, 1, 1, 1,
0.09868551, -0.07520092, 1.931377, 1, 1, 1, 1, 1,
0.09995068, 0.9888245, -0.4008804, 0, 0, 1, 1, 1,
0.1088497, 0.4893585, 0.3747175, 1, 0, 0, 1, 1,
0.1120047, -0.3522269, 1.236981, 1, 0, 0, 1, 1,
0.1133227, -1.850338, 1.203922, 1, 0, 0, 1, 1,
0.1161281, -0.8054761, 3.687594, 1, 0, 0, 1, 1,
0.1192739, 0.7229607, 0.04494983, 1, 0, 0, 1, 1,
0.1229821, 1.675692, -0.8759932, 0, 0, 0, 1, 1,
0.1244453, 1.951275, -1.912331, 0, 0, 0, 1, 1,
0.1270801, -0.3674493, 3.141671, 0, 0, 0, 1, 1,
0.1277038, -1.071706, 3.171409, 0, 0, 0, 1, 1,
0.1317222, -0.6526012, 3.909213, 0, 0, 0, 1, 1,
0.1323172, 0.9206707, 0.11348, 0, 0, 0, 1, 1,
0.1369953, -1.132692, 4.230173, 0, 0, 0, 1, 1,
0.1376068, 1.05529, 1.490313, 1, 1, 1, 1, 1,
0.1392825, -0.5647576, 2.327646, 1, 1, 1, 1, 1,
0.1409008, -2.290906, 1.366979, 1, 1, 1, 1, 1,
0.1412602, -0.380414, 2.754724, 1, 1, 1, 1, 1,
0.1421144, -1.542331, 3.749279, 1, 1, 1, 1, 1,
0.1423731, -1.859405, 3.815531, 1, 1, 1, 1, 1,
0.1457183, 1.953702, -2.93078, 1, 1, 1, 1, 1,
0.1463887, 0.9556774, 0.9454164, 1, 1, 1, 1, 1,
0.1527157, -0.234317, 0.7908868, 1, 1, 1, 1, 1,
0.156913, 0.4764305, -0.895357, 1, 1, 1, 1, 1,
0.1634835, -0.5115057, 1.595306, 1, 1, 1, 1, 1,
0.1678412, 0.7263908, -0.7725031, 1, 1, 1, 1, 1,
0.172768, -0.007549527, 3.238339, 1, 1, 1, 1, 1,
0.1732925, 0.9353771, 1.863081, 1, 1, 1, 1, 1,
0.1774102, 0.379271, 1.97536, 1, 1, 1, 1, 1,
0.1788804, 0.2243027, 1.170916, 0, 0, 1, 1, 1,
0.187851, -0.4831594, 5.17318, 1, 0, 0, 1, 1,
0.1884265, -1.100659, 4.141899, 1, 0, 0, 1, 1,
0.1906398, 1.066496, -1.76953, 1, 0, 0, 1, 1,
0.1909907, 1.246202, -0.8626016, 1, 0, 0, 1, 1,
0.1947061, -0.9305978, 1.789957, 1, 0, 0, 1, 1,
0.1976264, -0.7513739, 2.292395, 0, 0, 0, 1, 1,
0.1990635, 0.04297264, 0.7742092, 0, 0, 0, 1, 1,
0.1998512, -0.3069496, 1.982052, 0, 0, 0, 1, 1,
0.2017879, 0.01099124, 3.774035, 0, 0, 0, 1, 1,
0.2035883, -1.030747, 2.727341, 0, 0, 0, 1, 1,
0.2057003, -0.07788127, 1.344328, 0, 0, 0, 1, 1,
0.2087473, 0.1084476, 1.955976, 0, 0, 0, 1, 1,
0.2098697, 0.278707, 1.315162, 1, 1, 1, 1, 1,
0.2141564, -0.2385322, 0.5141132, 1, 1, 1, 1, 1,
0.2170956, -0.5240489, 2.897464, 1, 1, 1, 1, 1,
0.217706, 0.2579066, -0.1122978, 1, 1, 1, 1, 1,
0.2206854, -0.07728815, 2.247582, 1, 1, 1, 1, 1,
0.2215681, -0.1772011, 3.71273, 1, 1, 1, 1, 1,
0.2227196, -0.2735915, 3.636022, 1, 1, 1, 1, 1,
0.2232128, -0.3881077, 1.50293, 1, 1, 1, 1, 1,
0.2280924, -0.03042882, 1.844014, 1, 1, 1, 1, 1,
0.2310451, 0.5853714, 0.7917262, 1, 1, 1, 1, 1,
0.2318453, -0.2024664, 2.151726, 1, 1, 1, 1, 1,
0.2324883, -2.273529, 2.698566, 1, 1, 1, 1, 1,
0.2346928, -0.2226164, 1.98176, 1, 1, 1, 1, 1,
0.2380267, -0.8868554, 3.036123, 1, 1, 1, 1, 1,
0.2390592, 0.08860037, 2.441152, 1, 1, 1, 1, 1,
0.2395581, 1.094622, 0.4768005, 0, 0, 1, 1, 1,
0.2395607, 0.3500013, -0.07978399, 1, 0, 0, 1, 1,
0.2414578, -0.3999563, 3.609469, 1, 0, 0, 1, 1,
0.2454723, -0.773438, 4.22112, 1, 0, 0, 1, 1,
0.246515, 1.069862, 0.5467898, 1, 0, 0, 1, 1,
0.2470314, -0.2496686, 2.178156, 1, 0, 0, 1, 1,
0.2471352, 0.9932867, 0.6749994, 0, 0, 0, 1, 1,
0.2526778, -0.08753811, 2.282511, 0, 0, 0, 1, 1,
0.2530755, 1.46947, 0.3716046, 0, 0, 0, 1, 1,
0.2538886, -0.9108498, 3.997845, 0, 0, 0, 1, 1,
0.2569717, 0.5826069, 0.6309936, 0, 0, 0, 1, 1,
0.2573012, -0.8771779, 4.273826, 0, 0, 0, 1, 1,
0.2602543, 1.034592, 0.587796, 0, 0, 0, 1, 1,
0.2602748, 2.968612, -1.873927, 1, 1, 1, 1, 1,
0.2654978, -0.6671548, 2.742484, 1, 1, 1, 1, 1,
0.2694398, -0.2923878, 3.241775, 1, 1, 1, 1, 1,
0.2695446, 1.535453, 1.177464, 1, 1, 1, 1, 1,
0.2702663, 1.090782, 0.1185586, 1, 1, 1, 1, 1,
0.2713866, -0.2390433, 2.170508, 1, 1, 1, 1, 1,
0.2717187, -1.099612, 3.878038, 1, 1, 1, 1, 1,
0.2720321, 0.2212391, 0.2269158, 1, 1, 1, 1, 1,
0.2752872, -0.4115834, 2.822272, 1, 1, 1, 1, 1,
0.2758334, -1.82353, 4.03399, 1, 1, 1, 1, 1,
0.2762152, 1.191308, 1.726512, 1, 1, 1, 1, 1,
0.2803829, 0.8617337, -0.5657066, 1, 1, 1, 1, 1,
0.2837658, 0.5774194, -0.04628048, 1, 1, 1, 1, 1,
0.284133, 1.068715, -0.2249147, 1, 1, 1, 1, 1,
0.2920259, -0.05890248, 1.733614, 1, 1, 1, 1, 1,
0.2938699, 0.6424914, 1.479341, 0, 0, 1, 1, 1,
0.3070599, -0.9291037, 3.381346, 1, 0, 0, 1, 1,
0.3096248, 0.0312301, 1.832091, 1, 0, 0, 1, 1,
0.3193726, 0.9624432, -0.4581499, 1, 0, 0, 1, 1,
0.3204537, 0.4250825, 0.7494604, 1, 0, 0, 1, 1,
0.3218081, 0.3125032, -0.1914317, 1, 0, 0, 1, 1,
0.3231865, 0.3284084, 0.4841852, 0, 0, 0, 1, 1,
0.3232283, 0.4475808, 1.592419, 0, 0, 0, 1, 1,
0.3278452, 1.447774, 0.9086024, 0, 0, 0, 1, 1,
0.3341681, 2.10402, 0.9394859, 0, 0, 0, 1, 1,
0.3363739, -2.266244, 4.387371, 0, 0, 0, 1, 1,
0.3391966, 1.468787, -0.815483, 0, 0, 0, 1, 1,
0.3402294, -0.6204699, 1.854916, 0, 0, 0, 1, 1,
0.3434268, -3.049921, 2.734345, 1, 1, 1, 1, 1,
0.3442422, 0.7111245, 0.7440127, 1, 1, 1, 1, 1,
0.3449974, 1.222592, -0.2096639, 1, 1, 1, 1, 1,
0.3460634, -1.187082, 4.148598, 1, 1, 1, 1, 1,
0.3462967, -0.5495612, 2.416834, 1, 1, 1, 1, 1,
0.3503146, -0.8265383, 2.278454, 1, 1, 1, 1, 1,
0.3536123, 0.04496872, 2.992058, 1, 1, 1, 1, 1,
0.3570101, -1.115729, 1.48086, 1, 1, 1, 1, 1,
0.363656, -0.6209376, 0.6856312, 1, 1, 1, 1, 1,
0.364159, -0.3114542, 3.908561, 1, 1, 1, 1, 1,
0.3643847, 0.4161983, 1.732839, 1, 1, 1, 1, 1,
0.3676957, 1.500281, 1.19396, 1, 1, 1, 1, 1,
0.3688008, -1.660017, 2.77487, 1, 1, 1, 1, 1,
0.3713962, -0.1513964, 2.875429, 1, 1, 1, 1, 1,
0.3735399, -0.1662901, 3.950834, 1, 1, 1, 1, 1,
0.3783729, 0.9743862, -2.514902, 0, 0, 1, 1, 1,
0.3797428, -0.8405978, 2.52197, 1, 0, 0, 1, 1,
0.3856342, -0.3886127, 1.364403, 1, 0, 0, 1, 1,
0.387172, -0.1726447, 2.223282, 1, 0, 0, 1, 1,
0.3881046, 1.175617, 0.5164732, 1, 0, 0, 1, 1,
0.3894557, 0.6169788, 0.6477186, 1, 0, 0, 1, 1,
0.3903897, -0.34579, 1.190543, 0, 0, 0, 1, 1,
0.3926967, -0.2360756, 1.045681, 0, 0, 0, 1, 1,
0.3947044, -1.209536, 4.032459, 0, 0, 0, 1, 1,
0.395407, 1.412693, 1.807981, 0, 0, 0, 1, 1,
0.3954169, 0.965979, -0.7225259, 0, 0, 0, 1, 1,
0.3969142, 0.2370669, 0.4974046, 0, 0, 0, 1, 1,
0.3976457, -2.11442, 4.708439, 0, 0, 0, 1, 1,
0.3976938, 0.6085292, 2.034931, 1, 1, 1, 1, 1,
0.3983219, 1.566379, 0.7565961, 1, 1, 1, 1, 1,
0.4085914, -0.7377346, 2.471884, 1, 1, 1, 1, 1,
0.4086774, -0.1116715, 0.9360678, 1, 1, 1, 1, 1,
0.4110647, 0.01587246, 0.1200365, 1, 1, 1, 1, 1,
0.4138916, 2.404208, 1.355306, 1, 1, 1, 1, 1,
0.4146167, -0.286169, 2.258432, 1, 1, 1, 1, 1,
0.4181553, -0.2230172, 3.081315, 1, 1, 1, 1, 1,
0.4210419, -0.08533459, 4.760231, 1, 1, 1, 1, 1,
0.4241711, -0.9415437, 4.917938, 1, 1, 1, 1, 1,
0.4262741, -0.7545674, 1.670892, 1, 1, 1, 1, 1,
0.4269389, 0.6783795, 0.06998809, 1, 1, 1, 1, 1,
0.4290745, -0.2561741, 2.444852, 1, 1, 1, 1, 1,
0.433382, -0.9146588, 2.287414, 1, 1, 1, 1, 1,
0.4440508, 0.6561935, 0.4017634, 1, 1, 1, 1, 1,
0.4586459, 0.5757263, 1.404755, 0, 0, 1, 1, 1,
0.4672337, 1.101034, -0.4391147, 1, 0, 0, 1, 1,
0.4720774, -1.731956, 3.298238, 1, 0, 0, 1, 1,
0.4727111, 0.3043568, 1.494901, 1, 0, 0, 1, 1,
0.4728865, -0.4502662, 2.900669, 1, 0, 0, 1, 1,
0.4807042, 0.7872708, 0.8527375, 1, 0, 0, 1, 1,
0.4812353, -1.193325, 4.462935, 0, 0, 0, 1, 1,
0.4841715, -0.5285558, 1.065546, 0, 0, 0, 1, 1,
0.484184, -0.1860162, 1.331378, 0, 0, 0, 1, 1,
0.4845025, 0.8327363, -0.2157024, 0, 0, 0, 1, 1,
0.4852519, -1.372472, 4.444601, 0, 0, 0, 1, 1,
0.4917956, -0.01266484, 1.710098, 0, 0, 0, 1, 1,
0.4988923, 0.4485598, 0.9124005, 0, 0, 0, 1, 1,
0.5042587, 0.6972212, -0.1322453, 1, 1, 1, 1, 1,
0.5065014, -0.9494299, 0.8280517, 1, 1, 1, 1, 1,
0.5118617, -1.145622, 3.31795, 1, 1, 1, 1, 1,
0.513714, -0.160596, 3.308914, 1, 1, 1, 1, 1,
0.5155025, -0.1602107, -0.3707171, 1, 1, 1, 1, 1,
0.5165175, 1.076874, -0.4606571, 1, 1, 1, 1, 1,
0.520883, -0.002033735, 1.150685, 1, 1, 1, 1, 1,
0.5222518, -0.3886041, 2.51439, 1, 1, 1, 1, 1,
0.5241458, 0.8362216, -0.7235281, 1, 1, 1, 1, 1,
0.5289314, 1.393285, 0.207537, 1, 1, 1, 1, 1,
0.5293593, -2.369615, 1.894113, 1, 1, 1, 1, 1,
0.5346829, 1.297256, 2.148863, 1, 1, 1, 1, 1,
0.535328, 0.7739556, 1.762878, 1, 1, 1, 1, 1,
0.538248, -0.155802, 2.499206, 1, 1, 1, 1, 1,
0.5393641, -0.6125024, 1.351559, 1, 1, 1, 1, 1,
0.542319, -0.09256963, 1.24755, 0, 0, 1, 1, 1,
0.5425793, -0.3568673, 3.63292, 1, 0, 0, 1, 1,
0.5432848, 1.185276, 1.186895, 1, 0, 0, 1, 1,
0.54402, 0.3975784, 2.751063, 1, 0, 0, 1, 1,
0.5457475, 0.8702035, -0.7432185, 1, 0, 0, 1, 1,
0.5485679, 0.002246234, 1.661259, 1, 0, 0, 1, 1,
0.5486367, 0.322987, 2.032685, 0, 0, 0, 1, 1,
0.5514959, -0.5421736, 2.114563, 0, 0, 0, 1, 1,
0.551662, -1.972448, 2.715304, 0, 0, 0, 1, 1,
0.5541441, -1.334331, 2.878977, 0, 0, 0, 1, 1,
0.5616349, 0.740685, 0.7378153, 0, 0, 0, 1, 1,
0.5617834, 2.597953, 0.7251416, 0, 0, 0, 1, 1,
0.562242, -0.3455213, 1.900004, 0, 0, 0, 1, 1,
0.5648026, 0.6797565, 0.5559105, 1, 1, 1, 1, 1,
0.5655062, -1.038586, 1.359594, 1, 1, 1, 1, 1,
0.566898, -0.5813091, 2.947027, 1, 1, 1, 1, 1,
0.5679384, -1.513702, 1.60123, 1, 1, 1, 1, 1,
0.5707124, -1.190017, 1.82396, 1, 1, 1, 1, 1,
0.5757315, 0.2029335, 2.035302, 1, 1, 1, 1, 1,
0.5852452, -0.9497162, 0.9450497, 1, 1, 1, 1, 1,
0.590669, 0.6564867, 0.3838798, 1, 1, 1, 1, 1,
0.5926052, 0.539556, -0.3392039, 1, 1, 1, 1, 1,
0.5976658, 0.824259, 0.2340914, 1, 1, 1, 1, 1,
0.5982794, 1.861058, 0.6191638, 1, 1, 1, 1, 1,
0.5985659, -0.23798, 1.570622, 1, 1, 1, 1, 1,
0.5991759, -1.472788, 2.499092, 1, 1, 1, 1, 1,
0.6007885, 1.122486, 1.271029, 1, 1, 1, 1, 1,
0.6034343, -0.6799994, 0.3937519, 1, 1, 1, 1, 1,
0.6050715, -0.4717795, -0.02346158, 0, 0, 1, 1, 1,
0.6119817, 0.4452729, 2.059593, 1, 0, 0, 1, 1,
0.6136854, -1.663195, 2.848857, 1, 0, 0, 1, 1,
0.6140055, -0.9007861, 2.487867, 1, 0, 0, 1, 1,
0.6154639, -0.04840542, 3.39179, 1, 0, 0, 1, 1,
0.6182436, 1.194331, 0.9249138, 1, 0, 0, 1, 1,
0.622254, -0.4034737, 1.381536, 0, 0, 0, 1, 1,
0.6274636, 1.185549, 0.5636933, 0, 0, 0, 1, 1,
0.6324448, 0.322852, 1.956179, 0, 0, 0, 1, 1,
0.6330177, -0.8946807, 2.171257, 0, 0, 0, 1, 1,
0.6384928, -0.08849655, 3.77228, 0, 0, 0, 1, 1,
0.6452051, 0.1120765, 1.566725, 0, 0, 0, 1, 1,
0.6466126, -0.3607104, 3.452395, 0, 0, 0, 1, 1,
0.6492233, 1.143989, -1.193536, 1, 1, 1, 1, 1,
0.6655183, 0.2751411, 0.4075367, 1, 1, 1, 1, 1,
0.6666381, -2.152606, 4.83395, 1, 1, 1, 1, 1,
0.6669655, 0.2669861, 1.744682, 1, 1, 1, 1, 1,
0.6730723, -1.627103, 3.970989, 1, 1, 1, 1, 1,
0.6763144, 0.3850235, 1.440488, 1, 1, 1, 1, 1,
0.6783367, -1.994262, 2.731403, 1, 1, 1, 1, 1,
0.6789436, -0.1515264, 1.509776, 1, 1, 1, 1, 1,
0.6790732, 0.6291753, -0.335984, 1, 1, 1, 1, 1,
0.6812133, 0.04828347, 1.584047, 1, 1, 1, 1, 1,
0.6812861, -0.9760424, 2.048211, 1, 1, 1, 1, 1,
0.6818116, 0.9493501, 0.440842, 1, 1, 1, 1, 1,
0.6888289, -1.316106, 3.445873, 1, 1, 1, 1, 1,
0.6915924, 0.03656066, 2.147954, 1, 1, 1, 1, 1,
0.6951935, 0.5005087, -0.6013168, 1, 1, 1, 1, 1,
0.6986713, 1.076341, 0.1581324, 0, 0, 1, 1, 1,
0.7032887, 0.05450444, 2.42401, 1, 0, 0, 1, 1,
0.7041562, 0.3482589, 1.202278, 1, 0, 0, 1, 1,
0.710337, -1.473954, 3.892904, 1, 0, 0, 1, 1,
0.7123288, 0.3619143, 1.112197, 1, 0, 0, 1, 1,
0.716251, -0.8891466, 2.5986, 1, 0, 0, 1, 1,
0.7187545, -0.3766313, 1.379922, 0, 0, 0, 1, 1,
0.7217073, 0.5273302, -0.03655123, 0, 0, 0, 1, 1,
0.7240314, -0.01658391, 1.363522, 0, 0, 0, 1, 1,
0.7259496, -1.052129, 2.823724, 0, 0, 0, 1, 1,
0.7334798, 0.3916247, 2.985732, 0, 0, 0, 1, 1,
0.7421626, -1.189117, 1.299615, 0, 0, 0, 1, 1,
0.7422302, 0.1867637, 2.665926, 0, 0, 0, 1, 1,
0.744312, -1.174424, 3.937204, 1, 1, 1, 1, 1,
0.7522165, 0.1275629, 1.585358, 1, 1, 1, 1, 1,
0.7571265, 0.3526748, 0.847783, 1, 1, 1, 1, 1,
0.7621315, 0.7863171, 0.3836088, 1, 1, 1, 1, 1,
0.7642235, 1.473973, -0.902286, 1, 1, 1, 1, 1,
0.764508, -0.07726225, 2.116005, 1, 1, 1, 1, 1,
0.7647067, -2.703592, 3.308313, 1, 1, 1, 1, 1,
0.7685426, 0.5485193, 1.529643, 1, 1, 1, 1, 1,
0.7695644, -1.143169, 2.620599, 1, 1, 1, 1, 1,
0.7795345, -1.467228, 4.369791, 1, 1, 1, 1, 1,
0.780247, -0.03685895, 0.6945877, 1, 1, 1, 1, 1,
0.7806327, -1.968804, 2.870634, 1, 1, 1, 1, 1,
0.780881, 0.756366, -1.025373, 1, 1, 1, 1, 1,
0.7819399, 0.4224705, 1.356974, 1, 1, 1, 1, 1,
0.7828426, 0.330037, 1.125781, 1, 1, 1, 1, 1,
0.7839035, 0.5398473, -0.01219457, 0, 0, 1, 1, 1,
0.7851971, 0.9705629, 0.9190303, 1, 0, 0, 1, 1,
0.7859489, -0.7153026, 1.370144, 1, 0, 0, 1, 1,
0.7969495, -0.7825869, 1.038402, 1, 0, 0, 1, 1,
0.7982022, 0.1285089, 0.7941126, 1, 0, 0, 1, 1,
0.8019317, 0.009740589, 1.854684, 1, 0, 0, 1, 1,
0.8065835, -1.180368, 3.195757, 0, 0, 0, 1, 1,
0.8121247, -1.682694, 2.284854, 0, 0, 0, 1, 1,
0.8145205, -0.376974, 2.825398, 0, 0, 0, 1, 1,
0.8156536, 2.11555, -0.6641914, 0, 0, 0, 1, 1,
0.8231734, -0.2341527, 0.5462796, 0, 0, 0, 1, 1,
0.8239172, 1.395005, 1.388417, 0, 0, 0, 1, 1,
0.8256222, -0.2000446, 1.296382, 0, 0, 0, 1, 1,
0.8311162, 1.293969, 0.4179632, 1, 1, 1, 1, 1,
0.8344578, -0.7334014, 1.698854, 1, 1, 1, 1, 1,
0.8356912, 0.1634851, 1.703293, 1, 1, 1, 1, 1,
0.8393608, 0.5273865, 2.191396, 1, 1, 1, 1, 1,
0.8405847, 0.6332314, 0.9245086, 1, 1, 1, 1, 1,
0.8439577, 0.8523039, 0.7143514, 1, 1, 1, 1, 1,
0.8461614, 0.643833, 2.139045, 1, 1, 1, 1, 1,
0.851818, 0.02396825, 1.198279, 1, 1, 1, 1, 1,
0.8542221, -0.6076264, 2.427015, 1, 1, 1, 1, 1,
0.8631911, -1.301086, 3.357171, 1, 1, 1, 1, 1,
0.8688417, -0.2942224, 2.821322, 1, 1, 1, 1, 1,
0.8755854, 1.260146, 0.210144, 1, 1, 1, 1, 1,
0.8822777, -1.696574, 1.099108, 1, 1, 1, 1, 1,
0.8853357, 0.2096009, 0.7639736, 1, 1, 1, 1, 1,
0.8928181, 0.02882472, 1.291548, 1, 1, 1, 1, 1,
0.89349, 0.8291146, 0.8266656, 0, 0, 1, 1, 1,
0.8949708, -0.5168971, 1.950736, 1, 0, 0, 1, 1,
0.8961843, 0.1032405, 1.75784, 1, 0, 0, 1, 1,
0.8994366, 0.1855633, 1.116356, 1, 0, 0, 1, 1,
0.9021271, 0.3247703, 0.2770935, 1, 0, 0, 1, 1,
0.9074159, 0.4834857, 1.619039, 1, 0, 0, 1, 1,
0.9104454, -1.064069, 4.262382, 0, 0, 0, 1, 1,
0.9184847, 0.3477789, -0.01916778, 0, 0, 0, 1, 1,
0.9214293, -1.071555, 2.328469, 0, 0, 0, 1, 1,
0.9258794, 1.101142, 0.4026279, 0, 0, 0, 1, 1,
0.9301512, 0.5102997, 1.77858, 0, 0, 0, 1, 1,
0.9338859, 1.146466, 2.866491, 0, 0, 0, 1, 1,
0.9397095, 0.4263416, 3.129097, 0, 0, 0, 1, 1,
0.9407811, -0.4156019, 2.665837, 1, 1, 1, 1, 1,
0.941571, -0.2569405, 1.025939, 1, 1, 1, 1, 1,
0.9421416, 0.2342713, 1.337571, 1, 1, 1, 1, 1,
0.9468653, -0.1335885, 2.61481, 1, 1, 1, 1, 1,
0.9515139, 0.1941729, 2.142624, 1, 1, 1, 1, 1,
0.9592012, 1.318037, 2.536443, 1, 1, 1, 1, 1,
0.9614897, -1.28195, 2.549252, 1, 1, 1, 1, 1,
0.9627559, 0.931277, 1.232922, 1, 1, 1, 1, 1,
0.9642751, -0.5002837, 0.4689712, 1, 1, 1, 1, 1,
0.9658151, 0.1614585, 2.205581, 1, 1, 1, 1, 1,
0.9669071, 0.6590744, 2.142934, 1, 1, 1, 1, 1,
0.9740732, -0.08807807, 1.770157, 1, 1, 1, 1, 1,
0.9774733, 0.8624337, 0.9414124, 1, 1, 1, 1, 1,
0.9857971, 0.3784476, 1.213615, 1, 1, 1, 1, 1,
0.991927, 0.5580335, 1.754516, 1, 1, 1, 1, 1,
0.9938574, -1.914635, 2.79842, 0, 0, 1, 1, 1,
0.994175, 0.5210706, 2.570702, 1, 0, 0, 1, 1,
0.9984866, 1.120898, 2.052018, 1, 0, 0, 1, 1,
1.004925, 0.3411607, 0.5219721, 1, 0, 0, 1, 1,
1.011344, -0.6602922, 1.535821, 1, 0, 0, 1, 1,
1.012068, -1.724488, 0.5030402, 1, 0, 0, 1, 1,
1.013632, 0.4211988, 0.658529, 0, 0, 0, 1, 1,
1.015616, 0.01296222, 1.84246, 0, 0, 0, 1, 1,
1.016016, -0.3379532, 2.230057, 0, 0, 0, 1, 1,
1.019766, 0.3288456, 0.3567626, 0, 0, 0, 1, 1,
1.02254, -1.161475, 1.383835, 0, 0, 0, 1, 1,
1.024464, 0.5787821, 2.199833, 0, 0, 0, 1, 1,
1.024828, 1.2443, 1.266623, 0, 0, 0, 1, 1,
1.024898, 1.290364, 1.452489, 1, 1, 1, 1, 1,
1.029072, 2.002033, -0.6824728, 1, 1, 1, 1, 1,
1.030668, 0.4073308, -1.115121, 1, 1, 1, 1, 1,
1.03281, -2.249847, 0.4190541, 1, 1, 1, 1, 1,
1.044577, -0.3304982, 1.865504, 1, 1, 1, 1, 1,
1.048265, 1.882242, -1.137059, 1, 1, 1, 1, 1,
1.051339, -0.528016, 1.656753, 1, 1, 1, 1, 1,
1.054775, 1.762126, 0.7676458, 1, 1, 1, 1, 1,
1.057292, 0.1982211, 0.09431214, 1, 1, 1, 1, 1,
1.064938, 0.1815315, 2.824589, 1, 1, 1, 1, 1,
1.065923, 0.105706, 1.015099, 1, 1, 1, 1, 1,
1.071302, -0.7225862, 2.444021, 1, 1, 1, 1, 1,
1.07187, -0.7686286, 1.640386, 1, 1, 1, 1, 1,
1.073582, 0.1311391, 2.170672, 1, 1, 1, 1, 1,
1.07441, -0.8342721, 3.47138, 1, 1, 1, 1, 1,
1.090192, 0.03019206, 3.944915, 0, 0, 1, 1, 1,
1.092967, 0.7856323, 1.155965, 1, 0, 0, 1, 1,
1.094187, -1.439247, 3.584689, 1, 0, 0, 1, 1,
1.097724, -0.5971122, 1.544978, 1, 0, 0, 1, 1,
1.100967, 0.3724815, 0.7798578, 1, 0, 0, 1, 1,
1.119531, -0.9362584, 1.741814, 1, 0, 0, 1, 1,
1.120637, -1.270371, 1.205017, 0, 0, 0, 1, 1,
1.140976, -0.01704997, 1.44973, 0, 0, 0, 1, 1,
1.146034, -2.59094, 3.172409, 0, 0, 0, 1, 1,
1.154126, -0.8455158, 1.07996, 0, 0, 0, 1, 1,
1.160474, -1.714128, 3.584289, 0, 0, 0, 1, 1,
1.167885, -1.304023, 0.600854, 0, 0, 0, 1, 1,
1.172638, 0.3413655, 2.408723, 0, 0, 0, 1, 1,
1.181762, 0.4264506, 0.6079191, 1, 1, 1, 1, 1,
1.182007, 1.303839, 0.7144456, 1, 1, 1, 1, 1,
1.183088, -0.1981656, 2.673409, 1, 1, 1, 1, 1,
1.184336, -0.1180623, 0.3644474, 1, 1, 1, 1, 1,
1.200604, -0.1601558, 0.4661669, 1, 1, 1, 1, 1,
1.204444, 0.5564663, -0.05729946, 1, 1, 1, 1, 1,
1.208731, 0.700641, 1.307407, 1, 1, 1, 1, 1,
1.212116, -0.5755908, 0.913565, 1, 1, 1, 1, 1,
1.229687, 0.6229261, 1.118427, 1, 1, 1, 1, 1,
1.232693, -0.9493437, 2.299708, 1, 1, 1, 1, 1,
1.233086, 0.05487989, 2.516776, 1, 1, 1, 1, 1,
1.235045, 0.9081495, 0.3321765, 1, 1, 1, 1, 1,
1.238896, 1.571993, -1.340671, 1, 1, 1, 1, 1,
1.246935, 0.5255221, 2.018661, 1, 1, 1, 1, 1,
1.258629, 0.4368141, 2.015792, 1, 1, 1, 1, 1,
1.25868, -0.5135322, 1.177124, 0, 0, 1, 1, 1,
1.276951, 0.1459261, 1.743971, 1, 0, 0, 1, 1,
1.277947, -0.08709039, -0.07052393, 1, 0, 0, 1, 1,
1.278132, 0.6472346, 0.5743316, 1, 0, 0, 1, 1,
1.280227, -0.3014312, 1.424595, 1, 0, 0, 1, 1,
1.28864, -1.68325, 2.517646, 1, 0, 0, 1, 1,
1.312047, 1.657375, 2.20032, 0, 0, 0, 1, 1,
1.32071, 0.1284925, 1.758351, 0, 0, 0, 1, 1,
1.328513, -0.06901863, 0.3690115, 0, 0, 0, 1, 1,
1.329252, 2.062473, -0.1546065, 0, 0, 0, 1, 1,
1.333629, 2.331734, 0.3788192, 0, 0, 0, 1, 1,
1.335101, 1.464898, 0.9765027, 0, 0, 0, 1, 1,
1.336665, -0.6860462, 3.19261, 0, 0, 0, 1, 1,
1.337137, 1.590407, 0.9589406, 1, 1, 1, 1, 1,
1.337307, -1.227252, 3.136251, 1, 1, 1, 1, 1,
1.348126, -0.3692727, 1.926288, 1, 1, 1, 1, 1,
1.355181, 1.068754, 0.6642917, 1, 1, 1, 1, 1,
1.35911, 1.77223, -0.1053745, 1, 1, 1, 1, 1,
1.366297, -0.2769916, 1.121678, 1, 1, 1, 1, 1,
1.369359, 0.9747627, 0.2165839, 1, 1, 1, 1, 1,
1.373156, 0.7997495, 0.6885543, 1, 1, 1, 1, 1,
1.376554, 2.072141, 1.276862, 1, 1, 1, 1, 1,
1.381028, -0.8902268, 1.672307, 1, 1, 1, 1, 1,
1.385095, 0.2636346, -0.001645341, 1, 1, 1, 1, 1,
1.41076, 0.302698, 1.104872, 1, 1, 1, 1, 1,
1.412624, 1.561898, 0.6452707, 1, 1, 1, 1, 1,
1.41831, -1.107172, 2.775699, 1, 1, 1, 1, 1,
1.42437, 0.7196564, 1.260033, 1, 1, 1, 1, 1,
1.430391, -0.5882348, 1.361988, 0, 0, 1, 1, 1,
1.4311, 1.229476, -0.1615071, 1, 0, 0, 1, 1,
1.438013, -0.4707142, 0.09533818, 1, 0, 0, 1, 1,
1.439298, -0.02771146, 2.529609, 1, 0, 0, 1, 1,
1.445296, -1.013276, 0.2150396, 1, 0, 0, 1, 1,
1.460136, 1.029478, 1.206931, 1, 0, 0, 1, 1,
1.464164, 0.2730102, 1.430334, 0, 0, 0, 1, 1,
1.465149, 0.6209909, 2.727667, 0, 0, 0, 1, 1,
1.480253, -0.4684442, 1.11866, 0, 0, 0, 1, 1,
1.490913, 1.033658, 0.8328664, 0, 0, 0, 1, 1,
1.50304, -0.7713158, 0.5000051, 0, 0, 0, 1, 1,
1.523877, 0.7868291, 1.782879, 0, 0, 0, 1, 1,
1.542201, 1.078745, 1.022076, 0, 0, 0, 1, 1,
1.544629, 0.7093831, 2.26536, 1, 1, 1, 1, 1,
1.55683, 1.612198, 0.3701942, 1, 1, 1, 1, 1,
1.579324, 0.732231, 2.102501, 1, 1, 1, 1, 1,
1.580437, -0.4906065, 1.066186, 1, 1, 1, 1, 1,
1.583523, -2.528043, 2.822932, 1, 1, 1, 1, 1,
1.596045, -0.6972307, 1.097328, 1, 1, 1, 1, 1,
1.600255, 0.1601872, 2.071146, 1, 1, 1, 1, 1,
1.615552, 0.3529894, 1.20461, 1, 1, 1, 1, 1,
1.617499, -0.6313406, 0.3065123, 1, 1, 1, 1, 1,
1.619041, 0.2685677, -0.001150822, 1, 1, 1, 1, 1,
1.62266, -1.689451, 3.447984, 1, 1, 1, 1, 1,
1.62333, -0.1926793, 2.561812, 1, 1, 1, 1, 1,
1.656844, 1.527389, 0.9250956, 1, 1, 1, 1, 1,
1.664426, -0.492403, 1.964901, 1, 1, 1, 1, 1,
1.671905, -0.7936057, 3.360311, 1, 1, 1, 1, 1,
1.695816, 0.7485036, 2.08214, 0, 0, 1, 1, 1,
1.726492, 0.3415132, 1.769343, 1, 0, 0, 1, 1,
1.739908, -2.050424, 3.228716, 1, 0, 0, 1, 1,
1.759853, 0.7712547, 1.200221, 1, 0, 0, 1, 1,
1.765997, 1.803247, -0.4545026, 1, 0, 0, 1, 1,
1.777555, 1.067916, 0.7876765, 1, 0, 0, 1, 1,
1.785016, -0.1571401, 1.268028, 0, 0, 0, 1, 1,
1.794606, 0.7997407, 0.7162054, 0, 0, 0, 1, 1,
1.804044, -0.9288111, 1.613025, 0, 0, 0, 1, 1,
1.806422, -1.19226, 2.327222, 0, 0, 0, 1, 1,
1.80901, -0.9252005, 2.077629, 0, 0, 0, 1, 1,
1.835368, 2.159029, 0.972913, 0, 0, 0, 1, 1,
1.843452, -1.419367, 4.49369, 0, 0, 0, 1, 1,
1.8538, 0.4031235, 2.074118, 1, 1, 1, 1, 1,
1.876348, 1.1732, 0.6522438, 1, 1, 1, 1, 1,
1.880149, -0.9192885, 1.598802, 1, 1, 1, 1, 1,
1.903101, -0.451595, 2.70948, 1, 1, 1, 1, 1,
1.935502, -0.1531345, 2.993944, 1, 1, 1, 1, 1,
1.959333, -0.6338967, 3.692897, 1, 1, 1, 1, 1,
2.004552, 0.219693, -1.177562, 1, 1, 1, 1, 1,
2.026097, 0.7413219, -0.3223849, 1, 1, 1, 1, 1,
2.032894, 1.176465, -0.1021514, 1, 1, 1, 1, 1,
2.03347, -1.348966, 2.129118, 1, 1, 1, 1, 1,
2.058754, 0.7922304, 0.2986223, 1, 1, 1, 1, 1,
2.079137, 1.583816, -0.3061321, 1, 1, 1, 1, 1,
2.130036, -0.8360987, 1.050348, 1, 1, 1, 1, 1,
2.135796, -1.180756, 4.570906, 1, 1, 1, 1, 1,
2.143441, 0.9919351, -0.1733141, 1, 1, 1, 1, 1,
2.152314, -0.5240871, 3.151032, 0, 0, 1, 1, 1,
2.160754, -0.935839, 1.596791, 1, 0, 0, 1, 1,
2.171552, 0.8111994, 1.881322, 1, 0, 0, 1, 1,
2.173907, 1.2329, 0.2596405, 1, 0, 0, 1, 1,
2.20137, 0.438753, 2.09284, 1, 0, 0, 1, 1,
2.209586, -0.5346693, -0.3182668, 1, 0, 0, 1, 1,
2.235388, -0.1409035, 1.915566, 0, 0, 0, 1, 1,
2.285511, -0.2654347, 0.4406257, 0, 0, 0, 1, 1,
2.315933, -1.252797, 2.143344, 0, 0, 0, 1, 1,
2.331036, -0.8762268, 1.206053, 0, 0, 0, 1, 1,
2.352564, -0.2080113, 1.90095, 0, 0, 0, 1, 1,
2.402801, -0.1312674, 0.8873492, 0, 0, 0, 1, 1,
2.444819, -1.527077, 2.320346, 0, 0, 0, 1, 1,
2.48913, 1.139489, 1.902083, 1, 1, 1, 1, 1,
2.53191, -0.1081156, 1.384188, 1, 1, 1, 1, 1,
2.547551, -0.1688105, 1.515077, 1, 1, 1, 1, 1,
2.622049, 0.8650129, 1.748648, 1, 1, 1, 1, 1,
2.700449, -0.3310257, 0.7863857, 1, 1, 1, 1, 1,
2.763381, -0.7313503, 1.859593, 1, 1, 1, 1, 1,
2.896392, 0.04949497, 2.879747, 1, 1, 1, 1, 1
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
var radius = 10.15164;
var distance = 35.6572;
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
mvMatrix.translate( 0.08380353, 0.0795269, 0.2444937 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.6572);
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
