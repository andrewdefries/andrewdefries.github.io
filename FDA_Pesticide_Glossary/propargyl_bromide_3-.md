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
-3.104434, -0.3352018, -3.385696, 1, 0, 0, 1,
-3.034919, 1.930441, -0.7850898, 1, 0.007843138, 0, 1,
-2.665221, -1.626511, -2.336769, 1, 0.01176471, 0, 1,
-2.619774, -0.887148, -3.839695, 1, 0.01960784, 0, 1,
-2.601899, 0.465503, -0.479536, 1, 0.02352941, 0, 1,
-2.504017, 1.384372, -0.04314531, 1, 0.03137255, 0, 1,
-2.484241, -0.5816495, -1.730602, 1, 0.03529412, 0, 1,
-2.444117, -0.1882265, -1.758577, 1, 0.04313726, 0, 1,
-2.425123, -1.553866, -1.459185, 1, 0.04705882, 0, 1,
-2.389417, 0.4779701, -0.6563029, 1, 0.05490196, 0, 1,
-2.287848, -1.068452, 0.2320615, 1, 0.05882353, 0, 1,
-2.283917, -0.112721, -2.476271, 1, 0.06666667, 0, 1,
-2.246316, -0.6089429, -2.535982, 1, 0.07058824, 0, 1,
-2.208545, 1.104348, -0.2669796, 1, 0.07843138, 0, 1,
-2.208028, 0.268154, 0.9164059, 1, 0.08235294, 0, 1,
-2.087055, -0.2843726, -1.206386, 1, 0.09019608, 0, 1,
-2.017611, -0.07168237, -1.850175, 1, 0.09411765, 0, 1,
-1.955439, 0.9830322, 0.4534961, 1, 0.1019608, 0, 1,
-1.937, -0.3935215, -2.729928, 1, 0.1098039, 0, 1,
-1.929934, -1.509516, -1.704811, 1, 0.1137255, 0, 1,
-1.899218, -1.895603, -3.8638, 1, 0.1215686, 0, 1,
-1.816807, 0.3210869, -0.5239506, 1, 0.1254902, 0, 1,
-1.785775, 1.230287, -1.665989, 1, 0.1333333, 0, 1,
-1.782379, -0.1471308, -0.9958812, 1, 0.1372549, 0, 1,
-1.78067, 0.1367925, -0.4635157, 1, 0.145098, 0, 1,
-1.777307, -0.9539588, -0.4341605, 1, 0.1490196, 0, 1,
-1.772815, 0.03465622, -0.7496731, 1, 0.1568628, 0, 1,
-1.758125, 0.9081348, -0.5616046, 1, 0.1607843, 0, 1,
-1.757288, 0.3332378, 0.03377469, 1, 0.1686275, 0, 1,
-1.756269, 2.357816, -0.2765654, 1, 0.172549, 0, 1,
-1.737045, 0.202452, -2.496862, 1, 0.1803922, 0, 1,
-1.736263, -0.8223174, -2.194428, 1, 0.1843137, 0, 1,
-1.729205, 0.8222447, -0.2404923, 1, 0.1921569, 0, 1,
-1.71079, -0.1773804, 1.364264, 1, 0.1960784, 0, 1,
-1.709429, 0.1539785, -1.340672, 1, 0.2039216, 0, 1,
-1.69858, -0.1731808, 0.5376589, 1, 0.2117647, 0, 1,
-1.685698, -1.487538, -1.907053, 1, 0.2156863, 0, 1,
-1.683556, -0.06008299, 1.607435, 1, 0.2235294, 0, 1,
-1.652563, -1.292041, -1.260677, 1, 0.227451, 0, 1,
-1.651985, 1.887164, -1.588909, 1, 0.2352941, 0, 1,
-1.646636, 0.3173857, -2.368315, 1, 0.2392157, 0, 1,
-1.62916, -1.702452, -1.705969, 1, 0.2470588, 0, 1,
-1.627612, -0.4726532, -1.386162, 1, 0.2509804, 0, 1,
-1.624643, -1.115893, -3.264436, 1, 0.2588235, 0, 1,
-1.596244, -0.6567964, -1.90743, 1, 0.2627451, 0, 1,
-1.574049, -1.40154, -2.857111, 1, 0.2705882, 0, 1,
-1.573753, -2.440786, -2.002578, 1, 0.2745098, 0, 1,
-1.563423, 0.9338683, -0.9583417, 1, 0.282353, 0, 1,
-1.563311, 0.1035064, -0.606241, 1, 0.2862745, 0, 1,
-1.555281, 0.6024137, -0.5632786, 1, 0.2941177, 0, 1,
-1.534608, -0.739796, -2.552879, 1, 0.3019608, 0, 1,
-1.520458, 0.03088117, -2.408029, 1, 0.3058824, 0, 1,
-1.518147, 1.15397, -1.325351, 1, 0.3137255, 0, 1,
-1.513075, 2.831505, 0.7997719, 1, 0.3176471, 0, 1,
-1.498352, -0.6025163, -1.856359, 1, 0.3254902, 0, 1,
-1.496951, 1.051411, 0.1422631, 1, 0.3294118, 0, 1,
-1.494643, -0.18226, -0.8943684, 1, 0.3372549, 0, 1,
-1.481901, -0.9704988, -1.532641, 1, 0.3411765, 0, 1,
-1.473457, -0.9911489, -3.062867, 1, 0.3490196, 0, 1,
-1.471935, 0.7787527, -1.511371, 1, 0.3529412, 0, 1,
-1.451997, -0.4635261, -2.873401, 1, 0.3607843, 0, 1,
-1.427106, 0.9673382, -1.922187, 1, 0.3647059, 0, 1,
-1.425667, 0.8510675, -1.900846, 1, 0.372549, 0, 1,
-1.413743, -1.021374, -1.237069, 1, 0.3764706, 0, 1,
-1.407663, 0.7086418, -2.010497, 1, 0.3843137, 0, 1,
-1.405099, -0.03959184, -0.4475717, 1, 0.3882353, 0, 1,
-1.39695, 0.8778899, -1.703316, 1, 0.3960784, 0, 1,
-1.396374, -1.213954, 0.09630085, 1, 0.4039216, 0, 1,
-1.394803, -1.828624, -3.223394, 1, 0.4078431, 0, 1,
-1.387316, -0.3906863, -1.165452, 1, 0.4156863, 0, 1,
-1.374381, -0.5111591, -1.309983, 1, 0.4196078, 0, 1,
-1.374081, -0.8930445, -1.023252, 1, 0.427451, 0, 1,
-1.363564, 1.866618, -1.121134, 1, 0.4313726, 0, 1,
-1.356331, -0.8624991, -2.332808, 1, 0.4392157, 0, 1,
-1.355499, -1.048272, -3.449965, 1, 0.4431373, 0, 1,
-1.353826, -0.7129062, -1.190797, 1, 0.4509804, 0, 1,
-1.34902, 0.4321594, -1.196097, 1, 0.454902, 0, 1,
-1.342304, -1.328675, -2.054342, 1, 0.4627451, 0, 1,
-1.340938, 1.787885, -2.293103, 1, 0.4666667, 0, 1,
-1.334534, 0.2749442, -0.9880413, 1, 0.4745098, 0, 1,
-1.334042, 0.8393423, 0.1185878, 1, 0.4784314, 0, 1,
-1.329082, 0.3789139, -2.185906, 1, 0.4862745, 0, 1,
-1.326029, -0.142027, -0.9597757, 1, 0.4901961, 0, 1,
-1.321765, -0.4468434, -2.179414, 1, 0.4980392, 0, 1,
-1.319543, -0.23796, -2.511429, 1, 0.5058824, 0, 1,
-1.311425, 0.7539315, -2.348435, 1, 0.509804, 0, 1,
-1.298388, 0.1337856, -1.980443, 1, 0.5176471, 0, 1,
-1.295141, -0.3691523, -1.019039, 1, 0.5215687, 0, 1,
-1.294139, 0.3918314, -1.792736, 1, 0.5294118, 0, 1,
-1.293128, -1.167956, -3.46577, 1, 0.5333334, 0, 1,
-1.291962, -0.6107627, -2.78997, 1, 0.5411765, 0, 1,
-1.285722, 1.575072, -0.6415854, 1, 0.5450981, 0, 1,
-1.277035, -1.154795, -1.513968, 1, 0.5529412, 0, 1,
-1.267343, -1.92607, -1.709008, 1, 0.5568628, 0, 1,
-1.264456, -0.621866, -3.466549, 1, 0.5647059, 0, 1,
-1.25907, 1.699827, -1.818578, 1, 0.5686275, 0, 1,
-1.250095, -0.8707209, -2.580107, 1, 0.5764706, 0, 1,
-1.245679, 0.9854461, 0.8367593, 1, 0.5803922, 0, 1,
-1.234319, 0.7189716, -0.4497381, 1, 0.5882353, 0, 1,
-1.227942, 0.7152925, -1.839499, 1, 0.5921569, 0, 1,
-1.226174, 0.3501147, -2.368819, 1, 0.6, 0, 1,
-1.226054, -0.1288399, -3.127083, 1, 0.6078432, 0, 1,
-1.224936, 0.1672755, -1.74925, 1, 0.6117647, 0, 1,
-1.22418, -0.3758536, -3.077771, 1, 0.6196079, 0, 1,
-1.218241, 0.1287307, -0.6565905, 1, 0.6235294, 0, 1,
-1.206213, -0.5093969, -0.5476984, 1, 0.6313726, 0, 1,
-1.200738, 1.638302, -1.573705, 1, 0.6352941, 0, 1,
-1.20069, 1.171267, -0.7779515, 1, 0.6431373, 0, 1,
-1.198432, 0.7727698, -0.5172599, 1, 0.6470588, 0, 1,
-1.196874, 0.7332694, -0.6915152, 1, 0.654902, 0, 1,
-1.192609, -0.7550755, -2.430028, 1, 0.6588235, 0, 1,
-1.192083, 0.4859241, 0.6814498, 1, 0.6666667, 0, 1,
-1.189835, -0.4374415, 0.08900659, 1, 0.6705883, 0, 1,
-1.184771, 0.3519064, -0.703256, 1, 0.6784314, 0, 1,
-1.178146, 0.2803679, -3.508671, 1, 0.682353, 0, 1,
-1.176487, -0.3910015, -2.025828, 1, 0.6901961, 0, 1,
-1.17033, -0.2265466, -1.150749, 1, 0.6941177, 0, 1,
-1.163863, 0.08199368, -2.873332, 1, 0.7019608, 0, 1,
-1.163403, 0.727097, -0.5175356, 1, 0.7098039, 0, 1,
-1.15496, -1.3067, -1.824429, 1, 0.7137255, 0, 1,
-1.150673, 1.753981, -1.138996, 1, 0.7215686, 0, 1,
-1.149941, 1.506136, -1.285514, 1, 0.7254902, 0, 1,
-1.149884, -0.3887489, -0.3288463, 1, 0.7333333, 0, 1,
-1.148771, -0.8580933, -3.506168, 1, 0.7372549, 0, 1,
-1.147126, 2.074313, -1.447954, 1, 0.7450981, 0, 1,
-1.144858, -1.340398, -2.657676, 1, 0.7490196, 0, 1,
-1.142738, -0.8961566, -1.430762, 1, 0.7568628, 0, 1,
-1.142624, -1.159405, -4.333782, 1, 0.7607843, 0, 1,
-1.141918, -0.8628583, -2.279054, 1, 0.7686275, 0, 1,
-1.136938, 0.2404044, -0.002465455, 1, 0.772549, 0, 1,
-1.132033, 1.451535, -0.4564149, 1, 0.7803922, 0, 1,
-1.128816, 1.052204, -1.628259, 1, 0.7843137, 0, 1,
-1.12686, 0.5148921, -1.040172, 1, 0.7921569, 0, 1,
-1.126027, 0.003411302, -1.403172, 1, 0.7960784, 0, 1,
-1.125801, -2.389682, -0.5321126, 1, 0.8039216, 0, 1,
-1.109667, -0.3347624, -1.765012, 1, 0.8117647, 0, 1,
-1.102059, 1.32214, -1.115055, 1, 0.8156863, 0, 1,
-1.099102, 0.07795833, -3.183985, 1, 0.8235294, 0, 1,
-1.098795, -0.8486534, -2.593938, 1, 0.827451, 0, 1,
-1.096457, 0.6737447, -0.6143234, 1, 0.8352941, 0, 1,
-1.094371, -0.5085618, -1.880785, 1, 0.8392157, 0, 1,
-1.093915, 0.01425426, -1.643475, 1, 0.8470588, 0, 1,
-1.080764, 0.3908019, -0.6224728, 1, 0.8509804, 0, 1,
-1.077161, 0.9951379, -1.527445, 1, 0.8588235, 0, 1,
-1.058699, 0.8558441, 0.07066318, 1, 0.8627451, 0, 1,
-1.058303, 0.02020949, -0.5842677, 1, 0.8705882, 0, 1,
-1.049892, 0.45582, -1.082315, 1, 0.8745098, 0, 1,
-1.048707, -0.6159773, -3.788914, 1, 0.8823529, 0, 1,
-1.046887, -0.0801472, -0.9510279, 1, 0.8862745, 0, 1,
-1.044869, 1.399307, -0.8845891, 1, 0.8941177, 0, 1,
-1.036633, 1.401748, 0.1197546, 1, 0.8980392, 0, 1,
-1.02583, -0.8519915, -3.665427, 1, 0.9058824, 0, 1,
-1.025318, -0.05094284, -1.810327, 1, 0.9137255, 0, 1,
-1.021034, -0.6995524, -1.490106, 1, 0.9176471, 0, 1,
-1.020934, 0.445417, -0.4058301, 1, 0.9254902, 0, 1,
-1.015539, 0.1897407, 0.04150133, 1, 0.9294118, 0, 1,
-1.014564, 0.6547002, -1.395266, 1, 0.9372549, 0, 1,
-1.012, 1.257879, -0.2415619, 1, 0.9411765, 0, 1,
-1.011816, -0.08439471, -3.448462, 1, 0.9490196, 0, 1,
-1.009404, -0.9435257, -2.428627, 1, 0.9529412, 0, 1,
-1.006753, -0.560837, -2.155614, 1, 0.9607843, 0, 1,
-1.001904, 2.533445, -0.9596559, 1, 0.9647059, 0, 1,
-0.9996433, -0.3885233, -1.162751, 1, 0.972549, 0, 1,
-0.9930911, -1.188658, -2.310034, 1, 0.9764706, 0, 1,
-0.9874991, 0.4296561, -1.72813, 1, 0.9843137, 0, 1,
-0.9868354, 0.5602782, -1.053791, 1, 0.9882353, 0, 1,
-0.9865345, 0.2112502, -3.227827, 1, 0.9960784, 0, 1,
-0.9784088, 0.9813601, -0.3228075, 0.9960784, 1, 0, 1,
-0.9781448, -0.0302042, -1.314117, 0.9921569, 1, 0, 1,
-0.9729593, 1.173132, 1.290148, 0.9843137, 1, 0, 1,
-0.9682242, 1.046521, 1.089542, 0.9803922, 1, 0, 1,
-0.966854, -0.9708282, -0.2471745, 0.972549, 1, 0, 1,
-0.9655959, 0.7374983, -0.9057978, 0.9686275, 1, 0, 1,
-0.9559662, 2.114276, -0.05190433, 0.9607843, 1, 0, 1,
-0.9500067, 0.4730717, -0.2696389, 0.9568627, 1, 0, 1,
-0.9492572, 1.314117, -0.05629371, 0.9490196, 1, 0, 1,
-0.9340531, 0.009188707, -2.005561, 0.945098, 1, 0, 1,
-0.9288397, 1.912132, -1.928485, 0.9372549, 1, 0, 1,
-0.9271917, -1.626878, -3.600441, 0.9333333, 1, 0, 1,
-0.9241155, 0.6756464, -1.104736, 0.9254902, 1, 0, 1,
-0.9215994, 1.273595, 1.08686, 0.9215686, 1, 0, 1,
-0.9150521, -0.2859797, -2.934751, 0.9137255, 1, 0, 1,
-0.9102259, -0.3484635, -3.492267, 0.9098039, 1, 0, 1,
-0.9100952, 0.293521, -0.8695027, 0.9019608, 1, 0, 1,
-0.9073836, -0.1580607, -3.200454, 0.8941177, 1, 0, 1,
-0.9046502, -2.720993, -2.542396, 0.8901961, 1, 0, 1,
-0.9036957, 1.213519, 0.01799405, 0.8823529, 1, 0, 1,
-0.9002996, -0.1978599, -2.633307, 0.8784314, 1, 0, 1,
-0.8981799, 1.190933, -1.141395, 0.8705882, 1, 0, 1,
-0.888465, -0.822995, -1.890928, 0.8666667, 1, 0, 1,
-0.8879473, -0.1991505, -2.181031, 0.8588235, 1, 0, 1,
-0.8848122, 3.472063, 0.7442932, 0.854902, 1, 0, 1,
-0.8735967, 0.8226647, 0.2210639, 0.8470588, 1, 0, 1,
-0.8717512, 0.09186805, -0.8055381, 0.8431373, 1, 0, 1,
-0.8656039, 1.176589, -0.5470021, 0.8352941, 1, 0, 1,
-0.8638796, 0.395277, -2.461895, 0.8313726, 1, 0, 1,
-0.8632858, -0.3100333, -4.000487, 0.8235294, 1, 0, 1,
-0.8589157, -0.5211684, -2.539144, 0.8196079, 1, 0, 1,
-0.8531145, -1.439092, -2.583112, 0.8117647, 1, 0, 1,
-0.8496468, -1.12411, -1.463268, 0.8078431, 1, 0, 1,
-0.8493284, -0.05204929, -4.187667, 0.8, 1, 0, 1,
-0.8491331, -0.4268531, -0.8779077, 0.7921569, 1, 0, 1,
-0.8271649, -0.1214617, -2.094838, 0.7882353, 1, 0, 1,
-0.8191559, 1.092131, 0.3983349, 0.7803922, 1, 0, 1,
-0.8144122, -1.272993, -4.161607, 0.7764706, 1, 0, 1,
-0.8125247, -0.2817996, -1.41953, 0.7686275, 1, 0, 1,
-0.8056132, -0.4358771, -2.384002, 0.7647059, 1, 0, 1,
-0.8035415, -0.009253638, -0.7476838, 0.7568628, 1, 0, 1,
-0.8032555, 0.1808465, -1.263949, 0.7529412, 1, 0, 1,
-0.7918993, 0.8793521, 0.9853124, 0.7450981, 1, 0, 1,
-0.787468, -1.09909, -0.7072686, 0.7411765, 1, 0, 1,
-0.7851672, 2.197006, 0.07040449, 0.7333333, 1, 0, 1,
-0.7834347, 0.9989805, -2.097479, 0.7294118, 1, 0, 1,
-0.7830336, 1.405092, -1.995654, 0.7215686, 1, 0, 1,
-0.7808446, -0.5095704, -1.700306, 0.7176471, 1, 0, 1,
-0.7808113, 0.883049, -1.214373, 0.7098039, 1, 0, 1,
-0.7718348, 1.382183, -2.724436, 0.7058824, 1, 0, 1,
-0.7712242, 0.1680083, 0.4783396, 0.6980392, 1, 0, 1,
-0.7682363, -1.145711, -1.983618, 0.6901961, 1, 0, 1,
-0.7662407, -1.50311, -1.082543, 0.6862745, 1, 0, 1,
-0.762118, -0.6676961, -2.668817, 0.6784314, 1, 0, 1,
-0.7620128, 0.8127557, -1.542068, 0.6745098, 1, 0, 1,
-0.7613533, 2.054024, 1.0365, 0.6666667, 1, 0, 1,
-0.759228, 0.4473537, -1.051228, 0.6627451, 1, 0, 1,
-0.7589988, -0.09089781, -2.105815, 0.654902, 1, 0, 1,
-0.7562686, 0.5391935, -1.733729, 0.6509804, 1, 0, 1,
-0.755006, -0.2114542, -1.352949, 0.6431373, 1, 0, 1,
-0.7549813, -0.2227676, -1.499429, 0.6392157, 1, 0, 1,
-0.7491723, 0.7572605, 0.7447044, 0.6313726, 1, 0, 1,
-0.747273, 0.1035362, -1.735451, 0.627451, 1, 0, 1,
-0.7436722, 3.647181, 0.2681113, 0.6196079, 1, 0, 1,
-0.7365115, -1.414036, -3.202918, 0.6156863, 1, 0, 1,
-0.726166, 0.2908455, -2.415406, 0.6078432, 1, 0, 1,
-0.7225643, -1.324281, -2.946111, 0.6039216, 1, 0, 1,
-0.7144411, -1.968064, -3.422085, 0.5960785, 1, 0, 1,
-0.7124841, 0.4973109, -0.5248718, 0.5882353, 1, 0, 1,
-0.7079265, -0.7965359, -3.41373, 0.5843138, 1, 0, 1,
-0.7023919, 1.917671, 0.345432, 0.5764706, 1, 0, 1,
-0.6930644, 0.5302753, -1.634438, 0.572549, 1, 0, 1,
-0.689434, 0.3907914, -1.585925, 0.5647059, 1, 0, 1,
-0.6781913, 1.771745, -2.01876, 0.5607843, 1, 0, 1,
-0.6761208, 0.7778112, -1.963675, 0.5529412, 1, 0, 1,
-0.676007, -0.4134851, -1.849296, 0.5490196, 1, 0, 1,
-0.6753229, -0.5118623, -1.627362, 0.5411765, 1, 0, 1,
-0.6746768, 0.1278325, 0.5199955, 0.5372549, 1, 0, 1,
-0.6742772, -0.6749645, -2.427656, 0.5294118, 1, 0, 1,
-0.6730816, 0.5202197, -0.9132309, 0.5254902, 1, 0, 1,
-0.67212, 0.5759422, -1.076589, 0.5176471, 1, 0, 1,
-0.6610191, 0.09602272, -1.208722, 0.5137255, 1, 0, 1,
-0.6518174, -0.4339488, -2.212118, 0.5058824, 1, 0, 1,
-0.6485534, 1.349131, 1.901839, 0.5019608, 1, 0, 1,
-0.6418809, 0.6947067, -1.423894, 0.4941176, 1, 0, 1,
-0.6352826, -1.000471, -2.728396, 0.4862745, 1, 0, 1,
-0.6305305, -1.172401, -3.34188, 0.4823529, 1, 0, 1,
-0.627834, -0.4890207, -1.400048, 0.4745098, 1, 0, 1,
-0.6258914, 2.098464, -0.9942821, 0.4705882, 1, 0, 1,
-0.6196552, -0.09916455, -2.288329, 0.4627451, 1, 0, 1,
-0.6156431, -0.437131, -3.120476, 0.4588235, 1, 0, 1,
-0.614564, 0.6696978, -1.371018, 0.4509804, 1, 0, 1,
-0.6130894, -0.8395982, -0.9406271, 0.4470588, 1, 0, 1,
-0.6085209, 1.172166, -0.4854271, 0.4392157, 1, 0, 1,
-0.6049901, -1.597938, -3.817773, 0.4352941, 1, 0, 1,
-0.60465, -0.8059543, -2.031512, 0.427451, 1, 0, 1,
-0.6037517, 0.504667, 0.2251133, 0.4235294, 1, 0, 1,
-0.6029577, -0.3148033, -2.96057, 0.4156863, 1, 0, 1,
-0.6013612, -1.140265, -0.7269591, 0.4117647, 1, 0, 1,
-0.5998507, -0.1476001, -0.5638524, 0.4039216, 1, 0, 1,
-0.5928838, -0.8244177, -3.342239, 0.3960784, 1, 0, 1,
-0.5896183, -0.4984442, -2.141081, 0.3921569, 1, 0, 1,
-0.5880836, -0.7670354, -3.329204, 0.3843137, 1, 0, 1,
-0.5856597, 0.655774, 1.337226, 0.3803922, 1, 0, 1,
-0.5842097, 1.024498, -1.196289, 0.372549, 1, 0, 1,
-0.5736815, -0.3438987, -1.498122, 0.3686275, 1, 0, 1,
-0.5726885, 1.01275, 0.6273264, 0.3607843, 1, 0, 1,
-0.572431, -1.332511, -3.231987, 0.3568628, 1, 0, 1,
-0.5707376, -0.004564052, -0.0580117, 0.3490196, 1, 0, 1,
-0.5684665, -1.435867, -2.853734, 0.345098, 1, 0, 1,
-0.5659692, -0.1716842, -0.8132581, 0.3372549, 1, 0, 1,
-0.5636458, -1.592236, -3.538907, 0.3333333, 1, 0, 1,
-0.5628307, -1.622157, -2.654148, 0.3254902, 1, 0, 1,
-0.5542362, 1.115928, -1.144985, 0.3215686, 1, 0, 1,
-0.5540805, -0.6664629, -2.205076, 0.3137255, 1, 0, 1,
-0.5536391, 0.7184621, -2.103256, 0.3098039, 1, 0, 1,
-0.5531396, -0.7839655, -1.759548, 0.3019608, 1, 0, 1,
-0.5515796, 0.0138223, -3.407033, 0.2941177, 1, 0, 1,
-0.5489071, -0.7198646, -3.064597, 0.2901961, 1, 0, 1,
-0.5462784, 0.1603079, -0.8015957, 0.282353, 1, 0, 1,
-0.5445114, 0.04133033, -3.822918, 0.2784314, 1, 0, 1,
-0.5412598, -0.8010259, -2.425227, 0.2705882, 1, 0, 1,
-0.5387141, -0.3107552, -3.004314, 0.2666667, 1, 0, 1,
-0.5257938, 0.5610931, -0.0684425, 0.2588235, 1, 0, 1,
-0.5177924, -1.196212, -2.684304, 0.254902, 1, 0, 1,
-0.5167671, 1.469689, -1.10892, 0.2470588, 1, 0, 1,
-0.5153753, 0.4257441, -0.1059942, 0.2431373, 1, 0, 1,
-0.5115789, 1.045502, -1.76688, 0.2352941, 1, 0, 1,
-0.5113016, 1.296054, -0.6948245, 0.2313726, 1, 0, 1,
-0.510645, 1.640239, 1.195288, 0.2235294, 1, 0, 1,
-0.510007, 1.604141, -0.913161, 0.2196078, 1, 0, 1,
-0.509254, -0.1063843, -0.9296411, 0.2117647, 1, 0, 1,
-0.5067849, 0.4120146, -2.244819, 0.2078431, 1, 0, 1,
-0.5054305, -1.477658, -3.452826, 0.2, 1, 0, 1,
-0.5022945, 0.4710112, 0.6935349, 0.1921569, 1, 0, 1,
-0.4987244, 0.4532064, 2.946929, 0.1882353, 1, 0, 1,
-0.4948431, -0.6972626, -4.685039, 0.1803922, 1, 0, 1,
-0.4925274, 2.253525, 0.6556497, 0.1764706, 1, 0, 1,
-0.4923456, -0.3731568, -1.563449, 0.1686275, 1, 0, 1,
-0.4836828, -0.5005386, -2.269109, 0.1647059, 1, 0, 1,
-0.4813968, 0.5410638, -0.8888796, 0.1568628, 1, 0, 1,
-0.4812543, 0.8899007, -0.4564475, 0.1529412, 1, 0, 1,
-0.4808514, 0.5029166, -3.076289, 0.145098, 1, 0, 1,
-0.4789416, -0.6171684, -3.206622, 0.1411765, 1, 0, 1,
-0.474568, -1.379299, -3.317886, 0.1333333, 1, 0, 1,
-0.4720502, 0.2789818, -1.809795, 0.1294118, 1, 0, 1,
-0.4673654, -0.3873011, -1.914861, 0.1215686, 1, 0, 1,
-0.4657812, 1.451667, -0.7921954, 0.1176471, 1, 0, 1,
-0.4613315, -0.1707129, -0.4931215, 0.1098039, 1, 0, 1,
-0.4562361, 2.302583, 0.5631238, 0.1058824, 1, 0, 1,
-0.4545931, -1.345948, -2.991778, 0.09803922, 1, 0, 1,
-0.4518691, -0.7236256, -3.199871, 0.09019608, 1, 0, 1,
-0.4499389, -1.182008, -1.899308, 0.08627451, 1, 0, 1,
-0.4487709, -0.1777891, -2.744452, 0.07843138, 1, 0, 1,
-0.4468736, -0.6882764, -1.554221, 0.07450981, 1, 0, 1,
-0.4406342, 0.3179558, -1.965704, 0.06666667, 1, 0, 1,
-0.4392618, -1.745254, -4.024772, 0.0627451, 1, 0, 1,
-0.4373547, -0.2903012, -3.023478, 0.05490196, 1, 0, 1,
-0.43662, -0.8420414, -3.459156, 0.05098039, 1, 0, 1,
-0.4335139, -0.3846595, -4.274191, 0.04313726, 1, 0, 1,
-0.4331387, -0.8249202, -3.116761, 0.03921569, 1, 0, 1,
-0.4279036, -0.9301105, -2.287667, 0.03137255, 1, 0, 1,
-0.4229552, 0.144696, -1.629993, 0.02745098, 1, 0, 1,
-0.4185707, 2.383074, -0.7535583, 0.01960784, 1, 0, 1,
-0.417158, 0.8498079, -1.836204, 0.01568628, 1, 0, 1,
-0.4152933, -0.6006855, -0.655616, 0.007843138, 1, 0, 1,
-0.4139489, 1.038909, 1.677821, 0.003921569, 1, 0, 1,
-0.4134012, -0.6537288, -2.276343, 0, 1, 0.003921569, 1,
-0.4128947, -0.6788474, -3.267912, 0, 1, 0.01176471, 1,
-0.4081279, 0.5732079, -0.4189507, 0, 1, 0.01568628, 1,
-0.4054641, -0.5249007, -1.907198, 0, 1, 0.02352941, 1,
-0.3975188, 1.231772, 0.0246169, 0, 1, 0.02745098, 1,
-0.3940774, 2.196513, 0.8246812, 0, 1, 0.03529412, 1,
-0.3937152, 1.884978, -1.466261, 0, 1, 0.03921569, 1,
-0.3934205, 1.380143, -0.8173051, 0, 1, 0.04705882, 1,
-0.3919084, 0.526843, 1.089828, 0, 1, 0.05098039, 1,
-0.3774369, -0.7545735, -3.640188, 0, 1, 0.05882353, 1,
-0.3660429, -0.01951961, -0.8869881, 0, 1, 0.0627451, 1,
-0.3640278, -0.4474075, -1.23708, 0, 1, 0.07058824, 1,
-0.3619722, 1.194146, -0.3486647, 0, 1, 0.07450981, 1,
-0.3607993, 0.1715049, -0.5713645, 0, 1, 0.08235294, 1,
-0.3596449, 0.3085485, -0.757685, 0, 1, 0.08627451, 1,
-0.3585404, 0.5613087, -0.397981, 0, 1, 0.09411765, 1,
-0.3567067, -0.8933895, -3.168008, 0, 1, 0.1019608, 1,
-0.3549144, -1.024594, -1.687237, 0, 1, 0.1058824, 1,
-0.3548974, 0.06360857, -0.01850504, 0, 1, 0.1137255, 1,
-0.3535876, 0.197028, -0.7680538, 0, 1, 0.1176471, 1,
-0.3513907, -1.108124, -3.961597, 0, 1, 0.1254902, 1,
-0.3500167, 0.8288975, -0.2551102, 0, 1, 0.1294118, 1,
-0.3495111, -1.833765, -3.279912, 0, 1, 0.1372549, 1,
-0.3472267, -1.666512, -3.021428, 0, 1, 0.1411765, 1,
-0.3404989, 0.6178781, -0.1573408, 0, 1, 0.1490196, 1,
-0.3377171, 0.229451, -0.770605, 0, 1, 0.1529412, 1,
-0.3340239, 0.2951929, -2.560135, 0, 1, 0.1607843, 1,
-0.3263828, 0.6928812, -1.177271, 0, 1, 0.1647059, 1,
-0.3256799, 0.1862706, -0.854765, 0, 1, 0.172549, 1,
-0.3171031, -0.3118576, -2.631795, 0, 1, 0.1764706, 1,
-0.3169615, -1.919568, -2.840422, 0, 1, 0.1843137, 1,
-0.3167439, 0.4160275, -1.279896, 0, 1, 0.1882353, 1,
-0.3143148, -0.4716459, -1.870096, 0, 1, 0.1960784, 1,
-0.3095426, 2.164576, 1.090456, 0, 1, 0.2039216, 1,
-0.3029892, 0.09157785, -1.933247, 0, 1, 0.2078431, 1,
-0.3008749, 0.5537537, -0.2221798, 0, 1, 0.2156863, 1,
-0.300394, -0.5313829, -3.598371, 0, 1, 0.2196078, 1,
-0.2962449, -2.111326, -2.872786, 0, 1, 0.227451, 1,
-0.2919806, -0.5173763, -2.796088, 0, 1, 0.2313726, 1,
-0.2907497, 0.2333325, -0.5796829, 0, 1, 0.2392157, 1,
-0.290581, 0.4431842, 0.3559231, 0, 1, 0.2431373, 1,
-0.2818899, -1.139088, -1.273903, 0, 1, 0.2509804, 1,
-0.2812304, -1.436357, -2.060975, 0, 1, 0.254902, 1,
-0.2801133, 0.2522158, -1.7428, 0, 1, 0.2627451, 1,
-0.2725704, 0.1572656, 0.235778, 0, 1, 0.2666667, 1,
-0.2703764, -0.533448, -1.787477, 0, 1, 0.2745098, 1,
-0.2695999, -0.4754411, -2.891346, 0, 1, 0.2784314, 1,
-0.2692009, -1.71034, -3.067531, 0, 1, 0.2862745, 1,
-0.2687903, -0.9102776, -0.1496963, 0, 1, 0.2901961, 1,
-0.2676922, -1.807222, -3.001153, 0, 1, 0.2980392, 1,
-0.2666018, -3.175775, -5.114959, 0, 1, 0.3058824, 1,
-0.2627904, -0.7010148, -2.477483, 0, 1, 0.3098039, 1,
-0.2592364, -2.525946, -1.77427, 0, 1, 0.3176471, 1,
-0.2589165, -0.3391185, -3.67912, 0, 1, 0.3215686, 1,
-0.2581314, -1.930601, -2.232029, 0, 1, 0.3294118, 1,
-0.2545864, -0.1472965, -0.3473832, 0, 1, 0.3333333, 1,
-0.2540239, -0.4376946, -4.742963, 0, 1, 0.3411765, 1,
-0.2540123, -0.1392647, -2.969676, 0, 1, 0.345098, 1,
-0.2517997, 1.087581, 0.3395159, 0, 1, 0.3529412, 1,
-0.2506524, 0.0662169, 0.04406941, 0, 1, 0.3568628, 1,
-0.2499876, 1.0033, 0.4292402, 0, 1, 0.3647059, 1,
-0.2390812, 0.06324413, -1.28766, 0, 1, 0.3686275, 1,
-0.2359463, -0.9288198, -2.013431, 0, 1, 0.3764706, 1,
-0.2293775, -0.2821437, -3.929046, 0, 1, 0.3803922, 1,
-0.225275, -0.1967513, -1.728132, 0, 1, 0.3882353, 1,
-0.2232311, -1.190478, -1.257094, 0, 1, 0.3921569, 1,
-0.2184417, 0.4700424, -1.33549, 0, 1, 0.4, 1,
-0.2174503, 0.1817214, -1.014267, 0, 1, 0.4078431, 1,
-0.2161666, 1.166396, -0.3336659, 0, 1, 0.4117647, 1,
-0.2148823, 0.02774654, -0.5986393, 0, 1, 0.4196078, 1,
-0.2137469, -0.1360119, -1.970921, 0, 1, 0.4235294, 1,
-0.2052229, 0.818444, -1.338039, 0, 1, 0.4313726, 1,
-0.2004494, -0.3886673, -3.218837, 0, 1, 0.4352941, 1,
-0.2004211, 1.410829, 0.1285071, 0, 1, 0.4431373, 1,
-0.1992057, 0.6319585, 0.6971886, 0, 1, 0.4470588, 1,
-0.1991702, 0.8085877, -0.3240148, 0, 1, 0.454902, 1,
-0.1947813, -1.001358, -3.08171, 0, 1, 0.4588235, 1,
-0.1911233, -0.9851999, -2.383644, 0, 1, 0.4666667, 1,
-0.1900857, -0.620726, -2.018273, 0, 1, 0.4705882, 1,
-0.1888183, -0.7170488, -2.447122, 0, 1, 0.4784314, 1,
-0.1868025, -0.7325824, -2.151673, 0, 1, 0.4823529, 1,
-0.1852393, -0.6655326, -1.707852, 0, 1, 0.4901961, 1,
-0.1797196, 0.161193, -0.5261493, 0, 1, 0.4941176, 1,
-0.1795213, -0.5692754, -4.33118, 0, 1, 0.5019608, 1,
-0.1732339, -0.620221, -5.169679, 0, 1, 0.509804, 1,
-0.1689258, 0.02377543, -2.173604, 0, 1, 0.5137255, 1,
-0.1683022, -0.5193859, -2.583645, 0, 1, 0.5215687, 1,
-0.166024, -0.4160649, -2.983284, 0, 1, 0.5254902, 1,
-0.1621578, -0.7211047, -3.518666, 0, 1, 0.5333334, 1,
-0.1605454, -0.9210559, -3.509716, 0, 1, 0.5372549, 1,
-0.1576115, -1.121205, -5.410226, 0, 1, 0.5450981, 1,
-0.1572437, 0.5779395, -2.241714, 0, 1, 0.5490196, 1,
-0.1530035, 0.3851699, 0.4674086, 0, 1, 0.5568628, 1,
-0.1398598, 1.156592, -0.4263453, 0, 1, 0.5607843, 1,
-0.1397771, -0.4736169, -3.45407, 0, 1, 0.5686275, 1,
-0.1370698, -0.1213067, -3.098051, 0, 1, 0.572549, 1,
-0.1369592, -0.9836454, -4.107027, 0, 1, 0.5803922, 1,
-0.136669, 1.355995, -1.60274, 0, 1, 0.5843138, 1,
-0.1326854, -1.077534, -2.446703, 0, 1, 0.5921569, 1,
-0.1301463, -1.277336, -1.771539, 0, 1, 0.5960785, 1,
-0.1291619, -0.9151552, -3.97833, 0, 1, 0.6039216, 1,
-0.1270119, 0.2506936, -2.29514, 0, 1, 0.6117647, 1,
-0.1249114, -1.575972, -2.075036, 0, 1, 0.6156863, 1,
-0.1237346, 1.248842, 1.475338, 0, 1, 0.6235294, 1,
-0.123228, 1.261128, 0.4814094, 0, 1, 0.627451, 1,
-0.1220022, 0.8099957, -0.6799477, 0, 1, 0.6352941, 1,
-0.1131885, 0.6725993, -1.860438, 0, 1, 0.6392157, 1,
-0.1117222, 0.1089818, -1.757077, 0, 1, 0.6470588, 1,
-0.1111786, 1.066605, 0.7536405, 0, 1, 0.6509804, 1,
-0.1111508, 0.3515273, -0.1096097, 0, 1, 0.6588235, 1,
-0.1077952, 1.270809, -2.359775, 0, 1, 0.6627451, 1,
-0.1058131, 1.192095, -0.9604685, 0, 1, 0.6705883, 1,
-0.1040739, -1.452247, -1.966489, 0, 1, 0.6745098, 1,
-0.1037228, -0.9165837, -3.927851, 0, 1, 0.682353, 1,
-0.1002864, 2.720692, 0.9048299, 0, 1, 0.6862745, 1,
-0.0967927, -0.3815715, -5.107073, 0, 1, 0.6941177, 1,
-0.09526101, 0.3972612, -0.157757, 0, 1, 0.7019608, 1,
-0.09164899, -0.6805428, -2.052349, 0, 1, 0.7058824, 1,
-0.08848388, -0.3865003, -3.144751, 0, 1, 0.7137255, 1,
-0.08595996, -0.3179051, -5.137084, 0, 1, 0.7176471, 1,
-0.08363315, -2.029969, -2.511165, 0, 1, 0.7254902, 1,
-0.0804792, 0.5995271, -0.6793187, 0, 1, 0.7294118, 1,
-0.07837664, 0.11198, -1.166224, 0, 1, 0.7372549, 1,
-0.07808066, -0.5413353, -3.931092, 0, 1, 0.7411765, 1,
-0.07669288, 0.1002744, 0.9465969, 0, 1, 0.7490196, 1,
-0.06886167, -0.201969, -1.239721, 0, 1, 0.7529412, 1,
-0.06786709, -0.7029325, -3.19168, 0, 1, 0.7607843, 1,
-0.06572089, -0.4008531, -3.877958, 0, 1, 0.7647059, 1,
-0.06568889, -2.115217, -3.753703, 0, 1, 0.772549, 1,
-0.06514916, 0.5611281, -0.1433651, 0, 1, 0.7764706, 1,
-0.05968196, -1.626759, -2.037946, 0, 1, 0.7843137, 1,
-0.05671534, 0.6237583, 0.3954719, 0, 1, 0.7882353, 1,
-0.04956029, -0.2076905, -4.163074, 0, 1, 0.7960784, 1,
-0.04925963, 0.8668885, 0.08406279, 0, 1, 0.8039216, 1,
-0.04863504, -0.9951327, -2.023835, 0, 1, 0.8078431, 1,
-0.04845586, 1.305001, 1.533439, 0, 1, 0.8156863, 1,
-0.04189967, 0.8751537, -0.4468456, 0, 1, 0.8196079, 1,
-0.04177357, 0.5203344, -0.5242583, 0, 1, 0.827451, 1,
-0.04163103, -1.412233, -4.022158, 0, 1, 0.8313726, 1,
-0.03891125, 0.4966635, 1.758354, 0, 1, 0.8392157, 1,
-0.03834515, -1.657104, -1.299848, 0, 1, 0.8431373, 1,
-0.03744696, -0.2134141, -2.430008, 0, 1, 0.8509804, 1,
-0.03604319, -1.57633, -2.586756, 0, 1, 0.854902, 1,
-0.03224537, -0.7226095, -3.610491, 0, 1, 0.8627451, 1,
-0.03029587, -1.583412, -1.478717, 0, 1, 0.8666667, 1,
-0.02713236, -0.1073571, -2.81322, 0, 1, 0.8745098, 1,
-0.02710056, -0.5889476, -1.242365, 0, 1, 0.8784314, 1,
-0.02398934, 0.5937365, 0.6820109, 0, 1, 0.8862745, 1,
-0.01875083, 0.3418001, 1.259504, 0, 1, 0.8901961, 1,
-0.01742409, 0.7704772, -0.485412, 0, 1, 0.8980392, 1,
-0.01730004, 0.06056809, 0.8459135, 0, 1, 0.9058824, 1,
-0.01373553, 0.07263206, 1.455212, 0, 1, 0.9098039, 1,
-0.01039941, 0.956194, 0.5090771, 0, 1, 0.9176471, 1,
-0.0103678, -1.028563, -4.15176, 0, 1, 0.9215686, 1,
-0.008127959, -0.3611796, -1.53273, 0, 1, 0.9294118, 1,
-0.00658313, 1.009612, 0.9071151, 0, 1, 0.9333333, 1,
-0.006330397, -0.1160929, -3.816329, 0, 1, 0.9411765, 1,
-0.00224292, -0.6404057, -3.816644, 0, 1, 0.945098, 1,
-0.001078723, -0.4041633, -2.710495, 0, 1, 0.9529412, 1,
-0.0009534147, 1.077951, -0.7369816, 0, 1, 0.9568627, 1,
0.001176745, 1.084535, -0.6524978, 0, 1, 0.9647059, 1,
0.001637682, -0.3882819, 3.373268, 0, 1, 0.9686275, 1,
0.001646996, -1.163535, 4.329649, 0, 1, 0.9764706, 1,
0.003537766, 1.080757, -0.9563145, 0, 1, 0.9803922, 1,
0.0105191, -0.444349, 3.345153, 0, 1, 0.9882353, 1,
0.01514451, 0.1839148, -0.1073444, 0, 1, 0.9921569, 1,
0.01781043, 2.242821, 0.4112016, 0, 1, 1, 1,
0.0201555, 1.272056, 0.296628, 0, 0.9921569, 1, 1,
0.02123793, 0.881137, 0.9667151, 0, 0.9882353, 1, 1,
0.02348933, 1.02343, 1.145706, 0, 0.9803922, 1, 1,
0.02531955, -2.36824, 4.440449, 0, 0.9764706, 1, 1,
0.0262465, -0.8588371, 3.825838, 0, 0.9686275, 1, 1,
0.02625901, 0.07255688, -1.343295, 0, 0.9647059, 1, 1,
0.02757106, 0.4498044, 0.08342873, 0, 0.9568627, 1, 1,
0.02901023, -1.653746, 3.628166, 0, 0.9529412, 1, 1,
0.03150595, -1.323507, 2.71039, 0, 0.945098, 1, 1,
0.0322989, 0.564244, 0.243545, 0, 0.9411765, 1, 1,
0.03346851, 0.3783981, -0.08984134, 0, 0.9333333, 1, 1,
0.03362526, 0.2433238, 0.7727428, 0, 0.9294118, 1, 1,
0.03733531, 0.03094005, 2.067127, 0, 0.9215686, 1, 1,
0.04257867, 0.1796082, 2.860205, 0, 0.9176471, 1, 1,
0.04553165, -0.6693339, 2.488533, 0, 0.9098039, 1, 1,
0.04558152, 0.1156321, 1.010695, 0, 0.9058824, 1, 1,
0.04753156, 1.414816, -0.2234673, 0, 0.8980392, 1, 1,
0.04780683, 0.9166734, 0.1806851, 0, 0.8901961, 1, 1,
0.05007435, -0.4997733, 2.733145, 0, 0.8862745, 1, 1,
0.0538839, 0.3915929, 0.8813922, 0, 0.8784314, 1, 1,
0.05635485, 0.6688101, -0.1819575, 0, 0.8745098, 1, 1,
0.05711751, 1.207024, 0.3661089, 0, 0.8666667, 1, 1,
0.06169669, -0.3058707, 2.19804, 0, 0.8627451, 1, 1,
0.06209085, -0.7368466, 2.136591, 0, 0.854902, 1, 1,
0.06524549, 0.0945123, -1.27433, 0, 0.8509804, 1, 1,
0.07533818, 0.3848059, 0.9227185, 0, 0.8431373, 1, 1,
0.07812656, 0.5891012, -1.639578, 0, 0.8392157, 1, 1,
0.07890169, 0.9806445, 0.232385, 0, 0.8313726, 1, 1,
0.07958304, 1.877376, 0.919989, 0, 0.827451, 1, 1,
0.07964753, 1.555551, -0.01772677, 0, 0.8196079, 1, 1,
0.0800741, -0.5566286, 3.725437, 0, 0.8156863, 1, 1,
0.08424738, 0.6714931, 0.9094506, 0, 0.8078431, 1, 1,
0.0849703, -0.5069004, 4.08743, 0, 0.8039216, 1, 1,
0.08819659, 0.7217746, -0.5106184, 0, 0.7960784, 1, 1,
0.08938891, -0.008132195, 2.716732, 0, 0.7882353, 1, 1,
0.09075627, -0.8573977, 3.121565, 0, 0.7843137, 1, 1,
0.09274835, 0.2604653, 1.133479, 0, 0.7764706, 1, 1,
0.1015089, -0.2494521, 3.147815, 0, 0.772549, 1, 1,
0.1016586, -1.312556, 1.028514, 0, 0.7647059, 1, 1,
0.1039377, -1.955486, 3.523696, 0, 0.7607843, 1, 1,
0.1040139, -1.040152, 3.173983, 0, 0.7529412, 1, 1,
0.1047989, 0.566129, 1.349298, 0, 0.7490196, 1, 1,
0.1067774, 1.374261, 0.6667293, 0, 0.7411765, 1, 1,
0.1080963, 1.843656, -0.5506741, 0, 0.7372549, 1, 1,
0.108176, -0.1584107, 3.388601, 0, 0.7294118, 1, 1,
0.1084667, -0.5970938, 4.186234, 0, 0.7254902, 1, 1,
0.1108477, -0.5082739, 2.750649, 0, 0.7176471, 1, 1,
0.1179402, 0.2362026, 1.629485, 0, 0.7137255, 1, 1,
0.1189834, -0.7648193, 3.075529, 0, 0.7058824, 1, 1,
0.1208548, 0.5579574, -0.8060573, 0, 0.6980392, 1, 1,
0.1230234, -2.059964, 2.244035, 0, 0.6941177, 1, 1,
0.1247467, -1.764909, 1.502363, 0, 0.6862745, 1, 1,
0.1258519, 0.8989905, 1.032393, 0, 0.682353, 1, 1,
0.127329, 1.210627, 0.7100131, 0, 0.6745098, 1, 1,
0.1273868, 0.5598143, 1.57019, 0, 0.6705883, 1, 1,
0.1304963, 0.3871599, 1.658183, 0, 0.6627451, 1, 1,
0.1324877, -0.9937546, 1.627201, 0, 0.6588235, 1, 1,
0.1328877, 1.04424, -0.5600107, 0, 0.6509804, 1, 1,
0.1354011, -0.2284149, 3.893131, 0, 0.6470588, 1, 1,
0.1413801, -0.214773, 3.219627, 0, 0.6392157, 1, 1,
0.1498528, -0.4949581, 1.338697, 0, 0.6352941, 1, 1,
0.1500883, -0.5685481, 3.315477, 0, 0.627451, 1, 1,
0.1566021, 1.775529, 0.6135479, 0, 0.6235294, 1, 1,
0.163733, 0.9083872, -0.2017913, 0, 0.6156863, 1, 1,
0.1643602, 0.04586761, 1.918335, 0, 0.6117647, 1, 1,
0.1687942, -0.2814518, 2.056659, 0, 0.6039216, 1, 1,
0.1690699, -2.438939, 4.802015, 0, 0.5960785, 1, 1,
0.169998, 0.2467919, -1.187623, 0, 0.5921569, 1, 1,
0.1798283, 0.9625632, 1.67671, 0, 0.5843138, 1, 1,
0.1802865, -2.407275, 2.425951, 0, 0.5803922, 1, 1,
0.1813739, 0.8512281, -0.5172403, 0, 0.572549, 1, 1,
0.1852836, -0.772925, 2.305685, 0, 0.5686275, 1, 1,
0.1893964, 0.9025252, -0.6557059, 0, 0.5607843, 1, 1,
0.1913812, 0.9154923, 0.3964285, 0, 0.5568628, 1, 1,
0.1933213, 0.7452642, 0.7645206, 0, 0.5490196, 1, 1,
0.1968278, -2.036165, 2.258105, 0, 0.5450981, 1, 1,
0.1970382, -1.835816, 2.064001, 0, 0.5372549, 1, 1,
0.1975191, -0.03461452, 2.870555, 0, 0.5333334, 1, 1,
0.1981287, 0.2884001, 2.308328, 0, 0.5254902, 1, 1,
0.2028104, -0.6099187, 3.188517, 0, 0.5215687, 1, 1,
0.2045062, -0.5190781, 3.993287, 0, 0.5137255, 1, 1,
0.2057943, -0.06172638, 1.562397, 0, 0.509804, 1, 1,
0.2087657, -0.8704363, 3.89674, 0, 0.5019608, 1, 1,
0.2126284, 1.729435, -0.5717921, 0, 0.4941176, 1, 1,
0.2155657, -0.02857132, 3.966591, 0, 0.4901961, 1, 1,
0.2164336, -1.089308, 0.8106118, 0, 0.4823529, 1, 1,
0.2165568, -0.9897716, 3.084162, 0, 0.4784314, 1, 1,
0.218623, 0.7413282, -1.091734, 0, 0.4705882, 1, 1,
0.2226251, 1.669926, -1.760947, 0, 0.4666667, 1, 1,
0.2264211, -1.121851, 0.8226557, 0, 0.4588235, 1, 1,
0.2264802, 0.2803242, 1.783122, 0, 0.454902, 1, 1,
0.2277376, 0.2313734, -0.2626161, 0, 0.4470588, 1, 1,
0.2281073, 0.05083978, -0.06610276, 0, 0.4431373, 1, 1,
0.2292236, -0.8005076, 3.619954, 0, 0.4352941, 1, 1,
0.235477, 0.8511338, 0.3879376, 0, 0.4313726, 1, 1,
0.2415812, -0.8324918, 2.297653, 0, 0.4235294, 1, 1,
0.2504887, 0.804907, -0.05525586, 0, 0.4196078, 1, 1,
0.2575365, 0.2174395, 1.428558, 0, 0.4117647, 1, 1,
0.2605455, 0.8641501, 1.093256, 0, 0.4078431, 1, 1,
0.2609904, -0.3179311, 3.117399, 0, 0.4, 1, 1,
0.2622518, -1.477918, 1.250475, 0, 0.3921569, 1, 1,
0.2639635, -0.5817615, 2.892335, 0, 0.3882353, 1, 1,
0.265455, -0.1925976, 2.219844, 0, 0.3803922, 1, 1,
0.2680669, -0.263663, 1.894449, 0, 0.3764706, 1, 1,
0.2683877, 0.6139526, 2.582011, 0, 0.3686275, 1, 1,
0.2761175, -1.741952, 3.135695, 0, 0.3647059, 1, 1,
0.2787078, 0.6779011, 0.7987118, 0, 0.3568628, 1, 1,
0.2787487, 0.2910621, 0.8605741, 0, 0.3529412, 1, 1,
0.2792665, -0.2550428, 2.223831, 0, 0.345098, 1, 1,
0.2865332, 0.08029397, 1.458789, 0, 0.3411765, 1, 1,
0.2886868, 0.4058869, 0.7291651, 0, 0.3333333, 1, 1,
0.2901153, 1.272986, 0.5695038, 0, 0.3294118, 1, 1,
0.2925439, -0.6301323, 3.620999, 0, 0.3215686, 1, 1,
0.2957681, -0.7987965, 2.693602, 0, 0.3176471, 1, 1,
0.297506, 0.8129945, 0.825865, 0, 0.3098039, 1, 1,
0.2995979, 1.223674, -0.2641409, 0, 0.3058824, 1, 1,
0.3044865, -2.475789, 4.307711, 0, 0.2980392, 1, 1,
0.3081079, 0.4783636, 0.4401403, 0, 0.2901961, 1, 1,
0.3100259, -1.590815, 1.267381, 0, 0.2862745, 1, 1,
0.3127168, -0.243664, 3.46508, 0, 0.2784314, 1, 1,
0.3130982, 0.2797372, -0.7402468, 0, 0.2745098, 1, 1,
0.3134364, 0.3716838, -0.6180753, 0, 0.2666667, 1, 1,
0.3156348, -1.860481, 4.11359, 0, 0.2627451, 1, 1,
0.3186322, -0.5666251, 3.223713, 0, 0.254902, 1, 1,
0.3187644, -0.7788622, 1.497909, 0, 0.2509804, 1, 1,
0.3198981, -2.310404, 1.324177, 0, 0.2431373, 1, 1,
0.320505, 0.02823335, 0.3954639, 0, 0.2392157, 1, 1,
0.3221606, 0.3225263, 2.340392, 0, 0.2313726, 1, 1,
0.3282617, 1.74873, -0.5365939, 0, 0.227451, 1, 1,
0.329976, -0.904471, 2.982263, 0, 0.2196078, 1, 1,
0.3337098, -0.06650725, 2.086764, 0, 0.2156863, 1, 1,
0.3403469, 0.004334827, -0.8283727, 0, 0.2078431, 1, 1,
0.3406057, 0.2396633, 0.9975034, 0, 0.2039216, 1, 1,
0.3419544, -1.080024, 2.347237, 0, 0.1960784, 1, 1,
0.342868, -1.713781, 4.271366, 0, 0.1882353, 1, 1,
0.3466652, -0.176719, 1.934964, 0, 0.1843137, 1, 1,
0.3479765, 0.271744, 2.794057, 0, 0.1764706, 1, 1,
0.348151, 1.281551, 0.05737215, 0, 0.172549, 1, 1,
0.3566904, -0.9477004, 3.751817, 0, 0.1647059, 1, 1,
0.3626745, 1.967732, 1.786122, 0, 0.1607843, 1, 1,
0.3627459, -0.08767761, 2.555272, 0, 0.1529412, 1, 1,
0.3629542, 0.01178776, 3.436789, 0, 0.1490196, 1, 1,
0.3630376, 0.0601072, 0.2577832, 0, 0.1411765, 1, 1,
0.3642769, -1.066931, 2.793841, 0, 0.1372549, 1, 1,
0.3667208, -0.8441689, 3.734128, 0, 0.1294118, 1, 1,
0.3683489, 0.6756928, -0.3212626, 0, 0.1254902, 1, 1,
0.3690191, -0.3659955, 2.145996, 0, 0.1176471, 1, 1,
0.3705815, -0.04343642, 1.084924, 0, 0.1137255, 1, 1,
0.3738326, 0.6261437, 1.760197, 0, 0.1058824, 1, 1,
0.3785672, 1.889129, 1.027081, 0, 0.09803922, 1, 1,
0.3839184, -0.4202126, 1.977257, 0, 0.09411765, 1, 1,
0.3854012, 0.2529658, -0.1907426, 0, 0.08627451, 1, 1,
0.3891697, 0.01883361, 2.063714, 0, 0.08235294, 1, 1,
0.391811, 0.827028, 0.7159519, 0, 0.07450981, 1, 1,
0.3966645, 1.346409, 0.5200898, 0, 0.07058824, 1, 1,
0.3980337, 0.006855338, 2.460792, 0, 0.0627451, 1, 1,
0.3989895, 0.9849584, -0.4064085, 0, 0.05882353, 1, 1,
0.4002485, -2.623917, 1.217227, 0, 0.05098039, 1, 1,
0.4004638, 0.2400554, 0.546096, 0, 0.04705882, 1, 1,
0.4017179, 0.3709703, 1.959362, 0, 0.03921569, 1, 1,
0.4031683, 0.4732877, 0.3170915, 0, 0.03529412, 1, 1,
0.4033593, 1.88712, 0.7246, 0, 0.02745098, 1, 1,
0.4037128, 0.4417366, 2.444359, 0, 0.02352941, 1, 1,
0.4058669, 0.3190987, 1.113429, 0, 0.01568628, 1, 1,
0.4101089, 0.9031811, -1.07647, 0, 0.01176471, 1, 1,
0.4122579, -1.734591, 3.165218, 0, 0.003921569, 1, 1,
0.4149788, -0.7735912, 2.357472, 0.003921569, 0, 1, 1,
0.4155591, -0.04952217, 0.8679439, 0.007843138, 0, 1, 1,
0.4171636, 1.241159, -0.0962511, 0.01568628, 0, 1, 1,
0.4239434, -0.2814539, 2.674236, 0.01960784, 0, 1, 1,
0.4264511, -0.3471107, 3.7518, 0.02745098, 0, 1, 1,
0.4284772, -0.9371359, 2.918423, 0.03137255, 0, 1, 1,
0.4333629, 1.350511, -1.126054, 0.03921569, 0, 1, 1,
0.4339166, 0.1625655, 1.021862, 0.04313726, 0, 1, 1,
0.4346074, 1.096782, 0.8006257, 0.05098039, 0, 1, 1,
0.4348861, -1.660304, 4.490667, 0.05490196, 0, 1, 1,
0.435097, -0.3107016, 2.555449, 0.0627451, 0, 1, 1,
0.4397603, -0.3995865, 1.7403, 0.06666667, 0, 1, 1,
0.4438531, -1.088957, 2.809578, 0.07450981, 0, 1, 1,
0.4469831, 0.3708062, 4.197494, 0.07843138, 0, 1, 1,
0.4470355, -2.130737, 0.8380227, 0.08627451, 0, 1, 1,
0.4479964, 2.223695, 0.3490638, 0.09019608, 0, 1, 1,
0.451764, 1.180967, 1.458156, 0.09803922, 0, 1, 1,
0.4523213, -0.4172514, 3.912656, 0.1058824, 0, 1, 1,
0.453968, -0.4202978, -0.1383, 0.1098039, 0, 1, 1,
0.4575795, 1.217108, 0.4132382, 0.1176471, 0, 1, 1,
0.4603711, -1.724861, 2.827827, 0.1215686, 0, 1, 1,
0.4604067, 2.746465, 1.443631, 0.1294118, 0, 1, 1,
0.4621981, -2.38989, 2.841754, 0.1333333, 0, 1, 1,
0.4632139, 0.06403171, 2.992122, 0.1411765, 0, 1, 1,
0.4656414, 0.4671712, 1.053481, 0.145098, 0, 1, 1,
0.4658635, 0.312213, 1.3598, 0.1529412, 0, 1, 1,
0.465975, -0.3857141, 2.01644, 0.1568628, 0, 1, 1,
0.4672796, 1.37277, 1.081988, 0.1647059, 0, 1, 1,
0.4676085, 0.6992863, 0.2282342, 0.1686275, 0, 1, 1,
0.4684551, -0.4030364, 3.007891, 0.1764706, 0, 1, 1,
0.4698002, -0.8218729, 4.253385, 0.1803922, 0, 1, 1,
0.4739817, -0.113794, 0.523751, 0.1882353, 0, 1, 1,
0.4770216, 1.16821, -0.5276957, 0.1921569, 0, 1, 1,
0.479732, -0.3232007, 2.299513, 0.2, 0, 1, 1,
0.4830828, -0.7404086, 3.716407, 0.2078431, 0, 1, 1,
0.4835921, 0.2347973, 0.8405831, 0.2117647, 0, 1, 1,
0.4847651, 0.2335909, -0.2330585, 0.2196078, 0, 1, 1,
0.486705, 0.7152882, -0.4369614, 0.2235294, 0, 1, 1,
0.4870823, -0.1185848, 1.766205, 0.2313726, 0, 1, 1,
0.4892643, -0.9493054, 3.612083, 0.2352941, 0, 1, 1,
0.4963486, -1.223433, 2.624869, 0.2431373, 0, 1, 1,
0.499728, 0.2180284, 0.1517526, 0.2470588, 0, 1, 1,
0.5012175, -0.002434526, 2.398368, 0.254902, 0, 1, 1,
0.5119469, -0.7200491, 3.529323, 0.2588235, 0, 1, 1,
0.5127477, 0.1808833, 1.234328, 0.2666667, 0, 1, 1,
0.5158274, 0.4903709, 2.059115, 0.2705882, 0, 1, 1,
0.5181396, -0.08089478, 1.407884, 0.2784314, 0, 1, 1,
0.5211093, 0.6714041, 1.156647, 0.282353, 0, 1, 1,
0.5236089, -0.6788377, 3.327276, 0.2901961, 0, 1, 1,
0.5350999, -1.822319, 2.347506, 0.2941177, 0, 1, 1,
0.5351882, -0.6745208, 2.966134, 0.3019608, 0, 1, 1,
0.5365669, -0.02802461, 0.08167084, 0.3098039, 0, 1, 1,
0.5374482, 0.5199282, 1.960027, 0.3137255, 0, 1, 1,
0.5413196, 0.1294062, 0.6151274, 0.3215686, 0, 1, 1,
0.545356, -1.398834, 2.745336, 0.3254902, 0, 1, 1,
0.5628901, -0.9077787, 3.05568, 0.3333333, 0, 1, 1,
0.5648905, 1.019771, 0.3815421, 0.3372549, 0, 1, 1,
0.5841151, -0.674332, 3.465191, 0.345098, 0, 1, 1,
0.5842218, -0.6594812, 0.2041651, 0.3490196, 0, 1, 1,
0.5887538, 1.512706, 0.5342895, 0.3568628, 0, 1, 1,
0.5899865, -0.3713803, 2.547908, 0.3607843, 0, 1, 1,
0.5917215, -2.142363, 1.860114, 0.3686275, 0, 1, 1,
0.5922155, 0.3314163, -0.01378105, 0.372549, 0, 1, 1,
0.5933602, 0.2304169, 1.235743, 0.3803922, 0, 1, 1,
0.5964108, 1.109885, 0.7111701, 0.3843137, 0, 1, 1,
0.6042501, -0.9777972, 1.341286, 0.3921569, 0, 1, 1,
0.604365, 1.041959, 0.1244106, 0.3960784, 0, 1, 1,
0.6139947, -0.4934455, 2.77952, 0.4039216, 0, 1, 1,
0.6151019, 0.7699452, 0.1056047, 0.4117647, 0, 1, 1,
0.6154357, 0.3323257, 1.479717, 0.4156863, 0, 1, 1,
0.6219926, -1.076402, 3.106972, 0.4235294, 0, 1, 1,
0.6244766, 0.0909201, -0.008159467, 0.427451, 0, 1, 1,
0.6333564, -0.9258619, 2.881424, 0.4352941, 0, 1, 1,
0.6373811, 1.27935, 0.4230593, 0.4392157, 0, 1, 1,
0.6419617, 0.8278023, 3.141826, 0.4470588, 0, 1, 1,
0.6430297, -0.1948713, 0.6086278, 0.4509804, 0, 1, 1,
0.6463644, 0.1258602, 0.08922696, 0.4588235, 0, 1, 1,
0.6521448, 0.6778558, -0.4366147, 0.4627451, 0, 1, 1,
0.6540586, 0.8546074, 1.386965, 0.4705882, 0, 1, 1,
0.6558274, -0.5225269, 2.004608, 0.4745098, 0, 1, 1,
0.6590285, 1.16513, 0.4156469, 0.4823529, 0, 1, 1,
0.6647274, -1.275411, 3.861987, 0.4862745, 0, 1, 1,
0.665867, -0.5527971, 2.136078, 0.4941176, 0, 1, 1,
0.6662481, 0.02689474, 1.566472, 0.5019608, 0, 1, 1,
0.6729681, -0.5748401, 3.057525, 0.5058824, 0, 1, 1,
0.6733819, -0.4052898, 2.906758, 0.5137255, 0, 1, 1,
0.6739523, -1.338641, 2.898735, 0.5176471, 0, 1, 1,
0.6755619, -2.162605, 0.9870757, 0.5254902, 0, 1, 1,
0.676479, -0.3821807, 1.295381, 0.5294118, 0, 1, 1,
0.6802167, 0.1303532, 1.508762, 0.5372549, 0, 1, 1,
0.688084, -0.006437748, 1.731789, 0.5411765, 0, 1, 1,
0.6902196, 1.02767, 0.9599643, 0.5490196, 0, 1, 1,
0.7000195, -1.147877, 1.854791, 0.5529412, 0, 1, 1,
0.7005676, 0.8403437, 0.1012372, 0.5607843, 0, 1, 1,
0.7023735, 0.8256454, 1.619054, 0.5647059, 0, 1, 1,
0.7041097, -0.7410411, 2.967167, 0.572549, 0, 1, 1,
0.70439, -0.6031399, 2.1836, 0.5764706, 0, 1, 1,
0.7105021, 0.8379248, 1.658981, 0.5843138, 0, 1, 1,
0.7115848, 0.5187226, 1.078084, 0.5882353, 0, 1, 1,
0.7152351, 0.2234412, 1.095786, 0.5960785, 0, 1, 1,
0.7194924, 0.4846674, -0.6423774, 0.6039216, 0, 1, 1,
0.7202564, 0.4885825, -1.771277, 0.6078432, 0, 1, 1,
0.7214118, 0.04435075, 1.371784, 0.6156863, 0, 1, 1,
0.7362795, -1.629401, 2.996821, 0.6196079, 0, 1, 1,
0.7414284, -0.9251828, 2.091127, 0.627451, 0, 1, 1,
0.7433293, -1.77415, 3.179678, 0.6313726, 0, 1, 1,
0.7625166, 0.4888898, 0.9776827, 0.6392157, 0, 1, 1,
0.7637782, 1.221832, -1.322423, 0.6431373, 0, 1, 1,
0.7666756, 0.4899475, 0.5857299, 0.6509804, 0, 1, 1,
0.7683367, 0.5767481, 0.7912385, 0.654902, 0, 1, 1,
0.7748008, -0.8624693, 2.147345, 0.6627451, 0, 1, 1,
0.7852607, -0.666227, 2.383318, 0.6666667, 0, 1, 1,
0.7885677, -1.038879, 2.562221, 0.6745098, 0, 1, 1,
0.7898538, 0.2994201, 1.905741, 0.6784314, 0, 1, 1,
0.7946924, -0.5479849, 2.562765, 0.6862745, 0, 1, 1,
0.8020942, 0.9533947, 1.92386, 0.6901961, 0, 1, 1,
0.804826, 0.7177758, 1.036261, 0.6980392, 0, 1, 1,
0.8050069, 0.7140101, -0.1790658, 0.7058824, 0, 1, 1,
0.8050579, 1.217611, -0.1922685, 0.7098039, 0, 1, 1,
0.8054118, 2.244489, -0.4943222, 0.7176471, 0, 1, 1,
0.8125355, -1.612402, 2.419268, 0.7215686, 0, 1, 1,
0.8144818, -0.05586619, 0.6257181, 0.7294118, 0, 1, 1,
0.8206939, -1.297202, 3.960402, 0.7333333, 0, 1, 1,
0.820838, 0.4733933, 0.1068306, 0.7411765, 0, 1, 1,
0.8225245, 1.051458, -1.186449, 0.7450981, 0, 1, 1,
0.8228072, 0.05503016, 2.445004, 0.7529412, 0, 1, 1,
0.8235402, 0.3205169, 2.676128, 0.7568628, 0, 1, 1,
0.8249201, -0.3835121, 0.8882204, 0.7647059, 0, 1, 1,
0.8303521, 1.316038, -0.2013405, 0.7686275, 0, 1, 1,
0.8313863, -0.3808248, 3.071008, 0.7764706, 0, 1, 1,
0.8319124, -2.235531, 1.876142, 0.7803922, 0, 1, 1,
0.8349633, 0.3556999, 2.67436, 0.7882353, 0, 1, 1,
0.8359556, 0.3830948, 2.733729, 0.7921569, 0, 1, 1,
0.8412454, 1.236716, 0.5226563, 0.8, 0, 1, 1,
0.8418512, 1.036224, 1.201826, 0.8078431, 0, 1, 1,
0.8459662, -0.4863794, 1.421478, 0.8117647, 0, 1, 1,
0.8466665, 1.494859, 0.6092234, 0.8196079, 0, 1, 1,
0.847716, -0.6609046, 1.900382, 0.8235294, 0, 1, 1,
0.8503751, -1.934723, 4.46274, 0.8313726, 0, 1, 1,
0.851187, 1.816147, 2.091718, 0.8352941, 0, 1, 1,
0.8612422, -0.1687214, 1.911974, 0.8431373, 0, 1, 1,
0.8660908, -1.635113, 2.709407, 0.8470588, 0, 1, 1,
0.8677118, 1.74923, 1.675743, 0.854902, 0, 1, 1,
0.8698085, 0.2869779, 1.344133, 0.8588235, 0, 1, 1,
0.875175, 0.1563103, -0.2094084, 0.8666667, 0, 1, 1,
0.8775317, 1.261398, 1.445329, 0.8705882, 0, 1, 1,
0.8775613, -0.8321038, 2.649184, 0.8784314, 0, 1, 1,
0.8785051, -0.255974, -1.05893, 0.8823529, 0, 1, 1,
0.8816395, -0.9600858, 2.285964, 0.8901961, 0, 1, 1,
0.8852833, -1.453147, 2.795756, 0.8941177, 0, 1, 1,
0.8868549, 1.901356, -0.8784094, 0.9019608, 0, 1, 1,
0.8945733, 0.2383371, 0.3896345, 0.9098039, 0, 1, 1,
0.894945, 0.6642936, 0.6436581, 0.9137255, 0, 1, 1,
0.9009745, 0.5797217, 0.01286114, 0.9215686, 0, 1, 1,
0.9009777, 0.3479297, 0.7683339, 0.9254902, 0, 1, 1,
0.9034525, 0.3862508, -0.9090652, 0.9333333, 0, 1, 1,
0.9039722, -0.2662349, 2.718195, 0.9372549, 0, 1, 1,
0.9055197, 0.002196956, -0.1942534, 0.945098, 0, 1, 1,
0.9081752, -0.08253449, 2.724437, 0.9490196, 0, 1, 1,
0.9093682, -1.605211, 3.472782, 0.9568627, 0, 1, 1,
0.9096861, 1.302158, 1.038465, 0.9607843, 0, 1, 1,
0.9107776, -0.2393082, 0.5973036, 0.9686275, 0, 1, 1,
0.9189643, -1.020214, 2.510942, 0.972549, 0, 1, 1,
0.9193406, 1.303438, -0.8925312, 0.9803922, 0, 1, 1,
0.921545, 1.895323, 2.241316, 0.9843137, 0, 1, 1,
0.923318, 0.4475241, 2.801474, 0.9921569, 0, 1, 1,
0.9245351, -1.217532, 0.7047666, 0.9960784, 0, 1, 1,
0.9261301, 2.087764, 2.653754, 1, 0, 0.9960784, 1,
0.9342002, 0.7529898, 0.5819554, 1, 0, 0.9882353, 1,
0.941348, -1.013458, 3.453683, 1, 0, 0.9843137, 1,
0.9433555, 0.6660913, 1.188128, 1, 0, 0.9764706, 1,
0.9473432, 0.08655276, 1.984885, 1, 0, 0.972549, 1,
0.9538016, -0.1630715, 2.650354, 1, 0, 0.9647059, 1,
0.9553502, -0.8875605, 4.469943, 1, 0, 0.9607843, 1,
0.9584863, 1.529372, -0.1718337, 1, 0, 0.9529412, 1,
0.9605785, 1.903123, 0.7903079, 1, 0, 0.9490196, 1,
0.9633849, 1.996604, 0.6406009, 1, 0, 0.9411765, 1,
0.9686705, -1.478537, 2.137008, 1, 0, 0.9372549, 1,
0.9751234, 0.8613139, 0.5331984, 1, 0, 0.9294118, 1,
0.9755281, -0.5251007, 3.486275, 1, 0, 0.9254902, 1,
0.9777023, -0.1322775, 1.549056, 1, 0, 0.9176471, 1,
0.990072, 2.669192, 0.856959, 1, 0, 0.9137255, 1,
1.002285, -1.119043, 3.16648, 1, 0, 0.9058824, 1,
1.003627, -1.4483, 1.833565, 1, 0, 0.9019608, 1,
1.004501, -0.7150006, 0.165898, 1, 0, 0.8941177, 1,
1.018933, -0.2616615, 3.212855, 1, 0, 0.8862745, 1,
1.03195, 2.318217, -0.1905459, 1, 0, 0.8823529, 1,
1.03254, -1.149577, 3.000112, 1, 0, 0.8745098, 1,
1.036619, -0.6333542, 2.166009, 1, 0, 0.8705882, 1,
1.043072, 0.5192879, 1.967335, 1, 0, 0.8627451, 1,
1.043543, 0.5916886, 0.7832634, 1, 0, 0.8588235, 1,
1.044667, -0.5483395, 2.242188, 1, 0, 0.8509804, 1,
1.046671, 0.5433822, 0.4715778, 1, 0, 0.8470588, 1,
1.047279, -1.924077, 2.330322, 1, 0, 0.8392157, 1,
1.047998, -2.244033, 2.327411, 1, 0, 0.8352941, 1,
1.048236, 0.004650613, 0.5014204, 1, 0, 0.827451, 1,
1.057017, 0.6212384, -0.1296819, 1, 0, 0.8235294, 1,
1.057443, 0.3794173, 2.927136, 1, 0, 0.8156863, 1,
1.071209, 2.083646, 1.606813, 1, 0, 0.8117647, 1,
1.075483, 1.05343, 1.079869, 1, 0, 0.8039216, 1,
1.084681, -0.6376522, 3.700755, 1, 0, 0.7960784, 1,
1.093827, -1.499703, 1.604519, 1, 0, 0.7921569, 1,
1.096546, -0.03714846, 1.402768, 1, 0, 0.7843137, 1,
1.098722, 1.3307, -0.3865804, 1, 0, 0.7803922, 1,
1.115661, 0.01101149, 1.856432, 1, 0, 0.772549, 1,
1.121395, -0.5193647, 1.033334, 1, 0, 0.7686275, 1,
1.121765, 1.390767, 0.5896729, 1, 0, 0.7607843, 1,
1.122266, -1.943815, 1.829108, 1, 0, 0.7568628, 1,
1.132407, 0.690993, 1.370575, 1, 0, 0.7490196, 1,
1.141101, -0.9771981, 1.29417, 1, 0, 0.7450981, 1,
1.141695, 0.353833, 2.216583, 1, 0, 0.7372549, 1,
1.142674, 0.6051979, 0.844182, 1, 0, 0.7333333, 1,
1.147823, -1.062135, 1.313572, 1, 0, 0.7254902, 1,
1.150182, 0.3656455, 1.574924, 1, 0, 0.7215686, 1,
1.154078, 2.225959, -0.4552524, 1, 0, 0.7137255, 1,
1.155872, -0.07996528, 1.933369, 1, 0, 0.7098039, 1,
1.171946, 1.568225, 0.04294357, 1, 0, 0.7019608, 1,
1.177275, 0.04997301, 3.047622, 1, 0, 0.6941177, 1,
1.182306, 0.8246349, 1.788778, 1, 0, 0.6901961, 1,
1.184059, 0.5697047, 1.344364, 1, 0, 0.682353, 1,
1.185938, 0.6371205, 1.707934, 1, 0, 0.6784314, 1,
1.186809, 0.8785426, 0.3067165, 1, 0, 0.6705883, 1,
1.190618, 0.010121, 1.729192, 1, 0, 0.6666667, 1,
1.191502, 0.7421182, 2.067526, 1, 0, 0.6588235, 1,
1.205586, 0.5664454, 1.808017, 1, 0, 0.654902, 1,
1.214906, -0.006474046, 0.7276018, 1, 0, 0.6470588, 1,
1.221916, 1.039736, 0.6366045, 1, 0, 0.6431373, 1,
1.222115, -1.58926, -0.1614312, 1, 0, 0.6352941, 1,
1.231173, -0.2710316, 2.181316, 1, 0, 0.6313726, 1,
1.235912, -0.4933588, 3.210002, 1, 0, 0.6235294, 1,
1.236596, 0.03460728, 0.7835929, 1, 0, 0.6196079, 1,
1.238648, -1.065047, 2.215002, 1, 0, 0.6117647, 1,
1.238955, 1.082411, 0.09271885, 1, 0, 0.6078432, 1,
1.265266, -0.2503516, 1.036817, 1, 0, 0.6, 1,
1.265988, -0.5958681, 1.363676, 1, 0, 0.5921569, 1,
1.266513, -0.2647514, 1.440123, 1, 0, 0.5882353, 1,
1.270615, -1.742329, 3.918547, 1, 0, 0.5803922, 1,
1.276987, 1.837695, 0.7883936, 1, 0, 0.5764706, 1,
1.279636, -0.115911, 2.04497, 1, 0, 0.5686275, 1,
1.288842, -0.3204462, 0.6851264, 1, 0, 0.5647059, 1,
1.291213, 0.8109617, 1.088632, 1, 0, 0.5568628, 1,
1.293997, -1.298918, 3.62738, 1, 0, 0.5529412, 1,
1.316299, -0.6083868, 1.789035, 1, 0, 0.5450981, 1,
1.319878, 0.3636743, 1.512955, 1, 0, 0.5411765, 1,
1.320654, -0.5411007, 1.520191, 1, 0, 0.5333334, 1,
1.326177, 0.1353847, 2.11981, 1, 0, 0.5294118, 1,
1.328374, 0.1144502, 1.714236, 1, 0, 0.5215687, 1,
1.329746, -0.4208586, 3.458745, 1, 0, 0.5176471, 1,
1.337332, -2.782289, 2.945312, 1, 0, 0.509804, 1,
1.33778, 0.2145444, 1.71565, 1, 0, 0.5058824, 1,
1.360162, 1.750462, -0.7212618, 1, 0, 0.4980392, 1,
1.361944, 0.1996339, -0.2082625, 1, 0, 0.4901961, 1,
1.371287, 0.2597076, 1.801808, 1, 0, 0.4862745, 1,
1.378389, 0.02185506, 0.6098825, 1, 0, 0.4784314, 1,
1.384904, 1.593754, 0.490535, 1, 0, 0.4745098, 1,
1.399036, 0.09234412, 0.1381457, 1, 0, 0.4666667, 1,
1.401762, 0.9985355, 0.919947, 1, 0, 0.4627451, 1,
1.421039, 0.6475414, 1.661384, 1, 0, 0.454902, 1,
1.427554, 0.6193942, 1.794943, 1, 0, 0.4509804, 1,
1.43088, 0.3702247, -1.261576, 1, 0, 0.4431373, 1,
1.431669, -0.2434755, 2.02965, 1, 0, 0.4392157, 1,
1.432372, 1.19821, 2.020579, 1, 0, 0.4313726, 1,
1.433007, 0.09291299, 1.28202, 1, 0, 0.427451, 1,
1.441975, 0.1642743, 0.6288765, 1, 0, 0.4196078, 1,
1.45322, -0.2801434, 0.3667696, 1, 0, 0.4156863, 1,
1.455948, 0.5856285, 1.572744, 1, 0, 0.4078431, 1,
1.464562, 0.234953, 1.236712, 1, 0, 0.4039216, 1,
1.469512, -0.8765505, 2.084786, 1, 0, 0.3960784, 1,
1.471778, -0.5515371, 1.248328, 1, 0, 0.3882353, 1,
1.490774, 0.8904445, -0.1848194, 1, 0, 0.3843137, 1,
1.490958, 0.5645518, 0.09994531, 1, 0, 0.3764706, 1,
1.493377, -0.6682409, 1.4485, 1, 0, 0.372549, 1,
1.494986, 1.518796, 0.0809135, 1, 0, 0.3647059, 1,
1.499897, 0.2387127, 1.355193, 1, 0, 0.3607843, 1,
1.521974, -2.975162, 3.93542, 1, 0, 0.3529412, 1,
1.535575, 0.2982057, 0.1709482, 1, 0, 0.3490196, 1,
1.535715, 2.439635, 0.1578381, 1, 0, 0.3411765, 1,
1.540587, 0.281807, 2.828239, 1, 0, 0.3372549, 1,
1.542766, 0.3287485, 0.1633186, 1, 0, 0.3294118, 1,
1.546734, -0.2396684, 2.531893, 1, 0, 0.3254902, 1,
1.560104, 0.09282629, -0.2626251, 1, 0, 0.3176471, 1,
1.573336, -0.5565324, 2.110144, 1, 0, 0.3137255, 1,
1.581467, 1.184456, 0.7128266, 1, 0, 0.3058824, 1,
1.582694, -0.2769133, 0.2655213, 1, 0, 0.2980392, 1,
1.583496, -0.3478341, 1.466489, 1, 0, 0.2941177, 1,
1.589483, 0.3977636, 2.676677, 1, 0, 0.2862745, 1,
1.604622, -0.5810905, 3.136785, 1, 0, 0.282353, 1,
1.624674, -0.2969765, 3.05333, 1, 0, 0.2745098, 1,
1.625456, 1.492692, 1.690791, 1, 0, 0.2705882, 1,
1.634942, 1.635581, -0.04201275, 1, 0, 0.2627451, 1,
1.638914, 0.08592195, 2.677605, 1, 0, 0.2588235, 1,
1.639517, 0.285501, 1.954152, 1, 0, 0.2509804, 1,
1.664544, 1.606228, -0.2453885, 1, 0, 0.2470588, 1,
1.691091, -0.5726314, 3.251219, 1, 0, 0.2392157, 1,
1.691811, -0.918342, 1.107476, 1, 0, 0.2352941, 1,
1.696105, -1.655346, 1.412584, 1, 0, 0.227451, 1,
1.701774, 1.497931, 1.711385, 1, 0, 0.2235294, 1,
1.724466, -0.7456633, 1.15614, 1, 0, 0.2156863, 1,
1.739204, 0.5179706, 1.422971, 1, 0, 0.2117647, 1,
1.741251, 0.03317542, 2.708997, 1, 0, 0.2039216, 1,
1.783123, -1.033713, 4.16416, 1, 0, 0.1960784, 1,
1.808165, -0.1170707, 1.816216, 1, 0, 0.1921569, 1,
1.852107, 1.802149, 1.221436, 1, 0, 0.1843137, 1,
1.881834, -0.734742, 3.090999, 1, 0, 0.1803922, 1,
1.883302, -0.3188896, 2.492142, 1, 0, 0.172549, 1,
1.901497, -1.067447, 3.76296, 1, 0, 0.1686275, 1,
1.91442, -1.42151, 0.5305324, 1, 0, 0.1607843, 1,
1.917275, 1.065056, 0.6576383, 1, 0, 0.1568628, 1,
1.925507, 1.052503, 2.278178, 1, 0, 0.1490196, 1,
1.941313, -1.342233, 1.391548, 1, 0, 0.145098, 1,
1.941521, 1.490843, 2.168735, 1, 0, 0.1372549, 1,
1.954591, -0.9043543, 3.365545, 1, 0, 0.1333333, 1,
2.048187, 0.6611415, 1.420074, 1, 0, 0.1254902, 1,
2.067483, -1.370915, 2.654561, 1, 0, 0.1215686, 1,
2.096337, -0.322046, -0.06720346, 1, 0, 0.1137255, 1,
2.166998, 0.170524, 3.022157, 1, 0, 0.1098039, 1,
2.173856, 0.5187788, 0.2372659, 1, 0, 0.1019608, 1,
2.175588, -0.3158201, 1.872013, 1, 0, 0.09411765, 1,
2.180486, -0.6676688, 0.4645432, 1, 0, 0.09019608, 1,
2.222255, -0.5789374, 2.19335, 1, 0, 0.08235294, 1,
2.282057, -0.3801499, 2.330258, 1, 0, 0.07843138, 1,
2.287301, 0.1446953, 1.773147, 1, 0, 0.07058824, 1,
2.324303, 1.476, 0.3977079, 1, 0, 0.06666667, 1,
2.355735, -1.054898, 1.697337, 1, 0, 0.05882353, 1,
2.389347, -0.8516347, 1.185726, 1, 0, 0.05490196, 1,
2.399452, -0.3464037, 1.371839, 1, 0, 0.04705882, 1,
2.452323, 1.56036, 0.2527258, 1, 0, 0.04313726, 1,
2.482866, 0.5117515, 2.123339, 1, 0, 0.03529412, 1,
2.610553, -0.03929357, 2.243836, 1, 0, 0.03137255, 1,
2.843819, 1.391462, 3.287002, 1, 0, 0.02352941, 1,
2.878058, -0.195756, 1.087639, 1, 0, 0.01960784, 1,
2.879761, 0.889097, 0.2444558, 1, 0, 0.01176471, 1,
3.255756, -0.2975795, 1.002414, 1, 0, 0.007843138, 1
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
0.07566106, -4.332266, -7.141201, 0, -0.5, 0.5, 0.5,
0.07566106, -4.332266, -7.141201, 1, -0.5, 0.5, 0.5,
0.07566106, -4.332266, -7.141201, 1, 1.5, 0.5, 0.5,
0.07566106, -4.332266, -7.141201, 0, 1.5, 0.5, 0.5
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
-4.182486, 0.235703, -7.141201, 0, -0.5, 0.5, 0.5,
-4.182486, 0.235703, -7.141201, 1, -0.5, 0.5, 0.5,
-4.182486, 0.235703, -7.141201, 1, 1.5, 0.5, 0.5,
-4.182486, 0.235703, -7.141201, 0, 1.5, 0.5, 0.5
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
-4.182486, -4.332266, -0.3041053, 0, -0.5, 0.5, 0.5,
-4.182486, -4.332266, -0.3041053, 1, -0.5, 0.5, 0.5,
-4.182486, -4.332266, -0.3041053, 1, 1.5, 0.5, 0.5,
-4.182486, -4.332266, -0.3041053, 0, 1.5, 0.5, 0.5
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
-3, -3.278119, -5.563409,
3, -3.278119, -5.563409,
-3, -3.278119, -5.563409,
-3, -3.45381, -5.826375,
-2, -3.278119, -5.563409,
-2, -3.45381, -5.826375,
-1, -3.278119, -5.563409,
-1, -3.45381, -5.826375,
0, -3.278119, -5.563409,
0, -3.45381, -5.826375,
1, -3.278119, -5.563409,
1, -3.45381, -5.826375,
2, -3.278119, -5.563409,
2, -3.45381, -5.826375,
3, -3.278119, -5.563409,
3, -3.45381, -5.826375
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
-3, -3.805193, -6.352305, 0, -0.5, 0.5, 0.5,
-3, -3.805193, -6.352305, 1, -0.5, 0.5, 0.5,
-3, -3.805193, -6.352305, 1, 1.5, 0.5, 0.5,
-3, -3.805193, -6.352305, 0, 1.5, 0.5, 0.5,
-2, -3.805193, -6.352305, 0, -0.5, 0.5, 0.5,
-2, -3.805193, -6.352305, 1, -0.5, 0.5, 0.5,
-2, -3.805193, -6.352305, 1, 1.5, 0.5, 0.5,
-2, -3.805193, -6.352305, 0, 1.5, 0.5, 0.5,
-1, -3.805193, -6.352305, 0, -0.5, 0.5, 0.5,
-1, -3.805193, -6.352305, 1, -0.5, 0.5, 0.5,
-1, -3.805193, -6.352305, 1, 1.5, 0.5, 0.5,
-1, -3.805193, -6.352305, 0, 1.5, 0.5, 0.5,
0, -3.805193, -6.352305, 0, -0.5, 0.5, 0.5,
0, -3.805193, -6.352305, 1, -0.5, 0.5, 0.5,
0, -3.805193, -6.352305, 1, 1.5, 0.5, 0.5,
0, -3.805193, -6.352305, 0, 1.5, 0.5, 0.5,
1, -3.805193, -6.352305, 0, -0.5, 0.5, 0.5,
1, -3.805193, -6.352305, 1, -0.5, 0.5, 0.5,
1, -3.805193, -6.352305, 1, 1.5, 0.5, 0.5,
1, -3.805193, -6.352305, 0, 1.5, 0.5, 0.5,
2, -3.805193, -6.352305, 0, -0.5, 0.5, 0.5,
2, -3.805193, -6.352305, 1, -0.5, 0.5, 0.5,
2, -3.805193, -6.352305, 1, 1.5, 0.5, 0.5,
2, -3.805193, -6.352305, 0, 1.5, 0.5, 0.5,
3, -3.805193, -6.352305, 0, -0.5, 0.5, 0.5,
3, -3.805193, -6.352305, 1, -0.5, 0.5, 0.5,
3, -3.805193, -6.352305, 1, 1.5, 0.5, 0.5,
3, -3.805193, -6.352305, 0, 1.5, 0.5, 0.5
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
-3.199836, -3, -5.563409,
-3.199836, 3, -5.563409,
-3.199836, -3, -5.563409,
-3.363611, -3, -5.826375,
-3.199836, -2, -5.563409,
-3.363611, -2, -5.826375,
-3.199836, -1, -5.563409,
-3.363611, -1, -5.826375,
-3.199836, 0, -5.563409,
-3.363611, 0, -5.826375,
-3.199836, 1, -5.563409,
-3.363611, 1, -5.826375,
-3.199836, 2, -5.563409,
-3.363611, 2, -5.826375,
-3.199836, 3, -5.563409,
-3.363611, 3, -5.826375
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
-3.691161, -3, -6.352305, 0, -0.5, 0.5, 0.5,
-3.691161, -3, -6.352305, 1, -0.5, 0.5, 0.5,
-3.691161, -3, -6.352305, 1, 1.5, 0.5, 0.5,
-3.691161, -3, -6.352305, 0, 1.5, 0.5, 0.5,
-3.691161, -2, -6.352305, 0, -0.5, 0.5, 0.5,
-3.691161, -2, -6.352305, 1, -0.5, 0.5, 0.5,
-3.691161, -2, -6.352305, 1, 1.5, 0.5, 0.5,
-3.691161, -2, -6.352305, 0, 1.5, 0.5, 0.5,
-3.691161, -1, -6.352305, 0, -0.5, 0.5, 0.5,
-3.691161, -1, -6.352305, 1, -0.5, 0.5, 0.5,
-3.691161, -1, -6.352305, 1, 1.5, 0.5, 0.5,
-3.691161, -1, -6.352305, 0, 1.5, 0.5, 0.5,
-3.691161, 0, -6.352305, 0, -0.5, 0.5, 0.5,
-3.691161, 0, -6.352305, 1, -0.5, 0.5, 0.5,
-3.691161, 0, -6.352305, 1, 1.5, 0.5, 0.5,
-3.691161, 0, -6.352305, 0, 1.5, 0.5, 0.5,
-3.691161, 1, -6.352305, 0, -0.5, 0.5, 0.5,
-3.691161, 1, -6.352305, 1, -0.5, 0.5, 0.5,
-3.691161, 1, -6.352305, 1, 1.5, 0.5, 0.5,
-3.691161, 1, -6.352305, 0, 1.5, 0.5, 0.5,
-3.691161, 2, -6.352305, 0, -0.5, 0.5, 0.5,
-3.691161, 2, -6.352305, 1, -0.5, 0.5, 0.5,
-3.691161, 2, -6.352305, 1, 1.5, 0.5, 0.5,
-3.691161, 2, -6.352305, 0, 1.5, 0.5, 0.5,
-3.691161, 3, -6.352305, 0, -0.5, 0.5, 0.5,
-3.691161, 3, -6.352305, 1, -0.5, 0.5, 0.5,
-3.691161, 3, -6.352305, 1, 1.5, 0.5, 0.5,
-3.691161, 3, -6.352305, 0, 1.5, 0.5, 0.5
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
-3.199836, -3.278119, -4,
-3.199836, -3.278119, 4,
-3.199836, -3.278119, -4,
-3.363611, -3.45381, -4,
-3.199836, -3.278119, -2,
-3.363611, -3.45381, -2,
-3.199836, -3.278119, 0,
-3.363611, -3.45381, 0,
-3.199836, -3.278119, 2,
-3.363611, -3.45381, 2,
-3.199836, -3.278119, 4,
-3.363611, -3.45381, 4
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
-3.691161, -3.805193, -4, 0, -0.5, 0.5, 0.5,
-3.691161, -3.805193, -4, 1, -0.5, 0.5, 0.5,
-3.691161, -3.805193, -4, 1, 1.5, 0.5, 0.5,
-3.691161, -3.805193, -4, 0, 1.5, 0.5, 0.5,
-3.691161, -3.805193, -2, 0, -0.5, 0.5, 0.5,
-3.691161, -3.805193, -2, 1, -0.5, 0.5, 0.5,
-3.691161, -3.805193, -2, 1, 1.5, 0.5, 0.5,
-3.691161, -3.805193, -2, 0, 1.5, 0.5, 0.5,
-3.691161, -3.805193, 0, 0, -0.5, 0.5, 0.5,
-3.691161, -3.805193, 0, 1, -0.5, 0.5, 0.5,
-3.691161, -3.805193, 0, 1, 1.5, 0.5, 0.5,
-3.691161, -3.805193, 0, 0, 1.5, 0.5, 0.5,
-3.691161, -3.805193, 2, 0, -0.5, 0.5, 0.5,
-3.691161, -3.805193, 2, 1, -0.5, 0.5, 0.5,
-3.691161, -3.805193, 2, 1, 1.5, 0.5, 0.5,
-3.691161, -3.805193, 2, 0, 1.5, 0.5, 0.5,
-3.691161, -3.805193, 4, 0, -0.5, 0.5, 0.5,
-3.691161, -3.805193, 4, 1, -0.5, 0.5, 0.5,
-3.691161, -3.805193, 4, 1, 1.5, 0.5, 0.5,
-3.691161, -3.805193, 4, 0, 1.5, 0.5, 0.5
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
-3.199836, -3.278119, -5.563409,
-3.199836, 3.749525, -5.563409,
-3.199836, -3.278119, 4.955199,
-3.199836, 3.749525, 4.955199,
-3.199836, -3.278119, -5.563409,
-3.199836, -3.278119, 4.955199,
-3.199836, 3.749525, -5.563409,
-3.199836, 3.749525, 4.955199,
-3.199836, -3.278119, -5.563409,
3.351159, -3.278119, -5.563409,
-3.199836, -3.278119, 4.955199,
3.351159, -3.278119, 4.955199,
-3.199836, 3.749525, -5.563409,
3.351159, 3.749525, -5.563409,
-3.199836, 3.749525, 4.955199,
3.351159, 3.749525, 4.955199,
3.351159, -3.278119, -5.563409,
3.351159, 3.749525, -5.563409,
3.351159, -3.278119, 4.955199,
3.351159, 3.749525, 4.955199,
3.351159, -3.278119, -5.563409,
3.351159, -3.278119, 4.955199,
3.351159, 3.749525, -5.563409,
3.351159, 3.749525, 4.955199
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
var radius = 7.607011;
var distance = 33.84446;
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
mvMatrix.translate( -0.07566106, -0.235703, 0.3041053 );
mvMatrix.scale( 1.255512, 1.170357, 0.7819332 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.84446);
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


