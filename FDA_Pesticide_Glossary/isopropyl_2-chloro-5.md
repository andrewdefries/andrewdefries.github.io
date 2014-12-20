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
-3.076533, -0.06080081, -2.847406, 1, 0, 0, 1,
-2.929937, 1.853164, -1.839218, 1, 0.007843138, 0, 1,
-2.8808, 1.425689, 0.09903745, 1, 0.01176471, 0, 1,
-2.830445, 0.9922404, -0.3200429, 1, 0.01960784, 0, 1,
-2.825594, 0.689285, -2.656224, 1, 0.02352941, 0, 1,
-2.815063, -1.132993, 0.6280537, 1, 0.03137255, 0, 1,
-2.812696, 0.4560017, -1.163585, 1, 0.03529412, 0, 1,
-2.805668, -0.06151976, -1.028755, 1, 0.04313726, 0, 1,
-2.610406, 1.491626, -0.9688582, 1, 0.04705882, 0, 1,
-2.542683, -0.1782353, -1.669919, 1, 0.05490196, 0, 1,
-2.534671, 1.141749, -0.5226511, 1, 0.05882353, 0, 1,
-2.51308, -0.5418186, -3.243922, 1, 0.06666667, 0, 1,
-2.497746, -0.887763, -2.406747, 1, 0.07058824, 0, 1,
-2.401559, 0.7442322, -1.036072, 1, 0.07843138, 0, 1,
-2.398959, 0.1218615, -1.193984, 1, 0.08235294, 0, 1,
-2.385946, -0.9727651, -1.6403, 1, 0.09019608, 0, 1,
-2.36894, 0.3649362, -2.434246, 1, 0.09411765, 0, 1,
-2.354846, 0.4631873, 0.05932166, 1, 0.1019608, 0, 1,
-2.349735, -0.7337291, -2.207034, 1, 0.1098039, 0, 1,
-2.262229, 0.1221801, -2.189713, 1, 0.1137255, 0, 1,
-2.259592, -1.391751, -2.666164, 1, 0.1215686, 0, 1,
-2.254713, 0.3255545, -3.710943, 1, 0.1254902, 0, 1,
-2.222665, 0.7147096, -1.188401, 1, 0.1333333, 0, 1,
-2.18204, -0.481978, -1.836398, 1, 0.1372549, 0, 1,
-2.173952, 0.8447279, -1.333667, 1, 0.145098, 0, 1,
-2.172289, 1.609433, -1.567417, 1, 0.1490196, 0, 1,
-2.139696, -1.164355, -1.278873, 1, 0.1568628, 0, 1,
-2.121609, 0.9411861, -1.547965, 1, 0.1607843, 0, 1,
-2.115099, 1.516739, -1.324805, 1, 0.1686275, 0, 1,
-2.088111, -0.1149018, -2.023544, 1, 0.172549, 0, 1,
-2.042141, -0.3587601, -1.677752, 1, 0.1803922, 0, 1,
-2.014897, 0.5979815, -1.350208, 1, 0.1843137, 0, 1,
-1.993674, 2.095543, 1.101418, 1, 0.1921569, 0, 1,
-1.964097, 0.2562967, -0.5884299, 1, 0.1960784, 0, 1,
-1.91145, -0.5269272, -2.094941, 1, 0.2039216, 0, 1,
-1.909462, -0.7551388, 0.374932, 1, 0.2117647, 0, 1,
-1.904916, 0.5730514, -0.5392579, 1, 0.2156863, 0, 1,
-1.898893, -0.5251932, -1.640977, 1, 0.2235294, 0, 1,
-1.860184, -0.1853177, 0.001354505, 1, 0.227451, 0, 1,
-1.827912, -0.7464253, -1.21446, 1, 0.2352941, 0, 1,
-1.817539, -0.1229437, -0.8505237, 1, 0.2392157, 0, 1,
-1.817252, 1.026591, -0.4218181, 1, 0.2470588, 0, 1,
-1.796772, 0.7503633, -2.145359, 1, 0.2509804, 0, 1,
-1.794182, -1.498589, -2.730762, 1, 0.2588235, 0, 1,
-1.768244, -0.4209122, -2.837649, 1, 0.2627451, 0, 1,
-1.754684, 0.5497983, -1.948936, 1, 0.2705882, 0, 1,
-1.75348, -0.3174354, -1.753286, 1, 0.2745098, 0, 1,
-1.749344, 0.7306055, -2.654313, 1, 0.282353, 0, 1,
-1.742419, 0.6258733, -2.690572, 1, 0.2862745, 0, 1,
-1.728248, 0.9227043, -1.632798, 1, 0.2941177, 0, 1,
-1.72488, -0.3398552, -0.5584407, 1, 0.3019608, 0, 1,
-1.702932, 0.853515, -1.035155, 1, 0.3058824, 0, 1,
-1.6983, 0.5997839, -0.9736074, 1, 0.3137255, 0, 1,
-1.691042, 0.3346468, -0.7557297, 1, 0.3176471, 0, 1,
-1.6894, 0.1050662, -0.0009062373, 1, 0.3254902, 0, 1,
-1.686376, -0.2375005, -2.250215, 1, 0.3294118, 0, 1,
-1.68474, 1.268268, -2.04393, 1, 0.3372549, 0, 1,
-1.650024, 0.8751562, 0.2593229, 1, 0.3411765, 0, 1,
-1.647881, -0.9699941, -0.7594311, 1, 0.3490196, 0, 1,
-1.645193, -1.456502, -0.4870266, 1, 0.3529412, 0, 1,
-1.643749, -0.04343184, -1.204998, 1, 0.3607843, 0, 1,
-1.626793, 1.360227, -0.6661344, 1, 0.3647059, 0, 1,
-1.625411, 1.627703, 0.7438613, 1, 0.372549, 0, 1,
-1.624186, 0.15124, 0.6523838, 1, 0.3764706, 0, 1,
-1.622422, 1.056027, -1.746402, 1, 0.3843137, 0, 1,
-1.618678, 0.8703584, -2.202512, 1, 0.3882353, 0, 1,
-1.607773, 1.001057, -1.312641, 1, 0.3960784, 0, 1,
-1.605306, -0.9496177, -3.3753, 1, 0.4039216, 0, 1,
-1.603515, -0.2174055, -1.320141, 1, 0.4078431, 0, 1,
-1.599125, -0.3210835, -2.166283, 1, 0.4156863, 0, 1,
-1.591571, 0.4912405, -1.56637, 1, 0.4196078, 0, 1,
-1.58379, 0.4102675, -1.213389, 1, 0.427451, 0, 1,
-1.578825, 1.634924, -1.431953, 1, 0.4313726, 0, 1,
-1.570094, -0.715327, -1.170111, 1, 0.4392157, 0, 1,
-1.560399, -1.224666, -0.2810701, 1, 0.4431373, 0, 1,
-1.539212, -1.129688, -1.743762, 1, 0.4509804, 0, 1,
-1.519065, -0.4520497, -2.834069, 1, 0.454902, 0, 1,
-1.511025, -0.2374154, -0.951126, 1, 0.4627451, 0, 1,
-1.495403, -0.5763797, -1.739306, 1, 0.4666667, 0, 1,
-1.493364, -1.739125, -4.315868, 1, 0.4745098, 0, 1,
-1.488671, 0.4170478, -1.40258, 1, 0.4784314, 0, 1,
-1.471599, 0.07378241, -0.3630256, 1, 0.4862745, 0, 1,
-1.46979, 0.8683184, -0.7867265, 1, 0.4901961, 0, 1,
-1.438416, 0.2979162, -1.067072, 1, 0.4980392, 0, 1,
-1.428088, 1.110397, -0.6256953, 1, 0.5058824, 0, 1,
-1.417024, 0.7709691, -0.8884937, 1, 0.509804, 0, 1,
-1.410804, 0.7314704, -2.351255, 1, 0.5176471, 0, 1,
-1.401364, 0.2547631, -2.457364, 1, 0.5215687, 0, 1,
-1.396693, -1.101027, -3.115036, 1, 0.5294118, 0, 1,
-1.393005, 2.507684, 1.788972, 1, 0.5333334, 0, 1,
-1.389114, -1.30715, -3.743892, 1, 0.5411765, 0, 1,
-1.376549, -0.3182571, -1.938651, 1, 0.5450981, 0, 1,
-1.37144, -0.4704447, -1.889703, 1, 0.5529412, 0, 1,
-1.35262, 0.1863493, -1.705137, 1, 0.5568628, 0, 1,
-1.35155, 0.3775512, -1.078085, 1, 0.5647059, 0, 1,
-1.351229, -1.293927, -4.069695, 1, 0.5686275, 0, 1,
-1.345509, 1.54386, -0.1056957, 1, 0.5764706, 0, 1,
-1.340777, -0.5621951, -2.090093, 1, 0.5803922, 0, 1,
-1.324269, -0.7933507, -1.370025, 1, 0.5882353, 0, 1,
-1.315943, -0.7559282, -3.601063, 1, 0.5921569, 0, 1,
-1.312901, -1.436593, -0.9069293, 1, 0.6, 0, 1,
-1.299161, 1.181801, -1.971869, 1, 0.6078432, 0, 1,
-1.294813, -0.9675481, -1.693088, 1, 0.6117647, 0, 1,
-1.29399, 1.54748, 0.4032854, 1, 0.6196079, 0, 1,
-1.290131, -1.008161, -1.211897, 1, 0.6235294, 0, 1,
-1.283285, 3.643039e-05, -0.2390105, 1, 0.6313726, 0, 1,
-1.279522, -0.2978965, -1.495482, 1, 0.6352941, 0, 1,
-1.264409, 0.8447262, 0.0005471886, 1, 0.6431373, 0, 1,
-1.261215, 1.265531, -0.667466, 1, 0.6470588, 0, 1,
-1.256451, 0.1087558, -1.957199, 1, 0.654902, 0, 1,
-1.254858, 1.17295, -1.810917, 1, 0.6588235, 0, 1,
-1.25455, -0.3194332, -1.132576, 1, 0.6666667, 0, 1,
-1.249269, -1.395841, -3.626807, 1, 0.6705883, 0, 1,
-1.244168, 0.6770372, -1.587455, 1, 0.6784314, 0, 1,
-1.237977, 1.198097, -1.994662, 1, 0.682353, 0, 1,
-1.233336, -0.03453846, -1.465947, 1, 0.6901961, 0, 1,
-1.232132, 0.8827263, 0.2632916, 1, 0.6941177, 0, 1,
-1.218711, 0.4962569, 0.2910895, 1, 0.7019608, 0, 1,
-1.216121, 1.403293, -1.090823, 1, 0.7098039, 0, 1,
-1.213283, 0.6284802, -3.466037, 1, 0.7137255, 0, 1,
-1.210545, 1.092201, -1.048536, 1, 0.7215686, 0, 1,
-1.209082, -0.7484909, -1.930591, 1, 0.7254902, 0, 1,
-1.201596, 1.919481, -0.8680321, 1, 0.7333333, 0, 1,
-1.19523, -0.6948873, -3.67816, 1, 0.7372549, 0, 1,
-1.193412, 0.6500266, -0.79716, 1, 0.7450981, 0, 1,
-1.180941, -0.318762, -2.750736, 1, 0.7490196, 0, 1,
-1.179553, 0.4348321, -3.265586, 1, 0.7568628, 0, 1,
-1.177386, 1.176523, -1.423925, 1, 0.7607843, 0, 1,
-1.175742, 0.5994558, -1.303025, 1, 0.7686275, 0, 1,
-1.173341, -0.4829208, -2.729836, 1, 0.772549, 0, 1,
-1.16693, -0.1907534, -2.791589, 1, 0.7803922, 0, 1,
-1.163764, 1.173963, -0.7726295, 1, 0.7843137, 0, 1,
-1.157987, -0.457065, -3.364928, 1, 0.7921569, 0, 1,
-1.148892, 1.194, -0.7065279, 1, 0.7960784, 0, 1,
-1.148188, -0.1445873, -0.976558, 1, 0.8039216, 0, 1,
-1.145932, -0.3490743, -3.272609, 1, 0.8117647, 0, 1,
-1.132657, -1.597419, -3.767712, 1, 0.8156863, 0, 1,
-1.13167, 0.1912254, -0.8885019, 1, 0.8235294, 0, 1,
-1.126522, -0.01434643, -3.274929, 1, 0.827451, 0, 1,
-1.125108, 0.1202306, -3.209876, 1, 0.8352941, 0, 1,
-1.117633, -1.163349, -2.890795, 1, 0.8392157, 0, 1,
-1.113626, 0.451542, 0.4156365, 1, 0.8470588, 0, 1,
-1.111444, -0.3394209, -2.146129, 1, 0.8509804, 0, 1,
-1.111092, 0.9493845, -2.066177, 1, 0.8588235, 0, 1,
-1.104449, -0.1333452, -0.6764359, 1, 0.8627451, 0, 1,
-1.103296, -0.3267978, -2.026093, 1, 0.8705882, 0, 1,
-1.100593, 0.1743514, -2.034328, 1, 0.8745098, 0, 1,
-1.088089, -0.5246098, 0.1109787, 1, 0.8823529, 0, 1,
-1.087227, -0.1249886, -0.1271027, 1, 0.8862745, 0, 1,
-1.086339, -1.141947, -2.764656, 1, 0.8941177, 0, 1,
-1.083254, 1.091473, -1.128712, 1, 0.8980392, 0, 1,
-1.076737, 1.333933, -0.8489434, 1, 0.9058824, 0, 1,
-1.06463, -0.7805774, -2.598371, 1, 0.9137255, 0, 1,
-1.063576, -0.5098177, -1.499538, 1, 0.9176471, 0, 1,
-1.054955, 0.411464, -0.7178282, 1, 0.9254902, 0, 1,
-1.046289, 0.6299128, -1.697789, 1, 0.9294118, 0, 1,
-1.041703, -0.9749516, -1.737402, 1, 0.9372549, 0, 1,
-1.039889, -1.484541, -2.661448, 1, 0.9411765, 0, 1,
-1.03962, 0.3280438, -0.2283848, 1, 0.9490196, 0, 1,
-1.034834, 0.1939866, -0.8061242, 1, 0.9529412, 0, 1,
-1.033699, 0.7649505, -0.4600835, 1, 0.9607843, 0, 1,
-1.033364, 0.3442718, 0.1626324, 1, 0.9647059, 0, 1,
-1.032779, -0.6107396, -1.485048, 1, 0.972549, 0, 1,
-1.031564, -1.708888, -2.997182, 1, 0.9764706, 0, 1,
-1.029592, -0.02049231, -1.417874, 1, 0.9843137, 0, 1,
-1.029488, -1.629749, -1.735378, 1, 0.9882353, 0, 1,
-1.029173, 0.2560485, -1.682359, 1, 0.9960784, 0, 1,
-1.020608, -1.084244, -2.898863, 0.9960784, 1, 0, 1,
-1.014686, 0.5495469, 0.5613425, 0.9921569, 1, 0, 1,
-1.014502, -1.501491, -2.124727, 0.9843137, 1, 0, 1,
-1.009819, -0.5130146, -3.415127, 0.9803922, 1, 0, 1,
-1.007461, -1.202725, -3.837718, 0.972549, 1, 0, 1,
-1.00271, -1.018966, -2.11074, 0.9686275, 1, 0, 1,
-1.002483, 0.2234241, -1.147768, 0.9607843, 1, 0, 1,
-0.9999829, -1.380032, -1.428085, 0.9568627, 1, 0, 1,
-0.9992885, -1.817608, -3.013649, 0.9490196, 1, 0, 1,
-0.9922679, 1.330056, -1.515885, 0.945098, 1, 0, 1,
-0.9823461, -1.071319, -3.149343, 0.9372549, 1, 0, 1,
-0.9810308, 0.7546872, -0.8248721, 0.9333333, 1, 0, 1,
-0.969074, -0.2840455, -1.691987, 0.9254902, 1, 0, 1,
-0.9674309, -1.845573, -4.846475, 0.9215686, 1, 0, 1,
-0.965504, -0.7288864, -2.852526, 0.9137255, 1, 0, 1,
-0.9633295, -0.07735971, -2.088436, 0.9098039, 1, 0, 1,
-0.9623665, 0.7818639, -0.6656214, 0.9019608, 1, 0, 1,
-0.9611521, -1.022253, -2.51791, 0.8941177, 1, 0, 1,
-0.9605445, 0.582159, -1.127642, 0.8901961, 1, 0, 1,
-0.9552883, -0.240279, -0.5981658, 0.8823529, 1, 0, 1,
-0.9521525, 0.9166059, -0.4679583, 0.8784314, 1, 0, 1,
-0.9516225, -1.006547, -3.508132, 0.8705882, 1, 0, 1,
-0.9465932, -0.3939904, -2.442608, 0.8666667, 1, 0, 1,
-0.9465277, -0.6784346, -2.378904, 0.8588235, 1, 0, 1,
-0.9388014, 1.227197, -3.569048, 0.854902, 1, 0, 1,
-0.9334033, -0.6693245, -2.173362, 0.8470588, 1, 0, 1,
-0.9267394, -1.081087, -1.941614, 0.8431373, 1, 0, 1,
-0.9232392, -0.8473785, -1.971759, 0.8352941, 1, 0, 1,
-0.9229679, -0.217387, -3.39298, 0.8313726, 1, 0, 1,
-0.9203398, -0.1716446, -2.672482, 0.8235294, 1, 0, 1,
-0.9168342, -0.1738905, -1.252488, 0.8196079, 1, 0, 1,
-0.9158764, 1.418012, 0.4613685, 0.8117647, 1, 0, 1,
-0.913869, 0.1701675, -2.698392, 0.8078431, 1, 0, 1,
-0.9137967, 0.3631231, -1.459845, 0.8, 1, 0, 1,
-0.9089007, 0.9129008, -1.141653, 0.7921569, 1, 0, 1,
-0.9014764, 0.7225714, -0.0188832, 0.7882353, 1, 0, 1,
-0.8984413, 1.281072, -1.805164, 0.7803922, 1, 0, 1,
-0.8963335, 0.1938065, -1.676386, 0.7764706, 1, 0, 1,
-0.8951876, -1.452469, -1.838875, 0.7686275, 1, 0, 1,
-0.8927611, -1.036237, -2.497886, 0.7647059, 1, 0, 1,
-0.8760591, -0.987444, -1.738841, 0.7568628, 1, 0, 1,
-0.8739411, -0.1881155, -0.5108067, 0.7529412, 1, 0, 1,
-0.8720809, -0.9199625, -1.780836, 0.7450981, 1, 0, 1,
-0.8711306, 0.7711374, -0.2133547, 0.7411765, 1, 0, 1,
-0.8669421, -1.109545, -3.461374, 0.7333333, 1, 0, 1,
-0.8611858, -0.1923321, -0.572569, 0.7294118, 1, 0, 1,
-0.859328, 0.3977021, -0.9792057, 0.7215686, 1, 0, 1,
-0.8588371, -1.673247, -3.107622, 0.7176471, 1, 0, 1,
-0.8506218, 0.6347986, -0.6515905, 0.7098039, 1, 0, 1,
-0.850376, -0.07434694, -0.2873736, 0.7058824, 1, 0, 1,
-0.8481057, -0.3528057, -0.8431207, 0.6980392, 1, 0, 1,
-0.8361493, -0.5751856, -2.932897, 0.6901961, 1, 0, 1,
-0.8338755, -0.5984394, -1.792186, 0.6862745, 1, 0, 1,
-0.829974, -2.087561, -2.126392, 0.6784314, 1, 0, 1,
-0.8288503, 0.4671097, -2.34471, 0.6745098, 1, 0, 1,
-0.817067, 1.291501, 0.3213373, 0.6666667, 1, 0, 1,
-0.8169966, -1.051934, -2.351785, 0.6627451, 1, 0, 1,
-0.8160667, 0.1040626, -2.291514, 0.654902, 1, 0, 1,
-0.8150049, -0.8924875, -4.952173, 0.6509804, 1, 0, 1,
-0.8148376, -1.015297, -2.140806, 0.6431373, 1, 0, 1,
-0.81474, 0.2616324, -0.813512, 0.6392157, 1, 0, 1,
-0.8079758, 0.8105584, -1.421911, 0.6313726, 1, 0, 1,
-0.8062164, -1.102385, -3.568168, 0.627451, 1, 0, 1,
-0.7922298, 0.6022685, -1.351065, 0.6196079, 1, 0, 1,
-0.7891965, 0.8386049, -1.881783, 0.6156863, 1, 0, 1,
-0.7862272, -0.3284194, -3.497891, 0.6078432, 1, 0, 1,
-0.7790955, -0.5500217, -1.12452, 0.6039216, 1, 0, 1,
-0.77398, 0.820959, 0.5811789, 0.5960785, 1, 0, 1,
-0.7727557, -0.3290879, -3.312004, 0.5882353, 1, 0, 1,
-0.7702219, -1.018358, -1.619752, 0.5843138, 1, 0, 1,
-0.7657194, -0.7853432, -2.669167, 0.5764706, 1, 0, 1,
-0.756916, 0.2048368, -0.3539031, 0.572549, 1, 0, 1,
-0.7567461, 1.35519, -0.6760339, 0.5647059, 1, 0, 1,
-0.7566156, -0.8742387, -2.127237, 0.5607843, 1, 0, 1,
-0.7538414, 0.3285041, -2.005789, 0.5529412, 1, 0, 1,
-0.7535986, 0.3737397, -1.666119, 0.5490196, 1, 0, 1,
-0.7527836, 0.3550946, -1.241798, 0.5411765, 1, 0, 1,
-0.7457522, 2.438481, -0.6752604, 0.5372549, 1, 0, 1,
-0.7330068, 2.553033, 0.6609187, 0.5294118, 1, 0, 1,
-0.7325328, 0.1330979, -0.9382287, 0.5254902, 1, 0, 1,
-0.7216091, 1.653582, -0.51364, 0.5176471, 1, 0, 1,
-0.7209833, 1.068185, -0.5981237, 0.5137255, 1, 0, 1,
-0.7202789, 0.1667386, -1.731159, 0.5058824, 1, 0, 1,
-0.7193035, 0.7775234, -2.708896, 0.5019608, 1, 0, 1,
-0.7169946, 1.161331, -0.4572586, 0.4941176, 1, 0, 1,
-0.7163382, 0.2790101, -0.232982, 0.4862745, 1, 0, 1,
-0.7150192, 1.866927, 0.2302489, 0.4823529, 1, 0, 1,
-0.7142093, -0.5000036, -2.433032, 0.4745098, 1, 0, 1,
-0.7131277, -0.172762, -0.3419716, 0.4705882, 1, 0, 1,
-0.7122166, 0.3215277, -1.362204, 0.4627451, 1, 0, 1,
-0.6928005, 0.8358706, -0.6081824, 0.4588235, 1, 0, 1,
-0.6881402, 0.1306997, -2.008853, 0.4509804, 1, 0, 1,
-0.6865708, -0.9493114, -2.430549, 0.4470588, 1, 0, 1,
-0.683504, 1.223634, -2.21203, 0.4392157, 1, 0, 1,
-0.6801506, 0.2010747, -3.373194, 0.4352941, 1, 0, 1,
-0.679344, 0.3225516, -1.00367, 0.427451, 1, 0, 1,
-0.6783636, -0.3212453, -3.189102, 0.4235294, 1, 0, 1,
-0.6746093, 1.892748, -0.3439391, 0.4156863, 1, 0, 1,
-0.6745611, -0.2025064, -2.353084, 0.4117647, 1, 0, 1,
-0.6745121, -0.049692, -0.5994233, 0.4039216, 1, 0, 1,
-0.6740617, -1.301864, -2.102444, 0.3960784, 1, 0, 1,
-0.6726653, 1.159784, 0.1828982, 0.3921569, 1, 0, 1,
-0.6721827, -0.7739216, -2.888941, 0.3843137, 1, 0, 1,
-0.670971, -1.56599, -1.554549, 0.3803922, 1, 0, 1,
-0.6701574, 0.1282796, -1.331586, 0.372549, 1, 0, 1,
-0.6687887, -1.100914, -2.803039, 0.3686275, 1, 0, 1,
-0.6679065, 0.2162449, -2.895689, 0.3607843, 1, 0, 1,
-0.661804, -1.502232, -2.575945, 0.3568628, 1, 0, 1,
-0.6602841, 0.2122144, -1.188421, 0.3490196, 1, 0, 1,
-0.6599538, -0.9720001, -3.331633, 0.345098, 1, 0, 1,
-0.6549889, 1.466775, -0.5763847, 0.3372549, 1, 0, 1,
-0.6531679, 0.3005717, -1.486181, 0.3333333, 1, 0, 1,
-0.6527551, -0.1149417, -2.367162, 0.3254902, 1, 0, 1,
-0.6525588, 0.6813896, -0.4655691, 0.3215686, 1, 0, 1,
-0.6481007, -1.447427, -2.336537, 0.3137255, 1, 0, 1,
-0.6462772, -0.4808045, -3.281428, 0.3098039, 1, 0, 1,
-0.6432667, 0.2874235, -1.372786, 0.3019608, 1, 0, 1,
-0.6422867, 1.565973, -1.615811, 0.2941177, 1, 0, 1,
-0.6402856, 0.2521889, -1.831737, 0.2901961, 1, 0, 1,
-0.6392261, -0.6632909, -4.388188, 0.282353, 1, 0, 1,
-0.636735, -0.2903292, -1.894968, 0.2784314, 1, 0, 1,
-0.6336985, -1.165901, -0.8184804, 0.2705882, 1, 0, 1,
-0.6335627, 0.0963451, -1.840928, 0.2666667, 1, 0, 1,
-0.6315112, -0.4180709, -2.225342, 0.2588235, 1, 0, 1,
-0.6297379, -0.1204323, -1.909629, 0.254902, 1, 0, 1,
-0.6294231, 0.1657397, -1.35405, 0.2470588, 1, 0, 1,
-0.6281316, 0.2674831, -0.7918018, 0.2431373, 1, 0, 1,
-0.6272424, -1.059751, -2.282599, 0.2352941, 1, 0, 1,
-0.62383, 0.009667719, -2.70111, 0.2313726, 1, 0, 1,
-0.6205003, 1.339777, -0.3696337, 0.2235294, 1, 0, 1,
-0.619548, -1.240916, -2.138193, 0.2196078, 1, 0, 1,
-0.618951, -2.222623, -1.937205, 0.2117647, 1, 0, 1,
-0.6184827, 0.1539354, -2.937092, 0.2078431, 1, 0, 1,
-0.6147051, 0.3212872, -2.287343, 0.2, 1, 0, 1,
-0.6140698, -1.246209, -1.826437, 0.1921569, 1, 0, 1,
-0.6132785, 1.695628, 1.289173, 0.1882353, 1, 0, 1,
-0.6121145, -1.765149, -1.539745, 0.1803922, 1, 0, 1,
-0.6118472, 0.3014656, -1.638575, 0.1764706, 1, 0, 1,
-0.6106461, -0.3019341, -1.893228, 0.1686275, 1, 0, 1,
-0.6082625, 0.1615886, -1.077764, 0.1647059, 1, 0, 1,
-0.6073506, -1.196182, -1.893819, 0.1568628, 1, 0, 1,
-0.6039855, -0.3644865, -3.02851, 0.1529412, 1, 0, 1,
-0.5967295, -0.7917759, -2.830654, 0.145098, 1, 0, 1,
-0.5944021, 0.1043171, -1.796508, 0.1411765, 1, 0, 1,
-0.592259, -0.9911474, -2.221693, 0.1333333, 1, 0, 1,
-0.5890446, 0.5662386, -0.02878479, 0.1294118, 1, 0, 1,
-0.5878471, 0.5412248, -0.8317367, 0.1215686, 1, 0, 1,
-0.5864601, 1.002063, -1.999578, 0.1176471, 1, 0, 1,
-0.5833732, -0.9027998, -3.898995, 0.1098039, 1, 0, 1,
-0.5807076, -1.160148, -4.387194, 0.1058824, 1, 0, 1,
-0.5773943, 0.3235067, -1.914521, 0.09803922, 1, 0, 1,
-0.5762377, 1.102128, -2.615939, 0.09019608, 1, 0, 1,
-0.5757192, -1.065637, -2.436983, 0.08627451, 1, 0, 1,
-0.5715507, 1.133333, -0.6172085, 0.07843138, 1, 0, 1,
-0.5627635, 0.8029255, 0.4234902, 0.07450981, 1, 0, 1,
-0.5613995, 0.7655793, 0.2576591, 0.06666667, 1, 0, 1,
-0.5609304, -1.515683, -4.162459, 0.0627451, 1, 0, 1,
-0.5577968, -0.2371103, -3.167061, 0.05490196, 1, 0, 1,
-0.5568436, -0.5495821, -2.428701, 0.05098039, 1, 0, 1,
-0.5557341, -0.8426139, -1.121187, 0.04313726, 1, 0, 1,
-0.5503432, -0.1242947, -0.3634592, 0.03921569, 1, 0, 1,
-0.5500957, -1.592725, -2.540945, 0.03137255, 1, 0, 1,
-0.5495639, 0.1415612, -1.115442, 0.02745098, 1, 0, 1,
-0.5481652, -1.751261, -2.560917, 0.01960784, 1, 0, 1,
-0.5453656, -1.242265, -1.820286, 0.01568628, 1, 0, 1,
-0.5453567, 0.3010647, -0.9795362, 0.007843138, 1, 0, 1,
-0.5439719, -1.65545, -1.901693, 0.003921569, 1, 0, 1,
-0.5423695, 1.051268, 1.156976, 0, 1, 0.003921569, 1,
-0.5410733, -1.137051, -2.916705, 0, 1, 0.01176471, 1,
-0.5404724, 0.01927015, -2.108625, 0, 1, 0.01568628, 1,
-0.5323249, -0.128089, -2.11233, 0, 1, 0.02352941, 1,
-0.5319964, -0.8110487, -2.987857, 0, 1, 0.02745098, 1,
-0.5286077, -1.050785, -4.06392, 0, 1, 0.03529412, 1,
-0.526437, 0.6511089, -0.2924536, 0, 1, 0.03921569, 1,
-0.524489, 0.8959976, -0.08341338, 0, 1, 0.04705882, 1,
-0.5223474, 0.5431758, -0.8051004, 0, 1, 0.05098039, 1,
-0.514599, 0.4346632, -0.9636779, 0, 1, 0.05882353, 1,
-0.5093537, -0.3437126, -1.859879, 0, 1, 0.0627451, 1,
-0.5018744, 1.222412, 0.4796942, 0, 1, 0.07058824, 1,
-0.4989219, -0.2565198, -2.543921, 0, 1, 0.07450981, 1,
-0.4952096, 0.9046351, 0.3230668, 0, 1, 0.08235294, 1,
-0.4931999, -1.437991, -3.009383, 0, 1, 0.08627451, 1,
-0.4900467, -1.483308, -2.983179, 0, 1, 0.09411765, 1,
-0.4881945, -0.6466002, -2.241075, 0, 1, 0.1019608, 1,
-0.4874208, -0.787439, -3.056954, 0, 1, 0.1058824, 1,
-0.4827806, -0.9555991, -3.401555, 0, 1, 0.1137255, 1,
-0.4804448, 0.0729503, -1.239859, 0, 1, 0.1176471, 1,
-0.4796046, -0.440304, -2.513288, 0, 1, 0.1254902, 1,
-0.4751872, -0.5366639, -2.107416, 0, 1, 0.1294118, 1,
-0.4730596, -0.6294042, -4.612842, 0, 1, 0.1372549, 1,
-0.4672461, 1.499018, -0.350098, 0, 1, 0.1411765, 1,
-0.4620522, -1.221945, -3.015841, 0, 1, 0.1490196, 1,
-0.4584193, -1.396186, -2.053413, 0, 1, 0.1529412, 1,
-0.4534195, 0.00227294, -1.943572, 0, 1, 0.1607843, 1,
-0.4467203, -0.08878972, -2.187345, 0, 1, 0.1647059, 1,
-0.4387017, 0.2414751, -0.750838, 0, 1, 0.172549, 1,
-0.4380856, 0.1123707, -1.751431, 0, 1, 0.1764706, 1,
-0.4341607, -1.116683, -3.326558, 0, 1, 0.1843137, 1,
-0.4210814, -0.4500689, -1.803394, 0, 1, 0.1882353, 1,
-0.4195556, -0.2843044, -2.170568, 0, 1, 0.1960784, 1,
-0.4190328, -0.02997723, -1.424783, 0, 1, 0.2039216, 1,
-0.4180924, 0.4820399, 1.036132, 0, 1, 0.2078431, 1,
-0.416491, 1.305843, 0.4348015, 0, 1, 0.2156863, 1,
-0.4142989, -0.3863257, -1.845716, 0, 1, 0.2196078, 1,
-0.4115188, -0.1481078, -2.670046, 0, 1, 0.227451, 1,
-0.4088511, -0.3198569, -3.096475, 0, 1, 0.2313726, 1,
-0.4073359, 0.9015273, -0.01958975, 0, 1, 0.2392157, 1,
-0.4046039, -1.782796, -2.772907, 0, 1, 0.2431373, 1,
-0.4044609, 0.6297559, -0.06652977, 0, 1, 0.2509804, 1,
-0.4032998, -0.002097845, -1.467847, 0, 1, 0.254902, 1,
-0.3984951, -0.03684482, -1.997305, 0, 1, 0.2627451, 1,
-0.3968688, -0.5751422, -2.969529, 0, 1, 0.2666667, 1,
-0.396701, -0.008053312, -0.8588067, 0, 1, 0.2745098, 1,
-0.3922505, 0.6015338, -1.655485, 0, 1, 0.2784314, 1,
-0.3915803, -0.2794969, -2.190495, 0, 1, 0.2862745, 1,
-0.3884418, -0.8003889, -3.276454, 0, 1, 0.2901961, 1,
-0.3827996, -2.011872, -3.717091, 0, 1, 0.2980392, 1,
-0.3821545, -0.5692307, -1.350154, 0, 1, 0.3058824, 1,
-0.3811308, 0.4312274, -0.3337893, 0, 1, 0.3098039, 1,
-0.3803588, -1.742125, -3.526891, 0, 1, 0.3176471, 1,
-0.3775555, -1.226874, -4.158556, 0, 1, 0.3215686, 1,
-0.3773684, 0.7305688, 0.1176957, 0, 1, 0.3294118, 1,
-0.3746099, -2.211736, -3.202618, 0, 1, 0.3333333, 1,
-0.3687569, -0.3885316, -1.79163, 0, 1, 0.3411765, 1,
-0.3670213, 1.439659, 0.8312582, 0, 1, 0.345098, 1,
-0.3653538, -0.106558, -1.459183, 0, 1, 0.3529412, 1,
-0.3600492, 1.006744, -2.367134, 0, 1, 0.3568628, 1,
-0.3575196, -0.9900916, -0.1448921, 0, 1, 0.3647059, 1,
-0.3476549, 1.030742, -0.4622086, 0, 1, 0.3686275, 1,
-0.3468516, 0.5187645, -0.09064432, 0, 1, 0.3764706, 1,
-0.3436354, -0.8615094, -1.18217, 0, 1, 0.3803922, 1,
-0.340692, 0.2799122, -2.32468, 0, 1, 0.3882353, 1,
-0.3361716, 0.7847294, -1.033661, 0, 1, 0.3921569, 1,
-0.3327464, -0.7723728, -1.189169, 0, 1, 0.4, 1,
-0.3282858, 0.4323722, 0.6324337, 0, 1, 0.4078431, 1,
-0.3255305, -0.04584524, -1.838309, 0, 1, 0.4117647, 1,
-0.3149233, -1.702309, -3.781862, 0, 1, 0.4196078, 1,
-0.3138982, 0.007914195, -1.721922, 0, 1, 0.4235294, 1,
-0.312911, -1.486763, -2.960987, 0, 1, 0.4313726, 1,
-0.3122075, 0.9474106, -0.8538217, 0, 1, 0.4352941, 1,
-0.3035212, 1.005159, -1.370536, 0, 1, 0.4431373, 1,
-0.3032678, 1.643091, -0.1857801, 0, 1, 0.4470588, 1,
-0.3031785, 0.2653445, -2.250076, 0, 1, 0.454902, 1,
-0.3014309, -0.006335886, -1.58147, 0, 1, 0.4588235, 1,
-0.3008683, 1.319455, -0.7005835, 0, 1, 0.4666667, 1,
-0.2993282, 0.1754845, -1.101355, 0, 1, 0.4705882, 1,
-0.2982949, 0.3114054, -0.3388472, 0, 1, 0.4784314, 1,
-0.295787, 0.747491, 0.7153351, 0, 1, 0.4823529, 1,
-0.2929541, -0.9958342, -2.669137, 0, 1, 0.4901961, 1,
-0.2879495, 0.1025172, -0.6594952, 0, 1, 0.4941176, 1,
-0.2867385, -1.553842, -2.079621, 0, 1, 0.5019608, 1,
-0.2828009, 0.9886998, -1.919691, 0, 1, 0.509804, 1,
-0.2758419, -0.04932304, -1.54667, 0, 1, 0.5137255, 1,
-0.2742479, 1.669006, -1.636535, 0, 1, 0.5215687, 1,
-0.2689422, -0.5796618, -3.966739, 0, 1, 0.5254902, 1,
-0.2685557, 1.220599, -1.950511, 0, 1, 0.5333334, 1,
-0.2669529, -0.9438555, -5.106095, 0, 1, 0.5372549, 1,
-0.260503, -0.6402377, -1.732862, 0, 1, 0.5450981, 1,
-0.2599399, -0.02266549, -0.8211269, 0, 1, 0.5490196, 1,
-0.2540972, -0.553793, -3.448292, 0, 1, 0.5568628, 1,
-0.2443722, 0.4391409, -1.098728, 0, 1, 0.5607843, 1,
-0.2418537, 1.832622, -0.4499345, 0, 1, 0.5686275, 1,
-0.2376458, 0.06032325, -0.3075334, 0, 1, 0.572549, 1,
-0.2333376, -2.272092, -4.058323, 0, 1, 0.5803922, 1,
-0.2292406, 0.8220644, 0.1501293, 0, 1, 0.5843138, 1,
-0.2278493, 0.2540242, -0.6109331, 0, 1, 0.5921569, 1,
-0.225493, -0.9646134, -1.695986, 0, 1, 0.5960785, 1,
-0.2228238, 1.199783, 0.8142589, 0, 1, 0.6039216, 1,
-0.220277, -0.2882532, -0.6783244, 0, 1, 0.6117647, 1,
-0.2142007, 1.302694, 2.293915, 0, 1, 0.6156863, 1,
-0.2114413, 0.1492004, -1.701503, 0, 1, 0.6235294, 1,
-0.2089223, 1.535196, -0.5520006, 0, 1, 0.627451, 1,
-0.208436, 1.118064, -1.367252, 0, 1, 0.6352941, 1,
-0.201106, 0.2418538, -0.9884786, 0, 1, 0.6392157, 1,
-0.1967974, 2.171966, 0.3830288, 0, 1, 0.6470588, 1,
-0.1963166, -0.04236974, -3.176841, 0, 1, 0.6509804, 1,
-0.1962461, -1.295969, -2.240613, 0, 1, 0.6588235, 1,
-0.1954429, 1.545873, -1.193413, 0, 1, 0.6627451, 1,
-0.1913502, -1.848478, -4.282293, 0, 1, 0.6705883, 1,
-0.1902845, -0.9426858, -3.768675, 0, 1, 0.6745098, 1,
-0.1705029, -0.01500781, -3.939689, 0, 1, 0.682353, 1,
-0.1702682, 0.2391898, -0.8210739, 0, 1, 0.6862745, 1,
-0.1569802, 0.2384835, -1.345374, 0, 1, 0.6941177, 1,
-0.1566225, 0.3998488, 0.4689994, 0, 1, 0.7019608, 1,
-0.1543281, 1.862586, -0.9486679, 0, 1, 0.7058824, 1,
-0.1531726, -1.660177, -1.039918, 0, 1, 0.7137255, 1,
-0.1528127, -0.04764073, -2.264342, 0, 1, 0.7176471, 1,
-0.1505092, 0.9262216, -1.096858, 0, 1, 0.7254902, 1,
-0.1487761, 0.7484483, 0.2933575, 0, 1, 0.7294118, 1,
-0.1483582, 0.07130522, -0.9066612, 0, 1, 0.7372549, 1,
-0.1481814, 0.008500767, -0.5394598, 0, 1, 0.7411765, 1,
-0.1447058, -0.08942451, -3.13191, 0, 1, 0.7490196, 1,
-0.1440806, 1.263954, -1.713672, 0, 1, 0.7529412, 1,
-0.1395688, 0.8185841, 0.7415391, 0, 1, 0.7607843, 1,
-0.1369356, 1.130434, -1.580477, 0, 1, 0.7647059, 1,
-0.1366166, -0.448962, -2.298508, 0, 1, 0.772549, 1,
-0.1357379, 0.5339456, -0.5395814, 0, 1, 0.7764706, 1,
-0.1351812, 0.5496212, -0.08842874, 0, 1, 0.7843137, 1,
-0.1317582, 1.138233, -2.14912, 0, 1, 0.7882353, 1,
-0.1310932, -1.369067, -3.065721, 0, 1, 0.7960784, 1,
-0.1286062, 0.3739542, -1.141018, 0, 1, 0.8039216, 1,
-0.1215506, 0.3537189, 1.037903, 0, 1, 0.8078431, 1,
-0.1143411, -0.3084451, -3.090736, 0, 1, 0.8156863, 1,
-0.1127853, -0.9599144, -3.437673, 0, 1, 0.8196079, 1,
-0.1117557, 0.04398775, -0.8325011, 0, 1, 0.827451, 1,
-0.1077888, -2.303061, -3.190833, 0, 1, 0.8313726, 1,
-0.1054035, 0.1872237, -0.1247767, 0, 1, 0.8392157, 1,
-0.1051, 0.4659147, 0.01238938, 0, 1, 0.8431373, 1,
-0.1026411, 2.122212, -0.4473172, 0, 1, 0.8509804, 1,
-0.1022227, -0.4802099, -3.090153, 0, 1, 0.854902, 1,
-0.1013787, -1.252498, -2.58459, 0, 1, 0.8627451, 1,
-0.09655952, 0.6196837, -0.4486562, 0, 1, 0.8666667, 1,
-0.09397671, -1.739781, -2.983243, 0, 1, 0.8745098, 1,
-0.08679592, 0.7830292, 2.567204, 0, 1, 0.8784314, 1,
-0.07758427, -0.4748881, -1.456858, 0, 1, 0.8862745, 1,
-0.07577055, 1.16161, 0.1597313, 0, 1, 0.8901961, 1,
-0.07428458, -0.0009190437, -0.4425049, 0, 1, 0.8980392, 1,
-0.07417835, 0.7567134, 1.164448, 0, 1, 0.9058824, 1,
-0.07395041, 2.350745, -1.682501, 0, 1, 0.9098039, 1,
-0.07384125, 1.102271, -0.4606394, 0, 1, 0.9176471, 1,
-0.06717255, 0.7530261, -0.814675, 0, 1, 0.9215686, 1,
-0.06711712, 0.5086378, -0.4447059, 0, 1, 0.9294118, 1,
-0.06381609, -0.03720092, -2.861969, 0, 1, 0.9333333, 1,
-0.05876901, -0.1285304, -3.11293, 0, 1, 0.9411765, 1,
-0.05729467, 0.4334224, -0.4069988, 0, 1, 0.945098, 1,
-0.05576244, 1.404959, 0.1691475, 0, 1, 0.9529412, 1,
-0.05417106, -0.2881092, -1.212104, 0, 1, 0.9568627, 1,
-0.05270192, -0.90704, -1.310211, 0, 1, 0.9647059, 1,
-0.05255753, 0.6072987, -1.176861, 0, 1, 0.9686275, 1,
-0.04952386, 0.5498054, -0.6973389, 0, 1, 0.9764706, 1,
-0.04843559, -0.4123937, -3.289707, 0, 1, 0.9803922, 1,
-0.04708139, -0.1850643, -0.342135, 0, 1, 0.9882353, 1,
-0.04500674, -0.6128738, -4.038743, 0, 1, 0.9921569, 1,
-0.04002003, 0.814025, 0.7415249, 0, 1, 1, 1,
-0.03706885, -0.3383288, -3.249594, 0, 0.9921569, 1, 1,
-0.03535068, -0.7499349, -2.753052, 0, 0.9882353, 1, 1,
-0.03532395, -1.129732, -4.971144, 0, 0.9803922, 1, 1,
-0.03405379, 1.57384, 1.072723, 0, 0.9764706, 1, 1,
-0.03379593, 0.7492623, 0.8308978, 0, 0.9686275, 1, 1,
-0.03139909, -1.451562, -4.5275, 0, 0.9647059, 1, 1,
-0.02900514, 0.3280682, 0.1933318, 0, 0.9568627, 1, 1,
-0.02799191, -0.7881278, -2.694888, 0, 0.9529412, 1, 1,
-0.02505342, -0.1849722, -3.95272, 0, 0.945098, 1, 1,
-0.02476543, 0.354033, 0.1550705, 0, 0.9411765, 1, 1,
-0.02172152, -0.3129365, -4.997266, 0, 0.9333333, 1, 1,
-0.02078169, -0.5890688, -3.534804, 0, 0.9294118, 1, 1,
-0.01942909, 0.08805236, -1.039406, 0, 0.9215686, 1, 1,
-0.01912169, -0.1022929, -2.466661, 0, 0.9176471, 1, 1,
-0.01821732, 0.1518514, 0.05322187, 0, 0.9098039, 1, 1,
-0.01730453, -0.2643943, -3.759248, 0, 0.9058824, 1, 1,
-0.01368709, 0.9230315, 0.8451809, 0, 0.8980392, 1, 1,
-0.0006793404, -0.3355272, -3.716175, 0, 0.8901961, 1, 1,
0.002535179, 0.3055162, -0.02800642, 0, 0.8862745, 1, 1,
0.009864238, -1.668029, 3.439625, 0, 0.8784314, 1, 1,
0.0099369, 0.3200896, 0.5373827, 0, 0.8745098, 1, 1,
0.01061668, -1.07233, 2.780008, 0, 0.8666667, 1, 1,
0.01393147, -1.715919, 1.988991, 0, 0.8627451, 1, 1,
0.02077971, -1.375254, 1.393633, 0, 0.854902, 1, 1,
0.03361768, 1.983464, -0.4017831, 0, 0.8509804, 1, 1,
0.03466426, -0.5199049, 1.334787, 0, 0.8431373, 1, 1,
0.03851883, -1.67752, 2.855083, 0, 0.8392157, 1, 1,
0.04246655, -1.147602, 2.518109, 0, 0.8313726, 1, 1,
0.04408734, -0.9610578, 2.23858, 0, 0.827451, 1, 1,
0.045745, -0.2104554, 1.927091, 0, 0.8196079, 1, 1,
0.04682683, -0.475694, 2.994937, 0, 0.8156863, 1, 1,
0.04718421, 1.255857, 0.3509661, 0, 0.8078431, 1, 1,
0.0511599, -0.2004822, 2.611414, 0, 0.8039216, 1, 1,
0.05418193, 1.153604, 1.073547, 0, 0.7960784, 1, 1,
0.05920861, -0.1418539, 2.211619, 0, 0.7882353, 1, 1,
0.06276413, 0.04208654, 1.990762, 0, 0.7843137, 1, 1,
0.06583854, -1.379901, 3.346753, 0, 0.7764706, 1, 1,
0.06770588, -0.5621611, 3.892967, 0, 0.772549, 1, 1,
0.0801965, -1.142012, 2.494731, 0, 0.7647059, 1, 1,
0.08129591, -2.260551, 4.017506, 0, 0.7607843, 1, 1,
0.08213973, 0.1147416, 2.403882, 0, 0.7529412, 1, 1,
0.0834527, 0.8255542, 1.000193, 0, 0.7490196, 1, 1,
0.08563004, 2.208858, -1.192671, 0, 0.7411765, 1, 1,
0.0895782, -0.360664, 3.266756, 0, 0.7372549, 1, 1,
0.09373379, -0.2677166, 3.539696, 0, 0.7294118, 1, 1,
0.0952941, 0.09717339, -0.7846364, 0, 0.7254902, 1, 1,
0.09536232, 0.9468413, -0.5865312, 0, 0.7176471, 1, 1,
0.106831, 0.4490893, -0.8465163, 0, 0.7137255, 1, 1,
0.1085944, 2.782082, 0.161772, 0, 0.7058824, 1, 1,
0.1095668, 0.227843, 0.09670777, 0, 0.6980392, 1, 1,
0.1101342, 0.5830938, -0.658718, 0, 0.6941177, 1, 1,
0.1157571, -0.4759273, 3.348791, 0, 0.6862745, 1, 1,
0.1179585, 0.8128268, 0.1282942, 0, 0.682353, 1, 1,
0.1206223, -0.0630495, 0.5495274, 0, 0.6745098, 1, 1,
0.1218377, -0.1881687, 1.420638, 0, 0.6705883, 1, 1,
0.1232163, 0.4003001, 1.784938, 0, 0.6627451, 1, 1,
0.1259098, -0.4920614, 3.966178, 0, 0.6588235, 1, 1,
0.1264667, 1.151258, -0.1521674, 0, 0.6509804, 1, 1,
0.1272593, -0.751544, 2.921564, 0, 0.6470588, 1, 1,
0.1370091, 2.207709, -0.1733406, 0, 0.6392157, 1, 1,
0.1407245, -0.0492559, 0.7988302, 0, 0.6352941, 1, 1,
0.1420495, -0.02183924, 0.1734939, 0, 0.627451, 1, 1,
0.1451992, 0.5703849, -0.6991698, 0, 0.6235294, 1, 1,
0.1452628, 0.4072103, 0.3388599, 0, 0.6156863, 1, 1,
0.1491241, -0.1657428, 3.341908, 0, 0.6117647, 1, 1,
0.1496762, -1.341864, 2.222697, 0, 0.6039216, 1, 1,
0.1499508, 1.370381, 0.4353425, 0, 0.5960785, 1, 1,
0.1606174, 0.2375551, 1.350225, 0, 0.5921569, 1, 1,
0.1623261, 1.227186, 0.9715499, 0, 0.5843138, 1, 1,
0.1641544, 1.005854, 1.288214, 0, 0.5803922, 1, 1,
0.1721916, -1.347065, 1.618045, 0, 0.572549, 1, 1,
0.1722072, -1.858494, 2.820183, 0, 0.5686275, 1, 1,
0.1754293, 0.710061, 2.263788, 0, 0.5607843, 1, 1,
0.1779056, -0.4747851, 3.20866, 0, 0.5568628, 1, 1,
0.1839248, 0.7654203, 0.5842797, 0, 0.5490196, 1, 1,
0.1863762, 1.012044, -0.9414598, 0, 0.5450981, 1, 1,
0.1880817, -1.142398, 2.332716, 0, 0.5372549, 1, 1,
0.195718, -0.06988835, 2.920344, 0, 0.5333334, 1, 1,
0.1966682, -0.2961632, 2.94281, 0, 0.5254902, 1, 1,
0.2030671, 1.054474, -0.9954284, 0, 0.5215687, 1, 1,
0.2046493, 0.955128, -0.6352622, 0, 0.5137255, 1, 1,
0.2069642, 0.3300099, 0.1694307, 0, 0.509804, 1, 1,
0.212462, 0.9741877, 0.2968931, 0, 0.5019608, 1, 1,
0.2148023, -0.2429377, 2.817675, 0, 0.4941176, 1, 1,
0.2149445, -1.822847, 3.073261, 0, 0.4901961, 1, 1,
0.2178847, 0.7290187, 0.1633085, 0, 0.4823529, 1, 1,
0.2179774, 2.099833, 0.4709617, 0, 0.4784314, 1, 1,
0.2253384, 0.04028538, 1.959282, 0, 0.4705882, 1, 1,
0.2280047, -0.04488827, 1.383942, 0, 0.4666667, 1, 1,
0.231573, -1.177964, 3.167966, 0, 0.4588235, 1, 1,
0.2333894, -0.06107981, 1.167177, 0, 0.454902, 1, 1,
0.2371431, 0.9253235, 0.0561276, 0, 0.4470588, 1, 1,
0.2398086, -0.6309081, 4.523683, 0, 0.4431373, 1, 1,
0.2410458, 1.259962, 0.4803776, 0, 0.4352941, 1, 1,
0.2412793, -0.5828151, 1.809345, 0, 0.4313726, 1, 1,
0.2437766, 0.4516851, -0.7538499, 0, 0.4235294, 1, 1,
0.2453025, 0.3117187, 0.8580665, 0, 0.4196078, 1, 1,
0.2486966, -0.3299083, 2.54306, 0, 0.4117647, 1, 1,
0.2495089, 0.4441603, 1.878344, 0, 0.4078431, 1, 1,
0.2497803, 1.007333, -1.486101, 0, 0.4, 1, 1,
0.2505738, -1.068697, 3.805575, 0, 0.3921569, 1, 1,
0.2523269, -0.362508, 1.458672, 0, 0.3882353, 1, 1,
0.2525515, -1.62201, 3.869174, 0, 0.3803922, 1, 1,
0.2552365, -0.1175061, 2.140685, 0, 0.3764706, 1, 1,
0.2595954, -0.5701566, 3.534521, 0, 0.3686275, 1, 1,
0.262051, 0.8162533, 0.738483, 0, 0.3647059, 1, 1,
0.2639315, 1.010302, 1.390358, 0, 0.3568628, 1, 1,
0.2650113, -0.1877958, 3.076642, 0, 0.3529412, 1, 1,
0.2669742, -0.1073852, 2.837886, 0, 0.345098, 1, 1,
0.2742594, -0.4201091, 2.955279, 0, 0.3411765, 1, 1,
0.2789724, 1.749102, 0.4207868, 0, 0.3333333, 1, 1,
0.2811858, 0.1647739, 1.189118, 0, 0.3294118, 1, 1,
0.2835636, -0.09111214, 1.675237, 0, 0.3215686, 1, 1,
0.283866, 1.575835, -0.4803089, 0, 0.3176471, 1, 1,
0.2875068, -0.2612923, 3.776105, 0, 0.3098039, 1, 1,
0.2879246, -0.1605808, 3.152408, 0, 0.3058824, 1, 1,
0.2904411, -0.6013879, 3.696116, 0, 0.2980392, 1, 1,
0.2937556, 0.6180133, 0.3306992, 0, 0.2901961, 1, 1,
0.2940814, 0.006505547, 2.433013, 0, 0.2862745, 1, 1,
0.2956332, -0.5649819, 2.859505, 0, 0.2784314, 1, 1,
0.2994055, -1.361898, 2.111294, 0, 0.2745098, 1, 1,
0.3004489, -0.3735043, 3.015957, 0, 0.2666667, 1, 1,
0.3035453, 0.8933211, 1.222626, 0, 0.2627451, 1, 1,
0.307427, 1.626627, 0.2328044, 0, 0.254902, 1, 1,
0.3099769, -0.5516122, 4.02003, 0, 0.2509804, 1, 1,
0.3127771, 1.090791, -0.4778603, 0, 0.2431373, 1, 1,
0.3136211, -0.01201635, 2.661132, 0, 0.2392157, 1, 1,
0.3151446, 1.373003, -1.348197, 0, 0.2313726, 1, 1,
0.3152162, -0.2513016, 3.063191, 0, 0.227451, 1, 1,
0.3159635, -0.02026848, 1.990592, 0, 0.2196078, 1, 1,
0.3234735, 2.025714, -0.6858585, 0, 0.2156863, 1, 1,
0.3266783, -0.135492, 2.617904, 0, 0.2078431, 1, 1,
0.3266935, 0.2428892, 0.2466425, 0, 0.2039216, 1, 1,
0.3303936, 0.9790596, 0.739163, 0, 0.1960784, 1, 1,
0.3351958, -0.5289645, 1.852697, 0, 0.1882353, 1, 1,
0.3378461, 0.8382629, 0.2601437, 0, 0.1843137, 1, 1,
0.3388815, 0.7198102, 0.1744841, 0, 0.1764706, 1, 1,
0.339187, -1.750722, 2.174904, 0, 0.172549, 1, 1,
0.3431456, 2.41292, -0.3590855, 0, 0.1647059, 1, 1,
0.3480632, 0.5194599, 0.3405337, 0, 0.1607843, 1, 1,
0.3512826, 1.084679, 0.4955311, 0, 0.1529412, 1, 1,
0.3530183, -1.676194, 2.976038, 0, 0.1490196, 1, 1,
0.3533671, -1.843431, 1.141038, 0, 0.1411765, 1, 1,
0.3604482, 0.3458303, 0.1191462, 0, 0.1372549, 1, 1,
0.3649603, -0.02015374, 1.062807, 0, 0.1294118, 1, 1,
0.3703703, 0.8476505, 1.798447, 0, 0.1254902, 1, 1,
0.3714063, 0.3977552, 1.302233, 0, 0.1176471, 1, 1,
0.3757927, -0.4216012, 1.653028, 0, 0.1137255, 1, 1,
0.3769392, -0.2646487, 2.38917, 0, 0.1058824, 1, 1,
0.3776597, -0.09285911, 2.862137, 0, 0.09803922, 1, 1,
0.3963034, -0.6468636, 2.616204, 0, 0.09411765, 1, 1,
0.3964167, -1.426881, 4.604223, 0, 0.08627451, 1, 1,
0.396938, -0.8060442, 2.879693, 0, 0.08235294, 1, 1,
0.4027644, 0.662479, 2.01909, 0, 0.07450981, 1, 1,
0.4096427, -1.851725, 2.602771, 0, 0.07058824, 1, 1,
0.412477, 0.988716, 1.193935, 0, 0.0627451, 1, 1,
0.419014, -0.807385, 2.546792, 0, 0.05882353, 1, 1,
0.4237269, 1.698617, 0.3647786, 0, 0.05098039, 1, 1,
0.4290064, 1.237982, 0.3402337, 0, 0.04705882, 1, 1,
0.4297253, -0.2274827, 3.086562, 0, 0.03921569, 1, 1,
0.4316397, 0.199034, 0.7165027, 0, 0.03529412, 1, 1,
0.4321256, -1.368295, 2.847998, 0, 0.02745098, 1, 1,
0.4323294, 0.6739677, 0.1865124, 0, 0.02352941, 1, 1,
0.433398, -2.159536, 3.840092, 0, 0.01568628, 1, 1,
0.4376193, 0.3525746, 1.128331, 0, 0.01176471, 1, 1,
0.4376685, 0.3883685, -0.3159715, 0, 0.003921569, 1, 1,
0.4440894, -1.447305, 2.239973, 0.003921569, 0, 1, 1,
0.4495908, 0.9095678, 0.161963, 0.007843138, 0, 1, 1,
0.4496321, 2.279804, 1.565375, 0.01568628, 0, 1, 1,
0.4535141, -0.1358321, 1.035592, 0.01960784, 0, 1, 1,
0.4547102, 1.628445, -0.7880909, 0.02745098, 0, 1, 1,
0.4568666, -0.2960815, 3.462256, 0.03137255, 0, 1, 1,
0.458218, -0.3885943, 0.9530877, 0.03921569, 0, 1, 1,
0.4594302, -0.8489956, 0.8329695, 0.04313726, 0, 1, 1,
0.4616481, -0.264119, 2.001325, 0.05098039, 0, 1, 1,
0.4646892, 2.050596, 1.331252, 0.05490196, 0, 1, 1,
0.4656916, 2.548926, 1.417503, 0.0627451, 0, 1, 1,
0.4670753, -0.6545457, 1.809046, 0.06666667, 0, 1, 1,
0.4679899, 0.1224759, 1.539848, 0.07450981, 0, 1, 1,
0.4686753, 0.2946265, 1.457172, 0.07843138, 0, 1, 1,
0.4723229, 0.03402689, -0.3107607, 0.08627451, 0, 1, 1,
0.473489, -0.579221, 3.989582, 0.09019608, 0, 1, 1,
0.4735732, 1.414774, 1.156023, 0.09803922, 0, 1, 1,
0.4738036, -0.5380695, 2.059238, 0.1058824, 0, 1, 1,
0.4756158, 1.031586, 0.6308665, 0.1098039, 0, 1, 1,
0.4823724, -0.00586964, 2.655844, 0.1176471, 0, 1, 1,
0.4874271, 0.74649, -0.178495, 0.1215686, 0, 1, 1,
0.4884763, 1.714522, 1.69374, 0.1294118, 0, 1, 1,
0.4912179, 0.9487687, 0.2995045, 0.1333333, 0, 1, 1,
0.4924745, 0.4507544, 1.197463, 0.1411765, 0, 1, 1,
0.4929655, -0.1067849, 0.7893366, 0.145098, 0, 1, 1,
0.4934564, 0.004279683, 1.418294, 0.1529412, 0, 1, 1,
0.5013899, 1.641194, 1.125677, 0.1568628, 0, 1, 1,
0.5017623, -1.042362, 2.440644, 0.1647059, 0, 1, 1,
0.5021795, -0.1647252, 2.813809, 0.1686275, 0, 1, 1,
0.5025987, -0.993964, 2.396191, 0.1764706, 0, 1, 1,
0.5034648, 0.3193847, 1.162884, 0.1803922, 0, 1, 1,
0.5117685, -1.184538, 2.446877, 0.1882353, 0, 1, 1,
0.5123951, 0.5852016, 0.5203909, 0.1921569, 0, 1, 1,
0.5168212, -0.5808051, 2.116765, 0.2, 0, 1, 1,
0.5252095, 0.0501275, 2.304552, 0.2078431, 0, 1, 1,
0.5281196, -0.1069832, 1.110881, 0.2117647, 0, 1, 1,
0.5297163, 1.129381, -1.295913, 0.2196078, 0, 1, 1,
0.5324602, -0.1316853, -0.05997557, 0.2235294, 0, 1, 1,
0.5331026, -0.6272759, 4.672158, 0.2313726, 0, 1, 1,
0.5339209, 0.6211262, 1.292278, 0.2352941, 0, 1, 1,
0.5352619, 1.517867, -2.221192, 0.2431373, 0, 1, 1,
0.5403345, 1.023474, -0.6300739, 0.2470588, 0, 1, 1,
0.5421841, -0.5822042, 2.593897, 0.254902, 0, 1, 1,
0.5443684, -1.478585, 2.826762, 0.2588235, 0, 1, 1,
0.548067, 1.055371, 1.279405, 0.2666667, 0, 1, 1,
0.5497667, -0.160492, 3.839543, 0.2705882, 0, 1, 1,
0.5504479, -0.7582926, 1.668662, 0.2784314, 0, 1, 1,
0.5542988, -0.8780172, 4.401831, 0.282353, 0, 1, 1,
0.5556027, -0.2760333, 3.420996, 0.2901961, 0, 1, 1,
0.5570315, 2.934091, -0.7722387, 0.2941177, 0, 1, 1,
0.557148, -0.510664, 2.98063, 0.3019608, 0, 1, 1,
0.5607215, -1.33303, 3.875865, 0.3098039, 0, 1, 1,
0.5631536, 0.5171382, -0.1558, 0.3137255, 0, 1, 1,
0.5691652, 0.105479, 0.1441215, 0.3215686, 0, 1, 1,
0.5695804, 0.1495272, 2.159807, 0.3254902, 0, 1, 1,
0.5714563, -1.769604, 2.796172, 0.3333333, 0, 1, 1,
0.5762241, 1.970518, 0.7972492, 0.3372549, 0, 1, 1,
0.5800669, 1.100448, -1.027554, 0.345098, 0, 1, 1,
0.5805551, 0.8067412, 1.286267, 0.3490196, 0, 1, 1,
0.581859, 0.02091049, 0.3445242, 0.3568628, 0, 1, 1,
0.5865856, 1.301675, 0.9223156, 0.3607843, 0, 1, 1,
0.5869459, 0.5235607, 0.007924336, 0.3686275, 0, 1, 1,
0.5919753, -0.8934088, 3.216363, 0.372549, 0, 1, 1,
0.6028738, -0.09808848, 1.051502, 0.3803922, 0, 1, 1,
0.6064981, 0.6108273, 0.6408324, 0.3843137, 0, 1, 1,
0.607302, -2.093671, 1.894321, 0.3921569, 0, 1, 1,
0.609149, 0.8015115, 2.359395, 0.3960784, 0, 1, 1,
0.614875, 0.6632355, 0.1610794, 0.4039216, 0, 1, 1,
0.6154171, 0.7008087, 1.596428, 0.4117647, 0, 1, 1,
0.6180595, -1.307501, 2.209233, 0.4156863, 0, 1, 1,
0.6201513, 1.493497, 0.7564069, 0.4235294, 0, 1, 1,
0.6273403, -0.9089551, 3.459442, 0.427451, 0, 1, 1,
0.6280372, -0.8166691, 2.848148, 0.4352941, 0, 1, 1,
0.6281323, 0.2588626, 1.820392, 0.4392157, 0, 1, 1,
0.6324375, -2.316771, 3.936244, 0.4470588, 0, 1, 1,
0.6341469, 0.2563853, 1.022712, 0.4509804, 0, 1, 1,
0.6375957, -1.804112, 2.989396, 0.4588235, 0, 1, 1,
0.6403678, 0.3927181, 0.9153192, 0.4627451, 0, 1, 1,
0.6419595, 0.2666205, 1.538432, 0.4705882, 0, 1, 1,
0.6443956, 0.3584139, 0.6955355, 0.4745098, 0, 1, 1,
0.6449538, 1.670003, -1.419562, 0.4823529, 0, 1, 1,
0.6450517, -0.006165804, 0.9323182, 0.4862745, 0, 1, 1,
0.6456415, 1.111222, 2.4582, 0.4941176, 0, 1, 1,
0.6499247, -0.7616597, 2.313971, 0.5019608, 0, 1, 1,
0.6557309, -0.4644536, 2.766996, 0.5058824, 0, 1, 1,
0.6620846, -0.1374371, 1.653083, 0.5137255, 0, 1, 1,
0.6628134, 1.055999, 0.4561939, 0.5176471, 0, 1, 1,
0.6715368, 0.6445844, 0.8476065, 0.5254902, 0, 1, 1,
0.671665, 0.4124703, 0.7103258, 0.5294118, 0, 1, 1,
0.6722008, 0.4236498, 0.9048735, 0.5372549, 0, 1, 1,
0.6741086, 1.542509, 0.8163456, 0.5411765, 0, 1, 1,
0.6753526, -0.283331, 2.467346, 0.5490196, 0, 1, 1,
0.6768436, 0.1991546, 0.651577, 0.5529412, 0, 1, 1,
0.6779958, 0.7646337, -0.714948, 0.5607843, 0, 1, 1,
0.6833794, 0.1756157, 2.064432, 0.5647059, 0, 1, 1,
0.6840349, 0.5733663, -0.1326601, 0.572549, 0, 1, 1,
0.6842456, -0.9136208, 2.570868, 0.5764706, 0, 1, 1,
0.6856267, -1.657651, 1.341996, 0.5843138, 0, 1, 1,
0.6885476, -0.2659791, 1.804678, 0.5882353, 0, 1, 1,
0.6901973, 0.0118088, 1.637866, 0.5960785, 0, 1, 1,
0.6908151, -1.557253, 4.682516, 0.6039216, 0, 1, 1,
0.6909133, 1.390654, 0.4463746, 0.6078432, 0, 1, 1,
0.6941338, 0.8107665, 1.428955, 0.6156863, 0, 1, 1,
0.7054641, -0.3836444, 5.139639, 0.6196079, 0, 1, 1,
0.7085462, 0.7771547, 0.4083174, 0.627451, 0, 1, 1,
0.7111347, -0.8266502, 2.455018, 0.6313726, 0, 1, 1,
0.7169026, -0.2563521, 0.9800578, 0.6392157, 0, 1, 1,
0.7180099, 0.8621593, 1.965915, 0.6431373, 0, 1, 1,
0.722307, -0.09607428, 1.675442, 0.6509804, 0, 1, 1,
0.7351929, 0.7968558, 0.00891963, 0.654902, 0, 1, 1,
0.7374607, -0.2454883, 1.752886, 0.6627451, 0, 1, 1,
0.73937, -0.2690283, 1.484502, 0.6666667, 0, 1, 1,
0.7450124, 0.9252658, 1.386046, 0.6745098, 0, 1, 1,
0.7484614, -0.2246836, 2.212702, 0.6784314, 0, 1, 1,
0.7532719, 2.158492, -0.7632942, 0.6862745, 0, 1, 1,
0.7582228, -0.8323672, 3.641257, 0.6901961, 0, 1, 1,
0.762378, 1.027371, 0.8341323, 0.6980392, 0, 1, 1,
0.7625254, -1.296502, 3.653588, 0.7058824, 0, 1, 1,
0.7698328, -0.5365853, 1.688957, 0.7098039, 0, 1, 1,
0.7707412, 0.1646998, -0.01989435, 0.7176471, 0, 1, 1,
0.7707649, 0.4490733, 1.183296, 0.7215686, 0, 1, 1,
0.7806162, -0.4804884, 2.782697, 0.7294118, 0, 1, 1,
0.7807482, -0.3076968, 2.467772, 0.7333333, 0, 1, 1,
0.7840857, 0.2560281, 1.419852, 0.7411765, 0, 1, 1,
0.7854291, -0.2982694, 0.04107061, 0.7450981, 0, 1, 1,
0.7879134, -1.242253, 2.487422, 0.7529412, 0, 1, 1,
0.7879506, -0.5120901, 1.477901, 0.7568628, 0, 1, 1,
0.7890737, -2.008869, 4.814218, 0.7647059, 0, 1, 1,
0.791271, -0.6403674, 3.349908, 0.7686275, 0, 1, 1,
0.7915832, 0.4169641, 0.5778266, 0.7764706, 0, 1, 1,
0.8025905, -2.157735, 3.24781, 0.7803922, 0, 1, 1,
0.8087774, 0.6499492, 0.6648548, 0.7882353, 0, 1, 1,
0.8115786, 1.536887, 0.368894, 0.7921569, 0, 1, 1,
0.8157017, 0.5523988, 0.3580824, 0.8, 0, 1, 1,
0.8175776, -0.287475, 2.008759, 0.8078431, 0, 1, 1,
0.8178534, -0.01210859, 2.000949, 0.8117647, 0, 1, 1,
0.8210422, -2.586993, 1.926769, 0.8196079, 0, 1, 1,
0.8220873, 1.631142, 1.198592, 0.8235294, 0, 1, 1,
0.825642, 1.339581, 0.3577052, 0.8313726, 0, 1, 1,
0.8311172, 1.37697, 1.787564, 0.8352941, 0, 1, 1,
0.8321867, 0.3005852, 1.104084, 0.8431373, 0, 1, 1,
0.8323511, -0.4669737, 1.142083, 0.8470588, 0, 1, 1,
0.8359991, 0.1160438, 2.555442, 0.854902, 0, 1, 1,
0.8457306, -0.2012438, 1.970744, 0.8588235, 0, 1, 1,
0.8458905, -0.1956838, -0.08211215, 0.8666667, 0, 1, 1,
0.8507413, 1.672262, -0.1376991, 0.8705882, 0, 1, 1,
0.8522033, -0.6697245, 1.896577, 0.8784314, 0, 1, 1,
0.8539447, 0.4422423, 2.836565, 0.8823529, 0, 1, 1,
0.8586332, -0.882048, 0.9732116, 0.8901961, 0, 1, 1,
0.8588127, -0.3565154, 2.697753, 0.8941177, 0, 1, 1,
0.8652675, -1.86324, 2.267726, 0.9019608, 0, 1, 1,
0.8729624, 0.3589883, 2.060608, 0.9098039, 0, 1, 1,
0.8761846, 1.62491, 0.3188937, 0.9137255, 0, 1, 1,
0.87633, -0.01351653, 1.884727, 0.9215686, 0, 1, 1,
0.8875172, -0.9032763, 2.637419, 0.9254902, 0, 1, 1,
0.8920542, 0.6169323, 1.276589, 0.9333333, 0, 1, 1,
0.8932811, -2.255299, 2.911208, 0.9372549, 0, 1, 1,
0.8987787, 1.823086, 4.034314, 0.945098, 0, 1, 1,
0.9059443, 0.09466849, 2.88139, 0.9490196, 0, 1, 1,
0.9069412, 0.7472368, 0.4905197, 0.9568627, 0, 1, 1,
0.909075, -0.9540993, 2.551209, 0.9607843, 0, 1, 1,
0.9138579, 0.4611078, 1.61976, 0.9686275, 0, 1, 1,
0.9173197, 0.4934012, 0.3192858, 0.972549, 0, 1, 1,
0.92609, 0.2533845, 1.158589, 0.9803922, 0, 1, 1,
0.926932, 0.3753444, 2.70882, 0.9843137, 0, 1, 1,
0.9286133, -1.984195, 3.759799, 0.9921569, 0, 1, 1,
0.9336975, -0.4689719, 0.4682629, 0.9960784, 0, 1, 1,
0.9422258, -1.830485, 3.99853, 1, 0, 0.9960784, 1,
0.9423932, 0.6137773, 0.339815, 1, 0, 0.9882353, 1,
0.9477199, 0.1116463, 0.9709033, 1, 0, 0.9843137, 1,
0.9548725, 0.2242903, 1.007921, 1, 0, 0.9764706, 1,
0.9575743, 0.8353401, 2.618885, 1, 0, 0.972549, 1,
0.9642885, 0.2844812, 0.9460595, 1, 0, 0.9647059, 1,
0.964327, 0.5187898, 1.824668, 1, 0, 0.9607843, 1,
0.9674686, 0.4502363, 0.1442767, 1, 0, 0.9529412, 1,
0.9843355, 0.6042458, 0.1068128, 1, 0, 0.9490196, 1,
0.9942056, 2.016288, -0.6285526, 1, 0, 0.9411765, 1,
0.9966047, -0.6947317, 2.699215, 1, 0, 0.9372549, 1,
1.001855, -1.213887, 2.952452, 1, 0, 0.9294118, 1,
1.002078, 2.272256, 1.706254, 1, 0, 0.9254902, 1,
1.015009, 0.7875656, 0.9956837, 1, 0, 0.9176471, 1,
1.021093, 1.228865, 0.526336, 1, 0, 0.9137255, 1,
1.026322, -1.327922, 2.998902, 1, 0, 0.9058824, 1,
1.033768, -0.5123969, 2.391901, 1, 0, 0.9019608, 1,
1.038959, -0.5616211, 1.70246, 1, 0, 0.8941177, 1,
1.041976, 1.114851, -0.07441753, 1, 0, 0.8862745, 1,
1.042666, -0.1061872, 2.390596, 1, 0, 0.8823529, 1,
1.044703, 0.6176389, 0.7645479, 1, 0, 0.8745098, 1,
1.050764, 1.669562, 1.660064, 1, 0, 0.8705882, 1,
1.05141, 2.23725, 0.02946422, 1, 0, 0.8627451, 1,
1.056209, 1.297366, 0.6070653, 1, 0, 0.8588235, 1,
1.058146, -0.4374472, 2.633522, 1, 0, 0.8509804, 1,
1.060819, 0.3542055, 2.626278, 1, 0, 0.8470588, 1,
1.06279, 0.3194918, 0.3994808, 1, 0, 0.8392157, 1,
1.078241, -0.3048288, 2.522629, 1, 0, 0.8352941, 1,
1.085993, 1.563269, 0.6158531, 1, 0, 0.827451, 1,
1.094843, 0.8143221, 1.094568, 1, 0, 0.8235294, 1,
1.104703, 1.637182, 1.395983, 1, 0, 0.8156863, 1,
1.107941, -2.00623, 3.300138, 1, 0, 0.8117647, 1,
1.108703, 0.09716999, 0.4816894, 1, 0, 0.8039216, 1,
1.10955, 0.5598954, 0.6317524, 1, 0, 0.7960784, 1,
1.10977, 0.6272375, 0.3630738, 1, 0, 0.7921569, 1,
1.113916, 0.6948943, -0.3040096, 1, 0, 0.7843137, 1,
1.121042, 1.266588, -0.1095687, 1, 0, 0.7803922, 1,
1.124284, -0.08064973, 1.256139, 1, 0, 0.772549, 1,
1.124731, -0.7825585, 2.137268, 1, 0, 0.7686275, 1,
1.138729, -0.02480502, 1.375885, 1, 0, 0.7607843, 1,
1.139349, 1.429817, -0.001913424, 1, 0, 0.7568628, 1,
1.142274, 0.4461673, 1.792857, 1, 0, 0.7490196, 1,
1.146703, 1.111533, 0.06859176, 1, 0, 0.7450981, 1,
1.148325, 0.6760926, 0.2834354, 1, 0, 0.7372549, 1,
1.157976, -0.5375408, 0.8522968, 1, 0, 0.7333333, 1,
1.160574, 0.3418123, 0.3571964, 1, 0, 0.7254902, 1,
1.168487, 0.2327214, 2.349244, 1, 0, 0.7215686, 1,
1.171114, -0.8572704, 2.170265, 1, 0, 0.7137255, 1,
1.174054, 0.6385989, 1.215152, 1, 0, 0.7098039, 1,
1.176187, 1.464426, 1.195543, 1, 0, 0.7019608, 1,
1.178022, 0.08513235, 1.241533, 1, 0, 0.6941177, 1,
1.189999, -0.3221738, 2.855665, 1, 0, 0.6901961, 1,
1.19136, 0.5891438, 1.551001, 1, 0, 0.682353, 1,
1.208605, -1.414859, 3.554393, 1, 0, 0.6784314, 1,
1.213312, 0.02831089, 2.41519, 1, 0, 0.6705883, 1,
1.218936, 0.111875, 1.805802, 1, 0, 0.6666667, 1,
1.221925, 1.322604, -2.418938, 1, 0, 0.6588235, 1,
1.223102, 2.050932, -0.4706841, 1, 0, 0.654902, 1,
1.227678, -0.3248533, 1.19987, 1, 0, 0.6470588, 1,
1.232102, 0.1302587, 3.359118, 1, 0, 0.6431373, 1,
1.240955, -0.0453488, 1.99024, 1, 0, 0.6352941, 1,
1.250929, -1.554053, 2.858227, 1, 0, 0.6313726, 1,
1.252101, 0.3751763, 1.134719, 1, 0, 0.6235294, 1,
1.256746, -3.033075, 3.041261, 1, 0, 0.6196079, 1,
1.258061, -0.4458107, 1.490421, 1, 0, 0.6117647, 1,
1.260658, 0.9413795, 1.265904, 1, 0, 0.6078432, 1,
1.268321, -0.3214429, 2.117087, 1, 0, 0.6, 1,
1.270439, 0.9688228, 0.2368834, 1, 0, 0.5921569, 1,
1.270907, -0.3461659, 1.540364, 1, 0, 0.5882353, 1,
1.274707, -1.230407, 0.8131917, 1, 0, 0.5803922, 1,
1.292789, -0.9631317, 2.280171, 1, 0, 0.5764706, 1,
1.304029, -1.355391, 3.741405, 1, 0, 0.5686275, 1,
1.31118, 1.017991, 1.620443, 1, 0, 0.5647059, 1,
1.314417, 1.013545, 1.797221, 1, 0, 0.5568628, 1,
1.32204, 2.054502, 0.7022427, 1, 0, 0.5529412, 1,
1.323548, 0.342887, 1.337353, 1, 0, 0.5450981, 1,
1.324886, -0.6002592, 3.503779, 1, 0, 0.5411765, 1,
1.336085, 0.6344618, 1.502927, 1, 0, 0.5333334, 1,
1.340244, 1.749055, 0.3634685, 1, 0, 0.5294118, 1,
1.345643, -0.33001, 1.714218, 1, 0, 0.5215687, 1,
1.350762, -1.682446, 3.593106, 1, 0, 0.5176471, 1,
1.354058, 1.7572, 1.828002, 1, 0, 0.509804, 1,
1.360143, -0.7119541, 0.6397761, 1, 0, 0.5058824, 1,
1.362884, 0.9592394, 0.9943355, 1, 0, 0.4980392, 1,
1.382978, -0.6088812, 3.263264, 1, 0, 0.4901961, 1,
1.395755, 0.7055328, 0.5001497, 1, 0, 0.4862745, 1,
1.403191, -0.6565163, 3.048445, 1, 0, 0.4784314, 1,
1.405072, -0.3615313, 3.441757, 1, 0, 0.4745098, 1,
1.405362, -1.033185, 2.335909, 1, 0, 0.4666667, 1,
1.422011, -0.003485966, 0.5182787, 1, 0, 0.4627451, 1,
1.425234, -0.3100504, 0.4132977, 1, 0, 0.454902, 1,
1.425351, -1.377024, 2.125248, 1, 0, 0.4509804, 1,
1.440254, 0.774232, 1.966092, 1, 0, 0.4431373, 1,
1.450011, 0.06111605, 0.9151236, 1, 0, 0.4392157, 1,
1.458714, 0.05075812, 2.237785, 1, 0, 0.4313726, 1,
1.462918, -1.398477, 3.342825, 1, 0, 0.427451, 1,
1.496212, 1.37359, 0.8614131, 1, 0, 0.4196078, 1,
1.506161, -0.8462189, 3.65826, 1, 0, 0.4156863, 1,
1.517979, 0.02402746, 3.075389, 1, 0, 0.4078431, 1,
1.520414, 0.4485832, 0.04710701, 1, 0, 0.4039216, 1,
1.553225, -1.683896, 2.02403, 1, 0, 0.3960784, 1,
1.586507, -0.6991132, 0.1258689, 1, 0, 0.3882353, 1,
1.586592, -0.9094144, 1.635098, 1, 0, 0.3843137, 1,
1.588583, -0.2295691, 1.390793, 1, 0, 0.3764706, 1,
1.61026, 0.9048064, 0.4901337, 1, 0, 0.372549, 1,
1.611286, -1.85249, 2.33788, 1, 0, 0.3647059, 1,
1.612201, 2.698612, 1.036257, 1, 0, 0.3607843, 1,
1.620151, 0.1975119, 1.538769, 1, 0, 0.3529412, 1,
1.624449, -0.5131022, 1.615256, 1, 0, 0.3490196, 1,
1.634173, 1.419805, 1.149545, 1, 0, 0.3411765, 1,
1.636523, -0.6643814, 0.6188345, 1, 0, 0.3372549, 1,
1.636965, 0.8953422, 0.4434887, 1, 0, 0.3294118, 1,
1.645871, -0.9591302, 1.416466, 1, 0, 0.3254902, 1,
1.668319, 1.118911, 0.7089289, 1, 0, 0.3176471, 1,
1.672818, 0.4743815, -0.4589298, 1, 0, 0.3137255, 1,
1.6824, -0.9121282, 2.565551, 1, 0, 0.3058824, 1,
1.684544, 0.3828191, 1.621719, 1, 0, 0.2980392, 1,
1.689871, -1.492602, 2.303104, 1, 0, 0.2941177, 1,
1.698086, 1.496141, 1.667048, 1, 0, 0.2862745, 1,
1.70261, -0.9002852, 3.047255, 1, 0, 0.282353, 1,
1.725394, -1.260042, 2.011927, 1, 0, 0.2745098, 1,
1.738747, -0.1498151, 1.123547, 1, 0, 0.2705882, 1,
1.754029, 1.96952, -0.8505263, 1, 0, 0.2627451, 1,
1.759277, 1.894274, 0.7485331, 1, 0, 0.2588235, 1,
1.77147, -0.9543099, 2.265339, 1, 0, 0.2509804, 1,
1.777555, 0.1900936, 0.8115947, 1, 0, 0.2470588, 1,
1.785525, -0.7844245, 2.076053, 1, 0, 0.2392157, 1,
1.801707, 0.07419866, 1.686111, 1, 0, 0.2352941, 1,
1.805465, -0.02985191, 1.406184, 1, 0, 0.227451, 1,
1.812408, -0.6991349, 2.261303, 1, 0, 0.2235294, 1,
1.819372, 1.178352, 0.6935407, 1, 0, 0.2156863, 1,
1.821068, 0.006390354, 1.0558, 1, 0, 0.2117647, 1,
1.824926, -1.861102, 3.419447, 1, 0, 0.2039216, 1,
1.827766, -0.5008777, 3.029946, 1, 0, 0.1960784, 1,
1.833373, -3.01292, 2.536456, 1, 0, 0.1921569, 1,
1.844036, -1.157748, 2.33158, 1, 0, 0.1843137, 1,
1.845402, 0.7357737, 1.467336, 1, 0, 0.1803922, 1,
1.8723, -2.144367, 3.393648, 1, 0, 0.172549, 1,
1.892689, 0.987334, 1.013979, 1, 0, 0.1686275, 1,
1.947413, 1.632366, 0.7807279, 1, 0, 0.1607843, 1,
1.968967, -0.3159461, 0.09512699, 1, 0, 0.1568628, 1,
1.981841, -0.6768152, 1.221138, 1, 0, 0.1490196, 1,
1.992564, 0.3600836, 0.5933511, 1, 0, 0.145098, 1,
1.994556, 0.1950602, 2.726878, 1, 0, 0.1372549, 1,
2.009497, -1.900987, 0.9152477, 1, 0, 0.1333333, 1,
2.028259, -1.303907, 2.437326, 1, 0, 0.1254902, 1,
2.040137, -0.498481, 2.169507, 1, 0, 0.1215686, 1,
2.051346, -0.4389643, 2.136352, 1, 0, 0.1137255, 1,
2.054643, 0.3282459, 1.442646, 1, 0, 0.1098039, 1,
2.055199, 1.10427, 0.1465905, 1, 0, 0.1019608, 1,
2.076637, 0.2473364, 2.747938, 1, 0, 0.09411765, 1,
2.096156, 0.2426737, 1.435027, 1, 0, 0.09019608, 1,
2.10632, -0.2007318, 0.9166307, 1, 0, 0.08235294, 1,
2.111621, 0.2287319, 2.886379, 1, 0, 0.07843138, 1,
2.141673, -0.9854028, 2.71416, 1, 0, 0.07058824, 1,
2.163733, -0.01438147, 0.627802, 1, 0, 0.06666667, 1,
2.206495, -0.3728375, 1.515306, 1, 0, 0.05882353, 1,
2.22566, 0.09112999, 1.060195, 1, 0, 0.05490196, 1,
2.226761, 1.428317, 0.6787421, 1, 0, 0.04705882, 1,
2.273787, 0.7432607, 1.517565, 1, 0, 0.04313726, 1,
2.284179, -0.3409635, 1.716653, 1, 0, 0.03529412, 1,
2.370813, -1.042175, 2.138658, 1, 0, 0.03137255, 1,
2.484428, -0.5732096, 1.431727, 1, 0, 0.02352941, 1,
2.516135, -1.404716, 2.334486, 1, 0, 0.01960784, 1,
2.733297, 0.3984838, 0.3795806, 1, 0, 0.01176471, 1,
3.662241, 0.3443075, 1.657029, 1, 0, 0.007843138, 1
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
0.2928536, -4.04451, -6.842747, 0, -0.5, 0.5, 0.5,
0.2928536, -4.04451, -6.842747, 1, -0.5, 0.5, 0.5,
0.2928536, -4.04451, -6.842747, 1, 1.5, 0.5, 0.5,
0.2928536, -4.04451, -6.842747, 0, 1.5, 0.5, 0.5
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
-4.218755, -0.049492, -6.842747, 0, -0.5, 0.5, 0.5,
-4.218755, -0.049492, -6.842747, 1, -0.5, 0.5, 0.5,
-4.218755, -0.049492, -6.842747, 1, 1.5, 0.5, 0.5,
-4.218755, -0.049492, -6.842747, 0, 1.5, 0.5, 0.5
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
-4.218755, -4.04451, 0.01677179, 0, -0.5, 0.5, 0.5,
-4.218755, -4.04451, 0.01677179, 1, -0.5, 0.5, 0.5,
-4.218755, -4.04451, 0.01677179, 1, 1.5, 0.5, 0.5,
-4.218755, -4.04451, 0.01677179, 0, 1.5, 0.5, 0.5
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
-3, -3.122583, -5.259781,
3, -3.122583, -5.259781,
-3, -3.122583, -5.259781,
-3, -3.276237, -5.523609,
-2, -3.122583, -5.259781,
-2, -3.276237, -5.523609,
-1, -3.122583, -5.259781,
-1, -3.276237, -5.523609,
0, -3.122583, -5.259781,
0, -3.276237, -5.523609,
1, -3.122583, -5.259781,
1, -3.276237, -5.523609,
2, -3.122583, -5.259781,
2, -3.276237, -5.523609,
3, -3.122583, -5.259781,
3, -3.276237, -5.523609
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
-3, -3.583546, -6.051264, 0, -0.5, 0.5, 0.5,
-3, -3.583546, -6.051264, 1, -0.5, 0.5, 0.5,
-3, -3.583546, -6.051264, 1, 1.5, 0.5, 0.5,
-3, -3.583546, -6.051264, 0, 1.5, 0.5, 0.5,
-2, -3.583546, -6.051264, 0, -0.5, 0.5, 0.5,
-2, -3.583546, -6.051264, 1, -0.5, 0.5, 0.5,
-2, -3.583546, -6.051264, 1, 1.5, 0.5, 0.5,
-2, -3.583546, -6.051264, 0, 1.5, 0.5, 0.5,
-1, -3.583546, -6.051264, 0, -0.5, 0.5, 0.5,
-1, -3.583546, -6.051264, 1, -0.5, 0.5, 0.5,
-1, -3.583546, -6.051264, 1, 1.5, 0.5, 0.5,
-1, -3.583546, -6.051264, 0, 1.5, 0.5, 0.5,
0, -3.583546, -6.051264, 0, -0.5, 0.5, 0.5,
0, -3.583546, -6.051264, 1, -0.5, 0.5, 0.5,
0, -3.583546, -6.051264, 1, 1.5, 0.5, 0.5,
0, -3.583546, -6.051264, 0, 1.5, 0.5, 0.5,
1, -3.583546, -6.051264, 0, -0.5, 0.5, 0.5,
1, -3.583546, -6.051264, 1, -0.5, 0.5, 0.5,
1, -3.583546, -6.051264, 1, 1.5, 0.5, 0.5,
1, -3.583546, -6.051264, 0, 1.5, 0.5, 0.5,
2, -3.583546, -6.051264, 0, -0.5, 0.5, 0.5,
2, -3.583546, -6.051264, 1, -0.5, 0.5, 0.5,
2, -3.583546, -6.051264, 1, 1.5, 0.5, 0.5,
2, -3.583546, -6.051264, 0, 1.5, 0.5, 0.5,
3, -3.583546, -6.051264, 0, -0.5, 0.5, 0.5,
3, -3.583546, -6.051264, 1, -0.5, 0.5, 0.5,
3, -3.583546, -6.051264, 1, 1.5, 0.5, 0.5,
3, -3.583546, -6.051264, 0, 1.5, 0.5, 0.5
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
-3.177615, -3, -5.259781,
-3.177615, 2, -5.259781,
-3.177615, -3, -5.259781,
-3.351138, -3, -5.523609,
-3.177615, -2, -5.259781,
-3.351138, -2, -5.523609,
-3.177615, -1, -5.259781,
-3.351138, -1, -5.523609,
-3.177615, 0, -5.259781,
-3.351138, 0, -5.523609,
-3.177615, 1, -5.259781,
-3.351138, 1, -5.523609,
-3.177615, 2, -5.259781,
-3.351138, 2, -5.523609
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
-3.698185, -3, -6.051264, 0, -0.5, 0.5, 0.5,
-3.698185, -3, -6.051264, 1, -0.5, 0.5, 0.5,
-3.698185, -3, -6.051264, 1, 1.5, 0.5, 0.5,
-3.698185, -3, -6.051264, 0, 1.5, 0.5, 0.5,
-3.698185, -2, -6.051264, 0, -0.5, 0.5, 0.5,
-3.698185, -2, -6.051264, 1, -0.5, 0.5, 0.5,
-3.698185, -2, -6.051264, 1, 1.5, 0.5, 0.5,
-3.698185, -2, -6.051264, 0, 1.5, 0.5, 0.5,
-3.698185, -1, -6.051264, 0, -0.5, 0.5, 0.5,
-3.698185, -1, -6.051264, 1, -0.5, 0.5, 0.5,
-3.698185, -1, -6.051264, 1, 1.5, 0.5, 0.5,
-3.698185, -1, -6.051264, 0, 1.5, 0.5, 0.5,
-3.698185, 0, -6.051264, 0, -0.5, 0.5, 0.5,
-3.698185, 0, -6.051264, 1, -0.5, 0.5, 0.5,
-3.698185, 0, -6.051264, 1, 1.5, 0.5, 0.5,
-3.698185, 0, -6.051264, 0, 1.5, 0.5, 0.5,
-3.698185, 1, -6.051264, 0, -0.5, 0.5, 0.5,
-3.698185, 1, -6.051264, 1, -0.5, 0.5, 0.5,
-3.698185, 1, -6.051264, 1, 1.5, 0.5, 0.5,
-3.698185, 1, -6.051264, 0, 1.5, 0.5, 0.5,
-3.698185, 2, -6.051264, 0, -0.5, 0.5, 0.5,
-3.698185, 2, -6.051264, 1, -0.5, 0.5, 0.5,
-3.698185, 2, -6.051264, 1, 1.5, 0.5, 0.5,
-3.698185, 2, -6.051264, 0, 1.5, 0.5, 0.5
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
-3.177615, -3.122583, -4,
-3.177615, -3.122583, 4,
-3.177615, -3.122583, -4,
-3.351138, -3.276237, -4,
-3.177615, -3.122583, -2,
-3.351138, -3.276237, -2,
-3.177615, -3.122583, 0,
-3.351138, -3.276237, 0,
-3.177615, -3.122583, 2,
-3.351138, -3.276237, 2,
-3.177615, -3.122583, 4,
-3.351138, -3.276237, 4
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
-3.698185, -3.583546, -4, 0, -0.5, 0.5, 0.5,
-3.698185, -3.583546, -4, 1, -0.5, 0.5, 0.5,
-3.698185, -3.583546, -4, 1, 1.5, 0.5, 0.5,
-3.698185, -3.583546, -4, 0, 1.5, 0.5, 0.5,
-3.698185, -3.583546, -2, 0, -0.5, 0.5, 0.5,
-3.698185, -3.583546, -2, 1, -0.5, 0.5, 0.5,
-3.698185, -3.583546, -2, 1, 1.5, 0.5, 0.5,
-3.698185, -3.583546, -2, 0, 1.5, 0.5, 0.5,
-3.698185, -3.583546, 0, 0, -0.5, 0.5, 0.5,
-3.698185, -3.583546, 0, 1, -0.5, 0.5, 0.5,
-3.698185, -3.583546, 0, 1, 1.5, 0.5, 0.5,
-3.698185, -3.583546, 0, 0, 1.5, 0.5, 0.5,
-3.698185, -3.583546, 2, 0, -0.5, 0.5, 0.5,
-3.698185, -3.583546, 2, 1, -0.5, 0.5, 0.5,
-3.698185, -3.583546, 2, 1, 1.5, 0.5, 0.5,
-3.698185, -3.583546, 2, 0, 1.5, 0.5, 0.5,
-3.698185, -3.583546, 4, 0, -0.5, 0.5, 0.5,
-3.698185, -3.583546, 4, 1, -0.5, 0.5, 0.5,
-3.698185, -3.583546, 4, 1, 1.5, 0.5, 0.5,
-3.698185, -3.583546, 4, 0, 1.5, 0.5, 0.5
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
-3.177615, -3.122583, -5.259781,
-3.177615, 3.023599, -5.259781,
-3.177615, -3.122583, 5.293325,
-3.177615, 3.023599, 5.293325,
-3.177615, -3.122583, -5.259781,
-3.177615, -3.122583, 5.293325,
-3.177615, 3.023599, -5.259781,
-3.177615, 3.023599, 5.293325,
-3.177615, -3.122583, -5.259781,
3.763322, -3.122583, -5.259781,
-3.177615, -3.122583, 5.293325,
3.763322, -3.122583, 5.293325,
-3.177615, 3.023599, -5.259781,
3.763322, 3.023599, -5.259781,
-3.177615, 3.023599, 5.293325,
3.763322, 3.023599, 5.293325,
3.763322, -3.122583, -5.259781,
3.763322, 3.023599, -5.259781,
3.763322, -3.122583, 5.293325,
3.763322, 3.023599, 5.293325,
3.763322, -3.122583, -5.259781,
3.763322, -3.122583, 5.293325,
3.763322, 3.023599, -5.259781,
3.763322, 3.023599, 5.293325
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
var radius = 7.500863;
var distance = 33.37219;
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
mvMatrix.translate( -0.2928536, 0.049492, -0.01677179 );
mvMatrix.scale( 1.168442, 1.319532, 0.7685017 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.37219);
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
isopropyl_2-chloro-5<-read.table("isopropyl_2-chloro-5.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isopropyl_2-chloro-5$V2
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl_2' not found
```

```r
y<-isopropyl_2-chloro-5$V3
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl_2' not found
```

```r
z<-isopropyl_2-chloro-5$V4
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl_2' not found
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
-3.076533, -0.06080081, -2.847406, 0, 0, 1, 1, 1,
-2.929937, 1.853164, -1.839218, 1, 0, 0, 1, 1,
-2.8808, 1.425689, 0.09903745, 1, 0, 0, 1, 1,
-2.830445, 0.9922404, -0.3200429, 1, 0, 0, 1, 1,
-2.825594, 0.689285, -2.656224, 1, 0, 0, 1, 1,
-2.815063, -1.132993, 0.6280537, 1, 0, 0, 1, 1,
-2.812696, 0.4560017, -1.163585, 0, 0, 0, 1, 1,
-2.805668, -0.06151976, -1.028755, 0, 0, 0, 1, 1,
-2.610406, 1.491626, -0.9688582, 0, 0, 0, 1, 1,
-2.542683, -0.1782353, -1.669919, 0, 0, 0, 1, 1,
-2.534671, 1.141749, -0.5226511, 0, 0, 0, 1, 1,
-2.51308, -0.5418186, -3.243922, 0, 0, 0, 1, 1,
-2.497746, -0.887763, -2.406747, 0, 0, 0, 1, 1,
-2.401559, 0.7442322, -1.036072, 1, 1, 1, 1, 1,
-2.398959, 0.1218615, -1.193984, 1, 1, 1, 1, 1,
-2.385946, -0.9727651, -1.6403, 1, 1, 1, 1, 1,
-2.36894, 0.3649362, -2.434246, 1, 1, 1, 1, 1,
-2.354846, 0.4631873, 0.05932166, 1, 1, 1, 1, 1,
-2.349735, -0.7337291, -2.207034, 1, 1, 1, 1, 1,
-2.262229, 0.1221801, -2.189713, 1, 1, 1, 1, 1,
-2.259592, -1.391751, -2.666164, 1, 1, 1, 1, 1,
-2.254713, 0.3255545, -3.710943, 1, 1, 1, 1, 1,
-2.222665, 0.7147096, -1.188401, 1, 1, 1, 1, 1,
-2.18204, -0.481978, -1.836398, 1, 1, 1, 1, 1,
-2.173952, 0.8447279, -1.333667, 1, 1, 1, 1, 1,
-2.172289, 1.609433, -1.567417, 1, 1, 1, 1, 1,
-2.139696, -1.164355, -1.278873, 1, 1, 1, 1, 1,
-2.121609, 0.9411861, -1.547965, 1, 1, 1, 1, 1,
-2.115099, 1.516739, -1.324805, 0, 0, 1, 1, 1,
-2.088111, -0.1149018, -2.023544, 1, 0, 0, 1, 1,
-2.042141, -0.3587601, -1.677752, 1, 0, 0, 1, 1,
-2.014897, 0.5979815, -1.350208, 1, 0, 0, 1, 1,
-1.993674, 2.095543, 1.101418, 1, 0, 0, 1, 1,
-1.964097, 0.2562967, -0.5884299, 1, 0, 0, 1, 1,
-1.91145, -0.5269272, -2.094941, 0, 0, 0, 1, 1,
-1.909462, -0.7551388, 0.374932, 0, 0, 0, 1, 1,
-1.904916, 0.5730514, -0.5392579, 0, 0, 0, 1, 1,
-1.898893, -0.5251932, -1.640977, 0, 0, 0, 1, 1,
-1.860184, -0.1853177, 0.001354505, 0, 0, 0, 1, 1,
-1.827912, -0.7464253, -1.21446, 0, 0, 0, 1, 1,
-1.817539, -0.1229437, -0.8505237, 0, 0, 0, 1, 1,
-1.817252, 1.026591, -0.4218181, 1, 1, 1, 1, 1,
-1.796772, 0.7503633, -2.145359, 1, 1, 1, 1, 1,
-1.794182, -1.498589, -2.730762, 1, 1, 1, 1, 1,
-1.768244, -0.4209122, -2.837649, 1, 1, 1, 1, 1,
-1.754684, 0.5497983, -1.948936, 1, 1, 1, 1, 1,
-1.75348, -0.3174354, -1.753286, 1, 1, 1, 1, 1,
-1.749344, 0.7306055, -2.654313, 1, 1, 1, 1, 1,
-1.742419, 0.6258733, -2.690572, 1, 1, 1, 1, 1,
-1.728248, 0.9227043, -1.632798, 1, 1, 1, 1, 1,
-1.72488, -0.3398552, -0.5584407, 1, 1, 1, 1, 1,
-1.702932, 0.853515, -1.035155, 1, 1, 1, 1, 1,
-1.6983, 0.5997839, -0.9736074, 1, 1, 1, 1, 1,
-1.691042, 0.3346468, -0.7557297, 1, 1, 1, 1, 1,
-1.6894, 0.1050662, -0.0009062373, 1, 1, 1, 1, 1,
-1.686376, -0.2375005, -2.250215, 1, 1, 1, 1, 1,
-1.68474, 1.268268, -2.04393, 0, 0, 1, 1, 1,
-1.650024, 0.8751562, 0.2593229, 1, 0, 0, 1, 1,
-1.647881, -0.9699941, -0.7594311, 1, 0, 0, 1, 1,
-1.645193, -1.456502, -0.4870266, 1, 0, 0, 1, 1,
-1.643749, -0.04343184, -1.204998, 1, 0, 0, 1, 1,
-1.626793, 1.360227, -0.6661344, 1, 0, 0, 1, 1,
-1.625411, 1.627703, 0.7438613, 0, 0, 0, 1, 1,
-1.624186, 0.15124, 0.6523838, 0, 0, 0, 1, 1,
-1.622422, 1.056027, -1.746402, 0, 0, 0, 1, 1,
-1.618678, 0.8703584, -2.202512, 0, 0, 0, 1, 1,
-1.607773, 1.001057, -1.312641, 0, 0, 0, 1, 1,
-1.605306, -0.9496177, -3.3753, 0, 0, 0, 1, 1,
-1.603515, -0.2174055, -1.320141, 0, 0, 0, 1, 1,
-1.599125, -0.3210835, -2.166283, 1, 1, 1, 1, 1,
-1.591571, 0.4912405, -1.56637, 1, 1, 1, 1, 1,
-1.58379, 0.4102675, -1.213389, 1, 1, 1, 1, 1,
-1.578825, 1.634924, -1.431953, 1, 1, 1, 1, 1,
-1.570094, -0.715327, -1.170111, 1, 1, 1, 1, 1,
-1.560399, -1.224666, -0.2810701, 1, 1, 1, 1, 1,
-1.539212, -1.129688, -1.743762, 1, 1, 1, 1, 1,
-1.519065, -0.4520497, -2.834069, 1, 1, 1, 1, 1,
-1.511025, -0.2374154, -0.951126, 1, 1, 1, 1, 1,
-1.495403, -0.5763797, -1.739306, 1, 1, 1, 1, 1,
-1.493364, -1.739125, -4.315868, 1, 1, 1, 1, 1,
-1.488671, 0.4170478, -1.40258, 1, 1, 1, 1, 1,
-1.471599, 0.07378241, -0.3630256, 1, 1, 1, 1, 1,
-1.46979, 0.8683184, -0.7867265, 1, 1, 1, 1, 1,
-1.438416, 0.2979162, -1.067072, 1, 1, 1, 1, 1,
-1.428088, 1.110397, -0.6256953, 0, 0, 1, 1, 1,
-1.417024, 0.7709691, -0.8884937, 1, 0, 0, 1, 1,
-1.410804, 0.7314704, -2.351255, 1, 0, 0, 1, 1,
-1.401364, 0.2547631, -2.457364, 1, 0, 0, 1, 1,
-1.396693, -1.101027, -3.115036, 1, 0, 0, 1, 1,
-1.393005, 2.507684, 1.788972, 1, 0, 0, 1, 1,
-1.389114, -1.30715, -3.743892, 0, 0, 0, 1, 1,
-1.376549, -0.3182571, -1.938651, 0, 0, 0, 1, 1,
-1.37144, -0.4704447, -1.889703, 0, 0, 0, 1, 1,
-1.35262, 0.1863493, -1.705137, 0, 0, 0, 1, 1,
-1.35155, 0.3775512, -1.078085, 0, 0, 0, 1, 1,
-1.351229, -1.293927, -4.069695, 0, 0, 0, 1, 1,
-1.345509, 1.54386, -0.1056957, 0, 0, 0, 1, 1,
-1.340777, -0.5621951, -2.090093, 1, 1, 1, 1, 1,
-1.324269, -0.7933507, -1.370025, 1, 1, 1, 1, 1,
-1.315943, -0.7559282, -3.601063, 1, 1, 1, 1, 1,
-1.312901, -1.436593, -0.9069293, 1, 1, 1, 1, 1,
-1.299161, 1.181801, -1.971869, 1, 1, 1, 1, 1,
-1.294813, -0.9675481, -1.693088, 1, 1, 1, 1, 1,
-1.29399, 1.54748, 0.4032854, 1, 1, 1, 1, 1,
-1.290131, -1.008161, -1.211897, 1, 1, 1, 1, 1,
-1.283285, 3.643039e-05, -0.2390105, 1, 1, 1, 1, 1,
-1.279522, -0.2978965, -1.495482, 1, 1, 1, 1, 1,
-1.264409, 0.8447262, 0.0005471886, 1, 1, 1, 1, 1,
-1.261215, 1.265531, -0.667466, 1, 1, 1, 1, 1,
-1.256451, 0.1087558, -1.957199, 1, 1, 1, 1, 1,
-1.254858, 1.17295, -1.810917, 1, 1, 1, 1, 1,
-1.25455, -0.3194332, -1.132576, 1, 1, 1, 1, 1,
-1.249269, -1.395841, -3.626807, 0, 0, 1, 1, 1,
-1.244168, 0.6770372, -1.587455, 1, 0, 0, 1, 1,
-1.237977, 1.198097, -1.994662, 1, 0, 0, 1, 1,
-1.233336, -0.03453846, -1.465947, 1, 0, 0, 1, 1,
-1.232132, 0.8827263, 0.2632916, 1, 0, 0, 1, 1,
-1.218711, 0.4962569, 0.2910895, 1, 0, 0, 1, 1,
-1.216121, 1.403293, -1.090823, 0, 0, 0, 1, 1,
-1.213283, 0.6284802, -3.466037, 0, 0, 0, 1, 1,
-1.210545, 1.092201, -1.048536, 0, 0, 0, 1, 1,
-1.209082, -0.7484909, -1.930591, 0, 0, 0, 1, 1,
-1.201596, 1.919481, -0.8680321, 0, 0, 0, 1, 1,
-1.19523, -0.6948873, -3.67816, 0, 0, 0, 1, 1,
-1.193412, 0.6500266, -0.79716, 0, 0, 0, 1, 1,
-1.180941, -0.318762, -2.750736, 1, 1, 1, 1, 1,
-1.179553, 0.4348321, -3.265586, 1, 1, 1, 1, 1,
-1.177386, 1.176523, -1.423925, 1, 1, 1, 1, 1,
-1.175742, 0.5994558, -1.303025, 1, 1, 1, 1, 1,
-1.173341, -0.4829208, -2.729836, 1, 1, 1, 1, 1,
-1.16693, -0.1907534, -2.791589, 1, 1, 1, 1, 1,
-1.163764, 1.173963, -0.7726295, 1, 1, 1, 1, 1,
-1.157987, -0.457065, -3.364928, 1, 1, 1, 1, 1,
-1.148892, 1.194, -0.7065279, 1, 1, 1, 1, 1,
-1.148188, -0.1445873, -0.976558, 1, 1, 1, 1, 1,
-1.145932, -0.3490743, -3.272609, 1, 1, 1, 1, 1,
-1.132657, -1.597419, -3.767712, 1, 1, 1, 1, 1,
-1.13167, 0.1912254, -0.8885019, 1, 1, 1, 1, 1,
-1.126522, -0.01434643, -3.274929, 1, 1, 1, 1, 1,
-1.125108, 0.1202306, -3.209876, 1, 1, 1, 1, 1,
-1.117633, -1.163349, -2.890795, 0, 0, 1, 1, 1,
-1.113626, 0.451542, 0.4156365, 1, 0, 0, 1, 1,
-1.111444, -0.3394209, -2.146129, 1, 0, 0, 1, 1,
-1.111092, 0.9493845, -2.066177, 1, 0, 0, 1, 1,
-1.104449, -0.1333452, -0.6764359, 1, 0, 0, 1, 1,
-1.103296, -0.3267978, -2.026093, 1, 0, 0, 1, 1,
-1.100593, 0.1743514, -2.034328, 0, 0, 0, 1, 1,
-1.088089, -0.5246098, 0.1109787, 0, 0, 0, 1, 1,
-1.087227, -0.1249886, -0.1271027, 0, 0, 0, 1, 1,
-1.086339, -1.141947, -2.764656, 0, 0, 0, 1, 1,
-1.083254, 1.091473, -1.128712, 0, 0, 0, 1, 1,
-1.076737, 1.333933, -0.8489434, 0, 0, 0, 1, 1,
-1.06463, -0.7805774, -2.598371, 0, 0, 0, 1, 1,
-1.063576, -0.5098177, -1.499538, 1, 1, 1, 1, 1,
-1.054955, 0.411464, -0.7178282, 1, 1, 1, 1, 1,
-1.046289, 0.6299128, -1.697789, 1, 1, 1, 1, 1,
-1.041703, -0.9749516, -1.737402, 1, 1, 1, 1, 1,
-1.039889, -1.484541, -2.661448, 1, 1, 1, 1, 1,
-1.03962, 0.3280438, -0.2283848, 1, 1, 1, 1, 1,
-1.034834, 0.1939866, -0.8061242, 1, 1, 1, 1, 1,
-1.033699, 0.7649505, -0.4600835, 1, 1, 1, 1, 1,
-1.033364, 0.3442718, 0.1626324, 1, 1, 1, 1, 1,
-1.032779, -0.6107396, -1.485048, 1, 1, 1, 1, 1,
-1.031564, -1.708888, -2.997182, 1, 1, 1, 1, 1,
-1.029592, -0.02049231, -1.417874, 1, 1, 1, 1, 1,
-1.029488, -1.629749, -1.735378, 1, 1, 1, 1, 1,
-1.029173, 0.2560485, -1.682359, 1, 1, 1, 1, 1,
-1.020608, -1.084244, -2.898863, 1, 1, 1, 1, 1,
-1.014686, 0.5495469, 0.5613425, 0, 0, 1, 1, 1,
-1.014502, -1.501491, -2.124727, 1, 0, 0, 1, 1,
-1.009819, -0.5130146, -3.415127, 1, 0, 0, 1, 1,
-1.007461, -1.202725, -3.837718, 1, 0, 0, 1, 1,
-1.00271, -1.018966, -2.11074, 1, 0, 0, 1, 1,
-1.002483, 0.2234241, -1.147768, 1, 0, 0, 1, 1,
-0.9999829, -1.380032, -1.428085, 0, 0, 0, 1, 1,
-0.9992885, -1.817608, -3.013649, 0, 0, 0, 1, 1,
-0.9922679, 1.330056, -1.515885, 0, 0, 0, 1, 1,
-0.9823461, -1.071319, -3.149343, 0, 0, 0, 1, 1,
-0.9810308, 0.7546872, -0.8248721, 0, 0, 0, 1, 1,
-0.969074, -0.2840455, -1.691987, 0, 0, 0, 1, 1,
-0.9674309, -1.845573, -4.846475, 0, 0, 0, 1, 1,
-0.965504, -0.7288864, -2.852526, 1, 1, 1, 1, 1,
-0.9633295, -0.07735971, -2.088436, 1, 1, 1, 1, 1,
-0.9623665, 0.7818639, -0.6656214, 1, 1, 1, 1, 1,
-0.9611521, -1.022253, -2.51791, 1, 1, 1, 1, 1,
-0.9605445, 0.582159, -1.127642, 1, 1, 1, 1, 1,
-0.9552883, -0.240279, -0.5981658, 1, 1, 1, 1, 1,
-0.9521525, 0.9166059, -0.4679583, 1, 1, 1, 1, 1,
-0.9516225, -1.006547, -3.508132, 1, 1, 1, 1, 1,
-0.9465932, -0.3939904, -2.442608, 1, 1, 1, 1, 1,
-0.9465277, -0.6784346, -2.378904, 1, 1, 1, 1, 1,
-0.9388014, 1.227197, -3.569048, 1, 1, 1, 1, 1,
-0.9334033, -0.6693245, -2.173362, 1, 1, 1, 1, 1,
-0.9267394, -1.081087, -1.941614, 1, 1, 1, 1, 1,
-0.9232392, -0.8473785, -1.971759, 1, 1, 1, 1, 1,
-0.9229679, -0.217387, -3.39298, 1, 1, 1, 1, 1,
-0.9203398, -0.1716446, -2.672482, 0, 0, 1, 1, 1,
-0.9168342, -0.1738905, -1.252488, 1, 0, 0, 1, 1,
-0.9158764, 1.418012, 0.4613685, 1, 0, 0, 1, 1,
-0.913869, 0.1701675, -2.698392, 1, 0, 0, 1, 1,
-0.9137967, 0.3631231, -1.459845, 1, 0, 0, 1, 1,
-0.9089007, 0.9129008, -1.141653, 1, 0, 0, 1, 1,
-0.9014764, 0.7225714, -0.0188832, 0, 0, 0, 1, 1,
-0.8984413, 1.281072, -1.805164, 0, 0, 0, 1, 1,
-0.8963335, 0.1938065, -1.676386, 0, 0, 0, 1, 1,
-0.8951876, -1.452469, -1.838875, 0, 0, 0, 1, 1,
-0.8927611, -1.036237, -2.497886, 0, 0, 0, 1, 1,
-0.8760591, -0.987444, -1.738841, 0, 0, 0, 1, 1,
-0.8739411, -0.1881155, -0.5108067, 0, 0, 0, 1, 1,
-0.8720809, -0.9199625, -1.780836, 1, 1, 1, 1, 1,
-0.8711306, 0.7711374, -0.2133547, 1, 1, 1, 1, 1,
-0.8669421, -1.109545, -3.461374, 1, 1, 1, 1, 1,
-0.8611858, -0.1923321, -0.572569, 1, 1, 1, 1, 1,
-0.859328, 0.3977021, -0.9792057, 1, 1, 1, 1, 1,
-0.8588371, -1.673247, -3.107622, 1, 1, 1, 1, 1,
-0.8506218, 0.6347986, -0.6515905, 1, 1, 1, 1, 1,
-0.850376, -0.07434694, -0.2873736, 1, 1, 1, 1, 1,
-0.8481057, -0.3528057, -0.8431207, 1, 1, 1, 1, 1,
-0.8361493, -0.5751856, -2.932897, 1, 1, 1, 1, 1,
-0.8338755, -0.5984394, -1.792186, 1, 1, 1, 1, 1,
-0.829974, -2.087561, -2.126392, 1, 1, 1, 1, 1,
-0.8288503, 0.4671097, -2.34471, 1, 1, 1, 1, 1,
-0.817067, 1.291501, 0.3213373, 1, 1, 1, 1, 1,
-0.8169966, -1.051934, -2.351785, 1, 1, 1, 1, 1,
-0.8160667, 0.1040626, -2.291514, 0, 0, 1, 1, 1,
-0.8150049, -0.8924875, -4.952173, 1, 0, 0, 1, 1,
-0.8148376, -1.015297, -2.140806, 1, 0, 0, 1, 1,
-0.81474, 0.2616324, -0.813512, 1, 0, 0, 1, 1,
-0.8079758, 0.8105584, -1.421911, 1, 0, 0, 1, 1,
-0.8062164, -1.102385, -3.568168, 1, 0, 0, 1, 1,
-0.7922298, 0.6022685, -1.351065, 0, 0, 0, 1, 1,
-0.7891965, 0.8386049, -1.881783, 0, 0, 0, 1, 1,
-0.7862272, -0.3284194, -3.497891, 0, 0, 0, 1, 1,
-0.7790955, -0.5500217, -1.12452, 0, 0, 0, 1, 1,
-0.77398, 0.820959, 0.5811789, 0, 0, 0, 1, 1,
-0.7727557, -0.3290879, -3.312004, 0, 0, 0, 1, 1,
-0.7702219, -1.018358, -1.619752, 0, 0, 0, 1, 1,
-0.7657194, -0.7853432, -2.669167, 1, 1, 1, 1, 1,
-0.756916, 0.2048368, -0.3539031, 1, 1, 1, 1, 1,
-0.7567461, 1.35519, -0.6760339, 1, 1, 1, 1, 1,
-0.7566156, -0.8742387, -2.127237, 1, 1, 1, 1, 1,
-0.7538414, 0.3285041, -2.005789, 1, 1, 1, 1, 1,
-0.7535986, 0.3737397, -1.666119, 1, 1, 1, 1, 1,
-0.7527836, 0.3550946, -1.241798, 1, 1, 1, 1, 1,
-0.7457522, 2.438481, -0.6752604, 1, 1, 1, 1, 1,
-0.7330068, 2.553033, 0.6609187, 1, 1, 1, 1, 1,
-0.7325328, 0.1330979, -0.9382287, 1, 1, 1, 1, 1,
-0.7216091, 1.653582, -0.51364, 1, 1, 1, 1, 1,
-0.7209833, 1.068185, -0.5981237, 1, 1, 1, 1, 1,
-0.7202789, 0.1667386, -1.731159, 1, 1, 1, 1, 1,
-0.7193035, 0.7775234, -2.708896, 1, 1, 1, 1, 1,
-0.7169946, 1.161331, -0.4572586, 1, 1, 1, 1, 1,
-0.7163382, 0.2790101, -0.232982, 0, 0, 1, 1, 1,
-0.7150192, 1.866927, 0.2302489, 1, 0, 0, 1, 1,
-0.7142093, -0.5000036, -2.433032, 1, 0, 0, 1, 1,
-0.7131277, -0.172762, -0.3419716, 1, 0, 0, 1, 1,
-0.7122166, 0.3215277, -1.362204, 1, 0, 0, 1, 1,
-0.6928005, 0.8358706, -0.6081824, 1, 0, 0, 1, 1,
-0.6881402, 0.1306997, -2.008853, 0, 0, 0, 1, 1,
-0.6865708, -0.9493114, -2.430549, 0, 0, 0, 1, 1,
-0.683504, 1.223634, -2.21203, 0, 0, 0, 1, 1,
-0.6801506, 0.2010747, -3.373194, 0, 0, 0, 1, 1,
-0.679344, 0.3225516, -1.00367, 0, 0, 0, 1, 1,
-0.6783636, -0.3212453, -3.189102, 0, 0, 0, 1, 1,
-0.6746093, 1.892748, -0.3439391, 0, 0, 0, 1, 1,
-0.6745611, -0.2025064, -2.353084, 1, 1, 1, 1, 1,
-0.6745121, -0.049692, -0.5994233, 1, 1, 1, 1, 1,
-0.6740617, -1.301864, -2.102444, 1, 1, 1, 1, 1,
-0.6726653, 1.159784, 0.1828982, 1, 1, 1, 1, 1,
-0.6721827, -0.7739216, -2.888941, 1, 1, 1, 1, 1,
-0.670971, -1.56599, -1.554549, 1, 1, 1, 1, 1,
-0.6701574, 0.1282796, -1.331586, 1, 1, 1, 1, 1,
-0.6687887, -1.100914, -2.803039, 1, 1, 1, 1, 1,
-0.6679065, 0.2162449, -2.895689, 1, 1, 1, 1, 1,
-0.661804, -1.502232, -2.575945, 1, 1, 1, 1, 1,
-0.6602841, 0.2122144, -1.188421, 1, 1, 1, 1, 1,
-0.6599538, -0.9720001, -3.331633, 1, 1, 1, 1, 1,
-0.6549889, 1.466775, -0.5763847, 1, 1, 1, 1, 1,
-0.6531679, 0.3005717, -1.486181, 1, 1, 1, 1, 1,
-0.6527551, -0.1149417, -2.367162, 1, 1, 1, 1, 1,
-0.6525588, 0.6813896, -0.4655691, 0, 0, 1, 1, 1,
-0.6481007, -1.447427, -2.336537, 1, 0, 0, 1, 1,
-0.6462772, -0.4808045, -3.281428, 1, 0, 0, 1, 1,
-0.6432667, 0.2874235, -1.372786, 1, 0, 0, 1, 1,
-0.6422867, 1.565973, -1.615811, 1, 0, 0, 1, 1,
-0.6402856, 0.2521889, -1.831737, 1, 0, 0, 1, 1,
-0.6392261, -0.6632909, -4.388188, 0, 0, 0, 1, 1,
-0.636735, -0.2903292, -1.894968, 0, 0, 0, 1, 1,
-0.6336985, -1.165901, -0.8184804, 0, 0, 0, 1, 1,
-0.6335627, 0.0963451, -1.840928, 0, 0, 0, 1, 1,
-0.6315112, -0.4180709, -2.225342, 0, 0, 0, 1, 1,
-0.6297379, -0.1204323, -1.909629, 0, 0, 0, 1, 1,
-0.6294231, 0.1657397, -1.35405, 0, 0, 0, 1, 1,
-0.6281316, 0.2674831, -0.7918018, 1, 1, 1, 1, 1,
-0.6272424, -1.059751, -2.282599, 1, 1, 1, 1, 1,
-0.62383, 0.009667719, -2.70111, 1, 1, 1, 1, 1,
-0.6205003, 1.339777, -0.3696337, 1, 1, 1, 1, 1,
-0.619548, -1.240916, -2.138193, 1, 1, 1, 1, 1,
-0.618951, -2.222623, -1.937205, 1, 1, 1, 1, 1,
-0.6184827, 0.1539354, -2.937092, 1, 1, 1, 1, 1,
-0.6147051, 0.3212872, -2.287343, 1, 1, 1, 1, 1,
-0.6140698, -1.246209, -1.826437, 1, 1, 1, 1, 1,
-0.6132785, 1.695628, 1.289173, 1, 1, 1, 1, 1,
-0.6121145, -1.765149, -1.539745, 1, 1, 1, 1, 1,
-0.6118472, 0.3014656, -1.638575, 1, 1, 1, 1, 1,
-0.6106461, -0.3019341, -1.893228, 1, 1, 1, 1, 1,
-0.6082625, 0.1615886, -1.077764, 1, 1, 1, 1, 1,
-0.6073506, -1.196182, -1.893819, 1, 1, 1, 1, 1,
-0.6039855, -0.3644865, -3.02851, 0, 0, 1, 1, 1,
-0.5967295, -0.7917759, -2.830654, 1, 0, 0, 1, 1,
-0.5944021, 0.1043171, -1.796508, 1, 0, 0, 1, 1,
-0.592259, -0.9911474, -2.221693, 1, 0, 0, 1, 1,
-0.5890446, 0.5662386, -0.02878479, 1, 0, 0, 1, 1,
-0.5878471, 0.5412248, -0.8317367, 1, 0, 0, 1, 1,
-0.5864601, 1.002063, -1.999578, 0, 0, 0, 1, 1,
-0.5833732, -0.9027998, -3.898995, 0, 0, 0, 1, 1,
-0.5807076, -1.160148, -4.387194, 0, 0, 0, 1, 1,
-0.5773943, 0.3235067, -1.914521, 0, 0, 0, 1, 1,
-0.5762377, 1.102128, -2.615939, 0, 0, 0, 1, 1,
-0.5757192, -1.065637, -2.436983, 0, 0, 0, 1, 1,
-0.5715507, 1.133333, -0.6172085, 0, 0, 0, 1, 1,
-0.5627635, 0.8029255, 0.4234902, 1, 1, 1, 1, 1,
-0.5613995, 0.7655793, 0.2576591, 1, 1, 1, 1, 1,
-0.5609304, -1.515683, -4.162459, 1, 1, 1, 1, 1,
-0.5577968, -0.2371103, -3.167061, 1, 1, 1, 1, 1,
-0.5568436, -0.5495821, -2.428701, 1, 1, 1, 1, 1,
-0.5557341, -0.8426139, -1.121187, 1, 1, 1, 1, 1,
-0.5503432, -0.1242947, -0.3634592, 1, 1, 1, 1, 1,
-0.5500957, -1.592725, -2.540945, 1, 1, 1, 1, 1,
-0.5495639, 0.1415612, -1.115442, 1, 1, 1, 1, 1,
-0.5481652, -1.751261, -2.560917, 1, 1, 1, 1, 1,
-0.5453656, -1.242265, -1.820286, 1, 1, 1, 1, 1,
-0.5453567, 0.3010647, -0.9795362, 1, 1, 1, 1, 1,
-0.5439719, -1.65545, -1.901693, 1, 1, 1, 1, 1,
-0.5423695, 1.051268, 1.156976, 1, 1, 1, 1, 1,
-0.5410733, -1.137051, -2.916705, 1, 1, 1, 1, 1,
-0.5404724, 0.01927015, -2.108625, 0, 0, 1, 1, 1,
-0.5323249, -0.128089, -2.11233, 1, 0, 0, 1, 1,
-0.5319964, -0.8110487, -2.987857, 1, 0, 0, 1, 1,
-0.5286077, -1.050785, -4.06392, 1, 0, 0, 1, 1,
-0.526437, 0.6511089, -0.2924536, 1, 0, 0, 1, 1,
-0.524489, 0.8959976, -0.08341338, 1, 0, 0, 1, 1,
-0.5223474, 0.5431758, -0.8051004, 0, 0, 0, 1, 1,
-0.514599, 0.4346632, -0.9636779, 0, 0, 0, 1, 1,
-0.5093537, -0.3437126, -1.859879, 0, 0, 0, 1, 1,
-0.5018744, 1.222412, 0.4796942, 0, 0, 0, 1, 1,
-0.4989219, -0.2565198, -2.543921, 0, 0, 0, 1, 1,
-0.4952096, 0.9046351, 0.3230668, 0, 0, 0, 1, 1,
-0.4931999, -1.437991, -3.009383, 0, 0, 0, 1, 1,
-0.4900467, -1.483308, -2.983179, 1, 1, 1, 1, 1,
-0.4881945, -0.6466002, -2.241075, 1, 1, 1, 1, 1,
-0.4874208, -0.787439, -3.056954, 1, 1, 1, 1, 1,
-0.4827806, -0.9555991, -3.401555, 1, 1, 1, 1, 1,
-0.4804448, 0.0729503, -1.239859, 1, 1, 1, 1, 1,
-0.4796046, -0.440304, -2.513288, 1, 1, 1, 1, 1,
-0.4751872, -0.5366639, -2.107416, 1, 1, 1, 1, 1,
-0.4730596, -0.6294042, -4.612842, 1, 1, 1, 1, 1,
-0.4672461, 1.499018, -0.350098, 1, 1, 1, 1, 1,
-0.4620522, -1.221945, -3.015841, 1, 1, 1, 1, 1,
-0.4584193, -1.396186, -2.053413, 1, 1, 1, 1, 1,
-0.4534195, 0.00227294, -1.943572, 1, 1, 1, 1, 1,
-0.4467203, -0.08878972, -2.187345, 1, 1, 1, 1, 1,
-0.4387017, 0.2414751, -0.750838, 1, 1, 1, 1, 1,
-0.4380856, 0.1123707, -1.751431, 1, 1, 1, 1, 1,
-0.4341607, -1.116683, -3.326558, 0, 0, 1, 1, 1,
-0.4210814, -0.4500689, -1.803394, 1, 0, 0, 1, 1,
-0.4195556, -0.2843044, -2.170568, 1, 0, 0, 1, 1,
-0.4190328, -0.02997723, -1.424783, 1, 0, 0, 1, 1,
-0.4180924, 0.4820399, 1.036132, 1, 0, 0, 1, 1,
-0.416491, 1.305843, 0.4348015, 1, 0, 0, 1, 1,
-0.4142989, -0.3863257, -1.845716, 0, 0, 0, 1, 1,
-0.4115188, -0.1481078, -2.670046, 0, 0, 0, 1, 1,
-0.4088511, -0.3198569, -3.096475, 0, 0, 0, 1, 1,
-0.4073359, 0.9015273, -0.01958975, 0, 0, 0, 1, 1,
-0.4046039, -1.782796, -2.772907, 0, 0, 0, 1, 1,
-0.4044609, 0.6297559, -0.06652977, 0, 0, 0, 1, 1,
-0.4032998, -0.002097845, -1.467847, 0, 0, 0, 1, 1,
-0.3984951, -0.03684482, -1.997305, 1, 1, 1, 1, 1,
-0.3968688, -0.5751422, -2.969529, 1, 1, 1, 1, 1,
-0.396701, -0.008053312, -0.8588067, 1, 1, 1, 1, 1,
-0.3922505, 0.6015338, -1.655485, 1, 1, 1, 1, 1,
-0.3915803, -0.2794969, -2.190495, 1, 1, 1, 1, 1,
-0.3884418, -0.8003889, -3.276454, 1, 1, 1, 1, 1,
-0.3827996, -2.011872, -3.717091, 1, 1, 1, 1, 1,
-0.3821545, -0.5692307, -1.350154, 1, 1, 1, 1, 1,
-0.3811308, 0.4312274, -0.3337893, 1, 1, 1, 1, 1,
-0.3803588, -1.742125, -3.526891, 1, 1, 1, 1, 1,
-0.3775555, -1.226874, -4.158556, 1, 1, 1, 1, 1,
-0.3773684, 0.7305688, 0.1176957, 1, 1, 1, 1, 1,
-0.3746099, -2.211736, -3.202618, 1, 1, 1, 1, 1,
-0.3687569, -0.3885316, -1.79163, 1, 1, 1, 1, 1,
-0.3670213, 1.439659, 0.8312582, 1, 1, 1, 1, 1,
-0.3653538, -0.106558, -1.459183, 0, 0, 1, 1, 1,
-0.3600492, 1.006744, -2.367134, 1, 0, 0, 1, 1,
-0.3575196, -0.9900916, -0.1448921, 1, 0, 0, 1, 1,
-0.3476549, 1.030742, -0.4622086, 1, 0, 0, 1, 1,
-0.3468516, 0.5187645, -0.09064432, 1, 0, 0, 1, 1,
-0.3436354, -0.8615094, -1.18217, 1, 0, 0, 1, 1,
-0.340692, 0.2799122, -2.32468, 0, 0, 0, 1, 1,
-0.3361716, 0.7847294, -1.033661, 0, 0, 0, 1, 1,
-0.3327464, -0.7723728, -1.189169, 0, 0, 0, 1, 1,
-0.3282858, 0.4323722, 0.6324337, 0, 0, 0, 1, 1,
-0.3255305, -0.04584524, -1.838309, 0, 0, 0, 1, 1,
-0.3149233, -1.702309, -3.781862, 0, 0, 0, 1, 1,
-0.3138982, 0.007914195, -1.721922, 0, 0, 0, 1, 1,
-0.312911, -1.486763, -2.960987, 1, 1, 1, 1, 1,
-0.3122075, 0.9474106, -0.8538217, 1, 1, 1, 1, 1,
-0.3035212, 1.005159, -1.370536, 1, 1, 1, 1, 1,
-0.3032678, 1.643091, -0.1857801, 1, 1, 1, 1, 1,
-0.3031785, 0.2653445, -2.250076, 1, 1, 1, 1, 1,
-0.3014309, -0.006335886, -1.58147, 1, 1, 1, 1, 1,
-0.3008683, 1.319455, -0.7005835, 1, 1, 1, 1, 1,
-0.2993282, 0.1754845, -1.101355, 1, 1, 1, 1, 1,
-0.2982949, 0.3114054, -0.3388472, 1, 1, 1, 1, 1,
-0.295787, 0.747491, 0.7153351, 1, 1, 1, 1, 1,
-0.2929541, -0.9958342, -2.669137, 1, 1, 1, 1, 1,
-0.2879495, 0.1025172, -0.6594952, 1, 1, 1, 1, 1,
-0.2867385, -1.553842, -2.079621, 1, 1, 1, 1, 1,
-0.2828009, 0.9886998, -1.919691, 1, 1, 1, 1, 1,
-0.2758419, -0.04932304, -1.54667, 1, 1, 1, 1, 1,
-0.2742479, 1.669006, -1.636535, 0, 0, 1, 1, 1,
-0.2689422, -0.5796618, -3.966739, 1, 0, 0, 1, 1,
-0.2685557, 1.220599, -1.950511, 1, 0, 0, 1, 1,
-0.2669529, -0.9438555, -5.106095, 1, 0, 0, 1, 1,
-0.260503, -0.6402377, -1.732862, 1, 0, 0, 1, 1,
-0.2599399, -0.02266549, -0.8211269, 1, 0, 0, 1, 1,
-0.2540972, -0.553793, -3.448292, 0, 0, 0, 1, 1,
-0.2443722, 0.4391409, -1.098728, 0, 0, 0, 1, 1,
-0.2418537, 1.832622, -0.4499345, 0, 0, 0, 1, 1,
-0.2376458, 0.06032325, -0.3075334, 0, 0, 0, 1, 1,
-0.2333376, -2.272092, -4.058323, 0, 0, 0, 1, 1,
-0.2292406, 0.8220644, 0.1501293, 0, 0, 0, 1, 1,
-0.2278493, 0.2540242, -0.6109331, 0, 0, 0, 1, 1,
-0.225493, -0.9646134, -1.695986, 1, 1, 1, 1, 1,
-0.2228238, 1.199783, 0.8142589, 1, 1, 1, 1, 1,
-0.220277, -0.2882532, -0.6783244, 1, 1, 1, 1, 1,
-0.2142007, 1.302694, 2.293915, 1, 1, 1, 1, 1,
-0.2114413, 0.1492004, -1.701503, 1, 1, 1, 1, 1,
-0.2089223, 1.535196, -0.5520006, 1, 1, 1, 1, 1,
-0.208436, 1.118064, -1.367252, 1, 1, 1, 1, 1,
-0.201106, 0.2418538, -0.9884786, 1, 1, 1, 1, 1,
-0.1967974, 2.171966, 0.3830288, 1, 1, 1, 1, 1,
-0.1963166, -0.04236974, -3.176841, 1, 1, 1, 1, 1,
-0.1962461, -1.295969, -2.240613, 1, 1, 1, 1, 1,
-0.1954429, 1.545873, -1.193413, 1, 1, 1, 1, 1,
-0.1913502, -1.848478, -4.282293, 1, 1, 1, 1, 1,
-0.1902845, -0.9426858, -3.768675, 1, 1, 1, 1, 1,
-0.1705029, -0.01500781, -3.939689, 1, 1, 1, 1, 1,
-0.1702682, 0.2391898, -0.8210739, 0, 0, 1, 1, 1,
-0.1569802, 0.2384835, -1.345374, 1, 0, 0, 1, 1,
-0.1566225, 0.3998488, 0.4689994, 1, 0, 0, 1, 1,
-0.1543281, 1.862586, -0.9486679, 1, 0, 0, 1, 1,
-0.1531726, -1.660177, -1.039918, 1, 0, 0, 1, 1,
-0.1528127, -0.04764073, -2.264342, 1, 0, 0, 1, 1,
-0.1505092, 0.9262216, -1.096858, 0, 0, 0, 1, 1,
-0.1487761, 0.7484483, 0.2933575, 0, 0, 0, 1, 1,
-0.1483582, 0.07130522, -0.9066612, 0, 0, 0, 1, 1,
-0.1481814, 0.008500767, -0.5394598, 0, 0, 0, 1, 1,
-0.1447058, -0.08942451, -3.13191, 0, 0, 0, 1, 1,
-0.1440806, 1.263954, -1.713672, 0, 0, 0, 1, 1,
-0.1395688, 0.8185841, 0.7415391, 0, 0, 0, 1, 1,
-0.1369356, 1.130434, -1.580477, 1, 1, 1, 1, 1,
-0.1366166, -0.448962, -2.298508, 1, 1, 1, 1, 1,
-0.1357379, 0.5339456, -0.5395814, 1, 1, 1, 1, 1,
-0.1351812, 0.5496212, -0.08842874, 1, 1, 1, 1, 1,
-0.1317582, 1.138233, -2.14912, 1, 1, 1, 1, 1,
-0.1310932, -1.369067, -3.065721, 1, 1, 1, 1, 1,
-0.1286062, 0.3739542, -1.141018, 1, 1, 1, 1, 1,
-0.1215506, 0.3537189, 1.037903, 1, 1, 1, 1, 1,
-0.1143411, -0.3084451, -3.090736, 1, 1, 1, 1, 1,
-0.1127853, -0.9599144, -3.437673, 1, 1, 1, 1, 1,
-0.1117557, 0.04398775, -0.8325011, 1, 1, 1, 1, 1,
-0.1077888, -2.303061, -3.190833, 1, 1, 1, 1, 1,
-0.1054035, 0.1872237, -0.1247767, 1, 1, 1, 1, 1,
-0.1051, 0.4659147, 0.01238938, 1, 1, 1, 1, 1,
-0.1026411, 2.122212, -0.4473172, 1, 1, 1, 1, 1,
-0.1022227, -0.4802099, -3.090153, 0, 0, 1, 1, 1,
-0.1013787, -1.252498, -2.58459, 1, 0, 0, 1, 1,
-0.09655952, 0.6196837, -0.4486562, 1, 0, 0, 1, 1,
-0.09397671, -1.739781, -2.983243, 1, 0, 0, 1, 1,
-0.08679592, 0.7830292, 2.567204, 1, 0, 0, 1, 1,
-0.07758427, -0.4748881, -1.456858, 1, 0, 0, 1, 1,
-0.07577055, 1.16161, 0.1597313, 0, 0, 0, 1, 1,
-0.07428458, -0.0009190437, -0.4425049, 0, 0, 0, 1, 1,
-0.07417835, 0.7567134, 1.164448, 0, 0, 0, 1, 1,
-0.07395041, 2.350745, -1.682501, 0, 0, 0, 1, 1,
-0.07384125, 1.102271, -0.4606394, 0, 0, 0, 1, 1,
-0.06717255, 0.7530261, -0.814675, 0, 0, 0, 1, 1,
-0.06711712, 0.5086378, -0.4447059, 0, 0, 0, 1, 1,
-0.06381609, -0.03720092, -2.861969, 1, 1, 1, 1, 1,
-0.05876901, -0.1285304, -3.11293, 1, 1, 1, 1, 1,
-0.05729467, 0.4334224, -0.4069988, 1, 1, 1, 1, 1,
-0.05576244, 1.404959, 0.1691475, 1, 1, 1, 1, 1,
-0.05417106, -0.2881092, -1.212104, 1, 1, 1, 1, 1,
-0.05270192, -0.90704, -1.310211, 1, 1, 1, 1, 1,
-0.05255753, 0.6072987, -1.176861, 1, 1, 1, 1, 1,
-0.04952386, 0.5498054, -0.6973389, 1, 1, 1, 1, 1,
-0.04843559, -0.4123937, -3.289707, 1, 1, 1, 1, 1,
-0.04708139, -0.1850643, -0.342135, 1, 1, 1, 1, 1,
-0.04500674, -0.6128738, -4.038743, 1, 1, 1, 1, 1,
-0.04002003, 0.814025, 0.7415249, 1, 1, 1, 1, 1,
-0.03706885, -0.3383288, -3.249594, 1, 1, 1, 1, 1,
-0.03535068, -0.7499349, -2.753052, 1, 1, 1, 1, 1,
-0.03532395, -1.129732, -4.971144, 1, 1, 1, 1, 1,
-0.03405379, 1.57384, 1.072723, 0, 0, 1, 1, 1,
-0.03379593, 0.7492623, 0.8308978, 1, 0, 0, 1, 1,
-0.03139909, -1.451562, -4.5275, 1, 0, 0, 1, 1,
-0.02900514, 0.3280682, 0.1933318, 1, 0, 0, 1, 1,
-0.02799191, -0.7881278, -2.694888, 1, 0, 0, 1, 1,
-0.02505342, -0.1849722, -3.95272, 1, 0, 0, 1, 1,
-0.02476543, 0.354033, 0.1550705, 0, 0, 0, 1, 1,
-0.02172152, -0.3129365, -4.997266, 0, 0, 0, 1, 1,
-0.02078169, -0.5890688, -3.534804, 0, 0, 0, 1, 1,
-0.01942909, 0.08805236, -1.039406, 0, 0, 0, 1, 1,
-0.01912169, -0.1022929, -2.466661, 0, 0, 0, 1, 1,
-0.01821732, 0.1518514, 0.05322187, 0, 0, 0, 1, 1,
-0.01730453, -0.2643943, -3.759248, 0, 0, 0, 1, 1,
-0.01368709, 0.9230315, 0.8451809, 1, 1, 1, 1, 1,
-0.0006793404, -0.3355272, -3.716175, 1, 1, 1, 1, 1,
0.002535179, 0.3055162, -0.02800642, 1, 1, 1, 1, 1,
0.009864238, -1.668029, 3.439625, 1, 1, 1, 1, 1,
0.0099369, 0.3200896, 0.5373827, 1, 1, 1, 1, 1,
0.01061668, -1.07233, 2.780008, 1, 1, 1, 1, 1,
0.01393147, -1.715919, 1.988991, 1, 1, 1, 1, 1,
0.02077971, -1.375254, 1.393633, 1, 1, 1, 1, 1,
0.03361768, 1.983464, -0.4017831, 1, 1, 1, 1, 1,
0.03466426, -0.5199049, 1.334787, 1, 1, 1, 1, 1,
0.03851883, -1.67752, 2.855083, 1, 1, 1, 1, 1,
0.04246655, -1.147602, 2.518109, 1, 1, 1, 1, 1,
0.04408734, -0.9610578, 2.23858, 1, 1, 1, 1, 1,
0.045745, -0.2104554, 1.927091, 1, 1, 1, 1, 1,
0.04682683, -0.475694, 2.994937, 1, 1, 1, 1, 1,
0.04718421, 1.255857, 0.3509661, 0, 0, 1, 1, 1,
0.0511599, -0.2004822, 2.611414, 1, 0, 0, 1, 1,
0.05418193, 1.153604, 1.073547, 1, 0, 0, 1, 1,
0.05920861, -0.1418539, 2.211619, 1, 0, 0, 1, 1,
0.06276413, 0.04208654, 1.990762, 1, 0, 0, 1, 1,
0.06583854, -1.379901, 3.346753, 1, 0, 0, 1, 1,
0.06770588, -0.5621611, 3.892967, 0, 0, 0, 1, 1,
0.0801965, -1.142012, 2.494731, 0, 0, 0, 1, 1,
0.08129591, -2.260551, 4.017506, 0, 0, 0, 1, 1,
0.08213973, 0.1147416, 2.403882, 0, 0, 0, 1, 1,
0.0834527, 0.8255542, 1.000193, 0, 0, 0, 1, 1,
0.08563004, 2.208858, -1.192671, 0, 0, 0, 1, 1,
0.0895782, -0.360664, 3.266756, 0, 0, 0, 1, 1,
0.09373379, -0.2677166, 3.539696, 1, 1, 1, 1, 1,
0.0952941, 0.09717339, -0.7846364, 1, 1, 1, 1, 1,
0.09536232, 0.9468413, -0.5865312, 1, 1, 1, 1, 1,
0.106831, 0.4490893, -0.8465163, 1, 1, 1, 1, 1,
0.1085944, 2.782082, 0.161772, 1, 1, 1, 1, 1,
0.1095668, 0.227843, 0.09670777, 1, 1, 1, 1, 1,
0.1101342, 0.5830938, -0.658718, 1, 1, 1, 1, 1,
0.1157571, -0.4759273, 3.348791, 1, 1, 1, 1, 1,
0.1179585, 0.8128268, 0.1282942, 1, 1, 1, 1, 1,
0.1206223, -0.0630495, 0.5495274, 1, 1, 1, 1, 1,
0.1218377, -0.1881687, 1.420638, 1, 1, 1, 1, 1,
0.1232163, 0.4003001, 1.784938, 1, 1, 1, 1, 1,
0.1259098, -0.4920614, 3.966178, 1, 1, 1, 1, 1,
0.1264667, 1.151258, -0.1521674, 1, 1, 1, 1, 1,
0.1272593, -0.751544, 2.921564, 1, 1, 1, 1, 1,
0.1370091, 2.207709, -0.1733406, 0, 0, 1, 1, 1,
0.1407245, -0.0492559, 0.7988302, 1, 0, 0, 1, 1,
0.1420495, -0.02183924, 0.1734939, 1, 0, 0, 1, 1,
0.1451992, 0.5703849, -0.6991698, 1, 0, 0, 1, 1,
0.1452628, 0.4072103, 0.3388599, 1, 0, 0, 1, 1,
0.1491241, -0.1657428, 3.341908, 1, 0, 0, 1, 1,
0.1496762, -1.341864, 2.222697, 0, 0, 0, 1, 1,
0.1499508, 1.370381, 0.4353425, 0, 0, 0, 1, 1,
0.1606174, 0.2375551, 1.350225, 0, 0, 0, 1, 1,
0.1623261, 1.227186, 0.9715499, 0, 0, 0, 1, 1,
0.1641544, 1.005854, 1.288214, 0, 0, 0, 1, 1,
0.1721916, -1.347065, 1.618045, 0, 0, 0, 1, 1,
0.1722072, -1.858494, 2.820183, 0, 0, 0, 1, 1,
0.1754293, 0.710061, 2.263788, 1, 1, 1, 1, 1,
0.1779056, -0.4747851, 3.20866, 1, 1, 1, 1, 1,
0.1839248, 0.7654203, 0.5842797, 1, 1, 1, 1, 1,
0.1863762, 1.012044, -0.9414598, 1, 1, 1, 1, 1,
0.1880817, -1.142398, 2.332716, 1, 1, 1, 1, 1,
0.195718, -0.06988835, 2.920344, 1, 1, 1, 1, 1,
0.1966682, -0.2961632, 2.94281, 1, 1, 1, 1, 1,
0.2030671, 1.054474, -0.9954284, 1, 1, 1, 1, 1,
0.2046493, 0.955128, -0.6352622, 1, 1, 1, 1, 1,
0.2069642, 0.3300099, 0.1694307, 1, 1, 1, 1, 1,
0.212462, 0.9741877, 0.2968931, 1, 1, 1, 1, 1,
0.2148023, -0.2429377, 2.817675, 1, 1, 1, 1, 1,
0.2149445, -1.822847, 3.073261, 1, 1, 1, 1, 1,
0.2178847, 0.7290187, 0.1633085, 1, 1, 1, 1, 1,
0.2179774, 2.099833, 0.4709617, 1, 1, 1, 1, 1,
0.2253384, 0.04028538, 1.959282, 0, 0, 1, 1, 1,
0.2280047, -0.04488827, 1.383942, 1, 0, 0, 1, 1,
0.231573, -1.177964, 3.167966, 1, 0, 0, 1, 1,
0.2333894, -0.06107981, 1.167177, 1, 0, 0, 1, 1,
0.2371431, 0.9253235, 0.0561276, 1, 0, 0, 1, 1,
0.2398086, -0.6309081, 4.523683, 1, 0, 0, 1, 1,
0.2410458, 1.259962, 0.4803776, 0, 0, 0, 1, 1,
0.2412793, -0.5828151, 1.809345, 0, 0, 0, 1, 1,
0.2437766, 0.4516851, -0.7538499, 0, 0, 0, 1, 1,
0.2453025, 0.3117187, 0.8580665, 0, 0, 0, 1, 1,
0.2486966, -0.3299083, 2.54306, 0, 0, 0, 1, 1,
0.2495089, 0.4441603, 1.878344, 0, 0, 0, 1, 1,
0.2497803, 1.007333, -1.486101, 0, 0, 0, 1, 1,
0.2505738, -1.068697, 3.805575, 1, 1, 1, 1, 1,
0.2523269, -0.362508, 1.458672, 1, 1, 1, 1, 1,
0.2525515, -1.62201, 3.869174, 1, 1, 1, 1, 1,
0.2552365, -0.1175061, 2.140685, 1, 1, 1, 1, 1,
0.2595954, -0.5701566, 3.534521, 1, 1, 1, 1, 1,
0.262051, 0.8162533, 0.738483, 1, 1, 1, 1, 1,
0.2639315, 1.010302, 1.390358, 1, 1, 1, 1, 1,
0.2650113, -0.1877958, 3.076642, 1, 1, 1, 1, 1,
0.2669742, -0.1073852, 2.837886, 1, 1, 1, 1, 1,
0.2742594, -0.4201091, 2.955279, 1, 1, 1, 1, 1,
0.2789724, 1.749102, 0.4207868, 1, 1, 1, 1, 1,
0.2811858, 0.1647739, 1.189118, 1, 1, 1, 1, 1,
0.2835636, -0.09111214, 1.675237, 1, 1, 1, 1, 1,
0.283866, 1.575835, -0.4803089, 1, 1, 1, 1, 1,
0.2875068, -0.2612923, 3.776105, 1, 1, 1, 1, 1,
0.2879246, -0.1605808, 3.152408, 0, 0, 1, 1, 1,
0.2904411, -0.6013879, 3.696116, 1, 0, 0, 1, 1,
0.2937556, 0.6180133, 0.3306992, 1, 0, 0, 1, 1,
0.2940814, 0.006505547, 2.433013, 1, 0, 0, 1, 1,
0.2956332, -0.5649819, 2.859505, 1, 0, 0, 1, 1,
0.2994055, -1.361898, 2.111294, 1, 0, 0, 1, 1,
0.3004489, -0.3735043, 3.015957, 0, 0, 0, 1, 1,
0.3035453, 0.8933211, 1.222626, 0, 0, 0, 1, 1,
0.307427, 1.626627, 0.2328044, 0, 0, 0, 1, 1,
0.3099769, -0.5516122, 4.02003, 0, 0, 0, 1, 1,
0.3127771, 1.090791, -0.4778603, 0, 0, 0, 1, 1,
0.3136211, -0.01201635, 2.661132, 0, 0, 0, 1, 1,
0.3151446, 1.373003, -1.348197, 0, 0, 0, 1, 1,
0.3152162, -0.2513016, 3.063191, 1, 1, 1, 1, 1,
0.3159635, -0.02026848, 1.990592, 1, 1, 1, 1, 1,
0.3234735, 2.025714, -0.6858585, 1, 1, 1, 1, 1,
0.3266783, -0.135492, 2.617904, 1, 1, 1, 1, 1,
0.3266935, 0.2428892, 0.2466425, 1, 1, 1, 1, 1,
0.3303936, 0.9790596, 0.739163, 1, 1, 1, 1, 1,
0.3351958, -0.5289645, 1.852697, 1, 1, 1, 1, 1,
0.3378461, 0.8382629, 0.2601437, 1, 1, 1, 1, 1,
0.3388815, 0.7198102, 0.1744841, 1, 1, 1, 1, 1,
0.339187, -1.750722, 2.174904, 1, 1, 1, 1, 1,
0.3431456, 2.41292, -0.3590855, 1, 1, 1, 1, 1,
0.3480632, 0.5194599, 0.3405337, 1, 1, 1, 1, 1,
0.3512826, 1.084679, 0.4955311, 1, 1, 1, 1, 1,
0.3530183, -1.676194, 2.976038, 1, 1, 1, 1, 1,
0.3533671, -1.843431, 1.141038, 1, 1, 1, 1, 1,
0.3604482, 0.3458303, 0.1191462, 0, 0, 1, 1, 1,
0.3649603, -0.02015374, 1.062807, 1, 0, 0, 1, 1,
0.3703703, 0.8476505, 1.798447, 1, 0, 0, 1, 1,
0.3714063, 0.3977552, 1.302233, 1, 0, 0, 1, 1,
0.3757927, -0.4216012, 1.653028, 1, 0, 0, 1, 1,
0.3769392, -0.2646487, 2.38917, 1, 0, 0, 1, 1,
0.3776597, -0.09285911, 2.862137, 0, 0, 0, 1, 1,
0.3963034, -0.6468636, 2.616204, 0, 0, 0, 1, 1,
0.3964167, -1.426881, 4.604223, 0, 0, 0, 1, 1,
0.396938, -0.8060442, 2.879693, 0, 0, 0, 1, 1,
0.4027644, 0.662479, 2.01909, 0, 0, 0, 1, 1,
0.4096427, -1.851725, 2.602771, 0, 0, 0, 1, 1,
0.412477, 0.988716, 1.193935, 0, 0, 0, 1, 1,
0.419014, -0.807385, 2.546792, 1, 1, 1, 1, 1,
0.4237269, 1.698617, 0.3647786, 1, 1, 1, 1, 1,
0.4290064, 1.237982, 0.3402337, 1, 1, 1, 1, 1,
0.4297253, -0.2274827, 3.086562, 1, 1, 1, 1, 1,
0.4316397, 0.199034, 0.7165027, 1, 1, 1, 1, 1,
0.4321256, -1.368295, 2.847998, 1, 1, 1, 1, 1,
0.4323294, 0.6739677, 0.1865124, 1, 1, 1, 1, 1,
0.433398, -2.159536, 3.840092, 1, 1, 1, 1, 1,
0.4376193, 0.3525746, 1.128331, 1, 1, 1, 1, 1,
0.4376685, 0.3883685, -0.3159715, 1, 1, 1, 1, 1,
0.4440894, -1.447305, 2.239973, 1, 1, 1, 1, 1,
0.4495908, 0.9095678, 0.161963, 1, 1, 1, 1, 1,
0.4496321, 2.279804, 1.565375, 1, 1, 1, 1, 1,
0.4535141, -0.1358321, 1.035592, 1, 1, 1, 1, 1,
0.4547102, 1.628445, -0.7880909, 1, 1, 1, 1, 1,
0.4568666, -0.2960815, 3.462256, 0, 0, 1, 1, 1,
0.458218, -0.3885943, 0.9530877, 1, 0, 0, 1, 1,
0.4594302, -0.8489956, 0.8329695, 1, 0, 0, 1, 1,
0.4616481, -0.264119, 2.001325, 1, 0, 0, 1, 1,
0.4646892, 2.050596, 1.331252, 1, 0, 0, 1, 1,
0.4656916, 2.548926, 1.417503, 1, 0, 0, 1, 1,
0.4670753, -0.6545457, 1.809046, 0, 0, 0, 1, 1,
0.4679899, 0.1224759, 1.539848, 0, 0, 0, 1, 1,
0.4686753, 0.2946265, 1.457172, 0, 0, 0, 1, 1,
0.4723229, 0.03402689, -0.3107607, 0, 0, 0, 1, 1,
0.473489, -0.579221, 3.989582, 0, 0, 0, 1, 1,
0.4735732, 1.414774, 1.156023, 0, 0, 0, 1, 1,
0.4738036, -0.5380695, 2.059238, 0, 0, 0, 1, 1,
0.4756158, 1.031586, 0.6308665, 1, 1, 1, 1, 1,
0.4823724, -0.00586964, 2.655844, 1, 1, 1, 1, 1,
0.4874271, 0.74649, -0.178495, 1, 1, 1, 1, 1,
0.4884763, 1.714522, 1.69374, 1, 1, 1, 1, 1,
0.4912179, 0.9487687, 0.2995045, 1, 1, 1, 1, 1,
0.4924745, 0.4507544, 1.197463, 1, 1, 1, 1, 1,
0.4929655, -0.1067849, 0.7893366, 1, 1, 1, 1, 1,
0.4934564, 0.004279683, 1.418294, 1, 1, 1, 1, 1,
0.5013899, 1.641194, 1.125677, 1, 1, 1, 1, 1,
0.5017623, -1.042362, 2.440644, 1, 1, 1, 1, 1,
0.5021795, -0.1647252, 2.813809, 1, 1, 1, 1, 1,
0.5025987, -0.993964, 2.396191, 1, 1, 1, 1, 1,
0.5034648, 0.3193847, 1.162884, 1, 1, 1, 1, 1,
0.5117685, -1.184538, 2.446877, 1, 1, 1, 1, 1,
0.5123951, 0.5852016, 0.5203909, 1, 1, 1, 1, 1,
0.5168212, -0.5808051, 2.116765, 0, 0, 1, 1, 1,
0.5252095, 0.0501275, 2.304552, 1, 0, 0, 1, 1,
0.5281196, -0.1069832, 1.110881, 1, 0, 0, 1, 1,
0.5297163, 1.129381, -1.295913, 1, 0, 0, 1, 1,
0.5324602, -0.1316853, -0.05997557, 1, 0, 0, 1, 1,
0.5331026, -0.6272759, 4.672158, 1, 0, 0, 1, 1,
0.5339209, 0.6211262, 1.292278, 0, 0, 0, 1, 1,
0.5352619, 1.517867, -2.221192, 0, 0, 0, 1, 1,
0.5403345, 1.023474, -0.6300739, 0, 0, 0, 1, 1,
0.5421841, -0.5822042, 2.593897, 0, 0, 0, 1, 1,
0.5443684, -1.478585, 2.826762, 0, 0, 0, 1, 1,
0.548067, 1.055371, 1.279405, 0, 0, 0, 1, 1,
0.5497667, -0.160492, 3.839543, 0, 0, 0, 1, 1,
0.5504479, -0.7582926, 1.668662, 1, 1, 1, 1, 1,
0.5542988, -0.8780172, 4.401831, 1, 1, 1, 1, 1,
0.5556027, -0.2760333, 3.420996, 1, 1, 1, 1, 1,
0.5570315, 2.934091, -0.7722387, 1, 1, 1, 1, 1,
0.557148, -0.510664, 2.98063, 1, 1, 1, 1, 1,
0.5607215, -1.33303, 3.875865, 1, 1, 1, 1, 1,
0.5631536, 0.5171382, -0.1558, 1, 1, 1, 1, 1,
0.5691652, 0.105479, 0.1441215, 1, 1, 1, 1, 1,
0.5695804, 0.1495272, 2.159807, 1, 1, 1, 1, 1,
0.5714563, -1.769604, 2.796172, 1, 1, 1, 1, 1,
0.5762241, 1.970518, 0.7972492, 1, 1, 1, 1, 1,
0.5800669, 1.100448, -1.027554, 1, 1, 1, 1, 1,
0.5805551, 0.8067412, 1.286267, 1, 1, 1, 1, 1,
0.581859, 0.02091049, 0.3445242, 1, 1, 1, 1, 1,
0.5865856, 1.301675, 0.9223156, 1, 1, 1, 1, 1,
0.5869459, 0.5235607, 0.007924336, 0, 0, 1, 1, 1,
0.5919753, -0.8934088, 3.216363, 1, 0, 0, 1, 1,
0.6028738, -0.09808848, 1.051502, 1, 0, 0, 1, 1,
0.6064981, 0.6108273, 0.6408324, 1, 0, 0, 1, 1,
0.607302, -2.093671, 1.894321, 1, 0, 0, 1, 1,
0.609149, 0.8015115, 2.359395, 1, 0, 0, 1, 1,
0.614875, 0.6632355, 0.1610794, 0, 0, 0, 1, 1,
0.6154171, 0.7008087, 1.596428, 0, 0, 0, 1, 1,
0.6180595, -1.307501, 2.209233, 0, 0, 0, 1, 1,
0.6201513, 1.493497, 0.7564069, 0, 0, 0, 1, 1,
0.6273403, -0.9089551, 3.459442, 0, 0, 0, 1, 1,
0.6280372, -0.8166691, 2.848148, 0, 0, 0, 1, 1,
0.6281323, 0.2588626, 1.820392, 0, 0, 0, 1, 1,
0.6324375, -2.316771, 3.936244, 1, 1, 1, 1, 1,
0.6341469, 0.2563853, 1.022712, 1, 1, 1, 1, 1,
0.6375957, -1.804112, 2.989396, 1, 1, 1, 1, 1,
0.6403678, 0.3927181, 0.9153192, 1, 1, 1, 1, 1,
0.6419595, 0.2666205, 1.538432, 1, 1, 1, 1, 1,
0.6443956, 0.3584139, 0.6955355, 1, 1, 1, 1, 1,
0.6449538, 1.670003, -1.419562, 1, 1, 1, 1, 1,
0.6450517, -0.006165804, 0.9323182, 1, 1, 1, 1, 1,
0.6456415, 1.111222, 2.4582, 1, 1, 1, 1, 1,
0.6499247, -0.7616597, 2.313971, 1, 1, 1, 1, 1,
0.6557309, -0.4644536, 2.766996, 1, 1, 1, 1, 1,
0.6620846, -0.1374371, 1.653083, 1, 1, 1, 1, 1,
0.6628134, 1.055999, 0.4561939, 1, 1, 1, 1, 1,
0.6715368, 0.6445844, 0.8476065, 1, 1, 1, 1, 1,
0.671665, 0.4124703, 0.7103258, 1, 1, 1, 1, 1,
0.6722008, 0.4236498, 0.9048735, 0, 0, 1, 1, 1,
0.6741086, 1.542509, 0.8163456, 1, 0, 0, 1, 1,
0.6753526, -0.283331, 2.467346, 1, 0, 0, 1, 1,
0.6768436, 0.1991546, 0.651577, 1, 0, 0, 1, 1,
0.6779958, 0.7646337, -0.714948, 1, 0, 0, 1, 1,
0.6833794, 0.1756157, 2.064432, 1, 0, 0, 1, 1,
0.6840349, 0.5733663, -0.1326601, 0, 0, 0, 1, 1,
0.6842456, -0.9136208, 2.570868, 0, 0, 0, 1, 1,
0.6856267, -1.657651, 1.341996, 0, 0, 0, 1, 1,
0.6885476, -0.2659791, 1.804678, 0, 0, 0, 1, 1,
0.6901973, 0.0118088, 1.637866, 0, 0, 0, 1, 1,
0.6908151, -1.557253, 4.682516, 0, 0, 0, 1, 1,
0.6909133, 1.390654, 0.4463746, 0, 0, 0, 1, 1,
0.6941338, 0.8107665, 1.428955, 1, 1, 1, 1, 1,
0.7054641, -0.3836444, 5.139639, 1, 1, 1, 1, 1,
0.7085462, 0.7771547, 0.4083174, 1, 1, 1, 1, 1,
0.7111347, -0.8266502, 2.455018, 1, 1, 1, 1, 1,
0.7169026, -0.2563521, 0.9800578, 1, 1, 1, 1, 1,
0.7180099, 0.8621593, 1.965915, 1, 1, 1, 1, 1,
0.722307, -0.09607428, 1.675442, 1, 1, 1, 1, 1,
0.7351929, 0.7968558, 0.00891963, 1, 1, 1, 1, 1,
0.7374607, -0.2454883, 1.752886, 1, 1, 1, 1, 1,
0.73937, -0.2690283, 1.484502, 1, 1, 1, 1, 1,
0.7450124, 0.9252658, 1.386046, 1, 1, 1, 1, 1,
0.7484614, -0.2246836, 2.212702, 1, 1, 1, 1, 1,
0.7532719, 2.158492, -0.7632942, 1, 1, 1, 1, 1,
0.7582228, -0.8323672, 3.641257, 1, 1, 1, 1, 1,
0.762378, 1.027371, 0.8341323, 1, 1, 1, 1, 1,
0.7625254, -1.296502, 3.653588, 0, 0, 1, 1, 1,
0.7698328, -0.5365853, 1.688957, 1, 0, 0, 1, 1,
0.7707412, 0.1646998, -0.01989435, 1, 0, 0, 1, 1,
0.7707649, 0.4490733, 1.183296, 1, 0, 0, 1, 1,
0.7806162, -0.4804884, 2.782697, 1, 0, 0, 1, 1,
0.7807482, -0.3076968, 2.467772, 1, 0, 0, 1, 1,
0.7840857, 0.2560281, 1.419852, 0, 0, 0, 1, 1,
0.7854291, -0.2982694, 0.04107061, 0, 0, 0, 1, 1,
0.7879134, -1.242253, 2.487422, 0, 0, 0, 1, 1,
0.7879506, -0.5120901, 1.477901, 0, 0, 0, 1, 1,
0.7890737, -2.008869, 4.814218, 0, 0, 0, 1, 1,
0.791271, -0.6403674, 3.349908, 0, 0, 0, 1, 1,
0.7915832, 0.4169641, 0.5778266, 0, 0, 0, 1, 1,
0.8025905, -2.157735, 3.24781, 1, 1, 1, 1, 1,
0.8087774, 0.6499492, 0.6648548, 1, 1, 1, 1, 1,
0.8115786, 1.536887, 0.368894, 1, 1, 1, 1, 1,
0.8157017, 0.5523988, 0.3580824, 1, 1, 1, 1, 1,
0.8175776, -0.287475, 2.008759, 1, 1, 1, 1, 1,
0.8178534, -0.01210859, 2.000949, 1, 1, 1, 1, 1,
0.8210422, -2.586993, 1.926769, 1, 1, 1, 1, 1,
0.8220873, 1.631142, 1.198592, 1, 1, 1, 1, 1,
0.825642, 1.339581, 0.3577052, 1, 1, 1, 1, 1,
0.8311172, 1.37697, 1.787564, 1, 1, 1, 1, 1,
0.8321867, 0.3005852, 1.104084, 1, 1, 1, 1, 1,
0.8323511, -0.4669737, 1.142083, 1, 1, 1, 1, 1,
0.8359991, 0.1160438, 2.555442, 1, 1, 1, 1, 1,
0.8457306, -0.2012438, 1.970744, 1, 1, 1, 1, 1,
0.8458905, -0.1956838, -0.08211215, 1, 1, 1, 1, 1,
0.8507413, 1.672262, -0.1376991, 0, 0, 1, 1, 1,
0.8522033, -0.6697245, 1.896577, 1, 0, 0, 1, 1,
0.8539447, 0.4422423, 2.836565, 1, 0, 0, 1, 1,
0.8586332, -0.882048, 0.9732116, 1, 0, 0, 1, 1,
0.8588127, -0.3565154, 2.697753, 1, 0, 0, 1, 1,
0.8652675, -1.86324, 2.267726, 1, 0, 0, 1, 1,
0.8729624, 0.3589883, 2.060608, 0, 0, 0, 1, 1,
0.8761846, 1.62491, 0.3188937, 0, 0, 0, 1, 1,
0.87633, -0.01351653, 1.884727, 0, 0, 0, 1, 1,
0.8875172, -0.9032763, 2.637419, 0, 0, 0, 1, 1,
0.8920542, 0.6169323, 1.276589, 0, 0, 0, 1, 1,
0.8932811, -2.255299, 2.911208, 0, 0, 0, 1, 1,
0.8987787, 1.823086, 4.034314, 0, 0, 0, 1, 1,
0.9059443, 0.09466849, 2.88139, 1, 1, 1, 1, 1,
0.9069412, 0.7472368, 0.4905197, 1, 1, 1, 1, 1,
0.909075, -0.9540993, 2.551209, 1, 1, 1, 1, 1,
0.9138579, 0.4611078, 1.61976, 1, 1, 1, 1, 1,
0.9173197, 0.4934012, 0.3192858, 1, 1, 1, 1, 1,
0.92609, 0.2533845, 1.158589, 1, 1, 1, 1, 1,
0.926932, 0.3753444, 2.70882, 1, 1, 1, 1, 1,
0.9286133, -1.984195, 3.759799, 1, 1, 1, 1, 1,
0.9336975, -0.4689719, 0.4682629, 1, 1, 1, 1, 1,
0.9422258, -1.830485, 3.99853, 1, 1, 1, 1, 1,
0.9423932, 0.6137773, 0.339815, 1, 1, 1, 1, 1,
0.9477199, 0.1116463, 0.9709033, 1, 1, 1, 1, 1,
0.9548725, 0.2242903, 1.007921, 1, 1, 1, 1, 1,
0.9575743, 0.8353401, 2.618885, 1, 1, 1, 1, 1,
0.9642885, 0.2844812, 0.9460595, 1, 1, 1, 1, 1,
0.964327, 0.5187898, 1.824668, 0, 0, 1, 1, 1,
0.9674686, 0.4502363, 0.1442767, 1, 0, 0, 1, 1,
0.9843355, 0.6042458, 0.1068128, 1, 0, 0, 1, 1,
0.9942056, 2.016288, -0.6285526, 1, 0, 0, 1, 1,
0.9966047, -0.6947317, 2.699215, 1, 0, 0, 1, 1,
1.001855, -1.213887, 2.952452, 1, 0, 0, 1, 1,
1.002078, 2.272256, 1.706254, 0, 0, 0, 1, 1,
1.015009, 0.7875656, 0.9956837, 0, 0, 0, 1, 1,
1.021093, 1.228865, 0.526336, 0, 0, 0, 1, 1,
1.026322, -1.327922, 2.998902, 0, 0, 0, 1, 1,
1.033768, -0.5123969, 2.391901, 0, 0, 0, 1, 1,
1.038959, -0.5616211, 1.70246, 0, 0, 0, 1, 1,
1.041976, 1.114851, -0.07441753, 0, 0, 0, 1, 1,
1.042666, -0.1061872, 2.390596, 1, 1, 1, 1, 1,
1.044703, 0.6176389, 0.7645479, 1, 1, 1, 1, 1,
1.050764, 1.669562, 1.660064, 1, 1, 1, 1, 1,
1.05141, 2.23725, 0.02946422, 1, 1, 1, 1, 1,
1.056209, 1.297366, 0.6070653, 1, 1, 1, 1, 1,
1.058146, -0.4374472, 2.633522, 1, 1, 1, 1, 1,
1.060819, 0.3542055, 2.626278, 1, 1, 1, 1, 1,
1.06279, 0.3194918, 0.3994808, 1, 1, 1, 1, 1,
1.078241, -0.3048288, 2.522629, 1, 1, 1, 1, 1,
1.085993, 1.563269, 0.6158531, 1, 1, 1, 1, 1,
1.094843, 0.8143221, 1.094568, 1, 1, 1, 1, 1,
1.104703, 1.637182, 1.395983, 1, 1, 1, 1, 1,
1.107941, -2.00623, 3.300138, 1, 1, 1, 1, 1,
1.108703, 0.09716999, 0.4816894, 1, 1, 1, 1, 1,
1.10955, 0.5598954, 0.6317524, 1, 1, 1, 1, 1,
1.10977, 0.6272375, 0.3630738, 0, 0, 1, 1, 1,
1.113916, 0.6948943, -0.3040096, 1, 0, 0, 1, 1,
1.121042, 1.266588, -0.1095687, 1, 0, 0, 1, 1,
1.124284, -0.08064973, 1.256139, 1, 0, 0, 1, 1,
1.124731, -0.7825585, 2.137268, 1, 0, 0, 1, 1,
1.138729, -0.02480502, 1.375885, 1, 0, 0, 1, 1,
1.139349, 1.429817, -0.001913424, 0, 0, 0, 1, 1,
1.142274, 0.4461673, 1.792857, 0, 0, 0, 1, 1,
1.146703, 1.111533, 0.06859176, 0, 0, 0, 1, 1,
1.148325, 0.6760926, 0.2834354, 0, 0, 0, 1, 1,
1.157976, -0.5375408, 0.8522968, 0, 0, 0, 1, 1,
1.160574, 0.3418123, 0.3571964, 0, 0, 0, 1, 1,
1.168487, 0.2327214, 2.349244, 0, 0, 0, 1, 1,
1.171114, -0.8572704, 2.170265, 1, 1, 1, 1, 1,
1.174054, 0.6385989, 1.215152, 1, 1, 1, 1, 1,
1.176187, 1.464426, 1.195543, 1, 1, 1, 1, 1,
1.178022, 0.08513235, 1.241533, 1, 1, 1, 1, 1,
1.189999, -0.3221738, 2.855665, 1, 1, 1, 1, 1,
1.19136, 0.5891438, 1.551001, 1, 1, 1, 1, 1,
1.208605, -1.414859, 3.554393, 1, 1, 1, 1, 1,
1.213312, 0.02831089, 2.41519, 1, 1, 1, 1, 1,
1.218936, 0.111875, 1.805802, 1, 1, 1, 1, 1,
1.221925, 1.322604, -2.418938, 1, 1, 1, 1, 1,
1.223102, 2.050932, -0.4706841, 1, 1, 1, 1, 1,
1.227678, -0.3248533, 1.19987, 1, 1, 1, 1, 1,
1.232102, 0.1302587, 3.359118, 1, 1, 1, 1, 1,
1.240955, -0.0453488, 1.99024, 1, 1, 1, 1, 1,
1.250929, -1.554053, 2.858227, 1, 1, 1, 1, 1,
1.252101, 0.3751763, 1.134719, 0, 0, 1, 1, 1,
1.256746, -3.033075, 3.041261, 1, 0, 0, 1, 1,
1.258061, -0.4458107, 1.490421, 1, 0, 0, 1, 1,
1.260658, 0.9413795, 1.265904, 1, 0, 0, 1, 1,
1.268321, -0.3214429, 2.117087, 1, 0, 0, 1, 1,
1.270439, 0.9688228, 0.2368834, 1, 0, 0, 1, 1,
1.270907, -0.3461659, 1.540364, 0, 0, 0, 1, 1,
1.274707, -1.230407, 0.8131917, 0, 0, 0, 1, 1,
1.292789, -0.9631317, 2.280171, 0, 0, 0, 1, 1,
1.304029, -1.355391, 3.741405, 0, 0, 0, 1, 1,
1.31118, 1.017991, 1.620443, 0, 0, 0, 1, 1,
1.314417, 1.013545, 1.797221, 0, 0, 0, 1, 1,
1.32204, 2.054502, 0.7022427, 0, 0, 0, 1, 1,
1.323548, 0.342887, 1.337353, 1, 1, 1, 1, 1,
1.324886, -0.6002592, 3.503779, 1, 1, 1, 1, 1,
1.336085, 0.6344618, 1.502927, 1, 1, 1, 1, 1,
1.340244, 1.749055, 0.3634685, 1, 1, 1, 1, 1,
1.345643, -0.33001, 1.714218, 1, 1, 1, 1, 1,
1.350762, -1.682446, 3.593106, 1, 1, 1, 1, 1,
1.354058, 1.7572, 1.828002, 1, 1, 1, 1, 1,
1.360143, -0.7119541, 0.6397761, 1, 1, 1, 1, 1,
1.362884, 0.9592394, 0.9943355, 1, 1, 1, 1, 1,
1.382978, -0.6088812, 3.263264, 1, 1, 1, 1, 1,
1.395755, 0.7055328, 0.5001497, 1, 1, 1, 1, 1,
1.403191, -0.6565163, 3.048445, 1, 1, 1, 1, 1,
1.405072, -0.3615313, 3.441757, 1, 1, 1, 1, 1,
1.405362, -1.033185, 2.335909, 1, 1, 1, 1, 1,
1.422011, -0.003485966, 0.5182787, 1, 1, 1, 1, 1,
1.425234, -0.3100504, 0.4132977, 0, 0, 1, 1, 1,
1.425351, -1.377024, 2.125248, 1, 0, 0, 1, 1,
1.440254, 0.774232, 1.966092, 1, 0, 0, 1, 1,
1.450011, 0.06111605, 0.9151236, 1, 0, 0, 1, 1,
1.458714, 0.05075812, 2.237785, 1, 0, 0, 1, 1,
1.462918, -1.398477, 3.342825, 1, 0, 0, 1, 1,
1.496212, 1.37359, 0.8614131, 0, 0, 0, 1, 1,
1.506161, -0.8462189, 3.65826, 0, 0, 0, 1, 1,
1.517979, 0.02402746, 3.075389, 0, 0, 0, 1, 1,
1.520414, 0.4485832, 0.04710701, 0, 0, 0, 1, 1,
1.553225, -1.683896, 2.02403, 0, 0, 0, 1, 1,
1.586507, -0.6991132, 0.1258689, 0, 0, 0, 1, 1,
1.586592, -0.9094144, 1.635098, 0, 0, 0, 1, 1,
1.588583, -0.2295691, 1.390793, 1, 1, 1, 1, 1,
1.61026, 0.9048064, 0.4901337, 1, 1, 1, 1, 1,
1.611286, -1.85249, 2.33788, 1, 1, 1, 1, 1,
1.612201, 2.698612, 1.036257, 1, 1, 1, 1, 1,
1.620151, 0.1975119, 1.538769, 1, 1, 1, 1, 1,
1.624449, -0.5131022, 1.615256, 1, 1, 1, 1, 1,
1.634173, 1.419805, 1.149545, 1, 1, 1, 1, 1,
1.636523, -0.6643814, 0.6188345, 1, 1, 1, 1, 1,
1.636965, 0.8953422, 0.4434887, 1, 1, 1, 1, 1,
1.645871, -0.9591302, 1.416466, 1, 1, 1, 1, 1,
1.668319, 1.118911, 0.7089289, 1, 1, 1, 1, 1,
1.672818, 0.4743815, -0.4589298, 1, 1, 1, 1, 1,
1.6824, -0.9121282, 2.565551, 1, 1, 1, 1, 1,
1.684544, 0.3828191, 1.621719, 1, 1, 1, 1, 1,
1.689871, -1.492602, 2.303104, 1, 1, 1, 1, 1,
1.698086, 1.496141, 1.667048, 0, 0, 1, 1, 1,
1.70261, -0.9002852, 3.047255, 1, 0, 0, 1, 1,
1.725394, -1.260042, 2.011927, 1, 0, 0, 1, 1,
1.738747, -0.1498151, 1.123547, 1, 0, 0, 1, 1,
1.754029, 1.96952, -0.8505263, 1, 0, 0, 1, 1,
1.759277, 1.894274, 0.7485331, 1, 0, 0, 1, 1,
1.77147, -0.9543099, 2.265339, 0, 0, 0, 1, 1,
1.777555, 0.1900936, 0.8115947, 0, 0, 0, 1, 1,
1.785525, -0.7844245, 2.076053, 0, 0, 0, 1, 1,
1.801707, 0.07419866, 1.686111, 0, 0, 0, 1, 1,
1.805465, -0.02985191, 1.406184, 0, 0, 0, 1, 1,
1.812408, -0.6991349, 2.261303, 0, 0, 0, 1, 1,
1.819372, 1.178352, 0.6935407, 0, 0, 0, 1, 1,
1.821068, 0.006390354, 1.0558, 1, 1, 1, 1, 1,
1.824926, -1.861102, 3.419447, 1, 1, 1, 1, 1,
1.827766, -0.5008777, 3.029946, 1, 1, 1, 1, 1,
1.833373, -3.01292, 2.536456, 1, 1, 1, 1, 1,
1.844036, -1.157748, 2.33158, 1, 1, 1, 1, 1,
1.845402, 0.7357737, 1.467336, 1, 1, 1, 1, 1,
1.8723, -2.144367, 3.393648, 1, 1, 1, 1, 1,
1.892689, 0.987334, 1.013979, 1, 1, 1, 1, 1,
1.947413, 1.632366, 0.7807279, 1, 1, 1, 1, 1,
1.968967, -0.3159461, 0.09512699, 1, 1, 1, 1, 1,
1.981841, -0.6768152, 1.221138, 1, 1, 1, 1, 1,
1.992564, 0.3600836, 0.5933511, 1, 1, 1, 1, 1,
1.994556, 0.1950602, 2.726878, 1, 1, 1, 1, 1,
2.009497, -1.900987, 0.9152477, 1, 1, 1, 1, 1,
2.028259, -1.303907, 2.437326, 1, 1, 1, 1, 1,
2.040137, -0.498481, 2.169507, 0, 0, 1, 1, 1,
2.051346, -0.4389643, 2.136352, 1, 0, 0, 1, 1,
2.054643, 0.3282459, 1.442646, 1, 0, 0, 1, 1,
2.055199, 1.10427, 0.1465905, 1, 0, 0, 1, 1,
2.076637, 0.2473364, 2.747938, 1, 0, 0, 1, 1,
2.096156, 0.2426737, 1.435027, 1, 0, 0, 1, 1,
2.10632, -0.2007318, 0.9166307, 0, 0, 0, 1, 1,
2.111621, 0.2287319, 2.886379, 0, 0, 0, 1, 1,
2.141673, -0.9854028, 2.71416, 0, 0, 0, 1, 1,
2.163733, -0.01438147, 0.627802, 0, 0, 0, 1, 1,
2.206495, -0.3728375, 1.515306, 0, 0, 0, 1, 1,
2.22566, 0.09112999, 1.060195, 0, 0, 0, 1, 1,
2.226761, 1.428317, 0.6787421, 0, 0, 0, 1, 1,
2.273787, 0.7432607, 1.517565, 1, 1, 1, 1, 1,
2.284179, -0.3409635, 1.716653, 1, 1, 1, 1, 1,
2.370813, -1.042175, 2.138658, 1, 1, 1, 1, 1,
2.484428, -0.5732096, 1.431727, 1, 1, 1, 1, 1,
2.516135, -1.404716, 2.334486, 1, 1, 1, 1, 1,
2.733297, 0.3984838, 0.3795806, 1, 1, 1, 1, 1,
3.662241, 0.3443075, 1.657029, 1, 1, 1, 1, 1
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
var radius = 9.362931;
var distance = 32.8869;
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
mvMatrix.translate( -0.2928536, 0.04949212, -0.01677179 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.8869);
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
