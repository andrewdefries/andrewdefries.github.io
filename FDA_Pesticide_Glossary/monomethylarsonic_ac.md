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
-3.17668, -1.330452, -1.670181, 1, 0, 0, 1,
-3.106289, -0.7303379, -2.654502, 1, 0.007843138, 0, 1,
-2.745324, 1.109797, -3.86411, 1, 0.01176471, 0, 1,
-2.637151, 0.07569461, -1.312237, 1, 0.01960784, 0, 1,
-2.619242, 0.1954992, -2.1234, 1, 0.02352941, 0, 1,
-2.54759, -1.316026, -2.265008, 1, 0.03137255, 0, 1,
-2.481658, -0.6096126, -0.4804794, 1, 0.03529412, 0, 1,
-2.419282, 0.7375708, -1.350639, 1, 0.04313726, 0, 1,
-2.397182, 0.7135018, -0.3865435, 1, 0.04705882, 0, 1,
-2.3589, 0.2397793, -1.056293, 1, 0.05490196, 0, 1,
-2.340047, -2.085872, -2.088676, 1, 0.05882353, 0, 1,
-2.308059, -0.2110747, 0.2724552, 1, 0.06666667, 0, 1,
-2.248439, 0.2010968, -1.187103, 1, 0.07058824, 0, 1,
-2.210822, -0.6374614, -2.06519, 1, 0.07843138, 0, 1,
-2.188303, -0.8130516, -2.288504, 1, 0.08235294, 0, 1,
-2.180492, -1.11666, -2.235946, 1, 0.09019608, 0, 1,
-2.14272, 1.741279, -0.02320155, 1, 0.09411765, 0, 1,
-2.11915, -0.5144229, -0.1946422, 1, 0.1019608, 0, 1,
-2.115024, -0.01195435, -2.257393, 1, 0.1098039, 0, 1,
-2.090106, 0.1797238, -1.259266, 1, 0.1137255, 0, 1,
-2.082761, 0.7200142, -0.9435717, 1, 0.1215686, 0, 1,
-2.07528, -0.09373274, -2.419865, 1, 0.1254902, 0, 1,
-2.023104, 0.4950485, -0.839784, 1, 0.1333333, 0, 1,
-2.0124, -0.1537206, -3.088791, 1, 0.1372549, 0, 1,
-1.979119, 0.2482693, -0.1568603, 1, 0.145098, 0, 1,
-1.974553, 1.025181, 1.08273, 1, 0.1490196, 0, 1,
-1.913572, 0.2976438, -1.438953, 1, 0.1568628, 0, 1,
-1.907067, -0.872323, -0.3263056, 1, 0.1607843, 0, 1,
-1.886853, -0.5439143, -1.189497, 1, 0.1686275, 0, 1,
-1.857844, 0.5426551, -1.484322, 1, 0.172549, 0, 1,
-1.846947, -1.090192, -2.459517, 1, 0.1803922, 0, 1,
-1.84471, -0.06417663, -2.119874, 1, 0.1843137, 0, 1,
-1.808236, 0.6369479, -0.6876053, 1, 0.1921569, 0, 1,
-1.806849, -0.4319096, -2.170954, 1, 0.1960784, 0, 1,
-1.791507, 0.6681578, 0.008229541, 1, 0.2039216, 0, 1,
-1.789148, -1.175312, -2.222269, 1, 0.2117647, 0, 1,
-1.778146, 0.7044861, -1.027335, 1, 0.2156863, 0, 1,
-1.776526, 1.427925, 0.1366512, 1, 0.2235294, 0, 1,
-1.760575, 1.23054, -3.065197, 1, 0.227451, 0, 1,
-1.753307, 0.7394617, -0.9455618, 1, 0.2352941, 0, 1,
-1.749987, -0.8934649, -2.473371, 1, 0.2392157, 0, 1,
-1.741795, -0.9655939, -1.748947, 1, 0.2470588, 0, 1,
-1.706506, 2.484279, -1.274405, 1, 0.2509804, 0, 1,
-1.705084, 1.086069, -0.5842602, 1, 0.2588235, 0, 1,
-1.704276, 1.076557, -1.192089, 1, 0.2627451, 0, 1,
-1.699616, -0.3965988, -0.6879621, 1, 0.2705882, 0, 1,
-1.650208, 0.003064211, -2.298222, 1, 0.2745098, 0, 1,
-1.64994, 0.7057527, -1.390754, 1, 0.282353, 0, 1,
-1.649921, -0.1367559, -2.050657, 1, 0.2862745, 0, 1,
-1.649153, -0.4187322, -1.495782, 1, 0.2941177, 0, 1,
-1.631618, -0.7017407, -2.224101, 1, 0.3019608, 0, 1,
-1.6008, -0.3693497, -1.668512, 1, 0.3058824, 0, 1,
-1.595934, -0.9954832, -2.60503, 1, 0.3137255, 0, 1,
-1.590888, 0.2478108, -0.8185915, 1, 0.3176471, 0, 1,
-1.588891, -0.4010172, -1.12734, 1, 0.3254902, 0, 1,
-1.575538, 0.9674009, -1.42155, 1, 0.3294118, 0, 1,
-1.575078, -0.5889075, -2.48328, 1, 0.3372549, 0, 1,
-1.564543, -1.583536, -2.808547, 1, 0.3411765, 0, 1,
-1.553756, -0.2973229, -2.729617, 1, 0.3490196, 0, 1,
-1.544106, -0.6353467, -2.699548, 1, 0.3529412, 0, 1,
-1.541787, 1.701507, -0.9232746, 1, 0.3607843, 0, 1,
-1.538005, -0.5237232, -2.066397, 1, 0.3647059, 0, 1,
-1.512578, -1.658165, -1.780143, 1, 0.372549, 0, 1,
-1.511281, -0.5843434, -0.5072787, 1, 0.3764706, 0, 1,
-1.49539, -0.6501181, -2.542691, 1, 0.3843137, 0, 1,
-1.493888, 2.091412, -0.5226025, 1, 0.3882353, 0, 1,
-1.434388, 0.4408939, -1.426812, 1, 0.3960784, 0, 1,
-1.401692, -0.7185334, -2.851638, 1, 0.4039216, 0, 1,
-1.398764, -0.9521065, -2.311489, 1, 0.4078431, 0, 1,
-1.386062, -0.288772, -1.734432, 1, 0.4156863, 0, 1,
-1.379754, -0.1332297, -0.9375135, 1, 0.4196078, 0, 1,
-1.377967, -0.8464115, -3.203485, 1, 0.427451, 0, 1,
-1.376822, 0.003253129, -0.99229, 1, 0.4313726, 0, 1,
-1.37191, -1.635683, -2.680696, 1, 0.4392157, 0, 1,
-1.369314, 0.4145533, -2.063869, 1, 0.4431373, 0, 1,
-1.368915, -0.3280309, -2.854214, 1, 0.4509804, 0, 1,
-1.355837, -0.8614047, -1.535761, 1, 0.454902, 0, 1,
-1.352406, -0.0477284, -3.404044, 1, 0.4627451, 0, 1,
-1.34733, 1.831901, -2.422834, 1, 0.4666667, 0, 1,
-1.346547, 0.07235462, -0.6500445, 1, 0.4745098, 0, 1,
-1.335788, -0.3627885, -0.905145, 1, 0.4784314, 0, 1,
-1.334174, -0.3104783, -1.183677, 1, 0.4862745, 0, 1,
-1.331668, 0.5940567, -1.959643, 1, 0.4901961, 0, 1,
-1.33032, -1.239702, -2.922402, 1, 0.4980392, 0, 1,
-1.32578, 0.7673763, -1.939154, 1, 0.5058824, 0, 1,
-1.318184, 0.9080544, -1.822956, 1, 0.509804, 0, 1,
-1.314592, -0.2796513, -2.349651, 1, 0.5176471, 0, 1,
-1.312872, -1.452011, -4.857115, 1, 0.5215687, 0, 1,
-1.311357, -1.195506, -0.9585929, 1, 0.5294118, 0, 1,
-1.308131, 0.4107488, -2.300289, 1, 0.5333334, 0, 1,
-1.307471, 0.7480418, -0.1731219, 1, 0.5411765, 0, 1,
-1.306377, 1.073255, -0.6297619, 1, 0.5450981, 0, 1,
-1.302089, 0.5096885, -1.773316, 1, 0.5529412, 0, 1,
-1.301548, -1.138924, -2.985847, 1, 0.5568628, 0, 1,
-1.297325, 0.6337902, -2.672266, 1, 0.5647059, 0, 1,
-1.295599, -0.0292789, -2.284982, 1, 0.5686275, 0, 1,
-1.277926, 0.6966158, -2.587924, 1, 0.5764706, 0, 1,
-1.275618, 0.7674594, -0.401206, 1, 0.5803922, 0, 1,
-1.273792, 0.2260065, -2.426742, 1, 0.5882353, 0, 1,
-1.269704, 0.4481705, -0.8479789, 1, 0.5921569, 0, 1,
-1.268698, 0.8570434, -2.050957, 1, 0.6, 0, 1,
-1.264541, -0.07012299, -3.079038, 1, 0.6078432, 0, 1,
-1.258403, -2.019426, -4.510607, 1, 0.6117647, 0, 1,
-1.255149, 0.8697649, -0.5383993, 1, 0.6196079, 0, 1,
-1.252366, 1.212928, 0.6739448, 1, 0.6235294, 0, 1,
-1.250188, -1.387623, -0.7682309, 1, 0.6313726, 0, 1,
-1.241886, 1.219939, -0.6611212, 1, 0.6352941, 0, 1,
-1.241643, -0.09086814, 0.7907303, 1, 0.6431373, 0, 1,
-1.236969, 0.945177, -0.2011798, 1, 0.6470588, 0, 1,
-1.234513, -0.04264958, -2.614431, 1, 0.654902, 0, 1,
-1.230376, -1.792449, -0.2491532, 1, 0.6588235, 0, 1,
-1.23029, 0.2676568, -0.6542408, 1, 0.6666667, 0, 1,
-1.219298, 1.201095, -0.1624823, 1, 0.6705883, 0, 1,
-1.208342, 0.5499921, -0.5319269, 1, 0.6784314, 0, 1,
-1.20757, 0.05079654, -0.7070365, 1, 0.682353, 0, 1,
-1.199821, -1.195382, -3.514585, 1, 0.6901961, 0, 1,
-1.189315, -1.094693, -2.90233, 1, 0.6941177, 0, 1,
-1.184788, 0.8996906, -1.890947, 1, 0.7019608, 0, 1,
-1.18367, -0.5455689, -2.92803, 1, 0.7098039, 0, 1,
-1.183009, -0.08200111, -0.9361083, 1, 0.7137255, 0, 1,
-1.18204, -1.119735, -3.174947, 1, 0.7215686, 0, 1,
-1.177658, -0.1640812, -2.800159, 1, 0.7254902, 0, 1,
-1.176701, -0.627705, -2.211475, 1, 0.7333333, 0, 1,
-1.174431, -0.2920324, -3.712633, 1, 0.7372549, 0, 1,
-1.174161, -0.597255, -0.9406721, 1, 0.7450981, 0, 1,
-1.170407, -2.365837, -3.551464, 1, 0.7490196, 0, 1,
-1.169763, -0.009390177, -1.199895, 1, 0.7568628, 0, 1,
-1.169211, 1.65368, -0.1185597, 1, 0.7607843, 0, 1,
-1.163059, -0.6495677, -2.952714, 1, 0.7686275, 0, 1,
-1.145621, 1.810416, -1.181559, 1, 0.772549, 0, 1,
-1.137908, -1.542638, -3.199393, 1, 0.7803922, 0, 1,
-1.131222, 0.4948988, -1.527233, 1, 0.7843137, 0, 1,
-1.130986, 0.454717, -1.055772, 1, 0.7921569, 0, 1,
-1.130537, 0.9476274, -2.184584, 1, 0.7960784, 0, 1,
-1.127091, 0.4359559, -0.3803651, 1, 0.8039216, 0, 1,
-1.117604, -0.4498434, -2.094707, 1, 0.8117647, 0, 1,
-1.102607, 0.7000231, 0.5650148, 1, 0.8156863, 0, 1,
-1.079782, 0.8697878, -0.4229109, 1, 0.8235294, 0, 1,
-1.079008, -1.160146, -0.7439059, 1, 0.827451, 0, 1,
-1.074699, 1.412829, -0.02364746, 1, 0.8352941, 0, 1,
-1.072676, -0.8626552, -2.27356, 1, 0.8392157, 0, 1,
-1.069275, -0.4365917, -0.8167703, 1, 0.8470588, 0, 1,
-1.068277, 0.8518718, -0.03748656, 1, 0.8509804, 0, 1,
-1.067696, -1.329869, -3.515587, 1, 0.8588235, 0, 1,
-1.0668, 0.1575147, 0.4621779, 1, 0.8627451, 0, 1,
-1.060588, -0.960171, -3.290882, 1, 0.8705882, 0, 1,
-1.058259, 1.455271, 0.1670538, 1, 0.8745098, 0, 1,
-1.058193, -0.3030258, -2.321605, 1, 0.8823529, 0, 1,
-1.050821, -0.6565908, -3.17025, 1, 0.8862745, 0, 1,
-1.048747, 0.8531564, 0.001350617, 1, 0.8941177, 0, 1,
-1.029039, 0.4676685, -0.05374926, 1, 0.8980392, 0, 1,
-1.02496, 0.3900055, -1.258196, 1, 0.9058824, 0, 1,
-1.020398, -0.5637216, -0.4512165, 1, 0.9137255, 0, 1,
-1.018608, 0.2556337, 0.08257136, 1, 0.9176471, 0, 1,
-1.01674, -0.9971156, -2.809586, 1, 0.9254902, 0, 1,
-1.003384, -1.31023, -2.271318, 1, 0.9294118, 0, 1,
-0.9999564, 0.2884543, -1.272207, 1, 0.9372549, 0, 1,
-0.9996924, -0.2222475, -1.484176, 1, 0.9411765, 0, 1,
-0.9996174, -1.917226, -1.17867, 1, 0.9490196, 0, 1,
-0.9957065, 0.2499388, -1.155722, 1, 0.9529412, 0, 1,
-0.9929202, 0.5524326, -0.6079739, 1, 0.9607843, 0, 1,
-0.9919962, 1.750229, -1.729167, 1, 0.9647059, 0, 1,
-0.9911292, -0.8271046, -0.3770621, 1, 0.972549, 0, 1,
-0.9815207, 1.90587, -0.9420695, 1, 0.9764706, 0, 1,
-0.96909, -1.415868, -1.362325, 1, 0.9843137, 0, 1,
-0.9688976, -0.7131061, -1.965506, 1, 0.9882353, 0, 1,
-0.9685888, 0.3289703, -1.177389, 1, 0.9960784, 0, 1,
-0.9685243, -0.9227431, -1.567503, 0.9960784, 1, 0, 1,
-0.9673373, 0.9816982, -0.2301556, 0.9921569, 1, 0, 1,
-0.9663671, -0.1154173, -1.102877, 0.9843137, 1, 0, 1,
-0.9646917, -1.241376, -2.785232, 0.9803922, 1, 0, 1,
-0.9633151, -0.7422882, -2.86254, 0.972549, 1, 0, 1,
-0.9620572, 0.1254258, -1.890253, 0.9686275, 1, 0, 1,
-0.9618793, 1.017579, -0.2667483, 0.9607843, 1, 0, 1,
-0.9590282, 0.237153, -1.254926, 0.9568627, 1, 0, 1,
-0.9561052, 0.1352973, -0.7770433, 0.9490196, 1, 0, 1,
-0.9535952, 0.4294205, -1.949006, 0.945098, 1, 0, 1,
-0.9514598, -1.108653, -2.084805, 0.9372549, 1, 0, 1,
-0.9492878, 0.8898281, -3.545764, 0.9333333, 1, 0, 1,
-0.9469556, 1.107171, -3.508976, 0.9254902, 1, 0, 1,
-0.9468408, 0.8653975, -1.077027, 0.9215686, 1, 0, 1,
-0.9438592, 0.873617, -0.3879733, 0.9137255, 1, 0, 1,
-0.9422811, 0.487842, -2.04896, 0.9098039, 1, 0, 1,
-0.9406564, -0.6426634, -2.414051, 0.9019608, 1, 0, 1,
-0.9390742, 0.05185247, -0.8122509, 0.8941177, 1, 0, 1,
-0.9367621, -0.3372175, -1.437147, 0.8901961, 1, 0, 1,
-0.9361103, -0.7857416, -1.918277, 0.8823529, 1, 0, 1,
-0.9296984, -1.15304, -3.756809, 0.8784314, 1, 0, 1,
-0.9240471, -0.0950432, -1.551189, 0.8705882, 1, 0, 1,
-0.9198442, 1.08112, -0.009361993, 0.8666667, 1, 0, 1,
-0.9130785, -1.450546, -1.325996, 0.8588235, 1, 0, 1,
-0.9097745, 0.01434835, -0.9461799, 0.854902, 1, 0, 1,
-0.9042406, 0.7756304, 0.09305876, 0.8470588, 1, 0, 1,
-0.9022138, -1.640288, -3.702632, 0.8431373, 1, 0, 1,
-0.8976957, 0.166117, -2.604735, 0.8352941, 1, 0, 1,
-0.8881523, 0.0273684, -0.9557464, 0.8313726, 1, 0, 1,
-0.8869683, -0.0612537, -1.152605, 0.8235294, 1, 0, 1,
-0.8812338, -0.2723897, -3.916327, 0.8196079, 1, 0, 1,
-0.8737238, -0.778582, -3.221843, 0.8117647, 1, 0, 1,
-0.8681282, 0.7427633, -1.959455, 0.8078431, 1, 0, 1,
-0.8678812, 0.7414879, -0.773116, 0.8, 1, 0, 1,
-0.8676628, 1.875811, -0.6200122, 0.7921569, 1, 0, 1,
-0.8563476, -0.9958072, -3.152282, 0.7882353, 1, 0, 1,
-0.84741, 0.6317559, -0.4867797, 0.7803922, 1, 0, 1,
-0.8455266, 1.681504, 1.434723, 0.7764706, 1, 0, 1,
-0.8405045, -1.220324, -2.973615, 0.7686275, 1, 0, 1,
-0.8323578, 0.9662497, 1.257593, 0.7647059, 1, 0, 1,
-0.8318914, 1.30578, 0.2560879, 0.7568628, 1, 0, 1,
-0.8311098, 1.267577, -0.7182718, 0.7529412, 1, 0, 1,
-0.8310235, -0.2197049, -3.310894, 0.7450981, 1, 0, 1,
-0.8307276, -0.6655132, -2.363918, 0.7411765, 1, 0, 1,
-0.8255678, -0.7297243, -2.864334, 0.7333333, 1, 0, 1,
-0.825075, -2.231426, -3.048217, 0.7294118, 1, 0, 1,
-0.822689, -0.4540309, -1.510007, 0.7215686, 1, 0, 1,
-0.8222852, 2.241257, -0.2495013, 0.7176471, 1, 0, 1,
-0.8066449, -0.9207042, -2.110497, 0.7098039, 1, 0, 1,
-0.8040702, -0.05519605, -1.915024, 0.7058824, 1, 0, 1,
-0.7949656, -0.02187983, -2.539566, 0.6980392, 1, 0, 1,
-0.7891828, -0.238266, -1.024053, 0.6901961, 1, 0, 1,
-0.7869474, -0.6903234, -1.445614, 0.6862745, 1, 0, 1,
-0.7868412, 0.5886661, -3.024278, 0.6784314, 1, 0, 1,
-0.7732095, 1.542449, 2.214762, 0.6745098, 1, 0, 1,
-0.7707959, 2.165611, -0.4243308, 0.6666667, 1, 0, 1,
-0.7703733, 1.25854, -0.1012022, 0.6627451, 1, 0, 1,
-0.7700393, -1.165108, -2.150367, 0.654902, 1, 0, 1,
-0.7681801, -0.5564561, -1.867401, 0.6509804, 1, 0, 1,
-0.7676666, -0.2391745, -2.197838, 0.6431373, 1, 0, 1,
-0.766682, -0.2398261, -2.101213, 0.6392157, 1, 0, 1,
-0.7655036, -1.723059, -2.325001, 0.6313726, 1, 0, 1,
-0.7614176, -0.5072989, -1.47097, 0.627451, 1, 0, 1,
-0.7598029, 1.594748, -0.4861777, 0.6196079, 1, 0, 1,
-0.7597283, 0.1020018, -1.415185, 0.6156863, 1, 0, 1,
-0.7571872, -0.8291551, -2.654138, 0.6078432, 1, 0, 1,
-0.7500014, 0.7531497, 1.00868, 0.6039216, 1, 0, 1,
-0.7463819, -0.009772282, -0.2288731, 0.5960785, 1, 0, 1,
-0.7438041, -0.4299453, -2.782002, 0.5882353, 1, 0, 1,
-0.743472, -1.585619, -2.524341, 0.5843138, 1, 0, 1,
-0.7433393, 0.4372183, -2.796767, 0.5764706, 1, 0, 1,
-0.7391266, -0.5746732, -2.172349, 0.572549, 1, 0, 1,
-0.7368332, -0.09079354, -0.6654539, 0.5647059, 1, 0, 1,
-0.7317985, 0.5352391, -1.371883, 0.5607843, 1, 0, 1,
-0.7314496, 0.6918606, 0.001213726, 0.5529412, 1, 0, 1,
-0.7277644, 0.06610738, -2.70988, 0.5490196, 1, 0, 1,
-0.714354, -1.389663, -4.852192, 0.5411765, 1, 0, 1,
-0.7143135, -1.212893, -2.835187, 0.5372549, 1, 0, 1,
-0.7120742, 1.385032, -1.897942, 0.5294118, 1, 0, 1,
-0.7108002, 0.8019305, -0.5337, 0.5254902, 1, 0, 1,
-0.7086517, 1.012282, 0.3980131, 0.5176471, 1, 0, 1,
-0.7048413, -0.3324174, -2.720374, 0.5137255, 1, 0, 1,
-0.7025595, 0.7968301, -0.842598, 0.5058824, 1, 0, 1,
-0.7023131, 0.0847747, 0.01257175, 0.5019608, 1, 0, 1,
-0.6900237, -1.010384, -4.427608, 0.4941176, 1, 0, 1,
-0.6893805, -0.6080636, -3.559573, 0.4862745, 1, 0, 1,
-0.6836088, -2.636884, -1.69321, 0.4823529, 1, 0, 1,
-0.6589095, -0.1165619, -3.492891, 0.4745098, 1, 0, 1,
-0.6575572, 0.2732907, -0.7481496, 0.4705882, 1, 0, 1,
-0.6509338, -0.2177091, -1.508227, 0.4627451, 1, 0, 1,
-0.6493993, 0.8902708, 0.7878515, 0.4588235, 1, 0, 1,
-0.6439318, 0.301246, -1.677243, 0.4509804, 1, 0, 1,
-0.6431199, 0.008882613, -2.070947, 0.4470588, 1, 0, 1,
-0.6377986, -0.9452679, -3.116306, 0.4392157, 1, 0, 1,
-0.6307744, -0.5539372, -3.125361, 0.4352941, 1, 0, 1,
-0.6276543, 0.5463113, -1.081921, 0.427451, 1, 0, 1,
-0.6255957, 1.455698, -1.545229, 0.4235294, 1, 0, 1,
-0.6215354, -0.4568543, -2.152226, 0.4156863, 1, 0, 1,
-0.6182318, 0.1102102, -2.504722, 0.4117647, 1, 0, 1,
-0.616277, 0.9750024, -1.028042, 0.4039216, 1, 0, 1,
-0.6160716, 0.7342378, -1.702025, 0.3960784, 1, 0, 1,
-0.6096918, -1.64469, -3.287578, 0.3921569, 1, 0, 1,
-0.6033378, -0.0140249, 1.093947, 0.3843137, 1, 0, 1,
-0.598587, -0.6153713, -1.849837, 0.3803922, 1, 0, 1,
-0.5948821, 0.1388494, -0.6716305, 0.372549, 1, 0, 1,
-0.5935092, 0.6580458, -1.194735, 0.3686275, 1, 0, 1,
-0.588761, -0.6812434, -3.938508, 0.3607843, 1, 0, 1,
-0.5847164, 0.7957132, -0.8415343, 0.3568628, 1, 0, 1,
-0.5802419, 0.9433414, -1.110967, 0.3490196, 1, 0, 1,
-0.5793662, 0.03411923, -1.755451, 0.345098, 1, 0, 1,
-0.5782266, -0.2239019, -0.3851069, 0.3372549, 1, 0, 1,
-0.5780801, -0.0246299, -2.195853, 0.3333333, 1, 0, 1,
-0.5766158, 0.2368939, -1.238951, 0.3254902, 1, 0, 1,
-0.5712022, 0.4450781, -0.8535126, 0.3215686, 1, 0, 1,
-0.567051, -1.086571, -3.745164, 0.3137255, 1, 0, 1,
-0.562977, -0.9128242, -1.534226, 0.3098039, 1, 0, 1,
-0.5624338, -0.0749524, -2.393003, 0.3019608, 1, 0, 1,
-0.5591779, -0.04849577, -1.734601, 0.2941177, 1, 0, 1,
-0.5470831, 2.025621, -0.9116253, 0.2901961, 1, 0, 1,
-0.5446221, -0.8099315, -3.527387, 0.282353, 1, 0, 1,
-0.5437846, 1.797384, -1.255793, 0.2784314, 1, 0, 1,
-0.5418954, -0.8259505, -3.331889, 0.2705882, 1, 0, 1,
-0.5384627, 0.09506454, -1.548132, 0.2666667, 1, 0, 1,
-0.5375643, 1.183666, -2.732933, 0.2588235, 1, 0, 1,
-0.5342423, 0.61919, -1.106263, 0.254902, 1, 0, 1,
-0.5328484, -0.4657489, -3.607734, 0.2470588, 1, 0, 1,
-0.5306984, 0.454384, 0.1908549, 0.2431373, 1, 0, 1,
-0.5305719, 0.826133, -1.525628, 0.2352941, 1, 0, 1,
-0.5297287, -1.745008, -2.897689, 0.2313726, 1, 0, 1,
-0.5280409, -2.478053, -1.819337, 0.2235294, 1, 0, 1,
-0.5198604, -0.5980718, -2.02835, 0.2196078, 1, 0, 1,
-0.5190836, 0.06729822, -2.2043, 0.2117647, 1, 0, 1,
-0.5171933, 0.2409278, -0.9640272, 0.2078431, 1, 0, 1,
-0.5159779, 0.7900271, -0.8607085, 0.2, 1, 0, 1,
-0.5115788, -1.143878, -1.87867, 0.1921569, 1, 0, 1,
-0.5103285, 1.119999, -1.53135, 0.1882353, 1, 0, 1,
-0.5049977, 0.2629109, -0.8442289, 0.1803922, 1, 0, 1,
-0.5007959, 0.6598973, -0.01709837, 0.1764706, 1, 0, 1,
-0.4996145, -2.140352, -1.902245, 0.1686275, 1, 0, 1,
-0.4860875, -0.381458, -1.889756, 0.1647059, 1, 0, 1,
-0.4836787, -0.9681838, -4.788824, 0.1568628, 1, 0, 1,
-0.482325, -0.4076368, -1.513818, 0.1529412, 1, 0, 1,
-0.4823239, -2.241553, -1.184635, 0.145098, 1, 0, 1,
-0.4735049, -0.7537308, -3.502857, 0.1411765, 1, 0, 1,
-0.4703699, -0.3732078, -2.000322, 0.1333333, 1, 0, 1,
-0.4699503, -1.487724, -2.083204, 0.1294118, 1, 0, 1,
-0.4697627, -0.4288775, -1.444577, 0.1215686, 1, 0, 1,
-0.4687128, -0.5089268, -1.36252, 0.1176471, 1, 0, 1,
-0.4683219, 1.032446, -0.3790713, 0.1098039, 1, 0, 1,
-0.4669731, -0.63936, -1.485146, 0.1058824, 1, 0, 1,
-0.4662436, 0.5098379, -1.527123, 0.09803922, 1, 0, 1,
-0.4584991, 0.4461197, -0.02026627, 0.09019608, 1, 0, 1,
-0.4546809, 0.3411214, -2.212354, 0.08627451, 1, 0, 1,
-0.4535924, -0.6085057, -2.873543, 0.07843138, 1, 0, 1,
-0.4530877, 2.031133, -1.107814, 0.07450981, 1, 0, 1,
-0.448155, -0.3026742, -1.007497, 0.06666667, 1, 0, 1,
-0.4465886, -1.68977, -2.072426, 0.0627451, 1, 0, 1,
-0.4406375, -0.6428776, -2.323158, 0.05490196, 1, 0, 1,
-0.4391178, 1.072623, 0.2013181, 0.05098039, 1, 0, 1,
-0.4386807, -1.143425, -2.7357, 0.04313726, 1, 0, 1,
-0.4326742, 0.1140052, -1.134125, 0.03921569, 1, 0, 1,
-0.4324874, 1.647853, -0.3640398, 0.03137255, 1, 0, 1,
-0.4266005, 0.1632383, -2.277099, 0.02745098, 1, 0, 1,
-0.423593, 0.9838127, -0.974887, 0.01960784, 1, 0, 1,
-0.4199232, 0.42386, -0.796269, 0.01568628, 1, 0, 1,
-0.4197763, 0.5033973, -1.622599, 0.007843138, 1, 0, 1,
-0.4190423, 0.6937535, 0.1221367, 0.003921569, 1, 0, 1,
-0.4163139, -3.04441, -3.525558, 0, 1, 0.003921569, 1,
-0.4131541, -1.808538, -2.483347, 0, 1, 0.01176471, 1,
-0.4110394, 0.2449955, -1.36802, 0, 1, 0.01568628, 1,
-0.4098065, 0.2555184, -0.452572, 0, 1, 0.02352941, 1,
-0.4090906, 0.04353865, -1.624661, 0, 1, 0.02745098, 1,
-0.4054301, -0.550519, -1.86824, 0, 1, 0.03529412, 1,
-0.3982241, 0.2588757, 0.1496469, 0, 1, 0.03921569, 1,
-0.3943889, -1.631009, -2.074391, 0, 1, 0.04705882, 1,
-0.3828879, 2.069582, 0.500053, 0, 1, 0.05098039, 1,
-0.3784845, -2.561073, -2.307563, 0, 1, 0.05882353, 1,
-0.3768442, 0.2427514, -0.9308126, 0, 1, 0.0627451, 1,
-0.3762448, -0.09823368, -2.033469, 0, 1, 0.07058824, 1,
-0.3759283, -0.8216953, -3.578965, 0, 1, 0.07450981, 1,
-0.375466, 1.968732, -0.2683931, 0, 1, 0.08235294, 1,
-0.3732725, 0.02358398, -1.260495, 0, 1, 0.08627451, 1,
-0.3721806, -1.259662, -5.162648, 0, 1, 0.09411765, 1,
-0.3712978, 1.039419, -1.701246, 0, 1, 0.1019608, 1,
-0.3689434, -0.204687, -1.727024, 0, 1, 0.1058824, 1,
-0.3618039, 0.7237144, -1.24731, 0, 1, 0.1137255, 1,
-0.3612567, 1.276433, -0.3906295, 0, 1, 0.1176471, 1,
-0.3584391, 0.2898677, -1.035866, 0, 1, 0.1254902, 1,
-0.3492858, -0.4155461, -1.152255, 0, 1, 0.1294118, 1,
-0.3443635, 1.131969, -1.211226, 0, 1, 0.1372549, 1,
-0.3436872, 0.8070859, 0.8943739, 0, 1, 0.1411765, 1,
-0.3387656, -1.191645, -2.580529, 0, 1, 0.1490196, 1,
-0.3386671, -0.7848498, -3.275109, 0, 1, 0.1529412, 1,
-0.333663, 1.453514, -0.2071768, 0, 1, 0.1607843, 1,
-0.3282071, -0.4121002, -4.671562, 0, 1, 0.1647059, 1,
-0.3261997, 0.4266418, -0.8424262, 0, 1, 0.172549, 1,
-0.3251005, -0.8941207, -3.339997, 0, 1, 0.1764706, 1,
-0.3192974, -1.0158, -2.534065, 0, 1, 0.1843137, 1,
-0.3171468, -0.8975319, -0.9403861, 0, 1, 0.1882353, 1,
-0.3157879, 0.9844777, -0.1293692, 0, 1, 0.1960784, 1,
-0.3087854, -0.4021703, -3.980475, 0, 1, 0.2039216, 1,
-0.3028636, -0.9937128, -2.411781, 0, 1, 0.2078431, 1,
-0.3023164, 1.43918, 1.455695, 0, 1, 0.2156863, 1,
-0.2922092, 1.975228, -0.01461978, 0, 1, 0.2196078, 1,
-0.2905971, 0.4603721, 1.923131, 0, 1, 0.227451, 1,
-0.2900675, 0.4907577, -1.644546, 0, 1, 0.2313726, 1,
-0.2895661, 0.06344115, -1.444835, 0, 1, 0.2392157, 1,
-0.2895461, 0.6675145, 1.05288, 0, 1, 0.2431373, 1,
-0.2865969, 0.2587624, -1.314144, 0, 1, 0.2509804, 1,
-0.2852829, 0.4507105, 0.5076861, 0, 1, 0.254902, 1,
-0.2851411, 1.068921, -1.168496, 0, 1, 0.2627451, 1,
-0.284758, 0.7318073, -1.639225, 0, 1, 0.2666667, 1,
-0.2842323, 0.2164813, -1.972514, 0, 1, 0.2745098, 1,
-0.2836989, -1.441885, -3.677211, 0, 1, 0.2784314, 1,
-0.2832274, 0.01905137, -3.167615, 0, 1, 0.2862745, 1,
-0.2813542, 0.121056, -0.989839, 0, 1, 0.2901961, 1,
-0.2812836, 0.9497434, -0.06793122, 0, 1, 0.2980392, 1,
-0.279979, -0.1459984, 0.1651623, 0, 1, 0.3058824, 1,
-0.2782405, -0.2346691, -0.3007932, 0, 1, 0.3098039, 1,
-0.2729124, -2.466311, -2.484639, 0, 1, 0.3176471, 1,
-0.2721223, -0.5270907, -2.234884, 0, 1, 0.3215686, 1,
-0.265237, 0.02418494, -0.4067918, 0, 1, 0.3294118, 1,
-0.2628434, 1.420774, 1.685645, 0, 1, 0.3333333, 1,
-0.2599969, 1.398433, -1.513338, 0, 1, 0.3411765, 1,
-0.2546676, 0.0968229, -1.744029, 0, 1, 0.345098, 1,
-0.253875, -0.07806683, -1.595155, 0, 1, 0.3529412, 1,
-0.2375859, -0.3627233, -2.571354, 0, 1, 0.3568628, 1,
-0.237466, 0.8462616, -0.5617487, 0, 1, 0.3647059, 1,
-0.232237, -0.5222095, -2.905138, 0, 1, 0.3686275, 1,
-0.2258002, 0.4863276, -1.694947, 0, 1, 0.3764706, 1,
-0.22343, -0.3814956, -2.47233, 0, 1, 0.3803922, 1,
-0.2221987, 0.1534353, 0.03050705, 0, 1, 0.3882353, 1,
-0.2208194, -0.6644273, -2.242814, 0, 1, 0.3921569, 1,
-0.2170292, -0.1057712, -2.537875, 0, 1, 0.4, 1,
-0.216906, 0.7069111, 0.9897023, 0, 1, 0.4078431, 1,
-0.2168261, 0.120347, 0.8250053, 0, 1, 0.4117647, 1,
-0.2107978, 0.931425, -0.6048685, 0, 1, 0.4196078, 1,
-0.2087413, -0.2731044, -2.560673, 0, 1, 0.4235294, 1,
-0.205119, 0.762445, 0.7741978, 0, 1, 0.4313726, 1,
-0.2042158, 0.6619886, 1.40015, 0, 1, 0.4352941, 1,
-0.1974617, 1.127502, 0.6076989, 0, 1, 0.4431373, 1,
-0.1957565, 0.2997663, -2.159576, 0, 1, 0.4470588, 1,
-0.1950827, 0.8754284, -0.2441994, 0, 1, 0.454902, 1,
-0.193812, 0.9865087, 1.208279, 0, 1, 0.4588235, 1,
-0.1874177, 0.6241349, -0.2637541, 0, 1, 0.4666667, 1,
-0.1833426, -1.393245, -2.233202, 0, 1, 0.4705882, 1,
-0.1783825, 0.297013, 0.1210337, 0, 1, 0.4784314, 1,
-0.1776814, 1.031815, 0.6640038, 0, 1, 0.4823529, 1,
-0.1762731, 1.210495, 0.7886741, 0, 1, 0.4901961, 1,
-0.1759948, 1.167329, 0.208509, 0, 1, 0.4941176, 1,
-0.1732519, -0.08938617, -2.564193, 0, 1, 0.5019608, 1,
-0.1715478, 1.095656, 0.3917208, 0, 1, 0.509804, 1,
-0.1702827, 0.4431981, 0.9428343, 0, 1, 0.5137255, 1,
-0.1674853, 0.1734879, -0.2711415, 0, 1, 0.5215687, 1,
-0.1665569, -0.8913582, -2.973737, 0, 1, 0.5254902, 1,
-0.1625998, 0.0506837, -0.04406557, 0, 1, 0.5333334, 1,
-0.1623194, -0.2186919, -4.232199, 0, 1, 0.5372549, 1,
-0.1569, 0.42564, -0.9344758, 0, 1, 0.5450981, 1,
-0.1552991, 0.6478907, -2.873346, 0, 1, 0.5490196, 1,
-0.1479037, -2.077704, -1.827653, 0, 1, 0.5568628, 1,
-0.1408245, 2.211212, -0.9331285, 0, 1, 0.5607843, 1,
-0.1390523, -1.633418, -1.854935, 0, 1, 0.5686275, 1,
-0.1376498, -1.071085, -2.170814, 0, 1, 0.572549, 1,
-0.1334423, 0.5188397, -1.790128, 0, 1, 0.5803922, 1,
-0.1271601, -0.2026926, -1.984589, 0, 1, 0.5843138, 1,
-0.1227074, -1.879478, -3.582733, 0, 1, 0.5921569, 1,
-0.1202986, 1.528755, -0.5679645, 0, 1, 0.5960785, 1,
-0.120252, 1.112845, -0.720309, 0, 1, 0.6039216, 1,
-0.1164113, -1.05568, -4.916279, 0, 1, 0.6117647, 1,
-0.1111983, 0.6801568, -0.01549122, 0, 1, 0.6156863, 1,
-0.1088811, -0.8271474, -4.226904, 0, 1, 0.6235294, 1,
-0.107641, -0.7626262, -3.65263, 0, 1, 0.627451, 1,
-0.1074857, -1.980443, -3.322216, 0, 1, 0.6352941, 1,
-0.1071218, 1.068622, 1.382267, 0, 1, 0.6392157, 1,
-0.1069659, -0.7019069, -2.815167, 0, 1, 0.6470588, 1,
-0.1060223, 0.3449188, -2.441168, 0, 1, 0.6509804, 1,
-0.1049979, -0.7261827, -3.365942, 0, 1, 0.6588235, 1,
-0.1026587, 2.683796, -1.010471, 0, 1, 0.6627451, 1,
-0.09861179, -0.5457959, -3.061208, 0, 1, 0.6705883, 1,
-0.0974945, 0.9569718, 0.4786857, 0, 1, 0.6745098, 1,
-0.09694544, 0.7369381, -0.01187195, 0, 1, 0.682353, 1,
-0.09557796, 0.905216, -1.094989, 0, 1, 0.6862745, 1,
-0.09472755, -1.378255, -3.838041, 0, 1, 0.6941177, 1,
-0.09385273, -0.4984389, -2.628919, 0, 1, 0.7019608, 1,
-0.09132221, 1.124622, -0.2825485, 0, 1, 0.7058824, 1,
-0.08884653, 0.5927874, -1.278236, 0, 1, 0.7137255, 1,
-0.08709183, 1.308502, -0.2901469, 0, 1, 0.7176471, 1,
-0.08628203, 0.7243702, -1.382022, 0, 1, 0.7254902, 1,
-0.08137918, 0.7419819, 0.0721194, 0, 1, 0.7294118, 1,
-0.08006585, 0.2925612, 0.2989309, 0, 1, 0.7372549, 1,
-0.07215821, -0.1072008, -3.386793, 0, 1, 0.7411765, 1,
-0.06991465, 0.771935, 1.081879, 0, 1, 0.7490196, 1,
-0.06951507, -1.071208, -3.544864, 0, 1, 0.7529412, 1,
-0.06892224, -1.728631, -3.538602, 0, 1, 0.7607843, 1,
-0.06781485, 0.02771753, -2.367269, 0, 1, 0.7647059, 1,
-0.06395288, 0.7415752, -0.2241928, 0, 1, 0.772549, 1,
-0.06348776, 0.3269488, -1.174773, 0, 1, 0.7764706, 1,
-0.06067725, 1.058764, -1.004075, 0, 1, 0.7843137, 1,
-0.06043237, 0.4729699, -0.08269496, 0, 1, 0.7882353, 1,
-0.06034273, 0.05407069, -1.1446, 0, 1, 0.7960784, 1,
-0.05830094, -0.2496888, -0.4834473, 0, 1, 0.8039216, 1,
-0.05665139, -0.07137874, -2.706706, 0, 1, 0.8078431, 1,
-0.0560893, -0.424522, -2.059702, 0, 1, 0.8156863, 1,
-0.05429089, -0.1745769, -1.713964, 0, 1, 0.8196079, 1,
-0.05256844, -0.05595839, -2.562963, 0, 1, 0.827451, 1,
-0.05171951, 0.2950343, -0.8577003, 0, 1, 0.8313726, 1,
-0.04799311, 0.6714726, -1.822992, 0, 1, 0.8392157, 1,
-0.04754815, 0.510334, 0.07706983, 0, 1, 0.8431373, 1,
-0.04152946, -1.551785, -3.958021, 0, 1, 0.8509804, 1,
-0.03784312, 1.85758, -0.2328052, 0, 1, 0.854902, 1,
-0.03186645, -0.1457038, -2.977502, 0, 1, 0.8627451, 1,
-0.02846172, -2.051379, -3.948481, 0, 1, 0.8666667, 1,
-0.02436032, -0.4935308, -2.562081, 0, 1, 0.8745098, 1,
-0.02320352, -1.013465, -3.744855, 0, 1, 0.8784314, 1,
-0.02256787, 0.1671673, -0.8706501, 0, 1, 0.8862745, 1,
-0.019745, 0.6314013, -0.1693776, 0, 1, 0.8901961, 1,
-0.01971447, -1.92332, -3.721826, 0, 1, 0.8980392, 1,
-0.01892496, -1.273139, -3.318156, 0, 1, 0.9058824, 1,
-0.01766212, 0.1428553, -1.914808, 0, 1, 0.9098039, 1,
-0.01558527, 0.2831779, -0.2332893, 0, 1, 0.9176471, 1,
-0.01537215, -1.20039, -4.032259, 0, 1, 0.9215686, 1,
-0.003633521, -0.7618564, -3.966141, 0, 1, 0.9294118, 1,
0.003922024, -0.9209331, 2.423702, 0, 1, 0.9333333, 1,
0.006686594, -1.11452, 3.474719, 0, 1, 0.9411765, 1,
0.01355993, 1.87018, -1.398133, 0, 1, 0.945098, 1,
0.01369637, -0.09014623, 1.481742, 0, 1, 0.9529412, 1,
0.01841727, -1.880505, 4.327822, 0, 1, 0.9568627, 1,
0.0190844, 1.517614, 3.202445, 0, 1, 0.9647059, 1,
0.01930039, 0.6318102, -0.5610293, 0, 1, 0.9686275, 1,
0.02474123, -1.688604, 3.419351, 0, 1, 0.9764706, 1,
0.02840364, -0.7169562, 1.722258, 0, 1, 0.9803922, 1,
0.03058933, -0.1708609, 2.952208, 0, 1, 0.9882353, 1,
0.03461537, -1.157787, 2.415589, 0, 1, 0.9921569, 1,
0.03481549, -0.2566018, 1.882863, 0, 1, 1, 1,
0.04623537, 0.6165268, -0.9164302, 0, 0.9921569, 1, 1,
0.05623409, -0.6357598, 2.024268, 0, 0.9882353, 1, 1,
0.05715873, -0.6790748, 4.356483, 0, 0.9803922, 1, 1,
0.0572833, -0.1800876, 2.202485, 0, 0.9764706, 1, 1,
0.05800308, -1.216693, 4.105925, 0, 0.9686275, 1, 1,
0.06129402, -0.1637368, 5.276497, 0, 0.9647059, 1, 1,
0.06195643, -0.2685939, 3.193367, 0, 0.9568627, 1, 1,
0.06316238, 1.572766, -2.068661, 0, 0.9529412, 1, 1,
0.06543852, -2.127463, 0.3790305, 0, 0.945098, 1, 1,
0.06757082, 0.3804537, 0.6237217, 0, 0.9411765, 1, 1,
0.07043441, -0.6510294, 1.625868, 0, 0.9333333, 1, 1,
0.07160536, -1.333447, 2.589521, 0, 0.9294118, 1, 1,
0.07218512, -0.9521484, 4.142118, 0, 0.9215686, 1, 1,
0.07241575, -0.07262412, 2.190696, 0, 0.9176471, 1, 1,
0.07506613, -1.921835, 2.816198, 0, 0.9098039, 1, 1,
0.0775357, -0.2717981, 3.151152, 0, 0.9058824, 1, 1,
0.07953946, 1.585858, 2.064746, 0, 0.8980392, 1, 1,
0.08534063, 0.02084201, 1.581459, 0, 0.8901961, 1, 1,
0.08815417, -0.5527117, 3.800337, 0, 0.8862745, 1, 1,
0.09167083, -1.859288, 1.211722, 0, 0.8784314, 1, 1,
0.09186128, 0.08145092, 1.433267, 0, 0.8745098, 1, 1,
0.09399913, 0.9926889, 0.5938337, 0, 0.8666667, 1, 1,
0.097528, -0.3889043, 2.143103, 0, 0.8627451, 1, 1,
0.1013843, -0.9821063, 3.639396, 0, 0.854902, 1, 1,
0.1031568, 0.3890002, -1.076855, 0, 0.8509804, 1, 1,
0.1044635, 0.2768746, -0.2711012, 0, 0.8431373, 1, 1,
0.1071385, -0.48796, 2.824276, 0, 0.8392157, 1, 1,
0.1073858, -0.5506557, 3.485996, 0, 0.8313726, 1, 1,
0.1080003, 2.285657, -1.491066, 0, 0.827451, 1, 1,
0.1090281, 1.19774, -0.2991953, 0, 0.8196079, 1, 1,
0.1138446, -0.5735098, 1.960749, 0, 0.8156863, 1, 1,
0.118088, -0.2346469, 2.822853, 0, 0.8078431, 1, 1,
0.1202805, -1.284731, 3.955937, 0, 0.8039216, 1, 1,
0.1207213, -0.2184501, 3.026947, 0, 0.7960784, 1, 1,
0.1222161, -0.557413, 3.835061, 0, 0.7882353, 1, 1,
0.1228212, -0.467463, 2.987123, 0, 0.7843137, 1, 1,
0.1234255, -0.6495129, 3.25456, 0, 0.7764706, 1, 1,
0.1239638, 1.758597, -0.8228885, 0, 0.772549, 1, 1,
0.1256497, -0.003676734, 0.5200481, 0, 0.7647059, 1, 1,
0.1355227, 1.820998, 1.157193, 0, 0.7607843, 1, 1,
0.136396, -1.545578, 4.103274, 0, 0.7529412, 1, 1,
0.1375816, 0.5406871, -1.083489, 0, 0.7490196, 1, 1,
0.1434411, -0.1957027, 3.258663, 0, 0.7411765, 1, 1,
0.1448003, 2.87947, -0.1919099, 0, 0.7372549, 1, 1,
0.1509567, 1.352423, -0.1716903, 0, 0.7294118, 1, 1,
0.1518285, 1.237817, 0.1484242, 0, 0.7254902, 1, 1,
0.161873, -0.002127967, 1.43652, 0, 0.7176471, 1, 1,
0.1655962, 0.3754224, 0.3060571, 0, 0.7137255, 1, 1,
0.1657846, -0.07259273, 2.028373, 0, 0.7058824, 1, 1,
0.1690606, -1.351471, 1.943748, 0, 0.6980392, 1, 1,
0.1733333, 1.365686, 0.2222794, 0, 0.6941177, 1, 1,
0.1738369, -0.8073174, 4.295662, 0, 0.6862745, 1, 1,
0.1749117, 0.2920449, 0.82549, 0, 0.682353, 1, 1,
0.1758662, -0.7032012, 4.213642, 0, 0.6745098, 1, 1,
0.1782222, 2.04447, 0.1237947, 0, 0.6705883, 1, 1,
0.1851497, 2.679214, 1.683146, 0, 0.6627451, 1, 1,
0.1872349, 0.01169718, 2.811346, 0, 0.6588235, 1, 1,
0.1879485, 0.7208383, -0.2928267, 0, 0.6509804, 1, 1,
0.1887107, -1.53355, 3.848562, 0, 0.6470588, 1, 1,
0.1943949, -0.9487032, 3.204063, 0, 0.6392157, 1, 1,
0.1983822, 0.6148554, -1.023098, 0, 0.6352941, 1, 1,
0.1993951, 1.565862, 0.4266585, 0, 0.627451, 1, 1,
0.202011, -0.9779904, 1.526562, 0, 0.6235294, 1, 1,
0.202699, 0.6637502, -1.052985, 0, 0.6156863, 1, 1,
0.2061658, 0.7583237, 0.3539203, 0, 0.6117647, 1, 1,
0.2078203, -0.342685, 3.174502, 0, 0.6039216, 1, 1,
0.2097694, -1.059875, 3.757866, 0, 0.5960785, 1, 1,
0.2111796, -1.640475, 2.965338, 0, 0.5921569, 1, 1,
0.2138982, -0.05669031, 1.268975, 0, 0.5843138, 1, 1,
0.2139667, 0.2588782, 1.31592, 0, 0.5803922, 1, 1,
0.2183691, 0.8095637, -0.6332613, 0, 0.572549, 1, 1,
0.2198413, 0.67333, -0.07691859, 0, 0.5686275, 1, 1,
0.2229071, 0.4923717, -0.04937952, 0, 0.5607843, 1, 1,
0.2246447, -0.6228556, 1.985877, 0, 0.5568628, 1, 1,
0.226988, 1.47832, 1.791013, 0, 0.5490196, 1, 1,
0.2279625, 0.9455653, 1.839312, 0, 0.5450981, 1, 1,
0.2375353, 0.7493479, 0.02791871, 0, 0.5372549, 1, 1,
0.2388639, 0.4162494, 0.9297509, 0, 0.5333334, 1, 1,
0.2396792, -2.049623, 3.541421, 0, 0.5254902, 1, 1,
0.2438268, 0.7705672, -0.5362995, 0, 0.5215687, 1, 1,
0.2460869, -0.8668293, 2.807387, 0, 0.5137255, 1, 1,
0.249538, -1.258388, 4.299473, 0, 0.509804, 1, 1,
0.2512249, -0.3922885, 3.096884, 0, 0.5019608, 1, 1,
0.2549663, -0.1065478, 3.451953, 0, 0.4941176, 1, 1,
0.2556423, -0.1190167, 1.397326, 0, 0.4901961, 1, 1,
0.2563049, -0.20997, 2.466835, 0, 0.4823529, 1, 1,
0.2584352, 1.112864, 1.144337, 0, 0.4784314, 1, 1,
0.2589366, -0.1659026, 2.509137, 0, 0.4705882, 1, 1,
0.258999, -0.1749864, 2.989406, 0, 0.4666667, 1, 1,
0.2596953, 0.9733618, 1.578251, 0, 0.4588235, 1, 1,
0.2678059, -0.4137497, 1.823096, 0, 0.454902, 1, 1,
0.2750596, -0.07850474, 2.335709, 0, 0.4470588, 1, 1,
0.2831245, -0.02268866, 3.589778, 0, 0.4431373, 1, 1,
0.2899539, 0.1603862, 0.08983385, 0, 0.4352941, 1, 1,
0.2900128, -1.699431, 3.485981, 0, 0.4313726, 1, 1,
0.29259, -1.169003, 3.007286, 0, 0.4235294, 1, 1,
0.2948679, 0.3013075, 0.5005497, 0, 0.4196078, 1, 1,
0.2969462, -0.0958142, 2.293819, 0, 0.4117647, 1, 1,
0.3014373, 0.06161959, 1.735471, 0, 0.4078431, 1, 1,
0.3040597, 0.9453626, 1.286593, 0, 0.4, 1, 1,
0.304743, -1.108075, 3.815945, 0, 0.3921569, 1, 1,
0.3055492, 0.2510453, 1.446977, 0, 0.3882353, 1, 1,
0.3084391, 0.6818844, 0.3511628, 0, 0.3803922, 1, 1,
0.310942, 3.367418, -0.0805123, 0, 0.3764706, 1, 1,
0.3170507, -1.268008, 2.989861, 0, 0.3686275, 1, 1,
0.3172451, -0.01521519, 1.034727, 0, 0.3647059, 1, 1,
0.3199314, -0.003754765, 0.4377804, 0, 0.3568628, 1, 1,
0.3200098, 0.7966233, 2.348425, 0, 0.3529412, 1, 1,
0.3212145, 0.5703055, 2.454534, 0, 0.345098, 1, 1,
0.3229431, 1.209086, 0.2276594, 0, 0.3411765, 1, 1,
0.3238662, 0.03074358, 3.385527, 0, 0.3333333, 1, 1,
0.3298624, 0.01279308, 2.04965, 0, 0.3294118, 1, 1,
0.3319759, -0.2794624, 0.02048996, 0, 0.3215686, 1, 1,
0.332133, -0.332079, 2.634358, 0, 0.3176471, 1, 1,
0.3327172, -0.4028708, 1.958849, 0, 0.3098039, 1, 1,
0.3341281, 2.212228, -1.216869, 0, 0.3058824, 1, 1,
0.3349756, 0.3012459, 0.1102975, 0, 0.2980392, 1, 1,
0.337126, -1.326601, 1.972861, 0, 0.2901961, 1, 1,
0.3372943, 0.8408607, 1.14252, 0, 0.2862745, 1, 1,
0.33973, -0.01204656, 1.72507, 0, 0.2784314, 1, 1,
0.3407736, 0.9005134, 1.647118, 0, 0.2745098, 1, 1,
0.3429709, -0.6337318, 3.701752, 0, 0.2666667, 1, 1,
0.3432746, -0.6673916, 1.87362, 0, 0.2627451, 1, 1,
0.3469812, -0.8398719, 3.706193, 0, 0.254902, 1, 1,
0.3531233, -0.2787802, 0.5028234, 0, 0.2509804, 1, 1,
0.3545507, 2.828914, 1.929618, 0, 0.2431373, 1, 1,
0.3563474, -1.536991, 1.946504, 0, 0.2392157, 1, 1,
0.3621177, -0.4168994, 3.837936, 0, 0.2313726, 1, 1,
0.3627852, 1.549333, 0.9592806, 0, 0.227451, 1, 1,
0.3628041, 0.007045019, 2.153143, 0, 0.2196078, 1, 1,
0.363211, -0.9176853, 2.728206, 0, 0.2156863, 1, 1,
0.3632667, -1.784214, 1.689084, 0, 0.2078431, 1, 1,
0.366569, -1.873646, 2.125812, 0, 0.2039216, 1, 1,
0.3803776, 1.21476, 2.094402, 0, 0.1960784, 1, 1,
0.3807532, -0.3483425, 3.613598, 0, 0.1882353, 1, 1,
0.3860753, 1.510467, 0.07208002, 0, 0.1843137, 1, 1,
0.3897327, 0.8169812, -2.57947, 0, 0.1764706, 1, 1,
0.390111, 1.790105, 0.5830922, 0, 0.172549, 1, 1,
0.3934, -2.239289, 3.976258, 0, 0.1647059, 1, 1,
0.3955112, 0.5499914, 0.636813, 0, 0.1607843, 1, 1,
0.3981108, -0.2705864, 3.378091, 0, 0.1529412, 1, 1,
0.4012723, 0.114839, 2.674687, 0, 0.1490196, 1, 1,
0.4044893, 2.141411, 1.477061, 0, 0.1411765, 1, 1,
0.4044911, 2.471059, 0.5614586, 0, 0.1372549, 1, 1,
0.4052342, -0.03702578, 1.971452, 0, 0.1294118, 1, 1,
0.4109235, 0.993111, -1.576952, 0, 0.1254902, 1, 1,
0.4149636, -0.250463, 3.104339, 0, 0.1176471, 1, 1,
0.4165873, 0.2547271, 1.509027, 0, 0.1137255, 1, 1,
0.4236663, 0.001730634, 1.139191, 0, 0.1058824, 1, 1,
0.4373485, -0.9480038, 1.408989, 0, 0.09803922, 1, 1,
0.4405024, -0.4568184, 2.648535, 0, 0.09411765, 1, 1,
0.4415101, 0.7080459, 1.165381, 0, 0.08627451, 1, 1,
0.4514323, -0.9302675, 2.128237, 0, 0.08235294, 1, 1,
0.454247, -0.341148, 1.249485, 0, 0.07450981, 1, 1,
0.4593781, 0.05499542, 0.8724976, 0, 0.07058824, 1, 1,
0.4622462, -0.8805255, 0.9880078, 0, 0.0627451, 1, 1,
0.463019, 1.011153, -0.7495445, 0, 0.05882353, 1, 1,
0.4657149, 1.904331, -1.030747, 0, 0.05098039, 1, 1,
0.4705509, -0.8236371, 2.230132, 0, 0.04705882, 1, 1,
0.4722136, -0.6203525, 3.094171, 0, 0.03921569, 1, 1,
0.4778853, -1.480996, 2.054526, 0, 0.03529412, 1, 1,
0.4779031, -0.56095, 0.5270404, 0, 0.02745098, 1, 1,
0.4799694, 0.9512299, 0.1586959, 0, 0.02352941, 1, 1,
0.4842706, -0.4665955, 3.106421, 0, 0.01568628, 1, 1,
0.4882835, 2.214988, 0.6048698, 0, 0.01176471, 1, 1,
0.488593, -0.9365659, 1.037941, 0, 0.003921569, 1, 1,
0.4929948, 0.9942046, 0.03816199, 0.003921569, 0, 1, 1,
0.4983207, 0.6217273, 0.1073787, 0.007843138, 0, 1, 1,
0.5016707, 0.6467676, 0.3468382, 0.01568628, 0, 1, 1,
0.5018682, -0.4709057, 2.959339, 0.01960784, 0, 1, 1,
0.5059569, -0.9479069, 4.267617, 0.02745098, 0, 1, 1,
0.5069119, -1.452784, 4.135175, 0.03137255, 0, 1, 1,
0.5090044, 0.09246066, 1.962894, 0.03921569, 0, 1, 1,
0.5154069, 2.715527, 0.8763472, 0.04313726, 0, 1, 1,
0.515687, -0.5624263, 2.640557, 0.05098039, 0, 1, 1,
0.5164868, -1.572421, 2.430389, 0.05490196, 0, 1, 1,
0.5184677, 0.4967121, 0.5040305, 0.0627451, 0, 1, 1,
0.5210105, 1.845171, 1.844956, 0.06666667, 0, 1, 1,
0.5213035, -0.2831677, 2.094767, 0.07450981, 0, 1, 1,
0.5216089, 0.02530912, 0.7730537, 0.07843138, 0, 1, 1,
0.5237289, 1.292442, 0.3690496, 0.08627451, 0, 1, 1,
0.5264903, -0.5527914, 0.02402677, 0.09019608, 0, 1, 1,
0.5302902, 0.8625104, 0.01352657, 0.09803922, 0, 1, 1,
0.5352421, 0.8363793, 1.418496, 0.1058824, 0, 1, 1,
0.5361659, -0.1074734, 1.505645, 0.1098039, 0, 1, 1,
0.5396135, -0.7782872, 3.268683, 0.1176471, 0, 1, 1,
0.5398787, -0.8964384, 3.90108, 0.1215686, 0, 1, 1,
0.5428565, -1.094712, 3.459055, 0.1294118, 0, 1, 1,
0.5432826, -0.1029609, 1.662302, 0.1333333, 0, 1, 1,
0.5446147, 1.519687, -0.4686394, 0.1411765, 0, 1, 1,
0.546477, 0.9764431, 1.086229, 0.145098, 0, 1, 1,
0.5470505, 1.838752, 0.3276355, 0.1529412, 0, 1, 1,
0.5572931, 0.9031218, 0.1910363, 0.1568628, 0, 1, 1,
0.5579492, -1.399178, 2.832561, 0.1647059, 0, 1, 1,
0.5598407, -0.2122953, 0.6742796, 0.1686275, 0, 1, 1,
0.5610325, -0.5509119, 2.171147, 0.1764706, 0, 1, 1,
0.5623647, 0.192591, -1.255524, 0.1803922, 0, 1, 1,
0.5644407, 1.573407, 1.544187, 0.1882353, 0, 1, 1,
0.5682305, 0.4359171, -0.5659883, 0.1921569, 0, 1, 1,
0.5694819, 1.081023, -0.3502224, 0.2, 0, 1, 1,
0.5742814, 1.873478, 1.452591, 0.2078431, 0, 1, 1,
0.5782579, 0.8687007, -1.596026, 0.2117647, 0, 1, 1,
0.579469, 0.3696299, 0.8331386, 0.2196078, 0, 1, 1,
0.5803436, -0.7116959, 1.902256, 0.2235294, 0, 1, 1,
0.5806287, -1.120747, 0.6232294, 0.2313726, 0, 1, 1,
0.5806534, 0.5138009, 1.144841, 0.2352941, 0, 1, 1,
0.5812702, -1.920865, 2.906795, 0.2431373, 0, 1, 1,
0.5823401, 1.923354, 2.330975, 0.2470588, 0, 1, 1,
0.5848034, 0.07806572, 1.368553, 0.254902, 0, 1, 1,
0.5872689, -0.1018804, -1.304327, 0.2588235, 0, 1, 1,
0.5886144, -0.3460601, 1.442733, 0.2666667, 0, 1, 1,
0.5904189, 0.9784976, 1.068823, 0.2705882, 0, 1, 1,
0.5918344, 1.80807, -0.03942067, 0.2784314, 0, 1, 1,
0.5994046, 0.8443286, 0.7905599, 0.282353, 0, 1, 1,
0.6032413, -0.1437268, 1.894766, 0.2901961, 0, 1, 1,
0.6040233, 1.286009, 1.370085, 0.2941177, 0, 1, 1,
0.6109101, -0.4686219, 1.73265, 0.3019608, 0, 1, 1,
0.611863, 0.02365748, 0.8795395, 0.3098039, 0, 1, 1,
0.6214021, 0.4448806, 1.693589, 0.3137255, 0, 1, 1,
0.623341, -0.5975572, 1.625685, 0.3215686, 0, 1, 1,
0.623676, -0.05277046, 1.068137, 0.3254902, 0, 1, 1,
0.6264337, 1.742805, 1.163815, 0.3333333, 0, 1, 1,
0.631332, 0.05941662, 1.187725, 0.3372549, 0, 1, 1,
0.6377778, -0.9308473, 1.524243, 0.345098, 0, 1, 1,
0.6384417, -0.7645536, 2.661416, 0.3490196, 0, 1, 1,
0.6427865, 0.01145535, 2.470174, 0.3568628, 0, 1, 1,
0.6438975, 1.337939, 1.155112, 0.3607843, 0, 1, 1,
0.6518382, -0.6797593, 2.163202, 0.3686275, 0, 1, 1,
0.6561746, -1.633474, 3.128574, 0.372549, 0, 1, 1,
0.6624441, -1.538499, 1.65947, 0.3803922, 0, 1, 1,
0.6629511, 0.9061573, 1.530749, 0.3843137, 0, 1, 1,
0.6643863, 0.2337153, -0.6374317, 0.3921569, 0, 1, 1,
0.6716183, -1.33172, 3.025752, 0.3960784, 0, 1, 1,
0.680241, -0.8614128, 2.505014, 0.4039216, 0, 1, 1,
0.6819946, -1.822621, 2.977461, 0.4117647, 0, 1, 1,
0.6862074, -0.1659217, 0.6917726, 0.4156863, 0, 1, 1,
0.6896775, -0.3032752, 2.491314, 0.4235294, 0, 1, 1,
0.6911796, 1.094683, 0.8324251, 0.427451, 0, 1, 1,
0.6923547, 1.404033, -2.266286, 0.4352941, 0, 1, 1,
0.6936681, -0.337721, 3.2032, 0.4392157, 0, 1, 1,
0.6962136, 0.4594819, 1.188392, 0.4470588, 0, 1, 1,
0.6970598, -0.76534, 2.615346, 0.4509804, 0, 1, 1,
0.6973734, 0.5027961, 0.8649282, 0.4588235, 0, 1, 1,
0.7004124, -1.824574, 1.024286, 0.4627451, 0, 1, 1,
0.7025554, 0.5522588, -1.038534, 0.4705882, 0, 1, 1,
0.7036676, 0.1711842, 0.7000384, 0.4745098, 0, 1, 1,
0.7069039, 2.401886, 0.8502283, 0.4823529, 0, 1, 1,
0.710533, 1.544935, 0.1852331, 0.4862745, 0, 1, 1,
0.7114019, 0.2630818, 1.201795, 0.4941176, 0, 1, 1,
0.7151281, -0.9762686, 3.339619, 0.5019608, 0, 1, 1,
0.7165195, -1.190316, 2.672932, 0.5058824, 0, 1, 1,
0.7345733, 0.01837106, 2.60865, 0.5137255, 0, 1, 1,
0.7361849, -0.07425042, 2.756292, 0.5176471, 0, 1, 1,
0.7413062, -0.4141563, 1.257101, 0.5254902, 0, 1, 1,
0.7458513, -0.7179448, 3.758882, 0.5294118, 0, 1, 1,
0.7588474, 0.3198509, 1.021137, 0.5372549, 0, 1, 1,
0.7602261, -0.371639, 2.517779, 0.5411765, 0, 1, 1,
0.7625465, -2.45846, 1.8001, 0.5490196, 0, 1, 1,
0.7709361, -2.194661, 3.018601, 0.5529412, 0, 1, 1,
0.7746344, -0.3791073, 1.385858, 0.5607843, 0, 1, 1,
0.7759316, 0.8029208, 1.82121, 0.5647059, 0, 1, 1,
0.7763931, -1.830256, 3.867973, 0.572549, 0, 1, 1,
0.7854313, -1.105358, 1.885147, 0.5764706, 0, 1, 1,
0.7854508, 0.6361592, 0.7398874, 0.5843138, 0, 1, 1,
0.787483, -0.3081917, 1.680586, 0.5882353, 0, 1, 1,
0.7943714, 1.063728, 0.5520847, 0.5960785, 0, 1, 1,
0.7949275, 0.3174821, 1.615361, 0.6039216, 0, 1, 1,
0.797175, 0.6365171, 2.574657, 0.6078432, 0, 1, 1,
0.799266, 0.1352643, 2.261174, 0.6156863, 0, 1, 1,
0.8008368, 0.2978954, 0.6402673, 0.6196079, 0, 1, 1,
0.8020902, 0.9918141, 3.268957, 0.627451, 0, 1, 1,
0.8046605, -0.01976142, 0.6077176, 0.6313726, 0, 1, 1,
0.8057466, -0.8840904, 4.560428, 0.6392157, 0, 1, 1,
0.8071888, -1.692989, 0.6567342, 0.6431373, 0, 1, 1,
0.8100573, -1.470742, 3.706586, 0.6509804, 0, 1, 1,
0.8125561, 0.1958555, 3.259676, 0.654902, 0, 1, 1,
0.8160374, -0.7409803, 0.9028999, 0.6627451, 0, 1, 1,
0.8172884, 0.4854501, 1.221919, 0.6666667, 0, 1, 1,
0.8181999, -0.7191319, 3.322407, 0.6745098, 0, 1, 1,
0.8185404, 2.516391, -0.6265489, 0.6784314, 0, 1, 1,
0.8185911, -0.7210288, 3.961086, 0.6862745, 0, 1, 1,
0.8237178, 0.8839526, -0.4541709, 0.6901961, 0, 1, 1,
0.8251167, -0.9095871, 2.594539, 0.6980392, 0, 1, 1,
0.8253915, -0.4328467, 3.1061, 0.7058824, 0, 1, 1,
0.8296552, 1.606156, 2.42348, 0.7098039, 0, 1, 1,
0.8376243, 1.760452, 2.026011, 0.7176471, 0, 1, 1,
0.8413329, 0.2936308, 1.056885, 0.7215686, 0, 1, 1,
0.841867, 0.9762388, 0.4433655, 0.7294118, 0, 1, 1,
0.847306, 0.4302549, 2.756412, 0.7333333, 0, 1, 1,
0.8476152, 0.5796342, 1.575036, 0.7411765, 0, 1, 1,
0.8492963, -1.936123, 3.239911, 0.7450981, 0, 1, 1,
0.8508292, -0.2495773, 1.239017, 0.7529412, 0, 1, 1,
0.8569286, 1.872423, 0.910261, 0.7568628, 0, 1, 1,
0.8588229, 0.2713971, 2.10806, 0.7647059, 0, 1, 1,
0.8615144, 0.3115188, 1.911087, 0.7686275, 0, 1, 1,
0.8739982, -0.6081699, 3.292323, 0.7764706, 0, 1, 1,
0.8828076, -0.7339283, 2.647929, 0.7803922, 0, 1, 1,
0.8834682, 0.07602537, 0.4199983, 0.7882353, 0, 1, 1,
0.8848195, -0.1688213, 1.953121, 0.7921569, 0, 1, 1,
0.8872802, -0.3999825, 1.300399, 0.8, 0, 1, 1,
0.8877644, 0.6421812, 0.6085873, 0.8078431, 0, 1, 1,
0.8878343, 0.02053302, 2.483962, 0.8117647, 0, 1, 1,
0.8892449, 1.647582, 0.1326666, 0.8196079, 0, 1, 1,
0.891129, -1.08369, 1.248619, 0.8235294, 0, 1, 1,
0.8911416, 0.5514587, 1.293245, 0.8313726, 0, 1, 1,
0.8917217, -1.673121, 3.735563, 0.8352941, 0, 1, 1,
0.8929928, 0.7330321, 0.4919819, 0.8431373, 0, 1, 1,
0.8985831, 0.7345745, 0.8951811, 0.8470588, 0, 1, 1,
0.9008699, -0.1360763, 2.557229, 0.854902, 0, 1, 1,
0.9012629, -1.926738, 0.8197455, 0.8588235, 0, 1, 1,
0.9159062, -2.044923, 3.672155, 0.8666667, 0, 1, 1,
0.9162891, -1.445233, 4.259499, 0.8705882, 0, 1, 1,
0.9260684, 0.7093139, 0.7403339, 0.8784314, 0, 1, 1,
0.9343246, 1.672336, 1.893077, 0.8823529, 0, 1, 1,
0.9353619, 0.2240163, 1.973692, 0.8901961, 0, 1, 1,
0.937557, -1.86636, 1.99798, 0.8941177, 0, 1, 1,
0.9386771, 0.505073, 1.245021, 0.9019608, 0, 1, 1,
0.942121, 1.163207, -1.19698, 0.9098039, 0, 1, 1,
0.9451711, 2.310599, 0.4684216, 0.9137255, 0, 1, 1,
0.9470522, 0.1714796, 1.773502, 0.9215686, 0, 1, 1,
0.9499549, -0.4198647, 1.915547, 0.9254902, 0, 1, 1,
0.952627, -0.4021331, 3.132575, 0.9333333, 0, 1, 1,
0.9551813, 1.669391, 1.545092, 0.9372549, 0, 1, 1,
0.9582543, 0.3262715, 0.09978162, 0.945098, 0, 1, 1,
0.9616344, -0.3724495, 1.962329, 0.9490196, 0, 1, 1,
0.9621404, 1.324313, 1.549046, 0.9568627, 0, 1, 1,
0.9638819, 0.3301466, 0.7649523, 0.9607843, 0, 1, 1,
0.9648089, 0.3216878, 2.155408, 0.9686275, 0, 1, 1,
0.9658058, -0.1086585, 1.216975, 0.972549, 0, 1, 1,
0.9752035, 2.24934, 0.5779809, 0.9803922, 0, 1, 1,
0.9890131, -1.044734, 2.769582, 0.9843137, 0, 1, 1,
0.9997041, 0.1215161, 2.939562, 0.9921569, 0, 1, 1,
1.000238, -0.881585, 1.163993, 0.9960784, 0, 1, 1,
1.000836, 1.130247, -0.1121627, 1, 0, 0.9960784, 1,
1.001113, -2.23774, 3.604494, 1, 0, 0.9882353, 1,
1.005186, 1.171904, 1.460383, 1, 0, 0.9843137, 1,
1.008776, 0.8423727, 0.6574111, 1, 0, 0.9764706, 1,
1.013197, 0.3954005, 2.239778, 1, 0, 0.972549, 1,
1.013665, 0.6883752, 1.455573, 1, 0, 0.9647059, 1,
1.018637, 0.4531939, 0.4102211, 1, 0, 0.9607843, 1,
1.021729, 0.9504356, 2.292397, 1, 0, 0.9529412, 1,
1.023183, -0.6449113, 2.058975, 1, 0, 0.9490196, 1,
1.027928, -0.5284573, 2.179832, 1, 0, 0.9411765, 1,
1.031331, -0.9134547, 0.2869607, 1, 0, 0.9372549, 1,
1.033562, 0.08103157, 1.69631, 1, 0, 0.9294118, 1,
1.049111, 0.6907193, 1.656396, 1, 0, 0.9254902, 1,
1.049356, 0.463279, 0.5271082, 1, 0, 0.9176471, 1,
1.049401, -0.6167322, 2.708414, 1, 0, 0.9137255, 1,
1.062418, 0.9821364, 0.2541787, 1, 0, 0.9058824, 1,
1.069009, -0.08681943, 1.347317, 1, 0, 0.9019608, 1,
1.070165, 0.1056149, 2.268421, 1, 0, 0.8941177, 1,
1.070463, -1.057126, 1.947334, 1, 0, 0.8862745, 1,
1.070868, 0.8602108, -0.1859483, 1, 0, 0.8823529, 1,
1.073742, -1.627618, 2.052238, 1, 0, 0.8745098, 1,
1.074471, 0.06412631, 1.439734, 1, 0, 0.8705882, 1,
1.077942, -1.720048, 2.971026, 1, 0, 0.8627451, 1,
1.088337, -0.1612248, 2.587101, 1, 0, 0.8588235, 1,
1.09202, 0.1721709, 0.1520938, 1, 0, 0.8509804, 1,
1.0931, -0.2179664, 0.363204, 1, 0, 0.8470588, 1,
1.095144, -1.31408, 2.43631, 1, 0, 0.8392157, 1,
1.104445, -0.8758823, 2.289694, 1, 0, 0.8352941, 1,
1.105414, -1.358957, 0.6022846, 1, 0, 0.827451, 1,
1.112786, -0.02172729, 2.097848, 1, 0, 0.8235294, 1,
1.113516, 0.6714293, 2.023988, 1, 0, 0.8156863, 1,
1.115474, 0.6072975, 0.07747905, 1, 0, 0.8117647, 1,
1.116353, -1.166978, 2.280835, 1, 0, 0.8039216, 1,
1.118176, 0.2905267, 1.794237, 1, 0, 0.7960784, 1,
1.125041, 0.0125854, 1.234479, 1, 0, 0.7921569, 1,
1.135156, -1.910618, 2.815914, 1, 0, 0.7843137, 1,
1.13855, -1.362081, 2.314022, 1, 0, 0.7803922, 1,
1.14032, -1.552439, 2.348119, 1, 0, 0.772549, 1,
1.14095, -0.8723149, 2.030791, 1, 0, 0.7686275, 1,
1.143911, -0.4848262, 2.689415, 1, 0, 0.7607843, 1,
1.150043, -0.6297673, 1.487149, 1, 0, 0.7568628, 1,
1.154437, -0.9708042, 2.399816, 1, 0, 0.7490196, 1,
1.157682, 0.496265, 1.914185, 1, 0, 0.7450981, 1,
1.158926, 1.108528, 0.7541943, 1, 0, 0.7372549, 1,
1.164573, -0.4963039, 2.985593, 1, 0, 0.7333333, 1,
1.180091, -0.1111955, 2.053356, 1, 0, 0.7254902, 1,
1.182814, -0.5297235, 3.3964, 1, 0, 0.7215686, 1,
1.190399, 0.5733629, 1.44659, 1, 0, 0.7137255, 1,
1.196523, -0.7388099, 2.66297, 1, 0, 0.7098039, 1,
1.203193, -1.090047, 0.5109305, 1, 0, 0.7019608, 1,
1.207864, 0.04420856, 1.190946, 1, 0, 0.6941177, 1,
1.208334, -1.640275, 1.622849, 1, 0, 0.6901961, 1,
1.212581, -0.07373377, 1.005928, 1, 0, 0.682353, 1,
1.218698, 0.1781329, 1.122562, 1, 0, 0.6784314, 1,
1.219913, -0.2064736, -0.168779, 1, 0, 0.6705883, 1,
1.227045, -0.5561787, 0.5113407, 1, 0, 0.6666667, 1,
1.240522, 0.07149329, 2.069606, 1, 0, 0.6588235, 1,
1.245856, -0.5083275, 2.012333, 1, 0, 0.654902, 1,
1.260023, 0.4620227, 2.731126, 1, 0, 0.6470588, 1,
1.260618, -1.838998, 3.160167, 1, 0, 0.6431373, 1,
1.262626, -1.508844, 3.554424, 1, 0, 0.6352941, 1,
1.279732, 2.607116, 1.037679, 1, 0, 0.6313726, 1,
1.281743, 0.08984859, 1.395623, 1, 0, 0.6235294, 1,
1.282043, 0.8249217, 0.5112238, 1, 0, 0.6196079, 1,
1.286821, 2.636944, -0.2173851, 1, 0, 0.6117647, 1,
1.296622, 0.01920698, 1.534502, 1, 0, 0.6078432, 1,
1.304099, -1.053547, 1.486996, 1, 0, 0.6, 1,
1.30617, 0.505621, 1.955044, 1, 0, 0.5921569, 1,
1.307837, -0.1976224, 2.819573, 1, 0, 0.5882353, 1,
1.308523, -0.2466464, 2.020904, 1, 0, 0.5803922, 1,
1.310603, -0.64539, 1.685768, 1, 0, 0.5764706, 1,
1.313182, -0.113264, 0.5052879, 1, 0, 0.5686275, 1,
1.313239, -1.319834, 2.25726, 1, 0, 0.5647059, 1,
1.313833, 0.7456643, 0.5863689, 1, 0, 0.5568628, 1,
1.319214, -1.438156, 2.826441, 1, 0, 0.5529412, 1,
1.350008, 1.043158, 0.617882, 1, 0, 0.5450981, 1,
1.351431, 0.2814198, 0.06324103, 1, 0, 0.5411765, 1,
1.38338, -0.3537506, 2.668022, 1, 0, 0.5333334, 1,
1.385961, 0.009097202, 2.808434, 1, 0, 0.5294118, 1,
1.386328, 1.094494, 1.613664, 1, 0, 0.5215687, 1,
1.387012, 0.5851879, 0.6205386, 1, 0, 0.5176471, 1,
1.395812, 1.352555, 0.1484328, 1, 0, 0.509804, 1,
1.396363, -0.06939831, 2.715696, 1, 0, 0.5058824, 1,
1.402843, -0.4162132, 1.903992, 1, 0, 0.4980392, 1,
1.403409, -0.3264385, 0.6172571, 1, 0, 0.4901961, 1,
1.420514, 0.03190477, 0.1893764, 1, 0, 0.4862745, 1,
1.425811, 0.6277396, 2.760507, 1, 0, 0.4784314, 1,
1.429148, 0.3135217, 0.1784416, 1, 0, 0.4745098, 1,
1.439201, 0.9904361, 2.229224, 1, 0, 0.4666667, 1,
1.445842, -0.3764404, 0.3098644, 1, 0, 0.4627451, 1,
1.448009, 0.574106, 2.589375, 1, 0, 0.454902, 1,
1.450405, 0.2268377, 0.5637347, 1, 0, 0.4509804, 1,
1.461986, -0.5656482, 1.353265, 1, 0, 0.4431373, 1,
1.463172, -1.542018, 1.804856, 1, 0, 0.4392157, 1,
1.463656, 1.898136, 1.217673, 1, 0, 0.4313726, 1,
1.4646, 0.3921683, 1.909903, 1, 0, 0.427451, 1,
1.465205, -0.2858063, 2.216498, 1, 0, 0.4196078, 1,
1.473508, -0.6659832, 1.298541, 1, 0, 0.4156863, 1,
1.478168, -2.197172, 2.400326, 1, 0, 0.4078431, 1,
1.478461, 0.7512899, 2.285606, 1, 0, 0.4039216, 1,
1.480222, -0.4623903, 4.515344, 1, 0, 0.3960784, 1,
1.512119, -0.2180027, 1.510001, 1, 0, 0.3882353, 1,
1.514371, -1.385484, 2.288576, 1, 0, 0.3843137, 1,
1.520769, -0.8412062, 3.028819, 1, 0, 0.3764706, 1,
1.535647, 0.821674, 0.9690617, 1, 0, 0.372549, 1,
1.545733, -0.1261854, 2.367116, 1, 0, 0.3647059, 1,
1.560258, -0.9112135, 2.015327, 1, 0, 0.3607843, 1,
1.563759, 0.2666138, 2.036148, 1, 0, 0.3529412, 1,
1.567603, -0.3145638, 1.591868, 1, 0, 0.3490196, 1,
1.57719, -0.8645005, 1.923284, 1, 0, 0.3411765, 1,
1.581791, 0.9802411, -1.262816, 1, 0, 0.3372549, 1,
1.582919, 0.6758252, 2.128916, 1, 0, 0.3294118, 1,
1.586478, 0.5963815, 1.955438, 1, 0, 0.3254902, 1,
1.586784, 0.624492, -0.6096146, 1, 0, 0.3176471, 1,
1.59435, 0.7668338, 1.549971, 1, 0, 0.3137255, 1,
1.59531, -1.09437, 2.105025, 1, 0, 0.3058824, 1,
1.599014, -0.1902836, 1.938059, 1, 0, 0.2980392, 1,
1.624219, 2.03031, -0.2537099, 1, 0, 0.2941177, 1,
1.62765, -1.306281, 0.9623572, 1, 0, 0.2862745, 1,
1.629298, 0.2685605, 2.672398, 1, 0, 0.282353, 1,
1.637028, -0.4810436, 2.898735, 1, 0, 0.2745098, 1,
1.642321, -0.457816, 1.448769, 1, 0, 0.2705882, 1,
1.643568, 0.07390382, 2.156057, 1, 0, 0.2627451, 1,
1.667608, -0.1640977, 1.457254, 1, 0, 0.2588235, 1,
1.669673, 0.3460849, 1.956446, 1, 0, 0.2509804, 1,
1.675953, -1.267511, 1.144608, 1, 0, 0.2470588, 1,
1.679383, -0.356722, 0.5691018, 1, 0, 0.2392157, 1,
1.68702, -1.233194, 1.907511, 1, 0, 0.2352941, 1,
1.688904, -1.086859, 2.656098, 1, 0, 0.227451, 1,
1.690257, 0.1758187, 1.854634, 1, 0, 0.2235294, 1,
1.695727, -1.137298, 2.822475, 1, 0, 0.2156863, 1,
1.722153, 0.2502521, 1.889275, 1, 0, 0.2117647, 1,
1.742714, -0.2887723, 0.3746144, 1, 0, 0.2039216, 1,
1.764798, 1.069748, 1.229403, 1, 0, 0.1960784, 1,
1.811263, 0.2020798, 1.521669, 1, 0, 0.1921569, 1,
1.814168, -1.108782, 2.632918, 1, 0, 0.1843137, 1,
1.821743, 0.503563, 3.50163, 1, 0, 0.1803922, 1,
1.841672, 1.104108, 1.908365, 1, 0, 0.172549, 1,
1.859864, -0.9223907, 0.8679386, 1, 0, 0.1686275, 1,
1.868486, -0.6983106, 2.708705, 1, 0, 0.1607843, 1,
1.869672, 0.660569, 0.9762864, 1, 0, 0.1568628, 1,
1.88309, -0.6029565, 2.052329, 1, 0, 0.1490196, 1,
1.888414, 0.3487697, 2.017737, 1, 0, 0.145098, 1,
1.907813, 0.7341272, 1.897406, 1, 0, 0.1372549, 1,
1.947383, -0.1001419, 0.8499819, 1, 0, 0.1333333, 1,
1.952893, -1.614707, 0.6178195, 1, 0, 0.1254902, 1,
1.972224, -0.1619662, 1.360136, 1, 0, 0.1215686, 1,
1.974449, -1.241036, 4.774877, 1, 0, 0.1137255, 1,
1.997862, 0.5306525, -0.2333279, 1, 0, 0.1098039, 1,
2.061944, -1.889472, 3.453047, 1, 0, 0.1019608, 1,
2.071799, 0.08102594, 1.813777, 1, 0, 0.09411765, 1,
2.071957, -0.8591126, -0.1701866, 1, 0, 0.09019608, 1,
2.08306, 0.3319799, 1.077041, 1, 0, 0.08235294, 1,
2.135494, -0.445412, 0.4843501, 1, 0, 0.07843138, 1,
2.154269, 1.617311, 0.6320307, 1, 0, 0.07058824, 1,
2.195349, -1.304594, 0.5867366, 1, 0, 0.06666667, 1,
2.249646, 0.8576494, 1.012299, 1, 0, 0.05882353, 1,
2.307954, -0.1856038, 2.21626, 1, 0, 0.05490196, 1,
2.374334, -1.146752, 1.224264, 1, 0, 0.04705882, 1,
2.375074, -0.1264226, 2.090415, 1, 0, 0.04313726, 1,
2.423299, -0.4872096, 0.2763194, 1, 0, 0.03529412, 1,
2.424189, -0.3165107, 2.392063, 1, 0, 0.03137255, 1,
2.490929, -0.4041594, -0.1601416, 1, 0, 0.02352941, 1,
2.640647, -0.1715781, 2.57386, 1, 0, 0.01960784, 1,
2.671395, 0.9766922, 1.576478, 1, 0, 0.01176471, 1,
2.890383, -0.5414326, 3.68011, 1, 0, 0.007843138, 1
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
-0.1431484, -4.131215, -6.932083, 0, -0.5, 0.5, 0.5,
-0.1431484, -4.131215, -6.932083, 1, -0.5, 0.5, 0.5,
-0.1431484, -4.131215, -6.932083, 1, 1.5, 0.5, 0.5,
-0.1431484, -4.131215, -6.932083, 0, 1.5, 0.5, 0.5
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
-4.205047, 0.1615043, -6.932083, 0, -0.5, 0.5, 0.5,
-4.205047, 0.1615043, -6.932083, 1, -0.5, 0.5, 0.5,
-4.205047, 0.1615043, -6.932083, 1, 1.5, 0.5, 0.5,
-4.205047, 0.1615043, -6.932083, 0, 1.5, 0.5, 0.5
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
-4.205047, -4.131215, 0.05692458, 0, -0.5, 0.5, 0.5,
-4.205047, -4.131215, 0.05692458, 1, -0.5, 0.5, 0.5,
-4.205047, -4.131215, 0.05692458, 1, 1.5, 0.5, 0.5,
-4.205047, -4.131215, 0.05692458, 0, 1.5, 0.5, 0.5
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
-3, -3.140587, -5.319235,
2, -3.140587, -5.319235,
-3, -3.140587, -5.319235,
-3, -3.305692, -5.588043,
-2, -3.140587, -5.319235,
-2, -3.305692, -5.588043,
-1, -3.140587, -5.319235,
-1, -3.305692, -5.588043,
0, -3.140587, -5.319235,
0, -3.305692, -5.588043,
1, -3.140587, -5.319235,
1, -3.305692, -5.588043,
2, -3.140587, -5.319235,
2, -3.305692, -5.588043
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
-3, -3.635901, -6.125659, 0, -0.5, 0.5, 0.5,
-3, -3.635901, -6.125659, 1, -0.5, 0.5, 0.5,
-3, -3.635901, -6.125659, 1, 1.5, 0.5, 0.5,
-3, -3.635901, -6.125659, 0, 1.5, 0.5, 0.5,
-2, -3.635901, -6.125659, 0, -0.5, 0.5, 0.5,
-2, -3.635901, -6.125659, 1, -0.5, 0.5, 0.5,
-2, -3.635901, -6.125659, 1, 1.5, 0.5, 0.5,
-2, -3.635901, -6.125659, 0, 1.5, 0.5, 0.5,
-1, -3.635901, -6.125659, 0, -0.5, 0.5, 0.5,
-1, -3.635901, -6.125659, 1, -0.5, 0.5, 0.5,
-1, -3.635901, -6.125659, 1, 1.5, 0.5, 0.5,
-1, -3.635901, -6.125659, 0, 1.5, 0.5, 0.5,
0, -3.635901, -6.125659, 0, -0.5, 0.5, 0.5,
0, -3.635901, -6.125659, 1, -0.5, 0.5, 0.5,
0, -3.635901, -6.125659, 1, 1.5, 0.5, 0.5,
0, -3.635901, -6.125659, 0, 1.5, 0.5, 0.5,
1, -3.635901, -6.125659, 0, -0.5, 0.5, 0.5,
1, -3.635901, -6.125659, 1, -0.5, 0.5, 0.5,
1, -3.635901, -6.125659, 1, 1.5, 0.5, 0.5,
1, -3.635901, -6.125659, 0, 1.5, 0.5, 0.5,
2, -3.635901, -6.125659, 0, -0.5, 0.5, 0.5,
2, -3.635901, -6.125659, 1, -0.5, 0.5, 0.5,
2, -3.635901, -6.125659, 1, 1.5, 0.5, 0.5,
2, -3.635901, -6.125659, 0, 1.5, 0.5, 0.5
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
-3.267686, -3, -5.319235,
-3.267686, 3, -5.319235,
-3.267686, -3, -5.319235,
-3.423913, -3, -5.588043,
-3.267686, -2, -5.319235,
-3.423913, -2, -5.588043,
-3.267686, -1, -5.319235,
-3.423913, -1, -5.588043,
-3.267686, 0, -5.319235,
-3.423913, 0, -5.588043,
-3.267686, 1, -5.319235,
-3.423913, 1, -5.588043,
-3.267686, 2, -5.319235,
-3.423913, 2, -5.588043,
-3.267686, 3, -5.319235,
-3.423913, 3, -5.588043
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
-3.736367, -3, -6.125659, 0, -0.5, 0.5, 0.5,
-3.736367, -3, -6.125659, 1, -0.5, 0.5, 0.5,
-3.736367, -3, -6.125659, 1, 1.5, 0.5, 0.5,
-3.736367, -3, -6.125659, 0, 1.5, 0.5, 0.5,
-3.736367, -2, -6.125659, 0, -0.5, 0.5, 0.5,
-3.736367, -2, -6.125659, 1, -0.5, 0.5, 0.5,
-3.736367, -2, -6.125659, 1, 1.5, 0.5, 0.5,
-3.736367, -2, -6.125659, 0, 1.5, 0.5, 0.5,
-3.736367, -1, -6.125659, 0, -0.5, 0.5, 0.5,
-3.736367, -1, -6.125659, 1, -0.5, 0.5, 0.5,
-3.736367, -1, -6.125659, 1, 1.5, 0.5, 0.5,
-3.736367, -1, -6.125659, 0, 1.5, 0.5, 0.5,
-3.736367, 0, -6.125659, 0, -0.5, 0.5, 0.5,
-3.736367, 0, -6.125659, 1, -0.5, 0.5, 0.5,
-3.736367, 0, -6.125659, 1, 1.5, 0.5, 0.5,
-3.736367, 0, -6.125659, 0, 1.5, 0.5, 0.5,
-3.736367, 1, -6.125659, 0, -0.5, 0.5, 0.5,
-3.736367, 1, -6.125659, 1, -0.5, 0.5, 0.5,
-3.736367, 1, -6.125659, 1, 1.5, 0.5, 0.5,
-3.736367, 1, -6.125659, 0, 1.5, 0.5, 0.5,
-3.736367, 2, -6.125659, 0, -0.5, 0.5, 0.5,
-3.736367, 2, -6.125659, 1, -0.5, 0.5, 0.5,
-3.736367, 2, -6.125659, 1, 1.5, 0.5, 0.5,
-3.736367, 2, -6.125659, 0, 1.5, 0.5, 0.5,
-3.736367, 3, -6.125659, 0, -0.5, 0.5, 0.5,
-3.736367, 3, -6.125659, 1, -0.5, 0.5, 0.5,
-3.736367, 3, -6.125659, 1, 1.5, 0.5, 0.5,
-3.736367, 3, -6.125659, 0, 1.5, 0.5, 0.5
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
-3.267686, -3.140587, -4,
-3.267686, -3.140587, 4,
-3.267686, -3.140587, -4,
-3.423913, -3.305692, -4,
-3.267686, -3.140587, -2,
-3.423913, -3.305692, -2,
-3.267686, -3.140587, 0,
-3.423913, -3.305692, 0,
-3.267686, -3.140587, 2,
-3.423913, -3.305692, 2,
-3.267686, -3.140587, 4,
-3.423913, -3.305692, 4
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
-3.736367, -3.635901, -4, 0, -0.5, 0.5, 0.5,
-3.736367, -3.635901, -4, 1, -0.5, 0.5, 0.5,
-3.736367, -3.635901, -4, 1, 1.5, 0.5, 0.5,
-3.736367, -3.635901, -4, 0, 1.5, 0.5, 0.5,
-3.736367, -3.635901, -2, 0, -0.5, 0.5, 0.5,
-3.736367, -3.635901, -2, 1, -0.5, 0.5, 0.5,
-3.736367, -3.635901, -2, 1, 1.5, 0.5, 0.5,
-3.736367, -3.635901, -2, 0, 1.5, 0.5, 0.5,
-3.736367, -3.635901, 0, 0, -0.5, 0.5, 0.5,
-3.736367, -3.635901, 0, 1, -0.5, 0.5, 0.5,
-3.736367, -3.635901, 0, 1, 1.5, 0.5, 0.5,
-3.736367, -3.635901, 0, 0, 1.5, 0.5, 0.5,
-3.736367, -3.635901, 2, 0, -0.5, 0.5, 0.5,
-3.736367, -3.635901, 2, 1, -0.5, 0.5, 0.5,
-3.736367, -3.635901, 2, 1, 1.5, 0.5, 0.5,
-3.736367, -3.635901, 2, 0, 1.5, 0.5, 0.5,
-3.736367, -3.635901, 4, 0, -0.5, 0.5, 0.5,
-3.736367, -3.635901, 4, 1, -0.5, 0.5, 0.5,
-3.736367, -3.635901, 4, 1, 1.5, 0.5, 0.5,
-3.736367, -3.635901, 4, 0, 1.5, 0.5, 0.5
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
-3.267686, -3.140587, -5.319235,
-3.267686, 3.463596, -5.319235,
-3.267686, -3.140587, 5.433084,
-3.267686, 3.463596, 5.433084,
-3.267686, -3.140587, -5.319235,
-3.267686, -3.140587, 5.433084,
-3.267686, 3.463596, -5.319235,
-3.267686, 3.463596, 5.433084,
-3.267686, -3.140587, -5.319235,
2.981389, -3.140587, -5.319235,
-3.267686, -3.140587, 5.433084,
2.981389, -3.140587, 5.433084,
-3.267686, 3.463596, -5.319235,
2.981389, 3.463596, -5.319235,
-3.267686, 3.463596, 5.433084,
2.981389, 3.463596, 5.433084,
2.981389, -3.140587, -5.319235,
2.981389, 3.463596, -5.319235,
2.981389, -3.140587, 5.433084,
2.981389, 3.463596, 5.433084,
2.981389, -3.140587, -5.319235,
2.981389, -3.140587, 5.433084,
2.981389, 3.463596, -5.319235,
2.981389, 3.463596, 5.433084
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
var radius = 7.519056;
var distance = 33.45313;
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
mvMatrix.translate( 0.1431484, -0.1615043, -0.05692458 );
mvMatrix.scale( 1.300953, 1.231, 0.7560928 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.45313);
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
monomethylarsonic_ac<-read.table("monomethylarsonic_ac.xyz")
```

```
## Error in read.table("monomethylarsonic_ac.xyz"): no lines available in input
```

```r
x<-monomethylarsonic_ac$V2
```

```
## Error in eval(expr, envir, enclos): object 'monomethylarsonic_ac' not found
```

```r
y<-monomethylarsonic_ac$V3
```

```
## Error in eval(expr, envir, enclos): object 'monomethylarsonic_ac' not found
```

```r
z<-monomethylarsonic_ac$V4
```

```
## Error in eval(expr, envir, enclos): object 'monomethylarsonic_ac' not found
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
-3.17668, -1.330452, -1.670181, 0, 0, 1, 1, 1,
-3.106289, -0.7303379, -2.654502, 1, 0, 0, 1, 1,
-2.745324, 1.109797, -3.86411, 1, 0, 0, 1, 1,
-2.637151, 0.07569461, -1.312237, 1, 0, 0, 1, 1,
-2.619242, 0.1954992, -2.1234, 1, 0, 0, 1, 1,
-2.54759, -1.316026, -2.265008, 1, 0, 0, 1, 1,
-2.481658, -0.6096126, -0.4804794, 0, 0, 0, 1, 1,
-2.419282, 0.7375708, -1.350639, 0, 0, 0, 1, 1,
-2.397182, 0.7135018, -0.3865435, 0, 0, 0, 1, 1,
-2.3589, 0.2397793, -1.056293, 0, 0, 0, 1, 1,
-2.340047, -2.085872, -2.088676, 0, 0, 0, 1, 1,
-2.308059, -0.2110747, 0.2724552, 0, 0, 0, 1, 1,
-2.248439, 0.2010968, -1.187103, 0, 0, 0, 1, 1,
-2.210822, -0.6374614, -2.06519, 1, 1, 1, 1, 1,
-2.188303, -0.8130516, -2.288504, 1, 1, 1, 1, 1,
-2.180492, -1.11666, -2.235946, 1, 1, 1, 1, 1,
-2.14272, 1.741279, -0.02320155, 1, 1, 1, 1, 1,
-2.11915, -0.5144229, -0.1946422, 1, 1, 1, 1, 1,
-2.115024, -0.01195435, -2.257393, 1, 1, 1, 1, 1,
-2.090106, 0.1797238, -1.259266, 1, 1, 1, 1, 1,
-2.082761, 0.7200142, -0.9435717, 1, 1, 1, 1, 1,
-2.07528, -0.09373274, -2.419865, 1, 1, 1, 1, 1,
-2.023104, 0.4950485, -0.839784, 1, 1, 1, 1, 1,
-2.0124, -0.1537206, -3.088791, 1, 1, 1, 1, 1,
-1.979119, 0.2482693, -0.1568603, 1, 1, 1, 1, 1,
-1.974553, 1.025181, 1.08273, 1, 1, 1, 1, 1,
-1.913572, 0.2976438, -1.438953, 1, 1, 1, 1, 1,
-1.907067, -0.872323, -0.3263056, 1, 1, 1, 1, 1,
-1.886853, -0.5439143, -1.189497, 0, 0, 1, 1, 1,
-1.857844, 0.5426551, -1.484322, 1, 0, 0, 1, 1,
-1.846947, -1.090192, -2.459517, 1, 0, 0, 1, 1,
-1.84471, -0.06417663, -2.119874, 1, 0, 0, 1, 1,
-1.808236, 0.6369479, -0.6876053, 1, 0, 0, 1, 1,
-1.806849, -0.4319096, -2.170954, 1, 0, 0, 1, 1,
-1.791507, 0.6681578, 0.008229541, 0, 0, 0, 1, 1,
-1.789148, -1.175312, -2.222269, 0, 0, 0, 1, 1,
-1.778146, 0.7044861, -1.027335, 0, 0, 0, 1, 1,
-1.776526, 1.427925, 0.1366512, 0, 0, 0, 1, 1,
-1.760575, 1.23054, -3.065197, 0, 0, 0, 1, 1,
-1.753307, 0.7394617, -0.9455618, 0, 0, 0, 1, 1,
-1.749987, -0.8934649, -2.473371, 0, 0, 0, 1, 1,
-1.741795, -0.9655939, -1.748947, 1, 1, 1, 1, 1,
-1.706506, 2.484279, -1.274405, 1, 1, 1, 1, 1,
-1.705084, 1.086069, -0.5842602, 1, 1, 1, 1, 1,
-1.704276, 1.076557, -1.192089, 1, 1, 1, 1, 1,
-1.699616, -0.3965988, -0.6879621, 1, 1, 1, 1, 1,
-1.650208, 0.003064211, -2.298222, 1, 1, 1, 1, 1,
-1.64994, 0.7057527, -1.390754, 1, 1, 1, 1, 1,
-1.649921, -0.1367559, -2.050657, 1, 1, 1, 1, 1,
-1.649153, -0.4187322, -1.495782, 1, 1, 1, 1, 1,
-1.631618, -0.7017407, -2.224101, 1, 1, 1, 1, 1,
-1.6008, -0.3693497, -1.668512, 1, 1, 1, 1, 1,
-1.595934, -0.9954832, -2.60503, 1, 1, 1, 1, 1,
-1.590888, 0.2478108, -0.8185915, 1, 1, 1, 1, 1,
-1.588891, -0.4010172, -1.12734, 1, 1, 1, 1, 1,
-1.575538, 0.9674009, -1.42155, 1, 1, 1, 1, 1,
-1.575078, -0.5889075, -2.48328, 0, 0, 1, 1, 1,
-1.564543, -1.583536, -2.808547, 1, 0, 0, 1, 1,
-1.553756, -0.2973229, -2.729617, 1, 0, 0, 1, 1,
-1.544106, -0.6353467, -2.699548, 1, 0, 0, 1, 1,
-1.541787, 1.701507, -0.9232746, 1, 0, 0, 1, 1,
-1.538005, -0.5237232, -2.066397, 1, 0, 0, 1, 1,
-1.512578, -1.658165, -1.780143, 0, 0, 0, 1, 1,
-1.511281, -0.5843434, -0.5072787, 0, 0, 0, 1, 1,
-1.49539, -0.6501181, -2.542691, 0, 0, 0, 1, 1,
-1.493888, 2.091412, -0.5226025, 0, 0, 0, 1, 1,
-1.434388, 0.4408939, -1.426812, 0, 0, 0, 1, 1,
-1.401692, -0.7185334, -2.851638, 0, 0, 0, 1, 1,
-1.398764, -0.9521065, -2.311489, 0, 0, 0, 1, 1,
-1.386062, -0.288772, -1.734432, 1, 1, 1, 1, 1,
-1.379754, -0.1332297, -0.9375135, 1, 1, 1, 1, 1,
-1.377967, -0.8464115, -3.203485, 1, 1, 1, 1, 1,
-1.376822, 0.003253129, -0.99229, 1, 1, 1, 1, 1,
-1.37191, -1.635683, -2.680696, 1, 1, 1, 1, 1,
-1.369314, 0.4145533, -2.063869, 1, 1, 1, 1, 1,
-1.368915, -0.3280309, -2.854214, 1, 1, 1, 1, 1,
-1.355837, -0.8614047, -1.535761, 1, 1, 1, 1, 1,
-1.352406, -0.0477284, -3.404044, 1, 1, 1, 1, 1,
-1.34733, 1.831901, -2.422834, 1, 1, 1, 1, 1,
-1.346547, 0.07235462, -0.6500445, 1, 1, 1, 1, 1,
-1.335788, -0.3627885, -0.905145, 1, 1, 1, 1, 1,
-1.334174, -0.3104783, -1.183677, 1, 1, 1, 1, 1,
-1.331668, 0.5940567, -1.959643, 1, 1, 1, 1, 1,
-1.33032, -1.239702, -2.922402, 1, 1, 1, 1, 1,
-1.32578, 0.7673763, -1.939154, 0, 0, 1, 1, 1,
-1.318184, 0.9080544, -1.822956, 1, 0, 0, 1, 1,
-1.314592, -0.2796513, -2.349651, 1, 0, 0, 1, 1,
-1.312872, -1.452011, -4.857115, 1, 0, 0, 1, 1,
-1.311357, -1.195506, -0.9585929, 1, 0, 0, 1, 1,
-1.308131, 0.4107488, -2.300289, 1, 0, 0, 1, 1,
-1.307471, 0.7480418, -0.1731219, 0, 0, 0, 1, 1,
-1.306377, 1.073255, -0.6297619, 0, 0, 0, 1, 1,
-1.302089, 0.5096885, -1.773316, 0, 0, 0, 1, 1,
-1.301548, -1.138924, -2.985847, 0, 0, 0, 1, 1,
-1.297325, 0.6337902, -2.672266, 0, 0, 0, 1, 1,
-1.295599, -0.0292789, -2.284982, 0, 0, 0, 1, 1,
-1.277926, 0.6966158, -2.587924, 0, 0, 0, 1, 1,
-1.275618, 0.7674594, -0.401206, 1, 1, 1, 1, 1,
-1.273792, 0.2260065, -2.426742, 1, 1, 1, 1, 1,
-1.269704, 0.4481705, -0.8479789, 1, 1, 1, 1, 1,
-1.268698, 0.8570434, -2.050957, 1, 1, 1, 1, 1,
-1.264541, -0.07012299, -3.079038, 1, 1, 1, 1, 1,
-1.258403, -2.019426, -4.510607, 1, 1, 1, 1, 1,
-1.255149, 0.8697649, -0.5383993, 1, 1, 1, 1, 1,
-1.252366, 1.212928, 0.6739448, 1, 1, 1, 1, 1,
-1.250188, -1.387623, -0.7682309, 1, 1, 1, 1, 1,
-1.241886, 1.219939, -0.6611212, 1, 1, 1, 1, 1,
-1.241643, -0.09086814, 0.7907303, 1, 1, 1, 1, 1,
-1.236969, 0.945177, -0.2011798, 1, 1, 1, 1, 1,
-1.234513, -0.04264958, -2.614431, 1, 1, 1, 1, 1,
-1.230376, -1.792449, -0.2491532, 1, 1, 1, 1, 1,
-1.23029, 0.2676568, -0.6542408, 1, 1, 1, 1, 1,
-1.219298, 1.201095, -0.1624823, 0, 0, 1, 1, 1,
-1.208342, 0.5499921, -0.5319269, 1, 0, 0, 1, 1,
-1.20757, 0.05079654, -0.7070365, 1, 0, 0, 1, 1,
-1.199821, -1.195382, -3.514585, 1, 0, 0, 1, 1,
-1.189315, -1.094693, -2.90233, 1, 0, 0, 1, 1,
-1.184788, 0.8996906, -1.890947, 1, 0, 0, 1, 1,
-1.18367, -0.5455689, -2.92803, 0, 0, 0, 1, 1,
-1.183009, -0.08200111, -0.9361083, 0, 0, 0, 1, 1,
-1.18204, -1.119735, -3.174947, 0, 0, 0, 1, 1,
-1.177658, -0.1640812, -2.800159, 0, 0, 0, 1, 1,
-1.176701, -0.627705, -2.211475, 0, 0, 0, 1, 1,
-1.174431, -0.2920324, -3.712633, 0, 0, 0, 1, 1,
-1.174161, -0.597255, -0.9406721, 0, 0, 0, 1, 1,
-1.170407, -2.365837, -3.551464, 1, 1, 1, 1, 1,
-1.169763, -0.009390177, -1.199895, 1, 1, 1, 1, 1,
-1.169211, 1.65368, -0.1185597, 1, 1, 1, 1, 1,
-1.163059, -0.6495677, -2.952714, 1, 1, 1, 1, 1,
-1.145621, 1.810416, -1.181559, 1, 1, 1, 1, 1,
-1.137908, -1.542638, -3.199393, 1, 1, 1, 1, 1,
-1.131222, 0.4948988, -1.527233, 1, 1, 1, 1, 1,
-1.130986, 0.454717, -1.055772, 1, 1, 1, 1, 1,
-1.130537, 0.9476274, -2.184584, 1, 1, 1, 1, 1,
-1.127091, 0.4359559, -0.3803651, 1, 1, 1, 1, 1,
-1.117604, -0.4498434, -2.094707, 1, 1, 1, 1, 1,
-1.102607, 0.7000231, 0.5650148, 1, 1, 1, 1, 1,
-1.079782, 0.8697878, -0.4229109, 1, 1, 1, 1, 1,
-1.079008, -1.160146, -0.7439059, 1, 1, 1, 1, 1,
-1.074699, 1.412829, -0.02364746, 1, 1, 1, 1, 1,
-1.072676, -0.8626552, -2.27356, 0, 0, 1, 1, 1,
-1.069275, -0.4365917, -0.8167703, 1, 0, 0, 1, 1,
-1.068277, 0.8518718, -0.03748656, 1, 0, 0, 1, 1,
-1.067696, -1.329869, -3.515587, 1, 0, 0, 1, 1,
-1.0668, 0.1575147, 0.4621779, 1, 0, 0, 1, 1,
-1.060588, -0.960171, -3.290882, 1, 0, 0, 1, 1,
-1.058259, 1.455271, 0.1670538, 0, 0, 0, 1, 1,
-1.058193, -0.3030258, -2.321605, 0, 0, 0, 1, 1,
-1.050821, -0.6565908, -3.17025, 0, 0, 0, 1, 1,
-1.048747, 0.8531564, 0.001350617, 0, 0, 0, 1, 1,
-1.029039, 0.4676685, -0.05374926, 0, 0, 0, 1, 1,
-1.02496, 0.3900055, -1.258196, 0, 0, 0, 1, 1,
-1.020398, -0.5637216, -0.4512165, 0, 0, 0, 1, 1,
-1.018608, 0.2556337, 0.08257136, 1, 1, 1, 1, 1,
-1.01674, -0.9971156, -2.809586, 1, 1, 1, 1, 1,
-1.003384, -1.31023, -2.271318, 1, 1, 1, 1, 1,
-0.9999564, 0.2884543, -1.272207, 1, 1, 1, 1, 1,
-0.9996924, -0.2222475, -1.484176, 1, 1, 1, 1, 1,
-0.9996174, -1.917226, -1.17867, 1, 1, 1, 1, 1,
-0.9957065, 0.2499388, -1.155722, 1, 1, 1, 1, 1,
-0.9929202, 0.5524326, -0.6079739, 1, 1, 1, 1, 1,
-0.9919962, 1.750229, -1.729167, 1, 1, 1, 1, 1,
-0.9911292, -0.8271046, -0.3770621, 1, 1, 1, 1, 1,
-0.9815207, 1.90587, -0.9420695, 1, 1, 1, 1, 1,
-0.96909, -1.415868, -1.362325, 1, 1, 1, 1, 1,
-0.9688976, -0.7131061, -1.965506, 1, 1, 1, 1, 1,
-0.9685888, 0.3289703, -1.177389, 1, 1, 1, 1, 1,
-0.9685243, -0.9227431, -1.567503, 1, 1, 1, 1, 1,
-0.9673373, 0.9816982, -0.2301556, 0, 0, 1, 1, 1,
-0.9663671, -0.1154173, -1.102877, 1, 0, 0, 1, 1,
-0.9646917, -1.241376, -2.785232, 1, 0, 0, 1, 1,
-0.9633151, -0.7422882, -2.86254, 1, 0, 0, 1, 1,
-0.9620572, 0.1254258, -1.890253, 1, 0, 0, 1, 1,
-0.9618793, 1.017579, -0.2667483, 1, 0, 0, 1, 1,
-0.9590282, 0.237153, -1.254926, 0, 0, 0, 1, 1,
-0.9561052, 0.1352973, -0.7770433, 0, 0, 0, 1, 1,
-0.9535952, 0.4294205, -1.949006, 0, 0, 0, 1, 1,
-0.9514598, -1.108653, -2.084805, 0, 0, 0, 1, 1,
-0.9492878, 0.8898281, -3.545764, 0, 0, 0, 1, 1,
-0.9469556, 1.107171, -3.508976, 0, 0, 0, 1, 1,
-0.9468408, 0.8653975, -1.077027, 0, 0, 0, 1, 1,
-0.9438592, 0.873617, -0.3879733, 1, 1, 1, 1, 1,
-0.9422811, 0.487842, -2.04896, 1, 1, 1, 1, 1,
-0.9406564, -0.6426634, -2.414051, 1, 1, 1, 1, 1,
-0.9390742, 0.05185247, -0.8122509, 1, 1, 1, 1, 1,
-0.9367621, -0.3372175, -1.437147, 1, 1, 1, 1, 1,
-0.9361103, -0.7857416, -1.918277, 1, 1, 1, 1, 1,
-0.9296984, -1.15304, -3.756809, 1, 1, 1, 1, 1,
-0.9240471, -0.0950432, -1.551189, 1, 1, 1, 1, 1,
-0.9198442, 1.08112, -0.009361993, 1, 1, 1, 1, 1,
-0.9130785, -1.450546, -1.325996, 1, 1, 1, 1, 1,
-0.9097745, 0.01434835, -0.9461799, 1, 1, 1, 1, 1,
-0.9042406, 0.7756304, 0.09305876, 1, 1, 1, 1, 1,
-0.9022138, -1.640288, -3.702632, 1, 1, 1, 1, 1,
-0.8976957, 0.166117, -2.604735, 1, 1, 1, 1, 1,
-0.8881523, 0.0273684, -0.9557464, 1, 1, 1, 1, 1,
-0.8869683, -0.0612537, -1.152605, 0, 0, 1, 1, 1,
-0.8812338, -0.2723897, -3.916327, 1, 0, 0, 1, 1,
-0.8737238, -0.778582, -3.221843, 1, 0, 0, 1, 1,
-0.8681282, 0.7427633, -1.959455, 1, 0, 0, 1, 1,
-0.8678812, 0.7414879, -0.773116, 1, 0, 0, 1, 1,
-0.8676628, 1.875811, -0.6200122, 1, 0, 0, 1, 1,
-0.8563476, -0.9958072, -3.152282, 0, 0, 0, 1, 1,
-0.84741, 0.6317559, -0.4867797, 0, 0, 0, 1, 1,
-0.8455266, 1.681504, 1.434723, 0, 0, 0, 1, 1,
-0.8405045, -1.220324, -2.973615, 0, 0, 0, 1, 1,
-0.8323578, 0.9662497, 1.257593, 0, 0, 0, 1, 1,
-0.8318914, 1.30578, 0.2560879, 0, 0, 0, 1, 1,
-0.8311098, 1.267577, -0.7182718, 0, 0, 0, 1, 1,
-0.8310235, -0.2197049, -3.310894, 1, 1, 1, 1, 1,
-0.8307276, -0.6655132, -2.363918, 1, 1, 1, 1, 1,
-0.8255678, -0.7297243, -2.864334, 1, 1, 1, 1, 1,
-0.825075, -2.231426, -3.048217, 1, 1, 1, 1, 1,
-0.822689, -0.4540309, -1.510007, 1, 1, 1, 1, 1,
-0.8222852, 2.241257, -0.2495013, 1, 1, 1, 1, 1,
-0.8066449, -0.9207042, -2.110497, 1, 1, 1, 1, 1,
-0.8040702, -0.05519605, -1.915024, 1, 1, 1, 1, 1,
-0.7949656, -0.02187983, -2.539566, 1, 1, 1, 1, 1,
-0.7891828, -0.238266, -1.024053, 1, 1, 1, 1, 1,
-0.7869474, -0.6903234, -1.445614, 1, 1, 1, 1, 1,
-0.7868412, 0.5886661, -3.024278, 1, 1, 1, 1, 1,
-0.7732095, 1.542449, 2.214762, 1, 1, 1, 1, 1,
-0.7707959, 2.165611, -0.4243308, 1, 1, 1, 1, 1,
-0.7703733, 1.25854, -0.1012022, 1, 1, 1, 1, 1,
-0.7700393, -1.165108, -2.150367, 0, 0, 1, 1, 1,
-0.7681801, -0.5564561, -1.867401, 1, 0, 0, 1, 1,
-0.7676666, -0.2391745, -2.197838, 1, 0, 0, 1, 1,
-0.766682, -0.2398261, -2.101213, 1, 0, 0, 1, 1,
-0.7655036, -1.723059, -2.325001, 1, 0, 0, 1, 1,
-0.7614176, -0.5072989, -1.47097, 1, 0, 0, 1, 1,
-0.7598029, 1.594748, -0.4861777, 0, 0, 0, 1, 1,
-0.7597283, 0.1020018, -1.415185, 0, 0, 0, 1, 1,
-0.7571872, -0.8291551, -2.654138, 0, 0, 0, 1, 1,
-0.7500014, 0.7531497, 1.00868, 0, 0, 0, 1, 1,
-0.7463819, -0.009772282, -0.2288731, 0, 0, 0, 1, 1,
-0.7438041, -0.4299453, -2.782002, 0, 0, 0, 1, 1,
-0.743472, -1.585619, -2.524341, 0, 0, 0, 1, 1,
-0.7433393, 0.4372183, -2.796767, 1, 1, 1, 1, 1,
-0.7391266, -0.5746732, -2.172349, 1, 1, 1, 1, 1,
-0.7368332, -0.09079354, -0.6654539, 1, 1, 1, 1, 1,
-0.7317985, 0.5352391, -1.371883, 1, 1, 1, 1, 1,
-0.7314496, 0.6918606, 0.001213726, 1, 1, 1, 1, 1,
-0.7277644, 0.06610738, -2.70988, 1, 1, 1, 1, 1,
-0.714354, -1.389663, -4.852192, 1, 1, 1, 1, 1,
-0.7143135, -1.212893, -2.835187, 1, 1, 1, 1, 1,
-0.7120742, 1.385032, -1.897942, 1, 1, 1, 1, 1,
-0.7108002, 0.8019305, -0.5337, 1, 1, 1, 1, 1,
-0.7086517, 1.012282, 0.3980131, 1, 1, 1, 1, 1,
-0.7048413, -0.3324174, -2.720374, 1, 1, 1, 1, 1,
-0.7025595, 0.7968301, -0.842598, 1, 1, 1, 1, 1,
-0.7023131, 0.0847747, 0.01257175, 1, 1, 1, 1, 1,
-0.6900237, -1.010384, -4.427608, 1, 1, 1, 1, 1,
-0.6893805, -0.6080636, -3.559573, 0, 0, 1, 1, 1,
-0.6836088, -2.636884, -1.69321, 1, 0, 0, 1, 1,
-0.6589095, -0.1165619, -3.492891, 1, 0, 0, 1, 1,
-0.6575572, 0.2732907, -0.7481496, 1, 0, 0, 1, 1,
-0.6509338, -0.2177091, -1.508227, 1, 0, 0, 1, 1,
-0.6493993, 0.8902708, 0.7878515, 1, 0, 0, 1, 1,
-0.6439318, 0.301246, -1.677243, 0, 0, 0, 1, 1,
-0.6431199, 0.008882613, -2.070947, 0, 0, 0, 1, 1,
-0.6377986, -0.9452679, -3.116306, 0, 0, 0, 1, 1,
-0.6307744, -0.5539372, -3.125361, 0, 0, 0, 1, 1,
-0.6276543, 0.5463113, -1.081921, 0, 0, 0, 1, 1,
-0.6255957, 1.455698, -1.545229, 0, 0, 0, 1, 1,
-0.6215354, -0.4568543, -2.152226, 0, 0, 0, 1, 1,
-0.6182318, 0.1102102, -2.504722, 1, 1, 1, 1, 1,
-0.616277, 0.9750024, -1.028042, 1, 1, 1, 1, 1,
-0.6160716, 0.7342378, -1.702025, 1, 1, 1, 1, 1,
-0.6096918, -1.64469, -3.287578, 1, 1, 1, 1, 1,
-0.6033378, -0.0140249, 1.093947, 1, 1, 1, 1, 1,
-0.598587, -0.6153713, -1.849837, 1, 1, 1, 1, 1,
-0.5948821, 0.1388494, -0.6716305, 1, 1, 1, 1, 1,
-0.5935092, 0.6580458, -1.194735, 1, 1, 1, 1, 1,
-0.588761, -0.6812434, -3.938508, 1, 1, 1, 1, 1,
-0.5847164, 0.7957132, -0.8415343, 1, 1, 1, 1, 1,
-0.5802419, 0.9433414, -1.110967, 1, 1, 1, 1, 1,
-0.5793662, 0.03411923, -1.755451, 1, 1, 1, 1, 1,
-0.5782266, -0.2239019, -0.3851069, 1, 1, 1, 1, 1,
-0.5780801, -0.0246299, -2.195853, 1, 1, 1, 1, 1,
-0.5766158, 0.2368939, -1.238951, 1, 1, 1, 1, 1,
-0.5712022, 0.4450781, -0.8535126, 0, 0, 1, 1, 1,
-0.567051, -1.086571, -3.745164, 1, 0, 0, 1, 1,
-0.562977, -0.9128242, -1.534226, 1, 0, 0, 1, 1,
-0.5624338, -0.0749524, -2.393003, 1, 0, 0, 1, 1,
-0.5591779, -0.04849577, -1.734601, 1, 0, 0, 1, 1,
-0.5470831, 2.025621, -0.9116253, 1, 0, 0, 1, 1,
-0.5446221, -0.8099315, -3.527387, 0, 0, 0, 1, 1,
-0.5437846, 1.797384, -1.255793, 0, 0, 0, 1, 1,
-0.5418954, -0.8259505, -3.331889, 0, 0, 0, 1, 1,
-0.5384627, 0.09506454, -1.548132, 0, 0, 0, 1, 1,
-0.5375643, 1.183666, -2.732933, 0, 0, 0, 1, 1,
-0.5342423, 0.61919, -1.106263, 0, 0, 0, 1, 1,
-0.5328484, -0.4657489, -3.607734, 0, 0, 0, 1, 1,
-0.5306984, 0.454384, 0.1908549, 1, 1, 1, 1, 1,
-0.5305719, 0.826133, -1.525628, 1, 1, 1, 1, 1,
-0.5297287, -1.745008, -2.897689, 1, 1, 1, 1, 1,
-0.5280409, -2.478053, -1.819337, 1, 1, 1, 1, 1,
-0.5198604, -0.5980718, -2.02835, 1, 1, 1, 1, 1,
-0.5190836, 0.06729822, -2.2043, 1, 1, 1, 1, 1,
-0.5171933, 0.2409278, -0.9640272, 1, 1, 1, 1, 1,
-0.5159779, 0.7900271, -0.8607085, 1, 1, 1, 1, 1,
-0.5115788, -1.143878, -1.87867, 1, 1, 1, 1, 1,
-0.5103285, 1.119999, -1.53135, 1, 1, 1, 1, 1,
-0.5049977, 0.2629109, -0.8442289, 1, 1, 1, 1, 1,
-0.5007959, 0.6598973, -0.01709837, 1, 1, 1, 1, 1,
-0.4996145, -2.140352, -1.902245, 1, 1, 1, 1, 1,
-0.4860875, -0.381458, -1.889756, 1, 1, 1, 1, 1,
-0.4836787, -0.9681838, -4.788824, 1, 1, 1, 1, 1,
-0.482325, -0.4076368, -1.513818, 0, 0, 1, 1, 1,
-0.4823239, -2.241553, -1.184635, 1, 0, 0, 1, 1,
-0.4735049, -0.7537308, -3.502857, 1, 0, 0, 1, 1,
-0.4703699, -0.3732078, -2.000322, 1, 0, 0, 1, 1,
-0.4699503, -1.487724, -2.083204, 1, 0, 0, 1, 1,
-0.4697627, -0.4288775, -1.444577, 1, 0, 0, 1, 1,
-0.4687128, -0.5089268, -1.36252, 0, 0, 0, 1, 1,
-0.4683219, 1.032446, -0.3790713, 0, 0, 0, 1, 1,
-0.4669731, -0.63936, -1.485146, 0, 0, 0, 1, 1,
-0.4662436, 0.5098379, -1.527123, 0, 0, 0, 1, 1,
-0.4584991, 0.4461197, -0.02026627, 0, 0, 0, 1, 1,
-0.4546809, 0.3411214, -2.212354, 0, 0, 0, 1, 1,
-0.4535924, -0.6085057, -2.873543, 0, 0, 0, 1, 1,
-0.4530877, 2.031133, -1.107814, 1, 1, 1, 1, 1,
-0.448155, -0.3026742, -1.007497, 1, 1, 1, 1, 1,
-0.4465886, -1.68977, -2.072426, 1, 1, 1, 1, 1,
-0.4406375, -0.6428776, -2.323158, 1, 1, 1, 1, 1,
-0.4391178, 1.072623, 0.2013181, 1, 1, 1, 1, 1,
-0.4386807, -1.143425, -2.7357, 1, 1, 1, 1, 1,
-0.4326742, 0.1140052, -1.134125, 1, 1, 1, 1, 1,
-0.4324874, 1.647853, -0.3640398, 1, 1, 1, 1, 1,
-0.4266005, 0.1632383, -2.277099, 1, 1, 1, 1, 1,
-0.423593, 0.9838127, -0.974887, 1, 1, 1, 1, 1,
-0.4199232, 0.42386, -0.796269, 1, 1, 1, 1, 1,
-0.4197763, 0.5033973, -1.622599, 1, 1, 1, 1, 1,
-0.4190423, 0.6937535, 0.1221367, 1, 1, 1, 1, 1,
-0.4163139, -3.04441, -3.525558, 1, 1, 1, 1, 1,
-0.4131541, -1.808538, -2.483347, 1, 1, 1, 1, 1,
-0.4110394, 0.2449955, -1.36802, 0, 0, 1, 1, 1,
-0.4098065, 0.2555184, -0.452572, 1, 0, 0, 1, 1,
-0.4090906, 0.04353865, -1.624661, 1, 0, 0, 1, 1,
-0.4054301, -0.550519, -1.86824, 1, 0, 0, 1, 1,
-0.3982241, 0.2588757, 0.1496469, 1, 0, 0, 1, 1,
-0.3943889, -1.631009, -2.074391, 1, 0, 0, 1, 1,
-0.3828879, 2.069582, 0.500053, 0, 0, 0, 1, 1,
-0.3784845, -2.561073, -2.307563, 0, 0, 0, 1, 1,
-0.3768442, 0.2427514, -0.9308126, 0, 0, 0, 1, 1,
-0.3762448, -0.09823368, -2.033469, 0, 0, 0, 1, 1,
-0.3759283, -0.8216953, -3.578965, 0, 0, 0, 1, 1,
-0.375466, 1.968732, -0.2683931, 0, 0, 0, 1, 1,
-0.3732725, 0.02358398, -1.260495, 0, 0, 0, 1, 1,
-0.3721806, -1.259662, -5.162648, 1, 1, 1, 1, 1,
-0.3712978, 1.039419, -1.701246, 1, 1, 1, 1, 1,
-0.3689434, -0.204687, -1.727024, 1, 1, 1, 1, 1,
-0.3618039, 0.7237144, -1.24731, 1, 1, 1, 1, 1,
-0.3612567, 1.276433, -0.3906295, 1, 1, 1, 1, 1,
-0.3584391, 0.2898677, -1.035866, 1, 1, 1, 1, 1,
-0.3492858, -0.4155461, -1.152255, 1, 1, 1, 1, 1,
-0.3443635, 1.131969, -1.211226, 1, 1, 1, 1, 1,
-0.3436872, 0.8070859, 0.8943739, 1, 1, 1, 1, 1,
-0.3387656, -1.191645, -2.580529, 1, 1, 1, 1, 1,
-0.3386671, -0.7848498, -3.275109, 1, 1, 1, 1, 1,
-0.333663, 1.453514, -0.2071768, 1, 1, 1, 1, 1,
-0.3282071, -0.4121002, -4.671562, 1, 1, 1, 1, 1,
-0.3261997, 0.4266418, -0.8424262, 1, 1, 1, 1, 1,
-0.3251005, -0.8941207, -3.339997, 1, 1, 1, 1, 1,
-0.3192974, -1.0158, -2.534065, 0, 0, 1, 1, 1,
-0.3171468, -0.8975319, -0.9403861, 1, 0, 0, 1, 1,
-0.3157879, 0.9844777, -0.1293692, 1, 0, 0, 1, 1,
-0.3087854, -0.4021703, -3.980475, 1, 0, 0, 1, 1,
-0.3028636, -0.9937128, -2.411781, 1, 0, 0, 1, 1,
-0.3023164, 1.43918, 1.455695, 1, 0, 0, 1, 1,
-0.2922092, 1.975228, -0.01461978, 0, 0, 0, 1, 1,
-0.2905971, 0.4603721, 1.923131, 0, 0, 0, 1, 1,
-0.2900675, 0.4907577, -1.644546, 0, 0, 0, 1, 1,
-0.2895661, 0.06344115, -1.444835, 0, 0, 0, 1, 1,
-0.2895461, 0.6675145, 1.05288, 0, 0, 0, 1, 1,
-0.2865969, 0.2587624, -1.314144, 0, 0, 0, 1, 1,
-0.2852829, 0.4507105, 0.5076861, 0, 0, 0, 1, 1,
-0.2851411, 1.068921, -1.168496, 1, 1, 1, 1, 1,
-0.284758, 0.7318073, -1.639225, 1, 1, 1, 1, 1,
-0.2842323, 0.2164813, -1.972514, 1, 1, 1, 1, 1,
-0.2836989, -1.441885, -3.677211, 1, 1, 1, 1, 1,
-0.2832274, 0.01905137, -3.167615, 1, 1, 1, 1, 1,
-0.2813542, 0.121056, -0.989839, 1, 1, 1, 1, 1,
-0.2812836, 0.9497434, -0.06793122, 1, 1, 1, 1, 1,
-0.279979, -0.1459984, 0.1651623, 1, 1, 1, 1, 1,
-0.2782405, -0.2346691, -0.3007932, 1, 1, 1, 1, 1,
-0.2729124, -2.466311, -2.484639, 1, 1, 1, 1, 1,
-0.2721223, -0.5270907, -2.234884, 1, 1, 1, 1, 1,
-0.265237, 0.02418494, -0.4067918, 1, 1, 1, 1, 1,
-0.2628434, 1.420774, 1.685645, 1, 1, 1, 1, 1,
-0.2599969, 1.398433, -1.513338, 1, 1, 1, 1, 1,
-0.2546676, 0.0968229, -1.744029, 1, 1, 1, 1, 1,
-0.253875, -0.07806683, -1.595155, 0, 0, 1, 1, 1,
-0.2375859, -0.3627233, -2.571354, 1, 0, 0, 1, 1,
-0.237466, 0.8462616, -0.5617487, 1, 0, 0, 1, 1,
-0.232237, -0.5222095, -2.905138, 1, 0, 0, 1, 1,
-0.2258002, 0.4863276, -1.694947, 1, 0, 0, 1, 1,
-0.22343, -0.3814956, -2.47233, 1, 0, 0, 1, 1,
-0.2221987, 0.1534353, 0.03050705, 0, 0, 0, 1, 1,
-0.2208194, -0.6644273, -2.242814, 0, 0, 0, 1, 1,
-0.2170292, -0.1057712, -2.537875, 0, 0, 0, 1, 1,
-0.216906, 0.7069111, 0.9897023, 0, 0, 0, 1, 1,
-0.2168261, 0.120347, 0.8250053, 0, 0, 0, 1, 1,
-0.2107978, 0.931425, -0.6048685, 0, 0, 0, 1, 1,
-0.2087413, -0.2731044, -2.560673, 0, 0, 0, 1, 1,
-0.205119, 0.762445, 0.7741978, 1, 1, 1, 1, 1,
-0.2042158, 0.6619886, 1.40015, 1, 1, 1, 1, 1,
-0.1974617, 1.127502, 0.6076989, 1, 1, 1, 1, 1,
-0.1957565, 0.2997663, -2.159576, 1, 1, 1, 1, 1,
-0.1950827, 0.8754284, -0.2441994, 1, 1, 1, 1, 1,
-0.193812, 0.9865087, 1.208279, 1, 1, 1, 1, 1,
-0.1874177, 0.6241349, -0.2637541, 1, 1, 1, 1, 1,
-0.1833426, -1.393245, -2.233202, 1, 1, 1, 1, 1,
-0.1783825, 0.297013, 0.1210337, 1, 1, 1, 1, 1,
-0.1776814, 1.031815, 0.6640038, 1, 1, 1, 1, 1,
-0.1762731, 1.210495, 0.7886741, 1, 1, 1, 1, 1,
-0.1759948, 1.167329, 0.208509, 1, 1, 1, 1, 1,
-0.1732519, -0.08938617, -2.564193, 1, 1, 1, 1, 1,
-0.1715478, 1.095656, 0.3917208, 1, 1, 1, 1, 1,
-0.1702827, 0.4431981, 0.9428343, 1, 1, 1, 1, 1,
-0.1674853, 0.1734879, -0.2711415, 0, 0, 1, 1, 1,
-0.1665569, -0.8913582, -2.973737, 1, 0, 0, 1, 1,
-0.1625998, 0.0506837, -0.04406557, 1, 0, 0, 1, 1,
-0.1623194, -0.2186919, -4.232199, 1, 0, 0, 1, 1,
-0.1569, 0.42564, -0.9344758, 1, 0, 0, 1, 1,
-0.1552991, 0.6478907, -2.873346, 1, 0, 0, 1, 1,
-0.1479037, -2.077704, -1.827653, 0, 0, 0, 1, 1,
-0.1408245, 2.211212, -0.9331285, 0, 0, 0, 1, 1,
-0.1390523, -1.633418, -1.854935, 0, 0, 0, 1, 1,
-0.1376498, -1.071085, -2.170814, 0, 0, 0, 1, 1,
-0.1334423, 0.5188397, -1.790128, 0, 0, 0, 1, 1,
-0.1271601, -0.2026926, -1.984589, 0, 0, 0, 1, 1,
-0.1227074, -1.879478, -3.582733, 0, 0, 0, 1, 1,
-0.1202986, 1.528755, -0.5679645, 1, 1, 1, 1, 1,
-0.120252, 1.112845, -0.720309, 1, 1, 1, 1, 1,
-0.1164113, -1.05568, -4.916279, 1, 1, 1, 1, 1,
-0.1111983, 0.6801568, -0.01549122, 1, 1, 1, 1, 1,
-0.1088811, -0.8271474, -4.226904, 1, 1, 1, 1, 1,
-0.107641, -0.7626262, -3.65263, 1, 1, 1, 1, 1,
-0.1074857, -1.980443, -3.322216, 1, 1, 1, 1, 1,
-0.1071218, 1.068622, 1.382267, 1, 1, 1, 1, 1,
-0.1069659, -0.7019069, -2.815167, 1, 1, 1, 1, 1,
-0.1060223, 0.3449188, -2.441168, 1, 1, 1, 1, 1,
-0.1049979, -0.7261827, -3.365942, 1, 1, 1, 1, 1,
-0.1026587, 2.683796, -1.010471, 1, 1, 1, 1, 1,
-0.09861179, -0.5457959, -3.061208, 1, 1, 1, 1, 1,
-0.0974945, 0.9569718, 0.4786857, 1, 1, 1, 1, 1,
-0.09694544, 0.7369381, -0.01187195, 1, 1, 1, 1, 1,
-0.09557796, 0.905216, -1.094989, 0, 0, 1, 1, 1,
-0.09472755, -1.378255, -3.838041, 1, 0, 0, 1, 1,
-0.09385273, -0.4984389, -2.628919, 1, 0, 0, 1, 1,
-0.09132221, 1.124622, -0.2825485, 1, 0, 0, 1, 1,
-0.08884653, 0.5927874, -1.278236, 1, 0, 0, 1, 1,
-0.08709183, 1.308502, -0.2901469, 1, 0, 0, 1, 1,
-0.08628203, 0.7243702, -1.382022, 0, 0, 0, 1, 1,
-0.08137918, 0.7419819, 0.0721194, 0, 0, 0, 1, 1,
-0.08006585, 0.2925612, 0.2989309, 0, 0, 0, 1, 1,
-0.07215821, -0.1072008, -3.386793, 0, 0, 0, 1, 1,
-0.06991465, 0.771935, 1.081879, 0, 0, 0, 1, 1,
-0.06951507, -1.071208, -3.544864, 0, 0, 0, 1, 1,
-0.06892224, -1.728631, -3.538602, 0, 0, 0, 1, 1,
-0.06781485, 0.02771753, -2.367269, 1, 1, 1, 1, 1,
-0.06395288, 0.7415752, -0.2241928, 1, 1, 1, 1, 1,
-0.06348776, 0.3269488, -1.174773, 1, 1, 1, 1, 1,
-0.06067725, 1.058764, -1.004075, 1, 1, 1, 1, 1,
-0.06043237, 0.4729699, -0.08269496, 1, 1, 1, 1, 1,
-0.06034273, 0.05407069, -1.1446, 1, 1, 1, 1, 1,
-0.05830094, -0.2496888, -0.4834473, 1, 1, 1, 1, 1,
-0.05665139, -0.07137874, -2.706706, 1, 1, 1, 1, 1,
-0.0560893, -0.424522, -2.059702, 1, 1, 1, 1, 1,
-0.05429089, -0.1745769, -1.713964, 1, 1, 1, 1, 1,
-0.05256844, -0.05595839, -2.562963, 1, 1, 1, 1, 1,
-0.05171951, 0.2950343, -0.8577003, 1, 1, 1, 1, 1,
-0.04799311, 0.6714726, -1.822992, 1, 1, 1, 1, 1,
-0.04754815, 0.510334, 0.07706983, 1, 1, 1, 1, 1,
-0.04152946, -1.551785, -3.958021, 1, 1, 1, 1, 1,
-0.03784312, 1.85758, -0.2328052, 0, 0, 1, 1, 1,
-0.03186645, -0.1457038, -2.977502, 1, 0, 0, 1, 1,
-0.02846172, -2.051379, -3.948481, 1, 0, 0, 1, 1,
-0.02436032, -0.4935308, -2.562081, 1, 0, 0, 1, 1,
-0.02320352, -1.013465, -3.744855, 1, 0, 0, 1, 1,
-0.02256787, 0.1671673, -0.8706501, 1, 0, 0, 1, 1,
-0.019745, 0.6314013, -0.1693776, 0, 0, 0, 1, 1,
-0.01971447, -1.92332, -3.721826, 0, 0, 0, 1, 1,
-0.01892496, -1.273139, -3.318156, 0, 0, 0, 1, 1,
-0.01766212, 0.1428553, -1.914808, 0, 0, 0, 1, 1,
-0.01558527, 0.2831779, -0.2332893, 0, 0, 0, 1, 1,
-0.01537215, -1.20039, -4.032259, 0, 0, 0, 1, 1,
-0.003633521, -0.7618564, -3.966141, 0, 0, 0, 1, 1,
0.003922024, -0.9209331, 2.423702, 1, 1, 1, 1, 1,
0.006686594, -1.11452, 3.474719, 1, 1, 1, 1, 1,
0.01355993, 1.87018, -1.398133, 1, 1, 1, 1, 1,
0.01369637, -0.09014623, 1.481742, 1, 1, 1, 1, 1,
0.01841727, -1.880505, 4.327822, 1, 1, 1, 1, 1,
0.0190844, 1.517614, 3.202445, 1, 1, 1, 1, 1,
0.01930039, 0.6318102, -0.5610293, 1, 1, 1, 1, 1,
0.02474123, -1.688604, 3.419351, 1, 1, 1, 1, 1,
0.02840364, -0.7169562, 1.722258, 1, 1, 1, 1, 1,
0.03058933, -0.1708609, 2.952208, 1, 1, 1, 1, 1,
0.03461537, -1.157787, 2.415589, 1, 1, 1, 1, 1,
0.03481549, -0.2566018, 1.882863, 1, 1, 1, 1, 1,
0.04623537, 0.6165268, -0.9164302, 1, 1, 1, 1, 1,
0.05623409, -0.6357598, 2.024268, 1, 1, 1, 1, 1,
0.05715873, -0.6790748, 4.356483, 1, 1, 1, 1, 1,
0.0572833, -0.1800876, 2.202485, 0, 0, 1, 1, 1,
0.05800308, -1.216693, 4.105925, 1, 0, 0, 1, 1,
0.06129402, -0.1637368, 5.276497, 1, 0, 0, 1, 1,
0.06195643, -0.2685939, 3.193367, 1, 0, 0, 1, 1,
0.06316238, 1.572766, -2.068661, 1, 0, 0, 1, 1,
0.06543852, -2.127463, 0.3790305, 1, 0, 0, 1, 1,
0.06757082, 0.3804537, 0.6237217, 0, 0, 0, 1, 1,
0.07043441, -0.6510294, 1.625868, 0, 0, 0, 1, 1,
0.07160536, -1.333447, 2.589521, 0, 0, 0, 1, 1,
0.07218512, -0.9521484, 4.142118, 0, 0, 0, 1, 1,
0.07241575, -0.07262412, 2.190696, 0, 0, 0, 1, 1,
0.07506613, -1.921835, 2.816198, 0, 0, 0, 1, 1,
0.0775357, -0.2717981, 3.151152, 0, 0, 0, 1, 1,
0.07953946, 1.585858, 2.064746, 1, 1, 1, 1, 1,
0.08534063, 0.02084201, 1.581459, 1, 1, 1, 1, 1,
0.08815417, -0.5527117, 3.800337, 1, 1, 1, 1, 1,
0.09167083, -1.859288, 1.211722, 1, 1, 1, 1, 1,
0.09186128, 0.08145092, 1.433267, 1, 1, 1, 1, 1,
0.09399913, 0.9926889, 0.5938337, 1, 1, 1, 1, 1,
0.097528, -0.3889043, 2.143103, 1, 1, 1, 1, 1,
0.1013843, -0.9821063, 3.639396, 1, 1, 1, 1, 1,
0.1031568, 0.3890002, -1.076855, 1, 1, 1, 1, 1,
0.1044635, 0.2768746, -0.2711012, 1, 1, 1, 1, 1,
0.1071385, -0.48796, 2.824276, 1, 1, 1, 1, 1,
0.1073858, -0.5506557, 3.485996, 1, 1, 1, 1, 1,
0.1080003, 2.285657, -1.491066, 1, 1, 1, 1, 1,
0.1090281, 1.19774, -0.2991953, 1, 1, 1, 1, 1,
0.1138446, -0.5735098, 1.960749, 1, 1, 1, 1, 1,
0.118088, -0.2346469, 2.822853, 0, 0, 1, 1, 1,
0.1202805, -1.284731, 3.955937, 1, 0, 0, 1, 1,
0.1207213, -0.2184501, 3.026947, 1, 0, 0, 1, 1,
0.1222161, -0.557413, 3.835061, 1, 0, 0, 1, 1,
0.1228212, -0.467463, 2.987123, 1, 0, 0, 1, 1,
0.1234255, -0.6495129, 3.25456, 1, 0, 0, 1, 1,
0.1239638, 1.758597, -0.8228885, 0, 0, 0, 1, 1,
0.1256497, -0.003676734, 0.5200481, 0, 0, 0, 1, 1,
0.1355227, 1.820998, 1.157193, 0, 0, 0, 1, 1,
0.136396, -1.545578, 4.103274, 0, 0, 0, 1, 1,
0.1375816, 0.5406871, -1.083489, 0, 0, 0, 1, 1,
0.1434411, -0.1957027, 3.258663, 0, 0, 0, 1, 1,
0.1448003, 2.87947, -0.1919099, 0, 0, 0, 1, 1,
0.1509567, 1.352423, -0.1716903, 1, 1, 1, 1, 1,
0.1518285, 1.237817, 0.1484242, 1, 1, 1, 1, 1,
0.161873, -0.002127967, 1.43652, 1, 1, 1, 1, 1,
0.1655962, 0.3754224, 0.3060571, 1, 1, 1, 1, 1,
0.1657846, -0.07259273, 2.028373, 1, 1, 1, 1, 1,
0.1690606, -1.351471, 1.943748, 1, 1, 1, 1, 1,
0.1733333, 1.365686, 0.2222794, 1, 1, 1, 1, 1,
0.1738369, -0.8073174, 4.295662, 1, 1, 1, 1, 1,
0.1749117, 0.2920449, 0.82549, 1, 1, 1, 1, 1,
0.1758662, -0.7032012, 4.213642, 1, 1, 1, 1, 1,
0.1782222, 2.04447, 0.1237947, 1, 1, 1, 1, 1,
0.1851497, 2.679214, 1.683146, 1, 1, 1, 1, 1,
0.1872349, 0.01169718, 2.811346, 1, 1, 1, 1, 1,
0.1879485, 0.7208383, -0.2928267, 1, 1, 1, 1, 1,
0.1887107, -1.53355, 3.848562, 1, 1, 1, 1, 1,
0.1943949, -0.9487032, 3.204063, 0, 0, 1, 1, 1,
0.1983822, 0.6148554, -1.023098, 1, 0, 0, 1, 1,
0.1993951, 1.565862, 0.4266585, 1, 0, 0, 1, 1,
0.202011, -0.9779904, 1.526562, 1, 0, 0, 1, 1,
0.202699, 0.6637502, -1.052985, 1, 0, 0, 1, 1,
0.2061658, 0.7583237, 0.3539203, 1, 0, 0, 1, 1,
0.2078203, -0.342685, 3.174502, 0, 0, 0, 1, 1,
0.2097694, -1.059875, 3.757866, 0, 0, 0, 1, 1,
0.2111796, -1.640475, 2.965338, 0, 0, 0, 1, 1,
0.2138982, -0.05669031, 1.268975, 0, 0, 0, 1, 1,
0.2139667, 0.2588782, 1.31592, 0, 0, 0, 1, 1,
0.2183691, 0.8095637, -0.6332613, 0, 0, 0, 1, 1,
0.2198413, 0.67333, -0.07691859, 0, 0, 0, 1, 1,
0.2229071, 0.4923717, -0.04937952, 1, 1, 1, 1, 1,
0.2246447, -0.6228556, 1.985877, 1, 1, 1, 1, 1,
0.226988, 1.47832, 1.791013, 1, 1, 1, 1, 1,
0.2279625, 0.9455653, 1.839312, 1, 1, 1, 1, 1,
0.2375353, 0.7493479, 0.02791871, 1, 1, 1, 1, 1,
0.2388639, 0.4162494, 0.9297509, 1, 1, 1, 1, 1,
0.2396792, -2.049623, 3.541421, 1, 1, 1, 1, 1,
0.2438268, 0.7705672, -0.5362995, 1, 1, 1, 1, 1,
0.2460869, -0.8668293, 2.807387, 1, 1, 1, 1, 1,
0.249538, -1.258388, 4.299473, 1, 1, 1, 1, 1,
0.2512249, -0.3922885, 3.096884, 1, 1, 1, 1, 1,
0.2549663, -0.1065478, 3.451953, 1, 1, 1, 1, 1,
0.2556423, -0.1190167, 1.397326, 1, 1, 1, 1, 1,
0.2563049, -0.20997, 2.466835, 1, 1, 1, 1, 1,
0.2584352, 1.112864, 1.144337, 1, 1, 1, 1, 1,
0.2589366, -0.1659026, 2.509137, 0, 0, 1, 1, 1,
0.258999, -0.1749864, 2.989406, 1, 0, 0, 1, 1,
0.2596953, 0.9733618, 1.578251, 1, 0, 0, 1, 1,
0.2678059, -0.4137497, 1.823096, 1, 0, 0, 1, 1,
0.2750596, -0.07850474, 2.335709, 1, 0, 0, 1, 1,
0.2831245, -0.02268866, 3.589778, 1, 0, 0, 1, 1,
0.2899539, 0.1603862, 0.08983385, 0, 0, 0, 1, 1,
0.2900128, -1.699431, 3.485981, 0, 0, 0, 1, 1,
0.29259, -1.169003, 3.007286, 0, 0, 0, 1, 1,
0.2948679, 0.3013075, 0.5005497, 0, 0, 0, 1, 1,
0.2969462, -0.0958142, 2.293819, 0, 0, 0, 1, 1,
0.3014373, 0.06161959, 1.735471, 0, 0, 0, 1, 1,
0.3040597, 0.9453626, 1.286593, 0, 0, 0, 1, 1,
0.304743, -1.108075, 3.815945, 1, 1, 1, 1, 1,
0.3055492, 0.2510453, 1.446977, 1, 1, 1, 1, 1,
0.3084391, 0.6818844, 0.3511628, 1, 1, 1, 1, 1,
0.310942, 3.367418, -0.0805123, 1, 1, 1, 1, 1,
0.3170507, -1.268008, 2.989861, 1, 1, 1, 1, 1,
0.3172451, -0.01521519, 1.034727, 1, 1, 1, 1, 1,
0.3199314, -0.003754765, 0.4377804, 1, 1, 1, 1, 1,
0.3200098, 0.7966233, 2.348425, 1, 1, 1, 1, 1,
0.3212145, 0.5703055, 2.454534, 1, 1, 1, 1, 1,
0.3229431, 1.209086, 0.2276594, 1, 1, 1, 1, 1,
0.3238662, 0.03074358, 3.385527, 1, 1, 1, 1, 1,
0.3298624, 0.01279308, 2.04965, 1, 1, 1, 1, 1,
0.3319759, -0.2794624, 0.02048996, 1, 1, 1, 1, 1,
0.332133, -0.332079, 2.634358, 1, 1, 1, 1, 1,
0.3327172, -0.4028708, 1.958849, 1, 1, 1, 1, 1,
0.3341281, 2.212228, -1.216869, 0, 0, 1, 1, 1,
0.3349756, 0.3012459, 0.1102975, 1, 0, 0, 1, 1,
0.337126, -1.326601, 1.972861, 1, 0, 0, 1, 1,
0.3372943, 0.8408607, 1.14252, 1, 0, 0, 1, 1,
0.33973, -0.01204656, 1.72507, 1, 0, 0, 1, 1,
0.3407736, 0.9005134, 1.647118, 1, 0, 0, 1, 1,
0.3429709, -0.6337318, 3.701752, 0, 0, 0, 1, 1,
0.3432746, -0.6673916, 1.87362, 0, 0, 0, 1, 1,
0.3469812, -0.8398719, 3.706193, 0, 0, 0, 1, 1,
0.3531233, -0.2787802, 0.5028234, 0, 0, 0, 1, 1,
0.3545507, 2.828914, 1.929618, 0, 0, 0, 1, 1,
0.3563474, -1.536991, 1.946504, 0, 0, 0, 1, 1,
0.3621177, -0.4168994, 3.837936, 0, 0, 0, 1, 1,
0.3627852, 1.549333, 0.9592806, 1, 1, 1, 1, 1,
0.3628041, 0.007045019, 2.153143, 1, 1, 1, 1, 1,
0.363211, -0.9176853, 2.728206, 1, 1, 1, 1, 1,
0.3632667, -1.784214, 1.689084, 1, 1, 1, 1, 1,
0.366569, -1.873646, 2.125812, 1, 1, 1, 1, 1,
0.3803776, 1.21476, 2.094402, 1, 1, 1, 1, 1,
0.3807532, -0.3483425, 3.613598, 1, 1, 1, 1, 1,
0.3860753, 1.510467, 0.07208002, 1, 1, 1, 1, 1,
0.3897327, 0.8169812, -2.57947, 1, 1, 1, 1, 1,
0.390111, 1.790105, 0.5830922, 1, 1, 1, 1, 1,
0.3934, -2.239289, 3.976258, 1, 1, 1, 1, 1,
0.3955112, 0.5499914, 0.636813, 1, 1, 1, 1, 1,
0.3981108, -0.2705864, 3.378091, 1, 1, 1, 1, 1,
0.4012723, 0.114839, 2.674687, 1, 1, 1, 1, 1,
0.4044893, 2.141411, 1.477061, 1, 1, 1, 1, 1,
0.4044911, 2.471059, 0.5614586, 0, 0, 1, 1, 1,
0.4052342, -0.03702578, 1.971452, 1, 0, 0, 1, 1,
0.4109235, 0.993111, -1.576952, 1, 0, 0, 1, 1,
0.4149636, -0.250463, 3.104339, 1, 0, 0, 1, 1,
0.4165873, 0.2547271, 1.509027, 1, 0, 0, 1, 1,
0.4236663, 0.001730634, 1.139191, 1, 0, 0, 1, 1,
0.4373485, -0.9480038, 1.408989, 0, 0, 0, 1, 1,
0.4405024, -0.4568184, 2.648535, 0, 0, 0, 1, 1,
0.4415101, 0.7080459, 1.165381, 0, 0, 0, 1, 1,
0.4514323, -0.9302675, 2.128237, 0, 0, 0, 1, 1,
0.454247, -0.341148, 1.249485, 0, 0, 0, 1, 1,
0.4593781, 0.05499542, 0.8724976, 0, 0, 0, 1, 1,
0.4622462, -0.8805255, 0.9880078, 0, 0, 0, 1, 1,
0.463019, 1.011153, -0.7495445, 1, 1, 1, 1, 1,
0.4657149, 1.904331, -1.030747, 1, 1, 1, 1, 1,
0.4705509, -0.8236371, 2.230132, 1, 1, 1, 1, 1,
0.4722136, -0.6203525, 3.094171, 1, 1, 1, 1, 1,
0.4778853, -1.480996, 2.054526, 1, 1, 1, 1, 1,
0.4779031, -0.56095, 0.5270404, 1, 1, 1, 1, 1,
0.4799694, 0.9512299, 0.1586959, 1, 1, 1, 1, 1,
0.4842706, -0.4665955, 3.106421, 1, 1, 1, 1, 1,
0.4882835, 2.214988, 0.6048698, 1, 1, 1, 1, 1,
0.488593, -0.9365659, 1.037941, 1, 1, 1, 1, 1,
0.4929948, 0.9942046, 0.03816199, 1, 1, 1, 1, 1,
0.4983207, 0.6217273, 0.1073787, 1, 1, 1, 1, 1,
0.5016707, 0.6467676, 0.3468382, 1, 1, 1, 1, 1,
0.5018682, -0.4709057, 2.959339, 1, 1, 1, 1, 1,
0.5059569, -0.9479069, 4.267617, 1, 1, 1, 1, 1,
0.5069119, -1.452784, 4.135175, 0, 0, 1, 1, 1,
0.5090044, 0.09246066, 1.962894, 1, 0, 0, 1, 1,
0.5154069, 2.715527, 0.8763472, 1, 0, 0, 1, 1,
0.515687, -0.5624263, 2.640557, 1, 0, 0, 1, 1,
0.5164868, -1.572421, 2.430389, 1, 0, 0, 1, 1,
0.5184677, 0.4967121, 0.5040305, 1, 0, 0, 1, 1,
0.5210105, 1.845171, 1.844956, 0, 0, 0, 1, 1,
0.5213035, -0.2831677, 2.094767, 0, 0, 0, 1, 1,
0.5216089, 0.02530912, 0.7730537, 0, 0, 0, 1, 1,
0.5237289, 1.292442, 0.3690496, 0, 0, 0, 1, 1,
0.5264903, -0.5527914, 0.02402677, 0, 0, 0, 1, 1,
0.5302902, 0.8625104, 0.01352657, 0, 0, 0, 1, 1,
0.5352421, 0.8363793, 1.418496, 0, 0, 0, 1, 1,
0.5361659, -0.1074734, 1.505645, 1, 1, 1, 1, 1,
0.5396135, -0.7782872, 3.268683, 1, 1, 1, 1, 1,
0.5398787, -0.8964384, 3.90108, 1, 1, 1, 1, 1,
0.5428565, -1.094712, 3.459055, 1, 1, 1, 1, 1,
0.5432826, -0.1029609, 1.662302, 1, 1, 1, 1, 1,
0.5446147, 1.519687, -0.4686394, 1, 1, 1, 1, 1,
0.546477, 0.9764431, 1.086229, 1, 1, 1, 1, 1,
0.5470505, 1.838752, 0.3276355, 1, 1, 1, 1, 1,
0.5572931, 0.9031218, 0.1910363, 1, 1, 1, 1, 1,
0.5579492, -1.399178, 2.832561, 1, 1, 1, 1, 1,
0.5598407, -0.2122953, 0.6742796, 1, 1, 1, 1, 1,
0.5610325, -0.5509119, 2.171147, 1, 1, 1, 1, 1,
0.5623647, 0.192591, -1.255524, 1, 1, 1, 1, 1,
0.5644407, 1.573407, 1.544187, 1, 1, 1, 1, 1,
0.5682305, 0.4359171, -0.5659883, 1, 1, 1, 1, 1,
0.5694819, 1.081023, -0.3502224, 0, 0, 1, 1, 1,
0.5742814, 1.873478, 1.452591, 1, 0, 0, 1, 1,
0.5782579, 0.8687007, -1.596026, 1, 0, 0, 1, 1,
0.579469, 0.3696299, 0.8331386, 1, 0, 0, 1, 1,
0.5803436, -0.7116959, 1.902256, 1, 0, 0, 1, 1,
0.5806287, -1.120747, 0.6232294, 1, 0, 0, 1, 1,
0.5806534, 0.5138009, 1.144841, 0, 0, 0, 1, 1,
0.5812702, -1.920865, 2.906795, 0, 0, 0, 1, 1,
0.5823401, 1.923354, 2.330975, 0, 0, 0, 1, 1,
0.5848034, 0.07806572, 1.368553, 0, 0, 0, 1, 1,
0.5872689, -0.1018804, -1.304327, 0, 0, 0, 1, 1,
0.5886144, -0.3460601, 1.442733, 0, 0, 0, 1, 1,
0.5904189, 0.9784976, 1.068823, 0, 0, 0, 1, 1,
0.5918344, 1.80807, -0.03942067, 1, 1, 1, 1, 1,
0.5994046, 0.8443286, 0.7905599, 1, 1, 1, 1, 1,
0.6032413, -0.1437268, 1.894766, 1, 1, 1, 1, 1,
0.6040233, 1.286009, 1.370085, 1, 1, 1, 1, 1,
0.6109101, -0.4686219, 1.73265, 1, 1, 1, 1, 1,
0.611863, 0.02365748, 0.8795395, 1, 1, 1, 1, 1,
0.6214021, 0.4448806, 1.693589, 1, 1, 1, 1, 1,
0.623341, -0.5975572, 1.625685, 1, 1, 1, 1, 1,
0.623676, -0.05277046, 1.068137, 1, 1, 1, 1, 1,
0.6264337, 1.742805, 1.163815, 1, 1, 1, 1, 1,
0.631332, 0.05941662, 1.187725, 1, 1, 1, 1, 1,
0.6377778, -0.9308473, 1.524243, 1, 1, 1, 1, 1,
0.6384417, -0.7645536, 2.661416, 1, 1, 1, 1, 1,
0.6427865, 0.01145535, 2.470174, 1, 1, 1, 1, 1,
0.6438975, 1.337939, 1.155112, 1, 1, 1, 1, 1,
0.6518382, -0.6797593, 2.163202, 0, 0, 1, 1, 1,
0.6561746, -1.633474, 3.128574, 1, 0, 0, 1, 1,
0.6624441, -1.538499, 1.65947, 1, 0, 0, 1, 1,
0.6629511, 0.9061573, 1.530749, 1, 0, 0, 1, 1,
0.6643863, 0.2337153, -0.6374317, 1, 0, 0, 1, 1,
0.6716183, -1.33172, 3.025752, 1, 0, 0, 1, 1,
0.680241, -0.8614128, 2.505014, 0, 0, 0, 1, 1,
0.6819946, -1.822621, 2.977461, 0, 0, 0, 1, 1,
0.6862074, -0.1659217, 0.6917726, 0, 0, 0, 1, 1,
0.6896775, -0.3032752, 2.491314, 0, 0, 0, 1, 1,
0.6911796, 1.094683, 0.8324251, 0, 0, 0, 1, 1,
0.6923547, 1.404033, -2.266286, 0, 0, 0, 1, 1,
0.6936681, -0.337721, 3.2032, 0, 0, 0, 1, 1,
0.6962136, 0.4594819, 1.188392, 1, 1, 1, 1, 1,
0.6970598, -0.76534, 2.615346, 1, 1, 1, 1, 1,
0.6973734, 0.5027961, 0.8649282, 1, 1, 1, 1, 1,
0.7004124, -1.824574, 1.024286, 1, 1, 1, 1, 1,
0.7025554, 0.5522588, -1.038534, 1, 1, 1, 1, 1,
0.7036676, 0.1711842, 0.7000384, 1, 1, 1, 1, 1,
0.7069039, 2.401886, 0.8502283, 1, 1, 1, 1, 1,
0.710533, 1.544935, 0.1852331, 1, 1, 1, 1, 1,
0.7114019, 0.2630818, 1.201795, 1, 1, 1, 1, 1,
0.7151281, -0.9762686, 3.339619, 1, 1, 1, 1, 1,
0.7165195, -1.190316, 2.672932, 1, 1, 1, 1, 1,
0.7345733, 0.01837106, 2.60865, 1, 1, 1, 1, 1,
0.7361849, -0.07425042, 2.756292, 1, 1, 1, 1, 1,
0.7413062, -0.4141563, 1.257101, 1, 1, 1, 1, 1,
0.7458513, -0.7179448, 3.758882, 1, 1, 1, 1, 1,
0.7588474, 0.3198509, 1.021137, 0, 0, 1, 1, 1,
0.7602261, -0.371639, 2.517779, 1, 0, 0, 1, 1,
0.7625465, -2.45846, 1.8001, 1, 0, 0, 1, 1,
0.7709361, -2.194661, 3.018601, 1, 0, 0, 1, 1,
0.7746344, -0.3791073, 1.385858, 1, 0, 0, 1, 1,
0.7759316, 0.8029208, 1.82121, 1, 0, 0, 1, 1,
0.7763931, -1.830256, 3.867973, 0, 0, 0, 1, 1,
0.7854313, -1.105358, 1.885147, 0, 0, 0, 1, 1,
0.7854508, 0.6361592, 0.7398874, 0, 0, 0, 1, 1,
0.787483, -0.3081917, 1.680586, 0, 0, 0, 1, 1,
0.7943714, 1.063728, 0.5520847, 0, 0, 0, 1, 1,
0.7949275, 0.3174821, 1.615361, 0, 0, 0, 1, 1,
0.797175, 0.6365171, 2.574657, 0, 0, 0, 1, 1,
0.799266, 0.1352643, 2.261174, 1, 1, 1, 1, 1,
0.8008368, 0.2978954, 0.6402673, 1, 1, 1, 1, 1,
0.8020902, 0.9918141, 3.268957, 1, 1, 1, 1, 1,
0.8046605, -0.01976142, 0.6077176, 1, 1, 1, 1, 1,
0.8057466, -0.8840904, 4.560428, 1, 1, 1, 1, 1,
0.8071888, -1.692989, 0.6567342, 1, 1, 1, 1, 1,
0.8100573, -1.470742, 3.706586, 1, 1, 1, 1, 1,
0.8125561, 0.1958555, 3.259676, 1, 1, 1, 1, 1,
0.8160374, -0.7409803, 0.9028999, 1, 1, 1, 1, 1,
0.8172884, 0.4854501, 1.221919, 1, 1, 1, 1, 1,
0.8181999, -0.7191319, 3.322407, 1, 1, 1, 1, 1,
0.8185404, 2.516391, -0.6265489, 1, 1, 1, 1, 1,
0.8185911, -0.7210288, 3.961086, 1, 1, 1, 1, 1,
0.8237178, 0.8839526, -0.4541709, 1, 1, 1, 1, 1,
0.8251167, -0.9095871, 2.594539, 1, 1, 1, 1, 1,
0.8253915, -0.4328467, 3.1061, 0, 0, 1, 1, 1,
0.8296552, 1.606156, 2.42348, 1, 0, 0, 1, 1,
0.8376243, 1.760452, 2.026011, 1, 0, 0, 1, 1,
0.8413329, 0.2936308, 1.056885, 1, 0, 0, 1, 1,
0.841867, 0.9762388, 0.4433655, 1, 0, 0, 1, 1,
0.847306, 0.4302549, 2.756412, 1, 0, 0, 1, 1,
0.8476152, 0.5796342, 1.575036, 0, 0, 0, 1, 1,
0.8492963, -1.936123, 3.239911, 0, 0, 0, 1, 1,
0.8508292, -0.2495773, 1.239017, 0, 0, 0, 1, 1,
0.8569286, 1.872423, 0.910261, 0, 0, 0, 1, 1,
0.8588229, 0.2713971, 2.10806, 0, 0, 0, 1, 1,
0.8615144, 0.3115188, 1.911087, 0, 0, 0, 1, 1,
0.8739982, -0.6081699, 3.292323, 0, 0, 0, 1, 1,
0.8828076, -0.7339283, 2.647929, 1, 1, 1, 1, 1,
0.8834682, 0.07602537, 0.4199983, 1, 1, 1, 1, 1,
0.8848195, -0.1688213, 1.953121, 1, 1, 1, 1, 1,
0.8872802, -0.3999825, 1.300399, 1, 1, 1, 1, 1,
0.8877644, 0.6421812, 0.6085873, 1, 1, 1, 1, 1,
0.8878343, 0.02053302, 2.483962, 1, 1, 1, 1, 1,
0.8892449, 1.647582, 0.1326666, 1, 1, 1, 1, 1,
0.891129, -1.08369, 1.248619, 1, 1, 1, 1, 1,
0.8911416, 0.5514587, 1.293245, 1, 1, 1, 1, 1,
0.8917217, -1.673121, 3.735563, 1, 1, 1, 1, 1,
0.8929928, 0.7330321, 0.4919819, 1, 1, 1, 1, 1,
0.8985831, 0.7345745, 0.8951811, 1, 1, 1, 1, 1,
0.9008699, -0.1360763, 2.557229, 1, 1, 1, 1, 1,
0.9012629, -1.926738, 0.8197455, 1, 1, 1, 1, 1,
0.9159062, -2.044923, 3.672155, 1, 1, 1, 1, 1,
0.9162891, -1.445233, 4.259499, 0, 0, 1, 1, 1,
0.9260684, 0.7093139, 0.7403339, 1, 0, 0, 1, 1,
0.9343246, 1.672336, 1.893077, 1, 0, 0, 1, 1,
0.9353619, 0.2240163, 1.973692, 1, 0, 0, 1, 1,
0.937557, -1.86636, 1.99798, 1, 0, 0, 1, 1,
0.9386771, 0.505073, 1.245021, 1, 0, 0, 1, 1,
0.942121, 1.163207, -1.19698, 0, 0, 0, 1, 1,
0.9451711, 2.310599, 0.4684216, 0, 0, 0, 1, 1,
0.9470522, 0.1714796, 1.773502, 0, 0, 0, 1, 1,
0.9499549, -0.4198647, 1.915547, 0, 0, 0, 1, 1,
0.952627, -0.4021331, 3.132575, 0, 0, 0, 1, 1,
0.9551813, 1.669391, 1.545092, 0, 0, 0, 1, 1,
0.9582543, 0.3262715, 0.09978162, 0, 0, 0, 1, 1,
0.9616344, -0.3724495, 1.962329, 1, 1, 1, 1, 1,
0.9621404, 1.324313, 1.549046, 1, 1, 1, 1, 1,
0.9638819, 0.3301466, 0.7649523, 1, 1, 1, 1, 1,
0.9648089, 0.3216878, 2.155408, 1, 1, 1, 1, 1,
0.9658058, -0.1086585, 1.216975, 1, 1, 1, 1, 1,
0.9752035, 2.24934, 0.5779809, 1, 1, 1, 1, 1,
0.9890131, -1.044734, 2.769582, 1, 1, 1, 1, 1,
0.9997041, 0.1215161, 2.939562, 1, 1, 1, 1, 1,
1.000238, -0.881585, 1.163993, 1, 1, 1, 1, 1,
1.000836, 1.130247, -0.1121627, 1, 1, 1, 1, 1,
1.001113, -2.23774, 3.604494, 1, 1, 1, 1, 1,
1.005186, 1.171904, 1.460383, 1, 1, 1, 1, 1,
1.008776, 0.8423727, 0.6574111, 1, 1, 1, 1, 1,
1.013197, 0.3954005, 2.239778, 1, 1, 1, 1, 1,
1.013665, 0.6883752, 1.455573, 1, 1, 1, 1, 1,
1.018637, 0.4531939, 0.4102211, 0, 0, 1, 1, 1,
1.021729, 0.9504356, 2.292397, 1, 0, 0, 1, 1,
1.023183, -0.6449113, 2.058975, 1, 0, 0, 1, 1,
1.027928, -0.5284573, 2.179832, 1, 0, 0, 1, 1,
1.031331, -0.9134547, 0.2869607, 1, 0, 0, 1, 1,
1.033562, 0.08103157, 1.69631, 1, 0, 0, 1, 1,
1.049111, 0.6907193, 1.656396, 0, 0, 0, 1, 1,
1.049356, 0.463279, 0.5271082, 0, 0, 0, 1, 1,
1.049401, -0.6167322, 2.708414, 0, 0, 0, 1, 1,
1.062418, 0.9821364, 0.2541787, 0, 0, 0, 1, 1,
1.069009, -0.08681943, 1.347317, 0, 0, 0, 1, 1,
1.070165, 0.1056149, 2.268421, 0, 0, 0, 1, 1,
1.070463, -1.057126, 1.947334, 0, 0, 0, 1, 1,
1.070868, 0.8602108, -0.1859483, 1, 1, 1, 1, 1,
1.073742, -1.627618, 2.052238, 1, 1, 1, 1, 1,
1.074471, 0.06412631, 1.439734, 1, 1, 1, 1, 1,
1.077942, -1.720048, 2.971026, 1, 1, 1, 1, 1,
1.088337, -0.1612248, 2.587101, 1, 1, 1, 1, 1,
1.09202, 0.1721709, 0.1520938, 1, 1, 1, 1, 1,
1.0931, -0.2179664, 0.363204, 1, 1, 1, 1, 1,
1.095144, -1.31408, 2.43631, 1, 1, 1, 1, 1,
1.104445, -0.8758823, 2.289694, 1, 1, 1, 1, 1,
1.105414, -1.358957, 0.6022846, 1, 1, 1, 1, 1,
1.112786, -0.02172729, 2.097848, 1, 1, 1, 1, 1,
1.113516, 0.6714293, 2.023988, 1, 1, 1, 1, 1,
1.115474, 0.6072975, 0.07747905, 1, 1, 1, 1, 1,
1.116353, -1.166978, 2.280835, 1, 1, 1, 1, 1,
1.118176, 0.2905267, 1.794237, 1, 1, 1, 1, 1,
1.125041, 0.0125854, 1.234479, 0, 0, 1, 1, 1,
1.135156, -1.910618, 2.815914, 1, 0, 0, 1, 1,
1.13855, -1.362081, 2.314022, 1, 0, 0, 1, 1,
1.14032, -1.552439, 2.348119, 1, 0, 0, 1, 1,
1.14095, -0.8723149, 2.030791, 1, 0, 0, 1, 1,
1.143911, -0.4848262, 2.689415, 1, 0, 0, 1, 1,
1.150043, -0.6297673, 1.487149, 0, 0, 0, 1, 1,
1.154437, -0.9708042, 2.399816, 0, 0, 0, 1, 1,
1.157682, 0.496265, 1.914185, 0, 0, 0, 1, 1,
1.158926, 1.108528, 0.7541943, 0, 0, 0, 1, 1,
1.164573, -0.4963039, 2.985593, 0, 0, 0, 1, 1,
1.180091, -0.1111955, 2.053356, 0, 0, 0, 1, 1,
1.182814, -0.5297235, 3.3964, 0, 0, 0, 1, 1,
1.190399, 0.5733629, 1.44659, 1, 1, 1, 1, 1,
1.196523, -0.7388099, 2.66297, 1, 1, 1, 1, 1,
1.203193, -1.090047, 0.5109305, 1, 1, 1, 1, 1,
1.207864, 0.04420856, 1.190946, 1, 1, 1, 1, 1,
1.208334, -1.640275, 1.622849, 1, 1, 1, 1, 1,
1.212581, -0.07373377, 1.005928, 1, 1, 1, 1, 1,
1.218698, 0.1781329, 1.122562, 1, 1, 1, 1, 1,
1.219913, -0.2064736, -0.168779, 1, 1, 1, 1, 1,
1.227045, -0.5561787, 0.5113407, 1, 1, 1, 1, 1,
1.240522, 0.07149329, 2.069606, 1, 1, 1, 1, 1,
1.245856, -0.5083275, 2.012333, 1, 1, 1, 1, 1,
1.260023, 0.4620227, 2.731126, 1, 1, 1, 1, 1,
1.260618, -1.838998, 3.160167, 1, 1, 1, 1, 1,
1.262626, -1.508844, 3.554424, 1, 1, 1, 1, 1,
1.279732, 2.607116, 1.037679, 1, 1, 1, 1, 1,
1.281743, 0.08984859, 1.395623, 0, 0, 1, 1, 1,
1.282043, 0.8249217, 0.5112238, 1, 0, 0, 1, 1,
1.286821, 2.636944, -0.2173851, 1, 0, 0, 1, 1,
1.296622, 0.01920698, 1.534502, 1, 0, 0, 1, 1,
1.304099, -1.053547, 1.486996, 1, 0, 0, 1, 1,
1.30617, 0.505621, 1.955044, 1, 0, 0, 1, 1,
1.307837, -0.1976224, 2.819573, 0, 0, 0, 1, 1,
1.308523, -0.2466464, 2.020904, 0, 0, 0, 1, 1,
1.310603, -0.64539, 1.685768, 0, 0, 0, 1, 1,
1.313182, -0.113264, 0.5052879, 0, 0, 0, 1, 1,
1.313239, -1.319834, 2.25726, 0, 0, 0, 1, 1,
1.313833, 0.7456643, 0.5863689, 0, 0, 0, 1, 1,
1.319214, -1.438156, 2.826441, 0, 0, 0, 1, 1,
1.350008, 1.043158, 0.617882, 1, 1, 1, 1, 1,
1.351431, 0.2814198, 0.06324103, 1, 1, 1, 1, 1,
1.38338, -0.3537506, 2.668022, 1, 1, 1, 1, 1,
1.385961, 0.009097202, 2.808434, 1, 1, 1, 1, 1,
1.386328, 1.094494, 1.613664, 1, 1, 1, 1, 1,
1.387012, 0.5851879, 0.6205386, 1, 1, 1, 1, 1,
1.395812, 1.352555, 0.1484328, 1, 1, 1, 1, 1,
1.396363, -0.06939831, 2.715696, 1, 1, 1, 1, 1,
1.402843, -0.4162132, 1.903992, 1, 1, 1, 1, 1,
1.403409, -0.3264385, 0.6172571, 1, 1, 1, 1, 1,
1.420514, 0.03190477, 0.1893764, 1, 1, 1, 1, 1,
1.425811, 0.6277396, 2.760507, 1, 1, 1, 1, 1,
1.429148, 0.3135217, 0.1784416, 1, 1, 1, 1, 1,
1.439201, 0.9904361, 2.229224, 1, 1, 1, 1, 1,
1.445842, -0.3764404, 0.3098644, 1, 1, 1, 1, 1,
1.448009, 0.574106, 2.589375, 0, 0, 1, 1, 1,
1.450405, 0.2268377, 0.5637347, 1, 0, 0, 1, 1,
1.461986, -0.5656482, 1.353265, 1, 0, 0, 1, 1,
1.463172, -1.542018, 1.804856, 1, 0, 0, 1, 1,
1.463656, 1.898136, 1.217673, 1, 0, 0, 1, 1,
1.4646, 0.3921683, 1.909903, 1, 0, 0, 1, 1,
1.465205, -0.2858063, 2.216498, 0, 0, 0, 1, 1,
1.473508, -0.6659832, 1.298541, 0, 0, 0, 1, 1,
1.478168, -2.197172, 2.400326, 0, 0, 0, 1, 1,
1.478461, 0.7512899, 2.285606, 0, 0, 0, 1, 1,
1.480222, -0.4623903, 4.515344, 0, 0, 0, 1, 1,
1.512119, -0.2180027, 1.510001, 0, 0, 0, 1, 1,
1.514371, -1.385484, 2.288576, 0, 0, 0, 1, 1,
1.520769, -0.8412062, 3.028819, 1, 1, 1, 1, 1,
1.535647, 0.821674, 0.9690617, 1, 1, 1, 1, 1,
1.545733, -0.1261854, 2.367116, 1, 1, 1, 1, 1,
1.560258, -0.9112135, 2.015327, 1, 1, 1, 1, 1,
1.563759, 0.2666138, 2.036148, 1, 1, 1, 1, 1,
1.567603, -0.3145638, 1.591868, 1, 1, 1, 1, 1,
1.57719, -0.8645005, 1.923284, 1, 1, 1, 1, 1,
1.581791, 0.9802411, -1.262816, 1, 1, 1, 1, 1,
1.582919, 0.6758252, 2.128916, 1, 1, 1, 1, 1,
1.586478, 0.5963815, 1.955438, 1, 1, 1, 1, 1,
1.586784, 0.624492, -0.6096146, 1, 1, 1, 1, 1,
1.59435, 0.7668338, 1.549971, 1, 1, 1, 1, 1,
1.59531, -1.09437, 2.105025, 1, 1, 1, 1, 1,
1.599014, -0.1902836, 1.938059, 1, 1, 1, 1, 1,
1.624219, 2.03031, -0.2537099, 1, 1, 1, 1, 1,
1.62765, -1.306281, 0.9623572, 0, 0, 1, 1, 1,
1.629298, 0.2685605, 2.672398, 1, 0, 0, 1, 1,
1.637028, -0.4810436, 2.898735, 1, 0, 0, 1, 1,
1.642321, -0.457816, 1.448769, 1, 0, 0, 1, 1,
1.643568, 0.07390382, 2.156057, 1, 0, 0, 1, 1,
1.667608, -0.1640977, 1.457254, 1, 0, 0, 1, 1,
1.669673, 0.3460849, 1.956446, 0, 0, 0, 1, 1,
1.675953, -1.267511, 1.144608, 0, 0, 0, 1, 1,
1.679383, -0.356722, 0.5691018, 0, 0, 0, 1, 1,
1.68702, -1.233194, 1.907511, 0, 0, 0, 1, 1,
1.688904, -1.086859, 2.656098, 0, 0, 0, 1, 1,
1.690257, 0.1758187, 1.854634, 0, 0, 0, 1, 1,
1.695727, -1.137298, 2.822475, 0, 0, 0, 1, 1,
1.722153, 0.2502521, 1.889275, 1, 1, 1, 1, 1,
1.742714, -0.2887723, 0.3746144, 1, 1, 1, 1, 1,
1.764798, 1.069748, 1.229403, 1, 1, 1, 1, 1,
1.811263, 0.2020798, 1.521669, 1, 1, 1, 1, 1,
1.814168, -1.108782, 2.632918, 1, 1, 1, 1, 1,
1.821743, 0.503563, 3.50163, 1, 1, 1, 1, 1,
1.841672, 1.104108, 1.908365, 1, 1, 1, 1, 1,
1.859864, -0.9223907, 0.8679386, 1, 1, 1, 1, 1,
1.868486, -0.6983106, 2.708705, 1, 1, 1, 1, 1,
1.869672, 0.660569, 0.9762864, 1, 1, 1, 1, 1,
1.88309, -0.6029565, 2.052329, 1, 1, 1, 1, 1,
1.888414, 0.3487697, 2.017737, 1, 1, 1, 1, 1,
1.907813, 0.7341272, 1.897406, 1, 1, 1, 1, 1,
1.947383, -0.1001419, 0.8499819, 1, 1, 1, 1, 1,
1.952893, -1.614707, 0.6178195, 1, 1, 1, 1, 1,
1.972224, -0.1619662, 1.360136, 0, 0, 1, 1, 1,
1.974449, -1.241036, 4.774877, 1, 0, 0, 1, 1,
1.997862, 0.5306525, -0.2333279, 1, 0, 0, 1, 1,
2.061944, -1.889472, 3.453047, 1, 0, 0, 1, 1,
2.071799, 0.08102594, 1.813777, 1, 0, 0, 1, 1,
2.071957, -0.8591126, -0.1701866, 1, 0, 0, 1, 1,
2.08306, 0.3319799, 1.077041, 0, 0, 0, 1, 1,
2.135494, -0.445412, 0.4843501, 0, 0, 0, 1, 1,
2.154269, 1.617311, 0.6320307, 0, 0, 0, 1, 1,
2.195349, -1.304594, 0.5867366, 0, 0, 0, 1, 1,
2.249646, 0.8576494, 1.012299, 0, 0, 0, 1, 1,
2.307954, -0.1856038, 2.21626, 0, 0, 0, 1, 1,
2.374334, -1.146752, 1.224264, 0, 0, 0, 1, 1,
2.375074, -0.1264226, 2.090415, 1, 1, 1, 1, 1,
2.423299, -0.4872096, 0.2763194, 1, 1, 1, 1, 1,
2.424189, -0.3165107, 2.392063, 1, 1, 1, 1, 1,
2.490929, -0.4041594, -0.1601416, 1, 1, 1, 1, 1,
2.640647, -0.1715781, 2.57386, 1, 1, 1, 1, 1,
2.671395, 0.9766922, 1.576478, 1, 1, 1, 1, 1,
2.890383, -0.5414326, 3.68011, 1, 1, 1, 1, 1
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
var radius = 9.375341;
var distance = 32.93048;
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
mvMatrix.translate( 0.1431484, -0.1615043, -0.05692458 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.93048);
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
