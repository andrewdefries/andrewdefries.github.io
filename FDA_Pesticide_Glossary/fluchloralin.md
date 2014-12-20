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
-3.632399, 0.1457427, -2.218721, 1, 0, 0, 1,
-3.037259, -0.9842871, -1.541548, 1, 0.007843138, 0, 1,
-2.83934, -0.07223316, -3.030916, 1, 0.01176471, 0, 1,
-2.616244, -0.7122155, -2.828208, 1, 0.01960784, 0, 1,
-2.582672, -1.11921, -1.805521, 1, 0.02352941, 0, 1,
-2.532374, 0.5537595, -1.797736, 1, 0.03137255, 0, 1,
-2.457293, 0.5133515, -3.015498, 1, 0.03529412, 0, 1,
-2.454872, -0.2357859, -0.7517807, 1, 0.04313726, 0, 1,
-2.420859, -0.1611503, -0.6139488, 1, 0.04705882, 0, 1,
-2.368334, -0.9768782, -1.217193, 1, 0.05490196, 0, 1,
-2.315745, -1.0922, -1.954011, 1, 0.05882353, 0, 1,
-2.310984, 1.469919, 0.7684894, 1, 0.06666667, 0, 1,
-2.285283, -0.5417446, -2.927609, 1, 0.07058824, 0, 1,
-2.240579, -0.5286103, -1.405155, 1, 0.07843138, 0, 1,
-2.227551, -0.184525, -2.143657, 1, 0.08235294, 0, 1,
-2.224859, -2.05951, -0.8235726, 1, 0.09019608, 0, 1,
-2.1441, -0.463452, 0.5563594, 1, 0.09411765, 0, 1,
-2.13919, -0.2292755, -2.690926, 1, 0.1019608, 0, 1,
-2.127049, -1.365137, -1.895191, 1, 0.1098039, 0, 1,
-2.118951, 1.44299, 0.7039974, 1, 0.1137255, 0, 1,
-2.101149, -0.2073969, -2.499636, 1, 0.1215686, 0, 1,
-2.091117, -1.334293, -1.961969, 1, 0.1254902, 0, 1,
-2.056641, 0.6553729, -1.040165, 1, 0.1333333, 0, 1,
-2.050694, -0.1220138, -0.3189098, 1, 0.1372549, 0, 1,
-2.043556, 0.1242654, -2.311045, 1, 0.145098, 0, 1,
-2.041083, -0.2776034, -0.8894472, 1, 0.1490196, 0, 1,
-2.0376, -0.7927441, -3.462131, 1, 0.1568628, 0, 1,
-1.994845, -0.5519591, -0.6619374, 1, 0.1607843, 0, 1,
-1.977215, -0.3878034, -3.414074, 1, 0.1686275, 0, 1,
-1.943256, 0.03097509, -2.875574, 1, 0.172549, 0, 1,
-1.916855, 0.02566186, 0.2277911, 1, 0.1803922, 0, 1,
-1.877668, 0.6629593, 1.198169, 1, 0.1843137, 0, 1,
-1.868117, 0.09354398, -0.3428038, 1, 0.1921569, 0, 1,
-1.866298, -1.165534, -1.01844, 1, 0.1960784, 0, 1,
-1.860795, 0.379061, -0.8944159, 1, 0.2039216, 0, 1,
-1.851703, -0.7084002, -3.692735, 1, 0.2117647, 0, 1,
-1.839969, -0.4149354, -1.536795, 1, 0.2156863, 0, 1,
-1.837296, -1.007026, -0.1638391, 1, 0.2235294, 0, 1,
-1.832767, 1.227449, -1.22274, 1, 0.227451, 0, 1,
-1.819509, 1.094025, 0.5892229, 1, 0.2352941, 0, 1,
-1.811605, -0.3859311, -1.380736, 1, 0.2392157, 0, 1,
-1.810271, 0.02779366, -0.1214158, 1, 0.2470588, 0, 1,
-1.80862, 0.8400046, 0.6855704, 1, 0.2509804, 0, 1,
-1.802574, 0.1362412, -1.446294, 1, 0.2588235, 0, 1,
-1.788826, -0.9558372, -4.34779, 1, 0.2627451, 0, 1,
-1.786382, 1.502065, -4.910054, 1, 0.2705882, 0, 1,
-1.782864, -1.839533, -2.056285, 1, 0.2745098, 0, 1,
-1.780289, 1.931677, 0.50881, 1, 0.282353, 0, 1,
-1.767139, -1.894767, -2.136294, 1, 0.2862745, 0, 1,
-1.766907, -0.300523, -1.54472, 1, 0.2941177, 0, 1,
-1.761163, 2.335034, -1.695134, 1, 0.3019608, 0, 1,
-1.75587, -1.095141, -4.368412, 1, 0.3058824, 0, 1,
-1.751942, -0.209872, -1.757446, 1, 0.3137255, 0, 1,
-1.743036, -0.1879169, -1.199508, 1, 0.3176471, 0, 1,
-1.73138, 1.285071, -2.350638, 1, 0.3254902, 0, 1,
-1.710293, 1.63694, -1.897406, 1, 0.3294118, 0, 1,
-1.700593, 1.227564, -2.202238, 1, 0.3372549, 0, 1,
-1.696865, 1.260472, -1.444525, 1, 0.3411765, 0, 1,
-1.67341, -0.6673227, -2.280997, 1, 0.3490196, 0, 1,
-1.670906, 0.5886974, -0.590323, 1, 0.3529412, 0, 1,
-1.65878, -0.4502178, -0.5715883, 1, 0.3607843, 0, 1,
-1.654809, 0.6928322, -2.22592, 1, 0.3647059, 0, 1,
-1.646217, 0.1833777, -2.053159, 1, 0.372549, 0, 1,
-1.642515, 0.287295, -1.341952, 1, 0.3764706, 0, 1,
-1.637457, 1.298452, -1.901671, 1, 0.3843137, 0, 1,
-1.637058, -1.269097, -3.713302, 1, 0.3882353, 0, 1,
-1.633122, -1.845758, -4.697497, 1, 0.3960784, 0, 1,
-1.595239, 1.76323, 0.2385273, 1, 0.4039216, 0, 1,
-1.589822, 0.4563264, -0.7977291, 1, 0.4078431, 0, 1,
-1.588515, 1.354854, -0.2249691, 1, 0.4156863, 0, 1,
-1.585322, 0.7427041, -2.739838, 1, 0.4196078, 0, 1,
-1.579747, 0.7003977, -0.7940059, 1, 0.427451, 0, 1,
-1.578952, 1.350992, 0.08161378, 1, 0.4313726, 0, 1,
-1.572463, -0.4557317, -2.530668, 1, 0.4392157, 0, 1,
-1.563694, 1.092485, 0.9685947, 1, 0.4431373, 0, 1,
-1.533525, -0.0120145, -1.509396, 1, 0.4509804, 0, 1,
-1.529437, 0.8445512, -0.4933159, 1, 0.454902, 0, 1,
-1.528325, 1.422262, -1.198074, 1, 0.4627451, 0, 1,
-1.514855, -0.1831607, -2.324764, 1, 0.4666667, 0, 1,
-1.500552, 0.05322732, -0.3435643, 1, 0.4745098, 0, 1,
-1.498986, 0.338308, -1.84873, 1, 0.4784314, 0, 1,
-1.495237, -0.5925708, -2.131673, 1, 0.4862745, 0, 1,
-1.478575, -0.426543, -2.367371, 1, 0.4901961, 0, 1,
-1.476521, 0.2212154, -1.330014, 1, 0.4980392, 0, 1,
-1.470199, 0.7893894, -0.3726854, 1, 0.5058824, 0, 1,
-1.462412, -2.336734, -0.981621, 1, 0.509804, 0, 1,
-1.459893, -0.4183613, -1.141033, 1, 0.5176471, 0, 1,
-1.453256, -1.570239, -2.340205, 1, 0.5215687, 0, 1,
-1.440636, -0.2461262, -1.440294, 1, 0.5294118, 0, 1,
-1.43651, 0.8420671, 0.03284572, 1, 0.5333334, 0, 1,
-1.433283, -1.340219, -1.685894, 1, 0.5411765, 0, 1,
-1.426011, 0.7535196, -0.6453635, 1, 0.5450981, 0, 1,
-1.417436, 0.1230304, -0.3786048, 1, 0.5529412, 0, 1,
-1.41568, 1.145755, -0.005558362, 1, 0.5568628, 0, 1,
-1.404876, 0.4138194, 0.183046, 1, 0.5647059, 0, 1,
-1.389299, 0.9590904, -0.427775, 1, 0.5686275, 0, 1,
-1.386456, 1.484765, 0.08437762, 1, 0.5764706, 0, 1,
-1.375858, -0.7028216, -0.3136368, 1, 0.5803922, 0, 1,
-1.368901, -1.623101, -3.929119, 1, 0.5882353, 0, 1,
-1.345225, -1.792683, -2.007793, 1, 0.5921569, 0, 1,
-1.345151, -0.01081091, -2.103377, 1, 0.6, 0, 1,
-1.334707, 0.3061765, -2.014918, 1, 0.6078432, 0, 1,
-1.326448, 1.26733, -0.847411, 1, 0.6117647, 0, 1,
-1.324467, -0.06324842, -0.5774326, 1, 0.6196079, 0, 1,
-1.319725, 0.9009099, -2.472831, 1, 0.6235294, 0, 1,
-1.316342, -0.01191358, -1.934181, 1, 0.6313726, 0, 1,
-1.312737, 0.554747, -0.07024805, 1, 0.6352941, 0, 1,
-1.30387, 1.204206, -0.2027578, 1, 0.6431373, 0, 1,
-1.302711, -0.0745626, -1.258464, 1, 0.6470588, 0, 1,
-1.299839, 1.189513, -1.004438, 1, 0.654902, 0, 1,
-1.296314, -0.2173119, -1.87669, 1, 0.6588235, 0, 1,
-1.293773, -0.7052216, -3.131274, 1, 0.6666667, 0, 1,
-1.285761, -1.713147, -2.107209, 1, 0.6705883, 0, 1,
-1.280378, -2.63394, -2.350709, 1, 0.6784314, 0, 1,
-1.273116, -0.1493445, -1.653408, 1, 0.682353, 0, 1,
-1.269848, 0.89925, -1.255761, 1, 0.6901961, 0, 1,
-1.259481, 1.198976, 0.9643995, 1, 0.6941177, 0, 1,
-1.255949, 0.1306963, -0.9425475, 1, 0.7019608, 0, 1,
-1.237908, -0.3187781, -0.6801194, 1, 0.7098039, 0, 1,
-1.236042, -0.1869758, -1.226405, 1, 0.7137255, 0, 1,
-1.220244, -0.2061994, -2.540784, 1, 0.7215686, 0, 1,
-1.218299, -1.25862, -2.620415, 1, 0.7254902, 0, 1,
-1.211274, 0.04616056, -2.116579, 1, 0.7333333, 0, 1,
-1.207191, 0.9298043, -2.089714, 1, 0.7372549, 0, 1,
-1.201025, -0.009598117, -1.926322, 1, 0.7450981, 0, 1,
-1.198002, -1.60972, -2.863375, 1, 0.7490196, 0, 1,
-1.194319, 1.37651, 0.292963, 1, 0.7568628, 0, 1,
-1.19353, 0.8847752, -0.3565866, 1, 0.7607843, 0, 1,
-1.18027, 0.509134, -1.56837, 1, 0.7686275, 0, 1,
-1.173099, 1.106324, -2.083339, 1, 0.772549, 0, 1,
-1.172438, -0.1616489, -2.002255, 1, 0.7803922, 0, 1,
-1.171474, -0.2455898, -3.881167, 1, 0.7843137, 0, 1,
-1.166467, 0.1446566, -2.948219, 1, 0.7921569, 0, 1,
-1.159242, 1.747726, -2.188142, 1, 0.7960784, 0, 1,
-1.155042, 2.369262, -0.5005973, 1, 0.8039216, 0, 1,
-1.15307, -1.183304, -1.875016, 1, 0.8117647, 0, 1,
-1.146157, 1.715584, -1.985826, 1, 0.8156863, 0, 1,
-1.136239, 0.4164999, -2.594282, 1, 0.8235294, 0, 1,
-1.131795, 1.087546, -0.6595545, 1, 0.827451, 0, 1,
-1.122377, 0.03233928, -1.050964, 1, 0.8352941, 0, 1,
-1.116784, -0.5020241, -2.850125, 1, 0.8392157, 0, 1,
-1.112469, 0.2560925, -0.3758721, 1, 0.8470588, 0, 1,
-1.102922, 0.9451674, -1.10011, 1, 0.8509804, 0, 1,
-1.094219, 0.05558228, -1.516867, 1, 0.8588235, 0, 1,
-1.093947, -0.8164978, -3.079768, 1, 0.8627451, 0, 1,
-1.09338, 0.1577913, -1.198743, 1, 0.8705882, 0, 1,
-1.092052, 0.1167839, -2.054086, 1, 0.8745098, 0, 1,
-1.081558, -0.3079329, -1.808073, 1, 0.8823529, 0, 1,
-1.079694, 1.850625, -1.059619, 1, 0.8862745, 0, 1,
-1.078624, -0.1972222, -3.50021, 1, 0.8941177, 0, 1,
-1.078285, 0.4182619, -0.8012078, 1, 0.8980392, 0, 1,
-1.075971, 0.3372828, -1.416795, 1, 0.9058824, 0, 1,
-1.071937, -0.8955056, -4.08, 1, 0.9137255, 0, 1,
-1.067349, -1.360434, -2.330663, 1, 0.9176471, 0, 1,
-1.065183, 1.28983, -0.3549399, 1, 0.9254902, 0, 1,
-1.05748, 0.03939016, 0.4281557, 1, 0.9294118, 0, 1,
-1.048109, 1.202669, 0.8031594, 1, 0.9372549, 0, 1,
-1.040249, 0.6284631, -1.011105, 1, 0.9411765, 0, 1,
-1.029907, 0.4911186, -1.294322, 1, 0.9490196, 0, 1,
-1.027236, -0.6266068, -2.247637, 1, 0.9529412, 0, 1,
-1.025996, -0.431035, -1.420608, 1, 0.9607843, 0, 1,
-1.021598, 1.685899, -0.008818616, 1, 0.9647059, 0, 1,
-1.01877, -0.0141721, -1.285279, 1, 0.972549, 0, 1,
-1.017146, 0.1336536, -1.318467, 1, 0.9764706, 0, 1,
-1.01241, -0.9040527, -2.315723, 1, 0.9843137, 0, 1,
-1.001063, -0.7917235, -1.937235, 1, 0.9882353, 0, 1,
-1.00052, 0.9698966, -3.689149, 1, 0.9960784, 0, 1,
-1.000041, 0.849834, -0.03119645, 0.9960784, 1, 0, 1,
-0.9944409, 0.6611073, -0.6315705, 0.9921569, 1, 0, 1,
-0.9896721, -0.2902412, -1.279529, 0.9843137, 1, 0, 1,
-0.9847586, 1.252148, -1.277396, 0.9803922, 1, 0, 1,
-0.9785095, 0.07256614, -2.961685, 0.972549, 1, 0, 1,
-0.9682803, -1.954697, -3.681694, 0.9686275, 1, 0, 1,
-0.9657496, 1.413435, -1.707325, 0.9607843, 1, 0, 1,
-0.9647533, 0.4113439, 0.03981025, 0.9568627, 1, 0, 1,
-0.9610928, -0.5567343, -2.312788, 0.9490196, 1, 0, 1,
-0.9507079, -0.631815, -2.988584, 0.945098, 1, 0, 1,
-0.9488366, -0.666632, -1.85124, 0.9372549, 1, 0, 1,
-0.9482827, -1.310449, -3.520374, 0.9333333, 1, 0, 1,
-0.9473678, 1.610428, -0.9848366, 0.9254902, 1, 0, 1,
-0.9421252, 0.6057239, -1.528337, 0.9215686, 1, 0, 1,
-0.9215838, -0.4408904, -0.8737221, 0.9137255, 1, 0, 1,
-0.905835, -1.319737, -3.886356, 0.9098039, 1, 0, 1,
-0.9020818, 0.7683538, -2.154187, 0.9019608, 1, 0, 1,
-0.9007653, -1.177508, -2.411135, 0.8941177, 1, 0, 1,
-0.9006683, -0.8644489, -1.991142, 0.8901961, 1, 0, 1,
-0.8981315, -2.131109, -1.537394, 0.8823529, 1, 0, 1,
-0.8973701, -0.943671, -2.836952, 0.8784314, 1, 0, 1,
-0.8949445, 1.144174, -0.9146795, 0.8705882, 1, 0, 1,
-0.8940034, 0.711066, -1.003468, 0.8666667, 1, 0, 1,
-0.8931326, -0.8402307, -2.956516, 0.8588235, 1, 0, 1,
-0.8928261, -0.4092869, -0.5880672, 0.854902, 1, 0, 1,
-0.8885338, 2.60357, -1.077718, 0.8470588, 1, 0, 1,
-0.8872806, 0.001573205, -2.318416, 0.8431373, 1, 0, 1,
-0.8832937, 0.6923026, -0.8302771, 0.8352941, 1, 0, 1,
-0.8750505, 1.452927, -0.6503713, 0.8313726, 1, 0, 1,
-0.8702992, 1.599483, -0.2572376, 0.8235294, 1, 0, 1,
-0.8684488, -0.3365783, -3.763136, 0.8196079, 1, 0, 1,
-0.867991, -0.4084136, -2.512467, 0.8117647, 1, 0, 1,
-0.8610643, 0.270604, -0.6369615, 0.8078431, 1, 0, 1,
-0.857921, 0.4806874, -0.7074041, 0.8, 1, 0, 1,
-0.8529816, 1.297032, 0.6351452, 0.7921569, 1, 0, 1,
-0.8470091, -0.6132694, -2.287844, 0.7882353, 1, 0, 1,
-0.8373169, -0.7416796, -2.108156, 0.7803922, 1, 0, 1,
-0.8281979, 0.5479305, -1.151978, 0.7764706, 1, 0, 1,
-0.8281045, -0.9016398, -3.668709, 0.7686275, 1, 0, 1,
-0.8248141, 0.9302952, -1.059228, 0.7647059, 1, 0, 1,
-0.8234244, 1.855421, 0.1599866, 0.7568628, 1, 0, 1,
-0.8195068, -1.330247, -2.875745, 0.7529412, 1, 0, 1,
-0.8189371, -1.471193, -3.751637, 0.7450981, 1, 0, 1,
-0.8130311, 1.387373, -0.5821153, 0.7411765, 1, 0, 1,
-0.8096859, 0.239363, -0.6724861, 0.7333333, 1, 0, 1,
-0.8069665, 1.274421, -1.149058, 0.7294118, 1, 0, 1,
-0.8037561, -0.7173291, -1.541184, 0.7215686, 1, 0, 1,
-0.80076, -1.095052, -2.901724, 0.7176471, 1, 0, 1,
-0.7975856, -0.3892733, -3.743742, 0.7098039, 1, 0, 1,
-0.7962328, 0.1924511, 0.7929001, 0.7058824, 1, 0, 1,
-0.7913252, -2.76132, -2.765922, 0.6980392, 1, 0, 1,
-0.7893922, -0.4370279, -1.718645, 0.6901961, 1, 0, 1,
-0.7878216, 0.5571325, 0.2148453, 0.6862745, 1, 0, 1,
-0.7874633, 0.1268387, -1.924606, 0.6784314, 1, 0, 1,
-0.7845792, -0.1929873, -3.229997, 0.6745098, 1, 0, 1,
-0.7819032, -1.386874, -2.669604, 0.6666667, 1, 0, 1,
-0.7758474, -1.468945, -4.160851, 0.6627451, 1, 0, 1,
-0.7738296, -0.6502002, -1.920739, 0.654902, 1, 0, 1,
-0.7707248, 2.069801, -1.029521, 0.6509804, 1, 0, 1,
-0.7667953, 0.09643374, -2.633366, 0.6431373, 1, 0, 1,
-0.764385, 0.8685401, 1.361336, 0.6392157, 1, 0, 1,
-0.7636128, 0.8880628, -0.1395621, 0.6313726, 1, 0, 1,
-0.7611685, 0.7967275, -0.1554312, 0.627451, 1, 0, 1,
-0.7610927, -0.6671902, -3.659277, 0.6196079, 1, 0, 1,
-0.7589013, 0.357979, -0.9980317, 0.6156863, 1, 0, 1,
-0.7554265, 0.324174, -0.5131882, 0.6078432, 1, 0, 1,
-0.7515084, -1.865738, -2.111564, 0.6039216, 1, 0, 1,
-0.7456205, 0.1928325, -2.41754, 0.5960785, 1, 0, 1,
-0.7393317, -0.6760511, -3.327656, 0.5882353, 1, 0, 1,
-0.7335567, 0.02473357, -0.9386961, 0.5843138, 1, 0, 1,
-0.7326184, 0.3852583, -1.163209, 0.5764706, 1, 0, 1,
-0.7263644, -0.08161024, -3.436315, 0.572549, 1, 0, 1,
-0.7229679, -1.370922, -3.195876, 0.5647059, 1, 0, 1,
-0.7156832, 1.291202, -0.2870742, 0.5607843, 1, 0, 1,
-0.7084601, -0.4582278, -2.139241, 0.5529412, 1, 0, 1,
-0.7009376, -0.8936768, -2.244444, 0.5490196, 1, 0, 1,
-0.7005764, -0.1338645, -2.584318, 0.5411765, 1, 0, 1,
-0.6941475, 0.3920604, -2.158419, 0.5372549, 1, 0, 1,
-0.6917289, 1.193633, -0.3337737, 0.5294118, 1, 0, 1,
-0.69126, 1.410553, -0.4039203, 0.5254902, 1, 0, 1,
-0.6893151, 2.24433, 0.2322334, 0.5176471, 1, 0, 1,
-0.6876933, -0.5520899, -2.757666, 0.5137255, 1, 0, 1,
-0.6846825, 1.438121, -0.3765106, 0.5058824, 1, 0, 1,
-0.6838198, -0.3553484, -3.744093, 0.5019608, 1, 0, 1,
-0.6813609, -0.8442696, -3.097728, 0.4941176, 1, 0, 1,
-0.6756982, -0.04272027, -2.505019, 0.4862745, 1, 0, 1,
-0.6708795, 1.346407, -0.2844186, 0.4823529, 1, 0, 1,
-0.6699456, 0.2809132, -0.5813946, 0.4745098, 1, 0, 1,
-0.6697955, -0.564925, -3.309062, 0.4705882, 1, 0, 1,
-0.6654246, 0.03003453, -0.7420421, 0.4627451, 1, 0, 1,
-0.6553424, -1.373641, -2.294063, 0.4588235, 1, 0, 1,
-0.6530092, 0.1441809, -2.724412, 0.4509804, 1, 0, 1,
-0.6527554, 0.3916981, -0.1772243, 0.4470588, 1, 0, 1,
-0.6511457, -0.6387554, -4.706567, 0.4392157, 1, 0, 1,
-0.6486975, -0.8085963, -3.290287, 0.4352941, 1, 0, 1,
-0.6459095, -0.2780063, -2.37979, 0.427451, 1, 0, 1,
-0.6431443, -1.420043, -2.105954, 0.4235294, 1, 0, 1,
-0.640901, -0.7776636, -2.296995, 0.4156863, 1, 0, 1,
-0.6378252, -0.8679605, -1.678895, 0.4117647, 1, 0, 1,
-0.6363508, 0.5702595, -0.8833964, 0.4039216, 1, 0, 1,
-0.6359491, -0.3346097, -0.1765822, 0.3960784, 1, 0, 1,
-0.6264923, 0.3851812, 0.1917374, 0.3921569, 1, 0, 1,
-0.620818, -0.1630982, -0.6206098, 0.3843137, 1, 0, 1,
-0.6112224, -0.3734008, -2.531512, 0.3803922, 1, 0, 1,
-0.6095552, -0.4995978, -2.307583, 0.372549, 1, 0, 1,
-0.6087106, -0.9396113, -3.107144, 0.3686275, 1, 0, 1,
-0.606436, 0.5375839, -1.619466, 0.3607843, 1, 0, 1,
-0.6006429, -0.8721997, -1.672413, 0.3568628, 1, 0, 1,
-0.599306, -0.3366722, -0.850596, 0.3490196, 1, 0, 1,
-0.597078, 0.7481657, -0.8424575, 0.345098, 1, 0, 1,
-0.5951531, -0.1631487, -1.295456, 0.3372549, 1, 0, 1,
-0.5948091, 0.4474914, 0.1072978, 0.3333333, 1, 0, 1,
-0.5843174, 0.02752448, -2.238271, 0.3254902, 1, 0, 1,
-0.5805702, -0.654582, -3.062138, 0.3215686, 1, 0, 1,
-0.5748529, 0.5165974, -0.5523317, 0.3137255, 1, 0, 1,
-0.5728453, -2.053943, -1.430284, 0.3098039, 1, 0, 1,
-0.5668244, -0.6631936, -1.13673, 0.3019608, 1, 0, 1,
-0.5626811, 0.02397544, -2.590343, 0.2941177, 1, 0, 1,
-0.5617673, -1.228765, -2.421706, 0.2901961, 1, 0, 1,
-0.5613931, 0.5686724, 0.9128996, 0.282353, 1, 0, 1,
-0.5594466, 0.01394035, -1.565761, 0.2784314, 1, 0, 1,
-0.5533763, -1.049806, -1.366871, 0.2705882, 1, 0, 1,
-0.5508431, 0.03182447, -1.226183, 0.2666667, 1, 0, 1,
-0.5468795, -0.7129843, -2.501826, 0.2588235, 1, 0, 1,
-0.5396037, -0.03142575, -1.968448, 0.254902, 1, 0, 1,
-0.5323619, 1.253531, -0.8098691, 0.2470588, 1, 0, 1,
-0.5298106, -0.9735306, -2.578544, 0.2431373, 1, 0, 1,
-0.5288748, -0.7371653, -2.74776, 0.2352941, 1, 0, 1,
-0.5268641, 0.51919, 0.1675545, 0.2313726, 1, 0, 1,
-0.5187327, 2.275932, -2.199494, 0.2235294, 1, 0, 1,
-0.5145211, 1.031865, 0.6117299, 0.2196078, 1, 0, 1,
-0.5140383, 2.543007, 1.379836, 0.2117647, 1, 0, 1,
-0.5092833, 0.3558407, -1.614478, 0.2078431, 1, 0, 1,
-0.5017812, -0.8108308, -2.230067, 0.2, 1, 0, 1,
-0.4981547, -0.8476453, -2.9612, 0.1921569, 1, 0, 1,
-0.4965073, 0.7165285, 0.2891922, 0.1882353, 1, 0, 1,
-0.4959167, -0.3981054, -1.770903, 0.1803922, 1, 0, 1,
-0.4946235, 0.5666304, -2.090785, 0.1764706, 1, 0, 1,
-0.4918605, -0.2425863, -2.228848, 0.1686275, 1, 0, 1,
-0.4774294, -0.7095325, -4.117235, 0.1647059, 1, 0, 1,
-0.4755461, 0.4719414, -1.03277, 0.1568628, 1, 0, 1,
-0.4741692, -0.684381, -2.438462, 0.1529412, 1, 0, 1,
-0.4731998, -0.09667471, -1.573847, 0.145098, 1, 0, 1,
-0.4726872, 2.312927, 0.9185641, 0.1411765, 1, 0, 1,
-0.4719044, -0.4951048, -0.9945619, 0.1333333, 1, 0, 1,
-0.4691007, 0.1398253, -0.2060197, 0.1294118, 1, 0, 1,
-0.4666807, -0.3467515, -0.349192, 0.1215686, 1, 0, 1,
-0.465711, -1.077439, -0.8469441, 0.1176471, 1, 0, 1,
-0.463711, 0.2284502, -1.617662, 0.1098039, 1, 0, 1,
-0.4609911, -0.09419253, -1.435006, 0.1058824, 1, 0, 1,
-0.4609358, 0.6986887, -1.279516, 0.09803922, 1, 0, 1,
-0.4582417, 0.690547, -1.534928, 0.09019608, 1, 0, 1,
-0.4562842, 1.017522, -0.8529263, 0.08627451, 1, 0, 1,
-0.455399, -0.412313, -3.066551, 0.07843138, 1, 0, 1,
-0.4529032, 0.6975832, -0.5051088, 0.07450981, 1, 0, 1,
-0.4516554, 0.2829192, -0.8358144, 0.06666667, 1, 0, 1,
-0.4514929, 1.87968, -0.1997644, 0.0627451, 1, 0, 1,
-0.4440251, 2.292503, -0.5784526, 0.05490196, 1, 0, 1,
-0.4412454, 2.838063, -0.1777012, 0.05098039, 1, 0, 1,
-0.4388787, -0.6142311, -3.351089, 0.04313726, 1, 0, 1,
-0.4385147, 0.6004533, 0.751254, 0.03921569, 1, 0, 1,
-0.4374132, -0.9833186, -2.308263, 0.03137255, 1, 0, 1,
-0.4300377, -1.703607, -4.450948, 0.02745098, 1, 0, 1,
-0.4263381, 1.388233, -0.8130322, 0.01960784, 1, 0, 1,
-0.4253885, 0.7892264, 0.2533198, 0.01568628, 1, 0, 1,
-0.4225864, 0.1419096, -2.839664, 0.007843138, 1, 0, 1,
-0.4215477, 0.1406656, -0.9567376, 0.003921569, 1, 0, 1,
-0.412593, -1.31287, -1.762523, 0, 1, 0.003921569, 1,
-0.410319, 0.6822537, -0.9854382, 0, 1, 0.01176471, 1,
-0.4087613, 1.197508, -0.9101446, 0, 1, 0.01568628, 1,
-0.4049676, -1.688554, -5.322615, 0, 1, 0.02352941, 1,
-0.392978, -0.2644295, -1.626858, 0, 1, 0.02745098, 1,
-0.3913235, 1.428942, 1.713766, 0, 1, 0.03529412, 1,
-0.3873197, 0.5622272, -0.8110591, 0, 1, 0.03921569, 1,
-0.3829181, 0.402964, -0.08055057, 0, 1, 0.04705882, 1,
-0.3745281, -0.3475665, -3.222415, 0, 1, 0.05098039, 1,
-0.3710715, -0.908636, -3.560747, 0, 1, 0.05882353, 1,
-0.370779, 0.3857662, -0.08157525, 0, 1, 0.0627451, 1,
-0.3628967, 0.7120848, -1.254359, 0, 1, 0.07058824, 1,
-0.3617153, 0.1616492, -1.297065, 0, 1, 0.07450981, 1,
-0.3578085, 0.191124, 0.1550349, 0, 1, 0.08235294, 1,
-0.3567271, -1.886795, -3.889665, 0, 1, 0.08627451, 1,
-0.3549944, -1.015139, -4.596455, 0, 1, 0.09411765, 1,
-0.3545663, -0.1610841, -2.010891, 0, 1, 0.1019608, 1,
-0.354436, -0.3284048, -2.760509, 0, 1, 0.1058824, 1,
-0.3516765, 0.09740727, -1.279417, 0, 1, 0.1137255, 1,
-0.348727, -0.3215556, -1.562055, 0, 1, 0.1176471, 1,
-0.3485837, 0.9704093, 0.8526055, 0, 1, 0.1254902, 1,
-0.3482056, -0.7588412, -3.019267, 0, 1, 0.1294118, 1,
-0.3468079, 1.263574, -0.3283292, 0, 1, 0.1372549, 1,
-0.3465652, 1.822081, -0.05266935, 0, 1, 0.1411765, 1,
-0.3465186, 0.664758, 0.6999422, 0, 1, 0.1490196, 1,
-0.3455715, -0.9061246, -3.841852, 0, 1, 0.1529412, 1,
-0.3450551, -0.5006042, -1.551274, 0, 1, 0.1607843, 1,
-0.3438157, 1.853572, 1.167957, 0, 1, 0.1647059, 1,
-0.341321, -1.617276, -3.238288, 0, 1, 0.172549, 1,
-0.3312598, -0.9286349, -1.928773, 0, 1, 0.1764706, 1,
-0.3200946, -0.5033985, -2.097298, 0, 1, 0.1843137, 1,
-0.3124931, 0.5778546, -0.3461169, 0, 1, 0.1882353, 1,
-0.3108666, 1.374555, 0.1245718, 0, 1, 0.1960784, 1,
-0.3091969, 0.7150146, -0.6596139, 0, 1, 0.2039216, 1,
-0.3081841, 0.3770371, -0.0762106, 0, 1, 0.2078431, 1,
-0.3070078, 1.093079, -0.4850385, 0, 1, 0.2156863, 1,
-0.3048725, 0.834385, -2.447837, 0, 1, 0.2196078, 1,
-0.3046193, -0.141698, -2.2953, 0, 1, 0.227451, 1,
-0.3016566, 0.8540249, -0.4538124, 0, 1, 0.2313726, 1,
-0.2982268, 1.388184, -0.6632751, 0, 1, 0.2392157, 1,
-0.2882239, -2.033272, -5.104159, 0, 1, 0.2431373, 1,
-0.2861516, 1.257833, -0.04211946, 0, 1, 0.2509804, 1,
-0.2834673, 0.3388516, 0.4714372, 0, 1, 0.254902, 1,
-0.2833984, 0.5321901, -1.280952, 0, 1, 0.2627451, 1,
-0.2809629, 1.422437, 1.778062, 0, 1, 0.2666667, 1,
-0.2803709, -0.03236629, -2.165795, 0, 1, 0.2745098, 1,
-0.2762462, 0.1409162, 0.2272536, 0, 1, 0.2784314, 1,
-0.2758774, 1.487752, -1.771233, 0, 1, 0.2862745, 1,
-0.2746244, 0.9806049, -0.8041044, 0, 1, 0.2901961, 1,
-0.2744548, 1.035475, 0.7816507, 0, 1, 0.2980392, 1,
-0.2723259, -1.23935, -3.368208, 0, 1, 0.3058824, 1,
-0.2674878, -0.5613284, -1.979388, 0, 1, 0.3098039, 1,
-0.2584501, 0.5965004, 1.246894, 0, 1, 0.3176471, 1,
-0.2516093, 1.332381, 0.05903463, 0, 1, 0.3215686, 1,
-0.2511732, 1.262434, 0.5216158, 0, 1, 0.3294118, 1,
-0.2500161, 0.283765, -0.04122283, 0, 1, 0.3333333, 1,
-0.2477925, 1.834024, 1.250842, 0, 1, 0.3411765, 1,
-0.2466687, 2.049959, -1.856627, 0, 1, 0.345098, 1,
-0.2456169, -0.1701992, -3.53997, 0, 1, 0.3529412, 1,
-0.2347462, 0.8620769, -1.389009, 0, 1, 0.3568628, 1,
-0.2338748, 0.7505029, -1.951963, 0, 1, 0.3647059, 1,
-0.233781, -0.4739504, -4.403032, 0, 1, 0.3686275, 1,
-0.2335267, 0.5744128, 0.8566147, 0, 1, 0.3764706, 1,
-0.2331317, 0.3482485, -0.2692183, 0, 1, 0.3803922, 1,
-0.2298011, -0.01846551, -3.150619, 0, 1, 0.3882353, 1,
-0.2294907, -0.2198388, -2.895431, 0, 1, 0.3921569, 1,
-0.2290988, -1.586485, -2.894036, 0, 1, 0.4, 1,
-0.2234832, -0.3277974, -3.384575, 0, 1, 0.4078431, 1,
-0.2165056, -0.1075604, -3.70984, 0, 1, 0.4117647, 1,
-0.2156354, -0.6768281, -3.482393, 0, 1, 0.4196078, 1,
-0.2135266, -0.274218, -0.9010579, 0, 1, 0.4235294, 1,
-0.2132075, -0.4645513, -3.610923, 0, 1, 0.4313726, 1,
-0.2127986, -0.7475625, -2.766968, 0, 1, 0.4352941, 1,
-0.208639, 1.15852, -0.06746818, 0, 1, 0.4431373, 1,
-0.1956383, -0.128402, -1.390161, 0, 1, 0.4470588, 1,
-0.19392, 1.948971, 1.502559, 0, 1, 0.454902, 1,
-0.1930717, -0.2351596, -2.627341, 0, 1, 0.4588235, 1,
-0.1877641, 1.122024, -1.55009, 0, 1, 0.4666667, 1,
-0.187183, 0.9563161, -0.2808069, 0, 1, 0.4705882, 1,
-0.1828708, -0.2687834, -3.964131, 0, 1, 0.4784314, 1,
-0.1809756, -0.2575071, -2.043285, 0, 1, 0.4823529, 1,
-0.1803982, -0.9362423, -1.723915, 0, 1, 0.4901961, 1,
-0.167605, 0.4933623, -0.4077196, 0, 1, 0.4941176, 1,
-0.1673967, 0.4422986, -0.9398911, 0, 1, 0.5019608, 1,
-0.1612383, -1.09405, -1.498743, 0, 1, 0.509804, 1,
-0.1581005, -0.134443, -0.6734692, 0, 1, 0.5137255, 1,
-0.152389, 1.827179, -0.6781846, 0, 1, 0.5215687, 1,
-0.151077, -0.05992296, -2.388868, 0, 1, 0.5254902, 1,
-0.1453361, 0.3862595, 0.8582406, 0, 1, 0.5333334, 1,
-0.1437913, 0.2489663, 1.5467, 0, 1, 0.5372549, 1,
-0.1402141, 1.730309, -2.231703, 0, 1, 0.5450981, 1,
-0.1375792, -0.1254012, -3.346526, 0, 1, 0.5490196, 1,
-0.1369696, 0.5413412, 1.473624, 0, 1, 0.5568628, 1,
-0.1337522, -0.1095966, -2.458112, 0, 1, 0.5607843, 1,
-0.1308078, -0.9831128, -2.443618, 0, 1, 0.5686275, 1,
-0.1299791, -0.2500446, -2.823548, 0, 1, 0.572549, 1,
-0.1275275, 0.4066779, -0.6118476, 0, 1, 0.5803922, 1,
-0.1259809, -1.234599, -3.052552, 0, 1, 0.5843138, 1,
-0.1255, -0.3670878, -2.304761, 0, 1, 0.5921569, 1,
-0.1233276, 0.8229357, 0.5128902, 0, 1, 0.5960785, 1,
-0.1202207, 0.2876324, 0.0766214, 0, 1, 0.6039216, 1,
-0.115559, -1.83211, -4.288446, 0, 1, 0.6117647, 1,
-0.1094751, 0.9958668, -0.6229036, 0, 1, 0.6156863, 1,
-0.1094209, 0.2079591, -3.366809, 0, 1, 0.6235294, 1,
-0.1065155, 0.4247887, -0.2575759, 0, 1, 0.627451, 1,
-0.1017359, 0.7397225, 0.8357238, 0, 1, 0.6352941, 1,
-0.09742469, 0.827208, 0.08048709, 0, 1, 0.6392157, 1,
-0.09706677, 0.1171235, -2.076446, 0, 1, 0.6470588, 1,
-0.09627203, 0.1585243, -3.003633, 0, 1, 0.6509804, 1,
-0.08925313, -1.055444, -3.539164, 0, 1, 0.6588235, 1,
-0.08706891, 2.113212, 0.506265, 0, 1, 0.6627451, 1,
-0.08649132, 1.663822, -1.400398, 0, 1, 0.6705883, 1,
-0.08449417, 2.008174, 1.003696, 0, 1, 0.6745098, 1,
-0.08441161, 0.4486282, -1.695862, 0, 1, 0.682353, 1,
-0.07412809, -0.2199238, -2.61047, 0, 1, 0.6862745, 1,
-0.0706965, 0.7803503, 0.1420242, 0, 1, 0.6941177, 1,
-0.07003307, 0.2566427, -0.8419582, 0, 1, 0.7019608, 1,
-0.06995052, -0.1090936, -3.41835, 0, 1, 0.7058824, 1,
-0.06988095, -0.2301539, -3.97082, 0, 1, 0.7137255, 1,
-0.06095736, -1.157956, -1.85657, 0, 1, 0.7176471, 1,
-0.06051878, 1.128877, 0.2516627, 0, 1, 0.7254902, 1,
-0.05696115, -0.9177298, -4.388959, 0, 1, 0.7294118, 1,
-0.05586827, 1.845999, -0.7914463, 0, 1, 0.7372549, 1,
-0.05334947, -0.8109226, -4.411112, 0, 1, 0.7411765, 1,
-0.05040451, 0.5661063, 0.03045313, 0, 1, 0.7490196, 1,
-0.04219919, 0.791321, -0.6354733, 0, 1, 0.7529412, 1,
-0.03754914, -0.4009167, -2.504022, 0, 1, 0.7607843, 1,
-0.03594583, -0.8189663, -2.630778, 0, 1, 0.7647059, 1,
-0.03330245, 0.8724661, 1.02309, 0, 1, 0.772549, 1,
-0.033066, 0.7100562, -0.1228859, 0, 1, 0.7764706, 1,
-0.03278218, 0.3373989, -0.7817273, 0, 1, 0.7843137, 1,
-0.0281092, 1.85304, -1.177268, 0, 1, 0.7882353, 1,
-0.02603886, 1.704134, -0.3796749, 0, 1, 0.7960784, 1,
-0.02570374, 0.4148578, -0.8304971, 0, 1, 0.8039216, 1,
-0.02172386, -0.8455859, -3.134437, 0, 1, 0.8078431, 1,
-0.01743653, 0.6099783, 1.290739, 0, 1, 0.8156863, 1,
-0.01587653, -0.5671694, -2.485879, 0, 1, 0.8196079, 1,
-0.01551848, 0.3459145, 0.2303834, 0, 1, 0.827451, 1,
-0.01497472, -0.229637, -3.637956, 0, 1, 0.8313726, 1,
-0.01425734, 0.3052627, 0.1359255, 0, 1, 0.8392157, 1,
-0.01306354, -0.6495471, -4.900954, 0, 1, 0.8431373, 1,
-0.01194884, -0.9572269, -4.337382, 0, 1, 0.8509804, 1,
-0.01040411, -1.170105, -3.784571, 0, 1, 0.854902, 1,
-0.008522824, 0.1646282, -0.4786939, 0, 1, 0.8627451, 1,
-0.005166659, -0.5131089, -2.572935, 0, 1, 0.8666667, 1,
-0.00425231, -0.712033, -2.426306, 0, 1, 0.8745098, 1,
-0.003253013, -1.49712, -3.098114, 0, 1, 0.8784314, 1,
-0.001351641, -1.613743, -2.126412, 0, 1, 0.8862745, 1,
0.0001731009, 2.082474, -0.2130484, 0, 1, 0.8901961, 1,
0.002927627, -0.660773, 2.440035, 0, 1, 0.8980392, 1,
0.005940727, 0.7416387, 1.477573, 0, 1, 0.9058824, 1,
0.007676499, 0.841464, -0.009478955, 0, 1, 0.9098039, 1,
0.008654549, -3.369798, 4.260819, 0, 1, 0.9176471, 1,
0.01108026, -0.2187319, 3.501452, 0, 1, 0.9215686, 1,
0.01770788, 2.007519, 1.095052, 0, 1, 0.9294118, 1,
0.02117398, -1.059591, 3.926628, 0, 1, 0.9333333, 1,
0.02338165, -0.4984396, 4.376436, 0, 1, 0.9411765, 1,
0.0249737, 0.5360044, 0.7078834, 0, 1, 0.945098, 1,
0.02507641, -1.006794, 3.392015, 0, 1, 0.9529412, 1,
0.02612867, -0.05043721, 2.880165, 0, 1, 0.9568627, 1,
0.02850104, -0.004512318, 0.847844, 0, 1, 0.9647059, 1,
0.03186098, -1.275528, 3.095749, 0, 1, 0.9686275, 1,
0.04091198, -0.2821468, 3.63729, 0, 1, 0.9764706, 1,
0.04110216, -0.103046, 2.515832, 0, 1, 0.9803922, 1,
0.04265655, 0.2337871, -0.5290169, 0, 1, 0.9882353, 1,
0.05285786, -0.5183706, 2.389416, 0, 1, 0.9921569, 1,
0.05444322, 0.2277335, 1.805869, 0, 1, 1, 1,
0.05688649, 0.8906361, -0.4503165, 0, 0.9921569, 1, 1,
0.05872588, -1.284862, 3.642899, 0, 0.9882353, 1, 1,
0.05935731, 0.413778, 0.4033922, 0, 0.9803922, 1, 1,
0.06116892, 1.162801, -1.625775, 0, 0.9764706, 1, 1,
0.06312758, 0.2553539, 0.446417, 0, 0.9686275, 1, 1,
0.06416579, -2.021787, 4.777331, 0, 0.9647059, 1, 1,
0.06824239, -1.132917, 3.367636, 0, 0.9568627, 1, 1,
0.0710128, -0.8126941, 3.233455, 0, 0.9529412, 1, 1,
0.07234235, 0.8318298, 0.6298984, 0, 0.945098, 1, 1,
0.07902361, -0.2150399, 3.490435, 0, 0.9411765, 1, 1,
0.08676814, 1.926928, -0.03597907, 0, 0.9333333, 1, 1,
0.09212459, 1.70603, -0.1226877, 0, 0.9294118, 1, 1,
0.09271887, -0.8507727, 2.077132, 0, 0.9215686, 1, 1,
0.09279452, -0.1051349, 2.599542, 0, 0.9176471, 1, 1,
0.09500276, -0.2036847, 1.932895, 0, 0.9098039, 1, 1,
0.09568228, -1.605129, 4.36277, 0, 0.9058824, 1, 1,
0.09668843, 0.2806079, 2.028851, 0, 0.8980392, 1, 1,
0.09723118, -0.827938, 2.84024, 0, 0.8901961, 1, 1,
0.09842788, 0.1074878, 0.1081425, 0, 0.8862745, 1, 1,
0.1000362, -0.4359909, 2.337006, 0, 0.8784314, 1, 1,
0.1000573, -1.795093, 3.649924, 0, 0.8745098, 1, 1,
0.102679, -0.1091244, 3.291431, 0, 0.8666667, 1, 1,
0.107361, -1.348952, 4.12611, 0, 0.8627451, 1, 1,
0.1092949, 0.8849055, -1.866533, 0, 0.854902, 1, 1,
0.1122458, 0.3471964, 0.9298704, 0, 0.8509804, 1, 1,
0.1124047, -0.9005136, 3.804386, 0, 0.8431373, 1, 1,
0.1217181, -1.027219, 2.024363, 0, 0.8392157, 1, 1,
0.1245193, -1.771556, 3.862751, 0, 0.8313726, 1, 1,
0.1289026, 0.9862472, 0.8166414, 0, 0.827451, 1, 1,
0.1318025, -0.2194212, 3.859124, 0, 0.8196079, 1, 1,
0.1348235, -0.03133131, 2.311962, 0, 0.8156863, 1, 1,
0.1367679, 1.269209, -0.4091498, 0, 0.8078431, 1, 1,
0.1408876, 0.2615366, 1.547525, 0, 0.8039216, 1, 1,
0.1418318, 0.3059026, 1.057009, 0, 0.7960784, 1, 1,
0.1452558, -1.321568, 3.974307, 0, 0.7882353, 1, 1,
0.1518047, -1.121705, 3.864764, 0, 0.7843137, 1, 1,
0.1538337, -0.2780372, 2.545839, 0, 0.7764706, 1, 1,
0.1550301, -0.6046543, 4.839842, 0, 0.772549, 1, 1,
0.1580654, -0.5288615, 3.382139, 0, 0.7647059, 1, 1,
0.1595708, -0.923569, 2.4893, 0, 0.7607843, 1, 1,
0.1595807, 0.273036, -0.3612814, 0, 0.7529412, 1, 1,
0.1598442, 0.01336935, 0.9354413, 0, 0.7490196, 1, 1,
0.1618035, 1.43404, -1.679847, 0, 0.7411765, 1, 1,
0.1619635, -1.076217, 2.770852, 0, 0.7372549, 1, 1,
0.164103, -3.009218, 2.202077, 0, 0.7294118, 1, 1,
0.1661542, -0.9563585, 1.844345, 0, 0.7254902, 1, 1,
0.16628, -1.886042, 2.977423, 0, 0.7176471, 1, 1,
0.1723202, 0.1623885, -0.08957352, 0, 0.7137255, 1, 1,
0.1727885, 0.4362161, -0.04280517, 0, 0.7058824, 1, 1,
0.1730331, 0.3166245, 1.644624, 0, 0.6980392, 1, 1,
0.1756561, 0.2384183, 3.174926, 0, 0.6941177, 1, 1,
0.1778166, 1.959269, 1.30946, 0, 0.6862745, 1, 1,
0.1794579, 1.64194, 0.1262929, 0, 0.682353, 1, 1,
0.1820525, -1.459094, 2.987715, 0, 0.6745098, 1, 1,
0.1854819, 1.225857, 0.9404093, 0, 0.6705883, 1, 1,
0.1860838, 1.522062, 1.065197, 0, 0.6627451, 1, 1,
0.1895196, -0.07675438, 3.042297, 0, 0.6588235, 1, 1,
0.1897794, -0.7437035, 1.242723, 0, 0.6509804, 1, 1,
0.1975689, -0.6535095, 1.996762, 0, 0.6470588, 1, 1,
0.2026516, 0.2050254, 1.399957, 0, 0.6392157, 1, 1,
0.2056828, 1.22007, 1.119656, 0, 0.6352941, 1, 1,
0.2084535, 0.4414755, -0.3619542, 0, 0.627451, 1, 1,
0.2139775, 1.782074, -0.3688523, 0, 0.6235294, 1, 1,
0.2179302, 1.377478, 1.472247, 0, 0.6156863, 1, 1,
0.2184813, -0.5224258, 3.342898, 0, 0.6117647, 1, 1,
0.2236517, -0.4558943, 2.543724, 0, 0.6039216, 1, 1,
0.2273336, 0.8493639, 0.5659104, 0, 0.5960785, 1, 1,
0.2276076, 0.4064305, -0.6266528, 0, 0.5921569, 1, 1,
0.2310195, -0.62264, 1.188206, 0, 0.5843138, 1, 1,
0.2326357, 0.3831685, -0.135026, 0, 0.5803922, 1, 1,
0.2370594, 0.02146244, 0.8967952, 0, 0.572549, 1, 1,
0.2383228, -0.07511178, 0.4204533, 0, 0.5686275, 1, 1,
0.2478514, 0.2126396, 2.405746, 0, 0.5607843, 1, 1,
0.2511829, 0.6463028, 0.1716153, 0, 0.5568628, 1, 1,
0.2531367, 1.77038, 0.5435792, 0, 0.5490196, 1, 1,
0.2563539, -0.5969368, 2.417197, 0, 0.5450981, 1, 1,
0.2610154, -0.9220752, 2.609346, 0, 0.5372549, 1, 1,
0.2640209, 2.025218, -0.7376079, 0, 0.5333334, 1, 1,
0.2647426, 1.456408, 0.4881426, 0, 0.5254902, 1, 1,
0.264868, -0.1268275, 1.277433, 0, 0.5215687, 1, 1,
0.266869, -1.388613, 1.984264, 0, 0.5137255, 1, 1,
0.2708945, 0.8537211, 0.4288266, 0, 0.509804, 1, 1,
0.2747741, 1.023303, 1.22218, 0, 0.5019608, 1, 1,
0.2760821, -0.679879, 4.233705, 0, 0.4941176, 1, 1,
0.2784944, -0.9899377, 2.837379, 0, 0.4901961, 1, 1,
0.2787882, -0.9923846, 4.623474, 0, 0.4823529, 1, 1,
0.2834522, 1.311043, -1.789338, 0, 0.4784314, 1, 1,
0.2842475, 0.5730436, 1.210465, 0, 0.4705882, 1, 1,
0.2872306, 0.5895475, -1.702546, 0, 0.4666667, 1, 1,
0.2879714, 0.6761675, 0.8675959, 0, 0.4588235, 1, 1,
0.2901174, 0.568166, 0.7805509, 0, 0.454902, 1, 1,
0.2905198, 0.7449349, -1.489669, 0, 0.4470588, 1, 1,
0.2918357, 0.9647939, 2.711116, 0, 0.4431373, 1, 1,
0.2926467, -1.632163, 2.61801, 0, 0.4352941, 1, 1,
0.2945074, -1.151123, 3.836753, 0, 0.4313726, 1, 1,
0.2965472, -1.88153, 3.538593, 0, 0.4235294, 1, 1,
0.2968521, 0.2181402, 0.1731869, 0, 0.4196078, 1, 1,
0.2972585, 0.7817332, 0.6438127, 0, 0.4117647, 1, 1,
0.3007599, -1.526057, 3.31227, 0, 0.4078431, 1, 1,
0.3024192, 0.2275355, -0.45279, 0, 0.4, 1, 1,
0.3058579, 1.422811, -0.6439245, 0, 0.3921569, 1, 1,
0.3096123, -0.3367349, 4.028487, 0, 0.3882353, 1, 1,
0.3116568, 1.402458, -0.5534678, 0, 0.3803922, 1, 1,
0.3119025, -1.081789, 0.8207877, 0, 0.3764706, 1, 1,
0.3124101, 2.000306, -0.08797303, 0, 0.3686275, 1, 1,
0.312839, 0.3867339, 1.816074, 0, 0.3647059, 1, 1,
0.3129098, 1.231284, -1.715855, 0, 0.3568628, 1, 1,
0.3179385, 1.737024, 0.02172281, 0, 0.3529412, 1, 1,
0.3195931, 1.504502, -0.200959, 0, 0.345098, 1, 1,
0.3218466, 0.9355907, 0.6625493, 0, 0.3411765, 1, 1,
0.3239077, 0.5263963, -0.1846451, 0, 0.3333333, 1, 1,
0.3240384, 0.1167455, 1.790426, 0, 0.3294118, 1, 1,
0.3263967, 0.239594, -0.9347183, 0, 0.3215686, 1, 1,
0.3286595, 0.4578443, 3.359279, 0, 0.3176471, 1, 1,
0.3321572, 0.9157072, 1.543157, 0, 0.3098039, 1, 1,
0.332568, -1.59013, 4.45348, 0, 0.3058824, 1, 1,
0.3329751, -1.117744, 1.180289, 0, 0.2980392, 1, 1,
0.337164, -0.8487762, 3.292867, 0, 0.2901961, 1, 1,
0.3412755, 0.5679929, 0.9183903, 0, 0.2862745, 1, 1,
0.3423583, -0.2202048, 1.976472, 0, 0.2784314, 1, 1,
0.3427026, -1.234225, 2.262032, 0, 0.2745098, 1, 1,
0.3445012, -0.2932172, 3.855032, 0, 0.2666667, 1, 1,
0.3454676, -0.4225439, 2.195609, 0, 0.2627451, 1, 1,
0.3455527, -0.256119, 3.097977, 0, 0.254902, 1, 1,
0.3494858, -1.244874, 4.417353, 0, 0.2509804, 1, 1,
0.3500117, -2.015091, 1.346947, 0, 0.2431373, 1, 1,
0.3515843, -2.129021, 3.624933, 0, 0.2392157, 1, 1,
0.3546719, 0.3361883, 0.3572554, 0, 0.2313726, 1, 1,
0.3550749, 1.330693, 0.001037899, 0, 0.227451, 1, 1,
0.3551345, 0.8833671, 1.031524, 0, 0.2196078, 1, 1,
0.3558248, -2.69652, 2.541709, 0, 0.2156863, 1, 1,
0.3573669, 0.00409459, 2.742599, 0, 0.2078431, 1, 1,
0.3601332, 1.467485, -0.520657, 0, 0.2039216, 1, 1,
0.3602688, -1.587089, 4.063542, 0, 0.1960784, 1, 1,
0.3603544, -1.64204, 2.672481, 0, 0.1882353, 1, 1,
0.3659971, -0.4532256, 1.691002, 0, 0.1843137, 1, 1,
0.3703659, -0.289735, 2.358633, 0, 0.1764706, 1, 1,
0.3704977, 1.15869, 0.4224921, 0, 0.172549, 1, 1,
0.3716335, -0.6835579, 2.276628, 0, 0.1647059, 1, 1,
0.3720525, 1.431337, 0.1287629, 0, 0.1607843, 1, 1,
0.3748557, -0.3649894, 3.222773, 0, 0.1529412, 1, 1,
0.3761105, -0.8101206, 1.838925, 0, 0.1490196, 1, 1,
0.3839796, 1.742784, -0.6015591, 0, 0.1411765, 1, 1,
0.3881044, -0.7297396, 1.373484, 0, 0.1372549, 1, 1,
0.388863, 0.3458229, 0.8899944, 0, 0.1294118, 1, 1,
0.3895151, -0.01330271, 0.7634155, 0, 0.1254902, 1, 1,
0.3913722, 1.106528, 1.059379, 0, 0.1176471, 1, 1,
0.3921295, -0.4704154, 1.679358, 0, 0.1137255, 1, 1,
0.3953674, -0.2734944, 3.690172, 0, 0.1058824, 1, 1,
0.3963821, -0.6866769, 1.652727, 0, 0.09803922, 1, 1,
0.3970264, 1.110139, -0.5176947, 0, 0.09411765, 1, 1,
0.3977226, 2.144615, 1.16809, 0, 0.08627451, 1, 1,
0.4008592, 1.2752, 0.8453398, 0, 0.08235294, 1, 1,
0.4008996, -0.1263861, 0.6826524, 0, 0.07450981, 1, 1,
0.4045853, 0.9524477, -0.1306059, 0, 0.07058824, 1, 1,
0.4057828, -0.1264528, 1.717371, 0, 0.0627451, 1, 1,
0.4104443, 2.248213, 1.123414, 0, 0.05882353, 1, 1,
0.4118859, 1.36195, 1.476268, 0, 0.05098039, 1, 1,
0.4204331, -0.9690514, 4.158488, 0, 0.04705882, 1, 1,
0.4236339, 0.4532713, 1.392776, 0, 0.03921569, 1, 1,
0.4244634, 0.6772174, -0.3643043, 0, 0.03529412, 1, 1,
0.4247534, -0.3750544, 3.730328, 0, 0.02745098, 1, 1,
0.4302418, -0.1062934, 2.769755, 0, 0.02352941, 1, 1,
0.4304749, 1.241809, 0.4766806, 0, 0.01568628, 1, 1,
0.4322179, -0.341203, 2.577212, 0, 0.01176471, 1, 1,
0.4414251, 0.5122903, 0.679185, 0, 0.003921569, 1, 1,
0.4430885, -0.2758348, 2.105445, 0.003921569, 0, 1, 1,
0.450983, -1.124004, 4.483556, 0.007843138, 0, 1, 1,
0.4558775, 0.7514367, 0.7712231, 0.01568628, 0, 1, 1,
0.4568965, 1.492414, 1.199561, 0.01960784, 0, 1, 1,
0.4572867, 1.168301, -0.3479544, 0.02745098, 0, 1, 1,
0.4601611, 0.2725435, 1.031508, 0.03137255, 0, 1, 1,
0.4645309, -0.7197987, 2.200125, 0.03921569, 0, 1, 1,
0.4648336, -2.089756, 3.404179, 0.04313726, 0, 1, 1,
0.4657671, 1.421705, 0.3883173, 0.05098039, 0, 1, 1,
0.4660432, 0.6872039, 1.246498, 0.05490196, 0, 1, 1,
0.4673316, -1.083205, 3.927435, 0.0627451, 0, 1, 1,
0.4676951, -0.4143305, 2.76465, 0.06666667, 0, 1, 1,
0.468174, -0.8222833, 3.57893, 0.07450981, 0, 1, 1,
0.4690335, -0.1982246, 3.023246, 0.07843138, 0, 1, 1,
0.4694589, 0.6821929, -1.025403, 0.08627451, 0, 1, 1,
0.4706047, -0.8337291, 2.983919, 0.09019608, 0, 1, 1,
0.4783067, 0.03505957, 2.98861, 0.09803922, 0, 1, 1,
0.4802589, -0.9765089, 2.939628, 0.1058824, 0, 1, 1,
0.4861634, 0.4797242, 0.6087319, 0.1098039, 0, 1, 1,
0.4892127, 0.02849002, 1.180298, 0.1176471, 0, 1, 1,
0.490139, 0.972463, -0.7790125, 0.1215686, 0, 1, 1,
0.4948848, 0.7239582, 1.451304, 0.1294118, 0, 1, 1,
0.4969391, -0.8331307, 2.613325, 0.1333333, 0, 1, 1,
0.4985943, 1.151303, -1.66064, 0.1411765, 0, 1, 1,
0.500425, 0.8160369, -1.299049, 0.145098, 0, 1, 1,
0.5028784, 1.253751, 1.273105, 0.1529412, 0, 1, 1,
0.5033385, 1.545984, -0.2008809, 0.1568628, 0, 1, 1,
0.5033597, 1.574138, 2.442773, 0.1647059, 0, 1, 1,
0.5067747, -1.470514, 1.730857, 0.1686275, 0, 1, 1,
0.5116159, 0.978915, 1.447919, 0.1764706, 0, 1, 1,
0.5116817, -0.09117024, 1.85494, 0.1803922, 0, 1, 1,
0.5137296, -2.379357, 2.960745, 0.1882353, 0, 1, 1,
0.5149814, -1.847261, 2.323135, 0.1921569, 0, 1, 1,
0.5152936, 0.2371443, 2.611492, 0.2, 0, 1, 1,
0.5220589, -0.9065532, 2.283341, 0.2078431, 0, 1, 1,
0.522441, 1.265819, 1.795512, 0.2117647, 0, 1, 1,
0.5235917, 0.6622627, -0.09540423, 0.2196078, 0, 1, 1,
0.5259353, 0.01183156, 3.338431, 0.2235294, 0, 1, 1,
0.5285174, -0.1054888, 1.889605, 0.2313726, 0, 1, 1,
0.5314534, -0.2763474, 2.273801, 0.2352941, 0, 1, 1,
0.5341814, -1.523608, 1.190857, 0.2431373, 0, 1, 1,
0.5373989, -0.09742425, 2.259944, 0.2470588, 0, 1, 1,
0.5398449, -0.7684402, 1.394573, 0.254902, 0, 1, 1,
0.5399939, 0.9195701, 1.563774, 0.2588235, 0, 1, 1,
0.5492509, -0.1925249, 2.12181, 0.2666667, 0, 1, 1,
0.5602895, -0.9796438, 2.230235, 0.2705882, 0, 1, 1,
0.5607914, -0.8452159, 2.399596, 0.2784314, 0, 1, 1,
0.5639038, -1.667734, 2.03656, 0.282353, 0, 1, 1,
0.5700426, 1.091083, -1.231423, 0.2901961, 0, 1, 1,
0.5716004, 0.5376589, 0.5075219, 0.2941177, 0, 1, 1,
0.5736982, 2.048769, -1.204532, 0.3019608, 0, 1, 1,
0.5765677, 0.4723353, 1.770689, 0.3098039, 0, 1, 1,
0.576606, -0.3876433, 1.599642, 0.3137255, 0, 1, 1,
0.5825527, 2.63594, -1.160588, 0.3215686, 0, 1, 1,
0.5857095, 1.727831, 1.706943, 0.3254902, 0, 1, 1,
0.5879918, 0.1322132, 1.523847, 0.3333333, 0, 1, 1,
0.5896625, 2.357742, 1.684171, 0.3372549, 0, 1, 1,
0.5907934, -0.456031, 3.246942, 0.345098, 0, 1, 1,
0.5918757, 1.801736, 0.2852045, 0.3490196, 0, 1, 1,
0.5945142, -0.3273654, 2.688507, 0.3568628, 0, 1, 1,
0.5946831, 0.2771742, 0.1722118, 0.3607843, 0, 1, 1,
0.5946962, 1.633334, 1.930315, 0.3686275, 0, 1, 1,
0.6011122, -1.194137, 1.905498, 0.372549, 0, 1, 1,
0.6033998, -0.8253946, 3.450618, 0.3803922, 0, 1, 1,
0.6061032, 0.8445284, 0.2454541, 0.3843137, 0, 1, 1,
0.6148803, -1.593166, 1.879842, 0.3921569, 0, 1, 1,
0.6213668, -0.8979001, 3.144758, 0.3960784, 0, 1, 1,
0.621549, 0.2374029, 1.689706, 0.4039216, 0, 1, 1,
0.6267557, 0.1202046, 2.482077, 0.4117647, 0, 1, 1,
0.6295741, -2.095361, 2.83103, 0.4156863, 0, 1, 1,
0.6348371, 0.3574201, 2.200723, 0.4235294, 0, 1, 1,
0.6356934, -0.8549469, 4.264709, 0.427451, 0, 1, 1,
0.6360159, 0.7701364, -1.108644, 0.4352941, 0, 1, 1,
0.6375258, 0.1274758, 1.149507, 0.4392157, 0, 1, 1,
0.6386113, 2.508856, -0.0649321, 0.4470588, 0, 1, 1,
0.6512241, -0.5385397, 1.442726, 0.4509804, 0, 1, 1,
0.6516025, -1.230831, 2.983773, 0.4588235, 0, 1, 1,
0.6576194, 0.7453235, 0.3054482, 0.4627451, 0, 1, 1,
0.6580148, -0.7042154, 1.518625, 0.4705882, 0, 1, 1,
0.6674582, 1.04855, 0.6680335, 0.4745098, 0, 1, 1,
0.670086, 0.06377032, 2.152905, 0.4823529, 0, 1, 1,
0.6711003, 0.4505739, 0.665548, 0.4862745, 0, 1, 1,
0.6717384, -0.2974497, 2.869863, 0.4941176, 0, 1, 1,
0.6722279, 0.4017243, 2.748451, 0.5019608, 0, 1, 1,
0.6825888, 0.3327354, 0.7995031, 0.5058824, 0, 1, 1,
0.6834754, -0.6360391, -0.09152552, 0.5137255, 0, 1, 1,
0.6843144, 0.4182547, 0.8911399, 0.5176471, 0, 1, 1,
0.6882203, -0.3555297, 2.915663, 0.5254902, 0, 1, 1,
0.6906829, -1.033463, 1.618956, 0.5294118, 0, 1, 1,
0.6915736, 0.6267149, 0.809214, 0.5372549, 0, 1, 1,
0.694666, -2.071221, 4.663476, 0.5411765, 0, 1, 1,
0.6966949, 0.9389665, -0.08252623, 0.5490196, 0, 1, 1,
0.699585, 0.5070944, 0.09205597, 0.5529412, 0, 1, 1,
0.7009585, 1.25938, 0.3204994, 0.5607843, 0, 1, 1,
0.7025955, 0.3623732, 1.354468, 0.5647059, 0, 1, 1,
0.7038113, -0.8958053, 2.924699, 0.572549, 0, 1, 1,
0.7097848, -1.761856, 2.163318, 0.5764706, 0, 1, 1,
0.7126945, 0.2613378, 1.384193, 0.5843138, 0, 1, 1,
0.7131412, 0.1922411, 1.901597, 0.5882353, 0, 1, 1,
0.7176335, 2.669312, -0.1360267, 0.5960785, 0, 1, 1,
0.7190294, -2.050162, 3.007106, 0.6039216, 0, 1, 1,
0.7202249, 0.4278072, -0.2156488, 0.6078432, 0, 1, 1,
0.720887, -0.1072447, 1.152047, 0.6156863, 0, 1, 1,
0.7219337, 0.769171, 1.431713, 0.6196079, 0, 1, 1,
0.723752, 2.464413, -0.6225408, 0.627451, 0, 1, 1,
0.7257664, 1.12428, 0.5253398, 0.6313726, 0, 1, 1,
0.7261633, -0.977994, 1.2076, 0.6392157, 0, 1, 1,
0.7313448, -0.2950398, 1.691292, 0.6431373, 0, 1, 1,
0.7327964, -0.06835571, 1.623489, 0.6509804, 0, 1, 1,
0.7336966, 0.01931277, 2.189201, 0.654902, 0, 1, 1,
0.7346575, 0.2673586, 1.352244, 0.6627451, 0, 1, 1,
0.7547047, -1.117294, 3.136901, 0.6666667, 0, 1, 1,
0.7547935, -0.1593347, 1.219503, 0.6745098, 0, 1, 1,
0.756846, -0.5366211, 1.896363, 0.6784314, 0, 1, 1,
0.7608781, 0.3752185, 2.582773, 0.6862745, 0, 1, 1,
0.7665017, -1.614805, 3.105478, 0.6901961, 0, 1, 1,
0.780782, -0.884906, 2.446633, 0.6980392, 0, 1, 1,
0.7809951, -1.905147, 3.788427, 0.7058824, 0, 1, 1,
0.7852101, 1.088425, 0.6436522, 0.7098039, 0, 1, 1,
0.7874412, -0.608696, 1.081617, 0.7176471, 0, 1, 1,
0.7889863, -0.5216737, 2.222769, 0.7215686, 0, 1, 1,
0.8017827, -2.256537, 4.673913, 0.7294118, 0, 1, 1,
0.8170347, -0.9213017, 1.686299, 0.7333333, 0, 1, 1,
0.8217388, 0.7373791, 0.1744046, 0.7411765, 0, 1, 1,
0.82261, -2.255327, 2.408266, 0.7450981, 0, 1, 1,
0.8257521, 0.8781855, 0.8516952, 0.7529412, 0, 1, 1,
0.8382778, -0.5245958, 1.886299, 0.7568628, 0, 1, 1,
0.8485044, 1.315402, -0.1893032, 0.7647059, 0, 1, 1,
0.8517362, 0.7818159, 0.9566685, 0.7686275, 0, 1, 1,
0.853847, 0.2502376, 1.984947, 0.7764706, 0, 1, 1,
0.8583509, 0.2037562, 0.2772546, 0.7803922, 0, 1, 1,
0.8601317, 1.530784, -0.06446759, 0.7882353, 0, 1, 1,
0.8617448, -0.09045219, 1.685583, 0.7921569, 0, 1, 1,
0.8631212, 1.605578, -0.1904676, 0.8, 0, 1, 1,
0.8640755, 3.003795, 0.8093131, 0.8078431, 0, 1, 1,
0.8673067, -1.860094, 3.637038, 0.8117647, 0, 1, 1,
0.8675081, -1.262137, 0.8969299, 0.8196079, 0, 1, 1,
0.8781912, -0.3415053, 2.063491, 0.8235294, 0, 1, 1,
0.8782839, 1.020882, 0.5853079, 0.8313726, 0, 1, 1,
0.884401, 0.7180841, 1.301278, 0.8352941, 0, 1, 1,
0.8875421, -0.4742283, 2.34824, 0.8431373, 0, 1, 1,
0.8925593, 1.276813, 0.2350724, 0.8470588, 0, 1, 1,
0.8939911, 1.08244, 1.833359, 0.854902, 0, 1, 1,
0.8951205, -0.03808537, 2.140691, 0.8588235, 0, 1, 1,
0.9042763, -0.4712901, 3.933801, 0.8666667, 0, 1, 1,
0.9070131, -1.757764, 4.240176, 0.8705882, 0, 1, 1,
0.9092914, 0.1376887, 0.5809342, 0.8784314, 0, 1, 1,
0.9098613, -0.5747401, 3.286479, 0.8823529, 0, 1, 1,
0.9121348, -0.7105523, 1.827915, 0.8901961, 0, 1, 1,
0.9161509, 1.051865, 1.097908, 0.8941177, 0, 1, 1,
0.9185745, -0.2134282, 2.966425, 0.9019608, 0, 1, 1,
0.9302553, 1.794733, 0.599202, 0.9098039, 0, 1, 1,
0.9303611, -0.6194816, 2.312397, 0.9137255, 0, 1, 1,
0.9326235, 1.227564, 1.550047, 0.9215686, 0, 1, 1,
0.9407048, -0.2694307, 1.952246, 0.9254902, 0, 1, 1,
0.9411668, -0.691871, 0.09276467, 0.9333333, 0, 1, 1,
0.9473789, 0.4605891, 1.341441, 0.9372549, 0, 1, 1,
0.9529966, -0.8894311, 1.660222, 0.945098, 0, 1, 1,
0.9571816, 0.6130401, 2.02041, 0.9490196, 0, 1, 1,
0.9581783, 0.4993635, 1.216922, 0.9568627, 0, 1, 1,
0.9595315, -0.2030778, -0.20242, 0.9607843, 0, 1, 1,
0.9607872, 0.409796, -0.06114425, 0.9686275, 0, 1, 1,
0.9638988, 0.593222, -1.617027, 0.972549, 0, 1, 1,
0.9686315, 0.6389746, 1.273148, 0.9803922, 0, 1, 1,
0.9702007, -0.5652143, 2.85465, 0.9843137, 0, 1, 1,
0.9714105, 0.1845836, 1.200011, 0.9921569, 0, 1, 1,
0.9863345, -0.4671797, 2.297485, 0.9960784, 0, 1, 1,
0.988562, 0.959357, 0.6744324, 1, 0, 0.9960784, 1,
1.01205, -0.7669393, 3.373611, 1, 0, 0.9882353, 1,
1.014217, -0.459648, 3.781181, 1, 0, 0.9843137, 1,
1.015118, 1.10911, 1.375452, 1, 0, 0.9764706, 1,
1.020525, -0.5251274, 0.1179196, 1, 0, 0.972549, 1,
1.021721, 0.1141611, 2.305761, 1, 0, 0.9647059, 1,
1.021823, -1.025926, 1.905946, 1, 0, 0.9607843, 1,
1.027315, -1.005567, 2.158433, 1, 0, 0.9529412, 1,
1.034024, -1.774549, 2.167073, 1, 0, 0.9490196, 1,
1.038129, -1.41859, 3.747662, 1, 0, 0.9411765, 1,
1.041745, 2.14236, -0.307811, 1, 0, 0.9372549, 1,
1.043144, 2.325238, 2.619865, 1, 0, 0.9294118, 1,
1.047891, 0.7151691, 1.652609, 1, 0, 0.9254902, 1,
1.0502, 1.259413, 1.563935, 1, 0, 0.9176471, 1,
1.050367, -0.9494168, 1.762997, 1, 0, 0.9137255, 1,
1.052577, 0.6428517, -0.3197704, 1, 0, 0.9058824, 1,
1.05267, -1.460879, 1.523591, 1, 0, 0.9019608, 1,
1.06122, -0.9787655, 3.413933, 1, 0, 0.8941177, 1,
1.068013, -2.494738, 2.414289, 1, 0, 0.8862745, 1,
1.068481, -0.8117023, 3.418806, 1, 0, 0.8823529, 1,
1.078461, -0.7080513, 2.956463, 1, 0, 0.8745098, 1,
1.078773, -1.799033, 3.436774, 1, 0, 0.8705882, 1,
1.08452, 0.4051715, 0.5834348, 1, 0, 0.8627451, 1,
1.084912, -0.5533422, 1.312978, 1, 0, 0.8588235, 1,
1.086759, -1.307922, 2.187683, 1, 0, 0.8509804, 1,
1.088425, 0.7823378, 0.7216862, 1, 0, 0.8470588, 1,
1.09025, 0.0752607, 0.4378445, 1, 0, 0.8392157, 1,
1.093521, -1.017449, -0.1587065, 1, 0, 0.8352941, 1,
1.100156, 0.2186486, -0.2825464, 1, 0, 0.827451, 1,
1.104757, 0.8418568, 1.204169, 1, 0, 0.8235294, 1,
1.112607, 0.2856216, 0.5905359, 1, 0, 0.8156863, 1,
1.120871, -0.4925071, 4.487173, 1, 0, 0.8117647, 1,
1.12796, -0.3395602, 0.9792346, 1, 0, 0.8039216, 1,
1.133104, -0.2459305, 1.081764, 1, 0, 0.7960784, 1,
1.13634, -0.476216, 2.37721, 1, 0, 0.7921569, 1,
1.138153, 0.2443534, 1.959239, 1, 0, 0.7843137, 1,
1.138311, -0.7153073, 1.3555, 1, 0, 0.7803922, 1,
1.140858, -1.465268, 2.177038, 1, 0, 0.772549, 1,
1.14109, -0.08755548, 2.037639, 1, 0, 0.7686275, 1,
1.142832, 0.5954075, 1.194774, 1, 0, 0.7607843, 1,
1.147901, 0.4269873, 0.579209, 1, 0, 0.7568628, 1,
1.152153, -0.5684831, 2.922709, 1, 0, 0.7490196, 1,
1.153236, 0.1142404, -0.4953897, 1, 0, 0.7450981, 1,
1.161843, -0.1266139, 0.1328526, 1, 0, 0.7372549, 1,
1.171866, -0.04823868, 2.537584, 1, 0, 0.7333333, 1,
1.176223, 0.01776525, 2.516545, 1, 0, 0.7254902, 1,
1.184203, -1.376407, 1.671272, 1, 0, 0.7215686, 1,
1.195816, 1.414276, 0.6591256, 1, 0, 0.7137255, 1,
1.215053, 0.06420755, 1.057228, 1, 0, 0.7098039, 1,
1.232705, -0.09354816, 2.287491, 1, 0, 0.7019608, 1,
1.235388, -0.01083503, -0.3316334, 1, 0, 0.6941177, 1,
1.238699, -0.3211439, 1.370452, 1, 0, 0.6901961, 1,
1.252065, -1.162654, 1.245291, 1, 0, 0.682353, 1,
1.259352, 1.72952, -0.4249677, 1, 0, 0.6784314, 1,
1.263937, 1.472116, 0.6723524, 1, 0, 0.6705883, 1,
1.266236, 0.4039384, -0.5363539, 1, 0, 0.6666667, 1,
1.269772, 1.793526, 0.1678574, 1, 0, 0.6588235, 1,
1.275115, -0.4869278, 0.6447998, 1, 0, 0.654902, 1,
1.277078, 0.08875979, -0.18362, 1, 0, 0.6470588, 1,
1.277248, 0.2093117, 0.151108, 1, 0, 0.6431373, 1,
1.277757, -0.1226218, 1.360518, 1, 0, 0.6352941, 1,
1.284193, 2.285708, 0.9892601, 1, 0, 0.6313726, 1,
1.297634, 0.1554608, 1.500525, 1, 0, 0.6235294, 1,
1.301107, 0.08789738, 0.4043384, 1, 0, 0.6196079, 1,
1.304688, -0.8798138, 2.393999, 1, 0, 0.6117647, 1,
1.306579, 1.528689, 2.274308, 1, 0, 0.6078432, 1,
1.307896, -1.348548, 0.6283999, 1, 0, 0.6, 1,
1.327013, -0.158989, 1.551731, 1, 0, 0.5921569, 1,
1.335151, -0.8137764, 1.247803, 1, 0, 0.5882353, 1,
1.350473, -1.70814, 3.04419, 1, 0, 0.5803922, 1,
1.36167, -1.318877, -0.1830091, 1, 0, 0.5764706, 1,
1.382711, -0.7971467, 2.636845, 1, 0, 0.5686275, 1,
1.390368, 0.4239221, 0.9830467, 1, 0, 0.5647059, 1,
1.390492, 1.25883, -0.02286927, 1, 0, 0.5568628, 1,
1.399442, 0.3668547, 2.077802, 1, 0, 0.5529412, 1,
1.408776, -0.9107376, 1.538083, 1, 0, 0.5450981, 1,
1.414547, -0.5175794, 1.294804, 1, 0, 0.5411765, 1,
1.423785, 0.5187348, 0.7970811, 1, 0, 0.5333334, 1,
1.432673, -0.5683311, 1.213487, 1, 0, 0.5294118, 1,
1.438617, 1.095197, 0.4940318, 1, 0, 0.5215687, 1,
1.443472, 0.4372272, 0.7527206, 1, 0, 0.5176471, 1,
1.444574, 1.175412, 1.444741, 1, 0, 0.509804, 1,
1.449518, -0.5327846, 2.081532, 1, 0, 0.5058824, 1,
1.450605, 1.292015, -0.0989589, 1, 0, 0.4980392, 1,
1.453988, 0.08883473, 0.4195591, 1, 0, 0.4901961, 1,
1.456758, 0.8086984, 2.276313, 1, 0, 0.4862745, 1,
1.458629, 0.08842133, 2.179886, 1, 0, 0.4784314, 1,
1.459895, 0.2885543, 1.574261, 1, 0, 0.4745098, 1,
1.462422, 0.9803144, 1.15909, 1, 0, 0.4666667, 1,
1.474556, -0.2967498, -0.8513202, 1, 0, 0.4627451, 1,
1.479764, -1.069908, 3.523186, 1, 0, 0.454902, 1,
1.484283, 0.7016432, 2.102739, 1, 0, 0.4509804, 1,
1.492654, -1.405167, 2.018357, 1, 0, 0.4431373, 1,
1.495113, 0.2311853, 1.57857, 1, 0, 0.4392157, 1,
1.505842, -0.8524473, 2.764863, 1, 0, 0.4313726, 1,
1.507888, -0.7222344, 1.437047, 1, 0, 0.427451, 1,
1.509579, 0.7808319, 1.729649, 1, 0, 0.4196078, 1,
1.523739, -0.7502993, 1.407497, 1, 0, 0.4156863, 1,
1.524071, 0.04933633, 2.283212, 1, 0, 0.4078431, 1,
1.532217, -0.2058035, 1.993361, 1, 0, 0.4039216, 1,
1.548393, -0.3742667, 1.414787, 1, 0, 0.3960784, 1,
1.548604, 0.2833025, 2.83394, 1, 0, 0.3882353, 1,
1.551331, -0.4071741, 1.737182, 1, 0, 0.3843137, 1,
1.554164, 0.8079555, -0.02573927, 1, 0, 0.3764706, 1,
1.555526, 0.7443574, -0.5470498, 1, 0, 0.372549, 1,
1.556072, 0.6590576, 1.611803, 1, 0, 0.3647059, 1,
1.571155, 0.626658, 0.8809618, 1, 0, 0.3607843, 1,
1.579086, -0.3628498, 1.967571, 1, 0, 0.3529412, 1,
1.593127, 1.071757, 1.624148, 1, 0, 0.3490196, 1,
1.595612, 0.1776247, 1.510662, 1, 0, 0.3411765, 1,
1.609479, 1.346853, 0.907033, 1, 0, 0.3372549, 1,
1.619119, -1.054101, 2.47955, 1, 0, 0.3294118, 1,
1.627481, -0.8526886, 1.373146, 1, 0, 0.3254902, 1,
1.628574, -1.04227, 1.938957, 1, 0, 0.3176471, 1,
1.629925, 1.281594, -1.29842, 1, 0, 0.3137255, 1,
1.631923, 2.26002, 1.158996, 1, 0, 0.3058824, 1,
1.633012, -0.8708158, 2.508438, 1, 0, 0.2980392, 1,
1.651535, 1.830085, 2.115972, 1, 0, 0.2941177, 1,
1.651817, 0.4465316, 2.653262, 1, 0, 0.2862745, 1,
1.667349, 0.5209506, 1.137337, 1, 0, 0.282353, 1,
1.67034, -0.2808753, 1.392318, 1, 0, 0.2745098, 1,
1.683657, 0.3373469, 0.2534883, 1, 0, 0.2705882, 1,
1.684445, 0.8189568, 0.9840548, 1, 0, 0.2627451, 1,
1.686107, 1.240086, 0.8564216, 1, 0, 0.2588235, 1,
1.688929, 0.5159459, 0.9781534, 1, 0, 0.2509804, 1,
1.699116, -0.07549299, 0.7432081, 1, 0, 0.2470588, 1,
1.718722, 0.62945, -0.1223098, 1, 0, 0.2392157, 1,
1.726293, -0.557727, 3.843947, 1, 0, 0.2352941, 1,
1.726423, 0.9234977, 0.7804499, 1, 0, 0.227451, 1,
1.730778, -0.3767023, 2.563646, 1, 0, 0.2235294, 1,
1.732306, 0.3959258, 2.994169, 1, 0, 0.2156863, 1,
1.733167, -1.718944, 2.641404, 1, 0, 0.2117647, 1,
1.735557, -1.443014, 2.143677, 1, 0, 0.2039216, 1,
1.743655, 1.003266, 2.401573, 1, 0, 0.1960784, 1,
1.745543, 0.7805867, 0.5913024, 1, 0, 0.1921569, 1,
1.747154, 0.6415545, 1.877337, 1, 0, 0.1843137, 1,
1.749679, 1.750986, 0.2078166, 1, 0, 0.1803922, 1,
1.750795, -0.9328251, 3.039037, 1, 0, 0.172549, 1,
1.759145, 0.4566047, 2.204911, 1, 0, 0.1686275, 1,
1.807956, 0.07571273, 1.050672, 1, 0, 0.1607843, 1,
1.810746, -0.98996, 1.915918, 1, 0, 0.1568628, 1,
1.816654, 1.434794, 1.88014, 1, 0, 0.1490196, 1,
1.903773, -0.4077665, 3.950443, 1, 0, 0.145098, 1,
1.912573, -2.401876, 2.312152, 1, 0, 0.1372549, 1,
1.945396, -1.076511, 1.310955, 1, 0, 0.1333333, 1,
1.998898, -0.6325083, 1.474598, 1, 0, 0.1254902, 1,
2.017289, 0.7427471, 0.4611367, 1, 0, 0.1215686, 1,
2.019176, 1.865091, 0.3194506, 1, 0, 0.1137255, 1,
2.034893, 1.393242, 0.5519543, 1, 0, 0.1098039, 1,
2.035886, -0.3832434, 1.929006, 1, 0, 0.1019608, 1,
2.076579, -0.05995653, 1.97934, 1, 0, 0.09411765, 1,
2.137084, 0.7226231, 1.02202, 1, 0, 0.09019608, 1,
2.146919, -1.137126, 2.471204, 1, 0, 0.08235294, 1,
2.163143, 0.5722563, 1.252707, 1, 0, 0.07843138, 1,
2.173879, 0.3589101, 2.356784, 1, 0, 0.07058824, 1,
2.235485, -0.1960547, 0.6646913, 1, 0, 0.06666667, 1,
2.278151, 1.083759, 2.076007, 1, 0, 0.05882353, 1,
2.315189, 0.09654945, 1.379977, 1, 0, 0.05490196, 1,
2.399272, 1.598634, 0.6993548, 1, 0, 0.04705882, 1,
2.40905, -0.4980457, 1.802149, 1, 0, 0.04313726, 1,
2.428046, -0.8765365, 0.8336316, 1, 0, 0.03529412, 1,
2.478752, -0.6895285, 0.8849827, 1, 0, 0.03137255, 1,
2.591969, -0.7249062, 1.319285, 1, 0, 0.02352941, 1,
2.81801, -1.761054, 2.694443, 1, 0, 0.01960784, 1,
2.818583, 0.2832843, 1.025757, 1, 0, 0.01176471, 1,
2.863557, -0.8536949, 1.855012, 1, 0, 0.007843138, 1
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
-0.3844212, -4.450122, -7.045151, 0, -0.5, 0.5, 0.5,
-0.3844212, -4.450122, -7.045151, 1, -0.5, 0.5, 0.5,
-0.3844212, -4.450122, -7.045151, 1, 1.5, 0.5, 0.5,
-0.3844212, -4.450122, -7.045151, 0, 1.5, 0.5, 0.5
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
-4.733464, -0.1830018, -7.045151, 0, -0.5, 0.5, 0.5,
-4.733464, -0.1830018, -7.045151, 1, -0.5, 0.5, 0.5,
-4.733464, -0.1830018, -7.045151, 1, 1.5, 0.5, 0.5,
-4.733464, -0.1830018, -7.045151, 0, 1.5, 0.5, 0.5
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
-4.733464, -4.450122, -0.2413864, 0, -0.5, 0.5, 0.5,
-4.733464, -4.450122, -0.2413864, 1, -0.5, 0.5, 0.5,
-4.733464, -4.450122, -0.2413864, 1, 1.5, 0.5, 0.5,
-4.733464, -4.450122, -0.2413864, 0, 1.5, 0.5, 0.5
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
-3, -3.465402, -5.475051,
2, -3.465402, -5.475051,
-3, -3.465402, -5.475051,
-3, -3.629522, -5.736735,
-2, -3.465402, -5.475051,
-2, -3.629522, -5.736735,
-1, -3.465402, -5.475051,
-1, -3.629522, -5.736735,
0, -3.465402, -5.475051,
0, -3.629522, -5.736735,
1, -3.465402, -5.475051,
1, -3.629522, -5.736735,
2, -3.465402, -5.475051,
2, -3.629522, -5.736735
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
-3, -3.957762, -6.260101, 0, -0.5, 0.5, 0.5,
-3, -3.957762, -6.260101, 1, -0.5, 0.5, 0.5,
-3, -3.957762, -6.260101, 1, 1.5, 0.5, 0.5,
-3, -3.957762, -6.260101, 0, 1.5, 0.5, 0.5,
-2, -3.957762, -6.260101, 0, -0.5, 0.5, 0.5,
-2, -3.957762, -6.260101, 1, -0.5, 0.5, 0.5,
-2, -3.957762, -6.260101, 1, 1.5, 0.5, 0.5,
-2, -3.957762, -6.260101, 0, 1.5, 0.5, 0.5,
-1, -3.957762, -6.260101, 0, -0.5, 0.5, 0.5,
-1, -3.957762, -6.260101, 1, -0.5, 0.5, 0.5,
-1, -3.957762, -6.260101, 1, 1.5, 0.5, 0.5,
-1, -3.957762, -6.260101, 0, 1.5, 0.5, 0.5,
0, -3.957762, -6.260101, 0, -0.5, 0.5, 0.5,
0, -3.957762, -6.260101, 1, -0.5, 0.5, 0.5,
0, -3.957762, -6.260101, 1, 1.5, 0.5, 0.5,
0, -3.957762, -6.260101, 0, 1.5, 0.5, 0.5,
1, -3.957762, -6.260101, 0, -0.5, 0.5, 0.5,
1, -3.957762, -6.260101, 1, -0.5, 0.5, 0.5,
1, -3.957762, -6.260101, 1, 1.5, 0.5, 0.5,
1, -3.957762, -6.260101, 0, 1.5, 0.5, 0.5,
2, -3.957762, -6.260101, 0, -0.5, 0.5, 0.5,
2, -3.957762, -6.260101, 1, -0.5, 0.5, 0.5,
2, -3.957762, -6.260101, 1, 1.5, 0.5, 0.5,
2, -3.957762, -6.260101, 0, 1.5, 0.5, 0.5
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
-3.729839, -3, -5.475051,
-3.729839, 3, -5.475051,
-3.729839, -3, -5.475051,
-3.89711, -3, -5.736735,
-3.729839, -2, -5.475051,
-3.89711, -2, -5.736735,
-3.729839, -1, -5.475051,
-3.89711, -1, -5.736735,
-3.729839, 0, -5.475051,
-3.89711, 0, -5.736735,
-3.729839, 1, -5.475051,
-3.89711, 1, -5.736735,
-3.729839, 2, -5.475051,
-3.89711, 2, -5.736735,
-3.729839, 3, -5.475051,
-3.89711, 3, -5.736735
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
-4.231651, -3, -6.260101, 0, -0.5, 0.5, 0.5,
-4.231651, -3, -6.260101, 1, -0.5, 0.5, 0.5,
-4.231651, -3, -6.260101, 1, 1.5, 0.5, 0.5,
-4.231651, -3, -6.260101, 0, 1.5, 0.5, 0.5,
-4.231651, -2, -6.260101, 0, -0.5, 0.5, 0.5,
-4.231651, -2, -6.260101, 1, -0.5, 0.5, 0.5,
-4.231651, -2, -6.260101, 1, 1.5, 0.5, 0.5,
-4.231651, -2, -6.260101, 0, 1.5, 0.5, 0.5,
-4.231651, -1, -6.260101, 0, -0.5, 0.5, 0.5,
-4.231651, -1, -6.260101, 1, -0.5, 0.5, 0.5,
-4.231651, -1, -6.260101, 1, 1.5, 0.5, 0.5,
-4.231651, -1, -6.260101, 0, 1.5, 0.5, 0.5,
-4.231651, 0, -6.260101, 0, -0.5, 0.5, 0.5,
-4.231651, 0, -6.260101, 1, -0.5, 0.5, 0.5,
-4.231651, 0, -6.260101, 1, 1.5, 0.5, 0.5,
-4.231651, 0, -6.260101, 0, 1.5, 0.5, 0.5,
-4.231651, 1, -6.260101, 0, -0.5, 0.5, 0.5,
-4.231651, 1, -6.260101, 1, -0.5, 0.5, 0.5,
-4.231651, 1, -6.260101, 1, 1.5, 0.5, 0.5,
-4.231651, 1, -6.260101, 0, 1.5, 0.5, 0.5,
-4.231651, 2, -6.260101, 0, -0.5, 0.5, 0.5,
-4.231651, 2, -6.260101, 1, -0.5, 0.5, 0.5,
-4.231651, 2, -6.260101, 1, 1.5, 0.5, 0.5,
-4.231651, 2, -6.260101, 0, 1.5, 0.5, 0.5,
-4.231651, 3, -6.260101, 0, -0.5, 0.5, 0.5,
-4.231651, 3, -6.260101, 1, -0.5, 0.5, 0.5,
-4.231651, 3, -6.260101, 1, 1.5, 0.5, 0.5,
-4.231651, 3, -6.260101, 0, 1.5, 0.5, 0.5
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
-3.729839, -3.465402, -4,
-3.729839, -3.465402, 4,
-3.729839, -3.465402, -4,
-3.89711, -3.629522, -4,
-3.729839, -3.465402, -2,
-3.89711, -3.629522, -2,
-3.729839, -3.465402, 0,
-3.89711, -3.629522, 0,
-3.729839, -3.465402, 2,
-3.89711, -3.629522, 2,
-3.729839, -3.465402, 4,
-3.89711, -3.629522, 4
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
-4.231651, -3.957762, -4, 0, -0.5, 0.5, 0.5,
-4.231651, -3.957762, -4, 1, -0.5, 0.5, 0.5,
-4.231651, -3.957762, -4, 1, 1.5, 0.5, 0.5,
-4.231651, -3.957762, -4, 0, 1.5, 0.5, 0.5,
-4.231651, -3.957762, -2, 0, -0.5, 0.5, 0.5,
-4.231651, -3.957762, -2, 1, -0.5, 0.5, 0.5,
-4.231651, -3.957762, -2, 1, 1.5, 0.5, 0.5,
-4.231651, -3.957762, -2, 0, 1.5, 0.5, 0.5,
-4.231651, -3.957762, 0, 0, -0.5, 0.5, 0.5,
-4.231651, -3.957762, 0, 1, -0.5, 0.5, 0.5,
-4.231651, -3.957762, 0, 1, 1.5, 0.5, 0.5,
-4.231651, -3.957762, 0, 0, 1.5, 0.5, 0.5,
-4.231651, -3.957762, 2, 0, -0.5, 0.5, 0.5,
-4.231651, -3.957762, 2, 1, -0.5, 0.5, 0.5,
-4.231651, -3.957762, 2, 1, 1.5, 0.5, 0.5,
-4.231651, -3.957762, 2, 0, 1.5, 0.5, 0.5,
-4.231651, -3.957762, 4, 0, -0.5, 0.5, 0.5,
-4.231651, -3.957762, 4, 1, -0.5, 0.5, 0.5,
-4.231651, -3.957762, 4, 1, 1.5, 0.5, 0.5,
-4.231651, -3.957762, 4, 0, 1.5, 0.5, 0.5
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
-3.729839, -3.465402, -5.475051,
-3.729839, 3.099399, -5.475051,
-3.729839, -3.465402, 4.992279,
-3.729839, 3.099399, 4.992279,
-3.729839, -3.465402, -5.475051,
-3.729839, -3.465402, 4.992279,
-3.729839, 3.099399, -5.475051,
-3.729839, 3.099399, 4.992279,
-3.729839, -3.465402, -5.475051,
2.960996, -3.465402, -5.475051,
-3.729839, -3.465402, 4.992279,
2.960996, -3.465402, 4.992279,
-3.729839, 3.099399, -5.475051,
2.960996, 3.099399, -5.475051,
-3.729839, 3.099399, 4.992279,
2.960996, 3.099399, 4.992279,
2.960996, -3.465402, -5.475051,
2.960996, 3.099399, -5.475051,
2.960996, -3.465402, 4.992279,
2.960996, 3.099399, 4.992279,
2.960996, -3.465402, -5.475051,
2.960996, -3.465402, 4.992279,
2.960996, 3.099399, -5.475051,
2.960996, 3.099399, 4.992279
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
var radius = 7.502929;
var distance = 33.38138;
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
mvMatrix.translate( 0.3844212, 0.1830018, 0.2413864 );
mvMatrix.scale( 1.212452, 1.235729, 0.7750127 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.38138);
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
fluchloralin<-read.table("fluchloralin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluchloralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluchloralin' not found
```

```r
y<-fluchloralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluchloralin' not found
```

```r
z<-fluchloralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluchloralin' not found
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
-3.632399, 0.1457427, -2.218721, 0, 0, 1, 1, 1,
-3.037259, -0.9842871, -1.541548, 1, 0, 0, 1, 1,
-2.83934, -0.07223316, -3.030916, 1, 0, 0, 1, 1,
-2.616244, -0.7122155, -2.828208, 1, 0, 0, 1, 1,
-2.582672, -1.11921, -1.805521, 1, 0, 0, 1, 1,
-2.532374, 0.5537595, -1.797736, 1, 0, 0, 1, 1,
-2.457293, 0.5133515, -3.015498, 0, 0, 0, 1, 1,
-2.454872, -0.2357859, -0.7517807, 0, 0, 0, 1, 1,
-2.420859, -0.1611503, -0.6139488, 0, 0, 0, 1, 1,
-2.368334, -0.9768782, -1.217193, 0, 0, 0, 1, 1,
-2.315745, -1.0922, -1.954011, 0, 0, 0, 1, 1,
-2.310984, 1.469919, 0.7684894, 0, 0, 0, 1, 1,
-2.285283, -0.5417446, -2.927609, 0, 0, 0, 1, 1,
-2.240579, -0.5286103, -1.405155, 1, 1, 1, 1, 1,
-2.227551, -0.184525, -2.143657, 1, 1, 1, 1, 1,
-2.224859, -2.05951, -0.8235726, 1, 1, 1, 1, 1,
-2.1441, -0.463452, 0.5563594, 1, 1, 1, 1, 1,
-2.13919, -0.2292755, -2.690926, 1, 1, 1, 1, 1,
-2.127049, -1.365137, -1.895191, 1, 1, 1, 1, 1,
-2.118951, 1.44299, 0.7039974, 1, 1, 1, 1, 1,
-2.101149, -0.2073969, -2.499636, 1, 1, 1, 1, 1,
-2.091117, -1.334293, -1.961969, 1, 1, 1, 1, 1,
-2.056641, 0.6553729, -1.040165, 1, 1, 1, 1, 1,
-2.050694, -0.1220138, -0.3189098, 1, 1, 1, 1, 1,
-2.043556, 0.1242654, -2.311045, 1, 1, 1, 1, 1,
-2.041083, -0.2776034, -0.8894472, 1, 1, 1, 1, 1,
-2.0376, -0.7927441, -3.462131, 1, 1, 1, 1, 1,
-1.994845, -0.5519591, -0.6619374, 1, 1, 1, 1, 1,
-1.977215, -0.3878034, -3.414074, 0, 0, 1, 1, 1,
-1.943256, 0.03097509, -2.875574, 1, 0, 0, 1, 1,
-1.916855, 0.02566186, 0.2277911, 1, 0, 0, 1, 1,
-1.877668, 0.6629593, 1.198169, 1, 0, 0, 1, 1,
-1.868117, 0.09354398, -0.3428038, 1, 0, 0, 1, 1,
-1.866298, -1.165534, -1.01844, 1, 0, 0, 1, 1,
-1.860795, 0.379061, -0.8944159, 0, 0, 0, 1, 1,
-1.851703, -0.7084002, -3.692735, 0, 0, 0, 1, 1,
-1.839969, -0.4149354, -1.536795, 0, 0, 0, 1, 1,
-1.837296, -1.007026, -0.1638391, 0, 0, 0, 1, 1,
-1.832767, 1.227449, -1.22274, 0, 0, 0, 1, 1,
-1.819509, 1.094025, 0.5892229, 0, 0, 0, 1, 1,
-1.811605, -0.3859311, -1.380736, 0, 0, 0, 1, 1,
-1.810271, 0.02779366, -0.1214158, 1, 1, 1, 1, 1,
-1.80862, 0.8400046, 0.6855704, 1, 1, 1, 1, 1,
-1.802574, 0.1362412, -1.446294, 1, 1, 1, 1, 1,
-1.788826, -0.9558372, -4.34779, 1, 1, 1, 1, 1,
-1.786382, 1.502065, -4.910054, 1, 1, 1, 1, 1,
-1.782864, -1.839533, -2.056285, 1, 1, 1, 1, 1,
-1.780289, 1.931677, 0.50881, 1, 1, 1, 1, 1,
-1.767139, -1.894767, -2.136294, 1, 1, 1, 1, 1,
-1.766907, -0.300523, -1.54472, 1, 1, 1, 1, 1,
-1.761163, 2.335034, -1.695134, 1, 1, 1, 1, 1,
-1.75587, -1.095141, -4.368412, 1, 1, 1, 1, 1,
-1.751942, -0.209872, -1.757446, 1, 1, 1, 1, 1,
-1.743036, -0.1879169, -1.199508, 1, 1, 1, 1, 1,
-1.73138, 1.285071, -2.350638, 1, 1, 1, 1, 1,
-1.710293, 1.63694, -1.897406, 1, 1, 1, 1, 1,
-1.700593, 1.227564, -2.202238, 0, 0, 1, 1, 1,
-1.696865, 1.260472, -1.444525, 1, 0, 0, 1, 1,
-1.67341, -0.6673227, -2.280997, 1, 0, 0, 1, 1,
-1.670906, 0.5886974, -0.590323, 1, 0, 0, 1, 1,
-1.65878, -0.4502178, -0.5715883, 1, 0, 0, 1, 1,
-1.654809, 0.6928322, -2.22592, 1, 0, 0, 1, 1,
-1.646217, 0.1833777, -2.053159, 0, 0, 0, 1, 1,
-1.642515, 0.287295, -1.341952, 0, 0, 0, 1, 1,
-1.637457, 1.298452, -1.901671, 0, 0, 0, 1, 1,
-1.637058, -1.269097, -3.713302, 0, 0, 0, 1, 1,
-1.633122, -1.845758, -4.697497, 0, 0, 0, 1, 1,
-1.595239, 1.76323, 0.2385273, 0, 0, 0, 1, 1,
-1.589822, 0.4563264, -0.7977291, 0, 0, 0, 1, 1,
-1.588515, 1.354854, -0.2249691, 1, 1, 1, 1, 1,
-1.585322, 0.7427041, -2.739838, 1, 1, 1, 1, 1,
-1.579747, 0.7003977, -0.7940059, 1, 1, 1, 1, 1,
-1.578952, 1.350992, 0.08161378, 1, 1, 1, 1, 1,
-1.572463, -0.4557317, -2.530668, 1, 1, 1, 1, 1,
-1.563694, 1.092485, 0.9685947, 1, 1, 1, 1, 1,
-1.533525, -0.0120145, -1.509396, 1, 1, 1, 1, 1,
-1.529437, 0.8445512, -0.4933159, 1, 1, 1, 1, 1,
-1.528325, 1.422262, -1.198074, 1, 1, 1, 1, 1,
-1.514855, -0.1831607, -2.324764, 1, 1, 1, 1, 1,
-1.500552, 0.05322732, -0.3435643, 1, 1, 1, 1, 1,
-1.498986, 0.338308, -1.84873, 1, 1, 1, 1, 1,
-1.495237, -0.5925708, -2.131673, 1, 1, 1, 1, 1,
-1.478575, -0.426543, -2.367371, 1, 1, 1, 1, 1,
-1.476521, 0.2212154, -1.330014, 1, 1, 1, 1, 1,
-1.470199, 0.7893894, -0.3726854, 0, 0, 1, 1, 1,
-1.462412, -2.336734, -0.981621, 1, 0, 0, 1, 1,
-1.459893, -0.4183613, -1.141033, 1, 0, 0, 1, 1,
-1.453256, -1.570239, -2.340205, 1, 0, 0, 1, 1,
-1.440636, -0.2461262, -1.440294, 1, 0, 0, 1, 1,
-1.43651, 0.8420671, 0.03284572, 1, 0, 0, 1, 1,
-1.433283, -1.340219, -1.685894, 0, 0, 0, 1, 1,
-1.426011, 0.7535196, -0.6453635, 0, 0, 0, 1, 1,
-1.417436, 0.1230304, -0.3786048, 0, 0, 0, 1, 1,
-1.41568, 1.145755, -0.005558362, 0, 0, 0, 1, 1,
-1.404876, 0.4138194, 0.183046, 0, 0, 0, 1, 1,
-1.389299, 0.9590904, -0.427775, 0, 0, 0, 1, 1,
-1.386456, 1.484765, 0.08437762, 0, 0, 0, 1, 1,
-1.375858, -0.7028216, -0.3136368, 1, 1, 1, 1, 1,
-1.368901, -1.623101, -3.929119, 1, 1, 1, 1, 1,
-1.345225, -1.792683, -2.007793, 1, 1, 1, 1, 1,
-1.345151, -0.01081091, -2.103377, 1, 1, 1, 1, 1,
-1.334707, 0.3061765, -2.014918, 1, 1, 1, 1, 1,
-1.326448, 1.26733, -0.847411, 1, 1, 1, 1, 1,
-1.324467, -0.06324842, -0.5774326, 1, 1, 1, 1, 1,
-1.319725, 0.9009099, -2.472831, 1, 1, 1, 1, 1,
-1.316342, -0.01191358, -1.934181, 1, 1, 1, 1, 1,
-1.312737, 0.554747, -0.07024805, 1, 1, 1, 1, 1,
-1.30387, 1.204206, -0.2027578, 1, 1, 1, 1, 1,
-1.302711, -0.0745626, -1.258464, 1, 1, 1, 1, 1,
-1.299839, 1.189513, -1.004438, 1, 1, 1, 1, 1,
-1.296314, -0.2173119, -1.87669, 1, 1, 1, 1, 1,
-1.293773, -0.7052216, -3.131274, 1, 1, 1, 1, 1,
-1.285761, -1.713147, -2.107209, 0, 0, 1, 1, 1,
-1.280378, -2.63394, -2.350709, 1, 0, 0, 1, 1,
-1.273116, -0.1493445, -1.653408, 1, 0, 0, 1, 1,
-1.269848, 0.89925, -1.255761, 1, 0, 0, 1, 1,
-1.259481, 1.198976, 0.9643995, 1, 0, 0, 1, 1,
-1.255949, 0.1306963, -0.9425475, 1, 0, 0, 1, 1,
-1.237908, -0.3187781, -0.6801194, 0, 0, 0, 1, 1,
-1.236042, -0.1869758, -1.226405, 0, 0, 0, 1, 1,
-1.220244, -0.2061994, -2.540784, 0, 0, 0, 1, 1,
-1.218299, -1.25862, -2.620415, 0, 0, 0, 1, 1,
-1.211274, 0.04616056, -2.116579, 0, 0, 0, 1, 1,
-1.207191, 0.9298043, -2.089714, 0, 0, 0, 1, 1,
-1.201025, -0.009598117, -1.926322, 0, 0, 0, 1, 1,
-1.198002, -1.60972, -2.863375, 1, 1, 1, 1, 1,
-1.194319, 1.37651, 0.292963, 1, 1, 1, 1, 1,
-1.19353, 0.8847752, -0.3565866, 1, 1, 1, 1, 1,
-1.18027, 0.509134, -1.56837, 1, 1, 1, 1, 1,
-1.173099, 1.106324, -2.083339, 1, 1, 1, 1, 1,
-1.172438, -0.1616489, -2.002255, 1, 1, 1, 1, 1,
-1.171474, -0.2455898, -3.881167, 1, 1, 1, 1, 1,
-1.166467, 0.1446566, -2.948219, 1, 1, 1, 1, 1,
-1.159242, 1.747726, -2.188142, 1, 1, 1, 1, 1,
-1.155042, 2.369262, -0.5005973, 1, 1, 1, 1, 1,
-1.15307, -1.183304, -1.875016, 1, 1, 1, 1, 1,
-1.146157, 1.715584, -1.985826, 1, 1, 1, 1, 1,
-1.136239, 0.4164999, -2.594282, 1, 1, 1, 1, 1,
-1.131795, 1.087546, -0.6595545, 1, 1, 1, 1, 1,
-1.122377, 0.03233928, -1.050964, 1, 1, 1, 1, 1,
-1.116784, -0.5020241, -2.850125, 0, 0, 1, 1, 1,
-1.112469, 0.2560925, -0.3758721, 1, 0, 0, 1, 1,
-1.102922, 0.9451674, -1.10011, 1, 0, 0, 1, 1,
-1.094219, 0.05558228, -1.516867, 1, 0, 0, 1, 1,
-1.093947, -0.8164978, -3.079768, 1, 0, 0, 1, 1,
-1.09338, 0.1577913, -1.198743, 1, 0, 0, 1, 1,
-1.092052, 0.1167839, -2.054086, 0, 0, 0, 1, 1,
-1.081558, -0.3079329, -1.808073, 0, 0, 0, 1, 1,
-1.079694, 1.850625, -1.059619, 0, 0, 0, 1, 1,
-1.078624, -0.1972222, -3.50021, 0, 0, 0, 1, 1,
-1.078285, 0.4182619, -0.8012078, 0, 0, 0, 1, 1,
-1.075971, 0.3372828, -1.416795, 0, 0, 0, 1, 1,
-1.071937, -0.8955056, -4.08, 0, 0, 0, 1, 1,
-1.067349, -1.360434, -2.330663, 1, 1, 1, 1, 1,
-1.065183, 1.28983, -0.3549399, 1, 1, 1, 1, 1,
-1.05748, 0.03939016, 0.4281557, 1, 1, 1, 1, 1,
-1.048109, 1.202669, 0.8031594, 1, 1, 1, 1, 1,
-1.040249, 0.6284631, -1.011105, 1, 1, 1, 1, 1,
-1.029907, 0.4911186, -1.294322, 1, 1, 1, 1, 1,
-1.027236, -0.6266068, -2.247637, 1, 1, 1, 1, 1,
-1.025996, -0.431035, -1.420608, 1, 1, 1, 1, 1,
-1.021598, 1.685899, -0.008818616, 1, 1, 1, 1, 1,
-1.01877, -0.0141721, -1.285279, 1, 1, 1, 1, 1,
-1.017146, 0.1336536, -1.318467, 1, 1, 1, 1, 1,
-1.01241, -0.9040527, -2.315723, 1, 1, 1, 1, 1,
-1.001063, -0.7917235, -1.937235, 1, 1, 1, 1, 1,
-1.00052, 0.9698966, -3.689149, 1, 1, 1, 1, 1,
-1.000041, 0.849834, -0.03119645, 1, 1, 1, 1, 1,
-0.9944409, 0.6611073, -0.6315705, 0, 0, 1, 1, 1,
-0.9896721, -0.2902412, -1.279529, 1, 0, 0, 1, 1,
-0.9847586, 1.252148, -1.277396, 1, 0, 0, 1, 1,
-0.9785095, 0.07256614, -2.961685, 1, 0, 0, 1, 1,
-0.9682803, -1.954697, -3.681694, 1, 0, 0, 1, 1,
-0.9657496, 1.413435, -1.707325, 1, 0, 0, 1, 1,
-0.9647533, 0.4113439, 0.03981025, 0, 0, 0, 1, 1,
-0.9610928, -0.5567343, -2.312788, 0, 0, 0, 1, 1,
-0.9507079, -0.631815, -2.988584, 0, 0, 0, 1, 1,
-0.9488366, -0.666632, -1.85124, 0, 0, 0, 1, 1,
-0.9482827, -1.310449, -3.520374, 0, 0, 0, 1, 1,
-0.9473678, 1.610428, -0.9848366, 0, 0, 0, 1, 1,
-0.9421252, 0.6057239, -1.528337, 0, 0, 0, 1, 1,
-0.9215838, -0.4408904, -0.8737221, 1, 1, 1, 1, 1,
-0.905835, -1.319737, -3.886356, 1, 1, 1, 1, 1,
-0.9020818, 0.7683538, -2.154187, 1, 1, 1, 1, 1,
-0.9007653, -1.177508, -2.411135, 1, 1, 1, 1, 1,
-0.9006683, -0.8644489, -1.991142, 1, 1, 1, 1, 1,
-0.8981315, -2.131109, -1.537394, 1, 1, 1, 1, 1,
-0.8973701, -0.943671, -2.836952, 1, 1, 1, 1, 1,
-0.8949445, 1.144174, -0.9146795, 1, 1, 1, 1, 1,
-0.8940034, 0.711066, -1.003468, 1, 1, 1, 1, 1,
-0.8931326, -0.8402307, -2.956516, 1, 1, 1, 1, 1,
-0.8928261, -0.4092869, -0.5880672, 1, 1, 1, 1, 1,
-0.8885338, 2.60357, -1.077718, 1, 1, 1, 1, 1,
-0.8872806, 0.001573205, -2.318416, 1, 1, 1, 1, 1,
-0.8832937, 0.6923026, -0.8302771, 1, 1, 1, 1, 1,
-0.8750505, 1.452927, -0.6503713, 1, 1, 1, 1, 1,
-0.8702992, 1.599483, -0.2572376, 0, 0, 1, 1, 1,
-0.8684488, -0.3365783, -3.763136, 1, 0, 0, 1, 1,
-0.867991, -0.4084136, -2.512467, 1, 0, 0, 1, 1,
-0.8610643, 0.270604, -0.6369615, 1, 0, 0, 1, 1,
-0.857921, 0.4806874, -0.7074041, 1, 0, 0, 1, 1,
-0.8529816, 1.297032, 0.6351452, 1, 0, 0, 1, 1,
-0.8470091, -0.6132694, -2.287844, 0, 0, 0, 1, 1,
-0.8373169, -0.7416796, -2.108156, 0, 0, 0, 1, 1,
-0.8281979, 0.5479305, -1.151978, 0, 0, 0, 1, 1,
-0.8281045, -0.9016398, -3.668709, 0, 0, 0, 1, 1,
-0.8248141, 0.9302952, -1.059228, 0, 0, 0, 1, 1,
-0.8234244, 1.855421, 0.1599866, 0, 0, 0, 1, 1,
-0.8195068, -1.330247, -2.875745, 0, 0, 0, 1, 1,
-0.8189371, -1.471193, -3.751637, 1, 1, 1, 1, 1,
-0.8130311, 1.387373, -0.5821153, 1, 1, 1, 1, 1,
-0.8096859, 0.239363, -0.6724861, 1, 1, 1, 1, 1,
-0.8069665, 1.274421, -1.149058, 1, 1, 1, 1, 1,
-0.8037561, -0.7173291, -1.541184, 1, 1, 1, 1, 1,
-0.80076, -1.095052, -2.901724, 1, 1, 1, 1, 1,
-0.7975856, -0.3892733, -3.743742, 1, 1, 1, 1, 1,
-0.7962328, 0.1924511, 0.7929001, 1, 1, 1, 1, 1,
-0.7913252, -2.76132, -2.765922, 1, 1, 1, 1, 1,
-0.7893922, -0.4370279, -1.718645, 1, 1, 1, 1, 1,
-0.7878216, 0.5571325, 0.2148453, 1, 1, 1, 1, 1,
-0.7874633, 0.1268387, -1.924606, 1, 1, 1, 1, 1,
-0.7845792, -0.1929873, -3.229997, 1, 1, 1, 1, 1,
-0.7819032, -1.386874, -2.669604, 1, 1, 1, 1, 1,
-0.7758474, -1.468945, -4.160851, 1, 1, 1, 1, 1,
-0.7738296, -0.6502002, -1.920739, 0, 0, 1, 1, 1,
-0.7707248, 2.069801, -1.029521, 1, 0, 0, 1, 1,
-0.7667953, 0.09643374, -2.633366, 1, 0, 0, 1, 1,
-0.764385, 0.8685401, 1.361336, 1, 0, 0, 1, 1,
-0.7636128, 0.8880628, -0.1395621, 1, 0, 0, 1, 1,
-0.7611685, 0.7967275, -0.1554312, 1, 0, 0, 1, 1,
-0.7610927, -0.6671902, -3.659277, 0, 0, 0, 1, 1,
-0.7589013, 0.357979, -0.9980317, 0, 0, 0, 1, 1,
-0.7554265, 0.324174, -0.5131882, 0, 0, 0, 1, 1,
-0.7515084, -1.865738, -2.111564, 0, 0, 0, 1, 1,
-0.7456205, 0.1928325, -2.41754, 0, 0, 0, 1, 1,
-0.7393317, -0.6760511, -3.327656, 0, 0, 0, 1, 1,
-0.7335567, 0.02473357, -0.9386961, 0, 0, 0, 1, 1,
-0.7326184, 0.3852583, -1.163209, 1, 1, 1, 1, 1,
-0.7263644, -0.08161024, -3.436315, 1, 1, 1, 1, 1,
-0.7229679, -1.370922, -3.195876, 1, 1, 1, 1, 1,
-0.7156832, 1.291202, -0.2870742, 1, 1, 1, 1, 1,
-0.7084601, -0.4582278, -2.139241, 1, 1, 1, 1, 1,
-0.7009376, -0.8936768, -2.244444, 1, 1, 1, 1, 1,
-0.7005764, -0.1338645, -2.584318, 1, 1, 1, 1, 1,
-0.6941475, 0.3920604, -2.158419, 1, 1, 1, 1, 1,
-0.6917289, 1.193633, -0.3337737, 1, 1, 1, 1, 1,
-0.69126, 1.410553, -0.4039203, 1, 1, 1, 1, 1,
-0.6893151, 2.24433, 0.2322334, 1, 1, 1, 1, 1,
-0.6876933, -0.5520899, -2.757666, 1, 1, 1, 1, 1,
-0.6846825, 1.438121, -0.3765106, 1, 1, 1, 1, 1,
-0.6838198, -0.3553484, -3.744093, 1, 1, 1, 1, 1,
-0.6813609, -0.8442696, -3.097728, 1, 1, 1, 1, 1,
-0.6756982, -0.04272027, -2.505019, 0, 0, 1, 1, 1,
-0.6708795, 1.346407, -0.2844186, 1, 0, 0, 1, 1,
-0.6699456, 0.2809132, -0.5813946, 1, 0, 0, 1, 1,
-0.6697955, -0.564925, -3.309062, 1, 0, 0, 1, 1,
-0.6654246, 0.03003453, -0.7420421, 1, 0, 0, 1, 1,
-0.6553424, -1.373641, -2.294063, 1, 0, 0, 1, 1,
-0.6530092, 0.1441809, -2.724412, 0, 0, 0, 1, 1,
-0.6527554, 0.3916981, -0.1772243, 0, 0, 0, 1, 1,
-0.6511457, -0.6387554, -4.706567, 0, 0, 0, 1, 1,
-0.6486975, -0.8085963, -3.290287, 0, 0, 0, 1, 1,
-0.6459095, -0.2780063, -2.37979, 0, 0, 0, 1, 1,
-0.6431443, -1.420043, -2.105954, 0, 0, 0, 1, 1,
-0.640901, -0.7776636, -2.296995, 0, 0, 0, 1, 1,
-0.6378252, -0.8679605, -1.678895, 1, 1, 1, 1, 1,
-0.6363508, 0.5702595, -0.8833964, 1, 1, 1, 1, 1,
-0.6359491, -0.3346097, -0.1765822, 1, 1, 1, 1, 1,
-0.6264923, 0.3851812, 0.1917374, 1, 1, 1, 1, 1,
-0.620818, -0.1630982, -0.6206098, 1, 1, 1, 1, 1,
-0.6112224, -0.3734008, -2.531512, 1, 1, 1, 1, 1,
-0.6095552, -0.4995978, -2.307583, 1, 1, 1, 1, 1,
-0.6087106, -0.9396113, -3.107144, 1, 1, 1, 1, 1,
-0.606436, 0.5375839, -1.619466, 1, 1, 1, 1, 1,
-0.6006429, -0.8721997, -1.672413, 1, 1, 1, 1, 1,
-0.599306, -0.3366722, -0.850596, 1, 1, 1, 1, 1,
-0.597078, 0.7481657, -0.8424575, 1, 1, 1, 1, 1,
-0.5951531, -0.1631487, -1.295456, 1, 1, 1, 1, 1,
-0.5948091, 0.4474914, 0.1072978, 1, 1, 1, 1, 1,
-0.5843174, 0.02752448, -2.238271, 1, 1, 1, 1, 1,
-0.5805702, -0.654582, -3.062138, 0, 0, 1, 1, 1,
-0.5748529, 0.5165974, -0.5523317, 1, 0, 0, 1, 1,
-0.5728453, -2.053943, -1.430284, 1, 0, 0, 1, 1,
-0.5668244, -0.6631936, -1.13673, 1, 0, 0, 1, 1,
-0.5626811, 0.02397544, -2.590343, 1, 0, 0, 1, 1,
-0.5617673, -1.228765, -2.421706, 1, 0, 0, 1, 1,
-0.5613931, 0.5686724, 0.9128996, 0, 0, 0, 1, 1,
-0.5594466, 0.01394035, -1.565761, 0, 0, 0, 1, 1,
-0.5533763, -1.049806, -1.366871, 0, 0, 0, 1, 1,
-0.5508431, 0.03182447, -1.226183, 0, 0, 0, 1, 1,
-0.5468795, -0.7129843, -2.501826, 0, 0, 0, 1, 1,
-0.5396037, -0.03142575, -1.968448, 0, 0, 0, 1, 1,
-0.5323619, 1.253531, -0.8098691, 0, 0, 0, 1, 1,
-0.5298106, -0.9735306, -2.578544, 1, 1, 1, 1, 1,
-0.5288748, -0.7371653, -2.74776, 1, 1, 1, 1, 1,
-0.5268641, 0.51919, 0.1675545, 1, 1, 1, 1, 1,
-0.5187327, 2.275932, -2.199494, 1, 1, 1, 1, 1,
-0.5145211, 1.031865, 0.6117299, 1, 1, 1, 1, 1,
-0.5140383, 2.543007, 1.379836, 1, 1, 1, 1, 1,
-0.5092833, 0.3558407, -1.614478, 1, 1, 1, 1, 1,
-0.5017812, -0.8108308, -2.230067, 1, 1, 1, 1, 1,
-0.4981547, -0.8476453, -2.9612, 1, 1, 1, 1, 1,
-0.4965073, 0.7165285, 0.2891922, 1, 1, 1, 1, 1,
-0.4959167, -0.3981054, -1.770903, 1, 1, 1, 1, 1,
-0.4946235, 0.5666304, -2.090785, 1, 1, 1, 1, 1,
-0.4918605, -0.2425863, -2.228848, 1, 1, 1, 1, 1,
-0.4774294, -0.7095325, -4.117235, 1, 1, 1, 1, 1,
-0.4755461, 0.4719414, -1.03277, 1, 1, 1, 1, 1,
-0.4741692, -0.684381, -2.438462, 0, 0, 1, 1, 1,
-0.4731998, -0.09667471, -1.573847, 1, 0, 0, 1, 1,
-0.4726872, 2.312927, 0.9185641, 1, 0, 0, 1, 1,
-0.4719044, -0.4951048, -0.9945619, 1, 0, 0, 1, 1,
-0.4691007, 0.1398253, -0.2060197, 1, 0, 0, 1, 1,
-0.4666807, -0.3467515, -0.349192, 1, 0, 0, 1, 1,
-0.465711, -1.077439, -0.8469441, 0, 0, 0, 1, 1,
-0.463711, 0.2284502, -1.617662, 0, 0, 0, 1, 1,
-0.4609911, -0.09419253, -1.435006, 0, 0, 0, 1, 1,
-0.4609358, 0.6986887, -1.279516, 0, 0, 0, 1, 1,
-0.4582417, 0.690547, -1.534928, 0, 0, 0, 1, 1,
-0.4562842, 1.017522, -0.8529263, 0, 0, 0, 1, 1,
-0.455399, -0.412313, -3.066551, 0, 0, 0, 1, 1,
-0.4529032, 0.6975832, -0.5051088, 1, 1, 1, 1, 1,
-0.4516554, 0.2829192, -0.8358144, 1, 1, 1, 1, 1,
-0.4514929, 1.87968, -0.1997644, 1, 1, 1, 1, 1,
-0.4440251, 2.292503, -0.5784526, 1, 1, 1, 1, 1,
-0.4412454, 2.838063, -0.1777012, 1, 1, 1, 1, 1,
-0.4388787, -0.6142311, -3.351089, 1, 1, 1, 1, 1,
-0.4385147, 0.6004533, 0.751254, 1, 1, 1, 1, 1,
-0.4374132, -0.9833186, -2.308263, 1, 1, 1, 1, 1,
-0.4300377, -1.703607, -4.450948, 1, 1, 1, 1, 1,
-0.4263381, 1.388233, -0.8130322, 1, 1, 1, 1, 1,
-0.4253885, 0.7892264, 0.2533198, 1, 1, 1, 1, 1,
-0.4225864, 0.1419096, -2.839664, 1, 1, 1, 1, 1,
-0.4215477, 0.1406656, -0.9567376, 1, 1, 1, 1, 1,
-0.412593, -1.31287, -1.762523, 1, 1, 1, 1, 1,
-0.410319, 0.6822537, -0.9854382, 1, 1, 1, 1, 1,
-0.4087613, 1.197508, -0.9101446, 0, 0, 1, 1, 1,
-0.4049676, -1.688554, -5.322615, 1, 0, 0, 1, 1,
-0.392978, -0.2644295, -1.626858, 1, 0, 0, 1, 1,
-0.3913235, 1.428942, 1.713766, 1, 0, 0, 1, 1,
-0.3873197, 0.5622272, -0.8110591, 1, 0, 0, 1, 1,
-0.3829181, 0.402964, -0.08055057, 1, 0, 0, 1, 1,
-0.3745281, -0.3475665, -3.222415, 0, 0, 0, 1, 1,
-0.3710715, -0.908636, -3.560747, 0, 0, 0, 1, 1,
-0.370779, 0.3857662, -0.08157525, 0, 0, 0, 1, 1,
-0.3628967, 0.7120848, -1.254359, 0, 0, 0, 1, 1,
-0.3617153, 0.1616492, -1.297065, 0, 0, 0, 1, 1,
-0.3578085, 0.191124, 0.1550349, 0, 0, 0, 1, 1,
-0.3567271, -1.886795, -3.889665, 0, 0, 0, 1, 1,
-0.3549944, -1.015139, -4.596455, 1, 1, 1, 1, 1,
-0.3545663, -0.1610841, -2.010891, 1, 1, 1, 1, 1,
-0.354436, -0.3284048, -2.760509, 1, 1, 1, 1, 1,
-0.3516765, 0.09740727, -1.279417, 1, 1, 1, 1, 1,
-0.348727, -0.3215556, -1.562055, 1, 1, 1, 1, 1,
-0.3485837, 0.9704093, 0.8526055, 1, 1, 1, 1, 1,
-0.3482056, -0.7588412, -3.019267, 1, 1, 1, 1, 1,
-0.3468079, 1.263574, -0.3283292, 1, 1, 1, 1, 1,
-0.3465652, 1.822081, -0.05266935, 1, 1, 1, 1, 1,
-0.3465186, 0.664758, 0.6999422, 1, 1, 1, 1, 1,
-0.3455715, -0.9061246, -3.841852, 1, 1, 1, 1, 1,
-0.3450551, -0.5006042, -1.551274, 1, 1, 1, 1, 1,
-0.3438157, 1.853572, 1.167957, 1, 1, 1, 1, 1,
-0.341321, -1.617276, -3.238288, 1, 1, 1, 1, 1,
-0.3312598, -0.9286349, -1.928773, 1, 1, 1, 1, 1,
-0.3200946, -0.5033985, -2.097298, 0, 0, 1, 1, 1,
-0.3124931, 0.5778546, -0.3461169, 1, 0, 0, 1, 1,
-0.3108666, 1.374555, 0.1245718, 1, 0, 0, 1, 1,
-0.3091969, 0.7150146, -0.6596139, 1, 0, 0, 1, 1,
-0.3081841, 0.3770371, -0.0762106, 1, 0, 0, 1, 1,
-0.3070078, 1.093079, -0.4850385, 1, 0, 0, 1, 1,
-0.3048725, 0.834385, -2.447837, 0, 0, 0, 1, 1,
-0.3046193, -0.141698, -2.2953, 0, 0, 0, 1, 1,
-0.3016566, 0.8540249, -0.4538124, 0, 0, 0, 1, 1,
-0.2982268, 1.388184, -0.6632751, 0, 0, 0, 1, 1,
-0.2882239, -2.033272, -5.104159, 0, 0, 0, 1, 1,
-0.2861516, 1.257833, -0.04211946, 0, 0, 0, 1, 1,
-0.2834673, 0.3388516, 0.4714372, 0, 0, 0, 1, 1,
-0.2833984, 0.5321901, -1.280952, 1, 1, 1, 1, 1,
-0.2809629, 1.422437, 1.778062, 1, 1, 1, 1, 1,
-0.2803709, -0.03236629, -2.165795, 1, 1, 1, 1, 1,
-0.2762462, 0.1409162, 0.2272536, 1, 1, 1, 1, 1,
-0.2758774, 1.487752, -1.771233, 1, 1, 1, 1, 1,
-0.2746244, 0.9806049, -0.8041044, 1, 1, 1, 1, 1,
-0.2744548, 1.035475, 0.7816507, 1, 1, 1, 1, 1,
-0.2723259, -1.23935, -3.368208, 1, 1, 1, 1, 1,
-0.2674878, -0.5613284, -1.979388, 1, 1, 1, 1, 1,
-0.2584501, 0.5965004, 1.246894, 1, 1, 1, 1, 1,
-0.2516093, 1.332381, 0.05903463, 1, 1, 1, 1, 1,
-0.2511732, 1.262434, 0.5216158, 1, 1, 1, 1, 1,
-0.2500161, 0.283765, -0.04122283, 1, 1, 1, 1, 1,
-0.2477925, 1.834024, 1.250842, 1, 1, 1, 1, 1,
-0.2466687, 2.049959, -1.856627, 1, 1, 1, 1, 1,
-0.2456169, -0.1701992, -3.53997, 0, 0, 1, 1, 1,
-0.2347462, 0.8620769, -1.389009, 1, 0, 0, 1, 1,
-0.2338748, 0.7505029, -1.951963, 1, 0, 0, 1, 1,
-0.233781, -0.4739504, -4.403032, 1, 0, 0, 1, 1,
-0.2335267, 0.5744128, 0.8566147, 1, 0, 0, 1, 1,
-0.2331317, 0.3482485, -0.2692183, 1, 0, 0, 1, 1,
-0.2298011, -0.01846551, -3.150619, 0, 0, 0, 1, 1,
-0.2294907, -0.2198388, -2.895431, 0, 0, 0, 1, 1,
-0.2290988, -1.586485, -2.894036, 0, 0, 0, 1, 1,
-0.2234832, -0.3277974, -3.384575, 0, 0, 0, 1, 1,
-0.2165056, -0.1075604, -3.70984, 0, 0, 0, 1, 1,
-0.2156354, -0.6768281, -3.482393, 0, 0, 0, 1, 1,
-0.2135266, -0.274218, -0.9010579, 0, 0, 0, 1, 1,
-0.2132075, -0.4645513, -3.610923, 1, 1, 1, 1, 1,
-0.2127986, -0.7475625, -2.766968, 1, 1, 1, 1, 1,
-0.208639, 1.15852, -0.06746818, 1, 1, 1, 1, 1,
-0.1956383, -0.128402, -1.390161, 1, 1, 1, 1, 1,
-0.19392, 1.948971, 1.502559, 1, 1, 1, 1, 1,
-0.1930717, -0.2351596, -2.627341, 1, 1, 1, 1, 1,
-0.1877641, 1.122024, -1.55009, 1, 1, 1, 1, 1,
-0.187183, 0.9563161, -0.2808069, 1, 1, 1, 1, 1,
-0.1828708, -0.2687834, -3.964131, 1, 1, 1, 1, 1,
-0.1809756, -0.2575071, -2.043285, 1, 1, 1, 1, 1,
-0.1803982, -0.9362423, -1.723915, 1, 1, 1, 1, 1,
-0.167605, 0.4933623, -0.4077196, 1, 1, 1, 1, 1,
-0.1673967, 0.4422986, -0.9398911, 1, 1, 1, 1, 1,
-0.1612383, -1.09405, -1.498743, 1, 1, 1, 1, 1,
-0.1581005, -0.134443, -0.6734692, 1, 1, 1, 1, 1,
-0.152389, 1.827179, -0.6781846, 0, 0, 1, 1, 1,
-0.151077, -0.05992296, -2.388868, 1, 0, 0, 1, 1,
-0.1453361, 0.3862595, 0.8582406, 1, 0, 0, 1, 1,
-0.1437913, 0.2489663, 1.5467, 1, 0, 0, 1, 1,
-0.1402141, 1.730309, -2.231703, 1, 0, 0, 1, 1,
-0.1375792, -0.1254012, -3.346526, 1, 0, 0, 1, 1,
-0.1369696, 0.5413412, 1.473624, 0, 0, 0, 1, 1,
-0.1337522, -0.1095966, -2.458112, 0, 0, 0, 1, 1,
-0.1308078, -0.9831128, -2.443618, 0, 0, 0, 1, 1,
-0.1299791, -0.2500446, -2.823548, 0, 0, 0, 1, 1,
-0.1275275, 0.4066779, -0.6118476, 0, 0, 0, 1, 1,
-0.1259809, -1.234599, -3.052552, 0, 0, 0, 1, 1,
-0.1255, -0.3670878, -2.304761, 0, 0, 0, 1, 1,
-0.1233276, 0.8229357, 0.5128902, 1, 1, 1, 1, 1,
-0.1202207, 0.2876324, 0.0766214, 1, 1, 1, 1, 1,
-0.115559, -1.83211, -4.288446, 1, 1, 1, 1, 1,
-0.1094751, 0.9958668, -0.6229036, 1, 1, 1, 1, 1,
-0.1094209, 0.2079591, -3.366809, 1, 1, 1, 1, 1,
-0.1065155, 0.4247887, -0.2575759, 1, 1, 1, 1, 1,
-0.1017359, 0.7397225, 0.8357238, 1, 1, 1, 1, 1,
-0.09742469, 0.827208, 0.08048709, 1, 1, 1, 1, 1,
-0.09706677, 0.1171235, -2.076446, 1, 1, 1, 1, 1,
-0.09627203, 0.1585243, -3.003633, 1, 1, 1, 1, 1,
-0.08925313, -1.055444, -3.539164, 1, 1, 1, 1, 1,
-0.08706891, 2.113212, 0.506265, 1, 1, 1, 1, 1,
-0.08649132, 1.663822, -1.400398, 1, 1, 1, 1, 1,
-0.08449417, 2.008174, 1.003696, 1, 1, 1, 1, 1,
-0.08441161, 0.4486282, -1.695862, 1, 1, 1, 1, 1,
-0.07412809, -0.2199238, -2.61047, 0, 0, 1, 1, 1,
-0.0706965, 0.7803503, 0.1420242, 1, 0, 0, 1, 1,
-0.07003307, 0.2566427, -0.8419582, 1, 0, 0, 1, 1,
-0.06995052, -0.1090936, -3.41835, 1, 0, 0, 1, 1,
-0.06988095, -0.2301539, -3.97082, 1, 0, 0, 1, 1,
-0.06095736, -1.157956, -1.85657, 1, 0, 0, 1, 1,
-0.06051878, 1.128877, 0.2516627, 0, 0, 0, 1, 1,
-0.05696115, -0.9177298, -4.388959, 0, 0, 0, 1, 1,
-0.05586827, 1.845999, -0.7914463, 0, 0, 0, 1, 1,
-0.05334947, -0.8109226, -4.411112, 0, 0, 0, 1, 1,
-0.05040451, 0.5661063, 0.03045313, 0, 0, 0, 1, 1,
-0.04219919, 0.791321, -0.6354733, 0, 0, 0, 1, 1,
-0.03754914, -0.4009167, -2.504022, 0, 0, 0, 1, 1,
-0.03594583, -0.8189663, -2.630778, 1, 1, 1, 1, 1,
-0.03330245, 0.8724661, 1.02309, 1, 1, 1, 1, 1,
-0.033066, 0.7100562, -0.1228859, 1, 1, 1, 1, 1,
-0.03278218, 0.3373989, -0.7817273, 1, 1, 1, 1, 1,
-0.0281092, 1.85304, -1.177268, 1, 1, 1, 1, 1,
-0.02603886, 1.704134, -0.3796749, 1, 1, 1, 1, 1,
-0.02570374, 0.4148578, -0.8304971, 1, 1, 1, 1, 1,
-0.02172386, -0.8455859, -3.134437, 1, 1, 1, 1, 1,
-0.01743653, 0.6099783, 1.290739, 1, 1, 1, 1, 1,
-0.01587653, -0.5671694, -2.485879, 1, 1, 1, 1, 1,
-0.01551848, 0.3459145, 0.2303834, 1, 1, 1, 1, 1,
-0.01497472, -0.229637, -3.637956, 1, 1, 1, 1, 1,
-0.01425734, 0.3052627, 0.1359255, 1, 1, 1, 1, 1,
-0.01306354, -0.6495471, -4.900954, 1, 1, 1, 1, 1,
-0.01194884, -0.9572269, -4.337382, 1, 1, 1, 1, 1,
-0.01040411, -1.170105, -3.784571, 0, 0, 1, 1, 1,
-0.008522824, 0.1646282, -0.4786939, 1, 0, 0, 1, 1,
-0.005166659, -0.5131089, -2.572935, 1, 0, 0, 1, 1,
-0.00425231, -0.712033, -2.426306, 1, 0, 0, 1, 1,
-0.003253013, -1.49712, -3.098114, 1, 0, 0, 1, 1,
-0.001351641, -1.613743, -2.126412, 1, 0, 0, 1, 1,
0.0001731009, 2.082474, -0.2130484, 0, 0, 0, 1, 1,
0.002927627, -0.660773, 2.440035, 0, 0, 0, 1, 1,
0.005940727, 0.7416387, 1.477573, 0, 0, 0, 1, 1,
0.007676499, 0.841464, -0.009478955, 0, 0, 0, 1, 1,
0.008654549, -3.369798, 4.260819, 0, 0, 0, 1, 1,
0.01108026, -0.2187319, 3.501452, 0, 0, 0, 1, 1,
0.01770788, 2.007519, 1.095052, 0, 0, 0, 1, 1,
0.02117398, -1.059591, 3.926628, 1, 1, 1, 1, 1,
0.02338165, -0.4984396, 4.376436, 1, 1, 1, 1, 1,
0.0249737, 0.5360044, 0.7078834, 1, 1, 1, 1, 1,
0.02507641, -1.006794, 3.392015, 1, 1, 1, 1, 1,
0.02612867, -0.05043721, 2.880165, 1, 1, 1, 1, 1,
0.02850104, -0.004512318, 0.847844, 1, 1, 1, 1, 1,
0.03186098, -1.275528, 3.095749, 1, 1, 1, 1, 1,
0.04091198, -0.2821468, 3.63729, 1, 1, 1, 1, 1,
0.04110216, -0.103046, 2.515832, 1, 1, 1, 1, 1,
0.04265655, 0.2337871, -0.5290169, 1, 1, 1, 1, 1,
0.05285786, -0.5183706, 2.389416, 1, 1, 1, 1, 1,
0.05444322, 0.2277335, 1.805869, 1, 1, 1, 1, 1,
0.05688649, 0.8906361, -0.4503165, 1, 1, 1, 1, 1,
0.05872588, -1.284862, 3.642899, 1, 1, 1, 1, 1,
0.05935731, 0.413778, 0.4033922, 1, 1, 1, 1, 1,
0.06116892, 1.162801, -1.625775, 0, 0, 1, 1, 1,
0.06312758, 0.2553539, 0.446417, 1, 0, 0, 1, 1,
0.06416579, -2.021787, 4.777331, 1, 0, 0, 1, 1,
0.06824239, -1.132917, 3.367636, 1, 0, 0, 1, 1,
0.0710128, -0.8126941, 3.233455, 1, 0, 0, 1, 1,
0.07234235, 0.8318298, 0.6298984, 1, 0, 0, 1, 1,
0.07902361, -0.2150399, 3.490435, 0, 0, 0, 1, 1,
0.08676814, 1.926928, -0.03597907, 0, 0, 0, 1, 1,
0.09212459, 1.70603, -0.1226877, 0, 0, 0, 1, 1,
0.09271887, -0.8507727, 2.077132, 0, 0, 0, 1, 1,
0.09279452, -0.1051349, 2.599542, 0, 0, 0, 1, 1,
0.09500276, -0.2036847, 1.932895, 0, 0, 0, 1, 1,
0.09568228, -1.605129, 4.36277, 0, 0, 0, 1, 1,
0.09668843, 0.2806079, 2.028851, 1, 1, 1, 1, 1,
0.09723118, -0.827938, 2.84024, 1, 1, 1, 1, 1,
0.09842788, 0.1074878, 0.1081425, 1, 1, 1, 1, 1,
0.1000362, -0.4359909, 2.337006, 1, 1, 1, 1, 1,
0.1000573, -1.795093, 3.649924, 1, 1, 1, 1, 1,
0.102679, -0.1091244, 3.291431, 1, 1, 1, 1, 1,
0.107361, -1.348952, 4.12611, 1, 1, 1, 1, 1,
0.1092949, 0.8849055, -1.866533, 1, 1, 1, 1, 1,
0.1122458, 0.3471964, 0.9298704, 1, 1, 1, 1, 1,
0.1124047, -0.9005136, 3.804386, 1, 1, 1, 1, 1,
0.1217181, -1.027219, 2.024363, 1, 1, 1, 1, 1,
0.1245193, -1.771556, 3.862751, 1, 1, 1, 1, 1,
0.1289026, 0.9862472, 0.8166414, 1, 1, 1, 1, 1,
0.1318025, -0.2194212, 3.859124, 1, 1, 1, 1, 1,
0.1348235, -0.03133131, 2.311962, 1, 1, 1, 1, 1,
0.1367679, 1.269209, -0.4091498, 0, 0, 1, 1, 1,
0.1408876, 0.2615366, 1.547525, 1, 0, 0, 1, 1,
0.1418318, 0.3059026, 1.057009, 1, 0, 0, 1, 1,
0.1452558, -1.321568, 3.974307, 1, 0, 0, 1, 1,
0.1518047, -1.121705, 3.864764, 1, 0, 0, 1, 1,
0.1538337, -0.2780372, 2.545839, 1, 0, 0, 1, 1,
0.1550301, -0.6046543, 4.839842, 0, 0, 0, 1, 1,
0.1580654, -0.5288615, 3.382139, 0, 0, 0, 1, 1,
0.1595708, -0.923569, 2.4893, 0, 0, 0, 1, 1,
0.1595807, 0.273036, -0.3612814, 0, 0, 0, 1, 1,
0.1598442, 0.01336935, 0.9354413, 0, 0, 0, 1, 1,
0.1618035, 1.43404, -1.679847, 0, 0, 0, 1, 1,
0.1619635, -1.076217, 2.770852, 0, 0, 0, 1, 1,
0.164103, -3.009218, 2.202077, 1, 1, 1, 1, 1,
0.1661542, -0.9563585, 1.844345, 1, 1, 1, 1, 1,
0.16628, -1.886042, 2.977423, 1, 1, 1, 1, 1,
0.1723202, 0.1623885, -0.08957352, 1, 1, 1, 1, 1,
0.1727885, 0.4362161, -0.04280517, 1, 1, 1, 1, 1,
0.1730331, 0.3166245, 1.644624, 1, 1, 1, 1, 1,
0.1756561, 0.2384183, 3.174926, 1, 1, 1, 1, 1,
0.1778166, 1.959269, 1.30946, 1, 1, 1, 1, 1,
0.1794579, 1.64194, 0.1262929, 1, 1, 1, 1, 1,
0.1820525, -1.459094, 2.987715, 1, 1, 1, 1, 1,
0.1854819, 1.225857, 0.9404093, 1, 1, 1, 1, 1,
0.1860838, 1.522062, 1.065197, 1, 1, 1, 1, 1,
0.1895196, -0.07675438, 3.042297, 1, 1, 1, 1, 1,
0.1897794, -0.7437035, 1.242723, 1, 1, 1, 1, 1,
0.1975689, -0.6535095, 1.996762, 1, 1, 1, 1, 1,
0.2026516, 0.2050254, 1.399957, 0, 0, 1, 1, 1,
0.2056828, 1.22007, 1.119656, 1, 0, 0, 1, 1,
0.2084535, 0.4414755, -0.3619542, 1, 0, 0, 1, 1,
0.2139775, 1.782074, -0.3688523, 1, 0, 0, 1, 1,
0.2179302, 1.377478, 1.472247, 1, 0, 0, 1, 1,
0.2184813, -0.5224258, 3.342898, 1, 0, 0, 1, 1,
0.2236517, -0.4558943, 2.543724, 0, 0, 0, 1, 1,
0.2273336, 0.8493639, 0.5659104, 0, 0, 0, 1, 1,
0.2276076, 0.4064305, -0.6266528, 0, 0, 0, 1, 1,
0.2310195, -0.62264, 1.188206, 0, 0, 0, 1, 1,
0.2326357, 0.3831685, -0.135026, 0, 0, 0, 1, 1,
0.2370594, 0.02146244, 0.8967952, 0, 0, 0, 1, 1,
0.2383228, -0.07511178, 0.4204533, 0, 0, 0, 1, 1,
0.2478514, 0.2126396, 2.405746, 1, 1, 1, 1, 1,
0.2511829, 0.6463028, 0.1716153, 1, 1, 1, 1, 1,
0.2531367, 1.77038, 0.5435792, 1, 1, 1, 1, 1,
0.2563539, -0.5969368, 2.417197, 1, 1, 1, 1, 1,
0.2610154, -0.9220752, 2.609346, 1, 1, 1, 1, 1,
0.2640209, 2.025218, -0.7376079, 1, 1, 1, 1, 1,
0.2647426, 1.456408, 0.4881426, 1, 1, 1, 1, 1,
0.264868, -0.1268275, 1.277433, 1, 1, 1, 1, 1,
0.266869, -1.388613, 1.984264, 1, 1, 1, 1, 1,
0.2708945, 0.8537211, 0.4288266, 1, 1, 1, 1, 1,
0.2747741, 1.023303, 1.22218, 1, 1, 1, 1, 1,
0.2760821, -0.679879, 4.233705, 1, 1, 1, 1, 1,
0.2784944, -0.9899377, 2.837379, 1, 1, 1, 1, 1,
0.2787882, -0.9923846, 4.623474, 1, 1, 1, 1, 1,
0.2834522, 1.311043, -1.789338, 1, 1, 1, 1, 1,
0.2842475, 0.5730436, 1.210465, 0, 0, 1, 1, 1,
0.2872306, 0.5895475, -1.702546, 1, 0, 0, 1, 1,
0.2879714, 0.6761675, 0.8675959, 1, 0, 0, 1, 1,
0.2901174, 0.568166, 0.7805509, 1, 0, 0, 1, 1,
0.2905198, 0.7449349, -1.489669, 1, 0, 0, 1, 1,
0.2918357, 0.9647939, 2.711116, 1, 0, 0, 1, 1,
0.2926467, -1.632163, 2.61801, 0, 0, 0, 1, 1,
0.2945074, -1.151123, 3.836753, 0, 0, 0, 1, 1,
0.2965472, -1.88153, 3.538593, 0, 0, 0, 1, 1,
0.2968521, 0.2181402, 0.1731869, 0, 0, 0, 1, 1,
0.2972585, 0.7817332, 0.6438127, 0, 0, 0, 1, 1,
0.3007599, -1.526057, 3.31227, 0, 0, 0, 1, 1,
0.3024192, 0.2275355, -0.45279, 0, 0, 0, 1, 1,
0.3058579, 1.422811, -0.6439245, 1, 1, 1, 1, 1,
0.3096123, -0.3367349, 4.028487, 1, 1, 1, 1, 1,
0.3116568, 1.402458, -0.5534678, 1, 1, 1, 1, 1,
0.3119025, -1.081789, 0.8207877, 1, 1, 1, 1, 1,
0.3124101, 2.000306, -0.08797303, 1, 1, 1, 1, 1,
0.312839, 0.3867339, 1.816074, 1, 1, 1, 1, 1,
0.3129098, 1.231284, -1.715855, 1, 1, 1, 1, 1,
0.3179385, 1.737024, 0.02172281, 1, 1, 1, 1, 1,
0.3195931, 1.504502, -0.200959, 1, 1, 1, 1, 1,
0.3218466, 0.9355907, 0.6625493, 1, 1, 1, 1, 1,
0.3239077, 0.5263963, -0.1846451, 1, 1, 1, 1, 1,
0.3240384, 0.1167455, 1.790426, 1, 1, 1, 1, 1,
0.3263967, 0.239594, -0.9347183, 1, 1, 1, 1, 1,
0.3286595, 0.4578443, 3.359279, 1, 1, 1, 1, 1,
0.3321572, 0.9157072, 1.543157, 1, 1, 1, 1, 1,
0.332568, -1.59013, 4.45348, 0, 0, 1, 1, 1,
0.3329751, -1.117744, 1.180289, 1, 0, 0, 1, 1,
0.337164, -0.8487762, 3.292867, 1, 0, 0, 1, 1,
0.3412755, 0.5679929, 0.9183903, 1, 0, 0, 1, 1,
0.3423583, -0.2202048, 1.976472, 1, 0, 0, 1, 1,
0.3427026, -1.234225, 2.262032, 1, 0, 0, 1, 1,
0.3445012, -0.2932172, 3.855032, 0, 0, 0, 1, 1,
0.3454676, -0.4225439, 2.195609, 0, 0, 0, 1, 1,
0.3455527, -0.256119, 3.097977, 0, 0, 0, 1, 1,
0.3494858, -1.244874, 4.417353, 0, 0, 0, 1, 1,
0.3500117, -2.015091, 1.346947, 0, 0, 0, 1, 1,
0.3515843, -2.129021, 3.624933, 0, 0, 0, 1, 1,
0.3546719, 0.3361883, 0.3572554, 0, 0, 0, 1, 1,
0.3550749, 1.330693, 0.001037899, 1, 1, 1, 1, 1,
0.3551345, 0.8833671, 1.031524, 1, 1, 1, 1, 1,
0.3558248, -2.69652, 2.541709, 1, 1, 1, 1, 1,
0.3573669, 0.00409459, 2.742599, 1, 1, 1, 1, 1,
0.3601332, 1.467485, -0.520657, 1, 1, 1, 1, 1,
0.3602688, -1.587089, 4.063542, 1, 1, 1, 1, 1,
0.3603544, -1.64204, 2.672481, 1, 1, 1, 1, 1,
0.3659971, -0.4532256, 1.691002, 1, 1, 1, 1, 1,
0.3703659, -0.289735, 2.358633, 1, 1, 1, 1, 1,
0.3704977, 1.15869, 0.4224921, 1, 1, 1, 1, 1,
0.3716335, -0.6835579, 2.276628, 1, 1, 1, 1, 1,
0.3720525, 1.431337, 0.1287629, 1, 1, 1, 1, 1,
0.3748557, -0.3649894, 3.222773, 1, 1, 1, 1, 1,
0.3761105, -0.8101206, 1.838925, 1, 1, 1, 1, 1,
0.3839796, 1.742784, -0.6015591, 1, 1, 1, 1, 1,
0.3881044, -0.7297396, 1.373484, 0, 0, 1, 1, 1,
0.388863, 0.3458229, 0.8899944, 1, 0, 0, 1, 1,
0.3895151, -0.01330271, 0.7634155, 1, 0, 0, 1, 1,
0.3913722, 1.106528, 1.059379, 1, 0, 0, 1, 1,
0.3921295, -0.4704154, 1.679358, 1, 0, 0, 1, 1,
0.3953674, -0.2734944, 3.690172, 1, 0, 0, 1, 1,
0.3963821, -0.6866769, 1.652727, 0, 0, 0, 1, 1,
0.3970264, 1.110139, -0.5176947, 0, 0, 0, 1, 1,
0.3977226, 2.144615, 1.16809, 0, 0, 0, 1, 1,
0.4008592, 1.2752, 0.8453398, 0, 0, 0, 1, 1,
0.4008996, -0.1263861, 0.6826524, 0, 0, 0, 1, 1,
0.4045853, 0.9524477, -0.1306059, 0, 0, 0, 1, 1,
0.4057828, -0.1264528, 1.717371, 0, 0, 0, 1, 1,
0.4104443, 2.248213, 1.123414, 1, 1, 1, 1, 1,
0.4118859, 1.36195, 1.476268, 1, 1, 1, 1, 1,
0.4204331, -0.9690514, 4.158488, 1, 1, 1, 1, 1,
0.4236339, 0.4532713, 1.392776, 1, 1, 1, 1, 1,
0.4244634, 0.6772174, -0.3643043, 1, 1, 1, 1, 1,
0.4247534, -0.3750544, 3.730328, 1, 1, 1, 1, 1,
0.4302418, -0.1062934, 2.769755, 1, 1, 1, 1, 1,
0.4304749, 1.241809, 0.4766806, 1, 1, 1, 1, 1,
0.4322179, -0.341203, 2.577212, 1, 1, 1, 1, 1,
0.4414251, 0.5122903, 0.679185, 1, 1, 1, 1, 1,
0.4430885, -0.2758348, 2.105445, 1, 1, 1, 1, 1,
0.450983, -1.124004, 4.483556, 1, 1, 1, 1, 1,
0.4558775, 0.7514367, 0.7712231, 1, 1, 1, 1, 1,
0.4568965, 1.492414, 1.199561, 1, 1, 1, 1, 1,
0.4572867, 1.168301, -0.3479544, 1, 1, 1, 1, 1,
0.4601611, 0.2725435, 1.031508, 0, 0, 1, 1, 1,
0.4645309, -0.7197987, 2.200125, 1, 0, 0, 1, 1,
0.4648336, -2.089756, 3.404179, 1, 0, 0, 1, 1,
0.4657671, 1.421705, 0.3883173, 1, 0, 0, 1, 1,
0.4660432, 0.6872039, 1.246498, 1, 0, 0, 1, 1,
0.4673316, -1.083205, 3.927435, 1, 0, 0, 1, 1,
0.4676951, -0.4143305, 2.76465, 0, 0, 0, 1, 1,
0.468174, -0.8222833, 3.57893, 0, 0, 0, 1, 1,
0.4690335, -0.1982246, 3.023246, 0, 0, 0, 1, 1,
0.4694589, 0.6821929, -1.025403, 0, 0, 0, 1, 1,
0.4706047, -0.8337291, 2.983919, 0, 0, 0, 1, 1,
0.4783067, 0.03505957, 2.98861, 0, 0, 0, 1, 1,
0.4802589, -0.9765089, 2.939628, 0, 0, 0, 1, 1,
0.4861634, 0.4797242, 0.6087319, 1, 1, 1, 1, 1,
0.4892127, 0.02849002, 1.180298, 1, 1, 1, 1, 1,
0.490139, 0.972463, -0.7790125, 1, 1, 1, 1, 1,
0.4948848, 0.7239582, 1.451304, 1, 1, 1, 1, 1,
0.4969391, -0.8331307, 2.613325, 1, 1, 1, 1, 1,
0.4985943, 1.151303, -1.66064, 1, 1, 1, 1, 1,
0.500425, 0.8160369, -1.299049, 1, 1, 1, 1, 1,
0.5028784, 1.253751, 1.273105, 1, 1, 1, 1, 1,
0.5033385, 1.545984, -0.2008809, 1, 1, 1, 1, 1,
0.5033597, 1.574138, 2.442773, 1, 1, 1, 1, 1,
0.5067747, -1.470514, 1.730857, 1, 1, 1, 1, 1,
0.5116159, 0.978915, 1.447919, 1, 1, 1, 1, 1,
0.5116817, -0.09117024, 1.85494, 1, 1, 1, 1, 1,
0.5137296, -2.379357, 2.960745, 1, 1, 1, 1, 1,
0.5149814, -1.847261, 2.323135, 1, 1, 1, 1, 1,
0.5152936, 0.2371443, 2.611492, 0, 0, 1, 1, 1,
0.5220589, -0.9065532, 2.283341, 1, 0, 0, 1, 1,
0.522441, 1.265819, 1.795512, 1, 0, 0, 1, 1,
0.5235917, 0.6622627, -0.09540423, 1, 0, 0, 1, 1,
0.5259353, 0.01183156, 3.338431, 1, 0, 0, 1, 1,
0.5285174, -0.1054888, 1.889605, 1, 0, 0, 1, 1,
0.5314534, -0.2763474, 2.273801, 0, 0, 0, 1, 1,
0.5341814, -1.523608, 1.190857, 0, 0, 0, 1, 1,
0.5373989, -0.09742425, 2.259944, 0, 0, 0, 1, 1,
0.5398449, -0.7684402, 1.394573, 0, 0, 0, 1, 1,
0.5399939, 0.9195701, 1.563774, 0, 0, 0, 1, 1,
0.5492509, -0.1925249, 2.12181, 0, 0, 0, 1, 1,
0.5602895, -0.9796438, 2.230235, 0, 0, 0, 1, 1,
0.5607914, -0.8452159, 2.399596, 1, 1, 1, 1, 1,
0.5639038, -1.667734, 2.03656, 1, 1, 1, 1, 1,
0.5700426, 1.091083, -1.231423, 1, 1, 1, 1, 1,
0.5716004, 0.5376589, 0.5075219, 1, 1, 1, 1, 1,
0.5736982, 2.048769, -1.204532, 1, 1, 1, 1, 1,
0.5765677, 0.4723353, 1.770689, 1, 1, 1, 1, 1,
0.576606, -0.3876433, 1.599642, 1, 1, 1, 1, 1,
0.5825527, 2.63594, -1.160588, 1, 1, 1, 1, 1,
0.5857095, 1.727831, 1.706943, 1, 1, 1, 1, 1,
0.5879918, 0.1322132, 1.523847, 1, 1, 1, 1, 1,
0.5896625, 2.357742, 1.684171, 1, 1, 1, 1, 1,
0.5907934, -0.456031, 3.246942, 1, 1, 1, 1, 1,
0.5918757, 1.801736, 0.2852045, 1, 1, 1, 1, 1,
0.5945142, -0.3273654, 2.688507, 1, 1, 1, 1, 1,
0.5946831, 0.2771742, 0.1722118, 1, 1, 1, 1, 1,
0.5946962, 1.633334, 1.930315, 0, 0, 1, 1, 1,
0.6011122, -1.194137, 1.905498, 1, 0, 0, 1, 1,
0.6033998, -0.8253946, 3.450618, 1, 0, 0, 1, 1,
0.6061032, 0.8445284, 0.2454541, 1, 0, 0, 1, 1,
0.6148803, -1.593166, 1.879842, 1, 0, 0, 1, 1,
0.6213668, -0.8979001, 3.144758, 1, 0, 0, 1, 1,
0.621549, 0.2374029, 1.689706, 0, 0, 0, 1, 1,
0.6267557, 0.1202046, 2.482077, 0, 0, 0, 1, 1,
0.6295741, -2.095361, 2.83103, 0, 0, 0, 1, 1,
0.6348371, 0.3574201, 2.200723, 0, 0, 0, 1, 1,
0.6356934, -0.8549469, 4.264709, 0, 0, 0, 1, 1,
0.6360159, 0.7701364, -1.108644, 0, 0, 0, 1, 1,
0.6375258, 0.1274758, 1.149507, 0, 0, 0, 1, 1,
0.6386113, 2.508856, -0.0649321, 1, 1, 1, 1, 1,
0.6512241, -0.5385397, 1.442726, 1, 1, 1, 1, 1,
0.6516025, -1.230831, 2.983773, 1, 1, 1, 1, 1,
0.6576194, 0.7453235, 0.3054482, 1, 1, 1, 1, 1,
0.6580148, -0.7042154, 1.518625, 1, 1, 1, 1, 1,
0.6674582, 1.04855, 0.6680335, 1, 1, 1, 1, 1,
0.670086, 0.06377032, 2.152905, 1, 1, 1, 1, 1,
0.6711003, 0.4505739, 0.665548, 1, 1, 1, 1, 1,
0.6717384, -0.2974497, 2.869863, 1, 1, 1, 1, 1,
0.6722279, 0.4017243, 2.748451, 1, 1, 1, 1, 1,
0.6825888, 0.3327354, 0.7995031, 1, 1, 1, 1, 1,
0.6834754, -0.6360391, -0.09152552, 1, 1, 1, 1, 1,
0.6843144, 0.4182547, 0.8911399, 1, 1, 1, 1, 1,
0.6882203, -0.3555297, 2.915663, 1, 1, 1, 1, 1,
0.6906829, -1.033463, 1.618956, 1, 1, 1, 1, 1,
0.6915736, 0.6267149, 0.809214, 0, 0, 1, 1, 1,
0.694666, -2.071221, 4.663476, 1, 0, 0, 1, 1,
0.6966949, 0.9389665, -0.08252623, 1, 0, 0, 1, 1,
0.699585, 0.5070944, 0.09205597, 1, 0, 0, 1, 1,
0.7009585, 1.25938, 0.3204994, 1, 0, 0, 1, 1,
0.7025955, 0.3623732, 1.354468, 1, 0, 0, 1, 1,
0.7038113, -0.8958053, 2.924699, 0, 0, 0, 1, 1,
0.7097848, -1.761856, 2.163318, 0, 0, 0, 1, 1,
0.7126945, 0.2613378, 1.384193, 0, 0, 0, 1, 1,
0.7131412, 0.1922411, 1.901597, 0, 0, 0, 1, 1,
0.7176335, 2.669312, -0.1360267, 0, 0, 0, 1, 1,
0.7190294, -2.050162, 3.007106, 0, 0, 0, 1, 1,
0.7202249, 0.4278072, -0.2156488, 0, 0, 0, 1, 1,
0.720887, -0.1072447, 1.152047, 1, 1, 1, 1, 1,
0.7219337, 0.769171, 1.431713, 1, 1, 1, 1, 1,
0.723752, 2.464413, -0.6225408, 1, 1, 1, 1, 1,
0.7257664, 1.12428, 0.5253398, 1, 1, 1, 1, 1,
0.7261633, -0.977994, 1.2076, 1, 1, 1, 1, 1,
0.7313448, -0.2950398, 1.691292, 1, 1, 1, 1, 1,
0.7327964, -0.06835571, 1.623489, 1, 1, 1, 1, 1,
0.7336966, 0.01931277, 2.189201, 1, 1, 1, 1, 1,
0.7346575, 0.2673586, 1.352244, 1, 1, 1, 1, 1,
0.7547047, -1.117294, 3.136901, 1, 1, 1, 1, 1,
0.7547935, -0.1593347, 1.219503, 1, 1, 1, 1, 1,
0.756846, -0.5366211, 1.896363, 1, 1, 1, 1, 1,
0.7608781, 0.3752185, 2.582773, 1, 1, 1, 1, 1,
0.7665017, -1.614805, 3.105478, 1, 1, 1, 1, 1,
0.780782, -0.884906, 2.446633, 1, 1, 1, 1, 1,
0.7809951, -1.905147, 3.788427, 0, 0, 1, 1, 1,
0.7852101, 1.088425, 0.6436522, 1, 0, 0, 1, 1,
0.7874412, -0.608696, 1.081617, 1, 0, 0, 1, 1,
0.7889863, -0.5216737, 2.222769, 1, 0, 0, 1, 1,
0.8017827, -2.256537, 4.673913, 1, 0, 0, 1, 1,
0.8170347, -0.9213017, 1.686299, 1, 0, 0, 1, 1,
0.8217388, 0.7373791, 0.1744046, 0, 0, 0, 1, 1,
0.82261, -2.255327, 2.408266, 0, 0, 0, 1, 1,
0.8257521, 0.8781855, 0.8516952, 0, 0, 0, 1, 1,
0.8382778, -0.5245958, 1.886299, 0, 0, 0, 1, 1,
0.8485044, 1.315402, -0.1893032, 0, 0, 0, 1, 1,
0.8517362, 0.7818159, 0.9566685, 0, 0, 0, 1, 1,
0.853847, 0.2502376, 1.984947, 0, 0, 0, 1, 1,
0.8583509, 0.2037562, 0.2772546, 1, 1, 1, 1, 1,
0.8601317, 1.530784, -0.06446759, 1, 1, 1, 1, 1,
0.8617448, -0.09045219, 1.685583, 1, 1, 1, 1, 1,
0.8631212, 1.605578, -0.1904676, 1, 1, 1, 1, 1,
0.8640755, 3.003795, 0.8093131, 1, 1, 1, 1, 1,
0.8673067, -1.860094, 3.637038, 1, 1, 1, 1, 1,
0.8675081, -1.262137, 0.8969299, 1, 1, 1, 1, 1,
0.8781912, -0.3415053, 2.063491, 1, 1, 1, 1, 1,
0.8782839, 1.020882, 0.5853079, 1, 1, 1, 1, 1,
0.884401, 0.7180841, 1.301278, 1, 1, 1, 1, 1,
0.8875421, -0.4742283, 2.34824, 1, 1, 1, 1, 1,
0.8925593, 1.276813, 0.2350724, 1, 1, 1, 1, 1,
0.8939911, 1.08244, 1.833359, 1, 1, 1, 1, 1,
0.8951205, -0.03808537, 2.140691, 1, 1, 1, 1, 1,
0.9042763, -0.4712901, 3.933801, 1, 1, 1, 1, 1,
0.9070131, -1.757764, 4.240176, 0, 0, 1, 1, 1,
0.9092914, 0.1376887, 0.5809342, 1, 0, 0, 1, 1,
0.9098613, -0.5747401, 3.286479, 1, 0, 0, 1, 1,
0.9121348, -0.7105523, 1.827915, 1, 0, 0, 1, 1,
0.9161509, 1.051865, 1.097908, 1, 0, 0, 1, 1,
0.9185745, -0.2134282, 2.966425, 1, 0, 0, 1, 1,
0.9302553, 1.794733, 0.599202, 0, 0, 0, 1, 1,
0.9303611, -0.6194816, 2.312397, 0, 0, 0, 1, 1,
0.9326235, 1.227564, 1.550047, 0, 0, 0, 1, 1,
0.9407048, -0.2694307, 1.952246, 0, 0, 0, 1, 1,
0.9411668, -0.691871, 0.09276467, 0, 0, 0, 1, 1,
0.9473789, 0.4605891, 1.341441, 0, 0, 0, 1, 1,
0.9529966, -0.8894311, 1.660222, 0, 0, 0, 1, 1,
0.9571816, 0.6130401, 2.02041, 1, 1, 1, 1, 1,
0.9581783, 0.4993635, 1.216922, 1, 1, 1, 1, 1,
0.9595315, -0.2030778, -0.20242, 1, 1, 1, 1, 1,
0.9607872, 0.409796, -0.06114425, 1, 1, 1, 1, 1,
0.9638988, 0.593222, -1.617027, 1, 1, 1, 1, 1,
0.9686315, 0.6389746, 1.273148, 1, 1, 1, 1, 1,
0.9702007, -0.5652143, 2.85465, 1, 1, 1, 1, 1,
0.9714105, 0.1845836, 1.200011, 1, 1, 1, 1, 1,
0.9863345, -0.4671797, 2.297485, 1, 1, 1, 1, 1,
0.988562, 0.959357, 0.6744324, 1, 1, 1, 1, 1,
1.01205, -0.7669393, 3.373611, 1, 1, 1, 1, 1,
1.014217, -0.459648, 3.781181, 1, 1, 1, 1, 1,
1.015118, 1.10911, 1.375452, 1, 1, 1, 1, 1,
1.020525, -0.5251274, 0.1179196, 1, 1, 1, 1, 1,
1.021721, 0.1141611, 2.305761, 1, 1, 1, 1, 1,
1.021823, -1.025926, 1.905946, 0, 0, 1, 1, 1,
1.027315, -1.005567, 2.158433, 1, 0, 0, 1, 1,
1.034024, -1.774549, 2.167073, 1, 0, 0, 1, 1,
1.038129, -1.41859, 3.747662, 1, 0, 0, 1, 1,
1.041745, 2.14236, -0.307811, 1, 0, 0, 1, 1,
1.043144, 2.325238, 2.619865, 1, 0, 0, 1, 1,
1.047891, 0.7151691, 1.652609, 0, 0, 0, 1, 1,
1.0502, 1.259413, 1.563935, 0, 0, 0, 1, 1,
1.050367, -0.9494168, 1.762997, 0, 0, 0, 1, 1,
1.052577, 0.6428517, -0.3197704, 0, 0, 0, 1, 1,
1.05267, -1.460879, 1.523591, 0, 0, 0, 1, 1,
1.06122, -0.9787655, 3.413933, 0, 0, 0, 1, 1,
1.068013, -2.494738, 2.414289, 0, 0, 0, 1, 1,
1.068481, -0.8117023, 3.418806, 1, 1, 1, 1, 1,
1.078461, -0.7080513, 2.956463, 1, 1, 1, 1, 1,
1.078773, -1.799033, 3.436774, 1, 1, 1, 1, 1,
1.08452, 0.4051715, 0.5834348, 1, 1, 1, 1, 1,
1.084912, -0.5533422, 1.312978, 1, 1, 1, 1, 1,
1.086759, -1.307922, 2.187683, 1, 1, 1, 1, 1,
1.088425, 0.7823378, 0.7216862, 1, 1, 1, 1, 1,
1.09025, 0.0752607, 0.4378445, 1, 1, 1, 1, 1,
1.093521, -1.017449, -0.1587065, 1, 1, 1, 1, 1,
1.100156, 0.2186486, -0.2825464, 1, 1, 1, 1, 1,
1.104757, 0.8418568, 1.204169, 1, 1, 1, 1, 1,
1.112607, 0.2856216, 0.5905359, 1, 1, 1, 1, 1,
1.120871, -0.4925071, 4.487173, 1, 1, 1, 1, 1,
1.12796, -0.3395602, 0.9792346, 1, 1, 1, 1, 1,
1.133104, -0.2459305, 1.081764, 1, 1, 1, 1, 1,
1.13634, -0.476216, 2.37721, 0, 0, 1, 1, 1,
1.138153, 0.2443534, 1.959239, 1, 0, 0, 1, 1,
1.138311, -0.7153073, 1.3555, 1, 0, 0, 1, 1,
1.140858, -1.465268, 2.177038, 1, 0, 0, 1, 1,
1.14109, -0.08755548, 2.037639, 1, 0, 0, 1, 1,
1.142832, 0.5954075, 1.194774, 1, 0, 0, 1, 1,
1.147901, 0.4269873, 0.579209, 0, 0, 0, 1, 1,
1.152153, -0.5684831, 2.922709, 0, 0, 0, 1, 1,
1.153236, 0.1142404, -0.4953897, 0, 0, 0, 1, 1,
1.161843, -0.1266139, 0.1328526, 0, 0, 0, 1, 1,
1.171866, -0.04823868, 2.537584, 0, 0, 0, 1, 1,
1.176223, 0.01776525, 2.516545, 0, 0, 0, 1, 1,
1.184203, -1.376407, 1.671272, 0, 0, 0, 1, 1,
1.195816, 1.414276, 0.6591256, 1, 1, 1, 1, 1,
1.215053, 0.06420755, 1.057228, 1, 1, 1, 1, 1,
1.232705, -0.09354816, 2.287491, 1, 1, 1, 1, 1,
1.235388, -0.01083503, -0.3316334, 1, 1, 1, 1, 1,
1.238699, -0.3211439, 1.370452, 1, 1, 1, 1, 1,
1.252065, -1.162654, 1.245291, 1, 1, 1, 1, 1,
1.259352, 1.72952, -0.4249677, 1, 1, 1, 1, 1,
1.263937, 1.472116, 0.6723524, 1, 1, 1, 1, 1,
1.266236, 0.4039384, -0.5363539, 1, 1, 1, 1, 1,
1.269772, 1.793526, 0.1678574, 1, 1, 1, 1, 1,
1.275115, -0.4869278, 0.6447998, 1, 1, 1, 1, 1,
1.277078, 0.08875979, -0.18362, 1, 1, 1, 1, 1,
1.277248, 0.2093117, 0.151108, 1, 1, 1, 1, 1,
1.277757, -0.1226218, 1.360518, 1, 1, 1, 1, 1,
1.284193, 2.285708, 0.9892601, 1, 1, 1, 1, 1,
1.297634, 0.1554608, 1.500525, 0, 0, 1, 1, 1,
1.301107, 0.08789738, 0.4043384, 1, 0, 0, 1, 1,
1.304688, -0.8798138, 2.393999, 1, 0, 0, 1, 1,
1.306579, 1.528689, 2.274308, 1, 0, 0, 1, 1,
1.307896, -1.348548, 0.6283999, 1, 0, 0, 1, 1,
1.327013, -0.158989, 1.551731, 1, 0, 0, 1, 1,
1.335151, -0.8137764, 1.247803, 0, 0, 0, 1, 1,
1.350473, -1.70814, 3.04419, 0, 0, 0, 1, 1,
1.36167, -1.318877, -0.1830091, 0, 0, 0, 1, 1,
1.382711, -0.7971467, 2.636845, 0, 0, 0, 1, 1,
1.390368, 0.4239221, 0.9830467, 0, 0, 0, 1, 1,
1.390492, 1.25883, -0.02286927, 0, 0, 0, 1, 1,
1.399442, 0.3668547, 2.077802, 0, 0, 0, 1, 1,
1.408776, -0.9107376, 1.538083, 1, 1, 1, 1, 1,
1.414547, -0.5175794, 1.294804, 1, 1, 1, 1, 1,
1.423785, 0.5187348, 0.7970811, 1, 1, 1, 1, 1,
1.432673, -0.5683311, 1.213487, 1, 1, 1, 1, 1,
1.438617, 1.095197, 0.4940318, 1, 1, 1, 1, 1,
1.443472, 0.4372272, 0.7527206, 1, 1, 1, 1, 1,
1.444574, 1.175412, 1.444741, 1, 1, 1, 1, 1,
1.449518, -0.5327846, 2.081532, 1, 1, 1, 1, 1,
1.450605, 1.292015, -0.0989589, 1, 1, 1, 1, 1,
1.453988, 0.08883473, 0.4195591, 1, 1, 1, 1, 1,
1.456758, 0.8086984, 2.276313, 1, 1, 1, 1, 1,
1.458629, 0.08842133, 2.179886, 1, 1, 1, 1, 1,
1.459895, 0.2885543, 1.574261, 1, 1, 1, 1, 1,
1.462422, 0.9803144, 1.15909, 1, 1, 1, 1, 1,
1.474556, -0.2967498, -0.8513202, 1, 1, 1, 1, 1,
1.479764, -1.069908, 3.523186, 0, 0, 1, 1, 1,
1.484283, 0.7016432, 2.102739, 1, 0, 0, 1, 1,
1.492654, -1.405167, 2.018357, 1, 0, 0, 1, 1,
1.495113, 0.2311853, 1.57857, 1, 0, 0, 1, 1,
1.505842, -0.8524473, 2.764863, 1, 0, 0, 1, 1,
1.507888, -0.7222344, 1.437047, 1, 0, 0, 1, 1,
1.509579, 0.7808319, 1.729649, 0, 0, 0, 1, 1,
1.523739, -0.7502993, 1.407497, 0, 0, 0, 1, 1,
1.524071, 0.04933633, 2.283212, 0, 0, 0, 1, 1,
1.532217, -0.2058035, 1.993361, 0, 0, 0, 1, 1,
1.548393, -0.3742667, 1.414787, 0, 0, 0, 1, 1,
1.548604, 0.2833025, 2.83394, 0, 0, 0, 1, 1,
1.551331, -0.4071741, 1.737182, 0, 0, 0, 1, 1,
1.554164, 0.8079555, -0.02573927, 1, 1, 1, 1, 1,
1.555526, 0.7443574, -0.5470498, 1, 1, 1, 1, 1,
1.556072, 0.6590576, 1.611803, 1, 1, 1, 1, 1,
1.571155, 0.626658, 0.8809618, 1, 1, 1, 1, 1,
1.579086, -0.3628498, 1.967571, 1, 1, 1, 1, 1,
1.593127, 1.071757, 1.624148, 1, 1, 1, 1, 1,
1.595612, 0.1776247, 1.510662, 1, 1, 1, 1, 1,
1.609479, 1.346853, 0.907033, 1, 1, 1, 1, 1,
1.619119, -1.054101, 2.47955, 1, 1, 1, 1, 1,
1.627481, -0.8526886, 1.373146, 1, 1, 1, 1, 1,
1.628574, -1.04227, 1.938957, 1, 1, 1, 1, 1,
1.629925, 1.281594, -1.29842, 1, 1, 1, 1, 1,
1.631923, 2.26002, 1.158996, 1, 1, 1, 1, 1,
1.633012, -0.8708158, 2.508438, 1, 1, 1, 1, 1,
1.651535, 1.830085, 2.115972, 1, 1, 1, 1, 1,
1.651817, 0.4465316, 2.653262, 0, 0, 1, 1, 1,
1.667349, 0.5209506, 1.137337, 1, 0, 0, 1, 1,
1.67034, -0.2808753, 1.392318, 1, 0, 0, 1, 1,
1.683657, 0.3373469, 0.2534883, 1, 0, 0, 1, 1,
1.684445, 0.8189568, 0.9840548, 1, 0, 0, 1, 1,
1.686107, 1.240086, 0.8564216, 1, 0, 0, 1, 1,
1.688929, 0.5159459, 0.9781534, 0, 0, 0, 1, 1,
1.699116, -0.07549299, 0.7432081, 0, 0, 0, 1, 1,
1.718722, 0.62945, -0.1223098, 0, 0, 0, 1, 1,
1.726293, -0.557727, 3.843947, 0, 0, 0, 1, 1,
1.726423, 0.9234977, 0.7804499, 0, 0, 0, 1, 1,
1.730778, -0.3767023, 2.563646, 0, 0, 0, 1, 1,
1.732306, 0.3959258, 2.994169, 0, 0, 0, 1, 1,
1.733167, -1.718944, 2.641404, 1, 1, 1, 1, 1,
1.735557, -1.443014, 2.143677, 1, 1, 1, 1, 1,
1.743655, 1.003266, 2.401573, 1, 1, 1, 1, 1,
1.745543, 0.7805867, 0.5913024, 1, 1, 1, 1, 1,
1.747154, 0.6415545, 1.877337, 1, 1, 1, 1, 1,
1.749679, 1.750986, 0.2078166, 1, 1, 1, 1, 1,
1.750795, -0.9328251, 3.039037, 1, 1, 1, 1, 1,
1.759145, 0.4566047, 2.204911, 1, 1, 1, 1, 1,
1.807956, 0.07571273, 1.050672, 1, 1, 1, 1, 1,
1.810746, -0.98996, 1.915918, 1, 1, 1, 1, 1,
1.816654, 1.434794, 1.88014, 1, 1, 1, 1, 1,
1.903773, -0.4077665, 3.950443, 1, 1, 1, 1, 1,
1.912573, -2.401876, 2.312152, 1, 1, 1, 1, 1,
1.945396, -1.076511, 1.310955, 1, 1, 1, 1, 1,
1.998898, -0.6325083, 1.474598, 1, 1, 1, 1, 1,
2.017289, 0.7427471, 0.4611367, 0, 0, 1, 1, 1,
2.019176, 1.865091, 0.3194506, 1, 0, 0, 1, 1,
2.034893, 1.393242, 0.5519543, 1, 0, 0, 1, 1,
2.035886, -0.3832434, 1.929006, 1, 0, 0, 1, 1,
2.076579, -0.05995653, 1.97934, 1, 0, 0, 1, 1,
2.137084, 0.7226231, 1.02202, 1, 0, 0, 1, 1,
2.146919, -1.137126, 2.471204, 0, 0, 0, 1, 1,
2.163143, 0.5722563, 1.252707, 0, 0, 0, 1, 1,
2.173879, 0.3589101, 2.356784, 0, 0, 0, 1, 1,
2.235485, -0.1960547, 0.6646913, 0, 0, 0, 1, 1,
2.278151, 1.083759, 2.076007, 0, 0, 0, 1, 1,
2.315189, 0.09654945, 1.379977, 0, 0, 0, 1, 1,
2.399272, 1.598634, 0.6993548, 0, 0, 0, 1, 1,
2.40905, -0.4980457, 1.802149, 1, 1, 1, 1, 1,
2.428046, -0.8765365, 0.8336316, 1, 1, 1, 1, 1,
2.478752, -0.6895285, 0.8849827, 1, 1, 1, 1, 1,
2.591969, -0.7249062, 1.319285, 1, 1, 1, 1, 1,
2.81801, -1.761054, 2.694443, 1, 1, 1, 1, 1,
2.818583, 0.2832843, 1.025757, 1, 1, 1, 1, 1,
2.863557, -0.8536949, 1.855012, 1, 1, 1, 1, 1
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
var radius = 9.369774;
var distance = 32.91093;
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
mvMatrix.translate( 0.3844213, 0.1830018, 0.2413864 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.91093);
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
