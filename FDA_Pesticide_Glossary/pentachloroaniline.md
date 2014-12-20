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
-3.55478, 1.235128, 0.5496637, 1, 0, 0, 1,
-2.867018, 0.4142247, -1.450441, 1, 0.007843138, 0, 1,
-2.726007, -1.126021, -2.580257, 1, 0.01176471, 0, 1,
-2.571768, -1.090504, -2.586078, 1, 0.01960784, 0, 1,
-2.555185, 0.03145934, -0.3089486, 1, 0.02352941, 0, 1,
-2.545913, 0.1034131, -1.775863, 1, 0.03137255, 0, 1,
-2.528099, -1.181185, -2.115647, 1, 0.03529412, 0, 1,
-2.499413, -1.468171, -0.6067976, 1, 0.04313726, 0, 1,
-2.493211, -1.39375, -1.776102, 1, 0.04705882, 0, 1,
-2.478421, -0.9312021, -3.286899, 1, 0.05490196, 0, 1,
-2.457846, -0.5464922, -2.931273, 1, 0.05882353, 0, 1,
-2.447579, 1.145578, -0.4213385, 1, 0.06666667, 0, 1,
-2.358331, -0.2681079, -1.002815, 1, 0.07058824, 0, 1,
-2.334369, -0.4446335, -1.836199, 1, 0.07843138, 0, 1,
-2.317989, 0.3189204, 0.9822651, 1, 0.08235294, 0, 1,
-2.3086, -0.3687456, -1.481175, 1, 0.09019608, 0, 1,
-2.299244, 1.817951, -0.3022391, 1, 0.09411765, 0, 1,
-2.277222, 0.2021438, -1.648821, 1, 0.1019608, 0, 1,
-2.24381, -0.4782832, -0.9049882, 1, 0.1098039, 0, 1,
-2.203829, -0.1417617, -0.792556, 1, 0.1137255, 0, 1,
-2.166592, -0.8912784, -1.623101, 1, 0.1215686, 0, 1,
-2.166178, -1.02487, -1.564704, 1, 0.1254902, 0, 1,
-2.163407, 1.05469, -0.9691023, 1, 0.1333333, 0, 1,
-2.147633, 0.9512012, -0.6146459, 1, 0.1372549, 0, 1,
-2.114863, -0.1935837, -1.443948, 1, 0.145098, 0, 1,
-2.096692, -0.4875699, -1.248226, 1, 0.1490196, 0, 1,
-2.076116, -1.0979, -1.169956, 1, 0.1568628, 0, 1,
-2.007869, 1.806992, 0.02317053, 1, 0.1607843, 0, 1,
-2.003363, 0.255716, -1.206601, 1, 0.1686275, 0, 1,
-1.99611, 0.08917078, 0.4494555, 1, 0.172549, 0, 1,
-1.995547, -1.5585, -1.171611, 1, 0.1803922, 0, 1,
-1.984693, 0.01113081, -2.163945, 1, 0.1843137, 0, 1,
-1.976432, 0.7018397, -1.838298, 1, 0.1921569, 0, 1,
-1.875758, 0.4359018, -1.383666, 1, 0.1960784, 0, 1,
-1.861232, 1.07986, -0.8729628, 1, 0.2039216, 0, 1,
-1.839413, -0.8697338, -2.397191, 1, 0.2117647, 0, 1,
-1.833507, -2.16173, -2.09337, 1, 0.2156863, 0, 1,
-1.833376, 0.1515107, -2.182421, 1, 0.2235294, 0, 1,
-1.832688, 0.9246924, -0.6823407, 1, 0.227451, 0, 1,
-1.823307, 0.3642958, -1.652662, 1, 0.2352941, 0, 1,
-1.796283, -0.3897802, -1.373501, 1, 0.2392157, 0, 1,
-1.795376, 0.4001358, -1.785662, 1, 0.2470588, 0, 1,
-1.778914, -0.4515797, -1.773567, 1, 0.2509804, 0, 1,
-1.778012, 0.3138364, -0.2112986, 1, 0.2588235, 0, 1,
-1.700187, -0.3175313, -2.552325, 1, 0.2627451, 0, 1,
-1.668767, 0.5946735, -0.8514583, 1, 0.2705882, 0, 1,
-1.645772, 0.3124442, -1.373585, 1, 0.2745098, 0, 1,
-1.628173, -1.156287, -3.038092, 1, 0.282353, 0, 1,
-1.627976, -1.25511, -2.219605, 1, 0.2862745, 0, 1,
-1.617384, 1.425789, -0.6684564, 1, 0.2941177, 0, 1,
-1.61545, 0.09512401, -2.350775, 1, 0.3019608, 0, 1,
-1.614047, -2.230677, -2.988623, 1, 0.3058824, 0, 1,
-1.608452, 0.2991857, -2.05008, 1, 0.3137255, 0, 1,
-1.607599, 0.4161771, 0.3178225, 1, 0.3176471, 0, 1,
-1.591395, -0.5976884, -1.577097, 1, 0.3254902, 0, 1,
-1.561594, -0.6702922, -1.41285, 1, 0.3294118, 0, 1,
-1.557017, 0.3103617, -1.021336, 1, 0.3372549, 0, 1,
-1.552261, -1.11104, -2.286704, 1, 0.3411765, 0, 1,
-1.550973, -1.819077, -1.67397, 1, 0.3490196, 0, 1,
-1.546781, -0.2518019, -2.247289, 1, 0.3529412, 0, 1,
-1.545667, 0.6499479, -2.981035, 1, 0.3607843, 0, 1,
-1.542869, 0.3013883, -1.250577, 1, 0.3647059, 0, 1,
-1.539426, -0.111049, -0.1574067, 1, 0.372549, 0, 1,
-1.532739, -0.6628225, -1.473684, 1, 0.3764706, 0, 1,
-1.520863, 0.09875944, -1.34159, 1, 0.3843137, 0, 1,
-1.514132, 0.2916569, -1.874096, 1, 0.3882353, 0, 1,
-1.512856, 1.727424, -1.411762, 1, 0.3960784, 0, 1,
-1.508138, 0.6167356, -2.178509, 1, 0.4039216, 0, 1,
-1.497624, 1.307021, 0.339384, 1, 0.4078431, 0, 1,
-1.494086, -0.1738725, -1.133415, 1, 0.4156863, 0, 1,
-1.492161, 0.3384833, -1.997434, 1, 0.4196078, 0, 1,
-1.486162, 0.6608862, -2.415884, 1, 0.427451, 0, 1,
-1.479101, -1.083302, -1.939748, 1, 0.4313726, 0, 1,
-1.471783, -1.162506, -3.069792, 1, 0.4392157, 0, 1,
-1.471484, 0.04085467, -0.6287794, 1, 0.4431373, 0, 1,
-1.471061, 2.112581, 0.1956523, 1, 0.4509804, 0, 1,
-1.462479, -0.3665197, -1.976832, 1, 0.454902, 0, 1,
-1.457351, 0.5145281, -2.769132, 1, 0.4627451, 0, 1,
-1.445055, 0.5869048, -2.082845, 1, 0.4666667, 0, 1,
-1.420743, 1.357827, 0.2373187, 1, 0.4745098, 0, 1,
-1.40364, 0.3284888, -2.460152, 1, 0.4784314, 0, 1,
-1.39923, -0.203347, -3.263856, 1, 0.4862745, 0, 1,
-1.396403, -1.765165, -1.843082, 1, 0.4901961, 0, 1,
-1.384598, -0.1318093, -2.098356, 1, 0.4980392, 0, 1,
-1.378175, 1.822284, 0.6240262, 1, 0.5058824, 0, 1,
-1.373875, 1.292837, -0.8383909, 1, 0.509804, 0, 1,
-1.37385, 0.8263118, -1.584726, 1, 0.5176471, 0, 1,
-1.366716, 0.4617062, -0.07973246, 1, 0.5215687, 0, 1,
-1.365446, -0.8640725, -0.4969932, 1, 0.5294118, 0, 1,
-1.36434, -0.8059987, -2.673371, 1, 0.5333334, 0, 1,
-1.359887, -0.5098368, -0.5249863, 1, 0.5411765, 0, 1,
-1.353663, -0.07753976, -2.943822, 1, 0.5450981, 0, 1,
-1.343564, -0.8578647, -1.673396, 1, 0.5529412, 0, 1,
-1.318603, -0.5511349, -1.143721, 1, 0.5568628, 0, 1,
-1.308319, 0.4036803, -2.218509, 1, 0.5647059, 0, 1,
-1.292398, 0.4705209, -1.922822, 1, 0.5686275, 0, 1,
-1.28059, 3.132704, -1.534754, 1, 0.5764706, 0, 1,
-1.27993, -1.03022, -3.266749, 1, 0.5803922, 0, 1,
-1.278214, 0.01928456, -0.1247421, 1, 0.5882353, 0, 1,
-1.274797, -0.2674849, -0.6430932, 1, 0.5921569, 0, 1,
-1.265374, 0.8275915, -1.10434, 1, 0.6, 0, 1,
-1.262961, 0.2738675, -2.064563, 1, 0.6078432, 0, 1,
-1.262368, 0.3403225, -1.914507, 1, 0.6117647, 0, 1,
-1.255422, -0.2367188, -1.921619, 1, 0.6196079, 0, 1,
-1.243754, -1.966572, -2.729497, 1, 0.6235294, 0, 1,
-1.242749, -0.9332044, -1.934931, 1, 0.6313726, 0, 1,
-1.235737, 2.431808, -2.719147, 1, 0.6352941, 0, 1,
-1.233236, 1.041798, 0.2362088, 1, 0.6431373, 0, 1,
-1.232153, 0.9697573, -1.184427, 1, 0.6470588, 0, 1,
-1.226375, -0.1902813, -2.276201, 1, 0.654902, 0, 1,
-1.224602, -0.6119777, 0.3740526, 1, 0.6588235, 0, 1,
-1.223581, -1.198188, -3.843367, 1, 0.6666667, 0, 1,
-1.220182, -0.6106502, -1.73289, 1, 0.6705883, 0, 1,
-1.219345, -0.4142402, -2.190285, 1, 0.6784314, 0, 1,
-1.218159, -0.3302478, -1.087859, 1, 0.682353, 0, 1,
-1.19668, 1.168052, -0.5899487, 1, 0.6901961, 0, 1,
-1.196102, 0.2693207, -1.859081, 1, 0.6941177, 0, 1,
-1.195767, 1.254674, -0.841126, 1, 0.7019608, 0, 1,
-1.186991, -1.792099, -3.838948, 1, 0.7098039, 0, 1,
-1.18344, 0.08675011, 0.09791263, 1, 0.7137255, 0, 1,
-1.17715, -0.3223575, -1.780992, 1, 0.7215686, 0, 1,
-1.175896, -0.9441028, -2.109791, 1, 0.7254902, 0, 1,
-1.175732, -0.682348, -2.407563, 1, 0.7333333, 0, 1,
-1.165984, -1.826138, -3.081669, 1, 0.7372549, 0, 1,
-1.156262, -0.01385583, -3.205867, 1, 0.7450981, 0, 1,
-1.147961, -0.7564835, -1.517519, 1, 0.7490196, 0, 1,
-1.137182, -0.1251615, -2.249059, 1, 0.7568628, 0, 1,
-1.128309, 0.1038065, -1.633986, 1, 0.7607843, 0, 1,
-1.126675, -0.7778534, 0.01543413, 1, 0.7686275, 0, 1,
-1.120282, 0.5828969, 0.7107139, 1, 0.772549, 0, 1,
-1.116255, -0.7086631, -2.286725, 1, 0.7803922, 0, 1,
-1.116053, 0.1728411, -0.8002867, 1, 0.7843137, 0, 1,
-1.113936, -0.6251642, -2.845503, 1, 0.7921569, 0, 1,
-1.113688, 1.304787, -1.119652, 1, 0.7960784, 0, 1,
-1.11289, -0.07596499, -1.595316, 1, 0.8039216, 0, 1,
-1.112579, 0.4716877, -1.407568, 1, 0.8117647, 0, 1,
-1.112052, -0.0850333, -0.201026, 1, 0.8156863, 0, 1,
-1.110934, 1.225489, -1.557326, 1, 0.8235294, 0, 1,
-1.109353, -0.4868469, -3.402831, 1, 0.827451, 0, 1,
-1.095965, 0.5383926, -2.313747, 1, 0.8352941, 0, 1,
-1.093438, 0.7295221, -2.109516, 1, 0.8392157, 0, 1,
-1.092951, 1.22751, 0.1597565, 1, 0.8470588, 0, 1,
-1.09101, 0.8272777, -1.766, 1, 0.8509804, 0, 1,
-1.081915, -0.4328885, -2.018779, 1, 0.8588235, 0, 1,
-1.073297, 0.2092145, -2.917731, 1, 0.8627451, 0, 1,
-1.070365, 0.6791443, 0.1557833, 1, 0.8705882, 0, 1,
-1.069395, -0.7408556, -1.303541, 1, 0.8745098, 0, 1,
-1.064803, -0.06347117, -3.659715, 1, 0.8823529, 0, 1,
-1.056162, -0.9296402, -2.735019, 1, 0.8862745, 0, 1,
-1.049867, -0.403025, -1.484594, 1, 0.8941177, 0, 1,
-1.048157, 0.3852705, -0.343614, 1, 0.8980392, 0, 1,
-1.046167, -0.250384, -1.90154, 1, 0.9058824, 0, 1,
-1.041169, -1.594777, -3.704062, 1, 0.9137255, 0, 1,
-1.036037, -0.7355929, -2.215086, 1, 0.9176471, 0, 1,
-1.032117, -1.496257, -1.413544, 1, 0.9254902, 0, 1,
-1.025129, 0.3956626, -2.035589, 1, 0.9294118, 0, 1,
-1.020186, 0.2579584, -1.613717, 1, 0.9372549, 0, 1,
-1.019883, 2.85376, -1.901784, 1, 0.9411765, 0, 1,
-1.016578, -0.03798726, -1.361438, 1, 0.9490196, 0, 1,
-1.011951, 0.4454521, -2.252049, 1, 0.9529412, 0, 1,
-1.010455, 0.04921152, -0.1086577, 1, 0.9607843, 0, 1,
-1.002414, -0.7904373, -1.51858, 1, 0.9647059, 0, 1,
-1.001677, -1.550071, -1.520673, 1, 0.972549, 0, 1,
-0.9993716, -0.4742464, -1.104061, 1, 0.9764706, 0, 1,
-0.9926717, 1.402428, 0.840175, 1, 0.9843137, 0, 1,
-0.9922507, 0.4679644, -1.567751, 1, 0.9882353, 0, 1,
-0.9869792, 0.2666458, 1.245467, 1, 0.9960784, 0, 1,
-0.9755058, -2.386159, 0.02715652, 0.9960784, 1, 0, 1,
-0.9741542, -0.9032646, -1.525515, 0.9921569, 1, 0, 1,
-0.9738252, -0.6724069, -2.583896, 0.9843137, 1, 0, 1,
-0.9720394, 0.02104335, -2.668766, 0.9803922, 1, 0, 1,
-0.9626897, -1.049761, -1.003259, 0.972549, 1, 0, 1,
-0.9615988, 0.8407272, -3.754205, 0.9686275, 1, 0, 1,
-0.9537704, -0.08221852, -0.848339, 0.9607843, 1, 0, 1,
-0.947279, 0.4210615, -1.521005, 0.9568627, 1, 0, 1,
-0.9438391, 0.01163174, -1.80762, 0.9490196, 1, 0, 1,
-0.9430797, -0.3094505, -1.181827, 0.945098, 1, 0, 1,
-0.9413069, 0.3925593, -0.2778317, 0.9372549, 1, 0, 1,
-0.9330031, -0.04419379, -1.022611, 0.9333333, 1, 0, 1,
-0.932332, 0.3544279, -0.679937, 0.9254902, 1, 0, 1,
-0.929629, -0.942124, -1.357472, 0.9215686, 1, 0, 1,
-0.9296092, 0.4415422, -2.069388, 0.9137255, 1, 0, 1,
-0.9260457, -0.3061992, -2.096085, 0.9098039, 1, 0, 1,
-0.9222632, 1.247222, -1.197084, 0.9019608, 1, 0, 1,
-0.92035, -0.2652056, -1.109396, 0.8941177, 1, 0, 1,
-0.9191425, 0.906774, -1.234404, 0.8901961, 1, 0, 1,
-0.9187902, 0.3593238, -0.1466223, 0.8823529, 1, 0, 1,
-0.9061881, -0.7222263, -3.662536, 0.8784314, 1, 0, 1,
-0.9025745, -1.251268, -3.504503, 0.8705882, 1, 0, 1,
-0.9001355, -0.0419368, -0.7281952, 0.8666667, 1, 0, 1,
-0.8995311, 0.2797616, -0.9945092, 0.8588235, 1, 0, 1,
-0.8936881, -0.696457, -0.7948759, 0.854902, 1, 0, 1,
-0.8936586, 0.4862194, -1.32371, 0.8470588, 1, 0, 1,
-0.8935195, 0.9792613, -1.594423, 0.8431373, 1, 0, 1,
-0.8909164, -0.4640625, -1.428783, 0.8352941, 1, 0, 1,
-0.8894262, -2.193091, -3.044721, 0.8313726, 1, 0, 1,
-0.8887863, 0.3918303, -0.450755, 0.8235294, 1, 0, 1,
-0.8886558, -1.32505, -3.503941, 0.8196079, 1, 0, 1,
-0.8879989, -1.299819, -4.372622, 0.8117647, 1, 0, 1,
-0.8802152, 1.131264, -0.5903642, 0.8078431, 1, 0, 1,
-0.8788825, -0.527761, -3.333813, 0.8, 1, 0, 1,
-0.8763409, 1.976456, -1.05952, 0.7921569, 1, 0, 1,
-0.8742293, -0.8429695, -2.014389, 0.7882353, 1, 0, 1,
-0.8703335, -0.3749927, -1.652152, 0.7803922, 1, 0, 1,
-0.8696939, 0.9845365, -0.5634782, 0.7764706, 1, 0, 1,
-0.8674454, 0.7454591, -0.3007875, 0.7686275, 1, 0, 1,
-0.8672634, 0.8993855, -1.421932, 0.7647059, 1, 0, 1,
-0.8655834, -0.2209981, -2.984452, 0.7568628, 1, 0, 1,
-0.8641735, 1.005072, -2.515102, 0.7529412, 1, 0, 1,
-0.8619267, -0.8535262, -2.132163, 0.7450981, 1, 0, 1,
-0.8601934, 0.2941125, -2.236217, 0.7411765, 1, 0, 1,
-0.8541325, 1.56936, -0.5811377, 0.7333333, 1, 0, 1,
-0.8499195, 0.09505992, -1.408663, 0.7294118, 1, 0, 1,
-0.8388892, 0.2925861, -0.9405274, 0.7215686, 1, 0, 1,
-0.8371219, -0.4143445, -2.274615, 0.7176471, 1, 0, 1,
-0.8367895, -2.116357, -2.367614, 0.7098039, 1, 0, 1,
-0.8284537, 0.01950147, -1.226398, 0.7058824, 1, 0, 1,
-0.8225269, -0.900507, -3.651632, 0.6980392, 1, 0, 1,
-0.8154174, -2.864767, -1.569584, 0.6901961, 1, 0, 1,
-0.8053585, 1.008182, -0.6050176, 0.6862745, 1, 0, 1,
-0.8026763, -1.547697, -1.819288, 0.6784314, 1, 0, 1,
-0.8025292, 0.3985664, -2.112888, 0.6745098, 1, 0, 1,
-0.7985286, 1.252671, -0.8922983, 0.6666667, 1, 0, 1,
-0.7957744, -0.3320231, -1.442932, 0.6627451, 1, 0, 1,
-0.7953987, 0.6922094, 1.230641, 0.654902, 1, 0, 1,
-0.7934015, 0.6806585, -0.2464335, 0.6509804, 1, 0, 1,
-0.7743353, 0.8299482, 0.04656044, 0.6431373, 1, 0, 1,
-0.7703446, 1.393192, 1.204615, 0.6392157, 1, 0, 1,
-0.7683965, -1.896974, -2.167404, 0.6313726, 1, 0, 1,
-0.766203, 0.04716764, -1.785843, 0.627451, 1, 0, 1,
-0.7627258, 0.6489084, -1.476415, 0.6196079, 1, 0, 1,
-0.7589851, -0.8649176, -2.85151, 0.6156863, 1, 0, 1,
-0.7586328, 0.7008238, 2.050784, 0.6078432, 1, 0, 1,
-0.7513545, 0.1618121, -0.3213722, 0.6039216, 1, 0, 1,
-0.7481767, 1.265544, -0.6089447, 0.5960785, 1, 0, 1,
-0.7467284, -0.2087831, -0.5886656, 0.5882353, 1, 0, 1,
-0.7462421, 0.6628462, -0.7594771, 0.5843138, 1, 0, 1,
-0.7414142, -0.2294353, -2.029164, 0.5764706, 1, 0, 1,
-0.7353781, 0.8650618, -0.6884755, 0.572549, 1, 0, 1,
-0.7340401, 0.127038, -0.7527081, 0.5647059, 1, 0, 1,
-0.7295054, 0.2943199, -1.063966, 0.5607843, 1, 0, 1,
-0.7254372, -1.173402, -2.572779, 0.5529412, 1, 0, 1,
-0.7241194, -0.6866161, -3.866074, 0.5490196, 1, 0, 1,
-0.7157204, -0.4417473, -2.793905, 0.5411765, 1, 0, 1,
-0.7144915, -0.8613677, -2.033956, 0.5372549, 1, 0, 1,
-0.7143135, -1.806091, -3.7362, 0.5294118, 1, 0, 1,
-0.7061634, 1.447563, -1.774267, 0.5254902, 1, 0, 1,
-0.6941323, 1.096954, -0.7190995, 0.5176471, 1, 0, 1,
-0.693109, -0.3753706, -4.083982, 0.5137255, 1, 0, 1,
-0.6916697, -2.053972, -2.713284, 0.5058824, 1, 0, 1,
-0.6879125, -0.8313602, -1.142864, 0.5019608, 1, 0, 1,
-0.6808537, -1.404376, -4.15207, 0.4941176, 1, 0, 1,
-0.6794795, 1.04455, -0.9477587, 0.4862745, 1, 0, 1,
-0.6768222, 0.6111337, -1.051779, 0.4823529, 1, 0, 1,
-0.6740126, -0.4009951, -4.046298, 0.4745098, 1, 0, 1,
-0.6731313, 0.9421657, -0.6817517, 0.4705882, 1, 0, 1,
-0.6729012, 0.6061984, -1.438452, 0.4627451, 1, 0, 1,
-0.6722965, 0.998634, -1.671128, 0.4588235, 1, 0, 1,
-0.6707972, -0.137736, 0.3208251, 0.4509804, 1, 0, 1,
-0.6673983, 1.830999, -1.277434, 0.4470588, 1, 0, 1,
-0.6622119, 1.172552, -1.161838, 0.4392157, 1, 0, 1,
-0.6608163, 0.1091974, -1.60485, 0.4352941, 1, 0, 1,
-0.6606374, -0.717222, -2.890301, 0.427451, 1, 0, 1,
-0.6587867, 0.9077871, -0.7888654, 0.4235294, 1, 0, 1,
-0.6521928, -0.554448, -3.626463, 0.4156863, 1, 0, 1,
-0.6468961, -1.603035, -2.691236, 0.4117647, 1, 0, 1,
-0.6455288, 0.981742, -0.8081362, 0.4039216, 1, 0, 1,
-0.64409, -0.7949023, -1.17862, 0.3960784, 1, 0, 1,
-0.6432541, 1.438126, 0.1068772, 0.3921569, 1, 0, 1,
-0.6400217, 0.5846446, 0.5386044, 0.3843137, 1, 0, 1,
-0.6357207, 2.198683, -0.5936564, 0.3803922, 1, 0, 1,
-0.6348239, -0.09433767, -1.455717, 0.372549, 1, 0, 1,
-0.6306025, 0.2567558, -1.205896, 0.3686275, 1, 0, 1,
-0.6202165, 1.469985, -0.1030956, 0.3607843, 1, 0, 1,
-0.6148739, -0.4630232, -3.083447, 0.3568628, 1, 0, 1,
-0.61275, -0.1039274, -1.671561, 0.3490196, 1, 0, 1,
-0.6109093, 0.1151009, -1.149787, 0.345098, 1, 0, 1,
-0.6102461, 0.1580159, -1.48133, 0.3372549, 1, 0, 1,
-0.6056951, -0.8406894, -2.285896, 0.3333333, 1, 0, 1,
-0.6029375, 0.6484193, -1.538911, 0.3254902, 1, 0, 1,
-0.5985433, 0.1192122, -0.7707174, 0.3215686, 1, 0, 1,
-0.5976228, -0.1906818, -0.987151, 0.3137255, 1, 0, 1,
-0.5901018, 1.222665, -0.9462148, 0.3098039, 1, 0, 1,
-0.5900962, -0.1162532, -1.472646, 0.3019608, 1, 0, 1,
-0.5897171, -0.08418563, -1.124131, 0.2941177, 1, 0, 1,
-0.5883869, 0.6549688, 1.395046, 0.2901961, 1, 0, 1,
-0.5862665, 2.157546, -0.8405409, 0.282353, 1, 0, 1,
-0.5859731, -1.34353, -3.747681, 0.2784314, 1, 0, 1,
-0.5820187, -0.7213125, -2.749808, 0.2705882, 1, 0, 1,
-0.5718741, 0.05708015, -3.991476, 0.2666667, 1, 0, 1,
-0.5710437, -1.154118, -2.651822, 0.2588235, 1, 0, 1,
-0.5665876, 1.852134, -1.806327, 0.254902, 1, 0, 1,
-0.5556442, -0.2671943, -2.106797, 0.2470588, 1, 0, 1,
-0.5455571, -0.235097, -1.627234, 0.2431373, 1, 0, 1,
-0.5420181, 0.8315143, -1.853523, 0.2352941, 1, 0, 1,
-0.538758, -0.7752195, -2.581113, 0.2313726, 1, 0, 1,
-0.5328897, 1.810118, -0.9748408, 0.2235294, 1, 0, 1,
-0.5267896, 0.9597697, -1.348267, 0.2196078, 1, 0, 1,
-0.52651, 0.4984743, 0.6301072, 0.2117647, 1, 0, 1,
-0.5252102, 0.945304, 0.7086979, 0.2078431, 1, 0, 1,
-0.5215287, 0.01575775, -1.986846, 0.2, 1, 0, 1,
-0.5188644, 0.7817418, 2.086344, 0.1921569, 1, 0, 1,
-0.5142208, -0.1890114, -2.313444, 0.1882353, 1, 0, 1,
-0.5117448, -0.889203, -2.286658, 0.1803922, 1, 0, 1,
-0.5094795, 0.3276466, 0.2694471, 0.1764706, 1, 0, 1,
-0.5072349, 0.4802671, -1.088976, 0.1686275, 1, 0, 1,
-0.4996499, 0.3614643, -0.5253072, 0.1647059, 1, 0, 1,
-0.4990048, 0.5369156, -0.2732965, 0.1568628, 1, 0, 1,
-0.4967978, 0.5148233, -1.699806, 0.1529412, 1, 0, 1,
-0.4963341, 0.4799051, -0.4371145, 0.145098, 1, 0, 1,
-0.4961597, 0.4064399, -1.042074, 0.1411765, 1, 0, 1,
-0.4883181, 0.8209412, -2.829374, 0.1333333, 1, 0, 1,
-0.487403, -0.2523395, -2.606753, 0.1294118, 1, 0, 1,
-0.4855279, 0.8213399, 0.8229396, 0.1215686, 1, 0, 1,
-0.4798111, -1.132809, -4.007042, 0.1176471, 1, 0, 1,
-0.4796376, -0.9263511, -4.282856, 0.1098039, 1, 0, 1,
-0.4764488, -0.147792, -1.372642, 0.1058824, 1, 0, 1,
-0.4761445, -0.5804592, -3.014628, 0.09803922, 1, 0, 1,
-0.4721933, 0.6799747, -3.1409, 0.09019608, 1, 0, 1,
-0.4688725, 0.5637506, -1.464594, 0.08627451, 1, 0, 1,
-0.4645287, -0.3866012, -2.654509, 0.07843138, 1, 0, 1,
-0.4617191, -1.796844, -1.889619, 0.07450981, 1, 0, 1,
-0.456556, 0.756573, -1.784589, 0.06666667, 1, 0, 1,
-0.4527118, 1.276635, -1.744386, 0.0627451, 1, 0, 1,
-0.4522504, -0.7262275, -3.339891, 0.05490196, 1, 0, 1,
-0.4505349, -0.6310562, -2.237629, 0.05098039, 1, 0, 1,
-0.4465377, 1.047336, 1.149657, 0.04313726, 1, 0, 1,
-0.4453793, 0.4474926, -1.705846, 0.03921569, 1, 0, 1,
-0.4418229, 0.02228292, -2.216814, 0.03137255, 1, 0, 1,
-0.43999, -0.08753276, -0.4069208, 0.02745098, 1, 0, 1,
-0.4395315, -1.00495, -1.233493, 0.01960784, 1, 0, 1,
-0.4383289, 0.7860085, -1.272425, 0.01568628, 1, 0, 1,
-0.4372917, 0.7907066, -1.560273, 0.007843138, 1, 0, 1,
-0.4368958, -1.151155, -2.681267, 0.003921569, 1, 0, 1,
-0.4367628, -1.466593, -4.309254, 0, 1, 0.003921569, 1,
-0.434377, 2.093981, 0.3461937, 0, 1, 0.01176471, 1,
-0.4334454, 1.665546, 0.3746762, 0, 1, 0.01568628, 1,
-0.4333, -0.3765193, -3.013138, 0, 1, 0.02352941, 1,
-0.4319455, 1.225103, -0.117893, 0, 1, 0.02745098, 1,
-0.4197999, 0.9822304, 0.4405753, 0, 1, 0.03529412, 1,
-0.4197089, -0.3946585, -3.499735, 0, 1, 0.03921569, 1,
-0.4182287, -1.256424, -3.405412, 0, 1, 0.04705882, 1,
-0.415509, -0.4849271, -4.373628, 0, 1, 0.05098039, 1,
-0.4144423, 1.002573, -1.70886, 0, 1, 0.05882353, 1,
-0.4124263, -1.954958, -2.63629, 0, 1, 0.0627451, 1,
-0.4114542, 0.7589461, 0.6826286, 0, 1, 0.07058824, 1,
-0.409949, -0.3324494, -3.019767, 0, 1, 0.07450981, 1,
-0.4090926, 1.505432, -0.6548212, 0, 1, 0.08235294, 1,
-0.4010243, 1.256799, 0.2483133, 0, 1, 0.08627451, 1,
-0.3982339, -1.042162, -3.398806, 0, 1, 0.09411765, 1,
-0.395453, -0.01239044, 1.016961, 0, 1, 0.1019608, 1,
-0.3945642, -0.4577346, -2.139233, 0, 1, 0.1058824, 1,
-0.3916581, 0.6027629, -1.420501, 0, 1, 0.1137255, 1,
-0.3915951, 2.114231, -0.03539162, 0, 1, 0.1176471, 1,
-0.3870775, -0.163224, -4.056012, 0, 1, 0.1254902, 1,
-0.3864959, -0.5269821, -0.3445702, 0, 1, 0.1294118, 1,
-0.3861488, 1.900551, 0.6557708, 0, 1, 0.1372549, 1,
-0.3830904, 0.5759255, -0.871664, 0, 1, 0.1411765, 1,
-0.3734807, 1.061071, -0.4580151, 0, 1, 0.1490196, 1,
-0.3705281, 1.158296, 1.440989, 0, 1, 0.1529412, 1,
-0.3679333, 1.272285, -0.592195, 0, 1, 0.1607843, 1,
-0.3676324, -0.8381805, -1.407731, 0, 1, 0.1647059, 1,
-0.3663619, -2.162899, -2.599019, 0, 1, 0.172549, 1,
-0.3621279, 2.500057, -0.1426834, 0, 1, 0.1764706, 1,
-0.3610307, 0.9971443, 0.2892941, 0, 1, 0.1843137, 1,
-0.3509899, 0.1259165, -1.967723, 0, 1, 0.1882353, 1,
-0.3472613, 0.1638333, -2.323958, 0, 1, 0.1960784, 1,
-0.3440548, 1.610157, -1.820501, 0, 1, 0.2039216, 1,
-0.3381293, -1.924945, -1.803338, 0, 1, 0.2078431, 1,
-0.3379282, 1.262779, 1.779112, 0, 1, 0.2156863, 1,
-0.3333482, -0.4143899, -3.317165, 0, 1, 0.2196078, 1,
-0.3329801, 1.566207, -1.790942, 0, 1, 0.227451, 1,
-0.3324689, 0.6371343, 0.09211574, 0, 1, 0.2313726, 1,
-0.3306116, 0.3254772, -1.59216, 0, 1, 0.2392157, 1,
-0.3296608, 2.716368, -0.1697493, 0, 1, 0.2431373, 1,
-0.3244261, 0.0339799, -2.171469, 0, 1, 0.2509804, 1,
-0.3211048, -2.100709, -2.375172, 0, 1, 0.254902, 1,
-0.3164726, 0.6570029, -0.1150597, 0, 1, 0.2627451, 1,
-0.3134982, -0.9470724, -3.165885, 0, 1, 0.2666667, 1,
-0.3125712, -1.255679, -3.314867, 0, 1, 0.2745098, 1,
-0.3117816, 0.901068, -1.42555, 0, 1, 0.2784314, 1,
-0.310223, -2.172184, -2.803308, 0, 1, 0.2862745, 1,
-0.3096178, 1.54466, 0.5452594, 0, 1, 0.2901961, 1,
-0.3090447, -0.1382333, -2.248742, 0, 1, 0.2980392, 1,
-0.2993444, 0.9138569, -1.590549, 0, 1, 0.3058824, 1,
-0.2990758, -0.8168607, -3.107105, 0, 1, 0.3098039, 1,
-0.2960341, 1.375809, 0.4832614, 0, 1, 0.3176471, 1,
-0.2948029, -0.2866631, -0.725621, 0, 1, 0.3215686, 1,
-0.2887737, 1.76734, -0.755262, 0, 1, 0.3294118, 1,
-0.2885464, -0.5430988, -4.056502, 0, 1, 0.3333333, 1,
-0.2874771, 1.411773, -1.570227, 0, 1, 0.3411765, 1,
-0.2866685, 0.05973909, 0.690001, 0, 1, 0.345098, 1,
-0.2858346, 1.249373, 3.59635, 0, 1, 0.3529412, 1,
-0.2854754, -0.8825908, -2.471514, 0, 1, 0.3568628, 1,
-0.2841509, 0.2842881, -0.3104362, 0, 1, 0.3647059, 1,
-0.2825661, 0.08635807, -2.386204, 0, 1, 0.3686275, 1,
-0.2822057, 0.6569777, -0.1040515, 0, 1, 0.3764706, 1,
-0.2779258, -1.222275, -4.445553, 0, 1, 0.3803922, 1,
-0.276024, 0.5780305, -0.9418446, 0, 1, 0.3882353, 1,
-0.2746633, 0.4358861, 0.1795464, 0, 1, 0.3921569, 1,
-0.2746527, 1.501836, -1.006898, 0, 1, 0.4, 1,
-0.273009, -0.08545303, -1.421764, 0, 1, 0.4078431, 1,
-0.2671667, -0.1849893, -2.573051, 0, 1, 0.4117647, 1,
-0.2664247, -1.209095, -2.488628, 0, 1, 0.4196078, 1,
-0.263253, 0.8540768, -1.887185, 0, 1, 0.4235294, 1,
-0.2602144, 0.2797264, -2.027932, 0, 1, 0.4313726, 1,
-0.2590903, 0.1270067, 0.08920966, 0, 1, 0.4352941, 1,
-0.2584564, -0.1158126, -3.027234, 0, 1, 0.4431373, 1,
-0.257552, -0.1227148, -1.948034, 0, 1, 0.4470588, 1,
-0.2563547, 0.443511, 0.9832063, 0, 1, 0.454902, 1,
-0.2552502, 0.01900495, -1.696284, 0, 1, 0.4588235, 1,
-0.2551811, -1.298646, -1.74733, 0, 1, 0.4666667, 1,
-0.2549143, -0.7228263, -3.167203, 0, 1, 0.4705882, 1,
-0.2534596, 1.391792, 1.408343, 0, 1, 0.4784314, 1,
-0.2532996, -1.177552, -1.910926, 0, 1, 0.4823529, 1,
-0.2460304, -1.09525, -3.309896, 0, 1, 0.4901961, 1,
-0.2430635, 1.504283, -2.190091, 0, 1, 0.4941176, 1,
-0.2412809, -1.287657, -4.593278, 0, 1, 0.5019608, 1,
-0.2363951, 0.9400186, -0.6844147, 0, 1, 0.509804, 1,
-0.2362552, 0.4211288, 0.2544395, 0, 1, 0.5137255, 1,
-0.2353507, -0.6255067, -3.023968, 0, 1, 0.5215687, 1,
-0.2348726, 1.202373, 1.840996, 0, 1, 0.5254902, 1,
-0.2333525, 1.459016, -0.2312706, 0, 1, 0.5333334, 1,
-0.2332527, -0.6033004, -3.041373, 0, 1, 0.5372549, 1,
-0.2245089, -1.524835, -3.573481, 0, 1, 0.5450981, 1,
-0.2203332, -0.2892221, -1.906854, 0, 1, 0.5490196, 1,
-0.21873, -0.5020831, -2.31048, 0, 1, 0.5568628, 1,
-0.2173627, -0.05094483, -0.3509268, 0, 1, 0.5607843, 1,
-0.2159096, 1.122875, -0.1633273, 0, 1, 0.5686275, 1,
-0.2154707, -1.164834, -3.229002, 0, 1, 0.572549, 1,
-0.2142775, 0.4259118, -0.4771158, 0, 1, 0.5803922, 1,
-0.2138782, 0.5165899, 0.3357958, 0, 1, 0.5843138, 1,
-0.2125123, -0.5998515, -2.756572, 0, 1, 0.5921569, 1,
-0.2122215, 0.8486263, -0.1505368, 0, 1, 0.5960785, 1,
-0.2117123, 1.61511, -1.265498, 0, 1, 0.6039216, 1,
-0.2106456, -0.2616405, -3.042101, 0, 1, 0.6117647, 1,
-0.2045533, -1.156497, -3.281924, 0, 1, 0.6156863, 1,
-0.2005761, 0.3118971, -1.624321, 0, 1, 0.6235294, 1,
-0.1984593, 1.124259, 0.03967652, 0, 1, 0.627451, 1,
-0.1984583, -0.8462882, -1.476933, 0, 1, 0.6352941, 1,
-0.1972132, -0.1872198, -0.4908686, 0, 1, 0.6392157, 1,
-0.1955263, -1.086238, -2.722455, 0, 1, 0.6470588, 1,
-0.1930986, -0.8033562, -4.366116, 0, 1, 0.6509804, 1,
-0.1805443, 0.276223, -1.567745, 0, 1, 0.6588235, 1,
-0.1796571, -0.2528782, -3.334474, 0, 1, 0.6627451, 1,
-0.1740536, 0.6403447, 1.106005, 0, 1, 0.6705883, 1,
-0.1729317, -0.6892537, -2.63203, 0, 1, 0.6745098, 1,
-0.1723234, 0.5436442, -0.9684015, 0, 1, 0.682353, 1,
-0.171922, -0.3951049, -2.266838, 0, 1, 0.6862745, 1,
-0.171174, -0.9449172, -2.203402, 0, 1, 0.6941177, 1,
-0.1710561, -1.63957, -2.934536, 0, 1, 0.7019608, 1,
-0.169282, 0.3782998, -0.4319266, 0, 1, 0.7058824, 1,
-0.1647203, 0.704789, -0.8540865, 0, 1, 0.7137255, 1,
-0.1614577, 0.2987189, -1.67004, 0, 1, 0.7176471, 1,
-0.1538069, 0.602172, -0.5083075, 0, 1, 0.7254902, 1,
-0.1515355, -0.3573751, -3.238208, 0, 1, 0.7294118, 1,
-0.1495, -0.5990223, -1.395435, 0, 1, 0.7372549, 1,
-0.1491775, -0.7720164, -2.339499, 0, 1, 0.7411765, 1,
-0.148892, -0.3370635, -2.056682, 0, 1, 0.7490196, 1,
-0.1482337, -0.08911489, -2.758113, 0, 1, 0.7529412, 1,
-0.1421766, 0.1882803, 0.4242, 0, 1, 0.7607843, 1,
-0.1378606, 1.657879, 1.622716, 0, 1, 0.7647059, 1,
-0.1299255, -0.1201652, -2.98504, 0, 1, 0.772549, 1,
-0.1291019, -0.04945046, -1.939162, 0, 1, 0.7764706, 1,
-0.1265027, 0.0009909148, -0.168243, 0, 1, 0.7843137, 1,
-0.1253497, 0.6603189, -0.7449217, 0, 1, 0.7882353, 1,
-0.1231678, 0.3295868, 0.5608463, 0, 1, 0.7960784, 1,
-0.122179, 0.7052252, -0.828308, 0, 1, 0.8039216, 1,
-0.1189194, 0.7736086, -3.045583, 0, 1, 0.8078431, 1,
-0.1176932, -0.642388, -3.205144, 0, 1, 0.8156863, 1,
-0.1175392, 0.2184994, 0.712782, 0, 1, 0.8196079, 1,
-0.115525, -1.368055, -1.454026, 0, 1, 0.827451, 1,
-0.1152674, 0.792448, -0.4210795, 0, 1, 0.8313726, 1,
-0.1152508, -1.619185, -3.574358, 0, 1, 0.8392157, 1,
-0.1144096, -0.7292196, -2.941275, 0, 1, 0.8431373, 1,
-0.1141647, 0.46989, 1.273197, 0, 1, 0.8509804, 1,
-0.1031895, -0.8449439, -2.618464, 0, 1, 0.854902, 1,
-0.1001251, -1.523118, -3.891651, 0, 1, 0.8627451, 1,
-0.09763739, 0.5166371, -0.5438384, 0, 1, 0.8666667, 1,
-0.09322424, -0.1475789, -1.853726, 0, 1, 0.8745098, 1,
-0.09289046, 1.282441, 1.742589, 0, 1, 0.8784314, 1,
-0.09251489, 0.4073141, 0.5716046, 0, 1, 0.8862745, 1,
-0.09003381, 1.065733, -2.006255, 0, 1, 0.8901961, 1,
-0.08986047, -0.3258655, -2.921169, 0, 1, 0.8980392, 1,
-0.08345209, -0.1322154, -2.470471, 0, 1, 0.9058824, 1,
-0.08078288, 0.4395017, -0.3311028, 0, 1, 0.9098039, 1,
-0.08020873, 0.6133733, 0.8700987, 0, 1, 0.9176471, 1,
-0.07905284, -0.6356029, -4.030006, 0, 1, 0.9215686, 1,
-0.07544252, 0.9830313, -0.2629829, 0, 1, 0.9294118, 1,
-0.07497159, -0.4901087, -3.395589, 0, 1, 0.9333333, 1,
-0.05483038, 0.8111143, 0.4813544, 0, 1, 0.9411765, 1,
-0.0459817, -0.9660605, -3.696115, 0, 1, 0.945098, 1,
-0.04554427, 0.09119178, 0.1522545, 0, 1, 0.9529412, 1,
-0.04347358, -0.4220539, -2.664508, 0, 1, 0.9568627, 1,
-0.04015897, -0.2552104, -4.4457, 0, 1, 0.9647059, 1,
-0.03918421, 0.913509, -1.162102, 0, 1, 0.9686275, 1,
-0.03463766, 1.026213, 0.5422608, 0, 1, 0.9764706, 1,
-0.03422951, -0.2749958, -3.183367, 0, 1, 0.9803922, 1,
-0.03101663, -0.5576963, -2.06898, 0, 1, 0.9882353, 1,
-0.02988076, -0.7582041, -2.681497, 0, 1, 0.9921569, 1,
-0.0280927, 0.9351903, 0.46368, 0, 1, 1, 1,
-0.02585142, 0.4228897, -0.1515477, 0, 0.9921569, 1, 1,
-0.02316979, 1.102577, 0.086381, 0, 0.9882353, 1, 1,
-0.0225779, 1.016549, 0.0520036, 0, 0.9803922, 1, 1,
-0.02235185, 1.069548, 0.2788778, 0, 0.9764706, 1, 1,
-0.01693649, 0.400308, 1.302516, 0, 0.9686275, 1, 1,
-0.01478685, -0.1521698, -1.876513, 0, 0.9647059, 1, 1,
-0.01416235, 0.3135746, -1.426654, 0, 0.9568627, 1, 1,
-0.01240019, 2.624374, 0.9339382, 0, 0.9529412, 1, 1,
-0.01239853, -2.369545, -3.788775, 0, 0.945098, 1, 1,
-0.01232617, -0.8837684, -3.373494, 0, 0.9411765, 1, 1,
-0.01174288, -0.4686629, -1.434892, 0, 0.9333333, 1, 1,
-0.01118372, 1.081848, 0.3050841, 0, 0.9294118, 1, 1,
-0.009853617, -0.6081832, -3.400846, 0, 0.9215686, 1, 1,
-0.00928959, -0.5677079, -3.327597, 0, 0.9176471, 1, 1,
-0.0003344558, 0.2765993, -0.9447903, 0, 0.9098039, 1, 1,
-0.0002895745, 1.423763, -0.6530432, 0, 0.9058824, 1, 1,
0.00700237, 0.6728408, 1.355565, 0, 0.8980392, 1, 1,
0.007200938, 0.2996399, 1.485022, 0, 0.8901961, 1, 1,
0.01543988, 0.3488934, -2.123698, 0, 0.8862745, 1, 1,
0.01706694, 0.8094871, 1.04118, 0, 0.8784314, 1, 1,
0.02214738, -0.8585424, 4.94027, 0, 0.8745098, 1, 1,
0.02574203, -1.367094, 4.633174, 0, 0.8666667, 1, 1,
0.02590044, 1.683338, 0.9508804, 0, 0.8627451, 1, 1,
0.02822001, 1.640508, 0.6641166, 0, 0.854902, 1, 1,
0.03063868, -1.231857, 4.836765, 0, 0.8509804, 1, 1,
0.0320307, 1.5948, -0.8239418, 0, 0.8431373, 1, 1,
0.03845137, -0.317799, 2.421003, 0, 0.8392157, 1, 1,
0.04053776, 0.6080549, 0.2811648, 0, 0.8313726, 1, 1,
0.04200738, 0.7718376, 0.3842277, 0, 0.827451, 1, 1,
0.04397374, 0.0118841, 2.36093, 0, 0.8196079, 1, 1,
0.04732367, 0.6987236, 0.2096032, 0, 0.8156863, 1, 1,
0.04860753, -1.063666, 3.050228, 0, 0.8078431, 1, 1,
0.04872672, 0.8093996, 0.9809455, 0, 0.8039216, 1, 1,
0.0493536, 0.552516, 0.3948284, 0, 0.7960784, 1, 1,
0.04974047, 1.487081, 3.657556, 0, 0.7882353, 1, 1,
0.05402264, 0.06321519, 1.861275, 0, 0.7843137, 1, 1,
0.05608374, -0.8885619, 3.364287, 0, 0.7764706, 1, 1,
0.0568145, -0.4518333, 3.573605, 0, 0.772549, 1, 1,
0.05728743, -1.304055, 1.733884, 0, 0.7647059, 1, 1,
0.06058687, 0.1155729, 1.265177, 0, 0.7607843, 1, 1,
0.06246745, -0.5662338, 3.027201, 0, 0.7529412, 1, 1,
0.06427287, 1.630625, -0.04249728, 0, 0.7490196, 1, 1,
0.06570376, -0.07470651, 2.463466, 0, 0.7411765, 1, 1,
0.08024511, 0.8738133, 0.2324179, 0, 0.7372549, 1, 1,
0.08380685, -1.949501, 3.603092, 0, 0.7294118, 1, 1,
0.08522969, 0.469102, -0.5020119, 0, 0.7254902, 1, 1,
0.08721942, 0.3272611, 0.1252133, 0, 0.7176471, 1, 1,
0.08985379, 0.2029194, 1.621263, 0, 0.7137255, 1, 1,
0.09109031, -0.297963, 2.327225, 0, 0.7058824, 1, 1,
0.09130089, -0.5423468, 2.957052, 0, 0.6980392, 1, 1,
0.0918681, 0.8725396, -1.222412, 0, 0.6941177, 1, 1,
0.09284605, -0.383561, 2.77551, 0, 0.6862745, 1, 1,
0.1009113, -1.073542, 4.299974, 0, 0.682353, 1, 1,
0.1017429, -1.533857, 3.181615, 0, 0.6745098, 1, 1,
0.108592, -1.117281, 3.328761, 0, 0.6705883, 1, 1,
0.1101377, -0.1283576, 1.560742, 0, 0.6627451, 1, 1,
0.1115928, -0.4269179, 3.682229, 0, 0.6588235, 1, 1,
0.1151969, 0.149567, 0.2050441, 0, 0.6509804, 1, 1,
0.1158075, -0.603526, 2.820471, 0, 0.6470588, 1, 1,
0.1184384, 1.204163, 0.9760098, 0, 0.6392157, 1, 1,
0.1200887, 0.05276862, 1.177592, 0, 0.6352941, 1, 1,
0.1210169, -0.611164, 3.69364, 0, 0.627451, 1, 1,
0.12138, 0.4627122, 1.624539, 0, 0.6235294, 1, 1,
0.121516, -0.2460938, 1.81442, 0, 0.6156863, 1, 1,
0.1220135, 0.6566116, 1.712269, 0, 0.6117647, 1, 1,
0.1220244, -0.1807832, 2.098948, 0, 0.6039216, 1, 1,
0.1240383, -1.760873, 3.274526, 0, 0.5960785, 1, 1,
0.126843, 1.683665, -0.5041175, 0, 0.5921569, 1, 1,
0.1302944, -0.06512287, 1.026048, 0, 0.5843138, 1, 1,
0.1319168, 0.9621345, 0.3117128, 0, 0.5803922, 1, 1,
0.1345374, -2.04748, 4.09866, 0, 0.572549, 1, 1,
0.1368914, -0.9749684, 1.858059, 0, 0.5686275, 1, 1,
0.1375973, -1.700917, 2.561341, 0, 0.5607843, 1, 1,
0.1386787, -0.8847412, 3.607999, 0, 0.5568628, 1, 1,
0.1411989, -0.5797382, 4.493252, 0, 0.5490196, 1, 1,
0.1480976, -1.475467, 3.590136, 0, 0.5450981, 1, 1,
0.1513394, -0.8766084, 1.47815, 0, 0.5372549, 1, 1,
0.1527039, -0.9869944, 3.186069, 0, 0.5333334, 1, 1,
0.156199, 0.7357723, 0.5977755, 0, 0.5254902, 1, 1,
0.1611133, -0.7772802, 2.602219, 0, 0.5215687, 1, 1,
0.1615934, 1.347744, 0.7232583, 0, 0.5137255, 1, 1,
0.165641, -0.317173, 2.37992, 0, 0.509804, 1, 1,
0.1663722, -2.160473, 2.643994, 0, 0.5019608, 1, 1,
0.1675516, 0.3106361, 0.4880147, 0, 0.4941176, 1, 1,
0.1689818, -0.84801, 4.287232, 0, 0.4901961, 1, 1,
0.170937, -1.441116, 4.308818, 0, 0.4823529, 1, 1,
0.1717041, -0.7985332, 1.901352, 0, 0.4784314, 1, 1,
0.1792258, -0.006481412, 1.717387, 0, 0.4705882, 1, 1,
0.1831005, -0.6359518, 2.256676, 0, 0.4666667, 1, 1,
0.1851517, 2.003251, -0.3549066, 0, 0.4588235, 1, 1,
0.1942889, 0.6375933, -0.6214731, 0, 0.454902, 1, 1,
0.1960189, -0.5339695, 2.563402, 0, 0.4470588, 1, 1,
0.2075834, 0.8121431, -1.939511, 0, 0.4431373, 1, 1,
0.2093519, 0.5123726, -0.1130226, 0, 0.4352941, 1, 1,
0.2124386, 1.490801, -1.588442, 0, 0.4313726, 1, 1,
0.2147081, 0.5966573, -0.1479033, 0, 0.4235294, 1, 1,
0.2189628, -1.294323, 1.337164, 0, 0.4196078, 1, 1,
0.2210071, 0.4291799, 1.265468, 0, 0.4117647, 1, 1,
0.2216878, 0.9729172, -0.4941076, 0, 0.4078431, 1, 1,
0.2218111, -0.5238375, 3.164826, 0, 0.4, 1, 1,
0.2258045, -0.674242, 1.477092, 0, 0.3921569, 1, 1,
0.2270877, 0.3230644, 0.398711, 0, 0.3882353, 1, 1,
0.2274641, 0.1795176, 0.1671448, 0, 0.3803922, 1, 1,
0.229242, -0.2455363, 1.853672, 0, 0.3764706, 1, 1,
0.2329258, -0.5018255, 2.890839, 0, 0.3686275, 1, 1,
0.2342706, -1.561502, 3.102878, 0, 0.3647059, 1, 1,
0.2382082, -0.9499654, 3.555703, 0, 0.3568628, 1, 1,
0.2412363, 0.06014908, 1.396931, 0, 0.3529412, 1, 1,
0.2417166, -0.6211885, 3.355209, 0, 0.345098, 1, 1,
0.2536625, 0.3869563, -1.060577, 0, 0.3411765, 1, 1,
0.2540254, -0.4255808, 2.846039, 0, 0.3333333, 1, 1,
0.2551657, -1.924834, 1.899084, 0, 0.3294118, 1, 1,
0.2556435, 1.301337, 1.567744, 0, 0.3215686, 1, 1,
0.2599751, 0.2705384, 0.5759174, 0, 0.3176471, 1, 1,
0.2603385, -0.8545997, 3.864551, 0, 0.3098039, 1, 1,
0.2626126, -1.480954, 4.183956, 0, 0.3058824, 1, 1,
0.2675813, -0.8721086, 1.707807, 0, 0.2980392, 1, 1,
0.2676831, -0.5238674, 4.160903, 0, 0.2901961, 1, 1,
0.270701, -0.0147265, 1.955317, 0, 0.2862745, 1, 1,
0.2708718, 0.9114922, 2.351676, 0, 0.2784314, 1, 1,
0.2708788, 1.039536, 0.1761303, 0, 0.2745098, 1, 1,
0.2755317, 0.6322386, 0.001827357, 0, 0.2666667, 1, 1,
0.276372, 0.8502883, 2.141365, 0, 0.2627451, 1, 1,
0.2800741, 0.1464936, 1.929337, 0, 0.254902, 1, 1,
0.2834346, -1.327576, 2.09805, 0, 0.2509804, 1, 1,
0.2839798, 2.200936, 1.678297, 0, 0.2431373, 1, 1,
0.2928439, -1.719213, 1.300299, 0, 0.2392157, 1, 1,
0.2935188, -0.8989446, 2.203399, 0, 0.2313726, 1, 1,
0.294084, -0.6494429, 2.316664, 0, 0.227451, 1, 1,
0.3000407, -0.130345, 3.689432, 0, 0.2196078, 1, 1,
0.3052356, 0.4581204, 1.529633, 0, 0.2156863, 1, 1,
0.3053156, 0.4647667, 1.796774, 0, 0.2078431, 1, 1,
0.3093724, -1.164675, 4.637245, 0, 0.2039216, 1, 1,
0.316869, 1.431665, 0.2222096, 0, 0.1960784, 1, 1,
0.3170387, 0.624105, 0.8761116, 0, 0.1882353, 1, 1,
0.3185073, 0.4985736, -1.649377, 0, 0.1843137, 1, 1,
0.3208596, 0.7491846, 1.130038, 0, 0.1764706, 1, 1,
0.3213209, -1.426927, 3.363503, 0, 0.172549, 1, 1,
0.32455, -0.1089253, 1.926405, 0, 0.1647059, 1, 1,
0.3302798, -0.6607541, 3.085706, 0, 0.1607843, 1, 1,
0.3318301, 0.9356349, -0.2181228, 0, 0.1529412, 1, 1,
0.3338703, 0.1114224, 2.85485, 0, 0.1490196, 1, 1,
0.3398775, 1.350346, -1.181731, 0, 0.1411765, 1, 1,
0.3401911, 0.1168473, 0.7327766, 0, 0.1372549, 1, 1,
0.3445117, -0.7283268, 4.275668, 0, 0.1294118, 1, 1,
0.3465109, 0.9234823, 1.400974, 0, 0.1254902, 1, 1,
0.3517053, 0.7286007, 2.303476, 0, 0.1176471, 1, 1,
0.3546696, 0.1470172, 1.348854, 0, 0.1137255, 1, 1,
0.3612325, 0.1979284, -0.1711503, 0, 0.1058824, 1, 1,
0.363128, -0.6237977, 1.458206, 0, 0.09803922, 1, 1,
0.3652541, -0.3001603, -0.151595, 0, 0.09411765, 1, 1,
0.3663602, -1.500187, 3.482039, 0, 0.08627451, 1, 1,
0.3692623, -0.6103861, 1.842141, 0, 0.08235294, 1, 1,
0.3693542, 0.7799276, 0.6203184, 0, 0.07450981, 1, 1,
0.3699305, -0.5784536, 1.23307, 0, 0.07058824, 1, 1,
0.3720602, 0.6179286, -0.1700686, 0, 0.0627451, 1, 1,
0.3770458, 1.265051, 1.831269, 0, 0.05882353, 1, 1,
0.3895064, 0.1629849, -0.5661777, 0, 0.05098039, 1, 1,
0.3897054, 1.206069, 1.721784, 0, 0.04705882, 1, 1,
0.3933634, -0.3530336, 3.213866, 0, 0.03921569, 1, 1,
0.397235, -0.6435684, 1.894305, 0, 0.03529412, 1, 1,
0.4014918, -0.2875864, 1.04405, 0, 0.02745098, 1, 1,
0.4032077, 0.4238441, 0.3559772, 0, 0.02352941, 1, 1,
0.4038644, -0.1832302, 3.714155, 0, 0.01568628, 1, 1,
0.4047508, 0.663345, -0.9223092, 0, 0.01176471, 1, 1,
0.4069581, 0.355624, 2.563767, 0, 0.003921569, 1, 1,
0.4083465, 0.1706507, 0.7479743, 0.003921569, 0, 1, 1,
0.4101359, -0.906752, 2.231441, 0.007843138, 0, 1, 1,
0.4112459, 0.01684184, 1.563675, 0.01568628, 0, 1, 1,
0.4171972, 0.2300729, 0.08814709, 0.01960784, 0, 1, 1,
0.4176991, 0.985755, 0.5325095, 0.02745098, 0, 1, 1,
0.419435, 0.1780171, 0.370039, 0.03137255, 0, 1, 1,
0.4298989, 0.6552109, 1.220139, 0.03921569, 0, 1, 1,
0.432742, 1.374851, -2.122894, 0.04313726, 0, 1, 1,
0.4349837, -0.3650708, 2.154415, 0.05098039, 0, 1, 1,
0.4390553, -0.04640926, 1.458201, 0.05490196, 0, 1, 1,
0.4406772, 1.013845, 1.32732, 0.0627451, 0, 1, 1,
0.4425423, -0.3560249, 2.41494, 0.06666667, 0, 1, 1,
0.455416, 1.862958, -0.4212463, 0.07450981, 0, 1, 1,
0.4655752, -1.413498, 2.756249, 0.07843138, 0, 1, 1,
0.4711911, 0.9650235, 0.8198211, 0.08627451, 0, 1, 1,
0.4743285, -1.025673, 2.278624, 0.09019608, 0, 1, 1,
0.4768093, 0.4067584, 1.91188, 0.09803922, 0, 1, 1,
0.4880346, 1.230243, 0.6808068, 0.1058824, 0, 1, 1,
0.4888205, 0.4103427, 3.060192, 0.1098039, 0, 1, 1,
0.4916987, -1.191782, 3.147777, 0.1176471, 0, 1, 1,
0.495011, 0.9466072, 2.529896, 0.1215686, 0, 1, 1,
0.496354, -0.9940785, 3.922962, 0.1294118, 0, 1, 1,
0.5040159, 0.7800038, -0.4113731, 0.1333333, 0, 1, 1,
0.5054093, -0.116905, 1.78992, 0.1411765, 0, 1, 1,
0.5063382, -0.189884, 3.926443, 0.145098, 0, 1, 1,
0.5096593, -0.6415768, 2.580177, 0.1529412, 0, 1, 1,
0.5135311, 0.4343935, 3.165648, 0.1568628, 0, 1, 1,
0.514498, 0.5567282, -0.7511998, 0.1647059, 0, 1, 1,
0.5178302, -0.9272284, 1.271988, 0.1686275, 0, 1, 1,
0.5189809, 1.002566, 0.5398678, 0.1764706, 0, 1, 1,
0.5209494, 0.9285844, -0.3898363, 0.1803922, 0, 1, 1,
0.5213137, -1.300334, 3.513466, 0.1882353, 0, 1, 1,
0.52689, 0.2227357, 1.653884, 0.1921569, 0, 1, 1,
0.5280955, -0.9555246, 1.869063, 0.2, 0, 1, 1,
0.5293776, -1.145231, 2.340089, 0.2078431, 0, 1, 1,
0.5320328, -1.416473, 4.165704, 0.2117647, 0, 1, 1,
0.5326481, 0.2022081, 1.509355, 0.2196078, 0, 1, 1,
0.5336303, -0.6107928, 1.307486, 0.2235294, 0, 1, 1,
0.5389037, -1.160829, 1.461028, 0.2313726, 0, 1, 1,
0.5389259, -0.6230507, 2.041064, 0.2352941, 0, 1, 1,
0.539078, -0.5462035, 2.441888, 0.2431373, 0, 1, 1,
0.5622166, -1.439163, 2.764925, 0.2470588, 0, 1, 1,
0.5733819, 0.1871449, 0.1861659, 0.254902, 0, 1, 1,
0.5787985, -1.465949, 3.742084, 0.2588235, 0, 1, 1,
0.5795982, 1.159606, 0.5819063, 0.2666667, 0, 1, 1,
0.5836402, 0.4507188, 2.343861, 0.2705882, 0, 1, 1,
0.5838058, 1.123169, -0.1075822, 0.2784314, 0, 1, 1,
0.5871234, -0.0517956, 0.9754854, 0.282353, 0, 1, 1,
0.591911, -0.4140381, 3.115779, 0.2901961, 0, 1, 1,
0.5936708, -1.120492, 2.846487, 0.2941177, 0, 1, 1,
0.594654, -2.008298, 2.303114, 0.3019608, 0, 1, 1,
0.598296, -0.2276521, 1.845717, 0.3098039, 0, 1, 1,
0.6009082, 0.3601473, 1.853463, 0.3137255, 0, 1, 1,
0.6029156, 1.659119, 1.151391, 0.3215686, 0, 1, 1,
0.6042148, -0.3916267, 1.895387, 0.3254902, 0, 1, 1,
0.6070744, 0.7835147, 1.104966, 0.3333333, 0, 1, 1,
0.6090861, 1.098895, -0.143903, 0.3372549, 0, 1, 1,
0.6093423, 0.6436452, 0.3776348, 0.345098, 0, 1, 1,
0.6119668, -0.003434121, 2.496557, 0.3490196, 0, 1, 1,
0.6128001, -1.049454, 2.500866, 0.3568628, 0, 1, 1,
0.6204315, 0.9351888, 1.102325, 0.3607843, 0, 1, 1,
0.6219755, 0.9569846, 0.7124422, 0.3686275, 0, 1, 1,
0.6237228, -0.562118, 2.298001, 0.372549, 0, 1, 1,
0.6254593, -1.546068, 1.556334, 0.3803922, 0, 1, 1,
0.6256272, 0.1561104, 1.982098, 0.3843137, 0, 1, 1,
0.6345654, 0.9987693, 0.5136811, 0.3921569, 0, 1, 1,
0.6552388, -0.1111996, 2.801896, 0.3960784, 0, 1, 1,
0.6557385, -0.7095939, 4.147716, 0.4039216, 0, 1, 1,
0.6595216, -0.008469616, 1.128895, 0.4117647, 0, 1, 1,
0.6623263, 0.1996588, 0.6211698, 0.4156863, 0, 1, 1,
0.6912862, -0.907127, 1.86784, 0.4235294, 0, 1, 1,
0.6915636, 0.3695579, 0.476437, 0.427451, 0, 1, 1,
0.6943962, 0.6299037, 2.169955, 0.4352941, 0, 1, 1,
0.6965733, -1.385437, 3.323972, 0.4392157, 0, 1, 1,
0.6979647, -1.256732, 2.318896, 0.4470588, 0, 1, 1,
0.7011726, -0.5785472, 2.061559, 0.4509804, 0, 1, 1,
0.7016507, -0.7264752, 1.751938, 0.4588235, 0, 1, 1,
0.7189611, 1.595877, 0.9907301, 0.4627451, 0, 1, 1,
0.7196888, 1.529919, -0.1045291, 0.4705882, 0, 1, 1,
0.7200702, 0.1099321, 0.8177909, 0.4745098, 0, 1, 1,
0.7208714, -1.659986, 3.70229, 0.4823529, 0, 1, 1,
0.722546, -0.6379349, 4.282331, 0.4862745, 0, 1, 1,
0.7233724, 0.7423521, 1.34164, 0.4941176, 0, 1, 1,
0.7249707, 0.9151391, 0.907755, 0.5019608, 0, 1, 1,
0.7265958, -1.747315, 4.431674, 0.5058824, 0, 1, 1,
0.7266192, 1.060091, 0.8758514, 0.5137255, 0, 1, 1,
0.7279327, -0.08675204, 2.317397, 0.5176471, 0, 1, 1,
0.7341022, 0.7384951, 0.4607082, 0.5254902, 0, 1, 1,
0.7362437, 0.0917066, 1.285395, 0.5294118, 0, 1, 1,
0.7400671, -0.154904, 1.054348, 0.5372549, 0, 1, 1,
0.7445157, -0.7827336, 2.576587, 0.5411765, 0, 1, 1,
0.7499841, 0.05271719, 0.4443129, 0.5490196, 0, 1, 1,
0.7531827, -0.3060692, 2.112215, 0.5529412, 0, 1, 1,
0.7546006, -0.9296576, 2.457847, 0.5607843, 0, 1, 1,
0.7551199, -0.5306662, 2.273955, 0.5647059, 0, 1, 1,
0.7656924, -0.7821025, 1.623967, 0.572549, 0, 1, 1,
0.7664981, -0.2066181, 3.046095, 0.5764706, 0, 1, 1,
0.7741121, 0.1399223, 0.8489195, 0.5843138, 0, 1, 1,
0.7749717, -1.18222, 3.763416, 0.5882353, 0, 1, 1,
0.7832341, -0.4326886, 2.338689, 0.5960785, 0, 1, 1,
0.7834514, 1.635717, 1.102526, 0.6039216, 0, 1, 1,
0.7857723, 1.117589, -1.073447, 0.6078432, 0, 1, 1,
0.7890583, 2.002023, -1.738202, 0.6156863, 0, 1, 1,
0.7903025, 1.04427, -0.7174082, 0.6196079, 0, 1, 1,
0.7936755, 0.3587736, 2.758173, 0.627451, 0, 1, 1,
0.7943743, -0.3116961, 2.637649, 0.6313726, 0, 1, 1,
0.8022605, 0.9328832, 0.8566359, 0.6392157, 0, 1, 1,
0.802768, -0.8632753, 2.779119, 0.6431373, 0, 1, 1,
0.8133903, -0.2878985, 2.832311, 0.6509804, 0, 1, 1,
0.8144187, 0.7501667, 1.63746, 0.654902, 0, 1, 1,
0.8194045, -0.546594, 2.367384, 0.6627451, 0, 1, 1,
0.8199027, 0.3573806, 1.652972, 0.6666667, 0, 1, 1,
0.8208607, -0.6623548, 1.449414, 0.6745098, 0, 1, 1,
0.8315399, -1.126417, 2.390568, 0.6784314, 0, 1, 1,
0.8333342, 1.803325, -0.3404597, 0.6862745, 0, 1, 1,
0.8417934, -0.2168177, 1.570685, 0.6901961, 0, 1, 1,
0.843863, -0.8874999, -0.8126343, 0.6980392, 0, 1, 1,
0.8466363, -2.645005, 4.235211, 0.7058824, 0, 1, 1,
0.8474247, 0.3241726, 1.936628, 0.7098039, 0, 1, 1,
0.8511954, -0.0764799, 2.055407, 0.7176471, 0, 1, 1,
0.8634113, 1.32042, 0.3498415, 0.7215686, 0, 1, 1,
0.8636006, -1.020476, 1.761164, 0.7294118, 0, 1, 1,
0.8718554, -1.426255, 3.790885, 0.7333333, 0, 1, 1,
0.8744599, -0.6179706, 1.105713, 0.7411765, 0, 1, 1,
0.8747147, 1.072946, 1.598989, 0.7450981, 0, 1, 1,
0.8747858, 1.726605, -0.2310803, 0.7529412, 0, 1, 1,
0.8772655, -1.31782, 3.801593, 0.7568628, 0, 1, 1,
0.8829719, -1.036215, 1.660475, 0.7647059, 0, 1, 1,
0.8843827, 0.2808136, 0.5900371, 0.7686275, 0, 1, 1,
0.8945594, 1.504112, 0.5128235, 0.7764706, 0, 1, 1,
0.8952325, -0.8669469, 3.325145, 0.7803922, 0, 1, 1,
0.895753, 0.7781582, 0.7317821, 0.7882353, 0, 1, 1,
0.8962021, 0.451655, 1.3517, 0.7921569, 0, 1, 1,
0.8974965, -0.9570793, 0.9467019, 0.8, 0, 1, 1,
0.8977877, -0.538473, 1.550584, 0.8078431, 0, 1, 1,
0.8995504, 2.163687, 0.8844618, 0.8117647, 0, 1, 1,
0.9082853, 0.5540118, -0.2603234, 0.8196079, 0, 1, 1,
0.9083664, 1.910887, 1.110294, 0.8235294, 0, 1, 1,
0.9115826, 1.769571, 1.834528, 0.8313726, 0, 1, 1,
0.9119263, -0.3283255, 4.006162, 0.8352941, 0, 1, 1,
0.9132625, 1.51171, 0.8035686, 0.8431373, 0, 1, 1,
0.9200304, -0.5424985, 0.09731169, 0.8470588, 0, 1, 1,
0.9234207, 0.4249272, 1.849686, 0.854902, 0, 1, 1,
0.9296916, -1.660991, 1.495669, 0.8588235, 0, 1, 1,
0.9326652, 1.268069, 1.566888, 0.8666667, 0, 1, 1,
0.9342718, -0.5720354, 0.802523, 0.8705882, 0, 1, 1,
0.9411828, 0.2443732, 2.17176, 0.8784314, 0, 1, 1,
0.9417996, -0.2289099, -0.3977093, 0.8823529, 0, 1, 1,
0.9424263, -0.1754811, 2.991274, 0.8901961, 0, 1, 1,
0.9424919, 0.04057426, 2.999954, 0.8941177, 0, 1, 1,
0.9471763, -1.179502, 0.4635198, 0.9019608, 0, 1, 1,
0.9474112, -0.9623559, 2.444186, 0.9098039, 0, 1, 1,
0.9503982, -0.906513, 0.1430224, 0.9137255, 0, 1, 1,
0.9649807, -0.3674966, 2.734617, 0.9215686, 0, 1, 1,
0.9757835, 0.062543, 1.545934, 0.9254902, 0, 1, 1,
0.9771941, -0.08445604, -0.1490245, 0.9333333, 0, 1, 1,
0.9788206, 0.5118904, 1.700074, 0.9372549, 0, 1, 1,
0.9790294, 0.5083915, 1.807701, 0.945098, 0, 1, 1,
0.9831476, -1.423659, 2.435495, 0.9490196, 0, 1, 1,
0.9921293, 1.518335, 0.3000205, 0.9568627, 0, 1, 1,
0.9939699, -1.677426, 3.513936, 0.9607843, 0, 1, 1,
0.9949325, 1.399935, -0.3224113, 0.9686275, 0, 1, 1,
0.9957417, -1.222851, 1.810079, 0.972549, 0, 1, 1,
0.9977114, 1.117743, -0.04793961, 0.9803922, 0, 1, 1,
1.001055, -0.1557356, 0.3931813, 0.9843137, 0, 1, 1,
1.003142, -0.03877081, 1.381775, 0.9921569, 0, 1, 1,
1.006607, 0.5471125, 0.9328015, 0.9960784, 0, 1, 1,
1.007901, -2.700002, 3.339581, 1, 0, 0.9960784, 1,
1.016319, -1.02395, 2.900256, 1, 0, 0.9882353, 1,
1.020491, -0.2646228, -0.1189936, 1, 0, 0.9843137, 1,
1.025681, -0.4787733, 2.161847, 1, 0, 0.9764706, 1,
1.025711, -0.2719376, 1.27484, 1, 0, 0.972549, 1,
1.045093, -1.510896, 1.866253, 1, 0, 0.9647059, 1,
1.046283, -1.06537, 3.524433, 1, 0, 0.9607843, 1,
1.047461, -0.1157294, 5.383265, 1, 0, 0.9529412, 1,
1.047594, 0.6168739, -1.025404, 1, 0, 0.9490196, 1,
1.048891, -0.4796849, 1.215824, 1, 0, 0.9411765, 1,
1.051564, -0.8975397, 3.877614, 1, 0, 0.9372549, 1,
1.05691, -0.145389, 3.940131, 1, 0, 0.9294118, 1,
1.05837, 0.4243006, -0.8062621, 1, 0, 0.9254902, 1,
1.062826, -0.3201681, 2.208879, 1, 0, 0.9176471, 1,
1.064133, -0.7898254, 2.712451, 1, 0, 0.9137255, 1,
1.067061, 0.8033067, 0.3723152, 1, 0, 0.9058824, 1,
1.068349, 0.3396758, 0.9195357, 1, 0, 0.9019608, 1,
1.068945, -2.907581, 3.531273, 1, 0, 0.8941177, 1,
1.072797, 0.004796276, 2.664706, 1, 0, 0.8862745, 1,
1.07324, -0.6553862, 2.472194, 1, 0, 0.8823529, 1,
1.07342, 2.426454, -0.5635709, 1, 0, 0.8745098, 1,
1.08134, -0.04550831, 0.9837674, 1, 0, 0.8705882, 1,
1.08401, 1.890391, -0.1537434, 1, 0, 0.8627451, 1,
1.084823, -0.5525245, 1.00845, 1, 0, 0.8588235, 1,
1.091344, 0.7881889, 0.8359631, 1, 0, 0.8509804, 1,
1.091556, 1.58526, -1.30861, 1, 0, 0.8470588, 1,
1.093762, -0.189969, 0.752369, 1, 0, 0.8392157, 1,
1.099681, 0.06679608, 0.278796, 1, 0, 0.8352941, 1,
1.103038, 1.074323, 1.459347, 1, 0, 0.827451, 1,
1.103182, -1.396415, 2.266773, 1, 0, 0.8235294, 1,
1.10748, -2.517882, 1.350281, 1, 0, 0.8156863, 1,
1.110347, 1.358035, 1.205256, 1, 0, 0.8117647, 1,
1.111987, -0.625535, 0.5678092, 1, 0, 0.8039216, 1,
1.119028, 1.812876, -1.084644, 1, 0, 0.7960784, 1,
1.124338, -0.2950579, 2.169652, 1, 0, 0.7921569, 1,
1.127453, 0.6609556, 1.405971, 1, 0, 0.7843137, 1,
1.130336, 1.362129, 1.371867, 1, 0, 0.7803922, 1,
1.13389, 1.477573, 0.8534036, 1, 0, 0.772549, 1,
1.134694, 1.236016, 0.6560426, 1, 0, 0.7686275, 1,
1.136874, 2.458061, -0.09329812, 1, 0, 0.7607843, 1,
1.137878, 0.4213701, 1.975558, 1, 0, 0.7568628, 1,
1.141326, -1.858461, 2.272141, 1, 0, 0.7490196, 1,
1.143339, -0.2593509, 0.9405195, 1, 0, 0.7450981, 1,
1.155631, 1.111885, 1.303482, 1, 0, 0.7372549, 1,
1.160177, 0.9549615, 1.138665, 1, 0, 0.7333333, 1,
1.16173, -0.2213053, 0.6693547, 1, 0, 0.7254902, 1,
1.163106, 0.366514, 2.256866, 1, 0, 0.7215686, 1,
1.172803, 1.730024, 0.5624396, 1, 0, 0.7137255, 1,
1.172966, 1.2591, 1.0593, 1, 0, 0.7098039, 1,
1.189309, 1.62824, 1.37808, 1, 0, 0.7019608, 1,
1.189713, -0.4581115, 1.994894, 1, 0, 0.6941177, 1,
1.20154, -1.746464, 2.6934, 1, 0, 0.6901961, 1,
1.203216, 1.738463, 0.8263484, 1, 0, 0.682353, 1,
1.216774, -0.4572932, 3.032164, 1, 0, 0.6784314, 1,
1.222947, -0.06873536, 1.460221, 1, 0, 0.6705883, 1,
1.224118, 1.683363, 1.299922, 1, 0, 0.6666667, 1,
1.233737, -1.000476, 2.165153, 1, 0, 0.6588235, 1,
1.238526, 0.1064754, 1.078261, 1, 0, 0.654902, 1,
1.251514, 0.3651697, 1.162299, 1, 0, 0.6470588, 1,
1.271364, 0.1371867, 1.243521, 1, 0, 0.6431373, 1,
1.287441, -0.3205442, 1.458379, 1, 0, 0.6352941, 1,
1.300671, -0.3782071, 1.812154, 1, 0, 0.6313726, 1,
1.302385, 1.831369, -1.361735, 1, 0, 0.6235294, 1,
1.303526, 1.16725, 0.8202533, 1, 0, 0.6196079, 1,
1.307403, -0.4513425, 0.5754131, 1, 0, 0.6117647, 1,
1.311894, -0.5659392, 0.1212562, 1, 0, 0.6078432, 1,
1.322328, -0.6476595, 2.496131, 1, 0, 0.6, 1,
1.32702, -1.146165, 2.578006, 1, 0, 0.5921569, 1,
1.334684, 0.7392378, 0.4198182, 1, 0, 0.5882353, 1,
1.347234, 0.4547127, -0.1177587, 1, 0, 0.5803922, 1,
1.362756, 1.464112, 0.3957697, 1, 0, 0.5764706, 1,
1.363126, -0.6738317, 2.365141, 1, 0, 0.5686275, 1,
1.370801, 1.380595, 1.086832, 1, 0, 0.5647059, 1,
1.370887, 1.054646, -0.771365, 1, 0, 0.5568628, 1,
1.377405, 0.6043075, 0.3485943, 1, 0, 0.5529412, 1,
1.377548, -1.783405, 2.487604, 1, 0, 0.5450981, 1,
1.382209, -1.240205, 3.219782, 1, 0, 0.5411765, 1,
1.396093, 0.4660868, 1.159966, 1, 0, 0.5333334, 1,
1.399997, 0.1331608, 2.085362, 1, 0, 0.5294118, 1,
1.401246, -2.6499, 3.948298, 1, 0, 0.5215687, 1,
1.406038, -1.044999, 1.135735, 1, 0, 0.5176471, 1,
1.407332, -0.7336566, 2.090809, 1, 0, 0.509804, 1,
1.40817, 0.3192751, 2.283319, 1, 0, 0.5058824, 1,
1.41667, 0.8172409, 1.280681, 1, 0, 0.4980392, 1,
1.41692, 1.10919, 1.714484, 1, 0, 0.4901961, 1,
1.423365, -0.356237, 2.05366, 1, 0, 0.4862745, 1,
1.429353, 0.2959168, 2.600614, 1, 0, 0.4784314, 1,
1.444691, -0.04999144, 0.8338684, 1, 0, 0.4745098, 1,
1.451788, -0.1450616, 0.003102473, 1, 0, 0.4666667, 1,
1.454081, -0.4873304, 2.100657, 1, 0, 0.4627451, 1,
1.479705, -0.8580191, 1.541103, 1, 0, 0.454902, 1,
1.481214, 1.046508, 0.5591919, 1, 0, 0.4509804, 1,
1.501812, 0.4865261, 0.9341575, 1, 0, 0.4431373, 1,
1.505582, 0.3838228, 2.734794, 1, 0, 0.4392157, 1,
1.520644, -0.960108, 2.476948, 1, 0, 0.4313726, 1,
1.54888, 0.7129855, 0.9420461, 1, 0, 0.427451, 1,
1.553828, 0.4197285, -0.2236875, 1, 0, 0.4196078, 1,
1.561884, 1.104892, 1.212078, 1, 0, 0.4156863, 1,
1.564252, 1.640033, -2.398806, 1, 0, 0.4078431, 1,
1.58295, 0.7971969, 0.6151993, 1, 0, 0.4039216, 1,
1.583479, 0.3750835, 2.26875, 1, 0, 0.3960784, 1,
1.588316, 0.0878164, 1.533984, 1, 0, 0.3882353, 1,
1.597064, 0.6051298, 2.691326, 1, 0, 0.3843137, 1,
1.59952, -1.822421, 2.583581, 1, 0, 0.3764706, 1,
1.603134, 1.869064, -0.07716911, 1, 0, 0.372549, 1,
1.606192, -0.3788476, 2.198931, 1, 0, 0.3647059, 1,
1.606203, -1.127193, 2.004495, 1, 0, 0.3607843, 1,
1.608289, -0.2621225, 2.753301, 1, 0, 0.3529412, 1,
1.608341, -1.835434, 1.895644, 1, 0, 0.3490196, 1,
1.609889, 1.188851, 0.3196949, 1, 0, 0.3411765, 1,
1.611751, 0.2578455, 1.218444, 1, 0, 0.3372549, 1,
1.612855, 0.7093533, 0.8607641, 1, 0, 0.3294118, 1,
1.615364, -0.1683391, 0.1211689, 1, 0, 0.3254902, 1,
1.638315, 0.03948528, 2.514043, 1, 0, 0.3176471, 1,
1.698663, 0.02921464, 1.590841, 1, 0, 0.3137255, 1,
1.736243, 0.3977765, 2.721262, 1, 0, 0.3058824, 1,
1.741327, -1.183738, 0.3409316, 1, 0, 0.2980392, 1,
1.7441, -0.09055811, 3.486236, 1, 0, 0.2941177, 1,
1.747279, 0.0772457, 1.500777, 1, 0, 0.2862745, 1,
1.752638, -0.6536956, 1.338838, 1, 0, 0.282353, 1,
1.8132, -0.9142257, 2.434242, 1, 0, 0.2745098, 1,
1.82162, -0.3985689, 2.141814, 1, 0, 0.2705882, 1,
1.846427, 0.5959975, 0.6133849, 1, 0, 0.2627451, 1,
1.849385, -1.585796, 3.194258, 1, 0, 0.2588235, 1,
1.856939, -0.4892253, 2.897429, 1, 0, 0.2509804, 1,
1.865503, 1.801486, 1.992347, 1, 0, 0.2470588, 1,
1.881217, -1.233343, 1.337947, 1, 0, 0.2392157, 1,
1.909877, -1.293593, 2.853362, 1, 0, 0.2352941, 1,
1.929456, 0.3020422, 2.11632, 1, 0, 0.227451, 1,
1.943247, -1.077209, 1.198503, 1, 0, 0.2235294, 1,
1.950413, -1.714567, 1.626898, 1, 0, 0.2156863, 1,
1.974382, -0.129758, 1.782166, 1, 0, 0.2117647, 1,
1.97484, 0.3575579, 0.2620414, 1, 0, 0.2039216, 1,
1.985054, -0.6134742, 2.217961, 1, 0, 0.1960784, 1,
1.988991, -0.7989966, 1.395484, 1, 0, 0.1921569, 1,
2.023498, -1.018863, 2.089023, 1, 0, 0.1843137, 1,
2.024611, 1.460262, 0.7533274, 1, 0, 0.1803922, 1,
2.085357, 0.6268809, 1.875277, 1, 0, 0.172549, 1,
2.089076, -0.09858339, 2.152351, 1, 0, 0.1686275, 1,
2.09887, 0.8238062, 1.49475, 1, 0, 0.1607843, 1,
2.110842, -0.2820481, 1.737049, 1, 0, 0.1568628, 1,
2.122514, -0.9818424, 3.066356, 1, 0, 0.1490196, 1,
2.134604, -1.98202, 2.974951, 1, 0, 0.145098, 1,
2.141523, -1.157083, 3.449392, 1, 0, 0.1372549, 1,
2.142878, -1.215172, 2.22239, 1, 0, 0.1333333, 1,
2.16167, 0.6338998, 1.936428, 1, 0, 0.1254902, 1,
2.204616, 0.1170783, 2.141924, 1, 0, 0.1215686, 1,
2.210725, -0.04861853, 2.711483, 1, 0, 0.1137255, 1,
2.213291, -0.7822108, 2.113789, 1, 0, 0.1098039, 1,
2.249458, 0.3307471, 2.765133, 1, 0, 0.1019608, 1,
2.264989, -0.0498236, 1.547482, 1, 0, 0.09411765, 1,
2.270236, 0.347667, 2.66532, 1, 0, 0.09019608, 1,
2.284128, -0.2247407, 0.9498512, 1, 0, 0.08235294, 1,
2.348836, 1.841052, 1.563635, 1, 0, 0.07843138, 1,
2.383563, 0.4369076, -0.227701, 1, 0, 0.07058824, 1,
2.418641, 2.499886, 0.3926931, 1, 0, 0.06666667, 1,
2.456233, -0.7493401, 1.695469, 1, 0, 0.05882353, 1,
2.462632, 2.014439, 0.2636489, 1, 0, 0.05490196, 1,
2.490968, -0.06202928, 0.5884896, 1, 0, 0.04705882, 1,
2.693059, -0.3484758, 0.8767493, 1, 0, 0.04313726, 1,
2.719699, -0.1863425, 2.924077, 1, 0, 0.03529412, 1,
2.768241, 0.6474341, 2.457474, 1, 0, 0.03137255, 1,
2.804764, 1.480819, 1.125251, 1, 0, 0.02352941, 1,
3.014829, 0.6445029, 1.589403, 1, 0, 0.01960784, 1,
3.148972, -0.9178094, 3.436435, 1, 0, 0.01176471, 1,
3.189897, 0.744108, 0.6946542, 1, 0, 0.007843138, 1
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
-0.1824416, -3.931409, -6.284302, 0, -0.5, 0.5, 0.5,
-0.1824416, -3.931409, -6.284302, 1, -0.5, 0.5, 0.5,
-0.1824416, -3.931409, -6.284302, 1, 1.5, 0.5, 0.5,
-0.1824416, -3.931409, -6.284302, 0, 1.5, 0.5, 0.5
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
-4.698003, 0.1125615, -6.284302, 0, -0.5, 0.5, 0.5,
-4.698003, 0.1125615, -6.284302, 1, -0.5, 0.5, 0.5,
-4.698003, 0.1125615, -6.284302, 1, 1.5, 0.5, 0.5,
-4.698003, 0.1125615, -6.284302, 0, 1.5, 0.5, 0.5
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
-4.698003, -3.931409, 0.3949933, 0, -0.5, 0.5, 0.5,
-4.698003, -3.931409, 0.3949933, 1, -0.5, 0.5, 0.5,
-4.698003, -3.931409, 0.3949933, 1, 1.5, 0.5, 0.5,
-4.698003, -3.931409, 0.3949933, 0, 1.5, 0.5, 0.5
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
-3, -2.998185, -4.742926,
3, -2.998185, -4.742926,
-3, -2.998185, -4.742926,
-3, -3.153722, -4.999822,
-2, -2.998185, -4.742926,
-2, -3.153722, -4.999822,
-1, -2.998185, -4.742926,
-1, -3.153722, -4.999822,
0, -2.998185, -4.742926,
0, -3.153722, -4.999822,
1, -2.998185, -4.742926,
1, -3.153722, -4.999822,
2, -2.998185, -4.742926,
2, -3.153722, -4.999822,
3, -2.998185, -4.742926,
3, -3.153722, -4.999822
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
-3, -3.464797, -5.513614, 0, -0.5, 0.5, 0.5,
-3, -3.464797, -5.513614, 1, -0.5, 0.5, 0.5,
-3, -3.464797, -5.513614, 1, 1.5, 0.5, 0.5,
-3, -3.464797, -5.513614, 0, 1.5, 0.5, 0.5,
-2, -3.464797, -5.513614, 0, -0.5, 0.5, 0.5,
-2, -3.464797, -5.513614, 1, -0.5, 0.5, 0.5,
-2, -3.464797, -5.513614, 1, 1.5, 0.5, 0.5,
-2, -3.464797, -5.513614, 0, 1.5, 0.5, 0.5,
-1, -3.464797, -5.513614, 0, -0.5, 0.5, 0.5,
-1, -3.464797, -5.513614, 1, -0.5, 0.5, 0.5,
-1, -3.464797, -5.513614, 1, 1.5, 0.5, 0.5,
-1, -3.464797, -5.513614, 0, 1.5, 0.5, 0.5,
0, -3.464797, -5.513614, 0, -0.5, 0.5, 0.5,
0, -3.464797, -5.513614, 1, -0.5, 0.5, 0.5,
0, -3.464797, -5.513614, 1, 1.5, 0.5, 0.5,
0, -3.464797, -5.513614, 0, 1.5, 0.5, 0.5,
1, -3.464797, -5.513614, 0, -0.5, 0.5, 0.5,
1, -3.464797, -5.513614, 1, -0.5, 0.5, 0.5,
1, -3.464797, -5.513614, 1, 1.5, 0.5, 0.5,
1, -3.464797, -5.513614, 0, 1.5, 0.5, 0.5,
2, -3.464797, -5.513614, 0, -0.5, 0.5, 0.5,
2, -3.464797, -5.513614, 1, -0.5, 0.5, 0.5,
2, -3.464797, -5.513614, 1, 1.5, 0.5, 0.5,
2, -3.464797, -5.513614, 0, 1.5, 0.5, 0.5,
3, -3.464797, -5.513614, 0, -0.5, 0.5, 0.5,
3, -3.464797, -5.513614, 1, -0.5, 0.5, 0.5,
3, -3.464797, -5.513614, 1, 1.5, 0.5, 0.5,
3, -3.464797, -5.513614, 0, 1.5, 0.5, 0.5
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
-3.655951, -2, -4.742926,
-3.655951, 3, -4.742926,
-3.655951, -2, -4.742926,
-3.829626, -2, -4.999822,
-3.655951, -1, -4.742926,
-3.829626, -1, -4.999822,
-3.655951, 0, -4.742926,
-3.829626, 0, -4.999822,
-3.655951, 1, -4.742926,
-3.829626, 1, -4.999822,
-3.655951, 2, -4.742926,
-3.829626, 2, -4.999822,
-3.655951, 3, -4.742926,
-3.829626, 3, -4.999822
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
-4.176977, -2, -5.513614, 0, -0.5, 0.5, 0.5,
-4.176977, -2, -5.513614, 1, -0.5, 0.5, 0.5,
-4.176977, -2, -5.513614, 1, 1.5, 0.5, 0.5,
-4.176977, -2, -5.513614, 0, 1.5, 0.5, 0.5,
-4.176977, -1, -5.513614, 0, -0.5, 0.5, 0.5,
-4.176977, -1, -5.513614, 1, -0.5, 0.5, 0.5,
-4.176977, -1, -5.513614, 1, 1.5, 0.5, 0.5,
-4.176977, -1, -5.513614, 0, 1.5, 0.5, 0.5,
-4.176977, 0, -5.513614, 0, -0.5, 0.5, 0.5,
-4.176977, 0, -5.513614, 1, -0.5, 0.5, 0.5,
-4.176977, 0, -5.513614, 1, 1.5, 0.5, 0.5,
-4.176977, 0, -5.513614, 0, 1.5, 0.5, 0.5,
-4.176977, 1, -5.513614, 0, -0.5, 0.5, 0.5,
-4.176977, 1, -5.513614, 1, -0.5, 0.5, 0.5,
-4.176977, 1, -5.513614, 1, 1.5, 0.5, 0.5,
-4.176977, 1, -5.513614, 0, 1.5, 0.5, 0.5,
-4.176977, 2, -5.513614, 0, -0.5, 0.5, 0.5,
-4.176977, 2, -5.513614, 1, -0.5, 0.5, 0.5,
-4.176977, 2, -5.513614, 1, 1.5, 0.5, 0.5,
-4.176977, 2, -5.513614, 0, 1.5, 0.5, 0.5,
-4.176977, 3, -5.513614, 0, -0.5, 0.5, 0.5,
-4.176977, 3, -5.513614, 1, -0.5, 0.5, 0.5,
-4.176977, 3, -5.513614, 1, 1.5, 0.5, 0.5,
-4.176977, 3, -5.513614, 0, 1.5, 0.5, 0.5
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
-3.655951, -2.998185, -4,
-3.655951, -2.998185, 4,
-3.655951, -2.998185, -4,
-3.829626, -3.153722, -4,
-3.655951, -2.998185, -2,
-3.829626, -3.153722, -2,
-3.655951, -2.998185, 0,
-3.829626, -3.153722, 0,
-3.655951, -2.998185, 2,
-3.829626, -3.153722, 2,
-3.655951, -2.998185, 4,
-3.829626, -3.153722, 4
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
-4.176977, -3.464797, -4, 0, -0.5, 0.5, 0.5,
-4.176977, -3.464797, -4, 1, -0.5, 0.5, 0.5,
-4.176977, -3.464797, -4, 1, 1.5, 0.5, 0.5,
-4.176977, -3.464797, -4, 0, 1.5, 0.5, 0.5,
-4.176977, -3.464797, -2, 0, -0.5, 0.5, 0.5,
-4.176977, -3.464797, -2, 1, -0.5, 0.5, 0.5,
-4.176977, -3.464797, -2, 1, 1.5, 0.5, 0.5,
-4.176977, -3.464797, -2, 0, 1.5, 0.5, 0.5,
-4.176977, -3.464797, 0, 0, -0.5, 0.5, 0.5,
-4.176977, -3.464797, 0, 1, -0.5, 0.5, 0.5,
-4.176977, -3.464797, 0, 1, 1.5, 0.5, 0.5,
-4.176977, -3.464797, 0, 0, 1.5, 0.5, 0.5,
-4.176977, -3.464797, 2, 0, -0.5, 0.5, 0.5,
-4.176977, -3.464797, 2, 1, -0.5, 0.5, 0.5,
-4.176977, -3.464797, 2, 1, 1.5, 0.5, 0.5,
-4.176977, -3.464797, 2, 0, 1.5, 0.5, 0.5,
-4.176977, -3.464797, 4, 0, -0.5, 0.5, 0.5,
-4.176977, -3.464797, 4, 1, -0.5, 0.5, 0.5,
-4.176977, -3.464797, 4, 1, 1.5, 0.5, 0.5,
-4.176977, -3.464797, 4, 0, 1.5, 0.5, 0.5
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
-3.655951, -2.998185, -4.742926,
-3.655951, 3.223308, -4.742926,
-3.655951, -2.998185, 5.532913,
-3.655951, 3.223308, 5.532913,
-3.655951, -2.998185, -4.742926,
-3.655951, -2.998185, 5.532913,
-3.655951, 3.223308, -4.742926,
-3.655951, 3.223308, 5.532913,
-3.655951, -2.998185, -4.742926,
3.291067, -2.998185, -4.742926,
-3.655951, -2.998185, 5.532913,
3.291067, -2.998185, 5.532913,
-3.655951, 3.223308, -4.742926,
3.291067, 3.223308, -4.742926,
-3.655951, 3.223308, 5.532913,
3.291067, 3.223308, 5.532913,
3.291067, -2.998185, -4.742926,
3.291067, 3.223308, -4.742926,
3.291067, -2.998185, 5.532913,
3.291067, 3.223308, 5.532913,
3.291067, -2.998185, -4.742926,
3.291067, -2.998185, 5.532913,
3.291067, 3.223308, -4.742926,
3.291067, 3.223308, 5.532913
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
var radius = 7.409852;
var distance = 32.96727;
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
mvMatrix.translate( 0.1824416, -0.1125615, -0.3949933 );
mvMatrix.scale( 1.153254, 1.287742, 0.7796616 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.96727);
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
pentachloroaniline<-read.table("pentachloroaniline.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pentachloroaniline$V2
```

```
## Error in eval(expr, envir, enclos): object 'pentachloroaniline' not found
```

```r
y<-pentachloroaniline$V3
```

```
## Error in eval(expr, envir, enclos): object 'pentachloroaniline' not found
```

```r
z<-pentachloroaniline$V4
```

```
## Error in eval(expr, envir, enclos): object 'pentachloroaniline' not found
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
-3.55478, 1.235128, 0.5496637, 0, 0, 1, 1, 1,
-2.867018, 0.4142247, -1.450441, 1, 0, 0, 1, 1,
-2.726007, -1.126021, -2.580257, 1, 0, 0, 1, 1,
-2.571768, -1.090504, -2.586078, 1, 0, 0, 1, 1,
-2.555185, 0.03145934, -0.3089486, 1, 0, 0, 1, 1,
-2.545913, 0.1034131, -1.775863, 1, 0, 0, 1, 1,
-2.528099, -1.181185, -2.115647, 0, 0, 0, 1, 1,
-2.499413, -1.468171, -0.6067976, 0, 0, 0, 1, 1,
-2.493211, -1.39375, -1.776102, 0, 0, 0, 1, 1,
-2.478421, -0.9312021, -3.286899, 0, 0, 0, 1, 1,
-2.457846, -0.5464922, -2.931273, 0, 0, 0, 1, 1,
-2.447579, 1.145578, -0.4213385, 0, 0, 0, 1, 1,
-2.358331, -0.2681079, -1.002815, 0, 0, 0, 1, 1,
-2.334369, -0.4446335, -1.836199, 1, 1, 1, 1, 1,
-2.317989, 0.3189204, 0.9822651, 1, 1, 1, 1, 1,
-2.3086, -0.3687456, -1.481175, 1, 1, 1, 1, 1,
-2.299244, 1.817951, -0.3022391, 1, 1, 1, 1, 1,
-2.277222, 0.2021438, -1.648821, 1, 1, 1, 1, 1,
-2.24381, -0.4782832, -0.9049882, 1, 1, 1, 1, 1,
-2.203829, -0.1417617, -0.792556, 1, 1, 1, 1, 1,
-2.166592, -0.8912784, -1.623101, 1, 1, 1, 1, 1,
-2.166178, -1.02487, -1.564704, 1, 1, 1, 1, 1,
-2.163407, 1.05469, -0.9691023, 1, 1, 1, 1, 1,
-2.147633, 0.9512012, -0.6146459, 1, 1, 1, 1, 1,
-2.114863, -0.1935837, -1.443948, 1, 1, 1, 1, 1,
-2.096692, -0.4875699, -1.248226, 1, 1, 1, 1, 1,
-2.076116, -1.0979, -1.169956, 1, 1, 1, 1, 1,
-2.007869, 1.806992, 0.02317053, 1, 1, 1, 1, 1,
-2.003363, 0.255716, -1.206601, 0, 0, 1, 1, 1,
-1.99611, 0.08917078, 0.4494555, 1, 0, 0, 1, 1,
-1.995547, -1.5585, -1.171611, 1, 0, 0, 1, 1,
-1.984693, 0.01113081, -2.163945, 1, 0, 0, 1, 1,
-1.976432, 0.7018397, -1.838298, 1, 0, 0, 1, 1,
-1.875758, 0.4359018, -1.383666, 1, 0, 0, 1, 1,
-1.861232, 1.07986, -0.8729628, 0, 0, 0, 1, 1,
-1.839413, -0.8697338, -2.397191, 0, 0, 0, 1, 1,
-1.833507, -2.16173, -2.09337, 0, 0, 0, 1, 1,
-1.833376, 0.1515107, -2.182421, 0, 0, 0, 1, 1,
-1.832688, 0.9246924, -0.6823407, 0, 0, 0, 1, 1,
-1.823307, 0.3642958, -1.652662, 0, 0, 0, 1, 1,
-1.796283, -0.3897802, -1.373501, 0, 0, 0, 1, 1,
-1.795376, 0.4001358, -1.785662, 1, 1, 1, 1, 1,
-1.778914, -0.4515797, -1.773567, 1, 1, 1, 1, 1,
-1.778012, 0.3138364, -0.2112986, 1, 1, 1, 1, 1,
-1.700187, -0.3175313, -2.552325, 1, 1, 1, 1, 1,
-1.668767, 0.5946735, -0.8514583, 1, 1, 1, 1, 1,
-1.645772, 0.3124442, -1.373585, 1, 1, 1, 1, 1,
-1.628173, -1.156287, -3.038092, 1, 1, 1, 1, 1,
-1.627976, -1.25511, -2.219605, 1, 1, 1, 1, 1,
-1.617384, 1.425789, -0.6684564, 1, 1, 1, 1, 1,
-1.61545, 0.09512401, -2.350775, 1, 1, 1, 1, 1,
-1.614047, -2.230677, -2.988623, 1, 1, 1, 1, 1,
-1.608452, 0.2991857, -2.05008, 1, 1, 1, 1, 1,
-1.607599, 0.4161771, 0.3178225, 1, 1, 1, 1, 1,
-1.591395, -0.5976884, -1.577097, 1, 1, 1, 1, 1,
-1.561594, -0.6702922, -1.41285, 1, 1, 1, 1, 1,
-1.557017, 0.3103617, -1.021336, 0, 0, 1, 1, 1,
-1.552261, -1.11104, -2.286704, 1, 0, 0, 1, 1,
-1.550973, -1.819077, -1.67397, 1, 0, 0, 1, 1,
-1.546781, -0.2518019, -2.247289, 1, 0, 0, 1, 1,
-1.545667, 0.6499479, -2.981035, 1, 0, 0, 1, 1,
-1.542869, 0.3013883, -1.250577, 1, 0, 0, 1, 1,
-1.539426, -0.111049, -0.1574067, 0, 0, 0, 1, 1,
-1.532739, -0.6628225, -1.473684, 0, 0, 0, 1, 1,
-1.520863, 0.09875944, -1.34159, 0, 0, 0, 1, 1,
-1.514132, 0.2916569, -1.874096, 0, 0, 0, 1, 1,
-1.512856, 1.727424, -1.411762, 0, 0, 0, 1, 1,
-1.508138, 0.6167356, -2.178509, 0, 0, 0, 1, 1,
-1.497624, 1.307021, 0.339384, 0, 0, 0, 1, 1,
-1.494086, -0.1738725, -1.133415, 1, 1, 1, 1, 1,
-1.492161, 0.3384833, -1.997434, 1, 1, 1, 1, 1,
-1.486162, 0.6608862, -2.415884, 1, 1, 1, 1, 1,
-1.479101, -1.083302, -1.939748, 1, 1, 1, 1, 1,
-1.471783, -1.162506, -3.069792, 1, 1, 1, 1, 1,
-1.471484, 0.04085467, -0.6287794, 1, 1, 1, 1, 1,
-1.471061, 2.112581, 0.1956523, 1, 1, 1, 1, 1,
-1.462479, -0.3665197, -1.976832, 1, 1, 1, 1, 1,
-1.457351, 0.5145281, -2.769132, 1, 1, 1, 1, 1,
-1.445055, 0.5869048, -2.082845, 1, 1, 1, 1, 1,
-1.420743, 1.357827, 0.2373187, 1, 1, 1, 1, 1,
-1.40364, 0.3284888, -2.460152, 1, 1, 1, 1, 1,
-1.39923, -0.203347, -3.263856, 1, 1, 1, 1, 1,
-1.396403, -1.765165, -1.843082, 1, 1, 1, 1, 1,
-1.384598, -0.1318093, -2.098356, 1, 1, 1, 1, 1,
-1.378175, 1.822284, 0.6240262, 0, 0, 1, 1, 1,
-1.373875, 1.292837, -0.8383909, 1, 0, 0, 1, 1,
-1.37385, 0.8263118, -1.584726, 1, 0, 0, 1, 1,
-1.366716, 0.4617062, -0.07973246, 1, 0, 0, 1, 1,
-1.365446, -0.8640725, -0.4969932, 1, 0, 0, 1, 1,
-1.36434, -0.8059987, -2.673371, 1, 0, 0, 1, 1,
-1.359887, -0.5098368, -0.5249863, 0, 0, 0, 1, 1,
-1.353663, -0.07753976, -2.943822, 0, 0, 0, 1, 1,
-1.343564, -0.8578647, -1.673396, 0, 0, 0, 1, 1,
-1.318603, -0.5511349, -1.143721, 0, 0, 0, 1, 1,
-1.308319, 0.4036803, -2.218509, 0, 0, 0, 1, 1,
-1.292398, 0.4705209, -1.922822, 0, 0, 0, 1, 1,
-1.28059, 3.132704, -1.534754, 0, 0, 0, 1, 1,
-1.27993, -1.03022, -3.266749, 1, 1, 1, 1, 1,
-1.278214, 0.01928456, -0.1247421, 1, 1, 1, 1, 1,
-1.274797, -0.2674849, -0.6430932, 1, 1, 1, 1, 1,
-1.265374, 0.8275915, -1.10434, 1, 1, 1, 1, 1,
-1.262961, 0.2738675, -2.064563, 1, 1, 1, 1, 1,
-1.262368, 0.3403225, -1.914507, 1, 1, 1, 1, 1,
-1.255422, -0.2367188, -1.921619, 1, 1, 1, 1, 1,
-1.243754, -1.966572, -2.729497, 1, 1, 1, 1, 1,
-1.242749, -0.9332044, -1.934931, 1, 1, 1, 1, 1,
-1.235737, 2.431808, -2.719147, 1, 1, 1, 1, 1,
-1.233236, 1.041798, 0.2362088, 1, 1, 1, 1, 1,
-1.232153, 0.9697573, -1.184427, 1, 1, 1, 1, 1,
-1.226375, -0.1902813, -2.276201, 1, 1, 1, 1, 1,
-1.224602, -0.6119777, 0.3740526, 1, 1, 1, 1, 1,
-1.223581, -1.198188, -3.843367, 1, 1, 1, 1, 1,
-1.220182, -0.6106502, -1.73289, 0, 0, 1, 1, 1,
-1.219345, -0.4142402, -2.190285, 1, 0, 0, 1, 1,
-1.218159, -0.3302478, -1.087859, 1, 0, 0, 1, 1,
-1.19668, 1.168052, -0.5899487, 1, 0, 0, 1, 1,
-1.196102, 0.2693207, -1.859081, 1, 0, 0, 1, 1,
-1.195767, 1.254674, -0.841126, 1, 0, 0, 1, 1,
-1.186991, -1.792099, -3.838948, 0, 0, 0, 1, 1,
-1.18344, 0.08675011, 0.09791263, 0, 0, 0, 1, 1,
-1.17715, -0.3223575, -1.780992, 0, 0, 0, 1, 1,
-1.175896, -0.9441028, -2.109791, 0, 0, 0, 1, 1,
-1.175732, -0.682348, -2.407563, 0, 0, 0, 1, 1,
-1.165984, -1.826138, -3.081669, 0, 0, 0, 1, 1,
-1.156262, -0.01385583, -3.205867, 0, 0, 0, 1, 1,
-1.147961, -0.7564835, -1.517519, 1, 1, 1, 1, 1,
-1.137182, -0.1251615, -2.249059, 1, 1, 1, 1, 1,
-1.128309, 0.1038065, -1.633986, 1, 1, 1, 1, 1,
-1.126675, -0.7778534, 0.01543413, 1, 1, 1, 1, 1,
-1.120282, 0.5828969, 0.7107139, 1, 1, 1, 1, 1,
-1.116255, -0.7086631, -2.286725, 1, 1, 1, 1, 1,
-1.116053, 0.1728411, -0.8002867, 1, 1, 1, 1, 1,
-1.113936, -0.6251642, -2.845503, 1, 1, 1, 1, 1,
-1.113688, 1.304787, -1.119652, 1, 1, 1, 1, 1,
-1.11289, -0.07596499, -1.595316, 1, 1, 1, 1, 1,
-1.112579, 0.4716877, -1.407568, 1, 1, 1, 1, 1,
-1.112052, -0.0850333, -0.201026, 1, 1, 1, 1, 1,
-1.110934, 1.225489, -1.557326, 1, 1, 1, 1, 1,
-1.109353, -0.4868469, -3.402831, 1, 1, 1, 1, 1,
-1.095965, 0.5383926, -2.313747, 1, 1, 1, 1, 1,
-1.093438, 0.7295221, -2.109516, 0, 0, 1, 1, 1,
-1.092951, 1.22751, 0.1597565, 1, 0, 0, 1, 1,
-1.09101, 0.8272777, -1.766, 1, 0, 0, 1, 1,
-1.081915, -0.4328885, -2.018779, 1, 0, 0, 1, 1,
-1.073297, 0.2092145, -2.917731, 1, 0, 0, 1, 1,
-1.070365, 0.6791443, 0.1557833, 1, 0, 0, 1, 1,
-1.069395, -0.7408556, -1.303541, 0, 0, 0, 1, 1,
-1.064803, -0.06347117, -3.659715, 0, 0, 0, 1, 1,
-1.056162, -0.9296402, -2.735019, 0, 0, 0, 1, 1,
-1.049867, -0.403025, -1.484594, 0, 0, 0, 1, 1,
-1.048157, 0.3852705, -0.343614, 0, 0, 0, 1, 1,
-1.046167, -0.250384, -1.90154, 0, 0, 0, 1, 1,
-1.041169, -1.594777, -3.704062, 0, 0, 0, 1, 1,
-1.036037, -0.7355929, -2.215086, 1, 1, 1, 1, 1,
-1.032117, -1.496257, -1.413544, 1, 1, 1, 1, 1,
-1.025129, 0.3956626, -2.035589, 1, 1, 1, 1, 1,
-1.020186, 0.2579584, -1.613717, 1, 1, 1, 1, 1,
-1.019883, 2.85376, -1.901784, 1, 1, 1, 1, 1,
-1.016578, -0.03798726, -1.361438, 1, 1, 1, 1, 1,
-1.011951, 0.4454521, -2.252049, 1, 1, 1, 1, 1,
-1.010455, 0.04921152, -0.1086577, 1, 1, 1, 1, 1,
-1.002414, -0.7904373, -1.51858, 1, 1, 1, 1, 1,
-1.001677, -1.550071, -1.520673, 1, 1, 1, 1, 1,
-0.9993716, -0.4742464, -1.104061, 1, 1, 1, 1, 1,
-0.9926717, 1.402428, 0.840175, 1, 1, 1, 1, 1,
-0.9922507, 0.4679644, -1.567751, 1, 1, 1, 1, 1,
-0.9869792, 0.2666458, 1.245467, 1, 1, 1, 1, 1,
-0.9755058, -2.386159, 0.02715652, 1, 1, 1, 1, 1,
-0.9741542, -0.9032646, -1.525515, 0, 0, 1, 1, 1,
-0.9738252, -0.6724069, -2.583896, 1, 0, 0, 1, 1,
-0.9720394, 0.02104335, -2.668766, 1, 0, 0, 1, 1,
-0.9626897, -1.049761, -1.003259, 1, 0, 0, 1, 1,
-0.9615988, 0.8407272, -3.754205, 1, 0, 0, 1, 1,
-0.9537704, -0.08221852, -0.848339, 1, 0, 0, 1, 1,
-0.947279, 0.4210615, -1.521005, 0, 0, 0, 1, 1,
-0.9438391, 0.01163174, -1.80762, 0, 0, 0, 1, 1,
-0.9430797, -0.3094505, -1.181827, 0, 0, 0, 1, 1,
-0.9413069, 0.3925593, -0.2778317, 0, 0, 0, 1, 1,
-0.9330031, -0.04419379, -1.022611, 0, 0, 0, 1, 1,
-0.932332, 0.3544279, -0.679937, 0, 0, 0, 1, 1,
-0.929629, -0.942124, -1.357472, 0, 0, 0, 1, 1,
-0.9296092, 0.4415422, -2.069388, 1, 1, 1, 1, 1,
-0.9260457, -0.3061992, -2.096085, 1, 1, 1, 1, 1,
-0.9222632, 1.247222, -1.197084, 1, 1, 1, 1, 1,
-0.92035, -0.2652056, -1.109396, 1, 1, 1, 1, 1,
-0.9191425, 0.906774, -1.234404, 1, 1, 1, 1, 1,
-0.9187902, 0.3593238, -0.1466223, 1, 1, 1, 1, 1,
-0.9061881, -0.7222263, -3.662536, 1, 1, 1, 1, 1,
-0.9025745, -1.251268, -3.504503, 1, 1, 1, 1, 1,
-0.9001355, -0.0419368, -0.7281952, 1, 1, 1, 1, 1,
-0.8995311, 0.2797616, -0.9945092, 1, 1, 1, 1, 1,
-0.8936881, -0.696457, -0.7948759, 1, 1, 1, 1, 1,
-0.8936586, 0.4862194, -1.32371, 1, 1, 1, 1, 1,
-0.8935195, 0.9792613, -1.594423, 1, 1, 1, 1, 1,
-0.8909164, -0.4640625, -1.428783, 1, 1, 1, 1, 1,
-0.8894262, -2.193091, -3.044721, 1, 1, 1, 1, 1,
-0.8887863, 0.3918303, -0.450755, 0, 0, 1, 1, 1,
-0.8886558, -1.32505, -3.503941, 1, 0, 0, 1, 1,
-0.8879989, -1.299819, -4.372622, 1, 0, 0, 1, 1,
-0.8802152, 1.131264, -0.5903642, 1, 0, 0, 1, 1,
-0.8788825, -0.527761, -3.333813, 1, 0, 0, 1, 1,
-0.8763409, 1.976456, -1.05952, 1, 0, 0, 1, 1,
-0.8742293, -0.8429695, -2.014389, 0, 0, 0, 1, 1,
-0.8703335, -0.3749927, -1.652152, 0, 0, 0, 1, 1,
-0.8696939, 0.9845365, -0.5634782, 0, 0, 0, 1, 1,
-0.8674454, 0.7454591, -0.3007875, 0, 0, 0, 1, 1,
-0.8672634, 0.8993855, -1.421932, 0, 0, 0, 1, 1,
-0.8655834, -0.2209981, -2.984452, 0, 0, 0, 1, 1,
-0.8641735, 1.005072, -2.515102, 0, 0, 0, 1, 1,
-0.8619267, -0.8535262, -2.132163, 1, 1, 1, 1, 1,
-0.8601934, 0.2941125, -2.236217, 1, 1, 1, 1, 1,
-0.8541325, 1.56936, -0.5811377, 1, 1, 1, 1, 1,
-0.8499195, 0.09505992, -1.408663, 1, 1, 1, 1, 1,
-0.8388892, 0.2925861, -0.9405274, 1, 1, 1, 1, 1,
-0.8371219, -0.4143445, -2.274615, 1, 1, 1, 1, 1,
-0.8367895, -2.116357, -2.367614, 1, 1, 1, 1, 1,
-0.8284537, 0.01950147, -1.226398, 1, 1, 1, 1, 1,
-0.8225269, -0.900507, -3.651632, 1, 1, 1, 1, 1,
-0.8154174, -2.864767, -1.569584, 1, 1, 1, 1, 1,
-0.8053585, 1.008182, -0.6050176, 1, 1, 1, 1, 1,
-0.8026763, -1.547697, -1.819288, 1, 1, 1, 1, 1,
-0.8025292, 0.3985664, -2.112888, 1, 1, 1, 1, 1,
-0.7985286, 1.252671, -0.8922983, 1, 1, 1, 1, 1,
-0.7957744, -0.3320231, -1.442932, 1, 1, 1, 1, 1,
-0.7953987, 0.6922094, 1.230641, 0, 0, 1, 1, 1,
-0.7934015, 0.6806585, -0.2464335, 1, 0, 0, 1, 1,
-0.7743353, 0.8299482, 0.04656044, 1, 0, 0, 1, 1,
-0.7703446, 1.393192, 1.204615, 1, 0, 0, 1, 1,
-0.7683965, -1.896974, -2.167404, 1, 0, 0, 1, 1,
-0.766203, 0.04716764, -1.785843, 1, 0, 0, 1, 1,
-0.7627258, 0.6489084, -1.476415, 0, 0, 0, 1, 1,
-0.7589851, -0.8649176, -2.85151, 0, 0, 0, 1, 1,
-0.7586328, 0.7008238, 2.050784, 0, 0, 0, 1, 1,
-0.7513545, 0.1618121, -0.3213722, 0, 0, 0, 1, 1,
-0.7481767, 1.265544, -0.6089447, 0, 0, 0, 1, 1,
-0.7467284, -0.2087831, -0.5886656, 0, 0, 0, 1, 1,
-0.7462421, 0.6628462, -0.7594771, 0, 0, 0, 1, 1,
-0.7414142, -0.2294353, -2.029164, 1, 1, 1, 1, 1,
-0.7353781, 0.8650618, -0.6884755, 1, 1, 1, 1, 1,
-0.7340401, 0.127038, -0.7527081, 1, 1, 1, 1, 1,
-0.7295054, 0.2943199, -1.063966, 1, 1, 1, 1, 1,
-0.7254372, -1.173402, -2.572779, 1, 1, 1, 1, 1,
-0.7241194, -0.6866161, -3.866074, 1, 1, 1, 1, 1,
-0.7157204, -0.4417473, -2.793905, 1, 1, 1, 1, 1,
-0.7144915, -0.8613677, -2.033956, 1, 1, 1, 1, 1,
-0.7143135, -1.806091, -3.7362, 1, 1, 1, 1, 1,
-0.7061634, 1.447563, -1.774267, 1, 1, 1, 1, 1,
-0.6941323, 1.096954, -0.7190995, 1, 1, 1, 1, 1,
-0.693109, -0.3753706, -4.083982, 1, 1, 1, 1, 1,
-0.6916697, -2.053972, -2.713284, 1, 1, 1, 1, 1,
-0.6879125, -0.8313602, -1.142864, 1, 1, 1, 1, 1,
-0.6808537, -1.404376, -4.15207, 1, 1, 1, 1, 1,
-0.6794795, 1.04455, -0.9477587, 0, 0, 1, 1, 1,
-0.6768222, 0.6111337, -1.051779, 1, 0, 0, 1, 1,
-0.6740126, -0.4009951, -4.046298, 1, 0, 0, 1, 1,
-0.6731313, 0.9421657, -0.6817517, 1, 0, 0, 1, 1,
-0.6729012, 0.6061984, -1.438452, 1, 0, 0, 1, 1,
-0.6722965, 0.998634, -1.671128, 1, 0, 0, 1, 1,
-0.6707972, -0.137736, 0.3208251, 0, 0, 0, 1, 1,
-0.6673983, 1.830999, -1.277434, 0, 0, 0, 1, 1,
-0.6622119, 1.172552, -1.161838, 0, 0, 0, 1, 1,
-0.6608163, 0.1091974, -1.60485, 0, 0, 0, 1, 1,
-0.6606374, -0.717222, -2.890301, 0, 0, 0, 1, 1,
-0.6587867, 0.9077871, -0.7888654, 0, 0, 0, 1, 1,
-0.6521928, -0.554448, -3.626463, 0, 0, 0, 1, 1,
-0.6468961, -1.603035, -2.691236, 1, 1, 1, 1, 1,
-0.6455288, 0.981742, -0.8081362, 1, 1, 1, 1, 1,
-0.64409, -0.7949023, -1.17862, 1, 1, 1, 1, 1,
-0.6432541, 1.438126, 0.1068772, 1, 1, 1, 1, 1,
-0.6400217, 0.5846446, 0.5386044, 1, 1, 1, 1, 1,
-0.6357207, 2.198683, -0.5936564, 1, 1, 1, 1, 1,
-0.6348239, -0.09433767, -1.455717, 1, 1, 1, 1, 1,
-0.6306025, 0.2567558, -1.205896, 1, 1, 1, 1, 1,
-0.6202165, 1.469985, -0.1030956, 1, 1, 1, 1, 1,
-0.6148739, -0.4630232, -3.083447, 1, 1, 1, 1, 1,
-0.61275, -0.1039274, -1.671561, 1, 1, 1, 1, 1,
-0.6109093, 0.1151009, -1.149787, 1, 1, 1, 1, 1,
-0.6102461, 0.1580159, -1.48133, 1, 1, 1, 1, 1,
-0.6056951, -0.8406894, -2.285896, 1, 1, 1, 1, 1,
-0.6029375, 0.6484193, -1.538911, 1, 1, 1, 1, 1,
-0.5985433, 0.1192122, -0.7707174, 0, 0, 1, 1, 1,
-0.5976228, -0.1906818, -0.987151, 1, 0, 0, 1, 1,
-0.5901018, 1.222665, -0.9462148, 1, 0, 0, 1, 1,
-0.5900962, -0.1162532, -1.472646, 1, 0, 0, 1, 1,
-0.5897171, -0.08418563, -1.124131, 1, 0, 0, 1, 1,
-0.5883869, 0.6549688, 1.395046, 1, 0, 0, 1, 1,
-0.5862665, 2.157546, -0.8405409, 0, 0, 0, 1, 1,
-0.5859731, -1.34353, -3.747681, 0, 0, 0, 1, 1,
-0.5820187, -0.7213125, -2.749808, 0, 0, 0, 1, 1,
-0.5718741, 0.05708015, -3.991476, 0, 0, 0, 1, 1,
-0.5710437, -1.154118, -2.651822, 0, 0, 0, 1, 1,
-0.5665876, 1.852134, -1.806327, 0, 0, 0, 1, 1,
-0.5556442, -0.2671943, -2.106797, 0, 0, 0, 1, 1,
-0.5455571, -0.235097, -1.627234, 1, 1, 1, 1, 1,
-0.5420181, 0.8315143, -1.853523, 1, 1, 1, 1, 1,
-0.538758, -0.7752195, -2.581113, 1, 1, 1, 1, 1,
-0.5328897, 1.810118, -0.9748408, 1, 1, 1, 1, 1,
-0.5267896, 0.9597697, -1.348267, 1, 1, 1, 1, 1,
-0.52651, 0.4984743, 0.6301072, 1, 1, 1, 1, 1,
-0.5252102, 0.945304, 0.7086979, 1, 1, 1, 1, 1,
-0.5215287, 0.01575775, -1.986846, 1, 1, 1, 1, 1,
-0.5188644, 0.7817418, 2.086344, 1, 1, 1, 1, 1,
-0.5142208, -0.1890114, -2.313444, 1, 1, 1, 1, 1,
-0.5117448, -0.889203, -2.286658, 1, 1, 1, 1, 1,
-0.5094795, 0.3276466, 0.2694471, 1, 1, 1, 1, 1,
-0.5072349, 0.4802671, -1.088976, 1, 1, 1, 1, 1,
-0.4996499, 0.3614643, -0.5253072, 1, 1, 1, 1, 1,
-0.4990048, 0.5369156, -0.2732965, 1, 1, 1, 1, 1,
-0.4967978, 0.5148233, -1.699806, 0, 0, 1, 1, 1,
-0.4963341, 0.4799051, -0.4371145, 1, 0, 0, 1, 1,
-0.4961597, 0.4064399, -1.042074, 1, 0, 0, 1, 1,
-0.4883181, 0.8209412, -2.829374, 1, 0, 0, 1, 1,
-0.487403, -0.2523395, -2.606753, 1, 0, 0, 1, 1,
-0.4855279, 0.8213399, 0.8229396, 1, 0, 0, 1, 1,
-0.4798111, -1.132809, -4.007042, 0, 0, 0, 1, 1,
-0.4796376, -0.9263511, -4.282856, 0, 0, 0, 1, 1,
-0.4764488, -0.147792, -1.372642, 0, 0, 0, 1, 1,
-0.4761445, -0.5804592, -3.014628, 0, 0, 0, 1, 1,
-0.4721933, 0.6799747, -3.1409, 0, 0, 0, 1, 1,
-0.4688725, 0.5637506, -1.464594, 0, 0, 0, 1, 1,
-0.4645287, -0.3866012, -2.654509, 0, 0, 0, 1, 1,
-0.4617191, -1.796844, -1.889619, 1, 1, 1, 1, 1,
-0.456556, 0.756573, -1.784589, 1, 1, 1, 1, 1,
-0.4527118, 1.276635, -1.744386, 1, 1, 1, 1, 1,
-0.4522504, -0.7262275, -3.339891, 1, 1, 1, 1, 1,
-0.4505349, -0.6310562, -2.237629, 1, 1, 1, 1, 1,
-0.4465377, 1.047336, 1.149657, 1, 1, 1, 1, 1,
-0.4453793, 0.4474926, -1.705846, 1, 1, 1, 1, 1,
-0.4418229, 0.02228292, -2.216814, 1, 1, 1, 1, 1,
-0.43999, -0.08753276, -0.4069208, 1, 1, 1, 1, 1,
-0.4395315, -1.00495, -1.233493, 1, 1, 1, 1, 1,
-0.4383289, 0.7860085, -1.272425, 1, 1, 1, 1, 1,
-0.4372917, 0.7907066, -1.560273, 1, 1, 1, 1, 1,
-0.4368958, -1.151155, -2.681267, 1, 1, 1, 1, 1,
-0.4367628, -1.466593, -4.309254, 1, 1, 1, 1, 1,
-0.434377, 2.093981, 0.3461937, 1, 1, 1, 1, 1,
-0.4334454, 1.665546, 0.3746762, 0, 0, 1, 1, 1,
-0.4333, -0.3765193, -3.013138, 1, 0, 0, 1, 1,
-0.4319455, 1.225103, -0.117893, 1, 0, 0, 1, 1,
-0.4197999, 0.9822304, 0.4405753, 1, 0, 0, 1, 1,
-0.4197089, -0.3946585, -3.499735, 1, 0, 0, 1, 1,
-0.4182287, -1.256424, -3.405412, 1, 0, 0, 1, 1,
-0.415509, -0.4849271, -4.373628, 0, 0, 0, 1, 1,
-0.4144423, 1.002573, -1.70886, 0, 0, 0, 1, 1,
-0.4124263, -1.954958, -2.63629, 0, 0, 0, 1, 1,
-0.4114542, 0.7589461, 0.6826286, 0, 0, 0, 1, 1,
-0.409949, -0.3324494, -3.019767, 0, 0, 0, 1, 1,
-0.4090926, 1.505432, -0.6548212, 0, 0, 0, 1, 1,
-0.4010243, 1.256799, 0.2483133, 0, 0, 0, 1, 1,
-0.3982339, -1.042162, -3.398806, 1, 1, 1, 1, 1,
-0.395453, -0.01239044, 1.016961, 1, 1, 1, 1, 1,
-0.3945642, -0.4577346, -2.139233, 1, 1, 1, 1, 1,
-0.3916581, 0.6027629, -1.420501, 1, 1, 1, 1, 1,
-0.3915951, 2.114231, -0.03539162, 1, 1, 1, 1, 1,
-0.3870775, -0.163224, -4.056012, 1, 1, 1, 1, 1,
-0.3864959, -0.5269821, -0.3445702, 1, 1, 1, 1, 1,
-0.3861488, 1.900551, 0.6557708, 1, 1, 1, 1, 1,
-0.3830904, 0.5759255, -0.871664, 1, 1, 1, 1, 1,
-0.3734807, 1.061071, -0.4580151, 1, 1, 1, 1, 1,
-0.3705281, 1.158296, 1.440989, 1, 1, 1, 1, 1,
-0.3679333, 1.272285, -0.592195, 1, 1, 1, 1, 1,
-0.3676324, -0.8381805, -1.407731, 1, 1, 1, 1, 1,
-0.3663619, -2.162899, -2.599019, 1, 1, 1, 1, 1,
-0.3621279, 2.500057, -0.1426834, 1, 1, 1, 1, 1,
-0.3610307, 0.9971443, 0.2892941, 0, 0, 1, 1, 1,
-0.3509899, 0.1259165, -1.967723, 1, 0, 0, 1, 1,
-0.3472613, 0.1638333, -2.323958, 1, 0, 0, 1, 1,
-0.3440548, 1.610157, -1.820501, 1, 0, 0, 1, 1,
-0.3381293, -1.924945, -1.803338, 1, 0, 0, 1, 1,
-0.3379282, 1.262779, 1.779112, 1, 0, 0, 1, 1,
-0.3333482, -0.4143899, -3.317165, 0, 0, 0, 1, 1,
-0.3329801, 1.566207, -1.790942, 0, 0, 0, 1, 1,
-0.3324689, 0.6371343, 0.09211574, 0, 0, 0, 1, 1,
-0.3306116, 0.3254772, -1.59216, 0, 0, 0, 1, 1,
-0.3296608, 2.716368, -0.1697493, 0, 0, 0, 1, 1,
-0.3244261, 0.0339799, -2.171469, 0, 0, 0, 1, 1,
-0.3211048, -2.100709, -2.375172, 0, 0, 0, 1, 1,
-0.3164726, 0.6570029, -0.1150597, 1, 1, 1, 1, 1,
-0.3134982, -0.9470724, -3.165885, 1, 1, 1, 1, 1,
-0.3125712, -1.255679, -3.314867, 1, 1, 1, 1, 1,
-0.3117816, 0.901068, -1.42555, 1, 1, 1, 1, 1,
-0.310223, -2.172184, -2.803308, 1, 1, 1, 1, 1,
-0.3096178, 1.54466, 0.5452594, 1, 1, 1, 1, 1,
-0.3090447, -0.1382333, -2.248742, 1, 1, 1, 1, 1,
-0.2993444, 0.9138569, -1.590549, 1, 1, 1, 1, 1,
-0.2990758, -0.8168607, -3.107105, 1, 1, 1, 1, 1,
-0.2960341, 1.375809, 0.4832614, 1, 1, 1, 1, 1,
-0.2948029, -0.2866631, -0.725621, 1, 1, 1, 1, 1,
-0.2887737, 1.76734, -0.755262, 1, 1, 1, 1, 1,
-0.2885464, -0.5430988, -4.056502, 1, 1, 1, 1, 1,
-0.2874771, 1.411773, -1.570227, 1, 1, 1, 1, 1,
-0.2866685, 0.05973909, 0.690001, 1, 1, 1, 1, 1,
-0.2858346, 1.249373, 3.59635, 0, 0, 1, 1, 1,
-0.2854754, -0.8825908, -2.471514, 1, 0, 0, 1, 1,
-0.2841509, 0.2842881, -0.3104362, 1, 0, 0, 1, 1,
-0.2825661, 0.08635807, -2.386204, 1, 0, 0, 1, 1,
-0.2822057, 0.6569777, -0.1040515, 1, 0, 0, 1, 1,
-0.2779258, -1.222275, -4.445553, 1, 0, 0, 1, 1,
-0.276024, 0.5780305, -0.9418446, 0, 0, 0, 1, 1,
-0.2746633, 0.4358861, 0.1795464, 0, 0, 0, 1, 1,
-0.2746527, 1.501836, -1.006898, 0, 0, 0, 1, 1,
-0.273009, -0.08545303, -1.421764, 0, 0, 0, 1, 1,
-0.2671667, -0.1849893, -2.573051, 0, 0, 0, 1, 1,
-0.2664247, -1.209095, -2.488628, 0, 0, 0, 1, 1,
-0.263253, 0.8540768, -1.887185, 0, 0, 0, 1, 1,
-0.2602144, 0.2797264, -2.027932, 1, 1, 1, 1, 1,
-0.2590903, 0.1270067, 0.08920966, 1, 1, 1, 1, 1,
-0.2584564, -0.1158126, -3.027234, 1, 1, 1, 1, 1,
-0.257552, -0.1227148, -1.948034, 1, 1, 1, 1, 1,
-0.2563547, 0.443511, 0.9832063, 1, 1, 1, 1, 1,
-0.2552502, 0.01900495, -1.696284, 1, 1, 1, 1, 1,
-0.2551811, -1.298646, -1.74733, 1, 1, 1, 1, 1,
-0.2549143, -0.7228263, -3.167203, 1, 1, 1, 1, 1,
-0.2534596, 1.391792, 1.408343, 1, 1, 1, 1, 1,
-0.2532996, -1.177552, -1.910926, 1, 1, 1, 1, 1,
-0.2460304, -1.09525, -3.309896, 1, 1, 1, 1, 1,
-0.2430635, 1.504283, -2.190091, 1, 1, 1, 1, 1,
-0.2412809, -1.287657, -4.593278, 1, 1, 1, 1, 1,
-0.2363951, 0.9400186, -0.6844147, 1, 1, 1, 1, 1,
-0.2362552, 0.4211288, 0.2544395, 1, 1, 1, 1, 1,
-0.2353507, -0.6255067, -3.023968, 0, 0, 1, 1, 1,
-0.2348726, 1.202373, 1.840996, 1, 0, 0, 1, 1,
-0.2333525, 1.459016, -0.2312706, 1, 0, 0, 1, 1,
-0.2332527, -0.6033004, -3.041373, 1, 0, 0, 1, 1,
-0.2245089, -1.524835, -3.573481, 1, 0, 0, 1, 1,
-0.2203332, -0.2892221, -1.906854, 1, 0, 0, 1, 1,
-0.21873, -0.5020831, -2.31048, 0, 0, 0, 1, 1,
-0.2173627, -0.05094483, -0.3509268, 0, 0, 0, 1, 1,
-0.2159096, 1.122875, -0.1633273, 0, 0, 0, 1, 1,
-0.2154707, -1.164834, -3.229002, 0, 0, 0, 1, 1,
-0.2142775, 0.4259118, -0.4771158, 0, 0, 0, 1, 1,
-0.2138782, 0.5165899, 0.3357958, 0, 0, 0, 1, 1,
-0.2125123, -0.5998515, -2.756572, 0, 0, 0, 1, 1,
-0.2122215, 0.8486263, -0.1505368, 1, 1, 1, 1, 1,
-0.2117123, 1.61511, -1.265498, 1, 1, 1, 1, 1,
-0.2106456, -0.2616405, -3.042101, 1, 1, 1, 1, 1,
-0.2045533, -1.156497, -3.281924, 1, 1, 1, 1, 1,
-0.2005761, 0.3118971, -1.624321, 1, 1, 1, 1, 1,
-0.1984593, 1.124259, 0.03967652, 1, 1, 1, 1, 1,
-0.1984583, -0.8462882, -1.476933, 1, 1, 1, 1, 1,
-0.1972132, -0.1872198, -0.4908686, 1, 1, 1, 1, 1,
-0.1955263, -1.086238, -2.722455, 1, 1, 1, 1, 1,
-0.1930986, -0.8033562, -4.366116, 1, 1, 1, 1, 1,
-0.1805443, 0.276223, -1.567745, 1, 1, 1, 1, 1,
-0.1796571, -0.2528782, -3.334474, 1, 1, 1, 1, 1,
-0.1740536, 0.6403447, 1.106005, 1, 1, 1, 1, 1,
-0.1729317, -0.6892537, -2.63203, 1, 1, 1, 1, 1,
-0.1723234, 0.5436442, -0.9684015, 1, 1, 1, 1, 1,
-0.171922, -0.3951049, -2.266838, 0, 0, 1, 1, 1,
-0.171174, -0.9449172, -2.203402, 1, 0, 0, 1, 1,
-0.1710561, -1.63957, -2.934536, 1, 0, 0, 1, 1,
-0.169282, 0.3782998, -0.4319266, 1, 0, 0, 1, 1,
-0.1647203, 0.704789, -0.8540865, 1, 0, 0, 1, 1,
-0.1614577, 0.2987189, -1.67004, 1, 0, 0, 1, 1,
-0.1538069, 0.602172, -0.5083075, 0, 0, 0, 1, 1,
-0.1515355, -0.3573751, -3.238208, 0, 0, 0, 1, 1,
-0.1495, -0.5990223, -1.395435, 0, 0, 0, 1, 1,
-0.1491775, -0.7720164, -2.339499, 0, 0, 0, 1, 1,
-0.148892, -0.3370635, -2.056682, 0, 0, 0, 1, 1,
-0.1482337, -0.08911489, -2.758113, 0, 0, 0, 1, 1,
-0.1421766, 0.1882803, 0.4242, 0, 0, 0, 1, 1,
-0.1378606, 1.657879, 1.622716, 1, 1, 1, 1, 1,
-0.1299255, -0.1201652, -2.98504, 1, 1, 1, 1, 1,
-0.1291019, -0.04945046, -1.939162, 1, 1, 1, 1, 1,
-0.1265027, 0.0009909148, -0.168243, 1, 1, 1, 1, 1,
-0.1253497, 0.6603189, -0.7449217, 1, 1, 1, 1, 1,
-0.1231678, 0.3295868, 0.5608463, 1, 1, 1, 1, 1,
-0.122179, 0.7052252, -0.828308, 1, 1, 1, 1, 1,
-0.1189194, 0.7736086, -3.045583, 1, 1, 1, 1, 1,
-0.1176932, -0.642388, -3.205144, 1, 1, 1, 1, 1,
-0.1175392, 0.2184994, 0.712782, 1, 1, 1, 1, 1,
-0.115525, -1.368055, -1.454026, 1, 1, 1, 1, 1,
-0.1152674, 0.792448, -0.4210795, 1, 1, 1, 1, 1,
-0.1152508, -1.619185, -3.574358, 1, 1, 1, 1, 1,
-0.1144096, -0.7292196, -2.941275, 1, 1, 1, 1, 1,
-0.1141647, 0.46989, 1.273197, 1, 1, 1, 1, 1,
-0.1031895, -0.8449439, -2.618464, 0, 0, 1, 1, 1,
-0.1001251, -1.523118, -3.891651, 1, 0, 0, 1, 1,
-0.09763739, 0.5166371, -0.5438384, 1, 0, 0, 1, 1,
-0.09322424, -0.1475789, -1.853726, 1, 0, 0, 1, 1,
-0.09289046, 1.282441, 1.742589, 1, 0, 0, 1, 1,
-0.09251489, 0.4073141, 0.5716046, 1, 0, 0, 1, 1,
-0.09003381, 1.065733, -2.006255, 0, 0, 0, 1, 1,
-0.08986047, -0.3258655, -2.921169, 0, 0, 0, 1, 1,
-0.08345209, -0.1322154, -2.470471, 0, 0, 0, 1, 1,
-0.08078288, 0.4395017, -0.3311028, 0, 0, 0, 1, 1,
-0.08020873, 0.6133733, 0.8700987, 0, 0, 0, 1, 1,
-0.07905284, -0.6356029, -4.030006, 0, 0, 0, 1, 1,
-0.07544252, 0.9830313, -0.2629829, 0, 0, 0, 1, 1,
-0.07497159, -0.4901087, -3.395589, 1, 1, 1, 1, 1,
-0.05483038, 0.8111143, 0.4813544, 1, 1, 1, 1, 1,
-0.0459817, -0.9660605, -3.696115, 1, 1, 1, 1, 1,
-0.04554427, 0.09119178, 0.1522545, 1, 1, 1, 1, 1,
-0.04347358, -0.4220539, -2.664508, 1, 1, 1, 1, 1,
-0.04015897, -0.2552104, -4.4457, 1, 1, 1, 1, 1,
-0.03918421, 0.913509, -1.162102, 1, 1, 1, 1, 1,
-0.03463766, 1.026213, 0.5422608, 1, 1, 1, 1, 1,
-0.03422951, -0.2749958, -3.183367, 1, 1, 1, 1, 1,
-0.03101663, -0.5576963, -2.06898, 1, 1, 1, 1, 1,
-0.02988076, -0.7582041, -2.681497, 1, 1, 1, 1, 1,
-0.0280927, 0.9351903, 0.46368, 1, 1, 1, 1, 1,
-0.02585142, 0.4228897, -0.1515477, 1, 1, 1, 1, 1,
-0.02316979, 1.102577, 0.086381, 1, 1, 1, 1, 1,
-0.0225779, 1.016549, 0.0520036, 1, 1, 1, 1, 1,
-0.02235185, 1.069548, 0.2788778, 0, 0, 1, 1, 1,
-0.01693649, 0.400308, 1.302516, 1, 0, 0, 1, 1,
-0.01478685, -0.1521698, -1.876513, 1, 0, 0, 1, 1,
-0.01416235, 0.3135746, -1.426654, 1, 0, 0, 1, 1,
-0.01240019, 2.624374, 0.9339382, 1, 0, 0, 1, 1,
-0.01239853, -2.369545, -3.788775, 1, 0, 0, 1, 1,
-0.01232617, -0.8837684, -3.373494, 0, 0, 0, 1, 1,
-0.01174288, -0.4686629, -1.434892, 0, 0, 0, 1, 1,
-0.01118372, 1.081848, 0.3050841, 0, 0, 0, 1, 1,
-0.009853617, -0.6081832, -3.400846, 0, 0, 0, 1, 1,
-0.00928959, -0.5677079, -3.327597, 0, 0, 0, 1, 1,
-0.0003344558, 0.2765993, -0.9447903, 0, 0, 0, 1, 1,
-0.0002895745, 1.423763, -0.6530432, 0, 0, 0, 1, 1,
0.00700237, 0.6728408, 1.355565, 1, 1, 1, 1, 1,
0.007200938, 0.2996399, 1.485022, 1, 1, 1, 1, 1,
0.01543988, 0.3488934, -2.123698, 1, 1, 1, 1, 1,
0.01706694, 0.8094871, 1.04118, 1, 1, 1, 1, 1,
0.02214738, -0.8585424, 4.94027, 1, 1, 1, 1, 1,
0.02574203, -1.367094, 4.633174, 1, 1, 1, 1, 1,
0.02590044, 1.683338, 0.9508804, 1, 1, 1, 1, 1,
0.02822001, 1.640508, 0.6641166, 1, 1, 1, 1, 1,
0.03063868, -1.231857, 4.836765, 1, 1, 1, 1, 1,
0.0320307, 1.5948, -0.8239418, 1, 1, 1, 1, 1,
0.03845137, -0.317799, 2.421003, 1, 1, 1, 1, 1,
0.04053776, 0.6080549, 0.2811648, 1, 1, 1, 1, 1,
0.04200738, 0.7718376, 0.3842277, 1, 1, 1, 1, 1,
0.04397374, 0.0118841, 2.36093, 1, 1, 1, 1, 1,
0.04732367, 0.6987236, 0.2096032, 1, 1, 1, 1, 1,
0.04860753, -1.063666, 3.050228, 0, 0, 1, 1, 1,
0.04872672, 0.8093996, 0.9809455, 1, 0, 0, 1, 1,
0.0493536, 0.552516, 0.3948284, 1, 0, 0, 1, 1,
0.04974047, 1.487081, 3.657556, 1, 0, 0, 1, 1,
0.05402264, 0.06321519, 1.861275, 1, 0, 0, 1, 1,
0.05608374, -0.8885619, 3.364287, 1, 0, 0, 1, 1,
0.0568145, -0.4518333, 3.573605, 0, 0, 0, 1, 1,
0.05728743, -1.304055, 1.733884, 0, 0, 0, 1, 1,
0.06058687, 0.1155729, 1.265177, 0, 0, 0, 1, 1,
0.06246745, -0.5662338, 3.027201, 0, 0, 0, 1, 1,
0.06427287, 1.630625, -0.04249728, 0, 0, 0, 1, 1,
0.06570376, -0.07470651, 2.463466, 0, 0, 0, 1, 1,
0.08024511, 0.8738133, 0.2324179, 0, 0, 0, 1, 1,
0.08380685, -1.949501, 3.603092, 1, 1, 1, 1, 1,
0.08522969, 0.469102, -0.5020119, 1, 1, 1, 1, 1,
0.08721942, 0.3272611, 0.1252133, 1, 1, 1, 1, 1,
0.08985379, 0.2029194, 1.621263, 1, 1, 1, 1, 1,
0.09109031, -0.297963, 2.327225, 1, 1, 1, 1, 1,
0.09130089, -0.5423468, 2.957052, 1, 1, 1, 1, 1,
0.0918681, 0.8725396, -1.222412, 1, 1, 1, 1, 1,
0.09284605, -0.383561, 2.77551, 1, 1, 1, 1, 1,
0.1009113, -1.073542, 4.299974, 1, 1, 1, 1, 1,
0.1017429, -1.533857, 3.181615, 1, 1, 1, 1, 1,
0.108592, -1.117281, 3.328761, 1, 1, 1, 1, 1,
0.1101377, -0.1283576, 1.560742, 1, 1, 1, 1, 1,
0.1115928, -0.4269179, 3.682229, 1, 1, 1, 1, 1,
0.1151969, 0.149567, 0.2050441, 1, 1, 1, 1, 1,
0.1158075, -0.603526, 2.820471, 1, 1, 1, 1, 1,
0.1184384, 1.204163, 0.9760098, 0, 0, 1, 1, 1,
0.1200887, 0.05276862, 1.177592, 1, 0, 0, 1, 1,
0.1210169, -0.611164, 3.69364, 1, 0, 0, 1, 1,
0.12138, 0.4627122, 1.624539, 1, 0, 0, 1, 1,
0.121516, -0.2460938, 1.81442, 1, 0, 0, 1, 1,
0.1220135, 0.6566116, 1.712269, 1, 0, 0, 1, 1,
0.1220244, -0.1807832, 2.098948, 0, 0, 0, 1, 1,
0.1240383, -1.760873, 3.274526, 0, 0, 0, 1, 1,
0.126843, 1.683665, -0.5041175, 0, 0, 0, 1, 1,
0.1302944, -0.06512287, 1.026048, 0, 0, 0, 1, 1,
0.1319168, 0.9621345, 0.3117128, 0, 0, 0, 1, 1,
0.1345374, -2.04748, 4.09866, 0, 0, 0, 1, 1,
0.1368914, -0.9749684, 1.858059, 0, 0, 0, 1, 1,
0.1375973, -1.700917, 2.561341, 1, 1, 1, 1, 1,
0.1386787, -0.8847412, 3.607999, 1, 1, 1, 1, 1,
0.1411989, -0.5797382, 4.493252, 1, 1, 1, 1, 1,
0.1480976, -1.475467, 3.590136, 1, 1, 1, 1, 1,
0.1513394, -0.8766084, 1.47815, 1, 1, 1, 1, 1,
0.1527039, -0.9869944, 3.186069, 1, 1, 1, 1, 1,
0.156199, 0.7357723, 0.5977755, 1, 1, 1, 1, 1,
0.1611133, -0.7772802, 2.602219, 1, 1, 1, 1, 1,
0.1615934, 1.347744, 0.7232583, 1, 1, 1, 1, 1,
0.165641, -0.317173, 2.37992, 1, 1, 1, 1, 1,
0.1663722, -2.160473, 2.643994, 1, 1, 1, 1, 1,
0.1675516, 0.3106361, 0.4880147, 1, 1, 1, 1, 1,
0.1689818, -0.84801, 4.287232, 1, 1, 1, 1, 1,
0.170937, -1.441116, 4.308818, 1, 1, 1, 1, 1,
0.1717041, -0.7985332, 1.901352, 1, 1, 1, 1, 1,
0.1792258, -0.006481412, 1.717387, 0, 0, 1, 1, 1,
0.1831005, -0.6359518, 2.256676, 1, 0, 0, 1, 1,
0.1851517, 2.003251, -0.3549066, 1, 0, 0, 1, 1,
0.1942889, 0.6375933, -0.6214731, 1, 0, 0, 1, 1,
0.1960189, -0.5339695, 2.563402, 1, 0, 0, 1, 1,
0.2075834, 0.8121431, -1.939511, 1, 0, 0, 1, 1,
0.2093519, 0.5123726, -0.1130226, 0, 0, 0, 1, 1,
0.2124386, 1.490801, -1.588442, 0, 0, 0, 1, 1,
0.2147081, 0.5966573, -0.1479033, 0, 0, 0, 1, 1,
0.2189628, -1.294323, 1.337164, 0, 0, 0, 1, 1,
0.2210071, 0.4291799, 1.265468, 0, 0, 0, 1, 1,
0.2216878, 0.9729172, -0.4941076, 0, 0, 0, 1, 1,
0.2218111, -0.5238375, 3.164826, 0, 0, 0, 1, 1,
0.2258045, -0.674242, 1.477092, 1, 1, 1, 1, 1,
0.2270877, 0.3230644, 0.398711, 1, 1, 1, 1, 1,
0.2274641, 0.1795176, 0.1671448, 1, 1, 1, 1, 1,
0.229242, -0.2455363, 1.853672, 1, 1, 1, 1, 1,
0.2329258, -0.5018255, 2.890839, 1, 1, 1, 1, 1,
0.2342706, -1.561502, 3.102878, 1, 1, 1, 1, 1,
0.2382082, -0.9499654, 3.555703, 1, 1, 1, 1, 1,
0.2412363, 0.06014908, 1.396931, 1, 1, 1, 1, 1,
0.2417166, -0.6211885, 3.355209, 1, 1, 1, 1, 1,
0.2536625, 0.3869563, -1.060577, 1, 1, 1, 1, 1,
0.2540254, -0.4255808, 2.846039, 1, 1, 1, 1, 1,
0.2551657, -1.924834, 1.899084, 1, 1, 1, 1, 1,
0.2556435, 1.301337, 1.567744, 1, 1, 1, 1, 1,
0.2599751, 0.2705384, 0.5759174, 1, 1, 1, 1, 1,
0.2603385, -0.8545997, 3.864551, 1, 1, 1, 1, 1,
0.2626126, -1.480954, 4.183956, 0, 0, 1, 1, 1,
0.2675813, -0.8721086, 1.707807, 1, 0, 0, 1, 1,
0.2676831, -0.5238674, 4.160903, 1, 0, 0, 1, 1,
0.270701, -0.0147265, 1.955317, 1, 0, 0, 1, 1,
0.2708718, 0.9114922, 2.351676, 1, 0, 0, 1, 1,
0.2708788, 1.039536, 0.1761303, 1, 0, 0, 1, 1,
0.2755317, 0.6322386, 0.001827357, 0, 0, 0, 1, 1,
0.276372, 0.8502883, 2.141365, 0, 0, 0, 1, 1,
0.2800741, 0.1464936, 1.929337, 0, 0, 0, 1, 1,
0.2834346, -1.327576, 2.09805, 0, 0, 0, 1, 1,
0.2839798, 2.200936, 1.678297, 0, 0, 0, 1, 1,
0.2928439, -1.719213, 1.300299, 0, 0, 0, 1, 1,
0.2935188, -0.8989446, 2.203399, 0, 0, 0, 1, 1,
0.294084, -0.6494429, 2.316664, 1, 1, 1, 1, 1,
0.3000407, -0.130345, 3.689432, 1, 1, 1, 1, 1,
0.3052356, 0.4581204, 1.529633, 1, 1, 1, 1, 1,
0.3053156, 0.4647667, 1.796774, 1, 1, 1, 1, 1,
0.3093724, -1.164675, 4.637245, 1, 1, 1, 1, 1,
0.316869, 1.431665, 0.2222096, 1, 1, 1, 1, 1,
0.3170387, 0.624105, 0.8761116, 1, 1, 1, 1, 1,
0.3185073, 0.4985736, -1.649377, 1, 1, 1, 1, 1,
0.3208596, 0.7491846, 1.130038, 1, 1, 1, 1, 1,
0.3213209, -1.426927, 3.363503, 1, 1, 1, 1, 1,
0.32455, -0.1089253, 1.926405, 1, 1, 1, 1, 1,
0.3302798, -0.6607541, 3.085706, 1, 1, 1, 1, 1,
0.3318301, 0.9356349, -0.2181228, 1, 1, 1, 1, 1,
0.3338703, 0.1114224, 2.85485, 1, 1, 1, 1, 1,
0.3398775, 1.350346, -1.181731, 1, 1, 1, 1, 1,
0.3401911, 0.1168473, 0.7327766, 0, 0, 1, 1, 1,
0.3445117, -0.7283268, 4.275668, 1, 0, 0, 1, 1,
0.3465109, 0.9234823, 1.400974, 1, 0, 0, 1, 1,
0.3517053, 0.7286007, 2.303476, 1, 0, 0, 1, 1,
0.3546696, 0.1470172, 1.348854, 1, 0, 0, 1, 1,
0.3612325, 0.1979284, -0.1711503, 1, 0, 0, 1, 1,
0.363128, -0.6237977, 1.458206, 0, 0, 0, 1, 1,
0.3652541, -0.3001603, -0.151595, 0, 0, 0, 1, 1,
0.3663602, -1.500187, 3.482039, 0, 0, 0, 1, 1,
0.3692623, -0.6103861, 1.842141, 0, 0, 0, 1, 1,
0.3693542, 0.7799276, 0.6203184, 0, 0, 0, 1, 1,
0.3699305, -0.5784536, 1.23307, 0, 0, 0, 1, 1,
0.3720602, 0.6179286, -0.1700686, 0, 0, 0, 1, 1,
0.3770458, 1.265051, 1.831269, 1, 1, 1, 1, 1,
0.3895064, 0.1629849, -0.5661777, 1, 1, 1, 1, 1,
0.3897054, 1.206069, 1.721784, 1, 1, 1, 1, 1,
0.3933634, -0.3530336, 3.213866, 1, 1, 1, 1, 1,
0.397235, -0.6435684, 1.894305, 1, 1, 1, 1, 1,
0.4014918, -0.2875864, 1.04405, 1, 1, 1, 1, 1,
0.4032077, 0.4238441, 0.3559772, 1, 1, 1, 1, 1,
0.4038644, -0.1832302, 3.714155, 1, 1, 1, 1, 1,
0.4047508, 0.663345, -0.9223092, 1, 1, 1, 1, 1,
0.4069581, 0.355624, 2.563767, 1, 1, 1, 1, 1,
0.4083465, 0.1706507, 0.7479743, 1, 1, 1, 1, 1,
0.4101359, -0.906752, 2.231441, 1, 1, 1, 1, 1,
0.4112459, 0.01684184, 1.563675, 1, 1, 1, 1, 1,
0.4171972, 0.2300729, 0.08814709, 1, 1, 1, 1, 1,
0.4176991, 0.985755, 0.5325095, 1, 1, 1, 1, 1,
0.419435, 0.1780171, 0.370039, 0, 0, 1, 1, 1,
0.4298989, 0.6552109, 1.220139, 1, 0, 0, 1, 1,
0.432742, 1.374851, -2.122894, 1, 0, 0, 1, 1,
0.4349837, -0.3650708, 2.154415, 1, 0, 0, 1, 1,
0.4390553, -0.04640926, 1.458201, 1, 0, 0, 1, 1,
0.4406772, 1.013845, 1.32732, 1, 0, 0, 1, 1,
0.4425423, -0.3560249, 2.41494, 0, 0, 0, 1, 1,
0.455416, 1.862958, -0.4212463, 0, 0, 0, 1, 1,
0.4655752, -1.413498, 2.756249, 0, 0, 0, 1, 1,
0.4711911, 0.9650235, 0.8198211, 0, 0, 0, 1, 1,
0.4743285, -1.025673, 2.278624, 0, 0, 0, 1, 1,
0.4768093, 0.4067584, 1.91188, 0, 0, 0, 1, 1,
0.4880346, 1.230243, 0.6808068, 0, 0, 0, 1, 1,
0.4888205, 0.4103427, 3.060192, 1, 1, 1, 1, 1,
0.4916987, -1.191782, 3.147777, 1, 1, 1, 1, 1,
0.495011, 0.9466072, 2.529896, 1, 1, 1, 1, 1,
0.496354, -0.9940785, 3.922962, 1, 1, 1, 1, 1,
0.5040159, 0.7800038, -0.4113731, 1, 1, 1, 1, 1,
0.5054093, -0.116905, 1.78992, 1, 1, 1, 1, 1,
0.5063382, -0.189884, 3.926443, 1, 1, 1, 1, 1,
0.5096593, -0.6415768, 2.580177, 1, 1, 1, 1, 1,
0.5135311, 0.4343935, 3.165648, 1, 1, 1, 1, 1,
0.514498, 0.5567282, -0.7511998, 1, 1, 1, 1, 1,
0.5178302, -0.9272284, 1.271988, 1, 1, 1, 1, 1,
0.5189809, 1.002566, 0.5398678, 1, 1, 1, 1, 1,
0.5209494, 0.9285844, -0.3898363, 1, 1, 1, 1, 1,
0.5213137, -1.300334, 3.513466, 1, 1, 1, 1, 1,
0.52689, 0.2227357, 1.653884, 1, 1, 1, 1, 1,
0.5280955, -0.9555246, 1.869063, 0, 0, 1, 1, 1,
0.5293776, -1.145231, 2.340089, 1, 0, 0, 1, 1,
0.5320328, -1.416473, 4.165704, 1, 0, 0, 1, 1,
0.5326481, 0.2022081, 1.509355, 1, 0, 0, 1, 1,
0.5336303, -0.6107928, 1.307486, 1, 0, 0, 1, 1,
0.5389037, -1.160829, 1.461028, 1, 0, 0, 1, 1,
0.5389259, -0.6230507, 2.041064, 0, 0, 0, 1, 1,
0.539078, -0.5462035, 2.441888, 0, 0, 0, 1, 1,
0.5622166, -1.439163, 2.764925, 0, 0, 0, 1, 1,
0.5733819, 0.1871449, 0.1861659, 0, 0, 0, 1, 1,
0.5787985, -1.465949, 3.742084, 0, 0, 0, 1, 1,
0.5795982, 1.159606, 0.5819063, 0, 0, 0, 1, 1,
0.5836402, 0.4507188, 2.343861, 0, 0, 0, 1, 1,
0.5838058, 1.123169, -0.1075822, 1, 1, 1, 1, 1,
0.5871234, -0.0517956, 0.9754854, 1, 1, 1, 1, 1,
0.591911, -0.4140381, 3.115779, 1, 1, 1, 1, 1,
0.5936708, -1.120492, 2.846487, 1, 1, 1, 1, 1,
0.594654, -2.008298, 2.303114, 1, 1, 1, 1, 1,
0.598296, -0.2276521, 1.845717, 1, 1, 1, 1, 1,
0.6009082, 0.3601473, 1.853463, 1, 1, 1, 1, 1,
0.6029156, 1.659119, 1.151391, 1, 1, 1, 1, 1,
0.6042148, -0.3916267, 1.895387, 1, 1, 1, 1, 1,
0.6070744, 0.7835147, 1.104966, 1, 1, 1, 1, 1,
0.6090861, 1.098895, -0.143903, 1, 1, 1, 1, 1,
0.6093423, 0.6436452, 0.3776348, 1, 1, 1, 1, 1,
0.6119668, -0.003434121, 2.496557, 1, 1, 1, 1, 1,
0.6128001, -1.049454, 2.500866, 1, 1, 1, 1, 1,
0.6204315, 0.9351888, 1.102325, 1, 1, 1, 1, 1,
0.6219755, 0.9569846, 0.7124422, 0, 0, 1, 1, 1,
0.6237228, -0.562118, 2.298001, 1, 0, 0, 1, 1,
0.6254593, -1.546068, 1.556334, 1, 0, 0, 1, 1,
0.6256272, 0.1561104, 1.982098, 1, 0, 0, 1, 1,
0.6345654, 0.9987693, 0.5136811, 1, 0, 0, 1, 1,
0.6552388, -0.1111996, 2.801896, 1, 0, 0, 1, 1,
0.6557385, -0.7095939, 4.147716, 0, 0, 0, 1, 1,
0.6595216, -0.008469616, 1.128895, 0, 0, 0, 1, 1,
0.6623263, 0.1996588, 0.6211698, 0, 0, 0, 1, 1,
0.6912862, -0.907127, 1.86784, 0, 0, 0, 1, 1,
0.6915636, 0.3695579, 0.476437, 0, 0, 0, 1, 1,
0.6943962, 0.6299037, 2.169955, 0, 0, 0, 1, 1,
0.6965733, -1.385437, 3.323972, 0, 0, 0, 1, 1,
0.6979647, -1.256732, 2.318896, 1, 1, 1, 1, 1,
0.7011726, -0.5785472, 2.061559, 1, 1, 1, 1, 1,
0.7016507, -0.7264752, 1.751938, 1, 1, 1, 1, 1,
0.7189611, 1.595877, 0.9907301, 1, 1, 1, 1, 1,
0.7196888, 1.529919, -0.1045291, 1, 1, 1, 1, 1,
0.7200702, 0.1099321, 0.8177909, 1, 1, 1, 1, 1,
0.7208714, -1.659986, 3.70229, 1, 1, 1, 1, 1,
0.722546, -0.6379349, 4.282331, 1, 1, 1, 1, 1,
0.7233724, 0.7423521, 1.34164, 1, 1, 1, 1, 1,
0.7249707, 0.9151391, 0.907755, 1, 1, 1, 1, 1,
0.7265958, -1.747315, 4.431674, 1, 1, 1, 1, 1,
0.7266192, 1.060091, 0.8758514, 1, 1, 1, 1, 1,
0.7279327, -0.08675204, 2.317397, 1, 1, 1, 1, 1,
0.7341022, 0.7384951, 0.4607082, 1, 1, 1, 1, 1,
0.7362437, 0.0917066, 1.285395, 1, 1, 1, 1, 1,
0.7400671, -0.154904, 1.054348, 0, 0, 1, 1, 1,
0.7445157, -0.7827336, 2.576587, 1, 0, 0, 1, 1,
0.7499841, 0.05271719, 0.4443129, 1, 0, 0, 1, 1,
0.7531827, -0.3060692, 2.112215, 1, 0, 0, 1, 1,
0.7546006, -0.9296576, 2.457847, 1, 0, 0, 1, 1,
0.7551199, -0.5306662, 2.273955, 1, 0, 0, 1, 1,
0.7656924, -0.7821025, 1.623967, 0, 0, 0, 1, 1,
0.7664981, -0.2066181, 3.046095, 0, 0, 0, 1, 1,
0.7741121, 0.1399223, 0.8489195, 0, 0, 0, 1, 1,
0.7749717, -1.18222, 3.763416, 0, 0, 0, 1, 1,
0.7832341, -0.4326886, 2.338689, 0, 0, 0, 1, 1,
0.7834514, 1.635717, 1.102526, 0, 0, 0, 1, 1,
0.7857723, 1.117589, -1.073447, 0, 0, 0, 1, 1,
0.7890583, 2.002023, -1.738202, 1, 1, 1, 1, 1,
0.7903025, 1.04427, -0.7174082, 1, 1, 1, 1, 1,
0.7936755, 0.3587736, 2.758173, 1, 1, 1, 1, 1,
0.7943743, -0.3116961, 2.637649, 1, 1, 1, 1, 1,
0.8022605, 0.9328832, 0.8566359, 1, 1, 1, 1, 1,
0.802768, -0.8632753, 2.779119, 1, 1, 1, 1, 1,
0.8133903, -0.2878985, 2.832311, 1, 1, 1, 1, 1,
0.8144187, 0.7501667, 1.63746, 1, 1, 1, 1, 1,
0.8194045, -0.546594, 2.367384, 1, 1, 1, 1, 1,
0.8199027, 0.3573806, 1.652972, 1, 1, 1, 1, 1,
0.8208607, -0.6623548, 1.449414, 1, 1, 1, 1, 1,
0.8315399, -1.126417, 2.390568, 1, 1, 1, 1, 1,
0.8333342, 1.803325, -0.3404597, 1, 1, 1, 1, 1,
0.8417934, -0.2168177, 1.570685, 1, 1, 1, 1, 1,
0.843863, -0.8874999, -0.8126343, 1, 1, 1, 1, 1,
0.8466363, -2.645005, 4.235211, 0, 0, 1, 1, 1,
0.8474247, 0.3241726, 1.936628, 1, 0, 0, 1, 1,
0.8511954, -0.0764799, 2.055407, 1, 0, 0, 1, 1,
0.8634113, 1.32042, 0.3498415, 1, 0, 0, 1, 1,
0.8636006, -1.020476, 1.761164, 1, 0, 0, 1, 1,
0.8718554, -1.426255, 3.790885, 1, 0, 0, 1, 1,
0.8744599, -0.6179706, 1.105713, 0, 0, 0, 1, 1,
0.8747147, 1.072946, 1.598989, 0, 0, 0, 1, 1,
0.8747858, 1.726605, -0.2310803, 0, 0, 0, 1, 1,
0.8772655, -1.31782, 3.801593, 0, 0, 0, 1, 1,
0.8829719, -1.036215, 1.660475, 0, 0, 0, 1, 1,
0.8843827, 0.2808136, 0.5900371, 0, 0, 0, 1, 1,
0.8945594, 1.504112, 0.5128235, 0, 0, 0, 1, 1,
0.8952325, -0.8669469, 3.325145, 1, 1, 1, 1, 1,
0.895753, 0.7781582, 0.7317821, 1, 1, 1, 1, 1,
0.8962021, 0.451655, 1.3517, 1, 1, 1, 1, 1,
0.8974965, -0.9570793, 0.9467019, 1, 1, 1, 1, 1,
0.8977877, -0.538473, 1.550584, 1, 1, 1, 1, 1,
0.8995504, 2.163687, 0.8844618, 1, 1, 1, 1, 1,
0.9082853, 0.5540118, -0.2603234, 1, 1, 1, 1, 1,
0.9083664, 1.910887, 1.110294, 1, 1, 1, 1, 1,
0.9115826, 1.769571, 1.834528, 1, 1, 1, 1, 1,
0.9119263, -0.3283255, 4.006162, 1, 1, 1, 1, 1,
0.9132625, 1.51171, 0.8035686, 1, 1, 1, 1, 1,
0.9200304, -0.5424985, 0.09731169, 1, 1, 1, 1, 1,
0.9234207, 0.4249272, 1.849686, 1, 1, 1, 1, 1,
0.9296916, -1.660991, 1.495669, 1, 1, 1, 1, 1,
0.9326652, 1.268069, 1.566888, 1, 1, 1, 1, 1,
0.9342718, -0.5720354, 0.802523, 0, 0, 1, 1, 1,
0.9411828, 0.2443732, 2.17176, 1, 0, 0, 1, 1,
0.9417996, -0.2289099, -0.3977093, 1, 0, 0, 1, 1,
0.9424263, -0.1754811, 2.991274, 1, 0, 0, 1, 1,
0.9424919, 0.04057426, 2.999954, 1, 0, 0, 1, 1,
0.9471763, -1.179502, 0.4635198, 1, 0, 0, 1, 1,
0.9474112, -0.9623559, 2.444186, 0, 0, 0, 1, 1,
0.9503982, -0.906513, 0.1430224, 0, 0, 0, 1, 1,
0.9649807, -0.3674966, 2.734617, 0, 0, 0, 1, 1,
0.9757835, 0.062543, 1.545934, 0, 0, 0, 1, 1,
0.9771941, -0.08445604, -0.1490245, 0, 0, 0, 1, 1,
0.9788206, 0.5118904, 1.700074, 0, 0, 0, 1, 1,
0.9790294, 0.5083915, 1.807701, 0, 0, 0, 1, 1,
0.9831476, -1.423659, 2.435495, 1, 1, 1, 1, 1,
0.9921293, 1.518335, 0.3000205, 1, 1, 1, 1, 1,
0.9939699, -1.677426, 3.513936, 1, 1, 1, 1, 1,
0.9949325, 1.399935, -0.3224113, 1, 1, 1, 1, 1,
0.9957417, -1.222851, 1.810079, 1, 1, 1, 1, 1,
0.9977114, 1.117743, -0.04793961, 1, 1, 1, 1, 1,
1.001055, -0.1557356, 0.3931813, 1, 1, 1, 1, 1,
1.003142, -0.03877081, 1.381775, 1, 1, 1, 1, 1,
1.006607, 0.5471125, 0.9328015, 1, 1, 1, 1, 1,
1.007901, -2.700002, 3.339581, 1, 1, 1, 1, 1,
1.016319, -1.02395, 2.900256, 1, 1, 1, 1, 1,
1.020491, -0.2646228, -0.1189936, 1, 1, 1, 1, 1,
1.025681, -0.4787733, 2.161847, 1, 1, 1, 1, 1,
1.025711, -0.2719376, 1.27484, 1, 1, 1, 1, 1,
1.045093, -1.510896, 1.866253, 1, 1, 1, 1, 1,
1.046283, -1.06537, 3.524433, 0, 0, 1, 1, 1,
1.047461, -0.1157294, 5.383265, 1, 0, 0, 1, 1,
1.047594, 0.6168739, -1.025404, 1, 0, 0, 1, 1,
1.048891, -0.4796849, 1.215824, 1, 0, 0, 1, 1,
1.051564, -0.8975397, 3.877614, 1, 0, 0, 1, 1,
1.05691, -0.145389, 3.940131, 1, 0, 0, 1, 1,
1.05837, 0.4243006, -0.8062621, 0, 0, 0, 1, 1,
1.062826, -0.3201681, 2.208879, 0, 0, 0, 1, 1,
1.064133, -0.7898254, 2.712451, 0, 0, 0, 1, 1,
1.067061, 0.8033067, 0.3723152, 0, 0, 0, 1, 1,
1.068349, 0.3396758, 0.9195357, 0, 0, 0, 1, 1,
1.068945, -2.907581, 3.531273, 0, 0, 0, 1, 1,
1.072797, 0.004796276, 2.664706, 0, 0, 0, 1, 1,
1.07324, -0.6553862, 2.472194, 1, 1, 1, 1, 1,
1.07342, 2.426454, -0.5635709, 1, 1, 1, 1, 1,
1.08134, -0.04550831, 0.9837674, 1, 1, 1, 1, 1,
1.08401, 1.890391, -0.1537434, 1, 1, 1, 1, 1,
1.084823, -0.5525245, 1.00845, 1, 1, 1, 1, 1,
1.091344, 0.7881889, 0.8359631, 1, 1, 1, 1, 1,
1.091556, 1.58526, -1.30861, 1, 1, 1, 1, 1,
1.093762, -0.189969, 0.752369, 1, 1, 1, 1, 1,
1.099681, 0.06679608, 0.278796, 1, 1, 1, 1, 1,
1.103038, 1.074323, 1.459347, 1, 1, 1, 1, 1,
1.103182, -1.396415, 2.266773, 1, 1, 1, 1, 1,
1.10748, -2.517882, 1.350281, 1, 1, 1, 1, 1,
1.110347, 1.358035, 1.205256, 1, 1, 1, 1, 1,
1.111987, -0.625535, 0.5678092, 1, 1, 1, 1, 1,
1.119028, 1.812876, -1.084644, 1, 1, 1, 1, 1,
1.124338, -0.2950579, 2.169652, 0, 0, 1, 1, 1,
1.127453, 0.6609556, 1.405971, 1, 0, 0, 1, 1,
1.130336, 1.362129, 1.371867, 1, 0, 0, 1, 1,
1.13389, 1.477573, 0.8534036, 1, 0, 0, 1, 1,
1.134694, 1.236016, 0.6560426, 1, 0, 0, 1, 1,
1.136874, 2.458061, -0.09329812, 1, 0, 0, 1, 1,
1.137878, 0.4213701, 1.975558, 0, 0, 0, 1, 1,
1.141326, -1.858461, 2.272141, 0, 0, 0, 1, 1,
1.143339, -0.2593509, 0.9405195, 0, 0, 0, 1, 1,
1.155631, 1.111885, 1.303482, 0, 0, 0, 1, 1,
1.160177, 0.9549615, 1.138665, 0, 0, 0, 1, 1,
1.16173, -0.2213053, 0.6693547, 0, 0, 0, 1, 1,
1.163106, 0.366514, 2.256866, 0, 0, 0, 1, 1,
1.172803, 1.730024, 0.5624396, 1, 1, 1, 1, 1,
1.172966, 1.2591, 1.0593, 1, 1, 1, 1, 1,
1.189309, 1.62824, 1.37808, 1, 1, 1, 1, 1,
1.189713, -0.4581115, 1.994894, 1, 1, 1, 1, 1,
1.20154, -1.746464, 2.6934, 1, 1, 1, 1, 1,
1.203216, 1.738463, 0.8263484, 1, 1, 1, 1, 1,
1.216774, -0.4572932, 3.032164, 1, 1, 1, 1, 1,
1.222947, -0.06873536, 1.460221, 1, 1, 1, 1, 1,
1.224118, 1.683363, 1.299922, 1, 1, 1, 1, 1,
1.233737, -1.000476, 2.165153, 1, 1, 1, 1, 1,
1.238526, 0.1064754, 1.078261, 1, 1, 1, 1, 1,
1.251514, 0.3651697, 1.162299, 1, 1, 1, 1, 1,
1.271364, 0.1371867, 1.243521, 1, 1, 1, 1, 1,
1.287441, -0.3205442, 1.458379, 1, 1, 1, 1, 1,
1.300671, -0.3782071, 1.812154, 1, 1, 1, 1, 1,
1.302385, 1.831369, -1.361735, 0, 0, 1, 1, 1,
1.303526, 1.16725, 0.8202533, 1, 0, 0, 1, 1,
1.307403, -0.4513425, 0.5754131, 1, 0, 0, 1, 1,
1.311894, -0.5659392, 0.1212562, 1, 0, 0, 1, 1,
1.322328, -0.6476595, 2.496131, 1, 0, 0, 1, 1,
1.32702, -1.146165, 2.578006, 1, 0, 0, 1, 1,
1.334684, 0.7392378, 0.4198182, 0, 0, 0, 1, 1,
1.347234, 0.4547127, -0.1177587, 0, 0, 0, 1, 1,
1.362756, 1.464112, 0.3957697, 0, 0, 0, 1, 1,
1.363126, -0.6738317, 2.365141, 0, 0, 0, 1, 1,
1.370801, 1.380595, 1.086832, 0, 0, 0, 1, 1,
1.370887, 1.054646, -0.771365, 0, 0, 0, 1, 1,
1.377405, 0.6043075, 0.3485943, 0, 0, 0, 1, 1,
1.377548, -1.783405, 2.487604, 1, 1, 1, 1, 1,
1.382209, -1.240205, 3.219782, 1, 1, 1, 1, 1,
1.396093, 0.4660868, 1.159966, 1, 1, 1, 1, 1,
1.399997, 0.1331608, 2.085362, 1, 1, 1, 1, 1,
1.401246, -2.6499, 3.948298, 1, 1, 1, 1, 1,
1.406038, -1.044999, 1.135735, 1, 1, 1, 1, 1,
1.407332, -0.7336566, 2.090809, 1, 1, 1, 1, 1,
1.40817, 0.3192751, 2.283319, 1, 1, 1, 1, 1,
1.41667, 0.8172409, 1.280681, 1, 1, 1, 1, 1,
1.41692, 1.10919, 1.714484, 1, 1, 1, 1, 1,
1.423365, -0.356237, 2.05366, 1, 1, 1, 1, 1,
1.429353, 0.2959168, 2.600614, 1, 1, 1, 1, 1,
1.444691, -0.04999144, 0.8338684, 1, 1, 1, 1, 1,
1.451788, -0.1450616, 0.003102473, 1, 1, 1, 1, 1,
1.454081, -0.4873304, 2.100657, 1, 1, 1, 1, 1,
1.479705, -0.8580191, 1.541103, 0, 0, 1, 1, 1,
1.481214, 1.046508, 0.5591919, 1, 0, 0, 1, 1,
1.501812, 0.4865261, 0.9341575, 1, 0, 0, 1, 1,
1.505582, 0.3838228, 2.734794, 1, 0, 0, 1, 1,
1.520644, -0.960108, 2.476948, 1, 0, 0, 1, 1,
1.54888, 0.7129855, 0.9420461, 1, 0, 0, 1, 1,
1.553828, 0.4197285, -0.2236875, 0, 0, 0, 1, 1,
1.561884, 1.104892, 1.212078, 0, 0, 0, 1, 1,
1.564252, 1.640033, -2.398806, 0, 0, 0, 1, 1,
1.58295, 0.7971969, 0.6151993, 0, 0, 0, 1, 1,
1.583479, 0.3750835, 2.26875, 0, 0, 0, 1, 1,
1.588316, 0.0878164, 1.533984, 0, 0, 0, 1, 1,
1.597064, 0.6051298, 2.691326, 0, 0, 0, 1, 1,
1.59952, -1.822421, 2.583581, 1, 1, 1, 1, 1,
1.603134, 1.869064, -0.07716911, 1, 1, 1, 1, 1,
1.606192, -0.3788476, 2.198931, 1, 1, 1, 1, 1,
1.606203, -1.127193, 2.004495, 1, 1, 1, 1, 1,
1.608289, -0.2621225, 2.753301, 1, 1, 1, 1, 1,
1.608341, -1.835434, 1.895644, 1, 1, 1, 1, 1,
1.609889, 1.188851, 0.3196949, 1, 1, 1, 1, 1,
1.611751, 0.2578455, 1.218444, 1, 1, 1, 1, 1,
1.612855, 0.7093533, 0.8607641, 1, 1, 1, 1, 1,
1.615364, -0.1683391, 0.1211689, 1, 1, 1, 1, 1,
1.638315, 0.03948528, 2.514043, 1, 1, 1, 1, 1,
1.698663, 0.02921464, 1.590841, 1, 1, 1, 1, 1,
1.736243, 0.3977765, 2.721262, 1, 1, 1, 1, 1,
1.741327, -1.183738, 0.3409316, 1, 1, 1, 1, 1,
1.7441, -0.09055811, 3.486236, 1, 1, 1, 1, 1,
1.747279, 0.0772457, 1.500777, 0, 0, 1, 1, 1,
1.752638, -0.6536956, 1.338838, 1, 0, 0, 1, 1,
1.8132, -0.9142257, 2.434242, 1, 0, 0, 1, 1,
1.82162, -0.3985689, 2.141814, 1, 0, 0, 1, 1,
1.846427, 0.5959975, 0.6133849, 1, 0, 0, 1, 1,
1.849385, -1.585796, 3.194258, 1, 0, 0, 1, 1,
1.856939, -0.4892253, 2.897429, 0, 0, 0, 1, 1,
1.865503, 1.801486, 1.992347, 0, 0, 0, 1, 1,
1.881217, -1.233343, 1.337947, 0, 0, 0, 1, 1,
1.909877, -1.293593, 2.853362, 0, 0, 0, 1, 1,
1.929456, 0.3020422, 2.11632, 0, 0, 0, 1, 1,
1.943247, -1.077209, 1.198503, 0, 0, 0, 1, 1,
1.950413, -1.714567, 1.626898, 0, 0, 0, 1, 1,
1.974382, -0.129758, 1.782166, 1, 1, 1, 1, 1,
1.97484, 0.3575579, 0.2620414, 1, 1, 1, 1, 1,
1.985054, -0.6134742, 2.217961, 1, 1, 1, 1, 1,
1.988991, -0.7989966, 1.395484, 1, 1, 1, 1, 1,
2.023498, -1.018863, 2.089023, 1, 1, 1, 1, 1,
2.024611, 1.460262, 0.7533274, 1, 1, 1, 1, 1,
2.085357, 0.6268809, 1.875277, 1, 1, 1, 1, 1,
2.089076, -0.09858339, 2.152351, 1, 1, 1, 1, 1,
2.09887, 0.8238062, 1.49475, 1, 1, 1, 1, 1,
2.110842, -0.2820481, 1.737049, 1, 1, 1, 1, 1,
2.122514, -0.9818424, 3.066356, 1, 1, 1, 1, 1,
2.134604, -1.98202, 2.974951, 1, 1, 1, 1, 1,
2.141523, -1.157083, 3.449392, 1, 1, 1, 1, 1,
2.142878, -1.215172, 2.22239, 1, 1, 1, 1, 1,
2.16167, 0.6338998, 1.936428, 1, 1, 1, 1, 1,
2.204616, 0.1170783, 2.141924, 0, 0, 1, 1, 1,
2.210725, -0.04861853, 2.711483, 1, 0, 0, 1, 1,
2.213291, -0.7822108, 2.113789, 1, 0, 0, 1, 1,
2.249458, 0.3307471, 2.765133, 1, 0, 0, 1, 1,
2.264989, -0.0498236, 1.547482, 1, 0, 0, 1, 1,
2.270236, 0.347667, 2.66532, 1, 0, 0, 1, 1,
2.284128, -0.2247407, 0.9498512, 0, 0, 0, 1, 1,
2.348836, 1.841052, 1.563635, 0, 0, 0, 1, 1,
2.383563, 0.4369076, -0.227701, 0, 0, 0, 1, 1,
2.418641, 2.499886, 0.3926931, 0, 0, 0, 1, 1,
2.456233, -0.7493401, 1.695469, 0, 0, 0, 1, 1,
2.462632, 2.014439, 0.2636489, 0, 0, 0, 1, 1,
2.490968, -0.06202928, 0.5884896, 0, 0, 0, 1, 1,
2.693059, -0.3484758, 0.8767493, 1, 1, 1, 1, 1,
2.719699, -0.1863425, 2.924077, 1, 1, 1, 1, 1,
2.768241, 0.6474341, 2.457474, 1, 1, 1, 1, 1,
2.804764, 1.480819, 1.125251, 1, 1, 1, 1, 1,
3.014829, 0.6445029, 1.589403, 1, 1, 1, 1, 1,
3.148972, -0.9178094, 3.436435, 1, 1, 1, 1, 1,
3.189897, 0.744108, 0.6946542, 1, 1, 1, 1, 1
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
var radius = 9.277787;
var distance = 32.58783;
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
mvMatrix.translate( 0.1824415, -0.1125616, -0.3949933 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.58783);
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
