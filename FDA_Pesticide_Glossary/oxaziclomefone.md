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
-3.325546, -0.8754195, -0.3263886, 1, 0, 0, 1,
-3.156086, 0.8388351, -0.5438763, 1, 0.007843138, 0, 1,
-3.153225, -0.733772, -1.278018, 1, 0.01176471, 0, 1,
-3.0852, -0.02255094, -0.2733907, 1, 0.01960784, 0, 1,
-3.022516, 0.8288853, -1.325858, 1, 0.02352941, 0, 1,
-2.757915, 0.9208499, -0.6550334, 1, 0.03137255, 0, 1,
-2.756409, -1.501575, -2.225375, 1, 0.03529412, 0, 1,
-2.653268, -1.316223, -2.287975, 1, 0.04313726, 0, 1,
-2.611696, -0.8463917, -2.522076, 1, 0.04705882, 0, 1,
-2.605907, 1.123892, -1.702306, 1, 0.05490196, 0, 1,
-2.573268, 0.5456023, -3.851192, 1, 0.05882353, 0, 1,
-2.566222, -1.056279, -2.324126, 1, 0.06666667, 0, 1,
-2.537663, 1.049942, -2.839233, 1, 0.07058824, 0, 1,
-2.410914, 0.08607557, -0.8534369, 1, 0.07843138, 0, 1,
-2.379922, 1.024705, 1.499604, 1, 0.08235294, 0, 1,
-2.365688, -0.9699517, -2.675248, 1, 0.09019608, 0, 1,
-2.303139, 0.6794548, 0.5597021, 1, 0.09411765, 0, 1,
-2.273721, -0.4669982, -1.920005, 1, 0.1019608, 0, 1,
-2.209527, 0.5679782, -1.883223, 1, 0.1098039, 0, 1,
-2.192411, 0.4783915, -0.6519582, 1, 0.1137255, 0, 1,
-2.145232, -0.6814818, -1.839198, 1, 0.1215686, 0, 1,
-2.110295, 0.1408633, -1.707129, 1, 0.1254902, 0, 1,
-2.080943, -0.5342242, -2.628043, 1, 0.1333333, 0, 1,
-2.055459, 0.07520514, -1.429373, 1, 0.1372549, 0, 1,
-2.042553, -0.2950521, -2.139758, 1, 0.145098, 0, 1,
-1.979163, 0.716795, -1.61082, 1, 0.1490196, 0, 1,
-1.971298, -0.3423424, -0.9774452, 1, 0.1568628, 0, 1,
-1.950834, 0.1400997, -1.803079, 1, 0.1607843, 0, 1,
-1.9365, 0.8463696, 0.276982, 1, 0.1686275, 0, 1,
-1.934269, 0.8035838, 0.1527586, 1, 0.172549, 0, 1,
-1.918015, -0.6588947, -3.647588, 1, 0.1803922, 0, 1,
-1.904484, -0.008806948, -1.508706, 1, 0.1843137, 0, 1,
-1.901342, -1.206681, -1.914158, 1, 0.1921569, 0, 1,
-1.891771, 2.30051, -0.4839527, 1, 0.1960784, 0, 1,
-1.873931, 1.009527, 1.163697, 1, 0.2039216, 0, 1,
-1.837557, -0.8097124, -2.29584, 1, 0.2117647, 0, 1,
-1.820307, 0.6064574, -3.113795, 1, 0.2156863, 0, 1,
-1.79611, 0.5571035, -1.723387, 1, 0.2235294, 0, 1,
-1.77061, 0.3875335, -3.571822, 1, 0.227451, 0, 1,
-1.754197, -1.746538, -0.8200989, 1, 0.2352941, 0, 1,
-1.747726, 1.920195, -1.548492, 1, 0.2392157, 0, 1,
-1.740954, 0.510637, -0.7705966, 1, 0.2470588, 0, 1,
-1.737159, 0.1748653, -3.398951, 1, 0.2509804, 0, 1,
-1.732825, 1.312759, 0.5858582, 1, 0.2588235, 0, 1,
-1.71828, 0.6052595, -2.545051, 1, 0.2627451, 0, 1,
-1.680866, -0.5374555, -0.5589045, 1, 0.2705882, 0, 1,
-1.667659, -0.9764711, -2.265956, 1, 0.2745098, 0, 1,
-1.640336, 0.5309669, -2.330202, 1, 0.282353, 0, 1,
-1.628656, -1.099964, -0.6533427, 1, 0.2862745, 0, 1,
-1.604035, -0.01365153, -1.426685, 1, 0.2941177, 0, 1,
-1.595629, -2.638309, -1.941432, 1, 0.3019608, 0, 1,
-1.586612, 1.107329, 0.3517323, 1, 0.3058824, 0, 1,
-1.586339, -0.1546163, -1.732845, 1, 0.3137255, 0, 1,
-1.577267, -0.06725844, -1.76966, 1, 0.3176471, 0, 1,
-1.573775, -0.334776, -0.5948398, 1, 0.3254902, 0, 1,
-1.561635, -0.43953, -1.51177, 1, 0.3294118, 0, 1,
-1.553968, 0.1542895, -1.810674, 1, 0.3372549, 0, 1,
-1.553562, 0.5996353, -2.339514, 1, 0.3411765, 0, 1,
-1.552924, 0.5214589, -1.801611, 1, 0.3490196, 0, 1,
-1.551172, -0.5391985, -1.21249, 1, 0.3529412, 0, 1,
-1.539568, 1.315644, -2.555781, 1, 0.3607843, 0, 1,
-1.535688, 0.9885111, -0.6100809, 1, 0.3647059, 0, 1,
-1.53468, -0.6035126, -1.397808, 1, 0.372549, 0, 1,
-1.52804, 0.7911304, -0.5100798, 1, 0.3764706, 0, 1,
-1.526435, -0.3899564, -1.881407, 1, 0.3843137, 0, 1,
-1.525325, -1.341333, -3.268226, 1, 0.3882353, 0, 1,
-1.508577, 0.4635988, -2.833521, 1, 0.3960784, 0, 1,
-1.50711, -0.4312389, -1.665144, 1, 0.4039216, 0, 1,
-1.504459, -0.2223795, -1.132789, 1, 0.4078431, 0, 1,
-1.494261, 0.4159827, -2.098602, 1, 0.4156863, 0, 1,
-1.462039, 0.1738547, -0.3050884, 1, 0.4196078, 0, 1,
-1.45155, -0.5322117, -2.749081, 1, 0.427451, 0, 1,
-1.445631, 0.107346, -1.303509, 1, 0.4313726, 0, 1,
-1.443287, -0.641655, -2.247331, 1, 0.4392157, 0, 1,
-1.440558, 1.059767, -1.454801, 1, 0.4431373, 0, 1,
-1.438441, 0.8879248, -2.144038, 1, 0.4509804, 0, 1,
-1.421228, -1.804073, -1.445407, 1, 0.454902, 0, 1,
-1.395009, -1.84186, -1.100232, 1, 0.4627451, 0, 1,
-1.384954, 0.4170396, -2.319299, 1, 0.4666667, 0, 1,
-1.378797, -0.5152221, -0.6822047, 1, 0.4745098, 0, 1,
-1.378767, -0.3931583, -0.2937638, 1, 0.4784314, 0, 1,
-1.377524, 1.79932, 1.38134, 1, 0.4862745, 0, 1,
-1.371527, -0.387812, -2.248754, 1, 0.4901961, 0, 1,
-1.367154, 0.1165513, -1.543163, 1, 0.4980392, 0, 1,
-1.362251, -0.03326534, -0.6856174, 1, 0.5058824, 0, 1,
-1.354625, -0.9071698, -3.421327, 1, 0.509804, 0, 1,
-1.339729, -0.3580359, -2.055273, 1, 0.5176471, 0, 1,
-1.322013, -1.352262, -2.120282, 1, 0.5215687, 0, 1,
-1.320491, 0.3144064, -0.3870378, 1, 0.5294118, 0, 1,
-1.304142, 0.04790795, -3.526839, 1, 0.5333334, 0, 1,
-1.293101, 1.030473, 0.05984288, 1, 0.5411765, 0, 1,
-1.292339, -0.3782635, -2.326995, 1, 0.5450981, 0, 1,
-1.290672, -0.3368022, -1.621305, 1, 0.5529412, 0, 1,
-1.284847, 1.571292, 1.339852, 1, 0.5568628, 0, 1,
-1.279205, 0.7718734, -2.771123, 1, 0.5647059, 0, 1,
-1.272888, 0.5101636, -1.304241, 1, 0.5686275, 0, 1,
-1.249901, 0.7903937, -0.3718868, 1, 0.5764706, 0, 1,
-1.246778, -0.5267943, -1.074392, 1, 0.5803922, 0, 1,
-1.2456, 1.163211, 0.4061183, 1, 0.5882353, 0, 1,
-1.238572, 1.765471, 0.1388305, 1, 0.5921569, 0, 1,
-1.223553, 0.5789266, -2.362983, 1, 0.6, 0, 1,
-1.219412, -0.04303249, -0.9431829, 1, 0.6078432, 0, 1,
-1.217826, -1.012806, -2.921301, 1, 0.6117647, 0, 1,
-1.201308, -1.247998, -1.223303, 1, 0.6196079, 0, 1,
-1.194418, 0.1370461, -2.714589, 1, 0.6235294, 0, 1,
-1.183021, 0.7185531, -1.59227, 1, 0.6313726, 0, 1,
-1.177626, 0.4246836, -1.70115, 1, 0.6352941, 0, 1,
-1.174635, 0.001236092, -2.249489, 1, 0.6431373, 0, 1,
-1.171022, 0.7033424, 0.1868069, 1, 0.6470588, 0, 1,
-1.156869, -0.8690193, -3.504016, 1, 0.654902, 0, 1,
-1.142066, 0.2647976, -0.9823146, 1, 0.6588235, 0, 1,
-1.139368, -0.2711752, -1.08921, 1, 0.6666667, 0, 1,
-1.136515, -0.5608525, -2.233286, 1, 0.6705883, 0, 1,
-1.135487, 1.68777, -0.7581668, 1, 0.6784314, 0, 1,
-1.133131, -1.045146, -3.525588, 1, 0.682353, 0, 1,
-1.132261, 0.3563724, 0.3516535, 1, 0.6901961, 0, 1,
-1.129622, -0.1711252, -0.315906, 1, 0.6941177, 0, 1,
-1.127734, -0.9267558, -2.690165, 1, 0.7019608, 0, 1,
-1.12356, -0.6560655, -2.135791, 1, 0.7098039, 0, 1,
-1.11438, -1.48505, -3.844861, 1, 0.7137255, 0, 1,
-1.104663, 0.1299299, -1.506079, 1, 0.7215686, 0, 1,
-1.099201, 0.9041087, -2.347651, 1, 0.7254902, 0, 1,
-1.098237, -0.2497486, -0.9896935, 1, 0.7333333, 0, 1,
-1.095838, 0.003777992, -1.636921, 1, 0.7372549, 0, 1,
-1.094644, 1.470723, -1.139844, 1, 0.7450981, 0, 1,
-1.092618, -0.4768631, -0.816606, 1, 0.7490196, 0, 1,
-1.089888, 0.5966604, 0.6077335, 1, 0.7568628, 0, 1,
-1.086401, 0.323171, 0.7388237, 1, 0.7607843, 0, 1,
-1.079049, -0.4160943, -1.549889, 1, 0.7686275, 0, 1,
-1.071163, -0.591367, -4.174172, 1, 0.772549, 0, 1,
-1.069625, 0.7274317, 0.8454789, 1, 0.7803922, 0, 1,
-1.069194, 0.8640726, 0.02320896, 1, 0.7843137, 0, 1,
-1.059721, -1.152128, -1.057663, 1, 0.7921569, 0, 1,
-1.055937, -0.1014708, -2.762755, 1, 0.7960784, 0, 1,
-1.053982, -0.7432439, -1.973286, 1, 0.8039216, 0, 1,
-1.052432, -0.8636608, -4.607711, 1, 0.8117647, 0, 1,
-1.045779, -1.306622, -3.735889, 1, 0.8156863, 0, 1,
-1.039548, 0.598112, -0.997632, 1, 0.8235294, 0, 1,
-1.030411, -0.2144872, -1.293244, 1, 0.827451, 0, 1,
-1.028625, -0.1889181, -2.234855, 1, 0.8352941, 0, 1,
-1.028226, 0.4856027, -2.810443, 1, 0.8392157, 0, 1,
-1.025544, 0.006914315, -0.5382753, 1, 0.8470588, 0, 1,
-1.02393, -1.459807, -2.461739, 1, 0.8509804, 0, 1,
-1.01093, 0.8690397, -0.6899059, 1, 0.8588235, 0, 1,
-1.010631, 0.8789944, -1.371242, 1, 0.8627451, 0, 1,
-1.001661, -0.08421236, -1.751351, 1, 0.8705882, 0, 1,
-0.9964896, -1.193648, -4.624092, 1, 0.8745098, 0, 1,
-0.9942877, -0.3834685, -1.701989, 1, 0.8823529, 0, 1,
-0.9925842, -0.4483731, -1.588244, 1, 0.8862745, 0, 1,
-0.9873285, -1.339065, -1.605951, 1, 0.8941177, 0, 1,
-0.9789055, -0.3830118, -1.161197, 1, 0.8980392, 0, 1,
-0.9740571, -0.3066984, -2.892745, 1, 0.9058824, 0, 1,
-0.973353, 1.19408, 0.2500994, 1, 0.9137255, 0, 1,
-0.9684899, -0.2337718, -1.654173, 1, 0.9176471, 0, 1,
-0.9632114, -0.619181, -1.491991, 1, 0.9254902, 0, 1,
-0.9621711, 0.9356675, -2.173083, 1, 0.9294118, 0, 1,
-0.9574578, 0.412537, -3.033006, 1, 0.9372549, 0, 1,
-0.9500616, -0.5010505, -2.275282, 1, 0.9411765, 0, 1,
-0.94945, 1.282988, -0.4657109, 1, 0.9490196, 0, 1,
-0.945274, -0.1884687, -1.451815, 1, 0.9529412, 0, 1,
-0.941837, -1.632203, -1.790203, 1, 0.9607843, 0, 1,
-0.9417397, 1.558648, -1.131617, 1, 0.9647059, 0, 1,
-0.9399208, 1.01413, -0.6185392, 1, 0.972549, 0, 1,
-0.9394476, 0.9166982, -0.9648702, 1, 0.9764706, 0, 1,
-0.937763, 2.78526, 0.40807, 1, 0.9843137, 0, 1,
-0.9300049, 0.4570847, -1.142546, 1, 0.9882353, 0, 1,
-0.9265357, 2.661365, 0.4635819, 1, 0.9960784, 0, 1,
-0.9215686, -0.005637102, 0.1734617, 0.9960784, 1, 0, 1,
-0.9207867, 0.6000341, 0.3747585, 0.9921569, 1, 0, 1,
-0.9200629, 1.032626, -0.9132814, 0.9843137, 1, 0, 1,
-0.9125605, 1.466762, -0.002865268, 0.9803922, 1, 0, 1,
-0.9116809, -0.02699498, -2.083632, 0.972549, 1, 0, 1,
-0.9112987, 0.841645, -1.520468, 0.9686275, 1, 0, 1,
-0.909505, -0.4155996, -1.866323, 0.9607843, 1, 0, 1,
-0.9043663, -0.6448953, -1.630723, 0.9568627, 1, 0, 1,
-0.9038743, 0.8719636, -1.336891, 0.9490196, 1, 0, 1,
-0.903774, -1.321039, -1.93565, 0.945098, 1, 0, 1,
-0.9037413, 0.2735, -1.485207, 0.9372549, 1, 0, 1,
-0.901655, -0.917326, -1.467817, 0.9333333, 1, 0, 1,
-0.9011077, -0.9332829, -2.43807, 0.9254902, 1, 0, 1,
-0.8968861, -2.199387, -5.348881, 0.9215686, 1, 0, 1,
-0.8959177, 0.3768849, -0.6436843, 0.9137255, 1, 0, 1,
-0.8932747, 1.110518, -0.4936418, 0.9098039, 1, 0, 1,
-0.8912185, -0.2176713, -1.237018, 0.9019608, 1, 0, 1,
-0.8864269, -0.8461711, -2.911138, 0.8941177, 1, 0, 1,
-0.8861676, -0.1644437, -0.2690072, 0.8901961, 1, 0, 1,
-0.8859262, -0.4293174, -1.799447, 0.8823529, 1, 0, 1,
-0.8852381, -0.7282659, -0.5353975, 0.8784314, 1, 0, 1,
-0.8835069, 0.01668893, -2.286448, 0.8705882, 1, 0, 1,
-0.8815438, 0.5646285, -0.349977, 0.8666667, 1, 0, 1,
-0.8794562, -0.2916598, -2.206985, 0.8588235, 1, 0, 1,
-0.8780006, 1.220712, -1.825906, 0.854902, 1, 0, 1,
-0.8764359, -1.427527, -1.967882, 0.8470588, 1, 0, 1,
-0.8725361, -0.3913686, -3.850904, 0.8431373, 1, 0, 1,
-0.8710189, -1.107486, -3.588956, 0.8352941, 1, 0, 1,
-0.8709285, 0.0461793, -3.112371, 0.8313726, 1, 0, 1,
-0.8660473, -1.297346, -1.299666, 0.8235294, 1, 0, 1,
-0.8572332, -2.716781, -2.089419, 0.8196079, 1, 0, 1,
-0.8530465, 0.7598053, -1.362443, 0.8117647, 1, 0, 1,
-0.8512523, 1.786271, 0.3434522, 0.8078431, 1, 0, 1,
-0.8508001, -1.222821, -2.031547, 0.8, 1, 0, 1,
-0.8503081, 0.4460878, -0.6315271, 0.7921569, 1, 0, 1,
-0.8478387, -0.7754599, -4.085131, 0.7882353, 1, 0, 1,
-0.8434608, -0.4608371, -3.37316, 0.7803922, 1, 0, 1,
-0.8431271, -0.1194644, -2.092459, 0.7764706, 1, 0, 1,
-0.8331275, -0.8049619, -1.854801, 0.7686275, 1, 0, 1,
-0.8313748, -0.09973937, -1.083808, 0.7647059, 1, 0, 1,
-0.8299847, -1.380086, -3.596293, 0.7568628, 1, 0, 1,
-0.8261918, -0.2728324, -1.611367, 0.7529412, 1, 0, 1,
-0.8202018, -1.796467, -1.601107, 0.7450981, 1, 0, 1,
-0.8151087, 0.04358384, -1.74375, 0.7411765, 1, 0, 1,
-0.8135794, 1.332198, 0.6253008, 0.7333333, 1, 0, 1,
-0.8061163, 0.4298805, -2.096541, 0.7294118, 1, 0, 1,
-0.8046002, -0.3842753, -0.76355, 0.7215686, 1, 0, 1,
-0.8022072, 0.258192, -0.5990326, 0.7176471, 1, 0, 1,
-0.791024, 0.503011, -0.5981646, 0.7098039, 1, 0, 1,
-0.7889136, 0.3262692, -3.224101, 0.7058824, 1, 0, 1,
-0.7844202, 0.7464184, -1.097883, 0.6980392, 1, 0, 1,
-0.7839227, -2.551195, -1.76156, 0.6901961, 1, 0, 1,
-0.778998, -0.8585317, -2.20158, 0.6862745, 1, 0, 1,
-0.7787423, 0.1172541, -0.8365633, 0.6784314, 1, 0, 1,
-0.7751985, -0.05179759, -2.013984, 0.6745098, 1, 0, 1,
-0.7744681, 0.3418456, -0.983458, 0.6666667, 1, 0, 1,
-0.7740043, -0.2325213, -1.409228, 0.6627451, 1, 0, 1,
-0.7730096, 0.5260311, -0.6058158, 0.654902, 1, 0, 1,
-0.7707187, -0.3843604, -2.635698, 0.6509804, 1, 0, 1,
-0.769251, -0.005417339, -1.672876, 0.6431373, 1, 0, 1,
-0.7637819, -0.03663366, -2.739448, 0.6392157, 1, 0, 1,
-0.761145, -0.9654381, -1.59511, 0.6313726, 1, 0, 1,
-0.7549025, 0.8323454, -0.720915, 0.627451, 1, 0, 1,
-0.749743, -0.2843801, -0.7694312, 0.6196079, 1, 0, 1,
-0.748305, -0.2918194, -1.897961, 0.6156863, 1, 0, 1,
-0.734597, 1.300289, -1.03034, 0.6078432, 1, 0, 1,
-0.7345169, -0.9637026, -1.991337, 0.6039216, 1, 0, 1,
-0.7325789, 0.2702783, -1.994874, 0.5960785, 1, 0, 1,
-0.7309894, -1.620366, -1.519796, 0.5882353, 1, 0, 1,
-0.7282827, 0.2719354, -1.391864, 0.5843138, 1, 0, 1,
-0.7265983, -0.4400859, -1.407852, 0.5764706, 1, 0, 1,
-0.7243217, 0.7062007, 0.7860804, 0.572549, 1, 0, 1,
-0.7226983, 0.95324, -1.65756, 0.5647059, 1, 0, 1,
-0.7134584, -1.385263, -2.45535, 0.5607843, 1, 0, 1,
-0.7113441, -0.04468539, -0.6882905, 0.5529412, 1, 0, 1,
-0.7106965, -0.7985487, -2.66704, 0.5490196, 1, 0, 1,
-0.7091314, 0.1342719, -0.8478786, 0.5411765, 1, 0, 1,
-0.6977321, 1.546636, 0.8884806, 0.5372549, 1, 0, 1,
-0.6969765, 0.9642661, 0.5792834, 0.5294118, 1, 0, 1,
-0.6921313, -0.386874, -1.845383, 0.5254902, 1, 0, 1,
-0.6920304, 0.2280863, -0.4324566, 0.5176471, 1, 0, 1,
-0.6887084, -1.595338, -2.821767, 0.5137255, 1, 0, 1,
-0.6881775, 1.34825, -0.2042036, 0.5058824, 1, 0, 1,
-0.6854557, 1.831738, -1.259611, 0.5019608, 1, 0, 1,
-0.6833823, -0.6443922, -2.394636, 0.4941176, 1, 0, 1,
-0.6817285, 0.5046425, -0.8289238, 0.4862745, 1, 0, 1,
-0.6783798, 0.9144465, 0.792698, 0.4823529, 1, 0, 1,
-0.6770267, -0.6055416, -3.077662, 0.4745098, 1, 0, 1,
-0.6752419, 0.4294037, -1.005652, 0.4705882, 1, 0, 1,
-0.6716348, -1.32899, -2.448985, 0.4627451, 1, 0, 1,
-0.6567098, -1.064772, -2.017308, 0.4588235, 1, 0, 1,
-0.6555318, 1.842219, 0.1586334, 0.4509804, 1, 0, 1,
-0.6435123, -0.1322335, -2.085452, 0.4470588, 1, 0, 1,
-0.6421397, 0.1745045, -1.34729, 0.4392157, 1, 0, 1,
-0.6390565, 0.5599627, -0.5569204, 0.4352941, 1, 0, 1,
-0.638519, 0.4727588, -1.295712, 0.427451, 1, 0, 1,
-0.638415, -0.8556084, -2.473016, 0.4235294, 1, 0, 1,
-0.6368133, -0.01699305, -1.430794, 0.4156863, 1, 0, 1,
-0.6302631, 1.374979, 0.598218, 0.4117647, 1, 0, 1,
-0.6286877, 0.4497072, 0.1589093, 0.4039216, 1, 0, 1,
-0.6262957, 0.2535394, -1.543991, 0.3960784, 1, 0, 1,
-0.624491, -0.2592184, -2.621732, 0.3921569, 1, 0, 1,
-0.6213223, -1.462085, -3.155418, 0.3843137, 1, 0, 1,
-0.6133708, 0.4420067, 0.7772546, 0.3803922, 1, 0, 1,
-0.6114608, 0.6269711, -0.5114641, 0.372549, 1, 0, 1,
-0.6107433, 0.3043865, -2.690394, 0.3686275, 1, 0, 1,
-0.6095254, 0.306887, -0.6855136, 0.3607843, 1, 0, 1,
-0.6074113, 1.319678, -0.3145544, 0.3568628, 1, 0, 1,
-0.6036429, -0.9818469, -3.656289, 0.3490196, 1, 0, 1,
-0.6016394, -0.937458, -2.15888, 0.345098, 1, 0, 1,
-0.5983851, -1.813514, -1.891189, 0.3372549, 1, 0, 1,
-0.5980885, -0.03612819, -1.747772, 0.3333333, 1, 0, 1,
-0.5976534, 0.6207151, -1.599676, 0.3254902, 1, 0, 1,
-0.5953529, 0.7638258, -0.537925, 0.3215686, 1, 0, 1,
-0.5928122, -0.9472501, -2.161659, 0.3137255, 1, 0, 1,
-0.5924677, 0.8857412, 0.9572046, 0.3098039, 1, 0, 1,
-0.5916527, 1.363793, 0.04549613, 0.3019608, 1, 0, 1,
-0.5863422, 0.7359094, -0.5067204, 0.2941177, 1, 0, 1,
-0.5860837, 0.665645, -0.2946829, 0.2901961, 1, 0, 1,
-0.5852945, -1.414801, -4.122695, 0.282353, 1, 0, 1,
-0.5841327, -0.5234178, -1.162969, 0.2784314, 1, 0, 1,
-0.5825988, 1.191435, -0.8938472, 0.2705882, 1, 0, 1,
-0.5819507, -0.6314335, -3.803879, 0.2666667, 1, 0, 1,
-0.5814866, 0.9373958, -0.7323414, 0.2588235, 1, 0, 1,
-0.5796372, -1.1898, -2.477311, 0.254902, 1, 0, 1,
-0.572692, 0.5852379, -2.612679, 0.2470588, 1, 0, 1,
-0.5630934, -0.148677, -1.588496, 0.2431373, 1, 0, 1,
-0.5607253, -1.30868, -1.75798, 0.2352941, 1, 0, 1,
-0.5587052, 0.1210724, -2.473154, 0.2313726, 1, 0, 1,
-0.5545929, 0.07883314, -2.450842, 0.2235294, 1, 0, 1,
-0.5542325, 0.0989357, -0.2995655, 0.2196078, 1, 0, 1,
-0.5537445, 1.107697, 0.2424164, 0.2117647, 1, 0, 1,
-0.552908, -0.4824273, -1.310785, 0.2078431, 1, 0, 1,
-0.5486872, -0.72965, -2.471044, 0.2, 1, 0, 1,
-0.5459123, -0.4102549, -2.264372, 0.1921569, 1, 0, 1,
-0.5433357, -0.8708045, -3.930468, 0.1882353, 1, 0, 1,
-0.537573, 0.1415574, -0.6143561, 0.1803922, 1, 0, 1,
-0.5355676, -0.8726597, -3.539953, 0.1764706, 1, 0, 1,
-0.529136, 0.06987389, -2.174976, 0.1686275, 1, 0, 1,
-0.5212378, -1.701266, -0.3688302, 0.1647059, 1, 0, 1,
-0.5164979, -1.332692, -2.264765, 0.1568628, 1, 0, 1,
-0.5148755, 0.2877154, -2.426219, 0.1529412, 1, 0, 1,
-0.5118628, 0.03354099, -2.216616, 0.145098, 1, 0, 1,
-0.5102459, 0.8575653, 1.001988, 0.1411765, 1, 0, 1,
-0.50583, -1.178442, -1.888614, 0.1333333, 1, 0, 1,
-0.5042864, -0.4618443, -4.037208, 0.1294118, 1, 0, 1,
-0.5031233, 0.3048454, -1.627624, 0.1215686, 1, 0, 1,
-0.5014561, -0.5982998, -2.394368, 0.1176471, 1, 0, 1,
-0.4992447, 0.6312125, 0.3342344, 0.1098039, 1, 0, 1,
-0.4963397, 1.2343, -0.3766548, 0.1058824, 1, 0, 1,
-0.4949104, 0.6910014, -0.8328251, 0.09803922, 1, 0, 1,
-0.4930272, -1.504908, -3.595119, 0.09019608, 1, 0, 1,
-0.4880088, -0.06876142, -0.7693655, 0.08627451, 1, 0, 1,
-0.4871819, -0.6935868, -1.6301, 0.07843138, 1, 0, 1,
-0.4868633, -0.3341061, -2.50484, 0.07450981, 1, 0, 1,
-0.4837203, -1.79462, -3.881272, 0.06666667, 1, 0, 1,
-0.482144, 0.9341224, 0.7737793, 0.0627451, 1, 0, 1,
-0.478222, -1.074405, -2.105412, 0.05490196, 1, 0, 1,
-0.4739379, -1.1974, -3.162575, 0.05098039, 1, 0, 1,
-0.4620239, 1.536962, 0.01300664, 0.04313726, 1, 0, 1,
-0.4609693, -0.4895571, -2.69908, 0.03921569, 1, 0, 1,
-0.4606097, 1.210275, -0.07102247, 0.03137255, 1, 0, 1,
-0.4542711, 1.023116, 0.3326363, 0.02745098, 1, 0, 1,
-0.4509957, 1.318451, -1.224949, 0.01960784, 1, 0, 1,
-0.4464022, -0.3883299, -2.881084, 0.01568628, 1, 0, 1,
-0.44549, -0.7858726, -2.601165, 0.007843138, 1, 0, 1,
-0.4454101, 1.549305, 0.8524264, 0.003921569, 1, 0, 1,
-0.4438756, -0.5863303, -2.50318, 0, 1, 0.003921569, 1,
-0.4424608, -1.109231, -3.636715, 0, 1, 0.01176471, 1,
-0.4373935, -0.1872772, -2.761131, 0, 1, 0.01568628, 1,
-0.4337036, 1.443811, 2.119966, 0, 1, 0.02352941, 1,
-0.4300758, -1.578064, -3.33531, 0, 1, 0.02745098, 1,
-0.4283234, -0.946611, -2.995732, 0, 1, 0.03529412, 1,
-0.4262623, 0.1478774, -1.473988, 0, 1, 0.03921569, 1,
-0.4233761, -1.290928, -2.036099, 0, 1, 0.04705882, 1,
-0.4232014, -1.343841, -2.27906, 0, 1, 0.05098039, 1,
-0.4211287, -0.5653916, -3.499084, 0, 1, 0.05882353, 1,
-0.4205102, 1.158746, -1.443995, 0, 1, 0.0627451, 1,
-0.4196761, -1.659364, -3.028483, 0, 1, 0.07058824, 1,
-0.4191435, -0.6253643, -2.411673, 0, 1, 0.07450981, 1,
-0.4174116, -0.9637414, -3.699676, 0, 1, 0.08235294, 1,
-0.4119218, 0.3886745, -0.5334125, 0, 1, 0.08627451, 1,
-0.4076865, -1.578737, -1.580679, 0, 1, 0.09411765, 1,
-0.4045514, -0.04804785, -3.320695, 0, 1, 0.1019608, 1,
-0.40333, -0.0407974, -0.8007725, 0, 1, 0.1058824, 1,
-0.4012251, 1.131122, 1.612413, 0, 1, 0.1137255, 1,
-0.3951955, -0.09514699, -2.202379, 0, 1, 0.1176471, 1,
-0.382505, -0.4882656, -2.745259, 0, 1, 0.1254902, 1,
-0.3779812, -1.220296, -0.7958332, 0, 1, 0.1294118, 1,
-0.3778692, 0.04793944, -2.551892, 0, 1, 0.1372549, 1,
-0.3764536, 1.158897, -0.07390594, 0, 1, 0.1411765, 1,
-0.3748548, 1.832535, -1.437528, 0, 1, 0.1490196, 1,
-0.3746302, 0.616565, -1.494282, 0, 1, 0.1529412, 1,
-0.3743164, 0.3386784, -1.835832, 0, 1, 0.1607843, 1,
-0.3742963, -0.4932307, -2.143679, 0, 1, 0.1647059, 1,
-0.3726369, 1.033502, -1.523635, 0, 1, 0.172549, 1,
-0.3695442, -0.6492418, -2.667614, 0, 1, 0.1764706, 1,
-0.3618222, -0.57363, -1.634347, 0, 1, 0.1843137, 1,
-0.3606983, 0.3420286, -3.173622, 0, 1, 0.1882353, 1,
-0.3602786, 1.232874, 0.04097162, 0, 1, 0.1960784, 1,
-0.3597905, -1.164024, -2.570376, 0, 1, 0.2039216, 1,
-0.3572014, 2.227718, 0.6698141, 0, 1, 0.2078431, 1,
-0.3472953, 0.1414399, -0.01892712, 0, 1, 0.2156863, 1,
-0.3431899, -0.2533525, -2.186043, 0, 1, 0.2196078, 1,
-0.3431043, -1.711052, -3.467493, 0, 1, 0.227451, 1,
-0.3399681, -0.01685362, -0.2394901, 0, 1, 0.2313726, 1,
-0.3243401, -2.113375, -3.896126, 0, 1, 0.2392157, 1,
-0.3227056, 0.3866822, -1.777461, 0, 1, 0.2431373, 1,
-0.3209566, -0.04063552, -1.131741, 0, 1, 0.2509804, 1,
-0.3206094, -0.2537572, -2.871786, 0, 1, 0.254902, 1,
-0.3189844, 1.39591, -0.5656067, 0, 1, 0.2627451, 1,
-0.3189139, 1.212874, -0.2441172, 0, 1, 0.2666667, 1,
-0.3188662, 0.1254603, -0.9033561, 0, 1, 0.2745098, 1,
-0.3154231, -1.383915, -4.150517, 0, 1, 0.2784314, 1,
-0.3030535, -0.6692018, -4.583361, 0, 1, 0.2862745, 1,
-0.2976897, 0.66915, 0.9473343, 0, 1, 0.2901961, 1,
-0.297612, 0.2566643, -0.2009506, 0, 1, 0.2980392, 1,
-0.2975062, -0.4344765, -2.672277, 0, 1, 0.3058824, 1,
-0.2899226, -1.08996, -2.5318, 0, 1, 0.3098039, 1,
-0.288388, -0.7815506, -2.123944, 0, 1, 0.3176471, 1,
-0.2872797, 0.4106074, -1.391769, 0, 1, 0.3215686, 1,
-0.2846717, -0.8029076, -3.81166, 0, 1, 0.3294118, 1,
-0.2815599, -0.2849492, -1.2748, 0, 1, 0.3333333, 1,
-0.2801153, -0.7562013, -1.639182, 0, 1, 0.3411765, 1,
-0.2764162, -1.734794, -3.829084, 0, 1, 0.345098, 1,
-0.2695433, -1.189026, -4.080139, 0, 1, 0.3529412, 1,
-0.2689599, -0.4929397, -2.11251, 0, 1, 0.3568628, 1,
-0.2667378, 0.07031576, -2.223872, 0, 1, 0.3647059, 1,
-0.2645928, 0.1767909, -0.6919261, 0, 1, 0.3686275, 1,
-0.261347, -1.391712, -2.595217, 0, 1, 0.3764706, 1,
-0.2601475, -0.05357255, -1.461163, 0, 1, 0.3803922, 1,
-0.2597687, 0.8525953, -1.025332, 0, 1, 0.3882353, 1,
-0.2594673, -0.2701096, -1.107706, 0, 1, 0.3921569, 1,
-0.2575648, -0.7010975, -3.264586, 0, 1, 0.4, 1,
-0.2572748, -0.05970788, -2.048042, 0, 1, 0.4078431, 1,
-0.2561801, -0.4500968, -3.868467, 0, 1, 0.4117647, 1,
-0.2553459, -0.4491747, -1.85891, 0, 1, 0.4196078, 1,
-0.2552631, -0.4019547, -2.678264, 0, 1, 0.4235294, 1,
-0.2536389, -0.2072738, -1.36744, 0, 1, 0.4313726, 1,
-0.2508357, 0.3792786, 1.419135, 0, 1, 0.4352941, 1,
-0.2439394, -0.9692508, -2.070838, 0, 1, 0.4431373, 1,
-0.2432897, 1.718384, -0.5805771, 0, 1, 0.4470588, 1,
-0.2422314, 0.2483602, 0.7000958, 0, 1, 0.454902, 1,
-0.2402766, 0.5096301, -0.1573247, 0, 1, 0.4588235, 1,
-0.2331527, -0.7805461, -3.734835, 0, 1, 0.4666667, 1,
-0.2330727, -1.057851, -2.375309, 0, 1, 0.4705882, 1,
-0.2305191, 0.5050958, -0.1101771, 0, 1, 0.4784314, 1,
-0.2291167, -0.276371, -1.714206, 0, 1, 0.4823529, 1,
-0.2277274, -0.7731727, -3.698693, 0, 1, 0.4901961, 1,
-0.2258573, 0.02069347, -2.301122, 0, 1, 0.4941176, 1,
-0.2240936, 0.9241272, 0.01594536, 0, 1, 0.5019608, 1,
-0.2233125, 0.1949216, 0.1743865, 0, 1, 0.509804, 1,
-0.2194418, 0.2005658, -3.70401, 0, 1, 0.5137255, 1,
-0.218834, -1.446103, -5.304699, 0, 1, 0.5215687, 1,
-0.2160491, -0.8262823, -3.42271, 0, 1, 0.5254902, 1,
-0.2142792, 0.191738, -1.807005, 0, 1, 0.5333334, 1,
-0.2112761, -1.264427, -3.70226, 0, 1, 0.5372549, 1,
-0.2047469, -0.9061002, -2.480348, 0, 1, 0.5450981, 1,
-0.2045569, -0.9305514, -3.119212, 0, 1, 0.5490196, 1,
-0.2029493, 0.06997306, -1.019932, 0, 1, 0.5568628, 1,
-0.2008276, 0.3671252, -0.3298336, 0, 1, 0.5607843, 1,
-0.2006341, -1.005143, -1.999051, 0, 1, 0.5686275, 1,
-0.2001503, 0.07128581, -1.589469, 0, 1, 0.572549, 1,
-0.1941791, -0.03429475, -2.939789, 0, 1, 0.5803922, 1,
-0.1929973, -1.507908, -2.952303, 0, 1, 0.5843138, 1,
-0.1926765, -0.282296, -4.521346, 0, 1, 0.5921569, 1,
-0.1916123, 0.4312181, -1.192228, 0, 1, 0.5960785, 1,
-0.1905723, -0.2360347, -3.611983, 0, 1, 0.6039216, 1,
-0.1892507, -0.3415584, -3.422254, 0, 1, 0.6117647, 1,
-0.1892397, 1.538823, -0.69551, 0, 1, 0.6156863, 1,
-0.1834511, 0.5088283, 0.5399289, 0, 1, 0.6235294, 1,
-0.1813296, -0.07651872, -0.4346705, 0, 1, 0.627451, 1,
-0.1759744, -0.2996299, -3.19839, 0, 1, 0.6352941, 1,
-0.1757657, -1.467993, -4.555712, 0, 1, 0.6392157, 1,
-0.1751941, 1.67271, -0.4242797, 0, 1, 0.6470588, 1,
-0.175173, 1.0126, 0.9231628, 0, 1, 0.6509804, 1,
-0.1741757, 1.397293, -0.8046756, 0, 1, 0.6588235, 1,
-0.173565, -1.051532, -3.847841, 0, 1, 0.6627451, 1,
-0.1659427, 0.01266353, -2.096668, 0, 1, 0.6705883, 1,
-0.1634092, 1.00605, -1.212988, 0, 1, 0.6745098, 1,
-0.1601874, 0.07672729, -1.472389, 0, 1, 0.682353, 1,
-0.1556139, -1.092378, -1.247291, 0, 1, 0.6862745, 1,
-0.1545094, -1.735483, -2.841919, 0, 1, 0.6941177, 1,
-0.1531854, 0.6606944, 1.462906, 0, 1, 0.7019608, 1,
-0.1531787, -0.3110116, -1.800796, 0, 1, 0.7058824, 1,
-0.1498051, -0.2133371, -1.514007, 0, 1, 0.7137255, 1,
-0.147081, -1.204149, -3.665306, 0, 1, 0.7176471, 1,
-0.1440243, 0.2025618, -1.24896, 0, 1, 0.7254902, 1,
-0.1433842, 0.9348276, 0.06234348, 0, 1, 0.7294118, 1,
-0.1410607, -1.06723, -4.621727, 0, 1, 0.7372549, 1,
-0.1410449, -0.2781172, -0.6245241, 0, 1, 0.7411765, 1,
-0.1408841, -0.4735942, -2.596623, 0, 1, 0.7490196, 1,
-0.1375367, 1.385696, -2.852231, 0, 1, 0.7529412, 1,
-0.1341622, 0.7280966, -0.6410879, 0, 1, 0.7607843, 1,
-0.1298985, -0.6934689, -2.344136, 0, 1, 0.7647059, 1,
-0.1274157, -0.002185272, -1.62451, 0, 1, 0.772549, 1,
-0.1273628, 0.4241998, 0.9829443, 0, 1, 0.7764706, 1,
-0.1236685, 0.7727939, -1.122292, 0, 1, 0.7843137, 1,
-0.1234205, -0.1278129, -2.803721, 0, 1, 0.7882353, 1,
-0.1209562, -1.29433, -2.352241, 0, 1, 0.7960784, 1,
-0.1207622, 0.5063483, -1.587822, 0, 1, 0.8039216, 1,
-0.1204641, -1.809129, -2.608427, 0, 1, 0.8078431, 1,
-0.1198377, 0.6572174, 0.2555209, 0, 1, 0.8156863, 1,
-0.1192433, 0.4244936, 2.643941, 0, 1, 0.8196079, 1,
-0.1078523, -0.1493588, -4.119159, 0, 1, 0.827451, 1,
-0.1009502, 0.9081634, 1.652918, 0, 1, 0.8313726, 1,
-0.09778675, -0.0071092, -2.572059, 0, 1, 0.8392157, 1,
-0.09590112, -0.1610862, -1.710072, 0, 1, 0.8431373, 1,
-0.09535111, 0.8554715, -1.414445, 0, 1, 0.8509804, 1,
-0.0928226, 0.3630865, 1.828499, 0, 1, 0.854902, 1,
-0.09094595, -0.8784328, -2.648386, 0, 1, 0.8627451, 1,
-0.09084067, 0.5297155, -0.4445095, 0, 1, 0.8666667, 1,
-0.09020876, 0.2813404, 0.2692753, 0, 1, 0.8745098, 1,
-0.0882664, -1.700208, -2.974372, 0, 1, 0.8784314, 1,
-0.08293708, -1.381519, -3.53907, 0, 1, 0.8862745, 1,
-0.08140217, -1.493577, -3.453864, 0, 1, 0.8901961, 1,
-0.0776142, -0.8041089, -3.860023, 0, 1, 0.8980392, 1,
-0.07070682, -0.16559, -2.097101, 0, 1, 0.9058824, 1,
-0.06198437, 1.923177, 1.05073, 0, 1, 0.9098039, 1,
-0.06113977, -0.9475576, -3.787465, 0, 1, 0.9176471, 1,
-0.05449745, -0.1998252, -3.874506, 0, 1, 0.9215686, 1,
-0.05214649, -1.000388, -2.694055, 0, 1, 0.9294118, 1,
-0.04300731, -1.251567, -3.519103, 0, 1, 0.9333333, 1,
-0.04258966, -0.07535363, -1.494334, 0, 1, 0.9411765, 1,
-0.03385003, -1.394961, -2.912304, 0, 1, 0.945098, 1,
-0.03092666, -1.077068, -3.120328, 0, 1, 0.9529412, 1,
-0.03061256, -0.8165076, -1.643129, 0, 1, 0.9568627, 1,
-0.02979844, 1.439635, 0.2325411, 0, 1, 0.9647059, 1,
-0.02654046, -0.7621978, -2.30553, 0, 1, 0.9686275, 1,
-0.0254807, 0.2290932, -0.3491243, 0, 1, 0.9764706, 1,
-0.023846, 0.0302912, 1.811011, 0, 1, 0.9803922, 1,
-0.02189971, 0.4569686, 1.393058, 0, 1, 0.9882353, 1,
-0.01867219, 0.1099873, 0.1086859, 0, 1, 0.9921569, 1,
-0.01770183, 0.6097896, -0.1052185, 0, 1, 1, 1,
-0.0176409, 0.8760906, 0.3279058, 0, 0.9921569, 1, 1,
-0.01546074, 0.1513537, 1.434994, 0, 0.9882353, 1, 1,
-0.01451955, -0.4335233, -3.39971, 0, 0.9803922, 1, 1,
-0.01320293, -0.6358645, -2.500393, 0, 0.9764706, 1, 1,
-0.01213621, -0.09015701, -3.713505, 0, 0.9686275, 1, 1,
-0.01073447, 1.326521, 0.5620553, 0, 0.9647059, 1, 1,
-0.009249295, -0.7542156, -2.763334, 0, 0.9568627, 1, 1,
-0.003711144, 1.022095, -1.09887, 0, 0.9529412, 1, 1,
0.001467004, 1.301088, 1.013975, 0, 0.945098, 1, 1,
0.003558181, -0.9375727, 3.89261, 0, 0.9411765, 1, 1,
0.01020331, 0.6160685, -3.127555, 0, 0.9333333, 1, 1,
0.01337116, -1.55447, 3.758552, 0, 0.9294118, 1, 1,
0.01611834, 0.1566288, 0.1712285, 0, 0.9215686, 1, 1,
0.01661646, 2.033553, 0.126275, 0, 0.9176471, 1, 1,
0.0187934, 0.9569044, -0.5303289, 0, 0.9098039, 1, 1,
0.0214131, -0.7936054, 3.151773, 0, 0.9058824, 1, 1,
0.02292835, 0.8953172, -1.148328, 0, 0.8980392, 1, 1,
0.02332381, 0.2453736, -0.1070845, 0, 0.8901961, 1, 1,
0.03557846, -1.785135, 2.448988, 0, 0.8862745, 1, 1,
0.03727235, -0.580497, 3.502871, 0, 0.8784314, 1, 1,
0.04433106, -1.353953, 4.300972, 0, 0.8745098, 1, 1,
0.04773533, 0.7238362, 0.3305536, 0, 0.8666667, 1, 1,
0.05284588, 0.1947257, 0.9077056, 0, 0.8627451, 1, 1,
0.05623706, 0.1290356, 0.1410011, 0, 0.854902, 1, 1,
0.05726286, 0.2991741, 0.7961388, 0, 0.8509804, 1, 1,
0.06093084, 1.360312, 1.323812, 0, 0.8431373, 1, 1,
0.06660914, -0.2496786, 1.589735, 0, 0.8392157, 1, 1,
0.06953132, -0.1734552, 3.612316, 0, 0.8313726, 1, 1,
0.07043903, -0.9958224, 2.338269, 0, 0.827451, 1, 1,
0.07114009, 1.021214, -1.980276, 0, 0.8196079, 1, 1,
0.07327812, 0.4051411, -0.4530909, 0, 0.8156863, 1, 1,
0.07534518, 0.7393078, 1.608361, 0, 0.8078431, 1, 1,
0.07717255, -1.010453, 3.245521, 0, 0.8039216, 1, 1,
0.07858852, -0.1002874, 3.067137, 0, 0.7960784, 1, 1,
0.07867482, -0.5616621, 3.819772, 0, 0.7882353, 1, 1,
0.08077903, 0.7257451, 0.8680694, 0, 0.7843137, 1, 1,
0.08144477, 0.9988261, -1.389038, 0, 0.7764706, 1, 1,
0.0840702, 0.3566054, -1.182698, 0, 0.772549, 1, 1,
0.1030855, -0.6153382, 2.819292, 0, 0.7647059, 1, 1,
0.1043265, -0.5088795, 3.016944, 0, 0.7607843, 1, 1,
0.1044563, -0.3195822, 3.421734, 0, 0.7529412, 1, 1,
0.105251, -1.293477, 2.567986, 0, 0.7490196, 1, 1,
0.1064096, -0.1022591, 2.473603, 0, 0.7411765, 1, 1,
0.108566, 0.9338247, -1.795555, 0, 0.7372549, 1, 1,
0.1120116, -1.374921, 4.056914, 0, 0.7294118, 1, 1,
0.1150085, 0.02150457, 0.31386, 0, 0.7254902, 1, 1,
0.1192193, -2.079772, 3.070785, 0, 0.7176471, 1, 1,
0.130466, 0.4538977, -0.3240846, 0, 0.7137255, 1, 1,
0.1358357, -0.6447989, 3.545624, 0, 0.7058824, 1, 1,
0.137896, -0.08344334, 2.030931, 0, 0.6980392, 1, 1,
0.1407692, -0.7381675, 2.555913, 0, 0.6941177, 1, 1,
0.142061, -0.4880624, 4.223015, 0, 0.6862745, 1, 1,
0.1444703, 0.5884888, 0.05715766, 0, 0.682353, 1, 1,
0.1464779, 1.172204, 0.5916823, 0, 0.6745098, 1, 1,
0.1477336, -1.041828, 1.860344, 0, 0.6705883, 1, 1,
0.1608627, 0.2120317, 0.8897055, 0, 0.6627451, 1, 1,
0.1613534, -0.6047427, 2.416271, 0, 0.6588235, 1, 1,
0.1626048, 2.512787, 1.360585, 0, 0.6509804, 1, 1,
0.164052, 0.4434152, 0.7101859, 0, 0.6470588, 1, 1,
0.1664795, -0.6108134, 1.978259, 0, 0.6392157, 1, 1,
0.1783132, -0.05961416, 3.486071, 0, 0.6352941, 1, 1,
0.1799992, -1.286493, 4.026365, 0, 0.627451, 1, 1,
0.183044, 0.7251824, -0.3187099, 0, 0.6235294, 1, 1,
0.1848599, 0.6269271, -1.266283, 0, 0.6156863, 1, 1,
0.1852074, 0.4488996, 1.1551, 0, 0.6117647, 1, 1,
0.1872966, 0.6559213, -0.1720586, 0, 0.6039216, 1, 1,
0.1875309, -0.8092918, 4.069015, 0, 0.5960785, 1, 1,
0.1880964, -0.8997973, 1.891197, 0, 0.5921569, 1, 1,
0.1937364, 0.8842328, -0.7196883, 0, 0.5843138, 1, 1,
0.1986279, 0.5055955, 0.541061, 0, 0.5803922, 1, 1,
0.1998947, 0.8101726, -0.1915274, 0, 0.572549, 1, 1,
0.2033373, -0.05917091, -0.5090073, 0, 0.5686275, 1, 1,
0.2054341, -0.2171669, 2.292275, 0, 0.5607843, 1, 1,
0.2103127, -0.2816503, 4.436526, 0, 0.5568628, 1, 1,
0.2119293, 0.2904773, 1.621166, 0, 0.5490196, 1, 1,
0.2153124, 3.142178, 0.7299509, 0, 0.5450981, 1, 1,
0.2196169, -0.05917805, 2.748542, 0, 0.5372549, 1, 1,
0.2213482, 0.6350127, 0.2684436, 0, 0.5333334, 1, 1,
0.2286631, -0.08354233, 1.859606, 0, 0.5254902, 1, 1,
0.2331848, -1.720487, 2.301321, 0, 0.5215687, 1, 1,
0.2340511, -0.5715029, 2.245886, 0, 0.5137255, 1, 1,
0.2372285, -0.08207677, 2.261831, 0, 0.509804, 1, 1,
0.2425584, -0.4697002, 2.536181, 0, 0.5019608, 1, 1,
0.2430829, -0.6413348, 2.75833, 0, 0.4941176, 1, 1,
0.2528614, 1.869986, -0.4927255, 0, 0.4901961, 1, 1,
0.2539561, 2.021375, -1.470985, 0, 0.4823529, 1, 1,
0.254059, -0.9568022, 1.464338, 0, 0.4784314, 1, 1,
0.2561319, -0.2466917, 1.61531, 0, 0.4705882, 1, 1,
0.2648959, 0.9976121, 2.061829, 0, 0.4666667, 1, 1,
0.2652792, 1.353251, 0.1971471, 0, 0.4588235, 1, 1,
0.2673064, 0.3140481, 1.233382, 0, 0.454902, 1, 1,
0.2676198, -1.431773, 3.043687, 0, 0.4470588, 1, 1,
0.2712323, -1.324243, 1.367547, 0, 0.4431373, 1, 1,
0.2717912, -1.535935, 1.828722, 0, 0.4352941, 1, 1,
0.2725095, -0.6469424, 2.064595, 0, 0.4313726, 1, 1,
0.2729463, -0.8406098, 4.708641, 0, 0.4235294, 1, 1,
0.277008, 1.824195, 1.990901, 0, 0.4196078, 1, 1,
0.2830169, 1.525644, 1.456722, 0, 0.4117647, 1, 1,
0.2836343, -0.3746279, 1.3897, 0, 0.4078431, 1, 1,
0.2843117, -0.2632644, 2.769101, 0, 0.4, 1, 1,
0.2875562, -1.006383, 3.138294, 0, 0.3921569, 1, 1,
0.296699, -0.2908483, 3.074231, 0, 0.3882353, 1, 1,
0.2972545, 0.6243362, -0.71557, 0, 0.3803922, 1, 1,
0.2973368, 1.1735, 0.4524157, 0, 0.3764706, 1, 1,
0.2973858, 1.396667, 0.03845077, 0, 0.3686275, 1, 1,
0.2978778, 0.6657293, 1.290998, 0, 0.3647059, 1, 1,
0.2979469, 0.4701509, -0.128292, 0, 0.3568628, 1, 1,
0.2979678, -1.10547, 2.483639, 0, 0.3529412, 1, 1,
0.3019719, -0.1872177, 1.119873, 0, 0.345098, 1, 1,
0.3027164, 1.018773, -0.1684249, 0, 0.3411765, 1, 1,
0.3137413, -0.7608441, 3.581885, 0, 0.3333333, 1, 1,
0.3145024, 1.598892, 0.576906, 0, 0.3294118, 1, 1,
0.3176444, -0.1574507, 1.20068, 0, 0.3215686, 1, 1,
0.3177119, -0.4476143, 4.989705, 0, 0.3176471, 1, 1,
0.3224476, -1.499964, 3.496585, 0, 0.3098039, 1, 1,
0.3240673, 1.300781, -0.04021685, 0, 0.3058824, 1, 1,
0.328465, -0.3920257, 2.220582, 0, 0.2980392, 1, 1,
0.3287125, 2.233683, 0.6334409, 0, 0.2901961, 1, 1,
0.3307086, -0.7649563, 1.225703, 0, 0.2862745, 1, 1,
0.3367056, -1.072918, 3.057023, 0, 0.2784314, 1, 1,
0.3379263, -0.2842278, 1.220892, 0, 0.2745098, 1, 1,
0.3383028, 0.5734829, -0.2255181, 0, 0.2666667, 1, 1,
0.3416062, -1.774887, 2.473277, 0, 0.2627451, 1, 1,
0.3420015, -0.4979242, 2.902133, 0, 0.254902, 1, 1,
0.3434179, -0.1254079, 1.332968, 0, 0.2509804, 1, 1,
0.3481029, -0.2442717, 2.560979, 0, 0.2431373, 1, 1,
0.3490299, 1.411112, -0.1981549, 0, 0.2392157, 1, 1,
0.3493292, -0.2830814, 2.806308, 0, 0.2313726, 1, 1,
0.35, 0.2164505, 2.121394, 0, 0.227451, 1, 1,
0.3512532, -0.4238388, 1.49283, 0, 0.2196078, 1, 1,
0.351912, -0.7672565, 2.868806, 0, 0.2156863, 1, 1,
0.3625504, 0.5963503, 2.60039, 0, 0.2078431, 1, 1,
0.3632767, 0.5156116, 1.232413, 0, 0.2039216, 1, 1,
0.3633018, -0.2546882, 2.388816, 0, 0.1960784, 1, 1,
0.3637015, 0.1570443, 0.00350824, 0, 0.1882353, 1, 1,
0.3645487, -0.5963016, 4.662597, 0, 0.1843137, 1, 1,
0.3672571, -1.090027, 1.358275, 0, 0.1764706, 1, 1,
0.3788273, 0.7556095, -0.316955, 0, 0.172549, 1, 1,
0.3861723, -1.194156, 3.535321, 0, 0.1647059, 1, 1,
0.3951672, 0.05216481, 1.346778, 0, 0.1607843, 1, 1,
0.397665, -0.3857248, 1.600772, 0, 0.1529412, 1, 1,
0.3988115, -0.3517173, 1.999016, 0, 0.1490196, 1, 1,
0.3991154, 0.5621099, -1.111041, 0, 0.1411765, 1, 1,
0.4012265, -0.7266985, 3.93355, 0, 0.1372549, 1, 1,
0.4070796, -0.7293965, 2.820887, 0, 0.1294118, 1, 1,
0.4074013, 1.709772, -0.3752235, 0, 0.1254902, 1, 1,
0.4083844, 0.360321, 1.365909, 0, 0.1176471, 1, 1,
0.408562, 1.387627, 1.7092, 0, 0.1137255, 1, 1,
0.410456, -0.4505595, 0.2636958, 0, 0.1058824, 1, 1,
0.4108048, -1.198265, 2.210269, 0, 0.09803922, 1, 1,
0.410806, 1.509345, -0.09064673, 0, 0.09411765, 1, 1,
0.4148979, 0.5238277, 1.470664, 0, 0.08627451, 1, 1,
0.414974, -0.4095801, 2.987618, 0, 0.08235294, 1, 1,
0.4173192, 0.3965979, 1.963107, 0, 0.07450981, 1, 1,
0.4211838, -0.06354646, 1.36806, 0, 0.07058824, 1, 1,
0.4273525, 1.402639, -0.5829067, 0, 0.0627451, 1, 1,
0.4360817, -0.5590655, 1.500065, 0, 0.05882353, 1, 1,
0.43817, -0.1197528, 1.196855, 0, 0.05098039, 1, 1,
0.4402854, -0.3414829, 2.487809, 0, 0.04705882, 1, 1,
0.4449691, -0.4765692, 2.453672, 0, 0.03921569, 1, 1,
0.4471993, -1.03702, 3.115666, 0, 0.03529412, 1, 1,
0.4483087, 1.114161, 1.446087, 0, 0.02745098, 1, 1,
0.4511632, 0.1257215, 0.8786613, 0, 0.02352941, 1, 1,
0.4516789, -0.4345705, 3.939282, 0, 0.01568628, 1, 1,
0.4526882, 0.6404874, 0.2898464, 0, 0.01176471, 1, 1,
0.4530625, -0.5481055, -0.9717138, 0, 0.003921569, 1, 1,
0.4533377, -0.2062027, 1.316674, 0.003921569, 0, 1, 1,
0.4547862, 0.9325004, 1.260019, 0.007843138, 0, 1, 1,
0.4549676, 0.1313162, 1.801815, 0.01568628, 0, 1, 1,
0.4596434, 1.561113, 1.304942, 0.01960784, 0, 1, 1,
0.4603582, 1.280446, 0.1512367, 0.02745098, 0, 1, 1,
0.4608209, 2.01739, 0.4005896, 0.03137255, 0, 1, 1,
0.4702143, -0.1163378, -1.382344, 0.03921569, 0, 1, 1,
0.4741451, -0.3546161, 2.37656, 0.04313726, 0, 1, 1,
0.4763665, -1.168761, 4.911808, 0.05098039, 0, 1, 1,
0.4773409, -0.4630111, 2.508949, 0.05490196, 0, 1, 1,
0.4775884, -1.579346, 5.712808, 0.0627451, 0, 1, 1,
0.4785216, 0.9124237, -0.7673107, 0.06666667, 0, 1, 1,
0.4797222, -0.6217704, 1.476454, 0.07450981, 0, 1, 1,
0.4809862, 0.1188103, 1.514486, 0.07843138, 0, 1, 1,
0.4848433, -0.02146722, 2.11765, 0.08627451, 0, 1, 1,
0.4872655, 1.333611, 0.7850261, 0.09019608, 0, 1, 1,
0.4884306, 1.228383, -2.016271, 0.09803922, 0, 1, 1,
0.4889196, -0.608721, 2.24739, 0.1058824, 0, 1, 1,
0.4892906, -0.9552011, 1.413059, 0.1098039, 0, 1, 1,
0.4951469, 0.2693375, 0.757682, 0.1176471, 0, 1, 1,
0.4965423, -0.04097346, 2.776619, 0.1215686, 0, 1, 1,
0.5036599, -2.031459, 3.700126, 0.1294118, 0, 1, 1,
0.5039779, 0.6511773, -0.3598596, 0.1333333, 0, 1, 1,
0.5046083, 0.784912, 1.625238, 0.1411765, 0, 1, 1,
0.5095559, 1.387091, 0.9838155, 0.145098, 0, 1, 1,
0.5103678, -2.165632, 2.986921, 0.1529412, 0, 1, 1,
0.5114528, 0.355913, 0.5411236, 0.1568628, 0, 1, 1,
0.5126358, 0.563112, 2.198348, 0.1647059, 0, 1, 1,
0.5129939, -1.010396, 2.50668, 0.1686275, 0, 1, 1,
0.5148793, -0.419425, 2.459234, 0.1764706, 0, 1, 1,
0.519796, -1.235284, 1.062694, 0.1803922, 0, 1, 1,
0.5252627, -0.660603, 0.19797, 0.1882353, 0, 1, 1,
0.5259815, -0.3656441, 3.494315, 0.1921569, 0, 1, 1,
0.5291365, 0.6535845, 1.900025, 0.2, 0, 1, 1,
0.534622, -1.808867, 3.112179, 0.2078431, 0, 1, 1,
0.5425941, 1.152661, -0.6374553, 0.2117647, 0, 1, 1,
0.5446898, 0.4543802, 1.819189, 0.2196078, 0, 1, 1,
0.5452989, -0.336057, 3.584486, 0.2235294, 0, 1, 1,
0.5467961, -0.1357816, 0.7739231, 0.2313726, 0, 1, 1,
0.5472064, 1.450449, 1.661956, 0.2352941, 0, 1, 1,
0.5475106, -0.3959542, 2.572289, 0.2431373, 0, 1, 1,
0.5551238, -1.493145, 1.120614, 0.2470588, 0, 1, 1,
0.5720772, 0.5808485, 0.1987329, 0.254902, 0, 1, 1,
0.5765011, 0.3120473, 1.1603, 0.2588235, 0, 1, 1,
0.5855936, -0.08625279, 0.283359, 0.2666667, 0, 1, 1,
0.5905336, 0.963957, -0.09146973, 0.2705882, 0, 1, 1,
0.591098, -0.2049722, 1.897131, 0.2784314, 0, 1, 1,
0.5924757, 0.1703234, 2.486472, 0.282353, 0, 1, 1,
0.5971335, 0.2593302, 0.9565471, 0.2901961, 0, 1, 1,
0.5976558, 0.2411003, -1.001513, 0.2941177, 0, 1, 1,
0.6003836, 0.9290854, 1.006297, 0.3019608, 0, 1, 1,
0.6070868, -0.2875645, 2.813596, 0.3098039, 0, 1, 1,
0.6071844, -1.976143, 0.7090343, 0.3137255, 0, 1, 1,
0.6082958, 1.138181, 1.23149, 0.3215686, 0, 1, 1,
0.6112378, -0.9208621, 2.190672, 0.3254902, 0, 1, 1,
0.6112576, 2.255368, 1.183646, 0.3333333, 0, 1, 1,
0.6147732, 0.2419994, 3.025495, 0.3372549, 0, 1, 1,
0.6208634, 1.197549, 0.2196404, 0.345098, 0, 1, 1,
0.6244056, 0.7050261, 0.6195887, 0.3490196, 0, 1, 1,
0.6335836, -0.1616183, 1.825572, 0.3568628, 0, 1, 1,
0.6402144, -2.105154, 1.211537, 0.3607843, 0, 1, 1,
0.6428053, 0.1261946, 0.8299658, 0.3686275, 0, 1, 1,
0.6459717, 0.6918209, 0.09741593, 0.372549, 0, 1, 1,
0.6474722, 0.322425, 0.01473122, 0.3803922, 0, 1, 1,
0.6502897, -0.4082851, -0.2007795, 0.3843137, 0, 1, 1,
0.6506416, 0.03902036, 1.162226, 0.3921569, 0, 1, 1,
0.6531423, 0.8477569, 0.6741583, 0.3960784, 0, 1, 1,
0.6534106, -1.03728, 3.092285, 0.4039216, 0, 1, 1,
0.6620004, -0.8113936, 3.476773, 0.4117647, 0, 1, 1,
0.6683476, 1.207998, 1.335365, 0.4156863, 0, 1, 1,
0.6690874, -0.9930765, 2.389088, 0.4235294, 0, 1, 1,
0.678224, -1.092797, 2.092827, 0.427451, 0, 1, 1,
0.6789867, 0.8785533, 1.342792, 0.4352941, 0, 1, 1,
0.6844651, -0.346228, 2.405772, 0.4392157, 0, 1, 1,
0.6855327, -0.5323194, 2.381715, 0.4470588, 0, 1, 1,
0.6868749, 0.6170328, 1.357627, 0.4509804, 0, 1, 1,
0.6875702, 0.3967786, 2.678885, 0.4588235, 0, 1, 1,
0.6889784, 0.8350936, 0.9769313, 0.4627451, 0, 1, 1,
0.6893483, 1.323444, 0.3560404, 0.4705882, 0, 1, 1,
0.691888, 0.6385115, -0.5146632, 0.4745098, 0, 1, 1,
0.6943129, -0.4685565, 2.215693, 0.4823529, 0, 1, 1,
0.6962161, -0.6975848, 3.200265, 0.4862745, 0, 1, 1,
0.705559, -1.912331, 2.694727, 0.4941176, 0, 1, 1,
0.7058224, -0.09613163, 2.14172, 0.5019608, 0, 1, 1,
0.7084786, -1.470482, 2.650038, 0.5058824, 0, 1, 1,
0.7087036, 0.4301261, 2.64846, 0.5137255, 0, 1, 1,
0.7153229, -0.4484387, 2.191876, 0.5176471, 0, 1, 1,
0.7183142, -0.3606234, 2.124721, 0.5254902, 0, 1, 1,
0.7188323, 1.083968, 0.2448884, 0.5294118, 0, 1, 1,
0.7197568, -1.374403, 4.02324, 0.5372549, 0, 1, 1,
0.7202037, -0.3947592, 2.41561, 0.5411765, 0, 1, 1,
0.7264004, -0.7248266, 2.435723, 0.5490196, 0, 1, 1,
0.7267447, -0.1421196, 2.826161, 0.5529412, 0, 1, 1,
0.7347657, 0.4112253, -0.4081201, 0.5607843, 0, 1, 1,
0.7359523, -0.08598349, 2.652496, 0.5647059, 0, 1, 1,
0.7371387, -1.407362, 2.1342, 0.572549, 0, 1, 1,
0.7378944, -0.9022692, 2.64072, 0.5764706, 0, 1, 1,
0.7412249, -0.5044531, 1.309163, 0.5843138, 0, 1, 1,
0.7444884, 0.836749, -0.2668048, 0.5882353, 0, 1, 1,
0.7488396, -1.212044, 1.725333, 0.5960785, 0, 1, 1,
0.7601605, 1.268725, -0.37738, 0.6039216, 0, 1, 1,
0.7622615, 0.2951892, 0.4560987, 0.6078432, 0, 1, 1,
0.7669697, -0.1602269, 2.41492, 0.6156863, 0, 1, 1,
0.767966, 0.5540189, 0.7359388, 0.6196079, 0, 1, 1,
0.7695525, -0.6997966, 0.3839625, 0.627451, 0, 1, 1,
0.7728584, 0.05312666, 1.97561, 0.6313726, 0, 1, 1,
0.7753122, -0.9970185, 1.887165, 0.6392157, 0, 1, 1,
0.7767956, 0.6246296, -0.3020432, 0.6431373, 0, 1, 1,
0.7783059, -1.513767, 2.732491, 0.6509804, 0, 1, 1,
0.7851469, -0.4721111, 0.3684126, 0.654902, 0, 1, 1,
0.7882738, 0.2320974, 1.564782, 0.6627451, 0, 1, 1,
0.7898075, -0.5657465, 1.749291, 0.6666667, 0, 1, 1,
0.7935758, 0.7029896, 1.750165, 0.6745098, 0, 1, 1,
0.7945371, 0.1178974, 2.824944, 0.6784314, 0, 1, 1,
0.8029881, 1.408694, -0.8091739, 0.6862745, 0, 1, 1,
0.8032167, 2.021012, -0.9899252, 0.6901961, 0, 1, 1,
0.8058944, 0.5285361, 1.229831, 0.6980392, 0, 1, 1,
0.8098397, 0.2116026, 1.247899, 0.7058824, 0, 1, 1,
0.8117927, 0.998502, 1.241743, 0.7098039, 0, 1, 1,
0.8144612, 0.9805989, 1.133586, 0.7176471, 0, 1, 1,
0.8218575, 0.7301847, 0.8893008, 0.7215686, 0, 1, 1,
0.8311371, 0.2699838, 0.47359, 0.7294118, 0, 1, 1,
0.842648, 0.5411049, 0.5930386, 0.7333333, 0, 1, 1,
0.8464742, -1.138699, 2.756658, 0.7411765, 0, 1, 1,
0.8478135, -0.2944301, 1.859284, 0.7450981, 0, 1, 1,
0.8479673, 1.278391, 0.9767301, 0.7529412, 0, 1, 1,
0.8510562, -0.5345721, 0.07687163, 0.7568628, 0, 1, 1,
0.8570003, 0.535906, 1.423327, 0.7647059, 0, 1, 1,
0.8619166, -0.4860903, 3.002029, 0.7686275, 0, 1, 1,
0.8633747, 1.007645, -0.4640416, 0.7764706, 0, 1, 1,
0.8648255, 0.7667677, 1.646574, 0.7803922, 0, 1, 1,
0.868091, -0.2688354, 1.241899, 0.7882353, 0, 1, 1,
0.8695219, -0.1384792, 0.5140871, 0.7921569, 0, 1, 1,
0.8723798, 0.6283995, 0.401982, 0.8, 0, 1, 1,
0.8829849, -1.550282, 2.624182, 0.8078431, 0, 1, 1,
0.8844425, -0.5002302, 2.418817, 0.8117647, 0, 1, 1,
0.8879922, -0.9535199, 2.139887, 0.8196079, 0, 1, 1,
0.8900722, -1.283476, 4.584201, 0.8235294, 0, 1, 1,
0.8933722, -0.8109368, 2.068802, 0.8313726, 0, 1, 1,
0.8943437, 0.4408085, 2.59804, 0.8352941, 0, 1, 1,
0.8947696, -0.9148893, 2.936912, 0.8431373, 0, 1, 1,
0.8955491, 0.2949971, 2.834945, 0.8470588, 0, 1, 1,
0.8968619, 0.05075309, 1.599826, 0.854902, 0, 1, 1,
0.9063358, 0.3789135, 0.4855212, 0.8588235, 0, 1, 1,
0.9152719, 0.1379036, 0.9543459, 0.8666667, 0, 1, 1,
0.9289927, 0.5040121, 0.8005437, 0.8705882, 0, 1, 1,
0.9306112, 0.5177124, 0.3568777, 0.8784314, 0, 1, 1,
0.9307513, -0.1366077, 0.2655756, 0.8823529, 0, 1, 1,
0.9307814, -0.686956, 1.27191, 0.8901961, 0, 1, 1,
0.9328768, -0.3954301, 1.128822, 0.8941177, 0, 1, 1,
0.9386695, 1.46386, 0.1253822, 0.9019608, 0, 1, 1,
0.9408991, 0.6068872, 1.277567, 0.9098039, 0, 1, 1,
0.9431627, -0.5219595, 0.6968888, 0.9137255, 0, 1, 1,
0.9457954, -0.971443, 2.264485, 0.9215686, 0, 1, 1,
0.9484544, -0.01113607, 0.4876297, 0.9254902, 0, 1, 1,
0.9510154, 3.005236, 0.2941557, 0.9333333, 0, 1, 1,
0.953074, -0.3851134, 3.25724, 0.9372549, 0, 1, 1,
0.9547161, 1.330013, 0.3979339, 0.945098, 0, 1, 1,
0.9578452, 0.2279417, 2.354475, 0.9490196, 0, 1, 1,
0.9618051, -0.959261, 2.468552, 0.9568627, 0, 1, 1,
0.9651216, -0.4132503, 1.996377, 0.9607843, 0, 1, 1,
0.9683576, -0.2165398, 0.9514834, 0.9686275, 0, 1, 1,
0.9750417, -1.3095, 2.801365, 0.972549, 0, 1, 1,
0.9762266, 0.9603804, -0.9448903, 0.9803922, 0, 1, 1,
0.9824306, -0.5182858, 0.741497, 0.9843137, 0, 1, 1,
0.9845217, -0.4843887, 3.26587, 0.9921569, 0, 1, 1,
0.9899803, -0.729176, 2.982715, 0.9960784, 0, 1, 1,
1.003983, 0.9225054, 2.522364, 1, 0, 0.9960784, 1,
1.005816, 0.8883384, 0.07089686, 1, 0, 0.9882353, 1,
1.016893, -1.070742, 3.031634, 1, 0, 0.9843137, 1,
1.020796, -0.3037483, 0.4637276, 1, 0, 0.9764706, 1,
1.024086, -1.520704, 2.038611, 1, 0, 0.972549, 1,
1.026671, 1.097101, 1.125969, 1, 0, 0.9647059, 1,
1.028955, 1.350417, 1.578482, 1, 0, 0.9607843, 1,
1.030575, 0.6409877, 1.14782, 1, 0, 0.9529412, 1,
1.031858, 0.3145028, -0.02297042, 1, 0, 0.9490196, 1,
1.041763, -1.844695, 3.392781, 1, 0, 0.9411765, 1,
1.042544, 0.3600449, -0.07112614, 1, 0, 0.9372549, 1,
1.050439, -1.285522, 4.159394, 1, 0, 0.9294118, 1,
1.054231, -0.369996, 2.264854, 1, 0, 0.9254902, 1,
1.054666, -1.205955, 2.602775, 1, 0, 0.9176471, 1,
1.054832, 1.04546, 2.020756, 1, 0, 0.9137255, 1,
1.059768, -0.4700047, 2.434701, 1, 0, 0.9058824, 1,
1.067675, -0.3818501, 2.474705, 1, 0, 0.9019608, 1,
1.079933, 0.7422225, 0.4440714, 1, 0, 0.8941177, 1,
1.083594, -1.123389, 1.728164, 1, 0, 0.8862745, 1,
1.08385, 0.03549891, 2.42539, 1, 0, 0.8823529, 1,
1.088254, -1.308135, 3.189005, 1, 0, 0.8745098, 1,
1.093253, -1.602976, 2.682336, 1, 0, 0.8705882, 1,
1.095445, 1.052021, -0.1399603, 1, 0, 0.8627451, 1,
1.104929, 1.300486, 1.839014, 1, 0, 0.8588235, 1,
1.105393, -0.5752997, 2.08193, 1, 0, 0.8509804, 1,
1.108222, 0.0005866254, 0.1362205, 1, 0, 0.8470588, 1,
1.109335, -1.497722, 3.468949, 1, 0, 0.8392157, 1,
1.115039, 0.6495646, 1.142454, 1, 0, 0.8352941, 1,
1.120183, 0.3514462, 1.53128, 1, 0, 0.827451, 1,
1.130038, -1.260145, 4.029629, 1, 0, 0.8235294, 1,
1.131778, -0.7596678, 0.3492614, 1, 0, 0.8156863, 1,
1.137122, -0.4291718, 2.71782, 1, 0, 0.8117647, 1,
1.140997, 0.7071412, 1.444302, 1, 0, 0.8039216, 1,
1.146681, 0.640442, 1.109167, 1, 0, 0.7960784, 1,
1.151076, -0.9347558, 1.734222, 1, 0, 0.7921569, 1,
1.162158, -1.408891, 2.459852, 1, 0, 0.7843137, 1,
1.167838, -0.8371324, 3.390169, 1, 0, 0.7803922, 1,
1.168122, 0.1248591, 1.155445, 1, 0, 0.772549, 1,
1.16873, -1.183815, 2.375854, 1, 0, 0.7686275, 1,
1.174706, 0.4423936, 1.567661, 1, 0, 0.7607843, 1,
1.189717, 1.407011, 2.220618, 1, 0, 0.7568628, 1,
1.19023, -0.2092508, 3.872344, 1, 0, 0.7490196, 1,
1.203415, 0.8748564, 0.5549645, 1, 0, 0.7450981, 1,
1.205647, -0.7801134, 2.172257, 1, 0, 0.7372549, 1,
1.206447, -1.198361, 2.912658, 1, 0, 0.7333333, 1,
1.20899, 0.5520762, 1.821772, 1, 0, 0.7254902, 1,
1.222192, 1.794864, -0.1282604, 1, 0, 0.7215686, 1,
1.227148, -0.8009942, 2.849052, 1, 0, 0.7137255, 1,
1.245773, 0.3630458, 1.474071, 1, 0, 0.7098039, 1,
1.256202, 2.283107, 0.7865318, 1, 0, 0.7019608, 1,
1.258232, -0.6788039, 0.6259472, 1, 0, 0.6941177, 1,
1.265265, 0.5542459, -0.3897597, 1, 0, 0.6901961, 1,
1.265793, -0.1187243, 1.154684, 1, 0, 0.682353, 1,
1.266088, -1.287496, 2.627479, 1, 0, 0.6784314, 1,
1.270955, 1.564175, 1.735124, 1, 0, 0.6705883, 1,
1.280122, -0.3510771, 2.265436, 1, 0, 0.6666667, 1,
1.29158, 1.311885, 0.7186728, 1, 0, 0.6588235, 1,
1.30241, -0.7412428, 2.06075, 1, 0, 0.654902, 1,
1.316261, 0.5279081, 0.0786255, 1, 0, 0.6470588, 1,
1.317865, -0.3245519, 3.326067, 1, 0, 0.6431373, 1,
1.320174, 0.1644027, 2.603018, 1, 0, 0.6352941, 1,
1.320919, 0.3317847, 3.866704, 1, 0, 0.6313726, 1,
1.325295, -0.5930476, 2.379274, 1, 0, 0.6235294, 1,
1.325316, 0.6239046, -0.9577964, 1, 0, 0.6196079, 1,
1.334613, -1.301701, 3.297783, 1, 0, 0.6117647, 1,
1.340181, 1.160703, 0.2560416, 1, 0, 0.6078432, 1,
1.347766, 0.844278, 1.254329, 1, 0, 0.6, 1,
1.348969, -0.4059307, 2.35556, 1, 0, 0.5921569, 1,
1.351262, -0.2796102, 2.301564, 1, 0, 0.5882353, 1,
1.366666, -1.066961, 3.405283, 1, 0, 0.5803922, 1,
1.390641, 0.5161071, 3.196286, 1, 0, 0.5764706, 1,
1.411356, 2.565426, 0.9911014, 1, 0, 0.5686275, 1,
1.413889, -0.4325082, 2.166046, 1, 0, 0.5647059, 1,
1.427495, -0.07927898, 3.487307, 1, 0, 0.5568628, 1,
1.429735, -0.5084055, 2.148972, 1, 0, 0.5529412, 1,
1.434663, 0.623576, 0.6259601, 1, 0, 0.5450981, 1,
1.438167, -0.8737491, 2.909783, 1, 0, 0.5411765, 1,
1.445053, 0.1115298, 1.934742, 1, 0, 0.5333334, 1,
1.447797, -0.02861033, 1.212615, 1, 0, 0.5294118, 1,
1.448595, 1.428222, 1.596541, 1, 0, 0.5215687, 1,
1.450912, -0.2076895, 2.042073, 1, 0, 0.5176471, 1,
1.451156, 0.104784, 0.7813318, 1, 0, 0.509804, 1,
1.456948, -1.027041, 2.440957, 1, 0, 0.5058824, 1,
1.457147, 0.6058496, 0.6689353, 1, 0, 0.4980392, 1,
1.463915, 1.633513, 0.7735007, 1, 0, 0.4901961, 1,
1.46931, -0.6168058, 1.369433, 1, 0, 0.4862745, 1,
1.470199, -0.1327578, 2.550407, 1, 0, 0.4784314, 1,
1.474507, -0.3704905, 2.313788, 1, 0, 0.4745098, 1,
1.476905, 1.118428, -0.1283593, 1, 0, 0.4666667, 1,
1.47793, -1.659016, 1.109151, 1, 0, 0.4627451, 1,
1.479537, 1.702064, -0.2314968, 1, 0, 0.454902, 1,
1.484365, -0.6538246, 0.7463432, 1, 0, 0.4509804, 1,
1.501523, 0.8927221, 1.938245, 1, 0, 0.4431373, 1,
1.502583, -0.985845, 2.526208, 1, 0, 0.4392157, 1,
1.502897, -1.149036, 2.7984, 1, 0, 0.4313726, 1,
1.505563, -0.7692982, 0.4858956, 1, 0, 0.427451, 1,
1.510253, -0.676684, 1.834097, 1, 0, 0.4196078, 1,
1.510792, 1.036669, 1.622094, 1, 0, 0.4156863, 1,
1.513729, -0.6375656, 2.023104, 1, 0, 0.4078431, 1,
1.51722, -1.151373, -0.1582257, 1, 0, 0.4039216, 1,
1.531769, 0.09410475, 1.495236, 1, 0, 0.3960784, 1,
1.536587, 0.6501669, 0.6600251, 1, 0, 0.3882353, 1,
1.542009, -0.2305548, 1.183425, 1, 0, 0.3843137, 1,
1.568046, -0.4324297, 2.306124, 1, 0, 0.3764706, 1,
1.585476, -0.1735633, 1.263496, 1, 0, 0.372549, 1,
1.593577, -0.9961589, 1.674347, 1, 0, 0.3647059, 1,
1.593758, -0.02222594, 1.440985, 1, 0, 0.3607843, 1,
1.604882, -0.02831914, 0.3505039, 1, 0, 0.3529412, 1,
1.610554, -0.6457999, 3.690649, 1, 0, 0.3490196, 1,
1.612708, -0.0751415, 1.894936, 1, 0, 0.3411765, 1,
1.619504, -0.1743583, 0.1486967, 1, 0, 0.3372549, 1,
1.623857, 0.4072601, 2.945404, 1, 0, 0.3294118, 1,
1.634648, -0.03698677, 1.619653, 1, 0, 0.3254902, 1,
1.652802, -1.263415, 2.770508, 1, 0, 0.3176471, 1,
1.661074, 0.7078599, 2.386629, 1, 0, 0.3137255, 1,
1.661243, -0.9380337, 0.7186521, 1, 0, 0.3058824, 1,
1.688358, 0.02376771, 2.840003, 1, 0, 0.2980392, 1,
1.694429, 1.023325, 0.9149664, 1, 0, 0.2941177, 1,
1.706496, -0.7386167, 1.67872, 1, 0, 0.2862745, 1,
1.718639, -0.9231751, 3.943976, 1, 0, 0.282353, 1,
1.744372, 0.2468901, 2.774914, 1, 0, 0.2745098, 1,
1.762144, -0.8516634, 2.420304, 1, 0, 0.2705882, 1,
1.764303, 0.951773, 2.07727, 1, 0, 0.2627451, 1,
1.767936, -0.1400439, 1.656535, 1, 0, 0.2588235, 1,
1.770947, 0.2922668, 1.415718, 1, 0, 0.2509804, 1,
1.781523, 1.359874, 1.841962, 1, 0, 0.2470588, 1,
1.783228, -0.2093538, 1.432184, 1, 0, 0.2392157, 1,
1.786968, -0.08101099, 2.138517, 1, 0, 0.2352941, 1,
1.793314, 0.2373016, 1.73399, 1, 0, 0.227451, 1,
1.799164, 1.018265, 2.43836, 1, 0, 0.2235294, 1,
1.805157, -2.556888, 3.562014, 1, 0, 0.2156863, 1,
1.81564, -0.4693716, -1.005474, 1, 0, 0.2117647, 1,
1.819094, -0.9163932, 2.093161, 1, 0, 0.2039216, 1,
1.854014, -0.524839, 1.766781, 1, 0, 0.1960784, 1,
1.855804, -0.2928466, 1.365135, 1, 0, 0.1921569, 1,
1.873377, -1.150044, 2.01799, 1, 0, 0.1843137, 1,
1.886797, 0.9722639, 1.293486, 1, 0, 0.1803922, 1,
1.901732, 1.285354, -0.01716054, 1, 0, 0.172549, 1,
1.92712, -0.7315581, 3.143062, 1, 0, 0.1686275, 1,
1.951212, 0.002825896, 1.047684, 1, 0, 0.1607843, 1,
1.958358, -2.149491, 2.002074, 1, 0, 0.1568628, 1,
1.963628, 0.2317122, -0.004298432, 1, 0, 0.1490196, 1,
1.965569, 1.056322, 0.1798089, 1, 0, 0.145098, 1,
1.969745, 1.333545, 2.098859, 1, 0, 0.1372549, 1,
1.986735, -0.07692032, 3.504935, 1, 0, 0.1333333, 1,
1.99135, -1.172438, 2.92751, 1, 0, 0.1254902, 1,
1.99664, -0.5334306, 3.246714, 1, 0, 0.1215686, 1,
1.997682, 0.4709933, -0.1802954, 1, 0, 0.1137255, 1,
2.036957, 0.4511127, 1.887265, 1, 0, 0.1098039, 1,
2.044815, -1.477713, 3.609924, 1, 0, 0.1019608, 1,
2.080747, -1.517569, 1.980172, 1, 0, 0.09411765, 1,
2.110262, -0.3357249, 2.001017, 1, 0, 0.09019608, 1,
2.114787, -0.3184631, 1.152693, 1, 0, 0.08235294, 1,
2.124022, -1.059389, 1.192567, 1, 0, 0.07843138, 1,
2.183011, 0.7619799, 0.3410766, 1, 0, 0.07058824, 1,
2.259145, -0.6629797, 2.307843, 1, 0, 0.06666667, 1,
2.278444, -0.302608, 2.047534, 1, 0, 0.05882353, 1,
2.31609, 0.02188233, 3.175163, 1, 0, 0.05490196, 1,
2.374233, -0.1505997, 2.35988, 1, 0, 0.04705882, 1,
2.407382, -1.237692, 4.370975, 1, 0, 0.04313726, 1,
2.512874, -2.428475, 1.39742, 1, 0, 0.03529412, 1,
2.610573, -0.471494, 2.402424, 1, 0, 0.03137255, 1,
2.674708, 0.2036711, 0.65595, 1, 0, 0.02352941, 1,
2.960363, 1.476961, 2.153777, 1, 0, 0.01960784, 1,
3.0408, -1.093241, 2.376973, 1, 0, 0.01176471, 1,
3.252782, -0.536038, 1.602068, 1, 0, 0.007843138, 1
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
-0.03638172, -3.709874, -7.223837, 0, -0.5, 0.5, 0.5,
-0.03638172, -3.709874, -7.223837, 1, -0.5, 0.5, 0.5,
-0.03638172, -3.709874, -7.223837, 1, 1.5, 0.5, 0.5,
-0.03638172, -3.709874, -7.223837, 0, 1.5, 0.5, 0.5
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
-4.440572, 0.2126987, -7.223837, 0, -0.5, 0.5, 0.5,
-4.440572, 0.2126987, -7.223837, 1, -0.5, 0.5, 0.5,
-4.440572, 0.2126987, -7.223837, 1, 1.5, 0.5, 0.5,
-4.440572, 0.2126987, -7.223837, 0, 1.5, 0.5, 0.5
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
-4.440572, -3.709874, 0.1819637, 0, -0.5, 0.5, 0.5,
-4.440572, -3.709874, 0.1819637, 1, -0.5, 0.5, 0.5,
-4.440572, -3.709874, 0.1819637, 1, 1.5, 0.5, 0.5,
-4.440572, -3.709874, 0.1819637, 0, 1.5, 0.5, 0.5
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
-3, -2.804665, -5.514806,
3, -2.804665, -5.514806,
-3, -2.804665, -5.514806,
-3, -2.955533, -5.799644,
-2, -2.804665, -5.514806,
-2, -2.955533, -5.799644,
-1, -2.804665, -5.514806,
-1, -2.955533, -5.799644,
0, -2.804665, -5.514806,
0, -2.955533, -5.799644,
1, -2.804665, -5.514806,
1, -2.955533, -5.799644,
2, -2.804665, -5.514806,
2, -2.955533, -5.799644,
3, -2.804665, -5.514806,
3, -2.955533, -5.799644
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
-3, -3.25727, -6.369321, 0, -0.5, 0.5, 0.5,
-3, -3.25727, -6.369321, 1, -0.5, 0.5, 0.5,
-3, -3.25727, -6.369321, 1, 1.5, 0.5, 0.5,
-3, -3.25727, -6.369321, 0, 1.5, 0.5, 0.5,
-2, -3.25727, -6.369321, 0, -0.5, 0.5, 0.5,
-2, -3.25727, -6.369321, 1, -0.5, 0.5, 0.5,
-2, -3.25727, -6.369321, 1, 1.5, 0.5, 0.5,
-2, -3.25727, -6.369321, 0, 1.5, 0.5, 0.5,
-1, -3.25727, -6.369321, 0, -0.5, 0.5, 0.5,
-1, -3.25727, -6.369321, 1, -0.5, 0.5, 0.5,
-1, -3.25727, -6.369321, 1, 1.5, 0.5, 0.5,
-1, -3.25727, -6.369321, 0, 1.5, 0.5, 0.5,
0, -3.25727, -6.369321, 0, -0.5, 0.5, 0.5,
0, -3.25727, -6.369321, 1, -0.5, 0.5, 0.5,
0, -3.25727, -6.369321, 1, 1.5, 0.5, 0.5,
0, -3.25727, -6.369321, 0, 1.5, 0.5, 0.5,
1, -3.25727, -6.369321, 0, -0.5, 0.5, 0.5,
1, -3.25727, -6.369321, 1, -0.5, 0.5, 0.5,
1, -3.25727, -6.369321, 1, 1.5, 0.5, 0.5,
1, -3.25727, -6.369321, 0, 1.5, 0.5, 0.5,
2, -3.25727, -6.369321, 0, -0.5, 0.5, 0.5,
2, -3.25727, -6.369321, 1, -0.5, 0.5, 0.5,
2, -3.25727, -6.369321, 1, 1.5, 0.5, 0.5,
2, -3.25727, -6.369321, 0, 1.5, 0.5, 0.5,
3, -3.25727, -6.369321, 0, -0.5, 0.5, 0.5,
3, -3.25727, -6.369321, 1, -0.5, 0.5, 0.5,
3, -3.25727, -6.369321, 1, 1.5, 0.5, 0.5,
3, -3.25727, -6.369321, 0, 1.5, 0.5, 0.5
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
-3.424221, -2, -5.514806,
-3.424221, 3, -5.514806,
-3.424221, -2, -5.514806,
-3.593613, -2, -5.799644,
-3.424221, -1, -5.514806,
-3.593613, -1, -5.799644,
-3.424221, 0, -5.514806,
-3.593613, 0, -5.799644,
-3.424221, 1, -5.514806,
-3.593613, 1, -5.799644,
-3.424221, 2, -5.514806,
-3.593613, 2, -5.799644,
-3.424221, 3, -5.514806,
-3.593613, 3, -5.799644
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
-3.932397, -2, -6.369321, 0, -0.5, 0.5, 0.5,
-3.932397, -2, -6.369321, 1, -0.5, 0.5, 0.5,
-3.932397, -2, -6.369321, 1, 1.5, 0.5, 0.5,
-3.932397, -2, -6.369321, 0, 1.5, 0.5, 0.5,
-3.932397, -1, -6.369321, 0, -0.5, 0.5, 0.5,
-3.932397, -1, -6.369321, 1, -0.5, 0.5, 0.5,
-3.932397, -1, -6.369321, 1, 1.5, 0.5, 0.5,
-3.932397, -1, -6.369321, 0, 1.5, 0.5, 0.5,
-3.932397, 0, -6.369321, 0, -0.5, 0.5, 0.5,
-3.932397, 0, -6.369321, 1, -0.5, 0.5, 0.5,
-3.932397, 0, -6.369321, 1, 1.5, 0.5, 0.5,
-3.932397, 0, -6.369321, 0, 1.5, 0.5, 0.5,
-3.932397, 1, -6.369321, 0, -0.5, 0.5, 0.5,
-3.932397, 1, -6.369321, 1, -0.5, 0.5, 0.5,
-3.932397, 1, -6.369321, 1, 1.5, 0.5, 0.5,
-3.932397, 1, -6.369321, 0, 1.5, 0.5, 0.5,
-3.932397, 2, -6.369321, 0, -0.5, 0.5, 0.5,
-3.932397, 2, -6.369321, 1, -0.5, 0.5, 0.5,
-3.932397, 2, -6.369321, 1, 1.5, 0.5, 0.5,
-3.932397, 2, -6.369321, 0, 1.5, 0.5, 0.5,
-3.932397, 3, -6.369321, 0, -0.5, 0.5, 0.5,
-3.932397, 3, -6.369321, 1, -0.5, 0.5, 0.5,
-3.932397, 3, -6.369321, 1, 1.5, 0.5, 0.5,
-3.932397, 3, -6.369321, 0, 1.5, 0.5, 0.5
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
-3.424221, -2.804665, -4,
-3.424221, -2.804665, 4,
-3.424221, -2.804665, -4,
-3.593613, -2.955533, -4,
-3.424221, -2.804665, -2,
-3.593613, -2.955533, -2,
-3.424221, -2.804665, 0,
-3.593613, -2.955533, 0,
-3.424221, -2.804665, 2,
-3.593613, -2.955533, 2,
-3.424221, -2.804665, 4,
-3.593613, -2.955533, 4
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
-3.932397, -3.25727, -4, 0, -0.5, 0.5, 0.5,
-3.932397, -3.25727, -4, 1, -0.5, 0.5, 0.5,
-3.932397, -3.25727, -4, 1, 1.5, 0.5, 0.5,
-3.932397, -3.25727, -4, 0, 1.5, 0.5, 0.5,
-3.932397, -3.25727, -2, 0, -0.5, 0.5, 0.5,
-3.932397, -3.25727, -2, 1, -0.5, 0.5, 0.5,
-3.932397, -3.25727, -2, 1, 1.5, 0.5, 0.5,
-3.932397, -3.25727, -2, 0, 1.5, 0.5, 0.5,
-3.932397, -3.25727, 0, 0, -0.5, 0.5, 0.5,
-3.932397, -3.25727, 0, 1, -0.5, 0.5, 0.5,
-3.932397, -3.25727, 0, 1, 1.5, 0.5, 0.5,
-3.932397, -3.25727, 0, 0, 1.5, 0.5, 0.5,
-3.932397, -3.25727, 2, 0, -0.5, 0.5, 0.5,
-3.932397, -3.25727, 2, 1, -0.5, 0.5, 0.5,
-3.932397, -3.25727, 2, 1, 1.5, 0.5, 0.5,
-3.932397, -3.25727, 2, 0, 1.5, 0.5, 0.5,
-3.932397, -3.25727, 4, 0, -0.5, 0.5, 0.5,
-3.932397, -3.25727, 4, 1, -0.5, 0.5, 0.5,
-3.932397, -3.25727, 4, 1, 1.5, 0.5, 0.5,
-3.932397, -3.25727, 4, 0, 1.5, 0.5, 0.5
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
-3.424221, -2.804665, -5.514806,
-3.424221, 3.230062, -5.514806,
-3.424221, -2.804665, 5.878734,
-3.424221, 3.230062, 5.878734,
-3.424221, -2.804665, -5.514806,
-3.424221, -2.804665, 5.878734,
-3.424221, 3.230062, -5.514806,
-3.424221, 3.230062, 5.878734,
-3.424221, -2.804665, -5.514806,
3.351457, -2.804665, -5.514806,
-3.424221, -2.804665, 5.878734,
3.351457, -2.804665, 5.878734,
-3.424221, 3.230062, -5.514806,
3.351457, 3.230062, -5.514806,
-3.424221, 3.230062, 5.878734,
3.351457, 3.230062, 5.878734,
3.351457, -2.804665, -5.514806,
3.351457, 3.230062, -5.514806,
3.351457, -2.804665, 5.878734,
3.351457, 3.230062, 5.878734,
3.351457, -2.804665, -5.514806,
3.351457, -2.804665, 5.878734,
3.351457, 3.230062, -5.514806,
3.351457, 3.230062, 5.878734
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
var radius = 7.77745;
var distance = 34.60276;
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
mvMatrix.translate( 0.03638172, -0.2126987, -0.1819637 );
mvMatrix.scale( 1.241076, 1.393457, 0.7380614 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.60276);
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
oxaziclomefone<-read.table("oxaziclomefone.xyz")
```

```
## Error in read.table("oxaziclomefone.xyz"): no lines available in input
```

```r
x<-oxaziclomefone$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxaziclomefone' not found
```

```r
y<-oxaziclomefone$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxaziclomefone' not found
```

```r
z<-oxaziclomefone$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxaziclomefone' not found
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
-3.325546, -0.8754195, -0.3263886, 0, 0, 1, 1, 1,
-3.156086, 0.8388351, -0.5438763, 1, 0, 0, 1, 1,
-3.153225, -0.733772, -1.278018, 1, 0, 0, 1, 1,
-3.0852, -0.02255094, -0.2733907, 1, 0, 0, 1, 1,
-3.022516, 0.8288853, -1.325858, 1, 0, 0, 1, 1,
-2.757915, 0.9208499, -0.6550334, 1, 0, 0, 1, 1,
-2.756409, -1.501575, -2.225375, 0, 0, 0, 1, 1,
-2.653268, -1.316223, -2.287975, 0, 0, 0, 1, 1,
-2.611696, -0.8463917, -2.522076, 0, 0, 0, 1, 1,
-2.605907, 1.123892, -1.702306, 0, 0, 0, 1, 1,
-2.573268, 0.5456023, -3.851192, 0, 0, 0, 1, 1,
-2.566222, -1.056279, -2.324126, 0, 0, 0, 1, 1,
-2.537663, 1.049942, -2.839233, 0, 0, 0, 1, 1,
-2.410914, 0.08607557, -0.8534369, 1, 1, 1, 1, 1,
-2.379922, 1.024705, 1.499604, 1, 1, 1, 1, 1,
-2.365688, -0.9699517, -2.675248, 1, 1, 1, 1, 1,
-2.303139, 0.6794548, 0.5597021, 1, 1, 1, 1, 1,
-2.273721, -0.4669982, -1.920005, 1, 1, 1, 1, 1,
-2.209527, 0.5679782, -1.883223, 1, 1, 1, 1, 1,
-2.192411, 0.4783915, -0.6519582, 1, 1, 1, 1, 1,
-2.145232, -0.6814818, -1.839198, 1, 1, 1, 1, 1,
-2.110295, 0.1408633, -1.707129, 1, 1, 1, 1, 1,
-2.080943, -0.5342242, -2.628043, 1, 1, 1, 1, 1,
-2.055459, 0.07520514, -1.429373, 1, 1, 1, 1, 1,
-2.042553, -0.2950521, -2.139758, 1, 1, 1, 1, 1,
-1.979163, 0.716795, -1.61082, 1, 1, 1, 1, 1,
-1.971298, -0.3423424, -0.9774452, 1, 1, 1, 1, 1,
-1.950834, 0.1400997, -1.803079, 1, 1, 1, 1, 1,
-1.9365, 0.8463696, 0.276982, 0, 0, 1, 1, 1,
-1.934269, 0.8035838, 0.1527586, 1, 0, 0, 1, 1,
-1.918015, -0.6588947, -3.647588, 1, 0, 0, 1, 1,
-1.904484, -0.008806948, -1.508706, 1, 0, 0, 1, 1,
-1.901342, -1.206681, -1.914158, 1, 0, 0, 1, 1,
-1.891771, 2.30051, -0.4839527, 1, 0, 0, 1, 1,
-1.873931, 1.009527, 1.163697, 0, 0, 0, 1, 1,
-1.837557, -0.8097124, -2.29584, 0, 0, 0, 1, 1,
-1.820307, 0.6064574, -3.113795, 0, 0, 0, 1, 1,
-1.79611, 0.5571035, -1.723387, 0, 0, 0, 1, 1,
-1.77061, 0.3875335, -3.571822, 0, 0, 0, 1, 1,
-1.754197, -1.746538, -0.8200989, 0, 0, 0, 1, 1,
-1.747726, 1.920195, -1.548492, 0, 0, 0, 1, 1,
-1.740954, 0.510637, -0.7705966, 1, 1, 1, 1, 1,
-1.737159, 0.1748653, -3.398951, 1, 1, 1, 1, 1,
-1.732825, 1.312759, 0.5858582, 1, 1, 1, 1, 1,
-1.71828, 0.6052595, -2.545051, 1, 1, 1, 1, 1,
-1.680866, -0.5374555, -0.5589045, 1, 1, 1, 1, 1,
-1.667659, -0.9764711, -2.265956, 1, 1, 1, 1, 1,
-1.640336, 0.5309669, -2.330202, 1, 1, 1, 1, 1,
-1.628656, -1.099964, -0.6533427, 1, 1, 1, 1, 1,
-1.604035, -0.01365153, -1.426685, 1, 1, 1, 1, 1,
-1.595629, -2.638309, -1.941432, 1, 1, 1, 1, 1,
-1.586612, 1.107329, 0.3517323, 1, 1, 1, 1, 1,
-1.586339, -0.1546163, -1.732845, 1, 1, 1, 1, 1,
-1.577267, -0.06725844, -1.76966, 1, 1, 1, 1, 1,
-1.573775, -0.334776, -0.5948398, 1, 1, 1, 1, 1,
-1.561635, -0.43953, -1.51177, 1, 1, 1, 1, 1,
-1.553968, 0.1542895, -1.810674, 0, 0, 1, 1, 1,
-1.553562, 0.5996353, -2.339514, 1, 0, 0, 1, 1,
-1.552924, 0.5214589, -1.801611, 1, 0, 0, 1, 1,
-1.551172, -0.5391985, -1.21249, 1, 0, 0, 1, 1,
-1.539568, 1.315644, -2.555781, 1, 0, 0, 1, 1,
-1.535688, 0.9885111, -0.6100809, 1, 0, 0, 1, 1,
-1.53468, -0.6035126, -1.397808, 0, 0, 0, 1, 1,
-1.52804, 0.7911304, -0.5100798, 0, 0, 0, 1, 1,
-1.526435, -0.3899564, -1.881407, 0, 0, 0, 1, 1,
-1.525325, -1.341333, -3.268226, 0, 0, 0, 1, 1,
-1.508577, 0.4635988, -2.833521, 0, 0, 0, 1, 1,
-1.50711, -0.4312389, -1.665144, 0, 0, 0, 1, 1,
-1.504459, -0.2223795, -1.132789, 0, 0, 0, 1, 1,
-1.494261, 0.4159827, -2.098602, 1, 1, 1, 1, 1,
-1.462039, 0.1738547, -0.3050884, 1, 1, 1, 1, 1,
-1.45155, -0.5322117, -2.749081, 1, 1, 1, 1, 1,
-1.445631, 0.107346, -1.303509, 1, 1, 1, 1, 1,
-1.443287, -0.641655, -2.247331, 1, 1, 1, 1, 1,
-1.440558, 1.059767, -1.454801, 1, 1, 1, 1, 1,
-1.438441, 0.8879248, -2.144038, 1, 1, 1, 1, 1,
-1.421228, -1.804073, -1.445407, 1, 1, 1, 1, 1,
-1.395009, -1.84186, -1.100232, 1, 1, 1, 1, 1,
-1.384954, 0.4170396, -2.319299, 1, 1, 1, 1, 1,
-1.378797, -0.5152221, -0.6822047, 1, 1, 1, 1, 1,
-1.378767, -0.3931583, -0.2937638, 1, 1, 1, 1, 1,
-1.377524, 1.79932, 1.38134, 1, 1, 1, 1, 1,
-1.371527, -0.387812, -2.248754, 1, 1, 1, 1, 1,
-1.367154, 0.1165513, -1.543163, 1, 1, 1, 1, 1,
-1.362251, -0.03326534, -0.6856174, 0, 0, 1, 1, 1,
-1.354625, -0.9071698, -3.421327, 1, 0, 0, 1, 1,
-1.339729, -0.3580359, -2.055273, 1, 0, 0, 1, 1,
-1.322013, -1.352262, -2.120282, 1, 0, 0, 1, 1,
-1.320491, 0.3144064, -0.3870378, 1, 0, 0, 1, 1,
-1.304142, 0.04790795, -3.526839, 1, 0, 0, 1, 1,
-1.293101, 1.030473, 0.05984288, 0, 0, 0, 1, 1,
-1.292339, -0.3782635, -2.326995, 0, 0, 0, 1, 1,
-1.290672, -0.3368022, -1.621305, 0, 0, 0, 1, 1,
-1.284847, 1.571292, 1.339852, 0, 0, 0, 1, 1,
-1.279205, 0.7718734, -2.771123, 0, 0, 0, 1, 1,
-1.272888, 0.5101636, -1.304241, 0, 0, 0, 1, 1,
-1.249901, 0.7903937, -0.3718868, 0, 0, 0, 1, 1,
-1.246778, -0.5267943, -1.074392, 1, 1, 1, 1, 1,
-1.2456, 1.163211, 0.4061183, 1, 1, 1, 1, 1,
-1.238572, 1.765471, 0.1388305, 1, 1, 1, 1, 1,
-1.223553, 0.5789266, -2.362983, 1, 1, 1, 1, 1,
-1.219412, -0.04303249, -0.9431829, 1, 1, 1, 1, 1,
-1.217826, -1.012806, -2.921301, 1, 1, 1, 1, 1,
-1.201308, -1.247998, -1.223303, 1, 1, 1, 1, 1,
-1.194418, 0.1370461, -2.714589, 1, 1, 1, 1, 1,
-1.183021, 0.7185531, -1.59227, 1, 1, 1, 1, 1,
-1.177626, 0.4246836, -1.70115, 1, 1, 1, 1, 1,
-1.174635, 0.001236092, -2.249489, 1, 1, 1, 1, 1,
-1.171022, 0.7033424, 0.1868069, 1, 1, 1, 1, 1,
-1.156869, -0.8690193, -3.504016, 1, 1, 1, 1, 1,
-1.142066, 0.2647976, -0.9823146, 1, 1, 1, 1, 1,
-1.139368, -0.2711752, -1.08921, 1, 1, 1, 1, 1,
-1.136515, -0.5608525, -2.233286, 0, 0, 1, 1, 1,
-1.135487, 1.68777, -0.7581668, 1, 0, 0, 1, 1,
-1.133131, -1.045146, -3.525588, 1, 0, 0, 1, 1,
-1.132261, 0.3563724, 0.3516535, 1, 0, 0, 1, 1,
-1.129622, -0.1711252, -0.315906, 1, 0, 0, 1, 1,
-1.127734, -0.9267558, -2.690165, 1, 0, 0, 1, 1,
-1.12356, -0.6560655, -2.135791, 0, 0, 0, 1, 1,
-1.11438, -1.48505, -3.844861, 0, 0, 0, 1, 1,
-1.104663, 0.1299299, -1.506079, 0, 0, 0, 1, 1,
-1.099201, 0.9041087, -2.347651, 0, 0, 0, 1, 1,
-1.098237, -0.2497486, -0.9896935, 0, 0, 0, 1, 1,
-1.095838, 0.003777992, -1.636921, 0, 0, 0, 1, 1,
-1.094644, 1.470723, -1.139844, 0, 0, 0, 1, 1,
-1.092618, -0.4768631, -0.816606, 1, 1, 1, 1, 1,
-1.089888, 0.5966604, 0.6077335, 1, 1, 1, 1, 1,
-1.086401, 0.323171, 0.7388237, 1, 1, 1, 1, 1,
-1.079049, -0.4160943, -1.549889, 1, 1, 1, 1, 1,
-1.071163, -0.591367, -4.174172, 1, 1, 1, 1, 1,
-1.069625, 0.7274317, 0.8454789, 1, 1, 1, 1, 1,
-1.069194, 0.8640726, 0.02320896, 1, 1, 1, 1, 1,
-1.059721, -1.152128, -1.057663, 1, 1, 1, 1, 1,
-1.055937, -0.1014708, -2.762755, 1, 1, 1, 1, 1,
-1.053982, -0.7432439, -1.973286, 1, 1, 1, 1, 1,
-1.052432, -0.8636608, -4.607711, 1, 1, 1, 1, 1,
-1.045779, -1.306622, -3.735889, 1, 1, 1, 1, 1,
-1.039548, 0.598112, -0.997632, 1, 1, 1, 1, 1,
-1.030411, -0.2144872, -1.293244, 1, 1, 1, 1, 1,
-1.028625, -0.1889181, -2.234855, 1, 1, 1, 1, 1,
-1.028226, 0.4856027, -2.810443, 0, 0, 1, 1, 1,
-1.025544, 0.006914315, -0.5382753, 1, 0, 0, 1, 1,
-1.02393, -1.459807, -2.461739, 1, 0, 0, 1, 1,
-1.01093, 0.8690397, -0.6899059, 1, 0, 0, 1, 1,
-1.010631, 0.8789944, -1.371242, 1, 0, 0, 1, 1,
-1.001661, -0.08421236, -1.751351, 1, 0, 0, 1, 1,
-0.9964896, -1.193648, -4.624092, 0, 0, 0, 1, 1,
-0.9942877, -0.3834685, -1.701989, 0, 0, 0, 1, 1,
-0.9925842, -0.4483731, -1.588244, 0, 0, 0, 1, 1,
-0.9873285, -1.339065, -1.605951, 0, 0, 0, 1, 1,
-0.9789055, -0.3830118, -1.161197, 0, 0, 0, 1, 1,
-0.9740571, -0.3066984, -2.892745, 0, 0, 0, 1, 1,
-0.973353, 1.19408, 0.2500994, 0, 0, 0, 1, 1,
-0.9684899, -0.2337718, -1.654173, 1, 1, 1, 1, 1,
-0.9632114, -0.619181, -1.491991, 1, 1, 1, 1, 1,
-0.9621711, 0.9356675, -2.173083, 1, 1, 1, 1, 1,
-0.9574578, 0.412537, -3.033006, 1, 1, 1, 1, 1,
-0.9500616, -0.5010505, -2.275282, 1, 1, 1, 1, 1,
-0.94945, 1.282988, -0.4657109, 1, 1, 1, 1, 1,
-0.945274, -0.1884687, -1.451815, 1, 1, 1, 1, 1,
-0.941837, -1.632203, -1.790203, 1, 1, 1, 1, 1,
-0.9417397, 1.558648, -1.131617, 1, 1, 1, 1, 1,
-0.9399208, 1.01413, -0.6185392, 1, 1, 1, 1, 1,
-0.9394476, 0.9166982, -0.9648702, 1, 1, 1, 1, 1,
-0.937763, 2.78526, 0.40807, 1, 1, 1, 1, 1,
-0.9300049, 0.4570847, -1.142546, 1, 1, 1, 1, 1,
-0.9265357, 2.661365, 0.4635819, 1, 1, 1, 1, 1,
-0.9215686, -0.005637102, 0.1734617, 1, 1, 1, 1, 1,
-0.9207867, 0.6000341, 0.3747585, 0, 0, 1, 1, 1,
-0.9200629, 1.032626, -0.9132814, 1, 0, 0, 1, 1,
-0.9125605, 1.466762, -0.002865268, 1, 0, 0, 1, 1,
-0.9116809, -0.02699498, -2.083632, 1, 0, 0, 1, 1,
-0.9112987, 0.841645, -1.520468, 1, 0, 0, 1, 1,
-0.909505, -0.4155996, -1.866323, 1, 0, 0, 1, 1,
-0.9043663, -0.6448953, -1.630723, 0, 0, 0, 1, 1,
-0.9038743, 0.8719636, -1.336891, 0, 0, 0, 1, 1,
-0.903774, -1.321039, -1.93565, 0, 0, 0, 1, 1,
-0.9037413, 0.2735, -1.485207, 0, 0, 0, 1, 1,
-0.901655, -0.917326, -1.467817, 0, 0, 0, 1, 1,
-0.9011077, -0.9332829, -2.43807, 0, 0, 0, 1, 1,
-0.8968861, -2.199387, -5.348881, 0, 0, 0, 1, 1,
-0.8959177, 0.3768849, -0.6436843, 1, 1, 1, 1, 1,
-0.8932747, 1.110518, -0.4936418, 1, 1, 1, 1, 1,
-0.8912185, -0.2176713, -1.237018, 1, 1, 1, 1, 1,
-0.8864269, -0.8461711, -2.911138, 1, 1, 1, 1, 1,
-0.8861676, -0.1644437, -0.2690072, 1, 1, 1, 1, 1,
-0.8859262, -0.4293174, -1.799447, 1, 1, 1, 1, 1,
-0.8852381, -0.7282659, -0.5353975, 1, 1, 1, 1, 1,
-0.8835069, 0.01668893, -2.286448, 1, 1, 1, 1, 1,
-0.8815438, 0.5646285, -0.349977, 1, 1, 1, 1, 1,
-0.8794562, -0.2916598, -2.206985, 1, 1, 1, 1, 1,
-0.8780006, 1.220712, -1.825906, 1, 1, 1, 1, 1,
-0.8764359, -1.427527, -1.967882, 1, 1, 1, 1, 1,
-0.8725361, -0.3913686, -3.850904, 1, 1, 1, 1, 1,
-0.8710189, -1.107486, -3.588956, 1, 1, 1, 1, 1,
-0.8709285, 0.0461793, -3.112371, 1, 1, 1, 1, 1,
-0.8660473, -1.297346, -1.299666, 0, 0, 1, 1, 1,
-0.8572332, -2.716781, -2.089419, 1, 0, 0, 1, 1,
-0.8530465, 0.7598053, -1.362443, 1, 0, 0, 1, 1,
-0.8512523, 1.786271, 0.3434522, 1, 0, 0, 1, 1,
-0.8508001, -1.222821, -2.031547, 1, 0, 0, 1, 1,
-0.8503081, 0.4460878, -0.6315271, 1, 0, 0, 1, 1,
-0.8478387, -0.7754599, -4.085131, 0, 0, 0, 1, 1,
-0.8434608, -0.4608371, -3.37316, 0, 0, 0, 1, 1,
-0.8431271, -0.1194644, -2.092459, 0, 0, 0, 1, 1,
-0.8331275, -0.8049619, -1.854801, 0, 0, 0, 1, 1,
-0.8313748, -0.09973937, -1.083808, 0, 0, 0, 1, 1,
-0.8299847, -1.380086, -3.596293, 0, 0, 0, 1, 1,
-0.8261918, -0.2728324, -1.611367, 0, 0, 0, 1, 1,
-0.8202018, -1.796467, -1.601107, 1, 1, 1, 1, 1,
-0.8151087, 0.04358384, -1.74375, 1, 1, 1, 1, 1,
-0.8135794, 1.332198, 0.6253008, 1, 1, 1, 1, 1,
-0.8061163, 0.4298805, -2.096541, 1, 1, 1, 1, 1,
-0.8046002, -0.3842753, -0.76355, 1, 1, 1, 1, 1,
-0.8022072, 0.258192, -0.5990326, 1, 1, 1, 1, 1,
-0.791024, 0.503011, -0.5981646, 1, 1, 1, 1, 1,
-0.7889136, 0.3262692, -3.224101, 1, 1, 1, 1, 1,
-0.7844202, 0.7464184, -1.097883, 1, 1, 1, 1, 1,
-0.7839227, -2.551195, -1.76156, 1, 1, 1, 1, 1,
-0.778998, -0.8585317, -2.20158, 1, 1, 1, 1, 1,
-0.7787423, 0.1172541, -0.8365633, 1, 1, 1, 1, 1,
-0.7751985, -0.05179759, -2.013984, 1, 1, 1, 1, 1,
-0.7744681, 0.3418456, -0.983458, 1, 1, 1, 1, 1,
-0.7740043, -0.2325213, -1.409228, 1, 1, 1, 1, 1,
-0.7730096, 0.5260311, -0.6058158, 0, 0, 1, 1, 1,
-0.7707187, -0.3843604, -2.635698, 1, 0, 0, 1, 1,
-0.769251, -0.005417339, -1.672876, 1, 0, 0, 1, 1,
-0.7637819, -0.03663366, -2.739448, 1, 0, 0, 1, 1,
-0.761145, -0.9654381, -1.59511, 1, 0, 0, 1, 1,
-0.7549025, 0.8323454, -0.720915, 1, 0, 0, 1, 1,
-0.749743, -0.2843801, -0.7694312, 0, 0, 0, 1, 1,
-0.748305, -0.2918194, -1.897961, 0, 0, 0, 1, 1,
-0.734597, 1.300289, -1.03034, 0, 0, 0, 1, 1,
-0.7345169, -0.9637026, -1.991337, 0, 0, 0, 1, 1,
-0.7325789, 0.2702783, -1.994874, 0, 0, 0, 1, 1,
-0.7309894, -1.620366, -1.519796, 0, 0, 0, 1, 1,
-0.7282827, 0.2719354, -1.391864, 0, 0, 0, 1, 1,
-0.7265983, -0.4400859, -1.407852, 1, 1, 1, 1, 1,
-0.7243217, 0.7062007, 0.7860804, 1, 1, 1, 1, 1,
-0.7226983, 0.95324, -1.65756, 1, 1, 1, 1, 1,
-0.7134584, -1.385263, -2.45535, 1, 1, 1, 1, 1,
-0.7113441, -0.04468539, -0.6882905, 1, 1, 1, 1, 1,
-0.7106965, -0.7985487, -2.66704, 1, 1, 1, 1, 1,
-0.7091314, 0.1342719, -0.8478786, 1, 1, 1, 1, 1,
-0.6977321, 1.546636, 0.8884806, 1, 1, 1, 1, 1,
-0.6969765, 0.9642661, 0.5792834, 1, 1, 1, 1, 1,
-0.6921313, -0.386874, -1.845383, 1, 1, 1, 1, 1,
-0.6920304, 0.2280863, -0.4324566, 1, 1, 1, 1, 1,
-0.6887084, -1.595338, -2.821767, 1, 1, 1, 1, 1,
-0.6881775, 1.34825, -0.2042036, 1, 1, 1, 1, 1,
-0.6854557, 1.831738, -1.259611, 1, 1, 1, 1, 1,
-0.6833823, -0.6443922, -2.394636, 1, 1, 1, 1, 1,
-0.6817285, 0.5046425, -0.8289238, 0, 0, 1, 1, 1,
-0.6783798, 0.9144465, 0.792698, 1, 0, 0, 1, 1,
-0.6770267, -0.6055416, -3.077662, 1, 0, 0, 1, 1,
-0.6752419, 0.4294037, -1.005652, 1, 0, 0, 1, 1,
-0.6716348, -1.32899, -2.448985, 1, 0, 0, 1, 1,
-0.6567098, -1.064772, -2.017308, 1, 0, 0, 1, 1,
-0.6555318, 1.842219, 0.1586334, 0, 0, 0, 1, 1,
-0.6435123, -0.1322335, -2.085452, 0, 0, 0, 1, 1,
-0.6421397, 0.1745045, -1.34729, 0, 0, 0, 1, 1,
-0.6390565, 0.5599627, -0.5569204, 0, 0, 0, 1, 1,
-0.638519, 0.4727588, -1.295712, 0, 0, 0, 1, 1,
-0.638415, -0.8556084, -2.473016, 0, 0, 0, 1, 1,
-0.6368133, -0.01699305, -1.430794, 0, 0, 0, 1, 1,
-0.6302631, 1.374979, 0.598218, 1, 1, 1, 1, 1,
-0.6286877, 0.4497072, 0.1589093, 1, 1, 1, 1, 1,
-0.6262957, 0.2535394, -1.543991, 1, 1, 1, 1, 1,
-0.624491, -0.2592184, -2.621732, 1, 1, 1, 1, 1,
-0.6213223, -1.462085, -3.155418, 1, 1, 1, 1, 1,
-0.6133708, 0.4420067, 0.7772546, 1, 1, 1, 1, 1,
-0.6114608, 0.6269711, -0.5114641, 1, 1, 1, 1, 1,
-0.6107433, 0.3043865, -2.690394, 1, 1, 1, 1, 1,
-0.6095254, 0.306887, -0.6855136, 1, 1, 1, 1, 1,
-0.6074113, 1.319678, -0.3145544, 1, 1, 1, 1, 1,
-0.6036429, -0.9818469, -3.656289, 1, 1, 1, 1, 1,
-0.6016394, -0.937458, -2.15888, 1, 1, 1, 1, 1,
-0.5983851, -1.813514, -1.891189, 1, 1, 1, 1, 1,
-0.5980885, -0.03612819, -1.747772, 1, 1, 1, 1, 1,
-0.5976534, 0.6207151, -1.599676, 1, 1, 1, 1, 1,
-0.5953529, 0.7638258, -0.537925, 0, 0, 1, 1, 1,
-0.5928122, -0.9472501, -2.161659, 1, 0, 0, 1, 1,
-0.5924677, 0.8857412, 0.9572046, 1, 0, 0, 1, 1,
-0.5916527, 1.363793, 0.04549613, 1, 0, 0, 1, 1,
-0.5863422, 0.7359094, -0.5067204, 1, 0, 0, 1, 1,
-0.5860837, 0.665645, -0.2946829, 1, 0, 0, 1, 1,
-0.5852945, -1.414801, -4.122695, 0, 0, 0, 1, 1,
-0.5841327, -0.5234178, -1.162969, 0, 0, 0, 1, 1,
-0.5825988, 1.191435, -0.8938472, 0, 0, 0, 1, 1,
-0.5819507, -0.6314335, -3.803879, 0, 0, 0, 1, 1,
-0.5814866, 0.9373958, -0.7323414, 0, 0, 0, 1, 1,
-0.5796372, -1.1898, -2.477311, 0, 0, 0, 1, 1,
-0.572692, 0.5852379, -2.612679, 0, 0, 0, 1, 1,
-0.5630934, -0.148677, -1.588496, 1, 1, 1, 1, 1,
-0.5607253, -1.30868, -1.75798, 1, 1, 1, 1, 1,
-0.5587052, 0.1210724, -2.473154, 1, 1, 1, 1, 1,
-0.5545929, 0.07883314, -2.450842, 1, 1, 1, 1, 1,
-0.5542325, 0.0989357, -0.2995655, 1, 1, 1, 1, 1,
-0.5537445, 1.107697, 0.2424164, 1, 1, 1, 1, 1,
-0.552908, -0.4824273, -1.310785, 1, 1, 1, 1, 1,
-0.5486872, -0.72965, -2.471044, 1, 1, 1, 1, 1,
-0.5459123, -0.4102549, -2.264372, 1, 1, 1, 1, 1,
-0.5433357, -0.8708045, -3.930468, 1, 1, 1, 1, 1,
-0.537573, 0.1415574, -0.6143561, 1, 1, 1, 1, 1,
-0.5355676, -0.8726597, -3.539953, 1, 1, 1, 1, 1,
-0.529136, 0.06987389, -2.174976, 1, 1, 1, 1, 1,
-0.5212378, -1.701266, -0.3688302, 1, 1, 1, 1, 1,
-0.5164979, -1.332692, -2.264765, 1, 1, 1, 1, 1,
-0.5148755, 0.2877154, -2.426219, 0, 0, 1, 1, 1,
-0.5118628, 0.03354099, -2.216616, 1, 0, 0, 1, 1,
-0.5102459, 0.8575653, 1.001988, 1, 0, 0, 1, 1,
-0.50583, -1.178442, -1.888614, 1, 0, 0, 1, 1,
-0.5042864, -0.4618443, -4.037208, 1, 0, 0, 1, 1,
-0.5031233, 0.3048454, -1.627624, 1, 0, 0, 1, 1,
-0.5014561, -0.5982998, -2.394368, 0, 0, 0, 1, 1,
-0.4992447, 0.6312125, 0.3342344, 0, 0, 0, 1, 1,
-0.4963397, 1.2343, -0.3766548, 0, 0, 0, 1, 1,
-0.4949104, 0.6910014, -0.8328251, 0, 0, 0, 1, 1,
-0.4930272, -1.504908, -3.595119, 0, 0, 0, 1, 1,
-0.4880088, -0.06876142, -0.7693655, 0, 0, 0, 1, 1,
-0.4871819, -0.6935868, -1.6301, 0, 0, 0, 1, 1,
-0.4868633, -0.3341061, -2.50484, 1, 1, 1, 1, 1,
-0.4837203, -1.79462, -3.881272, 1, 1, 1, 1, 1,
-0.482144, 0.9341224, 0.7737793, 1, 1, 1, 1, 1,
-0.478222, -1.074405, -2.105412, 1, 1, 1, 1, 1,
-0.4739379, -1.1974, -3.162575, 1, 1, 1, 1, 1,
-0.4620239, 1.536962, 0.01300664, 1, 1, 1, 1, 1,
-0.4609693, -0.4895571, -2.69908, 1, 1, 1, 1, 1,
-0.4606097, 1.210275, -0.07102247, 1, 1, 1, 1, 1,
-0.4542711, 1.023116, 0.3326363, 1, 1, 1, 1, 1,
-0.4509957, 1.318451, -1.224949, 1, 1, 1, 1, 1,
-0.4464022, -0.3883299, -2.881084, 1, 1, 1, 1, 1,
-0.44549, -0.7858726, -2.601165, 1, 1, 1, 1, 1,
-0.4454101, 1.549305, 0.8524264, 1, 1, 1, 1, 1,
-0.4438756, -0.5863303, -2.50318, 1, 1, 1, 1, 1,
-0.4424608, -1.109231, -3.636715, 1, 1, 1, 1, 1,
-0.4373935, -0.1872772, -2.761131, 0, 0, 1, 1, 1,
-0.4337036, 1.443811, 2.119966, 1, 0, 0, 1, 1,
-0.4300758, -1.578064, -3.33531, 1, 0, 0, 1, 1,
-0.4283234, -0.946611, -2.995732, 1, 0, 0, 1, 1,
-0.4262623, 0.1478774, -1.473988, 1, 0, 0, 1, 1,
-0.4233761, -1.290928, -2.036099, 1, 0, 0, 1, 1,
-0.4232014, -1.343841, -2.27906, 0, 0, 0, 1, 1,
-0.4211287, -0.5653916, -3.499084, 0, 0, 0, 1, 1,
-0.4205102, 1.158746, -1.443995, 0, 0, 0, 1, 1,
-0.4196761, -1.659364, -3.028483, 0, 0, 0, 1, 1,
-0.4191435, -0.6253643, -2.411673, 0, 0, 0, 1, 1,
-0.4174116, -0.9637414, -3.699676, 0, 0, 0, 1, 1,
-0.4119218, 0.3886745, -0.5334125, 0, 0, 0, 1, 1,
-0.4076865, -1.578737, -1.580679, 1, 1, 1, 1, 1,
-0.4045514, -0.04804785, -3.320695, 1, 1, 1, 1, 1,
-0.40333, -0.0407974, -0.8007725, 1, 1, 1, 1, 1,
-0.4012251, 1.131122, 1.612413, 1, 1, 1, 1, 1,
-0.3951955, -0.09514699, -2.202379, 1, 1, 1, 1, 1,
-0.382505, -0.4882656, -2.745259, 1, 1, 1, 1, 1,
-0.3779812, -1.220296, -0.7958332, 1, 1, 1, 1, 1,
-0.3778692, 0.04793944, -2.551892, 1, 1, 1, 1, 1,
-0.3764536, 1.158897, -0.07390594, 1, 1, 1, 1, 1,
-0.3748548, 1.832535, -1.437528, 1, 1, 1, 1, 1,
-0.3746302, 0.616565, -1.494282, 1, 1, 1, 1, 1,
-0.3743164, 0.3386784, -1.835832, 1, 1, 1, 1, 1,
-0.3742963, -0.4932307, -2.143679, 1, 1, 1, 1, 1,
-0.3726369, 1.033502, -1.523635, 1, 1, 1, 1, 1,
-0.3695442, -0.6492418, -2.667614, 1, 1, 1, 1, 1,
-0.3618222, -0.57363, -1.634347, 0, 0, 1, 1, 1,
-0.3606983, 0.3420286, -3.173622, 1, 0, 0, 1, 1,
-0.3602786, 1.232874, 0.04097162, 1, 0, 0, 1, 1,
-0.3597905, -1.164024, -2.570376, 1, 0, 0, 1, 1,
-0.3572014, 2.227718, 0.6698141, 1, 0, 0, 1, 1,
-0.3472953, 0.1414399, -0.01892712, 1, 0, 0, 1, 1,
-0.3431899, -0.2533525, -2.186043, 0, 0, 0, 1, 1,
-0.3431043, -1.711052, -3.467493, 0, 0, 0, 1, 1,
-0.3399681, -0.01685362, -0.2394901, 0, 0, 0, 1, 1,
-0.3243401, -2.113375, -3.896126, 0, 0, 0, 1, 1,
-0.3227056, 0.3866822, -1.777461, 0, 0, 0, 1, 1,
-0.3209566, -0.04063552, -1.131741, 0, 0, 0, 1, 1,
-0.3206094, -0.2537572, -2.871786, 0, 0, 0, 1, 1,
-0.3189844, 1.39591, -0.5656067, 1, 1, 1, 1, 1,
-0.3189139, 1.212874, -0.2441172, 1, 1, 1, 1, 1,
-0.3188662, 0.1254603, -0.9033561, 1, 1, 1, 1, 1,
-0.3154231, -1.383915, -4.150517, 1, 1, 1, 1, 1,
-0.3030535, -0.6692018, -4.583361, 1, 1, 1, 1, 1,
-0.2976897, 0.66915, 0.9473343, 1, 1, 1, 1, 1,
-0.297612, 0.2566643, -0.2009506, 1, 1, 1, 1, 1,
-0.2975062, -0.4344765, -2.672277, 1, 1, 1, 1, 1,
-0.2899226, -1.08996, -2.5318, 1, 1, 1, 1, 1,
-0.288388, -0.7815506, -2.123944, 1, 1, 1, 1, 1,
-0.2872797, 0.4106074, -1.391769, 1, 1, 1, 1, 1,
-0.2846717, -0.8029076, -3.81166, 1, 1, 1, 1, 1,
-0.2815599, -0.2849492, -1.2748, 1, 1, 1, 1, 1,
-0.2801153, -0.7562013, -1.639182, 1, 1, 1, 1, 1,
-0.2764162, -1.734794, -3.829084, 1, 1, 1, 1, 1,
-0.2695433, -1.189026, -4.080139, 0, 0, 1, 1, 1,
-0.2689599, -0.4929397, -2.11251, 1, 0, 0, 1, 1,
-0.2667378, 0.07031576, -2.223872, 1, 0, 0, 1, 1,
-0.2645928, 0.1767909, -0.6919261, 1, 0, 0, 1, 1,
-0.261347, -1.391712, -2.595217, 1, 0, 0, 1, 1,
-0.2601475, -0.05357255, -1.461163, 1, 0, 0, 1, 1,
-0.2597687, 0.8525953, -1.025332, 0, 0, 0, 1, 1,
-0.2594673, -0.2701096, -1.107706, 0, 0, 0, 1, 1,
-0.2575648, -0.7010975, -3.264586, 0, 0, 0, 1, 1,
-0.2572748, -0.05970788, -2.048042, 0, 0, 0, 1, 1,
-0.2561801, -0.4500968, -3.868467, 0, 0, 0, 1, 1,
-0.2553459, -0.4491747, -1.85891, 0, 0, 0, 1, 1,
-0.2552631, -0.4019547, -2.678264, 0, 0, 0, 1, 1,
-0.2536389, -0.2072738, -1.36744, 1, 1, 1, 1, 1,
-0.2508357, 0.3792786, 1.419135, 1, 1, 1, 1, 1,
-0.2439394, -0.9692508, -2.070838, 1, 1, 1, 1, 1,
-0.2432897, 1.718384, -0.5805771, 1, 1, 1, 1, 1,
-0.2422314, 0.2483602, 0.7000958, 1, 1, 1, 1, 1,
-0.2402766, 0.5096301, -0.1573247, 1, 1, 1, 1, 1,
-0.2331527, -0.7805461, -3.734835, 1, 1, 1, 1, 1,
-0.2330727, -1.057851, -2.375309, 1, 1, 1, 1, 1,
-0.2305191, 0.5050958, -0.1101771, 1, 1, 1, 1, 1,
-0.2291167, -0.276371, -1.714206, 1, 1, 1, 1, 1,
-0.2277274, -0.7731727, -3.698693, 1, 1, 1, 1, 1,
-0.2258573, 0.02069347, -2.301122, 1, 1, 1, 1, 1,
-0.2240936, 0.9241272, 0.01594536, 1, 1, 1, 1, 1,
-0.2233125, 0.1949216, 0.1743865, 1, 1, 1, 1, 1,
-0.2194418, 0.2005658, -3.70401, 1, 1, 1, 1, 1,
-0.218834, -1.446103, -5.304699, 0, 0, 1, 1, 1,
-0.2160491, -0.8262823, -3.42271, 1, 0, 0, 1, 1,
-0.2142792, 0.191738, -1.807005, 1, 0, 0, 1, 1,
-0.2112761, -1.264427, -3.70226, 1, 0, 0, 1, 1,
-0.2047469, -0.9061002, -2.480348, 1, 0, 0, 1, 1,
-0.2045569, -0.9305514, -3.119212, 1, 0, 0, 1, 1,
-0.2029493, 0.06997306, -1.019932, 0, 0, 0, 1, 1,
-0.2008276, 0.3671252, -0.3298336, 0, 0, 0, 1, 1,
-0.2006341, -1.005143, -1.999051, 0, 0, 0, 1, 1,
-0.2001503, 0.07128581, -1.589469, 0, 0, 0, 1, 1,
-0.1941791, -0.03429475, -2.939789, 0, 0, 0, 1, 1,
-0.1929973, -1.507908, -2.952303, 0, 0, 0, 1, 1,
-0.1926765, -0.282296, -4.521346, 0, 0, 0, 1, 1,
-0.1916123, 0.4312181, -1.192228, 1, 1, 1, 1, 1,
-0.1905723, -0.2360347, -3.611983, 1, 1, 1, 1, 1,
-0.1892507, -0.3415584, -3.422254, 1, 1, 1, 1, 1,
-0.1892397, 1.538823, -0.69551, 1, 1, 1, 1, 1,
-0.1834511, 0.5088283, 0.5399289, 1, 1, 1, 1, 1,
-0.1813296, -0.07651872, -0.4346705, 1, 1, 1, 1, 1,
-0.1759744, -0.2996299, -3.19839, 1, 1, 1, 1, 1,
-0.1757657, -1.467993, -4.555712, 1, 1, 1, 1, 1,
-0.1751941, 1.67271, -0.4242797, 1, 1, 1, 1, 1,
-0.175173, 1.0126, 0.9231628, 1, 1, 1, 1, 1,
-0.1741757, 1.397293, -0.8046756, 1, 1, 1, 1, 1,
-0.173565, -1.051532, -3.847841, 1, 1, 1, 1, 1,
-0.1659427, 0.01266353, -2.096668, 1, 1, 1, 1, 1,
-0.1634092, 1.00605, -1.212988, 1, 1, 1, 1, 1,
-0.1601874, 0.07672729, -1.472389, 1, 1, 1, 1, 1,
-0.1556139, -1.092378, -1.247291, 0, 0, 1, 1, 1,
-0.1545094, -1.735483, -2.841919, 1, 0, 0, 1, 1,
-0.1531854, 0.6606944, 1.462906, 1, 0, 0, 1, 1,
-0.1531787, -0.3110116, -1.800796, 1, 0, 0, 1, 1,
-0.1498051, -0.2133371, -1.514007, 1, 0, 0, 1, 1,
-0.147081, -1.204149, -3.665306, 1, 0, 0, 1, 1,
-0.1440243, 0.2025618, -1.24896, 0, 0, 0, 1, 1,
-0.1433842, 0.9348276, 0.06234348, 0, 0, 0, 1, 1,
-0.1410607, -1.06723, -4.621727, 0, 0, 0, 1, 1,
-0.1410449, -0.2781172, -0.6245241, 0, 0, 0, 1, 1,
-0.1408841, -0.4735942, -2.596623, 0, 0, 0, 1, 1,
-0.1375367, 1.385696, -2.852231, 0, 0, 0, 1, 1,
-0.1341622, 0.7280966, -0.6410879, 0, 0, 0, 1, 1,
-0.1298985, -0.6934689, -2.344136, 1, 1, 1, 1, 1,
-0.1274157, -0.002185272, -1.62451, 1, 1, 1, 1, 1,
-0.1273628, 0.4241998, 0.9829443, 1, 1, 1, 1, 1,
-0.1236685, 0.7727939, -1.122292, 1, 1, 1, 1, 1,
-0.1234205, -0.1278129, -2.803721, 1, 1, 1, 1, 1,
-0.1209562, -1.29433, -2.352241, 1, 1, 1, 1, 1,
-0.1207622, 0.5063483, -1.587822, 1, 1, 1, 1, 1,
-0.1204641, -1.809129, -2.608427, 1, 1, 1, 1, 1,
-0.1198377, 0.6572174, 0.2555209, 1, 1, 1, 1, 1,
-0.1192433, 0.4244936, 2.643941, 1, 1, 1, 1, 1,
-0.1078523, -0.1493588, -4.119159, 1, 1, 1, 1, 1,
-0.1009502, 0.9081634, 1.652918, 1, 1, 1, 1, 1,
-0.09778675, -0.0071092, -2.572059, 1, 1, 1, 1, 1,
-0.09590112, -0.1610862, -1.710072, 1, 1, 1, 1, 1,
-0.09535111, 0.8554715, -1.414445, 1, 1, 1, 1, 1,
-0.0928226, 0.3630865, 1.828499, 0, 0, 1, 1, 1,
-0.09094595, -0.8784328, -2.648386, 1, 0, 0, 1, 1,
-0.09084067, 0.5297155, -0.4445095, 1, 0, 0, 1, 1,
-0.09020876, 0.2813404, 0.2692753, 1, 0, 0, 1, 1,
-0.0882664, -1.700208, -2.974372, 1, 0, 0, 1, 1,
-0.08293708, -1.381519, -3.53907, 1, 0, 0, 1, 1,
-0.08140217, -1.493577, -3.453864, 0, 0, 0, 1, 1,
-0.0776142, -0.8041089, -3.860023, 0, 0, 0, 1, 1,
-0.07070682, -0.16559, -2.097101, 0, 0, 0, 1, 1,
-0.06198437, 1.923177, 1.05073, 0, 0, 0, 1, 1,
-0.06113977, -0.9475576, -3.787465, 0, 0, 0, 1, 1,
-0.05449745, -0.1998252, -3.874506, 0, 0, 0, 1, 1,
-0.05214649, -1.000388, -2.694055, 0, 0, 0, 1, 1,
-0.04300731, -1.251567, -3.519103, 1, 1, 1, 1, 1,
-0.04258966, -0.07535363, -1.494334, 1, 1, 1, 1, 1,
-0.03385003, -1.394961, -2.912304, 1, 1, 1, 1, 1,
-0.03092666, -1.077068, -3.120328, 1, 1, 1, 1, 1,
-0.03061256, -0.8165076, -1.643129, 1, 1, 1, 1, 1,
-0.02979844, 1.439635, 0.2325411, 1, 1, 1, 1, 1,
-0.02654046, -0.7621978, -2.30553, 1, 1, 1, 1, 1,
-0.0254807, 0.2290932, -0.3491243, 1, 1, 1, 1, 1,
-0.023846, 0.0302912, 1.811011, 1, 1, 1, 1, 1,
-0.02189971, 0.4569686, 1.393058, 1, 1, 1, 1, 1,
-0.01867219, 0.1099873, 0.1086859, 1, 1, 1, 1, 1,
-0.01770183, 0.6097896, -0.1052185, 1, 1, 1, 1, 1,
-0.0176409, 0.8760906, 0.3279058, 1, 1, 1, 1, 1,
-0.01546074, 0.1513537, 1.434994, 1, 1, 1, 1, 1,
-0.01451955, -0.4335233, -3.39971, 1, 1, 1, 1, 1,
-0.01320293, -0.6358645, -2.500393, 0, 0, 1, 1, 1,
-0.01213621, -0.09015701, -3.713505, 1, 0, 0, 1, 1,
-0.01073447, 1.326521, 0.5620553, 1, 0, 0, 1, 1,
-0.009249295, -0.7542156, -2.763334, 1, 0, 0, 1, 1,
-0.003711144, 1.022095, -1.09887, 1, 0, 0, 1, 1,
0.001467004, 1.301088, 1.013975, 1, 0, 0, 1, 1,
0.003558181, -0.9375727, 3.89261, 0, 0, 0, 1, 1,
0.01020331, 0.6160685, -3.127555, 0, 0, 0, 1, 1,
0.01337116, -1.55447, 3.758552, 0, 0, 0, 1, 1,
0.01611834, 0.1566288, 0.1712285, 0, 0, 0, 1, 1,
0.01661646, 2.033553, 0.126275, 0, 0, 0, 1, 1,
0.0187934, 0.9569044, -0.5303289, 0, 0, 0, 1, 1,
0.0214131, -0.7936054, 3.151773, 0, 0, 0, 1, 1,
0.02292835, 0.8953172, -1.148328, 1, 1, 1, 1, 1,
0.02332381, 0.2453736, -0.1070845, 1, 1, 1, 1, 1,
0.03557846, -1.785135, 2.448988, 1, 1, 1, 1, 1,
0.03727235, -0.580497, 3.502871, 1, 1, 1, 1, 1,
0.04433106, -1.353953, 4.300972, 1, 1, 1, 1, 1,
0.04773533, 0.7238362, 0.3305536, 1, 1, 1, 1, 1,
0.05284588, 0.1947257, 0.9077056, 1, 1, 1, 1, 1,
0.05623706, 0.1290356, 0.1410011, 1, 1, 1, 1, 1,
0.05726286, 0.2991741, 0.7961388, 1, 1, 1, 1, 1,
0.06093084, 1.360312, 1.323812, 1, 1, 1, 1, 1,
0.06660914, -0.2496786, 1.589735, 1, 1, 1, 1, 1,
0.06953132, -0.1734552, 3.612316, 1, 1, 1, 1, 1,
0.07043903, -0.9958224, 2.338269, 1, 1, 1, 1, 1,
0.07114009, 1.021214, -1.980276, 1, 1, 1, 1, 1,
0.07327812, 0.4051411, -0.4530909, 1, 1, 1, 1, 1,
0.07534518, 0.7393078, 1.608361, 0, 0, 1, 1, 1,
0.07717255, -1.010453, 3.245521, 1, 0, 0, 1, 1,
0.07858852, -0.1002874, 3.067137, 1, 0, 0, 1, 1,
0.07867482, -0.5616621, 3.819772, 1, 0, 0, 1, 1,
0.08077903, 0.7257451, 0.8680694, 1, 0, 0, 1, 1,
0.08144477, 0.9988261, -1.389038, 1, 0, 0, 1, 1,
0.0840702, 0.3566054, -1.182698, 0, 0, 0, 1, 1,
0.1030855, -0.6153382, 2.819292, 0, 0, 0, 1, 1,
0.1043265, -0.5088795, 3.016944, 0, 0, 0, 1, 1,
0.1044563, -0.3195822, 3.421734, 0, 0, 0, 1, 1,
0.105251, -1.293477, 2.567986, 0, 0, 0, 1, 1,
0.1064096, -0.1022591, 2.473603, 0, 0, 0, 1, 1,
0.108566, 0.9338247, -1.795555, 0, 0, 0, 1, 1,
0.1120116, -1.374921, 4.056914, 1, 1, 1, 1, 1,
0.1150085, 0.02150457, 0.31386, 1, 1, 1, 1, 1,
0.1192193, -2.079772, 3.070785, 1, 1, 1, 1, 1,
0.130466, 0.4538977, -0.3240846, 1, 1, 1, 1, 1,
0.1358357, -0.6447989, 3.545624, 1, 1, 1, 1, 1,
0.137896, -0.08344334, 2.030931, 1, 1, 1, 1, 1,
0.1407692, -0.7381675, 2.555913, 1, 1, 1, 1, 1,
0.142061, -0.4880624, 4.223015, 1, 1, 1, 1, 1,
0.1444703, 0.5884888, 0.05715766, 1, 1, 1, 1, 1,
0.1464779, 1.172204, 0.5916823, 1, 1, 1, 1, 1,
0.1477336, -1.041828, 1.860344, 1, 1, 1, 1, 1,
0.1608627, 0.2120317, 0.8897055, 1, 1, 1, 1, 1,
0.1613534, -0.6047427, 2.416271, 1, 1, 1, 1, 1,
0.1626048, 2.512787, 1.360585, 1, 1, 1, 1, 1,
0.164052, 0.4434152, 0.7101859, 1, 1, 1, 1, 1,
0.1664795, -0.6108134, 1.978259, 0, 0, 1, 1, 1,
0.1783132, -0.05961416, 3.486071, 1, 0, 0, 1, 1,
0.1799992, -1.286493, 4.026365, 1, 0, 0, 1, 1,
0.183044, 0.7251824, -0.3187099, 1, 0, 0, 1, 1,
0.1848599, 0.6269271, -1.266283, 1, 0, 0, 1, 1,
0.1852074, 0.4488996, 1.1551, 1, 0, 0, 1, 1,
0.1872966, 0.6559213, -0.1720586, 0, 0, 0, 1, 1,
0.1875309, -0.8092918, 4.069015, 0, 0, 0, 1, 1,
0.1880964, -0.8997973, 1.891197, 0, 0, 0, 1, 1,
0.1937364, 0.8842328, -0.7196883, 0, 0, 0, 1, 1,
0.1986279, 0.5055955, 0.541061, 0, 0, 0, 1, 1,
0.1998947, 0.8101726, -0.1915274, 0, 0, 0, 1, 1,
0.2033373, -0.05917091, -0.5090073, 0, 0, 0, 1, 1,
0.2054341, -0.2171669, 2.292275, 1, 1, 1, 1, 1,
0.2103127, -0.2816503, 4.436526, 1, 1, 1, 1, 1,
0.2119293, 0.2904773, 1.621166, 1, 1, 1, 1, 1,
0.2153124, 3.142178, 0.7299509, 1, 1, 1, 1, 1,
0.2196169, -0.05917805, 2.748542, 1, 1, 1, 1, 1,
0.2213482, 0.6350127, 0.2684436, 1, 1, 1, 1, 1,
0.2286631, -0.08354233, 1.859606, 1, 1, 1, 1, 1,
0.2331848, -1.720487, 2.301321, 1, 1, 1, 1, 1,
0.2340511, -0.5715029, 2.245886, 1, 1, 1, 1, 1,
0.2372285, -0.08207677, 2.261831, 1, 1, 1, 1, 1,
0.2425584, -0.4697002, 2.536181, 1, 1, 1, 1, 1,
0.2430829, -0.6413348, 2.75833, 1, 1, 1, 1, 1,
0.2528614, 1.869986, -0.4927255, 1, 1, 1, 1, 1,
0.2539561, 2.021375, -1.470985, 1, 1, 1, 1, 1,
0.254059, -0.9568022, 1.464338, 1, 1, 1, 1, 1,
0.2561319, -0.2466917, 1.61531, 0, 0, 1, 1, 1,
0.2648959, 0.9976121, 2.061829, 1, 0, 0, 1, 1,
0.2652792, 1.353251, 0.1971471, 1, 0, 0, 1, 1,
0.2673064, 0.3140481, 1.233382, 1, 0, 0, 1, 1,
0.2676198, -1.431773, 3.043687, 1, 0, 0, 1, 1,
0.2712323, -1.324243, 1.367547, 1, 0, 0, 1, 1,
0.2717912, -1.535935, 1.828722, 0, 0, 0, 1, 1,
0.2725095, -0.6469424, 2.064595, 0, 0, 0, 1, 1,
0.2729463, -0.8406098, 4.708641, 0, 0, 0, 1, 1,
0.277008, 1.824195, 1.990901, 0, 0, 0, 1, 1,
0.2830169, 1.525644, 1.456722, 0, 0, 0, 1, 1,
0.2836343, -0.3746279, 1.3897, 0, 0, 0, 1, 1,
0.2843117, -0.2632644, 2.769101, 0, 0, 0, 1, 1,
0.2875562, -1.006383, 3.138294, 1, 1, 1, 1, 1,
0.296699, -0.2908483, 3.074231, 1, 1, 1, 1, 1,
0.2972545, 0.6243362, -0.71557, 1, 1, 1, 1, 1,
0.2973368, 1.1735, 0.4524157, 1, 1, 1, 1, 1,
0.2973858, 1.396667, 0.03845077, 1, 1, 1, 1, 1,
0.2978778, 0.6657293, 1.290998, 1, 1, 1, 1, 1,
0.2979469, 0.4701509, -0.128292, 1, 1, 1, 1, 1,
0.2979678, -1.10547, 2.483639, 1, 1, 1, 1, 1,
0.3019719, -0.1872177, 1.119873, 1, 1, 1, 1, 1,
0.3027164, 1.018773, -0.1684249, 1, 1, 1, 1, 1,
0.3137413, -0.7608441, 3.581885, 1, 1, 1, 1, 1,
0.3145024, 1.598892, 0.576906, 1, 1, 1, 1, 1,
0.3176444, -0.1574507, 1.20068, 1, 1, 1, 1, 1,
0.3177119, -0.4476143, 4.989705, 1, 1, 1, 1, 1,
0.3224476, -1.499964, 3.496585, 1, 1, 1, 1, 1,
0.3240673, 1.300781, -0.04021685, 0, 0, 1, 1, 1,
0.328465, -0.3920257, 2.220582, 1, 0, 0, 1, 1,
0.3287125, 2.233683, 0.6334409, 1, 0, 0, 1, 1,
0.3307086, -0.7649563, 1.225703, 1, 0, 0, 1, 1,
0.3367056, -1.072918, 3.057023, 1, 0, 0, 1, 1,
0.3379263, -0.2842278, 1.220892, 1, 0, 0, 1, 1,
0.3383028, 0.5734829, -0.2255181, 0, 0, 0, 1, 1,
0.3416062, -1.774887, 2.473277, 0, 0, 0, 1, 1,
0.3420015, -0.4979242, 2.902133, 0, 0, 0, 1, 1,
0.3434179, -0.1254079, 1.332968, 0, 0, 0, 1, 1,
0.3481029, -0.2442717, 2.560979, 0, 0, 0, 1, 1,
0.3490299, 1.411112, -0.1981549, 0, 0, 0, 1, 1,
0.3493292, -0.2830814, 2.806308, 0, 0, 0, 1, 1,
0.35, 0.2164505, 2.121394, 1, 1, 1, 1, 1,
0.3512532, -0.4238388, 1.49283, 1, 1, 1, 1, 1,
0.351912, -0.7672565, 2.868806, 1, 1, 1, 1, 1,
0.3625504, 0.5963503, 2.60039, 1, 1, 1, 1, 1,
0.3632767, 0.5156116, 1.232413, 1, 1, 1, 1, 1,
0.3633018, -0.2546882, 2.388816, 1, 1, 1, 1, 1,
0.3637015, 0.1570443, 0.00350824, 1, 1, 1, 1, 1,
0.3645487, -0.5963016, 4.662597, 1, 1, 1, 1, 1,
0.3672571, -1.090027, 1.358275, 1, 1, 1, 1, 1,
0.3788273, 0.7556095, -0.316955, 1, 1, 1, 1, 1,
0.3861723, -1.194156, 3.535321, 1, 1, 1, 1, 1,
0.3951672, 0.05216481, 1.346778, 1, 1, 1, 1, 1,
0.397665, -0.3857248, 1.600772, 1, 1, 1, 1, 1,
0.3988115, -0.3517173, 1.999016, 1, 1, 1, 1, 1,
0.3991154, 0.5621099, -1.111041, 1, 1, 1, 1, 1,
0.4012265, -0.7266985, 3.93355, 0, 0, 1, 1, 1,
0.4070796, -0.7293965, 2.820887, 1, 0, 0, 1, 1,
0.4074013, 1.709772, -0.3752235, 1, 0, 0, 1, 1,
0.4083844, 0.360321, 1.365909, 1, 0, 0, 1, 1,
0.408562, 1.387627, 1.7092, 1, 0, 0, 1, 1,
0.410456, -0.4505595, 0.2636958, 1, 0, 0, 1, 1,
0.4108048, -1.198265, 2.210269, 0, 0, 0, 1, 1,
0.410806, 1.509345, -0.09064673, 0, 0, 0, 1, 1,
0.4148979, 0.5238277, 1.470664, 0, 0, 0, 1, 1,
0.414974, -0.4095801, 2.987618, 0, 0, 0, 1, 1,
0.4173192, 0.3965979, 1.963107, 0, 0, 0, 1, 1,
0.4211838, -0.06354646, 1.36806, 0, 0, 0, 1, 1,
0.4273525, 1.402639, -0.5829067, 0, 0, 0, 1, 1,
0.4360817, -0.5590655, 1.500065, 1, 1, 1, 1, 1,
0.43817, -0.1197528, 1.196855, 1, 1, 1, 1, 1,
0.4402854, -0.3414829, 2.487809, 1, 1, 1, 1, 1,
0.4449691, -0.4765692, 2.453672, 1, 1, 1, 1, 1,
0.4471993, -1.03702, 3.115666, 1, 1, 1, 1, 1,
0.4483087, 1.114161, 1.446087, 1, 1, 1, 1, 1,
0.4511632, 0.1257215, 0.8786613, 1, 1, 1, 1, 1,
0.4516789, -0.4345705, 3.939282, 1, 1, 1, 1, 1,
0.4526882, 0.6404874, 0.2898464, 1, 1, 1, 1, 1,
0.4530625, -0.5481055, -0.9717138, 1, 1, 1, 1, 1,
0.4533377, -0.2062027, 1.316674, 1, 1, 1, 1, 1,
0.4547862, 0.9325004, 1.260019, 1, 1, 1, 1, 1,
0.4549676, 0.1313162, 1.801815, 1, 1, 1, 1, 1,
0.4596434, 1.561113, 1.304942, 1, 1, 1, 1, 1,
0.4603582, 1.280446, 0.1512367, 1, 1, 1, 1, 1,
0.4608209, 2.01739, 0.4005896, 0, 0, 1, 1, 1,
0.4702143, -0.1163378, -1.382344, 1, 0, 0, 1, 1,
0.4741451, -0.3546161, 2.37656, 1, 0, 0, 1, 1,
0.4763665, -1.168761, 4.911808, 1, 0, 0, 1, 1,
0.4773409, -0.4630111, 2.508949, 1, 0, 0, 1, 1,
0.4775884, -1.579346, 5.712808, 1, 0, 0, 1, 1,
0.4785216, 0.9124237, -0.7673107, 0, 0, 0, 1, 1,
0.4797222, -0.6217704, 1.476454, 0, 0, 0, 1, 1,
0.4809862, 0.1188103, 1.514486, 0, 0, 0, 1, 1,
0.4848433, -0.02146722, 2.11765, 0, 0, 0, 1, 1,
0.4872655, 1.333611, 0.7850261, 0, 0, 0, 1, 1,
0.4884306, 1.228383, -2.016271, 0, 0, 0, 1, 1,
0.4889196, -0.608721, 2.24739, 0, 0, 0, 1, 1,
0.4892906, -0.9552011, 1.413059, 1, 1, 1, 1, 1,
0.4951469, 0.2693375, 0.757682, 1, 1, 1, 1, 1,
0.4965423, -0.04097346, 2.776619, 1, 1, 1, 1, 1,
0.5036599, -2.031459, 3.700126, 1, 1, 1, 1, 1,
0.5039779, 0.6511773, -0.3598596, 1, 1, 1, 1, 1,
0.5046083, 0.784912, 1.625238, 1, 1, 1, 1, 1,
0.5095559, 1.387091, 0.9838155, 1, 1, 1, 1, 1,
0.5103678, -2.165632, 2.986921, 1, 1, 1, 1, 1,
0.5114528, 0.355913, 0.5411236, 1, 1, 1, 1, 1,
0.5126358, 0.563112, 2.198348, 1, 1, 1, 1, 1,
0.5129939, -1.010396, 2.50668, 1, 1, 1, 1, 1,
0.5148793, -0.419425, 2.459234, 1, 1, 1, 1, 1,
0.519796, -1.235284, 1.062694, 1, 1, 1, 1, 1,
0.5252627, -0.660603, 0.19797, 1, 1, 1, 1, 1,
0.5259815, -0.3656441, 3.494315, 1, 1, 1, 1, 1,
0.5291365, 0.6535845, 1.900025, 0, 0, 1, 1, 1,
0.534622, -1.808867, 3.112179, 1, 0, 0, 1, 1,
0.5425941, 1.152661, -0.6374553, 1, 0, 0, 1, 1,
0.5446898, 0.4543802, 1.819189, 1, 0, 0, 1, 1,
0.5452989, -0.336057, 3.584486, 1, 0, 0, 1, 1,
0.5467961, -0.1357816, 0.7739231, 1, 0, 0, 1, 1,
0.5472064, 1.450449, 1.661956, 0, 0, 0, 1, 1,
0.5475106, -0.3959542, 2.572289, 0, 0, 0, 1, 1,
0.5551238, -1.493145, 1.120614, 0, 0, 0, 1, 1,
0.5720772, 0.5808485, 0.1987329, 0, 0, 0, 1, 1,
0.5765011, 0.3120473, 1.1603, 0, 0, 0, 1, 1,
0.5855936, -0.08625279, 0.283359, 0, 0, 0, 1, 1,
0.5905336, 0.963957, -0.09146973, 0, 0, 0, 1, 1,
0.591098, -0.2049722, 1.897131, 1, 1, 1, 1, 1,
0.5924757, 0.1703234, 2.486472, 1, 1, 1, 1, 1,
0.5971335, 0.2593302, 0.9565471, 1, 1, 1, 1, 1,
0.5976558, 0.2411003, -1.001513, 1, 1, 1, 1, 1,
0.6003836, 0.9290854, 1.006297, 1, 1, 1, 1, 1,
0.6070868, -0.2875645, 2.813596, 1, 1, 1, 1, 1,
0.6071844, -1.976143, 0.7090343, 1, 1, 1, 1, 1,
0.6082958, 1.138181, 1.23149, 1, 1, 1, 1, 1,
0.6112378, -0.9208621, 2.190672, 1, 1, 1, 1, 1,
0.6112576, 2.255368, 1.183646, 1, 1, 1, 1, 1,
0.6147732, 0.2419994, 3.025495, 1, 1, 1, 1, 1,
0.6208634, 1.197549, 0.2196404, 1, 1, 1, 1, 1,
0.6244056, 0.7050261, 0.6195887, 1, 1, 1, 1, 1,
0.6335836, -0.1616183, 1.825572, 1, 1, 1, 1, 1,
0.6402144, -2.105154, 1.211537, 1, 1, 1, 1, 1,
0.6428053, 0.1261946, 0.8299658, 0, 0, 1, 1, 1,
0.6459717, 0.6918209, 0.09741593, 1, 0, 0, 1, 1,
0.6474722, 0.322425, 0.01473122, 1, 0, 0, 1, 1,
0.6502897, -0.4082851, -0.2007795, 1, 0, 0, 1, 1,
0.6506416, 0.03902036, 1.162226, 1, 0, 0, 1, 1,
0.6531423, 0.8477569, 0.6741583, 1, 0, 0, 1, 1,
0.6534106, -1.03728, 3.092285, 0, 0, 0, 1, 1,
0.6620004, -0.8113936, 3.476773, 0, 0, 0, 1, 1,
0.6683476, 1.207998, 1.335365, 0, 0, 0, 1, 1,
0.6690874, -0.9930765, 2.389088, 0, 0, 0, 1, 1,
0.678224, -1.092797, 2.092827, 0, 0, 0, 1, 1,
0.6789867, 0.8785533, 1.342792, 0, 0, 0, 1, 1,
0.6844651, -0.346228, 2.405772, 0, 0, 0, 1, 1,
0.6855327, -0.5323194, 2.381715, 1, 1, 1, 1, 1,
0.6868749, 0.6170328, 1.357627, 1, 1, 1, 1, 1,
0.6875702, 0.3967786, 2.678885, 1, 1, 1, 1, 1,
0.6889784, 0.8350936, 0.9769313, 1, 1, 1, 1, 1,
0.6893483, 1.323444, 0.3560404, 1, 1, 1, 1, 1,
0.691888, 0.6385115, -0.5146632, 1, 1, 1, 1, 1,
0.6943129, -0.4685565, 2.215693, 1, 1, 1, 1, 1,
0.6962161, -0.6975848, 3.200265, 1, 1, 1, 1, 1,
0.705559, -1.912331, 2.694727, 1, 1, 1, 1, 1,
0.7058224, -0.09613163, 2.14172, 1, 1, 1, 1, 1,
0.7084786, -1.470482, 2.650038, 1, 1, 1, 1, 1,
0.7087036, 0.4301261, 2.64846, 1, 1, 1, 1, 1,
0.7153229, -0.4484387, 2.191876, 1, 1, 1, 1, 1,
0.7183142, -0.3606234, 2.124721, 1, 1, 1, 1, 1,
0.7188323, 1.083968, 0.2448884, 1, 1, 1, 1, 1,
0.7197568, -1.374403, 4.02324, 0, 0, 1, 1, 1,
0.7202037, -0.3947592, 2.41561, 1, 0, 0, 1, 1,
0.7264004, -0.7248266, 2.435723, 1, 0, 0, 1, 1,
0.7267447, -0.1421196, 2.826161, 1, 0, 0, 1, 1,
0.7347657, 0.4112253, -0.4081201, 1, 0, 0, 1, 1,
0.7359523, -0.08598349, 2.652496, 1, 0, 0, 1, 1,
0.7371387, -1.407362, 2.1342, 0, 0, 0, 1, 1,
0.7378944, -0.9022692, 2.64072, 0, 0, 0, 1, 1,
0.7412249, -0.5044531, 1.309163, 0, 0, 0, 1, 1,
0.7444884, 0.836749, -0.2668048, 0, 0, 0, 1, 1,
0.7488396, -1.212044, 1.725333, 0, 0, 0, 1, 1,
0.7601605, 1.268725, -0.37738, 0, 0, 0, 1, 1,
0.7622615, 0.2951892, 0.4560987, 0, 0, 0, 1, 1,
0.7669697, -0.1602269, 2.41492, 1, 1, 1, 1, 1,
0.767966, 0.5540189, 0.7359388, 1, 1, 1, 1, 1,
0.7695525, -0.6997966, 0.3839625, 1, 1, 1, 1, 1,
0.7728584, 0.05312666, 1.97561, 1, 1, 1, 1, 1,
0.7753122, -0.9970185, 1.887165, 1, 1, 1, 1, 1,
0.7767956, 0.6246296, -0.3020432, 1, 1, 1, 1, 1,
0.7783059, -1.513767, 2.732491, 1, 1, 1, 1, 1,
0.7851469, -0.4721111, 0.3684126, 1, 1, 1, 1, 1,
0.7882738, 0.2320974, 1.564782, 1, 1, 1, 1, 1,
0.7898075, -0.5657465, 1.749291, 1, 1, 1, 1, 1,
0.7935758, 0.7029896, 1.750165, 1, 1, 1, 1, 1,
0.7945371, 0.1178974, 2.824944, 1, 1, 1, 1, 1,
0.8029881, 1.408694, -0.8091739, 1, 1, 1, 1, 1,
0.8032167, 2.021012, -0.9899252, 1, 1, 1, 1, 1,
0.8058944, 0.5285361, 1.229831, 1, 1, 1, 1, 1,
0.8098397, 0.2116026, 1.247899, 0, 0, 1, 1, 1,
0.8117927, 0.998502, 1.241743, 1, 0, 0, 1, 1,
0.8144612, 0.9805989, 1.133586, 1, 0, 0, 1, 1,
0.8218575, 0.7301847, 0.8893008, 1, 0, 0, 1, 1,
0.8311371, 0.2699838, 0.47359, 1, 0, 0, 1, 1,
0.842648, 0.5411049, 0.5930386, 1, 0, 0, 1, 1,
0.8464742, -1.138699, 2.756658, 0, 0, 0, 1, 1,
0.8478135, -0.2944301, 1.859284, 0, 0, 0, 1, 1,
0.8479673, 1.278391, 0.9767301, 0, 0, 0, 1, 1,
0.8510562, -0.5345721, 0.07687163, 0, 0, 0, 1, 1,
0.8570003, 0.535906, 1.423327, 0, 0, 0, 1, 1,
0.8619166, -0.4860903, 3.002029, 0, 0, 0, 1, 1,
0.8633747, 1.007645, -0.4640416, 0, 0, 0, 1, 1,
0.8648255, 0.7667677, 1.646574, 1, 1, 1, 1, 1,
0.868091, -0.2688354, 1.241899, 1, 1, 1, 1, 1,
0.8695219, -0.1384792, 0.5140871, 1, 1, 1, 1, 1,
0.8723798, 0.6283995, 0.401982, 1, 1, 1, 1, 1,
0.8829849, -1.550282, 2.624182, 1, 1, 1, 1, 1,
0.8844425, -0.5002302, 2.418817, 1, 1, 1, 1, 1,
0.8879922, -0.9535199, 2.139887, 1, 1, 1, 1, 1,
0.8900722, -1.283476, 4.584201, 1, 1, 1, 1, 1,
0.8933722, -0.8109368, 2.068802, 1, 1, 1, 1, 1,
0.8943437, 0.4408085, 2.59804, 1, 1, 1, 1, 1,
0.8947696, -0.9148893, 2.936912, 1, 1, 1, 1, 1,
0.8955491, 0.2949971, 2.834945, 1, 1, 1, 1, 1,
0.8968619, 0.05075309, 1.599826, 1, 1, 1, 1, 1,
0.9063358, 0.3789135, 0.4855212, 1, 1, 1, 1, 1,
0.9152719, 0.1379036, 0.9543459, 1, 1, 1, 1, 1,
0.9289927, 0.5040121, 0.8005437, 0, 0, 1, 1, 1,
0.9306112, 0.5177124, 0.3568777, 1, 0, 0, 1, 1,
0.9307513, -0.1366077, 0.2655756, 1, 0, 0, 1, 1,
0.9307814, -0.686956, 1.27191, 1, 0, 0, 1, 1,
0.9328768, -0.3954301, 1.128822, 1, 0, 0, 1, 1,
0.9386695, 1.46386, 0.1253822, 1, 0, 0, 1, 1,
0.9408991, 0.6068872, 1.277567, 0, 0, 0, 1, 1,
0.9431627, -0.5219595, 0.6968888, 0, 0, 0, 1, 1,
0.9457954, -0.971443, 2.264485, 0, 0, 0, 1, 1,
0.9484544, -0.01113607, 0.4876297, 0, 0, 0, 1, 1,
0.9510154, 3.005236, 0.2941557, 0, 0, 0, 1, 1,
0.953074, -0.3851134, 3.25724, 0, 0, 0, 1, 1,
0.9547161, 1.330013, 0.3979339, 0, 0, 0, 1, 1,
0.9578452, 0.2279417, 2.354475, 1, 1, 1, 1, 1,
0.9618051, -0.959261, 2.468552, 1, 1, 1, 1, 1,
0.9651216, -0.4132503, 1.996377, 1, 1, 1, 1, 1,
0.9683576, -0.2165398, 0.9514834, 1, 1, 1, 1, 1,
0.9750417, -1.3095, 2.801365, 1, 1, 1, 1, 1,
0.9762266, 0.9603804, -0.9448903, 1, 1, 1, 1, 1,
0.9824306, -0.5182858, 0.741497, 1, 1, 1, 1, 1,
0.9845217, -0.4843887, 3.26587, 1, 1, 1, 1, 1,
0.9899803, -0.729176, 2.982715, 1, 1, 1, 1, 1,
1.003983, 0.9225054, 2.522364, 1, 1, 1, 1, 1,
1.005816, 0.8883384, 0.07089686, 1, 1, 1, 1, 1,
1.016893, -1.070742, 3.031634, 1, 1, 1, 1, 1,
1.020796, -0.3037483, 0.4637276, 1, 1, 1, 1, 1,
1.024086, -1.520704, 2.038611, 1, 1, 1, 1, 1,
1.026671, 1.097101, 1.125969, 1, 1, 1, 1, 1,
1.028955, 1.350417, 1.578482, 0, 0, 1, 1, 1,
1.030575, 0.6409877, 1.14782, 1, 0, 0, 1, 1,
1.031858, 0.3145028, -0.02297042, 1, 0, 0, 1, 1,
1.041763, -1.844695, 3.392781, 1, 0, 0, 1, 1,
1.042544, 0.3600449, -0.07112614, 1, 0, 0, 1, 1,
1.050439, -1.285522, 4.159394, 1, 0, 0, 1, 1,
1.054231, -0.369996, 2.264854, 0, 0, 0, 1, 1,
1.054666, -1.205955, 2.602775, 0, 0, 0, 1, 1,
1.054832, 1.04546, 2.020756, 0, 0, 0, 1, 1,
1.059768, -0.4700047, 2.434701, 0, 0, 0, 1, 1,
1.067675, -0.3818501, 2.474705, 0, 0, 0, 1, 1,
1.079933, 0.7422225, 0.4440714, 0, 0, 0, 1, 1,
1.083594, -1.123389, 1.728164, 0, 0, 0, 1, 1,
1.08385, 0.03549891, 2.42539, 1, 1, 1, 1, 1,
1.088254, -1.308135, 3.189005, 1, 1, 1, 1, 1,
1.093253, -1.602976, 2.682336, 1, 1, 1, 1, 1,
1.095445, 1.052021, -0.1399603, 1, 1, 1, 1, 1,
1.104929, 1.300486, 1.839014, 1, 1, 1, 1, 1,
1.105393, -0.5752997, 2.08193, 1, 1, 1, 1, 1,
1.108222, 0.0005866254, 0.1362205, 1, 1, 1, 1, 1,
1.109335, -1.497722, 3.468949, 1, 1, 1, 1, 1,
1.115039, 0.6495646, 1.142454, 1, 1, 1, 1, 1,
1.120183, 0.3514462, 1.53128, 1, 1, 1, 1, 1,
1.130038, -1.260145, 4.029629, 1, 1, 1, 1, 1,
1.131778, -0.7596678, 0.3492614, 1, 1, 1, 1, 1,
1.137122, -0.4291718, 2.71782, 1, 1, 1, 1, 1,
1.140997, 0.7071412, 1.444302, 1, 1, 1, 1, 1,
1.146681, 0.640442, 1.109167, 1, 1, 1, 1, 1,
1.151076, -0.9347558, 1.734222, 0, 0, 1, 1, 1,
1.162158, -1.408891, 2.459852, 1, 0, 0, 1, 1,
1.167838, -0.8371324, 3.390169, 1, 0, 0, 1, 1,
1.168122, 0.1248591, 1.155445, 1, 0, 0, 1, 1,
1.16873, -1.183815, 2.375854, 1, 0, 0, 1, 1,
1.174706, 0.4423936, 1.567661, 1, 0, 0, 1, 1,
1.189717, 1.407011, 2.220618, 0, 0, 0, 1, 1,
1.19023, -0.2092508, 3.872344, 0, 0, 0, 1, 1,
1.203415, 0.8748564, 0.5549645, 0, 0, 0, 1, 1,
1.205647, -0.7801134, 2.172257, 0, 0, 0, 1, 1,
1.206447, -1.198361, 2.912658, 0, 0, 0, 1, 1,
1.20899, 0.5520762, 1.821772, 0, 0, 0, 1, 1,
1.222192, 1.794864, -0.1282604, 0, 0, 0, 1, 1,
1.227148, -0.8009942, 2.849052, 1, 1, 1, 1, 1,
1.245773, 0.3630458, 1.474071, 1, 1, 1, 1, 1,
1.256202, 2.283107, 0.7865318, 1, 1, 1, 1, 1,
1.258232, -0.6788039, 0.6259472, 1, 1, 1, 1, 1,
1.265265, 0.5542459, -0.3897597, 1, 1, 1, 1, 1,
1.265793, -0.1187243, 1.154684, 1, 1, 1, 1, 1,
1.266088, -1.287496, 2.627479, 1, 1, 1, 1, 1,
1.270955, 1.564175, 1.735124, 1, 1, 1, 1, 1,
1.280122, -0.3510771, 2.265436, 1, 1, 1, 1, 1,
1.29158, 1.311885, 0.7186728, 1, 1, 1, 1, 1,
1.30241, -0.7412428, 2.06075, 1, 1, 1, 1, 1,
1.316261, 0.5279081, 0.0786255, 1, 1, 1, 1, 1,
1.317865, -0.3245519, 3.326067, 1, 1, 1, 1, 1,
1.320174, 0.1644027, 2.603018, 1, 1, 1, 1, 1,
1.320919, 0.3317847, 3.866704, 1, 1, 1, 1, 1,
1.325295, -0.5930476, 2.379274, 0, 0, 1, 1, 1,
1.325316, 0.6239046, -0.9577964, 1, 0, 0, 1, 1,
1.334613, -1.301701, 3.297783, 1, 0, 0, 1, 1,
1.340181, 1.160703, 0.2560416, 1, 0, 0, 1, 1,
1.347766, 0.844278, 1.254329, 1, 0, 0, 1, 1,
1.348969, -0.4059307, 2.35556, 1, 0, 0, 1, 1,
1.351262, -0.2796102, 2.301564, 0, 0, 0, 1, 1,
1.366666, -1.066961, 3.405283, 0, 0, 0, 1, 1,
1.390641, 0.5161071, 3.196286, 0, 0, 0, 1, 1,
1.411356, 2.565426, 0.9911014, 0, 0, 0, 1, 1,
1.413889, -0.4325082, 2.166046, 0, 0, 0, 1, 1,
1.427495, -0.07927898, 3.487307, 0, 0, 0, 1, 1,
1.429735, -0.5084055, 2.148972, 0, 0, 0, 1, 1,
1.434663, 0.623576, 0.6259601, 1, 1, 1, 1, 1,
1.438167, -0.8737491, 2.909783, 1, 1, 1, 1, 1,
1.445053, 0.1115298, 1.934742, 1, 1, 1, 1, 1,
1.447797, -0.02861033, 1.212615, 1, 1, 1, 1, 1,
1.448595, 1.428222, 1.596541, 1, 1, 1, 1, 1,
1.450912, -0.2076895, 2.042073, 1, 1, 1, 1, 1,
1.451156, 0.104784, 0.7813318, 1, 1, 1, 1, 1,
1.456948, -1.027041, 2.440957, 1, 1, 1, 1, 1,
1.457147, 0.6058496, 0.6689353, 1, 1, 1, 1, 1,
1.463915, 1.633513, 0.7735007, 1, 1, 1, 1, 1,
1.46931, -0.6168058, 1.369433, 1, 1, 1, 1, 1,
1.470199, -0.1327578, 2.550407, 1, 1, 1, 1, 1,
1.474507, -0.3704905, 2.313788, 1, 1, 1, 1, 1,
1.476905, 1.118428, -0.1283593, 1, 1, 1, 1, 1,
1.47793, -1.659016, 1.109151, 1, 1, 1, 1, 1,
1.479537, 1.702064, -0.2314968, 0, 0, 1, 1, 1,
1.484365, -0.6538246, 0.7463432, 1, 0, 0, 1, 1,
1.501523, 0.8927221, 1.938245, 1, 0, 0, 1, 1,
1.502583, -0.985845, 2.526208, 1, 0, 0, 1, 1,
1.502897, -1.149036, 2.7984, 1, 0, 0, 1, 1,
1.505563, -0.7692982, 0.4858956, 1, 0, 0, 1, 1,
1.510253, -0.676684, 1.834097, 0, 0, 0, 1, 1,
1.510792, 1.036669, 1.622094, 0, 0, 0, 1, 1,
1.513729, -0.6375656, 2.023104, 0, 0, 0, 1, 1,
1.51722, -1.151373, -0.1582257, 0, 0, 0, 1, 1,
1.531769, 0.09410475, 1.495236, 0, 0, 0, 1, 1,
1.536587, 0.6501669, 0.6600251, 0, 0, 0, 1, 1,
1.542009, -0.2305548, 1.183425, 0, 0, 0, 1, 1,
1.568046, -0.4324297, 2.306124, 1, 1, 1, 1, 1,
1.585476, -0.1735633, 1.263496, 1, 1, 1, 1, 1,
1.593577, -0.9961589, 1.674347, 1, 1, 1, 1, 1,
1.593758, -0.02222594, 1.440985, 1, 1, 1, 1, 1,
1.604882, -0.02831914, 0.3505039, 1, 1, 1, 1, 1,
1.610554, -0.6457999, 3.690649, 1, 1, 1, 1, 1,
1.612708, -0.0751415, 1.894936, 1, 1, 1, 1, 1,
1.619504, -0.1743583, 0.1486967, 1, 1, 1, 1, 1,
1.623857, 0.4072601, 2.945404, 1, 1, 1, 1, 1,
1.634648, -0.03698677, 1.619653, 1, 1, 1, 1, 1,
1.652802, -1.263415, 2.770508, 1, 1, 1, 1, 1,
1.661074, 0.7078599, 2.386629, 1, 1, 1, 1, 1,
1.661243, -0.9380337, 0.7186521, 1, 1, 1, 1, 1,
1.688358, 0.02376771, 2.840003, 1, 1, 1, 1, 1,
1.694429, 1.023325, 0.9149664, 1, 1, 1, 1, 1,
1.706496, -0.7386167, 1.67872, 0, 0, 1, 1, 1,
1.718639, -0.9231751, 3.943976, 1, 0, 0, 1, 1,
1.744372, 0.2468901, 2.774914, 1, 0, 0, 1, 1,
1.762144, -0.8516634, 2.420304, 1, 0, 0, 1, 1,
1.764303, 0.951773, 2.07727, 1, 0, 0, 1, 1,
1.767936, -0.1400439, 1.656535, 1, 0, 0, 1, 1,
1.770947, 0.2922668, 1.415718, 0, 0, 0, 1, 1,
1.781523, 1.359874, 1.841962, 0, 0, 0, 1, 1,
1.783228, -0.2093538, 1.432184, 0, 0, 0, 1, 1,
1.786968, -0.08101099, 2.138517, 0, 0, 0, 1, 1,
1.793314, 0.2373016, 1.73399, 0, 0, 0, 1, 1,
1.799164, 1.018265, 2.43836, 0, 0, 0, 1, 1,
1.805157, -2.556888, 3.562014, 0, 0, 0, 1, 1,
1.81564, -0.4693716, -1.005474, 1, 1, 1, 1, 1,
1.819094, -0.9163932, 2.093161, 1, 1, 1, 1, 1,
1.854014, -0.524839, 1.766781, 1, 1, 1, 1, 1,
1.855804, -0.2928466, 1.365135, 1, 1, 1, 1, 1,
1.873377, -1.150044, 2.01799, 1, 1, 1, 1, 1,
1.886797, 0.9722639, 1.293486, 1, 1, 1, 1, 1,
1.901732, 1.285354, -0.01716054, 1, 1, 1, 1, 1,
1.92712, -0.7315581, 3.143062, 1, 1, 1, 1, 1,
1.951212, 0.002825896, 1.047684, 1, 1, 1, 1, 1,
1.958358, -2.149491, 2.002074, 1, 1, 1, 1, 1,
1.963628, 0.2317122, -0.004298432, 1, 1, 1, 1, 1,
1.965569, 1.056322, 0.1798089, 1, 1, 1, 1, 1,
1.969745, 1.333545, 2.098859, 1, 1, 1, 1, 1,
1.986735, -0.07692032, 3.504935, 1, 1, 1, 1, 1,
1.99135, -1.172438, 2.92751, 1, 1, 1, 1, 1,
1.99664, -0.5334306, 3.246714, 0, 0, 1, 1, 1,
1.997682, 0.4709933, -0.1802954, 1, 0, 0, 1, 1,
2.036957, 0.4511127, 1.887265, 1, 0, 0, 1, 1,
2.044815, -1.477713, 3.609924, 1, 0, 0, 1, 1,
2.080747, -1.517569, 1.980172, 1, 0, 0, 1, 1,
2.110262, -0.3357249, 2.001017, 1, 0, 0, 1, 1,
2.114787, -0.3184631, 1.152693, 0, 0, 0, 1, 1,
2.124022, -1.059389, 1.192567, 0, 0, 0, 1, 1,
2.183011, 0.7619799, 0.3410766, 0, 0, 0, 1, 1,
2.259145, -0.6629797, 2.307843, 0, 0, 0, 1, 1,
2.278444, -0.302608, 2.047534, 0, 0, 0, 1, 1,
2.31609, 0.02188233, 3.175163, 0, 0, 0, 1, 1,
2.374233, -0.1505997, 2.35988, 0, 0, 0, 1, 1,
2.407382, -1.237692, 4.370975, 1, 1, 1, 1, 1,
2.512874, -2.428475, 1.39742, 1, 1, 1, 1, 1,
2.610573, -0.471494, 2.402424, 1, 1, 1, 1, 1,
2.674708, 0.2036711, 0.65595, 1, 1, 1, 1, 1,
2.960363, 1.476961, 2.153777, 1, 1, 1, 1, 1,
3.0408, -1.093241, 2.376973, 1, 1, 1, 1, 1,
3.252782, -0.536038, 1.602068, 1, 1, 1, 1, 1
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
var radius = 9.620421;
var distance = 33.79132;
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
mvMatrix.translate( 0.03638172, -0.2126987, -0.1819637 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79132);
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
