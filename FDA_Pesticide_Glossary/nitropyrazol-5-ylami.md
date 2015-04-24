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
-2.912967, 2.50709, -0.6384381, 1, 0, 0, 1,
-2.816197, -0.542363, -0.02334647, 1, 0.007843138, 0, 1,
-2.812803, -1.228882, -1.323179, 1, 0.01176471, 0, 1,
-2.769259, 0.3507927, -0.5982383, 1, 0.01960784, 0, 1,
-2.661111, 1.495654, 0.1931109, 1, 0.02352941, 0, 1,
-2.577514, 0.8046864, -2.954374, 1, 0.03137255, 0, 1,
-2.331797, 0.5676663, -1.666425, 1, 0.03529412, 0, 1,
-2.278713, -0.2166113, -1.818141, 1, 0.04313726, 0, 1,
-2.256997, 0.0874415, -0.3425865, 1, 0.04705882, 0, 1,
-2.256532, -0.8333992, -3.748058, 1, 0.05490196, 0, 1,
-2.234837, 0.9013768, -1.348829, 1, 0.05882353, 0, 1,
-2.179298, 0.1516861, -1.511334, 1, 0.06666667, 0, 1,
-2.013892, -0.0003640273, -2.13374, 1, 0.07058824, 0, 1,
-2.010212, 0.330651, -1.440165, 1, 0.07843138, 0, 1,
-2.002535, -0.7378119, -0.2729834, 1, 0.08235294, 0, 1,
-1.989969, 0.2683075, -1.036168, 1, 0.09019608, 0, 1,
-1.979208, 0.2267238, -0.6718196, 1, 0.09411765, 0, 1,
-1.95146, 0.7409681, -1.362548, 1, 0.1019608, 0, 1,
-1.935576, 0.1389009, -2.814652, 1, 0.1098039, 0, 1,
-1.91946, 0.2135531, 0.09632605, 1, 0.1137255, 0, 1,
-1.913189, 1.032124, -0.8782976, 1, 0.1215686, 0, 1,
-1.894136, -0.1478441, -1.63593, 1, 0.1254902, 0, 1,
-1.837136, 2.401294, -1.946579, 1, 0.1333333, 0, 1,
-1.830741, 0.5358547, -3.002564, 1, 0.1372549, 0, 1,
-1.818842, 1.052266, -1.296624, 1, 0.145098, 0, 1,
-1.813958, 0.08511894, -0.4117602, 1, 0.1490196, 0, 1,
-1.798662, -0.7603036, -2.679219, 1, 0.1568628, 0, 1,
-1.780584, -0.9170085, -0.7021341, 1, 0.1607843, 0, 1,
-1.773016, -0.505605, -2.033196, 1, 0.1686275, 0, 1,
-1.767833, -1.090065, -1.555863, 1, 0.172549, 0, 1,
-1.766719, 0.8612261, -2.645888, 1, 0.1803922, 0, 1,
-1.766108, 1.400846, -1.794616, 1, 0.1843137, 0, 1,
-1.757011, 0.8121045, -2.848183, 1, 0.1921569, 0, 1,
-1.75387, -0.5261097, -0.4386601, 1, 0.1960784, 0, 1,
-1.749623, 0.5938204, -1.695402, 1, 0.2039216, 0, 1,
-1.749568, 0.4379605, -1.027446, 1, 0.2117647, 0, 1,
-1.731879, 0.6716309, -0.2420037, 1, 0.2156863, 0, 1,
-1.731577, 0.5320035, -1.811986, 1, 0.2235294, 0, 1,
-1.720375, 0.4945837, -1.055192, 1, 0.227451, 0, 1,
-1.719381, -0.7062816, -0.4414633, 1, 0.2352941, 0, 1,
-1.702024, 0.7286835, -1.271695, 1, 0.2392157, 0, 1,
-1.693153, 1.122263, -0.9957949, 1, 0.2470588, 0, 1,
-1.690709, -1.499386, -1.176318, 1, 0.2509804, 0, 1,
-1.673424, -0.9435738, -3.666445, 1, 0.2588235, 0, 1,
-1.663568, 0.9189376, -0.8532032, 1, 0.2627451, 0, 1,
-1.658844, -0.3251576, -1.308577, 1, 0.2705882, 0, 1,
-1.644012, 1.355083, 0.4296182, 1, 0.2745098, 0, 1,
-1.616731, -1.631279, -2.518103, 1, 0.282353, 0, 1,
-1.614764, -0.8745709, 0.139503, 1, 0.2862745, 0, 1,
-1.602678, -1.274951, -4.05044, 1, 0.2941177, 0, 1,
-1.601969, 1.050625, -0.8036256, 1, 0.3019608, 0, 1,
-1.601677, -0.6747889, -1.39601, 1, 0.3058824, 0, 1,
-1.58133, 0.6867363, 0.04707247, 1, 0.3137255, 0, 1,
-1.577512, 0.6646399, -0.9715216, 1, 0.3176471, 0, 1,
-1.558058, -1.517215, -0.1035784, 1, 0.3254902, 0, 1,
-1.553384, -0.4140061, -0.8346292, 1, 0.3294118, 0, 1,
-1.54984, -0.7472608, -2.909949, 1, 0.3372549, 0, 1,
-1.549824, 0.6579851, -0.3484709, 1, 0.3411765, 0, 1,
-1.544268, -0.4360171, -1.541327, 1, 0.3490196, 0, 1,
-1.519495, -0.3736348, -1.319606, 1, 0.3529412, 0, 1,
-1.516121, 1.547492, -1.543269, 1, 0.3607843, 0, 1,
-1.509843, -0.3913341, -2.342897, 1, 0.3647059, 0, 1,
-1.500829, 0.6268334, -1.618698, 1, 0.372549, 0, 1,
-1.494655, 0.9001719, -1.178244, 1, 0.3764706, 0, 1,
-1.485464, 0.04844252, 0.2849416, 1, 0.3843137, 0, 1,
-1.480963, 0.737346, 0.67827, 1, 0.3882353, 0, 1,
-1.47673, 0.5921785, -2.6545, 1, 0.3960784, 0, 1,
-1.461009, -0.7173311, -2.548285, 1, 0.4039216, 0, 1,
-1.456688, -1.840716, -3.280046, 1, 0.4078431, 0, 1,
-1.449991, -0.3399303, -1.830448, 1, 0.4156863, 0, 1,
-1.4333, 0.338791, -0.6190375, 1, 0.4196078, 0, 1,
-1.432999, 0.1041218, -0.7402878, 1, 0.427451, 0, 1,
-1.425977, -1.093301, -2.875293, 1, 0.4313726, 0, 1,
-1.401433, 0.02054307, -2.359366, 1, 0.4392157, 0, 1,
-1.400638, -0.7646511, -1.524715, 1, 0.4431373, 0, 1,
-1.391859, -0.4540314, -0.555916, 1, 0.4509804, 0, 1,
-1.386691, 1.152786, -2.676223, 1, 0.454902, 0, 1,
-1.373526, 0.01899632, -1.950554, 1, 0.4627451, 0, 1,
-1.365263, 0.4807897, -0.4234666, 1, 0.4666667, 0, 1,
-1.352962, -0.7343561, -1.433111, 1, 0.4745098, 0, 1,
-1.348135, -0.5900571, -2.605826, 1, 0.4784314, 0, 1,
-1.344929, -0.1183646, 0.8245819, 1, 0.4862745, 0, 1,
-1.341233, 0.7302742, -1.006981, 1, 0.4901961, 0, 1,
-1.3399, -0.08285395, -0.5678112, 1, 0.4980392, 0, 1,
-1.339605, -0.1129583, -2.489361, 1, 0.5058824, 0, 1,
-1.335183, 0.4699429, -1.63018, 1, 0.509804, 0, 1,
-1.328834, 1.191404, -0.1395254, 1, 0.5176471, 0, 1,
-1.320405, -0.5634786, -4.607233, 1, 0.5215687, 0, 1,
-1.3147, 0.7579684, -0.9980623, 1, 0.5294118, 0, 1,
-1.310794, -0.1636249, -0.822254, 1, 0.5333334, 0, 1,
-1.304803, -1.277745, -3.471223, 1, 0.5411765, 0, 1,
-1.297327, -1.45797, -1.933589, 1, 0.5450981, 0, 1,
-1.29575, 0.6599313, -1.418311, 1, 0.5529412, 0, 1,
-1.291059, 0.3506591, -1.472366, 1, 0.5568628, 0, 1,
-1.290204, 0.6451941, -0.9084431, 1, 0.5647059, 0, 1,
-1.28881, -0.007004024, -1.198321, 1, 0.5686275, 0, 1,
-1.281633, -1.755657, -3.441524, 1, 0.5764706, 0, 1,
-1.281478, -0.2518749, -2.001924, 1, 0.5803922, 0, 1,
-1.278521, 0.2598923, -1.504469, 1, 0.5882353, 0, 1,
-1.278108, 0.2409217, -0.3145595, 1, 0.5921569, 0, 1,
-1.272126, -0.5526595, -2.464515, 1, 0.6, 0, 1,
-1.25151, 0.7522032, -1.194809, 1, 0.6078432, 0, 1,
-1.250522, 1.027865, -0.8595986, 1, 0.6117647, 0, 1,
-1.246479, -0.2122259, -1.921767, 1, 0.6196079, 0, 1,
-1.236706, 0.5149669, 0.8485377, 1, 0.6235294, 0, 1,
-1.226632, -0.9666908, -1.786652, 1, 0.6313726, 0, 1,
-1.220908, -0.7089852, -3.075137, 1, 0.6352941, 0, 1,
-1.214115, -0.9606914, -1.983646, 1, 0.6431373, 0, 1,
-1.21297, -0.7954311, -1.240699, 1, 0.6470588, 0, 1,
-1.212122, 0.7658936, -1.095731, 1, 0.654902, 0, 1,
-1.210823, -0.314708, -0.9895574, 1, 0.6588235, 0, 1,
-1.209125, 0.08016636, -1.105322, 1, 0.6666667, 0, 1,
-1.203093, 0.4188498, -2.531144, 1, 0.6705883, 0, 1,
-1.200194, -0.7280226, -1.401701, 1, 0.6784314, 0, 1,
-1.19508, 1.859939, -0.4117329, 1, 0.682353, 0, 1,
-1.19235, -0.04113974, -1.322942, 1, 0.6901961, 0, 1,
-1.182159, -1.758884, -2.203071, 1, 0.6941177, 0, 1,
-1.176714, 1.124429, 0.5175041, 1, 0.7019608, 0, 1,
-1.175504, 1.262124, -2.529423, 1, 0.7098039, 0, 1,
-1.170467, 0.02791556, -1.85318, 1, 0.7137255, 0, 1,
-1.169314, -1.158328, -1.296297, 1, 0.7215686, 0, 1,
-1.161369, 1.703281, -1.784687, 1, 0.7254902, 0, 1,
-1.156265, -0.7502608, -3.347023, 1, 0.7333333, 0, 1,
-1.151184, 0.5277994, -1.872822, 1, 0.7372549, 0, 1,
-1.144209, -0.1378494, -1.230035, 1, 0.7450981, 0, 1,
-1.133647, -0.9216355, -3.706311, 1, 0.7490196, 0, 1,
-1.129696, 0.01616314, -1.425363, 1, 0.7568628, 0, 1,
-1.128267, 0.1471199, -1.508616, 1, 0.7607843, 0, 1,
-1.123289, 0.5252921, -0.880138, 1, 0.7686275, 0, 1,
-1.116447, 0.747846, -0.7450595, 1, 0.772549, 0, 1,
-1.116021, 0.06015589, 0.2262237, 1, 0.7803922, 0, 1,
-1.111282, 0.08012953, -2.104594, 1, 0.7843137, 0, 1,
-1.110527, 0.1879017, -2.007376, 1, 0.7921569, 0, 1,
-1.099923, 0.2061788, -1.500464, 1, 0.7960784, 0, 1,
-1.095958, 0.7587313, -0.6670848, 1, 0.8039216, 0, 1,
-1.095727, 1.053199, -0.2182573, 1, 0.8117647, 0, 1,
-1.095014, -0.06996915, -3.047206, 1, 0.8156863, 0, 1,
-1.090366, -1.299467, -1.108489, 1, 0.8235294, 0, 1,
-1.089315, -0.9655135, -2.857652, 1, 0.827451, 0, 1,
-1.088767, 0.08048954, -2.289973, 1, 0.8352941, 0, 1,
-1.088602, -0.1068577, -0.3612981, 1, 0.8392157, 0, 1,
-1.087231, 2.014939, -1.12064, 1, 0.8470588, 0, 1,
-1.075654, -0.1260916, -3.64939, 1, 0.8509804, 0, 1,
-1.070339, -1.057227, -0.9997371, 1, 0.8588235, 0, 1,
-1.068974, -0.1655729, -2.729545, 1, 0.8627451, 0, 1,
-1.064838, 0.7509653, -0.768378, 1, 0.8705882, 0, 1,
-1.060889, -0.7085474, -3.830597, 1, 0.8745098, 0, 1,
-1.059881, -0.7011895, -1.647009, 1, 0.8823529, 0, 1,
-1.058014, 2.002876, -0.1280692, 1, 0.8862745, 0, 1,
-1.056841, -0.2275093, -2.160662, 1, 0.8941177, 0, 1,
-1.05556, 0.102102, -2.853734, 1, 0.8980392, 0, 1,
-1.029306, 0.8300892, -1.607294, 1, 0.9058824, 0, 1,
-1.028243, 0.6816015, -1.225618, 1, 0.9137255, 0, 1,
-1.027547, 1.502462, -0.2373143, 1, 0.9176471, 0, 1,
-1.018689, 0.6863941, -0.4666594, 1, 0.9254902, 0, 1,
-1.007999, -0.6254677, -1.874663, 1, 0.9294118, 0, 1,
-1.007902, 0.4545743, -1.71852, 1, 0.9372549, 0, 1,
-1.005711, -0.2837939, -1.246701, 1, 0.9411765, 0, 1,
-0.9977887, -0.312584, -1.537669, 1, 0.9490196, 0, 1,
-0.9968178, 0.3542322, -0.4480107, 1, 0.9529412, 0, 1,
-0.9954929, 0.5114605, -0.9635839, 1, 0.9607843, 0, 1,
-0.9895643, -0.4260871, -0.3725864, 1, 0.9647059, 0, 1,
-0.9839851, -0.3252214, -1.854004, 1, 0.972549, 0, 1,
-0.9746594, 0.1843244, -2.537927, 1, 0.9764706, 0, 1,
-0.9661229, -1.081678, -3.232674, 1, 0.9843137, 0, 1,
-0.9649105, -1.457467, -1.312724, 1, 0.9882353, 0, 1,
-0.959274, -0.309595, -4.257694, 1, 0.9960784, 0, 1,
-0.9451101, 1.038943, -0.2152807, 0.9960784, 1, 0, 1,
-0.9342589, 0.1300314, -1.858171, 0.9921569, 1, 0, 1,
-0.9318026, -0.1534141, -2.491804, 0.9843137, 1, 0, 1,
-0.9305242, -0.185534, -1.353655, 0.9803922, 1, 0, 1,
-0.9294169, 1.189402, -2.075386, 0.972549, 1, 0, 1,
-0.9285907, -1.766395, -2.421801, 0.9686275, 1, 0, 1,
-0.9273356, -1.231535, -3.202642, 0.9607843, 1, 0, 1,
-0.9260584, 0.5073229, -1.834599, 0.9568627, 1, 0, 1,
-0.9225318, 0.6584469, -0.7886802, 0.9490196, 1, 0, 1,
-0.9209614, 2.282823, -1.79671, 0.945098, 1, 0, 1,
-0.9136871, 0.07078023, -0.6988534, 0.9372549, 1, 0, 1,
-0.9125965, -1.416381, -1.438507, 0.9333333, 1, 0, 1,
-0.9030032, 0.9857394, -1.143943, 0.9254902, 1, 0, 1,
-0.8986205, -0.05311925, -1.840286, 0.9215686, 1, 0, 1,
-0.8971825, -0.2991247, -1.400398, 0.9137255, 1, 0, 1,
-0.8925987, 0.5216721, -1.453002, 0.9098039, 1, 0, 1,
-0.8890134, -0.1884607, -1.14522, 0.9019608, 1, 0, 1,
-0.8818421, -1.505025, -3.117509, 0.8941177, 1, 0, 1,
-0.8802748, 0.2935686, -0.7542982, 0.8901961, 1, 0, 1,
-0.8660413, 0.6632803, -0.7582672, 0.8823529, 1, 0, 1,
-0.8649166, -0.9070135, -2.684324, 0.8784314, 1, 0, 1,
-0.8636304, -0.2068298, -2.099024, 0.8705882, 1, 0, 1,
-0.8598118, -0.6107382, -3.125562, 0.8666667, 1, 0, 1,
-0.8594746, 0.4683526, -1.715008, 0.8588235, 1, 0, 1,
-0.8591197, 0.6336235, -1.769709, 0.854902, 1, 0, 1,
-0.8513943, -1.460668, -2.230843, 0.8470588, 1, 0, 1,
-0.8506801, -1.288601, -1.809331, 0.8431373, 1, 0, 1,
-0.8416367, 0.1246973, -1.515009, 0.8352941, 1, 0, 1,
-0.8399059, -0.676848, -0.8177848, 0.8313726, 1, 0, 1,
-0.8390762, -0.9482053, -2.317395, 0.8235294, 1, 0, 1,
-0.8356424, 0.5328344, 0.42149, 0.8196079, 1, 0, 1,
-0.8345391, -0.2888382, -1.488797, 0.8117647, 1, 0, 1,
-0.830861, 0.20072, -1.674184, 0.8078431, 1, 0, 1,
-0.8243284, -0.788669, -3.262761, 0.8, 1, 0, 1,
-0.8237318, 1.244671, 1.156734, 0.7921569, 1, 0, 1,
-0.8212247, 0.4820075, 0.6773199, 0.7882353, 1, 0, 1,
-0.8185084, -0.4089866, -1.605518, 0.7803922, 1, 0, 1,
-0.814549, -0.6522281, -0.5394861, 0.7764706, 1, 0, 1,
-0.8132123, 1.031385, -0.48356, 0.7686275, 1, 0, 1,
-0.8100268, 0.1495504, -1.801839, 0.7647059, 1, 0, 1,
-0.8079197, -0.61177, -2.330083, 0.7568628, 1, 0, 1,
-0.7958912, 0.4281387, -1.971317, 0.7529412, 1, 0, 1,
-0.7956042, -1.78424, -3.957017, 0.7450981, 1, 0, 1,
-0.7934787, -0.9141214, -1.942645, 0.7411765, 1, 0, 1,
-0.7873086, -1.242287, -3.559104, 0.7333333, 1, 0, 1,
-0.7861168, -0.3118344, -0.9210128, 0.7294118, 1, 0, 1,
-0.7835099, -1.574975, -3.36931, 0.7215686, 1, 0, 1,
-0.7799049, 0.6677632, -1.140993, 0.7176471, 1, 0, 1,
-0.7793313, -1.179089, -2.416303, 0.7098039, 1, 0, 1,
-0.7785957, -1.018914, -2.212002, 0.7058824, 1, 0, 1,
-0.7761503, -0.586251, -2.336811, 0.6980392, 1, 0, 1,
-0.771336, 0.5196387, -2.880748, 0.6901961, 1, 0, 1,
-0.770749, 0.9929854, 0.6836394, 0.6862745, 1, 0, 1,
-0.7674437, 0.6925997, -0.7890139, 0.6784314, 1, 0, 1,
-0.7667341, 1.3356, 0.9908779, 0.6745098, 1, 0, 1,
-0.7594154, 0.7815483, -2.2115, 0.6666667, 1, 0, 1,
-0.7575225, 0.342684, 0.1150415, 0.6627451, 1, 0, 1,
-0.7504401, -0.9288707, -1.420528, 0.654902, 1, 0, 1,
-0.7484478, 0.3592225, 0.165825, 0.6509804, 1, 0, 1,
-0.7457363, -2.070029, -2.737578, 0.6431373, 1, 0, 1,
-0.7456806, 0.4850901, -1.550167, 0.6392157, 1, 0, 1,
-0.7453038, 0.9175371, -1.439924, 0.6313726, 1, 0, 1,
-0.7443182, -1.02018, -1.711295, 0.627451, 1, 0, 1,
-0.7442013, -1.223596, -2.650454, 0.6196079, 1, 0, 1,
-0.7417808, 0.0662232, -0.8745993, 0.6156863, 1, 0, 1,
-0.7402323, 2.283247, -0.5853217, 0.6078432, 1, 0, 1,
-0.7313564, -0.3295443, -3.111544, 0.6039216, 1, 0, 1,
-0.7298188, 0.2890157, -2.743864, 0.5960785, 1, 0, 1,
-0.7231901, -0.4340221, -1.368586, 0.5882353, 1, 0, 1,
-0.7213508, 0.6055448, -0.5856797, 0.5843138, 1, 0, 1,
-0.7179178, -1.383644, -2.4967, 0.5764706, 1, 0, 1,
-0.7167242, 0.7742413, -1.08801, 0.572549, 1, 0, 1,
-0.715699, 1.210404, 0.6299661, 0.5647059, 1, 0, 1,
-0.7146778, 1.014823, -1.437973, 0.5607843, 1, 0, 1,
-0.7141435, 0.6462787, -0.5277959, 0.5529412, 1, 0, 1,
-0.7100588, 0.4642578, -2.103118, 0.5490196, 1, 0, 1,
-0.7071375, 1.565883, -1.307683, 0.5411765, 1, 0, 1,
-0.7070513, 0.4696375, -1.03297, 0.5372549, 1, 0, 1,
-0.704736, -0.6165509, -2.034025, 0.5294118, 1, 0, 1,
-0.703154, 0.3928672, -0.6838573, 0.5254902, 1, 0, 1,
-0.701964, -1.054698, -0.9927411, 0.5176471, 1, 0, 1,
-0.7018024, 0.6592996, -0.469072, 0.5137255, 1, 0, 1,
-0.6985192, 0.0681854, -4.513065, 0.5058824, 1, 0, 1,
-0.6954943, 1.030619, -0.2533191, 0.5019608, 1, 0, 1,
-0.6951525, 0.2298498, 0.5813382, 0.4941176, 1, 0, 1,
-0.693391, 0.7676728, -2.069243, 0.4862745, 1, 0, 1,
-0.6931225, -0.5717771, -1.622722, 0.4823529, 1, 0, 1,
-0.6856511, -0.6333933, -0.8588969, 0.4745098, 1, 0, 1,
-0.6815102, 0.6139968, 0.9103233, 0.4705882, 1, 0, 1,
-0.6800351, -1.222614, -3.083881, 0.4627451, 1, 0, 1,
-0.677951, 0.9745325, -2.016255, 0.4588235, 1, 0, 1,
-0.6773701, -0.5529933, -2.665418, 0.4509804, 1, 0, 1,
-0.675917, -1.23994, -3.597161, 0.4470588, 1, 0, 1,
-0.6708725, -0.7186053, -1.978929, 0.4392157, 1, 0, 1,
-0.670058, 0.02619887, -1.927999, 0.4352941, 1, 0, 1,
-0.6592373, -1.121301, -1.708398, 0.427451, 1, 0, 1,
-0.6533656, 0.379807, 1.014701, 0.4235294, 1, 0, 1,
-0.6515087, -1.232004, -1.919894, 0.4156863, 1, 0, 1,
-0.6513526, -1.040675, -2.293638, 0.4117647, 1, 0, 1,
-0.6505507, 0.3228567, -0.3925105, 0.4039216, 1, 0, 1,
-0.6453311, -1.447246, -3.591914, 0.3960784, 1, 0, 1,
-0.6426665, -1.297464, -3.204222, 0.3921569, 1, 0, 1,
-0.6377346, 0.06395093, -2.175497, 0.3843137, 1, 0, 1,
-0.6361954, 1.478562, -0.8091649, 0.3803922, 1, 0, 1,
-0.6359771, 1.355829, -1.114256, 0.372549, 1, 0, 1,
-0.6345328, -0.5415156, -2.65402, 0.3686275, 1, 0, 1,
-0.6277967, 0.4596733, -0.5571215, 0.3607843, 1, 0, 1,
-0.6250742, 0.4458398, -1.354511, 0.3568628, 1, 0, 1,
-0.6250116, 1.650912, -1.53864, 0.3490196, 1, 0, 1,
-0.6247299, 0.1853254, -0.5703266, 0.345098, 1, 0, 1,
-0.6244776, 0.9331282, -1.767782, 0.3372549, 1, 0, 1,
-0.6232015, -0.07927035, -3.701364, 0.3333333, 1, 0, 1,
-0.6213832, 0.1453964, -2.496132, 0.3254902, 1, 0, 1,
-0.6138576, 1.221319, -0.3714703, 0.3215686, 1, 0, 1,
-0.612577, 1.042162, 0.1119873, 0.3137255, 1, 0, 1,
-0.6069816, 0.4124276, 0.2973289, 0.3098039, 1, 0, 1,
-0.6061597, -0.3099385, -1.341203, 0.3019608, 1, 0, 1,
-0.6023058, 1.280084, -1.710171, 0.2941177, 1, 0, 1,
-0.5944795, 0.02894525, -0.080805, 0.2901961, 1, 0, 1,
-0.5911726, 1.586012, -1.061619, 0.282353, 1, 0, 1,
-0.589255, 0.6439387, -1.428618, 0.2784314, 1, 0, 1,
-0.5887732, 0.1336177, -1.048756, 0.2705882, 1, 0, 1,
-0.5854838, -0.006576137, -2.042974, 0.2666667, 1, 0, 1,
-0.5806534, 1.150989, 0.8342909, 0.2588235, 1, 0, 1,
-0.5805604, -1.013438, -1.87603, 0.254902, 1, 0, 1,
-0.5751917, -0.5574005, -0.658444, 0.2470588, 1, 0, 1,
-0.57388, -1.27973, -1.869023, 0.2431373, 1, 0, 1,
-0.5717201, 1.834043, -0.2157105, 0.2352941, 1, 0, 1,
-0.5613574, -2.151382, -0.7522, 0.2313726, 1, 0, 1,
-0.560728, 0.06029524, -1.14295, 0.2235294, 1, 0, 1,
-0.5599231, 0.4588819, -0.2337049, 0.2196078, 1, 0, 1,
-0.5571235, -0.4350452, -2.767699, 0.2117647, 1, 0, 1,
-0.5568082, -0.5975385, -4.560637, 0.2078431, 1, 0, 1,
-0.5542085, 1.504839, -0.9754264, 0.2, 1, 0, 1,
-0.5535928, 0.3815338, -0.9993203, 0.1921569, 1, 0, 1,
-0.5525653, -0.3471231, -1.069953, 0.1882353, 1, 0, 1,
-0.5507742, -0.2165053, -2.176733, 0.1803922, 1, 0, 1,
-0.5497901, -0.1346587, -1.629055, 0.1764706, 1, 0, 1,
-0.549286, -0.6939453, -2.214145, 0.1686275, 1, 0, 1,
-0.5484812, 1.279487, 0.2949079, 0.1647059, 1, 0, 1,
-0.5482842, 0.4791381, 0.1944996, 0.1568628, 1, 0, 1,
-0.54695, 0.6234375, -0.9680251, 0.1529412, 1, 0, 1,
-0.5446247, -1.414213, -1.832742, 0.145098, 1, 0, 1,
-0.5436206, 0.5761406, -2.05383, 0.1411765, 1, 0, 1,
-0.540346, 1.25501, -1.004263, 0.1333333, 1, 0, 1,
-0.539707, 0.7733545, -0.3086052, 0.1294118, 1, 0, 1,
-0.5393174, 0.01186849, -0.360805, 0.1215686, 1, 0, 1,
-0.5344365, 0.630863, -1.321872, 0.1176471, 1, 0, 1,
-0.5333329, 1.242039, -0.6081323, 0.1098039, 1, 0, 1,
-0.5284183, -0.2446866, -1.91925, 0.1058824, 1, 0, 1,
-0.5280917, -0.5461054, -1.974918, 0.09803922, 1, 0, 1,
-0.525847, -1.621521, -4.010029, 0.09019608, 1, 0, 1,
-0.5249934, 0.0867593, -1.713308, 0.08627451, 1, 0, 1,
-0.524426, -2.449441, -2.859949, 0.07843138, 1, 0, 1,
-0.5226638, 0.5980613, -2.399859, 0.07450981, 1, 0, 1,
-0.5115188, -1.725117, -2.842767, 0.06666667, 1, 0, 1,
-0.5086329, -0.09854197, -3.582967, 0.0627451, 1, 0, 1,
-0.5054052, -0.5822401, -2.390418, 0.05490196, 1, 0, 1,
-0.5044217, -0.1368767, -2.299628, 0.05098039, 1, 0, 1,
-0.4925271, -1.721507, -0.8160019, 0.04313726, 1, 0, 1,
-0.4887761, 1.50769, 0.1160406, 0.03921569, 1, 0, 1,
-0.483349, -0.1776412, -1.251687, 0.03137255, 1, 0, 1,
-0.4813896, -0.07733806, -1.785229, 0.02745098, 1, 0, 1,
-0.4803888, 0.0585169, -1.19624, 0.01960784, 1, 0, 1,
-0.4791819, -0.9269796, -2.414583, 0.01568628, 1, 0, 1,
-0.4791748, 0.4514112, -1.207496, 0.007843138, 1, 0, 1,
-0.4761367, 1.268797, -1.188367, 0.003921569, 1, 0, 1,
-0.475086, -0.5195023, -4.150952, 0, 1, 0.003921569, 1,
-0.4736955, 0.08204187, -2.066942, 0, 1, 0.01176471, 1,
-0.4700528, 1.400056, 0.3389055, 0, 1, 0.01568628, 1,
-0.4651123, 0.8591012, -0.03322325, 0, 1, 0.02352941, 1,
-0.4629845, -0.8852163, -3.099934, 0, 1, 0.02745098, 1,
-0.4519719, -0.06356423, -1.366469, 0, 1, 0.03529412, 1,
-0.4504507, -1.947957, -2.819003, 0, 1, 0.03921569, 1,
-0.4482126, -0.06059586, -0.02724417, 0, 1, 0.04705882, 1,
-0.4445012, -1.122592, -4.32397, 0, 1, 0.05098039, 1,
-0.4433501, 0.004154536, -2.535467, 0, 1, 0.05882353, 1,
-0.4405821, 2.244054, 0.9603618, 0, 1, 0.0627451, 1,
-0.439879, 0.2066579, -3.016428, 0, 1, 0.07058824, 1,
-0.4367099, 0.6121982, 0.3230504, 0, 1, 0.07450981, 1,
-0.4328531, -0.9490832, -2.60083, 0, 1, 0.08235294, 1,
-0.4290657, 1.598115, -1.043068, 0, 1, 0.08627451, 1,
-0.4271125, 0.4019618, -1.766282, 0, 1, 0.09411765, 1,
-0.4247457, 0.501698, -1.39119, 0, 1, 0.1019608, 1,
-0.4236915, -0.6970653, -1.889861, 0, 1, 0.1058824, 1,
-0.4199791, -0.402196, -1.647001, 0, 1, 0.1137255, 1,
-0.4193277, -0.4689091, -2.380997, 0, 1, 0.1176471, 1,
-0.4150906, 0.6833647, -1.483896, 0, 1, 0.1254902, 1,
-0.4100423, -0.3077019, -3.119848, 0, 1, 0.1294118, 1,
-0.4095839, -0.3483672, -2.880693, 0, 1, 0.1372549, 1,
-0.4088796, 0.8226783, -1.375573, 0, 1, 0.1411765, 1,
-0.4066925, -0.7122159, -1.714904, 0, 1, 0.1490196, 1,
-0.4022867, -0.4398573, -5.004535, 0, 1, 0.1529412, 1,
-0.4008635, -0.2203664, 0.7715481, 0, 1, 0.1607843, 1,
-0.397131, 2.008387, -0.4556005, 0, 1, 0.1647059, 1,
-0.3966629, -0.6669186, -2.267668, 0, 1, 0.172549, 1,
-0.3942942, 1.608323, 1.33706, 0, 1, 0.1764706, 1,
-0.3936018, -0.05048357, -2.987931, 0, 1, 0.1843137, 1,
-0.3908172, -0.8853573, -1.679505, 0, 1, 0.1882353, 1,
-0.3889912, -0.3258791, -3.055091, 0, 1, 0.1960784, 1,
-0.3860265, -0.4620242, -1.128966, 0, 1, 0.2039216, 1,
-0.38597, 0.07609254, -0.5841011, 0, 1, 0.2078431, 1,
-0.3844602, -0.9062595, -2.630033, 0, 1, 0.2156863, 1,
-0.3826495, -0.5182526, -3.587997, 0, 1, 0.2196078, 1,
-0.3782936, -0.06923543, -0.1999338, 0, 1, 0.227451, 1,
-0.3773265, 1.167445, -0.9093795, 0, 1, 0.2313726, 1,
-0.3756555, -1.489347, -3.117416, 0, 1, 0.2392157, 1,
-0.3742868, -1.058689, -3.031086, 0, 1, 0.2431373, 1,
-0.373161, -1.349311, -3.837461, 0, 1, 0.2509804, 1,
-0.3706765, -0.06532076, -1.474058, 0, 1, 0.254902, 1,
-0.3623473, 1.001303, -0.2361218, 0, 1, 0.2627451, 1,
-0.3617761, -1.061292, -2.660029, 0, 1, 0.2666667, 1,
-0.3615506, 1.649158, 0.5648963, 0, 1, 0.2745098, 1,
-0.3590581, 0.5118025, -0.6376532, 0, 1, 0.2784314, 1,
-0.3573798, 0.9729369, -1.054688, 0, 1, 0.2862745, 1,
-0.3548161, 0.9399397, -1.636654, 0, 1, 0.2901961, 1,
-0.3542487, 1.670394, 1.153522, 0, 1, 0.2980392, 1,
-0.3517528, 0.01286711, -2.448661, 0, 1, 0.3058824, 1,
-0.3499318, -1.001867, -3.309239, 0, 1, 0.3098039, 1,
-0.3497044, 0.1964965, -0.4785011, 0, 1, 0.3176471, 1,
-0.3434303, 0.4130737, 0.4451782, 0, 1, 0.3215686, 1,
-0.3406036, -0.03356776, -1.655204, 0, 1, 0.3294118, 1,
-0.3363163, 0.7103049, -1.943693, 0, 1, 0.3333333, 1,
-0.3348356, -1.098729, -3.53852, 0, 1, 0.3411765, 1,
-0.3341597, -0.8420837, -2.971946, 0, 1, 0.345098, 1,
-0.3338706, -1.40442, -2.961471, 0, 1, 0.3529412, 1,
-0.3313459, -0.8394063, -3.302824, 0, 1, 0.3568628, 1,
-0.3263756, 0.8049743, 1.050614, 0, 1, 0.3647059, 1,
-0.3250807, 0.3271796, -0.5105441, 0, 1, 0.3686275, 1,
-0.3168542, 0.9482679, 0.1301287, 0, 1, 0.3764706, 1,
-0.3108234, -1.088146, -2.277515, 0, 1, 0.3803922, 1,
-0.3098505, 0.7075592, -1.362113, 0, 1, 0.3882353, 1,
-0.307786, -0.657357, -1.877242, 0, 1, 0.3921569, 1,
-0.2989086, -0.1463915, -3.795522, 0, 1, 0.4, 1,
-0.2977763, -1.540883, -5.641552, 0, 1, 0.4078431, 1,
-0.2972856, -0.2816919, -3.383275, 0, 1, 0.4117647, 1,
-0.2935414, -0.01639794, -0.1115768, 0, 1, 0.4196078, 1,
-0.2927527, 1.642624, 0.3330459, 0, 1, 0.4235294, 1,
-0.2923532, 0.8760256, -1.315888, 0, 1, 0.4313726, 1,
-0.2884133, 0.4948927, -1.691929, 0, 1, 0.4352941, 1,
-0.2863996, 0.1380153, -1.725448, 0, 1, 0.4431373, 1,
-0.2819864, 1.067088, -0.2869769, 0, 1, 0.4470588, 1,
-0.2795894, 0.1102428, 0.8804949, 0, 1, 0.454902, 1,
-0.2790511, 0.2053929, -0.9199761, 0, 1, 0.4588235, 1,
-0.2763324, -1.010302, -2.041246, 0, 1, 0.4666667, 1,
-0.2735792, 0.3724917, -0.08281891, 0, 1, 0.4705882, 1,
-0.2730088, 0.9604104, -0.09093585, 0, 1, 0.4784314, 1,
-0.270695, -1.075539, -5.57923, 0, 1, 0.4823529, 1,
-0.2698629, 0.740057, 0.3938398, 0, 1, 0.4901961, 1,
-0.2688696, -0.3759112, -3.633908, 0, 1, 0.4941176, 1,
-0.2666107, 1.317353, 0.03713208, 0, 1, 0.5019608, 1,
-0.2646081, -0.6395651, -1.620567, 0, 1, 0.509804, 1,
-0.2620113, 0.2196023, -1.990479, 0, 1, 0.5137255, 1,
-0.2591564, 1.388234, -0.7734656, 0, 1, 0.5215687, 1,
-0.2578515, -0.9114094, -4.313869, 0, 1, 0.5254902, 1,
-0.2565732, -1.314001, -3.137721, 0, 1, 0.5333334, 1,
-0.2527096, -0.5452627, -2.291204, 0, 1, 0.5372549, 1,
-0.2457858, 1.659233, -0.782559, 0, 1, 0.5450981, 1,
-0.2417553, -0.4275521, -1.130173, 0, 1, 0.5490196, 1,
-0.2396233, -1.108732, -2.238464, 0, 1, 0.5568628, 1,
-0.235021, 0.3590264, -0.6377912, 0, 1, 0.5607843, 1,
-0.232287, 0.7704045, -0.6390696, 0, 1, 0.5686275, 1,
-0.2320573, -1.135781, -2.314562, 0, 1, 0.572549, 1,
-0.229593, -2.051534, -2.557505, 0, 1, 0.5803922, 1,
-0.2250775, -0.6494369, -4.538068, 0, 1, 0.5843138, 1,
-0.2226311, -0.1896779, -4.372454, 0, 1, 0.5921569, 1,
-0.2194257, 0.2399968, -0.7497582, 0, 1, 0.5960785, 1,
-0.2186447, -1.176062, -3.695703, 0, 1, 0.6039216, 1,
-0.214769, -1.551871, -4.645612, 0, 1, 0.6117647, 1,
-0.2130378, -0.1797107, -2.963698, 0, 1, 0.6156863, 1,
-0.2117182, 1.116591, 0.3315496, 0, 1, 0.6235294, 1,
-0.2057816, 0.9346402, -1.069085, 0, 1, 0.627451, 1,
-0.2042544, 0.3869106, -0.3773977, 0, 1, 0.6352941, 1,
-0.2019759, -0.8068622, -1.413957, 0, 1, 0.6392157, 1,
-0.18892, -0.2762715, -3.329324, 0, 1, 0.6470588, 1,
-0.1824377, 0.6400381, -1.045722, 0, 1, 0.6509804, 1,
-0.1814641, 1.475642, -2.263404, 0, 1, 0.6588235, 1,
-0.1810025, -0.3627385, -0.3391463, 0, 1, 0.6627451, 1,
-0.1774399, -0.02113237, -1.67882, 0, 1, 0.6705883, 1,
-0.1760973, -0.6575678, -3.614682, 0, 1, 0.6745098, 1,
-0.1760143, 2.109621, -1.524796, 0, 1, 0.682353, 1,
-0.1753567, 0.03174253, -2.27844, 0, 1, 0.6862745, 1,
-0.1741974, -2.190831, -2.819128, 0, 1, 0.6941177, 1,
-0.1707623, 1.777169, -0.5920407, 0, 1, 0.7019608, 1,
-0.1684159, 0.584174, 0.244978, 0, 1, 0.7058824, 1,
-0.1641125, 0.1024571, -0.8107077, 0, 1, 0.7137255, 1,
-0.163483, 0.2322526, -0.327549, 0, 1, 0.7176471, 1,
-0.1623432, 2.220381, -0.9830042, 0, 1, 0.7254902, 1,
-0.160237, -0.2559528, -1.46828, 0, 1, 0.7294118, 1,
-0.1596283, 1.213779, -1.079771, 0, 1, 0.7372549, 1,
-0.1581142, 1.48377, -0.3610495, 0, 1, 0.7411765, 1,
-0.1470636, 0.7566649, -1.15118, 0, 1, 0.7490196, 1,
-0.1466152, 0.7185445, -1.186161, 0, 1, 0.7529412, 1,
-0.144252, 0.5267126, -0.4034654, 0, 1, 0.7607843, 1,
-0.139191, 0.8674726, 0.5907724, 0, 1, 0.7647059, 1,
-0.1214624, -0.2269852, -2.917246, 0, 1, 0.772549, 1,
-0.1202863, 1.714316, 0.1882661, 0, 1, 0.7764706, 1,
-0.1201499, -0.0591027, -2.020555, 0, 1, 0.7843137, 1,
-0.1150865, -0.4316903, -1.50659, 0, 1, 0.7882353, 1,
-0.113826, 0.7280686, -0.6952001, 0, 1, 0.7960784, 1,
-0.1108417, -1.762436, -3.771449, 0, 1, 0.8039216, 1,
-0.1041888, 0.05835387, -2.33336, 0, 1, 0.8078431, 1,
-0.0956645, -1.205496, -3.200638, 0, 1, 0.8156863, 1,
-0.09144954, -1.182572, -4.280569, 0, 1, 0.8196079, 1,
-0.08905617, -0.02902592, -1.800981, 0, 1, 0.827451, 1,
-0.08773474, 0.09472965, -0.5811462, 0, 1, 0.8313726, 1,
-0.08306273, -1.266397, -3.348742, 0, 1, 0.8392157, 1,
-0.08086554, -0.6549829, -3.401065, 0, 1, 0.8431373, 1,
-0.08031109, 0.2996912, 1.035053, 0, 1, 0.8509804, 1,
-0.07978965, -2.206265, -2.666711, 0, 1, 0.854902, 1,
-0.07885697, -0.8553542, -4.342093, 0, 1, 0.8627451, 1,
-0.07420568, 0.2838899, -0.2190972, 0, 1, 0.8666667, 1,
-0.07305573, 1.35273, -0.9244694, 0, 1, 0.8745098, 1,
-0.06419664, 0.7086582, -0.4372363, 0, 1, 0.8784314, 1,
-0.06066058, -0.6455732, -4.086896, 0, 1, 0.8862745, 1,
-0.06037315, 0.2983071, 0.8333782, 0, 1, 0.8901961, 1,
-0.0591004, -0.6882908, -2.887104, 0, 1, 0.8980392, 1,
-0.05834485, 0.1913139, -0.1209152, 0, 1, 0.9058824, 1,
-0.05790753, 0.8437473, -0.4222747, 0, 1, 0.9098039, 1,
-0.05686738, -0.1034598, -2.765624, 0, 1, 0.9176471, 1,
-0.05598612, 1.873283, -0.07509542, 0, 1, 0.9215686, 1,
-0.05491462, 0.289359, -0.6341531, 0, 1, 0.9294118, 1,
-0.04463454, -0.4699577, -2.452774, 0, 1, 0.9333333, 1,
-0.04417058, -1.14195, -1.274283, 0, 1, 0.9411765, 1,
-0.04278516, -0.8297395, -3.755981, 0, 1, 0.945098, 1,
-0.03444044, -0.7643836, -3.174226, 0, 1, 0.9529412, 1,
-0.02953623, -0.05315425, -3.734246, 0, 1, 0.9568627, 1,
-0.02908721, 0.009451902, -0.24218, 0, 1, 0.9647059, 1,
-0.02751075, 1.357695, -0.4075215, 0, 1, 0.9686275, 1,
-0.02507896, -1.759803, -2.832623, 0, 1, 0.9764706, 1,
-0.02138791, 0.03619272, -0.1874901, 0, 1, 0.9803922, 1,
-0.01852361, 1.16951, -0.6261536, 0, 1, 0.9882353, 1,
-0.01081943, 1.586433, 0.7242031, 0, 1, 0.9921569, 1,
-0.01067191, 0.02600965, -1.8532, 0, 1, 1, 1,
-0.009201757, 0.1225653, 1.547259, 0, 0.9921569, 1, 1,
-0.004996392, -1.579908, -3.370284, 0, 0.9882353, 1, 1,
-0.0001551415, 0.7629361, -1.047343, 0, 0.9803922, 1, 1,
0.001299322, 0.09487984, 0.2429319, 0, 0.9764706, 1, 1,
0.01015673, -0.71791, 4.158761, 0, 0.9686275, 1, 1,
0.01162639, -1.674776, 3.263916, 0, 0.9647059, 1, 1,
0.01188055, 1.992312, 1.394999, 0, 0.9568627, 1, 1,
0.01363736, 0.7874414, 0.6039789, 0, 0.9529412, 1, 1,
0.01494488, -0.9656587, 3.503332, 0, 0.945098, 1, 1,
0.01784642, -1.582749, 4.319725, 0, 0.9411765, 1, 1,
0.01823844, -0.1118015, 3.234424, 0, 0.9333333, 1, 1,
0.02829639, -0.7998698, 1.030433, 0, 0.9294118, 1, 1,
0.02833598, -0.5480168, 3.125904, 0, 0.9215686, 1, 1,
0.0298935, -0.1774664, 2.376928, 0, 0.9176471, 1, 1,
0.03273491, 1.199956, -1.425542, 0, 0.9098039, 1, 1,
0.03555707, 1.871466, -0.06537244, 0, 0.9058824, 1, 1,
0.03803749, 1.672771, 0.690672, 0, 0.8980392, 1, 1,
0.04058735, -0.06321507, 2.192107, 0, 0.8901961, 1, 1,
0.04403063, 0.04784605, 1.876538, 0, 0.8862745, 1, 1,
0.04748776, -0.4273931, 1.813876, 0, 0.8784314, 1, 1,
0.0482394, 0.4422002, -0.5322908, 0, 0.8745098, 1, 1,
0.0486993, -0.7084942, 3.172037, 0, 0.8666667, 1, 1,
0.05199715, 0.1088011, 1.805294, 0, 0.8627451, 1, 1,
0.05710967, -1.5502, 1.791573, 0, 0.854902, 1, 1,
0.05843554, 0.2269592, 0.3906146, 0, 0.8509804, 1, 1,
0.05938823, -1.100754, 2.206892, 0, 0.8431373, 1, 1,
0.05991143, -0.06642111, 1.759013, 0, 0.8392157, 1, 1,
0.07157145, -0.5279438, 3.667969, 0, 0.8313726, 1, 1,
0.07295214, 0.7646305, -0.6851473, 0, 0.827451, 1, 1,
0.07362894, -0.6282116, 3.573022, 0, 0.8196079, 1, 1,
0.0745189, 0.2482094, 0.5636901, 0, 0.8156863, 1, 1,
0.07830986, -2.505257, 1.36933, 0, 0.8078431, 1, 1,
0.07908221, -0.6156369, 2.486256, 0, 0.8039216, 1, 1,
0.08209203, -0.7003065, 2.972864, 0, 0.7960784, 1, 1,
0.08885925, 2.101718, 0.7039624, 0, 0.7882353, 1, 1,
0.09179854, 0.100204, 1.3373, 0, 0.7843137, 1, 1,
0.09261876, 0.3381521, -1.553906, 0, 0.7764706, 1, 1,
0.09614462, 6.000616e-05, 3.322052, 0, 0.772549, 1, 1,
0.09698749, 0.4295575, 1.305092, 0, 0.7647059, 1, 1,
0.0995059, -0.7715588, 2.978934, 0, 0.7607843, 1, 1,
0.104541, -0.6336291, 2.823682, 0, 0.7529412, 1, 1,
0.1102482, 1.282148, 0.6230617, 0, 0.7490196, 1, 1,
0.1114906, -0.7644985, 2.447156, 0, 0.7411765, 1, 1,
0.1125472, 1.013918, 0.4203643, 0, 0.7372549, 1, 1,
0.113084, 0.8216316, 0.9337796, 0, 0.7294118, 1, 1,
0.1274485, -0.8038546, 2.740861, 0, 0.7254902, 1, 1,
0.1302166, 0.9041245, -0.5335547, 0, 0.7176471, 1, 1,
0.1318702, 0.7858793, 0.3432052, 0, 0.7137255, 1, 1,
0.1342426, -0.6517877, 2.22674, 0, 0.7058824, 1, 1,
0.140833, 1.76781, 0.6314602, 0, 0.6980392, 1, 1,
0.1421384, -1.126859, 1.118879, 0, 0.6941177, 1, 1,
0.1432576, 0.447328, -0.1787599, 0, 0.6862745, 1, 1,
0.1474338, 1.403265, 0.961364, 0, 0.682353, 1, 1,
0.1505557, -1.657206, 3.716332, 0, 0.6745098, 1, 1,
0.1523555, -0.5598581, 3.125, 0, 0.6705883, 1, 1,
0.15677, 0.4234286, 0.189087, 0, 0.6627451, 1, 1,
0.1577202, -0.1242653, 2.160686, 0, 0.6588235, 1, 1,
0.1595032, 0.2411443, 0.09306566, 0, 0.6509804, 1, 1,
0.1596965, 0.2793453, 0.2087919, 0, 0.6470588, 1, 1,
0.1626751, 0.02935701, 2.09735, 0, 0.6392157, 1, 1,
0.1626976, -0.5359104, 2.161607, 0, 0.6352941, 1, 1,
0.1676599, -1.923639, 3.043508, 0, 0.627451, 1, 1,
0.1716427, -1.328919, 2.87594, 0, 0.6235294, 1, 1,
0.1725162, 0.7414987, -0.06484166, 0, 0.6156863, 1, 1,
0.1803059, -0.3455627, 3.341966, 0, 0.6117647, 1, 1,
0.1813859, 1.649505, 0.8265632, 0, 0.6039216, 1, 1,
0.1849035, 0.5499223, -0.6628726, 0, 0.5960785, 1, 1,
0.1907088, 1.035991, -0.4989538, 0, 0.5921569, 1, 1,
0.1972931, -0.1025379, 0.9447502, 0, 0.5843138, 1, 1,
0.199029, -0.04417846, 2.423944, 0, 0.5803922, 1, 1,
0.1996649, 0.784143, 0.428131, 0, 0.572549, 1, 1,
0.2105853, -1.847216, 1.014876, 0, 0.5686275, 1, 1,
0.2107517, -1.921801, 3.092134, 0, 0.5607843, 1, 1,
0.2125677, 0.5925654, -0.8825719, 0, 0.5568628, 1, 1,
0.2126279, -0.5767875, 3.872277, 0, 0.5490196, 1, 1,
0.2127441, 0.7987185, 0.07916553, 0, 0.5450981, 1, 1,
0.2137056, -0.5623853, 3.767665, 0, 0.5372549, 1, 1,
0.214196, -0.6713067, 1.765159, 0, 0.5333334, 1, 1,
0.2186852, 0.3691167, 0.637366, 0, 0.5254902, 1, 1,
0.2187082, -0.2562647, 2.472769, 0, 0.5215687, 1, 1,
0.2200985, 1.460066, 0.4193175, 0, 0.5137255, 1, 1,
0.2208312, -1.148197, 1.330338, 0, 0.509804, 1, 1,
0.2214041, 1.598763, 0.4390704, 0, 0.5019608, 1, 1,
0.2245107, 2.094732, 0.2711604, 0, 0.4941176, 1, 1,
0.2291639, -1.500842, 1.685455, 0, 0.4901961, 1, 1,
0.2310091, 0.4140391, 1.321888, 0, 0.4823529, 1, 1,
0.2342736, 0.09105539, 1.526609, 0, 0.4784314, 1, 1,
0.2349332, 0.1860113, 1.441998, 0, 0.4705882, 1, 1,
0.2376165, -0.1053215, 1.237687, 0, 0.4666667, 1, 1,
0.2379771, -1.647366, 2.569323, 0, 0.4588235, 1, 1,
0.2381182, 0.1642141, -0.004663846, 0, 0.454902, 1, 1,
0.2400199, -0.5102664, 0.999549, 0, 0.4470588, 1, 1,
0.24849, 1.092633, -1.14026, 0, 0.4431373, 1, 1,
0.2490641, 0.8409193, 0.3743398, 0, 0.4352941, 1, 1,
0.2498131, 0.4693774, -0.4176136, 0, 0.4313726, 1, 1,
0.2535152, -1.268741, 2.342815, 0, 0.4235294, 1, 1,
0.2552137, 1.280691, -0.4376531, 0, 0.4196078, 1, 1,
0.2594391, -0.8255558, 1.85514, 0, 0.4117647, 1, 1,
0.2621406, 1.118167, 1.311953, 0, 0.4078431, 1, 1,
0.2742058, 0.8134546, -0.1573622, 0, 0.4, 1, 1,
0.2744147, 0.07174921, 1.773873, 0, 0.3921569, 1, 1,
0.2748747, 0.2294287, 1.830761, 0, 0.3882353, 1, 1,
0.2760662, 1.31717, 0.4657679, 0, 0.3803922, 1, 1,
0.2801189, -0.5829923, 3.130198, 0, 0.3764706, 1, 1,
0.2801792, 0.9006832, 0.7089961, 0, 0.3686275, 1, 1,
0.2820418, 1.108339, -0.5431982, 0, 0.3647059, 1, 1,
0.2881925, -0.9360425, 1.909032, 0, 0.3568628, 1, 1,
0.2912454, -0.9906369, 2.3656, 0, 0.3529412, 1, 1,
0.2934354, -0.825948, 1.300872, 0, 0.345098, 1, 1,
0.2956333, 0.09675846, 1.46806, 0, 0.3411765, 1, 1,
0.2958996, 0.8974343, 0.011689, 0, 0.3333333, 1, 1,
0.2961453, 0.307984, 1.153007, 0, 0.3294118, 1, 1,
0.3033512, 2.013838, -2.662926, 0, 0.3215686, 1, 1,
0.3080069, 0.730011, 2.114086, 0, 0.3176471, 1, 1,
0.3106547, -0.6307151, 2.022161, 0, 0.3098039, 1, 1,
0.3163944, 0.2835955, 0.2835705, 0, 0.3058824, 1, 1,
0.3182608, 1.986595, 1.301571, 0, 0.2980392, 1, 1,
0.3198702, 0.8221314, -0.6794922, 0, 0.2901961, 1, 1,
0.3206637, -1.65583, 3.487767, 0, 0.2862745, 1, 1,
0.3226191, -0.1842487, 1.392645, 0, 0.2784314, 1, 1,
0.3226659, 1.811173, 1.600844, 0, 0.2745098, 1, 1,
0.3246507, 0.210895, 1.231241, 0, 0.2666667, 1, 1,
0.3255156, 0.05284772, 1.403722, 0, 0.2627451, 1, 1,
0.3283496, -1.306668, 3.331123, 0, 0.254902, 1, 1,
0.3295603, -2.458329, 3.203891, 0, 0.2509804, 1, 1,
0.3297459, 1.095744, 0.1797543, 0, 0.2431373, 1, 1,
0.3298147, -0.3908889, 1.590867, 0, 0.2392157, 1, 1,
0.330729, -0.6011569, 1.05363, 0, 0.2313726, 1, 1,
0.3347253, -1.447866, 3.016654, 0, 0.227451, 1, 1,
0.3375017, -0.03393632, 2.909436, 0, 0.2196078, 1, 1,
0.3375202, -0.3934872, 3.586074, 0, 0.2156863, 1, 1,
0.3403258, -0.5203668, 3.032583, 0, 0.2078431, 1, 1,
0.3405522, 1.896394, -0.8402588, 0, 0.2039216, 1, 1,
0.3425596, 0.6085876, 1.768255, 0, 0.1960784, 1, 1,
0.3506368, 1.99542, 0.8190465, 0, 0.1882353, 1, 1,
0.3548376, 3.417705, 1.275645, 0, 0.1843137, 1, 1,
0.3587781, 0.3398023, 1.80577, 0, 0.1764706, 1, 1,
0.3657967, -0.3673781, 2.043547, 0, 0.172549, 1, 1,
0.3658435, -1.142945, 2.057954, 0, 0.1647059, 1, 1,
0.3659127, -0.5748085, 0.8799778, 0, 0.1607843, 1, 1,
0.3660399, 1.716849, 1.256748, 0, 0.1529412, 1, 1,
0.3664678, 1.84746, 0.1589639, 0, 0.1490196, 1, 1,
0.3712005, 0.008844286, 2.564083, 0, 0.1411765, 1, 1,
0.3734114, -0.132389, 0.5864695, 0, 0.1372549, 1, 1,
0.3772682, -1.301095, 3.234213, 0, 0.1294118, 1, 1,
0.3791791, -0.6022533, 0.1644947, 0, 0.1254902, 1, 1,
0.3823845, 0.2964807, 1.468178, 0, 0.1176471, 1, 1,
0.3827983, -0.4364755, 2.582001, 0, 0.1137255, 1, 1,
0.3895491, -0.8297744, 4.542025, 0, 0.1058824, 1, 1,
0.391956, 0.6614335, 1.19334, 0, 0.09803922, 1, 1,
0.3947012, -0.6253298, 1.838908, 0, 0.09411765, 1, 1,
0.3951246, 0.06318074, 1.747894, 0, 0.08627451, 1, 1,
0.39538, 0.5345316, -0.2334622, 0, 0.08235294, 1, 1,
0.3972968, 1.305446, 0.8798085, 0, 0.07450981, 1, 1,
0.397496, 0.2172226, 0.5040298, 0, 0.07058824, 1, 1,
0.4037366, 0.5578225, 1.476852, 0, 0.0627451, 1, 1,
0.403938, 1.57741, 1.514763, 0, 0.05882353, 1, 1,
0.4055704, 0.6443663, -1.161244, 0, 0.05098039, 1, 1,
0.4084867, 0.3110934, 2.211, 0, 0.04705882, 1, 1,
0.4110574, -0.4274542, 2.20203, 0, 0.03921569, 1, 1,
0.4128299, 1.380686, -0.9748978, 0, 0.03529412, 1, 1,
0.4141397, 1.595103, 0.266498, 0, 0.02745098, 1, 1,
0.4176314, -0.5564431, 3.613477, 0, 0.02352941, 1, 1,
0.418371, 2.505271, -0.1208275, 0, 0.01568628, 1, 1,
0.4188582, 0.948254, 2.542751, 0, 0.01176471, 1, 1,
0.4195021, 0.9144552, 0.3192464, 0, 0.003921569, 1, 1,
0.4210979, 0.1610273, 3.106444, 0.003921569, 0, 1, 1,
0.4261765, -0.172348, 3.537805, 0.007843138, 0, 1, 1,
0.4291839, -1.476351, 3.077091, 0.01568628, 0, 1, 1,
0.432061, -1.177751, 2.224357, 0.01960784, 0, 1, 1,
0.4322706, -2.454685, 0.7331758, 0.02745098, 0, 1, 1,
0.4376815, 1.368909, 0.03290322, 0.03137255, 0, 1, 1,
0.4407289, 0.9062694, -0.1275928, 0.03921569, 0, 1, 1,
0.443027, -1.633587, 4.045598, 0.04313726, 0, 1, 1,
0.4448816, 1.744065, -0.9537135, 0.05098039, 0, 1, 1,
0.4462708, -0.4523025, 1.081457, 0.05490196, 0, 1, 1,
0.4480367, -0.01417804, 3.539658, 0.0627451, 0, 1, 1,
0.4505732, -0.2528241, 0.1231533, 0.06666667, 0, 1, 1,
0.450696, -0.3032369, 2.396829, 0.07450981, 0, 1, 1,
0.452309, -1.649964, 2.311104, 0.07843138, 0, 1, 1,
0.4528855, -0.05431781, 2.236637, 0.08627451, 0, 1, 1,
0.4530408, -0.3424, 1.428942, 0.09019608, 0, 1, 1,
0.4551378, 0.09031171, 0.9964437, 0.09803922, 0, 1, 1,
0.4560081, 0.3107911, 0.8116324, 0.1058824, 0, 1, 1,
0.4608594, 0.4856582, 0.1350758, 0.1098039, 0, 1, 1,
0.4638914, -1.192459, 3.31169, 0.1176471, 0, 1, 1,
0.4653455, -0.619532, 0.720745, 0.1215686, 0, 1, 1,
0.4684784, 2.084761, -0.8868385, 0.1294118, 0, 1, 1,
0.4692029, -0.5249703, -0.1553313, 0.1333333, 0, 1, 1,
0.469917, 0.08863976, 0.8714247, 0.1411765, 0, 1, 1,
0.4739918, -2.295842, 1.484908, 0.145098, 0, 1, 1,
0.4757204, 0.5630314, 0.7173471, 0.1529412, 0, 1, 1,
0.4781712, -0.8640365, 1.158979, 0.1568628, 0, 1, 1,
0.4784752, -1.961367, 3.752115, 0.1647059, 0, 1, 1,
0.4793934, -0.9298283, 2.607973, 0.1686275, 0, 1, 1,
0.4795611, 0.4347738, 2.272607, 0.1764706, 0, 1, 1,
0.4813482, -1.500988, 3.651105, 0.1803922, 0, 1, 1,
0.4830029, 0.189311, 0.8866001, 0.1882353, 0, 1, 1,
0.4839436, 1.092046, 0.356033, 0.1921569, 0, 1, 1,
0.4850736, 0.3744245, 0.7769995, 0.2, 0, 1, 1,
0.4852102, -0.3633358, 1.582417, 0.2078431, 0, 1, 1,
0.4875118, -1.057323, 3.227815, 0.2117647, 0, 1, 1,
0.4878581, 3.058111, -1.198883, 0.2196078, 0, 1, 1,
0.4897447, -0.3657162, 1.524329, 0.2235294, 0, 1, 1,
0.4915717, -0.3775578, 1.803267, 0.2313726, 0, 1, 1,
0.4937092, 1.561574, -0.5413718, 0.2352941, 0, 1, 1,
0.4960337, 0.7748405, 2.024622, 0.2431373, 0, 1, 1,
0.4985668, 1.071396, -0.7191862, 0.2470588, 0, 1, 1,
0.5053926, -0.6527625, 2.732598, 0.254902, 0, 1, 1,
0.508123, -0.02442867, -0.2266907, 0.2588235, 0, 1, 1,
0.5134047, 1.144504, -0.384156, 0.2666667, 0, 1, 1,
0.5160129, 1.449382, -0.7591122, 0.2705882, 0, 1, 1,
0.5227287, -1.193475, 0.9889706, 0.2784314, 0, 1, 1,
0.5247121, 3.216581, -1.406026, 0.282353, 0, 1, 1,
0.5279795, -0.4830224, 1.066007, 0.2901961, 0, 1, 1,
0.5345871, 0.5341093, 1.473402, 0.2941177, 0, 1, 1,
0.5363241, 2.311419, -1.32911, 0.3019608, 0, 1, 1,
0.54334, -0.741946, 2.755473, 0.3098039, 0, 1, 1,
0.5459688, 0.7101467, -1.173468, 0.3137255, 0, 1, 1,
0.5485484, 2.708659, 0.898005, 0.3215686, 0, 1, 1,
0.5492807, -0.1966352, 2.300194, 0.3254902, 0, 1, 1,
0.5537533, -0.8134795, 0.9405705, 0.3333333, 0, 1, 1,
0.5543239, -1.361463, 1.860567, 0.3372549, 0, 1, 1,
0.5564276, -0.9422889, 3.086612, 0.345098, 0, 1, 1,
0.5640793, 1.190417, 0.1984569, 0.3490196, 0, 1, 1,
0.5703635, -1.83198, 4.44945, 0.3568628, 0, 1, 1,
0.5756927, -1.039331, 1.841208, 0.3607843, 0, 1, 1,
0.5777855, -1.13242, 2.84351, 0.3686275, 0, 1, 1,
0.5801789, 0.3888929, 0.3898608, 0.372549, 0, 1, 1,
0.580759, -0.5802987, 1.046274, 0.3803922, 0, 1, 1,
0.5807928, -1.672483, 2.74005, 0.3843137, 0, 1, 1,
0.5814576, 1.95369, 0.3700421, 0.3921569, 0, 1, 1,
0.5816615, 1.994922, 1.13387, 0.3960784, 0, 1, 1,
0.5823538, -3.06062, 3.440462, 0.4039216, 0, 1, 1,
0.5829707, 1.25774, 0.3136263, 0.4117647, 0, 1, 1,
0.5888448, -0.1686189, 3.126082, 0.4156863, 0, 1, 1,
0.5893344, -0.8488905, 2.076561, 0.4235294, 0, 1, 1,
0.5928962, 0.834938, -0.07926565, 0.427451, 0, 1, 1,
0.593537, -0.2143671, 2.354116, 0.4352941, 0, 1, 1,
0.593609, -1.697543, 2.76867, 0.4392157, 0, 1, 1,
0.5943962, -1.271619, 4.26746, 0.4470588, 0, 1, 1,
0.6097148, 1.447686, -0.5717193, 0.4509804, 0, 1, 1,
0.6106753, -1.005372, 2.315934, 0.4588235, 0, 1, 1,
0.6146539, -0.199409, 1.488626, 0.4627451, 0, 1, 1,
0.6151117, 1.180038, 0.2281859, 0.4705882, 0, 1, 1,
0.6186422, -0.3008133, 1.608219, 0.4745098, 0, 1, 1,
0.6244342, 1.674993, 0.5941251, 0.4823529, 0, 1, 1,
0.627207, 0.4547659, 0.828719, 0.4862745, 0, 1, 1,
0.6331931, 0.08486402, 0.8473389, 0.4941176, 0, 1, 1,
0.6334823, -1.876377, 2.545363, 0.5019608, 0, 1, 1,
0.6376346, -1.050084, 1.784258, 0.5058824, 0, 1, 1,
0.6421943, -0.7463604, 3.096081, 0.5137255, 0, 1, 1,
0.6433765, 0.6641544, 1.661088, 0.5176471, 0, 1, 1,
0.6468264, -1.020034, 2.134917, 0.5254902, 0, 1, 1,
0.6521631, -0.3445318, 2.47005, 0.5294118, 0, 1, 1,
0.6594045, -1.053768, 2.057004, 0.5372549, 0, 1, 1,
0.6613731, 0.3950769, -0.192703, 0.5411765, 0, 1, 1,
0.6628978, 0.3180879, 0.258981, 0.5490196, 0, 1, 1,
0.6639227, 1.187015, -0.5958985, 0.5529412, 0, 1, 1,
0.6679261, 2.393438, 1.914983, 0.5607843, 0, 1, 1,
0.672363, -0.2350704, 2.039444, 0.5647059, 0, 1, 1,
0.6771195, 1.349654, 1.177806, 0.572549, 0, 1, 1,
0.6777132, -0.6073344, 3.531849, 0.5764706, 0, 1, 1,
0.6805016, 0.03424342, 0.7120202, 0.5843138, 0, 1, 1,
0.6823657, -0.1541782, 2.510156, 0.5882353, 0, 1, 1,
0.6853656, -1.252006, 5.319459, 0.5960785, 0, 1, 1,
0.6861271, 0.9575484, 0.9943345, 0.6039216, 0, 1, 1,
0.6865378, 0.4783419, 0.2675483, 0.6078432, 0, 1, 1,
0.6897433, 0.4894744, -0.7625623, 0.6156863, 0, 1, 1,
0.6904448, 0.1586616, -0.2241391, 0.6196079, 0, 1, 1,
0.7005892, -1.530331, 4.313363, 0.627451, 0, 1, 1,
0.7069955, 1.530999, 0.05206796, 0.6313726, 0, 1, 1,
0.714864, -0.6976261, 1.910031, 0.6392157, 0, 1, 1,
0.7183663, 0.8098941, 1.287301, 0.6431373, 0, 1, 1,
0.7295715, -0.2608349, 0.7385461, 0.6509804, 0, 1, 1,
0.73009, -0.84579, 3.21876, 0.654902, 0, 1, 1,
0.7329945, -0.2472345, 4.108635, 0.6627451, 0, 1, 1,
0.733826, -1.476502, 2.409208, 0.6666667, 0, 1, 1,
0.7435611, -0.3562148, 1.935838, 0.6745098, 0, 1, 1,
0.7468444, 0.4155717, 1.541, 0.6784314, 0, 1, 1,
0.7494442, 1.777499, 0.7632907, 0.6862745, 0, 1, 1,
0.7515516, 1.728034, -0.2164886, 0.6901961, 0, 1, 1,
0.7544063, 0.1992313, 2.673528, 0.6980392, 0, 1, 1,
0.7557264, -0.2183114, 2.253997, 0.7058824, 0, 1, 1,
0.7560535, 0.8342893, 0.7615329, 0.7098039, 0, 1, 1,
0.7567414, -0.1695919, 2.65285, 0.7176471, 0, 1, 1,
0.759101, 0.3054838, 0.7595933, 0.7215686, 0, 1, 1,
0.7615092, 0.2308476, 1.694506, 0.7294118, 0, 1, 1,
0.7641987, -1.621121, 1.896848, 0.7333333, 0, 1, 1,
0.7645978, -1.682518, 3.179329, 0.7411765, 0, 1, 1,
0.7750138, -1.71576, 2.895648, 0.7450981, 0, 1, 1,
0.7761251, 0.8374323, 0.7642629, 0.7529412, 0, 1, 1,
0.7799122, -0.365378, 3.30266, 0.7568628, 0, 1, 1,
0.7808208, 0.1964505, 1.857297, 0.7647059, 0, 1, 1,
0.7893117, 0.5889407, 2.549803, 0.7686275, 0, 1, 1,
0.7894248, 0.73621, 0.8358541, 0.7764706, 0, 1, 1,
0.7904624, 1.127595, -1.628479, 0.7803922, 0, 1, 1,
0.7924948, 1.625912, 0.01131327, 0.7882353, 0, 1, 1,
0.7939262, -1.074367, 2.755791, 0.7921569, 0, 1, 1,
0.8007566, -0.8031789, 2.004329, 0.8, 0, 1, 1,
0.8033678, -0.6207077, 2.258831, 0.8078431, 0, 1, 1,
0.804123, 0.4272645, 0.377693, 0.8117647, 0, 1, 1,
0.8067768, 1.881575, 0.05938575, 0.8196079, 0, 1, 1,
0.8111873, 0.5019724, -0.07388932, 0.8235294, 0, 1, 1,
0.8144161, -0.4764805, 4.872426, 0.8313726, 0, 1, 1,
0.8144603, -1.505056, 2.483627, 0.8352941, 0, 1, 1,
0.8166831, -0.7726661, 2.425863, 0.8431373, 0, 1, 1,
0.8181676, 1.305832, 1.721329, 0.8470588, 0, 1, 1,
0.8200388, 0.9962794, 0.2186832, 0.854902, 0, 1, 1,
0.8225147, 0.009268275, 1.094774, 0.8588235, 0, 1, 1,
0.8231438, -0.6234048, 2.945702, 0.8666667, 0, 1, 1,
0.8237073, 1.116146, 0.8792984, 0.8705882, 0, 1, 1,
0.8271258, 2.078211, -0.5895866, 0.8784314, 0, 1, 1,
0.8278272, 0.473396, 0.2526681, 0.8823529, 0, 1, 1,
0.8292663, 0.1137722, 1.241152, 0.8901961, 0, 1, 1,
0.8296449, -1.517881, 2.741767, 0.8941177, 0, 1, 1,
0.8447298, 0.1723067, 0.817807, 0.9019608, 0, 1, 1,
0.8458125, -0.001293416, 0.4456198, 0.9098039, 0, 1, 1,
0.8500896, -0.4065537, 0.7295371, 0.9137255, 0, 1, 1,
0.8637176, 0.7745399, 2.402573, 0.9215686, 0, 1, 1,
0.8669693, 0.938589, 1.212386, 0.9254902, 0, 1, 1,
0.8683369, -0.2300643, 3.746699, 0.9333333, 0, 1, 1,
0.8813511, -1.332393, 2.596597, 0.9372549, 0, 1, 1,
0.8819882, -1.040113, 1.2994, 0.945098, 0, 1, 1,
0.8934423, 0.4448609, 0.4492722, 0.9490196, 0, 1, 1,
0.9003538, -1.421823, 2.060577, 0.9568627, 0, 1, 1,
0.9028045, -0.7515666, 3.03527, 0.9607843, 0, 1, 1,
0.9214029, -0.7037632, 1.407688, 0.9686275, 0, 1, 1,
0.9238992, 0.3123465, 0.868222, 0.972549, 0, 1, 1,
0.9302977, 0.01187859, 2.881101, 0.9803922, 0, 1, 1,
0.9306737, 1.742765, 0.6712862, 0.9843137, 0, 1, 1,
0.9310848, -1.152728, 3.314961, 0.9921569, 0, 1, 1,
0.9313476, 1.481733, -0.3137976, 0.9960784, 0, 1, 1,
0.9324278, 0.3498868, 1.475945, 1, 0, 0.9960784, 1,
0.9402539, -0.1292742, 1.414049, 1, 0, 0.9882353, 1,
0.9412202, 0.06610827, 0.8823938, 1, 0, 0.9843137, 1,
0.9476666, -0.5328124, 1.760858, 1, 0, 0.9764706, 1,
0.9507258, -1.44677, 2.683862, 1, 0, 0.972549, 1,
0.9517041, 0.9183915, 0.1181498, 1, 0, 0.9647059, 1,
0.9552948, 0.4703524, 0.02596054, 1, 0, 0.9607843, 1,
0.9559448, 0.2882385, 0.9754201, 1, 0, 0.9529412, 1,
0.9583045, -0.3782333, 3.392171, 1, 0, 0.9490196, 1,
0.9587868, -0.6421099, 2.466616, 1, 0, 0.9411765, 1,
0.9612402, -2.779316, 2.814483, 1, 0, 0.9372549, 1,
0.9696909, -0.1537361, 2.017498, 1, 0, 0.9294118, 1,
0.9707713, 1.486356, -0.2727537, 1, 0, 0.9254902, 1,
0.9732561, -0.2113338, 1.331341, 1, 0, 0.9176471, 1,
0.9744917, 0.1593519, 2.313077, 1, 0, 0.9137255, 1,
0.9748383, -0.2738619, 0.3822321, 1, 0, 0.9058824, 1,
0.9756836, 0.5631962, 0.3098977, 1, 0, 0.9019608, 1,
0.9778443, 1.095032, 1.44437, 1, 0, 0.8941177, 1,
0.9880787, -0.7919192, 2.057336, 1, 0, 0.8862745, 1,
1.005369, 1.508605, 0.4512699, 1, 0, 0.8823529, 1,
1.025632, -0.2350048, 1.425415, 1, 0, 0.8745098, 1,
1.027239, 0.7268458, 0.08694572, 1, 0, 0.8705882, 1,
1.035221, -0.5979018, 0.7538278, 1, 0, 0.8627451, 1,
1.040601, 0.6718659, 1.954325, 1, 0, 0.8588235, 1,
1.044765, -0.2695799, 1.943184, 1, 0, 0.8509804, 1,
1.049719, 0.9321311, 1.983306, 1, 0, 0.8470588, 1,
1.055365, -0.5721403, 2.958672, 1, 0, 0.8392157, 1,
1.061586, -0.06941558, 1.400553, 1, 0, 0.8352941, 1,
1.062429, -1.280571, 2.503722, 1, 0, 0.827451, 1,
1.069702, -0.2757211, 1.053974, 1, 0, 0.8235294, 1,
1.071021, -1.180553, 2.698376, 1, 0, 0.8156863, 1,
1.074636, -0.06911988, 1.752459, 1, 0, 0.8117647, 1,
1.075137, -0.4699634, 2.497587, 1, 0, 0.8039216, 1,
1.078096, -0.925131, 2.450203, 1, 0, 0.7960784, 1,
1.078248, 0.8881109, 0.0891488, 1, 0, 0.7921569, 1,
1.079268, 0.1590175, 1.054031, 1, 0, 0.7843137, 1,
1.085955, 0.8192821, -0.4253351, 1, 0, 0.7803922, 1,
1.087849, -0.326353, 0.9862439, 1, 0, 0.772549, 1,
1.089046, -0.8618215, 2.935004, 1, 0, 0.7686275, 1,
1.089688, 0.4504741, -0.2404162, 1, 0, 0.7607843, 1,
1.091333, 1.243757, 0.8757074, 1, 0, 0.7568628, 1,
1.104632, -0.4917699, 0.3417119, 1, 0, 0.7490196, 1,
1.11809, 1.287684, 1.865835, 1, 0, 0.7450981, 1,
1.119279, -0.05209155, 2.666669, 1, 0, 0.7372549, 1,
1.121118, 0.4219072, 1.406495, 1, 0, 0.7333333, 1,
1.122822, -0.3362043, 2.832005, 1, 0, 0.7254902, 1,
1.126311, -0.3340087, 1.887242, 1, 0, 0.7215686, 1,
1.139218, 2.22519, 0.467996, 1, 0, 0.7137255, 1,
1.141514, -0.7812487, 3.450829, 1, 0, 0.7098039, 1,
1.14646, -0.6818545, 1.944588, 1, 0, 0.7019608, 1,
1.14768, -0.9619051, 1.745139, 1, 0, 0.6941177, 1,
1.162363, -1.059261, 3.023979, 1, 0, 0.6901961, 1,
1.167544, 1.046466, 1.855168, 1, 0, 0.682353, 1,
1.18472, 1.824746, -0.03218418, 1, 0, 0.6784314, 1,
1.189958, 0.2817499, 1.329658, 1, 0, 0.6705883, 1,
1.205738, 2.701431, 0.5656425, 1, 0, 0.6666667, 1,
1.205987, -0.9631832, 1.967329, 1, 0, 0.6588235, 1,
1.213559, -1.28584, 2.156699, 1, 0, 0.654902, 1,
1.223307, 1.317916, -0.7678947, 1, 0, 0.6470588, 1,
1.239091, 0.00761649, 1.45795, 1, 0, 0.6431373, 1,
1.239971, -1.723499, 2.453952, 1, 0, 0.6352941, 1,
1.241668, -0.01258989, 0.827521, 1, 0, 0.6313726, 1,
1.266062, 1.250173, 0.6574411, 1, 0, 0.6235294, 1,
1.267519, -0.6684845, 3.158154, 1, 0, 0.6196079, 1,
1.28234, -1.158974, 2.567782, 1, 0, 0.6117647, 1,
1.295128, 1.969487, -1.660358, 1, 0, 0.6078432, 1,
1.297502, 1.353333, 0.6345291, 1, 0, 0.6, 1,
1.302148, -1.012391, 3.410432, 1, 0, 0.5921569, 1,
1.310193, 0.6955388, 0.7818627, 1, 0, 0.5882353, 1,
1.317488, -0.339338, 3.525664, 1, 0, 0.5803922, 1,
1.329182, 0.3300897, -0.08236746, 1, 0, 0.5764706, 1,
1.330765, 1.202096, 1.867422, 1, 0, 0.5686275, 1,
1.337068, 1.942674, -0.4013585, 1, 0, 0.5647059, 1,
1.337315, -0.5151614, 1.815578, 1, 0, 0.5568628, 1,
1.34633, 1.251102, 0.03837136, 1, 0, 0.5529412, 1,
1.349845, 0.6625483, 1.580623, 1, 0, 0.5450981, 1,
1.362645, 1.168327, 0.4936235, 1, 0, 0.5411765, 1,
1.363674, -1.276222, 1.507168, 1, 0, 0.5333334, 1,
1.381861, -0.7799297, 1.417, 1, 0, 0.5294118, 1,
1.382129, 0.3976846, 0.3036954, 1, 0, 0.5215687, 1,
1.384975, 0.860983, 1.489996, 1, 0, 0.5176471, 1,
1.397933, 0.1133435, 0.6539903, 1, 0, 0.509804, 1,
1.405979, -0.2723299, 2.383628, 1, 0, 0.5058824, 1,
1.409505, -0.6901528, 2.594153, 1, 0, 0.4980392, 1,
1.426733, -0.04539463, 2.006152, 1, 0, 0.4901961, 1,
1.428902, -0.9713304, 3.105515, 1, 0, 0.4862745, 1,
1.432807, -0.5653664, 1.720328, 1, 0, 0.4784314, 1,
1.437522, 0.09137144, 1.110714, 1, 0, 0.4745098, 1,
1.464862, -0.06044285, 2.547559, 1, 0, 0.4666667, 1,
1.465822, 1.572285, 1.392149, 1, 0, 0.4627451, 1,
1.470215, -1.036658, 1.784383, 1, 0, 0.454902, 1,
1.472979, -0.7099048, 2.577684, 1, 0, 0.4509804, 1,
1.478353, -0.5616454, 2.348881, 1, 0, 0.4431373, 1,
1.487828, 1.165165, 1.52843, 1, 0, 0.4392157, 1,
1.494571, 1.802713, 1.723424, 1, 0, 0.4313726, 1,
1.504245, 0.8767569, 1.47191, 1, 0, 0.427451, 1,
1.508854, -0.7916435, 1.790961, 1, 0, 0.4196078, 1,
1.510082, 0.7742153, 0.5394198, 1, 0, 0.4156863, 1,
1.512117, 0.4959175, 1.133623, 1, 0, 0.4078431, 1,
1.516572, -0.689999, 3.170661, 1, 0, 0.4039216, 1,
1.531093, -0.6641422, 2.239838, 1, 0, 0.3960784, 1,
1.537027, 0.1330785, 0.04532629, 1, 0, 0.3882353, 1,
1.545922, -0.6693717, 2.448952, 1, 0, 0.3843137, 1,
1.5497, 0.7976339, 1.143745, 1, 0, 0.3764706, 1,
1.574883, -0.6674106, 2.554355, 1, 0, 0.372549, 1,
1.576662, 0.859643, -2.427825, 1, 0, 0.3647059, 1,
1.583195, 1.488956, 2.225212, 1, 0, 0.3607843, 1,
1.596074, -0.5309331, 2.301843, 1, 0, 0.3529412, 1,
1.5975, 0.3776886, 1.181987, 1, 0, 0.3490196, 1,
1.598545, -1.044916, 1.691177, 1, 0, 0.3411765, 1,
1.605599, 1.859598, 1.515807, 1, 0, 0.3372549, 1,
1.610826, -0.540292, 0.9263272, 1, 0, 0.3294118, 1,
1.624437, 0.789316, 1.048029, 1, 0, 0.3254902, 1,
1.633897, -1.218284, 2.813704, 1, 0, 0.3176471, 1,
1.638989, 0.3854712, 2.521781, 1, 0, 0.3137255, 1,
1.647405, -0.9540085, 1.778645, 1, 0, 0.3058824, 1,
1.647647, -0.4313383, 0.8263661, 1, 0, 0.2980392, 1,
1.659562, 0.2188291, 0.7603239, 1, 0, 0.2941177, 1,
1.661211, -1.42988, 2.826608, 1, 0, 0.2862745, 1,
1.661636, 0.5935658, 3.092524, 1, 0, 0.282353, 1,
1.672198, -0.02338751, 0.9766368, 1, 0, 0.2745098, 1,
1.685815, 0.6301528, 0.08664485, 1, 0, 0.2705882, 1,
1.687367, -1.375519, 2.096194, 1, 0, 0.2627451, 1,
1.68916, 1.564396, 0.3831924, 1, 0, 0.2588235, 1,
1.689479, 0.9130026, -0.1051801, 1, 0, 0.2509804, 1,
1.693342, 0.04433402, -0.3543866, 1, 0, 0.2470588, 1,
1.697972, -0.4010965, 3.057217, 1, 0, 0.2392157, 1,
1.705001, 0.9386469, 1.276198, 1, 0, 0.2352941, 1,
1.718478, -0.4843742, 2.933146, 1, 0, 0.227451, 1,
1.730093, -0.3383382, 2.783611, 1, 0, 0.2235294, 1,
1.752575, -0.2370727, 0.1736632, 1, 0, 0.2156863, 1,
1.754364, 0.4333045, 2.528649, 1, 0, 0.2117647, 1,
1.759763, -1.234881, 1.023233, 1, 0, 0.2039216, 1,
1.761199, 0.5923404, 1.167297, 1, 0, 0.1960784, 1,
1.773639, 1.285297, 1.621348, 1, 0, 0.1921569, 1,
1.781184, -0.4076435, 2.546253, 1, 0, 0.1843137, 1,
1.793806, 0.9151724, 0.388323, 1, 0, 0.1803922, 1,
1.806306, 0.02940762, 1.208783, 1, 0, 0.172549, 1,
1.819505, 1.100736, 1.188929, 1, 0, 0.1686275, 1,
1.832369, 0.4247993, 0.3206866, 1, 0, 0.1607843, 1,
1.833265, 0.3684258, 1.311341, 1, 0, 0.1568628, 1,
1.898035, 0.01448395, 1.88842, 1, 0, 0.1490196, 1,
1.931965, -0.2909766, 2.032318, 1, 0, 0.145098, 1,
1.959179, -2.430902, 1.468432, 1, 0, 0.1372549, 1,
1.962755, -0.6256773, 2.293924, 1, 0, 0.1333333, 1,
1.965461, -0.331016, 0.9232158, 1, 0, 0.1254902, 1,
1.972517, 0.3687975, 1.264224, 1, 0, 0.1215686, 1,
1.973285, -0.4390092, 0.2888551, 1, 0, 0.1137255, 1,
1.993955, -1.243634, 1.690807, 1, 0, 0.1098039, 1,
1.995249, -0.5476817, 0.08559775, 1, 0, 0.1019608, 1,
2.031322, 0.31416, 4.05444, 1, 0, 0.09411765, 1,
2.04026, 0.3359717, 3.568294, 1, 0, 0.09019608, 1,
2.044131, 0.4361163, 1.699623, 1, 0, 0.08235294, 1,
2.067023, -0.3569776, 3.454407, 1, 0, 0.07843138, 1,
2.092916, 1.436002, 1.028462, 1, 0, 0.07058824, 1,
2.271186, 0.0567903, 0.6735618, 1, 0, 0.06666667, 1,
2.27146, -1.237073, 2.762033, 1, 0, 0.05882353, 1,
2.309419, -1.98084, 3.837403, 1, 0, 0.05490196, 1,
2.330909, 0.05903869, 2.150501, 1, 0, 0.04705882, 1,
2.516567, -1.867851, 1.699113, 1, 0, 0.04313726, 1,
2.578343, 0.3539928, -0.08001864, 1, 0, 0.03529412, 1,
2.689565, 0.2302394, 1.393843, 1, 0, 0.03137255, 1,
2.931541, -0.5370375, 1.782903, 1, 0, 0.02352941, 1,
2.998584, 0.08334892, 0.4262985, 1, 0, 0.01960784, 1,
3.040603, -0.4782425, 1.863249, 1, 0, 0.01176471, 1,
3.796763, 0.6424479, 3.318123, 1, 0, 0.007843138, 1
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
0.4418979, -4.158696, -7.499444, 0, -0.5, 0.5, 0.5,
0.4418979, -4.158696, -7.499444, 1, -0.5, 0.5, 0.5,
0.4418979, -4.158696, -7.499444, 1, 1.5, 0.5, 0.5,
0.4418979, -4.158696, -7.499444, 0, 1.5, 0.5, 0.5
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
-4.050266, 0.1785427, -7.499444, 0, -0.5, 0.5, 0.5,
-4.050266, 0.1785427, -7.499444, 1, -0.5, 0.5, 0.5,
-4.050266, 0.1785427, -7.499444, 1, 1.5, 0.5, 0.5,
-4.050266, 0.1785427, -7.499444, 0, 1.5, 0.5, 0.5
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
-4.050266, -4.158696, -0.1610465, 0, -0.5, 0.5, 0.5,
-4.050266, -4.158696, -0.1610465, 1, -0.5, 0.5, 0.5,
-4.050266, -4.158696, -0.1610465, 1, 1.5, 0.5, 0.5,
-4.050266, -4.158696, -0.1610465, 0, 1.5, 0.5, 0.5
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
-2, -3.157794, -5.805968,
3, -3.157794, -5.805968,
-2, -3.157794, -5.805968,
-2, -3.324611, -6.088214,
-1, -3.157794, -5.805968,
-1, -3.324611, -6.088214,
0, -3.157794, -5.805968,
0, -3.324611, -6.088214,
1, -3.157794, -5.805968,
1, -3.324611, -6.088214,
2, -3.157794, -5.805968,
2, -3.324611, -6.088214,
3, -3.157794, -5.805968,
3, -3.324611, -6.088214
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
-2, -3.658245, -6.652706, 0, -0.5, 0.5, 0.5,
-2, -3.658245, -6.652706, 1, -0.5, 0.5, 0.5,
-2, -3.658245, -6.652706, 1, 1.5, 0.5, 0.5,
-2, -3.658245, -6.652706, 0, 1.5, 0.5, 0.5,
-1, -3.658245, -6.652706, 0, -0.5, 0.5, 0.5,
-1, -3.658245, -6.652706, 1, -0.5, 0.5, 0.5,
-1, -3.658245, -6.652706, 1, 1.5, 0.5, 0.5,
-1, -3.658245, -6.652706, 0, 1.5, 0.5, 0.5,
0, -3.658245, -6.652706, 0, -0.5, 0.5, 0.5,
0, -3.658245, -6.652706, 1, -0.5, 0.5, 0.5,
0, -3.658245, -6.652706, 1, 1.5, 0.5, 0.5,
0, -3.658245, -6.652706, 0, 1.5, 0.5, 0.5,
1, -3.658245, -6.652706, 0, -0.5, 0.5, 0.5,
1, -3.658245, -6.652706, 1, -0.5, 0.5, 0.5,
1, -3.658245, -6.652706, 1, 1.5, 0.5, 0.5,
1, -3.658245, -6.652706, 0, 1.5, 0.5, 0.5,
2, -3.658245, -6.652706, 0, -0.5, 0.5, 0.5,
2, -3.658245, -6.652706, 1, -0.5, 0.5, 0.5,
2, -3.658245, -6.652706, 1, 1.5, 0.5, 0.5,
2, -3.658245, -6.652706, 0, 1.5, 0.5, 0.5,
3, -3.658245, -6.652706, 0, -0.5, 0.5, 0.5,
3, -3.658245, -6.652706, 1, -0.5, 0.5, 0.5,
3, -3.658245, -6.652706, 1, 1.5, 0.5, 0.5,
3, -3.658245, -6.652706, 0, 1.5, 0.5, 0.5
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
-3.013613, -3, -5.805968,
-3.013613, 3, -5.805968,
-3.013613, -3, -5.805968,
-3.186389, -3, -6.088214,
-3.013613, -2, -5.805968,
-3.186389, -2, -6.088214,
-3.013613, -1, -5.805968,
-3.186389, -1, -6.088214,
-3.013613, 0, -5.805968,
-3.186389, 0, -6.088214,
-3.013613, 1, -5.805968,
-3.186389, 1, -6.088214,
-3.013613, 2, -5.805968,
-3.186389, 2, -6.088214,
-3.013613, 3, -5.805968,
-3.186389, 3, -6.088214
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
-3.53194, -3, -6.652706, 0, -0.5, 0.5, 0.5,
-3.53194, -3, -6.652706, 1, -0.5, 0.5, 0.5,
-3.53194, -3, -6.652706, 1, 1.5, 0.5, 0.5,
-3.53194, -3, -6.652706, 0, 1.5, 0.5, 0.5,
-3.53194, -2, -6.652706, 0, -0.5, 0.5, 0.5,
-3.53194, -2, -6.652706, 1, -0.5, 0.5, 0.5,
-3.53194, -2, -6.652706, 1, 1.5, 0.5, 0.5,
-3.53194, -2, -6.652706, 0, 1.5, 0.5, 0.5,
-3.53194, -1, -6.652706, 0, -0.5, 0.5, 0.5,
-3.53194, -1, -6.652706, 1, -0.5, 0.5, 0.5,
-3.53194, -1, -6.652706, 1, 1.5, 0.5, 0.5,
-3.53194, -1, -6.652706, 0, 1.5, 0.5, 0.5,
-3.53194, 0, -6.652706, 0, -0.5, 0.5, 0.5,
-3.53194, 0, -6.652706, 1, -0.5, 0.5, 0.5,
-3.53194, 0, -6.652706, 1, 1.5, 0.5, 0.5,
-3.53194, 0, -6.652706, 0, 1.5, 0.5, 0.5,
-3.53194, 1, -6.652706, 0, -0.5, 0.5, 0.5,
-3.53194, 1, -6.652706, 1, -0.5, 0.5, 0.5,
-3.53194, 1, -6.652706, 1, 1.5, 0.5, 0.5,
-3.53194, 1, -6.652706, 0, 1.5, 0.5, 0.5,
-3.53194, 2, -6.652706, 0, -0.5, 0.5, 0.5,
-3.53194, 2, -6.652706, 1, -0.5, 0.5, 0.5,
-3.53194, 2, -6.652706, 1, 1.5, 0.5, 0.5,
-3.53194, 2, -6.652706, 0, 1.5, 0.5, 0.5,
-3.53194, 3, -6.652706, 0, -0.5, 0.5, 0.5,
-3.53194, 3, -6.652706, 1, -0.5, 0.5, 0.5,
-3.53194, 3, -6.652706, 1, 1.5, 0.5, 0.5,
-3.53194, 3, -6.652706, 0, 1.5, 0.5, 0.5
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
-3.013613, -3.157794, -4,
-3.013613, -3.157794, 4,
-3.013613, -3.157794, -4,
-3.186389, -3.324611, -4,
-3.013613, -3.157794, -2,
-3.186389, -3.324611, -2,
-3.013613, -3.157794, 0,
-3.186389, -3.324611, 0,
-3.013613, -3.157794, 2,
-3.186389, -3.324611, 2,
-3.013613, -3.157794, 4,
-3.186389, -3.324611, 4
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
-3.53194, -3.658245, -4, 0, -0.5, 0.5, 0.5,
-3.53194, -3.658245, -4, 1, -0.5, 0.5, 0.5,
-3.53194, -3.658245, -4, 1, 1.5, 0.5, 0.5,
-3.53194, -3.658245, -4, 0, 1.5, 0.5, 0.5,
-3.53194, -3.658245, -2, 0, -0.5, 0.5, 0.5,
-3.53194, -3.658245, -2, 1, -0.5, 0.5, 0.5,
-3.53194, -3.658245, -2, 1, 1.5, 0.5, 0.5,
-3.53194, -3.658245, -2, 0, 1.5, 0.5, 0.5,
-3.53194, -3.658245, 0, 0, -0.5, 0.5, 0.5,
-3.53194, -3.658245, 0, 1, -0.5, 0.5, 0.5,
-3.53194, -3.658245, 0, 1, 1.5, 0.5, 0.5,
-3.53194, -3.658245, 0, 0, 1.5, 0.5, 0.5,
-3.53194, -3.658245, 2, 0, -0.5, 0.5, 0.5,
-3.53194, -3.658245, 2, 1, -0.5, 0.5, 0.5,
-3.53194, -3.658245, 2, 1, 1.5, 0.5, 0.5,
-3.53194, -3.658245, 2, 0, 1.5, 0.5, 0.5,
-3.53194, -3.658245, 4, 0, -0.5, 0.5, 0.5,
-3.53194, -3.658245, 4, 1, -0.5, 0.5, 0.5,
-3.53194, -3.658245, 4, 1, 1.5, 0.5, 0.5,
-3.53194, -3.658245, 4, 0, 1.5, 0.5, 0.5
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
-3.013613, -3.157794, -5.805968,
-3.013613, 3.51488, -5.805968,
-3.013613, -3.157794, 5.483875,
-3.013613, 3.51488, 5.483875,
-3.013613, -3.157794, -5.805968,
-3.013613, -3.157794, 5.483875,
-3.013613, 3.51488, -5.805968,
-3.013613, 3.51488, 5.483875,
-3.013613, -3.157794, -5.805968,
3.897409, -3.157794, -5.805968,
-3.013613, -3.157794, 5.483875,
3.897409, -3.157794, 5.483875,
-3.013613, 3.51488, -5.805968,
3.897409, 3.51488, -5.805968,
-3.013613, 3.51488, 5.483875,
3.897409, 3.51488, 5.483875,
3.897409, -3.157794, -5.805968,
3.897409, 3.51488, -5.805968,
3.897409, -3.157794, 5.483875,
3.897409, 3.51488, 5.483875,
3.897409, -3.157794, -5.805968,
3.897409, -3.157794, 5.483875,
3.897409, 3.51488, -5.805968,
3.897409, 3.51488, 5.483875
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
var radius = 7.915663;
var distance = 35.21768;
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
mvMatrix.translate( -0.4418979, -0.1785427, 0.1610465 );
mvMatrix.scale( 1.238394, 1.28263, 0.758077 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.21768);
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
nitropyrazol-5-ylami<-read.table("nitropyrazol-5-ylami.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nitropyrazol-5-ylami$V2
```

```
## Error in eval(expr, envir, enclos): object 'nitropyrazol' not found
```

```r
y<-nitropyrazol-5-ylami$V3
```

```
## Error in eval(expr, envir, enclos): object 'nitropyrazol' not found
```

```r
z<-nitropyrazol-5-ylami$V4
```

```
## Error in eval(expr, envir, enclos): object 'nitropyrazol' not found
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
-2.912967, 2.50709, -0.6384381, 0, 0, 1, 1, 1,
-2.816197, -0.542363, -0.02334647, 1, 0, 0, 1, 1,
-2.812803, -1.228882, -1.323179, 1, 0, 0, 1, 1,
-2.769259, 0.3507927, -0.5982383, 1, 0, 0, 1, 1,
-2.661111, 1.495654, 0.1931109, 1, 0, 0, 1, 1,
-2.577514, 0.8046864, -2.954374, 1, 0, 0, 1, 1,
-2.331797, 0.5676663, -1.666425, 0, 0, 0, 1, 1,
-2.278713, -0.2166113, -1.818141, 0, 0, 0, 1, 1,
-2.256997, 0.0874415, -0.3425865, 0, 0, 0, 1, 1,
-2.256532, -0.8333992, -3.748058, 0, 0, 0, 1, 1,
-2.234837, 0.9013768, -1.348829, 0, 0, 0, 1, 1,
-2.179298, 0.1516861, -1.511334, 0, 0, 0, 1, 1,
-2.013892, -0.0003640273, -2.13374, 0, 0, 0, 1, 1,
-2.010212, 0.330651, -1.440165, 1, 1, 1, 1, 1,
-2.002535, -0.7378119, -0.2729834, 1, 1, 1, 1, 1,
-1.989969, 0.2683075, -1.036168, 1, 1, 1, 1, 1,
-1.979208, 0.2267238, -0.6718196, 1, 1, 1, 1, 1,
-1.95146, 0.7409681, -1.362548, 1, 1, 1, 1, 1,
-1.935576, 0.1389009, -2.814652, 1, 1, 1, 1, 1,
-1.91946, 0.2135531, 0.09632605, 1, 1, 1, 1, 1,
-1.913189, 1.032124, -0.8782976, 1, 1, 1, 1, 1,
-1.894136, -0.1478441, -1.63593, 1, 1, 1, 1, 1,
-1.837136, 2.401294, -1.946579, 1, 1, 1, 1, 1,
-1.830741, 0.5358547, -3.002564, 1, 1, 1, 1, 1,
-1.818842, 1.052266, -1.296624, 1, 1, 1, 1, 1,
-1.813958, 0.08511894, -0.4117602, 1, 1, 1, 1, 1,
-1.798662, -0.7603036, -2.679219, 1, 1, 1, 1, 1,
-1.780584, -0.9170085, -0.7021341, 1, 1, 1, 1, 1,
-1.773016, -0.505605, -2.033196, 0, 0, 1, 1, 1,
-1.767833, -1.090065, -1.555863, 1, 0, 0, 1, 1,
-1.766719, 0.8612261, -2.645888, 1, 0, 0, 1, 1,
-1.766108, 1.400846, -1.794616, 1, 0, 0, 1, 1,
-1.757011, 0.8121045, -2.848183, 1, 0, 0, 1, 1,
-1.75387, -0.5261097, -0.4386601, 1, 0, 0, 1, 1,
-1.749623, 0.5938204, -1.695402, 0, 0, 0, 1, 1,
-1.749568, 0.4379605, -1.027446, 0, 0, 0, 1, 1,
-1.731879, 0.6716309, -0.2420037, 0, 0, 0, 1, 1,
-1.731577, 0.5320035, -1.811986, 0, 0, 0, 1, 1,
-1.720375, 0.4945837, -1.055192, 0, 0, 0, 1, 1,
-1.719381, -0.7062816, -0.4414633, 0, 0, 0, 1, 1,
-1.702024, 0.7286835, -1.271695, 0, 0, 0, 1, 1,
-1.693153, 1.122263, -0.9957949, 1, 1, 1, 1, 1,
-1.690709, -1.499386, -1.176318, 1, 1, 1, 1, 1,
-1.673424, -0.9435738, -3.666445, 1, 1, 1, 1, 1,
-1.663568, 0.9189376, -0.8532032, 1, 1, 1, 1, 1,
-1.658844, -0.3251576, -1.308577, 1, 1, 1, 1, 1,
-1.644012, 1.355083, 0.4296182, 1, 1, 1, 1, 1,
-1.616731, -1.631279, -2.518103, 1, 1, 1, 1, 1,
-1.614764, -0.8745709, 0.139503, 1, 1, 1, 1, 1,
-1.602678, -1.274951, -4.05044, 1, 1, 1, 1, 1,
-1.601969, 1.050625, -0.8036256, 1, 1, 1, 1, 1,
-1.601677, -0.6747889, -1.39601, 1, 1, 1, 1, 1,
-1.58133, 0.6867363, 0.04707247, 1, 1, 1, 1, 1,
-1.577512, 0.6646399, -0.9715216, 1, 1, 1, 1, 1,
-1.558058, -1.517215, -0.1035784, 1, 1, 1, 1, 1,
-1.553384, -0.4140061, -0.8346292, 1, 1, 1, 1, 1,
-1.54984, -0.7472608, -2.909949, 0, 0, 1, 1, 1,
-1.549824, 0.6579851, -0.3484709, 1, 0, 0, 1, 1,
-1.544268, -0.4360171, -1.541327, 1, 0, 0, 1, 1,
-1.519495, -0.3736348, -1.319606, 1, 0, 0, 1, 1,
-1.516121, 1.547492, -1.543269, 1, 0, 0, 1, 1,
-1.509843, -0.3913341, -2.342897, 1, 0, 0, 1, 1,
-1.500829, 0.6268334, -1.618698, 0, 0, 0, 1, 1,
-1.494655, 0.9001719, -1.178244, 0, 0, 0, 1, 1,
-1.485464, 0.04844252, 0.2849416, 0, 0, 0, 1, 1,
-1.480963, 0.737346, 0.67827, 0, 0, 0, 1, 1,
-1.47673, 0.5921785, -2.6545, 0, 0, 0, 1, 1,
-1.461009, -0.7173311, -2.548285, 0, 0, 0, 1, 1,
-1.456688, -1.840716, -3.280046, 0, 0, 0, 1, 1,
-1.449991, -0.3399303, -1.830448, 1, 1, 1, 1, 1,
-1.4333, 0.338791, -0.6190375, 1, 1, 1, 1, 1,
-1.432999, 0.1041218, -0.7402878, 1, 1, 1, 1, 1,
-1.425977, -1.093301, -2.875293, 1, 1, 1, 1, 1,
-1.401433, 0.02054307, -2.359366, 1, 1, 1, 1, 1,
-1.400638, -0.7646511, -1.524715, 1, 1, 1, 1, 1,
-1.391859, -0.4540314, -0.555916, 1, 1, 1, 1, 1,
-1.386691, 1.152786, -2.676223, 1, 1, 1, 1, 1,
-1.373526, 0.01899632, -1.950554, 1, 1, 1, 1, 1,
-1.365263, 0.4807897, -0.4234666, 1, 1, 1, 1, 1,
-1.352962, -0.7343561, -1.433111, 1, 1, 1, 1, 1,
-1.348135, -0.5900571, -2.605826, 1, 1, 1, 1, 1,
-1.344929, -0.1183646, 0.8245819, 1, 1, 1, 1, 1,
-1.341233, 0.7302742, -1.006981, 1, 1, 1, 1, 1,
-1.3399, -0.08285395, -0.5678112, 1, 1, 1, 1, 1,
-1.339605, -0.1129583, -2.489361, 0, 0, 1, 1, 1,
-1.335183, 0.4699429, -1.63018, 1, 0, 0, 1, 1,
-1.328834, 1.191404, -0.1395254, 1, 0, 0, 1, 1,
-1.320405, -0.5634786, -4.607233, 1, 0, 0, 1, 1,
-1.3147, 0.7579684, -0.9980623, 1, 0, 0, 1, 1,
-1.310794, -0.1636249, -0.822254, 1, 0, 0, 1, 1,
-1.304803, -1.277745, -3.471223, 0, 0, 0, 1, 1,
-1.297327, -1.45797, -1.933589, 0, 0, 0, 1, 1,
-1.29575, 0.6599313, -1.418311, 0, 0, 0, 1, 1,
-1.291059, 0.3506591, -1.472366, 0, 0, 0, 1, 1,
-1.290204, 0.6451941, -0.9084431, 0, 0, 0, 1, 1,
-1.28881, -0.007004024, -1.198321, 0, 0, 0, 1, 1,
-1.281633, -1.755657, -3.441524, 0, 0, 0, 1, 1,
-1.281478, -0.2518749, -2.001924, 1, 1, 1, 1, 1,
-1.278521, 0.2598923, -1.504469, 1, 1, 1, 1, 1,
-1.278108, 0.2409217, -0.3145595, 1, 1, 1, 1, 1,
-1.272126, -0.5526595, -2.464515, 1, 1, 1, 1, 1,
-1.25151, 0.7522032, -1.194809, 1, 1, 1, 1, 1,
-1.250522, 1.027865, -0.8595986, 1, 1, 1, 1, 1,
-1.246479, -0.2122259, -1.921767, 1, 1, 1, 1, 1,
-1.236706, 0.5149669, 0.8485377, 1, 1, 1, 1, 1,
-1.226632, -0.9666908, -1.786652, 1, 1, 1, 1, 1,
-1.220908, -0.7089852, -3.075137, 1, 1, 1, 1, 1,
-1.214115, -0.9606914, -1.983646, 1, 1, 1, 1, 1,
-1.21297, -0.7954311, -1.240699, 1, 1, 1, 1, 1,
-1.212122, 0.7658936, -1.095731, 1, 1, 1, 1, 1,
-1.210823, -0.314708, -0.9895574, 1, 1, 1, 1, 1,
-1.209125, 0.08016636, -1.105322, 1, 1, 1, 1, 1,
-1.203093, 0.4188498, -2.531144, 0, 0, 1, 1, 1,
-1.200194, -0.7280226, -1.401701, 1, 0, 0, 1, 1,
-1.19508, 1.859939, -0.4117329, 1, 0, 0, 1, 1,
-1.19235, -0.04113974, -1.322942, 1, 0, 0, 1, 1,
-1.182159, -1.758884, -2.203071, 1, 0, 0, 1, 1,
-1.176714, 1.124429, 0.5175041, 1, 0, 0, 1, 1,
-1.175504, 1.262124, -2.529423, 0, 0, 0, 1, 1,
-1.170467, 0.02791556, -1.85318, 0, 0, 0, 1, 1,
-1.169314, -1.158328, -1.296297, 0, 0, 0, 1, 1,
-1.161369, 1.703281, -1.784687, 0, 0, 0, 1, 1,
-1.156265, -0.7502608, -3.347023, 0, 0, 0, 1, 1,
-1.151184, 0.5277994, -1.872822, 0, 0, 0, 1, 1,
-1.144209, -0.1378494, -1.230035, 0, 0, 0, 1, 1,
-1.133647, -0.9216355, -3.706311, 1, 1, 1, 1, 1,
-1.129696, 0.01616314, -1.425363, 1, 1, 1, 1, 1,
-1.128267, 0.1471199, -1.508616, 1, 1, 1, 1, 1,
-1.123289, 0.5252921, -0.880138, 1, 1, 1, 1, 1,
-1.116447, 0.747846, -0.7450595, 1, 1, 1, 1, 1,
-1.116021, 0.06015589, 0.2262237, 1, 1, 1, 1, 1,
-1.111282, 0.08012953, -2.104594, 1, 1, 1, 1, 1,
-1.110527, 0.1879017, -2.007376, 1, 1, 1, 1, 1,
-1.099923, 0.2061788, -1.500464, 1, 1, 1, 1, 1,
-1.095958, 0.7587313, -0.6670848, 1, 1, 1, 1, 1,
-1.095727, 1.053199, -0.2182573, 1, 1, 1, 1, 1,
-1.095014, -0.06996915, -3.047206, 1, 1, 1, 1, 1,
-1.090366, -1.299467, -1.108489, 1, 1, 1, 1, 1,
-1.089315, -0.9655135, -2.857652, 1, 1, 1, 1, 1,
-1.088767, 0.08048954, -2.289973, 1, 1, 1, 1, 1,
-1.088602, -0.1068577, -0.3612981, 0, 0, 1, 1, 1,
-1.087231, 2.014939, -1.12064, 1, 0, 0, 1, 1,
-1.075654, -0.1260916, -3.64939, 1, 0, 0, 1, 1,
-1.070339, -1.057227, -0.9997371, 1, 0, 0, 1, 1,
-1.068974, -0.1655729, -2.729545, 1, 0, 0, 1, 1,
-1.064838, 0.7509653, -0.768378, 1, 0, 0, 1, 1,
-1.060889, -0.7085474, -3.830597, 0, 0, 0, 1, 1,
-1.059881, -0.7011895, -1.647009, 0, 0, 0, 1, 1,
-1.058014, 2.002876, -0.1280692, 0, 0, 0, 1, 1,
-1.056841, -0.2275093, -2.160662, 0, 0, 0, 1, 1,
-1.05556, 0.102102, -2.853734, 0, 0, 0, 1, 1,
-1.029306, 0.8300892, -1.607294, 0, 0, 0, 1, 1,
-1.028243, 0.6816015, -1.225618, 0, 0, 0, 1, 1,
-1.027547, 1.502462, -0.2373143, 1, 1, 1, 1, 1,
-1.018689, 0.6863941, -0.4666594, 1, 1, 1, 1, 1,
-1.007999, -0.6254677, -1.874663, 1, 1, 1, 1, 1,
-1.007902, 0.4545743, -1.71852, 1, 1, 1, 1, 1,
-1.005711, -0.2837939, -1.246701, 1, 1, 1, 1, 1,
-0.9977887, -0.312584, -1.537669, 1, 1, 1, 1, 1,
-0.9968178, 0.3542322, -0.4480107, 1, 1, 1, 1, 1,
-0.9954929, 0.5114605, -0.9635839, 1, 1, 1, 1, 1,
-0.9895643, -0.4260871, -0.3725864, 1, 1, 1, 1, 1,
-0.9839851, -0.3252214, -1.854004, 1, 1, 1, 1, 1,
-0.9746594, 0.1843244, -2.537927, 1, 1, 1, 1, 1,
-0.9661229, -1.081678, -3.232674, 1, 1, 1, 1, 1,
-0.9649105, -1.457467, -1.312724, 1, 1, 1, 1, 1,
-0.959274, -0.309595, -4.257694, 1, 1, 1, 1, 1,
-0.9451101, 1.038943, -0.2152807, 1, 1, 1, 1, 1,
-0.9342589, 0.1300314, -1.858171, 0, 0, 1, 1, 1,
-0.9318026, -0.1534141, -2.491804, 1, 0, 0, 1, 1,
-0.9305242, -0.185534, -1.353655, 1, 0, 0, 1, 1,
-0.9294169, 1.189402, -2.075386, 1, 0, 0, 1, 1,
-0.9285907, -1.766395, -2.421801, 1, 0, 0, 1, 1,
-0.9273356, -1.231535, -3.202642, 1, 0, 0, 1, 1,
-0.9260584, 0.5073229, -1.834599, 0, 0, 0, 1, 1,
-0.9225318, 0.6584469, -0.7886802, 0, 0, 0, 1, 1,
-0.9209614, 2.282823, -1.79671, 0, 0, 0, 1, 1,
-0.9136871, 0.07078023, -0.6988534, 0, 0, 0, 1, 1,
-0.9125965, -1.416381, -1.438507, 0, 0, 0, 1, 1,
-0.9030032, 0.9857394, -1.143943, 0, 0, 0, 1, 1,
-0.8986205, -0.05311925, -1.840286, 0, 0, 0, 1, 1,
-0.8971825, -0.2991247, -1.400398, 1, 1, 1, 1, 1,
-0.8925987, 0.5216721, -1.453002, 1, 1, 1, 1, 1,
-0.8890134, -0.1884607, -1.14522, 1, 1, 1, 1, 1,
-0.8818421, -1.505025, -3.117509, 1, 1, 1, 1, 1,
-0.8802748, 0.2935686, -0.7542982, 1, 1, 1, 1, 1,
-0.8660413, 0.6632803, -0.7582672, 1, 1, 1, 1, 1,
-0.8649166, -0.9070135, -2.684324, 1, 1, 1, 1, 1,
-0.8636304, -0.2068298, -2.099024, 1, 1, 1, 1, 1,
-0.8598118, -0.6107382, -3.125562, 1, 1, 1, 1, 1,
-0.8594746, 0.4683526, -1.715008, 1, 1, 1, 1, 1,
-0.8591197, 0.6336235, -1.769709, 1, 1, 1, 1, 1,
-0.8513943, -1.460668, -2.230843, 1, 1, 1, 1, 1,
-0.8506801, -1.288601, -1.809331, 1, 1, 1, 1, 1,
-0.8416367, 0.1246973, -1.515009, 1, 1, 1, 1, 1,
-0.8399059, -0.676848, -0.8177848, 1, 1, 1, 1, 1,
-0.8390762, -0.9482053, -2.317395, 0, 0, 1, 1, 1,
-0.8356424, 0.5328344, 0.42149, 1, 0, 0, 1, 1,
-0.8345391, -0.2888382, -1.488797, 1, 0, 0, 1, 1,
-0.830861, 0.20072, -1.674184, 1, 0, 0, 1, 1,
-0.8243284, -0.788669, -3.262761, 1, 0, 0, 1, 1,
-0.8237318, 1.244671, 1.156734, 1, 0, 0, 1, 1,
-0.8212247, 0.4820075, 0.6773199, 0, 0, 0, 1, 1,
-0.8185084, -0.4089866, -1.605518, 0, 0, 0, 1, 1,
-0.814549, -0.6522281, -0.5394861, 0, 0, 0, 1, 1,
-0.8132123, 1.031385, -0.48356, 0, 0, 0, 1, 1,
-0.8100268, 0.1495504, -1.801839, 0, 0, 0, 1, 1,
-0.8079197, -0.61177, -2.330083, 0, 0, 0, 1, 1,
-0.7958912, 0.4281387, -1.971317, 0, 0, 0, 1, 1,
-0.7956042, -1.78424, -3.957017, 1, 1, 1, 1, 1,
-0.7934787, -0.9141214, -1.942645, 1, 1, 1, 1, 1,
-0.7873086, -1.242287, -3.559104, 1, 1, 1, 1, 1,
-0.7861168, -0.3118344, -0.9210128, 1, 1, 1, 1, 1,
-0.7835099, -1.574975, -3.36931, 1, 1, 1, 1, 1,
-0.7799049, 0.6677632, -1.140993, 1, 1, 1, 1, 1,
-0.7793313, -1.179089, -2.416303, 1, 1, 1, 1, 1,
-0.7785957, -1.018914, -2.212002, 1, 1, 1, 1, 1,
-0.7761503, -0.586251, -2.336811, 1, 1, 1, 1, 1,
-0.771336, 0.5196387, -2.880748, 1, 1, 1, 1, 1,
-0.770749, 0.9929854, 0.6836394, 1, 1, 1, 1, 1,
-0.7674437, 0.6925997, -0.7890139, 1, 1, 1, 1, 1,
-0.7667341, 1.3356, 0.9908779, 1, 1, 1, 1, 1,
-0.7594154, 0.7815483, -2.2115, 1, 1, 1, 1, 1,
-0.7575225, 0.342684, 0.1150415, 1, 1, 1, 1, 1,
-0.7504401, -0.9288707, -1.420528, 0, 0, 1, 1, 1,
-0.7484478, 0.3592225, 0.165825, 1, 0, 0, 1, 1,
-0.7457363, -2.070029, -2.737578, 1, 0, 0, 1, 1,
-0.7456806, 0.4850901, -1.550167, 1, 0, 0, 1, 1,
-0.7453038, 0.9175371, -1.439924, 1, 0, 0, 1, 1,
-0.7443182, -1.02018, -1.711295, 1, 0, 0, 1, 1,
-0.7442013, -1.223596, -2.650454, 0, 0, 0, 1, 1,
-0.7417808, 0.0662232, -0.8745993, 0, 0, 0, 1, 1,
-0.7402323, 2.283247, -0.5853217, 0, 0, 0, 1, 1,
-0.7313564, -0.3295443, -3.111544, 0, 0, 0, 1, 1,
-0.7298188, 0.2890157, -2.743864, 0, 0, 0, 1, 1,
-0.7231901, -0.4340221, -1.368586, 0, 0, 0, 1, 1,
-0.7213508, 0.6055448, -0.5856797, 0, 0, 0, 1, 1,
-0.7179178, -1.383644, -2.4967, 1, 1, 1, 1, 1,
-0.7167242, 0.7742413, -1.08801, 1, 1, 1, 1, 1,
-0.715699, 1.210404, 0.6299661, 1, 1, 1, 1, 1,
-0.7146778, 1.014823, -1.437973, 1, 1, 1, 1, 1,
-0.7141435, 0.6462787, -0.5277959, 1, 1, 1, 1, 1,
-0.7100588, 0.4642578, -2.103118, 1, 1, 1, 1, 1,
-0.7071375, 1.565883, -1.307683, 1, 1, 1, 1, 1,
-0.7070513, 0.4696375, -1.03297, 1, 1, 1, 1, 1,
-0.704736, -0.6165509, -2.034025, 1, 1, 1, 1, 1,
-0.703154, 0.3928672, -0.6838573, 1, 1, 1, 1, 1,
-0.701964, -1.054698, -0.9927411, 1, 1, 1, 1, 1,
-0.7018024, 0.6592996, -0.469072, 1, 1, 1, 1, 1,
-0.6985192, 0.0681854, -4.513065, 1, 1, 1, 1, 1,
-0.6954943, 1.030619, -0.2533191, 1, 1, 1, 1, 1,
-0.6951525, 0.2298498, 0.5813382, 1, 1, 1, 1, 1,
-0.693391, 0.7676728, -2.069243, 0, 0, 1, 1, 1,
-0.6931225, -0.5717771, -1.622722, 1, 0, 0, 1, 1,
-0.6856511, -0.6333933, -0.8588969, 1, 0, 0, 1, 1,
-0.6815102, 0.6139968, 0.9103233, 1, 0, 0, 1, 1,
-0.6800351, -1.222614, -3.083881, 1, 0, 0, 1, 1,
-0.677951, 0.9745325, -2.016255, 1, 0, 0, 1, 1,
-0.6773701, -0.5529933, -2.665418, 0, 0, 0, 1, 1,
-0.675917, -1.23994, -3.597161, 0, 0, 0, 1, 1,
-0.6708725, -0.7186053, -1.978929, 0, 0, 0, 1, 1,
-0.670058, 0.02619887, -1.927999, 0, 0, 0, 1, 1,
-0.6592373, -1.121301, -1.708398, 0, 0, 0, 1, 1,
-0.6533656, 0.379807, 1.014701, 0, 0, 0, 1, 1,
-0.6515087, -1.232004, -1.919894, 0, 0, 0, 1, 1,
-0.6513526, -1.040675, -2.293638, 1, 1, 1, 1, 1,
-0.6505507, 0.3228567, -0.3925105, 1, 1, 1, 1, 1,
-0.6453311, -1.447246, -3.591914, 1, 1, 1, 1, 1,
-0.6426665, -1.297464, -3.204222, 1, 1, 1, 1, 1,
-0.6377346, 0.06395093, -2.175497, 1, 1, 1, 1, 1,
-0.6361954, 1.478562, -0.8091649, 1, 1, 1, 1, 1,
-0.6359771, 1.355829, -1.114256, 1, 1, 1, 1, 1,
-0.6345328, -0.5415156, -2.65402, 1, 1, 1, 1, 1,
-0.6277967, 0.4596733, -0.5571215, 1, 1, 1, 1, 1,
-0.6250742, 0.4458398, -1.354511, 1, 1, 1, 1, 1,
-0.6250116, 1.650912, -1.53864, 1, 1, 1, 1, 1,
-0.6247299, 0.1853254, -0.5703266, 1, 1, 1, 1, 1,
-0.6244776, 0.9331282, -1.767782, 1, 1, 1, 1, 1,
-0.6232015, -0.07927035, -3.701364, 1, 1, 1, 1, 1,
-0.6213832, 0.1453964, -2.496132, 1, 1, 1, 1, 1,
-0.6138576, 1.221319, -0.3714703, 0, 0, 1, 1, 1,
-0.612577, 1.042162, 0.1119873, 1, 0, 0, 1, 1,
-0.6069816, 0.4124276, 0.2973289, 1, 0, 0, 1, 1,
-0.6061597, -0.3099385, -1.341203, 1, 0, 0, 1, 1,
-0.6023058, 1.280084, -1.710171, 1, 0, 0, 1, 1,
-0.5944795, 0.02894525, -0.080805, 1, 0, 0, 1, 1,
-0.5911726, 1.586012, -1.061619, 0, 0, 0, 1, 1,
-0.589255, 0.6439387, -1.428618, 0, 0, 0, 1, 1,
-0.5887732, 0.1336177, -1.048756, 0, 0, 0, 1, 1,
-0.5854838, -0.006576137, -2.042974, 0, 0, 0, 1, 1,
-0.5806534, 1.150989, 0.8342909, 0, 0, 0, 1, 1,
-0.5805604, -1.013438, -1.87603, 0, 0, 0, 1, 1,
-0.5751917, -0.5574005, -0.658444, 0, 0, 0, 1, 1,
-0.57388, -1.27973, -1.869023, 1, 1, 1, 1, 1,
-0.5717201, 1.834043, -0.2157105, 1, 1, 1, 1, 1,
-0.5613574, -2.151382, -0.7522, 1, 1, 1, 1, 1,
-0.560728, 0.06029524, -1.14295, 1, 1, 1, 1, 1,
-0.5599231, 0.4588819, -0.2337049, 1, 1, 1, 1, 1,
-0.5571235, -0.4350452, -2.767699, 1, 1, 1, 1, 1,
-0.5568082, -0.5975385, -4.560637, 1, 1, 1, 1, 1,
-0.5542085, 1.504839, -0.9754264, 1, 1, 1, 1, 1,
-0.5535928, 0.3815338, -0.9993203, 1, 1, 1, 1, 1,
-0.5525653, -0.3471231, -1.069953, 1, 1, 1, 1, 1,
-0.5507742, -0.2165053, -2.176733, 1, 1, 1, 1, 1,
-0.5497901, -0.1346587, -1.629055, 1, 1, 1, 1, 1,
-0.549286, -0.6939453, -2.214145, 1, 1, 1, 1, 1,
-0.5484812, 1.279487, 0.2949079, 1, 1, 1, 1, 1,
-0.5482842, 0.4791381, 0.1944996, 1, 1, 1, 1, 1,
-0.54695, 0.6234375, -0.9680251, 0, 0, 1, 1, 1,
-0.5446247, -1.414213, -1.832742, 1, 0, 0, 1, 1,
-0.5436206, 0.5761406, -2.05383, 1, 0, 0, 1, 1,
-0.540346, 1.25501, -1.004263, 1, 0, 0, 1, 1,
-0.539707, 0.7733545, -0.3086052, 1, 0, 0, 1, 1,
-0.5393174, 0.01186849, -0.360805, 1, 0, 0, 1, 1,
-0.5344365, 0.630863, -1.321872, 0, 0, 0, 1, 1,
-0.5333329, 1.242039, -0.6081323, 0, 0, 0, 1, 1,
-0.5284183, -0.2446866, -1.91925, 0, 0, 0, 1, 1,
-0.5280917, -0.5461054, -1.974918, 0, 0, 0, 1, 1,
-0.525847, -1.621521, -4.010029, 0, 0, 0, 1, 1,
-0.5249934, 0.0867593, -1.713308, 0, 0, 0, 1, 1,
-0.524426, -2.449441, -2.859949, 0, 0, 0, 1, 1,
-0.5226638, 0.5980613, -2.399859, 1, 1, 1, 1, 1,
-0.5115188, -1.725117, -2.842767, 1, 1, 1, 1, 1,
-0.5086329, -0.09854197, -3.582967, 1, 1, 1, 1, 1,
-0.5054052, -0.5822401, -2.390418, 1, 1, 1, 1, 1,
-0.5044217, -0.1368767, -2.299628, 1, 1, 1, 1, 1,
-0.4925271, -1.721507, -0.8160019, 1, 1, 1, 1, 1,
-0.4887761, 1.50769, 0.1160406, 1, 1, 1, 1, 1,
-0.483349, -0.1776412, -1.251687, 1, 1, 1, 1, 1,
-0.4813896, -0.07733806, -1.785229, 1, 1, 1, 1, 1,
-0.4803888, 0.0585169, -1.19624, 1, 1, 1, 1, 1,
-0.4791819, -0.9269796, -2.414583, 1, 1, 1, 1, 1,
-0.4791748, 0.4514112, -1.207496, 1, 1, 1, 1, 1,
-0.4761367, 1.268797, -1.188367, 1, 1, 1, 1, 1,
-0.475086, -0.5195023, -4.150952, 1, 1, 1, 1, 1,
-0.4736955, 0.08204187, -2.066942, 1, 1, 1, 1, 1,
-0.4700528, 1.400056, 0.3389055, 0, 0, 1, 1, 1,
-0.4651123, 0.8591012, -0.03322325, 1, 0, 0, 1, 1,
-0.4629845, -0.8852163, -3.099934, 1, 0, 0, 1, 1,
-0.4519719, -0.06356423, -1.366469, 1, 0, 0, 1, 1,
-0.4504507, -1.947957, -2.819003, 1, 0, 0, 1, 1,
-0.4482126, -0.06059586, -0.02724417, 1, 0, 0, 1, 1,
-0.4445012, -1.122592, -4.32397, 0, 0, 0, 1, 1,
-0.4433501, 0.004154536, -2.535467, 0, 0, 0, 1, 1,
-0.4405821, 2.244054, 0.9603618, 0, 0, 0, 1, 1,
-0.439879, 0.2066579, -3.016428, 0, 0, 0, 1, 1,
-0.4367099, 0.6121982, 0.3230504, 0, 0, 0, 1, 1,
-0.4328531, -0.9490832, -2.60083, 0, 0, 0, 1, 1,
-0.4290657, 1.598115, -1.043068, 0, 0, 0, 1, 1,
-0.4271125, 0.4019618, -1.766282, 1, 1, 1, 1, 1,
-0.4247457, 0.501698, -1.39119, 1, 1, 1, 1, 1,
-0.4236915, -0.6970653, -1.889861, 1, 1, 1, 1, 1,
-0.4199791, -0.402196, -1.647001, 1, 1, 1, 1, 1,
-0.4193277, -0.4689091, -2.380997, 1, 1, 1, 1, 1,
-0.4150906, 0.6833647, -1.483896, 1, 1, 1, 1, 1,
-0.4100423, -0.3077019, -3.119848, 1, 1, 1, 1, 1,
-0.4095839, -0.3483672, -2.880693, 1, 1, 1, 1, 1,
-0.4088796, 0.8226783, -1.375573, 1, 1, 1, 1, 1,
-0.4066925, -0.7122159, -1.714904, 1, 1, 1, 1, 1,
-0.4022867, -0.4398573, -5.004535, 1, 1, 1, 1, 1,
-0.4008635, -0.2203664, 0.7715481, 1, 1, 1, 1, 1,
-0.397131, 2.008387, -0.4556005, 1, 1, 1, 1, 1,
-0.3966629, -0.6669186, -2.267668, 1, 1, 1, 1, 1,
-0.3942942, 1.608323, 1.33706, 1, 1, 1, 1, 1,
-0.3936018, -0.05048357, -2.987931, 0, 0, 1, 1, 1,
-0.3908172, -0.8853573, -1.679505, 1, 0, 0, 1, 1,
-0.3889912, -0.3258791, -3.055091, 1, 0, 0, 1, 1,
-0.3860265, -0.4620242, -1.128966, 1, 0, 0, 1, 1,
-0.38597, 0.07609254, -0.5841011, 1, 0, 0, 1, 1,
-0.3844602, -0.9062595, -2.630033, 1, 0, 0, 1, 1,
-0.3826495, -0.5182526, -3.587997, 0, 0, 0, 1, 1,
-0.3782936, -0.06923543, -0.1999338, 0, 0, 0, 1, 1,
-0.3773265, 1.167445, -0.9093795, 0, 0, 0, 1, 1,
-0.3756555, -1.489347, -3.117416, 0, 0, 0, 1, 1,
-0.3742868, -1.058689, -3.031086, 0, 0, 0, 1, 1,
-0.373161, -1.349311, -3.837461, 0, 0, 0, 1, 1,
-0.3706765, -0.06532076, -1.474058, 0, 0, 0, 1, 1,
-0.3623473, 1.001303, -0.2361218, 1, 1, 1, 1, 1,
-0.3617761, -1.061292, -2.660029, 1, 1, 1, 1, 1,
-0.3615506, 1.649158, 0.5648963, 1, 1, 1, 1, 1,
-0.3590581, 0.5118025, -0.6376532, 1, 1, 1, 1, 1,
-0.3573798, 0.9729369, -1.054688, 1, 1, 1, 1, 1,
-0.3548161, 0.9399397, -1.636654, 1, 1, 1, 1, 1,
-0.3542487, 1.670394, 1.153522, 1, 1, 1, 1, 1,
-0.3517528, 0.01286711, -2.448661, 1, 1, 1, 1, 1,
-0.3499318, -1.001867, -3.309239, 1, 1, 1, 1, 1,
-0.3497044, 0.1964965, -0.4785011, 1, 1, 1, 1, 1,
-0.3434303, 0.4130737, 0.4451782, 1, 1, 1, 1, 1,
-0.3406036, -0.03356776, -1.655204, 1, 1, 1, 1, 1,
-0.3363163, 0.7103049, -1.943693, 1, 1, 1, 1, 1,
-0.3348356, -1.098729, -3.53852, 1, 1, 1, 1, 1,
-0.3341597, -0.8420837, -2.971946, 1, 1, 1, 1, 1,
-0.3338706, -1.40442, -2.961471, 0, 0, 1, 1, 1,
-0.3313459, -0.8394063, -3.302824, 1, 0, 0, 1, 1,
-0.3263756, 0.8049743, 1.050614, 1, 0, 0, 1, 1,
-0.3250807, 0.3271796, -0.5105441, 1, 0, 0, 1, 1,
-0.3168542, 0.9482679, 0.1301287, 1, 0, 0, 1, 1,
-0.3108234, -1.088146, -2.277515, 1, 0, 0, 1, 1,
-0.3098505, 0.7075592, -1.362113, 0, 0, 0, 1, 1,
-0.307786, -0.657357, -1.877242, 0, 0, 0, 1, 1,
-0.2989086, -0.1463915, -3.795522, 0, 0, 0, 1, 1,
-0.2977763, -1.540883, -5.641552, 0, 0, 0, 1, 1,
-0.2972856, -0.2816919, -3.383275, 0, 0, 0, 1, 1,
-0.2935414, -0.01639794, -0.1115768, 0, 0, 0, 1, 1,
-0.2927527, 1.642624, 0.3330459, 0, 0, 0, 1, 1,
-0.2923532, 0.8760256, -1.315888, 1, 1, 1, 1, 1,
-0.2884133, 0.4948927, -1.691929, 1, 1, 1, 1, 1,
-0.2863996, 0.1380153, -1.725448, 1, 1, 1, 1, 1,
-0.2819864, 1.067088, -0.2869769, 1, 1, 1, 1, 1,
-0.2795894, 0.1102428, 0.8804949, 1, 1, 1, 1, 1,
-0.2790511, 0.2053929, -0.9199761, 1, 1, 1, 1, 1,
-0.2763324, -1.010302, -2.041246, 1, 1, 1, 1, 1,
-0.2735792, 0.3724917, -0.08281891, 1, 1, 1, 1, 1,
-0.2730088, 0.9604104, -0.09093585, 1, 1, 1, 1, 1,
-0.270695, -1.075539, -5.57923, 1, 1, 1, 1, 1,
-0.2698629, 0.740057, 0.3938398, 1, 1, 1, 1, 1,
-0.2688696, -0.3759112, -3.633908, 1, 1, 1, 1, 1,
-0.2666107, 1.317353, 0.03713208, 1, 1, 1, 1, 1,
-0.2646081, -0.6395651, -1.620567, 1, 1, 1, 1, 1,
-0.2620113, 0.2196023, -1.990479, 1, 1, 1, 1, 1,
-0.2591564, 1.388234, -0.7734656, 0, 0, 1, 1, 1,
-0.2578515, -0.9114094, -4.313869, 1, 0, 0, 1, 1,
-0.2565732, -1.314001, -3.137721, 1, 0, 0, 1, 1,
-0.2527096, -0.5452627, -2.291204, 1, 0, 0, 1, 1,
-0.2457858, 1.659233, -0.782559, 1, 0, 0, 1, 1,
-0.2417553, -0.4275521, -1.130173, 1, 0, 0, 1, 1,
-0.2396233, -1.108732, -2.238464, 0, 0, 0, 1, 1,
-0.235021, 0.3590264, -0.6377912, 0, 0, 0, 1, 1,
-0.232287, 0.7704045, -0.6390696, 0, 0, 0, 1, 1,
-0.2320573, -1.135781, -2.314562, 0, 0, 0, 1, 1,
-0.229593, -2.051534, -2.557505, 0, 0, 0, 1, 1,
-0.2250775, -0.6494369, -4.538068, 0, 0, 0, 1, 1,
-0.2226311, -0.1896779, -4.372454, 0, 0, 0, 1, 1,
-0.2194257, 0.2399968, -0.7497582, 1, 1, 1, 1, 1,
-0.2186447, -1.176062, -3.695703, 1, 1, 1, 1, 1,
-0.214769, -1.551871, -4.645612, 1, 1, 1, 1, 1,
-0.2130378, -0.1797107, -2.963698, 1, 1, 1, 1, 1,
-0.2117182, 1.116591, 0.3315496, 1, 1, 1, 1, 1,
-0.2057816, 0.9346402, -1.069085, 1, 1, 1, 1, 1,
-0.2042544, 0.3869106, -0.3773977, 1, 1, 1, 1, 1,
-0.2019759, -0.8068622, -1.413957, 1, 1, 1, 1, 1,
-0.18892, -0.2762715, -3.329324, 1, 1, 1, 1, 1,
-0.1824377, 0.6400381, -1.045722, 1, 1, 1, 1, 1,
-0.1814641, 1.475642, -2.263404, 1, 1, 1, 1, 1,
-0.1810025, -0.3627385, -0.3391463, 1, 1, 1, 1, 1,
-0.1774399, -0.02113237, -1.67882, 1, 1, 1, 1, 1,
-0.1760973, -0.6575678, -3.614682, 1, 1, 1, 1, 1,
-0.1760143, 2.109621, -1.524796, 1, 1, 1, 1, 1,
-0.1753567, 0.03174253, -2.27844, 0, 0, 1, 1, 1,
-0.1741974, -2.190831, -2.819128, 1, 0, 0, 1, 1,
-0.1707623, 1.777169, -0.5920407, 1, 0, 0, 1, 1,
-0.1684159, 0.584174, 0.244978, 1, 0, 0, 1, 1,
-0.1641125, 0.1024571, -0.8107077, 1, 0, 0, 1, 1,
-0.163483, 0.2322526, -0.327549, 1, 0, 0, 1, 1,
-0.1623432, 2.220381, -0.9830042, 0, 0, 0, 1, 1,
-0.160237, -0.2559528, -1.46828, 0, 0, 0, 1, 1,
-0.1596283, 1.213779, -1.079771, 0, 0, 0, 1, 1,
-0.1581142, 1.48377, -0.3610495, 0, 0, 0, 1, 1,
-0.1470636, 0.7566649, -1.15118, 0, 0, 0, 1, 1,
-0.1466152, 0.7185445, -1.186161, 0, 0, 0, 1, 1,
-0.144252, 0.5267126, -0.4034654, 0, 0, 0, 1, 1,
-0.139191, 0.8674726, 0.5907724, 1, 1, 1, 1, 1,
-0.1214624, -0.2269852, -2.917246, 1, 1, 1, 1, 1,
-0.1202863, 1.714316, 0.1882661, 1, 1, 1, 1, 1,
-0.1201499, -0.0591027, -2.020555, 1, 1, 1, 1, 1,
-0.1150865, -0.4316903, -1.50659, 1, 1, 1, 1, 1,
-0.113826, 0.7280686, -0.6952001, 1, 1, 1, 1, 1,
-0.1108417, -1.762436, -3.771449, 1, 1, 1, 1, 1,
-0.1041888, 0.05835387, -2.33336, 1, 1, 1, 1, 1,
-0.0956645, -1.205496, -3.200638, 1, 1, 1, 1, 1,
-0.09144954, -1.182572, -4.280569, 1, 1, 1, 1, 1,
-0.08905617, -0.02902592, -1.800981, 1, 1, 1, 1, 1,
-0.08773474, 0.09472965, -0.5811462, 1, 1, 1, 1, 1,
-0.08306273, -1.266397, -3.348742, 1, 1, 1, 1, 1,
-0.08086554, -0.6549829, -3.401065, 1, 1, 1, 1, 1,
-0.08031109, 0.2996912, 1.035053, 1, 1, 1, 1, 1,
-0.07978965, -2.206265, -2.666711, 0, 0, 1, 1, 1,
-0.07885697, -0.8553542, -4.342093, 1, 0, 0, 1, 1,
-0.07420568, 0.2838899, -0.2190972, 1, 0, 0, 1, 1,
-0.07305573, 1.35273, -0.9244694, 1, 0, 0, 1, 1,
-0.06419664, 0.7086582, -0.4372363, 1, 0, 0, 1, 1,
-0.06066058, -0.6455732, -4.086896, 1, 0, 0, 1, 1,
-0.06037315, 0.2983071, 0.8333782, 0, 0, 0, 1, 1,
-0.0591004, -0.6882908, -2.887104, 0, 0, 0, 1, 1,
-0.05834485, 0.1913139, -0.1209152, 0, 0, 0, 1, 1,
-0.05790753, 0.8437473, -0.4222747, 0, 0, 0, 1, 1,
-0.05686738, -0.1034598, -2.765624, 0, 0, 0, 1, 1,
-0.05598612, 1.873283, -0.07509542, 0, 0, 0, 1, 1,
-0.05491462, 0.289359, -0.6341531, 0, 0, 0, 1, 1,
-0.04463454, -0.4699577, -2.452774, 1, 1, 1, 1, 1,
-0.04417058, -1.14195, -1.274283, 1, 1, 1, 1, 1,
-0.04278516, -0.8297395, -3.755981, 1, 1, 1, 1, 1,
-0.03444044, -0.7643836, -3.174226, 1, 1, 1, 1, 1,
-0.02953623, -0.05315425, -3.734246, 1, 1, 1, 1, 1,
-0.02908721, 0.009451902, -0.24218, 1, 1, 1, 1, 1,
-0.02751075, 1.357695, -0.4075215, 1, 1, 1, 1, 1,
-0.02507896, -1.759803, -2.832623, 1, 1, 1, 1, 1,
-0.02138791, 0.03619272, -0.1874901, 1, 1, 1, 1, 1,
-0.01852361, 1.16951, -0.6261536, 1, 1, 1, 1, 1,
-0.01081943, 1.586433, 0.7242031, 1, 1, 1, 1, 1,
-0.01067191, 0.02600965, -1.8532, 1, 1, 1, 1, 1,
-0.009201757, 0.1225653, 1.547259, 1, 1, 1, 1, 1,
-0.004996392, -1.579908, -3.370284, 1, 1, 1, 1, 1,
-0.0001551415, 0.7629361, -1.047343, 1, 1, 1, 1, 1,
0.001299322, 0.09487984, 0.2429319, 0, 0, 1, 1, 1,
0.01015673, -0.71791, 4.158761, 1, 0, 0, 1, 1,
0.01162639, -1.674776, 3.263916, 1, 0, 0, 1, 1,
0.01188055, 1.992312, 1.394999, 1, 0, 0, 1, 1,
0.01363736, 0.7874414, 0.6039789, 1, 0, 0, 1, 1,
0.01494488, -0.9656587, 3.503332, 1, 0, 0, 1, 1,
0.01784642, -1.582749, 4.319725, 0, 0, 0, 1, 1,
0.01823844, -0.1118015, 3.234424, 0, 0, 0, 1, 1,
0.02829639, -0.7998698, 1.030433, 0, 0, 0, 1, 1,
0.02833598, -0.5480168, 3.125904, 0, 0, 0, 1, 1,
0.0298935, -0.1774664, 2.376928, 0, 0, 0, 1, 1,
0.03273491, 1.199956, -1.425542, 0, 0, 0, 1, 1,
0.03555707, 1.871466, -0.06537244, 0, 0, 0, 1, 1,
0.03803749, 1.672771, 0.690672, 1, 1, 1, 1, 1,
0.04058735, -0.06321507, 2.192107, 1, 1, 1, 1, 1,
0.04403063, 0.04784605, 1.876538, 1, 1, 1, 1, 1,
0.04748776, -0.4273931, 1.813876, 1, 1, 1, 1, 1,
0.0482394, 0.4422002, -0.5322908, 1, 1, 1, 1, 1,
0.0486993, -0.7084942, 3.172037, 1, 1, 1, 1, 1,
0.05199715, 0.1088011, 1.805294, 1, 1, 1, 1, 1,
0.05710967, -1.5502, 1.791573, 1, 1, 1, 1, 1,
0.05843554, 0.2269592, 0.3906146, 1, 1, 1, 1, 1,
0.05938823, -1.100754, 2.206892, 1, 1, 1, 1, 1,
0.05991143, -0.06642111, 1.759013, 1, 1, 1, 1, 1,
0.07157145, -0.5279438, 3.667969, 1, 1, 1, 1, 1,
0.07295214, 0.7646305, -0.6851473, 1, 1, 1, 1, 1,
0.07362894, -0.6282116, 3.573022, 1, 1, 1, 1, 1,
0.0745189, 0.2482094, 0.5636901, 1, 1, 1, 1, 1,
0.07830986, -2.505257, 1.36933, 0, 0, 1, 1, 1,
0.07908221, -0.6156369, 2.486256, 1, 0, 0, 1, 1,
0.08209203, -0.7003065, 2.972864, 1, 0, 0, 1, 1,
0.08885925, 2.101718, 0.7039624, 1, 0, 0, 1, 1,
0.09179854, 0.100204, 1.3373, 1, 0, 0, 1, 1,
0.09261876, 0.3381521, -1.553906, 1, 0, 0, 1, 1,
0.09614462, 6.000616e-05, 3.322052, 0, 0, 0, 1, 1,
0.09698749, 0.4295575, 1.305092, 0, 0, 0, 1, 1,
0.0995059, -0.7715588, 2.978934, 0, 0, 0, 1, 1,
0.104541, -0.6336291, 2.823682, 0, 0, 0, 1, 1,
0.1102482, 1.282148, 0.6230617, 0, 0, 0, 1, 1,
0.1114906, -0.7644985, 2.447156, 0, 0, 0, 1, 1,
0.1125472, 1.013918, 0.4203643, 0, 0, 0, 1, 1,
0.113084, 0.8216316, 0.9337796, 1, 1, 1, 1, 1,
0.1274485, -0.8038546, 2.740861, 1, 1, 1, 1, 1,
0.1302166, 0.9041245, -0.5335547, 1, 1, 1, 1, 1,
0.1318702, 0.7858793, 0.3432052, 1, 1, 1, 1, 1,
0.1342426, -0.6517877, 2.22674, 1, 1, 1, 1, 1,
0.140833, 1.76781, 0.6314602, 1, 1, 1, 1, 1,
0.1421384, -1.126859, 1.118879, 1, 1, 1, 1, 1,
0.1432576, 0.447328, -0.1787599, 1, 1, 1, 1, 1,
0.1474338, 1.403265, 0.961364, 1, 1, 1, 1, 1,
0.1505557, -1.657206, 3.716332, 1, 1, 1, 1, 1,
0.1523555, -0.5598581, 3.125, 1, 1, 1, 1, 1,
0.15677, 0.4234286, 0.189087, 1, 1, 1, 1, 1,
0.1577202, -0.1242653, 2.160686, 1, 1, 1, 1, 1,
0.1595032, 0.2411443, 0.09306566, 1, 1, 1, 1, 1,
0.1596965, 0.2793453, 0.2087919, 1, 1, 1, 1, 1,
0.1626751, 0.02935701, 2.09735, 0, 0, 1, 1, 1,
0.1626976, -0.5359104, 2.161607, 1, 0, 0, 1, 1,
0.1676599, -1.923639, 3.043508, 1, 0, 0, 1, 1,
0.1716427, -1.328919, 2.87594, 1, 0, 0, 1, 1,
0.1725162, 0.7414987, -0.06484166, 1, 0, 0, 1, 1,
0.1803059, -0.3455627, 3.341966, 1, 0, 0, 1, 1,
0.1813859, 1.649505, 0.8265632, 0, 0, 0, 1, 1,
0.1849035, 0.5499223, -0.6628726, 0, 0, 0, 1, 1,
0.1907088, 1.035991, -0.4989538, 0, 0, 0, 1, 1,
0.1972931, -0.1025379, 0.9447502, 0, 0, 0, 1, 1,
0.199029, -0.04417846, 2.423944, 0, 0, 0, 1, 1,
0.1996649, 0.784143, 0.428131, 0, 0, 0, 1, 1,
0.2105853, -1.847216, 1.014876, 0, 0, 0, 1, 1,
0.2107517, -1.921801, 3.092134, 1, 1, 1, 1, 1,
0.2125677, 0.5925654, -0.8825719, 1, 1, 1, 1, 1,
0.2126279, -0.5767875, 3.872277, 1, 1, 1, 1, 1,
0.2127441, 0.7987185, 0.07916553, 1, 1, 1, 1, 1,
0.2137056, -0.5623853, 3.767665, 1, 1, 1, 1, 1,
0.214196, -0.6713067, 1.765159, 1, 1, 1, 1, 1,
0.2186852, 0.3691167, 0.637366, 1, 1, 1, 1, 1,
0.2187082, -0.2562647, 2.472769, 1, 1, 1, 1, 1,
0.2200985, 1.460066, 0.4193175, 1, 1, 1, 1, 1,
0.2208312, -1.148197, 1.330338, 1, 1, 1, 1, 1,
0.2214041, 1.598763, 0.4390704, 1, 1, 1, 1, 1,
0.2245107, 2.094732, 0.2711604, 1, 1, 1, 1, 1,
0.2291639, -1.500842, 1.685455, 1, 1, 1, 1, 1,
0.2310091, 0.4140391, 1.321888, 1, 1, 1, 1, 1,
0.2342736, 0.09105539, 1.526609, 1, 1, 1, 1, 1,
0.2349332, 0.1860113, 1.441998, 0, 0, 1, 1, 1,
0.2376165, -0.1053215, 1.237687, 1, 0, 0, 1, 1,
0.2379771, -1.647366, 2.569323, 1, 0, 0, 1, 1,
0.2381182, 0.1642141, -0.004663846, 1, 0, 0, 1, 1,
0.2400199, -0.5102664, 0.999549, 1, 0, 0, 1, 1,
0.24849, 1.092633, -1.14026, 1, 0, 0, 1, 1,
0.2490641, 0.8409193, 0.3743398, 0, 0, 0, 1, 1,
0.2498131, 0.4693774, -0.4176136, 0, 0, 0, 1, 1,
0.2535152, -1.268741, 2.342815, 0, 0, 0, 1, 1,
0.2552137, 1.280691, -0.4376531, 0, 0, 0, 1, 1,
0.2594391, -0.8255558, 1.85514, 0, 0, 0, 1, 1,
0.2621406, 1.118167, 1.311953, 0, 0, 0, 1, 1,
0.2742058, 0.8134546, -0.1573622, 0, 0, 0, 1, 1,
0.2744147, 0.07174921, 1.773873, 1, 1, 1, 1, 1,
0.2748747, 0.2294287, 1.830761, 1, 1, 1, 1, 1,
0.2760662, 1.31717, 0.4657679, 1, 1, 1, 1, 1,
0.2801189, -0.5829923, 3.130198, 1, 1, 1, 1, 1,
0.2801792, 0.9006832, 0.7089961, 1, 1, 1, 1, 1,
0.2820418, 1.108339, -0.5431982, 1, 1, 1, 1, 1,
0.2881925, -0.9360425, 1.909032, 1, 1, 1, 1, 1,
0.2912454, -0.9906369, 2.3656, 1, 1, 1, 1, 1,
0.2934354, -0.825948, 1.300872, 1, 1, 1, 1, 1,
0.2956333, 0.09675846, 1.46806, 1, 1, 1, 1, 1,
0.2958996, 0.8974343, 0.011689, 1, 1, 1, 1, 1,
0.2961453, 0.307984, 1.153007, 1, 1, 1, 1, 1,
0.3033512, 2.013838, -2.662926, 1, 1, 1, 1, 1,
0.3080069, 0.730011, 2.114086, 1, 1, 1, 1, 1,
0.3106547, -0.6307151, 2.022161, 1, 1, 1, 1, 1,
0.3163944, 0.2835955, 0.2835705, 0, 0, 1, 1, 1,
0.3182608, 1.986595, 1.301571, 1, 0, 0, 1, 1,
0.3198702, 0.8221314, -0.6794922, 1, 0, 0, 1, 1,
0.3206637, -1.65583, 3.487767, 1, 0, 0, 1, 1,
0.3226191, -0.1842487, 1.392645, 1, 0, 0, 1, 1,
0.3226659, 1.811173, 1.600844, 1, 0, 0, 1, 1,
0.3246507, 0.210895, 1.231241, 0, 0, 0, 1, 1,
0.3255156, 0.05284772, 1.403722, 0, 0, 0, 1, 1,
0.3283496, -1.306668, 3.331123, 0, 0, 0, 1, 1,
0.3295603, -2.458329, 3.203891, 0, 0, 0, 1, 1,
0.3297459, 1.095744, 0.1797543, 0, 0, 0, 1, 1,
0.3298147, -0.3908889, 1.590867, 0, 0, 0, 1, 1,
0.330729, -0.6011569, 1.05363, 0, 0, 0, 1, 1,
0.3347253, -1.447866, 3.016654, 1, 1, 1, 1, 1,
0.3375017, -0.03393632, 2.909436, 1, 1, 1, 1, 1,
0.3375202, -0.3934872, 3.586074, 1, 1, 1, 1, 1,
0.3403258, -0.5203668, 3.032583, 1, 1, 1, 1, 1,
0.3405522, 1.896394, -0.8402588, 1, 1, 1, 1, 1,
0.3425596, 0.6085876, 1.768255, 1, 1, 1, 1, 1,
0.3506368, 1.99542, 0.8190465, 1, 1, 1, 1, 1,
0.3548376, 3.417705, 1.275645, 1, 1, 1, 1, 1,
0.3587781, 0.3398023, 1.80577, 1, 1, 1, 1, 1,
0.3657967, -0.3673781, 2.043547, 1, 1, 1, 1, 1,
0.3658435, -1.142945, 2.057954, 1, 1, 1, 1, 1,
0.3659127, -0.5748085, 0.8799778, 1, 1, 1, 1, 1,
0.3660399, 1.716849, 1.256748, 1, 1, 1, 1, 1,
0.3664678, 1.84746, 0.1589639, 1, 1, 1, 1, 1,
0.3712005, 0.008844286, 2.564083, 1, 1, 1, 1, 1,
0.3734114, -0.132389, 0.5864695, 0, 0, 1, 1, 1,
0.3772682, -1.301095, 3.234213, 1, 0, 0, 1, 1,
0.3791791, -0.6022533, 0.1644947, 1, 0, 0, 1, 1,
0.3823845, 0.2964807, 1.468178, 1, 0, 0, 1, 1,
0.3827983, -0.4364755, 2.582001, 1, 0, 0, 1, 1,
0.3895491, -0.8297744, 4.542025, 1, 0, 0, 1, 1,
0.391956, 0.6614335, 1.19334, 0, 0, 0, 1, 1,
0.3947012, -0.6253298, 1.838908, 0, 0, 0, 1, 1,
0.3951246, 0.06318074, 1.747894, 0, 0, 0, 1, 1,
0.39538, 0.5345316, -0.2334622, 0, 0, 0, 1, 1,
0.3972968, 1.305446, 0.8798085, 0, 0, 0, 1, 1,
0.397496, 0.2172226, 0.5040298, 0, 0, 0, 1, 1,
0.4037366, 0.5578225, 1.476852, 0, 0, 0, 1, 1,
0.403938, 1.57741, 1.514763, 1, 1, 1, 1, 1,
0.4055704, 0.6443663, -1.161244, 1, 1, 1, 1, 1,
0.4084867, 0.3110934, 2.211, 1, 1, 1, 1, 1,
0.4110574, -0.4274542, 2.20203, 1, 1, 1, 1, 1,
0.4128299, 1.380686, -0.9748978, 1, 1, 1, 1, 1,
0.4141397, 1.595103, 0.266498, 1, 1, 1, 1, 1,
0.4176314, -0.5564431, 3.613477, 1, 1, 1, 1, 1,
0.418371, 2.505271, -0.1208275, 1, 1, 1, 1, 1,
0.4188582, 0.948254, 2.542751, 1, 1, 1, 1, 1,
0.4195021, 0.9144552, 0.3192464, 1, 1, 1, 1, 1,
0.4210979, 0.1610273, 3.106444, 1, 1, 1, 1, 1,
0.4261765, -0.172348, 3.537805, 1, 1, 1, 1, 1,
0.4291839, -1.476351, 3.077091, 1, 1, 1, 1, 1,
0.432061, -1.177751, 2.224357, 1, 1, 1, 1, 1,
0.4322706, -2.454685, 0.7331758, 1, 1, 1, 1, 1,
0.4376815, 1.368909, 0.03290322, 0, 0, 1, 1, 1,
0.4407289, 0.9062694, -0.1275928, 1, 0, 0, 1, 1,
0.443027, -1.633587, 4.045598, 1, 0, 0, 1, 1,
0.4448816, 1.744065, -0.9537135, 1, 0, 0, 1, 1,
0.4462708, -0.4523025, 1.081457, 1, 0, 0, 1, 1,
0.4480367, -0.01417804, 3.539658, 1, 0, 0, 1, 1,
0.4505732, -0.2528241, 0.1231533, 0, 0, 0, 1, 1,
0.450696, -0.3032369, 2.396829, 0, 0, 0, 1, 1,
0.452309, -1.649964, 2.311104, 0, 0, 0, 1, 1,
0.4528855, -0.05431781, 2.236637, 0, 0, 0, 1, 1,
0.4530408, -0.3424, 1.428942, 0, 0, 0, 1, 1,
0.4551378, 0.09031171, 0.9964437, 0, 0, 0, 1, 1,
0.4560081, 0.3107911, 0.8116324, 0, 0, 0, 1, 1,
0.4608594, 0.4856582, 0.1350758, 1, 1, 1, 1, 1,
0.4638914, -1.192459, 3.31169, 1, 1, 1, 1, 1,
0.4653455, -0.619532, 0.720745, 1, 1, 1, 1, 1,
0.4684784, 2.084761, -0.8868385, 1, 1, 1, 1, 1,
0.4692029, -0.5249703, -0.1553313, 1, 1, 1, 1, 1,
0.469917, 0.08863976, 0.8714247, 1, 1, 1, 1, 1,
0.4739918, -2.295842, 1.484908, 1, 1, 1, 1, 1,
0.4757204, 0.5630314, 0.7173471, 1, 1, 1, 1, 1,
0.4781712, -0.8640365, 1.158979, 1, 1, 1, 1, 1,
0.4784752, -1.961367, 3.752115, 1, 1, 1, 1, 1,
0.4793934, -0.9298283, 2.607973, 1, 1, 1, 1, 1,
0.4795611, 0.4347738, 2.272607, 1, 1, 1, 1, 1,
0.4813482, -1.500988, 3.651105, 1, 1, 1, 1, 1,
0.4830029, 0.189311, 0.8866001, 1, 1, 1, 1, 1,
0.4839436, 1.092046, 0.356033, 1, 1, 1, 1, 1,
0.4850736, 0.3744245, 0.7769995, 0, 0, 1, 1, 1,
0.4852102, -0.3633358, 1.582417, 1, 0, 0, 1, 1,
0.4875118, -1.057323, 3.227815, 1, 0, 0, 1, 1,
0.4878581, 3.058111, -1.198883, 1, 0, 0, 1, 1,
0.4897447, -0.3657162, 1.524329, 1, 0, 0, 1, 1,
0.4915717, -0.3775578, 1.803267, 1, 0, 0, 1, 1,
0.4937092, 1.561574, -0.5413718, 0, 0, 0, 1, 1,
0.4960337, 0.7748405, 2.024622, 0, 0, 0, 1, 1,
0.4985668, 1.071396, -0.7191862, 0, 0, 0, 1, 1,
0.5053926, -0.6527625, 2.732598, 0, 0, 0, 1, 1,
0.508123, -0.02442867, -0.2266907, 0, 0, 0, 1, 1,
0.5134047, 1.144504, -0.384156, 0, 0, 0, 1, 1,
0.5160129, 1.449382, -0.7591122, 0, 0, 0, 1, 1,
0.5227287, -1.193475, 0.9889706, 1, 1, 1, 1, 1,
0.5247121, 3.216581, -1.406026, 1, 1, 1, 1, 1,
0.5279795, -0.4830224, 1.066007, 1, 1, 1, 1, 1,
0.5345871, 0.5341093, 1.473402, 1, 1, 1, 1, 1,
0.5363241, 2.311419, -1.32911, 1, 1, 1, 1, 1,
0.54334, -0.741946, 2.755473, 1, 1, 1, 1, 1,
0.5459688, 0.7101467, -1.173468, 1, 1, 1, 1, 1,
0.5485484, 2.708659, 0.898005, 1, 1, 1, 1, 1,
0.5492807, -0.1966352, 2.300194, 1, 1, 1, 1, 1,
0.5537533, -0.8134795, 0.9405705, 1, 1, 1, 1, 1,
0.5543239, -1.361463, 1.860567, 1, 1, 1, 1, 1,
0.5564276, -0.9422889, 3.086612, 1, 1, 1, 1, 1,
0.5640793, 1.190417, 0.1984569, 1, 1, 1, 1, 1,
0.5703635, -1.83198, 4.44945, 1, 1, 1, 1, 1,
0.5756927, -1.039331, 1.841208, 1, 1, 1, 1, 1,
0.5777855, -1.13242, 2.84351, 0, 0, 1, 1, 1,
0.5801789, 0.3888929, 0.3898608, 1, 0, 0, 1, 1,
0.580759, -0.5802987, 1.046274, 1, 0, 0, 1, 1,
0.5807928, -1.672483, 2.74005, 1, 0, 0, 1, 1,
0.5814576, 1.95369, 0.3700421, 1, 0, 0, 1, 1,
0.5816615, 1.994922, 1.13387, 1, 0, 0, 1, 1,
0.5823538, -3.06062, 3.440462, 0, 0, 0, 1, 1,
0.5829707, 1.25774, 0.3136263, 0, 0, 0, 1, 1,
0.5888448, -0.1686189, 3.126082, 0, 0, 0, 1, 1,
0.5893344, -0.8488905, 2.076561, 0, 0, 0, 1, 1,
0.5928962, 0.834938, -0.07926565, 0, 0, 0, 1, 1,
0.593537, -0.2143671, 2.354116, 0, 0, 0, 1, 1,
0.593609, -1.697543, 2.76867, 0, 0, 0, 1, 1,
0.5943962, -1.271619, 4.26746, 1, 1, 1, 1, 1,
0.6097148, 1.447686, -0.5717193, 1, 1, 1, 1, 1,
0.6106753, -1.005372, 2.315934, 1, 1, 1, 1, 1,
0.6146539, -0.199409, 1.488626, 1, 1, 1, 1, 1,
0.6151117, 1.180038, 0.2281859, 1, 1, 1, 1, 1,
0.6186422, -0.3008133, 1.608219, 1, 1, 1, 1, 1,
0.6244342, 1.674993, 0.5941251, 1, 1, 1, 1, 1,
0.627207, 0.4547659, 0.828719, 1, 1, 1, 1, 1,
0.6331931, 0.08486402, 0.8473389, 1, 1, 1, 1, 1,
0.6334823, -1.876377, 2.545363, 1, 1, 1, 1, 1,
0.6376346, -1.050084, 1.784258, 1, 1, 1, 1, 1,
0.6421943, -0.7463604, 3.096081, 1, 1, 1, 1, 1,
0.6433765, 0.6641544, 1.661088, 1, 1, 1, 1, 1,
0.6468264, -1.020034, 2.134917, 1, 1, 1, 1, 1,
0.6521631, -0.3445318, 2.47005, 1, 1, 1, 1, 1,
0.6594045, -1.053768, 2.057004, 0, 0, 1, 1, 1,
0.6613731, 0.3950769, -0.192703, 1, 0, 0, 1, 1,
0.6628978, 0.3180879, 0.258981, 1, 0, 0, 1, 1,
0.6639227, 1.187015, -0.5958985, 1, 0, 0, 1, 1,
0.6679261, 2.393438, 1.914983, 1, 0, 0, 1, 1,
0.672363, -0.2350704, 2.039444, 1, 0, 0, 1, 1,
0.6771195, 1.349654, 1.177806, 0, 0, 0, 1, 1,
0.6777132, -0.6073344, 3.531849, 0, 0, 0, 1, 1,
0.6805016, 0.03424342, 0.7120202, 0, 0, 0, 1, 1,
0.6823657, -0.1541782, 2.510156, 0, 0, 0, 1, 1,
0.6853656, -1.252006, 5.319459, 0, 0, 0, 1, 1,
0.6861271, 0.9575484, 0.9943345, 0, 0, 0, 1, 1,
0.6865378, 0.4783419, 0.2675483, 0, 0, 0, 1, 1,
0.6897433, 0.4894744, -0.7625623, 1, 1, 1, 1, 1,
0.6904448, 0.1586616, -0.2241391, 1, 1, 1, 1, 1,
0.7005892, -1.530331, 4.313363, 1, 1, 1, 1, 1,
0.7069955, 1.530999, 0.05206796, 1, 1, 1, 1, 1,
0.714864, -0.6976261, 1.910031, 1, 1, 1, 1, 1,
0.7183663, 0.8098941, 1.287301, 1, 1, 1, 1, 1,
0.7295715, -0.2608349, 0.7385461, 1, 1, 1, 1, 1,
0.73009, -0.84579, 3.21876, 1, 1, 1, 1, 1,
0.7329945, -0.2472345, 4.108635, 1, 1, 1, 1, 1,
0.733826, -1.476502, 2.409208, 1, 1, 1, 1, 1,
0.7435611, -0.3562148, 1.935838, 1, 1, 1, 1, 1,
0.7468444, 0.4155717, 1.541, 1, 1, 1, 1, 1,
0.7494442, 1.777499, 0.7632907, 1, 1, 1, 1, 1,
0.7515516, 1.728034, -0.2164886, 1, 1, 1, 1, 1,
0.7544063, 0.1992313, 2.673528, 1, 1, 1, 1, 1,
0.7557264, -0.2183114, 2.253997, 0, 0, 1, 1, 1,
0.7560535, 0.8342893, 0.7615329, 1, 0, 0, 1, 1,
0.7567414, -0.1695919, 2.65285, 1, 0, 0, 1, 1,
0.759101, 0.3054838, 0.7595933, 1, 0, 0, 1, 1,
0.7615092, 0.2308476, 1.694506, 1, 0, 0, 1, 1,
0.7641987, -1.621121, 1.896848, 1, 0, 0, 1, 1,
0.7645978, -1.682518, 3.179329, 0, 0, 0, 1, 1,
0.7750138, -1.71576, 2.895648, 0, 0, 0, 1, 1,
0.7761251, 0.8374323, 0.7642629, 0, 0, 0, 1, 1,
0.7799122, -0.365378, 3.30266, 0, 0, 0, 1, 1,
0.7808208, 0.1964505, 1.857297, 0, 0, 0, 1, 1,
0.7893117, 0.5889407, 2.549803, 0, 0, 0, 1, 1,
0.7894248, 0.73621, 0.8358541, 0, 0, 0, 1, 1,
0.7904624, 1.127595, -1.628479, 1, 1, 1, 1, 1,
0.7924948, 1.625912, 0.01131327, 1, 1, 1, 1, 1,
0.7939262, -1.074367, 2.755791, 1, 1, 1, 1, 1,
0.8007566, -0.8031789, 2.004329, 1, 1, 1, 1, 1,
0.8033678, -0.6207077, 2.258831, 1, 1, 1, 1, 1,
0.804123, 0.4272645, 0.377693, 1, 1, 1, 1, 1,
0.8067768, 1.881575, 0.05938575, 1, 1, 1, 1, 1,
0.8111873, 0.5019724, -0.07388932, 1, 1, 1, 1, 1,
0.8144161, -0.4764805, 4.872426, 1, 1, 1, 1, 1,
0.8144603, -1.505056, 2.483627, 1, 1, 1, 1, 1,
0.8166831, -0.7726661, 2.425863, 1, 1, 1, 1, 1,
0.8181676, 1.305832, 1.721329, 1, 1, 1, 1, 1,
0.8200388, 0.9962794, 0.2186832, 1, 1, 1, 1, 1,
0.8225147, 0.009268275, 1.094774, 1, 1, 1, 1, 1,
0.8231438, -0.6234048, 2.945702, 1, 1, 1, 1, 1,
0.8237073, 1.116146, 0.8792984, 0, 0, 1, 1, 1,
0.8271258, 2.078211, -0.5895866, 1, 0, 0, 1, 1,
0.8278272, 0.473396, 0.2526681, 1, 0, 0, 1, 1,
0.8292663, 0.1137722, 1.241152, 1, 0, 0, 1, 1,
0.8296449, -1.517881, 2.741767, 1, 0, 0, 1, 1,
0.8447298, 0.1723067, 0.817807, 1, 0, 0, 1, 1,
0.8458125, -0.001293416, 0.4456198, 0, 0, 0, 1, 1,
0.8500896, -0.4065537, 0.7295371, 0, 0, 0, 1, 1,
0.8637176, 0.7745399, 2.402573, 0, 0, 0, 1, 1,
0.8669693, 0.938589, 1.212386, 0, 0, 0, 1, 1,
0.8683369, -0.2300643, 3.746699, 0, 0, 0, 1, 1,
0.8813511, -1.332393, 2.596597, 0, 0, 0, 1, 1,
0.8819882, -1.040113, 1.2994, 0, 0, 0, 1, 1,
0.8934423, 0.4448609, 0.4492722, 1, 1, 1, 1, 1,
0.9003538, -1.421823, 2.060577, 1, 1, 1, 1, 1,
0.9028045, -0.7515666, 3.03527, 1, 1, 1, 1, 1,
0.9214029, -0.7037632, 1.407688, 1, 1, 1, 1, 1,
0.9238992, 0.3123465, 0.868222, 1, 1, 1, 1, 1,
0.9302977, 0.01187859, 2.881101, 1, 1, 1, 1, 1,
0.9306737, 1.742765, 0.6712862, 1, 1, 1, 1, 1,
0.9310848, -1.152728, 3.314961, 1, 1, 1, 1, 1,
0.9313476, 1.481733, -0.3137976, 1, 1, 1, 1, 1,
0.9324278, 0.3498868, 1.475945, 1, 1, 1, 1, 1,
0.9402539, -0.1292742, 1.414049, 1, 1, 1, 1, 1,
0.9412202, 0.06610827, 0.8823938, 1, 1, 1, 1, 1,
0.9476666, -0.5328124, 1.760858, 1, 1, 1, 1, 1,
0.9507258, -1.44677, 2.683862, 1, 1, 1, 1, 1,
0.9517041, 0.9183915, 0.1181498, 1, 1, 1, 1, 1,
0.9552948, 0.4703524, 0.02596054, 0, 0, 1, 1, 1,
0.9559448, 0.2882385, 0.9754201, 1, 0, 0, 1, 1,
0.9583045, -0.3782333, 3.392171, 1, 0, 0, 1, 1,
0.9587868, -0.6421099, 2.466616, 1, 0, 0, 1, 1,
0.9612402, -2.779316, 2.814483, 1, 0, 0, 1, 1,
0.9696909, -0.1537361, 2.017498, 1, 0, 0, 1, 1,
0.9707713, 1.486356, -0.2727537, 0, 0, 0, 1, 1,
0.9732561, -0.2113338, 1.331341, 0, 0, 0, 1, 1,
0.9744917, 0.1593519, 2.313077, 0, 0, 0, 1, 1,
0.9748383, -0.2738619, 0.3822321, 0, 0, 0, 1, 1,
0.9756836, 0.5631962, 0.3098977, 0, 0, 0, 1, 1,
0.9778443, 1.095032, 1.44437, 0, 0, 0, 1, 1,
0.9880787, -0.7919192, 2.057336, 0, 0, 0, 1, 1,
1.005369, 1.508605, 0.4512699, 1, 1, 1, 1, 1,
1.025632, -0.2350048, 1.425415, 1, 1, 1, 1, 1,
1.027239, 0.7268458, 0.08694572, 1, 1, 1, 1, 1,
1.035221, -0.5979018, 0.7538278, 1, 1, 1, 1, 1,
1.040601, 0.6718659, 1.954325, 1, 1, 1, 1, 1,
1.044765, -0.2695799, 1.943184, 1, 1, 1, 1, 1,
1.049719, 0.9321311, 1.983306, 1, 1, 1, 1, 1,
1.055365, -0.5721403, 2.958672, 1, 1, 1, 1, 1,
1.061586, -0.06941558, 1.400553, 1, 1, 1, 1, 1,
1.062429, -1.280571, 2.503722, 1, 1, 1, 1, 1,
1.069702, -0.2757211, 1.053974, 1, 1, 1, 1, 1,
1.071021, -1.180553, 2.698376, 1, 1, 1, 1, 1,
1.074636, -0.06911988, 1.752459, 1, 1, 1, 1, 1,
1.075137, -0.4699634, 2.497587, 1, 1, 1, 1, 1,
1.078096, -0.925131, 2.450203, 1, 1, 1, 1, 1,
1.078248, 0.8881109, 0.0891488, 0, 0, 1, 1, 1,
1.079268, 0.1590175, 1.054031, 1, 0, 0, 1, 1,
1.085955, 0.8192821, -0.4253351, 1, 0, 0, 1, 1,
1.087849, -0.326353, 0.9862439, 1, 0, 0, 1, 1,
1.089046, -0.8618215, 2.935004, 1, 0, 0, 1, 1,
1.089688, 0.4504741, -0.2404162, 1, 0, 0, 1, 1,
1.091333, 1.243757, 0.8757074, 0, 0, 0, 1, 1,
1.104632, -0.4917699, 0.3417119, 0, 0, 0, 1, 1,
1.11809, 1.287684, 1.865835, 0, 0, 0, 1, 1,
1.119279, -0.05209155, 2.666669, 0, 0, 0, 1, 1,
1.121118, 0.4219072, 1.406495, 0, 0, 0, 1, 1,
1.122822, -0.3362043, 2.832005, 0, 0, 0, 1, 1,
1.126311, -0.3340087, 1.887242, 0, 0, 0, 1, 1,
1.139218, 2.22519, 0.467996, 1, 1, 1, 1, 1,
1.141514, -0.7812487, 3.450829, 1, 1, 1, 1, 1,
1.14646, -0.6818545, 1.944588, 1, 1, 1, 1, 1,
1.14768, -0.9619051, 1.745139, 1, 1, 1, 1, 1,
1.162363, -1.059261, 3.023979, 1, 1, 1, 1, 1,
1.167544, 1.046466, 1.855168, 1, 1, 1, 1, 1,
1.18472, 1.824746, -0.03218418, 1, 1, 1, 1, 1,
1.189958, 0.2817499, 1.329658, 1, 1, 1, 1, 1,
1.205738, 2.701431, 0.5656425, 1, 1, 1, 1, 1,
1.205987, -0.9631832, 1.967329, 1, 1, 1, 1, 1,
1.213559, -1.28584, 2.156699, 1, 1, 1, 1, 1,
1.223307, 1.317916, -0.7678947, 1, 1, 1, 1, 1,
1.239091, 0.00761649, 1.45795, 1, 1, 1, 1, 1,
1.239971, -1.723499, 2.453952, 1, 1, 1, 1, 1,
1.241668, -0.01258989, 0.827521, 1, 1, 1, 1, 1,
1.266062, 1.250173, 0.6574411, 0, 0, 1, 1, 1,
1.267519, -0.6684845, 3.158154, 1, 0, 0, 1, 1,
1.28234, -1.158974, 2.567782, 1, 0, 0, 1, 1,
1.295128, 1.969487, -1.660358, 1, 0, 0, 1, 1,
1.297502, 1.353333, 0.6345291, 1, 0, 0, 1, 1,
1.302148, -1.012391, 3.410432, 1, 0, 0, 1, 1,
1.310193, 0.6955388, 0.7818627, 0, 0, 0, 1, 1,
1.317488, -0.339338, 3.525664, 0, 0, 0, 1, 1,
1.329182, 0.3300897, -0.08236746, 0, 0, 0, 1, 1,
1.330765, 1.202096, 1.867422, 0, 0, 0, 1, 1,
1.337068, 1.942674, -0.4013585, 0, 0, 0, 1, 1,
1.337315, -0.5151614, 1.815578, 0, 0, 0, 1, 1,
1.34633, 1.251102, 0.03837136, 0, 0, 0, 1, 1,
1.349845, 0.6625483, 1.580623, 1, 1, 1, 1, 1,
1.362645, 1.168327, 0.4936235, 1, 1, 1, 1, 1,
1.363674, -1.276222, 1.507168, 1, 1, 1, 1, 1,
1.381861, -0.7799297, 1.417, 1, 1, 1, 1, 1,
1.382129, 0.3976846, 0.3036954, 1, 1, 1, 1, 1,
1.384975, 0.860983, 1.489996, 1, 1, 1, 1, 1,
1.397933, 0.1133435, 0.6539903, 1, 1, 1, 1, 1,
1.405979, -0.2723299, 2.383628, 1, 1, 1, 1, 1,
1.409505, -0.6901528, 2.594153, 1, 1, 1, 1, 1,
1.426733, -0.04539463, 2.006152, 1, 1, 1, 1, 1,
1.428902, -0.9713304, 3.105515, 1, 1, 1, 1, 1,
1.432807, -0.5653664, 1.720328, 1, 1, 1, 1, 1,
1.437522, 0.09137144, 1.110714, 1, 1, 1, 1, 1,
1.464862, -0.06044285, 2.547559, 1, 1, 1, 1, 1,
1.465822, 1.572285, 1.392149, 1, 1, 1, 1, 1,
1.470215, -1.036658, 1.784383, 0, 0, 1, 1, 1,
1.472979, -0.7099048, 2.577684, 1, 0, 0, 1, 1,
1.478353, -0.5616454, 2.348881, 1, 0, 0, 1, 1,
1.487828, 1.165165, 1.52843, 1, 0, 0, 1, 1,
1.494571, 1.802713, 1.723424, 1, 0, 0, 1, 1,
1.504245, 0.8767569, 1.47191, 1, 0, 0, 1, 1,
1.508854, -0.7916435, 1.790961, 0, 0, 0, 1, 1,
1.510082, 0.7742153, 0.5394198, 0, 0, 0, 1, 1,
1.512117, 0.4959175, 1.133623, 0, 0, 0, 1, 1,
1.516572, -0.689999, 3.170661, 0, 0, 0, 1, 1,
1.531093, -0.6641422, 2.239838, 0, 0, 0, 1, 1,
1.537027, 0.1330785, 0.04532629, 0, 0, 0, 1, 1,
1.545922, -0.6693717, 2.448952, 0, 0, 0, 1, 1,
1.5497, 0.7976339, 1.143745, 1, 1, 1, 1, 1,
1.574883, -0.6674106, 2.554355, 1, 1, 1, 1, 1,
1.576662, 0.859643, -2.427825, 1, 1, 1, 1, 1,
1.583195, 1.488956, 2.225212, 1, 1, 1, 1, 1,
1.596074, -0.5309331, 2.301843, 1, 1, 1, 1, 1,
1.5975, 0.3776886, 1.181987, 1, 1, 1, 1, 1,
1.598545, -1.044916, 1.691177, 1, 1, 1, 1, 1,
1.605599, 1.859598, 1.515807, 1, 1, 1, 1, 1,
1.610826, -0.540292, 0.9263272, 1, 1, 1, 1, 1,
1.624437, 0.789316, 1.048029, 1, 1, 1, 1, 1,
1.633897, -1.218284, 2.813704, 1, 1, 1, 1, 1,
1.638989, 0.3854712, 2.521781, 1, 1, 1, 1, 1,
1.647405, -0.9540085, 1.778645, 1, 1, 1, 1, 1,
1.647647, -0.4313383, 0.8263661, 1, 1, 1, 1, 1,
1.659562, 0.2188291, 0.7603239, 1, 1, 1, 1, 1,
1.661211, -1.42988, 2.826608, 0, 0, 1, 1, 1,
1.661636, 0.5935658, 3.092524, 1, 0, 0, 1, 1,
1.672198, -0.02338751, 0.9766368, 1, 0, 0, 1, 1,
1.685815, 0.6301528, 0.08664485, 1, 0, 0, 1, 1,
1.687367, -1.375519, 2.096194, 1, 0, 0, 1, 1,
1.68916, 1.564396, 0.3831924, 1, 0, 0, 1, 1,
1.689479, 0.9130026, -0.1051801, 0, 0, 0, 1, 1,
1.693342, 0.04433402, -0.3543866, 0, 0, 0, 1, 1,
1.697972, -0.4010965, 3.057217, 0, 0, 0, 1, 1,
1.705001, 0.9386469, 1.276198, 0, 0, 0, 1, 1,
1.718478, -0.4843742, 2.933146, 0, 0, 0, 1, 1,
1.730093, -0.3383382, 2.783611, 0, 0, 0, 1, 1,
1.752575, -0.2370727, 0.1736632, 0, 0, 0, 1, 1,
1.754364, 0.4333045, 2.528649, 1, 1, 1, 1, 1,
1.759763, -1.234881, 1.023233, 1, 1, 1, 1, 1,
1.761199, 0.5923404, 1.167297, 1, 1, 1, 1, 1,
1.773639, 1.285297, 1.621348, 1, 1, 1, 1, 1,
1.781184, -0.4076435, 2.546253, 1, 1, 1, 1, 1,
1.793806, 0.9151724, 0.388323, 1, 1, 1, 1, 1,
1.806306, 0.02940762, 1.208783, 1, 1, 1, 1, 1,
1.819505, 1.100736, 1.188929, 1, 1, 1, 1, 1,
1.832369, 0.4247993, 0.3206866, 1, 1, 1, 1, 1,
1.833265, 0.3684258, 1.311341, 1, 1, 1, 1, 1,
1.898035, 0.01448395, 1.88842, 1, 1, 1, 1, 1,
1.931965, -0.2909766, 2.032318, 1, 1, 1, 1, 1,
1.959179, -2.430902, 1.468432, 1, 1, 1, 1, 1,
1.962755, -0.6256773, 2.293924, 1, 1, 1, 1, 1,
1.965461, -0.331016, 0.9232158, 1, 1, 1, 1, 1,
1.972517, 0.3687975, 1.264224, 0, 0, 1, 1, 1,
1.973285, -0.4390092, 0.2888551, 1, 0, 0, 1, 1,
1.993955, -1.243634, 1.690807, 1, 0, 0, 1, 1,
1.995249, -0.5476817, 0.08559775, 1, 0, 0, 1, 1,
2.031322, 0.31416, 4.05444, 1, 0, 0, 1, 1,
2.04026, 0.3359717, 3.568294, 1, 0, 0, 1, 1,
2.044131, 0.4361163, 1.699623, 0, 0, 0, 1, 1,
2.067023, -0.3569776, 3.454407, 0, 0, 0, 1, 1,
2.092916, 1.436002, 1.028462, 0, 0, 0, 1, 1,
2.271186, 0.0567903, 0.6735618, 0, 0, 0, 1, 1,
2.27146, -1.237073, 2.762033, 0, 0, 0, 1, 1,
2.309419, -1.98084, 3.837403, 0, 0, 0, 1, 1,
2.330909, 0.05903869, 2.150501, 0, 0, 0, 1, 1,
2.516567, -1.867851, 1.699113, 1, 1, 1, 1, 1,
2.578343, 0.3539928, -0.08001864, 1, 1, 1, 1, 1,
2.689565, 0.2302394, 1.393843, 1, 1, 1, 1, 1,
2.931541, -0.5370375, 1.782903, 1, 1, 1, 1, 1,
2.998584, 0.08334892, 0.4262985, 1, 1, 1, 1, 1,
3.040603, -0.4782425, 1.863249, 1, 1, 1, 1, 1,
3.796763, 0.6424479, 3.318123, 1, 1, 1, 1, 1
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
var radius = 9.772824;
var distance = 34.32663;
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
mvMatrix.translate( -0.4418979, -0.1785429, 0.1610465 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.32663);
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