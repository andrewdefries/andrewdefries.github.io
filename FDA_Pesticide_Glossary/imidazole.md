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
-3.415263, 0.9547153, -2.037945, 1, 0, 0, 1,
-3.3032, -0.9199115, -0.4383959, 1, 0.007843138, 0, 1,
-2.764321, -0.7214707, -2.626833, 1, 0.01176471, 0, 1,
-2.666699, -0.1516002, -0.2641741, 1, 0.01960784, 0, 1,
-2.635195, 0.9261026, -0.8018801, 1, 0.02352941, 0, 1,
-2.585016, 0.6398773, -2.56635, 1, 0.03137255, 0, 1,
-2.55399, -0.3497234, -2.419333, 1, 0.03529412, 0, 1,
-2.544658, -1.284224, -3.161427, 1, 0.04313726, 0, 1,
-2.517027, -0.269005, -3.454252, 1, 0.04705882, 0, 1,
-2.476416, -0.6079354, -1.33166, 1, 0.05490196, 0, 1,
-2.31685, 0.1610159, -2.48649, 1, 0.05882353, 0, 1,
-2.303652, -0.09220047, -2.658607, 1, 0.06666667, 0, 1,
-2.2794, 0.004178659, -0.2285939, 1, 0.07058824, 0, 1,
-2.27934, -0.01822579, 0.06000803, 1, 0.07843138, 0, 1,
-2.249217, 1.257091, -2.113939, 1, 0.08235294, 0, 1,
-2.248001, -0.08474121, -0.9197261, 1, 0.09019608, 0, 1,
-2.187224, -1.088902, -2.617779, 1, 0.09411765, 0, 1,
-2.177567, -0.4423909, -0.6999586, 1, 0.1019608, 0, 1,
-2.168172, -1.68557, -3.315433, 1, 0.1098039, 0, 1,
-2.14133, -0.8516645, -2.284966, 1, 0.1137255, 0, 1,
-2.082946, -1.549421, -0.2174317, 1, 0.1215686, 0, 1,
-2.061382, -0.09497548, -2.389406, 1, 0.1254902, 0, 1,
-2.055146, -1.416031, -1.708438, 1, 0.1333333, 0, 1,
-2.042708, -0.5481628, -3.032802, 1, 0.1372549, 0, 1,
-2.040462, 1.7955, -1.080679, 1, 0.145098, 0, 1,
-2.035033, 0.4624, -2.126007, 1, 0.1490196, 0, 1,
-1.972609, 0.07162764, -1.548117, 1, 0.1568628, 0, 1,
-1.966475, -0.4453511, -2.922693, 1, 0.1607843, 0, 1,
-1.944935, -0.4350757, -3.286138, 1, 0.1686275, 0, 1,
-1.902557, -0.1988913, -3.59021, 1, 0.172549, 0, 1,
-1.850034, -0.9907928, -1.784221, 1, 0.1803922, 0, 1,
-1.843198, -0.2414604, -2.559621, 1, 0.1843137, 0, 1,
-1.82002, 1.204481, -1.853039, 1, 0.1921569, 0, 1,
-1.818714, 0.7964973, -2.984805, 1, 0.1960784, 0, 1,
-1.802272, 0.9192085, 0.4280583, 1, 0.2039216, 0, 1,
-1.794779, -1.240461, -1.959, 1, 0.2117647, 0, 1,
-1.784945, -0.9485909, -1.636749, 1, 0.2156863, 0, 1,
-1.770433, 1.931631, -1.04005, 1, 0.2235294, 0, 1,
-1.767988, 1.596863, -0.4941107, 1, 0.227451, 0, 1,
-1.748946, -2.469724, -2.822281, 1, 0.2352941, 0, 1,
-1.748647, -0.9017124, -2.135689, 1, 0.2392157, 0, 1,
-1.739215, 0.505576, -1.487861, 1, 0.2470588, 0, 1,
-1.735606, -0.9621055, -0.8867015, 1, 0.2509804, 0, 1,
-1.709591, 0.07447379, -2.700764, 1, 0.2588235, 0, 1,
-1.697043, 0.2489782, -0.861765, 1, 0.2627451, 0, 1,
-1.670937, -4.222636, -2.214014, 1, 0.2705882, 0, 1,
-1.645006, -0.1890227, -2.200134, 1, 0.2745098, 0, 1,
-1.631071, 0.6365615, -2.720059, 1, 0.282353, 0, 1,
-1.626611, 0.1496121, -1.69876, 1, 0.2862745, 0, 1,
-1.625645, 0.577888, -3.039864, 1, 0.2941177, 0, 1,
-1.616825, 1.114284, -0.3088188, 1, 0.3019608, 0, 1,
-1.616702, -0.5359484, -1.495259, 1, 0.3058824, 0, 1,
-1.615423, 0.09786388, -0.6623103, 1, 0.3137255, 0, 1,
-1.612811, 1.322625, 0.8269012, 1, 0.3176471, 0, 1,
-1.596946, 0.96201, 1.31809, 1, 0.3254902, 0, 1,
-1.591011, -1.184551, 1.039139, 1, 0.3294118, 0, 1,
-1.590189, 1.020393, -2.907374, 1, 0.3372549, 0, 1,
-1.571412, -0.8626382, -1.67608, 1, 0.3411765, 0, 1,
-1.544523, -2.303906, 0.4561284, 1, 0.3490196, 0, 1,
-1.542658, -0.8037336, -1.125998, 1, 0.3529412, 0, 1,
-1.538942, 0.7733139, -1.293642, 1, 0.3607843, 0, 1,
-1.509942, -3.823173, -3.284687, 1, 0.3647059, 0, 1,
-1.508213, 0.4093016, -1.355006, 1, 0.372549, 0, 1,
-1.507974, -1.364756, -2.100982, 1, 0.3764706, 0, 1,
-1.507714, 1.163076, -2.105153, 1, 0.3843137, 0, 1,
-1.504231, -0.8779826, -2.78065, 1, 0.3882353, 0, 1,
-1.498931, -0.523587, -1.49551, 1, 0.3960784, 0, 1,
-1.498376, 1.277387, -1.55728, 1, 0.4039216, 0, 1,
-1.492542, -0.8081959, -1.604036, 1, 0.4078431, 0, 1,
-1.49247, -0.2525888, -1.161827, 1, 0.4156863, 0, 1,
-1.49216, -0.954738, -3.253505, 1, 0.4196078, 0, 1,
-1.475071, 0.2484405, -1.190225, 1, 0.427451, 0, 1,
-1.458047, -0.1278309, -2.619487, 1, 0.4313726, 0, 1,
-1.448478, 0.2754851, -1.058215, 1, 0.4392157, 0, 1,
-1.418013, -0.02115231, -1.292949, 1, 0.4431373, 0, 1,
-1.411836, -0.5680153, -1.595244, 1, 0.4509804, 0, 1,
-1.411666, -0.4192743, -2.415901, 1, 0.454902, 0, 1,
-1.410944, 1.422951, -2.266988, 1, 0.4627451, 0, 1,
-1.408181, -1.10051, -2.4631, 1, 0.4666667, 0, 1,
-1.404589, -1.623616, -3.010758, 1, 0.4745098, 0, 1,
-1.397069, -0.1202006, -2.485354, 1, 0.4784314, 0, 1,
-1.396898, -1.145813, -1.950311, 1, 0.4862745, 0, 1,
-1.396237, 1.106736, -1.659694, 1, 0.4901961, 0, 1,
-1.378603, -1.56099, -4.01205, 1, 0.4980392, 0, 1,
-1.367146, 0.7821658, -1.983874, 1, 0.5058824, 0, 1,
-1.362746, -0.1928169, -1.326117, 1, 0.509804, 0, 1,
-1.36223, 1.147185, 0.2960696, 1, 0.5176471, 0, 1,
-1.353525, 0.863357, -1.085613, 1, 0.5215687, 0, 1,
-1.350273, -0.4561158, -1.777341, 1, 0.5294118, 0, 1,
-1.34145, -1.120705, -0.5620777, 1, 0.5333334, 0, 1,
-1.334841, 0.4559309, -0.7532234, 1, 0.5411765, 0, 1,
-1.329492, -0.4085509, -2.020388, 1, 0.5450981, 0, 1,
-1.328272, 0.5815139, -0.9321933, 1, 0.5529412, 0, 1,
-1.325886, 1.486359, -0.5878906, 1, 0.5568628, 0, 1,
-1.323933, 1.822117, 0.1967097, 1, 0.5647059, 0, 1,
-1.320145, -0.7706623, -2.050795, 1, 0.5686275, 0, 1,
-1.30289, 0.5298612, -0.5774069, 1, 0.5764706, 0, 1,
-1.301551, -2.087384, -2.860329, 1, 0.5803922, 0, 1,
-1.300652, -0.9408163, -2.496044, 1, 0.5882353, 0, 1,
-1.294551, 0.9626575, -0.9031103, 1, 0.5921569, 0, 1,
-1.292899, -0.6342288, -1.671323, 1, 0.6, 0, 1,
-1.286478, 0.5111981, 0.8079832, 1, 0.6078432, 0, 1,
-1.285899, -0.746687, -1.154246, 1, 0.6117647, 0, 1,
-1.274465, 0.3266366, -2.550305, 1, 0.6196079, 0, 1,
-1.270813, -1.236766, -1.728747, 1, 0.6235294, 0, 1,
-1.266506, 0.3084647, 0.8597081, 1, 0.6313726, 0, 1,
-1.257405, 1.13537, 0.5916913, 1, 0.6352941, 0, 1,
-1.249313, 1.851818, 0.6204547, 1, 0.6431373, 0, 1,
-1.245131, 0.8334399, -1.899265, 1, 0.6470588, 0, 1,
-1.242696, 1.257941, -0.2705998, 1, 0.654902, 0, 1,
-1.237332, 0.9353436, -1.750695, 1, 0.6588235, 0, 1,
-1.231799, -1.917738, -1.611368, 1, 0.6666667, 0, 1,
-1.229996, -0.2684616, -1.3204, 1, 0.6705883, 0, 1,
-1.228997, 0.2582393, -2.536472, 1, 0.6784314, 0, 1,
-1.224898, -1.204427, -2.223717, 1, 0.682353, 0, 1,
-1.206604, -0.8254687, -1.967779, 1, 0.6901961, 0, 1,
-1.197699, 1.722896, 1.711124, 1, 0.6941177, 0, 1,
-1.192892, 1.087, -2.304582, 1, 0.7019608, 0, 1,
-1.18477, -0.8540754, -1.709557, 1, 0.7098039, 0, 1,
-1.182374, 0.1567994, -2.508113, 1, 0.7137255, 0, 1,
-1.173457, -0.2373586, -0.8051535, 1, 0.7215686, 0, 1,
-1.173021, -0.02152131, -3.443307, 1, 0.7254902, 0, 1,
-1.172491, -0.2811708, -2.942244, 1, 0.7333333, 0, 1,
-1.161687, 0.05476017, -0.1668672, 1, 0.7372549, 0, 1,
-1.159187, -0.001569012, -2.29343, 1, 0.7450981, 0, 1,
-1.156699, -0.9697527, -1.746348, 1, 0.7490196, 0, 1,
-1.14773, -1.924094, -3.517221, 1, 0.7568628, 0, 1,
-1.146725, 0.1974945, -1.252405, 1, 0.7607843, 0, 1,
-1.142901, 0.2408473, -1.052243, 1, 0.7686275, 0, 1,
-1.142629, -1.186717, -2.422377, 1, 0.772549, 0, 1,
-1.138404, 1.103737, -1.866177, 1, 0.7803922, 0, 1,
-1.13532, 0.01762401, -2.053301, 1, 0.7843137, 0, 1,
-1.132541, 0.4119978, -1.983217, 1, 0.7921569, 0, 1,
-1.131339, 0.1757123, -1.50845, 1, 0.7960784, 0, 1,
-1.129532, 0.2359841, -0.3090546, 1, 0.8039216, 0, 1,
-1.128906, 0.2484076, -0.3939767, 1, 0.8117647, 0, 1,
-1.128299, -1.54651, -3.224566, 1, 0.8156863, 0, 1,
-1.127166, -2.143523, -2.690395, 1, 0.8235294, 0, 1,
-1.122153, -0.3528957, -1.317455, 1, 0.827451, 0, 1,
-1.121263, 1.071024, -1.82071, 1, 0.8352941, 0, 1,
-1.117712, 1.161117, -1.35808, 1, 0.8392157, 0, 1,
-1.115308, -0.5602037, -2.821418, 1, 0.8470588, 0, 1,
-1.115155, 0.4033156, -2.491965, 1, 0.8509804, 0, 1,
-1.112273, -0.4610716, -1.802055, 1, 0.8588235, 0, 1,
-1.112146, 0.7935238, 0.3144423, 1, 0.8627451, 0, 1,
-1.107979, -0.6133485, -0.966345, 1, 0.8705882, 0, 1,
-1.101874, -0.5939181, -2.400985, 1, 0.8745098, 0, 1,
-1.101712, 3.13582, 0.4974567, 1, 0.8823529, 0, 1,
-1.100051, -0.4239322, -0.7433143, 1, 0.8862745, 0, 1,
-1.096215, 0.4586932, -0.7765203, 1, 0.8941177, 0, 1,
-1.093679, 0.6435009, -0.5458256, 1, 0.8980392, 0, 1,
-1.080396, 1.73232, -0.1129723, 1, 0.9058824, 0, 1,
-1.08003, 0.3044404, -3.036159, 1, 0.9137255, 0, 1,
-1.074625, 1.047258, -1.058897, 1, 0.9176471, 0, 1,
-1.068344, 1.297346, -0.3126986, 1, 0.9254902, 0, 1,
-1.065251, -0.1704587, -1.890401, 1, 0.9294118, 0, 1,
-1.062805, -1.334879, -2.08679, 1, 0.9372549, 0, 1,
-1.059701, -0.2926252, -2.598057, 1, 0.9411765, 0, 1,
-1.054916, 0.7656725, -0.6937149, 1, 0.9490196, 0, 1,
-1.038174, -0.2776024, -1.354245, 1, 0.9529412, 0, 1,
-1.030819, -0.6011016, -3.701493, 1, 0.9607843, 0, 1,
-1.028988, 0.1052649, -0.4506656, 1, 0.9647059, 0, 1,
-1.02772, -0.1959989, -2.768788, 1, 0.972549, 0, 1,
-1.004313, -1.556429, -2.198164, 1, 0.9764706, 0, 1,
-1.003571, -1.629009, -1.667965, 1, 0.9843137, 0, 1,
-1.002549, -0.02247599, -0.1331733, 1, 0.9882353, 0, 1,
-0.9993148, 0.08122475, -1.062333, 1, 0.9960784, 0, 1,
-0.9914857, -0.1753019, -1.048851, 0.9960784, 1, 0, 1,
-0.9892178, -0.4533987, -0.4545421, 0.9921569, 1, 0, 1,
-0.9869374, -1.687099, -2.839866, 0.9843137, 1, 0, 1,
-0.9768534, 0.3199082, -1.187424, 0.9803922, 1, 0, 1,
-0.9718585, 1.616897, 0.9692171, 0.972549, 1, 0, 1,
-0.9712933, -0.2843911, -1.596012, 0.9686275, 1, 0, 1,
-0.9712321, 1.266516, 0.2150652, 0.9607843, 1, 0, 1,
-0.9673958, 1.273574, -1.829846, 0.9568627, 1, 0, 1,
-0.9672813, -0.4211167, -1.743962, 0.9490196, 1, 0, 1,
-0.9664832, 0.4702042, 0.9476135, 0.945098, 1, 0, 1,
-0.9651824, -0.3541175, -1.63535, 0.9372549, 1, 0, 1,
-0.9585941, -1.247205, -0.2895136, 0.9333333, 1, 0, 1,
-0.9478365, 2.61065, -0.04140143, 0.9254902, 1, 0, 1,
-0.9424467, 1.666722, 0.2439402, 0.9215686, 1, 0, 1,
-0.9417925, 0.2596197, -0.1221901, 0.9137255, 1, 0, 1,
-0.9407681, 0.5124226, 1.268164, 0.9098039, 1, 0, 1,
-0.9376573, -0.2454153, -0.1487363, 0.9019608, 1, 0, 1,
-0.932151, -0.4912347, -2.425195, 0.8941177, 1, 0, 1,
-0.9317345, -0.3189312, -2.800068, 0.8901961, 1, 0, 1,
-0.9277152, -1.871898, -0.7131202, 0.8823529, 1, 0, 1,
-0.9250279, -2.328803, -2.512055, 0.8784314, 1, 0, 1,
-0.9209098, -1.287438, -2.531163, 0.8705882, 1, 0, 1,
-0.913665, 1.461496, 0.4500433, 0.8666667, 1, 0, 1,
-0.9008257, 1.034169, -1.130074, 0.8588235, 1, 0, 1,
-0.8974188, 1.777561, -1.181542, 0.854902, 1, 0, 1,
-0.8851138, -0.5541232, -3.251756, 0.8470588, 1, 0, 1,
-0.8827635, -0.9641209, -3.462352, 0.8431373, 1, 0, 1,
-0.8808957, -1.075454, -3.565273, 0.8352941, 1, 0, 1,
-0.8781291, 0.1348947, -1.009918, 0.8313726, 1, 0, 1,
-0.8759012, -1.393908, -1.484071, 0.8235294, 1, 0, 1,
-0.8750547, -0.6873179, -0.9921012, 0.8196079, 1, 0, 1,
-0.8740551, -1.798387, -3.171041, 0.8117647, 1, 0, 1,
-0.8673834, -0.6426511, -1.344361, 0.8078431, 1, 0, 1,
-0.8672255, -1.309515, -3.284405, 0.8, 1, 0, 1,
-0.8672105, -1.672162, -1.379984, 0.7921569, 1, 0, 1,
-0.8664787, 0.6316402, -0.478728, 0.7882353, 1, 0, 1,
-0.8655777, 0.2126479, -2.150992, 0.7803922, 1, 0, 1,
-0.8649839, 1.051784, -0.7951223, 0.7764706, 1, 0, 1,
-0.8614076, 0.7712485, -0.2266971, 0.7686275, 1, 0, 1,
-0.8548314, 2.396186, 0.6704608, 0.7647059, 1, 0, 1,
-0.8527552, 0.1158171, 0.4786527, 0.7568628, 1, 0, 1,
-0.8501664, -0.4483816, -1.441263, 0.7529412, 1, 0, 1,
-0.8451312, -0.6476395, -2.230634, 0.7450981, 1, 0, 1,
-0.8424773, 0.4601698, -0.5251378, 0.7411765, 1, 0, 1,
-0.8387327, -0.7578804, -1.272931, 0.7333333, 1, 0, 1,
-0.8383803, 0.7462616, -0.7826151, 0.7294118, 1, 0, 1,
-0.8335116, 0.4153117, -2.066786, 0.7215686, 1, 0, 1,
-0.8315947, 1.61948, 0.8823531, 0.7176471, 1, 0, 1,
-0.8309777, 0.02995466, -1.716977, 0.7098039, 1, 0, 1,
-0.8273819, -1.480361, -1.422063, 0.7058824, 1, 0, 1,
-0.8268937, -0.539854, -3.078379, 0.6980392, 1, 0, 1,
-0.8266754, -0.2317457, -0.692177, 0.6901961, 1, 0, 1,
-0.8263471, 0.09836246, -0.4742239, 0.6862745, 1, 0, 1,
-0.8258738, -3.602324, -5.128643, 0.6784314, 1, 0, 1,
-0.8206322, 0.3540396, -3.017347, 0.6745098, 1, 0, 1,
-0.8153505, 1.300561, -3.09405, 0.6666667, 1, 0, 1,
-0.8143623, 0.04369721, -4.293266, 0.6627451, 1, 0, 1,
-0.8137283, -0.2608937, -2.013983, 0.654902, 1, 0, 1,
-0.8110978, -1.214317, -0.9139413, 0.6509804, 1, 0, 1,
-0.8067894, 0.2793078, -1.701861, 0.6431373, 1, 0, 1,
-0.8017837, 1.057163, 0.1840421, 0.6392157, 1, 0, 1,
-0.8005537, 2.104139, -1.249781, 0.6313726, 1, 0, 1,
-0.8001526, 0.4501115, -0.8058754, 0.627451, 1, 0, 1,
-0.7965941, 0.8100932, -0.8239613, 0.6196079, 1, 0, 1,
-0.7888318, 0.3832001, 2.20299, 0.6156863, 1, 0, 1,
-0.7838436, -0.7028357, -3.948278, 0.6078432, 1, 0, 1,
-0.7766051, -0.5040664, -2.900234, 0.6039216, 1, 0, 1,
-0.7727646, -0.3053527, 0.06072337, 0.5960785, 1, 0, 1,
-0.7646954, 1.250512, -0.6013751, 0.5882353, 1, 0, 1,
-0.7636077, 1.044875, -2.028066, 0.5843138, 1, 0, 1,
-0.7633556, 0.3179394, -1.42376, 0.5764706, 1, 0, 1,
-0.7618227, 0.4955139, -1.343984, 0.572549, 1, 0, 1,
-0.7611034, -1.118316, -2.293871, 0.5647059, 1, 0, 1,
-0.7481188, -1.497581, -2.681881, 0.5607843, 1, 0, 1,
-0.743911, 0.13773, 0.562706, 0.5529412, 1, 0, 1,
-0.741377, 0.3103009, 1.177614, 0.5490196, 1, 0, 1,
-0.7369972, 0.4667301, -1.085433, 0.5411765, 1, 0, 1,
-0.7366214, -0.6910594, -2.078766, 0.5372549, 1, 0, 1,
-0.7309561, 0.7489837, -1.89425, 0.5294118, 1, 0, 1,
-0.7299842, -0.3227485, -3.156547, 0.5254902, 1, 0, 1,
-0.7288836, 0.2589253, -2.546422, 0.5176471, 1, 0, 1,
-0.7257004, 1.061404, 0.06399897, 0.5137255, 1, 0, 1,
-0.723776, 0.6634877, -1.702695, 0.5058824, 1, 0, 1,
-0.7220743, -0.3281582, -0.2626683, 0.5019608, 1, 0, 1,
-0.7200604, -1.419241, -1.597797, 0.4941176, 1, 0, 1,
-0.7174437, -0.7625853, -3.114387, 0.4862745, 1, 0, 1,
-0.711517, -0.8557699, -2.097325, 0.4823529, 1, 0, 1,
-0.7108013, 0.01668668, -1.03401, 0.4745098, 1, 0, 1,
-0.7010622, -0.7952569, -2.435443, 0.4705882, 1, 0, 1,
-0.6931707, -1.167995, -1.882675, 0.4627451, 1, 0, 1,
-0.6930831, -0.3170965, -1.828128, 0.4588235, 1, 0, 1,
-0.6927808, 1.419077, 0.5874038, 0.4509804, 1, 0, 1,
-0.6897556, 2.04556, -1.834635, 0.4470588, 1, 0, 1,
-0.6890413, -0.5290931, -1.301017, 0.4392157, 1, 0, 1,
-0.6869002, 0.1512594, -1.298735, 0.4352941, 1, 0, 1,
-0.6846382, -0.4054321, -1.204063, 0.427451, 1, 0, 1,
-0.6843996, 1.020443, -1.022993, 0.4235294, 1, 0, 1,
-0.6775258, -1.153303, -1.27345, 0.4156863, 1, 0, 1,
-0.6744951, 0.3819574, -1.661173, 0.4117647, 1, 0, 1,
-0.6728336, 1.153087, -1.218723, 0.4039216, 1, 0, 1,
-0.6696129, 1.236485, -1.28818, 0.3960784, 1, 0, 1,
-0.6694754, 0.2915181, -2.248014, 0.3921569, 1, 0, 1,
-0.6669511, -1.620707, -4.824402, 0.3843137, 1, 0, 1,
-0.66658, -0.624106, -3.036648, 0.3803922, 1, 0, 1,
-0.6660506, -0.4307011, -1.55304, 0.372549, 1, 0, 1,
-0.6640494, -0.4645154, -1.589201, 0.3686275, 1, 0, 1,
-0.6579568, 0.7392686, -0.8818308, 0.3607843, 1, 0, 1,
-0.6569418, -1.393416, -3.151002, 0.3568628, 1, 0, 1,
-0.6500077, -0.2122853, -1.595542, 0.3490196, 1, 0, 1,
-0.6493697, 0.01567165, -2.001798, 0.345098, 1, 0, 1,
-0.6394997, -0.142621, -1.741067, 0.3372549, 1, 0, 1,
-0.63737, -0.937302, -3.564645, 0.3333333, 1, 0, 1,
-0.6323978, 1.836347, 0.7813539, 0.3254902, 1, 0, 1,
-0.6299029, -0.36311, -1.552781, 0.3215686, 1, 0, 1,
-0.6256903, 1.914845, -0.09183849, 0.3137255, 1, 0, 1,
-0.6252987, -1.963052, -4.002, 0.3098039, 1, 0, 1,
-0.6209484, -0.4058158, -3.567956, 0.3019608, 1, 0, 1,
-0.6178102, -1.029281, -3.803185, 0.2941177, 1, 0, 1,
-0.614244, -3.302204, -3.175234, 0.2901961, 1, 0, 1,
-0.6116528, 0.5528831, -2.524682, 0.282353, 1, 0, 1,
-0.6100553, -1.292601, -2.732089, 0.2784314, 1, 0, 1,
-0.6082264, -0.3934881, -2.686974, 0.2705882, 1, 0, 1,
-0.6070436, -0.1034869, -1.098608, 0.2666667, 1, 0, 1,
-0.6063711, 1.187913, 1.863281, 0.2588235, 1, 0, 1,
-0.5993832, -1.122864, -2.373383, 0.254902, 1, 0, 1,
-0.5981517, 1.600321, 1.094031, 0.2470588, 1, 0, 1,
-0.598031, 0.6860306, -1.902677, 0.2431373, 1, 0, 1,
-0.597822, -0.6985955, -0.6947923, 0.2352941, 1, 0, 1,
-0.5958267, 0.7640917, -2.682264, 0.2313726, 1, 0, 1,
-0.5917767, -1.503486, -1.800514, 0.2235294, 1, 0, 1,
-0.5888237, -0.1532806, -2.635694, 0.2196078, 1, 0, 1,
-0.5884006, -0.7979575, -2.863381, 0.2117647, 1, 0, 1,
-0.5865216, -1.192027, -1.947723, 0.2078431, 1, 0, 1,
-0.5820779, 0.4455227, -0.5860319, 0.2, 1, 0, 1,
-0.5784818, -1.292619, -2.75015, 0.1921569, 1, 0, 1,
-0.5759354, -0.2829958, -2.531091, 0.1882353, 1, 0, 1,
-0.5745496, -0.6004562, -3.986394, 0.1803922, 1, 0, 1,
-0.5694669, 0.8547103, -0.6904889, 0.1764706, 1, 0, 1,
-0.5660695, -0.04981237, -2.692896, 0.1686275, 1, 0, 1,
-0.5635867, -1.270287, -1.153955, 0.1647059, 1, 0, 1,
-0.5618477, 0.08427981, -1.827954, 0.1568628, 1, 0, 1,
-0.5532544, -1.485334, -3.247444, 0.1529412, 1, 0, 1,
-0.5502989, -0.7980875, -1.494051, 0.145098, 1, 0, 1,
-0.5481016, -1.049308, -3.207797, 0.1411765, 1, 0, 1,
-0.5373194, 0.2389111, -1.703412, 0.1333333, 1, 0, 1,
-0.5355363, -0.4585543, -0.2593765, 0.1294118, 1, 0, 1,
-0.534991, -0.1840143, -2.640699, 0.1215686, 1, 0, 1,
-0.5311022, 0.3287147, -0.2542654, 0.1176471, 1, 0, 1,
-0.5307644, -0.795579, -2.711455, 0.1098039, 1, 0, 1,
-0.5288223, 0.6991985, -2.774721, 0.1058824, 1, 0, 1,
-0.5219718, -0.709807, -2.743867, 0.09803922, 1, 0, 1,
-0.5172853, 1.249523, -0.4756892, 0.09019608, 1, 0, 1,
-0.5169693, -1.365665, -3.960696, 0.08627451, 1, 0, 1,
-0.516244, 0.080972, 1.055423, 0.07843138, 1, 0, 1,
-0.5151269, -0.2558838, -2.080124, 0.07450981, 1, 0, 1,
-0.5141705, -0.7188988, -1.274859, 0.06666667, 1, 0, 1,
-0.5132021, -0.7839973, -3.108299, 0.0627451, 1, 0, 1,
-0.512615, 0.2658877, 0.5282768, 0.05490196, 1, 0, 1,
-0.5099615, -0.6780545, -4.081471, 0.05098039, 1, 0, 1,
-0.5066605, 0.007116037, -0.3153642, 0.04313726, 1, 0, 1,
-0.5051559, 1.731282, -1.089747, 0.03921569, 1, 0, 1,
-0.491522, -0.2515797, -2.203681, 0.03137255, 1, 0, 1,
-0.4892443, 1.540607, -0.9949258, 0.02745098, 1, 0, 1,
-0.488361, -0.260164, -1.056709, 0.01960784, 1, 0, 1,
-0.4842195, -0.8385052, -4.493317, 0.01568628, 1, 0, 1,
-0.4593869, -0.1890263, -1.504512, 0.007843138, 1, 0, 1,
-0.4592277, -0.9591309, -2.301861, 0.003921569, 1, 0, 1,
-0.4467586, -0.4119768, -4.04614, 0, 1, 0.003921569, 1,
-0.4448816, -1.152035, -2.33232, 0, 1, 0.01176471, 1,
-0.4432845, 0.8447681, -0.8988189, 0, 1, 0.01568628, 1,
-0.4400184, 1.078288, -1.08946, 0, 1, 0.02352941, 1,
-0.4378444, 0.9708548, 0.5448734, 0, 1, 0.02745098, 1,
-0.4314912, -1.257221, -3.759228, 0, 1, 0.03529412, 1,
-0.429859, 1.07396, 0.2621959, 0, 1, 0.03921569, 1,
-0.4228366, 0.8851522, -1.042009, 0, 1, 0.04705882, 1,
-0.4217336, 0.08985595, -2.683283, 0, 1, 0.05098039, 1,
-0.4189599, 0.3708194, -0.7928252, 0, 1, 0.05882353, 1,
-0.4186532, -0.6504889, -1.140669, 0, 1, 0.0627451, 1,
-0.4174109, -0.4769097, -4.041794, 0, 1, 0.07058824, 1,
-0.411048, -0.6359838, -4.328127, 0, 1, 0.07450981, 1,
-0.4083388, 0.5669596, -0.4482839, 0, 1, 0.08235294, 1,
-0.4083197, -1.413731, -3.225216, 0, 1, 0.08627451, 1,
-0.4042939, -0.09010189, -0.9705869, 0, 1, 0.09411765, 1,
-0.4040444, 0.04448534, -0.7446135, 0, 1, 0.1019608, 1,
-0.3968906, -0.001908805, -0.8877032, 0, 1, 0.1058824, 1,
-0.3942354, 0.2120162, 0.5185523, 0, 1, 0.1137255, 1,
-0.3932723, -0.58369, -3.830921, 0, 1, 0.1176471, 1,
-0.3930678, 1.229599, -0.9596463, 0, 1, 0.1254902, 1,
-0.3903452, 2.941861, -1.312215, 0, 1, 0.1294118, 1,
-0.3863565, 0.713286, -2.572304, 0, 1, 0.1372549, 1,
-0.3844863, 1.13468, -0.3850204, 0, 1, 0.1411765, 1,
-0.3842224, -0.2167134, -1.352601, 0, 1, 0.1490196, 1,
-0.3833829, 0.9908168, -1.856043, 0, 1, 0.1529412, 1,
-0.3804394, 0.547718, -1.011087, 0, 1, 0.1607843, 1,
-0.378427, -0.6090509, -3.244634, 0, 1, 0.1647059, 1,
-0.3759394, -0.9710599, -2.53624, 0, 1, 0.172549, 1,
-0.3730884, -0.3783303, -2.645684, 0, 1, 0.1764706, 1,
-0.3715067, 0.4172222, -1.252296, 0, 1, 0.1843137, 1,
-0.3698251, 1.413617, -1.268751, 0, 1, 0.1882353, 1,
-0.365096, 0.09153157, -2.36863, 0, 1, 0.1960784, 1,
-0.3645511, 0.04859907, -0.9708304, 0, 1, 0.2039216, 1,
-0.3618472, 0.2378025, 0.6593465, 0, 1, 0.2078431, 1,
-0.3615411, 0.3926131, -1.297696, 0, 1, 0.2156863, 1,
-0.3611626, -0.60228, -1.165002, 0, 1, 0.2196078, 1,
-0.3605526, 2.119641, -0.7007836, 0, 1, 0.227451, 1,
-0.3603059, 0.09486791, -1.416716, 0, 1, 0.2313726, 1,
-0.3597195, -1.358558, -3.987343, 0, 1, 0.2392157, 1,
-0.3587478, 1.163741, -0.2291657, 0, 1, 0.2431373, 1,
-0.3585818, -0.770303, -2.421502, 0, 1, 0.2509804, 1,
-0.3581318, 0.09105769, -0.9148108, 0, 1, 0.254902, 1,
-0.3565695, -0.6633879, -2.22904, 0, 1, 0.2627451, 1,
-0.3563686, -1.445046, -3.239317, 0, 1, 0.2666667, 1,
-0.3544655, 0.659508, -0.5398349, 0, 1, 0.2745098, 1,
-0.3514835, -0.7539899, -1.348059, 0, 1, 0.2784314, 1,
-0.3498348, 1.461632, -1.136141, 0, 1, 0.2862745, 1,
-0.3461815, -0.7420481, -3.281184, 0, 1, 0.2901961, 1,
-0.3454679, -0.1360583, -0.8381463, 0, 1, 0.2980392, 1,
-0.3440311, 0.8762952, -1.892553, 0, 1, 0.3058824, 1,
-0.3434345, 0.4799231, -0.2968615, 0, 1, 0.3098039, 1,
-0.3400506, -1.254893, -3.12301, 0, 1, 0.3176471, 1,
-0.3398174, 1.598613, -1.503856, 0, 1, 0.3215686, 1,
-0.3388999, 0.3404718, -1.074561, 0, 1, 0.3294118, 1,
-0.3376157, -0.6505745, -1.878762, 0, 1, 0.3333333, 1,
-0.331623, -1.264285, -2.443254, 0, 1, 0.3411765, 1,
-0.3244897, -0.08018284, -1.144713, 0, 1, 0.345098, 1,
-0.3177016, 0.05873884, -2.207004, 0, 1, 0.3529412, 1,
-0.3175274, -0.9775456, -2.504548, 0, 1, 0.3568628, 1,
-0.3128389, 0.4299162, -1.990136, 0, 1, 0.3647059, 1,
-0.3107573, 1.600133, 0.03706626, 0, 1, 0.3686275, 1,
-0.3105528, -1.307038, -3.651242, 0, 1, 0.3764706, 1,
-0.3079184, -2.224572, -3.784444, 0, 1, 0.3803922, 1,
-0.305143, 0.3896801, -1.312628, 0, 1, 0.3882353, 1,
-0.2975761, -1.163605, -3.250317, 0, 1, 0.3921569, 1,
-0.2938921, 0.1412732, 0.0116455, 0, 1, 0.4, 1,
-0.2832638, -0.2106031, -2.330243, 0, 1, 0.4078431, 1,
-0.2797312, 1.001166, -0.488313, 0, 1, 0.4117647, 1,
-0.2780318, -1.209554, -2.390996, 0, 1, 0.4196078, 1,
-0.2735092, 0.7253439, 1.069684, 0, 1, 0.4235294, 1,
-0.2701388, -0.8370026, -3.531901, 0, 1, 0.4313726, 1,
-0.2685966, -0.07420868, -0.5500973, 0, 1, 0.4352941, 1,
-0.2678815, 1.966156, -0.4259883, 0, 1, 0.4431373, 1,
-0.2569313, -0.2717494, -3.171714, 0, 1, 0.4470588, 1,
-0.2558661, -1.623714, -3.814161, 0, 1, 0.454902, 1,
-0.2546926, -0.9330175, -3.02173, 0, 1, 0.4588235, 1,
-0.2545, 0.0441969, -2.344337, 0, 1, 0.4666667, 1,
-0.2544621, 0.2979907, 1.069446, 0, 1, 0.4705882, 1,
-0.2543984, 1.227782, -0.7163163, 0, 1, 0.4784314, 1,
-0.2543084, -0.9760808, -3.507956, 0, 1, 0.4823529, 1,
-0.2477893, 0.2047222, 0.96463, 0, 1, 0.4901961, 1,
-0.247485, -0.9116886, -4.998211, 0, 1, 0.4941176, 1,
-0.2398061, -0.5543331, -2.670707, 0, 1, 0.5019608, 1,
-0.2332002, -1.672331, -1.24227, 0, 1, 0.509804, 1,
-0.2329127, -0.572166, -3.262701, 0, 1, 0.5137255, 1,
-0.2302685, -0.6732288, -3.682577, 0, 1, 0.5215687, 1,
-0.2298409, 0.4647535, 0.2086146, 0, 1, 0.5254902, 1,
-0.2227177, -0.459544, -2.412471, 0, 1, 0.5333334, 1,
-0.2215362, 1.327104, 1.793435, 0, 1, 0.5372549, 1,
-0.2175151, -0.7370479, -1.71234, 0, 1, 0.5450981, 1,
-0.2163346, -0.03272782, -1.753917, 0, 1, 0.5490196, 1,
-0.2140994, -0.2792431, -2.497738, 0, 1, 0.5568628, 1,
-0.2114568, -1.808966, -1.825366, 0, 1, 0.5607843, 1,
-0.2112795, -0.3832733, -1.542439, 0, 1, 0.5686275, 1,
-0.2105409, -0.2780164, 0.05262417, 0, 1, 0.572549, 1,
-0.2091119, 0.8738112, 0.5855644, 0, 1, 0.5803922, 1,
-0.2046311, 0.579613, -0.5511114, 0, 1, 0.5843138, 1,
-0.2043507, 0.585107, -1.6326, 0, 1, 0.5921569, 1,
-0.2019454, 0.5562797, 0.1773493, 0, 1, 0.5960785, 1,
-0.1931704, -1.313916, -3.164626, 0, 1, 0.6039216, 1,
-0.18808, 1.917646, -0.7038375, 0, 1, 0.6117647, 1,
-0.1867732, -1.682744, -3.811031, 0, 1, 0.6156863, 1,
-0.1853209, -1.125558, -3.732295, 0, 1, 0.6235294, 1,
-0.1708084, 0.08335378, 0.2943666, 0, 1, 0.627451, 1,
-0.1686932, -1.4983, -5.809216, 0, 1, 0.6352941, 1,
-0.165639, -1.024748, -3.278109, 0, 1, 0.6392157, 1,
-0.1635645, 0.2545188, -0.3416693, 0, 1, 0.6470588, 1,
-0.1607993, -0.4717892, -2.45287, 0, 1, 0.6509804, 1,
-0.1581854, -0.4530888, -2.899564, 0, 1, 0.6588235, 1,
-0.1577763, 1.759301, -1.318966, 0, 1, 0.6627451, 1,
-0.1480672, -0.6665113, -3.006455, 0, 1, 0.6705883, 1,
-0.1480571, -0.06563232, -3.531816, 0, 1, 0.6745098, 1,
-0.144441, 0.06785389, -1.36644, 0, 1, 0.682353, 1,
-0.1434209, 1.129735, 1.381796, 0, 1, 0.6862745, 1,
-0.1401733, 1.184922, -0.5881608, 0, 1, 0.6941177, 1,
-0.1390035, 0.9839017, 0.4342827, 0, 1, 0.7019608, 1,
-0.136623, 1.4392, -0.5580377, 0, 1, 0.7058824, 1,
-0.1342487, 0.01072589, -1.014215, 0, 1, 0.7137255, 1,
-0.1335839, 1.162703, 1.117734, 0, 1, 0.7176471, 1,
-0.1288538, 1.774213, 1.108303, 0, 1, 0.7254902, 1,
-0.1251763, 0.3648872, -1.356882, 0, 1, 0.7294118, 1,
-0.1240793, -0.6182867, -2.484861, 0, 1, 0.7372549, 1,
-0.122768, -1.190578, -4.461849, 0, 1, 0.7411765, 1,
-0.1185499, 0.4833902, 0.04439885, 0, 1, 0.7490196, 1,
-0.1156004, 1.25064, -0.9408665, 0, 1, 0.7529412, 1,
-0.1152249, -0.7789821, -3.347535, 0, 1, 0.7607843, 1,
-0.1097234, -0.3691467, -3.620903, 0, 1, 0.7647059, 1,
-0.1065513, 0.3960348, 0.7945789, 0, 1, 0.772549, 1,
-0.106462, -0.2641201, -2.987597, 0, 1, 0.7764706, 1,
-0.1047768, -0.518313, -3.16919, 0, 1, 0.7843137, 1,
-0.1029518, -1.01362, -4.206112, 0, 1, 0.7882353, 1,
-0.08998314, -0.928492, -2.366049, 0, 1, 0.7960784, 1,
-0.08926488, 2.347244, -2.265169, 0, 1, 0.8039216, 1,
-0.08868958, 0.4281117, -1.666094, 0, 1, 0.8078431, 1,
-0.08213153, -0.1351343, -2.953181, 0, 1, 0.8156863, 1,
-0.0778451, 2.138373, -1.132284, 0, 1, 0.8196079, 1,
-0.0777906, 1.245409, 2.69824, 0, 1, 0.827451, 1,
-0.07327127, 0.3963667, -1.543606, 0, 1, 0.8313726, 1,
-0.07134461, 0.1172434, 0.2144362, 0, 1, 0.8392157, 1,
-0.06494389, -1.725546, -3.702784, 0, 1, 0.8431373, 1,
-0.0622551, 0.8029007, -1.146833, 0, 1, 0.8509804, 1,
-0.05976174, 1.763467, 1.040988, 0, 1, 0.854902, 1,
-0.05827415, 0.7251658, -0.7151738, 0, 1, 0.8627451, 1,
-0.0540088, -0.7133842, -3.893655, 0, 1, 0.8666667, 1,
-0.04855295, -0.5777606, -3.563358, 0, 1, 0.8745098, 1,
-0.04485836, 0.4507697, -1.392154, 0, 1, 0.8784314, 1,
-0.04326335, -0.1467935, -2.77158, 0, 1, 0.8862745, 1,
-0.03939582, -0.3894603, -2.983877, 0, 1, 0.8901961, 1,
-0.03805123, -0.6841112, -4.568911, 0, 1, 0.8980392, 1,
-0.03189078, 0.2500069, -0.2496522, 0, 1, 0.9058824, 1,
-0.0299904, 0.175318, -1.500858, 0, 1, 0.9098039, 1,
-0.02479463, -0.7872625, -2.757373, 0, 1, 0.9176471, 1,
-0.02401687, -2.893403, -4.450372, 0, 1, 0.9215686, 1,
-0.02376746, -1.406597, -2.385476, 0, 1, 0.9294118, 1,
-0.02204453, -0.03351976, -2.17259, 0, 1, 0.9333333, 1,
-0.02001799, -1.717266, -1.859707, 0, 1, 0.9411765, 1,
-0.01701285, -0.4193689, -1.989668, 0, 1, 0.945098, 1,
-0.01622383, 0.08405958, -0.2791494, 0, 1, 0.9529412, 1,
-0.0001681362, 0.208186, 0.7044676, 0, 1, 0.9568627, 1,
0.0001717264, 0.2266588, -1.304841, 0, 1, 0.9647059, 1,
0.000707206, -1.946344, 3.631602, 0, 1, 0.9686275, 1,
0.0008941634, -0.2745416, 3.938323, 0, 1, 0.9764706, 1,
0.001363534, 1.175535, 0.6717672, 0, 1, 0.9803922, 1,
0.002409377, 0.3153486, -1.323657, 0, 1, 0.9882353, 1,
0.005747712, -2.599065, 3.653307, 0, 1, 0.9921569, 1,
0.00610033, 2.021227, -0.2960736, 0, 1, 1, 1,
0.007789752, 0.9002283, -0.1084387, 0, 0.9921569, 1, 1,
0.008608024, -1.564944, 3.680231, 0, 0.9882353, 1, 1,
0.01212926, -0.9713334, 1.191135, 0, 0.9803922, 1, 1,
0.01421236, -0.2740861, 1.554572, 0, 0.9764706, 1, 1,
0.01954614, -1.114187, 2.522728, 0, 0.9686275, 1, 1,
0.02139523, -0.3055664, 3.044012, 0, 0.9647059, 1, 1,
0.02144128, -1.841699, 4.719342, 0, 0.9568627, 1, 1,
0.02356368, -0.3591481, 4.280749, 0, 0.9529412, 1, 1,
0.0245326, 0.7143815, -0.2053849, 0, 0.945098, 1, 1,
0.02758477, -1.113992, 4.955702, 0, 0.9411765, 1, 1,
0.03267563, -0.3260677, 3.268659, 0, 0.9333333, 1, 1,
0.03288591, -0.1282977, 3.863932, 0, 0.9294118, 1, 1,
0.03309655, -0.662934, 3.341845, 0, 0.9215686, 1, 1,
0.03427996, -0.2538079, 4.819306, 0, 0.9176471, 1, 1,
0.03938203, 0.4947533, 0.4683045, 0, 0.9098039, 1, 1,
0.04231832, 0.7441297, -0.927003, 0, 0.9058824, 1, 1,
0.045316, -1.584615, 2.815303, 0, 0.8980392, 1, 1,
0.04642776, -0.7544398, 3.788331, 0, 0.8901961, 1, 1,
0.04660846, 2.175972, -0.6447607, 0, 0.8862745, 1, 1,
0.05059665, 1.701034, -0.9773214, 0, 0.8784314, 1, 1,
0.0532354, -0.9915602, 1.284601, 0, 0.8745098, 1, 1,
0.05647452, -0.2902483, 4.341636, 0, 0.8666667, 1, 1,
0.05761383, 1.248652, -0.223784, 0, 0.8627451, 1, 1,
0.05782706, -0.4345845, 3.231519, 0, 0.854902, 1, 1,
0.05803874, 1.209871, 0.05766148, 0, 0.8509804, 1, 1,
0.06210668, -0.9764509, 2.973732, 0, 0.8431373, 1, 1,
0.0687993, 1.130528, 0.9060852, 0, 0.8392157, 1, 1,
0.07265558, 0.5054466, 0.9155846, 0, 0.8313726, 1, 1,
0.07352984, 1.006197, 0.9582456, 0, 0.827451, 1, 1,
0.0807201, -0.2493694, 4.336843, 0, 0.8196079, 1, 1,
0.08236581, -0.1192369, 2.411421, 0, 0.8156863, 1, 1,
0.08613409, -1.469499, 2.786123, 0, 0.8078431, 1, 1,
0.09092471, 1.290065, -2.131035, 0, 0.8039216, 1, 1,
0.09093071, -0.6609418, 3.022541, 0, 0.7960784, 1, 1,
0.09221044, -1.063918, 2.058867, 0, 0.7882353, 1, 1,
0.09288242, -0.6778409, 3.91146, 0, 0.7843137, 1, 1,
0.09469631, -0.1734879, 1.470569, 0, 0.7764706, 1, 1,
0.09636275, 0.2513839, 0.9342505, 0, 0.772549, 1, 1,
0.1035989, -1.222417, 3.547725, 0, 0.7647059, 1, 1,
0.1044099, -1.290574, 1.916309, 0, 0.7607843, 1, 1,
0.1072085, 0.9391015, 1.269116, 0, 0.7529412, 1, 1,
0.1102129, -0.01891055, 3.083105, 0, 0.7490196, 1, 1,
0.1116078, -1.213139, 3.419266, 0, 0.7411765, 1, 1,
0.1175214, 1.205282, 0.9504536, 0, 0.7372549, 1, 1,
0.1235297, 1.326267, -0.3076824, 0, 0.7294118, 1, 1,
0.1311159, -0.08519023, 1.545787, 0, 0.7254902, 1, 1,
0.1356291, 0.003310038, 2.139623, 0, 0.7176471, 1, 1,
0.1364517, -1.870554, 2.42228, 0, 0.7137255, 1, 1,
0.1370589, -1.368648, 3.655614, 0, 0.7058824, 1, 1,
0.1386082, -0.2296841, 2.35569, 0, 0.6980392, 1, 1,
0.1421966, 0.4138449, 1.742978, 0, 0.6941177, 1, 1,
0.1460633, 0.3076287, 1.423566, 0, 0.6862745, 1, 1,
0.1477023, -1.823187, 2.651407, 0, 0.682353, 1, 1,
0.1490402, -0.5509508, 3.151151, 0, 0.6745098, 1, 1,
0.1490835, -0.1807266, 4.262686, 0, 0.6705883, 1, 1,
0.1495045, -0.01379758, 0.8427301, 0, 0.6627451, 1, 1,
0.1534442, 1.399882, -0.1801413, 0, 0.6588235, 1, 1,
0.1540217, 1.583445, -0.4700229, 0, 0.6509804, 1, 1,
0.1575287, -0.59463, 3.01606, 0, 0.6470588, 1, 1,
0.1577627, 1.027265, 0.743506, 0, 0.6392157, 1, 1,
0.158993, 0.2006488, -0.2066568, 0, 0.6352941, 1, 1,
0.1591795, -0.5069885, 3.250338, 0, 0.627451, 1, 1,
0.1600803, -0.3548448, 4.405834, 0, 0.6235294, 1, 1,
0.1639071, -0.2617943, 1.677487, 0, 0.6156863, 1, 1,
0.1652006, 0.9356433, 0.1557912, 0, 0.6117647, 1, 1,
0.1673841, -0.1928324, 1.692695, 0, 0.6039216, 1, 1,
0.173825, 0.01915058, 2.170658, 0, 0.5960785, 1, 1,
0.1740778, -0.2964943, 2.4516, 0, 0.5921569, 1, 1,
0.1745644, 0.2128408, 0.3279385, 0, 0.5843138, 1, 1,
0.1796201, -0.3606161, 2.592313, 0, 0.5803922, 1, 1,
0.1816004, 1.339582, 1.705471, 0, 0.572549, 1, 1,
0.1851782, 0.2795254, 0.9881477, 0, 0.5686275, 1, 1,
0.1856516, -0.533987, 2.889747, 0, 0.5607843, 1, 1,
0.1871061, -0.6817216, 1.065205, 0, 0.5568628, 1, 1,
0.1878781, 1.599216, 0.1809817, 0, 0.5490196, 1, 1,
0.1904832, -1.245225, 2.67074, 0, 0.5450981, 1, 1,
0.1933371, 0.2508006, 0.1289893, 0, 0.5372549, 1, 1,
0.1938189, -0.5574104, 2.522515, 0, 0.5333334, 1, 1,
0.1988243, 0.2958069, -0.6754227, 0, 0.5254902, 1, 1,
0.2009433, -1.637282, 1.676119, 0, 0.5215687, 1, 1,
0.2013618, 0.7500522, -0.5784228, 0, 0.5137255, 1, 1,
0.2022434, -0.3347041, 1.677795, 0, 0.509804, 1, 1,
0.2091159, 0.003758293, 1.562479, 0, 0.5019608, 1, 1,
0.2091979, 0.4418414, 0.6745386, 0, 0.4941176, 1, 1,
0.2106465, 0.2451237, -0.9178314, 0, 0.4901961, 1, 1,
0.2124236, -0.4376483, 3.826217, 0, 0.4823529, 1, 1,
0.213428, 0.007218596, 1.951562, 0, 0.4784314, 1, 1,
0.216365, -0.6511502, 2.639288, 0, 0.4705882, 1, 1,
0.218259, -1.128702, 1.153051, 0, 0.4666667, 1, 1,
0.2301497, 0.4567254, -0.6584052, 0, 0.4588235, 1, 1,
0.2308339, -0.02978344, 0.6599727, 0, 0.454902, 1, 1,
0.2308543, 0.1447806, 0.4699687, 0, 0.4470588, 1, 1,
0.2310013, -1.66228, 3.128703, 0, 0.4431373, 1, 1,
0.2362496, 0.8603549, -0.9489084, 0, 0.4352941, 1, 1,
0.2375713, 2.122843, 1.814481, 0, 0.4313726, 1, 1,
0.2396386, -1.059259, 3.181324, 0, 0.4235294, 1, 1,
0.2413257, 0.3566209, 0.4428831, 0, 0.4196078, 1, 1,
0.2420619, -0.3259874, 3.687613, 0, 0.4117647, 1, 1,
0.2435674, -0.4643257, 3.732825, 0, 0.4078431, 1, 1,
0.2444374, 2.198673, 1.638783, 0, 0.4, 1, 1,
0.2446885, -2.817184, 1.874952, 0, 0.3921569, 1, 1,
0.2491905, 0.5427623, 0.758719, 0, 0.3882353, 1, 1,
0.2526333, -0.6550483, 2.381843, 0, 0.3803922, 1, 1,
0.2556767, -0.6561014, 3.21152, 0, 0.3764706, 1, 1,
0.2564451, 0.323367, -1.213755, 0, 0.3686275, 1, 1,
0.2606384, 0.4010655, -0.4698384, 0, 0.3647059, 1, 1,
0.2623514, 0.3987791, 1.435238, 0, 0.3568628, 1, 1,
0.2734809, -1.145402, 3.516798, 0, 0.3529412, 1, 1,
0.2749617, 1.237236, -0.6094496, 0, 0.345098, 1, 1,
0.276865, -0.5364788, 3.123248, 0, 0.3411765, 1, 1,
0.2781902, -1.418352, 4.958083, 0, 0.3333333, 1, 1,
0.2819515, 0.3167589, 1.475897, 0, 0.3294118, 1, 1,
0.2846721, 0.2758231, 0.3260133, 0, 0.3215686, 1, 1,
0.2854806, -1.983459, 2.081248, 0, 0.3176471, 1, 1,
0.2883237, 0.5415339, 0.7428034, 0, 0.3098039, 1, 1,
0.2946822, 0.599735, 1.547634, 0, 0.3058824, 1, 1,
0.3027301, 0.640231, -0.3613641, 0, 0.2980392, 1, 1,
0.3056516, 0.9545962, 0.2944672, 0, 0.2901961, 1, 1,
0.3067894, 0.1606025, 0.9232967, 0, 0.2862745, 1, 1,
0.3078471, -0.1098707, 0.7224555, 0, 0.2784314, 1, 1,
0.3122377, -0.3167968, 2.964712, 0, 0.2745098, 1, 1,
0.3123013, -0.946507, 4.519166, 0, 0.2666667, 1, 1,
0.3184812, -0.00401198, 2.177768, 0, 0.2627451, 1, 1,
0.3184955, 0.352546, -0.8295191, 0, 0.254902, 1, 1,
0.3211233, 0.4464226, 2.334206, 0, 0.2509804, 1, 1,
0.323912, 0.6451188, 2.176357, 0, 0.2431373, 1, 1,
0.3244935, 0.1405396, 0.7412177, 0, 0.2392157, 1, 1,
0.3264447, -1.516913, 4.435298, 0, 0.2313726, 1, 1,
0.335828, 1.40509, 0.1712371, 0, 0.227451, 1, 1,
0.3378591, 0.6515487, 1.387888, 0, 0.2196078, 1, 1,
0.3403162, 1.767811, 1.286809, 0, 0.2156863, 1, 1,
0.3458696, -0.5111871, 3.913863, 0, 0.2078431, 1, 1,
0.3485535, 0.5273684, -0.1419002, 0, 0.2039216, 1, 1,
0.3529706, 0.1355462, 2.272796, 0, 0.1960784, 1, 1,
0.3554076, -0.5137416, 1.742612, 0, 0.1882353, 1, 1,
0.3564258, -0.4712094, 0.6630601, 0, 0.1843137, 1, 1,
0.3595993, 1.44037, 0.4036288, 0, 0.1764706, 1, 1,
0.3634725, 0.6691073, -0.5537978, 0, 0.172549, 1, 1,
0.3692099, 0.9448017, -0.3507531, 0, 0.1647059, 1, 1,
0.3735037, -1.883601, 2.251269, 0, 0.1607843, 1, 1,
0.3757001, 1.034185, 1.051938, 0, 0.1529412, 1, 1,
0.3765335, 1.34878, 0.03273429, 0, 0.1490196, 1, 1,
0.3768591, -0.9151589, 2.156492, 0, 0.1411765, 1, 1,
0.3775994, 0.1505153, 0.9932841, 0, 0.1372549, 1, 1,
0.3785699, 1.110602, 0.01549528, 0, 0.1294118, 1, 1,
0.3785849, -0.6741828, 2.204596, 0, 0.1254902, 1, 1,
0.3793434, 0.2198401, 1.939276, 0, 0.1176471, 1, 1,
0.3859675, 0.2674645, 1.057331, 0, 0.1137255, 1, 1,
0.3861631, 1.092025, 0.2202363, 0, 0.1058824, 1, 1,
0.3863487, -0.9289851, 3.492299, 0, 0.09803922, 1, 1,
0.3925514, 0.7971591, 0.1360472, 0, 0.09411765, 1, 1,
0.3926803, 0.6707179, 0.6002917, 0, 0.08627451, 1, 1,
0.4009212, -0.2585417, 1.427969, 0, 0.08235294, 1, 1,
0.4032001, -2.09524, 3.94492, 0, 0.07450981, 1, 1,
0.4050193, 0.8987743, 1.258656, 0, 0.07058824, 1, 1,
0.4063028, 0.524444, 0.5795098, 0, 0.0627451, 1, 1,
0.407644, -0.9723268, 1.919693, 0, 0.05882353, 1, 1,
0.4083695, 0.7068551, 0.9076144, 0, 0.05098039, 1, 1,
0.4088984, 0.43267, 0.1238163, 0, 0.04705882, 1, 1,
0.4091205, -0.4052671, 3.303465, 0, 0.03921569, 1, 1,
0.4097708, 1.356143, -0.6037639, 0, 0.03529412, 1, 1,
0.4113811, 0.4341626, 0.9606963, 0, 0.02745098, 1, 1,
0.4120175, 0.08241734, 0.524231, 0, 0.02352941, 1, 1,
0.4141428, 0.491904, 0.9626259, 0, 0.01568628, 1, 1,
0.4160809, -1.070094, 2.121384, 0, 0.01176471, 1, 1,
0.4165486, -0.5510565, 2.717318, 0, 0.003921569, 1, 1,
0.4195461, 0.8837977, -0.3672584, 0.003921569, 0, 1, 1,
0.4214799, -1.179982, 3.712102, 0.007843138, 0, 1, 1,
0.422982, -1.056131, 4.389086, 0.01568628, 0, 1, 1,
0.4274134, -0.836463, 2.411089, 0.01960784, 0, 1, 1,
0.4308682, 0.8862303, -0.5496373, 0.02745098, 0, 1, 1,
0.4316055, -0.965631, 3.278412, 0.03137255, 0, 1, 1,
0.4362252, 0.3244594, -0.8896031, 0.03921569, 0, 1, 1,
0.4436884, -1.51667, 3.602154, 0.04313726, 0, 1, 1,
0.4450138, -0.7334289, 2.768022, 0.05098039, 0, 1, 1,
0.4495002, 1.229774, 1.235977, 0.05490196, 0, 1, 1,
0.4508946, -1.714359, 4.020623, 0.0627451, 0, 1, 1,
0.4525603, -1.087171, 3.098626, 0.06666667, 0, 1, 1,
0.4534876, 1.171277, -0.7327033, 0.07450981, 0, 1, 1,
0.4547372, -0.2538326, 1.613575, 0.07843138, 0, 1, 1,
0.4555723, -0.9564397, 1.437451, 0.08627451, 0, 1, 1,
0.4580345, 0.8246514, 0.2104832, 0.09019608, 0, 1, 1,
0.4630376, 0.2148794, -0.8846784, 0.09803922, 0, 1, 1,
0.4630958, 0.09316318, 0.2642667, 0.1058824, 0, 1, 1,
0.4707918, 1.47633, 0.7770528, 0.1098039, 0, 1, 1,
0.4724573, 0.4737337, 0.09785197, 0.1176471, 0, 1, 1,
0.4726481, -0.2466038, 0.9372966, 0.1215686, 0, 1, 1,
0.4762738, 2.175318, -0.5459916, 0.1294118, 0, 1, 1,
0.4789618, 0.167567, 1.041246, 0.1333333, 0, 1, 1,
0.4797191, -0.6529524, 2.157699, 0.1411765, 0, 1, 1,
0.4830007, -0.1882459, 2.527128, 0.145098, 0, 1, 1,
0.4840139, 0.2590255, 0.03836246, 0.1529412, 0, 1, 1,
0.4865876, 1.34789, -0.5518662, 0.1568628, 0, 1, 1,
0.4872385, -0.3450219, 3.009457, 0.1647059, 0, 1, 1,
0.4942116, 1.554409, -0.08232709, 0.1686275, 0, 1, 1,
0.4943586, -0.1181887, 1.694646, 0.1764706, 0, 1, 1,
0.4978099, 0.2591428, 1.57823, 0.1803922, 0, 1, 1,
0.5045311, -0.3431092, 2.947705, 0.1882353, 0, 1, 1,
0.5145476, 0.5023816, 0.2255758, 0.1921569, 0, 1, 1,
0.5163575, 1.428806, 0.5548833, 0.2, 0, 1, 1,
0.5183958, 0.2694546, -0.4009729, 0.2078431, 0, 1, 1,
0.5219709, 0.288674, 1.429417, 0.2117647, 0, 1, 1,
0.5274302, 1.146413, 0.422971, 0.2196078, 0, 1, 1,
0.5305779, 0.07184496, -0.3220523, 0.2235294, 0, 1, 1,
0.5333742, -0.1085081, -0.08500631, 0.2313726, 0, 1, 1,
0.5338641, 0.6151795, -0.6928223, 0.2352941, 0, 1, 1,
0.537051, -0.7367302, 3.697709, 0.2431373, 0, 1, 1,
0.5396585, 0.3153326, 1.942582, 0.2470588, 0, 1, 1,
0.5454496, 0.2036356, 0.6765118, 0.254902, 0, 1, 1,
0.5474768, 2.517417, -1.122643, 0.2588235, 0, 1, 1,
0.5485744, 0.6235318, -1.336648, 0.2666667, 0, 1, 1,
0.5517295, 0.4776411, 1.440921, 0.2705882, 0, 1, 1,
0.5535033, 2.46652, 0.1125896, 0.2784314, 0, 1, 1,
0.5568935, -1.336165, 1.503029, 0.282353, 0, 1, 1,
0.5585481, -0.3937953, 2.383324, 0.2901961, 0, 1, 1,
0.5689356, 0.3289281, 1.879632, 0.2941177, 0, 1, 1,
0.5694104, -0.7100934, 2.230672, 0.3019608, 0, 1, 1,
0.5696473, -0.7935142, 1.772011, 0.3098039, 0, 1, 1,
0.5711871, -0.7430321, 2.08644, 0.3137255, 0, 1, 1,
0.571786, -0.44794, 2.758975, 0.3215686, 0, 1, 1,
0.5743237, -0.7570756, 1.567704, 0.3254902, 0, 1, 1,
0.5816107, 0.9277163, -0.1923622, 0.3333333, 0, 1, 1,
0.5818738, -0.522327, 0.389946, 0.3372549, 0, 1, 1,
0.5837241, -0.327193, 2.548325, 0.345098, 0, 1, 1,
0.5856411, -0.4722419, 0.7954092, 0.3490196, 0, 1, 1,
0.5906411, 0.9705315, 1.726863, 0.3568628, 0, 1, 1,
0.5937504, -0.1345108, 1.577034, 0.3607843, 0, 1, 1,
0.593837, -0.4459537, 4.79187, 0.3686275, 0, 1, 1,
0.5965144, 1.626859, -0.07971324, 0.372549, 0, 1, 1,
0.5974899, 0.02823411, 1.5209, 0.3803922, 0, 1, 1,
0.5987512, -1.386098, 2.963083, 0.3843137, 0, 1, 1,
0.5987561, -0.6200318, 2.812966, 0.3921569, 0, 1, 1,
0.6073781, -0.469173, 2.752606, 0.3960784, 0, 1, 1,
0.6077445, -0.4753394, 1.379909, 0.4039216, 0, 1, 1,
0.6134383, 0.3085126, -0.667043, 0.4117647, 0, 1, 1,
0.6144573, -0.9344977, 3.294617, 0.4156863, 0, 1, 1,
0.6164525, -0.8533765, 2.043903, 0.4235294, 0, 1, 1,
0.6185738, 0.7106636, 0.226687, 0.427451, 0, 1, 1,
0.6202155, -0.7321862, 2.522915, 0.4352941, 0, 1, 1,
0.6253754, -0.1856268, 1.610705, 0.4392157, 0, 1, 1,
0.6272434, -0.5185191, 1.060237, 0.4470588, 0, 1, 1,
0.634314, -0.02723623, -0.2740382, 0.4509804, 0, 1, 1,
0.6364198, 0.8035542, 0.4072686, 0.4588235, 0, 1, 1,
0.6480296, 0.6657757, -0.6511295, 0.4627451, 0, 1, 1,
0.6483319, -0.8353925, 1.943573, 0.4705882, 0, 1, 1,
0.6520492, -1.745449, 2.042039, 0.4745098, 0, 1, 1,
0.657223, 1.101388, 2.413659, 0.4823529, 0, 1, 1,
0.6653758, -1.687347, 2.254894, 0.4862745, 0, 1, 1,
0.667363, -0.2495587, 1.16333, 0.4941176, 0, 1, 1,
0.6742137, 0.5778317, 0.05789921, 0.5019608, 0, 1, 1,
0.6777343, -0.6203244, 1.579324, 0.5058824, 0, 1, 1,
0.6785175, -0.1947508, 3.224817, 0.5137255, 0, 1, 1,
0.6837379, -0.1481799, 1.869717, 0.5176471, 0, 1, 1,
0.6843559, -0.4890204, 0.6110432, 0.5254902, 0, 1, 1,
0.6865364, 0.1492354, 2.423182, 0.5294118, 0, 1, 1,
0.6876779, 0.2840295, 2.844997, 0.5372549, 0, 1, 1,
0.6880044, 0.5537657, 1.430492, 0.5411765, 0, 1, 1,
0.6909618, 0.4020959, 2.241831, 0.5490196, 0, 1, 1,
0.6952643, 0.9586363, 1.738073, 0.5529412, 0, 1, 1,
0.7002484, -1.131496, 2.565652, 0.5607843, 0, 1, 1,
0.7027205, -1.459325, 1.48445, 0.5647059, 0, 1, 1,
0.7091343, -0.502821, 1.286734, 0.572549, 0, 1, 1,
0.7110106, 0.221933, 0.2047387, 0.5764706, 0, 1, 1,
0.7129098, -1.121428, 3.750143, 0.5843138, 0, 1, 1,
0.7241772, -0.7439269, 1.696827, 0.5882353, 0, 1, 1,
0.7244702, 1.729305, 0.8225222, 0.5960785, 0, 1, 1,
0.7285566, -0.7010621, 2.1075, 0.6039216, 0, 1, 1,
0.730993, 1.715861, -0.6185962, 0.6078432, 0, 1, 1,
0.7323043, 0.2824679, 1.915958, 0.6156863, 0, 1, 1,
0.732486, -1.349738, 1.526866, 0.6196079, 0, 1, 1,
0.7388184, 0.2273049, 0.5819936, 0.627451, 0, 1, 1,
0.7396597, -1.086386, 3.104478, 0.6313726, 0, 1, 1,
0.7417238, 0.1380713, 1.317548, 0.6392157, 0, 1, 1,
0.741903, 0.1396216, 1.032647, 0.6431373, 0, 1, 1,
0.749334, 1.033375, 0.7302811, 0.6509804, 0, 1, 1,
0.7655456, 0.771821, 0.4122786, 0.654902, 0, 1, 1,
0.7674233, -1.470359, 1.610773, 0.6627451, 0, 1, 1,
0.7679448, -0.582619, 1.710028, 0.6666667, 0, 1, 1,
0.7739502, -0.2830468, 3.180154, 0.6745098, 0, 1, 1,
0.7774258, -1.203956, 3.847678, 0.6784314, 0, 1, 1,
0.7818735, 0.6273045, 1.799047, 0.6862745, 0, 1, 1,
0.7819012, 1.346252, -0.7510973, 0.6901961, 0, 1, 1,
0.7833509, -0.3786994, 3.59757, 0.6980392, 0, 1, 1,
0.7944493, 1.502165, -0.8894082, 0.7058824, 0, 1, 1,
0.7964163, -1.667232, 1.550585, 0.7098039, 0, 1, 1,
0.7973099, -1.243211, 2.147403, 0.7176471, 0, 1, 1,
0.8078554, 1.242674, 1.704377, 0.7215686, 0, 1, 1,
0.8086572, 0.1074807, 1.718869, 0.7294118, 0, 1, 1,
0.8099244, -0.8133472, 2.213415, 0.7333333, 0, 1, 1,
0.8104235, -0.9923758, 3.69309, 0.7411765, 0, 1, 1,
0.8125332, -0.1166531, 2.361951, 0.7450981, 0, 1, 1,
0.8136696, -0.0563758, 3.07529, 0.7529412, 0, 1, 1,
0.8144103, 1.447814, 1.060694, 0.7568628, 0, 1, 1,
0.818795, -0.09993745, 2.030391, 0.7647059, 0, 1, 1,
0.8203743, 0.5130754, 0.7091756, 0.7686275, 0, 1, 1,
0.8208519, -0.690672, 1.053252, 0.7764706, 0, 1, 1,
0.8213118, 0.7256277, 1.216423, 0.7803922, 0, 1, 1,
0.8239745, 0.9334526, -0.02169971, 0.7882353, 0, 1, 1,
0.824048, -1.049255, 2.544014, 0.7921569, 0, 1, 1,
0.8290717, -0.3424785, 2.444255, 0.8, 0, 1, 1,
0.8364568, 1.759588, -0.4956324, 0.8078431, 0, 1, 1,
0.8382072, 0.3187705, -0.02110782, 0.8117647, 0, 1, 1,
0.8442411, -0.9864321, 3.15559, 0.8196079, 0, 1, 1,
0.8517581, -0.5060155, 0.9557727, 0.8235294, 0, 1, 1,
0.8533067, -1.666415, 3.271605, 0.8313726, 0, 1, 1,
0.8642087, 0.04297679, 2.186149, 0.8352941, 0, 1, 1,
0.8650655, -0.1267983, 3.113221, 0.8431373, 0, 1, 1,
0.8677617, 0.1092794, 3.556229, 0.8470588, 0, 1, 1,
0.8710005, 0.5004455, 0.1842209, 0.854902, 0, 1, 1,
0.8787923, 0.1801074, 3.228682, 0.8588235, 0, 1, 1,
0.8819271, 3.276016, -0.1902983, 0.8666667, 0, 1, 1,
0.8865713, -2.091302, 1.194808, 0.8705882, 0, 1, 1,
0.8870077, 0.174496, 1.315651, 0.8784314, 0, 1, 1,
0.890521, -0.06422735, 3.919669, 0.8823529, 0, 1, 1,
0.8913977, -0.7719732, 2.447416, 0.8901961, 0, 1, 1,
0.8986279, -0.6263145, 0.9365435, 0.8941177, 0, 1, 1,
0.8992755, 0.4547351, 3.679779, 0.9019608, 0, 1, 1,
0.9011567, -0.2459943, 1.925382, 0.9098039, 0, 1, 1,
0.9051445, -0.600372, 1.833802, 0.9137255, 0, 1, 1,
0.9054269, -1.773215, 2.955745, 0.9215686, 0, 1, 1,
0.9094334, -0.5791913, 1.589542, 0.9254902, 0, 1, 1,
0.9217936, 0.7431033, -1.222692, 0.9333333, 0, 1, 1,
0.9325897, 0.797688, -0.2788198, 0.9372549, 0, 1, 1,
0.9337023, -0.1908916, 1.815178, 0.945098, 0, 1, 1,
0.93648, 1.087868, 0.2184853, 0.9490196, 0, 1, 1,
0.9470413, 0.5656401, 0.8057145, 0.9568627, 0, 1, 1,
0.9532243, -1.446105, 3.661922, 0.9607843, 0, 1, 1,
0.9534566, 0.0907373, 1.060113, 0.9686275, 0, 1, 1,
0.9591659, -0.863561, 2.442191, 0.972549, 0, 1, 1,
0.9664496, 0.01428165, 2.388292, 0.9803922, 0, 1, 1,
0.9724377, 0.773555, 1.369093, 0.9843137, 0, 1, 1,
0.9735587, -0.1343092, 1.297837, 0.9921569, 0, 1, 1,
0.980538, -1.878814, 2.553926, 0.9960784, 0, 1, 1,
0.9824063, -0.3272519, 0.3008422, 1, 0, 0.9960784, 1,
0.9888226, -0.06739423, 1.86368, 1, 0, 0.9882353, 1,
0.9949892, 0.1014635, 0.3712054, 1, 0, 0.9843137, 1,
0.9981503, 0.7196058, 1.052007, 1, 0, 0.9764706, 1,
0.9983972, 1.358371, 0.9054882, 1, 0, 0.972549, 1,
1.001429, -0.2484794, 3.265268, 1, 0, 0.9647059, 1,
1.004276, 0.4404878, 0.2199069, 1, 0, 0.9607843, 1,
1.00525, 0.8641462, 0.9815683, 1, 0, 0.9529412, 1,
1.009284, 0.8324273, 1.444437, 1, 0, 0.9490196, 1,
1.016075, 0.6753099, 3.610532, 1, 0, 0.9411765, 1,
1.017377, -1.353468, 1.70073, 1, 0, 0.9372549, 1,
1.0179, 0.009708335, 2.380567, 1, 0, 0.9294118, 1,
1.018394, -1.293908, 1.127286, 1, 0, 0.9254902, 1,
1.018815, 0.3916333, 2.298477, 1, 0, 0.9176471, 1,
1.022377, 0.5594894, 0.8677939, 1, 0, 0.9137255, 1,
1.024645, -0.450532, 2.792497, 1, 0, 0.9058824, 1,
1.027776, -1.254769, 0.5490413, 1, 0, 0.9019608, 1,
1.028089, 0.6030455, 0.2179599, 1, 0, 0.8941177, 1,
1.031739, -0.7349483, 1.219815, 1, 0, 0.8862745, 1,
1.035435, -0.4831049, 1.907217, 1, 0, 0.8823529, 1,
1.046054, -0.5634053, 3.422981, 1, 0, 0.8745098, 1,
1.049611, -0.7917522, 2.745059, 1, 0, 0.8705882, 1,
1.053156, 0.07446913, 2.066471, 1, 0, 0.8627451, 1,
1.053173, 0.3666217, 2.20514, 1, 0, 0.8588235, 1,
1.054077, -1.765392, 2.554689, 1, 0, 0.8509804, 1,
1.055168, -0.4498331, 1.751681, 1, 0, 0.8470588, 1,
1.066913, 0.7886021, -0.1188433, 1, 0, 0.8392157, 1,
1.067993, 0.02573833, 2.134522, 1, 0, 0.8352941, 1,
1.073474, 0.3877539, 2.255374, 1, 0, 0.827451, 1,
1.074931, 0.2402354, 1.536731, 1, 0, 0.8235294, 1,
1.086892, 0.5802518, 2.754239, 1, 0, 0.8156863, 1,
1.094724, -0.4673184, 2.981507, 1, 0, 0.8117647, 1,
1.09483, -2.870617, 3.659672, 1, 0, 0.8039216, 1,
1.097115, -0.7611113, 3.339569, 1, 0, 0.7960784, 1,
1.110855, -0.4502125, 2.526897, 1, 0, 0.7921569, 1,
1.113785, -0.5909024, 1.277183, 1, 0, 0.7843137, 1,
1.114457, -0.2558225, -1.24393, 1, 0, 0.7803922, 1,
1.117242, 0.0477954, 0.05191098, 1, 0, 0.772549, 1,
1.119984, 0.2204926, 3.267795, 1, 0, 0.7686275, 1,
1.120817, 0.5682268, 1.628263, 1, 0, 0.7607843, 1,
1.132809, 0.1395218, 1.15258, 1, 0, 0.7568628, 1,
1.13636, 0.7609726, 2.404566, 1, 0, 0.7490196, 1,
1.139576, 0.2830482, 0.2067001, 1, 0, 0.7450981, 1,
1.140934, 0.1992287, 1.743873, 1, 0, 0.7372549, 1,
1.141828, 0.5780952, 2.357224, 1, 0, 0.7333333, 1,
1.150288, -1.546821, 1.990454, 1, 0, 0.7254902, 1,
1.150974, -1.226587, 2.750924, 1, 0, 0.7215686, 1,
1.153306, 1.045994, -1.840117, 1, 0, 0.7137255, 1,
1.168715, 0.4018809, 3.14277, 1, 0, 0.7098039, 1,
1.182008, 0.5428682, 0.8401061, 1, 0, 0.7019608, 1,
1.185779, -0.5907285, 3.282057, 1, 0, 0.6941177, 1,
1.189291, 0.05972437, 0.7948421, 1, 0, 0.6901961, 1,
1.19461, 0.4775749, 0.463811, 1, 0, 0.682353, 1,
1.196993, -0.05204827, 2.592969, 1, 0, 0.6784314, 1,
1.200038, -0.7864075, 1.501683, 1, 0, 0.6705883, 1,
1.203489, -0.7726061, 2.222663, 1, 0, 0.6666667, 1,
1.204524, 0.1542787, 0.3390281, 1, 0, 0.6588235, 1,
1.206098, -0.9448735, 4.153875, 1, 0, 0.654902, 1,
1.207061, 0.4338964, 0.7783393, 1, 0, 0.6470588, 1,
1.227332, 0.3997583, 0.6892927, 1, 0, 0.6431373, 1,
1.23227, 2.05578, 0.6540086, 1, 0, 0.6352941, 1,
1.23304, 0.9958344, 1.607838, 1, 0, 0.6313726, 1,
1.242891, -1.159351, 2.356448, 1, 0, 0.6235294, 1,
1.245906, 0.03866611, 2.833277, 1, 0, 0.6196079, 1,
1.246781, 0.6857241, -0.1677049, 1, 0, 0.6117647, 1,
1.254315, 0.5173212, -0.02168373, 1, 0, 0.6078432, 1,
1.254821, -0.3105244, 1.876985, 1, 0, 0.6, 1,
1.258913, -0.07053862, 1.415345, 1, 0, 0.5921569, 1,
1.265099, -1.383791, 2.508151, 1, 0, 0.5882353, 1,
1.274194, 0.8656319, -0.2253085, 1, 0, 0.5803922, 1,
1.285192, -0.1265346, 1.588614, 1, 0, 0.5764706, 1,
1.287439, 1.035083, 0.3398225, 1, 0, 0.5686275, 1,
1.297763, 1.224417, 2.936916, 1, 0, 0.5647059, 1,
1.306522, 0.2273083, -0.5941797, 1, 0, 0.5568628, 1,
1.314616, 0.6482182, 0.6385547, 1, 0, 0.5529412, 1,
1.333762, 0.6202561, 0.5977128, 1, 0, 0.5450981, 1,
1.334787, -0.731424, 1.144892, 1, 0, 0.5411765, 1,
1.33919, -1.640152, 3.002252, 1, 0, 0.5333334, 1,
1.345236, 0.2028624, 3.109529, 1, 0, 0.5294118, 1,
1.347322, 1.483263, 1.566132, 1, 0, 0.5215687, 1,
1.347476, 0.1085797, 2.367683, 1, 0, 0.5176471, 1,
1.34772, -0.3192945, 3.60376, 1, 0, 0.509804, 1,
1.349577, -0.4269312, 3.487042, 1, 0, 0.5058824, 1,
1.361792, -0.1466374, 0.476652, 1, 0, 0.4980392, 1,
1.368215, -2.064115, 1.349234, 1, 0, 0.4901961, 1,
1.374489, 1.148661, 3.258704, 1, 0, 0.4862745, 1,
1.377494, 0.03843004, 2.24642, 1, 0, 0.4784314, 1,
1.380646, -0.0107546, 0.8283868, 1, 0, 0.4745098, 1,
1.383598, -0.8876534, 1.05447, 1, 0, 0.4666667, 1,
1.389373, 0.252076, -0.3711908, 1, 0, 0.4627451, 1,
1.397858, -0.2256513, 3.098865, 1, 0, 0.454902, 1,
1.41956, -2.875594, 2.748494, 1, 0, 0.4509804, 1,
1.427938, 0.7413443, 1.584305, 1, 0, 0.4431373, 1,
1.434244, -1.30268, 3.232236, 1, 0, 0.4392157, 1,
1.436453, 2.286053, 1.472883, 1, 0, 0.4313726, 1,
1.452446, -0.4513654, 1.703363, 1, 0, 0.427451, 1,
1.454801, -0.2858488, 0.289657, 1, 0, 0.4196078, 1,
1.463618, 0.304948, 2.197312, 1, 0, 0.4156863, 1,
1.464291, 0.1949612, 1.317253, 1, 0, 0.4078431, 1,
1.483173, 0.1203979, 2.065064, 1, 0, 0.4039216, 1,
1.498407, -1.363619, 2.328148, 1, 0, 0.3960784, 1,
1.528479, -0.04598427, 2.482701, 1, 0, 0.3882353, 1,
1.5406, -2.889796, 3.903003, 1, 0, 0.3843137, 1,
1.541977, 2.504693, 0.6739058, 1, 0, 0.3764706, 1,
1.544057, -0.8827948, 2.64657, 1, 0, 0.372549, 1,
1.556611, -0.7540835, 1.056633, 1, 0, 0.3647059, 1,
1.566003, -0.8546283, 3.007811, 1, 0, 0.3607843, 1,
1.584666, 0.8183693, 0.4241022, 1, 0, 0.3529412, 1,
1.58759, -0.4134101, 2.116981, 1, 0, 0.3490196, 1,
1.601576, 0.1020778, -0.1369644, 1, 0, 0.3411765, 1,
1.602133, 0.0005640519, 1.62794, 1, 0, 0.3372549, 1,
1.618929, 0.2797755, -0.8452526, 1, 0, 0.3294118, 1,
1.624778, 0.7184982, 0.6662867, 1, 0, 0.3254902, 1,
1.625304, -1.940145, 2.134613, 1, 0, 0.3176471, 1,
1.629764, -1.656096, 3.036726, 1, 0, 0.3137255, 1,
1.633134, 0.002321309, 1.103813, 1, 0, 0.3058824, 1,
1.637273, 1.635966, 2.222133, 1, 0, 0.2980392, 1,
1.641918, 1.140682, 1.772544, 1, 0, 0.2941177, 1,
1.647696, -0.09001575, 2.004595, 1, 0, 0.2862745, 1,
1.663317, -1.515143, 2.420892, 1, 0, 0.282353, 1,
1.665439, 0.2715033, 0.8062314, 1, 0, 0.2745098, 1,
1.680339, -1.159684, 2.9784, 1, 0, 0.2705882, 1,
1.694352, -0.4354356, 1.428492, 1, 0, 0.2627451, 1,
1.707335, 0.08545247, 0.180407, 1, 0, 0.2588235, 1,
1.712013, 1.495806, 0.2805945, 1, 0, 0.2509804, 1,
1.716737, 0.6587781, 2.530166, 1, 0, 0.2470588, 1,
1.720905, 0.7249413, 1.296228, 1, 0, 0.2392157, 1,
1.736131, 0.5090041, 0.5671408, 1, 0, 0.2352941, 1,
1.753551, 0.9236409, 1.176492, 1, 0, 0.227451, 1,
1.765077, -1.06934, 3.497498, 1, 0, 0.2235294, 1,
1.777787, 0.1068394, -0.1704794, 1, 0, 0.2156863, 1,
1.792404, 0.3052503, 1.467909, 1, 0, 0.2117647, 1,
1.795951, 1.117564, 2.302008, 1, 0, 0.2039216, 1,
1.825179, -0.2069285, 1.140007, 1, 0, 0.1960784, 1,
1.841228, -0.3448636, 1.45341, 1, 0, 0.1921569, 1,
1.869343, -0.2988242, 1.991543, 1, 0, 0.1843137, 1,
1.873288, -0.4935713, 1.851453, 1, 0, 0.1803922, 1,
1.874294, 0.04613973, 2.153018, 1, 0, 0.172549, 1,
1.882667, -1.499644, 2.379583, 1, 0, 0.1686275, 1,
1.907601, 0.7282814, 1.187042, 1, 0, 0.1607843, 1,
1.918642, -1.104676, 2.539266, 1, 0, 0.1568628, 1,
1.919351, -1.859096, 2.756073, 1, 0, 0.1490196, 1,
1.936935, 0.3344739, -0.1429133, 1, 0, 0.145098, 1,
1.984323, -0.4924143, 0.6801671, 1, 0, 0.1372549, 1,
2.046905, 0.2014278, 1.800805, 1, 0, 0.1333333, 1,
2.049509, -0.7181814, 2.580145, 1, 0, 0.1254902, 1,
2.057573, -0.4581406, 1.90043, 1, 0, 0.1215686, 1,
2.098884, -0.2371786, 3.012764, 1, 0, 0.1137255, 1,
2.102018, -0.846321, 2.15318, 1, 0, 0.1098039, 1,
2.110726, 0.6690878, 1.396795, 1, 0, 0.1019608, 1,
2.116725, 1.029977, 1.85783, 1, 0, 0.09411765, 1,
2.153887, -0.2314737, -0.2221678, 1, 0, 0.09019608, 1,
2.216612, -0.3052136, 1.881942, 1, 0, 0.08235294, 1,
2.217528, 0.8621573, 1.881652, 1, 0, 0.07843138, 1,
2.298687, 0.3501563, 1.824292, 1, 0, 0.07058824, 1,
2.32059, -0.7604306, 1.098023, 1, 0, 0.06666667, 1,
2.321698, -1.305189, 2.193838, 1, 0, 0.05882353, 1,
2.347883, 0.4902542, 0.7780303, 1, 0, 0.05490196, 1,
2.354569, -1.86009, 0.3411711, 1, 0, 0.04705882, 1,
2.403811, 1.719272, -0.3830862, 1, 0, 0.04313726, 1,
2.451138, 0.2956589, 0.1819888, 1, 0, 0.03529412, 1,
2.521417, -0.7177124, 3.409344, 1, 0, 0.03137255, 1,
2.557408, 0.5638781, 1.907239, 1, 0, 0.02352941, 1,
2.597262, 0.4295473, -0.5063823, 1, 0, 0.01960784, 1,
2.849159, -1.937767, 1.850775, 1, 0, 0.01176471, 1,
3.192729, 1.05636, 2.961894, 1, 0, 0.007843138, 1
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
-0.111267, -5.493657, -7.634273, 0, -0.5, 0.5, 0.5,
-0.111267, -5.493657, -7.634273, 1, -0.5, 0.5, 0.5,
-0.111267, -5.493657, -7.634273, 1, 1.5, 0.5, 0.5,
-0.111267, -5.493657, -7.634273, 0, 1.5, 0.5, 0.5
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
-4.535318, -0.4733101, -7.634273, 0, -0.5, 0.5, 0.5,
-4.535318, -0.4733101, -7.634273, 1, -0.5, 0.5, 0.5,
-4.535318, -0.4733101, -7.634273, 1, 1.5, 0.5, 0.5,
-4.535318, -0.4733101, -7.634273, 0, 1.5, 0.5, 0.5
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
-4.535318, -5.493657, -0.4255667, 0, -0.5, 0.5, 0.5,
-4.535318, -5.493657, -0.4255667, 1, -0.5, 0.5, 0.5,
-4.535318, -5.493657, -0.4255667, 1, 1.5, 0.5, 0.5,
-4.535318, -5.493657, -0.4255667, 0, 1.5, 0.5, 0.5
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
-3, -4.335115, -5.970726,
3, -4.335115, -5.970726,
-3, -4.335115, -5.970726,
-3, -4.528206, -6.247983,
-2, -4.335115, -5.970726,
-2, -4.528206, -6.247983,
-1, -4.335115, -5.970726,
-1, -4.528206, -6.247983,
0, -4.335115, -5.970726,
0, -4.528206, -6.247983,
1, -4.335115, -5.970726,
1, -4.528206, -6.247983,
2, -4.335115, -5.970726,
2, -4.528206, -6.247983,
3, -4.335115, -5.970726,
3, -4.528206, -6.247983
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
-3, -4.914386, -6.802499, 0, -0.5, 0.5, 0.5,
-3, -4.914386, -6.802499, 1, -0.5, 0.5, 0.5,
-3, -4.914386, -6.802499, 1, 1.5, 0.5, 0.5,
-3, -4.914386, -6.802499, 0, 1.5, 0.5, 0.5,
-2, -4.914386, -6.802499, 0, -0.5, 0.5, 0.5,
-2, -4.914386, -6.802499, 1, -0.5, 0.5, 0.5,
-2, -4.914386, -6.802499, 1, 1.5, 0.5, 0.5,
-2, -4.914386, -6.802499, 0, 1.5, 0.5, 0.5,
-1, -4.914386, -6.802499, 0, -0.5, 0.5, 0.5,
-1, -4.914386, -6.802499, 1, -0.5, 0.5, 0.5,
-1, -4.914386, -6.802499, 1, 1.5, 0.5, 0.5,
-1, -4.914386, -6.802499, 0, 1.5, 0.5, 0.5,
0, -4.914386, -6.802499, 0, -0.5, 0.5, 0.5,
0, -4.914386, -6.802499, 1, -0.5, 0.5, 0.5,
0, -4.914386, -6.802499, 1, 1.5, 0.5, 0.5,
0, -4.914386, -6.802499, 0, 1.5, 0.5, 0.5,
1, -4.914386, -6.802499, 0, -0.5, 0.5, 0.5,
1, -4.914386, -6.802499, 1, -0.5, 0.5, 0.5,
1, -4.914386, -6.802499, 1, 1.5, 0.5, 0.5,
1, -4.914386, -6.802499, 0, 1.5, 0.5, 0.5,
2, -4.914386, -6.802499, 0, -0.5, 0.5, 0.5,
2, -4.914386, -6.802499, 1, -0.5, 0.5, 0.5,
2, -4.914386, -6.802499, 1, 1.5, 0.5, 0.5,
2, -4.914386, -6.802499, 0, 1.5, 0.5, 0.5,
3, -4.914386, -6.802499, 0, -0.5, 0.5, 0.5,
3, -4.914386, -6.802499, 1, -0.5, 0.5, 0.5,
3, -4.914386, -6.802499, 1, 1.5, 0.5, 0.5,
3, -4.914386, -6.802499, 0, 1.5, 0.5, 0.5
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
-3.514383, -4, -5.970726,
-3.514383, 2, -5.970726,
-3.514383, -4, -5.970726,
-3.684539, -4, -6.247983,
-3.514383, -2, -5.970726,
-3.684539, -2, -6.247983,
-3.514383, 0, -5.970726,
-3.684539, 0, -6.247983,
-3.514383, 2, -5.970726,
-3.684539, 2, -6.247983
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
"-4",
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
-4.02485, -4, -6.802499, 0, -0.5, 0.5, 0.5,
-4.02485, -4, -6.802499, 1, -0.5, 0.5, 0.5,
-4.02485, -4, -6.802499, 1, 1.5, 0.5, 0.5,
-4.02485, -4, -6.802499, 0, 1.5, 0.5, 0.5,
-4.02485, -2, -6.802499, 0, -0.5, 0.5, 0.5,
-4.02485, -2, -6.802499, 1, -0.5, 0.5, 0.5,
-4.02485, -2, -6.802499, 1, 1.5, 0.5, 0.5,
-4.02485, -2, -6.802499, 0, 1.5, 0.5, 0.5,
-4.02485, 0, -6.802499, 0, -0.5, 0.5, 0.5,
-4.02485, 0, -6.802499, 1, -0.5, 0.5, 0.5,
-4.02485, 0, -6.802499, 1, 1.5, 0.5, 0.5,
-4.02485, 0, -6.802499, 0, 1.5, 0.5, 0.5,
-4.02485, 2, -6.802499, 0, -0.5, 0.5, 0.5,
-4.02485, 2, -6.802499, 1, -0.5, 0.5, 0.5,
-4.02485, 2, -6.802499, 1, 1.5, 0.5, 0.5,
-4.02485, 2, -6.802499, 0, 1.5, 0.5, 0.5
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
-3.514383, -4.335115, -4,
-3.514383, -4.335115, 4,
-3.514383, -4.335115, -4,
-3.684539, -4.528206, -4,
-3.514383, -4.335115, -2,
-3.684539, -4.528206, -2,
-3.514383, -4.335115, 0,
-3.684539, -4.528206, 0,
-3.514383, -4.335115, 2,
-3.684539, -4.528206, 2,
-3.514383, -4.335115, 4,
-3.684539, -4.528206, 4
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
-4.02485, -4.914386, -4, 0, -0.5, 0.5, 0.5,
-4.02485, -4.914386, -4, 1, -0.5, 0.5, 0.5,
-4.02485, -4.914386, -4, 1, 1.5, 0.5, 0.5,
-4.02485, -4.914386, -4, 0, 1.5, 0.5, 0.5,
-4.02485, -4.914386, -2, 0, -0.5, 0.5, 0.5,
-4.02485, -4.914386, -2, 1, -0.5, 0.5, 0.5,
-4.02485, -4.914386, -2, 1, 1.5, 0.5, 0.5,
-4.02485, -4.914386, -2, 0, 1.5, 0.5, 0.5,
-4.02485, -4.914386, 0, 0, -0.5, 0.5, 0.5,
-4.02485, -4.914386, 0, 1, -0.5, 0.5, 0.5,
-4.02485, -4.914386, 0, 1, 1.5, 0.5, 0.5,
-4.02485, -4.914386, 0, 0, 1.5, 0.5, 0.5,
-4.02485, -4.914386, 2, 0, -0.5, 0.5, 0.5,
-4.02485, -4.914386, 2, 1, -0.5, 0.5, 0.5,
-4.02485, -4.914386, 2, 1, 1.5, 0.5, 0.5,
-4.02485, -4.914386, 2, 0, 1.5, 0.5, 0.5,
-4.02485, -4.914386, 4, 0, -0.5, 0.5, 0.5,
-4.02485, -4.914386, 4, 1, -0.5, 0.5, 0.5,
-4.02485, -4.914386, 4, 1, 1.5, 0.5, 0.5,
-4.02485, -4.914386, 4, 0, 1.5, 0.5, 0.5
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
-3.514383, -4.335115, -5.970726,
-3.514383, 3.388495, -5.970726,
-3.514383, -4.335115, 5.119592,
-3.514383, 3.388495, 5.119592,
-3.514383, -4.335115, -5.970726,
-3.514383, -4.335115, 5.119592,
-3.514383, 3.388495, -5.970726,
-3.514383, 3.388495, 5.119592,
-3.514383, -4.335115, -5.970726,
3.291849, -4.335115, -5.970726,
-3.514383, -4.335115, 5.119592,
3.291849, -4.335115, 5.119592,
-3.514383, 3.388495, -5.970726,
3.291849, 3.388495, -5.970726,
-3.514383, 3.388495, 5.119592,
3.291849, 3.388495, 5.119592,
3.291849, -4.335115, -5.970726,
3.291849, 3.388495, -5.970726,
3.291849, -4.335115, 5.119592,
3.291849, 3.388495, 5.119592,
3.291849, -4.335115, -5.970726,
3.291849, -4.335115, 5.119592,
3.291849, 3.388495, -5.970726,
3.291849, 3.388495, 5.119592
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
var radius = 8.080136;
var distance = 35.94944;
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
mvMatrix.translate( 0.111267, 0.4733101, 0.4255667 );
mvMatrix.scale( 1.283588, 1.131129, 0.7877503 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.94944);
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
imidazole<-read.table("imidazole.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imidazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'imidazole' not found
```

```r
y<-imidazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'imidazole' not found
```

```r
z<-imidazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'imidazole' not found
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
-3.415263, 0.9547153, -2.037945, 0, 0, 1, 1, 1,
-3.3032, -0.9199115, -0.4383959, 1, 0, 0, 1, 1,
-2.764321, -0.7214707, -2.626833, 1, 0, 0, 1, 1,
-2.666699, -0.1516002, -0.2641741, 1, 0, 0, 1, 1,
-2.635195, 0.9261026, -0.8018801, 1, 0, 0, 1, 1,
-2.585016, 0.6398773, -2.56635, 1, 0, 0, 1, 1,
-2.55399, -0.3497234, -2.419333, 0, 0, 0, 1, 1,
-2.544658, -1.284224, -3.161427, 0, 0, 0, 1, 1,
-2.517027, -0.269005, -3.454252, 0, 0, 0, 1, 1,
-2.476416, -0.6079354, -1.33166, 0, 0, 0, 1, 1,
-2.31685, 0.1610159, -2.48649, 0, 0, 0, 1, 1,
-2.303652, -0.09220047, -2.658607, 0, 0, 0, 1, 1,
-2.2794, 0.004178659, -0.2285939, 0, 0, 0, 1, 1,
-2.27934, -0.01822579, 0.06000803, 1, 1, 1, 1, 1,
-2.249217, 1.257091, -2.113939, 1, 1, 1, 1, 1,
-2.248001, -0.08474121, -0.9197261, 1, 1, 1, 1, 1,
-2.187224, -1.088902, -2.617779, 1, 1, 1, 1, 1,
-2.177567, -0.4423909, -0.6999586, 1, 1, 1, 1, 1,
-2.168172, -1.68557, -3.315433, 1, 1, 1, 1, 1,
-2.14133, -0.8516645, -2.284966, 1, 1, 1, 1, 1,
-2.082946, -1.549421, -0.2174317, 1, 1, 1, 1, 1,
-2.061382, -0.09497548, -2.389406, 1, 1, 1, 1, 1,
-2.055146, -1.416031, -1.708438, 1, 1, 1, 1, 1,
-2.042708, -0.5481628, -3.032802, 1, 1, 1, 1, 1,
-2.040462, 1.7955, -1.080679, 1, 1, 1, 1, 1,
-2.035033, 0.4624, -2.126007, 1, 1, 1, 1, 1,
-1.972609, 0.07162764, -1.548117, 1, 1, 1, 1, 1,
-1.966475, -0.4453511, -2.922693, 1, 1, 1, 1, 1,
-1.944935, -0.4350757, -3.286138, 0, 0, 1, 1, 1,
-1.902557, -0.1988913, -3.59021, 1, 0, 0, 1, 1,
-1.850034, -0.9907928, -1.784221, 1, 0, 0, 1, 1,
-1.843198, -0.2414604, -2.559621, 1, 0, 0, 1, 1,
-1.82002, 1.204481, -1.853039, 1, 0, 0, 1, 1,
-1.818714, 0.7964973, -2.984805, 1, 0, 0, 1, 1,
-1.802272, 0.9192085, 0.4280583, 0, 0, 0, 1, 1,
-1.794779, -1.240461, -1.959, 0, 0, 0, 1, 1,
-1.784945, -0.9485909, -1.636749, 0, 0, 0, 1, 1,
-1.770433, 1.931631, -1.04005, 0, 0, 0, 1, 1,
-1.767988, 1.596863, -0.4941107, 0, 0, 0, 1, 1,
-1.748946, -2.469724, -2.822281, 0, 0, 0, 1, 1,
-1.748647, -0.9017124, -2.135689, 0, 0, 0, 1, 1,
-1.739215, 0.505576, -1.487861, 1, 1, 1, 1, 1,
-1.735606, -0.9621055, -0.8867015, 1, 1, 1, 1, 1,
-1.709591, 0.07447379, -2.700764, 1, 1, 1, 1, 1,
-1.697043, 0.2489782, -0.861765, 1, 1, 1, 1, 1,
-1.670937, -4.222636, -2.214014, 1, 1, 1, 1, 1,
-1.645006, -0.1890227, -2.200134, 1, 1, 1, 1, 1,
-1.631071, 0.6365615, -2.720059, 1, 1, 1, 1, 1,
-1.626611, 0.1496121, -1.69876, 1, 1, 1, 1, 1,
-1.625645, 0.577888, -3.039864, 1, 1, 1, 1, 1,
-1.616825, 1.114284, -0.3088188, 1, 1, 1, 1, 1,
-1.616702, -0.5359484, -1.495259, 1, 1, 1, 1, 1,
-1.615423, 0.09786388, -0.6623103, 1, 1, 1, 1, 1,
-1.612811, 1.322625, 0.8269012, 1, 1, 1, 1, 1,
-1.596946, 0.96201, 1.31809, 1, 1, 1, 1, 1,
-1.591011, -1.184551, 1.039139, 1, 1, 1, 1, 1,
-1.590189, 1.020393, -2.907374, 0, 0, 1, 1, 1,
-1.571412, -0.8626382, -1.67608, 1, 0, 0, 1, 1,
-1.544523, -2.303906, 0.4561284, 1, 0, 0, 1, 1,
-1.542658, -0.8037336, -1.125998, 1, 0, 0, 1, 1,
-1.538942, 0.7733139, -1.293642, 1, 0, 0, 1, 1,
-1.509942, -3.823173, -3.284687, 1, 0, 0, 1, 1,
-1.508213, 0.4093016, -1.355006, 0, 0, 0, 1, 1,
-1.507974, -1.364756, -2.100982, 0, 0, 0, 1, 1,
-1.507714, 1.163076, -2.105153, 0, 0, 0, 1, 1,
-1.504231, -0.8779826, -2.78065, 0, 0, 0, 1, 1,
-1.498931, -0.523587, -1.49551, 0, 0, 0, 1, 1,
-1.498376, 1.277387, -1.55728, 0, 0, 0, 1, 1,
-1.492542, -0.8081959, -1.604036, 0, 0, 0, 1, 1,
-1.49247, -0.2525888, -1.161827, 1, 1, 1, 1, 1,
-1.49216, -0.954738, -3.253505, 1, 1, 1, 1, 1,
-1.475071, 0.2484405, -1.190225, 1, 1, 1, 1, 1,
-1.458047, -0.1278309, -2.619487, 1, 1, 1, 1, 1,
-1.448478, 0.2754851, -1.058215, 1, 1, 1, 1, 1,
-1.418013, -0.02115231, -1.292949, 1, 1, 1, 1, 1,
-1.411836, -0.5680153, -1.595244, 1, 1, 1, 1, 1,
-1.411666, -0.4192743, -2.415901, 1, 1, 1, 1, 1,
-1.410944, 1.422951, -2.266988, 1, 1, 1, 1, 1,
-1.408181, -1.10051, -2.4631, 1, 1, 1, 1, 1,
-1.404589, -1.623616, -3.010758, 1, 1, 1, 1, 1,
-1.397069, -0.1202006, -2.485354, 1, 1, 1, 1, 1,
-1.396898, -1.145813, -1.950311, 1, 1, 1, 1, 1,
-1.396237, 1.106736, -1.659694, 1, 1, 1, 1, 1,
-1.378603, -1.56099, -4.01205, 1, 1, 1, 1, 1,
-1.367146, 0.7821658, -1.983874, 0, 0, 1, 1, 1,
-1.362746, -0.1928169, -1.326117, 1, 0, 0, 1, 1,
-1.36223, 1.147185, 0.2960696, 1, 0, 0, 1, 1,
-1.353525, 0.863357, -1.085613, 1, 0, 0, 1, 1,
-1.350273, -0.4561158, -1.777341, 1, 0, 0, 1, 1,
-1.34145, -1.120705, -0.5620777, 1, 0, 0, 1, 1,
-1.334841, 0.4559309, -0.7532234, 0, 0, 0, 1, 1,
-1.329492, -0.4085509, -2.020388, 0, 0, 0, 1, 1,
-1.328272, 0.5815139, -0.9321933, 0, 0, 0, 1, 1,
-1.325886, 1.486359, -0.5878906, 0, 0, 0, 1, 1,
-1.323933, 1.822117, 0.1967097, 0, 0, 0, 1, 1,
-1.320145, -0.7706623, -2.050795, 0, 0, 0, 1, 1,
-1.30289, 0.5298612, -0.5774069, 0, 0, 0, 1, 1,
-1.301551, -2.087384, -2.860329, 1, 1, 1, 1, 1,
-1.300652, -0.9408163, -2.496044, 1, 1, 1, 1, 1,
-1.294551, 0.9626575, -0.9031103, 1, 1, 1, 1, 1,
-1.292899, -0.6342288, -1.671323, 1, 1, 1, 1, 1,
-1.286478, 0.5111981, 0.8079832, 1, 1, 1, 1, 1,
-1.285899, -0.746687, -1.154246, 1, 1, 1, 1, 1,
-1.274465, 0.3266366, -2.550305, 1, 1, 1, 1, 1,
-1.270813, -1.236766, -1.728747, 1, 1, 1, 1, 1,
-1.266506, 0.3084647, 0.8597081, 1, 1, 1, 1, 1,
-1.257405, 1.13537, 0.5916913, 1, 1, 1, 1, 1,
-1.249313, 1.851818, 0.6204547, 1, 1, 1, 1, 1,
-1.245131, 0.8334399, -1.899265, 1, 1, 1, 1, 1,
-1.242696, 1.257941, -0.2705998, 1, 1, 1, 1, 1,
-1.237332, 0.9353436, -1.750695, 1, 1, 1, 1, 1,
-1.231799, -1.917738, -1.611368, 1, 1, 1, 1, 1,
-1.229996, -0.2684616, -1.3204, 0, 0, 1, 1, 1,
-1.228997, 0.2582393, -2.536472, 1, 0, 0, 1, 1,
-1.224898, -1.204427, -2.223717, 1, 0, 0, 1, 1,
-1.206604, -0.8254687, -1.967779, 1, 0, 0, 1, 1,
-1.197699, 1.722896, 1.711124, 1, 0, 0, 1, 1,
-1.192892, 1.087, -2.304582, 1, 0, 0, 1, 1,
-1.18477, -0.8540754, -1.709557, 0, 0, 0, 1, 1,
-1.182374, 0.1567994, -2.508113, 0, 0, 0, 1, 1,
-1.173457, -0.2373586, -0.8051535, 0, 0, 0, 1, 1,
-1.173021, -0.02152131, -3.443307, 0, 0, 0, 1, 1,
-1.172491, -0.2811708, -2.942244, 0, 0, 0, 1, 1,
-1.161687, 0.05476017, -0.1668672, 0, 0, 0, 1, 1,
-1.159187, -0.001569012, -2.29343, 0, 0, 0, 1, 1,
-1.156699, -0.9697527, -1.746348, 1, 1, 1, 1, 1,
-1.14773, -1.924094, -3.517221, 1, 1, 1, 1, 1,
-1.146725, 0.1974945, -1.252405, 1, 1, 1, 1, 1,
-1.142901, 0.2408473, -1.052243, 1, 1, 1, 1, 1,
-1.142629, -1.186717, -2.422377, 1, 1, 1, 1, 1,
-1.138404, 1.103737, -1.866177, 1, 1, 1, 1, 1,
-1.13532, 0.01762401, -2.053301, 1, 1, 1, 1, 1,
-1.132541, 0.4119978, -1.983217, 1, 1, 1, 1, 1,
-1.131339, 0.1757123, -1.50845, 1, 1, 1, 1, 1,
-1.129532, 0.2359841, -0.3090546, 1, 1, 1, 1, 1,
-1.128906, 0.2484076, -0.3939767, 1, 1, 1, 1, 1,
-1.128299, -1.54651, -3.224566, 1, 1, 1, 1, 1,
-1.127166, -2.143523, -2.690395, 1, 1, 1, 1, 1,
-1.122153, -0.3528957, -1.317455, 1, 1, 1, 1, 1,
-1.121263, 1.071024, -1.82071, 1, 1, 1, 1, 1,
-1.117712, 1.161117, -1.35808, 0, 0, 1, 1, 1,
-1.115308, -0.5602037, -2.821418, 1, 0, 0, 1, 1,
-1.115155, 0.4033156, -2.491965, 1, 0, 0, 1, 1,
-1.112273, -0.4610716, -1.802055, 1, 0, 0, 1, 1,
-1.112146, 0.7935238, 0.3144423, 1, 0, 0, 1, 1,
-1.107979, -0.6133485, -0.966345, 1, 0, 0, 1, 1,
-1.101874, -0.5939181, -2.400985, 0, 0, 0, 1, 1,
-1.101712, 3.13582, 0.4974567, 0, 0, 0, 1, 1,
-1.100051, -0.4239322, -0.7433143, 0, 0, 0, 1, 1,
-1.096215, 0.4586932, -0.7765203, 0, 0, 0, 1, 1,
-1.093679, 0.6435009, -0.5458256, 0, 0, 0, 1, 1,
-1.080396, 1.73232, -0.1129723, 0, 0, 0, 1, 1,
-1.08003, 0.3044404, -3.036159, 0, 0, 0, 1, 1,
-1.074625, 1.047258, -1.058897, 1, 1, 1, 1, 1,
-1.068344, 1.297346, -0.3126986, 1, 1, 1, 1, 1,
-1.065251, -0.1704587, -1.890401, 1, 1, 1, 1, 1,
-1.062805, -1.334879, -2.08679, 1, 1, 1, 1, 1,
-1.059701, -0.2926252, -2.598057, 1, 1, 1, 1, 1,
-1.054916, 0.7656725, -0.6937149, 1, 1, 1, 1, 1,
-1.038174, -0.2776024, -1.354245, 1, 1, 1, 1, 1,
-1.030819, -0.6011016, -3.701493, 1, 1, 1, 1, 1,
-1.028988, 0.1052649, -0.4506656, 1, 1, 1, 1, 1,
-1.02772, -0.1959989, -2.768788, 1, 1, 1, 1, 1,
-1.004313, -1.556429, -2.198164, 1, 1, 1, 1, 1,
-1.003571, -1.629009, -1.667965, 1, 1, 1, 1, 1,
-1.002549, -0.02247599, -0.1331733, 1, 1, 1, 1, 1,
-0.9993148, 0.08122475, -1.062333, 1, 1, 1, 1, 1,
-0.9914857, -0.1753019, -1.048851, 1, 1, 1, 1, 1,
-0.9892178, -0.4533987, -0.4545421, 0, 0, 1, 1, 1,
-0.9869374, -1.687099, -2.839866, 1, 0, 0, 1, 1,
-0.9768534, 0.3199082, -1.187424, 1, 0, 0, 1, 1,
-0.9718585, 1.616897, 0.9692171, 1, 0, 0, 1, 1,
-0.9712933, -0.2843911, -1.596012, 1, 0, 0, 1, 1,
-0.9712321, 1.266516, 0.2150652, 1, 0, 0, 1, 1,
-0.9673958, 1.273574, -1.829846, 0, 0, 0, 1, 1,
-0.9672813, -0.4211167, -1.743962, 0, 0, 0, 1, 1,
-0.9664832, 0.4702042, 0.9476135, 0, 0, 0, 1, 1,
-0.9651824, -0.3541175, -1.63535, 0, 0, 0, 1, 1,
-0.9585941, -1.247205, -0.2895136, 0, 0, 0, 1, 1,
-0.9478365, 2.61065, -0.04140143, 0, 0, 0, 1, 1,
-0.9424467, 1.666722, 0.2439402, 0, 0, 0, 1, 1,
-0.9417925, 0.2596197, -0.1221901, 1, 1, 1, 1, 1,
-0.9407681, 0.5124226, 1.268164, 1, 1, 1, 1, 1,
-0.9376573, -0.2454153, -0.1487363, 1, 1, 1, 1, 1,
-0.932151, -0.4912347, -2.425195, 1, 1, 1, 1, 1,
-0.9317345, -0.3189312, -2.800068, 1, 1, 1, 1, 1,
-0.9277152, -1.871898, -0.7131202, 1, 1, 1, 1, 1,
-0.9250279, -2.328803, -2.512055, 1, 1, 1, 1, 1,
-0.9209098, -1.287438, -2.531163, 1, 1, 1, 1, 1,
-0.913665, 1.461496, 0.4500433, 1, 1, 1, 1, 1,
-0.9008257, 1.034169, -1.130074, 1, 1, 1, 1, 1,
-0.8974188, 1.777561, -1.181542, 1, 1, 1, 1, 1,
-0.8851138, -0.5541232, -3.251756, 1, 1, 1, 1, 1,
-0.8827635, -0.9641209, -3.462352, 1, 1, 1, 1, 1,
-0.8808957, -1.075454, -3.565273, 1, 1, 1, 1, 1,
-0.8781291, 0.1348947, -1.009918, 1, 1, 1, 1, 1,
-0.8759012, -1.393908, -1.484071, 0, 0, 1, 1, 1,
-0.8750547, -0.6873179, -0.9921012, 1, 0, 0, 1, 1,
-0.8740551, -1.798387, -3.171041, 1, 0, 0, 1, 1,
-0.8673834, -0.6426511, -1.344361, 1, 0, 0, 1, 1,
-0.8672255, -1.309515, -3.284405, 1, 0, 0, 1, 1,
-0.8672105, -1.672162, -1.379984, 1, 0, 0, 1, 1,
-0.8664787, 0.6316402, -0.478728, 0, 0, 0, 1, 1,
-0.8655777, 0.2126479, -2.150992, 0, 0, 0, 1, 1,
-0.8649839, 1.051784, -0.7951223, 0, 0, 0, 1, 1,
-0.8614076, 0.7712485, -0.2266971, 0, 0, 0, 1, 1,
-0.8548314, 2.396186, 0.6704608, 0, 0, 0, 1, 1,
-0.8527552, 0.1158171, 0.4786527, 0, 0, 0, 1, 1,
-0.8501664, -0.4483816, -1.441263, 0, 0, 0, 1, 1,
-0.8451312, -0.6476395, -2.230634, 1, 1, 1, 1, 1,
-0.8424773, 0.4601698, -0.5251378, 1, 1, 1, 1, 1,
-0.8387327, -0.7578804, -1.272931, 1, 1, 1, 1, 1,
-0.8383803, 0.7462616, -0.7826151, 1, 1, 1, 1, 1,
-0.8335116, 0.4153117, -2.066786, 1, 1, 1, 1, 1,
-0.8315947, 1.61948, 0.8823531, 1, 1, 1, 1, 1,
-0.8309777, 0.02995466, -1.716977, 1, 1, 1, 1, 1,
-0.8273819, -1.480361, -1.422063, 1, 1, 1, 1, 1,
-0.8268937, -0.539854, -3.078379, 1, 1, 1, 1, 1,
-0.8266754, -0.2317457, -0.692177, 1, 1, 1, 1, 1,
-0.8263471, 0.09836246, -0.4742239, 1, 1, 1, 1, 1,
-0.8258738, -3.602324, -5.128643, 1, 1, 1, 1, 1,
-0.8206322, 0.3540396, -3.017347, 1, 1, 1, 1, 1,
-0.8153505, 1.300561, -3.09405, 1, 1, 1, 1, 1,
-0.8143623, 0.04369721, -4.293266, 1, 1, 1, 1, 1,
-0.8137283, -0.2608937, -2.013983, 0, 0, 1, 1, 1,
-0.8110978, -1.214317, -0.9139413, 1, 0, 0, 1, 1,
-0.8067894, 0.2793078, -1.701861, 1, 0, 0, 1, 1,
-0.8017837, 1.057163, 0.1840421, 1, 0, 0, 1, 1,
-0.8005537, 2.104139, -1.249781, 1, 0, 0, 1, 1,
-0.8001526, 0.4501115, -0.8058754, 1, 0, 0, 1, 1,
-0.7965941, 0.8100932, -0.8239613, 0, 0, 0, 1, 1,
-0.7888318, 0.3832001, 2.20299, 0, 0, 0, 1, 1,
-0.7838436, -0.7028357, -3.948278, 0, 0, 0, 1, 1,
-0.7766051, -0.5040664, -2.900234, 0, 0, 0, 1, 1,
-0.7727646, -0.3053527, 0.06072337, 0, 0, 0, 1, 1,
-0.7646954, 1.250512, -0.6013751, 0, 0, 0, 1, 1,
-0.7636077, 1.044875, -2.028066, 0, 0, 0, 1, 1,
-0.7633556, 0.3179394, -1.42376, 1, 1, 1, 1, 1,
-0.7618227, 0.4955139, -1.343984, 1, 1, 1, 1, 1,
-0.7611034, -1.118316, -2.293871, 1, 1, 1, 1, 1,
-0.7481188, -1.497581, -2.681881, 1, 1, 1, 1, 1,
-0.743911, 0.13773, 0.562706, 1, 1, 1, 1, 1,
-0.741377, 0.3103009, 1.177614, 1, 1, 1, 1, 1,
-0.7369972, 0.4667301, -1.085433, 1, 1, 1, 1, 1,
-0.7366214, -0.6910594, -2.078766, 1, 1, 1, 1, 1,
-0.7309561, 0.7489837, -1.89425, 1, 1, 1, 1, 1,
-0.7299842, -0.3227485, -3.156547, 1, 1, 1, 1, 1,
-0.7288836, 0.2589253, -2.546422, 1, 1, 1, 1, 1,
-0.7257004, 1.061404, 0.06399897, 1, 1, 1, 1, 1,
-0.723776, 0.6634877, -1.702695, 1, 1, 1, 1, 1,
-0.7220743, -0.3281582, -0.2626683, 1, 1, 1, 1, 1,
-0.7200604, -1.419241, -1.597797, 1, 1, 1, 1, 1,
-0.7174437, -0.7625853, -3.114387, 0, 0, 1, 1, 1,
-0.711517, -0.8557699, -2.097325, 1, 0, 0, 1, 1,
-0.7108013, 0.01668668, -1.03401, 1, 0, 0, 1, 1,
-0.7010622, -0.7952569, -2.435443, 1, 0, 0, 1, 1,
-0.6931707, -1.167995, -1.882675, 1, 0, 0, 1, 1,
-0.6930831, -0.3170965, -1.828128, 1, 0, 0, 1, 1,
-0.6927808, 1.419077, 0.5874038, 0, 0, 0, 1, 1,
-0.6897556, 2.04556, -1.834635, 0, 0, 0, 1, 1,
-0.6890413, -0.5290931, -1.301017, 0, 0, 0, 1, 1,
-0.6869002, 0.1512594, -1.298735, 0, 0, 0, 1, 1,
-0.6846382, -0.4054321, -1.204063, 0, 0, 0, 1, 1,
-0.6843996, 1.020443, -1.022993, 0, 0, 0, 1, 1,
-0.6775258, -1.153303, -1.27345, 0, 0, 0, 1, 1,
-0.6744951, 0.3819574, -1.661173, 1, 1, 1, 1, 1,
-0.6728336, 1.153087, -1.218723, 1, 1, 1, 1, 1,
-0.6696129, 1.236485, -1.28818, 1, 1, 1, 1, 1,
-0.6694754, 0.2915181, -2.248014, 1, 1, 1, 1, 1,
-0.6669511, -1.620707, -4.824402, 1, 1, 1, 1, 1,
-0.66658, -0.624106, -3.036648, 1, 1, 1, 1, 1,
-0.6660506, -0.4307011, -1.55304, 1, 1, 1, 1, 1,
-0.6640494, -0.4645154, -1.589201, 1, 1, 1, 1, 1,
-0.6579568, 0.7392686, -0.8818308, 1, 1, 1, 1, 1,
-0.6569418, -1.393416, -3.151002, 1, 1, 1, 1, 1,
-0.6500077, -0.2122853, -1.595542, 1, 1, 1, 1, 1,
-0.6493697, 0.01567165, -2.001798, 1, 1, 1, 1, 1,
-0.6394997, -0.142621, -1.741067, 1, 1, 1, 1, 1,
-0.63737, -0.937302, -3.564645, 1, 1, 1, 1, 1,
-0.6323978, 1.836347, 0.7813539, 1, 1, 1, 1, 1,
-0.6299029, -0.36311, -1.552781, 0, 0, 1, 1, 1,
-0.6256903, 1.914845, -0.09183849, 1, 0, 0, 1, 1,
-0.6252987, -1.963052, -4.002, 1, 0, 0, 1, 1,
-0.6209484, -0.4058158, -3.567956, 1, 0, 0, 1, 1,
-0.6178102, -1.029281, -3.803185, 1, 0, 0, 1, 1,
-0.614244, -3.302204, -3.175234, 1, 0, 0, 1, 1,
-0.6116528, 0.5528831, -2.524682, 0, 0, 0, 1, 1,
-0.6100553, -1.292601, -2.732089, 0, 0, 0, 1, 1,
-0.6082264, -0.3934881, -2.686974, 0, 0, 0, 1, 1,
-0.6070436, -0.1034869, -1.098608, 0, 0, 0, 1, 1,
-0.6063711, 1.187913, 1.863281, 0, 0, 0, 1, 1,
-0.5993832, -1.122864, -2.373383, 0, 0, 0, 1, 1,
-0.5981517, 1.600321, 1.094031, 0, 0, 0, 1, 1,
-0.598031, 0.6860306, -1.902677, 1, 1, 1, 1, 1,
-0.597822, -0.6985955, -0.6947923, 1, 1, 1, 1, 1,
-0.5958267, 0.7640917, -2.682264, 1, 1, 1, 1, 1,
-0.5917767, -1.503486, -1.800514, 1, 1, 1, 1, 1,
-0.5888237, -0.1532806, -2.635694, 1, 1, 1, 1, 1,
-0.5884006, -0.7979575, -2.863381, 1, 1, 1, 1, 1,
-0.5865216, -1.192027, -1.947723, 1, 1, 1, 1, 1,
-0.5820779, 0.4455227, -0.5860319, 1, 1, 1, 1, 1,
-0.5784818, -1.292619, -2.75015, 1, 1, 1, 1, 1,
-0.5759354, -0.2829958, -2.531091, 1, 1, 1, 1, 1,
-0.5745496, -0.6004562, -3.986394, 1, 1, 1, 1, 1,
-0.5694669, 0.8547103, -0.6904889, 1, 1, 1, 1, 1,
-0.5660695, -0.04981237, -2.692896, 1, 1, 1, 1, 1,
-0.5635867, -1.270287, -1.153955, 1, 1, 1, 1, 1,
-0.5618477, 0.08427981, -1.827954, 1, 1, 1, 1, 1,
-0.5532544, -1.485334, -3.247444, 0, 0, 1, 1, 1,
-0.5502989, -0.7980875, -1.494051, 1, 0, 0, 1, 1,
-0.5481016, -1.049308, -3.207797, 1, 0, 0, 1, 1,
-0.5373194, 0.2389111, -1.703412, 1, 0, 0, 1, 1,
-0.5355363, -0.4585543, -0.2593765, 1, 0, 0, 1, 1,
-0.534991, -0.1840143, -2.640699, 1, 0, 0, 1, 1,
-0.5311022, 0.3287147, -0.2542654, 0, 0, 0, 1, 1,
-0.5307644, -0.795579, -2.711455, 0, 0, 0, 1, 1,
-0.5288223, 0.6991985, -2.774721, 0, 0, 0, 1, 1,
-0.5219718, -0.709807, -2.743867, 0, 0, 0, 1, 1,
-0.5172853, 1.249523, -0.4756892, 0, 0, 0, 1, 1,
-0.5169693, -1.365665, -3.960696, 0, 0, 0, 1, 1,
-0.516244, 0.080972, 1.055423, 0, 0, 0, 1, 1,
-0.5151269, -0.2558838, -2.080124, 1, 1, 1, 1, 1,
-0.5141705, -0.7188988, -1.274859, 1, 1, 1, 1, 1,
-0.5132021, -0.7839973, -3.108299, 1, 1, 1, 1, 1,
-0.512615, 0.2658877, 0.5282768, 1, 1, 1, 1, 1,
-0.5099615, -0.6780545, -4.081471, 1, 1, 1, 1, 1,
-0.5066605, 0.007116037, -0.3153642, 1, 1, 1, 1, 1,
-0.5051559, 1.731282, -1.089747, 1, 1, 1, 1, 1,
-0.491522, -0.2515797, -2.203681, 1, 1, 1, 1, 1,
-0.4892443, 1.540607, -0.9949258, 1, 1, 1, 1, 1,
-0.488361, -0.260164, -1.056709, 1, 1, 1, 1, 1,
-0.4842195, -0.8385052, -4.493317, 1, 1, 1, 1, 1,
-0.4593869, -0.1890263, -1.504512, 1, 1, 1, 1, 1,
-0.4592277, -0.9591309, -2.301861, 1, 1, 1, 1, 1,
-0.4467586, -0.4119768, -4.04614, 1, 1, 1, 1, 1,
-0.4448816, -1.152035, -2.33232, 1, 1, 1, 1, 1,
-0.4432845, 0.8447681, -0.8988189, 0, 0, 1, 1, 1,
-0.4400184, 1.078288, -1.08946, 1, 0, 0, 1, 1,
-0.4378444, 0.9708548, 0.5448734, 1, 0, 0, 1, 1,
-0.4314912, -1.257221, -3.759228, 1, 0, 0, 1, 1,
-0.429859, 1.07396, 0.2621959, 1, 0, 0, 1, 1,
-0.4228366, 0.8851522, -1.042009, 1, 0, 0, 1, 1,
-0.4217336, 0.08985595, -2.683283, 0, 0, 0, 1, 1,
-0.4189599, 0.3708194, -0.7928252, 0, 0, 0, 1, 1,
-0.4186532, -0.6504889, -1.140669, 0, 0, 0, 1, 1,
-0.4174109, -0.4769097, -4.041794, 0, 0, 0, 1, 1,
-0.411048, -0.6359838, -4.328127, 0, 0, 0, 1, 1,
-0.4083388, 0.5669596, -0.4482839, 0, 0, 0, 1, 1,
-0.4083197, -1.413731, -3.225216, 0, 0, 0, 1, 1,
-0.4042939, -0.09010189, -0.9705869, 1, 1, 1, 1, 1,
-0.4040444, 0.04448534, -0.7446135, 1, 1, 1, 1, 1,
-0.3968906, -0.001908805, -0.8877032, 1, 1, 1, 1, 1,
-0.3942354, 0.2120162, 0.5185523, 1, 1, 1, 1, 1,
-0.3932723, -0.58369, -3.830921, 1, 1, 1, 1, 1,
-0.3930678, 1.229599, -0.9596463, 1, 1, 1, 1, 1,
-0.3903452, 2.941861, -1.312215, 1, 1, 1, 1, 1,
-0.3863565, 0.713286, -2.572304, 1, 1, 1, 1, 1,
-0.3844863, 1.13468, -0.3850204, 1, 1, 1, 1, 1,
-0.3842224, -0.2167134, -1.352601, 1, 1, 1, 1, 1,
-0.3833829, 0.9908168, -1.856043, 1, 1, 1, 1, 1,
-0.3804394, 0.547718, -1.011087, 1, 1, 1, 1, 1,
-0.378427, -0.6090509, -3.244634, 1, 1, 1, 1, 1,
-0.3759394, -0.9710599, -2.53624, 1, 1, 1, 1, 1,
-0.3730884, -0.3783303, -2.645684, 1, 1, 1, 1, 1,
-0.3715067, 0.4172222, -1.252296, 0, 0, 1, 1, 1,
-0.3698251, 1.413617, -1.268751, 1, 0, 0, 1, 1,
-0.365096, 0.09153157, -2.36863, 1, 0, 0, 1, 1,
-0.3645511, 0.04859907, -0.9708304, 1, 0, 0, 1, 1,
-0.3618472, 0.2378025, 0.6593465, 1, 0, 0, 1, 1,
-0.3615411, 0.3926131, -1.297696, 1, 0, 0, 1, 1,
-0.3611626, -0.60228, -1.165002, 0, 0, 0, 1, 1,
-0.3605526, 2.119641, -0.7007836, 0, 0, 0, 1, 1,
-0.3603059, 0.09486791, -1.416716, 0, 0, 0, 1, 1,
-0.3597195, -1.358558, -3.987343, 0, 0, 0, 1, 1,
-0.3587478, 1.163741, -0.2291657, 0, 0, 0, 1, 1,
-0.3585818, -0.770303, -2.421502, 0, 0, 0, 1, 1,
-0.3581318, 0.09105769, -0.9148108, 0, 0, 0, 1, 1,
-0.3565695, -0.6633879, -2.22904, 1, 1, 1, 1, 1,
-0.3563686, -1.445046, -3.239317, 1, 1, 1, 1, 1,
-0.3544655, 0.659508, -0.5398349, 1, 1, 1, 1, 1,
-0.3514835, -0.7539899, -1.348059, 1, 1, 1, 1, 1,
-0.3498348, 1.461632, -1.136141, 1, 1, 1, 1, 1,
-0.3461815, -0.7420481, -3.281184, 1, 1, 1, 1, 1,
-0.3454679, -0.1360583, -0.8381463, 1, 1, 1, 1, 1,
-0.3440311, 0.8762952, -1.892553, 1, 1, 1, 1, 1,
-0.3434345, 0.4799231, -0.2968615, 1, 1, 1, 1, 1,
-0.3400506, -1.254893, -3.12301, 1, 1, 1, 1, 1,
-0.3398174, 1.598613, -1.503856, 1, 1, 1, 1, 1,
-0.3388999, 0.3404718, -1.074561, 1, 1, 1, 1, 1,
-0.3376157, -0.6505745, -1.878762, 1, 1, 1, 1, 1,
-0.331623, -1.264285, -2.443254, 1, 1, 1, 1, 1,
-0.3244897, -0.08018284, -1.144713, 1, 1, 1, 1, 1,
-0.3177016, 0.05873884, -2.207004, 0, 0, 1, 1, 1,
-0.3175274, -0.9775456, -2.504548, 1, 0, 0, 1, 1,
-0.3128389, 0.4299162, -1.990136, 1, 0, 0, 1, 1,
-0.3107573, 1.600133, 0.03706626, 1, 0, 0, 1, 1,
-0.3105528, -1.307038, -3.651242, 1, 0, 0, 1, 1,
-0.3079184, -2.224572, -3.784444, 1, 0, 0, 1, 1,
-0.305143, 0.3896801, -1.312628, 0, 0, 0, 1, 1,
-0.2975761, -1.163605, -3.250317, 0, 0, 0, 1, 1,
-0.2938921, 0.1412732, 0.0116455, 0, 0, 0, 1, 1,
-0.2832638, -0.2106031, -2.330243, 0, 0, 0, 1, 1,
-0.2797312, 1.001166, -0.488313, 0, 0, 0, 1, 1,
-0.2780318, -1.209554, -2.390996, 0, 0, 0, 1, 1,
-0.2735092, 0.7253439, 1.069684, 0, 0, 0, 1, 1,
-0.2701388, -0.8370026, -3.531901, 1, 1, 1, 1, 1,
-0.2685966, -0.07420868, -0.5500973, 1, 1, 1, 1, 1,
-0.2678815, 1.966156, -0.4259883, 1, 1, 1, 1, 1,
-0.2569313, -0.2717494, -3.171714, 1, 1, 1, 1, 1,
-0.2558661, -1.623714, -3.814161, 1, 1, 1, 1, 1,
-0.2546926, -0.9330175, -3.02173, 1, 1, 1, 1, 1,
-0.2545, 0.0441969, -2.344337, 1, 1, 1, 1, 1,
-0.2544621, 0.2979907, 1.069446, 1, 1, 1, 1, 1,
-0.2543984, 1.227782, -0.7163163, 1, 1, 1, 1, 1,
-0.2543084, -0.9760808, -3.507956, 1, 1, 1, 1, 1,
-0.2477893, 0.2047222, 0.96463, 1, 1, 1, 1, 1,
-0.247485, -0.9116886, -4.998211, 1, 1, 1, 1, 1,
-0.2398061, -0.5543331, -2.670707, 1, 1, 1, 1, 1,
-0.2332002, -1.672331, -1.24227, 1, 1, 1, 1, 1,
-0.2329127, -0.572166, -3.262701, 1, 1, 1, 1, 1,
-0.2302685, -0.6732288, -3.682577, 0, 0, 1, 1, 1,
-0.2298409, 0.4647535, 0.2086146, 1, 0, 0, 1, 1,
-0.2227177, -0.459544, -2.412471, 1, 0, 0, 1, 1,
-0.2215362, 1.327104, 1.793435, 1, 0, 0, 1, 1,
-0.2175151, -0.7370479, -1.71234, 1, 0, 0, 1, 1,
-0.2163346, -0.03272782, -1.753917, 1, 0, 0, 1, 1,
-0.2140994, -0.2792431, -2.497738, 0, 0, 0, 1, 1,
-0.2114568, -1.808966, -1.825366, 0, 0, 0, 1, 1,
-0.2112795, -0.3832733, -1.542439, 0, 0, 0, 1, 1,
-0.2105409, -0.2780164, 0.05262417, 0, 0, 0, 1, 1,
-0.2091119, 0.8738112, 0.5855644, 0, 0, 0, 1, 1,
-0.2046311, 0.579613, -0.5511114, 0, 0, 0, 1, 1,
-0.2043507, 0.585107, -1.6326, 0, 0, 0, 1, 1,
-0.2019454, 0.5562797, 0.1773493, 1, 1, 1, 1, 1,
-0.1931704, -1.313916, -3.164626, 1, 1, 1, 1, 1,
-0.18808, 1.917646, -0.7038375, 1, 1, 1, 1, 1,
-0.1867732, -1.682744, -3.811031, 1, 1, 1, 1, 1,
-0.1853209, -1.125558, -3.732295, 1, 1, 1, 1, 1,
-0.1708084, 0.08335378, 0.2943666, 1, 1, 1, 1, 1,
-0.1686932, -1.4983, -5.809216, 1, 1, 1, 1, 1,
-0.165639, -1.024748, -3.278109, 1, 1, 1, 1, 1,
-0.1635645, 0.2545188, -0.3416693, 1, 1, 1, 1, 1,
-0.1607993, -0.4717892, -2.45287, 1, 1, 1, 1, 1,
-0.1581854, -0.4530888, -2.899564, 1, 1, 1, 1, 1,
-0.1577763, 1.759301, -1.318966, 1, 1, 1, 1, 1,
-0.1480672, -0.6665113, -3.006455, 1, 1, 1, 1, 1,
-0.1480571, -0.06563232, -3.531816, 1, 1, 1, 1, 1,
-0.144441, 0.06785389, -1.36644, 1, 1, 1, 1, 1,
-0.1434209, 1.129735, 1.381796, 0, 0, 1, 1, 1,
-0.1401733, 1.184922, -0.5881608, 1, 0, 0, 1, 1,
-0.1390035, 0.9839017, 0.4342827, 1, 0, 0, 1, 1,
-0.136623, 1.4392, -0.5580377, 1, 0, 0, 1, 1,
-0.1342487, 0.01072589, -1.014215, 1, 0, 0, 1, 1,
-0.1335839, 1.162703, 1.117734, 1, 0, 0, 1, 1,
-0.1288538, 1.774213, 1.108303, 0, 0, 0, 1, 1,
-0.1251763, 0.3648872, -1.356882, 0, 0, 0, 1, 1,
-0.1240793, -0.6182867, -2.484861, 0, 0, 0, 1, 1,
-0.122768, -1.190578, -4.461849, 0, 0, 0, 1, 1,
-0.1185499, 0.4833902, 0.04439885, 0, 0, 0, 1, 1,
-0.1156004, 1.25064, -0.9408665, 0, 0, 0, 1, 1,
-0.1152249, -0.7789821, -3.347535, 0, 0, 0, 1, 1,
-0.1097234, -0.3691467, -3.620903, 1, 1, 1, 1, 1,
-0.1065513, 0.3960348, 0.7945789, 1, 1, 1, 1, 1,
-0.106462, -0.2641201, -2.987597, 1, 1, 1, 1, 1,
-0.1047768, -0.518313, -3.16919, 1, 1, 1, 1, 1,
-0.1029518, -1.01362, -4.206112, 1, 1, 1, 1, 1,
-0.08998314, -0.928492, -2.366049, 1, 1, 1, 1, 1,
-0.08926488, 2.347244, -2.265169, 1, 1, 1, 1, 1,
-0.08868958, 0.4281117, -1.666094, 1, 1, 1, 1, 1,
-0.08213153, -0.1351343, -2.953181, 1, 1, 1, 1, 1,
-0.0778451, 2.138373, -1.132284, 1, 1, 1, 1, 1,
-0.0777906, 1.245409, 2.69824, 1, 1, 1, 1, 1,
-0.07327127, 0.3963667, -1.543606, 1, 1, 1, 1, 1,
-0.07134461, 0.1172434, 0.2144362, 1, 1, 1, 1, 1,
-0.06494389, -1.725546, -3.702784, 1, 1, 1, 1, 1,
-0.0622551, 0.8029007, -1.146833, 1, 1, 1, 1, 1,
-0.05976174, 1.763467, 1.040988, 0, 0, 1, 1, 1,
-0.05827415, 0.7251658, -0.7151738, 1, 0, 0, 1, 1,
-0.0540088, -0.7133842, -3.893655, 1, 0, 0, 1, 1,
-0.04855295, -0.5777606, -3.563358, 1, 0, 0, 1, 1,
-0.04485836, 0.4507697, -1.392154, 1, 0, 0, 1, 1,
-0.04326335, -0.1467935, -2.77158, 1, 0, 0, 1, 1,
-0.03939582, -0.3894603, -2.983877, 0, 0, 0, 1, 1,
-0.03805123, -0.6841112, -4.568911, 0, 0, 0, 1, 1,
-0.03189078, 0.2500069, -0.2496522, 0, 0, 0, 1, 1,
-0.0299904, 0.175318, -1.500858, 0, 0, 0, 1, 1,
-0.02479463, -0.7872625, -2.757373, 0, 0, 0, 1, 1,
-0.02401687, -2.893403, -4.450372, 0, 0, 0, 1, 1,
-0.02376746, -1.406597, -2.385476, 0, 0, 0, 1, 1,
-0.02204453, -0.03351976, -2.17259, 1, 1, 1, 1, 1,
-0.02001799, -1.717266, -1.859707, 1, 1, 1, 1, 1,
-0.01701285, -0.4193689, -1.989668, 1, 1, 1, 1, 1,
-0.01622383, 0.08405958, -0.2791494, 1, 1, 1, 1, 1,
-0.0001681362, 0.208186, 0.7044676, 1, 1, 1, 1, 1,
0.0001717264, 0.2266588, -1.304841, 1, 1, 1, 1, 1,
0.000707206, -1.946344, 3.631602, 1, 1, 1, 1, 1,
0.0008941634, -0.2745416, 3.938323, 1, 1, 1, 1, 1,
0.001363534, 1.175535, 0.6717672, 1, 1, 1, 1, 1,
0.002409377, 0.3153486, -1.323657, 1, 1, 1, 1, 1,
0.005747712, -2.599065, 3.653307, 1, 1, 1, 1, 1,
0.00610033, 2.021227, -0.2960736, 1, 1, 1, 1, 1,
0.007789752, 0.9002283, -0.1084387, 1, 1, 1, 1, 1,
0.008608024, -1.564944, 3.680231, 1, 1, 1, 1, 1,
0.01212926, -0.9713334, 1.191135, 1, 1, 1, 1, 1,
0.01421236, -0.2740861, 1.554572, 0, 0, 1, 1, 1,
0.01954614, -1.114187, 2.522728, 1, 0, 0, 1, 1,
0.02139523, -0.3055664, 3.044012, 1, 0, 0, 1, 1,
0.02144128, -1.841699, 4.719342, 1, 0, 0, 1, 1,
0.02356368, -0.3591481, 4.280749, 1, 0, 0, 1, 1,
0.0245326, 0.7143815, -0.2053849, 1, 0, 0, 1, 1,
0.02758477, -1.113992, 4.955702, 0, 0, 0, 1, 1,
0.03267563, -0.3260677, 3.268659, 0, 0, 0, 1, 1,
0.03288591, -0.1282977, 3.863932, 0, 0, 0, 1, 1,
0.03309655, -0.662934, 3.341845, 0, 0, 0, 1, 1,
0.03427996, -0.2538079, 4.819306, 0, 0, 0, 1, 1,
0.03938203, 0.4947533, 0.4683045, 0, 0, 0, 1, 1,
0.04231832, 0.7441297, -0.927003, 0, 0, 0, 1, 1,
0.045316, -1.584615, 2.815303, 1, 1, 1, 1, 1,
0.04642776, -0.7544398, 3.788331, 1, 1, 1, 1, 1,
0.04660846, 2.175972, -0.6447607, 1, 1, 1, 1, 1,
0.05059665, 1.701034, -0.9773214, 1, 1, 1, 1, 1,
0.0532354, -0.9915602, 1.284601, 1, 1, 1, 1, 1,
0.05647452, -0.2902483, 4.341636, 1, 1, 1, 1, 1,
0.05761383, 1.248652, -0.223784, 1, 1, 1, 1, 1,
0.05782706, -0.4345845, 3.231519, 1, 1, 1, 1, 1,
0.05803874, 1.209871, 0.05766148, 1, 1, 1, 1, 1,
0.06210668, -0.9764509, 2.973732, 1, 1, 1, 1, 1,
0.0687993, 1.130528, 0.9060852, 1, 1, 1, 1, 1,
0.07265558, 0.5054466, 0.9155846, 1, 1, 1, 1, 1,
0.07352984, 1.006197, 0.9582456, 1, 1, 1, 1, 1,
0.0807201, -0.2493694, 4.336843, 1, 1, 1, 1, 1,
0.08236581, -0.1192369, 2.411421, 1, 1, 1, 1, 1,
0.08613409, -1.469499, 2.786123, 0, 0, 1, 1, 1,
0.09092471, 1.290065, -2.131035, 1, 0, 0, 1, 1,
0.09093071, -0.6609418, 3.022541, 1, 0, 0, 1, 1,
0.09221044, -1.063918, 2.058867, 1, 0, 0, 1, 1,
0.09288242, -0.6778409, 3.91146, 1, 0, 0, 1, 1,
0.09469631, -0.1734879, 1.470569, 1, 0, 0, 1, 1,
0.09636275, 0.2513839, 0.9342505, 0, 0, 0, 1, 1,
0.1035989, -1.222417, 3.547725, 0, 0, 0, 1, 1,
0.1044099, -1.290574, 1.916309, 0, 0, 0, 1, 1,
0.1072085, 0.9391015, 1.269116, 0, 0, 0, 1, 1,
0.1102129, -0.01891055, 3.083105, 0, 0, 0, 1, 1,
0.1116078, -1.213139, 3.419266, 0, 0, 0, 1, 1,
0.1175214, 1.205282, 0.9504536, 0, 0, 0, 1, 1,
0.1235297, 1.326267, -0.3076824, 1, 1, 1, 1, 1,
0.1311159, -0.08519023, 1.545787, 1, 1, 1, 1, 1,
0.1356291, 0.003310038, 2.139623, 1, 1, 1, 1, 1,
0.1364517, -1.870554, 2.42228, 1, 1, 1, 1, 1,
0.1370589, -1.368648, 3.655614, 1, 1, 1, 1, 1,
0.1386082, -0.2296841, 2.35569, 1, 1, 1, 1, 1,
0.1421966, 0.4138449, 1.742978, 1, 1, 1, 1, 1,
0.1460633, 0.3076287, 1.423566, 1, 1, 1, 1, 1,
0.1477023, -1.823187, 2.651407, 1, 1, 1, 1, 1,
0.1490402, -0.5509508, 3.151151, 1, 1, 1, 1, 1,
0.1490835, -0.1807266, 4.262686, 1, 1, 1, 1, 1,
0.1495045, -0.01379758, 0.8427301, 1, 1, 1, 1, 1,
0.1534442, 1.399882, -0.1801413, 1, 1, 1, 1, 1,
0.1540217, 1.583445, -0.4700229, 1, 1, 1, 1, 1,
0.1575287, -0.59463, 3.01606, 1, 1, 1, 1, 1,
0.1577627, 1.027265, 0.743506, 0, 0, 1, 1, 1,
0.158993, 0.2006488, -0.2066568, 1, 0, 0, 1, 1,
0.1591795, -0.5069885, 3.250338, 1, 0, 0, 1, 1,
0.1600803, -0.3548448, 4.405834, 1, 0, 0, 1, 1,
0.1639071, -0.2617943, 1.677487, 1, 0, 0, 1, 1,
0.1652006, 0.9356433, 0.1557912, 1, 0, 0, 1, 1,
0.1673841, -0.1928324, 1.692695, 0, 0, 0, 1, 1,
0.173825, 0.01915058, 2.170658, 0, 0, 0, 1, 1,
0.1740778, -0.2964943, 2.4516, 0, 0, 0, 1, 1,
0.1745644, 0.2128408, 0.3279385, 0, 0, 0, 1, 1,
0.1796201, -0.3606161, 2.592313, 0, 0, 0, 1, 1,
0.1816004, 1.339582, 1.705471, 0, 0, 0, 1, 1,
0.1851782, 0.2795254, 0.9881477, 0, 0, 0, 1, 1,
0.1856516, -0.533987, 2.889747, 1, 1, 1, 1, 1,
0.1871061, -0.6817216, 1.065205, 1, 1, 1, 1, 1,
0.1878781, 1.599216, 0.1809817, 1, 1, 1, 1, 1,
0.1904832, -1.245225, 2.67074, 1, 1, 1, 1, 1,
0.1933371, 0.2508006, 0.1289893, 1, 1, 1, 1, 1,
0.1938189, -0.5574104, 2.522515, 1, 1, 1, 1, 1,
0.1988243, 0.2958069, -0.6754227, 1, 1, 1, 1, 1,
0.2009433, -1.637282, 1.676119, 1, 1, 1, 1, 1,
0.2013618, 0.7500522, -0.5784228, 1, 1, 1, 1, 1,
0.2022434, -0.3347041, 1.677795, 1, 1, 1, 1, 1,
0.2091159, 0.003758293, 1.562479, 1, 1, 1, 1, 1,
0.2091979, 0.4418414, 0.6745386, 1, 1, 1, 1, 1,
0.2106465, 0.2451237, -0.9178314, 1, 1, 1, 1, 1,
0.2124236, -0.4376483, 3.826217, 1, 1, 1, 1, 1,
0.213428, 0.007218596, 1.951562, 1, 1, 1, 1, 1,
0.216365, -0.6511502, 2.639288, 0, 0, 1, 1, 1,
0.218259, -1.128702, 1.153051, 1, 0, 0, 1, 1,
0.2301497, 0.4567254, -0.6584052, 1, 0, 0, 1, 1,
0.2308339, -0.02978344, 0.6599727, 1, 0, 0, 1, 1,
0.2308543, 0.1447806, 0.4699687, 1, 0, 0, 1, 1,
0.2310013, -1.66228, 3.128703, 1, 0, 0, 1, 1,
0.2362496, 0.8603549, -0.9489084, 0, 0, 0, 1, 1,
0.2375713, 2.122843, 1.814481, 0, 0, 0, 1, 1,
0.2396386, -1.059259, 3.181324, 0, 0, 0, 1, 1,
0.2413257, 0.3566209, 0.4428831, 0, 0, 0, 1, 1,
0.2420619, -0.3259874, 3.687613, 0, 0, 0, 1, 1,
0.2435674, -0.4643257, 3.732825, 0, 0, 0, 1, 1,
0.2444374, 2.198673, 1.638783, 0, 0, 0, 1, 1,
0.2446885, -2.817184, 1.874952, 1, 1, 1, 1, 1,
0.2491905, 0.5427623, 0.758719, 1, 1, 1, 1, 1,
0.2526333, -0.6550483, 2.381843, 1, 1, 1, 1, 1,
0.2556767, -0.6561014, 3.21152, 1, 1, 1, 1, 1,
0.2564451, 0.323367, -1.213755, 1, 1, 1, 1, 1,
0.2606384, 0.4010655, -0.4698384, 1, 1, 1, 1, 1,
0.2623514, 0.3987791, 1.435238, 1, 1, 1, 1, 1,
0.2734809, -1.145402, 3.516798, 1, 1, 1, 1, 1,
0.2749617, 1.237236, -0.6094496, 1, 1, 1, 1, 1,
0.276865, -0.5364788, 3.123248, 1, 1, 1, 1, 1,
0.2781902, -1.418352, 4.958083, 1, 1, 1, 1, 1,
0.2819515, 0.3167589, 1.475897, 1, 1, 1, 1, 1,
0.2846721, 0.2758231, 0.3260133, 1, 1, 1, 1, 1,
0.2854806, -1.983459, 2.081248, 1, 1, 1, 1, 1,
0.2883237, 0.5415339, 0.7428034, 1, 1, 1, 1, 1,
0.2946822, 0.599735, 1.547634, 0, 0, 1, 1, 1,
0.3027301, 0.640231, -0.3613641, 1, 0, 0, 1, 1,
0.3056516, 0.9545962, 0.2944672, 1, 0, 0, 1, 1,
0.3067894, 0.1606025, 0.9232967, 1, 0, 0, 1, 1,
0.3078471, -0.1098707, 0.7224555, 1, 0, 0, 1, 1,
0.3122377, -0.3167968, 2.964712, 1, 0, 0, 1, 1,
0.3123013, -0.946507, 4.519166, 0, 0, 0, 1, 1,
0.3184812, -0.00401198, 2.177768, 0, 0, 0, 1, 1,
0.3184955, 0.352546, -0.8295191, 0, 0, 0, 1, 1,
0.3211233, 0.4464226, 2.334206, 0, 0, 0, 1, 1,
0.323912, 0.6451188, 2.176357, 0, 0, 0, 1, 1,
0.3244935, 0.1405396, 0.7412177, 0, 0, 0, 1, 1,
0.3264447, -1.516913, 4.435298, 0, 0, 0, 1, 1,
0.335828, 1.40509, 0.1712371, 1, 1, 1, 1, 1,
0.3378591, 0.6515487, 1.387888, 1, 1, 1, 1, 1,
0.3403162, 1.767811, 1.286809, 1, 1, 1, 1, 1,
0.3458696, -0.5111871, 3.913863, 1, 1, 1, 1, 1,
0.3485535, 0.5273684, -0.1419002, 1, 1, 1, 1, 1,
0.3529706, 0.1355462, 2.272796, 1, 1, 1, 1, 1,
0.3554076, -0.5137416, 1.742612, 1, 1, 1, 1, 1,
0.3564258, -0.4712094, 0.6630601, 1, 1, 1, 1, 1,
0.3595993, 1.44037, 0.4036288, 1, 1, 1, 1, 1,
0.3634725, 0.6691073, -0.5537978, 1, 1, 1, 1, 1,
0.3692099, 0.9448017, -0.3507531, 1, 1, 1, 1, 1,
0.3735037, -1.883601, 2.251269, 1, 1, 1, 1, 1,
0.3757001, 1.034185, 1.051938, 1, 1, 1, 1, 1,
0.3765335, 1.34878, 0.03273429, 1, 1, 1, 1, 1,
0.3768591, -0.9151589, 2.156492, 1, 1, 1, 1, 1,
0.3775994, 0.1505153, 0.9932841, 0, 0, 1, 1, 1,
0.3785699, 1.110602, 0.01549528, 1, 0, 0, 1, 1,
0.3785849, -0.6741828, 2.204596, 1, 0, 0, 1, 1,
0.3793434, 0.2198401, 1.939276, 1, 0, 0, 1, 1,
0.3859675, 0.2674645, 1.057331, 1, 0, 0, 1, 1,
0.3861631, 1.092025, 0.2202363, 1, 0, 0, 1, 1,
0.3863487, -0.9289851, 3.492299, 0, 0, 0, 1, 1,
0.3925514, 0.7971591, 0.1360472, 0, 0, 0, 1, 1,
0.3926803, 0.6707179, 0.6002917, 0, 0, 0, 1, 1,
0.4009212, -0.2585417, 1.427969, 0, 0, 0, 1, 1,
0.4032001, -2.09524, 3.94492, 0, 0, 0, 1, 1,
0.4050193, 0.8987743, 1.258656, 0, 0, 0, 1, 1,
0.4063028, 0.524444, 0.5795098, 0, 0, 0, 1, 1,
0.407644, -0.9723268, 1.919693, 1, 1, 1, 1, 1,
0.4083695, 0.7068551, 0.9076144, 1, 1, 1, 1, 1,
0.4088984, 0.43267, 0.1238163, 1, 1, 1, 1, 1,
0.4091205, -0.4052671, 3.303465, 1, 1, 1, 1, 1,
0.4097708, 1.356143, -0.6037639, 1, 1, 1, 1, 1,
0.4113811, 0.4341626, 0.9606963, 1, 1, 1, 1, 1,
0.4120175, 0.08241734, 0.524231, 1, 1, 1, 1, 1,
0.4141428, 0.491904, 0.9626259, 1, 1, 1, 1, 1,
0.4160809, -1.070094, 2.121384, 1, 1, 1, 1, 1,
0.4165486, -0.5510565, 2.717318, 1, 1, 1, 1, 1,
0.4195461, 0.8837977, -0.3672584, 1, 1, 1, 1, 1,
0.4214799, -1.179982, 3.712102, 1, 1, 1, 1, 1,
0.422982, -1.056131, 4.389086, 1, 1, 1, 1, 1,
0.4274134, -0.836463, 2.411089, 1, 1, 1, 1, 1,
0.4308682, 0.8862303, -0.5496373, 1, 1, 1, 1, 1,
0.4316055, -0.965631, 3.278412, 0, 0, 1, 1, 1,
0.4362252, 0.3244594, -0.8896031, 1, 0, 0, 1, 1,
0.4436884, -1.51667, 3.602154, 1, 0, 0, 1, 1,
0.4450138, -0.7334289, 2.768022, 1, 0, 0, 1, 1,
0.4495002, 1.229774, 1.235977, 1, 0, 0, 1, 1,
0.4508946, -1.714359, 4.020623, 1, 0, 0, 1, 1,
0.4525603, -1.087171, 3.098626, 0, 0, 0, 1, 1,
0.4534876, 1.171277, -0.7327033, 0, 0, 0, 1, 1,
0.4547372, -0.2538326, 1.613575, 0, 0, 0, 1, 1,
0.4555723, -0.9564397, 1.437451, 0, 0, 0, 1, 1,
0.4580345, 0.8246514, 0.2104832, 0, 0, 0, 1, 1,
0.4630376, 0.2148794, -0.8846784, 0, 0, 0, 1, 1,
0.4630958, 0.09316318, 0.2642667, 0, 0, 0, 1, 1,
0.4707918, 1.47633, 0.7770528, 1, 1, 1, 1, 1,
0.4724573, 0.4737337, 0.09785197, 1, 1, 1, 1, 1,
0.4726481, -0.2466038, 0.9372966, 1, 1, 1, 1, 1,
0.4762738, 2.175318, -0.5459916, 1, 1, 1, 1, 1,
0.4789618, 0.167567, 1.041246, 1, 1, 1, 1, 1,
0.4797191, -0.6529524, 2.157699, 1, 1, 1, 1, 1,
0.4830007, -0.1882459, 2.527128, 1, 1, 1, 1, 1,
0.4840139, 0.2590255, 0.03836246, 1, 1, 1, 1, 1,
0.4865876, 1.34789, -0.5518662, 1, 1, 1, 1, 1,
0.4872385, -0.3450219, 3.009457, 1, 1, 1, 1, 1,
0.4942116, 1.554409, -0.08232709, 1, 1, 1, 1, 1,
0.4943586, -0.1181887, 1.694646, 1, 1, 1, 1, 1,
0.4978099, 0.2591428, 1.57823, 1, 1, 1, 1, 1,
0.5045311, -0.3431092, 2.947705, 1, 1, 1, 1, 1,
0.5145476, 0.5023816, 0.2255758, 1, 1, 1, 1, 1,
0.5163575, 1.428806, 0.5548833, 0, 0, 1, 1, 1,
0.5183958, 0.2694546, -0.4009729, 1, 0, 0, 1, 1,
0.5219709, 0.288674, 1.429417, 1, 0, 0, 1, 1,
0.5274302, 1.146413, 0.422971, 1, 0, 0, 1, 1,
0.5305779, 0.07184496, -0.3220523, 1, 0, 0, 1, 1,
0.5333742, -0.1085081, -0.08500631, 1, 0, 0, 1, 1,
0.5338641, 0.6151795, -0.6928223, 0, 0, 0, 1, 1,
0.537051, -0.7367302, 3.697709, 0, 0, 0, 1, 1,
0.5396585, 0.3153326, 1.942582, 0, 0, 0, 1, 1,
0.5454496, 0.2036356, 0.6765118, 0, 0, 0, 1, 1,
0.5474768, 2.517417, -1.122643, 0, 0, 0, 1, 1,
0.5485744, 0.6235318, -1.336648, 0, 0, 0, 1, 1,
0.5517295, 0.4776411, 1.440921, 0, 0, 0, 1, 1,
0.5535033, 2.46652, 0.1125896, 1, 1, 1, 1, 1,
0.5568935, -1.336165, 1.503029, 1, 1, 1, 1, 1,
0.5585481, -0.3937953, 2.383324, 1, 1, 1, 1, 1,
0.5689356, 0.3289281, 1.879632, 1, 1, 1, 1, 1,
0.5694104, -0.7100934, 2.230672, 1, 1, 1, 1, 1,
0.5696473, -0.7935142, 1.772011, 1, 1, 1, 1, 1,
0.5711871, -0.7430321, 2.08644, 1, 1, 1, 1, 1,
0.571786, -0.44794, 2.758975, 1, 1, 1, 1, 1,
0.5743237, -0.7570756, 1.567704, 1, 1, 1, 1, 1,
0.5816107, 0.9277163, -0.1923622, 1, 1, 1, 1, 1,
0.5818738, -0.522327, 0.389946, 1, 1, 1, 1, 1,
0.5837241, -0.327193, 2.548325, 1, 1, 1, 1, 1,
0.5856411, -0.4722419, 0.7954092, 1, 1, 1, 1, 1,
0.5906411, 0.9705315, 1.726863, 1, 1, 1, 1, 1,
0.5937504, -0.1345108, 1.577034, 1, 1, 1, 1, 1,
0.593837, -0.4459537, 4.79187, 0, 0, 1, 1, 1,
0.5965144, 1.626859, -0.07971324, 1, 0, 0, 1, 1,
0.5974899, 0.02823411, 1.5209, 1, 0, 0, 1, 1,
0.5987512, -1.386098, 2.963083, 1, 0, 0, 1, 1,
0.5987561, -0.6200318, 2.812966, 1, 0, 0, 1, 1,
0.6073781, -0.469173, 2.752606, 1, 0, 0, 1, 1,
0.6077445, -0.4753394, 1.379909, 0, 0, 0, 1, 1,
0.6134383, 0.3085126, -0.667043, 0, 0, 0, 1, 1,
0.6144573, -0.9344977, 3.294617, 0, 0, 0, 1, 1,
0.6164525, -0.8533765, 2.043903, 0, 0, 0, 1, 1,
0.6185738, 0.7106636, 0.226687, 0, 0, 0, 1, 1,
0.6202155, -0.7321862, 2.522915, 0, 0, 0, 1, 1,
0.6253754, -0.1856268, 1.610705, 0, 0, 0, 1, 1,
0.6272434, -0.5185191, 1.060237, 1, 1, 1, 1, 1,
0.634314, -0.02723623, -0.2740382, 1, 1, 1, 1, 1,
0.6364198, 0.8035542, 0.4072686, 1, 1, 1, 1, 1,
0.6480296, 0.6657757, -0.6511295, 1, 1, 1, 1, 1,
0.6483319, -0.8353925, 1.943573, 1, 1, 1, 1, 1,
0.6520492, -1.745449, 2.042039, 1, 1, 1, 1, 1,
0.657223, 1.101388, 2.413659, 1, 1, 1, 1, 1,
0.6653758, -1.687347, 2.254894, 1, 1, 1, 1, 1,
0.667363, -0.2495587, 1.16333, 1, 1, 1, 1, 1,
0.6742137, 0.5778317, 0.05789921, 1, 1, 1, 1, 1,
0.6777343, -0.6203244, 1.579324, 1, 1, 1, 1, 1,
0.6785175, -0.1947508, 3.224817, 1, 1, 1, 1, 1,
0.6837379, -0.1481799, 1.869717, 1, 1, 1, 1, 1,
0.6843559, -0.4890204, 0.6110432, 1, 1, 1, 1, 1,
0.6865364, 0.1492354, 2.423182, 1, 1, 1, 1, 1,
0.6876779, 0.2840295, 2.844997, 0, 0, 1, 1, 1,
0.6880044, 0.5537657, 1.430492, 1, 0, 0, 1, 1,
0.6909618, 0.4020959, 2.241831, 1, 0, 0, 1, 1,
0.6952643, 0.9586363, 1.738073, 1, 0, 0, 1, 1,
0.7002484, -1.131496, 2.565652, 1, 0, 0, 1, 1,
0.7027205, -1.459325, 1.48445, 1, 0, 0, 1, 1,
0.7091343, -0.502821, 1.286734, 0, 0, 0, 1, 1,
0.7110106, 0.221933, 0.2047387, 0, 0, 0, 1, 1,
0.7129098, -1.121428, 3.750143, 0, 0, 0, 1, 1,
0.7241772, -0.7439269, 1.696827, 0, 0, 0, 1, 1,
0.7244702, 1.729305, 0.8225222, 0, 0, 0, 1, 1,
0.7285566, -0.7010621, 2.1075, 0, 0, 0, 1, 1,
0.730993, 1.715861, -0.6185962, 0, 0, 0, 1, 1,
0.7323043, 0.2824679, 1.915958, 1, 1, 1, 1, 1,
0.732486, -1.349738, 1.526866, 1, 1, 1, 1, 1,
0.7388184, 0.2273049, 0.5819936, 1, 1, 1, 1, 1,
0.7396597, -1.086386, 3.104478, 1, 1, 1, 1, 1,
0.7417238, 0.1380713, 1.317548, 1, 1, 1, 1, 1,
0.741903, 0.1396216, 1.032647, 1, 1, 1, 1, 1,
0.749334, 1.033375, 0.7302811, 1, 1, 1, 1, 1,
0.7655456, 0.771821, 0.4122786, 1, 1, 1, 1, 1,
0.7674233, -1.470359, 1.610773, 1, 1, 1, 1, 1,
0.7679448, -0.582619, 1.710028, 1, 1, 1, 1, 1,
0.7739502, -0.2830468, 3.180154, 1, 1, 1, 1, 1,
0.7774258, -1.203956, 3.847678, 1, 1, 1, 1, 1,
0.7818735, 0.6273045, 1.799047, 1, 1, 1, 1, 1,
0.7819012, 1.346252, -0.7510973, 1, 1, 1, 1, 1,
0.7833509, -0.3786994, 3.59757, 1, 1, 1, 1, 1,
0.7944493, 1.502165, -0.8894082, 0, 0, 1, 1, 1,
0.7964163, -1.667232, 1.550585, 1, 0, 0, 1, 1,
0.7973099, -1.243211, 2.147403, 1, 0, 0, 1, 1,
0.8078554, 1.242674, 1.704377, 1, 0, 0, 1, 1,
0.8086572, 0.1074807, 1.718869, 1, 0, 0, 1, 1,
0.8099244, -0.8133472, 2.213415, 1, 0, 0, 1, 1,
0.8104235, -0.9923758, 3.69309, 0, 0, 0, 1, 1,
0.8125332, -0.1166531, 2.361951, 0, 0, 0, 1, 1,
0.8136696, -0.0563758, 3.07529, 0, 0, 0, 1, 1,
0.8144103, 1.447814, 1.060694, 0, 0, 0, 1, 1,
0.818795, -0.09993745, 2.030391, 0, 0, 0, 1, 1,
0.8203743, 0.5130754, 0.7091756, 0, 0, 0, 1, 1,
0.8208519, -0.690672, 1.053252, 0, 0, 0, 1, 1,
0.8213118, 0.7256277, 1.216423, 1, 1, 1, 1, 1,
0.8239745, 0.9334526, -0.02169971, 1, 1, 1, 1, 1,
0.824048, -1.049255, 2.544014, 1, 1, 1, 1, 1,
0.8290717, -0.3424785, 2.444255, 1, 1, 1, 1, 1,
0.8364568, 1.759588, -0.4956324, 1, 1, 1, 1, 1,
0.8382072, 0.3187705, -0.02110782, 1, 1, 1, 1, 1,
0.8442411, -0.9864321, 3.15559, 1, 1, 1, 1, 1,
0.8517581, -0.5060155, 0.9557727, 1, 1, 1, 1, 1,
0.8533067, -1.666415, 3.271605, 1, 1, 1, 1, 1,
0.8642087, 0.04297679, 2.186149, 1, 1, 1, 1, 1,
0.8650655, -0.1267983, 3.113221, 1, 1, 1, 1, 1,
0.8677617, 0.1092794, 3.556229, 1, 1, 1, 1, 1,
0.8710005, 0.5004455, 0.1842209, 1, 1, 1, 1, 1,
0.8787923, 0.1801074, 3.228682, 1, 1, 1, 1, 1,
0.8819271, 3.276016, -0.1902983, 1, 1, 1, 1, 1,
0.8865713, -2.091302, 1.194808, 0, 0, 1, 1, 1,
0.8870077, 0.174496, 1.315651, 1, 0, 0, 1, 1,
0.890521, -0.06422735, 3.919669, 1, 0, 0, 1, 1,
0.8913977, -0.7719732, 2.447416, 1, 0, 0, 1, 1,
0.8986279, -0.6263145, 0.9365435, 1, 0, 0, 1, 1,
0.8992755, 0.4547351, 3.679779, 1, 0, 0, 1, 1,
0.9011567, -0.2459943, 1.925382, 0, 0, 0, 1, 1,
0.9051445, -0.600372, 1.833802, 0, 0, 0, 1, 1,
0.9054269, -1.773215, 2.955745, 0, 0, 0, 1, 1,
0.9094334, -0.5791913, 1.589542, 0, 0, 0, 1, 1,
0.9217936, 0.7431033, -1.222692, 0, 0, 0, 1, 1,
0.9325897, 0.797688, -0.2788198, 0, 0, 0, 1, 1,
0.9337023, -0.1908916, 1.815178, 0, 0, 0, 1, 1,
0.93648, 1.087868, 0.2184853, 1, 1, 1, 1, 1,
0.9470413, 0.5656401, 0.8057145, 1, 1, 1, 1, 1,
0.9532243, -1.446105, 3.661922, 1, 1, 1, 1, 1,
0.9534566, 0.0907373, 1.060113, 1, 1, 1, 1, 1,
0.9591659, -0.863561, 2.442191, 1, 1, 1, 1, 1,
0.9664496, 0.01428165, 2.388292, 1, 1, 1, 1, 1,
0.9724377, 0.773555, 1.369093, 1, 1, 1, 1, 1,
0.9735587, -0.1343092, 1.297837, 1, 1, 1, 1, 1,
0.980538, -1.878814, 2.553926, 1, 1, 1, 1, 1,
0.9824063, -0.3272519, 0.3008422, 1, 1, 1, 1, 1,
0.9888226, -0.06739423, 1.86368, 1, 1, 1, 1, 1,
0.9949892, 0.1014635, 0.3712054, 1, 1, 1, 1, 1,
0.9981503, 0.7196058, 1.052007, 1, 1, 1, 1, 1,
0.9983972, 1.358371, 0.9054882, 1, 1, 1, 1, 1,
1.001429, -0.2484794, 3.265268, 1, 1, 1, 1, 1,
1.004276, 0.4404878, 0.2199069, 0, 0, 1, 1, 1,
1.00525, 0.8641462, 0.9815683, 1, 0, 0, 1, 1,
1.009284, 0.8324273, 1.444437, 1, 0, 0, 1, 1,
1.016075, 0.6753099, 3.610532, 1, 0, 0, 1, 1,
1.017377, -1.353468, 1.70073, 1, 0, 0, 1, 1,
1.0179, 0.009708335, 2.380567, 1, 0, 0, 1, 1,
1.018394, -1.293908, 1.127286, 0, 0, 0, 1, 1,
1.018815, 0.3916333, 2.298477, 0, 0, 0, 1, 1,
1.022377, 0.5594894, 0.8677939, 0, 0, 0, 1, 1,
1.024645, -0.450532, 2.792497, 0, 0, 0, 1, 1,
1.027776, -1.254769, 0.5490413, 0, 0, 0, 1, 1,
1.028089, 0.6030455, 0.2179599, 0, 0, 0, 1, 1,
1.031739, -0.7349483, 1.219815, 0, 0, 0, 1, 1,
1.035435, -0.4831049, 1.907217, 1, 1, 1, 1, 1,
1.046054, -0.5634053, 3.422981, 1, 1, 1, 1, 1,
1.049611, -0.7917522, 2.745059, 1, 1, 1, 1, 1,
1.053156, 0.07446913, 2.066471, 1, 1, 1, 1, 1,
1.053173, 0.3666217, 2.20514, 1, 1, 1, 1, 1,
1.054077, -1.765392, 2.554689, 1, 1, 1, 1, 1,
1.055168, -0.4498331, 1.751681, 1, 1, 1, 1, 1,
1.066913, 0.7886021, -0.1188433, 1, 1, 1, 1, 1,
1.067993, 0.02573833, 2.134522, 1, 1, 1, 1, 1,
1.073474, 0.3877539, 2.255374, 1, 1, 1, 1, 1,
1.074931, 0.2402354, 1.536731, 1, 1, 1, 1, 1,
1.086892, 0.5802518, 2.754239, 1, 1, 1, 1, 1,
1.094724, -0.4673184, 2.981507, 1, 1, 1, 1, 1,
1.09483, -2.870617, 3.659672, 1, 1, 1, 1, 1,
1.097115, -0.7611113, 3.339569, 1, 1, 1, 1, 1,
1.110855, -0.4502125, 2.526897, 0, 0, 1, 1, 1,
1.113785, -0.5909024, 1.277183, 1, 0, 0, 1, 1,
1.114457, -0.2558225, -1.24393, 1, 0, 0, 1, 1,
1.117242, 0.0477954, 0.05191098, 1, 0, 0, 1, 1,
1.119984, 0.2204926, 3.267795, 1, 0, 0, 1, 1,
1.120817, 0.5682268, 1.628263, 1, 0, 0, 1, 1,
1.132809, 0.1395218, 1.15258, 0, 0, 0, 1, 1,
1.13636, 0.7609726, 2.404566, 0, 0, 0, 1, 1,
1.139576, 0.2830482, 0.2067001, 0, 0, 0, 1, 1,
1.140934, 0.1992287, 1.743873, 0, 0, 0, 1, 1,
1.141828, 0.5780952, 2.357224, 0, 0, 0, 1, 1,
1.150288, -1.546821, 1.990454, 0, 0, 0, 1, 1,
1.150974, -1.226587, 2.750924, 0, 0, 0, 1, 1,
1.153306, 1.045994, -1.840117, 1, 1, 1, 1, 1,
1.168715, 0.4018809, 3.14277, 1, 1, 1, 1, 1,
1.182008, 0.5428682, 0.8401061, 1, 1, 1, 1, 1,
1.185779, -0.5907285, 3.282057, 1, 1, 1, 1, 1,
1.189291, 0.05972437, 0.7948421, 1, 1, 1, 1, 1,
1.19461, 0.4775749, 0.463811, 1, 1, 1, 1, 1,
1.196993, -0.05204827, 2.592969, 1, 1, 1, 1, 1,
1.200038, -0.7864075, 1.501683, 1, 1, 1, 1, 1,
1.203489, -0.7726061, 2.222663, 1, 1, 1, 1, 1,
1.204524, 0.1542787, 0.3390281, 1, 1, 1, 1, 1,
1.206098, -0.9448735, 4.153875, 1, 1, 1, 1, 1,
1.207061, 0.4338964, 0.7783393, 1, 1, 1, 1, 1,
1.227332, 0.3997583, 0.6892927, 1, 1, 1, 1, 1,
1.23227, 2.05578, 0.6540086, 1, 1, 1, 1, 1,
1.23304, 0.9958344, 1.607838, 1, 1, 1, 1, 1,
1.242891, -1.159351, 2.356448, 0, 0, 1, 1, 1,
1.245906, 0.03866611, 2.833277, 1, 0, 0, 1, 1,
1.246781, 0.6857241, -0.1677049, 1, 0, 0, 1, 1,
1.254315, 0.5173212, -0.02168373, 1, 0, 0, 1, 1,
1.254821, -0.3105244, 1.876985, 1, 0, 0, 1, 1,
1.258913, -0.07053862, 1.415345, 1, 0, 0, 1, 1,
1.265099, -1.383791, 2.508151, 0, 0, 0, 1, 1,
1.274194, 0.8656319, -0.2253085, 0, 0, 0, 1, 1,
1.285192, -0.1265346, 1.588614, 0, 0, 0, 1, 1,
1.287439, 1.035083, 0.3398225, 0, 0, 0, 1, 1,
1.297763, 1.224417, 2.936916, 0, 0, 0, 1, 1,
1.306522, 0.2273083, -0.5941797, 0, 0, 0, 1, 1,
1.314616, 0.6482182, 0.6385547, 0, 0, 0, 1, 1,
1.333762, 0.6202561, 0.5977128, 1, 1, 1, 1, 1,
1.334787, -0.731424, 1.144892, 1, 1, 1, 1, 1,
1.33919, -1.640152, 3.002252, 1, 1, 1, 1, 1,
1.345236, 0.2028624, 3.109529, 1, 1, 1, 1, 1,
1.347322, 1.483263, 1.566132, 1, 1, 1, 1, 1,
1.347476, 0.1085797, 2.367683, 1, 1, 1, 1, 1,
1.34772, -0.3192945, 3.60376, 1, 1, 1, 1, 1,
1.349577, -0.4269312, 3.487042, 1, 1, 1, 1, 1,
1.361792, -0.1466374, 0.476652, 1, 1, 1, 1, 1,
1.368215, -2.064115, 1.349234, 1, 1, 1, 1, 1,
1.374489, 1.148661, 3.258704, 1, 1, 1, 1, 1,
1.377494, 0.03843004, 2.24642, 1, 1, 1, 1, 1,
1.380646, -0.0107546, 0.8283868, 1, 1, 1, 1, 1,
1.383598, -0.8876534, 1.05447, 1, 1, 1, 1, 1,
1.389373, 0.252076, -0.3711908, 1, 1, 1, 1, 1,
1.397858, -0.2256513, 3.098865, 0, 0, 1, 1, 1,
1.41956, -2.875594, 2.748494, 1, 0, 0, 1, 1,
1.427938, 0.7413443, 1.584305, 1, 0, 0, 1, 1,
1.434244, -1.30268, 3.232236, 1, 0, 0, 1, 1,
1.436453, 2.286053, 1.472883, 1, 0, 0, 1, 1,
1.452446, -0.4513654, 1.703363, 1, 0, 0, 1, 1,
1.454801, -0.2858488, 0.289657, 0, 0, 0, 1, 1,
1.463618, 0.304948, 2.197312, 0, 0, 0, 1, 1,
1.464291, 0.1949612, 1.317253, 0, 0, 0, 1, 1,
1.483173, 0.1203979, 2.065064, 0, 0, 0, 1, 1,
1.498407, -1.363619, 2.328148, 0, 0, 0, 1, 1,
1.528479, -0.04598427, 2.482701, 0, 0, 0, 1, 1,
1.5406, -2.889796, 3.903003, 0, 0, 0, 1, 1,
1.541977, 2.504693, 0.6739058, 1, 1, 1, 1, 1,
1.544057, -0.8827948, 2.64657, 1, 1, 1, 1, 1,
1.556611, -0.7540835, 1.056633, 1, 1, 1, 1, 1,
1.566003, -0.8546283, 3.007811, 1, 1, 1, 1, 1,
1.584666, 0.8183693, 0.4241022, 1, 1, 1, 1, 1,
1.58759, -0.4134101, 2.116981, 1, 1, 1, 1, 1,
1.601576, 0.1020778, -0.1369644, 1, 1, 1, 1, 1,
1.602133, 0.0005640519, 1.62794, 1, 1, 1, 1, 1,
1.618929, 0.2797755, -0.8452526, 1, 1, 1, 1, 1,
1.624778, 0.7184982, 0.6662867, 1, 1, 1, 1, 1,
1.625304, -1.940145, 2.134613, 1, 1, 1, 1, 1,
1.629764, -1.656096, 3.036726, 1, 1, 1, 1, 1,
1.633134, 0.002321309, 1.103813, 1, 1, 1, 1, 1,
1.637273, 1.635966, 2.222133, 1, 1, 1, 1, 1,
1.641918, 1.140682, 1.772544, 1, 1, 1, 1, 1,
1.647696, -0.09001575, 2.004595, 0, 0, 1, 1, 1,
1.663317, -1.515143, 2.420892, 1, 0, 0, 1, 1,
1.665439, 0.2715033, 0.8062314, 1, 0, 0, 1, 1,
1.680339, -1.159684, 2.9784, 1, 0, 0, 1, 1,
1.694352, -0.4354356, 1.428492, 1, 0, 0, 1, 1,
1.707335, 0.08545247, 0.180407, 1, 0, 0, 1, 1,
1.712013, 1.495806, 0.2805945, 0, 0, 0, 1, 1,
1.716737, 0.6587781, 2.530166, 0, 0, 0, 1, 1,
1.720905, 0.7249413, 1.296228, 0, 0, 0, 1, 1,
1.736131, 0.5090041, 0.5671408, 0, 0, 0, 1, 1,
1.753551, 0.9236409, 1.176492, 0, 0, 0, 1, 1,
1.765077, -1.06934, 3.497498, 0, 0, 0, 1, 1,
1.777787, 0.1068394, -0.1704794, 0, 0, 0, 1, 1,
1.792404, 0.3052503, 1.467909, 1, 1, 1, 1, 1,
1.795951, 1.117564, 2.302008, 1, 1, 1, 1, 1,
1.825179, -0.2069285, 1.140007, 1, 1, 1, 1, 1,
1.841228, -0.3448636, 1.45341, 1, 1, 1, 1, 1,
1.869343, -0.2988242, 1.991543, 1, 1, 1, 1, 1,
1.873288, -0.4935713, 1.851453, 1, 1, 1, 1, 1,
1.874294, 0.04613973, 2.153018, 1, 1, 1, 1, 1,
1.882667, -1.499644, 2.379583, 1, 1, 1, 1, 1,
1.907601, 0.7282814, 1.187042, 1, 1, 1, 1, 1,
1.918642, -1.104676, 2.539266, 1, 1, 1, 1, 1,
1.919351, -1.859096, 2.756073, 1, 1, 1, 1, 1,
1.936935, 0.3344739, -0.1429133, 1, 1, 1, 1, 1,
1.984323, -0.4924143, 0.6801671, 1, 1, 1, 1, 1,
2.046905, 0.2014278, 1.800805, 1, 1, 1, 1, 1,
2.049509, -0.7181814, 2.580145, 1, 1, 1, 1, 1,
2.057573, -0.4581406, 1.90043, 0, 0, 1, 1, 1,
2.098884, -0.2371786, 3.012764, 1, 0, 0, 1, 1,
2.102018, -0.846321, 2.15318, 1, 0, 0, 1, 1,
2.110726, 0.6690878, 1.396795, 1, 0, 0, 1, 1,
2.116725, 1.029977, 1.85783, 1, 0, 0, 1, 1,
2.153887, -0.2314737, -0.2221678, 1, 0, 0, 1, 1,
2.216612, -0.3052136, 1.881942, 0, 0, 0, 1, 1,
2.217528, 0.8621573, 1.881652, 0, 0, 0, 1, 1,
2.298687, 0.3501563, 1.824292, 0, 0, 0, 1, 1,
2.32059, -0.7604306, 1.098023, 0, 0, 0, 1, 1,
2.321698, -1.305189, 2.193838, 0, 0, 0, 1, 1,
2.347883, 0.4902542, 0.7780303, 0, 0, 0, 1, 1,
2.354569, -1.86009, 0.3411711, 0, 0, 0, 1, 1,
2.403811, 1.719272, -0.3830862, 1, 1, 1, 1, 1,
2.451138, 0.2956589, 0.1819888, 1, 1, 1, 1, 1,
2.521417, -0.7177124, 3.409344, 1, 1, 1, 1, 1,
2.557408, 0.5638781, 1.907239, 1, 1, 1, 1, 1,
2.597262, 0.4295473, -0.5063823, 1, 1, 1, 1, 1,
2.849159, -1.937767, 1.850775, 1, 1, 1, 1, 1,
3.192729, 1.05636, 2.961894, 1, 1, 1, 1, 1
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
var radius = 9.950681;
var distance = 34.95135;
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
mvMatrix.translate( 0.1112671, 0.4733102, 0.4255667 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.95135);
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
