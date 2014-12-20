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
-3.119081, 0.5557052, -1.929598, 1, 0, 0, 1,
-2.933446, 1.739137, -2.350621, 1, 0.007843138, 0, 1,
-2.92848, -0.1726137, -1.296436, 1, 0.01176471, 0, 1,
-2.646803, -1.567195, -1.622434, 1, 0.01960784, 0, 1,
-2.516814, -1.446093, -2.953511, 1, 0.02352941, 0, 1,
-2.501338, -1.932036, -2.094603, 1, 0.03137255, 0, 1,
-2.477773, 1.294209, -0.5507783, 1, 0.03529412, 0, 1,
-2.421988, 1.227525, -2.39904, 1, 0.04313726, 0, 1,
-2.376959, -1.456004, -1.170208, 1, 0.04705882, 0, 1,
-2.332573, -1.089754, -0.3219402, 1, 0.05490196, 0, 1,
-2.302579, -2.849907, -2.748073, 1, 0.05882353, 0, 1,
-2.287816, -1.175164, -2.231158, 1, 0.06666667, 0, 1,
-2.280972, 1.247936, -1.622533, 1, 0.07058824, 0, 1,
-2.280396, 0.3989596, -2.909642, 1, 0.07843138, 0, 1,
-2.249427, -1.500072, -2.968923, 1, 0.08235294, 0, 1,
-2.200074, 1.055187, -2.318981, 1, 0.09019608, 0, 1,
-2.188079, 1.946976, -1.002217, 1, 0.09411765, 0, 1,
-2.187816, -1.677122, -3.770661, 1, 0.1019608, 0, 1,
-2.159461, -1.115796, -3.169965, 1, 0.1098039, 0, 1,
-2.136709, 0.3475581, -2.542758, 1, 0.1137255, 0, 1,
-2.104445, -0.8689448, -4.267392, 1, 0.1215686, 0, 1,
-2.040061, -2.577082, -1.324719, 1, 0.1254902, 0, 1,
-2.036139, 0.6335703, -0.9755041, 1, 0.1333333, 0, 1,
-2.02596, 0.3318137, -1.77609, 1, 0.1372549, 0, 1,
-2.02499, -0.121826, -1.575563, 1, 0.145098, 0, 1,
-2.014117, -0.5575427, -3.598331, 1, 0.1490196, 0, 1,
-2.00561, 0.9100367, -3.033052, 1, 0.1568628, 0, 1,
-1.970765, 1.304304, -0.6689494, 1, 0.1607843, 0, 1,
-1.955266, -0.6679311, -1.195729, 1, 0.1686275, 0, 1,
-1.934974, 0.3947073, -1.682203, 1, 0.172549, 0, 1,
-1.93097, 0.4176276, 0.6294835, 1, 0.1803922, 0, 1,
-1.929972, 1.160944, -1.558927, 1, 0.1843137, 0, 1,
-1.923809, 1.73915, -0.3736135, 1, 0.1921569, 0, 1,
-1.920773, -0.03322833, -0.1498476, 1, 0.1960784, 0, 1,
-1.916792, -0.5694999, -1.834578, 1, 0.2039216, 0, 1,
-1.914522, 1.459154, 0.2372489, 1, 0.2117647, 0, 1,
-1.912128, 0.1822577, -0.6144733, 1, 0.2156863, 0, 1,
-1.90406, -0.4706185, -0.1655875, 1, 0.2235294, 0, 1,
-1.891921, 0.3683097, -1.349638, 1, 0.227451, 0, 1,
-1.875135, 0.2099786, -2.260314, 1, 0.2352941, 0, 1,
-1.863064, 1.026041, -0.9334764, 1, 0.2392157, 0, 1,
-1.861751, 0.09469259, 0.2312263, 1, 0.2470588, 0, 1,
-1.854629, -0.6117427, -2.726182, 1, 0.2509804, 0, 1,
-1.839891, -1.073351, -0.9674087, 1, 0.2588235, 0, 1,
-1.8291, -0.8895991, -1.637478, 1, 0.2627451, 0, 1,
-1.828785, 1.237945, 0.1063928, 1, 0.2705882, 0, 1,
-1.820051, -0.543405, -1.310488, 1, 0.2745098, 0, 1,
-1.814535, 0.5169646, -2.484263, 1, 0.282353, 0, 1,
-1.809412, 0.3250202, -1.954223, 1, 0.2862745, 0, 1,
-1.79305, 0.7477996, -1.964113, 1, 0.2941177, 0, 1,
-1.792228, -1.502814, -2.861053, 1, 0.3019608, 0, 1,
-1.770171, 0.6392037, -0.2291566, 1, 0.3058824, 0, 1,
-1.749323, 1.247648, -1.640322, 1, 0.3137255, 0, 1,
-1.733123, -0.5704139, -1.324038, 1, 0.3176471, 0, 1,
-1.731038, -1.917507, -3.990909, 1, 0.3254902, 0, 1,
-1.713097, -1.053075, -2.706507, 1, 0.3294118, 0, 1,
-1.712851, -1.297792, -3.100131, 1, 0.3372549, 0, 1,
-1.668642, -0.3163203, 0.109775, 1, 0.3411765, 0, 1,
-1.663862, 0.139027, -1.447592, 1, 0.3490196, 0, 1,
-1.655121, -1.388729, -3.081334, 1, 0.3529412, 0, 1,
-1.653482, -0.4869415, -0.9024318, 1, 0.3607843, 0, 1,
-1.648484, 0.9044459, -1.387435, 1, 0.3647059, 0, 1,
-1.647821, -0.8164321, -0.05870548, 1, 0.372549, 0, 1,
-1.64624, 0.4448728, 0.7236129, 1, 0.3764706, 0, 1,
-1.62422, 0.7670412, -1.069564, 1, 0.3843137, 0, 1,
-1.616866, 0.3615036, -3.246022, 1, 0.3882353, 0, 1,
-1.613475, 2.488086, -1.67444, 1, 0.3960784, 0, 1,
-1.613438, -0.08505529, -2.517589, 1, 0.4039216, 0, 1,
-1.602062, 1.365663, -0.7799302, 1, 0.4078431, 0, 1,
-1.597155, -0.5252, -1.405707, 1, 0.4156863, 0, 1,
-1.594933, 1.033406, -0.7685377, 1, 0.4196078, 0, 1,
-1.587972, 0.423846, -2.80957, 1, 0.427451, 0, 1,
-1.574289, -0.9285178, -4.601923, 1, 0.4313726, 0, 1,
-1.574117, -0.1231764, -1.619257, 1, 0.4392157, 0, 1,
-1.562603, -2.187808, -2.038154, 1, 0.4431373, 0, 1,
-1.557354, 1.108204, -0.5268686, 1, 0.4509804, 0, 1,
-1.54627, -0.4975894, -0.9522243, 1, 0.454902, 0, 1,
-1.544701, -1.138106, -1.421786, 1, 0.4627451, 0, 1,
-1.526001, -0.5394765, -2.269175, 1, 0.4666667, 0, 1,
-1.521091, -1.267911, -2.527074, 1, 0.4745098, 0, 1,
-1.516102, 1.057777, -2.320212, 1, 0.4784314, 0, 1,
-1.512214, -0.1682794, -0.7998718, 1, 0.4862745, 0, 1,
-1.509617, 0.9153666, -2.410298, 1, 0.4901961, 0, 1,
-1.509017, -0.5840697, -4.560336, 1, 0.4980392, 0, 1,
-1.504308, 0.1917462, -0.8914162, 1, 0.5058824, 0, 1,
-1.503876, 0.7388546, 0.9844277, 1, 0.509804, 0, 1,
-1.502156, -0.2336525, -1.24897, 1, 0.5176471, 0, 1,
-1.483995, 0.467126, -0.9887247, 1, 0.5215687, 0, 1,
-1.437353, -0.08583852, -1.407017, 1, 0.5294118, 0, 1,
-1.432416, 2.564326, -1.332151, 1, 0.5333334, 0, 1,
-1.423782, -0.3466805, -5.13448, 1, 0.5411765, 0, 1,
-1.414389, 1.626308, -1.576928, 1, 0.5450981, 0, 1,
-1.40668, 0.3393947, -0.8620936, 1, 0.5529412, 0, 1,
-1.405341, 0.3419944, -2.158043, 1, 0.5568628, 0, 1,
-1.387383, -1.348447, -1.876952, 1, 0.5647059, 0, 1,
-1.384395, 1.794571, -0.9218849, 1, 0.5686275, 0, 1,
-1.384121, -0.6841879, -2.35458, 1, 0.5764706, 0, 1,
-1.381573, 0.4590529, -2.181349, 1, 0.5803922, 0, 1,
-1.376063, -1.259772, -2.488686, 1, 0.5882353, 0, 1,
-1.369352, -0.6391326, -3.136487, 1, 0.5921569, 0, 1,
-1.364706, 1.463314, -0.5878721, 1, 0.6, 0, 1,
-1.359405, 0.6430683, -1.679652, 1, 0.6078432, 0, 1,
-1.354449, 0.04828967, -1.808651, 1, 0.6117647, 0, 1,
-1.349417, -0.1674718, -1.438001, 1, 0.6196079, 0, 1,
-1.334718, -0.9081493, -2.178591, 1, 0.6235294, 0, 1,
-1.3319, -1.401065, -1.843307, 1, 0.6313726, 0, 1,
-1.326285, -1.420204, -2.38166, 1, 0.6352941, 0, 1,
-1.324282, -1.163412, -3.46453, 1, 0.6431373, 0, 1,
-1.324129, -0.2334139, -2.162151, 1, 0.6470588, 0, 1,
-1.315077, 2.023476, -0.5307083, 1, 0.654902, 0, 1,
-1.312463, 0.2396823, -1.989629, 1, 0.6588235, 0, 1,
-1.307997, -0.4708329, -2.410342, 1, 0.6666667, 0, 1,
-1.298046, 0.03597108, -1.458699, 1, 0.6705883, 0, 1,
-1.293894, 0.985417, -1.921315, 1, 0.6784314, 0, 1,
-1.293262, 0.2560557, -4.419109, 1, 0.682353, 0, 1,
-1.281127, -0.04378159, -1.552048, 1, 0.6901961, 0, 1,
-1.272452, 0.3899695, -1.82413, 1, 0.6941177, 0, 1,
-1.26555, 1.007686, -1.715348, 1, 0.7019608, 0, 1,
-1.261834, -1.056412, -1.654294, 1, 0.7098039, 0, 1,
-1.25991, 1.515539, -0.8930073, 1, 0.7137255, 0, 1,
-1.259745, -0.02140344, -3.031515, 1, 0.7215686, 0, 1,
-1.248935, -0.9029132, -3.031452, 1, 0.7254902, 0, 1,
-1.247291, 0.1248459, -0.9141736, 1, 0.7333333, 0, 1,
-1.240113, -0.2196507, -2.944519, 1, 0.7372549, 0, 1,
-1.236999, 0.5887577, 0.6883267, 1, 0.7450981, 0, 1,
-1.236233, 0.5635118, -2.631777, 1, 0.7490196, 0, 1,
-1.233527, -1.294684, -3.439149, 1, 0.7568628, 0, 1,
-1.227001, -0.2897894, -2.907111, 1, 0.7607843, 0, 1,
-1.205959, 1.522053, -1.175536, 1, 0.7686275, 0, 1,
-1.194726, -0.1398224, -1.646134, 1, 0.772549, 0, 1,
-1.187313, -0.7886676, -1.125588, 1, 0.7803922, 0, 1,
-1.183297, 0.1023574, -0.6161636, 1, 0.7843137, 0, 1,
-1.173612, -0.8462798, -1.396208, 1, 0.7921569, 0, 1,
-1.163779, -0.2469635, 0.9823232, 1, 0.7960784, 0, 1,
-1.157938, 0.3139108, -1.730811, 1, 0.8039216, 0, 1,
-1.139876, -0.9059553, -2.443264, 1, 0.8117647, 0, 1,
-1.134224, 1.073349, -0.09902301, 1, 0.8156863, 0, 1,
-1.125926, 0.4163189, -1.067696, 1, 0.8235294, 0, 1,
-1.125873, -0.07845514, -3.041092, 1, 0.827451, 0, 1,
-1.120975, 0.3339895, -1.441429, 1, 0.8352941, 0, 1,
-1.116799, -0.6642682, -2.72537, 1, 0.8392157, 0, 1,
-1.112864, 1.393568, -1.544944, 1, 0.8470588, 0, 1,
-1.111529, -0.188484, -1.570526, 1, 0.8509804, 0, 1,
-1.109188, 0.06741226, -0.8825441, 1, 0.8588235, 0, 1,
-1.104469, 0.8213191, 0.1651079, 1, 0.8627451, 0, 1,
-1.094482, -0.971018, -2.226055, 1, 0.8705882, 0, 1,
-1.087834, -1.414099, -3.161555, 1, 0.8745098, 0, 1,
-1.085974, 0.009184732, -1.798139, 1, 0.8823529, 0, 1,
-1.072601, -0.5780864, -2.296773, 1, 0.8862745, 0, 1,
-1.070788, -0.2385069, -1.274724, 1, 0.8941177, 0, 1,
-1.055925, 0.1785907, -0.6297134, 1, 0.8980392, 0, 1,
-1.054529, -0.1639662, -0.6291557, 1, 0.9058824, 0, 1,
-1.045901, 2.248818, 0.3373245, 1, 0.9137255, 0, 1,
-1.044811, -1.836394, -5.058863, 1, 0.9176471, 0, 1,
-1.035912, -0.5194803, -0.8665534, 1, 0.9254902, 0, 1,
-1.030503, 2.014591, 0.3070597, 1, 0.9294118, 0, 1,
-1.025946, -1.267979, -1.601676, 1, 0.9372549, 0, 1,
-1.024538, 1.684261, -0.02755961, 1, 0.9411765, 0, 1,
-1.018172, -2.081795, -3.158463, 1, 0.9490196, 0, 1,
-1.007063, -0.9893337, -1.758753, 1, 0.9529412, 0, 1,
-1.006812, -1.543909, -3.772459, 1, 0.9607843, 0, 1,
-1.002331, 0.9519476, -0.1741066, 1, 0.9647059, 0, 1,
-1.001651, 1.314747, -1.043949, 1, 0.972549, 0, 1,
-1.000337, -0.5474357, -1.212964, 1, 0.9764706, 0, 1,
-0.9970052, -0.6342773, -2.703202, 1, 0.9843137, 0, 1,
-0.9937459, 1.265562, 0.5898321, 1, 0.9882353, 0, 1,
-0.9925657, -0.4113413, -0.9895823, 1, 0.9960784, 0, 1,
-0.9823396, -0.9555683, -1.928369, 0.9960784, 1, 0, 1,
-0.9785983, 1.148215, -2.377535, 0.9921569, 1, 0, 1,
-0.9749694, 2.134063, -0.6710726, 0.9843137, 1, 0, 1,
-0.9707023, -1.450439, -4.053479, 0.9803922, 1, 0, 1,
-0.9653793, -1.456548, -1.52637, 0.972549, 1, 0, 1,
-0.9647005, -2.051931, -5.012923, 0.9686275, 1, 0, 1,
-0.9515263, 0.8210371, -0.1375434, 0.9607843, 1, 0, 1,
-0.9504849, 0.5977242, -1.06907, 0.9568627, 1, 0, 1,
-0.949261, -0.07394328, -1.846063, 0.9490196, 1, 0, 1,
-0.9465308, 1.05118, -1.472691, 0.945098, 1, 0, 1,
-0.9456717, -0.3045941, -1.256067, 0.9372549, 1, 0, 1,
-0.9450573, -2.613425, -2.667098, 0.9333333, 1, 0, 1,
-0.9429811, 1.041793, 1.387403, 0.9254902, 1, 0, 1,
-0.9419628, -0.2702319, -2.107281, 0.9215686, 1, 0, 1,
-0.9363958, -0.8259916, -3.678014, 0.9137255, 1, 0, 1,
-0.9266893, 0.569728, -0.6478412, 0.9098039, 1, 0, 1,
-0.9230229, 1.12671, 1.518226, 0.9019608, 1, 0, 1,
-0.9217691, 0.03903341, -2.875308, 0.8941177, 1, 0, 1,
-0.9172414, 1.486804, 0.8263968, 0.8901961, 1, 0, 1,
-0.9162627, -0.1359177, -2.082106, 0.8823529, 1, 0, 1,
-0.9058971, 0.2555575, -2.247869, 0.8784314, 1, 0, 1,
-0.9020534, -1.508144, -2.675179, 0.8705882, 1, 0, 1,
-0.8972644, 1.456041, -0.5921752, 0.8666667, 1, 0, 1,
-0.8929511, 1.388671, -1.787647, 0.8588235, 1, 0, 1,
-0.8905407, -0.544642, -3.57914, 0.854902, 1, 0, 1,
-0.8881672, -1.753906, -1.311887, 0.8470588, 1, 0, 1,
-0.8867141, -2.568398, -2.315492, 0.8431373, 1, 0, 1,
-0.8834836, 0.3579362, -0.0005576037, 0.8352941, 1, 0, 1,
-0.881705, 0.8884123, 0.2308308, 0.8313726, 1, 0, 1,
-0.8751833, 0.8454546, -0.6271331, 0.8235294, 1, 0, 1,
-0.8715199, 0.1260377, 0.106176, 0.8196079, 1, 0, 1,
-0.871114, -0.7781824, -4.052531, 0.8117647, 1, 0, 1,
-0.8689272, -1.874984, -3.282578, 0.8078431, 1, 0, 1,
-0.8685074, 0.4630431, -0.1637076, 0.8, 1, 0, 1,
-0.8655949, 0.6092035, -0.926369, 0.7921569, 1, 0, 1,
-0.8651007, 0.261182, -1.554311, 0.7882353, 1, 0, 1,
-0.8639706, -0.08682889, -1.652332, 0.7803922, 1, 0, 1,
-0.8619378, -0.829971, -0.8519519, 0.7764706, 1, 0, 1,
-0.8613527, 0.9288351, -2.899659, 0.7686275, 1, 0, 1,
-0.8598468, -0.1857327, -1.013364, 0.7647059, 1, 0, 1,
-0.8547935, 0.1330127, -1.620787, 0.7568628, 1, 0, 1,
-0.8336959, 2.002592, 0.7274804, 0.7529412, 1, 0, 1,
-0.8307199, -0.270519, -1.091694, 0.7450981, 1, 0, 1,
-0.827216, 1.236858, -0.4818932, 0.7411765, 1, 0, 1,
-0.8259065, 1.810719, -1.228269, 0.7333333, 1, 0, 1,
-0.8238612, -0.7408203, -1.66669, 0.7294118, 1, 0, 1,
-0.818656, 0.9120014, -1.7011, 0.7215686, 1, 0, 1,
-0.8182381, -0.504087, -2.20066, 0.7176471, 1, 0, 1,
-0.8140998, 0.7251556, -2.00494, 0.7098039, 1, 0, 1,
-0.8133024, -0.9536783, -1.933115, 0.7058824, 1, 0, 1,
-0.8131916, 1.144572, -2.19002, 0.6980392, 1, 0, 1,
-0.8068488, -1.079972, -3.253453, 0.6901961, 1, 0, 1,
-0.8047422, -0.7861408, -1.421154, 0.6862745, 1, 0, 1,
-0.8018603, -0.0755817, -2.572355, 0.6784314, 1, 0, 1,
-0.7982819, 0.3013484, -0.6086893, 0.6745098, 1, 0, 1,
-0.7892291, -0.7040815, -1.167243, 0.6666667, 1, 0, 1,
-0.7891207, -1.243175, -1.386498, 0.6627451, 1, 0, 1,
-0.7887176, 0.9954718, -1.050644, 0.654902, 1, 0, 1,
-0.7833072, 1.133541, -1.327584, 0.6509804, 1, 0, 1,
-0.7831714, -1.541675, -4.330522, 0.6431373, 1, 0, 1,
-0.7801328, 1.803026, 0.006635469, 0.6392157, 1, 0, 1,
-0.7770457, 0.3337663, -4.136246, 0.6313726, 1, 0, 1,
-0.776371, -0.6991879, -1.143044, 0.627451, 1, 0, 1,
-0.7754173, 0.5151326, -0.6114038, 0.6196079, 1, 0, 1,
-0.7742522, -0.7609317, -0.9961501, 0.6156863, 1, 0, 1,
-0.7727108, 1.014083, -0.1891699, 0.6078432, 1, 0, 1,
-0.7722096, 0.06411958, -1.773888, 0.6039216, 1, 0, 1,
-0.7712325, 0.3461777, 0.4917223, 0.5960785, 1, 0, 1,
-0.7660747, 0.5307316, -0.5341034, 0.5882353, 1, 0, 1,
-0.7612649, 0.3824419, -1.256413, 0.5843138, 1, 0, 1,
-0.7574424, 0.3255945, 0.08991829, 0.5764706, 1, 0, 1,
-0.745939, -0.1810405, -0.6721726, 0.572549, 1, 0, 1,
-0.7405655, 1.150051, -0.630917, 0.5647059, 1, 0, 1,
-0.730845, 0.4911777, -1.770167, 0.5607843, 1, 0, 1,
-0.730793, -0.05294491, -1.054776, 0.5529412, 1, 0, 1,
-0.7304441, -0.03320988, -1.751116, 0.5490196, 1, 0, 1,
-0.728698, -0.9165411, -1.933514, 0.5411765, 1, 0, 1,
-0.7253733, 0.477151, -1.038157, 0.5372549, 1, 0, 1,
-0.7238554, 0.6334409, -0.2806904, 0.5294118, 1, 0, 1,
-0.7211587, 0.06369547, -1.449792, 0.5254902, 1, 0, 1,
-0.7170647, -1.451783, -1.594332, 0.5176471, 1, 0, 1,
-0.715575, 1.298207, -0.2510977, 0.5137255, 1, 0, 1,
-0.7141229, -1.314104, -4.577425, 0.5058824, 1, 0, 1,
-0.7110174, -0.08834234, -0.04425538, 0.5019608, 1, 0, 1,
-0.7103127, 1.238796, 0.1193482, 0.4941176, 1, 0, 1,
-0.7076637, 1.045638, 0.08039318, 0.4862745, 1, 0, 1,
-0.7065717, 0.04805686, 0.3845626, 0.4823529, 1, 0, 1,
-0.7043321, 1.014518, 0.1112853, 0.4745098, 1, 0, 1,
-0.7016367, -0.8564212, -1.677047, 0.4705882, 1, 0, 1,
-0.6991196, -0.3329036, -1.80351, 0.4627451, 1, 0, 1,
-0.6975014, -0.172579, -1.531431, 0.4588235, 1, 0, 1,
-0.6882064, -1.498392, -3.258837, 0.4509804, 1, 0, 1,
-0.687052, 1.189808, -2.100172, 0.4470588, 1, 0, 1,
-0.679235, 0.958836, -0.8580911, 0.4392157, 1, 0, 1,
-0.6780058, -0.2284374, -1.472729, 0.4352941, 1, 0, 1,
-0.6776303, -2.216102, -2.496698, 0.427451, 1, 0, 1,
-0.6762079, -2.296284, -3.174163, 0.4235294, 1, 0, 1,
-0.6747159, -1.257613, -3.335618, 0.4156863, 1, 0, 1,
-0.6741714, -2.54944, -2.318269, 0.4117647, 1, 0, 1,
-0.6681524, 0.4765355, 0.3980218, 0.4039216, 1, 0, 1,
-0.6669112, -0.5995315, -2.919187, 0.3960784, 1, 0, 1,
-0.6662706, -0.01433988, -2.113487, 0.3921569, 1, 0, 1,
-0.660509, -0.3748452, 0.7164003, 0.3843137, 1, 0, 1,
-0.6596462, 0.7797802, -1.790955, 0.3803922, 1, 0, 1,
-0.6550978, -0.02739975, -1.343453, 0.372549, 1, 0, 1,
-0.6454365, 0.5513507, 0.08362402, 0.3686275, 1, 0, 1,
-0.6398979, -0.4263106, -3.120896, 0.3607843, 1, 0, 1,
-0.6387379, 0.07037499, -1.751096, 0.3568628, 1, 0, 1,
-0.6349399, -1.075459, -2.604164, 0.3490196, 1, 0, 1,
-0.6309542, 1.313926, 0.8962844, 0.345098, 1, 0, 1,
-0.6307466, -0.0483076, -0.2352924, 0.3372549, 1, 0, 1,
-0.6260855, -0.2342333, -2.884461, 0.3333333, 1, 0, 1,
-0.6223688, -0.9028214, -3.823595, 0.3254902, 1, 0, 1,
-0.6181351, 0.2817034, -2.435299, 0.3215686, 1, 0, 1,
-0.6143299, 0.4811177, -0.556672, 0.3137255, 1, 0, 1,
-0.6099334, 0.5585644, -1.503967, 0.3098039, 1, 0, 1,
-0.5967906, -0.9771445, -1.600743, 0.3019608, 1, 0, 1,
-0.5922059, 1.027332, 0.4456802, 0.2941177, 1, 0, 1,
-0.5907468, -1.573801, -1.173062, 0.2901961, 1, 0, 1,
-0.5861517, 0.8844682, -0.782139, 0.282353, 1, 0, 1,
-0.5843584, -0.3363847, -1.575066, 0.2784314, 1, 0, 1,
-0.5830124, 0.734937, -1.581668, 0.2705882, 1, 0, 1,
-0.5821123, -1.47986, -2.167103, 0.2666667, 1, 0, 1,
-0.5742478, 0.6478596, -0.768863, 0.2588235, 1, 0, 1,
-0.5728987, 1.567185, 0.7476207, 0.254902, 1, 0, 1,
-0.5721697, -0.466193, -1.492468, 0.2470588, 1, 0, 1,
-0.5704024, 1.833265, -0.1582665, 0.2431373, 1, 0, 1,
-0.5685388, -1.163345, -2.309368, 0.2352941, 1, 0, 1,
-0.5595262, 0.1574452, -1.671233, 0.2313726, 1, 0, 1,
-0.5595056, 1.545478, -0.5452777, 0.2235294, 1, 0, 1,
-0.5580842, -0.9463541, -3.535098, 0.2196078, 1, 0, 1,
-0.5501174, -0.1501554, -1.573888, 0.2117647, 1, 0, 1,
-0.550086, -1.186508, -2.019342, 0.2078431, 1, 0, 1,
-0.5484365, -1.542442, -2.95468, 0.2, 1, 0, 1,
-0.5350438, -0.1970568, -2.006756, 0.1921569, 1, 0, 1,
-0.5342895, 0.03005909, -3.808385, 0.1882353, 1, 0, 1,
-0.5323763, -0.03691122, -1.957366, 0.1803922, 1, 0, 1,
-0.5300307, -0.4480934, -2.958679, 0.1764706, 1, 0, 1,
-0.522379, -0.6708612, -1.940124, 0.1686275, 1, 0, 1,
-0.5216586, -0.1715699, -0.5680624, 0.1647059, 1, 0, 1,
-0.5214369, -0.3806711, -3.68451, 0.1568628, 1, 0, 1,
-0.5168315, -1.527542, -2.076457, 0.1529412, 1, 0, 1,
-0.5162956, -0.3842086, -2.887969, 0.145098, 1, 0, 1,
-0.5128666, -1.574924, -0.9664879, 0.1411765, 1, 0, 1,
-0.5046626, -0.8294382, -1.322381, 0.1333333, 1, 0, 1,
-0.5019776, -1.101847, -2.27103, 0.1294118, 1, 0, 1,
-0.500106, -1.303831, -3.765987, 0.1215686, 1, 0, 1,
-0.4984457, 0.928268, 1.601291, 0.1176471, 1, 0, 1,
-0.4904646, -0.09740724, -0.7458987, 0.1098039, 1, 0, 1,
-0.4870044, 0.9620106, -3.698413, 0.1058824, 1, 0, 1,
-0.4859221, 1.549803, -1.166511, 0.09803922, 1, 0, 1,
-0.4854369, 0.6994968, -1.463959, 0.09019608, 1, 0, 1,
-0.4832723, 0.03065715, -1.232056, 0.08627451, 1, 0, 1,
-0.4787852, 0.6803635, -0.6968225, 0.07843138, 1, 0, 1,
-0.4718106, 0.800446, -1.579776, 0.07450981, 1, 0, 1,
-0.4716089, -0.6406696, -2.311869, 0.06666667, 1, 0, 1,
-0.4713806, 0.6859807, -0.02315984, 0.0627451, 1, 0, 1,
-0.4712587, -1.569673, -3.901156, 0.05490196, 1, 0, 1,
-0.4644603, -1.426474, -3.670685, 0.05098039, 1, 0, 1,
-0.4631349, -1.675163, -3.485368, 0.04313726, 1, 0, 1,
-0.460948, 0.6989857, -0.349601, 0.03921569, 1, 0, 1,
-0.4559461, -2.275669, -2.698294, 0.03137255, 1, 0, 1,
-0.4550843, -0.5901173, -1.514679, 0.02745098, 1, 0, 1,
-0.4501883, 0.2316243, 0.1900844, 0.01960784, 1, 0, 1,
-0.4428541, -0.2532488, -0.9284708, 0.01568628, 1, 0, 1,
-0.4416048, 0.8699518, -2.805149, 0.007843138, 1, 0, 1,
-0.4333327, -0.003364069, -1.908072, 0.003921569, 1, 0, 1,
-0.4323637, 0.4484894, -0.1738224, 0, 1, 0.003921569, 1,
-0.4310726, 0.4142602, -0.2965645, 0, 1, 0.01176471, 1,
-0.4304913, -0.5239373, -2.848708, 0, 1, 0.01568628, 1,
-0.4287767, -1.167835, -1.072506, 0, 1, 0.02352941, 1,
-0.4260649, 0.5452591, -0.7952752, 0, 1, 0.02745098, 1,
-0.4250444, -1.748721, -3.157674, 0, 1, 0.03529412, 1,
-0.4243217, 0.5653125, -0.7220271, 0, 1, 0.03921569, 1,
-0.4226882, -0.9381256, -2.409709, 0, 1, 0.04705882, 1,
-0.4187416, 1.523793, -0.2744221, 0, 1, 0.05098039, 1,
-0.4155149, 0.6512432, -0.6950565, 0, 1, 0.05882353, 1,
-0.4117343, -0.9094126, -1.37154, 0, 1, 0.0627451, 1,
-0.4103889, 0.9275419, -0.233268, 0, 1, 0.07058824, 1,
-0.4081772, -0.9287834, -1.801869, 0, 1, 0.07450981, 1,
-0.4062182, 0.4798378, -0.9554063, 0, 1, 0.08235294, 1,
-0.4055722, 0.2549795, -2.911806, 0, 1, 0.08627451, 1,
-0.4050432, 0.4915078, 1.150192, 0, 1, 0.09411765, 1,
-0.4015943, 1.567448, 1.935991, 0, 1, 0.1019608, 1,
-0.3952068, 0.4593612, -1.057385, 0, 1, 0.1058824, 1,
-0.3921638, -0.2293808, -0.8324419, 0, 1, 0.1137255, 1,
-0.3889508, 1.442767, -0.589931, 0, 1, 0.1176471, 1,
-0.3888925, -0.001584714, -1.475339, 0, 1, 0.1254902, 1,
-0.3878098, 0.06948458, -2.17676, 0, 1, 0.1294118, 1,
-0.3855692, 0.01904099, -2.167485, 0, 1, 0.1372549, 1,
-0.3848966, 1.534955, 1.463046, 0, 1, 0.1411765, 1,
-0.38485, 1.966467, -1.126128, 0, 1, 0.1490196, 1,
-0.380629, 0.8066558, -2.004954, 0, 1, 0.1529412, 1,
-0.3768747, -0.9336202, -2.950248, 0, 1, 0.1607843, 1,
-0.3761524, 1.129466, -0.4848391, 0, 1, 0.1647059, 1,
-0.3704275, 0.4637126, 0.7459759, 0, 1, 0.172549, 1,
-0.3680716, -0.02263759, -2.461016, 0, 1, 0.1764706, 1,
-0.3572146, -1.239635, -2.885816, 0, 1, 0.1843137, 1,
-0.356714, 0.1886694, 0.3228004, 0, 1, 0.1882353, 1,
-0.3566333, 2.404848, 0.2495395, 0, 1, 0.1960784, 1,
-0.355055, 0.3079207, -1.560516, 0, 1, 0.2039216, 1,
-0.3527522, 0.9460357, -0.03929167, 0, 1, 0.2078431, 1,
-0.3518124, -0.07299371, -2.390363, 0, 1, 0.2156863, 1,
-0.3490264, 0.7692096, -0.6659483, 0, 1, 0.2196078, 1,
-0.3413948, -0.1270133, -2.473504, 0, 1, 0.227451, 1,
-0.3402844, 0.7391701, -0.4943627, 0, 1, 0.2313726, 1,
-0.3390775, -0.9840586, -2.920309, 0, 1, 0.2392157, 1,
-0.3388678, -1.114491, -1.929267, 0, 1, 0.2431373, 1,
-0.3388107, -0.3307853, -2.138633, 0, 1, 0.2509804, 1,
-0.3376598, -0.6805304, -2.860315, 0, 1, 0.254902, 1,
-0.3364015, -0.3493219, -3.740925, 0, 1, 0.2627451, 1,
-0.3340596, 0.3859116, 1.264461, 0, 1, 0.2666667, 1,
-0.3267923, -2.398853, -2.386774, 0, 1, 0.2745098, 1,
-0.3226266, -0.1033423, -0.4023051, 0, 1, 0.2784314, 1,
-0.3225303, 0.2879879, -1.19303, 0, 1, 0.2862745, 1,
-0.3208087, 2.12423, -0.70494, 0, 1, 0.2901961, 1,
-0.3144466, 0.9066721, -0.495947, 0, 1, 0.2980392, 1,
-0.3091349, -0.7707468, -2.486509, 0, 1, 0.3058824, 1,
-0.307792, 0.4534822, 1.813887, 0, 1, 0.3098039, 1,
-0.3072614, 0.9300883, 0.9679517, 0, 1, 0.3176471, 1,
-0.3042279, 0.8174417, -1.390014, 0, 1, 0.3215686, 1,
-0.3032663, -0.04743459, -2.979077, 0, 1, 0.3294118, 1,
-0.3025412, 0.1053775, -1.04644, 0, 1, 0.3333333, 1,
-0.2997852, -0.06590223, -0.5051578, 0, 1, 0.3411765, 1,
-0.2995229, -0.5843241, -3.599554, 0, 1, 0.345098, 1,
-0.2969015, 0.2956485, 0.7780139, 0, 1, 0.3529412, 1,
-0.2951298, 1.119628, -1.041882, 0, 1, 0.3568628, 1,
-0.2885872, 0.8946061, 0.06465565, 0, 1, 0.3647059, 1,
-0.2860785, 0.3718631, 0.1409841, 0, 1, 0.3686275, 1,
-0.2841565, -0.4679964, -2.20939, 0, 1, 0.3764706, 1,
-0.2833526, 0.05804437, -0.9770995, 0, 1, 0.3803922, 1,
-0.2721049, 0.6993762, -0.5112501, 0, 1, 0.3882353, 1,
-0.2648745, 0.8988868, 0.3698931, 0, 1, 0.3921569, 1,
-0.2648598, -0.07092734, -4.675216, 0, 1, 0.4, 1,
-0.2596412, -0.8879438, -4.324749, 0, 1, 0.4078431, 1,
-0.2582473, -2.468185, -1.603267, 0, 1, 0.4117647, 1,
-0.2561674, 0.8327262, 0.8965944, 0, 1, 0.4196078, 1,
-0.2521291, 1.743238, -0.6358991, 0, 1, 0.4235294, 1,
-0.2510188, 0.4787767, 1.597329, 0, 1, 0.4313726, 1,
-0.2452916, 0.05493836, 0.5770107, 0, 1, 0.4352941, 1,
-0.2388818, 0.5773058, 0.2231083, 0, 1, 0.4431373, 1,
-0.2334365, -0.6508081, -3.032951, 0, 1, 0.4470588, 1,
-0.2331436, 0.2606111, -0.7697078, 0, 1, 0.454902, 1,
-0.228108, 0.5145383, 0.3850092, 0, 1, 0.4588235, 1,
-0.2277357, -0.8937535, -2.529592, 0, 1, 0.4666667, 1,
-0.2275087, -0.3768917, -1.608651, 0, 1, 0.4705882, 1,
-0.226771, -1.053698, -2.772959, 0, 1, 0.4784314, 1,
-0.225837, -0.1057387, -1.463523, 0, 1, 0.4823529, 1,
-0.2241081, 1.297998, 0.2265038, 0, 1, 0.4901961, 1,
-0.2228675, 0.1937489, 1.221596, 0, 1, 0.4941176, 1,
-0.2214478, -0.3639122, -2.583467, 0, 1, 0.5019608, 1,
-0.2164612, 0.5878719, 0.4464094, 0, 1, 0.509804, 1,
-0.2142882, 0.2886349, -2.270416, 0, 1, 0.5137255, 1,
-0.2141469, -0.2719788, -1.708532, 0, 1, 0.5215687, 1,
-0.2134958, -0.3128504, -4.180053, 0, 1, 0.5254902, 1,
-0.2125868, 0.1595436, 0.2244348, 0, 1, 0.5333334, 1,
-0.2116983, 2.386173, 0.6554729, 0, 1, 0.5372549, 1,
-0.2099188, 0.6268266, -0.05481778, 0, 1, 0.5450981, 1,
-0.2030694, 1.48812, -0.7869568, 0, 1, 0.5490196, 1,
-0.2018306, -0.4547384, -1.947743, 0, 1, 0.5568628, 1,
-0.201621, -0.1649609, -2.352437, 0, 1, 0.5607843, 1,
-0.2013786, 0.6415552, 0.5030258, 0, 1, 0.5686275, 1,
-0.1966939, -1.393948, -4.788227, 0, 1, 0.572549, 1,
-0.1955799, -1.80374, -2.588754, 0, 1, 0.5803922, 1,
-0.1925579, -1.247936, -3.374133, 0, 1, 0.5843138, 1,
-0.1913801, 1.040999, 2.138824, 0, 1, 0.5921569, 1,
-0.1903654, 1.021404, 0.2797083, 0, 1, 0.5960785, 1,
-0.1883123, -0.1686184, -0.7049204, 0, 1, 0.6039216, 1,
-0.182252, 1.720529, 0.5561998, 0, 1, 0.6117647, 1,
-0.1799448, 0.001082983, -2.204694, 0, 1, 0.6156863, 1,
-0.1798177, -0.2819332, -3.037728, 0, 1, 0.6235294, 1,
-0.1748284, -0.499335, -2.360414, 0, 1, 0.627451, 1,
-0.173602, -0.2811882, -2.621973, 0, 1, 0.6352941, 1,
-0.1729622, 1.026193, 0.9745722, 0, 1, 0.6392157, 1,
-0.1714165, -1.184606, -4.393077, 0, 1, 0.6470588, 1,
-0.1708342, -3.083673, -2.932527, 0, 1, 0.6509804, 1,
-0.1695433, -1.248949, -2.624807, 0, 1, 0.6588235, 1,
-0.1685899, -0.3390402, -3.272222, 0, 1, 0.6627451, 1,
-0.166836, -1.115334, -3.434905, 0, 1, 0.6705883, 1,
-0.1631503, -1.332647, -3.308069, 0, 1, 0.6745098, 1,
-0.1622287, 1.213125, 1.161013, 0, 1, 0.682353, 1,
-0.1606063, 0.6365739, 0.4715325, 0, 1, 0.6862745, 1,
-0.157342, -0.1979008, -2.301295, 0, 1, 0.6941177, 1,
-0.1539645, -0.2295687, -3.029355, 0, 1, 0.7019608, 1,
-0.1497371, -0.8958048, -3.660537, 0, 1, 0.7058824, 1,
-0.1460869, 0.1535516, -0.8274849, 0, 1, 0.7137255, 1,
-0.1426482, 0.8469141, -0.4011674, 0, 1, 0.7176471, 1,
-0.1421178, -1.834704, -2.196949, 0, 1, 0.7254902, 1,
-0.140232, 0.3551748, -0.2049906, 0, 1, 0.7294118, 1,
-0.1336982, 1.208475, -0.1754801, 0, 1, 0.7372549, 1,
-0.1312639, -0.2704307, -0.4732816, 0, 1, 0.7411765, 1,
-0.1295359, 0.4987386, -1.698651, 0, 1, 0.7490196, 1,
-0.1277437, 0.7553676, -0.411489, 0, 1, 0.7529412, 1,
-0.1204282, 2.413099, 0.1986138, 0, 1, 0.7607843, 1,
-0.1201942, 0.1751298, -0.188952, 0, 1, 0.7647059, 1,
-0.1192456, -0.2134036, -2.935389, 0, 1, 0.772549, 1,
-0.1155288, 0.09286872, 0.7944537, 0, 1, 0.7764706, 1,
-0.1143259, -0.4800288, -4.179443, 0, 1, 0.7843137, 1,
-0.1131191, 0.8176876, 1.199146, 0, 1, 0.7882353, 1,
-0.1067861, 1.201381, -0.8127885, 0, 1, 0.7960784, 1,
-0.1051057, -0.272563, -4.251256, 0, 1, 0.8039216, 1,
-0.1049173, 1.195435, 0.7510427, 0, 1, 0.8078431, 1,
-0.1039269, 0.01587381, -0.5093876, 0, 1, 0.8156863, 1,
-0.1002483, -2.755815, -3.702044, 0, 1, 0.8196079, 1,
-0.09987014, 1.507283, -0.3552096, 0, 1, 0.827451, 1,
-0.09812525, -0.9949757, -4.036986, 0, 1, 0.8313726, 1,
-0.09470597, -1.570116, -2.615868, 0, 1, 0.8392157, 1,
-0.0943379, 0.8100196, 0.4757081, 0, 1, 0.8431373, 1,
-0.09344929, 1.534467, 0.1936374, 0, 1, 0.8509804, 1,
-0.09304238, -0.334091, -1.771391, 0, 1, 0.854902, 1,
-0.08979038, 0.06313526, -0.1572606, 0, 1, 0.8627451, 1,
-0.08070337, 0.8310612, -0.4454523, 0, 1, 0.8666667, 1,
-0.07590777, -0.6102832, -3.052092, 0, 1, 0.8745098, 1,
-0.07164624, 1.123611, 0.233283, 0, 1, 0.8784314, 1,
-0.07074424, -0.01161803, -1.674553, 0, 1, 0.8862745, 1,
-0.06750726, -0.4390937, -3.332897, 0, 1, 0.8901961, 1,
-0.06333885, 1.491314, -1.139627, 0, 1, 0.8980392, 1,
-0.06251575, 0.5014148, -1.833709, 0, 1, 0.9058824, 1,
-0.05825464, 2.349451, -1.12979, 0, 1, 0.9098039, 1,
-0.05587118, 1.188085, 0.6777635, 0, 1, 0.9176471, 1,
-0.05165745, 1.237529, 0.3468614, 0, 1, 0.9215686, 1,
-0.0515653, -0.5471388, -2.781394, 0, 1, 0.9294118, 1,
-0.0470701, -1.662408, -2.835896, 0, 1, 0.9333333, 1,
-0.04559292, 1.860172, 0.2020513, 0, 1, 0.9411765, 1,
-0.04353612, 0.8056575, 2.005542, 0, 1, 0.945098, 1,
-0.03807679, 1.268572, 0.03841795, 0, 1, 0.9529412, 1,
-0.0369781, -0.4033854, -4.088512, 0, 1, 0.9568627, 1,
-0.03628993, 0.9452544, -2.067858, 0, 1, 0.9647059, 1,
-0.03543322, -0.6095811, -5.173212, 0, 1, 0.9686275, 1,
-0.03243618, -0.3462979, -2.683855, 0, 1, 0.9764706, 1,
-0.03032146, -0.9270292, -2.816797, 0, 1, 0.9803922, 1,
-0.03026104, -0.2491652, -3.0065, 0, 1, 0.9882353, 1,
-0.02977214, -0.0001191169, -2.934673, 0, 1, 0.9921569, 1,
-0.02618135, 0.6229315, -0.6226887, 0, 1, 1, 1,
-0.02211941, -0.4847191, -2.741156, 0, 0.9921569, 1, 1,
-0.01903193, 0.9275483, -0.5999588, 0, 0.9882353, 1, 1,
-0.01834766, 0.1890976, 0.808964, 0, 0.9803922, 1, 1,
-0.01436973, 0.9532677, 0.1166637, 0, 0.9764706, 1, 1,
-0.01397985, 1.417326, -1.211511, 0, 0.9686275, 1, 1,
-0.01270313, -0.4581951, -1.947129, 0, 0.9647059, 1, 1,
-0.009137356, -0.3594094, -1.89975, 0, 0.9568627, 1, 1,
-0.004035169, -0.6087886, -5.514507, 0, 0.9529412, 1, 1,
-0.0006523528, 1.247607, -1.217097, 0, 0.945098, 1, 1,
0.001803495, -0.3296551, 2.993385, 0, 0.9411765, 1, 1,
0.004785712, 0.7370682, 0.03374051, 0, 0.9333333, 1, 1,
0.005661617, 0.6689106, 0.9392107, 0, 0.9294118, 1, 1,
0.007769232, 0.04302398, 0.1465025, 0, 0.9215686, 1, 1,
0.01035528, -0.627319, 2.762765, 0, 0.9176471, 1, 1,
0.0158715, -0.7809597, 1.715778, 0, 0.9098039, 1, 1,
0.02335942, -0.3100253, 0.8515197, 0, 0.9058824, 1, 1,
0.02462923, 0.1392959, 0.4584166, 0, 0.8980392, 1, 1,
0.02962149, -1.601516, 4.323966, 0, 0.8901961, 1, 1,
0.03145467, 0.7338447, -0.5637871, 0, 0.8862745, 1, 1,
0.03263589, -1.649247, 2.870252, 0, 0.8784314, 1, 1,
0.03416254, 1.258758, 0.5469094, 0, 0.8745098, 1, 1,
0.03654286, 0.06116901, 0.6471369, 0, 0.8666667, 1, 1,
0.03731303, -2.198063, 3.685586, 0, 0.8627451, 1, 1,
0.03748472, 2.254922, -0.02866597, 0, 0.854902, 1, 1,
0.03748631, -0.1320988, 4.100923, 0, 0.8509804, 1, 1,
0.03750113, -1.175164, 2.669609, 0, 0.8431373, 1, 1,
0.03861877, -3.099865, 4.178277, 0, 0.8392157, 1, 1,
0.04383645, -0.7482031, 3.086398, 0, 0.8313726, 1, 1,
0.05006916, 0.01644389, 0.8744872, 0, 0.827451, 1, 1,
0.06022142, -1.322419, 3.893488, 0, 0.8196079, 1, 1,
0.06186913, -0.8130949, 2.763629, 0, 0.8156863, 1, 1,
0.06318416, 0.7057145, -0.9422377, 0, 0.8078431, 1, 1,
0.06821932, -0.8599691, 2.442338, 0, 0.8039216, 1, 1,
0.07139265, 0.08266149, -0.9276807, 0, 0.7960784, 1, 1,
0.07351305, -0.5383625, 2.759562, 0, 0.7882353, 1, 1,
0.07795199, -0.4969332, 2.953304, 0, 0.7843137, 1, 1,
0.07797826, 0.9391115, 0.3682856, 0, 0.7764706, 1, 1,
0.08202392, -0.586202, 2.011119, 0, 0.772549, 1, 1,
0.08226866, -1.429375, 2.525579, 0, 0.7647059, 1, 1,
0.08473878, -0.5137623, 3.902609, 0, 0.7607843, 1, 1,
0.09133977, -1.179391, 3.29445, 0, 0.7529412, 1, 1,
0.09459417, -0.2372943, 2.179971, 0, 0.7490196, 1, 1,
0.09893466, 0.5873713, 0.615876, 0, 0.7411765, 1, 1,
0.09978381, 0.9519544, 0.2375472, 0, 0.7372549, 1, 1,
0.1016505, -0.3771099, 3.638349, 0, 0.7294118, 1, 1,
0.1016809, -0.06389096, 2.770307, 0, 0.7254902, 1, 1,
0.1023643, 1.198135, 0.3946499, 0, 0.7176471, 1, 1,
0.10267, -1.116165, 1.621955, 0, 0.7137255, 1, 1,
0.1038441, 0.699011, 2.033962, 0, 0.7058824, 1, 1,
0.1043802, 0.5001433, -0.2566613, 0, 0.6980392, 1, 1,
0.105759, 0.2663955, -0.3525197, 0, 0.6941177, 1, 1,
0.1124568, 0.09616464, 0.3334739, 0, 0.6862745, 1, 1,
0.1211299, -0.3627361, 0.340326, 0, 0.682353, 1, 1,
0.1224937, -1.150564, 2.579332, 0, 0.6745098, 1, 1,
0.1262835, -0.3775534, 3.521801, 0, 0.6705883, 1, 1,
0.1287754, -2.129065, 1.364109, 0, 0.6627451, 1, 1,
0.1341675, 0.6605357, 1.433312, 0, 0.6588235, 1, 1,
0.1380926, 0.7365706, 1.308178, 0, 0.6509804, 1, 1,
0.1408278, 0.8864256, 0.4211127, 0, 0.6470588, 1, 1,
0.1421405, 0.7665088, -0.9121587, 0, 0.6392157, 1, 1,
0.1466446, 0.05362711, 2.491224, 0, 0.6352941, 1, 1,
0.1476792, 1.619062, 0.0302331, 0, 0.627451, 1, 1,
0.1478593, 0.189684, -1.453012, 0, 0.6235294, 1, 1,
0.148353, 0.4780711, 0.7385854, 0, 0.6156863, 1, 1,
0.1495908, 0.645904, 1.907718, 0, 0.6117647, 1, 1,
0.1517018, -0.4576821, 3.160761, 0, 0.6039216, 1, 1,
0.153516, 0.581337, -0.8793324, 0, 0.5960785, 1, 1,
0.1536158, 1.453129, -0.06262156, 0, 0.5921569, 1, 1,
0.154001, -1.322434, 2.09091, 0, 0.5843138, 1, 1,
0.1561525, -2.860048, 3.051965, 0, 0.5803922, 1, 1,
0.159417, 1.990579, -0.1686346, 0, 0.572549, 1, 1,
0.1605138, -1.639434, 2.020795, 0, 0.5686275, 1, 1,
0.162569, -0.2535888, 3.537307, 0, 0.5607843, 1, 1,
0.1628385, 1.758894, -1.661521, 0, 0.5568628, 1, 1,
0.1631383, 0.05591679, 1.856999, 0, 0.5490196, 1, 1,
0.1639471, 1.381432, -0.8831496, 0, 0.5450981, 1, 1,
0.1647964, 1.392259, -0.4659598, 0, 0.5372549, 1, 1,
0.1671026, -0.8051179, 1.811654, 0, 0.5333334, 1, 1,
0.168168, -0.4870128, 3.954194, 0, 0.5254902, 1, 1,
0.1702834, 0.6892838, 0.7950166, 0, 0.5215687, 1, 1,
0.1723019, 0.06786309, 0.5818836, 0, 0.5137255, 1, 1,
0.1739387, -1.386728, 2.192776, 0, 0.509804, 1, 1,
0.1742271, -0.6787687, 1.123081, 0, 0.5019608, 1, 1,
0.1747658, 3.092503, -0.5186172, 0, 0.4941176, 1, 1,
0.1777396, -0.6159748, 0.880034, 0, 0.4901961, 1, 1,
0.1778192, 0.9429734, 0.4495543, 0, 0.4823529, 1, 1,
0.1823333, 0.7676637, 1.279126, 0, 0.4784314, 1, 1,
0.1826823, 1.628168, -1.087785, 0, 0.4705882, 1, 1,
0.186468, -0.5220587, 2.719126, 0, 0.4666667, 1, 1,
0.1865222, 1.014638, -0.4919392, 0, 0.4588235, 1, 1,
0.1867171, -0.02813041, 2.167568, 0, 0.454902, 1, 1,
0.1881272, 0.4263769, 0.5959118, 0, 0.4470588, 1, 1,
0.1888712, 0.8915552, 1.510844, 0, 0.4431373, 1, 1,
0.189932, 0.602672, 0.09594668, 0, 0.4352941, 1, 1,
0.1927654, 1.123436, -1.011851, 0, 0.4313726, 1, 1,
0.1944789, -0.01201229, 1.931436, 0, 0.4235294, 1, 1,
0.1948238, 1.679712, -0.2802145, 0, 0.4196078, 1, 1,
0.1997683, 0.8875819, -0.1872779, 0, 0.4117647, 1, 1,
0.2012531, -0.51553, 3.870344, 0, 0.4078431, 1, 1,
0.2033392, 0.04122993, 0.989152, 0, 0.4, 1, 1,
0.2053474, 1.03603, -0.9494327, 0, 0.3921569, 1, 1,
0.2059591, 1.129936, -1.180765, 0, 0.3882353, 1, 1,
0.2072195, 0.1093038, 1.333825, 0, 0.3803922, 1, 1,
0.2087357, 0.744873, -0.09448256, 0, 0.3764706, 1, 1,
0.2090304, 1.344232, 0.2335724, 0, 0.3686275, 1, 1,
0.210467, 0.7093433, 0.2346744, 0, 0.3647059, 1, 1,
0.2169552, 0.6443514, -0.1537496, 0, 0.3568628, 1, 1,
0.216997, 1.669372, 0.4886543, 0, 0.3529412, 1, 1,
0.2183231, 0.9001192, -0.541323, 0, 0.345098, 1, 1,
0.2213736, -1.76847, 4.700343, 0, 0.3411765, 1, 1,
0.221843, 0.7976817, 1.617285, 0, 0.3333333, 1, 1,
0.2275559, 1.089059, 0.3667368, 0, 0.3294118, 1, 1,
0.2283031, 0.9012515, -0.8740938, 0, 0.3215686, 1, 1,
0.2308768, -0.3517046, 2.42635, 0, 0.3176471, 1, 1,
0.2363806, 1.104394, -0.0530743, 0, 0.3098039, 1, 1,
0.2366843, 0.1773938, -0.8965265, 0, 0.3058824, 1, 1,
0.2379378, -0.8792147, 3.719199, 0, 0.2980392, 1, 1,
0.2385913, -0.538464, 3.166292, 0, 0.2901961, 1, 1,
0.2404687, -2.591319, 2.988447, 0, 0.2862745, 1, 1,
0.2432172, 0.7988058, -0.3623206, 0, 0.2784314, 1, 1,
0.24352, -0.7145989, 1.560335, 0, 0.2745098, 1, 1,
0.2436413, 1.533317, -0.3461575, 0, 0.2666667, 1, 1,
0.2516308, 0.4225128, -0.0867823, 0, 0.2627451, 1, 1,
0.2554576, 0.5604105, 0.7071969, 0, 0.254902, 1, 1,
0.2578394, -0.1840186, 1.79474, 0, 0.2509804, 1, 1,
0.2587939, 1.375489, -0.9502223, 0, 0.2431373, 1, 1,
0.2591147, -0.5503066, 1.251167, 0, 0.2392157, 1, 1,
0.266727, -0.01734086, 2.68404, 0, 0.2313726, 1, 1,
0.2689154, 0.4584453, -0.3123645, 0, 0.227451, 1, 1,
0.2721917, -0.01278028, 3.193079, 0, 0.2196078, 1, 1,
0.2722071, -0.2342031, 2.976692, 0, 0.2156863, 1, 1,
0.2723196, -0.6881754, 2.667585, 0, 0.2078431, 1, 1,
0.2725932, -2.015832, 2.870375, 0, 0.2039216, 1, 1,
0.2737487, 0.3731723, 0.1695186, 0, 0.1960784, 1, 1,
0.2751803, 0.7896683, 0.03841621, 0, 0.1882353, 1, 1,
0.2775802, 0.7292407, 1.313909, 0, 0.1843137, 1, 1,
0.2791771, -1.111171, 3.08787, 0, 0.1764706, 1, 1,
0.2793245, 0.6992817, -0.07334021, 0, 0.172549, 1, 1,
0.2824731, -2.651457, 2.422389, 0, 0.1647059, 1, 1,
0.2860739, 0.005263236, 3.012866, 0, 0.1607843, 1, 1,
0.2866804, -0.117393, 2.864495, 0, 0.1529412, 1, 1,
0.2874072, -0.3163369, 2.047084, 0, 0.1490196, 1, 1,
0.2878678, -0.9557227, 4.030148, 0, 0.1411765, 1, 1,
0.2909435, 0.3045687, 0.2382877, 0, 0.1372549, 1, 1,
0.2970817, -1.903599, 4.883186, 0, 0.1294118, 1, 1,
0.3007407, 0.6865218, 0.7702799, 0, 0.1254902, 1, 1,
0.3012252, -0.9484051, 3.942791, 0, 0.1176471, 1, 1,
0.3017223, -0.6332509, 2.576122, 0, 0.1137255, 1, 1,
0.3071308, -0.7368201, 1.791981, 0, 0.1058824, 1, 1,
0.3091376, -0.3457674, 0.2730124, 0, 0.09803922, 1, 1,
0.3117565, 1.504421, 0.7003054, 0, 0.09411765, 1, 1,
0.3137554, 0.628067, 1.021608, 0, 0.08627451, 1, 1,
0.3171325, -0.7075324, 2.011075, 0, 0.08235294, 1, 1,
0.3199465, 1.01846, -0.5109421, 0, 0.07450981, 1, 1,
0.3233135, 0.2593778, 0.7060735, 0, 0.07058824, 1, 1,
0.3273196, 0.6311401, 1.028628, 0, 0.0627451, 1, 1,
0.330748, 0.1148038, -0.07113762, 0, 0.05882353, 1, 1,
0.330895, -0.3658793, 3.254537, 0, 0.05098039, 1, 1,
0.333214, -0.5363908, 2.983573, 0, 0.04705882, 1, 1,
0.3351619, -1.190321, 4.186281, 0, 0.03921569, 1, 1,
0.3363668, 0.7080868, 1.325785, 0, 0.03529412, 1, 1,
0.3376514, -1.877517, 2.176522, 0, 0.02745098, 1, 1,
0.3398897, 0.9032753, 1.031861, 0, 0.02352941, 1, 1,
0.3430627, -1.288736, 3.895745, 0, 0.01568628, 1, 1,
0.3436938, 0.30709, 1.640995, 0, 0.01176471, 1, 1,
0.3489977, -1.612931, 4.003815, 0, 0.003921569, 1, 1,
0.3493775, -0.140282, 1.277961, 0.003921569, 0, 1, 1,
0.3600264, 0.6294377, 0.5851364, 0.007843138, 0, 1, 1,
0.3618146, 0.299189, 1.821305, 0.01568628, 0, 1, 1,
0.3633983, -2.421513, 0.8837342, 0.01960784, 0, 1, 1,
0.3672249, 1.763346, 1.056497, 0.02745098, 0, 1, 1,
0.3721879, -0.2975475, 3.045647, 0.03137255, 0, 1, 1,
0.3739715, 1.896125, 1.383196, 0.03921569, 0, 1, 1,
0.3755773, -1.423075, 1.803706, 0.04313726, 0, 1, 1,
0.3757372, -0.03805921, 3.535323, 0.05098039, 0, 1, 1,
0.3776756, 0.1717083, 1.691129, 0.05490196, 0, 1, 1,
0.3793942, 0.8137482, 0.5695958, 0.0627451, 0, 1, 1,
0.3878953, 0.1898274, 0.4850829, 0.06666667, 0, 1, 1,
0.3897245, -0.009135909, 0.1355802, 0.07450981, 0, 1, 1,
0.3898703, -1.388307, 2.525404, 0.07843138, 0, 1, 1,
0.3901875, 0.4198167, -0.9793249, 0.08627451, 0, 1, 1,
0.3914586, -0.500277, 2.310866, 0.09019608, 0, 1, 1,
0.3977603, 1.342582, 1.034082, 0.09803922, 0, 1, 1,
0.3977724, -1.411611, 3.538982, 0.1058824, 0, 1, 1,
0.4023384, 0.01543652, 0.4279794, 0.1098039, 0, 1, 1,
0.4079574, 1.613185, -0.4887081, 0.1176471, 0, 1, 1,
0.414125, -1.831637, 3.366508, 0.1215686, 0, 1, 1,
0.417231, 0.2179326, 0.2817264, 0.1294118, 0, 1, 1,
0.420592, -0.1592623, 2.938846, 0.1333333, 0, 1, 1,
0.421746, -1.236418, 4.481402, 0.1411765, 0, 1, 1,
0.4219286, -0.5010374, 0.295718, 0.145098, 0, 1, 1,
0.4258641, 1.751691, 0.9053025, 0.1529412, 0, 1, 1,
0.430227, 0.4023987, 2.180033, 0.1568628, 0, 1, 1,
0.4310567, -0.5760134, 3.987929, 0.1647059, 0, 1, 1,
0.4312035, 0.2862041, 0.2356505, 0.1686275, 0, 1, 1,
0.4338939, 0.613595, 0.478451, 0.1764706, 0, 1, 1,
0.4422127, -1.291031, 1.787756, 0.1803922, 0, 1, 1,
0.4430779, -0.5135392, 3.430977, 0.1882353, 0, 1, 1,
0.443395, 0.8787218, -0.5473812, 0.1921569, 0, 1, 1,
0.4494913, 0.2447586, 1.753921, 0.2, 0, 1, 1,
0.4526382, -0.1932452, 1.100315, 0.2078431, 0, 1, 1,
0.4560045, 1.233777, -1.340352, 0.2117647, 0, 1, 1,
0.4630191, -1.548812, 1.804066, 0.2196078, 0, 1, 1,
0.4630392, 1.209709, 0.9132324, 0.2235294, 0, 1, 1,
0.4741796, 0.7770309, -0.7907038, 0.2313726, 0, 1, 1,
0.4757467, -0.1133058, 0.8447622, 0.2352941, 0, 1, 1,
0.4759302, 0.1049387, 1.429873, 0.2431373, 0, 1, 1,
0.4834742, -0.9005069, 3.599058, 0.2470588, 0, 1, 1,
0.4878099, 1.449457, 0.3637881, 0.254902, 0, 1, 1,
0.488374, 0.7126467, 0.397201, 0.2588235, 0, 1, 1,
0.4958712, -0.3556177, 1.979756, 0.2666667, 0, 1, 1,
0.5019152, 0.9308769, 2.251971, 0.2705882, 0, 1, 1,
0.5021412, 0.2859305, 0.69788, 0.2784314, 0, 1, 1,
0.5100071, -0.7991295, 2.744671, 0.282353, 0, 1, 1,
0.5194009, -0.01493524, 2.506353, 0.2901961, 0, 1, 1,
0.519655, -2.242532, 2.248567, 0.2941177, 0, 1, 1,
0.536609, -0.4454809, 3.224518, 0.3019608, 0, 1, 1,
0.5376215, 0.421801, 0.9836194, 0.3098039, 0, 1, 1,
0.5416586, -0.333632, 2.408565, 0.3137255, 0, 1, 1,
0.5472153, 0.2114758, 0.07493319, 0.3215686, 0, 1, 1,
0.5480128, -1.287892, 0.6843643, 0.3254902, 0, 1, 1,
0.5481057, -0.8028147, 2.758897, 0.3333333, 0, 1, 1,
0.549118, 0.02144207, -0.4460315, 0.3372549, 0, 1, 1,
0.5623991, -0.6871698, 2.046293, 0.345098, 0, 1, 1,
0.563813, 1.005078, 1.207534, 0.3490196, 0, 1, 1,
0.5652261, -1.908657, 3.082219, 0.3568628, 0, 1, 1,
0.5728728, 0.5469164, -0.8579727, 0.3607843, 0, 1, 1,
0.573195, 0.9772353, 1.683818, 0.3686275, 0, 1, 1,
0.5751227, -0.01075055, 1.562927, 0.372549, 0, 1, 1,
0.5770536, -0.720639, 2.154704, 0.3803922, 0, 1, 1,
0.5795379, 0.9540057, 1.466025, 0.3843137, 0, 1, 1,
0.5799822, 1.777623, -0.9085406, 0.3921569, 0, 1, 1,
0.5814872, -0.3278202, 2.461243, 0.3960784, 0, 1, 1,
0.5826151, 0.4087841, 1.445202, 0.4039216, 0, 1, 1,
0.5852689, -0.007034936, 1.993676, 0.4117647, 0, 1, 1,
0.5881855, -0.6627308, 2.128438, 0.4156863, 0, 1, 1,
0.5882429, -0.7446453, 2.245216, 0.4235294, 0, 1, 1,
0.5882722, 1.206938, -0.1812638, 0.427451, 0, 1, 1,
0.6003492, -1.284544, 2.850762, 0.4352941, 0, 1, 1,
0.60035, -0.01960213, 1.78152, 0.4392157, 0, 1, 1,
0.6059242, 1.321936, -2.180433, 0.4470588, 0, 1, 1,
0.6061025, 0.7692989, 1.37605, 0.4509804, 0, 1, 1,
0.6065373, 1.202608, 0.4621115, 0.4588235, 0, 1, 1,
0.6095319, 0.7622815, -0.3180023, 0.4627451, 0, 1, 1,
0.6133546, -0.4625241, 2.110288, 0.4705882, 0, 1, 1,
0.6174336, -0.03592927, 1.383513, 0.4745098, 0, 1, 1,
0.62266, 2.101082, 0.7314481, 0.4823529, 0, 1, 1,
0.6235835, -0.4543933, 2.96293, 0.4862745, 0, 1, 1,
0.6240208, -0.7340547, 1.220961, 0.4941176, 0, 1, 1,
0.6244874, 0.117368, 2.571098, 0.5019608, 0, 1, 1,
0.6284343, -0.211285, 2.765078, 0.5058824, 0, 1, 1,
0.6289335, -0.4837924, 1.731716, 0.5137255, 0, 1, 1,
0.6309907, -0.2574362, 2.299906, 0.5176471, 0, 1, 1,
0.6364523, 0.3010065, 1.051404, 0.5254902, 0, 1, 1,
0.6458538, -0.02843929, 1.123514, 0.5294118, 0, 1, 1,
0.6477667, 0.519117, -0.3608042, 0.5372549, 0, 1, 1,
0.6479448, -0.2037497, 2.368444, 0.5411765, 0, 1, 1,
0.6565099, -1.141281, 3.730251, 0.5490196, 0, 1, 1,
0.6569772, -0.809635, 1.768592, 0.5529412, 0, 1, 1,
0.6570898, -0.150097, 3.170289, 0.5607843, 0, 1, 1,
0.6615479, -0.8965278, 2.686508, 0.5647059, 0, 1, 1,
0.6615556, -0.4946272, 2.960581, 0.572549, 0, 1, 1,
0.6635101, 1.902021, 1.17021, 0.5764706, 0, 1, 1,
0.664659, 1.58896, 0.4077765, 0.5843138, 0, 1, 1,
0.6714813, 0.1819666, 1.227691, 0.5882353, 0, 1, 1,
0.6734931, 0.0786315, 1.086449, 0.5960785, 0, 1, 1,
0.674411, 1.331935, -0.4276767, 0.6039216, 0, 1, 1,
0.6748229, -0.15641, 0.5394459, 0.6078432, 0, 1, 1,
0.6859264, 0.7915847, -0.4854265, 0.6156863, 0, 1, 1,
0.6870852, 0.7380151, 1.088941, 0.6196079, 0, 1, 1,
0.6872282, 0.3312095, -0.7370909, 0.627451, 0, 1, 1,
0.6894119, 2.414643, 0.5573323, 0.6313726, 0, 1, 1,
0.6919661, 1.718648, 1.599066, 0.6392157, 0, 1, 1,
0.6982591, 1.297955, 0.6638868, 0.6431373, 0, 1, 1,
0.7042301, 2.277287, -0.5484983, 0.6509804, 0, 1, 1,
0.7053289, -0.8819826, 2.159447, 0.654902, 0, 1, 1,
0.7090284, -0.758624, 1.954185, 0.6627451, 0, 1, 1,
0.7098583, 0.1568886, 0.3802619, 0.6666667, 0, 1, 1,
0.712285, -2.588374, 3.080304, 0.6745098, 0, 1, 1,
0.7127656, 0.9372936, -0.04395288, 0.6784314, 0, 1, 1,
0.7136222, -0.4218667, 0.9909071, 0.6862745, 0, 1, 1,
0.7169977, 0.2867922, 0.4504857, 0.6901961, 0, 1, 1,
0.7247947, 1.739968, 1.143022, 0.6980392, 0, 1, 1,
0.726855, 0.9860768, -0.7500401, 0.7058824, 0, 1, 1,
0.7329661, 2.18618, 1.547161, 0.7098039, 0, 1, 1,
0.7334439, -0.591495, 2.130615, 0.7176471, 0, 1, 1,
0.7342101, -0.2846496, 0.3328232, 0.7215686, 0, 1, 1,
0.7387352, -0.00283381, 0.5476117, 0.7294118, 0, 1, 1,
0.7459874, -0.9023229, 2.682379, 0.7333333, 0, 1, 1,
0.7495506, 0.120517, 0.8457894, 0.7411765, 0, 1, 1,
0.7510552, 0.5574176, -0.05211551, 0.7450981, 0, 1, 1,
0.7577822, 0.04899877, 0.02338239, 0.7529412, 0, 1, 1,
0.7597812, 0.1718154, 2.392374, 0.7568628, 0, 1, 1,
0.7654944, -1.024055, 3.572458, 0.7647059, 0, 1, 1,
0.7660325, -1.132429, 1.477386, 0.7686275, 0, 1, 1,
0.7665616, -1.849091, 2.096733, 0.7764706, 0, 1, 1,
0.7803339, 0.1178482, 3.370281, 0.7803922, 0, 1, 1,
0.7803392, 0.5917352, 1.265291, 0.7882353, 0, 1, 1,
0.7894881, -0.248062, 2.211981, 0.7921569, 0, 1, 1,
0.7906487, 0.4039549, 1.34541, 0.8, 0, 1, 1,
0.7913848, 0.8255734, 1.837578, 0.8078431, 0, 1, 1,
0.7935096, 1.0421, -0.0817159, 0.8117647, 0, 1, 1,
0.7959436, -0.04233556, 1.595216, 0.8196079, 0, 1, 1,
0.7960905, 0.3445227, 1.306465, 0.8235294, 0, 1, 1,
0.7988314, -0.1686926, 1.684581, 0.8313726, 0, 1, 1,
0.8020313, 0.5377899, 1.877751, 0.8352941, 0, 1, 1,
0.8036206, -1.503167, 1.367284, 0.8431373, 0, 1, 1,
0.8056073, -0.0316669, 0.8828247, 0.8470588, 0, 1, 1,
0.8099855, 0.5137186, 0.7988534, 0.854902, 0, 1, 1,
0.8115216, -1.152565, 2.462875, 0.8588235, 0, 1, 1,
0.8152767, -2.165707, 3.515219, 0.8666667, 0, 1, 1,
0.8162264, 0.717354, 2.630074, 0.8705882, 0, 1, 1,
0.8262861, 0.5812525, 1.422642, 0.8784314, 0, 1, 1,
0.8273755, -2.322761, 1.527069, 0.8823529, 0, 1, 1,
0.8325766, 0.1626688, 0.9218657, 0.8901961, 0, 1, 1,
0.8410727, -0.4695731, 0.01355766, 0.8941177, 0, 1, 1,
0.8444597, -0.6304716, 3.287818, 0.9019608, 0, 1, 1,
0.8459629, -0.7003101, 1.484367, 0.9098039, 0, 1, 1,
0.8512407, 1.11791, 0.9466704, 0.9137255, 0, 1, 1,
0.857401, 0.8201814, 0.7709382, 0.9215686, 0, 1, 1,
0.8574681, -2.578863, 3.742531, 0.9254902, 0, 1, 1,
0.8613437, -0.5514259, 1.769156, 0.9333333, 0, 1, 1,
0.8615007, 0.09014156, 0.5178314, 0.9372549, 0, 1, 1,
0.86516, 1.529192, 0.54118, 0.945098, 0, 1, 1,
0.8656068, 1.346778, -0.3600101, 0.9490196, 0, 1, 1,
0.8666915, -0.1878892, 3.082366, 0.9568627, 0, 1, 1,
0.8736747, 0.2824827, 0.4582626, 0.9607843, 0, 1, 1,
0.875681, -1.313199, 2.363356, 0.9686275, 0, 1, 1,
0.877658, 0.2110754, 0.3959578, 0.972549, 0, 1, 1,
0.8791662, 0.09193819, 1.215505, 0.9803922, 0, 1, 1,
0.8820687, 0.9261199, 0.2502174, 0.9843137, 0, 1, 1,
0.8890038, 0.6880955, 1.542075, 0.9921569, 0, 1, 1,
0.8970387, 0.0242731, 1.843407, 0.9960784, 0, 1, 1,
0.90358, 1.757953, 0.7780675, 1, 0, 0.9960784, 1,
0.907172, -0.8528615, 4.02527, 1, 0, 0.9882353, 1,
0.9110005, 1.029839, 2.242884, 1, 0, 0.9843137, 1,
0.9158791, -0.6965225, 1.722754, 1, 0, 0.9764706, 1,
0.9159861, 1.281333, 0.2214577, 1, 0, 0.972549, 1,
0.9163834, 1.017876, 2.570466, 1, 0, 0.9647059, 1,
0.9254839, -0.7179919, 1.769515, 1, 0, 0.9607843, 1,
0.9322072, -0.2903415, 1.824801, 1, 0, 0.9529412, 1,
0.9344157, 0.7487786, 0.61486, 1, 0, 0.9490196, 1,
0.9396333, 0.4384205, 1.407068, 1, 0, 0.9411765, 1,
0.9400313, -0.7025512, 2.521037, 1, 0, 0.9372549, 1,
0.9400671, 1.244043, 1.514079, 1, 0, 0.9294118, 1,
0.9410155, 0.2765279, 1.975901, 1, 0, 0.9254902, 1,
0.9417477, 0.3993792, 2.250476, 1, 0, 0.9176471, 1,
0.9451125, -1.726655, 2.111435, 1, 0, 0.9137255, 1,
0.9490496, -1.217969, 2.74754, 1, 0, 0.9058824, 1,
0.9600607, 0.8305092, -0.04328569, 1, 0, 0.9019608, 1,
0.9602813, 0.7606822, -0.01694294, 1, 0, 0.8941177, 1,
0.9615785, -0.92304, 4.150242, 1, 0, 0.8862745, 1,
0.9644002, 0.9439227, 0.8608339, 1, 0, 0.8823529, 1,
0.9796765, 0.4774348, 1.498341, 1, 0, 0.8745098, 1,
0.9893479, -0.2275978, 0.5012605, 1, 0, 0.8705882, 1,
0.9920284, -0.539756, 1.891647, 1, 0, 0.8627451, 1,
0.9928427, -1.375668, 0.408554, 1, 0, 0.8588235, 1,
0.9945211, -0.7671462, -0.6228619, 1, 0, 0.8509804, 1,
0.9993656, 0.4013855, 0.9405113, 1, 0, 0.8470588, 1,
1.004587, 1.370921, -1.193188, 1, 0, 0.8392157, 1,
1.017083, -1.786016, 2.806814, 1, 0, 0.8352941, 1,
1.018529, 0.4351106, 0.1219708, 1, 0, 0.827451, 1,
1.024972, 0.04189826, 0.6595259, 1, 0, 0.8235294, 1,
1.025101, 0.3238682, 1.136812, 1, 0, 0.8156863, 1,
1.028157, -1.774749, 2.360947, 1, 0, 0.8117647, 1,
1.036265, 1.33964, 1.359376, 1, 0, 0.8039216, 1,
1.053782, -0.9809189, 2.145676, 1, 0, 0.7960784, 1,
1.055887, -0.7999937, 1.541601, 1, 0, 0.7921569, 1,
1.057265, 1.271461, 0.03220178, 1, 0, 0.7843137, 1,
1.060326, 1.176678, 1.01684, 1, 0, 0.7803922, 1,
1.068914, 1.610119, -1.506962, 1, 0, 0.772549, 1,
1.06939, -0.812942, 1.73662, 1, 0, 0.7686275, 1,
1.069465, 0.2712088, 0.149499, 1, 0, 0.7607843, 1,
1.074624, 0.1921219, 3.004017, 1, 0, 0.7568628, 1,
1.074634, 0.8014661, 1.704011, 1, 0, 0.7490196, 1,
1.084873, 0.6866226, 1.635969, 1, 0, 0.7450981, 1,
1.088081, -0.9599074, 4.220328, 1, 0, 0.7372549, 1,
1.089796, 1.825771, 2.118138, 1, 0, 0.7333333, 1,
1.10301, -0.0177882, 1.9247, 1, 0, 0.7254902, 1,
1.114332, -0.5791612, 2.211523, 1, 0, 0.7215686, 1,
1.125058, -1.77636, -0.09199319, 1, 0, 0.7137255, 1,
1.126516, -1.309217, 2.809938, 1, 0, 0.7098039, 1,
1.12725, -1.363385, 2.396247, 1, 0, 0.7019608, 1,
1.132335, 1.104593, 0.002303176, 1, 0, 0.6941177, 1,
1.137318, -0.04071505, 1.752731, 1, 0, 0.6901961, 1,
1.139521, 1.413622, 1.233928, 1, 0, 0.682353, 1,
1.139826, -0.223844, 2.586601, 1, 0, 0.6784314, 1,
1.141123, -0.6336706, 1.326901, 1, 0, 0.6705883, 1,
1.150409, 0.681158, 1.112475, 1, 0, 0.6666667, 1,
1.155205, 1.253472, 0.3129106, 1, 0, 0.6588235, 1,
1.166922, -0.8060345, 1.677451, 1, 0, 0.654902, 1,
1.172921, 0.5714658, 1.667354, 1, 0, 0.6470588, 1,
1.183389, -0.2245344, 2.440235, 1, 0, 0.6431373, 1,
1.189884, -0.6120199, 2.407337, 1, 0, 0.6352941, 1,
1.197867, 1.004449, 1.420521, 1, 0, 0.6313726, 1,
1.201647, -1.159913, 1.786879, 1, 0, 0.6235294, 1,
1.203, -0.8341357, 0.5609426, 1, 0, 0.6196079, 1,
1.216523, -0.5806611, 0.3295532, 1, 0, 0.6117647, 1,
1.218014, -0.3260849, 0.5884215, 1, 0, 0.6078432, 1,
1.222841, -0.09245395, 1.277952, 1, 0, 0.6, 1,
1.231521, 1.266814, 1.945998, 1, 0, 0.5921569, 1,
1.239845, -0.3418182, 2.9071, 1, 0, 0.5882353, 1,
1.244917, 0.1042969, 1.805023, 1, 0, 0.5803922, 1,
1.25149, 0.2611163, 1.545829, 1, 0, 0.5764706, 1,
1.253082, -0.248785, 1.384225, 1, 0, 0.5686275, 1,
1.255339, 0.01903269, 0.449371, 1, 0, 0.5647059, 1,
1.258866, 1.621348e-05, 1.260183, 1, 0, 0.5568628, 1,
1.272787, 0.9365321, 0.2011664, 1, 0, 0.5529412, 1,
1.274928, 0.2531441, 1.932912, 1, 0, 0.5450981, 1,
1.284011, 0.01697059, 2.501825, 1, 0, 0.5411765, 1,
1.284123, -0.9126908, 1.916214, 1, 0, 0.5333334, 1,
1.303174, -1.737843, -1.039074, 1, 0, 0.5294118, 1,
1.311064, 0.1825161, 2.797022, 1, 0, 0.5215687, 1,
1.323038, -0.3558552, -0.2586644, 1, 0, 0.5176471, 1,
1.334519, 0.9797012, 2.17077, 1, 0, 0.509804, 1,
1.340572, -0.2853077, 3.327741, 1, 0, 0.5058824, 1,
1.349957, -0.61435, 1.908479, 1, 0, 0.4980392, 1,
1.351919, -0.3731728, 1.933471, 1, 0, 0.4901961, 1,
1.353285, 0.145177, 1.512649, 1, 0, 0.4862745, 1,
1.355328, -0.334637, 1.324718, 1, 0, 0.4784314, 1,
1.380625, -0.3230835, 0.4581095, 1, 0, 0.4745098, 1,
1.380732, -0.6982056, 2.674836, 1, 0, 0.4666667, 1,
1.385818, 0.9630117, 0.2411137, 1, 0, 0.4627451, 1,
1.388787, 0.3567567, 1.053811, 1, 0, 0.454902, 1,
1.389867, -1.098174, 2.899323, 1, 0, 0.4509804, 1,
1.394991, -0.7507508, 1.718354, 1, 0, 0.4431373, 1,
1.399622, -1.112535, 2.940816, 1, 0, 0.4392157, 1,
1.402948, -0.9327009, 2.06761, 1, 0, 0.4313726, 1,
1.422856, 0.3050026, 0.3080672, 1, 0, 0.427451, 1,
1.431409, -0.4269, 1.590986, 1, 0, 0.4196078, 1,
1.44355, -0.4444267, 1.460842, 1, 0, 0.4156863, 1,
1.446622, -1.877569, 1.819167, 1, 0, 0.4078431, 1,
1.460448, -0.6660271, 2.203616, 1, 0, 0.4039216, 1,
1.488384, 0.6015546, 2.516748, 1, 0, 0.3960784, 1,
1.490854, 0.2820224, 3.279972, 1, 0, 0.3882353, 1,
1.495065, 0.3194481, 0.9384348, 1, 0, 0.3843137, 1,
1.510617, 0.4424736, 1.255825, 1, 0, 0.3764706, 1,
1.510677, 0.9629385, 1.316123, 1, 0, 0.372549, 1,
1.522951, -0.7544936, 1.748185, 1, 0, 0.3647059, 1,
1.524235, -1.451256, 1.094326, 1, 0, 0.3607843, 1,
1.525982, 0.6140828, 1.956043, 1, 0, 0.3529412, 1,
1.527974, 2.454445, 1.757432, 1, 0, 0.3490196, 1,
1.532383, 1.42919, 0.7227032, 1, 0, 0.3411765, 1,
1.533957, -0.2279982, 1.263176, 1, 0, 0.3372549, 1,
1.535484, -0.4141733, 1.008243, 1, 0, 0.3294118, 1,
1.544667, -0.2465737, 2.951898, 1, 0, 0.3254902, 1,
1.562906, -0.1842164, 2.507742, 1, 0, 0.3176471, 1,
1.589632, 0.2396228, 1.612214, 1, 0, 0.3137255, 1,
1.596846, -1.33566, 1.822291, 1, 0, 0.3058824, 1,
1.597854, 1.090921, 0.03208805, 1, 0, 0.2980392, 1,
1.598274, 0.7634057, 1.399095, 1, 0, 0.2941177, 1,
1.606991, -1.258775, 2.350124, 1, 0, 0.2862745, 1,
1.618731, 0.06192378, 0.6857167, 1, 0, 0.282353, 1,
1.63809, 0.5533081, 1.728787, 1, 0, 0.2745098, 1,
1.662847, 0.26041, -0.02859409, 1, 0, 0.2705882, 1,
1.665074, -0.5539655, 4.419699, 1, 0, 0.2627451, 1,
1.678365, 0.4933248, 0.5767642, 1, 0, 0.2588235, 1,
1.684711, -0.09176269, 1.806353, 1, 0, 0.2509804, 1,
1.7011, -0.6734797, 1.370344, 1, 0, 0.2470588, 1,
1.701173, -1.476111, 1.103679, 1, 0, 0.2392157, 1,
1.703787, 0.01832899, 1.553838, 1, 0, 0.2352941, 1,
1.715199, 0.1906635, -0.4277027, 1, 0, 0.227451, 1,
1.71903, 0.09035654, 2.721363, 1, 0, 0.2235294, 1,
1.740088, 1.628491, 1.179638, 1, 0, 0.2156863, 1,
1.7454, 1.415987, -0.2041532, 1, 0, 0.2117647, 1,
1.755332, 0.1437427, 1.21799, 1, 0, 0.2039216, 1,
1.763485, 1.574727, 2.810488, 1, 0, 0.1960784, 1,
1.793579, 0.6895998, 2.739694, 1, 0, 0.1921569, 1,
1.808259, -0.2647748, 0.9832363, 1, 0, 0.1843137, 1,
1.847124, 0.5856109, 0.8505592, 1, 0, 0.1803922, 1,
1.851107, -0.2246611, 2.171798, 1, 0, 0.172549, 1,
1.857586, 0.3571774, 1.799469, 1, 0, 0.1686275, 1,
1.882967, -0.392424, 2.44633, 1, 0, 0.1607843, 1,
1.938806, 1.271343, 1.255101, 1, 0, 0.1568628, 1,
1.955297, 0.06357463, 2.492396, 1, 0, 0.1490196, 1,
1.984779, -1.215552, 2.72783, 1, 0, 0.145098, 1,
2.006639, 1.852517, -0.05104616, 1, 0, 0.1372549, 1,
2.033828, 0.9074374, 1.794767, 1, 0, 0.1333333, 1,
2.058756, -0.3611305, 2.42113, 1, 0, 0.1254902, 1,
2.100175, -0.03353813, 0.0186734, 1, 0, 0.1215686, 1,
2.105276, -1.09899, 3.800258, 1, 0, 0.1137255, 1,
2.119551, 0.1288029, 1.226007, 1, 0, 0.1098039, 1,
2.126683, -0.09916628, 1.319763, 1, 0, 0.1019608, 1,
2.127551, 0.5563272, -0.7034493, 1, 0, 0.09411765, 1,
2.128701, 0.02487996, 1.871958, 1, 0, 0.09019608, 1,
2.163744, -0.4466827, 1.459847, 1, 0, 0.08235294, 1,
2.184453, 1.970856, 0.7553669, 1, 0, 0.07843138, 1,
2.189703, 2.21704, 1.930157, 1, 0, 0.07058824, 1,
2.220779, -0.6770362, 2.573223, 1, 0, 0.06666667, 1,
2.320204, 0.06348284, 1.898764, 1, 0, 0.05882353, 1,
2.348234, -0.9316137, 2.987306, 1, 0, 0.05490196, 1,
2.388262, 1.032099, 2.736731, 1, 0, 0.04705882, 1,
2.421478, -0.9757968, 1.111002, 1, 0, 0.04313726, 1,
2.445301, -1.180791, 2.443649, 1, 0, 0.03529412, 1,
2.552418, -0.3481233, 0.916587, 1, 0, 0.03137255, 1,
2.7516, 0.6271716, 2.253167, 1, 0, 0.02352941, 1,
2.767829, -0.8935466, 1.574139, 1, 0, 0.01960784, 1,
2.979218, 0.2231826, 3.158582, 1, 0, 0.01176471, 1,
3.183074, -1.622479, 1.949327, 1, 0, 0.007843138, 1
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
0.03199673, -4.149472, -7.276917, 0, -0.5, 0.5, 0.5,
0.03199673, -4.149472, -7.276917, 1, -0.5, 0.5, 0.5,
0.03199673, -4.149472, -7.276917, 1, 1.5, 0.5, 0.5,
0.03199673, -4.149472, -7.276917, 0, 1.5, 0.5, 0.5
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
-4.187296, -0.003681064, -7.276917, 0, -0.5, 0.5, 0.5,
-4.187296, -0.003681064, -7.276917, 1, -0.5, 0.5, 0.5,
-4.187296, -0.003681064, -7.276917, 1, 1.5, 0.5, 0.5,
-4.187296, -0.003681064, -7.276917, 0, 1.5, 0.5, 0.5
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
-4.187296, -4.149472, -0.3156607, 0, -0.5, 0.5, 0.5,
-4.187296, -4.149472, -0.3156607, 1, -0.5, 0.5, 0.5,
-4.187296, -4.149472, -0.3156607, 1, 1.5, 0.5, 0.5,
-4.187296, -4.149472, -0.3156607, 0, 1.5, 0.5, 0.5
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
-3, -3.192751, -5.670473,
3, -3.192751, -5.670473,
-3, -3.192751, -5.670473,
-3, -3.352204, -5.938213,
-2, -3.192751, -5.670473,
-2, -3.352204, -5.938213,
-1, -3.192751, -5.670473,
-1, -3.352204, -5.938213,
0, -3.192751, -5.670473,
0, -3.352204, -5.938213,
1, -3.192751, -5.670473,
1, -3.352204, -5.938213,
2, -3.192751, -5.670473,
2, -3.352204, -5.938213,
3, -3.192751, -5.670473,
3, -3.352204, -5.938213
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
-3, -3.671111, -6.473694, 0, -0.5, 0.5, 0.5,
-3, -3.671111, -6.473694, 1, -0.5, 0.5, 0.5,
-3, -3.671111, -6.473694, 1, 1.5, 0.5, 0.5,
-3, -3.671111, -6.473694, 0, 1.5, 0.5, 0.5,
-2, -3.671111, -6.473694, 0, -0.5, 0.5, 0.5,
-2, -3.671111, -6.473694, 1, -0.5, 0.5, 0.5,
-2, -3.671111, -6.473694, 1, 1.5, 0.5, 0.5,
-2, -3.671111, -6.473694, 0, 1.5, 0.5, 0.5,
-1, -3.671111, -6.473694, 0, -0.5, 0.5, 0.5,
-1, -3.671111, -6.473694, 1, -0.5, 0.5, 0.5,
-1, -3.671111, -6.473694, 1, 1.5, 0.5, 0.5,
-1, -3.671111, -6.473694, 0, 1.5, 0.5, 0.5,
0, -3.671111, -6.473694, 0, -0.5, 0.5, 0.5,
0, -3.671111, -6.473694, 1, -0.5, 0.5, 0.5,
0, -3.671111, -6.473694, 1, 1.5, 0.5, 0.5,
0, -3.671111, -6.473694, 0, 1.5, 0.5, 0.5,
1, -3.671111, -6.473694, 0, -0.5, 0.5, 0.5,
1, -3.671111, -6.473694, 1, -0.5, 0.5, 0.5,
1, -3.671111, -6.473694, 1, 1.5, 0.5, 0.5,
1, -3.671111, -6.473694, 0, 1.5, 0.5, 0.5,
2, -3.671111, -6.473694, 0, -0.5, 0.5, 0.5,
2, -3.671111, -6.473694, 1, -0.5, 0.5, 0.5,
2, -3.671111, -6.473694, 1, 1.5, 0.5, 0.5,
2, -3.671111, -6.473694, 0, 1.5, 0.5, 0.5,
3, -3.671111, -6.473694, 0, -0.5, 0.5, 0.5,
3, -3.671111, -6.473694, 1, -0.5, 0.5, 0.5,
3, -3.671111, -6.473694, 1, 1.5, 0.5, 0.5,
3, -3.671111, -6.473694, 0, 1.5, 0.5, 0.5
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
-3.213613, -3, -5.670473,
-3.213613, 3, -5.670473,
-3.213613, -3, -5.670473,
-3.375894, -3, -5.938213,
-3.213613, -2, -5.670473,
-3.375894, -2, -5.938213,
-3.213613, -1, -5.670473,
-3.375894, -1, -5.938213,
-3.213613, 0, -5.670473,
-3.375894, 0, -5.938213,
-3.213613, 1, -5.670473,
-3.375894, 1, -5.938213,
-3.213613, 2, -5.670473,
-3.375894, 2, -5.938213,
-3.213613, 3, -5.670473,
-3.375894, 3, -5.938213
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
-3.700454, -3, -6.473694, 0, -0.5, 0.5, 0.5,
-3.700454, -3, -6.473694, 1, -0.5, 0.5, 0.5,
-3.700454, -3, -6.473694, 1, 1.5, 0.5, 0.5,
-3.700454, -3, -6.473694, 0, 1.5, 0.5, 0.5,
-3.700454, -2, -6.473694, 0, -0.5, 0.5, 0.5,
-3.700454, -2, -6.473694, 1, -0.5, 0.5, 0.5,
-3.700454, -2, -6.473694, 1, 1.5, 0.5, 0.5,
-3.700454, -2, -6.473694, 0, 1.5, 0.5, 0.5,
-3.700454, -1, -6.473694, 0, -0.5, 0.5, 0.5,
-3.700454, -1, -6.473694, 1, -0.5, 0.5, 0.5,
-3.700454, -1, -6.473694, 1, 1.5, 0.5, 0.5,
-3.700454, -1, -6.473694, 0, 1.5, 0.5, 0.5,
-3.700454, 0, -6.473694, 0, -0.5, 0.5, 0.5,
-3.700454, 0, -6.473694, 1, -0.5, 0.5, 0.5,
-3.700454, 0, -6.473694, 1, 1.5, 0.5, 0.5,
-3.700454, 0, -6.473694, 0, 1.5, 0.5, 0.5,
-3.700454, 1, -6.473694, 0, -0.5, 0.5, 0.5,
-3.700454, 1, -6.473694, 1, -0.5, 0.5, 0.5,
-3.700454, 1, -6.473694, 1, 1.5, 0.5, 0.5,
-3.700454, 1, -6.473694, 0, 1.5, 0.5, 0.5,
-3.700454, 2, -6.473694, 0, -0.5, 0.5, 0.5,
-3.700454, 2, -6.473694, 1, -0.5, 0.5, 0.5,
-3.700454, 2, -6.473694, 1, 1.5, 0.5, 0.5,
-3.700454, 2, -6.473694, 0, 1.5, 0.5, 0.5,
-3.700454, 3, -6.473694, 0, -0.5, 0.5, 0.5,
-3.700454, 3, -6.473694, 1, -0.5, 0.5, 0.5,
-3.700454, 3, -6.473694, 1, 1.5, 0.5, 0.5,
-3.700454, 3, -6.473694, 0, 1.5, 0.5, 0.5
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
-3.213613, -3.192751, -4,
-3.213613, -3.192751, 4,
-3.213613, -3.192751, -4,
-3.375894, -3.352204, -4,
-3.213613, -3.192751, -2,
-3.375894, -3.352204, -2,
-3.213613, -3.192751, 0,
-3.375894, -3.352204, 0,
-3.213613, -3.192751, 2,
-3.375894, -3.352204, 2,
-3.213613, -3.192751, 4,
-3.375894, -3.352204, 4
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
-3.700454, -3.671111, -4, 0, -0.5, 0.5, 0.5,
-3.700454, -3.671111, -4, 1, -0.5, 0.5, 0.5,
-3.700454, -3.671111, -4, 1, 1.5, 0.5, 0.5,
-3.700454, -3.671111, -4, 0, 1.5, 0.5, 0.5,
-3.700454, -3.671111, -2, 0, -0.5, 0.5, 0.5,
-3.700454, -3.671111, -2, 1, -0.5, 0.5, 0.5,
-3.700454, -3.671111, -2, 1, 1.5, 0.5, 0.5,
-3.700454, -3.671111, -2, 0, 1.5, 0.5, 0.5,
-3.700454, -3.671111, 0, 0, -0.5, 0.5, 0.5,
-3.700454, -3.671111, 0, 1, -0.5, 0.5, 0.5,
-3.700454, -3.671111, 0, 1, 1.5, 0.5, 0.5,
-3.700454, -3.671111, 0, 0, 1.5, 0.5, 0.5,
-3.700454, -3.671111, 2, 0, -0.5, 0.5, 0.5,
-3.700454, -3.671111, 2, 1, -0.5, 0.5, 0.5,
-3.700454, -3.671111, 2, 1, 1.5, 0.5, 0.5,
-3.700454, -3.671111, 2, 0, 1.5, 0.5, 0.5,
-3.700454, -3.671111, 4, 0, -0.5, 0.5, 0.5,
-3.700454, -3.671111, 4, 1, -0.5, 0.5, 0.5,
-3.700454, -3.671111, 4, 1, 1.5, 0.5, 0.5,
-3.700454, -3.671111, 4, 0, 1.5, 0.5, 0.5
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
-3.213613, -3.192751, -5.670473,
-3.213613, 3.185389, -5.670473,
-3.213613, -3.192751, 5.039151,
-3.213613, 3.185389, 5.039151,
-3.213613, -3.192751, -5.670473,
-3.213613, -3.192751, 5.039151,
-3.213613, 3.185389, -5.670473,
-3.213613, 3.185389, 5.039151,
-3.213613, -3.192751, -5.670473,
3.277606, -3.192751, -5.670473,
-3.213613, -3.192751, 5.039151,
3.277606, -3.192751, 5.039151,
-3.213613, 3.185389, -5.670473,
3.277606, 3.185389, -5.670473,
-3.213613, 3.185389, 5.039151,
3.277606, 3.185389, 5.039151,
3.277606, -3.192751, -5.670473,
3.277606, 3.185389, -5.670473,
3.277606, -3.192751, 5.039151,
3.277606, 3.185389, 5.039151,
3.277606, -3.192751, -5.670473,
3.277606, -3.192751, 5.039151,
3.277606, 3.185389, -5.670473,
3.277606, 3.185389, 5.039151
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
var radius = 7.50452;
var distance = 33.38846;
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
mvMatrix.translate( -0.03199673, 0.003681064, 0.3156607 );
mvMatrix.scale( 1.250001, 1.272163, 0.7576395 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.38846);
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
furilazole<-read.table("furilazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-furilazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'furilazole' not found
```

```r
y<-furilazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'furilazole' not found
```

```r
z<-furilazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'furilazole' not found
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
-3.119081, 0.5557052, -1.929598, 0, 0, 1, 1, 1,
-2.933446, 1.739137, -2.350621, 1, 0, 0, 1, 1,
-2.92848, -0.1726137, -1.296436, 1, 0, 0, 1, 1,
-2.646803, -1.567195, -1.622434, 1, 0, 0, 1, 1,
-2.516814, -1.446093, -2.953511, 1, 0, 0, 1, 1,
-2.501338, -1.932036, -2.094603, 1, 0, 0, 1, 1,
-2.477773, 1.294209, -0.5507783, 0, 0, 0, 1, 1,
-2.421988, 1.227525, -2.39904, 0, 0, 0, 1, 1,
-2.376959, -1.456004, -1.170208, 0, 0, 0, 1, 1,
-2.332573, -1.089754, -0.3219402, 0, 0, 0, 1, 1,
-2.302579, -2.849907, -2.748073, 0, 0, 0, 1, 1,
-2.287816, -1.175164, -2.231158, 0, 0, 0, 1, 1,
-2.280972, 1.247936, -1.622533, 0, 0, 0, 1, 1,
-2.280396, 0.3989596, -2.909642, 1, 1, 1, 1, 1,
-2.249427, -1.500072, -2.968923, 1, 1, 1, 1, 1,
-2.200074, 1.055187, -2.318981, 1, 1, 1, 1, 1,
-2.188079, 1.946976, -1.002217, 1, 1, 1, 1, 1,
-2.187816, -1.677122, -3.770661, 1, 1, 1, 1, 1,
-2.159461, -1.115796, -3.169965, 1, 1, 1, 1, 1,
-2.136709, 0.3475581, -2.542758, 1, 1, 1, 1, 1,
-2.104445, -0.8689448, -4.267392, 1, 1, 1, 1, 1,
-2.040061, -2.577082, -1.324719, 1, 1, 1, 1, 1,
-2.036139, 0.6335703, -0.9755041, 1, 1, 1, 1, 1,
-2.02596, 0.3318137, -1.77609, 1, 1, 1, 1, 1,
-2.02499, -0.121826, -1.575563, 1, 1, 1, 1, 1,
-2.014117, -0.5575427, -3.598331, 1, 1, 1, 1, 1,
-2.00561, 0.9100367, -3.033052, 1, 1, 1, 1, 1,
-1.970765, 1.304304, -0.6689494, 1, 1, 1, 1, 1,
-1.955266, -0.6679311, -1.195729, 0, 0, 1, 1, 1,
-1.934974, 0.3947073, -1.682203, 1, 0, 0, 1, 1,
-1.93097, 0.4176276, 0.6294835, 1, 0, 0, 1, 1,
-1.929972, 1.160944, -1.558927, 1, 0, 0, 1, 1,
-1.923809, 1.73915, -0.3736135, 1, 0, 0, 1, 1,
-1.920773, -0.03322833, -0.1498476, 1, 0, 0, 1, 1,
-1.916792, -0.5694999, -1.834578, 0, 0, 0, 1, 1,
-1.914522, 1.459154, 0.2372489, 0, 0, 0, 1, 1,
-1.912128, 0.1822577, -0.6144733, 0, 0, 0, 1, 1,
-1.90406, -0.4706185, -0.1655875, 0, 0, 0, 1, 1,
-1.891921, 0.3683097, -1.349638, 0, 0, 0, 1, 1,
-1.875135, 0.2099786, -2.260314, 0, 0, 0, 1, 1,
-1.863064, 1.026041, -0.9334764, 0, 0, 0, 1, 1,
-1.861751, 0.09469259, 0.2312263, 1, 1, 1, 1, 1,
-1.854629, -0.6117427, -2.726182, 1, 1, 1, 1, 1,
-1.839891, -1.073351, -0.9674087, 1, 1, 1, 1, 1,
-1.8291, -0.8895991, -1.637478, 1, 1, 1, 1, 1,
-1.828785, 1.237945, 0.1063928, 1, 1, 1, 1, 1,
-1.820051, -0.543405, -1.310488, 1, 1, 1, 1, 1,
-1.814535, 0.5169646, -2.484263, 1, 1, 1, 1, 1,
-1.809412, 0.3250202, -1.954223, 1, 1, 1, 1, 1,
-1.79305, 0.7477996, -1.964113, 1, 1, 1, 1, 1,
-1.792228, -1.502814, -2.861053, 1, 1, 1, 1, 1,
-1.770171, 0.6392037, -0.2291566, 1, 1, 1, 1, 1,
-1.749323, 1.247648, -1.640322, 1, 1, 1, 1, 1,
-1.733123, -0.5704139, -1.324038, 1, 1, 1, 1, 1,
-1.731038, -1.917507, -3.990909, 1, 1, 1, 1, 1,
-1.713097, -1.053075, -2.706507, 1, 1, 1, 1, 1,
-1.712851, -1.297792, -3.100131, 0, 0, 1, 1, 1,
-1.668642, -0.3163203, 0.109775, 1, 0, 0, 1, 1,
-1.663862, 0.139027, -1.447592, 1, 0, 0, 1, 1,
-1.655121, -1.388729, -3.081334, 1, 0, 0, 1, 1,
-1.653482, -0.4869415, -0.9024318, 1, 0, 0, 1, 1,
-1.648484, 0.9044459, -1.387435, 1, 0, 0, 1, 1,
-1.647821, -0.8164321, -0.05870548, 0, 0, 0, 1, 1,
-1.64624, 0.4448728, 0.7236129, 0, 0, 0, 1, 1,
-1.62422, 0.7670412, -1.069564, 0, 0, 0, 1, 1,
-1.616866, 0.3615036, -3.246022, 0, 0, 0, 1, 1,
-1.613475, 2.488086, -1.67444, 0, 0, 0, 1, 1,
-1.613438, -0.08505529, -2.517589, 0, 0, 0, 1, 1,
-1.602062, 1.365663, -0.7799302, 0, 0, 0, 1, 1,
-1.597155, -0.5252, -1.405707, 1, 1, 1, 1, 1,
-1.594933, 1.033406, -0.7685377, 1, 1, 1, 1, 1,
-1.587972, 0.423846, -2.80957, 1, 1, 1, 1, 1,
-1.574289, -0.9285178, -4.601923, 1, 1, 1, 1, 1,
-1.574117, -0.1231764, -1.619257, 1, 1, 1, 1, 1,
-1.562603, -2.187808, -2.038154, 1, 1, 1, 1, 1,
-1.557354, 1.108204, -0.5268686, 1, 1, 1, 1, 1,
-1.54627, -0.4975894, -0.9522243, 1, 1, 1, 1, 1,
-1.544701, -1.138106, -1.421786, 1, 1, 1, 1, 1,
-1.526001, -0.5394765, -2.269175, 1, 1, 1, 1, 1,
-1.521091, -1.267911, -2.527074, 1, 1, 1, 1, 1,
-1.516102, 1.057777, -2.320212, 1, 1, 1, 1, 1,
-1.512214, -0.1682794, -0.7998718, 1, 1, 1, 1, 1,
-1.509617, 0.9153666, -2.410298, 1, 1, 1, 1, 1,
-1.509017, -0.5840697, -4.560336, 1, 1, 1, 1, 1,
-1.504308, 0.1917462, -0.8914162, 0, 0, 1, 1, 1,
-1.503876, 0.7388546, 0.9844277, 1, 0, 0, 1, 1,
-1.502156, -0.2336525, -1.24897, 1, 0, 0, 1, 1,
-1.483995, 0.467126, -0.9887247, 1, 0, 0, 1, 1,
-1.437353, -0.08583852, -1.407017, 1, 0, 0, 1, 1,
-1.432416, 2.564326, -1.332151, 1, 0, 0, 1, 1,
-1.423782, -0.3466805, -5.13448, 0, 0, 0, 1, 1,
-1.414389, 1.626308, -1.576928, 0, 0, 0, 1, 1,
-1.40668, 0.3393947, -0.8620936, 0, 0, 0, 1, 1,
-1.405341, 0.3419944, -2.158043, 0, 0, 0, 1, 1,
-1.387383, -1.348447, -1.876952, 0, 0, 0, 1, 1,
-1.384395, 1.794571, -0.9218849, 0, 0, 0, 1, 1,
-1.384121, -0.6841879, -2.35458, 0, 0, 0, 1, 1,
-1.381573, 0.4590529, -2.181349, 1, 1, 1, 1, 1,
-1.376063, -1.259772, -2.488686, 1, 1, 1, 1, 1,
-1.369352, -0.6391326, -3.136487, 1, 1, 1, 1, 1,
-1.364706, 1.463314, -0.5878721, 1, 1, 1, 1, 1,
-1.359405, 0.6430683, -1.679652, 1, 1, 1, 1, 1,
-1.354449, 0.04828967, -1.808651, 1, 1, 1, 1, 1,
-1.349417, -0.1674718, -1.438001, 1, 1, 1, 1, 1,
-1.334718, -0.9081493, -2.178591, 1, 1, 1, 1, 1,
-1.3319, -1.401065, -1.843307, 1, 1, 1, 1, 1,
-1.326285, -1.420204, -2.38166, 1, 1, 1, 1, 1,
-1.324282, -1.163412, -3.46453, 1, 1, 1, 1, 1,
-1.324129, -0.2334139, -2.162151, 1, 1, 1, 1, 1,
-1.315077, 2.023476, -0.5307083, 1, 1, 1, 1, 1,
-1.312463, 0.2396823, -1.989629, 1, 1, 1, 1, 1,
-1.307997, -0.4708329, -2.410342, 1, 1, 1, 1, 1,
-1.298046, 0.03597108, -1.458699, 0, 0, 1, 1, 1,
-1.293894, 0.985417, -1.921315, 1, 0, 0, 1, 1,
-1.293262, 0.2560557, -4.419109, 1, 0, 0, 1, 1,
-1.281127, -0.04378159, -1.552048, 1, 0, 0, 1, 1,
-1.272452, 0.3899695, -1.82413, 1, 0, 0, 1, 1,
-1.26555, 1.007686, -1.715348, 1, 0, 0, 1, 1,
-1.261834, -1.056412, -1.654294, 0, 0, 0, 1, 1,
-1.25991, 1.515539, -0.8930073, 0, 0, 0, 1, 1,
-1.259745, -0.02140344, -3.031515, 0, 0, 0, 1, 1,
-1.248935, -0.9029132, -3.031452, 0, 0, 0, 1, 1,
-1.247291, 0.1248459, -0.9141736, 0, 0, 0, 1, 1,
-1.240113, -0.2196507, -2.944519, 0, 0, 0, 1, 1,
-1.236999, 0.5887577, 0.6883267, 0, 0, 0, 1, 1,
-1.236233, 0.5635118, -2.631777, 1, 1, 1, 1, 1,
-1.233527, -1.294684, -3.439149, 1, 1, 1, 1, 1,
-1.227001, -0.2897894, -2.907111, 1, 1, 1, 1, 1,
-1.205959, 1.522053, -1.175536, 1, 1, 1, 1, 1,
-1.194726, -0.1398224, -1.646134, 1, 1, 1, 1, 1,
-1.187313, -0.7886676, -1.125588, 1, 1, 1, 1, 1,
-1.183297, 0.1023574, -0.6161636, 1, 1, 1, 1, 1,
-1.173612, -0.8462798, -1.396208, 1, 1, 1, 1, 1,
-1.163779, -0.2469635, 0.9823232, 1, 1, 1, 1, 1,
-1.157938, 0.3139108, -1.730811, 1, 1, 1, 1, 1,
-1.139876, -0.9059553, -2.443264, 1, 1, 1, 1, 1,
-1.134224, 1.073349, -0.09902301, 1, 1, 1, 1, 1,
-1.125926, 0.4163189, -1.067696, 1, 1, 1, 1, 1,
-1.125873, -0.07845514, -3.041092, 1, 1, 1, 1, 1,
-1.120975, 0.3339895, -1.441429, 1, 1, 1, 1, 1,
-1.116799, -0.6642682, -2.72537, 0, 0, 1, 1, 1,
-1.112864, 1.393568, -1.544944, 1, 0, 0, 1, 1,
-1.111529, -0.188484, -1.570526, 1, 0, 0, 1, 1,
-1.109188, 0.06741226, -0.8825441, 1, 0, 0, 1, 1,
-1.104469, 0.8213191, 0.1651079, 1, 0, 0, 1, 1,
-1.094482, -0.971018, -2.226055, 1, 0, 0, 1, 1,
-1.087834, -1.414099, -3.161555, 0, 0, 0, 1, 1,
-1.085974, 0.009184732, -1.798139, 0, 0, 0, 1, 1,
-1.072601, -0.5780864, -2.296773, 0, 0, 0, 1, 1,
-1.070788, -0.2385069, -1.274724, 0, 0, 0, 1, 1,
-1.055925, 0.1785907, -0.6297134, 0, 0, 0, 1, 1,
-1.054529, -0.1639662, -0.6291557, 0, 0, 0, 1, 1,
-1.045901, 2.248818, 0.3373245, 0, 0, 0, 1, 1,
-1.044811, -1.836394, -5.058863, 1, 1, 1, 1, 1,
-1.035912, -0.5194803, -0.8665534, 1, 1, 1, 1, 1,
-1.030503, 2.014591, 0.3070597, 1, 1, 1, 1, 1,
-1.025946, -1.267979, -1.601676, 1, 1, 1, 1, 1,
-1.024538, 1.684261, -0.02755961, 1, 1, 1, 1, 1,
-1.018172, -2.081795, -3.158463, 1, 1, 1, 1, 1,
-1.007063, -0.9893337, -1.758753, 1, 1, 1, 1, 1,
-1.006812, -1.543909, -3.772459, 1, 1, 1, 1, 1,
-1.002331, 0.9519476, -0.1741066, 1, 1, 1, 1, 1,
-1.001651, 1.314747, -1.043949, 1, 1, 1, 1, 1,
-1.000337, -0.5474357, -1.212964, 1, 1, 1, 1, 1,
-0.9970052, -0.6342773, -2.703202, 1, 1, 1, 1, 1,
-0.9937459, 1.265562, 0.5898321, 1, 1, 1, 1, 1,
-0.9925657, -0.4113413, -0.9895823, 1, 1, 1, 1, 1,
-0.9823396, -0.9555683, -1.928369, 1, 1, 1, 1, 1,
-0.9785983, 1.148215, -2.377535, 0, 0, 1, 1, 1,
-0.9749694, 2.134063, -0.6710726, 1, 0, 0, 1, 1,
-0.9707023, -1.450439, -4.053479, 1, 0, 0, 1, 1,
-0.9653793, -1.456548, -1.52637, 1, 0, 0, 1, 1,
-0.9647005, -2.051931, -5.012923, 1, 0, 0, 1, 1,
-0.9515263, 0.8210371, -0.1375434, 1, 0, 0, 1, 1,
-0.9504849, 0.5977242, -1.06907, 0, 0, 0, 1, 1,
-0.949261, -0.07394328, -1.846063, 0, 0, 0, 1, 1,
-0.9465308, 1.05118, -1.472691, 0, 0, 0, 1, 1,
-0.9456717, -0.3045941, -1.256067, 0, 0, 0, 1, 1,
-0.9450573, -2.613425, -2.667098, 0, 0, 0, 1, 1,
-0.9429811, 1.041793, 1.387403, 0, 0, 0, 1, 1,
-0.9419628, -0.2702319, -2.107281, 0, 0, 0, 1, 1,
-0.9363958, -0.8259916, -3.678014, 1, 1, 1, 1, 1,
-0.9266893, 0.569728, -0.6478412, 1, 1, 1, 1, 1,
-0.9230229, 1.12671, 1.518226, 1, 1, 1, 1, 1,
-0.9217691, 0.03903341, -2.875308, 1, 1, 1, 1, 1,
-0.9172414, 1.486804, 0.8263968, 1, 1, 1, 1, 1,
-0.9162627, -0.1359177, -2.082106, 1, 1, 1, 1, 1,
-0.9058971, 0.2555575, -2.247869, 1, 1, 1, 1, 1,
-0.9020534, -1.508144, -2.675179, 1, 1, 1, 1, 1,
-0.8972644, 1.456041, -0.5921752, 1, 1, 1, 1, 1,
-0.8929511, 1.388671, -1.787647, 1, 1, 1, 1, 1,
-0.8905407, -0.544642, -3.57914, 1, 1, 1, 1, 1,
-0.8881672, -1.753906, -1.311887, 1, 1, 1, 1, 1,
-0.8867141, -2.568398, -2.315492, 1, 1, 1, 1, 1,
-0.8834836, 0.3579362, -0.0005576037, 1, 1, 1, 1, 1,
-0.881705, 0.8884123, 0.2308308, 1, 1, 1, 1, 1,
-0.8751833, 0.8454546, -0.6271331, 0, 0, 1, 1, 1,
-0.8715199, 0.1260377, 0.106176, 1, 0, 0, 1, 1,
-0.871114, -0.7781824, -4.052531, 1, 0, 0, 1, 1,
-0.8689272, -1.874984, -3.282578, 1, 0, 0, 1, 1,
-0.8685074, 0.4630431, -0.1637076, 1, 0, 0, 1, 1,
-0.8655949, 0.6092035, -0.926369, 1, 0, 0, 1, 1,
-0.8651007, 0.261182, -1.554311, 0, 0, 0, 1, 1,
-0.8639706, -0.08682889, -1.652332, 0, 0, 0, 1, 1,
-0.8619378, -0.829971, -0.8519519, 0, 0, 0, 1, 1,
-0.8613527, 0.9288351, -2.899659, 0, 0, 0, 1, 1,
-0.8598468, -0.1857327, -1.013364, 0, 0, 0, 1, 1,
-0.8547935, 0.1330127, -1.620787, 0, 0, 0, 1, 1,
-0.8336959, 2.002592, 0.7274804, 0, 0, 0, 1, 1,
-0.8307199, -0.270519, -1.091694, 1, 1, 1, 1, 1,
-0.827216, 1.236858, -0.4818932, 1, 1, 1, 1, 1,
-0.8259065, 1.810719, -1.228269, 1, 1, 1, 1, 1,
-0.8238612, -0.7408203, -1.66669, 1, 1, 1, 1, 1,
-0.818656, 0.9120014, -1.7011, 1, 1, 1, 1, 1,
-0.8182381, -0.504087, -2.20066, 1, 1, 1, 1, 1,
-0.8140998, 0.7251556, -2.00494, 1, 1, 1, 1, 1,
-0.8133024, -0.9536783, -1.933115, 1, 1, 1, 1, 1,
-0.8131916, 1.144572, -2.19002, 1, 1, 1, 1, 1,
-0.8068488, -1.079972, -3.253453, 1, 1, 1, 1, 1,
-0.8047422, -0.7861408, -1.421154, 1, 1, 1, 1, 1,
-0.8018603, -0.0755817, -2.572355, 1, 1, 1, 1, 1,
-0.7982819, 0.3013484, -0.6086893, 1, 1, 1, 1, 1,
-0.7892291, -0.7040815, -1.167243, 1, 1, 1, 1, 1,
-0.7891207, -1.243175, -1.386498, 1, 1, 1, 1, 1,
-0.7887176, 0.9954718, -1.050644, 0, 0, 1, 1, 1,
-0.7833072, 1.133541, -1.327584, 1, 0, 0, 1, 1,
-0.7831714, -1.541675, -4.330522, 1, 0, 0, 1, 1,
-0.7801328, 1.803026, 0.006635469, 1, 0, 0, 1, 1,
-0.7770457, 0.3337663, -4.136246, 1, 0, 0, 1, 1,
-0.776371, -0.6991879, -1.143044, 1, 0, 0, 1, 1,
-0.7754173, 0.5151326, -0.6114038, 0, 0, 0, 1, 1,
-0.7742522, -0.7609317, -0.9961501, 0, 0, 0, 1, 1,
-0.7727108, 1.014083, -0.1891699, 0, 0, 0, 1, 1,
-0.7722096, 0.06411958, -1.773888, 0, 0, 0, 1, 1,
-0.7712325, 0.3461777, 0.4917223, 0, 0, 0, 1, 1,
-0.7660747, 0.5307316, -0.5341034, 0, 0, 0, 1, 1,
-0.7612649, 0.3824419, -1.256413, 0, 0, 0, 1, 1,
-0.7574424, 0.3255945, 0.08991829, 1, 1, 1, 1, 1,
-0.745939, -0.1810405, -0.6721726, 1, 1, 1, 1, 1,
-0.7405655, 1.150051, -0.630917, 1, 1, 1, 1, 1,
-0.730845, 0.4911777, -1.770167, 1, 1, 1, 1, 1,
-0.730793, -0.05294491, -1.054776, 1, 1, 1, 1, 1,
-0.7304441, -0.03320988, -1.751116, 1, 1, 1, 1, 1,
-0.728698, -0.9165411, -1.933514, 1, 1, 1, 1, 1,
-0.7253733, 0.477151, -1.038157, 1, 1, 1, 1, 1,
-0.7238554, 0.6334409, -0.2806904, 1, 1, 1, 1, 1,
-0.7211587, 0.06369547, -1.449792, 1, 1, 1, 1, 1,
-0.7170647, -1.451783, -1.594332, 1, 1, 1, 1, 1,
-0.715575, 1.298207, -0.2510977, 1, 1, 1, 1, 1,
-0.7141229, -1.314104, -4.577425, 1, 1, 1, 1, 1,
-0.7110174, -0.08834234, -0.04425538, 1, 1, 1, 1, 1,
-0.7103127, 1.238796, 0.1193482, 1, 1, 1, 1, 1,
-0.7076637, 1.045638, 0.08039318, 0, 0, 1, 1, 1,
-0.7065717, 0.04805686, 0.3845626, 1, 0, 0, 1, 1,
-0.7043321, 1.014518, 0.1112853, 1, 0, 0, 1, 1,
-0.7016367, -0.8564212, -1.677047, 1, 0, 0, 1, 1,
-0.6991196, -0.3329036, -1.80351, 1, 0, 0, 1, 1,
-0.6975014, -0.172579, -1.531431, 1, 0, 0, 1, 1,
-0.6882064, -1.498392, -3.258837, 0, 0, 0, 1, 1,
-0.687052, 1.189808, -2.100172, 0, 0, 0, 1, 1,
-0.679235, 0.958836, -0.8580911, 0, 0, 0, 1, 1,
-0.6780058, -0.2284374, -1.472729, 0, 0, 0, 1, 1,
-0.6776303, -2.216102, -2.496698, 0, 0, 0, 1, 1,
-0.6762079, -2.296284, -3.174163, 0, 0, 0, 1, 1,
-0.6747159, -1.257613, -3.335618, 0, 0, 0, 1, 1,
-0.6741714, -2.54944, -2.318269, 1, 1, 1, 1, 1,
-0.6681524, 0.4765355, 0.3980218, 1, 1, 1, 1, 1,
-0.6669112, -0.5995315, -2.919187, 1, 1, 1, 1, 1,
-0.6662706, -0.01433988, -2.113487, 1, 1, 1, 1, 1,
-0.660509, -0.3748452, 0.7164003, 1, 1, 1, 1, 1,
-0.6596462, 0.7797802, -1.790955, 1, 1, 1, 1, 1,
-0.6550978, -0.02739975, -1.343453, 1, 1, 1, 1, 1,
-0.6454365, 0.5513507, 0.08362402, 1, 1, 1, 1, 1,
-0.6398979, -0.4263106, -3.120896, 1, 1, 1, 1, 1,
-0.6387379, 0.07037499, -1.751096, 1, 1, 1, 1, 1,
-0.6349399, -1.075459, -2.604164, 1, 1, 1, 1, 1,
-0.6309542, 1.313926, 0.8962844, 1, 1, 1, 1, 1,
-0.6307466, -0.0483076, -0.2352924, 1, 1, 1, 1, 1,
-0.6260855, -0.2342333, -2.884461, 1, 1, 1, 1, 1,
-0.6223688, -0.9028214, -3.823595, 1, 1, 1, 1, 1,
-0.6181351, 0.2817034, -2.435299, 0, 0, 1, 1, 1,
-0.6143299, 0.4811177, -0.556672, 1, 0, 0, 1, 1,
-0.6099334, 0.5585644, -1.503967, 1, 0, 0, 1, 1,
-0.5967906, -0.9771445, -1.600743, 1, 0, 0, 1, 1,
-0.5922059, 1.027332, 0.4456802, 1, 0, 0, 1, 1,
-0.5907468, -1.573801, -1.173062, 1, 0, 0, 1, 1,
-0.5861517, 0.8844682, -0.782139, 0, 0, 0, 1, 1,
-0.5843584, -0.3363847, -1.575066, 0, 0, 0, 1, 1,
-0.5830124, 0.734937, -1.581668, 0, 0, 0, 1, 1,
-0.5821123, -1.47986, -2.167103, 0, 0, 0, 1, 1,
-0.5742478, 0.6478596, -0.768863, 0, 0, 0, 1, 1,
-0.5728987, 1.567185, 0.7476207, 0, 0, 0, 1, 1,
-0.5721697, -0.466193, -1.492468, 0, 0, 0, 1, 1,
-0.5704024, 1.833265, -0.1582665, 1, 1, 1, 1, 1,
-0.5685388, -1.163345, -2.309368, 1, 1, 1, 1, 1,
-0.5595262, 0.1574452, -1.671233, 1, 1, 1, 1, 1,
-0.5595056, 1.545478, -0.5452777, 1, 1, 1, 1, 1,
-0.5580842, -0.9463541, -3.535098, 1, 1, 1, 1, 1,
-0.5501174, -0.1501554, -1.573888, 1, 1, 1, 1, 1,
-0.550086, -1.186508, -2.019342, 1, 1, 1, 1, 1,
-0.5484365, -1.542442, -2.95468, 1, 1, 1, 1, 1,
-0.5350438, -0.1970568, -2.006756, 1, 1, 1, 1, 1,
-0.5342895, 0.03005909, -3.808385, 1, 1, 1, 1, 1,
-0.5323763, -0.03691122, -1.957366, 1, 1, 1, 1, 1,
-0.5300307, -0.4480934, -2.958679, 1, 1, 1, 1, 1,
-0.522379, -0.6708612, -1.940124, 1, 1, 1, 1, 1,
-0.5216586, -0.1715699, -0.5680624, 1, 1, 1, 1, 1,
-0.5214369, -0.3806711, -3.68451, 1, 1, 1, 1, 1,
-0.5168315, -1.527542, -2.076457, 0, 0, 1, 1, 1,
-0.5162956, -0.3842086, -2.887969, 1, 0, 0, 1, 1,
-0.5128666, -1.574924, -0.9664879, 1, 0, 0, 1, 1,
-0.5046626, -0.8294382, -1.322381, 1, 0, 0, 1, 1,
-0.5019776, -1.101847, -2.27103, 1, 0, 0, 1, 1,
-0.500106, -1.303831, -3.765987, 1, 0, 0, 1, 1,
-0.4984457, 0.928268, 1.601291, 0, 0, 0, 1, 1,
-0.4904646, -0.09740724, -0.7458987, 0, 0, 0, 1, 1,
-0.4870044, 0.9620106, -3.698413, 0, 0, 0, 1, 1,
-0.4859221, 1.549803, -1.166511, 0, 0, 0, 1, 1,
-0.4854369, 0.6994968, -1.463959, 0, 0, 0, 1, 1,
-0.4832723, 0.03065715, -1.232056, 0, 0, 0, 1, 1,
-0.4787852, 0.6803635, -0.6968225, 0, 0, 0, 1, 1,
-0.4718106, 0.800446, -1.579776, 1, 1, 1, 1, 1,
-0.4716089, -0.6406696, -2.311869, 1, 1, 1, 1, 1,
-0.4713806, 0.6859807, -0.02315984, 1, 1, 1, 1, 1,
-0.4712587, -1.569673, -3.901156, 1, 1, 1, 1, 1,
-0.4644603, -1.426474, -3.670685, 1, 1, 1, 1, 1,
-0.4631349, -1.675163, -3.485368, 1, 1, 1, 1, 1,
-0.460948, 0.6989857, -0.349601, 1, 1, 1, 1, 1,
-0.4559461, -2.275669, -2.698294, 1, 1, 1, 1, 1,
-0.4550843, -0.5901173, -1.514679, 1, 1, 1, 1, 1,
-0.4501883, 0.2316243, 0.1900844, 1, 1, 1, 1, 1,
-0.4428541, -0.2532488, -0.9284708, 1, 1, 1, 1, 1,
-0.4416048, 0.8699518, -2.805149, 1, 1, 1, 1, 1,
-0.4333327, -0.003364069, -1.908072, 1, 1, 1, 1, 1,
-0.4323637, 0.4484894, -0.1738224, 1, 1, 1, 1, 1,
-0.4310726, 0.4142602, -0.2965645, 1, 1, 1, 1, 1,
-0.4304913, -0.5239373, -2.848708, 0, 0, 1, 1, 1,
-0.4287767, -1.167835, -1.072506, 1, 0, 0, 1, 1,
-0.4260649, 0.5452591, -0.7952752, 1, 0, 0, 1, 1,
-0.4250444, -1.748721, -3.157674, 1, 0, 0, 1, 1,
-0.4243217, 0.5653125, -0.7220271, 1, 0, 0, 1, 1,
-0.4226882, -0.9381256, -2.409709, 1, 0, 0, 1, 1,
-0.4187416, 1.523793, -0.2744221, 0, 0, 0, 1, 1,
-0.4155149, 0.6512432, -0.6950565, 0, 0, 0, 1, 1,
-0.4117343, -0.9094126, -1.37154, 0, 0, 0, 1, 1,
-0.4103889, 0.9275419, -0.233268, 0, 0, 0, 1, 1,
-0.4081772, -0.9287834, -1.801869, 0, 0, 0, 1, 1,
-0.4062182, 0.4798378, -0.9554063, 0, 0, 0, 1, 1,
-0.4055722, 0.2549795, -2.911806, 0, 0, 0, 1, 1,
-0.4050432, 0.4915078, 1.150192, 1, 1, 1, 1, 1,
-0.4015943, 1.567448, 1.935991, 1, 1, 1, 1, 1,
-0.3952068, 0.4593612, -1.057385, 1, 1, 1, 1, 1,
-0.3921638, -0.2293808, -0.8324419, 1, 1, 1, 1, 1,
-0.3889508, 1.442767, -0.589931, 1, 1, 1, 1, 1,
-0.3888925, -0.001584714, -1.475339, 1, 1, 1, 1, 1,
-0.3878098, 0.06948458, -2.17676, 1, 1, 1, 1, 1,
-0.3855692, 0.01904099, -2.167485, 1, 1, 1, 1, 1,
-0.3848966, 1.534955, 1.463046, 1, 1, 1, 1, 1,
-0.38485, 1.966467, -1.126128, 1, 1, 1, 1, 1,
-0.380629, 0.8066558, -2.004954, 1, 1, 1, 1, 1,
-0.3768747, -0.9336202, -2.950248, 1, 1, 1, 1, 1,
-0.3761524, 1.129466, -0.4848391, 1, 1, 1, 1, 1,
-0.3704275, 0.4637126, 0.7459759, 1, 1, 1, 1, 1,
-0.3680716, -0.02263759, -2.461016, 1, 1, 1, 1, 1,
-0.3572146, -1.239635, -2.885816, 0, 0, 1, 1, 1,
-0.356714, 0.1886694, 0.3228004, 1, 0, 0, 1, 1,
-0.3566333, 2.404848, 0.2495395, 1, 0, 0, 1, 1,
-0.355055, 0.3079207, -1.560516, 1, 0, 0, 1, 1,
-0.3527522, 0.9460357, -0.03929167, 1, 0, 0, 1, 1,
-0.3518124, -0.07299371, -2.390363, 1, 0, 0, 1, 1,
-0.3490264, 0.7692096, -0.6659483, 0, 0, 0, 1, 1,
-0.3413948, -0.1270133, -2.473504, 0, 0, 0, 1, 1,
-0.3402844, 0.7391701, -0.4943627, 0, 0, 0, 1, 1,
-0.3390775, -0.9840586, -2.920309, 0, 0, 0, 1, 1,
-0.3388678, -1.114491, -1.929267, 0, 0, 0, 1, 1,
-0.3388107, -0.3307853, -2.138633, 0, 0, 0, 1, 1,
-0.3376598, -0.6805304, -2.860315, 0, 0, 0, 1, 1,
-0.3364015, -0.3493219, -3.740925, 1, 1, 1, 1, 1,
-0.3340596, 0.3859116, 1.264461, 1, 1, 1, 1, 1,
-0.3267923, -2.398853, -2.386774, 1, 1, 1, 1, 1,
-0.3226266, -0.1033423, -0.4023051, 1, 1, 1, 1, 1,
-0.3225303, 0.2879879, -1.19303, 1, 1, 1, 1, 1,
-0.3208087, 2.12423, -0.70494, 1, 1, 1, 1, 1,
-0.3144466, 0.9066721, -0.495947, 1, 1, 1, 1, 1,
-0.3091349, -0.7707468, -2.486509, 1, 1, 1, 1, 1,
-0.307792, 0.4534822, 1.813887, 1, 1, 1, 1, 1,
-0.3072614, 0.9300883, 0.9679517, 1, 1, 1, 1, 1,
-0.3042279, 0.8174417, -1.390014, 1, 1, 1, 1, 1,
-0.3032663, -0.04743459, -2.979077, 1, 1, 1, 1, 1,
-0.3025412, 0.1053775, -1.04644, 1, 1, 1, 1, 1,
-0.2997852, -0.06590223, -0.5051578, 1, 1, 1, 1, 1,
-0.2995229, -0.5843241, -3.599554, 1, 1, 1, 1, 1,
-0.2969015, 0.2956485, 0.7780139, 0, 0, 1, 1, 1,
-0.2951298, 1.119628, -1.041882, 1, 0, 0, 1, 1,
-0.2885872, 0.8946061, 0.06465565, 1, 0, 0, 1, 1,
-0.2860785, 0.3718631, 0.1409841, 1, 0, 0, 1, 1,
-0.2841565, -0.4679964, -2.20939, 1, 0, 0, 1, 1,
-0.2833526, 0.05804437, -0.9770995, 1, 0, 0, 1, 1,
-0.2721049, 0.6993762, -0.5112501, 0, 0, 0, 1, 1,
-0.2648745, 0.8988868, 0.3698931, 0, 0, 0, 1, 1,
-0.2648598, -0.07092734, -4.675216, 0, 0, 0, 1, 1,
-0.2596412, -0.8879438, -4.324749, 0, 0, 0, 1, 1,
-0.2582473, -2.468185, -1.603267, 0, 0, 0, 1, 1,
-0.2561674, 0.8327262, 0.8965944, 0, 0, 0, 1, 1,
-0.2521291, 1.743238, -0.6358991, 0, 0, 0, 1, 1,
-0.2510188, 0.4787767, 1.597329, 1, 1, 1, 1, 1,
-0.2452916, 0.05493836, 0.5770107, 1, 1, 1, 1, 1,
-0.2388818, 0.5773058, 0.2231083, 1, 1, 1, 1, 1,
-0.2334365, -0.6508081, -3.032951, 1, 1, 1, 1, 1,
-0.2331436, 0.2606111, -0.7697078, 1, 1, 1, 1, 1,
-0.228108, 0.5145383, 0.3850092, 1, 1, 1, 1, 1,
-0.2277357, -0.8937535, -2.529592, 1, 1, 1, 1, 1,
-0.2275087, -0.3768917, -1.608651, 1, 1, 1, 1, 1,
-0.226771, -1.053698, -2.772959, 1, 1, 1, 1, 1,
-0.225837, -0.1057387, -1.463523, 1, 1, 1, 1, 1,
-0.2241081, 1.297998, 0.2265038, 1, 1, 1, 1, 1,
-0.2228675, 0.1937489, 1.221596, 1, 1, 1, 1, 1,
-0.2214478, -0.3639122, -2.583467, 1, 1, 1, 1, 1,
-0.2164612, 0.5878719, 0.4464094, 1, 1, 1, 1, 1,
-0.2142882, 0.2886349, -2.270416, 1, 1, 1, 1, 1,
-0.2141469, -0.2719788, -1.708532, 0, 0, 1, 1, 1,
-0.2134958, -0.3128504, -4.180053, 1, 0, 0, 1, 1,
-0.2125868, 0.1595436, 0.2244348, 1, 0, 0, 1, 1,
-0.2116983, 2.386173, 0.6554729, 1, 0, 0, 1, 1,
-0.2099188, 0.6268266, -0.05481778, 1, 0, 0, 1, 1,
-0.2030694, 1.48812, -0.7869568, 1, 0, 0, 1, 1,
-0.2018306, -0.4547384, -1.947743, 0, 0, 0, 1, 1,
-0.201621, -0.1649609, -2.352437, 0, 0, 0, 1, 1,
-0.2013786, 0.6415552, 0.5030258, 0, 0, 0, 1, 1,
-0.1966939, -1.393948, -4.788227, 0, 0, 0, 1, 1,
-0.1955799, -1.80374, -2.588754, 0, 0, 0, 1, 1,
-0.1925579, -1.247936, -3.374133, 0, 0, 0, 1, 1,
-0.1913801, 1.040999, 2.138824, 0, 0, 0, 1, 1,
-0.1903654, 1.021404, 0.2797083, 1, 1, 1, 1, 1,
-0.1883123, -0.1686184, -0.7049204, 1, 1, 1, 1, 1,
-0.182252, 1.720529, 0.5561998, 1, 1, 1, 1, 1,
-0.1799448, 0.001082983, -2.204694, 1, 1, 1, 1, 1,
-0.1798177, -0.2819332, -3.037728, 1, 1, 1, 1, 1,
-0.1748284, -0.499335, -2.360414, 1, 1, 1, 1, 1,
-0.173602, -0.2811882, -2.621973, 1, 1, 1, 1, 1,
-0.1729622, 1.026193, 0.9745722, 1, 1, 1, 1, 1,
-0.1714165, -1.184606, -4.393077, 1, 1, 1, 1, 1,
-0.1708342, -3.083673, -2.932527, 1, 1, 1, 1, 1,
-0.1695433, -1.248949, -2.624807, 1, 1, 1, 1, 1,
-0.1685899, -0.3390402, -3.272222, 1, 1, 1, 1, 1,
-0.166836, -1.115334, -3.434905, 1, 1, 1, 1, 1,
-0.1631503, -1.332647, -3.308069, 1, 1, 1, 1, 1,
-0.1622287, 1.213125, 1.161013, 1, 1, 1, 1, 1,
-0.1606063, 0.6365739, 0.4715325, 0, 0, 1, 1, 1,
-0.157342, -0.1979008, -2.301295, 1, 0, 0, 1, 1,
-0.1539645, -0.2295687, -3.029355, 1, 0, 0, 1, 1,
-0.1497371, -0.8958048, -3.660537, 1, 0, 0, 1, 1,
-0.1460869, 0.1535516, -0.8274849, 1, 0, 0, 1, 1,
-0.1426482, 0.8469141, -0.4011674, 1, 0, 0, 1, 1,
-0.1421178, -1.834704, -2.196949, 0, 0, 0, 1, 1,
-0.140232, 0.3551748, -0.2049906, 0, 0, 0, 1, 1,
-0.1336982, 1.208475, -0.1754801, 0, 0, 0, 1, 1,
-0.1312639, -0.2704307, -0.4732816, 0, 0, 0, 1, 1,
-0.1295359, 0.4987386, -1.698651, 0, 0, 0, 1, 1,
-0.1277437, 0.7553676, -0.411489, 0, 0, 0, 1, 1,
-0.1204282, 2.413099, 0.1986138, 0, 0, 0, 1, 1,
-0.1201942, 0.1751298, -0.188952, 1, 1, 1, 1, 1,
-0.1192456, -0.2134036, -2.935389, 1, 1, 1, 1, 1,
-0.1155288, 0.09286872, 0.7944537, 1, 1, 1, 1, 1,
-0.1143259, -0.4800288, -4.179443, 1, 1, 1, 1, 1,
-0.1131191, 0.8176876, 1.199146, 1, 1, 1, 1, 1,
-0.1067861, 1.201381, -0.8127885, 1, 1, 1, 1, 1,
-0.1051057, -0.272563, -4.251256, 1, 1, 1, 1, 1,
-0.1049173, 1.195435, 0.7510427, 1, 1, 1, 1, 1,
-0.1039269, 0.01587381, -0.5093876, 1, 1, 1, 1, 1,
-0.1002483, -2.755815, -3.702044, 1, 1, 1, 1, 1,
-0.09987014, 1.507283, -0.3552096, 1, 1, 1, 1, 1,
-0.09812525, -0.9949757, -4.036986, 1, 1, 1, 1, 1,
-0.09470597, -1.570116, -2.615868, 1, 1, 1, 1, 1,
-0.0943379, 0.8100196, 0.4757081, 1, 1, 1, 1, 1,
-0.09344929, 1.534467, 0.1936374, 1, 1, 1, 1, 1,
-0.09304238, -0.334091, -1.771391, 0, 0, 1, 1, 1,
-0.08979038, 0.06313526, -0.1572606, 1, 0, 0, 1, 1,
-0.08070337, 0.8310612, -0.4454523, 1, 0, 0, 1, 1,
-0.07590777, -0.6102832, -3.052092, 1, 0, 0, 1, 1,
-0.07164624, 1.123611, 0.233283, 1, 0, 0, 1, 1,
-0.07074424, -0.01161803, -1.674553, 1, 0, 0, 1, 1,
-0.06750726, -0.4390937, -3.332897, 0, 0, 0, 1, 1,
-0.06333885, 1.491314, -1.139627, 0, 0, 0, 1, 1,
-0.06251575, 0.5014148, -1.833709, 0, 0, 0, 1, 1,
-0.05825464, 2.349451, -1.12979, 0, 0, 0, 1, 1,
-0.05587118, 1.188085, 0.6777635, 0, 0, 0, 1, 1,
-0.05165745, 1.237529, 0.3468614, 0, 0, 0, 1, 1,
-0.0515653, -0.5471388, -2.781394, 0, 0, 0, 1, 1,
-0.0470701, -1.662408, -2.835896, 1, 1, 1, 1, 1,
-0.04559292, 1.860172, 0.2020513, 1, 1, 1, 1, 1,
-0.04353612, 0.8056575, 2.005542, 1, 1, 1, 1, 1,
-0.03807679, 1.268572, 0.03841795, 1, 1, 1, 1, 1,
-0.0369781, -0.4033854, -4.088512, 1, 1, 1, 1, 1,
-0.03628993, 0.9452544, -2.067858, 1, 1, 1, 1, 1,
-0.03543322, -0.6095811, -5.173212, 1, 1, 1, 1, 1,
-0.03243618, -0.3462979, -2.683855, 1, 1, 1, 1, 1,
-0.03032146, -0.9270292, -2.816797, 1, 1, 1, 1, 1,
-0.03026104, -0.2491652, -3.0065, 1, 1, 1, 1, 1,
-0.02977214, -0.0001191169, -2.934673, 1, 1, 1, 1, 1,
-0.02618135, 0.6229315, -0.6226887, 1, 1, 1, 1, 1,
-0.02211941, -0.4847191, -2.741156, 1, 1, 1, 1, 1,
-0.01903193, 0.9275483, -0.5999588, 1, 1, 1, 1, 1,
-0.01834766, 0.1890976, 0.808964, 1, 1, 1, 1, 1,
-0.01436973, 0.9532677, 0.1166637, 0, 0, 1, 1, 1,
-0.01397985, 1.417326, -1.211511, 1, 0, 0, 1, 1,
-0.01270313, -0.4581951, -1.947129, 1, 0, 0, 1, 1,
-0.009137356, -0.3594094, -1.89975, 1, 0, 0, 1, 1,
-0.004035169, -0.6087886, -5.514507, 1, 0, 0, 1, 1,
-0.0006523528, 1.247607, -1.217097, 1, 0, 0, 1, 1,
0.001803495, -0.3296551, 2.993385, 0, 0, 0, 1, 1,
0.004785712, 0.7370682, 0.03374051, 0, 0, 0, 1, 1,
0.005661617, 0.6689106, 0.9392107, 0, 0, 0, 1, 1,
0.007769232, 0.04302398, 0.1465025, 0, 0, 0, 1, 1,
0.01035528, -0.627319, 2.762765, 0, 0, 0, 1, 1,
0.0158715, -0.7809597, 1.715778, 0, 0, 0, 1, 1,
0.02335942, -0.3100253, 0.8515197, 0, 0, 0, 1, 1,
0.02462923, 0.1392959, 0.4584166, 1, 1, 1, 1, 1,
0.02962149, -1.601516, 4.323966, 1, 1, 1, 1, 1,
0.03145467, 0.7338447, -0.5637871, 1, 1, 1, 1, 1,
0.03263589, -1.649247, 2.870252, 1, 1, 1, 1, 1,
0.03416254, 1.258758, 0.5469094, 1, 1, 1, 1, 1,
0.03654286, 0.06116901, 0.6471369, 1, 1, 1, 1, 1,
0.03731303, -2.198063, 3.685586, 1, 1, 1, 1, 1,
0.03748472, 2.254922, -0.02866597, 1, 1, 1, 1, 1,
0.03748631, -0.1320988, 4.100923, 1, 1, 1, 1, 1,
0.03750113, -1.175164, 2.669609, 1, 1, 1, 1, 1,
0.03861877, -3.099865, 4.178277, 1, 1, 1, 1, 1,
0.04383645, -0.7482031, 3.086398, 1, 1, 1, 1, 1,
0.05006916, 0.01644389, 0.8744872, 1, 1, 1, 1, 1,
0.06022142, -1.322419, 3.893488, 1, 1, 1, 1, 1,
0.06186913, -0.8130949, 2.763629, 1, 1, 1, 1, 1,
0.06318416, 0.7057145, -0.9422377, 0, 0, 1, 1, 1,
0.06821932, -0.8599691, 2.442338, 1, 0, 0, 1, 1,
0.07139265, 0.08266149, -0.9276807, 1, 0, 0, 1, 1,
0.07351305, -0.5383625, 2.759562, 1, 0, 0, 1, 1,
0.07795199, -0.4969332, 2.953304, 1, 0, 0, 1, 1,
0.07797826, 0.9391115, 0.3682856, 1, 0, 0, 1, 1,
0.08202392, -0.586202, 2.011119, 0, 0, 0, 1, 1,
0.08226866, -1.429375, 2.525579, 0, 0, 0, 1, 1,
0.08473878, -0.5137623, 3.902609, 0, 0, 0, 1, 1,
0.09133977, -1.179391, 3.29445, 0, 0, 0, 1, 1,
0.09459417, -0.2372943, 2.179971, 0, 0, 0, 1, 1,
0.09893466, 0.5873713, 0.615876, 0, 0, 0, 1, 1,
0.09978381, 0.9519544, 0.2375472, 0, 0, 0, 1, 1,
0.1016505, -0.3771099, 3.638349, 1, 1, 1, 1, 1,
0.1016809, -0.06389096, 2.770307, 1, 1, 1, 1, 1,
0.1023643, 1.198135, 0.3946499, 1, 1, 1, 1, 1,
0.10267, -1.116165, 1.621955, 1, 1, 1, 1, 1,
0.1038441, 0.699011, 2.033962, 1, 1, 1, 1, 1,
0.1043802, 0.5001433, -0.2566613, 1, 1, 1, 1, 1,
0.105759, 0.2663955, -0.3525197, 1, 1, 1, 1, 1,
0.1124568, 0.09616464, 0.3334739, 1, 1, 1, 1, 1,
0.1211299, -0.3627361, 0.340326, 1, 1, 1, 1, 1,
0.1224937, -1.150564, 2.579332, 1, 1, 1, 1, 1,
0.1262835, -0.3775534, 3.521801, 1, 1, 1, 1, 1,
0.1287754, -2.129065, 1.364109, 1, 1, 1, 1, 1,
0.1341675, 0.6605357, 1.433312, 1, 1, 1, 1, 1,
0.1380926, 0.7365706, 1.308178, 1, 1, 1, 1, 1,
0.1408278, 0.8864256, 0.4211127, 1, 1, 1, 1, 1,
0.1421405, 0.7665088, -0.9121587, 0, 0, 1, 1, 1,
0.1466446, 0.05362711, 2.491224, 1, 0, 0, 1, 1,
0.1476792, 1.619062, 0.0302331, 1, 0, 0, 1, 1,
0.1478593, 0.189684, -1.453012, 1, 0, 0, 1, 1,
0.148353, 0.4780711, 0.7385854, 1, 0, 0, 1, 1,
0.1495908, 0.645904, 1.907718, 1, 0, 0, 1, 1,
0.1517018, -0.4576821, 3.160761, 0, 0, 0, 1, 1,
0.153516, 0.581337, -0.8793324, 0, 0, 0, 1, 1,
0.1536158, 1.453129, -0.06262156, 0, 0, 0, 1, 1,
0.154001, -1.322434, 2.09091, 0, 0, 0, 1, 1,
0.1561525, -2.860048, 3.051965, 0, 0, 0, 1, 1,
0.159417, 1.990579, -0.1686346, 0, 0, 0, 1, 1,
0.1605138, -1.639434, 2.020795, 0, 0, 0, 1, 1,
0.162569, -0.2535888, 3.537307, 1, 1, 1, 1, 1,
0.1628385, 1.758894, -1.661521, 1, 1, 1, 1, 1,
0.1631383, 0.05591679, 1.856999, 1, 1, 1, 1, 1,
0.1639471, 1.381432, -0.8831496, 1, 1, 1, 1, 1,
0.1647964, 1.392259, -0.4659598, 1, 1, 1, 1, 1,
0.1671026, -0.8051179, 1.811654, 1, 1, 1, 1, 1,
0.168168, -0.4870128, 3.954194, 1, 1, 1, 1, 1,
0.1702834, 0.6892838, 0.7950166, 1, 1, 1, 1, 1,
0.1723019, 0.06786309, 0.5818836, 1, 1, 1, 1, 1,
0.1739387, -1.386728, 2.192776, 1, 1, 1, 1, 1,
0.1742271, -0.6787687, 1.123081, 1, 1, 1, 1, 1,
0.1747658, 3.092503, -0.5186172, 1, 1, 1, 1, 1,
0.1777396, -0.6159748, 0.880034, 1, 1, 1, 1, 1,
0.1778192, 0.9429734, 0.4495543, 1, 1, 1, 1, 1,
0.1823333, 0.7676637, 1.279126, 1, 1, 1, 1, 1,
0.1826823, 1.628168, -1.087785, 0, 0, 1, 1, 1,
0.186468, -0.5220587, 2.719126, 1, 0, 0, 1, 1,
0.1865222, 1.014638, -0.4919392, 1, 0, 0, 1, 1,
0.1867171, -0.02813041, 2.167568, 1, 0, 0, 1, 1,
0.1881272, 0.4263769, 0.5959118, 1, 0, 0, 1, 1,
0.1888712, 0.8915552, 1.510844, 1, 0, 0, 1, 1,
0.189932, 0.602672, 0.09594668, 0, 0, 0, 1, 1,
0.1927654, 1.123436, -1.011851, 0, 0, 0, 1, 1,
0.1944789, -0.01201229, 1.931436, 0, 0, 0, 1, 1,
0.1948238, 1.679712, -0.2802145, 0, 0, 0, 1, 1,
0.1997683, 0.8875819, -0.1872779, 0, 0, 0, 1, 1,
0.2012531, -0.51553, 3.870344, 0, 0, 0, 1, 1,
0.2033392, 0.04122993, 0.989152, 0, 0, 0, 1, 1,
0.2053474, 1.03603, -0.9494327, 1, 1, 1, 1, 1,
0.2059591, 1.129936, -1.180765, 1, 1, 1, 1, 1,
0.2072195, 0.1093038, 1.333825, 1, 1, 1, 1, 1,
0.2087357, 0.744873, -0.09448256, 1, 1, 1, 1, 1,
0.2090304, 1.344232, 0.2335724, 1, 1, 1, 1, 1,
0.210467, 0.7093433, 0.2346744, 1, 1, 1, 1, 1,
0.2169552, 0.6443514, -0.1537496, 1, 1, 1, 1, 1,
0.216997, 1.669372, 0.4886543, 1, 1, 1, 1, 1,
0.2183231, 0.9001192, -0.541323, 1, 1, 1, 1, 1,
0.2213736, -1.76847, 4.700343, 1, 1, 1, 1, 1,
0.221843, 0.7976817, 1.617285, 1, 1, 1, 1, 1,
0.2275559, 1.089059, 0.3667368, 1, 1, 1, 1, 1,
0.2283031, 0.9012515, -0.8740938, 1, 1, 1, 1, 1,
0.2308768, -0.3517046, 2.42635, 1, 1, 1, 1, 1,
0.2363806, 1.104394, -0.0530743, 1, 1, 1, 1, 1,
0.2366843, 0.1773938, -0.8965265, 0, 0, 1, 1, 1,
0.2379378, -0.8792147, 3.719199, 1, 0, 0, 1, 1,
0.2385913, -0.538464, 3.166292, 1, 0, 0, 1, 1,
0.2404687, -2.591319, 2.988447, 1, 0, 0, 1, 1,
0.2432172, 0.7988058, -0.3623206, 1, 0, 0, 1, 1,
0.24352, -0.7145989, 1.560335, 1, 0, 0, 1, 1,
0.2436413, 1.533317, -0.3461575, 0, 0, 0, 1, 1,
0.2516308, 0.4225128, -0.0867823, 0, 0, 0, 1, 1,
0.2554576, 0.5604105, 0.7071969, 0, 0, 0, 1, 1,
0.2578394, -0.1840186, 1.79474, 0, 0, 0, 1, 1,
0.2587939, 1.375489, -0.9502223, 0, 0, 0, 1, 1,
0.2591147, -0.5503066, 1.251167, 0, 0, 0, 1, 1,
0.266727, -0.01734086, 2.68404, 0, 0, 0, 1, 1,
0.2689154, 0.4584453, -0.3123645, 1, 1, 1, 1, 1,
0.2721917, -0.01278028, 3.193079, 1, 1, 1, 1, 1,
0.2722071, -0.2342031, 2.976692, 1, 1, 1, 1, 1,
0.2723196, -0.6881754, 2.667585, 1, 1, 1, 1, 1,
0.2725932, -2.015832, 2.870375, 1, 1, 1, 1, 1,
0.2737487, 0.3731723, 0.1695186, 1, 1, 1, 1, 1,
0.2751803, 0.7896683, 0.03841621, 1, 1, 1, 1, 1,
0.2775802, 0.7292407, 1.313909, 1, 1, 1, 1, 1,
0.2791771, -1.111171, 3.08787, 1, 1, 1, 1, 1,
0.2793245, 0.6992817, -0.07334021, 1, 1, 1, 1, 1,
0.2824731, -2.651457, 2.422389, 1, 1, 1, 1, 1,
0.2860739, 0.005263236, 3.012866, 1, 1, 1, 1, 1,
0.2866804, -0.117393, 2.864495, 1, 1, 1, 1, 1,
0.2874072, -0.3163369, 2.047084, 1, 1, 1, 1, 1,
0.2878678, -0.9557227, 4.030148, 1, 1, 1, 1, 1,
0.2909435, 0.3045687, 0.2382877, 0, 0, 1, 1, 1,
0.2970817, -1.903599, 4.883186, 1, 0, 0, 1, 1,
0.3007407, 0.6865218, 0.7702799, 1, 0, 0, 1, 1,
0.3012252, -0.9484051, 3.942791, 1, 0, 0, 1, 1,
0.3017223, -0.6332509, 2.576122, 1, 0, 0, 1, 1,
0.3071308, -0.7368201, 1.791981, 1, 0, 0, 1, 1,
0.3091376, -0.3457674, 0.2730124, 0, 0, 0, 1, 1,
0.3117565, 1.504421, 0.7003054, 0, 0, 0, 1, 1,
0.3137554, 0.628067, 1.021608, 0, 0, 0, 1, 1,
0.3171325, -0.7075324, 2.011075, 0, 0, 0, 1, 1,
0.3199465, 1.01846, -0.5109421, 0, 0, 0, 1, 1,
0.3233135, 0.2593778, 0.7060735, 0, 0, 0, 1, 1,
0.3273196, 0.6311401, 1.028628, 0, 0, 0, 1, 1,
0.330748, 0.1148038, -0.07113762, 1, 1, 1, 1, 1,
0.330895, -0.3658793, 3.254537, 1, 1, 1, 1, 1,
0.333214, -0.5363908, 2.983573, 1, 1, 1, 1, 1,
0.3351619, -1.190321, 4.186281, 1, 1, 1, 1, 1,
0.3363668, 0.7080868, 1.325785, 1, 1, 1, 1, 1,
0.3376514, -1.877517, 2.176522, 1, 1, 1, 1, 1,
0.3398897, 0.9032753, 1.031861, 1, 1, 1, 1, 1,
0.3430627, -1.288736, 3.895745, 1, 1, 1, 1, 1,
0.3436938, 0.30709, 1.640995, 1, 1, 1, 1, 1,
0.3489977, -1.612931, 4.003815, 1, 1, 1, 1, 1,
0.3493775, -0.140282, 1.277961, 1, 1, 1, 1, 1,
0.3600264, 0.6294377, 0.5851364, 1, 1, 1, 1, 1,
0.3618146, 0.299189, 1.821305, 1, 1, 1, 1, 1,
0.3633983, -2.421513, 0.8837342, 1, 1, 1, 1, 1,
0.3672249, 1.763346, 1.056497, 1, 1, 1, 1, 1,
0.3721879, -0.2975475, 3.045647, 0, 0, 1, 1, 1,
0.3739715, 1.896125, 1.383196, 1, 0, 0, 1, 1,
0.3755773, -1.423075, 1.803706, 1, 0, 0, 1, 1,
0.3757372, -0.03805921, 3.535323, 1, 0, 0, 1, 1,
0.3776756, 0.1717083, 1.691129, 1, 0, 0, 1, 1,
0.3793942, 0.8137482, 0.5695958, 1, 0, 0, 1, 1,
0.3878953, 0.1898274, 0.4850829, 0, 0, 0, 1, 1,
0.3897245, -0.009135909, 0.1355802, 0, 0, 0, 1, 1,
0.3898703, -1.388307, 2.525404, 0, 0, 0, 1, 1,
0.3901875, 0.4198167, -0.9793249, 0, 0, 0, 1, 1,
0.3914586, -0.500277, 2.310866, 0, 0, 0, 1, 1,
0.3977603, 1.342582, 1.034082, 0, 0, 0, 1, 1,
0.3977724, -1.411611, 3.538982, 0, 0, 0, 1, 1,
0.4023384, 0.01543652, 0.4279794, 1, 1, 1, 1, 1,
0.4079574, 1.613185, -0.4887081, 1, 1, 1, 1, 1,
0.414125, -1.831637, 3.366508, 1, 1, 1, 1, 1,
0.417231, 0.2179326, 0.2817264, 1, 1, 1, 1, 1,
0.420592, -0.1592623, 2.938846, 1, 1, 1, 1, 1,
0.421746, -1.236418, 4.481402, 1, 1, 1, 1, 1,
0.4219286, -0.5010374, 0.295718, 1, 1, 1, 1, 1,
0.4258641, 1.751691, 0.9053025, 1, 1, 1, 1, 1,
0.430227, 0.4023987, 2.180033, 1, 1, 1, 1, 1,
0.4310567, -0.5760134, 3.987929, 1, 1, 1, 1, 1,
0.4312035, 0.2862041, 0.2356505, 1, 1, 1, 1, 1,
0.4338939, 0.613595, 0.478451, 1, 1, 1, 1, 1,
0.4422127, -1.291031, 1.787756, 1, 1, 1, 1, 1,
0.4430779, -0.5135392, 3.430977, 1, 1, 1, 1, 1,
0.443395, 0.8787218, -0.5473812, 1, 1, 1, 1, 1,
0.4494913, 0.2447586, 1.753921, 0, 0, 1, 1, 1,
0.4526382, -0.1932452, 1.100315, 1, 0, 0, 1, 1,
0.4560045, 1.233777, -1.340352, 1, 0, 0, 1, 1,
0.4630191, -1.548812, 1.804066, 1, 0, 0, 1, 1,
0.4630392, 1.209709, 0.9132324, 1, 0, 0, 1, 1,
0.4741796, 0.7770309, -0.7907038, 1, 0, 0, 1, 1,
0.4757467, -0.1133058, 0.8447622, 0, 0, 0, 1, 1,
0.4759302, 0.1049387, 1.429873, 0, 0, 0, 1, 1,
0.4834742, -0.9005069, 3.599058, 0, 0, 0, 1, 1,
0.4878099, 1.449457, 0.3637881, 0, 0, 0, 1, 1,
0.488374, 0.7126467, 0.397201, 0, 0, 0, 1, 1,
0.4958712, -0.3556177, 1.979756, 0, 0, 0, 1, 1,
0.5019152, 0.9308769, 2.251971, 0, 0, 0, 1, 1,
0.5021412, 0.2859305, 0.69788, 1, 1, 1, 1, 1,
0.5100071, -0.7991295, 2.744671, 1, 1, 1, 1, 1,
0.5194009, -0.01493524, 2.506353, 1, 1, 1, 1, 1,
0.519655, -2.242532, 2.248567, 1, 1, 1, 1, 1,
0.536609, -0.4454809, 3.224518, 1, 1, 1, 1, 1,
0.5376215, 0.421801, 0.9836194, 1, 1, 1, 1, 1,
0.5416586, -0.333632, 2.408565, 1, 1, 1, 1, 1,
0.5472153, 0.2114758, 0.07493319, 1, 1, 1, 1, 1,
0.5480128, -1.287892, 0.6843643, 1, 1, 1, 1, 1,
0.5481057, -0.8028147, 2.758897, 1, 1, 1, 1, 1,
0.549118, 0.02144207, -0.4460315, 1, 1, 1, 1, 1,
0.5623991, -0.6871698, 2.046293, 1, 1, 1, 1, 1,
0.563813, 1.005078, 1.207534, 1, 1, 1, 1, 1,
0.5652261, -1.908657, 3.082219, 1, 1, 1, 1, 1,
0.5728728, 0.5469164, -0.8579727, 1, 1, 1, 1, 1,
0.573195, 0.9772353, 1.683818, 0, 0, 1, 1, 1,
0.5751227, -0.01075055, 1.562927, 1, 0, 0, 1, 1,
0.5770536, -0.720639, 2.154704, 1, 0, 0, 1, 1,
0.5795379, 0.9540057, 1.466025, 1, 0, 0, 1, 1,
0.5799822, 1.777623, -0.9085406, 1, 0, 0, 1, 1,
0.5814872, -0.3278202, 2.461243, 1, 0, 0, 1, 1,
0.5826151, 0.4087841, 1.445202, 0, 0, 0, 1, 1,
0.5852689, -0.007034936, 1.993676, 0, 0, 0, 1, 1,
0.5881855, -0.6627308, 2.128438, 0, 0, 0, 1, 1,
0.5882429, -0.7446453, 2.245216, 0, 0, 0, 1, 1,
0.5882722, 1.206938, -0.1812638, 0, 0, 0, 1, 1,
0.6003492, -1.284544, 2.850762, 0, 0, 0, 1, 1,
0.60035, -0.01960213, 1.78152, 0, 0, 0, 1, 1,
0.6059242, 1.321936, -2.180433, 1, 1, 1, 1, 1,
0.6061025, 0.7692989, 1.37605, 1, 1, 1, 1, 1,
0.6065373, 1.202608, 0.4621115, 1, 1, 1, 1, 1,
0.6095319, 0.7622815, -0.3180023, 1, 1, 1, 1, 1,
0.6133546, -0.4625241, 2.110288, 1, 1, 1, 1, 1,
0.6174336, -0.03592927, 1.383513, 1, 1, 1, 1, 1,
0.62266, 2.101082, 0.7314481, 1, 1, 1, 1, 1,
0.6235835, -0.4543933, 2.96293, 1, 1, 1, 1, 1,
0.6240208, -0.7340547, 1.220961, 1, 1, 1, 1, 1,
0.6244874, 0.117368, 2.571098, 1, 1, 1, 1, 1,
0.6284343, -0.211285, 2.765078, 1, 1, 1, 1, 1,
0.6289335, -0.4837924, 1.731716, 1, 1, 1, 1, 1,
0.6309907, -0.2574362, 2.299906, 1, 1, 1, 1, 1,
0.6364523, 0.3010065, 1.051404, 1, 1, 1, 1, 1,
0.6458538, -0.02843929, 1.123514, 1, 1, 1, 1, 1,
0.6477667, 0.519117, -0.3608042, 0, 0, 1, 1, 1,
0.6479448, -0.2037497, 2.368444, 1, 0, 0, 1, 1,
0.6565099, -1.141281, 3.730251, 1, 0, 0, 1, 1,
0.6569772, -0.809635, 1.768592, 1, 0, 0, 1, 1,
0.6570898, -0.150097, 3.170289, 1, 0, 0, 1, 1,
0.6615479, -0.8965278, 2.686508, 1, 0, 0, 1, 1,
0.6615556, -0.4946272, 2.960581, 0, 0, 0, 1, 1,
0.6635101, 1.902021, 1.17021, 0, 0, 0, 1, 1,
0.664659, 1.58896, 0.4077765, 0, 0, 0, 1, 1,
0.6714813, 0.1819666, 1.227691, 0, 0, 0, 1, 1,
0.6734931, 0.0786315, 1.086449, 0, 0, 0, 1, 1,
0.674411, 1.331935, -0.4276767, 0, 0, 0, 1, 1,
0.6748229, -0.15641, 0.5394459, 0, 0, 0, 1, 1,
0.6859264, 0.7915847, -0.4854265, 1, 1, 1, 1, 1,
0.6870852, 0.7380151, 1.088941, 1, 1, 1, 1, 1,
0.6872282, 0.3312095, -0.7370909, 1, 1, 1, 1, 1,
0.6894119, 2.414643, 0.5573323, 1, 1, 1, 1, 1,
0.6919661, 1.718648, 1.599066, 1, 1, 1, 1, 1,
0.6982591, 1.297955, 0.6638868, 1, 1, 1, 1, 1,
0.7042301, 2.277287, -0.5484983, 1, 1, 1, 1, 1,
0.7053289, -0.8819826, 2.159447, 1, 1, 1, 1, 1,
0.7090284, -0.758624, 1.954185, 1, 1, 1, 1, 1,
0.7098583, 0.1568886, 0.3802619, 1, 1, 1, 1, 1,
0.712285, -2.588374, 3.080304, 1, 1, 1, 1, 1,
0.7127656, 0.9372936, -0.04395288, 1, 1, 1, 1, 1,
0.7136222, -0.4218667, 0.9909071, 1, 1, 1, 1, 1,
0.7169977, 0.2867922, 0.4504857, 1, 1, 1, 1, 1,
0.7247947, 1.739968, 1.143022, 1, 1, 1, 1, 1,
0.726855, 0.9860768, -0.7500401, 0, 0, 1, 1, 1,
0.7329661, 2.18618, 1.547161, 1, 0, 0, 1, 1,
0.7334439, -0.591495, 2.130615, 1, 0, 0, 1, 1,
0.7342101, -0.2846496, 0.3328232, 1, 0, 0, 1, 1,
0.7387352, -0.00283381, 0.5476117, 1, 0, 0, 1, 1,
0.7459874, -0.9023229, 2.682379, 1, 0, 0, 1, 1,
0.7495506, 0.120517, 0.8457894, 0, 0, 0, 1, 1,
0.7510552, 0.5574176, -0.05211551, 0, 0, 0, 1, 1,
0.7577822, 0.04899877, 0.02338239, 0, 0, 0, 1, 1,
0.7597812, 0.1718154, 2.392374, 0, 0, 0, 1, 1,
0.7654944, -1.024055, 3.572458, 0, 0, 0, 1, 1,
0.7660325, -1.132429, 1.477386, 0, 0, 0, 1, 1,
0.7665616, -1.849091, 2.096733, 0, 0, 0, 1, 1,
0.7803339, 0.1178482, 3.370281, 1, 1, 1, 1, 1,
0.7803392, 0.5917352, 1.265291, 1, 1, 1, 1, 1,
0.7894881, -0.248062, 2.211981, 1, 1, 1, 1, 1,
0.7906487, 0.4039549, 1.34541, 1, 1, 1, 1, 1,
0.7913848, 0.8255734, 1.837578, 1, 1, 1, 1, 1,
0.7935096, 1.0421, -0.0817159, 1, 1, 1, 1, 1,
0.7959436, -0.04233556, 1.595216, 1, 1, 1, 1, 1,
0.7960905, 0.3445227, 1.306465, 1, 1, 1, 1, 1,
0.7988314, -0.1686926, 1.684581, 1, 1, 1, 1, 1,
0.8020313, 0.5377899, 1.877751, 1, 1, 1, 1, 1,
0.8036206, -1.503167, 1.367284, 1, 1, 1, 1, 1,
0.8056073, -0.0316669, 0.8828247, 1, 1, 1, 1, 1,
0.8099855, 0.5137186, 0.7988534, 1, 1, 1, 1, 1,
0.8115216, -1.152565, 2.462875, 1, 1, 1, 1, 1,
0.8152767, -2.165707, 3.515219, 1, 1, 1, 1, 1,
0.8162264, 0.717354, 2.630074, 0, 0, 1, 1, 1,
0.8262861, 0.5812525, 1.422642, 1, 0, 0, 1, 1,
0.8273755, -2.322761, 1.527069, 1, 0, 0, 1, 1,
0.8325766, 0.1626688, 0.9218657, 1, 0, 0, 1, 1,
0.8410727, -0.4695731, 0.01355766, 1, 0, 0, 1, 1,
0.8444597, -0.6304716, 3.287818, 1, 0, 0, 1, 1,
0.8459629, -0.7003101, 1.484367, 0, 0, 0, 1, 1,
0.8512407, 1.11791, 0.9466704, 0, 0, 0, 1, 1,
0.857401, 0.8201814, 0.7709382, 0, 0, 0, 1, 1,
0.8574681, -2.578863, 3.742531, 0, 0, 0, 1, 1,
0.8613437, -0.5514259, 1.769156, 0, 0, 0, 1, 1,
0.8615007, 0.09014156, 0.5178314, 0, 0, 0, 1, 1,
0.86516, 1.529192, 0.54118, 0, 0, 0, 1, 1,
0.8656068, 1.346778, -0.3600101, 1, 1, 1, 1, 1,
0.8666915, -0.1878892, 3.082366, 1, 1, 1, 1, 1,
0.8736747, 0.2824827, 0.4582626, 1, 1, 1, 1, 1,
0.875681, -1.313199, 2.363356, 1, 1, 1, 1, 1,
0.877658, 0.2110754, 0.3959578, 1, 1, 1, 1, 1,
0.8791662, 0.09193819, 1.215505, 1, 1, 1, 1, 1,
0.8820687, 0.9261199, 0.2502174, 1, 1, 1, 1, 1,
0.8890038, 0.6880955, 1.542075, 1, 1, 1, 1, 1,
0.8970387, 0.0242731, 1.843407, 1, 1, 1, 1, 1,
0.90358, 1.757953, 0.7780675, 1, 1, 1, 1, 1,
0.907172, -0.8528615, 4.02527, 1, 1, 1, 1, 1,
0.9110005, 1.029839, 2.242884, 1, 1, 1, 1, 1,
0.9158791, -0.6965225, 1.722754, 1, 1, 1, 1, 1,
0.9159861, 1.281333, 0.2214577, 1, 1, 1, 1, 1,
0.9163834, 1.017876, 2.570466, 1, 1, 1, 1, 1,
0.9254839, -0.7179919, 1.769515, 0, 0, 1, 1, 1,
0.9322072, -0.2903415, 1.824801, 1, 0, 0, 1, 1,
0.9344157, 0.7487786, 0.61486, 1, 0, 0, 1, 1,
0.9396333, 0.4384205, 1.407068, 1, 0, 0, 1, 1,
0.9400313, -0.7025512, 2.521037, 1, 0, 0, 1, 1,
0.9400671, 1.244043, 1.514079, 1, 0, 0, 1, 1,
0.9410155, 0.2765279, 1.975901, 0, 0, 0, 1, 1,
0.9417477, 0.3993792, 2.250476, 0, 0, 0, 1, 1,
0.9451125, -1.726655, 2.111435, 0, 0, 0, 1, 1,
0.9490496, -1.217969, 2.74754, 0, 0, 0, 1, 1,
0.9600607, 0.8305092, -0.04328569, 0, 0, 0, 1, 1,
0.9602813, 0.7606822, -0.01694294, 0, 0, 0, 1, 1,
0.9615785, -0.92304, 4.150242, 0, 0, 0, 1, 1,
0.9644002, 0.9439227, 0.8608339, 1, 1, 1, 1, 1,
0.9796765, 0.4774348, 1.498341, 1, 1, 1, 1, 1,
0.9893479, -0.2275978, 0.5012605, 1, 1, 1, 1, 1,
0.9920284, -0.539756, 1.891647, 1, 1, 1, 1, 1,
0.9928427, -1.375668, 0.408554, 1, 1, 1, 1, 1,
0.9945211, -0.7671462, -0.6228619, 1, 1, 1, 1, 1,
0.9993656, 0.4013855, 0.9405113, 1, 1, 1, 1, 1,
1.004587, 1.370921, -1.193188, 1, 1, 1, 1, 1,
1.017083, -1.786016, 2.806814, 1, 1, 1, 1, 1,
1.018529, 0.4351106, 0.1219708, 1, 1, 1, 1, 1,
1.024972, 0.04189826, 0.6595259, 1, 1, 1, 1, 1,
1.025101, 0.3238682, 1.136812, 1, 1, 1, 1, 1,
1.028157, -1.774749, 2.360947, 1, 1, 1, 1, 1,
1.036265, 1.33964, 1.359376, 1, 1, 1, 1, 1,
1.053782, -0.9809189, 2.145676, 1, 1, 1, 1, 1,
1.055887, -0.7999937, 1.541601, 0, 0, 1, 1, 1,
1.057265, 1.271461, 0.03220178, 1, 0, 0, 1, 1,
1.060326, 1.176678, 1.01684, 1, 0, 0, 1, 1,
1.068914, 1.610119, -1.506962, 1, 0, 0, 1, 1,
1.06939, -0.812942, 1.73662, 1, 0, 0, 1, 1,
1.069465, 0.2712088, 0.149499, 1, 0, 0, 1, 1,
1.074624, 0.1921219, 3.004017, 0, 0, 0, 1, 1,
1.074634, 0.8014661, 1.704011, 0, 0, 0, 1, 1,
1.084873, 0.6866226, 1.635969, 0, 0, 0, 1, 1,
1.088081, -0.9599074, 4.220328, 0, 0, 0, 1, 1,
1.089796, 1.825771, 2.118138, 0, 0, 0, 1, 1,
1.10301, -0.0177882, 1.9247, 0, 0, 0, 1, 1,
1.114332, -0.5791612, 2.211523, 0, 0, 0, 1, 1,
1.125058, -1.77636, -0.09199319, 1, 1, 1, 1, 1,
1.126516, -1.309217, 2.809938, 1, 1, 1, 1, 1,
1.12725, -1.363385, 2.396247, 1, 1, 1, 1, 1,
1.132335, 1.104593, 0.002303176, 1, 1, 1, 1, 1,
1.137318, -0.04071505, 1.752731, 1, 1, 1, 1, 1,
1.139521, 1.413622, 1.233928, 1, 1, 1, 1, 1,
1.139826, -0.223844, 2.586601, 1, 1, 1, 1, 1,
1.141123, -0.6336706, 1.326901, 1, 1, 1, 1, 1,
1.150409, 0.681158, 1.112475, 1, 1, 1, 1, 1,
1.155205, 1.253472, 0.3129106, 1, 1, 1, 1, 1,
1.166922, -0.8060345, 1.677451, 1, 1, 1, 1, 1,
1.172921, 0.5714658, 1.667354, 1, 1, 1, 1, 1,
1.183389, -0.2245344, 2.440235, 1, 1, 1, 1, 1,
1.189884, -0.6120199, 2.407337, 1, 1, 1, 1, 1,
1.197867, 1.004449, 1.420521, 1, 1, 1, 1, 1,
1.201647, -1.159913, 1.786879, 0, 0, 1, 1, 1,
1.203, -0.8341357, 0.5609426, 1, 0, 0, 1, 1,
1.216523, -0.5806611, 0.3295532, 1, 0, 0, 1, 1,
1.218014, -0.3260849, 0.5884215, 1, 0, 0, 1, 1,
1.222841, -0.09245395, 1.277952, 1, 0, 0, 1, 1,
1.231521, 1.266814, 1.945998, 1, 0, 0, 1, 1,
1.239845, -0.3418182, 2.9071, 0, 0, 0, 1, 1,
1.244917, 0.1042969, 1.805023, 0, 0, 0, 1, 1,
1.25149, 0.2611163, 1.545829, 0, 0, 0, 1, 1,
1.253082, -0.248785, 1.384225, 0, 0, 0, 1, 1,
1.255339, 0.01903269, 0.449371, 0, 0, 0, 1, 1,
1.258866, 1.621348e-05, 1.260183, 0, 0, 0, 1, 1,
1.272787, 0.9365321, 0.2011664, 0, 0, 0, 1, 1,
1.274928, 0.2531441, 1.932912, 1, 1, 1, 1, 1,
1.284011, 0.01697059, 2.501825, 1, 1, 1, 1, 1,
1.284123, -0.9126908, 1.916214, 1, 1, 1, 1, 1,
1.303174, -1.737843, -1.039074, 1, 1, 1, 1, 1,
1.311064, 0.1825161, 2.797022, 1, 1, 1, 1, 1,
1.323038, -0.3558552, -0.2586644, 1, 1, 1, 1, 1,
1.334519, 0.9797012, 2.17077, 1, 1, 1, 1, 1,
1.340572, -0.2853077, 3.327741, 1, 1, 1, 1, 1,
1.349957, -0.61435, 1.908479, 1, 1, 1, 1, 1,
1.351919, -0.3731728, 1.933471, 1, 1, 1, 1, 1,
1.353285, 0.145177, 1.512649, 1, 1, 1, 1, 1,
1.355328, -0.334637, 1.324718, 1, 1, 1, 1, 1,
1.380625, -0.3230835, 0.4581095, 1, 1, 1, 1, 1,
1.380732, -0.6982056, 2.674836, 1, 1, 1, 1, 1,
1.385818, 0.9630117, 0.2411137, 1, 1, 1, 1, 1,
1.388787, 0.3567567, 1.053811, 0, 0, 1, 1, 1,
1.389867, -1.098174, 2.899323, 1, 0, 0, 1, 1,
1.394991, -0.7507508, 1.718354, 1, 0, 0, 1, 1,
1.399622, -1.112535, 2.940816, 1, 0, 0, 1, 1,
1.402948, -0.9327009, 2.06761, 1, 0, 0, 1, 1,
1.422856, 0.3050026, 0.3080672, 1, 0, 0, 1, 1,
1.431409, -0.4269, 1.590986, 0, 0, 0, 1, 1,
1.44355, -0.4444267, 1.460842, 0, 0, 0, 1, 1,
1.446622, -1.877569, 1.819167, 0, 0, 0, 1, 1,
1.460448, -0.6660271, 2.203616, 0, 0, 0, 1, 1,
1.488384, 0.6015546, 2.516748, 0, 0, 0, 1, 1,
1.490854, 0.2820224, 3.279972, 0, 0, 0, 1, 1,
1.495065, 0.3194481, 0.9384348, 0, 0, 0, 1, 1,
1.510617, 0.4424736, 1.255825, 1, 1, 1, 1, 1,
1.510677, 0.9629385, 1.316123, 1, 1, 1, 1, 1,
1.522951, -0.7544936, 1.748185, 1, 1, 1, 1, 1,
1.524235, -1.451256, 1.094326, 1, 1, 1, 1, 1,
1.525982, 0.6140828, 1.956043, 1, 1, 1, 1, 1,
1.527974, 2.454445, 1.757432, 1, 1, 1, 1, 1,
1.532383, 1.42919, 0.7227032, 1, 1, 1, 1, 1,
1.533957, -0.2279982, 1.263176, 1, 1, 1, 1, 1,
1.535484, -0.4141733, 1.008243, 1, 1, 1, 1, 1,
1.544667, -0.2465737, 2.951898, 1, 1, 1, 1, 1,
1.562906, -0.1842164, 2.507742, 1, 1, 1, 1, 1,
1.589632, 0.2396228, 1.612214, 1, 1, 1, 1, 1,
1.596846, -1.33566, 1.822291, 1, 1, 1, 1, 1,
1.597854, 1.090921, 0.03208805, 1, 1, 1, 1, 1,
1.598274, 0.7634057, 1.399095, 1, 1, 1, 1, 1,
1.606991, -1.258775, 2.350124, 0, 0, 1, 1, 1,
1.618731, 0.06192378, 0.6857167, 1, 0, 0, 1, 1,
1.63809, 0.5533081, 1.728787, 1, 0, 0, 1, 1,
1.662847, 0.26041, -0.02859409, 1, 0, 0, 1, 1,
1.665074, -0.5539655, 4.419699, 1, 0, 0, 1, 1,
1.678365, 0.4933248, 0.5767642, 1, 0, 0, 1, 1,
1.684711, -0.09176269, 1.806353, 0, 0, 0, 1, 1,
1.7011, -0.6734797, 1.370344, 0, 0, 0, 1, 1,
1.701173, -1.476111, 1.103679, 0, 0, 0, 1, 1,
1.703787, 0.01832899, 1.553838, 0, 0, 0, 1, 1,
1.715199, 0.1906635, -0.4277027, 0, 0, 0, 1, 1,
1.71903, 0.09035654, 2.721363, 0, 0, 0, 1, 1,
1.740088, 1.628491, 1.179638, 0, 0, 0, 1, 1,
1.7454, 1.415987, -0.2041532, 1, 1, 1, 1, 1,
1.755332, 0.1437427, 1.21799, 1, 1, 1, 1, 1,
1.763485, 1.574727, 2.810488, 1, 1, 1, 1, 1,
1.793579, 0.6895998, 2.739694, 1, 1, 1, 1, 1,
1.808259, -0.2647748, 0.9832363, 1, 1, 1, 1, 1,
1.847124, 0.5856109, 0.8505592, 1, 1, 1, 1, 1,
1.851107, -0.2246611, 2.171798, 1, 1, 1, 1, 1,
1.857586, 0.3571774, 1.799469, 1, 1, 1, 1, 1,
1.882967, -0.392424, 2.44633, 1, 1, 1, 1, 1,
1.938806, 1.271343, 1.255101, 1, 1, 1, 1, 1,
1.955297, 0.06357463, 2.492396, 1, 1, 1, 1, 1,
1.984779, -1.215552, 2.72783, 1, 1, 1, 1, 1,
2.006639, 1.852517, -0.05104616, 1, 1, 1, 1, 1,
2.033828, 0.9074374, 1.794767, 1, 1, 1, 1, 1,
2.058756, -0.3611305, 2.42113, 1, 1, 1, 1, 1,
2.100175, -0.03353813, 0.0186734, 0, 0, 1, 1, 1,
2.105276, -1.09899, 3.800258, 1, 0, 0, 1, 1,
2.119551, 0.1288029, 1.226007, 1, 0, 0, 1, 1,
2.126683, -0.09916628, 1.319763, 1, 0, 0, 1, 1,
2.127551, 0.5563272, -0.7034493, 1, 0, 0, 1, 1,
2.128701, 0.02487996, 1.871958, 1, 0, 0, 1, 1,
2.163744, -0.4466827, 1.459847, 0, 0, 0, 1, 1,
2.184453, 1.970856, 0.7553669, 0, 0, 0, 1, 1,
2.189703, 2.21704, 1.930157, 0, 0, 0, 1, 1,
2.220779, -0.6770362, 2.573223, 0, 0, 0, 1, 1,
2.320204, 0.06348284, 1.898764, 0, 0, 0, 1, 1,
2.348234, -0.9316137, 2.987306, 0, 0, 0, 1, 1,
2.388262, 1.032099, 2.736731, 0, 0, 0, 1, 1,
2.421478, -0.9757968, 1.111002, 1, 1, 1, 1, 1,
2.445301, -1.180791, 2.443649, 1, 1, 1, 1, 1,
2.552418, -0.3481233, 0.916587, 1, 1, 1, 1, 1,
2.7516, 0.6271716, 2.253167, 1, 1, 1, 1, 1,
2.767829, -0.8935466, 1.574139, 1, 1, 1, 1, 1,
2.979218, 0.2231826, 3.158582, 1, 1, 1, 1, 1,
3.183074, -1.622479, 1.949327, 1, 1, 1, 1, 1
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
var radius = 9.362019;
var distance = 32.88369;
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
mvMatrix.translate( -0.03199673, 0.003680944, 0.3156607 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.88369);
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
