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
-2.96591, -0.3217037, -0.6059285, 1, 0, 0, 1,
-2.963468, -0.6124514, -1.106422, 1, 0.007843138, 0, 1,
-2.814013, 0.6472625, 0.4138867, 1, 0.01176471, 0, 1,
-2.788254, 1.246211, -1.032862, 1, 0.01960784, 0, 1,
-2.669161, -0.2303075, 0.1787651, 1, 0.02352941, 0, 1,
-2.549483, 1.245284, -0.7715983, 1, 0.03137255, 0, 1,
-2.464236, 0.9276328, -2.486697, 1, 0.03529412, 0, 1,
-2.456836, -0.7139978, -2.500102, 1, 0.04313726, 0, 1,
-2.446591, 0.467876, 0.7077045, 1, 0.04705882, 0, 1,
-2.425636, -0.3124464, -0.1181643, 1, 0.05490196, 0, 1,
-2.420033, -0.4835337, -2.111864, 1, 0.05882353, 0, 1,
-2.411374, -0.6944925, -1.427981, 1, 0.06666667, 0, 1,
-2.397677, 0.4002596, -0.6022602, 1, 0.07058824, 0, 1,
-2.325923, -0.1095288, -2.199805, 1, 0.07843138, 0, 1,
-2.312391, 0.1466088, -0.2385039, 1, 0.08235294, 0, 1,
-2.227788, -1.207082, -3.314896, 1, 0.09019608, 0, 1,
-2.177722, -2.243249, -3.874344, 1, 0.09411765, 0, 1,
-2.151095, 0.5339095, 1.347648, 1, 0.1019608, 0, 1,
-2.143082, 0.2700702, -1.436476, 1, 0.1098039, 0, 1,
-2.126615, 0.6052739, -2.285789, 1, 0.1137255, 0, 1,
-2.07554, 0.147789, -2.013878, 1, 0.1215686, 0, 1,
-2.052191, -1.17994, -2.967387, 1, 0.1254902, 0, 1,
-2.015904, -0.4534287, -2.444959, 1, 0.1333333, 0, 1,
-2.010914, 0.9451253, -0.6078333, 1, 0.1372549, 0, 1,
-1.917687, -0.1396257, -2.674666, 1, 0.145098, 0, 1,
-1.917311, -2.595216, -2.258205, 1, 0.1490196, 0, 1,
-1.900705, -0.3620754, -0.5740406, 1, 0.1568628, 0, 1,
-1.892071, 0.277631, -1.266278, 1, 0.1607843, 0, 1,
-1.867057, 0.909583, -2.288514, 1, 0.1686275, 0, 1,
-1.86376, -0.3721413, -1.612057, 1, 0.172549, 0, 1,
-1.862926, 2.611616, 0.2716616, 1, 0.1803922, 0, 1,
-1.851801, -0.03845263, -0.2959564, 1, 0.1843137, 0, 1,
-1.837251, -2.044585, -1.092723, 1, 0.1921569, 0, 1,
-1.830276, -1.006496, -1.607459, 1, 0.1960784, 0, 1,
-1.827182, 1.654245, 0.3398488, 1, 0.2039216, 0, 1,
-1.818979, -1.316045, -2.846593, 1, 0.2117647, 0, 1,
-1.81547, -0.8951901, -0.7969529, 1, 0.2156863, 0, 1,
-1.779636, -0.136607, 0.299368, 1, 0.2235294, 0, 1,
-1.765397, 0.7374101, 0.2938634, 1, 0.227451, 0, 1,
-1.759379, -0.8178874, -0.462191, 1, 0.2352941, 0, 1,
-1.750387, 1.178985, -1.400338, 1, 0.2392157, 0, 1,
-1.74474, 0.212587, -0.725583, 1, 0.2470588, 0, 1,
-1.735298, 0.1421686, -2.349593, 1, 0.2509804, 0, 1,
-1.72414, 1.132048, -1.828006, 1, 0.2588235, 0, 1,
-1.704108, -0.5768741, -0.658004, 1, 0.2627451, 0, 1,
-1.701191, -0.08643111, -1.091348, 1, 0.2705882, 0, 1,
-1.698926, -0.02305997, 0.1941388, 1, 0.2745098, 0, 1,
-1.695504, -0.3147678, -0.9578552, 1, 0.282353, 0, 1,
-1.679437, 0.3998062, -2.163934, 1, 0.2862745, 0, 1,
-1.658323, 0.4760712, -0.741093, 1, 0.2941177, 0, 1,
-1.655996, -0.8382806, -1.640884, 1, 0.3019608, 0, 1,
-1.645547, -0.3705807, -2.684417, 1, 0.3058824, 0, 1,
-1.64343, 0.3572939, -1.582979, 1, 0.3137255, 0, 1,
-1.623948, -0.7082976, -1.997939, 1, 0.3176471, 0, 1,
-1.602683, -0.1328257, -2.084316, 1, 0.3254902, 0, 1,
-1.598772, -0.8162952, -2.585535, 1, 0.3294118, 0, 1,
-1.596955, -0.9210743, -3.215465, 1, 0.3372549, 0, 1,
-1.596865, -0.274078, -2.814917, 1, 0.3411765, 0, 1,
-1.57503, 0.1416519, -1.910632, 1, 0.3490196, 0, 1,
-1.569136, -1.318425, -3.47748, 1, 0.3529412, 0, 1,
-1.559041, 1.045816, -1.87275, 1, 0.3607843, 0, 1,
-1.555102, 0.3029206, -3.655981, 1, 0.3647059, 0, 1,
-1.552139, -0.9333916, -2.947516, 1, 0.372549, 0, 1,
-1.551844, 0.2254447, -2.172883, 1, 0.3764706, 0, 1,
-1.54326, 2.189467, -0.536938, 1, 0.3843137, 0, 1,
-1.534531, -0.329347, -2.670403, 1, 0.3882353, 0, 1,
-1.528928, -0.1880723, -1.057766, 1, 0.3960784, 0, 1,
-1.516199, -0.2859903, -1.40368, 1, 0.4039216, 0, 1,
-1.515353, 0.6055084, -1.291918, 1, 0.4078431, 0, 1,
-1.511786, -0.5131531, -1.713211, 1, 0.4156863, 0, 1,
-1.509859, -0.3983004, -1.818011, 1, 0.4196078, 0, 1,
-1.509726, -0.8816181, -4.024141, 1, 0.427451, 0, 1,
-1.502478, 0.4395175, -0.7509633, 1, 0.4313726, 0, 1,
-1.488581, 0.9405755, -0.8809638, 1, 0.4392157, 0, 1,
-1.482872, -1.467166, -4.462226, 1, 0.4431373, 0, 1,
-1.479344, -1.096927, -1.883458, 1, 0.4509804, 0, 1,
-1.478108, -0.8450615, -1.413963, 1, 0.454902, 0, 1,
-1.476666, 1.662037, -2.092898, 1, 0.4627451, 0, 1,
-1.45491, -0.7769541, -1.788097, 1, 0.4666667, 0, 1,
-1.454079, 0.2658896, -1.062144, 1, 0.4745098, 0, 1,
-1.443632, -1.863679, -1.056551, 1, 0.4784314, 0, 1,
-1.44249, 1.078052, -0.8913867, 1, 0.4862745, 0, 1,
-1.434043, -0.382111, -0.9822412, 1, 0.4901961, 0, 1,
-1.433442, -2.137559, -3.804504, 1, 0.4980392, 0, 1,
-1.430888, -0.5926896, -2.699276, 1, 0.5058824, 0, 1,
-1.428789, -0.4870851, -2.920536, 1, 0.509804, 0, 1,
-1.423684, 0.363516, 1.49061, 1, 0.5176471, 0, 1,
-1.422421, 1.110134, 0.6447651, 1, 0.5215687, 0, 1,
-1.408707, 0.6044686, 0.2656941, 1, 0.5294118, 0, 1,
-1.407078, 0.6797055, -1.796528, 1, 0.5333334, 0, 1,
-1.39871, -0.15284, -0.867742, 1, 0.5411765, 0, 1,
-1.396732, -0.4922003, -3.03091, 1, 0.5450981, 0, 1,
-1.389017, -0.1761653, -0.04701465, 1, 0.5529412, 0, 1,
-1.387025, -0.1808751, -1.355575, 1, 0.5568628, 0, 1,
-1.376696, -0.4446904, -2.983896, 1, 0.5647059, 0, 1,
-1.372053, -0.1302273, -1.255706, 1, 0.5686275, 0, 1,
-1.371517, 0.7966201, 0.1812709, 1, 0.5764706, 0, 1,
-1.365291, -1.184562, -1.910032, 1, 0.5803922, 0, 1,
-1.35604, -0.01010658, 0.009464135, 1, 0.5882353, 0, 1,
-1.332954, -1.454385, -2.937733, 1, 0.5921569, 0, 1,
-1.329061, 1.302682, -1.542949, 1, 0.6, 0, 1,
-1.323092, 1.17066, -2.365881, 1, 0.6078432, 0, 1,
-1.313285, 1.167485, 1.22132, 1, 0.6117647, 0, 1,
-1.31122, 0.1283752, -2.867484, 1, 0.6196079, 0, 1,
-1.293724, -0.2407181, -0.4833086, 1, 0.6235294, 0, 1,
-1.291145, 1.443962, -2.629121, 1, 0.6313726, 0, 1,
-1.283062, -0.1118256, -1.091564, 1, 0.6352941, 0, 1,
-1.281236, -0.07517031, 0.8169236, 1, 0.6431373, 0, 1,
-1.264824, 0.9593011, -1.827638, 1, 0.6470588, 0, 1,
-1.263942, 0.4647865, -1.169324, 1, 0.654902, 0, 1,
-1.262443, 0.4792958, -1.362723, 1, 0.6588235, 0, 1,
-1.24634, -0.3304453, -3.715392, 1, 0.6666667, 0, 1,
-1.226064, 1.522728, -2.284398, 1, 0.6705883, 0, 1,
-1.221537, -0.3622952, -3.40758, 1, 0.6784314, 0, 1,
-1.211183, 0.3439581, -0.2236728, 1, 0.682353, 0, 1,
-1.196317, 1.253582, 0.2201975, 1, 0.6901961, 0, 1,
-1.193342, -0.15268, -2.071634, 1, 0.6941177, 0, 1,
-1.191468, -0.1364621, -2.673256, 1, 0.7019608, 0, 1,
-1.18408, -0.6459073, -1.657699, 1, 0.7098039, 0, 1,
-1.180855, 0.1790651, -2.409852, 1, 0.7137255, 0, 1,
-1.18051, 0.1307446, -1.768243, 1, 0.7215686, 0, 1,
-1.173875, 1.634822, -0.3950244, 1, 0.7254902, 0, 1,
-1.173807, -0.4528333, -0.1559358, 1, 0.7333333, 0, 1,
-1.17265, 0.8878965, -1.811459, 1, 0.7372549, 0, 1,
-1.159834, -0.7702035, -0.4187008, 1, 0.7450981, 0, 1,
-1.156682, 0.3605597, -1.491347, 1, 0.7490196, 0, 1,
-1.153786, 1.421642, -1.535949, 1, 0.7568628, 0, 1,
-1.152125, -1.163688, -2.229836, 1, 0.7607843, 0, 1,
-1.15199, 0.2671076, -1.075763, 1, 0.7686275, 0, 1,
-1.150421, 0.3571816, -0.9865857, 1, 0.772549, 0, 1,
-1.148066, 0.7915136, -1.208168, 1, 0.7803922, 0, 1,
-1.138076, -0.08396696, -1.125531, 1, 0.7843137, 0, 1,
-1.132976, -0.3633209, -1.162057, 1, 0.7921569, 0, 1,
-1.132279, 1.761888, 0.9294844, 1, 0.7960784, 0, 1,
-1.126386, 0.4203202, -1.154977, 1, 0.8039216, 0, 1,
-1.122347, 0.5075886, -1.661843, 1, 0.8117647, 0, 1,
-1.122081, -0.06385244, -2.562344, 1, 0.8156863, 0, 1,
-1.118023, 0.3905569, -1.747302, 1, 0.8235294, 0, 1,
-1.117221, 0.2693209, -1.93648, 1, 0.827451, 0, 1,
-1.113564, -0.5125316, -5.152468, 1, 0.8352941, 0, 1,
-1.113395, -0.9252788, -1.942995, 1, 0.8392157, 0, 1,
-1.110882, -0.2793225, -1.379529, 1, 0.8470588, 0, 1,
-1.107865, -0.2083948, -1.759583, 1, 0.8509804, 0, 1,
-1.096984, -0.4444461, -1.406785, 1, 0.8588235, 0, 1,
-1.093034, 0.9950025, -0.1538693, 1, 0.8627451, 0, 1,
-1.088555, -0.6500588, -3.556193, 1, 0.8705882, 0, 1,
-1.062446, 1.175751, -0.3474479, 1, 0.8745098, 0, 1,
-1.058704, 0.1253512, -3.554431, 1, 0.8823529, 0, 1,
-1.056092, -0.3047588, -2.349034, 1, 0.8862745, 0, 1,
-1.046391, -0.1493827, -2.0355, 1, 0.8941177, 0, 1,
-1.031328, 0.9251301, 1.190695, 1, 0.8980392, 0, 1,
-1.02451, -2.040386, -2.275189, 1, 0.9058824, 0, 1,
-1.022119, 1.282302, -1.79024, 1, 0.9137255, 0, 1,
-1.018603, 0.8600445, -1.030144, 1, 0.9176471, 0, 1,
-1.016619, 0.5439061, -2.513269, 1, 0.9254902, 0, 1,
-1.016207, -2.106829, -3.614173, 1, 0.9294118, 0, 1,
-1.002527, -0.01376526, -2.346869, 1, 0.9372549, 0, 1,
-0.9997821, -0.7610489, -1.279318, 1, 0.9411765, 0, 1,
-0.998072, -0.3866178, -0.4064371, 1, 0.9490196, 0, 1,
-0.9978331, 1.290187, -0.1960494, 1, 0.9529412, 0, 1,
-0.9950811, 0.2421592, -3.548826, 1, 0.9607843, 0, 1,
-0.9926091, 0.7198526, -0.7396407, 1, 0.9647059, 0, 1,
-0.9848994, 0.2535892, -0.2056895, 1, 0.972549, 0, 1,
-0.9846856, -0.3457756, -1.107672, 1, 0.9764706, 0, 1,
-0.9838946, 0.0740126, -2.111228, 1, 0.9843137, 0, 1,
-0.9802445, 1.869352, 0.7178572, 1, 0.9882353, 0, 1,
-0.9797254, -0.8483929, -3.031455, 1, 0.9960784, 0, 1,
-0.9777017, -0.281569, -3.077408, 0.9960784, 1, 0, 1,
-0.9749474, 1.274487, 0.5952418, 0.9921569, 1, 0, 1,
-0.9692859, -0.6155397, -1.470401, 0.9843137, 1, 0, 1,
-0.9633757, 0.2325949, -1.641604, 0.9803922, 1, 0, 1,
-0.9627254, -1.205238, -2.536296, 0.972549, 1, 0, 1,
-0.957498, -1.123637, -4.951293, 0.9686275, 1, 0, 1,
-0.9558766, -0.6313799, -1.619998, 0.9607843, 1, 0, 1,
-0.9558268, -0.7775312, -1.913965, 0.9568627, 1, 0, 1,
-0.9497326, 2.990336, -0.8433923, 0.9490196, 1, 0, 1,
-0.9472839, -2.15349, -2.42591, 0.945098, 1, 0, 1,
-0.9404669, 1.774188, 0.2859173, 0.9372549, 1, 0, 1,
-0.9368874, 0.5115487, -0.6128622, 0.9333333, 1, 0, 1,
-0.9352096, 1.073304, -0.5514638, 0.9254902, 1, 0, 1,
-0.9348844, 1.264235, -1.497539, 0.9215686, 1, 0, 1,
-0.931914, 1.208262, 1.135198, 0.9137255, 1, 0, 1,
-0.9278629, -0.5520329, -1.446265, 0.9098039, 1, 0, 1,
-0.9242712, 0.5170519, -2.566839, 0.9019608, 1, 0, 1,
-0.923291, 1.386333, 1.478513, 0.8941177, 1, 0, 1,
-0.9226434, 1.07651, -0.2699611, 0.8901961, 1, 0, 1,
-0.9191746, 1.37843, -0.08452885, 0.8823529, 1, 0, 1,
-0.9173236, 0.2704897, -2.075471, 0.8784314, 1, 0, 1,
-0.9101883, 1.347233, -0.7201635, 0.8705882, 1, 0, 1,
-0.8961017, 0.1894694, -0.3812248, 0.8666667, 1, 0, 1,
-0.8933907, 1.620773, 0.2705258, 0.8588235, 1, 0, 1,
-0.8925192, 1.7434, -0.6902601, 0.854902, 1, 0, 1,
-0.8923222, 0.1947386, -1.675764, 0.8470588, 1, 0, 1,
-0.8916679, -0.1044627, -2.792784, 0.8431373, 1, 0, 1,
-0.890828, 1.36377, -0.1103449, 0.8352941, 1, 0, 1,
-0.8857192, -0.772701, -3.558301, 0.8313726, 1, 0, 1,
-0.8846831, 0.4446806, -0.8741851, 0.8235294, 1, 0, 1,
-0.8821507, 0.3421143, -2.068094, 0.8196079, 1, 0, 1,
-0.8804885, -0.2238672, -1.608182, 0.8117647, 1, 0, 1,
-0.8695468, -0.806114, -0.6392543, 0.8078431, 1, 0, 1,
-0.8676847, 1.125663, 0.4078887, 0.8, 1, 0, 1,
-0.8672357, 1.371591, -1.405936, 0.7921569, 1, 0, 1,
-0.8628169, 0.782487, 0.1630154, 0.7882353, 1, 0, 1,
-0.861657, 0.1718513, -1.742097, 0.7803922, 1, 0, 1,
-0.8561226, 1.109374, -1.077055, 0.7764706, 1, 0, 1,
-0.8509244, -0.9766444, -2.201927, 0.7686275, 1, 0, 1,
-0.8477325, -1.167258, -2.929216, 0.7647059, 1, 0, 1,
-0.8385551, -0.1295366, -1.734557, 0.7568628, 1, 0, 1,
-0.8374926, -0.8626875, -3.258849, 0.7529412, 1, 0, 1,
-0.836342, -0.3951052, -1.730141, 0.7450981, 1, 0, 1,
-0.8301551, 0.6379369, -0.2464913, 0.7411765, 1, 0, 1,
-0.8218696, 0.7437537, -3.547846, 0.7333333, 1, 0, 1,
-0.8216852, 0.5725778, -0.7139425, 0.7294118, 1, 0, 1,
-0.819961, 1.137408, -0.6243623, 0.7215686, 1, 0, 1,
-0.8198767, 1.244536, 0.6277822, 0.7176471, 1, 0, 1,
-0.8166445, -1.412052, -1.139645, 0.7098039, 1, 0, 1,
-0.81315, -0.4419464, -1.856334, 0.7058824, 1, 0, 1,
-0.8073936, -0.4157903, -2.467538, 0.6980392, 1, 0, 1,
-0.8064216, 0.5369283, 0.1822627, 0.6901961, 1, 0, 1,
-0.8059227, 0.9106197, -1.124237, 0.6862745, 1, 0, 1,
-0.7936699, -0.06943637, -2.217762, 0.6784314, 1, 0, 1,
-0.7918393, 0.1639814, -1.323078, 0.6745098, 1, 0, 1,
-0.7909153, -0.3497351, -1.927857, 0.6666667, 1, 0, 1,
-0.7871388, 0.4641823, -1.192748, 0.6627451, 1, 0, 1,
-0.7724419, -1.642397, -4.305395, 0.654902, 1, 0, 1,
-0.7704246, -0.5466087, -4.41103, 0.6509804, 1, 0, 1,
-0.7690206, 1.436066, 1.458896, 0.6431373, 1, 0, 1,
-0.7679549, 0.09500548, -0.9209501, 0.6392157, 1, 0, 1,
-0.7672699, 0.3950292, -1.677413, 0.6313726, 1, 0, 1,
-0.76685, -0.6401441, -3.00543, 0.627451, 1, 0, 1,
-0.757205, -1.517028, -4.198709, 0.6196079, 1, 0, 1,
-0.7571309, -0.4635296, -1.935476, 0.6156863, 1, 0, 1,
-0.7523051, 1.288906, -0.8773996, 0.6078432, 1, 0, 1,
-0.751219, -0.5991397, -1.056163, 0.6039216, 1, 0, 1,
-0.7479777, 0.003926336, -3.764303, 0.5960785, 1, 0, 1,
-0.743351, 0.9829298, -1.116912, 0.5882353, 1, 0, 1,
-0.733306, -0.390738, -2.006042, 0.5843138, 1, 0, 1,
-0.7315726, -2.790102, -2.411201, 0.5764706, 1, 0, 1,
-0.7314458, -0.0669497, -4.416467, 0.572549, 1, 0, 1,
-0.7273962, -0.4050431, -2.885256, 0.5647059, 1, 0, 1,
-0.7256218, -0.1736235, -2.139769, 0.5607843, 1, 0, 1,
-0.7251612, 0.7341084, 1.343571, 0.5529412, 1, 0, 1,
-0.718962, -0.6571147, -2.98011, 0.5490196, 1, 0, 1,
-0.7183051, -0.04388741, -1.065807, 0.5411765, 1, 0, 1,
-0.7165322, -0.3723793, -1.359782, 0.5372549, 1, 0, 1,
-0.7079666, 0.2328636, 0.05896695, 0.5294118, 1, 0, 1,
-0.7040489, 0.08941913, -1.26379, 0.5254902, 1, 0, 1,
-0.6994985, -0.452803, -3.052141, 0.5176471, 1, 0, 1,
-0.6948349, 1.085292, -0.9334705, 0.5137255, 1, 0, 1,
-0.6909548, 0.1214653, -2.413773, 0.5058824, 1, 0, 1,
-0.6794642, -0.6643575, 0.2387325, 0.5019608, 1, 0, 1,
-0.6766506, -0.9916618, -3.637606, 0.4941176, 1, 0, 1,
-0.6741436, -0.7452505, -3.326212, 0.4862745, 1, 0, 1,
-0.6729859, -2.172053, -3.158299, 0.4823529, 1, 0, 1,
-0.6711948, 0.8441175, 0.05879816, 0.4745098, 1, 0, 1,
-0.6711712, -1.176394, -3.310722, 0.4705882, 1, 0, 1,
-0.6678104, -1.028738, -0.9487077, 0.4627451, 1, 0, 1,
-0.661945, 0.7079482, -1.699568, 0.4588235, 1, 0, 1,
-0.660126, 0.3910987, 0.3836887, 0.4509804, 1, 0, 1,
-0.6591235, -0.3854103, -1.712392, 0.4470588, 1, 0, 1,
-0.6517568, -1.628465, -3.833165, 0.4392157, 1, 0, 1,
-0.646974, -0.4035487, -1.608209, 0.4352941, 1, 0, 1,
-0.6462972, -0.8082817, -4.389616, 0.427451, 1, 0, 1,
-0.6429383, 1.929886, 0.6119483, 0.4235294, 1, 0, 1,
-0.6423378, -0.2591264, -0.8072857, 0.4156863, 1, 0, 1,
-0.6392788, -0.1540121, -3.171293, 0.4117647, 1, 0, 1,
-0.6307331, -0.4240687, -2.204039, 0.4039216, 1, 0, 1,
-0.6190915, -1.023751, -1.761984, 0.3960784, 1, 0, 1,
-0.6180762, -1.108403, -3.115418, 0.3921569, 1, 0, 1,
-0.6137711, -1.368302, -0.7003145, 0.3843137, 1, 0, 1,
-0.6134965, 1.686804, -1.040254, 0.3803922, 1, 0, 1,
-0.6125004, -1.237348, -2.273367, 0.372549, 1, 0, 1,
-0.6121418, 0.5672269, -0.9225156, 0.3686275, 1, 0, 1,
-0.6099687, -1.045086, -1.451357, 0.3607843, 1, 0, 1,
-0.6096511, 0.05281336, -0.009083734, 0.3568628, 1, 0, 1,
-0.6095012, -0.5810036, -1.040348, 0.3490196, 1, 0, 1,
-0.6071674, -1.266996, -2.147387, 0.345098, 1, 0, 1,
-0.6046683, -0.1040785, -1.518802, 0.3372549, 1, 0, 1,
-0.6027519, -1.60937, -2.241939, 0.3333333, 1, 0, 1,
-0.5942301, 0.0492021, -0.9379271, 0.3254902, 1, 0, 1,
-0.5907626, 0.5320509, -1.445823, 0.3215686, 1, 0, 1,
-0.5823246, -0.9015654, -2.060563, 0.3137255, 1, 0, 1,
-0.5816633, 0.1478339, -1.039579, 0.3098039, 1, 0, 1,
-0.5737096, -1.581342, -1.88048, 0.3019608, 1, 0, 1,
-0.5729485, -0.09367017, -0.5766729, 0.2941177, 1, 0, 1,
-0.5717694, -1.312867, -3.266734, 0.2901961, 1, 0, 1,
-0.5660568, -0.8338251, -2.864871, 0.282353, 1, 0, 1,
-0.5621498, 1.467326, -1.30781, 0.2784314, 1, 0, 1,
-0.5596342, 1.078723, -0.3755299, 0.2705882, 1, 0, 1,
-0.555451, -0.1442327, -2.558341, 0.2666667, 1, 0, 1,
-0.5535318, -0.7084911, -2.691922, 0.2588235, 1, 0, 1,
-0.5529643, -1.41423, -2.178275, 0.254902, 1, 0, 1,
-0.5479161, 0.3419124, -1.346539, 0.2470588, 1, 0, 1,
-0.5461486, -0.8083469, -0.8647251, 0.2431373, 1, 0, 1,
-0.5433306, -0.8737674, -0.748852, 0.2352941, 1, 0, 1,
-0.5404748, -0.2657298, -0.06067094, 0.2313726, 1, 0, 1,
-0.5340038, -0.005234479, -3.146157, 0.2235294, 1, 0, 1,
-0.532876, 1.749922, -0.4205785, 0.2196078, 1, 0, 1,
-0.5309132, -0.8149182, -0.8768358, 0.2117647, 1, 0, 1,
-0.5294077, -0.08676413, -3.317, 0.2078431, 1, 0, 1,
-0.5279029, -0.6266188, -1.284634, 0.2, 1, 0, 1,
-0.5248631, 0.09973738, -0.4485342, 0.1921569, 1, 0, 1,
-0.5206982, 0.8718194, 1.715434, 0.1882353, 1, 0, 1,
-0.5167164, -0.3725079, -2.933669, 0.1803922, 1, 0, 1,
-0.5149626, 0.5309618, -1.650663, 0.1764706, 1, 0, 1,
-0.5149611, -0.8121868, -2.872973, 0.1686275, 1, 0, 1,
-0.5114886, -0.3077065, -1.710747, 0.1647059, 1, 0, 1,
-0.5039219, -1.079059, -3.857868, 0.1568628, 1, 0, 1,
-0.5004461, -0.7213807, -3.554035, 0.1529412, 1, 0, 1,
-0.4996302, 0.7952846, -0.7193706, 0.145098, 1, 0, 1,
-0.4935999, -2.226864, -3.30039, 0.1411765, 1, 0, 1,
-0.4847507, 1.496874, -0.1113065, 0.1333333, 1, 0, 1,
-0.4798382, -0.1292177, -1.872046, 0.1294118, 1, 0, 1,
-0.4793389, -1.397624, -2.497705, 0.1215686, 1, 0, 1,
-0.474102, 0.1869365, -0.9722067, 0.1176471, 1, 0, 1,
-0.472114, 0.8724853, 0.4377171, 0.1098039, 1, 0, 1,
-0.4720343, -0.9237435, -1.544642, 0.1058824, 1, 0, 1,
-0.4667753, -1.63316, -3.410611, 0.09803922, 1, 0, 1,
-0.4662049, -0.4722691, -1.475724, 0.09019608, 1, 0, 1,
-0.4638885, 0.08786555, -3.307423, 0.08627451, 1, 0, 1,
-0.4616683, 0.07646505, -0.5872675, 0.07843138, 1, 0, 1,
-0.4546991, 1.073072, -0.07619073, 0.07450981, 1, 0, 1,
-0.4534832, 2.895719, 1.94136, 0.06666667, 1, 0, 1,
-0.4533476, 1.023262, -0.4446898, 0.0627451, 1, 0, 1,
-0.4477752, 0.151751, -0.7740126, 0.05490196, 1, 0, 1,
-0.445343, 0.6757976, -2.362297, 0.05098039, 1, 0, 1,
-0.4447601, -1.200614, -4.716825, 0.04313726, 1, 0, 1,
-0.4411932, 0.9524686, -1.922229, 0.03921569, 1, 0, 1,
-0.4406064, -0.3751239, -2.965575, 0.03137255, 1, 0, 1,
-0.4398337, -0.6283419, -3.031556, 0.02745098, 1, 0, 1,
-0.4338946, 0.6249162, -0.951383, 0.01960784, 1, 0, 1,
-0.431843, 1.090741, 0.04533907, 0.01568628, 1, 0, 1,
-0.4294259, 1.667339, -1.358192, 0.007843138, 1, 0, 1,
-0.4287503, -0.5352559, -2.153775, 0.003921569, 1, 0, 1,
-0.4259399, -0.05948195, -3.605525, 0, 1, 0.003921569, 1,
-0.4245051, 1.427898, -1.396858, 0, 1, 0.01176471, 1,
-0.4229942, -2.547137, -2.642453, 0, 1, 0.01568628, 1,
-0.4192063, -0.1986587, -1.007703, 0, 1, 0.02352941, 1,
-0.4188488, 1.859472, 0.4751424, 0, 1, 0.02745098, 1,
-0.4136913, -0.02966556, -0.4564241, 0, 1, 0.03529412, 1,
-0.4105225, -0.7038183, -3.884566, 0, 1, 0.03921569, 1,
-0.4099602, -0.479334, -2.71425, 0, 1, 0.04705882, 1,
-0.4098407, -2.224699, -2.610069, 0, 1, 0.05098039, 1,
-0.3982404, -0.4628119, -2.016201, 0, 1, 0.05882353, 1,
-0.3969882, 0.1007468, -3.44577, 0, 1, 0.0627451, 1,
-0.3933152, 0.531204, -1.837816, 0, 1, 0.07058824, 1,
-0.3916947, 0.9645231, -1.81, 0, 1, 0.07450981, 1,
-0.39072, -2.070239, -5.300262, 0, 1, 0.08235294, 1,
-0.3904797, -0.109695, -1.300785, 0, 1, 0.08627451, 1,
-0.3896598, 0.5836686, 0.9783805, 0, 1, 0.09411765, 1,
-0.3877542, -0.3921865, -1.996705, 0, 1, 0.1019608, 1,
-0.3852628, -1.232878, -2.352274, 0, 1, 0.1058824, 1,
-0.3792648, -1.026628, -2.032066, 0, 1, 0.1137255, 1,
-0.3788077, 2.305731, -0.9450789, 0, 1, 0.1176471, 1,
-0.3782593, 1.697003, -0.2420454, 0, 1, 0.1254902, 1,
-0.3766805, 0.5914232, 0.6493267, 0, 1, 0.1294118, 1,
-0.3743511, 1.18872, -1.251246, 0, 1, 0.1372549, 1,
-0.369323, -0.1934502, -3.759193, 0, 1, 0.1411765, 1,
-0.3680673, -0.1995542, 0.938104, 0, 1, 0.1490196, 1,
-0.3668546, -1.009144, -2.236635, 0, 1, 0.1529412, 1,
-0.3663676, -0.6599023, -1.44348, 0, 1, 0.1607843, 1,
-0.3590411, 0.8109427, -0.0977296, 0, 1, 0.1647059, 1,
-0.3460756, 1.737025, 0.6084627, 0, 1, 0.172549, 1,
-0.3449444, 0.3913466, 0.4168675, 0, 1, 0.1764706, 1,
-0.3300967, 0.2149323, -1.163497, 0, 1, 0.1843137, 1,
-0.3295293, -0.7988688, -4.793876, 0, 1, 0.1882353, 1,
-0.3217832, 0.9700922, 0.4435021, 0, 1, 0.1960784, 1,
-0.3209335, 1.559182, -0.04111828, 0, 1, 0.2039216, 1,
-0.3199485, -0.210448, -1.75832, 0, 1, 0.2078431, 1,
-0.3186743, 0.764518, -1.214534, 0, 1, 0.2156863, 1,
-0.317275, -0.3542857, -2.71168, 0, 1, 0.2196078, 1,
-0.3155179, 0.7770489, -1.149138, 0, 1, 0.227451, 1,
-0.3120207, -0.15962, -3.755437, 0, 1, 0.2313726, 1,
-0.3047246, 0.7475994, -1.48098, 0, 1, 0.2392157, 1,
-0.3032328, -0.1146439, -1.089388, 0, 1, 0.2431373, 1,
-0.3030633, 0.5117651, 1.135489, 0, 1, 0.2509804, 1,
-0.2994732, -0.2302431, -2.212851, 0, 1, 0.254902, 1,
-0.2965206, 2.115153, -0.1079428, 0, 1, 0.2627451, 1,
-0.2961831, 0.1826651, -0.574101, 0, 1, 0.2666667, 1,
-0.2916337, 0.4787477, 0.1757961, 0, 1, 0.2745098, 1,
-0.2909463, 0.6356116, 0.4736963, 0, 1, 0.2784314, 1,
-0.2886066, -0.155802, -1.05634, 0, 1, 0.2862745, 1,
-0.287502, 0.5062465, -0.6424353, 0, 1, 0.2901961, 1,
-0.2862736, 0.1344746, -0.6944307, 0, 1, 0.2980392, 1,
-0.2770695, -0.3659636, -2.021426, 0, 1, 0.3058824, 1,
-0.2732544, 0.1475843, -1.063222, 0, 1, 0.3098039, 1,
-0.272514, -1.796651, -3.79882, 0, 1, 0.3176471, 1,
-0.2694451, -1.985967, -1.504187, 0, 1, 0.3215686, 1,
-0.264535, 0.2068017, -1.039491, 0, 1, 0.3294118, 1,
-0.2636728, 0.6330531, -0.8898389, 0, 1, 0.3333333, 1,
-0.2628968, 1.240592, -1.380283, 0, 1, 0.3411765, 1,
-0.2626138, -0.1655762, -0.4834637, 0, 1, 0.345098, 1,
-0.2604805, -0.677443, -2.927456, 0, 1, 0.3529412, 1,
-0.2567743, 0.5366135, -2.193618, 0, 1, 0.3568628, 1,
-0.2547115, 0.05916892, -3.050814, 0, 1, 0.3647059, 1,
-0.2508371, 0.09898373, -1.706956, 0, 1, 0.3686275, 1,
-0.2503601, 1.620296, -0.7131304, 0, 1, 0.3764706, 1,
-0.2485467, 0.988712, 0.5501739, 0, 1, 0.3803922, 1,
-0.2482756, 0.8072728, 0.9613365, 0, 1, 0.3882353, 1,
-0.2469669, -1.052329, -2.442932, 0, 1, 0.3921569, 1,
-0.2405198, 1.760465, -0.3493753, 0, 1, 0.4, 1,
-0.2359721, 0.2765179, 0.1273922, 0, 1, 0.4078431, 1,
-0.2286882, 0.6617396, 0.8419417, 0, 1, 0.4117647, 1,
-0.2261889, 1.25169, -2.137449, 0, 1, 0.4196078, 1,
-0.2254211, 0.3308448, -1.610423, 0, 1, 0.4235294, 1,
-0.2221563, -0.284128, -1.138696, 0, 1, 0.4313726, 1,
-0.2212107, -0.4062018, -3.411579, 0, 1, 0.4352941, 1,
-0.2168388, -1.994334, -3.51373, 0, 1, 0.4431373, 1,
-0.2156814, 0.7655248, -1.460707, 0, 1, 0.4470588, 1,
-0.2147427, -0.5658674, -2.099763, 0, 1, 0.454902, 1,
-0.2117296, 0.2387732, -1.08548, 0, 1, 0.4588235, 1,
-0.210815, 0.05699775, 0.1068778, 0, 1, 0.4666667, 1,
-0.2086588, -0.2937194, -2.983654, 0, 1, 0.4705882, 1,
-0.2083008, 0.3002583, -1.160801, 0, 1, 0.4784314, 1,
-0.2074596, -1.1239, -0.8871635, 0, 1, 0.4823529, 1,
-0.2038232, -0.6750725, -2.922593, 0, 1, 0.4901961, 1,
-0.1997221, 0.1677213, -1.031363, 0, 1, 0.4941176, 1,
-0.1988231, -2.914809, -3.491207, 0, 1, 0.5019608, 1,
-0.1977642, -0.9459244, -2.091273, 0, 1, 0.509804, 1,
-0.1949708, 0.01394136, -1.535951, 0, 1, 0.5137255, 1,
-0.1940926, 0.5515708, 0.4033437, 0, 1, 0.5215687, 1,
-0.1894958, 0.3517251, -0.4974894, 0, 1, 0.5254902, 1,
-0.1884563, -1.488271, -4.372511, 0, 1, 0.5333334, 1,
-0.1882893, 0.9462874, -1.634722, 0, 1, 0.5372549, 1,
-0.1758704, -0.9969842, -2.285434, 0, 1, 0.5450981, 1,
-0.1758162, 0.2253686, -0.2862487, 0, 1, 0.5490196, 1,
-0.1753062, 0.5253469, -2.201361, 0, 1, 0.5568628, 1,
-0.1740958, 1.020362, -0.6514717, 0, 1, 0.5607843, 1,
-0.171427, -0.4895915, -1.27756, 0, 1, 0.5686275, 1,
-0.1704894, 1.708976, -1.194693, 0, 1, 0.572549, 1,
-0.1675652, -0.7614619, -3.6976, 0, 1, 0.5803922, 1,
-0.1673955, 0.8457345, -0.1033389, 0, 1, 0.5843138, 1,
-0.162867, 0.3595325, -0.6620051, 0, 1, 0.5921569, 1,
-0.1590135, -0.863102, -3.386671, 0, 1, 0.5960785, 1,
-0.158614, 0.2559552, -0.6546806, 0, 1, 0.6039216, 1,
-0.1569749, 0.2709745, -0.02184663, 0, 1, 0.6117647, 1,
-0.1510718, -0.6425269, -4.492073, 0, 1, 0.6156863, 1,
-0.1505562, 1.561112, 0.7709981, 0, 1, 0.6235294, 1,
-0.1501112, 0.4889975, 0.9319002, 0, 1, 0.627451, 1,
-0.1483054, -0.5533502, -2.647942, 0, 1, 0.6352941, 1,
-0.1480361, 0.181782, 0.09063892, 0, 1, 0.6392157, 1,
-0.1476305, 0.9407975, 0.930059, 0, 1, 0.6470588, 1,
-0.1453794, -0.5527385, -2.372026, 0, 1, 0.6509804, 1,
-0.1414587, -1.079673, -4.031772, 0, 1, 0.6588235, 1,
-0.140476, 0.3031733, 0.2231199, 0, 1, 0.6627451, 1,
-0.1395672, -1.288681, -3.556398, 0, 1, 0.6705883, 1,
-0.1393726, -1.228517, -2.782777, 0, 1, 0.6745098, 1,
-0.1359372, -0.7792297, -3.629079, 0, 1, 0.682353, 1,
-0.1332375, 0.3283657, -1.55087, 0, 1, 0.6862745, 1,
-0.1315255, 0.7382847, -2.760588, 0, 1, 0.6941177, 1,
-0.1313643, 0.03663998, -3.4698, 0, 1, 0.7019608, 1,
-0.1298435, -1.196174, -2.447004, 0, 1, 0.7058824, 1,
-0.1276163, 0.4850074, 0.09439164, 0, 1, 0.7137255, 1,
-0.1272953, -1.489553, -2.783648, 0, 1, 0.7176471, 1,
-0.1230018, -0.8336942, -0.27154, 0, 1, 0.7254902, 1,
-0.1200433, -1.87831, -3.034093, 0, 1, 0.7294118, 1,
-0.1187885, -1.491817, -1.392407, 0, 1, 0.7372549, 1,
-0.1184369, -0.8267946, -3.445437, 0, 1, 0.7411765, 1,
-0.118005, 1.529003, 0.5363809, 0, 1, 0.7490196, 1,
-0.1168624, -0.8079979, -3.419411, 0, 1, 0.7529412, 1,
-0.1151879, 0.4544367, 0.009920837, 0, 1, 0.7607843, 1,
-0.1131749, -0.9774391, -4.690149, 0, 1, 0.7647059, 1,
-0.1021722, -0.4065657, -1.724454, 0, 1, 0.772549, 1,
-0.1017644, -0.3562866, -4.685167, 0, 1, 0.7764706, 1,
-0.09000033, -0.9276441, -4.024626, 0, 1, 0.7843137, 1,
-0.08627247, 1.071097, 0.5881382, 0, 1, 0.7882353, 1,
-0.08549148, -0.5081851, -4.301802, 0, 1, 0.7960784, 1,
-0.07988063, 0.9152386, -0.9140873, 0, 1, 0.8039216, 1,
-0.06815612, -0.06874703, -2.174234, 0, 1, 0.8078431, 1,
-0.06681482, -2.583102, -2.04118, 0, 1, 0.8156863, 1,
-0.06681464, 1.24677, 0.9731589, 0, 1, 0.8196079, 1,
-0.06380674, -1.636158, -3.986345, 0, 1, 0.827451, 1,
-0.06293111, -2.018574, -2.348883, 0, 1, 0.8313726, 1,
-0.05780602, 0.5443705, 2.046031, 0, 1, 0.8392157, 1,
-0.05497324, -0.6989112, -2.720412, 0, 1, 0.8431373, 1,
-0.05372785, -1.378786, -3.95535, 0, 1, 0.8509804, 1,
-0.04802883, -0.2418902, -1.794736, 0, 1, 0.854902, 1,
-0.04292716, -1.598026, -3.228442, 0, 1, 0.8627451, 1,
-0.04287914, 0.995792, 0.987123, 0, 1, 0.8666667, 1,
-0.04253067, 2.441556, -0.007109703, 0, 1, 0.8745098, 1,
-0.03961504, 0.4015016, -0.07639151, 0, 1, 0.8784314, 1,
-0.03764499, 0.6951101, -1.321243, 0, 1, 0.8862745, 1,
-0.03643959, -2.432855, -3.725005, 0, 1, 0.8901961, 1,
-0.02842679, 1.139622, 0.5639647, 0, 1, 0.8980392, 1,
-0.02220898, 0.07393924, -1.609655, 0, 1, 0.9058824, 1,
-0.02099725, -0.1580136, -5.6542, 0, 1, 0.9098039, 1,
-0.01967601, -0.7930914, -3.000825, 0, 1, 0.9176471, 1,
-0.01812649, 0.6382006, 0.5122597, 0, 1, 0.9215686, 1,
-0.01803294, 0.3316168, -1.215258, 0, 1, 0.9294118, 1,
-0.01335793, -0.2731293, -2.934613, 0, 1, 0.9333333, 1,
-0.01280174, -0.3968923, -3.214153, 0, 1, 0.9411765, 1,
-0.01064661, -1.359593, -1.15117, 0, 1, 0.945098, 1,
-0.006264573, -0.1718681, -3.228931, 0, 1, 0.9529412, 1,
-0.004961639, 1.660645, -1.013114, 0, 1, 0.9568627, 1,
-0.002547315, -1.265272, -2.073988, 0, 1, 0.9647059, 1,
-0.0008113765, -1.433831, -1.999971, 0, 1, 0.9686275, 1,
-0.0008004259, -0.8580383, -3.320393, 0, 1, 0.9764706, 1,
0.003115246, -0.2033541, 3.235774, 0, 1, 0.9803922, 1,
0.0120188, -0.02186523, 2.765953, 0, 1, 0.9882353, 1,
0.01655148, 0.2934774, 0.1904543, 0, 1, 0.9921569, 1,
0.0179557, -1.395679, 1.086284, 0, 1, 1, 1,
0.02255865, 0.1150407, -0.08692912, 0, 0.9921569, 1, 1,
0.02313763, -1.108568, 3.585059, 0, 0.9882353, 1, 1,
0.02357374, -1.545925, 3.286528, 0, 0.9803922, 1, 1,
0.02404113, -0.2724688, 1.03541, 0, 0.9764706, 1, 1,
0.02833138, 0.6822594, 0.204339, 0, 0.9686275, 1, 1,
0.03121069, 1.327766, 1.296935, 0, 0.9647059, 1, 1,
0.03734288, 1.248205, 2.429139, 0, 0.9568627, 1, 1,
0.03859988, 0.776543, 3.012796, 0, 0.9529412, 1, 1,
0.041631, -1.117884, 2.896606, 0, 0.945098, 1, 1,
0.04340344, -0.09982979, 2.390891, 0, 0.9411765, 1, 1,
0.04345974, -1.42865, 1.748672, 0, 0.9333333, 1, 1,
0.05077157, -1.332994, 4.815447, 0, 0.9294118, 1, 1,
0.05243947, -0.2340468, 3.493339, 0, 0.9215686, 1, 1,
0.05711907, 1.828897, -0.2829049, 0, 0.9176471, 1, 1,
0.0576376, -0.5782473, 1.87067, 0, 0.9098039, 1, 1,
0.05764226, 1.213661, 0.6532371, 0, 0.9058824, 1, 1,
0.05981975, -1.65311, 3.069171, 0, 0.8980392, 1, 1,
0.06043024, -0.5587265, 4.040263, 0, 0.8901961, 1, 1,
0.06554098, 0.2834581, 1.381609, 0, 0.8862745, 1, 1,
0.07144136, 0.9268231, -0.8544484, 0, 0.8784314, 1, 1,
0.07212171, 1.264548, -0.5582417, 0, 0.8745098, 1, 1,
0.07360628, 0.6114994, -0.1258947, 0, 0.8666667, 1, 1,
0.07392325, 2.068093, 0.5301031, 0, 0.8627451, 1, 1,
0.07516614, -0.725768, 3.228163, 0, 0.854902, 1, 1,
0.07868618, -1.593817, 2.732268, 0, 0.8509804, 1, 1,
0.07888212, 0.1561921, 0.4037471, 0, 0.8431373, 1, 1,
0.08638223, 0.927722, 0.6357194, 0, 0.8392157, 1, 1,
0.0868923, -1.98288, 2.676982, 0, 0.8313726, 1, 1,
0.0877476, -0.4764489, 2.39495, 0, 0.827451, 1, 1,
0.09090819, 0.6015828, -2.078262, 0, 0.8196079, 1, 1,
0.09190249, -0.06227193, 0.6705381, 0, 0.8156863, 1, 1,
0.09280455, -0.5650336, 2.854327, 0, 0.8078431, 1, 1,
0.09725878, 0.05020971, 1.633005, 0, 0.8039216, 1, 1,
0.1025787, -1.459983, 3.039739, 0, 0.7960784, 1, 1,
0.102803, -0.21882, 2.843099, 0, 0.7882353, 1, 1,
0.1035905, -0.09839562, 0.9634285, 0, 0.7843137, 1, 1,
0.1036706, -0.2784824, 2.694024, 0, 0.7764706, 1, 1,
0.109626, -0.002609692, 0.3351732, 0, 0.772549, 1, 1,
0.1137444, 1.313642, -0.6775445, 0, 0.7647059, 1, 1,
0.1164215, 0.5309068, 1.584605, 0, 0.7607843, 1, 1,
0.1188578, 1.26724, -0.5088947, 0, 0.7529412, 1, 1,
0.1190488, 0.2377838, -0.3050502, 0, 0.7490196, 1, 1,
0.1215205, 0.7832778, 0.4090137, 0, 0.7411765, 1, 1,
0.1243142, -0.1600022, 3.09891, 0, 0.7372549, 1, 1,
0.1249217, 0.7529908, 1.044962, 0, 0.7294118, 1, 1,
0.125576, 0.6551951, -1.136207, 0, 0.7254902, 1, 1,
0.1272209, 0.6661507, 0.2436992, 0, 0.7176471, 1, 1,
0.1341231, -1.037924, 3.716415, 0, 0.7137255, 1, 1,
0.1364164, 1.027139, -0.5054031, 0, 0.7058824, 1, 1,
0.1370962, -0.4078749, 1.668837, 0, 0.6980392, 1, 1,
0.1389664, 0.5907661, -0.8130716, 0, 0.6941177, 1, 1,
0.1400438, -1.608084, 2.525629, 0, 0.6862745, 1, 1,
0.1430074, -0.2218845, 1.977475, 0, 0.682353, 1, 1,
0.1452224, -0.9506047, 2.254834, 0, 0.6745098, 1, 1,
0.1461509, -0.005895755, 1.967439, 0, 0.6705883, 1, 1,
0.1478862, 0.2498543, -0.2072676, 0, 0.6627451, 1, 1,
0.1486985, 1.189931, -1.62301, 0, 0.6588235, 1, 1,
0.1556959, -1.277046, 3.863516, 0, 0.6509804, 1, 1,
0.1564318, -1.107337, 3.502626, 0, 0.6470588, 1, 1,
0.1564604, 0.4694804, 3.615587, 0, 0.6392157, 1, 1,
0.1580094, 0.691075, 0.6021563, 0, 0.6352941, 1, 1,
0.1607066, -0.4055405, 2.314227, 0, 0.627451, 1, 1,
0.1676371, -1.921267, 3.022489, 0, 0.6235294, 1, 1,
0.1683922, -1.660451, 3.629813, 0, 0.6156863, 1, 1,
0.1699155, 0.1179131, -0.3519399, 0, 0.6117647, 1, 1,
0.1716761, 1.1471, -0.9057286, 0, 0.6039216, 1, 1,
0.1724407, -1.063322, 4.253125, 0, 0.5960785, 1, 1,
0.1740231, -0.1558343, 1.972626, 0, 0.5921569, 1, 1,
0.1755288, -0.225639, 3.135611, 0, 0.5843138, 1, 1,
0.1762553, -1.888618, 1.672895, 0, 0.5803922, 1, 1,
0.1773996, 0.1448694, 2.31247, 0, 0.572549, 1, 1,
0.184276, -0.6148416, 3.144217, 0, 0.5686275, 1, 1,
0.1872532, -0.2000567, 1.61724, 0, 0.5607843, 1, 1,
0.1881354, -0.7765605, 2.453187, 0, 0.5568628, 1, 1,
0.1885754, 1.702633, -0.610162, 0, 0.5490196, 1, 1,
0.189111, -0.2389509, 3.134764, 0, 0.5450981, 1, 1,
0.1902893, 0.567008, 1.46479, 0, 0.5372549, 1, 1,
0.1996425, 1.737111, -0.3540134, 0, 0.5333334, 1, 1,
0.200087, -0.2123587, 2.238528, 0, 0.5254902, 1, 1,
0.2014511, -0.04714053, 1.491211, 0, 0.5215687, 1, 1,
0.2019295, -0.03655277, 2.056499, 0, 0.5137255, 1, 1,
0.2038164, 2.611803, 0.1878245, 0, 0.509804, 1, 1,
0.2044286, 0.4975341, 0.1394354, 0, 0.5019608, 1, 1,
0.2047705, -0.08789139, 0.9028223, 0, 0.4941176, 1, 1,
0.2068309, -1.13386, 4.229833, 0, 0.4901961, 1, 1,
0.2079183, -0.1036302, 1.221678, 0, 0.4823529, 1, 1,
0.2082067, 0.5923055, -0.1897952, 0, 0.4784314, 1, 1,
0.2096002, 2.338449, 1.244584, 0, 0.4705882, 1, 1,
0.2110023, -0.9937487, 2.578525, 0, 0.4666667, 1, 1,
0.2131369, -1.38966, 2.392063, 0, 0.4588235, 1, 1,
0.2140387, 1.633141, -0.04899516, 0, 0.454902, 1, 1,
0.2170849, -1.062134, 2.732972, 0, 0.4470588, 1, 1,
0.2248166, 1.093405, 0.08650794, 0, 0.4431373, 1, 1,
0.2341036, 0.9232228, 0.3955584, 0, 0.4352941, 1, 1,
0.2398957, -2.289697, 2.53703, 0, 0.4313726, 1, 1,
0.2416268, 2.004426, -0.9781159, 0, 0.4235294, 1, 1,
0.2446291, 1.057929, 0.9077035, 0, 0.4196078, 1, 1,
0.2464299, -1.084423, 1.471192, 0, 0.4117647, 1, 1,
0.2504418, 1.416275, -1.404373, 0, 0.4078431, 1, 1,
0.2517667, -1.556997, 3.194617, 0, 0.4, 1, 1,
0.2533418, 0.6398469, -0.4553536, 0, 0.3921569, 1, 1,
0.2578548, 1.644837, 1.415867, 0, 0.3882353, 1, 1,
0.2636808, -0.6760886, 3.824296, 0, 0.3803922, 1, 1,
0.2686638, 0.1602572, 2.192143, 0, 0.3764706, 1, 1,
0.2696782, 1.525379, 1.747267, 0, 0.3686275, 1, 1,
0.2731904, -0.3538432, 2.013591, 0, 0.3647059, 1, 1,
0.2737558, 0.4331829, 1.364811, 0, 0.3568628, 1, 1,
0.2802733, 0.4037203, 1.485755, 0, 0.3529412, 1, 1,
0.2864145, 1.303305, -1.113092, 0, 0.345098, 1, 1,
0.2873483, 1.05081, 1.20474, 0, 0.3411765, 1, 1,
0.2908211, -0.2630728, 3.436463, 0, 0.3333333, 1, 1,
0.2929587, -0.9112377, 2.156953, 0, 0.3294118, 1, 1,
0.293708, 0.03056279, 0.8984715, 0, 0.3215686, 1, 1,
0.2951806, -1.537415, 2.971721, 0, 0.3176471, 1, 1,
0.2983589, 0.9585853, 1.210045, 0, 0.3098039, 1, 1,
0.3047771, 0.7742921, 0.1233266, 0, 0.3058824, 1, 1,
0.3066126, -0.7732666, 2.452615, 0, 0.2980392, 1, 1,
0.3090975, -1.976227, 4.26489, 0, 0.2901961, 1, 1,
0.3132747, 0.1082086, 0.7893461, 0, 0.2862745, 1, 1,
0.3142416, 1.148925, -1.123436, 0, 0.2784314, 1, 1,
0.318481, -0.2604328, 1.439264, 0, 0.2745098, 1, 1,
0.3214496, 0.472837, -0.2307561, 0, 0.2666667, 1, 1,
0.3220721, 1.353212, 2.017766, 0, 0.2627451, 1, 1,
0.3281368, 2.190131, 0.3031728, 0, 0.254902, 1, 1,
0.3288254, 0.8421361, 1.148521, 0, 0.2509804, 1, 1,
0.3295156, -0.2075037, 1.369384, 0, 0.2431373, 1, 1,
0.3318242, -1.602161, 3.089767, 0, 0.2392157, 1, 1,
0.3323835, 1.421027, -0.2740086, 0, 0.2313726, 1, 1,
0.3325851, 0.500082, 0.2625965, 0, 0.227451, 1, 1,
0.3328064, 1.035565, -0.3283478, 0, 0.2196078, 1, 1,
0.3338066, 1.947191, -0.2614293, 0, 0.2156863, 1, 1,
0.3369568, 0.5817965, 0.04046764, 0, 0.2078431, 1, 1,
0.3420854, -0.09032228, 2.759309, 0, 0.2039216, 1, 1,
0.3430996, 0.7984002, 1.146081, 0, 0.1960784, 1, 1,
0.3486863, 0.2565208, 0.3392854, 0, 0.1882353, 1, 1,
0.3488224, 0.2063543, 1.193647, 0, 0.1843137, 1, 1,
0.3501518, 1.208815, -0.2153539, 0, 0.1764706, 1, 1,
0.3527612, -0.7453461, 2.35457, 0, 0.172549, 1, 1,
0.3544959, -0.06642998, 2.429893, 0, 0.1647059, 1, 1,
0.3546846, -0.9307365, 3.322706, 0, 0.1607843, 1, 1,
0.3577015, -1.021985, 3.921989, 0, 0.1529412, 1, 1,
0.3603138, -0.1281794, 2.59383, 0, 0.1490196, 1, 1,
0.3608599, -0.297691, 0.5976858, 0, 0.1411765, 1, 1,
0.36767, 0.04265019, 2.822278, 0, 0.1372549, 1, 1,
0.3717005, -1.91375, 2.813694, 0, 0.1294118, 1, 1,
0.3729702, 1.792074, 0.07068935, 0, 0.1254902, 1, 1,
0.3787075, -1.615615, 2.130777, 0, 0.1176471, 1, 1,
0.378924, 1.291605, 0.5494657, 0, 0.1137255, 1, 1,
0.3842596, -0.9089434, 3.222668, 0, 0.1058824, 1, 1,
0.3856868, 0.2463219, 0.1122417, 0, 0.09803922, 1, 1,
0.3876813, -0.2142891, 1.910289, 0, 0.09411765, 1, 1,
0.3877831, -0.1943642, 2.845356, 0, 0.08627451, 1, 1,
0.3913125, -0.6325974, 1.974324, 0, 0.08235294, 1, 1,
0.3935474, -1.792947, 3.191407, 0, 0.07450981, 1, 1,
0.3979363, 0.02635322, 0.8940604, 0, 0.07058824, 1, 1,
0.3985577, -0.1804149, 3.436117, 0, 0.0627451, 1, 1,
0.399868, -0.09262336, 0.6014426, 0, 0.05882353, 1, 1,
0.4013461, 0.8108823, 1.327737, 0, 0.05098039, 1, 1,
0.4100272, 1.91038, 3.169958, 0, 0.04705882, 1, 1,
0.4133835, -0.6054574, 4.00618, 0, 0.03921569, 1, 1,
0.4152811, 1.752065, -0.3548674, 0, 0.03529412, 1, 1,
0.4194454, 0.7611977, 0.5731761, 0, 0.02745098, 1, 1,
0.4215638, -0.8953828, 2.105267, 0, 0.02352941, 1, 1,
0.4217523, 0.2031277, 0.1917209, 0, 0.01568628, 1, 1,
0.4223033, 0.3475583, 0.1763581, 0, 0.01176471, 1, 1,
0.4234215, -0.1038707, 1.715128, 0, 0.003921569, 1, 1,
0.4253148, -0.3099004, 1.275903, 0.003921569, 0, 1, 1,
0.4310898, -0.1675549, 0.05508549, 0.007843138, 0, 1, 1,
0.4348617, -0.4885227, 0.9068117, 0.01568628, 0, 1, 1,
0.4387943, 1.305356, 1.274283, 0.01960784, 0, 1, 1,
0.4389458, -0.01941038, 0.5565906, 0.02745098, 0, 1, 1,
0.4393173, -1.58453, 1.806457, 0.03137255, 0, 1, 1,
0.4404199, 0.3232655, 1.140644, 0.03921569, 0, 1, 1,
0.440582, -0.9625393, 2.295135, 0.04313726, 0, 1, 1,
0.4433835, -1.101323, 2.474664, 0.05098039, 0, 1, 1,
0.4456366, -1.758392, 2.484672, 0.05490196, 0, 1, 1,
0.4481953, -0.7606547, 2.622449, 0.0627451, 0, 1, 1,
0.4503649, -0.6479714, 1.991389, 0.06666667, 0, 1, 1,
0.452536, -0.3159985, 3.112185, 0.07450981, 0, 1, 1,
0.4559166, -0.08673071, 2.823198, 0.07843138, 0, 1, 1,
0.4561666, -1.494466, 5.016466, 0.08627451, 0, 1, 1,
0.45835, -1.111954, 0.7417797, 0.09019608, 0, 1, 1,
0.4599417, -0.06283974, -0.9530821, 0.09803922, 0, 1, 1,
0.4605535, 1.589146, 1.324281, 0.1058824, 0, 1, 1,
0.4635467, -0.3464521, 4.487226, 0.1098039, 0, 1, 1,
0.4665444, 2.058414, 2.47264, 0.1176471, 0, 1, 1,
0.4677745, -2.025253, 2.90911, 0.1215686, 0, 1, 1,
0.4680573, 1.466633, 1.248886, 0.1294118, 0, 1, 1,
0.4713589, 1.25996, 0.07035462, 0.1333333, 0, 1, 1,
0.4734854, -0.6428118, 2.070333, 0.1411765, 0, 1, 1,
0.4942363, 0.6951786, -0.8883762, 0.145098, 0, 1, 1,
0.4965924, -1.932035, 2.261761, 0.1529412, 0, 1, 1,
0.5010308, -1.074641, 3.265052, 0.1568628, 0, 1, 1,
0.501278, 1.127573, 0.2320795, 0.1647059, 0, 1, 1,
0.5025509, 1.139029, 1.35013, 0.1686275, 0, 1, 1,
0.5058225, 1.065589, 0.7373677, 0.1764706, 0, 1, 1,
0.5107719, 0.2087366, -0.1473355, 0.1803922, 0, 1, 1,
0.5116048, -0.5945297, 3.313851, 0.1882353, 0, 1, 1,
0.5151699, 0.6286879, 1.518867, 0.1921569, 0, 1, 1,
0.5154592, 1.229999, 1.377667, 0.2, 0, 1, 1,
0.5190725, -1.619327, 4.246727, 0.2078431, 0, 1, 1,
0.5215158, -0.9561575, 2.316529, 0.2117647, 0, 1, 1,
0.5219697, -0.1123385, 1.58729, 0.2196078, 0, 1, 1,
0.5222234, 0.5348981, -0.8842851, 0.2235294, 0, 1, 1,
0.5224249, 0.9372178, 0.52081, 0.2313726, 0, 1, 1,
0.5299587, 0.6829845, 2.534601, 0.2352941, 0, 1, 1,
0.5310996, -0.8593927, 2.251246, 0.2431373, 0, 1, 1,
0.5319439, -0.4529621, 2.405914, 0.2470588, 0, 1, 1,
0.537195, -1.123268, 3.144184, 0.254902, 0, 1, 1,
0.539932, -0.8972313, 0.8988296, 0.2588235, 0, 1, 1,
0.5403729, -0.9969072, 3.152039, 0.2666667, 0, 1, 1,
0.5429784, 0.08095344, 1.825244, 0.2705882, 0, 1, 1,
0.5442748, 1.006531, 1.553342, 0.2784314, 0, 1, 1,
0.5455923, 1.931364, 1.470805, 0.282353, 0, 1, 1,
0.5497912, -1.0477, 3.368328, 0.2901961, 0, 1, 1,
0.5538085, 0.3932587, -0.9158121, 0.2941177, 0, 1, 1,
0.5541005, 0.5732172, 1.105542, 0.3019608, 0, 1, 1,
0.5564781, 0.7614027, 1.480011, 0.3098039, 0, 1, 1,
0.559416, -0.1168681, 2.809509, 0.3137255, 0, 1, 1,
0.5625988, -0.08349878, 3.493695, 0.3215686, 0, 1, 1,
0.5641702, -0.1906015, 2.113264, 0.3254902, 0, 1, 1,
0.5677012, 0.4717074, 1.441511, 0.3333333, 0, 1, 1,
0.5698378, -0.8140011, 2.523573, 0.3372549, 0, 1, 1,
0.5771499, 0.216793, 0.4279227, 0.345098, 0, 1, 1,
0.5845443, 0.01836612, 1.007071, 0.3490196, 0, 1, 1,
0.590333, -0.7129555, 1.524123, 0.3568628, 0, 1, 1,
0.5962404, -2.86004, 3.234743, 0.3607843, 0, 1, 1,
0.5975298, 0.843274, 0.3345812, 0.3686275, 0, 1, 1,
0.5976496, 0.06928944, 0.9344229, 0.372549, 0, 1, 1,
0.606757, -1.334942, 2.535594, 0.3803922, 0, 1, 1,
0.6072798, -0.531195, 2.744945, 0.3843137, 0, 1, 1,
0.6083114, 0.3296399, 0.5002828, 0.3921569, 0, 1, 1,
0.6134277, -1.161024, 3.17742, 0.3960784, 0, 1, 1,
0.6227216, -0.1302284, 1.207956, 0.4039216, 0, 1, 1,
0.6286631, 0.7461218, 0.8126804, 0.4117647, 0, 1, 1,
0.6303497, -0.6790178, 1.374522, 0.4156863, 0, 1, 1,
0.6378155, 0.07607545, 1.836891, 0.4235294, 0, 1, 1,
0.6414661, 0.5032641, 1.207239, 0.427451, 0, 1, 1,
0.6446269, 0.5735822, -0.293826, 0.4352941, 0, 1, 1,
0.6497497, -1.443126, 3.02705, 0.4392157, 0, 1, 1,
0.651763, -0.5262734, 1.658213, 0.4470588, 0, 1, 1,
0.6589102, -0.1049574, 1.733695, 0.4509804, 0, 1, 1,
0.6620878, 0.6563464, 0.5559671, 0.4588235, 0, 1, 1,
0.663002, -1.327833, 2.509263, 0.4627451, 0, 1, 1,
0.6636006, 1.066703, 0.4643432, 0.4705882, 0, 1, 1,
0.6658785, 0.9727864, -0.20066, 0.4745098, 0, 1, 1,
0.6667505, 1.651283, 0.09855016, 0.4823529, 0, 1, 1,
0.6699339, -0.1880447, 1.536874, 0.4862745, 0, 1, 1,
0.6721281, 1.359257, 0.9822204, 0.4941176, 0, 1, 1,
0.6734948, 0.3063082, 3.096047, 0.5019608, 0, 1, 1,
0.6744925, 1.655114, 0.3024575, 0.5058824, 0, 1, 1,
0.67641, -0.196598, 1.131009, 0.5137255, 0, 1, 1,
0.6771996, 1.37026, 0.9061144, 0.5176471, 0, 1, 1,
0.6773921, -1.002617, 2.645176, 0.5254902, 0, 1, 1,
0.677448, -0.2306095, 3.02035, 0.5294118, 0, 1, 1,
0.6859148, -0.2470376, 2.584125, 0.5372549, 0, 1, 1,
0.6936924, -0.339649, 1.760233, 0.5411765, 0, 1, 1,
0.6938655, 1.396398, 0.2718318, 0.5490196, 0, 1, 1,
0.6969995, 1.156726, 0.4768559, 0.5529412, 0, 1, 1,
0.6983132, -0.1079733, 3.073061, 0.5607843, 0, 1, 1,
0.6997028, 1.305933, 1.25626, 0.5647059, 0, 1, 1,
0.7039613, -1.329255, 3.866815, 0.572549, 0, 1, 1,
0.704492, -1.87454, 2.195821, 0.5764706, 0, 1, 1,
0.7055258, 0.3006772, 0.9403957, 0.5843138, 0, 1, 1,
0.7069984, -1.519764, 3.949129, 0.5882353, 0, 1, 1,
0.7195285, 2.806606, 2.842106, 0.5960785, 0, 1, 1,
0.7205588, 1.533546, 0.3017507, 0.6039216, 0, 1, 1,
0.7254153, -0.03701036, 0.5643027, 0.6078432, 0, 1, 1,
0.7264946, -2.545955, 1.409119, 0.6156863, 0, 1, 1,
0.7332093, -1.303218, 0.3040168, 0.6196079, 0, 1, 1,
0.7350468, -0.8431775, 1.591977, 0.627451, 0, 1, 1,
0.7353395, -2.571415, 2.306957, 0.6313726, 0, 1, 1,
0.7372856, -0.7226224, 2.637035, 0.6392157, 0, 1, 1,
0.7390845, -2.865777, 2.224584, 0.6431373, 0, 1, 1,
0.7431564, -1.980276, 0.4296295, 0.6509804, 0, 1, 1,
0.7462288, 1.084111, 0.8594704, 0.654902, 0, 1, 1,
0.7501572, 0.521321, 0.2035396, 0.6627451, 0, 1, 1,
0.7528899, -1.884987, 3.014766, 0.6666667, 0, 1, 1,
0.7563772, 0.6268489, 0.9915993, 0.6745098, 0, 1, 1,
0.7621758, -1.13517, 1.451235, 0.6784314, 0, 1, 1,
0.7658479, -0.2020519, 1.762487, 0.6862745, 0, 1, 1,
0.7681915, 1.260262, 0.05215919, 0.6901961, 0, 1, 1,
0.7925423, -1.52723, 0.9681635, 0.6980392, 0, 1, 1,
0.7932784, 1.513355, 0.66414, 0.7058824, 0, 1, 1,
0.7965356, 0.5276219, 1.654123, 0.7098039, 0, 1, 1,
0.7970624, 1.600074, 0.7548043, 0.7176471, 0, 1, 1,
0.8030522, 1.709044, 0.09679012, 0.7215686, 0, 1, 1,
0.8074266, 1.462681, -0.8074293, 0.7294118, 0, 1, 1,
0.8081583, -0.1101404, 1.305737, 0.7333333, 0, 1, 1,
0.8084976, -0.4304336, -0.200469, 0.7411765, 0, 1, 1,
0.8120788, -1.114741, 2.879932, 0.7450981, 0, 1, 1,
0.8161288, 0.5066054, -0.07133278, 0.7529412, 0, 1, 1,
0.8234159, 2.178102, -0.2987748, 0.7568628, 0, 1, 1,
0.8313096, 0.6205184, 0.9246693, 0.7647059, 0, 1, 1,
0.8313271, 1.665472, -1.475067, 0.7686275, 0, 1, 1,
0.8430064, -2.008278, 1.314118, 0.7764706, 0, 1, 1,
0.8460149, 0.5761789, 0.4473519, 0.7803922, 0, 1, 1,
0.8462448, 1.109531, 1.819121, 0.7882353, 0, 1, 1,
0.8502952, 0.2020449, 0.5735728, 0.7921569, 0, 1, 1,
0.8517742, 0.2295133, 0.2304848, 0.8, 0, 1, 1,
0.8612555, 0.6494299, 0.4823685, 0.8078431, 0, 1, 1,
0.871591, 0.5235699, 2.026509, 0.8117647, 0, 1, 1,
0.8750178, 1.119237, 1.83847, 0.8196079, 0, 1, 1,
0.8750383, -0.6649925, 2.620797, 0.8235294, 0, 1, 1,
0.8758092, 0.3888732, 1.015942, 0.8313726, 0, 1, 1,
0.8760639, 1.019043, 0.08783934, 0.8352941, 0, 1, 1,
0.8839264, -0.6964428, 1.665265, 0.8431373, 0, 1, 1,
0.8844622, -1.236724, 1.749355, 0.8470588, 0, 1, 1,
0.8893278, -0.4079156, 1.806659, 0.854902, 0, 1, 1,
0.8894143, 1.426389, 1.684227, 0.8588235, 0, 1, 1,
0.8924779, 0.1906369, 1.105675, 0.8666667, 0, 1, 1,
0.8970648, -0.4944284, 2.254093, 0.8705882, 0, 1, 1,
0.9009167, -0.2143418, 1.206564, 0.8784314, 0, 1, 1,
0.9071212, 0.5185921, 1.002609, 0.8823529, 0, 1, 1,
0.9129483, 1.080503, 0.8576028, 0.8901961, 0, 1, 1,
0.9212454, 0.3998093, 0.5952895, 0.8941177, 0, 1, 1,
0.9269525, -0.7975056, 2.742777, 0.9019608, 0, 1, 1,
0.9291202, 0.792006, 0.863749, 0.9098039, 0, 1, 1,
0.9308816, 0.3546981, 1.028492, 0.9137255, 0, 1, 1,
0.941756, -0.2827417, 0.4898238, 0.9215686, 0, 1, 1,
0.9422308, -0.09806245, 3.230244, 0.9254902, 0, 1, 1,
0.9424929, 0.779002, -1.679546, 0.9333333, 0, 1, 1,
0.9446244, 0.7507969, 2.934582, 0.9372549, 0, 1, 1,
0.9523103, 0.9383861, 1.776613, 0.945098, 0, 1, 1,
0.9529022, -0.8518357, 1.80009, 0.9490196, 0, 1, 1,
0.953656, 0.3759878, -0.07777841, 0.9568627, 0, 1, 1,
0.9633048, -0.05485233, 0.5367914, 0.9607843, 0, 1, 1,
0.9768643, 0.2135135, 1.321757, 0.9686275, 0, 1, 1,
0.982206, 0.004545592, -0.5372186, 0.972549, 0, 1, 1,
0.9840103, -0.008104747, 0.8055081, 0.9803922, 0, 1, 1,
0.9916189, -0.8679671, 3.177435, 0.9843137, 0, 1, 1,
0.9931955, -1.273574, 4.012814, 0.9921569, 0, 1, 1,
0.9944127, -1.07348, 3.001568, 0.9960784, 0, 1, 1,
0.9954775, 0.3791898, 2.969833, 1, 0, 0.9960784, 1,
1.000569, 0.62865, 1.732009, 1, 0, 0.9882353, 1,
1.003544, -1.171304, 3.776596, 1, 0, 0.9843137, 1,
1.005195, -0.3505187, 2.09813, 1, 0, 0.9764706, 1,
1.006491, 0.9915656, -0.4509333, 1, 0, 0.972549, 1,
1.012323, -0.1396674, 0.076314, 1, 0, 0.9647059, 1,
1.015163, -0.06602346, 2.549976, 1, 0, 0.9607843, 1,
1.016056, -1.542313, 2.65997, 1, 0, 0.9529412, 1,
1.017924, 1.589255, 0.9255434, 1, 0, 0.9490196, 1,
1.018085, 1.196743, -0.05924532, 1, 0, 0.9411765, 1,
1.022287, -0.1053839, 1.263221, 1, 0, 0.9372549, 1,
1.025373, -0.3185655, 1.29167, 1, 0, 0.9294118, 1,
1.03602, 1.249543, 1.155295, 1, 0, 0.9254902, 1,
1.04124, 0.8606623, 1.418399, 1, 0, 0.9176471, 1,
1.046751, -0.31284, 3.949272, 1, 0, 0.9137255, 1,
1.0482, 0.8287301, 1.629729, 1, 0, 0.9058824, 1,
1.055836, -1.051094, 3.158331, 1, 0, 0.9019608, 1,
1.061856, -1.316603, 3.039176, 1, 0, 0.8941177, 1,
1.062067, 1.436699, 0.01255117, 1, 0, 0.8862745, 1,
1.06302, -0.2975118, 2.685794, 1, 0, 0.8823529, 1,
1.063632, 0.7772554, 0.4697731, 1, 0, 0.8745098, 1,
1.06469, 0.7206248, 1.16036, 1, 0, 0.8705882, 1,
1.065362, 2.244016, 1.214547, 1, 0, 0.8627451, 1,
1.066718, 1.530831, 0.5320649, 1, 0, 0.8588235, 1,
1.071918, -1.346132, 1.326686, 1, 0, 0.8509804, 1,
1.074107, -0.702845, 1.565847, 1, 0, 0.8470588, 1,
1.08248, 1.264627, 0.360875, 1, 0, 0.8392157, 1,
1.082736, -0.1433862, 2.130095, 1, 0, 0.8352941, 1,
1.083019, 0.989803, 1.355322, 1, 0, 0.827451, 1,
1.084178, -0.2997642, 1.860595, 1, 0, 0.8235294, 1,
1.084326, 0.9272591, 1.222802, 1, 0, 0.8156863, 1,
1.08917, 1.570717, 1.362123, 1, 0, 0.8117647, 1,
1.089837, -0.57013, 3.010471, 1, 0, 0.8039216, 1,
1.096232, -0.6879269, 2.281846, 1, 0, 0.7960784, 1,
1.102678, -0.1385412, 4.002689, 1, 0, 0.7921569, 1,
1.104695, 0.3509198, 1.151908, 1, 0, 0.7843137, 1,
1.112803, -1.298155, 0.4842246, 1, 0, 0.7803922, 1,
1.113438, 1.166851, 0.338179, 1, 0, 0.772549, 1,
1.113477, -0.5248433, 2.201562, 1, 0, 0.7686275, 1,
1.118518, 1.013423, -0.4071433, 1, 0, 0.7607843, 1,
1.126424, 1.028531, 0.8104481, 1, 0, 0.7568628, 1,
1.131973, -0.1838514, 1.802099, 1, 0, 0.7490196, 1,
1.140118, 0.589434, -0.7870215, 1, 0, 0.7450981, 1,
1.14243, 1.789173, 1.816426, 1, 0, 0.7372549, 1,
1.144215, -0.8240703, 1.549759, 1, 0, 0.7333333, 1,
1.146046, -1.16248, 3.651344, 1, 0, 0.7254902, 1,
1.147343, 2.239984, 1.432258, 1, 0, 0.7215686, 1,
1.148831, -0.138883, 0.2306092, 1, 0, 0.7137255, 1,
1.150275, 0.4630202, 1.19976, 1, 0, 0.7098039, 1,
1.151848, -0.231658, 1.592184, 1, 0, 0.7019608, 1,
1.160155, 0.4289289, 0.5367287, 1, 0, 0.6941177, 1,
1.169364, 2.525657, 0.1023417, 1, 0, 0.6901961, 1,
1.17024, -0.01432792, 1.888484, 1, 0, 0.682353, 1,
1.170377, -0.082021, 1.930454, 1, 0, 0.6784314, 1,
1.171019, -1.277124, 2.992748, 1, 0, 0.6705883, 1,
1.173951, -0.003547732, 1.273233, 1, 0, 0.6666667, 1,
1.176736, 0.553541, 2.009165, 1, 0, 0.6588235, 1,
1.198538, -0.2263782, 1.066896, 1, 0, 0.654902, 1,
1.20484, 0.8527229, 1.011995, 1, 0, 0.6470588, 1,
1.206483, 1.09386, 3.089236, 1, 0, 0.6431373, 1,
1.212246, 0.4144163, 2.242399, 1, 0, 0.6352941, 1,
1.215382, 0.04238174, 2.243829, 1, 0, 0.6313726, 1,
1.233307, -0.3533202, 2.725976, 1, 0, 0.6235294, 1,
1.236893, -0.8435169, 3.302863, 1, 0, 0.6196079, 1,
1.241067, -1.23641, 2.1472, 1, 0, 0.6117647, 1,
1.252786, -0.4009849, 1.881918, 1, 0, 0.6078432, 1,
1.258176, -0.7309946, 2.851896, 1, 0, 0.6, 1,
1.273914, 0.0408045, 1.162297, 1, 0, 0.5921569, 1,
1.280634, -1.119304, 3.439709, 1, 0, 0.5882353, 1,
1.285669, 1.058311, 1.128015, 1, 0, 0.5803922, 1,
1.287297, 0.2766152, -0.2797783, 1, 0, 0.5764706, 1,
1.294093, -0.8815212, 2.609037, 1, 0, 0.5686275, 1,
1.299235, -1.352446, 1.148774, 1, 0, 0.5647059, 1,
1.306083, 1.715147, 0.8450693, 1, 0, 0.5568628, 1,
1.320791, -0.3776297, 1.338488, 1, 0, 0.5529412, 1,
1.322711, -0.9783552, 0.9379031, 1, 0, 0.5450981, 1,
1.338111, 0.8713401, 0.6076916, 1, 0, 0.5411765, 1,
1.343362, -0.09682214, 0.1594993, 1, 0, 0.5333334, 1,
1.347171, -0.7720885, 1.230425, 1, 0, 0.5294118, 1,
1.347678, -1.442479, 2.277012, 1, 0, 0.5215687, 1,
1.34985, 0.2116626, 2.249539, 1, 0, 0.5176471, 1,
1.359729, 1.347717, 0.9232499, 1, 0, 0.509804, 1,
1.359846, 0.2370087, 1.354476, 1, 0, 0.5058824, 1,
1.360356, -0.3187119, -0.01895509, 1, 0, 0.4980392, 1,
1.362772, -0.005567506, 1.604234, 1, 0, 0.4901961, 1,
1.362988, 2.000875, 1.398289, 1, 0, 0.4862745, 1,
1.369007, 1.171615, -0.02032751, 1, 0, 0.4784314, 1,
1.376809, 0.9044628, 0.8680308, 1, 0, 0.4745098, 1,
1.387239, 0.5477986, 0.418045, 1, 0, 0.4666667, 1,
1.393145, 1.235646, 1.648554, 1, 0, 0.4627451, 1,
1.396191, 0.4817854, 1.517665, 1, 0, 0.454902, 1,
1.404243, 0.09160072, 3.794141, 1, 0, 0.4509804, 1,
1.445449, -0.2111881, 2.516988, 1, 0, 0.4431373, 1,
1.447192, 0.07853533, 1.485085, 1, 0, 0.4392157, 1,
1.451523, -1.209157, 1.011519, 1, 0, 0.4313726, 1,
1.459429, 2.262206, 0.4391719, 1, 0, 0.427451, 1,
1.47203, 2.046775, 0.5018845, 1, 0, 0.4196078, 1,
1.474909, -1.269672, 3.359901, 1, 0, 0.4156863, 1,
1.485548, 1.269269, 2.010092, 1, 0, 0.4078431, 1,
1.494807, 0.8151845, 3.112715, 1, 0, 0.4039216, 1,
1.503997, -0.0363405, 1.793715, 1, 0, 0.3960784, 1,
1.509701, 0.01058639, 0.9406079, 1, 0, 0.3882353, 1,
1.513992, 0.6864471, 1.244088, 1, 0, 0.3843137, 1,
1.516826, 0.4685228, 0.6369238, 1, 0, 0.3764706, 1,
1.528744, -1.286164, 2.869575, 1, 0, 0.372549, 1,
1.528875, -1.227851, 1.53719, 1, 0, 0.3647059, 1,
1.539274, -0.508505, 2.699142, 1, 0, 0.3607843, 1,
1.554331, 1.761641, 0.8302487, 1, 0, 0.3529412, 1,
1.570425, 0.916091, 1.248492, 1, 0, 0.3490196, 1,
1.578557, -1.775427, 2.188797, 1, 0, 0.3411765, 1,
1.579372, -0.7448746, 3.138806, 1, 0, 0.3372549, 1,
1.591954, 0.3515034, 2.406065, 1, 0, 0.3294118, 1,
1.597643, 0.260187, 2.490697, 1, 0, 0.3254902, 1,
1.619247, -0.3705362, 1.816052, 1, 0, 0.3176471, 1,
1.633646, 0.5924977, 0.4430819, 1, 0, 0.3137255, 1,
1.63397, -0.9724134, 2.85064, 1, 0, 0.3058824, 1,
1.634581, 0.2053948, 2.794314, 1, 0, 0.2980392, 1,
1.661092, 2.401938, 0.3137892, 1, 0, 0.2941177, 1,
1.663256, -0.5904025, 1.699535, 1, 0, 0.2862745, 1,
1.712998, -0.8689796, 3.570619, 1, 0, 0.282353, 1,
1.723617, 0.703119, -0.3511533, 1, 0, 0.2745098, 1,
1.730179, -0.4010811, 2.263392, 1, 0, 0.2705882, 1,
1.740839, 0.4852301, 3.181243, 1, 0, 0.2627451, 1,
1.741134, -1.203324, 0.8447297, 1, 0, 0.2588235, 1,
1.75623, 1.226309, 0.7036481, 1, 0, 0.2509804, 1,
1.762903, 0.5177671, 2.859114, 1, 0, 0.2470588, 1,
1.779433, 0.1539034, 1.214275, 1, 0, 0.2392157, 1,
1.779831, 0.9927565, 2.122725, 1, 0, 0.2352941, 1,
1.803997, -0.5427006, 2.79782, 1, 0, 0.227451, 1,
1.805604, 0.8795873, 0.2195666, 1, 0, 0.2235294, 1,
1.819447, -0.06665548, 2.629671, 1, 0, 0.2156863, 1,
1.846299, -0.6634582, 2.625515, 1, 0, 0.2117647, 1,
1.876966, -0.1938286, 1.839436, 1, 0, 0.2039216, 1,
1.889573, -0.9718925, 1.991229, 1, 0, 0.1960784, 1,
1.889786, -0.9243835, 2.491068, 1, 0, 0.1921569, 1,
1.93172, -0.6630449, 3.189084, 1, 0, 0.1843137, 1,
1.953622, -0.4908807, 2.726388, 1, 0, 0.1803922, 1,
1.965474, -0.8579114, 1.56996, 1, 0, 0.172549, 1,
1.974377, -1.076739, 0.7656679, 1, 0, 0.1686275, 1,
1.996814, 1.786795, 1.206972, 1, 0, 0.1607843, 1,
2.008349, -0.1766633, 1.063347, 1, 0, 0.1568628, 1,
2.040859, -0.4691818, 2.585002, 1, 0, 0.1490196, 1,
2.053844, -0.1007946, 2.964202, 1, 0, 0.145098, 1,
2.063774, 1.098639, -0.2155003, 1, 0, 0.1372549, 1,
2.085289, 0.1531405, 2.196536, 1, 0, 0.1333333, 1,
2.093174, -0.7410212, 1.377117, 1, 0, 0.1254902, 1,
2.106406, 0.1699768, 0.3139816, 1, 0, 0.1215686, 1,
2.112866, -1.173742, 2.588614, 1, 0, 0.1137255, 1,
2.135613, -0.05307579, 0.4840945, 1, 0, 0.1098039, 1,
2.169434, -1.024292, 2.39239, 1, 0, 0.1019608, 1,
2.201404, 0.5391253, -0.5095899, 1, 0, 0.09411765, 1,
2.221878, 0.3033949, -0.06875844, 1, 0, 0.09019608, 1,
2.251508, 0.217538, 1.199824, 1, 0, 0.08235294, 1,
2.267717, 1.715304, 1.563627, 1, 0, 0.07843138, 1,
2.379289, 0.5735902, 0.1671436, 1, 0, 0.07058824, 1,
2.416383, -0.315981, 3.310816, 1, 0, 0.06666667, 1,
2.486382, -0.8681644, 2.356573, 1, 0, 0.05882353, 1,
2.502007, -0.3410756, 1.554764, 1, 0, 0.05490196, 1,
2.507605, -0.8573897, 1.756713, 1, 0, 0.04705882, 1,
2.606681, -0.606671, 2.149568, 1, 0, 0.04313726, 1,
2.748649, -1.494928, 3.723423, 1, 0, 0.03529412, 1,
2.754758, -1.093283, 3.310222, 1, 0, 0.03137255, 1,
2.780913, 0.4974892, 0.07908124, 1, 0, 0.02352941, 1,
2.781384, -1.202573, 1.796886, 1, 0, 0.01960784, 1,
2.972655, -0.889777, 0.09160917, 1, 0, 0.01176471, 1,
3.113811, 0.2617076, 2.433434, 1, 0, 0.007843138, 1
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
0.07395053, -3.915732, -7.462877, 0, -0.5, 0.5, 0.5,
0.07395053, -3.915732, -7.462877, 1, -0.5, 0.5, 0.5,
0.07395053, -3.915732, -7.462877, 1, 1.5, 0.5, 0.5,
0.07395053, -3.915732, -7.462877, 0, 1.5, 0.5, 0.5
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
-3.996422, 0.03776348, -7.462877, 0, -0.5, 0.5, 0.5,
-3.996422, 0.03776348, -7.462877, 1, -0.5, 0.5, 0.5,
-3.996422, 0.03776348, -7.462877, 1, 1.5, 0.5, 0.5,
-3.996422, 0.03776348, -7.462877, 0, 1.5, 0.5, 0.5
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
-3.996422, -3.915732, -0.318867, 0, -0.5, 0.5, 0.5,
-3.996422, -3.915732, -0.318867, 1, -0.5, 0.5, 0.5,
-3.996422, -3.915732, -0.318867, 1, 1.5, 0.5, 0.5,
-3.996422, -3.915732, -0.318867, 0, 1.5, 0.5, 0.5
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
-2, -3.003387, -5.81426,
3, -3.003387, -5.81426,
-2, -3.003387, -5.81426,
-2, -3.155444, -6.089029,
-1, -3.003387, -5.81426,
-1, -3.155444, -6.089029,
0, -3.003387, -5.81426,
0, -3.155444, -6.089029,
1, -3.003387, -5.81426,
1, -3.155444, -6.089029,
2, -3.003387, -5.81426,
2, -3.155444, -6.089029,
3, -3.003387, -5.81426,
3, -3.155444, -6.089029
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
-2, -3.459559, -6.638568, 0, -0.5, 0.5, 0.5,
-2, -3.459559, -6.638568, 1, -0.5, 0.5, 0.5,
-2, -3.459559, -6.638568, 1, 1.5, 0.5, 0.5,
-2, -3.459559, -6.638568, 0, 1.5, 0.5, 0.5,
-1, -3.459559, -6.638568, 0, -0.5, 0.5, 0.5,
-1, -3.459559, -6.638568, 1, -0.5, 0.5, 0.5,
-1, -3.459559, -6.638568, 1, 1.5, 0.5, 0.5,
-1, -3.459559, -6.638568, 0, 1.5, 0.5, 0.5,
0, -3.459559, -6.638568, 0, -0.5, 0.5, 0.5,
0, -3.459559, -6.638568, 1, -0.5, 0.5, 0.5,
0, -3.459559, -6.638568, 1, 1.5, 0.5, 0.5,
0, -3.459559, -6.638568, 0, 1.5, 0.5, 0.5,
1, -3.459559, -6.638568, 0, -0.5, 0.5, 0.5,
1, -3.459559, -6.638568, 1, -0.5, 0.5, 0.5,
1, -3.459559, -6.638568, 1, 1.5, 0.5, 0.5,
1, -3.459559, -6.638568, 0, 1.5, 0.5, 0.5,
2, -3.459559, -6.638568, 0, -0.5, 0.5, 0.5,
2, -3.459559, -6.638568, 1, -0.5, 0.5, 0.5,
2, -3.459559, -6.638568, 1, 1.5, 0.5, 0.5,
2, -3.459559, -6.638568, 0, 1.5, 0.5, 0.5,
3, -3.459559, -6.638568, 0, -0.5, 0.5, 0.5,
3, -3.459559, -6.638568, 1, -0.5, 0.5, 0.5,
3, -3.459559, -6.638568, 1, 1.5, 0.5, 0.5,
3, -3.459559, -6.638568, 0, 1.5, 0.5, 0.5
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
-3.057106, -2, -5.81426,
-3.057106, 2, -5.81426,
-3.057106, -2, -5.81426,
-3.213658, -2, -6.089029,
-3.057106, -1, -5.81426,
-3.213658, -1, -6.089029,
-3.057106, 0, -5.81426,
-3.213658, 0, -6.089029,
-3.057106, 1, -5.81426,
-3.213658, 1, -6.089029,
-3.057106, 2, -5.81426,
-3.213658, 2, -6.089029
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
-3.526764, -2, -6.638568, 0, -0.5, 0.5, 0.5,
-3.526764, -2, -6.638568, 1, -0.5, 0.5, 0.5,
-3.526764, -2, -6.638568, 1, 1.5, 0.5, 0.5,
-3.526764, -2, -6.638568, 0, 1.5, 0.5, 0.5,
-3.526764, -1, -6.638568, 0, -0.5, 0.5, 0.5,
-3.526764, -1, -6.638568, 1, -0.5, 0.5, 0.5,
-3.526764, -1, -6.638568, 1, 1.5, 0.5, 0.5,
-3.526764, -1, -6.638568, 0, 1.5, 0.5, 0.5,
-3.526764, 0, -6.638568, 0, -0.5, 0.5, 0.5,
-3.526764, 0, -6.638568, 1, -0.5, 0.5, 0.5,
-3.526764, 0, -6.638568, 1, 1.5, 0.5, 0.5,
-3.526764, 0, -6.638568, 0, 1.5, 0.5, 0.5,
-3.526764, 1, -6.638568, 0, -0.5, 0.5, 0.5,
-3.526764, 1, -6.638568, 1, -0.5, 0.5, 0.5,
-3.526764, 1, -6.638568, 1, 1.5, 0.5, 0.5,
-3.526764, 1, -6.638568, 0, 1.5, 0.5, 0.5,
-3.526764, 2, -6.638568, 0, -0.5, 0.5, 0.5,
-3.526764, 2, -6.638568, 1, -0.5, 0.5, 0.5,
-3.526764, 2, -6.638568, 1, 1.5, 0.5, 0.5,
-3.526764, 2, -6.638568, 0, 1.5, 0.5, 0.5
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
-3.057106, -3.003387, -4,
-3.057106, -3.003387, 4,
-3.057106, -3.003387, -4,
-3.213658, -3.155444, -4,
-3.057106, -3.003387, -2,
-3.213658, -3.155444, -2,
-3.057106, -3.003387, 0,
-3.213658, -3.155444, 0,
-3.057106, -3.003387, 2,
-3.213658, -3.155444, 2,
-3.057106, -3.003387, 4,
-3.213658, -3.155444, 4
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
-3.526764, -3.459559, -4, 0, -0.5, 0.5, 0.5,
-3.526764, -3.459559, -4, 1, -0.5, 0.5, 0.5,
-3.526764, -3.459559, -4, 1, 1.5, 0.5, 0.5,
-3.526764, -3.459559, -4, 0, 1.5, 0.5, 0.5,
-3.526764, -3.459559, -2, 0, -0.5, 0.5, 0.5,
-3.526764, -3.459559, -2, 1, -0.5, 0.5, 0.5,
-3.526764, -3.459559, -2, 1, 1.5, 0.5, 0.5,
-3.526764, -3.459559, -2, 0, 1.5, 0.5, 0.5,
-3.526764, -3.459559, 0, 0, -0.5, 0.5, 0.5,
-3.526764, -3.459559, 0, 1, -0.5, 0.5, 0.5,
-3.526764, -3.459559, 0, 1, 1.5, 0.5, 0.5,
-3.526764, -3.459559, 0, 0, 1.5, 0.5, 0.5,
-3.526764, -3.459559, 2, 0, -0.5, 0.5, 0.5,
-3.526764, -3.459559, 2, 1, -0.5, 0.5, 0.5,
-3.526764, -3.459559, 2, 1, 1.5, 0.5, 0.5,
-3.526764, -3.459559, 2, 0, 1.5, 0.5, 0.5,
-3.526764, -3.459559, 4, 0, -0.5, 0.5, 0.5,
-3.526764, -3.459559, 4, 1, -0.5, 0.5, 0.5,
-3.526764, -3.459559, 4, 1, 1.5, 0.5, 0.5,
-3.526764, -3.459559, 4, 0, 1.5, 0.5, 0.5
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
-3.057106, -3.003387, -5.81426,
-3.057106, 3.078914, -5.81426,
-3.057106, -3.003387, 5.176526,
-3.057106, 3.078914, 5.176526,
-3.057106, -3.003387, -5.81426,
-3.057106, -3.003387, 5.176526,
-3.057106, 3.078914, -5.81426,
-3.057106, 3.078914, 5.176526,
-3.057106, -3.003387, -5.81426,
3.205007, -3.003387, -5.81426,
-3.057106, -3.003387, 5.176526,
3.205007, -3.003387, 5.176526,
-3.057106, 3.078914, -5.81426,
3.205007, 3.078914, -5.81426,
-3.057106, 3.078914, 5.176526,
3.205007, 3.078914, 5.176526,
3.205007, -3.003387, -5.81426,
3.205007, 3.078914, -5.81426,
3.205007, -3.003387, 5.176526,
3.205007, 3.078914, 5.176526,
3.205007, -3.003387, -5.81426,
3.205007, -3.003387, 5.176526,
3.205007, 3.078914, -5.81426,
3.205007, 3.078914, 5.176526
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
var radius = 7.494885;
var distance = 33.34559;
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
mvMatrix.translate( -0.07395053, -0.03776348, 0.318867 );
mvMatrix.scale( 1.294071, 1.332327, 0.7373101 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.34559);
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
princep<-read.table("princep.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-princep$V2
```

```
## Error in eval(expr, envir, enclos): object 'princep' not found
```

```r
y<-princep$V3
```

```
## Error in eval(expr, envir, enclos): object 'princep' not found
```

```r
z<-princep$V4
```

```
## Error in eval(expr, envir, enclos): object 'princep' not found
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
-2.96591, -0.3217037, -0.6059285, 0, 0, 1, 1, 1,
-2.963468, -0.6124514, -1.106422, 1, 0, 0, 1, 1,
-2.814013, 0.6472625, 0.4138867, 1, 0, 0, 1, 1,
-2.788254, 1.246211, -1.032862, 1, 0, 0, 1, 1,
-2.669161, -0.2303075, 0.1787651, 1, 0, 0, 1, 1,
-2.549483, 1.245284, -0.7715983, 1, 0, 0, 1, 1,
-2.464236, 0.9276328, -2.486697, 0, 0, 0, 1, 1,
-2.456836, -0.7139978, -2.500102, 0, 0, 0, 1, 1,
-2.446591, 0.467876, 0.7077045, 0, 0, 0, 1, 1,
-2.425636, -0.3124464, -0.1181643, 0, 0, 0, 1, 1,
-2.420033, -0.4835337, -2.111864, 0, 0, 0, 1, 1,
-2.411374, -0.6944925, -1.427981, 0, 0, 0, 1, 1,
-2.397677, 0.4002596, -0.6022602, 0, 0, 0, 1, 1,
-2.325923, -0.1095288, -2.199805, 1, 1, 1, 1, 1,
-2.312391, 0.1466088, -0.2385039, 1, 1, 1, 1, 1,
-2.227788, -1.207082, -3.314896, 1, 1, 1, 1, 1,
-2.177722, -2.243249, -3.874344, 1, 1, 1, 1, 1,
-2.151095, 0.5339095, 1.347648, 1, 1, 1, 1, 1,
-2.143082, 0.2700702, -1.436476, 1, 1, 1, 1, 1,
-2.126615, 0.6052739, -2.285789, 1, 1, 1, 1, 1,
-2.07554, 0.147789, -2.013878, 1, 1, 1, 1, 1,
-2.052191, -1.17994, -2.967387, 1, 1, 1, 1, 1,
-2.015904, -0.4534287, -2.444959, 1, 1, 1, 1, 1,
-2.010914, 0.9451253, -0.6078333, 1, 1, 1, 1, 1,
-1.917687, -0.1396257, -2.674666, 1, 1, 1, 1, 1,
-1.917311, -2.595216, -2.258205, 1, 1, 1, 1, 1,
-1.900705, -0.3620754, -0.5740406, 1, 1, 1, 1, 1,
-1.892071, 0.277631, -1.266278, 1, 1, 1, 1, 1,
-1.867057, 0.909583, -2.288514, 0, 0, 1, 1, 1,
-1.86376, -0.3721413, -1.612057, 1, 0, 0, 1, 1,
-1.862926, 2.611616, 0.2716616, 1, 0, 0, 1, 1,
-1.851801, -0.03845263, -0.2959564, 1, 0, 0, 1, 1,
-1.837251, -2.044585, -1.092723, 1, 0, 0, 1, 1,
-1.830276, -1.006496, -1.607459, 1, 0, 0, 1, 1,
-1.827182, 1.654245, 0.3398488, 0, 0, 0, 1, 1,
-1.818979, -1.316045, -2.846593, 0, 0, 0, 1, 1,
-1.81547, -0.8951901, -0.7969529, 0, 0, 0, 1, 1,
-1.779636, -0.136607, 0.299368, 0, 0, 0, 1, 1,
-1.765397, 0.7374101, 0.2938634, 0, 0, 0, 1, 1,
-1.759379, -0.8178874, -0.462191, 0, 0, 0, 1, 1,
-1.750387, 1.178985, -1.400338, 0, 0, 0, 1, 1,
-1.74474, 0.212587, -0.725583, 1, 1, 1, 1, 1,
-1.735298, 0.1421686, -2.349593, 1, 1, 1, 1, 1,
-1.72414, 1.132048, -1.828006, 1, 1, 1, 1, 1,
-1.704108, -0.5768741, -0.658004, 1, 1, 1, 1, 1,
-1.701191, -0.08643111, -1.091348, 1, 1, 1, 1, 1,
-1.698926, -0.02305997, 0.1941388, 1, 1, 1, 1, 1,
-1.695504, -0.3147678, -0.9578552, 1, 1, 1, 1, 1,
-1.679437, 0.3998062, -2.163934, 1, 1, 1, 1, 1,
-1.658323, 0.4760712, -0.741093, 1, 1, 1, 1, 1,
-1.655996, -0.8382806, -1.640884, 1, 1, 1, 1, 1,
-1.645547, -0.3705807, -2.684417, 1, 1, 1, 1, 1,
-1.64343, 0.3572939, -1.582979, 1, 1, 1, 1, 1,
-1.623948, -0.7082976, -1.997939, 1, 1, 1, 1, 1,
-1.602683, -0.1328257, -2.084316, 1, 1, 1, 1, 1,
-1.598772, -0.8162952, -2.585535, 1, 1, 1, 1, 1,
-1.596955, -0.9210743, -3.215465, 0, 0, 1, 1, 1,
-1.596865, -0.274078, -2.814917, 1, 0, 0, 1, 1,
-1.57503, 0.1416519, -1.910632, 1, 0, 0, 1, 1,
-1.569136, -1.318425, -3.47748, 1, 0, 0, 1, 1,
-1.559041, 1.045816, -1.87275, 1, 0, 0, 1, 1,
-1.555102, 0.3029206, -3.655981, 1, 0, 0, 1, 1,
-1.552139, -0.9333916, -2.947516, 0, 0, 0, 1, 1,
-1.551844, 0.2254447, -2.172883, 0, 0, 0, 1, 1,
-1.54326, 2.189467, -0.536938, 0, 0, 0, 1, 1,
-1.534531, -0.329347, -2.670403, 0, 0, 0, 1, 1,
-1.528928, -0.1880723, -1.057766, 0, 0, 0, 1, 1,
-1.516199, -0.2859903, -1.40368, 0, 0, 0, 1, 1,
-1.515353, 0.6055084, -1.291918, 0, 0, 0, 1, 1,
-1.511786, -0.5131531, -1.713211, 1, 1, 1, 1, 1,
-1.509859, -0.3983004, -1.818011, 1, 1, 1, 1, 1,
-1.509726, -0.8816181, -4.024141, 1, 1, 1, 1, 1,
-1.502478, 0.4395175, -0.7509633, 1, 1, 1, 1, 1,
-1.488581, 0.9405755, -0.8809638, 1, 1, 1, 1, 1,
-1.482872, -1.467166, -4.462226, 1, 1, 1, 1, 1,
-1.479344, -1.096927, -1.883458, 1, 1, 1, 1, 1,
-1.478108, -0.8450615, -1.413963, 1, 1, 1, 1, 1,
-1.476666, 1.662037, -2.092898, 1, 1, 1, 1, 1,
-1.45491, -0.7769541, -1.788097, 1, 1, 1, 1, 1,
-1.454079, 0.2658896, -1.062144, 1, 1, 1, 1, 1,
-1.443632, -1.863679, -1.056551, 1, 1, 1, 1, 1,
-1.44249, 1.078052, -0.8913867, 1, 1, 1, 1, 1,
-1.434043, -0.382111, -0.9822412, 1, 1, 1, 1, 1,
-1.433442, -2.137559, -3.804504, 1, 1, 1, 1, 1,
-1.430888, -0.5926896, -2.699276, 0, 0, 1, 1, 1,
-1.428789, -0.4870851, -2.920536, 1, 0, 0, 1, 1,
-1.423684, 0.363516, 1.49061, 1, 0, 0, 1, 1,
-1.422421, 1.110134, 0.6447651, 1, 0, 0, 1, 1,
-1.408707, 0.6044686, 0.2656941, 1, 0, 0, 1, 1,
-1.407078, 0.6797055, -1.796528, 1, 0, 0, 1, 1,
-1.39871, -0.15284, -0.867742, 0, 0, 0, 1, 1,
-1.396732, -0.4922003, -3.03091, 0, 0, 0, 1, 1,
-1.389017, -0.1761653, -0.04701465, 0, 0, 0, 1, 1,
-1.387025, -0.1808751, -1.355575, 0, 0, 0, 1, 1,
-1.376696, -0.4446904, -2.983896, 0, 0, 0, 1, 1,
-1.372053, -0.1302273, -1.255706, 0, 0, 0, 1, 1,
-1.371517, 0.7966201, 0.1812709, 0, 0, 0, 1, 1,
-1.365291, -1.184562, -1.910032, 1, 1, 1, 1, 1,
-1.35604, -0.01010658, 0.009464135, 1, 1, 1, 1, 1,
-1.332954, -1.454385, -2.937733, 1, 1, 1, 1, 1,
-1.329061, 1.302682, -1.542949, 1, 1, 1, 1, 1,
-1.323092, 1.17066, -2.365881, 1, 1, 1, 1, 1,
-1.313285, 1.167485, 1.22132, 1, 1, 1, 1, 1,
-1.31122, 0.1283752, -2.867484, 1, 1, 1, 1, 1,
-1.293724, -0.2407181, -0.4833086, 1, 1, 1, 1, 1,
-1.291145, 1.443962, -2.629121, 1, 1, 1, 1, 1,
-1.283062, -0.1118256, -1.091564, 1, 1, 1, 1, 1,
-1.281236, -0.07517031, 0.8169236, 1, 1, 1, 1, 1,
-1.264824, 0.9593011, -1.827638, 1, 1, 1, 1, 1,
-1.263942, 0.4647865, -1.169324, 1, 1, 1, 1, 1,
-1.262443, 0.4792958, -1.362723, 1, 1, 1, 1, 1,
-1.24634, -0.3304453, -3.715392, 1, 1, 1, 1, 1,
-1.226064, 1.522728, -2.284398, 0, 0, 1, 1, 1,
-1.221537, -0.3622952, -3.40758, 1, 0, 0, 1, 1,
-1.211183, 0.3439581, -0.2236728, 1, 0, 0, 1, 1,
-1.196317, 1.253582, 0.2201975, 1, 0, 0, 1, 1,
-1.193342, -0.15268, -2.071634, 1, 0, 0, 1, 1,
-1.191468, -0.1364621, -2.673256, 1, 0, 0, 1, 1,
-1.18408, -0.6459073, -1.657699, 0, 0, 0, 1, 1,
-1.180855, 0.1790651, -2.409852, 0, 0, 0, 1, 1,
-1.18051, 0.1307446, -1.768243, 0, 0, 0, 1, 1,
-1.173875, 1.634822, -0.3950244, 0, 0, 0, 1, 1,
-1.173807, -0.4528333, -0.1559358, 0, 0, 0, 1, 1,
-1.17265, 0.8878965, -1.811459, 0, 0, 0, 1, 1,
-1.159834, -0.7702035, -0.4187008, 0, 0, 0, 1, 1,
-1.156682, 0.3605597, -1.491347, 1, 1, 1, 1, 1,
-1.153786, 1.421642, -1.535949, 1, 1, 1, 1, 1,
-1.152125, -1.163688, -2.229836, 1, 1, 1, 1, 1,
-1.15199, 0.2671076, -1.075763, 1, 1, 1, 1, 1,
-1.150421, 0.3571816, -0.9865857, 1, 1, 1, 1, 1,
-1.148066, 0.7915136, -1.208168, 1, 1, 1, 1, 1,
-1.138076, -0.08396696, -1.125531, 1, 1, 1, 1, 1,
-1.132976, -0.3633209, -1.162057, 1, 1, 1, 1, 1,
-1.132279, 1.761888, 0.9294844, 1, 1, 1, 1, 1,
-1.126386, 0.4203202, -1.154977, 1, 1, 1, 1, 1,
-1.122347, 0.5075886, -1.661843, 1, 1, 1, 1, 1,
-1.122081, -0.06385244, -2.562344, 1, 1, 1, 1, 1,
-1.118023, 0.3905569, -1.747302, 1, 1, 1, 1, 1,
-1.117221, 0.2693209, -1.93648, 1, 1, 1, 1, 1,
-1.113564, -0.5125316, -5.152468, 1, 1, 1, 1, 1,
-1.113395, -0.9252788, -1.942995, 0, 0, 1, 1, 1,
-1.110882, -0.2793225, -1.379529, 1, 0, 0, 1, 1,
-1.107865, -0.2083948, -1.759583, 1, 0, 0, 1, 1,
-1.096984, -0.4444461, -1.406785, 1, 0, 0, 1, 1,
-1.093034, 0.9950025, -0.1538693, 1, 0, 0, 1, 1,
-1.088555, -0.6500588, -3.556193, 1, 0, 0, 1, 1,
-1.062446, 1.175751, -0.3474479, 0, 0, 0, 1, 1,
-1.058704, 0.1253512, -3.554431, 0, 0, 0, 1, 1,
-1.056092, -0.3047588, -2.349034, 0, 0, 0, 1, 1,
-1.046391, -0.1493827, -2.0355, 0, 0, 0, 1, 1,
-1.031328, 0.9251301, 1.190695, 0, 0, 0, 1, 1,
-1.02451, -2.040386, -2.275189, 0, 0, 0, 1, 1,
-1.022119, 1.282302, -1.79024, 0, 0, 0, 1, 1,
-1.018603, 0.8600445, -1.030144, 1, 1, 1, 1, 1,
-1.016619, 0.5439061, -2.513269, 1, 1, 1, 1, 1,
-1.016207, -2.106829, -3.614173, 1, 1, 1, 1, 1,
-1.002527, -0.01376526, -2.346869, 1, 1, 1, 1, 1,
-0.9997821, -0.7610489, -1.279318, 1, 1, 1, 1, 1,
-0.998072, -0.3866178, -0.4064371, 1, 1, 1, 1, 1,
-0.9978331, 1.290187, -0.1960494, 1, 1, 1, 1, 1,
-0.9950811, 0.2421592, -3.548826, 1, 1, 1, 1, 1,
-0.9926091, 0.7198526, -0.7396407, 1, 1, 1, 1, 1,
-0.9848994, 0.2535892, -0.2056895, 1, 1, 1, 1, 1,
-0.9846856, -0.3457756, -1.107672, 1, 1, 1, 1, 1,
-0.9838946, 0.0740126, -2.111228, 1, 1, 1, 1, 1,
-0.9802445, 1.869352, 0.7178572, 1, 1, 1, 1, 1,
-0.9797254, -0.8483929, -3.031455, 1, 1, 1, 1, 1,
-0.9777017, -0.281569, -3.077408, 1, 1, 1, 1, 1,
-0.9749474, 1.274487, 0.5952418, 0, 0, 1, 1, 1,
-0.9692859, -0.6155397, -1.470401, 1, 0, 0, 1, 1,
-0.9633757, 0.2325949, -1.641604, 1, 0, 0, 1, 1,
-0.9627254, -1.205238, -2.536296, 1, 0, 0, 1, 1,
-0.957498, -1.123637, -4.951293, 1, 0, 0, 1, 1,
-0.9558766, -0.6313799, -1.619998, 1, 0, 0, 1, 1,
-0.9558268, -0.7775312, -1.913965, 0, 0, 0, 1, 1,
-0.9497326, 2.990336, -0.8433923, 0, 0, 0, 1, 1,
-0.9472839, -2.15349, -2.42591, 0, 0, 0, 1, 1,
-0.9404669, 1.774188, 0.2859173, 0, 0, 0, 1, 1,
-0.9368874, 0.5115487, -0.6128622, 0, 0, 0, 1, 1,
-0.9352096, 1.073304, -0.5514638, 0, 0, 0, 1, 1,
-0.9348844, 1.264235, -1.497539, 0, 0, 0, 1, 1,
-0.931914, 1.208262, 1.135198, 1, 1, 1, 1, 1,
-0.9278629, -0.5520329, -1.446265, 1, 1, 1, 1, 1,
-0.9242712, 0.5170519, -2.566839, 1, 1, 1, 1, 1,
-0.923291, 1.386333, 1.478513, 1, 1, 1, 1, 1,
-0.9226434, 1.07651, -0.2699611, 1, 1, 1, 1, 1,
-0.9191746, 1.37843, -0.08452885, 1, 1, 1, 1, 1,
-0.9173236, 0.2704897, -2.075471, 1, 1, 1, 1, 1,
-0.9101883, 1.347233, -0.7201635, 1, 1, 1, 1, 1,
-0.8961017, 0.1894694, -0.3812248, 1, 1, 1, 1, 1,
-0.8933907, 1.620773, 0.2705258, 1, 1, 1, 1, 1,
-0.8925192, 1.7434, -0.6902601, 1, 1, 1, 1, 1,
-0.8923222, 0.1947386, -1.675764, 1, 1, 1, 1, 1,
-0.8916679, -0.1044627, -2.792784, 1, 1, 1, 1, 1,
-0.890828, 1.36377, -0.1103449, 1, 1, 1, 1, 1,
-0.8857192, -0.772701, -3.558301, 1, 1, 1, 1, 1,
-0.8846831, 0.4446806, -0.8741851, 0, 0, 1, 1, 1,
-0.8821507, 0.3421143, -2.068094, 1, 0, 0, 1, 1,
-0.8804885, -0.2238672, -1.608182, 1, 0, 0, 1, 1,
-0.8695468, -0.806114, -0.6392543, 1, 0, 0, 1, 1,
-0.8676847, 1.125663, 0.4078887, 1, 0, 0, 1, 1,
-0.8672357, 1.371591, -1.405936, 1, 0, 0, 1, 1,
-0.8628169, 0.782487, 0.1630154, 0, 0, 0, 1, 1,
-0.861657, 0.1718513, -1.742097, 0, 0, 0, 1, 1,
-0.8561226, 1.109374, -1.077055, 0, 0, 0, 1, 1,
-0.8509244, -0.9766444, -2.201927, 0, 0, 0, 1, 1,
-0.8477325, -1.167258, -2.929216, 0, 0, 0, 1, 1,
-0.8385551, -0.1295366, -1.734557, 0, 0, 0, 1, 1,
-0.8374926, -0.8626875, -3.258849, 0, 0, 0, 1, 1,
-0.836342, -0.3951052, -1.730141, 1, 1, 1, 1, 1,
-0.8301551, 0.6379369, -0.2464913, 1, 1, 1, 1, 1,
-0.8218696, 0.7437537, -3.547846, 1, 1, 1, 1, 1,
-0.8216852, 0.5725778, -0.7139425, 1, 1, 1, 1, 1,
-0.819961, 1.137408, -0.6243623, 1, 1, 1, 1, 1,
-0.8198767, 1.244536, 0.6277822, 1, 1, 1, 1, 1,
-0.8166445, -1.412052, -1.139645, 1, 1, 1, 1, 1,
-0.81315, -0.4419464, -1.856334, 1, 1, 1, 1, 1,
-0.8073936, -0.4157903, -2.467538, 1, 1, 1, 1, 1,
-0.8064216, 0.5369283, 0.1822627, 1, 1, 1, 1, 1,
-0.8059227, 0.9106197, -1.124237, 1, 1, 1, 1, 1,
-0.7936699, -0.06943637, -2.217762, 1, 1, 1, 1, 1,
-0.7918393, 0.1639814, -1.323078, 1, 1, 1, 1, 1,
-0.7909153, -0.3497351, -1.927857, 1, 1, 1, 1, 1,
-0.7871388, 0.4641823, -1.192748, 1, 1, 1, 1, 1,
-0.7724419, -1.642397, -4.305395, 0, 0, 1, 1, 1,
-0.7704246, -0.5466087, -4.41103, 1, 0, 0, 1, 1,
-0.7690206, 1.436066, 1.458896, 1, 0, 0, 1, 1,
-0.7679549, 0.09500548, -0.9209501, 1, 0, 0, 1, 1,
-0.7672699, 0.3950292, -1.677413, 1, 0, 0, 1, 1,
-0.76685, -0.6401441, -3.00543, 1, 0, 0, 1, 1,
-0.757205, -1.517028, -4.198709, 0, 0, 0, 1, 1,
-0.7571309, -0.4635296, -1.935476, 0, 0, 0, 1, 1,
-0.7523051, 1.288906, -0.8773996, 0, 0, 0, 1, 1,
-0.751219, -0.5991397, -1.056163, 0, 0, 0, 1, 1,
-0.7479777, 0.003926336, -3.764303, 0, 0, 0, 1, 1,
-0.743351, 0.9829298, -1.116912, 0, 0, 0, 1, 1,
-0.733306, -0.390738, -2.006042, 0, 0, 0, 1, 1,
-0.7315726, -2.790102, -2.411201, 1, 1, 1, 1, 1,
-0.7314458, -0.0669497, -4.416467, 1, 1, 1, 1, 1,
-0.7273962, -0.4050431, -2.885256, 1, 1, 1, 1, 1,
-0.7256218, -0.1736235, -2.139769, 1, 1, 1, 1, 1,
-0.7251612, 0.7341084, 1.343571, 1, 1, 1, 1, 1,
-0.718962, -0.6571147, -2.98011, 1, 1, 1, 1, 1,
-0.7183051, -0.04388741, -1.065807, 1, 1, 1, 1, 1,
-0.7165322, -0.3723793, -1.359782, 1, 1, 1, 1, 1,
-0.7079666, 0.2328636, 0.05896695, 1, 1, 1, 1, 1,
-0.7040489, 0.08941913, -1.26379, 1, 1, 1, 1, 1,
-0.6994985, -0.452803, -3.052141, 1, 1, 1, 1, 1,
-0.6948349, 1.085292, -0.9334705, 1, 1, 1, 1, 1,
-0.6909548, 0.1214653, -2.413773, 1, 1, 1, 1, 1,
-0.6794642, -0.6643575, 0.2387325, 1, 1, 1, 1, 1,
-0.6766506, -0.9916618, -3.637606, 1, 1, 1, 1, 1,
-0.6741436, -0.7452505, -3.326212, 0, 0, 1, 1, 1,
-0.6729859, -2.172053, -3.158299, 1, 0, 0, 1, 1,
-0.6711948, 0.8441175, 0.05879816, 1, 0, 0, 1, 1,
-0.6711712, -1.176394, -3.310722, 1, 0, 0, 1, 1,
-0.6678104, -1.028738, -0.9487077, 1, 0, 0, 1, 1,
-0.661945, 0.7079482, -1.699568, 1, 0, 0, 1, 1,
-0.660126, 0.3910987, 0.3836887, 0, 0, 0, 1, 1,
-0.6591235, -0.3854103, -1.712392, 0, 0, 0, 1, 1,
-0.6517568, -1.628465, -3.833165, 0, 0, 0, 1, 1,
-0.646974, -0.4035487, -1.608209, 0, 0, 0, 1, 1,
-0.6462972, -0.8082817, -4.389616, 0, 0, 0, 1, 1,
-0.6429383, 1.929886, 0.6119483, 0, 0, 0, 1, 1,
-0.6423378, -0.2591264, -0.8072857, 0, 0, 0, 1, 1,
-0.6392788, -0.1540121, -3.171293, 1, 1, 1, 1, 1,
-0.6307331, -0.4240687, -2.204039, 1, 1, 1, 1, 1,
-0.6190915, -1.023751, -1.761984, 1, 1, 1, 1, 1,
-0.6180762, -1.108403, -3.115418, 1, 1, 1, 1, 1,
-0.6137711, -1.368302, -0.7003145, 1, 1, 1, 1, 1,
-0.6134965, 1.686804, -1.040254, 1, 1, 1, 1, 1,
-0.6125004, -1.237348, -2.273367, 1, 1, 1, 1, 1,
-0.6121418, 0.5672269, -0.9225156, 1, 1, 1, 1, 1,
-0.6099687, -1.045086, -1.451357, 1, 1, 1, 1, 1,
-0.6096511, 0.05281336, -0.009083734, 1, 1, 1, 1, 1,
-0.6095012, -0.5810036, -1.040348, 1, 1, 1, 1, 1,
-0.6071674, -1.266996, -2.147387, 1, 1, 1, 1, 1,
-0.6046683, -0.1040785, -1.518802, 1, 1, 1, 1, 1,
-0.6027519, -1.60937, -2.241939, 1, 1, 1, 1, 1,
-0.5942301, 0.0492021, -0.9379271, 1, 1, 1, 1, 1,
-0.5907626, 0.5320509, -1.445823, 0, 0, 1, 1, 1,
-0.5823246, -0.9015654, -2.060563, 1, 0, 0, 1, 1,
-0.5816633, 0.1478339, -1.039579, 1, 0, 0, 1, 1,
-0.5737096, -1.581342, -1.88048, 1, 0, 0, 1, 1,
-0.5729485, -0.09367017, -0.5766729, 1, 0, 0, 1, 1,
-0.5717694, -1.312867, -3.266734, 1, 0, 0, 1, 1,
-0.5660568, -0.8338251, -2.864871, 0, 0, 0, 1, 1,
-0.5621498, 1.467326, -1.30781, 0, 0, 0, 1, 1,
-0.5596342, 1.078723, -0.3755299, 0, 0, 0, 1, 1,
-0.555451, -0.1442327, -2.558341, 0, 0, 0, 1, 1,
-0.5535318, -0.7084911, -2.691922, 0, 0, 0, 1, 1,
-0.5529643, -1.41423, -2.178275, 0, 0, 0, 1, 1,
-0.5479161, 0.3419124, -1.346539, 0, 0, 0, 1, 1,
-0.5461486, -0.8083469, -0.8647251, 1, 1, 1, 1, 1,
-0.5433306, -0.8737674, -0.748852, 1, 1, 1, 1, 1,
-0.5404748, -0.2657298, -0.06067094, 1, 1, 1, 1, 1,
-0.5340038, -0.005234479, -3.146157, 1, 1, 1, 1, 1,
-0.532876, 1.749922, -0.4205785, 1, 1, 1, 1, 1,
-0.5309132, -0.8149182, -0.8768358, 1, 1, 1, 1, 1,
-0.5294077, -0.08676413, -3.317, 1, 1, 1, 1, 1,
-0.5279029, -0.6266188, -1.284634, 1, 1, 1, 1, 1,
-0.5248631, 0.09973738, -0.4485342, 1, 1, 1, 1, 1,
-0.5206982, 0.8718194, 1.715434, 1, 1, 1, 1, 1,
-0.5167164, -0.3725079, -2.933669, 1, 1, 1, 1, 1,
-0.5149626, 0.5309618, -1.650663, 1, 1, 1, 1, 1,
-0.5149611, -0.8121868, -2.872973, 1, 1, 1, 1, 1,
-0.5114886, -0.3077065, -1.710747, 1, 1, 1, 1, 1,
-0.5039219, -1.079059, -3.857868, 1, 1, 1, 1, 1,
-0.5004461, -0.7213807, -3.554035, 0, 0, 1, 1, 1,
-0.4996302, 0.7952846, -0.7193706, 1, 0, 0, 1, 1,
-0.4935999, -2.226864, -3.30039, 1, 0, 0, 1, 1,
-0.4847507, 1.496874, -0.1113065, 1, 0, 0, 1, 1,
-0.4798382, -0.1292177, -1.872046, 1, 0, 0, 1, 1,
-0.4793389, -1.397624, -2.497705, 1, 0, 0, 1, 1,
-0.474102, 0.1869365, -0.9722067, 0, 0, 0, 1, 1,
-0.472114, 0.8724853, 0.4377171, 0, 0, 0, 1, 1,
-0.4720343, -0.9237435, -1.544642, 0, 0, 0, 1, 1,
-0.4667753, -1.63316, -3.410611, 0, 0, 0, 1, 1,
-0.4662049, -0.4722691, -1.475724, 0, 0, 0, 1, 1,
-0.4638885, 0.08786555, -3.307423, 0, 0, 0, 1, 1,
-0.4616683, 0.07646505, -0.5872675, 0, 0, 0, 1, 1,
-0.4546991, 1.073072, -0.07619073, 1, 1, 1, 1, 1,
-0.4534832, 2.895719, 1.94136, 1, 1, 1, 1, 1,
-0.4533476, 1.023262, -0.4446898, 1, 1, 1, 1, 1,
-0.4477752, 0.151751, -0.7740126, 1, 1, 1, 1, 1,
-0.445343, 0.6757976, -2.362297, 1, 1, 1, 1, 1,
-0.4447601, -1.200614, -4.716825, 1, 1, 1, 1, 1,
-0.4411932, 0.9524686, -1.922229, 1, 1, 1, 1, 1,
-0.4406064, -0.3751239, -2.965575, 1, 1, 1, 1, 1,
-0.4398337, -0.6283419, -3.031556, 1, 1, 1, 1, 1,
-0.4338946, 0.6249162, -0.951383, 1, 1, 1, 1, 1,
-0.431843, 1.090741, 0.04533907, 1, 1, 1, 1, 1,
-0.4294259, 1.667339, -1.358192, 1, 1, 1, 1, 1,
-0.4287503, -0.5352559, -2.153775, 1, 1, 1, 1, 1,
-0.4259399, -0.05948195, -3.605525, 1, 1, 1, 1, 1,
-0.4245051, 1.427898, -1.396858, 1, 1, 1, 1, 1,
-0.4229942, -2.547137, -2.642453, 0, 0, 1, 1, 1,
-0.4192063, -0.1986587, -1.007703, 1, 0, 0, 1, 1,
-0.4188488, 1.859472, 0.4751424, 1, 0, 0, 1, 1,
-0.4136913, -0.02966556, -0.4564241, 1, 0, 0, 1, 1,
-0.4105225, -0.7038183, -3.884566, 1, 0, 0, 1, 1,
-0.4099602, -0.479334, -2.71425, 1, 0, 0, 1, 1,
-0.4098407, -2.224699, -2.610069, 0, 0, 0, 1, 1,
-0.3982404, -0.4628119, -2.016201, 0, 0, 0, 1, 1,
-0.3969882, 0.1007468, -3.44577, 0, 0, 0, 1, 1,
-0.3933152, 0.531204, -1.837816, 0, 0, 0, 1, 1,
-0.3916947, 0.9645231, -1.81, 0, 0, 0, 1, 1,
-0.39072, -2.070239, -5.300262, 0, 0, 0, 1, 1,
-0.3904797, -0.109695, -1.300785, 0, 0, 0, 1, 1,
-0.3896598, 0.5836686, 0.9783805, 1, 1, 1, 1, 1,
-0.3877542, -0.3921865, -1.996705, 1, 1, 1, 1, 1,
-0.3852628, -1.232878, -2.352274, 1, 1, 1, 1, 1,
-0.3792648, -1.026628, -2.032066, 1, 1, 1, 1, 1,
-0.3788077, 2.305731, -0.9450789, 1, 1, 1, 1, 1,
-0.3782593, 1.697003, -0.2420454, 1, 1, 1, 1, 1,
-0.3766805, 0.5914232, 0.6493267, 1, 1, 1, 1, 1,
-0.3743511, 1.18872, -1.251246, 1, 1, 1, 1, 1,
-0.369323, -0.1934502, -3.759193, 1, 1, 1, 1, 1,
-0.3680673, -0.1995542, 0.938104, 1, 1, 1, 1, 1,
-0.3668546, -1.009144, -2.236635, 1, 1, 1, 1, 1,
-0.3663676, -0.6599023, -1.44348, 1, 1, 1, 1, 1,
-0.3590411, 0.8109427, -0.0977296, 1, 1, 1, 1, 1,
-0.3460756, 1.737025, 0.6084627, 1, 1, 1, 1, 1,
-0.3449444, 0.3913466, 0.4168675, 1, 1, 1, 1, 1,
-0.3300967, 0.2149323, -1.163497, 0, 0, 1, 1, 1,
-0.3295293, -0.7988688, -4.793876, 1, 0, 0, 1, 1,
-0.3217832, 0.9700922, 0.4435021, 1, 0, 0, 1, 1,
-0.3209335, 1.559182, -0.04111828, 1, 0, 0, 1, 1,
-0.3199485, -0.210448, -1.75832, 1, 0, 0, 1, 1,
-0.3186743, 0.764518, -1.214534, 1, 0, 0, 1, 1,
-0.317275, -0.3542857, -2.71168, 0, 0, 0, 1, 1,
-0.3155179, 0.7770489, -1.149138, 0, 0, 0, 1, 1,
-0.3120207, -0.15962, -3.755437, 0, 0, 0, 1, 1,
-0.3047246, 0.7475994, -1.48098, 0, 0, 0, 1, 1,
-0.3032328, -0.1146439, -1.089388, 0, 0, 0, 1, 1,
-0.3030633, 0.5117651, 1.135489, 0, 0, 0, 1, 1,
-0.2994732, -0.2302431, -2.212851, 0, 0, 0, 1, 1,
-0.2965206, 2.115153, -0.1079428, 1, 1, 1, 1, 1,
-0.2961831, 0.1826651, -0.574101, 1, 1, 1, 1, 1,
-0.2916337, 0.4787477, 0.1757961, 1, 1, 1, 1, 1,
-0.2909463, 0.6356116, 0.4736963, 1, 1, 1, 1, 1,
-0.2886066, -0.155802, -1.05634, 1, 1, 1, 1, 1,
-0.287502, 0.5062465, -0.6424353, 1, 1, 1, 1, 1,
-0.2862736, 0.1344746, -0.6944307, 1, 1, 1, 1, 1,
-0.2770695, -0.3659636, -2.021426, 1, 1, 1, 1, 1,
-0.2732544, 0.1475843, -1.063222, 1, 1, 1, 1, 1,
-0.272514, -1.796651, -3.79882, 1, 1, 1, 1, 1,
-0.2694451, -1.985967, -1.504187, 1, 1, 1, 1, 1,
-0.264535, 0.2068017, -1.039491, 1, 1, 1, 1, 1,
-0.2636728, 0.6330531, -0.8898389, 1, 1, 1, 1, 1,
-0.2628968, 1.240592, -1.380283, 1, 1, 1, 1, 1,
-0.2626138, -0.1655762, -0.4834637, 1, 1, 1, 1, 1,
-0.2604805, -0.677443, -2.927456, 0, 0, 1, 1, 1,
-0.2567743, 0.5366135, -2.193618, 1, 0, 0, 1, 1,
-0.2547115, 0.05916892, -3.050814, 1, 0, 0, 1, 1,
-0.2508371, 0.09898373, -1.706956, 1, 0, 0, 1, 1,
-0.2503601, 1.620296, -0.7131304, 1, 0, 0, 1, 1,
-0.2485467, 0.988712, 0.5501739, 1, 0, 0, 1, 1,
-0.2482756, 0.8072728, 0.9613365, 0, 0, 0, 1, 1,
-0.2469669, -1.052329, -2.442932, 0, 0, 0, 1, 1,
-0.2405198, 1.760465, -0.3493753, 0, 0, 0, 1, 1,
-0.2359721, 0.2765179, 0.1273922, 0, 0, 0, 1, 1,
-0.2286882, 0.6617396, 0.8419417, 0, 0, 0, 1, 1,
-0.2261889, 1.25169, -2.137449, 0, 0, 0, 1, 1,
-0.2254211, 0.3308448, -1.610423, 0, 0, 0, 1, 1,
-0.2221563, -0.284128, -1.138696, 1, 1, 1, 1, 1,
-0.2212107, -0.4062018, -3.411579, 1, 1, 1, 1, 1,
-0.2168388, -1.994334, -3.51373, 1, 1, 1, 1, 1,
-0.2156814, 0.7655248, -1.460707, 1, 1, 1, 1, 1,
-0.2147427, -0.5658674, -2.099763, 1, 1, 1, 1, 1,
-0.2117296, 0.2387732, -1.08548, 1, 1, 1, 1, 1,
-0.210815, 0.05699775, 0.1068778, 1, 1, 1, 1, 1,
-0.2086588, -0.2937194, -2.983654, 1, 1, 1, 1, 1,
-0.2083008, 0.3002583, -1.160801, 1, 1, 1, 1, 1,
-0.2074596, -1.1239, -0.8871635, 1, 1, 1, 1, 1,
-0.2038232, -0.6750725, -2.922593, 1, 1, 1, 1, 1,
-0.1997221, 0.1677213, -1.031363, 1, 1, 1, 1, 1,
-0.1988231, -2.914809, -3.491207, 1, 1, 1, 1, 1,
-0.1977642, -0.9459244, -2.091273, 1, 1, 1, 1, 1,
-0.1949708, 0.01394136, -1.535951, 1, 1, 1, 1, 1,
-0.1940926, 0.5515708, 0.4033437, 0, 0, 1, 1, 1,
-0.1894958, 0.3517251, -0.4974894, 1, 0, 0, 1, 1,
-0.1884563, -1.488271, -4.372511, 1, 0, 0, 1, 1,
-0.1882893, 0.9462874, -1.634722, 1, 0, 0, 1, 1,
-0.1758704, -0.9969842, -2.285434, 1, 0, 0, 1, 1,
-0.1758162, 0.2253686, -0.2862487, 1, 0, 0, 1, 1,
-0.1753062, 0.5253469, -2.201361, 0, 0, 0, 1, 1,
-0.1740958, 1.020362, -0.6514717, 0, 0, 0, 1, 1,
-0.171427, -0.4895915, -1.27756, 0, 0, 0, 1, 1,
-0.1704894, 1.708976, -1.194693, 0, 0, 0, 1, 1,
-0.1675652, -0.7614619, -3.6976, 0, 0, 0, 1, 1,
-0.1673955, 0.8457345, -0.1033389, 0, 0, 0, 1, 1,
-0.162867, 0.3595325, -0.6620051, 0, 0, 0, 1, 1,
-0.1590135, -0.863102, -3.386671, 1, 1, 1, 1, 1,
-0.158614, 0.2559552, -0.6546806, 1, 1, 1, 1, 1,
-0.1569749, 0.2709745, -0.02184663, 1, 1, 1, 1, 1,
-0.1510718, -0.6425269, -4.492073, 1, 1, 1, 1, 1,
-0.1505562, 1.561112, 0.7709981, 1, 1, 1, 1, 1,
-0.1501112, 0.4889975, 0.9319002, 1, 1, 1, 1, 1,
-0.1483054, -0.5533502, -2.647942, 1, 1, 1, 1, 1,
-0.1480361, 0.181782, 0.09063892, 1, 1, 1, 1, 1,
-0.1476305, 0.9407975, 0.930059, 1, 1, 1, 1, 1,
-0.1453794, -0.5527385, -2.372026, 1, 1, 1, 1, 1,
-0.1414587, -1.079673, -4.031772, 1, 1, 1, 1, 1,
-0.140476, 0.3031733, 0.2231199, 1, 1, 1, 1, 1,
-0.1395672, -1.288681, -3.556398, 1, 1, 1, 1, 1,
-0.1393726, -1.228517, -2.782777, 1, 1, 1, 1, 1,
-0.1359372, -0.7792297, -3.629079, 1, 1, 1, 1, 1,
-0.1332375, 0.3283657, -1.55087, 0, 0, 1, 1, 1,
-0.1315255, 0.7382847, -2.760588, 1, 0, 0, 1, 1,
-0.1313643, 0.03663998, -3.4698, 1, 0, 0, 1, 1,
-0.1298435, -1.196174, -2.447004, 1, 0, 0, 1, 1,
-0.1276163, 0.4850074, 0.09439164, 1, 0, 0, 1, 1,
-0.1272953, -1.489553, -2.783648, 1, 0, 0, 1, 1,
-0.1230018, -0.8336942, -0.27154, 0, 0, 0, 1, 1,
-0.1200433, -1.87831, -3.034093, 0, 0, 0, 1, 1,
-0.1187885, -1.491817, -1.392407, 0, 0, 0, 1, 1,
-0.1184369, -0.8267946, -3.445437, 0, 0, 0, 1, 1,
-0.118005, 1.529003, 0.5363809, 0, 0, 0, 1, 1,
-0.1168624, -0.8079979, -3.419411, 0, 0, 0, 1, 1,
-0.1151879, 0.4544367, 0.009920837, 0, 0, 0, 1, 1,
-0.1131749, -0.9774391, -4.690149, 1, 1, 1, 1, 1,
-0.1021722, -0.4065657, -1.724454, 1, 1, 1, 1, 1,
-0.1017644, -0.3562866, -4.685167, 1, 1, 1, 1, 1,
-0.09000033, -0.9276441, -4.024626, 1, 1, 1, 1, 1,
-0.08627247, 1.071097, 0.5881382, 1, 1, 1, 1, 1,
-0.08549148, -0.5081851, -4.301802, 1, 1, 1, 1, 1,
-0.07988063, 0.9152386, -0.9140873, 1, 1, 1, 1, 1,
-0.06815612, -0.06874703, -2.174234, 1, 1, 1, 1, 1,
-0.06681482, -2.583102, -2.04118, 1, 1, 1, 1, 1,
-0.06681464, 1.24677, 0.9731589, 1, 1, 1, 1, 1,
-0.06380674, -1.636158, -3.986345, 1, 1, 1, 1, 1,
-0.06293111, -2.018574, -2.348883, 1, 1, 1, 1, 1,
-0.05780602, 0.5443705, 2.046031, 1, 1, 1, 1, 1,
-0.05497324, -0.6989112, -2.720412, 1, 1, 1, 1, 1,
-0.05372785, -1.378786, -3.95535, 1, 1, 1, 1, 1,
-0.04802883, -0.2418902, -1.794736, 0, 0, 1, 1, 1,
-0.04292716, -1.598026, -3.228442, 1, 0, 0, 1, 1,
-0.04287914, 0.995792, 0.987123, 1, 0, 0, 1, 1,
-0.04253067, 2.441556, -0.007109703, 1, 0, 0, 1, 1,
-0.03961504, 0.4015016, -0.07639151, 1, 0, 0, 1, 1,
-0.03764499, 0.6951101, -1.321243, 1, 0, 0, 1, 1,
-0.03643959, -2.432855, -3.725005, 0, 0, 0, 1, 1,
-0.02842679, 1.139622, 0.5639647, 0, 0, 0, 1, 1,
-0.02220898, 0.07393924, -1.609655, 0, 0, 0, 1, 1,
-0.02099725, -0.1580136, -5.6542, 0, 0, 0, 1, 1,
-0.01967601, -0.7930914, -3.000825, 0, 0, 0, 1, 1,
-0.01812649, 0.6382006, 0.5122597, 0, 0, 0, 1, 1,
-0.01803294, 0.3316168, -1.215258, 0, 0, 0, 1, 1,
-0.01335793, -0.2731293, -2.934613, 1, 1, 1, 1, 1,
-0.01280174, -0.3968923, -3.214153, 1, 1, 1, 1, 1,
-0.01064661, -1.359593, -1.15117, 1, 1, 1, 1, 1,
-0.006264573, -0.1718681, -3.228931, 1, 1, 1, 1, 1,
-0.004961639, 1.660645, -1.013114, 1, 1, 1, 1, 1,
-0.002547315, -1.265272, -2.073988, 1, 1, 1, 1, 1,
-0.0008113765, -1.433831, -1.999971, 1, 1, 1, 1, 1,
-0.0008004259, -0.8580383, -3.320393, 1, 1, 1, 1, 1,
0.003115246, -0.2033541, 3.235774, 1, 1, 1, 1, 1,
0.0120188, -0.02186523, 2.765953, 1, 1, 1, 1, 1,
0.01655148, 0.2934774, 0.1904543, 1, 1, 1, 1, 1,
0.0179557, -1.395679, 1.086284, 1, 1, 1, 1, 1,
0.02255865, 0.1150407, -0.08692912, 1, 1, 1, 1, 1,
0.02313763, -1.108568, 3.585059, 1, 1, 1, 1, 1,
0.02357374, -1.545925, 3.286528, 1, 1, 1, 1, 1,
0.02404113, -0.2724688, 1.03541, 0, 0, 1, 1, 1,
0.02833138, 0.6822594, 0.204339, 1, 0, 0, 1, 1,
0.03121069, 1.327766, 1.296935, 1, 0, 0, 1, 1,
0.03734288, 1.248205, 2.429139, 1, 0, 0, 1, 1,
0.03859988, 0.776543, 3.012796, 1, 0, 0, 1, 1,
0.041631, -1.117884, 2.896606, 1, 0, 0, 1, 1,
0.04340344, -0.09982979, 2.390891, 0, 0, 0, 1, 1,
0.04345974, -1.42865, 1.748672, 0, 0, 0, 1, 1,
0.05077157, -1.332994, 4.815447, 0, 0, 0, 1, 1,
0.05243947, -0.2340468, 3.493339, 0, 0, 0, 1, 1,
0.05711907, 1.828897, -0.2829049, 0, 0, 0, 1, 1,
0.0576376, -0.5782473, 1.87067, 0, 0, 0, 1, 1,
0.05764226, 1.213661, 0.6532371, 0, 0, 0, 1, 1,
0.05981975, -1.65311, 3.069171, 1, 1, 1, 1, 1,
0.06043024, -0.5587265, 4.040263, 1, 1, 1, 1, 1,
0.06554098, 0.2834581, 1.381609, 1, 1, 1, 1, 1,
0.07144136, 0.9268231, -0.8544484, 1, 1, 1, 1, 1,
0.07212171, 1.264548, -0.5582417, 1, 1, 1, 1, 1,
0.07360628, 0.6114994, -0.1258947, 1, 1, 1, 1, 1,
0.07392325, 2.068093, 0.5301031, 1, 1, 1, 1, 1,
0.07516614, -0.725768, 3.228163, 1, 1, 1, 1, 1,
0.07868618, -1.593817, 2.732268, 1, 1, 1, 1, 1,
0.07888212, 0.1561921, 0.4037471, 1, 1, 1, 1, 1,
0.08638223, 0.927722, 0.6357194, 1, 1, 1, 1, 1,
0.0868923, -1.98288, 2.676982, 1, 1, 1, 1, 1,
0.0877476, -0.4764489, 2.39495, 1, 1, 1, 1, 1,
0.09090819, 0.6015828, -2.078262, 1, 1, 1, 1, 1,
0.09190249, -0.06227193, 0.6705381, 1, 1, 1, 1, 1,
0.09280455, -0.5650336, 2.854327, 0, 0, 1, 1, 1,
0.09725878, 0.05020971, 1.633005, 1, 0, 0, 1, 1,
0.1025787, -1.459983, 3.039739, 1, 0, 0, 1, 1,
0.102803, -0.21882, 2.843099, 1, 0, 0, 1, 1,
0.1035905, -0.09839562, 0.9634285, 1, 0, 0, 1, 1,
0.1036706, -0.2784824, 2.694024, 1, 0, 0, 1, 1,
0.109626, -0.002609692, 0.3351732, 0, 0, 0, 1, 1,
0.1137444, 1.313642, -0.6775445, 0, 0, 0, 1, 1,
0.1164215, 0.5309068, 1.584605, 0, 0, 0, 1, 1,
0.1188578, 1.26724, -0.5088947, 0, 0, 0, 1, 1,
0.1190488, 0.2377838, -0.3050502, 0, 0, 0, 1, 1,
0.1215205, 0.7832778, 0.4090137, 0, 0, 0, 1, 1,
0.1243142, -0.1600022, 3.09891, 0, 0, 0, 1, 1,
0.1249217, 0.7529908, 1.044962, 1, 1, 1, 1, 1,
0.125576, 0.6551951, -1.136207, 1, 1, 1, 1, 1,
0.1272209, 0.6661507, 0.2436992, 1, 1, 1, 1, 1,
0.1341231, -1.037924, 3.716415, 1, 1, 1, 1, 1,
0.1364164, 1.027139, -0.5054031, 1, 1, 1, 1, 1,
0.1370962, -0.4078749, 1.668837, 1, 1, 1, 1, 1,
0.1389664, 0.5907661, -0.8130716, 1, 1, 1, 1, 1,
0.1400438, -1.608084, 2.525629, 1, 1, 1, 1, 1,
0.1430074, -0.2218845, 1.977475, 1, 1, 1, 1, 1,
0.1452224, -0.9506047, 2.254834, 1, 1, 1, 1, 1,
0.1461509, -0.005895755, 1.967439, 1, 1, 1, 1, 1,
0.1478862, 0.2498543, -0.2072676, 1, 1, 1, 1, 1,
0.1486985, 1.189931, -1.62301, 1, 1, 1, 1, 1,
0.1556959, -1.277046, 3.863516, 1, 1, 1, 1, 1,
0.1564318, -1.107337, 3.502626, 1, 1, 1, 1, 1,
0.1564604, 0.4694804, 3.615587, 0, 0, 1, 1, 1,
0.1580094, 0.691075, 0.6021563, 1, 0, 0, 1, 1,
0.1607066, -0.4055405, 2.314227, 1, 0, 0, 1, 1,
0.1676371, -1.921267, 3.022489, 1, 0, 0, 1, 1,
0.1683922, -1.660451, 3.629813, 1, 0, 0, 1, 1,
0.1699155, 0.1179131, -0.3519399, 1, 0, 0, 1, 1,
0.1716761, 1.1471, -0.9057286, 0, 0, 0, 1, 1,
0.1724407, -1.063322, 4.253125, 0, 0, 0, 1, 1,
0.1740231, -0.1558343, 1.972626, 0, 0, 0, 1, 1,
0.1755288, -0.225639, 3.135611, 0, 0, 0, 1, 1,
0.1762553, -1.888618, 1.672895, 0, 0, 0, 1, 1,
0.1773996, 0.1448694, 2.31247, 0, 0, 0, 1, 1,
0.184276, -0.6148416, 3.144217, 0, 0, 0, 1, 1,
0.1872532, -0.2000567, 1.61724, 1, 1, 1, 1, 1,
0.1881354, -0.7765605, 2.453187, 1, 1, 1, 1, 1,
0.1885754, 1.702633, -0.610162, 1, 1, 1, 1, 1,
0.189111, -0.2389509, 3.134764, 1, 1, 1, 1, 1,
0.1902893, 0.567008, 1.46479, 1, 1, 1, 1, 1,
0.1996425, 1.737111, -0.3540134, 1, 1, 1, 1, 1,
0.200087, -0.2123587, 2.238528, 1, 1, 1, 1, 1,
0.2014511, -0.04714053, 1.491211, 1, 1, 1, 1, 1,
0.2019295, -0.03655277, 2.056499, 1, 1, 1, 1, 1,
0.2038164, 2.611803, 0.1878245, 1, 1, 1, 1, 1,
0.2044286, 0.4975341, 0.1394354, 1, 1, 1, 1, 1,
0.2047705, -0.08789139, 0.9028223, 1, 1, 1, 1, 1,
0.2068309, -1.13386, 4.229833, 1, 1, 1, 1, 1,
0.2079183, -0.1036302, 1.221678, 1, 1, 1, 1, 1,
0.2082067, 0.5923055, -0.1897952, 1, 1, 1, 1, 1,
0.2096002, 2.338449, 1.244584, 0, 0, 1, 1, 1,
0.2110023, -0.9937487, 2.578525, 1, 0, 0, 1, 1,
0.2131369, -1.38966, 2.392063, 1, 0, 0, 1, 1,
0.2140387, 1.633141, -0.04899516, 1, 0, 0, 1, 1,
0.2170849, -1.062134, 2.732972, 1, 0, 0, 1, 1,
0.2248166, 1.093405, 0.08650794, 1, 0, 0, 1, 1,
0.2341036, 0.9232228, 0.3955584, 0, 0, 0, 1, 1,
0.2398957, -2.289697, 2.53703, 0, 0, 0, 1, 1,
0.2416268, 2.004426, -0.9781159, 0, 0, 0, 1, 1,
0.2446291, 1.057929, 0.9077035, 0, 0, 0, 1, 1,
0.2464299, -1.084423, 1.471192, 0, 0, 0, 1, 1,
0.2504418, 1.416275, -1.404373, 0, 0, 0, 1, 1,
0.2517667, -1.556997, 3.194617, 0, 0, 0, 1, 1,
0.2533418, 0.6398469, -0.4553536, 1, 1, 1, 1, 1,
0.2578548, 1.644837, 1.415867, 1, 1, 1, 1, 1,
0.2636808, -0.6760886, 3.824296, 1, 1, 1, 1, 1,
0.2686638, 0.1602572, 2.192143, 1, 1, 1, 1, 1,
0.2696782, 1.525379, 1.747267, 1, 1, 1, 1, 1,
0.2731904, -0.3538432, 2.013591, 1, 1, 1, 1, 1,
0.2737558, 0.4331829, 1.364811, 1, 1, 1, 1, 1,
0.2802733, 0.4037203, 1.485755, 1, 1, 1, 1, 1,
0.2864145, 1.303305, -1.113092, 1, 1, 1, 1, 1,
0.2873483, 1.05081, 1.20474, 1, 1, 1, 1, 1,
0.2908211, -0.2630728, 3.436463, 1, 1, 1, 1, 1,
0.2929587, -0.9112377, 2.156953, 1, 1, 1, 1, 1,
0.293708, 0.03056279, 0.8984715, 1, 1, 1, 1, 1,
0.2951806, -1.537415, 2.971721, 1, 1, 1, 1, 1,
0.2983589, 0.9585853, 1.210045, 1, 1, 1, 1, 1,
0.3047771, 0.7742921, 0.1233266, 0, 0, 1, 1, 1,
0.3066126, -0.7732666, 2.452615, 1, 0, 0, 1, 1,
0.3090975, -1.976227, 4.26489, 1, 0, 0, 1, 1,
0.3132747, 0.1082086, 0.7893461, 1, 0, 0, 1, 1,
0.3142416, 1.148925, -1.123436, 1, 0, 0, 1, 1,
0.318481, -0.2604328, 1.439264, 1, 0, 0, 1, 1,
0.3214496, 0.472837, -0.2307561, 0, 0, 0, 1, 1,
0.3220721, 1.353212, 2.017766, 0, 0, 0, 1, 1,
0.3281368, 2.190131, 0.3031728, 0, 0, 0, 1, 1,
0.3288254, 0.8421361, 1.148521, 0, 0, 0, 1, 1,
0.3295156, -0.2075037, 1.369384, 0, 0, 0, 1, 1,
0.3318242, -1.602161, 3.089767, 0, 0, 0, 1, 1,
0.3323835, 1.421027, -0.2740086, 0, 0, 0, 1, 1,
0.3325851, 0.500082, 0.2625965, 1, 1, 1, 1, 1,
0.3328064, 1.035565, -0.3283478, 1, 1, 1, 1, 1,
0.3338066, 1.947191, -0.2614293, 1, 1, 1, 1, 1,
0.3369568, 0.5817965, 0.04046764, 1, 1, 1, 1, 1,
0.3420854, -0.09032228, 2.759309, 1, 1, 1, 1, 1,
0.3430996, 0.7984002, 1.146081, 1, 1, 1, 1, 1,
0.3486863, 0.2565208, 0.3392854, 1, 1, 1, 1, 1,
0.3488224, 0.2063543, 1.193647, 1, 1, 1, 1, 1,
0.3501518, 1.208815, -0.2153539, 1, 1, 1, 1, 1,
0.3527612, -0.7453461, 2.35457, 1, 1, 1, 1, 1,
0.3544959, -0.06642998, 2.429893, 1, 1, 1, 1, 1,
0.3546846, -0.9307365, 3.322706, 1, 1, 1, 1, 1,
0.3577015, -1.021985, 3.921989, 1, 1, 1, 1, 1,
0.3603138, -0.1281794, 2.59383, 1, 1, 1, 1, 1,
0.3608599, -0.297691, 0.5976858, 1, 1, 1, 1, 1,
0.36767, 0.04265019, 2.822278, 0, 0, 1, 1, 1,
0.3717005, -1.91375, 2.813694, 1, 0, 0, 1, 1,
0.3729702, 1.792074, 0.07068935, 1, 0, 0, 1, 1,
0.3787075, -1.615615, 2.130777, 1, 0, 0, 1, 1,
0.378924, 1.291605, 0.5494657, 1, 0, 0, 1, 1,
0.3842596, -0.9089434, 3.222668, 1, 0, 0, 1, 1,
0.3856868, 0.2463219, 0.1122417, 0, 0, 0, 1, 1,
0.3876813, -0.2142891, 1.910289, 0, 0, 0, 1, 1,
0.3877831, -0.1943642, 2.845356, 0, 0, 0, 1, 1,
0.3913125, -0.6325974, 1.974324, 0, 0, 0, 1, 1,
0.3935474, -1.792947, 3.191407, 0, 0, 0, 1, 1,
0.3979363, 0.02635322, 0.8940604, 0, 0, 0, 1, 1,
0.3985577, -0.1804149, 3.436117, 0, 0, 0, 1, 1,
0.399868, -0.09262336, 0.6014426, 1, 1, 1, 1, 1,
0.4013461, 0.8108823, 1.327737, 1, 1, 1, 1, 1,
0.4100272, 1.91038, 3.169958, 1, 1, 1, 1, 1,
0.4133835, -0.6054574, 4.00618, 1, 1, 1, 1, 1,
0.4152811, 1.752065, -0.3548674, 1, 1, 1, 1, 1,
0.4194454, 0.7611977, 0.5731761, 1, 1, 1, 1, 1,
0.4215638, -0.8953828, 2.105267, 1, 1, 1, 1, 1,
0.4217523, 0.2031277, 0.1917209, 1, 1, 1, 1, 1,
0.4223033, 0.3475583, 0.1763581, 1, 1, 1, 1, 1,
0.4234215, -0.1038707, 1.715128, 1, 1, 1, 1, 1,
0.4253148, -0.3099004, 1.275903, 1, 1, 1, 1, 1,
0.4310898, -0.1675549, 0.05508549, 1, 1, 1, 1, 1,
0.4348617, -0.4885227, 0.9068117, 1, 1, 1, 1, 1,
0.4387943, 1.305356, 1.274283, 1, 1, 1, 1, 1,
0.4389458, -0.01941038, 0.5565906, 1, 1, 1, 1, 1,
0.4393173, -1.58453, 1.806457, 0, 0, 1, 1, 1,
0.4404199, 0.3232655, 1.140644, 1, 0, 0, 1, 1,
0.440582, -0.9625393, 2.295135, 1, 0, 0, 1, 1,
0.4433835, -1.101323, 2.474664, 1, 0, 0, 1, 1,
0.4456366, -1.758392, 2.484672, 1, 0, 0, 1, 1,
0.4481953, -0.7606547, 2.622449, 1, 0, 0, 1, 1,
0.4503649, -0.6479714, 1.991389, 0, 0, 0, 1, 1,
0.452536, -0.3159985, 3.112185, 0, 0, 0, 1, 1,
0.4559166, -0.08673071, 2.823198, 0, 0, 0, 1, 1,
0.4561666, -1.494466, 5.016466, 0, 0, 0, 1, 1,
0.45835, -1.111954, 0.7417797, 0, 0, 0, 1, 1,
0.4599417, -0.06283974, -0.9530821, 0, 0, 0, 1, 1,
0.4605535, 1.589146, 1.324281, 0, 0, 0, 1, 1,
0.4635467, -0.3464521, 4.487226, 1, 1, 1, 1, 1,
0.4665444, 2.058414, 2.47264, 1, 1, 1, 1, 1,
0.4677745, -2.025253, 2.90911, 1, 1, 1, 1, 1,
0.4680573, 1.466633, 1.248886, 1, 1, 1, 1, 1,
0.4713589, 1.25996, 0.07035462, 1, 1, 1, 1, 1,
0.4734854, -0.6428118, 2.070333, 1, 1, 1, 1, 1,
0.4942363, 0.6951786, -0.8883762, 1, 1, 1, 1, 1,
0.4965924, -1.932035, 2.261761, 1, 1, 1, 1, 1,
0.5010308, -1.074641, 3.265052, 1, 1, 1, 1, 1,
0.501278, 1.127573, 0.2320795, 1, 1, 1, 1, 1,
0.5025509, 1.139029, 1.35013, 1, 1, 1, 1, 1,
0.5058225, 1.065589, 0.7373677, 1, 1, 1, 1, 1,
0.5107719, 0.2087366, -0.1473355, 1, 1, 1, 1, 1,
0.5116048, -0.5945297, 3.313851, 1, 1, 1, 1, 1,
0.5151699, 0.6286879, 1.518867, 1, 1, 1, 1, 1,
0.5154592, 1.229999, 1.377667, 0, 0, 1, 1, 1,
0.5190725, -1.619327, 4.246727, 1, 0, 0, 1, 1,
0.5215158, -0.9561575, 2.316529, 1, 0, 0, 1, 1,
0.5219697, -0.1123385, 1.58729, 1, 0, 0, 1, 1,
0.5222234, 0.5348981, -0.8842851, 1, 0, 0, 1, 1,
0.5224249, 0.9372178, 0.52081, 1, 0, 0, 1, 1,
0.5299587, 0.6829845, 2.534601, 0, 0, 0, 1, 1,
0.5310996, -0.8593927, 2.251246, 0, 0, 0, 1, 1,
0.5319439, -0.4529621, 2.405914, 0, 0, 0, 1, 1,
0.537195, -1.123268, 3.144184, 0, 0, 0, 1, 1,
0.539932, -0.8972313, 0.8988296, 0, 0, 0, 1, 1,
0.5403729, -0.9969072, 3.152039, 0, 0, 0, 1, 1,
0.5429784, 0.08095344, 1.825244, 0, 0, 0, 1, 1,
0.5442748, 1.006531, 1.553342, 1, 1, 1, 1, 1,
0.5455923, 1.931364, 1.470805, 1, 1, 1, 1, 1,
0.5497912, -1.0477, 3.368328, 1, 1, 1, 1, 1,
0.5538085, 0.3932587, -0.9158121, 1, 1, 1, 1, 1,
0.5541005, 0.5732172, 1.105542, 1, 1, 1, 1, 1,
0.5564781, 0.7614027, 1.480011, 1, 1, 1, 1, 1,
0.559416, -0.1168681, 2.809509, 1, 1, 1, 1, 1,
0.5625988, -0.08349878, 3.493695, 1, 1, 1, 1, 1,
0.5641702, -0.1906015, 2.113264, 1, 1, 1, 1, 1,
0.5677012, 0.4717074, 1.441511, 1, 1, 1, 1, 1,
0.5698378, -0.8140011, 2.523573, 1, 1, 1, 1, 1,
0.5771499, 0.216793, 0.4279227, 1, 1, 1, 1, 1,
0.5845443, 0.01836612, 1.007071, 1, 1, 1, 1, 1,
0.590333, -0.7129555, 1.524123, 1, 1, 1, 1, 1,
0.5962404, -2.86004, 3.234743, 1, 1, 1, 1, 1,
0.5975298, 0.843274, 0.3345812, 0, 0, 1, 1, 1,
0.5976496, 0.06928944, 0.9344229, 1, 0, 0, 1, 1,
0.606757, -1.334942, 2.535594, 1, 0, 0, 1, 1,
0.6072798, -0.531195, 2.744945, 1, 0, 0, 1, 1,
0.6083114, 0.3296399, 0.5002828, 1, 0, 0, 1, 1,
0.6134277, -1.161024, 3.17742, 1, 0, 0, 1, 1,
0.6227216, -0.1302284, 1.207956, 0, 0, 0, 1, 1,
0.6286631, 0.7461218, 0.8126804, 0, 0, 0, 1, 1,
0.6303497, -0.6790178, 1.374522, 0, 0, 0, 1, 1,
0.6378155, 0.07607545, 1.836891, 0, 0, 0, 1, 1,
0.6414661, 0.5032641, 1.207239, 0, 0, 0, 1, 1,
0.6446269, 0.5735822, -0.293826, 0, 0, 0, 1, 1,
0.6497497, -1.443126, 3.02705, 0, 0, 0, 1, 1,
0.651763, -0.5262734, 1.658213, 1, 1, 1, 1, 1,
0.6589102, -0.1049574, 1.733695, 1, 1, 1, 1, 1,
0.6620878, 0.6563464, 0.5559671, 1, 1, 1, 1, 1,
0.663002, -1.327833, 2.509263, 1, 1, 1, 1, 1,
0.6636006, 1.066703, 0.4643432, 1, 1, 1, 1, 1,
0.6658785, 0.9727864, -0.20066, 1, 1, 1, 1, 1,
0.6667505, 1.651283, 0.09855016, 1, 1, 1, 1, 1,
0.6699339, -0.1880447, 1.536874, 1, 1, 1, 1, 1,
0.6721281, 1.359257, 0.9822204, 1, 1, 1, 1, 1,
0.6734948, 0.3063082, 3.096047, 1, 1, 1, 1, 1,
0.6744925, 1.655114, 0.3024575, 1, 1, 1, 1, 1,
0.67641, -0.196598, 1.131009, 1, 1, 1, 1, 1,
0.6771996, 1.37026, 0.9061144, 1, 1, 1, 1, 1,
0.6773921, -1.002617, 2.645176, 1, 1, 1, 1, 1,
0.677448, -0.2306095, 3.02035, 1, 1, 1, 1, 1,
0.6859148, -0.2470376, 2.584125, 0, 0, 1, 1, 1,
0.6936924, -0.339649, 1.760233, 1, 0, 0, 1, 1,
0.6938655, 1.396398, 0.2718318, 1, 0, 0, 1, 1,
0.6969995, 1.156726, 0.4768559, 1, 0, 0, 1, 1,
0.6983132, -0.1079733, 3.073061, 1, 0, 0, 1, 1,
0.6997028, 1.305933, 1.25626, 1, 0, 0, 1, 1,
0.7039613, -1.329255, 3.866815, 0, 0, 0, 1, 1,
0.704492, -1.87454, 2.195821, 0, 0, 0, 1, 1,
0.7055258, 0.3006772, 0.9403957, 0, 0, 0, 1, 1,
0.7069984, -1.519764, 3.949129, 0, 0, 0, 1, 1,
0.7195285, 2.806606, 2.842106, 0, 0, 0, 1, 1,
0.7205588, 1.533546, 0.3017507, 0, 0, 0, 1, 1,
0.7254153, -0.03701036, 0.5643027, 0, 0, 0, 1, 1,
0.7264946, -2.545955, 1.409119, 1, 1, 1, 1, 1,
0.7332093, -1.303218, 0.3040168, 1, 1, 1, 1, 1,
0.7350468, -0.8431775, 1.591977, 1, 1, 1, 1, 1,
0.7353395, -2.571415, 2.306957, 1, 1, 1, 1, 1,
0.7372856, -0.7226224, 2.637035, 1, 1, 1, 1, 1,
0.7390845, -2.865777, 2.224584, 1, 1, 1, 1, 1,
0.7431564, -1.980276, 0.4296295, 1, 1, 1, 1, 1,
0.7462288, 1.084111, 0.8594704, 1, 1, 1, 1, 1,
0.7501572, 0.521321, 0.2035396, 1, 1, 1, 1, 1,
0.7528899, -1.884987, 3.014766, 1, 1, 1, 1, 1,
0.7563772, 0.6268489, 0.9915993, 1, 1, 1, 1, 1,
0.7621758, -1.13517, 1.451235, 1, 1, 1, 1, 1,
0.7658479, -0.2020519, 1.762487, 1, 1, 1, 1, 1,
0.7681915, 1.260262, 0.05215919, 1, 1, 1, 1, 1,
0.7925423, -1.52723, 0.9681635, 1, 1, 1, 1, 1,
0.7932784, 1.513355, 0.66414, 0, 0, 1, 1, 1,
0.7965356, 0.5276219, 1.654123, 1, 0, 0, 1, 1,
0.7970624, 1.600074, 0.7548043, 1, 0, 0, 1, 1,
0.8030522, 1.709044, 0.09679012, 1, 0, 0, 1, 1,
0.8074266, 1.462681, -0.8074293, 1, 0, 0, 1, 1,
0.8081583, -0.1101404, 1.305737, 1, 0, 0, 1, 1,
0.8084976, -0.4304336, -0.200469, 0, 0, 0, 1, 1,
0.8120788, -1.114741, 2.879932, 0, 0, 0, 1, 1,
0.8161288, 0.5066054, -0.07133278, 0, 0, 0, 1, 1,
0.8234159, 2.178102, -0.2987748, 0, 0, 0, 1, 1,
0.8313096, 0.6205184, 0.9246693, 0, 0, 0, 1, 1,
0.8313271, 1.665472, -1.475067, 0, 0, 0, 1, 1,
0.8430064, -2.008278, 1.314118, 0, 0, 0, 1, 1,
0.8460149, 0.5761789, 0.4473519, 1, 1, 1, 1, 1,
0.8462448, 1.109531, 1.819121, 1, 1, 1, 1, 1,
0.8502952, 0.2020449, 0.5735728, 1, 1, 1, 1, 1,
0.8517742, 0.2295133, 0.2304848, 1, 1, 1, 1, 1,
0.8612555, 0.6494299, 0.4823685, 1, 1, 1, 1, 1,
0.871591, 0.5235699, 2.026509, 1, 1, 1, 1, 1,
0.8750178, 1.119237, 1.83847, 1, 1, 1, 1, 1,
0.8750383, -0.6649925, 2.620797, 1, 1, 1, 1, 1,
0.8758092, 0.3888732, 1.015942, 1, 1, 1, 1, 1,
0.8760639, 1.019043, 0.08783934, 1, 1, 1, 1, 1,
0.8839264, -0.6964428, 1.665265, 1, 1, 1, 1, 1,
0.8844622, -1.236724, 1.749355, 1, 1, 1, 1, 1,
0.8893278, -0.4079156, 1.806659, 1, 1, 1, 1, 1,
0.8894143, 1.426389, 1.684227, 1, 1, 1, 1, 1,
0.8924779, 0.1906369, 1.105675, 1, 1, 1, 1, 1,
0.8970648, -0.4944284, 2.254093, 0, 0, 1, 1, 1,
0.9009167, -0.2143418, 1.206564, 1, 0, 0, 1, 1,
0.9071212, 0.5185921, 1.002609, 1, 0, 0, 1, 1,
0.9129483, 1.080503, 0.8576028, 1, 0, 0, 1, 1,
0.9212454, 0.3998093, 0.5952895, 1, 0, 0, 1, 1,
0.9269525, -0.7975056, 2.742777, 1, 0, 0, 1, 1,
0.9291202, 0.792006, 0.863749, 0, 0, 0, 1, 1,
0.9308816, 0.3546981, 1.028492, 0, 0, 0, 1, 1,
0.941756, -0.2827417, 0.4898238, 0, 0, 0, 1, 1,
0.9422308, -0.09806245, 3.230244, 0, 0, 0, 1, 1,
0.9424929, 0.779002, -1.679546, 0, 0, 0, 1, 1,
0.9446244, 0.7507969, 2.934582, 0, 0, 0, 1, 1,
0.9523103, 0.9383861, 1.776613, 0, 0, 0, 1, 1,
0.9529022, -0.8518357, 1.80009, 1, 1, 1, 1, 1,
0.953656, 0.3759878, -0.07777841, 1, 1, 1, 1, 1,
0.9633048, -0.05485233, 0.5367914, 1, 1, 1, 1, 1,
0.9768643, 0.2135135, 1.321757, 1, 1, 1, 1, 1,
0.982206, 0.004545592, -0.5372186, 1, 1, 1, 1, 1,
0.9840103, -0.008104747, 0.8055081, 1, 1, 1, 1, 1,
0.9916189, -0.8679671, 3.177435, 1, 1, 1, 1, 1,
0.9931955, -1.273574, 4.012814, 1, 1, 1, 1, 1,
0.9944127, -1.07348, 3.001568, 1, 1, 1, 1, 1,
0.9954775, 0.3791898, 2.969833, 1, 1, 1, 1, 1,
1.000569, 0.62865, 1.732009, 1, 1, 1, 1, 1,
1.003544, -1.171304, 3.776596, 1, 1, 1, 1, 1,
1.005195, -0.3505187, 2.09813, 1, 1, 1, 1, 1,
1.006491, 0.9915656, -0.4509333, 1, 1, 1, 1, 1,
1.012323, -0.1396674, 0.076314, 1, 1, 1, 1, 1,
1.015163, -0.06602346, 2.549976, 0, 0, 1, 1, 1,
1.016056, -1.542313, 2.65997, 1, 0, 0, 1, 1,
1.017924, 1.589255, 0.9255434, 1, 0, 0, 1, 1,
1.018085, 1.196743, -0.05924532, 1, 0, 0, 1, 1,
1.022287, -0.1053839, 1.263221, 1, 0, 0, 1, 1,
1.025373, -0.3185655, 1.29167, 1, 0, 0, 1, 1,
1.03602, 1.249543, 1.155295, 0, 0, 0, 1, 1,
1.04124, 0.8606623, 1.418399, 0, 0, 0, 1, 1,
1.046751, -0.31284, 3.949272, 0, 0, 0, 1, 1,
1.0482, 0.8287301, 1.629729, 0, 0, 0, 1, 1,
1.055836, -1.051094, 3.158331, 0, 0, 0, 1, 1,
1.061856, -1.316603, 3.039176, 0, 0, 0, 1, 1,
1.062067, 1.436699, 0.01255117, 0, 0, 0, 1, 1,
1.06302, -0.2975118, 2.685794, 1, 1, 1, 1, 1,
1.063632, 0.7772554, 0.4697731, 1, 1, 1, 1, 1,
1.06469, 0.7206248, 1.16036, 1, 1, 1, 1, 1,
1.065362, 2.244016, 1.214547, 1, 1, 1, 1, 1,
1.066718, 1.530831, 0.5320649, 1, 1, 1, 1, 1,
1.071918, -1.346132, 1.326686, 1, 1, 1, 1, 1,
1.074107, -0.702845, 1.565847, 1, 1, 1, 1, 1,
1.08248, 1.264627, 0.360875, 1, 1, 1, 1, 1,
1.082736, -0.1433862, 2.130095, 1, 1, 1, 1, 1,
1.083019, 0.989803, 1.355322, 1, 1, 1, 1, 1,
1.084178, -0.2997642, 1.860595, 1, 1, 1, 1, 1,
1.084326, 0.9272591, 1.222802, 1, 1, 1, 1, 1,
1.08917, 1.570717, 1.362123, 1, 1, 1, 1, 1,
1.089837, -0.57013, 3.010471, 1, 1, 1, 1, 1,
1.096232, -0.6879269, 2.281846, 1, 1, 1, 1, 1,
1.102678, -0.1385412, 4.002689, 0, 0, 1, 1, 1,
1.104695, 0.3509198, 1.151908, 1, 0, 0, 1, 1,
1.112803, -1.298155, 0.4842246, 1, 0, 0, 1, 1,
1.113438, 1.166851, 0.338179, 1, 0, 0, 1, 1,
1.113477, -0.5248433, 2.201562, 1, 0, 0, 1, 1,
1.118518, 1.013423, -0.4071433, 1, 0, 0, 1, 1,
1.126424, 1.028531, 0.8104481, 0, 0, 0, 1, 1,
1.131973, -0.1838514, 1.802099, 0, 0, 0, 1, 1,
1.140118, 0.589434, -0.7870215, 0, 0, 0, 1, 1,
1.14243, 1.789173, 1.816426, 0, 0, 0, 1, 1,
1.144215, -0.8240703, 1.549759, 0, 0, 0, 1, 1,
1.146046, -1.16248, 3.651344, 0, 0, 0, 1, 1,
1.147343, 2.239984, 1.432258, 0, 0, 0, 1, 1,
1.148831, -0.138883, 0.2306092, 1, 1, 1, 1, 1,
1.150275, 0.4630202, 1.19976, 1, 1, 1, 1, 1,
1.151848, -0.231658, 1.592184, 1, 1, 1, 1, 1,
1.160155, 0.4289289, 0.5367287, 1, 1, 1, 1, 1,
1.169364, 2.525657, 0.1023417, 1, 1, 1, 1, 1,
1.17024, -0.01432792, 1.888484, 1, 1, 1, 1, 1,
1.170377, -0.082021, 1.930454, 1, 1, 1, 1, 1,
1.171019, -1.277124, 2.992748, 1, 1, 1, 1, 1,
1.173951, -0.003547732, 1.273233, 1, 1, 1, 1, 1,
1.176736, 0.553541, 2.009165, 1, 1, 1, 1, 1,
1.198538, -0.2263782, 1.066896, 1, 1, 1, 1, 1,
1.20484, 0.8527229, 1.011995, 1, 1, 1, 1, 1,
1.206483, 1.09386, 3.089236, 1, 1, 1, 1, 1,
1.212246, 0.4144163, 2.242399, 1, 1, 1, 1, 1,
1.215382, 0.04238174, 2.243829, 1, 1, 1, 1, 1,
1.233307, -0.3533202, 2.725976, 0, 0, 1, 1, 1,
1.236893, -0.8435169, 3.302863, 1, 0, 0, 1, 1,
1.241067, -1.23641, 2.1472, 1, 0, 0, 1, 1,
1.252786, -0.4009849, 1.881918, 1, 0, 0, 1, 1,
1.258176, -0.7309946, 2.851896, 1, 0, 0, 1, 1,
1.273914, 0.0408045, 1.162297, 1, 0, 0, 1, 1,
1.280634, -1.119304, 3.439709, 0, 0, 0, 1, 1,
1.285669, 1.058311, 1.128015, 0, 0, 0, 1, 1,
1.287297, 0.2766152, -0.2797783, 0, 0, 0, 1, 1,
1.294093, -0.8815212, 2.609037, 0, 0, 0, 1, 1,
1.299235, -1.352446, 1.148774, 0, 0, 0, 1, 1,
1.306083, 1.715147, 0.8450693, 0, 0, 0, 1, 1,
1.320791, -0.3776297, 1.338488, 0, 0, 0, 1, 1,
1.322711, -0.9783552, 0.9379031, 1, 1, 1, 1, 1,
1.338111, 0.8713401, 0.6076916, 1, 1, 1, 1, 1,
1.343362, -0.09682214, 0.1594993, 1, 1, 1, 1, 1,
1.347171, -0.7720885, 1.230425, 1, 1, 1, 1, 1,
1.347678, -1.442479, 2.277012, 1, 1, 1, 1, 1,
1.34985, 0.2116626, 2.249539, 1, 1, 1, 1, 1,
1.359729, 1.347717, 0.9232499, 1, 1, 1, 1, 1,
1.359846, 0.2370087, 1.354476, 1, 1, 1, 1, 1,
1.360356, -0.3187119, -0.01895509, 1, 1, 1, 1, 1,
1.362772, -0.005567506, 1.604234, 1, 1, 1, 1, 1,
1.362988, 2.000875, 1.398289, 1, 1, 1, 1, 1,
1.369007, 1.171615, -0.02032751, 1, 1, 1, 1, 1,
1.376809, 0.9044628, 0.8680308, 1, 1, 1, 1, 1,
1.387239, 0.5477986, 0.418045, 1, 1, 1, 1, 1,
1.393145, 1.235646, 1.648554, 1, 1, 1, 1, 1,
1.396191, 0.4817854, 1.517665, 0, 0, 1, 1, 1,
1.404243, 0.09160072, 3.794141, 1, 0, 0, 1, 1,
1.445449, -0.2111881, 2.516988, 1, 0, 0, 1, 1,
1.447192, 0.07853533, 1.485085, 1, 0, 0, 1, 1,
1.451523, -1.209157, 1.011519, 1, 0, 0, 1, 1,
1.459429, 2.262206, 0.4391719, 1, 0, 0, 1, 1,
1.47203, 2.046775, 0.5018845, 0, 0, 0, 1, 1,
1.474909, -1.269672, 3.359901, 0, 0, 0, 1, 1,
1.485548, 1.269269, 2.010092, 0, 0, 0, 1, 1,
1.494807, 0.8151845, 3.112715, 0, 0, 0, 1, 1,
1.503997, -0.0363405, 1.793715, 0, 0, 0, 1, 1,
1.509701, 0.01058639, 0.9406079, 0, 0, 0, 1, 1,
1.513992, 0.6864471, 1.244088, 0, 0, 0, 1, 1,
1.516826, 0.4685228, 0.6369238, 1, 1, 1, 1, 1,
1.528744, -1.286164, 2.869575, 1, 1, 1, 1, 1,
1.528875, -1.227851, 1.53719, 1, 1, 1, 1, 1,
1.539274, -0.508505, 2.699142, 1, 1, 1, 1, 1,
1.554331, 1.761641, 0.8302487, 1, 1, 1, 1, 1,
1.570425, 0.916091, 1.248492, 1, 1, 1, 1, 1,
1.578557, -1.775427, 2.188797, 1, 1, 1, 1, 1,
1.579372, -0.7448746, 3.138806, 1, 1, 1, 1, 1,
1.591954, 0.3515034, 2.406065, 1, 1, 1, 1, 1,
1.597643, 0.260187, 2.490697, 1, 1, 1, 1, 1,
1.619247, -0.3705362, 1.816052, 1, 1, 1, 1, 1,
1.633646, 0.5924977, 0.4430819, 1, 1, 1, 1, 1,
1.63397, -0.9724134, 2.85064, 1, 1, 1, 1, 1,
1.634581, 0.2053948, 2.794314, 1, 1, 1, 1, 1,
1.661092, 2.401938, 0.3137892, 1, 1, 1, 1, 1,
1.663256, -0.5904025, 1.699535, 0, 0, 1, 1, 1,
1.712998, -0.8689796, 3.570619, 1, 0, 0, 1, 1,
1.723617, 0.703119, -0.3511533, 1, 0, 0, 1, 1,
1.730179, -0.4010811, 2.263392, 1, 0, 0, 1, 1,
1.740839, 0.4852301, 3.181243, 1, 0, 0, 1, 1,
1.741134, -1.203324, 0.8447297, 1, 0, 0, 1, 1,
1.75623, 1.226309, 0.7036481, 0, 0, 0, 1, 1,
1.762903, 0.5177671, 2.859114, 0, 0, 0, 1, 1,
1.779433, 0.1539034, 1.214275, 0, 0, 0, 1, 1,
1.779831, 0.9927565, 2.122725, 0, 0, 0, 1, 1,
1.803997, -0.5427006, 2.79782, 0, 0, 0, 1, 1,
1.805604, 0.8795873, 0.2195666, 0, 0, 0, 1, 1,
1.819447, -0.06665548, 2.629671, 0, 0, 0, 1, 1,
1.846299, -0.6634582, 2.625515, 1, 1, 1, 1, 1,
1.876966, -0.1938286, 1.839436, 1, 1, 1, 1, 1,
1.889573, -0.9718925, 1.991229, 1, 1, 1, 1, 1,
1.889786, -0.9243835, 2.491068, 1, 1, 1, 1, 1,
1.93172, -0.6630449, 3.189084, 1, 1, 1, 1, 1,
1.953622, -0.4908807, 2.726388, 1, 1, 1, 1, 1,
1.965474, -0.8579114, 1.56996, 1, 1, 1, 1, 1,
1.974377, -1.076739, 0.7656679, 1, 1, 1, 1, 1,
1.996814, 1.786795, 1.206972, 1, 1, 1, 1, 1,
2.008349, -0.1766633, 1.063347, 1, 1, 1, 1, 1,
2.040859, -0.4691818, 2.585002, 1, 1, 1, 1, 1,
2.053844, -0.1007946, 2.964202, 1, 1, 1, 1, 1,
2.063774, 1.098639, -0.2155003, 1, 1, 1, 1, 1,
2.085289, 0.1531405, 2.196536, 1, 1, 1, 1, 1,
2.093174, -0.7410212, 1.377117, 1, 1, 1, 1, 1,
2.106406, 0.1699768, 0.3139816, 0, 0, 1, 1, 1,
2.112866, -1.173742, 2.588614, 1, 0, 0, 1, 1,
2.135613, -0.05307579, 0.4840945, 1, 0, 0, 1, 1,
2.169434, -1.024292, 2.39239, 1, 0, 0, 1, 1,
2.201404, 0.5391253, -0.5095899, 1, 0, 0, 1, 1,
2.221878, 0.3033949, -0.06875844, 1, 0, 0, 1, 1,
2.251508, 0.217538, 1.199824, 0, 0, 0, 1, 1,
2.267717, 1.715304, 1.563627, 0, 0, 0, 1, 1,
2.379289, 0.5735902, 0.1671436, 0, 0, 0, 1, 1,
2.416383, -0.315981, 3.310816, 0, 0, 0, 1, 1,
2.486382, -0.8681644, 2.356573, 0, 0, 0, 1, 1,
2.502007, -0.3410756, 1.554764, 0, 0, 0, 1, 1,
2.507605, -0.8573897, 1.756713, 0, 0, 0, 1, 1,
2.606681, -0.606671, 2.149568, 1, 1, 1, 1, 1,
2.748649, -1.494928, 3.723423, 1, 1, 1, 1, 1,
2.754758, -1.093283, 3.310222, 1, 1, 1, 1, 1,
2.780913, 0.4974892, 0.07908124, 1, 1, 1, 1, 1,
2.781384, -1.202573, 1.796886, 1, 1, 1, 1, 1,
2.972655, -0.889777, 0.09160917, 1, 1, 1, 1, 1,
3.113811, 0.2617076, 2.433434, 1, 1, 1, 1, 1
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
var radius = 9.338977;
var distance = 32.80276;
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
mvMatrix.translate( -0.07395041, -0.03776348, 0.318867 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.80276);
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