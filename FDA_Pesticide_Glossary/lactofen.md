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
-4.076123, -0.6933864, -1.438588, 1, 0, 0, 1,
-3.280193, 1.448412, -0.9369283, 1, 0.007843138, 0, 1,
-3.157391, 0.5645954, -1.287139, 1, 0.01176471, 0, 1,
-3.052782, 1.088951, -1.508203, 1, 0.01960784, 0, 1,
-3.022132, -1.470923, -4.433671, 1, 0.02352941, 0, 1,
-2.745314, 0.3952297, 0.02206914, 1, 0.03137255, 0, 1,
-2.726363, 0.3507088, -1.226187, 1, 0.03529412, 0, 1,
-2.612654, -1.454047, -3.662762, 1, 0.04313726, 0, 1,
-2.558518, 0.5524222, -1.467771, 1, 0.04705882, 0, 1,
-2.51777, -0.8922853, -3.910952, 1, 0.05490196, 0, 1,
-2.389282, -0.3558099, -2.672183, 1, 0.05882353, 0, 1,
-2.376422, -0.4149552, -0.9005457, 1, 0.06666667, 0, 1,
-2.320045, -1.550221, -0.7385415, 1, 0.07058824, 0, 1,
-2.311779, 0.9129068, -0.5651005, 1, 0.07843138, 0, 1,
-2.265014, 1.070742, -2.14673, 1, 0.08235294, 0, 1,
-2.214591, 1.273209, 0.03704103, 1, 0.09019608, 0, 1,
-2.125429, 0.01221299, -2.958515, 1, 0.09411765, 0, 1,
-2.111214, 0.3492029, -1.160642, 1, 0.1019608, 0, 1,
-2.105544, -1.317249, -0.5257207, 1, 0.1098039, 0, 1,
-2.07302, -2.606839, -3.292872, 1, 0.1137255, 0, 1,
-2.022091, 1.687035, -0.260097, 1, 0.1215686, 0, 1,
-2.005382, 0.1544953, -2.042475, 1, 0.1254902, 0, 1,
-1.96153, -0.493855, -1.430903, 1, 0.1333333, 0, 1,
-1.927488, 0.8429083, -0.554288, 1, 0.1372549, 0, 1,
-1.920667, -0.2053629, -1.336694, 1, 0.145098, 0, 1,
-1.864594, -0.5265661, -0.4214691, 1, 0.1490196, 0, 1,
-1.86095, 0.1697736, -1.664923, 1, 0.1568628, 0, 1,
-1.856663, -0.4682171, -1.638728, 1, 0.1607843, 0, 1,
-1.856204, -0.2434874, -1.839519, 1, 0.1686275, 0, 1,
-1.82969, -0.161785, -0.3509765, 1, 0.172549, 0, 1,
-1.827127, 0.5217324, -1.987234, 1, 0.1803922, 0, 1,
-1.826763, 0.4528606, -1.551618, 1, 0.1843137, 0, 1,
-1.813951, 0.9961113, -2.266171, 1, 0.1921569, 0, 1,
-1.805908, -0.9441724, -1.748889, 1, 0.1960784, 0, 1,
-1.796847, -0.8217204, -2.984081, 1, 0.2039216, 0, 1,
-1.788832, -1.542043, -3.018278, 1, 0.2117647, 0, 1,
-1.77893, -0.07711584, -1.071413, 1, 0.2156863, 0, 1,
-1.775246, 0.05057769, -2.669285, 1, 0.2235294, 0, 1,
-1.765204, -0.08889165, -0.973516, 1, 0.227451, 0, 1,
-1.762469, -0.2556968, -3.01895, 1, 0.2352941, 0, 1,
-1.761761, -2.026343, -1.65267, 1, 0.2392157, 0, 1,
-1.756449, 0.04595644, -2.322078, 1, 0.2470588, 0, 1,
-1.733221, -0.747737, -3.274068, 1, 0.2509804, 0, 1,
-1.732541, 0.6666786, -1.770445, 1, 0.2588235, 0, 1,
-1.723172, -0.2775077, 0.208277, 1, 0.2627451, 0, 1,
-1.704489, 0.3827533, -2.272775, 1, 0.2705882, 0, 1,
-1.670745, -0.2521603, -1.788117, 1, 0.2745098, 0, 1,
-1.642973, 2.513904, -1.65923, 1, 0.282353, 0, 1,
-1.640622, 0.2910897, 0.2828372, 1, 0.2862745, 0, 1,
-1.636592, -0.8395485, -1.621246, 1, 0.2941177, 0, 1,
-1.629596, 0.1145707, -2.474343, 1, 0.3019608, 0, 1,
-1.611382, 0.6057812, -1.773136, 1, 0.3058824, 0, 1,
-1.607525, -1.280647, -1.367451, 1, 0.3137255, 0, 1,
-1.598171, -0.01111578, -2.499598, 1, 0.3176471, 0, 1,
-1.597924, -1.027547, -2.084278, 1, 0.3254902, 0, 1,
-1.577912, 0.2419123, -3.038873, 1, 0.3294118, 0, 1,
-1.572115, -0.5142096, -1.461903, 1, 0.3372549, 0, 1,
-1.570239, -1.344768, -3.951218, 1, 0.3411765, 0, 1,
-1.560691, -1.746999, -2.298056, 1, 0.3490196, 0, 1,
-1.56006, 0.7111245, 0.2526906, 1, 0.3529412, 0, 1,
-1.545096, -1.068648, -1.654531, 1, 0.3607843, 0, 1,
-1.542704, 0.6926425, -1.788652, 1, 0.3647059, 0, 1,
-1.538225, -1.590133, -0.3100118, 1, 0.372549, 0, 1,
-1.533708, -0.5191108, -1.502646, 1, 0.3764706, 0, 1,
-1.532256, -1.992744, -0.9704282, 1, 0.3843137, 0, 1,
-1.527665, 1.020384, -0.301459, 1, 0.3882353, 0, 1,
-1.526176, 0.6637097, -1.002678, 1, 0.3960784, 0, 1,
-1.518279, -0.1607871, -1.091331, 1, 0.4039216, 0, 1,
-1.51752, 0.4846451, -2.472691, 1, 0.4078431, 0, 1,
-1.504043, -0.7524091, -0.7992905, 1, 0.4156863, 0, 1,
-1.487815, 2.713782, -1.337063, 1, 0.4196078, 0, 1,
-1.485659, 0.1297887, -0.8730555, 1, 0.427451, 0, 1,
-1.483132, 0.2324819, -0.4783798, 1, 0.4313726, 0, 1,
-1.483129, -0.09287235, -1.121555, 1, 0.4392157, 0, 1,
-1.477049, -0.6935567, -2.815384, 1, 0.4431373, 0, 1,
-1.459847, -0.01775232, -1.130233, 1, 0.4509804, 0, 1,
-1.442748, 0.3235729, -1.448003, 1, 0.454902, 0, 1,
-1.437408, 0.6589994, -0.6847164, 1, 0.4627451, 0, 1,
-1.434219, 1.328402, 0.6028616, 1, 0.4666667, 0, 1,
-1.412956, 0.1704478, 0.187576, 1, 0.4745098, 0, 1,
-1.405055, 1.006709, 1.297567, 1, 0.4784314, 0, 1,
-1.400523, 1.64807, -1.716749, 1, 0.4862745, 0, 1,
-1.399781, -0.6804846, -3.650952, 1, 0.4901961, 0, 1,
-1.395264, -1.508263, -4.41423, 1, 0.4980392, 0, 1,
-1.388435, 0.1216711, -1.384676, 1, 0.5058824, 0, 1,
-1.38276, -0.9181895, -1.832587, 1, 0.509804, 0, 1,
-1.381377, -1.295046, -4.270545, 1, 0.5176471, 0, 1,
-1.378044, 0.02039293, -1.247314, 1, 0.5215687, 0, 1,
-1.364869, -0.6572217, -2.48557, 1, 0.5294118, 0, 1,
-1.359938, 0.1072166, -0.1188681, 1, 0.5333334, 0, 1,
-1.35987, -0.6686313, -1.797409, 1, 0.5411765, 0, 1,
-1.357512, -0.2127972, -1.735903, 1, 0.5450981, 0, 1,
-1.357071, -0.222589, -0.5758352, 1, 0.5529412, 0, 1,
-1.34805, -1.249899, -3.935311, 1, 0.5568628, 0, 1,
-1.345078, -0.03713841, -0.9200482, 1, 0.5647059, 0, 1,
-1.321742, -1.815121, -2.853602, 1, 0.5686275, 0, 1,
-1.321228, -1.795675, -1.012184, 1, 0.5764706, 0, 1,
-1.297477, -0.3638711, -2.694653, 1, 0.5803922, 0, 1,
-1.28537, -0.2345753, -0.999886, 1, 0.5882353, 0, 1,
-1.282976, -0.3003018, -1.909855, 1, 0.5921569, 0, 1,
-1.281767, -0.2090189, -1.081588, 1, 0.6, 0, 1,
-1.271144, 0.3562889, -2.100343, 1, 0.6078432, 0, 1,
-1.266827, 0.6145453, -0.8602358, 1, 0.6117647, 0, 1,
-1.265178, 1.151105, -1.167195, 1, 0.6196079, 0, 1,
-1.254766, 0.07941998, -2.39974, 1, 0.6235294, 0, 1,
-1.241351, -2.27554, -3.491687, 1, 0.6313726, 0, 1,
-1.229349, -0.2709435, -0.0567917, 1, 0.6352941, 0, 1,
-1.229193, 0.6371544, -2.434438, 1, 0.6431373, 0, 1,
-1.228914, 0.4517212, 1.634035, 1, 0.6470588, 0, 1,
-1.227391, 0.687794, 0.2707752, 1, 0.654902, 0, 1,
-1.216338, 0.3791255, 0.3875065, 1, 0.6588235, 0, 1,
-1.213779, 1.007444, -2.164593, 1, 0.6666667, 0, 1,
-1.200653, -0.5700027, -1.182409, 1, 0.6705883, 0, 1,
-1.192322, 0.9977915, -0.5334582, 1, 0.6784314, 0, 1,
-1.184777, -0.0642589, -3.470156, 1, 0.682353, 0, 1,
-1.178082, -0.2593785, -1.771851, 1, 0.6901961, 0, 1,
-1.173531, 1.25769, -0.4366225, 1, 0.6941177, 0, 1,
-1.172364, 1.844696, -1.497048, 1, 0.7019608, 0, 1,
-1.159714, -0.9604691, -2.081333, 1, 0.7098039, 0, 1,
-1.159317, -2.186507, -1.400354, 1, 0.7137255, 0, 1,
-1.155131, 0.2530224, -0.7950217, 1, 0.7215686, 0, 1,
-1.152683, -1.696625, -3.197077, 1, 0.7254902, 0, 1,
-1.14752, -0.1867266, -1.083618, 1, 0.7333333, 0, 1,
-1.13786, -0.09141992, -0.9287081, 1, 0.7372549, 0, 1,
-1.136009, 0.1614938, -1.271927, 1, 0.7450981, 0, 1,
-1.119673, 0.9678255, -1.711443, 1, 0.7490196, 0, 1,
-1.108711, -0.4714298, -2.717764, 1, 0.7568628, 0, 1,
-1.107078, -1.109528, -3.70704, 1, 0.7607843, 0, 1,
-1.099201, -1.007393, 0.4350975, 1, 0.7686275, 0, 1,
-1.09884, -0.450352, -2.094624, 1, 0.772549, 0, 1,
-1.094666, -0.2641276, -2.079183, 1, 0.7803922, 0, 1,
-1.094225, -0.2997892, -1.43573, 1, 0.7843137, 0, 1,
-1.094199, -0.434346, -3.299833, 1, 0.7921569, 0, 1,
-1.093216, 1.362987, -1.070686, 1, 0.7960784, 0, 1,
-1.093091, 1.068575, 0.4093926, 1, 0.8039216, 0, 1,
-1.084508, 0.2555394, -2.443978, 1, 0.8117647, 0, 1,
-1.073746, -0.7591847, -2.668041, 1, 0.8156863, 0, 1,
-1.061578, 0.146989, -2.826308, 1, 0.8235294, 0, 1,
-1.059412, -2.275111, -0.8706885, 1, 0.827451, 0, 1,
-1.054466, 0.0488532, -2.693466, 1, 0.8352941, 0, 1,
-1.052784, 0.8239117, 0.5464979, 1, 0.8392157, 0, 1,
-1.052448, -1.565894, -2.317722, 1, 0.8470588, 0, 1,
-1.02874, 1.91387, -0.6483251, 1, 0.8509804, 0, 1,
-1.026493, 0.2561261, -1.972976, 1, 0.8588235, 0, 1,
-1.025963, -0.4448822, -1.607429, 1, 0.8627451, 0, 1,
-1.025891, -2.310641, -3.968513, 1, 0.8705882, 0, 1,
-1.018716, 0.4400077, -0.9577914, 1, 0.8745098, 0, 1,
-1.014351, -0.4318837, -1.198939, 1, 0.8823529, 0, 1,
-1.011868, 1.692927, -0.5098329, 1, 0.8862745, 0, 1,
-1.009597, 0.02988366, -3.727256, 1, 0.8941177, 0, 1,
-1.006025, 0.6437033, -1.403901, 1, 0.8980392, 0, 1,
-1.003738, 0.539886, -2.192673, 1, 0.9058824, 0, 1,
-1.001005, 1.450584, -0.9525472, 1, 0.9137255, 0, 1,
-0.9989384, -1.552459, -2.321052, 1, 0.9176471, 0, 1,
-0.9744472, -0.7555809, -2.546887, 1, 0.9254902, 0, 1,
-0.9675499, 0.9596696, 0.2641048, 1, 0.9294118, 0, 1,
-0.9612386, -0.02076285, -0.9956183, 1, 0.9372549, 0, 1,
-0.9546954, 1.247998, -1.826531, 1, 0.9411765, 0, 1,
-0.953932, 0.0760024, -0.9911932, 1, 0.9490196, 0, 1,
-0.951211, -0.1757366, -0.4593739, 1, 0.9529412, 0, 1,
-0.9491318, -0.8888198, -2.781024, 1, 0.9607843, 0, 1,
-0.942281, -0.8106177, -1.742424, 1, 0.9647059, 0, 1,
-0.9410654, -2.185162, -3.037611, 1, 0.972549, 0, 1,
-0.9383749, 0.1580602, -1.096046, 1, 0.9764706, 0, 1,
-0.9351746, -0.184672, -2.669331, 1, 0.9843137, 0, 1,
-0.9336313, 0.2592058, -1.066807, 1, 0.9882353, 0, 1,
-0.9319796, 1.389759, -0.3538074, 1, 0.9960784, 0, 1,
-0.9317918, -0.4927417, -1.882412, 0.9960784, 1, 0, 1,
-0.9268677, -0.5548648, -3.8456, 0.9921569, 1, 0, 1,
-0.9257103, 0.2520277, -2.58778, 0.9843137, 1, 0, 1,
-0.9250473, -0.08983366, -0.06335041, 0.9803922, 1, 0, 1,
-0.9203072, -0.4079599, -1.291116, 0.972549, 1, 0, 1,
-0.9195912, -0.5948757, -3.131527, 0.9686275, 1, 0, 1,
-0.9107209, -0.04527092, -1.699712, 0.9607843, 1, 0, 1,
-0.9103908, 0.3241061, -1.223137, 0.9568627, 1, 0, 1,
-0.9070457, -1.302538, -1.691221, 0.9490196, 1, 0, 1,
-0.8964031, 0.8578897, 0.8755719, 0.945098, 1, 0, 1,
-0.8962342, 1.578074, 0.171393, 0.9372549, 1, 0, 1,
-0.893373, -1.091249, -2.902281, 0.9333333, 1, 0, 1,
-0.8913728, 1.166159, 0.2815131, 0.9254902, 1, 0, 1,
-0.8911142, -1.390443, -2.809089, 0.9215686, 1, 0, 1,
-0.8889545, 1.051639, -2.482023, 0.9137255, 1, 0, 1,
-0.8883808, 1.415209, -0.2891613, 0.9098039, 1, 0, 1,
-0.8847299, -0.7533279, -2.142219, 0.9019608, 1, 0, 1,
-0.8838429, -2.737473, -2.033355, 0.8941177, 1, 0, 1,
-0.8817842, -0.9095321, -3.629225, 0.8901961, 1, 0, 1,
-0.8766594, -0.05211956, -0.7531947, 0.8823529, 1, 0, 1,
-0.8755876, 0.09339855, -1.172481, 0.8784314, 1, 0, 1,
-0.8730508, 1.463276, -0.4086701, 0.8705882, 1, 0, 1,
-0.8725176, 0.07713811, 0.2331707, 0.8666667, 1, 0, 1,
-0.8709116, -1.585997, -2.07323, 0.8588235, 1, 0, 1,
-0.8681277, 1.49486, -0.5761152, 0.854902, 1, 0, 1,
-0.866549, 1.594613, 0.02548141, 0.8470588, 1, 0, 1,
-0.8655593, 0.9444612, -1.629907, 0.8431373, 1, 0, 1,
-0.8620608, 1.369268, -2.157221, 0.8352941, 1, 0, 1,
-0.8531216, 0.4246873, -1.67197, 0.8313726, 1, 0, 1,
-0.8446915, -1.486105, -1.924583, 0.8235294, 1, 0, 1,
-0.8359948, 0.2366824, -0.9496332, 0.8196079, 1, 0, 1,
-0.8331419, -0.4907747, -2.6164, 0.8117647, 1, 0, 1,
-0.83276, 1.153399, -0.3130004, 0.8078431, 1, 0, 1,
-0.8313023, 0.7917016, 0.8317186, 0.8, 1, 0, 1,
-0.8291472, 0.7955716, -1.730812, 0.7921569, 1, 0, 1,
-0.8281556, -1.412159, -2.943106, 0.7882353, 1, 0, 1,
-0.8263912, -1.458476, -2.209004, 0.7803922, 1, 0, 1,
-0.8196724, 0.9281611, -2.20359, 0.7764706, 1, 0, 1,
-0.8164013, 0.1188107, -2.519339, 0.7686275, 1, 0, 1,
-0.8114694, -1.694699, -2.554874, 0.7647059, 1, 0, 1,
-0.8086625, 0.9892817, -0.1752559, 0.7568628, 1, 0, 1,
-0.8067468, 0.5212398, -0.6452818, 0.7529412, 1, 0, 1,
-0.7929966, -0.4503548, -3.238055, 0.7450981, 1, 0, 1,
-0.7835413, -0.7516599, -1.660723, 0.7411765, 1, 0, 1,
-0.7822229, 0.9813368, -0.364047, 0.7333333, 1, 0, 1,
-0.7822093, 0.5282219, -3.203434, 0.7294118, 1, 0, 1,
-0.7734537, -1.103158, -2.122622, 0.7215686, 1, 0, 1,
-0.7689289, 1.684823, -1.592637, 0.7176471, 1, 0, 1,
-0.7663406, -2.4848, -3.294864, 0.7098039, 1, 0, 1,
-0.7658558, -0.2915736, -1.770814, 0.7058824, 1, 0, 1,
-0.7576368, -0.1985663, -3.008391, 0.6980392, 1, 0, 1,
-0.7566943, 0.1600919, -0.3186021, 0.6901961, 1, 0, 1,
-0.753656, -1.482047, -3.319654, 0.6862745, 1, 0, 1,
-0.7519033, 0.7781037, -0.6623847, 0.6784314, 1, 0, 1,
-0.7370859, -0.1978686, -2.681631, 0.6745098, 1, 0, 1,
-0.7363814, -0.2881222, -2.642318, 0.6666667, 1, 0, 1,
-0.7347007, 0.1596271, -1.263139, 0.6627451, 1, 0, 1,
-0.7322627, 1.021926, 0.1941629, 0.654902, 1, 0, 1,
-0.7319653, 0.6153713, -1.156739, 0.6509804, 1, 0, 1,
-0.7296466, -0.1267292, -0.7655065, 0.6431373, 1, 0, 1,
-0.7255182, 1.714051, -0.1760813, 0.6392157, 1, 0, 1,
-0.7136681, 0.4672832, -2.094952, 0.6313726, 1, 0, 1,
-0.71247, -0.6286327, -0.1712611, 0.627451, 1, 0, 1,
-0.7087836, -1.607121, -1.450406, 0.6196079, 1, 0, 1,
-0.704024, -0.5836029, -2.216657, 0.6156863, 1, 0, 1,
-0.7037691, 0.7808115, 1.336262, 0.6078432, 1, 0, 1,
-0.700622, -0.7717854, -2.348358, 0.6039216, 1, 0, 1,
-0.6938938, 0.2770505, -2.170154, 0.5960785, 1, 0, 1,
-0.6932426, -1.944186, -1.476293, 0.5882353, 1, 0, 1,
-0.690689, -0.9326053, -1.452754, 0.5843138, 1, 0, 1,
-0.6877866, -0.09263869, -1.638382, 0.5764706, 1, 0, 1,
-0.6831086, 0.6951425, -2.877351, 0.572549, 1, 0, 1,
-0.6751334, -0.5203508, -0.7648331, 0.5647059, 1, 0, 1,
-0.6687527, 1.798426, -0.3452333, 0.5607843, 1, 0, 1,
-0.6685976, 0.4232224, -1.599346, 0.5529412, 1, 0, 1,
-0.6650639, -0.4539095, -1.448987, 0.5490196, 1, 0, 1,
-0.6648949, 0.1699038, -1.215485, 0.5411765, 1, 0, 1,
-0.6590095, -0.2409118, -2.15805, 0.5372549, 1, 0, 1,
-0.6502589, 0.5952984, -1.779419, 0.5294118, 1, 0, 1,
-0.6408742, 0.02070996, -1.916573, 0.5254902, 1, 0, 1,
-0.6399797, 0.6532793, -0.1671405, 0.5176471, 1, 0, 1,
-0.6357958, -0.01579418, -1.654888, 0.5137255, 1, 0, 1,
-0.6342729, 0.3765327, -1.351283, 0.5058824, 1, 0, 1,
-0.6333024, -1.330645, -3.023704, 0.5019608, 1, 0, 1,
-0.6329022, 1.430903, -0.007866325, 0.4941176, 1, 0, 1,
-0.6241199, 0.9710917, -1.310516, 0.4862745, 1, 0, 1,
-0.6208281, 0.8322025, -0.1738391, 0.4823529, 1, 0, 1,
-0.6204999, 0.09903453, -2.00925, 0.4745098, 1, 0, 1,
-0.618427, -1.316888, -2.696553, 0.4705882, 1, 0, 1,
-0.6162266, 0.5250952, -1.66086, 0.4627451, 1, 0, 1,
-0.6140362, 1.236533, 0.3819342, 0.4588235, 1, 0, 1,
-0.6000038, -0.8503594, -2.122474, 0.4509804, 1, 0, 1,
-0.5999525, 0.6769384, -0.1623868, 0.4470588, 1, 0, 1,
-0.5994254, 0.6684812, -1.225028, 0.4392157, 1, 0, 1,
-0.5981261, -0.1626064, -1.496014, 0.4352941, 1, 0, 1,
-0.59183, -0.1847495, -4.289526, 0.427451, 1, 0, 1,
-0.5880287, 1.191119, -0.04345867, 0.4235294, 1, 0, 1,
-0.583351, -0.4033895, -3.549159, 0.4156863, 1, 0, 1,
-0.5789315, -1.249592, -2.645969, 0.4117647, 1, 0, 1,
-0.5782887, -0.2582708, -1.698943, 0.4039216, 1, 0, 1,
-0.5775272, -1.245416, -3.636026, 0.3960784, 1, 0, 1,
-0.5760661, 0.4965945, -1.422995, 0.3921569, 1, 0, 1,
-0.5734757, 0.7838819, -0.480147, 0.3843137, 1, 0, 1,
-0.5690333, 0.9594913, -0.1006814, 0.3803922, 1, 0, 1,
-0.5662636, -0.771973, -1.912346, 0.372549, 1, 0, 1,
-0.5657018, -0.8440248, -1.426301, 0.3686275, 1, 0, 1,
-0.5648374, -0.6652867, -2.843045, 0.3607843, 1, 0, 1,
-0.5620422, 1.196159, -1.529385, 0.3568628, 1, 0, 1,
-0.5597898, -1.032554, -5.135763, 0.3490196, 1, 0, 1,
-0.5569572, -0.7424148, -2.89945, 0.345098, 1, 0, 1,
-0.5549521, -0.7118306, -4.331842, 0.3372549, 1, 0, 1,
-0.5546867, -0.3141293, -0.8354416, 0.3333333, 1, 0, 1,
-0.554339, -0.400497, 1.489006, 0.3254902, 1, 0, 1,
-0.5525219, 1.131101, -0.1233921, 0.3215686, 1, 0, 1,
-0.5521193, 1.363552, -1.766181, 0.3137255, 1, 0, 1,
-0.5459647, 0.7167749, 0.137853, 0.3098039, 1, 0, 1,
-0.544118, 0.8782043, -1.063863, 0.3019608, 1, 0, 1,
-0.5432094, -0.5568292, -1.194583, 0.2941177, 1, 0, 1,
-0.5416976, -0.604341, -2.050336, 0.2901961, 1, 0, 1,
-0.5400186, 0.5657898, -1.509722, 0.282353, 1, 0, 1,
-0.5393562, 1.193558, -0.150324, 0.2784314, 1, 0, 1,
-0.5363075, -0.4519593, -3.422586, 0.2705882, 1, 0, 1,
-0.5345266, 0.7295902, -1.991337, 0.2666667, 1, 0, 1,
-0.5287833, -0.8814501, -4.413398, 0.2588235, 1, 0, 1,
-0.5260142, -0.3979142, -2.653827, 0.254902, 1, 0, 1,
-0.5249296, 1.390368, 0.8044752, 0.2470588, 1, 0, 1,
-0.5239339, 1.926768, -0.9251757, 0.2431373, 1, 0, 1,
-0.5103694, -0.9832699, -4.863265, 0.2352941, 1, 0, 1,
-0.5090791, 0.6303692, -0.9185637, 0.2313726, 1, 0, 1,
-0.5063565, 0.009185356, -2.009836, 0.2235294, 1, 0, 1,
-0.5062622, -1.137015, -1.690339, 0.2196078, 1, 0, 1,
-0.502651, 0.6563944, 0.2618347, 0.2117647, 1, 0, 1,
-0.494631, -0.8369946, -2.533254, 0.2078431, 1, 0, 1,
-0.4874423, -0.3269428, -2.233299, 0.2, 1, 0, 1,
-0.4857929, -0.01607854, -1.3394, 0.1921569, 1, 0, 1,
-0.4805937, 0.4156418, -1.613251, 0.1882353, 1, 0, 1,
-0.4787285, 0.1752424, -3.682783, 0.1803922, 1, 0, 1,
-0.4713777, 0.3931691, 0.8491117, 0.1764706, 1, 0, 1,
-0.4713066, 0.2442435, -2.437503, 0.1686275, 1, 0, 1,
-0.4663017, 1.473614, -0.1896164, 0.1647059, 1, 0, 1,
-0.4629636, 0.9417958, -0.4857867, 0.1568628, 1, 0, 1,
-0.461315, 1.152435, -0.1630306, 0.1529412, 1, 0, 1,
-0.459917, -1.366377, -4.041379, 0.145098, 1, 0, 1,
-0.4593917, -0.3259279, -1.077501, 0.1411765, 1, 0, 1,
-0.4557875, 0.4666043, 0.9395106, 0.1333333, 1, 0, 1,
-0.4543528, -0.5388209, -2.409549, 0.1294118, 1, 0, 1,
-0.4543121, -0.3766765, -1.238252, 0.1215686, 1, 0, 1,
-0.4535589, -1.519662, -2.276246, 0.1176471, 1, 0, 1,
-0.4534182, 1.355792, 1.00507, 0.1098039, 1, 0, 1,
-0.4521974, 2.970626, 1.078946, 0.1058824, 1, 0, 1,
-0.4513865, 0.5707456, -1.396397, 0.09803922, 1, 0, 1,
-0.4512854, -0.8559394, -2.831691, 0.09019608, 1, 0, 1,
-0.448709, -2.051962, -3.632212, 0.08627451, 1, 0, 1,
-0.4471413, -0.3795251, 0.1045877, 0.07843138, 1, 0, 1,
-0.4448848, 1.38986, -2.452211, 0.07450981, 1, 0, 1,
-0.4416081, 0.2129996, -0.2471346, 0.06666667, 1, 0, 1,
-0.441382, -0.9013579, -2.050666, 0.0627451, 1, 0, 1,
-0.4402195, 0.2641444, -0.800191, 0.05490196, 1, 0, 1,
-0.4391436, -0.1636487, -2.73425, 0.05098039, 1, 0, 1,
-0.4376796, -1.880893, -1.972393, 0.04313726, 1, 0, 1,
-0.4374783, 0.3058768, -1.17212, 0.03921569, 1, 0, 1,
-0.4349825, 1.991519, -1.379791, 0.03137255, 1, 0, 1,
-0.4342487, -0.2655771, -0.2290598, 0.02745098, 1, 0, 1,
-0.4325891, 0.7789312, -2.006889, 0.01960784, 1, 0, 1,
-0.4282252, -0.5801845, -3.222234, 0.01568628, 1, 0, 1,
-0.426237, -1.578393, -2.353562, 0.007843138, 1, 0, 1,
-0.4246314, 0.7873157, -1.13358, 0.003921569, 1, 0, 1,
-0.4203454, 0.1559433, -1.278886, 0, 1, 0.003921569, 1,
-0.4146974, 0.3480993, -1.54442, 0, 1, 0.01176471, 1,
-0.4138924, -1.071343, -2.432184, 0, 1, 0.01568628, 1,
-0.4104945, -0.778622, -1.529775, 0, 1, 0.02352941, 1,
-0.3984057, -0.4188741, -1.952793, 0, 1, 0.02745098, 1,
-0.3981143, 1.39954, -1.398567, 0, 1, 0.03529412, 1,
-0.3901243, 1.392136, 0.3086483, 0, 1, 0.03921569, 1,
-0.3897977, 1.066922, 1.296323, 0, 1, 0.04705882, 1,
-0.3896927, -0.0862027, -3.291863, 0, 1, 0.05098039, 1,
-0.3885587, 0.9685525, 0.7428151, 0, 1, 0.05882353, 1,
-0.3864556, 0.6889265, -1.117784, 0, 1, 0.0627451, 1,
-0.3828737, -0.7195407, -0.7909481, 0, 1, 0.07058824, 1,
-0.3793517, 1.094849, -1.382067, 0, 1, 0.07450981, 1,
-0.3690759, 0.6820235, -1.332644, 0, 1, 0.08235294, 1,
-0.3661387, -0.7113218, -1.794266, 0, 1, 0.08627451, 1,
-0.3627201, 0.881249, -0.2955045, 0, 1, 0.09411765, 1,
-0.3623375, 0.9960222, -0.2766486, 0, 1, 0.1019608, 1,
-0.361275, 1.296719, 0.6300906, 0, 1, 0.1058824, 1,
-0.3612232, 0.230735, -1.778701, 0, 1, 0.1137255, 1,
-0.3535821, -0.6252629, -3.643219, 0, 1, 0.1176471, 1,
-0.3532917, -0.729066, -3.445955, 0, 1, 0.1254902, 1,
-0.3515499, 1.494621, -0.2970627, 0, 1, 0.1294118, 1,
-0.3489058, 0.7827417, -0.6657186, 0, 1, 0.1372549, 1,
-0.3482116, -1.560541, -3.948202, 0, 1, 0.1411765, 1,
-0.3478327, -1.509236, -3.161038, 0, 1, 0.1490196, 1,
-0.3474805, -1.264329, -2.758759, 0, 1, 0.1529412, 1,
-0.3466302, 0.1041732, -2.122786, 0, 1, 0.1607843, 1,
-0.3435991, -0.7706632, -1.991757, 0, 1, 0.1647059, 1,
-0.3395343, 0.9921702, -0.2613912, 0, 1, 0.172549, 1,
-0.3394011, -0.1720901, -1.520129, 0, 1, 0.1764706, 1,
-0.3349804, 1.941125, -0.06938883, 0, 1, 0.1843137, 1,
-0.3335373, -0.2831386, -1.80432, 0, 1, 0.1882353, 1,
-0.3310828, -0.9378738, -2.94521, 0, 1, 0.1960784, 1,
-0.3259748, -1.000808, -3.00446, 0, 1, 0.2039216, 1,
-0.3229369, 0.1793917, -0.9594344, 0, 1, 0.2078431, 1,
-0.3227589, 2.733777, 1.511215, 0, 1, 0.2156863, 1,
-0.3199793, 0.4940111, -0.6226018, 0, 1, 0.2196078, 1,
-0.3155894, -1.058772, -3.569489, 0, 1, 0.227451, 1,
-0.3153194, 0.830677, -0.1679759, 0, 1, 0.2313726, 1,
-0.3151769, 0.6723007, -0.3464784, 0, 1, 0.2392157, 1,
-0.3127304, 0.5519704, -0.981527, 0, 1, 0.2431373, 1,
-0.3126939, 2.866853, -0.2885691, 0, 1, 0.2509804, 1,
-0.3077338, 0.04499887, -1.3138, 0, 1, 0.254902, 1,
-0.3003072, -0.4110557, -3.177192, 0, 1, 0.2627451, 1,
-0.2998045, 0.2692257, -0.9383544, 0, 1, 0.2666667, 1,
-0.297848, 0.1854805, -0.9736724, 0, 1, 0.2745098, 1,
-0.2970405, 0.2122614, -1.504876, 0, 1, 0.2784314, 1,
-0.2949478, -0.596487, -3.331322, 0, 1, 0.2862745, 1,
-0.293678, 0.692498, -1.999727, 0, 1, 0.2901961, 1,
-0.2908233, 0.9328184, -0.4307524, 0, 1, 0.2980392, 1,
-0.2874275, -1.180845, -3.074398, 0, 1, 0.3058824, 1,
-0.2847432, 0.7563922, -0.1090281, 0, 1, 0.3098039, 1,
-0.2841209, -1.41738, -1.739284, 0, 1, 0.3176471, 1,
-0.2790918, -2.323875, -4.708973, 0, 1, 0.3215686, 1,
-0.2751517, 0.7696693, -0.7197121, 0, 1, 0.3294118, 1,
-0.2744716, 0.06328984, -1.913644, 0, 1, 0.3333333, 1,
-0.2723423, -0.6605098, -3.196845, 0, 1, 0.3411765, 1,
-0.2702571, -0.2393041, -1.350837, 0, 1, 0.345098, 1,
-0.2700822, -1.421268, -2.577667, 0, 1, 0.3529412, 1,
-0.2669817, -0.1304637, -3.041348, 0, 1, 0.3568628, 1,
-0.2668175, -1.041856, -1.802411, 0, 1, 0.3647059, 1,
-0.2665735, -0.9210932, -3.090012, 0, 1, 0.3686275, 1,
-0.2647153, -0.3249077, -2.83933, 0, 1, 0.3764706, 1,
-0.2620908, 0.2458633, -1.080736, 0, 1, 0.3803922, 1,
-0.2609071, 0.05777074, -2.523212, 0, 1, 0.3882353, 1,
-0.2563758, -0.7570078, -2.825655, 0, 1, 0.3921569, 1,
-0.2530277, 0.3275858, 1.519332, 0, 1, 0.4, 1,
-0.2364831, -0.1970477, -3.264986, 0, 1, 0.4078431, 1,
-0.2302549, 1.646411, 1.40772, 0, 1, 0.4117647, 1,
-0.2292732, -0.9832991, -3.696546, 0, 1, 0.4196078, 1,
-0.2280226, 0.1291362, -1.987032, 0, 1, 0.4235294, 1,
-0.226989, -2.508406, -2.796968, 0, 1, 0.4313726, 1,
-0.2259862, -1.221411, -3.001307, 0, 1, 0.4352941, 1,
-0.2258694, 0.1386443, -0.4578184, 0, 1, 0.4431373, 1,
-0.2215909, 0.1987806, -1.270785, 0, 1, 0.4470588, 1,
-0.2207786, -1.366148, -3.67995, 0, 1, 0.454902, 1,
-0.2177144, 2.810557, 0.2049339, 0, 1, 0.4588235, 1,
-0.2162694, -0.0857501, -2.453628, 0, 1, 0.4666667, 1,
-0.214303, 1.344662, 1.363939, 0, 1, 0.4705882, 1,
-0.2094529, 2.042509, -1.108274, 0, 1, 0.4784314, 1,
-0.2092738, 0.4423662, -1.386616, 0, 1, 0.4823529, 1,
-0.2019338, 0.4927607, -0.05266455, 0, 1, 0.4901961, 1,
-0.201661, -0.6100408, -3.183539, 0, 1, 0.4941176, 1,
-0.2001409, 0.9351672, 0.8113832, 0, 1, 0.5019608, 1,
-0.1956155, 0.3947006, -1.928854, 0, 1, 0.509804, 1,
-0.1950253, 0.6759373, -0.3823173, 0, 1, 0.5137255, 1,
-0.1914635, 0.7319184, -1.378933, 0, 1, 0.5215687, 1,
-0.1895758, 2.381656, -1.776349, 0, 1, 0.5254902, 1,
-0.1880531, 0.4361167, 1.814716, 0, 1, 0.5333334, 1,
-0.1880337, 0.4470358, -0.5501975, 0, 1, 0.5372549, 1,
-0.1805435, -0.1846777, -1.346578, 0, 1, 0.5450981, 1,
-0.1797268, 0.6852049, -0.600274, 0, 1, 0.5490196, 1,
-0.1760851, 1.207803, -0.7004454, 0, 1, 0.5568628, 1,
-0.1664443, -1.423032, -3.919106, 0, 1, 0.5607843, 1,
-0.1644847, -0.2468832, -1.993532, 0, 1, 0.5686275, 1,
-0.1632725, -2.319437, -4.483226, 0, 1, 0.572549, 1,
-0.154224, 0.03546052, -0.3612494, 0, 1, 0.5803922, 1,
-0.1541464, -1.401086, -3.827934, 0, 1, 0.5843138, 1,
-0.1527431, -1.144933, -3.095279, 0, 1, 0.5921569, 1,
-0.1505099, 0.2453763, -0.1248842, 0, 1, 0.5960785, 1,
-0.1431261, -1.182329, -4.323403, 0, 1, 0.6039216, 1,
-0.1381285, 0.1786551, 0.4487486, 0, 1, 0.6117647, 1,
-0.1360566, 0.5116869, -1.372127, 0, 1, 0.6156863, 1,
-0.1340875, -0.3029928, -1.739018, 0, 1, 0.6235294, 1,
-0.1285738, 1.031494, 0.8845403, 0, 1, 0.627451, 1,
-0.1254725, -0.4901436, -2.730779, 0, 1, 0.6352941, 1,
-0.1246816, 0.9932564, -0.9575287, 0, 1, 0.6392157, 1,
-0.1201727, 0.2938592, 1.879493, 0, 1, 0.6470588, 1,
-0.1198757, 2.091479, -1.093626, 0, 1, 0.6509804, 1,
-0.117121, -0.8166827, -3.280826, 0, 1, 0.6588235, 1,
-0.1169962, -0.09621971, -2.902837, 0, 1, 0.6627451, 1,
-0.1142711, -0.1064353, -0.7556905, 0, 1, 0.6705883, 1,
-0.1094127, -0.2892559, -1.373681, 0, 1, 0.6745098, 1,
-0.1093509, 0.8297273, 0.4704115, 0, 1, 0.682353, 1,
-0.09836932, 1.225148, -1.1711, 0, 1, 0.6862745, 1,
-0.09548904, -0.7726819, -2.81835, 0, 1, 0.6941177, 1,
-0.09520037, -2.069377, -2.387973, 0, 1, 0.7019608, 1,
-0.09186835, 1.340654, -1.074497, 0, 1, 0.7058824, 1,
-0.09146818, 1.417069, 0.9862688, 0, 1, 0.7137255, 1,
-0.08809926, 0.3152608, 0.5112988, 0, 1, 0.7176471, 1,
-0.07992223, 0.7408841, -0.6245567, 0, 1, 0.7254902, 1,
-0.07804675, -0.4158448, -4.679617, 0, 1, 0.7294118, 1,
-0.07326479, -0.9379224, -4.616661, 0, 1, 0.7372549, 1,
-0.06625266, -1.804205, -2.733502, 0, 1, 0.7411765, 1,
-0.06559846, 0.2362711, -0.5298432, 0, 1, 0.7490196, 1,
-0.06475552, 0.657272, 1.113852, 0, 1, 0.7529412, 1,
-0.06253419, 0.8741943, 0.1686504, 0, 1, 0.7607843, 1,
-0.05921359, 1.651655, -0.6982492, 0, 1, 0.7647059, 1,
-0.05735353, 0.1196139, 1.006332, 0, 1, 0.772549, 1,
-0.0556074, 0.5365999, -1.525285, 0, 1, 0.7764706, 1,
-0.05451078, 0.3237687, 2.585525, 0, 1, 0.7843137, 1,
-0.04839034, 2.036786, 0.7360138, 0, 1, 0.7882353, 1,
-0.04625589, 1.429174, -0.3027583, 0, 1, 0.7960784, 1,
-0.04604251, -0.5291062, -3.93805, 0, 1, 0.8039216, 1,
-0.04603377, -0.3644997, -0.973456, 0, 1, 0.8078431, 1,
-0.03977827, -0.2275842, -3.635968, 0, 1, 0.8156863, 1,
-0.03589875, -0.7857777, -4.128505, 0, 1, 0.8196079, 1,
-0.0323275, -0.03459892, -2.312225, 0, 1, 0.827451, 1,
-0.03060175, 0.1724967, -1.772276, 0, 1, 0.8313726, 1,
-0.02780805, 1.62628, 0.006856196, 0, 1, 0.8392157, 1,
-0.02618119, 0.268822, 0.04442693, 0, 1, 0.8431373, 1,
-0.02151403, 1.197242, -1.26811, 0, 1, 0.8509804, 1,
-0.01801048, -0.1857619, -3.852457, 0, 1, 0.854902, 1,
-0.009751215, 1.075123, -0.5810281, 0, 1, 0.8627451, 1,
-0.009454963, 1.814848, 0.7774438, 0, 1, 0.8666667, 1,
-0.008797158, -1.662122, -3.953711, 0, 1, 0.8745098, 1,
-0.006489031, 1.972626, -0.2721929, 0, 1, 0.8784314, 1,
-0.003754748, -1.361518, -2.214606, 0, 1, 0.8862745, 1,
0.002232054, -0.919433, 3.52628, 0, 1, 0.8901961, 1,
0.002468737, -0.4403135, 1.35089, 0, 1, 0.8980392, 1,
0.005762243, 1.436013, -0.2630807, 0, 1, 0.9058824, 1,
0.007371886, 0.08150133, -1.197719, 0, 1, 0.9098039, 1,
0.01148627, -0.9223226, 3.411916, 0, 1, 0.9176471, 1,
0.01232284, -0.4206096, 3.102247, 0, 1, 0.9215686, 1,
0.01512543, -1.397864, 2.06119, 0, 1, 0.9294118, 1,
0.01589643, 0.3708404, 0.3991579, 0, 1, 0.9333333, 1,
0.01746367, 0.4099829, 0.005558143, 0, 1, 0.9411765, 1,
0.01777208, 1.291138, -0.6468424, 0, 1, 0.945098, 1,
0.021238, 0.1884605, -0.6592602, 0, 1, 0.9529412, 1,
0.02415228, -1.455132, 2.337646, 0, 1, 0.9568627, 1,
0.02596219, -0.5226797, 1.817675, 0, 1, 0.9647059, 1,
0.02620771, -0.6759091, 2.266415, 0, 1, 0.9686275, 1,
0.02660428, -0.3925631, 3.601868, 0, 1, 0.9764706, 1,
0.02782285, 0.3910326, -0.04668757, 0, 1, 0.9803922, 1,
0.0281412, 1.121404, 0.4007857, 0, 1, 0.9882353, 1,
0.03407248, -1.533303, 2.511116, 0, 1, 0.9921569, 1,
0.03567027, -0.6572641, 3.280786, 0, 1, 1, 1,
0.03619456, 0.9629683, -0.7026334, 0, 0.9921569, 1, 1,
0.04107617, -0.0118475, 2.459754, 0, 0.9882353, 1, 1,
0.04224381, -1.031557, 3.440871, 0, 0.9803922, 1, 1,
0.04332983, -1.585736, 1.690267, 0, 0.9764706, 1, 1,
0.04513327, -0.4386843, 3.095454, 0, 0.9686275, 1, 1,
0.04655631, -1.247071, 3.962895, 0, 0.9647059, 1, 1,
0.04724082, 0.6700031, -0.855248, 0, 0.9568627, 1, 1,
0.04849417, 0.4888518, -0.3846024, 0, 0.9529412, 1, 1,
0.04857624, -0.02799597, 3.224913, 0, 0.945098, 1, 1,
0.04943038, 0.9676872, -0.1537068, 0, 0.9411765, 1, 1,
0.06676644, -1.692187, 1.84393, 0, 0.9333333, 1, 1,
0.06735429, -0.2325565, 1.563331, 0, 0.9294118, 1, 1,
0.06735552, -0.5312783, 4.1553, 0, 0.9215686, 1, 1,
0.07291113, 0.4819024, 0.2016308, 0, 0.9176471, 1, 1,
0.08054515, -0.6802654, 3.4212, 0, 0.9098039, 1, 1,
0.08073634, 0.4308164, -0.7276704, 0, 0.9058824, 1, 1,
0.08335306, 0.7437713, 0.7185616, 0, 0.8980392, 1, 1,
0.08444667, 0.4112582, -1.423959, 0, 0.8901961, 1, 1,
0.08943161, -1.498064, 1.19665, 0, 0.8862745, 1, 1,
0.09105921, -0.08803648, 0.6123216, 0, 0.8784314, 1, 1,
0.09460631, -0.5851286, 2.356641, 0, 0.8745098, 1, 1,
0.09565615, -0.4492286, 2.661704, 0, 0.8666667, 1, 1,
0.0960096, 0.4960349, -0.1758884, 0, 0.8627451, 1, 1,
0.09658699, -0.401058, 4.5216, 0, 0.854902, 1, 1,
0.09742148, -0.8657079, 3.382891, 0, 0.8509804, 1, 1,
0.09918898, 0.06527903, 1.005337, 0, 0.8431373, 1, 1,
0.09938535, -0.3567605, 3.670596, 0, 0.8392157, 1, 1,
0.1012032, -1.600807, 2.823516, 0, 0.8313726, 1, 1,
0.1038023, 0.7203643, 0.1665396, 0, 0.827451, 1, 1,
0.1038265, -1.170401, 3.724184, 0, 0.8196079, 1, 1,
0.1056009, 0.9201147, -0.5487726, 0, 0.8156863, 1, 1,
0.1075421, -0.3473854, 1.28918, 0, 0.8078431, 1, 1,
0.107734, 0.01810833, 0.9488331, 0, 0.8039216, 1, 1,
0.1079535, -1.282001, 2.681489, 0, 0.7960784, 1, 1,
0.1079545, -0.388942, 3.075841, 0, 0.7882353, 1, 1,
0.1130492, -0.08386268, 1.786363, 0, 0.7843137, 1, 1,
0.1158745, 0.4972713, -0.01963445, 0, 0.7764706, 1, 1,
0.1160195, -1.117199, 3.71838, 0, 0.772549, 1, 1,
0.1167254, 0.1957908, 1.869965, 0, 0.7647059, 1, 1,
0.1182609, 0.5004605, 0.9294526, 0, 0.7607843, 1, 1,
0.1183238, 1.032663, -1.265847, 0, 0.7529412, 1, 1,
0.1192204, -0.1629972, 3.120003, 0, 0.7490196, 1, 1,
0.1199717, 0.9909457, -0.03783404, 0, 0.7411765, 1, 1,
0.1254006, -1.117324, 5.083867, 0, 0.7372549, 1, 1,
0.1256653, -0.5179555, 3.983727, 0, 0.7294118, 1, 1,
0.1277557, 1.004259, -1.443909, 0, 0.7254902, 1, 1,
0.1287628, -0.8706407, 1.609825, 0, 0.7176471, 1, 1,
0.1291671, -1.71438, 2.343374, 0, 0.7137255, 1, 1,
0.1328943, 1.516515, -1.019326, 0, 0.7058824, 1, 1,
0.1350085, -0.8219145, 3.689522, 0, 0.6980392, 1, 1,
0.1373847, 0.3415837, 1.892224, 0, 0.6941177, 1, 1,
0.1423603, -1.832169, 1.69935, 0, 0.6862745, 1, 1,
0.1427071, 0.7066166, 0.09733789, 0, 0.682353, 1, 1,
0.1435149, 2.305205, 0.597313, 0, 0.6745098, 1, 1,
0.1443991, -0.334558, 2.924977, 0, 0.6705883, 1, 1,
0.1469787, -0.558068, 2.632442, 0, 0.6627451, 1, 1,
0.1530219, -0.3825291, 3.012854, 0, 0.6588235, 1, 1,
0.1629775, -0.4965345, 3.31451, 0, 0.6509804, 1, 1,
0.163244, -0.2624875, 3.714623, 0, 0.6470588, 1, 1,
0.1635151, 0.4986752, 0.7120491, 0, 0.6392157, 1, 1,
0.1637558, -1.67708, 3.292696, 0, 0.6352941, 1, 1,
0.1651913, -0.35142, 0.4638068, 0, 0.627451, 1, 1,
0.1661594, 0.6619363, -0.09274163, 0, 0.6235294, 1, 1,
0.1678373, -1.263099, 1.80546, 0, 0.6156863, 1, 1,
0.1731592, -1.869016, 3.889677, 0, 0.6117647, 1, 1,
0.1742722, 0.917995, 1.059667, 0, 0.6039216, 1, 1,
0.1771443, -2.7697, 4.328397, 0, 0.5960785, 1, 1,
0.1779918, -0.2205255, 2.170708, 0, 0.5921569, 1, 1,
0.1788142, -0.9070557, 0.7748879, 0, 0.5843138, 1, 1,
0.1788522, 0.08414657, 3.045025, 0, 0.5803922, 1, 1,
0.1797135, -1.681551, 2.872377, 0, 0.572549, 1, 1,
0.181032, -1.206142, 2.932868, 0, 0.5686275, 1, 1,
0.1835731, 0.1294995, 0.8441747, 0, 0.5607843, 1, 1,
0.1874446, 0.7983009, 1.1088, 0, 0.5568628, 1, 1,
0.1893622, 0.8584609, 0.6265967, 0, 0.5490196, 1, 1,
0.1920681, -0.6193863, 1.474795, 0, 0.5450981, 1, 1,
0.192302, -1.393924, 2.32369, 0, 0.5372549, 1, 1,
0.1968767, -0.01100944, 1.344773, 0, 0.5333334, 1, 1,
0.1978576, 1.421336, 1.645138, 0, 0.5254902, 1, 1,
0.2048111, -2.04461, 3.314325, 0, 0.5215687, 1, 1,
0.2148723, -0.4903969, 1.786718, 0, 0.5137255, 1, 1,
0.2176856, 1.184096, 0.2943563, 0, 0.509804, 1, 1,
0.2235848, -1.620643, 4.305962, 0, 0.5019608, 1, 1,
0.2238093, -0.8859724, 5.341492, 0, 0.4941176, 1, 1,
0.2279344, -1.175473, 2.619171, 0, 0.4901961, 1, 1,
0.2279654, -0.1262485, 1.755337, 0, 0.4823529, 1, 1,
0.2303309, 0.5452608, -1.313814, 0, 0.4784314, 1, 1,
0.2317335, 0.1548333, 1.724454, 0, 0.4705882, 1, 1,
0.2326846, -0.3454417, 1.463583, 0, 0.4666667, 1, 1,
0.2348426, -1.395196, 3.342511, 0, 0.4588235, 1, 1,
0.2355774, -0.1258979, 1.273565, 0, 0.454902, 1, 1,
0.246645, -1.174227, 2.179984, 0, 0.4470588, 1, 1,
0.2472657, -1.895893, 1.309164, 0, 0.4431373, 1, 1,
0.2473567, 1.406371, 0.3058257, 0, 0.4352941, 1, 1,
0.2483699, 2.012681, 1.560528, 0, 0.4313726, 1, 1,
0.2503037, -2.21342, 2.869413, 0, 0.4235294, 1, 1,
0.2547652, 0.4199509, 0.7609419, 0, 0.4196078, 1, 1,
0.2598419, -1.799971, 2.884526, 0, 0.4117647, 1, 1,
0.2642685, 1.247205, -1.140446, 0, 0.4078431, 1, 1,
0.2644217, -0.6434345, 2.09666, 0, 0.4, 1, 1,
0.2647377, -0.1417877, 3.606103, 0, 0.3921569, 1, 1,
0.2658421, 0.2372027, 1.888278, 0, 0.3882353, 1, 1,
0.2673325, 1.562984, 1.622038, 0, 0.3803922, 1, 1,
0.2685855, 0.2950697, 1.509784, 0, 0.3764706, 1, 1,
0.271691, 0.4405142, 0.5183608, 0, 0.3686275, 1, 1,
0.2729026, 0.1358845, 2.343295, 0, 0.3647059, 1, 1,
0.2747269, -0.4697651, 0.6708223, 0, 0.3568628, 1, 1,
0.2845985, -0.0779488, 2.985176, 0, 0.3529412, 1, 1,
0.2851021, 0.3491555, 3.440766, 0, 0.345098, 1, 1,
0.2900657, 0.7392247, 0.8559977, 0, 0.3411765, 1, 1,
0.2947818, 0.6388176, -0.5523954, 0, 0.3333333, 1, 1,
0.296973, 1.606868, 0.1572097, 0, 0.3294118, 1, 1,
0.2985359, -0.9048285, 3.850096, 0, 0.3215686, 1, 1,
0.300216, -1.015597, 2.93748, 0, 0.3176471, 1, 1,
0.3074216, 0.8015797, 1.319032, 0, 0.3098039, 1, 1,
0.3075389, 1.251414, -0.2995186, 0, 0.3058824, 1, 1,
0.3100164, 0.1611265, 1.925993, 0, 0.2980392, 1, 1,
0.3110133, 0.5149737, 0.04817316, 0, 0.2901961, 1, 1,
0.3147391, -1.067415, 2.232612, 0, 0.2862745, 1, 1,
0.3156877, 1.018065, 0.4126258, 0, 0.2784314, 1, 1,
0.3161629, 0.1444561, 0.9367948, 0, 0.2745098, 1, 1,
0.3177286, 0.9088535, -0.5267738, 0, 0.2666667, 1, 1,
0.3184215, -0.770049, 3.975266, 0, 0.2627451, 1, 1,
0.3187039, 0.6849149, 0.7698144, 0, 0.254902, 1, 1,
0.3208008, 1.582726, 1.251371, 0, 0.2509804, 1, 1,
0.3211892, 0.3829948, -0.7433437, 0, 0.2431373, 1, 1,
0.3213028, -0.3717334, 2.649956, 0, 0.2392157, 1, 1,
0.3227596, 0.1964158, 2.012728, 0, 0.2313726, 1, 1,
0.3231876, -0.9006099, 3.093438, 0, 0.227451, 1, 1,
0.3302198, 0.4808569, 0.8409806, 0, 0.2196078, 1, 1,
0.3306995, -1.741382, 2.726767, 0, 0.2156863, 1, 1,
0.3310644, -0.2156771, 2.130696, 0, 0.2078431, 1, 1,
0.3376083, -0.7415845, 3.582838, 0, 0.2039216, 1, 1,
0.339748, 0.2898265, 1.026972, 0, 0.1960784, 1, 1,
0.3441574, 0.2734097, 0.2996288, 0, 0.1882353, 1, 1,
0.345006, 0.524995, 0.334727, 0, 0.1843137, 1, 1,
0.3454573, 0.9079611, -0.566112, 0, 0.1764706, 1, 1,
0.3548859, 0.484646, 1.562699, 0, 0.172549, 1, 1,
0.3551956, 1.146959, -0.4777161, 0, 0.1647059, 1, 1,
0.3571235, 2.240463, -1.30056, 0, 0.1607843, 1, 1,
0.3588023, 0.06501448, 2.16348, 0, 0.1529412, 1, 1,
0.3600206, 1.988122, -0.03956088, 0, 0.1490196, 1, 1,
0.3626058, -0.891367, 2.453821, 0, 0.1411765, 1, 1,
0.3626386, -0.3399964, 1.843541, 0, 0.1372549, 1, 1,
0.3679833, 0.8648553, 1.6373, 0, 0.1294118, 1, 1,
0.3758556, 1.512118, -0.648485, 0, 0.1254902, 1, 1,
0.3817749, -0.4354103, 3.344366, 0, 0.1176471, 1, 1,
0.3841044, 0.6367635, 0.7722698, 0, 0.1137255, 1, 1,
0.3926677, 1.755076, -0.3547176, 0, 0.1058824, 1, 1,
0.3934921, -0.05705505, 0.8642045, 0, 0.09803922, 1, 1,
0.394764, 0.5343515, 0.1955222, 0, 0.09411765, 1, 1,
0.3983251, -0.4448477, 2.135623, 0, 0.08627451, 1, 1,
0.3987315, -0.3823584, 2.000701, 0, 0.08235294, 1, 1,
0.4136739, -1.42487, 3.687026, 0, 0.07450981, 1, 1,
0.4138311, -0.8988531, 2.283722, 0, 0.07058824, 1, 1,
0.416019, 0.7795157, 0.7952018, 0, 0.0627451, 1, 1,
0.417217, 0.132215, 1.922509, 0, 0.05882353, 1, 1,
0.4320516, -0.6345435, 2.239157, 0, 0.05098039, 1, 1,
0.4365737, 0.567064, -0.1486704, 0, 0.04705882, 1, 1,
0.440106, -0.4090684, 4.016546, 0, 0.03921569, 1, 1,
0.4414122, 0.523236, 0.3164789, 0, 0.03529412, 1, 1,
0.4444617, -0.1402576, 1.442931, 0, 0.02745098, 1, 1,
0.4461125, -0.7367175, 3.025889, 0, 0.02352941, 1, 1,
0.4483798, 0.4364018, -1.701111, 0, 0.01568628, 1, 1,
0.4501406, 0.3956691, 1.210345, 0, 0.01176471, 1, 1,
0.4540055, -0.6379396, -0.7621965, 0, 0.003921569, 1, 1,
0.454872, 1.13072, 0.5962955, 0.003921569, 0, 1, 1,
0.4576333, 1.886526, 0.630159, 0.007843138, 0, 1, 1,
0.4586344, 1.442794, -0.9212915, 0.01568628, 0, 1, 1,
0.4591502, -0.02911134, 2.103325, 0.01960784, 0, 1, 1,
0.4611973, 0.4343359, 0.6481707, 0.02745098, 0, 1, 1,
0.4617502, 1.478075, 0.08782843, 0.03137255, 0, 1, 1,
0.4662766, 0.9774047, 2.200735, 0.03921569, 0, 1, 1,
0.4717944, -1.512175, 1.953338, 0.04313726, 0, 1, 1,
0.4729027, -1.359964, 2.648864, 0.05098039, 0, 1, 1,
0.4734638, 0.007663266, 1.77727, 0.05490196, 0, 1, 1,
0.4748635, -0.557038, 3.765367, 0.0627451, 0, 1, 1,
0.4752837, -0.1570234, 1.935608, 0.06666667, 0, 1, 1,
0.4790917, -0.5194466, 1.646626, 0.07450981, 0, 1, 1,
0.4969696, 0.003148569, 2.311405, 0.07843138, 0, 1, 1,
0.49874, 0.5564892, 0.5984897, 0.08627451, 0, 1, 1,
0.507337, -0.1171415, 2.464787, 0.09019608, 0, 1, 1,
0.5095351, 0.6642212, 0.98485, 0.09803922, 0, 1, 1,
0.5179514, -1.108269, 3.096729, 0.1058824, 0, 1, 1,
0.5189466, 0.4353286, 1.816174, 0.1098039, 0, 1, 1,
0.5201137, -0.559433, 1.631567, 0.1176471, 0, 1, 1,
0.5204462, -1.048812, 2.299692, 0.1215686, 0, 1, 1,
0.5233632, 0.2211911, 1.238137, 0.1294118, 0, 1, 1,
0.5238335, 1.246043, 1.51426, 0.1333333, 0, 1, 1,
0.5288875, 0.02917932, 1.666536, 0.1411765, 0, 1, 1,
0.5332713, 1.534438, 0.5852314, 0.145098, 0, 1, 1,
0.5355613, -0.6284339, 2.579183, 0.1529412, 0, 1, 1,
0.5389701, 0.6660739, 2.240654, 0.1568628, 0, 1, 1,
0.5401413, -0.579244, 3.201373, 0.1647059, 0, 1, 1,
0.5406683, 0.3331002, 1.613124, 0.1686275, 0, 1, 1,
0.5410453, 0.9753093, 1.540317, 0.1764706, 0, 1, 1,
0.5447138, 1.122647, 0.9295983, 0.1803922, 0, 1, 1,
0.5535018, -1.242595, 2.940899, 0.1882353, 0, 1, 1,
0.5552291, 0.6627042, 1.996844, 0.1921569, 0, 1, 1,
0.5613617, 0.5125269, 1.212548, 0.2, 0, 1, 1,
0.562016, -1.008765, 4.267235, 0.2078431, 0, 1, 1,
0.5784174, -1.322883, 3.076872, 0.2117647, 0, 1, 1,
0.5793892, -0.2752351, 2.100308, 0.2196078, 0, 1, 1,
0.580896, 0.3061125, 2.102076, 0.2235294, 0, 1, 1,
0.5832254, -1.793377, 1.866006, 0.2313726, 0, 1, 1,
0.5851537, 0.3264205, 1.673657, 0.2352941, 0, 1, 1,
0.5874526, -0.8607818, 4.403034, 0.2431373, 0, 1, 1,
0.5929561, -0.4813771, 2.783258, 0.2470588, 0, 1, 1,
0.5947989, -0.7561031, 0.5294572, 0.254902, 0, 1, 1,
0.5975851, 0.5090858, 2.228493, 0.2588235, 0, 1, 1,
0.6026156, -1.779113, 1.834505, 0.2666667, 0, 1, 1,
0.6034071, -0.08670221, 0.6046394, 0.2705882, 0, 1, 1,
0.6169384, 0.5532858, -0.3251913, 0.2784314, 0, 1, 1,
0.6188804, -0.7175109, 0.9690922, 0.282353, 0, 1, 1,
0.622752, -0.01685957, 0.2691675, 0.2901961, 0, 1, 1,
0.6233506, 0.7779687, 2.579545, 0.2941177, 0, 1, 1,
0.6246449, 0.5784636, 1.680145, 0.3019608, 0, 1, 1,
0.6248304, 0.3978374, 0.5181738, 0.3098039, 0, 1, 1,
0.626122, -0.618592, 2.261301, 0.3137255, 0, 1, 1,
0.6264148, 1.129021, -0.3367196, 0.3215686, 0, 1, 1,
0.6268763, -0.7334231, 2.977289, 0.3254902, 0, 1, 1,
0.6290588, 0.5886239, -0.2759039, 0.3333333, 0, 1, 1,
0.6339105, -0.4084626, 1.614191, 0.3372549, 0, 1, 1,
0.6379111, -0.8558393, 3.13374, 0.345098, 0, 1, 1,
0.6384275, 1.654945, 1.140873, 0.3490196, 0, 1, 1,
0.6418369, 0.6732777, 0.9476035, 0.3568628, 0, 1, 1,
0.64358, 0.9339693, -0.6312682, 0.3607843, 0, 1, 1,
0.6449148, 0.3016429, 1.864466, 0.3686275, 0, 1, 1,
0.6460385, -2.116967, 1.107018, 0.372549, 0, 1, 1,
0.6466043, 0.186464, 0.1603578, 0.3803922, 0, 1, 1,
0.6467097, -0.6337472, 0.6241855, 0.3843137, 0, 1, 1,
0.6478102, 0.3810487, 0.5786422, 0.3921569, 0, 1, 1,
0.652711, -0.3144458, 2.483649, 0.3960784, 0, 1, 1,
0.6683692, 0.5047109, 1.868487, 0.4039216, 0, 1, 1,
0.6685008, 1.338499, 2.14266, 0.4117647, 0, 1, 1,
0.6779768, -0.3911856, 2.923295, 0.4156863, 0, 1, 1,
0.6788205, 0.7187827, -0.2074949, 0.4235294, 0, 1, 1,
0.6790745, -0.641201, 0.9726446, 0.427451, 0, 1, 1,
0.6831859, 0.2666743, 1.309766, 0.4352941, 0, 1, 1,
0.6840409, -2.109957, 1.932359, 0.4392157, 0, 1, 1,
0.6871799, 1.273652, 0.952956, 0.4470588, 0, 1, 1,
0.6899268, 0.6143259, 0.9230722, 0.4509804, 0, 1, 1,
0.6916373, -1.367521, 3.147347, 0.4588235, 0, 1, 1,
0.6918625, 0.62435, 0.1442661, 0.4627451, 0, 1, 1,
0.6928082, 0.09130151, -0.2045438, 0.4705882, 0, 1, 1,
0.6962296, -0.8410625, 2.361766, 0.4745098, 0, 1, 1,
0.6986821, 1.086182, 0.8252628, 0.4823529, 0, 1, 1,
0.7005424, -0.7055185, 2.948623, 0.4862745, 0, 1, 1,
0.7020258, -0.8502486, 1.994688, 0.4941176, 0, 1, 1,
0.7069988, 2.184096, -0.2607362, 0.5019608, 0, 1, 1,
0.7076879, 0.1104169, 2.312238, 0.5058824, 0, 1, 1,
0.7136707, -0.004466977, 0.3383614, 0.5137255, 0, 1, 1,
0.7167295, -1.89438, 2.064727, 0.5176471, 0, 1, 1,
0.7207841, -0.2233492, 2.947156, 0.5254902, 0, 1, 1,
0.7215219, 0.1342805, 0.07601924, 0.5294118, 0, 1, 1,
0.7261852, -0.9659243, 2.311845, 0.5372549, 0, 1, 1,
0.7273929, -0.3239101, 2.453977, 0.5411765, 0, 1, 1,
0.7297103, 1.12513, 0.7243034, 0.5490196, 0, 1, 1,
0.7313812, 0.2678928, 0.9639826, 0.5529412, 0, 1, 1,
0.7346054, 0.4738493, 2.238682, 0.5607843, 0, 1, 1,
0.7350658, -0.03215388, 2.476573, 0.5647059, 0, 1, 1,
0.7352252, -0.5193382, 2.083286, 0.572549, 0, 1, 1,
0.7360641, -0.1194267, 0.6681805, 0.5764706, 0, 1, 1,
0.7366153, 1.276489, 1.526812, 0.5843138, 0, 1, 1,
0.7416542, -0.7983279, 1.802677, 0.5882353, 0, 1, 1,
0.7468345, -1.245582, 2.776712, 0.5960785, 0, 1, 1,
0.7475573, 0.05441936, 1.446396, 0.6039216, 0, 1, 1,
0.7504027, -1.368469, 4.144716, 0.6078432, 0, 1, 1,
0.7505257, 1.707098, -0.5341757, 0.6156863, 0, 1, 1,
0.7556423, -0.2355451, 2.492332, 0.6196079, 0, 1, 1,
0.7570831, 0.2805986, 1.723851, 0.627451, 0, 1, 1,
0.7595637, 0.02502739, 2.677508, 0.6313726, 0, 1, 1,
0.7613028, -0.9271764, 2.761762, 0.6392157, 0, 1, 1,
0.7666836, 0.420171, -0.09031802, 0.6431373, 0, 1, 1,
0.7710223, -0.3990599, 2.148673, 0.6509804, 0, 1, 1,
0.7787492, 0.4773916, 0.9441356, 0.654902, 0, 1, 1,
0.781006, -1.228364, 2.060764, 0.6627451, 0, 1, 1,
0.7816252, 0.6832178, 0.7525223, 0.6666667, 0, 1, 1,
0.7818008, 0.8176168, 2.266866, 0.6745098, 0, 1, 1,
0.7906095, -0.4907624, 1.802905, 0.6784314, 0, 1, 1,
0.8046702, 0.6986542, 1.807947, 0.6862745, 0, 1, 1,
0.8051654, 0.6203976, 0.9731541, 0.6901961, 0, 1, 1,
0.8062017, -0.9555916, 2.400558, 0.6980392, 0, 1, 1,
0.8074401, 1.303278, -0.1691875, 0.7058824, 0, 1, 1,
0.8138697, 1.054811, 0.4164933, 0.7098039, 0, 1, 1,
0.8155174, 0.1529596, -0.6607223, 0.7176471, 0, 1, 1,
0.8180344, 1.205477, 1.325759, 0.7215686, 0, 1, 1,
0.8208697, 1.662522, 0.5251592, 0.7294118, 0, 1, 1,
0.8406785, 0.9716809, -0.8658956, 0.7333333, 0, 1, 1,
0.8408574, 0.4220667, 1.557694, 0.7411765, 0, 1, 1,
0.8427631, -0.630486, 2.855897, 0.7450981, 0, 1, 1,
0.8444854, -0.544833, 2.805806, 0.7529412, 0, 1, 1,
0.8459557, 0.1860727, 1.015105, 0.7568628, 0, 1, 1,
0.8462276, 0.01790781, -0.8500406, 0.7647059, 0, 1, 1,
0.8497856, -0.2968596, 2.49579, 0.7686275, 0, 1, 1,
0.8498914, 1.426812, -1.849897, 0.7764706, 0, 1, 1,
0.850332, 0.7116479, 1.615818, 0.7803922, 0, 1, 1,
0.8582784, -0.1510114, 0.6168393, 0.7882353, 0, 1, 1,
0.8590522, -0.382164, 1.652595, 0.7921569, 0, 1, 1,
0.8669255, 0.4425662, 1.447282, 0.8, 0, 1, 1,
0.8687497, -1.605947, 2.072546, 0.8078431, 0, 1, 1,
0.8700441, -1.136962, 2.69384, 0.8117647, 0, 1, 1,
0.8706852, -1.820094, 3.482105, 0.8196079, 0, 1, 1,
0.8777464, 0.2962134, 2.143682, 0.8235294, 0, 1, 1,
0.8835388, -0.1652649, 2.63946, 0.8313726, 0, 1, 1,
0.8838998, -0.9222848, 2.594992, 0.8352941, 0, 1, 1,
0.8846827, 1.144162, 0.6016061, 0.8431373, 0, 1, 1,
0.8886544, -1.790423, 3.844309, 0.8470588, 0, 1, 1,
0.8936186, 0.134493, 1.389022, 0.854902, 0, 1, 1,
0.8949618, 0.2860007, 2.230054, 0.8588235, 0, 1, 1,
0.8976583, 1.739648, -0.1120465, 0.8666667, 0, 1, 1,
0.8980261, -0.6681641, 0.7788191, 0.8705882, 0, 1, 1,
0.8989123, -0.5439715, 0.3613507, 0.8784314, 0, 1, 1,
0.8994734, -0.556017, 0.7537311, 0.8823529, 0, 1, 1,
0.9033695, 0.4180514, -0.2844162, 0.8901961, 0, 1, 1,
0.9035338, 0.599561, 0.8519078, 0.8941177, 0, 1, 1,
0.9095495, 1.74166, 0.9133231, 0.9019608, 0, 1, 1,
0.9115039, 0.7955053, 0.2493813, 0.9098039, 0, 1, 1,
0.9128217, -0.2921585, 1.998516, 0.9137255, 0, 1, 1,
0.9168555, -0.09401455, 2.021066, 0.9215686, 0, 1, 1,
0.9169289, -1.024227, 2.837773, 0.9254902, 0, 1, 1,
0.9197226, -0.3249076, 0.2389581, 0.9333333, 0, 1, 1,
0.9241978, 1.145927, 0.2663221, 0.9372549, 0, 1, 1,
0.9248087, 0.1257806, 0.7025601, 0.945098, 0, 1, 1,
0.9323097, -1.393557, 2.680237, 0.9490196, 0, 1, 1,
0.932981, 0.2971643, 3.343707, 0.9568627, 0, 1, 1,
0.9372766, -0.1259298, 2.199806, 0.9607843, 0, 1, 1,
0.9399013, 2.358809, -0.2881651, 0.9686275, 0, 1, 1,
0.9403439, 0.1593659, -0.08335566, 0.972549, 0, 1, 1,
0.9405181, -1.186746, 1.310366, 0.9803922, 0, 1, 1,
0.9412922, 1.609418, 0.7314597, 0.9843137, 0, 1, 1,
0.9440797, -1.724586, 1.737015, 0.9921569, 0, 1, 1,
0.9490263, -1.25832, 3.657526, 0.9960784, 0, 1, 1,
0.9500447, -0.9105971, 2.701742, 1, 0, 0.9960784, 1,
0.9524037, 0.2322935, 2.989514, 1, 0, 0.9882353, 1,
0.9533967, -0.5462942, 1.033506, 1, 0, 0.9843137, 1,
0.9566475, 0.2003098, 1.795204, 1, 0, 0.9764706, 1,
0.967831, 0.1090772, 1.811184, 1, 0, 0.972549, 1,
0.971294, -0.8977419, 1.372573, 1, 0, 0.9647059, 1,
0.979002, 1.186913, 1.389858, 1, 0, 0.9607843, 1,
0.9848589, -0.385198, 3.01818, 1, 0, 0.9529412, 1,
0.9872457, -0.3519064, 1.61022, 1, 0, 0.9490196, 1,
0.9882656, 0.4745338, 2.262987, 1, 0, 0.9411765, 1,
0.9896537, -0.9034654, 3.710713, 1, 0, 0.9372549, 1,
0.9911571, -0.8113565, 2.39987, 1, 0, 0.9294118, 1,
0.9928845, 0.7495952, 0.2886803, 1, 0, 0.9254902, 1,
0.9989812, -1.859071, 2.819076, 1, 0, 0.9176471, 1,
1.00323, -0.3208649, 2.810779, 1, 0, 0.9137255, 1,
1.004351, -0.04937391, 1.691114, 1, 0, 0.9058824, 1,
1.005033, -0.5260431, 0.3908868, 1, 0, 0.9019608, 1,
1.009126, -0.8896935, 2.187706, 1, 0, 0.8941177, 1,
1.010128, 1.500411, 1.347181, 1, 0, 0.8862745, 1,
1.016024, -0.3002934, 4.070987, 1, 0, 0.8823529, 1,
1.016038, -0.9165272, 3.1455, 1, 0, 0.8745098, 1,
1.020481, 0.0528295, 1.562933, 1, 0, 0.8705882, 1,
1.024154, -0.2795576, 1.318762, 1, 0, 0.8627451, 1,
1.024683, -2.036863, 2.278549, 1, 0, 0.8588235, 1,
1.036518, -0.6843396, 2.093359, 1, 0, 0.8509804, 1,
1.041507, -0.5801799, 1.030449, 1, 0, 0.8470588, 1,
1.044506, -0.09784891, 3.757721, 1, 0, 0.8392157, 1,
1.047321, 0.4114223, 1.678213, 1, 0, 0.8352941, 1,
1.05702, -0.491999, 0.2778448, 1, 0, 0.827451, 1,
1.059649, -0.05361054, -0.2351161, 1, 0, 0.8235294, 1,
1.061823, -0.8557033, 3.637608, 1, 0, 0.8156863, 1,
1.062658, 1.031153, 0.8878777, 1, 0, 0.8117647, 1,
1.074388, 0.281323, 0.5979686, 1, 0, 0.8039216, 1,
1.077534, 1.103593, -0.7087555, 1, 0, 0.7960784, 1,
1.078411, 0.3875562, 0.4810171, 1, 0, 0.7921569, 1,
1.079654, -0.648619, 3.446217, 1, 0, 0.7843137, 1,
1.083336, -0.977389, 2.845282, 1, 0, 0.7803922, 1,
1.084093, 1.723697, 1.774536, 1, 0, 0.772549, 1,
1.084409, -1.010252, 1.744276, 1, 0, 0.7686275, 1,
1.08729, -0.851765, 0.13589, 1, 0, 0.7607843, 1,
1.091489, -1.109588, 1.946115, 1, 0, 0.7568628, 1,
1.093243, 1.302636, -1.182829, 1, 0, 0.7490196, 1,
1.105448, -0.9180036, 2.619792, 1, 0, 0.7450981, 1,
1.110039, -1.009381, 3.396796, 1, 0, 0.7372549, 1,
1.115596, -0.7693127, 2.447843, 1, 0, 0.7333333, 1,
1.115858, 0.9053957, 1.248554, 1, 0, 0.7254902, 1,
1.147232, -0.02473976, 1.435186, 1, 0, 0.7215686, 1,
1.148961, 0.4722742, 0.4522468, 1, 0, 0.7137255, 1,
1.15462, -0.8601865, -0.9961479, 1, 0, 0.7098039, 1,
1.17548, 1.412579, 0.2819413, 1, 0, 0.7019608, 1,
1.175915, 0.7544237, 1.964514, 1, 0, 0.6941177, 1,
1.176646, 1.715328, 0.02232969, 1, 0, 0.6901961, 1,
1.178685, 1.158395, 1.489695, 1, 0, 0.682353, 1,
1.179621, -0.815851, 4.151315, 1, 0, 0.6784314, 1,
1.187219, -2.335853, 1.848175, 1, 0, 0.6705883, 1,
1.194048, -1.484313, 2.544062, 1, 0, 0.6666667, 1,
1.196091, 0.2664656, 1.760847, 1, 0, 0.6588235, 1,
1.205273, 0.3861555, 0.9849588, 1, 0, 0.654902, 1,
1.220475, 0.7138726, 0.4276942, 1, 0, 0.6470588, 1,
1.223644, -0.4929711, 1.303245, 1, 0, 0.6431373, 1,
1.226248, 1.963338, -0.1640989, 1, 0, 0.6352941, 1,
1.226957, -0.8318366, 0.5941201, 1, 0, 0.6313726, 1,
1.227835, 0.4849409, 1.960585, 1, 0, 0.6235294, 1,
1.233704, -1.592859, 1.485464, 1, 0, 0.6196079, 1,
1.234785, -0.727962, 2.39049, 1, 0, 0.6117647, 1,
1.239527, 1.571806, 0.4080199, 1, 0, 0.6078432, 1,
1.240954, -1.397361, 0.8057399, 1, 0, 0.6, 1,
1.245786, -0.4354079, 2.793985, 1, 0, 0.5921569, 1,
1.246163, -1.108376, 2.722541, 1, 0, 0.5882353, 1,
1.248086, 1.145549, 1.536646, 1, 0, 0.5803922, 1,
1.250015, -0.188812, 2.740376, 1, 0, 0.5764706, 1,
1.256013, 1.165339, 3.304734, 1, 0, 0.5686275, 1,
1.273375, 0.968935, -0.102563, 1, 0, 0.5647059, 1,
1.280016, 0.6954927, 0.9743307, 1, 0, 0.5568628, 1,
1.288785, -0.4433363, 2.946117, 1, 0, 0.5529412, 1,
1.291889, -0.02982979, 1.02465, 1, 0, 0.5450981, 1,
1.297249, 0.3656507, -0.1482252, 1, 0, 0.5411765, 1,
1.30188, 0.6739806, -1.061541, 1, 0, 0.5333334, 1,
1.309576, 1.136178, 0.8364778, 1, 0, 0.5294118, 1,
1.311037, 0.9771707, 1.321296, 1, 0, 0.5215687, 1,
1.319134, 1.289617, 0.5670182, 1, 0, 0.5176471, 1,
1.323053, 0.6028916, 2.528175, 1, 0, 0.509804, 1,
1.323182, -0.2627735, 1.865324, 1, 0, 0.5058824, 1,
1.325227, -0.4652805, 0.1267187, 1, 0, 0.4980392, 1,
1.327902, -0.2450373, 1.202951, 1, 0, 0.4901961, 1,
1.332878, -1.19958, 4.919301, 1, 0, 0.4862745, 1,
1.335152, 2.170001, 2.382622, 1, 0, 0.4784314, 1,
1.34261, -0.5073756, 2.306451, 1, 0, 0.4745098, 1,
1.349919, 0.3994772, 2.593144, 1, 0, 0.4666667, 1,
1.370962, -0.246639, 1.629776, 1, 0, 0.4627451, 1,
1.406733, -0.9528995, 3.246878, 1, 0, 0.454902, 1,
1.407281, -0.2865096, 2.691168, 1, 0, 0.4509804, 1,
1.41845, 1.293923, 2.302356, 1, 0, 0.4431373, 1,
1.421899, 1.382852, 2.888856, 1, 0, 0.4392157, 1,
1.435001, 1.087549, 0.6036939, 1, 0, 0.4313726, 1,
1.447753, -0.8919389, 0.6326944, 1, 0, 0.427451, 1,
1.448823, -0.430661, 1.526851, 1, 0, 0.4196078, 1,
1.461233, 1.219761, 1.896266, 1, 0, 0.4156863, 1,
1.464517, -0.1664804, 2.360655, 1, 0, 0.4078431, 1,
1.466675, -0.122314, 0.8333149, 1, 0, 0.4039216, 1,
1.473328, -0.8545056, 1.13603, 1, 0, 0.3960784, 1,
1.482904, 0.2707325, 1.290619, 1, 0, 0.3882353, 1,
1.488222, -2.085914, 3.61511, 1, 0, 0.3843137, 1,
1.516619, 0.6471387, 1.687018, 1, 0, 0.3764706, 1,
1.521801, -0.7153416, 2.136702, 1, 0, 0.372549, 1,
1.524415, 0.1720677, 2.178512, 1, 0, 0.3647059, 1,
1.529695, 1.914582, 0.6121197, 1, 0, 0.3607843, 1,
1.539259, -0.1650633, 1.864887, 1, 0, 0.3529412, 1,
1.549734, -1.947394, 2.519084, 1, 0, 0.3490196, 1,
1.54979, -1.677923, 2.811589, 1, 0, 0.3411765, 1,
1.552229, 0.5193945, 1.536678, 1, 0, 0.3372549, 1,
1.554258, 0.7221425, 0.9887829, 1, 0, 0.3294118, 1,
1.570473, 1.09532, 1.848688, 1, 0, 0.3254902, 1,
1.612268, 1.356192, -0.1037518, 1, 0, 0.3176471, 1,
1.61363, -0.4759016, 3.041896, 1, 0, 0.3137255, 1,
1.621477, -0.5112461, 2.481606, 1, 0, 0.3058824, 1,
1.640024, 0.9354549, 1.250047, 1, 0, 0.2980392, 1,
1.682925, -0.03903917, 1.087332, 1, 0, 0.2941177, 1,
1.688464, 0.4031118, 0.7628037, 1, 0, 0.2862745, 1,
1.700065, -0.0549317, 1.217735, 1, 0, 0.282353, 1,
1.715608, 1.532853, 0.806734, 1, 0, 0.2745098, 1,
1.718214, 0.5945074, 0.3806681, 1, 0, 0.2705882, 1,
1.722131, -0.9358003, 2.877361, 1, 0, 0.2627451, 1,
1.757919, -0.7295939, 1.91959, 1, 0, 0.2588235, 1,
1.776889, 0.03724542, 0.7840823, 1, 0, 0.2509804, 1,
1.798397, 1.251652, 0.6348929, 1, 0, 0.2470588, 1,
1.814467, -1.080149, 1.637333, 1, 0, 0.2392157, 1,
1.817848, 2.384456, -1.206122, 1, 0, 0.2352941, 1,
1.834282, -0.5403436, 2.999651, 1, 0, 0.227451, 1,
1.850296, -0.06036194, 0.6107317, 1, 0, 0.2235294, 1,
1.851685, -1.335482, 1.733993, 1, 0, 0.2156863, 1,
1.867081, 0.4221377, 0.149798, 1, 0, 0.2117647, 1,
1.877241, 0.4146624, 1.258103, 1, 0, 0.2039216, 1,
1.883056, -0.1880291, 0.4940229, 1, 0, 0.1960784, 1,
1.909026, 1.017011, 0.1798061, 1, 0, 0.1921569, 1,
1.955111, -0.2859194, 2.69878, 1, 0, 0.1843137, 1,
1.96043, -1.027072, 1.307559, 1, 0, 0.1803922, 1,
1.970812, 1.429552, -0.580085, 1, 0, 0.172549, 1,
1.974478, -0.3097879, 2.600065, 1, 0, 0.1686275, 1,
1.986063, 0.6146721, 0.9916003, 1, 0, 0.1607843, 1,
1.99365, 1.523433, 1.868063, 1, 0, 0.1568628, 1,
2.081515, 0.3288053, 0.02811084, 1, 0, 0.1490196, 1,
2.096287, -0.9085202, 0.1515852, 1, 0, 0.145098, 1,
2.122497, 1.359694, 0.6506389, 1, 0, 0.1372549, 1,
2.1245, 1.312874, 1.379, 1, 0, 0.1333333, 1,
2.166553, 1.544559, 0.2402008, 1, 0, 0.1254902, 1,
2.168836, -1.198442, 0.4000189, 1, 0, 0.1215686, 1,
2.188702, 0.5486673, 1.396764, 1, 0, 0.1137255, 1,
2.26194, -0.4079449, 2.615463, 1, 0, 0.1098039, 1,
2.289626, 0.7988042, 2.935382, 1, 0, 0.1019608, 1,
2.298552, -1.141422, 3.081309, 1, 0, 0.09411765, 1,
2.359885, 1.154376, 2.141012, 1, 0, 0.09019608, 1,
2.391527, 1.510312, 0.7091305, 1, 0, 0.08235294, 1,
2.403249, 1.746789, 1.982886, 1, 0, 0.07843138, 1,
2.423931, -2.172374, 2.829615, 1, 0, 0.07058824, 1,
2.451357, 0.389333, 0.5784637, 1, 0, 0.06666667, 1,
2.519912, 2.058942, 1.651576, 1, 0, 0.05882353, 1,
2.57848, -2.161496, 0.9630578, 1, 0, 0.05490196, 1,
2.614062, 0.1163209, 1.221646, 1, 0, 0.04705882, 1,
2.693831, -1.265836, 2.881146, 1, 0, 0.04313726, 1,
2.747223, 1.339515, 1.98696, 1, 0, 0.03529412, 1,
3.02579, 0.9511725, 1.179936, 1, 0, 0.03137255, 1,
3.170276, -0.201538, 1.877055, 1, 0, 0.02352941, 1,
3.327316, -0.8111701, 1.400767, 1, 0, 0.01960784, 1,
3.34467, -0.06909792, 1.707842, 1, 0, 0.01176471, 1,
3.534528, -0.6167282, -0.219977, 1, 0, 0.007843138, 1
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
-0.2707973, -3.742685, -6.911657, 0, -0.5, 0.5, 0.5,
-0.2707973, -3.742685, -6.911657, 1, -0.5, 0.5, 0.5,
-0.2707973, -3.742685, -6.911657, 1, 1.5, 0.5, 0.5,
-0.2707973, -3.742685, -6.911657, 0, 1.5, 0.5, 0.5
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
-5.366128, 0.1004633, -6.911657, 0, -0.5, 0.5, 0.5,
-5.366128, 0.1004633, -6.911657, 1, -0.5, 0.5, 0.5,
-5.366128, 0.1004633, -6.911657, 1, 1.5, 0.5, 0.5,
-5.366128, 0.1004633, -6.911657, 0, 1.5, 0.5, 0.5
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
-5.366128, -3.742685, 0.1028645, 0, -0.5, 0.5, 0.5,
-5.366128, -3.742685, 0.1028645, 1, -0.5, 0.5, 0.5,
-5.366128, -3.742685, 0.1028645, 1, 1.5, 0.5, 0.5,
-5.366128, -3.742685, 0.1028645, 0, 1.5, 0.5, 0.5
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
-4, -2.855804, -5.292922,
2, -2.855804, -5.292922,
-4, -2.855804, -5.292922,
-4, -3.003618, -5.562711,
-2, -2.855804, -5.292922,
-2, -3.003618, -5.562711,
0, -2.855804, -5.292922,
0, -3.003618, -5.562711,
2, -2.855804, -5.292922,
2, -3.003618, -5.562711
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
"-4",
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
-4, -3.299245, -6.102289, 0, -0.5, 0.5, 0.5,
-4, -3.299245, -6.102289, 1, -0.5, 0.5, 0.5,
-4, -3.299245, -6.102289, 1, 1.5, 0.5, 0.5,
-4, -3.299245, -6.102289, 0, 1.5, 0.5, 0.5,
-2, -3.299245, -6.102289, 0, -0.5, 0.5, 0.5,
-2, -3.299245, -6.102289, 1, -0.5, 0.5, 0.5,
-2, -3.299245, -6.102289, 1, 1.5, 0.5, 0.5,
-2, -3.299245, -6.102289, 0, 1.5, 0.5, 0.5,
0, -3.299245, -6.102289, 0, -0.5, 0.5, 0.5,
0, -3.299245, -6.102289, 1, -0.5, 0.5, 0.5,
0, -3.299245, -6.102289, 1, 1.5, 0.5, 0.5,
0, -3.299245, -6.102289, 0, 1.5, 0.5, 0.5,
2, -3.299245, -6.102289, 0, -0.5, 0.5, 0.5,
2, -3.299245, -6.102289, 1, -0.5, 0.5, 0.5,
2, -3.299245, -6.102289, 1, 1.5, 0.5, 0.5,
2, -3.299245, -6.102289, 0, 1.5, 0.5, 0.5
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
-4.190282, -2, -5.292922,
-4.190282, 2, -5.292922,
-4.190282, -2, -5.292922,
-4.386257, -2, -5.562711,
-4.190282, -1, -5.292922,
-4.386257, -1, -5.562711,
-4.190282, 0, -5.292922,
-4.386257, 0, -5.562711,
-4.190282, 1, -5.292922,
-4.386257, 1, -5.562711,
-4.190282, 2, -5.292922,
-4.386257, 2, -5.562711
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
-4.778205, -2, -6.102289, 0, -0.5, 0.5, 0.5,
-4.778205, -2, -6.102289, 1, -0.5, 0.5, 0.5,
-4.778205, -2, -6.102289, 1, 1.5, 0.5, 0.5,
-4.778205, -2, -6.102289, 0, 1.5, 0.5, 0.5,
-4.778205, -1, -6.102289, 0, -0.5, 0.5, 0.5,
-4.778205, -1, -6.102289, 1, -0.5, 0.5, 0.5,
-4.778205, -1, -6.102289, 1, 1.5, 0.5, 0.5,
-4.778205, -1, -6.102289, 0, 1.5, 0.5, 0.5,
-4.778205, 0, -6.102289, 0, -0.5, 0.5, 0.5,
-4.778205, 0, -6.102289, 1, -0.5, 0.5, 0.5,
-4.778205, 0, -6.102289, 1, 1.5, 0.5, 0.5,
-4.778205, 0, -6.102289, 0, 1.5, 0.5, 0.5,
-4.778205, 1, -6.102289, 0, -0.5, 0.5, 0.5,
-4.778205, 1, -6.102289, 1, -0.5, 0.5, 0.5,
-4.778205, 1, -6.102289, 1, 1.5, 0.5, 0.5,
-4.778205, 1, -6.102289, 0, 1.5, 0.5, 0.5,
-4.778205, 2, -6.102289, 0, -0.5, 0.5, 0.5,
-4.778205, 2, -6.102289, 1, -0.5, 0.5, 0.5,
-4.778205, 2, -6.102289, 1, 1.5, 0.5, 0.5,
-4.778205, 2, -6.102289, 0, 1.5, 0.5, 0.5
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
-4.190282, -2.855804, -4,
-4.190282, -2.855804, 4,
-4.190282, -2.855804, -4,
-4.386257, -3.003618, -4,
-4.190282, -2.855804, -2,
-4.386257, -3.003618, -2,
-4.190282, -2.855804, 0,
-4.386257, -3.003618, 0,
-4.190282, -2.855804, 2,
-4.386257, -3.003618, 2,
-4.190282, -2.855804, 4,
-4.386257, -3.003618, 4
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
-4.778205, -3.299245, -4, 0, -0.5, 0.5, 0.5,
-4.778205, -3.299245, -4, 1, -0.5, 0.5, 0.5,
-4.778205, -3.299245, -4, 1, 1.5, 0.5, 0.5,
-4.778205, -3.299245, -4, 0, 1.5, 0.5, 0.5,
-4.778205, -3.299245, -2, 0, -0.5, 0.5, 0.5,
-4.778205, -3.299245, -2, 1, -0.5, 0.5, 0.5,
-4.778205, -3.299245, -2, 1, 1.5, 0.5, 0.5,
-4.778205, -3.299245, -2, 0, 1.5, 0.5, 0.5,
-4.778205, -3.299245, 0, 0, -0.5, 0.5, 0.5,
-4.778205, -3.299245, 0, 1, -0.5, 0.5, 0.5,
-4.778205, -3.299245, 0, 1, 1.5, 0.5, 0.5,
-4.778205, -3.299245, 0, 0, 1.5, 0.5, 0.5,
-4.778205, -3.299245, 2, 0, -0.5, 0.5, 0.5,
-4.778205, -3.299245, 2, 1, -0.5, 0.5, 0.5,
-4.778205, -3.299245, 2, 1, 1.5, 0.5, 0.5,
-4.778205, -3.299245, 2, 0, 1.5, 0.5, 0.5,
-4.778205, -3.299245, 4, 0, -0.5, 0.5, 0.5,
-4.778205, -3.299245, 4, 1, -0.5, 0.5, 0.5,
-4.778205, -3.299245, 4, 1, 1.5, 0.5, 0.5,
-4.778205, -3.299245, 4, 0, 1.5, 0.5, 0.5
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
-4.190282, -2.855804, -5.292922,
-4.190282, 3.056731, -5.292922,
-4.190282, -2.855804, 5.498651,
-4.190282, 3.056731, 5.498651,
-4.190282, -2.855804, -5.292922,
-4.190282, -2.855804, 5.498651,
-4.190282, 3.056731, -5.292922,
-4.190282, 3.056731, 5.498651,
-4.190282, -2.855804, -5.292922,
3.648688, -2.855804, -5.292922,
-4.190282, -2.855804, 5.498651,
3.648688, -2.855804, 5.498651,
-4.190282, 3.056731, -5.292922,
3.648688, 3.056731, -5.292922,
-4.190282, 3.056731, 5.498651,
3.648688, 3.056731, 5.498651,
3.648688, -2.855804, -5.292922,
3.648688, 3.056731, -5.292922,
3.648688, -2.855804, 5.498651,
3.648688, 3.056731, 5.498651,
3.648688, -2.855804, -5.292922,
3.648688, -2.855804, 5.498651,
3.648688, 3.056731, -5.292922,
3.648688, 3.056731, 5.498651
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
var radius = 7.79073;
var distance = 34.66184;
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
mvMatrix.translate( 0.2707973, -0.1004633, -0.1028645 );
mvMatrix.scale( 1.074566, 1.424683, 0.7805619 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.66184);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
lactofen<-read.table("lactofen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-lactofen$V2
```

```
## Error in eval(expr, envir, enclos): object 'lactofen' not found
```

```r
y<-lactofen$V3
```

```
## Error in eval(expr, envir, enclos): object 'lactofen' not found
```

```r
z<-lactofen$V4
```

```
## Error in eval(expr, envir, enclos): object 'lactofen' not found
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
-4.076123, -0.6933864, -1.438588, 0, 0, 1, 1, 1,
-3.280193, 1.448412, -0.9369283, 1, 0, 0, 1, 1,
-3.157391, 0.5645954, -1.287139, 1, 0, 0, 1, 1,
-3.052782, 1.088951, -1.508203, 1, 0, 0, 1, 1,
-3.022132, -1.470923, -4.433671, 1, 0, 0, 1, 1,
-2.745314, 0.3952297, 0.02206914, 1, 0, 0, 1, 1,
-2.726363, 0.3507088, -1.226187, 0, 0, 0, 1, 1,
-2.612654, -1.454047, -3.662762, 0, 0, 0, 1, 1,
-2.558518, 0.5524222, -1.467771, 0, 0, 0, 1, 1,
-2.51777, -0.8922853, -3.910952, 0, 0, 0, 1, 1,
-2.389282, -0.3558099, -2.672183, 0, 0, 0, 1, 1,
-2.376422, -0.4149552, -0.9005457, 0, 0, 0, 1, 1,
-2.320045, -1.550221, -0.7385415, 0, 0, 0, 1, 1,
-2.311779, 0.9129068, -0.5651005, 1, 1, 1, 1, 1,
-2.265014, 1.070742, -2.14673, 1, 1, 1, 1, 1,
-2.214591, 1.273209, 0.03704103, 1, 1, 1, 1, 1,
-2.125429, 0.01221299, -2.958515, 1, 1, 1, 1, 1,
-2.111214, 0.3492029, -1.160642, 1, 1, 1, 1, 1,
-2.105544, -1.317249, -0.5257207, 1, 1, 1, 1, 1,
-2.07302, -2.606839, -3.292872, 1, 1, 1, 1, 1,
-2.022091, 1.687035, -0.260097, 1, 1, 1, 1, 1,
-2.005382, 0.1544953, -2.042475, 1, 1, 1, 1, 1,
-1.96153, -0.493855, -1.430903, 1, 1, 1, 1, 1,
-1.927488, 0.8429083, -0.554288, 1, 1, 1, 1, 1,
-1.920667, -0.2053629, -1.336694, 1, 1, 1, 1, 1,
-1.864594, -0.5265661, -0.4214691, 1, 1, 1, 1, 1,
-1.86095, 0.1697736, -1.664923, 1, 1, 1, 1, 1,
-1.856663, -0.4682171, -1.638728, 1, 1, 1, 1, 1,
-1.856204, -0.2434874, -1.839519, 0, 0, 1, 1, 1,
-1.82969, -0.161785, -0.3509765, 1, 0, 0, 1, 1,
-1.827127, 0.5217324, -1.987234, 1, 0, 0, 1, 1,
-1.826763, 0.4528606, -1.551618, 1, 0, 0, 1, 1,
-1.813951, 0.9961113, -2.266171, 1, 0, 0, 1, 1,
-1.805908, -0.9441724, -1.748889, 1, 0, 0, 1, 1,
-1.796847, -0.8217204, -2.984081, 0, 0, 0, 1, 1,
-1.788832, -1.542043, -3.018278, 0, 0, 0, 1, 1,
-1.77893, -0.07711584, -1.071413, 0, 0, 0, 1, 1,
-1.775246, 0.05057769, -2.669285, 0, 0, 0, 1, 1,
-1.765204, -0.08889165, -0.973516, 0, 0, 0, 1, 1,
-1.762469, -0.2556968, -3.01895, 0, 0, 0, 1, 1,
-1.761761, -2.026343, -1.65267, 0, 0, 0, 1, 1,
-1.756449, 0.04595644, -2.322078, 1, 1, 1, 1, 1,
-1.733221, -0.747737, -3.274068, 1, 1, 1, 1, 1,
-1.732541, 0.6666786, -1.770445, 1, 1, 1, 1, 1,
-1.723172, -0.2775077, 0.208277, 1, 1, 1, 1, 1,
-1.704489, 0.3827533, -2.272775, 1, 1, 1, 1, 1,
-1.670745, -0.2521603, -1.788117, 1, 1, 1, 1, 1,
-1.642973, 2.513904, -1.65923, 1, 1, 1, 1, 1,
-1.640622, 0.2910897, 0.2828372, 1, 1, 1, 1, 1,
-1.636592, -0.8395485, -1.621246, 1, 1, 1, 1, 1,
-1.629596, 0.1145707, -2.474343, 1, 1, 1, 1, 1,
-1.611382, 0.6057812, -1.773136, 1, 1, 1, 1, 1,
-1.607525, -1.280647, -1.367451, 1, 1, 1, 1, 1,
-1.598171, -0.01111578, -2.499598, 1, 1, 1, 1, 1,
-1.597924, -1.027547, -2.084278, 1, 1, 1, 1, 1,
-1.577912, 0.2419123, -3.038873, 1, 1, 1, 1, 1,
-1.572115, -0.5142096, -1.461903, 0, 0, 1, 1, 1,
-1.570239, -1.344768, -3.951218, 1, 0, 0, 1, 1,
-1.560691, -1.746999, -2.298056, 1, 0, 0, 1, 1,
-1.56006, 0.7111245, 0.2526906, 1, 0, 0, 1, 1,
-1.545096, -1.068648, -1.654531, 1, 0, 0, 1, 1,
-1.542704, 0.6926425, -1.788652, 1, 0, 0, 1, 1,
-1.538225, -1.590133, -0.3100118, 0, 0, 0, 1, 1,
-1.533708, -0.5191108, -1.502646, 0, 0, 0, 1, 1,
-1.532256, -1.992744, -0.9704282, 0, 0, 0, 1, 1,
-1.527665, 1.020384, -0.301459, 0, 0, 0, 1, 1,
-1.526176, 0.6637097, -1.002678, 0, 0, 0, 1, 1,
-1.518279, -0.1607871, -1.091331, 0, 0, 0, 1, 1,
-1.51752, 0.4846451, -2.472691, 0, 0, 0, 1, 1,
-1.504043, -0.7524091, -0.7992905, 1, 1, 1, 1, 1,
-1.487815, 2.713782, -1.337063, 1, 1, 1, 1, 1,
-1.485659, 0.1297887, -0.8730555, 1, 1, 1, 1, 1,
-1.483132, 0.2324819, -0.4783798, 1, 1, 1, 1, 1,
-1.483129, -0.09287235, -1.121555, 1, 1, 1, 1, 1,
-1.477049, -0.6935567, -2.815384, 1, 1, 1, 1, 1,
-1.459847, -0.01775232, -1.130233, 1, 1, 1, 1, 1,
-1.442748, 0.3235729, -1.448003, 1, 1, 1, 1, 1,
-1.437408, 0.6589994, -0.6847164, 1, 1, 1, 1, 1,
-1.434219, 1.328402, 0.6028616, 1, 1, 1, 1, 1,
-1.412956, 0.1704478, 0.187576, 1, 1, 1, 1, 1,
-1.405055, 1.006709, 1.297567, 1, 1, 1, 1, 1,
-1.400523, 1.64807, -1.716749, 1, 1, 1, 1, 1,
-1.399781, -0.6804846, -3.650952, 1, 1, 1, 1, 1,
-1.395264, -1.508263, -4.41423, 1, 1, 1, 1, 1,
-1.388435, 0.1216711, -1.384676, 0, 0, 1, 1, 1,
-1.38276, -0.9181895, -1.832587, 1, 0, 0, 1, 1,
-1.381377, -1.295046, -4.270545, 1, 0, 0, 1, 1,
-1.378044, 0.02039293, -1.247314, 1, 0, 0, 1, 1,
-1.364869, -0.6572217, -2.48557, 1, 0, 0, 1, 1,
-1.359938, 0.1072166, -0.1188681, 1, 0, 0, 1, 1,
-1.35987, -0.6686313, -1.797409, 0, 0, 0, 1, 1,
-1.357512, -0.2127972, -1.735903, 0, 0, 0, 1, 1,
-1.357071, -0.222589, -0.5758352, 0, 0, 0, 1, 1,
-1.34805, -1.249899, -3.935311, 0, 0, 0, 1, 1,
-1.345078, -0.03713841, -0.9200482, 0, 0, 0, 1, 1,
-1.321742, -1.815121, -2.853602, 0, 0, 0, 1, 1,
-1.321228, -1.795675, -1.012184, 0, 0, 0, 1, 1,
-1.297477, -0.3638711, -2.694653, 1, 1, 1, 1, 1,
-1.28537, -0.2345753, -0.999886, 1, 1, 1, 1, 1,
-1.282976, -0.3003018, -1.909855, 1, 1, 1, 1, 1,
-1.281767, -0.2090189, -1.081588, 1, 1, 1, 1, 1,
-1.271144, 0.3562889, -2.100343, 1, 1, 1, 1, 1,
-1.266827, 0.6145453, -0.8602358, 1, 1, 1, 1, 1,
-1.265178, 1.151105, -1.167195, 1, 1, 1, 1, 1,
-1.254766, 0.07941998, -2.39974, 1, 1, 1, 1, 1,
-1.241351, -2.27554, -3.491687, 1, 1, 1, 1, 1,
-1.229349, -0.2709435, -0.0567917, 1, 1, 1, 1, 1,
-1.229193, 0.6371544, -2.434438, 1, 1, 1, 1, 1,
-1.228914, 0.4517212, 1.634035, 1, 1, 1, 1, 1,
-1.227391, 0.687794, 0.2707752, 1, 1, 1, 1, 1,
-1.216338, 0.3791255, 0.3875065, 1, 1, 1, 1, 1,
-1.213779, 1.007444, -2.164593, 1, 1, 1, 1, 1,
-1.200653, -0.5700027, -1.182409, 0, 0, 1, 1, 1,
-1.192322, 0.9977915, -0.5334582, 1, 0, 0, 1, 1,
-1.184777, -0.0642589, -3.470156, 1, 0, 0, 1, 1,
-1.178082, -0.2593785, -1.771851, 1, 0, 0, 1, 1,
-1.173531, 1.25769, -0.4366225, 1, 0, 0, 1, 1,
-1.172364, 1.844696, -1.497048, 1, 0, 0, 1, 1,
-1.159714, -0.9604691, -2.081333, 0, 0, 0, 1, 1,
-1.159317, -2.186507, -1.400354, 0, 0, 0, 1, 1,
-1.155131, 0.2530224, -0.7950217, 0, 0, 0, 1, 1,
-1.152683, -1.696625, -3.197077, 0, 0, 0, 1, 1,
-1.14752, -0.1867266, -1.083618, 0, 0, 0, 1, 1,
-1.13786, -0.09141992, -0.9287081, 0, 0, 0, 1, 1,
-1.136009, 0.1614938, -1.271927, 0, 0, 0, 1, 1,
-1.119673, 0.9678255, -1.711443, 1, 1, 1, 1, 1,
-1.108711, -0.4714298, -2.717764, 1, 1, 1, 1, 1,
-1.107078, -1.109528, -3.70704, 1, 1, 1, 1, 1,
-1.099201, -1.007393, 0.4350975, 1, 1, 1, 1, 1,
-1.09884, -0.450352, -2.094624, 1, 1, 1, 1, 1,
-1.094666, -0.2641276, -2.079183, 1, 1, 1, 1, 1,
-1.094225, -0.2997892, -1.43573, 1, 1, 1, 1, 1,
-1.094199, -0.434346, -3.299833, 1, 1, 1, 1, 1,
-1.093216, 1.362987, -1.070686, 1, 1, 1, 1, 1,
-1.093091, 1.068575, 0.4093926, 1, 1, 1, 1, 1,
-1.084508, 0.2555394, -2.443978, 1, 1, 1, 1, 1,
-1.073746, -0.7591847, -2.668041, 1, 1, 1, 1, 1,
-1.061578, 0.146989, -2.826308, 1, 1, 1, 1, 1,
-1.059412, -2.275111, -0.8706885, 1, 1, 1, 1, 1,
-1.054466, 0.0488532, -2.693466, 1, 1, 1, 1, 1,
-1.052784, 0.8239117, 0.5464979, 0, 0, 1, 1, 1,
-1.052448, -1.565894, -2.317722, 1, 0, 0, 1, 1,
-1.02874, 1.91387, -0.6483251, 1, 0, 0, 1, 1,
-1.026493, 0.2561261, -1.972976, 1, 0, 0, 1, 1,
-1.025963, -0.4448822, -1.607429, 1, 0, 0, 1, 1,
-1.025891, -2.310641, -3.968513, 1, 0, 0, 1, 1,
-1.018716, 0.4400077, -0.9577914, 0, 0, 0, 1, 1,
-1.014351, -0.4318837, -1.198939, 0, 0, 0, 1, 1,
-1.011868, 1.692927, -0.5098329, 0, 0, 0, 1, 1,
-1.009597, 0.02988366, -3.727256, 0, 0, 0, 1, 1,
-1.006025, 0.6437033, -1.403901, 0, 0, 0, 1, 1,
-1.003738, 0.539886, -2.192673, 0, 0, 0, 1, 1,
-1.001005, 1.450584, -0.9525472, 0, 0, 0, 1, 1,
-0.9989384, -1.552459, -2.321052, 1, 1, 1, 1, 1,
-0.9744472, -0.7555809, -2.546887, 1, 1, 1, 1, 1,
-0.9675499, 0.9596696, 0.2641048, 1, 1, 1, 1, 1,
-0.9612386, -0.02076285, -0.9956183, 1, 1, 1, 1, 1,
-0.9546954, 1.247998, -1.826531, 1, 1, 1, 1, 1,
-0.953932, 0.0760024, -0.9911932, 1, 1, 1, 1, 1,
-0.951211, -0.1757366, -0.4593739, 1, 1, 1, 1, 1,
-0.9491318, -0.8888198, -2.781024, 1, 1, 1, 1, 1,
-0.942281, -0.8106177, -1.742424, 1, 1, 1, 1, 1,
-0.9410654, -2.185162, -3.037611, 1, 1, 1, 1, 1,
-0.9383749, 0.1580602, -1.096046, 1, 1, 1, 1, 1,
-0.9351746, -0.184672, -2.669331, 1, 1, 1, 1, 1,
-0.9336313, 0.2592058, -1.066807, 1, 1, 1, 1, 1,
-0.9319796, 1.389759, -0.3538074, 1, 1, 1, 1, 1,
-0.9317918, -0.4927417, -1.882412, 1, 1, 1, 1, 1,
-0.9268677, -0.5548648, -3.8456, 0, 0, 1, 1, 1,
-0.9257103, 0.2520277, -2.58778, 1, 0, 0, 1, 1,
-0.9250473, -0.08983366, -0.06335041, 1, 0, 0, 1, 1,
-0.9203072, -0.4079599, -1.291116, 1, 0, 0, 1, 1,
-0.9195912, -0.5948757, -3.131527, 1, 0, 0, 1, 1,
-0.9107209, -0.04527092, -1.699712, 1, 0, 0, 1, 1,
-0.9103908, 0.3241061, -1.223137, 0, 0, 0, 1, 1,
-0.9070457, -1.302538, -1.691221, 0, 0, 0, 1, 1,
-0.8964031, 0.8578897, 0.8755719, 0, 0, 0, 1, 1,
-0.8962342, 1.578074, 0.171393, 0, 0, 0, 1, 1,
-0.893373, -1.091249, -2.902281, 0, 0, 0, 1, 1,
-0.8913728, 1.166159, 0.2815131, 0, 0, 0, 1, 1,
-0.8911142, -1.390443, -2.809089, 0, 0, 0, 1, 1,
-0.8889545, 1.051639, -2.482023, 1, 1, 1, 1, 1,
-0.8883808, 1.415209, -0.2891613, 1, 1, 1, 1, 1,
-0.8847299, -0.7533279, -2.142219, 1, 1, 1, 1, 1,
-0.8838429, -2.737473, -2.033355, 1, 1, 1, 1, 1,
-0.8817842, -0.9095321, -3.629225, 1, 1, 1, 1, 1,
-0.8766594, -0.05211956, -0.7531947, 1, 1, 1, 1, 1,
-0.8755876, 0.09339855, -1.172481, 1, 1, 1, 1, 1,
-0.8730508, 1.463276, -0.4086701, 1, 1, 1, 1, 1,
-0.8725176, 0.07713811, 0.2331707, 1, 1, 1, 1, 1,
-0.8709116, -1.585997, -2.07323, 1, 1, 1, 1, 1,
-0.8681277, 1.49486, -0.5761152, 1, 1, 1, 1, 1,
-0.866549, 1.594613, 0.02548141, 1, 1, 1, 1, 1,
-0.8655593, 0.9444612, -1.629907, 1, 1, 1, 1, 1,
-0.8620608, 1.369268, -2.157221, 1, 1, 1, 1, 1,
-0.8531216, 0.4246873, -1.67197, 1, 1, 1, 1, 1,
-0.8446915, -1.486105, -1.924583, 0, 0, 1, 1, 1,
-0.8359948, 0.2366824, -0.9496332, 1, 0, 0, 1, 1,
-0.8331419, -0.4907747, -2.6164, 1, 0, 0, 1, 1,
-0.83276, 1.153399, -0.3130004, 1, 0, 0, 1, 1,
-0.8313023, 0.7917016, 0.8317186, 1, 0, 0, 1, 1,
-0.8291472, 0.7955716, -1.730812, 1, 0, 0, 1, 1,
-0.8281556, -1.412159, -2.943106, 0, 0, 0, 1, 1,
-0.8263912, -1.458476, -2.209004, 0, 0, 0, 1, 1,
-0.8196724, 0.9281611, -2.20359, 0, 0, 0, 1, 1,
-0.8164013, 0.1188107, -2.519339, 0, 0, 0, 1, 1,
-0.8114694, -1.694699, -2.554874, 0, 0, 0, 1, 1,
-0.8086625, 0.9892817, -0.1752559, 0, 0, 0, 1, 1,
-0.8067468, 0.5212398, -0.6452818, 0, 0, 0, 1, 1,
-0.7929966, -0.4503548, -3.238055, 1, 1, 1, 1, 1,
-0.7835413, -0.7516599, -1.660723, 1, 1, 1, 1, 1,
-0.7822229, 0.9813368, -0.364047, 1, 1, 1, 1, 1,
-0.7822093, 0.5282219, -3.203434, 1, 1, 1, 1, 1,
-0.7734537, -1.103158, -2.122622, 1, 1, 1, 1, 1,
-0.7689289, 1.684823, -1.592637, 1, 1, 1, 1, 1,
-0.7663406, -2.4848, -3.294864, 1, 1, 1, 1, 1,
-0.7658558, -0.2915736, -1.770814, 1, 1, 1, 1, 1,
-0.7576368, -0.1985663, -3.008391, 1, 1, 1, 1, 1,
-0.7566943, 0.1600919, -0.3186021, 1, 1, 1, 1, 1,
-0.753656, -1.482047, -3.319654, 1, 1, 1, 1, 1,
-0.7519033, 0.7781037, -0.6623847, 1, 1, 1, 1, 1,
-0.7370859, -0.1978686, -2.681631, 1, 1, 1, 1, 1,
-0.7363814, -0.2881222, -2.642318, 1, 1, 1, 1, 1,
-0.7347007, 0.1596271, -1.263139, 1, 1, 1, 1, 1,
-0.7322627, 1.021926, 0.1941629, 0, 0, 1, 1, 1,
-0.7319653, 0.6153713, -1.156739, 1, 0, 0, 1, 1,
-0.7296466, -0.1267292, -0.7655065, 1, 0, 0, 1, 1,
-0.7255182, 1.714051, -0.1760813, 1, 0, 0, 1, 1,
-0.7136681, 0.4672832, -2.094952, 1, 0, 0, 1, 1,
-0.71247, -0.6286327, -0.1712611, 1, 0, 0, 1, 1,
-0.7087836, -1.607121, -1.450406, 0, 0, 0, 1, 1,
-0.704024, -0.5836029, -2.216657, 0, 0, 0, 1, 1,
-0.7037691, 0.7808115, 1.336262, 0, 0, 0, 1, 1,
-0.700622, -0.7717854, -2.348358, 0, 0, 0, 1, 1,
-0.6938938, 0.2770505, -2.170154, 0, 0, 0, 1, 1,
-0.6932426, -1.944186, -1.476293, 0, 0, 0, 1, 1,
-0.690689, -0.9326053, -1.452754, 0, 0, 0, 1, 1,
-0.6877866, -0.09263869, -1.638382, 1, 1, 1, 1, 1,
-0.6831086, 0.6951425, -2.877351, 1, 1, 1, 1, 1,
-0.6751334, -0.5203508, -0.7648331, 1, 1, 1, 1, 1,
-0.6687527, 1.798426, -0.3452333, 1, 1, 1, 1, 1,
-0.6685976, 0.4232224, -1.599346, 1, 1, 1, 1, 1,
-0.6650639, -0.4539095, -1.448987, 1, 1, 1, 1, 1,
-0.6648949, 0.1699038, -1.215485, 1, 1, 1, 1, 1,
-0.6590095, -0.2409118, -2.15805, 1, 1, 1, 1, 1,
-0.6502589, 0.5952984, -1.779419, 1, 1, 1, 1, 1,
-0.6408742, 0.02070996, -1.916573, 1, 1, 1, 1, 1,
-0.6399797, 0.6532793, -0.1671405, 1, 1, 1, 1, 1,
-0.6357958, -0.01579418, -1.654888, 1, 1, 1, 1, 1,
-0.6342729, 0.3765327, -1.351283, 1, 1, 1, 1, 1,
-0.6333024, -1.330645, -3.023704, 1, 1, 1, 1, 1,
-0.6329022, 1.430903, -0.007866325, 1, 1, 1, 1, 1,
-0.6241199, 0.9710917, -1.310516, 0, 0, 1, 1, 1,
-0.6208281, 0.8322025, -0.1738391, 1, 0, 0, 1, 1,
-0.6204999, 0.09903453, -2.00925, 1, 0, 0, 1, 1,
-0.618427, -1.316888, -2.696553, 1, 0, 0, 1, 1,
-0.6162266, 0.5250952, -1.66086, 1, 0, 0, 1, 1,
-0.6140362, 1.236533, 0.3819342, 1, 0, 0, 1, 1,
-0.6000038, -0.8503594, -2.122474, 0, 0, 0, 1, 1,
-0.5999525, 0.6769384, -0.1623868, 0, 0, 0, 1, 1,
-0.5994254, 0.6684812, -1.225028, 0, 0, 0, 1, 1,
-0.5981261, -0.1626064, -1.496014, 0, 0, 0, 1, 1,
-0.59183, -0.1847495, -4.289526, 0, 0, 0, 1, 1,
-0.5880287, 1.191119, -0.04345867, 0, 0, 0, 1, 1,
-0.583351, -0.4033895, -3.549159, 0, 0, 0, 1, 1,
-0.5789315, -1.249592, -2.645969, 1, 1, 1, 1, 1,
-0.5782887, -0.2582708, -1.698943, 1, 1, 1, 1, 1,
-0.5775272, -1.245416, -3.636026, 1, 1, 1, 1, 1,
-0.5760661, 0.4965945, -1.422995, 1, 1, 1, 1, 1,
-0.5734757, 0.7838819, -0.480147, 1, 1, 1, 1, 1,
-0.5690333, 0.9594913, -0.1006814, 1, 1, 1, 1, 1,
-0.5662636, -0.771973, -1.912346, 1, 1, 1, 1, 1,
-0.5657018, -0.8440248, -1.426301, 1, 1, 1, 1, 1,
-0.5648374, -0.6652867, -2.843045, 1, 1, 1, 1, 1,
-0.5620422, 1.196159, -1.529385, 1, 1, 1, 1, 1,
-0.5597898, -1.032554, -5.135763, 1, 1, 1, 1, 1,
-0.5569572, -0.7424148, -2.89945, 1, 1, 1, 1, 1,
-0.5549521, -0.7118306, -4.331842, 1, 1, 1, 1, 1,
-0.5546867, -0.3141293, -0.8354416, 1, 1, 1, 1, 1,
-0.554339, -0.400497, 1.489006, 1, 1, 1, 1, 1,
-0.5525219, 1.131101, -0.1233921, 0, 0, 1, 1, 1,
-0.5521193, 1.363552, -1.766181, 1, 0, 0, 1, 1,
-0.5459647, 0.7167749, 0.137853, 1, 0, 0, 1, 1,
-0.544118, 0.8782043, -1.063863, 1, 0, 0, 1, 1,
-0.5432094, -0.5568292, -1.194583, 1, 0, 0, 1, 1,
-0.5416976, -0.604341, -2.050336, 1, 0, 0, 1, 1,
-0.5400186, 0.5657898, -1.509722, 0, 0, 0, 1, 1,
-0.5393562, 1.193558, -0.150324, 0, 0, 0, 1, 1,
-0.5363075, -0.4519593, -3.422586, 0, 0, 0, 1, 1,
-0.5345266, 0.7295902, -1.991337, 0, 0, 0, 1, 1,
-0.5287833, -0.8814501, -4.413398, 0, 0, 0, 1, 1,
-0.5260142, -0.3979142, -2.653827, 0, 0, 0, 1, 1,
-0.5249296, 1.390368, 0.8044752, 0, 0, 0, 1, 1,
-0.5239339, 1.926768, -0.9251757, 1, 1, 1, 1, 1,
-0.5103694, -0.9832699, -4.863265, 1, 1, 1, 1, 1,
-0.5090791, 0.6303692, -0.9185637, 1, 1, 1, 1, 1,
-0.5063565, 0.009185356, -2.009836, 1, 1, 1, 1, 1,
-0.5062622, -1.137015, -1.690339, 1, 1, 1, 1, 1,
-0.502651, 0.6563944, 0.2618347, 1, 1, 1, 1, 1,
-0.494631, -0.8369946, -2.533254, 1, 1, 1, 1, 1,
-0.4874423, -0.3269428, -2.233299, 1, 1, 1, 1, 1,
-0.4857929, -0.01607854, -1.3394, 1, 1, 1, 1, 1,
-0.4805937, 0.4156418, -1.613251, 1, 1, 1, 1, 1,
-0.4787285, 0.1752424, -3.682783, 1, 1, 1, 1, 1,
-0.4713777, 0.3931691, 0.8491117, 1, 1, 1, 1, 1,
-0.4713066, 0.2442435, -2.437503, 1, 1, 1, 1, 1,
-0.4663017, 1.473614, -0.1896164, 1, 1, 1, 1, 1,
-0.4629636, 0.9417958, -0.4857867, 1, 1, 1, 1, 1,
-0.461315, 1.152435, -0.1630306, 0, 0, 1, 1, 1,
-0.459917, -1.366377, -4.041379, 1, 0, 0, 1, 1,
-0.4593917, -0.3259279, -1.077501, 1, 0, 0, 1, 1,
-0.4557875, 0.4666043, 0.9395106, 1, 0, 0, 1, 1,
-0.4543528, -0.5388209, -2.409549, 1, 0, 0, 1, 1,
-0.4543121, -0.3766765, -1.238252, 1, 0, 0, 1, 1,
-0.4535589, -1.519662, -2.276246, 0, 0, 0, 1, 1,
-0.4534182, 1.355792, 1.00507, 0, 0, 0, 1, 1,
-0.4521974, 2.970626, 1.078946, 0, 0, 0, 1, 1,
-0.4513865, 0.5707456, -1.396397, 0, 0, 0, 1, 1,
-0.4512854, -0.8559394, -2.831691, 0, 0, 0, 1, 1,
-0.448709, -2.051962, -3.632212, 0, 0, 0, 1, 1,
-0.4471413, -0.3795251, 0.1045877, 0, 0, 0, 1, 1,
-0.4448848, 1.38986, -2.452211, 1, 1, 1, 1, 1,
-0.4416081, 0.2129996, -0.2471346, 1, 1, 1, 1, 1,
-0.441382, -0.9013579, -2.050666, 1, 1, 1, 1, 1,
-0.4402195, 0.2641444, -0.800191, 1, 1, 1, 1, 1,
-0.4391436, -0.1636487, -2.73425, 1, 1, 1, 1, 1,
-0.4376796, -1.880893, -1.972393, 1, 1, 1, 1, 1,
-0.4374783, 0.3058768, -1.17212, 1, 1, 1, 1, 1,
-0.4349825, 1.991519, -1.379791, 1, 1, 1, 1, 1,
-0.4342487, -0.2655771, -0.2290598, 1, 1, 1, 1, 1,
-0.4325891, 0.7789312, -2.006889, 1, 1, 1, 1, 1,
-0.4282252, -0.5801845, -3.222234, 1, 1, 1, 1, 1,
-0.426237, -1.578393, -2.353562, 1, 1, 1, 1, 1,
-0.4246314, 0.7873157, -1.13358, 1, 1, 1, 1, 1,
-0.4203454, 0.1559433, -1.278886, 1, 1, 1, 1, 1,
-0.4146974, 0.3480993, -1.54442, 1, 1, 1, 1, 1,
-0.4138924, -1.071343, -2.432184, 0, 0, 1, 1, 1,
-0.4104945, -0.778622, -1.529775, 1, 0, 0, 1, 1,
-0.3984057, -0.4188741, -1.952793, 1, 0, 0, 1, 1,
-0.3981143, 1.39954, -1.398567, 1, 0, 0, 1, 1,
-0.3901243, 1.392136, 0.3086483, 1, 0, 0, 1, 1,
-0.3897977, 1.066922, 1.296323, 1, 0, 0, 1, 1,
-0.3896927, -0.0862027, -3.291863, 0, 0, 0, 1, 1,
-0.3885587, 0.9685525, 0.7428151, 0, 0, 0, 1, 1,
-0.3864556, 0.6889265, -1.117784, 0, 0, 0, 1, 1,
-0.3828737, -0.7195407, -0.7909481, 0, 0, 0, 1, 1,
-0.3793517, 1.094849, -1.382067, 0, 0, 0, 1, 1,
-0.3690759, 0.6820235, -1.332644, 0, 0, 0, 1, 1,
-0.3661387, -0.7113218, -1.794266, 0, 0, 0, 1, 1,
-0.3627201, 0.881249, -0.2955045, 1, 1, 1, 1, 1,
-0.3623375, 0.9960222, -0.2766486, 1, 1, 1, 1, 1,
-0.361275, 1.296719, 0.6300906, 1, 1, 1, 1, 1,
-0.3612232, 0.230735, -1.778701, 1, 1, 1, 1, 1,
-0.3535821, -0.6252629, -3.643219, 1, 1, 1, 1, 1,
-0.3532917, -0.729066, -3.445955, 1, 1, 1, 1, 1,
-0.3515499, 1.494621, -0.2970627, 1, 1, 1, 1, 1,
-0.3489058, 0.7827417, -0.6657186, 1, 1, 1, 1, 1,
-0.3482116, -1.560541, -3.948202, 1, 1, 1, 1, 1,
-0.3478327, -1.509236, -3.161038, 1, 1, 1, 1, 1,
-0.3474805, -1.264329, -2.758759, 1, 1, 1, 1, 1,
-0.3466302, 0.1041732, -2.122786, 1, 1, 1, 1, 1,
-0.3435991, -0.7706632, -1.991757, 1, 1, 1, 1, 1,
-0.3395343, 0.9921702, -0.2613912, 1, 1, 1, 1, 1,
-0.3394011, -0.1720901, -1.520129, 1, 1, 1, 1, 1,
-0.3349804, 1.941125, -0.06938883, 0, 0, 1, 1, 1,
-0.3335373, -0.2831386, -1.80432, 1, 0, 0, 1, 1,
-0.3310828, -0.9378738, -2.94521, 1, 0, 0, 1, 1,
-0.3259748, -1.000808, -3.00446, 1, 0, 0, 1, 1,
-0.3229369, 0.1793917, -0.9594344, 1, 0, 0, 1, 1,
-0.3227589, 2.733777, 1.511215, 1, 0, 0, 1, 1,
-0.3199793, 0.4940111, -0.6226018, 0, 0, 0, 1, 1,
-0.3155894, -1.058772, -3.569489, 0, 0, 0, 1, 1,
-0.3153194, 0.830677, -0.1679759, 0, 0, 0, 1, 1,
-0.3151769, 0.6723007, -0.3464784, 0, 0, 0, 1, 1,
-0.3127304, 0.5519704, -0.981527, 0, 0, 0, 1, 1,
-0.3126939, 2.866853, -0.2885691, 0, 0, 0, 1, 1,
-0.3077338, 0.04499887, -1.3138, 0, 0, 0, 1, 1,
-0.3003072, -0.4110557, -3.177192, 1, 1, 1, 1, 1,
-0.2998045, 0.2692257, -0.9383544, 1, 1, 1, 1, 1,
-0.297848, 0.1854805, -0.9736724, 1, 1, 1, 1, 1,
-0.2970405, 0.2122614, -1.504876, 1, 1, 1, 1, 1,
-0.2949478, -0.596487, -3.331322, 1, 1, 1, 1, 1,
-0.293678, 0.692498, -1.999727, 1, 1, 1, 1, 1,
-0.2908233, 0.9328184, -0.4307524, 1, 1, 1, 1, 1,
-0.2874275, -1.180845, -3.074398, 1, 1, 1, 1, 1,
-0.2847432, 0.7563922, -0.1090281, 1, 1, 1, 1, 1,
-0.2841209, -1.41738, -1.739284, 1, 1, 1, 1, 1,
-0.2790918, -2.323875, -4.708973, 1, 1, 1, 1, 1,
-0.2751517, 0.7696693, -0.7197121, 1, 1, 1, 1, 1,
-0.2744716, 0.06328984, -1.913644, 1, 1, 1, 1, 1,
-0.2723423, -0.6605098, -3.196845, 1, 1, 1, 1, 1,
-0.2702571, -0.2393041, -1.350837, 1, 1, 1, 1, 1,
-0.2700822, -1.421268, -2.577667, 0, 0, 1, 1, 1,
-0.2669817, -0.1304637, -3.041348, 1, 0, 0, 1, 1,
-0.2668175, -1.041856, -1.802411, 1, 0, 0, 1, 1,
-0.2665735, -0.9210932, -3.090012, 1, 0, 0, 1, 1,
-0.2647153, -0.3249077, -2.83933, 1, 0, 0, 1, 1,
-0.2620908, 0.2458633, -1.080736, 1, 0, 0, 1, 1,
-0.2609071, 0.05777074, -2.523212, 0, 0, 0, 1, 1,
-0.2563758, -0.7570078, -2.825655, 0, 0, 0, 1, 1,
-0.2530277, 0.3275858, 1.519332, 0, 0, 0, 1, 1,
-0.2364831, -0.1970477, -3.264986, 0, 0, 0, 1, 1,
-0.2302549, 1.646411, 1.40772, 0, 0, 0, 1, 1,
-0.2292732, -0.9832991, -3.696546, 0, 0, 0, 1, 1,
-0.2280226, 0.1291362, -1.987032, 0, 0, 0, 1, 1,
-0.226989, -2.508406, -2.796968, 1, 1, 1, 1, 1,
-0.2259862, -1.221411, -3.001307, 1, 1, 1, 1, 1,
-0.2258694, 0.1386443, -0.4578184, 1, 1, 1, 1, 1,
-0.2215909, 0.1987806, -1.270785, 1, 1, 1, 1, 1,
-0.2207786, -1.366148, -3.67995, 1, 1, 1, 1, 1,
-0.2177144, 2.810557, 0.2049339, 1, 1, 1, 1, 1,
-0.2162694, -0.0857501, -2.453628, 1, 1, 1, 1, 1,
-0.214303, 1.344662, 1.363939, 1, 1, 1, 1, 1,
-0.2094529, 2.042509, -1.108274, 1, 1, 1, 1, 1,
-0.2092738, 0.4423662, -1.386616, 1, 1, 1, 1, 1,
-0.2019338, 0.4927607, -0.05266455, 1, 1, 1, 1, 1,
-0.201661, -0.6100408, -3.183539, 1, 1, 1, 1, 1,
-0.2001409, 0.9351672, 0.8113832, 1, 1, 1, 1, 1,
-0.1956155, 0.3947006, -1.928854, 1, 1, 1, 1, 1,
-0.1950253, 0.6759373, -0.3823173, 1, 1, 1, 1, 1,
-0.1914635, 0.7319184, -1.378933, 0, 0, 1, 1, 1,
-0.1895758, 2.381656, -1.776349, 1, 0, 0, 1, 1,
-0.1880531, 0.4361167, 1.814716, 1, 0, 0, 1, 1,
-0.1880337, 0.4470358, -0.5501975, 1, 0, 0, 1, 1,
-0.1805435, -0.1846777, -1.346578, 1, 0, 0, 1, 1,
-0.1797268, 0.6852049, -0.600274, 1, 0, 0, 1, 1,
-0.1760851, 1.207803, -0.7004454, 0, 0, 0, 1, 1,
-0.1664443, -1.423032, -3.919106, 0, 0, 0, 1, 1,
-0.1644847, -0.2468832, -1.993532, 0, 0, 0, 1, 1,
-0.1632725, -2.319437, -4.483226, 0, 0, 0, 1, 1,
-0.154224, 0.03546052, -0.3612494, 0, 0, 0, 1, 1,
-0.1541464, -1.401086, -3.827934, 0, 0, 0, 1, 1,
-0.1527431, -1.144933, -3.095279, 0, 0, 0, 1, 1,
-0.1505099, 0.2453763, -0.1248842, 1, 1, 1, 1, 1,
-0.1431261, -1.182329, -4.323403, 1, 1, 1, 1, 1,
-0.1381285, 0.1786551, 0.4487486, 1, 1, 1, 1, 1,
-0.1360566, 0.5116869, -1.372127, 1, 1, 1, 1, 1,
-0.1340875, -0.3029928, -1.739018, 1, 1, 1, 1, 1,
-0.1285738, 1.031494, 0.8845403, 1, 1, 1, 1, 1,
-0.1254725, -0.4901436, -2.730779, 1, 1, 1, 1, 1,
-0.1246816, 0.9932564, -0.9575287, 1, 1, 1, 1, 1,
-0.1201727, 0.2938592, 1.879493, 1, 1, 1, 1, 1,
-0.1198757, 2.091479, -1.093626, 1, 1, 1, 1, 1,
-0.117121, -0.8166827, -3.280826, 1, 1, 1, 1, 1,
-0.1169962, -0.09621971, -2.902837, 1, 1, 1, 1, 1,
-0.1142711, -0.1064353, -0.7556905, 1, 1, 1, 1, 1,
-0.1094127, -0.2892559, -1.373681, 1, 1, 1, 1, 1,
-0.1093509, 0.8297273, 0.4704115, 1, 1, 1, 1, 1,
-0.09836932, 1.225148, -1.1711, 0, 0, 1, 1, 1,
-0.09548904, -0.7726819, -2.81835, 1, 0, 0, 1, 1,
-0.09520037, -2.069377, -2.387973, 1, 0, 0, 1, 1,
-0.09186835, 1.340654, -1.074497, 1, 0, 0, 1, 1,
-0.09146818, 1.417069, 0.9862688, 1, 0, 0, 1, 1,
-0.08809926, 0.3152608, 0.5112988, 1, 0, 0, 1, 1,
-0.07992223, 0.7408841, -0.6245567, 0, 0, 0, 1, 1,
-0.07804675, -0.4158448, -4.679617, 0, 0, 0, 1, 1,
-0.07326479, -0.9379224, -4.616661, 0, 0, 0, 1, 1,
-0.06625266, -1.804205, -2.733502, 0, 0, 0, 1, 1,
-0.06559846, 0.2362711, -0.5298432, 0, 0, 0, 1, 1,
-0.06475552, 0.657272, 1.113852, 0, 0, 0, 1, 1,
-0.06253419, 0.8741943, 0.1686504, 0, 0, 0, 1, 1,
-0.05921359, 1.651655, -0.6982492, 1, 1, 1, 1, 1,
-0.05735353, 0.1196139, 1.006332, 1, 1, 1, 1, 1,
-0.0556074, 0.5365999, -1.525285, 1, 1, 1, 1, 1,
-0.05451078, 0.3237687, 2.585525, 1, 1, 1, 1, 1,
-0.04839034, 2.036786, 0.7360138, 1, 1, 1, 1, 1,
-0.04625589, 1.429174, -0.3027583, 1, 1, 1, 1, 1,
-0.04604251, -0.5291062, -3.93805, 1, 1, 1, 1, 1,
-0.04603377, -0.3644997, -0.973456, 1, 1, 1, 1, 1,
-0.03977827, -0.2275842, -3.635968, 1, 1, 1, 1, 1,
-0.03589875, -0.7857777, -4.128505, 1, 1, 1, 1, 1,
-0.0323275, -0.03459892, -2.312225, 1, 1, 1, 1, 1,
-0.03060175, 0.1724967, -1.772276, 1, 1, 1, 1, 1,
-0.02780805, 1.62628, 0.006856196, 1, 1, 1, 1, 1,
-0.02618119, 0.268822, 0.04442693, 1, 1, 1, 1, 1,
-0.02151403, 1.197242, -1.26811, 1, 1, 1, 1, 1,
-0.01801048, -0.1857619, -3.852457, 0, 0, 1, 1, 1,
-0.009751215, 1.075123, -0.5810281, 1, 0, 0, 1, 1,
-0.009454963, 1.814848, 0.7774438, 1, 0, 0, 1, 1,
-0.008797158, -1.662122, -3.953711, 1, 0, 0, 1, 1,
-0.006489031, 1.972626, -0.2721929, 1, 0, 0, 1, 1,
-0.003754748, -1.361518, -2.214606, 1, 0, 0, 1, 1,
0.002232054, -0.919433, 3.52628, 0, 0, 0, 1, 1,
0.002468737, -0.4403135, 1.35089, 0, 0, 0, 1, 1,
0.005762243, 1.436013, -0.2630807, 0, 0, 0, 1, 1,
0.007371886, 0.08150133, -1.197719, 0, 0, 0, 1, 1,
0.01148627, -0.9223226, 3.411916, 0, 0, 0, 1, 1,
0.01232284, -0.4206096, 3.102247, 0, 0, 0, 1, 1,
0.01512543, -1.397864, 2.06119, 0, 0, 0, 1, 1,
0.01589643, 0.3708404, 0.3991579, 1, 1, 1, 1, 1,
0.01746367, 0.4099829, 0.005558143, 1, 1, 1, 1, 1,
0.01777208, 1.291138, -0.6468424, 1, 1, 1, 1, 1,
0.021238, 0.1884605, -0.6592602, 1, 1, 1, 1, 1,
0.02415228, -1.455132, 2.337646, 1, 1, 1, 1, 1,
0.02596219, -0.5226797, 1.817675, 1, 1, 1, 1, 1,
0.02620771, -0.6759091, 2.266415, 1, 1, 1, 1, 1,
0.02660428, -0.3925631, 3.601868, 1, 1, 1, 1, 1,
0.02782285, 0.3910326, -0.04668757, 1, 1, 1, 1, 1,
0.0281412, 1.121404, 0.4007857, 1, 1, 1, 1, 1,
0.03407248, -1.533303, 2.511116, 1, 1, 1, 1, 1,
0.03567027, -0.6572641, 3.280786, 1, 1, 1, 1, 1,
0.03619456, 0.9629683, -0.7026334, 1, 1, 1, 1, 1,
0.04107617, -0.0118475, 2.459754, 1, 1, 1, 1, 1,
0.04224381, -1.031557, 3.440871, 1, 1, 1, 1, 1,
0.04332983, -1.585736, 1.690267, 0, 0, 1, 1, 1,
0.04513327, -0.4386843, 3.095454, 1, 0, 0, 1, 1,
0.04655631, -1.247071, 3.962895, 1, 0, 0, 1, 1,
0.04724082, 0.6700031, -0.855248, 1, 0, 0, 1, 1,
0.04849417, 0.4888518, -0.3846024, 1, 0, 0, 1, 1,
0.04857624, -0.02799597, 3.224913, 1, 0, 0, 1, 1,
0.04943038, 0.9676872, -0.1537068, 0, 0, 0, 1, 1,
0.06676644, -1.692187, 1.84393, 0, 0, 0, 1, 1,
0.06735429, -0.2325565, 1.563331, 0, 0, 0, 1, 1,
0.06735552, -0.5312783, 4.1553, 0, 0, 0, 1, 1,
0.07291113, 0.4819024, 0.2016308, 0, 0, 0, 1, 1,
0.08054515, -0.6802654, 3.4212, 0, 0, 0, 1, 1,
0.08073634, 0.4308164, -0.7276704, 0, 0, 0, 1, 1,
0.08335306, 0.7437713, 0.7185616, 1, 1, 1, 1, 1,
0.08444667, 0.4112582, -1.423959, 1, 1, 1, 1, 1,
0.08943161, -1.498064, 1.19665, 1, 1, 1, 1, 1,
0.09105921, -0.08803648, 0.6123216, 1, 1, 1, 1, 1,
0.09460631, -0.5851286, 2.356641, 1, 1, 1, 1, 1,
0.09565615, -0.4492286, 2.661704, 1, 1, 1, 1, 1,
0.0960096, 0.4960349, -0.1758884, 1, 1, 1, 1, 1,
0.09658699, -0.401058, 4.5216, 1, 1, 1, 1, 1,
0.09742148, -0.8657079, 3.382891, 1, 1, 1, 1, 1,
0.09918898, 0.06527903, 1.005337, 1, 1, 1, 1, 1,
0.09938535, -0.3567605, 3.670596, 1, 1, 1, 1, 1,
0.1012032, -1.600807, 2.823516, 1, 1, 1, 1, 1,
0.1038023, 0.7203643, 0.1665396, 1, 1, 1, 1, 1,
0.1038265, -1.170401, 3.724184, 1, 1, 1, 1, 1,
0.1056009, 0.9201147, -0.5487726, 1, 1, 1, 1, 1,
0.1075421, -0.3473854, 1.28918, 0, 0, 1, 1, 1,
0.107734, 0.01810833, 0.9488331, 1, 0, 0, 1, 1,
0.1079535, -1.282001, 2.681489, 1, 0, 0, 1, 1,
0.1079545, -0.388942, 3.075841, 1, 0, 0, 1, 1,
0.1130492, -0.08386268, 1.786363, 1, 0, 0, 1, 1,
0.1158745, 0.4972713, -0.01963445, 1, 0, 0, 1, 1,
0.1160195, -1.117199, 3.71838, 0, 0, 0, 1, 1,
0.1167254, 0.1957908, 1.869965, 0, 0, 0, 1, 1,
0.1182609, 0.5004605, 0.9294526, 0, 0, 0, 1, 1,
0.1183238, 1.032663, -1.265847, 0, 0, 0, 1, 1,
0.1192204, -0.1629972, 3.120003, 0, 0, 0, 1, 1,
0.1199717, 0.9909457, -0.03783404, 0, 0, 0, 1, 1,
0.1254006, -1.117324, 5.083867, 0, 0, 0, 1, 1,
0.1256653, -0.5179555, 3.983727, 1, 1, 1, 1, 1,
0.1277557, 1.004259, -1.443909, 1, 1, 1, 1, 1,
0.1287628, -0.8706407, 1.609825, 1, 1, 1, 1, 1,
0.1291671, -1.71438, 2.343374, 1, 1, 1, 1, 1,
0.1328943, 1.516515, -1.019326, 1, 1, 1, 1, 1,
0.1350085, -0.8219145, 3.689522, 1, 1, 1, 1, 1,
0.1373847, 0.3415837, 1.892224, 1, 1, 1, 1, 1,
0.1423603, -1.832169, 1.69935, 1, 1, 1, 1, 1,
0.1427071, 0.7066166, 0.09733789, 1, 1, 1, 1, 1,
0.1435149, 2.305205, 0.597313, 1, 1, 1, 1, 1,
0.1443991, -0.334558, 2.924977, 1, 1, 1, 1, 1,
0.1469787, -0.558068, 2.632442, 1, 1, 1, 1, 1,
0.1530219, -0.3825291, 3.012854, 1, 1, 1, 1, 1,
0.1629775, -0.4965345, 3.31451, 1, 1, 1, 1, 1,
0.163244, -0.2624875, 3.714623, 1, 1, 1, 1, 1,
0.1635151, 0.4986752, 0.7120491, 0, 0, 1, 1, 1,
0.1637558, -1.67708, 3.292696, 1, 0, 0, 1, 1,
0.1651913, -0.35142, 0.4638068, 1, 0, 0, 1, 1,
0.1661594, 0.6619363, -0.09274163, 1, 0, 0, 1, 1,
0.1678373, -1.263099, 1.80546, 1, 0, 0, 1, 1,
0.1731592, -1.869016, 3.889677, 1, 0, 0, 1, 1,
0.1742722, 0.917995, 1.059667, 0, 0, 0, 1, 1,
0.1771443, -2.7697, 4.328397, 0, 0, 0, 1, 1,
0.1779918, -0.2205255, 2.170708, 0, 0, 0, 1, 1,
0.1788142, -0.9070557, 0.7748879, 0, 0, 0, 1, 1,
0.1788522, 0.08414657, 3.045025, 0, 0, 0, 1, 1,
0.1797135, -1.681551, 2.872377, 0, 0, 0, 1, 1,
0.181032, -1.206142, 2.932868, 0, 0, 0, 1, 1,
0.1835731, 0.1294995, 0.8441747, 1, 1, 1, 1, 1,
0.1874446, 0.7983009, 1.1088, 1, 1, 1, 1, 1,
0.1893622, 0.8584609, 0.6265967, 1, 1, 1, 1, 1,
0.1920681, -0.6193863, 1.474795, 1, 1, 1, 1, 1,
0.192302, -1.393924, 2.32369, 1, 1, 1, 1, 1,
0.1968767, -0.01100944, 1.344773, 1, 1, 1, 1, 1,
0.1978576, 1.421336, 1.645138, 1, 1, 1, 1, 1,
0.2048111, -2.04461, 3.314325, 1, 1, 1, 1, 1,
0.2148723, -0.4903969, 1.786718, 1, 1, 1, 1, 1,
0.2176856, 1.184096, 0.2943563, 1, 1, 1, 1, 1,
0.2235848, -1.620643, 4.305962, 1, 1, 1, 1, 1,
0.2238093, -0.8859724, 5.341492, 1, 1, 1, 1, 1,
0.2279344, -1.175473, 2.619171, 1, 1, 1, 1, 1,
0.2279654, -0.1262485, 1.755337, 1, 1, 1, 1, 1,
0.2303309, 0.5452608, -1.313814, 1, 1, 1, 1, 1,
0.2317335, 0.1548333, 1.724454, 0, 0, 1, 1, 1,
0.2326846, -0.3454417, 1.463583, 1, 0, 0, 1, 1,
0.2348426, -1.395196, 3.342511, 1, 0, 0, 1, 1,
0.2355774, -0.1258979, 1.273565, 1, 0, 0, 1, 1,
0.246645, -1.174227, 2.179984, 1, 0, 0, 1, 1,
0.2472657, -1.895893, 1.309164, 1, 0, 0, 1, 1,
0.2473567, 1.406371, 0.3058257, 0, 0, 0, 1, 1,
0.2483699, 2.012681, 1.560528, 0, 0, 0, 1, 1,
0.2503037, -2.21342, 2.869413, 0, 0, 0, 1, 1,
0.2547652, 0.4199509, 0.7609419, 0, 0, 0, 1, 1,
0.2598419, -1.799971, 2.884526, 0, 0, 0, 1, 1,
0.2642685, 1.247205, -1.140446, 0, 0, 0, 1, 1,
0.2644217, -0.6434345, 2.09666, 0, 0, 0, 1, 1,
0.2647377, -0.1417877, 3.606103, 1, 1, 1, 1, 1,
0.2658421, 0.2372027, 1.888278, 1, 1, 1, 1, 1,
0.2673325, 1.562984, 1.622038, 1, 1, 1, 1, 1,
0.2685855, 0.2950697, 1.509784, 1, 1, 1, 1, 1,
0.271691, 0.4405142, 0.5183608, 1, 1, 1, 1, 1,
0.2729026, 0.1358845, 2.343295, 1, 1, 1, 1, 1,
0.2747269, -0.4697651, 0.6708223, 1, 1, 1, 1, 1,
0.2845985, -0.0779488, 2.985176, 1, 1, 1, 1, 1,
0.2851021, 0.3491555, 3.440766, 1, 1, 1, 1, 1,
0.2900657, 0.7392247, 0.8559977, 1, 1, 1, 1, 1,
0.2947818, 0.6388176, -0.5523954, 1, 1, 1, 1, 1,
0.296973, 1.606868, 0.1572097, 1, 1, 1, 1, 1,
0.2985359, -0.9048285, 3.850096, 1, 1, 1, 1, 1,
0.300216, -1.015597, 2.93748, 1, 1, 1, 1, 1,
0.3074216, 0.8015797, 1.319032, 1, 1, 1, 1, 1,
0.3075389, 1.251414, -0.2995186, 0, 0, 1, 1, 1,
0.3100164, 0.1611265, 1.925993, 1, 0, 0, 1, 1,
0.3110133, 0.5149737, 0.04817316, 1, 0, 0, 1, 1,
0.3147391, -1.067415, 2.232612, 1, 0, 0, 1, 1,
0.3156877, 1.018065, 0.4126258, 1, 0, 0, 1, 1,
0.3161629, 0.1444561, 0.9367948, 1, 0, 0, 1, 1,
0.3177286, 0.9088535, -0.5267738, 0, 0, 0, 1, 1,
0.3184215, -0.770049, 3.975266, 0, 0, 0, 1, 1,
0.3187039, 0.6849149, 0.7698144, 0, 0, 0, 1, 1,
0.3208008, 1.582726, 1.251371, 0, 0, 0, 1, 1,
0.3211892, 0.3829948, -0.7433437, 0, 0, 0, 1, 1,
0.3213028, -0.3717334, 2.649956, 0, 0, 0, 1, 1,
0.3227596, 0.1964158, 2.012728, 0, 0, 0, 1, 1,
0.3231876, -0.9006099, 3.093438, 1, 1, 1, 1, 1,
0.3302198, 0.4808569, 0.8409806, 1, 1, 1, 1, 1,
0.3306995, -1.741382, 2.726767, 1, 1, 1, 1, 1,
0.3310644, -0.2156771, 2.130696, 1, 1, 1, 1, 1,
0.3376083, -0.7415845, 3.582838, 1, 1, 1, 1, 1,
0.339748, 0.2898265, 1.026972, 1, 1, 1, 1, 1,
0.3441574, 0.2734097, 0.2996288, 1, 1, 1, 1, 1,
0.345006, 0.524995, 0.334727, 1, 1, 1, 1, 1,
0.3454573, 0.9079611, -0.566112, 1, 1, 1, 1, 1,
0.3548859, 0.484646, 1.562699, 1, 1, 1, 1, 1,
0.3551956, 1.146959, -0.4777161, 1, 1, 1, 1, 1,
0.3571235, 2.240463, -1.30056, 1, 1, 1, 1, 1,
0.3588023, 0.06501448, 2.16348, 1, 1, 1, 1, 1,
0.3600206, 1.988122, -0.03956088, 1, 1, 1, 1, 1,
0.3626058, -0.891367, 2.453821, 1, 1, 1, 1, 1,
0.3626386, -0.3399964, 1.843541, 0, 0, 1, 1, 1,
0.3679833, 0.8648553, 1.6373, 1, 0, 0, 1, 1,
0.3758556, 1.512118, -0.648485, 1, 0, 0, 1, 1,
0.3817749, -0.4354103, 3.344366, 1, 0, 0, 1, 1,
0.3841044, 0.6367635, 0.7722698, 1, 0, 0, 1, 1,
0.3926677, 1.755076, -0.3547176, 1, 0, 0, 1, 1,
0.3934921, -0.05705505, 0.8642045, 0, 0, 0, 1, 1,
0.394764, 0.5343515, 0.1955222, 0, 0, 0, 1, 1,
0.3983251, -0.4448477, 2.135623, 0, 0, 0, 1, 1,
0.3987315, -0.3823584, 2.000701, 0, 0, 0, 1, 1,
0.4136739, -1.42487, 3.687026, 0, 0, 0, 1, 1,
0.4138311, -0.8988531, 2.283722, 0, 0, 0, 1, 1,
0.416019, 0.7795157, 0.7952018, 0, 0, 0, 1, 1,
0.417217, 0.132215, 1.922509, 1, 1, 1, 1, 1,
0.4320516, -0.6345435, 2.239157, 1, 1, 1, 1, 1,
0.4365737, 0.567064, -0.1486704, 1, 1, 1, 1, 1,
0.440106, -0.4090684, 4.016546, 1, 1, 1, 1, 1,
0.4414122, 0.523236, 0.3164789, 1, 1, 1, 1, 1,
0.4444617, -0.1402576, 1.442931, 1, 1, 1, 1, 1,
0.4461125, -0.7367175, 3.025889, 1, 1, 1, 1, 1,
0.4483798, 0.4364018, -1.701111, 1, 1, 1, 1, 1,
0.4501406, 0.3956691, 1.210345, 1, 1, 1, 1, 1,
0.4540055, -0.6379396, -0.7621965, 1, 1, 1, 1, 1,
0.454872, 1.13072, 0.5962955, 1, 1, 1, 1, 1,
0.4576333, 1.886526, 0.630159, 1, 1, 1, 1, 1,
0.4586344, 1.442794, -0.9212915, 1, 1, 1, 1, 1,
0.4591502, -0.02911134, 2.103325, 1, 1, 1, 1, 1,
0.4611973, 0.4343359, 0.6481707, 1, 1, 1, 1, 1,
0.4617502, 1.478075, 0.08782843, 0, 0, 1, 1, 1,
0.4662766, 0.9774047, 2.200735, 1, 0, 0, 1, 1,
0.4717944, -1.512175, 1.953338, 1, 0, 0, 1, 1,
0.4729027, -1.359964, 2.648864, 1, 0, 0, 1, 1,
0.4734638, 0.007663266, 1.77727, 1, 0, 0, 1, 1,
0.4748635, -0.557038, 3.765367, 1, 0, 0, 1, 1,
0.4752837, -0.1570234, 1.935608, 0, 0, 0, 1, 1,
0.4790917, -0.5194466, 1.646626, 0, 0, 0, 1, 1,
0.4969696, 0.003148569, 2.311405, 0, 0, 0, 1, 1,
0.49874, 0.5564892, 0.5984897, 0, 0, 0, 1, 1,
0.507337, -0.1171415, 2.464787, 0, 0, 0, 1, 1,
0.5095351, 0.6642212, 0.98485, 0, 0, 0, 1, 1,
0.5179514, -1.108269, 3.096729, 0, 0, 0, 1, 1,
0.5189466, 0.4353286, 1.816174, 1, 1, 1, 1, 1,
0.5201137, -0.559433, 1.631567, 1, 1, 1, 1, 1,
0.5204462, -1.048812, 2.299692, 1, 1, 1, 1, 1,
0.5233632, 0.2211911, 1.238137, 1, 1, 1, 1, 1,
0.5238335, 1.246043, 1.51426, 1, 1, 1, 1, 1,
0.5288875, 0.02917932, 1.666536, 1, 1, 1, 1, 1,
0.5332713, 1.534438, 0.5852314, 1, 1, 1, 1, 1,
0.5355613, -0.6284339, 2.579183, 1, 1, 1, 1, 1,
0.5389701, 0.6660739, 2.240654, 1, 1, 1, 1, 1,
0.5401413, -0.579244, 3.201373, 1, 1, 1, 1, 1,
0.5406683, 0.3331002, 1.613124, 1, 1, 1, 1, 1,
0.5410453, 0.9753093, 1.540317, 1, 1, 1, 1, 1,
0.5447138, 1.122647, 0.9295983, 1, 1, 1, 1, 1,
0.5535018, -1.242595, 2.940899, 1, 1, 1, 1, 1,
0.5552291, 0.6627042, 1.996844, 1, 1, 1, 1, 1,
0.5613617, 0.5125269, 1.212548, 0, 0, 1, 1, 1,
0.562016, -1.008765, 4.267235, 1, 0, 0, 1, 1,
0.5784174, -1.322883, 3.076872, 1, 0, 0, 1, 1,
0.5793892, -0.2752351, 2.100308, 1, 0, 0, 1, 1,
0.580896, 0.3061125, 2.102076, 1, 0, 0, 1, 1,
0.5832254, -1.793377, 1.866006, 1, 0, 0, 1, 1,
0.5851537, 0.3264205, 1.673657, 0, 0, 0, 1, 1,
0.5874526, -0.8607818, 4.403034, 0, 0, 0, 1, 1,
0.5929561, -0.4813771, 2.783258, 0, 0, 0, 1, 1,
0.5947989, -0.7561031, 0.5294572, 0, 0, 0, 1, 1,
0.5975851, 0.5090858, 2.228493, 0, 0, 0, 1, 1,
0.6026156, -1.779113, 1.834505, 0, 0, 0, 1, 1,
0.6034071, -0.08670221, 0.6046394, 0, 0, 0, 1, 1,
0.6169384, 0.5532858, -0.3251913, 1, 1, 1, 1, 1,
0.6188804, -0.7175109, 0.9690922, 1, 1, 1, 1, 1,
0.622752, -0.01685957, 0.2691675, 1, 1, 1, 1, 1,
0.6233506, 0.7779687, 2.579545, 1, 1, 1, 1, 1,
0.6246449, 0.5784636, 1.680145, 1, 1, 1, 1, 1,
0.6248304, 0.3978374, 0.5181738, 1, 1, 1, 1, 1,
0.626122, -0.618592, 2.261301, 1, 1, 1, 1, 1,
0.6264148, 1.129021, -0.3367196, 1, 1, 1, 1, 1,
0.6268763, -0.7334231, 2.977289, 1, 1, 1, 1, 1,
0.6290588, 0.5886239, -0.2759039, 1, 1, 1, 1, 1,
0.6339105, -0.4084626, 1.614191, 1, 1, 1, 1, 1,
0.6379111, -0.8558393, 3.13374, 1, 1, 1, 1, 1,
0.6384275, 1.654945, 1.140873, 1, 1, 1, 1, 1,
0.6418369, 0.6732777, 0.9476035, 1, 1, 1, 1, 1,
0.64358, 0.9339693, -0.6312682, 1, 1, 1, 1, 1,
0.6449148, 0.3016429, 1.864466, 0, 0, 1, 1, 1,
0.6460385, -2.116967, 1.107018, 1, 0, 0, 1, 1,
0.6466043, 0.186464, 0.1603578, 1, 0, 0, 1, 1,
0.6467097, -0.6337472, 0.6241855, 1, 0, 0, 1, 1,
0.6478102, 0.3810487, 0.5786422, 1, 0, 0, 1, 1,
0.652711, -0.3144458, 2.483649, 1, 0, 0, 1, 1,
0.6683692, 0.5047109, 1.868487, 0, 0, 0, 1, 1,
0.6685008, 1.338499, 2.14266, 0, 0, 0, 1, 1,
0.6779768, -0.3911856, 2.923295, 0, 0, 0, 1, 1,
0.6788205, 0.7187827, -0.2074949, 0, 0, 0, 1, 1,
0.6790745, -0.641201, 0.9726446, 0, 0, 0, 1, 1,
0.6831859, 0.2666743, 1.309766, 0, 0, 0, 1, 1,
0.6840409, -2.109957, 1.932359, 0, 0, 0, 1, 1,
0.6871799, 1.273652, 0.952956, 1, 1, 1, 1, 1,
0.6899268, 0.6143259, 0.9230722, 1, 1, 1, 1, 1,
0.6916373, -1.367521, 3.147347, 1, 1, 1, 1, 1,
0.6918625, 0.62435, 0.1442661, 1, 1, 1, 1, 1,
0.6928082, 0.09130151, -0.2045438, 1, 1, 1, 1, 1,
0.6962296, -0.8410625, 2.361766, 1, 1, 1, 1, 1,
0.6986821, 1.086182, 0.8252628, 1, 1, 1, 1, 1,
0.7005424, -0.7055185, 2.948623, 1, 1, 1, 1, 1,
0.7020258, -0.8502486, 1.994688, 1, 1, 1, 1, 1,
0.7069988, 2.184096, -0.2607362, 1, 1, 1, 1, 1,
0.7076879, 0.1104169, 2.312238, 1, 1, 1, 1, 1,
0.7136707, -0.004466977, 0.3383614, 1, 1, 1, 1, 1,
0.7167295, -1.89438, 2.064727, 1, 1, 1, 1, 1,
0.7207841, -0.2233492, 2.947156, 1, 1, 1, 1, 1,
0.7215219, 0.1342805, 0.07601924, 1, 1, 1, 1, 1,
0.7261852, -0.9659243, 2.311845, 0, 0, 1, 1, 1,
0.7273929, -0.3239101, 2.453977, 1, 0, 0, 1, 1,
0.7297103, 1.12513, 0.7243034, 1, 0, 0, 1, 1,
0.7313812, 0.2678928, 0.9639826, 1, 0, 0, 1, 1,
0.7346054, 0.4738493, 2.238682, 1, 0, 0, 1, 1,
0.7350658, -0.03215388, 2.476573, 1, 0, 0, 1, 1,
0.7352252, -0.5193382, 2.083286, 0, 0, 0, 1, 1,
0.7360641, -0.1194267, 0.6681805, 0, 0, 0, 1, 1,
0.7366153, 1.276489, 1.526812, 0, 0, 0, 1, 1,
0.7416542, -0.7983279, 1.802677, 0, 0, 0, 1, 1,
0.7468345, -1.245582, 2.776712, 0, 0, 0, 1, 1,
0.7475573, 0.05441936, 1.446396, 0, 0, 0, 1, 1,
0.7504027, -1.368469, 4.144716, 0, 0, 0, 1, 1,
0.7505257, 1.707098, -0.5341757, 1, 1, 1, 1, 1,
0.7556423, -0.2355451, 2.492332, 1, 1, 1, 1, 1,
0.7570831, 0.2805986, 1.723851, 1, 1, 1, 1, 1,
0.7595637, 0.02502739, 2.677508, 1, 1, 1, 1, 1,
0.7613028, -0.9271764, 2.761762, 1, 1, 1, 1, 1,
0.7666836, 0.420171, -0.09031802, 1, 1, 1, 1, 1,
0.7710223, -0.3990599, 2.148673, 1, 1, 1, 1, 1,
0.7787492, 0.4773916, 0.9441356, 1, 1, 1, 1, 1,
0.781006, -1.228364, 2.060764, 1, 1, 1, 1, 1,
0.7816252, 0.6832178, 0.7525223, 1, 1, 1, 1, 1,
0.7818008, 0.8176168, 2.266866, 1, 1, 1, 1, 1,
0.7906095, -0.4907624, 1.802905, 1, 1, 1, 1, 1,
0.8046702, 0.6986542, 1.807947, 1, 1, 1, 1, 1,
0.8051654, 0.6203976, 0.9731541, 1, 1, 1, 1, 1,
0.8062017, -0.9555916, 2.400558, 1, 1, 1, 1, 1,
0.8074401, 1.303278, -0.1691875, 0, 0, 1, 1, 1,
0.8138697, 1.054811, 0.4164933, 1, 0, 0, 1, 1,
0.8155174, 0.1529596, -0.6607223, 1, 0, 0, 1, 1,
0.8180344, 1.205477, 1.325759, 1, 0, 0, 1, 1,
0.8208697, 1.662522, 0.5251592, 1, 0, 0, 1, 1,
0.8406785, 0.9716809, -0.8658956, 1, 0, 0, 1, 1,
0.8408574, 0.4220667, 1.557694, 0, 0, 0, 1, 1,
0.8427631, -0.630486, 2.855897, 0, 0, 0, 1, 1,
0.8444854, -0.544833, 2.805806, 0, 0, 0, 1, 1,
0.8459557, 0.1860727, 1.015105, 0, 0, 0, 1, 1,
0.8462276, 0.01790781, -0.8500406, 0, 0, 0, 1, 1,
0.8497856, -0.2968596, 2.49579, 0, 0, 0, 1, 1,
0.8498914, 1.426812, -1.849897, 0, 0, 0, 1, 1,
0.850332, 0.7116479, 1.615818, 1, 1, 1, 1, 1,
0.8582784, -0.1510114, 0.6168393, 1, 1, 1, 1, 1,
0.8590522, -0.382164, 1.652595, 1, 1, 1, 1, 1,
0.8669255, 0.4425662, 1.447282, 1, 1, 1, 1, 1,
0.8687497, -1.605947, 2.072546, 1, 1, 1, 1, 1,
0.8700441, -1.136962, 2.69384, 1, 1, 1, 1, 1,
0.8706852, -1.820094, 3.482105, 1, 1, 1, 1, 1,
0.8777464, 0.2962134, 2.143682, 1, 1, 1, 1, 1,
0.8835388, -0.1652649, 2.63946, 1, 1, 1, 1, 1,
0.8838998, -0.9222848, 2.594992, 1, 1, 1, 1, 1,
0.8846827, 1.144162, 0.6016061, 1, 1, 1, 1, 1,
0.8886544, -1.790423, 3.844309, 1, 1, 1, 1, 1,
0.8936186, 0.134493, 1.389022, 1, 1, 1, 1, 1,
0.8949618, 0.2860007, 2.230054, 1, 1, 1, 1, 1,
0.8976583, 1.739648, -0.1120465, 1, 1, 1, 1, 1,
0.8980261, -0.6681641, 0.7788191, 0, 0, 1, 1, 1,
0.8989123, -0.5439715, 0.3613507, 1, 0, 0, 1, 1,
0.8994734, -0.556017, 0.7537311, 1, 0, 0, 1, 1,
0.9033695, 0.4180514, -0.2844162, 1, 0, 0, 1, 1,
0.9035338, 0.599561, 0.8519078, 1, 0, 0, 1, 1,
0.9095495, 1.74166, 0.9133231, 1, 0, 0, 1, 1,
0.9115039, 0.7955053, 0.2493813, 0, 0, 0, 1, 1,
0.9128217, -0.2921585, 1.998516, 0, 0, 0, 1, 1,
0.9168555, -0.09401455, 2.021066, 0, 0, 0, 1, 1,
0.9169289, -1.024227, 2.837773, 0, 0, 0, 1, 1,
0.9197226, -0.3249076, 0.2389581, 0, 0, 0, 1, 1,
0.9241978, 1.145927, 0.2663221, 0, 0, 0, 1, 1,
0.9248087, 0.1257806, 0.7025601, 0, 0, 0, 1, 1,
0.9323097, -1.393557, 2.680237, 1, 1, 1, 1, 1,
0.932981, 0.2971643, 3.343707, 1, 1, 1, 1, 1,
0.9372766, -0.1259298, 2.199806, 1, 1, 1, 1, 1,
0.9399013, 2.358809, -0.2881651, 1, 1, 1, 1, 1,
0.9403439, 0.1593659, -0.08335566, 1, 1, 1, 1, 1,
0.9405181, -1.186746, 1.310366, 1, 1, 1, 1, 1,
0.9412922, 1.609418, 0.7314597, 1, 1, 1, 1, 1,
0.9440797, -1.724586, 1.737015, 1, 1, 1, 1, 1,
0.9490263, -1.25832, 3.657526, 1, 1, 1, 1, 1,
0.9500447, -0.9105971, 2.701742, 1, 1, 1, 1, 1,
0.9524037, 0.2322935, 2.989514, 1, 1, 1, 1, 1,
0.9533967, -0.5462942, 1.033506, 1, 1, 1, 1, 1,
0.9566475, 0.2003098, 1.795204, 1, 1, 1, 1, 1,
0.967831, 0.1090772, 1.811184, 1, 1, 1, 1, 1,
0.971294, -0.8977419, 1.372573, 1, 1, 1, 1, 1,
0.979002, 1.186913, 1.389858, 0, 0, 1, 1, 1,
0.9848589, -0.385198, 3.01818, 1, 0, 0, 1, 1,
0.9872457, -0.3519064, 1.61022, 1, 0, 0, 1, 1,
0.9882656, 0.4745338, 2.262987, 1, 0, 0, 1, 1,
0.9896537, -0.9034654, 3.710713, 1, 0, 0, 1, 1,
0.9911571, -0.8113565, 2.39987, 1, 0, 0, 1, 1,
0.9928845, 0.7495952, 0.2886803, 0, 0, 0, 1, 1,
0.9989812, -1.859071, 2.819076, 0, 0, 0, 1, 1,
1.00323, -0.3208649, 2.810779, 0, 0, 0, 1, 1,
1.004351, -0.04937391, 1.691114, 0, 0, 0, 1, 1,
1.005033, -0.5260431, 0.3908868, 0, 0, 0, 1, 1,
1.009126, -0.8896935, 2.187706, 0, 0, 0, 1, 1,
1.010128, 1.500411, 1.347181, 0, 0, 0, 1, 1,
1.016024, -0.3002934, 4.070987, 1, 1, 1, 1, 1,
1.016038, -0.9165272, 3.1455, 1, 1, 1, 1, 1,
1.020481, 0.0528295, 1.562933, 1, 1, 1, 1, 1,
1.024154, -0.2795576, 1.318762, 1, 1, 1, 1, 1,
1.024683, -2.036863, 2.278549, 1, 1, 1, 1, 1,
1.036518, -0.6843396, 2.093359, 1, 1, 1, 1, 1,
1.041507, -0.5801799, 1.030449, 1, 1, 1, 1, 1,
1.044506, -0.09784891, 3.757721, 1, 1, 1, 1, 1,
1.047321, 0.4114223, 1.678213, 1, 1, 1, 1, 1,
1.05702, -0.491999, 0.2778448, 1, 1, 1, 1, 1,
1.059649, -0.05361054, -0.2351161, 1, 1, 1, 1, 1,
1.061823, -0.8557033, 3.637608, 1, 1, 1, 1, 1,
1.062658, 1.031153, 0.8878777, 1, 1, 1, 1, 1,
1.074388, 0.281323, 0.5979686, 1, 1, 1, 1, 1,
1.077534, 1.103593, -0.7087555, 1, 1, 1, 1, 1,
1.078411, 0.3875562, 0.4810171, 0, 0, 1, 1, 1,
1.079654, -0.648619, 3.446217, 1, 0, 0, 1, 1,
1.083336, -0.977389, 2.845282, 1, 0, 0, 1, 1,
1.084093, 1.723697, 1.774536, 1, 0, 0, 1, 1,
1.084409, -1.010252, 1.744276, 1, 0, 0, 1, 1,
1.08729, -0.851765, 0.13589, 1, 0, 0, 1, 1,
1.091489, -1.109588, 1.946115, 0, 0, 0, 1, 1,
1.093243, 1.302636, -1.182829, 0, 0, 0, 1, 1,
1.105448, -0.9180036, 2.619792, 0, 0, 0, 1, 1,
1.110039, -1.009381, 3.396796, 0, 0, 0, 1, 1,
1.115596, -0.7693127, 2.447843, 0, 0, 0, 1, 1,
1.115858, 0.9053957, 1.248554, 0, 0, 0, 1, 1,
1.147232, -0.02473976, 1.435186, 0, 0, 0, 1, 1,
1.148961, 0.4722742, 0.4522468, 1, 1, 1, 1, 1,
1.15462, -0.8601865, -0.9961479, 1, 1, 1, 1, 1,
1.17548, 1.412579, 0.2819413, 1, 1, 1, 1, 1,
1.175915, 0.7544237, 1.964514, 1, 1, 1, 1, 1,
1.176646, 1.715328, 0.02232969, 1, 1, 1, 1, 1,
1.178685, 1.158395, 1.489695, 1, 1, 1, 1, 1,
1.179621, -0.815851, 4.151315, 1, 1, 1, 1, 1,
1.187219, -2.335853, 1.848175, 1, 1, 1, 1, 1,
1.194048, -1.484313, 2.544062, 1, 1, 1, 1, 1,
1.196091, 0.2664656, 1.760847, 1, 1, 1, 1, 1,
1.205273, 0.3861555, 0.9849588, 1, 1, 1, 1, 1,
1.220475, 0.7138726, 0.4276942, 1, 1, 1, 1, 1,
1.223644, -0.4929711, 1.303245, 1, 1, 1, 1, 1,
1.226248, 1.963338, -0.1640989, 1, 1, 1, 1, 1,
1.226957, -0.8318366, 0.5941201, 1, 1, 1, 1, 1,
1.227835, 0.4849409, 1.960585, 0, 0, 1, 1, 1,
1.233704, -1.592859, 1.485464, 1, 0, 0, 1, 1,
1.234785, -0.727962, 2.39049, 1, 0, 0, 1, 1,
1.239527, 1.571806, 0.4080199, 1, 0, 0, 1, 1,
1.240954, -1.397361, 0.8057399, 1, 0, 0, 1, 1,
1.245786, -0.4354079, 2.793985, 1, 0, 0, 1, 1,
1.246163, -1.108376, 2.722541, 0, 0, 0, 1, 1,
1.248086, 1.145549, 1.536646, 0, 0, 0, 1, 1,
1.250015, -0.188812, 2.740376, 0, 0, 0, 1, 1,
1.256013, 1.165339, 3.304734, 0, 0, 0, 1, 1,
1.273375, 0.968935, -0.102563, 0, 0, 0, 1, 1,
1.280016, 0.6954927, 0.9743307, 0, 0, 0, 1, 1,
1.288785, -0.4433363, 2.946117, 0, 0, 0, 1, 1,
1.291889, -0.02982979, 1.02465, 1, 1, 1, 1, 1,
1.297249, 0.3656507, -0.1482252, 1, 1, 1, 1, 1,
1.30188, 0.6739806, -1.061541, 1, 1, 1, 1, 1,
1.309576, 1.136178, 0.8364778, 1, 1, 1, 1, 1,
1.311037, 0.9771707, 1.321296, 1, 1, 1, 1, 1,
1.319134, 1.289617, 0.5670182, 1, 1, 1, 1, 1,
1.323053, 0.6028916, 2.528175, 1, 1, 1, 1, 1,
1.323182, -0.2627735, 1.865324, 1, 1, 1, 1, 1,
1.325227, -0.4652805, 0.1267187, 1, 1, 1, 1, 1,
1.327902, -0.2450373, 1.202951, 1, 1, 1, 1, 1,
1.332878, -1.19958, 4.919301, 1, 1, 1, 1, 1,
1.335152, 2.170001, 2.382622, 1, 1, 1, 1, 1,
1.34261, -0.5073756, 2.306451, 1, 1, 1, 1, 1,
1.349919, 0.3994772, 2.593144, 1, 1, 1, 1, 1,
1.370962, -0.246639, 1.629776, 1, 1, 1, 1, 1,
1.406733, -0.9528995, 3.246878, 0, 0, 1, 1, 1,
1.407281, -0.2865096, 2.691168, 1, 0, 0, 1, 1,
1.41845, 1.293923, 2.302356, 1, 0, 0, 1, 1,
1.421899, 1.382852, 2.888856, 1, 0, 0, 1, 1,
1.435001, 1.087549, 0.6036939, 1, 0, 0, 1, 1,
1.447753, -0.8919389, 0.6326944, 1, 0, 0, 1, 1,
1.448823, -0.430661, 1.526851, 0, 0, 0, 1, 1,
1.461233, 1.219761, 1.896266, 0, 0, 0, 1, 1,
1.464517, -0.1664804, 2.360655, 0, 0, 0, 1, 1,
1.466675, -0.122314, 0.8333149, 0, 0, 0, 1, 1,
1.473328, -0.8545056, 1.13603, 0, 0, 0, 1, 1,
1.482904, 0.2707325, 1.290619, 0, 0, 0, 1, 1,
1.488222, -2.085914, 3.61511, 0, 0, 0, 1, 1,
1.516619, 0.6471387, 1.687018, 1, 1, 1, 1, 1,
1.521801, -0.7153416, 2.136702, 1, 1, 1, 1, 1,
1.524415, 0.1720677, 2.178512, 1, 1, 1, 1, 1,
1.529695, 1.914582, 0.6121197, 1, 1, 1, 1, 1,
1.539259, -0.1650633, 1.864887, 1, 1, 1, 1, 1,
1.549734, -1.947394, 2.519084, 1, 1, 1, 1, 1,
1.54979, -1.677923, 2.811589, 1, 1, 1, 1, 1,
1.552229, 0.5193945, 1.536678, 1, 1, 1, 1, 1,
1.554258, 0.7221425, 0.9887829, 1, 1, 1, 1, 1,
1.570473, 1.09532, 1.848688, 1, 1, 1, 1, 1,
1.612268, 1.356192, -0.1037518, 1, 1, 1, 1, 1,
1.61363, -0.4759016, 3.041896, 1, 1, 1, 1, 1,
1.621477, -0.5112461, 2.481606, 1, 1, 1, 1, 1,
1.640024, 0.9354549, 1.250047, 1, 1, 1, 1, 1,
1.682925, -0.03903917, 1.087332, 1, 1, 1, 1, 1,
1.688464, 0.4031118, 0.7628037, 0, 0, 1, 1, 1,
1.700065, -0.0549317, 1.217735, 1, 0, 0, 1, 1,
1.715608, 1.532853, 0.806734, 1, 0, 0, 1, 1,
1.718214, 0.5945074, 0.3806681, 1, 0, 0, 1, 1,
1.722131, -0.9358003, 2.877361, 1, 0, 0, 1, 1,
1.757919, -0.7295939, 1.91959, 1, 0, 0, 1, 1,
1.776889, 0.03724542, 0.7840823, 0, 0, 0, 1, 1,
1.798397, 1.251652, 0.6348929, 0, 0, 0, 1, 1,
1.814467, -1.080149, 1.637333, 0, 0, 0, 1, 1,
1.817848, 2.384456, -1.206122, 0, 0, 0, 1, 1,
1.834282, -0.5403436, 2.999651, 0, 0, 0, 1, 1,
1.850296, -0.06036194, 0.6107317, 0, 0, 0, 1, 1,
1.851685, -1.335482, 1.733993, 0, 0, 0, 1, 1,
1.867081, 0.4221377, 0.149798, 1, 1, 1, 1, 1,
1.877241, 0.4146624, 1.258103, 1, 1, 1, 1, 1,
1.883056, -0.1880291, 0.4940229, 1, 1, 1, 1, 1,
1.909026, 1.017011, 0.1798061, 1, 1, 1, 1, 1,
1.955111, -0.2859194, 2.69878, 1, 1, 1, 1, 1,
1.96043, -1.027072, 1.307559, 1, 1, 1, 1, 1,
1.970812, 1.429552, -0.580085, 1, 1, 1, 1, 1,
1.974478, -0.3097879, 2.600065, 1, 1, 1, 1, 1,
1.986063, 0.6146721, 0.9916003, 1, 1, 1, 1, 1,
1.99365, 1.523433, 1.868063, 1, 1, 1, 1, 1,
2.081515, 0.3288053, 0.02811084, 1, 1, 1, 1, 1,
2.096287, -0.9085202, 0.1515852, 1, 1, 1, 1, 1,
2.122497, 1.359694, 0.6506389, 1, 1, 1, 1, 1,
2.1245, 1.312874, 1.379, 1, 1, 1, 1, 1,
2.166553, 1.544559, 0.2402008, 1, 1, 1, 1, 1,
2.168836, -1.198442, 0.4000189, 0, 0, 1, 1, 1,
2.188702, 0.5486673, 1.396764, 1, 0, 0, 1, 1,
2.26194, -0.4079449, 2.615463, 1, 0, 0, 1, 1,
2.289626, 0.7988042, 2.935382, 1, 0, 0, 1, 1,
2.298552, -1.141422, 3.081309, 1, 0, 0, 1, 1,
2.359885, 1.154376, 2.141012, 1, 0, 0, 1, 1,
2.391527, 1.510312, 0.7091305, 0, 0, 0, 1, 1,
2.403249, 1.746789, 1.982886, 0, 0, 0, 1, 1,
2.423931, -2.172374, 2.829615, 0, 0, 0, 1, 1,
2.451357, 0.389333, 0.5784637, 0, 0, 0, 1, 1,
2.519912, 2.058942, 1.651576, 0, 0, 0, 1, 1,
2.57848, -2.161496, 0.9630578, 0, 0, 0, 1, 1,
2.614062, 0.1163209, 1.221646, 0, 0, 0, 1, 1,
2.693831, -1.265836, 2.881146, 1, 1, 1, 1, 1,
2.747223, 1.339515, 1.98696, 1, 1, 1, 1, 1,
3.02579, 0.9511725, 1.179936, 1, 1, 1, 1, 1,
3.170276, -0.201538, 1.877055, 1, 1, 1, 1, 1,
3.327316, -0.8111701, 1.400767, 1, 1, 1, 1, 1,
3.34467, -0.06909792, 1.707842, 1, 1, 1, 1, 1,
3.534528, -0.6167282, -0.219977, 1, 1, 1, 1, 1
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
var radius = 9.65182;
var distance = 33.90161;
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
mvMatrix.translate( 0.2707973, -0.1004633, -0.1028645 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.90161);
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
