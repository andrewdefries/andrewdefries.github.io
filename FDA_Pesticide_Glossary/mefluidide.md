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
-3.114033, 0.316953, -3.05305, 1, 0, 0, 1,
-2.983189, -0.5875285, -1.672515, 1, 0.007843138, 0, 1,
-2.947704, 0.6989622, -0.6938949, 1, 0.01176471, 0, 1,
-2.923764, -0.9329129, -1.714714, 1, 0.01960784, 0, 1,
-2.724951, 0.4086223, -1.713871, 1, 0.02352941, 0, 1,
-2.54458, -0.1348139, -1.552396, 1, 0.03137255, 0, 1,
-2.477872, -0.9223, -1.220413, 1, 0.03529412, 0, 1,
-2.451177, 0.3924818, -1.094873, 1, 0.04313726, 0, 1,
-2.361202, 0.3908116, -0.6590918, 1, 0.04705882, 0, 1,
-2.346826, 0.3888841, -1.020026, 1, 0.05490196, 0, 1,
-2.305864, 0.8964545, -1.685431, 1, 0.05882353, 0, 1,
-2.301034, 0.4067707, -1.260355, 1, 0.06666667, 0, 1,
-2.277887, -0.4728286, -3.459238, 1, 0.07058824, 0, 1,
-2.245653, -1.641771, -4.63945, 1, 0.07843138, 0, 1,
-2.205652, -0.002295378, -0.8676683, 1, 0.08235294, 0, 1,
-2.176122, 1.222208, -1.57553, 1, 0.09019608, 0, 1,
-2.169022, -0.5482925, -1.525946, 1, 0.09411765, 0, 1,
-2.14751, -0.2884584, -2.988794, 1, 0.1019608, 0, 1,
-2.147133, 1.351506, -0.5150921, 1, 0.1098039, 0, 1,
-2.133766, -0.04700964, -2.23009, 1, 0.1137255, 0, 1,
-2.128639, 0.0731934, -0.1062919, 1, 0.1215686, 0, 1,
-2.120288, 0.7368528, -1.271873, 1, 0.1254902, 0, 1,
-2.115082, -0.5202098, -2.50279, 1, 0.1333333, 0, 1,
-2.088342, 0.3069765, -1.065161, 1, 0.1372549, 0, 1,
-2.080026, -0.9034297, -1.445629, 1, 0.145098, 0, 1,
-2.07278, 1.739579, 0.3318773, 1, 0.1490196, 0, 1,
-2.069624, -0.4467269, -1.186291, 1, 0.1568628, 0, 1,
-2.04296, 0.2979791, -1.832931, 1, 0.1607843, 0, 1,
-2.031083, -1.067156, -3.418971, 1, 0.1686275, 0, 1,
-1.996284, 0.9331093, -1.364178, 1, 0.172549, 0, 1,
-1.987788, -0.6793823, -2.66873, 1, 0.1803922, 0, 1,
-1.918116, -0.01851074, -1.856408, 1, 0.1843137, 0, 1,
-1.893034, 0.2730622, -1.37534, 1, 0.1921569, 0, 1,
-1.8739, -1.526283, -2.321364, 1, 0.1960784, 0, 1,
-1.873591, -1.455586, -2.785023, 1, 0.2039216, 0, 1,
-1.870109, 2.928367, -0.6381174, 1, 0.2117647, 0, 1,
-1.845691, -1.305776, -1.495004, 1, 0.2156863, 0, 1,
-1.833688, -0.363925, -2.483145, 1, 0.2235294, 0, 1,
-1.823464, 0.4192261, -0.1475183, 1, 0.227451, 0, 1,
-1.806953, -0.4911529, -1.577242, 1, 0.2352941, 0, 1,
-1.785851, 2.845722, 0.02206242, 1, 0.2392157, 0, 1,
-1.774706, 0.7088887, -0.6185846, 1, 0.2470588, 0, 1,
-1.770434, -0.5613276, -3.949748, 1, 0.2509804, 0, 1,
-1.762414, -1.08595, -2.991338, 1, 0.2588235, 0, 1,
-1.752606, 0.01615581, -1.71348, 1, 0.2627451, 0, 1,
-1.738988, 0.1045229, -3.118529, 1, 0.2705882, 0, 1,
-1.727338, 1.213373, -0.5390283, 1, 0.2745098, 0, 1,
-1.727163, 0.5925227, -1.569901, 1, 0.282353, 0, 1,
-1.703047, 0.1616774, -1.649382, 1, 0.2862745, 0, 1,
-1.689412, -0.1694338, -0.6699809, 1, 0.2941177, 0, 1,
-1.674957, 0.2531532, -0.5503991, 1, 0.3019608, 0, 1,
-1.67129, 0.2206436, -0.0754419, 1, 0.3058824, 0, 1,
-1.67025, -0.7000743, -1.145708, 1, 0.3137255, 0, 1,
-1.657537, -0.6210068, -1.746638, 1, 0.3176471, 0, 1,
-1.650401, 1.029757, -0.3401833, 1, 0.3254902, 0, 1,
-1.637652, 0.8281913, 0.36342, 1, 0.3294118, 0, 1,
-1.634401, 0.1768175, -1.188941, 1, 0.3372549, 0, 1,
-1.62406, -1.394623, -0.04802013, 1, 0.3411765, 0, 1,
-1.589053, -0.7063683, -1.97652, 1, 0.3490196, 0, 1,
-1.587643, -0.6263956, -3.006357, 1, 0.3529412, 0, 1,
-1.577358, 0.9533644, -1.589451, 1, 0.3607843, 0, 1,
-1.575685, -0.1666189, -2.596783, 1, 0.3647059, 0, 1,
-1.561427, 0.4074927, -0.6842839, 1, 0.372549, 0, 1,
-1.561392, -1.416526, -2.828464, 1, 0.3764706, 0, 1,
-1.55031, 0.02960521, -1.422202, 1, 0.3843137, 0, 1,
-1.545457, 1.142431, -0.4964902, 1, 0.3882353, 0, 1,
-1.536996, 1.103968, 0.8782399, 1, 0.3960784, 0, 1,
-1.521733, -1.235707, 0.6484616, 1, 0.4039216, 0, 1,
-1.515987, -0.3510678, -3.584884, 1, 0.4078431, 0, 1,
-1.494617, 0.2493122, -2.091692, 1, 0.4156863, 0, 1,
-1.492555, -1.124153, -2.246778, 1, 0.4196078, 0, 1,
-1.491911, 1.904873, -0.4068568, 1, 0.427451, 0, 1,
-1.489685, 0.9168501, -0.490995, 1, 0.4313726, 0, 1,
-1.487074, -0.4193234, -3.966698, 1, 0.4392157, 0, 1,
-1.486677, -0.9387587, -1.584554, 1, 0.4431373, 0, 1,
-1.484108, -0.6938587, -1.310266, 1, 0.4509804, 0, 1,
-1.466858, -1.079182, -2.802391, 1, 0.454902, 0, 1,
-1.459523, -0.9706409, -2.85917, 1, 0.4627451, 0, 1,
-1.45911, 0.2592463, -1.407981, 1, 0.4666667, 0, 1,
-1.451346, -1.722926, -1.865107, 1, 0.4745098, 0, 1,
-1.451161, 2.177979, 0.1798513, 1, 0.4784314, 0, 1,
-1.450285, -1.005376, -2.689098, 1, 0.4862745, 0, 1,
-1.447018, 0.07447819, -1.483171, 1, 0.4901961, 0, 1,
-1.441215, 2.546055, -0.994298, 1, 0.4980392, 0, 1,
-1.440434, 0.5197142, -1.045336, 1, 0.5058824, 0, 1,
-1.439527, 0.5558071, -0.4421417, 1, 0.509804, 0, 1,
-1.433996, 0.5069025, -2.051982, 1, 0.5176471, 0, 1,
-1.433018, -1.528215, -2.608125, 1, 0.5215687, 0, 1,
-1.432526, 0.7379792, -1.449568, 1, 0.5294118, 0, 1,
-1.425315, -1.842211, -0.6272917, 1, 0.5333334, 0, 1,
-1.422672, -0.3095592, -1.851146, 1, 0.5411765, 0, 1,
-1.41925, -0.2800233, -2.054209, 1, 0.5450981, 0, 1,
-1.413149, 0.9808607, 0.1761369, 1, 0.5529412, 0, 1,
-1.402071, 0.817458, -0.8270933, 1, 0.5568628, 0, 1,
-1.397675, 1.15816, -0.02721203, 1, 0.5647059, 0, 1,
-1.392002, 0.3991587, -3.102528, 1, 0.5686275, 0, 1,
-1.389609, -0.3151926, -2.40942, 1, 0.5764706, 0, 1,
-1.384384, -1.043692, -1.304507, 1, 0.5803922, 0, 1,
-1.36587, 0.4874665, -0.5880985, 1, 0.5882353, 0, 1,
-1.353998, 0.4167791, 0.0525181, 1, 0.5921569, 0, 1,
-1.350468, -1.002769, -1.182826, 1, 0.6, 0, 1,
-1.348885, -0.4114626, -0.5417445, 1, 0.6078432, 0, 1,
-1.33931, -0.9526865, -1.835278, 1, 0.6117647, 0, 1,
-1.335776, 0.2441471, -1.332052, 1, 0.6196079, 0, 1,
-1.331149, -2.40828, -2.563036, 1, 0.6235294, 0, 1,
-1.330755, 1.397983, -3.175425, 1, 0.6313726, 0, 1,
-1.323467, -1.133067, -2.297309, 1, 0.6352941, 0, 1,
-1.318605, -2.089861, -3.856397, 1, 0.6431373, 0, 1,
-1.311435, 0.7032233, -1.486997, 1, 0.6470588, 0, 1,
-1.310453, 0.4362098, -0.6020809, 1, 0.654902, 0, 1,
-1.310091, -0.8292295, -0.2389355, 1, 0.6588235, 0, 1,
-1.30533, 0.6135793, -0.7298642, 1, 0.6666667, 0, 1,
-1.295668, -0.497968, -2.102825, 1, 0.6705883, 0, 1,
-1.292994, -0.283424, -2.228417, 1, 0.6784314, 0, 1,
-1.291143, 0.5351208, -2.130078, 1, 0.682353, 0, 1,
-1.279184, 0.3712632, 0.2200342, 1, 0.6901961, 0, 1,
-1.270973, 2.467892, 0.5574151, 1, 0.6941177, 0, 1,
-1.265959, -0.3762541, -1.073778, 1, 0.7019608, 0, 1,
-1.262022, -1.769343, -1.258139, 1, 0.7098039, 0, 1,
-1.257049, -0.6173867, -2.794562, 1, 0.7137255, 0, 1,
-1.254823, 0.6595998, -0.6144267, 1, 0.7215686, 0, 1,
-1.251158, -0.9708783, -1.657885, 1, 0.7254902, 0, 1,
-1.246908, 1.045402, 0.5687712, 1, 0.7333333, 0, 1,
-1.242096, 1.262526, -0.9502648, 1, 0.7372549, 0, 1,
-1.24051, 1.441401, 0.5800287, 1, 0.7450981, 0, 1,
-1.230325, 0.4103058, 2.212711, 1, 0.7490196, 0, 1,
-1.227801, -0.2004041, -1.709188, 1, 0.7568628, 0, 1,
-1.222147, 0.5046918, -0.9116896, 1, 0.7607843, 0, 1,
-1.214551, 1.272561, -1.698872, 1, 0.7686275, 0, 1,
-1.212594, -0.1631865, -2.688124, 1, 0.772549, 0, 1,
-1.210243, -0.47216, -3.017341, 1, 0.7803922, 0, 1,
-1.20627, 1.59865, -1.897112, 1, 0.7843137, 0, 1,
-1.204509, 0.3057505, -1.538461, 1, 0.7921569, 0, 1,
-1.186936, 0.2711937, -2.94491, 1, 0.7960784, 0, 1,
-1.184468, 0.3944678, -1.870939, 1, 0.8039216, 0, 1,
-1.172632, 0.8328317, 0.638862, 1, 0.8117647, 0, 1,
-1.172401, -1.31157, -2.432737, 1, 0.8156863, 0, 1,
-1.165755, 1.516359, 0.4869108, 1, 0.8235294, 0, 1,
-1.164409, -0.4055672, -1.363864, 1, 0.827451, 0, 1,
-1.161772, -0.3812775, -1.592831, 1, 0.8352941, 0, 1,
-1.161209, -0.3092563, -3.070259, 1, 0.8392157, 0, 1,
-1.151256, 0.6282286, 0.08764999, 1, 0.8470588, 0, 1,
-1.149769, 1.025045, -0.9637244, 1, 0.8509804, 0, 1,
-1.146542, 0.1952836, -1.823066, 1, 0.8588235, 0, 1,
-1.108128, 0.09542014, -2.011273, 1, 0.8627451, 0, 1,
-1.105672, -0.8062935, -2.899159, 1, 0.8705882, 0, 1,
-1.103033, -0.3727396, -2.846711, 1, 0.8745098, 0, 1,
-1.095187, -2.07428, -4.633615, 1, 0.8823529, 0, 1,
-1.094682, 1.766281, 0.5978984, 1, 0.8862745, 0, 1,
-1.085497, 0.1357711, -1.298774, 1, 0.8941177, 0, 1,
-1.08527, -1.47724, -4.091564, 1, 0.8980392, 0, 1,
-1.076291, -1.061315, -2.979824, 1, 0.9058824, 0, 1,
-1.068685, 0.2906921, -0.6178786, 1, 0.9137255, 0, 1,
-1.061364, 2.062015, -0.4837894, 1, 0.9176471, 0, 1,
-1.053522, 0.3710756, -3.723968, 1, 0.9254902, 0, 1,
-1.049061, -0.8222388, -2.353172, 1, 0.9294118, 0, 1,
-1.048128, -0.5530041, -2.666725, 1, 0.9372549, 0, 1,
-1.047656, -0.9087476, -2.311665, 1, 0.9411765, 0, 1,
-1.04752, -1.649221, -0.8897907, 1, 0.9490196, 0, 1,
-1.04716, -0.5472829, -3.029551, 1, 0.9529412, 0, 1,
-1.044728, -2.492216, -3.622373, 1, 0.9607843, 0, 1,
-1.041049, 0.3164141, -0.6153939, 1, 0.9647059, 0, 1,
-1.036801, 1.310803, -2.4182, 1, 0.972549, 0, 1,
-1.027646, 0.6571835, -1.577384, 1, 0.9764706, 0, 1,
-1.024457, 0.06866276, -0.4904036, 1, 0.9843137, 0, 1,
-1.024266, -0.4633069, -3.46115, 1, 0.9882353, 0, 1,
-1.005519, 0.07387301, -2.802821, 1, 0.9960784, 0, 1,
-1.003879, -0.6721719, -0.8656784, 0.9960784, 1, 0, 1,
-0.9974851, -0.3144929, -2.100948, 0.9921569, 1, 0, 1,
-0.9928112, 0.338192, -2.028215, 0.9843137, 1, 0, 1,
-0.9895386, -1.166847, -2.384474, 0.9803922, 1, 0, 1,
-0.9802193, 0.5740771, -1.212734, 0.972549, 1, 0, 1,
-0.9789022, -0.782808, -1.272568, 0.9686275, 1, 0, 1,
-0.956168, -0.5622962, -1.559247, 0.9607843, 1, 0, 1,
-0.9521968, -1.062781, -1.59747, 0.9568627, 1, 0, 1,
-0.9491143, 0.4540714, -1.996574, 0.9490196, 1, 0, 1,
-0.9418652, -0.7317568, -2.330019, 0.945098, 1, 0, 1,
-0.9365299, -0.03236522, -2.155508, 0.9372549, 1, 0, 1,
-0.9302551, -0.5467038, -3.147139, 0.9333333, 1, 0, 1,
-0.9225254, 0.2591805, -1.981869, 0.9254902, 1, 0, 1,
-0.9198175, -0.4635115, -2.2839, 0.9215686, 1, 0, 1,
-0.9195294, -1.130236, -2.083016, 0.9137255, 1, 0, 1,
-0.9158328, -0.3742222, -0.7250514, 0.9098039, 1, 0, 1,
-0.9133969, 0.1726022, -1.106308, 0.9019608, 1, 0, 1,
-0.9127246, -1.527282, -1.654967, 0.8941177, 1, 0, 1,
-0.9081941, -2.085312, -2.958642, 0.8901961, 1, 0, 1,
-0.9068761, 0.4723933, -2.005853, 0.8823529, 1, 0, 1,
-0.9024652, -0.5418137, -1.508756, 0.8784314, 1, 0, 1,
-0.9006122, -1.455722, -1.557782, 0.8705882, 1, 0, 1,
-0.8999395, 0.4946087, -2.179011, 0.8666667, 1, 0, 1,
-0.892181, -0.5206011, -1.160417, 0.8588235, 1, 0, 1,
-0.8921049, -0.5093517, -1.837462, 0.854902, 1, 0, 1,
-0.8894832, -1.46925, -1.855247, 0.8470588, 1, 0, 1,
-0.8892009, 0.3854639, -1.053649, 0.8431373, 1, 0, 1,
-0.8867819, 0.2889142, -2.350221, 0.8352941, 1, 0, 1,
-0.8853709, 2.061196, -0.4607156, 0.8313726, 1, 0, 1,
-0.8830015, -0.3982064, -0.09408331, 0.8235294, 1, 0, 1,
-0.882705, -0.7782302, -1.271923, 0.8196079, 1, 0, 1,
-0.8806233, -0.6696501, -4.157608, 0.8117647, 1, 0, 1,
-0.8764002, 0.8540042, -0.3340953, 0.8078431, 1, 0, 1,
-0.8670044, 1.630926, -2.176634, 0.8, 1, 0, 1,
-0.859499, -0.09602399, -0.4638982, 0.7921569, 1, 0, 1,
-0.8565326, 1.159736, -2.773259, 0.7882353, 1, 0, 1,
-0.8562014, -1.339225, -3.628251, 0.7803922, 1, 0, 1,
-0.8482324, -0.3696427, -0.488944, 0.7764706, 1, 0, 1,
-0.8480636, 0.5462435, -0.8258842, 0.7686275, 1, 0, 1,
-0.8439809, 1.235814, -2.515589, 0.7647059, 1, 0, 1,
-0.843137, -0.2599184, -1.912592, 0.7568628, 1, 0, 1,
-0.8431315, -0.3195182, -1.467241, 0.7529412, 1, 0, 1,
-0.8415393, -1.811467, -1.172757, 0.7450981, 1, 0, 1,
-0.8350136, -0.1238393, 0.8121082, 0.7411765, 1, 0, 1,
-0.8336497, 1.917766, 0.02726101, 0.7333333, 1, 0, 1,
-0.8295285, -0.5395525, -1.359703, 0.7294118, 1, 0, 1,
-0.8284255, 0.1394214, -0.8036916, 0.7215686, 1, 0, 1,
-0.8271351, 0.2216359, -1.382395, 0.7176471, 1, 0, 1,
-0.8222244, -1.177049, -0.6809745, 0.7098039, 1, 0, 1,
-0.8201544, 0.4323688, -0.1380517, 0.7058824, 1, 0, 1,
-0.8177915, 0.1470669, 0.1798298, 0.6980392, 1, 0, 1,
-0.8177073, 0.9849054, -0.1803073, 0.6901961, 1, 0, 1,
-0.8085275, -1.199145, -3.049807, 0.6862745, 1, 0, 1,
-0.80703, 0.5447654, -2.93209, 0.6784314, 1, 0, 1,
-0.806204, 0.2236647, 0.06109889, 0.6745098, 1, 0, 1,
-0.7978819, -0.5614287, -1.980738, 0.6666667, 1, 0, 1,
-0.794228, -2.316531, -3.572096, 0.6627451, 1, 0, 1,
-0.7930242, 0.2115726, -1.466645, 0.654902, 1, 0, 1,
-0.7900776, -0.233547, -1.389152, 0.6509804, 1, 0, 1,
-0.7892624, 1.178166, -1.668046, 0.6431373, 1, 0, 1,
-0.7795199, 0.02219926, -1.79267, 0.6392157, 1, 0, 1,
-0.768076, 0.2516333, -0.7881643, 0.6313726, 1, 0, 1,
-0.7629475, 1.171829, -0.9305826, 0.627451, 1, 0, 1,
-0.7580733, -0.2422363, -1.010395, 0.6196079, 1, 0, 1,
-0.7524415, -0.683881, -2.610419, 0.6156863, 1, 0, 1,
-0.7486962, 0.8310254, 0.6231997, 0.6078432, 1, 0, 1,
-0.7463296, -0.03854537, -2.405366, 0.6039216, 1, 0, 1,
-0.7447832, -0.2656429, -0.9441152, 0.5960785, 1, 0, 1,
-0.7406874, -1.755611, -2.803627, 0.5882353, 1, 0, 1,
-0.7332351, -0.1462691, -0.05376467, 0.5843138, 1, 0, 1,
-0.7292088, 0.6741436, 0.7268824, 0.5764706, 1, 0, 1,
-0.7226222, -0.4912128, -2.616593, 0.572549, 1, 0, 1,
-0.7194571, 0.153342, 0.7339925, 0.5647059, 1, 0, 1,
-0.7150787, -1.235674, -1.563979, 0.5607843, 1, 0, 1,
-0.7142519, -0.534525, -2.429008, 0.5529412, 1, 0, 1,
-0.7130182, -1.31755, -1.813646, 0.5490196, 1, 0, 1,
-0.7049109, 0.1097544, -0.6115401, 0.5411765, 1, 0, 1,
-0.703223, 0.3681333, -1.25553, 0.5372549, 1, 0, 1,
-0.7029816, 0.3524019, -3.300426, 0.5294118, 1, 0, 1,
-0.6995473, -0.08185698, -1.759309, 0.5254902, 1, 0, 1,
-0.6983003, 1.835847, -2.075359, 0.5176471, 1, 0, 1,
-0.6938121, 0.02116213, -1.588524, 0.5137255, 1, 0, 1,
-0.6904177, 0.1132446, -1.441587, 0.5058824, 1, 0, 1,
-0.6875686, -0.3695228, -1.353912, 0.5019608, 1, 0, 1,
-0.6840386, -1.457435, -1.710869, 0.4941176, 1, 0, 1,
-0.6814348, 0.2512849, -1.302209, 0.4862745, 1, 0, 1,
-0.6780974, -0.1012878, -1.477077, 0.4823529, 1, 0, 1,
-0.6747383, 1.182797, -0.4179747, 0.4745098, 1, 0, 1,
-0.673178, -0.796437, -1.815347, 0.4705882, 1, 0, 1,
-0.6717625, 1.783314, 0.7281984, 0.4627451, 1, 0, 1,
-0.6707035, -1.066203, -1.845197, 0.4588235, 1, 0, 1,
-0.6696157, -0.9328396, -3.659301, 0.4509804, 1, 0, 1,
-0.6692919, -0.643638, -2.733089, 0.4470588, 1, 0, 1,
-0.6648238, 0.9180501, 1.514076, 0.4392157, 1, 0, 1,
-0.6639122, 0.8718929, 0.2529664, 0.4352941, 1, 0, 1,
-0.6576232, 0.2707809, 0.2578925, 0.427451, 1, 0, 1,
-0.6567175, -1.604566, -3.406183, 0.4235294, 1, 0, 1,
-0.6541494, -0.6950113, -4.636007, 0.4156863, 1, 0, 1,
-0.652827, -1.269075, -3.147612, 0.4117647, 1, 0, 1,
-0.6434387, -0.01795024, -1.049766, 0.4039216, 1, 0, 1,
-0.6430908, 1.612026, 0.3661024, 0.3960784, 1, 0, 1,
-0.6402158, 2.72572, -0.5934847, 0.3921569, 1, 0, 1,
-0.6398089, -0.06176938, -2.033897, 0.3843137, 1, 0, 1,
-0.6351588, -0.0551637, -2.274373, 0.3803922, 1, 0, 1,
-0.626265, 0.1601603, -0.5042477, 0.372549, 1, 0, 1,
-0.6246845, -0.1609549, -2.160795, 0.3686275, 1, 0, 1,
-0.6229348, -0.5317482, -1.555367, 0.3607843, 1, 0, 1,
-0.6224405, -0.3324386, -1.683791, 0.3568628, 1, 0, 1,
-0.6114374, -0.9387475, -2.226913, 0.3490196, 1, 0, 1,
-0.6067241, -0.7883886, -2.465421, 0.345098, 1, 0, 1,
-0.6065749, 1.134601, -0.2821917, 0.3372549, 1, 0, 1,
-0.6034714, 0.3681027, -1.901857, 0.3333333, 1, 0, 1,
-0.6022829, -1.881027, -3.174467, 0.3254902, 1, 0, 1,
-0.6021927, -0.5376467, -2.039968, 0.3215686, 1, 0, 1,
-0.5956554, 1.352223, -0.4922759, 0.3137255, 1, 0, 1,
-0.5899693, -0.5996683, -2.052492, 0.3098039, 1, 0, 1,
-0.5861888, -0.3167721, -2.458555, 0.3019608, 1, 0, 1,
-0.5775991, -1.027883, -2.531791, 0.2941177, 1, 0, 1,
-0.5662642, 1.918959, 0.3418371, 0.2901961, 1, 0, 1,
-0.5659386, -1.860094, -3.640074, 0.282353, 1, 0, 1,
-0.5608125, 1.32829, 1.643904, 0.2784314, 1, 0, 1,
-0.5583489, 1.47273, 0.6395434, 0.2705882, 1, 0, 1,
-0.5552641, 1.24548, -0.09874824, 0.2666667, 1, 0, 1,
-0.5478954, 0.8913158, -1.249967, 0.2588235, 1, 0, 1,
-0.5439956, -2.103147, -2.14575, 0.254902, 1, 0, 1,
-0.5429766, 0.5895287, -1.411903, 0.2470588, 1, 0, 1,
-0.5415599, 1.019733, -1.538822, 0.2431373, 1, 0, 1,
-0.5364744, 0.1202517, -1.269359, 0.2352941, 1, 0, 1,
-0.5361429, -0.6368816, -2.131963, 0.2313726, 1, 0, 1,
-0.5343964, 0.3687559, -0.79224, 0.2235294, 1, 0, 1,
-0.5285656, -0.01720564, -3.223145, 0.2196078, 1, 0, 1,
-0.527478, 0.8129427, -2.152961, 0.2117647, 1, 0, 1,
-0.520712, -0.0844038, -1.783492, 0.2078431, 1, 0, 1,
-0.5192397, -1.456119, -4.339692, 0.2, 1, 0, 1,
-0.5133431, 1.493457, -0.3385622, 0.1921569, 1, 0, 1,
-0.5087597, -1.272655, -1.261464, 0.1882353, 1, 0, 1,
-0.506013, 0.3253641, -0.1442968, 0.1803922, 1, 0, 1,
-0.4997467, -0.05253161, -3.041902, 0.1764706, 1, 0, 1,
-0.4964413, 1.950811, -0.1416086, 0.1686275, 1, 0, 1,
-0.4946904, 1.045698, 1.055624, 0.1647059, 1, 0, 1,
-0.4905309, 1.19397, -0.5743842, 0.1568628, 1, 0, 1,
-0.4833596, -0.4063915, -2.32709, 0.1529412, 1, 0, 1,
-0.4720917, 0.6496339, -1.61473, 0.145098, 1, 0, 1,
-0.4707625, -0.2951221, -1.853724, 0.1411765, 1, 0, 1,
-0.4682374, 0.3153096, -1.556138, 0.1333333, 1, 0, 1,
-0.4645456, -0.6346124, -2.932167, 0.1294118, 1, 0, 1,
-0.4635252, 1.004535, -0.7269461, 0.1215686, 1, 0, 1,
-0.4598095, -0.2152561, -4.532292, 0.1176471, 1, 0, 1,
-0.4564616, 2.253334, -0.103712, 0.1098039, 1, 0, 1,
-0.4548359, 1.083711, 0.1464918, 0.1058824, 1, 0, 1,
-0.454732, -0.05206607, -1.577151, 0.09803922, 1, 0, 1,
-0.4540472, -0.7123879, -2.274721, 0.09019608, 1, 0, 1,
-0.4532726, -1.409486, -3.867785, 0.08627451, 1, 0, 1,
-0.4501942, -0.5085247, -1.693619, 0.07843138, 1, 0, 1,
-0.4495488, 0.4894118, -1.010823, 0.07450981, 1, 0, 1,
-0.4445376, -0.3016777, -0.835747, 0.06666667, 1, 0, 1,
-0.4433043, 0.7303298, -1.632127, 0.0627451, 1, 0, 1,
-0.437778, 0.205239, -1.139665, 0.05490196, 1, 0, 1,
-0.4366234, 0.1698104, -1.981977, 0.05098039, 1, 0, 1,
-0.4354653, 0.4259456, -0.2296364, 0.04313726, 1, 0, 1,
-0.4349466, -0.4559065, -2.187646, 0.03921569, 1, 0, 1,
-0.4347803, -0.1975699, -1.6975, 0.03137255, 1, 0, 1,
-0.4273538, -1.19699, -2.520436, 0.02745098, 1, 0, 1,
-0.4255696, 1.639875, -0.8050895, 0.01960784, 1, 0, 1,
-0.4233994, 1.349981, 0.9178448, 0.01568628, 1, 0, 1,
-0.4220276, -0.2500562, -3.079331, 0.007843138, 1, 0, 1,
-0.4218319, -0.8381416, -3.80603, 0.003921569, 1, 0, 1,
-0.417441, 0.8081295, -0.6543783, 0, 1, 0.003921569, 1,
-0.415855, 0.5406008, -0.8908797, 0, 1, 0.01176471, 1,
-0.4133106, 0.6259069, 0.2204013, 0, 1, 0.01568628, 1,
-0.4117081, -3.179438, -4.721457, 0, 1, 0.02352941, 1,
-0.4109564, -0.5770717, -2.240194, 0, 1, 0.02745098, 1,
-0.4107075, 0.2054801, -1.206719, 0, 1, 0.03529412, 1,
-0.4094776, -1.045122, -1.900503, 0, 1, 0.03921569, 1,
-0.4009472, -0.741257, -0.6456234, 0, 1, 0.04705882, 1,
-0.4008172, -0.2230025, -3.726326, 0, 1, 0.05098039, 1,
-0.4002579, -1.183507, -2.568899, 0, 1, 0.05882353, 1,
-0.3931934, 0.1782447, 0.5078396, 0, 1, 0.0627451, 1,
-0.3902892, 0.3493127, 1.931816, 0, 1, 0.07058824, 1,
-0.3798214, 0.8847995, -1.811674, 0, 1, 0.07450981, 1,
-0.3791575, -0.1459548, -2.207652, 0, 1, 0.08235294, 1,
-0.3774782, 0.7535551, 0.5595443, 0, 1, 0.08627451, 1,
-0.3760963, 1.344607, -0.7932121, 0, 1, 0.09411765, 1,
-0.3755549, 2.061407, -1.389, 0, 1, 0.1019608, 1,
-0.3729485, 1.093028, 1.151172, 0, 1, 0.1058824, 1,
-0.370909, 0.4744519, -1.665472, 0, 1, 0.1137255, 1,
-0.3691285, 0.3855398, -1.434777, 0, 1, 0.1176471, 1,
-0.3653038, 0.1151377, 0.8327914, 0, 1, 0.1254902, 1,
-0.364875, -0.5611955, -2.969238, 0, 1, 0.1294118, 1,
-0.3638949, 0.003223701, -2.173679, 0, 1, 0.1372549, 1,
-0.3604015, -1.17299, -3.022164, 0, 1, 0.1411765, 1,
-0.3569148, -0.4038667, -2.172614, 0, 1, 0.1490196, 1,
-0.3526429, 0.4120719, -2.057249, 0, 1, 0.1529412, 1,
-0.3522459, -1.440835, -1.825994, 0, 1, 0.1607843, 1,
-0.3522348, -0.1527401, -1.873685, 0, 1, 0.1647059, 1,
-0.3504283, 0.1096793, -0.3697925, 0, 1, 0.172549, 1,
-0.3468051, 0.5459424, -0.7300217, 0, 1, 0.1764706, 1,
-0.3451076, -0.215041, -3.403748, 0, 1, 0.1843137, 1,
-0.3413104, -0.07701969, -1.140722, 0, 1, 0.1882353, 1,
-0.3355882, -0.002747825, -0.964309, 0, 1, 0.1960784, 1,
-0.335079, 0.1613773, -0.2872337, 0, 1, 0.2039216, 1,
-0.3322949, -0.9384666, -1.143347, 0, 1, 0.2078431, 1,
-0.3238324, -1.248597, -1.836617, 0, 1, 0.2156863, 1,
-0.3229627, -1.548953, -3.249649, 0, 1, 0.2196078, 1,
-0.3195477, 0.5331813, -0.7747129, 0, 1, 0.227451, 1,
-0.3178419, 1.0539, -0.4796234, 0, 1, 0.2313726, 1,
-0.3077842, 2.23597, -1.335111, 0, 1, 0.2392157, 1,
-0.3043235, 0.4077579, -0.5644035, 0, 1, 0.2431373, 1,
-0.3037834, -1.03255, -3.227978, 0, 1, 0.2509804, 1,
-0.3021691, -1.121561, -3.096924, 0, 1, 0.254902, 1,
-0.3016747, -0.7116695, -3.467602, 0, 1, 0.2627451, 1,
-0.2987211, -1.307952, -3.2559, 0, 1, 0.2666667, 1,
-0.2956094, 0.5683653, 0.2240376, 0, 1, 0.2745098, 1,
-0.2953212, 1.309468, -0.934772, 0, 1, 0.2784314, 1,
-0.2919424, -0.7972153, -3.154134, 0, 1, 0.2862745, 1,
-0.2860619, 1.061768, -0.1680044, 0, 1, 0.2901961, 1,
-0.2859682, 0.09835848, -1.471166, 0, 1, 0.2980392, 1,
-0.2836086, 1.490574, -2.08368, 0, 1, 0.3058824, 1,
-0.2818258, 0.5789796, 0.5815399, 0, 1, 0.3098039, 1,
-0.2688475, -0.125346, -2.881331, 0, 1, 0.3176471, 1,
-0.2602759, 0.5660871, -0.4903321, 0, 1, 0.3215686, 1,
-0.258138, -0.5132929, -1.897722, 0, 1, 0.3294118, 1,
-0.2561984, -0.2913688, -2.302418, 0, 1, 0.3333333, 1,
-0.255257, 0.4804421, -0.2325698, 0, 1, 0.3411765, 1,
-0.2532129, 0.2484937, -2.683257, 0, 1, 0.345098, 1,
-0.2475801, 1.243456, 0.3018789, 0, 1, 0.3529412, 1,
-0.2473946, -1.057712, -3.239663, 0, 1, 0.3568628, 1,
-0.2443118, 1.03818, 1.048275, 0, 1, 0.3647059, 1,
-0.2421872, 1.034587, -1.218086, 0, 1, 0.3686275, 1,
-0.2389939, 0.663013, -0.7297702, 0, 1, 0.3764706, 1,
-0.2387738, 0.8426001, -1.132904, 0, 1, 0.3803922, 1,
-0.2381895, -0.4091085, -3.302871, 0, 1, 0.3882353, 1,
-0.2378788, 1.467357, 0.4093097, 0, 1, 0.3921569, 1,
-0.2369896, 0.843485, -0.2392497, 0, 1, 0.4, 1,
-0.234578, -1.137553, -2.884619, 0, 1, 0.4078431, 1,
-0.2340903, -0.2586454, -1.585249, 0, 1, 0.4117647, 1,
-0.2298016, -1.333654, -3.307466, 0, 1, 0.4196078, 1,
-0.2285342, 1.238137, 0.08315719, 0, 1, 0.4235294, 1,
-0.2267913, 0.2200018, -1.020862, 0, 1, 0.4313726, 1,
-0.2265922, -1.282153, -4.02495, 0, 1, 0.4352941, 1,
-0.2189847, 0.8479295, -0.3940424, 0, 1, 0.4431373, 1,
-0.2170779, -0.1059484, -0.3318382, 0, 1, 0.4470588, 1,
-0.2142811, 0.0820369, -2.548639, 0, 1, 0.454902, 1,
-0.2117956, -0.5611125, -3.905727, 0, 1, 0.4588235, 1,
-0.2061597, 1.399873, 1.519997, 0, 1, 0.4666667, 1,
-0.2059328, 0.02695843, 0.4419861, 0, 1, 0.4705882, 1,
-0.2031316, 0.2447426, -0.4251876, 0, 1, 0.4784314, 1,
-0.2030482, 1.798545, -2.395228, 0, 1, 0.4823529, 1,
-0.2023508, 1.455173, 0.6702501, 0, 1, 0.4901961, 1,
-0.2009434, 0.6408043, -0.2806672, 0, 1, 0.4941176, 1,
-0.1943591, 1.856166, 0.5226836, 0, 1, 0.5019608, 1,
-0.190647, -0.2775731, -2.419533, 0, 1, 0.509804, 1,
-0.1905655, 0.07881459, -2.430865, 0, 1, 0.5137255, 1,
-0.1882796, 0.8992066, -1.297441, 0, 1, 0.5215687, 1,
-0.1867718, 1.238865, -2.528105, 0, 1, 0.5254902, 1,
-0.1835936, 0.9938015, -0.1098249, 0, 1, 0.5333334, 1,
-0.17944, 0.3560932, -0.2315459, 0, 1, 0.5372549, 1,
-0.1781136, -0.05954505, -2.388174, 0, 1, 0.5450981, 1,
-0.1776985, 1.935062, 1.473532, 0, 1, 0.5490196, 1,
-0.1649597, 0.9140241, -0.2599943, 0, 1, 0.5568628, 1,
-0.1648061, 0.4076988, -0.06089051, 0, 1, 0.5607843, 1,
-0.1613074, -1.496849, -2.802042, 0, 1, 0.5686275, 1,
-0.1612201, 1.716154, 0.3516535, 0, 1, 0.572549, 1,
-0.1603429, 1.219295, 2.525669, 0, 1, 0.5803922, 1,
-0.1570093, 1.160434, -1.219986, 0, 1, 0.5843138, 1,
-0.1557673, 1.130695, 0.04160373, 0, 1, 0.5921569, 1,
-0.1549454, -0.2962502, -2.166327, 0, 1, 0.5960785, 1,
-0.1546107, 0.9723729, -1.470476, 0, 1, 0.6039216, 1,
-0.1484948, 0.09069748, -2.209735, 0, 1, 0.6117647, 1,
-0.1482499, -1.480823, -2.51313, 0, 1, 0.6156863, 1,
-0.1475079, 0.3031975, -0.2819616, 0, 1, 0.6235294, 1,
-0.1458572, -1.83313, -1.473454, 0, 1, 0.627451, 1,
-0.1438814, 0.2333577, -1.327602, 0, 1, 0.6352941, 1,
-0.1433508, -0.725829, -2.735125, 0, 1, 0.6392157, 1,
-0.1408799, -0.1718971, -1.217057, 0, 1, 0.6470588, 1,
-0.1367706, 0.7874318, -1.146777, 0, 1, 0.6509804, 1,
-0.1302373, -0.7439133, -2.540427, 0, 1, 0.6588235, 1,
-0.1299037, -2.072345, -2.362782, 0, 1, 0.6627451, 1,
-0.1266693, 1.057835, 1.081715, 0, 1, 0.6705883, 1,
-0.1231919, 1.681028, 0.1100542, 0, 1, 0.6745098, 1,
-0.1226232, -0.3254558, -2.155567, 0, 1, 0.682353, 1,
-0.1212838, -0.8147525, -1.829805, 0, 1, 0.6862745, 1,
-0.1174688, -0.6594864, -2.79058, 0, 1, 0.6941177, 1,
-0.115846, -1.909865, -3.09725, 0, 1, 0.7019608, 1,
-0.1128411, 1.480992, -0.4678359, 0, 1, 0.7058824, 1,
-0.1068747, -1.975725, -2.358963, 0, 1, 0.7137255, 1,
-0.1058023, -1.40742, -4.134281, 0, 1, 0.7176471, 1,
-0.1057944, 0.9841611, -0.6944745, 0, 1, 0.7254902, 1,
-0.1020369, 1.51175, 0.815886, 0, 1, 0.7294118, 1,
-0.1002916, 1.110038, -0.5774935, 0, 1, 0.7372549, 1,
-0.09729188, -0.4342373, -3.398918, 0, 1, 0.7411765, 1,
-0.09476119, 0.07806072, 0.7604422, 0, 1, 0.7490196, 1,
-0.09399924, 0.2556669, -0.5310512, 0, 1, 0.7529412, 1,
-0.09076865, 1.193399, -1.472447, 0, 1, 0.7607843, 1,
-0.08746196, 0.2185676, 0.2034614, 0, 1, 0.7647059, 1,
-0.08393089, 2.33275, -0.0590879, 0, 1, 0.772549, 1,
-0.07980002, 0.3908752, 0.3836093, 0, 1, 0.7764706, 1,
-0.0794727, -1.11012, -2.172853, 0, 1, 0.7843137, 1,
-0.07663959, 1.222076, 0.2419769, 0, 1, 0.7882353, 1,
-0.07504147, 0.9087901, 0.957799, 0, 1, 0.7960784, 1,
-0.07182794, 0.3586711, -0.308971, 0, 1, 0.8039216, 1,
-0.07177514, 0.3566638, 0.1153169, 0, 1, 0.8078431, 1,
-0.0697507, -0.2802943, -3.319333, 0, 1, 0.8156863, 1,
-0.06892891, -0.0295291, -2.066765, 0, 1, 0.8196079, 1,
-0.06566056, -0.9749776, -2.543645, 0, 1, 0.827451, 1,
-0.06363486, 0.02523107, -0.8146011, 0, 1, 0.8313726, 1,
-0.06190786, 0.3034293, -0.8725996, 0, 1, 0.8392157, 1,
-0.06001689, -1.187001, -3.109853, 0, 1, 0.8431373, 1,
-0.05689613, -0.9151912, -2.682624, 0, 1, 0.8509804, 1,
-0.04930057, 0.5153803, -0.2804108, 0, 1, 0.854902, 1,
-0.04683932, -0.378924, -5.471477, 0, 1, 0.8627451, 1,
-0.04525096, -1.046648, -2.765116, 0, 1, 0.8666667, 1,
-0.0438558, -0.1605693, -3.664558, 0, 1, 0.8745098, 1,
-0.0427963, -1.525498, -3.061063, 0, 1, 0.8784314, 1,
-0.03951101, -1.286686, -2.614358, 0, 1, 0.8862745, 1,
-0.03893168, 0.3827718, 1.140673, 0, 1, 0.8901961, 1,
-0.03587538, 1.169229, -0.08746725, 0, 1, 0.8980392, 1,
-0.03365175, -2.020906, -2.865341, 0, 1, 0.9058824, 1,
-0.02929485, 0.5368844, 1.483385, 0, 1, 0.9098039, 1,
-0.02627473, 0.096686, -0.03733898, 0, 1, 0.9176471, 1,
-0.02608627, -0.2650444, -4.221945, 0, 1, 0.9215686, 1,
-0.02512344, -0.1445945, -4.003701, 0, 1, 0.9294118, 1,
-0.02352667, -1.036051, -3.088497, 0, 1, 0.9333333, 1,
-0.02211911, -0.4564465, -2.925089, 0, 1, 0.9411765, 1,
-0.02068615, -1.188139, -2.703122, 0, 1, 0.945098, 1,
-0.01619735, -2.648767, -3.518667, 0, 1, 0.9529412, 1,
-0.0113939, 2.657073, -1.422239, 0, 1, 0.9568627, 1,
-0.008845857, 1.225493, 1.724627, 0, 1, 0.9647059, 1,
-0.003778967, 0.01639319, 0.1100272, 0, 1, 0.9686275, 1,
-0.003641448, -1.293408, -3.225911, 0, 1, 0.9764706, 1,
-0.00316696, -0.5552436, -4.30964, 0, 1, 0.9803922, 1,
0.001119798, 0.2496595, 1.956237, 0, 1, 0.9882353, 1,
0.001470438, -0.07385745, 3.690474, 0, 1, 0.9921569, 1,
0.002891523, -1.486981, 3.860744, 0, 1, 1, 1,
0.004460297, 3.508992, 2.144715, 0, 0.9921569, 1, 1,
0.008922113, 0.6996772, -0.7332584, 0, 0.9882353, 1, 1,
0.01278102, 0.7254187, 0.4773052, 0, 0.9803922, 1, 1,
0.01918058, 0.2084762, -0.8837028, 0, 0.9764706, 1, 1,
0.01982932, -0.4918692, 3.451589, 0, 0.9686275, 1, 1,
0.02475817, -1.748111, 2.999021, 0, 0.9647059, 1, 1,
0.02496565, -0.1902303, 1.970842, 0, 0.9568627, 1, 1,
0.02618559, -2.08103, 3.984515, 0, 0.9529412, 1, 1,
0.02704766, 0.3769222, 1.498121, 0, 0.945098, 1, 1,
0.02797035, -0.9927022, 5.923276, 0, 0.9411765, 1, 1,
0.03245115, -1.052121, 2.316806, 0, 0.9333333, 1, 1,
0.03488135, -0.8130701, 1.819808, 0, 0.9294118, 1, 1,
0.03620673, -0.4461325, 2.162422, 0, 0.9215686, 1, 1,
0.03689887, -0.02991007, 0.9642825, 0, 0.9176471, 1, 1,
0.03739418, -1.404553, 3.892015, 0, 0.9098039, 1, 1,
0.03831141, 0.41288, 0.4404804, 0, 0.9058824, 1, 1,
0.03853063, -0.293786, 4.201961, 0, 0.8980392, 1, 1,
0.039538, 0.2964064, 0.3012525, 0, 0.8901961, 1, 1,
0.04646098, 2.004851, 0.111522, 0, 0.8862745, 1, 1,
0.05011175, 0.4736307, 0.09942455, 0, 0.8784314, 1, 1,
0.0515797, 0.02660608, 1.071717, 0, 0.8745098, 1, 1,
0.05376081, -0.6151622, 5.160132, 0, 0.8666667, 1, 1,
0.05632543, -1.383083, 3.933728, 0, 0.8627451, 1, 1,
0.0574462, 1.307036, -0.7474833, 0, 0.854902, 1, 1,
0.0618315, 0.7570467, -0.1343147, 0, 0.8509804, 1, 1,
0.06897765, 0.3056152, 1.610111, 0, 0.8431373, 1, 1,
0.07367556, 0.01829487, 1.282316, 0, 0.8392157, 1, 1,
0.07428653, 0.5149588, -0.8884779, 0, 0.8313726, 1, 1,
0.07659648, 1.023116, -0.9764076, 0, 0.827451, 1, 1,
0.07823116, 0.7537796, -1.158368, 0, 0.8196079, 1, 1,
0.07855583, -0.2548444, 2.319077, 0, 0.8156863, 1, 1,
0.07908638, 1.875615, 0.7185881, 0, 0.8078431, 1, 1,
0.07914385, -0.2619299, 3.332789, 0, 0.8039216, 1, 1,
0.08053133, -0.7084011, 4.595788, 0, 0.7960784, 1, 1,
0.08316094, 0.7731211, -0.4471054, 0, 0.7882353, 1, 1,
0.08340155, 0.2404821, 0.7552436, 0, 0.7843137, 1, 1,
0.08368298, -0.2034283, 3.387346, 0, 0.7764706, 1, 1,
0.08959239, -0.8207594, 2.744994, 0, 0.772549, 1, 1,
0.09097876, 1.084623, 0.5329549, 0, 0.7647059, 1, 1,
0.09106901, -1.464099, 2.76223, 0, 0.7607843, 1, 1,
0.09194982, 0.1317763, 1.824514, 0, 0.7529412, 1, 1,
0.09232821, -0.1928059, 4.098356, 0, 0.7490196, 1, 1,
0.09583437, -0.7512833, 3.290475, 0, 0.7411765, 1, 1,
0.09743099, 0.7690485, -0.8149068, 0, 0.7372549, 1, 1,
0.1009704, -0.1463016, 2.486747, 0, 0.7294118, 1, 1,
0.1031432, 0.07200809, 0.9899911, 0, 0.7254902, 1, 1,
0.112299, 1.216721, 2.042552, 0, 0.7176471, 1, 1,
0.1135327, -0.4045219, 2.841485, 0, 0.7137255, 1, 1,
0.1179926, -1.051621, 3.121372, 0, 0.7058824, 1, 1,
0.1182702, 0.1277682, 2.668847, 0, 0.6980392, 1, 1,
0.1184574, 0.2253139, 0.7617143, 0, 0.6941177, 1, 1,
0.1189234, -0.1804262, 2.415483, 0, 0.6862745, 1, 1,
0.1236735, 0.2750048, 1.633094, 0, 0.682353, 1, 1,
0.123985, -0.4371716, 2.244264, 0, 0.6745098, 1, 1,
0.1261894, 0.5079648, -0.05790005, 0, 0.6705883, 1, 1,
0.1273144, -1.809729, 2.682897, 0, 0.6627451, 1, 1,
0.1299407, -0.6442124, 1.691566, 0, 0.6588235, 1, 1,
0.1331861, -0.4588273, 2.382351, 0, 0.6509804, 1, 1,
0.1348948, -2.34481, 3.035691, 0, 0.6470588, 1, 1,
0.1363093, -0.8249914, 1.607164, 0, 0.6392157, 1, 1,
0.1386018, -0.4664027, 1.5584, 0, 0.6352941, 1, 1,
0.1415335, 0.1894782, -0.7415981, 0, 0.627451, 1, 1,
0.1440332, -1.344002, 4.402259, 0, 0.6235294, 1, 1,
0.1519113, -0.8439288, 1.244619, 0, 0.6156863, 1, 1,
0.152133, 0.5789608, 0.5199798, 0, 0.6117647, 1, 1,
0.1533448, -0.5678049, 3.533469, 0, 0.6039216, 1, 1,
0.1536473, -1.660105, 3.71648, 0, 0.5960785, 1, 1,
0.1540423, -0.4397727, 0.8929054, 0, 0.5921569, 1, 1,
0.1540596, 0.2523846, 0.8414505, 0, 0.5843138, 1, 1,
0.1559218, 0.9381261, -0.1760422, 0, 0.5803922, 1, 1,
0.1613615, 0.3030457, 2.146987, 0, 0.572549, 1, 1,
0.1629863, 0.07914739, 0.98897, 0, 0.5686275, 1, 1,
0.1652842, 0.9999048, 0.8499072, 0, 0.5607843, 1, 1,
0.1694613, -2.763693, 4.936956, 0, 0.5568628, 1, 1,
0.1757666, -0.3125173, 3.470823, 0, 0.5490196, 1, 1,
0.1766024, 0.8006629, -0.7516344, 0, 0.5450981, 1, 1,
0.177463, 0.2952663, 0.8589528, 0, 0.5372549, 1, 1,
0.1775468, 0.5316536, -1.533056, 0, 0.5333334, 1, 1,
0.1788132, -0.1642028, 2.707623, 0, 0.5254902, 1, 1,
0.1818146, -1.520259, 3.155487, 0, 0.5215687, 1, 1,
0.1841648, 0.4003346, 1.260602, 0, 0.5137255, 1, 1,
0.1847965, 1.234903, 0.2925689, 0, 0.509804, 1, 1,
0.1874102, -1.448089, 2.506173, 0, 0.5019608, 1, 1,
0.1896958, 0.3522935, -0.206957, 0, 0.4941176, 1, 1,
0.2010309, 0.3782287, 0.9853403, 0, 0.4901961, 1, 1,
0.2017585, -0.6272503, 2.949884, 0, 0.4823529, 1, 1,
0.2130263, -0.4661332, 1.442578, 0, 0.4784314, 1, 1,
0.2206633, -0.09557024, 1.184581, 0, 0.4705882, 1, 1,
0.2249583, 0.8343567, 0.02940197, 0, 0.4666667, 1, 1,
0.2305715, -0.8605486, 4.434238, 0, 0.4588235, 1, 1,
0.232254, 1.343889, -0.05903218, 0, 0.454902, 1, 1,
0.2353429, 0.9028262, -0.6927529, 0, 0.4470588, 1, 1,
0.2408024, -0.09390463, 2.732033, 0, 0.4431373, 1, 1,
0.241615, -0.7636566, 2.040358, 0, 0.4352941, 1, 1,
0.2436731, 1.11315, 1.561211, 0, 0.4313726, 1, 1,
0.2510177, 1.2144, 1.26561, 0, 0.4235294, 1, 1,
0.2528951, -0.3344353, 2.791213, 0, 0.4196078, 1, 1,
0.2579202, 2.131675, 2.285392, 0, 0.4117647, 1, 1,
0.2599865, -0.1905673, 1.688628, 0, 0.4078431, 1, 1,
0.2608468, 0.7285102, 1.61066, 0, 0.4, 1, 1,
0.2633373, -0.806743, 2.8072, 0, 0.3921569, 1, 1,
0.2657803, -0.9140913, 3.045283, 0, 0.3882353, 1, 1,
0.2668608, 2.284223, -0.2771484, 0, 0.3803922, 1, 1,
0.2728435, 1.944992, -0.1636008, 0, 0.3764706, 1, 1,
0.274652, -0.707121, 1.46873, 0, 0.3686275, 1, 1,
0.2827833, 0.9831967, 1.504816, 0, 0.3647059, 1, 1,
0.2831019, -0.7353929, 4.822522, 0, 0.3568628, 1, 1,
0.2865115, 2.556743, 0.4953932, 0, 0.3529412, 1, 1,
0.2879372, 0.2070809, 2.205262, 0, 0.345098, 1, 1,
0.2891239, -0.2803576, 0.8373707, 0, 0.3411765, 1, 1,
0.2902137, 1.371409, 0.4075769, 0, 0.3333333, 1, 1,
0.2945302, 0.6847848, 1.074311, 0, 0.3294118, 1, 1,
0.2945339, -1.548237, 2.833374, 0, 0.3215686, 1, 1,
0.2969453, -0.6722232, 3.591697, 0, 0.3176471, 1, 1,
0.2997756, -1.050581, 2.697989, 0, 0.3098039, 1, 1,
0.3022819, -1.097123, 3.352434, 0, 0.3058824, 1, 1,
0.3049826, 0.1858909, -0.08858062, 0, 0.2980392, 1, 1,
0.30734, -0.2443069, 2.184536, 0, 0.2901961, 1, 1,
0.3117063, -0.2857729, 2.956179, 0, 0.2862745, 1, 1,
0.3193572, -1.391634, 1.243794, 0, 0.2784314, 1, 1,
0.3275913, -0.7482494, 2.58361, 0, 0.2745098, 1, 1,
0.3286901, -0.6394523, 3.65279, 0, 0.2666667, 1, 1,
0.333333, 0.1839171, 0.04730509, 0, 0.2627451, 1, 1,
0.3349424, -0.03673147, 1.392892, 0, 0.254902, 1, 1,
0.336034, -1.379648, 1.456982, 0, 0.2509804, 1, 1,
0.3365653, 0.5919177, 1.220387, 0, 0.2431373, 1, 1,
0.3396233, -0.3799205, 3.314853, 0, 0.2392157, 1, 1,
0.3416058, -1.19139, 3.475587, 0, 0.2313726, 1, 1,
0.3427623, 2.09552, 0.8408638, 0, 0.227451, 1, 1,
0.3433746, -0.03458839, 0.3133503, 0, 0.2196078, 1, 1,
0.3527198, -2.122153, 1.797288, 0, 0.2156863, 1, 1,
0.3630088, -1.12565, 3.206811, 0, 0.2078431, 1, 1,
0.372354, 1.792931, -1.556234, 0, 0.2039216, 1, 1,
0.3726743, 1.069928, 0.5803472, 0, 0.1960784, 1, 1,
0.3734663, -2.159955, 2.186387, 0, 0.1882353, 1, 1,
0.374956, -0.4474112, 0.8149684, 0, 0.1843137, 1, 1,
0.3766667, -0.16182, 2.905651, 0, 0.1764706, 1, 1,
0.3838204, -0.6673611, 4.013813, 0, 0.172549, 1, 1,
0.3885516, -0.03111251, 1.996816, 0, 0.1647059, 1, 1,
0.3897161, -0.5261427, 4.104737, 0, 0.1607843, 1, 1,
0.3928981, -0.05364754, 3.711668, 0, 0.1529412, 1, 1,
0.3929042, 0.3248842, 1.201814, 0, 0.1490196, 1, 1,
0.3955503, 0.08523282, -0.231161, 0, 0.1411765, 1, 1,
0.4083576, 0.4047093, 1.803964, 0, 0.1372549, 1, 1,
0.4143184, -0.5252733, 1.794917, 0, 0.1294118, 1, 1,
0.4160669, -1.30038, 3.199878, 0, 0.1254902, 1, 1,
0.419158, -1.160818, 4.378844, 0, 0.1176471, 1, 1,
0.4192097, -1.700167, 2.112501, 0, 0.1137255, 1, 1,
0.4216036, 0.2871355, 0.7352729, 0, 0.1058824, 1, 1,
0.4254043, 0.005629059, 0.8504273, 0, 0.09803922, 1, 1,
0.4270351, -0.4758317, 2.927251, 0, 0.09411765, 1, 1,
0.4355697, -2.161368, 3.58317, 0, 0.08627451, 1, 1,
0.4402676, -1.055661, 1.822098, 0, 0.08235294, 1, 1,
0.4406865, 0.9412105, 1.394852, 0, 0.07450981, 1, 1,
0.4497102, -2.076291, 2.885405, 0, 0.07058824, 1, 1,
0.4503464, -0.575695, 3.497035, 0, 0.0627451, 1, 1,
0.4503685, 1.039717, -0.2862178, 0, 0.05882353, 1, 1,
0.4506421, -0.5470012, 3.061199, 0, 0.05098039, 1, 1,
0.4514785, -2.487793, 1.204323, 0, 0.04705882, 1, 1,
0.4548942, -1.375544, 1.305762, 0, 0.03921569, 1, 1,
0.4551098, 0.8117083, -0.194388, 0, 0.03529412, 1, 1,
0.4584907, 0.2511216, 0.2942068, 0, 0.02745098, 1, 1,
0.4610135, 2.811121, 0.5887393, 0, 0.02352941, 1, 1,
0.4683, -0.05146648, 2.741934, 0, 0.01568628, 1, 1,
0.4703166, 1.097489, -2.049159, 0, 0.01176471, 1, 1,
0.4722447, -1.230423, 2.676691, 0, 0.003921569, 1, 1,
0.4723731, 0.4400726, 1.155544, 0.003921569, 0, 1, 1,
0.4759989, 0.7986683, 1.3046, 0.007843138, 0, 1, 1,
0.4762886, -1.037195, 3.106285, 0.01568628, 0, 1, 1,
0.4792829, 0.5257079, -0.08099524, 0.01960784, 0, 1, 1,
0.4795225, 0.9666114, 0.4064699, 0.02745098, 0, 1, 1,
0.4887961, 0.3220091, 1.511591, 0.03137255, 0, 1, 1,
0.4926484, 0.7634568, 0.0777593, 0.03921569, 0, 1, 1,
0.4934593, -0.7714787, 3.024933, 0.04313726, 0, 1, 1,
0.498847, 0.1858011, 2.533133, 0.05098039, 0, 1, 1,
0.5013576, -0.4079743, 0.5188688, 0.05490196, 0, 1, 1,
0.501987, -1.451655, 4.324647, 0.0627451, 0, 1, 1,
0.5055475, 1.010549, 0.5042092, 0.06666667, 0, 1, 1,
0.5063537, -0.05653851, 2.651644, 0.07450981, 0, 1, 1,
0.511529, -0.4747191, 2.341321, 0.07843138, 0, 1, 1,
0.5118986, 1.425249, -0.802242, 0.08627451, 0, 1, 1,
0.5146543, 0.582083, 0.9676784, 0.09019608, 0, 1, 1,
0.5210229, 1.095088, -0.4974979, 0.09803922, 0, 1, 1,
0.5216601, 0.8956114, 1.347891, 0.1058824, 0, 1, 1,
0.5236635, 0.06868379, 1.742448, 0.1098039, 0, 1, 1,
0.5246266, -0.9433314, 3.072209, 0.1176471, 0, 1, 1,
0.5260715, -1.332789, 2.170753, 0.1215686, 0, 1, 1,
0.5280393, -1.017182, 2.268077, 0.1294118, 0, 1, 1,
0.5318078, -0.8047988, 2.413082, 0.1333333, 0, 1, 1,
0.5396875, 0.966858, 0.391726, 0.1411765, 0, 1, 1,
0.5406569, 1.387994, 0.5494129, 0.145098, 0, 1, 1,
0.5424942, -1.817294, 1.954965, 0.1529412, 0, 1, 1,
0.5467831, -0.1542964, 2.072388, 0.1568628, 0, 1, 1,
0.5474317, 2.690948, 0.1845531, 0.1647059, 0, 1, 1,
0.5550053, 1.157594, 1.483205, 0.1686275, 0, 1, 1,
0.5553532, -0.3163773, 0.06594036, 0.1764706, 0, 1, 1,
0.5610204, -1.080768, 2.069813, 0.1803922, 0, 1, 1,
0.561669, 0.1701322, 0.7792453, 0.1882353, 0, 1, 1,
0.5620653, -1.48711, -0.1754187, 0.1921569, 0, 1, 1,
0.563737, 0.3321097, -0.6304408, 0.2, 0, 1, 1,
0.5672397, -3.036854, 2.417091, 0.2078431, 0, 1, 1,
0.567566, -1.769627, 3.71108, 0.2117647, 0, 1, 1,
0.5681677, 0.5089502, 0.364251, 0.2196078, 0, 1, 1,
0.5720528, 0.2794107, -1.43912, 0.2235294, 0, 1, 1,
0.5754265, -0.597428, 2.120286, 0.2313726, 0, 1, 1,
0.5761241, 1.804424, 0.3325593, 0.2352941, 0, 1, 1,
0.5765409, -0.7645975, 1.256016, 0.2431373, 0, 1, 1,
0.580303, 0.320913, 3.166179, 0.2470588, 0, 1, 1,
0.5824504, -0.01672258, 2.938144, 0.254902, 0, 1, 1,
0.5844319, 0.09606445, 2.233448, 0.2588235, 0, 1, 1,
0.5849386, 1.648306, -0.3621601, 0.2666667, 0, 1, 1,
0.5851319, -2.095163, 1.900866, 0.2705882, 0, 1, 1,
0.5924711, -1.826783, 4.209404, 0.2784314, 0, 1, 1,
0.5980113, -2.294977, 3.044316, 0.282353, 0, 1, 1,
0.5997755, 1.110211, 1.594428, 0.2901961, 0, 1, 1,
0.6005948, 0.5143307, 0.1983777, 0.2941177, 0, 1, 1,
0.6025265, -1.131157, 0.3319308, 0.3019608, 0, 1, 1,
0.6088312, 0.09872608, 0.3386442, 0.3098039, 0, 1, 1,
0.6093011, 0.3715166, 0.7757186, 0.3137255, 0, 1, 1,
0.6124009, 1.100657, 1.779356, 0.3215686, 0, 1, 1,
0.6160894, 0.8922032, -0.1576549, 0.3254902, 0, 1, 1,
0.617498, -1.322102, 4.110889, 0.3333333, 0, 1, 1,
0.6177546, -1.89944, 3.548477, 0.3372549, 0, 1, 1,
0.6204581, 0.8439355, 1.301851, 0.345098, 0, 1, 1,
0.6212306, 1.4495, 0.5890041, 0.3490196, 0, 1, 1,
0.6224626, -0.3694938, 3.341504, 0.3568628, 0, 1, 1,
0.6252748, 0.6748208, 2.31199, 0.3607843, 0, 1, 1,
0.625411, 0.8821928, -0.8227397, 0.3686275, 0, 1, 1,
0.6259609, 1.226738, -0.5526792, 0.372549, 0, 1, 1,
0.6279859, 0.8004532, 0.2731735, 0.3803922, 0, 1, 1,
0.6360171, 1.646978, -1.4798, 0.3843137, 0, 1, 1,
0.6432723, -1.980225, 2.419675, 0.3921569, 0, 1, 1,
0.6438435, 0.2849639, 0.5453421, 0.3960784, 0, 1, 1,
0.6512575, -0.5966221, 4.206967, 0.4039216, 0, 1, 1,
0.6544492, -0.6083131, 3.558599, 0.4117647, 0, 1, 1,
0.6579759, -1.227832, 4.632836, 0.4156863, 0, 1, 1,
0.6589726, -0.170602, 2.744192, 0.4235294, 0, 1, 1,
0.6592222, -1.775515, 1.50584, 0.427451, 0, 1, 1,
0.6628188, 0.0182282, 0.4121756, 0.4352941, 0, 1, 1,
0.6663899, 2.039243, 0.3293626, 0.4392157, 0, 1, 1,
0.6688977, -2.333635, 1.955518, 0.4470588, 0, 1, 1,
0.6777322, -0.2230911, 1.526015, 0.4509804, 0, 1, 1,
0.6802486, -0.8679529, 1.105086, 0.4588235, 0, 1, 1,
0.6804113, 0.03887798, 1.762196, 0.4627451, 0, 1, 1,
0.6807953, -0.02854845, 1.641654, 0.4705882, 0, 1, 1,
0.6843475, -0.4263311, 1.499473, 0.4745098, 0, 1, 1,
0.6859474, 1.024754, 1.943703, 0.4823529, 0, 1, 1,
0.6889398, 0.8023891, 0.09537223, 0.4862745, 0, 1, 1,
0.6986271, -1.04358, 3.731565, 0.4941176, 0, 1, 1,
0.7076771, -0.6493582, 2.497556, 0.5019608, 0, 1, 1,
0.7116217, 0.4387374, 0.1235659, 0.5058824, 0, 1, 1,
0.7149409, 0.8838049, 0.1883305, 0.5137255, 0, 1, 1,
0.7153046, 1.397445, 0.9510208, 0.5176471, 0, 1, 1,
0.7175261, -0.4512585, 3.502715, 0.5254902, 0, 1, 1,
0.7251818, -1.43614, 2.523861, 0.5294118, 0, 1, 1,
0.7268742, -0.2245508, 1.629585, 0.5372549, 0, 1, 1,
0.7284999, -0.3416206, 0.5612274, 0.5411765, 0, 1, 1,
0.7361612, 1.804924, -1.424981, 0.5490196, 0, 1, 1,
0.7400731, -1.506111, 3.013265, 0.5529412, 0, 1, 1,
0.7407972, -1.398779, 3.405442, 0.5607843, 0, 1, 1,
0.7426856, -0.1441215, 1.566702, 0.5647059, 0, 1, 1,
0.7453351, 0.5451738, 0.6347312, 0.572549, 0, 1, 1,
0.7537264, 0.4629008, -0.4327478, 0.5764706, 0, 1, 1,
0.756751, 0.9193859, 2.611766, 0.5843138, 0, 1, 1,
0.7587594, -0.3469707, 1.5634, 0.5882353, 0, 1, 1,
0.7628125, 0.2465669, 0.1951158, 0.5960785, 0, 1, 1,
0.7632351, 1.158866, 1.316964, 0.6039216, 0, 1, 1,
0.7655808, 0.8720201, 0.4168725, 0.6078432, 0, 1, 1,
0.7683693, 0.3620968, 1.733203, 0.6156863, 0, 1, 1,
0.7691736, -0.9101825, 2.900349, 0.6196079, 0, 1, 1,
0.7760637, 0.2865651, 1.270979, 0.627451, 0, 1, 1,
0.7779864, 0.05001245, 1.227851, 0.6313726, 0, 1, 1,
0.7783917, -1.40919, 1.686139, 0.6392157, 0, 1, 1,
0.7842131, -0.4328808, 1.55978, 0.6431373, 0, 1, 1,
0.7853624, -0.7171147, 2.753395, 0.6509804, 0, 1, 1,
0.7861443, -0.1455343, 1.421069, 0.654902, 0, 1, 1,
0.7866641, 0.4608203, 1.808249, 0.6627451, 0, 1, 1,
0.7879608, 0.3082983, 2.750194, 0.6666667, 0, 1, 1,
0.7918226, -0.2540522, 1.857415, 0.6745098, 0, 1, 1,
0.7926829, -0.8835533, 0.3145662, 0.6784314, 0, 1, 1,
0.7981256, -0.2592527, 1.544906, 0.6862745, 0, 1, 1,
0.799028, 1.256358, 0.4545223, 0.6901961, 0, 1, 1,
0.7990533, -0.5357932, 2.421283, 0.6980392, 0, 1, 1,
0.8006817, -0.4983627, 1.790852, 0.7058824, 0, 1, 1,
0.8013994, -0.1722992, 1.623081, 0.7098039, 0, 1, 1,
0.8020648, -1.425984, 3.359569, 0.7176471, 0, 1, 1,
0.8045087, 0.1406188, 0.05471244, 0.7215686, 0, 1, 1,
0.807228, -0.1013558, 2.527061, 0.7294118, 0, 1, 1,
0.8072968, -0.2587527, 0.4557495, 0.7333333, 0, 1, 1,
0.8094147, -0.2177127, 3.234577, 0.7411765, 0, 1, 1,
0.8173453, -1.569544, 2.493498, 0.7450981, 0, 1, 1,
0.8257514, 1.26463, 0.195771, 0.7529412, 0, 1, 1,
0.8277814, -0.8579178, 0.954091, 0.7568628, 0, 1, 1,
0.8381177, 0.4474664, 2.608714, 0.7647059, 0, 1, 1,
0.8436272, -0.3462572, 3.046536, 0.7686275, 0, 1, 1,
0.8538503, -0.1401096, 2.582253, 0.7764706, 0, 1, 1,
0.8547161, 0.1514298, 2.059145, 0.7803922, 0, 1, 1,
0.8549837, -0.7645779, 2.004474, 0.7882353, 0, 1, 1,
0.8565854, 1.900004, 2.84648, 0.7921569, 0, 1, 1,
0.8587893, -0.9238691, 2.932931, 0.8, 0, 1, 1,
0.8658099, 0.05696412, 2.438355, 0.8078431, 0, 1, 1,
0.8789445, -0.1707896, 2.011896, 0.8117647, 0, 1, 1,
0.8793616, -1.362205, 2.194167, 0.8196079, 0, 1, 1,
0.8921009, -1.104538, 1.471877, 0.8235294, 0, 1, 1,
0.8931087, -1.19117, 3.692798, 0.8313726, 0, 1, 1,
0.894709, 0.3666652, 0.970128, 0.8352941, 0, 1, 1,
0.8949466, 0.8414176, 1.236101, 0.8431373, 0, 1, 1,
0.903185, 0.4241495, 0.8158481, 0.8470588, 0, 1, 1,
0.907729, -0.5693625, 1.676703, 0.854902, 0, 1, 1,
0.9118066, 0.3289697, 0.7664046, 0.8588235, 0, 1, 1,
0.9131407, 1.19559, 0.08742142, 0.8666667, 0, 1, 1,
0.9178547, 1.334881, 2.863857, 0.8705882, 0, 1, 1,
0.9291509, -1.085628, 2.521217, 0.8784314, 0, 1, 1,
0.9292825, -0.5246711, 1.710978, 0.8823529, 0, 1, 1,
0.9311094, 1.157568, 1.578569, 0.8901961, 0, 1, 1,
0.9314896, 0.9040357, -0.03880573, 0.8941177, 0, 1, 1,
0.9316443, -0.7646692, 1.733127, 0.9019608, 0, 1, 1,
0.9353235, -0.6821768, 1.705304, 0.9098039, 0, 1, 1,
0.9369572, 1.06678, 0.2866575, 0.9137255, 0, 1, 1,
0.943847, 2.064448, -1.387671, 0.9215686, 0, 1, 1,
0.9453182, -0.7774608, 2.225186, 0.9254902, 0, 1, 1,
0.9477456, 3.270239, 0.3119014, 0.9333333, 0, 1, 1,
0.9504783, -0.08456659, 2.539273, 0.9372549, 0, 1, 1,
0.9527261, -0.05981141, 1.367525, 0.945098, 0, 1, 1,
0.9529663, 0.286038, 1.76235, 0.9490196, 0, 1, 1,
0.9597838, 0.5616952, 1.861208, 0.9568627, 0, 1, 1,
0.961971, 0.07560924, 1.522331, 0.9607843, 0, 1, 1,
0.9748583, -1.037902, 1.949203, 0.9686275, 0, 1, 1,
0.9752297, 2.927867, 0.03854236, 0.972549, 0, 1, 1,
0.9814665, 0.05200531, 1.847917, 0.9803922, 0, 1, 1,
0.984104, -0.7959059, 0.9318872, 0.9843137, 0, 1, 1,
0.9879832, 2.582809, -0.3631471, 0.9921569, 0, 1, 1,
0.9950906, -0.2173209, 2.854969, 0.9960784, 0, 1, 1,
1.000836, -0.2737425, 0.5289956, 1, 0, 0.9960784, 1,
1.00207, 0.2536248, 2.264225, 1, 0, 0.9882353, 1,
1.002338, -0.5262213, 1.531923, 1, 0, 0.9843137, 1,
1.00371, 0.6954256, 0.223649, 1, 0, 0.9764706, 1,
1.016864, -0.3383713, 1.802774, 1, 0, 0.972549, 1,
1.017393, -0.8336757, 2.638537, 1, 0, 0.9647059, 1,
1.020491, -1.1119, 1.896659, 1, 0, 0.9607843, 1,
1.031971, 1.225597, 0.8788695, 1, 0, 0.9529412, 1,
1.039326, -0.3184548, 1.55952, 1, 0, 0.9490196, 1,
1.039834, 0.9990724, -1.015543, 1, 0, 0.9411765, 1,
1.041873, -0.5478017, 1.745579, 1, 0, 0.9372549, 1,
1.041925, 0.2721249, 1.003403, 1, 0, 0.9294118, 1,
1.050102, 0.9653525, 2.072244, 1, 0, 0.9254902, 1,
1.057266, 1.42579, 2.091608, 1, 0, 0.9176471, 1,
1.066204, 0.6469548, 2.63698, 1, 0, 0.9137255, 1,
1.068124, 0.5851631, 1.757224, 1, 0, 0.9058824, 1,
1.070319, 0.322899, 1.761201, 1, 0, 0.9019608, 1,
1.071454, -0.3142048, 2.36569, 1, 0, 0.8941177, 1,
1.080679, -0.7150565, 2.122542, 1, 0, 0.8862745, 1,
1.080857, 0.1155889, 0.3156231, 1, 0, 0.8823529, 1,
1.081946, 0.8957765, 1.72456, 1, 0, 0.8745098, 1,
1.083133, 0.03860642, 1.932465, 1, 0, 0.8705882, 1,
1.08428, -0.1338026, 3.211281, 1, 0, 0.8627451, 1,
1.091596, -0.6836469, 1.237965, 1, 0, 0.8588235, 1,
1.096637, -0.7160147, 1.506638, 1, 0, 0.8509804, 1,
1.101553, 0.3191636, 0.09718899, 1, 0, 0.8470588, 1,
1.104748, 0.9102319, 3.486756, 1, 0, 0.8392157, 1,
1.106133, -0.3332064, 1.856356, 1, 0, 0.8352941, 1,
1.114017, -0.8415161, 2.492003, 1, 0, 0.827451, 1,
1.115631, 0.865455, 1.891578, 1, 0, 0.8235294, 1,
1.116782, -0.1241605, 0.5212898, 1, 0, 0.8156863, 1,
1.117782, -0.3823186, 2.637775, 1, 0, 0.8117647, 1,
1.119809, -0.7311811, 1.936798, 1, 0, 0.8039216, 1,
1.12967, -0.05269648, 1.33972, 1, 0, 0.7960784, 1,
1.140663, 1.450879, 0.8526073, 1, 0, 0.7921569, 1,
1.149096, -2.292958, 2.802144, 1, 0, 0.7843137, 1,
1.154909, 0.2512255, 2.741232, 1, 0, 0.7803922, 1,
1.16334, 0.4558852, 0.1500446, 1, 0, 0.772549, 1,
1.164065, 2.330019, -3.167468, 1, 0, 0.7686275, 1,
1.169664, 0.3964857, 0.3201727, 1, 0, 0.7607843, 1,
1.174808, -0.07388137, 0.2238591, 1, 0, 0.7568628, 1,
1.184142, 0.8610941, 1.239262, 1, 0, 0.7490196, 1,
1.186118, 0.7029076, 1.432336, 1, 0, 0.7450981, 1,
1.188364, -0.9098307, 2.64354, 1, 0, 0.7372549, 1,
1.191513, -0.809011, 1.518399, 1, 0, 0.7333333, 1,
1.191719, -0.9351379, 3.409152, 1, 0, 0.7254902, 1,
1.192531, 0.6532872, 0.8885564, 1, 0, 0.7215686, 1,
1.208127, -0.8769969, 0.9317563, 1, 0, 0.7137255, 1,
1.209148, -0.1679665, 0.2912004, 1, 0, 0.7098039, 1,
1.212845, 1.783995, -0.5578108, 1, 0, 0.7019608, 1,
1.214816, 0.07471958, 0.7889768, 1, 0, 0.6941177, 1,
1.226257, 0.4443918, 0.4563067, 1, 0, 0.6901961, 1,
1.226897, 0.05899727, 3.333524, 1, 0, 0.682353, 1,
1.228594, -0.1720282, 2.305653, 1, 0, 0.6784314, 1,
1.232553, 0.7386787, 1.58233, 1, 0, 0.6705883, 1,
1.238728, -1.194438, 3.660361, 1, 0, 0.6666667, 1,
1.252186, -0.8380236, 1.184575, 1, 0, 0.6588235, 1,
1.253237, -0.8240197, 3.060042, 1, 0, 0.654902, 1,
1.255603, 0.5238813, 0.3982566, 1, 0, 0.6470588, 1,
1.257348, -0.538641, 2.008056, 1, 0, 0.6431373, 1,
1.257812, -0.5589516, 1.591365, 1, 0, 0.6352941, 1,
1.258041, -0.373504, 1.738008, 1, 0, 0.6313726, 1,
1.258503, 0.1058515, -0.5906017, 1, 0, 0.6235294, 1,
1.261203, -0.9854257, 1.952953, 1, 0, 0.6196079, 1,
1.264341, -0.3542985, 1.369854, 1, 0, 0.6117647, 1,
1.266316, 0.6183952, 1.024492, 1, 0, 0.6078432, 1,
1.273345, 0.961042, 0.1426082, 1, 0, 0.6, 1,
1.278012, -0.2945711, 1.949219, 1, 0, 0.5921569, 1,
1.289124, -0.6177406, 1.055452, 1, 0, 0.5882353, 1,
1.291599, -0.662789, 0.2886842, 1, 0, 0.5803922, 1,
1.29226, 0.2154381, 1.042493, 1, 0, 0.5764706, 1,
1.29949, 0.03663922, 2.651468, 1, 0, 0.5686275, 1,
1.305503, -0.1055554, 1.494971, 1, 0, 0.5647059, 1,
1.313869, 1.173775, 2.358238, 1, 0, 0.5568628, 1,
1.316813, 0.9174874, -0.1138234, 1, 0, 0.5529412, 1,
1.328018, 0.1268503, 2.278099, 1, 0, 0.5450981, 1,
1.330461, -1.790486, 3.580619, 1, 0, 0.5411765, 1,
1.334428, -0.884587, 3.571646, 1, 0, 0.5333334, 1,
1.339759, -1.382775, -0.1187814, 1, 0, 0.5294118, 1,
1.342376, -0.8792432, 1.900449, 1, 0, 0.5215687, 1,
1.342773, 0.4779707, 0.5864915, 1, 0, 0.5176471, 1,
1.348046, 0.8603218, 3.652975, 1, 0, 0.509804, 1,
1.367263, -0.3511911, 0.2680606, 1, 0, 0.5058824, 1,
1.375296, -1.003917, 1.757632, 1, 0, 0.4980392, 1,
1.380645, -0.9552069, 1.496004, 1, 0, 0.4901961, 1,
1.382572, -0.2719452, 1.850266, 1, 0, 0.4862745, 1,
1.388287, 1.789585, 1.210962, 1, 0, 0.4784314, 1,
1.394216, -0.1209391, 1.482166, 1, 0, 0.4745098, 1,
1.395297, -0.04984637, 0.2726945, 1, 0, 0.4666667, 1,
1.42018, -1.073307, 1.332638, 1, 0, 0.4627451, 1,
1.424555, -0.4029759, 0.6780316, 1, 0, 0.454902, 1,
1.425614, -0.5944751, 2.42741, 1, 0, 0.4509804, 1,
1.427175, 1.058675, 1.217771, 1, 0, 0.4431373, 1,
1.429474, -2.226925, 2.477571, 1, 0, 0.4392157, 1,
1.432768, -0.2108255, 1.561559, 1, 0, 0.4313726, 1,
1.437847, -0.6748024, 2.66169, 1, 0, 0.427451, 1,
1.442938, -1.857416, 2.582225, 1, 0, 0.4196078, 1,
1.446792, -0.03299875, 1.742193, 1, 0, 0.4156863, 1,
1.45397, -0.7128449, 3.725871, 1, 0, 0.4078431, 1,
1.46161, 0.8765105, 1.869022, 1, 0, 0.4039216, 1,
1.480135, -0.7039097, 0.7782429, 1, 0, 0.3960784, 1,
1.48928, -0.3574591, 1.366392, 1, 0, 0.3882353, 1,
1.492931, 0.7612281, 2.686571, 1, 0, 0.3843137, 1,
1.506644, 0.6573148, 0.9365877, 1, 0, 0.3764706, 1,
1.513013, 0.4497589, 4.522451, 1, 0, 0.372549, 1,
1.538382, -1.088326, 1.240217, 1, 0, 0.3647059, 1,
1.545081, 0.2172345, 1.437355, 1, 0, 0.3607843, 1,
1.562544, -1.544937, 3.305464, 1, 0, 0.3529412, 1,
1.564062, -0.002476431, 0.3858544, 1, 0, 0.3490196, 1,
1.566946, -0.03581653, 0.6470581, 1, 0, 0.3411765, 1,
1.585198, -1.771641, 2.468352, 1, 0, 0.3372549, 1,
1.586357, -0.7847548, 2.606659, 1, 0, 0.3294118, 1,
1.586779, -0.7931706, 2.51831, 1, 0, 0.3254902, 1,
1.591156, -0.6785985, 3.276023, 1, 0, 0.3176471, 1,
1.596699, -0.3595266, 3.378706, 1, 0, 0.3137255, 1,
1.629552, -0.09556203, 2.157882, 1, 0, 0.3058824, 1,
1.656183, 2.065194, 1.491753, 1, 0, 0.2980392, 1,
1.656489, -0.01669644, 2.24726, 1, 0, 0.2941177, 1,
1.669159, 0.5675566, 1.572846, 1, 0, 0.2862745, 1,
1.67479, -0.07211372, 1.603213, 1, 0, 0.282353, 1,
1.675707, 0.8859662, 0.7981163, 1, 0, 0.2745098, 1,
1.69053, -0.2039095, 2.651342, 1, 0, 0.2705882, 1,
1.702311, -0.745426, 2.797873, 1, 0, 0.2627451, 1,
1.703661, -0.309743, 1.755302, 1, 0, 0.2588235, 1,
1.717237, -1.382717, 2.032267, 1, 0, 0.2509804, 1,
1.720531, 0.2646963, 0.2664068, 1, 0, 0.2470588, 1,
1.732212, 0.002862127, 1.794616, 1, 0, 0.2392157, 1,
1.732814, 0.8340954, 0.01051046, 1, 0, 0.2352941, 1,
1.733201, -1.23356, 2.377166, 1, 0, 0.227451, 1,
1.743892, -0.7464488, 1.074862, 1, 0, 0.2235294, 1,
1.762116, -0.2596682, 1.018831, 1, 0, 0.2156863, 1,
1.774162, -0.8154305, 3.26846, 1, 0, 0.2117647, 1,
1.780198, 1.332979, 0.8712209, 1, 0, 0.2039216, 1,
1.801205, -0.4328187, 2.29648, 1, 0, 0.1960784, 1,
1.801286, -1.27242, 2.54991, 1, 0, 0.1921569, 1,
1.807016, 0.853577, 0.2628115, 1, 0, 0.1843137, 1,
1.809549, 1.431272, -0.6015387, 1, 0, 0.1803922, 1,
1.820739, 1.086534, 1.229065, 1, 0, 0.172549, 1,
1.828007, -0.8586711, -0.1757002, 1, 0, 0.1686275, 1,
1.841694, 0.2517769, 1.282887, 1, 0, 0.1607843, 1,
1.847257, -1.268928, 1.660358, 1, 0, 0.1568628, 1,
1.861773, 0.7648615, 3.03653, 1, 0, 0.1490196, 1,
1.868995, -0.4395129, 2.540856, 1, 0, 0.145098, 1,
1.884471, -1.238942, 3.396176, 1, 0, 0.1372549, 1,
1.884514, -0.9929745, 2.550707, 1, 0, 0.1333333, 1,
1.918392, 0.5655323, 0.7201853, 1, 0, 0.1254902, 1,
1.93515, -0.5155064, 0.4139414, 1, 0, 0.1215686, 1,
1.958579, 1.283862, 0.1955963, 1, 0, 0.1137255, 1,
1.97181, 0.2051689, 1.39487, 1, 0, 0.1098039, 1,
2.007739, -0.06462511, 1.798134, 1, 0, 0.1019608, 1,
2.07427, 1.81087, 0.6656169, 1, 0, 0.09411765, 1,
2.091394, -1.002158, 1.908966, 1, 0, 0.09019608, 1,
2.114583, 0.6413689, 0.5382618, 1, 0, 0.08235294, 1,
2.131479, 0.2898808, 0.4451274, 1, 0, 0.07843138, 1,
2.142342, -0.9434503, 2.454595, 1, 0, 0.07058824, 1,
2.187655, -0.3626891, 0.7384752, 1, 0, 0.06666667, 1,
2.259814, 1.095589, 2.189034, 1, 0, 0.05882353, 1,
2.291756, -0.8181973, 2.434759, 1, 0, 0.05490196, 1,
2.313958, 0.5370609, 2.096089, 1, 0, 0.04705882, 1,
2.350832, -0.6174165, 0.1456127, 1, 0, 0.04313726, 1,
2.381506, -0.09063466, 0.272692, 1, 0, 0.03529412, 1,
2.50451, 0.03978763, 1.529974, 1, 0, 0.03137255, 1,
2.513116, -1.013398, 1.515368, 1, 0, 0.02352941, 1,
2.720087, -0.3883145, 2.571454, 1, 0, 0.01960784, 1,
3.086745, 2.005415, 1.566719, 1, 0, 0.01176471, 1,
3.348256, -1.518206, 1.139511, 1, 0, 0.007843138, 1
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
0.1171114, -4.313127, -7.402887, 0, -0.5, 0.5, 0.5,
0.1171114, -4.313127, -7.402887, 1, -0.5, 0.5, 0.5,
0.1171114, -4.313127, -7.402887, 1, 1.5, 0.5, 0.5,
0.1171114, -4.313127, -7.402887, 0, 1.5, 0.5, 0.5
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
-4.209391, 0.1647772, -7.402887, 0, -0.5, 0.5, 0.5,
-4.209391, 0.1647772, -7.402887, 1, -0.5, 0.5, 0.5,
-4.209391, 0.1647772, -7.402887, 1, 1.5, 0.5, 0.5,
-4.209391, 0.1647772, -7.402887, 0, 1.5, 0.5, 0.5
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
-4.209391, -4.313127, 0.2258997, 0, -0.5, 0.5, 0.5,
-4.209391, -4.313127, 0.2258997, 1, -0.5, 0.5, 0.5,
-4.209391, -4.313127, 0.2258997, 1, 1.5, 0.5, 0.5,
-4.209391, -4.313127, 0.2258997, 0, 1.5, 0.5, 0.5
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
-3, -3.279764, -5.642398,
3, -3.279764, -5.642398,
-3, -3.279764, -5.642398,
-3, -3.451991, -5.935813,
-2, -3.279764, -5.642398,
-2, -3.451991, -5.935813,
-1, -3.279764, -5.642398,
-1, -3.451991, -5.935813,
0, -3.279764, -5.642398,
0, -3.451991, -5.935813,
1, -3.279764, -5.642398,
1, -3.451991, -5.935813,
2, -3.279764, -5.642398,
2, -3.451991, -5.935813,
3, -3.279764, -5.642398,
3, -3.451991, -5.935813
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
-3, -3.796446, -6.522643, 0, -0.5, 0.5, 0.5,
-3, -3.796446, -6.522643, 1, -0.5, 0.5, 0.5,
-3, -3.796446, -6.522643, 1, 1.5, 0.5, 0.5,
-3, -3.796446, -6.522643, 0, 1.5, 0.5, 0.5,
-2, -3.796446, -6.522643, 0, -0.5, 0.5, 0.5,
-2, -3.796446, -6.522643, 1, -0.5, 0.5, 0.5,
-2, -3.796446, -6.522643, 1, 1.5, 0.5, 0.5,
-2, -3.796446, -6.522643, 0, 1.5, 0.5, 0.5,
-1, -3.796446, -6.522643, 0, -0.5, 0.5, 0.5,
-1, -3.796446, -6.522643, 1, -0.5, 0.5, 0.5,
-1, -3.796446, -6.522643, 1, 1.5, 0.5, 0.5,
-1, -3.796446, -6.522643, 0, 1.5, 0.5, 0.5,
0, -3.796446, -6.522643, 0, -0.5, 0.5, 0.5,
0, -3.796446, -6.522643, 1, -0.5, 0.5, 0.5,
0, -3.796446, -6.522643, 1, 1.5, 0.5, 0.5,
0, -3.796446, -6.522643, 0, 1.5, 0.5, 0.5,
1, -3.796446, -6.522643, 0, -0.5, 0.5, 0.5,
1, -3.796446, -6.522643, 1, -0.5, 0.5, 0.5,
1, -3.796446, -6.522643, 1, 1.5, 0.5, 0.5,
1, -3.796446, -6.522643, 0, 1.5, 0.5, 0.5,
2, -3.796446, -6.522643, 0, -0.5, 0.5, 0.5,
2, -3.796446, -6.522643, 1, -0.5, 0.5, 0.5,
2, -3.796446, -6.522643, 1, 1.5, 0.5, 0.5,
2, -3.796446, -6.522643, 0, 1.5, 0.5, 0.5,
3, -3.796446, -6.522643, 0, -0.5, 0.5, 0.5,
3, -3.796446, -6.522643, 1, -0.5, 0.5, 0.5,
3, -3.796446, -6.522643, 1, 1.5, 0.5, 0.5,
3, -3.796446, -6.522643, 0, 1.5, 0.5, 0.5
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
-3.210967, -3, -5.642398,
-3.210967, 3, -5.642398,
-3.210967, -3, -5.642398,
-3.377371, -3, -5.935813,
-3.210967, -2, -5.642398,
-3.377371, -2, -5.935813,
-3.210967, -1, -5.642398,
-3.377371, -1, -5.935813,
-3.210967, 0, -5.642398,
-3.377371, 0, -5.935813,
-3.210967, 1, -5.642398,
-3.377371, 1, -5.935813,
-3.210967, 2, -5.642398,
-3.377371, 2, -5.935813,
-3.210967, 3, -5.642398,
-3.377371, 3, -5.935813
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
-3.710179, -3, -6.522643, 0, -0.5, 0.5, 0.5,
-3.710179, -3, -6.522643, 1, -0.5, 0.5, 0.5,
-3.710179, -3, -6.522643, 1, 1.5, 0.5, 0.5,
-3.710179, -3, -6.522643, 0, 1.5, 0.5, 0.5,
-3.710179, -2, -6.522643, 0, -0.5, 0.5, 0.5,
-3.710179, -2, -6.522643, 1, -0.5, 0.5, 0.5,
-3.710179, -2, -6.522643, 1, 1.5, 0.5, 0.5,
-3.710179, -2, -6.522643, 0, 1.5, 0.5, 0.5,
-3.710179, -1, -6.522643, 0, -0.5, 0.5, 0.5,
-3.710179, -1, -6.522643, 1, -0.5, 0.5, 0.5,
-3.710179, -1, -6.522643, 1, 1.5, 0.5, 0.5,
-3.710179, -1, -6.522643, 0, 1.5, 0.5, 0.5,
-3.710179, 0, -6.522643, 0, -0.5, 0.5, 0.5,
-3.710179, 0, -6.522643, 1, -0.5, 0.5, 0.5,
-3.710179, 0, -6.522643, 1, 1.5, 0.5, 0.5,
-3.710179, 0, -6.522643, 0, 1.5, 0.5, 0.5,
-3.710179, 1, -6.522643, 0, -0.5, 0.5, 0.5,
-3.710179, 1, -6.522643, 1, -0.5, 0.5, 0.5,
-3.710179, 1, -6.522643, 1, 1.5, 0.5, 0.5,
-3.710179, 1, -6.522643, 0, 1.5, 0.5, 0.5,
-3.710179, 2, -6.522643, 0, -0.5, 0.5, 0.5,
-3.710179, 2, -6.522643, 1, -0.5, 0.5, 0.5,
-3.710179, 2, -6.522643, 1, 1.5, 0.5, 0.5,
-3.710179, 2, -6.522643, 0, 1.5, 0.5, 0.5,
-3.710179, 3, -6.522643, 0, -0.5, 0.5, 0.5,
-3.710179, 3, -6.522643, 1, -0.5, 0.5, 0.5,
-3.710179, 3, -6.522643, 1, 1.5, 0.5, 0.5,
-3.710179, 3, -6.522643, 0, 1.5, 0.5, 0.5
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
-3.210967, -3.279764, -4,
-3.210967, -3.279764, 4,
-3.210967, -3.279764, -4,
-3.377371, -3.451991, -4,
-3.210967, -3.279764, -2,
-3.377371, -3.451991, -2,
-3.210967, -3.279764, 0,
-3.377371, -3.451991, 0,
-3.210967, -3.279764, 2,
-3.377371, -3.451991, 2,
-3.210967, -3.279764, 4,
-3.377371, -3.451991, 4
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
-3.710179, -3.796446, -4, 0, -0.5, 0.5, 0.5,
-3.710179, -3.796446, -4, 1, -0.5, 0.5, 0.5,
-3.710179, -3.796446, -4, 1, 1.5, 0.5, 0.5,
-3.710179, -3.796446, -4, 0, 1.5, 0.5, 0.5,
-3.710179, -3.796446, -2, 0, -0.5, 0.5, 0.5,
-3.710179, -3.796446, -2, 1, -0.5, 0.5, 0.5,
-3.710179, -3.796446, -2, 1, 1.5, 0.5, 0.5,
-3.710179, -3.796446, -2, 0, 1.5, 0.5, 0.5,
-3.710179, -3.796446, 0, 0, -0.5, 0.5, 0.5,
-3.710179, -3.796446, 0, 1, -0.5, 0.5, 0.5,
-3.710179, -3.796446, 0, 1, 1.5, 0.5, 0.5,
-3.710179, -3.796446, 0, 0, 1.5, 0.5, 0.5,
-3.710179, -3.796446, 2, 0, -0.5, 0.5, 0.5,
-3.710179, -3.796446, 2, 1, -0.5, 0.5, 0.5,
-3.710179, -3.796446, 2, 1, 1.5, 0.5, 0.5,
-3.710179, -3.796446, 2, 0, 1.5, 0.5, 0.5,
-3.710179, -3.796446, 4, 0, -0.5, 0.5, 0.5,
-3.710179, -3.796446, 4, 1, -0.5, 0.5, 0.5,
-3.710179, -3.796446, 4, 1, 1.5, 0.5, 0.5,
-3.710179, -3.796446, 4, 0, 1.5, 0.5, 0.5
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
-3.210967, -3.279764, -5.642398,
-3.210967, 3.609319, -5.642398,
-3.210967, -3.279764, 6.094197,
-3.210967, 3.609319, 6.094197,
-3.210967, -3.279764, -5.642398,
-3.210967, -3.279764, 6.094197,
-3.210967, 3.609319, -5.642398,
-3.210967, 3.609319, 6.094197,
-3.210967, -3.279764, -5.642398,
3.44519, -3.279764, -5.642398,
-3.210967, -3.279764, 6.094197,
3.44519, -3.279764, 6.094197,
-3.210967, 3.609319, -5.642398,
3.44519, 3.609319, -5.642398,
-3.210967, 3.609319, 6.094197,
3.44519, 3.609319, 6.094197,
3.44519, -3.279764, -5.642398,
3.44519, 3.609319, -5.642398,
3.44519, -3.279764, 6.094197,
3.44519, 3.609319, 6.094197,
3.44519, -3.279764, -5.642398,
3.44519, -3.279764, 6.094197,
3.44519, 3.609319, -5.642398,
3.44519, 3.609319, 6.094197
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
var radius = 8.089613;
var distance = 35.9916;
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
mvMatrix.translate( -0.1171114, -0.1647772, -0.2258997 );
mvMatrix.scale( 1.314069, 1.269639, 0.7452458 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.9916);
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
mefluidide<-read.table("mefluidide.xyz")
```

```
## Error in read.table("mefluidide.xyz"): no lines available in input
```

```r
x<-mefluidide$V2
```

```
## Error in eval(expr, envir, enclos): object 'mefluidide' not found
```

```r
y<-mefluidide$V3
```

```
## Error in eval(expr, envir, enclos): object 'mefluidide' not found
```

```r
z<-mefluidide$V4
```

```
## Error in eval(expr, envir, enclos): object 'mefluidide' not found
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
-3.114033, 0.316953, -3.05305, 0, 0, 1, 1, 1,
-2.983189, -0.5875285, -1.672515, 1, 0, 0, 1, 1,
-2.947704, 0.6989622, -0.6938949, 1, 0, 0, 1, 1,
-2.923764, -0.9329129, -1.714714, 1, 0, 0, 1, 1,
-2.724951, 0.4086223, -1.713871, 1, 0, 0, 1, 1,
-2.54458, -0.1348139, -1.552396, 1, 0, 0, 1, 1,
-2.477872, -0.9223, -1.220413, 0, 0, 0, 1, 1,
-2.451177, 0.3924818, -1.094873, 0, 0, 0, 1, 1,
-2.361202, 0.3908116, -0.6590918, 0, 0, 0, 1, 1,
-2.346826, 0.3888841, -1.020026, 0, 0, 0, 1, 1,
-2.305864, 0.8964545, -1.685431, 0, 0, 0, 1, 1,
-2.301034, 0.4067707, -1.260355, 0, 0, 0, 1, 1,
-2.277887, -0.4728286, -3.459238, 0, 0, 0, 1, 1,
-2.245653, -1.641771, -4.63945, 1, 1, 1, 1, 1,
-2.205652, -0.002295378, -0.8676683, 1, 1, 1, 1, 1,
-2.176122, 1.222208, -1.57553, 1, 1, 1, 1, 1,
-2.169022, -0.5482925, -1.525946, 1, 1, 1, 1, 1,
-2.14751, -0.2884584, -2.988794, 1, 1, 1, 1, 1,
-2.147133, 1.351506, -0.5150921, 1, 1, 1, 1, 1,
-2.133766, -0.04700964, -2.23009, 1, 1, 1, 1, 1,
-2.128639, 0.0731934, -0.1062919, 1, 1, 1, 1, 1,
-2.120288, 0.7368528, -1.271873, 1, 1, 1, 1, 1,
-2.115082, -0.5202098, -2.50279, 1, 1, 1, 1, 1,
-2.088342, 0.3069765, -1.065161, 1, 1, 1, 1, 1,
-2.080026, -0.9034297, -1.445629, 1, 1, 1, 1, 1,
-2.07278, 1.739579, 0.3318773, 1, 1, 1, 1, 1,
-2.069624, -0.4467269, -1.186291, 1, 1, 1, 1, 1,
-2.04296, 0.2979791, -1.832931, 1, 1, 1, 1, 1,
-2.031083, -1.067156, -3.418971, 0, 0, 1, 1, 1,
-1.996284, 0.9331093, -1.364178, 1, 0, 0, 1, 1,
-1.987788, -0.6793823, -2.66873, 1, 0, 0, 1, 1,
-1.918116, -0.01851074, -1.856408, 1, 0, 0, 1, 1,
-1.893034, 0.2730622, -1.37534, 1, 0, 0, 1, 1,
-1.8739, -1.526283, -2.321364, 1, 0, 0, 1, 1,
-1.873591, -1.455586, -2.785023, 0, 0, 0, 1, 1,
-1.870109, 2.928367, -0.6381174, 0, 0, 0, 1, 1,
-1.845691, -1.305776, -1.495004, 0, 0, 0, 1, 1,
-1.833688, -0.363925, -2.483145, 0, 0, 0, 1, 1,
-1.823464, 0.4192261, -0.1475183, 0, 0, 0, 1, 1,
-1.806953, -0.4911529, -1.577242, 0, 0, 0, 1, 1,
-1.785851, 2.845722, 0.02206242, 0, 0, 0, 1, 1,
-1.774706, 0.7088887, -0.6185846, 1, 1, 1, 1, 1,
-1.770434, -0.5613276, -3.949748, 1, 1, 1, 1, 1,
-1.762414, -1.08595, -2.991338, 1, 1, 1, 1, 1,
-1.752606, 0.01615581, -1.71348, 1, 1, 1, 1, 1,
-1.738988, 0.1045229, -3.118529, 1, 1, 1, 1, 1,
-1.727338, 1.213373, -0.5390283, 1, 1, 1, 1, 1,
-1.727163, 0.5925227, -1.569901, 1, 1, 1, 1, 1,
-1.703047, 0.1616774, -1.649382, 1, 1, 1, 1, 1,
-1.689412, -0.1694338, -0.6699809, 1, 1, 1, 1, 1,
-1.674957, 0.2531532, -0.5503991, 1, 1, 1, 1, 1,
-1.67129, 0.2206436, -0.0754419, 1, 1, 1, 1, 1,
-1.67025, -0.7000743, -1.145708, 1, 1, 1, 1, 1,
-1.657537, -0.6210068, -1.746638, 1, 1, 1, 1, 1,
-1.650401, 1.029757, -0.3401833, 1, 1, 1, 1, 1,
-1.637652, 0.8281913, 0.36342, 1, 1, 1, 1, 1,
-1.634401, 0.1768175, -1.188941, 0, 0, 1, 1, 1,
-1.62406, -1.394623, -0.04802013, 1, 0, 0, 1, 1,
-1.589053, -0.7063683, -1.97652, 1, 0, 0, 1, 1,
-1.587643, -0.6263956, -3.006357, 1, 0, 0, 1, 1,
-1.577358, 0.9533644, -1.589451, 1, 0, 0, 1, 1,
-1.575685, -0.1666189, -2.596783, 1, 0, 0, 1, 1,
-1.561427, 0.4074927, -0.6842839, 0, 0, 0, 1, 1,
-1.561392, -1.416526, -2.828464, 0, 0, 0, 1, 1,
-1.55031, 0.02960521, -1.422202, 0, 0, 0, 1, 1,
-1.545457, 1.142431, -0.4964902, 0, 0, 0, 1, 1,
-1.536996, 1.103968, 0.8782399, 0, 0, 0, 1, 1,
-1.521733, -1.235707, 0.6484616, 0, 0, 0, 1, 1,
-1.515987, -0.3510678, -3.584884, 0, 0, 0, 1, 1,
-1.494617, 0.2493122, -2.091692, 1, 1, 1, 1, 1,
-1.492555, -1.124153, -2.246778, 1, 1, 1, 1, 1,
-1.491911, 1.904873, -0.4068568, 1, 1, 1, 1, 1,
-1.489685, 0.9168501, -0.490995, 1, 1, 1, 1, 1,
-1.487074, -0.4193234, -3.966698, 1, 1, 1, 1, 1,
-1.486677, -0.9387587, -1.584554, 1, 1, 1, 1, 1,
-1.484108, -0.6938587, -1.310266, 1, 1, 1, 1, 1,
-1.466858, -1.079182, -2.802391, 1, 1, 1, 1, 1,
-1.459523, -0.9706409, -2.85917, 1, 1, 1, 1, 1,
-1.45911, 0.2592463, -1.407981, 1, 1, 1, 1, 1,
-1.451346, -1.722926, -1.865107, 1, 1, 1, 1, 1,
-1.451161, 2.177979, 0.1798513, 1, 1, 1, 1, 1,
-1.450285, -1.005376, -2.689098, 1, 1, 1, 1, 1,
-1.447018, 0.07447819, -1.483171, 1, 1, 1, 1, 1,
-1.441215, 2.546055, -0.994298, 1, 1, 1, 1, 1,
-1.440434, 0.5197142, -1.045336, 0, 0, 1, 1, 1,
-1.439527, 0.5558071, -0.4421417, 1, 0, 0, 1, 1,
-1.433996, 0.5069025, -2.051982, 1, 0, 0, 1, 1,
-1.433018, -1.528215, -2.608125, 1, 0, 0, 1, 1,
-1.432526, 0.7379792, -1.449568, 1, 0, 0, 1, 1,
-1.425315, -1.842211, -0.6272917, 1, 0, 0, 1, 1,
-1.422672, -0.3095592, -1.851146, 0, 0, 0, 1, 1,
-1.41925, -0.2800233, -2.054209, 0, 0, 0, 1, 1,
-1.413149, 0.9808607, 0.1761369, 0, 0, 0, 1, 1,
-1.402071, 0.817458, -0.8270933, 0, 0, 0, 1, 1,
-1.397675, 1.15816, -0.02721203, 0, 0, 0, 1, 1,
-1.392002, 0.3991587, -3.102528, 0, 0, 0, 1, 1,
-1.389609, -0.3151926, -2.40942, 0, 0, 0, 1, 1,
-1.384384, -1.043692, -1.304507, 1, 1, 1, 1, 1,
-1.36587, 0.4874665, -0.5880985, 1, 1, 1, 1, 1,
-1.353998, 0.4167791, 0.0525181, 1, 1, 1, 1, 1,
-1.350468, -1.002769, -1.182826, 1, 1, 1, 1, 1,
-1.348885, -0.4114626, -0.5417445, 1, 1, 1, 1, 1,
-1.33931, -0.9526865, -1.835278, 1, 1, 1, 1, 1,
-1.335776, 0.2441471, -1.332052, 1, 1, 1, 1, 1,
-1.331149, -2.40828, -2.563036, 1, 1, 1, 1, 1,
-1.330755, 1.397983, -3.175425, 1, 1, 1, 1, 1,
-1.323467, -1.133067, -2.297309, 1, 1, 1, 1, 1,
-1.318605, -2.089861, -3.856397, 1, 1, 1, 1, 1,
-1.311435, 0.7032233, -1.486997, 1, 1, 1, 1, 1,
-1.310453, 0.4362098, -0.6020809, 1, 1, 1, 1, 1,
-1.310091, -0.8292295, -0.2389355, 1, 1, 1, 1, 1,
-1.30533, 0.6135793, -0.7298642, 1, 1, 1, 1, 1,
-1.295668, -0.497968, -2.102825, 0, 0, 1, 1, 1,
-1.292994, -0.283424, -2.228417, 1, 0, 0, 1, 1,
-1.291143, 0.5351208, -2.130078, 1, 0, 0, 1, 1,
-1.279184, 0.3712632, 0.2200342, 1, 0, 0, 1, 1,
-1.270973, 2.467892, 0.5574151, 1, 0, 0, 1, 1,
-1.265959, -0.3762541, -1.073778, 1, 0, 0, 1, 1,
-1.262022, -1.769343, -1.258139, 0, 0, 0, 1, 1,
-1.257049, -0.6173867, -2.794562, 0, 0, 0, 1, 1,
-1.254823, 0.6595998, -0.6144267, 0, 0, 0, 1, 1,
-1.251158, -0.9708783, -1.657885, 0, 0, 0, 1, 1,
-1.246908, 1.045402, 0.5687712, 0, 0, 0, 1, 1,
-1.242096, 1.262526, -0.9502648, 0, 0, 0, 1, 1,
-1.24051, 1.441401, 0.5800287, 0, 0, 0, 1, 1,
-1.230325, 0.4103058, 2.212711, 1, 1, 1, 1, 1,
-1.227801, -0.2004041, -1.709188, 1, 1, 1, 1, 1,
-1.222147, 0.5046918, -0.9116896, 1, 1, 1, 1, 1,
-1.214551, 1.272561, -1.698872, 1, 1, 1, 1, 1,
-1.212594, -0.1631865, -2.688124, 1, 1, 1, 1, 1,
-1.210243, -0.47216, -3.017341, 1, 1, 1, 1, 1,
-1.20627, 1.59865, -1.897112, 1, 1, 1, 1, 1,
-1.204509, 0.3057505, -1.538461, 1, 1, 1, 1, 1,
-1.186936, 0.2711937, -2.94491, 1, 1, 1, 1, 1,
-1.184468, 0.3944678, -1.870939, 1, 1, 1, 1, 1,
-1.172632, 0.8328317, 0.638862, 1, 1, 1, 1, 1,
-1.172401, -1.31157, -2.432737, 1, 1, 1, 1, 1,
-1.165755, 1.516359, 0.4869108, 1, 1, 1, 1, 1,
-1.164409, -0.4055672, -1.363864, 1, 1, 1, 1, 1,
-1.161772, -0.3812775, -1.592831, 1, 1, 1, 1, 1,
-1.161209, -0.3092563, -3.070259, 0, 0, 1, 1, 1,
-1.151256, 0.6282286, 0.08764999, 1, 0, 0, 1, 1,
-1.149769, 1.025045, -0.9637244, 1, 0, 0, 1, 1,
-1.146542, 0.1952836, -1.823066, 1, 0, 0, 1, 1,
-1.108128, 0.09542014, -2.011273, 1, 0, 0, 1, 1,
-1.105672, -0.8062935, -2.899159, 1, 0, 0, 1, 1,
-1.103033, -0.3727396, -2.846711, 0, 0, 0, 1, 1,
-1.095187, -2.07428, -4.633615, 0, 0, 0, 1, 1,
-1.094682, 1.766281, 0.5978984, 0, 0, 0, 1, 1,
-1.085497, 0.1357711, -1.298774, 0, 0, 0, 1, 1,
-1.08527, -1.47724, -4.091564, 0, 0, 0, 1, 1,
-1.076291, -1.061315, -2.979824, 0, 0, 0, 1, 1,
-1.068685, 0.2906921, -0.6178786, 0, 0, 0, 1, 1,
-1.061364, 2.062015, -0.4837894, 1, 1, 1, 1, 1,
-1.053522, 0.3710756, -3.723968, 1, 1, 1, 1, 1,
-1.049061, -0.8222388, -2.353172, 1, 1, 1, 1, 1,
-1.048128, -0.5530041, -2.666725, 1, 1, 1, 1, 1,
-1.047656, -0.9087476, -2.311665, 1, 1, 1, 1, 1,
-1.04752, -1.649221, -0.8897907, 1, 1, 1, 1, 1,
-1.04716, -0.5472829, -3.029551, 1, 1, 1, 1, 1,
-1.044728, -2.492216, -3.622373, 1, 1, 1, 1, 1,
-1.041049, 0.3164141, -0.6153939, 1, 1, 1, 1, 1,
-1.036801, 1.310803, -2.4182, 1, 1, 1, 1, 1,
-1.027646, 0.6571835, -1.577384, 1, 1, 1, 1, 1,
-1.024457, 0.06866276, -0.4904036, 1, 1, 1, 1, 1,
-1.024266, -0.4633069, -3.46115, 1, 1, 1, 1, 1,
-1.005519, 0.07387301, -2.802821, 1, 1, 1, 1, 1,
-1.003879, -0.6721719, -0.8656784, 1, 1, 1, 1, 1,
-0.9974851, -0.3144929, -2.100948, 0, 0, 1, 1, 1,
-0.9928112, 0.338192, -2.028215, 1, 0, 0, 1, 1,
-0.9895386, -1.166847, -2.384474, 1, 0, 0, 1, 1,
-0.9802193, 0.5740771, -1.212734, 1, 0, 0, 1, 1,
-0.9789022, -0.782808, -1.272568, 1, 0, 0, 1, 1,
-0.956168, -0.5622962, -1.559247, 1, 0, 0, 1, 1,
-0.9521968, -1.062781, -1.59747, 0, 0, 0, 1, 1,
-0.9491143, 0.4540714, -1.996574, 0, 0, 0, 1, 1,
-0.9418652, -0.7317568, -2.330019, 0, 0, 0, 1, 1,
-0.9365299, -0.03236522, -2.155508, 0, 0, 0, 1, 1,
-0.9302551, -0.5467038, -3.147139, 0, 0, 0, 1, 1,
-0.9225254, 0.2591805, -1.981869, 0, 0, 0, 1, 1,
-0.9198175, -0.4635115, -2.2839, 0, 0, 0, 1, 1,
-0.9195294, -1.130236, -2.083016, 1, 1, 1, 1, 1,
-0.9158328, -0.3742222, -0.7250514, 1, 1, 1, 1, 1,
-0.9133969, 0.1726022, -1.106308, 1, 1, 1, 1, 1,
-0.9127246, -1.527282, -1.654967, 1, 1, 1, 1, 1,
-0.9081941, -2.085312, -2.958642, 1, 1, 1, 1, 1,
-0.9068761, 0.4723933, -2.005853, 1, 1, 1, 1, 1,
-0.9024652, -0.5418137, -1.508756, 1, 1, 1, 1, 1,
-0.9006122, -1.455722, -1.557782, 1, 1, 1, 1, 1,
-0.8999395, 0.4946087, -2.179011, 1, 1, 1, 1, 1,
-0.892181, -0.5206011, -1.160417, 1, 1, 1, 1, 1,
-0.8921049, -0.5093517, -1.837462, 1, 1, 1, 1, 1,
-0.8894832, -1.46925, -1.855247, 1, 1, 1, 1, 1,
-0.8892009, 0.3854639, -1.053649, 1, 1, 1, 1, 1,
-0.8867819, 0.2889142, -2.350221, 1, 1, 1, 1, 1,
-0.8853709, 2.061196, -0.4607156, 1, 1, 1, 1, 1,
-0.8830015, -0.3982064, -0.09408331, 0, 0, 1, 1, 1,
-0.882705, -0.7782302, -1.271923, 1, 0, 0, 1, 1,
-0.8806233, -0.6696501, -4.157608, 1, 0, 0, 1, 1,
-0.8764002, 0.8540042, -0.3340953, 1, 0, 0, 1, 1,
-0.8670044, 1.630926, -2.176634, 1, 0, 0, 1, 1,
-0.859499, -0.09602399, -0.4638982, 1, 0, 0, 1, 1,
-0.8565326, 1.159736, -2.773259, 0, 0, 0, 1, 1,
-0.8562014, -1.339225, -3.628251, 0, 0, 0, 1, 1,
-0.8482324, -0.3696427, -0.488944, 0, 0, 0, 1, 1,
-0.8480636, 0.5462435, -0.8258842, 0, 0, 0, 1, 1,
-0.8439809, 1.235814, -2.515589, 0, 0, 0, 1, 1,
-0.843137, -0.2599184, -1.912592, 0, 0, 0, 1, 1,
-0.8431315, -0.3195182, -1.467241, 0, 0, 0, 1, 1,
-0.8415393, -1.811467, -1.172757, 1, 1, 1, 1, 1,
-0.8350136, -0.1238393, 0.8121082, 1, 1, 1, 1, 1,
-0.8336497, 1.917766, 0.02726101, 1, 1, 1, 1, 1,
-0.8295285, -0.5395525, -1.359703, 1, 1, 1, 1, 1,
-0.8284255, 0.1394214, -0.8036916, 1, 1, 1, 1, 1,
-0.8271351, 0.2216359, -1.382395, 1, 1, 1, 1, 1,
-0.8222244, -1.177049, -0.6809745, 1, 1, 1, 1, 1,
-0.8201544, 0.4323688, -0.1380517, 1, 1, 1, 1, 1,
-0.8177915, 0.1470669, 0.1798298, 1, 1, 1, 1, 1,
-0.8177073, 0.9849054, -0.1803073, 1, 1, 1, 1, 1,
-0.8085275, -1.199145, -3.049807, 1, 1, 1, 1, 1,
-0.80703, 0.5447654, -2.93209, 1, 1, 1, 1, 1,
-0.806204, 0.2236647, 0.06109889, 1, 1, 1, 1, 1,
-0.7978819, -0.5614287, -1.980738, 1, 1, 1, 1, 1,
-0.794228, -2.316531, -3.572096, 1, 1, 1, 1, 1,
-0.7930242, 0.2115726, -1.466645, 0, 0, 1, 1, 1,
-0.7900776, -0.233547, -1.389152, 1, 0, 0, 1, 1,
-0.7892624, 1.178166, -1.668046, 1, 0, 0, 1, 1,
-0.7795199, 0.02219926, -1.79267, 1, 0, 0, 1, 1,
-0.768076, 0.2516333, -0.7881643, 1, 0, 0, 1, 1,
-0.7629475, 1.171829, -0.9305826, 1, 0, 0, 1, 1,
-0.7580733, -0.2422363, -1.010395, 0, 0, 0, 1, 1,
-0.7524415, -0.683881, -2.610419, 0, 0, 0, 1, 1,
-0.7486962, 0.8310254, 0.6231997, 0, 0, 0, 1, 1,
-0.7463296, -0.03854537, -2.405366, 0, 0, 0, 1, 1,
-0.7447832, -0.2656429, -0.9441152, 0, 0, 0, 1, 1,
-0.7406874, -1.755611, -2.803627, 0, 0, 0, 1, 1,
-0.7332351, -0.1462691, -0.05376467, 0, 0, 0, 1, 1,
-0.7292088, 0.6741436, 0.7268824, 1, 1, 1, 1, 1,
-0.7226222, -0.4912128, -2.616593, 1, 1, 1, 1, 1,
-0.7194571, 0.153342, 0.7339925, 1, 1, 1, 1, 1,
-0.7150787, -1.235674, -1.563979, 1, 1, 1, 1, 1,
-0.7142519, -0.534525, -2.429008, 1, 1, 1, 1, 1,
-0.7130182, -1.31755, -1.813646, 1, 1, 1, 1, 1,
-0.7049109, 0.1097544, -0.6115401, 1, 1, 1, 1, 1,
-0.703223, 0.3681333, -1.25553, 1, 1, 1, 1, 1,
-0.7029816, 0.3524019, -3.300426, 1, 1, 1, 1, 1,
-0.6995473, -0.08185698, -1.759309, 1, 1, 1, 1, 1,
-0.6983003, 1.835847, -2.075359, 1, 1, 1, 1, 1,
-0.6938121, 0.02116213, -1.588524, 1, 1, 1, 1, 1,
-0.6904177, 0.1132446, -1.441587, 1, 1, 1, 1, 1,
-0.6875686, -0.3695228, -1.353912, 1, 1, 1, 1, 1,
-0.6840386, -1.457435, -1.710869, 1, 1, 1, 1, 1,
-0.6814348, 0.2512849, -1.302209, 0, 0, 1, 1, 1,
-0.6780974, -0.1012878, -1.477077, 1, 0, 0, 1, 1,
-0.6747383, 1.182797, -0.4179747, 1, 0, 0, 1, 1,
-0.673178, -0.796437, -1.815347, 1, 0, 0, 1, 1,
-0.6717625, 1.783314, 0.7281984, 1, 0, 0, 1, 1,
-0.6707035, -1.066203, -1.845197, 1, 0, 0, 1, 1,
-0.6696157, -0.9328396, -3.659301, 0, 0, 0, 1, 1,
-0.6692919, -0.643638, -2.733089, 0, 0, 0, 1, 1,
-0.6648238, 0.9180501, 1.514076, 0, 0, 0, 1, 1,
-0.6639122, 0.8718929, 0.2529664, 0, 0, 0, 1, 1,
-0.6576232, 0.2707809, 0.2578925, 0, 0, 0, 1, 1,
-0.6567175, -1.604566, -3.406183, 0, 0, 0, 1, 1,
-0.6541494, -0.6950113, -4.636007, 0, 0, 0, 1, 1,
-0.652827, -1.269075, -3.147612, 1, 1, 1, 1, 1,
-0.6434387, -0.01795024, -1.049766, 1, 1, 1, 1, 1,
-0.6430908, 1.612026, 0.3661024, 1, 1, 1, 1, 1,
-0.6402158, 2.72572, -0.5934847, 1, 1, 1, 1, 1,
-0.6398089, -0.06176938, -2.033897, 1, 1, 1, 1, 1,
-0.6351588, -0.0551637, -2.274373, 1, 1, 1, 1, 1,
-0.626265, 0.1601603, -0.5042477, 1, 1, 1, 1, 1,
-0.6246845, -0.1609549, -2.160795, 1, 1, 1, 1, 1,
-0.6229348, -0.5317482, -1.555367, 1, 1, 1, 1, 1,
-0.6224405, -0.3324386, -1.683791, 1, 1, 1, 1, 1,
-0.6114374, -0.9387475, -2.226913, 1, 1, 1, 1, 1,
-0.6067241, -0.7883886, -2.465421, 1, 1, 1, 1, 1,
-0.6065749, 1.134601, -0.2821917, 1, 1, 1, 1, 1,
-0.6034714, 0.3681027, -1.901857, 1, 1, 1, 1, 1,
-0.6022829, -1.881027, -3.174467, 1, 1, 1, 1, 1,
-0.6021927, -0.5376467, -2.039968, 0, 0, 1, 1, 1,
-0.5956554, 1.352223, -0.4922759, 1, 0, 0, 1, 1,
-0.5899693, -0.5996683, -2.052492, 1, 0, 0, 1, 1,
-0.5861888, -0.3167721, -2.458555, 1, 0, 0, 1, 1,
-0.5775991, -1.027883, -2.531791, 1, 0, 0, 1, 1,
-0.5662642, 1.918959, 0.3418371, 1, 0, 0, 1, 1,
-0.5659386, -1.860094, -3.640074, 0, 0, 0, 1, 1,
-0.5608125, 1.32829, 1.643904, 0, 0, 0, 1, 1,
-0.5583489, 1.47273, 0.6395434, 0, 0, 0, 1, 1,
-0.5552641, 1.24548, -0.09874824, 0, 0, 0, 1, 1,
-0.5478954, 0.8913158, -1.249967, 0, 0, 0, 1, 1,
-0.5439956, -2.103147, -2.14575, 0, 0, 0, 1, 1,
-0.5429766, 0.5895287, -1.411903, 0, 0, 0, 1, 1,
-0.5415599, 1.019733, -1.538822, 1, 1, 1, 1, 1,
-0.5364744, 0.1202517, -1.269359, 1, 1, 1, 1, 1,
-0.5361429, -0.6368816, -2.131963, 1, 1, 1, 1, 1,
-0.5343964, 0.3687559, -0.79224, 1, 1, 1, 1, 1,
-0.5285656, -0.01720564, -3.223145, 1, 1, 1, 1, 1,
-0.527478, 0.8129427, -2.152961, 1, 1, 1, 1, 1,
-0.520712, -0.0844038, -1.783492, 1, 1, 1, 1, 1,
-0.5192397, -1.456119, -4.339692, 1, 1, 1, 1, 1,
-0.5133431, 1.493457, -0.3385622, 1, 1, 1, 1, 1,
-0.5087597, -1.272655, -1.261464, 1, 1, 1, 1, 1,
-0.506013, 0.3253641, -0.1442968, 1, 1, 1, 1, 1,
-0.4997467, -0.05253161, -3.041902, 1, 1, 1, 1, 1,
-0.4964413, 1.950811, -0.1416086, 1, 1, 1, 1, 1,
-0.4946904, 1.045698, 1.055624, 1, 1, 1, 1, 1,
-0.4905309, 1.19397, -0.5743842, 1, 1, 1, 1, 1,
-0.4833596, -0.4063915, -2.32709, 0, 0, 1, 1, 1,
-0.4720917, 0.6496339, -1.61473, 1, 0, 0, 1, 1,
-0.4707625, -0.2951221, -1.853724, 1, 0, 0, 1, 1,
-0.4682374, 0.3153096, -1.556138, 1, 0, 0, 1, 1,
-0.4645456, -0.6346124, -2.932167, 1, 0, 0, 1, 1,
-0.4635252, 1.004535, -0.7269461, 1, 0, 0, 1, 1,
-0.4598095, -0.2152561, -4.532292, 0, 0, 0, 1, 1,
-0.4564616, 2.253334, -0.103712, 0, 0, 0, 1, 1,
-0.4548359, 1.083711, 0.1464918, 0, 0, 0, 1, 1,
-0.454732, -0.05206607, -1.577151, 0, 0, 0, 1, 1,
-0.4540472, -0.7123879, -2.274721, 0, 0, 0, 1, 1,
-0.4532726, -1.409486, -3.867785, 0, 0, 0, 1, 1,
-0.4501942, -0.5085247, -1.693619, 0, 0, 0, 1, 1,
-0.4495488, 0.4894118, -1.010823, 1, 1, 1, 1, 1,
-0.4445376, -0.3016777, -0.835747, 1, 1, 1, 1, 1,
-0.4433043, 0.7303298, -1.632127, 1, 1, 1, 1, 1,
-0.437778, 0.205239, -1.139665, 1, 1, 1, 1, 1,
-0.4366234, 0.1698104, -1.981977, 1, 1, 1, 1, 1,
-0.4354653, 0.4259456, -0.2296364, 1, 1, 1, 1, 1,
-0.4349466, -0.4559065, -2.187646, 1, 1, 1, 1, 1,
-0.4347803, -0.1975699, -1.6975, 1, 1, 1, 1, 1,
-0.4273538, -1.19699, -2.520436, 1, 1, 1, 1, 1,
-0.4255696, 1.639875, -0.8050895, 1, 1, 1, 1, 1,
-0.4233994, 1.349981, 0.9178448, 1, 1, 1, 1, 1,
-0.4220276, -0.2500562, -3.079331, 1, 1, 1, 1, 1,
-0.4218319, -0.8381416, -3.80603, 1, 1, 1, 1, 1,
-0.417441, 0.8081295, -0.6543783, 1, 1, 1, 1, 1,
-0.415855, 0.5406008, -0.8908797, 1, 1, 1, 1, 1,
-0.4133106, 0.6259069, 0.2204013, 0, 0, 1, 1, 1,
-0.4117081, -3.179438, -4.721457, 1, 0, 0, 1, 1,
-0.4109564, -0.5770717, -2.240194, 1, 0, 0, 1, 1,
-0.4107075, 0.2054801, -1.206719, 1, 0, 0, 1, 1,
-0.4094776, -1.045122, -1.900503, 1, 0, 0, 1, 1,
-0.4009472, -0.741257, -0.6456234, 1, 0, 0, 1, 1,
-0.4008172, -0.2230025, -3.726326, 0, 0, 0, 1, 1,
-0.4002579, -1.183507, -2.568899, 0, 0, 0, 1, 1,
-0.3931934, 0.1782447, 0.5078396, 0, 0, 0, 1, 1,
-0.3902892, 0.3493127, 1.931816, 0, 0, 0, 1, 1,
-0.3798214, 0.8847995, -1.811674, 0, 0, 0, 1, 1,
-0.3791575, -0.1459548, -2.207652, 0, 0, 0, 1, 1,
-0.3774782, 0.7535551, 0.5595443, 0, 0, 0, 1, 1,
-0.3760963, 1.344607, -0.7932121, 1, 1, 1, 1, 1,
-0.3755549, 2.061407, -1.389, 1, 1, 1, 1, 1,
-0.3729485, 1.093028, 1.151172, 1, 1, 1, 1, 1,
-0.370909, 0.4744519, -1.665472, 1, 1, 1, 1, 1,
-0.3691285, 0.3855398, -1.434777, 1, 1, 1, 1, 1,
-0.3653038, 0.1151377, 0.8327914, 1, 1, 1, 1, 1,
-0.364875, -0.5611955, -2.969238, 1, 1, 1, 1, 1,
-0.3638949, 0.003223701, -2.173679, 1, 1, 1, 1, 1,
-0.3604015, -1.17299, -3.022164, 1, 1, 1, 1, 1,
-0.3569148, -0.4038667, -2.172614, 1, 1, 1, 1, 1,
-0.3526429, 0.4120719, -2.057249, 1, 1, 1, 1, 1,
-0.3522459, -1.440835, -1.825994, 1, 1, 1, 1, 1,
-0.3522348, -0.1527401, -1.873685, 1, 1, 1, 1, 1,
-0.3504283, 0.1096793, -0.3697925, 1, 1, 1, 1, 1,
-0.3468051, 0.5459424, -0.7300217, 1, 1, 1, 1, 1,
-0.3451076, -0.215041, -3.403748, 0, 0, 1, 1, 1,
-0.3413104, -0.07701969, -1.140722, 1, 0, 0, 1, 1,
-0.3355882, -0.002747825, -0.964309, 1, 0, 0, 1, 1,
-0.335079, 0.1613773, -0.2872337, 1, 0, 0, 1, 1,
-0.3322949, -0.9384666, -1.143347, 1, 0, 0, 1, 1,
-0.3238324, -1.248597, -1.836617, 1, 0, 0, 1, 1,
-0.3229627, -1.548953, -3.249649, 0, 0, 0, 1, 1,
-0.3195477, 0.5331813, -0.7747129, 0, 0, 0, 1, 1,
-0.3178419, 1.0539, -0.4796234, 0, 0, 0, 1, 1,
-0.3077842, 2.23597, -1.335111, 0, 0, 0, 1, 1,
-0.3043235, 0.4077579, -0.5644035, 0, 0, 0, 1, 1,
-0.3037834, -1.03255, -3.227978, 0, 0, 0, 1, 1,
-0.3021691, -1.121561, -3.096924, 0, 0, 0, 1, 1,
-0.3016747, -0.7116695, -3.467602, 1, 1, 1, 1, 1,
-0.2987211, -1.307952, -3.2559, 1, 1, 1, 1, 1,
-0.2956094, 0.5683653, 0.2240376, 1, 1, 1, 1, 1,
-0.2953212, 1.309468, -0.934772, 1, 1, 1, 1, 1,
-0.2919424, -0.7972153, -3.154134, 1, 1, 1, 1, 1,
-0.2860619, 1.061768, -0.1680044, 1, 1, 1, 1, 1,
-0.2859682, 0.09835848, -1.471166, 1, 1, 1, 1, 1,
-0.2836086, 1.490574, -2.08368, 1, 1, 1, 1, 1,
-0.2818258, 0.5789796, 0.5815399, 1, 1, 1, 1, 1,
-0.2688475, -0.125346, -2.881331, 1, 1, 1, 1, 1,
-0.2602759, 0.5660871, -0.4903321, 1, 1, 1, 1, 1,
-0.258138, -0.5132929, -1.897722, 1, 1, 1, 1, 1,
-0.2561984, -0.2913688, -2.302418, 1, 1, 1, 1, 1,
-0.255257, 0.4804421, -0.2325698, 1, 1, 1, 1, 1,
-0.2532129, 0.2484937, -2.683257, 1, 1, 1, 1, 1,
-0.2475801, 1.243456, 0.3018789, 0, 0, 1, 1, 1,
-0.2473946, -1.057712, -3.239663, 1, 0, 0, 1, 1,
-0.2443118, 1.03818, 1.048275, 1, 0, 0, 1, 1,
-0.2421872, 1.034587, -1.218086, 1, 0, 0, 1, 1,
-0.2389939, 0.663013, -0.7297702, 1, 0, 0, 1, 1,
-0.2387738, 0.8426001, -1.132904, 1, 0, 0, 1, 1,
-0.2381895, -0.4091085, -3.302871, 0, 0, 0, 1, 1,
-0.2378788, 1.467357, 0.4093097, 0, 0, 0, 1, 1,
-0.2369896, 0.843485, -0.2392497, 0, 0, 0, 1, 1,
-0.234578, -1.137553, -2.884619, 0, 0, 0, 1, 1,
-0.2340903, -0.2586454, -1.585249, 0, 0, 0, 1, 1,
-0.2298016, -1.333654, -3.307466, 0, 0, 0, 1, 1,
-0.2285342, 1.238137, 0.08315719, 0, 0, 0, 1, 1,
-0.2267913, 0.2200018, -1.020862, 1, 1, 1, 1, 1,
-0.2265922, -1.282153, -4.02495, 1, 1, 1, 1, 1,
-0.2189847, 0.8479295, -0.3940424, 1, 1, 1, 1, 1,
-0.2170779, -0.1059484, -0.3318382, 1, 1, 1, 1, 1,
-0.2142811, 0.0820369, -2.548639, 1, 1, 1, 1, 1,
-0.2117956, -0.5611125, -3.905727, 1, 1, 1, 1, 1,
-0.2061597, 1.399873, 1.519997, 1, 1, 1, 1, 1,
-0.2059328, 0.02695843, 0.4419861, 1, 1, 1, 1, 1,
-0.2031316, 0.2447426, -0.4251876, 1, 1, 1, 1, 1,
-0.2030482, 1.798545, -2.395228, 1, 1, 1, 1, 1,
-0.2023508, 1.455173, 0.6702501, 1, 1, 1, 1, 1,
-0.2009434, 0.6408043, -0.2806672, 1, 1, 1, 1, 1,
-0.1943591, 1.856166, 0.5226836, 1, 1, 1, 1, 1,
-0.190647, -0.2775731, -2.419533, 1, 1, 1, 1, 1,
-0.1905655, 0.07881459, -2.430865, 1, 1, 1, 1, 1,
-0.1882796, 0.8992066, -1.297441, 0, 0, 1, 1, 1,
-0.1867718, 1.238865, -2.528105, 1, 0, 0, 1, 1,
-0.1835936, 0.9938015, -0.1098249, 1, 0, 0, 1, 1,
-0.17944, 0.3560932, -0.2315459, 1, 0, 0, 1, 1,
-0.1781136, -0.05954505, -2.388174, 1, 0, 0, 1, 1,
-0.1776985, 1.935062, 1.473532, 1, 0, 0, 1, 1,
-0.1649597, 0.9140241, -0.2599943, 0, 0, 0, 1, 1,
-0.1648061, 0.4076988, -0.06089051, 0, 0, 0, 1, 1,
-0.1613074, -1.496849, -2.802042, 0, 0, 0, 1, 1,
-0.1612201, 1.716154, 0.3516535, 0, 0, 0, 1, 1,
-0.1603429, 1.219295, 2.525669, 0, 0, 0, 1, 1,
-0.1570093, 1.160434, -1.219986, 0, 0, 0, 1, 1,
-0.1557673, 1.130695, 0.04160373, 0, 0, 0, 1, 1,
-0.1549454, -0.2962502, -2.166327, 1, 1, 1, 1, 1,
-0.1546107, 0.9723729, -1.470476, 1, 1, 1, 1, 1,
-0.1484948, 0.09069748, -2.209735, 1, 1, 1, 1, 1,
-0.1482499, -1.480823, -2.51313, 1, 1, 1, 1, 1,
-0.1475079, 0.3031975, -0.2819616, 1, 1, 1, 1, 1,
-0.1458572, -1.83313, -1.473454, 1, 1, 1, 1, 1,
-0.1438814, 0.2333577, -1.327602, 1, 1, 1, 1, 1,
-0.1433508, -0.725829, -2.735125, 1, 1, 1, 1, 1,
-0.1408799, -0.1718971, -1.217057, 1, 1, 1, 1, 1,
-0.1367706, 0.7874318, -1.146777, 1, 1, 1, 1, 1,
-0.1302373, -0.7439133, -2.540427, 1, 1, 1, 1, 1,
-0.1299037, -2.072345, -2.362782, 1, 1, 1, 1, 1,
-0.1266693, 1.057835, 1.081715, 1, 1, 1, 1, 1,
-0.1231919, 1.681028, 0.1100542, 1, 1, 1, 1, 1,
-0.1226232, -0.3254558, -2.155567, 1, 1, 1, 1, 1,
-0.1212838, -0.8147525, -1.829805, 0, 0, 1, 1, 1,
-0.1174688, -0.6594864, -2.79058, 1, 0, 0, 1, 1,
-0.115846, -1.909865, -3.09725, 1, 0, 0, 1, 1,
-0.1128411, 1.480992, -0.4678359, 1, 0, 0, 1, 1,
-0.1068747, -1.975725, -2.358963, 1, 0, 0, 1, 1,
-0.1058023, -1.40742, -4.134281, 1, 0, 0, 1, 1,
-0.1057944, 0.9841611, -0.6944745, 0, 0, 0, 1, 1,
-0.1020369, 1.51175, 0.815886, 0, 0, 0, 1, 1,
-0.1002916, 1.110038, -0.5774935, 0, 0, 0, 1, 1,
-0.09729188, -0.4342373, -3.398918, 0, 0, 0, 1, 1,
-0.09476119, 0.07806072, 0.7604422, 0, 0, 0, 1, 1,
-0.09399924, 0.2556669, -0.5310512, 0, 0, 0, 1, 1,
-0.09076865, 1.193399, -1.472447, 0, 0, 0, 1, 1,
-0.08746196, 0.2185676, 0.2034614, 1, 1, 1, 1, 1,
-0.08393089, 2.33275, -0.0590879, 1, 1, 1, 1, 1,
-0.07980002, 0.3908752, 0.3836093, 1, 1, 1, 1, 1,
-0.0794727, -1.11012, -2.172853, 1, 1, 1, 1, 1,
-0.07663959, 1.222076, 0.2419769, 1, 1, 1, 1, 1,
-0.07504147, 0.9087901, 0.957799, 1, 1, 1, 1, 1,
-0.07182794, 0.3586711, -0.308971, 1, 1, 1, 1, 1,
-0.07177514, 0.3566638, 0.1153169, 1, 1, 1, 1, 1,
-0.0697507, -0.2802943, -3.319333, 1, 1, 1, 1, 1,
-0.06892891, -0.0295291, -2.066765, 1, 1, 1, 1, 1,
-0.06566056, -0.9749776, -2.543645, 1, 1, 1, 1, 1,
-0.06363486, 0.02523107, -0.8146011, 1, 1, 1, 1, 1,
-0.06190786, 0.3034293, -0.8725996, 1, 1, 1, 1, 1,
-0.06001689, -1.187001, -3.109853, 1, 1, 1, 1, 1,
-0.05689613, -0.9151912, -2.682624, 1, 1, 1, 1, 1,
-0.04930057, 0.5153803, -0.2804108, 0, 0, 1, 1, 1,
-0.04683932, -0.378924, -5.471477, 1, 0, 0, 1, 1,
-0.04525096, -1.046648, -2.765116, 1, 0, 0, 1, 1,
-0.0438558, -0.1605693, -3.664558, 1, 0, 0, 1, 1,
-0.0427963, -1.525498, -3.061063, 1, 0, 0, 1, 1,
-0.03951101, -1.286686, -2.614358, 1, 0, 0, 1, 1,
-0.03893168, 0.3827718, 1.140673, 0, 0, 0, 1, 1,
-0.03587538, 1.169229, -0.08746725, 0, 0, 0, 1, 1,
-0.03365175, -2.020906, -2.865341, 0, 0, 0, 1, 1,
-0.02929485, 0.5368844, 1.483385, 0, 0, 0, 1, 1,
-0.02627473, 0.096686, -0.03733898, 0, 0, 0, 1, 1,
-0.02608627, -0.2650444, -4.221945, 0, 0, 0, 1, 1,
-0.02512344, -0.1445945, -4.003701, 0, 0, 0, 1, 1,
-0.02352667, -1.036051, -3.088497, 1, 1, 1, 1, 1,
-0.02211911, -0.4564465, -2.925089, 1, 1, 1, 1, 1,
-0.02068615, -1.188139, -2.703122, 1, 1, 1, 1, 1,
-0.01619735, -2.648767, -3.518667, 1, 1, 1, 1, 1,
-0.0113939, 2.657073, -1.422239, 1, 1, 1, 1, 1,
-0.008845857, 1.225493, 1.724627, 1, 1, 1, 1, 1,
-0.003778967, 0.01639319, 0.1100272, 1, 1, 1, 1, 1,
-0.003641448, -1.293408, -3.225911, 1, 1, 1, 1, 1,
-0.00316696, -0.5552436, -4.30964, 1, 1, 1, 1, 1,
0.001119798, 0.2496595, 1.956237, 1, 1, 1, 1, 1,
0.001470438, -0.07385745, 3.690474, 1, 1, 1, 1, 1,
0.002891523, -1.486981, 3.860744, 1, 1, 1, 1, 1,
0.004460297, 3.508992, 2.144715, 1, 1, 1, 1, 1,
0.008922113, 0.6996772, -0.7332584, 1, 1, 1, 1, 1,
0.01278102, 0.7254187, 0.4773052, 1, 1, 1, 1, 1,
0.01918058, 0.2084762, -0.8837028, 0, 0, 1, 1, 1,
0.01982932, -0.4918692, 3.451589, 1, 0, 0, 1, 1,
0.02475817, -1.748111, 2.999021, 1, 0, 0, 1, 1,
0.02496565, -0.1902303, 1.970842, 1, 0, 0, 1, 1,
0.02618559, -2.08103, 3.984515, 1, 0, 0, 1, 1,
0.02704766, 0.3769222, 1.498121, 1, 0, 0, 1, 1,
0.02797035, -0.9927022, 5.923276, 0, 0, 0, 1, 1,
0.03245115, -1.052121, 2.316806, 0, 0, 0, 1, 1,
0.03488135, -0.8130701, 1.819808, 0, 0, 0, 1, 1,
0.03620673, -0.4461325, 2.162422, 0, 0, 0, 1, 1,
0.03689887, -0.02991007, 0.9642825, 0, 0, 0, 1, 1,
0.03739418, -1.404553, 3.892015, 0, 0, 0, 1, 1,
0.03831141, 0.41288, 0.4404804, 0, 0, 0, 1, 1,
0.03853063, -0.293786, 4.201961, 1, 1, 1, 1, 1,
0.039538, 0.2964064, 0.3012525, 1, 1, 1, 1, 1,
0.04646098, 2.004851, 0.111522, 1, 1, 1, 1, 1,
0.05011175, 0.4736307, 0.09942455, 1, 1, 1, 1, 1,
0.0515797, 0.02660608, 1.071717, 1, 1, 1, 1, 1,
0.05376081, -0.6151622, 5.160132, 1, 1, 1, 1, 1,
0.05632543, -1.383083, 3.933728, 1, 1, 1, 1, 1,
0.0574462, 1.307036, -0.7474833, 1, 1, 1, 1, 1,
0.0618315, 0.7570467, -0.1343147, 1, 1, 1, 1, 1,
0.06897765, 0.3056152, 1.610111, 1, 1, 1, 1, 1,
0.07367556, 0.01829487, 1.282316, 1, 1, 1, 1, 1,
0.07428653, 0.5149588, -0.8884779, 1, 1, 1, 1, 1,
0.07659648, 1.023116, -0.9764076, 1, 1, 1, 1, 1,
0.07823116, 0.7537796, -1.158368, 1, 1, 1, 1, 1,
0.07855583, -0.2548444, 2.319077, 1, 1, 1, 1, 1,
0.07908638, 1.875615, 0.7185881, 0, 0, 1, 1, 1,
0.07914385, -0.2619299, 3.332789, 1, 0, 0, 1, 1,
0.08053133, -0.7084011, 4.595788, 1, 0, 0, 1, 1,
0.08316094, 0.7731211, -0.4471054, 1, 0, 0, 1, 1,
0.08340155, 0.2404821, 0.7552436, 1, 0, 0, 1, 1,
0.08368298, -0.2034283, 3.387346, 1, 0, 0, 1, 1,
0.08959239, -0.8207594, 2.744994, 0, 0, 0, 1, 1,
0.09097876, 1.084623, 0.5329549, 0, 0, 0, 1, 1,
0.09106901, -1.464099, 2.76223, 0, 0, 0, 1, 1,
0.09194982, 0.1317763, 1.824514, 0, 0, 0, 1, 1,
0.09232821, -0.1928059, 4.098356, 0, 0, 0, 1, 1,
0.09583437, -0.7512833, 3.290475, 0, 0, 0, 1, 1,
0.09743099, 0.7690485, -0.8149068, 0, 0, 0, 1, 1,
0.1009704, -0.1463016, 2.486747, 1, 1, 1, 1, 1,
0.1031432, 0.07200809, 0.9899911, 1, 1, 1, 1, 1,
0.112299, 1.216721, 2.042552, 1, 1, 1, 1, 1,
0.1135327, -0.4045219, 2.841485, 1, 1, 1, 1, 1,
0.1179926, -1.051621, 3.121372, 1, 1, 1, 1, 1,
0.1182702, 0.1277682, 2.668847, 1, 1, 1, 1, 1,
0.1184574, 0.2253139, 0.7617143, 1, 1, 1, 1, 1,
0.1189234, -0.1804262, 2.415483, 1, 1, 1, 1, 1,
0.1236735, 0.2750048, 1.633094, 1, 1, 1, 1, 1,
0.123985, -0.4371716, 2.244264, 1, 1, 1, 1, 1,
0.1261894, 0.5079648, -0.05790005, 1, 1, 1, 1, 1,
0.1273144, -1.809729, 2.682897, 1, 1, 1, 1, 1,
0.1299407, -0.6442124, 1.691566, 1, 1, 1, 1, 1,
0.1331861, -0.4588273, 2.382351, 1, 1, 1, 1, 1,
0.1348948, -2.34481, 3.035691, 1, 1, 1, 1, 1,
0.1363093, -0.8249914, 1.607164, 0, 0, 1, 1, 1,
0.1386018, -0.4664027, 1.5584, 1, 0, 0, 1, 1,
0.1415335, 0.1894782, -0.7415981, 1, 0, 0, 1, 1,
0.1440332, -1.344002, 4.402259, 1, 0, 0, 1, 1,
0.1519113, -0.8439288, 1.244619, 1, 0, 0, 1, 1,
0.152133, 0.5789608, 0.5199798, 1, 0, 0, 1, 1,
0.1533448, -0.5678049, 3.533469, 0, 0, 0, 1, 1,
0.1536473, -1.660105, 3.71648, 0, 0, 0, 1, 1,
0.1540423, -0.4397727, 0.8929054, 0, 0, 0, 1, 1,
0.1540596, 0.2523846, 0.8414505, 0, 0, 0, 1, 1,
0.1559218, 0.9381261, -0.1760422, 0, 0, 0, 1, 1,
0.1613615, 0.3030457, 2.146987, 0, 0, 0, 1, 1,
0.1629863, 0.07914739, 0.98897, 0, 0, 0, 1, 1,
0.1652842, 0.9999048, 0.8499072, 1, 1, 1, 1, 1,
0.1694613, -2.763693, 4.936956, 1, 1, 1, 1, 1,
0.1757666, -0.3125173, 3.470823, 1, 1, 1, 1, 1,
0.1766024, 0.8006629, -0.7516344, 1, 1, 1, 1, 1,
0.177463, 0.2952663, 0.8589528, 1, 1, 1, 1, 1,
0.1775468, 0.5316536, -1.533056, 1, 1, 1, 1, 1,
0.1788132, -0.1642028, 2.707623, 1, 1, 1, 1, 1,
0.1818146, -1.520259, 3.155487, 1, 1, 1, 1, 1,
0.1841648, 0.4003346, 1.260602, 1, 1, 1, 1, 1,
0.1847965, 1.234903, 0.2925689, 1, 1, 1, 1, 1,
0.1874102, -1.448089, 2.506173, 1, 1, 1, 1, 1,
0.1896958, 0.3522935, -0.206957, 1, 1, 1, 1, 1,
0.2010309, 0.3782287, 0.9853403, 1, 1, 1, 1, 1,
0.2017585, -0.6272503, 2.949884, 1, 1, 1, 1, 1,
0.2130263, -0.4661332, 1.442578, 1, 1, 1, 1, 1,
0.2206633, -0.09557024, 1.184581, 0, 0, 1, 1, 1,
0.2249583, 0.8343567, 0.02940197, 1, 0, 0, 1, 1,
0.2305715, -0.8605486, 4.434238, 1, 0, 0, 1, 1,
0.232254, 1.343889, -0.05903218, 1, 0, 0, 1, 1,
0.2353429, 0.9028262, -0.6927529, 1, 0, 0, 1, 1,
0.2408024, -0.09390463, 2.732033, 1, 0, 0, 1, 1,
0.241615, -0.7636566, 2.040358, 0, 0, 0, 1, 1,
0.2436731, 1.11315, 1.561211, 0, 0, 0, 1, 1,
0.2510177, 1.2144, 1.26561, 0, 0, 0, 1, 1,
0.2528951, -0.3344353, 2.791213, 0, 0, 0, 1, 1,
0.2579202, 2.131675, 2.285392, 0, 0, 0, 1, 1,
0.2599865, -0.1905673, 1.688628, 0, 0, 0, 1, 1,
0.2608468, 0.7285102, 1.61066, 0, 0, 0, 1, 1,
0.2633373, -0.806743, 2.8072, 1, 1, 1, 1, 1,
0.2657803, -0.9140913, 3.045283, 1, 1, 1, 1, 1,
0.2668608, 2.284223, -0.2771484, 1, 1, 1, 1, 1,
0.2728435, 1.944992, -0.1636008, 1, 1, 1, 1, 1,
0.274652, -0.707121, 1.46873, 1, 1, 1, 1, 1,
0.2827833, 0.9831967, 1.504816, 1, 1, 1, 1, 1,
0.2831019, -0.7353929, 4.822522, 1, 1, 1, 1, 1,
0.2865115, 2.556743, 0.4953932, 1, 1, 1, 1, 1,
0.2879372, 0.2070809, 2.205262, 1, 1, 1, 1, 1,
0.2891239, -0.2803576, 0.8373707, 1, 1, 1, 1, 1,
0.2902137, 1.371409, 0.4075769, 1, 1, 1, 1, 1,
0.2945302, 0.6847848, 1.074311, 1, 1, 1, 1, 1,
0.2945339, -1.548237, 2.833374, 1, 1, 1, 1, 1,
0.2969453, -0.6722232, 3.591697, 1, 1, 1, 1, 1,
0.2997756, -1.050581, 2.697989, 1, 1, 1, 1, 1,
0.3022819, -1.097123, 3.352434, 0, 0, 1, 1, 1,
0.3049826, 0.1858909, -0.08858062, 1, 0, 0, 1, 1,
0.30734, -0.2443069, 2.184536, 1, 0, 0, 1, 1,
0.3117063, -0.2857729, 2.956179, 1, 0, 0, 1, 1,
0.3193572, -1.391634, 1.243794, 1, 0, 0, 1, 1,
0.3275913, -0.7482494, 2.58361, 1, 0, 0, 1, 1,
0.3286901, -0.6394523, 3.65279, 0, 0, 0, 1, 1,
0.333333, 0.1839171, 0.04730509, 0, 0, 0, 1, 1,
0.3349424, -0.03673147, 1.392892, 0, 0, 0, 1, 1,
0.336034, -1.379648, 1.456982, 0, 0, 0, 1, 1,
0.3365653, 0.5919177, 1.220387, 0, 0, 0, 1, 1,
0.3396233, -0.3799205, 3.314853, 0, 0, 0, 1, 1,
0.3416058, -1.19139, 3.475587, 0, 0, 0, 1, 1,
0.3427623, 2.09552, 0.8408638, 1, 1, 1, 1, 1,
0.3433746, -0.03458839, 0.3133503, 1, 1, 1, 1, 1,
0.3527198, -2.122153, 1.797288, 1, 1, 1, 1, 1,
0.3630088, -1.12565, 3.206811, 1, 1, 1, 1, 1,
0.372354, 1.792931, -1.556234, 1, 1, 1, 1, 1,
0.3726743, 1.069928, 0.5803472, 1, 1, 1, 1, 1,
0.3734663, -2.159955, 2.186387, 1, 1, 1, 1, 1,
0.374956, -0.4474112, 0.8149684, 1, 1, 1, 1, 1,
0.3766667, -0.16182, 2.905651, 1, 1, 1, 1, 1,
0.3838204, -0.6673611, 4.013813, 1, 1, 1, 1, 1,
0.3885516, -0.03111251, 1.996816, 1, 1, 1, 1, 1,
0.3897161, -0.5261427, 4.104737, 1, 1, 1, 1, 1,
0.3928981, -0.05364754, 3.711668, 1, 1, 1, 1, 1,
0.3929042, 0.3248842, 1.201814, 1, 1, 1, 1, 1,
0.3955503, 0.08523282, -0.231161, 1, 1, 1, 1, 1,
0.4083576, 0.4047093, 1.803964, 0, 0, 1, 1, 1,
0.4143184, -0.5252733, 1.794917, 1, 0, 0, 1, 1,
0.4160669, -1.30038, 3.199878, 1, 0, 0, 1, 1,
0.419158, -1.160818, 4.378844, 1, 0, 0, 1, 1,
0.4192097, -1.700167, 2.112501, 1, 0, 0, 1, 1,
0.4216036, 0.2871355, 0.7352729, 1, 0, 0, 1, 1,
0.4254043, 0.005629059, 0.8504273, 0, 0, 0, 1, 1,
0.4270351, -0.4758317, 2.927251, 0, 0, 0, 1, 1,
0.4355697, -2.161368, 3.58317, 0, 0, 0, 1, 1,
0.4402676, -1.055661, 1.822098, 0, 0, 0, 1, 1,
0.4406865, 0.9412105, 1.394852, 0, 0, 0, 1, 1,
0.4497102, -2.076291, 2.885405, 0, 0, 0, 1, 1,
0.4503464, -0.575695, 3.497035, 0, 0, 0, 1, 1,
0.4503685, 1.039717, -0.2862178, 1, 1, 1, 1, 1,
0.4506421, -0.5470012, 3.061199, 1, 1, 1, 1, 1,
0.4514785, -2.487793, 1.204323, 1, 1, 1, 1, 1,
0.4548942, -1.375544, 1.305762, 1, 1, 1, 1, 1,
0.4551098, 0.8117083, -0.194388, 1, 1, 1, 1, 1,
0.4584907, 0.2511216, 0.2942068, 1, 1, 1, 1, 1,
0.4610135, 2.811121, 0.5887393, 1, 1, 1, 1, 1,
0.4683, -0.05146648, 2.741934, 1, 1, 1, 1, 1,
0.4703166, 1.097489, -2.049159, 1, 1, 1, 1, 1,
0.4722447, -1.230423, 2.676691, 1, 1, 1, 1, 1,
0.4723731, 0.4400726, 1.155544, 1, 1, 1, 1, 1,
0.4759989, 0.7986683, 1.3046, 1, 1, 1, 1, 1,
0.4762886, -1.037195, 3.106285, 1, 1, 1, 1, 1,
0.4792829, 0.5257079, -0.08099524, 1, 1, 1, 1, 1,
0.4795225, 0.9666114, 0.4064699, 1, 1, 1, 1, 1,
0.4887961, 0.3220091, 1.511591, 0, 0, 1, 1, 1,
0.4926484, 0.7634568, 0.0777593, 1, 0, 0, 1, 1,
0.4934593, -0.7714787, 3.024933, 1, 0, 0, 1, 1,
0.498847, 0.1858011, 2.533133, 1, 0, 0, 1, 1,
0.5013576, -0.4079743, 0.5188688, 1, 0, 0, 1, 1,
0.501987, -1.451655, 4.324647, 1, 0, 0, 1, 1,
0.5055475, 1.010549, 0.5042092, 0, 0, 0, 1, 1,
0.5063537, -0.05653851, 2.651644, 0, 0, 0, 1, 1,
0.511529, -0.4747191, 2.341321, 0, 0, 0, 1, 1,
0.5118986, 1.425249, -0.802242, 0, 0, 0, 1, 1,
0.5146543, 0.582083, 0.9676784, 0, 0, 0, 1, 1,
0.5210229, 1.095088, -0.4974979, 0, 0, 0, 1, 1,
0.5216601, 0.8956114, 1.347891, 0, 0, 0, 1, 1,
0.5236635, 0.06868379, 1.742448, 1, 1, 1, 1, 1,
0.5246266, -0.9433314, 3.072209, 1, 1, 1, 1, 1,
0.5260715, -1.332789, 2.170753, 1, 1, 1, 1, 1,
0.5280393, -1.017182, 2.268077, 1, 1, 1, 1, 1,
0.5318078, -0.8047988, 2.413082, 1, 1, 1, 1, 1,
0.5396875, 0.966858, 0.391726, 1, 1, 1, 1, 1,
0.5406569, 1.387994, 0.5494129, 1, 1, 1, 1, 1,
0.5424942, -1.817294, 1.954965, 1, 1, 1, 1, 1,
0.5467831, -0.1542964, 2.072388, 1, 1, 1, 1, 1,
0.5474317, 2.690948, 0.1845531, 1, 1, 1, 1, 1,
0.5550053, 1.157594, 1.483205, 1, 1, 1, 1, 1,
0.5553532, -0.3163773, 0.06594036, 1, 1, 1, 1, 1,
0.5610204, -1.080768, 2.069813, 1, 1, 1, 1, 1,
0.561669, 0.1701322, 0.7792453, 1, 1, 1, 1, 1,
0.5620653, -1.48711, -0.1754187, 1, 1, 1, 1, 1,
0.563737, 0.3321097, -0.6304408, 0, 0, 1, 1, 1,
0.5672397, -3.036854, 2.417091, 1, 0, 0, 1, 1,
0.567566, -1.769627, 3.71108, 1, 0, 0, 1, 1,
0.5681677, 0.5089502, 0.364251, 1, 0, 0, 1, 1,
0.5720528, 0.2794107, -1.43912, 1, 0, 0, 1, 1,
0.5754265, -0.597428, 2.120286, 1, 0, 0, 1, 1,
0.5761241, 1.804424, 0.3325593, 0, 0, 0, 1, 1,
0.5765409, -0.7645975, 1.256016, 0, 0, 0, 1, 1,
0.580303, 0.320913, 3.166179, 0, 0, 0, 1, 1,
0.5824504, -0.01672258, 2.938144, 0, 0, 0, 1, 1,
0.5844319, 0.09606445, 2.233448, 0, 0, 0, 1, 1,
0.5849386, 1.648306, -0.3621601, 0, 0, 0, 1, 1,
0.5851319, -2.095163, 1.900866, 0, 0, 0, 1, 1,
0.5924711, -1.826783, 4.209404, 1, 1, 1, 1, 1,
0.5980113, -2.294977, 3.044316, 1, 1, 1, 1, 1,
0.5997755, 1.110211, 1.594428, 1, 1, 1, 1, 1,
0.6005948, 0.5143307, 0.1983777, 1, 1, 1, 1, 1,
0.6025265, -1.131157, 0.3319308, 1, 1, 1, 1, 1,
0.6088312, 0.09872608, 0.3386442, 1, 1, 1, 1, 1,
0.6093011, 0.3715166, 0.7757186, 1, 1, 1, 1, 1,
0.6124009, 1.100657, 1.779356, 1, 1, 1, 1, 1,
0.6160894, 0.8922032, -0.1576549, 1, 1, 1, 1, 1,
0.617498, -1.322102, 4.110889, 1, 1, 1, 1, 1,
0.6177546, -1.89944, 3.548477, 1, 1, 1, 1, 1,
0.6204581, 0.8439355, 1.301851, 1, 1, 1, 1, 1,
0.6212306, 1.4495, 0.5890041, 1, 1, 1, 1, 1,
0.6224626, -0.3694938, 3.341504, 1, 1, 1, 1, 1,
0.6252748, 0.6748208, 2.31199, 1, 1, 1, 1, 1,
0.625411, 0.8821928, -0.8227397, 0, 0, 1, 1, 1,
0.6259609, 1.226738, -0.5526792, 1, 0, 0, 1, 1,
0.6279859, 0.8004532, 0.2731735, 1, 0, 0, 1, 1,
0.6360171, 1.646978, -1.4798, 1, 0, 0, 1, 1,
0.6432723, -1.980225, 2.419675, 1, 0, 0, 1, 1,
0.6438435, 0.2849639, 0.5453421, 1, 0, 0, 1, 1,
0.6512575, -0.5966221, 4.206967, 0, 0, 0, 1, 1,
0.6544492, -0.6083131, 3.558599, 0, 0, 0, 1, 1,
0.6579759, -1.227832, 4.632836, 0, 0, 0, 1, 1,
0.6589726, -0.170602, 2.744192, 0, 0, 0, 1, 1,
0.6592222, -1.775515, 1.50584, 0, 0, 0, 1, 1,
0.6628188, 0.0182282, 0.4121756, 0, 0, 0, 1, 1,
0.6663899, 2.039243, 0.3293626, 0, 0, 0, 1, 1,
0.6688977, -2.333635, 1.955518, 1, 1, 1, 1, 1,
0.6777322, -0.2230911, 1.526015, 1, 1, 1, 1, 1,
0.6802486, -0.8679529, 1.105086, 1, 1, 1, 1, 1,
0.6804113, 0.03887798, 1.762196, 1, 1, 1, 1, 1,
0.6807953, -0.02854845, 1.641654, 1, 1, 1, 1, 1,
0.6843475, -0.4263311, 1.499473, 1, 1, 1, 1, 1,
0.6859474, 1.024754, 1.943703, 1, 1, 1, 1, 1,
0.6889398, 0.8023891, 0.09537223, 1, 1, 1, 1, 1,
0.6986271, -1.04358, 3.731565, 1, 1, 1, 1, 1,
0.7076771, -0.6493582, 2.497556, 1, 1, 1, 1, 1,
0.7116217, 0.4387374, 0.1235659, 1, 1, 1, 1, 1,
0.7149409, 0.8838049, 0.1883305, 1, 1, 1, 1, 1,
0.7153046, 1.397445, 0.9510208, 1, 1, 1, 1, 1,
0.7175261, -0.4512585, 3.502715, 1, 1, 1, 1, 1,
0.7251818, -1.43614, 2.523861, 1, 1, 1, 1, 1,
0.7268742, -0.2245508, 1.629585, 0, 0, 1, 1, 1,
0.7284999, -0.3416206, 0.5612274, 1, 0, 0, 1, 1,
0.7361612, 1.804924, -1.424981, 1, 0, 0, 1, 1,
0.7400731, -1.506111, 3.013265, 1, 0, 0, 1, 1,
0.7407972, -1.398779, 3.405442, 1, 0, 0, 1, 1,
0.7426856, -0.1441215, 1.566702, 1, 0, 0, 1, 1,
0.7453351, 0.5451738, 0.6347312, 0, 0, 0, 1, 1,
0.7537264, 0.4629008, -0.4327478, 0, 0, 0, 1, 1,
0.756751, 0.9193859, 2.611766, 0, 0, 0, 1, 1,
0.7587594, -0.3469707, 1.5634, 0, 0, 0, 1, 1,
0.7628125, 0.2465669, 0.1951158, 0, 0, 0, 1, 1,
0.7632351, 1.158866, 1.316964, 0, 0, 0, 1, 1,
0.7655808, 0.8720201, 0.4168725, 0, 0, 0, 1, 1,
0.7683693, 0.3620968, 1.733203, 1, 1, 1, 1, 1,
0.7691736, -0.9101825, 2.900349, 1, 1, 1, 1, 1,
0.7760637, 0.2865651, 1.270979, 1, 1, 1, 1, 1,
0.7779864, 0.05001245, 1.227851, 1, 1, 1, 1, 1,
0.7783917, -1.40919, 1.686139, 1, 1, 1, 1, 1,
0.7842131, -0.4328808, 1.55978, 1, 1, 1, 1, 1,
0.7853624, -0.7171147, 2.753395, 1, 1, 1, 1, 1,
0.7861443, -0.1455343, 1.421069, 1, 1, 1, 1, 1,
0.7866641, 0.4608203, 1.808249, 1, 1, 1, 1, 1,
0.7879608, 0.3082983, 2.750194, 1, 1, 1, 1, 1,
0.7918226, -0.2540522, 1.857415, 1, 1, 1, 1, 1,
0.7926829, -0.8835533, 0.3145662, 1, 1, 1, 1, 1,
0.7981256, -0.2592527, 1.544906, 1, 1, 1, 1, 1,
0.799028, 1.256358, 0.4545223, 1, 1, 1, 1, 1,
0.7990533, -0.5357932, 2.421283, 1, 1, 1, 1, 1,
0.8006817, -0.4983627, 1.790852, 0, 0, 1, 1, 1,
0.8013994, -0.1722992, 1.623081, 1, 0, 0, 1, 1,
0.8020648, -1.425984, 3.359569, 1, 0, 0, 1, 1,
0.8045087, 0.1406188, 0.05471244, 1, 0, 0, 1, 1,
0.807228, -0.1013558, 2.527061, 1, 0, 0, 1, 1,
0.8072968, -0.2587527, 0.4557495, 1, 0, 0, 1, 1,
0.8094147, -0.2177127, 3.234577, 0, 0, 0, 1, 1,
0.8173453, -1.569544, 2.493498, 0, 0, 0, 1, 1,
0.8257514, 1.26463, 0.195771, 0, 0, 0, 1, 1,
0.8277814, -0.8579178, 0.954091, 0, 0, 0, 1, 1,
0.8381177, 0.4474664, 2.608714, 0, 0, 0, 1, 1,
0.8436272, -0.3462572, 3.046536, 0, 0, 0, 1, 1,
0.8538503, -0.1401096, 2.582253, 0, 0, 0, 1, 1,
0.8547161, 0.1514298, 2.059145, 1, 1, 1, 1, 1,
0.8549837, -0.7645779, 2.004474, 1, 1, 1, 1, 1,
0.8565854, 1.900004, 2.84648, 1, 1, 1, 1, 1,
0.8587893, -0.9238691, 2.932931, 1, 1, 1, 1, 1,
0.8658099, 0.05696412, 2.438355, 1, 1, 1, 1, 1,
0.8789445, -0.1707896, 2.011896, 1, 1, 1, 1, 1,
0.8793616, -1.362205, 2.194167, 1, 1, 1, 1, 1,
0.8921009, -1.104538, 1.471877, 1, 1, 1, 1, 1,
0.8931087, -1.19117, 3.692798, 1, 1, 1, 1, 1,
0.894709, 0.3666652, 0.970128, 1, 1, 1, 1, 1,
0.8949466, 0.8414176, 1.236101, 1, 1, 1, 1, 1,
0.903185, 0.4241495, 0.8158481, 1, 1, 1, 1, 1,
0.907729, -0.5693625, 1.676703, 1, 1, 1, 1, 1,
0.9118066, 0.3289697, 0.7664046, 1, 1, 1, 1, 1,
0.9131407, 1.19559, 0.08742142, 1, 1, 1, 1, 1,
0.9178547, 1.334881, 2.863857, 0, 0, 1, 1, 1,
0.9291509, -1.085628, 2.521217, 1, 0, 0, 1, 1,
0.9292825, -0.5246711, 1.710978, 1, 0, 0, 1, 1,
0.9311094, 1.157568, 1.578569, 1, 0, 0, 1, 1,
0.9314896, 0.9040357, -0.03880573, 1, 0, 0, 1, 1,
0.9316443, -0.7646692, 1.733127, 1, 0, 0, 1, 1,
0.9353235, -0.6821768, 1.705304, 0, 0, 0, 1, 1,
0.9369572, 1.06678, 0.2866575, 0, 0, 0, 1, 1,
0.943847, 2.064448, -1.387671, 0, 0, 0, 1, 1,
0.9453182, -0.7774608, 2.225186, 0, 0, 0, 1, 1,
0.9477456, 3.270239, 0.3119014, 0, 0, 0, 1, 1,
0.9504783, -0.08456659, 2.539273, 0, 0, 0, 1, 1,
0.9527261, -0.05981141, 1.367525, 0, 0, 0, 1, 1,
0.9529663, 0.286038, 1.76235, 1, 1, 1, 1, 1,
0.9597838, 0.5616952, 1.861208, 1, 1, 1, 1, 1,
0.961971, 0.07560924, 1.522331, 1, 1, 1, 1, 1,
0.9748583, -1.037902, 1.949203, 1, 1, 1, 1, 1,
0.9752297, 2.927867, 0.03854236, 1, 1, 1, 1, 1,
0.9814665, 0.05200531, 1.847917, 1, 1, 1, 1, 1,
0.984104, -0.7959059, 0.9318872, 1, 1, 1, 1, 1,
0.9879832, 2.582809, -0.3631471, 1, 1, 1, 1, 1,
0.9950906, -0.2173209, 2.854969, 1, 1, 1, 1, 1,
1.000836, -0.2737425, 0.5289956, 1, 1, 1, 1, 1,
1.00207, 0.2536248, 2.264225, 1, 1, 1, 1, 1,
1.002338, -0.5262213, 1.531923, 1, 1, 1, 1, 1,
1.00371, 0.6954256, 0.223649, 1, 1, 1, 1, 1,
1.016864, -0.3383713, 1.802774, 1, 1, 1, 1, 1,
1.017393, -0.8336757, 2.638537, 1, 1, 1, 1, 1,
1.020491, -1.1119, 1.896659, 0, 0, 1, 1, 1,
1.031971, 1.225597, 0.8788695, 1, 0, 0, 1, 1,
1.039326, -0.3184548, 1.55952, 1, 0, 0, 1, 1,
1.039834, 0.9990724, -1.015543, 1, 0, 0, 1, 1,
1.041873, -0.5478017, 1.745579, 1, 0, 0, 1, 1,
1.041925, 0.2721249, 1.003403, 1, 0, 0, 1, 1,
1.050102, 0.9653525, 2.072244, 0, 0, 0, 1, 1,
1.057266, 1.42579, 2.091608, 0, 0, 0, 1, 1,
1.066204, 0.6469548, 2.63698, 0, 0, 0, 1, 1,
1.068124, 0.5851631, 1.757224, 0, 0, 0, 1, 1,
1.070319, 0.322899, 1.761201, 0, 0, 0, 1, 1,
1.071454, -0.3142048, 2.36569, 0, 0, 0, 1, 1,
1.080679, -0.7150565, 2.122542, 0, 0, 0, 1, 1,
1.080857, 0.1155889, 0.3156231, 1, 1, 1, 1, 1,
1.081946, 0.8957765, 1.72456, 1, 1, 1, 1, 1,
1.083133, 0.03860642, 1.932465, 1, 1, 1, 1, 1,
1.08428, -0.1338026, 3.211281, 1, 1, 1, 1, 1,
1.091596, -0.6836469, 1.237965, 1, 1, 1, 1, 1,
1.096637, -0.7160147, 1.506638, 1, 1, 1, 1, 1,
1.101553, 0.3191636, 0.09718899, 1, 1, 1, 1, 1,
1.104748, 0.9102319, 3.486756, 1, 1, 1, 1, 1,
1.106133, -0.3332064, 1.856356, 1, 1, 1, 1, 1,
1.114017, -0.8415161, 2.492003, 1, 1, 1, 1, 1,
1.115631, 0.865455, 1.891578, 1, 1, 1, 1, 1,
1.116782, -0.1241605, 0.5212898, 1, 1, 1, 1, 1,
1.117782, -0.3823186, 2.637775, 1, 1, 1, 1, 1,
1.119809, -0.7311811, 1.936798, 1, 1, 1, 1, 1,
1.12967, -0.05269648, 1.33972, 1, 1, 1, 1, 1,
1.140663, 1.450879, 0.8526073, 0, 0, 1, 1, 1,
1.149096, -2.292958, 2.802144, 1, 0, 0, 1, 1,
1.154909, 0.2512255, 2.741232, 1, 0, 0, 1, 1,
1.16334, 0.4558852, 0.1500446, 1, 0, 0, 1, 1,
1.164065, 2.330019, -3.167468, 1, 0, 0, 1, 1,
1.169664, 0.3964857, 0.3201727, 1, 0, 0, 1, 1,
1.174808, -0.07388137, 0.2238591, 0, 0, 0, 1, 1,
1.184142, 0.8610941, 1.239262, 0, 0, 0, 1, 1,
1.186118, 0.7029076, 1.432336, 0, 0, 0, 1, 1,
1.188364, -0.9098307, 2.64354, 0, 0, 0, 1, 1,
1.191513, -0.809011, 1.518399, 0, 0, 0, 1, 1,
1.191719, -0.9351379, 3.409152, 0, 0, 0, 1, 1,
1.192531, 0.6532872, 0.8885564, 0, 0, 0, 1, 1,
1.208127, -0.8769969, 0.9317563, 1, 1, 1, 1, 1,
1.209148, -0.1679665, 0.2912004, 1, 1, 1, 1, 1,
1.212845, 1.783995, -0.5578108, 1, 1, 1, 1, 1,
1.214816, 0.07471958, 0.7889768, 1, 1, 1, 1, 1,
1.226257, 0.4443918, 0.4563067, 1, 1, 1, 1, 1,
1.226897, 0.05899727, 3.333524, 1, 1, 1, 1, 1,
1.228594, -0.1720282, 2.305653, 1, 1, 1, 1, 1,
1.232553, 0.7386787, 1.58233, 1, 1, 1, 1, 1,
1.238728, -1.194438, 3.660361, 1, 1, 1, 1, 1,
1.252186, -0.8380236, 1.184575, 1, 1, 1, 1, 1,
1.253237, -0.8240197, 3.060042, 1, 1, 1, 1, 1,
1.255603, 0.5238813, 0.3982566, 1, 1, 1, 1, 1,
1.257348, -0.538641, 2.008056, 1, 1, 1, 1, 1,
1.257812, -0.5589516, 1.591365, 1, 1, 1, 1, 1,
1.258041, -0.373504, 1.738008, 1, 1, 1, 1, 1,
1.258503, 0.1058515, -0.5906017, 0, 0, 1, 1, 1,
1.261203, -0.9854257, 1.952953, 1, 0, 0, 1, 1,
1.264341, -0.3542985, 1.369854, 1, 0, 0, 1, 1,
1.266316, 0.6183952, 1.024492, 1, 0, 0, 1, 1,
1.273345, 0.961042, 0.1426082, 1, 0, 0, 1, 1,
1.278012, -0.2945711, 1.949219, 1, 0, 0, 1, 1,
1.289124, -0.6177406, 1.055452, 0, 0, 0, 1, 1,
1.291599, -0.662789, 0.2886842, 0, 0, 0, 1, 1,
1.29226, 0.2154381, 1.042493, 0, 0, 0, 1, 1,
1.29949, 0.03663922, 2.651468, 0, 0, 0, 1, 1,
1.305503, -0.1055554, 1.494971, 0, 0, 0, 1, 1,
1.313869, 1.173775, 2.358238, 0, 0, 0, 1, 1,
1.316813, 0.9174874, -0.1138234, 0, 0, 0, 1, 1,
1.328018, 0.1268503, 2.278099, 1, 1, 1, 1, 1,
1.330461, -1.790486, 3.580619, 1, 1, 1, 1, 1,
1.334428, -0.884587, 3.571646, 1, 1, 1, 1, 1,
1.339759, -1.382775, -0.1187814, 1, 1, 1, 1, 1,
1.342376, -0.8792432, 1.900449, 1, 1, 1, 1, 1,
1.342773, 0.4779707, 0.5864915, 1, 1, 1, 1, 1,
1.348046, 0.8603218, 3.652975, 1, 1, 1, 1, 1,
1.367263, -0.3511911, 0.2680606, 1, 1, 1, 1, 1,
1.375296, -1.003917, 1.757632, 1, 1, 1, 1, 1,
1.380645, -0.9552069, 1.496004, 1, 1, 1, 1, 1,
1.382572, -0.2719452, 1.850266, 1, 1, 1, 1, 1,
1.388287, 1.789585, 1.210962, 1, 1, 1, 1, 1,
1.394216, -0.1209391, 1.482166, 1, 1, 1, 1, 1,
1.395297, -0.04984637, 0.2726945, 1, 1, 1, 1, 1,
1.42018, -1.073307, 1.332638, 1, 1, 1, 1, 1,
1.424555, -0.4029759, 0.6780316, 0, 0, 1, 1, 1,
1.425614, -0.5944751, 2.42741, 1, 0, 0, 1, 1,
1.427175, 1.058675, 1.217771, 1, 0, 0, 1, 1,
1.429474, -2.226925, 2.477571, 1, 0, 0, 1, 1,
1.432768, -0.2108255, 1.561559, 1, 0, 0, 1, 1,
1.437847, -0.6748024, 2.66169, 1, 0, 0, 1, 1,
1.442938, -1.857416, 2.582225, 0, 0, 0, 1, 1,
1.446792, -0.03299875, 1.742193, 0, 0, 0, 1, 1,
1.45397, -0.7128449, 3.725871, 0, 0, 0, 1, 1,
1.46161, 0.8765105, 1.869022, 0, 0, 0, 1, 1,
1.480135, -0.7039097, 0.7782429, 0, 0, 0, 1, 1,
1.48928, -0.3574591, 1.366392, 0, 0, 0, 1, 1,
1.492931, 0.7612281, 2.686571, 0, 0, 0, 1, 1,
1.506644, 0.6573148, 0.9365877, 1, 1, 1, 1, 1,
1.513013, 0.4497589, 4.522451, 1, 1, 1, 1, 1,
1.538382, -1.088326, 1.240217, 1, 1, 1, 1, 1,
1.545081, 0.2172345, 1.437355, 1, 1, 1, 1, 1,
1.562544, -1.544937, 3.305464, 1, 1, 1, 1, 1,
1.564062, -0.002476431, 0.3858544, 1, 1, 1, 1, 1,
1.566946, -0.03581653, 0.6470581, 1, 1, 1, 1, 1,
1.585198, -1.771641, 2.468352, 1, 1, 1, 1, 1,
1.586357, -0.7847548, 2.606659, 1, 1, 1, 1, 1,
1.586779, -0.7931706, 2.51831, 1, 1, 1, 1, 1,
1.591156, -0.6785985, 3.276023, 1, 1, 1, 1, 1,
1.596699, -0.3595266, 3.378706, 1, 1, 1, 1, 1,
1.629552, -0.09556203, 2.157882, 1, 1, 1, 1, 1,
1.656183, 2.065194, 1.491753, 1, 1, 1, 1, 1,
1.656489, -0.01669644, 2.24726, 1, 1, 1, 1, 1,
1.669159, 0.5675566, 1.572846, 0, 0, 1, 1, 1,
1.67479, -0.07211372, 1.603213, 1, 0, 0, 1, 1,
1.675707, 0.8859662, 0.7981163, 1, 0, 0, 1, 1,
1.69053, -0.2039095, 2.651342, 1, 0, 0, 1, 1,
1.702311, -0.745426, 2.797873, 1, 0, 0, 1, 1,
1.703661, -0.309743, 1.755302, 1, 0, 0, 1, 1,
1.717237, -1.382717, 2.032267, 0, 0, 0, 1, 1,
1.720531, 0.2646963, 0.2664068, 0, 0, 0, 1, 1,
1.732212, 0.002862127, 1.794616, 0, 0, 0, 1, 1,
1.732814, 0.8340954, 0.01051046, 0, 0, 0, 1, 1,
1.733201, -1.23356, 2.377166, 0, 0, 0, 1, 1,
1.743892, -0.7464488, 1.074862, 0, 0, 0, 1, 1,
1.762116, -0.2596682, 1.018831, 0, 0, 0, 1, 1,
1.774162, -0.8154305, 3.26846, 1, 1, 1, 1, 1,
1.780198, 1.332979, 0.8712209, 1, 1, 1, 1, 1,
1.801205, -0.4328187, 2.29648, 1, 1, 1, 1, 1,
1.801286, -1.27242, 2.54991, 1, 1, 1, 1, 1,
1.807016, 0.853577, 0.2628115, 1, 1, 1, 1, 1,
1.809549, 1.431272, -0.6015387, 1, 1, 1, 1, 1,
1.820739, 1.086534, 1.229065, 1, 1, 1, 1, 1,
1.828007, -0.8586711, -0.1757002, 1, 1, 1, 1, 1,
1.841694, 0.2517769, 1.282887, 1, 1, 1, 1, 1,
1.847257, -1.268928, 1.660358, 1, 1, 1, 1, 1,
1.861773, 0.7648615, 3.03653, 1, 1, 1, 1, 1,
1.868995, -0.4395129, 2.540856, 1, 1, 1, 1, 1,
1.884471, -1.238942, 3.396176, 1, 1, 1, 1, 1,
1.884514, -0.9929745, 2.550707, 1, 1, 1, 1, 1,
1.918392, 0.5655323, 0.7201853, 1, 1, 1, 1, 1,
1.93515, -0.5155064, 0.4139414, 0, 0, 1, 1, 1,
1.958579, 1.283862, 0.1955963, 1, 0, 0, 1, 1,
1.97181, 0.2051689, 1.39487, 1, 0, 0, 1, 1,
2.007739, -0.06462511, 1.798134, 1, 0, 0, 1, 1,
2.07427, 1.81087, 0.6656169, 1, 0, 0, 1, 1,
2.091394, -1.002158, 1.908966, 1, 0, 0, 1, 1,
2.114583, 0.6413689, 0.5382618, 0, 0, 0, 1, 1,
2.131479, 0.2898808, 0.4451274, 0, 0, 0, 1, 1,
2.142342, -0.9434503, 2.454595, 0, 0, 0, 1, 1,
2.187655, -0.3626891, 0.7384752, 0, 0, 0, 1, 1,
2.259814, 1.095589, 2.189034, 0, 0, 0, 1, 1,
2.291756, -0.8181973, 2.434759, 0, 0, 0, 1, 1,
2.313958, 0.5370609, 2.096089, 0, 0, 0, 1, 1,
2.350832, -0.6174165, 0.1456127, 1, 1, 1, 1, 1,
2.381506, -0.09063466, 0.272692, 1, 1, 1, 1, 1,
2.50451, 0.03978763, 1.529974, 1, 1, 1, 1, 1,
2.513116, -1.013398, 1.515368, 1, 1, 1, 1, 1,
2.720087, -0.3883145, 2.571454, 1, 1, 1, 1, 1,
3.086745, 2.005415, 1.566719, 1, 1, 1, 1, 1,
3.348256, -1.518206, 1.139511, 1, 1, 1, 1, 1
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
var radius = 9.938403;
var distance = 34.90821;
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
mvMatrix.translate( -0.1171114, -0.1647773, -0.2258997 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.90821);
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
