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
-2.861638, 2.559493, -2.125086, 1, 0, 0, 1,
-2.57783, -1.10708, -1.276309, 1, 0.007843138, 0, 1,
-2.567203, 1.76073, -1.069771, 1, 0.01176471, 0, 1,
-2.504574, -0.3270499, -2.931554, 1, 0.01960784, 0, 1,
-2.451706, 1.413396, -0.03355233, 1, 0.02352941, 0, 1,
-2.326141, -1.499211, -3.52388, 1, 0.03137255, 0, 1,
-2.230196, -0.2848467, -1.608448, 1, 0.03529412, 0, 1,
-2.214134, -0.3988431, -1.666902, 1, 0.04313726, 0, 1,
-2.213405, -0.3974067, -0.646044, 1, 0.04705882, 0, 1,
-2.191439, 1.572785, -1.242799, 1, 0.05490196, 0, 1,
-2.153399, -0.4995443, -3.61979, 1, 0.05882353, 0, 1,
-2.14976, -1.39975, -1.348191, 1, 0.06666667, 0, 1,
-2.14363, -0.6275875, -3.105126, 1, 0.07058824, 0, 1,
-2.128392, -0.8944567, -1.068531, 1, 0.07843138, 0, 1,
-2.114899, -1.265195, -2.662584, 1, 0.08235294, 0, 1,
-2.106344, 0.1561889, -2.176123, 1, 0.09019608, 0, 1,
-2.068783, 0.2440383, -2.493402, 1, 0.09411765, 0, 1,
-2.061581, -1.060152, -3.51354, 1, 0.1019608, 0, 1,
-2.009288, -0.1071377, -1.59699, 1, 0.1098039, 0, 1,
-2.004991, 0.7097193, -0.5517431, 1, 0.1137255, 0, 1,
-1.981612, 0.1549955, -2.439942, 1, 0.1215686, 0, 1,
-1.969165, 3.247234, 0.535945, 1, 0.1254902, 0, 1,
-1.959454, -0.3947737, -2.361098, 1, 0.1333333, 0, 1,
-1.914713, -0.8391168, -3.456065, 1, 0.1372549, 0, 1,
-1.912307, 1.184579, 0.5159954, 1, 0.145098, 0, 1,
-1.908639, 1.893201, 0.4970571, 1, 0.1490196, 0, 1,
-1.90432, -0.2125337, -1.652446, 1, 0.1568628, 0, 1,
-1.832838, -0.6270204, -2.350438, 1, 0.1607843, 0, 1,
-1.81936, -1.673991, -1.022783, 1, 0.1686275, 0, 1,
-1.815371, 0.2825522, -1.31274, 1, 0.172549, 0, 1,
-1.803323, -0.9051766, -1.087668, 1, 0.1803922, 0, 1,
-1.79272, 1.18819, -1.407109, 1, 0.1843137, 0, 1,
-1.78989, -0.06589586, -2.119267, 1, 0.1921569, 0, 1,
-1.783957, -0.7662796, -0.9671176, 1, 0.1960784, 0, 1,
-1.762906, 0.02877997, -1.779999, 1, 0.2039216, 0, 1,
-1.749666, -0.5333875, -1.649955, 1, 0.2117647, 0, 1,
-1.732918, -1.173987, -1.904098, 1, 0.2156863, 0, 1,
-1.731629, -0.9693481, -1.915626, 1, 0.2235294, 0, 1,
-1.726768, -0.8674006, -2.49314, 1, 0.227451, 0, 1,
-1.71282, -1.311421, -1.30974, 1, 0.2352941, 0, 1,
-1.706352, 0.09659599, -1.090243, 1, 0.2392157, 0, 1,
-1.70342, -0.04368912, -1.612382, 1, 0.2470588, 0, 1,
-1.694742, -0.8906383, -1.969058, 1, 0.2509804, 0, 1,
-1.690141, -1.241956, -3.525319, 1, 0.2588235, 0, 1,
-1.663226, -2.210207, -2.950378, 1, 0.2627451, 0, 1,
-1.648592, 0.4469627, -0.8788816, 1, 0.2705882, 0, 1,
-1.641788, -0.3946561, -3.002334, 1, 0.2745098, 0, 1,
-1.61747, -0.6554787, -1.552623, 1, 0.282353, 0, 1,
-1.617173, 0.771448, -0.8812466, 1, 0.2862745, 0, 1,
-1.610373, 0.1089273, -2.49892, 1, 0.2941177, 0, 1,
-1.609971, 0.2245234, -1.00728, 1, 0.3019608, 0, 1,
-1.590081, 0.2225958, -1.53503, 1, 0.3058824, 0, 1,
-1.588836, 0.4561961, -1.182549, 1, 0.3137255, 0, 1,
-1.582304, 0.3600495, -1.983905, 1, 0.3176471, 0, 1,
-1.581441, 0.7664413, -1.063119, 1, 0.3254902, 0, 1,
-1.580663, -0.5150289, -1.868617, 1, 0.3294118, 0, 1,
-1.576678, 1.198597, -1.767669, 1, 0.3372549, 0, 1,
-1.545741, -0.7845634, -1.148765, 1, 0.3411765, 0, 1,
-1.539261, -2.131626, -0.4603114, 1, 0.3490196, 0, 1,
-1.523434, -0.4605106, -0.8781266, 1, 0.3529412, 0, 1,
-1.506848, 0.4903769, -1.754857, 1, 0.3607843, 0, 1,
-1.498893, -0.8794703, -0.4822578, 1, 0.3647059, 0, 1,
-1.493542, 0.300715, -1.952115, 1, 0.372549, 0, 1,
-1.482169, -1.43823, -0.5275376, 1, 0.3764706, 0, 1,
-1.480267, -0.2292584, -1.800078, 1, 0.3843137, 0, 1,
-1.475716, 0.2873042, -1.018144, 1, 0.3882353, 0, 1,
-1.451593, -1.059443, -2.983179, 1, 0.3960784, 0, 1,
-1.440367, 0.5542912, -2.612733, 1, 0.4039216, 0, 1,
-1.440235, -0.4365902, -2.732869, 1, 0.4078431, 0, 1,
-1.406421, -1.064526, -2.943376, 1, 0.4156863, 0, 1,
-1.396347, -0.8941321, -0.1380491, 1, 0.4196078, 0, 1,
-1.382173, 0.4810453, -0.539499, 1, 0.427451, 0, 1,
-1.373301, 1.820524, -0.05606456, 1, 0.4313726, 0, 1,
-1.371441, 1.124789, -0.8477371, 1, 0.4392157, 0, 1,
-1.351072, -0.6896219, -2.1322, 1, 0.4431373, 0, 1,
-1.330918, 0.6592373, -1.303382, 1, 0.4509804, 0, 1,
-1.330142, 1.239856, -2.178945, 1, 0.454902, 0, 1,
-1.320043, 0.7587186, -1.722867, 1, 0.4627451, 0, 1,
-1.315534, -0.2688245, -0.9947224, 1, 0.4666667, 0, 1,
-1.309345, -0.6261751, -2.28312, 1, 0.4745098, 0, 1,
-1.306775, -1.233322, -2.860571, 1, 0.4784314, 0, 1,
-1.301227, -0.9711559, -2.290752, 1, 0.4862745, 0, 1,
-1.293795, 0.7060167, -1.436216, 1, 0.4901961, 0, 1,
-1.292791, -0.1432341, -1.184862, 1, 0.4980392, 0, 1,
-1.279546, -0.0003971818, -1.71984, 1, 0.5058824, 0, 1,
-1.26544, -0.3833501, -1.980511, 1, 0.509804, 0, 1,
-1.26353, -0.9772063, -1.613763, 1, 0.5176471, 0, 1,
-1.259063, -1.184677, -1.800741, 1, 0.5215687, 0, 1,
-1.247053, -0.3448901, -2.680771, 1, 0.5294118, 0, 1,
-1.243175, 0.8002958, -1.837585, 1, 0.5333334, 0, 1,
-1.24178, -0.04063943, -1.309124, 1, 0.5411765, 0, 1,
-1.241323, -1.504794, -2.609215, 1, 0.5450981, 0, 1,
-1.238739, 0.4899645, -0.1883561, 1, 0.5529412, 0, 1,
-1.234691, 0.007807819, -0.825118, 1, 0.5568628, 0, 1,
-1.222461, -1.083738, -2.893009, 1, 0.5647059, 0, 1,
-1.222111, -0.1715854, -2.046756, 1, 0.5686275, 0, 1,
-1.221859, 0.1281796, -1.143117, 1, 0.5764706, 0, 1,
-1.213516, -1.658506, -3.135452, 1, 0.5803922, 0, 1,
-1.194718, -0.8144631, -0.3652839, 1, 0.5882353, 0, 1,
-1.192437, -1.357909, -1.867379, 1, 0.5921569, 0, 1,
-1.167878, -0.0669072, -1.369977, 1, 0.6, 0, 1,
-1.163066, 1.018198, -0.03065924, 1, 0.6078432, 0, 1,
-1.162744, -1.40442, -1.735432, 1, 0.6117647, 0, 1,
-1.16045, -1.767046, -4.616528, 1, 0.6196079, 0, 1,
-1.158623, -0.4039784, -4.095187, 1, 0.6235294, 0, 1,
-1.148939, -0.2673877, -0.484959, 1, 0.6313726, 0, 1,
-1.113937, 1.357951, 1.191675, 1, 0.6352941, 0, 1,
-1.107143, -1.772734, -1.694986, 1, 0.6431373, 0, 1,
-1.107046, 0.1856556, -1.239627, 1, 0.6470588, 0, 1,
-1.104213, -0.8029805, -2.609187, 1, 0.654902, 0, 1,
-1.091606, 0.06628475, -0.4081965, 1, 0.6588235, 0, 1,
-1.082233, -0.3870464, -2.848793, 1, 0.6666667, 0, 1,
-1.072321, 2.571502, 1.255714, 1, 0.6705883, 0, 1,
-1.070009, -0.7736371, -2.329285, 1, 0.6784314, 0, 1,
-1.066525, -0.7367806, -1.718498, 1, 0.682353, 0, 1,
-1.066248, -0.3170359, -1.69287, 1, 0.6901961, 0, 1,
-1.064168, 0.338068, 0.03439789, 1, 0.6941177, 0, 1,
-1.063409, 1.20027, -0.2483776, 1, 0.7019608, 0, 1,
-1.06058, 2.169817, -1.330205, 1, 0.7098039, 0, 1,
-1.053664, -0.02058924, -1.774429, 1, 0.7137255, 0, 1,
-1.041831, -0.364862, -1.779398, 1, 0.7215686, 0, 1,
-1.03999, -0.6175398, -1.538835, 1, 0.7254902, 0, 1,
-1.034282, 0.09535643, -0.8005768, 1, 0.7333333, 0, 1,
-1.022825, -1.891478, -1.744668, 1, 0.7372549, 0, 1,
-1.011037, 0.9500295, 0.07894437, 1, 0.7450981, 0, 1,
-1.010475, -1.290402, -4.897811, 1, 0.7490196, 0, 1,
-1.008324, -0.8699118, -4.341981, 1, 0.7568628, 0, 1,
-1.006605, -0.5730665, -1.913733, 1, 0.7607843, 0, 1,
-1.002855, 1.081358, -0.6404012, 1, 0.7686275, 0, 1,
-0.999194, -0.07042056, -2.939205, 1, 0.772549, 0, 1,
-0.9958341, -0.2358885, -0.002293653, 1, 0.7803922, 0, 1,
-0.9938598, 0.3417507, -1.042045, 1, 0.7843137, 0, 1,
-0.991486, -0.8310666, -2.270097, 1, 0.7921569, 0, 1,
-0.9907525, -0.8708957, -2.708533, 1, 0.7960784, 0, 1,
-0.9860508, 0.3203524, -1.038402, 1, 0.8039216, 0, 1,
-0.9825991, 0.0519094, -1.510431, 1, 0.8117647, 0, 1,
-0.9682734, 0.325145, 0.2525186, 1, 0.8156863, 0, 1,
-0.9635054, 1.269397, -1.561088, 1, 0.8235294, 0, 1,
-0.9566833, -1.030467, -2.703579, 1, 0.827451, 0, 1,
-0.9540483, 0.1172059, -2.02277, 1, 0.8352941, 0, 1,
-0.9516799, -0.6860735, -0.3087846, 1, 0.8392157, 0, 1,
-0.944174, 0.7210235, -0.1834947, 1, 0.8470588, 0, 1,
-0.9439943, -1.056173, -2.762763, 1, 0.8509804, 0, 1,
-0.9420685, -0.4516395, -0.5640007, 1, 0.8588235, 0, 1,
-0.9386811, 0.2481901, -0.506519, 1, 0.8627451, 0, 1,
-0.9369715, 0.7322004, -1.57937, 1, 0.8705882, 0, 1,
-0.9363266, -1.321064, -2.534889, 1, 0.8745098, 0, 1,
-0.9360169, -0.1297592, -1.932326, 1, 0.8823529, 0, 1,
-0.9346561, 0.06996843, -1.303198, 1, 0.8862745, 0, 1,
-0.9273559, 1.467805, -0.7241753, 1, 0.8941177, 0, 1,
-0.924327, 0.2854364, -1.055278, 1, 0.8980392, 0, 1,
-0.9124429, 1.524152, -0.3667705, 1, 0.9058824, 0, 1,
-0.9098567, 0.6435739, -0.5946936, 1, 0.9137255, 0, 1,
-0.9094058, 0.1310567, -1.334553, 1, 0.9176471, 0, 1,
-0.9089741, -0.2398182, -3.870186, 1, 0.9254902, 0, 1,
-0.9036616, 0.4948641, 0.746053, 1, 0.9294118, 0, 1,
-0.8948503, -0.6336215, -1.526857, 1, 0.9372549, 0, 1,
-0.8932297, -0.4687262, -2.470756, 1, 0.9411765, 0, 1,
-0.8921262, -0.07056638, -0.1508031, 1, 0.9490196, 0, 1,
-0.8859202, 0.4444971, -1.589215, 1, 0.9529412, 0, 1,
-0.8843672, -0.6885309, -1.541456, 1, 0.9607843, 0, 1,
-0.8720694, 0.4737743, -0.7847566, 1, 0.9647059, 0, 1,
-0.8635985, -0.3006664, -1.277486, 1, 0.972549, 0, 1,
-0.8632543, -0.613733, -1.272709, 1, 0.9764706, 0, 1,
-0.8609918, -1.547064, -3.792897, 1, 0.9843137, 0, 1,
-0.8561366, 0.6771958, -1.379675, 1, 0.9882353, 0, 1,
-0.852888, -1.393142, -2.226959, 1, 0.9960784, 0, 1,
-0.8523812, -0.1316916, 0.2337857, 0.9960784, 1, 0, 1,
-0.8486941, 1.220379, -0.5094156, 0.9921569, 1, 0, 1,
-0.8459758, 0.2840887, -1.994187, 0.9843137, 1, 0, 1,
-0.8457283, -1.569713, -1.761084, 0.9803922, 1, 0, 1,
-0.8429207, -0.2850699, -2.465091, 0.972549, 1, 0, 1,
-0.8398298, 0.1343539, -2.54163, 0.9686275, 1, 0, 1,
-0.839707, 0.8219024, -1.786532, 0.9607843, 1, 0, 1,
-0.8272728, 0.4559115, -1.0222, 0.9568627, 1, 0, 1,
-0.818463, -0.4224711, -3.27824, 0.9490196, 1, 0, 1,
-0.8178882, 1.688121, -0.3066815, 0.945098, 1, 0, 1,
-0.814592, -0.3386217, -1.824964, 0.9372549, 1, 0, 1,
-0.8118967, -0.5261675, -1.713183, 0.9333333, 1, 0, 1,
-0.8116492, -0.0853351, -3.010112, 0.9254902, 1, 0, 1,
-0.8055604, -0.7553261, -2.039175, 0.9215686, 1, 0, 1,
-0.802167, -0.4785285, -2.269428, 0.9137255, 1, 0, 1,
-0.7975473, 0.002459865, -0.3740961, 0.9098039, 1, 0, 1,
-0.7903091, -1.371949, -2.112576, 0.9019608, 1, 0, 1,
-0.7876234, 0.4888995, -0.06160411, 0.8941177, 1, 0, 1,
-0.7866682, 0.8788934, 0.8608042, 0.8901961, 1, 0, 1,
-0.7836979, 0.0107006, -1.274252, 0.8823529, 1, 0, 1,
-0.7828724, -0.7177132, -2.530549, 0.8784314, 1, 0, 1,
-0.7803042, -2.329333, -2.99896, 0.8705882, 1, 0, 1,
-0.7778936, -1.443295, -2.957548, 0.8666667, 1, 0, 1,
-0.7739732, -0.8691449, -1.75869, 0.8588235, 1, 0, 1,
-0.7672375, -0.9392477, -2.12153, 0.854902, 1, 0, 1,
-0.7596871, -0.1491562, -2.903763, 0.8470588, 1, 0, 1,
-0.7588646, -0.7089434, -4.322239, 0.8431373, 1, 0, 1,
-0.7560242, -0.5606493, -1.21752, 0.8352941, 1, 0, 1,
-0.7560112, -0.1546986, -2.569069, 0.8313726, 1, 0, 1,
-0.7556075, 0.2049206, -2.870575, 0.8235294, 1, 0, 1,
-0.752336, -1.717073, -2.076736, 0.8196079, 1, 0, 1,
-0.7467084, -0.240069, -2.374904, 0.8117647, 1, 0, 1,
-0.7439138, 1.757441, 1.492713, 0.8078431, 1, 0, 1,
-0.7422213, 0.332031, -1.722582, 0.8, 1, 0, 1,
-0.7421058, -0.3241535, -1.532347, 0.7921569, 1, 0, 1,
-0.7413499, -0.4390558, -3.509179, 0.7882353, 1, 0, 1,
-0.7406698, 1.141511, -1.068986, 0.7803922, 1, 0, 1,
-0.7380193, -0.2624504, -2.206006, 0.7764706, 1, 0, 1,
-0.737979, 0.003339855, -3.097879, 0.7686275, 1, 0, 1,
-0.7374372, 0.1484449, -0.9798765, 0.7647059, 1, 0, 1,
-0.7313097, -0.2954569, -3.496408, 0.7568628, 1, 0, 1,
-0.7294576, 1.159082, -1.699864, 0.7529412, 1, 0, 1,
-0.7285779, 0.6232464, -1.626871, 0.7450981, 1, 0, 1,
-0.7283665, -0.8280122, -2.789137, 0.7411765, 1, 0, 1,
-0.7194802, -0.9693414, -1.79597, 0.7333333, 1, 0, 1,
-0.7087177, -1.088169, -0.658577, 0.7294118, 1, 0, 1,
-0.7028428, 0.5880582, -2.180699, 0.7215686, 1, 0, 1,
-0.7010661, 0.7951472, -2.438876, 0.7176471, 1, 0, 1,
-0.6928797, 1.82711, -1.318979, 0.7098039, 1, 0, 1,
-0.6877682, 0.3537937, -1.076356, 0.7058824, 1, 0, 1,
-0.6813198, 0.5068406, -0.1346698, 0.6980392, 1, 0, 1,
-0.6756639, -0.03421176, -1.080386, 0.6901961, 1, 0, 1,
-0.674477, 0.7076229, -0.09334386, 0.6862745, 1, 0, 1,
-0.6743554, -1.095893, -1.986762, 0.6784314, 1, 0, 1,
-0.6542113, -1.00124, -0.6156799, 0.6745098, 1, 0, 1,
-0.648669, 1.668508, -0.1910161, 0.6666667, 1, 0, 1,
-0.6466898, -0.284795, -1.259239, 0.6627451, 1, 0, 1,
-0.6411167, 0.6862828, -1.939639, 0.654902, 1, 0, 1,
-0.6408383, 0.5772102, -1.818323, 0.6509804, 1, 0, 1,
-0.6329917, 0.3839502, -2.471922, 0.6431373, 1, 0, 1,
-0.6324498, -2.007594, -3.13952, 0.6392157, 1, 0, 1,
-0.6304262, 0.212126, -1.502672, 0.6313726, 1, 0, 1,
-0.6298409, -0.5828323, -0.4778368, 0.627451, 1, 0, 1,
-0.6259427, 0.8797843, -0.3466338, 0.6196079, 1, 0, 1,
-0.6231611, 0.6995497, 0.3636442, 0.6156863, 1, 0, 1,
-0.6223432, -1.437896, -2.793758, 0.6078432, 1, 0, 1,
-0.6191301, -1.08591, -3.792482, 0.6039216, 1, 0, 1,
-0.6190497, 0.3387539, -0.7725689, 0.5960785, 1, 0, 1,
-0.6140418, -1.328426, -2.888865, 0.5882353, 1, 0, 1,
-0.6093098, -0.5167015, -1.47851, 0.5843138, 1, 0, 1,
-0.6078451, -1.036019, -1.635314, 0.5764706, 1, 0, 1,
-0.6036546, -0.1078286, -1.644142, 0.572549, 1, 0, 1,
-0.597776, -0.3964109, -2.195548, 0.5647059, 1, 0, 1,
-0.5974859, 1.415533, 0.4474099, 0.5607843, 1, 0, 1,
-0.595604, -0.294522, -2.429796, 0.5529412, 1, 0, 1,
-0.5948244, 1.037026, 0.08961114, 0.5490196, 1, 0, 1,
-0.5929232, 0.00649282, -2.982363, 0.5411765, 1, 0, 1,
-0.587221, -0.6309832, -3.385587, 0.5372549, 1, 0, 1,
-0.5835532, -1.116137, -0.03572346, 0.5294118, 1, 0, 1,
-0.5804967, 1.033712, -0.7863525, 0.5254902, 1, 0, 1,
-0.5791842, -1.51672, -2.846994, 0.5176471, 1, 0, 1,
-0.5759062, -1.577029, -1.849824, 0.5137255, 1, 0, 1,
-0.5740605, 0.8989744, -1.127388, 0.5058824, 1, 0, 1,
-0.5732006, -0.06624357, -1.013804, 0.5019608, 1, 0, 1,
-0.572468, 1.06701, -0.4164952, 0.4941176, 1, 0, 1,
-0.5714332, 0.6132933, -0.1917251, 0.4862745, 1, 0, 1,
-0.5709643, -0.4246375, -2.263582, 0.4823529, 1, 0, 1,
-0.5577677, -1.115596, -1.299536, 0.4745098, 1, 0, 1,
-0.5571769, 2.335795, -0.8832812, 0.4705882, 1, 0, 1,
-0.5550933, 0.3615291, -1.274894, 0.4627451, 1, 0, 1,
-0.5540009, -0.9884506, -3.194133, 0.4588235, 1, 0, 1,
-0.5482074, -0.1498796, -1.445337, 0.4509804, 1, 0, 1,
-0.5414383, -0.6569465, -2.158631, 0.4470588, 1, 0, 1,
-0.5391336, 0.1563172, -2.653637, 0.4392157, 1, 0, 1,
-0.5383188, 0.6953541, -0.1993664, 0.4352941, 1, 0, 1,
-0.5382182, -0.6527647, -2.221596, 0.427451, 1, 0, 1,
-0.5380255, 0.1126761, -2.775302, 0.4235294, 1, 0, 1,
-0.5378191, -0.9052033, -3.506509, 0.4156863, 1, 0, 1,
-0.5347871, -1.209214, -1.98983, 0.4117647, 1, 0, 1,
-0.5279982, -0.7981426, -3.557049, 0.4039216, 1, 0, 1,
-0.5254951, 1.493941, 0.01712244, 0.3960784, 1, 0, 1,
-0.5253739, 0.5392939, -0.2425799, 0.3921569, 1, 0, 1,
-0.5242132, -1.161888, -0.4506379, 0.3843137, 1, 0, 1,
-0.5097764, -0.08084483, -1.977031, 0.3803922, 1, 0, 1,
-0.5064934, -0.724756, -0.5867718, 0.372549, 1, 0, 1,
-0.5008695, -0.6264409, 0.8688562, 0.3686275, 1, 0, 1,
-0.494399, 0.3860522, -1.077139, 0.3607843, 1, 0, 1,
-0.493097, -0.4903218, -1.83621, 0.3568628, 1, 0, 1,
-0.4901335, -0.8318195, -2.66168, 0.3490196, 1, 0, 1,
-0.4833939, 0.5605688, -3.372406, 0.345098, 1, 0, 1,
-0.4833761, -0.01722078, -1.166552, 0.3372549, 1, 0, 1,
-0.4818695, -0.8861164, -2.333002, 0.3333333, 1, 0, 1,
-0.4784334, -1.546839, -2.85706, 0.3254902, 1, 0, 1,
-0.47816, 1.187623, -0.7766556, 0.3215686, 1, 0, 1,
-0.477837, 1.665526, 0.1098536, 0.3137255, 1, 0, 1,
-0.4773141, 1.059038, -1.204154, 0.3098039, 1, 0, 1,
-0.4749179, 0.4007264, -2.304883, 0.3019608, 1, 0, 1,
-0.4694107, -1.104483, -2.243882, 0.2941177, 1, 0, 1,
-0.4629566, 2.177591, 1.955426, 0.2901961, 1, 0, 1,
-0.4589311, -1.326515, -4.236971, 0.282353, 1, 0, 1,
-0.4471492, 1.261591, -0.1452178, 0.2784314, 1, 0, 1,
-0.447089, -0.7929143, -3.447923, 0.2705882, 1, 0, 1,
-0.4441284, -0.3228283, -2.495985, 0.2666667, 1, 0, 1,
-0.4420785, -1.447625, -4.080607, 0.2588235, 1, 0, 1,
-0.439534, -1.096704, -3.761877, 0.254902, 1, 0, 1,
-0.4342346, 0.7001407, -1.239105, 0.2470588, 1, 0, 1,
-0.4340387, 0.5369979, 0.02383575, 0.2431373, 1, 0, 1,
-0.4306677, 1.192049, 0.3389486, 0.2352941, 1, 0, 1,
-0.4281646, 0.4614607, -0.7866591, 0.2313726, 1, 0, 1,
-0.4269212, -2.333143, -1.95775, 0.2235294, 1, 0, 1,
-0.4255686, -1.083187, -1.77681, 0.2196078, 1, 0, 1,
-0.4219687, -0.08576432, -2.000466, 0.2117647, 1, 0, 1,
-0.4209291, -0.3270871, -5.177091, 0.2078431, 1, 0, 1,
-0.4188658, -1.069648, -4.277095, 0.2, 1, 0, 1,
-0.4129004, 0.04093044, -3.450055, 0.1921569, 1, 0, 1,
-0.4118071, -1.964413, -4.2246, 0.1882353, 1, 0, 1,
-0.38694, -0.7316827, -0.3131842, 0.1803922, 1, 0, 1,
-0.3843802, 0.5731857, -1.514048, 0.1764706, 1, 0, 1,
-0.3837182, -0.635651, -2.387804, 0.1686275, 1, 0, 1,
-0.381369, 1.53985, -0.929667, 0.1647059, 1, 0, 1,
-0.3704524, -0.9746692, -2.075726, 0.1568628, 1, 0, 1,
-0.3667979, 0.6559542, -1.185163, 0.1529412, 1, 0, 1,
-0.3655761, -0.520819, -2.6769, 0.145098, 1, 0, 1,
-0.3604538, -2.063908, -3.497363, 0.1411765, 1, 0, 1,
-0.3589304, -1.293189, -3.536496, 0.1333333, 1, 0, 1,
-0.3570815, 0.5339259, -1.079561, 0.1294118, 1, 0, 1,
-0.3555752, -1.374359, -0.5813302, 0.1215686, 1, 0, 1,
-0.3504725, 1.580942, 0.9492108, 0.1176471, 1, 0, 1,
-0.346986, -0.1198607, -1.076451, 0.1098039, 1, 0, 1,
-0.34576, -0.2223549, -2.66235, 0.1058824, 1, 0, 1,
-0.3454601, -0.158306, -2.074359, 0.09803922, 1, 0, 1,
-0.3399937, 1.204149, 0.4255054, 0.09019608, 1, 0, 1,
-0.3384149, -1.015569, -2.811007, 0.08627451, 1, 0, 1,
-0.3360736, 1.589991, -0.6783674, 0.07843138, 1, 0, 1,
-0.3334759, -0.1646611, -0.9016328, 0.07450981, 1, 0, 1,
-0.3320984, 0.05460823, -3.182911, 0.06666667, 1, 0, 1,
-0.3291774, 0.3522618, -0.5047936, 0.0627451, 1, 0, 1,
-0.3291469, 0.2257168, -1.003028, 0.05490196, 1, 0, 1,
-0.328788, 0.4767178, 0.6667011, 0.05098039, 1, 0, 1,
-0.3257573, 0.5397726, -1.196001, 0.04313726, 1, 0, 1,
-0.3247153, -0.5527717, -1.853052, 0.03921569, 1, 0, 1,
-0.3243998, -0.4664327, -3.555184, 0.03137255, 1, 0, 1,
-0.3203478, 1.468933, 1.347659, 0.02745098, 1, 0, 1,
-0.3130986, -0.7181646, -1.100236, 0.01960784, 1, 0, 1,
-0.3129385, -0.6304721, -3.509681, 0.01568628, 1, 0, 1,
-0.3119543, 0.166339, -3.370644, 0.007843138, 1, 0, 1,
-0.3086297, -3.44284, -4.292228, 0.003921569, 1, 0, 1,
-0.3032661, -1.539758, -2.999592, 0, 1, 0.003921569, 1,
-0.3021214, -1.895451, -3.094512, 0, 1, 0.01176471, 1,
-0.3020535, -0.3540984, -2.482823, 0, 1, 0.01568628, 1,
-0.301925, 0.3012864, -0.1502359, 0, 1, 0.02352941, 1,
-0.2902794, 0.6544355, 0.2671435, 0, 1, 0.02745098, 1,
-0.2828153, -0.6131795, -2.545473, 0, 1, 0.03529412, 1,
-0.281516, -0.09879049, -1.197842, 0, 1, 0.03921569, 1,
-0.2745064, 0.4513915, 1.200352, 0, 1, 0.04705882, 1,
-0.2723506, 0.2767365, -1.482869, 0, 1, 0.05098039, 1,
-0.2710298, -1.274625, -2.196622, 0, 1, 0.05882353, 1,
-0.2697063, -1.724992, -4.832063, 0, 1, 0.0627451, 1,
-0.2680677, -0.4746188, -1.961124, 0, 1, 0.07058824, 1,
-0.2644426, -0.3059585, -3.002302, 0, 1, 0.07450981, 1,
-0.2625067, 1.56041, 0.4988365, 0, 1, 0.08235294, 1,
-0.2596359, 0.4456868, -0.5229383, 0, 1, 0.08627451, 1,
-0.254555, 1.237409, -1.202442, 0, 1, 0.09411765, 1,
-0.2536303, 1.710166, -0.06598417, 0, 1, 0.1019608, 1,
-0.2503386, 0.2141945, -1.158016, 0, 1, 0.1058824, 1,
-0.2489692, 1.02779, 0.07071359, 0, 1, 0.1137255, 1,
-0.247297, 0.03066568, -0.5851386, 0, 1, 0.1176471, 1,
-0.2440508, 0.9903594, -0.7489997, 0, 1, 0.1254902, 1,
-0.2417551, -1.680033, -2.665774, 0, 1, 0.1294118, 1,
-0.2374277, 0.03463417, -0.6049351, 0, 1, 0.1372549, 1,
-0.2373039, -0.5345078, -2.346, 0, 1, 0.1411765, 1,
-0.2359046, 1.080301, -0.09902513, 0, 1, 0.1490196, 1,
-0.2256263, 0.1055776, -2.037591, 0, 1, 0.1529412, 1,
-0.2248731, 1.612095, -2.810479, 0, 1, 0.1607843, 1,
-0.2201376, -0.4651822, -2.109692, 0, 1, 0.1647059, 1,
-0.2178891, 0.3095759, -0.09262887, 0, 1, 0.172549, 1,
-0.1990896, 0.5007755, -0.3352164, 0, 1, 0.1764706, 1,
-0.1982009, -0.2397182, -2.292797, 0, 1, 0.1843137, 1,
-0.1977723, 0.5117677, 2.661266, 0, 1, 0.1882353, 1,
-0.1962562, 0.2017216, -1.602104, 0, 1, 0.1960784, 1,
-0.1915676, -2.809178, -3.594983, 0, 1, 0.2039216, 1,
-0.1752766, -0.1604978, -0.1888268, 0, 1, 0.2078431, 1,
-0.1736783, -1.616814, -3.114875, 0, 1, 0.2156863, 1,
-0.170992, -0.5277628, -1.306464, 0, 1, 0.2196078, 1,
-0.1708275, -3.343205, -3.427667, 0, 1, 0.227451, 1,
-0.1613545, 0.3206703, -0.5777109, 0, 1, 0.2313726, 1,
-0.1612738, -1.256972, -2.911008, 0, 1, 0.2392157, 1,
-0.1608917, -1.249527, -1.801156, 0, 1, 0.2431373, 1,
-0.1607792, 0.03067066, -1.48366, 0, 1, 0.2509804, 1,
-0.1603802, -0.7898417, -2.218866, 0, 1, 0.254902, 1,
-0.1592553, 0.3468893, -0.1694761, 0, 1, 0.2627451, 1,
-0.1537072, 0.152196, -1.624434, 0, 1, 0.2666667, 1,
-0.1525506, 0.3123907, 1.525372, 0, 1, 0.2745098, 1,
-0.1523183, 1.467968, -0.3615105, 0, 1, 0.2784314, 1,
-0.1512061, 0.1431063, 0.1802505, 0, 1, 0.2862745, 1,
-0.1481695, -0.306558, -2.871265, 0, 1, 0.2901961, 1,
-0.1409242, -0.5424785, -1.710642, 0, 1, 0.2980392, 1,
-0.1386583, 1.603451, 1.048784, 0, 1, 0.3058824, 1,
-0.1375275, 1.428794, 0.5906666, 0, 1, 0.3098039, 1,
-0.1337114, -0.5978062, -5.166454, 0, 1, 0.3176471, 1,
-0.1258852, 0.5232736, 0.6243496, 0, 1, 0.3215686, 1,
-0.1257952, 0.8218278, -1.647244, 0, 1, 0.3294118, 1,
-0.1233175, 0.4040931, -1.119484, 0, 1, 0.3333333, 1,
-0.1222895, -2.1123, -3.429001, 0, 1, 0.3411765, 1,
-0.121772, -1.935116, -4.534608, 0, 1, 0.345098, 1,
-0.1181119, -0.7963718, -2.791161, 0, 1, 0.3529412, 1,
-0.1166496, -1.938004, -3.036648, 0, 1, 0.3568628, 1,
-0.1151957, -0.4954266, -3.858323, 0, 1, 0.3647059, 1,
-0.1148479, -1.431741, -2.266004, 0, 1, 0.3686275, 1,
-0.1103612, -0.5303905, -0.2454335, 0, 1, 0.3764706, 1,
-0.1087738, 0.7529649, 1.668125, 0, 1, 0.3803922, 1,
-0.108256, 0.6228683, 0.7360324, 0, 1, 0.3882353, 1,
-0.1064523, -1.087596, -3.414445, 0, 1, 0.3921569, 1,
-0.1018455, 1.639541, -1.39819, 0, 1, 0.4, 1,
-0.1017206, -0.9311723, -2.177837, 0, 1, 0.4078431, 1,
-0.1013824, -0.1902424, -1.588456, 0, 1, 0.4117647, 1,
-0.094537, 0.4270557, 0.1701917, 0, 1, 0.4196078, 1,
-0.09450048, -1.757263, -4.257113, 0, 1, 0.4235294, 1,
-0.09210076, 0.7770627, 0.03920292, 0, 1, 0.4313726, 1,
-0.08806363, 0.7951806, -1.340185, 0, 1, 0.4352941, 1,
-0.08632693, 0.370411, -0.8410392, 0, 1, 0.4431373, 1,
-0.0862174, -2.337029, -3.260433, 0, 1, 0.4470588, 1,
-0.08509549, -0.8536127, -3.265409, 0, 1, 0.454902, 1,
-0.08015393, -0.1362307, -3.183599, 0, 1, 0.4588235, 1,
-0.07877339, -2.254337, -4.595146, 0, 1, 0.4666667, 1,
-0.07510106, 1.741162, -0.01988304, 0, 1, 0.4705882, 1,
-0.0746009, 1.081489, -0.4564405, 0, 1, 0.4784314, 1,
-0.07360002, 2.277102, -1.304748, 0, 1, 0.4823529, 1,
-0.06907251, -0.9461883, -2.532719, 0, 1, 0.4901961, 1,
-0.06676045, -0.9705015, -1.510356, 0, 1, 0.4941176, 1,
-0.0661397, 2.652966, 0.4940374, 0, 1, 0.5019608, 1,
-0.06613778, 0.7049569, -0.409703, 0, 1, 0.509804, 1,
-0.05896986, 0.3938508, -0.4696026, 0, 1, 0.5137255, 1,
-0.05837065, -3.312362, -2.837541, 0, 1, 0.5215687, 1,
-0.05790783, -1.143547, -3.460481, 0, 1, 0.5254902, 1,
-0.05659947, 0.5053826, 0.6154285, 0, 1, 0.5333334, 1,
-0.05519998, 0.09185558, -1.340492, 0, 1, 0.5372549, 1,
-0.0479609, 1.309102, -0.1761515, 0, 1, 0.5450981, 1,
-0.04393686, 1.013776, -1.607457, 0, 1, 0.5490196, 1,
-0.04300803, -0.4366724, -1.264387, 0, 1, 0.5568628, 1,
-0.03896297, -0.8276063, -2.728722, 0, 1, 0.5607843, 1,
-0.0343225, -1.375723, -2.680785, 0, 1, 0.5686275, 1,
-0.03237925, 1.085836, 0.5785045, 0, 1, 0.572549, 1,
-0.03101699, -1.474852, -4.697728, 0, 1, 0.5803922, 1,
-0.0304068, 0.7021613, -0.6906784, 0, 1, 0.5843138, 1,
-0.02978336, -1.22152, -2.582841, 0, 1, 0.5921569, 1,
-0.02527985, 0.3312546, 2.564255, 0, 1, 0.5960785, 1,
-0.02481261, 0.3045026, -0.290004, 0, 1, 0.6039216, 1,
-0.02480087, -2.123843, -4.196081, 0, 1, 0.6117647, 1,
-0.02315011, 2.518003, 0.2185224, 0, 1, 0.6156863, 1,
-0.02249813, -1.267521, -2.891358, 0, 1, 0.6235294, 1,
-0.01858453, -0.6411358, -4.091325, 0, 1, 0.627451, 1,
-0.01815295, 1.078483, -0.5826002, 0, 1, 0.6352941, 1,
-0.01212763, -0.8624117, -3.690706, 0, 1, 0.6392157, 1,
-0.011635, 0.2438283, 0.7950949, 0, 1, 0.6470588, 1,
-0.01063378, 1.749647, -1.625885, 0, 1, 0.6509804, 1,
-0.01043858, -0.05609111, -3.779432, 0, 1, 0.6588235, 1,
-0.008596505, -0.5328221, -3.579878, 0, 1, 0.6627451, 1,
-0.006509513, 0.09816124, -0.266201, 0, 1, 0.6705883, 1,
-0.00316951, -0.1847137, -3.229062, 0, 1, 0.6745098, 1,
-0.002265088, 1.084349, -0.4701153, 0, 1, 0.682353, 1,
0.001278526, -1.153065, 2.142237, 0, 1, 0.6862745, 1,
0.002740574, 0.1561278, 0.3582656, 0, 1, 0.6941177, 1,
0.005554506, 0.9994975, 1.198881, 0, 1, 0.7019608, 1,
0.007952381, 0.03663338, -0.9725059, 0, 1, 0.7058824, 1,
0.008121514, -2.126153, 2.890431, 0, 1, 0.7137255, 1,
0.009733177, 1.537029, 1.156445, 0, 1, 0.7176471, 1,
0.01195694, 0.7209723, -0.4600845, 0, 1, 0.7254902, 1,
0.01970323, -1.242039, 2.365746, 0, 1, 0.7294118, 1,
0.02016306, 1.934264, 0.6729486, 0, 1, 0.7372549, 1,
0.02257472, -0.09623918, 2.54213, 0, 1, 0.7411765, 1,
0.02309402, 0.8623493, 2.112327, 0, 1, 0.7490196, 1,
0.0260606, -1.230096, 2.998786, 0, 1, 0.7529412, 1,
0.02621737, 1.229375, -0.21291, 0, 1, 0.7607843, 1,
0.02864485, 1.114355, 0.3219389, 0, 1, 0.7647059, 1,
0.03171792, -0.9714323, 3.348678, 0, 1, 0.772549, 1,
0.03403674, 0.2485765, 0.6605386, 0, 1, 0.7764706, 1,
0.03759647, -0.6175879, 6.037446, 0, 1, 0.7843137, 1,
0.03959594, 0.7244231, -1.549359, 0, 1, 0.7882353, 1,
0.04090041, 0.4270218, 1.012066, 0, 1, 0.7960784, 1,
0.04492782, -1.552155, 1.325769, 0, 1, 0.8039216, 1,
0.05147318, 0.5662449, 0.5843287, 0, 1, 0.8078431, 1,
0.05377996, -1.265901, 3.785269, 0, 1, 0.8156863, 1,
0.056357, -1.252295, 2.621627, 0, 1, 0.8196079, 1,
0.05854593, 0.8036395, -0.3963503, 0, 1, 0.827451, 1,
0.06894466, -0.8733429, 2.857219, 0, 1, 0.8313726, 1,
0.06942217, 0.03323474, -0.676203, 0, 1, 0.8392157, 1,
0.06971826, -1.656612, 2.11499, 0, 1, 0.8431373, 1,
0.07123882, -0.856139, 4.283603, 0, 1, 0.8509804, 1,
0.07167708, -1.032691, 3.132623, 0, 1, 0.854902, 1,
0.07172702, -0.2527107, 2.38398, 0, 1, 0.8627451, 1,
0.07395243, -1.205162, 3.106601, 0, 1, 0.8666667, 1,
0.07780047, -1.770769, 2.091692, 0, 1, 0.8745098, 1,
0.08345401, -1.002235, 2.567005, 0, 1, 0.8784314, 1,
0.08577018, -0.6780289, 1.645779, 0, 1, 0.8862745, 1,
0.08708328, -0.902731, 2.392055, 0, 1, 0.8901961, 1,
0.08880995, -0.6379731, 2.898159, 0, 1, 0.8980392, 1,
0.09144017, -0.6937982, 1.679634, 0, 1, 0.9058824, 1,
0.0915576, -0.126098, 4.484637, 0, 1, 0.9098039, 1,
0.09501165, -0.637392, 3.458963, 0, 1, 0.9176471, 1,
0.09685818, -0.4648868, 1.704459, 0, 1, 0.9215686, 1,
0.0979439, -1.97546, 2.649139, 0, 1, 0.9294118, 1,
0.1011159, 0.9299086, -1.173399, 0, 1, 0.9333333, 1,
0.1016429, 0.3233599, -0.6861201, 0, 1, 0.9411765, 1,
0.1022019, 1.386363, -1.383993, 0, 1, 0.945098, 1,
0.103266, -1.37496, 4.489798, 0, 1, 0.9529412, 1,
0.1033517, 0.9019601, 0.4378649, 0, 1, 0.9568627, 1,
0.1047486, -1.596168, 5.528423, 0, 1, 0.9647059, 1,
0.1083618, -0.5014539, 2.416852, 0, 1, 0.9686275, 1,
0.109129, -1.090158, 4.293131, 0, 1, 0.9764706, 1,
0.116685, 0.9307862, -0.580915, 0, 1, 0.9803922, 1,
0.1167555, -1.862066, 1.372238, 0, 1, 0.9882353, 1,
0.1192515, -1.271741, 2.707697, 0, 1, 0.9921569, 1,
0.1241438, -0.2317752, 1.93274, 0, 1, 1, 1,
0.1277687, 0.2494074, 0.3261833, 0, 0.9921569, 1, 1,
0.1281125, -0.9285515, 1.568636, 0, 0.9882353, 1, 1,
0.1282872, -1.672902, 2.782961, 0, 0.9803922, 1, 1,
0.1325098, -1.916611, 1.01116, 0, 0.9764706, 1, 1,
0.1331135, -1.887773, 3.159364, 0, 0.9686275, 1, 1,
0.1350706, 0.6372491, 0.8640446, 0, 0.9647059, 1, 1,
0.1374848, 0.1927461, 0.6574722, 0, 0.9568627, 1, 1,
0.1388629, 0.2574963, -1.008246, 0, 0.9529412, 1, 1,
0.1391734, -0.7883601, 3.281581, 0, 0.945098, 1, 1,
0.1420166, -1.628398, 2.83892, 0, 0.9411765, 1, 1,
0.144737, -0.3317141, 2.532642, 0, 0.9333333, 1, 1,
0.1451183, -1.262697, 4.103908, 0, 0.9294118, 1, 1,
0.1480223, -2.831528, 3.773724, 0, 0.9215686, 1, 1,
0.1491318, -0.3228366, 3.677329, 0, 0.9176471, 1, 1,
0.1541961, -0.308168, 0.6433098, 0, 0.9098039, 1, 1,
0.1548088, 0.832943, -0.0454676, 0, 0.9058824, 1, 1,
0.1571129, -0.2065262, 5.08208, 0, 0.8980392, 1, 1,
0.1626015, -1.71628, 3.910492, 0, 0.8901961, 1, 1,
0.1649699, 1.419465, -0.002516266, 0, 0.8862745, 1, 1,
0.1652629, -1.106811, 3.980895, 0, 0.8784314, 1, 1,
0.1658164, -0.04325622, 1.693048, 0, 0.8745098, 1, 1,
0.1666265, 0.5464631, -0.7471477, 0, 0.8666667, 1, 1,
0.1693056, 0.1773666, -0.7845795, 0, 0.8627451, 1, 1,
0.1698378, 0.9574035, -0.4061145, 0, 0.854902, 1, 1,
0.1739878, 1.252657, -0.640819, 0, 0.8509804, 1, 1,
0.1765154, 0.1580059, 1.855413, 0, 0.8431373, 1, 1,
0.1766313, -1.683491, 4.128832, 0, 0.8392157, 1, 1,
0.1795014, -0.7156302, 5.672351, 0, 0.8313726, 1, 1,
0.1814141, -1.228478, 2.607332, 0, 0.827451, 1, 1,
0.1841613, 0.5601001, 0.229517, 0, 0.8196079, 1, 1,
0.1884493, 2.060616, -1.009643, 0, 0.8156863, 1, 1,
0.1887529, 1.06574, 0.3904741, 0, 0.8078431, 1, 1,
0.1916334, 0.3465922, 0.7756667, 0, 0.8039216, 1, 1,
0.1947097, -1.283538, 3.494351, 0, 0.7960784, 1, 1,
0.1986978, -0.03272252, 0.9573182, 0, 0.7882353, 1, 1,
0.1995129, 0.4371963, -0.6640676, 0, 0.7843137, 1, 1,
0.2004016, 2.616685, -1.231556, 0, 0.7764706, 1, 1,
0.2046975, -1.670139, 2.677838, 0, 0.772549, 1, 1,
0.2066204, -0.7078542, 2.479047, 0, 0.7647059, 1, 1,
0.2070952, 0.653403, 0.08960982, 0, 0.7607843, 1, 1,
0.215278, 0.1427651, 2.123849, 0, 0.7529412, 1, 1,
0.2186081, -0.4365086, 2.518457, 0, 0.7490196, 1, 1,
0.2186482, 0.103832, 1.183288, 0, 0.7411765, 1, 1,
0.2190927, -1.484124, 3.617803, 0, 0.7372549, 1, 1,
0.2204699, 1.007861, 1.242245, 0, 0.7294118, 1, 1,
0.2222688, -1.351823, 1.669043, 0, 0.7254902, 1, 1,
0.224999, -1.076896, 1.777051, 0, 0.7176471, 1, 1,
0.2266536, 1.946057, -0.1422926, 0, 0.7137255, 1, 1,
0.2309272, -0.8202468, 3.979522, 0, 0.7058824, 1, 1,
0.2309521, 0.3346062, 0.8772222, 0, 0.6980392, 1, 1,
0.2318009, -0.7044254, 3.20354, 0, 0.6941177, 1, 1,
0.2390095, -1.105676, 3.151454, 0, 0.6862745, 1, 1,
0.2418327, -0.2063065, 1.971082, 0, 0.682353, 1, 1,
0.2489723, 0.3312977, 1.437154, 0, 0.6745098, 1, 1,
0.2496394, 0.5212535, -1.025974, 0, 0.6705883, 1, 1,
0.2506084, -1.342361, 3.500848, 0, 0.6627451, 1, 1,
0.2524576, 0.195741, 0.6542444, 0, 0.6588235, 1, 1,
0.2676164, -1.733932, 1.754979, 0, 0.6509804, 1, 1,
0.2709, 1.100813, -0.02806151, 0, 0.6470588, 1, 1,
0.2785964, 0.09584349, 0.8768468, 0, 0.6392157, 1, 1,
0.2814914, 2.991037, 0.4315161, 0, 0.6352941, 1, 1,
0.2817261, 1.075089, 0.227387, 0, 0.627451, 1, 1,
0.2844395, 0.02750377, 1.379718, 0, 0.6235294, 1, 1,
0.2920427, -0.6416236, 2.58165, 0, 0.6156863, 1, 1,
0.2927252, -0.9914464, 2.735355, 0, 0.6117647, 1, 1,
0.2942627, -0.6183071, 2.952622, 0, 0.6039216, 1, 1,
0.2975632, 1.129113, 0.2365952, 0, 0.5960785, 1, 1,
0.2981287, 1.953609, -0.8645028, 0, 0.5921569, 1, 1,
0.2982273, 0.2020253, 0.0155489, 0, 0.5843138, 1, 1,
0.298458, 0.1373821, 1.485506, 0, 0.5803922, 1, 1,
0.299027, -0.8024152, 1.16772, 0, 0.572549, 1, 1,
0.3020994, -0.5889078, 1.770795, 0, 0.5686275, 1, 1,
0.302416, -1.013409, 2.411062, 0, 0.5607843, 1, 1,
0.3026586, -0.746191, 2.252716, 0, 0.5568628, 1, 1,
0.3050306, 0.1716935, -0.6379732, 0, 0.5490196, 1, 1,
0.3057351, -0.3045719, 1.905794, 0, 0.5450981, 1, 1,
0.3165604, 0.02624681, 1.295535, 0, 0.5372549, 1, 1,
0.3180007, 1.68623, 0.2915808, 0, 0.5333334, 1, 1,
0.3201682, -1.331427, 3.836105, 0, 0.5254902, 1, 1,
0.3209346, -0.7046533, 5.419932, 0, 0.5215687, 1, 1,
0.3285122, 0.4962293, 1.334171, 0, 0.5137255, 1, 1,
0.3295368, 0.3090002, -0.4730495, 0, 0.509804, 1, 1,
0.3321774, -0.5067176, 2.385619, 0, 0.5019608, 1, 1,
0.3323213, -1.111644, 1.80844, 0, 0.4941176, 1, 1,
0.332893, 0.9924415, 2.405605, 0, 0.4901961, 1, 1,
0.3331122, -0.02290655, 2.32845, 0, 0.4823529, 1, 1,
0.3337476, 0.531952, 0.9325192, 0, 0.4784314, 1, 1,
0.334473, -0.1577141, 0.8126829, 0, 0.4705882, 1, 1,
0.335628, -1.699779, 4.130073, 0, 0.4666667, 1, 1,
0.3385256, -1.368406, 4.666923, 0, 0.4588235, 1, 1,
0.3388132, -2.973637, 2.445302, 0, 0.454902, 1, 1,
0.3410231, -0.2216821, 2.329145, 0, 0.4470588, 1, 1,
0.342581, -1.913795, 2.654494, 0, 0.4431373, 1, 1,
0.3426259, 1.25314, -1.609959, 0, 0.4352941, 1, 1,
0.344287, 0.5278667, 2.261639, 0, 0.4313726, 1, 1,
0.3443972, -0.3470355, 2.652667, 0, 0.4235294, 1, 1,
0.3446269, 1.148681, -0.3752263, 0, 0.4196078, 1, 1,
0.3453637, -1.911078, 2.196873, 0, 0.4117647, 1, 1,
0.3453795, 0.7192792, 0.04294192, 0, 0.4078431, 1, 1,
0.3459536, -0.3308983, 2.298011, 0, 0.4, 1, 1,
0.3495745, -1.241496, 2.106793, 0, 0.3921569, 1, 1,
0.3558337, 0.9492775, 1.503737, 0, 0.3882353, 1, 1,
0.3563546, 0.2813166, -0.3012301, 0, 0.3803922, 1, 1,
0.3586566, 0.06047459, 1.37675, 0, 0.3764706, 1, 1,
0.3600776, 0.1148968, 2.102238, 0, 0.3686275, 1, 1,
0.3661782, -0.8660333, 2.311845, 0, 0.3647059, 1, 1,
0.3695951, 1.173565, -0.2041576, 0, 0.3568628, 1, 1,
0.3705641, 0.1232742, 0.5948292, 0, 0.3529412, 1, 1,
0.3727573, 1.599424, -0.1491772, 0, 0.345098, 1, 1,
0.3730065, 1.577623, -0.6266307, 0, 0.3411765, 1, 1,
0.3736671, -0.8835173, 2.967999, 0, 0.3333333, 1, 1,
0.3746177, -1.052077, 3.216323, 0, 0.3294118, 1, 1,
0.3800707, -0.06404734, 2.956164, 0, 0.3215686, 1, 1,
0.380745, 0.1324577, 1.108211, 0, 0.3176471, 1, 1,
0.3849202, -0.2961062, 1.239218, 0, 0.3098039, 1, 1,
0.3885555, -0.5559905, 2.41459, 0, 0.3058824, 1, 1,
0.3987376, -0.02391288, 0.09083609, 0, 0.2980392, 1, 1,
0.3990102, -0.9988928, 3.002918, 0, 0.2901961, 1, 1,
0.399477, -0.202343, 1.160383, 0, 0.2862745, 1, 1,
0.3999017, -0.2607658, 2.107035, 0, 0.2784314, 1, 1,
0.4040891, 0.1895973, 1.443793, 0, 0.2745098, 1, 1,
0.4063435, -0.9975669, 2.151557, 0, 0.2666667, 1, 1,
0.4076808, 1.572561, 0.2797121, 0, 0.2627451, 1, 1,
0.4079868, -1.803816, 3.775068, 0, 0.254902, 1, 1,
0.4091034, 0.009345381, 2.086751, 0, 0.2509804, 1, 1,
0.4111491, -1.724948, 2.447202, 0, 0.2431373, 1, 1,
0.4122092, -0.9249937, 3.707285, 0, 0.2392157, 1, 1,
0.4129713, 2.210119, -0.4176796, 0, 0.2313726, 1, 1,
0.4165229, -0.4109746, 2.74666, 0, 0.227451, 1, 1,
0.4207399, -0.7028958, 3.189544, 0, 0.2196078, 1, 1,
0.421666, 0.2302451, 2.11908, 0, 0.2156863, 1, 1,
0.423077, -1.204835, 5.180671, 0, 0.2078431, 1, 1,
0.4306996, -0.363503, 4.378133, 0, 0.2039216, 1, 1,
0.4323543, -0.7757652, 1.348734, 0, 0.1960784, 1, 1,
0.4353075, 0.3467292, 1.22594, 0, 0.1882353, 1, 1,
0.4360992, 0.5944961, 1.460104, 0, 0.1843137, 1, 1,
0.4400066, 0.5951025, 0.8077664, 0, 0.1764706, 1, 1,
0.4413474, 1.274856, 1.417249, 0, 0.172549, 1, 1,
0.4417981, -1.719311, 3.602193, 0, 0.1647059, 1, 1,
0.4455719, -0.5952563, 2.646879, 0, 0.1607843, 1, 1,
0.4502237, 0.9831284, 0.2415864, 0, 0.1529412, 1, 1,
0.4534543, 0.4440049, 0.4203612, 0, 0.1490196, 1, 1,
0.4560326, -0.9767498, 3.255184, 0, 0.1411765, 1, 1,
0.4593111, 1.244846, 0.1188291, 0, 0.1372549, 1, 1,
0.4598415, 0.9401153, 0.8409981, 0, 0.1294118, 1, 1,
0.4616992, 0.6741135, -0.1313261, 0, 0.1254902, 1, 1,
0.468577, 0.5087999, 0.608695, 0, 0.1176471, 1, 1,
0.4690992, 1.567483, -0.2309106, 0, 0.1137255, 1, 1,
0.4741967, -0.1638879, 1.504141, 0, 0.1058824, 1, 1,
0.4766068, 0.1248295, -0.2237943, 0, 0.09803922, 1, 1,
0.476655, 0.1593184, 1.830638, 0, 0.09411765, 1, 1,
0.4779394, 0.6167633, -1.267933, 0, 0.08627451, 1, 1,
0.4791062, 1.118023, 1.225365, 0, 0.08235294, 1, 1,
0.4800124, -0.5268245, 2.999052, 0, 0.07450981, 1, 1,
0.4805486, -0.1027302, 2.285224, 0, 0.07058824, 1, 1,
0.48207, 0.426519, -0.3531294, 0, 0.0627451, 1, 1,
0.4908426, 0.05700127, 1.315042, 0, 0.05882353, 1, 1,
0.4934362, -0.363916, 2.298579, 0, 0.05098039, 1, 1,
0.4934832, 0.08350522, -0.7197029, 0, 0.04705882, 1, 1,
0.4941948, 0.7912035, -0.0232084, 0, 0.03921569, 1, 1,
0.4961946, 0.5313109, 1.841804, 0, 0.03529412, 1, 1,
0.4965838, -1.145599, 2.051167, 0, 0.02745098, 1, 1,
0.4971, -0.8314362, 1.153376, 0, 0.02352941, 1, 1,
0.4973394, 2.100181, 0.504159, 0, 0.01568628, 1, 1,
0.497488, -1.381793, 2.867256, 0, 0.01176471, 1, 1,
0.499367, 0.0179616, 0.657759, 0, 0.003921569, 1, 1,
0.4995518, 2.225753, 0.5114267, 0.003921569, 0, 1, 1,
0.5008427, -1.169712, 3.756762, 0.007843138, 0, 1, 1,
0.5048953, 0.2155184, 1.519987, 0.01568628, 0, 1, 1,
0.509106, 0.2425149, 1.649568, 0.01960784, 0, 1, 1,
0.5099732, -0.8569021, 4.327384, 0.02745098, 0, 1, 1,
0.510172, 0.7528788, 0.4907419, 0.03137255, 0, 1, 1,
0.5110427, 0.2772556, 0.4613627, 0.03921569, 0, 1, 1,
0.5111636, -0.5387541, 2.026895, 0.04313726, 0, 1, 1,
0.5124072, 0.4979573, 0.5348293, 0.05098039, 0, 1, 1,
0.5164314, 1.065909, 1.752271, 0.05490196, 0, 1, 1,
0.5167385, -2.496226, 1.807873, 0.0627451, 0, 1, 1,
0.522169, -2.675156, 3.80952, 0.06666667, 0, 1, 1,
0.5243084, 0.6988913, 1.222011, 0.07450981, 0, 1, 1,
0.5269426, -0.6224245, 2.087991, 0.07843138, 0, 1, 1,
0.5278103, -0.7729528, 3.112116, 0.08627451, 0, 1, 1,
0.5292671, 1.285755, -1.054553, 0.09019608, 0, 1, 1,
0.5439984, 0.910787, 0.8777087, 0.09803922, 0, 1, 1,
0.5448374, -0.04355451, 1.271627, 0.1058824, 0, 1, 1,
0.5459644, 0.73653, 1.409035, 0.1098039, 0, 1, 1,
0.5461251, -1.004048, 1.548302, 0.1176471, 0, 1, 1,
0.5486919, 0.5492236, -0.04717932, 0.1215686, 0, 1, 1,
0.5488548, -1.780463, 1.533723, 0.1294118, 0, 1, 1,
0.5492886, 0.3027018, 1.56894, 0.1333333, 0, 1, 1,
0.5552751, 0.5295826, 0.9098284, 0.1411765, 0, 1, 1,
0.5553678, 0.1668017, 1.222959, 0.145098, 0, 1, 1,
0.5600927, -1.72487, 4.369733, 0.1529412, 0, 1, 1,
0.5628073, 0.6820489, 1.429861, 0.1568628, 0, 1, 1,
0.5632616, -0.2077215, -0.3740724, 0.1647059, 0, 1, 1,
0.5652584, 1.860014, 2.308772, 0.1686275, 0, 1, 1,
0.566269, 1.832913, -1.088845, 0.1764706, 0, 1, 1,
0.5666063, 1.151948, 0.6303452, 0.1803922, 0, 1, 1,
0.5666112, 0.145818, 3.289856, 0.1882353, 0, 1, 1,
0.5712574, 1.179825, -0.8938762, 0.1921569, 0, 1, 1,
0.571882, -0.01349708, 0.9808767, 0.2, 0, 1, 1,
0.5748205, 0.00218707, 2.362923, 0.2078431, 0, 1, 1,
0.57561, 0.05436115, 1.764851, 0.2117647, 0, 1, 1,
0.57641, -0.363518, 0.1229791, 0.2196078, 0, 1, 1,
0.576785, 0.1821782, 2.951004, 0.2235294, 0, 1, 1,
0.5786274, -1.332014, 2.605431, 0.2313726, 0, 1, 1,
0.5790309, 0.1939625, 1.375431, 0.2352941, 0, 1, 1,
0.5923994, 1.902133, 1.756155, 0.2431373, 0, 1, 1,
0.5945032, -0.0237659, 1.02507, 0.2470588, 0, 1, 1,
0.5953737, -1.217876, 2.043572, 0.254902, 0, 1, 1,
0.5954658, -1.289701, 2.550951, 0.2588235, 0, 1, 1,
0.5962909, -2.139657, 3.861685, 0.2666667, 0, 1, 1,
0.5966467, -0.09296788, 2.586517, 0.2705882, 0, 1, 1,
0.5970856, -0.141477, 3.023612, 0.2784314, 0, 1, 1,
0.5978522, 0.5200283, 0.741271, 0.282353, 0, 1, 1,
0.5979722, 0.8640211, 1.485318, 0.2901961, 0, 1, 1,
0.6028207, 1.71851, 0.576462, 0.2941177, 0, 1, 1,
0.6074535, 0.2395689, 2.237727, 0.3019608, 0, 1, 1,
0.6232525, -0.6468957, 2.179849, 0.3098039, 0, 1, 1,
0.6237296, 0.6996484, 0.9346484, 0.3137255, 0, 1, 1,
0.6259827, -1.265443, 2.863819, 0.3215686, 0, 1, 1,
0.6287612, 0.4403989, 0.3280882, 0.3254902, 0, 1, 1,
0.6304625, 0.6781244, 0.216832, 0.3333333, 0, 1, 1,
0.6343769, -0.2017992, 1.66141, 0.3372549, 0, 1, 1,
0.6348072, -0.7851648, 2.563378, 0.345098, 0, 1, 1,
0.6371593, 1.435914, 1.968835, 0.3490196, 0, 1, 1,
0.6474103, -0.84618, 2.094327, 0.3568628, 0, 1, 1,
0.6477467, 0.1865215, -0.1782746, 0.3607843, 0, 1, 1,
0.6482969, 1.892247, 0.756932, 0.3686275, 0, 1, 1,
0.6500583, 0.3061239, 1.150358, 0.372549, 0, 1, 1,
0.651386, -0.03933505, 1.959527, 0.3803922, 0, 1, 1,
0.6527612, -0.7304832, 1.738598, 0.3843137, 0, 1, 1,
0.6576763, 0.1769042, -0.205396, 0.3921569, 0, 1, 1,
0.66382, -0.9891365, 1.425858, 0.3960784, 0, 1, 1,
0.6663908, 3.145677, -0.2591339, 0.4039216, 0, 1, 1,
0.6681466, 0.8779607, 1.125694, 0.4117647, 0, 1, 1,
0.6684002, 0.2466714, 0.726194, 0.4156863, 0, 1, 1,
0.6699112, -0.9182408, 2.156266, 0.4235294, 0, 1, 1,
0.6719564, 1.089366, 2.594543, 0.427451, 0, 1, 1,
0.6741211, 1.58751, 0.8896373, 0.4352941, 0, 1, 1,
0.6766281, 0.6556287, 0.4514831, 0.4392157, 0, 1, 1,
0.6767101, -0.5526983, 3.050719, 0.4470588, 0, 1, 1,
0.6794453, 0.780004, 1.13179, 0.4509804, 0, 1, 1,
0.6873373, -0.3058464, 1.370544, 0.4588235, 0, 1, 1,
0.6918182, -0.5149171, 2.716368, 0.4627451, 0, 1, 1,
0.6938719, -2.471414, 3.724489, 0.4705882, 0, 1, 1,
0.6946983, 1.54567, 2.532603, 0.4745098, 0, 1, 1,
0.6968397, -0.619232, 3.419679, 0.4823529, 0, 1, 1,
0.7088442, -0.5321242, 3.730451, 0.4862745, 0, 1, 1,
0.7159195, 2.199308, -0.5119164, 0.4941176, 0, 1, 1,
0.7169412, 0.2393373, 2.950966, 0.5019608, 0, 1, 1,
0.7179489, 0.104803, 1.148787, 0.5058824, 0, 1, 1,
0.7238275, -0.9432094, 2.361433, 0.5137255, 0, 1, 1,
0.72515, 0.2288198, 1.602296, 0.5176471, 0, 1, 1,
0.7257853, -1.217463, 2.809366, 0.5254902, 0, 1, 1,
0.7275073, 0.4478743, -0.2596729, 0.5294118, 0, 1, 1,
0.7318322, 0.4197066, 0.7731524, 0.5372549, 0, 1, 1,
0.7348491, 0.01270918, 2.226087, 0.5411765, 0, 1, 1,
0.7358145, -0.3106832, 0.5920905, 0.5490196, 0, 1, 1,
0.7372043, -0.005755474, 3.424537, 0.5529412, 0, 1, 1,
0.7372074, -0.9919552, 1.434639, 0.5607843, 0, 1, 1,
0.7393973, -0.2620628, 2.242859, 0.5647059, 0, 1, 1,
0.7434597, 2.418754, -0.7333713, 0.572549, 0, 1, 1,
0.7499172, -1.147866, 0.4980388, 0.5764706, 0, 1, 1,
0.7523387, -2.084285, 2.227633, 0.5843138, 0, 1, 1,
0.753709, 1.284544, 1.422719, 0.5882353, 0, 1, 1,
0.7570951, 0.0616241, 0.1468634, 0.5960785, 0, 1, 1,
0.7572278, 1.064487, 0.4497502, 0.6039216, 0, 1, 1,
0.7585385, 1.054124, 1.790483, 0.6078432, 0, 1, 1,
0.7618715, -0.5652547, 3.85055, 0.6156863, 0, 1, 1,
0.7620022, 0.8444803, 0.2353901, 0.6196079, 0, 1, 1,
0.764604, 0.09917513, 0.7232863, 0.627451, 0, 1, 1,
0.7647914, -0.6169558, 2.764861, 0.6313726, 0, 1, 1,
0.780021, 0.9501556, 1.691604, 0.6392157, 0, 1, 1,
0.7837641, 0.03264911, 2.341938, 0.6431373, 0, 1, 1,
0.7853281, 0.07602536, 2.905807, 0.6509804, 0, 1, 1,
0.7885113, -0.3544886, 1.183396, 0.654902, 0, 1, 1,
0.7919227, 1.541311, -0.8894665, 0.6627451, 0, 1, 1,
0.7928925, -0.6864245, 1.581045, 0.6666667, 0, 1, 1,
0.7938692, 0.3155791, 0.8646622, 0.6745098, 0, 1, 1,
0.7985632, 0.04817872, 0.182544, 0.6784314, 0, 1, 1,
0.7986625, 0.3319311, 1.138224, 0.6862745, 0, 1, 1,
0.7988897, -0.6411436, 2.440561, 0.6901961, 0, 1, 1,
0.8011408, -0.6272505, -0.3010938, 0.6980392, 0, 1, 1,
0.8011733, 0.007508394, -0.2018036, 0.7058824, 0, 1, 1,
0.804662, -0.7673746, 1.98294, 0.7098039, 0, 1, 1,
0.8066522, -1.469483, 2.589534, 0.7176471, 0, 1, 1,
0.80765, 1.754128, -0.9898269, 0.7215686, 0, 1, 1,
0.820412, -1.376808, 0.1382685, 0.7294118, 0, 1, 1,
0.8257034, -0.3892803, 2.96393, 0.7333333, 0, 1, 1,
0.8263983, -0.3440403, 2.981185, 0.7411765, 0, 1, 1,
0.834847, -1.246881, 2.780828, 0.7450981, 0, 1, 1,
0.8361683, -0.3621657, 0.8301675, 0.7529412, 0, 1, 1,
0.8366454, 0.09633709, 2.470654, 0.7568628, 0, 1, 1,
0.842638, 0.243949, 1.260664, 0.7647059, 0, 1, 1,
0.8508556, 0.2486789, -1.211421, 0.7686275, 0, 1, 1,
0.8594392, -0.4736947, 2.053482, 0.7764706, 0, 1, 1,
0.8617936, -1.127054, 3.310422, 0.7803922, 0, 1, 1,
0.8768138, -0.9434276, 3.086685, 0.7882353, 0, 1, 1,
0.877478, 0.3047175, 0.891754, 0.7921569, 0, 1, 1,
0.8784125, -0.8143572, 0.6063504, 0.8, 0, 1, 1,
0.8784916, 1.754954, 0.6183617, 0.8078431, 0, 1, 1,
0.882171, -0.3186799, 4.036622, 0.8117647, 0, 1, 1,
0.8907742, -0.4060759, 3.886672, 0.8196079, 0, 1, 1,
0.8969945, -0.5782489, 1.914127, 0.8235294, 0, 1, 1,
0.900739, -0.7009293, 2.400197, 0.8313726, 0, 1, 1,
0.9083847, -0.5116113, 1.031748, 0.8352941, 0, 1, 1,
0.9090867, -1.386574, 3.10107, 0.8431373, 0, 1, 1,
0.9160155, -1.678319, 4.943853, 0.8470588, 0, 1, 1,
0.9170423, 0.7138744, 1.354384, 0.854902, 0, 1, 1,
0.9202904, 0.1275092, 1.37671, 0.8588235, 0, 1, 1,
0.9203476, -0.06246071, 2.461014, 0.8666667, 0, 1, 1,
0.9212338, 0.2748907, 0.5437789, 0.8705882, 0, 1, 1,
0.9248446, 0.8524466, 0.1079478, 0.8784314, 0, 1, 1,
0.9257728, 0.6405736, -0.5269817, 0.8823529, 0, 1, 1,
0.9295725, -1.115991, 2.405308, 0.8901961, 0, 1, 1,
0.9408218, -0.8794272, 4.071121, 0.8941177, 0, 1, 1,
0.9449683, 0.4583599, 0.8037391, 0.9019608, 0, 1, 1,
0.9451413, 0.276767, 0.5726022, 0.9098039, 0, 1, 1,
0.9506696, -1.200668, 1.107852, 0.9137255, 0, 1, 1,
0.9515682, -1.096098, 3.251318, 0.9215686, 0, 1, 1,
0.9555625, -0.1249139, 0.4923942, 0.9254902, 0, 1, 1,
0.9614074, 0.7730424, 1.999911, 0.9333333, 0, 1, 1,
0.962045, 1.606706, -0.1386984, 0.9372549, 0, 1, 1,
0.9648221, -0.530587, 2.829929, 0.945098, 0, 1, 1,
0.9656056, -0.2914912, 3.310489, 0.9490196, 0, 1, 1,
0.9667255, -0.3195471, 2.185125, 0.9568627, 0, 1, 1,
0.9720707, 0.3672838, -0.6522833, 0.9607843, 0, 1, 1,
0.9722292, 0.881396, 2.056626, 0.9686275, 0, 1, 1,
0.9785845, -0.01505392, 1.654309, 0.972549, 0, 1, 1,
0.9802105, -1.140981, 3.067248, 0.9803922, 0, 1, 1,
0.9828792, 0.5470939, 0.6766068, 0.9843137, 0, 1, 1,
0.9890752, 0.6293752, -0.2926049, 0.9921569, 0, 1, 1,
0.9979331, 0.9628987, -0.05625069, 0.9960784, 0, 1, 1,
1.000759, 0.9187191, 1.50344, 1, 0, 0.9960784, 1,
1.005261, -0.4462268, 2.928654, 1, 0, 0.9882353, 1,
1.014198, -2.082905, 3.704864, 1, 0, 0.9843137, 1,
1.016982, -1.354479, 2.329587, 1, 0, 0.9764706, 1,
1.021356, 0.8640121, 0.8549812, 1, 0, 0.972549, 1,
1.043921, -0.2952152, 2.761885, 1, 0, 0.9647059, 1,
1.044279, 1.656124, -0.2766672, 1, 0, 0.9607843, 1,
1.054684, -0.1995535, 3.522036, 1, 0, 0.9529412, 1,
1.058331, -0.3791325, 0.7276875, 1, 0, 0.9490196, 1,
1.059671, 0.8348838, 1.922748, 1, 0, 0.9411765, 1,
1.072106, 1.371818, 0.7422731, 1, 0, 0.9372549, 1,
1.074084, -0.0654489, 1.600117, 1, 0, 0.9294118, 1,
1.074292, 1.064901, 1.880214, 1, 0, 0.9254902, 1,
1.077147, -0.2635026, 1.176926, 1, 0, 0.9176471, 1,
1.083112, 1.974423, 0.3074619, 1, 0, 0.9137255, 1,
1.08557, -0.3907944, 1.69012, 1, 0, 0.9058824, 1,
1.088441, 0.06785122, 0.9952434, 1, 0, 0.9019608, 1,
1.094355, -1.707223, 2.281813, 1, 0, 0.8941177, 1,
1.097188, 0.7112027, 2.388902, 1, 0, 0.8862745, 1,
1.11441, -0.4858741, 3.296235, 1, 0, 0.8823529, 1,
1.120674, 0.9141614, 1.007243, 1, 0, 0.8745098, 1,
1.121129, -0.8682287, 2.011487, 1, 0, 0.8705882, 1,
1.124808, 2.1712, 1.001564, 1, 0, 0.8627451, 1,
1.130784, -1.467612, 2.965558, 1, 0, 0.8588235, 1,
1.137148, 0.4760443, 1.851948, 1, 0, 0.8509804, 1,
1.140541, 0.0310831, 0.4156585, 1, 0, 0.8470588, 1,
1.143285, -0.4527732, 2.984344, 1, 0, 0.8392157, 1,
1.144296, 0.4868937, 0.4497153, 1, 0, 0.8352941, 1,
1.145238, 1.122872, 1.538731, 1, 0, 0.827451, 1,
1.145243, 0.8768563, 0.3321336, 1, 0, 0.8235294, 1,
1.147049, 1.173435, -0.7468472, 1, 0, 0.8156863, 1,
1.147086, 0.6146547, 2.078054, 1, 0, 0.8117647, 1,
1.149011, 1.253883, 1.558125, 1, 0, 0.8039216, 1,
1.150786, -2.466014, 3.320629, 1, 0, 0.7960784, 1,
1.151329, 0.5394593, 0.9075357, 1, 0, 0.7921569, 1,
1.152315, -0.9954508, 3.077384, 1, 0, 0.7843137, 1,
1.160023, -0.849297, 1.434097, 1, 0, 0.7803922, 1,
1.165042, -0.00080115, 1.176251, 1, 0, 0.772549, 1,
1.167157, -0.7661198, 2.883668, 1, 0, 0.7686275, 1,
1.172654, 0.5540028, 0.7782922, 1, 0, 0.7607843, 1,
1.18013, -0.2734727, 2.71468, 1, 0, 0.7568628, 1,
1.181954, -0.5953903, 1.98421, 1, 0, 0.7490196, 1,
1.182995, -0.4341521, 3.645543, 1, 0, 0.7450981, 1,
1.183522, 0.3439846, 1.526575, 1, 0, 0.7372549, 1,
1.184388, 1.117055, -0.3296715, 1, 0, 0.7333333, 1,
1.185484, -1.705778, 3.450416, 1, 0, 0.7254902, 1,
1.189945, -1.57297, 0.9662224, 1, 0, 0.7215686, 1,
1.193413, 0.5571722, 2.473423, 1, 0, 0.7137255, 1,
1.196335, -1.68104, 2.087267, 1, 0, 0.7098039, 1,
1.199962, -1.726413, 1.771781, 1, 0, 0.7019608, 1,
1.206533, -1.549849, 2.125144, 1, 0, 0.6941177, 1,
1.209534, 1.012052, -0.2723922, 1, 0, 0.6901961, 1,
1.214953, -1.296619, 2.09675, 1, 0, 0.682353, 1,
1.221524, -2.207051, 2.872916, 1, 0, 0.6784314, 1,
1.232826, 1.127598, 0.989931, 1, 0, 0.6705883, 1,
1.245528, 0.706579, 0.9157032, 1, 0, 0.6666667, 1,
1.246379, 0.5925677, 0.5363742, 1, 0, 0.6588235, 1,
1.250137, -0.8232042, 2.163117, 1, 0, 0.654902, 1,
1.250594, -0.1848418, 0.2293763, 1, 0, 0.6470588, 1,
1.25289, 0.3761334, 2.190216, 1, 0, 0.6431373, 1,
1.256681, 0.6695556, 0.3628339, 1, 0, 0.6352941, 1,
1.263213, 1.215298, 0.5459107, 1, 0, 0.6313726, 1,
1.270134, -0.28513, 1.674924, 1, 0, 0.6235294, 1,
1.280118, -0.6699567, 2.052884, 1, 0, 0.6196079, 1,
1.281459, 1.197575, 0.786464, 1, 0, 0.6117647, 1,
1.284897, -0.9430611, 2.117688, 1, 0, 0.6078432, 1,
1.286222, 1.07768, 0.4492313, 1, 0, 0.6, 1,
1.287418, 1.047078, -0.0579013, 1, 0, 0.5921569, 1,
1.292577, -2.008048, 3.527643, 1, 0, 0.5882353, 1,
1.304368, 0.6084872, 0.9153282, 1, 0, 0.5803922, 1,
1.307768, -2.539573, 2.99684, 1, 0, 0.5764706, 1,
1.317078, 0.3568709, 3.633591, 1, 0, 0.5686275, 1,
1.319752, -0.9438323, 3.153868, 1, 0, 0.5647059, 1,
1.328363, -0.2934649, 1.862908, 1, 0, 0.5568628, 1,
1.339093, -1.036725, 1.961553, 1, 0, 0.5529412, 1,
1.339109, 1.221271, 0.5550342, 1, 0, 0.5450981, 1,
1.342052, 3.088689, -0.569297, 1, 0, 0.5411765, 1,
1.342875, 0.03431081, 1.983812, 1, 0, 0.5333334, 1,
1.363847, -0.6685321, 1.00455, 1, 0, 0.5294118, 1,
1.364975, -1.162633, 2.314644, 1, 0, 0.5215687, 1,
1.370209, -0.6088725, 1.419203, 1, 0, 0.5176471, 1,
1.371291, 0.8798019, 0.03172869, 1, 0, 0.509804, 1,
1.372285, 1.198249, 2.395936, 1, 0, 0.5058824, 1,
1.377, -0.1021954, 1.62054, 1, 0, 0.4980392, 1,
1.37711, -0.07648019, 3.151226, 1, 0, 0.4901961, 1,
1.384881, 0.7407261, -0.7185554, 1, 0, 0.4862745, 1,
1.393458, 0.4771935, 0.06764366, 1, 0, 0.4784314, 1,
1.393485, -0.6360923, 2.692941, 1, 0, 0.4745098, 1,
1.394771, 0.2753125, 0.7914605, 1, 0, 0.4666667, 1,
1.396802, 0.7537906, 0.5720748, 1, 0, 0.4627451, 1,
1.400481, -0.08244122, 1.774686, 1, 0, 0.454902, 1,
1.40772, 1.501858, 0.8772224, 1, 0, 0.4509804, 1,
1.412741, -2.624494, 3.910163, 1, 0, 0.4431373, 1,
1.415349, -0.1205653, 3.527938, 1, 0, 0.4392157, 1,
1.42655, 1.139187, 2.503073, 1, 0, 0.4313726, 1,
1.451979, 2.991921, 0.9141835, 1, 0, 0.427451, 1,
1.465135, -0.9242477, 2.789503, 1, 0, 0.4196078, 1,
1.481113, 0.9220074, -0.124626, 1, 0, 0.4156863, 1,
1.487195, 1.004448, 2.227245, 1, 0, 0.4078431, 1,
1.505668, 0.5054364, 1.271038, 1, 0, 0.4039216, 1,
1.508108, -0.4388585, 3.247751, 1, 0, 0.3960784, 1,
1.514904, -0.9087067, 3.566529, 1, 0, 0.3882353, 1,
1.52062, 0.1063353, 1.720271, 1, 0, 0.3843137, 1,
1.522012, -1.327981, 3.989935, 1, 0, 0.3764706, 1,
1.537392, 0.7174007, 2.815917, 1, 0, 0.372549, 1,
1.545909, -0.6432639, 3.520586, 1, 0, 0.3647059, 1,
1.546317, 1.10761, 0.5657887, 1, 0, 0.3607843, 1,
1.546771, 0.6176491, 1.341474, 1, 0, 0.3529412, 1,
1.55404, 0.768501, -0.4544412, 1, 0, 0.3490196, 1,
1.592399, -0.177924, 2.889135, 1, 0, 0.3411765, 1,
1.592588, 0.1668692, 1.719894, 1, 0, 0.3372549, 1,
1.614974, 0.1471266, -0.7372112, 1, 0, 0.3294118, 1,
1.63091, -1.247868, 2.452213, 1, 0, 0.3254902, 1,
1.633515, -0.9113625, -0.2493926, 1, 0, 0.3176471, 1,
1.637375, -0.2883685, 0.01839981, 1, 0, 0.3137255, 1,
1.644428, -0.4161212, 0.7171327, 1, 0, 0.3058824, 1,
1.65698, 0.9814438, 1.191836, 1, 0, 0.2980392, 1,
1.688452, 0.8018933, 1.588992, 1, 0, 0.2941177, 1,
1.691633, 0.3183898, 0.05763642, 1, 0, 0.2862745, 1,
1.702008, 1.356822, 0.6586625, 1, 0, 0.282353, 1,
1.707672, -0.1463791, 1.347781, 1, 0, 0.2745098, 1,
1.716032, 0.7931027, 1.473977, 1, 0, 0.2705882, 1,
1.716645, -0.6896528, 1.897156, 1, 0, 0.2627451, 1,
1.728256, 1.110697, 2.779737, 1, 0, 0.2588235, 1,
1.734406, 0.2079612, 3.584443, 1, 0, 0.2509804, 1,
1.7393, 0.9421865, 0.6545807, 1, 0, 0.2470588, 1,
1.742645, -0.5867985, 1.004513, 1, 0, 0.2392157, 1,
1.743901, 0.8797771, 1.319564, 1, 0, 0.2352941, 1,
1.74466, 0.1925669, 1.369936, 1, 0, 0.227451, 1,
1.75125, 0.7130685, 0.7850076, 1, 0, 0.2235294, 1,
1.763006, -0.0894307, 1.542682, 1, 0, 0.2156863, 1,
1.770498, -1.922533, 3.864995, 1, 0, 0.2117647, 1,
1.782544, 0.01586782, 2.635622, 1, 0, 0.2039216, 1,
1.785202, -0.4920376, 1.82264, 1, 0, 0.1960784, 1,
1.795206, -0.4939254, 2.526364, 1, 0, 0.1921569, 1,
1.796017, 0.9036275, 0.9448404, 1, 0, 0.1843137, 1,
1.828196, 0.4248455, 0.3948392, 1, 0, 0.1803922, 1,
1.828565, 0.1827065, 0.4560803, 1, 0, 0.172549, 1,
1.833684, 0.06139277, 2.65344, 1, 0, 0.1686275, 1,
1.836422, 0.04554078, -0.6012922, 1, 0, 0.1607843, 1,
1.855372, 1.045545, 0.4271303, 1, 0, 0.1568628, 1,
1.878885, -0.7201773, 2.133606, 1, 0, 0.1490196, 1,
1.895867, -0.3496961, 2.053527, 1, 0, 0.145098, 1,
1.903287, -1.825051, 1.863042, 1, 0, 0.1372549, 1,
1.933016, -1.414926, 0.5949492, 1, 0, 0.1333333, 1,
1.96843, -0.6214128, 1.833919, 1, 0, 0.1254902, 1,
1.976892, 1.042938, 1.737487, 1, 0, 0.1215686, 1,
2.095419, 0.1423242, 2.657973, 1, 0, 0.1137255, 1,
2.097432, 0.4752816, 2.8045, 1, 0, 0.1098039, 1,
2.127136, 0.5680795, 0.3655766, 1, 0, 0.1019608, 1,
2.145251, 0.3550899, 1.988002, 1, 0, 0.09411765, 1,
2.155768, 0.8814505, 0.9731746, 1, 0, 0.09019608, 1,
2.173231, -0.7911401, 0.9546331, 1, 0, 0.08235294, 1,
2.173693, 1.009551, 1.99237, 1, 0, 0.07843138, 1,
2.188894, -2.045103, 2.047225, 1, 0, 0.07058824, 1,
2.203, 1.223725, 1.168694, 1, 0, 0.06666667, 1,
2.244034, 1.362909, 2.457686, 1, 0, 0.05882353, 1,
2.245768, 0.07178654, 2.930274, 1, 0, 0.05490196, 1,
2.368539, -0.8962846, 3.322824, 1, 0, 0.04705882, 1,
2.461837, 0.355295, 0.314346, 1, 0, 0.04313726, 1,
2.468089, 1.425183, 1.390689, 1, 0, 0.03529412, 1,
2.508065, 0.8195428, 1.209632, 1, 0, 0.03137255, 1,
2.561604, 0.501283, 0.3254741, 1, 0, 0.02352941, 1,
2.628335, 0.9660334, 0.7055073, 1, 0, 0.01960784, 1,
2.654969, 1.074975, -0.336713, 1, 0, 0.01176471, 1,
2.967186, 2.272307, 2.061803, 1, 0, 0.007843138, 1
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
0.05277407, -4.576807, -7.077955, 0, -0.5, 0.5, 0.5,
0.05277407, -4.576807, -7.077955, 1, -0.5, 0.5, 0.5,
0.05277407, -4.576807, -7.077955, 1, 1.5, 0.5, 0.5,
0.05277407, -4.576807, -7.077955, 0, 1.5, 0.5, 0.5
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
-3.849624, -0.09780324, -7.077955, 0, -0.5, 0.5, 0.5,
-3.849624, -0.09780324, -7.077955, 1, -0.5, 0.5, 0.5,
-3.849624, -0.09780324, -7.077955, 1, 1.5, 0.5, 0.5,
-3.849624, -0.09780324, -7.077955, 0, 1.5, 0.5, 0.5
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
-3.849624, -4.576807, 0.4301777, 0, -0.5, 0.5, 0.5,
-3.849624, -4.576807, 0.4301777, 1, -0.5, 0.5, 0.5,
-3.849624, -4.576807, 0.4301777, 1, 1.5, 0.5, 0.5,
-3.849624, -4.576807, 0.4301777, 0, 1.5, 0.5, 0.5
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
-2, -3.543191, -5.345309,
2, -3.543191, -5.345309,
-2, -3.543191, -5.345309,
-2, -3.715461, -5.634083,
-1, -3.543191, -5.345309,
-1, -3.715461, -5.634083,
0, -3.543191, -5.345309,
0, -3.715461, -5.634083,
1, -3.543191, -5.345309,
1, -3.715461, -5.634083,
2, -3.543191, -5.345309,
2, -3.715461, -5.634083
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
-2, -4.059999, -6.211632, 0, -0.5, 0.5, 0.5,
-2, -4.059999, -6.211632, 1, -0.5, 0.5, 0.5,
-2, -4.059999, -6.211632, 1, 1.5, 0.5, 0.5,
-2, -4.059999, -6.211632, 0, 1.5, 0.5, 0.5,
-1, -4.059999, -6.211632, 0, -0.5, 0.5, 0.5,
-1, -4.059999, -6.211632, 1, -0.5, 0.5, 0.5,
-1, -4.059999, -6.211632, 1, 1.5, 0.5, 0.5,
-1, -4.059999, -6.211632, 0, 1.5, 0.5, 0.5,
0, -4.059999, -6.211632, 0, -0.5, 0.5, 0.5,
0, -4.059999, -6.211632, 1, -0.5, 0.5, 0.5,
0, -4.059999, -6.211632, 1, 1.5, 0.5, 0.5,
0, -4.059999, -6.211632, 0, 1.5, 0.5, 0.5,
1, -4.059999, -6.211632, 0, -0.5, 0.5, 0.5,
1, -4.059999, -6.211632, 1, -0.5, 0.5, 0.5,
1, -4.059999, -6.211632, 1, 1.5, 0.5, 0.5,
1, -4.059999, -6.211632, 0, 1.5, 0.5, 0.5,
2, -4.059999, -6.211632, 0, -0.5, 0.5, 0.5,
2, -4.059999, -6.211632, 1, -0.5, 0.5, 0.5,
2, -4.059999, -6.211632, 1, 1.5, 0.5, 0.5,
2, -4.059999, -6.211632, 0, 1.5, 0.5, 0.5
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
-2.94907, -3, -5.345309,
-2.94907, 3, -5.345309,
-2.94907, -3, -5.345309,
-3.099163, -3, -5.634083,
-2.94907, -2, -5.345309,
-3.099163, -2, -5.634083,
-2.94907, -1, -5.345309,
-3.099163, -1, -5.634083,
-2.94907, 0, -5.345309,
-3.099163, 0, -5.634083,
-2.94907, 1, -5.345309,
-3.099163, 1, -5.634083,
-2.94907, 2, -5.345309,
-3.099163, 2, -5.634083,
-2.94907, 3, -5.345309,
-3.099163, 3, -5.634083
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
-3.399347, -3, -6.211632, 0, -0.5, 0.5, 0.5,
-3.399347, -3, -6.211632, 1, -0.5, 0.5, 0.5,
-3.399347, -3, -6.211632, 1, 1.5, 0.5, 0.5,
-3.399347, -3, -6.211632, 0, 1.5, 0.5, 0.5,
-3.399347, -2, -6.211632, 0, -0.5, 0.5, 0.5,
-3.399347, -2, -6.211632, 1, -0.5, 0.5, 0.5,
-3.399347, -2, -6.211632, 1, 1.5, 0.5, 0.5,
-3.399347, -2, -6.211632, 0, 1.5, 0.5, 0.5,
-3.399347, -1, -6.211632, 0, -0.5, 0.5, 0.5,
-3.399347, -1, -6.211632, 1, -0.5, 0.5, 0.5,
-3.399347, -1, -6.211632, 1, 1.5, 0.5, 0.5,
-3.399347, -1, -6.211632, 0, 1.5, 0.5, 0.5,
-3.399347, 0, -6.211632, 0, -0.5, 0.5, 0.5,
-3.399347, 0, -6.211632, 1, -0.5, 0.5, 0.5,
-3.399347, 0, -6.211632, 1, 1.5, 0.5, 0.5,
-3.399347, 0, -6.211632, 0, 1.5, 0.5, 0.5,
-3.399347, 1, -6.211632, 0, -0.5, 0.5, 0.5,
-3.399347, 1, -6.211632, 1, -0.5, 0.5, 0.5,
-3.399347, 1, -6.211632, 1, 1.5, 0.5, 0.5,
-3.399347, 1, -6.211632, 0, 1.5, 0.5, 0.5,
-3.399347, 2, -6.211632, 0, -0.5, 0.5, 0.5,
-3.399347, 2, -6.211632, 1, -0.5, 0.5, 0.5,
-3.399347, 2, -6.211632, 1, 1.5, 0.5, 0.5,
-3.399347, 2, -6.211632, 0, 1.5, 0.5, 0.5,
-3.399347, 3, -6.211632, 0, -0.5, 0.5, 0.5,
-3.399347, 3, -6.211632, 1, -0.5, 0.5, 0.5,
-3.399347, 3, -6.211632, 1, 1.5, 0.5, 0.5,
-3.399347, 3, -6.211632, 0, 1.5, 0.5, 0.5
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
-2.94907, -3.543191, -4,
-2.94907, -3.543191, 6,
-2.94907, -3.543191, -4,
-3.099163, -3.715461, -4,
-2.94907, -3.543191, -2,
-3.099163, -3.715461, -2,
-2.94907, -3.543191, 0,
-3.099163, -3.715461, 0,
-2.94907, -3.543191, 2,
-3.099163, -3.715461, 2,
-2.94907, -3.543191, 4,
-3.099163, -3.715461, 4,
-2.94907, -3.543191, 6,
-3.099163, -3.715461, 6
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
-3.399347, -4.059999, -4, 0, -0.5, 0.5, 0.5,
-3.399347, -4.059999, -4, 1, -0.5, 0.5, 0.5,
-3.399347, -4.059999, -4, 1, 1.5, 0.5, 0.5,
-3.399347, -4.059999, -4, 0, 1.5, 0.5, 0.5,
-3.399347, -4.059999, -2, 0, -0.5, 0.5, 0.5,
-3.399347, -4.059999, -2, 1, -0.5, 0.5, 0.5,
-3.399347, -4.059999, -2, 1, 1.5, 0.5, 0.5,
-3.399347, -4.059999, -2, 0, 1.5, 0.5, 0.5,
-3.399347, -4.059999, 0, 0, -0.5, 0.5, 0.5,
-3.399347, -4.059999, 0, 1, -0.5, 0.5, 0.5,
-3.399347, -4.059999, 0, 1, 1.5, 0.5, 0.5,
-3.399347, -4.059999, 0, 0, 1.5, 0.5, 0.5,
-3.399347, -4.059999, 2, 0, -0.5, 0.5, 0.5,
-3.399347, -4.059999, 2, 1, -0.5, 0.5, 0.5,
-3.399347, -4.059999, 2, 1, 1.5, 0.5, 0.5,
-3.399347, -4.059999, 2, 0, 1.5, 0.5, 0.5,
-3.399347, -4.059999, 4, 0, -0.5, 0.5, 0.5,
-3.399347, -4.059999, 4, 1, -0.5, 0.5, 0.5,
-3.399347, -4.059999, 4, 1, 1.5, 0.5, 0.5,
-3.399347, -4.059999, 4, 0, 1.5, 0.5, 0.5,
-3.399347, -4.059999, 6, 0, -0.5, 0.5, 0.5,
-3.399347, -4.059999, 6, 1, -0.5, 0.5, 0.5,
-3.399347, -4.059999, 6, 1, 1.5, 0.5, 0.5,
-3.399347, -4.059999, 6, 0, 1.5, 0.5, 0.5
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
-2.94907, -3.543191, -5.345309,
-2.94907, 3.347585, -5.345309,
-2.94907, -3.543191, 6.205664,
-2.94907, 3.347585, 6.205664,
-2.94907, -3.543191, -5.345309,
-2.94907, -3.543191, 6.205664,
-2.94907, 3.347585, -5.345309,
-2.94907, 3.347585, 6.205664,
-2.94907, -3.543191, -5.345309,
3.054619, -3.543191, -5.345309,
-2.94907, -3.543191, 6.205664,
3.054619, -3.543191, 6.205664,
-2.94907, 3.347585, -5.345309,
3.054619, 3.347585, -5.345309,
-2.94907, 3.347585, 6.205664,
3.054619, 3.347585, 6.205664,
3.054619, -3.543191, -5.345309,
3.054619, 3.347585, -5.345309,
3.054619, -3.543191, 6.205664,
3.054619, 3.347585, 6.205664,
3.054619, -3.543191, -5.345309,
3.054619, -3.543191, 6.205664,
3.054619, 3.347585, -5.345309,
3.054619, 3.347585, 6.205664
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
var radius = 7.865156;
var distance = 34.99297;
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
mvMatrix.translate( -0.05277407, 0.09780324, -0.4301777 );
mvMatrix.scale( 1.416456, 1.234108, 0.7362117 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.99297);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
methoxycarbamate<-read.table("methoxycarbamate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methoxycarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'methoxycarbamate' not found
```

```r
y<-methoxycarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'methoxycarbamate' not found
```

```r
z<-methoxycarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'methoxycarbamate' not found
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
-2.861638, 2.559493, -2.125086, 0, 0, 1, 1, 1,
-2.57783, -1.10708, -1.276309, 1, 0, 0, 1, 1,
-2.567203, 1.76073, -1.069771, 1, 0, 0, 1, 1,
-2.504574, -0.3270499, -2.931554, 1, 0, 0, 1, 1,
-2.451706, 1.413396, -0.03355233, 1, 0, 0, 1, 1,
-2.326141, -1.499211, -3.52388, 1, 0, 0, 1, 1,
-2.230196, -0.2848467, -1.608448, 0, 0, 0, 1, 1,
-2.214134, -0.3988431, -1.666902, 0, 0, 0, 1, 1,
-2.213405, -0.3974067, -0.646044, 0, 0, 0, 1, 1,
-2.191439, 1.572785, -1.242799, 0, 0, 0, 1, 1,
-2.153399, -0.4995443, -3.61979, 0, 0, 0, 1, 1,
-2.14976, -1.39975, -1.348191, 0, 0, 0, 1, 1,
-2.14363, -0.6275875, -3.105126, 0, 0, 0, 1, 1,
-2.128392, -0.8944567, -1.068531, 1, 1, 1, 1, 1,
-2.114899, -1.265195, -2.662584, 1, 1, 1, 1, 1,
-2.106344, 0.1561889, -2.176123, 1, 1, 1, 1, 1,
-2.068783, 0.2440383, -2.493402, 1, 1, 1, 1, 1,
-2.061581, -1.060152, -3.51354, 1, 1, 1, 1, 1,
-2.009288, -0.1071377, -1.59699, 1, 1, 1, 1, 1,
-2.004991, 0.7097193, -0.5517431, 1, 1, 1, 1, 1,
-1.981612, 0.1549955, -2.439942, 1, 1, 1, 1, 1,
-1.969165, 3.247234, 0.535945, 1, 1, 1, 1, 1,
-1.959454, -0.3947737, -2.361098, 1, 1, 1, 1, 1,
-1.914713, -0.8391168, -3.456065, 1, 1, 1, 1, 1,
-1.912307, 1.184579, 0.5159954, 1, 1, 1, 1, 1,
-1.908639, 1.893201, 0.4970571, 1, 1, 1, 1, 1,
-1.90432, -0.2125337, -1.652446, 1, 1, 1, 1, 1,
-1.832838, -0.6270204, -2.350438, 1, 1, 1, 1, 1,
-1.81936, -1.673991, -1.022783, 0, 0, 1, 1, 1,
-1.815371, 0.2825522, -1.31274, 1, 0, 0, 1, 1,
-1.803323, -0.9051766, -1.087668, 1, 0, 0, 1, 1,
-1.79272, 1.18819, -1.407109, 1, 0, 0, 1, 1,
-1.78989, -0.06589586, -2.119267, 1, 0, 0, 1, 1,
-1.783957, -0.7662796, -0.9671176, 1, 0, 0, 1, 1,
-1.762906, 0.02877997, -1.779999, 0, 0, 0, 1, 1,
-1.749666, -0.5333875, -1.649955, 0, 0, 0, 1, 1,
-1.732918, -1.173987, -1.904098, 0, 0, 0, 1, 1,
-1.731629, -0.9693481, -1.915626, 0, 0, 0, 1, 1,
-1.726768, -0.8674006, -2.49314, 0, 0, 0, 1, 1,
-1.71282, -1.311421, -1.30974, 0, 0, 0, 1, 1,
-1.706352, 0.09659599, -1.090243, 0, 0, 0, 1, 1,
-1.70342, -0.04368912, -1.612382, 1, 1, 1, 1, 1,
-1.694742, -0.8906383, -1.969058, 1, 1, 1, 1, 1,
-1.690141, -1.241956, -3.525319, 1, 1, 1, 1, 1,
-1.663226, -2.210207, -2.950378, 1, 1, 1, 1, 1,
-1.648592, 0.4469627, -0.8788816, 1, 1, 1, 1, 1,
-1.641788, -0.3946561, -3.002334, 1, 1, 1, 1, 1,
-1.61747, -0.6554787, -1.552623, 1, 1, 1, 1, 1,
-1.617173, 0.771448, -0.8812466, 1, 1, 1, 1, 1,
-1.610373, 0.1089273, -2.49892, 1, 1, 1, 1, 1,
-1.609971, 0.2245234, -1.00728, 1, 1, 1, 1, 1,
-1.590081, 0.2225958, -1.53503, 1, 1, 1, 1, 1,
-1.588836, 0.4561961, -1.182549, 1, 1, 1, 1, 1,
-1.582304, 0.3600495, -1.983905, 1, 1, 1, 1, 1,
-1.581441, 0.7664413, -1.063119, 1, 1, 1, 1, 1,
-1.580663, -0.5150289, -1.868617, 1, 1, 1, 1, 1,
-1.576678, 1.198597, -1.767669, 0, 0, 1, 1, 1,
-1.545741, -0.7845634, -1.148765, 1, 0, 0, 1, 1,
-1.539261, -2.131626, -0.4603114, 1, 0, 0, 1, 1,
-1.523434, -0.4605106, -0.8781266, 1, 0, 0, 1, 1,
-1.506848, 0.4903769, -1.754857, 1, 0, 0, 1, 1,
-1.498893, -0.8794703, -0.4822578, 1, 0, 0, 1, 1,
-1.493542, 0.300715, -1.952115, 0, 0, 0, 1, 1,
-1.482169, -1.43823, -0.5275376, 0, 0, 0, 1, 1,
-1.480267, -0.2292584, -1.800078, 0, 0, 0, 1, 1,
-1.475716, 0.2873042, -1.018144, 0, 0, 0, 1, 1,
-1.451593, -1.059443, -2.983179, 0, 0, 0, 1, 1,
-1.440367, 0.5542912, -2.612733, 0, 0, 0, 1, 1,
-1.440235, -0.4365902, -2.732869, 0, 0, 0, 1, 1,
-1.406421, -1.064526, -2.943376, 1, 1, 1, 1, 1,
-1.396347, -0.8941321, -0.1380491, 1, 1, 1, 1, 1,
-1.382173, 0.4810453, -0.539499, 1, 1, 1, 1, 1,
-1.373301, 1.820524, -0.05606456, 1, 1, 1, 1, 1,
-1.371441, 1.124789, -0.8477371, 1, 1, 1, 1, 1,
-1.351072, -0.6896219, -2.1322, 1, 1, 1, 1, 1,
-1.330918, 0.6592373, -1.303382, 1, 1, 1, 1, 1,
-1.330142, 1.239856, -2.178945, 1, 1, 1, 1, 1,
-1.320043, 0.7587186, -1.722867, 1, 1, 1, 1, 1,
-1.315534, -0.2688245, -0.9947224, 1, 1, 1, 1, 1,
-1.309345, -0.6261751, -2.28312, 1, 1, 1, 1, 1,
-1.306775, -1.233322, -2.860571, 1, 1, 1, 1, 1,
-1.301227, -0.9711559, -2.290752, 1, 1, 1, 1, 1,
-1.293795, 0.7060167, -1.436216, 1, 1, 1, 1, 1,
-1.292791, -0.1432341, -1.184862, 1, 1, 1, 1, 1,
-1.279546, -0.0003971818, -1.71984, 0, 0, 1, 1, 1,
-1.26544, -0.3833501, -1.980511, 1, 0, 0, 1, 1,
-1.26353, -0.9772063, -1.613763, 1, 0, 0, 1, 1,
-1.259063, -1.184677, -1.800741, 1, 0, 0, 1, 1,
-1.247053, -0.3448901, -2.680771, 1, 0, 0, 1, 1,
-1.243175, 0.8002958, -1.837585, 1, 0, 0, 1, 1,
-1.24178, -0.04063943, -1.309124, 0, 0, 0, 1, 1,
-1.241323, -1.504794, -2.609215, 0, 0, 0, 1, 1,
-1.238739, 0.4899645, -0.1883561, 0, 0, 0, 1, 1,
-1.234691, 0.007807819, -0.825118, 0, 0, 0, 1, 1,
-1.222461, -1.083738, -2.893009, 0, 0, 0, 1, 1,
-1.222111, -0.1715854, -2.046756, 0, 0, 0, 1, 1,
-1.221859, 0.1281796, -1.143117, 0, 0, 0, 1, 1,
-1.213516, -1.658506, -3.135452, 1, 1, 1, 1, 1,
-1.194718, -0.8144631, -0.3652839, 1, 1, 1, 1, 1,
-1.192437, -1.357909, -1.867379, 1, 1, 1, 1, 1,
-1.167878, -0.0669072, -1.369977, 1, 1, 1, 1, 1,
-1.163066, 1.018198, -0.03065924, 1, 1, 1, 1, 1,
-1.162744, -1.40442, -1.735432, 1, 1, 1, 1, 1,
-1.16045, -1.767046, -4.616528, 1, 1, 1, 1, 1,
-1.158623, -0.4039784, -4.095187, 1, 1, 1, 1, 1,
-1.148939, -0.2673877, -0.484959, 1, 1, 1, 1, 1,
-1.113937, 1.357951, 1.191675, 1, 1, 1, 1, 1,
-1.107143, -1.772734, -1.694986, 1, 1, 1, 1, 1,
-1.107046, 0.1856556, -1.239627, 1, 1, 1, 1, 1,
-1.104213, -0.8029805, -2.609187, 1, 1, 1, 1, 1,
-1.091606, 0.06628475, -0.4081965, 1, 1, 1, 1, 1,
-1.082233, -0.3870464, -2.848793, 1, 1, 1, 1, 1,
-1.072321, 2.571502, 1.255714, 0, 0, 1, 1, 1,
-1.070009, -0.7736371, -2.329285, 1, 0, 0, 1, 1,
-1.066525, -0.7367806, -1.718498, 1, 0, 0, 1, 1,
-1.066248, -0.3170359, -1.69287, 1, 0, 0, 1, 1,
-1.064168, 0.338068, 0.03439789, 1, 0, 0, 1, 1,
-1.063409, 1.20027, -0.2483776, 1, 0, 0, 1, 1,
-1.06058, 2.169817, -1.330205, 0, 0, 0, 1, 1,
-1.053664, -0.02058924, -1.774429, 0, 0, 0, 1, 1,
-1.041831, -0.364862, -1.779398, 0, 0, 0, 1, 1,
-1.03999, -0.6175398, -1.538835, 0, 0, 0, 1, 1,
-1.034282, 0.09535643, -0.8005768, 0, 0, 0, 1, 1,
-1.022825, -1.891478, -1.744668, 0, 0, 0, 1, 1,
-1.011037, 0.9500295, 0.07894437, 0, 0, 0, 1, 1,
-1.010475, -1.290402, -4.897811, 1, 1, 1, 1, 1,
-1.008324, -0.8699118, -4.341981, 1, 1, 1, 1, 1,
-1.006605, -0.5730665, -1.913733, 1, 1, 1, 1, 1,
-1.002855, 1.081358, -0.6404012, 1, 1, 1, 1, 1,
-0.999194, -0.07042056, -2.939205, 1, 1, 1, 1, 1,
-0.9958341, -0.2358885, -0.002293653, 1, 1, 1, 1, 1,
-0.9938598, 0.3417507, -1.042045, 1, 1, 1, 1, 1,
-0.991486, -0.8310666, -2.270097, 1, 1, 1, 1, 1,
-0.9907525, -0.8708957, -2.708533, 1, 1, 1, 1, 1,
-0.9860508, 0.3203524, -1.038402, 1, 1, 1, 1, 1,
-0.9825991, 0.0519094, -1.510431, 1, 1, 1, 1, 1,
-0.9682734, 0.325145, 0.2525186, 1, 1, 1, 1, 1,
-0.9635054, 1.269397, -1.561088, 1, 1, 1, 1, 1,
-0.9566833, -1.030467, -2.703579, 1, 1, 1, 1, 1,
-0.9540483, 0.1172059, -2.02277, 1, 1, 1, 1, 1,
-0.9516799, -0.6860735, -0.3087846, 0, 0, 1, 1, 1,
-0.944174, 0.7210235, -0.1834947, 1, 0, 0, 1, 1,
-0.9439943, -1.056173, -2.762763, 1, 0, 0, 1, 1,
-0.9420685, -0.4516395, -0.5640007, 1, 0, 0, 1, 1,
-0.9386811, 0.2481901, -0.506519, 1, 0, 0, 1, 1,
-0.9369715, 0.7322004, -1.57937, 1, 0, 0, 1, 1,
-0.9363266, -1.321064, -2.534889, 0, 0, 0, 1, 1,
-0.9360169, -0.1297592, -1.932326, 0, 0, 0, 1, 1,
-0.9346561, 0.06996843, -1.303198, 0, 0, 0, 1, 1,
-0.9273559, 1.467805, -0.7241753, 0, 0, 0, 1, 1,
-0.924327, 0.2854364, -1.055278, 0, 0, 0, 1, 1,
-0.9124429, 1.524152, -0.3667705, 0, 0, 0, 1, 1,
-0.9098567, 0.6435739, -0.5946936, 0, 0, 0, 1, 1,
-0.9094058, 0.1310567, -1.334553, 1, 1, 1, 1, 1,
-0.9089741, -0.2398182, -3.870186, 1, 1, 1, 1, 1,
-0.9036616, 0.4948641, 0.746053, 1, 1, 1, 1, 1,
-0.8948503, -0.6336215, -1.526857, 1, 1, 1, 1, 1,
-0.8932297, -0.4687262, -2.470756, 1, 1, 1, 1, 1,
-0.8921262, -0.07056638, -0.1508031, 1, 1, 1, 1, 1,
-0.8859202, 0.4444971, -1.589215, 1, 1, 1, 1, 1,
-0.8843672, -0.6885309, -1.541456, 1, 1, 1, 1, 1,
-0.8720694, 0.4737743, -0.7847566, 1, 1, 1, 1, 1,
-0.8635985, -0.3006664, -1.277486, 1, 1, 1, 1, 1,
-0.8632543, -0.613733, -1.272709, 1, 1, 1, 1, 1,
-0.8609918, -1.547064, -3.792897, 1, 1, 1, 1, 1,
-0.8561366, 0.6771958, -1.379675, 1, 1, 1, 1, 1,
-0.852888, -1.393142, -2.226959, 1, 1, 1, 1, 1,
-0.8523812, -0.1316916, 0.2337857, 1, 1, 1, 1, 1,
-0.8486941, 1.220379, -0.5094156, 0, 0, 1, 1, 1,
-0.8459758, 0.2840887, -1.994187, 1, 0, 0, 1, 1,
-0.8457283, -1.569713, -1.761084, 1, 0, 0, 1, 1,
-0.8429207, -0.2850699, -2.465091, 1, 0, 0, 1, 1,
-0.8398298, 0.1343539, -2.54163, 1, 0, 0, 1, 1,
-0.839707, 0.8219024, -1.786532, 1, 0, 0, 1, 1,
-0.8272728, 0.4559115, -1.0222, 0, 0, 0, 1, 1,
-0.818463, -0.4224711, -3.27824, 0, 0, 0, 1, 1,
-0.8178882, 1.688121, -0.3066815, 0, 0, 0, 1, 1,
-0.814592, -0.3386217, -1.824964, 0, 0, 0, 1, 1,
-0.8118967, -0.5261675, -1.713183, 0, 0, 0, 1, 1,
-0.8116492, -0.0853351, -3.010112, 0, 0, 0, 1, 1,
-0.8055604, -0.7553261, -2.039175, 0, 0, 0, 1, 1,
-0.802167, -0.4785285, -2.269428, 1, 1, 1, 1, 1,
-0.7975473, 0.002459865, -0.3740961, 1, 1, 1, 1, 1,
-0.7903091, -1.371949, -2.112576, 1, 1, 1, 1, 1,
-0.7876234, 0.4888995, -0.06160411, 1, 1, 1, 1, 1,
-0.7866682, 0.8788934, 0.8608042, 1, 1, 1, 1, 1,
-0.7836979, 0.0107006, -1.274252, 1, 1, 1, 1, 1,
-0.7828724, -0.7177132, -2.530549, 1, 1, 1, 1, 1,
-0.7803042, -2.329333, -2.99896, 1, 1, 1, 1, 1,
-0.7778936, -1.443295, -2.957548, 1, 1, 1, 1, 1,
-0.7739732, -0.8691449, -1.75869, 1, 1, 1, 1, 1,
-0.7672375, -0.9392477, -2.12153, 1, 1, 1, 1, 1,
-0.7596871, -0.1491562, -2.903763, 1, 1, 1, 1, 1,
-0.7588646, -0.7089434, -4.322239, 1, 1, 1, 1, 1,
-0.7560242, -0.5606493, -1.21752, 1, 1, 1, 1, 1,
-0.7560112, -0.1546986, -2.569069, 1, 1, 1, 1, 1,
-0.7556075, 0.2049206, -2.870575, 0, 0, 1, 1, 1,
-0.752336, -1.717073, -2.076736, 1, 0, 0, 1, 1,
-0.7467084, -0.240069, -2.374904, 1, 0, 0, 1, 1,
-0.7439138, 1.757441, 1.492713, 1, 0, 0, 1, 1,
-0.7422213, 0.332031, -1.722582, 1, 0, 0, 1, 1,
-0.7421058, -0.3241535, -1.532347, 1, 0, 0, 1, 1,
-0.7413499, -0.4390558, -3.509179, 0, 0, 0, 1, 1,
-0.7406698, 1.141511, -1.068986, 0, 0, 0, 1, 1,
-0.7380193, -0.2624504, -2.206006, 0, 0, 0, 1, 1,
-0.737979, 0.003339855, -3.097879, 0, 0, 0, 1, 1,
-0.7374372, 0.1484449, -0.9798765, 0, 0, 0, 1, 1,
-0.7313097, -0.2954569, -3.496408, 0, 0, 0, 1, 1,
-0.7294576, 1.159082, -1.699864, 0, 0, 0, 1, 1,
-0.7285779, 0.6232464, -1.626871, 1, 1, 1, 1, 1,
-0.7283665, -0.8280122, -2.789137, 1, 1, 1, 1, 1,
-0.7194802, -0.9693414, -1.79597, 1, 1, 1, 1, 1,
-0.7087177, -1.088169, -0.658577, 1, 1, 1, 1, 1,
-0.7028428, 0.5880582, -2.180699, 1, 1, 1, 1, 1,
-0.7010661, 0.7951472, -2.438876, 1, 1, 1, 1, 1,
-0.6928797, 1.82711, -1.318979, 1, 1, 1, 1, 1,
-0.6877682, 0.3537937, -1.076356, 1, 1, 1, 1, 1,
-0.6813198, 0.5068406, -0.1346698, 1, 1, 1, 1, 1,
-0.6756639, -0.03421176, -1.080386, 1, 1, 1, 1, 1,
-0.674477, 0.7076229, -0.09334386, 1, 1, 1, 1, 1,
-0.6743554, -1.095893, -1.986762, 1, 1, 1, 1, 1,
-0.6542113, -1.00124, -0.6156799, 1, 1, 1, 1, 1,
-0.648669, 1.668508, -0.1910161, 1, 1, 1, 1, 1,
-0.6466898, -0.284795, -1.259239, 1, 1, 1, 1, 1,
-0.6411167, 0.6862828, -1.939639, 0, 0, 1, 1, 1,
-0.6408383, 0.5772102, -1.818323, 1, 0, 0, 1, 1,
-0.6329917, 0.3839502, -2.471922, 1, 0, 0, 1, 1,
-0.6324498, -2.007594, -3.13952, 1, 0, 0, 1, 1,
-0.6304262, 0.212126, -1.502672, 1, 0, 0, 1, 1,
-0.6298409, -0.5828323, -0.4778368, 1, 0, 0, 1, 1,
-0.6259427, 0.8797843, -0.3466338, 0, 0, 0, 1, 1,
-0.6231611, 0.6995497, 0.3636442, 0, 0, 0, 1, 1,
-0.6223432, -1.437896, -2.793758, 0, 0, 0, 1, 1,
-0.6191301, -1.08591, -3.792482, 0, 0, 0, 1, 1,
-0.6190497, 0.3387539, -0.7725689, 0, 0, 0, 1, 1,
-0.6140418, -1.328426, -2.888865, 0, 0, 0, 1, 1,
-0.6093098, -0.5167015, -1.47851, 0, 0, 0, 1, 1,
-0.6078451, -1.036019, -1.635314, 1, 1, 1, 1, 1,
-0.6036546, -0.1078286, -1.644142, 1, 1, 1, 1, 1,
-0.597776, -0.3964109, -2.195548, 1, 1, 1, 1, 1,
-0.5974859, 1.415533, 0.4474099, 1, 1, 1, 1, 1,
-0.595604, -0.294522, -2.429796, 1, 1, 1, 1, 1,
-0.5948244, 1.037026, 0.08961114, 1, 1, 1, 1, 1,
-0.5929232, 0.00649282, -2.982363, 1, 1, 1, 1, 1,
-0.587221, -0.6309832, -3.385587, 1, 1, 1, 1, 1,
-0.5835532, -1.116137, -0.03572346, 1, 1, 1, 1, 1,
-0.5804967, 1.033712, -0.7863525, 1, 1, 1, 1, 1,
-0.5791842, -1.51672, -2.846994, 1, 1, 1, 1, 1,
-0.5759062, -1.577029, -1.849824, 1, 1, 1, 1, 1,
-0.5740605, 0.8989744, -1.127388, 1, 1, 1, 1, 1,
-0.5732006, -0.06624357, -1.013804, 1, 1, 1, 1, 1,
-0.572468, 1.06701, -0.4164952, 1, 1, 1, 1, 1,
-0.5714332, 0.6132933, -0.1917251, 0, 0, 1, 1, 1,
-0.5709643, -0.4246375, -2.263582, 1, 0, 0, 1, 1,
-0.5577677, -1.115596, -1.299536, 1, 0, 0, 1, 1,
-0.5571769, 2.335795, -0.8832812, 1, 0, 0, 1, 1,
-0.5550933, 0.3615291, -1.274894, 1, 0, 0, 1, 1,
-0.5540009, -0.9884506, -3.194133, 1, 0, 0, 1, 1,
-0.5482074, -0.1498796, -1.445337, 0, 0, 0, 1, 1,
-0.5414383, -0.6569465, -2.158631, 0, 0, 0, 1, 1,
-0.5391336, 0.1563172, -2.653637, 0, 0, 0, 1, 1,
-0.5383188, 0.6953541, -0.1993664, 0, 0, 0, 1, 1,
-0.5382182, -0.6527647, -2.221596, 0, 0, 0, 1, 1,
-0.5380255, 0.1126761, -2.775302, 0, 0, 0, 1, 1,
-0.5378191, -0.9052033, -3.506509, 0, 0, 0, 1, 1,
-0.5347871, -1.209214, -1.98983, 1, 1, 1, 1, 1,
-0.5279982, -0.7981426, -3.557049, 1, 1, 1, 1, 1,
-0.5254951, 1.493941, 0.01712244, 1, 1, 1, 1, 1,
-0.5253739, 0.5392939, -0.2425799, 1, 1, 1, 1, 1,
-0.5242132, -1.161888, -0.4506379, 1, 1, 1, 1, 1,
-0.5097764, -0.08084483, -1.977031, 1, 1, 1, 1, 1,
-0.5064934, -0.724756, -0.5867718, 1, 1, 1, 1, 1,
-0.5008695, -0.6264409, 0.8688562, 1, 1, 1, 1, 1,
-0.494399, 0.3860522, -1.077139, 1, 1, 1, 1, 1,
-0.493097, -0.4903218, -1.83621, 1, 1, 1, 1, 1,
-0.4901335, -0.8318195, -2.66168, 1, 1, 1, 1, 1,
-0.4833939, 0.5605688, -3.372406, 1, 1, 1, 1, 1,
-0.4833761, -0.01722078, -1.166552, 1, 1, 1, 1, 1,
-0.4818695, -0.8861164, -2.333002, 1, 1, 1, 1, 1,
-0.4784334, -1.546839, -2.85706, 1, 1, 1, 1, 1,
-0.47816, 1.187623, -0.7766556, 0, 0, 1, 1, 1,
-0.477837, 1.665526, 0.1098536, 1, 0, 0, 1, 1,
-0.4773141, 1.059038, -1.204154, 1, 0, 0, 1, 1,
-0.4749179, 0.4007264, -2.304883, 1, 0, 0, 1, 1,
-0.4694107, -1.104483, -2.243882, 1, 0, 0, 1, 1,
-0.4629566, 2.177591, 1.955426, 1, 0, 0, 1, 1,
-0.4589311, -1.326515, -4.236971, 0, 0, 0, 1, 1,
-0.4471492, 1.261591, -0.1452178, 0, 0, 0, 1, 1,
-0.447089, -0.7929143, -3.447923, 0, 0, 0, 1, 1,
-0.4441284, -0.3228283, -2.495985, 0, 0, 0, 1, 1,
-0.4420785, -1.447625, -4.080607, 0, 0, 0, 1, 1,
-0.439534, -1.096704, -3.761877, 0, 0, 0, 1, 1,
-0.4342346, 0.7001407, -1.239105, 0, 0, 0, 1, 1,
-0.4340387, 0.5369979, 0.02383575, 1, 1, 1, 1, 1,
-0.4306677, 1.192049, 0.3389486, 1, 1, 1, 1, 1,
-0.4281646, 0.4614607, -0.7866591, 1, 1, 1, 1, 1,
-0.4269212, -2.333143, -1.95775, 1, 1, 1, 1, 1,
-0.4255686, -1.083187, -1.77681, 1, 1, 1, 1, 1,
-0.4219687, -0.08576432, -2.000466, 1, 1, 1, 1, 1,
-0.4209291, -0.3270871, -5.177091, 1, 1, 1, 1, 1,
-0.4188658, -1.069648, -4.277095, 1, 1, 1, 1, 1,
-0.4129004, 0.04093044, -3.450055, 1, 1, 1, 1, 1,
-0.4118071, -1.964413, -4.2246, 1, 1, 1, 1, 1,
-0.38694, -0.7316827, -0.3131842, 1, 1, 1, 1, 1,
-0.3843802, 0.5731857, -1.514048, 1, 1, 1, 1, 1,
-0.3837182, -0.635651, -2.387804, 1, 1, 1, 1, 1,
-0.381369, 1.53985, -0.929667, 1, 1, 1, 1, 1,
-0.3704524, -0.9746692, -2.075726, 1, 1, 1, 1, 1,
-0.3667979, 0.6559542, -1.185163, 0, 0, 1, 1, 1,
-0.3655761, -0.520819, -2.6769, 1, 0, 0, 1, 1,
-0.3604538, -2.063908, -3.497363, 1, 0, 0, 1, 1,
-0.3589304, -1.293189, -3.536496, 1, 0, 0, 1, 1,
-0.3570815, 0.5339259, -1.079561, 1, 0, 0, 1, 1,
-0.3555752, -1.374359, -0.5813302, 1, 0, 0, 1, 1,
-0.3504725, 1.580942, 0.9492108, 0, 0, 0, 1, 1,
-0.346986, -0.1198607, -1.076451, 0, 0, 0, 1, 1,
-0.34576, -0.2223549, -2.66235, 0, 0, 0, 1, 1,
-0.3454601, -0.158306, -2.074359, 0, 0, 0, 1, 1,
-0.3399937, 1.204149, 0.4255054, 0, 0, 0, 1, 1,
-0.3384149, -1.015569, -2.811007, 0, 0, 0, 1, 1,
-0.3360736, 1.589991, -0.6783674, 0, 0, 0, 1, 1,
-0.3334759, -0.1646611, -0.9016328, 1, 1, 1, 1, 1,
-0.3320984, 0.05460823, -3.182911, 1, 1, 1, 1, 1,
-0.3291774, 0.3522618, -0.5047936, 1, 1, 1, 1, 1,
-0.3291469, 0.2257168, -1.003028, 1, 1, 1, 1, 1,
-0.328788, 0.4767178, 0.6667011, 1, 1, 1, 1, 1,
-0.3257573, 0.5397726, -1.196001, 1, 1, 1, 1, 1,
-0.3247153, -0.5527717, -1.853052, 1, 1, 1, 1, 1,
-0.3243998, -0.4664327, -3.555184, 1, 1, 1, 1, 1,
-0.3203478, 1.468933, 1.347659, 1, 1, 1, 1, 1,
-0.3130986, -0.7181646, -1.100236, 1, 1, 1, 1, 1,
-0.3129385, -0.6304721, -3.509681, 1, 1, 1, 1, 1,
-0.3119543, 0.166339, -3.370644, 1, 1, 1, 1, 1,
-0.3086297, -3.44284, -4.292228, 1, 1, 1, 1, 1,
-0.3032661, -1.539758, -2.999592, 1, 1, 1, 1, 1,
-0.3021214, -1.895451, -3.094512, 1, 1, 1, 1, 1,
-0.3020535, -0.3540984, -2.482823, 0, 0, 1, 1, 1,
-0.301925, 0.3012864, -0.1502359, 1, 0, 0, 1, 1,
-0.2902794, 0.6544355, 0.2671435, 1, 0, 0, 1, 1,
-0.2828153, -0.6131795, -2.545473, 1, 0, 0, 1, 1,
-0.281516, -0.09879049, -1.197842, 1, 0, 0, 1, 1,
-0.2745064, 0.4513915, 1.200352, 1, 0, 0, 1, 1,
-0.2723506, 0.2767365, -1.482869, 0, 0, 0, 1, 1,
-0.2710298, -1.274625, -2.196622, 0, 0, 0, 1, 1,
-0.2697063, -1.724992, -4.832063, 0, 0, 0, 1, 1,
-0.2680677, -0.4746188, -1.961124, 0, 0, 0, 1, 1,
-0.2644426, -0.3059585, -3.002302, 0, 0, 0, 1, 1,
-0.2625067, 1.56041, 0.4988365, 0, 0, 0, 1, 1,
-0.2596359, 0.4456868, -0.5229383, 0, 0, 0, 1, 1,
-0.254555, 1.237409, -1.202442, 1, 1, 1, 1, 1,
-0.2536303, 1.710166, -0.06598417, 1, 1, 1, 1, 1,
-0.2503386, 0.2141945, -1.158016, 1, 1, 1, 1, 1,
-0.2489692, 1.02779, 0.07071359, 1, 1, 1, 1, 1,
-0.247297, 0.03066568, -0.5851386, 1, 1, 1, 1, 1,
-0.2440508, 0.9903594, -0.7489997, 1, 1, 1, 1, 1,
-0.2417551, -1.680033, -2.665774, 1, 1, 1, 1, 1,
-0.2374277, 0.03463417, -0.6049351, 1, 1, 1, 1, 1,
-0.2373039, -0.5345078, -2.346, 1, 1, 1, 1, 1,
-0.2359046, 1.080301, -0.09902513, 1, 1, 1, 1, 1,
-0.2256263, 0.1055776, -2.037591, 1, 1, 1, 1, 1,
-0.2248731, 1.612095, -2.810479, 1, 1, 1, 1, 1,
-0.2201376, -0.4651822, -2.109692, 1, 1, 1, 1, 1,
-0.2178891, 0.3095759, -0.09262887, 1, 1, 1, 1, 1,
-0.1990896, 0.5007755, -0.3352164, 1, 1, 1, 1, 1,
-0.1982009, -0.2397182, -2.292797, 0, 0, 1, 1, 1,
-0.1977723, 0.5117677, 2.661266, 1, 0, 0, 1, 1,
-0.1962562, 0.2017216, -1.602104, 1, 0, 0, 1, 1,
-0.1915676, -2.809178, -3.594983, 1, 0, 0, 1, 1,
-0.1752766, -0.1604978, -0.1888268, 1, 0, 0, 1, 1,
-0.1736783, -1.616814, -3.114875, 1, 0, 0, 1, 1,
-0.170992, -0.5277628, -1.306464, 0, 0, 0, 1, 1,
-0.1708275, -3.343205, -3.427667, 0, 0, 0, 1, 1,
-0.1613545, 0.3206703, -0.5777109, 0, 0, 0, 1, 1,
-0.1612738, -1.256972, -2.911008, 0, 0, 0, 1, 1,
-0.1608917, -1.249527, -1.801156, 0, 0, 0, 1, 1,
-0.1607792, 0.03067066, -1.48366, 0, 0, 0, 1, 1,
-0.1603802, -0.7898417, -2.218866, 0, 0, 0, 1, 1,
-0.1592553, 0.3468893, -0.1694761, 1, 1, 1, 1, 1,
-0.1537072, 0.152196, -1.624434, 1, 1, 1, 1, 1,
-0.1525506, 0.3123907, 1.525372, 1, 1, 1, 1, 1,
-0.1523183, 1.467968, -0.3615105, 1, 1, 1, 1, 1,
-0.1512061, 0.1431063, 0.1802505, 1, 1, 1, 1, 1,
-0.1481695, -0.306558, -2.871265, 1, 1, 1, 1, 1,
-0.1409242, -0.5424785, -1.710642, 1, 1, 1, 1, 1,
-0.1386583, 1.603451, 1.048784, 1, 1, 1, 1, 1,
-0.1375275, 1.428794, 0.5906666, 1, 1, 1, 1, 1,
-0.1337114, -0.5978062, -5.166454, 1, 1, 1, 1, 1,
-0.1258852, 0.5232736, 0.6243496, 1, 1, 1, 1, 1,
-0.1257952, 0.8218278, -1.647244, 1, 1, 1, 1, 1,
-0.1233175, 0.4040931, -1.119484, 1, 1, 1, 1, 1,
-0.1222895, -2.1123, -3.429001, 1, 1, 1, 1, 1,
-0.121772, -1.935116, -4.534608, 1, 1, 1, 1, 1,
-0.1181119, -0.7963718, -2.791161, 0, 0, 1, 1, 1,
-0.1166496, -1.938004, -3.036648, 1, 0, 0, 1, 1,
-0.1151957, -0.4954266, -3.858323, 1, 0, 0, 1, 1,
-0.1148479, -1.431741, -2.266004, 1, 0, 0, 1, 1,
-0.1103612, -0.5303905, -0.2454335, 1, 0, 0, 1, 1,
-0.1087738, 0.7529649, 1.668125, 1, 0, 0, 1, 1,
-0.108256, 0.6228683, 0.7360324, 0, 0, 0, 1, 1,
-0.1064523, -1.087596, -3.414445, 0, 0, 0, 1, 1,
-0.1018455, 1.639541, -1.39819, 0, 0, 0, 1, 1,
-0.1017206, -0.9311723, -2.177837, 0, 0, 0, 1, 1,
-0.1013824, -0.1902424, -1.588456, 0, 0, 0, 1, 1,
-0.094537, 0.4270557, 0.1701917, 0, 0, 0, 1, 1,
-0.09450048, -1.757263, -4.257113, 0, 0, 0, 1, 1,
-0.09210076, 0.7770627, 0.03920292, 1, 1, 1, 1, 1,
-0.08806363, 0.7951806, -1.340185, 1, 1, 1, 1, 1,
-0.08632693, 0.370411, -0.8410392, 1, 1, 1, 1, 1,
-0.0862174, -2.337029, -3.260433, 1, 1, 1, 1, 1,
-0.08509549, -0.8536127, -3.265409, 1, 1, 1, 1, 1,
-0.08015393, -0.1362307, -3.183599, 1, 1, 1, 1, 1,
-0.07877339, -2.254337, -4.595146, 1, 1, 1, 1, 1,
-0.07510106, 1.741162, -0.01988304, 1, 1, 1, 1, 1,
-0.0746009, 1.081489, -0.4564405, 1, 1, 1, 1, 1,
-0.07360002, 2.277102, -1.304748, 1, 1, 1, 1, 1,
-0.06907251, -0.9461883, -2.532719, 1, 1, 1, 1, 1,
-0.06676045, -0.9705015, -1.510356, 1, 1, 1, 1, 1,
-0.0661397, 2.652966, 0.4940374, 1, 1, 1, 1, 1,
-0.06613778, 0.7049569, -0.409703, 1, 1, 1, 1, 1,
-0.05896986, 0.3938508, -0.4696026, 1, 1, 1, 1, 1,
-0.05837065, -3.312362, -2.837541, 0, 0, 1, 1, 1,
-0.05790783, -1.143547, -3.460481, 1, 0, 0, 1, 1,
-0.05659947, 0.5053826, 0.6154285, 1, 0, 0, 1, 1,
-0.05519998, 0.09185558, -1.340492, 1, 0, 0, 1, 1,
-0.0479609, 1.309102, -0.1761515, 1, 0, 0, 1, 1,
-0.04393686, 1.013776, -1.607457, 1, 0, 0, 1, 1,
-0.04300803, -0.4366724, -1.264387, 0, 0, 0, 1, 1,
-0.03896297, -0.8276063, -2.728722, 0, 0, 0, 1, 1,
-0.0343225, -1.375723, -2.680785, 0, 0, 0, 1, 1,
-0.03237925, 1.085836, 0.5785045, 0, 0, 0, 1, 1,
-0.03101699, -1.474852, -4.697728, 0, 0, 0, 1, 1,
-0.0304068, 0.7021613, -0.6906784, 0, 0, 0, 1, 1,
-0.02978336, -1.22152, -2.582841, 0, 0, 0, 1, 1,
-0.02527985, 0.3312546, 2.564255, 1, 1, 1, 1, 1,
-0.02481261, 0.3045026, -0.290004, 1, 1, 1, 1, 1,
-0.02480087, -2.123843, -4.196081, 1, 1, 1, 1, 1,
-0.02315011, 2.518003, 0.2185224, 1, 1, 1, 1, 1,
-0.02249813, -1.267521, -2.891358, 1, 1, 1, 1, 1,
-0.01858453, -0.6411358, -4.091325, 1, 1, 1, 1, 1,
-0.01815295, 1.078483, -0.5826002, 1, 1, 1, 1, 1,
-0.01212763, -0.8624117, -3.690706, 1, 1, 1, 1, 1,
-0.011635, 0.2438283, 0.7950949, 1, 1, 1, 1, 1,
-0.01063378, 1.749647, -1.625885, 1, 1, 1, 1, 1,
-0.01043858, -0.05609111, -3.779432, 1, 1, 1, 1, 1,
-0.008596505, -0.5328221, -3.579878, 1, 1, 1, 1, 1,
-0.006509513, 0.09816124, -0.266201, 1, 1, 1, 1, 1,
-0.00316951, -0.1847137, -3.229062, 1, 1, 1, 1, 1,
-0.002265088, 1.084349, -0.4701153, 1, 1, 1, 1, 1,
0.001278526, -1.153065, 2.142237, 0, 0, 1, 1, 1,
0.002740574, 0.1561278, 0.3582656, 1, 0, 0, 1, 1,
0.005554506, 0.9994975, 1.198881, 1, 0, 0, 1, 1,
0.007952381, 0.03663338, -0.9725059, 1, 0, 0, 1, 1,
0.008121514, -2.126153, 2.890431, 1, 0, 0, 1, 1,
0.009733177, 1.537029, 1.156445, 1, 0, 0, 1, 1,
0.01195694, 0.7209723, -0.4600845, 0, 0, 0, 1, 1,
0.01970323, -1.242039, 2.365746, 0, 0, 0, 1, 1,
0.02016306, 1.934264, 0.6729486, 0, 0, 0, 1, 1,
0.02257472, -0.09623918, 2.54213, 0, 0, 0, 1, 1,
0.02309402, 0.8623493, 2.112327, 0, 0, 0, 1, 1,
0.0260606, -1.230096, 2.998786, 0, 0, 0, 1, 1,
0.02621737, 1.229375, -0.21291, 0, 0, 0, 1, 1,
0.02864485, 1.114355, 0.3219389, 1, 1, 1, 1, 1,
0.03171792, -0.9714323, 3.348678, 1, 1, 1, 1, 1,
0.03403674, 0.2485765, 0.6605386, 1, 1, 1, 1, 1,
0.03759647, -0.6175879, 6.037446, 1, 1, 1, 1, 1,
0.03959594, 0.7244231, -1.549359, 1, 1, 1, 1, 1,
0.04090041, 0.4270218, 1.012066, 1, 1, 1, 1, 1,
0.04492782, -1.552155, 1.325769, 1, 1, 1, 1, 1,
0.05147318, 0.5662449, 0.5843287, 1, 1, 1, 1, 1,
0.05377996, -1.265901, 3.785269, 1, 1, 1, 1, 1,
0.056357, -1.252295, 2.621627, 1, 1, 1, 1, 1,
0.05854593, 0.8036395, -0.3963503, 1, 1, 1, 1, 1,
0.06894466, -0.8733429, 2.857219, 1, 1, 1, 1, 1,
0.06942217, 0.03323474, -0.676203, 1, 1, 1, 1, 1,
0.06971826, -1.656612, 2.11499, 1, 1, 1, 1, 1,
0.07123882, -0.856139, 4.283603, 1, 1, 1, 1, 1,
0.07167708, -1.032691, 3.132623, 0, 0, 1, 1, 1,
0.07172702, -0.2527107, 2.38398, 1, 0, 0, 1, 1,
0.07395243, -1.205162, 3.106601, 1, 0, 0, 1, 1,
0.07780047, -1.770769, 2.091692, 1, 0, 0, 1, 1,
0.08345401, -1.002235, 2.567005, 1, 0, 0, 1, 1,
0.08577018, -0.6780289, 1.645779, 1, 0, 0, 1, 1,
0.08708328, -0.902731, 2.392055, 0, 0, 0, 1, 1,
0.08880995, -0.6379731, 2.898159, 0, 0, 0, 1, 1,
0.09144017, -0.6937982, 1.679634, 0, 0, 0, 1, 1,
0.0915576, -0.126098, 4.484637, 0, 0, 0, 1, 1,
0.09501165, -0.637392, 3.458963, 0, 0, 0, 1, 1,
0.09685818, -0.4648868, 1.704459, 0, 0, 0, 1, 1,
0.0979439, -1.97546, 2.649139, 0, 0, 0, 1, 1,
0.1011159, 0.9299086, -1.173399, 1, 1, 1, 1, 1,
0.1016429, 0.3233599, -0.6861201, 1, 1, 1, 1, 1,
0.1022019, 1.386363, -1.383993, 1, 1, 1, 1, 1,
0.103266, -1.37496, 4.489798, 1, 1, 1, 1, 1,
0.1033517, 0.9019601, 0.4378649, 1, 1, 1, 1, 1,
0.1047486, -1.596168, 5.528423, 1, 1, 1, 1, 1,
0.1083618, -0.5014539, 2.416852, 1, 1, 1, 1, 1,
0.109129, -1.090158, 4.293131, 1, 1, 1, 1, 1,
0.116685, 0.9307862, -0.580915, 1, 1, 1, 1, 1,
0.1167555, -1.862066, 1.372238, 1, 1, 1, 1, 1,
0.1192515, -1.271741, 2.707697, 1, 1, 1, 1, 1,
0.1241438, -0.2317752, 1.93274, 1, 1, 1, 1, 1,
0.1277687, 0.2494074, 0.3261833, 1, 1, 1, 1, 1,
0.1281125, -0.9285515, 1.568636, 1, 1, 1, 1, 1,
0.1282872, -1.672902, 2.782961, 1, 1, 1, 1, 1,
0.1325098, -1.916611, 1.01116, 0, 0, 1, 1, 1,
0.1331135, -1.887773, 3.159364, 1, 0, 0, 1, 1,
0.1350706, 0.6372491, 0.8640446, 1, 0, 0, 1, 1,
0.1374848, 0.1927461, 0.6574722, 1, 0, 0, 1, 1,
0.1388629, 0.2574963, -1.008246, 1, 0, 0, 1, 1,
0.1391734, -0.7883601, 3.281581, 1, 0, 0, 1, 1,
0.1420166, -1.628398, 2.83892, 0, 0, 0, 1, 1,
0.144737, -0.3317141, 2.532642, 0, 0, 0, 1, 1,
0.1451183, -1.262697, 4.103908, 0, 0, 0, 1, 1,
0.1480223, -2.831528, 3.773724, 0, 0, 0, 1, 1,
0.1491318, -0.3228366, 3.677329, 0, 0, 0, 1, 1,
0.1541961, -0.308168, 0.6433098, 0, 0, 0, 1, 1,
0.1548088, 0.832943, -0.0454676, 0, 0, 0, 1, 1,
0.1571129, -0.2065262, 5.08208, 1, 1, 1, 1, 1,
0.1626015, -1.71628, 3.910492, 1, 1, 1, 1, 1,
0.1649699, 1.419465, -0.002516266, 1, 1, 1, 1, 1,
0.1652629, -1.106811, 3.980895, 1, 1, 1, 1, 1,
0.1658164, -0.04325622, 1.693048, 1, 1, 1, 1, 1,
0.1666265, 0.5464631, -0.7471477, 1, 1, 1, 1, 1,
0.1693056, 0.1773666, -0.7845795, 1, 1, 1, 1, 1,
0.1698378, 0.9574035, -0.4061145, 1, 1, 1, 1, 1,
0.1739878, 1.252657, -0.640819, 1, 1, 1, 1, 1,
0.1765154, 0.1580059, 1.855413, 1, 1, 1, 1, 1,
0.1766313, -1.683491, 4.128832, 1, 1, 1, 1, 1,
0.1795014, -0.7156302, 5.672351, 1, 1, 1, 1, 1,
0.1814141, -1.228478, 2.607332, 1, 1, 1, 1, 1,
0.1841613, 0.5601001, 0.229517, 1, 1, 1, 1, 1,
0.1884493, 2.060616, -1.009643, 1, 1, 1, 1, 1,
0.1887529, 1.06574, 0.3904741, 0, 0, 1, 1, 1,
0.1916334, 0.3465922, 0.7756667, 1, 0, 0, 1, 1,
0.1947097, -1.283538, 3.494351, 1, 0, 0, 1, 1,
0.1986978, -0.03272252, 0.9573182, 1, 0, 0, 1, 1,
0.1995129, 0.4371963, -0.6640676, 1, 0, 0, 1, 1,
0.2004016, 2.616685, -1.231556, 1, 0, 0, 1, 1,
0.2046975, -1.670139, 2.677838, 0, 0, 0, 1, 1,
0.2066204, -0.7078542, 2.479047, 0, 0, 0, 1, 1,
0.2070952, 0.653403, 0.08960982, 0, 0, 0, 1, 1,
0.215278, 0.1427651, 2.123849, 0, 0, 0, 1, 1,
0.2186081, -0.4365086, 2.518457, 0, 0, 0, 1, 1,
0.2186482, 0.103832, 1.183288, 0, 0, 0, 1, 1,
0.2190927, -1.484124, 3.617803, 0, 0, 0, 1, 1,
0.2204699, 1.007861, 1.242245, 1, 1, 1, 1, 1,
0.2222688, -1.351823, 1.669043, 1, 1, 1, 1, 1,
0.224999, -1.076896, 1.777051, 1, 1, 1, 1, 1,
0.2266536, 1.946057, -0.1422926, 1, 1, 1, 1, 1,
0.2309272, -0.8202468, 3.979522, 1, 1, 1, 1, 1,
0.2309521, 0.3346062, 0.8772222, 1, 1, 1, 1, 1,
0.2318009, -0.7044254, 3.20354, 1, 1, 1, 1, 1,
0.2390095, -1.105676, 3.151454, 1, 1, 1, 1, 1,
0.2418327, -0.2063065, 1.971082, 1, 1, 1, 1, 1,
0.2489723, 0.3312977, 1.437154, 1, 1, 1, 1, 1,
0.2496394, 0.5212535, -1.025974, 1, 1, 1, 1, 1,
0.2506084, -1.342361, 3.500848, 1, 1, 1, 1, 1,
0.2524576, 0.195741, 0.6542444, 1, 1, 1, 1, 1,
0.2676164, -1.733932, 1.754979, 1, 1, 1, 1, 1,
0.2709, 1.100813, -0.02806151, 1, 1, 1, 1, 1,
0.2785964, 0.09584349, 0.8768468, 0, 0, 1, 1, 1,
0.2814914, 2.991037, 0.4315161, 1, 0, 0, 1, 1,
0.2817261, 1.075089, 0.227387, 1, 0, 0, 1, 1,
0.2844395, 0.02750377, 1.379718, 1, 0, 0, 1, 1,
0.2920427, -0.6416236, 2.58165, 1, 0, 0, 1, 1,
0.2927252, -0.9914464, 2.735355, 1, 0, 0, 1, 1,
0.2942627, -0.6183071, 2.952622, 0, 0, 0, 1, 1,
0.2975632, 1.129113, 0.2365952, 0, 0, 0, 1, 1,
0.2981287, 1.953609, -0.8645028, 0, 0, 0, 1, 1,
0.2982273, 0.2020253, 0.0155489, 0, 0, 0, 1, 1,
0.298458, 0.1373821, 1.485506, 0, 0, 0, 1, 1,
0.299027, -0.8024152, 1.16772, 0, 0, 0, 1, 1,
0.3020994, -0.5889078, 1.770795, 0, 0, 0, 1, 1,
0.302416, -1.013409, 2.411062, 1, 1, 1, 1, 1,
0.3026586, -0.746191, 2.252716, 1, 1, 1, 1, 1,
0.3050306, 0.1716935, -0.6379732, 1, 1, 1, 1, 1,
0.3057351, -0.3045719, 1.905794, 1, 1, 1, 1, 1,
0.3165604, 0.02624681, 1.295535, 1, 1, 1, 1, 1,
0.3180007, 1.68623, 0.2915808, 1, 1, 1, 1, 1,
0.3201682, -1.331427, 3.836105, 1, 1, 1, 1, 1,
0.3209346, -0.7046533, 5.419932, 1, 1, 1, 1, 1,
0.3285122, 0.4962293, 1.334171, 1, 1, 1, 1, 1,
0.3295368, 0.3090002, -0.4730495, 1, 1, 1, 1, 1,
0.3321774, -0.5067176, 2.385619, 1, 1, 1, 1, 1,
0.3323213, -1.111644, 1.80844, 1, 1, 1, 1, 1,
0.332893, 0.9924415, 2.405605, 1, 1, 1, 1, 1,
0.3331122, -0.02290655, 2.32845, 1, 1, 1, 1, 1,
0.3337476, 0.531952, 0.9325192, 1, 1, 1, 1, 1,
0.334473, -0.1577141, 0.8126829, 0, 0, 1, 1, 1,
0.335628, -1.699779, 4.130073, 1, 0, 0, 1, 1,
0.3385256, -1.368406, 4.666923, 1, 0, 0, 1, 1,
0.3388132, -2.973637, 2.445302, 1, 0, 0, 1, 1,
0.3410231, -0.2216821, 2.329145, 1, 0, 0, 1, 1,
0.342581, -1.913795, 2.654494, 1, 0, 0, 1, 1,
0.3426259, 1.25314, -1.609959, 0, 0, 0, 1, 1,
0.344287, 0.5278667, 2.261639, 0, 0, 0, 1, 1,
0.3443972, -0.3470355, 2.652667, 0, 0, 0, 1, 1,
0.3446269, 1.148681, -0.3752263, 0, 0, 0, 1, 1,
0.3453637, -1.911078, 2.196873, 0, 0, 0, 1, 1,
0.3453795, 0.7192792, 0.04294192, 0, 0, 0, 1, 1,
0.3459536, -0.3308983, 2.298011, 0, 0, 0, 1, 1,
0.3495745, -1.241496, 2.106793, 1, 1, 1, 1, 1,
0.3558337, 0.9492775, 1.503737, 1, 1, 1, 1, 1,
0.3563546, 0.2813166, -0.3012301, 1, 1, 1, 1, 1,
0.3586566, 0.06047459, 1.37675, 1, 1, 1, 1, 1,
0.3600776, 0.1148968, 2.102238, 1, 1, 1, 1, 1,
0.3661782, -0.8660333, 2.311845, 1, 1, 1, 1, 1,
0.3695951, 1.173565, -0.2041576, 1, 1, 1, 1, 1,
0.3705641, 0.1232742, 0.5948292, 1, 1, 1, 1, 1,
0.3727573, 1.599424, -0.1491772, 1, 1, 1, 1, 1,
0.3730065, 1.577623, -0.6266307, 1, 1, 1, 1, 1,
0.3736671, -0.8835173, 2.967999, 1, 1, 1, 1, 1,
0.3746177, -1.052077, 3.216323, 1, 1, 1, 1, 1,
0.3800707, -0.06404734, 2.956164, 1, 1, 1, 1, 1,
0.380745, 0.1324577, 1.108211, 1, 1, 1, 1, 1,
0.3849202, -0.2961062, 1.239218, 1, 1, 1, 1, 1,
0.3885555, -0.5559905, 2.41459, 0, 0, 1, 1, 1,
0.3987376, -0.02391288, 0.09083609, 1, 0, 0, 1, 1,
0.3990102, -0.9988928, 3.002918, 1, 0, 0, 1, 1,
0.399477, -0.202343, 1.160383, 1, 0, 0, 1, 1,
0.3999017, -0.2607658, 2.107035, 1, 0, 0, 1, 1,
0.4040891, 0.1895973, 1.443793, 1, 0, 0, 1, 1,
0.4063435, -0.9975669, 2.151557, 0, 0, 0, 1, 1,
0.4076808, 1.572561, 0.2797121, 0, 0, 0, 1, 1,
0.4079868, -1.803816, 3.775068, 0, 0, 0, 1, 1,
0.4091034, 0.009345381, 2.086751, 0, 0, 0, 1, 1,
0.4111491, -1.724948, 2.447202, 0, 0, 0, 1, 1,
0.4122092, -0.9249937, 3.707285, 0, 0, 0, 1, 1,
0.4129713, 2.210119, -0.4176796, 0, 0, 0, 1, 1,
0.4165229, -0.4109746, 2.74666, 1, 1, 1, 1, 1,
0.4207399, -0.7028958, 3.189544, 1, 1, 1, 1, 1,
0.421666, 0.2302451, 2.11908, 1, 1, 1, 1, 1,
0.423077, -1.204835, 5.180671, 1, 1, 1, 1, 1,
0.4306996, -0.363503, 4.378133, 1, 1, 1, 1, 1,
0.4323543, -0.7757652, 1.348734, 1, 1, 1, 1, 1,
0.4353075, 0.3467292, 1.22594, 1, 1, 1, 1, 1,
0.4360992, 0.5944961, 1.460104, 1, 1, 1, 1, 1,
0.4400066, 0.5951025, 0.8077664, 1, 1, 1, 1, 1,
0.4413474, 1.274856, 1.417249, 1, 1, 1, 1, 1,
0.4417981, -1.719311, 3.602193, 1, 1, 1, 1, 1,
0.4455719, -0.5952563, 2.646879, 1, 1, 1, 1, 1,
0.4502237, 0.9831284, 0.2415864, 1, 1, 1, 1, 1,
0.4534543, 0.4440049, 0.4203612, 1, 1, 1, 1, 1,
0.4560326, -0.9767498, 3.255184, 1, 1, 1, 1, 1,
0.4593111, 1.244846, 0.1188291, 0, 0, 1, 1, 1,
0.4598415, 0.9401153, 0.8409981, 1, 0, 0, 1, 1,
0.4616992, 0.6741135, -0.1313261, 1, 0, 0, 1, 1,
0.468577, 0.5087999, 0.608695, 1, 0, 0, 1, 1,
0.4690992, 1.567483, -0.2309106, 1, 0, 0, 1, 1,
0.4741967, -0.1638879, 1.504141, 1, 0, 0, 1, 1,
0.4766068, 0.1248295, -0.2237943, 0, 0, 0, 1, 1,
0.476655, 0.1593184, 1.830638, 0, 0, 0, 1, 1,
0.4779394, 0.6167633, -1.267933, 0, 0, 0, 1, 1,
0.4791062, 1.118023, 1.225365, 0, 0, 0, 1, 1,
0.4800124, -0.5268245, 2.999052, 0, 0, 0, 1, 1,
0.4805486, -0.1027302, 2.285224, 0, 0, 0, 1, 1,
0.48207, 0.426519, -0.3531294, 0, 0, 0, 1, 1,
0.4908426, 0.05700127, 1.315042, 1, 1, 1, 1, 1,
0.4934362, -0.363916, 2.298579, 1, 1, 1, 1, 1,
0.4934832, 0.08350522, -0.7197029, 1, 1, 1, 1, 1,
0.4941948, 0.7912035, -0.0232084, 1, 1, 1, 1, 1,
0.4961946, 0.5313109, 1.841804, 1, 1, 1, 1, 1,
0.4965838, -1.145599, 2.051167, 1, 1, 1, 1, 1,
0.4971, -0.8314362, 1.153376, 1, 1, 1, 1, 1,
0.4973394, 2.100181, 0.504159, 1, 1, 1, 1, 1,
0.497488, -1.381793, 2.867256, 1, 1, 1, 1, 1,
0.499367, 0.0179616, 0.657759, 1, 1, 1, 1, 1,
0.4995518, 2.225753, 0.5114267, 1, 1, 1, 1, 1,
0.5008427, -1.169712, 3.756762, 1, 1, 1, 1, 1,
0.5048953, 0.2155184, 1.519987, 1, 1, 1, 1, 1,
0.509106, 0.2425149, 1.649568, 1, 1, 1, 1, 1,
0.5099732, -0.8569021, 4.327384, 1, 1, 1, 1, 1,
0.510172, 0.7528788, 0.4907419, 0, 0, 1, 1, 1,
0.5110427, 0.2772556, 0.4613627, 1, 0, 0, 1, 1,
0.5111636, -0.5387541, 2.026895, 1, 0, 0, 1, 1,
0.5124072, 0.4979573, 0.5348293, 1, 0, 0, 1, 1,
0.5164314, 1.065909, 1.752271, 1, 0, 0, 1, 1,
0.5167385, -2.496226, 1.807873, 1, 0, 0, 1, 1,
0.522169, -2.675156, 3.80952, 0, 0, 0, 1, 1,
0.5243084, 0.6988913, 1.222011, 0, 0, 0, 1, 1,
0.5269426, -0.6224245, 2.087991, 0, 0, 0, 1, 1,
0.5278103, -0.7729528, 3.112116, 0, 0, 0, 1, 1,
0.5292671, 1.285755, -1.054553, 0, 0, 0, 1, 1,
0.5439984, 0.910787, 0.8777087, 0, 0, 0, 1, 1,
0.5448374, -0.04355451, 1.271627, 0, 0, 0, 1, 1,
0.5459644, 0.73653, 1.409035, 1, 1, 1, 1, 1,
0.5461251, -1.004048, 1.548302, 1, 1, 1, 1, 1,
0.5486919, 0.5492236, -0.04717932, 1, 1, 1, 1, 1,
0.5488548, -1.780463, 1.533723, 1, 1, 1, 1, 1,
0.5492886, 0.3027018, 1.56894, 1, 1, 1, 1, 1,
0.5552751, 0.5295826, 0.9098284, 1, 1, 1, 1, 1,
0.5553678, 0.1668017, 1.222959, 1, 1, 1, 1, 1,
0.5600927, -1.72487, 4.369733, 1, 1, 1, 1, 1,
0.5628073, 0.6820489, 1.429861, 1, 1, 1, 1, 1,
0.5632616, -0.2077215, -0.3740724, 1, 1, 1, 1, 1,
0.5652584, 1.860014, 2.308772, 1, 1, 1, 1, 1,
0.566269, 1.832913, -1.088845, 1, 1, 1, 1, 1,
0.5666063, 1.151948, 0.6303452, 1, 1, 1, 1, 1,
0.5666112, 0.145818, 3.289856, 1, 1, 1, 1, 1,
0.5712574, 1.179825, -0.8938762, 1, 1, 1, 1, 1,
0.571882, -0.01349708, 0.9808767, 0, 0, 1, 1, 1,
0.5748205, 0.00218707, 2.362923, 1, 0, 0, 1, 1,
0.57561, 0.05436115, 1.764851, 1, 0, 0, 1, 1,
0.57641, -0.363518, 0.1229791, 1, 0, 0, 1, 1,
0.576785, 0.1821782, 2.951004, 1, 0, 0, 1, 1,
0.5786274, -1.332014, 2.605431, 1, 0, 0, 1, 1,
0.5790309, 0.1939625, 1.375431, 0, 0, 0, 1, 1,
0.5923994, 1.902133, 1.756155, 0, 0, 0, 1, 1,
0.5945032, -0.0237659, 1.02507, 0, 0, 0, 1, 1,
0.5953737, -1.217876, 2.043572, 0, 0, 0, 1, 1,
0.5954658, -1.289701, 2.550951, 0, 0, 0, 1, 1,
0.5962909, -2.139657, 3.861685, 0, 0, 0, 1, 1,
0.5966467, -0.09296788, 2.586517, 0, 0, 0, 1, 1,
0.5970856, -0.141477, 3.023612, 1, 1, 1, 1, 1,
0.5978522, 0.5200283, 0.741271, 1, 1, 1, 1, 1,
0.5979722, 0.8640211, 1.485318, 1, 1, 1, 1, 1,
0.6028207, 1.71851, 0.576462, 1, 1, 1, 1, 1,
0.6074535, 0.2395689, 2.237727, 1, 1, 1, 1, 1,
0.6232525, -0.6468957, 2.179849, 1, 1, 1, 1, 1,
0.6237296, 0.6996484, 0.9346484, 1, 1, 1, 1, 1,
0.6259827, -1.265443, 2.863819, 1, 1, 1, 1, 1,
0.6287612, 0.4403989, 0.3280882, 1, 1, 1, 1, 1,
0.6304625, 0.6781244, 0.216832, 1, 1, 1, 1, 1,
0.6343769, -0.2017992, 1.66141, 1, 1, 1, 1, 1,
0.6348072, -0.7851648, 2.563378, 1, 1, 1, 1, 1,
0.6371593, 1.435914, 1.968835, 1, 1, 1, 1, 1,
0.6474103, -0.84618, 2.094327, 1, 1, 1, 1, 1,
0.6477467, 0.1865215, -0.1782746, 1, 1, 1, 1, 1,
0.6482969, 1.892247, 0.756932, 0, 0, 1, 1, 1,
0.6500583, 0.3061239, 1.150358, 1, 0, 0, 1, 1,
0.651386, -0.03933505, 1.959527, 1, 0, 0, 1, 1,
0.6527612, -0.7304832, 1.738598, 1, 0, 0, 1, 1,
0.6576763, 0.1769042, -0.205396, 1, 0, 0, 1, 1,
0.66382, -0.9891365, 1.425858, 1, 0, 0, 1, 1,
0.6663908, 3.145677, -0.2591339, 0, 0, 0, 1, 1,
0.6681466, 0.8779607, 1.125694, 0, 0, 0, 1, 1,
0.6684002, 0.2466714, 0.726194, 0, 0, 0, 1, 1,
0.6699112, -0.9182408, 2.156266, 0, 0, 0, 1, 1,
0.6719564, 1.089366, 2.594543, 0, 0, 0, 1, 1,
0.6741211, 1.58751, 0.8896373, 0, 0, 0, 1, 1,
0.6766281, 0.6556287, 0.4514831, 0, 0, 0, 1, 1,
0.6767101, -0.5526983, 3.050719, 1, 1, 1, 1, 1,
0.6794453, 0.780004, 1.13179, 1, 1, 1, 1, 1,
0.6873373, -0.3058464, 1.370544, 1, 1, 1, 1, 1,
0.6918182, -0.5149171, 2.716368, 1, 1, 1, 1, 1,
0.6938719, -2.471414, 3.724489, 1, 1, 1, 1, 1,
0.6946983, 1.54567, 2.532603, 1, 1, 1, 1, 1,
0.6968397, -0.619232, 3.419679, 1, 1, 1, 1, 1,
0.7088442, -0.5321242, 3.730451, 1, 1, 1, 1, 1,
0.7159195, 2.199308, -0.5119164, 1, 1, 1, 1, 1,
0.7169412, 0.2393373, 2.950966, 1, 1, 1, 1, 1,
0.7179489, 0.104803, 1.148787, 1, 1, 1, 1, 1,
0.7238275, -0.9432094, 2.361433, 1, 1, 1, 1, 1,
0.72515, 0.2288198, 1.602296, 1, 1, 1, 1, 1,
0.7257853, -1.217463, 2.809366, 1, 1, 1, 1, 1,
0.7275073, 0.4478743, -0.2596729, 1, 1, 1, 1, 1,
0.7318322, 0.4197066, 0.7731524, 0, 0, 1, 1, 1,
0.7348491, 0.01270918, 2.226087, 1, 0, 0, 1, 1,
0.7358145, -0.3106832, 0.5920905, 1, 0, 0, 1, 1,
0.7372043, -0.005755474, 3.424537, 1, 0, 0, 1, 1,
0.7372074, -0.9919552, 1.434639, 1, 0, 0, 1, 1,
0.7393973, -0.2620628, 2.242859, 1, 0, 0, 1, 1,
0.7434597, 2.418754, -0.7333713, 0, 0, 0, 1, 1,
0.7499172, -1.147866, 0.4980388, 0, 0, 0, 1, 1,
0.7523387, -2.084285, 2.227633, 0, 0, 0, 1, 1,
0.753709, 1.284544, 1.422719, 0, 0, 0, 1, 1,
0.7570951, 0.0616241, 0.1468634, 0, 0, 0, 1, 1,
0.7572278, 1.064487, 0.4497502, 0, 0, 0, 1, 1,
0.7585385, 1.054124, 1.790483, 0, 0, 0, 1, 1,
0.7618715, -0.5652547, 3.85055, 1, 1, 1, 1, 1,
0.7620022, 0.8444803, 0.2353901, 1, 1, 1, 1, 1,
0.764604, 0.09917513, 0.7232863, 1, 1, 1, 1, 1,
0.7647914, -0.6169558, 2.764861, 1, 1, 1, 1, 1,
0.780021, 0.9501556, 1.691604, 1, 1, 1, 1, 1,
0.7837641, 0.03264911, 2.341938, 1, 1, 1, 1, 1,
0.7853281, 0.07602536, 2.905807, 1, 1, 1, 1, 1,
0.7885113, -0.3544886, 1.183396, 1, 1, 1, 1, 1,
0.7919227, 1.541311, -0.8894665, 1, 1, 1, 1, 1,
0.7928925, -0.6864245, 1.581045, 1, 1, 1, 1, 1,
0.7938692, 0.3155791, 0.8646622, 1, 1, 1, 1, 1,
0.7985632, 0.04817872, 0.182544, 1, 1, 1, 1, 1,
0.7986625, 0.3319311, 1.138224, 1, 1, 1, 1, 1,
0.7988897, -0.6411436, 2.440561, 1, 1, 1, 1, 1,
0.8011408, -0.6272505, -0.3010938, 1, 1, 1, 1, 1,
0.8011733, 0.007508394, -0.2018036, 0, 0, 1, 1, 1,
0.804662, -0.7673746, 1.98294, 1, 0, 0, 1, 1,
0.8066522, -1.469483, 2.589534, 1, 0, 0, 1, 1,
0.80765, 1.754128, -0.9898269, 1, 0, 0, 1, 1,
0.820412, -1.376808, 0.1382685, 1, 0, 0, 1, 1,
0.8257034, -0.3892803, 2.96393, 1, 0, 0, 1, 1,
0.8263983, -0.3440403, 2.981185, 0, 0, 0, 1, 1,
0.834847, -1.246881, 2.780828, 0, 0, 0, 1, 1,
0.8361683, -0.3621657, 0.8301675, 0, 0, 0, 1, 1,
0.8366454, 0.09633709, 2.470654, 0, 0, 0, 1, 1,
0.842638, 0.243949, 1.260664, 0, 0, 0, 1, 1,
0.8508556, 0.2486789, -1.211421, 0, 0, 0, 1, 1,
0.8594392, -0.4736947, 2.053482, 0, 0, 0, 1, 1,
0.8617936, -1.127054, 3.310422, 1, 1, 1, 1, 1,
0.8768138, -0.9434276, 3.086685, 1, 1, 1, 1, 1,
0.877478, 0.3047175, 0.891754, 1, 1, 1, 1, 1,
0.8784125, -0.8143572, 0.6063504, 1, 1, 1, 1, 1,
0.8784916, 1.754954, 0.6183617, 1, 1, 1, 1, 1,
0.882171, -0.3186799, 4.036622, 1, 1, 1, 1, 1,
0.8907742, -0.4060759, 3.886672, 1, 1, 1, 1, 1,
0.8969945, -0.5782489, 1.914127, 1, 1, 1, 1, 1,
0.900739, -0.7009293, 2.400197, 1, 1, 1, 1, 1,
0.9083847, -0.5116113, 1.031748, 1, 1, 1, 1, 1,
0.9090867, -1.386574, 3.10107, 1, 1, 1, 1, 1,
0.9160155, -1.678319, 4.943853, 1, 1, 1, 1, 1,
0.9170423, 0.7138744, 1.354384, 1, 1, 1, 1, 1,
0.9202904, 0.1275092, 1.37671, 1, 1, 1, 1, 1,
0.9203476, -0.06246071, 2.461014, 1, 1, 1, 1, 1,
0.9212338, 0.2748907, 0.5437789, 0, 0, 1, 1, 1,
0.9248446, 0.8524466, 0.1079478, 1, 0, 0, 1, 1,
0.9257728, 0.6405736, -0.5269817, 1, 0, 0, 1, 1,
0.9295725, -1.115991, 2.405308, 1, 0, 0, 1, 1,
0.9408218, -0.8794272, 4.071121, 1, 0, 0, 1, 1,
0.9449683, 0.4583599, 0.8037391, 1, 0, 0, 1, 1,
0.9451413, 0.276767, 0.5726022, 0, 0, 0, 1, 1,
0.9506696, -1.200668, 1.107852, 0, 0, 0, 1, 1,
0.9515682, -1.096098, 3.251318, 0, 0, 0, 1, 1,
0.9555625, -0.1249139, 0.4923942, 0, 0, 0, 1, 1,
0.9614074, 0.7730424, 1.999911, 0, 0, 0, 1, 1,
0.962045, 1.606706, -0.1386984, 0, 0, 0, 1, 1,
0.9648221, -0.530587, 2.829929, 0, 0, 0, 1, 1,
0.9656056, -0.2914912, 3.310489, 1, 1, 1, 1, 1,
0.9667255, -0.3195471, 2.185125, 1, 1, 1, 1, 1,
0.9720707, 0.3672838, -0.6522833, 1, 1, 1, 1, 1,
0.9722292, 0.881396, 2.056626, 1, 1, 1, 1, 1,
0.9785845, -0.01505392, 1.654309, 1, 1, 1, 1, 1,
0.9802105, -1.140981, 3.067248, 1, 1, 1, 1, 1,
0.9828792, 0.5470939, 0.6766068, 1, 1, 1, 1, 1,
0.9890752, 0.6293752, -0.2926049, 1, 1, 1, 1, 1,
0.9979331, 0.9628987, -0.05625069, 1, 1, 1, 1, 1,
1.000759, 0.9187191, 1.50344, 1, 1, 1, 1, 1,
1.005261, -0.4462268, 2.928654, 1, 1, 1, 1, 1,
1.014198, -2.082905, 3.704864, 1, 1, 1, 1, 1,
1.016982, -1.354479, 2.329587, 1, 1, 1, 1, 1,
1.021356, 0.8640121, 0.8549812, 1, 1, 1, 1, 1,
1.043921, -0.2952152, 2.761885, 1, 1, 1, 1, 1,
1.044279, 1.656124, -0.2766672, 0, 0, 1, 1, 1,
1.054684, -0.1995535, 3.522036, 1, 0, 0, 1, 1,
1.058331, -0.3791325, 0.7276875, 1, 0, 0, 1, 1,
1.059671, 0.8348838, 1.922748, 1, 0, 0, 1, 1,
1.072106, 1.371818, 0.7422731, 1, 0, 0, 1, 1,
1.074084, -0.0654489, 1.600117, 1, 0, 0, 1, 1,
1.074292, 1.064901, 1.880214, 0, 0, 0, 1, 1,
1.077147, -0.2635026, 1.176926, 0, 0, 0, 1, 1,
1.083112, 1.974423, 0.3074619, 0, 0, 0, 1, 1,
1.08557, -0.3907944, 1.69012, 0, 0, 0, 1, 1,
1.088441, 0.06785122, 0.9952434, 0, 0, 0, 1, 1,
1.094355, -1.707223, 2.281813, 0, 0, 0, 1, 1,
1.097188, 0.7112027, 2.388902, 0, 0, 0, 1, 1,
1.11441, -0.4858741, 3.296235, 1, 1, 1, 1, 1,
1.120674, 0.9141614, 1.007243, 1, 1, 1, 1, 1,
1.121129, -0.8682287, 2.011487, 1, 1, 1, 1, 1,
1.124808, 2.1712, 1.001564, 1, 1, 1, 1, 1,
1.130784, -1.467612, 2.965558, 1, 1, 1, 1, 1,
1.137148, 0.4760443, 1.851948, 1, 1, 1, 1, 1,
1.140541, 0.0310831, 0.4156585, 1, 1, 1, 1, 1,
1.143285, -0.4527732, 2.984344, 1, 1, 1, 1, 1,
1.144296, 0.4868937, 0.4497153, 1, 1, 1, 1, 1,
1.145238, 1.122872, 1.538731, 1, 1, 1, 1, 1,
1.145243, 0.8768563, 0.3321336, 1, 1, 1, 1, 1,
1.147049, 1.173435, -0.7468472, 1, 1, 1, 1, 1,
1.147086, 0.6146547, 2.078054, 1, 1, 1, 1, 1,
1.149011, 1.253883, 1.558125, 1, 1, 1, 1, 1,
1.150786, -2.466014, 3.320629, 1, 1, 1, 1, 1,
1.151329, 0.5394593, 0.9075357, 0, 0, 1, 1, 1,
1.152315, -0.9954508, 3.077384, 1, 0, 0, 1, 1,
1.160023, -0.849297, 1.434097, 1, 0, 0, 1, 1,
1.165042, -0.00080115, 1.176251, 1, 0, 0, 1, 1,
1.167157, -0.7661198, 2.883668, 1, 0, 0, 1, 1,
1.172654, 0.5540028, 0.7782922, 1, 0, 0, 1, 1,
1.18013, -0.2734727, 2.71468, 0, 0, 0, 1, 1,
1.181954, -0.5953903, 1.98421, 0, 0, 0, 1, 1,
1.182995, -0.4341521, 3.645543, 0, 0, 0, 1, 1,
1.183522, 0.3439846, 1.526575, 0, 0, 0, 1, 1,
1.184388, 1.117055, -0.3296715, 0, 0, 0, 1, 1,
1.185484, -1.705778, 3.450416, 0, 0, 0, 1, 1,
1.189945, -1.57297, 0.9662224, 0, 0, 0, 1, 1,
1.193413, 0.5571722, 2.473423, 1, 1, 1, 1, 1,
1.196335, -1.68104, 2.087267, 1, 1, 1, 1, 1,
1.199962, -1.726413, 1.771781, 1, 1, 1, 1, 1,
1.206533, -1.549849, 2.125144, 1, 1, 1, 1, 1,
1.209534, 1.012052, -0.2723922, 1, 1, 1, 1, 1,
1.214953, -1.296619, 2.09675, 1, 1, 1, 1, 1,
1.221524, -2.207051, 2.872916, 1, 1, 1, 1, 1,
1.232826, 1.127598, 0.989931, 1, 1, 1, 1, 1,
1.245528, 0.706579, 0.9157032, 1, 1, 1, 1, 1,
1.246379, 0.5925677, 0.5363742, 1, 1, 1, 1, 1,
1.250137, -0.8232042, 2.163117, 1, 1, 1, 1, 1,
1.250594, -0.1848418, 0.2293763, 1, 1, 1, 1, 1,
1.25289, 0.3761334, 2.190216, 1, 1, 1, 1, 1,
1.256681, 0.6695556, 0.3628339, 1, 1, 1, 1, 1,
1.263213, 1.215298, 0.5459107, 1, 1, 1, 1, 1,
1.270134, -0.28513, 1.674924, 0, 0, 1, 1, 1,
1.280118, -0.6699567, 2.052884, 1, 0, 0, 1, 1,
1.281459, 1.197575, 0.786464, 1, 0, 0, 1, 1,
1.284897, -0.9430611, 2.117688, 1, 0, 0, 1, 1,
1.286222, 1.07768, 0.4492313, 1, 0, 0, 1, 1,
1.287418, 1.047078, -0.0579013, 1, 0, 0, 1, 1,
1.292577, -2.008048, 3.527643, 0, 0, 0, 1, 1,
1.304368, 0.6084872, 0.9153282, 0, 0, 0, 1, 1,
1.307768, -2.539573, 2.99684, 0, 0, 0, 1, 1,
1.317078, 0.3568709, 3.633591, 0, 0, 0, 1, 1,
1.319752, -0.9438323, 3.153868, 0, 0, 0, 1, 1,
1.328363, -0.2934649, 1.862908, 0, 0, 0, 1, 1,
1.339093, -1.036725, 1.961553, 0, 0, 0, 1, 1,
1.339109, 1.221271, 0.5550342, 1, 1, 1, 1, 1,
1.342052, 3.088689, -0.569297, 1, 1, 1, 1, 1,
1.342875, 0.03431081, 1.983812, 1, 1, 1, 1, 1,
1.363847, -0.6685321, 1.00455, 1, 1, 1, 1, 1,
1.364975, -1.162633, 2.314644, 1, 1, 1, 1, 1,
1.370209, -0.6088725, 1.419203, 1, 1, 1, 1, 1,
1.371291, 0.8798019, 0.03172869, 1, 1, 1, 1, 1,
1.372285, 1.198249, 2.395936, 1, 1, 1, 1, 1,
1.377, -0.1021954, 1.62054, 1, 1, 1, 1, 1,
1.37711, -0.07648019, 3.151226, 1, 1, 1, 1, 1,
1.384881, 0.7407261, -0.7185554, 1, 1, 1, 1, 1,
1.393458, 0.4771935, 0.06764366, 1, 1, 1, 1, 1,
1.393485, -0.6360923, 2.692941, 1, 1, 1, 1, 1,
1.394771, 0.2753125, 0.7914605, 1, 1, 1, 1, 1,
1.396802, 0.7537906, 0.5720748, 1, 1, 1, 1, 1,
1.400481, -0.08244122, 1.774686, 0, 0, 1, 1, 1,
1.40772, 1.501858, 0.8772224, 1, 0, 0, 1, 1,
1.412741, -2.624494, 3.910163, 1, 0, 0, 1, 1,
1.415349, -0.1205653, 3.527938, 1, 0, 0, 1, 1,
1.42655, 1.139187, 2.503073, 1, 0, 0, 1, 1,
1.451979, 2.991921, 0.9141835, 1, 0, 0, 1, 1,
1.465135, -0.9242477, 2.789503, 0, 0, 0, 1, 1,
1.481113, 0.9220074, -0.124626, 0, 0, 0, 1, 1,
1.487195, 1.004448, 2.227245, 0, 0, 0, 1, 1,
1.505668, 0.5054364, 1.271038, 0, 0, 0, 1, 1,
1.508108, -0.4388585, 3.247751, 0, 0, 0, 1, 1,
1.514904, -0.9087067, 3.566529, 0, 0, 0, 1, 1,
1.52062, 0.1063353, 1.720271, 0, 0, 0, 1, 1,
1.522012, -1.327981, 3.989935, 1, 1, 1, 1, 1,
1.537392, 0.7174007, 2.815917, 1, 1, 1, 1, 1,
1.545909, -0.6432639, 3.520586, 1, 1, 1, 1, 1,
1.546317, 1.10761, 0.5657887, 1, 1, 1, 1, 1,
1.546771, 0.6176491, 1.341474, 1, 1, 1, 1, 1,
1.55404, 0.768501, -0.4544412, 1, 1, 1, 1, 1,
1.592399, -0.177924, 2.889135, 1, 1, 1, 1, 1,
1.592588, 0.1668692, 1.719894, 1, 1, 1, 1, 1,
1.614974, 0.1471266, -0.7372112, 1, 1, 1, 1, 1,
1.63091, -1.247868, 2.452213, 1, 1, 1, 1, 1,
1.633515, -0.9113625, -0.2493926, 1, 1, 1, 1, 1,
1.637375, -0.2883685, 0.01839981, 1, 1, 1, 1, 1,
1.644428, -0.4161212, 0.7171327, 1, 1, 1, 1, 1,
1.65698, 0.9814438, 1.191836, 1, 1, 1, 1, 1,
1.688452, 0.8018933, 1.588992, 1, 1, 1, 1, 1,
1.691633, 0.3183898, 0.05763642, 0, 0, 1, 1, 1,
1.702008, 1.356822, 0.6586625, 1, 0, 0, 1, 1,
1.707672, -0.1463791, 1.347781, 1, 0, 0, 1, 1,
1.716032, 0.7931027, 1.473977, 1, 0, 0, 1, 1,
1.716645, -0.6896528, 1.897156, 1, 0, 0, 1, 1,
1.728256, 1.110697, 2.779737, 1, 0, 0, 1, 1,
1.734406, 0.2079612, 3.584443, 0, 0, 0, 1, 1,
1.7393, 0.9421865, 0.6545807, 0, 0, 0, 1, 1,
1.742645, -0.5867985, 1.004513, 0, 0, 0, 1, 1,
1.743901, 0.8797771, 1.319564, 0, 0, 0, 1, 1,
1.74466, 0.1925669, 1.369936, 0, 0, 0, 1, 1,
1.75125, 0.7130685, 0.7850076, 0, 0, 0, 1, 1,
1.763006, -0.0894307, 1.542682, 0, 0, 0, 1, 1,
1.770498, -1.922533, 3.864995, 1, 1, 1, 1, 1,
1.782544, 0.01586782, 2.635622, 1, 1, 1, 1, 1,
1.785202, -0.4920376, 1.82264, 1, 1, 1, 1, 1,
1.795206, -0.4939254, 2.526364, 1, 1, 1, 1, 1,
1.796017, 0.9036275, 0.9448404, 1, 1, 1, 1, 1,
1.828196, 0.4248455, 0.3948392, 1, 1, 1, 1, 1,
1.828565, 0.1827065, 0.4560803, 1, 1, 1, 1, 1,
1.833684, 0.06139277, 2.65344, 1, 1, 1, 1, 1,
1.836422, 0.04554078, -0.6012922, 1, 1, 1, 1, 1,
1.855372, 1.045545, 0.4271303, 1, 1, 1, 1, 1,
1.878885, -0.7201773, 2.133606, 1, 1, 1, 1, 1,
1.895867, -0.3496961, 2.053527, 1, 1, 1, 1, 1,
1.903287, -1.825051, 1.863042, 1, 1, 1, 1, 1,
1.933016, -1.414926, 0.5949492, 1, 1, 1, 1, 1,
1.96843, -0.6214128, 1.833919, 1, 1, 1, 1, 1,
1.976892, 1.042938, 1.737487, 0, 0, 1, 1, 1,
2.095419, 0.1423242, 2.657973, 1, 0, 0, 1, 1,
2.097432, 0.4752816, 2.8045, 1, 0, 0, 1, 1,
2.127136, 0.5680795, 0.3655766, 1, 0, 0, 1, 1,
2.145251, 0.3550899, 1.988002, 1, 0, 0, 1, 1,
2.155768, 0.8814505, 0.9731746, 1, 0, 0, 1, 1,
2.173231, -0.7911401, 0.9546331, 0, 0, 0, 1, 1,
2.173693, 1.009551, 1.99237, 0, 0, 0, 1, 1,
2.188894, -2.045103, 2.047225, 0, 0, 0, 1, 1,
2.203, 1.223725, 1.168694, 0, 0, 0, 1, 1,
2.244034, 1.362909, 2.457686, 0, 0, 0, 1, 1,
2.245768, 0.07178654, 2.930274, 0, 0, 0, 1, 1,
2.368539, -0.8962846, 3.322824, 0, 0, 0, 1, 1,
2.461837, 0.355295, 0.314346, 1, 1, 1, 1, 1,
2.468089, 1.425183, 1.390689, 1, 1, 1, 1, 1,
2.508065, 0.8195428, 1.209632, 1, 1, 1, 1, 1,
2.561604, 0.501283, 0.3254741, 1, 1, 1, 1, 1,
2.628335, 0.9660334, 0.7055073, 1, 1, 1, 1, 1,
2.654969, 1.074975, -0.336713, 1, 1, 1, 1, 1,
2.967186, 2.272307, 2.061803, 1, 1, 1, 1, 1
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
var radius = 9.706087;
var distance = 34.09222;
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
mvMatrix.translate( -0.05277407, 0.09780335, -0.4301777 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.09222);
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
