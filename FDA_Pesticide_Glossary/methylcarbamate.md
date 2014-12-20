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
-2.861732, 0.7334196, -1.516173, 1, 0, 0, 1,
-2.800187, 0.2855061, -1.436406, 1, 0.007843138, 0, 1,
-2.709602, -1.457509, -2.818177, 1, 0.01176471, 0, 1,
-2.513494, 0.5474712, -1.307021, 1, 0.01960784, 0, 1,
-2.510552, 0.3640611, -2.037002, 1, 0.02352941, 0, 1,
-2.445488, -0.5858779, -0.1351016, 1, 0.03137255, 0, 1,
-2.433191, 0.2610752, -0.3930731, 1, 0.03529412, 0, 1,
-2.319767, 1.193276, -1.236754, 1, 0.04313726, 0, 1,
-2.309487, -1.099782, -1.856602, 1, 0.04705882, 0, 1,
-2.298832, 1.683481, -2.310596, 1, 0.05490196, 0, 1,
-2.260878, -0.2903089, -1.933334, 1, 0.05882353, 0, 1,
-2.199838, -0.3645272, -2.253347, 1, 0.06666667, 0, 1,
-2.168969, -0.4548234, -2.384562, 1, 0.07058824, 0, 1,
-2.160427, 0.1038475, -1.374987, 1, 0.07843138, 0, 1,
-2.126101, -1.233507, -2.047263, 1, 0.08235294, 0, 1,
-2.12114, 0.226576, -1.559997, 1, 0.09019608, 0, 1,
-2.120728, -1.661154, -2.403836, 1, 0.09411765, 0, 1,
-2.078402, 1.032341, -2.587824, 1, 0.1019608, 0, 1,
-2.064083, 1.333925, -1.417969, 1, 0.1098039, 0, 1,
-2.061136, 0.3808955, -0.2857497, 1, 0.1137255, 0, 1,
-2.0288, -0.5433136, -1.796905, 1, 0.1215686, 0, 1,
-2.021879, 0.926994, -0.9319556, 1, 0.1254902, 0, 1,
-2.021543, 0.03325144, -0.8182198, 1, 0.1333333, 0, 1,
-2.015633, -0.701156, -2.073472, 1, 0.1372549, 0, 1,
-1.999866, -0.1602362, -2.007227, 1, 0.145098, 0, 1,
-1.967854, 0.800006, -0.658896, 1, 0.1490196, 0, 1,
-1.964812, -0.1518551, -1.568591, 1, 0.1568628, 0, 1,
-1.95895, -0.7251617, -2.160826, 1, 0.1607843, 0, 1,
-1.947409, -1.060021, -2.27132, 1, 0.1686275, 0, 1,
-1.936345, -0.2545458, -1.487869, 1, 0.172549, 0, 1,
-1.921013, 0.4384612, 0.5774063, 1, 0.1803922, 0, 1,
-1.840505, 0.9651402, -0.9042732, 1, 0.1843137, 0, 1,
-1.813342, 1.208317, -1.221688, 1, 0.1921569, 0, 1,
-1.794871, -1.219783, -1.545522, 1, 0.1960784, 0, 1,
-1.793402, -1.096183, -2.695605, 1, 0.2039216, 0, 1,
-1.788959, 0.05084367, 1.120311, 1, 0.2117647, 0, 1,
-1.781134, 0.9390074, -2.965763, 1, 0.2156863, 0, 1,
-1.779193, 1.962578, 0.4633674, 1, 0.2235294, 0, 1,
-1.7761, 0.1246789, -1.971659, 1, 0.227451, 0, 1,
-1.753515, 0.1236489, -4.061636, 1, 0.2352941, 0, 1,
-1.712936, -0.6152547, -3.694867, 1, 0.2392157, 0, 1,
-1.705932, -0.08032006, -1.026254, 1, 0.2470588, 0, 1,
-1.700021, -1.09692, -3.390119, 1, 0.2509804, 0, 1,
-1.685388, 0.5093408, -1.19882, 1, 0.2588235, 0, 1,
-1.680635, 1.136891, -1.527757, 1, 0.2627451, 0, 1,
-1.678417, 0.4794451, -0.7862969, 1, 0.2705882, 0, 1,
-1.673322, 0.8229876, -0.8142089, 1, 0.2745098, 0, 1,
-1.659411, 0.3185779, -1.806308, 1, 0.282353, 0, 1,
-1.644437, 0.03821155, -0.9182103, 1, 0.2862745, 0, 1,
-1.634872, -1.847902, -2.065654, 1, 0.2941177, 0, 1,
-1.598175, 1.023672, -1.439081, 1, 0.3019608, 0, 1,
-1.590009, 1.617212, -1.831412, 1, 0.3058824, 0, 1,
-1.582844, 3.20002, -0.4468754, 1, 0.3137255, 0, 1,
-1.578412, -0.1645899, -1.252574, 1, 0.3176471, 0, 1,
-1.568403, 1.233364, -0.8265696, 1, 0.3254902, 0, 1,
-1.557153, 0.5113004, -1.007034, 1, 0.3294118, 0, 1,
-1.538266, -0.3038979, -1.249742, 1, 0.3372549, 0, 1,
-1.532391, -1.182772, -1.461192, 1, 0.3411765, 0, 1,
-1.528208, 1.106435, -0.3885613, 1, 0.3490196, 0, 1,
-1.504401, 1.182479, -1.009504, 1, 0.3529412, 0, 1,
-1.501493, -0.6103395, -0.3393682, 1, 0.3607843, 0, 1,
-1.470453, 0.3599686, -2.024016, 1, 0.3647059, 0, 1,
-1.460927, -0.6985923, -2.742504, 1, 0.372549, 0, 1,
-1.445492, -2.527243, -1.344919, 1, 0.3764706, 0, 1,
-1.428963, 1.294642, 0.447208, 1, 0.3843137, 0, 1,
-1.425318, -0.5939794, -2.753604, 1, 0.3882353, 0, 1,
-1.422247, 0.4923593, -0.6457929, 1, 0.3960784, 0, 1,
-1.413237, -2.371358, -2.611252, 1, 0.4039216, 0, 1,
-1.4101, -0.05105309, -0.7466514, 1, 0.4078431, 0, 1,
-1.402351, 0.4070826, -1.832965, 1, 0.4156863, 0, 1,
-1.399773, -0.5898795, -0.5166827, 1, 0.4196078, 0, 1,
-1.392441, 0.942227, -0.8100001, 1, 0.427451, 0, 1,
-1.381788, 0.554437, -1.515249, 1, 0.4313726, 0, 1,
-1.364379, 0.5155985, -1.04906, 1, 0.4392157, 0, 1,
-1.359174, 0.3357489, -1.251107, 1, 0.4431373, 0, 1,
-1.354435, 2.041174, 0.9467242, 1, 0.4509804, 0, 1,
-1.354381, 1.953375, -1.622638, 1, 0.454902, 0, 1,
-1.346364, -0.582866, -1.869413, 1, 0.4627451, 0, 1,
-1.345547, -0.9880416, -0.9599909, 1, 0.4666667, 0, 1,
-1.331757, -0.1826372, -1.506675, 1, 0.4745098, 0, 1,
-1.330399, 1.171646, 0.9852534, 1, 0.4784314, 0, 1,
-1.330048, -1.268205, -3.696322, 1, 0.4862745, 0, 1,
-1.327925, 0.360189, -2.047862, 1, 0.4901961, 0, 1,
-1.321955, -0.3495988, -1.13048, 1, 0.4980392, 0, 1,
-1.320928, 0.2807509, -0.9980127, 1, 0.5058824, 0, 1,
-1.309459, -0.5465956, -1.766948, 1, 0.509804, 0, 1,
-1.30275, -0.5361348, -1.871632, 1, 0.5176471, 0, 1,
-1.299532, 2.883455, -1.311719, 1, 0.5215687, 0, 1,
-1.298543, 2.368768, 0.1793955, 1, 0.5294118, 0, 1,
-1.298325, 0.9623046, -0.5648549, 1, 0.5333334, 0, 1,
-1.297764, -0.7370072, -5.045775, 1, 0.5411765, 0, 1,
-1.291519, 1.417257, -0.7348866, 1, 0.5450981, 0, 1,
-1.288516, 1.102673, 1.1033, 1, 0.5529412, 0, 1,
-1.286851, 0.3230217, -2.04736, 1, 0.5568628, 0, 1,
-1.284801, 2.201551, -0.7056074, 1, 0.5647059, 0, 1,
-1.279101, -1.06746, -3.624603, 1, 0.5686275, 0, 1,
-1.272157, 0.04911009, -2.204006, 1, 0.5764706, 0, 1,
-1.268236, -1.094207, -2.838161, 1, 0.5803922, 0, 1,
-1.266422, -0.539721, -0.5557043, 1, 0.5882353, 0, 1,
-1.256881, 0.006107365, -2.896662, 1, 0.5921569, 0, 1,
-1.255669, 0.8819134, -0.137866, 1, 0.6, 0, 1,
-1.255535, -1.010321, -3.3376, 1, 0.6078432, 0, 1,
-1.246551, -0.2311803, -2.809987, 1, 0.6117647, 0, 1,
-1.242584, 1.292375, -0.02706842, 1, 0.6196079, 0, 1,
-1.242081, 0.06559097, -1.162331, 1, 0.6235294, 0, 1,
-1.240006, 0.6797328, -0.7592767, 1, 0.6313726, 0, 1,
-1.238566, 1.340104, -0.2705952, 1, 0.6352941, 0, 1,
-1.231904, -1.957887, -2.445128, 1, 0.6431373, 0, 1,
-1.229041, -1.138098, -2.063838, 1, 0.6470588, 0, 1,
-1.22745, 0.3786769, -2.328134, 1, 0.654902, 0, 1,
-1.222158, -0.4137121, -3.285012, 1, 0.6588235, 0, 1,
-1.218791, -1.247728, -2.101266, 1, 0.6666667, 0, 1,
-1.217835, 0.7079653, -0.5108452, 1, 0.6705883, 0, 1,
-1.217344, -0.5012082, -1.642499, 1, 0.6784314, 0, 1,
-1.207782, -0.6917278, -2.649872, 1, 0.682353, 0, 1,
-1.203754, 0.2926013, -2.961683, 1, 0.6901961, 0, 1,
-1.20333, -0.1963954, -3.456098, 1, 0.6941177, 0, 1,
-1.198863, -0.6172248, -2.205098, 1, 0.7019608, 0, 1,
-1.198676, 2.139735, -0.4185571, 1, 0.7098039, 0, 1,
-1.197422, -0.7158355, -1.808247, 1, 0.7137255, 0, 1,
-1.196175, -0.8460377, -1.499359, 1, 0.7215686, 0, 1,
-1.19268, -0.4020189, -2.422452, 1, 0.7254902, 0, 1,
-1.190812, -1.914558, -1.236753, 1, 0.7333333, 0, 1,
-1.185512, 1.423977, -0.9214513, 1, 0.7372549, 0, 1,
-1.182904, 1.47387, 0.8183204, 1, 0.7450981, 0, 1,
-1.182365, -0.3873771, -1.89851, 1, 0.7490196, 0, 1,
-1.180403, -0.759562, -3.865573, 1, 0.7568628, 0, 1,
-1.167008, 0.1840976, -0.5385609, 1, 0.7607843, 0, 1,
-1.162424, -0.6820657, -1.647039, 1, 0.7686275, 0, 1,
-1.161624, -1.940696, -3.371121, 1, 0.772549, 0, 1,
-1.151112, -0.9241345, -2.171803, 1, 0.7803922, 0, 1,
-1.140257, -1.545121, -2.949635, 1, 0.7843137, 0, 1,
-1.130622, 0.8051249, -1.536491, 1, 0.7921569, 0, 1,
-1.130412, 2.99482, -0.3287142, 1, 0.7960784, 0, 1,
-1.129856, -1.642525, -3.089365, 1, 0.8039216, 0, 1,
-1.129002, 1.251147, -1.244107, 1, 0.8117647, 0, 1,
-1.124756, -0.3160166, -0.156801, 1, 0.8156863, 0, 1,
-1.123139, -1.781569, -1.619782, 1, 0.8235294, 0, 1,
-1.120509, -0.2501393, -1.442727, 1, 0.827451, 0, 1,
-1.110669, 0.2532341, -2.337776, 1, 0.8352941, 0, 1,
-1.108659, -1.390958, -1.870716, 1, 0.8392157, 0, 1,
-1.097589, -0.941669, -3.114501, 1, 0.8470588, 0, 1,
-1.094857, 0.4951255, -2.255793, 1, 0.8509804, 0, 1,
-1.09428, 0.650878, -0.90205, 1, 0.8588235, 0, 1,
-1.09267, 2.378904, 1.058418, 1, 0.8627451, 0, 1,
-1.073431, 0.3015489, -0.9942498, 1, 0.8705882, 0, 1,
-1.07239, -0.2509346, -1.097513, 1, 0.8745098, 0, 1,
-1.071543, 0.8950685, -1.882773, 1, 0.8823529, 0, 1,
-1.071035, 0.5037401, -1.197885, 1, 0.8862745, 0, 1,
-1.070719, -2.019969, -4.257828, 1, 0.8941177, 0, 1,
-1.0658, 0.1357597, -0.4580674, 1, 0.8980392, 0, 1,
-1.06557, 0.5318174, -1.735805, 1, 0.9058824, 0, 1,
-1.06376, -0.1405243, -2.234943, 1, 0.9137255, 0, 1,
-1.062582, -0.6068993, -1.661087, 1, 0.9176471, 0, 1,
-1.062094, 0.8685222, 1.335474, 1, 0.9254902, 0, 1,
-1.059157, -0.3839636, -1.889607, 1, 0.9294118, 0, 1,
-1.056472, -1.168575, -1.770058, 1, 0.9372549, 0, 1,
-1.053067, -0.2871312, 0.1294886, 1, 0.9411765, 0, 1,
-1.046805, -0.8707912, -1.933359, 1, 0.9490196, 0, 1,
-1.046467, -0.14595, -1.963297, 1, 0.9529412, 0, 1,
-1.042388, -1.138347, -1.576412, 1, 0.9607843, 0, 1,
-1.036656, -0.891066, 1.444477, 1, 0.9647059, 0, 1,
-1.034224, -0.2931475, -2.012498, 1, 0.972549, 0, 1,
-1.031367, -0.7390572, -2.158707, 1, 0.9764706, 0, 1,
-1.030557, -0.1874366, -1.083642, 1, 0.9843137, 0, 1,
-1.023304, 0.8561105, -1.327808, 1, 0.9882353, 0, 1,
-1.022493, -0.09138905, -3.015173, 1, 0.9960784, 0, 1,
-1.02117, 0.06716292, -1.573462, 0.9960784, 1, 0, 1,
-1.018861, 0.08806015, -0.7958241, 0.9921569, 1, 0, 1,
-1.011445, -0.5079071, -2.157974, 0.9843137, 1, 0, 1,
-1.009649, 1.026395, -1.054625, 0.9803922, 1, 0, 1,
-1.00949, -1.295805, -2.899876, 0.972549, 1, 0, 1,
-1.009097, -1.423237, -1.852206, 0.9686275, 1, 0, 1,
-1.00502, -1.479553, -4.094876, 0.9607843, 1, 0, 1,
-0.9957456, 0.6807991, -0.9618601, 0.9568627, 1, 0, 1,
-0.9923426, -1.010703, -1.234931, 0.9490196, 1, 0, 1,
-0.9738062, -1.963426, -2.330064, 0.945098, 1, 0, 1,
-0.9733844, 0.2864688, -0.5058473, 0.9372549, 1, 0, 1,
-0.9633005, 0.119357, -1.152897, 0.9333333, 1, 0, 1,
-0.9583151, -0.03829509, -2.269821, 0.9254902, 1, 0, 1,
-0.9537026, -0.1989322, -1.597634, 0.9215686, 1, 0, 1,
-0.9428236, 0.9625198, 1.595106, 0.9137255, 1, 0, 1,
-0.9289962, 0.06073946, -1.513591, 0.9098039, 1, 0, 1,
-0.9250802, -1.334244, -1.95745, 0.9019608, 1, 0, 1,
-0.9194037, -2.258837, -2.293252, 0.8941177, 1, 0, 1,
-0.913233, 0.4832847, -1.518435, 0.8901961, 1, 0, 1,
-0.9109171, -0.03281954, -3.060997, 0.8823529, 1, 0, 1,
-0.910213, -0.7017263, -1.553164, 0.8784314, 1, 0, 1,
-0.9066175, 0.2683702, -0.1126013, 0.8705882, 1, 0, 1,
-0.8987617, 0.9308821, -0.5099343, 0.8666667, 1, 0, 1,
-0.8957545, -0.3864383, -0.6603451, 0.8588235, 1, 0, 1,
-0.8840885, 1.217777, -0.396178, 0.854902, 1, 0, 1,
-0.8823062, -1.481562, -3.610099, 0.8470588, 1, 0, 1,
-0.8807603, 1.047665, -1.239406, 0.8431373, 1, 0, 1,
-0.8747952, -0.4999834, -0.9823684, 0.8352941, 1, 0, 1,
-0.8729934, -1.596972, -3.524048, 0.8313726, 1, 0, 1,
-0.864177, 0.3603339, -1.400416, 0.8235294, 1, 0, 1,
-0.8614451, 1.469573, -0.5507055, 0.8196079, 1, 0, 1,
-0.8551364, 0.4334895, -1.808245, 0.8117647, 1, 0, 1,
-0.8525976, 0.9055684, -1.780463, 0.8078431, 1, 0, 1,
-0.8495591, 1.366153, -2.564041, 0.8, 1, 0, 1,
-0.8425704, 1.812017, -1.372493, 0.7921569, 1, 0, 1,
-0.842303, 0.0733877, -2.371701, 0.7882353, 1, 0, 1,
-0.8325321, -0.7323862, -1.583434, 0.7803922, 1, 0, 1,
-0.8319011, -1.179848, -3.930907, 0.7764706, 1, 0, 1,
-0.8315285, -0.9372178, -4.813048, 0.7686275, 1, 0, 1,
-0.8250987, 0.4809802, -0.5703898, 0.7647059, 1, 0, 1,
-0.8197089, 1.578208, -0.9168537, 0.7568628, 1, 0, 1,
-0.8105134, -1.209522, -2.695129, 0.7529412, 1, 0, 1,
-0.8091912, -0.08162978, -1.168789, 0.7450981, 1, 0, 1,
-0.8079895, 0.8575287, -0.8674346, 0.7411765, 1, 0, 1,
-0.8037473, -0.3619198, -0.691417, 0.7333333, 1, 0, 1,
-0.8032764, -0.9555172, -3.515058, 0.7294118, 1, 0, 1,
-0.7983124, 0.6946939, 0.7382394, 0.7215686, 1, 0, 1,
-0.7878228, 2.867668, 0.3128331, 0.7176471, 1, 0, 1,
-0.7835465, 2.326861, 0.1411589, 0.7098039, 1, 0, 1,
-0.7793649, -0.1465211, -3.292596, 0.7058824, 1, 0, 1,
-0.7762885, -0.5030096, -0.6609187, 0.6980392, 1, 0, 1,
-0.7742479, -0.3379162, -1.140718, 0.6901961, 1, 0, 1,
-0.7726226, -0.6005049, -3.147121, 0.6862745, 1, 0, 1,
-0.7720623, 1.205427, 0.1076363, 0.6784314, 1, 0, 1,
-0.7697118, 2.057862, 0.1010057, 0.6745098, 1, 0, 1,
-0.7645485, -0.8244855, -2.051114, 0.6666667, 1, 0, 1,
-0.7627352, -0.4550811, -0.3271004, 0.6627451, 1, 0, 1,
-0.7615938, -0.2165424, -2.280345, 0.654902, 1, 0, 1,
-0.7599887, 0.007952561, -1.309667, 0.6509804, 1, 0, 1,
-0.758942, 0.4268928, -0.1713179, 0.6431373, 1, 0, 1,
-0.7567592, -0.2008281, -3.561445, 0.6392157, 1, 0, 1,
-0.7517966, -0.714411, -3.395251, 0.6313726, 1, 0, 1,
-0.750882, -0.197271, -3.088394, 0.627451, 1, 0, 1,
-0.7500882, -0.2351534, -1.049238, 0.6196079, 1, 0, 1,
-0.7484794, 0.5741494, -1.681882, 0.6156863, 1, 0, 1,
-0.7475001, 0.4914242, -0.248168, 0.6078432, 1, 0, 1,
-0.745159, 0.4376112, -1.194995, 0.6039216, 1, 0, 1,
-0.7404797, -0.4756296, -2.812719, 0.5960785, 1, 0, 1,
-0.7399016, 0.397509, -1.260841, 0.5882353, 1, 0, 1,
-0.7395048, -0.5777541, -2.488762, 0.5843138, 1, 0, 1,
-0.7376015, -1.515186, -2.304537, 0.5764706, 1, 0, 1,
-0.7333367, -1.334434, -3.126618, 0.572549, 1, 0, 1,
-0.7329603, -2.52279, -2.559136, 0.5647059, 1, 0, 1,
-0.7300723, -1.281613, -0.9343199, 0.5607843, 1, 0, 1,
-0.7262329, 0.1606126, 0.1906807, 0.5529412, 1, 0, 1,
-0.7239186, -0.61213, -1.660439, 0.5490196, 1, 0, 1,
-0.7173361, -0.5157769, 0.30045, 0.5411765, 1, 0, 1,
-0.71324, 0.1750388, -3.854066, 0.5372549, 1, 0, 1,
-0.7073238, 0.3372447, -2.36682, 0.5294118, 1, 0, 1,
-0.7043062, -0.3647054, -2.202648, 0.5254902, 1, 0, 1,
-0.7006049, -0.9393685, -3.922246, 0.5176471, 1, 0, 1,
-0.69765, -1.366668, -3.438029, 0.5137255, 1, 0, 1,
-0.693233, -0.774367, -3.152122, 0.5058824, 1, 0, 1,
-0.6930485, 1.543124, -4.133479, 0.5019608, 1, 0, 1,
-0.6886778, 1.199301, 0.06652618, 0.4941176, 1, 0, 1,
-0.6874491, 0.4563552, -1.010422, 0.4862745, 1, 0, 1,
-0.6839808, -0.4031197, -2.466908, 0.4823529, 1, 0, 1,
-0.6836752, 1.423368, -0.6117432, 0.4745098, 1, 0, 1,
-0.6831819, -0.9621812, -3.0499, 0.4705882, 1, 0, 1,
-0.6792837, -0.1028839, -1.748779, 0.4627451, 1, 0, 1,
-0.6768941, 0.676407, -0.07952467, 0.4588235, 1, 0, 1,
-0.6763674, -0.2927637, -3.25309, 0.4509804, 1, 0, 1,
-0.6719283, 0.263849, -0.5041119, 0.4470588, 1, 0, 1,
-0.6695995, 0.7495028, -0.6798952, 0.4392157, 1, 0, 1,
-0.6672085, -0.7446271, -1.129483, 0.4352941, 1, 0, 1,
-0.6671799, -0.6405984, -1.96504, 0.427451, 1, 0, 1,
-0.6670442, 0.4515307, -0.5797018, 0.4235294, 1, 0, 1,
-0.6664109, -1.257764, -3.011637, 0.4156863, 1, 0, 1,
-0.6588896, 0.9081437, -0.9650568, 0.4117647, 1, 0, 1,
-0.6584451, -0.1532804, -2.104142, 0.4039216, 1, 0, 1,
-0.655983, -1.092122, -2.61689, 0.3960784, 1, 0, 1,
-0.6541299, -1.108975, -2.957533, 0.3921569, 1, 0, 1,
-0.6540973, 0.6734073, 0.02319114, 0.3843137, 1, 0, 1,
-0.6522993, 1.262907, -0.6049517, 0.3803922, 1, 0, 1,
-0.6501295, 0.7682148, -0.658661, 0.372549, 1, 0, 1,
-0.6470361, 0.3039264, -0.4320899, 0.3686275, 1, 0, 1,
-0.6423275, 0.06783631, 0.841068, 0.3607843, 1, 0, 1,
-0.6414706, -0.007929839, -1.832497, 0.3568628, 1, 0, 1,
-0.6401638, -1.468219, -1.784386, 0.3490196, 1, 0, 1,
-0.6314035, 0.6969389, 0.6570453, 0.345098, 1, 0, 1,
-0.6267413, -1.428329, -2.619239, 0.3372549, 1, 0, 1,
-0.6265969, -0.7443559, -2.20157, 0.3333333, 1, 0, 1,
-0.6234157, -0.8819124, -2.643481, 0.3254902, 1, 0, 1,
-0.6232725, -1.244371, -4.479048, 0.3215686, 1, 0, 1,
-0.6167125, -2.021723, -4.678373, 0.3137255, 1, 0, 1,
-0.6127945, 0.2576822, -1.559392, 0.3098039, 1, 0, 1,
-0.6126019, 0.1563131, -1.094395, 0.3019608, 1, 0, 1,
-0.6108667, 1.079908, -1.591155, 0.2941177, 1, 0, 1,
-0.6010028, -0.6708569, -2.642554, 0.2901961, 1, 0, 1,
-0.59986, -0.01437614, -1.354313, 0.282353, 1, 0, 1,
-0.5979983, -1.283899, -2.000128, 0.2784314, 1, 0, 1,
-0.5965956, 0.1318223, -1.944861, 0.2705882, 1, 0, 1,
-0.5915516, -0.280543, -1.808334, 0.2666667, 1, 0, 1,
-0.5872498, 0.08177694, -1.855291, 0.2588235, 1, 0, 1,
-0.5870302, 0.0655884, -0.9829536, 0.254902, 1, 0, 1,
-0.5864586, 1.588768, 1.86413, 0.2470588, 1, 0, 1,
-0.5821555, -0.4325308, -1.648703, 0.2431373, 1, 0, 1,
-0.5797243, -1.139875, -3.27854, 0.2352941, 1, 0, 1,
-0.5787168, -0.8845306, -1.959688, 0.2313726, 1, 0, 1,
-0.5738415, -0.878503, -1.516319, 0.2235294, 1, 0, 1,
-0.5722201, 0.3648226, -0.2095784, 0.2196078, 1, 0, 1,
-0.571486, -2.17407, -3.322536, 0.2117647, 1, 0, 1,
-0.5703283, -1.092067, -1.994631, 0.2078431, 1, 0, 1,
-0.5700962, -0.5148873, -0.1667023, 0.2, 1, 0, 1,
-0.5681204, -1.331637, -3.283198, 0.1921569, 1, 0, 1,
-0.5668588, 1.5604, -2.152179, 0.1882353, 1, 0, 1,
-0.5667651, 0.07069063, -2.636648, 0.1803922, 1, 0, 1,
-0.5628016, -2.188627, -1.183287, 0.1764706, 1, 0, 1,
-0.5583774, -0.4954706, -1.541949, 0.1686275, 1, 0, 1,
-0.5550333, -0.3174457, -3.23519, 0.1647059, 1, 0, 1,
-0.5548757, 0.2434071, -0.2947597, 0.1568628, 1, 0, 1,
-0.5496602, -0.1288988, -1.166486, 0.1529412, 1, 0, 1,
-0.5468461, -0.0564157, -2.027166, 0.145098, 1, 0, 1,
-0.5444669, 0.6698861, -1.561424, 0.1411765, 1, 0, 1,
-0.5419182, 1.92482, 0.4986461, 0.1333333, 1, 0, 1,
-0.5319793, 0.05340295, -0.3527896, 0.1294118, 1, 0, 1,
-0.5319562, 0.5419002, -1.219733, 0.1215686, 1, 0, 1,
-0.5293275, -0.3275287, -1.669261, 0.1176471, 1, 0, 1,
-0.5269062, 0.7200889, -1.71439, 0.1098039, 1, 0, 1,
-0.5242, -0.3860496, -3.073988, 0.1058824, 1, 0, 1,
-0.522916, -0.05975385, -1.958885, 0.09803922, 1, 0, 1,
-0.5204206, -0.4564313, -0.2218156, 0.09019608, 1, 0, 1,
-0.5189885, 0.1966056, -0.791288, 0.08627451, 1, 0, 1,
-0.5186635, 2.130832, 0.5288206, 0.07843138, 1, 0, 1,
-0.5046868, -2.101157, -3.746129, 0.07450981, 1, 0, 1,
-0.5012132, 0.6822474, 0.5530305, 0.06666667, 1, 0, 1,
-0.5007179, 0.2437746, -1.903816, 0.0627451, 1, 0, 1,
-0.4966242, -1.808888, -2.605357, 0.05490196, 1, 0, 1,
-0.4928806, 0.5928485, 1.079569, 0.05098039, 1, 0, 1,
-0.4878788, 1.144066, -0.6216237, 0.04313726, 1, 0, 1,
-0.4861273, -0.6268511, -4.517457, 0.03921569, 1, 0, 1,
-0.4840261, -0.1683174, -0.8853719, 0.03137255, 1, 0, 1,
-0.4836844, 0.04251099, -1.44813, 0.02745098, 1, 0, 1,
-0.4801048, -1.346282, -3.537544, 0.01960784, 1, 0, 1,
-0.4738254, 0.9371639, -3.033323, 0.01568628, 1, 0, 1,
-0.4642384, -0.9603884, -1.99785, 0.007843138, 1, 0, 1,
-0.4642094, 0.2779807, -1.426855, 0.003921569, 1, 0, 1,
-0.4565933, 0.2954882, -2.061525, 0, 1, 0.003921569, 1,
-0.4526868, -1.966133, -4.314758, 0, 1, 0.01176471, 1,
-0.4434113, -1.007422, -1.498439, 0, 1, 0.01568628, 1,
-0.4432346, 0.1329543, -3.539514, 0, 1, 0.02352941, 1,
-0.4420479, 0.6605227, 0.02801038, 0, 1, 0.02745098, 1,
-0.4369193, -0.8649662, -3.12026, 0, 1, 0.03529412, 1,
-0.4355198, 0.05296308, -0.5489866, 0, 1, 0.03921569, 1,
-0.4311109, -1.060653, -3.178361, 0, 1, 0.04705882, 1,
-0.428558, -0.2188137, -1.227212, 0, 1, 0.05098039, 1,
-0.4265541, -0.7896194, -3.757286, 0, 1, 0.05882353, 1,
-0.4231215, -0.8238081, -3.540509, 0, 1, 0.0627451, 1,
-0.4216406, -2.119337, -3.701126, 0, 1, 0.07058824, 1,
-0.4143871, -0.3429651, -2.87588, 0, 1, 0.07450981, 1,
-0.4125785, -0.7415731, -1.270792, 0, 1, 0.08235294, 1,
-0.4111788, 0.9319586, -0.8431985, 0, 1, 0.08627451, 1,
-0.4038451, 0.2056018, -0.5273407, 0, 1, 0.09411765, 1,
-0.3986603, -0.7157427, -2.01134, 0, 1, 0.1019608, 1,
-0.3981551, 0.3794228, -1.510718, 0, 1, 0.1058824, 1,
-0.3974973, -0.7845806, -3.001534, 0, 1, 0.1137255, 1,
-0.3955126, 1.584401, -0.1525633, 0, 1, 0.1176471, 1,
-0.3944111, -0.2424023, -1.472536, 0, 1, 0.1254902, 1,
-0.3943563, 0.6549734, -0.3957409, 0, 1, 0.1294118, 1,
-0.3939946, -0.8600662, -0.3784279, 0, 1, 0.1372549, 1,
-0.3932886, -0.1721251, -1.357791, 0, 1, 0.1411765, 1,
-0.3903448, 1.286698, -1.005455, 0, 1, 0.1490196, 1,
-0.3839226, -1.509213, -1.161783, 0, 1, 0.1529412, 1,
-0.3827593, -0.4496987, -4.319533, 0, 1, 0.1607843, 1,
-0.3774681, -1.127827, -0.9794934, 0, 1, 0.1647059, 1,
-0.3742998, 0.6555542, -0.540421, 0, 1, 0.172549, 1,
-0.3726298, -0.2374928, -0.667851, 0, 1, 0.1764706, 1,
-0.3705473, -2.070412, -3.11862, 0, 1, 0.1843137, 1,
-0.3642737, 0.3839402, 0.007313748, 0, 1, 0.1882353, 1,
-0.3642549, -0.5700947, -1.486694, 0, 1, 0.1960784, 1,
-0.3618654, 1.640547, -0.7000579, 0, 1, 0.2039216, 1,
-0.3571, -0.5049776, -3.544419, 0, 1, 0.2078431, 1,
-0.3530457, 1.083695, -0.3937014, 0, 1, 0.2156863, 1,
-0.3407742, -0.8160211, -1.306195, 0, 1, 0.2196078, 1,
-0.340025, 0.2740143, 0.4884141, 0, 1, 0.227451, 1,
-0.3361597, 0.720566, -0.4068996, 0, 1, 0.2313726, 1,
-0.3340855, -0.8980817, -3.188998, 0, 1, 0.2392157, 1,
-0.3326986, -0.5731844, -3.719931, 0, 1, 0.2431373, 1,
-0.3323493, 0.9276807, -0.6630312, 0, 1, 0.2509804, 1,
-0.3323258, -0.1036515, 0.05449628, 0, 1, 0.254902, 1,
-0.3315808, 2.001681, -0.214147, 0, 1, 0.2627451, 1,
-0.3311183, -0.3243445, -2.803903, 0, 1, 0.2666667, 1,
-0.3303829, 1.279657, -0.1035245, 0, 1, 0.2745098, 1,
-0.3280114, -0.03324469, -1.426979, 0, 1, 0.2784314, 1,
-0.3268068, 0.6044822, -0.6004455, 0, 1, 0.2862745, 1,
-0.3169029, 0.6729295, -2.155692, 0, 1, 0.2901961, 1,
-0.3165286, 0.07598506, -3.596055, 0, 1, 0.2980392, 1,
-0.3160892, 0.2959338, -0.737937, 0, 1, 0.3058824, 1,
-0.3154987, 0.4318361, 0.1795257, 0, 1, 0.3098039, 1,
-0.3151709, 0.2260928, -0.7053127, 0, 1, 0.3176471, 1,
-0.3054412, 0.6877211, -0.7307368, 0, 1, 0.3215686, 1,
-0.2991304, -0.4426684, -1.979224, 0, 1, 0.3294118, 1,
-0.2990444, -0.868994, -3.524176, 0, 1, 0.3333333, 1,
-0.2960852, 1.386576, -0.138036, 0, 1, 0.3411765, 1,
-0.293046, -1.282437, -5.094715, 0, 1, 0.345098, 1,
-0.2898335, 0.30437, -2.105395, 0, 1, 0.3529412, 1,
-0.2882706, 0.3942303, -0.06811443, 0, 1, 0.3568628, 1,
-0.2848204, -1.550786, -3.115429, 0, 1, 0.3647059, 1,
-0.2809784, 0.4704317, -2.18967, 0, 1, 0.3686275, 1,
-0.2775623, -0.8142902, -2.761121, 0, 1, 0.3764706, 1,
-0.2774914, 0.3548016, -1.223262, 0, 1, 0.3803922, 1,
-0.2766098, -0.3421432, -2.907338, 0, 1, 0.3882353, 1,
-0.2719451, -0.5485202, -1.454996, 0, 1, 0.3921569, 1,
-0.2675368, 1.277484, -1.685855, 0, 1, 0.4, 1,
-0.265231, -0.4165069, -2.121766, 0, 1, 0.4078431, 1,
-0.263521, 1.651119, 0.3203953, 0, 1, 0.4117647, 1,
-0.259773, 0.5563492, -1.492889, 0, 1, 0.4196078, 1,
-0.2482443, -1.901698, -2.715305, 0, 1, 0.4235294, 1,
-0.2440119, 0.6343962, -0.7003382, 0, 1, 0.4313726, 1,
-0.2433365, -1.326563, -2.239192, 0, 1, 0.4352941, 1,
-0.2392393, -0.1363802, -1.211057, 0, 1, 0.4431373, 1,
-0.2343401, -0.2390601, -0.5520648, 0, 1, 0.4470588, 1,
-0.2340478, 0.03754271, -1.996956, 0, 1, 0.454902, 1,
-0.2311324, 0.5489761, -1.672495, 0, 1, 0.4588235, 1,
-0.2301251, 0.4124053, -0.04866296, 0, 1, 0.4666667, 1,
-0.2301169, 0.5257314, -0.2070638, 0, 1, 0.4705882, 1,
-0.2291235, 0.4632708, -1.028908, 0, 1, 0.4784314, 1,
-0.2283764, -0.1433121, -2.179434, 0, 1, 0.4823529, 1,
-0.2222388, 0.8555528, -0.604443, 0, 1, 0.4901961, 1,
-0.2182487, -0.900426, -3.045389, 0, 1, 0.4941176, 1,
-0.2180248, -0.7378552, -2.5521, 0, 1, 0.5019608, 1,
-0.2177011, -1.148142, -4.62325, 0, 1, 0.509804, 1,
-0.2039278, -0.2257222, -1.459976, 0, 1, 0.5137255, 1,
-0.1984046, 0.2384323, -0.9052322, 0, 1, 0.5215687, 1,
-0.1963704, 1.152047, -1.113757, 0, 1, 0.5254902, 1,
-0.1928778, 0.632265, -1.070556, 0, 1, 0.5333334, 1,
-0.1928521, 0.5400559, -1.093935, 0, 1, 0.5372549, 1,
-0.1883802, -0.3055078, -2.936043, 0, 1, 0.5450981, 1,
-0.1877546, 0.5542948, -0.1803918, 0, 1, 0.5490196, 1,
-0.1850595, -0.7348867, -2.966106, 0, 1, 0.5568628, 1,
-0.1836352, 1.123889, -0.8465182, 0, 1, 0.5607843, 1,
-0.1831795, 1.116922, -1.167422, 0, 1, 0.5686275, 1,
-0.1786421, 0.686061, 0.9360083, 0, 1, 0.572549, 1,
-0.1745725, -0.1488185, -1.370549, 0, 1, 0.5803922, 1,
-0.1708875, -0.9513506, -1.637456, 0, 1, 0.5843138, 1,
-0.1690814, -1.036865, -3.368771, 0, 1, 0.5921569, 1,
-0.1650051, 0.6077894, -1.358147, 0, 1, 0.5960785, 1,
-0.1645032, -0.2935951, -2.341964, 0, 1, 0.6039216, 1,
-0.1626009, -0.5071889, -4.042201, 0, 1, 0.6117647, 1,
-0.1610684, -1.760878, -2.732861, 0, 1, 0.6156863, 1,
-0.160917, 0.401463, -1.038859, 0, 1, 0.6235294, 1,
-0.1564102, -0.4427623, -3.521597, 0, 1, 0.627451, 1,
-0.1558685, 1.225703, -0.1686733, 0, 1, 0.6352941, 1,
-0.1555093, -0.6869292, -2.689761, 0, 1, 0.6392157, 1,
-0.1554131, -0.422546, -3.404432, 0, 1, 0.6470588, 1,
-0.152345, -1.204171, -5.268544, 0, 1, 0.6509804, 1,
-0.1446375, 1.795058, 0.8451089, 0, 1, 0.6588235, 1,
-0.14164, -0.3571644, -4.038145, 0, 1, 0.6627451, 1,
-0.1410161, 0.5922662, 0.4816653, 0, 1, 0.6705883, 1,
-0.1379988, 0.02431698, -2.994944, 0, 1, 0.6745098, 1,
-0.1338595, 1.055788, 1.279422, 0, 1, 0.682353, 1,
-0.1295118, -2.262083, -3.025942, 0, 1, 0.6862745, 1,
-0.1236366, 0.7609842, -1.127072, 0, 1, 0.6941177, 1,
-0.1228702, 0.2572112, -0.8048785, 0, 1, 0.7019608, 1,
-0.1206088, 0.3082232, -0.04301538, 0, 1, 0.7058824, 1,
-0.1153615, 0.4307959, 0.03928337, 0, 1, 0.7137255, 1,
-0.1125219, -0.1121893, -2.955117, 0, 1, 0.7176471, 1,
-0.1082197, 0.366309, 0.7245539, 0, 1, 0.7254902, 1,
-0.1050582, 1.085515, 0.1581271, 0, 1, 0.7294118, 1,
-0.1029013, -0.6014128, -1.334772, 0, 1, 0.7372549, 1,
-0.099746, 0.2615902, -0.2723699, 0, 1, 0.7411765, 1,
-0.09527662, -1.417356, -4.523151, 0, 1, 0.7490196, 1,
-0.09118772, -1.176588, -4.673189, 0, 1, 0.7529412, 1,
-0.09107699, -0.7573461, -2.152459, 0, 1, 0.7607843, 1,
-0.09018685, -0.1648185, -3.465508, 0, 1, 0.7647059, 1,
-0.08770449, -2.114698, -2.418338, 0, 1, 0.772549, 1,
-0.08734464, -0.508926, -1.153453, 0, 1, 0.7764706, 1,
-0.08436254, 0.297033, -0.007282148, 0, 1, 0.7843137, 1,
-0.08293478, -0.9864014, -2.768111, 0, 1, 0.7882353, 1,
-0.08278983, -0.2808213, -2.796176, 0, 1, 0.7960784, 1,
-0.07518332, 2.618299, 0.304722, 0, 1, 0.8039216, 1,
-0.06998929, 2.186208, 2.818693, 0, 1, 0.8078431, 1,
-0.06981716, -2.738276, -2.874332, 0, 1, 0.8156863, 1,
-0.06666386, 0.07910822, -0.4120423, 0, 1, 0.8196079, 1,
-0.06551207, 0.3798347, -0.6617849, 0, 1, 0.827451, 1,
-0.06475076, -1.008675, -2.852385, 0, 1, 0.8313726, 1,
-0.05999583, 2.889957, -1.435208, 0, 1, 0.8392157, 1,
-0.05796187, 0.04128208, -1.158163, 0, 1, 0.8431373, 1,
-0.05721635, 0.3768194, 0.4984947, 0, 1, 0.8509804, 1,
-0.0474766, 0.5078064, 0.9551239, 0, 1, 0.854902, 1,
-0.04711463, -1.314495, -4.08458, 0, 1, 0.8627451, 1,
-0.04267086, -0.2144648, -3.468592, 0, 1, 0.8666667, 1,
-0.03985676, 0.1599906, -0.8677199, 0, 1, 0.8745098, 1,
-0.03757579, 0.3191533, 0.312848, 0, 1, 0.8784314, 1,
-0.03325353, 0.06100833, -0.4825416, 0, 1, 0.8862745, 1,
-0.03251436, 0.5740429, -0.3460571, 0, 1, 0.8901961, 1,
-0.02737085, -2.385729, -4.349247, 0, 1, 0.8980392, 1,
-0.02580336, -0.0521405, -3.149476, 0, 1, 0.9058824, 1,
-0.02361707, 0.3063204, -1.22626, 0, 1, 0.9098039, 1,
-0.02229031, 0.8733838, 0.5527624, 0, 1, 0.9176471, 1,
-0.0203627, -1.141351, -3.568131, 0, 1, 0.9215686, 1,
-0.01983918, 0.7530351, 0.1585112, 0, 1, 0.9294118, 1,
-0.01913452, -0.8778641, -2.625545, 0, 1, 0.9333333, 1,
-0.01834518, 0.1062866, 0.5211941, 0, 1, 0.9411765, 1,
-0.0172882, 0.02065269, -0.6694313, 0, 1, 0.945098, 1,
-0.01478188, -0.6805145, -2.909448, 0, 1, 0.9529412, 1,
-0.01374245, 0.4142762, 0.8292348, 0, 1, 0.9568627, 1,
-0.0116829, -1.234723, -3.635921, 0, 1, 0.9647059, 1,
-0.009251065, -0.008948203, -2.749727, 0, 1, 0.9686275, 1,
-0.005417855, -1.052485, -2.44639, 0, 1, 0.9764706, 1,
0.0009791459, 1.015164, -0.1109616, 0, 1, 0.9803922, 1,
0.006066586, -1.344327, 0.5669917, 0, 1, 0.9882353, 1,
0.01039385, -1.064258, 3.221419, 0, 1, 0.9921569, 1,
0.01283015, -0.0595889, 3.385758, 0, 1, 1, 1,
0.01591247, -1.24394, 5.798715, 0, 0.9921569, 1, 1,
0.01681177, 1.211269, 0.9983938, 0, 0.9882353, 1, 1,
0.01961978, -0.8569134, 3.726741, 0, 0.9803922, 1, 1,
0.02378936, 0.6373579, 0.7465024, 0, 0.9764706, 1, 1,
0.02574963, -0.3305142, 3.242954, 0, 0.9686275, 1, 1,
0.02649271, -1.227064, 6.993407, 0, 0.9647059, 1, 1,
0.02690945, -0.06976328, 4.067566, 0, 0.9568627, 1, 1,
0.02792442, 0.2587773, 0.5161721, 0, 0.9529412, 1, 1,
0.0312421, 1.60581, 1.257137, 0, 0.945098, 1, 1,
0.03283362, 0.6977996, 0.3323664, 0, 0.9411765, 1, 1,
0.03340975, 0.2273764, -0.9261743, 0, 0.9333333, 1, 1,
0.03716195, -0.8816534, 3.860404, 0, 0.9294118, 1, 1,
0.03833162, 1.12426, -0.5568817, 0, 0.9215686, 1, 1,
0.04015685, -0.4066542, 4.153532, 0, 0.9176471, 1, 1,
0.04329346, 0.1323147, -1.519527, 0, 0.9098039, 1, 1,
0.04446438, 0.3488478, 0.954668, 0, 0.9058824, 1, 1,
0.04495364, 0.5901091, 0.6179413, 0, 0.8980392, 1, 1,
0.04893454, 0.2928936, -0.2529011, 0, 0.8901961, 1, 1,
0.05045614, 0.1456428, -0.2177049, 0, 0.8862745, 1, 1,
0.05415393, 0.3840961, -0.6703047, 0, 0.8784314, 1, 1,
0.05865693, 0.4310858, 0.2422084, 0, 0.8745098, 1, 1,
0.06273012, 1.605142, -1.148045, 0, 0.8666667, 1, 1,
0.06347729, 0.02848524, 0.4879071, 0, 0.8627451, 1, 1,
0.06459884, -0.2666544, 2.044378, 0, 0.854902, 1, 1,
0.06650609, 0.282632, -0.638446, 0, 0.8509804, 1, 1,
0.0672278, 1.387292, -0.1429632, 0, 0.8431373, 1, 1,
0.07260859, 0.4975948, 0.3620779, 0, 0.8392157, 1, 1,
0.07488345, -0.4489646, 3.769598, 0, 0.8313726, 1, 1,
0.08304659, -0.2591663, 4.168733, 0, 0.827451, 1, 1,
0.08422926, -0.05939514, 1.758894, 0, 0.8196079, 1, 1,
0.08642831, -1.215115, 2.187839, 0, 0.8156863, 1, 1,
0.09004519, -1.083448, 3.12623, 0, 0.8078431, 1, 1,
0.09034809, -1.027849, 2.713021, 0, 0.8039216, 1, 1,
0.09191655, -0.3344928, 2.322714, 0, 0.7960784, 1, 1,
0.09401441, 0.4223249, 2.284994, 0, 0.7882353, 1, 1,
0.09746215, -1.463221, 2.805626, 0, 0.7843137, 1, 1,
0.09970503, 0.7024924, -1.240154, 0, 0.7764706, 1, 1,
0.1029792, 1.870312, -0.6945444, 0, 0.772549, 1, 1,
0.1034947, 1.020677, 1.239767, 0, 0.7647059, 1, 1,
0.1042274, 0.2872149, 0.1340278, 0, 0.7607843, 1, 1,
0.1044801, -2.175008, 3.122016, 0, 0.7529412, 1, 1,
0.1099274, 1.345586, -0.00586229, 0, 0.7490196, 1, 1,
0.1170085, -0.346588, 3.439591, 0, 0.7411765, 1, 1,
0.1191573, 0.8345285, 1.8567, 0, 0.7372549, 1, 1,
0.1211198, -1.156824, 4.052027, 0, 0.7294118, 1, 1,
0.1223352, -0.591312, 4.940544, 0, 0.7254902, 1, 1,
0.1247058, -1.465123, 2.428946, 0, 0.7176471, 1, 1,
0.1305855, -1.747056, 3.001002, 0, 0.7137255, 1, 1,
0.1347538, 0.866214, 1.413264, 0, 0.7058824, 1, 1,
0.1366725, -0.3317574, 2.443119, 0, 0.6980392, 1, 1,
0.1431227, -0.2286927, 4.797185, 0, 0.6941177, 1, 1,
0.1452335, -1.204941, 4.314699, 0, 0.6862745, 1, 1,
0.1493523, 0.2165539, 0.8130605, 0, 0.682353, 1, 1,
0.1494209, -0.3893561, 2.445047, 0, 0.6745098, 1, 1,
0.1511323, 1.564903, 0.3177097, 0, 0.6705883, 1, 1,
0.1540796, 2.076874, -0.02948719, 0, 0.6627451, 1, 1,
0.1543086, 1.577788, -0.9964976, 0, 0.6588235, 1, 1,
0.1687396, 0.3635089, 1.610387, 0, 0.6509804, 1, 1,
0.1711122, 0.2719145, 1.345562, 0, 0.6470588, 1, 1,
0.1800058, -1.556563, 3.713351, 0, 0.6392157, 1, 1,
0.181769, 0.1047013, 1.09695, 0, 0.6352941, 1, 1,
0.1819886, 0.7556894, 1.043474, 0, 0.627451, 1, 1,
0.1836587, 0.1490885, 0.2439392, 0, 0.6235294, 1, 1,
0.1837674, -0.312884, 2.249692, 0, 0.6156863, 1, 1,
0.1849345, 0.223649, 1.03249, 0, 0.6117647, 1, 1,
0.1908358, 0.5360368, -2.630101, 0, 0.6039216, 1, 1,
0.1916311, -0.8193923, 3.569716, 0, 0.5960785, 1, 1,
0.2020343, 0.4271122, 0.4821599, 0, 0.5921569, 1, 1,
0.2020835, -0.6480668, 3.159552, 0, 0.5843138, 1, 1,
0.2050949, -0.7405444, 2.207315, 0, 0.5803922, 1, 1,
0.2057342, -0.9710566, 4.128778, 0, 0.572549, 1, 1,
0.2058336, -0.3348655, 4.898976, 0, 0.5686275, 1, 1,
0.2068445, 3.377578, -0.9195944, 0, 0.5607843, 1, 1,
0.2086447, -1.145556, 2.931852, 0, 0.5568628, 1, 1,
0.2142607, 0.3426348, 0.08661301, 0, 0.5490196, 1, 1,
0.2165616, 0.5037691, 2.48796, 0, 0.5450981, 1, 1,
0.2194504, -0.2732149, 2.970171, 0, 0.5372549, 1, 1,
0.2199526, -0.8119799, 0.1476441, 0, 0.5333334, 1, 1,
0.2216303, 0.6126054, 0.1944188, 0, 0.5254902, 1, 1,
0.223984, -0.8614052, 2.538249, 0, 0.5215687, 1, 1,
0.2247423, 0.3245609, -0.09402779, 0, 0.5137255, 1, 1,
0.2270052, 0.8000371, 0.718839, 0, 0.509804, 1, 1,
0.2327931, 0.8280862, -0.5927988, 0, 0.5019608, 1, 1,
0.2356393, -1.383296, 2.474047, 0, 0.4941176, 1, 1,
0.2381881, 0.7825746, 0.4302868, 0, 0.4901961, 1, 1,
0.2409506, 1.681038, 0.09496617, 0, 0.4823529, 1, 1,
0.2440876, 0.5378125, -0.04509521, 0, 0.4784314, 1, 1,
0.246254, 0.1953811, 2.370355, 0, 0.4705882, 1, 1,
0.2477216, -0.3300092, 1.930613, 0, 0.4666667, 1, 1,
0.2499065, 0.8453605, -0.940726, 0, 0.4588235, 1, 1,
0.2500137, 0.6468596, -0.6767051, 0, 0.454902, 1, 1,
0.2547326, -0.09236839, 1.238888, 0, 0.4470588, 1, 1,
0.2567149, 1.166643, 0.7708702, 0, 0.4431373, 1, 1,
0.2582328, 1.373034, 1.934444, 0, 0.4352941, 1, 1,
0.2654489, -1.471202, 3.348835, 0, 0.4313726, 1, 1,
0.2670235, -1.522633, 3.780608, 0, 0.4235294, 1, 1,
0.2695638, 0.02738512, 0.9240515, 0, 0.4196078, 1, 1,
0.272178, -0.1013621, 2.263772, 0, 0.4117647, 1, 1,
0.2727877, -1.000714, 2.967633, 0, 0.4078431, 1, 1,
0.2728758, 0.4595209, 0.1194682, 0, 0.4, 1, 1,
0.2770208, 0.6550672, -1.323136, 0, 0.3921569, 1, 1,
0.2776251, 0.7485487, 0.2945518, 0, 0.3882353, 1, 1,
0.2801526, -0.3733446, 2.933228, 0, 0.3803922, 1, 1,
0.2830147, -1.041476, 3.609669, 0, 0.3764706, 1, 1,
0.2927537, 0.2464584, -2.369385, 0, 0.3686275, 1, 1,
0.2971763, 1.517564, -0.1064533, 0, 0.3647059, 1, 1,
0.2979766, 1.391425, 1.032936, 0, 0.3568628, 1, 1,
0.304803, 0.6011631, 2.034423, 0, 0.3529412, 1, 1,
0.3048522, -0.8847486, 3.85979, 0, 0.345098, 1, 1,
0.3127146, -0.04633068, 2.687167, 0, 0.3411765, 1, 1,
0.3206996, 0.295716, 2.117883, 0, 0.3333333, 1, 1,
0.3209401, -0.08301868, 1.377371, 0, 0.3294118, 1, 1,
0.32111, 0.2390804, 0.6877439, 0, 0.3215686, 1, 1,
0.3215594, -1.912792, 3.774168, 0, 0.3176471, 1, 1,
0.3238714, 0.3263228, 0.9244988, 0, 0.3098039, 1, 1,
0.3289736, 0.2363807, 2.398105, 0, 0.3058824, 1, 1,
0.3321021, 1.0239, 0.9576843, 0, 0.2980392, 1, 1,
0.3346542, 0.7822298, -0.1062798, 0, 0.2901961, 1, 1,
0.3429744, 2.028378, -0.211837, 0, 0.2862745, 1, 1,
0.344486, -0.06457677, 2.476809, 0, 0.2784314, 1, 1,
0.3530578, 0.2003872, 1.165015, 0, 0.2745098, 1, 1,
0.3541821, 0.3327407, -0.4906931, 0, 0.2666667, 1, 1,
0.3674277, -0.5622052, -0.1016477, 0, 0.2627451, 1, 1,
0.3689886, 2.271662, 0.3924312, 0, 0.254902, 1, 1,
0.3703882, 0.05048862, 1.933912, 0, 0.2509804, 1, 1,
0.3765892, 0.8852993, 0.3854439, 0, 0.2431373, 1, 1,
0.3803152, -0.8029575, 2.607432, 0, 0.2392157, 1, 1,
0.3811652, -1.189869, 4.047908, 0, 0.2313726, 1, 1,
0.3835489, -0.4940864, 2.495491, 0, 0.227451, 1, 1,
0.3838927, 2.258195, 1.239218, 0, 0.2196078, 1, 1,
0.3839079, -0.8809324, 2.379264, 0, 0.2156863, 1, 1,
0.3864937, -0.5062571, 1.585229, 0, 0.2078431, 1, 1,
0.3889604, -0.2498494, 0.04817755, 0, 0.2039216, 1, 1,
0.3892883, 0.6015654, 1.45341, 0, 0.1960784, 1, 1,
0.394067, -0.5362078, 2.283269, 0, 0.1882353, 1, 1,
0.3948423, 0.7853489, -1.855296, 0, 0.1843137, 1, 1,
0.3972219, -0.8363886, 2.789943, 0, 0.1764706, 1, 1,
0.4000703, 0.4383256, 0.9272122, 0, 0.172549, 1, 1,
0.4004475, 0.4332206, 0.8238854, 0, 0.1647059, 1, 1,
0.4034046, 0.3926772, -0.7038026, 0, 0.1607843, 1, 1,
0.4062112, -0.1920401, 2.832092, 0, 0.1529412, 1, 1,
0.4085982, 0.9630789, -0.1696872, 0, 0.1490196, 1, 1,
0.4182417, 0.9506606, 0.3941257, 0, 0.1411765, 1, 1,
0.422286, 1.217781, -1.420282, 0, 0.1372549, 1, 1,
0.4321992, -0.5929336, 4.130164, 0, 0.1294118, 1, 1,
0.4345153, -1.380732, 2.977041, 0, 0.1254902, 1, 1,
0.4402212, -1.272426, 3.239883, 0, 0.1176471, 1, 1,
0.4420956, -1.500166, 3.51125, 0, 0.1137255, 1, 1,
0.4468053, -0.2000339, 3.411188, 0, 0.1058824, 1, 1,
0.4483844, 0.03585843, 1.415484, 0, 0.09803922, 1, 1,
0.4525099, 1.324854, 0.6334736, 0, 0.09411765, 1, 1,
0.4527821, -0.3213149, 3.17163, 0, 0.08627451, 1, 1,
0.462017, -0.7657596, 1.385112, 0, 0.08235294, 1, 1,
0.4621356, -0.4059435, 2.473698, 0, 0.07450981, 1, 1,
0.4621933, 1.102088, 1.799101, 0, 0.07058824, 1, 1,
0.4760228, 0.7871191, -1.114218, 0, 0.0627451, 1, 1,
0.4811724, 1.36258, -1.118401, 0, 0.05882353, 1, 1,
0.4812149, -0.6320341, 2.282557, 0, 0.05098039, 1, 1,
0.4852968, -0.77694, 1.10827, 0, 0.04705882, 1, 1,
0.4868493, 1.079803, 0.06447665, 0, 0.03921569, 1, 1,
0.4882853, -0.8585364, 3.22376, 0, 0.03529412, 1, 1,
0.4884854, -0.8790258, 1.156753, 0, 0.02745098, 1, 1,
0.4901765, 0.311001, 1.346953, 0, 0.02352941, 1, 1,
0.4933021, 2.289546, 1.520988, 0, 0.01568628, 1, 1,
0.4966988, -1.393477, 2.755683, 0, 0.01176471, 1, 1,
0.4976276, 0.01066122, 2.16023, 0, 0.003921569, 1, 1,
0.4997122, -0.5783146, 2.813833, 0.003921569, 0, 1, 1,
0.5046337, -0.315999, 1.448679, 0.007843138, 0, 1, 1,
0.5048029, -0.5372604, 2.50527, 0.01568628, 0, 1, 1,
0.5094485, -0.3339607, 1.786153, 0.01960784, 0, 1, 1,
0.5104, -1.772589, 2.985125, 0.02745098, 0, 1, 1,
0.511566, 1.123061, 0.4833569, 0.03137255, 0, 1, 1,
0.5117484, -0.6805511, 3.641759, 0.03921569, 0, 1, 1,
0.5141689, 0.1537467, -0.1967507, 0.04313726, 0, 1, 1,
0.5187285, 0.5912661, 2.142739, 0.05098039, 0, 1, 1,
0.5194589, 0.6946355, 2.460247, 0.05490196, 0, 1, 1,
0.5260677, -0.2918248, 2.289535, 0.0627451, 0, 1, 1,
0.5329291, -1.17913, 2.779483, 0.06666667, 0, 1, 1,
0.5390144, 0.3129732, 0.3483604, 0.07450981, 0, 1, 1,
0.5397729, -0.8784029, 2.894939, 0.07843138, 0, 1, 1,
0.5413249, -0.7146718, 2.282866, 0.08627451, 0, 1, 1,
0.5429655, -0.2294801, 2.382621, 0.09019608, 0, 1, 1,
0.5445307, -0.822381, 3.136148, 0.09803922, 0, 1, 1,
0.5544318, 0.01273135, 2.63445, 0.1058824, 0, 1, 1,
0.5632691, 1.710918, 1.6623, 0.1098039, 0, 1, 1,
0.5655494, -0.4346813, 0.7891786, 0.1176471, 0, 1, 1,
0.5661995, -0.6471272, 1.501634, 0.1215686, 0, 1, 1,
0.5693014, 0.6350285, 1.517423, 0.1294118, 0, 1, 1,
0.5709573, 0.2968599, 1.00455, 0.1333333, 0, 1, 1,
0.5814639, 0.3598181, 1.357978, 0.1411765, 0, 1, 1,
0.5842937, 0.4749006, 2.778832, 0.145098, 0, 1, 1,
0.5848822, -0.1464292, 2.516887, 0.1529412, 0, 1, 1,
0.5931265, 0.09731124, 2.009132, 0.1568628, 0, 1, 1,
0.5932423, 0.655977, 0.9575505, 0.1647059, 0, 1, 1,
0.593375, 0.09603728, 1.71726, 0.1686275, 0, 1, 1,
0.6012861, 0.5658779, 1.930475, 0.1764706, 0, 1, 1,
0.6034986, -0.4278989, 2.099216, 0.1803922, 0, 1, 1,
0.6044774, -1.428087, 3.075598, 0.1882353, 0, 1, 1,
0.6073373, 0.1629974, -1.516294, 0.1921569, 0, 1, 1,
0.6078387, 1.428674, 0.2113449, 0.2, 0, 1, 1,
0.6100512, 1.190354, 0.1399159, 0.2078431, 0, 1, 1,
0.610913, -0.3869174, 2.311966, 0.2117647, 0, 1, 1,
0.6131667, -1.046327, 1.557979, 0.2196078, 0, 1, 1,
0.6148339, 0.1502605, 1.269805, 0.2235294, 0, 1, 1,
0.6177825, 0.3360352, 1.000137, 0.2313726, 0, 1, 1,
0.6179927, -0.1626993, 0.1221559, 0.2352941, 0, 1, 1,
0.6204508, 0.01283944, 1.615955, 0.2431373, 0, 1, 1,
0.621823, 0.967482, 0.6256633, 0.2470588, 0, 1, 1,
0.6238366, -0.771551, 2.751054, 0.254902, 0, 1, 1,
0.6332116, 0.8907169, 1.917027, 0.2588235, 0, 1, 1,
0.635116, 0.4842491, 0.966967, 0.2666667, 0, 1, 1,
0.6367318, 0.8413253, 0.01111995, 0.2705882, 0, 1, 1,
0.636994, -1.09864, 2.771885, 0.2784314, 0, 1, 1,
0.6391571, 0.1958912, 0.2485672, 0.282353, 0, 1, 1,
0.6445007, 0.1330102, -0.6305785, 0.2901961, 0, 1, 1,
0.6466933, -0.03498072, 1.630021, 0.2941177, 0, 1, 1,
0.6482207, 1.097828, -1.483396, 0.3019608, 0, 1, 1,
0.6506537, 0.8947036, 1.422706, 0.3098039, 0, 1, 1,
0.6507204, -0.2843434, 0.9266257, 0.3137255, 0, 1, 1,
0.6519522, 1.702171, 1.08497, 0.3215686, 0, 1, 1,
0.6521993, -0.6959805, 1.36268, 0.3254902, 0, 1, 1,
0.6526319, -0.532419, 1.210801, 0.3333333, 0, 1, 1,
0.6529632, 0.7744, -0.6677193, 0.3372549, 0, 1, 1,
0.6561213, -0.5188216, 0.009897583, 0.345098, 0, 1, 1,
0.6638359, 0.6628048, 1.014164, 0.3490196, 0, 1, 1,
0.6643943, 0.6396936, 1.528522, 0.3568628, 0, 1, 1,
0.6652603, 0.4535347, 1.441934, 0.3607843, 0, 1, 1,
0.6700874, -2.348983, 1.339963, 0.3686275, 0, 1, 1,
0.6710488, 1.597815, 2.135898, 0.372549, 0, 1, 1,
0.6715029, 0.518827, 1.507635, 0.3803922, 0, 1, 1,
0.6789964, -0.8728728, 3.553353, 0.3843137, 0, 1, 1,
0.679825, -0.7371522, 3.016381, 0.3921569, 0, 1, 1,
0.6802339, 0.1634876, 0.6447674, 0.3960784, 0, 1, 1,
0.6847292, 0.5246079, -0.3119846, 0.4039216, 0, 1, 1,
0.6855898, -1.093554, 2.630323, 0.4117647, 0, 1, 1,
0.6858468, -0.4233652, 4.605214, 0.4156863, 0, 1, 1,
0.6863743, -0.4005411, 1.656081, 0.4235294, 0, 1, 1,
0.686768, 0.1147338, 2.293063, 0.427451, 0, 1, 1,
0.688813, -0.7253752, 2.171597, 0.4352941, 0, 1, 1,
0.6925762, 0.4286712, 0.1349135, 0.4392157, 0, 1, 1,
0.693343, 0.1381701, 1.443039, 0.4470588, 0, 1, 1,
0.6956682, 0.6628133, 0.3703128, 0.4509804, 0, 1, 1,
0.6967755, -0.6001895, 1.975734, 0.4588235, 0, 1, 1,
0.6985615, 1.003896, 0.1767339, 0.4627451, 0, 1, 1,
0.7037246, -1.246109, 2.385558, 0.4705882, 0, 1, 1,
0.7038889, -1.428788, 1.550052, 0.4745098, 0, 1, 1,
0.7058045, 0.6381036, 0.8352543, 0.4823529, 0, 1, 1,
0.7084846, -0.2543943, 1.952257, 0.4862745, 0, 1, 1,
0.7091253, 0.8092687, 2.648027, 0.4941176, 0, 1, 1,
0.7126815, -1.301319, 2.266285, 0.5019608, 0, 1, 1,
0.7139503, -0.5974052, 1.70313, 0.5058824, 0, 1, 1,
0.7187735, -1.472489, 2.725881, 0.5137255, 0, 1, 1,
0.7201259, -0.7223123, 4.371601, 0.5176471, 0, 1, 1,
0.7238752, 1.341081, -0.6799626, 0.5254902, 0, 1, 1,
0.7253644, -0.1212164, 0.9476979, 0.5294118, 0, 1, 1,
0.7271205, -1.441454, 3.793527, 0.5372549, 0, 1, 1,
0.7274944, 1.698081, -0.09159833, 0.5411765, 0, 1, 1,
0.7284152, -0.4478576, 3.38161, 0.5490196, 0, 1, 1,
0.7322941, -0.4088975, 1.369876, 0.5529412, 0, 1, 1,
0.7345944, 0.9379963, 1.06008, 0.5607843, 0, 1, 1,
0.7396163, -1.480764, 4.041563, 0.5647059, 0, 1, 1,
0.7409487, -0.3509707, 1.215531, 0.572549, 0, 1, 1,
0.74097, 2.632138, -1.107852, 0.5764706, 0, 1, 1,
0.7474435, -0.3989985, 1.639588, 0.5843138, 0, 1, 1,
0.7481137, -0.6498298, 2.196968, 0.5882353, 0, 1, 1,
0.7490265, -0.2336879, 1.071039, 0.5960785, 0, 1, 1,
0.7532874, -0.7030036, 2.540059, 0.6039216, 0, 1, 1,
0.754105, 1.476773, -0.7551849, 0.6078432, 0, 1, 1,
0.7570009, 0.5562993, 3.598631, 0.6156863, 0, 1, 1,
0.7576564, -0.3716607, 3.74444, 0.6196079, 0, 1, 1,
0.7591395, 1.92718, 2.944539, 0.627451, 0, 1, 1,
0.7668065, -0.7872025, 3.745826, 0.6313726, 0, 1, 1,
0.7774976, 1.608067, 0.520732, 0.6392157, 0, 1, 1,
0.7798268, 1.012444, -1.743535, 0.6431373, 0, 1, 1,
0.781631, -0.4344039, 1.612324, 0.6509804, 0, 1, 1,
0.7825069, -0.1129771, 0.2522361, 0.654902, 0, 1, 1,
0.7857059, -1.040146, 3.269455, 0.6627451, 0, 1, 1,
0.7872955, 0.5126377, 1.233161, 0.6666667, 0, 1, 1,
0.7930713, -0.4579834, 1.904969, 0.6745098, 0, 1, 1,
0.7996579, 0.5267238, 1.016904, 0.6784314, 0, 1, 1,
0.8020479, -0.7176052, 2.821574, 0.6862745, 0, 1, 1,
0.8066512, 1.536001, 0.2743317, 0.6901961, 0, 1, 1,
0.8107453, 0.3921879, 0.8130177, 0.6980392, 0, 1, 1,
0.8210828, -1.536106, 1.911563, 0.7058824, 0, 1, 1,
0.8223358, -0.674657, 3.75285, 0.7098039, 0, 1, 1,
0.8307742, 0.2482658, 0.66596, 0.7176471, 0, 1, 1,
0.833983, 0.3169635, 2.726474, 0.7215686, 0, 1, 1,
0.8399792, 1.058249, 0.8601843, 0.7294118, 0, 1, 1,
0.8413661, 0.9619484, 1.825989, 0.7333333, 0, 1, 1,
0.8425612, 0.08717977, 1.510432, 0.7411765, 0, 1, 1,
0.8469877, 0.7105774, 0.347793, 0.7450981, 0, 1, 1,
0.8472089, -0.3216544, 1.617985, 0.7529412, 0, 1, 1,
0.8485172, -1.861877, 3.370411, 0.7568628, 0, 1, 1,
0.8509943, -1.346811, 1.330507, 0.7647059, 0, 1, 1,
0.8542162, -0.4218087, 4.760437, 0.7686275, 0, 1, 1,
0.8568951, -1.049238, 2.850368, 0.7764706, 0, 1, 1,
0.8592793, -0.05671911, 0.6569368, 0.7803922, 0, 1, 1,
0.8599257, -0.5140164, 2.761627, 0.7882353, 0, 1, 1,
0.8649175, -0.246033, 2.910563, 0.7921569, 0, 1, 1,
0.8679248, -0.5503048, 1.211316, 0.8, 0, 1, 1,
0.8738001, 0.04468589, 0.9813827, 0.8078431, 0, 1, 1,
0.8738881, -0.546396, 1.5127, 0.8117647, 0, 1, 1,
0.8756464, -0.1163453, 1.097565, 0.8196079, 0, 1, 1,
0.8769631, -1.24468, 2.718761, 0.8235294, 0, 1, 1,
0.9128173, 1.8352, 1.539105, 0.8313726, 0, 1, 1,
0.9172279, -1.088302, 4.217575, 0.8352941, 0, 1, 1,
0.9180049, -1.7453, 3.005613, 0.8431373, 0, 1, 1,
0.923289, 0.2899287, 2.499919, 0.8470588, 0, 1, 1,
0.9355034, -1.677697, 3.580042, 0.854902, 0, 1, 1,
0.9398499, 1.005908, 2.164174, 0.8588235, 0, 1, 1,
0.9410959, -0.5631139, 2.608081, 0.8666667, 0, 1, 1,
0.9434815, -0.5976605, 2.27419, 0.8705882, 0, 1, 1,
0.9448929, 0.305288, 2.01412, 0.8784314, 0, 1, 1,
0.9494133, -0.05492619, 2.228433, 0.8823529, 0, 1, 1,
0.9496199, 1.031126, 1.171764, 0.8901961, 0, 1, 1,
0.956689, -1.441614, 2.952602, 0.8941177, 0, 1, 1,
0.9569219, 0.352598, 0.02027148, 0.9019608, 0, 1, 1,
0.9602281, -0.1187136, 0.8530418, 0.9098039, 0, 1, 1,
0.9625999, -1.38071, 1.986707, 0.9137255, 0, 1, 1,
0.9640183, -0.1984407, 1.323409, 0.9215686, 0, 1, 1,
0.9654215, -0.6392254, 3.293663, 0.9254902, 0, 1, 1,
0.9684926, 0.5631331, 1.892979, 0.9333333, 0, 1, 1,
0.9701294, -1.601561, 3.059636, 0.9372549, 0, 1, 1,
0.9772242, 0.7404257, -0.06011144, 0.945098, 0, 1, 1,
0.9774907, 0.306835, 1.981845, 0.9490196, 0, 1, 1,
0.9950148, -0.4548517, 2.901109, 0.9568627, 0, 1, 1,
1.004269, 1.11008, 0.4743391, 0.9607843, 0, 1, 1,
1.008096, 0.3277727, 2.41193, 0.9686275, 0, 1, 1,
1.013856, 1.394185, 0.3980001, 0.972549, 0, 1, 1,
1.021085, -1.489197, 3.157147, 0.9803922, 0, 1, 1,
1.021481, -0.8153028, 1.772298, 0.9843137, 0, 1, 1,
1.029675, -0.007816358, 0.2242723, 0.9921569, 0, 1, 1,
1.033486, -0.1850296, 2.898417, 0.9960784, 0, 1, 1,
1.035672, -0.1459347, 2.39504, 1, 0, 0.9960784, 1,
1.040289, 1.86818, 0.6958068, 1, 0, 0.9882353, 1,
1.040537, 0.3604896, 0.5842483, 1, 0, 0.9843137, 1,
1.042964, -1.310468, 0.581381, 1, 0, 0.9764706, 1,
1.05122, -2.34629, 3.437284, 1, 0, 0.972549, 1,
1.054667, 0.04886152, 2.505471, 1, 0, 0.9647059, 1,
1.054937, -0.6148233, 1.773833, 1, 0, 0.9607843, 1,
1.056434, 0.02382886, 3.047403, 1, 0, 0.9529412, 1,
1.067577, -1.488697, 2.362558, 1, 0, 0.9490196, 1,
1.084716, -2.256478, 2.495975, 1, 0, 0.9411765, 1,
1.084741, -0.1818378, 0.7353771, 1, 0, 0.9372549, 1,
1.091078, -0.6040848, 1.893955, 1, 0, 0.9294118, 1,
1.103578, -1.274797, 1.994394, 1, 0, 0.9254902, 1,
1.103689, 0.06550595, 1.655539, 1, 0, 0.9176471, 1,
1.111375, 0.235696, 0.6519811, 1, 0, 0.9137255, 1,
1.112498, -0.5419345, 3.836466, 1, 0, 0.9058824, 1,
1.118356, 0.5446607, 2.659137, 1, 0, 0.9019608, 1,
1.119453, 0.3695207, 0.8686661, 1, 0, 0.8941177, 1,
1.1239, -0.2651522, 0.3588099, 1, 0, 0.8862745, 1,
1.124899, -0.7113463, 2.19425, 1, 0, 0.8823529, 1,
1.126453, -0.3849358, 2.754094, 1, 0, 0.8745098, 1,
1.140434, -0.1892877, 0.4556074, 1, 0, 0.8705882, 1,
1.155693, 0.8726749, 1.887845, 1, 0, 0.8627451, 1,
1.156692, -0.08121389, 0.5728379, 1, 0, 0.8588235, 1,
1.163671, 0.2795464, 1.354191, 1, 0, 0.8509804, 1,
1.16892, 0.2204015, 1.253936, 1, 0, 0.8470588, 1,
1.173977, -2.551901, 2.116373, 1, 0, 0.8392157, 1,
1.174892, 0.663965, 1.523134, 1, 0, 0.8352941, 1,
1.176558, -1.19884, 2.004564, 1, 0, 0.827451, 1,
1.179954, -0.05954816, 1.955966, 1, 0, 0.8235294, 1,
1.179996, -0.8588343, 2.576619, 1, 0, 0.8156863, 1,
1.183023, 0.2395952, -0.5159236, 1, 0, 0.8117647, 1,
1.192507, 1.370122, 0.2435833, 1, 0, 0.8039216, 1,
1.195656, 0.836163, 0.7594893, 1, 0, 0.7960784, 1,
1.198467, -0.7701834, 2.127181, 1, 0, 0.7921569, 1,
1.1985, -1.673287, 2.598109, 1, 0, 0.7843137, 1,
1.206027, -1.313892, 2.720999, 1, 0, 0.7803922, 1,
1.206059, 0.4586379, -0.05541461, 1, 0, 0.772549, 1,
1.208794, 0.2695535, 1.105857, 1, 0, 0.7686275, 1,
1.210024, 0.1461957, 0.624508, 1, 0, 0.7607843, 1,
1.226044, -0.5270477, 0.3909186, 1, 0, 0.7568628, 1,
1.232359, -0.9356028, 1.745242, 1, 0, 0.7490196, 1,
1.23241, -0.8547406, 3.644462, 1, 0, 0.7450981, 1,
1.24991, -1.300666, 1.869032, 1, 0, 0.7372549, 1,
1.259569, 1.476254, 1.429729, 1, 0, 0.7333333, 1,
1.273637, 0.530326, 0.6215418, 1, 0, 0.7254902, 1,
1.277311, -0.8733755, 1.920387, 1, 0, 0.7215686, 1,
1.277325, -0.4159954, 1.325317, 1, 0, 0.7137255, 1,
1.279377, 1.033148, 0.436472, 1, 0, 0.7098039, 1,
1.279739, 0.6944035, 0.6262261, 1, 0, 0.7019608, 1,
1.283238, -1.171147, 1.439265, 1, 0, 0.6941177, 1,
1.291144, 1.320513, 1.726781, 1, 0, 0.6901961, 1,
1.300275, 2.299102, 0.207917, 1, 0, 0.682353, 1,
1.303957, 0.8592273, 0.7363484, 1, 0, 0.6784314, 1,
1.310417, 1.441803, 0.09679098, 1, 0, 0.6705883, 1,
1.312792, 0.3493642, 1.095681, 1, 0, 0.6666667, 1,
1.313785, -0.2619371, 0.5401018, 1, 0, 0.6588235, 1,
1.321368, 0.07402289, 2.814824, 1, 0, 0.654902, 1,
1.322123, -0.5261899, 2.01442, 1, 0, 0.6470588, 1,
1.326921, 0.2274078, 3.737862, 1, 0, 0.6431373, 1,
1.330894, -0.8814093, 2.008196, 1, 0, 0.6352941, 1,
1.331532, -0.589166, 1.101626, 1, 0, 0.6313726, 1,
1.342066, -0.1412589, 1.969306, 1, 0, 0.6235294, 1,
1.35465, 0.6698701, -0.319176, 1, 0, 0.6196079, 1,
1.356834, 1.041205, -0.5934871, 1, 0, 0.6117647, 1,
1.366767, 0.3596087, 3.13122, 1, 0, 0.6078432, 1,
1.367167, 2.015957, 1.688606, 1, 0, 0.6, 1,
1.373761, -0.9026628, 0.758812, 1, 0, 0.5921569, 1,
1.382602, 1.960058, 1.543042, 1, 0, 0.5882353, 1,
1.38487, 0.3693376, 1.880925, 1, 0, 0.5803922, 1,
1.38601, -1.680745, 3.913446, 1, 0, 0.5764706, 1,
1.386404, -1.050471, -0.02325292, 1, 0, 0.5686275, 1,
1.391748, 0.1661395, 1.339744, 1, 0, 0.5647059, 1,
1.392688, 1.148426, 0.2607923, 1, 0, 0.5568628, 1,
1.39368, -0.8174821, 0.6934584, 1, 0, 0.5529412, 1,
1.404275, -0.2555766, 2.502085, 1, 0, 0.5450981, 1,
1.404654, 0.2372628, 1.513851, 1, 0, 0.5411765, 1,
1.415228, -1.024065, 3.576701, 1, 0, 0.5333334, 1,
1.418882, 2.431508, 0.5618217, 1, 0, 0.5294118, 1,
1.427107, 0.3584828, 1.309699, 1, 0, 0.5215687, 1,
1.446317, -0.3034364, 2.201649, 1, 0, 0.5176471, 1,
1.44716, -0.498056, 2.292785, 1, 0, 0.509804, 1,
1.450867, -1.163902, 3.721773, 1, 0, 0.5058824, 1,
1.452575, -1.085915, 1.453006, 1, 0, 0.4980392, 1,
1.455733, -0.486488, -0.01294858, 1, 0, 0.4901961, 1,
1.458562, -2.51241, 3.142911, 1, 0, 0.4862745, 1,
1.471018, -0.8009074, 2.265342, 1, 0, 0.4784314, 1,
1.480373, -0.5890893, 2.060729, 1, 0, 0.4745098, 1,
1.485287, -0.04927077, 1.438295, 1, 0, 0.4666667, 1,
1.495255, -0.6973084, 2.778595, 1, 0, 0.4627451, 1,
1.495389, -1.488503, 2.878451, 1, 0, 0.454902, 1,
1.515925, -0.06038665, 1.242597, 1, 0, 0.4509804, 1,
1.51772, -0.5617679, 2.315473, 1, 0, 0.4431373, 1,
1.523891, 0.5341324, 2.368059, 1, 0, 0.4392157, 1,
1.525237, 0.7056679, -0.4619514, 1, 0, 0.4313726, 1,
1.542372, -1.106701, 3.018228, 1, 0, 0.427451, 1,
1.543295, -0.7996917, 1.635, 1, 0, 0.4196078, 1,
1.544741, 0.8686384, 0.8841096, 1, 0, 0.4156863, 1,
1.548819, -0.3964811, -1.120342, 1, 0, 0.4078431, 1,
1.565823, -0.6592814, 2.20757, 1, 0, 0.4039216, 1,
1.571719, -0.3327304, 2.046296, 1, 0, 0.3960784, 1,
1.580064, -0.3966747, 1.355622, 1, 0, 0.3882353, 1,
1.580108, -1.080683, 2.964412, 1, 0, 0.3843137, 1,
1.584733, -0.04634268, 0.3546006, 1, 0, 0.3764706, 1,
1.587954, 1.128239, 3.460331, 1, 0, 0.372549, 1,
1.589604, -1.512099, 2.705041, 1, 0, 0.3647059, 1,
1.592858, -1.283167, 1.131143, 1, 0, 0.3607843, 1,
1.623698, 1.417641, 3.546682, 1, 0, 0.3529412, 1,
1.636276, 1.065184, 1.404649, 1, 0, 0.3490196, 1,
1.659526, -0.5397223, 2.248568, 1, 0, 0.3411765, 1,
1.666771, 0.5893928, 1.882187, 1, 0, 0.3372549, 1,
1.704994, -2.282145, 1.540458, 1, 0, 0.3294118, 1,
1.731027, 2.632252, 1.259304, 1, 0, 0.3254902, 1,
1.741496, 0.8442073, 1.895362, 1, 0, 0.3176471, 1,
1.74335, 0.1963787, 1.567878, 1, 0, 0.3137255, 1,
1.746034, 1.215014, 0.8679099, 1, 0, 0.3058824, 1,
1.747618, 0.7468811, 1.124964, 1, 0, 0.2980392, 1,
1.756196, 0.3041321, 1.132096, 1, 0, 0.2941177, 1,
1.765322, 0.3754102, -0.4470415, 1, 0, 0.2862745, 1,
1.770663, -0.6716645, 1.602968, 1, 0, 0.282353, 1,
1.784628, -1.370379, 3.076446, 1, 0, 0.2745098, 1,
1.792505, -0.3507657, 2.741435, 1, 0, 0.2705882, 1,
1.808528, 0.2246516, 1.050385, 1, 0, 0.2627451, 1,
1.818601, 0.4376528, 1.619229, 1, 0, 0.2588235, 1,
1.821645, -0.9995435, 3.242295, 1, 0, 0.2509804, 1,
1.847258, -0.06385639, -0.2287626, 1, 0, 0.2470588, 1,
1.854127, 0.7914134, 1.006052, 1, 0, 0.2392157, 1,
1.863697, 0.1458622, 1.288933, 1, 0, 0.2352941, 1,
1.929622, 0.006205202, 1.781613, 1, 0, 0.227451, 1,
1.933437, -0.842026, 3.001268, 1, 0, 0.2235294, 1,
1.937111, 0.5764199, -0.06670247, 1, 0, 0.2156863, 1,
1.951619, -0.5358687, 2.126514, 1, 0, 0.2117647, 1,
1.954352, -0.6319761, 1.588587, 1, 0, 0.2039216, 1,
1.974747, -0.2152758, 2.104547, 1, 0, 0.1960784, 1,
1.97812, -1.396418, 3.20818, 1, 0, 0.1921569, 1,
1.983141, -0.8976098, 1.800793, 1, 0, 0.1843137, 1,
2.024978, -0.6229455, 3.056043, 1, 0, 0.1803922, 1,
2.034736, -0.7204543, 2.041082, 1, 0, 0.172549, 1,
2.038421, -0.5842431, 1.084011, 1, 0, 0.1686275, 1,
2.038728, -0.2121222, 1.837484, 1, 0, 0.1607843, 1,
2.047678, 0.8654194, 0.7862147, 1, 0, 0.1568628, 1,
2.076291, 2.159114, 0.6153098, 1, 0, 0.1490196, 1,
2.097917, -0.1047556, 1.20311, 1, 0, 0.145098, 1,
2.133976, -1.570464, 0.8619361, 1, 0, 0.1372549, 1,
2.189478, 0.5968065, 0.6315728, 1, 0, 0.1333333, 1,
2.217514, -1.232328, 0.7808556, 1, 0, 0.1254902, 1,
2.276589, 0.06628881, -0.1520217, 1, 0, 0.1215686, 1,
2.280866, -0.6000534, 2.553676, 1, 0, 0.1137255, 1,
2.285967, -0.3719843, 1.401794, 1, 0, 0.1098039, 1,
2.289125, -1.745537, 2.157289, 1, 0, 0.1019608, 1,
2.302421, 0.7483496, 2.652885, 1, 0, 0.09411765, 1,
2.309879, 0.188741, 1.800356, 1, 0, 0.09019608, 1,
2.313815, 0.2098384, 0.8060013, 1, 0, 0.08235294, 1,
2.315077, 1.483488, 0.7905714, 1, 0, 0.07843138, 1,
2.330629, 0.436382, 3.540572, 1, 0, 0.07058824, 1,
2.33521, 0.1489196, 0.4471194, 1, 0, 0.06666667, 1,
2.402474, 0.08326107, 1.429243, 1, 0, 0.05882353, 1,
2.428845, -1.1373, 1.781379, 1, 0, 0.05490196, 1,
2.463404, -0.1458541, 0.3521071, 1, 0, 0.04705882, 1,
2.476049, 0.2842998, 1.527678, 1, 0, 0.04313726, 1,
2.549214, -0.3799384, 2.12379, 1, 0, 0.03529412, 1,
2.604711, -0.2349238, 2.007882, 1, 0, 0.03137255, 1,
2.618087, 2.207977, 0.7082003, 1, 0, 0.02352941, 1,
2.671301, 0.2998731, 0.7493109, 1, 0, 0.01960784, 1,
2.975767, 0.3658999, 1.575969, 1, 0, 0.01176471, 1,
3.009849, 2.042407, 2.487542, 1, 0, 0.007843138, 1
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
0.07405865, -3.774913, -7.346945, 0, -0.5, 0.5, 0.5,
0.07405865, -3.774913, -7.346945, 1, -0.5, 0.5, 0.5,
0.07405865, -3.774913, -7.346945, 1, 1.5, 0.5, 0.5,
0.07405865, -3.774913, -7.346945, 0, 1.5, 0.5, 0.5
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
-3.856965, 0.3196514, -7.346945, 0, -0.5, 0.5, 0.5,
-3.856965, 0.3196514, -7.346945, 1, -0.5, 0.5, 0.5,
-3.856965, 0.3196514, -7.346945, 1, 1.5, 0.5, 0.5,
-3.856965, 0.3196514, -7.346945, 0, 1.5, 0.5, 0.5
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
-3.856965, -3.774913, 0.8624313, 0, -0.5, 0.5, 0.5,
-3.856965, -3.774913, 0.8624313, 1, -0.5, 0.5, 0.5,
-3.856965, -3.774913, 0.8624313, 1, 1.5, 0.5, 0.5,
-3.856965, -3.774913, 0.8624313, 0, 1.5, 0.5, 0.5
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
-2, -2.830014, -5.452474,
3, -2.830014, -5.452474,
-2, -2.830014, -5.452474,
-2, -2.987497, -5.768219,
-1, -2.830014, -5.452474,
-1, -2.987497, -5.768219,
0, -2.830014, -5.452474,
0, -2.987497, -5.768219,
1, -2.830014, -5.452474,
1, -2.987497, -5.768219,
2, -2.830014, -5.452474,
2, -2.987497, -5.768219,
3, -2.830014, -5.452474,
3, -2.987497, -5.768219
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
-2, -3.302463, -6.399709, 0, -0.5, 0.5, 0.5,
-2, -3.302463, -6.399709, 1, -0.5, 0.5, 0.5,
-2, -3.302463, -6.399709, 1, 1.5, 0.5, 0.5,
-2, -3.302463, -6.399709, 0, 1.5, 0.5, 0.5,
-1, -3.302463, -6.399709, 0, -0.5, 0.5, 0.5,
-1, -3.302463, -6.399709, 1, -0.5, 0.5, 0.5,
-1, -3.302463, -6.399709, 1, 1.5, 0.5, 0.5,
-1, -3.302463, -6.399709, 0, 1.5, 0.5, 0.5,
0, -3.302463, -6.399709, 0, -0.5, 0.5, 0.5,
0, -3.302463, -6.399709, 1, -0.5, 0.5, 0.5,
0, -3.302463, -6.399709, 1, 1.5, 0.5, 0.5,
0, -3.302463, -6.399709, 0, 1.5, 0.5, 0.5,
1, -3.302463, -6.399709, 0, -0.5, 0.5, 0.5,
1, -3.302463, -6.399709, 1, -0.5, 0.5, 0.5,
1, -3.302463, -6.399709, 1, 1.5, 0.5, 0.5,
1, -3.302463, -6.399709, 0, 1.5, 0.5, 0.5,
2, -3.302463, -6.399709, 0, -0.5, 0.5, 0.5,
2, -3.302463, -6.399709, 1, -0.5, 0.5, 0.5,
2, -3.302463, -6.399709, 1, 1.5, 0.5, 0.5,
2, -3.302463, -6.399709, 0, 1.5, 0.5, 0.5,
3, -3.302463, -6.399709, 0, -0.5, 0.5, 0.5,
3, -3.302463, -6.399709, 1, -0.5, 0.5, 0.5,
3, -3.302463, -6.399709, 1, 1.5, 0.5, 0.5,
3, -3.302463, -6.399709, 0, 1.5, 0.5, 0.5
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
-2.949806, -2, -5.452474,
-2.949806, 3, -5.452474,
-2.949806, -2, -5.452474,
-3.100999, -2, -5.768219,
-2.949806, -1, -5.452474,
-3.100999, -1, -5.768219,
-2.949806, 0, -5.452474,
-3.100999, 0, -5.768219,
-2.949806, 1, -5.452474,
-3.100999, 1, -5.768219,
-2.949806, 2, -5.452474,
-3.100999, 2, -5.768219,
-2.949806, 3, -5.452474,
-3.100999, 3, -5.768219
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
-3.403385, -2, -6.399709, 0, -0.5, 0.5, 0.5,
-3.403385, -2, -6.399709, 1, -0.5, 0.5, 0.5,
-3.403385, -2, -6.399709, 1, 1.5, 0.5, 0.5,
-3.403385, -2, -6.399709, 0, 1.5, 0.5, 0.5,
-3.403385, -1, -6.399709, 0, -0.5, 0.5, 0.5,
-3.403385, -1, -6.399709, 1, -0.5, 0.5, 0.5,
-3.403385, -1, -6.399709, 1, 1.5, 0.5, 0.5,
-3.403385, -1, -6.399709, 0, 1.5, 0.5, 0.5,
-3.403385, 0, -6.399709, 0, -0.5, 0.5, 0.5,
-3.403385, 0, -6.399709, 1, -0.5, 0.5, 0.5,
-3.403385, 0, -6.399709, 1, 1.5, 0.5, 0.5,
-3.403385, 0, -6.399709, 0, 1.5, 0.5, 0.5,
-3.403385, 1, -6.399709, 0, -0.5, 0.5, 0.5,
-3.403385, 1, -6.399709, 1, -0.5, 0.5, 0.5,
-3.403385, 1, -6.399709, 1, 1.5, 0.5, 0.5,
-3.403385, 1, -6.399709, 0, 1.5, 0.5, 0.5,
-3.403385, 2, -6.399709, 0, -0.5, 0.5, 0.5,
-3.403385, 2, -6.399709, 1, -0.5, 0.5, 0.5,
-3.403385, 2, -6.399709, 1, 1.5, 0.5, 0.5,
-3.403385, 2, -6.399709, 0, 1.5, 0.5, 0.5,
-3.403385, 3, -6.399709, 0, -0.5, 0.5, 0.5,
-3.403385, 3, -6.399709, 1, -0.5, 0.5, 0.5,
-3.403385, 3, -6.399709, 1, 1.5, 0.5, 0.5,
-3.403385, 3, -6.399709, 0, 1.5, 0.5, 0.5
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
-2.949806, -2.830014, -4,
-2.949806, -2.830014, 6,
-2.949806, -2.830014, -4,
-3.100999, -2.987497, -4,
-2.949806, -2.830014, -2,
-3.100999, -2.987497, -2,
-2.949806, -2.830014, 0,
-3.100999, -2.987497, 0,
-2.949806, -2.830014, 2,
-3.100999, -2.987497, 2,
-2.949806, -2.830014, 4,
-3.100999, -2.987497, 4,
-2.949806, -2.830014, 6,
-3.100999, -2.987497, 6
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
-3.403385, -3.302463, -4, 0, -0.5, 0.5, 0.5,
-3.403385, -3.302463, -4, 1, -0.5, 0.5, 0.5,
-3.403385, -3.302463, -4, 1, 1.5, 0.5, 0.5,
-3.403385, -3.302463, -4, 0, 1.5, 0.5, 0.5,
-3.403385, -3.302463, -2, 0, -0.5, 0.5, 0.5,
-3.403385, -3.302463, -2, 1, -0.5, 0.5, 0.5,
-3.403385, -3.302463, -2, 1, 1.5, 0.5, 0.5,
-3.403385, -3.302463, -2, 0, 1.5, 0.5, 0.5,
-3.403385, -3.302463, 0, 0, -0.5, 0.5, 0.5,
-3.403385, -3.302463, 0, 1, -0.5, 0.5, 0.5,
-3.403385, -3.302463, 0, 1, 1.5, 0.5, 0.5,
-3.403385, -3.302463, 0, 0, 1.5, 0.5, 0.5,
-3.403385, -3.302463, 2, 0, -0.5, 0.5, 0.5,
-3.403385, -3.302463, 2, 1, -0.5, 0.5, 0.5,
-3.403385, -3.302463, 2, 1, 1.5, 0.5, 0.5,
-3.403385, -3.302463, 2, 0, 1.5, 0.5, 0.5,
-3.403385, -3.302463, 4, 0, -0.5, 0.5, 0.5,
-3.403385, -3.302463, 4, 1, -0.5, 0.5, 0.5,
-3.403385, -3.302463, 4, 1, 1.5, 0.5, 0.5,
-3.403385, -3.302463, 4, 0, 1.5, 0.5, 0.5,
-3.403385, -3.302463, 6, 0, -0.5, 0.5, 0.5,
-3.403385, -3.302463, 6, 1, -0.5, 0.5, 0.5,
-3.403385, -3.302463, 6, 1, 1.5, 0.5, 0.5,
-3.403385, -3.302463, 6, 0, 1.5, 0.5, 0.5
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
-2.949806, -2.830014, -5.452474,
-2.949806, 3.469316, -5.452474,
-2.949806, -2.830014, 7.177336,
-2.949806, 3.469316, 7.177336,
-2.949806, -2.830014, -5.452474,
-2.949806, -2.830014, 7.177336,
-2.949806, 3.469316, -5.452474,
-2.949806, 3.469316, 7.177336,
-2.949806, -2.830014, -5.452474,
3.097923, -2.830014, -5.452474,
-2.949806, -2.830014, 7.177336,
3.097923, -2.830014, 7.177336,
-2.949806, 3.469316, -5.452474,
3.097923, 3.469316, -5.452474,
-2.949806, 3.469316, 7.177336,
3.097923, 3.469316, 7.177336,
3.097923, -2.830014, -5.452474,
3.097923, 3.469316, -5.452474,
3.097923, -2.830014, 7.177336,
3.097923, 3.469316, 7.177336,
3.097923, -2.830014, -5.452474,
3.097923, -2.830014, 7.177336,
3.097923, 3.469316, -5.452474,
3.097923, 3.469316, 7.177336
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
var radius = 8.199144;
var distance = 36.47892;
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
mvMatrix.translate( -0.07405865, -0.3196514, -0.8624313 );
mvMatrix.scale( 1.465852, 1.407304, 0.7019168 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.47892);
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
methylcarbamate<-read.table("methylcarbamate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methylcarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate' not found
```

```r
y<-methylcarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate' not found
```

```r
z<-methylcarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate' not found
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
-2.861732, 0.7334196, -1.516173, 0, 0, 1, 1, 1,
-2.800187, 0.2855061, -1.436406, 1, 0, 0, 1, 1,
-2.709602, -1.457509, -2.818177, 1, 0, 0, 1, 1,
-2.513494, 0.5474712, -1.307021, 1, 0, 0, 1, 1,
-2.510552, 0.3640611, -2.037002, 1, 0, 0, 1, 1,
-2.445488, -0.5858779, -0.1351016, 1, 0, 0, 1, 1,
-2.433191, 0.2610752, -0.3930731, 0, 0, 0, 1, 1,
-2.319767, 1.193276, -1.236754, 0, 0, 0, 1, 1,
-2.309487, -1.099782, -1.856602, 0, 0, 0, 1, 1,
-2.298832, 1.683481, -2.310596, 0, 0, 0, 1, 1,
-2.260878, -0.2903089, -1.933334, 0, 0, 0, 1, 1,
-2.199838, -0.3645272, -2.253347, 0, 0, 0, 1, 1,
-2.168969, -0.4548234, -2.384562, 0, 0, 0, 1, 1,
-2.160427, 0.1038475, -1.374987, 1, 1, 1, 1, 1,
-2.126101, -1.233507, -2.047263, 1, 1, 1, 1, 1,
-2.12114, 0.226576, -1.559997, 1, 1, 1, 1, 1,
-2.120728, -1.661154, -2.403836, 1, 1, 1, 1, 1,
-2.078402, 1.032341, -2.587824, 1, 1, 1, 1, 1,
-2.064083, 1.333925, -1.417969, 1, 1, 1, 1, 1,
-2.061136, 0.3808955, -0.2857497, 1, 1, 1, 1, 1,
-2.0288, -0.5433136, -1.796905, 1, 1, 1, 1, 1,
-2.021879, 0.926994, -0.9319556, 1, 1, 1, 1, 1,
-2.021543, 0.03325144, -0.8182198, 1, 1, 1, 1, 1,
-2.015633, -0.701156, -2.073472, 1, 1, 1, 1, 1,
-1.999866, -0.1602362, -2.007227, 1, 1, 1, 1, 1,
-1.967854, 0.800006, -0.658896, 1, 1, 1, 1, 1,
-1.964812, -0.1518551, -1.568591, 1, 1, 1, 1, 1,
-1.95895, -0.7251617, -2.160826, 1, 1, 1, 1, 1,
-1.947409, -1.060021, -2.27132, 0, 0, 1, 1, 1,
-1.936345, -0.2545458, -1.487869, 1, 0, 0, 1, 1,
-1.921013, 0.4384612, 0.5774063, 1, 0, 0, 1, 1,
-1.840505, 0.9651402, -0.9042732, 1, 0, 0, 1, 1,
-1.813342, 1.208317, -1.221688, 1, 0, 0, 1, 1,
-1.794871, -1.219783, -1.545522, 1, 0, 0, 1, 1,
-1.793402, -1.096183, -2.695605, 0, 0, 0, 1, 1,
-1.788959, 0.05084367, 1.120311, 0, 0, 0, 1, 1,
-1.781134, 0.9390074, -2.965763, 0, 0, 0, 1, 1,
-1.779193, 1.962578, 0.4633674, 0, 0, 0, 1, 1,
-1.7761, 0.1246789, -1.971659, 0, 0, 0, 1, 1,
-1.753515, 0.1236489, -4.061636, 0, 0, 0, 1, 1,
-1.712936, -0.6152547, -3.694867, 0, 0, 0, 1, 1,
-1.705932, -0.08032006, -1.026254, 1, 1, 1, 1, 1,
-1.700021, -1.09692, -3.390119, 1, 1, 1, 1, 1,
-1.685388, 0.5093408, -1.19882, 1, 1, 1, 1, 1,
-1.680635, 1.136891, -1.527757, 1, 1, 1, 1, 1,
-1.678417, 0.4794451, -0.7862969, 1, 1, 1, 1, 1,
-1.673322, 0.8229876, -0.8142089, 1, 1, 1, 1, 1,
-1.659411, 0.3185779, -1.806308, 1, 1, 1, 1, 1,
-1.644437, 0.03821155, -0.9182103, 1, 1, 1, 1, 1,
-1.634872, -1.847902, -2.065654, 1, 1, 1, 1, 1,
-1.598175, 1.023672, -1.439081, 1, 1, 1, 1, 1,
-1.590009, 1.617212, -1.831412, 1, 1, 1, 1, 1,
-1.582844, 3.20002, -0.4468754, 1, 1, 1, 1, 1,
-1.578412, -0.1645899, -1.252574, 1, 1, 1, 1, 1,
-1.568403, 1.233364, -0.8265696, 1, 1, 1, 1, 1,
-1.557153, 0.5113004, -1.007034, 1, 1, 1, 1, 1,
-1.538266, -0.3038979, -1.249742, 0, 0, 1, 1, 1,
-1.532391, -1.182772, -1.461192, 1, 0, 0, 1, 1,
-1.528208, 1.106435, -0.3885613, 1, 0, 0, 1, 1,
-1.504401, 1.182479, -1.009504, 1, 0, 0, 1, 1,
-1.501493, -0.6103395, -0.3393682, 1, 0, 0, 1, 1,
-1.470453, 0.3599686, -2.024016, 1, 0, 0, 1, 1,
-1.460927, -0.6985923, -2.742504, 0, 0, 0, 1, 1,
-1.445492, -2.527243, -1.344919, 0, 0, 0, 1, 1,
-1.428963, 1.294642, 0.447208, 0, 0, 0, 1, 1,
-1.425318, -0.5939794, -2.753604, 0, 0, 0, 1, 1,
-1.422247, 0.4923593, -0.6457929, 0, 0, 0, 1, 1,
-1.413237, -2.371358, -2.611252, 0, 0, 0, 1, 1,
-1.4101, -0.05105309, -0.7466514, 0, 0, 0, 1, 1,
-1.402351, 0.4070826, -1.832965, 1, 1, 1, 1, 1,
-1.399773, -0.5898795, -0.5166827, 1, 1, 1, 1, 1,
-1.392441, 0.942227, -0.8100001, 1, 1, 1, 1, 1,
-1.381788, 0.554437, -1.515249, 1, 1, 1, 1, 1,
-1.364379, 0.5155985, -1.04906, 1, 1, 1, 1, 1,
-1.359174, 0.3357489, -1.251107, 1, 1, 1, 1, 1,
-1.354435, 2.041174, 0.9467242, 1, 1, 1, 1, 1,
-1.354381, 1.953375, -1.622638, 1, 1, 1, 1, 1,
-1.346364, -0.582866, -1.869413, 1, 1, 1, 1, 1,
-1.345547, -0.9880416, -0.9599909, 1, 1, 1, 1, 1,
-1.331757, -0.1826372, -1.506675, 1, 1, 1, 1, 1,
-1.330399, 1.171646, 0.9852534, 1, 1, 1, 1, 1,
-1.330048, -1.268205, -3.696322, 1, 1, 1, 1, 1,
-1.327925, 0.360189, -2.047862, 1, 1, 1, 1, 1,
-1.321955, -0.3495988, -1.13048, 1, 1, 1, 1, 1,
-1.320928, 0.2807509, -0.9980127, 0, 0, 1, 1, 1,
-1.309459, -0.5465956, -1.766948, 1, 0, 0, 1, 1,
-1.30275, -0.5361348, -1.871632, 1, 0, 0, 1, 1,
-1.299532, 2.883455, -1.311719, 1, 0, 0, 1, 1,
-1.298543, 2.368768, 0.1793955, 1, 0, 0, 1, 1,
-1.298325, 0.9623046, -0.5648549, 1, 0, 0, 1, 1,
-1.297764, -0.7370072, -5.045775, 0, 0, 0, 1, 1,
-1.291519, 1.417257, -0.7348866, 0, 0, 0, 1, 1,
-1.288516, 1.102673, 1.1033, 0, 0, 0, 1, 1,
-1.286851, 0.3230217, -2.04736, 0, 0, 0, 1, 1,
-1.284801, 2.201551, -0.7056074, 0, 0, 0, 1, 1,
-1.279101, -1.06746, -3.624603, 0, 0, 0, 1, 1,
-1.272157, 0.04911009, -2.204006, 0, 0, 0, 1, 1,
-1.268236, -1.094207, -2.838161, 1, 1, 1, 1, 1,
-1.266422, -0.539721, -0.5557043, 1, 1, 1, 1, 1,
-1.256881, 0.006107365, -2.896662, 1, 1, 1, 1, 1,
-1.255669, 0.8819134, -0.137866, 1, 1, 1, 1, 1,
-1.255535, -1.010321, -3.3376, 1, 1, 1, 1, 1,
-1.246551, -0.2311803, -2.809987, 1, 1, 1, 1, 1,
-1.242584, 1.292375, -0.02706842, 1, 1, 1, 1, 1,
-1.242081, 0.06559097, -1.162331, 1, 1, 1, 1, 1,
-1.240006, 0.6797328, -0.7592767, 1, 1, 1, 1, 1,
-1.238566, 1.340104, -0.2705952, 1, 1, 1, 1, 1,
-1.231904, -1.957887, -2.445128, 1, 1, 1, 1, 1,
-1.229041, -1.138098, -2.063838, 1, 1, 1, 1, 1,
-1.22745, 0.3786769, -2.328134, 1, 1, 1, 1, 1,
-1.222158, -0.4137121, -3.285012, 1, 1, 1, 1, 1,
-1.218791, -1.247728, -2.101266, 1, 1, 1, 1, 1,
-1.217835, 0.7079653, -0.5108452, 0, 0, 1, 1, 1,
-1.217344, -0.5012082, -1.642499, 1, 0, 0, 1, 1,
-1.207782, -0.6917278, -2.649872, 1, 0, 0, 1, 1,
-1.203754, 0.2926013, -2.961683, 1, 0, 0, 1, 1,
-1.20333, -0.1963954, -3.456098, 1, 0, 0, 1, 1,
-1.198863, -0.6172248, -2.205098, 1, 0, 0, 1, 1,
-1.198676, 2.139735, -0.4185571, 0, 0, 0, 1, 1,
-1.197422, -0.7158355, -1.808247, 0, 0, 0, 1, 1,
-1.196175, -0.8460377, -1.499359, 0, 0, 0, 1, 1,
-1.19268, -0.4020189, -2.422452, 0, 0, 0, 1, 1,
-1.190812, -1.914558, -1.236753, 0, 0, 0, 1, 1,
-1.185512, 1.423977, -0.9214513, 0, 0, 0, 1, 1,
-1.182904, 1.47387, 0.8183204, 0, 0, 0, 1, 1,
-1.182365, -0.3873771, -1.89851, 1, 1, 1, 1, 1,
-1.180403, -0.759562, -3.865573, 1, 1, 1, 1, 1,
-1.167008, 0.1840976, -0.5385609, 1, 1, 1, 1, 1,
-1.162424, -0.6820657, -1.647039, 1, 1, 1, 1, 1,
-1.161624, -1.940696, -3.371121, 1, 1, 1, 1, 1,
-1.151112, -0.9241345, -2.171803, 1, 1, 1, 1, 1,
-1.140257, -1.545121, -2.949635, 1, 1, 1, 1, 1,
-1.130622, 0.8051249, -1.536491, 1, 1, 1, 1, 1,
-1.130412, 2.99482, -0.3287142, 1, 1, 1, 1, 1,
-1.129856, -1.642525, -3.089365, 1, 1, 1, 1, 1,
-1.129002, 1.251147, -1.244107, 1, 1, 1, 1, 1,
-1.124756, -0.3160166, -0.156801, 1, 1, 1, 1, 1,
-1.123139, -1.781569, -1.619782, 1, 1, 1, 1, 1,
-1.120509, -0.2501393, -1.442727, 1, 1, 1, 1, 1,
-1.110669, 0.2532341, -2.337776, 1, 1, 1, 1, 1,
-1.108659, -1.390958, -1.870716, 0, 0, 1, 1, 1,
-1.097589, -0.941669, -3.114501, 1, 0, 0, 1, 1,
-1.094857, 0.4951255, -2.255793, 1, 0, 0, 1, 1,
-1.09428, 0.650878, -0.90205, 1, 0, 0, 1, 1,
-1.09267, 2.378904, 1.058418, 1, 0, 0, 1, 1,
-1.073431, 0.3015489, -0.9942498, 1, 0, 0, 1, 1,
-1.07239, -0.2509346, -1.097513, 0, 0, 0, 1, 1,
-1.071543, 0.8950685, -1.882773, 0, 0, 0, 1, 1,
-1.071035, 0.5037401, -1.197885, 0, 0, 0, 1, 1,
-1.070719, -2.019969, -4.257828, 0, 0, 0, 1, 1,
-1.0658, 0.1357597, -0.4580674, 0, 0, 0, 1, 1,
-1.06557, 0.5318174, -1.735805, 0, 0, 0, 1, 1,
-1.06376, -0.1405243, -2.234943, 0, 0, 0, 1, 1,
-1.062582, -0.6068993, -1.661087, 1, 1, 1, 1, 1,
-1.062094, 0.8685222, 1.335474, 1, 1, 1, 1, 1,
-1.059157, -0.3839636, -1.889607, 1, 1, 1, 1, 1,
-1.056472, -1.168575, -1.770058, 1, 1, 1, 1, 1,
-1.053067, -0.2871312, 0.1294886, 1, 1, 1, 1, 1,
-1.046805, -0.8707912, -1.933359, 1, 1, 1, 1, 1,
-1.046467, -0.14595, -1.963297, 1, 1, 1, 1, 1,
-1.042388, -1.138347, -1.576412, 1, 1, 1, 1, 1,
-1.036656, -0.891066, 1.444477, 1, 1, 1, 1, 1,
-1.034224, -0.2931475, -2.012498, 1, 1, 1, 1, 1,
-1.031367, -0.7390572, -2.158707, 1, 1, 1, 1, 1,
-1.030557, -0.1874366, -1.083642, 1, 1, 1, 1, 1,
-1.023304, 0.8561105, -1.327808, 1, 1, 1, 1, 1,
-1.022493, -0.09138905, -3.015173, 1, 1, 1, 1, 1,
-1.02117, 0.06716292, -1.573462, 1, 1, 1, 1, 1,
-1.018861, 0.08806015, -0.7958241, 0, 0, 1, 1, 1,
-1.011445, -0.5079071, -2.157974, 1, 0, 0, 1, 1,
-1.009649, 1.026395, -1.054625, 1, 0, 0, 1, 1,
-1.00949, -1.295805, -2.899876, 1, 0, 0, 1, 1,
-1.009097, -1.423237, -1.852206, 1, 0, 0, 1, 1,
-1.00502, -1.479553, -4.094876, 1, 0, 0, 1, 1,
-0.9957456, 0.6807991, -0.9618601, 0, 0, 0, 1, 1,
-0.9923426, -1.010703, -1.234931, 0, 0, 0, 1, 1,
-0.9738062, -1.963426, -2.330064, 0, 0, 0, 1, 1,
-0.9733844, 0.2864688, -0.5058473, 0, 0, 0, 1, 1,
-0.9633005, 0.119357, -1.152897, 0, 0, 0, 1, 1,
-0.9583151, -0.03829509, -2.269821, 0, 0, 0, 1, 1,
-0.9537026, -0.1989322, -1.597634, 0, 0, 0, 1, 1,
-0.9428236, 0.9625198, 1.595106, 1, 1, 1, 1, 1,
-0.9289962, 0.06073946, -1.513591, 1, 1, 1, 1, 1,
-0.9250802, -1.334244, -1.95745, 1, 1, 1, 1, 1,
-0.9194037, -2.258837, -2.293252, 1, 1, 1, 1, 1,
-0.913233, 0.4832847, -1.518435, 1, 1, 1, 1, 1,
-0.9109171, -0.03281954, -3.060997, 1, 1, 1, 1, 1,
-0.910213, -0.7017263, -1.553164, 1, 1, 1, 1, 1,
-0.9066175, 0.2683702, -0.1126013, 1, 1, 1, 1, 1,
-0.8987617, 0.9308821, -0.5099343, 1, 1, 1, 1, 1,
-0.8957545, -0.3864383, -0.6603451, 1, 1, 1, 1, 1,
-0.8840885, 1.217777, -0.396178, 1, 1, 1, 1, 1,
-0.8823062, -1.481562, -3.610099, 1, 1, 1, 1, 1,
-0.8807603, 1.047665, -1.239406, 1, 1, 1, 1, 1,
-0.8747952, -0.4999834, -0.9823684, 1, 1, 1, 1, 1,
-0.8729934, -1.596972, -3.524048, 1, 1, 1, 1, 1,
-0.864177, 0.3603339, -1.400416, 0, 0, 1, 1, 1,
-0.8614451, 1.469573, -0.5507055, 1, 0, 0, 1, 1,
-0.8551364, 0.4334895, -1.808245, 1, 0, 0, 1, 1,
-0.8525976, 0.9055684, -1.780463, 1, 0, 0, 1, 1,
-0.8495591, 1.366153, -2.564041, 1, 0, 0, 1, 1,
-0.8425704, 1.812017, -1.372493, 1, 0, 0, 1, 1,
-0.842303, 0.0733877, -2.371701, 0, 0, 0, 1, 1,
-0.8325321, -0.7323862, -1.583434, 0, 0, 0, 1, 1,
-0.8319011, -1.179848, -3.930907, 0, 0, 0, 1, 1,
-0.8315285, -0.9372178, -4.813048, 0, 0, 0, 1, 1,
-0.8250987, 0.4809802, -0.5703898, 0, 0, 0, 1, 1,
-0.8197089, 1.578208, -0.9168537, 0, 0, 0, 1, 1,
-0.8105134, -1.209522, -2.695129, 0, 0, 0, 1, 1,
-0.8091912, -0.08162978, -1.168789, 1, 1, 1, 1, 1,
-0.8079895, 0.8575287, -0.8674346, 1, 1, 1, 1, 1,
-0.8037473, -0.3619198, -0.691417, 1, 1, 1, 1, 1,
-0.8032764, -0.9555172, -3.515058, 1, 1, 1, 1, 1,
-0.7983124, 0.6946939, 0.7382394, 1, 1, 1, 1, 1,
-0.7878228, 2.867668, 0.3128331, 1, 1, 1, 1, 1,
-0.7835465, 2.326861, 0.1411589, 1, 1, 1, 1, 1,
-0.7793649, -0.1465211, -3.292596, 1, 1, 1, 1, 1,
-0.7762885, -0.5030096, -0.6609187, 1, 1, 1, 1, 1,
-0.7742479, -0.3379162, -1.140718, 1, 1, 1, 1, 1,
-0.7726226, -0.6005049, -3.147121, 1, 1, 1, 1, 1,
-0.7720623, 1.205427, 0.1076363, 1, 1, 1, 1, 1,
-0.7697118, 2.057862, 0.1010057, 1, 1, 1, 1, 1,
-0.7645485, -0.8244855, -2.051114, 1, 1, 1, 1, 1,
-0.7627352, -0.4550811, -0.3271004, 1, 1, 1, 1, 1,
-0.7615938, -0.2165424, -2.280345, 0, 0, 1, 1, 1,
-0.7599887, 0.007952561, -1.309667, 1, 0, 0, 1, 1,
-0.758942, 0.4268928, -0.1713179, 1, 0, 0, 1, 1,
-0.7567592, -0.2008281, -3.561445, 1, 0, 0, 1, 1,
-0.7517966, -0.714411, -3.395251, 1, 0, 0, 1, 1,
-0.750882, -0.197271, -3.088394, 1, 0, 0, 1, 1,
-0.7500882, -0.2351534, -1.049238, 0, 0, 0, 1, 1,
-0.7484794, 0.5741494, -1.681882, 0, 0, 0, 1, 1,
-0.7475001, 0.4914242, -0.248168, 0, 0, 0, 1, 1,
-0.745159, 0.4376112, -1.194995, 0, 0, 0, 1, 1,
-0.7404797, -0.4756296, -2.812719, 0, 0, 0, 1, 1,
-0.7399016, 0.397509, -1.260841, 0, 0, 0, 1, 1,
-0.7395048, -0.5777541, -2.488762, 0, 0, 0, 1, 1,
-0.7376015, -1.515186, -2.304537, 1, 1, 1, 1, 1,
-0.7333367, -1.334434, -3.126618, 1, 1, 1, 1, 1,
-0.7329603, -2.52279, -2.559136, 1, 1, 1, 1, 1,
-0.7300723, -1.281613, -0.9343199, 1, 1, 1, 1, 1,
-0.7262329, 0.1606126, 0.1906807, 1, 1, 1, 1, 1,
-0.7239186, -0.61213, -1.660439, 1, 1, 1, 1, 1,
-0.7173361, -0.5157769, 0.30045, 1, 1, 1, 1, 1,
-0.71324, 0.1750388, -3.854066, 1, 1, 1, 1, 1,
-0.7073238, 0.3372447, -2.36682, 1, 1, 1, 1, 1,
-0.7043062, -0.3647054, -2.202648, 1, 1, 1, 1, 1,
-0.7006049, -0.9393685, -3.922246, 1, 1, 1, 1, 1,
-0.69765, -1.366668, -3.438029, 1, 1, 1, 1, 1,
-0.693233, -0.774367, -3.152122, 1, 1, 1, 1, 1,
-0.6930485, 1.543124, -4.133479, 1, 1, 1, 1, 1,
-0.6886778, 1.199301, 0.06652618, 1, 1, 1, 1, 1,
-0.6874491, 0.4563552, -1.010422, 0, 0, 1, 1, 1,
-0.6839808, -0.4031197, -2.466908, 1, 0, 0, 1, 1,
-0.6836752, 1.423368, -0.6117432, 1, 0, 0, 1, 1,
-0.6831819, -0.9621812, -3.0499, 1, 0, 0, 1, 1,
-0.6792837, -0.1028839, -1.748779, 1, 0, 0, 1, 1,
-0.6768941, 0.676407, -0.07952467, 1, 0, 0, 1, 1,
-0.6763674, -0.2927637, -3.25309, 0, 0, 0, 1, 1,
-0.6719283, 0.263849, -0.5041119, 0, 0, 0, 1, 1,
-0.6695995, 0.7495028, -0.6798952, 0, 0, 0, 1, 1,
-0.6672085, -0.7446271, -1.129483, 0, 0, 0, 1, 1,
-0.6671799, -0.6405984, -1.96504, 0, 0, 0, 1, 1,
-0.6670442, 0.4515307, -0.5797018, 0, 0, 0, 1, 1,
-0.6664109, -1.257764, -3.011637, 0, 0, 0, 1, 1,
-0.6588896, 0.9081437, -0.9650568, 1, 1, 1, 1, 1,
-0.6584451, -0.1532804, -2.104142, 1, 1, 1, 1, 1,
-0.655983, -1.092122, -2.61689, 1, 1, 1, 1, 1,
-0.6541299, -1.108975, -2.957533, 1, 1, 1, 1, 1,
-0.6540973, 0.6734073, 0.02319114, 1, 1, 1, 1, 1,
-0.6522993, 1.262907, -0.6049517, 1, 1, 1, 1, 1,
-0.6501295, 0.7682148, -0.658661, 1, 1, 1, 1, 1,
-0.6470361, 0.3039264, -0.4320899, 1, 1, 1, 1, 1,
-0.6423275, 0.06783631, 0.841068, 1, 1, 1, 1, 1,
-0.6414706, -0.007929839, -1.832497, 1, 1, 1, 1, 1,
-0.6401638, -1.468219, -1.784386, 1, 1, 1, 1, 1,
-0.6314035, 0.6969389, 0.6570453, 1, 1, 1, 1, 1,
-0.6267413, -1.428329, -2.619239, 1, 1, 1, 1, 1,
-0.6265969, -0.7443559, -2.20157, 1, 1, 1, 1, 1,
-0.6234157, -0.8819124, -2.643481, 1, 1, 1, 1, 1,
-0.6232725, -1.244371, -4.479048, 0, 0, 1, 1, 1,
-0.6167125, -2.021723, -4.678373, 1, 0, 0, 1, 1,
-0.6127945, 0.2576822, -1.559392, 1, 0, 0, 1, 1,
-0.6126019, 0.1563131, -1.094395, 1, 0, 0, 1, 1,
-0.6108667, 1.079908, -1.591155, 1, 0, 0, 1, 1,
-0.6010028, -0.6708569, -2.642554, 1, 0, 0, 1, 1,
-0.59986, -0.01437614, -1.354313, 0, 0, 0, 1, 1,
-0.5979983, -1.283899, -2.000128, 0, 0, 0, 1, 1,
-0.5965956, 0.1318223, -1.944861, 0, 0, 0, 1, 1,
-0.5915516, -0.280543, -1.808334, 0, 0, 0, 1, 1,
-0.5872498, 0.08177694, -1.855291, 0, 0, 0, 1, 1,
-0.5870302, 0.0655884, -0.9829536, 0, 0, 0, 1, 1,
-0.5864586, 1.588768, 1.86413, 0, 0, 0, 1, 1,
-0.5821555, -0.4325308, -1.648703, 1, 1, 1, 1, 1,
-0.5797243, -1.139875, -3.27854, 1, 1, 1, 1, 1,
-0.5787168, -0.8845306, -1.959688, 1, 1, 1, 1, 1,
-0.5738415, -0.878503, -1.516319, 1, 1, 1, 1, 1,
-0.5722201, 0.3648226, -0.2095784, 1, 1, 1, 1, 1,
-0.571486, -2.17407, -3.322536, 1, 1, 1, 1, 1,
-0.5703283, -1.092067, -1.994631, 1, 1, 1, 1, 1,
-0.5700962, -0.5148873, -0.1667023, 1, 1, 1, 1, 1,
-0.5681204, -1.331637, -3.283198, 1, 1, 1, 1, 1,
-0.5668588, 1.5604, -2.152179, 1, 1, 1, 1, 1,
-0.5667651, 0.07069063, -2.636648, 1, 1, 1, 1, 1,
-0.5628016, -2.188627, -1.183287, 1, 1, 1, 1, 1,
-0.5583774, -0.4954706, -1.541949, 1, 1, 1, 1, 1,
-0.5550333, -0.3174457, -3.23519, 1, 1, 1, 1, 1,
-0.5548757, 0.2434071, -0.2947597, 1, 1, 1, 1, 1,
-0.5496602, -0.1288988, -1.166486, 0, 0, 1, 1, 1,
-0.5468461, -0.0564157, -2.027166, 1, 0, 0, 1, 1,
-0.5444669, 0.6698861, -1.561424, 1, 0, 0, 1, 1,
-0.5419182, 1.92482, 0.4986461, 1, 0, 0, 1, 1,
-0.5319793, 0.05340295, -0.3527896, 1, 0, 0, 1, 1,
-0.5319562, 0.5419002, -1.219733, 1, 0, 0, 1, 1,
-0.5293275, -0.3275287, -1.669261, 0, 0, 0, 1, 1,
-0.5269062, 0.7200889, -1.71439, 0, 0, 0, 1, 1,
-0.5242, -0.3860496, -3.073988, 0, 0, 0, 1, 1,
-0.522916, -0.05975385, -1.958885, 0, 0, 0, 1, 1,
-0.5204206, -0.4564313, -0.2218156, 0, 0, 0, 1, 1,
-0.5189885, 0.1966056, -0.791288, 0, 0, 0, 1, 1,
-0.5186635, 2.130832, 0.5288206, 0, 0, 0, 1, 1,
-0.5046868, -2.101157, -3.746129, 1, 1, 1, 1, 1,
-0.5012132, 0.6822474, 0.5530305, 1, 1, 1, 1, 1,
-0.5007179, 0.2437746, -1.903816, 1, 1, 1, 1, 1,
-0.4966242, -1.808888, -2.605357, 1, 1, 1, 1, 1,
-0.4928806, 0.5928485, 1.079569, 1, 1, 1, 1, 1,
-0.4878788, 1.144066, -0.6216237, 1, 1, 1, 1, 1,
-0.4861273, -0.6268511, -4.517457, 1, 1, 1, 1, 1,
-0.4840261, -0.1683174, -0.8853719, 1, 1, 1, 1, 1,
-0.4836844, 0.04251099, -1.44813, 1, 1, 1, 1, 1,
-0.4801048, -1.346282, -3.537544, 1, 1, 1, 1, 1,
-0.4738254, 0.9371639, -3.033323, 1, 1, 1, 1, 1,
-0.4642384, -0.9603884, -1.99785, 1, 1, 1, 1, 1,
-0.4642094, 0.2779807, -1.426855, 1, 1, 1, 1, 1,
-0.4565933, 0.2954882, -2.061525, 1, 1, 1, 1, 1,
-0.4526868, -1.966133, -4.314758, 1, 1, 1, 1, 1,
-0.4434113, -1.007422, -1.498439, 0, 0, 1, 1, 1,
-0.4432346, 0.1329543, -3.539514, 1, 0, 0, 1, 1,
-0.4420479, 0.6605227, 0.02801038, 1, 0, 0, 1, 1,
-0.4369193, -0.8649662, -3.12026, 1, 0, 0, 1, 1,
-0.4355198, 0.05296308, -0.5489866, 1, 0, 0, 1, 1,
-0.4311109, -1.060653, -3.178361, 1, 0, 0, 1, 1,
-0.428558, -0.2188137, -1.227212, 0, 0, 0, 1, 1,
-0.4265541, -0.7896194, -3.757286, 0, 0, 0, 1, 1,
-0.4231215, -0.8238081, -3.540509, 0, 0, 0, 1, 1,
-0.4216406, -2.119337, -3.701126, 0, 0, 0, 1, 1,
-0.4143871, -0.3429651, -2.87588, 0, 0, 0, 1, 1,
-0.4125785, -0.7415731, -1.270792, 0, 0, 0, 1, 1,
-0.4111788, 0.9319586, -0.8431985, 0, 0, 0, 1, 1,
-0.4038451, 0.2056018, -0.5273407, 1, 1, 1, 1, 1,
-0.3986603, -0.7157427, -2.01134, 1, 1, 1, 1, 1,
-0.3981551, 0.3794228, -1.510718, 1, 1, 1, 1, 1,
-0.3974973, -0.7845806, -3.001534, 1, 1, 1, 1, 1,
-0.3955126, 1.584401, -0.1525633, 1, 1, 1, 1, 1,
-0.3944111, -0.2424023, -1.472536, 1, 1, 1, 1, 1,
-0.3943563, 0.6549734, -0.3957409, 1, 1, 1, 1, 1,
-0.3939946, -0.8600662, -0.3784279, 1, 1, 1, 1, 1,
-0.3932886, -0.1721251, -1.357791, 1, 1, 1, 1, 1,
-0.3903448, 1.286698, -1.005455, 1, 1, 1, 1, 1,
-0.3839226, -1.509213, -1.161783, 1, 1, 1, 1, 1,
-0.3827593, -0.4496987, -4.319533, 1, 1, 1, 1, 1,
-0.3774681, -1.127827, -0.9794934, 1, 1, 1, 1, 1,
-0.3742998, 0.6555542, -0.540421, 1, 1, 1, 1, 1,
-0.3726298, -0.2374928, -0.667851, 1, 1, 1, 1, 1,
-0.3705473, -2.070412, -3.11862, 0, 0, 1, 1, 1,
-0.3642737, 0.3839402, 0.007313748, 1, 0, 0, 1, 1,
-0.3642549, -0.5700947, -1.486694, 1, 0, 0, 1, 1,
-0.3618654, 1.640547, -0.7000579, 1, 0, 0, 1, 1,
-0.3571, -0.5049776, -3.544419, 1, 0, 0, 1, 1,
-0.3530457, 1.083695, -0.3937014, 1, 0, 0, 1, 1,
-0.3407742, -0.8160211, -1.306195, 0, 0, 0, 1, 1,
-0.340025, 0.2740143, 0.4884141, 0, 0, 0, 1, 1,
-0.3361597, 0.720566, -0.4068996, 0, 0, 0, 1, 1,
-0.3340855, -0.8980817, -3.188998, 0, 0, 0, 1, 1,
-0.3326986, -0.5731844, -3.719931, 0, 0, 0, 1, 1,
-0.3323493, 0.9276807, -0.6630312, 0, 0, 0, 1, 1,
-0.3323258, -0.1036515, 0.05449628, 0, 0, 0, 1, 1,
-0.3315808, 2.001681, -0.214147, 1, 1, 1, 1, 1,
-0.3311183, -0.3243445, -2.803903, 1, 1, 1, 1, 1,
-0.3303829, 1.279657, -0.1035245, 1, 1, 1, 1, 1,
-0.3280114, -0.03324469, -1.426979, 1, 1, 1, 1, 1,
-0.3268068, 0.6044822, -0.6004455, 1, 1, 1, 1, 1,
-0.3169029, 0.6729295, -2.155692, 1, 1, 1, 1, 1,
-0.3165286, 0.07598506, -3.596055, 1, 1, 1, 1, 1,
-0.3160892, 0.2959338, -0.737937, 1, 1, 1, 1, 1,
-0.3154987, 0.4318361, 0.1795257, 1, 1, 1, 1, 1,
-0.3151709, 0.2260928, -0.7053127, 1, 1, 1, 1, 1,
-0.3054412, 0.6877211, -0.7307368, 1, 1, 1, 1, 1,
-0.2991304, -0.4426684, -1.979224, 1, 1, 1, 1, 1,
-0.2990444, -0.868994, -3.524176, 1, 1, 1, 1, 1,
-0.2960852, 1.386576, -0.138036, 1, 1, 1, 1, 1,
-0.293046, -1.282437, -5.094715, 1, 1, 1, 1, 1,
-0.2898335, 0.30437, -2.105395, 0, 0, 1, 1, 1,
-0.2882706, 0.3942303, -0.06811443, 1, 0, 0, 1, 1,
-0.2848204, -1.550786, -3.115429, 1, 0, 0, 1, 1,
-0.2809784, 0.4704317, -2.18967, 1, 0, 0, 1, 1,
-0.2775623, -0.8142902, -2.761121, 1, 0, 0, 1, 1,
-0.2774914, 0.3548016, -1.223262, 1, 0, 0, 1, 1,
-0.2766098, -0.3421432, -2.907338, 0, 0, 0, 1, 1,
-0.2719451, -0.5485202, -1.454996, 0, 0, 0, 1, 1,
-0.2675368, 1.277484, -1.685855, 0, 0, 0, 1, 1,
-0.265231, -0.4165069, -2.121766, 0, 0, 0, 1, 1,
-0.263521, 1.651119, 0.3203953, 0, 0, 0, 1, 1,
-0.259773, 0.5563492, -1.492889, 0, 0, 0, 1, 1,
-0.2482443, -1.901698, -2.715305, 0, 0, 0, 1, 1,
-0.2440119, 0.6343962, -0.7003382, 1, 1, 1, 1, 1,
-0.2433365, -1.326563, -2.239192, 1, 1, 1, 1, 1,
-0.2392393, -0.1363802, -1.211057, 1, 1, 1, 1, 1,
-0.2343401, -0.2390601, -0.5520648, 1, 1, 1, 1, 1,
-0.2340478, 0.03754271, -1.996956, 1, 1, 1, 1, 1,
-0.2311324, 0.5489761, -1.672495, 1, 1, 1, 1, 1,
-0.2301251, 0.4124053, -0.04866296, 1, 1, 1, 1, 1,
-0.2301169, 0.5257314, -0.2070638, 1, 1, 1, 1, 1,
-0.2291235, 0.4632708, -1.028908, 1, 1, 1, 1, 1,
-0.2283764, -0.1433121, -2.179434, 1, 1, 1, 1, 1,
-0.2222388, 0.8555528, -0.604443, 1, 1, 1, 1, 1,
-0.2182487, -0.900426, -3.045389, 1, 1, 1, 1, 1,
-0.2180248, -0.7378552, -2.5521, 1, 1, 1, 1, 1,
-0.2177011, -1.148142, -4.62325, 1, 1, 1, 1, 1,
-0.2039278, -0.2257222, -1.459976, 1, 1, 1, 1, 1,
-0.1984046, 0.2384323, -0.9052322, 0, 0, 1, 1, 1,
-0.1963704, 1.152047, -1.113757, 1, 0, 0, 1, 1,
-0.1928778, 0.632265, -1.070556, 1, 0, 0, 1, 1,
-0.1928521, 0.5400559, -1.093935, 1, 0, 0, 1, 1,
-0.1883802, -0.3055078, -2.936043, 1, 0, 0, 1, 1,
-0.1877546, 0.5542948, -0.1803918, 1, 0, 0, 1, 1,
-0.1850595, -0.7348867, -2.966106, 0, 0, 0, 1, 1,
-0.1836352, 1.123889, -0.8465182, 0, 0, 0, 1, 1,
-0.1831795, 1.116922, -1.167422, 0, 0, 0, 1, 1,
-0.1786421, 0.686061, 0.9360083, 0, 0, 0, 1, 1,
-0.1745725, -0.1488185, -1.370549, 0, 0, 0, 1, 1,
-0.1708875, -0.9513506, -1.637456, 0, 0, 0, 1, 1,
-0.1690814, -1.036865, -3.368771, 0, 0, 0, 1, 1,
-0.1650051, 0.6077894, -1.358147, 1, 1, 1, 1, 1,
-0.1645032, -0.2935951, -2.341964, 1, 1, 1, 1, 1,
-0.1626009, -0.5071889, -4.042201, 1, 1, 1, 1, 1,
-0.1610684, -1.760878, -2.732861, 1, 1, 1, 1, 1,
-0.160917, 0.401463, -1.038859, 1, 1, 1, 1, 1,
-0.1564102, -0.4427623, -3.521597, 1, 1, 1, 1, 1,
-0.1558685, 1.225703, -0.1686733, 1, 1, 1, 1, 1,
-0.1555093, -0.6869292, -2.689761, 1, 1, 1, 1, 1,
-0.1554131, -0.422546, -3.404432, 1, 1, 1, 1, 1,
-0.152345, -1.204171, -5.268544, 1, 1, 1, 1, 1,
-0.1446375, 1.795058, 0.8451089, 1, 1, 1, 1, 1,
-0.14164, -0.3571644, -4.038145, 1, 1, 1, 1, 1,
-0.1410161, 0.5922662, 0.4816653, 1, 1, 1, 1, 1,
-0.1379988, 0.02431698, -2.994944, 1, 1, 1, 1, 1,
-0.1338595, 1.055788, 1.279422, 1, 1, 1, 1, 1,
-0.1295118, -2.262083, -3.025942, 0, 0, 1, 1, 1,
-0.1236366, 0.7609842, -1.127072, 1, 0, 0, 1, 1,
-0.1228702, 0.2572112, -0.8048785, 1, 0, 0, 1, 1,
-0.1206088, 0.3082232, -0.04301538, 1, 0, 0, 1, 1,
-0.1153615, 0.4307959, 0.03928337, 1, 0, 0, 1, 1,
-0.1125219, -0.1121893, -2.955117, 1, 0, 0, 1, 1,
-0.1082197, 0.366309, 0.7245539, 0, 0, 0, 1, 1,
-0.1050582, 1.085515, 0.1581271, 0, 0, 0, 1, 1,
-0.1029013, -0.6014128, -1.334772, 0, 0, 0, 1, 1,
-0.099746, 0.2615902, -0.2723699, 0, 0, 0, 1, 1,
-0.09527662, -1.417356, -4.523151, 0, 0, 0, 1, 1,
-0.09118772, -1.176588, -4.673189, 0, 0, 0, 1, 1,
-0.09107699, -0.7573461, -2.152459, 0, 0, 0, 1, 1,
-0.09018685, -0.1648185, -3.465508, 1, 1, 1, 1, 1,
-0.08770449, -2.114698, -2.418338, 1, 1, 1, 1, 1,
-0.08734464, -0.508926, -1.153453, 1, 1, 1, 1, 1,
-0.08436254, 0.297033, -0.007282148, 1, 1, 1, 1, 1,
-0.08293478, -0.9864014, -2.768111, 1, 1, 1, 1, 1,
-0.08278983, -0.2808213, -2.796176, 1, 1, 1, 1, 1,
-0.07518332, 2.618299, 0.304722, 1, 1, 1, 1, 1,
-0.06998929, 2.186208, 2.818693, 1, 1, 1, 1, 1,
-0.06981716, -2.738276, -2.874332, 1, 1, 1, 1, 1,
-0.06666386, 0.07910822, -0.4120423, 1, 1, 1, 1, 1,
-0.06551207, 0.3798347, -0.6617849, 1, 1, 1, 1, 1,
-0.06475076, -1.008675, -2.852385, 1, 1, 1, 1, 1,
-0.05999583, 2.889957, -1.435208, 1, 1, 1, 1, 1,
-0.05796187, 0.04128208, -1.158163, 1, 1, 1, 1, 1,
-0.05721635, 0.3768194, 0.4984947, 1, 1, 1, 1, 1,
-0.0474766, 0.5078064, 0.9551239, 0, 0, 1, 1, 1,
-0.04711463, -1.314495, -4.08458, 1, 0, 0, 1, 1,
-0.04267086, -0.2144648, -3.468592, 1, 0, 0, 1, 1,
-0.03985676, 0.1599906, -0.8677199, 1, 0, 0, 1, 1,
-0.03757579, 0.3191533, 0.312848, 1, 0, 0, 1, 1,
-0.03325353, 0.06100833, -0.4825416, 1, 0, 0, 1, 1,
-0.03251436, 0.5740429, -0.3460571, 0, 0, 0, 1, 1,
-0.02737085, -2.385729, -4.349247, 0, 0, 0, 1, 1,
-0.02580336, -0.0521405, -3.149476, 0, 0, 0, 1, 1,
-0.02361707, 0.3063204, -1.22626, 0, 0, 0, 1, 1,
-0.02229031, 0.8733838, 0.5527624, 0, 0, 0, 1, 1,
-0.0203627, -1.141351, -3.568131, 0, 0, 0, 1, 1,
-0.01983918, 0.7530351, 0.1585112, 0, 0, 0, 1, 1,
-0.01913452, -0.8778641, -2.625545, 1, 1, 1, 1, 1,
-0.01834518, 0.1062866, 0.5211941, 1, 1, 1, 1, 1,
-0.0172882, 0.02065269, -0.6694313, 1, 1, 1, 1, 1,
-0.01478188, -0.6805145, -2.909448, 1, 1, 1, 1, 1,
-0.01374245, 0.4142762, 0.8292348, 1, 1, 1, 1, 1,
-0.0116829, -1.234723, -3.635921, 1, 1, 1, 1, 1,
-0.009251065, -0.008948203, -2.749727, 1, 1, 1, 1, 1,
-0.005417855, -1.052485, -2.44639, 1, 1, 1, 1, 1,
0.0009791459, 1.015164, -0.1109616, 1, 1, 1, 1, 1,
0.006066586, -1.344327, 0.5669917, 1, 1, 1, 1, 1,
0.01039385, -1.064258, 3.221419, 1, 1, 1, 1, 1,
0.01283015, -0.0595889, 3.385758, 1, 1, 1, 1, 1,
0.01591247, -1.24394, 5.798715, 1, 1, 1, 1, 1,
0.01681177, 1.211269, 0.9983938, 1, 1, 1, 1, 1,
0.01961978, -0.8569134, 3.726741, 1, 1, 1, 1, 1,
0.02378936, 0.6373579, 0.7465024, 0, 0, 1, 1, 1,
0.02574963, -0.3305142, 3.242954, 1, 0, 0, 1, 1,
0.02649271, -1.227064, 6.993407, 1, 0, 0, 1, 1,
0.02690945, -0.06976328, 4.067566, 1, 0, 0, 1, 1,
0.02792442, 0.2587773, 0.5161721, 1, 0, 0, 1, 1,
0.0312421, 1.60581, 1.257137, 1, 0, 0, 1, 1,
0.03283362, 0.6977996, 0.3323664, 0, 0, 0, 1, 1,
0.03340975, 0.2273764, -0.9261743, 0, 0, 0, 1, 1,
0.03716195, -0.8816534, 3.860404, 0, 0, 0, 1, 1,
0.03833162, 1.12426, -0.5568817, 0, 0, 0, 1, 1,
0.04015685, -0.4066542, 4.153532, 0, 0, 0, 1, 1,
0.04329346, 0.1323147, -1.519527, 0, 0, 0, 1, 1,
0.04446438, 0.3488478, 0.954668, 0, 0, 0, 1, 1,
0.04495364, 0.5901091, 0.6179413, 1, 1, 1, 1, 1,
0.04893454, 0.2928936, -0.2529011, 1, 1, 1, 1, 1,
0.05045614, 0.1456428, -0.2177049, 1, 1, 1, 1, 1,
0.05415393, 0.3840961, -0.6703047, 1, 1, 1, 1, 1,
0.05865693, 0.4310858, 0.2422084, 1, 1, 1, 1, 1,
0.06273012, 1.605142, -1.148045, 1, 1, 1, 1, 1,
0.06347729, 0.02848524, 0.4879071, 1, 1, 1, 1, 1,
0.06459884, -0.2666544, 2.044378, 1, 1, 1, 1, 1,
0.06650609, 0.282632, -0.638446, 1, 1, 1, 1, 1,
0.0672278, 1.387292, -0.1429632, 1, 1, 1, 1, 1,
0.07260859, 0.4975948, 0.3620779, 1, 1, 1, 1, 1,
0.07488345, -0.4489646, 3.769598, 1, 1, 1, 1, 1,
0.08304659, -0.2591663, 4.168733, 1, 1, 1, 1, 1,
0.08422926, -0.05939514, 1.758894, 1, 1, 1, 1, 1,
0.08642831, -1.215115, 2.187839, 1, 1, 1, 1, 1,
0.09004519, -1.083448, 3.12623, 0, 0, 1, 1, 1,
0.09034809, -1.027849, 2.713021, 1, 0, 0, 1, 1,
0.09191655, -0.3344928, 2.322714, 1, 0, 0, 1, 1,
0.09401441, 0.4223249, 2.284994, 1, 0, 0, 1, 1,
0.09746215, -1.463221, 2.805626, 1, 0, 0, 1, 1,
0.09970503, 0.7024924, -1.240154, 1, 0, 0, 1, 1,
0.1029792, 1.870312, -0.6945444, 0, 0, 0, 1, 1,
0.1034947, 1.020677, 1.239767, 0, 0, 0, 1, 1,
0.1042274, 0.2872149, 0.1340278, 0, 0, 0, 1, 1,
0.1044801, -2.175008, 3.122016, 0, 0, 0, 1, 1,
0.1099274, 1.345586, -0.00586229, 0, 0, 0, 1, 1,
0.1170085, -0.346588, 3.439591, 0, 0, 0, 1, 1,
0.1191573, 0.8345285, 1.8567, 0, 0, 0, 1, 1,
0.1211198, -1.156824, 4.052027, 1, 1, 1, 1, 1,
0.1223352, -0.591312, 4.940544, 1, 1, 1, 1, 1,
0.1247058, -1.465123, 2.428946, 1, 1, 1, 1, 1,
0.1305855, -1.747056, 3.001002, 1, 1, 1, 1, 1,
0.1347538, 0.866214, 1.413264, 1, 1, 1, 1, 1,
0.1366725, -0.3317574, 2.443119, 1, 1, 1, 1, 1,
0.1431227, -0.2286927, 4.797185, 1, 1, 1, 1, 1,
0.1452335, -1.204941, 4.314699, 1, 1, 1, 1, 1,
0.1493523, 0.2165539, 0.8130605, 1, 1, 1, 1, 1,
0.1494209, -0.3893561, 2.445047, 1, 1, 1, 1, 1,
0.1511323, 1.564903, 0.3177097, 1, 1, 1, 1, 1,
0.1540796, 2.076874, -0.02948719, 1, 1, 1, 1, 1,
0.1543086, 1.577788, -0.9964976, 1, 1, 1, 1, 1,
0.1687396, 0.3635089, 1.610387, 1, 1, 1, 1, 1,
0.1711122, 0.2719145, 1.345562, 1, 1, 1, 1, 1,
0.1800058, -1.556563, 3.713351, 0, 0, 1, 1, 1,
0.181769, 0.1047013, 1.09695, 1, 0, 0, 1, 1,
0.1819886, 0.7556894, 1.043474, 1, 0, 0, 1, 1,
0.1836587, 0.1490885, 0.2439392, 1, 0, 0, 1, 1,
0.1837674, -0.312884, 2.249692, 1, 0, 0, 1, 1,
0.1849345, 0.223649, 1.03249, 1, 0, 0, 1, 1,
0.1908358, 0.5360368, -2.630101, 0, 0, 0, 1, 1,
0.1916311, -0.8193923, 3.569716, 0, 0, 0, 1, 1,
0.2020343, 0.4271122, 0.4821599, 0, 0, 0, 1, 1,
0.2020835, -0.6480668, 3.159552, 0, 0, 0, 1, 1,
0.2050949, -0.7405444, 2.207315, 0, 0, 0, 1, 1,
0.2057342, -0.9710566, 4.128778, 0, 0, 0, 1, 1,
0.2058336, -0.3348655, 4.898976, 0, 0, 0, 1, 1,
0.2068445, 3.377578, -0.9195944, 1, 1, 1, 1, 1,
0.2086447, -1.145556, 2.931852, 1, 1, 1, 1, 1,
0.2142607, 0.3426348, 0.08661301, 1, 1, 1, 1, 1,
0.2165616, 0.5037691, 2.48796, 1, 1, 1, 1, 1,
0.2194504, -0.2732149, 2.970171, 1, 1, 1, 1, 1,
0.2199526, -0.8119799, 0.1476441, 1, 1, 1, 1, 1,
0.2216303, 0.6126054, 0.1944188, 1, 1, 1, 1, 1,
0.223984, -0.8614052, 2.538249, 1, 1, 1, 1, 1,
0.2247423, 0.3245609, -0.09402779, 1, 1, 1, 1, 1,
0.2270052, 0.8000371, 0.718839, 1, 1, 1, 1, 1,
0.2327931, 0.8280862, -0.5927988, 1, 1, 1, 1, 1,
0.2356393, -1.383296, 2.474047, 1, 1, 1, 1, 1,
0.2381881, 0.7825746, 0.4302868, 1, 1, 1, 1, 1,
0.2409506, 1.681038, 0.09496617, 1, 1, 1, 1, 1,
0.2440876, 0.5378125, -0.04509521, 1, 1, 1, 1, 1,
0.246254, 0.1953811, 2.370355, 0, 0, 1, 1, 1,
0.2477216, -0.3300092, 1.930613, 1, 0, 0, 1, 1,
0.2499065, 0.8453605, -0.940726, 1, 0, 0, 1, 1,
0.2500137, 0.6468596, -0.6767051, 1, 0, 0, 1, 1,
0.2547326, -0.09236839, 1.238888, 1, 0, 0, 1, 1,
0.2567149, 1.166643, 0.7708702, 1, 0, 0, 1, 1,
0.2582328, 1.373034, 1.934444, 0, 0, 0, 1, 1,
0.2654489, -1.471202, 3.348835, 0, 0, 0, 1, 1,
0.2670235, -1.522633, 3.780608, 0, 0, 0, 1, 1,
0.2695638, 0.02738512, 0.9240515, 0, 0, 0, 1, 1,
0.272178, -0.1013621, 2.263772, 0, 0, 0, 1, 1,
0.2727877, -1.000714, 2.967633, 0, 0, 0, 1, 1,
0.2728758, 0.4595209, 0.1194682, 0, 0, 0, 1, 1,
0.2770208, 0.6550672, -1.323136, 1, 1, 1, 1, 1,
0.2776251, 0.7485487, 0.2945518, 1, 1, 1, 1, 1,
0.2801526, -0.3733446, 2.933228, 1, 1, 1, 1, 1,
0.2830147, -1.041476, 3.609669, 1, 1, 1, 1, 1,
0.2927537, 0.2464584, -2.369385, 1, 1, 1, 1, 1,
0.2971763, 1.517564, -0.1064533, 1, 1, 1, 1, 1,
0.2979766, 1.391425, 1.032936, 1, 1, 1, 1, 1,
0.304803, 0.6011631, 2.034423, 1, 1, 1, 1, 1,
0.3048522, -0.8847486, 3.85979, 1, 1, 1, 1, 1,
0.3127146, -0.04633068, 2.687167, 1, 1, 1, 1, 1,
0.3206996, 0.295716, 2.117883, 1, 1, 1, 1, 1,
0.3209401, -0.08301868, 1.377371, 1, 1, 1, 1, 1,
0.32111, 0.2390804, 0.6877439, 1, 1, 1, 1, 1,
0.3215594, -1.912792, 3.774168, 1, 1, 1, 1, 1,
0.3238714, 0.3263228, 0.9244988, 1, 1, 1, 1, 1,
0.3289736, 0.2363807, 2.398105, 0, 0, 1, 1, 1,
0.3321021, 1.0239, 0.9576843, 1, 0, 0, 1, 1,
0.3346542, 0.7822298, -0.1062798, 1, 0, 0, 1, 1,
0.3429744, 2.028378, -0.211837, 1, 0, 0, 1, 1,
0.344486, -0.06457677, 2.476809, 1, 0, 0, 1, 1,
0.3530578, 0.2003872, 1.165015, 1, 0, 0, 1, 1,
0.3541821, 0.3327407, -0.4906931, 0, 0, 0, 1, 1,
0.3674277, -0.5622052, -0.1016477, 0, 0, 0, 1, 1,
0.3689886, 2.271662, 0.3924312, 0, 0, 0, 1, 1,
0.3703882, 0.05048862, 1.933912, 0, 0, 0, 1, 1,
0.3765892, 0.8852993, 0.3854439, 0, 0, 0, 1, 1,
0.3803152, -0.8029575, 2.607432, 0, 0, 0, 1, 1,
0.3811652, -1.189869, 4.047908, 0, 0, 0, 1, 1,
0.3835489, -0.4940864, 2.495491, 1, 1, 1, 1, 1,
0.3838927, 2.258195, 1.239218, 1, 1, 1, 1, 1,
0.3839079, -0.8809324, 2.379264, 1, 1, 1, 1, 1,
0.3864937, -0.5062571, 1.585229, 1, 1, 1, 1, 1,
0.3889604, -0.2498494, 0.04817755, 1, 1, 1, 1, 1,
0.3892883, 0.6015654, 1.45341, 1, 1, 1, 1, 1,
0.394067, -0.5362078, 2.283269, 1, 1, 1, 1, 1,
0.3948423, 0.7853489, -1.855296, 1, 1, 1, 1, 1,
0.3972219, -0.8363886, 2.789943, 1, 1, 1, 1, 1,
0.4000703, 0.4383256, 0.9272122, 1, 1, 1, 1, 1,
0.4004475, 0.4332206, 0.8238854, 1, 1, 1, 1, 1,
0.4034046, 0.3926772, -0.7038026, 1, 1, 1, 1, 1,
0.4062112, -0.1920401, 2.832092, 1, 1, 1, 1, 1,
0.4085982, 0.9630789, -0.1696872, 1, 1, 1, 1, 1,
0.4182417, 0.9506606, 0.3941257, 1, 1, 1, 1, 1,
0.422286, 1.217781, -1.420282, 0, 0, 1, 1, 1,
0.4321992, -0.5929336, 4.130164, 1, 0, 0, 1, 1,
0.4345153, -1.380732, 2.977041, 1, 0, 0, 1, 1,
0.4402212, -1.272426, 3.239883, 1, 0, 0, 1, 1,
0.4420956, -1.500166, 3.51125, 1, 0, 0, 1, 1,
0.4468053, -0.2000339, 3.411188, 1, 0, 0, 1, 1,
0.4483844, 0.03585843, 1.415484, 0, 0, 0, 1, 1,
0.4525099, 1.324854, 0.6334736, 0, 0, 0, 1, 1,
0.4527821, -0.3213149, 3.17163, 0, 0, 0, 1, 1,
0.462017, -0.7657596, 1.385112, 0, 0, 0, 1, 1,
0.4621356, -0.4059435, 2.473698, 0, 0, 0, 1, 1,
0.4621933, 1.102088, 1.799101, 0, 0, 0, 1, 1,
0.4760228, 0.7871191, -1.114218, 0, 0, 0, 1, 1,
0.4811724, 1.36258, -1.118401, 1, 1, 1, 1, 1,
0.4812149, -0.6320341, 2.282557, 1, 1, 1, 1, 1,
0.4852968, -0.77694, 1.10827, 1, 1, 1, 1, 1,
0.4868493, 1.079803, 0.06447665, 1, 1, 1, 1, 1,
0.4882853, -0.8585364, 3.22376, 1, 1, 1, 1, 1,
0.4884854, -0.8790258, 1.156753, 1, 1, 1, 1, 1,
0.4901765, 0.311001, 1.346953, 1, 1, 1, 1, 1,
0.4933021, 2.289546, 1.520988, 1, 1, 1, 1, 1,
0.4966988, -1.393477, 2.755683, 1, 1, 1, 1, 1,
0.4976276, 0.01066122, 2.16023, 1, 1, 1, 1, 1,
0.4997122, -0.5783146, 2.813833, 1, 1, 1, 1, 1,
0.5046337, -0.315999, 1.448679, 1, 1, 1, 1, 1,
0.5048029, -0.5372604, 2.50527, 1, 1, 1, 1, 1,
0.5094485, -0.3339607, 1.786153, 1, 1, 1, 1, 1,
0.5104, -1.772589, 2.985125, 1, 1, 1, 1, 1,
0.511566, 1.123061, 0.4833569, 0, 0, 1, 1, 1,
0.5117484, -0.6805511, 3.641759, 1, 0, 0, 1, 1,
0.5141689, 0.1537467, -0.1967507, 1, 0, 0, 1, 1,
0.5187285, 0.5912661, 2.142739, 1, 0, 0, 1, 1,
0.5194589, 0.6946355, 2.460247, 1, 0, 0, 1, 1,
0.5260677, -0.2918248, 2.289535, 1, 0, 0, 1, 1,
0.5329291, -1.17913, 2.779483, 0, 0, 0, 1, 1,
0.5390144, 0.3129732, 0.3483604, 0, 0, 0, 1, 1,
0.5397729, -0.8784029, 2.894939, 0, 0, 0, 1, 1,
0.5413249, -0.7146718, 2.282866, 0, 0, 0, 1, 1,
0.5429655, -0.2294801, 2.382621, 0, 0, 0, 1, 1,
0.5445307, -0.822381, 3.136148, 0, 0, 0, 1, 1,
0.5544318, 0.01273135, 2.63445, 0, 0, 0, 1, 1,
0.5632691, 1.710918, 1.6623, 1, 1, 1, 1, 1,
0.5655494, -0.4346813, 0.7891786, 1, 1, 1, 1, 1,
0.5661995, -0.6471272, 1.501634, 1, 1, 1, 1, 1,
0.5693014, 0.6350285, 1.517423, 1, 1, 1, 1, 1,
0.5709573, 0.2968599, 1.00455, 1, 1, 1, 1, 1,
0.5814639, 0.3598181, 1.357978, 1, 1, 1, 1, 1,
0.5842937, 0.4749006, 2.778832, 1, 1, 1, 1, 1,
0.5848822, -0.1464292, 2.516887, 1, 1, 1, 1, 1,
0.5931265, 0.09731124, 2.009132, 1, 1, 1, 1, 1,
0.5932423, 0.655977, 0.9575505, 1, 1, 1, 1, 1,
0.593375, 0.09603728, 1.71726, 1, 1, 1, 1, 1,
0.6012861, 0.5658779, 1.930475, 1, 1, 1, 1, 1,
0.6034986, -0.4278989, 2.099216, 1, 1, 1, 1, 1,
0.6044774, -1.428087, 3.075598, 1, 1, 1, 1, 1,
0.6073373, 0.1629974, -1.516294, 1, 1, 1, 1, 1,
0.6078387, 1.428674, 0.2113449, 0, 0, 1, 1, 1,
0.6100512, 1.190354, 0.1399159, 1, 0, 0, 1, 1,
0.610913, -0.3869174, 2.311966, 1, 0, 0, 1, 1,
0.6131667, -1.046327, 1.557979, 1, 0, 0, 1, 1,
0.6148339, 0.1502605, 1.269805, 1, 0, 0, 1, 1,
0.6177825, 0.3360352, 1.000137, 1, 0, 0, 1, 1,
0.6179927, -0.1626993, 0.1221559, 0, 0, 0, 1, 1,
0.6204508, 0.01283944, 1.615955, 0, 0, 0, 1, 1,
0.621823, 0.967482, 0.6256633, 0, 0, 0, 1, 1,
0.6238366, -0.771551, 2.751054, 0, 0, 0, 1, 1,
0.6332116, 0.8907169, 1.917027, 0, 0, 0, 1, 1,
0.635116, 0.4842491, 0.966967, 0, 0, 0, 1, 1,
0.6367318, 0.8413253, 0.01111995, 0, 0, 0, 1, 1,
0.636994, -1.09864, 2.771885, 1, 1, 1, 1, 1,
0.6391571, 0.1958912, 0.2485672, 1, 1, 1, 1, 1,
0.6445007, 0.1330102, -0.6305785, 1, 1, 1, 1, 1,
0.6466933, -0.03498072, 1.630021, 1, 1, 1, 1, 1,
0.6482207, 1.097828, -1.483396, 1, 1, 1, 1, 1,
0.6506537, 0.8947036, 1.422706, 1, 1, 1, 1, 1,
0.6507204, -0.2843434, 0.9266257, 1, 1, 1, 1, 1,
0.6519522, 1.702171, 1.08497, 1, 1, 1, 1, 1,
0.6521993, -0.6959805, 1.36268, 1, 1, 1, 1, 1,
0.6526319, -0.532419, 1.210801, 1, 1, 1, 1, 1,
0.6529632, 0.7744, -0.6677193, 1, 1, 1, 1, 1,
0.6561213, -0.5188216, 0.009897583, 1, 1, 1, 1, 1,
0.6638359, 0.6628048, 1.014164, 1, 1, 1, 1, 1,
0.6643943, 0.6396936, 1.528522, 1, 1, 1, 1, 1,
0.6652603, 0.4535347, 1.441934, 1, 1, 1, 1, 1,
0.6700874, -2.348983, 1.339963, 0, 0, 1, 1, 1,
0.6710488, 1.597815, 2.135898, 1, 0, 0, 1, 1,
0.6715029, 0.518827, 1.507635, 1, 0, 0, 1, 1,
0.6789964, -0.8728728, 3.553353, 1, 0, 0, 1, 1,
0.679825, -0.7371522, 3.016381, 1, 0, 0, 1, 1,
0.6802339, 0.1634876, 0.6447674, 1, 0, 0, 1, 1,
0.6847292, 0.5246079, -0.3119846, 0, 0, 0, 1, 1,
0.6855898, -1.093554, 2.630323, 0, 0, 0, 1, 1,
0.6858468, -0.4233652, 4.605214, 0, 0, 0, 1, 1,
0.6863743, -0.4005411, 1.656081, 0, 0, 0, 1, 1,
0.686768, 0.1147338, 2.293063, 0, 0, 0, 1, 1,
0.688813, -0.7253752, 2.171597, 0, 0, 0, 1, 1,
0.6925762, 0.4286712, 0.1349135, 0, 0, 0, 1, 1,
0.693343, 0.1381701, 1.443039, 1, 1, 1, 1, 1,
0.6956682, 0.6628133, 0.3703128, 1, 1, 1, 1, 1,
0.6967755, -0.6001895, 1.975734, 1, 1, 1, 1, 1,
0.6985615, 1.003896, 0.1767339, 1, 1, 1, 1, 1,
0.7037246, -1.246109, 2.385558, 1, 1, 1, 1, 1,
0.7038889, -1.428788, 1.550052, 1, 1, 1, 1, 1,
0.7058045, 0.6381036, 0.8352543, 1, 1, 1, 1, 1,
0.7084846, -0.2543943, 1.952257, 1, 1, 1, 1, 1,
0.7091253, 0.8092687, 2.648027, 1, 1, 1, 1, 1,
0.7126815, -1.301319, 2.266285, 1, 1, 1, 1, 1,
0.7139503, -0.5974052, 1.70313, 1, 1, 1, 1, 1,
0.7187735, -1.472489, 2.725881, 1, 1, 1, 1, 1,
0.7201259, -0.7223123, 4.371601, 1, 1, 1, 1, 1,
0.7238752, 1.341081, -0.6799626, 1, 1, 1, 1, 1,
0.7253644, -0.1212164, 0.9476979, 1, 1, 1, 1, 1,
0.7271205, -1.441454, 3.793527, 0, 0, 1, 1, 1,
0.7274944, 1.698081, -0.09159833, 1, 0, 0, 1, 1,
0.7284152, -0.4478576, 3.38161, 1, 0, 0, 1, 1,
0.7322941, -0.4088975, 1.369876, 1, 0, 0, 1, 1,
0.7345944, 0.9379963, 1.06008, 1, 0, 0, 1, 1,
0.7396163, -1.480764, 4.041563, 1, 0, 0, 1, 1,
0.7409487, -0.3509707, 1.215531, 0, 0, 0, 1, 1,
0.74097, 2.632138, -1.107852, 0, 0, 0, 1, 1,
0.7474435, -0.3989985, 1.639588, 0, 0, 0, 1, 1,
0.7481137, -0.6498298, 2.196968, 0, 0, 0, 1, 1,
0.7490265, -0.2336879, 1.071039, 0, 0, 0, 1, 1,
0.7532874, -0.7030036, 2.540059, 0, 0, 0, 1, 1,
0.754105, 1.476773, -0.7551849, 0, 0, 0, 1, 1,
0.7570009, 0.5562993, 3.598631, 1, 1, 1, 1, 1,
0.7576564, -0.3716607, 3.74444, 1, 1, 1, 1, 1,
0.7591395, 1.92718, 2.944539, 1, 1, 1, 1, 1,
0.7668065, -0.7872025, 3.745826, 1, 1, 1, 1, 1,
0.7774976, 1.608067, 0.520732, 1, 1, 1, 1, 1,
0.7798268, 1.012444, -1.743535, 1, 1, 1, 1, 1,
0.781631, -0.4344039, 1.612324, 1, 1, 1, 1, 1,
0.7825069, -0.1129771, 0.2522361, 1, 1, 1, 1, 1,
0.7857059, -1.040146, 3.269455, 1, 1, 1, 1, 1,
0.7872955, 0.5126377, 1.233161, 1, 1, 1, 1, 1,
0.7930713, -0.4579834, 1.904969, 1, 1, 1, 1, 1,
0.7996579, 0.5267238, 1.016904, 1, 1, 1, 1, 1,
0.8020479, -0.7176052, 2.821574, 1, 1, 1, 1, 1,
0.8066512, 1.536001, 0.2743317, 1, 1, 1, 1, 1,
0.8107453, 0.3921879, 0.8130177, 1, 1, 1, 1, 1,
0.8210828, -1.536106, 1.911563, 0, 0, 1, 1, 1,
0.8223358, -0.674657, 3.75285, 1, 0, 0, 1, 1,
0.8307742, 0.2482658, 0.66596, 1, 0, 0, 1, 1,
0.833983, 0.3169635, 2.726474, 1, 0, 0, 1, 1,
0.8399792, 1.058249, 0.8601843, 1, 0, 0, 1, 1,
0.8413661, 0.9619484, 1.825989, 1, 0, 0, 1, 1,
0.8425612, 0.08717977, 1.510432, 0, 0, 0, 1, 1,
0.8469877, 0.7105774, 0.347793, 0, 0, 0, 1, 1,
0.8472089, -0.3216544, 1.617985, 0, 0, 0, 1, 1,
0.8485172, -1.861877, 3.370411, 0, 0, 0, 1, 1,
0.8509943, -1.346811, 1.330507, 0, 0, 0, 1, 1,
0.8542162, -0.4218087, 4.760437, 0, 0, 0, 1, 1,
0.8568951, -1.049238, 2.850368, 0, 0, 0, 1, 1,
0.8592793, -0.05671911, 0.6569368, 1, 1, 1, 1, 1,
0.8599257, -0.5140164, 2.761627, 1, 1, 1, 1, 1,
0.8649175, -0.246033, 2.910563, 1, 1, 1, 1, 1,
0.8679248, -0.5503048, 1.211316, 1, 1, 1, 1, 1,
0.8738001, 0.04468589, 0.9813827, 1, 1, 1, 1, 1,
0.8738881, -0.546396, 1.5127, 1, 1, 1, 1, 1,
0.8756464, -0.1163453, 1.097565, 1, 1, 1, 1, 1,
0.8769631, -1.24468, 2.718761, 1, 1, 1, 1, 1,
0.9128173, 1.8352, 1.539105, 1, 1, 1, 1, 1,
0.9172279, -1.088302, 4.217575, 1, 1, 1, 1, 1,
0.9180049, -1.7453, 3.005613, 1, 1, 1, 1, 1,
0.923289, 0.2899287, 2.499919, 1, 1, 1, 1, 1,
0.9355034, -1.677697, 3.580042, 1, 1, 1, 1, 1,
0.9398499, 1.005908, 2.164174, 1, 1, 1, 1, 1,
0.9410959, -0.5631139, 2.608081, 1, 1, 1, 1, 1,
0.9434815, -0.5976605, 2.27419, 0, 0, 1, 1, 1,
0.9448929, 0.305288, 2.01412, 1, 0, 0, 1, 1,
0.9494133, -0.05492619, 2.228433, 1, 0, 0, 1, 1,
0.9496199, 1.031126, 1.171764, 1, 0, 0, 1, 1,
0.956689, -1.441614, 2.952602, 1, 0, 0, 1, 1,
0.9569219, 0.352598, 0.02027148, 1, 0, 0, 1, 1,
0.9602281, -0.1187136, 0.8530418, 0, 0, 0, 1, 1,
0.9625999, -1.38071, 1.986707, 0, 0, 0, 1, 1,
0.9640183, -0.1984407, 1.323409, 0, 0, 0, 1, 1,
0.9654215, -0.6392254, 3.293663, 0, 0, 0, 1, 1,
0.9684926, 0.5631331, 1.892979, 0, 0, 0, 1, 1,
0.9701294, -1.601561, 3.059636, 0, 0, 0, 1, 1,
0.9772242, 0.7404257, -0.06011144, 0, 0, 0, 1, 1,
0.9774907, 0.306835, 1.981845, 1, 1, 1, 1, 1,
0.9950148, -0.4548517, 2.901109, 1, 1, 1, 1, 1,
1.004269, 1.11008, 0.4743391, 1, 1, 1, 1, 1,
1.008096, 0.3277727, 2.41193, 1, 1, 1, 1, 1,
1.013856, 1.394185, 0.3980001, 1, 1, 1, 1, 1,
1.021085, -1.489197, 3.157147, 1, 1, 1, 1, 1,
1.021481, -0.8153028, 1.772298, 1, 1, 1, 1, 1,
1.029675, -0.007816358, 0.2242723, 1, 1, 1, 1, 1,
1.033486, -0.1850296, 2.898417, 1, 1, 1, 1, 1,
1.035672, -0.1459347, 2.39504, 1, 1, 1, 1, 1,
1.040289, 1.86818, 0.6958068, 1, 1, 1, 1, 1,
1.040537, 0.3604896, 0.5842483, 1, 1, 1, 1, 1,
1.042964, -1.310468, 0.581381, 1, 1, 1, 1, 1,
1.05122, -2.34629, 3.437284, 1, 1, 1, 1, 1,
1.054667, 0.04886152, 2.505471, 1, 1, 1, 1, 1,
1.054937, -0.6148233, 1.773833, 0, 0, 1, 1, 1,
1.056434, 0.02382886, 3.047403, 1, 0, 0, 1, 1,
1.067577, -1.488697, 2.362558, 1, 0, 0, 1, 1,
1.084716, -2.256478, 2.495975, 1, 0, 0, 1, 1,
1.084741, -0.1818378, 0.7353771, 1, 0, 0, 1, 1,
1.091078, -0.6040848, 1.893955, 1, 0, 0, 1, 1,
1.103578, -1.274797, 1.994394, 0, 0, 0, 1, 1,
1.103689, 0.06550595, 1.655539, 0, 0, 0, 1, 1,
1.111375, 0.235696, 0.6519811, 0, 0, 0, 1, 1,
1.112498, -0.5419345, 3.836466, 0, 0, 0, 1, 1,
1.118356, 0.5446607, 2.659137, 0, 0, 0, 1, 1,
1.119453, 0.3695207, 0.8686661, 0, 0, 0, 1, 1,
1.1239, -0.2651522, 0.3588099, 0, 0, 0, 1, 1,
1.124899, -0.7113463, 2.19425, 1, 1, 1, 1, 1,
1.126453, -0.3849358, 2.754094, 1, 1, 1, 1, 1,
1.140434, -0.1892877, 0.4556074, 1, 1, 1, 1, 1,
1.155693, 0.8726749, 1.887845, 1, 1, 1, 1, 1,
1.156692, -0.08121389, 0.5728379, 1, 1, 1, 1, 1,
1.163671, 0.2795464, 1.354191, 1, 1, 1, 1, 1,
1.16892, 0.2204015, 1.253936, 1, 1, 1, 1, 1,
1.173977, -2.551901, 2.116373, 1, 1, 1, 1, 1,
1.174892, 0.663965, 1.523134, 1, 1, 1, 1, 1,
1.176558, -1.19884, 2.004564, 1, 1, 1, 1, 1,
1.179954, -0.05954816, 1.955966, 1, 1, 1, 1, 1,
1.179996, -0.8588343, 2.576619, 1, 1, 1, 1, 1,
1.183023, 0.2395952, -0.5159236, 1, 1, 1, 1, 1,
1.192507, 1.370122, 0.2435833, 1, 1, 1, 1, 1,
1.195656, 0.836163, 0.7594893, 1, 1, 1, 1, 1,
1.198467, -0.7701834, 2.127181, 0, 0, 1, 1, 1,
1.1985, -1.673287, 2.598109, 1, 0, 0, 1, 1,
1.206027, -1.313892, 2.720999, 1, 0, 0, 1, 1,
1.206059, 0.4586379, -0.05541461, 1, 0, 0, 1, 1,
1.208794, 0.2695535, 1.105857, 1, 0, 0, 1, 1,
1.210024, 0.1461957, 0.624508, 1, 0, 0, 1, 1,
1.226044, -0.5270477, 0.3909186, 0, 0, 0, 1, 1,
1.232359, -0.9356028, 1.745242, 0, 0, 0, 1, 1,
1.23241, -0.8547406, 3.644462, 0, 0, 0, 1, 1,
1.24991, -1.300666, 1.869032, 0, 0, 0, 1, 1,
1.259569, 1.476254, 1.429729, 0, 0, 0, 1, 1,
1.273637, 0.530326, 0.6215418, 0, 0, 0, 1, 1,
1.277311, -0.8733755, 1.920387, 0, 0, 0, 1, 1,
1.277325, -0.4159954, 1.325317, 1, 1, 1, 1, 1,
1.279377, 1.033148, 0.436472, 1, 1, 1, 1, 1,
1.279739, 0.6944035, 0.6262261, 1, 1, 1, 1, 1,
1.283238, -1.171147, 1.439265, 1, 1, 1, 1, 1,
1.291144, 1.320513, 1.726781, 1, 1, 1, 1, 1,
1.300275, 2.299102, 0.207917, 1, 1, 1, 1, 1,
1.303957, 0.8592273, 0.7363484, 1, 1, 1, 1, 1,
1.310417, 1.441803, 0.09679098, 1, 1, 1, 1, 1,
1.312792, 0.3493642, 1.095681, 1, 1, 1, 1, 1,
1.313785, -0.2619371, 0.5401018, 1, 1, 1, 1, 1,
1.321368, 0.07402289, 2.814824, 1, 1, 1, 1, 1,
1.322123, -0.5261899, 2.01442, 1, 1, 1, 1, 1,
1.326921, 0.2274078, 3.737862, 1, 1, 1, 1, 1,
1.330894, -0.8814093, 2.008196, 1, 1, 1, 1, 1,
1.331532, -0.589166, 1.101626, 1, 1, 1, 1, 1,
1.342066, -0.1412589, 1.969306, 0, 0, 1, 1, 1,
1.35465, 0.6698701, -0.319176, 1, 0, 0, 1, 1,
1.356834, 1.041205, -0.5934871, 1, 0, 0, 1, 1,
1.366767, 0.3596087, 3.13122, 1, 0, 0, 1, 1,
1.367167, 2.015957, 1.688606, 1, 0, 0, 1, 1,
1.373761, -0.9026628, 0.758812, 1, 0, 0, 1, 1,
1.382602, 1.960058, 1.543042, 0, 0, 0, 1, 1,
1.38487, 0.3693376, 1.880925, 0, 0, 0, 1, 1,
1.38601, -1.680745, 3.913446, 0, 0, 0, 1, 1,
1.386404, -1.050471, -0.02325292, 0, 0, 0, 1, 1,
1.391748, 0.1661395, 1.339744, 0, 0, 0, 1, 1,
1.392688, 1.148426, 0.2607923, 0, 0, 0, 1, 1,
1.39368, -0.8174821, 0.6934584, 0, 0, 0, 1, 1,
1.404275, -0.2555766, 2.502085, 1, 1, 1, 1, 1,
1.404654, 0.2372628, 1.513851, 1, 1, 1, 1, 1,
1.415228, -1.024065, 3.576701, 1, 1, 1, 1, 1,
1.418882, 2.431508, 0.5618217, 1, 1, 1, 1, 1,
1.427107, 0.3584828, 1.309699, 1, 1, 1, 1, 1,
1.446317, -0.3034364, 2.201649, 1, 1, 1, 1, 1,
1.44716, -0.498056, 2.292785, 1, 1, 1, 1, 1,
1.450867, -1.163902, 3.721773, 1, 1, 1, 1, 1,
1.452575, -1.085915, 1.453006, 1, 1, 1, 1, 1,
1.455733, -0.486488, -0.01294858, 1, 1, 1, 1, 1,
1.458562, -2.51241, 3.142911, 1, 1, 1, 1, 1,
1.471018, -0.8009074, 2.265342, 1, 1, 1, 1, 1,
1.480373, -0.5890893, 2.060729, 1, 1, 1, 1, 1,
1.485287, -0.04927077, 1.438295, 1, 1, 1, 1, 1,
1.495255, -0.6973084, 2.778595, 1, 1, 1, 1, 1,
1.495389, -1.488503, 2.878451, 0, 0, 1, 1, 1,
1.515925, -0.06038665, 1.242597, 1, 0, 0, 1, 1,
1.51772, -0.5617679, 2.315473, 1, 0, 0, 1, 1,
1.523891, 0.5341324, 2.368059, 1, 0, 0, 1, 1,
1.525237, 0.7056679, -0.4619514, 1, 0, 0, 1, 1,
1.542372, -1.106701, 3.018228, 1, 0, 0, 1, 1,
1.543295, -0.7996917, 1.635, 0, 0, 0, 1, 1,
1.544741, 0.8686384, 0.8841096, 0, 0, 0, 1, 1,
1.548819, -0.3964811, -1.120342, 0, 0, 0, 1, 1,
1.565823, -0.6592814, 2.20757, 0, 0, 0, 1, 1,
1.571719, -0.3327304, 2.046296, 0, 0, 0, 1, 1,
1.580064, -0.3966747, 1.355622, 0, 0, 0, 1, 1,
1.580108, -1.080683, 2.964412, 0, 0, 0, 1, 1,
1.584733, -0.04634268, 0.3546006, 1, 1, 1, 1, 1,
1.587954, 1.128239, 3.460331, 1, 1, 1, 1, 1,
1.589604, -1.512099, 2.705041, 1, 1, 1, 1, 1,
1.592858, -1.283167, 1.131143, 1, 1, 1, 1, 1,
1.623698, 1.417641, 3.546682, 1, 1, 1, 1, 1,
1.636276, 1.065184, 1.404649, 1, 1, 1, 1, 1,
1.659526, -0.5397223, 2.248568, 1, 1, 1, 1, 1,
1.666771, 0.5893928, 1.882187, 1, 1, 1, 1, 1,
1.704994, -2.282145, 1.540458, 1, 1, 1, 1, 1,
1.731027, 2.632252, 1.259304, 1, 1, 1, 1, 1,
1.741496, 0.8442073, 1.895362, 1, 1, 1, 1, 1,
1.74335, 0.1963787, 1.567878, 1, 1, 1, 1, 1,
1.746034, 1.215014, 0.8679099, 1, 1, 1, 1, 1,
1.747618, 0.7468811, 1.124964, 1, 1, 1, 1, 1,
1.756196, 0.3041321, 1.132096, 1, 1, 1, 1, 1,
1.765322, 0.3754102, -0.4470415, 0, 0, 1, 1, 1,
1.770663, -0.6716645, 1.602968, 1, 0, 0, 1, 1,
1.784628, -1.370379, 3.076446, 1, 0, 0, 1, 1,
1.792505, -0.3507657, 2.741435, 1, 0, 0, 1, 1,
1.808528, 0.2246516, 1.050385, 1, 0, 0, 1, 1,
1.818601, 0.4376528, 1.619229, 1, 0, 0, 1, 1,
1.821645, -0.9995435, 3.242295, 0, 0, 0, 1, 1,
1.847258, -0.06385639, -0.2287626, 0, 0, 0, 1, 1,
1.854127, 0.7914134, 1.006052, 0, 0, 0, 1, 1,
1.863697, 0.1458622, 1.288933, 0, 0, 0, 1, 1,
1.929622, 0.006205202, 1.781613, 0, 0, 0, 1, 1,
1.933437, -0.842026, 3.001268, 0, 0, 0, 1, 1,
1.937111, 0.5764199, -0.06670247, 0, 0, 0, 1, 1,
1.951619, -0.5358687, 2.126514, 1, 1, 1, 1, 1,
1.954352, -0.6319761, 1.588587, 1, 1, 1, 1, 1,
1.974747, -0.2152758, 2.104547, 1, 1, 1, 1, 1,
1.97812, -1.396418, 3.20818, 1, 1, 1, 1, 1,
1.983141, -0.8976098, 1.800793, 1, 1, 1, 1, 1,
2.024978, -0.6229455, 3.056043, 1, 1, 1, 1, 1,
2.034736, -0.7204543, 2.041082, 1, 1, 1, 1, 1,
2.038421, -0.5842431, 1.084011, 1, 1, 1, 1, 1,
2.038728, -0.2121222, 1.837484, 1, 1, 1, 1, 1,
2.047678, 0.8654194, 0.7862147, 1, 1, 1, 1, 1,
2.076291, 2.159114, 0.6153098, 1, 1, 1, 1, 1,
2.097917, -0.1047556, 1.20311, 1, 1, 1, 1, 1,
2.133976, -1.570464, 0.8619361, 1, 1, 1, 1, 1,
2.189478, 0.5968065, 0.6315728, 1, 1, 1, 1, 1,
2.217514, -1.232328, 0.7808556, 1, 1, 1, 1, 1,
2.276589, 0.06628881, -0.1520217, 0, 0, 1, 1, 1,
2.280866, -0.6000534, 2.553676, 1, 0, 0, 1, 1,
2.285967, -0.3719843, 1.401794, 1, 0, 0, 1, 1,
2.289125, -1.745537, 2.157289, 1, 0, 0, 1, 1,
2.302421, 0.7483496, 2.652885, 1, 0, 0, 1, 1,
2.309879, 0.188741, 1.800356, 1, 0, 0, 1, 1,
2.313815, 0.2098384, 0.8060013, 0, 0, 0, 1, 1,
2.315077, 1.483488, 0.7905714, 0, 0, 0, 1, 1,
2.330629, 0.436382, 3.540572, 0, 0, 0, 1, 1,
2.33521, 0.1489196, 0.4471194, 0, 0, 0, 1, 1,
2.402474, 0.08326107, 1.429243, 0, 0, 0, 1, 1,
2.428845, -1.1373, 1.781379, 0, 0, 0, 1, 1,
2.463404, -0.1458541, 0.3521071, 0, 0, 0, 1, 1,
2.476049, 0.2842998, 1.527678, 1, 1, 1, 1, 1,
2.549214, -0.3799384, 2.12379, 1, 1, 1, 1, 1,
2.604711, -0.2349238, 2.007882, 1, 1, 1, 1, 1,
2.618087, 2.207977, 0.7082003, 1, 1, 1, 1, 1,
2.671301, 0.2998731, 0.7493109, 1, 1, 1, 1, 1,
2.975767, 0.3658999, 1.575969, 1, 1, 1, 1, 1,
3.009849, 2.042407, 2.487542, 1, 1, 1, 1, 1
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
var radius = 10.00988;
var distance = 35.15928;
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
mvMatrix.translate( -0.07405877, -0.3196515, -0.8624313 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.15928);
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
