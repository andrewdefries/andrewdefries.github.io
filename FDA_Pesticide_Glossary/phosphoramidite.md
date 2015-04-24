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
-3.890852, -1.609477, -3.382145, 1, 0, 0, 1,
-2.809677, 0.9100389, -0.5939435, 1, 0.007843138, 0, 1,
-2.783267, -0.3327332, -1.944301, 1, 0.01176471, 0, 1,
-2.770332, 0.5770187, -2.266735, 1, 0.01960784, 0, 1,
-2.645499, -0.7478183, -2.128538, 1, 0.02352941, 0, 1,
-2.64538, -1.992333, -2.677236, 1, 0.03137255, 0, 1,
-2.569354, -0.1104543, -1.102659, 1, 0.03529412, 0, 1,
-2.414499, 0.0002938217, -3.264259, 1, 0.04313726, 0, 1,
-2.334885, 2.528829, -1.751074, 1, 0.04705882, 0, 1,
-2.332726, 0.04948213, -1.430845, 1, 0.05490196, 0, 1,
-2.332617, 0.3169265, -1.880791, 1, 0.05882353, 0, 1,
-2.24232, -0.9696457, -3.818394, 1, 0.06666667, 0, 1,
-2.192413, -0.4228711, -3.402274, 1, 0.07058824, 0, 1,
-2.18178, -1.150063, -2.420938, 1, 0.07843138, 0, 1,
-2.178456, 1.01202, -1.575606, 1, 0.08235294, 0, 1,
-2.164986, 0.3535903, -1.12883, 1, 0.09019608, 0, 1,
-2.147719, 0.5353078, -3.181031, 1, 0.09411765, 0, 1,
-2.122111, -0.6860172, -4.162159, 1, 0.1019608, 0, 1,
-2.058707, 1.697041, 0.05643534, 1, 0.1098039, 0, 1,
-2.052773, -2.20846, -3.239768, 1, 0.1137255, 0, 1,
-2.025868, 0.6014262, 1.154504, 1, 0.1215686, 0, 1,
-2.017339, 0.04676666, -3.292804, 1, 0.1254902, 0, 1,
-2.005123, -0.3589477, -0.8356274, 1, 0.1333333, 0, 1,
-2.003961, -1.002838, -0.6412706, 1, 0.1372549, 0, 1,
-1.994453, -1.391059, -2.302617, 1, 0.145098, 0, 1,
-1.99229, -0.4504057, -1.531168, 1, 0.1490196, 0, 1,
-1.975905, -0.8107963, -1.807432, 1, 0.1568628, 0, 1,
-1.967039, -0.2151205, -1.644161, 1, 0.1607843, 0, 1,
-1.961594, 0.04354412, -3.384697, 1, 0.1686275, 0, 1,
-1.957781, 1.212077, -0.1311865, 1, 0.172549, 0, 1,
-1.948979, -2.014055, -1.212732, 1, 0.1803922, 0, 1,
-1.922582, -0.1520476, -1.28074, 1, 0.1843137, 0, 1,
-1.908895, -0.782562, -2.652656, 1, 0.1921569, 0, 1,
-1.891278, 0.6706071, -0.7328176, 1, 0.1960784, 0, 1,
-1.862796, -1.147376, -2.360486, 1, 0.2039216, 0, 1,
-1.848093, -0.7041907, -1.54648, 1, 0.2117647, 0, 1,
-1.827772, -0.5029374, -2.077078, 1, 0.2156863, 0, 1,
-1.811096, 0.4709451, -2.566939, 1, 0.2235294, 0, 1,
-1.804592, -0.3885529, -1.077858, 1, 0.227451, 0, 1,
-1.801383, -0.8915788, -1.533526, 1, 0.2352941, 0, 1,
-1.781725, 1.543421, -1.13238, 1, 0.2392157, 0, 1,
-1.758353, -0.453964, -3.174619, 1, 0.2470588, 0, 1,
-1.746687, -1.531659, -1.03256, 1, 0.2509804, 0, 1,
-1.742522, 0.1971909, -1.512074, 1, 0.2588235, 0, 1,
-1.737798, -1.404472, -2.865694, 1, 0.2627451, 0, 1,
-1.724428, -0.1508627, -0.3639208, 1, 0.2705882, 0, 1,
-1.719272, 1.054874, -2.239397, 1, 0.2745098, 0, 1,
-1.681207, 0.1338051, -2.747124, 1, 0.282353, 0, 1,
-1.670836, -0.630203, -2.42037, 1, 0.2862745, 0, 1,
-1.647028, -0.3881196, -2.809695, 1, 0.2941177, 0, 1,
-1.642413, 0.09529981, -2.486202, 1, 0.3019608, 0, 1,
-1.636907, 0.5372351, -1.2186, 1, 0.3058824, 0, 1,
-1.618104, -1.438701, -3.657001, 1, 0.3137255, 0, 1,
-1.617053, 0.4006494, -0.4392999, 1, 0.3176471, 0, 1,
-1.612573, -0.09556597, -1.139457, 1, 0.3254902, 0, 1,
-1.602749, 0.3413275, -1.026387, 1, 0.3294118, 0, 1,
-1.601234, -0.630931, -1.680203, 1, 0.3372549, 0, 1,
-1.590628, -0.1632778, -0.7982583, 1, 0.3411765, 0, 1,
-1.590023, 1.42719, -1.584852, 1, 0.3490196, 0, 1,
-1.566601, 1.383972, -2.508236, 1, 0.3529412, 0, 1,
-1.555052, 2.442409, -0.8409861, 1, 0.3607843, 0, 1,
-1.550283, 0.4995733, -1.51385, 1, 0.3647059, 0, 1,
-1.521035, 0.9688359, -1.836852, 1, 0.372549, 0, 1,
-1.52038, 1.616029, -0.9155678, 1, 0.3764706, 0, 1,
-1.518996, 1.40907, -2.51905, 1, 0.3843137, 0, 1,
-1.517994, 0.647328, -1.356773, 1, 0.3882353, 0, 1,
-1.515933, -0.1253579, -2.956969, 1, 0.3960784, 0, 1,
-1.509634, 0.6546287, 1.216108, 1, 0.4039216, 0, 1,
-1.506747, 0.2273359, -1.273415, 1, 0.4078431, 0, 1,
-1.496691, 0.7640928, -0.9404628, 1, 0.4156863, 0, 1,
-1.486754, -0.3447615, -1.190592, 1, 0.4196078, 0, 1,
-1.483143, -0.5524527, -0.6300187, 1, 0.427451, 0, 1,
-1.482246, -0.291505, -3.793248, 1, 0.4313726, 0, 1,
-1.480072, 0.4976322, -1.798858, 1, 0.4392157, 0, 1,
-1.471635, -0.5609569, -3.136473, 1, 0.4431373, 0, 1,
-1.466917, 0.5424016, -0.3500721, 1, 0.4509804, 0, 1,
-1.451602, 1.539005, -0.6315458, 1, 0.454902, 0, 1,
-1.425727, -0.03646579, -2.051837, 1, 0.4627451, 0, 1,
-1.423149, -2.409122, -2.044068, 1, 0.4666667, 0, 1,
-1.407058, 1.677367, -0.7680358, 1, 0.4745098, 0, 1,
-1.403203, -0.4771648, -1.875052, 1, 0.4784314, 0, 1,
-1.3976, -0.8630653, -1.125128, 1, 0.4862745, 0, 1,
-1.393717, -0.02228412, -1.007566, 1, 0.4901961, 0, 1,
-1.388123, -0.9898002, -3.980588, 1, 0.4980392, 0, 1,
-1.368124, -0.496543, -2.216902, 1, 0.5058824, 0, 1,
-1.364608, -0.09317537, -2.548045, 1, 0.509804, 0, 1,
-1.363536, -0.1345769, -2.642197, 1, 0.5176471, 0, 1,
-1.350859, -0.6798169, -2.936097, 1, 0.5215687, 0, 1,
-1.344826, -0.0597082, -1.963165, 1, 0.5294118, 0, 1,
-1.344556, -1.31721, -2.270768, 1, 0.5333334, 0, 1,
-1.341313, -1.517485, -4.393661, 1, 0.5411765, 0, 1,
-1.338228, 1.11045, 0.530874, 1, 0.5450981, 0, 1,
-1.323748, 0.8284733, -1.020011, 1, 0.5529412, 0, 1,
-1.322673, -0.8185262, -3.178143, 1, 0.5568628, 0, 1,
-1.319431, 0.5520657, -0.4420436, 1, 0.5647059, 0, 1,
-1.31444, -1.186196, -2.768959, 1, 0.5686275, 0, 1,
-1.308677, 0.9737827, -2.406294, 1, 0.5764706, 0, 1,
-1.307534, -0.4821042, -0.3924507, 1, 0.5803922, 0, 1,
-1.30619, -1.372466, -1.738621, 1, 0.5882353, 0, 1,
-1.279431, 0.07229103, -3.366136, 1, 0.5921569, 0, 1,
-1.252671, 0.7284589, -0.762805, 1, 0.6, 0, 1,
-1.229311, 0.2884173, -1.535153, 1, 0.6078432, 0, 1,
-1.227773, -1.809249, -1.475441, 1, 0.6117647, 0, 1,
-1.224063, -0.0644105, -1.79188, 1, 0.6196079, 0, 1,
-1.211819, 0.1008607, -1.300127, 1, 0.6235294, 0, 1,
-1.200683, -0.9220085, -2.535287, 1, 0.6313726, 0, 1,
-1.193837, 1.61522, 1.084575, 1, 0.6352941, 0, 1,
-1.190179, 0.6881527, -0.3251677, 1, 0.6431373, 0, 1,
-1.186413, 1.282782, -0.9558418, 1, 0.6470588, 0, 1,
-1.177792, -0.08149374, -0.5555351, 1, 0.654902, 0, 1,
-1.177779, 0.3453256, -1.72213, 1, 0.6588235, 0, 1,
-1.176251, -1.47143, -2.271659, 1, 0.6666667, 0, 1,
-1.171501, 1.518358, -1.684777, 1, 0.6705883, 0, 1,
-1.171437, 0.07194885, -1.970684, 1, 0.6784314, 0, 1,
-1.162061, 0.03514281, -2.599367, 1, 0.682353, 0, 1,
-1.150133, -0.7043329, -1.138393, 1, 0.6901961, 0, 1,
-1.148555, -0.3843533, -2.916061, 1, 0.6941177, 0, 1,
-1.145273, -0.8196549, -2.84071, 1, 0.7019608, 0, 1,
-1.134521, -0.7311169, -0.8847676, 1, 0.7098039, 0, 1,
-1.122024, 0.16256, 0.1084509, 1, 0.7137255, 0, 1,
-1.121851, -1.118695, -3.053135, 1, 0.7215686, 0, 1,
-1.117363, -0.5914828, -0.5127869, 1, 0.7254902, 0, 1,
-1.115758, 1.964256, -1.200512, 1, 0.7333333, 0, 1,
-1.112093, -0.0661834, -2.775359, 1, 0.7372549, 0, 1,
-1.111936, -0.8130056, -1.068447, 1, 0.7450981, 0, 1,
-1.10921, 0.5716709, -1.8843, 1, 0.7490196, 0, 1,
-1.099, 0.272315, -1.311868, 1, 0.7568628, 0, 1,
-1.093874, -0.7598585, -2.691267, 1, 0.7607843, 0, 1,
-1.093133, 0.02193261, -2.437068, 1, 0.7686275, 0, 1,
-1.093042, 0.03062062, -2.645806, 1, 0.772549, 0, 1,
-1.092632, -1.387884, -2.245131, 1, 0.7803922, 0, 1,
-1.089856, -0.8663028, -1.891995, 1, 0.7843137, 0, 1,
-1.089747, -1.939976, -1.108961, 1, 0.7921569, 0, 1,
-1.089589, -0.6253845, -1.744667, 1, 0.7960784, 0, 1,
-1.087117, -0.6255957, -3.599456, 1, 0.8039216, 0, 1,
-1.084902, 0.4628225, -2.517396, 1, 0.8117647, 0, 1,
-1.081784, -0.2879419, -2.12544, 1, 0.8156863, 0, 1,
-1.077468, 0.8477781, -1.325129, 1, 0.8235294, 0, 1,
-1.069093, -0.8296065, -2.241843, 1, 0.827451, 0, 1,
-1.06688, 0.4087364, -0.7915974, 1, 0.8352941, 0, 1,
-1.058586, 0.3119037, -0.1429584, 1, 0.8392157, 0, 1,
-1.054515, -1.0194, -1.046896, 1, 0.8470588, 0, 1,
-1.046677, -0.1339801, -2.497048, 1, 0.8509804, 0, 1,
-1.037111, -0.1285802, -1.725878, 1, 0.8588235, 0, 1,
-1.034541, 0.2946575, -0.3263356, 1, 0.8627451, 0, 1,
-1.032352, 0.8266577, 0.1261529, 1, 0.8705882, 0, 1,
-1.02793, 0.3876077, -1.359773, 1, 0.8745098, 0, 1,
-1.026457, 0.2761689, -2.266173, 1, 0.8823529, 0, 1,
-1.023791, -0.5849513, -2.335393, 1, 0.8862745, 0, 1,
-1.005472, 0.4384797, -2.820021, 1, 0.8941177, 0, 1,
-1.005264, 1.302256, -0.6943202, 1, 0.8980392, 0, 1,
-1.005051, 0.232078, -1.703452, 1, 0.9058824, 0, 1,
-1.002962, 0.6542461, 0.6081427, 1, 0.9137255, 0, 1,
-0.9961687, -0.2212341, -2.215926, 1, 0.9176471, 0, 1,
-0.9954666, 0.4133878, -1.735555, 1, 0.9254902, 0, 1,
-0.9911193, -0.4682656, -1.301996, 1, 0.9294118, 0, 1,
-0.9851584, -1.162232, -2.088434, 1, 0.9372549, 0, 1,
-0.9819606, -0.3449138, -1.775697, 1, 0.9411765, 0, 1,
-0.9803464, -1.893938, -1.464166, 1, 0.9490196, 0, 1,
-0.9802865, -2.768612, -1.804455, 1, 0.9529412, 0, 1,
-0.9790698, -0.4575773, -3.079144, 1, 0.9607843, 0, 1,
-0.9729955, -0.5369761, -4.169897, 1, 0.9647059, 0, 1,
-0.9719853, 0.1911529, -1.300325, 1, 0.972549, 0, 1,
-0.9700409, -1.107043, -4.610165, 1, 0.9764706, 0, 1,
-0.9695889, 1.148712, 0.2523591, 1, 0.9843137, 0, 1,
-0.9649869, -0.8529394, -2.700721, 1, 0.9882353, 0, 1,
-0.9644215, -0.5748609, -1.430121, 1, 0.9960784, 0, 1,
-0.9543939, -0.2691636, 0.215687, 0.9960784, 1, 0, 1,
-0.9528612, 0.8782983, 0.2226572, 0.9921569, 1, 0, 1,
-0.9522061, -0.4842133, -2.142219, 0.9843137, 1, 0, 1,
-0.9375048, 0.1079975, -1.353289, 0.9803922, 1, 0, 1,
-0.9355141, -0.7005163, -2.043384, 0.972549, 1, 0, 1,
-0.9344592, 1.597915, -2.048058, 0.9686275, 1, 0, 1,
-0.931406, -0.438253, -0.321548, 0.9607843, 1, 0, 1,
-0.930327, -0.4886839, -2.232185, 0.9568627, 1, 0, 1,
-0.919634, -0.5366483, -2.722893, 0.9490196, 1, 0, 1,
-0.9185061, -0.7615159, -2.598483, 0.945098, 1, 0, 1,
-0.9171031, -0.7847143, -2.986157, 0.9372549, 1, 0, 1,
-0.9170412, 0.8078781, -0.2458856, 0.9333333, 1, 0, 1,
-0.9152687, -1.037614, -1.459027, 0.9254902, 1, 0, 1,
-0.9020741, -2.994701, -3.981441, 0.9215686, 1, 0, 1,
-0.887248, -1.2535, -3.093206, 0.9137255, 1, 0, 1,
-0.8854356, 1.040054, -1.541199, 0.9098039, 1, 0, 1,
-0.8850306, -1.475757, -2.249461, 0.9019608, 1, 0, 1,
-0.884379, 0.4921199, -0.6588023, 0.8941177, 1, 0, 1,
-0.8644214, -1.598759, -1.035727, 0.8901961, 1, 0, 1,
-0.8641627, 1.386269, -0.5166531, 0.8823529, 1, 0, 1,
-0.8635704, 0.7597873, -1.541654, 0.8784314, 1, 0, 1,
-0.8624411, -0.2454813, -3.489089, 0.8705882, 1, 0, 1,
-0.859822, -0.1288964, -1.498599, 0.8666667, 1, 0, 1,
-0.8595507, -1.890985, -2.501049, 0.8588235, 1, 0, 1,
-0.8546501, -0.7176854, -3.085056, 0.854902, 1, 0, 1,
-0.8540797, -0.771057, -2.715799, 0.8470588, 1, 0, 1,
-0.8539534, -0.54092, -2.03114, 0.8431373, 1, 0, 1,
-0.8536295, -0.478852, -0.789369, 0.8352941, 1, 0, 1,
-0.8486969, 0.8238627, 0.8961869, 0.8313726, 1, 0, 1,
-0.843571, -1.313759, -1.455731, 0.8235294, 1, 0, 1,
-0.8403776, -0.9881764, -3.068265, 0.8196079, 1, 0, 1,
-0.8393866, -0.5810905, -1.400551, 0.8117647, 1, 0, 1,
-0.8365865, 0.5581559, -1.413842, 0.8078431, 1, 0, 1,
-0.8337483, -1.621938, -3.464956, 0.8, 1, 0, 1,
-0.8319016, -0.07694882, -1.701196, 0.7921569, 1, 0, 1,
-0.8226147, -0.2819266, -2.83864, 0.7882353, 1, 0, 1,
-0.8213486, -1.853649, -4.044384, 0.7803922, 1, 0, 1,
-0.8167297, 0.2633163, -1.655015, 0.7764706, 1, 0, 1,
-0.8146306, 0.719986, -1.554018, 0.7686275, 1, 0, 1,
-0.8073477, -1.411017, -1.42868, 0.7647059, 1, 0, 1,
-0.8060477, 1.063881, -1.68689, 0.7568628, 1, 0, 1,
-0.8058919, 1.007918, -0.1464413, 0.7529412, 1, 0, 1,
-0.8023545, -0.3490649, -0.5151239, 0.7450981, 1, 0, 1,
-0.7994538, 1.676539, -1.560705, 0.7411765, 1, 0, 1,
-0.7987527, 0.135978, -1.423895, 0.7333333, 1, 0, 1,
-0.795145, 0.4433007, -0.3508824, 0.7294118, 1, 0, 1,
-0.7919134, 0.6109617, -1.248505, 0.7215686, 1, 0, 1,
-0.7902024, 0.272689, -0.7346247, 0.7176471, 1, 0, 1,
-0.7653496, 2.310721, 0.1159442, 0.7098039, 1, 0, 1,
-0.7638766, -2.104724, -3.208098, 0.7058824, 1, 0, 1,
-0.7623925, -1.013727, -3.461652, 0.6980392, 1, 0, 1,
-0.7609913, 0.8890396, 0.119149, 0.6901961, 1, 0, 1,
-0.7602176, 1.297492, -1.867198, 0.6862745, 1, 0, 1,
-0.7558849, 0.3100222, -0.2920648, 0.6784314, 1, 0, 1,
-0.7523149, 0.9093099, -0.1657067, 0.6745098, 1, 0, 1,
-0.7516266, 1.09893, 0.06842545, 0.6666667, 1, 0, 1,
-0.7493208, -1.017776, -2.325393, 0.6627451, 1, 0, 1,
-0.7480232, 1.928963, -0.2567506, 0.654902, 1, 0, 1,
-0.7465884, -0.9709147, -2.453094, 0.6509804, 1, 0, 1,
-0.7463226, 0.2895955, -1.320401, 0.6431373, 1, 0, 1,
-0.7409474, 0.4626964, -0.3468576, 0.6392157, 1, 0, 1,
-0.738518, -0.9795266, -1.11982, 0.6313726, 1, 0, 1,
-0.7359898, -1.022069, -4.28968, 0.627451, 1, 0, 1,
-0.7315455, -0.6950974, -2.106068, 0.6196079, 1, 0, 1,
-0.7290379, -0.4279592, -2.2972, 0.6156863, 1, 0, 1,
-0.7264501, 1.099097, -0.6921287, 0.6078432, 1, 0, 1,
-0.7258788, 0.2368726, -3.031613, 0.6039216, 1, 0, 1,
-0.7236462, -0.7417843, -1.917355, 0.5960785, 1, 0, 1,
-0.7232247, -0.3846878, -2.557037, 0.5882353, 1, 0, 1,
-0.7223437, -0.8499715, -2.248794, 0.5843138, 1, 0, 1,
-0.7198631, 0.3649444, -1.463105, 0.5764706, 1, 0, 1,
-0.7190625, 0.9109747, -0.2016375, 0.572549, 1, 0, 1,
-0.7182398, 0.1858912, -1.259751, 0.5647059, 1, 0, 1,
-0.7180122, -0.01724361, -2.852825, 0.5607843, 1, 0, 1,
-0.7172924, 0.5766079, 0.5947515, 0.5529412, 1, 0, 1,
-0.7153223, 0.445785, -0.9307471, 0.5490196, 1, 0, 1,
-0.7145408, -0.08789191, -1.335823, 0.5411765, 1, 0, 1,
-0.706367, 1.918696, 0.7917237, 0.5372549, 1, 0, 1,
-0.6989449, -1.284256, -1.034327, 0.5294118, 1, 0, 1,
-0.6947993, -0.2085361, -2.385217, 0.5254902, 1, 0, 1,
-0.6932728, -0.7912409, -1.720633, 0.5176471, 1, 0, 1,
-0.692142, -0.4432693, -3.461422, 0.5137255, 1, 0, 1,
-0.6920556, 0.542457, -0.7168392, 0.5058824, 1, 0, 1,
-0.6898525, 1.403942, 0.9428451, 0.5019608, 1, 0, 1,
-0.6865677, 0.2811649, -2.260028, 0.4941176, 1, 0, 1,
-0.680725, -0.6634129, -1.914325, 0.4862745, 1, 0, 1,
-0.680623, 1.333144, -1.12904, 0.4823529, 1, 0, 1,
-0.6799049, 0.54772, -2.130036, 0.4745098, 1, 0, 1,
-0.6795619, -1.564047, -3.875062, 0.4705882, 1, 0, 1,
-0.6763303, 0.817331, -1.717157, 0.4627451, 1, 0, 1,
-0.6730136, -0.003708199, -1.278569, 0.4588235, 1, 0, 1,
-0.6715248, 0.7643233, 0.6823351, 0.4509804, 1, 0, 1,
-0.6708232, -0.9188021, -1.368432, 0.4470588, 1, 0, 1,
-0.6666592, -0.1606923, -1.092439, 0.4392157, 1, 0, 1,
-0.6646802, -0.5756009, -0.8681859, 0.4352941, 1, 0, 1,
-0.6644038, -0.5538041, -1.169261, 0.427451, 1, 0, 1,
-0.6621617, -0.966494, -2.598639, 0.4235294, 1, 0, 1,
-0.6514595, 1.006183, -1.882951, 0.4156863, 1, 0, 1,
-0.6475589, 0.5757559, 2.45104, 0.4117647, 1, 0, 1,
-0.6473397, 0.604992, -0.5945572, 0.4039216, 1, 0, 1,
-0.6426381, -0.7682262, -1.966832, 0.3960784, 1, 0, 1,
-0.6388822, 0.4524824, 0.02202433, 0.3921569, 1, 0, 1,
-0.6381619, -0.6269342, -2.309498, 0.3843137, 1, 0, 1,
-0.632024, 0.3383515, 0.947333, 0.3803922, 1, 0, 1,
-0.6302345, -0.4523673, -2.407161, 0.372549, 1, 0, 1,
-0.6279433, 0.9853544, -0.8912399, 0.3686275, 1, 0, 1,
-0.6263924, 0.6649212, -0.8587493, 0.3607843, 1, 0, 1,
-0.6244036, 0.7874426, -0.5274612, 0.3568628, 1, 0, 1,
-0.6211274, -0.3744637, -3.327666, 0.3490196, 1, 0, 1,
-0.6186961, -0.0239244, -1.072046, 0.345098, 1, 0, 1,
-0.6163445, 0.4292704, 0.0701601, 0.3372549, 1, 0, 1,
-0.615675, -0.9740807, -3.56277, 0.3333333, 1, 0, 1,
-0.6123736, 0.3527673, -2.551863, 0.3254902, 1, 0, 1,
-0.5940847, 0.03420123, -1.686071, 0.3215686, 1, 0, 1,
-0.5855854, -1.115214, -2.878551, 0.3137255, 1, 0, 1,
-0.5775666, -1.109343, -0.4606847, 0.3098039, 1, 0, 1,
-0.57718, 0.9876921, -0.3163717, 0.3019608, 1, 0, 1,
-0.5725281, 0.6681579, -0.1381379, 0.2941177, 1, 0, 1,
-0.5717399, 2.170275, 0.7345042, 0.2901961, 1, 0, 1,
-0.5628676, 0.2191507, -0.7534294, 0.282353, 1, 0, 1,
-0.5592036, 0.07512281, -1.266715, 0.2784314, 1, 0, 1,
-0.5583026, -1.212639, -2.278152, 0.2705882, 1, 0, 1,
-0.5523875, 0.07208858, -1.774636, 0.2666667, 1, 0, 1,
-0.549733, -0.9405823, -1.977385, 0.2588235, 1, 0, 1,
-0.5455726, -0.738521, -1.414795, 0.254902, 1, 0, 1,
-0.5444418, -0.1937121, -1.80917, 0.2470588, 1, 0, 1,
-0.5412782, 0.2271014, -2.47144, 0.2431373, 1, 0, 1,
-0.540392, -0.3564556, -2.875209, 0.2352941, 1, 0, 1,
-0.5383886, -1.065052, -3.541741, 0.2313726, 1, 0, 1,
-0.5375129, 0.8615214, -0.6967688, 0.2235294, 1, 0, 1,
-0.5369216, -0.4197547, -2.650219, 0.2196078, 1, 0, 1,
-0.5354928, -0.9125529, -0.842881, 0.2117647, 1, 0, 1,
-0.5320486, 0.7100098, -1.455335, 0.2078431, 1, 0, 1,
-0.5295826, -0.077851, -3.792693, 0.2, 1, 0, 1,
-0.5276365, -0.27101, -3.418772, 0.1921569, 1, 0, 1,
-0.5253765, -1.350162, -2.33176, 0.1882353, 1, 0, 1,
-0.5248492, 1.489569, -1.991485, 0.1803922, 1, 0, 1,
-0.5236011, 0.4576695, 1.501411, 0.1764706, 1, 0, 1,
-0.5127497, -0.3744204, -3.616361, 0.1686275, 1, 0, 1,
-0.510353, 1.090259, -1.281492, 0.1647059, 1, 0, 1,
-0.5091017, 0.8672739, -1.252611, 0.1568628, 1, 0, 1,
-0.496561, -0.01345369, -1.609334, 0.1529412, 1, 0, 1,
-0.4922866, -0.03392373, -2.15679, 0.145098, 1, 0, 1,
-0.491921, -0.04483788, -2.937481, 0.1411765, 1, 0, 1,
-0.4897133, -0.344219, -2.213151, 0.1333333, 1, 0, 1,
-0.4873835, -0.8690026, -2.672166, 0.1294118, 1, 0, 1,
-0.487053, 0.4913003, -0.7272753, 0.1215686, 1, 0, 1,
-0.4868992, 0.4706931, 0.2426167, 0.1176471, 1, 0, 1,
-0.4864789, -1.116768, -1.528519, 0.1098039, 1, 0, 1,
-0.4846466, 1.017262, 0.5077153, 0.1058824, 1, 0, 1,
-0.4841715, -2.07762, -2.443468, 0.09803922, 1, 0, 1,
-0.483057, 1.148131, -2.608779, 0.09019608, 1, 0, 1,
-0.4824591, -1.489661, -4.133457, 0.08627451, 1, 0, 1,
-0.4726875, 1.689764, 0.8735422, 0.07843138, 1, 0, 1,
-0.466826, -0.9682435, -2.326571, 0.07450981, 1, 0, 1,
-0.4647427, -0.8527541, -2.148955, 0.06666667, 1, 0, 1,
-0.4642928, 1.800478, -0.4514572, 0.0627451, 1, 0, 1,
-0.4590157, 0.3502556, -1.496401, 0.05490196, 1, 0, 1,
-0.4589914, 0.1396998, -0.04874787, 0.05098039, 1, 0, 1,
-0.4576921, 1.910287, 1.93841, 0.04313726, 1, 0, 1,
-0.4548685, -0.667834, -2.942379, 0.03921569, 1, 0, 1,
-0.4544676, -2.265998, -3.288745, 0.03137255, 1, 0, 1,
-0.4534046, 1.239802, 1.200522, 0.02745098, 1, 0, 1,
-0.4475263, 0.6710716, 1.080475, 0.01960784, 1, 0, 1,
-0.4473321, -0.4458087, -1.951581, 0.01568628, 1, 0, 1,
-0.4434105, 1.18912, -0.339343, 0.007843138, 1, 0, 1,
-0.4392395, -0.6655231, -1.693566, 0.003921569, 1, 0, 1,
-0.4367417, -1.063321, -2.169345, 0, 1, 0.003921569, 1,
-0.4332514, 0.1563374, -2.808216, 0, 1, 0.01176471, 1,
-0.4324971, -1.353595, -2.02756, 0, 1, 0.01568628, 1,
-0.4290131, -0.7479926, -2.058976, 0, 1, 0.02352941, 1,
-0.4266382, 0.7004885, 1.120048, 0, 1, 0.02745098, 1,
-0.4214403, -0.9194362, -1.500407, 0, 1, 0.03529412, 1,
-0.4205721, -1.404221, -1.378886, 0, 1, 0.03921569, 1,
-0.4190102, 0.5821463, 0.3837577, 0, 1, 0.04705882, 1,
-0.4157205, -0.8699002, -2.859633, 0, 1, 0.05098039, 1,
-0.4154259, -0.2587079, -3.33005, 0, 1, 0.05882353, 1,
-0.4136975, 0.8604763, 0.6672068, 0, 1, 0.0627451, 1,
-0.4127421, -0.397072, -2.220246, 0, 1, 0.07058824, 1,
-0.4107677, -1.326967, -2.863367, 0, 1, 0.07450981, 1,
-0.4027823, -1.117204, -2.1982, 0, 1, 0.08235294, 1,
-0.4023995, 1.071596, -1.690864, 0, 1, 0.08627451, 1,
-0.4008753, -0.5637136, -4.034677, 0, 1, 0.09411765, 1,
-0.3958975, -0.4233345, -1.032981, 0, 1, 0.1019608, 1,
-0.3930816, 0.208315, -0.939452, 0, 1, 0.1058824, 1,
-0.3929344, 2.032878, -0.307651, 0, 1, 0.1137255, 1,
-0.3919576, -0.5993419, -3.191844, 0, 1, 0.1176471, 1,
-0.3916256, -0.6232148, -2.952497, 0, 1, 0.1254902, 1,
-0.3802462, 0.3142652, 1.540022, 0, 1, 0.1294118, 1,
-0.3787393, -1.372409, -1.429004, 0, 1, 0.1372549, 1,
-0.3762532, 0.4415328, -0.2821177, 0, 1, 0.1411765, 1,
-0.3731897, 1.655404, 1.05403, 0, 1, 0.1490196, 1,
-0.3724438, 0.3404291, -1.613503, 0, 1, 0.1529412, 1,
-0.3652887, 0.3697972, -0.03211723, 0, 1, 0.1607843, 1,
-0.3639936, -0.6960118, -1.85128, 0, 1, 0.1647059, 1,
-0.3584317, 0.3775669, 0.216919, 0, 1, 0.172549, 1,
-0.3537429, -0.7054737, -2.987439, 0, 1, 0.1764706, 1,
-0.3518534, -1.425482, -3.381629, 0, 1, 0.1843137, 1,
-0.351401, 1.211076, -1.138722, 0, 1, 0.1882353, 1,
-0.3458861, -0.5022973, -1.365397, 0, 1, 0.1960784, 1,
-0.3434933, 0.193454, -1.302274, 0, 1, 0.2039216, 1,
-0.3427807, -0.5720939, -1.263157, 0, 1, 0.2078431, 1,
-0.342658, -0.3682963, -1.498014, 0, 1, 0.2156863, 1,
-0.3398291, 0.6212466, -2.585865, 0, 1, 0.2196078, 1,
-0.3353364, -0.3362498, -4.05292, 0, 1, 0.227451, 1,
-0.3258477, -3.622471, -4.147831, 0, 1, 0.2313726, 1,
-0.3253635, 0.7991922, -0.7880785, 0, 1, 0.2392157, 1,
-0.3250891, 1.419194, -1.612071, 0, 1, 0.2431373, 1,
-0.3230402, -0.2099717, -1.367839, 0, 1, 0.2509804, 1,
-0.3178735, 0.8959682, 0.332958, 0, 1, 0.254902, 1,
-0.3147725, 0.1971361, -1.111559, 0, 1, 0.2627451, 1,
-0.3126679, 0.9239191, 0.02142951, 0, 1, 0.2666667, 1,
-0.3094125, 0.7131585, 0.01931698, 0, 1, 0.2745098, 1,
-0.3061678, -1.143675, -3.378989, 0, 1, 0.2784314, 1,
-0.3048142, -1.099298, -3.02899, 0, 1, 0.2862745, 1,
-0.3030175, -0.5016899, -4.180681, 0, 1, 0.2901961, 1,
-0.3022169, 0.3108897, 0.3684316, 0, 1, 0.2980392, 1,
-0.3009855, -0.4500543, -2.077905, 0, 1, 0.3058824, 1,
-0.2978027, 1.86723, -1.907387, 0, 1, 0.3098039, 1,
-0.2976815, 1.451957, -0.05208569, 0, 1, 0.3176471, 1,
-0.2925793, -1.752325, -3.759302, 0, 1, 0.3215686, 1,
-0.2924187, 0.2906719, -0.9578451, 0, 1, 0.3294118, 1,
-0.2902296, 0.8115368, 0.2145831, 0, 1, 0.3333333, 1,
-0.287398, -0.4781222, -3.083935, 0, 1, 0.3411765, 1,
-0.2836949, -0.4858607, -0.6714314, 0, 1, 0.345098, 1,
-0.2818758, -1.62722, -3.105006, 0, 1, 0.3529412, 1,
-0.2785417, -0.7413797, -1.933578, 0, 1, 0.3568628, 1,
-0.277847, 0.6803975, 0.4752762, 0, 1, 0.3647059, 1,
-0.2761632, 0.310743, 0.5911141, 0, 1, 0.3686275, 1,
-0.274923, 1.507419, 0.651785, 0, 1, 0.3764706, 1,
-0.2742215, -1.489807, -3.544213, 0, 1, 0.3803922, 1,
-0.2716137, -0.8272883, -2.49778, 0, 1, 0.3882353, 1,
-0.2649276, 1.163067, -1.324368, 0, 1, 0.3921569, 1,
-0.2603365, 2.09438, -0.4120331, 0, 1, 0.4, 1,
-0.2591394, -0.3610849, -2.840271, 0, 1, 0.4078431, 1,
-0.2553188, 0.3576244, -1.307605, 0, 1, 0.4117647, 1,
-0.2546729, 0.1296356, -1.322863, 0, 1, 0.4196078, 1,
-0.2537754, 1.942856, -2.001298, 0, 1, 0.4235294, 1,
-0.2527882, -0.02355727, -0.9117157, 0, 1, 0.4313726, 1,
-0.251777, -1.382512, -4.620952, 0, 1, 0.4352941, 1,
-0.2463779, -0.2667636, -1.747047, 0, 1, 0.4431373, 1,
-0.2449207, 0.4889846, 0.08145302, 0, 1, 0.4470588, 1,
-0.2401033, -0.1013242, -2.11735, 0, 1, 0.454902, 1,
-0.2315997, -1.142401, -2.761756, 0, 1, 0.4588235, 1,
-0.227174, -1.650107, -2.762357, 0, 1, 0.4666667, 1,
-0.226223, 0.5893714, -1.842217, 0, 1, 0.4705882, 1,
-0.2229815, -0.7568722, -4.727984, 0, 1, 0.4784314, 1,
-0.2183133, 0.2981238, -1.098005, 0, 1, 0.4823529, 1,
-0.216374, -0.1701506, -0.4915818, 0, 1, 0.4901961, 1,
-0.2147855, 1.277036, -1.657712, 0, 1, 0.4941176, 1,
-0.2123069, -0.5471191, -3.469063, 0, 1, 0.5019608, 1,
-0.2111581, -1.86279, -2.535881, 0, 1, 0.509804, 1,
-0.2098961, -0.7562411, -4.000632, 0, 1, 0.5137255, 1,
-0.2065803, -0.3245684, -3.230339, 0, 1, 0.5215687, 1,
-0.2051037, -0.9057446, -2.528563, 0, 1, 0.5254902, 1,
-0.2029794, -1.47388, -3.849384, 0, 1, 0.5333334, 1,
-0.2028652, -0.4344485, -2.241807, 0, 1, 0.5372549, 1,
-0.1990447, 0.2035318, 0.346088, 0, 1, 0.5450981, 1,
-0.194875, -0.4764761, -1.99494, 0, 1, 0.5490196, 1,
-0.1929904, -0.8502187, -3.49504, 0, 1, 0.5568628, 1,
-0.1864917, -0.811312, -2.154491, 0, 1, 0.5607843, 1,
-0.1841257, 1.304683, 0.4862321, 0, 1, 0.5686275, 1,
-0.1813297, 0.5203405, 0.2262624, 0, 1, 0.572549, 1,
-0.1762779, 2.047381, -0.2729346, 0, 1, 0.5803922, 1,
-0.1752805, 0.2458957, -1.277472, 0, 1, 0.5843138, 1,
-0.1733709, 0.4957693, -0.9780293, 0, 1, 0.5921569, 1,
-0.1725473, 0.04579403, -1.49908, 0, 1, 0.5960785, 1,
-0.168778, -0.292207, -1.19543, 0, 1, 0.6039216, 1,
-0.168272, -0.3831168, -2.601183, 0, 1, 0.6117647, 1,
-0.1633339, 1.258583, 0.08735819, 0, 1, 0.6156863, 1,
-0.1621009, -1.060002, -4.304951, 0, 1, 0.6235294, 1,
-0.1582325, -0.5038564, -4.053031, 0, 1, 0.627451, 1,
-0.1539923, -2.313761, -3.654341, 0, 1, 0.6352941, 1,
-0.1502753, -0.9189415, -2.07956, 0, 1, 0.6392157, 1,
-0.1483923, 0.03159082, -1.71308, 0, 1, 0.6470588, 1,
-0.1465048, 0.621238, -0.7517523, 0, 1, 0.6509804, 1,
-0.1457388, 2.258836, -0.134689, 0, 1, 0.6588235, 1,
-0.1431047, -0.006080577, -1.758658, 0, 1, 0.6627451, 1,
-0.1418603, 1.312233, -0.6092471, 0, 1, 0.6705883, 1,
-0.14056, -0.6511028, -3.521792, 0, 1, 0.6745098, 1,
-0.1358338, 0.2976171, -0.6516494, 0, 1, 0.682353, 1,
-0.1347893, -1.236429, -3.149997, 0, 1, 0.6862745, 1,
-0.1342383, -1.329597, -2.611479, 0, 1, 0.6941177, 1,
-0.1217964, 0.3417296, -1.035663, 0, 1, 0.7019608, 1,
-0.1104698, 0.07189851, -0.102361, 0, 1, 0.7058824, 1,
-0.1078268, -0.8217334, -2.682708, 0, 1, 0.7137255, 1,
-0.1060017, 0.5504135, -0.4755275, 0, 1, 0.7176471, 1,
-0.1038415, 0.9108393, 0.877303, 0, 1, 0.7254902, 1,
-0.09888414, -1.406671, -3.308011, 0, 1, 0.7294118, 1,
-0.09236407, 1.013257, 1.248468, 0, 1, 0.7372549, 1,
-0.09104735, -1.208667, -2.53371, 0, 1, 0.7411765, 1,
-0.08796304, -0.3255865, -2.490722, 0, 1, 0.7490196, 1,
-0.08172744, -0.4687864, -4.33991, 0, 1, 0.7529412, 1,
-0.08127306, 1.024447, 1.509811, 0, 1, 0.7607843, 1,
-0.079381, -0.7455897, -3.490941, 0, 1, 0.7647059, 1,
-0.07857604, 0.852454, -0.04870766, 0, 1, 0.772549, 1,
-0.07828681, 0.1201511, 0.04745567, 0, 1, 0.7764706, 1,
-0.07103143, -0.3027161, -2.616355, 0, 1, 0.7843137, 1,
-0.07006052, 0.4215329, 0.09313313, 0, 1, 0.7882353, 1,
-0.06838945, -0.4780415, -4.490262, 0, 1, 0.7960784, 1,
-0.06524156, 0.1484456, -0.8642899, 0, 1, 0.8039216, 1,
-0.06419447, -0.3631607, -2.842833, 0, 1, 0.8078431, 1,
-0.06359212, -0.5792814, -2.116068, 0, 1, 0.8156863, 1,
-0.06341799, 1.205544, 1.353763, 0, 1, 0.8196079, 1,
-0.05916521, -0.1762999, -2.093938, 0, 1, 0.827451, 1,
-0.05782542, -1.211499, -2.49845, 0, 1, 0.8313726, 1,
-0.0572103, -1.557612, -3.435217, 0, 1, 0.8392157, 1,
-0.05690589, 0.002521423, 0.8614814, 0, 1, 0.8431373, 1,
-0.05418535, 0.634955, -0.318128, 0, 1, 0.8509804, 1,
-0.05396244, 0.09653252, 0.7512612, 0, 1, 0.854902, 1,
-0.04864115, -1.087444, -1.16232, 0, 1, 0.8627451, 1,
-0.04744573, -0.7263226, -3.426046, 0, 1, 0.8666667, 1,
-0.04315541, -0.5459461, -2.847013, 0, 1, 0.8745098, 1,
-0.04034665, 1.574616, 1.006459, 0, 1, 0.8784314, 1,
-0.03291354, -0.6926873, -2.834184, 0, 1, 0.8862745, 1,
-0.03004018, -0.6327531, -3.251968, 0, 1, 0.8901961, 1,
-0.02860586, -0.7906047, -2.374632, 0, 1, 0.8980392, 1,
-0.02793543, -0.4102232, -2.67322, 0, 1, 0.9058824, 1,
-0.02300787, -1.524753, -2.384802, 0, 1, 0.9098039, 1,
-0.01511956, 0.4466999, -2.166436, 0, 1, 0.9176471, 1,
-0.01160489, 0.6321445, -1.106611, 0, 1, 0.9215686, 1,
-0.0107622, -0.2766291, -1.957443, 0, 1, 0.9294118, 1,
-0.008034512, -0.003335202, -2.538709, 0, 1, 0.9333333, 1,
-0.006687635, -0.9416957, -2.6123, 0, 1, 0.9411765, 1,
-0.006656694, -0.4367824, -3.395745, 0, 1, 0.945098, 1,
-0.005055253, -1.641489, -3.603032, 0, 1, 0.9529412, 1,
-0.004497853, -1.59486, -1.413373, 0, 1, 0.9568627, 1,
-0.003640344, -1.651205, -2.164743, 0, 1, 0.9647059, 1,
-0.0008669099, 0.2847136, -0.4750554, 0, 1, 0.9686275, 1,
0.00446969, 0.4751871, -0.3230901, 0, 1, 0.9764706, 1,
0.004473979, -0.04855057, 2.354507, 0, 1, 0.9803922, 1,
0.006050589, -0.2823451, 2.442827, 0, 1, 0.9882353, 1,
0.006740877, 0.0946319, 2.603271, 0, 1, 0.9921569, 1,
0.008065694, 0.3937784, -0.1195759, 0, 1, 1, 1,
0.008960016, -1.629202, 2.624672, 0, 0.9921569, 1, 1,
0.02045173, -0.199314, 4.590159, 0, 0.9882353, 1, 1,
0.02198219, 0.3621794, -0.8504644, 0, 0.9803922, 1, 1,
0.02308924, -0.4875907, 3.0967, 0, 0.9764706, 1, 1,
0.0267389, 0.06988946, 0.1171343, 0, 0.9686275, 1, 1,
0.02767072, 0.4071909, -1.741436, 0, 0.9647059, 1, 1,
0.02830729, 0.06125865, 1.871397, 0, 0.9568627, 1, 1,
0.03275415, 0.1916719, 0.528748, 0, 0.9529412, 1, 1,
0.0332134, -0.742263, 1.974682, 0, 0.945098, 1, 1,
0.03450872, 0.2152149, -0.6046007, 0, 0.9411765, 1, 1,
0.03455846, -0.7447061, 1.983802, 0, 0.9333333, 1, 1,
0.03515872, -0.2105421, 1.116886, 0, 0.9294118, 1, 1,
0.03753668, -0.6055689, 3.610503, 0, 0.9215686, 1, 1,
0.04364856, -2.172522, 3.586892, 0, 0.9176471, 1, 1,
0.04551838, -1.910123, 2.820408, 0, 0.9098039, 1, 1,
0.04553352, 1.457801, 0.5650154, 0, 0.9058824, 1, 1,
0.0458736, 0.6899841, 0.4716194, 0, 0.8980392, 1, 1,
0.05054679, -0.1996127, 4.177368, 0, 0.8901961, 1, 1,
0.05273102, 2.074645, -0.7458529, 0, 0.8862745, 1, 1,
0.05330236, -0.6439015, 3.480401, 0, 0.8784314, 1, 1,
0.05719379, -0.9620992, 3.295315, 0, 0.8745098, 1, 1,
0.05805264, -0.09056337, 1.959246, 0, 0.8666667, 1, 1,
0.05856063, -0.02165386, 0.2424819, 0, 0.8627451, 1, 1,
0.05907417, -0.5215274, 3.82797, 0, 0.854902, 1, 1,
0.06082925, 0.3950475, 1.296099, 0, 0.8509804, 1, 1,
0.06103471, -0.6430138, 2.115018, 0, 0.8431373, 1, 1,
0.0642183, 1.161716, 1.345528, 0, 0.8392157, 1, 1,
0.06445586, -0.009075209, 1.065767, 0, 0.8313726, 1, 1,
0.06506105, -0.3702671, 1.300266, 0, 0.827451, 1, 1,
0.06954776, 0.3086178, -0.3322455, 0, 0.8196079, 1, 1,
0.07187603, -0.6376941, 3.051557, 0, 0.8156863, 1, 1,
0.07517249, 1.425912, 0.4083112, 0, 0.8078431, 1, 1,
0.07844064, 1.707925, -0.2091896, 0, 0.8039216, 1, 1,
0.08379635, 0.514587, 0.263307, 0, 0.7960784, 1, 1,
0.08573528, 1.00233, -0.4490154, 0, 0.7882353, 1, 1,
0.08730422, -0.1738831, 1.964441, 0, 0.7843137, 1, 1,
0.08763135, -1.744898, 4.89297, 0, 0.7764706, 1, 1,
0.08811598, -0.1848668, 3.427571, 0, 0.772549, 1, 1,
0.09354016, 0.3829309, -1.781971, 0, 0.7647059, 1, 1,
0.09664311, -0.9026598, 1.549561, 0, 0.7607843, 1, 1,
0.1052609, 0.1097257, 2.191457, 0, 0.7529412, 1, 1,
0.1091941, -0.4045511, 3.390318, 0, 0.7490196, 1, 1,
0.110117, -0.4906718, 1.140846, 0, 0.7411765, 1, 1,
0.1110109, 0.3698492, -0.9366997, 0, 0.7372549, 1, 1,
0.1121565, 1.279608, 1.045903, 0, 0.7294118, 1, 1,
0.1122755, -0.3790224, 2.589146, 0, 0.7254902, 1, 1,
0.1126734, -0.09543685, 1.995266, 0, 0.7176471, 1, 1,
0.1132149, 0.2007379, 0.1077834, 0, 0.7137255, 1, 1,
0.1135673, 0.242433, 0.6356784, 0, 0.7058824, 1, 1,
0.1154479, -1.019341, 3.100636, 0, 0.6980392, 1, 1,
0.1168154, -0.4638576, 1.784214, 0, 0.6941177, 1, 1,
0.1192188, 0.2209658, 0.6768367, 0, 0.6862745, 1, 1,
0.122414, -0.9076031, 2.092667, 0, 0.682353, 1, 1,
0.1232049, 1.767879, -0.3434502, 0, 0.6745098, 1, 1,
0.1234579, -2.467292, 4.106883, 0, 0.6705883, 1, 1,
0.1252937, -2.639996, 1.60746, 0, 0.6627451, 1, 1,
0.1264087, 0.2500821, -1.478531, 0, 0.6588235, 1, 1,
0.1289264, 0.07073597, -0.5427045, 0, 0.6509804, 1, 1,
0.1290442, 0.5549591, 1.311939, 0, 0.6470588, 1, 1,
0.1312652, 0.5147242, -0.5309427, 0, 0.6392157, 1, 1,
0.132728, -0.1709036, 2.337987, 0, 0.6352941, 1, 1,
0.1368058, 0.8907815, 0.6612898, 0, 0.627451, 1, 1,
0.1478302, -0.7781619, 1.027991, 0, 0.6235294, 1, 1,
0.1503008, 0.4272622, -2.128462, 0, 0.6156863, 1, 1,
0.152106, -0.9732229, 4.116421, 0, 0.6117647, 1, 1,
0.1547262, -1.068538, 3.980629, 0, 0.6039216, 1, 1,
0.1555524, 0.8530788, -1.257079, 0, 0.5960785, 1, 1,
0.1565221, -0.3821881, 3.488422, 0, 0.5921569, 1, 1,
0.1569807, 0.7179507, -0.06818102, 0, 0.5843138, 1, 1,
0.1570956, -0.2768448, 2.6043, 0, 0.5803922, 1, 1,
0.15824, -0.6400282, 3.831678, 0, 0.572549, 1, 1,
0.1585522, -1.441401, 5.286223, 0, 0.5686275, 1, 1,
0.1692679, 0.250781, 1.872662, 0, 0.5607843, 1, 1,
0.1760129, -2.239446, 3.036687, 0, 0.5568628, 1, 1,
0.1795376, 1.261422, 1.754491, 0, 0.5490196, 1, 1,
0.1805317, 1.430364, 1.191766, 0, 0.5450981, 1, 1,
0.1836388, 2.113205, 1.041926, 0, 0.5372549, 1, 1,
0.1839775, -0.2878343, 3.36563, 0, 0.5333334, 1, 1,
0.1958912, -1.093347, 1.734074, 0, 0.5254902, 1, 1,
0.1987016, 0.2976759, -0.2634454, 0, 0.5215687, 1, 1,
0.1995189, 0.7232959, 1.108591, 0, 0.5137255, 1, 1,
0.2000648, -1.154521, 0.8815068, 0, 0.509804, 1, 1,
0.2022429, -1.866037, 3.970597, 0, 0.5019608, 1, 1,
0.2042058, 0.7547769, 0.2078545, 0, 0.4941176, 1, 1,
0.204764, 1.507725, -1.516557, 0, 0.4901961, 1, 1,
0.2054799, -0.7207703, 3.583106, 0, 0.4823529, 1, 1,
0.2057236, -0.01598271, 1.671356, 0, 0.4784314, 1, 1,
0.206091, -0.9870335, 1.988838, 0, 0.4705882, 1, 1,
0.2086943, 0.4637277, 0.008894716, 0, 0.4666667, 1, 1,
0.2092336, -1.98101, 2.325496, 0, 0.4588235, 1, 1,
0.2108489, 0.354439, 0.1787423, 0, 0.454902, 1, 1,
0.2112327, 0.9953026, -0.6945212, 0, 0.4470588, 1, 1,
0.2123777, 1.000594, 0.6190671, 0, 0.4431373, 1, 1,
0.2200049, 0.01121666, 1.364852, 0, 0.4352941, 1, 1,
0.221287, -0.3440031, 2.881497, 0, 0.4313726, 1, 1,
0.2218029, 0.2951182, 0.8990417, 0, 0.4235294, 1, 1,
0.2234503, 0.9498053, 0.4362549, 0, 0.4196078, 1, 1,
0.2241713, 0.2875481, 2.45412, 0, 0.4117647, 1, 1,
0.2252393, -0.06014187, 1.233245, 0, 0.4078431, 1, 1,
0.2300617, 1.101717, 0.4359052, 0, 0.4, 1, 1,
0.2306537, -1.877866, 2.198356, 0, 0.3921569, 1, 1,
0.2360526, 0.2644025, 1.632234, 0, 0.3882353, 1, 1,
0.2362232, -1.185094, 2.364888, 0, 0.3803922, 1, 1,
0.239074, -1.423418, 3.36058, 0, 0.3764706, 1, 1,
0.240129, 1.607054, 0.9726813, 0, 0.3686275, 1, 1,
0.2432411, 1.395032, -1.023836, 0, 0.3647059, 1, 1,
0.248754, -0.4302641, 0.4457708, 0, 0.3568628, 1, 1,
0.2500924, -0.02635018, 1.736629, 0, 0.3529412, 1, 1,
0.2510228, -0.2616682, 3.578868, 0, 0.345098, 1, 1,
0.2599031, 0.9516736, -0.2142072, 0, 0.3411765, 1, 1,
0.2610268, -0.5853133, 2.284005, 0, 0.3333333, 1, 1,
0.2631706, -1.12519, 1.58058, 0, 0.3294118, 1, 1,
0.2653169, 0.7190862, -1.735878, 0, 0.3215686, 1, 1,
0.2656736, -2.072939, 2.86082, 0, 0.3176471, 1, 1,
0.2661946, -0.7962939, 2.85658, 0, 0.3098039, 1, 1,
0.2664497, 0.6122814, -0.2041904, 0, 0.3058824, 1, 1,
0.2680958, 0.7888131, 1.027978, 0, 0.2980392, 1, 1,
0.2681049, -0.3404986, 2.622579, 0, 0.2901961, 1, 1,
0.2685017, 0.9860465, -0.7999686, 0, 0.2862745, 1, 1,
0.2694141, 0.01891773, 2.425834, 0, 0.2784314, 1, 1,
0.2694414, -0.5139196, 2.106803, 0, 0.2745098, 1, 1,
0.2700184, 0.5429904, 0.01181056, 0, 0.2666667, 1, 1,
0.2713575, -1.162228, 2.788462, 0, 0.2627451, 1, 1,
0.2750672, 1.130376, 1.399886, 0, 0.254902, 1, 1,
0.2764623, -0.2080927, 2.125267, 0, 0.2509804, 1, 1,
0.2887225, -1.198879, 3.728389, 0, 0.2431373, 1, 1,
0.2915977, 0.3379726, 1.363427, 0, 0.2392157, 1, 1,
0.2916237, 0.09244983, 0.1921292, 0, 0.2313726, 1, 1,
0.2933925, 0.5022274, 1.917848, 0, 0.227451, 1, 1,
0.2961676, 1.712606, 0.5954065, 0, 0.2196078, 1, 1,
0.2971702, -0.0770429, 1.772555, 0, 0.2156863, 1, 1,
0.3022128, 1.534818, -1.173415, 0, 0.2078431, 1, 1,
0.3023, -1.527056, 1.418269, 0, 0.2039216, 1, 1,
0.3044788, 0.3892064, 1.102586, 0, 0.1960784, 1, 1,
0.3067798, 0.4745862, 1.890933, 0, 0.1882353, 1, 1,
0.3089017, 0.5121304, 0.3453186, 0, 0.1843137, 1, 1,
0.3091344, -0.3183147, 1.87736, 0, 0.1764706, 1, 1,
0.3121291, -0.8915434, 3.702089, 0, 0.172549, 1, 1,
0.3131889, -1.015431, 2.984455, 0, 0.1647059, 1, 1,
0.3133726, 1.193946, 0.2588956, 0, 0.1607843, 1, 1,
0.314983, -1.717998, 4.062473, 0, 0.1529412, 1, 1,
0.3168004, -0.1076781, 1.922915, 0, 0.1490196, 1, 1,
0.320522, -1.147334, 2.124459, 0, 0.1411765, 1, 1,
0.3211945, -2.904252, 4.948669, 0, 0.1372549, 1, 1,
0.3232057, -0.2145814, 1.469169, 0, 0.1294118, 1, 1,
0.3236583, 0.9927053, -0.5113667, 0, 0.1254902, 1, 1,
0.3242628, 1.330329, -0.2816351, 0, 0.1176471, 1, 1,
0.3296917, 0.9724085, -0.1813592, 0, 0.1137255, 1, 1,
0.3394555, -1.096608, 3.082379, 0, 0.1058824, 1, 1,
0.3416871, 1.040258, 0.4209205, 0, 0.09803922, 1, 1,
0.3439803, 0.7236859, -1.309726, 0, 0.09411765, 1, 1,
0.3445758, -0.06050226, 1.772006, 0, 0.08627451, 1, 1,
0.3454464, -0.5359921, 2.233836, 0, 0.08235294, 1, 1,
0.3530343, -1.109759, 0.7276574, 0, 0.07450981, 1, 1,
0.3538034, 0.8713369, -0.6870334, 0, 0.07058824, 1, 1,
0.3560447, 2.744239, 0.5630552, 0, 0.0627451, 1, 1,
0.3566857, 0.3436778, 2.441402, 0, 0.05882353, 1, 1,
0.359475, -0.09218024, 3.20553, 0, 0.05098039, 1, 1,
0.3665922, -0.525634, 3.545808, 0, 0.04705882, 1, 1,
0.3666317, 1.07563, -0.07042481, 0, 0.03921569, 1, 1,
0.3686173, -0.5643775, 2.873013, 0, 0.03529412, 1, 1,
0.3695903, -0.3329709, 0.07399996, 0, 0.02745098, 1, 1,
0.3703232, 1.422912, -1.033644, 0, 0.02352941, 1, 1,
0.3729616, 0.1573928, -0.5569626, 0, 0.01568628, 1, 1,
0.3761373, -1.100648, 4.34462, 0, 0.01176471, 1, 1,
0.3775606, -0.1964178, 4.341442, 0, 0.003921569, 1, 1,
0.3792128, 0.03559249, 0.7197899, 0.003921569, 0, 1, 1,
0.3795493, -0.2681686, 0.3103605, 0.007843138, 0, 1, 1,
0.3832213, 0.305595, -1.04183, 0.01568628, 0, 1, 1,
0.3898284, 0.071525, 3.188317, 0.01960784, 0, 1, 1,
0.3903423, 0.04020271, 4.190425, 0.02745098, 0, 1, 1,
0.3906433, 0.1569844, 0.2152159, 0.03137255, 0, 1, 1,
0.3949511, 0.09541378, 3.23223, 0.03921569, 0, 1, 1,
0.3976274, -1.022728, 4.161372, 0.04313726, 0, 1, 1,
0.3988423, -0.08378414, 0.06686962, 0.05098039, 0, 1, 1,
0.4027382, -0.6578301, 1.928459, 0.05490196, 0, 1, 1,
0.4048976, -0.9316334, 1.657722, 0.0627451, 0, 1, 1,
0.4060405, -0.6241511, 2.059783, 0.06666667, 0, 1, 1,
0.4100246, 1.197604, 0.3501774, 0.07450981, 0, 1, 1,
0.4133329, -0.3266269, 1.856783, 0.07843138, 0, 1, 1,
0.4215689, 0.006408859, 0.9560893, 0.08627451, 0, 1, 1,
0.4294311, -0.675601, 1.391766, 0.09019608, 0, 1, 1,
0.4321755, -0.5626372, 1.948631, 0.09803922, 0, 1, 1,
0.433019, 0.272169, 2.24995, 0.1058824, 0, 1, 1,
0.4359258, 1.320156, -1.174469, 0.1098039, 0, 1, 1,
0.4364148, -0.2109856, 3.369922, 0.1176471, 0, 1, 1,
0.4380807, -0.2534489, 1.238758, 0.1215686, 0, 1, 1,
0.4461861, 0.1281471, 3.954502, 0.1294118, 0, 1, 1,
0.4523982, -0.04106804, 1.440207, 0.1333333, 0, 1, 1,
0.4524128, -1.414477, 1.808654, 0.1411765, 0, 1, 1,
0.4556927, 0.4746872, 0.7198911, 0.145098, 0, 1, 1,
0.4572177, 0.4590511, 1.812262, 0.1529412, 0, 1, 1,
0.4594859, -0.8036831, 1.294509, 0.1568628, 0, 1, 1,
0.4621684, -0.3698375, 2.0315, 0.1647059, 0, 1, 1,
0.4650571, 0.06707008, 2.196404, 0.1686275, 0, 1, 1,
0.4687699, -1.215112, 1.718838, 0.1764706, 0, 1, 1,
0.4692339, -0.8976382, 3.240339, 0.1803922, 0, 1, 1,
0.4702863, 2.119764, 1.67498, 0.1882353, 0, 1, 1,
0.4722693, 0.6514224, -0.7754104, 0.1921569, 0, 1, 1,
0.4730726, -1.837504, 3.742143, 0.2, 0, 1, 1,
0.4736459, 0.05643877, 1.199286, 0.2078431, 0, 1, 1,
0.476281, 0.4955361, 2.523088, 0.2117647, 0, 1, 1,
0.4780635, 1.097061, 0.5290741, 0.2196078, 0, 1, 1,
0.4818171, 0.708689, 1.320254, 0.2235294, 0, 1, 1,
0.4837649, 0.7272036, 0.6609932, 0.2313726, 0, 1, 1,
0.4907008, -0.4434517, 2.831781, 0.2352941, 0, 1, 1,
0.4955305, 0.4052613, 0.8698011, 0.2431373, 0, 1, 1,
0.4978891, -0.04304761, 1.938041, 0.2470588, 0, 1, 1,
0.5019296, 0.879136, 1.129201, 0.254902, 0, 1, 1,
0.5029382, 0.09839241, 1.089945, 0.2588235, 0, 1, 1,
0.504291, -0.7037641, 2.896937, 0.2666667, 0, 1, 1,
0.506387, -1.084053, 2.624876, 0.2705882, 0, 1, 1,
0.5067757, 0.4950144, 1.892426, 0.2784314, 0, 1, 1,
0.5115978, 0.02662248, 2.504061, 0.282353, 0, 1, 1,
0.5151597, -0.7269453, 0.3784208, 0.2901961, 0, 1, 1,
0.5207385, 0.4233034, 1.112109, 0.2941177, 0, 1, 1,
0.5230017, -1.321637, 1.980247, 0.3019608, 0, 1, 1,
0.5322216, 0.2637184, 1.357255, 0.3098039, 0, 1, 1,
0.5396407, -0.5941445, 2.055866, 0.3137255, 0, 1, 1,
0.5407937, 1.34902, 0.7704312, 0.3215686, 0, 1, 1,
0.540835, -0.250058, 2.531081, 0.3254902, 0, 1, 1,
0.5417627, 0.2599193, 1.102123, 0.3333333, 0, 1, 1,
0.556396, -0.04128999, 0.2269217, 0.3372549, 0, 1, 1,
0.5594293, -2.72742, 3.462406, 0.345098, 0, 1, 1,
0.5660188, -1.021302, 1.546453, 0.3490196, 0, 1, 1,
0.5731283, -0.1087382, 1.769698, 0.3568628, 0, 1, 1,
0.5797631, 0.2008293, 1.450561, 0.3607843, 0, 1, 1,
0.5800076, -0.2833169, 3.514678, 0.3686275, 0, 1, 1,
0.5810766, -0.07122721, 2.597623, 0.372549, 0, 1, 1,
0.5843717, -0.1608452, 2.203975, 0.3803922, 0, 1, 1,
0.5847869, -0.124816, 0.07316845, 0.3843137, 0, 1, 1,
0.5912148, 0.5986897, -0.114254, 0.3921569, 0, 1, 1,
0.609715, -0.6233484, 4.11155, 0.3960784, 0, 1, 1,
0.6138385, 0.9020455, 0.007624073, 0.4039216, 0, 1, 1,
0.6200184, 0.4355138, -0.5705859, 0.4117647, 0, 1, 1,
0.6205943, 1.170713, -0.6007327, 0.4156863, 0, 1, 1,
0.6208114, 0.8830045, 1.100463, 0.4235294, 0, 1, 1,
0.6211661, 1.304315, 1.178243, 0.427451, 0, 1, 1,
0.6267079, -1.277241, 2.000483, 0.4352941, 0, 1, 1,
0.6282693, 1.35239, 3.524479, 0.4392157, 0, 1, 1,
0.6294173, -1.391139, 2.265984, 0.4470588, 0, 1, 1,
0.6346629, -1.276083, 2.01982, 0.4509804, 0, 1, 1,
0.6355758, 1.3117, 0.496417, 0.4588235, 0, 1, 1,
0.6369911, 0.5959285, 1.749232, 0.4627451, 0, 1, 1,
0.6407722, 1.100126, 0.5391263, 0.4705882, 0, 1, 1,
0.6455647, 0.8458543, 1.824283, 0.4745098, 0, 1, 1,
0.6478841, 0.1858649, 1.36488, 0.4823529, 0, 1, 1,
0.6523386, -0.2568727, 1.777228, 0.4862745, 0, 1, 1,
0.6532913, -1.040896, 2.953118, 0.4941176, 0, 1, 1,
0.6559141, 0.2109556, 0.2194864, 0.5019608, 0, 1, 1,
0.6584764, -0.7002952, 2.449131, 0.5058824, 0, 1, 1,
0.6609703, 0.8035487, 0.4560786, 0.5137255, 0, 1, 1,
0.665534, -0.2857419, 1.335295, 0.5176471, 0, 1, 1,
0.6679033, -0.6167426, 2.163616, 0.5254902, 0, 1, 1,
0.6696073, 0.6449435, 2.033031, 0.5294118, 0, 1, 1,
0.6727269, 0.3533216, 1.792367, 0.5372549, 0, 1, 1,
0.6788721, 0.5277051, 1.566114, 0.5411765, 0, 1, 1,
0.6864219, -0.06851082, 2.838499, 0.5490196, 0, 1, 1,
0.6865512, -1.358553, 1.40355, 0.5529412, 0, 1, 1,
0.6876767, -1.083323, 1.361992, 0.5607843, 0, 1, 1,
0.697876, -0.4069361, 1.630839, 0.5647059, 0, 1, 1,
0.6994622, 1.637299, -0.292759, 0.572549, 0, 1, 1,
0.7010431, -0.5239182, 3.25415, 0.5764706, 0, 1, 1,
0.7023252, -1.312154, 2.007659, 0.5843138, 0, 1, 1,
0.7023848, 0.3389587, 2.680461, 0.5882353, 0, 1, 1,
0.7034649, 0.08094846, 3.251615, 0.5960785, 0, 1, 1,
0.7063671, -0.7262405, 2.677584, 0.6039216, 0, 1, 1,
0.7074122, 0.8296049, 1.807465, 0.6078432, 0, 1, 1,
0.7123621, 0.1655949, 0.4061203, 0.6156863, 0, 1, 1,
0.714993, 2.411253, -0.5496022, 0.6196079, 0, 1, 1,
0.7168338, -1.329594, 3.168615, 0.627451, 0, 1, 1,
0.7185134, 0.5308247, 1.376891, 0.6313726, 0, 1, 1,
0.7268242, -0.7207034, 0.6629965, 0.6392157, 0, 1, 1,
0.7356613, 1.11024, -0.286344, 0.6431373, 0, 1, 1,
0.7363994, -2.311211, 2.721461, 0.6509804, 0, 1, 1,
0.7428429, 0.7104675, 1.637907, 0.654902, 0, 1, 1,
0.7441504, -0.602665, 2.252292, 0.6627451, 0, 1, 1,
0.7450652, -0.9945477, 2.72977, 0.6666667, 0, 1, 1,
0.7498991, 0.6621199, 0.3067431, 0.6745098, 0, 1, 1,
0.7586619, 2.201368, 0.1654846, 0.6784314, 0, 1, 1,
0.7650201, -0.7600043, 1.264788, 0.6862745, 0, 1, 1,
0.7760283, -0.2320205, 2.224217, 0.6901961, 0, 1, 1,
0.783719, -0.6497411, 1.703015, 0.6980392, 0, 1, 1,
0.7945567, -1.185867, 2.120657, 0.7058824, 0, 1, 1,
0.7951756, 0.284396, 1.987491, 0.7098039, 0, 1, 1,
0.7991647, -0.09238192, 1.606577, 0.7176471, 0, 1, 1,
0.8044313, -0.02023931, 3.03273, 0.7215686, 0, 1, 1,
0.809875, -1.889825, 3.262295, 0.7294118, 0, 1, 1,
0.8100594, 0.07603019, 1.425085, 0.7333333, 0, 1, 1,
0.82175, 0.3906033, 1.257745, 0.7411765, 0, 1, 1,
0.822346, -1.88128, 2.50368, 0.7450981, 0, 1, 1,
0.8239235, 0.4519444, 0.6161308, 0.7529412, 0, 1, 1,
0.8251966, 0.9392095, 1.092036, 0.7568628, 0, 1, 1,
0.8264409, -0.04139202, 2.382714, 0.7647059, 0, 1, 1,
0.8399381, 0.9474273, 0.8076771, 0.7686275, 0, 1, 1,
0.8445346, 0.8414364, 1.684672, 0.7764706, 0, 1, 1,
0.84693, 2.427364, 0.3412968, 0.7803922, 0, 1, 1,
0.8487964, -0.6596174, 2.827465, 0.7882353, 0, 1, 1,
0.8505553, 2.504478, 2.4729, 0.7921569, 0, 1, 1,
0.8506862, 1.675256, 0.06330511, 0.8, 0, 1, 1,
0.8540121, -0.8898866, 2.594409, 0.8078431, 0, 1, 1,
0.8573544, -0.1860819, 1.99854, 0.8117647, 0, 1, 1,
0.8605927, 0.8065422, 0.809336, 0.8196079, 0, 1, 1,
0.8618094, 0.2927892, 2.614776, 0.8235294, 0, 1, 1,
0.8667659, 1.787319, 1.19015, 0.8313726, 0, 1, 1,
0.868584, 1.288134, 0.4643318, 0.8352941, 0, 1, 1,
0.8735797, -0.6833267, 2.566594, 0.8431373, 0, 1, 1,
0.8859496, -0.1610348, 1.178218, 0.8470588, 0, 1, 1,
0.8892215, -0.590305, 2.159141, 0.854902, 0, 1, 1,
0.8901668, -1.060273, 4.438982, 0.8588235, 0, 1, 1,
0.8913115, -1.072573, 2.319578, 0.8666667, 0, 1, 1,
0.8928294, 1.757601, 0.1512735, 0.8705882, 0, 1, 1,
0.8964483, -0.6041933, 1.796472, 0.8784314, 0, 1, 1,
0.8977352, -0.2258661, 0.2999266, 0.8823529, 0, 1, 1,
0.9049696, 0.2993534, 1.669274, 0.8901961, 0, 1, 1,
0.9100195, 0.7264472, 2.998854, 0.8941177, 0, 1, 1,
0.9109254, 1.348373, 1.034029, 0.9019608, 0, 1, 1,
0.9137233, -0.374505, 2.792057, 0.9098039, 0, 1, 1,
0.9148078, -0.6355981, 1.798004, 0.9137255, 0, 1, 1,
0.9213312, 1.329796, -0.7072735, 0.9215686, 0, 1, 1,
0.9213665, -0.8059461, 3.704625, 0.9254902, 0, 1, 1,
0.9238116, -0.9566442, 3.931365, 0.9333333, 0, 1, 1,
0.945443, -0.599422, 1.90301, 0.9372549, 0, 1, 1,
0.9564153, -1.210293, 2.027469, 0.945098, 0, 1, 1,
0.9626955, -0.1524798, 1.547507, 0.9490196, 0, 1, 1,
0.963287, 0.3204861, 1.741024, 0.9568627, 0, 1, 1,
0.9634308, 1.276587, 1.754208, 0.9607843, 0, 1, 1,
0.9636512, 0.3427737, 1.0378, 0.9686275, 0, 1, 1,
0.9665476, 0.07261415, 0.9308919, 0.972549, 0, 1, 1,
0.9697793, -1.323083, 2.861227, 0.9803922, 0, 1, 1,
0.9724997, 0.2285872, 0.6907042, 0.9843137, 0, 1, 1,
0.9753374, -0.5309675, 2.148871, 0.9921569, 0, 1, 1,
0.9833114, 0.2188589, 0.2229185, 0.9960784, 0, 1, 1,
0.984484, 1.739744, 1.170466, 1, 0, 0.9960784, 1,
0.9879643, 0.4716105, 0.4449036, 1, 0, 0.9882353, 1,
0.9895751, 1.751489, -0.5030901, 1, 0, 0.9843137, 1,
0.9898583, -0.5957246, 4.464729, 1, 0, 0.9764706, 1,
0.9918191, -0.4790268, 2.990154, 1, 0, 0.972549, 1,
0.9937712, -0.4106678, 2.063796, 1, 0, 0.9647059, 1,
0.9966069, 1.343473, -0.1576125, 1, 0, 0.9607843, 1,
0.9982315, 2.061826, 0.5475923, 1, 0, 0.9529412, 1,
1.002543, 0.5583832, -0.5786383, 1, 0, 0.9490196, 1,
1.012947, 0.9007457, 2.444273, 1, 0, 0.9411765, 1,
1.018127, -0.08475751, 1.8712, 1, 0, 0.9372549, 1,
1.018366, -0.7951056, 0.8582094, 1, 0, 0.9294118, 1,
1.021011, 1.493152, 1.053964, 1, 0, 0.9254902, 1,
1.024746, -0.06343178, -0.8100973, 1, 0, 0.9176471, 1,
1.036555, 2.428918, -0.02379033, 1, 0, 0.9137255, 1,
1.045161, 0.2270368, 0.1985479, 1, 0, 0.9058824, 1,
1.047197, 0.01972374, 1.810626, 1, 0, 0.9019608, 1,
1.051283, 1.018166, 1.008867, 1, 0, 0.8941177, 1,
1.053136, -1.951191, 0.6650414, 1, 0, 0.8862745, 1,
1.053474, -0.5210475, 3.420583, 1, 0, 0.8823529, 1,
1.062727, 1.537869, -0.3745442, 1, 0, 0.8745098, 1,
1.070104, -0.6276067, 1.460517, 1, 0, 0.8705882, 1,
1.073753, -3.027658, 2.565266, 1, 0, 0.8627451, 1,
1.07598, 0.2452287, 0.6107676, 1, 0, 0.8588235, 1,
1.080394, 0.1783126, 1.98264, 1, 0, 0.8509804, 1,
1.08398, 0.4537133, 1.894428, 1, 0, 0.8470588, 1,
1.09237, -0.1922638, 0.408026, 1, 0, 0.8392157, 1,
1.098295, 1.529526, 1.417225, 1, 0, 0.8352941, 1,
1.100295, 0.4935626, 1.990645, 1, 0, 0.827451, 1,
1.101305, 1.416458, -0.1483175, 1, 0, 0.8235294, 1,
1.104129, -0.2739431, 2.860173, 1, 0, 0.8156863, 1,
1.10903, 1.132734, 0.270873, 1, 0, 0.8117647, 1,
1.111306, -0.00104817, 1.682629, 1, 0, 0.8039216, 1,
1.114753, 0.3041918, 1.188679, 1, 0, 0.7960784, 1,
1.118382, 0.0274234, 1.798332, 1, 0, 0.7921569, 1,
1.119872, -0.1666605, 3.222241, 1, 0, 0.7843137, 1,
1.12124, 0.4052846, 2.262995, 1, 0, 0.7803922, 1,
1.124163, 1.678952, 0.4697241, 1, 0, 0.772549, 1,
1.124444, -1.883403, 4.592737, 1, 0, 0.7686275, 1,
1.125374, 1.069014, 1.43578, 1, 0, 0.7607843, 1,
1.133764, 1.481362, 2.170797, 1, 0, 0.7568628, 1,
1.134577, 2.280237, -0.07562395, 1, 0, 0.7490196, 1,
1.134799, -0.2981582, 1.423755, 1, 0, 0.7450981, 1,
1.136472, 0.08095068, -0.135842, 1, 0, 0.7372549, 1,
1.14082, 1.271003, -0.02387866, 1, 0, 0.7333333, 1,
1.141647, 2.220265, 1.707316, 1, 0, 0.7254902, 1,
1.142851, -0.9846039, 2.345355, 1, 0, 0.7215686, 1,
1.14667, -0.7886655, 1.971287, 1, 0, 0.7137255, 1,
1.149562, 0.5567145, 1.557532, 1, 0, 0.7098039, 1,
1.160296, 0.8207178, 0.5779291, 1, 0, 0.7019608, 1,
1.167241, -0.9661296, 2.64987, 1, 0, 0.6941177, 1,
1.18094, 0.2156265, 1.312652, 1, 0, 0.6901961, 1,
1.188504, -1.998277, 2.22013, 1, 0, 0.682353, 1,
1.190103, -0.3455525, 1.998973, 1, 0, 0.6784314, 1,
1.19118, -0.4892916, 1.794367, 1, 0, 0.6705883, 1,
1.193388, -0.4536966, 1.013365, 1, 0, 0.6666667, 1,
1.200637, -1.566664, 3.219107, 1, 0, 0.6588235, 1,
1.200881, -1.014457, 2.259582, 1, 0, 0.654902, 1,
1.204258, 0.2719571, 1.719934, 1, 0, 0.6470588, 1,
1.207363, 0.4251359, 1.802615, 1, 0, 0.6431373, 1,
1.21013, 0.297597, 1.286167, 1, 0, 0.6352941, 1,
1.213631, 0.2695283, 1.036305, 1, 0, 0.6313726, 1,
1.233026, -1.358454, 2.311616, 1, 0, 0.6235294, 1,
1.256468, -0.2902319, 1.932393, 1, 0, 0.6196079, 1,
1.25946, 0.2668305, 0.3454114, 1, 0, 0.6117647, 1,
1.269693, 1.229442, -0.34933, 1, 0, 0.6078432, 1,
1.27661, -0.1978259, 1.681613, 1, 0, 0.6, 1,
1.276747, 1.167744, -0.1458384, 1, 0, 0.5921569, 1,
1.279386, 0.6254917, 0.3867804, 1, 0, 0.5882353, 1,
1.287291, 1.351241, 1.150402, 1, 0, 0.5803922, 1,
1.289718, 0.3889427, 1.864196, 1, 0, 0.5764706, 1,
1.290746, -0.2331145, 1.728622, 1, 0, 0.5686275, 1,
1.293842, -0.2351651, 0.2347378, 1, 0, 0.5647059, 1,
1.300598, -1.186363, 2.765113, 1, 0, 0.5568628, 1,
1.322483, 0.2701501, 1.526077, 1, 0, 0.5529412, 1,
1.323433, -2.16835, 2.962035, 1, 0, 0.5450981, 1,
1.335329, -0.2004574, 2.418187, 1, 0, 0.5411765, 1,
1.338814, -0.9170005, 2.613428, 1, 0, 0.5333334, 1,
1.340562, 0.5377691, 1.718404, 1, 0, 0.5294118, 1,
1.349921, -0.2528383, 0.8316967, 1, 0, 0.5215687, 1,
1.367186, -0.1121815, 1.205437, 1, 0, 0.5176471, 1,
1.369082, -0.8130438, 1.064942, 1, 0, 0.509804, 1,
1.371614, 0.7903031, -1.609463, 1, 0, 0.5058824, 1,
1.37252, -0.3283375, -0.6198663, 1, 0, 0.4980392, 1,
1.37293, -2.043773, 1.468798, 1, 0, 0.4901961, 1,
1.379193, 0.3677118, 0.3912768, 1, 0, 0.4862745, 1,
1.41142, -0.7681746, 1.992279, 1, 0, 0.4784314, 1,
1.416383, -1.892668, 2.511617, 1, 0, 0.4745098, 1,
1.427159, -0.923643, 0.5319331, 1, 0, 0.4666667, 1,
1.430838, -0.793663, 2.104949, 1, 0, 0.4627451, 1,
1.439518, -2.17555, 3.775076, 1, 0, 0.454902, 1,
1.439702, 1.058298, 1.417416, 1, 0, 0.4509804, 1,
1.449236, -1.104459, 1.08283, 1, 0, 0.4431373, 1,
1.476809, 1.065226, 1.525165, 1, 0, 0.4392157, 1,
1.478656, -0.09764502, -0.427714, 1, 0, 0.4313726, 1,
1.491673, -1.199015, 1.122957, 1, 0, 0.427451, 1,
1.496865, 0.2238549, -0.5524078, 1, 0, 0.4196078, 1,
1.516383, 0.609397, 1.893485, 1, 0, 0.4156863, 1,
1.536423, -0.5045602, 1.037209, 1, 0, 0.4078431, 1,
1.537925, 0.1678733, 0.6701886, 1, 0, 0.4039216, 1,
1.54039, 0.08956138, 3.09707, 1, 0, 0.3960784, 1,
1.544775, -1.005327, 0.7387309, 1, 0, 0.3882353, 1,
1.547315, 0.7420987, 1.567769, 1, 0, 0.3843137, 1,
1.554139, 1.235518, 2.083467, 1, 0, 0.3764706, 1,
1.554777, 2.580974, -0.4582523, 1, 0, 0.372549, 1,
1.554943, 0.5138639, 2.399674, 1, 0, 0.3647059, 1,
1.569147, -1.221945, 2.924124, 1, 0, 0.3607843, 1,
1.574199, -0.9312044, 1.290957, 1, 0, 0.3529412, 1,
1.593039, 0.5121732, 1.788539, 1, 0, 0.3490196, 1,
1.593586, -0.857343, 1.082004, 1, 0, 0.3411765, 1,
1.596979, 0.1433068, 0.8916059, 1, 0, 0.3372549, 1,
1.62021, 0.04238948, 1.754686, 1, 0, 0.3294118, 1,
1.620695, -1.719002, 3.832603, 1, 0, 0.3254902, 1,
1.625079, -0.5463099, 2.97017, 1, 0, 0.3176471, 1,
1.643411, 0.8480671, 0.4772478, 1, 0, 0.3137255, 1,
1.648739, 0.1047478, -0.1240607, 1, 0, 0.3058824, 1,
1.64914, -0.1594062, 2.218901, 1, 0, 0.2980392, 1,
1.65006, 1.379009, 1.613026, 1, 0, 0.2941177, 1,
1.65547, 1.392677, 2.336334, 1, 0, 0.2862745, 1,
1.678637, -0.2375977, 3.013929, 1, 0, 0.282353, 1,
1.680873, 0.1954076, 0.7366336, 1, 0, 0.2745098, 1,
1.692175, 0.5754341, 1.035044, 1, 0, 0.2705882, 1,
1.6971, -0.82836, 1.088352, 1, 0, 0.2627451, 1,
1.700437, -2.791683, 3.34786, 1, 0, 0.2588235, 1,
1.702563, 0.5279485, 0.9137809, 1, 0, 0.2509804, 1,
1.702779, 0.1906916, 0.4946235, 1, 0, 0.2470588, 1,
1.71263, -0.3524473, 1.156828, 1, 0, 0.2392157, 1,
1.729524, 0.3772788, 1.69425, 1, 0, 0.2352941, 1,
1.733394, 1.051959, 0.3058125, 1, 0, 0.227451, 1,
1.746576, 0.9096813, 1.142984, 1, 0, 0.2235294, 1,
1.748915, -0.1376274, 0.6010491, 1, 0, 0.2156863, 1,
1.757338, 1.852711, 1.392187, 1, 0, 0.2117647, 1,
1.773337, 0.1789618, 1.380751, 1, 0, 0.2039216, 1,
1.776425, -1.172742, 3.040728, 1, 0, 0.1960784, 1,
1.789804, 0.563482, 2.582608, 1, 0, 0.1921569, 1,
1.793291, -0.516991, 1.700056, 1, 0, 0.1843137, 1,
1.805386, 0.8164507, 2.486769, 1, 0, 0.1803922, 1,
1.811808, 0.4009263, -0.5157188, 1, 0, 0.172549, 1,
1.813529, -0.8514487, 2.193105, 1, 0, 0.1686275, 1,
1.819941, -0.9710062, 1.309805, 1, 0, 0.1607843, 1,
1.840069, 1.673542, 1.558179, 1, 0, 0.1568628, 1,
1.862448, 0.6736695, 0.8794187, 1, 0, 0.1490196, 1,
1.869079, -1.521899, 1.875558, 1, 0, 0.145098, 1,
1.880454, -1.190163, 1.141118, 1, 0, 0.1372549, 1,
1.882028, 0.6487678, 3.403599, 1, 0, 0.1333333, 1,
1.902089, -0.9851903, 1.793833, 1, 0, 0.1254902, 1,
1.912161, 0.03359591, 1.646686, 1, 0, 0.1215686, 1,
1.959749, 1.052029, 0.270489, 1, 0, 0.1137255, 1,
1.976774, -1.007107, 1.807983, 1, 0, 0.1098039, 1,
2.00852, -0.08544476, -0.9199088, 1, 0, 0.1019608, 1,
2.050155, 0.3749192, 2.896472, 1, 0, 0.09411765, 1,
2.051295, -0.6745086, 2.555306, 1, 0, 0.09019608, 1,
2.070458, 1.79607, 0.5303056, 1, 0, 0.08235294, 1,
2.078262, 0.9863285, 1.155283, 1, 0, 0.07843138, 1,
2.200701, -0.8620893, 1.47732, 1, 0, 0.07058824, 1,
2.306309, 0.0995633, 1.796924, 1, 0, 0.06666667, 1,
2.391816, 0.2606758, 2.045048, 1, 0, 0.05882353, 1,
2.405532, 0.4481047, 0.5610092, 1, 0, 0.05490196, 1,
2.414836, -1.690927, 2.79538, 1, 0, 0.04705882, 1,
2.437362, 1.434415, 0.8874929, 1, 0, 0.04313726, 1,
2.458077, -0.6182238, 3.187556, 1, 0, 0.03529412, 1,
2.563852, 2.271916, 0.1642119, 1, 0, 0.03137255, 1,
2.575684, -0.4811703, 2.43196, 1, 0, 0.02352941, 1,
2.669033, -0.6267441, 0.8282592, 1, 0, 0.01960784, 1,
2.77405, -0.3639722, 1.268989, 1, 0, 0.01176471, 1,
3.08716, 0.1543335, 1.806699, 1, 0, 0.007843138, 1
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
-0.4018461, -4.701628, -6.425393, 0, -0.5, 0.5, 0.5,
-0.4018461, -4.701628, -6.425393, 1, -0.5, 0.5, 0.5,
-0.4018461, -4.701628, -6.425393, 1, 1.5, 0.5, 0.5,
-0.4018461, -4.701628, -6.425393, 0, 1.5, 0.5, 0.5
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
-5.073625, -0.439116, -6.425393, 0, -0.5, 0.5, 0.5,
-5.073625, -0.439116, -6.425393, 1, -0.5, 0.5, 0.5,
-5.073625, -0.439116, -6.425393, 1, 1.5, 0.5, 0.5,
-5.073625, -0.439116, -6.425393, 0, 1.5, 0.5, 0.5
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
-5.073625, -4.701628, 0.2791195, 0, -0.5, 0.5, 0.5,
-5.073625, -4.701628, 0.2791195, 1, -0.5, 0.5, 0.5,
-5.073625, -4.701628, 0.2791195, 1, 1.5, 0.5, 0.5,
-5.073625, -4.701628, 0.2791195, 0, 1.5, 0.5, 0.5
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
-3, -3.717971, -4.878198,
3, -3.717971, -4.878198,
-3, -3.717971, -4.878198,
-3, -3.881914, -5.136064,
-2, -3.717971, -4.878198,
-2, -3.881914, -5.136064,
-1, -3.717971, -4.878198,
-1, -3.881914, -5.136064,
0, -3.717971, -4.878198,
0, -3.881914, -5.136064,
1, -3.717971, -4.878198,
1, -3.881914, -5.136064,
2, -3.717971, -4.878198,
2, -3.881914, -5.136064,
3, -3.717971, -4.878198,
3, -3.881914, -5.136064
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
-3, -4.2098, -5.651795, 0, -0.5, 0.5, 0.5,
-3, -4.2098, -5.651795, 1, -0.5, 0.5, 0.5,
-3, -4.2098, -5.651795, 1, 1.5, 0.5, 0.5,
-3, -4.2098, -5.651795, 0, 1.5, 0.5, 0.5,
-2, -4.2098, -5.651795, 0, -0.5, 0.5, 0.5,
-2, -4.2098, -5.651795, 1, -0.5, 0.5, 0.5,
-2, -4.2098, -5.651795, 1, 1.5, 0.5, 0.5,
-2, -4.2098, -5.651795, 0, 1.5, 0.5, 0.5,
-1, -4.2098, -5.651795, 0, -0.5, 0.5, 0.5,
-1, -4.2098, -5.651795, 1, -0.5, 0.5, 0.5,
-1, -4.2098, -5.651795, 1, 1.5, 0.5, 0.5,
-1, -4.2098, -5.651795, 0, 1.5, 0.5, 0.5,
0, -4.2098, -5.651795, 0, -0.5, 0.5, 0.5,
0, -4.2098, -5.651795, 1, -0.5, 0.5, 0.5,
0, -4.2098, -5.651795, 1, 1.5, 0.5, 0.5,
0, -4.2098, -5.651795, 0, 1.5, 0.5, 0.5,
1, -4.2098, -5.651795, 0, -0.5, 0.5, 0.5,
1, -4.2098, -5.651795, 1, -0.5, 0.5, 0.5,
1, -4.2098, -5.651795, 1, 1.5, 0.5, 0.5,
1, -4.2098, -5.651795, 0, 1.5, 0.5, 0.5,
2, -4.2098, -5.651795, 0, -0.5, 0.5, 0.5,
2, -4.2098, -5.651795, 1, -0.5, 0.5, 0.5,
2, -4.2098, -5.651795, 1, 1.5, 0.5, 0.5,
2, -4.2098, -5.651795, 0, 1.5, 0.5, 0.5,
3, -4.2098, -5.651795, 0, -0.5, 0.5, 0.5,
3, -4.2098, -5.651795, 1, -0.5, 0.5, 0.5,
3, -4.2098, -5.651795, 1, 1.5, 0.5, 0.5,
3, -4.2098, -5.651795, 0, 1.5, 0.5, 0.5
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
-3.995522, -3, -4.878198,
-3.995522, 2, -4.878198,
-3.995522, -3, -4.878198,
-4.175206, -3, -5.136064,
-3.995522, -2, -4.878198,
-4.175206, -2, -5.136064,
-3.995522, -1, -4.878198,
-4.175206, -1, -5.136064,
-3.995522, 0, -4.878198,
-4.175206, 0, -5.136064,
-3.995522, 1, -4.878198,
-4.175206, 1, -5.136064,
-3.995522, 2, -4.878198,
-4.175206, 2, -5.136064
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
-4.534574, -3, -5.651795, 0, -0.5, 0.5, 0.5,
-4.534574, -3, -5.651795, 1, -0.5, 0.5, 0.5,
-4.534574, -3, -5.651795, 1, 1.5, 0.5, 0.5,
-4.534574, -3, -5.651795, 0, 1.5, 0.5, 0.5,
-4.534574, -2, -5.651795, 0, -0.5, 0.5, 0.5,
-4.534574, -2, -5.651795, 1, -0.5, 0.5, 0.5,
-4.534574, -2, -5.651795, 1, 1.5, 0.5, 0.5,
-4.534574, -2, -5.651795, 0, 1.5, 0.5, 0.5,
-4.534574, -1, -5.651795, 0, -0.5, 0.5, 0.5,
-4.534574, -1, -5.651795, 1, -0.5, 0.5, 0.5,
-4.534574, -1, -5.651795, 1, 1.5, 0.5, 0.5,
-4.534574, -1, -5.651795, 0, 1.5, 0.5, 0.5,
-4.534574, 0, -5.651795, 0, -0.5, 0.5, 0.5,
-4.534574, 0, -5.651795, 1, -0.5, 0.5, 0.5,
-4.534574, 0, -5.651795, 1, 1.5, 0.5, 0.5,
-4.534574, 0, -5.651795, 0, 1.5, 0.5, 0.5,
-4.534574, 1, -5.651795, 0, -0.5, 0.5, 0.5,
-4.534574, 1, -5.651795, 1, -0.5, 0.5, 0.5,
-4.534574, 1, -5.651795, 1, 1.5, 0.5, 0.5,
-4.534574, 1, -5.651795, 0, 1.5, 0.5, 0.5,
-4.534574, 2, -5.651795, 0, -0.5, 0.5, 0.5,
-4.534574, 2, -5.651795, 1, -0.5, 0.5, 0.5,
-4.534574, 2, -5.651795, 1, 1.5, 0.5, 0.5,
-4.534574, 2, -5.651795, 0, 1.5, 0.5, 0.5
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
-3.995522, -3.717971, -4,
-3.995522, -3.717971, 4,
-3.995522, -3.717971, -4,
-4.175206, -3.881914, -4,
-3.995522, -3.717971, -2,
-4.175206, -3.881914, -2,
-3.995522, -3.717971, 0,
-4.175206, -3.881914, 0,
-3.995522, -3.717971, 2,
-4.175206, -3.881914, 2,
-3.995522, -3.717971, 4,
-4.175206, -3.881914, 4
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
-4.534574, -4.2098, -4, 0, -0.5, 0.5, 0.5,
-4.534574, -4.2098, -4, 1, -0.5, 0.5, 0.5,
-4.534574, -4.2098, -4, 1, 1.5, 0.5, 0.5,
-4.534574, -4.2098, -4, 0, 1.5, 0.5, 0.5,
-4.534574, -4.2098, -2, 0, -0.5, 0.5, 0.5,
-4.534574, -4.2098, -2, 1, -0.5, 0.5, 0.5,
-4.534574, -4.2098, -2, 1, 1.5, 0.5, 0.5,
-4.534574, -4.2098, -2, 0, 1.5, 0.5, 0.5,
-4.534574, -4.2098, 0, 0, -0.5, 0.5, 0.5,
-4.534574, -4.2098, 0, 1, -0.5, 0.5, 0.5,
-4.534574, -4.2098, 0, 1, 1.5, 0.5, 0.5,
-4.534574, -4.2098, 0, 0, 1.5, 0.5, 0.5,
-4.534574, -4.2098, 2, 0, -0.5, 0.5, 0.5,
-4.534574, -4.2098, 2, 1, -0.5, 0.5, 0.5,
-4.534574, -4.2098, 2, 1, 1.5, 0.5, 0.5,
-4.534574, -4.2098, 2, 0, 1.5, 0.5, 0.5,
-4.534574, -4.2098, 4, 0, -0.5, 0.5, 0.5,
-4.534574, -4.2098, 4, 1, -0.5, 0.5, 0.5,
-4.534574, -4.2098, 4, 1, 1.5, 0.5, 0.5,
-4.534574, -4.2098, 4, 0, 1.5, 0.5, 0.5
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
-3.995522, -3.717971, -4.878198,
-3.995522, 2.839739, -4.878198,
-3.995522, -3.717971, 5.436437,
-3.995522, 2.839739, 5.436437,
-3.995522, -3.717971, -4.878198,
-3.995522, -3.717971, 5.436437,
-3.995522, 2.839739, -4.878198,
-3.995522, 2.839739, 5.436437,
-3.995522, -3.717971, -4.878198,
3.19183, -3.717971, -4.878198,
-3.995522, -3.717971, 5.436437,
3.19183, -3.717971, 5.436437,
-3.995522, 2.839739, -4.878198,
3.19183, 2.839739, -4.878198,
-3.995522, 2.839739, 5.436437,
3.19183, 2.839739, 5.436437,
3.19183, -3.717971, -4.878198,
3.19183, 2.839739, -4.878198,
3.19183, -3.717971, 5.436437,
3.19183, 2.839739, 5.436437,
3.19183, -3.717971, -4.878198,
3.19183, -3.717971, 5.436437,
3.19183, 2.839739, -4.878198,
3.19183, 2.839739, 5.436437
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
var radius = 7.571485;
var distance = 33.68639;
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
mvMatrix.translate( 0.4018461, 0.439116, -0.2791195 );
mvMatrix.scale( 1.139006, 1.248368, 0.7936721 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.68639);
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
phosphoramidite<-read.table("phosphoramidite.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosphoramidite$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidite' not found
```

```r
y<-phosphoramidite$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidite' not found
```

```r
z<-phosphoramidite$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidite' not found
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
-3.890852, -1.609477, -3.382145, 0, 0, 1, 1, 1,
-2.809677, 0.9100389, -0.5939435, 1, 0, 0, 1, 1,
-2.783267, -0.3327332, -1.944301, 1, 0, 0, 1, 1,
-2.770332, 0.5770187, -2.266735, 1, 0, 0, 1, 1,
-2.645499, -0.7478183, -2.128538, 1, 0, 0, 1, 1,
-2.64538, -1.992333, -2.677236, 1, 0, 0, 1, 1,
-2.569354, -0.1104543, -1.102659, 0, 0, 0, 1, 1,
-2.414499, 0.0002938217, -3.264259, 0, 0, 0, 1, 1,
-2.334885, 2.528829, -1.751074, 0, 0, 0, 1, 1,
-2.332726, 0.04948213, -1.430845, 0, 0, 0, 1, 1,
-2.332617, 0.3169265, -1.880791, 0, 0, 0, 1, 1,
-2.24232, -0.9696457, -3.818394, 0, 0, 0, 1, 1,
-2.192413, -0.4228711, -3.402274, 0, 0, 0, 1, 1,
-2.18178, -1.150063, -2.420938, 1, 1, 1, 1, 1,
-2.178456, 1.01202, -1.575606, 1, 1, 1, 1, 1,
-2.164986, 0.3535903, -1.12883, 1, 1, 1, 1, 1,
-2.147719, 0.5353078, -3.181031, 1, 1, 1, 1, 1,
-2.122111, -0.6860172, -4.162159, 1, 1, 1, 1, 1,
-2.058707, 1.697041, 0.05643534, 1, 1, 1, 1, 1,
-2.052773, -2.20846, -3.239768, 1, 1, 1, 1, 1,
-2.025868, 0.6014262, 1.154504, 1, 1, 1, 1, 1,
-2.017339, 0.04676666, -3.292804, 1, 1, 1, 1, 1,
-2.005123, -0.3589477, -0.8356274, 1, 1, 1, 1, 1,
-2.003961, -1.002838, -0.6412706, 1, 1, 1, 1, 1,
-1.994453, -1.391059, -2.302617, 1, 1, 1, 1, 1,
-1.99229, -0.4504057, -1.531168, 1, 1, 1, 1, 1,
-1.975905, -0.8107963, -1.807432, 1, 1, 1, 1, 1,
-1.967039, -0.2151205, -1.644161, 1, 1, 1, 1, 1,
-1.961594, 0.04354412, -3.384697, 0, 0, 1, 1, 1,
-1.957781, 1.212077, -0.1311865, 1, 0, 0, 1, 1,
-1.948979, -2.014055, -1.212732, 1, 0, 0, 1, 1,
-1.922582, -0.1520476, -1.28074, 1, 0, 0, 1, 1,
-1.908895, -0.782562, -2.652656, 1, 0, 0, 1, 1,
-1.891278, 0.6706071, -0.7328176, 1, 0, 0, 1, 1,
-1.862796, -1.147376, -2.360486, 0, 0, 0, 1, 1,
-1.848093, -0.7041907, -1.54648, 0, 0, 0, 1, 1,
-1.827772, -0.5029374, -2.077078, 0, 0, 0, 1, 1,
-1.811096, 0.4709451, -2.566939, 0, 0, 0, 1, 1,
-1.804592, -0.3885529, -1.077858, 0, 0, 0, 1, 1,
-1.801383, -0.8915788, -1.533526, 0, 0, 0, 1, 1,
-1.781725, 1.543421, -1.13238, 0, 0, 0, 1, 1,
-1.758353, -0.453964, -3.174619, 1, 1, 1, 1, 1,
-1.746687, -1.531659, -1.03256, 1, 1, 1, 1, 1,
-1.742522, 0.1971909, -1.512074, 1, 1, 1, 1, 1,
-1.737798, -1.404472, -2.865694, 1, 1, 1, 1, 1,
-1.724428, -0.1508627, -0.3639208, 1, 1, 1, 1, 1,
-1.719272, 1.054874, -2.239397, 1, 1, 1, 1, 1,
-1.681207, 0.1338051, -2.747124, 1, 1, 1, 1, 1,
-1.670836, -0.630203, -2.42037, 1, 1, 1, 1, 1,
-1.647028, -0.3881196, -2.809695, 1, 1, 1, 1, 1,
-1.642413, 0.09529981, -2.486202, 1, 1, 1, 1, 1,
-1.636907, 0.5372351, -1.2186, 1, 1, 1, 1, 1,
-1.618104, -1.438701, -3.657001, 1, 1, 1, 1, 1,
-1.617053, 0.4006494, -0.4392999, 1, 1, 1, 1, 1,
-1.612573, -0.09556597, -1.139457, 1, 1, 1, 1, 1,
-1.602749, 0.3413275, -1.026387, 1, 1, 1, 1, 1,
-1.601234, -0.630931, -1.680203, 0, 0, 1, 1, 1,
-1.590628, -0.1632778, -0.7982583, 1, 0, 0, 1, 1,
-1.590023, 1.42719, -1.584852, 1, 0, 0, 1, 1,
-1.566601, 1.383972, -2.508236, 1, 0, 0, 1, 1,
-1.555052, 2.442409, -0.8409861, 1, 0, 0, 1, 1,
-1.550283, 0.4995733, -1.51385, 1, 0, 0, 1, 1,
-1.521035, 0.9688359, -1.836852, 0, 0, 0, 1, 1,
-1.52038, 1.616029, -0.9155678, 0, 0, 0, 1, 1,
-1.518996, 1.40907, -2.51905, 0, 0, 0, 1, 1,
-1.517994, 0.647328, -1.356773, 0, 0, 0, 1, 1,
-1.515933, -0.1253579, -2.956969, 0, 0, 0, 1, 1,
-1.509634, 0.6546287, 1.216108, 0, 0, 0, 1, 1,
-1.506747, 0.2273359, -1.273415, 0, 0, 0, 1, 1,
-1.496691, 0.7640928, -0.9404628, 1, 1, 1, 1, 1,
-1.486754, -0.3447615, -1.190592, 1, 1, 1, 1, 1,
-1.483143, -0.5524527, -0.6300187, 1, 1, 1, 1, 1,
-1.482246, -0.291505, -3.793248, 1, 1, 1, 1, 1,
-1.480072, 0.4976322, -1.798858, 1, 1, 1, 1, 1,
-1.471635, -0.5609569, -3.136473, 1, 1, 1, 1, 1,
-1.466917, 0.5424016, -0.3500721, 1, 1, 1, 1, 1,
-1.451602, 1.539005, -0.6315458, 1, 1, 1, 1, 1,
-1.425727, -0.03646579, -2.051837, 1, 1, 1, 1, 1,
-1.423149, -2.409122, -2.044068, 1, 1, 1, 1, 1,
-1.407058, 1.677367, -0.7680358, 1, 1, 1, 1, 1,
-1.403203, -0.4771648, -1.875052, 1, 1, 1, 1, 1,
-1.3976, -0.8630653, -1.125128, 1, 1, 1, 1, 1,
-1.393717, -0.02228412, -1.007566, 1, 1, 1, 1, 1,
-1.388123, -0.9898002, -3.980588, 1, 1, 1, 1, 1,
-1.368124, -0.496543, -2.216902, 0, 0, 1, 1, 1,
-1.364608, -0.09317537, -2.548045, 1, 0, 0, 1, 1,
-1.363536, -0.1345769, -2.642197, 1, 0, 0, 1, 1,
-1.350859, -0.6798169, -2.936097, 1, 0, 0, 1, 1,
-1.344826, -0.0597082, -1.963165, 1, 0, 0, 1, 1,
-1.344556, -1.31721, -2.270768, 1, 0, 0, 1, 1,
-1.341313, -1.517485, -4.393661, 0, 0, 0, 1, 1,
-1.338228, 1.11045, 0.530874, 0, 0, 0, 1, 1,
-1.323748, 0.8284733, -1.020011, 0, 0, 0, 1, 1,
-1.322673, -0.8185262, -3.178143, 0, 0, 0, 1, 1,
-1.319431, 0.5520657, -0.4420436, 0, 0, 0, 1, 1,
-1.31444, -1.186196, -2.768959, 0, 0, 0, 1, 1,
-1.308677, 0.9737827, -2.406294, 0, 0, 0, 1, 1,
-1.307534, -0.4821042, -0.3924507, 1, 1, 1, 1, 1,
-1.30619, -1.372466, -1.738621, 1, 1, 1, 1, 1,
-1.279431, 0.07229103, -3.366136, 1, 1, 1, 1, 1,
-1.252671, 0.7284589, -0.762805, 1, 1, 1, 1, 1,
-1.229311, 0.2884173, -1.535153, 1, 1, 1, 1, 1,
-1.227773, -1.809249, -1.475441, 1, 1, 1, 1, 1,
-1.224063, -0.0644105, -1.79188, 1, 1, 1, 1, 1,
-1.211819, 0.1008607, -1.300127, 1, 1, 1, 1, 1,
-1.200683, -0.9220085, -2.535287, 1, 1, 1, 1, 1,
-1.193837, 1.61522, 1.084575, 1, 1, 1, 1, 1,
-1.190179, 0.6881527, -0.3251677, 1, 1, 1, 1, 1,
-1.186413, 1.282782, -0.9558418, 1, 1, 1, 1, 1,
-1.177792, -0.08149374, -0.5555351, 1, 1, 1, 1, 1,
-1.177779, 0.3453256, -1.72213, 1, 1, 1, 1, 1,
-1.176251, -1.47143, -2.271659, 1, 1, 1, 1, 1,
-1.171501, 1.518358, -1.684777, 0, 0, 1, 1, 1,
-1.171437, 0.07194885, -1.970684, 1, 0, 0, 1, 1,
-1.162061, 0.03514281, -2.599367, 1, 0, 0, 1, 1,
-1.150133, -0.7043329, -1.138393, 1, 0, 0, 1, 1,
-1.148555, -0.3843533, -2.916061, 1, 0, 0, 1, 1,
-1.145273, -0.8196549, -2.84071, 1, 0, 0, 1, 1,
-1.134521, -0.7311169, -0.8847676, 0, 0, 0, 1, 1,
-1.122024, 0.16256, 0.1084509, 0, 0, 0, 1, 1,
-1.121851, -1.118695, -3.053135, 0, 0, 0, 1, 1,
-1.117363, -0.5914828, -0.5127869, 0, 0, 0, 1, 1,
-1.115758, 1.964256, -1.200512, 0, 0, 0, 1, 1,
-1.112093, -0.0661834, -2.775359, 0, 0, 0, 1, 1,
-1.111936, -0.8130056, -1.068447, 0, 0, 0, 1, 1,
-1.10921, 0.5716709, -1.8843, 1, 1, 1, 1, 1,
-1.099, 0.272315, -1.311868, 1, 1, 1, 1, 1,
-1.093874, -0.7598585, -2.691267, 1, 1, 1, 1, 1,
-1.093133, 0.02193261, -2.437068, 1, 1, 1, 1, 1,
-1.093042, 0.03062062, -2.645806, 1, 1, 1, 1, 1,
-1.092632, -1.387884, -2.245131, 1, 1, 1, 1, 1,
-1.089856, -0.8663028, -1.891995, 1, 1, 1, 1, 1,
-1.089747, -1.939976, -1.108961, 1, 1, 1, 1, 1,
-1.089589, -0.6253845, -1.744667, 1, 1, 1, 1, 1,
-1.087117, -0.6255957, -3.599456, 1, 1, 1, 1, 1,
-1.084902, 0.4628225, -2.517396, 1, 1, 1, 1, 1,
-1.081784, -0.2879419, -2.12544, 1, 1, 1, 1, 1,
-1.077468, 0.8477781, -1.325129, 1, 1, 1, 1, 1,
-1.069093, -0.8296065, -2.241843, 1, 1, 1, 1, 1,
-1.06688, 0.4087364, -0.7915974, 1, 1, 1, 1, 1,
-1.058586, 0.3119037, -0.1429584, 0, 0, 1, 1, 1,
-1.054515, -1.0194, -1.046896, 1, 0, 0, 1, 1,
-1.046677, -0.1339801, -2.497048, 1, 0, 0, 1, 1,
-1.037111, -0.1285802, -1.725878, 1, 0, 0, 1, 1,
-1.034541, 0.2946575, -0.3263356, 1, 0, 0, 1, 1,
-1.032352, 0.8266577, 0.1261529, 1, 0, 0, 1, 1,
-1.02793, 0.3876077, -1.359773, 0, 0, 0, 1, 1,
-1.026457, 0.2761689, -2.266173, 0, 0, 0, 1, 1,
-1.023791, -0.5849513, -2.335393, 0, 0, 0, 1, 1,
-1.005472, 0.4384797, -2.820021, 0, 0, 0, 1, 1,
-1.005264, 1.302256, -0.6943202, 0, 0, 0, 1, 1,
-1.005051, 0.232078, -1.703452, 0, 0, 0, 1, 1,
-1.002962, 0.6542461, 0.6081427, 0, 0, 0, 1, 1,
-0.9961687, -0.2212341, -2.215926, 1, 1, 1, 1, 1,
-0.9954666, 0.4133878, -1.735555, 1, 1, 1, 1, 1,
-0.9911193, -0.4682656, -1.301996, 1, 1, 1, 1, 1,
-0.9851584, -1.162232, -2.088434, 1, 1, 1, 1, 1,
-0.9819606, -0.3449138, -1.775697, 1, 1, 1, 1, 1,
-0.9803464, -1.893938, -1.464166, 1, 1, 1, 1, 1,
-0.9802865, -2.768612, -1.804455, 1, 1, 1, 1, 1,
-0.9790698, -0.4575773, -3.079144, 1, 1, 1, 1, 1,
-0.9729955, -0.5369761, -4.169897, 1, 1, 1, 1, 1,
-0.9719853, 0.1911529, -1.300325, 1, 1, 1, 1, 1,
-0.9700409, -1.107043, -4.610165, 1, 1, 1, 1, 1,
-0.9695889, 1.148712, 0.2523591, 1, 1, 1, 1, 1,
-0.9649869, -0.8529394, -2.700721, 1, 1, 1, 1, 1,
-0.9644215, -0.5748609, -1.430121, 1, 1, 1, 1, 1,
-0.9543939, -0.2691636, 0.215687, 1, 1, 1, 1, 1,
-0.9528612, 0.8782983, 0.2226572, 0, 0, 1, 1, 1,
-0.9522061, -0.4842133, -2.142219, 1, 0, 0, 1, 1,
-0.9375048, 0.1079975, -1.353289, 1, 0, 0, 1, 1,
-0.9355141, -0.7005163, -2.043384, 1, 0, 0, 1, 1,
-0.9344592, 1.597915, -2.048058, 1, 0, 0, 1, 1,
-0.931406, -0.438253, -0.321548, 1, 0, 0, 1, 1,
-0.930327, -0.4886839, -2.232185, 0, 0, 0, 1, 1,
-0.919634, -0.5366483, -2.722893, 0, 0, 0, 1, 1,
-0.9185061, -0.7615159, -2.598483, 0, 0, 0, 1, 1,
-0.9171031, -0.7847143, -2.986157, 0, 0, 0, 1, 1,
-0.9170412, 0.8078781, -0.2458856, 0, 0, 0, 1, 1,
-0.9152687, -1.037614, -1.459027, 0, 0, 0, 1, 1,
-0.9020741, -2.994701, -3.981441, 0, 0, 0, 1, 1,
-0.887248, -1.2535, -3.093206, 1, 1, 1, 1, 1,
-0.8854356, 1.040054, -1.541199, 1, 1, 1, 1, 1,
-0.8850306, -1.475757, -2.249461, 1, 1, 1, 1, 1,
-0.884379, 0.4921199, -0.6588023, 1, 1, 1, 1, 1,
-0.8644214, -1.598759, -1.035727, 1, 1, 1, 1, 1,
-0.8641627, 1.386269, -0.5166531, 1, 1, 1, 1, 1,
-0.8635704, 0.7597873, -1.541654, 1, 1, 1, 1, 1,
-0.8624411, -0.2454813, -3.489089, 1, 1, 1, 1, 1,
-0.859822, -0.1288964, -1.498599, 1, 1, 1, 1, 1,
-0.8595507, -1.890985, -2.501049, 1, 1, 1, 1, 1,
-0.8546501, -0.7176854, -3.085056, 1, 1, 1, 1, 1,
-0.8540797, -0.771057, -2.715799, 1, 1, 1, 1, 1,
-0.8539534, -0.54092, -2.03114, 1, 1, 1, 1, 1,
-0.8536295, -0.478852, -0.789369, 1, 1, 1, 1, 1,
-0.8486969, 0.8238627, 0.8961869, 1, 1, 1, 1, 1,
-0.843571, -1.313759, -1.455731, 0, 0, 1, 1, 1,
-0.8403776, -0.9881764, -3.068265, 1, 0, 0, 1, 1,
-0.8393866, -0.5810905, -1.400551, 1, 0, 0, 1, 1,
-0.8365865, 0.5581559, -1.413842, 1, 0, 0, 1, 1,
-0.8337483, -1.621938, -3.464956, 1, 0, 0, 1, 1,
-0.8319016, -0.07694882, -1.701196, 1, 0, 0, 1, 1,
-0.8226147, -0.2819266, -2.83864, 0, 0, 0, 1, 1,
-0.8213486, -1.853649, -4.044384, 0, 0, 0, 1, 1,
-0.8167297, 0.2633163, -1.655015, 0, 0, 0, 1, 1,
-0.8146306, 0.719986, -1.554018, 0, 0, 0, 1, 1,
-0.8073477, -1.411017, -1.42868, 0, 0, 0, 1, 1,
-0.8060477, 1.063881, -1.68689, 0, 0, 0, 1, 1,
-0.8058919, 1.007918, -0.1464413, 0, 0, 0, 1, 1,
-0.8023545, -0.3490649, -0.5151239, 1, 1, 1, 1, 1,
-0.7994538, 1.676539, -1.560705, 1, 1, 1, 1, 1,
-0.7987527, 0.135978, -1.423895, 1, 1, 1, 1, 1,
-0.795145, 0.4433007, -0.3508824, 1, 1, 1, 1, 1,
-0.7919134, 0.6109617, -1.248505, 1, 1, 1, 1, 1,
-0.7902024, 0.272689, -0.7346247, 1, 1, 1, 1, 1,
-0.7653496, 2.310721, 0.1159442, 1, 1, 1, 1, 1,
-0.7638766, -2.104724, -3.208098, 1, 1, 1, 1, 1,
-0.7623925, -1.013727, -3.461652, 1, 1, 1, 1, 1,
-0.7609913, 0.8890396, 0.119149, 1, 1, 1, 1, 1,
-0.7602176, 1.297492, -1.867198, 1, 1, 1, 1, 1,
-0.7558849, 0.3100222, -0.2920648, 1, 1, 1, 1, 1,
-0.7523149, 0.9093099, -0.1657067, 1, 1, 1, 1, 1,
-0.7516266, 1.09893, 0.06842545, 1, 1, 1, 1, 1,
-0.7493208, -1.017776, -2.325393, 1, 1, 1, 1, 1,
-0.7480232, 1.928963, -0.2567506, 0, 0, 1, 1, 1,
-0.7465884, -0.9709147, -2.453094, 1, 0, 0, 1, 1,
-0.7463226, 0.2895955, -1.320401, 1, 0, 0, 1, 1,
-0.7409474, 0.4626964, -0.3468576, 1, 0, 0, 1, 1,
-0.738518, -0.9795266, -1.11982, 1, 0, 0, 1, 1,
-0.7359898, -1.022069, -4.28968, 1, 0, 0, 1, 1,
-0.7315455, -0.6950974, -2.106068, 0, 0, 0, 1, 1,
-0.7290379, -0.4279592, -2.2972, 0, 0, 0, 1, 1,
-0.7264501, 1.099097, -0.6921287, 0, 0, 0, 1, 1,
-0.7258788, 0.2368726, -3.031613, 0, 0, 0, 1, 1,
-0.7236462, -0.7417843, -1.917355, 0, 0, 0, 1, 1,
-0.7232247, -0.3846878, -2.557037, 0, 0, 0, 1, 1,
-0.7223437, -0.8499715, -2.248794, 0, 0, 0, 1, 1,
-0.7198631, 0.3649444, -1.463105, 1, 1, 1, 1, 1,
-0.7190625, 0.9109747, -0.2016375, 1, 1, 1, 1, 1,
-0.7182398, 0.1858912, -1.259751, 1, 1, 1, 1, 1,
-0.7180122, -0.01724361, -2.852825, 1, 1, 1, 1, 1,
-0.7172924, 0.5766079, 0.5947515, 1, 1, 1, 1, 1,
-0.7153223, 0.445785, -0.9307471, 1, 1, 1, 1, 1,
-0.7145408, -0.08789191, -1.335823, 1, 1, 1, 1, 1,
-0.706367, 1.918696, 0.7917237, 1, 1, 1, 1, 1,
-0.6989449, -1.284256, -1.034327, 1, 1, 1, 1, 1,
-0.6947993, -0.2085361, -2.385217, 1, 1, 1, 1, 1,
-0.6932728, -0.7912409, -1.720633, 1, 1, 1, 1, 1,
-0.692142, -0.4432693, -3.461422, 1, 1, 1, 1, 1,
-0.6920556, 0.542457, -0.7168392, 1, 1, 1, 1, 1,
-0.6898525, 1.403942, 0.9428451, 1, 1, 1, 1, 1,
-0.6865677, 0.2811649, -2.260028, 1, 1, 1, 1, 1,
-0.680725, -0.6634129, -1.914325, 0, 0, 1, 1, 1,
-0.680623, 1.333144, -1.12904, 1, 0, 0, 1, 1,
-0.6799049, 0.54772, -2.130036, 1, 0, 0, 1, 1,
-0.6795619, -1.564047, -3.875062, 1, 0, 0, 1, 1,
-0.6763303, 0.817331, -1.717157, 1, 0, 0, 1, 1,
-0.6730136, -0.003708199, -1.278569, 1, 0, 0, 1, 1,
-0.6715248, 0.7643233, 0.6823351, 0, 0, 0, 1, 1,
-0.6708232, -0.9188021, -1.368432, 0, 0, 0, 1, 1,
-0.6666592, -0.1606923, -1.092439, 0, 0, 0, 1, 1,
-0.6646802, -0.5756009, -0.8681859, 0, 0, 0, 1, 1,
-0.6644038, -0.5538041, -1.169261, 0, 0, 0, 1, 1,
-0.6621617, -0.966494, -2.598639, 0, 0, 0, 1, 1,
-0.6514595, 1.006183, -1.882951, 0, 0, 0, 1, 1,
-0.6475589, 0.5757559, 2.45104, 1, 1, 1, 1, 1,
-0.6473397, 0.604992, -0.5945572, 1, 1, 1, 1, 1,
-0.6426381, -0.7682262, -1.966832, 1, 1, 1, 1, 1,
-0.6388822, 0.4524824, 0.02202433, 1, 1, 1, 1, 1,
-0.6381619, -0.6269342, -2.309498, 1, 1, 1, 1, 1,
-0.632024, 0.3383515, 0.947333, 1, 1, 1, 1, 1,
-0.6302345, -0.4523673, -2.407161, 1, 1, 1, 1, 1,
-0.6279433, 0.9853544, -0.8912399, 1, 1, 1, 1, 1,
-0.6263924, 0.6649212, -0.8587493, 1, 1, 1, 1, 1,
-0.6244036, 0.7874426, -0.5274612, 1, 1, 1, 1, 1,
-0.6211274, -0.3744637, -3.327666, 1, 1, 1, 1, 1,
-0.6186961, -0.0239244, -1.072046, 1, 1, 1, 1, 1,
-0.6163445, 0.4292704, 0.0701601, 1, 1, 1, 1, 1,
-0.615675, -0.9740807, -3.56277, 1, 1, 1, 1, 1,
-0.6123736, 0.3527673, -2.551863, 1, 1, 1, 1, 1,
-0.5940847, 0.03420123, -1.686071, 0, 0, 1, 1, 1,
-0.5855854, -1.115214, -2.878551, 1, 0, 0, 1, 1,
-0.5775666, -1.109343, -0.4606847, 1, 0, 0, 1, 1,
-0.57718, 0.9876921, -0.3163717, 1, 0, 0, 1, 1,
-0.5725281, 0.6681579, -0.1381379, 1, 0, 0, 1, 1,
-0.5717399, 2.170275, 0.7345042, 1, 0, 0, 1, 1,
-0.5628676, 0.2191507, -0.7534294, 0, 0, 0, 1, 1,
-0.5592036, 0.07512281, -1.266715, 0, 0, 0, 1, 1,
-0.5583026, -1.212639, -2.278152, 0, 0, 0, 1, 1,
-0.5523875, 0.07208858, -1.774636, 0, 0, 0, 1, 1,
-0.549733, -0.9405823, -1.977385, 0, 0, 0, 1, 1,
-0.5455726, -0.738521, -1.414795, 0, 0, 0, 1, 1,
-0.5444418, -0.1937121, -1.80917, 0, 0, 0, 1, 1,
-0.5412782, 0.2271014, -2.47144, 1, 1, 1, 1, 1,
-0.540392, -0.3564556, -2.875209, 1, 1, 1, 1, 1,
-0.5383886, -1.065052, -3.541741, 1, 1, 1, 1, 1,
-0.5375129, 0.8615214, -0.6967688, 1, 1, 1, 1, 1,
-0.5369216, -0.4197547, -2.650219, 1, 1, 1, 1, 1,
-0.5354928, -0.9125529, -0.842881, 1, 1, 1, 1, 1,
-0.5320486, 0.7100098, -1.455335, 1, 1, 1, 1, 1,
-0.5295826, -0.077851, -3.792693, 1, 1, 1, 1, 1,
-0.5276365, -0.27101, -3.418772, 1, 1, 1, 1, 1,
-0.5253765, -1.350162, -2.33176, 1, 1, 1, 1, 1,
-0.5248492, 1.489569, -1.991485, 1, 1, 1, 1, 1,
-0.5236011, 0.4576695, 1.501411, 1, 1, 1, 1, 1,
-0.5127497, -0.3744204, -3.616361, 1, 1, 1, 1, 1,
-0.510353, 1.090259, -1.281492, 1, 1, 1, 1, 1,
-0.5091017, 0.8672739, -1.252611, 1, 1, 1, 1, 1,
-0.496561, -0.01345369, -1.609334, 0, 0, 1, 1, 1,
-0.4922866, -0.03392373, -2.15679, 1, 0, 0, 1, 1,
-0.491921, -0.04483788, -2.937481, 1, 0, 0, 1, 1,
-0.4897133, -0.344219, -2.213151, 1, 0, 0, 1, 1,
-0.4873835, -0.8690026, -2.672166, 1, 0, 0, 1, 1,
-0.487053, 0.4913003, -0.7272753, 1, 0, 0, 1, 1,
-0.4868992, 0.4706931, 0.2426167, 0, 0, 0, 1, 1,
-0.4864789, -1.116768, -1.528519, 0, 0, 0, 1, 1,
-0.4846466, 1.017262, 0.5077153, 0, 0, 0, 1, 1,
-0.4841715, -2.07762, -2.443468, 0, 0, 0, 1, 1,
-0.483057, 1.148131, -2.608779, 0, 0, 0, 1, 1,
-0.4824591, -1.489661, -4.133457, 0, 0, 0, 1, 1,
-0.4726875, 1.689764, 0.8735422, 0, 0, 0, 1, 1,
-0.466826, -0.9682435, -2.326571, 1, 1, 1, 1, 1,
-0.4647427, -0.8527541, -2.148955, 1, 1, 1, 1, 1,
-0.4642928, 1.800478, -0.4514572, 1, 1, 1, 1, 1,
-0.4590157, 0.3502556, -1.496401, 1, 1, 1, 1, 1,
-0.4589914, 0.1396998, -0.04874787, 1, 1, 1, 1, 1,
-0.4576921, 1.910287, 1.93841, 1, 1, 1, 1, 1,
-0.4548685, -0.667834, -2.942379, 1, 1, 1, 1, 1,
-0.4544676, -2.265998, -3.288745, 1, 1, 1, 1, 1,
-0.4534046, 1.239802, 1.200522, 1, 1, 1, 1, 1,
-0.4475263, 0.6710716, 1.080475, 1, 1, 1, 1, 1,
-0.4473321, -0.4458087, -1.951581, 1, 1, 1, 1, 1,
-0.4434105, 1.18912, -0.339343, 1, 1, 1, 1, 1,
-0.4392395, -0.6655231, -1.693566, 1, 1, 1, 1, 1,
-0.4367417, -1.063321, -2.169345, 1, 1, 1, 1, 1,
-0.4332514, 0.1563374, -2.808216, 1, 1, 1, 1, 1,
-0.4324971, -1.353595, -2.02756, 0, 0, 1, 1, 1,
-0.4290131, -0.7479926, -2.058976, 1, 0, 0, 1, 1,
-0.4266382, 0.7004885, 1.120048, 1, 0, 0, 1, 1,
-0.4214403, -0.9194362, -1.500407, 1, 0, 0, 1, 1,
-0.4205721, -1.404221, -1.378886, 1, 0, 0, 1, 1,
-0.4190102, 0.5821463, 0.3837577, 1, 0, 0, 1, 1,
-0.4157205, -0.8699002, -2.859633, 0, 0, 0, 1, 1,
-0.4154259, -0.2587079, -3.33005, 0, 0, 0, 1, 1,
-0.4136975, 0.8604763, 0.6672068, 0, 0, 0, 1, 1,
-0.4127421, -0.397072, -2.220246, 0, 0, 0, 1, 1,
-0.4107677, -1.326967, -2.863367, 0, 0, 0, 1, 1,
-0.4027823, -1.117204, -2.1982, 0, 0, 0, 1, 1,
-0.4023995, 1.071596, -1.690864, 0, 0, 0, 1, 1,
-0.4008753, -0.5637136, -4.034677, 1, 1, 1, 1, 1,
-0.3958975, -0.4233345, -1.032981, 1, 1, 1, 1, 1,
-0.3930816, 0.208315, -0.939452, 1, 1, 1, 1, 1,
-0.3929344, 2.032878, -0.307651, 1, 1, 1, 1, 1,
-0.3919576, -0.5993419, -3.191844, 1, 1, 1, 1, 1,
-0.3916256, -0.6232148, -2.952497, 1, 1, 1, 1, 1,
-0.3802462, 0.3142652, 1.540022, 1, 1, 1, 1, 1,
-0.3787393, -1.372409, -1.429004, 1, 1, 1, 1, 1,
-0.3762532, 0.4415328, -0.2821177, 1, 1, 1, 1, 1,
-0.3731897, 1.655404, 1.05403, 1, 1, 1, 1, 1,
-0.3724438, 0.3404291, -1.613503, 1, 1, 1, 1, 1,
-0.3652887, 0.3697972, -0.03211723, 1, 1, 1, 1, 1,
-0.3639936, -0.6960118, -1.85128, 1, 1, 1, 1, 1,
-0.3584317, 0.3775669, 0.216919, 1, 1, 1, 1, 1,
-0.3537429, -0.7054737, -2.987439, 1, 1, 1, 1, 1,
-0.3518534, -1.425482, -3.381629, 0, 0, 1, 1, 1,
-0.351401, 1.211076, -1.138722, 1, 0, 0, 1, 1,
-0.3458861, -0.5022973, -1.365397, 1, 0, 0, 1, 1,
-0.3434933, 0.193454, -1.302274, 1, 0, 0, 1, 1,
-0.3427807, -0.5720939, -1.263157, 1, 0, 0, 1, 1,
-0.342658, -0.3682963, -1.498014, 1, 0, 0, 1, 1,
-0.3398291, 0.6212466, -2.585865, 0, 0, 0, 1, 1,
-0.3353364, -0.3362498, -4.05292, 0, 0, 0, 1, 1,
-0.3258477, -3.622471, -4.147831, 0, 0, 0, 1, 1,
-0.3253635, 0.7991922, -0.7880785, 0, 0, 0, 1, 1,
-0.3250891, 1.419194, -1.612071, 0, 0, 0, 1, 1,
-0.3230402, -0.2099717, -1.367839, 0, 0, 0, 1, 1,
-0.3178735, 0.8959682, 0.332958, 0, 0, 0, 1, 1,
-0.3147725, 0.1971361, -1.111559, 1, 1, 1, 1, 1,
-0.3126679, 0.9239191, 0.02142951, 1, 1, 1, 1, 1,
-0.3094125, 0.7131585, 0.01931698, 1, 1, 1, 1, 1,
-0.3061678, -1.143675, -3.378989, 1, 1, 1, 1, 1,
-0.3048142, -1.099298, -3.02899, 1, 1, 1, 1, 1,
-0.3030175, -0.5016899, -4.180681, 1, 1, 1, 1, 1,
-0.3022169, 0.3108897, 0.3684316, 1, 1, 1, 1, 1,
-0.3009855, -0.4500543, -2.077905, 1, 1, 1, 1, 1,
-0.2978027, 1.86723, -1.907387, 1, 1, 1, 1, 1,
-0.2976815, 1.451957, -0.05208569, 1, 1, 1, 1, 1,
-0.2925793, -1.752325, -3.759302, 1, 1, 1, 1, 1,
-0.2924187, 0.2906719, -0.9578451, 1, 1, 1, 1, 1,
-0.2902296, 0.8115368, 0.2145831, 1, 1, 1, 1, 1,
-0.287398, -0.4781222, -3.083935, 1, 1, 1, 1, 1,
-0.2836949, -0.4858607, -0.6714314, 1, 1, 1, 1, 1,
-0.2818758, -1.62722, -3.105006, 0, 0, 1, 1, 1,
-0.2785417, -0.7413797, -1.933578, 1, 0, 0, 1, 1,
-0.277847, 0.6803975, 0.4752762, 1, 0, 0, 1, 1,
-0.2761632, 0.310743, 0.5911141, 1, 0, 0, 1, 1,
-0.274923, 1.507419, 0.651785, 1, 0, 0, 1, 1,
-0.2742215, -1.489807, -3.544213, 1, 0, 0, 1, 1,
-0.2716137, -0.8272883, -2.49778, 0, 0, 0, 1, 1,
-0.2649276, 1.163067, -1.324368, 0, 0, 0, 1, 1,
-0.2603365, 2.09438, -0.4120331, 0, 0, 0, 1, 1,
-0.2591394, -0.3610849, -2.840271, 0, 0, 0, 1, 1,
-0.2553188, 0.3576244, -1.307605, 0, 0, 0, 1, 1,
-0.2546729, 0.1296356, -1.322863, 0, 0, 0, 1, 1,
-0.2537754, 1.942856, -2.001298, 0, 0, 0, 1, 1,
-0.2527882, -0.02355727, -0.9117157, 1, 1, 1, 1, 1,
-0.251777, -1.382512, -4.620952, 1, 1, 1, 1, 1,
-0.2463779, -0.2667636, -1.747047, 1, 1, 1, 1, 1,
-0.2449207, 0.4889846, 0.08145302, 1, 1, 1, 1, 1,
-0.2401033, -0.1013242, -2.11735, 1, 1, 1, 1, 1,
-0.2315997, -1.142401, -2.761756, 1, 1, 1, 1, 1,
-0.227174, -1.650107, -2.762357, 1, 1, 1, 1, 1,
-0.226223, 0.5893714, -1.842217, 1, 1, 1, 1, 1,
-0.2229815, -0.7568722, -4.727984, 1, 1, 1, 1, 1,
-0.2183133, 0.2981238, -1.098005, 1, 1, 1, 1, 1,
-0.216374, -0.1701506, -0.4915818, 1, 1, 1, 1, 1,
-0.2147855, 1.277036, -1.657712, 1, 1, 1, 1, 1,
-0.2123069, -0.5471191, -3.469063, 1, 1, 1, 1, 1,
-0.2111581, -1.86279, -2.535881, 1, 1, 1, 1, 1,
-0.2098961, -0.7562411, -4.000632, 1, 1, 1, 1, 1,
-0.2065803, -0.3245684, -3.230339, 0, 0, 1, 1, 1,
-0.2051037, -0.9057446, -2.528563, 1, 0, 0, 1, 1,
-0.2029794, -1.47388, -3.849384, 1, 0, 0, 1, 1,
-0.2028652, -0.4344485, -2.241807, 1, 0, 0, 1, 1,
-0.1990447, 0.2035318, 0.346088, 1, 0, 0, 1, 1,
-0.194875, -0.4764761, -1.99494, 1, 0, 0, 1, 1,
-0.1929904, -0.8502187, -3.49504, 0, 0, 0, 1, 1,
-0.1864917, -0.811312, -2.154491, 0, 0, 0, 1, 1,
-0.1841257, 1.304683, 0.4862321, 0, 0, 0, 1, 1,
-0.1813297, 0.5203405, 0.2262624, 0, 0, 0, 1, 1,
-0.1762779, 2.047381, -0.2729346, 0, 0, 0, 1, 1,
-0.1752805, 0.2458957, -1.277472, 0, 0, 0, 1, 1,
-0.1733709, 0.4957693, -0.9780293, 0, 0, 0, 1, 1,
-0.1725473, 0.04579403, -1.49908, 1, 1, 1, 1, 1,
-0.168778, -0.292207, -1.19543, 1, 1, 1, 1, 1,
-0.168272, -0.3831168, -2.601183, 1, 1, 1, 1, 1,
-0.1633339, 1.258583, 0.08735819, 1, 1, 1, 1, 1,
-0.1621009, -1.060002, -4.304951, 1, 1, 1, 1, 1,
-0.1582325, -0.5038564, -4.053031, 1, 1, 1, 1, 1,
-0.1539923, -2.313761, -3.654341, 1, 1, 1, 1, 1,
-0.1502753, -0.9189415, -2.07956, 1, 1, 1, 1, 1,
-0.1483923, 0.03159082, -1.71308, 1, 1, 1, 1, 1,
-0.1465048, 0.621238, -0.7517523, 1, 1, 1, 1, 1,
-0.1457388, 2.258836, -0.134689, 1, 1, 1, 1, 1,
-0.1431047, -0.006080577, -1.758658, 1, 1, 1, 1, 1,
-0.1418603, 1.312233, -0.6092471, 1, 1, 1, 1, 1,
-0.14056, -0.6511028, -3.521792, 1, 1, 1, 1, 1,
-0.1358338, 0.2976171, -0.6516494, 1, 1, 1, 1, 1,
-0.1347893, -1.236429, -3.149997, 0, 0, 1, 1, 1,
-0.1342383, -1.329597, -2.611479, 1, 0, 0, 1, 1,
-0.1217964, 0.3417296, -1.035663, 1, 0, 0, 1, 1,
-0.1104698, 0.07189851, -0.102361, 1, 0, 0, 1, 1,
-0.1078268, -0.8217334, -2.682708, 1, 0, 0, 1, 1,
-0.1060017, 0.5504135, -0.4755275, 1, 0, 0, 1, 1,
-0.1038415, 0.9108393, 0.877303, 0, 0, 0, 1, 1,
-0.09888414, -1.406671, -3.308011, 0, 0, 0, 1, 1,
-0.09236407, 1.013257, 1.248468, 0, 0, 0, 1, 1,
-0.09104735, -1.208667, -2.53371, 0, 0, 0, 1, 1,
-0.08796304, -0.3255865, -2.490722, 0, 0, 0, 1, 1,
-0.08172744, -0.4687864, -4.33991, 0, 0, 0, 1, 1,
-0.08127306, 1.024447, 1.509811, 0, 0, 0, 1, 1,
-0.079381, -0.7455897, -3.490941, 1, 1, 1, 1, 1,
-0.07857604, 0.852454, -0.04870766, 1, 1, 1, 1, 1,
-0.07828681, 0.1201511, 0.04745567, 1, 1, 1, 1, 1,
-0.07103143, -0.3027161, -2.616355, 1, 1, 1, 1, 1,
-0.07006052, 0.4215329, 0.09313313, 1, 1, 1, 1, 1,
-0.06838945, -0.4780415, -4.490262, 1, 1, 1, 1, 1,
-0.06524156, 0.1484456, -0.8642899, 1, 1, 1, 1, 1,
-0.06419447, -0.3631607, -2.842833, 1, 1, 1, 1, 1,
-0.06359212, -0.5792814, -2.116068, 1, 1, 1, 1, 1,
-0.06341799, 1.205544, 1.353763, 1, 1, 1, 1, 1,
-0.05916521, -0.1762999, -2.093938, 1, 1, 1, 1, 1,
-0.05782542, -1.211499, -2.49845, 1, 1, 1, 1, 1,
-0.0572103, -1.557612, -3.435217, 1, 1, 1, 1, 1,
-0.05690589, 0.002521423, 0.8614814, 1, 1, 1, 1, 1,
-0.05418535, 0.634955, -0.318128, 1, 1, 1, 1, 1,
-0.05396244, 0.09653252, 0.7512612, 0, 0, 1, 1, 1,
-0.04864115, -1.087444, -1.16232, 1, 0, 0, 1, 1,
-0.04744573, -0.7263226, -3.426046, 1, 0, 0, 1, 1,
-0.04315541, -0.5459461, -2.847013, 1, 0, 0, 1, 1,
-0.04034665, 1.574616, 1.006459, 1, 0, 0, 1, 1,
-0.03291354, -0.6926873, -2.834184, 1, 0, 0, 1, 1,
-0.03004018, -0.6327531, -3.251968, 0, 0, 0, 1, 1,
-0.02860586, -0.7906047, -2.374632, 0, 0, 0, 1, 1,
-0.02793543, -0.4102232, -2.67322, 0, 0, 0, 1, 1,
-0.02300787, -1.524753, -2.384802, 0, 0, 0, 1, 1,
-0.01511956, 0.4466999, -2.166436, 0, 0, 0, 1, 1,
-0.01160489, 0.6321445, -1.106611, 0, 0, 0, 1, 1,
-0.0107622, -0.2766291, -1.957443, 0, 0, 0, 1, 1,
-0.008034512, -0.003335202, -2.538709, 1, 1, 1, 1, 1,
-0.006687635, -0.9416957, -2.6123, 1, 1, 1, 1, 1,
-0.006656694, -0.4367824, -3.395745, 1, 1, 1, 1, 1,
-0.005055253, -1.641489, -3.603032, 1, 1, 1, 1, 1,
-0.004497853, -1.59486, -1.413373, 1, 1, 1, 1, 1,
-0.003640344, -1.651205, -2.164743, 1, 1, 1, 1, 1,
-0.0008669099, 0.2847136, -0.4750554, 1, 1, 1, 1, 1,
0.00446969, 0.4751871, -0.3230901, 1, 1, 1, 1, 1,
0.004473979, -0.04855057, 2.354507, 1, 1, 1, 1, 1,
0.006050589, -0.2823451, 2.442827, 1, 1, 1, 1, 1,
0.006740877, 0.0946319, 2.603271, 1, 1, 1, 1, 1,
0.008065694, 0.3937784, -0.1195759, 1, 1, 1, 1, 1,
0.008960016, -1.629202, 2.624672, 1, 1, 1, 1, 1,
0.02045173, -0.199314, 4.590159, 1, 1, 1, 1, 1,
0.02198219, 0.3621794, -0.8504644, 1, 1, 1, 1, 1,
0.02308924, -0.4875907, 3.0967, 0, 0, 1, 1, 1,
0.0267389, 0.06988946, 0.1171343, 1, 0, 0, 1, 1,
0.02767072, 0.4071909, -1.741436, 1, 0, 0, 1, 1,
0.02830729, 0.06125865, 1.871397, 1, 0, 0, 1, 1,
0.03275415, 0.1916719, 0.528748, 1, 0, 0, 1, 1,
0.0332134, -0.742263, 1.974682, 1, 0, 0, 1, 1,
0.03450872, 0.2152149, -0.6046007, 0, 0, 0, 1, 1,
0.03455846, -0.7447061, 1.983802, 0, 0, 0, 1, 1,
0.03515872, -0.2105421, 1.116886, 0, 0, 0, 1, 1,
0.03753668, -0.6055689, 3.610503, 0, 0, 0, 1, 1,
0.04364856, -2.172522, 3.586892, 0, 0, 0, 1, 1,
0.04551838, -1.910123, 2.820408, 0, 0, 0, 1, 1,
0.04553352, 1.457801, 0.5650154, 0, 0, 0, 1, 1,
0.0458736, 0.6899841, 0.4716194, 1, 1, 1, 1, 1,
0.05054679, -0.1996127, 4.177368, 1, 1, 1, 1, 1,
0.05273102, 2.074645, -0.7458529, 1, 1, 1, 1, 1,
0.05330236, -0.6439015, 3.480401, 1, 1, 1, 1, 1,
0.05719379, -0.9620992, 3.295315, 1, 1, 1, 1, 1,
0.05805264, -0.09056337, 1.959246, 1, 1, 1, 1, 1,
0.05856063, -0.02165386, 0.2424819, 1, 1, 1, 1, 1,
0.05907417, -0.5215274, 3.82797, 1, 1, 1, 1, 1,
0.06082925, 0.3950475, 1.296099, 1, 1, 1, 1, 1,
0.06103471, -0.6430138, 2.115018, 1, 1, 1, 1, 1,
0.0642183, 1.161716, 1.345528, 1, 1, 1, 1, 1,
0.06445586, -0.009075209, 1.065767, 1, 1, 1, 1, 1,
0.06506105, -0.3702671, 1.300266, 1, 1, 1, 1, 1,
0.06954776, 0.3086178, -0.3322455, 1, 1, 1, 1, 1,
0.07187603, -0.6376941, 3.051557, 1, 1, 1, 1, 1,
0.07517249, 1.425912, 0.4083112, 0, 0, 1, 1, 1,
0.07844064, 1.707925, -0.2091896, 1, 0, 0, 1, 1,
0.08379635, 0.514587, 0.263307, 1, 0, 0, 1, 1,
0.08573528, 1.00233, -0.4490154, 1, 0, 0, 1, 1,
0.08730422, -0.1738831, 1.964441, 1, 0, 0, 1, 1,
0.08763135, -1.744898, 4.89297, 1, 0, 0, 1, 1,
0.08811598, -0.1848668, 3.427571, 0, 0, 0, 1, 1,
0.09354016, 0.3829309, -1.781971, 0, 0, 0, 1, 1,
0.09664311, -0.9026598, 1.549561, 0, 0, 0, 1, 1,
0.1052609, 0.1097257, 2.191457, 0, 0, 0, 1, 1,
0.1091941, -0.4045511, 3.390318, 0, 0, 0, 1, 1,
0.110117, -0.4906718, 1.140846, 0, 0, 0, 1, 1,
0.1110109, 0.3698492, -0.9366997, 0, 0, 0, 1, 1,
0.1121565, 1.279608, 1.045903, 1, 1, 1, 1, 1,
0.1122755, -0.3790224, 2.589146, 1, 1, 1, 1, 1,
0.1126734, -0.09543685, 1.995266, 1, 1, 1, 1, 1,
0.1132149, 0.2007379, 0.1077834, 1, 1, 1, 1, 1,
0.1135673, 0.242433, 0.6356784, 1, 1, 1, 1, 1,
0.1154479, -1.019341, 3.100636, 1, 1, 1, 1, 1,
0.1168154, -0.4638576, 1.784214, 1, 1, 1, 1, 1,
0.1192188, 0.2209658, 0.6768367, 1, 1, 1, 1, 1,
0.122414, -0.9076031, 2.092667, 1, 1, 1, 1, 1,
0.1232049, 1.767879, -0.3434502, 1, 1, 1, 1, 1,
0.1234579, -2.467292, 4.106883, 1, 1, 1, 1, 1,
0.1252937, -2.639996, 1.60746, 1, 1, 1, 1, 1,
0.1264087, 0.2500821, -1.478531, 1, 1, 1, 1, 1,
0.1289264, 0.07073597, -0.5427045, 1, 1, 1, 1, 1,
0.1290442, 0.5549591, 1.311939, 1, 1, 1, 1, 1,
0.1312652, 0.5147242, -0.5309427, 0, 0, 1, 1, 1,
0.132728, -0.1709036, 2.337987, 1, 0, 0, 1, 1,
0.1368058, 0.8907815, 0.6612898, 1, 0, 0, 1, 1,
0.1478302, -0.7781619, 1.027991, 1, 0, 0, 1, 1,
0.1503008, 0.4272622, -2.128462, 1, 0, 0, 1, 1,
0.152106, -0.9732229, 4.116421, 1, 0, 0, 1, 1,
0.1547262, -1.068538, 3.980629, 0, 0, 0, 1, 1,
0.1555524, 0.8530788, -1.257079, 0, 0, 0, 1, 1,
0.1565221, -0.3821881, 3.488422, 0, 0, 0, 1, 1,
0.1569807, 0.7179507, -0.06818102, 0, 0, 0, 1, 1,
0.1570956, -0.2768448, 2.6043, 0, 0, 0, 1, 1,
0.15824, -0.6400282, 3.831678, 0, 0, 0, 1, 1,
0.1585522, -1.441401, 5.286223, 0, 0, 0, 1, 1,
0.1692679, 0.250781, 1.872662, 1, 1, 1, 1, 1,
0.1760129, -2.239446, 3.036687, 1, 1, 1, 1, 1,
0.1795376, 1.261422, 1.754491, 1, 1, 1, 1, 1,
0.1805317, 1.430364, 1.191766, 1, 1, 1, 1, 1,
0.1836388, 2.113205, 1.041926, 1, 1, 1, 1, 1,
0.1839775, -0.2878343, 3.36563, 1, 1, 1, 1, 1,
0.1958912, -1.093347, 1.734074, 1, 1, 1, 1, 1,
0.1987016, 0.2976759, -0.2634454, 1, 1, 1, 1, 1,
0.1995189, 0.7232959, 1.108591, 1, 1, 1, 1, 1,
0.2000648, -1.154521, 0.8815068, 1, 1, 1, 1, 1,
0.2022429, -1.866037, 3.970597, 1, 1, 1, 1, 1,
0.2042058, 0.7547769, 0.2078545, 1, 1, 1, 1, 1,
0.204764, 1.507725, -1.516557, 1, 1, 1, 1, 1,
0.2054799, -0.7207703, 3.583106, 1, 1, 1, 1, 1,
0.2057236, -0.01598271, 1.671356, 1, 1, 1, 1, 1,
0.206091, -0.9870335, 1.988838, 0, 0, 1, 1, 1,
0.2086943, 0.4637277, 0.008894716, 1, 0, 0, 1, 1,
0.2092336, -1.98101, 2.325496, 1, 0, 0, 1, 1,
0.2108489, 0.354439, 0.1787423, 1, 0, 0, 1, 1,
0.2112327, 0.9953026, -0.6945212, 1, 0, 0, 1, 1,
0.2123777, 1.000594, 0.6190671, 1, 0, 0, 1, 1,
0.2200049, 0.01121666, 1.364852, 0, 0, 0, 1, 1,
0.221287, -0.3440031, 2.881497, 0, 0, 0, 1, 1,
0.2218029, 0.2951182, 0.8990417, 0, 0, 0, 1, 1,
0.2234503, 0.9498053, 0.4362549, 0, 0, 0, 1, 1,
0.2241713, 0.2875481, 2.45412, 0, 0, 0, 1, 1,
0.2252393, -0.06014187, 1.233245, 0, 0, 0, 1, 1,
0.2300617, 1.101717, 0.4359052, 0, 0, 0, 1, 1,
0.2306537, -1.877866, 2.198356, 1, 1, 1, 1, 1,
0.2360526, 0.2644025, 1.632234, 1, 1, 1, 1, 1,
0.2362232, -1.185094, 2.364888, 1, 1, 1, 1, 1,
0.239074, -1.423418, 3.36058, 1, 1, 1, 1, 1,
0.240129, 1.607054, 0.9726813, 1, 1, 1, 1, 1,
0.2432411, 1.395032, -1.023836, 1, 1, 1, 1, 1,
0.248754, -0.4302641, 0.4457708, 1, 1, 1, 1, 1,
0.2500924, -0.02635018, 1.736629, 1, 1, 1, 1, 1,
0.2510228, -0.2616682, 3.578868, 1, 1, 1, 1, 1,
0.2599031, 0.9516736, -0.2142072, 1, 1, 1, 1, 1,
0.2610268, -0.5853133, 2.284005, 1, 1, 1, 1, 1,
0.2631706, -1.12519, 1.58058, 1, 1, 1, 1, 1,
0.2653169, 0.7190862, -1.735878, 1, 1, 1, 1, 1,
0.2656736, -2.072939, 2.86082, 1, 1, 1, 1, 1,
0.2661946, -0.7962939, 2.85658, 1, 1, 1, 1, 1,
0.2664497, 0.6122814, -0.2041904, 0, 0, 1, 1, 1,
0.2680958, 0.7888131, 1.027978, 1, 0, 0, 1, 1,
0.2681049, -0.3404986, 2.622579, 1, 0, 0, 1, 1,
0.2685017, 0.9860465, -0.7999686, 1, 0, 0, 1, 1,
0.2694141, 0.01891773, 2.425834, 1, 0, 0, 1, 1,
0.2694414, -0.5139196, 2.106803, 1, 0, 0, 1, 1,
0.2700184, 0.5429904, 0.01181056, 0, 0, 0, 1, 1,
0.2713575, -1.162228, 2.788462, 0, 0, 0, 1, 1,
0.2750672, 1.130376, 1.399886, 0, 0, 0, 1, 1,
0.2764623, -0.2080927, 2.125267, 0, 0, 0, 1, 1,
0.2887225, -1.198879, 3.728389, 0, 0, 0, 1, 1,
0.2915977, 0.3379726, 1.363427, 0, 0, 0, 1, 1,
0.2916237, 0.09244983, 0.1921292, 0, 0, 0, 1, 1,
0.2933925, 0.5022274, 1.917848, 1, 1, 1, 1, 1,
0.2961676, 1.712606, 0.5954065, 1, 1, 1, 1, 1,
0.2971702, -0.0770429, 1.772555, 1, 1, 1, 1, 1,
0.3022128, 1.534818, -1.173415, 1, 1, 1, 1, 1,
0.3023, -1.527056, 1.418269, 1, 1, 1, 1, 1,
0.3044788, 0.3892064, 1.102586, 1, 1, 1, 1, 1,
0.3067798, 0.4745862, 1.890933, 1, 1, 1, 1, 1,
0.3089017, 0.5121304, 0.3453186, 1, 1, 1, 1, 1,
0.3091344, -0.3183147, 1.87736, 1, 1, 1, 1, 1,
0.3121291, -0.8915434, 3.702089, 1, 1, 1, 1, 1,
0.3131889, -1.015431, 2.984455, 1, 1, 1, 1, 1,
0.3133726, 1.193946, 0.2588956, 1, 1, 1, 1, 1,
0.314983, -1.717998, 4.062473, 1, 1, 1, 1, 1,
0.3168004, -0.1076781, 1.922915, 1, 1, 1, 1, 1,
0.320522, -1.147334, 2.124459, 1, 1, 1, 1, 1,
0.3211945, -2.904252, 4.948669, 0, 0, 1, 1, 1,
0.3232057, -0.2145814, 1.469169, 1, 0, 0, 1, 1,
0.3236583, 0.9927053, -0.5113667, 1, 0, 0, 1, 1,
0.3242628, 1.330329, -0.2816351, 1, 0, 0, 1, 1,
0.3296917, 0.9724085, -0.1813592, 1, 0, 0, 1, 1,
0.3394555, -1.096608, 3.082379, 1, 0, 0, 1, 1,
0.3416871, 1.040258, 0.4209205, 0, 0, 0, 1, 1,
0.3439803, 0.7236859, -1.309726, 0, 0, 0, 1, 1,
0.3445758, -0.06050226, 1.772006, 0, 0, 0, 1, 1,
0.3454464, -0.5359921, 2.233836, 0, 0, 0, 1, 1,
0.3530343, -1.109759, 0.7276574, 0, 0, 0, 1, 1,
0.3538034, 0.8713369, -0.6870334, 0, 0, 0, 1, 1,
0.3560447, 2.744239, 0.5630552, 0, 0, 0, 1, 1,
0.3566857, 0.3436778, 2.441402, 1, 1, 1, 1, 1,
0.359475, -0.09218024, 3.20553, 1, 1, 1, 1, 1,
0.3665922, -0.525634, 3.545808, 1, 1, 1, 1, 1,
0.3666317, 1.07563, -0.07042481, 1, 1, 1, 1, 1,
0.3686173, -0.5643775, 2.873013, 1, 1, 1, 1, 1,
0.3695903, -0.3329709, 0.07399996, 1, 1, 1, 1, 1,
0.3703232, 1.422912, -1.033644, 1, 1, 1, 1, 1,
0.3729616, 0.1573928, -0.5569626, 1, 1, 1, 1, 1,
0.3761373, -1.100648, 4.34462, 1, 1, 1, 1, 1,
0.3775606, -0.1964178, 4.341442, 1, 1, 1, 1, 1,
0.3792128, 0.03559249, 0.7197899, 1, 1, 1, 1, 1,
0.3795493, -0.2681686, 0.3103605, 1, 1, 1, 1, 1,
0.3832213, 0.305595, -1.04183, 1, 1, 1, 1, 1,
0.3898284, 0.071525, 3.188317, 1, 1, 1, 1, 1,
0.3903423, 0.04020271, 4.190425, 1, 1, 1, 1, 1,
0.3906433, 0.1569844, 0.2152159, 0, 0, 1, 1, 1,
0.3949511, 0.09541378, 3.23223, 1, 0, 0, 1, 1,
0.3976274, -1.022728, 4.161372, 1, 0, 0, 1, 1,
0.3988423, -0.08378414, 0.06686962, 1, 0, 0, 1, 1,
0.4027382, -0.6578301, 1.928459, 1, 0, 0, 1, 1,
0.4048976, -0.9316334, 1.657722, 1, 0, 0, 1, 1,
0.4060405, -0.6241511, 2.059783, 0, 0, 0, 1, 1,
0.4100246, 1.197604, 0.3501774, 0, 0, 0, 1, 1,
0.4133329, -0.3266269, 1.856783, 0, 0, 0, 1, 1,
0.4215689, 0.006408859, 0.9560893, 0, 0, 0, 1, 1,
0.4294311, -0.675601, 1.391766, 0, 0, 0, 1, 1,
0.4321755, -0.5626372, 1.948631, 0, 0, 0, 1, 1,
0.433019, 0.272169, 2.24995, 0, 0, 0, 1, 1,
0.4359258, 1.320156, -1.174469, 1, 1, 1, 1, 1,
0.4364148, -0.2109856, 3.369922, 1, 1, 1, 1, 1,
0.4380807, -0.2534489, 1.238758, 1, 1, 1, 1, 1,
0.4461861, 0.1281471, 3.954502, 1, 1, 1, 1, 1,
0.4523982, -0.04106804, 1.440207, 1, 1, 1, 1, 1,
0.4524128, -1.414477, 1.808654, 1, 1, 1, 1, 1,
0.4556927, 0.4746872, 0.7198911, 1, 1, 1, 1, 1,
0.4572177, 0.4590511, 1.812262, 1, 1, 1, 1, 1,
0.4594859, -0.8036831, 1.294509, 1, 1, 1, 1, 1,
0.4621684, -0.3698375, 2.0315, 1, 1, 1, 1, 1,
0.4650571, 0.06707008, 2.196404, 1, 1, 1, 1, 1,
0.4687699, -1.215112, 1.718838, 1, 1, 1, 1, 1,
0.4692339, -0.8976382, 3.240339, 1, 1, 1, 1, 1,
0.4702863, 2.119764, 1.67498, 1, 1, 1, 1, 1,
0.4722693, 0.6514224, -0.7754104, 1, 1, 1, 1, 1,
0.4730726, -1.837504, 3.742143, 0, 0, 1, 1, 1,
0.4736459, 0.05643877, 1.199286, 1, 0, 0, 1, 1,
0.476281, 0.4955361, 2.523088, 1, 0, 0, 1, 1,
0.4780635, 1.097061, 0.5290741, 1, 0, 0, 1, 1,
0.4818171, 0.708689, 1.320254, 1, 0, 0, 1, 1,
0.4837649, 0.7272036, 0.6609932, 1, 0, 0, 1, 1,
0.4907008, -0.4434517, 2.831781, 0, 0, 0, 1, 1,
0.4955305, 0.4052613, 0.8698011, 0, 0, 0, 1, 1,
0.4978891, -0.04304761, 1.938041, 0, 0, 0, 1, 1,
0.5019296, 0.879136, 1.129201, 0, 0, 0, 1, 1,
0.5029382, 0.09839241, 1.089945, 0, 0, 0, 1, 1,
0.504291, -0.7037641, 2.896937, 0, 0, 0, 1, 1,
0.506387, -1.084053, 2.624876, 0, 0, 0, 1, 1,
0.5067757, 0.4950144, 1.892426, 1, 1, 1, 1, 1,
0.5115978, 0.02662248, 2.504061, 1, 1, 1, 1, 1,
0.5151597, -0.7269453, 0.3784208, 1, 1, 1, 1, 1,
0.5207385, 0.4233034, 1.112109, 1, 1, 1, 1, 1,
0.5230017, -1.321637, 1.980247, 1, 1, 1, 1, 1,
0.5322216, 0.2637184, 1.357255, 1, 1, 1, 1, 1,
0.5396407, -0.5941445, 2.055866, 1, 1, 1, 1, 1,
0.5407937, 1.34902, 0.7704312, 1, 1, 1, 1, 1,
0.540835, -0.250058, 2.531081, 1, 1, 1, 1, 1,
0.5417627, 0.2599193, 1.102123, 1, 1, 1, 1, 1,
0.556396, -0.04128999, 0.2269217, 1, 1, 1, 1, 1,
0.5594293, -2.72742, 3.462406, 1, 1, 1, 1, 1,
0.5660188, -1.021302, 1.546453, 1, 1, 1, 1, 1,
0.5731283, -0.1087382, 1.769698, 1, 1, 1, 1, 1,
0.5797631, 0.2008293, 1.450561, 1, 1, 1, 1, 1,
0.5800076, -0.2833169, 3.514678, 0, 0, 1, 1, 1,
0.5810766, -0.07122721, 2.597623, 1, 0, 0, 1, 1,
0.5843717, -0.1608452, 2.203975, 1, 0, 0, 1, 1,
0.5847869, -0.124816, 0.07316845, 1, 0, 0, 1, 1,
0.5912148, 0.5986897, -0.114254, 1, 0, 0, 1, 1,
0.609715, -0.6233484, 4.11155, 1, 0, 0, 1, 1,
0.6138385, 0.9020455, 0.007624073, 0, 0, 0, 1, 1,
0.6200184, 0.4355138, -0.5705859, 0, 0, 0, 1, 1,
0.6205943, 1.170713, -0.6007327, 0, 0, 0, 1, 1,
0.6208114, 0.8830045, 1.100463, 0, 0, 0, 1, 1,
0.6211661, 1.304315, 1.178243, 0, 0, 0, 1, 1,
0.6267079, -1.277241, 2.000483, 0, 0, 0, 1, 1,
0.6282693, 1.35239, 3.524479, 0, 0, 0, 1, 1,
0.6294173, -1.391139, 2.265984, 1, 1, 1, 1, 1,
0.6346629, -1.276083, 2.01982, 1, 1, 1, 1, 1,
0.6355758, 1.3117, 0.496417, 1, 1, 1, 1, 1,
0.6369911, 0.5959285, 1.749232, 1, 1, 1, 1, 1,
0.6407722, 1.100126, 0.5391263, 1, 1, 1, 1, 1,
0.6455647, 0.8458543, 1.824283, 1, 1, 1, 1, 1,
0.6478841, 0.1858649, 1.36488, 1, 1, 1, 1, 1,
0.6523386, -0.2568727, 1.777228, 1, 1, 1, 1, 1,
0.6532913, -1.040896, 2.953118, 1, 1, 1, 1, 1,
0.6559141, 0.2109556, 0.2194864, 1, 1, 1, 1, 1,
0.6584764, -0.7002952, 2.449131, 1, 1, 1, 1, 1,
0.6609703, 0.8035487, 0.4560786, 1, 1, 1, 1, 1,
0.665534, -0.2857419, 1.335295, 1, 1, 1, 1, 1,
0.6679033, -0.6167426, 2.163616, 1, 1, 1, 1, 1,
0.6696073, 0.6449435, 2.033031, 1, 1, 1, 1, 1,
0.6727269, 0.3533216, 1.792367, 0, 0, 1, 1, 1,
0.6788721, 0.5277051, 1.566114, 1, 0, 0, 1, 1,
0.6864219, -0.06851082, 2.838499, 1, 0, 0, 1, 1,
0.6865512, -1.358553, 1.40355, 1, 0, 0, 1, 1,
0.6876767, -1.083323, 1.361992, 1, 0, 0, 1, 1,
0.697876, -0.4069361, 1.630839, 1, 0, 0, 1, 1,
0.6994622, 1.637299, -0.292759, 0, 0, 0, 1, 1,
0.7010431, -0.5239182, 3.25415, 0, 0, 0, 1, 1,
0.7023252, -1.312154, 2.007659, 0, 0, 0, 1, 1,
0.7023848, 0.3389587, 2.680461, 0, 0, 0, 1, 1,
0.7034649, 0.08094846, 3.251615, 0, 0, 0, 1, 1,
0.7063671, -0.7262405, 2.677584, 0, 0, 0, 1, 1,
0.7074122, 0.8296049, 1.807465, 0, 0, 0, 1, 1,
0.7123621, 0.1655949, 0.4061203, 1, 1, 1, 1, 1,
0.714993, 2.411253, -0.5496022, 1, 1, 1, 1, 1,
0.7168338, -1.329594, 3.168615, 1, 1, 1, 1, 1,
0.7185134, 0.5308247, 1.376891, 1, 1, 1, 1, 1,
0.7268242, -0.7207034, 0.6629965, 1, 1, 1, 1, 1,
0.7356613, 1.11024, -0.286344, 1, 1, 1, 1, 1,
0.7363994, -2.311211, 2.721461, 1, 1, 1, 1, 1,
0.7428429, 0.7104675, 1.637907, 1, 1, 1, 1, 1,
0.7441504, -0.602665, 2.252292, 1, 1, 1, 1, 1,
0.7450652, -0.9945477, 2.72977, 1, 1, 1, 1, 1,
0.7498991, 0.6621199, 0.3067431, 1, 1, 1, 1, 1,
0.7586619, 2.201368, 0.1654846, 1, 1, 1, 1, 1,
0.7650201, -0.7600043, 1.264788, 1, 1, 1, 1, 1,
0.7760283, -0.2320205, 2.224217, 1, 1, 1, 1, 1,
0.783719, -0.6497411, 1.703015, 1, 1, 1, 1, 1,
0.7945567, -1.185867, 2.120657, 0, 0, 1, 1, 1,
0.7951756, 0.284396, 1.987491, 1, 0, 0, 1, 1,
0.7991647, -0.09238192, 1.606577, 1, 0, 0, 1, 1,
0.8044313, -0.02023931, 3.03273, 1, 0, 0, 1, 1,
0.809875, -1.889825, 3.262295, 1, 0, 0, 1, 1,
0.8100594, 0.07603019, 1.425085, 1, 0, 0, 1, 1,
0.82175, 0.3906033, 1.257745, 0, 0, 0, 1, 1,
0.822346, -1.88128, 2.50368, 0, 0, 0, 1, 1,
0.8239235, 0.4519444, 0.6161308, 0, 0, 0, 1, 1,
0.8251966, 0.9392095, 1.092036, 0, 0, 0, 1, 1,
0.8264409, -0.04139202, 2.382714, 0, 0, 0, 1, 1,
0.8399381, 0.9474273, 0.8076771, 0, 0, 0, 1, 1,
0.8445346, 0.8414364, 1.684672, 0, 0, 0, 1, 1,
0.84693, 2.427364, 0.3412968, 1, 1, 1, 1, 1,
0.8487964, -0.6596174, 2.827465, 1, 1, 1, 1, 1,
0.8505553, 2.504478, 2.4729, 1, 1, 1, 1, 1,
0.8506862, 1.675256, 0.06330511, 1, 1, 1, 1, 1,
0.8540121, -0.8898866, 2.594409, 1, 1, 1, 1, 1,
0.8573544, -0.1860819, 1.99854, 1, 1, 1, 1, 1,
0.8605927, 0.8065422, 0.809336, 1, 1, 1, 1, 1,
0.8618094, 0.2927892, 2.614776, 1, 1, 1, 1, 1,
0.8667659, 1.787319, 1.19015, 1, 1, 1, 1, 1,
0.868584, 1.288134, 0.4643318, 1, 1, 1, 1, 1,
0.8735797, -0.6833267, 2.566594, 1, 1, 1, 1, 1,
0.8859496, -0.1610348, 1.178218, 1, 1, 1, 1, 1,
0.8892215, -0.590305, 2.159141, 1, 1, 1, 1, 1,
0.8901668, -1.060273, 4.438982, 1, 1, 1, 1, 1,
0.8913115, -1.072573, 2.319578, 1, 1, 1, 1, 1,
0.8928294, 1.757601, 0.1512735, 0, 0, 1, 1, 1,
0.8964483, -0.6041933, 1.796472, 1, 0, 0, 1, 1,
0.8977352, -0.2258661, 0.2999266, 1, 0, 0, 1, 1,
0.9049696, 0.2993534, 1.669274, 1, 0, 0, 1, 1,
0.9100195, 0.7264472, 2.998854, 1, 0, 0, 1, 1,
0.9109254, 1.348373, 1.034029, 1, 0, 0, 1, 1,
0.9137233, -0.374505, 2.792057, 0, 0, 0, 1, 1,
0.9148078, -0.6355981, 1.798004, 0, 0, 0, 1, 1,
0.9213312, 1.329796, -0.7072735, 0, 0, 0, 1, 1,
0.9213665, -0.8059461, 3.704625, 0, 0, 0, 1, 1,
0.9238116, -0.9566442, 3.931365, 0, 0, 0, 1, 1,
0.945443, -0.599422, 1.90301, 0, 0, 0, 1, 1,
0.9564153, -1.210293, 2.027469, 0, 0, 0, 1, 1,
0.9626955, -0.1524798, 1.547507, 1, 1, 1, 1, 1,
0.963287, 0.3204861, 1.741024, 1, 1, 1, 1, 1,
0.9634308, 1.276587, 1.754208, 1, 1, 1, 1, 1,
0.9636512, 0.3427737, 1.0378, 1, 1, 1, 1, 1,
0.9665476, 0.07261415, 0.9308919, 1, 1, 1, 1, 1,
0.9697793, -1.323083, 2.861227, 1, 1, 1, 1, 1,
0.9724997, 0.2285872, 0.6907042, 1, 1, 1, 1, 1,
0.9753374, -0.5309675, 2.148871, 1, 1, 1, 1, 1,
0.9833114, 0.2188589, 0.2229185, 1, 1, 1, 1, 1,
0.984484, 1.739744, 1.170466, 1, 1, 1, 1, 1,
0.9879643, 0.4716105, 0.4449036, 1, 1, 1, 1, 1,
0.9895751, 1.751489, -0.5030901, 1, 1, 1, 1, 1,
0.9898583, -0.5957246, 4.464729, 1, 1, 1, 1, 1,
0.9918191, -0.4790268, 2.990154, 1, 1, 1, 1, 1,
0.9937712, -0.4106678, 2.063796, 1, 1, 1, 1, 1,
0.9966069, 1.343473, -0.1576125, 0, 0, 1, 1, 1,
0.9982315, 2.061826, 0.5475923, 1, 0, 0, 1, 1,
1.002543, 0.5583832, -0.5786383, 1, 0, 0, 1, 1,
1.012947, 0.9007457, 2.444273, 1, 0, 0, 1, 1,
1.018127, -0.08475751, 1.8712, 1, 0, 0, 1, 1,
1.018366, -0.7951056, 0.8582094, 1, 0, 0, 1, 1,
1.021011, 1.493152, 1.053964, 0, 0, 0, 1, 1,
1.024746, -0.06343178, -0.8100973, 0, 0, 0, 1, 1,
1.036555, 2.428918, -0.02379033, 0, 0, 0, 1, 1,
1.045161, 0.2270368, 0.1985479, 0, 0, 0, 1, 1,
1.047197, 0.01972374, 1.810626, 0, 0, 0, 1, 1,
1.051283, 1.018166, 1.008867, 0, 0, 0, 1, 1,
1.053136, -1.951191, 0.6650414, 0, 0, 0, 1, 1,
1.053474, -0.5210475, 3.420583, 1, 1, 1, 1, 1,
1.062727, 1.537869, -0.3745442, 1, 1, 1, 1, 1,
1.070104, -0.6276067, 1.460517, 1, 1, 1, 1, 1,
1.073753, -3.027658, 2.565266, 1, 1, 1, 1, 1,
1.07598, 0.2452287, 0.6107676, 1, 1, 1, 1, 1,
1.080394, 0.1783126, 1.98264, 1, 1, 1, 1, 1,
1.08398, 0.4537133, 1.894428, 1, 1, 1, 1, 1,
1.09237, -0.1922638, 0.408026, 1, 1, 1, 1, 1,
1.098295, 1.529526, 1.417225, 1, 1, 1, 1, 1,
1.100295, 0.4935626, 1.990645, 1, 1, 1, 1, 1,
1.101305, 1.416458, -0.1483175, 1, 1, 1, 1, 1,
1.104129, -0.2739431, 2.860173, 1, 1, 1, 1, 1,
1.10903, 1.132734, 0.270873, 1, 1, 1, 1, 1,
1.111306, -0.00104817, 1.682629, 1, 1, 1, 1, 1,
1.114753, 0.3041918, 1.188679, 1, 1, 1, 1, 1,
1.118382, 0.0274234, 1.798332, 0, 0, 1, 1, 1,
1.119872, -0.1666605, 3.222241, 1, 0, 0, 1, 1,
1.12124, 0.4052846, 2.262995, 1, 0, 0, 1, 1,
1.124163, 1.678952, 0.4697241, 1, 0, 0, 1, 1,
1.124444, -1.883403, 4.592737, 1, 0, 0, 1, 1,
1.125374, 1.069014, 1.43578, 1, 0, 0, 1, 1,
1.133764, 1.481362, 2.170797, 0, 0, 0, 1, 1,
1.134577, 2.280237, -0.07562395, 0, 0, 0, 1, 1,
1.134799, -0.2981582, 1.423755, 0, 0, 0, 1, 1,
1.136472, 0.08095068, -0.135842, 0, 0, 0, 1, 1,
1.14082, 1.271003, -0.02387866, 0, 0, 0, 1, 1,
1.141647, 2.220265, 1.707316, 0, 0, 0, 1, 1,
1.142851, -0.9846039, 2.345355, 0, 0, 0, 1, 1,
1.14667, -0.7886655, 1.971287, 1, 1, 1, 1, 1,
1.149562, 0.5567145, 1.557532, 1, 1, 1, 1, 1,
1.160296, 0.8207178, 0.5779291, 1, 1, 1, 1, 1,
1.167241, -0.9661296, 2.64987, 1, 1, 1, 1, 1,
1.18094, 0.2156265, 1.312652, 1, 1, 1, 1, 1,
1.188504, -1.998277, 2.22013, 1, 1, 1, 1, 1,
1.190103, -0.3455525, 1.998973, 1, 1, 1, 1, 1,
1.19118, -0.4892916, 1.794367, 1, 1, 1, 1, 1,
1.193388, -0.4536966, 1.013365, 1, 1, 1, 1, 1,
1.200637, -1.566664, 3.219107, 1, 1, 1, 1, 1,
1.200881, -1.014457, 2.259582, 1, 1, 1, 1, 1,
1.204258, 0.2719571, 1.719934, 1, 1, 1, 1, 1,
1.207363, 0.4251359, 1.802615, 1, 1, 1, 1, 1,
1.21013, 0.297597, 1.286167, 1, 1, 1, 1, 1,
1.213631, 0.2695283, 1.036305, 1, 1, 1, 1, 1,
1.233026, -1.358454, 2.311616, 0, 0, 1, 1, 1,
1.256468, -0.2902319, 1.932393, 1, 0, 0, 1, 1,
1.25946, 0.2668305, 0.3454114, 1, 0, 0, 1, 1,
1.269693, 1.229442, -0.34933, 1, 0, 0, 1, 1,
1.27661, -0.1978259, 1.681613, 1, 0, 0, 1, 1,
1.276747, 1.167744, -0.1458384, 1, 0, 0, 1, 1,
1.279386, 0.6254917, 0.3867804, 0, 0, 0, 1, 1,
1.287291, 1.351241, 1.150402, 0, 0, 0, 1, 1,
1.289718, 0.3889427, 1.864196, 0, 0, 0, 1, 1,
1.290746, -0.2331145, 1.728622, 0, 0, 0, 1, 1,
1.293842, -0.2351651, 0.2347378, 0, 0, 0, 1, 1,
1.300598, -1.186363, 2.765113, 0, 0, 0, 1, 1,
1.322483, 0.2701501, 1.526077, 0, 0, 0, 1, 1,
1.323433, -2.16835, 2.962035, 1, 1, 1, 1, 1,
1.335329, -0.2004574, 2.418187, 1, 1, 1, 1, 1,
1.338814, -0.9170005, 2.613428, 1, 1, 1, 1, 1,
1.340562, 0.5377691, 1.718404, 1, 1, 1, 1, 1,
1.349921, -0.2528383, 0.8316967, 1, 1, 1, 1, 1,
1.367186, -0.1121815, 1.205437, 1, 1, 1, 1, 1,
1.369082, -0.8130438, 1.064942, 1, 1, 1, 1, 1,
1.371614, 0.7903031, -1.609463, 1, 1, 1, 1, 1,
1.37252, -0.3283375, -0.6198663, 1, 1, 1, 1, 1,
1.37293, -2.043773, 1.468798, 1, 1, 1, 1, 1,
1.379193, 0.3677118, 0.3912768, 1, 1, 1, 1, 1,
1.41142, -0.7681746, 1.992279, 1, 1, 1, 1, 1,
1.416383, -1.892668, 2.511617, 1, 1, 1, 1, 1,
1.427159, -0.923643, 0.5319331, 1, 1, 1, 1, 1,
1.430838, -0.793663, 2.104949, 1, 1, 1, 1, 1,
1.439518, -2.17555, 3.775076, 0, 0, 1, 1, 1,
1.439702, 1.058298, 1.417416, 1, 0, 0, 1, 1,
1.449236, -1.104459, 1.08283, 1, 0, 0, 1, 1,
1.476809, 1.065226, 1.525165, 1, 0, 0, 1, 1,
1.478656, -0.09764502, -0.427714, 1, 0, 0, 1, 1,
1.491673, -1.199015, 1.122957, 1, 0, 0, 1, 1,
1.496865, 0.2238549, -0.5524078, 0, 0, 0, 1, 1,
1.516383, 0.609397, 1.893485, 0, 0, 0, 1, 1,
1.536423, -0.5045602, 1.037209, 0, 0, 0, 1, 1,
1.537925, 0.1678733, 0.6701886, 0, 0, 0, 1, 1,
1.54039, 0.08956138, 3.09707, 0, 0, 0, 1, 1,
1.544775, -1.005327, 0.7387309, 0, 0, 0, 1, 1,
1.547315, 0.7420987, 1.567769, 0, 0, 0, 1, 1,
1.554139, 1.235518, 2.083467, 1, 1, 1, 1, 1,
1.554777, 2.580974, -0.4582523, 1, 1, 1, 1, 1,
1.554943, 0.5138639, 2.399674, 1, 1, 1, 1, 1,
1.569147, -1.221945, 2.924124, 1, 1, 1, 1, 1,
1.574199, -0.9312044, 1.290957, 1, 1, 1, 1, 1,
1.593039, 0.5121732, 1.788539, 1, 1, 1, 1, 1,
1.593586, -0.857343, 1.082004, 1, 1, 1, 1, 1,
1.596979, 0.1433068, 0.8916059, 1, 1, 1, 1, 1,
1.62021, 0.04238948, 1.754686, 1, 1, 1, 1, 1,
1.620695, -1.719002, 3.832603, 1, 1, 1, 1, 1,
1.625079, -0.5463099, 2.97017, 1, 1, 1, 1, 1,
1.643411, 0.8480671, 0.4772478, 1, 1, 1, 1, 1,
1.648739, 0.1047478, -0.1240607, 1, 1, 1, 1, 1,
1.64914, -0.1594062, 2.218901, 1, 1, 1, 1, 1,
1.65006, 1.379009, 1.613026, 1, 1, 1, 1, 1,
1.65547, 1.392677, 2.336334, 0, 0, 1, 1, 1,
1.678637, -0.2375977, 3.013929, 1, 0, 0, 1, 1,
1.680873, 0.1954076, 0.7366336, 1, 0, 0, 1, 1,
1.692175, 0.5754341, 1.035044, 1, 0, 0, 1, 1,
1.6971, -0.82836, 1.088352, 1, 0, 0, 1, 1,
1.700437, -2.791683, 3.34786, 1, 0, 0, 1, 1,
1.702563, 0.5279485, 0.9137809, 0, 0, 0, 1, 1,
1.702779, 0.1906916, 0.4946235, 0, 0, 0, 1, 1,
1.71263, -0.3524473, 1.156828, 0, 0, 0, 1, 1,
1.729524, 0.3772788, 1.69425, 0, 0, 0, 1, 1,
1.733394, 1.051959, 0.3058125, 0, 0, 0, 1, 1,
1.746576, 0.9096813, 1.142984, 0, 0, 0, 1, 1,
1.748915, -0.1376274, 0.6010491, 0, 0, 0, 1, 1,
1.757338, 1.852711, 1.392187, 1, 1, 1, 1, 1,
1.773337, 0.1789618, 1.380751, 1, 1, 1, 1, 1,
1.776425, -1.172742, 3.040728, 1, 1, 1, 1, 1,
1.789804, 0.563482, 2.582608, 1, 1, 1, 1, 1,
1.793291, -0.516991, 1.700056, 1, 1, 1, 1, 1,
1.805386, 0.8164507, 2.486769, 1, 1, 1, 1, 1,
1.811808, 0.4009263, -0.5157188, 1, 1, 1, 1, 1,
1.813529, -0.8514487, 2.193105, 1, 1, 1, 1, 1,
1.819941, -0.9710062, 1.309805, 1, 1, 1, 1, 1,
1.840069, 1.673542, 1.558179, 1, 1, 1, 1, 1,
1.862448, 0.6736695, 0.8794187, 1, 1, 1, 1, 1,
1.869079, -1.521899, 1.875558, 1, 1, 1, 1, 1,
1.880454, -1.190163, 1.141118, 1, 1, 1, 1, 1,
1.882028, 0.6487678, 3.403599, 1, 1, 1, 1, 1,
1.902089, -0.9851903, 1.793833, 1, 1, 1, 1, 1,
1.912161, 0.03359591, 1.646686, 0, 0, 1, 1, 1,
1.959749, 1.052029, 0.270489, 1, 0, 0, 1, 1,
1.976774, -1.007107, 1.807983, 1, 0, 0, 1, 1,
2.00852, -0.08544476, -0.9199088, 1, 0, 0, 1, 1,
2.050155, 0.3749192, 2.896472, 1, 0, 0, 1, 1,
2.051295, -0.6745086, 2.555306, 1, 0, 0, 1, 1,
2.070458, 1.79607, 0.5303056, 0, 0, 0, 1, 1,
2.078262, 0.9863285, 1.155283, 0, 0, 0, 1, 1,
2.200701, -0.8620893, 1.47732, 0, 0, 0, 1, 1,
2.306309, 0.0995633, 1.796924, 0, 0, 0, 1, 1,
2.391816, 0.2606758, 2.045048, 0, 0, 0, 1, 1,
2.405532, 0.4481047, 0.5610092, 0, 0, 0, 1, 1,
2.414836, -1.690927, 2.79538, 0, 0, 0, 1, 1,
2.437362, 1.434415, 0.8874929, 1, 1, 1, 1, 1,
2.458077, -0.6182238, 3.187556, 1, 1, 1, 1, 1,
2.563852, 2.271916, 0.1642119, 1, 1, 1, 1, 1,
2.575684, -0.4811703, 2.43196, 1, 1, 1, 1, 1,
2.669033, -0.6267441, 0.8282592, 1, 1, 1, 1, 1,
2.77405, -0.3639722, 1.268989, 1, 1, 1, 1, 1,
3.08716, 0.1543335, 1.806699, 1, 1, 1, 1, 1
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
var radius = 9.445723;
var distance = 33.1777;
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
mvMatrix.translate( 0.4018459, 0.4391161, -0.2791195 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.1777);
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