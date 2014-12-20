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
-3.277046, -1.513097, -0.9807782, 1, 0, 0, 1,
-2.707075, -1.216881, -2.045342, 1, 0.007843138, 0, 1,
-2.672911, -0.1012767, -2.322026, 1, 0.01176471, 0, 1,
-2.620489, -0.9265357, -0.4133494, 1, 0.01960784, 0, 1,
-2.577997, -1.835644, -2.206858, 1, 0.02352941, 0, 1,
-2.551533, -0.4670687, -2.490218, 1, 0.03137255, 0, 1,
-2.5339, -0.1233278, -1.828067, 1, 0.03529412, 0, 1,
-2.491863, 0.6377226, -2.131308, 1, 0.04313726, 0, 1,
-2.479327, -0.6726021, -3.384102, 1, 0.04705882, 0, 1,
-2.422579, -0.04672495, -0.8252444, 1, 0.05490196, 0, 1,
-2.394129, 0.4127994, -0.405696, 1, 0.05882353, 0, 1,
-2.378779, 0.8243569, -0.7083104, 1, 0.06666667, 0, 1,
-2.366126, 0.4643227, -1.387174, 1, 0.07058824, 0, 1,
-2.196832, 0.2455941, -1.151351, 1, 0.07843138, 0, 1,
-2.179773, -0.4394063, -1.15313, 1, 0.08235294, 0, 1,
-2.163593, 0.01941359, -1.040944, 1, 0.09019608, 0, 1,
-2.13791, -1.516421, -1.787513, 1, 0.09411765, 0, 1,
-2.124575, 0.001455621, 0.426183, 1, 0.1019608, 0, 1,
-2.119331, -0.1071498, -1.764791, 1, 0.1098039, 0, 1,
-2.088109, -0.4823408, -1.412058, 1, 0.1137255, 0, 1,
-2.074559, 0.01538933, 0.08282127, 1, 0.1215686, 0, 1,
-2.065897, -0.7063845, -1.166833, 1, 0.1254902, 0, 1,
-2.047036, -1.140013, -1.288915, 1, 0.1333333, 0, 1,
-2.031505, 0.09879901, -0.5264049, 1, 0.1372549, 0, 1,
-2.019531, -1.934011, -3.250614, 1, 0.145098, 0, 1,
-1.992113, -1.629966, -2.068682, 1, 0.1490196, 0, 1,
-1.986973, -0.06488974, -1.10621, 1, 0.1568628, 0, 1,
-1.981635, 0.3194964, -1.945665, 1, 0.1607843, 0, 1,
-1.954412, 0.40756, -2.328309, 1, 0.1686275, 0, 1,
-1.945689, -0.2069453, -3.070543, 1, 0.172549, 0, 1,
-1.868016, 0.5038365, -1.739834, 1, 0.1803922, 0, 1,
-1.867437, -1.423226, -2.787262, 1, 0.1843137, 0, 1,
-1.861756, 1.660259, -1.681188, 1, 0.1921569, 0, 1,
-1.849597, 1.929793, -1.781559, 1, 0.1960784, 0, 1,
-1.84835, -0.1909221, -0.2107965, 1, 0.2039216, 0, 1,
-1.834434, 0.1469803, -1.034624, 1, 0.2117647, 0, 1,
-1.81631, 0.7842718, -2.802059, 1, 0.2156863, 0, 1,
-1.81286, 0.04000615, -2.809936, 1, 0.2235294, 0, 1,
-1.788816, 1.141431, -1.331788, 1, 0.227451, 0, 1,
-1.779171, 0.5621234, -0.06526194, 1, 0.2352941, 0, 1,
-1.760642, -0.1589486, -1.889684, 1, 0.2392157, 0, 1,
-1.747873, 1.134691, -1.689897, 1, 0.2470588, 0, 1,
-1.739566, -0.6470292, -1.724669, 1, 0.2509804, 0, 1,
-1.733669, 2.717329, -0.8645877, 1, 0.2588235, 0, 1,
-1.726993, 1.425025, -1.575178, 1, 0.2627451, 0, 1,
-1.708193, 0.8427079, -1.074283, 1, 0.2705882, 0, 1,
-1.699027, 1.340389, -0.8867152, 1, 0.2745098, 0, 1,
-1.68181, -1.462399, -1.469106, 1, 0.282353, 0, 1,
-1.675028, 0.2335926, -1.341671, 1, 0.2862745, 0, 1,
-1.672398, 0.06967109, -1.88882, 1, 0.2941177, 0, 1,
-1.670276, 0.444062, -3.294065, 1, 0.3019608, 0, 1,
-1.666054, 0.2515789, -1.495313, 1, 0.3058824, 0, 1,
-1.645097, 0.9381701, -1.460973, 1, 0.3137255, 0, 1,
-1.634751, 0.5339193, -1.775633, 1, 0.3176471, 0, 1,
-1.632941, -1.992104, -2.7946, 1, 0.3254902, 0, 1,
-1.631096, 0.8219705, -0.6263081, 1, 0.3294118, 0, 1,
-1.630677, 1.886564, 1.366041, 1, 0.3372549, 0, 1,
-1.630245, 0.07344379, 0.3390152, 1, 0.3411765, 0, 1,
-1.626719, -0.9161151, -3.22425, 1, 0.3490196, 0, 1,
-1.620046, -0.9484074, -2.489751, 1, 0.3529412, 0, 1,
-1.591377, -0.500752, -3.057019, 1, 0.3607843, 0, 1,
-1.583401, -0.01130958, -3.19189, 1, 0.3647059, 0, 1,
-1.580909, 0.03171672, -2.392718, 1, 0.372549, 0, 1,
-1.564321, 0.08763562, -1.573896, 1, 0.3764706, 0, 1,
-1.558651, -1.312013, -1.285123, 1, 0.3843137, 0, 1,
-1.549005, -0.08064838, -3.173243, 1, 0.3882353, 0, 1,
-1.543046, -0.6703635, -1.706658, 1, 0.3960784, 0, 1,
-1.542412, -0.1344583, -2.260539, 1, 0.4039216, 0, 1,
-1.531301, 1.834964, -0.5877515, 1, 0.4078431, 0, 1,
-1.530646, -0.649689, -4.317172, 1, 0.4156863, 0, 1,
-1.529057, -1.800871, -3.464798, 1, 0.4196078, 0, 1,
-1.526826, -1.475246, -1.492546, 1, 0.427451, 0, 1,
-1.525887, 0.9267513, -1.559083, 1, 0.4313726, 0, 1,
-1.51351, -1.237116, -2.701181, 1, 0.4392157, 0, 1,
-1.506776, 0.2020437, -1.852493, 1, 0.4431373, 0, 1,
-1.49606, 0.3235419, -1.740863, 1, 0.4509804, 0, 1,
-1.489483, -0.1076293, -2.594013, 1, 0.454902, 0, 1,
-1.486305, -1.538906, -2.454264, 1, 0.4627451, 0, 1,
-1.481845, -0.04879547, -1.525059, 1, 0.4666667, 0, 1,
-1.478967, -0.4009376, -0.9615361, 1, 0.4745098, 0, 1,
-1.461632, -0.1146395, -1.789888, 1, 0.4784314, 0, 1,
-1.457547, 0.9451806, -1.897439, 1, 0.4862745, 0, 1,
-1.45157, -2.144367, -1.878245, 1, 0.4901961, 0, 1,
-1.443419, 1.41015, -1.248331, 1, 0.4980392, 0, 1,
-1.43426, -0.7587223, -2.372274, 1, 0.5058824, 0, 1,
-1.428662, -1.540121, -1.821801, 1, 0.509804, 0, 1,
-1.428653, 2.242431, -1.543691, 1, 0.5176471, 0, 1,
-1.424689, 0.4308418, -0.4868012, 1, 0.5215687, 0, 1,
-1.424095, 1.154981, 0.1509539, 1, 0.5294118, 0, 1,
-1.422813, 1.64009, 0.03937407, 1, 0.5333334, 0, 1,
-1.420556, -1.180531, -2.551019, 1, 0.5411765, 0, 1,
-1.415278, 1.594977, -0.8344313, 1, 0.5450981, 0, 1,
-1.409398, 1.430924, -1.335482, 1, 0.5529412, 0, 1,
-1.380916, 1.480793, -1.782831, 1, 0.5568628, 0, 1,
-1.378789, 0.9581001, -0.76518, 1, 0.5647059, 0, 1,
-1.375983, -0.0797163, 0.1917927, 1, 0.5686275, 0, 1,
-1.373449, 1.046173, -0.6816923, 1, 0.5764706, 0, 1,
-1.364672, -1.003778, -2.301333, 1, 0.5803922, 0, 1,
-1.363757, -0.6197585, -2.595247, 1, 0.5882353, 0, 1,
-1.360328, -0.1104643, -2.306924, 1, 0.5921569, 0, 1,
-1.359401, -0.167619, -2.617694, 1, 0.6, 0, 1,
-1.359059, -0.1579947, -2.453207, 1, 0.6078432, 0, 1,
-1.35616, 1.763118, -0.01024069, 1, 0.6117647, 0, 1,
-1.352764, 0.4209146, -0.495837, 1, 0.6196079, 0, 1,
-1.351075, 1.49466, 0.8673785, 1, 0.6235294, 0, 1,
-1.349069, 0.01427212, -0.8575858, 1, 0.6313726, 0, 1,
-1.34646, 1.125926, -0.3954788, 1, 0.6352941, 0, 1,
-1.346046, -0.6185513, -3.046976, 1, 0.6431373, 0, 1,
-1.342809, 0.6459295, 1.041436, 1, 0.6470588, 0, 1,
-1.318651, -0.4054604, -2.609284, 1, 0.654902, 0, 1,
-1.315187, -0.1330537, -2.5449, 1, 0.6588235, 0, 1,
-1.307334, 0.1765609, -1.794815, 1, 0.6666667, 0, 1,
-1.301394, 1.25395, 2.15045, 1, 0.6705883, 0, 1,
-1.297229, 0.9345964, -0.8940151, 1, 0.6784314, 0, 1,
-1.294583, 0.4247752, -1.416348, 1, 0.682353, 0, 1,
-1.292545, 0.9582045, -0.8490814, 1, 0.6901961, 0, 1,
-1.278937, -0.02218156, -0.6836783, 1, 0.6941177, 0, 1,
-1.277609, 1.81497, 0.8991961, 1, 0.7019608, 0, 1,
-1.274135, -0.4848066, -2.043844, 1, 0.7098039, 0, 1,
-1.272386, 1.029096, 0.6897326, 1, 0.7137255, 0, 1,
-1.271752, -0.5819317, -1.306244, 1, 0.7215686, 0, 1,
-1.270163, -0.5035691, -1.93643, 1, 0.7254902, 0, 1,
-1.270063, 1.266471, -0.6303834, 1, 0.7333333, 0, 1,
-1.266567, 0.4046414, -1.923645, 1, 0.7372549, 0, 1,
-1.258968, -0.3241188, -2.920131, 1, 0.7450981, 0, 1,
-1.25208, 0.5771842, -1.450397, 1, 0.7490196, 0, 1,
-1.248728, -0.9584744, -1.114564, 1, 0.7568628, 0, 1,
-1.240169, 0.7314739, -2.17933, 1, 0.7607843, 0, 1,
-1.238996, 0.1567226, -3.165232, 1, 0.7686275, 0, 1,
-1.234631, 0.9586635, -1.018099, 1, 0.772549, 0, 1,
-1.226807, 0.5389592, 0.8989239, 1, 0.7803922, 0, 1,
-1.221299, 2.493832, 0.07717737, 1, 0.7843137, 0, 1,
-1.215567, -1.200775, -3.010959, 1, 0.7921569, 0, 1,
-1.21315, 0.5718384, -1.451308, 1, 0.7960784, 0, 1,
-1.20478, -0.9774981, -2.707839, 1, 0.8039216, 0, 1,
-1.198954, 0.2387803, -0.06275002, 1, 0.8117647, 0, 1,
-1.195959, 0.5218913, -0.9137045, 1, 0.8156863, 0, 1,
-1.178411, -0.6603054, -1.275072, 1, 0.8235294, 0, 1,
-1.173985, -0.04822725, -0.672833, 1, 0.827451, 0, 1,
-1.170621, 1.338763, -0.1144682, 1, 0.8352941, 0, 1,
-1.169767, -1.492942, -0.8996583, 1, 0.8392157, 0, 1,
-1.167584, 0.8211331, 0.3091148, 1, 0.8470588, 0, 1,
-1.162272, 1.383449, -4.107592, 1, 0.8509804, 0, 1,
-1.160418, 0.7621176, -0.8248025, 1, 0.8588235, 0, 1,
-1.155967, 0.3317452, -2.309778, 1, 0.8627451, 0, 1,
-1.153248, 0.9500707, -0.7529963, 1, 0.8705882, 0, 1,
-1.130696, 1.551322, -0.0006111639, 1, 0.8745098, 0, 1,
-1.124224, -0.3419141, -4.036478, 1, 0.8823529, 0, 1,
-1.121986, -0.6411916, -1.021198, 1, 0.8862745, 0, 1,
-1.120627, 0.6681629, -0.8294898, 1, 0.8941177, 0, 1,
-1.114954, 1.895792, -3.130148, 1, 0.8980392, 0, 1,
-1.112732, -0.4425653, -1.791904, 1, 0.9058824, 0, 1,
-1.108819, -1.686023, -2.713707, 1, 0.9137255, 0, 1,
-1.098187, 0.6217456, -2.442313, 1, 0.9176471, 0, 1,
-1.097625, 0.9333073, -2.998886, 1, 0.9254902, 0, 1,
-1.097625, -1.14708, -3.837705, 1, 0.9294118, 0, 1,
-1.095572, 1.167038, -0.4226682, 1, 0.9372549, 0, 1,
-1.087265, 1.910288, -0.7086406, 1, 0.9411765, 0, 1,
-1.087135, 0.9707217, -0.4013332, 1, 0.9490196, 0, 1,
-1.083913, 0.1214888, -0.7969471, 1, 0.9529412, 0, 1,
-1.078138, -0.7744516, -2.406549, 1, 0.9607843, 0, 1,
-1.068558, 0.5345893, -0.1657075, 1, 0.9647059, 0, 1,
-1.067163, -1.718977, -2.517496, 1, 0.972549, 0, 1,
-1.06194, -1.381127, -2.763951, 1, 0.9764706, 0, 1,
-1.061644, 0.8818588, -0.6799679, 1, 0.9843137, 0, 1,
-1.054467, 0.1732248, 0.5083074, 1, 0.9882353, 0, 1,
-1.052396, -0.242988, -2.835868, 1, 0.9960784, 0, 1,
-1.052263, 0.4023496, -2.048461, 0.9960784, 1, 0, 1,
-1.052091, -1.376421, -3.059952, 0.9921569, 1, 0, 1,
-1.047472, -1.787376, -3.048561, 0.9843137, 1, 0, 1,
-1.044372, -0.8376167, -2.206878, 0.9803922, 1, 0, 1,
-1.038906, -1.545784, -1.750747, 0.972549, 1, 0, 1,
-1.038633, -1.775562, -4.231999, 0.9686275, 1, 0, 1,
-1.037745, 0.2346068, -1.714822, 0.9607843, 1, 0, 1,
-1.030318, 1.237847, -0.007693946, 0.9568627, 1, 0, 1,
-1.022329, 1.288707, -2.71719, 0.9490196, 1, 0, 1,
-1.019788, -0.916635, -2.110517, 0.945098, 1, 0, 1,
-1.01758, 0.8428776, -0.2344039, 0.9372549, 1, 0, 1,
-1.012615, 0.5926716, -2.195114, 0.9333333, 1, 0, 1,
-1.007304, -2.094802, -3.693213, 0.9254902, 1, 0, 1,
-1.005939, 0.3088336, -0.3760546, 0.9215686, 1, 0, 1,
-1.005107, 0.5771125, -1.005898, 0.9137255, 1, 0, 1,
-0.9943357, 0.4850497, -1.238875, 0.9098039, 1, 0, 1,
-0.9931322, -0.9105401, -2.620582, 0.9019608, 1, 0, 1,
-0.9853764, -0.163447, -1.181263, 0.8941177, 1, 0, 1,
-0.9837783, 0.2074498, -2.742494, 0.8901961, 1, 0, 1,
-0.9817258, 0.6107622, -1.798617, 0.8823529, 1, 0, 1,
-0.9790682, -1.387825, -2.428792, 0.8784314, 1, 0, 1,
-0.9647323, -1.185424, -3.178652, 0.8705882, 1, 0, 1,
-0.963986, -0.9590171, -0.8890318, 0.8666667, 1, 0, 1,
-0.9607705, 0.2393515, -0.4332087, 0.8588235, 1, 0, 1,
-0.9592174, -0.09277261, -1.512772, 0.854902, 1, 0, 1,
-0.9486402, 0.8340592, -1.707295, 0.8470588, 1, 0, 1,
-0.9473118, 1.070541, -2.421737, 0.8431373, 1, 0, 1,
-0.9385223, 1.45508, -0.9945927, 0.8352941, 1, 0, 1,
-0.9379551, 1.282572, -0.3216911, 0.8313726, 1, 0, 1,
-0.9370298, 0.08266487, -2.099787, 0.8235294, 1, 0, 1,
-0.9341326, -0.2627179, -0.489631, 0.8196079, 1, 0, 1,
-0.9227896, 0.02751699, -3.413603, 0.8117647, 1, 0, 1,
-0.9146088, -0.8605561, -2.22756, 0.8078431, 1, 0, 1,
-0.9134652, 0.787119, -0.474209, 0.8, 1, 0, 1,
-0.9122818, -0.1931865, -1.108097, 0.7921569, 1, 0, 1,
-0.9067946, -0.0334997, -2.963606, 0.7882353, 1, 0, 1,
-0.900925, 2.663016, -0.004585542, 0.7803922, 1, 0, 1,
-0.8996675, -1.028155, -1.813951, 0.7764706, 1, 0, 1,
-0.8933571, 1.253647, -0.6144602, 0.7686275, 1, 0, 1,
-0.8912253, -0.040885, -0.9893928, 0.7647059, 1, 0, 1,
-0.8883638, 1.134109, -0.2071198, 0.7568628, 1, 0, 1,
-0.8833946, 0.9017128, 1.048536, 0.7529412, 1, 0, 1,
-0.8820621, -1.637148, -1.86326, 0.7450981, 1, 0, 1,
-0.879887, 0.1621304, -1.630329, 0.7411765, 1, 0, 1,
-0.8780581, 0.6317974, -0.5424915, 0.7333333, 1, 0, 1,
-0.8713314, -0.8230055, -2.554766, 0.7294118, 1, 0, 1,
-0.8685462, 1.114591, -1.416842, 0.7215686, 1, 0, 1,
-0.867433, 0.4525973, -1.069454, 0.7176471, 1, 0, 1,
-0.8671882, 1.574443, -0.9642166, 0.7098039, 1, 0, 1,
-0.8637363, 0.2214213, -1.039465, 0.7058824, 1, 0, 1,
-0.8634893, -0.5715321, -3.251119, 0.6980392, 1, 0, 1,
-0.8611895, 0.4343476, -1.923199, 0.6901961, 1, 0, 1,
-0.8596461, 0.8211279, -3.213827, 0.6862745, 1, 0, 1,
-0.8548126, 1.487176, 1.101692, 0.6784314, 1, 0, 1,
-0.8469399, 0.5636891, -1.381806, 0.6745098, 1, 0, 1,
-0.8379502, 1.295275, -0.09626465, 0.6666667, 1, 0, 1,
-0.8337443, -0.7388396, -1.113264, 0.6627451, 1, 0, 1,
-0.8336819, 0.4741442, -2.277066, 0.654902, 1, 0, 1,
-0.81857, 0.5896452, -1.157534, 0.6509804, 1, 0, 1,
-0.8182265, -1.435469, -1.920016, 0.6431373, 1, 0, 1,
-0.814805, -1.761698, 0.2022468, 0.6392157, 1, 0, 1,
-0.8134136, 0.1841814, -1.683292, 0.6313726, 1, 0, 1,
-0.8041829, 0.2859119, -2.210798, 0.627451, 1, 0, 1,
-0.8041068, 0.3804962, 0.358705, 0.6196079, 1, 0, 1,
-0.802914, 0.8418469, 0.1542688, 0.6156863, 1, 0, 1,
-0.8003049, 0.281657, -1.067497, 0.6078432, 1, 0, 1,
-0.7924381, 1.557339, 0.2911116, 0.6039216, 1, 0, 1,
-0.7922556, 0.1540762, -1.871836, 0.5960785, 1, 0, 1,
-0.7916861, 2.140809, -0.8437976, 0.5882353, 1, 0, 1,
-0.7904322, -0.02883833, -1.421228, 0.5843138, 1, 0, 1,
-0.7889275, 1.099761, -1.233469, 0.5764706, 1, 0, 1,
-0.7882695, 1.217132, -2.862787, 0.572549, 1, 0, 1,
-0.7848151, 0.05219711, -1.678062, 0.5647059, 1, 0, 1,
-0.7723966, 0.76561, -0.02655344, 0.5607843, 1, 0, 1,
-0.7697778, -0.4304262, -2.688004, 0.5529412, 1, 0, 1,
-0.7697749, -0.1556601, -1.163481, 0.5490196, 1, 0, 1,
-0.763404, 0.03110346, -1.469277, 0.5411765, 1, 0, 1,
-0.7628179, -0.1260462, 0.6347775, 0.5372549, 1, 0, 1,
-0.7598193, 0.1608187, -0.1938078, 0.5294118, 1, 0, 1,
-0.7525099, 0.8087001, -0.1784892, 0.5254902, 1, 0, 1,
-0.7518573, 0.3437053, -1.341907, 0.5176471, 1, 0, 1,
-0.7515832, 0.7517521, -2.510383, 0.5137255, 1, 0, 1,
-0.7494376, 0.3158213, -0.1100921, 0.5058824, 1, 0, 1,
-0.7333722, 1.756333, -0.7625021, 0.5019608, 1, 0, 1,
-0.7325644, -0.955426, -2.433385, 0.4941176, 1, 0, 1,
-0.7230815, -0.09338907, -1.906821, 0.4862745, 1, 0, 1,
-0.716867, -1.48853, -2.545262, 0.4823529, 1, 0, 1,
-0.7151539, 0.6710154, -0.6557396, 0.4745098, 1, 0, 1,
-0.7098839, -0.001661753, -1.500216, 0.4705882, 1, 0, 1,
-0.7075396, 2.29973, -1.232932, 0.4627451, 1, 0, 1,
-0.7049814, 0.7190061, 0.144991, 0.4588235, 1, 0, 1,
-0.7014623, 0.4382809, -0.849431, 0.4509804, 1, 0, 1,
-0.7013442, -0.4083301, -1.194585, 0.4470588, 1, 0, 1,
-0.6980911, -1.341197, -1.762836, 0.4392157, 1, 0, 1,
-0.6972253, 0.7857718, -2.8931, 0.4352941, 1, 0, 1,
-0.6968726, -0.3300777, -1.315258, 0.427451, 1, 0, 1,
-0.6931319, 0.4208391, -0.6904896, 0.4235294, 1, 0, 1,
-0.6879182, -1.107337, -2.647726, 0.4156863, 1, 0, 1,
-0.6771844, 2.07038, -1.605032, 0.4117647, 1, 0, 1,
-0.6748019, 0.5144838, 0.9176903, 0.4039216, 1, 0, 1,
-0.6738172, 0.09804922, -0.6008072, 0.3960784, 1, 0, 1,
-0.6718752, 0.5369214, -0.3548121, 0.3921569, 1, 0, 1,
-0.671414, 0.5330963, 0.1362898, 0.3843137, 1, 0, 1,
-0.6711392, 1.009248, 1.523333, 0.3803922, 1, 0, 1,
-0.6615286, 1.657742, -1.405042, 0.372549, 1, 0, 1,
-0.6597809, -1.467184, -2.956457, 0.3686275, 1, 0, 1,
-0.6546528, 0.7383451, -0.483001, 0.3607843, 1, 0, 1,
-0.6528909, 0.3790869, -0.9891998, 0.3568628, 1, 0, 1,
-0.6492455, -1.054217, -2.213177, 0.3490196, 1, 0, 1,
-0.6448788, 0.3394903, -1.553879, 0.345098, 1, 0, 1,
-0.6407113, -0.3882034, -2.375793, 0.3372549, 1, 0, 1,
-0.6392336, -1.157616, -1.398959, 0.3333333, 1, 0, 1,
-0.6335943, -0.2591545, -1.346185, 0.3254902, 1, 0, 1,
-0.6335328, -1.334155, -2.775532, 0.3215686, 1, 0, 1,
-0.630181, -1.287235, -3.28932, 0.3137255, 1, 0, 1,
-0.6296833, 0.6319805, -0.7686421, 0.3098039, 1, 0, 1,
-0.6222841, 1.098748, -0.7169185, 0.3019608, 1, 0, 1,
-0.6212291, -0.9385021, -2.694138, 0.2941177, 1, 0, 1,
-0.618767, -0.3543382, -1.863733, 0.2901961, 1, 0, 1,
-0.6146697, -1.816534, -3.513467, 0.282353, 1, 0, 1,
-0.6105929, 1.397708, -2.033641, 0.2784314, 1, 0, 1,
-0.6094895, 0.4974472, -0.8309271, 0.2705882, 1, 0, 1,
-0.6071477, -1.868924, -4.755276, 0.2666667, 1, 0, 1,
-0.6033724, -1.191668, -4.201054, 0.2588235, 1, 0, 1,
-0.6014516, -0.5726761, -3.057214, 0.254902, 1, 0, 1,
-0.5978412, 1.046095, -0.111182, 0.2470588, 1, 0, 1,
-0.5961739, -0.1510959, -0.8839287, 0.2431373, 1, 0, 1,
-0.5944623, 0.3063843, -0.7565822, 0.2352941, 1, 0, 1,
-0.5944417, -0.9715263, -2.687653, 0.2313726, 1, 0, 1,
-0.5942529, -1.075431, -3.219207, 0.2235294, 1, 0, 1,
-0.5925851, -0.1174579, -2.363479, 0.2196078, 1, 0, 1,
-0.5894043, -1.39308, -2.973101, 0.2117647, 1, 0, 1,
-0.5875266, -0.4282556, -1.771267, 0.2078431, 1, 0, 1,
-0.5856817, 0.5233072, -0.7731898, 0.2, 1, 0, 1,
-0.5854439, 0.4180778, -1.534289, 0.1921569, 1, 0, 1,
-0.5844136, -0.3063481, -0.1339222, 0.1882353, 1, 0, 1,
-0.5839087, 0.9232895, 0.8717875, 0.1803922, 1, 0, 1,
-0.5764186, 2.320089, -0.4284829, 0.1764706, 1, 0, 1,
-0.5728451, 0.2566039, -1.037378, 0.1686275, 1, 0, 1,
-0.5708156, -0.4595657, -2.84361, 0.1647059, 1, 0, 1,
-0.5694754, 1.683094, -0.7014477, 0.1568628, 1, 0, 1,
-0.5688445, 0.6504377, -0.7698324, 0.1529412, 1, 0, 1,
-0.5598263, -0.2703887, -2.144426, 0.145098, 1, 0, 1,
-0.5582204, 0.5984712, -3.000128, 0.1411765, 1, 0, 1,
-0.5554701, 0.3153155, -1.172821, 0.1333333, 1, 0, 1,
-0.5548978, 0.4535352, -0.5211911, 0.1294118, 1, 0, 1,
-0.5524195, -0.3764116, -2.024626, 0.1215686, 1, 0, 1,
-0.5466616, 0.2241854, -1.70755, 0.1176471, 1, 0, 1,
-0.5435393, -0.07644605, -1.631357, 0.1098039, 1, 0, 1,
-0.5417271, 0.7439502, -0.1388622, 0.1058824, 1, 0, 1,
-0.541611, 1.195919, 0.4159351, 0.09803922, 1, 0, 1,
-0.5351884, -0.2106401, -1.802578, 0.09019608, 1, 0, 1,
-0.5329933, -0.983447, -1.730474, 0.08627451, 1, 0, 1,
-0.5282902, 0.3993933, -0.7707599, 0.07843138, 1, 0, 1,
-0.5185609, -0.5548145, -1.930273, 0.07450981, 1, 0, 1,
-0.5180056, -0.6402152, -3.34784, 0.06666667, 1, 0, 1,
-0.5153373, -0.6844949, -2.424211, 0.0627451, 1, 0, 1,
-0.5117851, -2.036195, -2.470612, 0.05490196, 1, 0, 1,
-0.5087094, -0.8793516, -2.356798, 0.05098039, 1, 0, 1,
-0.5054435, 0.4379914, -0.7085791, 0.04313726, 1, 0, 1,
-0.5043896, -0.4042535, -1.780162, 0.03921569, 1, 0, 1,
-0.5018772, -0.03912299, -1.525805, 0.03137255, 1, 0, 1,
-0.4984169, 0.7437677, -2.216605, 0.02745098, 1, 0, 1,
-0.4981912, -0.243619, -1.08492, 0.01960784, 1, 0, 1,
-0.4977314, -1.56935, -2.424714, 0.01568628, 1, 0, 1,
-0.4966981, 2.427624, -0.3513912, 0.007843138, 1, 0, 1,
-0.4900243, -0.9385893, -3.01416, 0.003921569, 1, 0, 1,
-0.4845429, -0.6250494, -0.7367001, 0, 1, 0.003921569, 1,
-0.4830524, 0.00878931, -2.729814, 0, 1, 0.01176471, 1,
-0.4775524, -0.1289449, -2.444619, 0, 1, 0.01568628, 1,
-0.472755, -0.357784, -2.228513, 0, 1, 0.02352941, 1,
-0.4684429, 1.158408, -1.634722, 0, 1, 0.02745098, 1,
-0.4678405, -0.6208597, -2.292713, 0, 1, 0.03529412, 1,
-0.466507, 1.026743, -1.008121, 0, 1, 0.03921569, 1,
-0.4629943, -0.4855759, -3.20603, 0, 1, 0.04705882, 1,
-0.4603075, 0.414344, -1.715688, 0, 1, 0.05098039, 1,
-0.4552266, 0.2656727, -1.656523, 0, 1, 0.05882353, 1,
-0.451998, 1.393455, 0.3010735, 0, 1, 0.0627451, 1,
-0.4484564, -0.2332407, -1.509558, 0, 1, 0.07058824, 1,
-0.4478896, -0.4885491, -1.967833, 0, 1, 0.07450981, 1,
-0.4433315, 0.07670407, -1.10147, 0, 1, 0.08235294, 1,
-0.4413515, 1.195142, 0.7971197, 0, 1, 0.08627451, 1,
-0.4412388, 1.058851, 0.2444377, 0, 1, 0.09411765, 1,
-0.439121, -2.689667, -1.615905, 0, 1, 0.1019608, 1,
-0.4379632, -1.484936, -3.161713, 0, 1, 0.1058824, 1,
-0.4376592, 1.003891, 0.2618502, 0, 1, 0.1137255, 1,
-0.4369807, 0.07643791, -2.409684, 0, 1, 0.1176471, 1,
-0.4351845, 0.8737402, -0.1157152, 0, 1, 0.1254902, 1,
-0.4310793, -2.235449, -2.750997, 0, 1, 0.1294118, 1,
-0.427925, -0.9198573, -3.52012, 0, 1, 0.1372549, 1,
-0.427683, 2.999078, 0.3941008, 0, 1, 0.1411765, 1,
-0.4246148, -1.351681, -2.247196, 0, 1, 0.1490196, 1,
-0.4235827, 0.5369756, -0.2873594, 0, 1, 0.1529412, 1,
-0.4205406, 1.16546, 0.7148542, 0, 1, 0.1607843, 1,
-0.4099709, -0.466937, -4.336783, 0, 1, 0.1647059, 1,
-0.4019958, 0.6131791, -1.620874, 0, 1, 0.172549, 1,
-0.4009598, -0.4772259, -1.851546, 0, 1, 0.1764706, 1,
-0.3989031, 0.0137017, -1.827518, 0, 1, 0.1843137, 1,
-0.398262, -1.395808, -1.743547, 0, 1, 0.1882353, 1,
-0.397764, 0.8831191, 0.5816211, 0, 1, 0.1960784, 1,
-0.3923242, -0.5373358, -3.025522, 0, 1, 0.2039216, 1,
-0.3880035, -0.9087037, -2.892827, 0, 1, 0.2078431, 1,
-0.3878763, -0.464128, -2.14965, 0, 1, 0.2156863, 1,
-0.3874382, 1.037409, -2.399822, 0, 1, 0.2196078, 1,
-0.383481, -0.01373162, -1.554942, 0, 1, 0.227451, 1,
-0.3834371, 0.4387709, 0.1213341, 0, 1, 0.2313726, 1,
-0.3829752, 0.8942307, -1.164293, 0, 1, 0.2392157, 1,
-0.3826588, -1.094653, -2.697572, 0, 1, 0.2431373, 1,
-0.3819442, -1.078486, -2.976005, 0, 1, 0.2509804, 1,
-0.3766712, 0.6383906, 1.483262, 0, 1, 0.254902, 1,
-0.3722827, 0.4209856, -1.485565, 0, 1, 0.2627451, 1,
-0.3659148, -0.1043487, -2.303267, 0, 1, 0.2666667, 1,
-0.3632401, 1.488278, 0.5419816, 0, 1, 0.2745098, 1,
-0.3611505, -0.03406743, -1.339998, 0, 1, 0.2784314, 1,
-0.3595492, -0.5518316, -2.820311, 0, 1, 0.2862745, 1,
-0.3537183, -0.4695926, -3.928676, 0, 1, 0.2901961, 1,
-0.3516757, 0.902097, 0.7855958, 0, 1, 0.2980392, 1,
-0.3457048, 1.664078, 0.3199219, 0, 1, 0.3058824, 1,
-0.3441022, -0.01159101, -2.215295, 0, 1, 0.3098039, 1,
-0.3428766, 1.770374, 0.4862402, 0, 1, 0.3176471, 1,
-0.3407484, -1.575333, -2.524999, 0, 1, 0.3215686, 1,
-0.3379932, 0.954313, 1.064132, 0, 1, 0.3294118, 1,
-0.3242317, 0.06345423, -1.766549, 0, 1, 0.3333333, 1,
-0.3204373, -0.8668666, -3.925364, 0, 1, 0.3411765, 1,
-0.3191597, 0.5421457, -0.1043997, 0, 1, 0.345098, 1,
-0.3137877, 0.6480522, -1.153787, 0, 1, 0.3529412, 1,
-0.3113282, -0.3486913, -1.568325, 0, 1, 0.3568628, 1,
-0.3090395, -0.9036032, -1.257895, 0, 1, 0.3647059, 1,
-0.3084696, 1.684683, 1.164088, 0, 1, 0.3686275, 1,
-0.3053989, 1.660065, -0.5477994, 0, 1, 0.3764706, 1,
-0.3030747, 0.6740537, -0.4855561, 0, 1, 0.3803922, 1,
-0.3016399, 0.2125511, 1.715388, 0, 1, 0.3882353, 1,
-0.3001537, -0.4539887, -0.9267377, 0, 1, 0.3921569, 1,
-0.2937316, 0.5067825, -2.673902, 0, 1, 0.4, 1,
-0.2920285, -0.5334803, -1.696507, 0, 1, 0.4078431, 1,
-0.2910153, -0.2660728, -2.66929, 0, 1, 0.4117647, 1,
-0.2904128, 1.026086, 0.8020189, 0, 1, 0.4196078, 1,
-0.2899821, 0.03325074, -1.748794, 0, 1, 0.4235294, 1,
-0.2854157, 0.04188576, -2.474418, 0, 1, 0.4313726, 1,
-0.2807415, -1.258292, -4.439106, 0, 1, 0.4352941, 1,
-0.2802739, 0.002293085, -0.6616374, 0, 1, 0.4431373, 1,
-0.2758498, 0.3287242, -1.602537, 0, 1, 0.4470588, 1,
-0.2756045, 0.6609676, 0.2352558, 0, 1, 0.454902, 1,
-0.2740117, -0.1244241, -2.033853, 0, 1, 0.4588235, 1,
-0.2695882, -0.320233, -1.900658, 0, 1, 0.4666667, 1,
-0.2689427, -0.2312643, -0.6074306, 0, 1, 0.4705882, 1,
-0.2682083, -0.1276294, -1.758118, 0, 1, 0.4784314, 1,
-0.2680896, -1.883478, -2.447279, 0, 1, 0.4823529, 1,
-0.2659615, -0.991155, -2.280158, 0, 1, 0.4901961, 1,
-0.2655422, 0.588605, -0.4932545, 0, 1, 0.4941176, 1,
-0.2639322, 1.046991, 0.675315, 0, 1, 0.5019608, 1,
-0.2604274, 0.5539038, -0.616016, 0, 1, 0.509804, 1,
-0.2600359, -0.9777375, -1.855356, 0, 1, 0.5137255, 1,
-0.257468, -0.5758621, -2.455606, 0, 1, 0.5215687, 1,
-0.2566366, -1.123485, -3.103775, 0, 1, 0.5254902, 1,
-0.2530482, 0.8306783, -0.6733538, 0, 1, 0.5333334, 1,
-0.2524197, 1.010518, 0.4094379, 0, 1, 0.5372549, 1,
-0.2505657, -1.715583, -3.123709, 0, 1, 0.5450981, 1,
-0.2496392, 0.6370152, -0.5501857, 0, 1, 0.5490196, 1,
-0.2487055, 0.887652, -0.07458141, 0, 1, 0.5568628, 1,
-0.2466059, 0.4037929, -0.8441118, 0, 1, 0.5607843, 1,
-0.242173, 0.7395328, -0.7264835, 0, 1, 0.5686275, 1,
-0.2406922, -0.5398898, -3.533821, 0, 1, 0.572549, 1,
-0.2393112, -2.00411, -3.362391, 0, 1, 0.5803922, 1,
-0.235706, 0.6170027, 1.332896, 0, 1, 0.5843138, 1,
-0.2343893, -0.2376862, -3.296569, 0, 1, 0.5921569, 1,
-0.2272325, 0.09415466, -1.175394, 0, 1, 0.5960785, 1,
-0.2225691, 1.077054, 0.6005005, 0, 1, 0.6039216, 1,
-0.2216938, -1.074661, -2.274995, 0, 1, 0.6117647, 1,
-0.2189984, -0.9239371, -3.190755, 0, 1, 0.6156863, 1,
-0.2180624, 2.095898, -0.8308902, 0, 1, 0.6235294, 1,
-0.2151993, 1.148054, 0.9177886, 0, 1, 0.627451, 1,
-0.2140904, -1.112656, -2.986061, 0, 1, 0.6352941, 1,
-0.212918, -0.09612184, -2.936751, 0, 1, 0.6392157, 1,
-0.2080033, 1.367211, -0.0739083, 0, 1, 0.6470588, 1,
-0.2017976, -0.6141573, -2.062414, 0, 1, 0.6509804, 1,
-0.2004279, 0.7020602, 0.3994074, 0, 1, 0.6588235, 1,
-0.1986234, -0.7684642, -3.163816, 0, 1, 0.6627451, 1,
-0.1971617, -0.7965776, -2.061786, 0, 1, 0.6705883, 1,
-0.1961378, 0.6268414, 1.337933, 0, 1, 0.6745098, 1,
-0.196002, 1.348148, -0.20684, 0, 1, 0.682353, 1,
-0.1945834, -1.967486, -1.930342, 0, 1, 0.6862745, 1,
-0.1933331, -1.284065, -3.428652, 0, 1, 0.6941177, 1,
-0.1932806, -0.4913101, -2.986257, 0, 1, 0.7019608, 1,
-0.1926809, 0.9198038, -0.6445409, 0, 1, 0.7058824, 1,
-0.1882625, 2.749377, 0.08932023, 0, 1, 0.7137255, 1,
-0.1871841, -0.3876419, -0.8685923, 0, 1, 0.7176471, 1,
-0.1869882, 1.600298, -0.6690747, 0, 1, 0.7254902, 1,
-0.1869207, 1.58985, -1.163307, 0, 1, 0.7294118, 1,
-0.1862323, -0.7088372, -4.377347, 0, 1, 0.7372549, 1,
-0.1845367, -1.507506, -2.126753, 0, 1, 0.7411765, 1,
-0.1844562, -0.2744262, -1.818863, 0, 1, 0.7490196, 1,
-0.1835717, 0.1886062, -0.9023759, 0, 1, 0.7529412, 1,
-0.1832266, 0.8825873, -0.4183743, 0, 1, 0.7607843, 1,
-0.1826689, -0.3289134, -2.903711, 0, 1, 0.7647059, 1,
-0.1785758, -0.1012369, -0.8262932, 0, 1, 0.772549, 1,
-0.1761356, 1.00002, -0.04560275, 0, 1, 0.7764706, 1,
-0.1743477, -0.215153, -2.01314, 0, 1, 0.7843137, 1,
-0.1738085, 0.710725, 0.9884853, 0, 1, 0.7882353, 1,
-0.1736748, -0.4182203, -2.00922, 0, 1, 0.7960784, 1,
-0.1717167, 0.2014169, -0.6644292, 0, 1, 0.8039216, 1,
-0.1712742, 2.437723, -0.08573551, 0, 1, 0.8078431, 1,
-0.1710047, 1.363746, 1.118495, 0, 1, 0.8156863, 1,
-0.1704742, 0.1749171, -0.4142976, 0, 1, 0.8196079, 1,
-0.1704718, 0.3159613, 1.075554, 0, 1, 0.827451, 1,
-0.1695278, -1.503619, -2.772204, 0, 1, 0.8313726, 1,
-0.1663424, -0.02114425, -3.1859, 0, 1, 0.8392157, 1,
-0.1657635, 0.5664132, -0.8170698, 0, 1, 0.8431373, 1,
-0.1601185, -0.04126735, -3.866687, 0, 1, 0.8509804, 1,
-0.1601003, -0.672213, -4.403007, 0, 1, 0.854902, 1,
-0.1592516, -1.276646, -3.729798, 0, 1, 0.8627451, 1,
-0.1571479, -1.309881, -3.620213, 0, 1, 0.8666667, 1,
-0.1531252, 0.05743617, -1.519346, 0, 1, 0.8745098, 1,
-0.1527899, -0.6205406, -2.797412, 0, 1, 0.8784314, 1,
-0.1525223, -0.06848737, -2.093139, 0, 1, 0.8862745, 1,
-0.1503623, 1.356768, 0.953013, 0, 1, 0.8901961, 1,
-0.1456241, -0.9890024, -2.932852, 0, 1, 0.8980392, 1,
-0.1415075, 0.7427379, 1.146697, 0, 1, 0.9058824, 1,
-0.1413922, 0.03253423, -1.63133, 0, 1, 0.9098039, 1,
-0.1405229, -0.5646744, -3.40749, 0, 1, 0.9176471, 1,
-0.1400873, -0.8013571, -3.917431, 0, 1, 0.9215686, 1,
-0.1392379, -1.673307, -1.642888, 0, 1, 0.9294118, 1,
-0.1334156, 0.01330515, -0.7528687, 0, 1, 0.9333333, 1,
-0.1314947, -0.008105347, -0.694815, 0, 1, 0.9411765, 1,
-0.130427, -0.8512376, -3.24314, 0, 1, 0.945098, 1,
-0.1284434, -0.3858718, -1.790186, 0, 1, 0.9529412, 1,
-0.1262062, 0.265952, 1.781164, 0, 1, 0.9568627, 1,
-0.1244784, -0.1048413, -1.772757, 0, 1, 0.9647059, 1,
-0.1207518, 0.4030545, 0.2514709, 0, 1, 0.9686275, 1,
-0.1178994, -3.206313, -1.314693, 0, 1, 0.9764706, 1,
-0.1125984, -0.05982185, -0.9878494, 0, 1, 0.9803922, 1,
-0.1057857, 1.049968, -0.5968869, 0, 1, 0.9882353, 1,
-0.1022877, -2.245619, -2.449374, 0, 1, 0.9921569, 1,
-0.1017386, -0.07886354, -2.566268, 0, 1, 1, 1,
-0.1005371, -0.392289, -1.653314, 0, 0.9921569, 1, 1,
-0.100363, 0.07519775, -1.315394, 0, 0.9882353, 1, 1,
-0.09621958, -1.476145, -3.712602, 0, 0.9803922, 1, 1,
-0.0940892, 0.3965891, -1.517244, 0, 0.9764706, 1, 1,
-0.09058499, -0.6377014, -4.373616, 0, 0.9686275, 1, 1,
-0.08305702, 1.313036, -0.3533373, 0, 0.9647059, 1, 1,
-0.08232639, -1.945996, -2.914983, 0, 0.9568627, 1, 1,
-0.08225729, 0.4201394, -0.8683152, 0, 0.9529412, 1, 1,
-0.08088221, 0.3470339, 1.097831, 0, 0.945098, 1, 1,
-0.08007203, 0.2282497, 0.07856423, 0, 0.9411765, 1, 1,
-0.07888385, -0.325716, -3.59743, 0, 0.9333333, 1, 1,
-0.07800177, 1.501899, 0.8502144, 0, 0.9294118, 1, 1,
-0.07756723, 1.54335, -0.3525083, 0, 0.9215686, 1, 1,
-0.06583539, 0.555056, 0.8838355, 0, 0.9176471, 1, 1,
-0.06352121, -1.754274, -4.752052, 0, 0.9098039, 1, 1,
-0.0587299, 1.033775, 0.3235836, 0, 0.9058824, 1, 1,
-0.05617159, 1.415788, 1.283497, 0, 0.8980392, 1, 1,
-0.0531527, 0.1875354, 0.9235464, 0, 0.8901961, 1, 1,
-0.04950711, 0.3737991, -1.422874, 0, 0.8862745, 1, 1,
-0.04810227, 1.195853, -1.145587, 0, 0.8784314, 1, 1,
-0.03811429, 0.7355517, -2.159274, 0, 0.8745098, 1, 1,
-0.03763125, 0.2636042, 0.4989832, 0, 0.8666667, 1, 1,
-0.03661867, 0.1016642, -0.8156461, 0, 0.8627451, 1, 1,
-0.03487771, -1.67359, -2.542182, 0, 0.854902, 1, 1,
-0.03337682, 0.01184857, -1.158707, 0, 0.8509804, 1, 1,
-0.03215954, 0.8782188, -0.08335514, 0, 0.8431373, 1, 1,
-0.02676498, 0.557115, -0.8702605, 0, 0.8392157, 1, 1,
-0.02493821, -1.094982, -3.165783, 0, 0.8313726, 1, 1,
-0.02408921, -0.2992262, -2.907031, 0, 0.827451, 1, 1,
-0.02395352, 2.22822, 1.740055, 0, 0.8196079, 1, 1,
-0.01692086, -0.6512569, -1.994527, 0, 0.8156863, 1, 1,
-0.01502583, 0.2001983, 2.130044, 0, 0.8078431, 1, 1,
-0.01401996, 0.1075306, -1.984272, 0, 0.8039216, 1, 1,
-0.009776241, 0.7913833, -2.190725, 0, 0.7960784, 1, 1,
-0.008667354, -0.006563962, -2.193608, 0, 0.7882353, 1, 1,
-0.003915285, -0.982491, -2.630242, 0, 0.7843137, 1, 1,
0.002443623, -0.4717298, 2.227357, 0, 0.7764706, 1, 1,
0.004092036, -0.497625, 2.77447, 0, 0.772549, 1, 1,
0.008498514, -0.8749854, 3.277486, 0, 0.7647059, 1, 1,
0.01036364, 0.07034331, -0.8019593, 0, 0.7607843, 1, 1,
0.01370498, -0.336216, 3.628805, 0, 0.7529412, 1, 1,
0.01743854, 0.3548591, 0.2780875, 0, 0.7490196, 1, 1,
0.01825581, -0.4805248, 2.856014, 0, 0.7411765, 1, 1,
0.02365516, -0.7328229, 4.527841, 0, 0.7372549, 1, 1,
0.03010419, 0.04446191, 1.083672, 0, 0.7294118, 1, 1,
0.03152486, -1.084364, 2.160835, 0, 0.7254902, 1, 1,
0.03558591, -0.6646119, 3.849973, 0, 0.7176471, 1, 1,
0.04224364, -0.3044489, 4.54509, 0, 0.7137255, 1, 1,
0.04393248, -0.3138967, 2.120207, 0, 0.7058824, 1, 1,
0.04762457, 1.292284, 0.3286346, 0, 0.6980392, 1, 1,
0.04773184, -0.5547686, 3.438549, 0, 0.6941177, 1, 1,
0.06251261, -0.4439364, 2.730489, 0, 0.6862745, 1, 1,
0.06554304, -2.276026, 4.263924, 0, 0.682353, 1, 1,
0.0665867, -0.5523639, 3.441472, 0, 0.6745098, 1, 1,
0.07413571, -0.0902917, 2.225077, 0, 0.6705883, 1, 1,
0.07596508, -0.2216679, 2.104554, 0, 0.6627451, 1, 1,
0.08160195, -1.187506, 1.940152, 0, 0.6588235, 1, 1,
0.08221445, -0.7044678, 3.62745, 0, 0.6509804, 1, 1,
0.08482968, 0.2279302, 1.989081, 0, 0.6470588, 1, 1,
0.08518078, -0.8156412, 3.409208, 0, 0.6392157, 1, 1,
0.08618844, -0.6446714, 2.112993, 0, 0.6352941, 1, 1,
0.09518438, 2.254198, -1.153488, 0, 0.627451, 1, 1,
0.09811509, -0.7091009, 4.46416, 0, 0.6235294, 1, 1,
0.0994684, -1.260918, 4.71543, 0, 0.6156863, 1, 1,
0.1004348, 0.0492455, 0.317737, 0, 0.6117647, 1, 1,
0.1095642, 1.054265, -0.4610426, 0, 0.6039216, 1, 1,
0.1153309, 0.4548712, 0.3295383, 0, 0.5960785, 1, 1,
0.1158104, -0.3804536, 2.672817, 0, 0.5921569, 1, 1,
0.1166967, -1.015253, 2.171765, 0, 0.5843138, 1, 1,
0.1168283, -0.1350132, 2.187904, 0, 0.5803922, 1, 1,
0.1174772, -1.228604, 3.376756, 0, 0.572549, 1, 1,
0.1213784, 0.9503126, 1.025581, 0, 0.5686275, 1, 1,
0.1226948, -0.6816884, 4.70201, 0, 0.5607843, 1, 1,
0.1229931, -0.1171292, 2.814994, 0, 0.5568628, 1, 1,
0.1357815, -1.048741, 2.941879, 0, 0.5490196, 1, 1,
0.1405025, 0.06149739, 1.036214, 0, 0.5450981, 1, 1,
0.1444493, 1.416605, -0.008777226, 0, 0.5372549, 1, 1,
0.1451588, 0.4189105, 0.7140867, 0, 0.5333334, 1, 1,
0.1456061, -0.393525, 2.456462, 0, 0.5254902, 1, 1,
0.1469603, -0.3000426, 4.21605, 0, 0.5215687, 1, 1,
0.1508304, -0.2547319, 1.938668, 0, 0.5137255, 1, 1,
0.1522876, -0.6495904, 3.309202, 0, 0.509804, 1, 1,
0.1590326, 0.721083, 0.9274594, 0, 0.5019608, 1, 1,
0.160017, -0.4513308, 4.365379, 0, 0.4941176, 1, 1,
0.1642305, -0.5848652, 2.150197, 0, 0.4901961, 1, 1,
0.1657324, -0.6890234, 1.69637, 0, 0.4823529, 1, 1,
0.1659025, 0.1723977, -0.4718468, 0, 0.4784314, 1, 1,
0.1712949, 1.477173, 0.08814733, 0, 0.4705882, 1, 1,
0.1719314, -1.356566, 3.168986, 0, 0.4666667, 1, 1,
0.1722421, 0.0006669246, 3.124543, 0, 0.4588235, 1, 1,
0.1744741, 0.5079857, 1.091144, 0, 0.454902, 1, 1,
0.1754917, 1.323009, -0.2144578, 0, 0.4470588, 1, 1,
0.1756754, -1.347197, 2.513932, 0, 0.4431373, 1, 1,
0.1809995, -0.2904514, 1.624835, 0, 0.4352941, 1, 1,
0.1849531, -0.200132, 1.578519, 0, 0.4313726, 1, 1,
0.1897603, -1.330374, 4.000663, 0, 0.4235294, 1, 1,
0.1959507, 0.03575058, 2.526108, 0, 0.4196078, 1, 1,
0.2078114, -0.1941776, 2.880694, 0, 0.4117647, 1, 1,
0.2088491, 1.434045, 0.604058, 0, 0.4078431, 1, 1,
0.2136395, -1.444629, 0.1759241, 0, 0.4, 1, 1,
0.2184078, -0.7109008, 3.253103, 0, 0.3921569, 1, 1,
0.2198297, 0.4572207, -0.4581335, 0, 0.3882353, 1, 1,
0.2219518, 1.376169, 1.051743, 0, 0.3803922, 1, 1,
0.222141, 0.2054822, 0.5371929, 0, 0.3764706, 1, 1,
0.2232263, -1.168359, 3.373467, 0, 0.3686275, 1, 1,
0.2239905, 0.01972095, 3.098577, 0, 0.3647059, 1, 1,
0.2250582, 1.542714, 1.288239, 0, 0.3568628, 1, 1,
0.227219, -1.094225, 5.228878, 0, 0.3529412, 1, 1,
0.2279512, -0.01804564, 1.490783, 0, 0.345098, 1, 1,
0.2288032, -2.985896, 2.048016, 0, 0.3411765, 1, 1,
0.2306323, 0.9383507, 0.1290352, 0, 0.3333333, 1, 1,
0.2312272, 0.8428408, 1.076863, 0, 0.3294118, 1, 1,
0.2356263, -0.1162729, 2.282869, 0, 0.3215686, 1, 1,
0.2379724, 1.146802, -0.4673314, 0, 0.3176471, 1, 1,
0.2413771, -1.258864, 3.858119, 0, 0.3098039, 1, 1,
0.2475071, -1.630399, 3.268935, 0, 0.3058824, 1, 1,
0.2475171, -1.568019, 0.4901415, 0, 0.2980392, 1, 1,
0.2478393, 0.3715125, -0.334056, 0, 0.2901961, 1, 1,
0.2516836, -1.667347, 3.242907, 0, 0.2862745, 1, 1,
0.2572597, 1.828675, -0.6714998, 0, 0.2784314, 1, 1,
0.2603562, 0.1054088, 0.4787146, 0, 0.2745098, 1, 1,
0.2612795, -0.1821648, 3.167048, 0, 0.2666667, 1, 1,
0.26187, 1.319118, 0.8953883, 0, 0.2627451, 1, 1,
0.2687102, -0.2812026, 0.9806219, 0, 0.254902, 1, 1,
0.2691677, -0.01909596, -1.319025, 0, 0.2509804, 1, 1,
0.2713611, 1.234491, 0.5753492, 0, 0.2431373, 1, 1,
0.2721545, 0.5958114, -0.4025786, 0, 0.2392157, 1, 1,
0.2725155, -0.01347669, 0.9867363, 0, 0.2313726, 1, 1,
0.2874796, 0.5034401, 0.629391, 0, 0.227451, 1, 1,
0.2964027, 0.398266, -0.2361908, 0, 0.2196078, 1, 1,
0.3005995, -0.8524165, 1.828881, 0, 0.2156863, 1, 1,
0.3012716, 1.398489, 0.3334247, 0, 0.2078431, 1, 1,
0.3057194, 0.4917147, 1.010612, 0, 0.2039216, 1, 1,
0.3064323, -0.5116867, 1.409993, 0, 0.1960784, 1, 1,
0.3066457, 0.5580199, 0.2208703, 0, 0.1882353, 1, 1,
0.3089672, -0.7496732, 4.503059, 0, 0.1843137, 1, 1,
0.3136747, 1.10654, 1.435354, 0, 0.1764706, 1, 1,
0.3154829, -1.787037, 3.093984, 0, 0.172549, 1, 1,
0.3203024, 0.429945, 1.096899, 0, 0.1647059, 1, 1,
0.3247077, 0.3069855, 1.635402, 0, 0.1607843, 1, 1,
0.3282159, 0.8021414, -1.133887, 0, 0.1529412, 1, 1,
0.3291824, -1.156306, 3.707669, 0, 0.1490196, 1, 1,
0.330603, 0.0274011, -0.180388, 0, 0.1411765, 1, 1,
0.3387537, -0.07445063, 1.390007, 0, 0.1372549, 1, 1,
0.3387851, -0.8551678, 3.784321, 0, 0.1294118, 1, 1,
0.3421526, -0.5878978, 4.22142, 0, 0.1254902, 1, 1,
0.3456532, -0.1181343, -0.06929523, 0, 0.1176471, 1, 1,
0.3462114, 0.7067562, 1.47805, 0, 0.1137255, 1, 1,
0.3468685, -0.1407927, 0.6349393, 0, 0.1058824, 1, 1,
0.3482442, -0.07490499, 1.822158, 0, 0.09803922, 1, 1,
0.3514167, 0.4155183, 0.4817473, 0, 0.09411765, 1, 1,
0.3564058, 0.9587001, -0.9361001, 0, 0.08627451, 1, 1,
0.3565973, 1.727337, -1.284012, 0, 0.08235294, 1, 1,
0.3593372, -0.79522, 2.490167, 0, 0.07450981, 1, 1,
0.3622993, -0.6846718, 1.363849, 0, 0.07058824, 1, 1,
0.3634056, -0.3016561, 1.211814, 0, 0.0627451, 1, 1,
0.3655087, -0.9731734, 4.214039, 0, 0.05882353, 1, 1,
0.3669042, 0.5524767, 0.739067, 0, 0.05098039, 1, 1,
0.3677499, 0.6991517, 0.4162009, 0, 0.04705882, 1, 1,
0.3707952, -0.6194791, 1.533467, 0, 0.03921569, 1, 1,
0.3708184, 1.756814, 1.449156, 0, 0.03529412, 1, 1,
0.3721034, -0.09836699, 1.980917, 0, 0.02745098, 1, 1,
0.3725447, -0.4257286, 1.853152, 0, 0.02352941, 1, 1,
0.3760422, 0.1441937, 0.2779788, 0, 0.01568628, 1, 1,
0.3769904, -0.04140541, 1.51489, 0, 0.01176471, 1, 1,
0.3777549, 0.7630223, -0.5214949, 0, 0.003921569, 1, 1,
0.3815618, -0.08923816, 1.330643, 0.003921569, 0, 1, 1,
0.3833891, 1.008986, -2.394397, 0.007843138, 0, 1, 1,
0.3871378, 0.521488, 1.778491, 0.01568628, 0, 1, 1,
0.388137, 0.0104875, 1.405899, 0.01960784, 0, 1, 1,
0.3895101, 0.6299782, 0.2594618, 0.02745098, 0, 1, 1,
0.3903934, -0.6325687, 1.827924, 0.03137255, 0, 1, 1,
0.394245, -0.04902145, 1.547064, 0.03921569, 0, 1, 1,
0.3958074, 0.7984658, 1.017448, 0.04313726, 0, 1, 1,
0.4010406, -1.341, 2.748028, 0.05098039, 0, 1, 1,
0.4022207, 0.5051778, 0.1748565, 0.05490196, 0, 1, 1,
0.4035014, 0.07897407, 0.6372346, 0.0627451, 0, 1, 1,
0.4072402, -0.6927283, 3.3343, 0.06666667, 0, 1, 1,
0.4109859, 0.001193403, 1.158902, 0.07450981, 0, 1, 1,
0.4125457, 0.4683807, 1.051799, 0.07843138, 0, 1, 1,
0.4172077, -0.5137665, 2.879964, 0.08627451, 0, 1, 1,
0.4172296, -0.1666209, 2.403156, 0.09019608, 0, 1, 1,
0.4270593, 0.6983114, 1.365805, 0.09803922, 0, 1, 1,
0.4307059, 0.7649748, 0.8181658, 0.1058824, 0, 1, 1,
0.4319468, 1.313722, 0.7877749, 0.1098039, 0, 1, 1,
0.436669, 0.179717, 1.418344, 0.1176471, 0, 1, 1,
0.4396515, 1.139684, -0.6597388, 0.1215686, 0, 1, 1,
0.4402858, 0.1126533, 2.033397, 0.1294118, 0, 1, 1,
0.4420225, 0.07768596, 2.399063, 0.1333333, 0, 1, 1,
0.442107, 1.457044, -0.1445547, 0.1411765, 0, 1, 1,
0.4465396, -0.5640642, 3.396733, 0.145098, 0, 1, 1,
0.4467113, -0.4459794, 1.627012, 0.1529412, 0, 1, 1,
0.4510353, 0.732732, 1.016952, 0.1568628, 0, 1, 1,
0.4512157, -1.431113, 3.896692, 0.1647059, 0, 1, 1,
0.4519005, 0.09910718, 2.013075, 0.1686275, 0, 1, 1,
0.4576088, 0.4252373, 0.7679653, 0.1764706, 0, 1, 1,
0.4640819, -0.682321, 3.230375, 0.1803922, 0, 1, 1,
0.4687832, -0.005718915, 1.84464, 0.1882353, 0, 1, 1,
0.4710034, -0.2467169, 1.606633, 0.1921569, 0, 1, 1,
0.4768183, 0.6494766, 1.408122, 0.2, 0, 1, 1,
0.4844324, 1.029349, -0.8441134, 0.2078431, 0, 1, 1,
0.4868496, 0.3560729, 2.231062, 0.2117647, 0, 1, 1,
0.487202, -0.1157004, 2.300748, 0.2196078, 0, 1, 1,
0.4875538, 0.7975408, 0.5862052, 0.2235294, 0, 1, 1,
0.4880039, -0.128616, 1.427712, 0.2313726, 0, 1, 1,
0.4900843, 1.728587, -0.8244594, 0.2352941, 0, 1, 1,
0.4904366, 0.6742352, 0.9451059, 0.2431373, 0, 1, 1,
0.494841, 0.8133948, -0.6122193, 0.2470588, 0, 1, 1,
0.4956168, -0.3481355, 2.95362, 0.254902, 0, 1, 1,
0.5060604, 0.804298, 2.302615, 0.2588235, 0, 1, 1,
0.5070016, -0.01901441, 2.867845, 0.2666667, 0, 1, 1,
0.5106817, 0.2339594, 2.656305, 0.2705882, 0, 1, 1,
0.5114471, -0.5076647, 1.809737, 0.2784314, 0, 1, 1,
0.5122997, 1.178997, 0.7577639, 0.282353, 0, 1, 1,
0.5244009, 0.1604132, 2.176624, 0.2901961, 0, 1, 1,
0.5245925, -0.05884384, 2.878512, 0.2941177, 0, 1, 1,
0.524986, -1.020662, 3.447317, 0.3019608, 0, 1, 1,
0.532451, -0.1956295, 3.292779, 0.3098039, 0, 1, 1,
0.5351764, 1.582305, 0.7841269, 0.3137255, 0, 1, 1,
0.5355983, -1.848148, 4.14976, 0.3215686, 0, 1, 1,
0.5370795, 1.05374, -0.2993408, 0.3254902, 0, 1, 1,
0.537858, -0.257861, 1.665386, 0.3333333, 0, 1, 1,
0.5399504, 2.046507, 0.2443572, 0.3372549, 0, 1, 1,
0.5439728, 0.7602382, 0.2123166, 0.345098, 0, 1, 1,
0.556579, -1.121651, 4.473955, 0.3490196, 0, 1, 1,
0.5608699, -0.04982555, 0.7762662, 0.3568628, 0, 1, 1,
0.5653831, 1.728289, -1.828326, 0.3607843, 0, 1, 1,
0.5688725, 0.9921308, -0.6462532, 0.3686275, 0, 1, 1,
0.5751118, -2.698132, 1.86351, 0.372549, 0, 1, 1,
0.5764714, 0.5394931, -0.2843846, 0.3803922, 0, 1, 1,
0.5808845, -0.1996442, 2.510564, 0.3843137, 0, 1, 1,
0.5822515, -0.107754, 0.9968719, 0.3921569, 0, 1, 1,
0.5871646, -0.7018166, 3.332965, 0.3960784, 0, 1, 1,
0.5874687, 0.6788083, 1.603735, 0.4039216, 0, 1, 1,
0.5882503, -0.7411428, 2.526803, 0.4117647, 0, 1, 1,
0.5883245, 1.139048, 1.932329, 0.4156863, 0, 1, 1,
0.5900971, -0.3750877, 1.593175, 0.4235294, 0, 1, 1,
0.5915801, -0.8583611, 1.003702, 0.427451, 0, 1, 1,
0.5928121, -0.169552, 0.5482844, 0.4352941, 0, 1, 1,
0.5931793, 0.4912403, 0.6489311, 0.4392157, 0, 1, 1,
0.598626, 1.632854, 1.547126, 0.4470588, 0, 1, 1,
0.5995942, -0.4701655, 3.357168, 0.4509804, 0, 1, 1,
0.6069335, 1.597774, 1.7667, 0.4588235, 0, 1, 1,
0.608413, -1.92522, 2.207935, 0.4627451, 0, 1, 1,
0.6099953, -0.8839684, 3.491034, 0.4705882, 0, 1, 1,
0.6122788, -0.5531908, 3.282888, 0.4745098, 0, 1, 1,
0.6225586, 1.034913, -0.008736966, 0.4823529, 0, 1, 1,
0.6228162, 0.5325124, 0.8275887, 0.4862745, 0, 1, 1,
0.6350435, -0.1930656, 2.551271, 0.4941176, 0, 1, 1,
0.6466354, -1.830043, 3.261461, 0.5019608, 0, 1, 1,
0.6512058, -0.3011032, 1.839501, 0.5058824, 0, 1, 1,
0.6564933, -1.260483, 1.077674, 0.5137255, 0, 1, 1,
0.661761, -0.7839835, 1.81384, 0.5176471, 0, 1, 1,
0.6639778, -0.3542109, 3.414173, 0.5254902, 0, 1, 1,
0.6656891, 1.634764, 0.1308359, 0.5294118, 0, 1, 1,
0.6724833, 1.264425, 1.315554, 0.5372549, 0, 1, 1,
0.6736363, -2.211916, 2.331556, 0.5411765, 0, 1, 1,
0.6798478, -0.6529284, 1.786883, 0.5490196, 0, 1, 1,
0.680737, -0.4145057, 0.8328298, 0.5529412, 0, 1, 1,
0.6842922, -0.3974578, 1.343551, 0.5607843, 0, 1, 1,
0.6889589, 0.632629, 1.079991, 0.5647059, 0, 1, 1,
0.6890717, 0.7224631, 0.857155, 0.572549, 0, 1, 1,
0.696808, 0.6556867, 2.297137, 0.5764706, 0, 1, 1,
0.6971509, -0.7551134, 1.740326, 0.5843138, 0, 1, 1,
0.7195551, 0.6800471, 1.074803, 0.5882353, 0, 1, 1,
0.7228872, -0.1608135, 0.8069891, 0.5960785, 0, 1, 1,
0.7254234, -0.8823283, 2.875306, 0.6039216, 0, 1, 1,
0.7316033, 1.7375, 1.42034, 0.6078432, 0, 1, 1,
0.7345513, -0.8094767, 2.753001, 0.6156863, 0, 1, 1,
0.7408794, -1.016257, 2.370001, 0.6196079, 0, 1, 1,
0.7469105, 1.135653, 0.5786932, 0.627451, 0, 1, 1,
0.7493404, -1.132586, 1.75745, 0.6313726, 0, 1, 1,
0.7557046, 0.3903632, 0.8462265, 0.6392157, 0, 1, 1,
0.7571232, 1.243268, 1.131282, 0.6431373, 0, 1, 1,
0.7637556, -0.09030905, 2.822113, 0.6509804, 0, 1, 1,
0.7675192, -0.9487512, 3.0341, 0.654902, 0, 1, 1,
0.7693076, -0.1015715, 2.548345, 0.6627451, 0, 1, 1,
0.7694594, -1.171685, 0.2520481, 0.6666667, 0, 1, 1,
0.769722, 1.353684, 0.06871092, 0.6745098, 0, 1, 1,
0.7798355, 0.4978079, -0.3147153, 0.6784314, 0, 1, 1,
0.7859249, 0.9318714, 0.5940349, 0.6862745, 0, 1, 1,
0.7869015, -0.6196384, 1.908787, 0.6901961, 0, 1, 1,
0.7979213, -0.8611484, 2.049746, 0.6980392, 0, 1, 1,
0.800192, 0.4860254, 0.9397888, 0.7058824, 0, 1, 1,
0.8005443, 1.625429, -1.336458, 0.7098039, 0, 1, 1,
0.8019652, 2.111798, 0.2389107, 0.7176471, 0, 1, 1,
0.8037019, 0.737294, 1.415442, 0.7215686, 0, 1, 1,
0.8042464, -0.1906504, 0.7526639, 0.7294118, 0, 1, 1,
0.8061482, 0.2393099, 1.929089, 0.7333333, 0, 1, 1,
0.8107571, 1.009164, 0.159852, 0.7411765, 0, 1, 1,
0.8156101, 1.149062, 1.19254, 0.7450981, 0, 1, 1,
0.8160012, -3.761431, 2.343965, 0.7529412, 0, 1, 1,
0.816283, -0.269678, 1.076196, 0.7568628, 0, 1, 1,
0.8185282, 1.093481, 0.8371348, 0.7647059, 0, 1, 1,
0.8284562, -1.489728, 4.280614, 0.7686275, 0, 1, 1,
0.8333341, -0.5676129, 1.738229, 0.7764706, 0, 1, 1,
0.83877, 0.4562132, 2.183406, 0.7803922, 0, 1, 1,
0.8432254, -0.766689, 1.763277, 0.7882353, 0, 1, 1,
0.8451791, 1.417715, 0.4030483, 0.7921569, 0, 1, 1,
0.8453937, 0.2462296, 0.76616, 0.8, 0, 1, 1,
0.8455389, 0.5607206, -0.3618407, 0.8078431, 0, 1, 1,
0.84635, 0.9259891, 3.068142, 0.8117647, 0, 1, 1,
0.8503563, -1.04644, 2.511295, 0.8196079, 0, 1, 1,
0.8508489, -1.144055, 3.32287, 0.8235294, 0, 1, 1,
0.8571597, -1.908046, 1.922071, 0.8313726, 0, 1, 1,
0.8609918, 1.121087, 1.972232, 0.8352941, 0, 1, 1,
0.8611842, -2.270977, 2.734073, 0.8431373, 0, 1, 1,
0.8633229, -0.9075088, 3.076512, 0.8470588, 0, 1, 1,
0.8720025, 1.111105, 2.521829, 0.854902, 0, 1, 1,
0.8751743, 0.1595785, 0.7619024, 0.8588235, 0, 1, 1,
0.8795954, -0.8672899, 2.442906, 0.8666667, 0, 1, 1,
0.880376, 0.864659, 1.481473, 0.8705882, 0, 1, 1,
0.8882619, 1.794046, 1.043522, 0.8784314, 0, 1, 1,
0.8906226, 1.26436, 0.6024472, 0.8823529, 0, 1, 1,
0.8935654, 1.028737, 0.119789, 0.8901961, 0, 1, 1,
0.8987722, 1.441603, 1.346484, 0.8941177, 0, 1, 1,
0.8990247, 0.4069478, 2.624317, 0.9019608, 0, 1, 1,
0.9016429, -2.191142, 4.164964, 0.9098039, 0, 1, 1,
0.9063959, 0.182402, 3.909352, 0.9137255, 0, 1, 1,
0.9075833, -0.553242, 2.882139, 0.9215686, 0, 1, 1,
0.9125374, -1.409191, 3.268766, 0.9254902, 0, 1, 1,
0.9152167, -1.242446, 3.554389, 0.9333333, 0, 1, 1,
0.9163226, -0.3651062, 2.74523, 0.9372549, 0, 1, 1,
0.9196217, -0.2780881, 0.9216323, 0.945098, 0, 1, 1,
0.9223332, 1.329756, 1.386291, 0.9490196, 0, 1, 1,
0.9277965, -0.3089012, 2.37882, 0.9568627, 0, 1, 1,
0.9282922, -0.03548805, 1.754595, 0.9607843, 0, 1, 1,
0.9306091, 1.311189, 1.770635, 0.9686275, 0, 1, 1,
0.9388748, -0.5543658, 3.013146, 0.972549, 0, 1, 1,
0.9498994, 1.997852, -0.07983251, 0.9803922, 0, 1, 1,
0.9502739, 1.077842, 0.6127079, 0.9843137, 0, 1, 1,
0.9584342, -2.056182, 2.920199, 0.9921569, 0, 1, 1,
0.9590591, 0.7975253, 1.679426, 0.9960784, 0, 1, 1,
0.9617355, 0.812384, 2.30013, 1, 0, 0.9960784, 1,
0.9645674, -0.8888271, 1.780814, 1, 0, 0.9882353, 1,
0.9706375, 1.590443, 0.1579913, 1, 0, 0.9843137, 1,
0.9725358, 0.06174535, 1.905508, 1, 0, 0.9764706, 1,
0.9743858, 1.173182, 1.437843, 1, 0, 0.972549, 1,
0.9780239, -0.1405035, 1.955408, 1, 0, 0.9647059, 1,
0.9805343, -1.287377, 1.740453, 1, 0, 0.9607843, 1,
0.9806407, -1.721028, 3.6477, 1, 0, 0.9529412, 1,
0.9838073, -0.7564921, 1.320751, 1, 0, 0.9490196, 1,
0.9877989, -0.2656828, 1.140129, 1, 0, 0.9411765, 1,
0.9928313, 1.228778, 0.4664532, 1, 0, 0.9372549, 1,
0.993124, 0.1812775, -0.02136156, 1, 0, 0.9294118, 1,
0.99352, 0.05469277, 1.31314, 1, 0, 0.9254902, 1,
0.9935458, -0.5904486, 3.840806, 1, 0, 0.9176471, 1,
0.9957746, 0.4942744, 0.4985572, 1, 0, 0.9137255, 1,
0.9983586, 1.51018, -1.143677, 1, 0, 0.9058824, 1,
1.002802, -0.2141717, 2.50876, 1, 0, 0.9019608, 1,
1.007887, 1.150244, -0.287798, 1, 0, 0.8941177, 1,
1.009351, 1.415593, 2.941819, 1, 0, 0.8862745, 1,
1.012663, 0.9416085, 0.7635007, 1, 0, 0.8823529, 1,
1.013881, 0.03869274, 1.153252, 1, 0, 0.8745098, 1,
1.015852, -1.197224, 3.321122, 1, 0, 0.8705882, 1,
1.018423, -0.807422, 1.007286, 1, 0, 0.8627451, 1,
1.027126, 0.4914523, 0.2737687, 1, 0, 0.8588235, 1,
1.032817, 0.2039978, 1.31868, 1, 0, 0.8509804, 1,
1.034713, -0.6348789, 1.028269, 1, 0, 0.8470588, 1,
1.035899, 0.4487416, 1.021057, 1, 0, 0.8392157, 1,
1.040243, 0.6949666, 1.573669, 1, 0, 0.8352941, 1,
1.048464, -0.4652444, 3.833624, 1, 0, 0.827451, 1,
1.058104, 1.819879, -0.4756997, 1, 0, 0.8235294, 1,
1.063149, -0.5835009, 2.891485, 1, 0, 0.8156863, 1,
1.065923, -1.419244, 1.273058, 1, 0, 0.8117647, 1,
1.078238, 0.7090999, 1.951998, 1, 0, 0.8039216, 1,
1.089393, -0.458918, 3.04041, 1, 0, 0.7960784, 1,
1.09216, 0.4606003, 2.888196, 1, 0, 0.7921569, 1,
1.095094, 2.235528, 2.343333, 1, 0, 0.7843137, 1,
1.096285, 1.788431, 0.279754, 1, 0, 0.7803922, 1,
1.10003, -0.408061, 2.240184, 1, 0, 0.772549, 1,
1.105809, -0.086215, 1.073685, 1, 0, 0.7686275, 1,
1.107241, 1.199881, 0.7722934, 1, 0, 0.7607843, 1,
1.107731, -1.371691, 2.237165, 1, 0, 0.7568628, 1,
1.109525, 0.9323561, 0.381363, 1, 0, 0.7490196, 1,
1.110256, 0.6496183, 0.2684956, 1, 0, 0.7450981, 1,
1.114891, -0.07333877, 1.70892, 1, 0, 0.7372549, 1,
1.118782, 1.199145, 0.01901149, 1, 0, 0.7333333, 1,
1.119122, -0.9160519, 2.778083, 1, 0, 0.7254902, 1,
1.122707, -0.3380104, 3.070904, 1, 0, 0.7215686, 1,
1.124543, -1.090293, 1.524922, 1, 0, 0.7137255, 1,
1.142911, 0.5527239, 0.9813852, 1, 0, 0.7098039, 1,
1.144545, 2.201884, 1.57739, 1, 0, 0.7019608, 1,
1.147146, 3.167146, 0.776637, 1, 0, 0.6941177, 1,
1.150221, -0.8512992, 2.143319, 1, 0, 0.6901961, 1,
1.161573, -0.6393658, 4.535632, 1, 0, 0.682353, 1,
1.197095, 0.05614043, 0.232774, 1, 0, 0.6784314, 1,
1.199189, 0.09096966, -0.5338235, 1, 0, 0.6705883, 1,
1.202003, 1.580109, 0.1372984, 1, 0, 0.6666667, 1,
1.209029, -0.7061206, 1.531498, 1, 0, 0.6588235, 1,
1.21269, 1.533637, 1.173847, 1, 0, 0.654902, 1,
1.221862, -0.9664121, 0.9016505, 1, 0, 0.6470588, 1,
1.235195, -1.163643, 2.04277, 1, 0, 0.6431373, 1,
1.239992, 0.6234511, 1.301239, 1, 0, 0.6352941, 1,
1.241076, -0.9875407, 1.571738, 1, 0, 0.6313726, 1,
1.247443, 0.7530247, 0.3737955, 1, 0, 0.6235294, 1,
1.25034, -0.01140984, 1.029843, 1, 0, 0.6196079, 1,
1.257249, -0.2563963, 1.588479, 1, 0, 0.6117647, 1,
1.25921, 0.8812995, 0.03162388, 1, 0, 0.6078432, 1,
1.262365, -0.4720138, 0.8343694, 1, 0, 0.6, 1,
1.276735, -0.5883034, 0.1577018, 1, 0, 0.5921569, 1,
1.29112, 0.2412369, 2.474693, 1, 0, 0.5882353, 1,
1.295967, -0.1742125, 3.078388, 1, 0, 0.5803922, 1,
1.321193, 1.012743, 1.892374, 1, 0, 0.5764706, 1,
1.325743, 0.6616512, -0.453714, 1, 0, 0.5686275, 1,
1.3536, 0.1524127, 2.008166, 1, 0, 0.5647059, 1,
1.359074, -0.8320153, 2.675225, 1, 0, 0.5568628, 1,
1.367553, 0.3763587, 2.98882, 1, 0, 0.5529412, 1,
1.368173, 0.1426081, 2.083549, 1, 0, 0.5450981, 1,
1.379465, 1.263237, 1.300902, 1, 0, 0.5411765, 1,
1.382633, -1.477232, 2.909119, 1, 0, 0.5333334, 1,
1.384615, -0.6177322, 2.651263, 1, 0, 0.5294118, 1,
1.385836, -0.5072935, 1.668585, 1, 0, 0.5215687, 1,
1.387391, 0.3587398, 3.127297, 1, 0, 0.5176471, 1,
1.388361, -0.161127, 2.139098, 1, 0, 0.509804, 1,
1.400079, 0.1241077, 1.894678, 1, 0, 0.5058824, 1,
1.413734, 0.1816048, 1.145879, 1, 0, 0.4980392, 1,
1.418454, -0.6933532, 1.573134, 1, 0, 0.4901961, 1,
1.425431, -1.755318, 0.1513052, 1, 0, 0.4862745, 1,
1.432583, -0.02155623, 0.9821829, 1, 0, 0.4784314, 1,
1.434457, 0.2352208, 2.243904, 1, 0, 0.4745098, 1,
1.443154, -0.5567714, 0.1753079, 1, 0, 0.4666667, 1,
1.445116, 0.8718445, 0.2563545, 1, 0, 0.4627451, 1,
1.457657, 0.6010374, 1.729912, 1, 0, 0.454902, 1,
1.458416, -0.7772765, -0.1984262, 1, 0, 0.4509804, 1,
1.467351, -0.7061069, 0.05774969, 1, 0, 0.4431373, 1,
1.470074, 0.07657187, 1.511666, 1, 0, 0.4392157, 1,
1.473703, 0.880602, -0.9979639, 1, 0, 0.4313726, 1,
1.474409, -0.124275, 1.493096, 1, 0, 0.427451, 1,
1.486694, 0.3093646, -0.25119, 1, 0, 0.4196078, 1,
1.504886, -0.2058327, 1.221185, 1, 0, 0.4156863, 1,
1.508228, 0.02531474, 2.741319, 1, 0, 0.4078431, 1,
1.509552, 0.6957489, 1.269265, 1, 0, 0.4039216, 1,
1.533345, 0.3433924, 2.380301, 1, 0, 0.3960784, 1,
1.534425, -0.4525647, 0.6297172, 1, 0, 0.3882353, 1,
1.540782, -1.645372, 3.599341, 1, 0, 0.3843137, 1,
1.547781, 1.781974, 1.00175, 1, 0, 0.3764706, 1,
1.549734, 0.6574219, 2.526451, 1, 0, 0.372549, 1,
1.559544, 0.3368958, -0.8192058, 1, 0, 0.3647059, 1,
1.573437, -2.09264, 3.010349, 1, 0, 0.3607843, 1,
1.57885, -1.566925, 2.273717, 1, 0, 0.3529412, 1,
1.584433, -0.5210303, 2.21348, 1, 0, 0.3490196, 1,
1.592772, 0.9156318, 2.470403, 1, 0, 0.3411765, 1,
1.59857, 0.4065544, 1.075674, 1, 0, 0.3372549, 1,
1.606714, 0.7192348, 2.422662, 1, 0, 0.3294118, 1,
1.608504, -0.9115412, 1.025114, 1, 0, 0.3254902, 1,
1.622518, 0.07431043, 1.132189, 1, 0, 0.3176471, 1,
1.62765, 1.556983, -0.4209919, 1, 0, 0.3137255, 1,
1.62982, -1.289785, 3.380343, 1, 0, 0.3058824, 1,
1.63564, 0.03889133, 0.3096133, 1, 0, 0.2980392, 1,
1.644753, 1.090734, -0.1143192, 1, 0, 0.2941177, 1,
1.654181, 1.267529, 2.178763, 1, 0, 0.2862745, 1,
1.684356, -0.2914689, 0.07582473, 1, 0, 0.282353, 1,
1.684455, -1.279469, 1.799879, 1, 0, 0.2745098, 1,
1.704312, -0.8770149, 1.69081, 1, 0, 0.2705882, 1,
1.717683, 1.482253, -0.2273913, 1, 0, 0.2627451, 1,
1.721229, -0.16738, 2.680891, 1, 0, 0.2588235, 1,
1.726356, -1.637812, 2.164082, 1, 0, 0.2509804, 1,
1.727345, -0.8138494, 1.071734, 1, 0, 0.2470588, 1,
1.756777, -0.1566325, 2.270891, 1, 0, 0.2392157, 1,
1.770576, -0.1399123, 2.081578, 1, 0, 0.2352941, 1,
1.7818, 0.0856609, 0.2458539, 1, 0, 0.227451, 1,
1.829758, 1.056423, 0.609294, 1, 0, 0.2235294, 1,
1.867414, 1.286608, 0.4880406, 1, 0, 0.2156863, 1,
1.867583, 0.6130145, 1.191691, 1, 0, 0.2117647, 1,
1.870484, 0.3061213, 0.933578, 1, 0, 0.2039216, 1,
1.894911, -2.003105, 1.828341, 1, 0, 0.1960784, 1,
1.902824, -0.2689447, 0.02455933, 1, 0, 0.1921569, 1,
1.905344, 2.528222, 1.47515, 1, 0, 0.1843137, 1,
1.910067, -0.1886697, 2.046929, 1, 0, 0.1803922, 1,
1.911411, 0.8877745, 1.755354, 1, 0, 0.172549, 1,
1.921963, -1.058174, 0.8885197, 1, 0, 0.1686275, 1,
1.948838, 1.63175, -0.09065681, 1, 0, 0.1607843, 1,
1.953376, -0.6145158, 3.059833, 1, 0, 0.1568628, 1,
1.964417, 1.236268, 1.144158, 1, 0, 0.1490196, 1,
1.972182, -0.6866462, 1.469687, 1, 0, 0.145098, 1,
1.9754, -1.642425, 1.825849, 1, 0, 0.1372549, 1,
1.980122, 0.1979066, 2.971624, 1, 0, 0.1333333, 1,
1.990734, -0.4061745, 1.523252, 1, 0, 0.1254902, 1,
2.022214, -1.218982, 1.121436, 1, 0, 0.1215686, 1,
2.037582, -0.5368039, 1.706641, 1, 0, 0.1137255, 1,
2.037853, 1.742647, 2.007758, 1, 0, 0.1098039, 1,
2.087048, -0.4869889, 1.588894, 1, 0, 0.1019608, 1,
2.159825, -1.31823, 2.035837, 1, 0, 0.09411765, 1,
2.166745, -0.0487546, 3.433145, 1, 0, 0.09019608, 1,
2.184684, -0.7005017, 2.352671, 1, 0, 0.08235294, 1,
2.206529, -0.5988007, 0.2847271, 1, 0, 0.07843138, 1,
2.229217, -0.3896927, 1.90996, 1, 0, 0.07058824, 1,
2.239762, 0.252773, 2.559858, 1, 0, 0.06666667, 1,
2.279112, -1.217123, 2.376622, 1, 0, 0.05882353, 1,
2.290731, 0.5898716, 1.559086, 1, 0, 0.05490196, 1,
2.299395, 0.05589265, 0.441079, 1, 0, 0.04705882, 1,
2.320405, -0.9307099, 1.14587, 1, 0, 0.04313726, 1,
2.334706, 1.1507, 1.254791, 1, 0, 0.03529412, 1,
2.338554, -0.8332893, -0.2279103, 1, 0, 0.03137255, 1,
2.374143, -0.2148034, 0.9916667, 1, 0, 0.02352941, 1,
2.48745, 2.292935, 0.9739492, 1, 0, 0.01960784, 1,
2.738998, -0.9502731, 3.342196, 1, 0, 0.01176471, 1,
3.223522, -1.416382, -0.0807455, 1, 0, 0.007843138, 1
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
-0.02676201, -4.935824, -6.44759, 0, -0.5, 0.5, 0.5,
-0.02676201, -4.935824, -6.44759, 1, -0.5, 0.5, 0.5,
-0.02676201, -4.935824, -6.44759, 1, 1.5, 0.5, 0.5,
-0.02676201, -4.935824, -6.44759, 0, 1.5, 0.5, 0.5
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
-4.378892, -0.297142, -6.44759, 0, -0.5, 0.5, 0.5,
-4.378892, -0.297142, -6.44759, 1, -0.5, 0.5, 0.5,
-4.378892, -0.297142, -6.44759, 1, 1.5, 0.5, 0.5,
-4.378892, -0.297142, -6.44759, 0, 1.5, 0.5, 0.5
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
-4.378892, -4.935824, 0.2368014, 0, -0.5, 0.5, 0.5,
-4.378892, -4.935824, 0.2368014, 1, -0.5, 0.5, 0.5,
-4.378892, -4.935824, 0.2368014, 1, 1.5, 0.5, 0.5,
-4.378892, -4.935824, 0.2368014, 0, 1.5, 0.5, 0.5
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
-3, -3.865359, -4.905038,
3, -3.865359, -4.905038,
-3, -3.865359, -4.905038,
-3, -4.04377, -5.16213,
-2, -3.865359, -4.905038,
-2, -4.04377, -5.16213,
-1, -3.865359, -4.905038,
-1, -4.04377, -5.16213,
0, -3.865359, -4.905038,
0, -4.04377, -5.16213,
1, -3.865359, -4.905038,
1, -4.04377, -5.16213,
2, -3.865359, -4.905038,
2, -4.04377, -5.16213,
3, -3.865359, -4.905038,
3, -4.04377, -5.16213
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
-3, -4.400592, -5.676314, 0, -0.5, 0.5, 0.5,
-3, -4.400592, -5.676314, 1, -0.5, 0.5, 0.5,
-3, -4.400592, -5.676314, 1, 1.5, 0.5, 0.5,
-3, -4.400592, -5.676314, 0, 1.5, 0.5, 0.5,
-2, -4.400592, -5.676314, 0, -0.5, 0.5, 0.5,
-2, -4.400592, -5.676314, 1, -0.5, 0.5, 0.5,
-2, -4.400592, -5.676314, 1, 1.5, 0.5, 0.5,
-2, -4.400592, -5.676314, 0, 1.5, 0.5, 0.5,
-1, -4.400592, -5.676314, 0, -0.5, 0.5, 0.5,
-1, -4.400592, -5.676314, 1, -0.5, 0.5, 0.5,
-1, -4.400592, -5.676314, 1, 1.5, 0.5, 0.5,
-1, -4.400592, -5.676314, 0, 1.5, 0.5, 0.5,
0, -4.400592, -5.676314, 0, -0.5, 0.5, 0.5,
0, -4.400592, -5.676314, 1, -0.5, 0.5, 0.5,
0, -4.400592, -5.676314, 1, 1.5, 0.5, 0.5,
0, -4.400592, -5.676314, 0, 1.5, 0.5, 0.5,
1, -4.400592, -5.676314, 0, -0.5, 0.5, 0.5,
1, -4.400592, -5.676314, 1, -0.5, 0.5, 0.5,
1, -4.400592, -5.676314, 1, 1.5, 0.5, 0.5,
1, -4.400592, -5.676314, 0, 1.5, 0.5, 0.5,
2, -4.400592, -5.676314, 0, -0.5, 0.5, 0.5,
2, -4.400592, -5.676314, 1, -0.5, 0.5, 0.5,
2, -4.400592, -5.676314, 1, 1.5, 0.5, 0.5,
2, -4.400592, -5.676314, 0, 1.5, 0.5, 0.5,
3, -4.400592, -5.676314, 0, -0.5, 0.5, 0.5,
3, -4.400592, -5.676314, 1, -0.5, 0.5, 0.5,
3, -4.400592, -5.676314, 1, 1.5, 0.5, 0.5,
3, -4.400592, -5.676314, 0, 1.5, 0.5, 0.5
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
-3.374554, -3, -4.905038,
-3.374554, 3, -4.905038,
-3.374554, -3, -4.905038,
-3.541944, -3, -5.16213,
-3.374554, -2, -4.905038,
-3.541944, -2, -5.16213,
-3.374554, -1, -4.905038,
-3.541944, -1, -5.16213,
-3.374554, 0, -4.905038,
-3.541944, 0, -5.16213,
-3.374554, 1, -4.905038,
-3.541944, 1, -5.16213,
-3.374554, 2, -4.905038,
-3.541944, 2, -5.16213,
-3.374554, 3, -4.905038,
-3.541944, 3, -5.16213
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
-3.876723, -3, -5.676314, 0, -0.5, 0.5, 0.5,
-3.876723, -3, -5.676314, 1, -0.5, 0.5, 0.5,
-3.876723, -3, -5.676314, 1, 1.5, 0.5, 0.5,
-3.876723, -3, -5.676314, 0, 1.5, 0.5, 0.5,
-3.876723, -2, -5.676314, 0, -0.5, 0.5, 0.5,
-3.876723, -2, -5.676314, 1, -0.5, 0.5, 0.5,
-3.876723, -2, -5.676314, 1, 1.5, 0.5, 0.5,
-3.876723, -2, -5.676314, 0, 1.5, 0.5, 0.5,
-3.876723, -1, -5.676314, 0, -0.5, 0.5, 0.5,
-3.876723, -1, -5.676314, 1, -0.5, 0.5, 0.5,
-3.876723, -1, -5.676314, 1, 1.5, 0.5, 0.5,
-3.876723, -1, -5.676314, 0, 1.5, 0.5, 0.5,
-3.876723, 0, -5.676314, 0, -0.5, 0.5, 0.5,
-3.876723, 0, -5.676314, 1, -0.5, 0.5, 0.5,
-3.876723, 0, -5.676314, 1, 1.5, 0.5, 0.5,
-3.876723, 0, -5.676314, 0, 1.5, 0.5, 0.5,
-3.876723, 1, -5.676314, 0, -0.5, 0.5, 0.5,
-3.876723, 1, -5.676314, 1, -0.5, 0.5, 0.5,
-3.876723, 1, -5.676314, 1, 1.5, 0.5, 0.5,
-3.876723, 1, -5.676314, 0, 1.5, 0.5, 0.5,
-3.876723, 2, -5.676314, 0, -0.5, 0.5, 0.5,
-3.876723, 2, -5.676314, 1, -0.5, 0.5, 0.5,
-3.876723, 2, -5.676314, 1, 1.5, 0.5, 0.5,
-3.876723, 2, -5.676314, 0, 1.5, 0.5, 0.5,
-3.876723, 3, -5.676314, 0, -0.5, 0.5, 0.5,
-3.876723, 3, -5.676314, 1, -0.5, 0.5, 0.5,
-3.876723, 3, -5.676314, 1, 1.5, 0.5, 0.5,
-3.876723, 3, -5.676314, 0, 1.5, 0.5, 0.5
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
-3.374554, -3.865359, -4,
-3.374554, -3.865359, 4,
-3.374554, -3.865359, -4,
-3.541944, -4.04377, -4,
-3.374554, -3.865359, -2,
-3.541944, -4.04377, -2,
-3.374554, -3.865359, 0,
-3.541944, -4.04377, 0,
-3.374554, -3.865359, 2,
-3.541944, -4.04377, 2,
-3.374554, -3.865359, 4,
-3.541944, -4.04377, 4
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
-3.876723, -4.400592, -4, 0, -0.5, 0.5, 0.5,
-3.876723, -4.400592, -4, 1, -0.5, 0.5, 0.5,
-3.876723, -4.400592, -4, 1, 1.5, 0.5, 0.5,
-3.876723, -4.400592, -4, 0, 1.5, 0.5, 0.5,
-3.876723, -4.400592, -2, 0, -0.5, 0.5, 0.5,
-3.876723, -4.400592, -2, 1, -0.5, 0.5, 0.5,
-3.876723, -4.400592, -2, 1, 1.5, 0.5, 0.5,
-3.876723, -4.400592, -2, 0, 1.5, 0.5, 0.5,
-3.876723, -4.400592, 0, 0, -0.5, 0.5, 0.5,
-3.876723, -4.400592, 0, 1, -0.5, 0.5, 0.5,
-3.876723, -4.400592, 0, 1, 1.5, 0.5, 0.5,
-3.876723, -4.400592, 0, 0, 1.5, 0.5, 0.5,
-3.876723, -4.400592, 2, 0, -0.5, 0.5, 0.5,
-3.876723, -4.400592, 2, 1, -0.5, 0.5, 0.5,
-3.876723, -4.400592, 2, 1, 1.5, 0.5, 0.5,
-3.876723, -4.400592, 2, 0, 1.5, 0.5, 0.5,
-3.876723, -4.400592, 4, 0, -0.5, 0.5, 0.5,
-3.876723, -4.400592, 4, 1, -0.5, 0.5, 0.5,
-3.876723, -4.400592, 4, 1, 1.5, 0.5, 0.5,
-3.876723, -4.400592, 4, 0, 1.5, 0.5, 0.5
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
-3.374554, -3.865359, -4.905038,
-3.374554, 3.271075, -4.905038,
-3.374554, -3.865359, 5.378641,
-3.374554, 3.271075, 5.378641,
-3.374554, -3.865359, -4.905038,
-3.374554, -3.865359, 5.378641,
-3.374554, 3.271075, -4.905038,
-3.374554, 3.271075, 5.378641,
-3.374554, -3.865359, -4.905038,
3.32103, -3.865359, -4.905038,
-3.374554, -3.865359, 5.378641,
3.32103, -3.865359, 5.378641,
-3.374554, 3.271075, -4.905038,
3.32103, 3.271075, -4.905038,
-3.374554, 3.271075, 5.378641,
3.32103, 3.271075, 5.378641,
3.32103, -3.865359, -4.905038,
3.32103, 3.271075, -4.905038,
3.32103, -3.865359, 5.378641,
3.32103, 3.271075, 5.378641,
3.32103, -3.865359, -4.905038,
3.32103, -3.865359, 5.378641,
3.32103, 3.271075, -4.905038,
3.32103, 3.271075, 5.378641
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
var radius = 7.580147;
var distance = 33.72493;
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
mvMatrix.translate( 0.02676201, 0.297142, -0.2368014 );
mvMatrix.scale( 1.224061, 1.148445, 0.796972 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.72493);
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
flurochloridone<-read.table("flurochloridone.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flurochloridone$V2
```

```
## Error in eval(expr, envir, enclos): object 'flurochloridone' not found
```

```r
y<-flurochloridone$V3
```

```
## Error in eval(expr, envir, enclos): object 'flurochloridone' not found
```

```r
z<-flurochloridone$V4
```

```
## Error in eval(expr, envir, enclos): object 'flurochloridone' not found
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
-3.277046, -1.513097, -0.9807782, 0, 0, 1, 1, 1,
-2.707075, -1.216881, -2.045342, 1, 0, 0, 1, 1,
-2.672911, -0.1012767, -2.322026, 1, 0, 0, 1, 1,
-2.620489, -0.9265357, -0.4133494, 1, 0, 0, 1, 1,
-2.577997, -1.835644, -2.206858, 1, 0, 0, 1, 1,
-2.551533, -0.4670687, -2.490218, 1, 0, 0, 1, 1,
-2.5339, -0.1233278, -1.828067, 0, 0, 0, 1, 1,
-2.491863, 0.6377226, -2.131308, 0, 0, 0, 1, 1,
-2.479327, -0.6726021, -3.384102, 0, 0, 0, 1, 1,
-2.422579, -0.04672495, -0.8252444, 0, 0, 0, 1, 1,
-2.394129, 0.4127994, -0.405696, 0, 0, 0, 1, 1,
-2.378779, 0.8243569, -0.7083104, 0, 0, 0, 1, 1,
-2.366126, 0.4643227, -1.387174, 0, 0, 0, 1, 1,
-2.196832, 0.2455941, -1.151351, 1, 1, 1, 1, 1,
-2.179773, -0.4394063, -1.15313, 1, 1, 1, 1, 1,
-2.163593, 0.01941359, -1.040944, 1, 1, 1, 1, 1,
-2.13791, -1.516421, -1.787513, 1, 1, 1, 1, 1,
-2.124575, 0.001455621, 0.426183, 1, 1, 1, 1, 1,
-2.119331, -0.1071498, -1.764791, 1, 1, 1, 1, 1,
-2.088109, -0.4823408, -1.412058, 1, 1, 1, 1, 1,
-2.074559, 0.01538933, 0.08282127, 1, 1, 1, 1, 1,
-2.065897, -0.7063845, -1.166833, 1, 1, 1, 1, 1,
-2.047036, -1.140013, -1.288915, 1, 1, 1, 1, 1,
-2.031505, 0.09879901, -0.5264049, 1, 1, 1, 1, 1,
-2.019531, -1.934011, -3.250614, 1, 1, 1, 1, 1,
-1.992113, -1.629966, -2.068682, 1, 1, 1, 1, 1,
-1.986973, -0.06488974, -1.10621, 1, 1, 1, 1, 1,
-1.981635, 0.3194964, -1.945665, 1, 1, 1, 1, 1,
-1.954412, 0.40756, -2.328309, 0, 0, 1, 1, 1,
-1.945689, -0.2069453, -3.070543, 1, 0, 0, 1, 1,
-1.868016, 0.5038365, -1.739834, 1, 0, 0, 1, 1,
-1.867437, -1.423226, -2.787262, 1, 0, 0, 1, 1,
-1.861756, 1.660259, -1.681188, 1, 0, 0, 1, 1,
-1.849597, 1.929793, -1.781559, 1, 0, 0, 1, 1,
-1.84835, -0.1909221, -0.2107965, 0, 0, 0, 1, 1,
-1.834434, 0.1469803, -1.034624, 0, 0, 0, 1, 1,
-1.81631, 0.7842718, -2.802059, 0, 0, 0, 1, 1,
-1.81286, 0.04000615, -2.809936, 0, 0, 0, 1, 1,
-1.788816, 1.141431, -1.331788, 0, 0, 0, 1, 1,
-1.779171, 0.5621234, -0.06526194, 0, 0, 0, 1, 1,
-1.760642, -0.1589486, -1.889684, 0, 0, 0, 1, 1,
-1.747873, 1.134691, -1.689897, 1, 1, 1, 1, 1,
-1.739566, -0.6470292, -1.724669, 1, 1, 1, 1, 1,
-1.733669, 2.717329, -0.8645877, 1, 1, 1, 1, 1,
-1.726993, 1.425025, -1.575178, 1, 1, 1, 1, 1,
-1.708193, 0.8427079, -1.074283, 1, 1, 1, 1, 1,
-1.699027, 1.340389, -0.8867152, 1, 1, 1, 1, 1,
-1.68181, -1.462399, -1.469106, 1, 1, 1, 1, 1,
-1.675028, 0.2335926, -1.341671, 1, 1, 1, 1, 1,
-1.672398, 0.06967109, -1.88882, 1, 1, 1, 1, 1,
-1.670276, 0.444062, -3.294065, 1, 1, 1, 1, 1,
-1.666054, 0.2515789, -1.495313, 1, 1, 1, 1, 1,
-1.645097, 0.9381701, -1.460973, 1, 1, 1, 1, 1,
-1.634751, 0.5339193, -1.775633, 1, 1, 1, 1, 1,
-1.632941, -1.992104, -2.7946, 1, 1, 1, 1, 1,
-1.631096, 0.8219705, -0.6263081, 1, 1, 1, 1, 1,
-1.630677, 1.886564, 1.366041, 0, 0, 1, 1, 1,
-1.630245, 0.07344379, 0.3390152, 1, 0, 0, 1, 1,
-1.626719, -0.9161151, -3.22425, 1, 0, 0, 1, 1,
-1.620046, -0.9484074, -2.489751, 1, 0, 0, 1, 1,
-1.591377, -0.500752, -3.057019, 1, 0, 0, 1, 1,
-1.583401, -0.01130958, -3.19189, 1, 0, 0, 1, 1,
-1.580909, 0.03171672, -2.392718, 0, 0, 0, 1, 1,
-1.564321, 0.08763562, -1.573896, 0, 0, 0, 1, 1,
-1.558651, -1.312013, -1.285123, 0, 0, 0, 1, 1,
-1.549005, -0.08064838, -3.173243, 0, 0, 0, 1, 1,
-1.543046, -0.6703635, -1.706658, 0, 0, 0, 1, 1,
-1.542412, -0.1344583, -2.260539, 0, 0, 0, 1, 1,
-1.531301, 1.834964, -0.5877515, 0, 0, 0, 1, 1,
-1.530646, -0.649689, -4.317172, 1, 1, 1, 1, 1,
-1.529057, -1.800871, -3.464798, 1, 1, 1, 1, 1,
-1.526826, -1.475246, -1.492546, 1, 1, 1, 1, 1,
-1.525887, 0.9267513, -1.559083, 1, 1, 1, 1, 1,
-1.51351, -1.237116, -2.701181, 1, 1, 1, 1, 1,
-1.506776, 0.2020437, -1.852493, 1, 1, 1, 1, 1,
-1.49606, 0.3235419, -1.740863, 1, 1, 1, 1, 1,
-1.489483, -0.1076293, -2.594013, 1, 1, 1, 1, 1,
-1.486305, -1.538906, -2.454264, 1, 1, 1, 1, 1,
-1.481845, -0.04879547, -1.525059, 1, 1, 1, 1, 1,
-1.478967, -0.4009376, -0.9615361, 1, 1, 1, 1, 1,
-1.461632, -0.1146395, -1.789888, 1, 1, 1, 1, 1,
-1.457547, 0.9451806, -1.897439, 1, 1, 1, 1, 1,
-1.45157, -2.144367, -1.878245, 1, 1, 1, 1, 1,
-1.443419, 1.41015, -1.248331, 1, 1, 1, 1, 1,
-1.43426, -0.7587223, -2.372274, 0, 0, 1, 1, 1,
-1.428662, -1.540121, -1.821801, 1, 0, 0, 1, 1,
-1.428653, 2.242431, -1.543691, 1, 0, 0, 1, 1,
-1.424689, 0.4308418, -0.4868012, 1, 0, 0, 1, 1,
-1.424095, 1.154981, 0.1509539, 1, 0, 0, 1, 1,
-1.422813, 1.64009, 0.03937407, 1, 0, 0, 1, 1,
-1.420556, -1.180531, -2.551019, 0, 0, 0, 1, 1,
-1.415278, 1.594977, -0.8344313, 0, 0, 0, 1, 1,
-1.409398, 1.430924, -1.335482, 0, 0, 0, 1, 1,
-1.380916, 1.480793, -1.782831, 0, 0, 0, 1, 1,
-1.378789, 0.9581001, -0.76518, 0, 0, 0, 1, 1,
-1.375983, -0.0797163, 0.1917927, 0, 0, 0, 1, 1,
-1.373449, 1.046173, -0.6816923, 0, 0, 0, 1, 1,
-1.364672, -1.003778, -2.301333, 1, 1, 1, 1, 1,
-1.363757, -0.6197585, -2.595247, 1, 1, 1, 1, 1,
-1.360328, -0.1104643, -2.306924, 1, 1, 1, 1, 1,
-1.359401, -0.167619, -2.617694, 1, 1, 1, 1, 1,
-1.359059, -0.1579947, -2.453207, 1, 1, 1, 1, 1,
-1.35616, 1.763118, -0.01024069, 1, 1, 1, 1, 1,
-1.352764, 0.4209146, -0.495837, 1, 1, 1, 1, 1,
-1.351075, 1.49466, 0.8673785, 1, 1, 1, 1, 1,
-1.349069, 0.01427212, -0.8575858, 1, 1, 1, 1, 1,
-1.34646, 1.125926, -0.3954788, 1, 1, 1, 1, 1,
-1.346046, -0.6185513, -3.046976, 1, 1, 1, 1, 1,
-1.342809, 0.6459295, 1.041436, 1, 1, 1, 1, 1,
-1.318651, -0.4054604, -2.609284, 1, 1, 1, 1, 1,
-1.315187, -0.1330537, -2.5449, 1, 1, 1, 1, 1,
-1.307334, 0.1765609, -1.794815, 1, 1, 1, 1, 1,
-1.301394, 1.25395, 2.15045, 0, 0, 1, 1, 1,
-1.297229, 0.9345964, -0.8940151, 1, 0, 0, 1, 1,
-1.294583, 0.4247752, -1.416348, 1, 0, 0, 1, 1,
-1.292545, 0.9582045, -0.8490814, 1, 0, 0, 1, 1,
-1.278937, -0.02218156, -0.6836783, 1, 0, 0, 1, 1,
-1.277609, 1.81497, 0.8991961, 1, 0, 0, 1, 1,
-1.274135, -0.4848066, -2.043844, 0, 0, 0, 1, 1,
-1.272386, 1.029096, 0.6897326, 0, 0, 0, 1, 1,
-1.271752, -0.5819317, -1.306244, 0, 0, 0, 1, 1,
-1.270163, -0.5035691, -1.93643, 0, 0, 0, 1, 1,
-1.270063, 1.266471, -0.6303834, 0, 0, 0, 1, 1,
-1.266567, 0.4046414, -1.923645, 0, 0, 0, 1, 1,
-1.258968, -0.3241188, -2.920131, 0, 0, 0, 1, 1,
-1.25208, 0.5771842, -1.450397, 1, 1, 1, 1, 1,
-1.248728, -0.9584744, -1.114564, 1, 1, 1, 1, 1,
-1.240169, 0.7314739, -2.17933, 1, 1, 1, 1, 1,
-1.238996, 0.1567226, -3.165232, 1, 1, 1, 1, 1,
-1.234631, 0.9586635, -1.018099, 1, 1, 1, 1, 1,
-1.226807, 0.5389592, 0.8989239, 1, 1, 1, 1, 1,
-1.221299, 2.493832, 0.07717737, 1, 1, 1, 1, 1,
-1.215567, -1.200775, -3.010959, 1, 1, 1, 1, 1,
-1.21315, 0.5718384, -1.451308, 1, 1, 1, 1, 1,
-1.20478, -0.9774981, -2.707839, 1, 1, 1, 1, 1,
-1.198954, 0.2387803, -0.06275002, 1, 1, 1, 1, 1,
-1.195959, 0.5218913, -0.9137045, 1, 1, 1, 1, 1,
-1.178411, -0.6603054, -1.275072, 1, 1, 1, 1, 1,
-1.173985, -0.04822725, -0.672833, 1, 1, 1, 1, 1,
-1.170621, 1.338763, -0.1144682, 1, 1, 1, 1, 1,
-1.169767, -1.492942, -0.8996583, 0, 0, 1, 1, 1,
-1.167584, 0.8211331, 0.3091148, 1, 0, 0, 1, 1,
-1.162272, 1.383449, -4.107592, 1, 0, 0, 1, 1,
-1.160418, 0.7621176, -0.8248025, 1, 0, 0, 1, 1,
-1.155967, 0.3317452, -2.309778, 1, 0, 0, 1, 1,
-1.153248, 0.9500707, -0.7529963, 1, 0, 0, 1, 1,
-1.130696, 1.551322, -0.0006111639, 0, 0, 0, 1, 1,
-1.124224, -0.3419141, -4.036478, 0, 0, 0, 1, 1,
-1.121986, -0.6411916, -1.021198, 0, 0, 0, 1, 1,
-1.120627, 0.6681629, -0.8294898, 0, 0, 0, 1, 1,
-1.114954, 1.895792, -3.130148, 0, 0, 0, 1, 1,
-1.112732, -0.4425653, -1.791904, 0, 0, 0, 1, 1,
-1.108819, -1.686023, -2.713707, 0, 0, 0, 1, 1,
-1.098187, 0.6217456, -2.442313, 1, 1, 1, 1, 1,
-1.097625, 0.9333073, -2.998886, 1, 1, 1, 1, 1,
-1.097625, -1.14708, -3.837705, 1, 1, 1, 1, 1,
-1.095572, 1.167038, -0.4226682, 1, 1, 1, 1, 1,
-1.087265, 1.910288, -0.7086406, 1, 1, 1, 1, 1,
-1.087135, 0.9707217, -0.4013332, 1, 1, 1, 1, 1,
-1.083913, 0.1214888, -0.7969471, 1, 1, 1, 1, 1,
-1.078138, -0.7744516, -2.406549, 1, 1, 1, 1, 1,
-1.068558, 0.5345893, -0.1657075, 1, 1, 1, 1, 1,
-1.067163, -1.718977, -2.517496, 1, 1, 1, 1, 1,
-1.06194, -1.381127, -2.763951, 1, 1, 1, 1, 1,
-1.061644, 0.8818588, -0.6799679, 1, 1, 1, 1, 1,
-1.054467, 0.1732248, 0.5083074, 1, 1, 1, 1, 1,
-1.052396, -0.242988, -2.835868, 1, 1, 1, 1, 1,
-1.052263, 0.4023496, -2.048461, 1, 1, 1, 1, 1,
-1.052091, -1.376421, -3.059952, 0, 0, 1, 1, 1,
-1.047472, -1.787376, -3.048561, 1, 0, 0, 1, 1,
-1.044372, -0.8376167, -2.206878, 1, 0, 0, 1, 1,
-1.038906, -1.545784, -1.750747, 1, 0, 0, 1, 1,
-1.038633, -1.775562, -4.231999, 1, 0, 0, 1, 1,
-1.037745, 0.2346068, -1.714822, 1, 0, 0, 1, 1,
-1.030318, 1.237847, -0.007693946, 0, 0, 0, 1, 1,
-1.022329, 1.288707, -2.71719, 0, 0, 0, 1, 1,
-1.019788, -0.916635, -2.110517, 0, 0, 0, 1, 1,
-1.01758, 0.8428776, -0.2344039, 0, 0, 0, 1, 1,
-1.012615, 0.5926716, -2.195114, 0, 0, 0, 1, 1,
-1.007304, -2.094802, -3.693213, 0, 0, 0, 1, 1,
-1.005939, 0.3088336, -0.3760546, 0, 0, 0, 1, 1,
-1.005107, 0.5771125, -1.005898, 1, 1, 1, 1, 1,
-0.9943357, 0.4850497, -1.238875, 1, 1, 1, 1, 1,
-0.9931322, -0.9105401, -2.620582, 1, 1, 1, 1, 1,
-0.9853764, -0.163447, -1.181263, 1, 1, 1, 1, 1,
-0.9837783, 0.2074498, -2.742494, 1, 1, 1, 1, 1,
-0.9817258, 0.6107622, -1.798617, 1, 1, 1, 1, 1,
-0.9790682, -1.387825, -2.428792, 1, 1, 1, 1, 1,
-0.9647323, -1.185424, -3.178652, 1, 1, 1, 1, 1,
-0.963986, -0.9590171, -0.8890318, 1, 1, 1, 1, 1,
-0.9607705, 0.2393515, -0.4332087, 1, 1, 1, 1, 1,
-0.9592174, -0.09277261, -1.512772, 1, 1, 1, 1, 1,
-0.9486402, 0.8340592, -1.707295, 1, 1, 1, 1, 1,
-0.9473118, 1.070541, -2.421737, 1, 1, 1, 1, 1,
-0.9385223, 1.45508, -0.9945927, 1, 1, 1, 1, 1,
-0.9379551, 1.282572, -0.3216911, 1, 1, 1, 1, 1,
-0.9370298, 0.08266487, -2.099787, 0, 0, 1, 1, 1,
-0.9341326, -0.2627179, -0.489631, 1, 0, 0, 1, 1,
-0.9227896, 0.02751699, -3.413603, 1, 0, 0, 1, 1,
-0.9146088, -0.8605561, -2.22756, 1, 0, 0, 1, 1,
-0.9134652, 0.787119, -0.474209, 1, 0, 0, 1, 1,
-0.9122818, -0.1931865, -1.108097, 1, 0, 0, 1, 1,
-0.9067946, -0.0334997, -2.963606, 0, 0, 0, 1, 1,
-0.900925, 2.663016, -0.004585542, 0, 0, 0, 1, 1,
-0.8996675, -1.028155, -1.813951, 0, 0, 0, 1, 1,
-0.8933571, 1.253647, -0.6144602, 0, 0, 0, 1, 1,
-0.8912253, -0.040885, -0.9893928, 0, 0, 0, 1, 1,
-0.8883638, 1.134109, -0.2071198, 0, 0, 0, 1, 1,
-0.8833946, 0.9017128, 1.048536, 0, 0, 0, 1, 1,
-0.8820621, -1.637148, -1.86326, 1, 1, 1, 1, 1,
-0.879887, 0.1621304, -1.630329, 1, 1, 1, 1, 1,
-0.8780581, 0.6317974, -0.5424915, 1, 1, 1, 1, 1,
-0.8713314, -0.8230055, -2.554766, 1, 1, 1, 1, 1,
-0.8685462, 1.114591, -1.416842, 1, 1, 1, 1, 1,
-0.867433, 0.4525973, -1.069454, 1, 1, 1, 1, 1,
-0.8671882, 1.574443, -0.9642166, 1, 1, 1, 1, 1,
-0.8637363, 0.2214213, -1.039465, 1, 1, 1, 1, 1,
-0.8634893, -0.5715321, -3.251119, 1, 1, 1, 1, 1,
-0.8611895, 0.4343476, -1.923199, 1, 1, 1, 1, 1,
-0.8596461, 0.8211279, -3.213827, 1, 1, 1, 1, 1,
-0.8548126, 1.487176, 1.101692, 1, 1, 1, 1, 1,
-0.8469399, 0.5636891, -1.381806, 1, 1, 1, 1, 1,
-0.8379502, 1.295275, -0.09626465, 1, 1, 1, 1, 1,
-0.8337443, -0.7388396, -1.113264, 1, 1, 1, 1, 1,
-0.8336819, 0.4741442, -2.277066, 0, 0, 1, 1, 1,
-0.81857, 0.5896452, -1.157534, 1, 0, 0, 1, 1,
-0.8182265, -1.435469, -1.920016, 1, 0, 0, 1, 1,
-0.814805, -1.761698, 0.2022468, 1, 0, 0, 1, 1,
-0.8134136, 0.1841814, -1.683292, 1, 0, 0, 1, 1,
-0.8041829, 0.2859119, -2.210798, 1, 0, 0, 1, 1,
-0.8041068, 0.3804962, 0.358705, 0, 0, 0, 1, 1,
-0.802914, 0.8418469, 0.1542688, 0, 0, 0, 1, 1,
-0.8003049, 0.281657, -1.067497, 0, 0, 0, 1, 1,
-0.7924381, 1.557339, 0.2911116, 0, 0, 0, 1, 1,
-0.7922556, 0.1540762, -1.871836, 0, 0, 0, 1, 1,
-0.7916861, 2.140809, -0.8437976, 0, 0, 0, 1, 1,
-0.7904322, -0.02883833, -1.421228, 0, 0, 0, 1, 1,
-0.7889275, 1.099761, -1.233469, 1, 1, 1, 1, 1,
-0.7882695, 1.217132, -2.862787, 1, 1, 1, 1, 1,
-0.7848151, 0.05219711, -1.678062, 1, 1, 1, 1, 1,
-0.7723966, 0.76561, -0.02655344, 1, 1, 1, 1, 1,
-0.7697778, -0.4304262, -2.688004, 1, 1, 1, 1, 1,
-0.7697749, -0.1556601, -1.163481, 1, 1, 1, 1, 1,
-0.763404, 0.03110346, -1.469277, 1, 1, 1, 1, 1,
-0.7628179, -0.1260462, 0.6347775, 1, 1, 1, 1, 1,
-0.7598193, 0.1608187, -0.1938078, 1, 1, 1, 1, 1,
-0.7525099, 0.8087001, -0.1784892, 1, 1, 1, 1, 1,
-0.7518573, 0.3437053, -1.341907, 1, 1, 1, 1, 1,
-0.7515832, 0.7517521, -2.510383, 1, 1, 1, 1, 1,
-0.7494376, 0.3158213, -0.1100921, 1, 1, 1, 1, 1,
-0.7333722, 1.756333, -0.7625021, 1, 1, 1, 1, 1,
-0.7325644, -0.955426, -2.433385, 1, 1, 1, 1, 1,
-0.7230815, -0.09338907, -1.906821, 0, 0, 1, 1, 1,
-0.716867, -1.48853, -2.545262, 1, 0, 0, 1, 1,
-0.7151539, 0.6710154, -0.6557396, 1, 0, 0, 1, 1,
-0.7098839, -0.001661753, -1.500216, 1, 0, 0, 1, 1,
-0.7075396, 2.29973, -1.232932, 1, 0, 0, 1, 1,
-0.7049814, 0.7190061, 0.144991, 1, 0, 0, 1, 1,
-0.7014623, 0.4382809, -0.849431, 0, 0, 0, 1, 1,
-0.7013442, -0.4083301, -1.194585, 0, 0, 0, 1, 1,
-0.6980911, -1.341197, -1.762836, 0, 0, 0, 1, 1,
-0.6972253, 0.7857718, -2.8931, 0, 0, 0, 1, 1,
-0.6968726, -0.3300777, -1.315258, 0, 0, 0, 1, 1,
-0.6931319, 0.4208391, -0.6904896, 0, 0, 0, 1, 1,
-0.6879182, -1.107337, -2.647726, 0, 0, 0, 1, 1,
-0.6771844, 2.07038, -1.605032, 1, 1, 1, 1, 1,
-0.6748019, 0.5144838, 0.9176903, 1, 1, 1, 1, 1,
-0.6738172, 0.09804922, -0.6008072, 1, 1, 1, 1, 1,
-0.6718752, 0.5369214, -0.3548121, 1, 1, 1, 1, 1,
-0.671414, 0.5330963, 0.1362898, 1, 1, 1, 1, 1,
-0.6711392, 1.009248, 1.523333, 1, 1, 1, 1, 1,
-0.6615286, 1.657742, -1.405042, 1, 1, 1, 1, 1,
-0.6597809, -1.467184, -2.956457, 1, 1, 1, 1, 1,
-0.6546528, 0.7383451, -0.483001, 1, 1, 1, 1, 1,
-0.6528909, 0.3790869, -0.9891998, 1, 1, 1, 1, 1,
-0.6492455, -1.054217, -2.213177, 1, 1, 1, 1, 1,
-0.6448788, 0.3394903, -1.553879, 1, 1, 1, 1, 1,
-0.6407113, -0.3882034, -2.375793, 1, 1, 1, 1, 1,
-0.6392336, -1.157616, -1.398959, 1, 1, 1, 1, 1,
-0.6335943, -0.2591545, -1.346185, 1, 1, 1, 1, 1,
-0.6335328, -1.334155, -2.775532, 0, 0, 1, 1, 1,
-0.630181, -1.287235, -3.28932, 1, 0, 0, 1, 1,
-0.6296833, 0.6319805, -0.7686421, 1, 0, 0, 1, 1,
-0.6222841, 1.098748, -0.7169185, 1, 0, 0, 1, 1,
-0.6212291, -0.9385021, -2.694138, 1, 0, 0, 1, 1,
-0.618767, -0.3543382, -1.863733, 1, 0, 0, 1, 1,
-0.6146697, -1.816534, -3.513467, 0, 0, 0, 1, 1,
-0.6105929, 1.397708, -2.033641, 0, 0, 0, 1, 1,
-0.6094895, 0.4974472, -0.8309271, 0, 0, 0, 1, 1,
-0.6071477, -1.868924, -4.755276, 0, 0, 0, 1, 1,
-0.6033724, -1.191668, -4.201054, 0, 0, 0, 1, 1,
-0.6014516, -0.5726761, -3.057214, 0, 0, 0, 1, 1,
-0.5978412, 1.046095, -0.111182, 0, 0, 0, 1, 1,
-0.5961739, -0.1510959, -0.8839287, 1, 1, 1, 1, 1,
-0.5944623, 0.3063843, -0.7565822, 1, 1, 1, 1, 1,
-0.5944417, -0.9715263, -2.687653, 1, 1, 1, 1, 1,
-0.5942529, -1.075431, -3.219207, 1, 1, 1, 1, 1,
-0.5925851, -0.1174579, -2.363479, 1, 1, 1, 1, 1,
-0.5894043, -1.39308, -2.973101, 1, 1, 1, 1, 1,
-0.5875266, -0.4282556, -1.771267, 1, 1, 1, 1, 1,
-0.5856817, 0.5233072, -0.7731898, 1, 1, 1, 1, 1,
-0.5854439, 0.4180778, -1.534289, 1, 1, 1, 1, 1,
-0.5844136, -0.3063481, -0.1339222, 1, 1, 1, 1, 1,
-0.5839087, 0.9232895, 0.8717875, 1, 1, 1, 1, 1,
-0.5764186, 2.320089, -0.4284829, 1, 1, 1, 1, 1,
-0.5728451, 0.2566039, -1.037378, 1, 1, 1, 1, 1,
-0.5708156, -0.4595657, -2.84361, 1, 1, 1, 1, 1,
-0.5694754, 1.683094, -0.7014477, 1, 1, 1, 1, 1,
-0.5688445, 0.6504377, -0.7698324, 0, 0, 1, 1, 1,
-0.5598263, -0.2703887, -2.144426, 1, 0, 0, 1, 1,
-0.5582204, 0.5984712, -3.000128, 1, 0, 0, 1, 1,
-0.5554701, 0.3153155, -1.172821, 1, 0, 0, 1, 1,
-0.5548978, 0.4535352, -0.5211911, 1, 0, 0, 1, 1,
-0.5524195, -0.3764116, -2.024626, 1, 0, 0, 1, 1,
-0.5466616, 0.2241854, -1.70755, 0, 0, 0, 1, 1,
-0.5435393, -0.07644605, -1.631357, 0, 0, 0, 1, 1,
-0.5417271, 0.7439502, -0.1388622, 0, 0, 0, 1, 1,
-0.541611, 1.195919, 0.4159351, 0, 0, 0, 1, 1,
-0.5351884, -0.2106401, -1.802578, 0, 0, 0, 1, 1,
-0.5329933, -0.983447, -1.730474, 0, 0, 0, 1, 1,
-0.5282902, 0.3993933, -0.7707599, 0, 0, 0, 1, 1,
-0.5185609, -0.5548145, -1.930273, 1, 1, 1, 1, 1,
-0.5180056, -0.6402152, -3.34784, 1, 1, 1, 1, 1,
-0.5153373, -0.6844949, -2.424211, 1, 1, 1, 1, 1,
-0.5117851, -2.036195, -2.470612, 1, 1, 1, 1, 1,
-0.5087094, -0.8793516, -2.356798, 1, 1, 1, 1, 1,
-0.5054435, 0.4379914, -0.7085791, 1, 1, 1, 1, 1,
-0.5043896, -0.4042535, -1.780162, 1, 1, 1, 1, 1,
-0.5018772, -0.03912299, -1.525805, 1, 1, 1, 1, 1,
-0.4984169, 0.7437677, -2.216605, 1, 1, 1, 1, 1,
-0.4981912, -0.243619, -1.08492, 1, 1, 1, 1, 1,
-0.4977314, -1.56935, -2.424714, 1, 1, 1, 1, 1,
-0.4966981, 2.427624, -0.3513912, 1, 1, 1, 1, 1,
-0.4900243, -0.9385893, -3.01416, 1, 1, 1, 1, 1,
-0.4845429, -0.6250494, -0.7367001, 1, 1, 1, 1, 1,
-0.4830524, 0.00878931, -2.729814, 1, 1, 1, 1, 1,
-0.4775524, -0.1289449, -2.444619, 0, 0, 1, 1, 1,
-0.472755, -0.357784, -2.228513, 1, 0, 0, 1, 1,
-0.4684429, 1.158408, -1.634722, 1, 0, 0, 1, 1,
-0.4678405, -0.6208597, -2.292713, 1, 0, 0, 1, 1,
-0.466507, 1.026743, -1.008121, 1, 0, 0, 1, 1,
-0.4629943, -0.4855759, -3.20603, 1, 0, 0, 1, 1,
-0.4603075, 0.414344, -1.715688, 0, 0, 0, 1, 1,
-0.4552266, 0.2656727, -1.656523, 0, 0, 0, 1, 1,
-0.451998, 1.393455, 0.3010735, 0, 0, 0, 1, 1,
-0.4484564, -0.2332407, -1.509558, 0, 0, 0, 1, 1,
-0.4478896, -0.4885491, -1.967833, 0, 0, 0, 1, 1,
-0.4433315, 0.07670407, -1.10147, 0, 0, 0, 1, 1,
-0.4413515, 1.195142, 0.7971197, 0, 0, 0, 1, 1,
-0.4412388, 1.058851, 0.2444377, 1, 1, 1, 1, 1,
-0.439121, -2.689667, -1.615905, 1, 1, 1, 1, 1,
-0.4379632, -1.484936, -3.161713, 1, 1, 1, 1, 1,
-0.4376592, 1.003891, 0.2618502, 1, 1, 1, 1, 1,
-0.4369807, 0.07643791, -2.409684, 1, 1, 1, 1, 1,
-0.4351845, 0.8737402, -0.1157152, 1, 1, 1, 1, 1,
-0.4310793, -2.235449, -2.750997, 1, 1, 1, 1, 1,
-0.427925, -0.9198573, -3.52012, 1, 1, 1, 1, 1,
-0.427683, 2.999078, 0.3941008, 1, 1, 1, 1, 1,
-0.4246148, -1.351681, -2.247196, 1, 1, 1, 1, 1,
-0.4235827, 0.5369756, -0.2873594, 1, 1, 1, 1, 1,
-0.4205406, 1.16546, 0.7148542, 1, 1, 1, 1, 1,
-0.4099709, -0.466937, -4.336783, 1, 1, 1, 1, 1,
-0.4019958, 0.6131791, -1.620874, 1, 1, 1, 1, 1,
-0.4009598, -0.4772259, -1.851546, 1, 1, 1, 1, 1,
-0.3989031, 0.0137017, -1.827518, 0, 0, 1, 1, 1,
-0.398262, -1.395808, -1.743547, 1, 0, 0, 1, 1,
-0.397764, 0.8831191, 0.5816211, 1, 0, 0, 1, 1,
-0.3923242, -0.5373358, -3.025522, 1, 0, 0, 1, 1,
-0.3880035, -0.9087037, -2.892827, 1, 0, 0, 1, 1,
-0.3878763, -0.464128, -2.14965, 1, 0, 0, 1, 1,
-0.3874382, 1.037409, -2.399822, 0, 0, 0, 1, 1,
-0.383481, -0.01373162, -1.554942, 0, 0, 0, 1, 1,
-0.3834371, 0.4387709, 0.1213341, 0, 0, 0, 1, 1,
-0.3829752, 0.8942307, -1.164293, 0, 0, 0, 1, 1,
-0.3826588, -1.094653, -2.697572, 0, 0, 0, 1, 1,
-0.3819442, -1.078486, -2.976005, 0, 0, 0, 1, 1,
-0.3766712, 0.6383906, 1.483262, 0, 0, 0, 1, 1,
-0.3722827, 0.4209856, -1.485565, 1, 1, 1, 1, 1,
-0.3659148, -0.1043487, -2.303267, 1, 1, 1, 1, 1,
-0.3632401, 1.488278, 0.5419816, 1, 1, 1, 1, 1,
-0.3611505, -0.03406743, -1.339998, 1, 1, 1, 1, 1,
-0.3595492, -0.5518316, -2.820311, 1, 1, 1, 1, 1,
-0.3537183, -0.4695926, -3.928676, 1, 1, 1, 1, 1,
-0.3516757, 0.902097, 0.7855958, 1, 1, 1, 1, 1,
-0.3457048, 1.664078, 0.3199219, 1, 1, 1, 1, 1,
-0.3441022, -0.01159101, -2.215295, 1, 1, 1, 1, 1,
-0.3428766, 1.770374, 0.4862402, 1, 1, 1, 1, 1,
-0.3407484, -1.575333, -2.524999, 1, 1, 1, 1, 1,
-0.3379932, 0.954313, 1.064132, 1, 1, 1, 1, 1,
-0.3242317, 0.06345423, -1.766549, 1, 1, 1, 1, 1,
-0.3204373, -0.8668666, -3.925364, 1, 1, 1, 1, 1,
-0.3191597, 0.5421457, -0.1043997, 1, 1, 1, 1, 1,
-0.3137877, 0.6480522, -1.153787, 0, 0, 1, 1, 1,
-0.3113282, -0.3486913, -1.568325, 1, 0, 0, 1, 1,
-0.3090395, -0.9036032, -1.257895, 1, 0, 0, 1, 1,
-0.3084696, 1.684683, 1.164088, 1, 0, 0, 1, 1,
-0.3053989, 1.660065, -0.5477994, 1, 0, 0, 1, 1,
-0.3030747, 0.6740537, -0.4855561, 1, 0, 0, 1, 1,
-0.3016399, 0.2125511, 1.715388, 0, 0, 0, 1, 1,
-0.3001537, -0.4539887, -0.9267377, 0, 0, 0, 1, 1,
-0.2937316, 0.5067825, -2.673902, 0, 0, 0, 1, 1,
-0.2920285, -0.5334803, -1.696507, 0, 0, 0, 1, 1,
-0.2910153, -0.2660728, -2.66929, 0, 0, 0, 1, 1,
-0.2904128, 1.026086, 0.8020189, 0, 0, 0, 1, 1,
-0.2899821, 0.03325074, -1.748794, 0, 0, 0, 1, 1,
-0.2854157, 0.04188576, -2.474418, 1, 1, 1, 1, 1,
-0.2807415, -1.258292, -4.439106, 1, 1, 1, 1, 1,
-0.2802739, 0.002293085, -0.6616374, 1, 1, 1, 1, 1,
-0.2758498, 0.3287242, -1.602537, 1, 1, 1, 1, 1,
-0.2756045, 0.6609676, 0.2352558, 1, 1, 1, 1, 1,
-0.2740117, -0.1244241, -2.033853, 1, 1, 1, 1, 1,
-0.2695882, -0.320233, -1.900658, 1, 1, 1, 1, 1,
-0.2689427, -0.2312643, -0.6074306, 1, 1, 1, 1, 1,
-0.2682083, -0.1276294, -1.758118, 1, 1, 1, 1, 1,
-0.2680896, -1.883478, -2.447279, 1, 1, 1, 1, 1,
-0.2659615, -0.991155, -2.280158, 1, 1, 1, 1, 1,
-0.2655422, 0.588605, -0.4932545, 1, 1, 1, 1, 1,
-0.2639322, 1.046991, 0.675315, 1, 1, 1, 1, 1,
-0.2604274, 0.5539038, -0.616016, 1, 1, 1, 1, 1,
-0.2600359, -0.9777375, -1.855356, 1, 1, 1, 1, 1,
-0.257468, -0.5758621, -2.455606, 0, 0, 1, 1, 1,
-0.2566366, -1.123485, -3.103775, 1, 0, 0, 1, 1,
-0.2530482, 0.8306783, -0.6733538, 1, 0, 0, 1, 1,
-0.2524197, 1.010518, 0.4094379, 1, 0, 0, 1, 1,
-0.2505657, -1.715583, -3.123709, 1, 0, 0, 1, 1,
-0.2496392, 0.6370152, -0.5501857, 1, 0, 0, 1, 1,
-0.2487055, 0.887652, -0.07458141, 0, 0, 0, 1, 1,
-0.2466059, 0.4037929, -0.8441118, 0, 0, 0, 1, 1,
-0.242173, 0.7395328, -0.7264835, 0, 0, 0, 1, 1,
-0.2406922, -0.5398898, -3.533821, 0, 0, 0, 1, 1,
-0.2393112, -2.00411, -3.362391, 0, 0, 0, 1, 1,
-0.235706, 0.6170027, 1.332896, 0, 0, 0, 1, 1,
-0.2343893, -0.2376862, -3.296569, 0, 0, 0, 1, 1,
-0.2272325, 0.09415466, -1.175394, 1, 1, 1, 1, 1,
-0.2225691, 1.077054, 0.6005005, 1, 1, 1, 1, 1,
-0.2216938, -1.074661, -2.274995, 1, 1, 1, 1, 1,
-0.2189984, -0.9239371, -3.190755, 1, 1, 1, 1, 1,
-0.2180624, 2.095898, -0.8308902, 1, 1, 1, 1, 1,
-0.2151993, 1.148054, 0.9177886, 1, 1, 1, 1, 1,
-0.2140904, -1.112656, -2.986061, 1, 1, 1, 1, 1,
-0.212918, -0.09612184, -2.936751, 1, 1, 1, 1, 1,
-0.2080033, 1.367211, -0.0739083, 1, 1, 1, 1, 1,
-0.2017976, -0.6141573, -2.062414, 1, 1, 1, 1, 1,
-0.2004279, 0.7020602, 0.3994074, 1, 1, 1, 1, 1,
-0.1986234, -0.7684642, -3.163816, 1, 1, 1, 1, 1,
-0.1971617, -0.7965776, -2.061786, 1, 1, 1, 1, 1,
-0.1961378, 0.6268414, 1.337933, 1, 1, 1, 1, 1,
-0.196002, 1.348148, -0.20684, 1, 1, 1, 1, 1,
-0.1945834, -1.967486, -1.930342, 0, 0, 1, 1, 1,
-0.1933331, -1.284065, -3.428652, 1, 0, 0, 1, 1,
-0.1932806, -0.4913101, -2.986257, 1, 0, 0, 1, 1,
-0.1926809, 0.9198038, -0.6445409, 1, 0, 0, 1, 1,
-0.1882625, 2.749377, 0.08932023, 1, 0, 0, 1, 1,
-0.1871841, -0.3876419, -0.8685923, 1, 0, 0, 1, 1,
-0.1869882, 1.600298, -0.6690747, 0, 0, 0, 1, 1,
-0.1869207, 1.58985, -1.163307, 0, 0, 0, 1, 1,
-0.1862323, -0.7088372, -4.377347, 0, 0, 0, 1, 1,
-0.1845367, -1.507506, -2.126753, 0, 0, 0, 1, 1,
-0.1844562, -0.2744262, -1.818863, 0, 0, 0, 1, 1,
-0.1835717, 0.1886062, -0.9023759, 0, 0, 0, 1, 1,
-0.1832266, 0.8825873, -0.4183743, 0, 0, 0, 1, 1,
-0.1826689, -0.3289134, -2.903711, 1, 1, 1, 1, 1,
-0.1785758, -0.1012369, -0.8262932, 1, 1, 1, 1, 1,
-0.1761356, 1.00002, -0.04560275, 1, 1, 1, 1, 1,
-0.1743477, -0.215153, -2.01314, 1, 1, 1, 1, 1,
-0.1738085, 0.710725, 0.9884853, 1, 1, 1, 1, 1,
-0.1736748, -0.4182203, -2.00922, 1, 1, 1, 1, 1,
-0.1717167, 0.2014169, -0.6644292, 1, 1, 1, 1, 1,
-0.1712742, 2.437723, -0.08573551, 1, 1, 1, 1, 1,
-0.1710047, 1.363746, 1.118495, 1, 1, 1, 1, 1,
-0.1704742, 0.1749171, -0.4142976, 1, 1, 1, 1, 1,
-0.1704718, 0.3159613, 1.075554, 1, 1, 1, 1, 1,
-0.1695278, -1.503619, -2.772204, 1, 1, 1, 1, 1,
-0.1663424, -0.02114425, -3.1859, 1, 1, 1, 1, 1,
-0.1657635, 0.5664132, -0.8170698, 1, 1, 1, 1, 1,
-0.1601185, -0.04126735, -3.866687, 1, 1, 1, 1, 1,
-0.1601003, -0.672213, -4.403007, 0, 0, 1, 1, 1,
-0.1592516, -1.276646, -3.729798, 1, 0, 0, 1, 1,
-0.1571479, -1.309881, -3.620213, 1, 0, 0, 1, 1,
-0.1531252, 0.05743617, -1.519346, 1, 0, 0, 1, 1,
-0.1527899, -0.6205406, -2.797412, 1, 0, 0, 1, 1,
-0.1525223, -0.06848737, -2.093139, 1, 0, 0, 1, 1,
-0.1503623, 1.356768, 0.953013, 0, 0, 0, 1, 1,
-0.1456241, -0.9890024, -2.932852, 0, 0, 0, 1, 1,
-0.1415075, 0.7427379, 1.146697, 0, 0, 0, 1, 1,
-0.1413922, 0.03253423, -1.63133, 0, 0, 0, 1, 1,
-0.1405229, -0.5646744, -3.40749, 0, 0, 0, 1, 1,
-0.1400873, -0.8013571, -3.917431, 0, 0, 0, 1, 1,
-0.1392379, -1.673307, -1.642888, 0, 0, 0, 1, 1,
-0.1334156, 0.01330515, -0.7528687, 1, 1, 1, 1, 1,
-0.1314947, -0.008105347, -0.694815, 1, 1, 1, 1, 1,
-0.130427, -0.8512376, -3.24314, 1, 1, 1, 1, 1,
-0.1284434, -0.3858718, -1.790186, 1, 1, 1, 1, 1,
-0.1262062, 0.265952, 1.781164, 1, 1, 1, 1, 1,
-0.1244784, -0.1048413, -1.772757, 1, 1, 1, 1, 1,
-0.1207518, 0.4030545, 0.2514709, 1, 1, 1, 1, 1,
-0.1178994, -3.206313, -1.314693, 1, 1, 1, 1, 1,
-0.1125984, -0.05982185, -0.9878494, 1, 1, 1, 1, 1,
-0.1057857, 1.049968, -0.5968869, 1, 1, 1, 1, 1,
-0.1022877, -2.245619, -2.449374, 1, 1, 1, 1, 1,
-0.1017386, -0.07886354, -2.566268, 1, 1, 1, 1, 1,
-0.1005371, -0.392289, -1.653314, 1, 1, 1, 1, 1,
-0.100363, 0.07519775, -1.315394, 1, 1, 1, 1, 1,
-0.09621958, -1.476145, -3.712602, 1, 1, 1, 1, 1,
-0.0940892, 0.3965891, -1.517244, 0, 0, 1, 1, 1,
-0.09058499, -0.6377014, -4.373616, 1, 0, 0, 1, 1,
-0.08305702, 1.313036, -0.3533373, 1, 0, 0, 1, 1,
-0.08232639, -1.945996, -2.914983, 1, 0, 0, 1, 1,
-0.08225729, 0.4201394, -0.8683152, 1, 0, 0, 1, 1,
-0.08088221, 0.3470339, 1.097831, 1, 0, 0, 1, 1,
-0.08007203, 0.2282497, 0.07856423, 0, 0, 0, 1, 1,
-0.07888385, -0.325716, -3.59743, 0, 0, 0, 1, 1,
-0.07800177, 1.501899, 0.8502144, 0, 0, 0, 1, 1,
-0.07756723, 1.54335, -0.3525083, 0, 0, 0, 1, 1,
-0.06583539, 0.555056, 0.8838355, 0, 0, 0, 1, 1,
-0.06352121, -1.754274, -4.752052, 0, 0, 0, 1, 1,
-0.0587299, 1.033775, 0.3235836, 0, 0, 0, 1, 1,
-0.05617159, 1.415788, 1.283497, 1, 1, 1, 1, 1,
-0.0531527, 0.1875354, 0.9235464, 1, 1, 1, 1, 1,
-0.04950711, 0.3737991, -1.422874, 1, 1, 1, 1, 1,
-0.04810227, 1.195853, -1.145587, 1, 1, 1, 1, 1,
-0.03811429, 0.7355517, -2.159274, 1, 1, 1, 1, 1,
-0.03763125, 0.2636042, 0.4989832, 1, 1, 1, 1, 1,
-0.03661867, 0.1016642, -0.8156461, 1, 1, 1, 1, 1,
-0.03487771, -1.67359, -2.542182, 1, 1, 1, 1, 1,
-0.03337682, 0.01184857, -1.158707, 1, 1, 1, 1, 1,
-0.03215954, 0.8782188, -0.08335514, 1, 1, 1, 1, 1,
-0.02676498, 0.557115, -0.8702605, 1, 1, 1, 1, 1,
-0.02493821, -1.094982, -3.165783, 1, 1, 1, 1, 1,
-0.02408921, -0.2992262, -2.907031, 1, 1, 1, 1, 1,
-0.02395352, 2.22822, 1.740055, 1, 1, 1, 1, 1,
-0.01692086, -0.6512569, -1.994527, 1, 1, 1, 1, 1,
-0.01502583, 0.2001983, 2.130044, 0, 0, 1, 1, 1,
-0.01401996, 0.1075306, -1.984272, 1, 0, 0, 1, 1,
-0.009776241, 0.7913833, -2.190725, 1, 0, 0, 1, 1,
-0.008667354, -0.006563962, -2.193608, 1, 0, 0, 1, 1,
-0.003915285, -0.982491, -2.630242, 1, 0, 0, 1, 1,
0.002443623, -0.4717298, 2.227357, 1, 0, 0, 1, 1,
0.004092036, -0.497625, 2.77447, 0, 0, 0, 1, 1,
0.008498514, -0.8749854, 3.277486, 0, 0, 0, 1, 1,
0.01036364, 0.07034331, -0.8019593, 0, 0, 0, 1, 1,
0.01370498, -0.336216, 3.628805, 0, 0, 0, 1, 1,
0.01743854, 0.3548591, 0.2780875, 0, 0, 0, 1, 1,
0.01825581, -0.4805248, 2.856014, 0, 0, 0, 1, 1,
0.02365516, -0.7328229, 4.527841, 0, 0, 0, 1, 1,
0.03010419, 0.04446191, 1.083672, 1, 1, 1, 1, 1,
0.03152486, -1.084364, 2.160835, 1, 1, 1, 1, 1,
0.03558591, -0.6646119, 3.849973, 1, 1, 1, 1, 1,
0.04224364, -0.3044489, 4.54509, 1, 1, 1, 1, 1,
0.04393248, -0.3138967, 2.120207, 1, 1, 1, 1, 1,
0.04762457, 1.292284, 0.3286346, 1, 1, 1, 1, 1,
0.04773184, -0.5547686, 3.438549, 1, 1, 1, 1, 1,
0.06251261, -0.4439364, 2.730489, 1, 1, 1, 1, 1,
0.06554304, -2.276026, 4.263924, 1, 1, 1, 1, 1,
0.0665867, -0.5523639, 3.441472, 1, 1, 1, 1, 1,
0.07413571, -0.0902917, 2.225077, 1, 1, 1, 1, 1,
0.07596508, -0.2216679, 2.104554, 1, 1, 1, 1, 1,
0.08160195, -1.187506, 1.940152, 1, 1, 1, 1, 1,
0.08221445, -0.7044678, 3.62745, 1, 1, 1, 1, 1,
0.08482968, 0.2279302, 1.989081, 1, 1, 1, 1, 1,
0.08518078, -0.8156412, 3.409208, 0, 0, 1, 1, 1,
0.08618844, -0.6446714, 2.112993, 1, 0, 0, 1, 1,
0.09518438, 2.254198, -1.153488, 1, 0, 0, 1, 1,
0.09811509, -0.7091009, 4.46416, 1, 0, 0, 1, 1,
0.0994684, -1.260918, 4.71543, 1, 0, 0, 1, 1,
0.1004348, 0.0492455, 0.317737, 1, 0, 0, 1, 1,
0.1095642, 1.054265, -0.4610426, 0, 0, 0, 1, 1,
0.1153309, 0.4548712, 0.3295383, 0, 0, 0, 1, 1,
0.1158104, -0.3804536, 2.672817, 0, 0, 0, 1, 1,
0.1166967, -1.015253, 2.171765, 0, 0, 0, 1, 1,
0.1168283, -0.1350132, 2.187904, 0, 0, 0, 1, 1,
0.1174772, -1.228604, 3.376756, 0, 0, 0, 1, 1,
0.1213784, 0.9503126, 1.025581, 0, 0, 0, 1, 1,
0.1226948, -0.6816884, 4.70201, 1, 1, 1, 1, 1,
0.1229931, -0.1171292, 2.814994, 1, 1, 1, 1, 1,
0.1357815, -1.048741, 2.941879, 1, 1, 1, 1, 1,
0.1405025, 0.06149739, 1.036214, 1, 1, 1, 1, 1,
0.1444493, 1.416605, -0.008777226, 1, 1, 1, 1, 1,
0.1451588, 0.4189105, 0.7140867, 1, 1, 1, 1, 1,
0.1456061, -0.393525, 2.456462, 1, 1, 1, 1, 1,
0.1469603, -0.3000426, 4.21605, 1, 1, 1, 1, 1,
0.1508304, -0.2547319, 1.938668, 1, 1, 1, 1, 1,
0.1522876, -0.6495904, 3.309202, 1, 1, 1, 1, 1,
0.1590326, 0.721083, 0.9274594, 1, 1, 1, 1, 1,
0.160017, -0.4513308, 4.365379, 1, 1, 1, 1, 1,
0.1642305, -0.5848652, 2.150197, 1, 1, 1, 1, 1,
0.1657324, -0.6890234, 1.69637, 1, 1, 1, 1, 1,
0.1659025, 0.1723977, -0.4718468, 1, 1, 1, 1, 1,
0.1712949, 1.477173, 0.08814733, 0, 0, 1, 1, 1,
0.1719314, -1.356566, 3.168986, 1, 0, 0, 1, 1,
0.1722421, 0.0006669246, 3.124543, 1, 0, 0, 1, 1,
0.1744741, 0.5079857, 1.091144, 1, 0, 0, 1, 1,
0.1754917, 1.323009, -0.2144578, 1, 0, 0, 1, 1,
0.1756754, -1.347197, 2.513932, 1, 0, 0, 1, 1,
0.1809995, -0.2904514, 1.624835, 0, 0, 0, 1, 1,
0.1849531, -0.200132, 1.578519, 0, 0, 0, 1, 1,
0.1897603, -1.330374, 4.000663, 0, 0, 0, 1, 1,
0.1959507, 0.03575058, 2.526108, 0, 0, 0, 1, 1,
0.2078114, -0.1941776, 2.880694, 0, 0, 0, 1, 1,
0.2088491, 1.434045, 0.604058, 0, 0, 0, 1, 1,
0.2136395, -1.444629, 0.1759241, 0, 0, 0, 1, 1,
0.2184078, -0.7109008, 3.253103, 1, 1, 1, 1, 1,
0.2198297, 0.4572207, -0.4581335, 1, 1, 1, 1, 1,
0.2219518, 1.376169, 1.051743, 1, 1, 1, 1, 1,
0.222141, 0.2054822, 0.5371929, 1, 1, 1, 1, 1,
0.2232263, -1.168359, 3.373467, 1, 1, 1, 1, 1,
0.2239905, 0.01972095, 3.098577, 1, 1, 1, 1, 1,
0.2250582, 1.542714, 1.288239, 1, 1, 1, 1, 1,
0.227219, -1.094225, 5.228878, 1, 1, 1, 1, 1,
0.2279512, -0.01804564, 1.490783, 1, 1, 1, 1, 1,
0.2288032, -2.985896, 2.048016, 1, 1, 1, 1, 1,
0.2306323, 0.9383507, 0.1290352, 1, 1, 1, 1, 1,
0.2312272, 0.8428408, 1.076863, 1, 1, 1, 1, 1,
0.2356263, -0.1162729, 2.282869, 1, 1, 1, 1, 1,
0.2379724, 1.146802, -0.4673314, 1, 1, 1, 1, 1,
0.2413771, -1.258864, 3.858119, 1, 1, 1, 1, 1,
0.2475071, -1.630399, 3.268935, 0, 0, 1, 1, 1,
0.2475171, -1.568019, 0.4901415, 1, 0, 0, 1, 1,
0.2478393, 0.3715125, -0.334056, 1, 0, 0, 1, 1,
0.2516836, -1.667347, 3.242907, 1, 0, 0, 1, 1,
0.2572597, 1.828675, -0.6714998, 1, 0, 0, 1, 1,
0.2603562, 0.1054088, 0.4787146, 1, 0, 0, 1, 1,
0.2612795, -0.1821648, 3.167048, 0, 0, 0, 1, 1,
0.26187, 1.319118, 0.8953883, 0, 0, 0, 1, 1,
0.2687102, -0.2812026, 0.9806219, 0, 0, 0, 1, 1,
0.2691677, -0.01909596, -1.319025, 0, 0, 0, 1, 1,
0.2713611, 1.234491, 0.5753492, 0, 0, 0, 1, 1,
0.2721545, 0.5958114, -0.4025786, 0, 0, 0, 1, 1,
0.2725155, -0.01347669, 0.9867363, 0, 0, 0, 1, 1,
0.2874796, 0.5034401, 0.629391, 1, 1, 1, 1, 1,
0.2964027, 0.398266, -0.2361908, 1, 1, 1, 1, 1,
0.3005995, -0.8524165, 1.828881, 1, 1, 1, 1, 1,
0.3012716, 1.398489, 0.3334247, 1, 1, 1, 1, 1,
0.3057194, 0.4917147, 1.010612, 1, 1, 1, 1, 1,
0.3064323, -0.5116867, 1.409993, 1, 1, 1, 1, 1,
0.3066457, 0.5580199, 0.2208703, 1, 1, 1, 1, 1,
0.3089672, -0.7496732, 4.503059, 1, 1, 1, 1, 1,
0.3136747, 1.10654, 1.435354, 1, 1, 1, 1, 1,
0.3154829, -1.787037, 3.093984, 1, 1, 1, 1, 1,
0.3203024, 0.429945, 1.096899, 1, 1, 1, 1, 1,
0.3247077, 0.3069855, 1.635402, 1, 1, 1, 1, 1,
0.3282159, 0.8021414, -1.133887, 1, 1, 1, 1, 1,
0.3291824, -1.156306, 3.707669, 1, 1, 1, 1, 1,
0.330603, 0.0274011, -0.180388, 1, 1, 1, 1, 1,
0.3387537, -0.07445063, 1.390007, 0, 0, 1, 1, 1,
0.3387851, -0.8551678, 3.784321, 1, 0, 0, 1, 1,
0.3421526, -0.5878978, 4.22142, 1, 0, 0, 1, 1,
0.3456532, -0.1181343, -0.06929523, 1, 0, 0, 1, 1,
0.3462114, 0.7067562, 1.47805, 1, 0, 0, 1, 1,
0.3468685, -0.1407927, 0.6349393, 1, 0, 0, 1, 1,
0.3482442, -0.07490499, 1.822158, 0, 0, 0, 1, 1,
0.3514167, 0.4155183, 0.4817473, 0, 0, 0, 1, 1,
0.3564058, 0.9587001, -0.9361001, 0, 0, 0, 1, 1,
0.3565973, 1.727337, -1.284012, 0, 0, 0, 1, 1,
0.3593372, -0.79522, 2.490167, 0, 0, 0, 1, 1,
0.3622993, -0.6846718, 1.363849, 0, 0, 0, 1, 1,
0.3634056, -0.3016561, 1.211814, 0, 0, 0, 1, 1,
0.3655087, -0.9731734, 4.214039, 1, 1, 1, 1, 1,
0.3669042, 0.5524767, 0.739067, 1, 1, 1, 1, 1,
0.3677499, 0.6991517, 0.4162009, 1, 1, 1, 1, 1,
0.3707952, -0.6194791, 1.533467, 1, 1, 1, 1, 1,
0.3708184, 1.756814, 1.449156, 1, 1, 1, 1, 1,
0.3721034, -0.09836699, 1.980917, 1, 1, 1, 1, 1,
0.3725447, -0.4257286, 1.853152, 1, 1, 1, 1, 1,
0.3760422, 0.1441937, 0.2779788, 1, 1, 1, 1, 1,
0.3769904, -0.04140541, 1.51489, 1, 1, 1, 1, 1,
0.3777549, 0.7630223, -0.5214949, 1, 1, 1, 1, 1,
0.3815618, -0.08923816, 1.330643, 1, 1, 1, 1, 1,
0.3833891, 1.008986, -2.394397, 1, 1, 1, 1, 1,
0.3871378, 0.521488, 1.778491, 1, 1, 1, 1, 1,
0.388137, 0.0104875, 1.405899, 1, 1, 1, 1, 1,
0.3895101, 0.6299782, 0.2594618, 1, 1, 1, 1, 1,
0.3903934, -0.6325687, 1.827924, 0, 0, 1, 1, 1,
0.394245, -0.04902145, 1.547064, 1, 0, 0, 1, 1,
0.3958074, 0.7984658, 1.017448, 1, 0, 0, 1, 1,
0.4010406, -1.341, 2.748028, 1, 0, 0, 1, 1,
0.4022207, 0.5051778, 0.1748565, 1, 0, 0, 1, 1,
0.4035014, 0.07897407, 0.6372346, 1, 0, 0, 1, 1,
0.4072402, -0.6927283, 3.3343, 0, 0, 0, 1, 1,
0.4109859, 0.001193403, 1.158902, 0, 0, 0, 1, 1,
0.4125457, 0.4683807, 1.051799, 0, 0, 0, 1, 1,
0.4172077, -0.5137665, 2.879964, 0, 0, 0, 1, 1,
0.4172296, -0.1666209, 2.403156, 0, 0, 0, 1, 1,
0.4270593, 0.6983114, 1.365805, 0, 0, 0, 1, 1,
0.4307059, 0.7649748, 0.8181658, 0, 0, 0, 1, 1,
0.4319468, 1.313722, 0.7877749, 1, 1, 1, 1, 1,
0.436669, 0.179717, 1.418344, 1, 1, 1, 1, 1,
0.4396515, 1.139684, -0.6597388, 1, 1, 1, 1, 1,
0.4402858, 0.1126533, 2.033397, 1, 1, 1, 1, 1,
0.4420225, 0.07768596, 2.399063, 1, 1, 1, 1, 1,
0.442107, 1.457044, -0.1445547, 1, 1, 1, 1, 1,
0.4465396, -0.5640642, 3.396733, 1, 1, 1, 1, 1,
0.4467113, -0.4459794, 1.627012, 1, 1, 1, 1, 1,
0.4510353, 0.732732, 1.016952, 1, 1, 1, 1, 1,
0.4512157, -1.431113, 3.896692, 1, 1, 1, 1, 1,
0.4519005, 0.09910718, 2.013075, 1, 1, 1, 1, 1,
0.4576088, 0.4252373, 0.7679653, 1, 1, 1, 1, 1,
0.4640819, -0.682321, 3.230375, 1, 1, 1, 1, 1,
0.4687832, -0.005718915, 1.84464, 1, 1, 1, 1, 1,
0.4710034, -0.2467169, 1.606633, 1, 1, 1, 1, 1,
0.4768183, 0.6494766, 1.408122, 0, 0, 1, 1, 1,
0.4844324, 1.029349, -0.8441134, 1, 0, 0, 1, 1,
0.4868496, 0.3560729, 2.231062, 1, 0, 0, 1, 1,
0.487202, -0.1157004, 2.300748, 1, 0, 0, 1, 1,
0.4875538, 0.7975408, 0.5862052, 1, 0, 0, 1, 1,
0.4880039, -0.128616, 1.427712, 1, 0, 0, 1, 1,
0.4900843, 1.728587, -0.8244594, 0, 0, 0, 1, 1,
0.4904366, 0.6742352, 0.9451059, 0, 0, 0, 1, 1,
0.494841, 0.8133948, -0.6122193, 0, 0, 0, 1, 1,
0.4956168, -0.3481355, 2.95362, 0, 0, 0, 1, 1,
0.5060604, 0.804298, 2.302615, 0, 0, 0, 1, 1,
0.5070016, -0.01901441, 2.867845, 0, 0, 0, 1, 1,
0.5106817, 0.2339594, 2.656305, 0, 0, 0, 1, 1,
0.5114471, -0.5076647, 1.809737, 1, 1, 1, 1, 1,
0.5122997, 1.178997, 0.7577639, 1, 1, 1, 1, 1,
0.5244009, 0.1604132, 2.176624, 1, 1, 1, 1, 1,
0.5245925, -0.05884384, 2.878512, 1, 1, 1, 1, 1,
0.524986, -1.020662, 3.447317, 1, 1, 1, 1, 1,
0.532451, -0.1956295, 3.292779, 1, 1, 1, 1, 1,
0.5351764, 1.582305, 0.7841269, 1, 1, 1, 1, 1,
0.5355983, -1.848148, 4.14976, 1, 1, 1, 1, 1,
0.5370795, 1.05374, -0.2993408, 1, 1, 1, 1, 1,
0.537858, -0.257861, 1.665386, 1, 1, 1, 1, 1,
0.5399504, 2.046507, 0.2443572, 1, 1, 1, 1, 1,
0.5439728, 0.7602382, 0.2123166, 1, 1, 1, 1, 1,
0.556579, -1.121651, 4.473955, 1, 1, 1, 1, 1,
0.5608699, -0.04982555, 0.7762662, 1, 1, 1, 1, 1,
0.5653831, 1.728289, -1.828326, 1, 1, 1, 1, 1,
0.5688725, 0.9921308, -0.6462532, 0, 0, 1, 1, 1,
0.5751118, -2.698132, 1.86351, 1, 0, 0, 1, 1,
0.5764714, 0.5394931, -0.2843846, 1, 0, 0, 1, 1,
0.5808845, -0.1996442, 2.510564, 1, 0, 0, 1, 1,
0.5822515, -0.107754, 0.9968719, 1, 0, 0, 1, 1,
0.5871646, -0.7018166, 3.332965, 1, 0, 0, 1, 1,
0.5874687, 0.6788083, 1.603735, 0, 0, 0, 1, 1,
0.5882503, -0.7411428, 2.526803, 0, 0, 0, 1, 1,
0.5883245, 1.139048, 1.932329, 0, 0, 0, 1, 1,
0.5900971, -0.3750877, 1.593175, 0, 0, 0, 1, 1,
0.5915801, -0.8583611, 1.003702, 0, 0, 0, 1, 1,
0.5928121, -0.169552, 0.5482844, 0, 0, 0, 1, 1,
0.5931793, 0.4912403, 0.6489311, 0, 0, 0, 1, 1,
0.598626, 1.632854, 1.547126, 1, 1, 1, 1, 1,
0.5995942, -0.4701655, 3.357168, 1, 1, 1, 1, 1,
0.6069335, 1.597774, 1.7667, 1, 1, 1, 1, 1,
0.608413, -1.92522, 2.207935, 1, 1, 1, 1, 1,
0.6099953, -0.8839684, 3.491034, 1, 1, 1, 1, 1,
0.6122788, -0.5531908, 3.282888, 1, 1, 1, 1, 1,
0.6225586, 1.034913, -0.008736966, 1, 1, 1, 1, 1,
0.6228162, 0.5325124, 0.8275887, 1, 1, 1, 1, 1,
0.6350435, -0.1930656, 2.551271, 1, 1, 1, 1, 1,
0.6466354, -1.830043, 3.261461, 1, 1, 1, 1, 1,
0.6512058, -0.3011032, 1.839501, 1, 1, 1, 1, 1,
0.6564933, -1.260483, 1.077674, 1, 1, 1, 1, 1,
0.661761, -0.7839835, 1.81384, 1, 1, 1, 1, 1,
0.6639778, -0.3542109, 3.414173, 1, 1, 1, 1, 1,
0.6656891, 1.634764, 0.1308359, 1, 1, 1, 1, 1,
0.6724833, 1.264425, 1.315554, 0, 0, 1, 1, 1,
0.6736363, -2.211916, 2.331556, 1, 0, 0, 1, 1,
0.6798478, -0.6529284, 1.786883, 1, 0, 0, 1, 1,
0.680737, -0.4145057, 0.8328298, 1, 0, 0, 1, 1,
0.6842922, -0.3974578, 1.343551, 1, 0, 0, 1, 1,
0.6889589, 0.632629, 1.079991, 1, 0, 0, 1, 1,
0.6890717, 0.7224631, 0.857155, 0, 0, 0, 1, 1,
0.696808, 0.6556867, 2.297137, 0, 0, 0, 1, 1,
0.6971509, -0.7551134, 1.740326, 0, 0, 0, 1, 1,
0.7195551, 0.6800471, 1.074803, 0, 0, 0, 1, 1,
0.7228872, -0.1608135, 0.8069891, 0, 0, 0, 1, 1,
0.7254234, -0.8823283, 2.875306, 0, 0, 0, 1, 1,
0.7316033, 1.7375, 1.42034, 0, 0, 0, 1, 1,
0.7345513, -0.8094767, 2.753001, 1, 1, 1, 1, 1,
0.7408794, -1.016257, 2.370001, 1, 1, 1, 1, 1,
0.7469105, 1.135653, 0.5786932, 1, 1, 1, 1, 1,
0.7493404, -1.132586, 1.75745, 1, 1, 1, 1, 1,
0.7557046, 0.3903632, 0.8462265, 1, 1, 1, 1, 1,
0.7571232, 1.243268, 1.131282, 1, 1, 1, 1, 1,
0.7637556, -0.09030905, 2.822113, 1, 1, 1, 1, 1,
0.7675192, -0.9487512, 3.0341, 1, 1, 1, 1, 1,
0.7693076, -0.1015715, 2.548345, 1, 1, 1, 1, 1,
0.7694594, -1.171685, 0.2520481, 1, 1, 1, 1, 1,
0.769722, 1.353684, 0.06871092, 1, 1, 1, 1, 1,
0.7798355, 0.4978079, -0.3147153, 1, 1, 1, 1, 1,
0.7859249, 0.9318714, 0.5940349, 1, 1, 1, 1, 1,
0.7869015, -0.6196384, 1.908787, 1, 1, 1, 1, 1,
0.7979213, -0.8611484, 2.049746, 1, 1, 1, 1, 1,
0.800192, 0.4860254, 0.9397888, 0, 0, 1, 1, 1,
0.8005443, 1.625429, -1.336458, 1, 0, 0, 1, 1,
0.8019652, 2.111798, 0.2389107, 1, 0, 0, 1, 1,
0.8037019, 0.737294, 1.415442, 1, 0, 0, 1, 1,
0.8042464, -0.1906504, 0.7526639, 1, 0, 0, 1, 1,
0.8061482, 0.2393099, 1.929089, 1, 0, 0, 1, 1,
0.8107571, 1.009164, 0.159852, 0, 0, 0, 1, 1,
0.8156101, 1.149062, 1.19254, 0, 0, 0, 1, 1,
0.8160012, -3.761431, 2.343965, 0, 0, 0, 1, 1,
0.816283, -0.269678, 1.076196, 0, 0, 0, 1, 1,
0.8185282, 1.093481, 0.8371348, 0, 0, 0, 1, 1,
0.8284562, -1.489728, 4.280614, 0, 0, 0, 1, 1,
0.8333341, -0.5676129, 1.738229, 0, 0, 0, 1, 1,
0.83877, 0.4562132, 2.183406, 1, 1, 1, 1, 1,
0.8432254, -0.766689, 1.763277, 1, 1, 1, 1, 1,
0.8451791, 1.417715, 0.4030483, 1, 1, 1, 1, 1,
0.8453937, 0.2462296, 0.76616, 1, 1, 1, 1, 1,
0.8455389, 0.5607206, -0.3618407, 1, 1, 1, 1, 1,
0.84635, 0.9259891, 3.068142, 1, 1, 1, 1, 1,
0.8503563, -1.04644, 2.511295, 1, 1, 1, 1, 1,
0.8508489, -1.144055, 3.32287, 1, 1, 1, 1, 1,
0.8571597, -1.908046, 1.922071, 1, 1, 1, 1, 1,
0.8609918, 1.121087, 1.972232, 1, 1, 1, 1, 1,
0.8611842, -2.270977, 2.734073, 1, 1, 1, 1, 1,
0.8633229, -0.9075088, 3.076512, 1, 1, 1, 1, 1,
0.8720025, 1.111105, 2.521829, 1, 1, 1, 1, 1,
0.8751743, 0.1595785, 0.7619024, 1, 1, 1, 1, 1,
0.8795954, -0.8672899, 2.442906, 1, 1, 1, 1, 1,
0.880376, 0.864659, 1.481473, 0, 0, 1, 1, 1,
0.8882619, 1.794046, 1.043522, 1, 0, 0, 1, 1,
0.8906226, 1.26436, 0.6024472, 1, 0, 0, 1, 1,
0.8935654, 1.028737, 0.119789, 1, 0, 0, 1, 1,
0.8987722, 1.441603, 1.346484, 1, 0, 0, 1, 1,
0.8990247, 0.4069478, 2.624317, 1, 0, 0, 1, 1,
0.9016429, -2.191142, 4.164964, 0, 0, 0, 1, 1,
0.9063959, 0.182402, 3.909352, 0, 0, 0, 1, 1,
0.9075833, -0.553242, 2.882139, 0, 0, 0, 1, 1,
0.9125374, -1.409191, 3.268766, 0, 0, 0, 1, 1,
0.9152167, -1.242446, 3.554389, 0, 0, 0, 1, 1,
0.9163226, -0.3651062, 2.74523, 0, 0, 0, 1, 1,
0.9196217, -0.2780881, 0.9216323, 0, 0, 0, 1, 1,
0.9223332, 1.329756, 1.386291, 1, 1, 1, 1, 1,
0.9277965, -0.3089012, 2.37882, 1, 1, 1, 1, 1,
0.9282922, -0.03548805, 1.754595, 1, 1, 1, 1, 1,
0.9306091, 1.311189, 1.770635, 1, 1, 1, 1, 1,
0.9388748, -0.5543658, 3.013146, 1, 1, 1, 1, 1,
0.9498994, 1.997852, -0.07983251, 1, 1, 1, 1, 1,
0.9502739, 1.077842, 0.6127079, 1, 1, 1, 1, 1,
0.9584342, -2.056182, 2.920199, 1, 1, 1, 1, 1,
0.9590591, 0.7975253, 1.679426, 1, 1, 1, 1, 1,
0.9617355, 0.812384, 2.30013, 1, 1, 1, 1, 1,
0.9645674, -0.8888271, 1.780814, 1, 1, 1, 1, 1,
0.9706375, 1.590443, 0.1579913, 1, 1, 1, 1, 1,
0.9725358, 0.06174535, 1.905508, 1, 1, 1, 1, 1,
0.9743858, 1.173182, 1.437843, 1, 1, 1, 1, 1,
0.9780239, -0.1405035, 1.955408, 1, 1, 1, 1, 1,
0.9805343, -1.287377, 1.740453, 0, 0, 1, 1, 1,
0.9806407, -1.721028, 3.6477, 1, 0, 0, 1, 1,
0.9838073, -0.7564921, 1.320751, 1, 0, 0, 1, 1,
0.9877989, -0.2656828, 1.140129, 1, 0, 0, 1, 1,
0.9928313, 1.228778, 0.4664532, 1, 0, 0, 1, 1,
0.993124, 0.1812775, -0.02136156, 1, 0, 0, 1, 1,
0.99352, 0.05469277, 1.31314, 0, 0, 0, 1, 1,
0.9935458, -0.5904486, 3.840806, 0, 0, 0, 1, 1,
0.9957746, 0.4942744, 0.4985572, 0, 0, 0, 1, 1,
0.9983586, 1.51018, -1.143677, 0, 0, 0, 1, 1,
1.002802, -0.2141717, 2.50876, 0, 0, 0, 1, 1,
1.007887, 1.150244, -0.287798, 0, 0, 0, 1, 1,
1.009351, 1.415593, 2.941819, 0, 0, 0, 1, 1,
1.012663, 0.9416085, 0.7635007, 1, 1, 1, 1, 1,
1.013881, 0.03869274, 1.153252, 1, 1, 1, 1, 1,
1.015852, -1.197224, 3.321122, 1, 1, 1, 1, 1,
1.018423, -0.807422, 1.007286, 1, 1, 1, 1, 1,
1.027126, 0.4914523, 0.2737687, 1, 1, 1, 1, 1,
1.032817, 0.2039978, 1.31868, 1, 1, 1, 1, 1,
1.034713, -0.6348789, 1.028269, 1, 1, 1, 1, 1,
1.035899, 0.4487416, 1.021057, 1, 1, 1, 1, 1,
1.040243, 0.6949666, 1.573669, 1, 1, 1, 1, 1,
1.048464, -0.4652444, 3.833624, 1, 1, 1, 1, 1,
1.058104, 1.819879, -0.4756997, 1, 1, 1, 1, 1,
1.063149, -0.5835009, 2.891485, 1, 1, 1, 1, 1,
1.065923, -1.419244, 1.273058, 1, 1, 1, 1, 1,
1.078238, 0.7090999, 1.951998, 1, 1, 1, 1, 1,
1.089393, -0.458918, 3.04041, 1, 1, 1, 1, 1,
1.09216, 0.4606003, 2.888196, 0, 0, 1, 1, 1,
1.095094, 2.235528, 2.343333, 1, 0, 0, 1, 1,
1.096285, 1.788431, 0.279754, 1, 0, 0, 1, 1,
1.10003, -0.408061, 2.240184, 1, 0, 0, 1, 1,
1.105809, -0.086215, 1.073685, 1, 0, 0, 1, 1,
1.107241, 1.199881, 0.7722934, 1, 0, 0, 1, 1,
1.107731, -1.371691, 2.237165, 0, 0, 0, 1, 1,
1.109525, 0.9323561, 0.381363, 0, 0, 0, 1, 1,
1.110256, 0.6496183, 0.2684956, 0, 0, 0, 1, 1,
1.114891, -0.07333877, 1.70892, 0, 0, 0, 1, 1,
1.118782, 1.199145, 0.01901149, 0, 0, 0, 1, 1,
1.119122, -0.9160519, 2.778083, 0, 0, 0, 1, 1,
1.122707, -0.3380104, 3.070904, 0, 0, 0, 1, 1,
1.124543, -1.090293, 1.524922, 1, 1, 1, 1, 1,
1.142911, 0.5527239, 0.9813852, 1, 1, 1, 1, 1,
1.144545, 2.201884, 1.57739, 1, 1, 1, 1, 1,
1.147146, 3.167146, 0.776637, 1, 1, 1, 1, 1,
1.150221, -0.8512992, 2.143319, 1, 1, 1, 1, 1,
1.161573, -0.6393658, 4.535632, 1, 1, 1, 1, 1,
1.197095, 0.05614043, 0.232774, 1, 1, 1, 1, 1,
1.199189, 0.09096966, -0.5338235, 1, 1, 1, 1, 1,
1.202003, 1.580109, 0.1372984, 1, 1, 1, 1, 1,
1.209029, -0.7061206, 1.531498, 1, 1, 1, 1, 1,
1.21269, 1.533637, 1.173847, 1, 1, 1, 1, 1,
1.221862, -0.9664121, 0.9016505, 1, 1, 1, 1, 1,
1.235195, -1.163643, 2.04277, 1, 1, 1, 1, 1,
1.239992, 0.6234511, 1.301239, 1, 1, 1, 1, 1,
1.241076, -0.9875407, 1.571738, 1, 1, 1, 1, 1,
1.247443, 0.7530247, 0.3737955, 0, 0, 1, 1, 1,
1.25034, -0.01140984, 1.029843, 1, 0, 0, 1, 1,
1.257249, -0.2563963, 1.588479, 1, 0, 0, 1, 1,
1.25921, 0.8812995, 0.03162388, 1, 0, 0, 1, 1,
1.262365, -0.4720138, 0.8343694, 1, 0, 0, 1, 1,
1.276735, -0.5883034, 0.1577018, 1, 0, 0, 1, 1,
1.29112, 0.2412369, 2.474693, 0, 0, 0, 1, 1,
1.295967, -0.1742125, 3.078388, 0, 0, 0, 1, 1,
1.321193, 1.012743, 1.892374, 0, 0, 0, 1, 1,
1.325743, 0.6616512, -0.453714, 0, 0, 0, 1, 1,
1.3536, 0.1524127, 2.008166, 0, 0, 0, 1, 1,
1.359074, -0.8320153, 2.675225, 0, 0, 0, 1, 1,
1.367553, 0.3763587, 2.98882, 0, 0, 0, 1, 1,
1.368173, 0.1426081, 2.083549, 1, 1, 1, 1, 1,
1.379465, 1.263237, 1.300902, 1, 1, 1, 1, 1,
1.382633, -1.477232, 2.909119, 1, 1, 1, 1, 1,
1.384615, -0.6177322, 2.651263, 1, 1, 1, 1, 1,
1.385836, -0.5072935, 1.668585, 1, 1, 1, 1, 1,
1.387391, 0.3587398, 3.127297, 1, 1, 1, 1, 1,
1.388361, -0.161127, 2.139098, 1, 1, 1, 1, 1,
1.400079, 0.1241077, 1.894678, 1, 1, 1, 1, 1,
1.413734, 0.1816048, 1.145879, 1, 1, 1, 1, 1,
1.418454, -0.6933532, 1.573134, 1, 1, 1, 1, 1,
1.425431, -1.755318, 0.1513052, 1, 1, 1, 1, 1,
1.432583, -0.02155623, 0.9821829, 1, 1, 1, 1, 1,
1.434457, 0.2352208, 2.243904, 1, 1, 1, 1, 1,
1.443154, -0.5567714, 0.1753079, 1, 1, 1, 1, 1,
1.445116, 0.8718445, 0.2563545, 1, 1, 1, 1, 1,
1.457657, 0.6010374, 1.729912, 0, 0, 1, 1, 1,
1.458416, -0.7772765, -0.1984262, 1, 0, 0, 1, 1,
1.467351, -0.7061069, 0.05774969, 1, 0, 0, 1, 1,
1.470074, 0.07657187, 1.511666, 1, 0, 0, 1, 1,
1.473703, 0.880602, -0.9979639, 1, 0, 0, 1, 1,
1.474409, -0.124275, 1.493096, 1, 0, 0, 1, 1,
1.486694, 0.3093646, -0.25119, 0, 0, 0, 1, 1,
1.504886, -0.2058327, 1.221185, 0, 0, 0, 1, 1,
1.508228, 0.02531474, 2.741319, 0, 0, 0, 1, 1,
1.509552, 0.6957489, 1.269265, 0, 0, 0, 1, 1,
1.533345, 0.3433924, 2.380301, 0, 0, 0, 1, 1,
1.534425, -0.4525647, 0.6297172, 0, 0, 0, 1, 1,
1.540782, -1.645372, 3.599341, 0, 0, 0, 1, 1,
1.547781, 1.781974, 1.00175, 1, 1, 1, 1, 1,
1.549734, 0.6574219, 2.526451, 1, 1, 1, 1, 1,
1.559544, 0.3368958, -0.8192058, 1, 1, 1, 1, 1,
1.573437, -2.09264, 3.010349, 1, 1, 1, 1, 1,
1.57885, -1.566925, 2.273717, 1, 1, 1, 1, 1,
1.584433, -0.5210303, 2.21348, 1, 1, 1, 1, 1,
1.592772, 0.9156318, 2.470403, 1, 1, 1, 1, 1,
1.59857, 0.4065544, 1.075674, 1, 1, 1, 1, 1,
1.606714, 0.7192348, 2.422662, 1, 1, 1, 1, 1,
1.608504, -0.9115412, 1.025114, 1, 1, 1, 1, 1,
1.622518, 0.07431043, 1.132189, 1, 1, 1, 1, 1,
1.62765, 1.556983, -0.4209919, 1, 1, 1, 1, 1,
1.62982, -1.289785, 3.380343, 1, 1, 1, 1, 1,
1.63564, 0.03889133, 0.3096133, 1, 1, 1, 1, 1,
1.644753, 1.090734, -0.1143192, 1, 1, 1, 1, 1,
1.654181, 1.267529, 2.178763, 0, 0, 1, 1, 1,
1.684356, -0.2914689, 0.07582473, 1, 0, 0, 1, 1,
1.684455, -1.279469, 1.799879, 1, 0, 0, 1, 1,
1.704312, -0.8770149, 1.69081, 1, 0, 0, 1, 1,
1.717683, 1.482253, -0.2273913, 1, 0, 0, 1, 1,
1.721229, -0.16738, 2.680891, 1, 0, 0, 1, 1,
1.726356, -1.637812, 2.164082, 0, 0, 0, 1, 1,
1.727345, -0.8138494, 1.071734, 0, 0, 0, 1, 1,
1.756777, -0.1566325, 2.270891, 0, 0, 0, 1, 1,
1.770576, -0.1399123, 2.081578, 0, 0, 0, 1, 1,
1.7818, 0.0856609, 0.2458539, 0, 0, 0, 1, 1,
1.829758, 1.056423, 0.609294, 0, 0, 0, 1, 1,
1.867414, 1.286608, 0.4880406, 0, 0, 0, 1, 1,
1.867583, 0.6130145, 1.191691, 1, 1, 1, 1, 1,
1.870484, 0.3061213, 0.933578, 1, 1, 1, 1, 1,
1.894911, -2.003105, 1.828341, 1, 1, 1, 1, 1,
1.902824, -0.2689447, 0.02455933, 1, 1, 1, 1, 1,
1.905344, 2.528222, 1.47515, 1, 1, 1, 1, 1,
1.910067, -0.1886697, 2.046929, 1, 1, 1, 1, 1,
1.911411, 0.8877745, 1.755354, 1, 1, 1, 1, 1,
1.921963, -1.058174, 0.8885197, 1, 1, 1, 1, 1,
1.948838, 1.63175, -0.09065681, 1, 1, 1, 1, 1,
1.953376, -0.6145158, 3.059833, 1, 1, 1, 1, 1,
1.964417, 1.236268, 1.144158, 1, 1, 1, 1, 1,
1.972182, -0.6866462, 1.469687, 1, 1, 1, 1, 1,
1.9754, -1.642425, 1.825849, 1, 1, 1, 1, 1,
1.980122, 0.1979066, 2.971624, 1, 1, 1, 1, 1,
1.990734, -0.4061745, 1.523252, 1, 1, 1, 1, 1,
2.022214, -1.218982, 1.121436, 0, 0, 1, 1, 1,
2.037582, -0.5368039, 1.706641, 1, 0, 0, 1, 1,
2.037853, 1.742647, 2.007758, 1, 0, 0, 1, 1,
2.087048, -0.4869889, 1.588894, 1, 0, 0, 1, 1,
2.159825, -1.31823, 2.035837, 1, 0, 0, 1, 1,
2.166745, -0.0487546, 3.433145, 1, 0, 0, 1, 1,
2.184684, -0.7005017, 2.352671, 0, 0, 0, 1, 1,
2.206529, -0.5988007, 0.2847271, 0, 0, 0, 1, 1,
2.229217, -0.3896927, 1.90996, 0, 0, 0, 1, 1,
2.239762, 0.252773, 2.559858, 0, 0, 0, 1, 1,
2.279112, -1.217123, 2.376622, 0, 0, 0, 1, 1,
2.290731, 0.5898716, 1.559086, 0, 0, 0, 1, 1,
2.299395, 0.05589265, 0.441079, 0, 0, 0, 1, 1,
2.320405, -0.9307099, 1.14587, 1, 1, 1, 1, 1,
2.334706, 1.1507, 1.254791, 1, 1, 1, 1, 1,
2.338554, -0.8332893, -0.2279103, 1, 1, 1, 1, 1,
2.374143, -0.2148034, 0.9916667, 1, 1, 1, 1, 1,
2.48745, 2.292935, 0.9739492, 1, 1, 1, 1, 1,
2.738998, -0.9502731, 3.342196, 1, 1, 1, 1, 1,
3.223522, -1.416382, -0.0807455, 1, 1, 1, 1, 1
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
var radius = 9.456148;
var distance = 33.21432;
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
mvMatrix.translate( 0.02676201, 0.297142, -0.2368014 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.21432);
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
