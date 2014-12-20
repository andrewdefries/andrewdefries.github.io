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
-3.490973, -1.524373, -0.9222273, 1, 0, 0, 1,
-3.12197, -0.9812274, -3.681553, 1, 0.007843138, 0, 1,
-3.004447, -1.35126, -3.170692, 1, 0.01176471, 0, 1,
-2.852397, -1.159365, -2.992075, 1, 0.01960784, 0, 1,
-2.776486, 0.1744133, -1.175156, 1, 0.02352941, 0, 1,
-2.550686, -1.23615, -2.023606, 1, 0.03137255, 0, 1,
-2.529692, 0.9902147, -1.477001, 1, 0.03529412, 0, 1,
-2.482608, -0.3520889, -3.41702, 1, 0.04313726, 0, 1,
-2.395868, 1.290002, -0.8651683, 1, 0.04705882, 0, 1,
-2.394574, 1.026019, -0.4731683, 1, 0.05490196, 0, 1,
-2.385046, 0.1352872, -0.957788, 1, 0.05882353, 0, 1,
-2.377638, 1.101063, -0.6521758, 1, 0.06666667, 0, 1,
-2.306076, 0.3345876, -0.8483099, 1, 0.07058824, 0, 1,
-2.293381, -1.554132, -2.354328, 1, 0.07843138, 0, 1,
-2.281859, -0.338022, -0.8901456, 1, 0.08235294, 0, 1,
-2.235558, -0.2368345, 0.571636, 1, 0.09019608, 0, 1,
-2.233804, 0.5192066, -2.501265, 1, 0.09411765, 0, 1,
-2.189102, -0.02150348, -1.781711, 1, 0.1019608, 0, 1,
-2.186174, 0.3445839, -1.088581, 1, 0.1098039, 0, 1,
-2.180599, 0.3965312, -0.9922067, 1, 0.1137255, 0, 1,
-2.173585, -2.814242, -2.628249, 1, 0.1215686, 0, 1,
-2.147341, 1.169182, 0.1671501, 1, 0.1254902, 0, 1,
-2.089742, 1.419898, -1.018601, 1, 0.1333333, 0, 1,
-2.065257, -0.3590166, -0.9946342, 1, 0.1372549, 0, 1,
-2.057807, 0.7114578, -4.111186, 1, 0.145098, 0, 1,
-1.999951, 0.06731225, -0.572906, 1, 0.1490196, 0, 1,
-1.967508, 0.6716389, 0.006686096, 1, 0.1568628, 0, 1,
-1.957779, 2.081555, -0.5603068, 1, 0.1607843, 0, 1,
-1.923437, -0.8574922, 0.3541535, 1, 0.1686275, 0, 1,
-1.913837, -0.2938194, -2.294666, 1, 0.172549, 0, 1,
-1.903982, 0.9581148, -0.5726061, 1, 0.1803922, 0, 1,
-1.899787, 0.01156234, -1.117127, 1, 0.1843137, 0, 1,
-1.894676, 1.713874, -1.31079, 1, 0.1921569, 0, 1,
-1.887273, -0.9867211, -2.276903, 1, 0.1960784, 0, 1,
-1.884561, -1.110725, -1.084009, 1, 0.2039216, 0, 1,
-1.880187, -0.07320356, -1.956575, 1, 0.2117647, 0, 1,
-1.872877, 0.1455024, -0.7707106, 1, 0.2156863, 0, 1,
-1.871844, -0.2876725, -0.4659298, 1, 0.2235294, 0, 1,
-1.846873, 0.1774993, 0.03174803, 1, 0.227451, 0, 1,
-1.844899, -0.7694844, -0.4366302, 1, 0.2352941, 0, 1,
-1.840952, -1.420901, -2.167541, 1, 0.2392157, 0, 1,
-1.838229, -0.2928939, -2.52277, 1, 0.2470588, 0, 1,
-1.835481, -0.5369042, -1.245537, 1, 0.2509804, 0, 1,
-1.834728, 1.222003, -0.6827239, 1, 0.2588235, 0, 1,
-1.83245, 0.9525009, -0.7379712, 1, 0.2627451, 0, 1,
-1.826046, -0.4320899, -2.316473, 1, 0.2705882, 0, 1,
-1.795403, -0.5891218, -0.2387322, 1, 0.2745098, 0, 1,
-1.785526, 1.259681, -1.947851, 1, 0.282353, 0, 1,
-1.784531, 2.106485, 1.011134, 1, 0.2862745, 0, 1,
-1.781964, -0.5641438, -1.979691, 1, 0.2941177, 0, 1,
-1.776791, 1.685717, -0.9635301, 1, 0.3019608, 0, 1,
-1.765591, -1.523645, -2.850265, 1, 0.3058824, 0, 1,
-1.755493, -0.3722697, 0.7292714, 1, 0.3137255, 0, 1,
-1.74515, -0.1573819, -2.038007, 1, 0.3176471, 0, 1,
-1.744154, -0.3479958, -1.604398, 1, 0.3254902, 0, 1,
-1.73945, -0.7814171, -2.951586, 1, 0.3294118, 0, 1,
-1.713027, 3.013148, -2.2014, 1, 0.3372549, 0, 1,
-1.709232, -0.0413889, 0.1576286, 1, 0.3411765, 0, 1,
-1.700401, -1.210015, -3.912784, 1, 0.3490196, 0, 1,
-1.694881, 1.206643, -0.2844364, 1, 0.3529412, 0, 1,
-1.694861, -0.3593293, -0.7139336, 1, 0.3607843, 0, 1,
-1.687847, 0.3412581, -2.638067, 1, 0.3647059, 0, 1,
-1.685161, 1.814062, -0.2329284, 1, 0.372549, 0, 1,
-1.678039, -0.2766277, -1.007827, 1, 0.3764706, 0, 1,
-1.671133, -0.5156116, -1.492379, 1, 0.3843137, 0, 1,
-1.667161, 2.910645, -0.4787493, 1, 0.3882353, 0, 1,
-1.634964, 0.6277762, -0.6326812, 1, 0.3960784, 0, 1,
-1.634094, 1.145053, -1.442611, 1, 0.4039216, 0, 1,
-1.618064, -1.086926, -1.769993, 1, 0.4078431, 0, 1,
-1.605263, -0.7951992, -1.397311, 1, 0.4156863, 0, 1,
-1.596922, -0.9125034, -1.726449, 1, 0.4196078, 0, 1,
-1.592648, -0.8017781, -0.1242924, 1, 0.427451, 0, 1,
-1.588686, 0.5236055, -1.38213, 1, 0.4313726, 0, 1,
-1.583563, 1.019333, -2.026353, 1, 0.4392157, 0, 1,
-1.575625, 0.5236745, -0.5930045, 1, 0.4431373, 0, 1,
-1.573589, -0.8286598, -1.759504, 1, 0.4509804, 0, 1,
-1.567485, -0.6572768, -1.553975, 1, 0.454902, 0, 1,
-1.563703, -0.8393733, -2.036688, 1, 0.4627451, 0, 1,
-1.556705, 2.046036, -0.6342837, 1, 0.4666667, 0, 1,
-1.54103, -1.10767, -1.324087, 1, 0.4745098, 0, 1,
-1.527076, -0.625576, -3.026999, 1, 0.4784314, 0, 1,
-1.518346, 0.7975189, -2.018637, 1, 0.4862745, 0, 1,
-1.513361, 0.5307078, -1.00906, 1, 0.4901961, 0, 1,
-1.509417, -0.9929507, -4.441803, 1, 0.4980392, 0, 1,
-1.508045, -0.7374445, -1.233191, 1, 0.5058824, 0, 1,
-1.507175, 2.483053, 1.01113, 1, 0.509804, 0, 1,
-1.497248, 0.7507343, -1.578011, 1, 0.5176471, 0, 1,
-1.485152, -0.1784202, -1.930673, 1, 0.5215687, 0, 1,
-1.480489, -0.8587832, -2.385581, 1, 0.5294118, 0, 1,
-1.476568, -0.1751045, -2.670979, 1, 0.5333334, 0, 1,
-1.476387, -0.313941, -1.700697, 1, 0.5411765, 0, 1,
-1.476143, 0.01675107, -1.785492, 1, 0.5450981, 0, 1,
-1.472615, -1.283225, -3.066594, 1, 0.5529412, 0, 1,
-1.461487, 0.5631149, -0.02938161, 1, 0.5568628, 0, 1,
-1.45694, 1.883992, -1.950255, 1, 0.5647059, 0, 1,
-1.44992, -0.8676147, -0.8168536, 1, 0.5686275, 0, 1,
-1.448763, -0.7356082, -2.167825, 1, 0.5764706, 0, 1,
-1.447227, 0.4706168, -0.3180962, 1, 0.5803922, 0, 1,
-1.442919, -0.8055336, -1.374578, 1, 0.5882353, 0, 1,
-1.437926, -0.8149282, -1.680044, 1, 0.5921569, 0, 1,
-1.435994, 0.8184078, -1.250215, 1, 0.6, 0, 1,
-1.434593, 0.4350847, 0.8126526, 1, 0.6078432, 0, 1,
-1.427408, -0.887769, 1.055323, 1, 0.6117647, 0, 1,
-1.420058, -0.4773571, -3.027446, 1, 0.6196079, 0, 1,
-1.420038, 0.2704833, -0.910404, 1, 0.6235294, 0, 1,
-1.39863, 1.140512, -1.453742, 1, 0.6313726, 0, 1,
-1.393686, -0.7476977, -1.42921, 1, 0.6352941, 0, 1,
-1.382044, 1.195716, -2.525321, 1, 0.6431373, 0, 1,
-1.378418, 0.3962987, -1.733161, 1, 0.6470588, 0, 1,
-1.376819, 1.098577, -2.867797, 1, 0.654902, 0, 1,
-1.368289, -0.1021763, -0.1982591, 1, 0.6588235, 0, 1,
-1.366141, -1.449722, -3.637412, 1, 0.6666667, 0, 1,
-1.348171, 0.7725377, -1.435961, 1, 0.6705883, 0, 1,
-1.347985, -2.979568, -1.962458, 1, 0.6784314, 0, 1,
-1.333801, -0.1061397, -0.8751642, 1, 0.682353, 0, 1,
-1.330935, 1.573587, -1.489585, 1, 0.6901961, 0, 1,
-1.304206, 0.3222873, -1.330237, 1, 0.6941177, 0, 1,
-1.292901, -1.517995, -3.109877, 1, 0.7019608, 0, 1,
-1.283783, -1.824596, -1.474404, 1, 0.7098039, 0, 1,
-1.274504, 1.088236, 0.01058524, 1, 0.7137255, 0, 1,
-1.271579, -0.1526783, -3.285264, 1, 0.7215686, 0, 1,
-1.25533, -0.9590006, -3.775481, 1, 0.7254902, 0, 1,
-1.248575, -1.036344, -2.838064, 1, 0.7333333, 0, 1,
-1.245171, 0.8958302, -2.494151, 1, 0.7372549, 0, 1,
-1.237726, -0.2661108, -1.939839, 1, 0.7450981, 0, 1,
-1.235343, 1.059232, 0.4695291, 1, 0.7490196, 0, 1,
-1.23459, 0.1895746, -2.272094, 1, 0.7568628, 0, 1,
-1.229286, 0.342797, -0.3315265, 1, 0.7607843, 0, 1,
-1.22681, 0.08127963, -2.796141, 1, 0.7686275, 0, 1,
-1.222864, -1.35882, -1.78002, 1, 0.772549, 0, 1,
-1.196448, 0.4685574, -1.686894, 1, 0.7803922, 0, 1,
-1.193167, -1.462529, -2.603563, 1, 0.7843137, 0, 1,
-1.191061, -0.4318193, -0.971406, 1, 0.7921569, 0, 1,
-1.187044, -0.259141, 0.6339825, 1, 0.7960784, 0, 1,
-1.185379, 2.548345, -0.7809104, 1, 0.8039216, 0, 1,
-1.182131, -0.1272725, -2.702724, 1, 0.8117647, 0, 1,
-1.166914, -0.559997, -2.71718, 1, 0.8156863, 0, 1,
-1.163648, -0.5200421, -1.572979, 1, 0.8235294, 0, 1,
-1.1619, -1.509229, -1.500226, 1, 0.827451, 0, 1,
-1.156991, -0.3545419, -0.1926266, 1, 0.8352941, 0, 1,
-1.15132, 0.1999624, -3.468848, 1, 0.8392157, 0, 1,
-1.150286, -1.134826, -2.560431, 1, 0.8470588, 0, 1,
-1.148192, 1.296009, -1.300115, 1, 0.8509804, 0, 1,
-1.147098, 0.5855542, 0.06745724, 1, 0.8588235, 0, 1,
-1.133357, 0.8951786, 0.3468189, 1, 0.8627451, 0, 1,
-1.132837, -0.421078, -2.493588, 1, 0.8705882, 0, 1,
-1.131243, 0.9560863, -0.3798227, 1, 0.8745098, 0, 1,
-1.129388, 0.5239677, 0.04232053, 1, 0.8823529, 0, 1,
-1.128219, 0.9198933, -0.0094927, 1, 0.8862745, 0, 1,
-1.124196, -0.4760507, -0.8264582, 1, 0.8941177, 0, 1,
-1.112714, -0.5498163, -0.7787135, 1, 0.8980392, 0, 1,
-1.110789, -0.03818531, 0.1680028, 1, 0.9058824, 0, 1,
-1.109716, -0.9601621, -3.735595, 1, 0.9137255, 0, 1,
-1.092878, 0.3731923, -0.2433677, 1, 0.9176471, 0, 1,
-1.086493, -1.104646, -2.798086, 1, 0.9254902, 0, 1,
-1.085628, -0.1630654, -3.107326, 1, 0.9294118, 0, 1,
-1.085323, 0.6474339, -2.36251, 1, 0.9372549, 0, 1,
-1.079943, -0.8647524, -0.9691245, 1, 0.9411765, 0, 1,
-1.073681, 1.190825, -0.8401471, 1, 0.9490196, 0, 1,
-1.068686, 0.6945495, -1.282418, 1, 0.9529412, 0, 1,
-1.067304, 0.7177337, -1.398535, 1, 0.9607843, 0, 1,
-1.055893, 0.07129858, 0.0571438, 1, 0.9647059, 0, 1,
-1.05264, -0.7888273, -2.905783, 1, 0.972549, 0, 1,
-1.035423, -0.2330631, -3.465296, 1, 0.9764706, 0, 1,
-1.034497, 0.9297516, -2.241127, 1, 0.9843137, 0, 1,
-1.033974, 0.9228224, -0.2902837, 1, 0.9882353, 0, 1,
-1.030102, -1.766537, -3.517582, 1, 0.9960784, 0, 1,
-1.028108, -0.8084666, -2.712325, 0.9960784, 1, 0, 1,
-1.027045, 1.900972, 0.003503568, 0.9921569, 1, 0, 1,
-1.024024, -0.4087972, -0.3318813, 0.9843137, 1, 0, 1,
-1.023102, 1.160758, 0.1349758, 0.9803922, 1, 0, 1,
-1.018775, -0.7408845, -1.799737, 0.972549, 1, 0, 1,
-1.014809, 0.2331156, -1.357157, 0.9686275, 1, 0, 1,
-1.013885, -0.6196747, -2.595009, 0.9607843, 1, 0, 1,
-1.00187, 0.08947366, -1.44497, 0.9568627, 1, 0, 1,
-0.9972184, 0.5058261, -1.388762, 0.9490196, 1, 0, 1,
-0.9925951, -1.347253, -1.960469, 0.945098, 1, 0, 1,
-0.9879679, -2.027455, -1.575135, 0.9372549, 1, 0, 1,
-0.9866492, 0.6455233, -0.9110711, 0.9333333, 1, 0, 1,
-0.9851626, 0.4665297, -1.402472, 0.9254902, 1, 0, 1,
-0.9834874, 0.2353743, -0.9398424, 0.9215686, 1, 0, 1,
-0.9830441, 1.289794, -1.356986, 0.9137255, 1, 0, 1,
-0.9800856, -0.2922388, -1.628164, 0.9098039, 1, 0, 1,
-0.9800302, -0.2325658, -2.309555, 0.9019608, 1, 0, 1,
-0.976413, 0.2939433, -0.4916443, 0.8941177, 1, 0, 1,
-0.969236, 0.05471195, -1.671226, 0.8901961, 1, 0, 1,
-0.949682, -0.4853685, -1.735414, 0.8823529, 1, 0, 1,
-0.9488007, 0.2174613, -0.2246198, 0.8784314, 1, 0, 1,
-0.9473157, -0.780144, -2.637352, 0.8705882, 1, 0, 1,
-0.9430513, -0.9280778, -3.704333, 0.8666667, 1, 0, 1,
-0.9381633, -0.5584041, -1.232122, 0.8588235, 1, 0, 1,
-0.9355003, -0.9256523, -2.039351, 0.854902, 1, 0, 1,
-0.931755, -0.02074314, -2.431725, 0.8470588, 1, 0, 1,
-0.9305022, 1.206659, 0.0416888, 0.8431373, 1, 0, 1,
-0.9235365, -0.5350363, -0.7620492, 0.8352941, 1, 0, 1,
-0.9141032, -1.262581, -2.893859, 0.8313726, 1, 0, 1,
-0.9113445, 0.3758306, -0.7580582, 0.8235294, 1, 0, 1,
-0.9087579, 0.6178896, -1.163828, 0.8196079, 1, 0, 1,
-0.9020135, 0.1622518, -1.101733, 0.8117647, 1, 0, 1,
-0.9014059, -0.6869612, -0.2320898, 0.8078431, 1, 0, 1,
-0.8958495, -0.2110659, -1.667019, 0.8, 1, 0, 1,
-0.8931791, 0.3806292, -2.149993, 0.7921569, 1, 0, 1,
-0.8894497, -1.701375, -3.259866, 0.7882353, 1, 0, 1,
-0.8883518, -2.553502, -2.744268, 0.7803922, 1, 0, 1,
-0.8828198, 0.5519108, -0.8519828, 0.7764706, 1, 0, 1,
-0.8804399, -1.100604, -2.372591, 0.7686275, 1, 0, 1,
-0.8787865, -2.340285, -2.854681, 0.7647059, 1, 0, 1,
-0.8729427, 1.018524, -0.5493153, 0.7568628, 1, 0, 1,
-0.8728826, -0.05181345, -1.632397, 0.7529412, 1, 0, 1,
-0.8687456, -0.5681177, -2.129312, 0.7450981, 1, 0, 1,
-0.868645, -0.6768644, -1.705144, 0.7411765, 1, 0, 1,
-0.8648679, 1.025931, -0.8772073, 0.7333333, 1, 0, 1,
-0.8575735, -0.5304899, -3.98285, 0.7294118, 1, 0, 1,
-0.8566221, -0.6505016, -1.659589, 0.7215686, 1, 0, 1,
-0.8441491, -0.1001333, -1.496869, 0.7176471, 1, 0, 1,
-0.8416395, -0.7800198, -1.201691, 0.7098039, 1, 0, 1,
-0.840382, -1.643937, -1.655997, 0.7058824, 1, 0, 1,
-0.8377983, 0.9040499, -1.0495, 0.6980392, 1, 0, 1,
-0.8377122, -1.45279, -4.48264, 0.6901961, 1, 0, 1,
-0.8365867, -1.116649, -2.181108, 0.6862745, 1, 0, 1,
-0.8298126, 0.9508106, -0.9078797, 0.6784314, 1, 0, 1,
-0.8298095, -1.116229, -3.311888, 0.6745098, 1, 0, 1,
-0.8242062, 0.04607485, -1.892197, 0.6666667, 1, 0, 1,
-0.8209177, 0.4402747, -3.845518, 0.6627451, 1, 0, 1,
-0.8175732, -0.4712491, -1.690572, 0.654902, 1, 0, 1,
-0.8167308, 0.8020554, -3.088828, 0.6509804, 1, 0, 1,
-0.8128185, -0.8854049, -1.83509, 0.6431373, 1, 0, 1,
-0.8126089, -0.3173476, -2.911217, 0.6392157, 1, 0, 1,
-0.808812, 0.9525064, -1.343398, 0.6313726, 1, 0, 1,
-0.8079067, 0.8528996, 0.005455863, 0.627451, 1, 0, 1,
-0.8070006, -0.4894007, -1.098956, 0.6196079, 1, 0, 1,
-0.8016496, 0.2075008, -1.865397, 0.6156863, 1, 0, 1,
-0.7998011, -1.543372, -3.010654, 0.6078432, 1, 0, 1,
-0.7989857, -1.120189, -2.995086, 0.6039216, 1, 0, 1,
-0.7947527, -0.4076912, -2.179698, 0.5960785, 1, 0, 1,
-0.7869575, -0.5536902, -3.103764, 0.5882353, 1, 0, 1,
-0.785477, -0.5671097, -4.241154, 0.5843138, 1, 0, 1,
-0.7840919, -0.3135621, -1.459988, 0.5764706, 1, 0, 1,
-0.780049, 0.7896327, -2.376499, 0.572549, 1, 0, 1,
-0.7698176, -0.09045625, -0.02284744, 0.5647059, 1, 0, 1,
-0.7684028, 0.3261146, -2.92777, 0.5607843, 1, 0, 1,
-0.7663834, 0.6143297, -0.4406469, 0.5529412, 1, 0, 1,
-0.7644604, 0.1704338, -0.9090763, 0.5490196, 1, 0, 1,
-0.7601109, 1.09803, -0.5317031, 0.5411765, 1, 0, 1,
-0.7434645, -0.7154163, -3.230023, 0.5372549, 1, 0, 1,
-0.7418627, 0.2017098, 1.21784, 0.5294118, 1, 0, 1,
-0.7368779, 0.7191394, -0.3437153, 0.5254902, 1, 0, 1,
-0.7290097, -0.06707153, -1.779715, 0.5176471, 1, 0, 1,
-0.7280148, 0.3628367, -1.893298, 0.5137255, 1, 0, 1,
-0.7236623, -0.8169815, -3.761536, 0.5058824, 1, 0, 1,
-0.7234842, 0.064379, -1.935719, 0.5019608, 1, 0, 1,
-0.7213479, -0.2766506, -2.099015, 0.4941176, 1, 0, 1,
-0.7157183, 2.281172, -0.2047465, 0.4862745, 1, 0, 1,
-0.704495, -0.08277998, -1.859946, 0.4823529, 1, 0, 1,
-0.7040457, -0.2160763, -0.9208594, 0.4745098, 1, 0, 1,
-0.7018801, -0.1754826, 0.2243012, 0.4705882, 1, 0, 1,
-0.7016456, 0.2715114, -2.421599, 0.4627451, 1, 0, 1,
-0.6993716, 0.6672985, -1.356146, 0.4588235, 1, 0, 1,
-0.6969147, -1.590415, -2.147364, 0.4509804, 1, 0, 1,
-0.6941081, 2.504006, -0.931607, 0.4470588, 1, 0, 1,
-0.6933246, -0.2985028, -1.49005, 0.4392157, 1, 0, 1,
-0.6930588, 0.5788906, -2.087936, 0.4352941, 1, 0, 1,
-0.6875396, 0.293853, -0.3041828, 0.427451, 1, 0, 1,
-0.679668, 1.325719, -1.462232, 0.4235294, 1, 0, 1,
-0.6688314, 0.3489363, -0.3909065, 0.4156863, 1, 0, 1,
-0.6668184, 1.367435, -1.479694, 0.4117647, 1, 0, 1,
-0.6632547, -0.8883626, -1.334442, 0.4039216, 1, 0, 1,
-0.6600465, 0.1874489, -1.008459, 0.3960784, 1, 0, 1,
-0.657715, -1.409286, -3.924414, 0.3921569, 1, 0, 1,
-0.6523104, -1.135698, -2.543883, 0.3843137, 1, 0, 1,
-0.6473722, 0.293081, -2.18109, 0.3803922, 1, 0, 1,
-0.634829, -0.8053946, -4.53969, 0.372549, 1, 0, 1,
-0.6341984, 1.287282, 0.5492698, 0.3686275, 1, 0, 1,
-0.6330246, -1.143006, -3.978783, 0.3607843, 1, 0, 1,
-0.6312463, -0.9226426, -1.263179, 0.3568628, 1, 0, 1,
-0.6292691, -0.2485055, 1.211264, 0.3490196, 1, 0, 1,
-0.6272619, -0.498647, -2.756573, 0.345098, 1, 0, 1,
-0.6271524, -0.9032459, -0.8406481, 0.3372549, 1, 0, 1,
-0.6260335, -1.332602, -2.804986, 0.3333333, 1, 0, 1,
-0.6251117, -0.4132911, -1.042639, 0.3254902, 1, 0, 1,
-0.6161957, 0.7537377, -2.651207, 0.3215686, 1, 0, 1,
-0.6147276, 0.6059859, -0.1239973, 0.3137255, 1, 0, 1,
-0.6115006, 0.1701104, -0.9611635, 0.3098039, 1, 0, 1,
-0.6111018, -1.708213, -3.414959, 0.3019608, 1, 0, 1,
-0.6098614, -1.118469, -1.697382, 0.2941177, 1, 0, 1,
-0.6045462, -0.887042, -3.806438, 0.2901961, 1, 0, 1,
-0.6015462, -2.731975, -3.253469, 0.282353, 1, 0, 1,
-0.6004817, -2.050921, -3.288228, 0.2784314, 1, 0, 1,
-0.5962309, 0.005610277, -0.7821255, 0.2705882, 1, 0, 1,
-0.5938287, -0.2364035, -3.565905, 0.2666667, 1, 0, 1,
-0.5930184, -0.8861014, -1.045687, 0.2588235, 1, 0, 1,
-0.5920811, 0.1777716, 0.0007865587, 0.254902, 1, 0, 1,
-0.5920798, 0.5879405, -1.18277, 0.2470588, 1, 0, 1,
-0.59149, 0.6533598, -1.917984, 0.2431373, 1, 0, 1,
-0.5861846, 1.596298, 0.6676813, 0.2352941, 1, 0, 1,
-0.5805391, -0.4168598, -2.110037, 0.2313726, 1, 0, 1,
-0.579249, 0.8837467, -0.8933247, 0.2235294, 1, 0, 1,
-0.5784846, 0.740537, -0.9618076, 0.2196078, 1, 0, 1,
-0.5775238, 0.7991029, 0.3016755, 0.2117647, 1, 0, 1,
-0.5759303, 1.165795, 0.3239645, 0.2078431, 1, 0, 1,
-0.5744435, -1.68772, -1.541061, 0.2, 1, 0, 1,
-0.5734217, 0.3185875, -0.8795583, 0.1921569, 1, 0, 1,
-0.5726603, -1.08696, -0.8772358, 0.1882353, 1, 0, 1,
-0.57004, -1.860623, -3.60641, 0.1803922, 1, 0, 1,
-0.5678212, 0.3947836, -1.955732, 0.1764706, 1, 0, 1,
-0.5677443, 1.48392, -0.09920587, 0.1686275, 1, 0, 1,
-0.566756, -0.8719926, -2.09768, 0.1647059, 1, 0, 1,
-0.56667, 2.045447, -0.8725947, 0.1568628, 1, 0, 1,
-0.5620186, -1.434052, -2.64067, 0.1529412, 1, 0, 1,
-0.5589237, -0.1896788, -2.207637, 0.145098, 1, 0, 1,
-0.55856, 1.149564, -1.258275, 0.1411765, 1, 0, 1,
-0.554819, 0.6434062, 0.1336246, 0.1333333, 1, 0, 1,
-0.5523635, -0.9360919, -4.934432, 0.1294118, 1, 0, 1,
-0.549761, 0.684565, -0.7429177, 0.1215686, 1, 0, 1,
-0.5455483, -1.286511, -4.024416, 0.1176471, 1, 0, 1,
-0.5416874, -0.533531, -2.176737, 0.1098039, 1, 0, 1,
-0.535805, -1.639407, -0.8876435, 0.1058824, 1, 0, 1,
-0.5334386, 2.118119, -0.8457837, 0.09803922, 1, 0, 1,
-0.5314275, -0.5212044, -2.890956, 0.09019608, 1, 0, 1,
-0.5289222, -1.786891, -2.670876, 0.08627451, 1, 0, 1,
-0.5264541, -0.5316358, -2.518753, 0.07843138, 1, 0, 1,
-0.5251677, -0.5110703, -1.791202, 0.07450981, 1, 0, 1,
-0.5250862, 0.5298745, -2.619036, 0.06666667, 1, 0, 1,
-0.5236561, 0.1121754, -1.943545, 0.0627451, 1, 0, 1,
-0.521469, 0.380694, -1.166378, 0.05490196, 1, 0, 1,
-0.521313, 1.671449, 0.768497, 0.05098039, 1, 0, 1,
-0.5169306, 0.05935443, -1.08258, 0.04313726, 1, 0, 1,
-0.5167598, -1.194083, -3.233125, 0.03921569, 1, 0, 1,
-0.5158663, 1.929348, -1.792963, 0.03137255, 1, 0, 1,
-0.5119687, -0.06181277, -3.553123, 0.02745098, 1, 0, 1,
-0.5107167, 0.8151641, 0.2152507, 0.01960784, 1, 0, 1,
-0.509189, -0.2495431, -2.512763, 0.01568628, 1, 0, 1,
-0.5066395, -0.4296494, -0.5543209, 0.007843138, 1, 0, 1,
-0.5055175, 1.494455, -0.714035, 0.003921569, 1, 0, 1,
-0.5042214, 0.2105533, -0.9412613, 0, 1, 0.003921569, 1,
-0.5018486, -1.454068, -3.588806, 0, 1, 0.01176471, 1,
-0.4996099, -1.196065, -3.204592, 0, 1, 0.01568628, 1,
-0.4962422, -1.274164, -4.302037, 0, 1, 0.02352941, 1,
-0.4930483, 1.338216, -0.1668605, 0, 1, 0.02745098, 1,
-0.4902178, 0.6814557, -0.8979728, 0, 1, 0.03529412, 1,
-0.4858155, -0.2916881, -2.319031, 0, 1, 0.03921569, 1,
-0.4835932, -0.3486277, -1.334661, 0, 1, 0.04705882, 1,
-0.4776579, 1.923581, -0.6024691, 0, 1, 0.05098039, 1,
-0.4747088, 0.6558151, -1.09095, 0, 1, 0.05882353, 1,
-0.4738604, 0.2041498, -0.8409522, 0, 1, 0.0627451, 1,
-0.4725788, -0.04702831, -1.09198, 0, 1, 0.07058824, 1,
-0.4724354, 0.2876553, -0.6236072, 0, 1, 0.07450981, 1,
-0.465494, -1.222524, -3.908567, 0, 1, 0.08235294, 1,
-0.4652657, -0.2436787, -1.982517, 0, 1, 0.08627451, 1,
-0.4598384, -0.191445, -3.682512, 0, 1, 0.09411765, 1,
-0.457783, 1.582866, 1.546492, 0, 1, 0.1019608, 1,
-0.457303, -1.036926, -1.492071, 0, 1, 0.1058824, 1,
-0.4536299, 0.2353112, -3.405867, 0, 1, 0.1137255, 1,
-0.4536099, 0.8705052, 0.9012774, 0, 1, 0.1176471, 1,
-0.4504541, 0.2078654, -1.748246, 0, 1, 0.1254902, 1,
-0.4434645, -0.2523324, -3.402864, 0, 1, 0.1294118, 1,
-0.4426024, 1.172608, -1.779878, 0, 1, 0.1372549, 1,
-0.4420175, 1.18463, -0.945926, 0, 1, 0.1411765, 1,
-0.4316989, 0.2504642, -0.3447585, 0, 1, 0.1490196, 1,
-0.4283685, -0.548439, -2.833468, 0, 1, 0.1529412, 1,
-0.427126, -0.4078248, -2.724464, 0, 1, 0.1607843, 1,
-0.4268918, -1.288144, -2.509296, 0, 1, 0.1647059, 1,
-0.4262747, 1.008391, -0.1668963, 0, 1, 0.172549, 1,
-0.42599, -0.5973566, -2.075914, 0, 1, 0.1764706, 1,
-0.4248482, 0.02394933, -1.77434, 0, 1, 0.1843137, 1,
-0.4201135, 0.7132713, -0.4416576, 0, 1, 0.1882353, 1,
-0.4199654, -1.193048, -2.298048, 0, 1, 0.1960784, 1,
-0.419427, 0.3818787, -1.461348, 0, 1, 0.2039216, 1,
-0.4181634, 1.539015, -0.03702156, 0, 1, 0.2078431, 1,
-0.4143625, 1.457974, -2.002758, 0, 1, 0.2156863, 1,
-0.4077146, 0.9835225, 0.9816246, 0, 1, 0.2196078, 1,
-0.4071366, 0.9193395, -1.404062, 0, 1, 0.227451, 1,
-0.40253, -0.4892549, -3.607248, 0, 1, 0.2313726, 1,
-0.3953702, 1.336744, -0.9331536, 0, 1, 0.2392157, 1,
-0.3944584, -0.5123782, 0.4163945, 0, 1, 0.2431373, 1,
-0.3883319, -0.2694444, -2.69199, 0, 1, 0.2509804, 1,
-0.3869187, 0.4387864, -2.335047, 0, 1, 0.254902, 1,
-0.3862861, -1.750234, -2.295376, 0, 1, 0.2627451, 1,
-0.3833792, -1.409677, -1.941635, 0, 1, 0.2666667, 1,
-0.3807743, -1.523795, -1.931666, 0, 1, 0.2745098, 1,
-0.3784021, 1.486961, -2.306028, 0, 1, 0.2784314, 1,
-0.3661832, -1.981171, -0.550626, 0, 1, 0.2862745, 1,
-0.3638566, -2.448655, -4.088348, 0, 1, 0.2901961, 1,
-0.3637471, -1.093168, -1.276667, 0, 1, 0.2980392, 1,
-0.3609973, 2.627199, 0.8336195, 0, 1, 0.3058824, 1,
-0.35953, 1.041746, -2.670116, 0, 1, 0.3098039, 1,
-0.3553591, 1.69751, -0.2819254, 0, 1, 0.3176471, 1,
-0.3466969, 0.9327442, -0.8470441, 0, 1, 0.3215686, 1,
-0.3435102, -0.4280491, -2.022358, 0, 1, 0.3294118, 1,
-0.3386912, 2.436913, 0.7209824, 0, 1, 0.3333333, 1,
-0.3385645, -0.6899781, -1.403145, 0, 1, 0.3411765, 1,
-0.3384154, 0.2021137, -0.02195928, 0, 1, 0.345098, 1,
-0.3378027, -0.9162971, -1.384583, 0, 1, 0.3529412, 1,
-0.3312786, -0.3751918, -3.390347, 0, 1, 0.3568628, 1,
-0.3298534, -0.4934814, -3.847412, 0, 1, 0.3647059, 1,
-0.3239971, 0.5258304, -0.5790302, 0, 1, 0.3686275, 1,
-0.3232288, -0.9960089, -3.732619, 0, 1, 0.3764706, 1,
-0.3190118, 0.1840971, -0.2159012, 0, 1, 0.3803922, 1,
-0.315944, 0.05940473, 0.328268, 0, 1, 0.3882353, 1,
-0.3152259, -0.7834506, -3.781145, 0, 1, 0.3921569, 1,
-0.3002437, 0.5388991, -0.7534851, 0, 1, 0.4, 1,
-0.2907501, 2.734923, -0.4654942, 0, 1, 0.4078431, 1,
-0.2884825, -0.07098477, -2.464287, 0, 1, 0.4117647, 1,
-0.2869514, 1.588383, -1.399951, 0, 1, 0.4196078, 1,
-0.2781466, -0.4591098, -3.676363, 0, 1, 0.4235294, 1,
-0.2693315, 0.388687, -2.696742, 0, 1, 0.4313726, 1,
-0.2691754, 0.5268628, -0.01330005, 0, 1, 0.4352941, 1,
-0.2661589, 0.3451356, -0.6803272, 0, 1, 0.4431373, 1,
-0.2647174, 0.7345454, 1.215951, 0, 1, 0.4470588, 1,
-0.2642171, -0.6468879, -3.909896, 0, 1, 0.454902, 1,
-0.2608467, 0.1871087, -1.445504, 0, 1, 0.4588235, 1,
-0.2590631, -1.26379, -1.741503, 0, 1, 0.4666667, 1,
-0.2547246, -0.1216555, -3.985046, 0, 1, 0.4705882, 1,
-0.2531835, 0.4508917, 0.3019818, 0, 1, 0.4784314, 1,
-0.2515089, -0.4466001, -3.705319, 0, 1, 0.4823529, 1,
-0.2490796, 0.6142672, -0.06403756, 0, 1, 0.4901961, 1,
-0.2450729, -1.288586, -5.144144, 0, 1, 0.4941176, 1,
-0.2421282, 0.2651961, -1.306409, 0, 1, 0.5019608, 1,
-0.2412935, 1.316338, 0.1150843, 0, 1, 0.509804, 1,
-0.2406103, 0.1308068, -0.4239223, 0, 1, 0.5137255, 1,
-0.2381309, 0.7740247, -0.9131175, 0, 1, 0.5215687, 1,
-0.2354439, -0.1566002, -1.644289, 0, 1, 0.5254902, 1,
-0.2261563, -2.790683, -3.000584, 0, 1, 0.5333334, 1,
-0.2249154, 0.2941982, -0.2042394, 0, 1, 0.5372549, 1,
-0.2232649, -0.08547609, -0.8772112, 0, 1, 0.5450981, 1,
-0.2212161, 0.5533534, -0.8459129, 0, 1, 0.5490196, 1,
-0.218755, 1.996656, 0.8726017, 0, 1, 0.5568628, 1,
-0.2123103, -1.618889, -3.660692, 0, 1, 0.5607843, 1,
-0.21201, 0.5715238, -0.5365102, 0, 1, 0.5686275, 1,
-0.2103805, 0.486434, -0.01857507, 0, 1, 0.572549, 1,
-0.2072578, 0.1820577, 0.7134205, 0, 1, 0.5803922, 1,
-0.2043812, -0.01685013, -0.775375, 0, 1, 0.5843138, 1,
-0.202903, -0.02229496, -3.354352, 0, 1, 0.5921569, 1,
-0.2009586, -0.1819403, -1.429533, 0, 1, 0.5960785, 1,
-0.1970676, 0.411414, -0.1876065, 0, 1, 0.6039216, 1,
-0.1967265, 0.3751016, 0.3534634, 0, 1, 0.6117647, 1,
-0.1959603, 1.332611, 1.348393, 0, 1, 0.6156863, 1,
-0.1922529, 0.06871558, -2.05108, 0, 1, 0.6235294, 1,
-0.1904621, -0.09758055, -2.325575, 0, 1, 0.627451, 1,
-0.1896029, 1.003365, -0.9918563, 0, 1, 0.6352941, 1,
-0.1830128, -0.9044479, -2.347234, 0, 1, 0.6392157, 1,
-0.1786706, -1.974, -3.514762, 0, 1, 0.6470588, 1,
-0.1772159, 3.309483, -0.4797753, 0, 1, 0.6509804, 1,
-0.1752847, 0.3573731, 1.294977, 0, 1, 0.6588235, 1,
-0.1750858, -0.3478673, -2.940269, 0, 1, 0.6627451, 1,
-0.1748758, -1.112248, -4.986197, 0, 1, 0.6705883, 1,
-0.1736358, 0.3833055, -1.014366, 0, 1, 0.6745098, 1,
-0.169954, -0.6790987, -4.979702, 0, 1, 0.682353, 1,
-0.1656452, -0.4767861, -2.859877, 0, 1, 0.6862745, 1,
-0.1635476, 1.446862, -0.8043749, 0, 1, 0.6941177, 1,
-0.162993, 0.5531541, 0.06483921, 0, 1, 0.7019608, 1,
-0.1591529, -0.9267994, -3.51128, 0, 1, 0.7058824, 1,
-0.1574358, -0.6257797, -2.877438, 0, 1, 0.7137255, 1,
-0.1531121, -0.6235769, -2.089002, 0, 1, 0.7176471, 1,
-0.1495685, -1.788704, -3.883785, 0, 1, 0.7254902, 1,
-0.1457523, 0.9108819, -0.250892, 0, 1, 0.7294118, 1,
-0.1452024, 0.1208172, -0.6499739, 0, 1, 0.7372549, 1,
-0.1420446, 1.11678, -1.043828, 0, 1, 0.7411765, 1,
-0.142034, 0.9673364, 1.37595, 0, 1, 0.7490196, 1,
-0.1405118, -0.8808097, -3.228129, 0, 1, 0.7529412, 1,
-0.1359606, 1.827623, -0.2049366, 0, 1, 0.7607843, 1,
-0.130912, -2.128395, -3.710724, 0, 1, 0.7647059, 1,
-0.129095, -0.1690165, -2.346713, 0, 1, 0.772549, 1,
-0.1274676, 1.935028, 0.299049, 0, 1, 0.7764706, 1,
-0.1206471, 0.0861764, -0.1352928, 0, 1, 0.7843137, 1,
-0.1197142, 0.75771, 0.07531448, 0, 1, 0.7882353, 1,
-0.1156303, 0.0127834, -1.166326, 0, 1, 0.7960784, 1,
-0.1070556, 0.579457, -0.4338244, 0, 1, 0.8039216, 1,
-0.105869, 0.8374605, 0.03145271, 0, 1, 0.8078431, 1,
-0.1038074, 0.2564048, 0.1393854, 0, 1, 0.8156863, 1,
-0.1002307, -0.2006415, -2.456328, 0, 1, 0.8196079, 1,
-0.1001873, -0.6614389, -4.488667, 0, 1, 0.827451, 1,
-0.09680483, -0.3301188, -3.881877, 0, 1, 0.8313726, 1,
-0.09387838, -1.888832, -3.473826, 0, 1, 0.8392157, 1,
-0.07825621, -1.014387, -5.056764, 0, 1, 0.8431373, 1,
-0.07671624, -0.4496876, -2.223279, 0, 1, 0.8509804, 1,
-0.0763347, 2.648267, 0.687176, 0, 1, 0.854902, 1,
-0.07435172, -0.5047711, -2.712745, 0, 1, 0.8627451, 1,
-0.07344875, -0.1261689, -2.314292, 0, 1, 0.8666667, 1,
-0.06759705, 0.115564, -0.05748852, 0, 1, 0.8745098, 1,
-0.06605455, 0.5074958, -1.435397, 0, 1, 0.8784314, 1,
-0.06337194, 0.02688849, -1.277808, 0, 1, 0.8862745, 1,
-0.06306706, -1.100743, -2.355932, 0, 1, 0.8901961, 1,
-0.06129217, -0.389001, -1.831105, 0, 1, 0.8980392, 1,
-0.05924071, -1.873951, -3.183944, 0, 1, 0.9058824, 1,
-0.05724743, -0.7635241, -3.345403, 0, 1, 0.9098039, 1,
-0.0549102, -0.4904033, -1.610072, 0, 1, 0.9176471, 1,
-0.05307693, 0.4821368, -0.03854911, 0, 1, 0.9215686, 1,
-0.05301046, -0.06971722, -2.346009, 0, 1, 0.9294118, 1,
-0.04983978, 0.7714782, -0.8689439, 0, 1, 0.9333333, 1,
-0.04829462, 1.12009, 0.5064511, 0, 1, 0.9411765, 1,
-0.0475113, -0.7222872, -2.856551, 0, 1, 0.945098, 1,
-0.04578426, 2.426126, -0.03757186, 0, 1, 0.9529412, 1,
-0.04054803, 0.6899335, -0.2790782, 0, 1, 0.9568627, 1,
-0.0404251, -1.850644, -1.977165, 0, 1, 0.9647059, 1,
-0.03899913, -1.578498, -4.673267, 0, 1, 0.9686275, 1,
-0.03725437, -0.6727307, -4.032435, 0, 1, 0.9764706, 1,
-0.03151305, 2.326258, -0.6425372, 0, 1, 0.9803922, 1,
-0.03147319, -1.314371, -0.9520512, 0, 1, 0.9882353, 1,
-0.02948368, -0.3124961, -2.222122, 0, 1, 0.9921569, 1,
-0.02453215, 0.03959342, -0.2504497, 0, 1, 1, 1,
-0.0237261, -0.1209109, -4.736184, 0, 0.9921569, 1, 1,
-0.02116032, 0.339764, -0.4163622, 0, 0.9882353, 1, 1,
-0.01973416, -0.929395, -3.979795, 0, 0.9803922, 1, 1,
-0.01952538, -1.98293, -4.948867, 0, 0.9764706, 1, 1,
-0.01395465, -0.5043789, -4.44356, 0, 0.9686275, 1, 1,
-0.01330702, 0.54608, -1.216372, 0, 0.9647059, 1, 1,
-0.01290088, -0.1499377, -3.427724, 0, 0.9568627, 1, 1,
-0.01007277, 0.6617934, 1.583313, 0, 0.9529412, 1, 1,
-0.006535916, -0.07565501, -4.238112, 0, 0.945098, 1, 1,
-0.004356535, 0.1295962, 1.877766, 0, 0.9411765, 1, 1,
-0.003378057, 0.9861535, -0.5487183, 0, 0.9333333, 1, 1,
-0.001769197, -0.8688236, -4.334319, 0, 0.9294118, 1, 1,
-0.000141715, 0.3515432, 1.483701, 0, 0.9215686, 1, 1,
0.0005985052, 0.5033731, -0.141625, 0, 0.9176471, 1, 1,
0.0100006, -2.783739, 3.115136, 0, 0.9098039, 1, 1,
0.01277144, 0.05237899, -0.1646527, 0, 0.9058824, 1, 1,
0.01527481, -0.02355248, 0.553231, 0, 0.8980392, 1, 1,
0.01914956, -0.8000261, 3.638949, 0, 0.8901961, 1, 1,
0.02188724, 0.2919793, 0.6638966, 0, 0.8862745, 1, 1,
0.02732487, -0.9203023, 2.921953, 0, 0.8784314, 1, 1,
0.03099478, -0.2756173, 3.25819, 0, 0.8745098, 1, 1,
0.0331704, -0.1185685, 3.115013, 0, 0.8666667, 1, 1,
0.0350787, 0.2128914, -0.4132609, 0, 0.8627451, 1, 1,
0.04040096, 1.123049, 0.1302606, 0, 0.854902, 1, 1,
0.04258093, -1.294921, 3.838474, 0, 0.8509804, 1, 1,
0.04444486, -0.0007443374, 1.868528, 0, 0.8431373, 1, 1,
0.04956293, 0.6612228, -0.5789155, 0, 0.8392157, 1, 1,
0.05003277, 0.4473832, 1.130448, 0, 0.8313726, 1, 1,
0.05134507, 0.6399039, 0.7068294, 0, 0.827451, 1, 1,
0.05224672, -0.8267285, 3.77044, 0, 0.8196079, 1, 1,
0.05426368, 1.441509, -0.6241875, 0, 0.8156863, 1, 1,
0.05465324, 1.782914, 0.9161046, 0, 0.8078431, 1, 1,
0.05826798, 0.5189329, 1.111905, 0, 0.8039216, 1, 1,
0.06134719, -1.601108, 3.565721, 0, 0.7960784, 1, 1,
0.07028939, -0.6904843, 4.807255, 0, 0.7882353, 1, 1,
0.07266263, -0.8668623, 3.64663, 0, 0.7843137, 1, 1,
0.07274155, -0.1406136, 5.06071, 0, 0.7764706, 1, 1,
0.0729801, 0.1003478, 0.5221919, 0, 0.772549, 1, 1,
0.07952628, -0.9112326, 2.435919, 0, 0.7647059, 1, 1,
0.08125933, 0.588783, -0.2624898, 0, 0.7607843, 1, 1,
0.08766092, -0.08264501, 1.835632, 0, 0.7529412, 1, 1,
0.09794555, -0.2774415, 3.335664, 0, 0.7490196, 1, 1,
0.1019862, 0.5059661, -1.291837, 0, 0.7411765, 1, 1,
0.106866, 1.656469, 0.6304228, 0, 0.7372549, 1, 1,
0.1075798, 1.182488, -1.923623, 0, 0.7294118, 1, 1,
0.1162277, 0.9719567, 1.428593, 0, 0.7254902, 1, 1,
0.1177636, -0.6233675, 3.579005, 0, 0.7176471, 1, 1,
0.1221905, -1.336337, 3.819753, 0, 0.7137255, 1, 1,
0.1255518, 0.8516833, -0.6125139, 0, 0.7058824, 1, 1,
0.1288378, -1.07381, 2.326958, 0, 0.6980392, 1, 1,
0.1296664, 1.508068, -0.3598956, 0, 0.6941177, 1, 1,
0.130693, -0.6072962, 2.312905, 0, 0.6862745, 1, 1,
0.1380715, 0.07060291, 0.7119977, 0, 0.682353, 1, 1,
0.1413551, -2.092203, 1.849722, 0, 0.6745098, 1, 1,
0.1452312, 0.2696733, 2.266862, 0, 0.6705883, 1, 1,
0.1540834, 0.6917673, -0.5584372, 0, 0.6627451, 1, 1,
0.1572725, 1.326829, 1.144477, 0, 0.6588235, 1, 1,
0.1599436, 0.4744502, 0.6670222, 0, 0.6509804, 1, 1,
0.1617466, 0.9672807, -1.003079, 0, 0.6470588, 1, 1,
0.1624355, 1.033701, 0.5525545, 0, 0.6392157, 1, 1,
0.1646938, 1.726612, -1.294124, 0, 0.6352941, 1, 1,
0.1652274, 0.2716423, -0.8716635, 0, 0.627451, 1, 1,
0.1782354, 0.1034964, 1.539123, 0, 0.6235294, 1, 1,
0.1813786, -0.9402452, 2.480147, 0, 0.6156863, 1, 1,
0.1832774, -1.460684, 3.728836, 0, 0.6117647, 1, 1,
0.1869112, -0.493581, 1.937695, 0, 0.6039216, 1, 1,
0.1881961, -1.290627, 4.709201, 0, 0.5960785, 1, 1,
0.1889985, 1.105169, -0.5633055, 0, 0.5921569, 1, 1,
0.1949363, -2.214065, 3.816253, 0, 0.5843138, 1, 1,
0.1974994, -0.314839, 2.069969, 0, 0.5803922, 1, 1,
0.1987496, 0.5491109, 0.4736483, 0, 0.572549, 1, 1,
0.2035084, 1.09321, -0.09701509, 0, 0.5686275, 1, 1,
0.2048453, 1.17675, 0.5708305, 0, 0.5607843, 1, 1,
0.2048847, -0.396735, 1.618617, 0, 0.5568628, 1, 1,
0.2053297, -1.894822, 3.130248, 0, 0.5490196, 1, 1,
0.2071556, -0.5726188, 2.371077, 0, 0.5450981, 1, 1,
0.2204428, 1.392974, -0.9715544, 0, 0.5372549, 1, 1,
0.2243232, 0.704353, 2.817563, 0, 0.5333334, 1, 1,
0.2282018, 0.309285, -0.635597, 0, 0.5254902, 1, 1,
0.2316645, 1.061696, -0.303391, 0, 0.5215687, 1, 1,
0.2320463, -1.241411, 2.822272, 0, 0.5137255, 1, 1,
0.2348198, 0.8252212, 0.4507291, 0, 0.509804, 1, 1,
0.2353406, -1.441317, 1.911872, 0, 0.5019608, 1, 1,
0.2425533, 1.013785, 0.3141639, 0, 0.4941176, 1, 1,
0.2434808, 0.1156133, 2.627625, 0, 0.4901961, 1, 1,
0.2446986, 0.4310782, -0.9480835, 0, 0.4823529, 1, 1,
0.245156, -0.007370302, 1.611257, 0, 0.4784314, 1, 1,
0.246182, 0.1523366, 1.362734, 0, 0.4705882, 1, 1,
0.2493924, -0.7272882, 4.69903, 0, 0.4666667, 1, 1,
0.2508074, 1.175245, -0.8584212, 0, 0.4588235, 1, 1,
0.2531381, 0.2461657, 1.295151, 0, 0.454902, 1, 1,
0.253462, -0.946413, 4.433589, 0, 0.4470588, 1, 1,
0.2548579, 1.41171, -1.181715, 0, 0.4431373, 1, 1,
0.2568814, 0.7323266, 0.8254846, 0, 0.4352941, 1, 1,
0.2570476, 1.156603, 0.1502627, 0, 0.4313726, 1, 1,
0.2630036, 1.299424, 1.327517, 0, 0.4235294, 1, 1,
0.2645822, -0.6262655, 1.099604, 0, 0.4196078, 1, 1,
0.2651599, 0.275273, 0.9627545, 0, 0.4117647, 1, 1,
0.2663117, -0.9861229, 3.288188, 0, 0.4078431, 1, 1,
0.2697397, 0.8002, -1.547713, 0, 0.4, 1, 1,
0.2727441, -0.2608376, 3.901639, 0, 0.3921569, 1, 1,
0.2737837, 0.6631951, -0.3998885, 0, 0.3882353, 1, 1,
0.2808913, 1.60324, -0.6919759, 0, 0.3803922, 1, 1,
0.2835009, -0.03110921, 1.802594, 0, 0.3764706, 1, 1,
0.2907348, 0.1857856, -0.1009602, 0, 0.3686275, 1, 1,
0.2942948, -0.5248228, 0.7865756, 0, 0.3647059, 1, 1,
0.3011703, -0.3799238, 2.200456, 0, 0.3568628, 1, 1,
0.3025284, -0.3683401, 2.595113, 0, 0.3529412, 1, 1,
0.3045335, -0.4331488, 2.558583, 0, 0.345098, 1, 1,
0.3057728, 0.6717861, -0.2839563, 0, 0.3411765, 1, 1,
0.3076729, 1.418149, 0.8239495, 0, 0.3333333, 1, 1,
0.3082772, -2.6089, 3.90064, 0, 0.3294118, 1, 1,
0.313134, 0.1406421, 1.611248, 0, 0.3215686, 1, 1,
0.3162735, 1.9978, -0.9479221, 0, 0.3176471, 1, 1,
0.3185234, -0.01004423, 2.356647, 0, 0.3098039, 1, 1,
0.3212714, -0.8108804, 3.237778, 0, 0.3058824, 1, 1,
0.3220057, -0.9363856, 2.794141, 0, 0.2980392, 1, 1,
0.3237686, 1.923081, 1.064439, 0, 0.2901961, 1, 1,
0.3277201, 0.7405946, 0.9433052, 0, 0.2862745, 1, 1,
0.3289591, 0.5434182, 1.162418, 0, 0.2784314, 1, 1,
0.3340834, -1.514599, 3.656677, 0, 0.2745098, 1, 1,
0.3396701, -0.5775587, 2.685847, 0, 0.2666667, 1, 1,
0.3402013, -0.3066069, 0.6138704, 0, 0.2627451, 1, 1,
0.3421598, -0.06174, 1.407163, 0, 0.254902, 1, 1,
0.3430397, -1.907758, 1.012836, 0, 0.2509804, 1, 1,
0.3438903, 1.520346, 0.8124476, 0, 0.2431373, 1, 1,
0.3472454, -1.448894, 2.713639, 0, 0.2392157, 1, 1,
0.3527238, 1.629457, -1.567027, 0, 0.2313726, 1, 1,
0.3531098, -0.4876075, 3.885751, 0, 0.227451, 1, 1,
0.3557096, -0.7686622, 4.697217, 0, 0.2196078, 1, 1,
0.3558114, -0.1295673, 2.006473, 0, 0.2156863, 1, 1,
0.3565885, 0.6075472, 0.04256513, 0, 0.2078431, 1, 1,
0.3577203, 2.127322, 0.4565531, 0, 0.2039216, 1, 1,
0.3590085, -1.42746, 1.977018, 0, 0.1960784, 1, 1,
0.3632616, 1.542102, -0.199893, 0, 0.1882353, 1, 1,
0.3636052, 1.090668, 1.35549, 0, 0.1843137, 1, 1,
0.364298, 0.4290723, 1.66749, 0, 0.1764706, 1, 1,
0.3653855, -2.737059, 4.121717, 0, 0.172549, 1, 1,
0.3690704, -0.5098539, 3.073017, 0, 0.1647059, 1, 1,
0.3715839, -0.7440339, 3.376448, 0, 0.1607843, 1, 1,
0.3752444, -0.2929598, 2.854152, 0, 0.1529412, 1, 1,
0.3761431, 0.2835973, 1.510905, 0, 0.1490196, 1, 1,
0.3806279, -1.6904, 3.587631, 0, 0.1411765, 1, 1,
0.3849171, 0.4597213, 1.251557, 0, 0.1372549, 1, 1,
0.386858, -0.009712067, 3.182151, 0, 0.1294118, 1, 1,
0.3889668, -1.042826, 2.766603, 0, 0.1254902, 1, 1,
0.3908685, -1.003522, 3.941777, 0, 0.1176471, 1, 1,
0.3917971, -1.932942, 1.567769, 0, 0.1137255, 1, 1,
0.3942398, 0.7485842, 0.0936277, 0, 0.1058824, 1, 1,
0.3954866, -0.1616719, 1.523334, 0, 0.09803922, 1, 1,
0.3955964, 1.260726, -0.07291662, 0, 0.09411765, 1, 1,
0.3962395, 1.34561, 0.4020589, 0, 0.08627451, 1, 1,
0.3987255, -0.1730391, 1.607809, 0, 0.08235294, 1, 1,
0.406346, 1.164299, 0.4711633, 0, 0.07450981, 1, 1,
0.4080167, -0.08291257, 3.04452, 0, 0.07058824, 1, 1,
0.4091927, -2.090293, 6.26078, 0, 0.0627451, 1, 1,
0.4152191, -2.021724, 3.59653, 0, 0.05882353, 1, 1,
0.4152364, -0.6270494, 4.290852, 0, 0.05098039, 1, 1,
0.4162724, -1.214957, 3.159661, 0, 0.04705882, 1, 1,
0.417695, 2.690533, 0.2653369, 0, 0.03921569, 1, 1,
0.4177409, 0.8597871, -0.7682931, 0, 0.03529412, 1, 1,
0.4211743, 0.1919137, 0.6810347, 0, 0.02745098, 1, 1,
0.421964, 1.468816, 1.274415, 0, 0.02352941, 1, 1,
0.4225306, -1.880062, 1.714839, 0, 0.01568628, 1, 1,
0.4243543, 1.169975, 0.1501367, 0, 0.01176471, 1, 1,
0.425635, -1.443706, 4.050783, 0, 0.003921569, 1, 1,
0.4275523, 0.2859805, -0.1144514, 0.003921569, 0, 1, 1,
0.4275899, -0.01059898, 1.742398, 0.007843138, 0, 1, 1,
0.4287947, -1.608876, 5.343111, 0.01568628, 0, 1, 1,
0.4319153, 0.4098197, 0.7315686, 0.01960784, 0, 1, 1,
0.4321693, 0.1910865, 2.482752, 0.02745098, 0, 1, 1,
0.4405121, -0.004905839, 1.422819, 0.03137255, 0, 1, 1,
0.4415873, -1.730488, 3.350885, 0.03921569, 0, 1, 1,
0.4424312, -1.553364, 2.720759, 0.04313726, 0, 1, 1,
0.4471052, -0.9500043, 0.8246104, 0.05098039, 0, 1, 1,
0.4523679, -0.6010626, 1.57971, 0.05490196, 0, 1, 1,
0.4523743, 0.5063556, 0.9809108, 0.0627451, 0, 1, 1,
0.4528285, 0.03135765, -0.2595731, 0.06666667, 0, 1, 1,
0.4529634, -0.7658636, 1.372355, 0.07450981, 0, 1, 1,
0.4599248, 0.05070318, 1.252278, 0.07843138, 0, 1, 1,
0.4639832, 0.6552282, -0.07375427, 0.08627451, 0, 1, 1,
0.4653779, -0.5180705, 2.244802, 0.09019608, 0, 1, 1,
0.4672035, 0.4317866, 0.9891231, 0.09803922, 0, 1, 1,
0.4686562, 1.333788, 1.943479, 0.1058824, 0, 1, 1,
0.4720843, -0.26087, 4.963996, 0.1098039, 0, 1, 1,
0.4724949, -0.5947646, 1.444507, 0.1176471, 0, 1, 1,
0.4751085, 2.26879, 1.000527, 0.1215686, 0, 1, 1,
0.4765866, 0.670048, 0.8369561, 0.1294118, 0, 1, 1,
0.4788056, -1.289145, 2.774459, 0.1333333, 0, 1, 1,
0.5014256, 0.3170888, 0.6550954, 0.1411765, 0, 1, 1,
0.5036827, -0.9767572, 2.182704, 0.145098, 0, 1, 1,
0.5041973, -0.03346269, 1.794108, 0.1529412, 0, 1, 1,
0.5086444, -0.220705, 1.136173, 0.1568628, 0, 1, 1,
0.5105095, 0.8014443, -0.5928971, 0.1647059, 0, 1, 1,
0.5141139, 0.6569374, 2.418696, 0.1686275, 0, 1, 1,
0.5158629, -1.045932, 2.052583, 0.1764706, 0, 1, 1,
0.5192809, 0.5463489, 0.1741434, 0.1803922, 0, 1, 1,
0.5207626, -0.3419094, 2.074896, 0.1882353, 0, 1, 1,
0.5231853, -0.5821888, 1.872465, 0.1921569, 0, 1, 1,
0.5263702, -0.1622483, 1.3314, 0.2, 0, 1, 1,
0.5284712, -0.7526152, 2.775273, 0.2078431, 0, 1, 1,
0.5311316, 0.4869559, 1.00633, 0.2117647, 0, 1, 1,
0.5327698, 0.05768654, 1.292839, 0.2196078, 0, 1, 1,
0.5332713, 0.7065239, 0.961945, 0.2235294, 0, 1, 1,
0.5366246, 0.3046079, 1.336845, 0.2313726, 0, 1, 1,
0.5387387, 2.681813, -2.240825, 0.2352941, 0, 1, 1,
0.5443479, -0.8872929, 2.038436, 0.2431373, 0, 1, 1,
0.5448258, 0.4379913, 3.38507, 0.2470588, 0, 1, 1,
0.5463061, -1.035168, 2.070107, 0.254902, 0, 1, 1,
0.546343, 2.08272, -1.411814, 0.2588235, 0, 1, 1,
0.5558509, 0.179399, 0.2354795, 0.2666667, 0, 1, 1,
0.558916, -0.5997027, 2.419499, 0.2705882, 0, 1, 1,
0.5591895, -0.3808421, 0.8646967, 0.2784314, 0, 1, 1,
0.5667971, 0.4633202, 0.5830065, 0.282353, 0, 1, 1,
0.5679476, 0.8888664, 0.4883032, 0.2901961, 0, 1, 1,
0.5691355, -1.148403, 4.448285, 0.2941177, 0, 1, 1,
0.5766814, -0.7923234, 2.295137, 0.3019608, 0, 1, 1,
0.577045, 0.5750803, 0.7463044, 0.3098039, 0, 1, 1,
0.5770557, 0.9961063, 0.9205756, 0.3137255, 0, 1, 1,
0.581946, 0.4881086, 1.268475, 0.3215686, 0, 1, 1,
0.5854138, -1.171171, 2.193605, 0.3254902, 0, 1, 1,
0.5858747, -0.8944677, 2.766499, 0.3333333, 0, 1, 1,
0.5876341, -1.498968, 2.018637, 0.3372549, 0, 1, 1,
0.590087, 0.4824143, 0.6112688, 0.345098, 0, 1, 1,
0.5940698, 0.9171084, -0.4326336, 0.3490196, 0, 1, 1,
0.5985063, -0.3600304, 1.560478, 0.3568628, 0, 1, 1,
0.602922, -0.1348902, 1.377645, 0.3607843, 0, 1, 1,
0.6052261, 1.366, -0.8042355, 0.3686275, 0, 1, 1,
0.612087, -0.5319699, 2.263167, 0.372549, 0, 1, 1,
0.6157956, 0.669168, 0.4793257, 0.3803922, 0, 1, 1,
0.6191415, -0.2000167, 0.8766974, 0.3843137, 0, 1, 1,
0.6249672, 0.1264015, 1.224098, 0.3921569, 0, 1, 1,
0.6257417, 1.793772, -0.3255985, 0.3960784, 0, 1, 1,
0.631962, 0.8445481, 0.9627529, 0.4039216, 0, 1, 1,
0.6357833, 0.9863707, -0.4055859, 0.4117647, 0, 1, 1,
0.6365759, 0.03516573, 1.612131, 0.4156863, 0, 1, 1,
0.6389437, -0.4318251, 2.414391, 0.4235294, 0, 1, 1,
0.6446174, 0.9201851, -0.7006216, 0.427451, 0, 1, 1,
0.6536464, 0.7723109, 2.883925, 0.4352941, 0, 1, 1,
0.6550165, -1.099189, 1.219962, 0.4392157, 0, 1, 1,
0.6550967, 0.9108502, 0.2573106, 0.4470588, 0, 1, 1,
0.6565095, -0.04404036, 0.9905359, 0.4509804, 0, 1, 1,
0.6589895, 0.1623066, 1.594534, 0.4588235, 0, 1, 1,
0.6636145, 2.595735, 0.6855091, 0.4627451, 0, 1, 1,
0.6675633, -0.2964001, 1.199262, 0.4705882, 0, 1, 1,
0.6701633, -0.2332514, 2.562797, 0.4745098, 0, 1, 1,
0.6734156, 2.528439, -1.366665, 0.4823529, 0, 1, 1,
0.6750103, -0.2344168, 3.088051, 0.4862745, 0, 1, 1,
0.6771396, 0.1000518, 1.695023, 0.4941176, 0, 1, 1,
0.6829123, -0.8159189, 3.548215, 0.5019608, 0, 1, 1,
0.6845266, 0.2856613, 0.7088629, 0.5058824, 0, 1, 1,
0.6854311, 1.20087, -0.09291567, 0.5137255, 0, 1, 1,
0.6888579, 0.5706655, -0.9709219, 0.5176471, 0, 1, 1,
0.6928813, -1.549106, 2.858076, 0.5254902, 0, 1, 1,
0.7003692, -0.672835, 2.629319, 0.5294118, 0, 1, 1,
0.7017483, -0.6022796, 1.112654, 0.5372549, 0, 1, 1,
0.7024148, 0.5811923, 1.576099, 0.5411765, 0, 1, 1,
0.7043489, 1.335768, 0.38047, 0.5490196, 0, 1, 1,
0.7169388, 0.7697936, -0.937058, 0.5529412, 0, 1, 1,
0.7231327, 0.1644878, 2.109647, 0.5607843, 0, 1, 1,
0.733766, -0.8060756, 3.135635, 0.5647059, 0, 1, 1,
0.7387438, -1.008736, 4.221884, 0.572549, 0, 1, 1,
0.7459161, -0.6697418, 4.325227, 0.5764706, 0, 1, 1,
0.7467174, 1.084846, -0.479057, 0.5843138, 0, 1, 1,
0.7493834, 0.1536309, 0.8232104, 0.5882353, 0, 1, 1,
0.7505783, 1.314415, 1.302469, 0.5960785, 0, 1, 1,
0.7535207, -0.5339304, 0.8201654, 0.6039216, 0, 1, 1,
0.7544369, -1.379526, 1.721512, 0.6078432, 0, 1, 1,
0.7559602, -1.337566, 4.363471, 0.6156863, 0, 1, 1,
0.7563245, -0.4912104, 0.8253686, 0.6196079, 0, 1, 1,
0.7584673, 0.4491322, 1.622791, 0.627451, 0, 1, 1,
0.7595449, 1.558716, 1.176817, 0.6313726, 0, 1, 1,
0.7646739, 0.8289765, 1.476896, 0.6392157, 0, 1, 1,
0.766422, 0.3890467, 0.9379981, 0.6431373, 0, 1, 1,
0.7664891, 0.03829253, 0.6161901, 0.6509804, 0, 1, 1,
0.7682545, 1.792111, -0.3059227, 0.654902, 0, 1, 1,
0.7714434, -0.4316152, 1.444658, 0.6627451, 0, 1, 1,
0.7715933, -0.7541616, 2.714948, 0.6666667, 0, 1, 1,
0.7778701, 1.232798, 0.4004388, 0.6745098, 0, 1, 1,
0.7807216, -0.2522611, 0.7643283, 0.6784314, 0, 1, 1,
0.7835982, -0.5178035, 2.550987, 0.6862745, 0, 1, 1,
0.7859803, 1.021651, 1.937304, 0.6901961, 0, 1, 1,
0.7860711, -2.50694, 1.805736, 0.6980392, 0, 1, 1,
0.7873053, -1.214231, 3.234138, 0.7058824, 0, 1, 1,
0.7875187, -0.3097069, 1.178389, 0.7098039, 0, 1, 1,
0.7983072, 0.2605677, 1.129606, 0.7176471, 0, 1, 1,
0.805273, 0.4004372, -0.151166, 0.7215686, 0, 1, 1,
0.8072805, -1.318777, 1.721513, 0.7294118, 0, 1, 1,
0.8142803, -0.3954745, 3.417085, 0.7333333, 0, 1, 1,
0.8278952, -0.1467956, 2.092293, 0.7411765, 0, 1, 1,
0.828086, -0.1418579, 1.837905, 0.7450981, 0, 1, 1,
0.8304029, -0.8519536, 1.032912, 0.7529412, 0, 1, 1,
0.8308306, -1.288275, 2.826906, 0.7568628, 0, 1, 1,
0.8312313, 0.1957161, -0.6079152, 0.7647059, 0, 1, 1,
0.8345095, -0.08832757, 2.281898, 0.7686275, 0, 1, 1,
0.8407501, -0.3134532, 2.670873, 0.7764706, 0, 1, 1,
0.8439314, -1.158806, 3.69204, 0.7803922, 0, 1, 1,
0.8471758, -0.3766429, 2.329369, 0.7882353, 0, 1, 1,
0.8487725, 0.08136597, 1.45075, 0.7921569, 0, 1, 1,
0.8517904, 0.1269736, 0.4809835, 0.8, 0, 1, 1,
0.8546394, -0.4300145, 4.061807, 0.8078431, 0, 1, 1,
0.8585436, -0.8952525, 1.889152, 0.8117647, 0, 1, 1,
0.8608205, 0.8144881, 2.171434, 0.8196079, 0, 1, 1,
0.861133, 1.172419, -0.1649837, 0.8235294, 0, 1, 1,
0.8669038, 1.073858, -0.8304046, 0.8313726, 0, 1, 1,
0.8733075, 0.5178251, 0.7508186, 0.8352941, 0, 1, 1,
0.8814551, 0.8355132, 2.310616, 0.8431373, 0, 1, 1,
0.8867901, 0.08045083, 1.223662, 0.8470588, 0, 1, 1,
0.9095334, 0.5750889, 1.204537, 0.854902, 0, 1, 1,
0.9108261, 1.52547, 0.8763203, 0.8588235, 0, 1, 1,
0.9221554, -1.339759, 1.996181, 0.8666667, 0, 1, 1,
0.9267107, 0.0392197, 0.3875216, 0.8705882, 0, 1, 1,
0.9310714, 1.986175, 1.150103, 0.8784314, 0, 1, 1,
0.9313466, 1.231894, 1.59188, 0.8823529, 0, 1, 1,
0.9389265, 1.317615, -0.2613171, 0.8901961, 0, 1, 1,
0.9397638, 0.6467053, 3.299035, 0.8941177, 0, 1, 1,
0.9403466, -1.430055, 1.737556, 0.9019608, 0, 1, 1,
0.9421311, -1.134344, 1.982263, 0.9098039, 0, 1, 1,
0.9444, -2.346436, 1.760655, 0.9137255, 0, 1, 1,
0.9456278, 1.368824, 0.6745908, 0.9215686, 0, 1, 1,
0.945908, 2.172634, 0.9911196, 0.9254902, 0, 1, 1,
0.9547259, -1.787454, 4.493815, 0.9333333, 0, 1, 1,
0.9579294, -0.9241116, 2.207686, 0.9372549, 0, 1, 1,
0.9585015, 0.4435383, -0.008860314, 0.945098, 0, 1, 1,
0.9628163, -1.385509, 1.382842, 0.9490196, 0, 1, 1,
0.970697, -0.5015013, 2.660787, 0.9568627, 0, 1, 1,
0.9731264, 0.4260939, -0.5958471, 0.9607843, 0, 1, 1,
0.9876412, 0.2450982, 0.6928076, 0.9686275, 0, 1, 1,
0.9928205, -0.3826133, 3.273038, 0.972549, 0, 1, 1,
0.9938515, 1.65024, -0.1777895, 0.9803922, 0, 1, 1,
0.9968539, -0.7938273, 3.632771, 0.9843137, 0, 1, 1,
0.9982906, -0.07182637, 0.8998647, 0.9921569, 0, 1, 1,
1.000069, 1.831151, 1.022021, 0.9960784, 0, 1, 1,
1.000448, 1.309922, 0.253066, 1, 0, 0.9960784, 1,
1.005195, 0.1600985, 2.178167, 1, 0, 0.9882353, 1,
1.011379, 0.8884512, 0.9793813, 1, 0, 0.9843137, 1,
1.012783, -0.2011253, 0.3874719, 1, 0, 0.9764706, 1,
1.022549, 0.1137939, 2.095496, 1, 0, 0.972549, 1,
1.025355, 0.2988285, 2.063786, 1, 0, 0.9647059, 1,
1.032795, -0.485888, 2.756841, 1, 0, 0.9607843, 1,
1.034604, -0.3258907, 1.740655, 1, 0, 0.9529412, 1,
1.034881, -0.1252014, 2.291391, 1, 0, 0.9490196, 1,
1.036621, 1.021813, 1.764463, 1, 0, 0.9411765, 1,
1.039249, -0.1125556, 1.93518, 1, 0, 0.9372549, 1,
1.040559, 1.071756, 0.6399792, 1, 0, 0.9294118, 1,
1.04415, -1.268912, 2.13139, 1, 0, 0.9254902, 1,
1.046597, 1.441173, 0.2719906, 1, 0, 0.9176471, 1,
1.059829, 0.6608192, -0.5783423, 1, 0, 0.9137255, 1,
1.06103, 1.199529, -1.11346, 1, 0, 0.9058824, 1,
1.06912, -0.6159818, 3.077567, 1, 0, 0.9019608, 1,
1.086485, 0.02709107, 2.075313, 1, 0, 0.8941177, 1,
1.089278, 1.649655, 0.7024966, 1, 0, 0.8862745, 1,
1.091295, -2.269821, 1.845274, 1, 0, 0.8823529, 1,
1.095901, -0.07985585, 0.2689822, 1, 0, 0.8745098, 1,
1.097195, 0.4353615, 1.284387, 1, 0, 0.8705882, 1,
1.097557, -0.6437498, -0.09974622, 1, 0, 0.8627451, 1,
1.101928, -1.912835, 2.90161, 1, 0, 0.8588235, 1,
1.103893, 2.438267, 0.8641165, 1, 0, 0.8509804, 1,
1.108699, -0.3518795, 0.7326794, 1, 0, 0.8470588, 1,
1.109132, -0.001074687, -0.8069, 1, 0, 0.8392157, 1,
1.113171, -0.6936907, 2.685243, 1, 0, 0.8352941, 1,
1.113542, -0.8388765, 2.379428, 1, 0, 0.827451, 1,
1.123941, 1.211028, -1.295504, 1, 0, 0.8235294, 1,
1.126928, -1.292328, 1.828513, 1, 0, 0.8156863, 1,
1.130185, -0.1958989, 0.4833688, 1, 0, 0.8117647, 1,
1.137903, 0.646435, -0.1528822, 1, 0, 0.8039216, 1,
1.138666, 0.2744535, 1.425077, 1, 0, 0.7960784, 1,
1.142586, -0.4695401, 3.617621, 1, 0, 0.7921569, 1,
1.151001, -1.444136, 2.27197, 1, 0, 0.7843137, 1,
1.15217, -0.8684542, 1.180712, 1, 0, 0.7803922, 1,
1.155369, -0.9660817, 2.541057, 1, 0, 0.772549, 1,
1.156736, 0.1672833, 0.09315045, 1, 0, 0.7686275, 1,
1.164213, 1.62983, -0.1633385, 1, 0, 0.7607843, 1,
1.165895, -0.2669752, 1.612043, 1, 0, 0.7568628, 1,
1.177308, 1.187369, 0.9018045, 1, 0, 0.7490196, 1,
1.182799, -0.4989651, 2.831754, 1, 0, 0.7450981, 1,
1.190756, -0.1187847, 2.593082, 1, 0, 0.7372549, 1,
1.201524, 0.5480261, 2.39484, 1, 0, 0.7333333, 1,
1.202575, 0.3611133, -0.1952704, 1, 0, 0.7254902, 1,
1.205398, 0.2962977, 0.8974594, 1, 0, 0.7215686, 1,
1.206373, 0.4833326, 2.483144, 1, 0, 0.7137255, 1,
1.206676, -0.3937935, 1.254431, 1, 0, 0.7098039, 1,
1.211312, 0.02406157, 2.382922, 1, 0, 0.7019608, 1,
1.213317, -0.3686594, 1.190613, 1, 0, 0.6941177, 1,
1.213991, -0.706101, 0.7035804, 1, 0, 0.6901961, 1,
1.214944, -1.536661, 1.669972, 1, 0, 0.682353, 1,
1.215252, 1.116057, 0.1080207, 1, 0, 0.6784314, 1,
1.226441, 0.2958397, 3.128564, 1, 0, 0.6705883, 1,
1.229617, 0.7217613, 1.969627, 1, 0, 0.6666667, 1,
1.23148, -0.9093072, 1.323928, 1, 0, 0.6588235, 1,
1.234355, 1.957041, -0.2701969, 1, 0, 0.654902, 1,
1.237759, -0.9386123, 3.628842, 1, 0, 0.6470588, 1,
1.246028, -0.8390688, 4.312987, 1, 0, 0.6431373, 1,
1.24648, -2.532273, 4.210719, 1, 0, 0.6352941, 1,
1.256671, -0.1299134, 0.1859925, 1, 0, 0.6313726, 1,
1.260973, -1.11668, 2.909677, 1, 0, 0.6235294, 1,
1.261307, -1.46736, 1.343986, 1, 0, 0.6196079, 1,
1.268029, -0.4040825, 4.155797, 1, 0, 0.6117647, 1,
1.268615, -0.5158421, 1.063657, 1, 0, 0.6078432, 1,
1.278429, 0.7598521, 1.518885, 1, 0, 0.6, 1,
1.281625, -0.2252599, 1.386562, 1, 0, 0.5921569, 1,
1.290215, 0.4715536, 0.6016642, 1, 0, 0.5882353, 1,
1.291986, -1.8261, 2.98806, 1, 0, 0.5803922, 1,
1.295603, 0.7391042, 1.221914, 1, 0, 0.5764706, 1,
1.302274, 0.3059075, 1.118832, 1, 0, 0.5686275, 1,
1.315881, 1.939012, 1.457575, 1, 0, 0.5647059, 1,
1.319073, 0.3100674, 1.724017, 1, 0, 0.5568628, 1,
1.324114, -1.177703, 0.8581432, 1, 0, 0.5529412, 1,
1.328711, -0.04185245, 2.903082, 1, 0, 0.5450981, 1,
1.335097, 0.8552198, 0.8999412, 1, 0, 0.5411765, 1,
1.335265, -1.524111, 3.132643, 1, 0, 0.5333334, 1,
1.341248, -0.2766451, 1.177208, 1, 0, 0.5294118, 1,
1.371387, 0.5009498, 1.441333, 1, 0, 0.5215687, 1,
1.372445, 2.110035, -1.339272, 1, 0, 0.5176471, 1,
1.382156, 0.3501422, 1.151501, 1, 0, 0.509804, 1,
1.385999, 1.756724, 2.369398, 1, 0, 0.5058824, 1,
1.388344, 1.088534, -0.127841, 1, 0, 0.4980392, 1,
1.392512, -0.0248897, 1.618131, 1, 0, 0.4901961, 1,
1.400852, 1.301092, 2.542222, 1, 0, 0.4862745, 1,
1.40297, 0.3491668, 2.043255, 1, 0, 0.4784314, 1,
1.407546, -0.1698411, 3.459967, 1, 0, 0.4745098, 1,
1.409779, -0.2132087, 2.266433, 1, 0, 0.4666667, 1,
1.410264, -0.05356719, -0.5568392, 1, 0, 0.4627451, 1,
1.41809, 0.2470136, 1.815054, 1, 0, 0.454902, 1,
1.421632, -1.241884, 2.029311, 1, 0, 0.4509804, 1,
1.426261, 1.136998, 1.232041, 1, 0, 0.4431373, 1,
1.429883, -0.9007497, 2.70696, 1, 0, 0.4392157, 1,
1.431285, -0.0390488, -0.08818136, 1, 0, 0.4313726, 1,
1.45135, -1.586663, 3.292572, 1, 0, 0.427451, 1,
1.454311, -0.6207222, 4.069478, 1, 0, 0.4196078, 1,
1.456374, 0.3194249, 1.775973, 1, 0, 0.4156863, 1,
1.461617, 0.1788329, 1.206792, 1, 0, 0.4078431, 1,
1.473681, 0.3341751, 2.671674, 1, 0, 0.4039216, 1,
1.497002, -0.2882091, 2.10287, 1, 0, 0.3960784, 1,
1.551172, 0.8272835, 2.191288, 1, 0, 0.3882353, 1,
1.561883, 1.827953, 1.007087, 1, 0, 0.3843137, 1,
1.570265, 0.4543598, 1.476607, 1, 0, 0.3764706, 1,
1.574012, -0.2216431, 2.224195, 1, 0, 0.372549, 1,
1.574417, -0.9179058, 2.088462, 1, 0, 0.3647059, 1,
1.576551, -1.065905, 2.630155, 1, 0, 0.3607843, 1,
1.580868, -0.2005786, 0.3832236, 1, 0, 0.3529412, 1,
1.586013, -0.3378471, 2.389969, 1, 0, 0.3490196, 1,
1.589558, 0.5162895, 2.782568, 1, 0, 0.3411765, 1,
1.591454, 1.070458, 1.150492, 1, 0, 0.3372549, 1,
1.597727, -0.01803084, 0.330389, 1, 0, 0.3294118, 1,
1.607712, 0.5845184, 0.8950563, 1, 0, 0.3254902, 1,
1.616251, 0.5048808, 0.8788182, 1, 0, 0.3176471, 1,
1.620213, 0.1914708, 0.9808826, 1, 0, 0.3137255, 1,
1.622519, -1.281045, 1.302374, 1, 0, 0.3058824, 1,
1.630847, 2.946712, -1.790185, 1, 0, 0.2980392, 1,
1.635911, 1.35943, -0.04772034, 1, 0, 0.2941177, 1,
1.656907, 1.364118, -0.5465934, 1, 0, 0.2862745, 1,
1.665303, -0.0080214, 1.521498, 1, 0, 0.282353, 1,
1.668867, -0.7917218, 1.894394, 1, 0, 0.2745098, 1,
1.676887, 1.629038, 1.972031, 1, 0, 0.2705882, 1,
1.682233, 0.9859524, -0.5005314, 1, 0, 0.2627451, 1,
1.695659, 0.03575188, 2.224393, 1, 0, 0.2588235, 1,
1.709951, -0.5653632, 2.524157, 1, 0, 0.2509804, 1,
1.711821, 1.3816, -0.2458648, 1, 0, 0.2470588, 1,
1.718147, -0.9362907, 2.20761, 1, 0, 0.2392157, 1,
1.719007, -0.5845281, 1.589175, 1, 0, 0.2352941, 1,
1.72814, -1.657483, 0.8923808, 1, 0, 0.227451, 1,
1.738276, -0.2620741, 1.908633, 1, 0, 0.2235294, 1,
1.752351, 0.8416355, 0.940482, 1, 0, 0.2156863, 1,
1.756366, 0.4688931, 2.246619, 1, 0, 0.2117647, 1,
1.759224, -0.2009871, 0.5862371, 1, 0, 0.2039216, 1,
1.76512, 0.7443676, 1.47526, 1, 0, 0.1960784, 1,
1.765621, -0.6406148, 1.55418, 1, 0, 0.1921569, 1,
1.796293, 1.738938, 0.9753799, 1, 0, 0.1843137, 1,
1.799021, 0.1406415, 0.6502566, 1, 0, 0.1803922, 1,
1.808736, 0.5349379, 1.34858, 1, 0, 0.172549, 1,
1.827897, 0.06444295, 0.2569811, 1, 0, 0.1686275, 1,
1.84263, -1.779462, 2.258739, 1, 0, 0.1607843, 1,
1.866095, 0.7557479, 0.6448423, 1, 0, 0.1568628, 1,
1.872443, 0.491443, 2.490278, 1, 0, 0.1490196, 1,
1.889624, -0.3895339, 1.941106, 1, 0, 0.145098, 1,
1.895233, 0.1998007, 0.9517522, 1, 0, 0.1372549, 1,
1.916327, -0.8352087, 2.326756, 1, 0, 0.1333333, 1,
1.947361, 1.090634, 2.559933, 1, 0, 0.1254902, 1,
1.973361, 1.379849, 1.111485, 1, 0, 0.1215686, 1,
1.983287, 0.9459802, 0.3478667, 1, 0, 0.1137255, 1,
2.00861, 0.6126912, 1.049153, 1, 0, 0.1098039, 1,
2.061778, -0.4363885, 2.010592, 1, 0, 0.1019608, 1,
2.080434, -0.9029613, 2.168927, 1, 0, 0.09411765, 1,
2.135614, -1.470403, 1.261299, 1, 0, 0.09019608, 1,
2.16283, 1.141625, 1.228023, 1, 0, 0.08235294, 1,
2.193233, -1.049915, 1.906142, 1, 0, 0.07843138, 1,
2.280886, 1.806081, 1.591681, 1, 0, 0.07058824, 1,
2.284849, 0.1372063, 1.591987, 1, 0, 0.06666667, 1,
2.287877, 0.5997737, 0.7664998, 1, 0, 0.05882353, 1,
2.294275, -0.5367206, 1.113, 1, 0, 0.05490196, 1,
2.493403, -0.491688, 0.1277724, 1, 0, 0.04705882, 1,
2.611248, -0.192007, 1.352764, 1, 0, 0.04313726, 1,
2.619357, -0.3462678, 2.42067, 1, 0, 0.03529412, 1,
2.725811, 0.07290035, 1.068814, 1, 0, 0.03137255, 1,
2.778578, 0.6938463, 1.24104, 1, 0, 0.02352941, 1,
2.952198, 0.2373627, 1.148157, 1, 0, 0.01960784, 1,
3.123437, -0.9369053, 1.995387, 1, 0, 0.01176471, 1,
3.221628, -0.5221491, 2.89924, 1, 0, 0.007843138, 1
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
-0.1346723, -4.045562, -7.077278, 0, -0.5, 0.5, 0.5,
-0.1346723, -4.045562, -7.077278, 1, -0.5, 0.5, 0.5,
-0.1346723, -4.045562, -7.077278, 1, 1.5, 0.5, 0.5,
-0.1346723, -4.045562, -7.077278, 0, 1.5, 0.5, 0.5
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
-4.628759, 0.1649578, -7.077278, 0, -0.5, 0.5, 0.5,
-4.628759, 0.1649578, -7.077278, 1, -0.5, 0.5, 0.5,
-4.628759, 0.1649578, -7.077278, 1, 1.5, 0.5, 0.5,
-4.628759, 0.1649578, -7.077278, 0, 1.5, 0.5, 0.5
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
-4.628759, -4.045562, 0.5583181, 0, -0.5, 0.5, 0.5,
-4.628759, -4.045562, 0.5583181, 1, -0.5, 0.5, 0.5,
-4.628759, -4.045562, 0.5583181, 1, 1.5, 0.5, 0.5,
-4.628759, -4.045562, 0.5583181, 0, 1.5, 0.5, 0.5
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
-3, -3.073904, -5.315217,
3, -3.073904, -5.315217,
-3, -3.073904, -5.315217,
-3, -3.235847, -5.608894,
-2, -3.073904, -5.315217,
-2, -3.235847, -5.608894,
-1, -3.073904, -5.315217,
-1, -3.235847, -5.608894,
0, -3.073904, -5.315217,
0, -3.235847, -5.608894,
1, -3.073904, -5.315217,
1, -3.235847, -5.608894,
2, -3.073904, -5.315217,
2, -3.235847, -5.608894,
3, -3.073904, -5.315217,
3, -3.235847, -5.608894
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
-3, -3.559733, -6.196248, 0, -0.5, 0.5, 0.5,
-3, -3.559733, -6.196248, 1, -0.5, 0.5, 0.5,
-3, -3.559733, -6.196248, 1, 1.5, 0.5, 0.5,
-3, -3.559733, -6.196248, 0, 1.5, 0.5, 0.5,
-2, -3.559733, -6.196248, 0, -0.5, 0.5, 0.5,
-2, -3.559733, -6.196248, 1, -0.5, 0.5, 0.5,
-2, -3.559733, -6.196248, 1, 1.5, 0.5, 0.5,
-2, -3.559733, -6.196248, 0, 1.5, 0.5, 0.5,
-1, -3.559733, -6.196248, 0, -0.5, 0.5, 0.5,
-1, -3.559733, -6.196248, 1, -0.5, 0.5, 0.5,
-1, -3.559733, -6.196248, 1, 1.5, 0.5, 0.5,
-1, -3.559733, -6.196248, 0, 1.5, 0.5, 0.5,
0, -3.559733, -6.196248, 0, -0.5, 0.5, 0.5,
0, -3.559733, -6.196248, 1, -0.5, 0.5, 0.5,
0, -3.559733, -6.196248, 1, 1.5, 0.5, 0.5,
0, -3.559733, -6.196248, 0, 1.5, 0.5, 0.5,
1, -3.559733, -6.196248, 0, -0.5, 0.5, 0.5,
1, -3.559733, -6.196248, 1, -0.5, 0.5, 0.5,
1, -3.559733, -6.196248, 1, 1.5, 0.5, 0.5,
1, -3.559733, -6.196248, 0, 1.5, 0.5, 0.5,
2, -3.559733, -6.196248, 0, -0.5, 0.5, 0.5,
2, -3.559733, -6.196248, 1, -0.5, 0.5, 0.5,
2, -3.559733, -6.196248, 1, 1.5, 0.5, 0.5,
2, -3.559733, -6.196248, 0, 1.5, 0.5, 0.5,
3, -3.559733, -6.196248, 0, -0.5, 0.5, 0.5,
3, -3.559733, -6.196248, 1, -0.5, 0.5, 0.5,
3, -3.559733, -6.196248, 1, 1.5, 0.5, 0.5,
3, -3.559733, -6.196248, 0, 1.5, 0.5, 0.5
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
-3.591662, -2, -5.315217,
-3.591662, 3, -5.315217,
-3.591662, -2, -5.315217,
-3.764512, -2, -5.608894,
-3.591662, -1, -5.315217,
-3.764512, -1, -5.608894,
-3.591662, 0, -5.315217,
-3.764512, 0, -5.608894,
-3.591662, 1, -5.315217,
-3.764512, 1, -5.608894,
-3.591662, 2, -5.315217,
-3.764512, 2, -5.608894,
-3.591662, 3, -5.315217,
-3.764512, 3, -5.608894
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
-4.11021, -2, -6.196248, 0, -0.5, 0.5, 0.5,
-4.11021, -2, -6.196248, 1, -0.5, 0.5, 0.5,
-4.11021, -2, -6.196248, 1, 1.5, 0.5, 0.5,
-4.11021, -2, -6.196248, 0, 1.5, 0.5, 0.5,
-4.11021, -1, -6.196248, 0, -0.5, 0.5, 0.5,
-4.11021, -1, -6.196248, 1, -0.5, 0.5, 0.5,
-4.11021, -1, -6.196248, 1, 1.5, 0.5, 0.5,
-4.11021, -1, -6.196248, 0, 1.5, 0.5, 0.5,
-4.11021, 0, -6.196248, 0, -0.5, 0.5, 0.5,
-4.11021, 0, -6.196248, 1, -0.5, 0.5, 0.5,
-4.11021, 0, -6.196248, 1, 1.5, 0.5, 0.5,
-4.11021, 0, -6.196248, 0, 1.5, 0.5, 0.5,
-4.11021, 1, -6.196248, 0, -0.5, 0.5, 0.5,
-4.11021, 1, -6.196248, 1, -0.5, 0.5, 0.5,
-4.11021, 1, -6.196248, 1, 1.5, 0.5, 0.5,
-4.11021, 1, -6.196248, 0, 1.5, 0.5, 0.5,
-4.11021, 2, -6.196248, 0, -0.5, 0.5, 0.5,
-4.11021, 2, -6.196248, 1, -0.5, 0.5, 0.5,
-4.11021, 2, -6.196248, 1, 1.5, 0.5, 0.5,
-4.11021, 2, -6.196248, 0, 1.5, 0.5, 0.5,
-4.11021, 3, -6.196248, 0, -0.5, 0.5, 0.5,
-4.11021, 3, -6.196248, 1, -0.5, 0.5, 0.5,
-4.11021, 3, -6.196248, 1, 1.5, 0.5, 0.5,
-4.11021, 3, -6.196248, 0, 1.5, 0.5, 0.5
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
-3.591662, -3.073904, -4,
-3.591662, -3.073904, 6,
-3.591662, -3.073904, -4,
-3.764512, -3.235847, -4,
-3.591662, -3.073904, -2,
-3.764512, -3.235847, -2,
-3.591662, -3.073904, 0,
-3.764512, -3.235847, 0,
-3.591662, -3.073904, 2,
-3.764512, -3.235847, 2,
-3.591662, -3.073904, 4,
-3.764512, -3.235847, 4,
-3.591662, -3.073904, 6,
-3.764512, -3.235847, 6
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
-4.11021, -3.559733, -4, 0, -0.5, 0.5, 0.5,
-4.11021, -3.559733, -4, 1, -0.5, 0.5, 0.5,
-4.11021, -3.559733, -4, 1, 1.5, 0.5, 0.5,
-4.11021, -3.559733, -4, 0, 1.5, 0.5, 0.5,
-4.11021, -3.559733, -2, 0, -0.5, 0.5, 0.5,
-4.11021, -3.559733, -2, 1, -0.5, 0.5, 0.5,
-4.11021, -3.559733, -2, 1, 1.5, 0.5, 0.5,
-4.11021, -3.559733, -2, 0, 1.5, 0.5, 0.5,
-4.11021, -3.559733, 0, 0, -0.5, 0.5, 0.5,
-4.11021, -3.559733, 0, 1, -0.5, 0.5, 0.5,
-4.11021, -3.559733, 0, 1, 1.5, 0.5, 0.5,
-4.11021, -3.559733, 0, 0, 1.5, 0.5, 0.5,
-4.11021, -3.559733, 2, 0, -0.5, 0.5, 0.5,
-4.11021, -3.559733, 2, 1, -0.5, 0.5, 0.5,
-4.11021, -3.559733, 2, 1, 1.5, 0.5, 0.5,
-4.11021, -3.559733, 2, 0, 1.5, 0.5, 0.5,
-4.11021, -3.559733, 4, 0, -0.5, 0.5, 0.5,
-4.11021, -3.559733, 4, 1, -0.5, 0.5, 0.5,
-4.11021, -3.559733, 4, 1, 1.5, 0.5, 0.5,
-4.11021, -3.559733, 4, 0, 1.5, 0.5, 0.5,
-4.11021, -3.559733, 6, 0, -0.5, 0.5, 0.5,
-4.11021, -3.559733, 6, 1, -0.5, 0.5, 0.5,
-4.11021, -3.559733, 6, 1, 1.5, 0.5, 0.5,
-4.11021, -3.559733, 6, 0, 1.5, 0.5, 0.5
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
-3.591662, -3.073904, -5.315217,
-3.591662, 3.403819, -5.315217,
-3.591662, -3.073904, 6.431854,
-3.591662, 3.403819, 6.431854,
-3.591662, -3.073904, -5.315217,
-3.591662, -3.073904, 6.431854,
-3.591662, 3.403819, -5.315217,
-3.591662, 3.403819, 6.431854,
-3.591662, -3.073904, -5.315217,
3.322317, -3.073904, -5.315217,
-3.591662, -3.073904, 6.431854,
3.322317, -3.073904, 6.431854,
-3.591662, 3.403819, -5.315217,
3.322317, 3.403819, -5.315217,
-3.591662, 3.403819, 6.431854,
3.322317, 3.403819, 6.431854,
3.322317, -3.073904, -5.315217,
3.322317, 3.403819, -5.315217,
3.322317, -3.073904, 6.431854,
3.322317, 3.403819, 6.431854,
3.322317, -3.073904, -5.315217,
3.322317, -3.073904, 6.431854,
3.322317, 3.403819, -5.315217,
3.322317, 3.403819, 6.431854
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
var radius = 8.058644;
var distance = 35.85382;
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
mvMatrix.translate( 0.1346723, -0.1649578, -0.5583181 );
mvMatrix.scale( 1.260224, 1.345097, 0.7417307 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.85382);
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
hexaflumuron<-read.table("hexaflumuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hexaflumuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'hexaflumuron' not found
```

```r
y<-hexaflumuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'hexaflumuron' not found
```

```r
z<-hexaflumuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'hexaflumuron' not found
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
-3.490973, -1.524373, -0.9222273, 0, 0, 1, 1, 1,
-3.12197, -0.9812274, -3.681553, 1, 0, 0, 1, 1,
-3.004447, -1.35126, -3.170692, 1, 0, 0, 1, 1,
-2.852397, -1.159365, -2.992075, 1, 0, 0, 1, 1,
-2.776486, 0.1744133, -1.175156, 1, 0, 0, 1, 1,
-2.550686, -1.23615, -2.023606, 1, 0, 0, 1, 1,
-2.529692, 0.9902147, -1.477001, 0, 0, 0, 1, 1,
-2.482608, -0.3520889, -3.41702, 0, 0, 0, 1, 1,
-2.395868, 1.290002, -0.8651683, 0, 0, 0, 1, 1,
-2.394574, 1.026019, -0.4731683, 0, 0, 0, 1, 1,
-2.385046, 0.1352872, -0.957788, 0, 0, 0, 1, 1,
-2.377638, 1.101063, -0.6521758, 0, 0, 0, 1, 1,
-2.306076, 0.3345876, -0.8483099, 0, 0, 0, 1, 1,
-2.293381, -1.554132, -2.354328, 1, 1, 1, 1, 1,
-2.281859, -0.338022, -0.8901456, 1, 1, 1, 1, 1,
-2.235558, -0.2368345, 0.571636, 1, 1, 1, 1, 1,
-2.233804, 0.5192066, -2.501265, 1, 1, 1, 1, 1,
-2.189102, -0.02150348, -1.781711, 1, 1, 1, 1, 1,
-2.186174, 0.3445839, -1.088581, 1, 1, 1, 1, 1,
-2.180599, 0.3965312, -0.9922067, 1, 1, 1, 1, 1,
-2.173585, -2.814242, -2.628249, 1, 1, 1, 1, 1,
-2.147341, 1.169182, 0.1671501, 1, 1, 1, 1, 1,
-2.089742, 1.419898, -1.018601, 1, 1, 1, 1, 1,
-2.065257, -0.3590166, -0.9946342, 1, 1, 1, 1, 1,
-2.057807, 0.7114578, -4.111186, 1, 1, 1, 1, 1,
-1.999951, 0.06731225, -0.572906, 1, 1, 1, 1, 1,
-1.967508, 0.6716389, 0.006686096, 1, 1, 1, 1, 1,
-1.957779, 2.081555, -0.5603068, 1, 1, 1, 1, 1,
-1.923437, -0.8574922, 0.3541535, 0, 0, 1, 1, 1,
-1.913837, -0.2938194, -2.294666, 1, 0, 0, 1, 1,
-1.903982, 0.9581148, -0.5726061, 1, 0, 0, 1, 1,
-1.899787, 0.01156234, -1.117127, 1, 0, 0, 1, 1,
-1.894676, 1.713874, -1.31079, 1, 0, 0, 1, 1,
-1.887273, -0.9867211, -2.276903, 1, 0, 0, 1, 1,
-1.884561, -1.110725, -1.084009, 0, 0, 0, 1, 1,
-1.880187, -0.07320356, -1.956575, 0, 0, 0, 1, 1,
-1.872877, 0.1455024, -0.7707106, 0, 0, 0, 1, 1,
-1.871844, -0.2876725, -0.4659298, 0, 0, 0, 1, 1,
-1.846873, 0.1774993, 0.03174803, 0, 0, 0, 1, 1,
-1.844899, -0.7694844, -0.4366302, 0, 0, 0, 1, 1,
-1.840952, -1.420901, -2.167541, 0, 0, 0, 1, 1,
-1.838229, -0.2928939, -2.52277, 1, 1, 1, 1, 1,
-1.835481, -0.5369042, -1.245537, 1, 1, 1, 1, 1,
-1.834728, 1.222003, -0.6827239, 1, 1, 1, 1, 1,
-1.83245, 0.9525009, -0.7379712, 1, 1, 1, 1, 1,
-1.826046, -0.4320899, -2.316473, 1, 1, 1, 1, 1,
-1.795403, -0.5891218, -0.2387322, 1, 1, 1, 1, 1,
-1.785526, 1.259681, -1.947851, 1, 1, 1, 1, 1,
-1.784531, 2.106485, 1.011134, 1, 1, 1, 1, 1,
-1.781964, -0.5641438, -1.979691, 1, 1, 1, 1, 1,
-1.776791, 1.685717, -0.9635301, 1, 1, 1, 1, 1,
-1.765591, -1.523645, -2.850265, 1, 1, 1, 1, 1,
-1.755493, -0.3722697, 0.7292714, 1, 1, 1, 1, 1,
-1.74515, -0.1573819, -2.038007, 1, 1, 1, 1, 1,
-1.744154, -0.3479958, -1.604398, 1, 1, 1, 1, 1,
-1.73945, -0.7814171, -2.951586, 1, 1, 1, 1, 1,
-1.713027, 3.013148, -2.2014, 0, 0, 1, 1, 1,
-1.709232, -0.0413889, 0.1576286, 1, 0, 0, 1, 1,
-1.700401, -1.210015, -3.912784, 1, 0, 0, 1, 1,
-1.694881, 1.206643, -0.2844364, 1, 0, 0, 1, 1,
-1.694861, -0.3593293, -0.7139336, 1, 0, 0, 1, 1,
-1.687847, 0.3412581, -2.638067, 1, 0, 0, 1, 1,
-1.685161, 1.814062, -0.2329284, 0, 0, 0, 1, 1,
-1.678039, -0.2766277, -1.007827, 0, 0, 0, 1, 1,
-1.671133, -0.5156116, -1.492379, 0, 0, 0, 1, 1,
-1.667161, 2.910645, -0.4787493, 0, 0, 0, 1, 1,
-1.634964, 0.6277762, -0.6326812, 0, 0, 0, 1, 1,
-1.634094, 1.145053, -1.442611, 0, 0, 0, 1, 1,
-1.618064, -1.086926, -1.769993, 0, 0, 0, 1, 1,
-1.605263, -0.7951992, -1.397311, 1, 1, 1, 1, 1,
-1.596922, -0.9125034, -1.726449, 1, 1, 1, 1, 1,
-1.592648, -0.8017781, -0.1242924, 1, 1, 1, 1, 1,
-1.588686, 0.5236055, -1.38213, 1, 1, 1, 1, 1,
-1.583563, 1.019333, -2.026353, 1, 1, 1, 1, 1,
-1.575625, 0.5236745, -0.5930045, 1, 1, 1, 1, 1,
-1.573589, -0.8286598, -1.759504, 1, 1, 1, 1, 1,
-1.567485, -0.6572768, -1.553975, 1, 1, 1, 1, 1,
-1.563703, -0.8393733, -2.036688, 1, 1, 1, 1, 1,
-1.556705, 2.046036, -0.6342837, 1, 1, 1, 1, 1,
-1.54103, -1.10767, -1.324087, 1, 1, 1, 1, 1,
-1.527076, -0.625576, -3.026999, 1, 1, 1, 1, 1,
-1.518346, 0.7975189, -2.018637, 1, 1, 1, 1, 1,
-1.513361, 0.5307078, -1.00906, 1, 1, 1, 1, 1,
-1.509417, -0.9929507, -4.441803, 1, 1, 1, 1, 1,
-1.508045, -0.7374445, -1.233191, 0, 0, 1, 1, 1,
-1.507175, 2.483053, 1.01113, 1, 0, 0, 1, 1,
-1.497248, 0.7507343, -1.578011, 1, 0, 0, 1, 1,
-1.485152, -0.1784202, -1.930673, 1, 0, 0, 1, 1,
-1.480489, -0.8587832, -2.385581, 1, 0, 0, 1, 1,
-1.476568, -0.1751045, -2.670979, 1, 0, 0, 1, 1,
-1.476387, -0.313941, -1.700697, 0, 0, 0, 1, 1,
-1.476143, 0.01675107, -1.785492, 0, 0, 0, 1, 1,
-1.472615, -1.283225, -3.066594, 0, 0, 0, 1, 1,
-1.461487, 0.5631149, -0.02938161, 0, 0, 0, 1, 1,
-1.45694, 1.883992, -1.950255, 0, 0, 0, 1, 1,
-1.44992, -0.8676147, -0.8168536, 0, 0, 0, 1, 1,
-1.448763, -0.7356082, -2.167825, 0, 0, 0, 1, 1,
-1.447227, 0.4706168, -0.3180962, 1, 1, 1, 1, 1,
-1.442919, -0.8055336, -1.374578, 1, 1, 1, 1, 1,
-1.437926, -0.8149282, -1.680044, 1, 1, 1, 1, 1,
-1.435994, 0.8184078, -1.250215, 1, 1, 1, 1, 1,
-1.434593, 0.4350847, 0.8126526, 1, 1, 1, 1, 1,
-1.427408, -0.887769, 1.055323, 1, 1, 1, 1, 1,
-1.420058, -0.4773571, -3.027446, 1, 1, 1, 1, 1,
-1.420038, 0.2704833, -0.910404, 1, 1, 1, 1, 1,
-1.39863, 1.140512, -1.453742, 1, 1, 1, 1, 1,
-1.393686, -0.7476977, -1.42921, 1, 1, 1, 1, 1,
-1.382044, 1.195716, -2.525321, 1, 1, 1, 1, 1,
-1.378418, 0.3962987, -1.733161, 1, 1, 1, 1, 1,
-1.376819, 1.098577, -2.867797, 1, 1, 1, 1, 1,
-1.368289, -0.1021763, -0.1982591, 1, 1, 1, 1, 1,
-1.366141, -1.449722, -3.637412, 1, 1, 1, 1, 1,
-1.348171, 0.7725377, -1.435961, 0, 0, 1, 1, 1,
-1.347985, -2.979568, -1.962458, 1, 0, 0, 1, 1,
-1.333801, -0.1061397, -0.8751642, 1, 0, 0, 1, 1,
-1.330935, 1.573587, -1.489585, 1, 0, 0, 1, 1,
-1.304206, 0.3222873, -1.330237, 1, 0, 0, 1, 1,
-1.292901, -1.517995, -3.109877, 1, 0, 0, 1, 1,
-1.283783, -1.824596, -1.474404, 0, 0, 0, 1, 1,
-1.274504, 1.088236, 0.01058524, 0, 0, 0, 1, 1,
-1.271579, -0.1526783, -3.285264, 0, 0, 0, 1, 1,
-1.25533, -0.9590006, -3.775481, 0, 0, 0, 1, 1,
-1.248575, -1.036344, -2.838064, 0, 0, 0, 1, 1,
-1.245171, 0.8958302, -2.494151, 0, 0, 0, 1, 1,
-1.237726, -0.2661108, -1.939839, 0, 0, 0, 1, 1,
-1.235343, 1.059232, 0.4695291, 1, 1, 1, 1, 1,
-1.23459, 0.1895746, -2.272094, 1, 1, 1, 1, 1,
-1.229286, 0.342797, -0.3315265, 1, 1, 1, 1, 1,
-1.22681, 0.08127963, -2.796141, 1, 1, 1, 1, 1,
-1.222864, -1.35882, -1.78002, 1, 1, 1, 1, 1,
-1.196448, 0.4685574, -1.686894, 1, 1, 1, 1, 1,
-1.193167, -1.462529, -2.603563, 1, 1, 1, 1, 1,
-1.191061, -0.4318193, -0.971406, 1, 1, 1, 1, 1,
-1.187044, -0.259141, 0.6339825, 1, 1, 1, 1, 1,
-1.185379, 2.548345, -0.7809104, 1, 1, 1, 1, 1,
-1.182131, -0.1272725, -2.702724, 1, 1, 1, 1, 1,
-1.166914, -0.559997, -2.71718, 1, 1, 1, 1, 1,
-1.163648, -0.5200421, -1.572979, 1, 1, 1, 1, 1,
-1.1619, -1.509229, -1.500226, 1, 1, 1, 1, 1,
-1.156991, -0.3545419, -0.1926266, 1, 1, 1, 1, 1,
-1.15132, 0.1999624, -3.468848, 0, 0, 1, 1, 1,
-1.150286, -1.134826, -2.560431, 1, 0, 0, 1, 1,
-1.148192, 1.296009, -1.300115, 1, 0, 0, 1, 1,
-1.147098, 0.5855542, 0.06745724, 1, 0, 0, 1, 1,
-1.133357, 0.8951786, 0.3468189, 1, 0, 0, 1, 1,
-1.132837, -0.421078, -2.493588, 1, 0, 0, 1, 1,
-1.131243, 0.9560863, -0.3798227, 0, 0, 0, 1, 1,
-1.129388, 0.5239677, 0.04232053, 0, 0, 0, 1, 1,
-1.128219, 0.9198933, -0.0094927, 0, 0, 0, 1, 1,
-1.124196, -0.4760507, -0.8264582, 0, 0, 0, 1, 1,
-1.112714, -0.5498163, -0.7787135, 0, 0, 0, 1, 1,
-1.110789, -0.03818531, 0.1680028, 0, 0, 0, 1, 1,
-1.109716, -0.9601621, -3.735595, 0, 0, 0, 1, 1,
-1.092878, 0.3731923, -0.2433677, 1, 1, 1, 1, 1,
-1.086493, -1.104646, -2.798086, 1, 1, 1, 1, 1,
-1.085628, -0.1630654, -3.107326, 1, 1, 1, 1, 1,
-1.085323, 0.6474339, -2.36251, 1, 1, 1, 1, 1,
-1.079943, -0.8647524, -0.9691245, 1, 1, 1, 1, 1,
-1.073681, 1.190825, -0.8401471, 1, 1, 1, 1, 1,
-1.068686, 0.6945495, -1.282418, 1, 1, 1, 1, 1,
-1.067304, 0.7177337, -1.398535, 1, 1, 1, 1, 1,
-1.055893, 0.07129858, 0.0571438, 1, 1, 1, 1, 1,
-1.05264, -0.7888273, -2.905783, 1, 1, 1, 1, 1,
-1.035423, -0.2330631, -3.465296, 1, 1, 1, 1, 1,
-1.034497, 0.9297516, -2.241127, 1, 1, 1, 1, 1,
-1.033974, 0.9228224, -0.2902837, 1, 1, 1, 1, 1,
-1.030102, -1.766537, -3.517582, 1, 1, 1, 1, 1,
-1.028108, -0.8084666, -2.712325, 1, 1, 1, 1, 1,
-1.027045, 1.900972, 0.003503568, 0, 0, 1, 1, 1,
-1.024024, -0.4087972, -0.3318813, 1, 0, 0, 1, 1,
-1.023102, 1.160758, 0.1349758, 1, 0, 0, 1, 1,
-1.018775, -0.7408845, -1.799737, 1, 0, 0, 1, 1,
-1.014809, 0.2331156, -1.357157, 1, 0, 0, 1, 1,
-1.013885, -0.6196747, -2.595009, 1, 0, 0, 1, 1,
-1.00187, 0.08947366, -1.44497, 0, 0, 0, 1, 1,
-0.9972184, 0.5058261, -1.388762, 0, 0, 0, 1, 1,
-0.9925951, -1.347253, -1.960469, 0, 0, 0, 1, 1,
-0.9879679, -2.027455, -1.575135, 0, 0, 0, 1, 1,
-0.9866492, 0.6455233, -0.9110711, 0, 0, 0, 1, 1,
-0.9851626, 0.4665297, -1.402472, 0, 0, 0, 1, 1,
-0.9834874, 0.2353743, -0.9398424, 0, 0, 0, 1, 1,
-0.9830441, 1.289794, -1.356986, 1, 1, 1, 1, 1,
-0.9800856, -0.2922388, -1.628164, 1, 1, 1, 1, 1,
-0.9800302, -0.2325658, -2.309555, 1, 1, 1, 1, 1,
-0.976413, 0.2939433, -0.4916443, 1, 1, 1, 1, 1,
-0.969236, 0.05471195, -1.671226, 1, 1, 1, 1, 1,
-0.949682, -0.4853685, -1.735414, 1, 1, 1, 1, 1,
-0.9488007, 0.2174613, -0.2246198, 1, 1, 1, 1, 1,
-0.9473157, -0.780144, -2.637352, 1, 1, 1, 1, 1,
-0.9430513, -0.9280778, -3.704333, 1, 1, 1, 1, 1,
-0.9381633, -0.5584041, -1.232122, 1, 1, 1, 1, 1,
-0.9355003, -0.9256523, -2.039351, 1, 1, 1, 1, 1,
-0.931755, -0.02074314, -2.431725, 1, 1, 1, 1, 1,
-0.9305022, 1.206659, 0.0416888, 1, 1, 1, 1, 1,
-0.9235365, -0.5350363, -0.7620492, 1, 1, 1, 1, 1,
-0.9141032, -1.262581, -2.893859, 1, 1, 1, 1, 1,
-0.9113445, 0.3758306, -0.7580582, 0, 0, 1, 1, 1,
-0.9087579, 0.6178896, -1.163828, 1, 0, 0, 1, 1,
-0.9020135, 0.1622518, -1.101733, 1, 0, 0, 1, 1,
-0.9014059, -0.6869612, -0.2320898, 1, 0, 0, 1, 1,
-0.8958495, -0.2110659, -1.667019, 1, 0, 0, 1, 1,
-0.8931791, 0.3806292, -2.149993, 1, 0, 0, 1, 1,
-0.8894497, -1.701375, -3.259866, 0, 0, 0, 1, 1,
-0.8883518, -2.553502, -2.744268, 0, 0, 0, 1, 1,
-0.8828198, 0.5519108, -0.8519828, 0, 0, 0, 1, 1,
-0.8804399, -1.100604, -2.372591, 0, 0, 0, 1, 1,
-0.8787865, -2.340285, -2.854681, 0, 0, 0, 1, 1,
-0.8729427, 1.018524, -0.5493153, 0, 0, 0, 1, 1,
-0.8728826, -0.05181345, -1.632397, 0, 0, 0, 1, 1,
-0.8687456, -0.5681177, -2.129312, 1, 1, 1, 1, 1,
-0.868645, -0.6768644, -1.705144, 1, 1, 1, 1, 1,
-0.8648679, 1.025931, -0.8772073, 1, 1, 1, 1, 1,
-0.8575735, -0.5304899, -3.98285, 1, 1, 1, 1, 1,
-0.8566221, -0.6505016, -1.659589, 1, 1, 1, 1, 1,
-0.8441491, -0.1001333, -1.496869, 1, 1, 1, 1, 1,
-0.8416395, -0.7800198, -1.201691, 1, 1, 1, 1, 1,
-0.840382, -1.643937, -1.655997, 1, 1, 1, 1, 1,
-0.8377983, 0.9040499, -1.0495, 1, 1, 1, 1, 1,
-0.8377122, -1.45279, -4.48264, 1, 1, 1, 1, 1,
-0.8365867, -1.116649, -2.181108, 1, 1, 1, 1, 1,
-0.8298126, 0.9508106, -0.9078797, 1, 1, 1, 1, 1,
-0.8298095, -1.116229, -3.311888, 1, 1, 1, 1, 1,
-0.8242062, 0.04607485, -1.892197, 1, 1, 1, 1, 1,
-0.8209177, 0.4402747, -3.845518, 1, 1, 1, 1, 1,
-0.8175732, -0.4712491, -1.690572, 0, 0, 1, 1, 1,
-0.8167308, 0.8020554, -3.088828, 1, 0, 0, 1, 1,
-0.8128185, -0.8854049, -1.83509, 1, 0, 0, 1, 1,
-0.8126089, -0.3173476, -2.911217, 1, 0, 0, 1, 1,
-0.808812, 0.9525064, -1.343398, 1, 0, 0, 1, 1,
-0.8079067, 0.8528996, 0.005455863, 1, 0, 0, 1, 1,
-0.8070006, -0.4894007, -1.098956, 0, 0, 0, 1, 1,
-0.8016496, 0.2075008, -1.865397, 0, 0, 0, 1, 1,
-0.7998011, -1.543372, -3.010654, 0, 0, 0, 1, 1,
-0.7989857, -1.120189, -2.995086, 0, 0, 0, 1, 1,
-0.7947527, -0.4076912, -2.179698, 0, 0, 0, 1, 1,
-0.7869575, -0.5536902, -3.103764, 0, 0, 0, 1, 1,
-0.785477, -0.5671097, -4.241154, 0, 0, 0, 1, 1,
-0.7840919, -0.3135621, -1.459988, 1, 1, 1, 1, 1,
-0.780049, 0.7896327, -2.376499, 1, 1, 1, 1, 1,
-0.7698176, -0.09045625, -0.02284744, 1, 1, 1, 1, 1,
-0.7684028, 0.3261146, -2.92777, 1, 1, 1, 1, 1,
-0.7663834, 0.6143297, -0.4406469, 1, 1, 1, 1, 1,
-0.7644604, 0.1704338, -0.9090763, 1, 1, 1, 1, 1,
-0.7601109, 1.09803, -0.5317031, 1, 1, 1, 1, 1,
-0.7434645, -0.7154163, -3.230023, 1, 1, 1, 1, 1,
-0.7418627, 0.2017098, 1.21784, 1, 1, 1, 1, 1,
-0.7368779, 0.7191394, -0.3437153, 1, 1, 1, 1, 1,
-0.7290097, -0.06707153, -1.779715, 1, 1, 1, 1, 1,
-0.7280148, 0.3628367, -1.893298, 1, 1, 1, 1, 1,
-0.7236623, -0.8169815, -3.761536, 1, 1, 1, 1, 1,
-0.7234842, 0.064379, -1.935719, 1, 1, 1, 1, 1,
-0.7213479, -0.2766506, -2.099015, 1, 1, 1, 1, 1,
-0.7157183, 2.281172, -0.2047465, 0, 0, 1, 1, 1,
-0.704495, -0.08277998, -1.859946, 1, 0, 0, 1, 1,
-0.7040457, -0.2160763, -0.9208594, 1, 0, 0, 1, 1,
-0.7018801, -0.1754826, 0.2243012, 1, 0, 0, 1, 1,
-0.7016456, 0.2715114, -2.421599, 1, 0, 0, 1, 1,
-0.6993716, 0.6672985, -1.356146, 1, 0, 0, 1, 1,
-0.6969147, -1.590415, -2.147364, 0, 0, 0, 1, 1,
-0.6941081, 2.504006, -0.931607, 0, 0, 0, 1, 1,
-0.6933246, -0.2985028, -1.49005, 0, 0, 0, 1, 1,
-0.6930588, 0.5788906, -2.087936, 0, 0, 0, 1, 1,
-0.6875396, 0.293853, -0.3041828, 0, 0, 0, 1, 1,
-0.679668, 1.325719, -1.462232, 0, 0, 0, 1, 1,
-0.6688314, 0.3489363, -0.3909065, 0, 0, 0, 1, 1,
-0.6668184, 1.367435, -1.479694, 1, 1, 1, 1, 1,
-0.6632547, -0.8883626, -1.334442, 1, 1, 1, 1, 1,
-0.6600465, 0.1874489, -1.008459, 1, 1, 1, 1, 1,
-0.657715, -1.409286, -3.924414, 1, 1, 1, 1, 1,
-0.6523104, -1.135698, -2.543883, 1, 1, 1, 1, 1,
-0.6473722, 0.293081, -2.18109, 1, 1, 1, 1, 1,
-0.634829, -0.8053946, -4.53969, 1, 1, 1, 1, 1,
-0.6341984, 1.287282, 0.5492698, 1, 1, 1, 1, 1,
-0.6330246, -1.143006, -3.978783, 1, 1, 1, 1, 1,
-0.6312463, -0.9226426, -1.263179, 1, 1, 1, 1, 1,
-0.6292691, -0.2485055, 1.211264, 1, 1, 1, 1, 1,
-0.6272619, -0.498647, -2.756573, 1, 1, 1, 1, 1,
-0.6271524, -0.9032459, -0.8406481, 1, 1, 1, 1, 1,
-0.6260335, -1.332602, -2.804986, 1, 1, 1, 1, 1,
-0.6251117, -0.4132911, -1.042639, 1, 1, 1, 1, 1,
-0.6161957, 0.7537377, -2.651207, 0, 0, 1, 1, 1,
-0.6147276, 0.6059859, -0.1239973, 1, 0, 0, 1, 1,
-0.6115006, 0.1701104, -0.9611635, 1, 0, 0, 1, 1,
-0.6111018, -1.708213, -3.414959, 1, 0, 0, 1, 1,
-0.6098614, -1.118469, -1.697382, 1, 0, 0, 1, 1,
-0.6045462, -0.887042, -3.806438, 1, 0, 0, 1, 1,
-0.6015462, -2.731975, -3.253469, 0, 0, 0, 1, 1,
-0.6004817, -2.050921, -3.288228, 0, 0, 0, 1, 1,
-0.5962309, 0.005610277, -0.7821255, 0, 0, 0, 1, 1,
-0.5938287, -0.2364035, -3.565905, 0, 0, 0, 1, 1,
-0.5930184, -0.8861014, -1.045687, 0, 0, 0, 1, 1,
-0.5920811, 0.1777716, 0.0007865587, 0, 0, 0, 1, 1,
-0.5920798, 0.5879405, -1.18277, 0, 0, 0, 1, 1,
-0.59149, 0.6533598, -1.917984, 1, 1, 1, 1, 1,
-0.5861846, 1.596298, 0.6676813, 1, 1, 1, 1, 1,
-0.5805391, -0.4168598, -2.110037, 1, 1, 1, 1, 1,
-0.579249, 0.8837467, -0.8933247, 1, 1, 1, 1, 1,
-0.5784846, 0.740537, -0.9618076, 1, 1, 1, 1, 1,
-0.5775238, 0.7991029, 0.3016755, 1, 1, 1, 1, 1,
-0.5759303, 1.165795, 0.3239645, 1, 1, 1, 1, 1,
-0.5744435, -1.68772, -1.541061, 1, 1, 1, 1, 1,
-0.5734217, 0.3185875, -0.8795583, 1, 1, 1, 1, 1,
-0.5726603, -1.08696, -0.8772358, 1, 1, 1, 1, 1,
-0.57004, -1.860623, -3.60641, 1, 1, 1, 1, 1,
-0.5678212, 0.3947836, -1.955732, 1, 1, 1, 1, 1,
-0.5677443, 1.48392, -0.09920587, 1, 1, 1, 1, 1,
-0.566756, -0.8719926, -2.09768, 1, 1, 1, 1, 1,
-0.56667, 2.045447, -0.8725947, 1, 1, 1, 1, 1,
-0.5620186, -1.434052, -2.64067, 0, 0, 1, 1, 1,
-0.5589237, -0.1896788, -2.207637, 1, 0, 0, 1, 1,
-0.55856, 1.149564, -1.258275, 1, 0, 0, 1, 1,
-0.554819, 0.6434062, 0.1336246, 1, 0, 0, 1, 1,
-0.5523635, -0.9360919, -4.934432, 1, 0, 0, 1, 1,
-0.549761, 0.684565, -0.7429177, 1, 0, 0, 1, 1,
-0.5455483, -1.286511, -4.024416, 0, 0, 0, 1, 1,
-0.5416874, -0.533531, -2.176737, 0, 0, 0, 1, 1,
-0.535805, -1.639407, -0.8876435, 0, 0, 0, 1, 1,
-0.5334386, 2.118119, -0.8457837, 0, 0, 0, 1, 1,
-0.5314275, -0.5212044, -2.890956, 0, 0, 0, 1, 1,
-0.5289222, -1.786891, -2.670876, 0, 0, 0, 1, 1,
-0.5264541, -0.5316358, -2.518753, 0, 0, 0, 1, 1,
-0.5251677, -0.5110703, -1.791202, 1, 1, 1, 1, 1,
-0.5250862, 0.5298745, -2.619036, 1, 1, 1, 1, 1,
-0.5236561, 0.1121754, -1.943545, 1, 1, 1, 1, 1,
-0.521469, 0.380694, -1.166378, 1, 1, 1, 1, 1,
-0.521313, 1.671449, 0.768497, 1, 1, 1, 1, 1,
-0.5169306, 0.05935443, -1.08258, 1, 1, 1, 1, 1,
-0.5167598, -1.194083, -3.233125, 1, 1, 1, 1, 1,
-0.5158663, 1.929348, -1.792963, 1, 1, 1, 1, 1,
-0.5119687, -0.06181277, -3.553123, 1, 1, 1, 1, 1,
-0.5107167, 0.8151641, 0.2152507, 1, 1, 1, 1, 1,
-0.509189, -0.2495431, -2.512763, 1, 1, 1, 1, 1,
-0.5066395, -0.4296494, -0.5543209, 1, 1, 1, 1, 1,
-0.5055175, 1.494455, -0.714035, 1, 1, 1, 1, 1,
-0.5042214, 0.2105533, -0.9412613, 1, 1, 1, 1, 1,
-0.5018486, -1.454068, -3.588806, 1, 1, 1, 1, 1,
-0.4996099, -1.196065, -3.204592, 0, 0, 1, 1, 1,
-0.4962422, -1.274164, -4.302037, 1, 0, 0, 1, 1,
-0.4930483, 1.338216, -0.1668605, 1, 0, 0, 1, 1,
-0.4902178, 0.6814557, -0.8979728, 1, 0, 0, 1, 1,
-0.4858155, -0.2916881, -2.319031, 1, 0, 0, 1, 1,
-0.4835932, -0.3486277, -1.334661, 1, 0, 0, 1, 1,
-0.4776579, 1.923581, -0.6024691, 0, 0, 0, 1, 1,
-0.4747088, 0.6558151, -1.09095, 0, 0, 0, 1, 1,
-0.4738604, 0.2041498, -0.8409522, 0, 0, 0, 1, 1,
-0.4725788, -0.04702831, -1.09198, 0, 0, 0, 1, 1,
-0.4724354, 0.2876553, -0.6236072, 0, 0, 0, 1, 1,
-0.465494, -1.222524, -3.908567, 0, 0, 0, 1, 1,
-0.4652657, -0.2436787, -1.982517, 0, 0, 0, 1, 1,
-0.4598384, -0.191445, -3.682512, 1, 1, 1, 1, 1,
-0.457783, 1.582866, 1.546492, 1, 1, 1, 1, 1,
-0.457303, -1.036926, -1.492071, 1, 1, 1, 1, 1,
-0.4536299, 0.2353112, -3.405867, 1, 1, 1, 1, 1,
-0.4536099, 0.8705052, 0.9012774, 1, 1, 1, 1, 1,
-0.4504541, 0.2078654, -1.748246, 1, 1, 1, 1, 1,
-0.4434645, -0.2523324, -3.402864, 1, 1, 1, 1, 1,
-0.4426024, 1.172608, -1.779878, 1, 1, 1, 1, 1,
-0.4420175, 1.18463, -0.945926, 1, 1, 1, 1, 1,
-0.4316989, 0.2504642, -0.3447585, 1, 1, 1, 1, 1,
-0.4283685, -0.548439, -2.833468, 1, 1, 1, 1, 1,
-0.427126, -0.4078248, -2.724464, 1, 1, 1, 1, 1,
-0.4268918, -1.288144, -2.509296, 1, 1, 1, 1, 1,
-0.4262747, 1.008391, -0.1668963, 1, 1, 1, 1, 1,
-0.42599, -0.5973566, -2.075914, 1, 1, 1, 1, 1,
-0.4248482, 0.02394933, -1.77434, 0, 0, 1, 1, 1,
-0.4201135, 0.7132713, -0.4416576, 1, 0, 0, 1, 1,
-0.4199654, -1.193048, -2.298048, 1, 0, 0, 1, 1,
-0.419427, 0.3818787, -1.461348, 1, 0, 0, 1, 1,
-0.4181634, 1.539015, -0.03702156, 1, 0, 0, 1, 1,
-0.4143625, 1.457974, -2.002758, 1, 0, 0, 1, 1,
-0.4077146, 0.9835225, 0.9816246, 0, 0, 0, 1, 1,
-0.4071366, 0.9193395, -1.404062, 0, 0, 0, 1, 1,
-0.40253, -0.4892549, -3.607248, 0, 0, 0, 1, 1,
-0.3953702, 1.336744, -0.9331536, 0, 0, 0, 1, 1,
-0.3944584, -0.5123782, 0.4163945, 0, 0, 0, 1, 1,
-0.3883319, -0.2694444, -2.69199, 0, 0, 0, 1, 1,
-0.3869187, 0.4387864, -2.335047, 0, 0, 0, 1, 1,
-0.3862861, -1.750234, -2.295376, 1, 1, 1, 1, 1,
-0.3833792, -1.409677, -1.941635, 1, 1, 1, 1, 1,
-0.3807743, -1.523795, -1.931666, 1, 1, 1, 1, 1,
-0.3784021, 1.486961, -2.306028, 1, 1, 1, 1, 1,
-0.3661832, -1.981171, -0.550626, 1, 1, 1, 1, 1,
-0.3638566, -2.448655, -4.088348, 1, 1, 1, 1, 1,
-0.3637471, -1.093168, -1.276667, 1, 1, 1, 1, 1,
-0.3609973, 2.627199, 0.8336195, 1, 1, 1, 1, 1,
-0.35953, 1.041746, -2.670116, 1, 1, 1, 1, 1,
-0.3553591, 1.69751, -0.2819254, 1, 1, 1, 1, 1,
-0.3466969, 0.9327442, -0.8470441, 1, 1, 1, 1, 1,
-0.3435102, -0.4280491, -2.022358, 1, 1, 1, 1, 1,
-0.3386912, 2.436913, 0.7209824, 1, 1, 1, 1, 1,
-0.3385645, -0.6899781, -1.403145, 1, 1, 1, 1, 1,
-0.3384154, 0.2021137, -0.02195928, 1, 1, 1, 1, 1,
-0.3378027, -0.9162971, -1.384583, 0, 0, 1, 1, 1,
-0.3312786, -0.3751918, -3.390347, 1, 0, 0, 1, 1,
-0.3298534, -0.4934814, -3.847412, 1, 0, 0, 1, 1,
-0.3239971, 0.5258304, -0.5790302, 1, 0, 0, 1, 1,
-0.3232288, -0.9960089, -3.732619, 1, 0, 0, 1, 1,
-0.3190118, 0.1840971, -0.2159012, 1, 0, 0, 1, 1,
-0.315944, 0.05940473, 0.328268, 0, 0, 0, 1, 1,
-0.3152259, -0.7834506, -3.781145, 0, 0, 0, 1, 1,
-0.3002437, 0.5388991, -0.7534851, 0, 0, 0, 1, 1,
-0.2907501, 2.734923, -0.4654942, 0, 0, 0, 1, 1,
-0.2884825, -0.07098477, -2.464287, 0, 0, 0, 1, 1,
-0.2869514, 1.588383, -1.399951, 0, 0, 0, 1, 1,
-0.2781466, -0.4591098, -3.676363, 0, 0, 0, 1, 1,
-0.2693315, 0.388687, -2.696742, 1, 1, 1, 1, 1,
-0.2691754, 0.5268628, -0.01330005, 1, 1, 1, 1, 1,
-0.2661589, 0.3451356, -0.6803272, 1, 1, 1, 1, 1,
-0.2647174, 0.7345454, 1.215951, 1, 1, 1, 1, 1,
-0.2642171, -0.6468879, -3.909896, 1, 1, 1, 1, 1,
-0.2608467, 0.1871087, -1.445504, 1, 1, 1, 1, 1,
-0.2590631, -1.26379, -1.741503, 1, 1, 1, 1, 1,
-0.2547246, -0.1216555, -3.985046, 1, 1, 1, 1, 1,
-0.2531835, 0.4508917, 0.3019818, 1, 1, 1, 1, 1,
-0.2515089, -0.4466001, -3.705319, 1, 1, 1, 1, 1,
-0.2490796, 0.6142672, -0.06403756, 1, 1, 1, 1, 1,
-0.2450729, -1.288586, -5.144144, 1, 1, 1, 1, 1,
-0.2421282, 0.2651961, -1.306409, 1, 1, 1, 1, 1,
-0.2412935, 1.316338, 0.1150843, 1, 1, 1, 1, 1,
-0.2406103, 0.1308068, -0.4239223, 1, 1, 1, 1, 1,
-0.2381309, 0.7740247, -0.9131175, 0, 0, 1, 1, 1,
-0.2354439, -0.1566002, -1.644289, 1, 0, 0, 1, 1,
-0.2261563, -2.790683, -3.000584, 1, 0, 0, 1, 1,
-0.2249154, 0.2941982, -0.2042394, 1, 0, 0, 1, 1,
-0.2232649, -0.08547609, -0.8772112, 1, 0, 0, 1, 1,
-0.2212161, 0.5533534, -0.8459129, 1, 0, 0, 1, 1,
-0.218755, 1.996656, 0.8726017, 0, 0, 0, 1, 1,
-0.2123103, -1.618889, -3.660692, 0, 0, 0, 1, 1,
-0.21201, 0.5715238, -0.5365102, 0, 0, 0, 1, 1,
-0.2103805, 0.486434, -0.01857507, 0, 0, 0, 1, 1,
-0.2072578, 0.1820577, 0.7134205, 0, 0, 0, 1, 1,
-0.2043812, -0.01685013, -0.775375, 0, 0, 0, 1, 1,
-0.202903, -0.02229496, -3.354352, 0, 0, 0, 1, 1,
-0.2009586, -0.1819403, -1.429533, 1, 1, 1, 1, 1,
-0.1970676, 0.411414, -0.1876065, 1, 1, 1, 1, 1,
-0.1967265, 0.3751016, 0.3534634, 1, 1, 1, 1, 1,
-0.1959603, 1.332611, 1.348393, 1, 1, 1, 1, 1,
-0.1922529, 0.06871558, -2.05108, 1, 1, 1, 1, 1,
-0.1904621, -0.09758055, -2.325575, 1, 1, 1, 1, 1,
-0.1896029, 1.003365, -0.9918563, 1, 1, 1, 1, 1,
-0.1830128, -0.9044479, -2.347234, 1, 1, 1, 1, 1,
-0.1786706, -1.974, -3.514762, 1, 1, 1, 1, 1,
-0.1772159, 3.309483, -0.4797753, 1, 1, 1, 1, 1,
-0.1752847, 0.3573731, 1.294977, 1, 1, 1, 1, 1,
-0.1750858, -0.3478673, -2.940269, 1, 1, 1, 1, 1,
-0.1748758, -1.112248, -4.986197, 1, 1, 1, 1, 1,
-0.1736358, 0.3833055, -1.014366, 1, 1, 1, 1, 1,
-0.169954, -0.6790987, -4.979702, 1, 1, 1, 1, 1,
-0.1656452, -0.4767861, -2.859877, 0, 0, 1, 1, 1,
-0.1635476, 1.446862, -0.8043749, 1, 0, 0, 1, 1,
-0.162993, 0.5531541, 0.06483921, 1, 0, 0, 1, 1,
-0.1591529, -0.9267994, -3.51128, 1, 0, 0, 1, 1,
-0.1574358, -0.6257797, -2.877438, 1, 0, 0, 1, 1,
-0.1531121, -0.6235769, -2.089002, 1, 0, 0, 1, 1,
-0.1495685, -1.788704, -3.883785, 0, 0, 0, 1, 1,
-0.1457523, 0.9108819, -0.250892, 0, 0, 0, 1, 1,
-0.1452024, 0.1208172, -0.6499739, 0, 0, 0, 1, 1,
-0.1420446, 1.11678, -1.043828, 0, 0, 0, 1, 1,
-0.142034, 0.9673364, 1.37595, 0, 0, 0, 1, 1,
-0.1405118, -0.8808097, -3.228129, 0, 0, 0, 1, 1,
-0.1359606, 1.827623, -0.2049366, 0, 0, 0, 1, 1,
-0.130912, -2.128395, -3.710724, 1, 1, 1, 1, 1,
-0.129095, -0.1690165, -2.346713, 1, 1, 1, 1, 1,
-0.1274676, 1.935028, 0.299049, 1, 1, 1, 1, 1,
-0.1206471, 0.0861764, -0.1352928, 1, 1, 1, 1, 1,
-0.1197142, 0.75771, 0.07531448, 1, 1, 1, 1, 1,
-0.1156303, 0.0127834, -1.166326, 1, 1, 1, 1, 1,
-0.1070556, 0.579457, -0.4338244, 1, 1, 1, 1, 1,
-0.105869, 0.8374605, 0.03145271, 1, 1, 1, 1, 1,
-0.1038074, 0.2564048, 0.1393854, 1, 1, 1, 1, 1,
-0.1002307, -0.2006415, -2.456328, 1, 1, 1, 1, 1,
-0.1001873, -0.6614389, -4.488667, 1, 1, 1, 1, 1,
-0.09680483, -0.3301188, -3.881877, 1, 1, 1, 1, 1,
-0.09387838, -1.888832, -3.473826, 1, 1, 1, 1, 1,
-0.07825621, -1.014387, -5.056764, 1, 1, 1, 1, 1,
-0.07671624, -0.4496876, -2.223279, 1, 1, 1, 1, 1,
-0.0763347, 2.648267, 0.687176, 0, 0, 1, 1, 1,
-0.07435172, -0.5047711, -2.712745, 1, 0, 0, 1, 1,
-0.07344875, -0.1261689, -2.314292, 1, 0, 0, 1, 1,
-0.06759705, 0.115564, -0.05748852, 1, 0, 0, 1, 1,
-0.06605455, 0.5074958, -1.435397, 1, 0, 0, 1, 1,
-0.06337194, 0.02688849, -1.277808, 1, 0, 0, 1, 1,
-0.06306706, -1.100743, -2.355932, 0, 0, 0, 1, 1,
-0.06129217, -0.389001, -1.831105, 0, 0, 0, 1, 1,
-0.05924071, -1.873951, -3.183944, 0, 0, 0, 1, 1,
-0.05724743, -0.7635241, -3.345403, 0, 0, 0, 1, 1,
-0.0549102, -0.4904033, -1.610072, 0, 0, 0, 1, 1,
-0.05307693, 0.4821368, -0.03854911, 0, 0, 0, 1, 1,
-0.05301046, -0.06971722, -2.346009, 0, 0, 0, 1, 1,
-0.04983978, 0.7714782, -0.8689439, 1, 1, 1, 1, 1,
-0.04829462, 1.12009, 0.5064511, 1, 1, 1, 1, 1,
-0.0475113, -0.7222872, -2.856551, 1, 1, 1, 1, 1,
-0.04578426, 2.426126, -0.03757186, 1, 1, 1, 1, 1,
-0.04054803, 0.6899335, -0.2790782, 1, 1, 1, 1, 1,
-0.0404251, -1.850644, -1.977165, 1, 1, 1, 1, 1,
-0.03899913, -1.578498, -4.673267, 1, 1, 1, 1, 1,
-0.03725437, -0.6727307, -4.032435, 1, 1, 1, 1, 1,
-0.03151305, 2.326258, -0.6425372, 1, 1, 1, 1, 1,
-0.03147319, -1.314371, -0.9520512, 1, 1, 1, 1, 1,
-0.02948368, -0.3124961, -2.222122, 1, 1, 1, 1, 1,
-0.02453215, 0.03959342, -0.2504497, 1, 1, 1, 1, 1,
-0.0237261, -0.1209109, -4.736184, 1, 1, 1, 1, 1,
-0.02116032, 0.339764, -0.4163622, 1, 1, 1, 1, 1,
-0.01973416, -0.929395, -3.979795, 1, 1, 1, 1, 1,
-0.01952538, -1.98293, -4.948867, 0, 0, 1, 1, 1,
-0.01395465, -0.5043789, -4.44356, 1, 0, 0, 1, 1,
-0.01330702, 0.54608, -1.216372, 1, 0, 0, 1, 1,
-0.01290088, -0.1499377, -3.427724, 1, 0, 0, 1, 1,
-0.01007277, 0.6617934, 1.583313, 1, 0, 0, 1, 1,
-0.006535916, -0.07565501, -4.238112, 1, 0, 0, 1, 1,
-0.004356535, 0.1295962, 1.877766, 0, 0, 0, 1, 1,
-0.003378057, 0.9861535, -0.5487183, 0, 0, 0, 1, 1,
-0.001769197, -0.8688236, -4.334319, 0, 0, 0, 1, 1,
-0.000141715, 0.3515432, 1.483701, 0, 0, 0, 1, 1,
0.0005985052, 0.5033731, -0.141625, 0, 0, 0, 1, 1,
0.0100006, -2.783739, 3.115136, 0, 0, 0, 1, 1,
0.01277144, 0.05237899, -0.1646527, 0, 0, 0, 1, 1,
0.01527481, -0.02355248, 0.553231, 1, 1, 1, 1, 1,
0.01914956, -0.8000261, 3.638949, 1, 1, 1, 1, 1,
0.02188724, 0.2919793, 0.6638966, 1, 1, 1, 1, 1,
0.02732487, -0.9203023, 2.921953, 1, 1, 1, 1, 1,
0.03099478, -0.2756173, 3.25819, 1, 1, 1, 1, 1,
0.0331704, -0.1185685, 3.115013, 1, 1, 1, 1, 1,
0.0350787, 0.2128914, -0.4132609, 1, 1, 1, 1, 1,
0.04040096, 1.123049, 0.1302606, 1, 1, 1, 1, 1,
0.04258093, -1.294921, 3.838474, 1, 1, 1, 1, 1,
0.04444486, -0.0007443374, 1.868528, 1, 1, 1, 1, 1,
0.04956293, 0.6612228, -0.5789155, 1, 1, 1, 1, 1,
0.05003277, 0.4473832, 1.130448, 1, 1, 1, 1, 1,
0.05134507, 0.6399039, 0.7068294, 1, 1, 1, 1, 1,
0.05224672, -0.8267285, 3.77044, 1, 1, 1, 1, 1,
0.05426368, 1.441509, -0.6241875, 1, 1, 1, 1, 1,
0.05465324, 1.782914, 0.9161046, 0, 0, 1, 1, 1,
0.05826798, 0.5189329, 1.111905, 1, 0, 0, 1, 1,
0.06134719, -1.601108, 3.565721, 1, 0, 0, 1, 1,
0.07028939, -0.6904843, 4.807255, 1, 0, 0, 1, 1,
0.07266263, -0.8668623, 3.64663, 1, 0, 0, 1, 1,
0.07274155, -0.1406136, 5.06071, 1, 0, 0, 1, 1,
0.0729801, 0.1003478, 0.5221919, 0, 0, 0, 1, 1,
0.07952628, -0.9112326, 2.435919, 0, 0, 0, 1, 1,
0.08125933, 0.588783, -0.2624898, 0, 0, 0, 1, 1,
0.08766092, -0.08264501, 1.835632, 0, 0, 0, 1, 1,
0.09794555, -0.2774415, 3.335664, 0, 0, 0, 1, 1,
0.1019862, 0.5059661, -1.291837, 0, 0, 0, 1, 1,
0.106866, 1.656469, 0.6304228, 0, 0, 0, 1, 1,
0.1075798, 1.182488, -1.923623, 1, 1, 1, 1, 1,
0.1162277, 0.9719567, 1.428593, 1, 1, 1, 1, 1,
0.1177636, -0.6233675, 3.579005, 1, 1, 1, 1, 1,
0.1221905, -1.336337, 3.819753, 1, 1, 1, 1, 1,
0.1255518, 0.8516833, -0.6125139, 1, 1, 1, 1, 1,
0.1288378, -1.07381, 2.326958, 1, 1, 1, 1, 1,
0.1296664, 1.508068, -0.3598956, 1, 1, 1, 1, 1,
0.130693, -0.6072962, 2.312905, 1, 1, 1, 1, 1,
0.1380715, 0.07060291, 0.7119977, 1, 1, 1, 1, 1,
0.1413551, -2.092203, 1.849722, 1, 1, 1, 1, 1,
0.1452312, 0.2696733, 2.266862, 1, 1, 1, 1, 1,
0.1540834, 0.6917673, -0.5584372, 1, 1, 1, 1, 1,
0.1572725, 1.326829, 1.144477, 1, 1, 1, 1, 1,
0.1599436, 0.4744502, 0.6670222, 1, 1, 1, 1, 1,
0.1617466, 0.9672807, -1.003079, 1, 1, 1, 1, 1,
0.1624355, 1.033701, 0.5525545, 0, 0, 1, 1, 1,
0.1646938, 1.726612, -1.294124, 1, 0, 0, 1, 1,
0.1652274, 0.2716423, -0.8716635, 1, 0, 0, 1, 1,
0.1782354, 0.1034964, 1.539123, 1, 0, 0, 1, 1,
0.1813786, -0.9402452, 2.480147, 1, 0, 0, 1, 1,
0.1832774, -1.460684, 3.728836, 1, 0, 0, 1, 1,
0.1869112, -0.493581, 1.937695, 0, 0, 0, 1, 1,
0.1881961, -1.290627, 4.709201, 0, 0, 0, 1, 1,
0.1889985, 1.105169, -0.5633055, 0, 0, 0, 1, 1,
0.1949363, -2.214065, 3.816253, 0, 0, 0, 1, 1,
0.1974994, -0.314839, 2.069969, 0, 0, 0, 1, 1,
0.1987496, 0.5491109, 0.4736483, 0, 0, 0, 1, 1,
0.2035084, 1.09321, -0.09701509, 0, 0, 0, 1, 1,
0.2048453, 1.17675, 0.5708305, 1, 1, 1, 1, 1,
0.2048847, -0.396735, 1.618617, 1, 1, 1, 1, 1,
0.2053297, -1.894822, 3.130248, 1, 1, 1, 1, 1,
0.2071556, -0.5726188, 2.371077, 1, 1, 1, 1, 1,
0.2204428, 1.392974, -0.9715544, 1, 1, 1, 1, 1,
0.2243232, 0.704353, 2.817563, 1, 1, 1, 1, 1,
0.2282018, 0.309285, -0.635597, 1, 1, 1, 1, 1,
0.2316645, 1.061696, -0.303391, 1, 1, 1, 1, 1,
0.2320463, -1.241411, 2.822272, 1, 1, 1, 1, 1,
0.2348198, 0.8252212, 0.4507291, 1, 1, 1, 1, 1,
0.2353406, -1.441317, 1.911872, 1, 1, 1, 1, 1,
0.2425533, 1.013785, 0.3141639, 1, 1, 1, 1, 1,
0.2434808, 0.1156133, 2.627625, 1, 1, 1, 1, 1,
0.2446986, 0.4310782, -0.9480835, 1, 1, 1, 1, 1,
0.245156, -0.007370302, 1.611257, 1, 1, 1, 1, 1,
0.246182, 0.1523366, 1.362734, 0, 0, 1, 1, 1,
0.2493924, -0.7272882, 4.69903, 1, 0, 0, 1, 1,
0.2508074, 1.175245, -0.8584212, 1, 0, 0, 1, 1,
0.2531381, 0.2461657, 1.295151, 1, 0, 0, 1, 1,
0.253462, -0.946413, 4.433589, 1, 0, 0, 1, 1,
0.2548579, 1.41171, -1.181715, 1, 0, 0, 1, 1,
0.2568814, 0.7323266, 0.8254846, 0, 0, 0, 1, 1,
0.2570476, 1.156603, 0.1502627, 0, 0, 0, 1, 1,
0.2630036, 1.299424, 1.327517, 0, 0, 0, 1, 1,
0.2645822, -0.6262655, 1.099604, 0, 0, 0, 1, 1,
0.2651599, 0.275273, 0.9627545, 0, 0, 0, 1, 1,
0.2663117, -0.9861229, 3.288188, 0, 0, 0, 1, 1,
0.2697397, 0.8002, -1.547713, 0, 0, 0, 1, 1,
0.2727441, -0.2608376, 3.901639, 1, 1, 1, 1, 1,
0.2737837, 0.6631951, -0.3998885, 1, 1, 1, 1, 1,
0.2808913, 1.60324, -0.6919759, 1, 1, 1, 1, 1,
0.2835009, -0.03110921, 1.802594, 1, 1, 1, 1, 1,
0.2907348, 0.1857856, -0.1009602, 1, 1, 1, 1, 1,
0.2942948, -0.5248228, 0.7865756, 1, 1, 1, 1, 1,
0.3011703, -0.3799238, 2.200456, 1, 1, 1, 1, 1,
0.3025284, -0.3683401, 2.595113, 1, 1, 1, 1, 1,
0.3045335, -0.4331488, 2.558583, 1, 1, 1, 1, 1,
0.3057728, 0.6717861, -0.2839563, 1, 1, 1, 1, 1,
0.3076729, 1.418149, 0.8239495, 1, 1, 1, 1, 1,
0.3082772, -2.6089, 3.90064, 1, 1, 1, 1, 1,
0.313134, 0.1406421, 1.611248, 1, 1, 1, 1, 1,
0.3162735, 1.9978, -0.9479221, 1, 1, 1, 1, 1,
0.3185234, -0.01004423, 2.356647, 1, 1, 1, 1, 1,
0.3212714, -0.8108804, 3.237778, 0, 0, 1, 1, 1,
0.3220057, -0.9363856, 2.794141, 1, 0, 0, 1, 1,
0.3237686, 1.923081, 1.064439, 1, 0, 0, 1, 1,
0.3277201, 0.7405946, 0.9433052, 1, 0, 0, 1, 1,
0.3289591, 0.5434182, 1.162418, 1, 0, 0, 1, 1,
0.3340834, -1.514599, 3.656677, 1, 0, 0, 1, 1,
0.3396701, -0.5775587, 2.685847, 0, 0, 0, 1, 1,
0.3402013, -0.3066069, 0.6138704, 0, 0, 0, 1, 1,
0.3421598, -0.06174, 1.407163, 0, 0, 0, 1, 1,
0.3430397, -1.907758, 1.012836, 0, 0, 0, 1, 1,
0.3438903, 1.520346, 0.8124476, 0, 0, 0, 1, 1,
0.3472454, -1.448894, 2.713639, 0, 0, 0, 1, 1,
0.3527238, 1.629457, -1.567027, 0, 0, 0, 1, 1,
0.3531098, -0.4876075, 3.885751, 1, 1, 1, 1, 1,
0.3557096, -0.7686622, 4.697217, 1, 1, 1, 1, 1,
0.3558114, -0.1295673, 2.006473, 1, 1, 1, 1, 1,
0.3565885, 0.6075472, 0.04256513, 1, 1, 1, 1, 1,
0.3577203, 2.127322, 0.4565531, 1, 1, 1, 1, 1,
0.3590085, -1.42746, 1.977018, 1, 1, 1, 1, 1,
0.3632616, 1.542102, -0.199893, 1, 1, 1, 1, 1,
0.3636052, 1.090668, 1.35549, 1, 1, 1, 1, 1,
0.364298, 0.4290723, 1.66749, 1, 1, 1, 1, 1,
0.3653855, -2.737059, 4.121717, 1, 1, 1, 1, 1,
0.3690704, -0.5098539, 3.073017, 1, 1, 1, 1, 1,
0.3715839, -0.7440339, 3.376448, 1, 1, 1, 1, 1,
0.3752444, -0.2929598, 2.854152, 1, 1, 1, 1, 1,
0.3761431, 0.2835973, 1.510905, 1, 1, 1, 1, 1,
0.3806279, -1.6904, 3.587631, 1, 1, 1, 1, 1,
0.3849171, 0.4597213, 1.251557, 0, 0, 1, 1, 1,
0.386858, -0.009712067, 3.182151, 1, 0, 0, 1, 1,
0.3889668, -1.042826, 2.766603, 1, 0, 0, 1, 1,
0.3908685, -1.003522, 3.941777, 1, 0, 0, 1, 1,
0.3917971, -1.932942, 1.567769, 1, 0, 0, 1, 1,
0.3942398, 0.7485842, 0.0936277, 1, 0, 0, 1, 1,
0.3954866, -0.1616719, 1.523334, 0, 0, 0, 1, 1,
0.3955964, 1.260726, -0.07291662, 0, 0, 0, 1, 1,
0.3962395, 1.34561, 0.4020589, 0, 0, 0, 1, 1,
0.3987255, -0.1730391, 1.607809, 0, 0, 0, 1, 1,
0.406346, 1.164299, 0.4711633, 0, 0, 0, 1, 1,
0.4080167, -0.08291257, 3.04452, 0, 0, 0, 1, 1,
0.4091927, -2.090293, 6.26078, 0, 0, 0, 1, 1,
0.4152191, -2.021724, 3.59653, 1, 1, 1, 1, 1,
0.4152364, -0.6270494, 4.290852, 1, 1, 1, 1, 1,
0.4162724, -1.214957, 3.159661, 1, 1, 1, 1, 1,
0.417695, 2.690533, 0.2653369, 1, 1, 1, 1, 1,
0.4177409, 0.8597871, -0.7682931, 1, 1, 1, 1, 1,
0.4211743, 0.1919137, 0.6810347, 1, 1, 1, 1, 1,
0.421964, 1.468816, 1.274415, 1, 1, 1, 1, 1,
0.4225306, -1.880062, 1.714839, 1, 1, 1, 1, 1,
0.4243543, 1.169975, 0.1501367, 1, 1, 1, 1, 1,
0.425635, -1.443706, 4.050783, 1, 1, 1, 1, 1,
0.4275523, 0.2859805, -0.1144514, 1, 1, 1, 1, 1,
0.4275899, -0.01059898, 1.742398, 1, 1, 1, 1, 1,
0.4287947, -1.608876, 5.343111, 1, 1, 1, 1, 1,
0.4319153, 0.4098197, 0.7315686, 1, 1, 1, 1, 1,
0.4321693, 0.1910865, 2.482752, 1, 1, 1, 1, 1,
0.4405121, -0.004905839, 1.422819, 0, 0, 1, 1, 1,
0.4415873, -1.730488, 3.350885, 1, 0, 0, 1, 1,
0.4424312, -1.553364, 2.720759, 1, 0, 0, 1, 1,
0.4471052, -0.9500043, 0.8246104, 1, 0, 0, 1, 1,
0.4523679, -0.6010626, 1.57971, 1, 0, 0, 1, 1,
0.4523743, 0.5063556, 0.9809108, 1, 0, 0, 1, 1,
0.4528285, 0.03135765, -0.2595731, 0, 0, 0, 1, 1,
0.4529634, -0.7658636, 1.372355, 0, 0, 0, 1, 1,
0.4599248, 0.05070318, 1.252278, 0, 0, 0, 1, 1,
0.4639832, 0.6552282, -0.07375427, 0, 0, 0, 1, 1,
0.4653779, -0.5180705, 2.244802, 0, 0, 0, 1, 1,
0.4672035, 0.4317866, 0.9891231, 0, 0, 0, 1, 1,
0.4686562, 1.333788, 1.943479, 0, 0, 0, 1, 1,
0.4720843, -0.26087, 4.963996, 1, 1, 1, 1, 1,
0.4724949, -0.5947646, 1.444507, 1, 1, 1, 1, 1,
0.4751085, 2.26879, 1.000527, 1, 1, 1, 1, 1,
0.4765866, 0.670048, 0.8369561, 1, 1, 1, 1, 1,
0.4788056, -1.289145, 2.774459, 1, 1, 1, 1, 1,
0.5014256, 0.3170888, 0.6550954, 1, 1, 1, 1, 1,
0.5036827, -0.9767572, 2.182704, 1, 1, 1, 1, 1,
0.5041973, -0.03346269, 1.794108, 1, 1, 1, 1, 1,
0.5086444, -0.220705, 1.136173, 1, 1, 1, 1, 1,
0.5105095, 0.8014443, -0.5928971, 1, 1, 1, 1, 1,
0.5141139, 0.6569374, 2.418696, 1, 1, 1, 1, 1,
0.5158629, -1.045932, 2.052583, 1, 1, 1, 1, 1,
0.5192809, 0.5463489, 0.1741434, 1, 1, 1, 1, 1,
0.5207626, -0.3419094, 2.074896, 1, 1, 1, 1, 1,
0.5231853, -0.5821888, 1.872465, 1, 1, 1, 1, 1,
0.5263702, -0.1622483, 1.3314, 0, 0, 1, 1, 1,
0.5284712, -0.7526152, 2.775273, 1, 0, 0, 1, 1,
0.5311316, 0.4869559, 1.00633, 1, 0, 0, 1, 1,
0.5327698, 0.05768654, 1.292839, 1, 0, 0, 1, 1,
0.5332713, 0.7065239, 0.961945, 1, 0, 0, 1, 1,
0.5366246, 0.3046079, 1.336845, 1, 0, 0, 1, 1,
0.5387387, 2.681813, -2.240825, 0, 0, 0, 1, 1,
0.5443479, -0.8872929, 2.038436, 0, 0, 0, 1, 1,
0.5448258, 0.4379913, 3.38507, 0, 0, 0, 1, 1,
0.5463061, -1.035168, 2.070107, 0, 0, 0, 1, 1,
0.546343, 2.08272, -1.411814, 0, 0, 0, 1, 1,
0.5558509, 0.179399, 0.2354795, 0, 0, 0, 1, 1,
0.558916, -0.5997027, 2.419499, 0, 0, 0, 1, 1,
0.5591895, -0.3808421, 0.8646967, 1, 1, 1, 1, 1,
0.5667971, 0.4633202, 0.5830065, 1, 1, 1, 1, 1,
0.5679476, 0.8888664, 0.4883032, 1, 1, 1, 1, 1,
0.5691355, -1.148403, 4.448285, 1, 1, 1, 1, 1,
0.5766814, -0.7923234, 2.295137, 1, 1, 1, 1, 1,
0.577045, 0.5750803, 0.7463044, 1, 1, 1, 1, 1,
0.5770557, 0.9961063, 0.9205756, 1, 1, 1, 1, 1,
0.581946, 0.4881086, 1.268475, 1, 1, 1, 1, 1,
0.5854138, -1.171171, 2.193605, 1, 1, 1, 1, 1,
0.5858747, -0.8944677, 2.766499, 1, 1, 1, 1, 1,
0.5876341, -1.498968, 2.018637, 1, 1, 1, 1, 1,
0.590087, 0.4824143, 0.6112688, 1, 1, 1, 1, 1,
0.5940698, 0.9171084, -0.4326336, 1, 1, 1, 1, 1,
0.5985063, -0.3600304, 1.560478, 1, 1, 1, 1, 1,
0.602922, -0.1348902, 1.377645, 1, 1, 1, 1, 1,
0.6052261, 1.366, -0.8042355, 0, 0, 1, 1, 1,
0.612087, -0.5319699, 2.263167, 1, 0, 0, 1, 1,
0.6157956, 0.669168, 0.4793257, 1, 0, 0, 1, 1,
0.6191415, -0.2000167, 0.8766974, 1, 0, 0, 1, 1,
0.6249672, 0.1264015, 1.224098, 1, 0, 0, 1, 1,
0.6257417, 1.793772, -0.3255985, 1, 0, 0, 1, 1,
0.631962, 0.8445481, 0.9627529, 0, 0, 0, 1, 1,
0.6357833, 0.9863707, -0.4055859, 0, 0, 0, 1, 1,
0.6365759, 0.03516573, 1.612131, 0, 0, 0, 1, 1,
0.6389437, -0.4318251, 2.414391, 0, 0, 0, 1, 1,
0.6446174, 0.9201851, -0.7006216, 0, 0, 0, 1, 1,
0.6536464, 0.7723109, 2.883925, 0, 0, 0, 1, 1,
0.6550165, -1.099189, 1.219962, 0, 0, 0, 1, 1,
0.6550967, 0.9108502, 0.2573106, 1, 1, 1, 1, 1,
0.6565095, -0.04404036, 0.9905359, 1, 1, 1, 1, 1,
0.6589895, 0.1623066, 1.594534, 1, 1, 1, 1, 1,
0.6636145, 2.595735, 0.6855091, 1, 1, 1, 1, 1,
0.6675633, -0.2964001, 1.199262, 1, 1, 1, 1, 1,
0.6701633, -0.2332514, 2.562797, 1, 1, 1, 1, 1,
0.6734156, 2.528439, -1.366665, 1, 1, 1, 1, 1,
0.6750103, -0.2344168, 3.088051, 1, 1, 1, 1, 1,
0.6771396, 0.1000518, 1.695023, 1, 1, 1, 1, 1,
0.6829123, -0.8159189, 3.548215, 1, 1, 1, 1, 1,
0.6845266, 0.2856613, 0.7088629, 1, 1, 1, 1, 1,
0.6854311, 1.20087, -0.09291567, 1, 1, 1, 1, 1,
0.6888579, 0.5706655, -0.9709219, 1, 1, 1, 1, 1,
0.6928813, -1.549106, 2.858076, 1, 1, 1, 1, 1,
0.7003692, -0.672835, 2.629319, 1, 1, 1, 1, 1,
0.7017483, -0.6022796, 1.112654, 0, 0, 1, 1, 1,
0.7024148, 0.5811923, 1.576099, 1, 0, 0, 1, 1,
0.7043489, 1.335768, 0.38047, 1, 0, 0, 1, 1,
0.7169388, 0.7697936, -0.937058, 1, 0, 0, 1, 1,
0.7231327, 0.1644878, 2.109647, 1, 0, 0, 1, 1,
0.733766, -0.8060756, 3.135635, 1, 0, 0, 1, 1,
0.7387438, -1.008736, 4.221884, 0, 0, 0, 1, 1,
0.7459161, -0.6697418, 4.325227, 0, 0, 0, 1, 1,
0.7467174, 1.084846, -0.479057, 0, 0, 0, 1, 1,
0.7493834, 0.1536309, 0.8232104, 0, 0, 0, 1, 1,
0.7505783, 1.314415, 1.302469, 0, 0, 0, 1, 1,
0.7535207, -0.5339304, 0.8201654, 0, 0, 0, 1, 1,
0.7544369, -1.379526, 1.721512, 0, 0, 0, 1, 1,
0.7559602, -1.337566, 4.363471, 1, 1, 1, 1, 1,
0.7563245, -0.4912104, 0.8253686, 1, 1, 1, 1, 1,
0.7584673, 0.4491322, 1.622791, 1, 1, 1, 1, 1,
0.7595449, 1.558716, 1.176817, 1, 1, 1, 1, 1,
0.7646739, 0.8289765, 1.476896, 1, 1, 1, 1, 1,
0.766422, 0.3890467, 0.9379981, 1, 1, 1, 1, 1,
0.7664891, 0.03829253, 0.6161901, 1, 1, 1, 1, 1,
0.7682545, 1.792111, -0.3059227, 1, 1, 1, 1, 1,
0.7714434, -0.4316152, 1.444658, 1, 1, 1, 1, 1,
0.7715933, -0.7541616, 2.714948, 1, 1, 1, 1, 1,
0.7778701, 1.232798, 0.4004388, 1, 1, 1, 1, 1,
0.7807216, -0.2522611, 0.7643283, 1, 1, 1, 1, 1,
0.7835982, -0.5178035, 2.550987, 1, 1, 1, 1, 1,
0.7859803, 1.021651, 1.937304, 1, 1, 1, 1, 1,
0.7860711, -2.50694, 1.805736, 1, 1, 1, 1, 1,
0.7873053, -1.214231, 3.234138, 0, 0, 1, 1, 1,
0.7875187, -0.3097069, 1.178389, 1, 0, 0, 1, 1,
0.7983072, 0.2605677, 1.129606, 1, 0, 0, 1, 1,
0.805273, 0.4004372, -0.151166, 1, 0, 0, 1, 1,
0.8072805, -1.318777, 1.721513, 1, 0, 0, 1, 1,
0.8142803, -0.3954745, 3.417085, 1, 0, 0, 1, 1,
0.8278952, -0.1467956, 2.092293, 0, 0, 0, 1, 1,
0.828086, -0.1418579, 1.837905, 0, 0, 0, 1, 1,
0.8304029, -0.8519536, 1.032912, 0, 0, 0, 1, 1,
0.8308306, -1.288275, 2.826906, 0, 0, 0, 1, 1,
0.8312313, 0.1957161, -0.6079152, 0, 0, 0, 1, 1,
0.8345095, -0.08832757, 2.281898, 0, 0, 0, 1, 1,
0.8407501, -0.3134532, 2.670873, 0, 0, 0, 1, 1,
0.8439314, -1.158806, 3.69204, 1, 1, 1, 1, 1,
0.8471758, -0.3766429, 2.329369, 1, 1, 1, 1, 1,
0.8487725, 0.08136597, 1.45075, 1, 1, 1, 1, 1,
0.8517904, 0.1269736, 0.4809835, 1, 1, 1, 1, 1,
0.8546394, -0.4300145, 4.061807, 1, 1, 1, 1, 1,
0.8585436, -0.8952525, 1.889152, 1, 1, 1, 1, 1,
0.8608205, 0.8144881, 2.171434, 1, 1, 1, 1, 1,
0.861133, 1.172419, -0.1649837, 1, 1, 1, 1, 1,
0.8669038, 1.073858, -0.8304046, 1, 1, 1, 1, 1,
0.8733075, 0.5178251, 0.7508186, 1, 1, 1, 1, 1,
0.8814551, 0.8355132, 2.310616, 1, 1, 1, 1, 1,
0.8867901, 0.08045083, 1.223662, 1, 1, 1, 1, 1,
0.9095334, 0.5750889, 1.204537, 1, 1, 1, 1, 1,
0.9108261, 1.52547, 0.8763203, 1, 1, 1, 1, 1,
0.9221554, -1.339759, 1.996181, 1, 1, 1, 1, 1,
0.9267107, 0.0392197, 0.3875216, 0, 0, 1, 1, 1,
0.9310714, 1.986175, 1.150103, 1, 0, 0, 1, 1,
0.9313466, 1.231894, 1.59188, 1, 0, 0, 1, 1,
0.9389265, 1.317615, -0.2613171, 1, 0, 0, 1, 1,
0.9397638, 0.6467053, 3.299035, 1, 0, 0, 1, 1,
0.9403466, -1.430055, 1.737556, 1, 0, 0, 1, 1,
0.9421311, -1.134344, 1.982263, 0, 0, 0, 1, 1,
0.9444, -2.346436, 1.760655, 0, 0, 0, 1, 1,
0.9456278, 1.368824, 0.6745908, 0, 0, 0, 1, 1,
0.945908, 2.172634, 0.9911196, 0, 0, 0, 1, 1,
0.9547259, -1.787454, 4.493815, 0, 0, 0, 1, 1,
0.9579294, -0.9241116, 2.207686, 0, 0, 0, 1, 1,
0.9585015, 0.4435383, -0.008860314, 0, 0, 0, 1, 1,
0.9628163, -1.385509, 1.382842, 1, 1, 1, 1, 1,
0.970697, -0.5015013, 2.660787, 1, 1, 1, 1, 1,
0.9731264, 0.4260939, -0.5958471, 1, 1, 1, 1, 1,
0.9876412, 0.2450982, 0.6928076, 1, 1, 1, 1, 1,
0.9928205, -0.3826133, 3.273038, 1, 1, 1, 1, 1,
0.9938515, 1.65024, -0.1777895, 1, 1, 1, 1, 1,
0.9968539, -0.7938273, 3.632771, 1, 1, 1, 1, 1,
0.9982906, -0.07182637, 0.8998647, 1, 1, 1, 1, 1,
1.000069, 1.831151, 1.022021, 1, 1, 1, 1, 1,
1.000448, 1.309922, 0.253066, 1, 1, 1, 1, 1,
1.005195, 0.1600985, 2.178167, 1, 1, 1, 1, 1,
1.011379, 0.8884512, 0.9793813, 1, 1, 1, 1, 1,
1.012783, -0.2011253, 0.3874719, 1, 1, 1, 1, 1,
1.022549, 0.1137939, 2.095496, 1, 1, 1, 1, 1,
1.025355, 0.2988285, 2.063786, 1, 1, 1, 1, 1,
1.032795, -0.485888, 2.756841, 0, 0, 1, 1, 1,
1.034604, -0.3258907, 1.740655, 1, 0, 0, 1, 1,
1.034881, -0.1252014, 2.291391, 1, 0, 0, 1, 1,
1.036621, 1.021813, 1.764463, 1, 0, 0, 1, 1,
1.039249, -0.1125556, 1.93518, 1, 0, 0, 1, 1,
1.040559, 1.071756, 0.6399792, 1, 0, 0, 1, 1,
1.04415, -1.268912, 2.13139, 0, 0, 0, 1, 1,
1.046597, 1.441173, 0.2719906, 0, 0, 0, 1, 1,
1.059829, 0.6608192, -0.5783423, 0, 0, 0, 1, 1,
1.06103, 1.199529, -1.11346, 0, 0, 0, 1, 1,
1.06912, -0.6159818, 3.077567, 0, 0, 0, 1, 1,
1.086485, 0.02709107, 2.075313, 0, 0, 0, 1, 1,
1.089278, 1.649655, 0.7024966, 0, 0, 0, 1, 1,
1.091295, -2.269821, 1.845274, 1, 1, 1, 1, 1,
1.095901, -0.07985585, 0.2689822, 1, 1, 1, 1, 1,
1.097195, 0.4353615, 1.284387, 1, 1, 1, 1, 1,
1.097557, -0.6437498, -0.09974622, 1, 1, 1, 1, 1,
1.101928, -1.912835, 2.90161, 1, 1, 1, 1, 1,
1.103893, 2.438267, 0.8641165, 1, 1, 1, 1, 1,
1.108699, -0.3518795, 0.7326794, 1, 1, 1, 1, 1,
1.109132, -0.001074687, -0.8069, 1, 1, 1, 1, 1,
1.113171, -0.6936907, 2.685243, 1, 1, 1, 1, 1,
1.113542, -0.8388765, 2.379428, 1, 1, 1, 1, 1,
1.123941, 1.211028, -1.295504, 1, 1, 1, 1, 1,
1.126928, -1.292328, 1.828513, 1, 1, 1, 1, 1,
1.130185, -0.1958989, 0.4833688, 1, 1, 1, 1, 1,
1.137903, 0.646435, -0.1528822, 1, 1, 1, 1, 1,
1.138666, 0.2744535, 1.425077, 1, 1, 1, 1, 1,
1.142586, -0.4695401, 3.617621, 0, 0, 1, 1, 1,
1.151001, -1.444136, 2.27197, 1, 0, 0, 1, 1,
1.15217, -0.8684542, 1.180712, 1, 0, 0, 1, 1,
1.155369, -0.9660817, 2.541057, 1, 0, 0, 1, 1,
1.156736, 0.1672833, 0.09315045, 1, 0, 0, 1, 1,
1.164213, 1.62983, -0.1633385, 1, 0, 0, 1, 1,
1.165895, -0.2669752, 1.612043, 0, 0, 0, 1, 1,
1.177308, 1.187369, 0.9018045, 0, 0, 0, 1, 1,
1.182799, -0.4989651, 2.831754, 0, 0, 0, 1, 1,
1.190756, -0.1187847, 2.593082, 0, 0, 0, 1, 1,
1.201524, 0.5480261, 2.39484, 0, 0, 0, 1, 1,
1.202575, 0.3611133, -0.1952704, 0, 0, 0, 1, 1,
1.205398, 0.2962977, 0.8974594, 0, 0, 0, 1, 1,
1.206373, 0.4833326, 2.483144, 1, 1, 1, 1, 1,
1.206676, -0.3937935, 1.254431, 1, 1, 1, 1, 1,
1.211312, 0.02406157, 2.382922, 1, 1, 1, 1, 1,
1.213317, -0.3686594, 1.190613, 1, 1, 1, 1, 1,
1.213991, -0.706101, 0.7035804, 1, 1, 1, 1, 1,
1.214944, -1.536661, 1.669972, 1, 1, 1, 1, 1,
1.215252, 1.116057, 0.1080207, 1, 1, 1, 1, 1,
1.226441, 0.2958397, 3.128564, 1, 1, 1, 1, 1,
1.229617, 0.7217613, 1.969627, 1, 1, 1, 1, 1,
1.23148, -0.9093072, 1.323928, 1, 1, 1, 1, 1,
1.234355, 1.957041, -0.2701969, 1, 1, 1, 1, 1,
1.237759, -0.9386123, 3.628842, 1, 1, 1, 1, 1,
1.246028, -0.8390688, 4.312987, 1, 1, 1, 1, 1,
1.24648, -2.532273, 4.210719, 1, 1, 1, 1, 1,
1.256671, -0.1299134, 0.1859925, 1, 1, 1, 1, 1,
1.260973, -1.11668, 2.909677, 0, 0, 1, 1, 1,
1.261307, -1.46736, 1.343986, 1, 0, 0, 1, 1,
1.268029, -0.4040825, 4.155797, 1, 0, 0, 1, 1,
1.268615, -0.5158421, 1.063657, 1, 0, 0, 1, 1,
1.278429, 0.7598521, 1.518885, 1, 0, 0, 1, 1,
1.281625, -0.2252599, 1.386562, 1, 0, 0, 1, 1,
1.290215, 0.4715536, 0.6016642, 0, 0, 0, 1, 1,
1.291986, -1.8261, 2.98806, 0, 0, 0, 1, 1,
1.295603, 0.7391042, 1.221914, 0, 0, 0, 1, 1,
1.302274, 0.3059075, 1.118832, 0, 0, 0, 1, 1,
1.315881, 1.939012, 1.457575, 0, 0, 0, 1, 1,
1.319073, 0.3100674, 1.724017, 0, 0, 0, 1, 1,
1.324114, -1.177703, 0.8581432, 0, 0, 0, 1, 1,
1.328711, -0.04185245, 2.903082, 1, 1, 1, 1, 1,
1.335097, 0.8552198, 0.8999412, 1, 1, 1, 1, 1,
1.335265, -1.524111, 3.132643, 1, 1, 1, 1, 1,
1.341248, -0.2766451, 1.177208, 1, 1, 1, 1, 1,
1.371387, 0.5009498, 1.441333, 1, 1, 1, 1, 1,
1.372445, 2.110035, -1.339272, 1, 1, 1, 1, 1,
1.382156, 0.3501422, 1.151501, 1, 1, 1, 1, 1,
1.385999, 1.756724, 2.369398, 1, 1, 1, 1, 1,
1.388344, 1.088534, -0.127841, 1, 1, 1, 1, 1,
1.392512, -0.0248897, 1.618131, 1, 1, 1, 1, 1,
1.400852, 1.301092, 2.542222, 1, 1, 1, 1, 1,
1.40297, 0.3491668, 2.043255, 1, 1, 1, 1, 1,
1.407546, -0.1698411, 3.459967, 1, 1, 1, 1, 1,
1.409779, -0.2132087, 2.266433, 1, 1, 1, 1, 1,
1.410264, -0.05356719, -0.5568392, 1, 1, 1, 1, 1,
1.41809, 0.2470136, 1.815054, 0, 0, 1, 1, 1,
1.421632, -1.241884, 2.029311, 1, 0, 0, 1, 1,
1.426261, 1.136998, 1.232041, 1, 0, 0, 1, 1,
1.429883, -0.9007497, 2.70696, 1, 0, 0, 1, 1,
1.431285, -0.0390488, -0.08818136, 1, 0, 0, 1, 1,
1.45135, -1.586663, 3.292572, 1, 0, 0, 1, 1,
1.454311, -0.6207222, 4.069478, 0, 0, 0, 1, 1,
1.456374, 0.3194249, 1.775973, 0, 0, 0, 1, 1,
1.461617, 0.1788329, 1.206792, 0, 0, 0, 1, 1,
1.473681, 0.3341751, 2.671674, 0, 0, 0, 1, 1,
1.497002, -0.2882091, 2.10287, 0, 0, 0, 1, 1,
1.551172, 0.8272835, 2.191288, 0, 0, 0, 1, 1,
1.561883, 1.827953, 1.007087, 0, 0, 0, 1, 1,
1.570265, 0.4543598, 1.476607, 1, 1, 1, 1, 1,
1.574012, -0.2216431, 2.224195, 1, 1, 1, 1, 1,
1.574417, -0.9179058, 2.088462, 1, 1, 1, 1, 1,
1.576551, -1.065905, 2.630155, 1, 1, 1, 1, 1,
1.580868, -0.2005786, 0.3832236, 1, 1, 1, 1, 1,
1.586013, -0.3378471, 2.389969, 1, 1, 1, 1, 1,
1.589558, 0.5162895, 2.782568, 1, 1, 1, 1, 1,
1.591454, 1.070458, 1.150492, 1, 1, 1, 1, 1,
1.597727, -0.01803084, 0.330389, 1, 1, 1, 1, 1,
1.607712, 0.5845184, 0.8950563, 1, 1, 1, 1, 1,
1.616251, 0.5048808, 0.8788182, 1, 1, 1, 1, 1,
1.620213, 0.1914708, 0.9808826, 1, 1, 1, 1, 1,
1.622519, -1.281045, 1.302374, 1, 1, 1, 1, 1,
1.630847, 2.946712, -1.790185, 1, 1, 1, 1, 1,
1.635911, 1.35943, -0.04772034, 1, 1, 1, 1, 1,
1.656907, 1.364118, -0.5465934, 0, 0, 1, 1, 1,
1.665303, -0.0080214, 1.521498, 1, 0, 0, 1, 1,
1.668867, -0.7917218, 1.894394, 1, 0, 0, 1, 1,
1.676887, 1.629038, 1.972031, 1, 0, 0, 1, 1,
1.682233, 0.9859524, -0.5005314, 1, 0, 0, 1, 1,
1.695659, 0.03575188, 2.224393, 1, 0, 0, 1, 1,
1.709951, -0.5653632, 2.524157, 0, 0, 0, 1, 1,
1.711821, 1.3816, -0.2458648, 0, 0, 0, 1, 1,
1.718147, -0.9362907, 2.20761, 0, 0, 0, 1, 1,
1.719007, -0.5845281, 1.589175, 0, 0, 0, 1, 1,
1.72814, -1.657483, 0.8923808, 0, 0, 0, 1, 1,
1.738276, -0.2620741, 1.908633, 0, 0, 0, 1, 1,
1.752351, 0.8416355, 0.940482, 0, 0, 0, 1, 1,
1.756366, 0.4688931, 2.246619, 1, 1, 1, 1, 1,
1.759224, -0.2009871, 0.5862371, 1, 1, 1, 1, 1,
1.76512, 0.7443676, 1.47526, 1, 1, 1, 1, 1,
1.765621, -0.6406148, 1.55418, 1, 1, 1, 1, 1,
1.796293, 1.738938, 0.9753799, 1, 1, 1, 1, 1,
1.799021, 0.1406415, 0.6502566, 1, 1, 1, 1, 1,
1.808736, 0.5349379, 1.34858, 1, 1, 1, 1, 1,
1.827897, 0.06444295, 0.2569811, 1, 1, 1, 1, 1,
1.84263, -1.779462, 2.258739, 1, 1, 1, 1, 1,
1.866095, 0.7557479, 0.6448423, 1, 1, 1, 1, 1,
1.872443, 0.491443, 2.490278, 1, 1, 1, 1, 1,
1.889624, -0.3895339, 1.941106, 1, 1, 1, 1, 1,
1.895233, 0.1998007, 0.9517522, 1, 1, 1, 1, 1,
1.916327, -0.8352087, 2.326756, 1, 1, 1, 1, 1,
1.947361, 1.090634, 2.559933, 1, 1, 1, 1, 1,
1.973361, 1.379849, 1.111485, 0, 0, 1, 1, 1,
1.983287, 0.9459802, 0.3478667, 1, 0, 0, 1, 1,
2.00861, 0.6126912, 1.049153, 1, 0, 0, 1, 1,
2.061778, -0.4363885, 2.010592, 1, 0, 0, 1, 1,
2.080434, -0.9029613, 2.168927, 1, 0, 0, 1, 1,
2.135614, -1.470403, 1.261299, 1, 0, 0, 1, 1,
2.16283, 1.141625, 1.228023, 0, 0, 0, 1, 1,
2.193233, -1.049915, 1.906142, 0, 0, 0, 1, 1,
2.280886, 1.806081, 1.591681, 0, 0, 0, 1, 1,
2.284849, 0.1372063, 1.591987, 0, 0, 0, 1, 1,
2.287877, 0.5997737, 0.7664998, 0, 0, 0, 1, 1,
2.294275, -0.5367206, 1.113, 0, 0, 0, 1, 1,
2.493403, -0.491688, 0.1277724, 0, 0, 0, 1, 1,
2.611248, -0.192007, 1.352764, 1, 1, 1, 1, 1,
2.619357, -0.3462678, 2.42067, 1, 1, 1, 1, 1,
2.725811, 0.07290035, 1.068814, 1, 1, 1, 1, 1,
2.778578, 0.6938463, 1.24104, 1, 1, 1, 1, 1,
2.952198, 0.2373627, 1.148157, 1, 1, 1, 1, 1,
3.123437, -0.9369053, 1.995387, 1, 1, 1, 1, 1,
3.221628, -0.5221491, 2.89924, 1, 1, 1, 1, 1
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
var radius = 9.904731;
var distance = 34.78995;
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
mvMatrix.translate( 0.1346724, -0.1649579, -0.5583181 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.78995);
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
