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
-3.33519, 0.003977608, -2.069593, 1, 0, 0, 1,
-2.999253, 1.277567, -1.125139, 1, 0.007843138, 0, 1,
-2.543738, 0.4760249, -2.351998, 1, 0.01176471, 0, 1,
-2.538483, -1.258246, -1.687302, 1, 0.01960784, 0, 1,
-2.53085, -0.995924, -3.675372, 1, 0.02352941, 0, 1,
-2.492779, 0.7540568, -0.663151, 1, 0.03137255, 0, 1,
-2.443967, 1.442246, -0.9013217, 1, 0.03529412, 0, 1,
-2.388402, 0.2697316, -1.991368, 1, 0.04313726, 0, 1,
-2.333091, -0.138856, -1.745762, 1, 0.04705882, 0, 1,
-2.304328, 0.6433164, -0.5847441, 1, 0.05490196, 0, 1,
-2.296226, 0.04297061, -2.344835, 1, 0.05882353, 0, 1,
-2.266743, -0.1164471, -3.061686, 1, 0.06666667, 0, 1,
-2.243949, 0.8282596, -2.333619, 1, 0.07058824, 0, 1,
-2.2083, -0.6619696, -3.516027, 1, 0.07843138, 0, 1,
-2.162691, -0.9394076, -3.197413, 1, 0.08235294, 0, 1,
-2.120412, -0.9617829, -1.986782, 1, 0.09019608, 0, 1,
-2.117515, 0.5231439, -0.8493421, 1, 0.09411765, 0, 1,
-2.090215, -0.4962821, -1.747805, 1, 0.1019608, 0, 1,
-2.089211, 0.7728943, -1.803, 1, 0.1098039, 0, 1,
-2.082808, 0.1146162, -0.09778232, 1, 0.1137255, 0, 1,
-2.059234, -1.682007, -2.758435, 1, 0.1215686, 0, 1,
-2.020903, -0.9640682, -1.438909, 1, 0.1254902, 0, 1,
-1.994278, -0.02286896, -0.9632755, 1, 0.1333333, 0, 1,
-1.959986, -1.743917, -2.21301, 1, 0.1372549, 0, 1,
-1.948074, -0.2431139, -0.7604747, 1, 0.145098, 0, 1,
-1.933676, -0.9170676, -1.793284, 1, 0.1490196, 0, 1,
-1.915223, 0.005206283, -1.342531, 1, 0.1568628, 0, 1,
-1.892931, 0.8941663, 0.4762206, 1, 0.1607843, 0, 1,
-1.888257, 0.6501481, -0.5675919, 1, 0.1686275, 0, 1,
-1.849635, 0.2651326, -2.4408, 1, 0.172549, 0, 1,
-1.83508, 1.446674, -0.6978332, 1, 0.1803922, 0, 1,
-1.820881, -3.701786, -2.081291, 1, 0.1843137, 0, 1,
-1.791528, 0.673746, -1.630685, 1, 0.1921569, 0, 1,
-1.779956, 0.4646518, -0.214045, 1, 0.1960784, 0, 1,
-1.768781, 1.856738, -1.588968, 1, 0.2039216, 0, 1,
-1.750322, -0.1860196, -1.696413, 1, 0.2117647, 0, 1,
-1.745159, -0.5578883, -0.9061077, 1, 0.2156863, 0, 1,
-1.738103, -1.586291, -3.107383, 1, 0.2235294, 0, 1,
-1.734457, -1.143008, 0.03753875, 1, 0.227451, 0, 1,
-1.733036, 1.038832, -2.519157, 1, 0.2352941, 0, 1,
-1.725436, 2.139256, -2.250566, 1, 0.2392157, 0, 1,
-1.722521, 0.9731359, -1.234004, 1, 0.2470588, 0, 1,
-1.707251, 0.8613642, -0.3679386, 1, 0.2509804, 0, 1,
-1.693892, 0.4502272, -1.290928, 1, 0.2588235, 0, 1,
-1.688005, 0.9480016, -1.67524, 1, 0.2627451, 0, 1,
-1.686262, 1.994259, 0.03496026, 1, 0.2705882, 0, 1,
-1.659974, 0.7101033, -1.734761, 1, 0.2745098, 0, 1,
-1.659928, 0.2365028, -1.041996, 1, 0.282353, 0, 1,
-1.656642, -2.276424, -1.511747, 1, 0.2862745, 0, 1,
-1.64626, -0.4881032, -0.7387558, 1, 0.2941177, 0, 1,
-1.644348, -0.1489397, 0.03081947, 1, 0.3019608, 0, 1,
-1.627315, 1.629387, -0.6442298, 1, 0.3058824, 0, 1,
-1.623349, 0.8804135, -0.6451993, 1, 0.3137255, 0, 1,
-1.607428, 2.314186, -0.3306834, 1, 0.3176471, 0, 1,
-1.602605, -2.012751, -2.199297, 1, 0.3254902, 0, 1,
-1.594426, 2.460175, -1.166609, 1, 0.3294118, 0, 1,
-1.57677, 0.2693402, 1.478877, 1, 0.3372549, 0, 1,
-1.573009, -0.3746507, -2.215182, 1, 0.3411765, 0, 1,
-1.551757, -0.7771257, -1.747592, 1, 0.3490196, 0, 1,
-1.54869, -1.596455, -2.716573, 1, 0.3529412, 0, 1,
-1.548654, -1.124066, -2.175552, 1, 0.3607843, 0, 1,
-1.548468, -0.9917902, -1.503375, 1, 0.3647059, 0, 1,
-1.540433, -0.3119426, -2.220657, 1, 0.372549, 0, 1,
-1.537637, -1.43455, -2.761538, 1, 0.3764706, 0, 1,
-1.526097, -0.9891825, -1.742303, 1, 0.3843137, 0, 1,
-1.525256, 0.3932973, -1.489224, 1, 0.3882353, 0, 1,
-1.51392, 0.9766917, -1.831232, 1, 0.3960784, 0, 1,
-1.489086, 0.05215244, -0.8933974, 1, 0.4039216, 0, 1,
-1.47782, 0.07125845, -3.366047, 1, 0.4078431, 0, 1,
-1.476742, 0.3321877, -0.6536614, 1, 0.4156863, 0, 1,
-1.471361, -2.678406, -3.43067, 1, 0.4196078, 0, 1,
-1.465416, 0.8196607, -0.2971656, 1, 0.427451, 0, 1,
-1.458199, 0.3693872, -0.2917518, 1, 0.4313726, 0, 1,
-1.449021, 0.7103754, -1.638507, 1, 0.4392157, 0, 1,
-1.445525, -0.6838928, -1.031088, 1, 0.4431373, 0, 1,
-1.44235, -0.03717503, -2.174056, 1, 0.4509804, 0, 1,
-1.437318, 1.219361, -1.804314, 1, 0.454902, 0, 1,
-1.43683, -0.09041163, -2.184574, 1, 0.4627451, 0, 1,
-1.43225, 2.082537, -0.7364376, 1, 0.4666667, 0, 1,
-1.41603, 1.486654, -1.376143, 1, 0.4745098, 0, 1,
-1.369336, 0.1481945, -0.1717763, 1, 0.4784314, 0, 1,
-1.351759, 1.039563, 0.3618062, 1, 0.4862745, 0, 1,
-1.346209, 1.711682, 0.6768529, 1, 0.4901961, 0, 1,
-1.346094, -0.8411153, -2.647513, 1, 0.4980392, 0, 1,
-1.34043, -0.6747959, -1.433296, 1, 0.5058824, 0, 1,
-1.327192, 0.9159154, -0.3724013, 1, 0.509804, 0, 1,
-1.326717, -0.1973936, -1.183805, 1, 0.5176471, 0, 1,
-1.313616, 0.5684807, -1.86424, 1, 0.5215687, 0, 1,
-1.31013, 0.0255798, -0.3646227, 1, 0.5294118, 0, 1,
-1.308683, 0.5857143, -4.12622, 1, 0.5333334, 0, 1,
-1.307175, -0.36423, -1.485943, 1, 0.5411765, 0, 1,
-1.305522, 0.1107926, -3.33834, 1, 0.5450981, 0, 1,
-1.29994, -0.3761228, -1.434732, 1, 0.5529412, 0, 1,
-1.291801, 0.1758979, -1.616749, 1, 0.5568628, 0, 1,
-1.288119, -0.06457339, -1.045304, 1, 0.5647059, 0, 1,
-1.286564, -0.2638367, -0.7156122, 1, 0.5686275, 0, 1,
-1.285762, -0.501976, -1.734143, 1, 0.5764706, 0, 1,
-1.285558, 1.060964, -2.181138, 1, 0.5803922, 0, 1,
-1.281602, 0.7947509, 0.1615198, 1, 0.5882353, 0, 1,
-1.273462, 0.7524083, -0.620784, 1, 0.5921569, 0, 1,
-1.272866, -0.5025699, -1.095513, 1, 0.6, 0, 1,
-1.265436, 0.706744, -1.412858, 1, 0.6078432, 0, 1,
-1.259266, 0.9649071, -1.846004, 1, 0.6117647, 0, 1,
-1.254797, 1.529176, 0.2703424, 1, 0.6196079, 0, 1,
-1.249459, -0.761229, -1.917673, 1, 0.6235294, 0, 1,
-1.245057, -0.07179879, -1.43271, 1, 0.6313726, 0, 1,
-1.240485, -0.08444434, 0.1733495, 1, 0.6352941, 0, 1,
-1.233535, -1.261062, -2.251736, 1, 0.6431373, 0, 1,
-1.229966, -1.318725, -3.838322, 1, 0.6470588, 0, 1,
-1.228082, 0.6053265, 0.01807534, 1, 0.654902, 0, 1,
-1.225386, 1.494958, -1.858084, 1, 0.6588235, 0, 1,
-1.221083, -1.573504, -1.91827, 1, 0.6666667, 0, 1,
-1.219853, 0.3808236, -0.3536203, 1, 0.6705883, 0, 1,
-1.218463, -0.0708704, -0.7854117, 1, 0.6784314, 0, 1,
-1.188375, 0.1776283, -2.786213, 1, 0.682353, 0, 1,
-1.184254, 0.4714762, -2.561124, 1, 0.6901961, 0, 1,
-1.178117, -0.03641763, -1.924458, 1, 0.6941177, 0, 1,
-1.174938, 0.3667655, -2.796284, 1, 0.7019608, 0, 1,
-1.169179, -0.09956634, -2.194697, 1, 0.7098039, 0, 1,
-1.164773, -0.05316482, -1.752258, 1, 0.7137255, 0, 1,
-1.162513, 2.153822, -0.1684902, 1, 0.7215686, 0, 1,
-1.157059, 0.8901626, -2.044351, 1, 0.7254902, 0, 1,
-1.1564, -1.411929, -2.51493, 1, 0.7333333, 0, 1,
-1.143868, 0.8856091, -1.285897, 1, 0.7372549, 0, 1,
-1.141488, 0.6927694, 0.9310725, 1, 0.7450981, 0, 1,
-1.140397, -2.24394, -2.231187, 1, 0.7490196, 0, 1,
-1.13954, 0.1399557, -4.242892, 1, 0.7568628, 0, 1,
-1.137665, -0.3202349, -1.703044, 1, 0.7607843, 0, 1,
-1.130778, 0.2941723, -0.6402926, 1, 0.7686275, 0, 1,
-1.129171, -0.5784701, -2.607882, 1, 0.772549, 0, 1,
-1.125954, -0.1932947, 0.3363762, 1, 0.7803922, 0, 1,
-1.123772, -1.386252, -2.375691, 1, 0.7843137, 0, 1,
-1.123136, -1.016335, -2.443201, 1, 0.7921569, 0, 1,
-1.12158, -1.393282, -1.175792, 1, 0.7960784, 0, 1,
-1.111903, 0.1732979, -1.107963, 1, 0.8039216, 0, 1,
-1.106821, -1.644088, -3.103218, 1, 0.8117647, 0, 1,
-1.10183, 0.3883935, -0.8428366, 1, 0.8156863, 0, 1,
-1.086592, 0.2711645, 0.3135079, 1, 0.8235294, 0, 1,
-1.083088, 0.1334023, -1.001835, 1, 0.827451, 0, 1,
-1.0715, 1.26198, 0.1623537, 1, 0.8352941, 0, 1,
-1.071028, 0.450954, -1.833102, 1, 0.8392157, 0, 1,
-1.069581, 0.2301975, 0.1184756, 1, 0.8470588, 0, 1,
-1.065454, -0.3149674, -0.6562095, 1, 0.8509804, 0, 1,
-1.06518, 1.025917, -0.1685429, 1, 0.8588235, 0, 1,
-1.051025, 0.2132876, -1.483432, 1, 0.8627451, 0, 1,
-1.042896, 0.4501163, -1.774833, 1, 0.8705882, 0, 1,
-1.033455, 0.7613856, -2.595168, 1, 0.8745098, 0, 1,
-1.03263, 0.08070731, -0.2851664, 1, 0.8823529, 0, 1,
-1.031895, 0.8649694, -1.923836, 1, 0.8862745, 0, 1,
-1.030851, 1.028401, -0.6961277, 1, 0.8941177, 0, 1,
-1.023888, -0.8720484, -2.014467, 1, 0.8980392, 0, 1,
-1.022998, 1.391175, -1.05513, 1, 0.9058824, 0, 1,
-1.019655, 0.08800285, -3.062591, 1, 0.9137255, 0, 1,
-1.015049, 0.03711079, -1.729671, 1, 0.9176471, 0, 1,
-1.013457, 0.0599042, -0.7591707, 1, 0.9254902, 0, 1,
-1.006523, 0.276843, -1.696779, 1, 0.9294118, 0, 1,
-1.006343, -1.067279, -4.310136, 1, 0.9372549, 0, 1,
-1.00346, 1.018119, -0.7453607, 1, 0.9411765, 0, 1,
-1.002271, -0.008527005, -3.655832, 1, 0.9490196, 0, 1,
-1.001855, -1.133881, -4.268103, 1, 0.9529412, 0, 1,
-0.9984756, -0.3388613, -1.999412, 1, 0.9607843, 0, 1,
-0.9957777, 1.191866, -0.2642553, 1, 0.9647059, 0, 1,
-0.9934298, 0.5803819, 0.2825797, 1, 0.972549, 0, 1,
-0.9896303, -0.7496012, -3.87905, 1, 0.9764706, 0, 1,
-0.9865752, -0.04225014, -1.51379, 1, 0.9843137, 0, 1,
-0.9862467, 1.597298, -1.408179, 1, 0.9882353, 0, 1,
-0.9842604, 0.9042892, -1.023235, 1, 0.9960784, 0, 1,
-0.9763216, -1.376986, -1.853475, 0.9960784, 1, 0, 1,
-0.9726395, -0.2964909, -0.627976, 0.9921569, 1, 0, 1,
-0.9708613, -0.8537404, -2.872426, 0.9843137, 1, 0, 1,
-0.9639297, 0.3071311, -2.922, 0.9803922, 1, 0, 1,
-0.9629623, 1.006614, -0.3280509, 0.972549, 1, 0, 1,
-0.9602715, -2.060214, -1.501492, 0.9686275, 1, 0, 1,
-0.9593595, 0.6654475, -0.1679563, 0.9607843, 1, 0, 1,
-0.9399498, -0.6739374, -1.533598, 0.9568627, 1, 0, 1,
-0.9392544, -0.01936192, -2.444824, 0.9490196, 1, 0, 1,
-0.9291935, -0.7385747, -4.079502, 0.945098, 1, 0, 1,
-0.9263589, 0.9563817, -0.9168418, 0.9372549, 1, 0, 1,
-0.9225594, 0.7112716, -2.395176, 0.9333333, 1, 0, 1,
-0.9126171, -1.699728, -2.160824, 0.9254902, 1, 0, 1,
-0.9112415, 0.6621833, -0.9525746, 0.9215686, 1, 0, 1,
-0.9081303, 0.2664217, -2.682771, 0.9137255, 1, 0, 1,
-0.9052995, 0.9048558, -1.177149, 0.9098039, 1, 0, 1,
-0.9047348, 0.5309093, -1.577572, 0.9019608, 1, 0, 1,
-0.9044985, -1.230944, -4.718875, 0.8941177, 1, 0, 1,
-0.9042731, 0.1252348, -0.7656556, 0.8901961, 1, 0, 1,
-0.9002283, -1.597729, -2.1675, 0.8823529, 1, 0, 1,
-0.8965119, -0.3558194, -1.013823, 0.8784314, 1, 0, 1,
-0.8770446, 0.3926779, -0.8566268, 0.8705882, 1, 0, 1,
-0.8751789, -0.8267443, -1.265782, 0.8666667, 1, 0, 1,
-0.8719347, 0.1897265, -3.018198, 0.8588235, 1, 0, 1,
-0.870562, 0.3134005, -0.8810185, 0.854902, 1, 0, 1,
-0.8690904, 0.1031836, -1.043719, 0.8470588, 1, 0, 1,
-0.8685926, -0.2506104, -2.488685, 0.8431373, 1, 0, 1,
-0.8653715, -0.1722611, -1.457726, 0.8352941, 1, 0, 1,
-0.8628525, 0.6802458, 0.04001708, 0.8313726, 1, 0, 1,
-0.8626518, -1.531758, -3.160162, 0.8235294, 1, 0, 1,
-0.8609981, -0.2832862, -1.980263, 0.8196079, 1, 0, 1,
-0.8602205, 0.1388557, -2.526867, 0.8117647, 1, 0, 1,
-0.8585635, -0.3158056, -1.497301, 0.8078431, 1, 0, 1,
-0.854866, 1.981779, -0.7581475, 0.8, 1, 0, 1,
-0.8476013, 0.2996364, -2.015598, 0.7921569, 1, 0, 1,
-0.8440953, 1.45092, -0.9691033, 0.7882353, 1, 0, 1,
-0.8440664, -0.3457739, -1.588449, 0.7803922, 1, 0, 1,
-0.8414826, 1.892485, 2.672067, 0.7764706, 1, 0, 1,
-0.8383509, -1.20183, -2.074191, 0.7686275, 1, 0, 1,
-0.8377866, 1.832106, -0.5183265, 0.7647059, 1, 0, 1,
-0.8358587, -0.3588009, -3.220086, 0.7568628, 1, 0, 1,
-0.8324538, -0.7533779, -3.481201, 0.7529412, 1, 0, 1,
-0.8286323, 0.1174043, 0.6596932, 0.7450981, 1, 0, 1,
-0.8241843, -0.9956235, -3.047271, 0.7411765, 1, 0, 1,
-0.8200871, -1.528355, -2.697404, 0.7333333, 1, 0, 1,
-0.8095487, 0.3836468, -2.522554, 0.7294118, 1, 0, 1,
-0.8092901, -1.032734, -1.266597, 0.7215686, 1, 0, 1,
-0.8052679, -0.7861775, -3.169013, 0.7176471, 1, 0, 1,
-0.8050258, 0.04386429, -0.0533044, 0.7098039, 1, 0, 1,
-0.8048521, 0.1765365, -2.337196, 0.7058824, 1, 0, 1,
-0.7998943, -0.0371187, -3.930209, 0.6980392, 1, 0, 1,
-0.795188, 0.6022003, -0.1558166, 0.6901961, 1, 0, 1,
-0.7950324, -0.7921764, -2.962763, 0.6862745, 1, 0, 1,
-0.7922764, -0.6584585, -1.663152, 0.6784314, 1, 0, 1,
-0.7922423, 0.8795909, -1.090469, 0.6745098, 1, 0, 1,
-0.7909821, 0.7911431, -1.384188, 0.6666667, 1, 0, 1,
-0.7895569, 0.1069888, -2.193016, 0.6627451, 1, 0, 1,
-0.7844347, -1.092636, -1.545584, 0.654902, 1, 0, 1,
-0.7838632, -1.43859, -2.286567, 0.6509804, 1, 0, 1,
-0.7701733, -0.4968243, -2.536466, 0.6431373, 1, 0, 1,
-0.7683263, -0.9082869, -3.7242, 0.6392157, 1, 0, 1,
-0.7681798, -0.2988485, -4.262706, 0.6313726, 1, 0, 1,
-0.764136, -0.7838964, -1.883969, 0.627451, 1, 0, 1,
-0.7552498, -1.304819, -3.64497, 0.6196079, 1, 0, 1,
-0.7535931, 0.8436832, -0.1615706, 0.6156863, 1, 0, 1,
-0.7482148, -0.1713132, -0.7527036, 0.6078432, 1, 0, 1,
-0.746694, 0.7226982, -2.134618, 0.6039216, 1, 0, 1,
-0.746376, 1.062405, -0.9099665, 0.5960785, 1, 0, 1,
-0.7421094, 0.5814485, -0.8691885, 0.5882353, 1, 0, 1,
-0.7420369, -0.5415895, -3.694937, 0.5843138, 1, 0, 1,
-0.7404703, 0.2464022, -1.292961, 0.5764706, 1, 0, 1,
-0.7391095, 1.667106, -1.176453, 0.572549, 1, 0, 1,
-0.7365839, 1.148383, -1.92495, 0.5647059, 1, 0, 1,
-0.7346467, -0.4884357, -3.666405, 0.5607843, 1, 0, 1,
-0.7269757, -0.5855917, -1.591454, 0.5529412, 1, 0, 1,
-0.7226738, -1.641241, -2.795259, 0.5490196, 1, 0, 1,
-0.7212417, -0.09672879, -1.439289, 0.5411765, 1, 0, 1,
-0.7203768, -1.08284, -5.731139, 0.5372549, 1, 0, 1,
-0.7189119, -1.646577, -2.746737, 0.5294118, 1, 0, 1,
-0.7168205, -1.232906, -2.248954, 0.5254902, 1, 0, 1,
-0.7153751, -0.5302088, -1.252732, 0.5176471, 1, 0, 1,
-0.7124745, 0.9000736, 0.5724043, 0.5137255, 1, 0, 1,
-0.7080895, -1.6537, -2.540813, 0.5058824, 1, 0, 1,
-0.7065116, 0.6878602, -0.7682537, 0.5019608, 1, 0, 1,
-0.7034833, -0.946699, -0.9096845, 0.4941176, 1, 0, 1,
-0.7030637, -0.1978328, -1.64912, 0.4862745, 1, 0, 1,
-0.7010202, 0.7402304, -0.01445526, 0.4823529, 1, 0, 1,
-0.7008287, 1.058805, -1.276175, 0.4745098, 1, 0, 1,
-0.699223, 1.078211, 0.3425498, 0.4705882, 1, 0, 1,
-0.6979217, -0.6192791, -2.10264, 0.4627451, 1, 0, 1,
-0.6889248, 0.3778391, -0.4022598, 0.4588235, 1, 0, 1,
-0.6845003, -0.5864596, 0.1640185, 0.4509804, 1, 0, 1,
-0.6812564, -0.5038753, -2.977316, 0.4470588, 1, 0, 1,
-0.6704667, -0.6351519, -1.222114, 0.4392157, 1, 0, 1,
-0.6689717, 1.114555, 0.5613978, 0.4352941, 1, 0, 1,
-0.6674094, -0.5316409, -3.250961, 0.427451, 1, 0, 1,
-0.6638371, -0.6107883, -1.910814, 0.4235294, 1, 0, 1,
-0.66237, -1.079554, -2.452655, 0.4156863, 1, 0, 1,
-0.6560843, -0.5334495, -3.154099, 0.4117647, 1, 0, 1,
-0.6528591, -0.2822054, -1.144689, 0.4039216, 1, 0, 1,
-0.6516396, 0.141297, -1.945754, 0.3960784, 1, 0, 1,
-0.6457133, 1.312576, -2.089514, 0.3921569, 1, 0, 1,
-0.6422151, 1.70679, -0.8778734, 0.3843137, 1, 0, 1,
-0.6405591, -1.367996, -2.667374, 0.3803922, 1, 0, 1,
-0.6361579, 0.9741724, 0.1009059, 0.372549, 1, 0, 1,
-0.6360149, -0.03042227, -2.785414, 0.3686275, 1, 0, 1,
-0.6354039, 2.472868, 0.3464685, 0.3607843, 1, 0, 1,
-0.6330185, -0.1932368, -0.5786185, 0.3568628, 1, 0, 1,
-0.6303475, 0.9914179, -0.07838913, 0.3490196, 1, 0, 1,
-0.6292439, -0.3427788, -2.310355, 0.345098, 1, 0, 1,
-0.6282153, 0.5633894, -1.991443, 0.3372549, 1, 0, 1,
-0.6258674, -1.630121, -3.290684, 0.3333333, 1, 0, 1,
-0.6246334, 1.069033, -0.1934837, 0.3254902, 1, 0, 1,
-0.6230841, -1.562372, -2.837473, 0.3215686, 1, 0, 1,
-0.6193472, -0.4389368, -3.396972, 0.3137255, 1, 0, 1,
-0.6139621, 1.59577, -2.371994, 0.3098039, 1, 0, 1,
-0.6095526, 1.371737, 0.04750812, 0.3019608, 1, 0, 1,
-0.6012359, -0.9861, -3.341404, 0.2941177, 1, 0, 1,
-0.5999643, 0.1176419, -2.941726, 0.2901961, 1, 0, 1,
-0.5975363, -0.6904998, -3.014394, 0.282353, 1, 0, 1,
-0.596586, -0.5079876, -0.736272, 0.2784314, 1, 0, 1,
-0.5906126, -0.7860346, -3.537329, 0.2705882, 1, 0, 1,
-0.5905514, -0.4498278, -3.018317, 0.2666667, 1, 0, 1,
-0.5835332, 0.878743, -1.757499, 0.2588235, 1, 0, 1,
-0.5827544, -0.6250611, -2.353595, 0.254902, 1, 0, 1,
-0.5798175, 0.2307833, -2.385609, 0.2470588, 1, 0, 1,
-0.5770994, -0.897555, -1.886961, 0.2431373, 1, 0, 1,
-0.5699854, 0.3095741, 0.9154844, 0.2352941, 1, 0, 1,
-0.565506, 0.495027, 0.856489, 0.2313726, 1, 0, 1,
-0.565348, -0.4646957, -1.376901, 0.2235294, 1, 0, 1,
-0.5640671, -0.551939, -3.111417, 0.2196078, 1, 0, 1,
-0.5571778, 0.8180087, -0.1733234, 0.2117647, 1, 0, 1,
-0.5555492, 0.04133006, -2.155545, 0.2078431, 1, 0, 1,
-0.5430801, -0.7572379, -1.137321, 0.2, 1, 0, 1,
-0.540433, 0.8122525, -0.2786842, 0.1921569, 1, 0, 1,
-0.5379328, 0.2279359, -0.6584699, 0.1882353, 1, 0, 1,
-0.5353591, 1.188874, -0.8548571, 0.1803922, 1, 0, 1,
-0.528793, 0.8240247, 0.0528414, 0.1764706, 1, 0, 1,
-0.5253559, 0.6762215, -0.5220311, 0.1686275, 1, 0, 1,
-0.5232819, -1.069715, -2.520811, 0.1647059, 1, 0, 1,
-0.516741, 0.2841872, -1.183634, 0.1568628, 1, 0, 1,
-0.5147071, 0.7787686, 1.403161, 0.1529412, 1, 0, 1,
-0.513159, 0.486377, 0.07109738, 0.145098, 1, 0, 1,
-0.5108079, -2.613886, -1.728258, 0.1411765, 1, 0, 1,
-0.5100496, 0.7139789, -0.1910745, 0.1333333, 1, 0, 1,
-0.5070507, -0.1418638, -3.157615, 0.1294118, 1, 0, 1,
-0.5062246, 0.5753116, -0.6331433, 0.1215686, 1, 0, 1,
-0.5061161, 0.6477995, -0.2754525, 0.1176471, 1, 0, 1,
-0.4904263, 0.5941788, -2.490099, 0.1098039, 1, 0, 1,
-0.4897074, -0.1004908, -2.846874, 0.1058824, 1, 0, 1,
-0.4892494, -1.063395, -2.12682, 0.09803922, 1, 0, 1,
-0.4888677, 1.107662, -0.8854704, 0.09019608, 1, 0, 1,
-0.4880657, 2.156088, 0.7822558, 0.08627451, 1, 0, 1,
-0.4834622, 2.126608, 0.479273, 0.07843138, 1, 0, 1,
-0.4825102, 0.1515588, -0.4352753, 0.07450981, 1, 0, 1,
-0.4759427, 0.5541945, -0.7210377, 0.06666667, 1, 0, 1,
-0.4754728, -0.8456676, -2.318833, 0.0627451, 1, 0, 1,
-0.472315, -0.1156393, -2.574108, 0.05490196, 1, 0, 1,
-0.4687667, -0.7822058, -1.913192, 0.05098039, 1, 0, 1,
-0.4687635, -2.446487, -2.032979, 0.04313726, 1, 0, 1,
-0.4630313, 0.5196751, 2.588207, 0.03921569, 1, 0, 1,
-0.4614181, 1.438273, 0.4812984, 0.03137255, 1, 0, 1,
-0.4605394, -0.6459304, -1.964939, 0.02745098, 1, 0, 1,
-0.4604461, 2.475912, -1.645309, 0.01960784, 1, 0, 1,
-0.4594432, -1.203506, -4.415536, 0.01568628, 1, 0, 1,
-0.4562371, 0.8526337, -0.6992916, 0.007843138, 1, 0, 1,
-0.4520988, -1.604635, -3.830513, 0.003921569, 1, 0, 1,
-0.4500462, -0.5770169, -3.351153, 0, 1, 0.003921569, 1,
-0.4465731, -1.438719, -3.626785, 0, 1, 0.01176471, 1,
-0.4419886, -1.010321, -2.275315, 0, 1, 0.01568628, 1,
-0.4406129, 0.1664878, -0.8547391, 0, 1, 0.02352941, 1,
-0.4394772, 0.5451257, -1.696114, 0, 1, 0.02745098, 1,
-0.4367883, 0.3249767, 0.3192941, 0, 1, 0.03529412, 1,
-0.4358677, 2.446405, -0.8526532, 0, 1, 0.03921569, 1,
-0.4352289, 1.99529, -0.7216763, 0, 1, 0.04705882, 1,
-0.4339326, -0.8250527, -3.445002, 0, 1, 0.05098039, 1,
-0.4322797, 1.504481, -0.3847368, 0, 1, 0.05882353, 1,
-0.4298607, -0.1669597, -0.9772632, 0, 1, 0.0627451, 1,
-0.4272056, -0.4938135, -3.129167, 0, 1, 0.07058824, 1,
-0.4249304, 1.725233, 0.1134751, 0, 1, 0.07450981, 1,
-0.4239436, 0.05138433, -1.074355, 0, 1, 0.08235294, 1,
-0.4229757, -0.6088707, -1.184222, 0, 1, 0.08627451, 1,
-0.4216265, 0.5015771, -0.8189718, 0, 1, 0.09411765, 1,
-0.42158, -0.03242528, -2.157626, 0, 1, 0.1019608, 1,
-0.4192534, 1.902502, 0.6922784, 0, 1, 0.1058824, 1,
-0.4123178, 0.8171022, -0.3263817, 0, 1, 0.1137255, 1,
-0.4058205, -0.06622742, -1.962818, 0, 1, 0.1176471, 1,
-0.3996162, 0.4375137, -1.470922, 0, 1, 0.1254902, 1,
-0.3995068, -1.671858, -3.282313, 0, 1, 0.1294118, 1,
-0.3994873, -1.207968, -3.328516, 0, 1, 0.1372549, 1,
-0.3988312, 0.3499309, -0.7962912, 0, 1, 0.1411765, 1,
-0.3843105, -1.382552, -2.752748, 0, 1, 0.1490196, 1,
-0.3796456, -0.6093049, -2.176368, 0, 1, 0.1529412, 1,
-0.3786808, 1.468609, -0.5119803, 0, 1, 0.1607843, 1,
-0.3753142, -1.850694, -3.093779, 0, 1, 0.1647059, 1,
-0.3731896, 0.242723, -1.31314, 0, 1, 0.172549, 1,
-0.3670378, 1.628534, 0.7938198, 0, 1, 0.1764706, 1,
-0.3662185, -0.09550216, -1.832586, 0, 1, 0.1843137, 1,
-0.362816, -0.9231662, -3.333598, 0, 1, 0.1882353, 1,
-0.3537745, 0.3434547, -0.838959, 0, 1, 0.1960784, 1,
-0.3532093, -0.09131817, -1.34188, 0, 1, 0.2039216, 1,
-0.3529441, -1.377009, -3.193273, 0, 1, 0.2078431, 1,
-0.3519045, -0.3377075, -3.2353, 0, 1, 0.2156863, 1,
-0.3498576, 1.326402, -0.229973, 0, 1, 0.2196078, 1,
-0.349368, -0.6755175, -2.760258, 0, 1, 0.227451, 1,
-0.3465592, 1.141242, -1.477693, 0, 1, 0.2313726, 1,
-0.3437964, 1.884259, -1.28088, 0, 1, 0.2392157, 1,
-0.3434794, 1.075131, 0.01588323, 0, 1, 0.2431373, 1,
-0.3423986, -0.6086421, -3.10585, 0, 1, 0.2509804, 1,
-0.3420217, -0.3873751, -2.075744, 0, 1, 0.254902, 1,
-0.3390572, -0.2157766, -1.658114, 0, 1, 0.2627451, 1,
-0.336762, 1.06483, -0.7467347, 0, 1, 0.2666667, 1,
-0.3329696, -0.9595886, -2.395471, 0, 1, 0.2745098, 1,
-0.3318867, 0.9684072, -1.203078, 0, 1, 0.2784314, 1,
-0.3289251, -0.7647067, -2.184318, 0, 1, 0.2862745, 1,
-0.3268825, 0.32365, 1.269442, 0, 1, 0.2901961, 1,
-0.3260837, 0.5795466, -0.561418, 0, 1, 0.2980392, 1,
-0.3252791, -1.124576, -1.771317, 0, 1, 0.3058824, 1,
-0.3211856, 0.4353535, 0.3561072, 0, 1, 0.3098039, 1,
-0.314493, -1.384318, -2.507633, 0, 1, 0.3176471, 1,
-0.3133123, 0.1168857, -0.4116086, 0, 1, 0.3215686, 1,
-0.3073283, -0.603041, -3.450595, 0, 1, 0.3294118, 1,
-0.3065046, 0.9101557, 0.2504292, 0, 1, 0.3333333, 1,
-0.3039677, 0.1627872, -0.9636348, 0, 1, 0.3411765, 1,
-0.3037787, -1.451357, -0.6296523, 0, 1, 0.345098, 1,
-0.2921579, 0.324887, -2.289658, 0, 1, 0.3529412, 1,
-0.2906187, -1.088005, -3.206489, 0, 1, 0.3568628, 1,
-0.2868701, -1.346987, -3.501727, 0, 1, 0.3647059, 1,
-0.2824177, 1.835278, 0.3203284, 0, 1, 0.3686275, 1,
-0.2799061, -0.2193961, -1.619927, 0, 1, 0.3764706, 1,
-0.2788218, -0.1521042, -2.661901, 0, 1, 0.3803922, 1,
-0.2759553, -1.372441, -3.215429, 0, 1, 0.3882353, 1,
-0.2752414, -1.5903, -3.339519, 0, 1, 0.3921569, 1,
-0.2729522, 0.4041733, -1.246127, 0, 1, 0.4, 1,
-0.267779, 0.2570004, -3.316999, 0, 1, 0.4078431, 1,
-0.2669264, -0.692986, -0.8604712, 0, 1, 0.4117647, 1,
-0.264212, 1.256825, -0.03403467, 0, 1, 0.4196078, 1,
-0.2637406, 1.890903, 2.477339, 0, 1, 0.4235294, 1,
-0.2585139, -0.5533714, -2.814738, 0, 1, 0.4313726, 1,
-0.2544939, -0.1755803, -4.57443, 0, 1, 0.4352941, 1,
-0.2536694, -0.5447626, -4.308511, 0, 1, 0.4431373, 1,
-0.2535867, 0.8451604, -3.036799, 0, 1, 0.4470588, 1,
-0.2527361, -0.4269068, -3.723062, 0, 1, 0.454902, 1,
-0.2501514, 0.7007264, -1.144398, 0, 1, 0.4588235, 1,
-0.2453538, -0.529359, -4.029792, 0, 1, 0.4666667, 1,
-0.2451465, 0.9994308, -1.093839, 0, 1, 0.4705882, 1,
-0.2385222, 1.084396, 0.2526887, 0, 1, 0.4784314, 1,
-0.2354188, -1.438913, -3.396604, 0, 1, 0.4823529, 1,
-0.2344043, -0.2636414, -3.306514, 0, 1, 0.4901961, 1,
-0.2335158, 0.6402288, -1.168562, 0, 1, 0.4941176, 1,
-0.2319227, -0.4637403, -2.136448, 0, 1, 0.5019608, 1,
-0.2285951, 0.8135049, -0.02498239, 0, 1, 0.509804, 1,
-0.2218863, -2.67375, -2.707083, 0, 1, 0.5137255, 1,
-0.2175226, 0.9868608, -0.3959261, 0, 1, 0.5215687, 1,
-0.2172809, -0.09304719, -2.436449, 0, 1, 0.5254902, 1,
-0.2142528, -0.5775556, -3.622904, 0, 1, 0.5333334, 1,
-0.2031472, 0.8338563, 0.4923603, 0, 1, 0.5372549, 1,
-0.201177, 0.20742, 0.1874144, 0, 1, 0.5450981, 1,
-0.198229, -0.2390191, -2.274811, 0, 1, 0.5490196, 1,
-0.1951541, -0.904998, -2.292871, 0, 1, 0.5568628, 1,
-0.1902002, -1.04313, -4.25266, 0, 1, 0.5607843, 1,
-0.1896897, 0.488598, -1.697397, 0, 1, 0.5686275, 1,
-0.1884818, -0.6068079, -2.430708, 0, 1, 0.572549, 1,
-0.1873856, -1.00247, -2.785357, 0, 1, 0.5803922, 1,
-0.1753498, 0.3182285, -0.8683121, 0, 1, 0.5843138, 1,
-0.1749655, -1.504639, -2.768931, 0, 1, 0.5921569, 1,
-0.1741696, 1.78371, -1.305337, 0, 1, 0.5960785, 1,
-0.1705338, 1.765667, 0.7280536, 0, 1, 0.6039216, 1,
-0.1655165, 0.4524222, -1.629625, 0, 1, 0.6117647, 1,
-0.1643757, -1.715189, -2.475632, 0, 1, 0.6156863, 1,
-0.1627018, -0.7547812, -3.240897, 0, 1, 0.6235294, 1,
-0.160497, -0.09143887, -2.24757, 0, 1, 0.627451, 1,
-0.1598836, -1.017205, -2.30365, 0, 1, 0.6352941, 1,
-0.1571177, 0.4963239, 0.1818248, 0, 1, 0.6392157, 1,
-0.1530804, 0.5899519, 1.129937, 0, 1, 0.6470588, 1,
-0.152702, -1.954305, -4.500062, 0, 1, 0.6509804, 1,
-0.150113, 1.41654, 0.3788282, 0, 1, 0.6588235, 1,
-0.1498925, -0.1809595, -4.512713, 0, 1, 0.6627451, 1,
-0.1492249, -1.663761, -3.553564, 0, 1, 0.6705883, 1,
-0.1483553, 0.8013466, -0.2457137, 0, 1, 0.6745098, 1,
-0.1474489, -1.084251, -3.302273, 0, 1, 0.682353, 1,
-0.1453297, 0.8984837, -0.7201066, 0, 1, 0.6862745, 1,
-0.1446445, 1.374931, 0.6537664, 0, 1, 0.6941177, 1,
-0.1428183, -1.225772, -3.146722, 0, 1, 0.7019608, 1,
-0.1427641, 1.139108, -1.917492, 0, 1, 0.7058824, 1,
-0.1384822, 0.7048663, -1.903291, 0, 1, 0.7137255, 1,
-0.1382042, -0.2261327, -2.98326, 0, 1, 0.7176471, 1,
-0.136139, -1.350811, -2.388999, 0, 1, 0.7254902, 1,
-0.1332514, -0.9494212, -4.096614, 0, 1, 0.7294118, 1,
-0.1313709, 0.1157739, -2.6566, 0, 1, 0.7372549, 1,
-0.1305112, -1.540567, -1.945555, 0, 1, 0.7411765, 1,
-0.1249648, 1.663025, -0.4084173, 0, 1, 0.7490196, 1,
-0.1227971, -1.008011, -3.609221, 0, 1, 0.7529412, 1,
-0.1193219, -0.3415217, -1.196633, 0, 1, 0.7607843, 1,
-0.1192726, 0.09399575, -0.8276379, 0, 1, 0.7647059, 1,
-0.1183544, -1.064183, -3.992126, 0, 1, 0.772549, 1,
-0.1169097, -1.16523, -2.98621, 0, 1, 0.7764706, 1,
-0.1118441, 0.2051868, -3.191457, 0, 1, 0.7843137, 1,
-0.109822, 1.174719, -2.005466, 0, 1, 0.7882353, 1,
-0.1073157, -0.4911869, -2.505101, 0, 1, 0.7960784, 1,
-0.103199, 1.176842, -0.6821947, 0, 1, 0.8039216, 1,
-0.09239002, 0.01455331, -1.675398, 0, 1, 0.8078431, 1,
-0.09172743, -0.7228788, -3.045776, 0, 1, 0.8156863, 1,
-0.0862554, -0.1437101, -2.664181, 0, 1, 0.8196079, 1,
-0.08479884, -0.07781514, -2.298459, 0, 1, 0.827451, 1,
-0.08278634, -0.7075712, -2.404383, 0, 1, 0.8313726, 1,
-0.08215293, -1.710071, -2.662618, 0, 1, 0.8392157, 1,
-0.08212616, -0.3926679, -3.349182, 0, 1, 0.8431373, 1,
-0.08206095, 0.6706133, -0.2457813, 0, 1, 0.8509804, 1,
-0.08076709, -1.788518, -3.603364, 0, 1, 0.854902, 1,
-0.07793679, -0.8581704, -3.648632, 0, 1, 0.8627451, 1,
-0.07789928, 0.5118651, 0.6343741, 0, 1, 0.8666667, 1,
-0.07752816, -0.05218448, -2.362312, 0, 1, 0.8745098, 1,
-0.07606229, -0.3964572, -2.031592, 0, 1, 0.8784314, 1,
-0.07393713, -0.06185602, -2.436731, 0, 1, 0.8862745, 1,
-0.07388216, -3.150724, -2.632478, 0, 1, 0.8901961, 1,
-0.07208145, 1.826063, 0.9280941, 0, 1, 0.8980392, 1,
-0.07188263, 0.08302315, -1.777785, 0, 1, 0.9058824, 1,
-0.0678578, 0.7882704, -0.06187281, 0, 1, 0.9098039, 1,
-0.06459599, 0.5143984, 0.3771773, 0, 1, 0.9176471, 1,
-0.0518285, -2.33869, -0.8123077, 0, 1, 0.9215686, 1,
-0.05064424, 0.667702, -0.5171862, 0, 1, 0.9294118, 1,
-0.04725134, 1.045599, -0.604296, 0, 1, 0.9333333, 1,
-0.04647958, 0.02402867, -2.322475, 0, 1, 0.9411765, 1,
-0.04513123, -0.8962843, -2.381454, 0, 1, 0.945098, 1,
-0.04133197, -0.6690333, -4.222618, 0, 1, 0.9529412, 1,
-0.03795568, -0.3706025, -3.318246, 0, 1, 0.9568627, 1,
-0.03694952, -0.1167381, -1.273532, 0, 1, 0.9647059, 1,
-0.03337187, -0.2357461, -3.501693, 0, 1, 0.9686275, 1,
-0.02832313, -0.3100322, -4.980568, 0, 1, 0.9764706, 1,
-0.02668591, 0.5565034, 0.6586211, 0, 1, 0.9803922, 1,
-0.0266427, 0.3231816, 0.9564205, 0, 1, 0.9882353, 1,
-0.0231511, -2.318052, -3.636887, 0, 1, 0.9921569, 1,
-0.01929277, -1.016854, -4.207299, 0, 1, 1, 1,
-0.01655209, -1.561023, -2.219673, 0, 0.9921569, 1, 1,
-0.01360894, 0.3927991, -0.5367153, 0, 0.9882353, 1, 1,
-0.01034994, 0.4376171, 0.8360922, 0, 0.9803922, 1, 1,
-0.009994964, -1.712028, -2.240508, 0, 0.9764706, 1, 1,
-0.009828222, -0.1878994, -3.177777, 0, 0.9686275, 1, 1,
-0.007517915, -0.4492067, -4.383615, 0, 0.9647059, 1, 1,
-0.007147675, 0.7476978, 0.1339392, 0, 0.9568627, 1, 1,
-0.004574534, -0.02870663, -2.773529, 0, 0.9529412, 1, 1,
-0.001471509, -1.551991, -1.519989, 0, 0.945098, 1, 1,
0.001533291, -0.1253957, 2.493174, 0, 0.9411765, 1, 1,
0.003947069, 2.966244, 0.356076, 0, 0.9333333, 1, 1,
0.003957859, 1.259004, -0.1439928, 0, 0.9294118, 1, 1,
0.007774502, -0.1554935, 3.55507, 0, 0.9215686, 1, 1,
0.007984173, 0.4035092, 1.027784, 0, 0.9176471, 1, 1,
0.008231501, 1.304845, -0.5068167, 0, 0.9098039, 1, 1,
0.008367396, -1.494181, 2.937132, 0, 0.9058824, 1, 1,
0.00841924, 1.897906, -1.06379, 0, 0.8980392, 1, 1,
0.008857629, 2.165308, 0.9099476, 0, 0.8901961, 1, 1,
0.01082171, 1.239239, -0.6570576, 0, 0.8862745, 1, 1,
0.01086275, -1.25605, 2.488931, 0, 0.8784314, 1, 1,
0.01251172, 0.3675275, -1.476977, 0, 0.8745098, 1, 1,
0.0218847, 0.9680775, -0.502515, 0, 0.8666667, 1, 1,
0.02343132, 1.005818, 1.201005, 0, 0.8627451, 1, 1,
0.02578279, 0.480043, 0.09961761, 0, 0.854902, 1, 1,
0.0272543, -0.9493956, 3.023679, 0, 0.8509804, 1, 1,
0.0275419, -1.867745, 4.458361, 0, 0.8431373, 1, 1,
0.03210092, -0.2987728, 3.32226, 0, 0.8392157, 1, 1,
0.03288463, 0.3267594, 0.04140497, 0, 0.8313726, 1, 1,
0.03548863, 0.626364, -1.899361, 0, 0.827451, 1, 1,
0.04493387, 0.4312124, -0.2001071, 0, 0.8196079, 1, 1,
0.04645693, -0.6585546, 3.616363, 0, 0.8156863, 1, 1,
0.04780427, -1.57327, 3.522397, 0, 0.8078431, 1, 1,
0.04890023, -2.232292, 3.90413, 0, 0.8039216, 1, 1,
0.05296906, -0.4470124, 2.34346, 0, 0.7960784, 1, 1,
0.05501363, 0.4125127, 0.5317286, 0, 0.7882353, 1, 1,
0.05686098, -0.0007568836, 0.4730162, 0, 0.7843137, 1, 1,
0.05763111, -1.43403, 3.438859, 0, 0.7764706, 1, 1,
0.06010263, 2.48278, -0.008604239, 0, 0.772549, 1, 1,
0.06397597, -0.779273, 3.618468, 0, 0.7647059, 1, 1,
0.06688708, -1.529301, 3.364582, 0, 0.7607843, 1, 1,
0.06725641, -1.22537, 3.128881, 0, 0.7529412, 1, 1,
0.06896321, 1.144276, -0.1644437, 0, 0.7490196, 1, 1,
0.07369158, -1.232479, 3.46902, 0, 0.7411765, 1, 1,
0.07553871, 1.522305, 0.89787, 0, 0.7372549, 1, 1,
0.07608154, -0.9861743, 2.62033, 0, 0.7294118, 1, 1,
0.0772512, -0.8649766, 3.456974, 0, 0.7254902, 1, 1,
0.077259, 0.637282, 1.709319, 0, 0.7176471, 1, 1,
0.07867062, -1.537971, 2.307738, 0, 0.7137255, 1, 1,
0.08444206, 1.150988, -0.3936478, 0, 0.7058824, 1, 1,
0.08671016, -0.5882262, 2.095999, 0, 0.6980392, 1, 1,
0.08919377, 0.266307, -1.076651, 0, 0.6941177, 1, 1,
0.08941182, -0.03000826, 0.4111094, 0, 0.6862745, 1, 1,
0.0942388, -0.01974516, 2.098133, 0, 0.682353, 1, 1,
0.0980541, -1.428079, 2.38768, 0, 0.6745098, 1, 1,
0.1005361, 0.06487828, 1.211913, 0, 0.6705883, 1, 1,
0.1052735, -0.4557863, 4.583124, 0, 0.6627451, 1, 1,
0.1055072, 2.136492, -0.4770392, 0, 0.6588235, 1, 1,
0.1055396, 0.1987393, 1.582403, 0, 0.6509804, 1, 1,
0.1102078, 0.4828454, -0.4822038, 0, 0.6470588, 1, 1,
0.1105342, 2.702618, 0.7642026, 0, 0.6392157, 1, 1,
0.1155974, 0.08646367, -1.212733, 0, 0.6352941, 1, 1,
0.1164126, -0.2506365, 2.068011, 0, 0.627451, 1, 1,
0.1268459, 1.197901, -0.2508551, 0, 0.6235294, 1, 1,
0.1333203, -0.8033224, 4.025548, 0, 0.6156863, 1, 1,
0.1412732, 0.8342617, 0.2635218, 0, 0.6117647, 1, 1,
0.1418674, 0.873215, 0.0296505, 0, 0.6039216, 1, 1,
0.1494123, 0.7284997, 0.1533256, 0, 0.5960785, 1, 1,
0.151997, -0.07662173, 2.551031, 0, 0.5921569, 1, 1,
0.1556088, -0.2045596, 1.698395, 0, 0.5843138, 1, 1,
0.1575948, 1.132149, 1.676202, 0, 0.5803922, 1, 1,
0.1587506, -0.453848, 2.190698, 0, 0.572549, 1, 1,
0.1597195, -0.2065994, 1.878547, 0, 0.5686275, 1, 1,
0.165273, -1.058964, 2.6376, 0, 0.5607843, 1, 1,
0.1661588, -0.2219182, 1.523323, 0, 0.5568628, 1, 1,
0.1663808, -1.103529, 4.407528, 0, 0.5490196, 1, 1,
0.1679925, 3.612278, -1.133218, 0, 0.5450981, 1, 1,
0.1690774, -0.6970038, 1.219831, 0, 0.5372549, 1, 1,
0.1762769, -0.5314935, 2.379583, 0, 0.5333334, 1, 1,
0.1786212, -0.09354689, 3.807607, 0, 0.5254902, 1, 1,
0.179188, -0.3021423, 2.028773, 0, 0.5215687, 1, 1,
0.1811675, -0.5253057, 1.06754, 0, 0.5137255, 1, 1,
0.1825611, -1.243991, 3.74615, 0, 0.509804, 1, 1,
0.1843094, 1.010641, 1.166697, 0, 0.5019608, 1, 1,
0.1848535, -0.5422298, 3.708897, 0, 0.4941176, 1, 1,
0.1890433, -0.4769952, 4.22649, 0, 0.4901961, 1, 1,
0.1912635, 0.2136028, 2.312032, 0, 0.4823529, 1, 1,
0.1933516, -0.04062183, 1.404871, 0, 0.4784314, 1, 1,
0.1952097, 0.1018416, 0.5833717, 0, 0.4705882, 1, 1,
0.1967596, -2.399983, 3.084428, 0, 0.4666667, 1, 1,
0.1971032, 1.557333, 2.79423, 0, 0.4588235, 1, 1,
0.1988903, -0.7101211, 3.636873, 0, 0.454902, 1, 1,
0.2034635, 1.167448, -0.1514448, 0, 0.4470588, 1, 1,
0.2044523, 0.07762758, 0.2499777, 0, 0.4431373, 1, 1,
0.2073097, -0.05372354, 0.838684, 0, 0.4352941, 1, 1,
0.2084064, -0.5896829, 2.343478, 0, 0.4313726, 1, 1,
0.2087447, -1.17946, 3.318108, 0, 0.4235294, 1, 1,
0.2118955, -0.628837, 2.677356, 0, 0.4196078, 1, 1,
0.2138697, -0.3429423, 1.877606, 0, 0.4117647, 1, 1,
0.2139773, -0.9048264, 3.507896, 0, 0.4078431, 1, 1,
0.2233438, -1.269709, 1.673927, 0, 0.4, 1, 1,
0.2233537, 2.247395, 0.3696457, 0, 0.3921569, 1, 1,
0.2246559, -1.028144, 3.654079, 0, 0.3882353, 1, 1,
0.2291874, 1.966207, -0.7460001, 0, 0.3803922, 1, 1,
0.2296924, 0.06004443, 1.953188, 0, 0.3764706, 1, 1,
0.2372521, -1.07536, 2.561082, 0, 0.3686275, 1, 1,
0.24112, -0.2127845, 2.833451, 0, 0.3647059, 1, 1,
0.2412262, 0.0262442, 3.16891, 0, 0.3568628, 1, 1,
0.2451344, -0.6888501, 1.962564, 0, 0.3529412, 1, 1,
0.2454772, -0.813616, 3.297658, 0, 0.345098, 1, 1,
0.2474322, -0.3212008, 2.455298, 0, 0.3411765, 1, 1,
0.2487668, -0.078618, 2.664854, 0, 0.3333333, 1, 1,
0.2524772, -0.9199768, 5.411109, 0, 0.3294118, 1, 1,
0.2564951, -0.7107037, 1.794378, 0, 0.3215686, 1, 1,
0.2574517, 0.9757292, 0.3067325, 0, 0.3176471, 1, 1,
0.2582457, 0.5013303, 1.021626, 0, 0.3098039, 1, 1,
0.2630158, 0.1702911, 0.9335985, 0, 0.3058824, 1, 1,
0.2648878, 1.219901, -0.991914, 0, 0.2980392, 1, 1,
0.2707991, 2.010786, 0.468271, 0, 0.2901961, 1, 1,
0.2737099, -0.276857, 1.560294, 0, 0.2862745, 1, 1,
0.2748464, 0.4355265, -0.9763049, 0, 0.2784314, 1, 1,
0.2762731, 0.059713, 2.921785, 0, 0.2745098, 1, 1,
0.2765594, -0.3360431, 2.270482, 0, 0.2666667, 1, 1,
0.2773152, -0.2882331, 3.83714, 0, 0.2627451, 1, 1,
0.2782152, -0.9142524, 3.258691, 0, 0.254902, 1, 1,
0.2817414, -2.027737, 2.189851, 0, 0.2509804, 1, 1,
0.2822501, -0.3149366, 2.023341, 0, 0.2431373, 1, 1,
0.2848907, -0.3497975, 2.000358, 0, 0.2392157, 1, 1,
0.2872528, 0.6571802, -0.7623186, 0, 0.2313726, 1, 1,
0.2917474, -0.9788316, 4.619584, 0, 0.227451, 1, 1,
0.2937101, 0.1275031, 0.03645621, 0, 0.2196078, 1, 1,
0.2951902, -0.8995761, 3.304274, 0, 0.2156863, 1, 1,
0.2982062, 0.002325136, 2.883585, 0, 0.2078431, 1, 1,
0.307982, -0.1629191, 3.199731, 0, 0.2039216, 1, 1,
0.3104022, -1.431933, 3.552335, 0, 0.1960784, 1, 1,
0.3125035, -1.193789, 1.339479, 0, 0.1882353, 1, 1,
0.3128569, -1.308045, 4.493644, 0, 0.1843137, 1, 1,
0.3180443, -0.9227831, 1.094245, 0, 0.1764706, 1, 1,
0.31829, 0.05009227, 2.065126, 0, 0.172549, 1, 1,
0.3190337, -0.7408829, 2.744876, 0, 0.1647059, 1, 1,
0.321793, -0.6802655, 3.176935, 0, 0.1607843, 1, 1,
0.322168, -0.2854564, 2.787233, 0, 0.1529412, 1, 1,
0.3226469, 0.295424, 0.7783501, 0, 0.1490196, 1, 1,
0.3276171, 0.03536201, 0.4678003, 0, 0.1411765, 1, 1,
0.3303991, -0.2487517, 3.475316, 0, 0.1372549, 1, 1,
0.3313468, 0.5348466, 1.553435, 0, 0.1294118, 1, 1,
0.3320017, 1.886981, 0.7840874, 0, 0.1254902, 1, 1,
0.3354567, 2.201075, 1.394672, 0, 0.1176471, 1, 1,
0.3473687, 0.3559497, -0.03319462, 0, 0.1137255, 1, 1,
0.3491679, -0.6012906, 1.173139, 0, 0.1058824, 1, 1,
0.3492593, -1.448081, 1.389613, 0, 0.09803922, 1, 1,
0.3526483, 0.7260959, 1.585535, 0, 0.09411765, 1, 1,
0.357269, -0.2366327, 3.402298, 0, 0.08627451, 1, 1,
0.3603326, -0.2348447, 0.6268046, 0, 0.08235294, 1, 1,
0.3645478, -1.143161, 3.540205, 0, 0.07450981, 1, 1,
0.3669835, 1.586226, -1.063828, 0, 0.07058824, 1, 1,
0.3695189, -0.8899265, 1.940379, 0, 0.0627451, 1, 1,
0.3696381, 2.621018, 0.3718712, 0, 0.05882353, 1, 1,
0.3712513, 0.9306253, 0.2001059, 0, 0.05098039, 1, 1,
0.3770669, 1.032777, -0.02585345, 0, 0.04705882, 1, 1,
0.3807486, -0.1141692, 2.427334, 0, 0.03921569, 1, 1,
0.3811201, -0.1369934, 0.8625324, 0, 0.03529412, 1, 1,
0.3814305, -0.6307421, 2.634628, 0, 0.02745098, 1, 1,
0.3814873, 0.3424815, 0.3664976, 0, 0.02352941, 1, 1,
0.3824763, -0.01419485, 2.567548, 0, 0.01568628, 1, 1,
0.3961565, -0.1687655, 0.9890093, 0, 0.01176471, 1, 1,
0.3987507, -0.1193229, 0.7296271, 0, 0.003921569, 1, 1,
0.3995791, 0.8318674, 0.8173449, 0.003921569, 0, 1, 1,
0.3996617, 0.002833342, 1.977502, 0.007843138, 0, 1, 1,
0.3996906, -0.5051745, 0.8345186, 0.01568628, 0, 1, 1,
0.4006172, 0.5991712, 1.156912, 0.01960784, 0, 1, 1,
0.4021386, -0.1648433, 0.6313196, 0.02745098, 0, 1, 1,
0.4032422, 0.2140982, 0.2769519, 0.03137255, 0, 1, 1,
0.4040146, 0.7479823, -0.1448462, 0.03921569, 0, 1, 1,
0.4046349, -0.6344943, 3.058901, 0.04313726, 0, 1, 1,
0.4067029, -1.61168, 1.677456, 0.05098039, 0, 1, 1,
0.407658, 1.485106, 1.684442, 0.05490196, 0, 1, 1,
0.4086453, -1.983488, 3.043359, 0.0627451, 0, 1, 1,
0.4104947, -0.4582233, 4.087164, 0.06666667, 0, 1, 1,
0.4116839, 1.544973, 0.3915348, 0.07450981, 0, 1, 1,
0.4180157, -2.297802, 2.257947, 0.07843138, 0, 1, 1,
0.4188269, 0.3696047, 2.452219, 0.08627451, 0, 1, 1,
0.419881, 0.4247803, 1.74633, 0.09019608, 0, 1, 1,
0.4199075, 1.804515, 0.4364429, 0.09803922, 0, 1, 1,
0.4223735, -1.786062, 2.958828, 0.1058824, 0, 1, 1,
0.4232301, 1.317993, 1.378506, 0.1098039, 0, 1, 1,
0.4247332, 0.2313396, 2.985498, 0.1176471, 0, 1, 1,
0.4259745, -0.3541799, 0.4764901, 0.1215686, 0, 1, 1,
0.427267, 0.4853131, 0.5370144, 0.1294118, 0, 1, 1,
0.4312212, 1.065976, 0.3558757, 0.1333333, 0, 1, 1,
0.432347, -2.653407, 1.152932, 0.1411765, 0, 1, 1,
0.4347712, -0.9489213, 2.433509, 0.145098, 0, 1, 1,
0.4360483, 1.457213, 1.195001, 0.1529412, 0, 1, 1,
0.4383021, -0.3608322, 1.125975, 0.1568628, 0, 1, 1,
0.4450161, -0.05831048, 1.157291, 0.1647059, 0, 1, 1,
0.4496799, 1.45837, 0.3822039, 0.1686275, 0, 1, 1,
0.4504381, -2.675992, 3.681499, 0.1764706, 0, 1, 1,
0.4517541, -1.469493, 3.137614, 0.1803922, 0, 1, 1,
0.4589995, -1.779904, 1.947937, 0.1882353, 0, 1, 1,
0.4625167, -0.5159397, 1.322405, 0.1921569, 0, 1, 1,
0.462911, -0.4736591, 1.018223, 0.2, 0, 1, 1,
0.4659943, 0.009882537, 0.5327462, 0.2078431, 0, 1, 1,
0.4661117, -1.803713, 4.303561, 0.2117647, 0, 1, 1,
0.466646, 0.9365131, 0.8428211, 0.2196078, 0, 1, 1,
0.4674791, 1.458432, -0.6557225, 0.2235294, 0, 1, 1,
0.4709024, 0.634584, 1.613001, 0.2313726, 0, 1, 1,
0.4744483, -0.6388749, 4.257567, 0.2352941, 0, 1, 1,
0.4757969, 1.290107, -0.5831559, 0.2431373, 0, 1, 1,
0.4776164, 0.4565611, 1.193295, 0.2470588, 0, 1, 1,
0.4818588, -0.4221911, 2.263368, 0.254902, 0, 1, 1,
0.4832673, -0.08657929, 1.9668, 0.2588235, 0, 1, 1,
0.4833975, 1.384698, 0.7852167, 0.2666667, 0, 1, 1,
0.4848441, -1.741151, 0.445598, 0.2705882, 0, 1, 1,
0.4919278, 1.637742, 0.6290551, 0.2784314, 0, 1, 1,
0.4950444, 0.1718018, 3.271947, 0.282353, 0, 1, 1,
0.4988203, 1.121701, -1.095668, 0.2901961, 0, 1, 1,
0.4998899, -1.268625, 3.267396, 0.2941177, 0, 1, 1,
0.5009688, 0.5017051, 0.8959146, 0.3019608, 0, 1, 1,
0.5034459, -1.12008, 3.599629, 0.3098039, 0, 1, 1,
0.5065168, -0.6158293, 3.210762, 0.3137255, 0, 1, 1,
0.5066158, 0.1888524, 0.4985174, 0.3215686, 0, 1, 1,
0.5079224, 0.1475029, 1.24973, 0.3254902, 0, 1, 1,
0.5117882, -1.256167, 4.315018, 0.3333333, 0, 1, 1,
0.514501, -1.282701, 3.770503, 0.3372549, 0, 1, 1,
0.5150252, 0.3294593, 1.326175, 0.345098, 0, 1, 1,
0.5160886, -0.3045779, 0.2711431, 0.3490196, 0, 1, 1,
0.5161972, -0.09880173, 1.064069, 0.3568628, 0, 1, 1,
0.5182379, 0.4526269, 0.8089698, 0.3607843, 0, 1, 1,
0.5217155, 1.487533, 1.04143, 0.3686275, 0, 1, 1,
0.5232089, -0.1091315, 1.857211, 0.372549, 0, 1, 1,
0.5281666, -1.731103, 2.355268, 0.3803922, 0, 1, 1,
0.5297948, -0.04794291, 2.810612, 0.3843137, 0, 1, 1,
0.5323329, -0.4621389, 3.670946, 0.3921569, 0, 1, 1,
0.5350684, -0.05929527, 1.024782, 0.3960784, 0, 1, 1,
0.5394122, -0.1774818, 0.1120337, 0.4039216, 0, 1, 1,
0.5458034, -1.078362, 3.715425, 0.4117647, 0, 1, 1,
0.5478126, -0.5204431, 2.775611, 0.4156863, 0, 1, 1,
0.5483578, -0.06832682, 1.423451, 0.4235294, 0, 1, 1,
0.550279, 0.7818527, 0.2934779, 0.427451, 0, 1, 1,
0.5508778, 1.254703, 0.1629366, 0.4352941, 0, 1, 1,
0.5520173, -1.297846, 2.594636, 0.4392157, 0, 1, 1,
0.5526883, -0.2398016, 0.6507186, 0.4470588, 0, 1, 1,
0.5546425, 0.8628289, 0.4327718, 0.4509804, 0, 1, 1,
0.5607665, -1.759674, 3.001472, 0.4588235, 0, 1, 1,
0.5610584, -2.126147, 3.489651, 0.4627451, 0, 1, 1,
0.5617368, 0.5014812, 0.4182827, 0.4705882, 0, 1, 1,
0.562064, 0.6327475, 0.7624876, 0.4745098, 0, 1, 1,
0.5654034, -1.431656, 2.436592, 0.4823529, 0, 1, 1,
0.5671477, -1.604137, 1.925835, 0.4862745, 0, 1, 1,
0.5740876, -0.8029941, 3.890096, 0.4941176, 0, 1, 1,
0.5778674, -2.238209, 2.760628, 0.5019608, 0, 1, 1,
0.5791188, 0.7199612, 2.151909, 0.5058824, 0, 1, 1,
0.5809776, -0.7856268, 0.3915303, 0.5137255, 0, 1, 1,
0.5837414, -0.5834911, 3.056396, 0.5176471, 0, 1, 1,
0.5841852, -1.194805, 2.065426, 0.5254902, 0, 1, 1,
0.5852133, -1.016344, 2.1951, 0.5294118, 0, 1, 1,
0.5932039, -0.5868872, 3.666858, 0.5372549, 0, 1, 1,
0.5932291, 0.9822218, 1.242833, 0.5411765, 0, 1, 1,
0.5975885, -1.227391, 1.181841, 0.5490196, 0, 1, 1,
0.5990242, -0.4123484, 0.9206952, 0.5529412, 0, 1, 1,
0.601275, -0.6300188, 3.520606, 0.5607843, 0, 1, 1,
0.6070502, -0.5910046, 2.752547, 0.5647059, 0, 1, 1,
0.6111062, -0.4940704, 0.8279873, 0.572549, 0, 1, 1,
0.6167518, 0.5608185, 1.179879, 0.5764706, 0, 1, 1,
0.6208958, -0.8440174, 3.229024, 0.5843138, 0, 1, 1,
0.6237651, 0.2232923, 1.985579, 0.5882353, 0, 1, 1,
0.6254188, -0.2759955, 1.333738, 0.5960785, 0, 1, 1,
0.6267478, -0.3432173, 2.059273, 0.6039216, 0, 1, 1,
0.6269587, -1.462895, 2.504445, 0.6078432, 0, 1, 1,
0.6277127, 0.1781067, 1.484219, 0.6156863, 0, 1, 1,
0.6277673, -0.5193721, 2.495996, 0.6196079, 0, 1, 1,
0.6310316, -0.6828456, 3.203279, 0.627451, 0, 1, 1,
0.6379802, 1.07889, 2.817759, 0.6313726, 0, 1, 1,
0.647172, 0.8379335, 0.622927, 0.6392157, 0, 1, 1,
0.6473933, 0.5863237, -1.647766, 0.6431373, 0, 1, 1,
0.6477728, 0.2376872, 1.909757, 0.6509804, 0, 1, 1,
0.6479288, 2.190628, -0.5972092, 0.654902, 0, 1, 1,
0.6480986, 2.028364, 0.5283528, 0.6627451, 0, 1, 1,
0.6554983, -0.7465479, 1.632139, 0.6666667, 0, 1, 1,
0.6593763, 0.411444, 2.237723, 0.6745098, 0, 1, 1,
0.6612448, -0.2826313, 1.357184, 0.6784314, 0, 1, 1,
0.6619186, -0.5507854, 2.451078, 0.6862745, 0, 1, 1,
0.664011, 1.84937, -0.1900213, 0.6901961, 0, 1, 1,
0.6665983, 0.09408881, 1.498506, 0.6980392, 0, 1, 1,
0.6675355, 0.1239377, 2.35069, 0.7058824, 0, 1, 1,
0.6680136, -0.3301947, 1.541961, 0.7098039, 0, 1, 1,
0.6726204, -2.28467, 4.237876, 0.7176471, 0, 1, 1,
0.681743, 0.106846, 1.899893, 0.7215686, 0, 1, 1,
0.6885132, -2.45155, 2.346039, 0.7294118, 0, 1, 1,
0.6886336, -1.254343, 3.088205, 0.7333333, 0, 1, 1,
0.696905, 0.133092, 2.322752, 0.7411765, 0, 1, 1,
0.6974635, -0.6392311, 2.434911, 0.7450981, 0, 1, 1,
0.7049102, -0.1221298, 1.088745, 0.7529412, 0, 1, 1,
0.7071167, 0.3547887, 2.457866, 0.7568628, 0, 1, 1,
0.7083232, 1.556877, -0.6497075, 0.7647059, 0, 1, 1,
0.7107806, 0.9069813, 1.45562, 0.7686275, 0, 1, 1,
0.7148737, -0.4555475, 1.318806, 0.7764706, 0, 1, 1,
0.7159867, 1.29713, 0.2596305, 0.7803922, 0, 1, 1,
0.7185084, -0.3607404, 2.818372, 0.7882353, 0, 1, 1,
0.7198499, -0.7167462, 2.776054, 0.7921569, 0, 1, 1,
0.7219167, -0.7334549, 1.928984, 0.8, 0, 1, 1,
0.723067, 0.3587747, 0.9234383, 0.8078431, 0, 1, 1,
0.7244022, 0.8116424, 1.199458, 0.8117647, 0, 1, 1,
0.7284817, -0.3835833, 0.9032279, 0.8196079, 0, 1, 1,
0.7380224, 0.810231, -0.9993595, 0.8235294, 0, 1, 1,
0.7417809, 2.55987, -0.4914673, 0.8313726, 0, 1, 1,
0.7455333, -0.5564998, 0.5434442, 0.8352941, 0, 1, 1,
0.7509415, 0.8469175, 0.3797262, 0.8431373, 0, 1, 1,
0.7528036, -1.692524, 1.843235, 0.8470588, 0, 1, 1,
0.7562549, -1.910411, 2.945035, 0.854902, 0, 1, 1,
0.7591169, 0.3926478, 1.569514, 0.8588235, 0, 1, 1,
0.7605813, 0.4079352, 1.175903, 0.8666667, 0, 1, 1,
0.7639696, -0.3877905, 1.721227, 0.8705882, 0, 1, 1,
0.7736172, -1.644162, 1.204684, 0.8784314, 0, 1, 1,
0.7768742, -0.9096195, 2.72599, 0.8823529, 0, 1, 1,
0.7857816, -0.5300597, 1.236207, 0.8901961, 0, 1, 1,
0.7890753, 0.530976, 1.608413, 0.8941177, 0, 1, 1,
0.7951515, 0.9128441, 0.268568, 0.9019608, 0, 1, 1,
0.7995456, 0.7904187, 0.719909, 0.9098039, 0, 1, 1,
0.7996535, -1.024118, 2.261134, 0.9137255, 0, 1, 1,
0.810918, -1.675531, 0.9725837, 0.9215686, 0, 1, 1,
0.8124221, 0.1450506, -0.006613896, 0.9254902, 0, 1, 1,
0.8138824, -0.5185094, 1.817389, 0.9333333, 0, 1, 1,
0.8185915, -0.05995721, 2.049117, 0.9372549, 0, 1, 1,
0.8188655, 0.1997139, 0.1513334, 0.945098, 0, 1, 1,
0.820385, 0.807718, 0.2660104, 0.9490196, 0, 1, 1,
0.8307156, 0.004820927, 2.811243, 0.9568627, 0, 1, 1,
0.8318269, -1.575613, 3.26879, 0.9607843, 0, 1, 1,
0.8319165, 0.5225848, -0.5887059, 0.9686275, 0, 1, 1,
0.8326862, 0.722731, -1.72704, 0.972549, 0, 1, 1,
0.8397787, 0.9565254, -1.439596, 0.9803922, 0, 1, 1,
0.8520874, -0.2833316, 2.60011, 0.9843137, 0, 1, 1,
0.8559411, -0.03504413, 1.106532, 0.9921569, 0, 1, 1,
0.8575496, 0.836796, -0.3706444, 0.9960784, 0, 1, 1,
0.8616279, -0.8846634, -0.4884919, 1, 0, 0.9960784, 1,
0.863048, 0.3480622, 0.1212293, 1, 0, 0.9882353, 1,
0.863798, -0.1839609, 2.971762, 1, 0, 0.9843137, 1,
0.8689411, -1.678158, 1.424035, 1, 0, 0.9764706, 1,
0.8744615, -0.2055442, 1.14841, 1, 0, 0.972549, 1,
0.8754724, -0.2278998, 2.132667, 1, 0, 0.9647059, 1,
0.8756162, 2.044625, 0.002363934, 1, 0, 0.9607843, 1,
0.8758504, -0.3477157, 2.850171, 1, 0, 0.9529412, 1,
0.8797588, -0.4835042, 1.15132, 1, 0, 0.9490196, 1,
0.8872829, 0.09758843, 0.4900092, 1, 0, 0.9411765, 1,
0.8881703, -2.351055, 1.678105, 1, 0, 0.9372549, 1,
0.8883615, -1.320554, 2.402583, 1, 0, 0.9294118, 1,
0.8922645, 0.1891873, 3.112595, 1, 0, 0.9254902, 1,
0.8943684, 1.154944, 1.078307, 1, 0, 0.9176471, 1,
0.8969203, 1.375769, 1.769082, 1, 0, 0.9137255, 1,
0.8992174, -1.697419, 2.67452, 1, 0, 0.9058824, 1,
0.9034354, -1.517998, 1.317285, 1, 0, 0.9019608, 1,
0.9042445, 1.400113, 1.412601, 1, 0, 0.8941177, 1,
0.9112334, -1.927191, 1.899124, 1, 0, 0.8862745, 1,
0.9140758, 0.6926618, -1.355845, 1, 0, 0.8823529, 1,
0.9181958, 0.3354314, 1.689558, 1, 0, 0.8745098, 1,
0.9203725, -0.1929227, 2.584013, 1, 0, 0.8705882, 1,
0.9226648, -0.1347975, 1.705881, 1, 0, 0.8627451, 1,
0.9259645, 0.6468003, 1.282894, 1, 0, 0.8588235, 1,
0.9300303, -0.5636469, 2.811396, 1, 0, 0.8509804, 1,
0.9313778, 2.720172, 0.9076375, 1, 0, 0.8470588, 1,
0.9533039, 0.4782208, 0.8507462, 1, 0, 0.8392157, 1,
0.9559431, 1.529991, 1.304924, 1, 0, 0.8352941, 1,
0.9572469, 1.024799, -0.2693965, 1, 0, 0.827451, 1,
0.9590617, 0.2612506, -0.8795615, 1, 0, 0.8235294, 1,
0.9595881, 0.6931645, 0.7954433, 1, 0, 0.8156863, 1,
0.9701543, 0.8903002, -0.3210921, 1, 0, 0.8117647, 1,
0.9774504, -0.06082495, 2.169317, 1, 0, 0.8039216, 1,
0.979609, -0.5249962, 1.102198, 1, 0, 0.7960784, 1,
0.9858606, 2.419974, -0.08475158, 1, 0, 0.7921569, 1,
0.9920313, -0.4804038, 0.6334822, 1, 0, 0.7843137, 1,
0.9947389, -0.8997151, 2.830914, 1, 0, 0.7803922, 1,
0.9951403, 0.2804385, -0.1155175, 1, 0, 0.772549, 1,
0.9982949, 0.882796, 1.759801, 1, 0, 0.7686275, 1,
0.9985487, -1.104656, 2.007655, 1, 0, 0.7607843, 1,
0.9996771, -3.351024, 4.511385, 1, 0, 0.7568628, 1,
1.003119, 0.1576454, 2.301452, 1, 0, 0.7490196, 1,
1.005938, -0.4953147, 3.201974, 1, 0, 0.7450981, 1,
1.015398, -0.7137098, 1.102402, 1, 0, 0.7372549, 1,
1.017746, -0.09807349, 2.128139, 1, 0, 0.7333333, 1,
1.022117, 0.2054293, 2.799585, 1, 0, 0.7254902, 1,
1.030742, 0.2754944, 0.3303494, 1, 0, 0.7215686, 1,
1.036474, 1.576429, -0.5771215, 1, 0, 0.7137255, 1,
1.049117, -0.197071, 1.736561, 1, 0, 0.7098039, 1,
1.049909, 0.01546465, -0.01254218, 1, 0, 0.7019608, 1,
1.055937, 0.3365575, 2.106986, 1, 0, 0.6941177, 1,
1.057007, -0.5188619, 2.172774, 1, 0, 0.6901961, 1,
1.057718, -0.5672945, 0.9721617, 1, 0, 0.682353, 1,
1.061146, 1.780758, 1.91882, 1, 0, 0.6784314, 1,
1.063348, -0.7617997, 3.531521, 1, 0, 0.6705883, 1,
1.066672, -2.152701, 2.63574, 1, 0, 0.6666667, 1,
1.079074, 0.2039101, 1.630203, 1, 0, 0.6588235, 1,
1.092812, 0.1534435, 1.355935, 1, 0, 0.654902, 1,
1.107986, -0.1228548, 0.2864755, 1, 0, 0.6470588, 1,
1.113571, 1.493459, -0.2216087, 1, 0, 0.6431373, 1,
1.11377, 1.797626, 2.530788, 1, 0, 0.6352941, 1,
1.123432, 1.715337, -0.857356, 1, 0, 0.6313726, 1,
1.124966, 0.1738438, 1.292225, 1, 0, 0.6235294, 1,
1.127499, 1.385485, 1.472737, 1, 0, 0.6196079, 1,
1.162376, -0.3461895, 1.526648, 1, 0, 0.6117647, 1,
1.166871, -0.5401666, 2.920297, 1, 0, 0.6078432, 1,
1.177614, 0.502778, 0.331141, 1, 0, 0.6, 1,
1.181263, -1.451854, 3.258867, 1, 0, 0.5921569, 1,
1.189934, -1.961262, 1.569598, 1, 0, 0.5882353, 1,
1.19126, -0.4953031, 2.04276, 1, 0, 0.5803922, 1,
1.192133, 0.3961705, 2.556437, 1, 0, 0.5764706, 1,
1.192915, 1.659622, -1.025309, 1, 0, 0.5686275, 1,
1.196691, -0.7428038, 0.8539563, 1, 0, 0.5647059, 1,
1.217361, 1.323934, -0.4070871, 1, 0, 0.5568628, 1,
1.217743, 1.372001, -0.2207344, 1, 0, 0.5529412, 1,
1.223329, 0.7177369, 1.959304, 1, 0, 0.5450981, 1,
1.246073, -0.1848116, 1.821905, 1, 0, 0.5411765, 1,
1.251826, -1.489227, 3.349274, 1, 0, 0.5333334, 1,
1.26437, 1.925137, 0.9725372, 1, 0, 0.5294118, 1,
1.267159, 1.555406, -0.05093009, 1, 0, 0.5215687, 1,
1.267842, -0.05027186, 1.248588, 1, 0, 0.5176471, 1,
1.278602, -1.650431, 3.360248, 1, 0, 0.509804, 1,
1.281737, 0.1453194, 1.240537, 1, 0, 0.5058824, 1,
1.282906, -1.607374, 2.931669, 1, 0, 0.4980392, 1,
1.287371, 0.2343827, 2.578717, 1, 0, 0.4901961, 1,
1.289525, -1.186607, 2.55101, 1, 0, 0.4862745, 1,
1.294912, 0.7904333, 0.8970014, 1, 0, 0.4784314, 1,
1.307723, -0.3403008, 1.183913, 1, 0, 0.4745098, 1,
1.319859, -1.407035, 3.228594, 1, 0, 0.4666667, 1,
1.333112, 1.00625, 0.9932079, 1, 0, 0.4627451, 1,
1.348986, -0.3642271, 1.43655, 1, 0, 0.454902, 1,
1.350184, 0.6374225, 0.4522811, 1, 0, 0.4509804, 1,
1.355015, 2.048477, 2.139038, 1, 0, 0.4431373, 1,
1.357645, -1.121987, 2.86833, 1, 0, 0.4392157, 1,
1.376399, -0.7440424, 1.95341, 1, 0, 0.4313726, 1,
1.3885, -0.4684076, 1.892581, 1, 0, 0.427451, 1,
1.39464, 1.179191, 0.8393358, 1, 0, 0.4196078, 1,
1.401981, 1.521861, 1.322175, 1, 0, 0.4156863, 1,
1.450214, -0.559849, 4.483144, 1, 0, 0.4078431, 1,
1.471844, 1.131519, -0.2196871, 1, 0, 0.4039216, 1,
1.473826, -0.3697714, 2.141716, 1, 0, 0.3960784, 1,
1.478591, -0.5763547, 2.823596, 1, 0, 0.3882353, 1,
1.490376, -0.3623331, 2.181972, 1, 0, 0.3843137, 1,
1.517834, -0.137738, 3.738305, 1, 0, 0.3764706, 1,
1.51833, -0.4756653, 2.378037, 1, 0, 0.372549, 1,
1.519376, 0.4980154, -0.3850726, 1, 0, 0.3647059, 1,
1.52433, 0.6486564, 1.400148, 1, 0, 0.3607843, 1,
1.536771, -2.043734, 3.116059, 1, 0, 0.3529412, 1,
1.542855, 0.4240025, 1.734008, 1, 0, 0.3490196, 1,
1.544354, -1.297929, 3.273475, 1, 0, 0.3411765, 1,
1.548353, 0.3432883, 2.606322, 1, 0, 0.3372549, 1,
1.558869, 0.5179904, 0.3232979, 1, 0, 0.3294118, 1,
1.584379, 1.06846, 0.7938681, 1, 0, 0.3254902, 1,
1.594205, -0.09453167, 2.910559, 1, 0, 0.3176471, 1,
1.597862, 0.2483916, 1.239228, 1, 0, 0.3137255, 1,
1.617183, -0.2475927, 3.123325, 1, 0, 0.3058824, 1,
1.61866, 1.179854, 2.449907, 1, 0, 0.2980392, 1,
1.62346, -1.750138, 2.138643, 1, 0, 0.2941177, 1,
1.632068, 0.5203192, 1.338251, 1, 0, 0.2862745, 1,
1.647717, -1.503488, 2.107417, 1, 0, 0.282353, 1,
1.653023, -1.085217, 0.7560725, 1, 0, 0.2745098, 1,
1.654527, -1.687264, 1.735133, 1, 0, 0.2705882, 1,
1.679715, -0.03723898, -0.3472406, 1, 0, 0.2627451, 1,
1.691598, -0.04117312, -1.173396, 1, 0, 0.2588235, 1,
1.693201, 0.8388972, 1.631181, 1, 0, 0.2509804, 1,
1.699097, 2.468925, 1.498058, 1, 0, 0.2470588, 1,
1.724025, -0.982346, 0.7480402, 1, 0, 0.2392157, 1,
1.737975, 1.418309, 0.8752338, 1, 0, 0.2352941, 1,
1.7385, 1.059322, 1.171402, 1, 0, 0.227451, 1,
1.738507, 0.7857619, 1.958327, 1, 0, 0.2235294, 1,
1.742235, 0.3488695, 0.5997733, 1, 0, 0.2156863, 1,
1.74572, 0.492207, 0.9266685, 1, 0, 0.2117647, 1,
1.746171, -1.175785, 2.960039, 1, 0, 0.2039216, 1,
1.764726, -0.8270332, 2.611277, 1, 0, 0.1960784, 1,
1.791823, 0.9850243, 0.8924033, 1, 0, 0.1921569, 1,
1.80191, -1.775933, 2.895056, 1, 0, 0.1843137, 1,
1.84316, -1.203626, 2.991107, 1, 0, 0.1803922, 1,
1.860871, -0.5144235, 2.397156, 1, 0, 0.172549, 1,
1.873587, -1.727989, 2.83845, 1, 0, 0.1686275, 1,
1.894325, -0.5012286, 2.602208, 1, 0, 0.1607843, 1,
1.91526, 0.1534473, 1.654332, 1, 0, 0.1568628, 1,
1.917135, 0.727595, -0.142123, 1, 0, 0.1490196, 1,
1.941973, 3.030398, 1.300096, 1, 0, 0.145098, 1,
1.944601, 1.805452, 0.433644, 1, 0, 0.1372549, 1,
1.980654, -0.789301, 2.0567, 1, 0, 0.1333333, 1,
1.982479, 0.9781258, 1.563712, 1, 0, 0.1254902, 1,
1.984431, 0.4060408, 0.6434841, 1, 0, 0.1215686, 1,
2.022355, 0.06914357, 1.260709, 1, 0, 0.1137255, 1,
2.045916, -0.6264415, 1.338663, 1, 0, 0.1098039, 1,
2.075114, 1.233156, -0.2162714, 1, 0, 0.1019608, 1,
2.090981, -1.270035, 2.498741, 1, 0, 0.09411765, 1,
2.132772, -0.3333512, 1.906023, 1, 0, 0.09019608, 1,
2.148924, -1.561652, 2.564, 1, 0, 0.08235294, 1,
2.190125, -0.8446798, 2.193735, 1, 0, 0.07843138, 1,
2.195207, -1.112303, 2.413224, 1, 0, 0.07058824, 1,
2.206058, 0.4947753, 0.1031896, 1, 0, 0.06666667, 1,
2.233716, 1.02932, 2.468558, 1, 0, 0.05882353, 1,
2.240139, 0.8182219, -0.2152801, 1, 0, 0.05490196, 1,
2.25951, 0.04883992, 1.592944, 1, 0, 0.04705882, 1,
2.321504, -0.506228, 0.6010143, 1, 0, 0.04313726, 1,
2.371956, 0.7035839, 2.691878, 1, 0, 0.03529412, 1,
2.403686, 1.623014, 4.072659, 1, 0, 0.03137255, 1,
2.43255, -0.5737268, 0.6309499, 1, 0, 0.02352941, 1,
2.650249, -1.124093, 2.334412, 1, 0, 0.01960784, 1,
3.044124, -0.05077032, 1.844408, 1, 0, 0.01176471, 1,
4.382749, 0.08320703, 1.539533, 1, 0, 0.007843138, 1
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
0.5237796, -4.94152, -7.61975, 0, -0.5, 0.5, 0.5,
0.5237796, -4.94152, -7.61975, 1, -0.5, 0.5, 0.5,
0.5237796, -4.94152, -7.61975, 1, 1.5, 0.5, 0.5,
0.5237796, -4.94152, -7.61975, 0, 1.5, 0.5, 0.5
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
-4.643381, -0.04475403, -7.61975, 0, -0.5, 0.5, 0.5,
-4.643381, -0.04475403, -7.61975, 1, -0.5, 0.5, 0.5,
-4.643381, -0.04475403, -7.61975, 1, 1.5, 0.5, 0.5,
-4.643381, -0.04475403, -7.61975, 0, 1.5, 0.5, 0.5
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
-4.643381, -4.94152, -0.1600149, 0, -0.5, 0.5, 0.5,
-4.643381, -4.94152, -0.1600149, 1, -0.5, 0.5, 0.5,
-4.643381, -4.94152, -0.1600149, 1, 1.5, 0.5, 0.5,
-4.643381, -4.94152, -0.1600149, 0, 1.5, 0.5, 0.5
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
-2, -3.811497, -5.898273,
4, -3.811497, -5.898273,
-2, -3.811497, -5.898273,
-2, -3.999834, -6.185185,
0, -3.811497, -5.898273,
0, -3.999834, -6.185185,
2, -3.811497, -5.898273,
2, -3.999834, -6.185185,
4, -3.811497, -5.898273,
4, -3.999834, -6.185185
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
"2",
"4"
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
-2, -4.376508, -6.759011, 0, -0.5, 0.5, 0.5,
-2, -4.376508, -6.759011, 1, -0.5, 0.5, 0.5,
-2, -4.376508, -6.759011, 1, 1.5, 0.5, 0.5,
-2, -4.376508, -6.759011, 0, 1.5, 0.5, 0.5,
0, -4.376508, -6.759011, 0, -0.5, 0.5, 0.5,
0, -4.376508, -6.759011, 1, -0.5, 0.5, 0.5,
0, -4.376508, -6.759011, 1, 1.5, 0.5, 0.5,
0, -4.376508, -6.759011, 0, 1.5, 0.5, 0.5,
2, -4.376508, -6.759011, 0, -0.5, 0.5, 0.5,
2, -4.376508, -6.759011, 1, -0.5, 0.5, 0.5,
2, -4.376508, -6.759011, 1, 1.5, 0.5, 0.5,
2, -4.376508, -6.759011, 0, 1.5, 0.5, 0.5,
4, -4.376508, -6.759011, 0, -0.5, 0.5, 0.5,
4, -4.376508, -6.759011, 1, -0.5, 0.5, 0.5,
4, -4.376508, -6.759011, 1, 1.5, 0.5, 0.5,
4, -4.376508, -6.759011, 0, 1.5, 0.5, 0.5
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
-3.450959, -2, -5.898273,
-3.450959, 2, -5.898273,
-3.450959, -2, -5.898273,
-3.649696, -2, -6.185185,
-3.450959, 0, -5.898273,
-3.649696, 0, -6.185185,
-3.450959, 2, -5.898273,
-3.649696, 2, -6.185185
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
-4.04717, -2, -6.759011, 0, -0.5, 0.5, 0.5,
-4.04717, -2, -6.759011, 1, -0.5, 0.5, 0.5,
-4.04717, -2, -6.759011, 1, 1.5, 0.5, 0.5,
-4.04717, -2, -6.759011, 0, 1.5, 0.5, 0.5,
-4.04717, 0, -6.759011, 0, -0.5, 0.5, 0.5,
-4.04717, 0, -6.759011, 1, -0.5, 0.5, 0.5,
-4.04717, 0, -6.759011, 1, 1.5, 0.5, 0.5,
-4.04717, 0, -6.759011, 0, 1.5, 0.5, 0.5,
-4.04717, 2, -6.759011, 0, -0.5, 0.5, 0.5,
-4.04717, 2, -6.759011, 1, -0.5, 0.5, 0.5,
-4.04717, 2, -6.759011, 1, 1.5, 0.5, 0.5,
-4.04717, 2, -6.759011, 0, 1.5, 0.5, 0.5
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
-3.450959, -3.811497, -4,
-3.450959, -3.811497, 4,
-3.450959, -3.811497, -4,
-3.649696, -3.999834, -4,
-3.450959, -3.811497, -2,
-3.649696, -3.999834, -2,
-3.450959, -3.811497, 0,
-3.649696, -3.999834, 0,
-3.450959, -3.811497, 2,
-3.649696, -3.999834, 2,
-3.450959, -3.811497, 4,
-3.649696, -3.999834, 4
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
-4.04717, -4.376508, -4, 0, -0.5, 0.5, 0.5,
-4.04717, -4.376508, -4, 1, -0.5, 0.5, 0.5,
-4.04717, -4.376508, -4, 1, 1.5, 0.5, 0.5,
-4.04717, -4.376508, -4, 0, 1.5, 0.5, 0.5,
-4.04717, -4.376508, -2, 0, -0.5, 0.5, 0.5,
-4.04717, -4.376508, -2, 1, -0.5, 0.5, 0.5,
-4.04717, -4.376508, -2, 1, 1.5, 0.5, 0.5,
-4.04717, -4.376508, -2, 0, 1.5, 0.5, 0.5,
-4.04717, -4.376508, 0, 0, -0.5, 0.5, 0.5,
-4.04717, -4.376508, 0, 1, -0.5, 0.5, 0.5,
-4.04717, -4.376508, 0, 1, 1.5, 0.5, 0.5,
-4.04717, -4.376508, 0, 0, 1.5, 0.5, 0.5,
-4.04717, -4.376508, 2, 0, -0.5, 0.5, 0.5,
-4.04717, -4.376508, 2, 1, -0.5, 0.5, 0.5,
-4.04717, -4.376508, 2, 1, 1.5, 0.5, 0.5,
-4.04717, -4.376508, 2, 0, 1.5, 0.5, 0.5,
-4.04717, -4.376508, 4, 0, -0.5, 0.5, 0.5,
-4.04717, -4.376508, 4, 1, -0.5, 0.5, 0.5,
-4.04717, -4.376508, 4, 1, 1.5, 0.5, 0.5,
-4.04717, -4.376508, 4, 0, 1.5, 0.5, 0.5
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
-3.450959, -3.811497, -5.898273,
-3.450959, 3.721989, -5.898273,
-3.450959, -3.811497, 5.578243,
-3.450959, 3.721989, 5.578243,
-3.450959, -3.811497, -5.898273,
-3.450959, -3.811497, 5.578243,
-3.450959, 3.721989, -5.898273,
-3.450959, 3.721989, 5.578243,
-3.450959, -3.811497, -5.898273,
4.498518, -3.811497, -5.898273,
-3.450959, -3.811497, 5.578243,
4.498518, -3.811497, 5.578243,
-3.450959, 3.721989, -5.898273,
4.498518, 3.721989, -5.898273,
-3.450959, 3.721989, 5.578243,
4.498518, 3.721989, 5.578243,
4.498518, -3.811497, -5.898273,
4.498518, 3.721989, -5.898273,
4.498518, -3.811497, 5.578243,
4.498518, 3.721989, 5.578243,
4.498518, -3.811497, -5.898273,
4.498518, -3.811497, 5.578243,
4.498518, 3.721989, -5.898273,
4.498518, 3.721989, 5.578243
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
var radius = 8.470925;
var distance = 37.6881;
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
mvMatrix.translate( -0.5237796, 0.04475403, 0.1600149 );
mvMatrix.scale( 1.152142, 1.215763, 0.7980585 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.6881);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
fenpyroximate<-read.table("fenpyroximate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenpyroximate$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenpyroximate' not found
```

```r
y<-fenpyroximate$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenpyroximate' not found
```

```r
z<-fenpyroximate$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenpyroximate' not found
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
-3.33519, 0.003977608, -2.069593, 0, 0, 1, 1, 1,
-2.999253, 1.277567, -1.125139, 1, 0, 0, 1, 1,
-2.543738, 0.4760249, -2.351998, 1, 0, 0, 1, 1,
-2.538483, -1.258246, -1.687302, 1, 0, 0, 1, 1,
-2.53085, -0.995924, -3.675372, 1, 0, 0, 1, 1,
-2.492779, 0.7540568, -0.663151, 1, 0, 0, 1, 1,
-2.443967, 1.442246, -0.9013217, 0, 0, 0, 1, 1,
-2.388402, 0.2697316, -1.991368, 0, 0, 0, 1, 1,
-2.333091, -0.138856, -1.745762, 0, 0, 0, 1, 1,
-2.304328, 0.6433164, -0.5847441, 0, 0, 0, 1, 1,
-2.296226, 0.04297061, -2.344835, 0, 0, 0, 1, 1,
-2.266743, -0.1164471, -3.061686, 0, 0, 0, 1, 1,
-2.243949, 0.8282596, -2.333619, 0, 0, 0, 1, 1,
-2.2083, -0.6619696, -3.516027, 1, 1, 1, 1, 1,
-2.162691, -0.9394076, -3.197413, 1, 1, 1, 1, 1,
-2.120412, -0.9617829, -1.986782, 1, 1, 1, 1, 1,
-2.117515, 0.5231439, -0.8493421, 1, 1, 1, 1, 1,
-2.090215, -0.4962821, -1.747805, 1, 1, 1, 1, 1,
-2.089211, 0.7728943, -1.803, 1, 1, 1, 1, 1,
-2.082808, 0.1146162, -0.09778232, 1, 1, 1, 1, 1,
-2.059234, -1.682007, -2.758435, 1, 1, 1, 1, 1,
-2.020903, -0.9640682, -1.438909, 1, 1, 1, 1, 1,
-1.994278, -0.02286896, -0.9632755, 1, 1, 1, 1, 1,
-1.959986, -1.743917, -2.21301, 1, 1, 1, 1, 1,
-1.948074, -0.2431139, -0.7604747, 1, 1, 1, 1, 1,
-1.933676, -0.9170676, -1.793284, 1, 1, 1, 1, 1,
-1.915223, 0.005206283, -1.342531, 1, 1, 1, 1, 1,
-1.892931, 0.8941663, 0.4762206, 1, 1, 1, 1, 1,
-1.888257, 0.6501481, -0.5675919, 0, 0, 1, 1, 1,
-1.849635, 0.2651326, -2.4408, 1, 0, 0, 1, 1,
-1.83508, 1.446674, -0.6978332, 1, 0, 0, 1, 1,
-1.820881, -3.701786, -2.081291, 1, 0, 0, 1, 1,
-1.791528, 0.673746, -1.630685, 1, 0, 0, 1, 1,
-1.779956, 0.4646518, -0.214045, 1, 0, 0, 1, 1,
-1.768781, 1.856738, -1.588968, 0, 0, 0, 1, 1,
-1.750322, -0.1860196, -1.696413, 0, 0, 0, 1, 1,
-1.745159, -0.5578883, -0.9061077, 0, 0, 0, 1, 1,
-1.738103, -1.586291, -3.107383, 0, 0, 0, 1, 1,
-1.734457, -1.143008, 0.03753875, 0, 0, 0, 1, 1,
-1.733036, 1.038832, -2.519157, 0, 0, 0, 1, 1,
-1.725436, 2.139256, -2.250566, 0, 0, 0, 1, 1,
-1.722521, 0.9731359, -1.234004, 1, 1, 1, 1, 1,
-1.707251, 0.8613642, -0.3679386, 1, 1, 1, 1, 1,
-1.693892, 0.4502272, -1.290928, 1, 1, 1, 1, 1,
-1.688005, 0.9480016, -1.67524, 1, 1, 1, 1, 1,
-1.686262, 1.994259, 0.03496026, 1, 1, 1, 1, 1,
-1.659974, 0.7101033, -1.734761, 1, 1, 1, 1, 1,
-1.659928, 0.2365028, -1.041996, 1, 1, 1, 1, 1,
-1.656642, -2.276424, -1.511747, 1, 1, 1, 1, 1,
-1.64626, -0.4881032, -0.7387558, 1, 1, 1, 1, 1,
-1.644348, -0.1489397, 0.03081947, 1, 1, 1, 1, 1,
-1.627315, 1.629387, -0.6442298, 1, 1, 1, 1, 1,
-1.623349, 0.8804135, -0.6451993, 1, 1, 1, 1, 1,
-1.607428, 2.314186, -0.3306834, 1, 1, 1, 1, 1,
-1.602605, -2.012751, -2.199297, 1, 1, 1, 1, 1,
-1.594426, 2.460175, -1.166609, 1, 1, 1, 1, 1,
-1.57677, 0.2693402, 1.478877, 0, 0, 1, 1, 1,
-1.573009, -0.3746507, -2.215182, 1, 0, 0, 1, 1,
-1.551757, -0.7771257, -1.747592, 1, 0, 0, 1, 1,
-1.54869, -1.596455, -2.716573, 1, 0, 0, 1, 1,
-1.548654, -1.124066, -2.175552, 1, 0, 0, 1, 1,
-1.548468, -0.9917902, -1.503375, 1, 0, 0, 1, 1,
-1.540433, -0.3119426, -2.220657, 0, 0, 0, 1, 1,
-1.537637, -1.43455, -2.761538, 0, 0, 0, 1, 1,
-1.526097, -0.9891825, -1.742303, 0, 0, 0, 1, 1,
-1.525256, 0.3932973, -1.489224, 0, 0, 0, 1, 1,
-1.51392, 0.9766917, -1.831232, 0, 0, 0, 1, 1,
-1.489086, 0.05215244, -0.8933974, 0, 0, 0, 1, 1,
-1.47782, 0.07125845, -3.366047, 0, 0, 0, 1, 1,
-1.476742, 0.3321877, -0.6536614, 1, 1, 1, 1, 1,
-1.471361, -2.678406, -3.43067, 1, 1, 1, 1, 1,
-1.465416, 0.8196607, -0.2971656, 1, 1, 1, 1, 1,
-1.458199, 0.3693872, -0.2917518, 1, 1, 1, 1, 1,
-1.449021, 0.7103754, -1.638507, 1, 1, 1, 1, 1,
-1.445525, -0.6838928, -1.031088, 1, 1, 1, 1, 1,
-1.44235, -0.03717503, -2.174056, 1, 1, 1, 1, 1,
-1.437318, 1.219361, -1.804314, 1, 1, 1, 1, 1,
-1.43683, -0.09041163, -2.184574, 1, 1, 1, 1, 1,
-1.43225, 2.082537, -0.7364376, 1, 1, 1, 1, 1,
-1.41603, 1.486654, -1.376143, 1, 1, 1, 1, 1,
-1.369336, 0.1481945, -0.1717763, 1, 1, 1, 1, 1,
-1.351759, 1.039563, 0.3618062, 1, 1, 1, 1, 1,
-1.346209, 1.711682, 0.6768529, 1, 1, 1, 1, 1,
-1.346094, -0.8411153, -2.647513, 1, 1, 1, 1, 1,
-1.34043, -0.6747959, -1.433296, 0, 0, 1, 1, 1,
-1.327192, 0.9159154, -0.3724013, 1, 0, 0, 1, 1,
-1.326717, -0.1973936, -1.183805, 1, 0, 0, 1, 1,
-1.313616, 0.5684807, -1.86424, 1, 0, 0, 1, 1,
-1.31013, 0.0255798, -0.3646227, 1, 0, 0, 1, 1,
-1.308683, 0.5857143, -4.12622, 1, 0, 0, 1, 1,
-1.307175, -0.36423, -1.485943, 0, 0, 0, 1, 1,
-1.305522, 0.1107926, -3.33834, 0, 0, 0, 1, 1,
-1.29994, -0.3761228, -1.434732, 0, 0, 0, 1, 1,
-1.291801, 0.1758979, -1.616749, 0, 0, 0, 1, 1,
-1.288119, -0.06457339, -1.045304, 0, 0, 0, 1, 1,
-1.286564, -0.2638367, -0.7156122, 0, 0, 0, 1, 1,
-1.285762, -0.501976, -1.734143, 0, 0, 0, 1, 1,
-1.285558, 1.060964, -2.181138, 1, 1, 1, 1, 1,
-1.281602, 0.7947509, 0.1615198, 1, 1, 1, 1, 1,
-1.273462, 0.7524083, -0.620784, 1, 1, 1, 1, 1,
-1.272866, -0.5025699, -1.095513, 1, 1, 1, 1, 1,
-1.265436, 0.706744, -1.412858, 1, 1, 1, 1, 1,
-1.259266, 0.9649071, -1.846004, 1, 1, 1, 1, 1,
-1.254797, 1.529176, 0.2703424, 1, 1, 1, 1, 1,
-1.249459, -0.761229, -1.917673, 1, 1, 1, 1, 1,
-1.245057, -0.07179879, -1.43271, 1, 1, 1, 1, 1,
-1.240485, -0.08444434, 0.1733495, 1, 1, 1, 1, 1,
-1.233535, -1.261062, -2.251736, 1, 1, 1, 1, 1,
-1.229966, -1.318725, -3.838322, 1, 1, 1, 1, 1,
-1.228082, 0.6053265, 0.01807534, 1, 1, 1, 1, 1,
-1.225386, 1.494958, -1.858084, 1, 1, 1, 1, 1,
-1.221083, -1.573504, -1.91827, 1, 1, 1, 1, 1,
-1.219853, 0.3808236, -0.3536203, 0, 0, 1, 1, 1,
-1.218463, -0.0708704, -0.7854117, 1, 0, 0, 1, 1,
-1.188375, 0.1776283, -2.786213, 1, 0, 0, 1, 1,
-1.184254, 0.4714762, -2.561124, 1, 0, 0, 1, 1,
-1.178117, -0.03641763, -1.924458, 1, 0, 0, 1, 1,
-1.174938, 0.3667655, -2.796284, 1, 0, 0, 1, 1,
-1.169179, -0.09956634, -2.194697, 0, 0, 0, 1, 1,
-1.164773, -0.05316482, -1.752258, 0, 0, 0, 1, 1,
-1.162513, 2.153822, -0.1684902, 0, 0, 0, 1, 1,
-1.157059, 0.8901626, -2.044351, 0, 0, 0, 1, 1,
-1.1564, -1.411929, -2.51493, 0, 0, 0, 1, 1,
-1.143868, 0.8856091, -1.285897, 0, 0, 0, 1, 1,
-1.141488, 0.6927694, 0.9310725, 0, 0, 0, 1, 1,
-1.140397, -2.24394, -2.231187, 1, 1, 1, 1, 1,
-1.13954, 0.1399557, -4.242892, 1, 1, 1, 1, 1,
-1.137665, -0.3202349, -1.703044, 1, 1, 1, 1, 1,
-1.130778, 0.2941723, -0.6402926, 1, 1, 1, 1, 1,
-1.129171, -0.5784701, -2.607882, 1, 1, 1, 1, 1,
-1.125954, -0.1932947, 0.3363762, 1, 1, 1, 1, 1,
-1.123772, -1.386252, -2.375691, 1, 1, 1, 1, 1,
-1.123136, -1.016335, -2.443201, 1, 1, 1, 1, 1,
-1.12158, -1.393282, -1.175792, 1, 1, 1, 1, 1,
-1.111903, 0.1732979, -1.107963, 1, 1, 1, 1, 1,
-1.106821, -1.644088, -3.103218, 1, 1, 1, 1, 1,
-1.10183, 0.3883935, -0.8428366, 1, 1, 1, 1, 1,
-1.086592, 0.2711645, 0.3135079, 1, 1, 1, 1, 1,
-1.083088, 0.1334023, -1.001835, 1, 1, 1, 1, 1,
-1.0715, 1.26198, 0.1623537, 1, 1, 1, 1, 1,
-1.071028, 0.450954, -1.833102, 0, 0, 1, 1, 1,
-1.069581, 0.2301975, 0.1184756, 1, 0, 0, 1, 1,
-1.065454, -0.3149674, -0.6562095, 1, 0, 0, 1, 1,
-1.06518, 1.025917, -0.1685429, 1, 0, 0, 1, 1,
-1.051025, 0.2132876, -1.483432, 1, 0, 0, 1, 1,
-1.042896, 0.4501163, -1.774833, 1, 0, 0, 1, 1,
-1.033455, 0.7613856, -2.595168, 0, 0, 0, 1, 1,
-1.03263, 0.08070731, -0.2851664, 0, 0, 0, 1, 1,
-1.031895, 0.8649694, -1.923836, 0, 0, 0, 1, 1,
-1.030851, 1.028401, -0.6961277, 0, 0, 0, 1, 1,
-1.023888, -0.8720484, -2.014467, 0, 0, 0, 1, 1,
-1.022998, 1.391175, -1.05513, 0, 0, 0, 1, 1,
-1.019655, 0.08800285, -3.062591, 0, 0, 0, 1, 1,
-1.015049, 0.03711079, -1.729671, 1, 1, 1, 1, 1,
-1.013457, 0.0599042, -0.7591707, 1, 1, 1, 1, 1,
-1.006523, 0.276843, -1.696779, 1, 1, 1, 1, 1,
-1.006343, -1.067279, -4.310136, 1, 1, 1, 1, 1,
-1.00346, 1.018119, -0.7453607, 1, 1, 1, 1, 1,
-1.002271, -0.008527005, -3.655832, 1, 1, 1, 1, 1,
-1.001855, -1.133881, -4.268103, 1, 1, 1, 1, 1,
-0.9984756, -0.3388613, -1.999412, 1, 1, 1, 1, 1,
-0.9957777, 1.191866, -0.2642553, 1, 1, 1, 1, 1,
-0.9934298, 0.5803819, 0.2825797, 1, 1, 1, 1, 1,
-0.9896303, -0.7496012, -3.87905, 1, 1, 1, 1, 1,
-0.9865752, -0.04225014, -1.51379, 1, 1, 1, 1, 1,
-0.9862467, 1.597298, -1.408179, 1, 1, 1, 1, 1,
-0.9842604, 0.9042892, -1.023235, 1, 1, 1, 1, 1,
-0.9763216, -1.376986, -1.853475, 1, 1, 1, 1, 1,
-0.9726395, -0.2964909, -0.627976, 0, 0, 1, 1, 1,
-0.9708613, -0.8537404, -2.872426, 1, 0, 0, 1, 1,
-0.9639297, 0.3071311, -2.922, 1, 0, 0, 1, 1,
-0.9629623, 1.006614, -0.3280509, 1, 0, 0, 1, 1,
-0.9602715, -2.060214, -1.501492, 1, 0, 0, 1, 1,
-0.9593595, 0.6654475, -0.1679563, 1, 0, 0, 1, 1,
-0.9399498, -0.6739374, -1.533598, 0, 0, 0, 1, 1,
-0.9392544, -0.01936192, -2.444824, 0, 0, 0, 1, 1,
-0.9291935, -0.7385747, -4.079502, 0, 0, 0, 1, 1,
-0.9263589, 0.9563817, -0.9168418, 0, 0, 0, 1, 1,
-0.9225594, 0.7112716, -2.395176, 0, 0, 0, 1, 1,
-0.9126171, -1.699728, -2.160824, 0, 0, 0, 1, 1,
-0.9112415, 0.6621833, -0.9525746, 0, 0, 0, 1, 1,
-0.9081303, 0.2664217, -2.682771, 1, 1, 1, 1, 1,
-0.9052995, 0.9048558, -1.177149, 1, 1, 1, 1, 1,
-0.9047348, 0.5309093, -1.577572, 1, 1, 1, 1, 1,
-0.9044985, -1.230944, -4.718875, 1, 1, 1, 1, 1,
-0.9042731, 0.1252348, -0.7656556, 1, 1, 1, 1, 1,
-0.9002283, -1.597729, -2.1675, 1, 1, 1, 1, 1,
-0.8965119, -0.3558194, -1.013823, 1, 1, 1, 1, 1,
-0.8770446, 0.3926779, -0.8566268, 1, 1, 1, 1, 1,
-0.8751789, -0.8267443, -1.265782, 1, 1, 1, 1, 1,
-0.8719347, 0.1897265, -3.018198, 1, 1, 1, 1, 1,
-0.870562, 0.3134005, -0.8810185, 1, 1, 1, 1, 1,
-0.8690904, 0.1031836, -1.043719, 1, 1, 1, 1, 1,
-0.8685926, -0.2506104, -2.488685, 1, 1, 1, 1, 1,
-0.8653715, -0.1722611, -1.457726, 1, 1, 1, 1, 1,
-0.8628525, 0.6802458, 0.04001708, 1, 1, 1, 1, 1,
-0.8626518, -1.531758, -3.160162, 0, 0, 1, 1, 1,
-0.8609981, -0.2832862, -1.980263, 1, 0, 0, 1, 1,
-0.8602205, 0.1388557, -2.526867, 1, 0, 0, 1, 1,
-0.8585635, -0.3158056, -1.497301, 1, 0, 0, 1, 1,
-0.854866, 1.981779, -0.7581475, 1, 0, 0, 1, 1,
-0.8476013, 0.2996364, -2.015598, 1, 0, 0, 1, 1,
-0.8440953, 1.45092, -0.9691033, 0, 0, 0, 1, 1,
-0.8440664, -0.3457739, -1.588449, 0, 0, 0, 1, 1,
-0.8414826, 1.892485, 2.672067, 0, 0, 0, 1, 1,
-0.8383509, -1.20183, -2.074191, 0, 0, 0, 1, 1,
-0.8377866, 1.832106, -0.5183265, 0, 0, 0, 1, 1,
-0.8358587, -0.3588009, -3.220086, 0, 0, 0, 1, 1,
-0.8324538, -0.7533779, -3.481201, 0, 0, 0, 1, 1,
-0.8286323, 0.1174043, 0.6596932, 1, 1, 1, 1, 1,
-0.8241843, -0.9956235, -3.047271, 1, 1, 1, 1, 1,
-0.8200871, -1.528355, -2.697404, 1, 1, 1, 1, 1,
-0.8095487, 0.3836468, -2.522554, 1, 1, 1, 1, 1,
-0.8092901, -1.032734, -1.266597, 1, 1, 1, 1, 1,
-0.8052679, -0.7861775, -3.169013, 1, 1, 1, 1, 1,
-0.8050258, 0.04386429, -0.0533044, 1, 1, 1, 1, 1,
-0.8048521, 0.1765365, -2.337196, 1, 1, 1, 1, 1,
-0.7998943, -0.0371187, -3.930209, 1, 1, 1, 1, 1,
-0.795188, 0.6022003, -0.1558166, 1, 1, 1, 1, 1,
-0.7950324, -0.7921764, -2.962763, 1, 1, 1, 1, 1,
-0.7922764, -0.6584585, -1.663152, 1, 1, 1, 1, 1,
-0.7922423, 0.8795909, -1.090469, 1, 1, 1, 1, 1,
-0.7909821, 0.7911431, -1.384188, 1, 1, 1, 1, 1,
-0.7895569, 0.1069888, -2.193016, 1, 1, 1, 1, 1,
-0.7844347, -1.092636, -1.545584, 0, 0, 1, 1, 1,
-0.7838632, -1.43859, -2.286567, 1, 0, 0, 1, 1,
-0.7701733, -0.4968243, -2.536466, 1, 0, 0, 1, 1,
-0.7683263, -0.9082869, -3.7242, 1, 0, 0, 1, 1,
-0.7681798, -0.2988485, -4.262706, 1, 0, 0, 1, 1,
-0.764136, -0.7838964, -1.883969, 1, 0, 0, 1, 1,
-0.7552498, -1.304819, -3.64497, 0, 0, 0, 1, 1,
-0.7535931, 0.8436832, -0.1615706, 0, 0, 0, 1, 1,
-0.7482148, -0.1713132, -0.7527036, 0, 0, 0, 1, 1,
-0.746694, 0.7226982, -2.134618, 0, 0, 0, 1, 1,
-0.746376, 1.062405, -0.9099665, 0, 0, 0, 1, 1,
-0.7421094, 0.5814485, -0.8691885, 0, 0, 0, 1, 1,
-0.7420369, -0.5415895, -3.694937, 0, 0, 0, 1, 1,
-0.7404703, 0.2464022, -1.292961, 1, 1, 1, 1, 1,
-0.7391095, 1.667106, -1.176453, 1, 1, 1, 1, 1,
-0.7365839, 1.148383, -1.92495, 1, 1, 1, 1, 1,
-0.7346467, -0.4884357, -3.666405, 1, 1, 1, 1, 1,
-0.7269757, -0.5855917, -1.591454, 1, 1, 1, 1, 1,
-0.7226738, -1.641241, -2.795259, 1, 1, 1, 1, 1,
-0.7212417, -0.09672879, -1.439289, 1, 1, 1, 1, 1,
-0.7203768, -1.08284, -5.731139, 1, 1, 1, 1, 1,
-0.7189119, -1.646577, -2.746737, 1, 1, 1, 1, 1,
-0.7168205, -1.232906, -2.248954, 1, 1, 1, 1, 1,
-0.7153751, -0.5302088, -1.252732, 1, 1, 1, 1, 1,
-0.7124745, 0.9000736, 0.5724043, 1, 1, 1, 1, 1,
-0.7080895, -1.6537, -2.540813, 1, 1, 1, 1, 1,
-0.7065116, 0.6878602, -0.7682537, 1, 1, 1, 1, 1,
-0.7034833, -0.946699, -0.9096845, 1, 1, 1, 1, 1,
-0.7030637, -0.1978328, -1.64912, 0, 0, 1, 1, 1,
-0.7010202, 0.7402304, -0.01445526, 1, 0, 0, 1, 1,
-0.7008287, 1.058805, -1.276175, 1, 0, 0, 1, 1,
-0.699223, 1.078211, 0.3425498, 1, 0, 0, 1, 1,
-0.6979217, -0.6192791, -2.10264, 1, 0, 0, 1, 1,
-0.6889248, 0.3778391, -0.4022598, 1, 0, 0, 1, 1,
-0.6845003, -0.5864596, 0.1640185, 0, 0, 0, 1, 1,
-0.6812564, -0.5038753, -2.977316, 0, 0, 0, 1, 1,
-0.6704667, -0.6351519, -1.222114, 0, 0, 0, 1, 1,
-0.6689717, 1.114555, 0.5613978, 0, 0, 0, 1, 1,
-0.6674094, -0.5316409, -3.250961, 0, 0, 0, 1, 1,
-0.6638371, -0.6107883, -1.910814, 0, 0, 0, 1, 1,
-0.66237, -1.079554, -2.452655, 0, 0, 0, 1, 1,
-0.6560843, -0.5334495, -3.154099, 1, 1, 1, 1, 1,
-0.6528591, -0.2822054, -1.144689, 1, 1, 1, 1, 1,
-0.6516396, 0.141297, -1.945754, 1, 1, 1, 1, 1,
-0.6457133, 1.312576, -2.089514, 1, 1, 1, 1, 1,
-0.6422151, 1.70679, -0.8778734, 1, 1, 1, 1, 1,
-0.6405591, -1.367996, -2.667374, 1, 1, 1, 1, 1,
-0.6361579, 0.9741724, 0.1009059, 1, 1, 1, 1, 1,
-0.6360149, -0.03042227, -2.785414, 1, 1, 1, 1, 1,
-0.6354039, 2.472868, 0.3464685, 1, 1, 1, 1, 1,
-0.6330185, -0.1932368, -0.5786185, 1, 1, 1, 1, 1,
-0.6303475, 0.9914179, -0.07838913, 1, 1, 1, 1, 1,
-0.6292439, -0.3427788, -2.310355, 1, 1, 1, 1, 1,
-0.6282153, 0.5633894, -1.991443, 1, 1, 1, 1, 1,
-0.6258674, -1.630121, -3.290684, 1, 1, 1, 1, 1,
-0.6246334, 1.069033, -0.1934837, 1, 1, 1, 1, 1,
-0.6230841, -1.562372, -2.837473, 0, 0, 1, 1, 1,
-0.6193472, -0.4389368, -3.396972, 1, 0, 0, 1, 1,
-0.6139621, 1.59577, -2.371994, 1, 0, 0, 1, 1,
-0.6095526, 1.371737, 0.04750812, 1, 0, 0, 1, 1,
-0.6012359, -0.9861, -3.341404, 1, 0, 0, 1, 1,
-0.5999643, 0.1176419, -2.941726, 1, 0, 0, 1, 1,
-0.5975363, -0.6904998, -3.014394, 0, 0, 0, 1, 1,
-0.596586, -0.5079876, -0.736272, 0, 0, 0, 1, 1,
-0.5906126, -0.7860346, -3.537329, 0, 0, 0, 1, 1,
-0.5905514, -0.4498278, -3.018317, 0, 0, 0, 1, 1,
-0.5835332, 0.878743, -1.757499, 0, 0, 0, 1, 1,
-0.5827544, -0.6250611, -2.353595, 0, 0, 0, 1, 1,
-0.5798175, 0.2307833, -2.385609, 0, 0, 0, 1, 1,
-0.5770994, -0.897555, -1.886961, 1, 1, 1, 1, 1,
-0.5699854, 0.3095741, 0.9154844, 1, 1, 1, 1, 1,
-0.565506, 0.495027, 0.856489, 1, 1, 1, 1, 1,
-0.565348, -0.4646957, -1.376901, 1, 1, 1, 1, 1,
-0.5640671, -0.551939, -3.111417, 1, 1, 1, 1, 1,
-0.5571778, 0.8180087, -0.1733234, 1, 1, 1, 1, 1,
-0.5555492, 0.04133006, -2.155545, 1, 1, 1, 1, 1,
-0.5430801, -0.7572379, -1.137321, 1, 1, 1, 1, 1,
-0.540433, 0.8122525, -0.2786842, 1, 1, 1, 1, 1,
-0.5379328, 0.2279359, -0.6584699, 1, 1, 1, 1, 1,
-0.5353591, 1.188874, -0.8548571, 1, 1, 1, 1, 1,
-0.528793, 0.8240247, 0.0528414, 1, 1, 1, 1, 1,
-0.5253559, 0.6762215, -0.5220311, 1, 1, 1, 1, 1,
-0.5232819, -1.069715, -2.520811, 1, 1, 1, 1, 1,
-0.516741, 0.2841872, -1.183634, 1, 1, 1, 1, 1,
-0.5147071, 0.7787686, 1.403161, 0, 0, 1, 1, 1,
-0.513159, 0.486377, 0.07109738, 1, 0, 0, 1, 1,
-0.5108079, -2.613886, -1.728258, 1, 0, 0, 1, 1,
-0.5100496, 0.7139789, -0.1910745, 1, 0, 0, 1, 1,
-0.5070507, -0.1418638, -3.157615, 1, 0, 0, 1, 1,
-0.5062246, 0.5753116, -0.6331433, 1, 0, 0, 1, 1,
-0.5061161, 0.6477995, -0.2754525, 0, 0, 0, 1, 1,
-0.4904263, 0.5941788, -2.490099, 0, 0, 0, 1, 1,
-0.4897074, -0.1004908, -2.846874, 0, 0, 0, 1, 1,
-0.4892494, -1.063395, -2.12682, 0, 0, 0, 1, 1,
-0.4888677, 1.107662, -0.8854704, 0, 0, 0, 1, 1,
-0.4880657, 2.156088, 0.7822558, 0, 0, 0, 1, 1,
-0.4834622, 2.126608, 0.479273, 0, 0, 0, 1, 1,
-0.4825102, 0.1515588, -0.4352753, 1, 1, 1, 1, 1,
-0.4759427, 0.5541945, -0.7210377, 1, 1, 1, 1, 1,
-0.4754728, -0.8456676, -2.318833, 1, 1, 1, 1, 1,
-0.472315, -0.1156393, -2.574108, 1, 1, 1, 1, 1,
-0.4687667, -0.7822058, -1.913192, 1, 1, 1, 1, 1,
-0.4687635, -2.446487, -2.032979, 1, 1, 1, 1, 1,
-0.4630313, 0.5196751, 2.588207, 1, 1, 1, 1, 1,
-0.4614181, 1.438273, 0.4812984, 1, 1, 1, 1, 1,
-0.4605394, -0.6459304, -1.964939, 1, 1, 1, 1, 1,
-0.4604461, 2.475912, -1.645309, 1, 1, 1, 1, 1,
-0.4594432, -1.203506, -4.415536, 1, 1, 1, 1, 1,
-0.4562371, 0.8526337, -0.6992916, 1, 1, 1, 1, 1,
-0.4520988, -1.604635, -3.830513, 1, 1, 1, 1, 1,
-0.4500462, -0.5770169, -3.351153, 1, 1, 1, 1, 1,
-0.4465731, -1.438719, -3.626785, 1, 1, 1, 1, 1,
-0.4419886, -1.010321, -2.275315, 0, 0, 1, 1, 1,
-0.4406129, 0.1664878, -0.8547391, 1, 0, 0, 1, 1,
-0.4394772, 0.5451257, -1.696114, 1, 0, 0, 1, 1,
-0.4367883, 0.3249767, 0.3192941, 1, 0, 0, 1, 1,
-0.4358677, 2.446405, -0.8526532, 1, 0, 0, 1, 1,
-0.4352289, 1.99529, -0.7216763, 1, 0, 0, 1, 1,
-0.4339326, -0.8250527, -3.445002, 0, 0, 0, 1, 1,
-0.4322797, 1.504481, -0.3847368, 0, 0, 0, 1, 1,
-0.4298607, -0.1669597, -0.9772632, 0, 0, 0, 1, 1,
-0.4272056, -0.4938135, -3.129167, 0, 0, 0, 1, 1,
-0.4249304, 1.725233, 0.1134751, 0, 0, 0, 1, 1,
-0.4239436, 0.05138433, -1.074355, 0, 0, 0, 1, 1,
-0.4229757, -0.6088707, -1.184222, 0, 0, 0, 1, 1,
-0.4216265, 0.5015771, -0.8189718, 1, 1, 1, 1, 1,
-0.42158, -0.03242528, -2.157626, 1, 1, 1, 1, 1,
-0.4192534, 1.902502, 0.6922784, 1, 1, 1, 1, 1,
-0.4123178, 0.8171022, -0.3263817, 1, 1, 1, 1, 1,
-0.4058205, -0.06622742, -1.962818, 1, 1, 1, 1, 1,
-0.3996162, 0.4375137, -1.470922, 1, 1, 1, 1, 1,
-0.3995068, -1.671858, -3.282313, 1, 1, 1, 1, 1,
-0.3994873, -1.207968, -3.328516, 1, 1, 1, 1, 1,
-0.3988312, 0.3499309, -0.7962912, 1, 1, 1, 1, 1,
-0.3843105, -1.382552, -2.752748, 1, 1, 1, 1, 1,
-0.3796456, -0.6093049, -2.176368, 1, 1, 1, 1, 1,
-0.3786808, 1.468609, -0.5119803, 1, 1, 1, 1, 1,
-0.3753142, -1.850694, -3.093779, 1, 1, 1, 1, 1,
-0.3731896, 0.242723, -1.31314, 1, 1, 1, 1, 1,
-0.3670378, 1.628534, 0.7938198, 1, 1, 1, 1, 1,
-0.3662185, -0.09550216, -1.832586, 0, 0, 1, 1, 1,
-0.362816, -0.9231662, -3.333598, 1, 0, 0, 1, 1,
-0.3537745, 0.3434547, -0.838959, 1, 0, 0, 1, 1,
-0.3532093, -0.09131817, -1.34188, 1, 0, 0, 1, 1,
-0.3529441, -1.377009, -3.193273, 1, 0, 0, 1, 1,
-0.3519045, -0.3377075, -3.2353, 1, 0, 0, 1, 1,
-0.3498576, 1.326402, -0.229973, 0, 0, 0, 1, 1,
-0.349368, -0.6755175, -2.760258, 0, 0, 0, 1, 1,
-0.3465592, 1.141242, -1.477693, 0, 0, 0, 1, 1,
-0.3437964, 1.884259, -1.28088, 0, 0, 0, 1, 1,
-0.3434794, 1.075131, 0.01588323, 0, 0, 0, 1, 1,
-0.3423986, -0.6086421, -3.10585, 0, 0, 0, 1, 1,
-0.3420217, -0.3873751, -2.075744, 0, 0, 0, 1, 1,
-0.3390572, -0.2157766, -1.658114, 1, 1, 1, 1, 1,
-0.336762, 1.06483, -0.7467347, 1, 1, 1, 1, 1,
-0.3329696, -0.9595886, -2.395471, 1, 1, 1, 1, 1,
-0.3318867, 0.9684072, -1.203078, 1, 1, 1, 1, 1,
-0.3289251, -0.7647067, -2.184318, 1, 1, 1, 1, 1,
-0.3268825, 0.32365, 1.269442, 1, 1, 1, 1, 1,
-0.3260837, 0.5795466, -0.561418, 1, 1, 1, 1, 1,
-0.3252791, -1.124576, -1.771317, 1, 1, 1, 1, 1,
-0.3211856, 0.4353535, 0.3561072, 1, 1, 1, 1, 1,
-0.314493, -1.384318, -2.507633, 1, 1, 1, 1, 1,
-0.3133123, 0.1168857, -0.4116086, 1, 1, 1, 1, 1,
-0.3073283, -0.603041, -3.450595, 1, 1, 1, 1, 1,
-0.3065046, 0.9101557, 0.2504292, 1, 1, 1, 1, 1,
-0.3039677, 0.1627872, -0.9636348, 1, 1, 1, 1, 1,
-0.3037787, -1.451357, -0.6296523, 1, 1, 1, 1, 1,
-0.2921579, 0.324887, -2.289658, 0, 0, 1, 1, 1,
-0.2906187, -1.088005, -3.206489, 1, 0, 0, 1, 1,
-0.2868701, -1.346987, -3.501727, 1, 0, 0, 1, 1,
-0.2824177, 1.835278, 0.3203284, 1, 0, 0, 1, 1,
-0.2799061, -0.2193961, -1.619927, 1, 0, 0, 1, 1,
-0.2788218, -0.1521042, -2.661901, 1, 0, 0, 1, 1,
-0.2759553, -1.372441, -3.215429, 0, 0, 0, 1, 1,
-0.2752414, -1.5903, -3.339519, 0, 0, 0, 1, 1,
-0.2729522, 0.4041733, -1.246127, 0, 0, 0, 1, 1,
-0.267779, 0.2570004, -3.316999, 0, 0, 0, 1, 1,
-0.2669264, -0.692986, -0.8604712, 0, 0, 0, 1, 1,
-0.264212, 1.256825, -0.03403467, 0, 0, 0, 1, 1,
-0.2637406, 1.890903, 2.477339, 0, 0, 0, 1, 1,
-0.2585139, -0.5533714, -2.814738, 1, 1, 1, 1, 1,
-0.2544939, -0.1755803, -4.57443, 1, 1, 1, 1, 1,
-0.2536694, -0.5447626, -4.308511, 1, 1, 1, 1, 1,
-0.2535867, 0.8451604, -3.036799, 1, 1, 1, 1, 1,
-0.2527361, -0.4269068, -3.723062, 1, 1, 1, 1, 1,
-0.2501514, 0.7007264, -1.144398, 1, 1, 1, 1, 1,
-0.2453538, -0.529359, -4.029792, 1, 1, 1, 1, 1,
-0.2451465, 0.9994308, -1.093839, 1, 1, 1, 1, 1,
-0.2385222, 1.084396, 0.2526887, 1, 1, 1, 1, 1,
-0.2354188, -1.438913, -3.396604, 1, 1, 1, 1, 1,
-0.2344043, -0.2636414, -3.306514, 1, 1, 1, 1, 1,
-0.2335158, 0.6402288, -1.168562, 1, 1, 1, 1, 1,
-0.2319227, -0.4637403, -2.136448, 1, 1, 1, 1, 1,
-0.2285951, 0.8135049, -0.02498239, 1, 1, 1, 1, 1,
-0.2218863, -2.67375, -2.707083, 1, 1, 1, 1, 1,
-0.2175226, 0.9868608, -0.3959261, 0, 0, 1, 1, 1,
-0.2172809, -0.09304719, -2.436449, 1, 0, 0, 1, 1,
-0.2142528, -0.5775556, -3.622904, 1, 0, 0, 1, 1,
-0.2031472, 0.8338563, 0.4923603, 1, 0, 0, 1, 1,
-0.201177, 0.20742, 0.1874144, 1, 0, 0, 1, 1,
-0.198229, -0.2390191, -2.274811, 1, 0, 0, 1, 1,
-0.1951541, -0.904998, -2.292871, 0, 0, 0, 1, 1,
-0.1902002, -1.04313, -4.25266, 0, 0, 0, 1, 1,
-0.1896897, 0.488598, -1.697397, 0, 0, 0, 1, 1,
-0.1884818, -0.6068079, -2.430708, 0, 0, 0, 1, 1,
-0.1873856, -1.00247, -2.785357, 0, 0, 0, 1, 1,
-0.1753498, 0.3182285, -0.8683121, 0, 0, 0, 1, 1,
-0.1749655, -1.504639, -2.768931, 0, 0, 0, 1, 1,
-0.1741696, 1.78371, -1.305337, 1, 1, 1, 1, 1,
-0.1705338, 1.765667, 0.7280536, 1, 1, 1, 1, 1,
-0.1655165, 0.4524222, -1.629625, 1, 1, 1, 1, 1,
-0.1643757, -1.715189, -2.475632, 1, 1, 1, 1, 1,
-0.1627018, -0.7547812, -3.240897, 1, 1, 1, 1, 1,
-0.160497, -0.09143887, -2.24757, 1, 1, 1, 1, 1,
-0.1598836, -1.017205, -2.30365, 1, 1, 1, 1, 1,
-0.1571177, 0.4963239, 0.1818248, 1, 1, 1, 1, 1,
-0.1530804, 0.5899519, 1.129937, 1, 1, 1, 1, 1,
-0.152702, -1.954305, -4.500062, 1, 1, 1, 1, 1,
-0.150113, 1.41654, 0.3788282, 1, 1, 1, 1, 1,
-0.1498925, -0.1809595, -4.512713, 1, 1, 1, 1, 1,
-0.1492249, -1.663761, -3.553564, 1, 1, 1, 1, 1,
-0.1483553, 0.8013466, -0.2457137, 1, 1, 1, 1, 1,
-0.1474489, -1.084251, -3.302273, 1, 1, 1, 1, 1,
-0.1453297, 0.8984837, -0.7201066, 0, 0, 1, 1, 1,
-0.1446445, 1.374931, 0.6537664, 1, 0, 0, 1, 1,
-0.1428183, -1.225772, -3.146722, 1, 0, 0, 1, 1,
-0.1427641, 1.139108, -1.917492, 1, 0, 0, 1, 1,
-0.1384822, 0.7048663, -1.903291, 1, 0, 0, 1, 1,
-0.1382042, -0.2261327, -2.98326, 1, 0, 0, 1, 1,
-0.136139, -1.350811, -2.388999, 0, 0, 0, 1, 1,
-0.1332514, -0.9494212, -4.096614, 0, 0, 0, 1, 1,
-0.1313709, 0.1157739, -2.6566, 0, 0, 0, 1, 1,
-0.1305112, -1.540567, -1.945555, 0, 0, 0, 1, 1,
-0.1249648, 1.663025, -0.4084173, 0, 0, 0, 1, 1,
-0.1227971, -1.008011, -3.609221, 0, 0, 0, 1, 1,
-0.1193219, -0.3415217, -1.196633, 0, 0, 0, 1, 1,
-0.1192726, 0.09399575, -0.8276379, 1, 1, 1, 1, 1,
-0.1183544, -1.064183, -3.992126, 1, 1, 1, 1, 1,
-0.1169097, -1.16523, -2.98621, 1, 1, 1, 1, 1,
-0.1118441, 0.2051868, -3.191457, 1, 1, 1, 1, 1,
-0.109822, 1.174719, -2.005466, 1, 1, 1, 1, 1,
-0.1073157, -0.4911869, -2.505101, 1, 1, 1, 1, 1,
-0.103199, 1.176842, -0.6821947, 1, 1, 1, 1, 1,
-0.09239002, 0.01455331, -1.675398, 1, 1, 1, 1, 1,
-0.09172743, -0.7228788, -3.045776, 1, 1, 1, 1, 1,
-0.0862554, -0.1437101, -2.664181, 1, 1, 1, 1, 1,
-0.08479884, -0.07781514, -2.298459, 1, 1, 1, 1, 1,
-0.08278634, -0.7075712, -2.404383, 1, 1, 1, 1, 1,
-0.08215293, -1.710071, -2.662618, 1, 1, 1, 1, 1,
-0.08212616, -0.3926679, -3.349182, 1, 1, 1, 1, 1,
-0.08206095, 0.6706133, -0.2457813, 1, 1, 1, 1, 1,
-0.08076709, -1.788518, -3.603364, 0, 0, 1, 1, 1,
-0.07793679, -0.8581704, -3.648632, 1, 0, 0, 1, 1,
-0.07789928, 0.5118651, 0.6343741, 1, 0, 0, 1, 1,
-0.07752816, -0.05218448, -2.362312, 1, 0, 0, 1, 1,
-0.07606229, -0.3964572, -2.031592, 1, 0, 0, 1, 1,
-0.07393713, -0.06185602, -2.436731, 1, 0, 0, 1, 1,
-0.07388216, -3.150724, -2.632478, 0, 0, 0, 1, 1,
-0.07208145, 1.826063, 0.9280941, 0, 0, 0, 1, 1,
-0.07188263, 0.08302315, -1.777785, 0, 0, 0, 1, 1,
-0.0678578, 0.7882704, -0.06187281, 0, 0, 0, 1, 1,
-0.06459599, 0.5143984, 0.3771773, 0, 0, 0, 1, 1,
-0.0518285, -2.33869, -0.8123077, 0, 0, 0, 1, 1,
-0.05064424, 0.667702, -0.5171862, 0, 0, 0, 1, 1,
-0.04725134, 1.045599, -0.604296, 1, 1, 1, 1, 1,
-0.04647958, 0.02402867, -2.322475, 1, 1, 1, 1, 1,
-0.04513123, -0.8962843, -2.381454, 1, 1, 1, 1, 1,
-0.04133197, -0.6690333, -4.222618, 1, 1, 1, 1, 1,
-0.03795568, -0.3706025, -3.318246, 1, 1, 1, 1, 1,
-0.03694952, -0.1167381, -1.273532, 1, 1, 1, 1, 1,
-0.03337187, -0.2357461, -3.501693, 1, 1, 1, 1, 1,
-0.02832313, -0.3100322, -4.980568, 1, 1, 1, 1, 1,
-0.02668591, 0.5565034, 0.6586211, 1, 1, 1, 1, 1,
-0.0266427, 0.3231816, 0.9564205, 1, 1, 1, 1, 1,
-0.0231511, -2.318052, -3.636887, 1, 1, 1, 1, 1,
-0.01929277, -1.016854, -4.207299, 1, 1, 1, 1, 1,
-0.01655209, -1.561023, -2.219673, 1, 1, 1, 1, 1,
-0.01360894, 0.3927991, -0.5367153, 1, 1, 1, 1, 1,
-0.01034994, 0.4376171, 0.8360922, 1, 1, 1, 1, 1,
-0.009994964, -1.712028, -2.240508, 0, 0, 1, 1, 1,
-0.009828222, -0.1878994, -3.177777, 1, 0, 0, 1, 1,
-0.007517915, -0.4492067, -4.383615, 1, 0, 0, 1, 1,
-0.007147675, 0.7476978, 0.1339392, 1, 0, 0, 1, 1,
-0.004574534, -0.02870663, -2.773529, 1, 0, 0, 1, 1,
-0.001471509, -1.551991, -1.519989, 1, 0, 0, 1, 1,
0.001533291, -0.1253957, 2.493174, 0, 0, 0, 1, 1,
0.003947069, 2.966244, 0.356076, 0, 0, 0, 1, 1,
0.003957859, 1.259004, -0.1439928, 0, 0, 0, 1, 1,
0.007774502, -0.1554935, 3.55507, 0, 0, 0, 1, 1,
0.007984173, 0.4035092, 1.027784, 0, 0, 0, 1, 1,
0.008231501, 1.304845, -0.5068167, 0, 0, 0, 1, 1,
0.008367396, -1.494181, 2.937132, 0, 0, 0, 1, 1,
0.00841924, 1.897906, -1.06379, 1, 1, 1, 1, 1,
0.008857629, 2.165308, 0.9099476, 1, 1, 1, 1, 1,
0.01082171, 1.239239, -0.6570576, 1, 1, 1, 1, 1,
0.01086275, -1.25605, 2.488931, 1, 1, 1, 1, 1,
0.01251172, 0.3675275, -1.476977, 1, 1, 1, 1, 1,
0.0218847, 0.9680775, -0.502515, 1, 1, 1, 1, 1,
0.02343132, 1.005818, 1.201005, 1, 1, 1, 1, 1,
0.02578279, 0.480043, 0.09961761, 1, 1, 1, 1, 1,
0.0272543, -0.9493956, 3.023679, 1, 1, 1, 1, 1,
0.0275419, -1.867745, 4.458361, 1, 1, 1, 1, 1,
0.03210092, -0.2987728, 3.32226, 1, 1, 1, 1, 1,
0.03288463, 0.3267594, 0.04140497, 1, 1, 1, 1, 1,
0.03548863, 0.626364, -1.899361, 1, 1, 1, 1, 1,
0.04493387, 0.4312124, -0.2001071, 1, 1, 1, 1, 1,
0.04645693, -0.6585546, 3.616363, 1, 1, 1, 1, 1,
0.04780427, -1.57327, 3.522397, 0, 0, 1, 1, 1,
0.04890023, -2.232292, 3.90413, 1, 0, 0, 1, 1,
0.05296906, -0.4470124, 2.34346, 1, 0, 0, 1, 1,
0.05501363, 0.4125127, 0.5317286, 1, 0, 0, 1, 1,
0.05686098, -0.0007568836, 0.4730162, 1, 0, 0, 1, 1,
0.05763111, -1.43403, 3.438859, 1, 0, 0, 1, 1,
0.06010263, 2.48278, -0.008604239, 0, 0, 0, 1, 1,
0.06397597, -0.779273, 3.618468, 0, 0, 0, 1, 1,
0.06688708, -1.529301, 3.364582, 0, 0, 0, 1, 1,
0.06725641, -1.22537, 3.128881, 0, 0, 0, 1, 1,
0.06896321, 1.144276, -0.1644437, 0, 0, 0, 1, 1,
0.07369158, -1.232479, 3.46902, 0, 0, 0, 1, 1,
0.07553871, 1.522305, 0.89787, 0, 0, 0, 1, 1,
0.07608154, -0.9861743, 2.62033, 1, 1, 1, 1, 1,
0.0772512, -0.8649766, 3.456974, 1, 1, 1, 1, 1,
0.077259, 0.637282, 1.709319, 1, 1, 1, 1, 1,
0.07867062, -1.537971, 2.307738, 1, 1, 1, 1, 1,
0.08444206, 1.150988, -0.3936478, 1, 1, 1, 1, 1,
0.08671016, -0.5882262, 2.095999, 1, 1, 1, 1, 1,
0.08919377, 0.266307, -1.076651, 1, 1, 1, 1, 1,
0.08941182, -0.03000826, 0.4111094, 1, 1, 1, 1, 1,
0.0942388, -0.01974516, 2.098133, 1, 1, 1, 1, 1,
0.0980541, -1.428079, 2.38768, 1, 1, 1, 1, 1,
0.1005361, 0.06487828, 1.211913, 1, 1, 1, 1, 1,
0.1052735, -0.4557863, 4.583124, 1, 1, 1, 1, 1,
0.1055072, 2.136492, -0.4770392, 1, 1, 1, 1, 1,
0.1055396, 0.1987393, 1.582403, 1, 1, 1, 1, 1,
0.1102078, 0.4828454, -0.4822038, 1, 1, 1, 1, 1,
0.1105342, 2.702618, 0.7642026, 0, 0, 1, 1, 1,
0.1155974, 0.08646367, -1.212733, 1, 0, 0, 1, 1,
0.1164126, -0.2506365, 2.068011, 1, 0, 0, 1, 1,
0.1268459, 1.197901, -0.2508551, 1, 0, 0, 1, 1,
0.1333203, -0.8033224, 4.025548, 1, 0, 0, 1, 1,
0.1412732, 0.8342617, 0.2635218, 1, 0, 0, 1, 1,
0.1418674, 0.873215, 0.0296505, 0, 0, 0, 1, 1,
0.1494123, 0.7284997, 0.1533256, 0, 0, 0, 1, 1,
0.151997, -0.07662173, 2.551031, 0, 0, 0, 1, 1,
0.1556088, -0.2045596, 1.698395, 0, 0, 0, 1, 1,
0.1575948, 1.132149, 1.676202, 0, 0, 0, 1, 1,
0.1587506, -0.453848, 2.190698, 0, 0, 0, 1, 1,
0.1597195, -0.2065994, 1.878547, 0, 0, 0, 1, 1,
0.165273, -1.058964, 2.6376, 1, 1, 1, 1, 1,
0.1661588, -0.2219182, 1.523323, 1, 1, 1, 1, 1,
0.1663808, -1.103529, 4.407528, 1, 1, 1, 1, 1,
0.1679925, 3.612278, -1.133218, 1, 1, 1, 1, 1,
0.1690774, -0.6970038, 1.219831, 1, 1, 1, 1, 1,
0.1762769, -0.5314935, 2.379583, 1, 1, 1, 1, 1,
0.1786212, -0.09354689, 3.807607, 1, 1, 1, 1, 1,
0.179188, -0.3021423, 2.028773, 1, 1, 1, 1, 1,
0.1811675, -0.5253057, 1.06754, 1, 1, 1, 1, 1,
0.1825611, -1.243991, 3.74615, 1, 1, 1, 1, 1,
0.1843094, 1.010641, 1.166697, 1, 1, 1, 1, 1,
0.1848535, -0.5422298, 3.708897, 1, 1, 1, 1, 1,
0.1890433, -0.4769952, 4.22649, 1, 1, 1, 1, 1,
0.1912635, 0.2136028, 2.312032, 1, 1, 1, 1, 1,
0.1933516, -0.04062183, 1.404871, 1, 1, 1, 1, 1,
0.1952097, 0.1018416, 0.5833717, 0, 0, 1, 1, 1,
0.1967596, -2.399983, 3.084428, 1, 0, 0, 1, 1,
0.1971032, 1.557333, 2.79423, 1, 0, 0, 1, 1,
0.1988903, -0.7101211, 3.636873, 1, 0, 0, 1, 1,
0.2034635, 1.167448, -0.1514448, 1, 0, 0, 1, 1,
0.2044523, 0.07762758, 0.2499777, 1, 0, 0, 1, 1,
0.2073097, -0.05372354, 0.838684, 0, 0, 0, 1, 1,
0.2084064, -0.5896829, 2.343478, 0, 0, 0, 1, 1,
0.2087447, -1.17946, 3.318108, 0, 0, 0, 1, 1,
0.2118955, -0.628837, 2.677356, 0, 0, 0, 1, 1,
0.2138697, -0.3429423, 1.877606, 0, 0, 0, 1, 1,
0.2139773, -0.9048264, 3.507896, 0, 0, 0, 1, 1,
0.2233438, -1.269709, 1.673927, 0, 0, 0, 1, 1,
0.2233537, 2.247395, 0.3696457, 1, 1, 1, 1, 1,
0.2246559, -1.028144, 3.654079, 1, 1, 1, 1, 1,
0.2291874, 1.966207, -0.7460001, 1, 1, 1, 1, 1,
0.2296924, 0.06004443, 1.953188, 1, 1, 1, 1, 1,
0.2372521, -1.07536, 2.561082, 1, 1, 1, 1, 1,
0.24112, -0.2127845, 2.833451, 1, 1, 1, 1, 1,
0.2412262, 0.0262442, 3.16891, 1, 1, 1, 1, 1,
0.2451344, -0.6888501, 1.962564, 1, 1, 1, 1, 1,
0.2454772, -0.813616, 3.297658, 1, 1, 1, 1, 1,
0.2474322, -0.3212008, 2.455298, 1, 1, 1, 1, 1,
0.2487668, -0.078618, 2.664854, 1, 1, 1, 1, 1,
0.2524772, -0.9199768, 5.411109, 1, 1, 1, 1, 1,
0.2564951, -0.7107037, 1.794378, 1, 1, 1, 1, 1,
0.2574517, 0.9757292, 0.3067325, 1, 1, 1, 1, 1,
0.2582457, 0.5013303, 1.021626, 1, 1, 1, 1, 1,
0.2630158, 0.1702911, 0.9335985, 0, 0, 1, 1, 1,
0.2648878, 1.219901, -0.991914, 1, 0, 0, 1, 1,
0.2707991, 2.010786, 0.468271, 1, 0, 0, 1, 1,
0.2737099, -0.276857, 1.560294, 1, 0, 0, 1, 1,
0.2748464, 0.4355265, -0.9763049, 1, 0, 0, 1, 1,
0.2762731, 0.059713, 2.921785, 1, 0, 0, 1, 1,
0.2765594, -0.3360431, 2.270482, 0, 0, 0, 1, 1,
0.2773152, -0.2882331, 3.83714, 0, 0, 0, 1, 1,
0.2782152, -0.9142524, 3.258691, 0, 0, 0, 1, 1,
0.2817414, -2.027737, 2.189851, 0, 0, 0, 1, 1,
0.2822501, -0.3149366, 2.023341, 0, 0, 0, 1, 1,
0.2848907, -0.3497975, 2.000358, 0, 0, 0, 1, 1,
0.2872528, 0.6571802, -0.7623186, 0, 0, 0, 1, 1,
0.2917474, -0.9788316, 4.619584, 1, 1, 1, 1, 1,
0.2937101, 0.1275031, 0.03645621, 1, 1, 1, 1, 1,
0.2951902, -0.8995761, 3.304274, 1, 1, 1, 1, 1,
0.2982062, 0.002325136, 2.883585, 1, 1, 1, 1, 1,
0.307982, -0.1629191, 3.199731, 1, 1, 1, 1, 1,
0.3104022, -1.431933, 3.552335, 1, 1, 1, 1, 1,
0.3125035, -1.193789, 1.339479, 1, 1, 1, 1, 1,
0.3128569, -1.308045, 4.493644, 1, 1, 1, 1, 1,
0.3180443, -0.9227831, 1.094245, 1, 1, 1, 1, 1,
0.31829, 0.05009227, 2.065126, 1, 1, 1, 1, 1,
0.3190337, -0.7408829, 2.744876, 1, 1, 1, 1, 1,
0.321793, -0.6802655, 3.176935, 1, 1, 1, 1, 1,
0.322168, -0.2854564, 2.787233, 1, 1, 1, 1, 1,
0.3226469, 0.295424, 0.7783501, 1, 1, 1, 1, 1,
0.3276171, 0.03536201, 0.4678003, 1, 1, 1, 1, 1,
0.3303991, -0.2487517, 3.475316, 0, 0, 1, 1, 1,
0.3313468, 0.5348466, 1.553435, 1, 0, 0, 1, 1,
0.3320017, 1.886981, 0.7840874, 1, 0, 0, 1, 1,
0.3354567, 2.201075, 1.394672, 1, 0, 0, 1, 1,
0.3473687, 0.3559497, -0.03319462, 1, 0, 0, 1, 1,
0.3491679, -0.6012906, 1.173139, 1, 0, 0, 1, 1,
0.3492593, -1.448081, 1.389613, 0, 0, 0, 1, 1,
0.3526483, 0.7260959, 1.585535, 0, 0, 0, 1, 1,
0.357269, -0.2366327, 3.402298, 0, 0, 0, 1, 1,
0.3603326, -0.2348447, 0.6268046, 0, 0, 0, 1, 1,
0.3645478, -1.143161, 3.540205, 0, 0, 0, 1, 1,
0.3669835, 1.586226, -1.063828, 0, 0, 0, 1, 1,
0.3695189, -0.8899265, 1.940379, 0, 0, 0, 1, 1,
0.3696381, 2.621018, 0.3718712, 1, 1, 1, 1, 1,
0.3712513, 0.9306253, 0.2001059, 1, 1, 1, 1, 1,
0.3770669, 1.032777, -0.02585345, 1, 1, 1, 1, 1,
0.3807486, -0.1141692, 2.427334, 1, 1, 1, 1, 1,
0.3811201, -0.1369934, 0.8625324, 1, 1, 1, 1, 1,
0.3814305, -0.6307421, 2.634628, 1, 1, 1, 1, 1,
0.3814873, 0.3424815, 0.3664976, 1, 1, 1, 1, 1,
0.3824763, -0.01419485, 2.567548, 1, 1, 1, 1, 1,
0.3961565, -0.1687655, 0.9890093, 1, 1, 1, 1, 1,
0.3987507, -0.1193229, 0.7296271, 1, 1, 1, 1, 1,
0.3995791, 0.8318674, 0.8173449, 1, 1, 1, 1, 1,
0.3996617, 0.002833342, 1.977502, 1, 1, 1, 1, 1,
0.3996906, -0.5051745, 0.8345186, 1, 1, 1, 1, 1,
0.4006172, 0.5991712, 1.156912, 1, 1, 1, 1, 1,
0.4021386, -0.1648433, 0.6313196, 1, 1, 1, 1, 1,
0.4032422, 0.2140982, 0.2769519, 0, 0, 1, 1, 1,
0.4040146, 0.7479823, -0.1448462, 1, 0, 0, 1, 1,
0.4046349, -0.6344943, 3.058901, 1, 0, 0, 1, 1,
0.4067029, -1.61168, 1.677456, 1, 0, 0, 1, 1,
0.407658, 1.485106, 1.684442, 1, 0, 0, 1, 1,
0.4086453, -1.983488, 3.043359, 1, 0, 0, 1, 1,
0.4104947, -0.4582233, 4.087164, 0, 0, 0, 1, 1,
0.4116839, 1.544973, 0.3915348, 0, 0, 0, 1, 1,
0.4180157, -2.297802, 2.257947, 0, 0, 0, 1, 1,
0.4188269, 0.3696047, 2.452219, 0, 0, 0, 1, 1,
0.419881, 0.4247803, 1.74633, 0, 0, 0, 1, 1,
0.4199075, 1.804515, 0.4364429, 0, 0, 0, 1, 1,
0.4223735, -1.786062, 2.958828, 0, 0, 0, 1, 1,
0.4232301, 1.317993, 1.378506, 1, 1, 1, 1, 1,
0.4247332, 0.2313396, 2.985498, 1, 1, 1, 1, 1,
0.4259745, -0.3541799, 0.4764901, 1, 1, 1, 1, 1,
0.427267, 0.4853131, 0.5370144, 1, 1, 1, 1, 1,
0.4312212, 1.065976, 0.3558757, 1, 1, 1, 1, 1,
0.432347, -2.653407, 1.152932, 1, 1, 1, 1, 1,
0.4347712, -0.9489213, 2.433509, 1, 1, 1, 1, 1,
0.4360483, 1.457213, 1.195001, 1, 1, 1, 1, 1,
0.4383021, -0.3608322, 1.125975, 1, 1, 1, 1, 1,
0.4450161, -0.05831048, 1.157291, 1, 1, 1, 1, 1,
0.4496799, 1.45837, 0.3822039, 1, 1, 1, 1, 1,
0.4504381, -2.675992, 3.681499, 1, 1, 1, 1, 1,
0.4517541, -1.469493, 3.137614, 1, 1, 1, 1, 1,
0.4589995, -1.779904, 1.947937, 1, 1, 1, 1, 1,
0.4625167, -0.5159397, 1.322405, 1, 1, 1, 1, 1,
0.462911, -0.4736591, 1.018223, 0, 0, 1, 1, 1,
0.4659943, 0.009882537, 0.5327462, 1, 0, 0, 1, 1,
0.4661117, -1.803713, 4.303561, 1, 0, 0, 1, 1,
0.466646, 0.9365131, 0.8428211, 1, 0, 0, 1, 1,
0.4674791, 1.458432, -0.6557225, 1, 0, 0, 1, 1,
0.4709024, 0.634584, 1.613001, 1, 0, 0, 1, 1,
0.4744483, -0.6388749, 4.257567, 0, 0, 0, 1, 1,
0.4757969, 1.290107, -0.5831559, 0, 0, 0, 1, 1,
0.4776164, 0.4565611, 1.193295, 0, 0, 0, 1, 1,
0.4818588, -0.4221911, 2.263368, 0, 0, 0, 1, 1,
0.4832673, -0.08657929, 1.9668, 0, 0, 0, 1, 1,
0.4833975, 1.384698, 0.7852167, 0, 0, 0, 1, 1,
0.4848441, -1.741151, 0.445598, 0, 0, 0, 1, 1,
0.4919278, 1.637742, 0.6290551, 1, 1, 1, 1, 1,
0.4950444, 0.1718018, 3.271947, 1, 1, 1, 1, 1,
0.4988203, 1.121701, -1.095668, 1, 1, 1, 1, 1,
0.4998899, -1.268625, 3.267396, 1, 1, 1, 1, 1,
0.5009688, 0.5017051, 0.8959146, 1, 1, 1, 1, 1,
0.5034459, -1.12008, 3.599629, 1, 1, 1, 1, 1,
0.5065168, -0.6158293, 3.210762, 1, 1, 1, 1, 1,
0.5066158, 0.1888524, 0.4985174, 1, 1, 1, 1, 1,
0.5079224, 0.1475029, 1.24973, 1, 1, 1, 1, 1,
0.5117882, -1.256167, 4.315018, 1, 1, 1, 1, 1,
0.514501, -1.282701, 3.770503, 1, 1, 1, 1, 1,
0.5150252, 0.3294593, 1.326175, 1, 1, 1, 1, 1,
0.5160886, -0.3045779, 0.2711431, 1, 1, 1, 1, 1,
0.5161972, -0.09880173, 1.064069, 1, 1, 1, 1, 1,
0.5182379, 0.4526269, 0.8089698, 1, 1, 1, 1, 1,
0.5217155, 1.487533, 1.04143, 0, 0, 1, 1, 1,
0.5232089, -0.1091315, 1.857211, 1, 0, 0, 1, 1,
0.5281666, -1.731103, 2.355268, 1, 0, 0, 1, 1,
0.5297948, -0.04794291, 2.810612, 1, 0, 0, 1, 1,
0.5323329, -0.4621389, 3.670946, 1, 0, 0, 1, 1,
0.5350684, -0.05929527, 1.024782, 1, 0, 0, 1, 1,
0.5394122, -0.1774818, 0.1120337, 0, 0, 0, 1, 1,
0.5458034, -1.078362, 3.715425, 0, 0, 0, 1, 1,
0.5478126, -0.5204431, 2.775611, 0, 0, 0, 1, 1,
0.5483578, -0.06832682, 1.423451, 0, 0, 0, 1, 1,
0.550279, 0.7818527, 0.2934779, 0, 0, 0, 1, 1,
0.5508778, 1.254703, 0.1629366, 0, 0, 0, 1, 1,
0.5520173, -1.297846, 2.594636, 0, 0, 0, 1, 1,
0.5526883, -0.2398016, 0.6507186, 1, 1, 1, 1, 1,
0.5546425, 0.8628289, 0.4327718, 1, 1, 1, 1, 1,
0.5607665, -1.759674, 3.001472, 1, 1, 1, 1, 1,
0.5610584, -2.126147, 3.489651, 1, 1, 1, 1, 1,
0.5617368, 0.5014812, 0.4182827, 1, 1, 1, 1, 1,
0.562064, 0.6327475, 0.7624876, 1, 1, 1, 1, 1,
0.5654034, -1.431656, 2.436592, 1, 1, 1, 1, 1,
0.5671477, -1.604137, 1.925835, 1, 1, 1, 1, 1,
0.5740876, -0.8029941, 3.890096, 1, 1, 1, 1, 1,
0.5778674, -2.238209, 2.760628, 1, 1, 1, 1, 1,
0.5791188, 0.7199612, 2.151909, 1, 1, 1, 1, 1,
0.5809776, -0.7856268, 0.3915303, 1, 1, 1, 1, 1,
0.5837414, -0.5834911, 3.056396, 1, 1, 1, 1, 1,
0.5841852, -1.194805, 2.065426, 1, 1, 1, 1, 1,
0.5852133, -1.016344, 2.1951, 1, 1, 1, 1, 1,
0.5932039, -0.5868872, 3.666858, 0, 0, 1, 1, 1,
0.5932291, 0.9822218, 1.242833, 1, 0, 0, 1, 1,
0.5975885, -1.227391, 1.181841, 1, 0, 0, 1, 1,
0.5990242, -0.4123484, 0.9206952, 1, 0, 0, 1, 1,
0.601275, -0.6300188, 3.520606, 1, 0, 0, 1, 1,
0.6070502, -0.5910046, 2.752547, 1, 0, 0, 1, 1,
0.6111062, -0.4940704, 0.8279873, 0, 0, 0, 1, 1,
0.6167518, 0.5608185, 1.179879, 0, 0, 0, 1, 1,
0.6208958, -0.8440174, 3.229024, 0, 0, 0, 1, 1,
0.6237651, 0.2232923, 1.985579, 0, 0, 0, 1, 1,
0.6254188, -0.2759955, 1.333738, 0, 0, 0, 1, 1,
0.6267478, -0.3432173, 2.059273, 0, 0, 0, 1, 1,
0.6269587, -1.462895, 2.504445, 0, 0, 0, 1, 1,
0.6277127, 0.1781067, 1.484219, 1, 1, 1, 1, 1,
0.6277673, -0.5193721, 2.495996, 1, 1, 1, 1, 1,
0.6310316, -0.6828456, 3.203279, 1, 1, 1, 1, 1,
0.6379802, 1.07889, 2.817759, 1, 1, 1, 1, 1,
0.647172, 0.8379335, 0.622927, 1, 1, 1, 1, 1,
0.6473933, 0.5863237, -1.647766, 1, 1, 1, 1, 1,
0.6477728, 0.2376872, 1.909757, 1, 1, 1, 1, 1,
0.6479288, 2.190628, -0.5972092, 1, 1, 1, 1, 1,
0.6480986, 2.028364, 0.5283528, 1, 1, 1, 1, 1,
0.6554983, -0.7465479, 1.632139, 1, 1, 1, 1, 1,
0.6593763, 0.411444, 2.237723, 1, 1, 1, 1, 1,
0.6612448, -0.2826313, 1.357184, 1, 1, 1, 1, 1,
0.6619186, -0.5507854, 2.451078, 1, 1, 1, 1, 1,
0.664011, 1.84937, -0.1900213, 1, 1, 1, 1, 1,
0.6665983, 0.09408881, 1.498506, 1, 1, 1, 1, 1,
0.6675355, 0.1239377, 2.35069, 0, 0, 1, 1, 1,
0.6680136, -0.3301947, 1.541961, 1, 0, 0, 1, 1,
0.6726204, -2.28467, 4.237876, 1, 0, 0, 1, 1,
0.681743, 0.106846, 1.899893, 1, 0, 0, 1, 1,
0.6885132, -2.45155, 2.346039, 1, 0, 0, 1, 1,
0.6886336, -1.254343, 3.088205, 1, 0, 0, 1, 1,
0.696905, 0.133092, 2.322752, 0, 0, 0, 1, 1,
0.6974635, -0.6392311, 2.434911, 0, 0, 0, 1, 1,
0.7049102, -0.1221298, 1.088745, 0, 0, 0, 1, 1,
0.7071167, 0.3547887, 2.457866, 0, 0, 0, 1, 1,
0.7083232, 1.556877, -0.6497075, 0, 0, 0, 1, 1,
0.7107806, 0.9069813, 1.45562, 0, 0, 0, 1, 1,
0.7148737, -0.4555475, 1.318806, 0, 0, 0, 1, 1,
0.7159867, 1.29713, 0.2596305, 1, 1, 1, 1, 1,
0.7185084, -0.3607404, 2.818372, 1, 1, 1, 1, 1,
0.7198499, -0.7167462, 2.776054, 1, 1, 1, 1, 1,
0.7219167, -0.7334549, 1.928984, 1, 1, 1, 1, 1,
0.723067, 0.3587747, 0.9234383, 1, 1, 1, 1, 1,
0.7244022, 0.8116424, 1.199458, 1, 1, 1, 1, 1,
0.7284817, -0.3835833, 0.9032279, 1, 1, 1, 1, 1,
0.7380224, 0.810231, -0.9993595, 1, 1, 1, 1, 1,
0.7417809, 2.55987, -0.4914673, 1, 1, 1, 1, 1,
0.7455333, -0.5564998, 0.5434442, 1, 1, 1, 1, 1,
0.7509415, 0.8469175, 0.3797262, 1, 1, 1, 1, 1,
0.7528036, -1.692524, 1.843235, 1, 1, 1, 1, 1,
0.7562549, -1.910411, 2.945035, 1, 1, 1, 1, 1,
0.7591169, 0.3926478, 1.569514, 1, 1, 1, 1, 1,
0.7605813, 0.4079352, 1.175903, 1, 1, 1, 1, 1,
0.7639696, -0.3877905, 1.721227, 0, 0, 1, 1, 1,
0.7736172, -1.644162, 1.204684, 1, 0, 0, 1, 1,
0.7768742, -0.9096195, 2.72599, 1, 0, 0, 1, 1,
0.7857816, -0.5300597, 1.236207, 1, 0, 0, 1, 1,
0.7890753, 0.530976, 1.608413, 1, 0, 0, 1, 1,
0.7951515, 0.9128441, 0.268568, 1, 0, 0, 1, 1,
0.7995456, 0.7904187, 0.719909, 0, 0, 0, 1, 1,
0.7996535, -1.024118, 2.261134, 0, 0, 0, 1, 1,
0.810918, -1.675531, 0.9725837, 0, 0, 0, 1, 1,
0.8124221, 0.1450506, -0.006613896, 0, 0, 0, 1, 1,
0.8138824, -0.5185094, 1.817389, 0, 0, 0, 1, 1,
0.8185915, -0.05995721, 2.049117, 0, 0, 0, 1, 1,
0.8188655, 0.1997139, 0.1513334, 0, 0, 0, 1, 1,
0.820385, 0.807718, 0.2660104, 1, 1, 1, 1, 1,
0.8307156, 0.004820927, 2.811243, 1, 1, 1, 1, 1,
0.8318269, -1.575613, 3.26879, 1, 1, 1, 1, 1,
0.8319165, 0.5225848, -0.5887059, 1, 1, 1, 1, 1,
0.8326862, 0.722731, -1.72704, 1, 1, 1, 1, 1,
0.8397787, 0.9565254, -1.439596, 1, 1, 1, 1, 1,
0.8520874, -0.2833316, 2.60011, 1, 1, 1, 1, 1,
0.8559411, -0.03504413, 1.106532, 1, 1, 1, 1, 1,
0.8575496, 0.836796, -0.3706444, 1, 1, 1, 1, 1,
0.8616279, -0.8846634, -0.4884919, 1, 1, 1, 1, 1,
0.863048, 0.3480622, 0.1212293, 1, 1, 1, 1, 1,
0.863798, -0.1839609, 2.971762, 1, 1, 1, 1, 1,
0.8689411, -1.678158, 1.424035, 1, 1, 1, 1, 1,
0.8744615, -0.2055442, 1.14841, 1, 1, 1, 1, 1,
0.8754724, -0.2278998, 2.132667, 1, 1, 1, 1, 1,
0.8756162, 2.044625, 0.002363934, 0, 0, 1, 1, 1,
0.8758504, -0.3477157, 2.850171, 1, 0, 0, 1, 1,
0.8797588, -0.4835042, 1.15132, 1, 0, 0, 1, 1,
0.8872829, 0.09758843, 0.4900092, 1, 0, 0, 1, 1,
0.8881703, -2.351055, 1.678105, 1, 0, 0, 1, 1,
0.8883615, -1.320554, 2.402583, 1, 0, 0, 1, 1,
0.8922645, 0.1891873, 3.112595, 0, 0, 0, 1, 1,
0.8943684, 1.154944, 1.078307, 0, 0, 0, 1, 1,
0.8969203, 1.375769, 1.769082, 0, 0, 0, 1, 1,
0.8992174, -1.697419, 2.67452, 0, 0, 0, 1, 1,
0.9034354, -1.517998, 1.317285, 0, 0, 0, 1, 1,
0.9042445, 1.400113, 1.412601, 0, 0, 0, 1, 1,
0.9112334, -1.927191, 1.899124, 0, 0, 0, 1, 1,
0.9140758, 0.6926618, -1.355845, 1, 1, 1, 1, 1,
0.9181958, 0.3354314, 1.689558, 1, 1, 1, 1, 1,
0.9203725, -0.1929227, 2.584013, 1, 1, 1, 1, 1,
0.9226648, -0.1347975, 1.705881, 1, 1, 1, 1, 1,
0.9259645, 0.6468003, 1.282894, 1, 1, 1, 1, 1,
0.9300303, -0.5636469, 2.811396, 1, 1, 1, 1, 1,
0.9313778, 2.720172, 0.9076375, 1, 1, 1, 1, 1,
0.9533039, 0.4782208, 0.8507462, 1, 1, 1, 1, 1,
0.9559431, 1.529991, 1.304924, 1, 1, 1, 1, 1,
0.9572469, 1.024799, -0.2693965, 1, 1, 1, 1, 1,
0.9590617, 0.2612506, -0.8795615, 1, 1, 1, 1, 1,
0.9595881, 0.6931645, 0.7954433, 1, 1, 1, 1, 1,
0.9701543, 0.8903002, -0.3210921, 1, 1, 1, 1, 1,
0.9774504, -0.06082495, 2.169317, 1, 1, 1, 1, 1,
0.979609, -0.5249962, 1.102198, 1, 1, 1, 1, 1,
0.9858606, 2.419974, -0.08475158, 0, 0, 1, 1, 1,
0.9920313, -0.4804038, 0.6334822, 1, 0, 0, 1, 1,
0.9947389, -0.8997151, 2.830914, 1, 0, 0, 1, 1,
0.9951403, 0.2804385, -0.1155175, 1, 0, 0, 1, 1,
0.9982949, 0.882796, 1.759801, 1, 0, 0, 1, 1,
0.9985487, -1.104656, 2.007655, 1, 0, 0, 1, 1,
0.9996771, -3.351024, 4.511385, 0, 0, 0, 1, 1,
1.003119, 0.1576454, 2.301452, 0, 0, 0, 1, 1,
1.005938, -0.4953147, 3.201974, 0, 0, 0, 1, 1,
1.015398, -0.7137098, 1.102402, 0, 0, 0, 1, 1,
1.017746, -0.09807349, 2.128139, 0, 0, 0, 1, 1,
1.022117, 0.2054293, 2.799585, 0, 0, 0, 1, 1,
1.030742, 0.2754944, 0.3303494, 0, 0, 0, 1, 1,
1.036474, 1.576429, -0.5771215, 1, 1, 1, 1, 1,
1.049117, -0.197071, 1.736561, 1, 1, 1, 1, 1,
1.049909, 0.01546465, -0.01254218, 1, 1, 1, 1, 1,
1.055937, 0.3365575, 2.106986, 1, 1, 1, 1, 1,
1.057007, -0.5188619, 2.172774, 1, 1, 1, 1, 1,
1.057718, -0.5672945, 0.9721617, 1, 1, 1, 1, 1,
1.061146, 1.780758, 1.91882, 1, 1, 1, 1, 1,
1.063348, -0.7617997, 3.531521, 1, 1, 1, 1, 1,
1.066672, -2.152701, 2.63574, 1, 1, 1, 1, 1,
1.079074, 0.2039101, 1.630203, 1, 1, 1, 1, 1,
1.092812, 0.1534435, 1.355935, 1, 1, 1, 1, 1,
1.107986, -0.1228548, 0.2864755, 1, 1, 1, 1, 1,
1.113571, 1.493459, -0.2216087, 1, 1, 1, 1, 1,
1.11377, 1.797626, 2.530788, 1, 1, 1, 1, 1,
1.123432, 1.715337, -0.857356, 1, 1, 1, 1, 1,
1.124966, 0.1738438, 1.292225, 0, 0, 1, 1, 1,
1.127499, 1.385485, 1.472737, 1, 0, 0, 1, 1,
1.162376, -0.3461895, 1.526648, 1, 0, 0, 1, 1,
1.166871, -0.5401666, 2.920297, 1, 0, 0, 1, 1,
1.177614, 0.502778, 0.331141, 1, 0, 0, 1, 1,
1.181263, -1.451854, 3.258867, 1, 0, 0, 1, 1,
1.189934, -1.961262, 1.569598, 0, 0, 0, 1, 1,
1.19126, -0.4953031, 2.04276, 0, 0, 0, 1, 1,
1.192133, 0.3961705, 2.556437, 0, 0, 0, 1, 1,
1.192915, 1.659622, -1.025309, 0, 0, 0, 1, 1,
1.196691, -0.7428038, 0.8539563, 0, 0, 0, 1, 1,
1.217361, 1.323934, -0.4070871, 0, 0, 0, 1, 1,
1.217743, 1.372001, -0.2207344, 0, 0, 0, 1, 1,
1.223329, 0.7177369, 1.959304, 1, 1, 1, 1, 1,
1.246073, -0.1848116, 1.821905, 1, 1, 1, 1, 1,
1.251826, -1.489227, 3.349274, 1, 1, 1, 1, 1,
1.26437, 1.925137, 0.9725372, 1, 1, 1, 1, 1,
1.267159, 1.555406, -0.05093009, 1, 1, 1, 1, 1,
1.267842, -0.05027186, 1.248588, 1, 1, 1, 1, 1,
1.278602, -1.650431, 3.360248, 1, 1, 1, 1, 1,
1.281737, 0.1453194, 1.240537, 1, 1, 1, 1, 1,
1.282906, -1.607374, 2.931669, 1, 1, 1, 1, 1,
1.287371, 0.2343827, 2.578717, 1, 1, 1, 1, 1,
1.289525, -1.186607, 2.55101, 1, 1, 1, 1, 1,
1.294912, 0.7904333, 0.8970014, 1, 1, 1, 1, 1,
1.307723, -0.3403008, 1.183913, 1, 1, 1, 1, 1,
1.319859, -1.407035, 3.228594, 1, 1, 1, 1, 1,
1.333112, 1.00625, 0.9932079, 1, 1, 1, 1, 1,
1.348986, -0.3642271, 1.43655, 0, 0, 1, 1, 1,
1.350184, 0.6374225, 0.4522811, 1, 0, 0, 1, 1,
1.355015, 2.048477, 2.139038, 1, 0, 0, 1, 1,
1.357645, -1.121987, 2.86833, 1, 0, 0, 1, 1,
1.376399, -0.7440424, 1.95341, 1, 0, 0, 1, 1,
1.3885, -0.4684076, 1.892581, 1, 0, 0, 1, 1,
1.39464, 1.179191, 0.8393358, 0, 0, 0, 1, 1,
1.401981, 1.521861, 1.322175, 0, 0, 0, 1, 1,
1.450214, -0.559849, 4.483144, 0, 0, 0, 1, 1,
1.471844, 1.131519, -0.2196871, 0, 0, 0, 1, 1,
1.473826, -0.3697714, 2.141716, 0, 0, 0, 1, 1,
1.478591, -0.5763547, 2.823596, 0, 0, 0, 1, 1,
1.490376, -0.3623331, 2.181972, 0, 0, 0, 1, 1,
1.517834, -0.137738, 3.738305, 1, 1, 1, 1, 1,
1.51833, -0.4756653, 2.378037, 1, 1, 1, 1, 1,
1.519376, 0.4980154, -0.3850726, 1, 1, 1, 1, 1,
1.52433, 0.6486564, 1.400148, 1, 1, 1, 1, 1,
1.536771, -2.043734, 3.116059, 1, 1, 1, 1, 1,
1.542855, 0.4240025, 1.734008, 1, 1, 1, 1, 1,
1.544354, -1.297929, 3.273475, 1, 1, 1, 1, 1,
1.548353, 0.3432883, 2.606322, 1, 1, 1, 1, 1,
1.558869, 0.5179904, 0.3232979, 1, 1, 1, 1, 1,
1.584379, 1.06846, 0.7938681, 1, 1, 1, 1, 1,
1.594205, -0.09453167, 2.910559, 1, 1, 1, 1, 1,
1.597862, 0.2483916, 1.239228, 1, 1, 1, 1, 1,
1.617183, -0.2475927, 3.123325, 1, 1, 1, 1, 1,
1.61866, 1.179854, 2.449907, 1, 1, 1, 1, 1,
1.62346, -1.750138, 2.138643, 1, 1, 1, 1, 1,
1.632068, 0.5203192, 1.338251, 0, 0, 1, 1, 1,
1.647717, -1.503488, 2.107417, 1, 0, 0, 1, 1,
1.653023, -1.085217, 0.7560725, 1, 0, 0, 1, 1,
1.654527, -1.687264, 1.735133, 1, 0, 0, 1, 1,
1.679715, -0.03723898, -0.3472406, 1, 0, 0, 1, 1,
1.691598, -0.04117312, -1.173396, 1, 0, 0, 1, 1,
1.693201, 0.8388972, 1.631181, 0, 0, 0, 1, 1,
1.699097, 2.468925, 1.498058, 0, 0, 0, 1, 1,
1.724025, -0.982346, 0.7480402, 0, 0, 0, 1, 1,
1.737975, 1.418309, 0.8752338, 0, 0, 0, 1, 1,
1.7385, 1.059322, 1.171402, 0, 0, 0, 1, 1,
1.738507, 0.7857619, 1.958327, 0, 0, 0, 1, 1,
1.742235, 0.3488695, 0.5997733, 0, 0, 0, 1, 1,
1.74572, 0.492207, 0.9266685, 1, 1, 1, 1, 1,
1.746171, -1.175785, 2.960039, 1, 1, 1, 1, 1,
1.764726, -0.8270332, 2.611277, 1, 1, 1, 1, 1,
1.791823, 0.9850243, 0.8924033, 1, 1, 1, 1, 1,
1.80191, -1.775933, 2.895056, 1, 1, 1, 1, 1,
1.84316, -1.203626, 2.991107, 1, 1, 1, 1, 1,
1.860871, -0.5144235, 2.397156, 1, 1, 1, 1, 1,
1.873587, -1.727989, 2.83845, 1, 1, 1, 1, 1,
1.894325, -0.5012286, 2.602208, 1, 1, 1, 1, 1,
1.91526, 0.1534473, 1.654332, 1, 1, 1, 1, 1,
1.917135, 0.727595, -0.142123, 1, 1, 1, 1, 1,
1.941973, 3.030398, 1.300096, 1, 1, 1, 1, 1,
1.944601, 1.805452, 0.433644, 1, 1, 1, 1, 1,
1.980654, -0.789301, 2.0567, 1, 1, 1, 1, 1,
1.982479, 0.9781258, 1.563712, 1, 1, 1, 1, 1,
1.984431, 0.4060408, 0.6434841, 0, 0, 1, 1, 1,
2.022355, 0.06914357, 1.260709, 1, 0, 0, 1, 1,
2.045916, -0.6264415, 1.338663, 1, 0, 0, 1, 1,
2.075114, 1.233156, -0.2162714, 1, 0, 0, 1, 1,
2.090981, -1.270035, 2.498741, 1, 0, 0, 1, 1,
2.132772, -0.3333512, 1.906023, 1, 0, 0, 1, 1,
2.148924, -1.561652, 2.564, 0, 0, 0, 1, 1,
2.190125, -0.8446798, 2.193735, 0, 0, 0, 1, 1,
2.195207, -1.112303, 2.413224, 0, 0, 0, 1, 1,
2.206058, 0.4947753, 0.1031896, 0, 0, 0, 1, 1,
2.233716, 1.02932, 2.468558, 0, 0, 0, 1, 1,
2.240139, 0.8182219, -0.2152801, 0, 0, 0, 1, 1,
2.25951, 0.04883992, 1.592944, 0, 0, 0, 1, 1,
2.321504, -0.506228, 0.6010143, 1, 1, 1, 1, 1,
2.371956, 0.7035839, 2.691878, 1, 1, 1, 1, 1,
2.403686, 1.623014, 4.072659, 1, 1, 1, 1, 1,
2.43255, -0.5737268, 0.6309499, 1, 1, 1, 1, 1,
2.650249, -1.124093, 2.334412, 1, 1, 1, 1, 1,
3.044124, -0.05077032, 1.844408, 1, 1, 1, 1, 1,
4.382749, 0.08320703, 1.539533, 1, 1, 1, 1, 1
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
var radius = 10.34686;
var distance = 36.34289;
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
mvMatrix.translate( -0.5237796, 0.04475403, 0.1600149 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.34289);
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
