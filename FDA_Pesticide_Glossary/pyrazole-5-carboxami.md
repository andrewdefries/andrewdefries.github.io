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
-3.033688, 0.7276676, -2.261434, 1, 0, 0, 1,
-2.840811, -0.2228331, -0.6002463, 1, 0.007843138, 0, 1,
-2.725669, -0.02306415, -2.510586, 1, 0.01176471, 0, 1,
-2.662677, -1.913325, -2.080685, 1, 0.01960784, 0, 1,
-2.551579, -0.8308539, -2.918442, 1, 0.02352941, 0, 1,
-2.395379, 0.4810834, -1.774733, 1, 0.03137255, 0, 1,
-2.366771, -0.4231939, -1.252371, 1, 0.03529412, 0, 1,
-2.337226, -0.3767856, -0.2275323, 1, 0.04313726, 0, 1,
-2.333565, 0.3715066, -0.7932178, 1, 0.04705882, 0, 1,
-2.304915, 0.7673897, -1.220888, 1, 0.05490196, 0, 1,
-2.271598, -1.760048, -2.170147, 1, 0.05882353, 0, 1,
-2.223961, -0.905497, -0.8157887, 1, 0.06666667, 0, 1,
-2.218404, 0.6990571, -1.575932, 1, 0.07058824, 0, 1,
-2.198784, -1.001821, -1.539736, 1, 0.07843138, 0, 1,
-2.128323, -1.538932, -3.604649, 1, 0.08235294, 0, 1,
-2.116336, -0.1944912, -1.303781, 1, 0.09019608, 0, 1,
-2.09573, 1.084924, -0.9306828, 1, 0.09411765, 0, 1,
-1.997761, 0.06763788, -1.718846, 1, 0.1019608, 0, 1,
-1.988811, 1.210537, -2.122199, 1, 0.1098039, 0, 1,
-1.968547, 1.423276, -0.5543429, 1, 0.1137255, 0, 1,
-1.959692, -0.3635725, -3.973225, 1, 0.1215686, 0, 1,
-1.957415, 0.03950526, -1.540445, 1, 0.1254902, 0, 1,
-1.947635, -0.8473105, -0.9197947, 1, 0.1333333, 0, 1,
-1.93801, 0.5256121, -3.456359, 1, 0.1372549, 0, 1,
-1.919688, -2.508894, -1.42348, 1, 0.145098, 0, 1,
-1.904584, 0.7828112, -3.067068, 1, 0.1490196, 0, 1,
-1.901819, -0.2653644, -1.070865, 1, 0.1568628, 0, 1,
-1.899998, -0.883585, -1.965987, 1, 0.1607843, 0, 1,
-1.878446, -0.1276446, -2.10816, 1, 0.1686275, 0, 1,
-1.835056, -1.792068, -2.15382, 1, 0.172549, 0, 1,
-1.811857, -1.657035, -2.346416, 1, 0.1803922, 0, 1,
-1.806937, 0.1106995, -1.806877, 1, 0.1843137, 0, 1,
-1.787012, -0.4435436, -2.502284, 1, 0.1921569, 0, 1,
-1.786952, -0.6953815, -0.6524825, 1, 0.1960784, 0, 1,
-1.779648, -0.6066347, -0.7921021, 1, 0.2039216, 0, 1,
-1.770252, 0.05156456, -0.1477657, 1, 0.2117647, 0, 1,
-1.757322, 1.023516, -0.9752989, 1, 0.2156863, 0, 1,
-1.75385, 2.57588, -0.3931776, 1, 0.2235294, 0, 1,
-1.736548, -0.5351369, -1.792675, 1, 0.227451, 0, 1,
-1.726911, -2.052706, -2.454619, 1, 0.2352941, 0, 1,
-1.7253, 0.3665134, -0.1290955, 1, 0.2392157, 0, 1,
-1.722361, -0.3931742, -2.921669, 1, 0.2470588, 0, 1,
-1.715537, 0.7823587, -1.441275, 1, 0.2509804, 0, 1,
-1.708848, -0.4480309, -2.414481, 1, 0.2588235, 0, 1,
-1.687011, 0.6601233, -1.60591, 1, 0.2627451, 0, 1,
-1.672718, -1.01004, -2.921072, 1, 0.2705882, 0, 1,
-1.670809, 0.5934585, -1.728753, 1, 0.2745098, 0, 1,
-1.658297, 0.3349675, 0.3370736, 1, 0.282353, 0, 1,
-1.657991, -0.4017323, -3.239661, 1, 0.2862745, 0, 1,
-1.652063, -0.3673894, -1.013941, 1, 0.2941177, 0, 1,
-1.639999, -0.4645257, -3.058409, 1, 0.3019608, 0, 1,
-1.638941, -0.5709154, -2.855173, 1, 0.3058824, 0, 1,
-1.635548, -0.6575029, -1.867256, 1, 0.3137255, 0, 1,
-1.620369, -0.1384363, -0.9546583, 1, 0.3176471, 0, 1,
-1.61501, -2.101044, 0.4276065, 1, 0.3254902, 0, 1,
-1.611945, 1.899105, -2.276175, 1, 0.3294118, 0, 1,
-1.606496, 1.974215, -0.637407, 1, 0.3372549, 0, 1,
-1.598846, 0.3295381, -0.5652463, 1, 0.3411765, 0, 1,
-1.598343, 1.320642, -2.062233, 1, 0.3490196, 0, 1,
-1.589878, -1.857005, -0.9293162, 1, 0.3529412, 0, 1,
-1.585818, -1.774158, -3.479722, 1, 0.3607843, 0, 1,
-1.585282, -1.041373, -2.552972, 1, 0.3647059, 0, 1,
-1.585227, 0.2977418, 0.5011392, 1, 0.372549, 0, 1,
-1.58245, 0.4294861, -3.545138, 1, 0.3764706, 0, 1,
-1.556072, 1.035271, -0.8277563, 1, 0.3843137, 0, 1,
-1.54313, -0.6164645, -3.232366, 1, 0.3882353, 0, 1,
-1.540722, 0.5788684, -1.754568, 1, 0.3960784, 0, 1,
-1.53365, -0.1702327, -2.861935, 1, 0.4039216, 0, 1,
-1.531442, -0.9711536, -2.696398, 1, 0.4078431, 0, 1,
-1.530373, 1.120832, -0.6838845, 1, 0.4156863, 0, 1,
-1.52768, 0.2116628, -0.5427431, 1, 0.4196078, 0, 1,
-1.527177, -1.295248, -2.528101, 1, 0.427451, 0, 1,
-1.521233, -0.3666266, -0.7934583, 1, 0.4313726, 0, 1,
-1.513332, -0.8909602, -0.5271864, 1, 0.4392157, 0, 1,
-1.510624, -1.058642, -1.392401, 1, 0.4431373, 0, 1,
-1.509819, 0.2187876, 0.2035025, 1, 0.4509804, 0, 1,
-1.499208, 0.1149021, -2.614645, 1, 0.454902, 0, 1,
-1.499008, -0.5339194, -1.787036, 1, 0.4627451, 0, 1,
-1.498441, 0.3272114, -2.20893, 1, 0.4666667, 0, 1,
-1.496883, 1.188235, 1.078634, 1, 0.4745098, 0, 1,
-1.483671, 0.6728191, -1.389907, 1, 0.4784314, 0, 1,
-1.482864, -0.63019, -1.164385, 1, 0.4862745, 0, 1,
-1.475166, 0.488207, -1.008197, 1, 0.4901961, 0, 1,
-1.465973, -0.6128961, -1.123889, 1, 0.4980392, 0, 1,
-1.465284, -0.08706168, 0.2624919, 1, 0.5058824, 0, 1,
-1.463377, -0.9498959, -3.622768, 1, 0.509804, 0, 1,
-1.461469, 0.7607028, -1.750949, 1, 0.5176471, 0, 1,
-1.459679, -0.8533342, -1.434898, 1, 0.5215687, 0, 1,
-1.434768, -1.07985, -1.016544, 1, 0.5294118, 0, 1,
-1.433493, 1.483827, -0.5977558, 1, 0.5333334, 0, 1,
-1.431733, 1.305239, 1.24068, 1, 0.5411765, 0, 1,
-1.43126, -0.2423487, -1.78646, 1, 0.5450981, 0, 1,
-1.41402, -0.6240842, -3.218739, 1, 0.5529412, 0, 1,
-1.399364, -0.4285531, -1.841654, 1, 0.5568628, 0, 1,
-1.382331, -0.1123036, -2.233621, 1, 0.5647059, 0, 1,
-1.375332, 0.7699061, -1.518517, 1, 0.5686275, 0, 1,
-1.374671, 1.663543, 0.182736, 1, 0.5764706, 0, 1,
-1.372726, 1.157358, 0.3600203, 1, 0.5803922, 0, 1,
-1.363819, -0.9654735, -1.206102, 1, 0.5882353, 0, 1,
-1.35973, 0.6230097, -2.370303, 1, 0.5921569, 0, 1,
-1.359698, -1.919152, -1.517547, 1, 0.6, 0, 1,
-1.358674, -1.093483, -1.708845, 1, 0.6078432, 0, 1,
-1.329021, 0.9898864, -0.2622512, 1, 0.6117647, 0, 1,
-1.319831, 2.249694, 0.732143, 1, 0.6196079, 0, 1,
-1.316239, -0.561874, -1.195764, 1, 0.6235294, 0, 1,
-1.31483, 1.158813, -1.928973, 1, 0.6313726, 0, 1,
-1.307666, -0.3210552, -0.4957744, 1, 0.6352941, 0, 1,
-1.29597, -0.6715382, -1.504493, 1, 0.6431373, 0, 1,
-1.290178, -0.6658617, -2.627831, 1, 0.6470588, 0, 1,
-1.28084, -0.2653522, -1.995613, 1, 0.654902, 0, 1,
-1.272234, -0.3895255, -4.352792, 1, 0.6588235, 0, 1,
-1.271376, 0.7720011, 1.004299, 1, 0.6666667, 0, 1,
-1.261742, -0.5414029, -1.520867, 1, 0.6705883, 0, 1,
-1.257671, 2.390334, 0.09057416, 1, 0.6784314, 0, 1,
-1.246725, 0.9881877, -1.744645, 1, 0.682353, 0, 1,
-1.241627, 0.4534688, -1.401737, 1, 0.6901961, 0, 1,
-1.237619, 0.2206447, -1.684041, 1, 0.6941177, 0, 1,
-1.219944, 0.04496866, -2.348264, 1, 0.7019608, 0, 1,
-1.21292, 1.001367, -0.3262112, 1, 0.7098039, 0, 1,
-1.208108, -1.285324, -2.674349, 1, 0.7137255, 0, 1,
-1.203566, -0.0607245, -0.610264, 1, 0.7215686, 0, 1,
-1.200061, -1.664052, -2.69207, 1, 0.7254902, 0, 1,
-1.185714, -0.6765134, -2.374949, 1, 0.7333333, 0, 1,
-1.185656, -1.056235, -1.529411, 1, 0.7372549, 0, 1,
-1.183459, -1.564829, -3.527069, 1, 0.7450981, 0, 1,
-1.180567, 1.414805, -1.145958, 1, 0.7490196, 0, 1,
-1.175316, 0.3613684, -1.603138, 1, 0.7568628, 0, 1,
-1.175216, -0.7062536, -2.020324, 1, 0.7607843, 0, 1,
-1.173936, 0.3175237, -0.5132703, 1, 0.7686275, 0, 1,
-1.171268, 1.150838, -1.274321, 1, 0.772549, 0, 1,
-1.161106, 0.7200683, -1.063618, 1, 0.7803922, 0, 1,
-1.156857, -0.7881724, -1.811065, 1, 0.7843137, 0, 1,
-1.150057, 0.9702445, -0.9756899, 1, 0.7921569, 0, 1,
-1.148087, 0.6278542, -1.84987, 1, 0.7960784, 0, 1,
-1.147131, -0.5960005, -3.554232, 1, 0.8039216, 0, 1,
-1.145071, -1.599288, -4.264552, 1, 0.8117647, 0, 1,
-1.142817, 2.274074, -0.5263476, 1, 0.8156863, 0, 1,
-1.12722, -0.6886299, -1.995778, 1, 0.8235294, 0, 1,
-1.122971, 1.508032, -0.5806841, 1, 0.827451, 0, 1,
-1.118121, 1.224435, 1.172264, 1, 0.8352941, 0, 1,
-1.115728, 0.3626134, -2.873317, 1, 0.8392157, 0, 1,
-1.115399, 1.307464, -1.899941, 1, 0.8470588, 0, 1,
-1.114004, -1.185503, -1.868138, 1, 0.8509804, 0, 1,
-1.113205, -0.8910258, -1.847523, 1, 0.8588235, 0, 1,
-1.108587, -0.6009105, -2.467727, 1, 0.8627451, 0, 1,
-1.100771, -0.4677661, -2.910066, 1, 0.8705882, 0, 1,
-1.100379, 0.849301, -1.220726, 1, 0.8745098, 0, 1,
-1.097357, 0.3852056, -1.850926, 1, 0.8823529, 0, 1,
-1.088948, 0.2892986, -0.7140876, 1, 0.8862745, 0, 1,
-1.088855, 0.293247, -0.8046989, 1, 0.8941177, 0, 1,
-1.088277, -2.150527, -3.161389, 1, 0.8980392, 0, 1,
-1.079554, -0.7920318, -1.161986, 1, 0.9058824, 0, 1,
-1.072351, -0.574755, -2.27662, 1, 0.9137255, 0, 1,
-1.065989, 0.4377656, -1.646525, 1, 0.9176471, 0, 1,
-1.062526, -0.05414404, -2.818677, 1, 0.9254902, 0, 1,
-1.061393, 0.14932, -3.065054, 1, 0.9294118, 0, 1,
-1.057771, -1.949026, -2.544366, 1, 0.9372549, 0, 1,
-1.055498, -0.1305247, -1.261443, 1, 0.9411765, 0, 1,
-1.055417, 1.113363, -1.018204, 1, 0.9490196, 0, 1,
-1.046148, -0.6611813, -2.469784, 1, 0.9529412, 0, 1,
-1.045787, 0.9458818, -1.425635, 1, 0.9607843, 0, 1,
-1.041894, 0.6978487, -0.7057745, 1, 0.9647059, 0, 1,
-1.037534, 1.539067, -1.210766, 1, 0.972549, 0, 1,
-1.035649, 1.448781, -0.6670414, 1, 0.9764706, 0, 1,
-1.034491, -0.6910179, -2.623321, 1, 0.9843137, 0, 1,
-1.02892, 0.02115332, -1.134046, 1, 0.9882353, 0, 1,
-1.028597, -0.6723665, -3.832827, 1, 0.9960784, 0, 1,
-1.022221, 0.1429494, -0.8530936, 0.9960784, 1, 0, 1,
-1.017622, -0.9056128, -0.679054, 0.9921569, 1, 0, 1,
-1.005617, 0.822716, -0.3634418, 0.9843137, 1, 0, 1,
-1.001522, -0.457559, -1.951397, 0.9803922, 1, 0, 1,
-1.001426, -0.6477376, -3.254982, 0.972549, 1, 0, 1,
-0.9982617, 0.2588289, -0.4746847, 0.9686275, 1, 0, 1,
-0.9949296, -1.273094, -1.467363, 0.9607843, 1, 0, 1,
-0.9943803, -0.7489233, -1.131856, 0.9568627, 1, 0, 1,
-0.9889024, -0.3167619, -2.643674, 0.9490196, 1, 0, 1,
-0.9842719, -1.029622, -2.704585, 0.945098, 1, 0, 1,
-0.9802682, -0.0854057, -2.764609, 0.9372549, 1, 0, 1,
-0.9697462, -0.670657, -1.700168, 0.9333333, 1, 0, 1,
-0.9685414, 0.05398488, -1.062182, 0.9254902, 1, 0, 1,
-0.9657697, 0.190157, -0.9681356, 0.9215686, 1, 0, 1,
-0.9643293, -0.05363899, -3.27013, 0.9137255, 1, 0, 1,
-0.9637052, -0.3022099, -1.765435, 0.9098039, 1, 0, 1,
-0.9629515, 0.3072396, -1.222688, 0.9019608, 1, 0, 1,
-0.9600744, 0.3531781, -3.172905, 0.8941177, 1, 0, 1,
-0.951964, -0.8817317, -1.585385, 0.8901961, 1, 0, 1,
-0.9445314, 0.4911704, -2.927408, 0.8823529, 1, 0, 1,
-0.9444649, -0.3910012, 0.7190702, 0.8784314, 1, 0, 1,
-0.9385236, -0.4121313, -1.959724, 0.8705882, 1, 0, 1,
-0.9335812, 0.0706472, -3.037397, 0.8666667, 1, 0, 1,
-0.9321461, 0.1038557, -2.783983, 0.8588235, 1, 0, 1,
-0.9289573, 1.314071, -1.220433, 0.854902, 1, 0, 1,
-0.9255682, 0.7323115, -1.372574, 0.8470588, 1, 0, 1,
-0.9218963, -1.602607, -0.6670029, 0.8431373, 1, 0, 1,
-0.9211443, -1.493268, -0.9368855, 0.8352941, 1, 0, 1,
-0.9208164, 0.8986869, -1.392122, 0.8313726, 1, 0, 1,
-0.9180421, -1.009432, -2.336285, 0.8235294, 1, 0, 1,
-0.9074508, -1.126401, -2.787031, 0.8196079, 1, 0, 1,
-0.9066851, -0.6415755, -2.198584, 0.8117647, 1, 0, 1,
-0.9046826, -0.3436693, -2.075404, 0.8078431, 1, 0, 1,
-0.9028086, 0.5776875, -0.6983967, 0.8, 1, 0, 1,
-0.8923522, 0.7977907, -0.8658583, 0.7921569, 1, 0, 1,
-0.8915993, -0.1907007, -3.261527, 0.7882353, 1, 0, 1,
-0.8884381, 1.892807, -0.8627355, 0.7803922, 1, 0, 1,
-0.8839864, -1.818696, -2.281125, 0.7764706, 1, 0, 1,
-0.8807272, 1.84071, -0.2097373, 0.7686275, 1, 0, 1,
-0.8804029, -1.436027, -1.146981, 0.7647059, 1, 0, 1,
-0.8765571, 0.2848206, -0.3568817, 0.7568628, 1, 0, 1,
-0.8713579, -0.05095384, -0.6878246, 0.7529412, 1, 0, 1,
-0.8667939, 0.2805694, -1.910237, 0.7450981, 1, 0, 1,
-0.8652389, 0.4855418, -2.065614, 0.7411765, 1, 0, 1,
-0.8644626, 0.3078184, -1.583179, 0.7333333, 1, 0, 1,
-0.8581408, -0.4742914, -2.229628, 0.7294118, 1, 0, 1,
-0.8527865, -0.3710586, -0.9371648, 0.7215686, 1, 0, 1,
-0.8475133, -2.448061, -3.960655, 0.7176471, 1, 0, 1,
-0.8412411, -2.085878, -3.563704, 0.7098039, 1, 0, 1,
-0.8344854, -0.8816717, -2.130115, 0.7058824, 1, 0, 1,
-0.8334341, 0.1962118, -2.422836, 0.6980392, 1, 0, 1,
-0.8328281, -0.01106043, -2.582561, 0.6901961, 1, 0, 1,
-0.8296837, 0.09635191, -2.212658, 0.6862745, 1, 0, 1,
-0.8220994, -1.000184, -2.112699, 0.6784314, 1, 0, 1,
-0.8209717, 1.79508, -2.854347, 0.6745098, 1, 0, 1,
-0.820213, 1.318407, -0.08325876, 0.6666667, 1, 0, 1,
-0.8108709, 1.392552, 1.530216, 0.6627451, 1, 0, 1,
-0.8095214, 0.5524071, -1.222533, 0.654902, 1, 0, 1,
-0.803084, 0.6047627, -0.08364268, 0.6509804, 1, 0, 1,
-0.7972441, 0.08915434, -3.580706, 0.6431373, 1, 0, 1,
-0.7852957, -0.7982564, -2.837236, 0.6392157, 1, 0, 1,
-0.7804158, 0.3870037, -0.1741857, 0.6313726, 1, 0, 1,
-0.7738686, -1.749413, -1.348744, 0.627451, 1, 0, 1,
-0.7723995, -1.003777, -4.292964, 0.6196079, 1, 0, 1,
-0.7692819, 0.6925059, -2.76661, 0.6156863, 1, 0, 1,
-0.7678345, -0.1961986, -1.035981, 0.6078432, 1, 0, 1,
-0.7639316, -0.4554342, -3.25338, 0.6039216, 1, 0, 1,
-0.7574553, 1.02835, -0.03877499, 0.5960785, 1, 0, 1,
-0.7540125, -0.6027822, -1.978222, 0.5882353, 1, 0, 1,
-0.7515607, -1.074749, -1.512807, 0.5843138, 1, 0, 1,
-0.7514146, 0.251069, -0.1348391, 0.5764706, 1, 0, 1,
-0.7512481, -1.035658, -2.056641, 0.572549, 1, 0, 1,
-0.7475302, 0.5246348, -0.9799441, 0.5647059, 1, 0, 1,
-0.7438846, 0.7455624, -0.5113062, 0.5607843, 1, 0, 1,
-0.7363386, -2.629308, -3.251035, 0.5529412, 1, 0, 1,
-0.7362923, -2.075809, -2.180374, 0.5490196, 1, 0, 1,
-0.7348024, -0.1346697, -3.967443, 0.5411765, 1, 0, 1,
-0.729808, 1.889342, -1.182945, 0.5372549, 1, 0, 1,
-0.725997, -0.1417858, -3.792322, 0.5294118, 1, 0, 1,
-0.7168553, -1.057558, -1.98945, 0.5254902, 1, 0, 1,
-0.7053872, 0.03247613, -1.864436, 0.5176471, 1, 0, 1,
-0.7050917, 0.4224345, -1.471428, 0.5137255, 1, 0, 1,
-0.7049615, -1.149613, -2.454085, 0.5058824, 1, 0, 1,
-0.7048777, -0.7209303, -2.461466, 0.5019608, 1, 0, 1,
-0.703115, -1.463559, -2.875215, 0.4941176, 1, 0, 1,
-0.6967233, -1.081138, -2.506155, 0.4862745, 1, 0, 1,
-0.6923417, -0.2229534, -2.820499, 0.4823529, 1, 0, 1,
-0.6869866, 0.5782393, -1.942383, 0.4745098, 1, 0, 1,
-0.683583, -0.3810875, -0.69246, 0.4705882, 1, 0, 1,
-0.6803866, 0.1172799, -0.1747715, 0.4627451, 1, 0, 1,
-0.6771847, 1.008969, 0.5516562, 0.4588235, 1, 0, 1,
-0.6765805, -0.375907, -1.763488, 0.4509804, 1, 0, 1,
-0.668775, -0.2369959, -0.8399224, 0.4470588, 1, 0, 1,
-0.6666583, 0.4264264, -1.301903, 0.4392157, 1, 0, 1,
-0.6662675, 0.1677755, -1.104831, 0.4352941, 1, 0, 1,
-0.6654537, -1.027649, -4.236838, 0.427451, 1, 0, 1,
-0.6645272, 0.3673823, -0.8297589, 0.4235294, 1, 0, 1,
-0.6616774, 0.08341995, -1.714453, 0.4156863, 1, 0, 1,
-0.6616773, -1.146634, -2.730006, 0.4117647, 1, 0, 1,
-0.6594288, 0.09403454, -1.145682, 0.4039216, 1, 0, 1,
-0.6588501, 0.1469643, -0.5490121, 0.3960784, 1, 0, 1,
-0.657027, -0.01303009, -0.911357, 0.3921569, 1, 0, 1,
-0.6504379, 0.9075549, 0.02316834, 0.3843137, 1, 0, 1,
-0.6504298, 1.131236, -1.259944, 0.3803922, 1, 0, 1,
-0.6492181, -1.286593, -3.025077, 0.372549, 1, 0, 1,
-0.6467813, 0.3190788, -0.9834934, 0.3686275, 1, 0, 1,
-0.6421298, 0.07079074, -1.200973, 0.3607843, 1, 0, 1,
-0.639715, -0.1352775, -4.725725, 0.3568628, 1, 0, 1,
-0.6387129, 0.3753659, -1.648881, 0.3490196, 1, 0, 1,
-0.6366517, -1.446965, -1.865984, 0.345098, 1, 0, 1,
-0.6336142, -0.426693, -3.44633, 0.3372549, 1, 0, 1,
-0.6329076, -1.531531, -4.597303, 0.3333333, 1, 0, 1,
-0.6313056, 0.997674, -1.549202, 0.3254902, 1, 0, 1,
-0.6249974, 1.140612, 1.095624, 0.3215686, 1, 0, 1,
-0.6242996, 0.7083719, -1.23255, 0.3137255, 1, 0, 1,
-0.6134461, -0.3966178, -1.10208, 0.3098039, 1, 0, 1,
-0.611945, -0.1183288, -1.414034, 0.3019608, 1, 0, 1,
-0.6016755, 0.2809182, -0.7665922, 0.2941177, 1, 0, 1,
-0.6002018, -0.5797406, -3.430616, 0.2901961, 1, 0, 1,
-0.5976821, 1.12208, 0.9538332, 0.282353, 1, 0, 1,
-0.5956005, 1.964858, -0.6445485, 0.2784314, 1, 0, 1,
-0.5911639, -0.4701317, -1.9144, 0.2705882, 1, 0, 1,
-0.5867829, 0.1910255, -0.766829, 0.2666667, 1, 0, 1,
-0.5819606, 0.3630362, -2.293613, 0.2588235, 1, 0, 1,
-0.5761628, -1.209588, -3.920966, 0.254902, 1, 0, 1,
-0.5761215, 0.1126393, -2.721009, 0.2470588, 1, 0, 1,
-0.5675693, -0.1396459, -1.861074, 0.2431373, 1, 0, 1,
-0.5633503, -0.1984659, -2.969369, 0.2352941, 1, 0, 1,
-0.5555484, -1.980975, -2.214642, 0.2313726, 1, 0, 1,
-0.5555106, -1.695222, -2.987705, 0.2235294, 1, 0, 1,
-0.5470226, 0.01867479, -3.52008, 0.2196078, 1, 0, 1,
-0.5438877, -0.3651406, -0.9850489, 0.2117647, 1, 0, 1,
-0.5436609, 0.3989838, -0.8993872, 0.2078431, 1, 0, 1,
-0.542597, -0.7717212, -2.362592, 0.2, 1, 0, 1,
-0.5380244, -0.4137846, -1.174355, 0.1921569, 1, 0, 1,
-0.5368345, -0.5202302, -1.8116, 0.1882353, 1, 0, 1,
-0.5331237, -0.5711801, -3.355308, 0.1803922, 1, 0, 1,
-0.5293057, 0.08221716, -1.737409, 0.1764706, 1, 0, 1,
-0.5287488, 0.9158896, -1.55393, 0.1686275, 1, 0, 1,
-0.5247046, 0.02201292, -1.598531, 0.1647059, 1, 0, 1,
-0.5232427, -1.434376, -2.021192, 0.1568628, 1, 0, 1,
-0.5201741, 0.05685214, -2.557462, 0.1529412, 1, 0, 1,
-0.5169477, -1.481165, -1.876419, 0.145098, 1, 0, 1,
-0.5156301, -0.155325, -2.653882, 0.1411765, 1, 0, 1,
-0.5138931, 0.2210313, -2.336195, 0.1333333, 1, 0, 1,
-0.5090224, 1.89203, -2.678473, 0.1294118, 1, 0, 1,
-0.5081598, -0.4791636, -2.470842, 0.1215686, 1, 0, 1,
-0.4996854, 0.6724439, -1.322225, 0.1176471, 1, 0, 1,
-0.4996836, 0.189041, -3.833441, 0.1098039, 1, 0, 1,
-0.4922457, -1.73133, -4.547868, 0.1058824, 1, 0, 1,
-0.4921797, -0.3513393, -1.350721, 0.09803922, 1, 0, 1,
-0.4906732, 0.7731794, -0.3196046, 0.09019608, 1, 0, 1,
-0.4835882, 2.58012, -0.2731252, 0.08627451, 1, 0, 1,
-0.4809282, 1.48749, -0.7739166, 0.07843138, 1, 0, 1,
-0.4788126, -1.034136, -3.163964, 0.07450981, 1, 0, 1,
-0.4785821, -0.2845377, -2.215797, 0.06666667, 1, 0, 1,
-0.4737384, 0.4837176, -0.5831386, 0.0627451, 1, 0, 1,
-0.4709234, 0.3140447, -0.3470883, 0.05490196, 1, 0, 1,
-0.4709053, -0.2011625, -1.095354, 0.05098039, 1, 0, 1,
-0.4704358, -0.5560485, -3.597798, 0.04313726, 1, 0, 1,
-0.4581615, 0.462298, -1.40399, 0.03921569, 1, 0, 1,
-0.4554832, 1.917288, 0.8266558, 0.03137255, 1, 0, 1,
-0.451389, -1.090446, -1.364007, 0.02745098, 1, 0, 1,
-0.4510027, -0.1087974, -3.383583, 0.01960784, 1, 0, 1,
-0.4487089, -0.7087369, -2.393645, 0.01568628, 1, 0, 1,
-0.4473183, -0.5920996, -3.085129, 0.007843138, 1, 0, 1,
-0.4438456, 0.1818797, -1.046968, 0.003921569, 1, 0, 1,
-0.4395565, -0.3447455, -2.916846, 0, 1, 0.003921569, 1,
-0.4390212, -0.5041427, -2.866192, 0, 1, 0.01176471, 1,
-0.4276011, -0.9509676, -4.010325, 0, 1, 0.01568628, 1,
-0.4267161, 1.019436, -1.002892, 0, 1, 0.02352941, 1,
-0.4250893, -0.8515828, -5.009262, 0, 1, 0.02745098, 1,
-0.4225409, 0.8745541, 0.8193123, 0, 1, 0.03529412, 1,
-0.4225188, 1.194396, -0.1007808, 0, 1, 0.03921569, 1,
-0.4209292, 0.07723906, -0.2582461, 0, 1, 0.04705882, 1,
-0.4106207, -1.076468, -1.809328, 0, 1, 0.05098039, 1,
-0.4100772, 0.3865364, -0.5048788, 0, 1, 0.05882353, 1,
-0.410014, -0.2595411, -4.071454, 0, 1, 0.0627451, 1,
-0.4056901, 0.4874791, -0.7652491, 0, 1, 0.07058824, 1,
-0.4055907, -0.6688119, -2.704994, 0, 1, 0.07450981, 1,
-0.4053685, -0.8100503, -3.92809, 0, 1, 0.08235294, 1,
-0.3941215, 1.686514, 0.3908053, 0, 1, 0.08627451, 1,
-0.3926395, 0.5775782, -0.4777309, 0, 1, 0.09411765, 1,
-0.3852708, 0.5299336, -0.4015655, 0, 1, 0.1019608, 1,
-0.3841358, -1.068477, -2.969564, 0, 1, 0.1058824, 1,
-0.3834908, 0.8125581, -0.206128, 0, 1, 0.1137255, 1,
-0.3834595, -0.01202721, -1.96454, 0, 1, 0.1176471, 1,
-0.3819181, -0.847482, -2.835817, 0, 1, 0.1254902, 1,
-0.3801935, 0.06590763, -3.123397, 0, 1, 0.1294118, 1,
-0.3760847, -0.6970502, -0.7069585, 0, 1, 0.1372549, 1,
-0.3707689, 1.646025, -0.7874001, 0, 1, 0.1411765, 1,
-0.3692177, 0.7461879, 0.8634753, 0, 1, 0.1490196, 1,
-0.3615761, -0.0546708, -2.158276, 0, 1, 0.1529412, 1,
-0.3576326, -2.199953, -2.837771, 0, 1, 0.1607843, 1,
-0.3571965, 1.212416, -0.6331293, 0, 1, 0.1647059, 1,
-0.3519981, 0.3948911, -0.1410338, 0, 1, 0.172549, 1,
-0.3437175, -0.7507017, -1.528632, 0, 1, 0.1764706, 1,
-0.3431109, 0.4219649, -1.307477, 0, 1, 0.1843137, 1,
-0.3386738, 0.4494462, -1.25576, 0, 1, 0.1882353, 1,
-0.337866, -0.02600756, -2.235112, 0, 1, 0.1960784, 1,
-0.3359465, -0.8572248, -2.243314, 0, 1, 0.2039216, 1,
-0.3351657, 1.536776, 1.056668, 0, 1, 0.2078431, 1,
-0.3346244, 0.4015093, -1.230214, 0, 1, 0.2156863, 1,
-0.3319238, -0.1251497, -0.8063589, 0, 1, 0.2196078, 1,
-0.3292592, 1.156976, -0.6959481, 0, 1, 0.227451, 1,
-0.3269818, -0.9694679, -1.5509, 0, 1, 0.2313726, 1,
-0.320829, -0.9285409, -2.842441, 0, 1, 0.2392157, 1,
-0.3154853, -3.822839, -3.65461, 0, 1, 0.2431373, 1,
-0.3152037, -0.7456769, -2.686321, 0, 1, 0.2509804, 1,
-0.3148209, 0.4803093, 0.4371356, 0, 1, 0.254902, 1,
-0.3107382, -0.6950406, -1.911438, 0, 1, 0.2627451, 1,
-0.309074, -0.1542336, -1.631829, 0, 1, 0.2666667, 1,
-0.298375, -1.486322, -0.832505, 0, 1, 0.2745098, 1,
-0.2965219, -0.532858, -1.865776, 0, 1, 0.2784314, 1,
-0.2939354, 1.445666, 0.376706, 0, 1, 0.2862745, 1,
-0.2938251, -0.7120187, -3.063311, 0, 1, 0.2901961, 1,
-0.2887652, -0.1719532, -2.313687, 0, 1, 0.2980392, 1,
-0.2862208, -1.27903, -3.846283, 0, 1, 0.3058824, 1,
-0.2808449, 0.3596602, -0.6925963, 0, 1, 0.3098039, 1,
-0.2803341, 2.464741, -0.7777336, 0, 1, 0.3176471, 1,
-0.2775553, -0.4453102, -2.959318, 0, 1, 0.3215686, 1,
-0.2736154, -0.8876556, -2.930277, 0, 1, 0.3294118, 1,
-0.2700661, -0.07887872, -1.73708, 0, 1, 0.3333333, 1,
-0.2700412, -0.1485207, -1.679207, 0, 1, 0.3411765, 1,
-0.2664436, -0.8721513, -2.705, 0, 1, 0.345098, 1,
-0.2660289, 1.173602, -2.760718, 0, 1, 0.3529412, 1,
-0.2624041, -0.8335344, -3.050998, 0, 1, 0.3568628, 1,
-0.2580193, -0.1053341, -0.6449226, 0, 1, 0.3647059, 1,
-0.2565443, 2.302286, 0.7320638, 0, 1, 0.3686275, 1,
-0.2502187, 1.128244, 0.08972654, 0, 1, 0.3764706, 1,
-0.24986, -0.692477, -3.403959, 0, 1, 0.3803922, 1,
-0.2468431, 2.10057, 1.067696, 0, 1, 0.3882353, 1,
-0.2434822, 1.101229, -0.7454037, 0, 1, 0.3921569, 1,
-0.2418806, -0.7886903, -3.246234, 0, 1, 0.4, 1,
-0.2404373, -0.4142581, -2.523408, 0, 1, 0.4078431, 1,
-0.2402763, -0.431906, -3.26741, 0, 1, 0.4117647, 1,
-0.2397516, -1.21834, -2.680231, 0, 1, 0.4196078, 1,
-0.2388854, 0.3002664, -0.5090454, 0, 1, 0.4235294, 1,
-0.2327649, -0.6991525, -3.178356, 0, 1, 0.4313726, 1,
-0.2272399, -0.8928277, -2.405913, 0, 1, 0.4352941, 1,
-0.224709, -2.066203, -6.850309, 0, 1, 0.4431373, 1,
-0.2243761, 1.791534, 0.5831103, 0, 1, 0.4470588, 1,
-0.2169184, 0.4064163, -1.936123, 0, 1, 0.454902, 1,
-0.2108715, -0.3768003, -2.180779, 0, 1, 0.4588235, 1,
-0.2069449, 0.01359873, -1.67437, 0, 1, 0.4666667, 1,
-0.2050434, -0.9905417, -1.48143, 0, 1, 0.4705882, 1,
-0.201393, 0.1701585, -1.651464, 0, 1, 0.4784314, 1,
-0.1960043, -0.0922945, -0.5179724, 0, 1, 0.4823529, 1,
-0.1886481, 1.611537, -0.08552363, 0, 1, 0.4901961, 1,
-0.1873542, 0.0180698, -0.671309, 0, 1, 0.4941176, 1,
-0.1830453, 1.884979, 0.2957686, 0, 1, 0.5019608, 1,
-0.1828386, 2.320953, -0.8282488, 0, 1, 0.509804, 1,
-0.1810355, -0.4880539, -0.9876385, 0, 1, 0.5137255, 1,
-0.1788602, -0.04770901, -1.501092, 0, 1, 0.5215687, 1,
-0.1757948, -0.3005053, -3.573985, 0, 1, 0.5254902, 1,
-0.1755293, -0.5047252, -2.903221, 0, 1, 0.5333334, 1,
-0.1724106, -0.3692439, -3.327298, 0, 1, 0.5372549, 1,
-0.1721978, -0.1268983, -3.109171, 0, 1, 0.5450981, 1,
-0.1717777, 1.037396, 0.4403844, 0, 1, 0.5490196, 1,
-0.1686155, 0.100428, 0.9305981, 0, 1, 0.5568628, 1,
-0.1635613, 1.01722, -1.038656, 0, 1, 0.5607843, 1,
-0.163316, -0.02448609, -1.104433, 0, 1, 0.5686275, 1,
-0.1580994, 0.9037229, 0.2121964, 0, 1, 0.572549, 1,
-0.1569993, 1.090645, -0.6257176, 0, 1, 0.5803922, 1,
-0.1563817, 1.85962, -0.1341897, 0, 1, 0.5843138, 1,
-0.152401, -1.148505, -1.367895, 0, 1, 0.5921569, 1,
-0.151316, -0.8304499, -3.657805, 0, 1, 0.5960785, 1,
-0.1511155, 1.363978, -0.3969083, 0, 1, 0.6039216, 1,
-0.1486982, 0.4394286, -2.346997, 0, 1, 0.6117647, 1,
-0.1472167, -2.3163, -1.906637, 0, 1, 0.6156863, 1,
-0.1444148, 1.60416, -0.2235321, 0, 1, 0.6235294, 1,
-0.1425862, -0.6753795, -3.25735, 0, 1, 0.627451, 1,
-0.1423488, -0.0539002, -1.821265, 0, 1, 0.6352941, 1,
-0.1382491, -1.299381, -2.84008, 0, 1, 0.6392157, 1,
-0.1338527, 0.7007159, 0.4616783, 0, 1, 0.6470588, 1,
-0.1318467, 2.029783, -0.1360357, 0, 1, 0.6509804, 1,
-0.1281094, -1.432714, -4.232646, 0, 1, 0.6588235, 1,
-0.127787, -0.01184356, -0.08962963, 0, 1, 0.6627451, 1,
-0.1268672, 0.6066234, -0.1748945, 0, 1, 0.6705883, 1,
-0.1254541, 0.06139651, -2.03158, 0, 1, 0.6745098, 1,
-0.1092558, -0.5559924, -3.57228, 0, 1, 0.682353, 1,
-0.1089455, 0.4967094, 0.6167549, 0, 1, 0.6862745, 1,
-0.1033399, -0.5197724, -2.019007, 0, 1, 0.6941177, 1,
-0.103232, 0.7229922, -0.9605736, 0, 1, 0.7019608, 1,
-0.1015242, 0.349402, -1.172187, 0, 1, 0.7058824, 1,
-0.1013594, 1.106046, -1.683366, 0, 1, 0.7137255, 1,
-0.1003634, -1.734959, -3.300382, 0, 1, 0.7176471, 1,
-0.09196179, 0.5399443, 0.5546263, 0, 1, 0.7254902, 1,
-0.08938596, 1.183497, -1.586111, 0, 1, 0.7294118, 1,
-0.08405267, 0.1658334, 0.4516119, 0, 1, 0.7372549, 1,
-0.07763307, -1.350795, -3.944796, 0, 1, 0.7411765, 1,
-0.07763156, 0.5888378, 0.2268981, 0, 1, 0.7490196, 1,
-0.07061169, -0.9966524, -3.989349, 0, 1, 0.7529412, 1,
-0.07023772, 0.9391008, 0.5604613, 0, 1, 0.7607843, 1,
-0.0700983, 0.303119, 0.423263, 0, 1, 0.7647059, 1,
-0.06863881, -0.8443608, -2.296485, 0, 1, 0.772549, 1,
-0.06655685, -0.4491231, -3.347181, 0, 1, 0.7764706, 1,
-0.06621698, -0.4119447, -2.780525, 0, 1, 0.7843137, 1,
-0.063892, 1.464558, -0.8748659, 0, 1, 0.7882353, 1,
-0.06289463, 0.8858907, 0.750522, 0, 1, 0.7960784, 1,
-0.06231775, -1.272034, -2.935488, 0, 1, 0.8039216, 1,
-0.05610333, 1.364673, -1.352744, 0, 1, 0.8078431, 1,
-0.05525735, 0.04338829, -2.330421, 0, 1, 0.8156863, 1,
-0.05509518, -1.407776, -3.380927, 0, 1, 0.8196079, 1,
-0.05477584, 2.120189, 1.590615, 0, 1, 0.827451, 1,
-0.05432827, 0.6019455, 0.8795766, 0, 1, 0.8313726, 1,
-0.05336144, 0.4269651, 0.3944933, 0, 1, 0.8392157, 1,
-0.05092163, 0.4134191, 0.4043607, 0, 1, 0.8431373, 1,
-0.05020375, 0.7568318, 1.335091, 0, 1, 0.8509804, 1,
-0.0493834, 0.2564117, -1.31958, 0, 1, 0.854902, 1,
-0.04572263, 0.06433356, 1.45138, 0, 1, 0.8627451, 1,
-0.04462914, -0.1752397, -2.697195, 0, 1, 0.8666667, 1,
-0.04451407, 0.305737, -1.8629, 0, 1, 0.8745098, 1,
-0.04037954, -0.07303616, -2.189952, 0, 1, 0.8784314, 1,
-0.0387906, -1.709053, -3.257473, 0, 1, 0.8862745, 1,
-0.03294598, 0.5081938, -0.4291493, 0, 1, 0.8901961, 1,
-0.02875321, 1.825974, -0.5643002, 0, 1, 0.8980392, 1,
-0.02614898, -0.2563141, -2.581172, 0, 1, 0.9058824, 1,
-0.02608511, 0.4048304, -2.889554, 0, 1, 0.9098039, 1,
-0.02397457, 0.1109941, -1.306748, 0, 1, 0.9176471, 1,
-0.01904288, -0.326897, -3.057239, 0, 1, 0.9215686, 1,
-0.01886287, 0.7398914, 0.6207634, 0, 1, 0.9294118, 1,
-0.01567635, -1.59616, -4.38187, 0, 1, 0.9333333, 1,
-0.01560862, 0.03276582, 0.1759056, 0, 1, 0.9411765, 1,
-0.01345109, 3.427122, -1.053524, 0, 1, 0.945098, 1,
-0.01050964, -2.882307, -3.351774, 0, 1, 0.9529412, 1,
-0.004475897, 0.4405172, 0.5655344, 0, 1, 0.9568627, 1,
-0.002796415, -0.7688996, -3.781251, 0, 1, 0.9647059, 1,
-0.0001703761, 0.4761416, -0.130964, 0, 1, 0.9686275, 1,
0.001472617, -0.3835322, 3.83608, 0, 1, 0.9764706, 1,
0.00250387, -1.132488, 2.739893, 0, 1, 0.9803922, 1,
0.002646633, -0.5468649, 0.8979225, 0, 1, 0.9882353, 1,
0.003299772, -2.272572, 5.201911, 0, 1, 0.9921569, 1,
0.003466498, 0.9753403, -0.4985251, 0, 1, 1, 1,
0.004847622, -0.4324762, 3.18353, 0, 0.9921569, 1, 1,
0.01376606, -0.2134885, 1.557384, 0, 0.9882353, 1, 1,
0.0222628, -1.959315, 1.762518, 0, 0.9803922, 1, 1,
0.02242989, 0.2173212, 0.7459019, 0, 0.9764706, 1, 1,
0.02247717, 0.06608462, -0.0400065, 0, 0.9686275, 1, 1,
0.02525387, -0.1236103, 3.002734, 0, 0.9647059, 1, 1,
0.0252736, 1.217982, -0.9491432, 0, 0.9568627, 1, 1,
0.02541001, 0.7658519, -0.2120398, 0, 0.9529412, 1, 1,
0.02959904, -0.1464091, 1.822371, 0, 0.945098, 1, 1,
0.03436869, -0.3497923, 3.451625, 0, 0.9411765, 1, 1,
0.03456292, 0.6869488, 0.1714326, 0, 0.9333333, 1, 1,
0.03725344, -0.2149128, 2.041853, 0, 0.9294118, 1, 1,
0.03754449, -0.4282725, 3.540812, 0, 0.9215686, 1, 1,
0.03763259, 0.1512655, -0.7442085, 0, 0.9176471, 1, 1,
0.03957263, 0.6250043, -1.909751, 0, 0.9098039, 1, 1,
0.04069501, -1.252977, 2.235422, 0, 0.9058824, 1, 1,
0.05023301, -0.6954378, 3.700648, 0, 0.8980392, 1, 1,
0.05156741, 0.7427678, 0.08393038, 0, 0.8901961, 1, 1,
0.05176856, -0.0323777, 1.817714, 0, 0.8862745, 1, 1,
0.05414079, 1.16606, 0.7905443, 0, 0.8784314, 1, 1,
0.05491654, -0.4411255, 3.919583, 0, 0.8745098, 1, 1,
0.05569872, -1.852675, 3.867993, 0, 0.8666667, 1, 1,
0.05652405, 1.889894, -0.6149229, 0, 0.8627451, 1, 1,
0.05700566, 0.7848992, -1.040545, 0, 0.854902, 1, 1,
0.05754217, 0.7440524, -0.8598639, 0, 0.8509804, 1, 1,
0.05871569, 0.3509725, 0.6264742, 0, 0.8431373, 1, 1,
0.06373735, 0.2589353, 1.036179, 0, 0.8392157, 1, 1,
0.06684989, 0.2398648, 0.8809649, 0, 0.8313726, 1, 1,
0.06692287, -0.8219177, 2.482079, 0, 0.827451, 1, 1,
0.06698723, -1.223262, 1.733112, 0, 0.8196079, 1, 1,
0.07249678, 0.9344587, -0.6146492, 0, 0.8156863, 1, 1,
0.07483923, 0.797788, -1.025355, 0, 0.8078431, 1, 1,
0.07832253, -0.05558516, 2.368797, 0, 0.8039216, 1, 1,
0.07898317, -1.896109, 2.811769, 0, 0.7960784, 1, 1,
0.07905085, -0.7265543, 3.901059, 0, 0.7882353, 1, 1,
0.08432933, 0.02235379, 0.2091648, 0, 0.7843137, 1, 1,
0.08497514, 1.413042, 1.706828, 0, 0.7764706, 1, 1,
0.0862451, 0.134412, 0.2058113, 0, 0.772549, 1, 1,
0.08875951, -1.126285, 2.403912, 0, 0.7647059, 1, 1,
0.09019698, -0.13957, 1.936089, 0, 0.7607843, 1, 1,
0.09161735, 1.355669, -1.820743, 0, 0.7529412, 1, 1,
0.09256166, -0.2364358, 1.367011, 0, 0.7490196, 1, 1,
0.0947734, -0.6792608, 4.650634, 0, 0.7411765, 1, 1,
0.09565052, 0.02281382, 2.863413, 0, 0.7372549, 1, 1,
0.09592524, -0.1500341, 0.7072431, 0, 0.7294118, 1, 1,
0.09646998, -0.7404037, 2.373929, 0, 0.7254902, 1, 1,
0.100452, -0.6272033, 1.893778, 0, 0.7176471, 1, 1,
0.1084311, 1.654343, 0.5189682, 0, 0.7137255, 1, 1,
0.1108027, -0.5722278, 2.821189, 0, 0.7058824, 1, 1,
0.1123805, -0.1841676, 2.463509, 0, 0.6980392, 1, 1,
0.1143235, -2.538484, 2.908, 0, 0.6941177, 1, 1,
0.1188815, 1.473173, 0.5093794, 0, 0.6862745, 1, 1,
0.1209983, -0.5291752, 2.852933, 0, 0.682353, 1, 1,
0.1220899, -0.8958772, 3.140541, 0, 0.6745098, 1, 1,
0.1226643, 0.6972222, 1.790273, 0, 0.6705883, 1, 1,
0.1302313, -1.873155, 2.858128, 0, 0.6627451, 1, 1,
0.1308914, -0.2444661, 4.358165, 0, 0.6588235, 1, 1,
0.1326108, -1.577131, 3.785335, 0, 0.6509804, 1, 1,
0.1427092, -0.6605602, 4.018418, 0, 0.6470588, 1, 1,
0.142845, -1.246198, 3.513077, 0, 0.6392157, 1, 1,
0.1461587, 1.17784, -1.264107, 0, 0.6352941, 1, 1,
0.148163, -2.302189, 3.137493, 0, 0.627451, 1, 1,
0.1488232, 1.812004, 1.081732, 0, 0.6235294, 1, 1,
0.1503902, -0.5641805, 2.923665, 0, 0.6156863, 1, 1,
0.1526757, -0.2137162, 1.865539, 0, 0.6117647, 1, 1,
0.1528759, -0.8381634, 4.216447, 0, 0.6039216, 1, 1,
0.1529337, 0.7431194, -0.07285468, 0, 0.5960785, 1, 1,
0.1549114, 0.03065142, -0.2402571, 0, 0.5921569, 1, 1,
0.1569016, 1.169057, -2.142918, 0, 0.5843138, 1, 1,
0.1595789, -0.1053314, 2.733731, 0, 0.5803922, 1, 1,
0.1611575, 1.262146, -0.7037537, 0, 0.572549, 1, 1,
0.1644466, 1.055218, -0.7792821, 0, 0.5686275, 1, 1,
0.1656465, -1.185182, 1.89868, 0, 0.5607843, 1, 1,
0.1668555, -1.208568, 3.802691, 0, 0.5568628, 1, 1,
0.1672637, -0.9186036, 2.238904, 0, 0.5490196, 1, 1,
0.1719532, 1.849905, -0.4290344, 0, 0.5450981, 1, 1,
0.1783304, 0.2551923, -0.5619802, 0, 0.5372549, 1, 1,
0.1808994, 0.9175996, -0.4879859, 0, 0.5333334, 1, 1,
0.1828015, -1.416479, 2.052172, 0, 0.5254902, 1, 1,
0.1935706, 0.7486289, 0.1828632, 0, 0.5215687, 1, 1,
0.1944198, -0.6949863, 1.8607, 0, 0.5137255, 1, 1,
0.195403, 0.547825, -0.1276554, 0, 0.509804, 1, 1,
0.2036867, -1.50399, 1.96691, 0, 0.5019608, 1, 1,
0.2122869, 0.5395638, -0.9951453, 0, 0.4941176, 1, 1,
0.2123999, -0.4151218, 2.673313, 0, 0.4901961, 1, 1,
0.2141204, -0.600681, 2.421314, 0, 0.4823529, 1, 1,
0.2194796, -0.4843079, 3.645753, 0, 0.4784314, 1, 1,
0.2218171, -0.5698496, 2.899082, 0, 0.4705882, 1, 1,
0.2220301, -0.08487073, 2.077662, 0, 0.4666667, 1, 1,
0.2230285, 1.262671, 1.026697, 0, 0.4588235, 1, 1,
0.2279686, 0.4768832, 2.995412, 0, 0.454902, 1, 1,
0.2315828, 2.576958, -0.7035051, 0, 0.4470588, 1, 1,
0.2393754, -0.4991304, 4.768166, 0, 0.4431373, 1, 1,
0.2412761, 0.1910599, 0.6951513, 0, 0.4352941, 1, 1,
0.2427198, -1.646477, 0.318045, 0, 0.4313726, 1, 1,
0.2436376, -0.4203594, 2.293276, 0, 0.4235294, 1, 1,
0.2470876, 0.2702034, -1.258836, 0, 0.4196078, 1, 1,
0.2489498, -1.886353, 2.878311, 0, 0.4117647, 1, 1,
0.2597427, 1.536922, 1.358881, 0, 0.4078431, 1, 1,
0.2600252, -1.451223, 1.62559, 0, 0.4, 1, 1,
0.2618748, -0.2789454, 2.841062, 0, 0.3921569, 1, 1,
0.2636603, -0.1879459, 2.131103, 0, 0.3882353, 1, 1,
0.2747416, 1.638704, -0.8467571, 0, 0.3803922, 1, 1,
0.2767031, -0.9336138, 3.246316, 0, 0.3764706, 1, 1,
0.281615, -0.592831, 4.855486, 0, 0.3686275, 1, 1,
0.2816628, -0.6564829, 3.016519, 0, 0.3647059, 1, 1,
0.2959445, -1.700402, 2.977191, 0, 0.3568628, 1, 1,
0.2971446, -0.05025829, 1.189675, 0, 0.3529412, 1, 1,
0.2991741, -1.641981, 2.507553, 0, 0.345098, 1, 1,
0.3013215, -0.9801981, 1.954097, 0, 0.3411765, 1, 1,
0.3014745, 0.2427864, 1.345809, 0, 0.3333333, 1, 1,
0.3018466, 1.004115, 0.3469435, 0, 0.3294118, 1, 1,
0.3030163, 0.569429, -0.07131683, 0, 0.3215686, 1, 1,
0.3055212, 0.2288515, 0.03982568, 0, 0.3176471, 1, 1,
0.3067707, -0.3251158, 2.155367, 0, 0.3098039, 1, 1,
0.3110378, 0.1125786, 2.042867, 0, 0.3058824, 1, 1,
0.313398, -1.076253, 1.77803, 0, 0.2980392, 1, 1,
0.3185458, 0.9144577, 0.5051863, 0, 0.2901961, 1, 1,
0.3219671, 0.8730187, -0.6386372, 0, 0.2862745, 1, 1,
0.327204, -0.6081289, 1.535703, 0, 0.2784314, 1, 1,
0.3294069, -0.8115178, 2.949521, 0, 0.2745098, 1, 1,
0.330255, 0.003500587, 2.647247, 0, 0.2666667, 1, 1,
0.331748, -1.220154, 2.910149, 0, 0.2627451, 1, 1,
0.332477, -0.3657252, 1.106386, 0, 0.254902, 1, 1,
0.3352728, -1.172533, 3.163752, 0, 0.2509804, 1, 1,
0.3352951, 0.2950074, 2.286058, 0, 0.2431373, 1, 1,
0.3369966, 1.059665, 0.3483565, 0, 0.2392157, 1, 1,
0.3375554, -0.1497364, 2.021122, 0, 0.2313726, 1, 1,
0.3378537, -0.8240169, 1.714973, 0, 0.227451, 1, 1,
0.3403343, -0.1606325, 1.407806, 0, 0.2196078, 1, 1,
0.3419082, 0.103188, 1.092785, 0, 0.2156863, 1, 1,
0.3456521, -1.665806, 1.747463, 0, 0.2078431, 1, 1,
0.3480188, 1.433261, 0.7055193, 0, 0.2039216, 1, 1,
0.3535359, -2.06247, 2.33989, 0, 0.1960784, 1, 1,
0.35394, -1.101589, 2.229587, 0, 0.1882353, 1, 1,
0.361662, -0.4543675, 4.003453, 0, 0.1843137, 1, 1,
0.3625444, -0.6100436, 3.041109, 0, 0.1764706, 1, 1,
0.3646148, 0.156303, 0.2243548, 0, 0.172549, 1, 1,
0.3693521, 1.211971, -0.3731083, 0, 0.1647059, 1, 1,
0.375014, 0.5992277, 0.5112844, 0, 0.1607843, 1, 1,
0.3788884, 0.6304075, 0.2991865, 0, 0.1529412, 1, 1,
0.3796358, 0.7238091, -0.5904862, 0, 0.1490196, 1, 1,
0.3854594, -1.161165, 4.581242, 0, 0.1411765, 1, 1,
0.3856108, -1.655715, 2.274398, 0, 0.1372549, 1, 1,
0.3881117, 0.1310844, -0.2914815, 0, 0.1294118, 1, 1,
0.3947257, -1.13804, 2.35064, 0, 0.1254902, 1, 1,
0.4000118, 0.6027979, -0.7046968, 0, 0.1176471, 1, 1,
0.4037566, -1.17502, 3.447659, 0, 0.1137255, 1, 1,
0.4039495, 0.9414291, 1.21364, 0, 0.1058824, 1, 1,
0.4067451, 0.7359792, -0.6210728, 0, 0.09803922, 1, 1,
0.4086502, -0.6135665, 1.709493, 0, 0.09411765, 1, 1,
0.409638, -0.5939759, 2.147881, 0, 0.08627451, 1, 1,
0.4164552, -1.829119, 2.019135, 0, 0.08235294, 1, 1,
0.4179063, -0.5194512, 3.213682, 0, 0.07450981, 1, 1,
0.4231774, -0.03812569, 1.467891, 0, 0.07058824, 1, 1,
0.4300367, 1.171396, 0.9781061, 0, 0.0627451, 1, 1,
0.430758, 0.288729, 3.563829, 0, 0.05882353, 1, 1,
0.4317351, 0.3660612, 2.176196, 0, 0.05098039, 1, 1,
0.4336819, -1.195896, 1.207694, 0, 0.04705882, 1, 1,
0.4346109, -1.056404, 3.266688, 0, 0.03921569, 1, 1,
0.4360791, 0.1340961, 1.189372, 0, 0.03529412, 1, 1,
0.4400571, -0.05571203, 1.515103, 0, 0.02745098, 1, 1,
0.4413527, -0.6580831, 4.001604, 0, 0.02352941, 1, 1,
0.4425703, 0.4562356, 0.3250211, 0, 0.01568628, 1, 1,
0.4426468, -1.839283, 2.969859, 0, 0.01176471, 1, 1,
0.4428704, 1.285087, 0.08773376, 0, 0.003921569, 1, 1,
0.4430361, -0.6110626, 4.568041, 0.003921569, 0, 1, 1,
0.4455875, -0.08890428, 2.677348, 0.007843138, 0, 1, 1,
0.4469059, -1.770778, 1.768523, 0.01568628, 0, 1, 1,
0.4553166, -0.2083557, 0.7836503, 0.01960784, 0, 1, 1,
0.4557775, -0.795275, 1.017228, 0.02745098, 0, 1, 1,
0.457936, 0.5355258, 0.06173454, 0.03137255, 0, 1, 1,
0.4601845, 0.6838837, -0.2752421, 0.03921569, 0, 1, 1,
0.4614687, -0.05208189, 1.578063, 0.04313726, 0, 1, 1,
0.4621019, -0.06823169, 0.7010213, 0.05098039, 0, 1, 1,
0.467001, 0.7729793, 1.456854, 0.05490196, 0, 1, 1,
0.4684621, 0.02960444, 1.929865, 0.0627451, 0, 1, 1,
0.4711031, 1.740076, 0.08959289, 0.06666667, 0, 1, 1,
0.4716014, 0.2422425, 1.00417, 0.07450981, 0, 1, 1,
0.4740741, -0.7548791, 2.399283, 0.07843138, 0, 1, 1,
0.4741324, -0.02350019, 0.5350383, 0.08627451, 0, 1, 1,
0.4742066, 0.1755903, 2.623293, 0.09019608, 0, 1, 1,
0.4748968, -0.265281, 2.096846, 0.09803922, 0, 1, 1,
0.4766328, 0.4519251, 0.8955735, 0.1058824, 0, 1, 1,
0.4788152, -1.723287, 2.503941, 0.1098039, 0, 1, 1,
0.4789355, 0.430831, 0.5469012, 0.1176471, 0, 1, 1,
0.4801775, 0.8979349, 2.397329, 0.1215686, 0, 1, 1,
0.4821066, -1.920491, 1.741338, 0.1294118, 0, 1, 1,
0.4846648, 0.9716247, 1.247093, 0.1333333, 0, 1, 1,
0.4901923, -0.8484902, 3.101934, 0.1411765, 0, 1, 1,
0.4908389, 0.6529514, 0.6313443, 0.145098, 0, 1, 1,
0.493859, -0.2761723, 3.503005, 0.1529412, 0, 1, 1,
0.4953519, -0.9653532, 3.263536, 0.1568628, 0, 1, 1,
0.4990678, 0.4295159, -0.7044635, 0.1647059, 0, 1, 1,
0.5021926, 1.086107, 1.463921, 0.1686275, 0, 1, 1,
0.5092857, 1.604042, 1.121992, 0.1764706, 0, 1, 1,
0.5110431, -1.111864, 2.194935, 0.1803922, 0, 1, 1,
0.5126792, 0.6216412, -0.867463, 0.1882353, 0, 1, 1,
0.5137278, 0.07365235, 3.439284, 0.1921569, 0, 1, 1,
0.5167382, -1.17734, 2.568237, 0.2, 0, 1, 1,
0.5188603, -0.2796594, 2.134762, 0.2078431, 0, 1, 1,
0.5193689, -0.3375588, 1.235649, 0.2117647, 0, 1, 1,
0.5197628, 1.589327, -0.227783, 0.2196078, 0, 1, 1,
0.5200176, 0.332192, 1.196122, 0.2235294, 0, 1, 1,
0.5222459, 0.724211, 2.222518, 0.2313726, 0, 1, 1,
0.5229324, -0.2429835, -0.260377, 0.2352941, 0, 1, 1,
0.5233228, 1.114683, 0.3139835, 0.2431373, 0, 1, 1,
0.5251187, 1.272116, 0.9068077, 0.2470588, 0, 1, 1,
0.5302494, 0.389586, 0.971841, 0.254902, 0, 1, 1,
0.5306656, 0.1322976, 1.531342, 0.2588235, 0, 1, 1,
0.5323455, -0.7905797, 3.206179, 0.2666667, 0, 1, 1,
0.5324504, -0.4359224, 0.386658, 0.2705882, 0, 1, 1,
0.5366257, -0.6268312, 1.990314, 0.2784314, 0, 1, 1,
0.538019, -3.014627, 2.480022, 0.282353, 0, 1, 1,
0.5403681, 1.022484, 1.586148, 0.2901961, 0, 1, 1,
0.5426806, -0.1867235, 1.235055, 0.2941177, 0, 1, 1,
0.5442507, 0.7476959, 0.9364659, 0.3019608, 0, 1, 1,
0.5617319, 0.2575316, 2.615582, 0.3098039, 0, 1, 1,
0.5644711, 1.574411, -0.2648887, 0.3137255, 0, 1, 1,
0.5715882, -0.5882124, 1.527964, 0.3215686, 0, 1, 1,
0.5717134, -1.801866, 3.39139, 0.3254902, 0, 1, 1,
0.5754191, -0.8609377, 1.307487, 0.3333333, 0, 1, 1,
0.5763372, -0.9974818, 1.223002, 0.3372549, 0, 1, 1,
0.5842508, -1.838064, 4.864936, 0.345098, 0, 1, 1,
0.592023, 0.3994761, 1.721723, 0.3490196, 0, 1, 1,
0.5945809, -0.6636483, 0.8708608, 0.3568628, 0, 1, 1,
0.5994552, 0.224539, 2.079793, 0.3607843, 0, 1, 1,
0.6003122, -0.4307084, 2.562188, 0.3686275, 0, 1, 1,
0.600577, -1.144836, 0.7840222, 0.372549, 0, 1, 1,
0.6038777, -0.8184327, 1.774794, 0.3803922, 0, 1, 1,
0.6073932, 0.263394, 0.8873186, 0.3843137, 0, 1, 1,
0.6074076, 0.6334311, -0.4252666, 0.3921569, 0, 1, 1,
0.6094424, -0.1762728, 1.755627, 0.3960784, 0, 1, 1,
0.6130216, 1.165037, 0.484984, 0.4039216, 0, 1, 1,
0.6187251, 0.1057424, 1.38916, 0.4117647, 0, 1, 1,
0.6197641, -0.3205701, 3.157168, 0.4156863, 0, 1, 1,
0.6203386, -0.7860681, 2.452137, 0.4235294, 0, 1, 1,
0.6230798, 0.6774084, 1.696066, 0.427451, 0, 1, 1,
0.6336607, -0.3501278, 2.088934, 0.4352941, 0, 1, 1,
0.6347905, -1.787195, 2.149091, 0.4392157, 0, 1, 1,
0.6400908, 0.4683719, 0.3286582, 0.4470588, 0, 1, 1,
0.6404364, 1.835564, 1.011946, 0.4509804, 0, 1, 1,
0.6415413, 0.2837438, 0.4545671, 0.4588235, 0, 1, 1,
0.6421516, -0.5824441, 1.484415, 0.4627451, 0, 1, 1,
0.6471084, -0.5108271, 1.412048, 0.4705882, 0, 1, 1,
0.6492491, 0.3691728, 1.610383, 0.4745098, 0, 1, 1,
0.6502461, 0.2554202, 1.087037, 0.4823529, 0, 1, 1,
0.6557475, 0.546494, 3.188043, 0.4862745, 0, 1, 1,
0.6575434, 0.2849822, 0.6510489, 0.4941176, 0, 1, 1,
0.6595295, -0.9459746, 0.3169739, 0.5019608, 0, 1, 1,
0.6598427, -2.063677, 2.403266, 0.5058824, 0, 1, 1,
0.6639451, 0.4978894, 0.7327904, 0.5137255, 0, 1, 1,
0.665442, -0.434699, 3.85536, 0.5176471, 0, 1, 1,
0.6658826, -2.332378, 0.9898501, 0.5254902, 0, 1, 1,
0.6727542, 1.06248, 0.1094704, 0.5294118, 0, 1, 1,
0.6741728, 2.162687, 0.04955116, 0.5372549, 0, 1, 1,
0.6742429, 1.410756, 0.8282599, 0.5411765, 0, 1, 1,
0.6742676, 1.201296, -0.8511195, 0.5490196, 0, 1, 1,
0.6797369, 0.2731791, 1.66452, 0.5529412, 0, 1, 1,
0.6803005, -1.091665, 4.225584, 0.5607843, 0, 1, 1,
0.6881952, 0.1659219, 0.9378999, 0.5647059, 0, 1, 1,
0.6893733, -1.15449, 2.579669, 0.572549, 0, 1, 1,
0.6928726, -1.367235, 2.026495, 0.5764706, 0, 1, 1,
0.694414, -0.3390146, 1.539616, 0.5843138, 0, 1, 1,
0.6951584, -0.5047523, 2.813433, 0.5882353, 0, 1, 1,
0.6955712, 0.1117429, 0.6297869, 0.5960785, 0, 1, 1,
0.7014005, 2.093514, -0.08002242, 0.6039216, 0, 1, 1,
0.7089622, -0.2659631, 3.013946, 0.6078432, 0, 1, 1,
0.7112519, -0.3015034, 1.405057, 0.6156863, 0, 1, 1,
0.7122365, -0.08088098, 0.4709806, 0.6196079, 0, 1, 1,
0.7141943, 0.6144903, -0.9198499, 0.627451, 0, 1, 1,
0.7146413, 1.322137, 2.362341, 0.6313726, 0, 1, 1,
0.7171469, 0.4089793, -0.3138161, 0.6392157, 0, 1, 1,
0.7336839, 2.267636, -0.2086733, 0.6431373, 0, 1, 1,
0.7346641, 0.1194718, 1.688452, 0.6509804, 0, 1, 1,
0.7346902, -2.495524, 3.163857, 0.654902, 0, 1, 1,
0.7381309, 0.04825481, 0.9040751, 0.6627451, 0, 1, 1,
0.7399542, -1.785361, 1.908145, 0.6666667, 0, 1, 1,
0.7454588, 2.023439, -0.2789662, 0.6745098, 0, 1, 1,
0.7476484, -0.1346785, 3.276195, 0.6784314, 0, 1, 1,
0.7505581, -1.536971, 0.3596448, 0.6862745, 0, 1, 1,
0.7570897, -0.1478443, 1.384764, 0.6901961, 0, 1, 1,
0.76281, 1.215995, 0.4957874, 0.6980392, 0, 1, 1,
0.7693117, -1.676342, 2.201626, 0.7058824, 0, 1, 1,
0.7694651, 1.02462, 0.4474944, 0.7098039, 0, 1, 1,
0.7706625, 0.2752297, 1.834077, 0.7176471, 0, 1, 1,
0.7719246, -0.02894567, 2.179406, 0.7215686, 0, 1, 1,
0.7803696, 0.9662625, 2.714009, 0.7294118, 0, 1, 1,
0.7806515, 1.463487, 0.2975838, 0.7333333, 0, 1, 1,
0.7894924, -0.1159332, 1.077413, 0.7411765, 0, 1, 1,
0.7953929, 0.4472611, -0.342413, 0.7450981, 0, 1, 1,
0.7975127, 0.699442, 0.9653026, 0.7529412, 0, 1, 1,
0.808523, -1.14188, 1.569182, 0.7568628, 0, 1, 1,
0.8099658, 1.048348, 0.3134489, 0.7647059, 0, 1, 1,
0.8113418, -0.1239269, 0.7574436, 0.7686275, 0, 1, 1,
0.8130696, 1.237242, -0.8939101, 0.7764706, 0, 1, 1,
0.8132493, -2.31803, 3.177367, 0.7803922, 0, 1, 1,
0.8158358, -0.8223746, 4.04159, 0.7882353, 0, 1, 1,
0.8162324, 0.6772488, 1.609746, 0.7921569, 0, 1, 1,
0.8180451, -1.125082, 2.809075, 0.8, 0, 1, 1,
0.8207204, 0.9632524, -0.9726822, 0.8078431, 0, 1, 1,
0.8266858, -0.5083875, 2.084962, 0.8117647, 0, 1, 1,
0.8281738, 0.2479446, 0.470356, 0.8196079, 0, 1, 1,
0.8286716, -1.620759, 2.388285, 0.8235294, 0, 1, 1,
0.8346974, -0.4858968, 1.62159, 0.8313726, 0, 1, 1,
0.8358941, -1.454729, 2.208946, 0.8352941, 0, 1, 1,
0.8365689, 0.5019289, 1.560127, 0.8431373, 0, 1, 1,
0.8384699, -0.0144517, 1.019878, 0.8470588, 0, 1, 1,
0.8403096, 1.208534, 0.7497762, 0.854902, 0, 1, 1,
0.8406665, -1.188102, 2.235348, 0.8588235, 0, 1, 1,
0.8424318, 0.4258995, 0.6842159, 0.8666667, 0, 1, 1,
0.8452736, 0.1077327, 2.843433, 0.8705882, 0, 1, 1,
0.8510251, -0.1613466, 2.506576, 0.8784314, 0, 1, 1,
0.8544571, 0.07444577, 2.11323, 0.8823529, 0, 1, 1,
0.8548646, 2.636998, 2.891118, 0.8901961, 0, 1, 1,
0.8578933, 1.664954, 1.561943, 0.8941177, 0, 1, 1,
0.8649064, 0.9392724, 0.7436416, 0.9019608, 0, 1, 1,
0.8712854, -1.604632, 2.184325, 0.9098039, 0, 1, 1,
0.8756193, -1.062667, 3.653683, 0.9137255, 0, 1, 1,
0.8787145, -0.5928348, 3.397152, 0.9215686, 0, 1, 1,
0.882676, 0.4527476, 0.9922895, 0.9254902, 0, 1, 1,
0.8951554, -1.010839, 2.938223, 0.9333333, 0, 1, 1,
0.8992799, 0.3573809, 2.296215, 0.9372549, 0, 1, 1,
0.9008716, 0.360042, 1.170803, 0.945098, 0, 1, 1,
0.9016767, -3.580341, 2.901272, 0.9490196, 0, 1, 1,
0.9017819, -1.248588, 1.372429, 0.9568627, 0, 1, 1,
0.9020405, -0.6737331, 2.68635, 0.9607843, 0, 1, 1,
0.9055361, 0.8899332, 2.209189, 0.9686275, 0, 1, 1,
0.9242228, 0.791674, 1.553586, 0.972549, 0, 1, 1,
0.9242373, -0.463518, 3.153766, 0.9803922, 0, 1, 1,
0.9476442, 0.6474126, 1.764922, 0.9843137, 0, 1, 1,
0.9509553, 1.473629, 0.4810703, 0.9921569, 0, 1, 1,
0.9533596, -0.2860117, 1.028182, 0.9960784, 0, 1, 1,
0.9654596, -1.531014, 2.421352, 1, 0, 0.9960784, 1,
0.9745312, -1.605941, 3.558519, 1, 0, 0.9882353, 1,
0.9758444, 1.655835, -0.1271371, 1, 0, 0.9843137, 1,
0.9849132, 2.806944, -0.2145226, 1, 0, 0.9764706, 1,
0.9901428, 1.300305, 2.171087, 1, 0, 0.972549, 1,
0.9923217, -1.324843, 1.09592, 1, 0, 0.9647059, 1,
0.9930466, -0.1573178, 2.619298, 1, 0, 0.9607843, 1,
1.003585, 0.0006978709, 0.7223456, 1, 0, 0.9529412, 1,
1.015185, 0.7655072, 2.049889, 1, 0, 0.9490196, 1,
1.017192, -0.3442021, 3.045333, 1, 0, 0.9411765, 1,
1.020292, 0.3253947, -0.03004625, 1, 0, 0.9372549, 1,
1.0226, 0.4856846, 0.7521605, 1, 0, 0.9294118, 1,
1.033976, 0.2684869, 1.759487, 1, 0, 0.9254902, 1,
1.043233, 0.04011773, 2.041459, 1, 0, 0.9176471, 1,
1.048628, -1.386154, 4.738997, 1, 0, 0.9137255, 1,
1.049472, -0.3739484, 3.102013, 1, 0, 0.9058824, 1,
1.054839, -0.3071178, 3.385378, 1, 0, 0.9019608, 1,
1.055229, -1.367125, 2.785193, 1, 0, 0.8941177, 1,
1.055839, 0.4324628, 1.347359, 1, 0, 0.8862745, 1,
1.059723, 0.618924, 0.8171142, 1, 0, 0.8823529, 1,
1.075255, 0.2518508, 1.426401, 1, 0, 0.8745098, 1,
1.082483, 0.00685735, -0.544918, 1, 0, 0.8705882, 1,
1.086946, 0.1464965, 1.113853, 1, 0, 0.8627451, 1,
1.087526, -1.104979, 2.607576, 1, 0, 0.8588235, 1,
1.108408, 1.168646, 0.466359, 1, 0, 0.8509804, 1,
1.109942, -1.637476, 1.606191, 1, 0, 0.8470588, 1,
1.11165, 2.4564, -0.2756017, 1, 0, 0.8392157, 1,
1.116773, 3.162486, -1.091894, 1, 0, 0.8352941, 1,
1.122114, 1.485908, 1.758882, 1, 0, 0.827451, 1,
1.129741, 0.1398048, 2.008737, 1, 0, 0.8235294, 1,
1.131971, 1.1349, 1.759444, 1, 0, 0.8156863, 1,
1.132725, -0.508969, 3.87018, 1, 0, 0.8117647, 1,
1.132997, -0.4647242, 1.964727, 1, 0, 0.8039216, 1,
1.135555, 0.6056517, 1.437731, 1, 0, 0.7960784, 1,
1.154902, 1.03572, 1.747649, 1, 0, 0.7921569, 1,
1.158596, -0.1611089, 1.090494, 1, 0, 0.7843137, 1,
1.159456, -0.7034602, 3.095476, 1, 0, 0.7803922, 1,
1.16495, 1.065925, -0.4183213, 1, 0, 0.772549, 1,
1.166037, -0.2959351, 1.685016, 1, 0, 0.7686275, 1,
1.171319, 0.7255515, -0.6984898, 1, 0, 0.7607843, 1,
1.174246, -1.932202, 1.912255, 1, 0, 0.7568628, 1,
1.176024, -0.3441477, 2.889141, 1, 0, 0.7490196, 1,
1.179945, 1.198333, 0.4445433, 1, 0, 0.7450981, 1,
1.18099, -0.5839119, 1.452423, 1, 0, 0.7372549, 1,
1.184622, -1.289845, 2.669749, 1, 0, 0.7333333, 1,
1.202275, 1.297664, 1.002898, 1, 0, 0.7254902, 1,
1.205372, 0.1260157, 0.8657774, 1, 0, 0.7215686, 1,
1.205691, -0.5224892, 2.751078, 1, 0, 0.7137255, 1,
1.213571, 0.04651845, 2.664219, 1, 0, 0.7098039, 1,
1.218099, 0.4817785, 2.57206, 1, 0, 0.7019608, 1,
1.222697, 0.5608902, 0.6182193, 1, 0, 0.6941177, 1,
1.226876, -0.2776792, 1.054894, 1, 0, 0.6901961, 1,
1.23046, 0.2126219, 0.9661241, 1, 0, 0.682353, 1,
1.232997, 0.04471941, 1.591517, 1, 0, 0.6784314, 1,
1.242054, 2.165258, 0.5891894, 1, 0, 0.6705883, 1,
1.242711, 2.031, 0.8362519, 1, 0, 0.6666667, 1,
1.246266, -0.3702301, 1.123757, 1, 0, 0.6588235, 1,
1.24729, 1.114567, 0.8354223, 1, 0, 0.654902, 1,
1.261085, -0.986937, 3.794144, 1, 0, 0.6470588, 1,
1.276028, 0.1090697, 0.6755648, 1, 0, 0.6431373, 1,
1.286034, -1.433809, 1.850408, 1, 0, 0.6352941, 1,
1.286405, 0.7968878, 2.11482, 1, 0, 0.6313726, 1,
1.297965, -1.159615, 3.723113, 1, 0, 0.6235294, 1,
1.305441, 1.134313, 1.975594, 1, 0, 0.6196079, 1,
1.306427, -1.667459, 3.875924, 1, 0, 0.6117647, 1,
1.313021, 0.9630008, 2.499029, 1, 0, 0.6078432, 1,
1.31512, 0.9008033, 2.365708, 1, 0, 0.6, 1,
1.315417, 0.1979547, 2.562189, 1, 0, 0.5921569, 1,
1.315878, 0.5998195, -1.04411, 1, 0, 0.5882353, 1,
1.322989, -0.5640991, 3.000496, 1, 0, 0.5803922, 1,
1.331456, -0.6931501, 0.4947168, 1, 0, 0.5764706, 1,
1.338782, -0.7910922, 1.884528, 1, 0, 0.5686275, 1,
1.339853, -0.0430162, 3.744147, 1, 0, 0.5647059, 1,
1.346534, -1.311393, 1.752237, 1, 0, 0.5568628, 1,
1.355993, 1.850278, 1.357874, 1, 0, 0.5529412, 1,
1.360888, -1.020902, 1.013291, 1, 0, 0.5450981, 1,
1.372759, 0.2271551, 0.5793573, 1, 0, 0.5411765, 1,
1.374716, -0.7952269, 3.244505, 1, 0, 0.5333334, 1,
1.37759, -1.985867, 3.797472, 1, 0, 0.5294118, 1,
1.380108, -1.585284, 2.728068, 1, 0, 0.5215687, 1,
1.38401, -0.3012554, 1.21342, 1, 0, 0.5176471, 1,
1.388226, -0.1015745, 2.563432, 1, 0, 0.509804, 1,
1.388961, -0.550827, 1.405585, 1, 0, 0.5058824, 1,
1.393008, 2.370912, 0.3458885, 1, 0, 0.4980392, 1,
1.397463, 0.4288541, 0.3814939, 1, 0, 0.4901961, 1,
1.404749, 0.8317133, 0.916481, 1, 0, 0.4862745, 1,
1.406846, 0.1143002, 0.03490491, 1, 0, 0.4784314, 1,
1.420961, 0.1452155, 3.275029, 1, 0, 0.4745098, 1,
1.428089, -0.3138455, -0.4238515, 1, 0, 0.4666667, 1,
1.43035, -0.7293037, 2.383495, 1, 0, 0.4627451, 1,
1.43434, -0.2972308, 2.158205, 1, 0, 0.454902, 1,
1.43743, 0.9159277, -0.2479275, 1, 0, 0.4509804, 1,
1.447931, 0.3555504, 2.703151, 1, 0, 0.4431373, 1,
1.44956, -0.5296074, 2.036733, 1, 0, 0.4392157, 1,
1.45142, 0.3711461, 1.279906, 1, 0, 0.4313726, 1,
1.463782, 0.8322514, 0.4524367, 1, 0, 0.427451, 1,
1.480821, 0.09507484, 1.542313, 1, 0, 0.4196078, 1,
1.489289, 0.6398448, 0.6709498, 1, 0, 0.4156863, 1,
1.494394, -1.841411, 3.270898, 1, 0, 0.4078431, 1,
1.498913, 0.5303295, -0.4155742, 1, 0, 0.4039216, 1,
1.500878, 1.137943, -0.4005614, 1, 0, 0.3960784, 1,
1.504472, 0.6663609, 0.5418195, 1, 0, 0.3882353, 1,
1.515491, -0.8078675, 1.787616, 1, 0, 0.3843137, 1,
1.534243, -0.4913751, 0.5046332, 1, 0, 0.3764706, 1,
1.544188, -0.6240551, 1.792198, 1, 0, 0.372549, 1,
1.555844, -0.316645, 2.828215, 1, 0, 0.3647059, 1,
1.560101, 0.02520311, 1.592673, 1, 0, 0.3607843, 1,
1.57191, 2.667903, 0.1019017, 1, 0, 0.3529412, 1,
1.590345, -0.6585569, 1.989144, 1, 0, 0.3490196, 1,
1.595832, -0.6683341, 3.14344, 1, 0, 0.3411765, 1,
1.607638, -0.3299387, 1.560314, 1, 0, 0.3372549, 1,
1.640093, -1.774082, 2.42033, 1, 0, 0.3294118, 1,
1.648837, 1.542779, -0.3194486, 1, 0, 0.3254902, 1,
1.667971, -0.6396877, 1.385733, 1, 0, 0.3176471, 1,
1.68697, 0.5032699, -0.7339064, 1, 0, 0.3137255, 1,
1.692091, 0.307149, 1.49095, 1, 0, 0.3058824, 1,
1.716898, 1.033781, 0.9411256, 1, 0, 0.2980392, 1,
1.721105, -3.129367, 2.114935, 1, 0, 0.2941177, 1,
1.722964, 0.1949188, -0.4117137, 1, 0, 0.2862745, 1,
1.733456, 1.117786, 0.7951126, 1, 0, 0.282353, 1,
1.779537, 0.8126849, 2.515033, 1, 0, 0.2745098, 1,
1.795503, 1.21584, -0.156929, 1, 0, 0.2705882, 1,
1.795609, -1.248459, 2.967846, 1, 0, 0.2627451, 1,
1.809314, 0.3842327, 2.309458, 1, 0, 0.2588235, 1,
1.810098, -2.480851, 2.474858, 1, 0, 0.2509804, 1,
1.810375, 1.109533, 1.297179, 1, 0, 0.2470588, 1,
1.810711, 1.810552, -0.300057, 1, 0, 0.2392157, 1,
1.815122, -1.710161, 1.273084, 1, 0, 0.2352941, 1,
1.823864, -0.8954883, 3.198493, 1, 0, 0.227451, 1,
1.834116, -1.748418, 3.051795, 1, 0, 0.2235294, 1,
1.837982, 0.8369051, 1.727936, 1, 0, 0.2156863, 1,
1.848221, 0.5463726, 1.563627, 1, 0, 0.2117647, 1,
1.853076, 0.04979098, 1.497411, 1, 0, 0.2039216, 1,
1.873304, -1.422623, 1.514006, 1, 0, 0.1960784, 1,
1.896163, -0.1448429, 2.683204, 1, 0, 0.1921569, 1,
1.902367, -0.3824084, 0.6505941, 1, 0, 0.1843137, 1,
1.935366, -0.4550614, 1.589193, 1, 0, 0.1803922, 1,
1.940259, 1.225406, 1.185392, 1, 0, 0.172549, 1,
1.942091, 0.2967083, 2.133101, 1, 0, 0.1686275, 1,
1.95611, -1.838758, 2.633274, 1, 0, 0.1607843, 1,
1.963623, -1.33536, 2.786288, 1, 0, 0.1568628, 1,
1.969961, -0.2774582, 1.592006, 1, 0, 0.1490196, 1,
1.979791, -1.000883, 1.780986, 1, 0, 0.145098, 1,
1.989706, 0.1647777, 1.981854, 1, 0, 0.1372549, 1,
2.019785, -0.3582947, 4.54491, 1, 0, 0.1333333, 1,
2.039819, 0.02081013, 2.282685, 1, 0, 0.1254902, 1,
2.045393, 2.103189, 0.4504865, 1, 0, 0.1215686, 1,
2.063807, 0.4681391, 2.035833, 1, 0, 0.1137255, 1,
2.06734, -1.642042, 2.758031, 1, 0, 0.1098039, 1,
2.101254, -0.8597956, 3.786506, 1, 0, 0.1019608, 1,
2.133935, 0.3860523, 1.478339, 1, 0, 0.09411765, 1,
2.143826, 0.3159645, 0.6729669, 1, 0, 0.09019608, 1,
2.18492, -0.8321131, 2.25946, 1, 0, 0.08235294, 1,
2.214553, -0.9228864, 2.469486, 1, 0, 0.07843138, 1,
2.220262, -1.580023, 3.920658, 1, 0, 0.07058824, 1,
2.242987, 0.5015692, 1.874769, 1, 0, 0.06666667, 1,
2.244702, 0.1859256, 1.014497, 1, 0, 0.05882353, 1,
2.27125, -0.06859973, 2.685619, 1, 0, 0.05490196, 1,
2.298754, 0.2039554, 0.551392, 1, 0, 0.04705882, 1,
2.479631, -0.290291, 3.282647, 1, 0, 0.04313726, 1,
2.513936, 0.5627673, 0.3445306, 1, 0, 0.03529412, 1,
2.540265, -0.7098768, 2.766003, 1, 0, 0.03137255, 1,
2.563411, 0.1033715, 0.3612424, 1, 0, 0.02352941, 1,
2.675213, 2.043456, -0.5576425, 1, 0, 0.01960784, 1,
2.699739, -1.407677, 2.301886, 1, 0, 0.01176471, 1,
2.794299, 0.7459125, 0.7636834, 1, 0, 0.007843138, 1
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
-0.1196946, -5.051708, -8.89316, 0, -0.5, 0.5, 0.5,
-0.1196946, -5.051708, -8.89316, 1, -0.5, 0.5, 0.5,
-0.1196946, -5.051708, -8.89316, 1, 1.5, 0.5, 0.5,
-0.1196946, -5.051708, -8.89316, 0, 1.5, 0.5, 0.5
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
-4.021532, -0.1978587, -8.89316, 0, -0.5, 0.5, 0.5,
-4.021532, -0.1978587, -8.89316, 1, -0.5, 0.5, 0.5,
-4.021532, -0.1978587, -8.89316, 1, 1.5, 0.5, 0.5,
-4.021532, -0.1978587, -8.89316, 0, 1.5, 0.5, 0.5
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
-4.021532, -5.051708, -0.8241987, 0, -0.5, 0.5, 0.5,
-4.021532, -5.051708, -0.8241987, 1, -0.5, 0.5, 0.5,
-4.021532, -5.051708, -0.8241987, 1, 1.5, 0.5, 0.5,
-4.021532, -5.051708, -0.8241987, 0, 1.5, 0.5, 0.5
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
-3, -3.931589, -7.031092,
2, -3.931589, -7.031092,
-3, -3.931589, -7.031092,
-3, -4.118276, -7.341437,
-2, -3.931589, -7.031092,
-2, -4.118276, -7.341437,
-1, -3.931589, -7.031092,
-1, -4.118276, -7.341437,
0, -3.931589, -7.031092,
0, -4.118276, -7.341437,
1, -3.931589, -7.031092,
1, -4.118276, -7.341437,
2, -3.931589, -7.031092,
2, -4.118276, -7.341437
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
-3, -4.491649, -7.962126, 0, -0.5, 0.5, 0.5,
-3, -4.491649, -7.962126, 1, -0.5, 0.5, 0.5,
-3, -4.491649, -7.962126, 1, 1.5, 0.5, 0.5,
-3, -4.491649, -7.962126, 0, 1.5, 0.5, 0.5,
-2, -4.491649, -7.962126, 0, -0.5, 0.5, 0.5,
-2, -4.491649, -7.962126, 1, -0.5, 0.5, 0.5,
-2, -4.491649, -7.962126, 1, 1.5, 0.5, 0.5,
-2, -4.491649, -7.962126, 0, 1.5, 0.5, 0.5,
-1, -4.491649, -7.962126, 0, -0.5, 0.5, 0.5,
-1, -4.491649, -7.962126, 1, -0.5, 0.5, 0.5,
-1, -4.491649, -7.962126, 1, 1.5, 0.5, 0.5,
-1, -4.491649, -7.962126, 0, 1.5, 0.5, 0.5,
0, -4.491649, -7.962126, 0, -0.5, 0.5, 0.5,
0, -4.491649, -7.962126, 1, -0.5, 0.5, 0.5,
0, -4.491649, -7.962126, 1, 1.5, 0.5, 0.5,
0, -4.491649, -7.962126, 0, 1.5, 0.5, 0.5,
1, -4.491649, -7.962126, 0, -0.5, 0.5, 0.5,
1, -4.491649, -7.962126, 1, -0.5, 0.5, 0.5,
1, -4.491649, -7.962126, 1, 1.5, 0.5, 0.5,
1, -4.491649, -7.962126, 0, 1.5, 0.5, 0.5,
2, -4.491649, -7.962126, 0, -0.5, 0.5, 0.5,
2, -4.491649, -7.962126, 1, -0.5, 0.5, 0.5,
2, -4.491649, -7.962126, 1, 1.5, 0.5, 0.5,
2, -4.491649, -7.962126, 0, 1.5, 0.5, 0.5
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
-3.121108, -2, -7.031092,
-3.121108, 2, -7.031092,
-3.121108, -2, -7.031092,
-3.271178, -2, -7.341437,
-3.121108, 0, -7.031092,
-3.271178, 0, -7.341437,
-3.121108, 2, -7.031092,
-3.271178, 2, -7.341437
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
"0",
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
-3.57132, -2, -7.962126, 0, -0.5, 0.5, 0.5,
-3.57132, -2, -7.962126, 1, -0.5, 0.5, 0.5,
-3.57132, -2, -7.962126, 1, 1.5, 0.5, 0.5,
-3.57132, -2, -7.962126, 0, 1.5, 0.5, 0.5,
-3.57132, 0, -7.962126, 0, -0.5, 0.5, 0.5,
-3.57132, 0, -7.962126, 1, -0.5, 0.5, 0.5,
-3.57132, 0, -7.962126, 1, 1.5, 0.5, 0.5,
-3.57132, 0, -7.962126, 0, 1.5, 0.5, 0.5,
-3.57132, 2, -7.962126, 0, -0.5, 0.5, 0.5,
-3.57132, 2, -7.962126, 1, -0.5, 0.5, 0.5,
-3.57132, 2, -7.962126, 1, 1.5, 0.5, 0.5,
-3.57132, 2, -7.962126, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.121108, -3.931589, -6,
-3.121108, -3.931589, 4,
-3.121108, -3.931589, -6,
-3.271178, -4.118276, -6,
-3.121108, -3.931589, -4,
-3.271178, -4.118276, -4,
-3.121108, -3.931589, -2,
-3.271178, -4.118276, -2,
-3.121108, -3.931589, 0,
-3.271178, -4.118276, 0,
-3.121108, -3.931589, 2,
-3.271178, -4.118276, 2,
-3.121108, -3.931589, 4,
-3.271178, -4.118276, 4
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
"-6",
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
-3.57132, -4.491649, -6, 0, -0.5, 0.5, 0.5,
-3.57132, -4.491649, -6, 1, -0.5, 0.5, 0.5,
-3.57132, -4.491649, -6, 1, 1.5, 0.5, 0.5,
-3.57132, -4.491649, -6, 0, 1.5, 0.5, 0.5,
-3.57132, -4.491649, -4, 0, -0.5, 0.5, 0.5,
-3.57132, -4.491649, -4, 1, -0.5, 0.5, 0.5,
-3.57132, -4.491649, -4, 1, 1.5, 0.5, 0.5,
-3.57132, -4.491649, -4, 0, 1.5, 0.5, 0.5,
-3.57132, -4.491649, -2, 0, -0.5, 0.5, 0.5,
-3.57132, -4.491649, -2, 1, -0.5, 0.5, 0.5,
-3.57132, -4.491649, -2, 1, 1.5, 0.5, 0.5,
-3.57132, -4.491649, -2, 0, 1.5, 0.5, 0.5,
-3.57132, -4.491649, 0, 0, -0.5, 0.5, 0.5,
-3.57132, -4.491649, 0, 1, -0.5, 0.5, 0.5,
-3.57132, -4.491649, 0, 1, 1.5, 0.5, 0.5,
-3.57132, -4.491649, 0, 0, 1.5, 0.5, 0.5,
-3.57132, -4.491649, 2, 0, -0.5, 0.5, 0.5,
-3.57132, -4.491649, 2, 1, -0.5, 0.5, 0.5,
-3.57132, -4.491649, 2, 1, 1.5, 0.5, 0.5,
-3.57132, -4.491649, 2, 0, 1.5, 0.5, 0.5,
-3.57132, -4.491649, 4, 0, -0.5, 0.5, 0.5,
-3.57132, -4.491649, 4, 1, -0.5, 0.5, 0.5,
-3.57132, -4.491649, 4, 1, 1.5, 0.5, 0.5,
-3.57132, -4.491649, 4, 0, 1.5, 0.5, 0.5
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
-3.121108, -3.931589, -7.031092,
-3.121108, 3.535872, -7.031092,
-3.121108, -3.931589, 5.382695,
-3.121108, 3.535872, 5.382695,
-3.121108, -3.931589, -7.031092,
-3.121108, -3.931589, 5.382695,
-3.121108, 3.535872, -7.031092,
-3.121108, 3.535872, 5.382695,
-3.121108, -3.931589, -7.031092,
2.881719, -3.931589, -7.031092,
-3.121108, -3.931589, 5.382695,
2.881719, -3.931589, 5.382695,
-3.121108, 3.535872, -7.031092,
2.881719, 3.535872, -7.031092,
-3.121108, 3.535872, 5.382695,
2.881719, 3.535872, 5.382695,
2.881719, -3.931589, -7.031092,
2.881719, 3.535872, -7.031092,
2.881719, -3.931589, 5.382695,
2.881719, 3.535872, 5.382695,
2.881719, -3.931589, -7.031092,
2.881719, -3.931589, 5.382695,
2.881719, 3.535872, -7.031092,
2.881719, 3.535872, 5.382695
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
var radius = 8.373439;
var distance = 37.25438;
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
mvMatrix.translate( 0.1196946, 0.1978587, 0.8241987 );
mvMatrix.scale( 1.508211, 1.212397, 0.7293122 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.25438);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
pyrazole-5-carboxami<-read.table("pyrazole-5-carboxami.xyz")
```

```
## Error in read.table("pyrazole-5-carboxami.xyz"): no lines available in input
```

```r
x<-pyrazole-5-carboxami$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrazole' not found
```

```r
y<-pyrazole-5-carboxami$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrazole' not found
```

```r
z<-pyrazole-5-carboxami$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrazole' not found
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
-3.033688, 0.7276676, -2.261434, 0, 0, 1, 1, 1,
-2.840811, -0.2228331, -0.6002463, 1, 0, 0, 1, 1,
-2.725669, -0.02306415, -2.510586, 1, 0, 0, 1, 1,
-2.662677, -1.913325, -2.080685, 1, 0, 0, 1, 1,
-2.551579, -0.8308539, -2.918442, 1, 0, 0, 1, 1,
-2.395379, 0.4810834, -1.774733, 1, 0, 0, 1, 1,
-2.366771, -0.4231939, -1.252371, 0, 0, 0, 1, 1,
-2.337226, -0.3767856, -0.2275323, 0, 0, 0, 1, 1,
-2.333565, 0.3715066, -0.7932178, 0, 0, 0, 1, 1,
-2.304915, 0.7673897, -1.220888, 0, 0, 0, 1, 1,
-2.271598, -1.760048, -2.170147, 0, 0, 0, 1, 1,
-2.223961, -0.905497, -0.8157887, 0, 0, 0, 1, 1,
-2.218404, 0.6990571, -1.575932, 0, 0, 0, 1, 1,
-2.198784, -1.001821, -1.539736, 1, 1, 1, 1, 1,
-2.128323, -1.538932, -3.604649, 1, 1, 1, 1, 1,
-2.116336, -0.1944912, -1.303781, 1, 1, 1, 1, 1,
-2.09573, 1.084924, -0.9306828, 1, 1, 1, 1, 1,
-1.997761, 0.06763788, -1.718846, 1, 1, 1, 1, 1,
-1.988811, 1.210537, -2.122199, 1, 1, 1, 1, 1,
-1.968547, 1.423276, -0.5543429, 1, 1, 1, 1, 1,
-1.959692, -0.3635725, -3.973225, 1, 1, 1, 1, 1,
-1.957415, 0.03950526, -1.540445, 1, 1, 1, 1, 1,
-1.947635, -0.8473105, -0.9197947, 1, 1, 1, 1, 1,
-1.93801, 0.5256121, -3.456359, 1, 1, 1, 1, 1,
-1.919688, -2.508894, -1.42348, 1, 1, 1, 1, 1,
-1.904584, 0.7828112, -3.067068, 1, 1, 1, 1, 1,
-1.901819, -0.2653644, -1.070865, 1, 1, 1, 1, 1,
-1.899998, -0.883585, -1.965987, 1, 1, 1, 1, 1,
-1.878446, -0.1276446, -2.10816, 0, 0, 1, 1, 1,
-1.835056, -1.792068, -2.15382, 1, 0, 0, 1, 1,
-1.811857, -1.657035, -2.346416, 1, 0, 0, 1, 1,
-1.806937, 0.1106995, -1.806877, 1, 0, 0, 1, 1,
-1.787012, -0.4435436, -2.502284, 1, 0, 0, 1, 1,
-1.786952, -0.6953815, -0.6524825, 1, 0, 0, 1, 1,
-1.779648, -0.6066347, -0.7921021, 0, 0, 0, 1, 1,
-1.770252, 0.05156456, -0.1477657, 0, 0, 0, 1, 1,
-1.757322, 1.023516, -0.9752989, 0, 0, 0, 1, 1,
-1.75385, 2.57588, -0.3931776, 0, 0, 0, 1, 1,
-1.736548, -0.5351369, -1.792675, 0, 0, 0, 1, 1,
-1.726911, -2.052706, -2.454619, 0, 0, 0, 1, 1,
-1.7253, 0.3665134, -0.1290955, 0, 0, 0, 1, 1,
-1.722361, -0.3931742, -2.921669, 1, 1, 1, 1, 1,
-1.715537, 0.7823587, -1.441275, 1, 1, 1, 1, 1,
-1.708848, -0.4480309, -2.414481, 1, 1, 1, 1, 1,
-1.687011, 0.6601233, -1.60591, 1, 1, 1, 1, 1,
-1.672718, -1.01004, -2.921072, 1, 1, 1, 1, 1,
-1.670809, 0.5934585, -1.728753, 1, 1, 1, 1, 1,
-1.658297, 0.3349675, 0.3370736, 1, 1, 1, 1, 1,
-1.657991, -0.4017323, -3.239661, 1, 1, 1, 1, 1,
-1.652063, -0.3673894, -1.013941, 1, 1, 1, 1, 1,
-1.639999, -0.4645257, -3.058409, 1, 1, 1, 1, 1,
-1.638941, -0.5709154, -2.855173, 1, 1, 1, 1, 1,
-1.635548, -0.6575029, -1.867256, 1, 1, 1, 1, 1,
-1.620369, -0.1384363, -0.9546583, 1, 1, 1, 1, 1,
-1.61501, -2.101044, 0.4276065, 1, 1, 1, 1, 1,
-1.611945, 1.899105, -2.276175, 1, 1, 1, 1, 1,
-1.606496, 1.974215, -0.637407, 0, 0, 1, 1, 1,
-1.598846, 0.3295381, -0.5652463, 1, 0, 0, 1, 1,
-1.598343, 1.320642, -2.062233, 1, 0, 0, 1, 1,
-1.589878, -1.857005, -0.9293162, 1, 0, 0, 1, 1,
-1.585818, -1.774158, -3.479722, 1, 0, 0, 1, 1,
-1.585282, -1.041373, -2.552972, 1, 0, 0, 1, 1,
-1.585227, 0.2977418, 0.5011392, 0, 0, 0, 1, 1,
-1.58245, 0.4294861, -3.545138, 0, 0, 0, 1, 1,
-1.556072, 1.035271, -0.8277563, 0, 0, 0, 1, 1,
-1.54313, -0.6164645, -3.232366, 0, 0, 0, 1, 1,
-1.540722, 0.5788684, -1.754568, 0, 0, 0, 1, 1,
-1.53365, -0.1702327, -2.861935, 0, 0, 0, 1, 1,
-1.531442, -0.9711536, -2.696398, 0, 0, 0, 1, 1,
-1.530373, 1.120832, -0.6838845, 1, 1, 1, 1, 1,
-1.52768, 0.2116628, -0.5427431, 1, 1, 1, 1, 1,
-1.527177, -1.295248, -2.528101, 1, 1, 1, 1, 1,
-1.521233, -0.3666266, -0.7934583, 1, 1, 1, 1, 1,
-1.513332, -0.8909602, -0.5271864, 1, 1, 1, 1, 1,
-1.510624, -1.058642, -1.392401, 1, 1, 1, 1, 1,
-1.509819, 0.2187876, 0.2035025, 1, 1, 1, 1, 1,
-1.499208, 0.1149021, -2.614645, 1, 1, 1, 1, 1,
-1.499008, -0.5339194, -1.787036, 1, 1, 1, 1, 1,
-1.498441, 0.3272114, -2.20893, 1, 1, 1, 1, 1,
-1.496883, 1.188235, 1.078634, 1, 1, 1, 1, 1,
-1.483671, 0.6728191, -1.389907, 1, 1, 1, 1, 1,
-1.482864, -0.63019, -1.164385, 1, 1, 1, 1, 1,
-1.475166, 0.488207, -1.008197, 1, 1, 1, 1, 1,
-1.465973, -0.6128961, -1.123889, 1, 1, 1, 1, 1,
-1.465284, -0.08706168, 0.2624919, 0, 0, 1, 1, 1,
-1.463377, -0.9498959, -3.622768, 1, 0, 0, 1, 1,
-1.461469, 0.7607028, -1.750949, 1, 0, 0, 1, 1,
-1.459679, -0.8533342, -1.434898, 1, 0, 0, 1, 1,
-1.434768, -1.07985, -1.016544, 1, 0, 0, 1, 1,
-1.433493, 1.483827, -0.5977558, 1, 0, 0, 1, 1,
-1.431733, 1.305239, 1.24068, 0, 0, 0, 1, 1,
-1.43126, -0.2423487, -1.78646, 0, 0, 0, 1, 1,
-1.41402, -0.6240842, -3.218739, 0, 0, 0, 1, 1,
-1.399364, -0.4285531, -1.841654, 0, 0, 0, 1, 1,
-1.382331, -0.1123036, -2.233621, 0, 0, 0, 1, 1,
-1.375332, 0.7699061, -1.518517, 0, 0, 0, 1, 1,
-1.374671, 1.663543, 0.182736, 0, 0, 0, 1, 1,
-1.372726, 1.157358, 0.3600203, 1, 1, 1, 1, 1,
-1.363819, -0.9654735, -1.206102, 1, 1, 1, 1, 1,
-1.35973, 0.6230097, -2.370303, 1, 1, 1, 1, 1,
-1.359698, -1.919152, -1.517547, 1, 1, 1, 1, 1,
-1.358674, -1.093483, -1.708845, 1, 1, 1, 1, 1,
-1.329021, 0.9898864, -0.2622512, 1, 1, 1, 1, 1,
-1.319831, 2.249694, 0.732143, 1, 1, 1, 1, 1,
-1.316239, -0.561874, -1.195764, 1, 1, 1, 1, 1,
-1.31483, 1.158813, -1.928973, 1, 1, 1, 1, 1,
-1.307666, -0.3210552, -0.4957744, 1, 1, 1, 1, 1,
-1.29597, -0.6715382, -1.504493, 1, 1, 1, 1, 1,
-1.290178, -0.6658617, -2.627831, 1, 1, 1, 1, 1,
-1.28084, -0.2653522, -1.995613, 1, 1, 1, 1, 1,
-1.272234, -0.3895255, -4.352792, 1, 1, 1, 1, 1,
-1.271376, 0.7720011, 1.004299, 1, 1, 1, 1, 1,
-1.261742, -0.5414029, -1.520867, 0, 0, 1, 1, 1,
-1.257671, 2.390334, 0.09057416, 1, 0, 0, 1, 1,
-1.246725, 0.9881877, -1.744645, 1, 0, 0, 1, 1,
-1.241627, 0.4534688, -1.401737, 1, 0, 0, 1, 1,
-1.237619, 0.2206447, -1.684041, 1, 0, 0, 1, 1,
-1.219944, 0.04496866, -2.348264, 1, 0, 0, 1, 1,
-1.21292, 1.001367, -0.3262112, 0, 0, 0, 1, 1,
-1.208108, -1.285324, -2.674349, 0, 0, 0, 1, 1,
-1.203566, -0.0607245, -0.610264, 0, 0, 0, 1, 1,
-1.200061, -1.664052, -2.69207, 0, 0, 0, 1, 1,
-1.185714, -0.6765134, -2.374949, 0, 0, 0, 1, 1,
-1.185656, -1.056235, -1.529411, 0, 0, 0, 1, 1,
-1.183459, -1.564829, -3.527069, 0, 0, 0, 1, 1,
-1.180567, 1.414805, -1.145958, 1, 1, 1, 1, 1,
-1.175316, 0.3613684, -1.603138, 1, 1, 1, 1, 1,
-1.175216, -0.7062536, -2.020324, 1, 1, 1, 1, 1,
-1.173936, 0.3175237, -0.5132703, 1, 1, 1, 1, 1,
-1.171268, 1.150838, -1.274321, 1, 1, 1, 1, 1,
-1.161106, 0.7200683, -1.063618, 1, 1, 1, 1, 1,
-1.156857, -0.7881724, -1.811065, 1, 1, 1, 1, 1,
-1.150057, 0.9702445, -0.9756899, 1, 1, 1, 1, 1,
-1.148087, 0.6278542, -1.84987, 1, 1, 1, 1, 1,
-1.147131, -0.5960005, -3.554232, 1, 1, 1, 1, 1,
-1.145071, -1.599288, -4.264552, 1, 1, 1, 1, 1,
-1.142817, 2.274074, -0.5263476, 1, 1, 1, 1, 1,
-1.12722, -0.6886299, -1.995778, 1, 1, 1, 1, 1,
-1.122971, 1.508032, -0.5806841, 1, 1, 1, 1, 1,
-1.118121, 1.224435, 1.172264, 1, 1, 1, 1, 1,
-1.115728, 0.3626134, -2.873317, 0, 0, 1, 1, 1,
-1.115399, 1.307464, -1.899941, 1, 0, 0, 1, 1,
-1.114004, -1.185503, -1.868138, 1, 0, 0, 1, 1,
-1.113205, -0.8910258, -1.847523, 1, 0, 0, 1, 1,
-1.108587, -0.6009105, -2.467727, 1, 0, 0, 1, 1,
-1.100771, -0.4677661, -2.910066, 1, 0, 0, 1, 1,
-1.100379, 0.849301, -1.220726, 0, 0, 0, 1, 1,
-1.097357, 0.3852056, -1.850926, 0, 0, 0, 1, 1,
-1.088948, 0.2892986, -0.7140876, 0, 0, 0, 1, 1,
-1.088855, 0.293247, -0.8046989, 0, 0, 0, 1, 1,
-1.088277, -2.150527, -3.161389, 0, 0, 0, 1, 1,
-1.079554, -0.7920318, -1.161986, 0, 0, 0, 1, 1,
-1.072351, -0.574755, -2.27662, 0, 0, 0, 1, 1,
-1.065989, 0.4377656, -1.646525, 1, 1, 1, 1, 1,
-1.062526, -0.05414404, -2.818677, 1, 1, 1, 1, 1,
-1.061393, 0.14932, -3.065054, 1, 1, 1, 1, 1,
-1.057771, -1.949026, -2.544366, 1, 1, 1, 1, 1,
-1.055498, -0.1305247, -1.261443, 1, 1, 1, 1, 1,
-1.055417, 1.113363, -1.018204, 1, 1, 1, 1, 1,
-1.046148, -0.6611813, -2.469784, 1, 1, 1, 1, 1,
-1.045787, 0.9458818, -1.425635, 1, 1, 1, 1, 1,
-1.041894, 0.6978487, -0.7057745, 1, 1, 1, 1, 1,
-1.037534, 1.539067, -1.210766, 1, 1, 1, 1, 1,
-1.035649, 1.448781, -0.6670414, 1, 1, 1, 1, 1,
-1.034491, -0.6910179, -2.623321, 1, 1, 1, 1, 1,
-1.02892, 0.02115332, -1.134046, 1, 1, 1, 1, 1,
-1.028597, -0.6723665, -3.832827, 1, 1, 1, 1, 1,
-1.022221, 0.1429494, -0.8530936, 1, 1, 1, 1, 1,
-1.017622, -0.9056128, -0.679054, 0, 0, 1, 1, 1,
-1.005617, 0.822716, -0.3634418, 1, 0, 0, 1, 1,
-1.001522, -0.457559, -1.951397, 1, 0, 0, 1, 1,
-1.001426, -0.6477376, -3.254982, 1, 0, 0, 1, 1,
-0.9982617, 0.2588289, -0.4746847, 1, 0, 0, 1, 1,
-0.9949296, -1.273094, -1.467363, 1, 0, 0, 1, 1,
-0.9943803, -0.7489233, -1.131856, 0, 0, 0, 1, 1,
-0.9889024, -0.3167619, -2.643674, 0, 0, 0, 1, 1,
-0.9842719, -1.029622, -2.704585, 0, 0, 0, 1, 1,
-0.9802682, -0.0854057, -2.764609, 0, 0, 0, 1, 1,
-0.9697462, -0.670657, -1.700168, 0, 0, 0, 1, 1,
-0.9685414, 0.05398488, -1.062182, 0, 0, 0, 1, 1,
-0.9657697, 0.190157, -0.9681356, 0, 0, 0, 1, 1,
-0.9643293, -0.05363899, -3.27013, 1, 1, 1, 1, 1,
-0.9637052, -0.3022099, -1.765435, 1, 1, 1, 1, 1,
-0.9629515, 0.3072396, -1.222688, 1, 1, 1, 1, 1,
-0.9600744, 0.3531781, -3.172905, 1, 1, 1, 1, 1,
-0.951964, -0.8817317, -1.585385, 1, 1, 1, 1, 1,
-0.9445314, 0.4911704, -2.927408, 1, 1, 1, 1, 1,
-0.9444649, -0.3910012, 0.7190702, 1, 1, 1, 1, 1,
-0.9385236, -0.4121313, -1.959724, 1, 1, 1, 1, 1,
-0.9335812, 0.0706472, -3.037397, 1, 1, 1, 1, 1,
-0.9321461, 0.1038557, -2.783983, 1, 1, 1, 1, 1,
-0.9289573, 1.314071, -1.220433, 1, 1, 1, 1, 1,
-0.9255682, 0.7323115, -1.372574, 1, 1, 1, 1, 1,
-0.9218963, -1.602607, -0.6670029, 1, 1, 1, 1, 1,
-0.9211443, -1.493268, -0.9368855, 1, 1, 1, 1, 1,
-0.9208164, 0.8986869, -1.392122, 1, 1, 1, 1, 1,
-0.9180421, -1.009432, -2.336285, 0, 0, 1, 1, 1,
-0.9074508, -1.126401, -2.787031, 1, 0, 0, 1, 1,
-0.9066851, -0.6415755, -2.198584, 1, 0, 0, 1, 1,
-0.9046826, -0.3436693, -2.075404, 1, 0, 0, 1, 1,
-0.9028086, 0.5776875, -0.6983967, 1, 0, 0, 1, 1,
-0.8923522, 0.7977907, -0.8658583, 1, 0, 0, 1, 1,
-0.8915993, -0.1907007, -3.261527, 0, 0, 0, 1, 1,
-0.8884381, 1.892807, -0.8627355, 0, 0, 0, 1, 1,
-0.8839864, -1.818696, -2.281125, 0, 0, 0, 1, 1,
-0.8807272, 1.84071, -0.2097373, 0, 0, 0, 1, 1,
-0.8804029, -1.436027, -1.146981, 0, 0, 0, 1, 1,
-0.8765571, 0.2848206, -0.3568817, 0, 0, 0, 1, 1,
-0.8713579, -0.05095384, -0.6878246, 0, 0, 0, 1, 1,
-0.8667939, 0.2805694, -1.910237, 1, 1, 1, 1, 1,
-0.8652389, 0.4855418, -2.065614, 1, 1, 1, 1, 1,
-0.8644626, 0.3078184, -1.583179, 1, 1, 1, 1, 1,
-0.8581408, -0.4742914, -2.229628, 1, 1, 1, 1, 1,
-0.8527865, -0.3710586, -0.9371648, 1, 1, 1, 1, 1,
-0.8475133, -2.448061, -3.960655, 1, 1, 1, 1, 1,
-0.8412411, -2.085878, -3.563704, 1, 1, 1, 1, 1,
-0.8344854, -0.8816717, -2.130115, 1, 1, 1, 1, 1,
-0.8334341, 0.1962118, -2.422836, 1, 1, 1, 1, 1,
-0.8328281, -0.01106043, -2.582561, 1, 1, 1, 1, 1,
-0.8296837, 0.09635191, -2.212658, 1, 1, 1, 1, 1,
-0.8220994, -1.000184, -2.112699, 1, 1, 1, 1, 1,
-0.8209717, 1.79508, -2.854347, 1, 1, 1, 1, 1,
-0.820213, 1.318407, -0.08325876, 1, 1, 1, 1, 1,
-0.8108709, 1.392552, 1.530216, 1, 1, 1, 1, 1,
-0.8095214, 0.5524071, -1.222533, 0, 0, 1, 1, 1,
-0.803084, 0.6047627, -0.08364268, 1, 0, 0, 1, 1,
-0.7972441, 0.08915434, -3.580706, 1, 0, 0, 1, 1,
-0.7852957, -0.7982564, -2.837236, 1, 0, 0, 1, 1,
-0.7804158, 0.3870037, -0.1741857, 1, 0, 0, 1, 1,
-0.7738686, -1.749413, -1.348744, 1, 0, 0, 1, 1,
-0.7723995, -1.003777, -4.292964, 0, 0, 0, 1, 1,
-0.7692819, 0.6925059, -2.76661, 0, 0, 0, 1, 1,
-0.7678345, -0.1961986, -1.035981, 0, 0, 0, 1, 1,
-0.7639316, -0.4554342, -3.25338, 0, 0, 0, 1, 1,
-0.7574553, 1.02835, -0.03877499, 0, 0, 0, 1, 1,
-0.7540125, -0.6027822, -1.978222, 0, 0, 0, 1, 1,
-0.7515607, -1.074749, -1.512807, 0, 0, 0, 1, 1,
-0.7514146, 0.251069, -0.1348391, 1, 1, 1, 1, 1,
-0.7512481, -1.035658, -2.056641, 1, 1, 1, 1, 1,
-0.7475302, 0.5246348, -0.9799441, 1, 1, 1, 1, 1,
-0.7438846, 0.7455624, -0.5113062, 1, 1, 1, 1, 1,
-0.7363386, -2.629308, -3.251035, 1, 1, 1, 1, 1,
-0.7362923, -2.075809, -2.180374, 1, 1, 1, 1, 1,
-0.7348024, -0.1346697, -3.967443, 1, 1, 1, 1, 1,
-0.729808, 1.889342, -1.182945, 1, 1, 1, 1, 1,
-0.725997, -0.1417858, -3.792322, 1, 1, 1, 1, 1,
-0.7168553, -1.057558, -1.98945, 1, 1, 1, 1, 1,
-0.7053872, 0.03247613, -1.864436, 1, 1, 1, 1, 1,
-0.7050917, 0.4224345, -1.471428, 1, 1, 1, 1, 1,
-0.7049615, -1.149613, -2.454085, 1, 1, 1, 1, 1,
-0.7048777, -0.7209303, -2.461466, 1, 1, 1, 1, 1,
-0.703115, -1.463559, -2.875215, 1, 1, 1, 1, 1,
-0.6967233, -1.081138, -2.506155, 0, 0, 1, 1, 1,
-0.6923417, -0.2229534, -2.820499, 1, 0, 0, 1, 1,
-0.6869866, 0.5782393, -1.942383, 1, 0, 0, 1, 1,
-0.683583, -0.3810875, -0.69246, 1, 0, 0, 1, 1,
-0.6803866, 0.1172799, -0.1747715, 1, 0, 0, 1, 1,
-0.6771847, 1.008969, 0.5516562, 1, 0, 0, 1, 1,
-0.6765805, -0.375907, -1.763488, 0, 0, 0, 1, 1,
-0.668775, -0.2369959, -0.8399224, 0, 0, 0, 1, 1,
-0.6666583, 0.4264264, -1.301903, 0, 0, 0, 1, 1,
-0.6662675, 0.1677755, -1.104831, 0, 0, 0, 1, 1,
-0.6654537, -1.027649, -4.236838, 0, 0, 0, 1, 1,
-0.6645272, 0.3673823, -0.8297589, 0, 0, 0, 1, 1,
-0.6616774, 0.08341995, -1.714453, 0, 0, 0, 1, 1,
-0.6616773, -1.146634, -2.730006, 1, 1, 1, 1, 1,
-0.6594288, 0.09403454, -1.145682, 1, 1, 1, 1, 1,
-0.6588501, 0.1469643, -0.5490121, 1, 1, 1, 1, 1,
-0.657027, -0.01303009, -0.911357, 1, 1, 1, 1, 1,
-0.6504379, 0.9075549, 0.02316834, 1, 1, 1, 1, 1,
-0.6504298, 1.131236, -1.259944, 1, 1, 1, 1, 1,
-0.6492181, -1.286593, -3.025077, 1, 1, 1, 1, 1,
-0.6467813, 0.3190788, -0.9834934, 1, 1, 1, 1, 1,
-0.6421298, 0.07079074, -1.200973, 1, 1, 1, 1, 1,
-0.639715, -0.1352775, -4.725725, 1, 1, 1, 1, 1,
-0.6387129, 0.3753659, -1.648881, 1, 1, 1, 1, 1,
-0.6366517, -1.446965, -1.865984, 1, 1, 1, 1, 1,
-0.6336142, -0.426693, -3.44633, 1, 1, 1, 1, 1,
-0.6329076, -1.531531, -4.597303, 1, 1, 1, 1, 1,
-0.6313056, 0.997674, -1.549202, 1, 1, 1, 1, 1,
-0.6249974, 1.140612, 1.095624, 0, 0, 1, 1, 1,
-0.6242996, 0.7083719, -1.23255, 1, 0, 0, 1, 1,
-0.6134461, -0.3966178, -1.10208, 1, 0, 0, 1, 1,
-0.611945, -0.1183288, -1.414034, 1, 0, 0, 1, 1,
-0.6016755, 0.2809182, -0.7665922, 1, 0, 0, 1, 1,
-0.6002018, -0.5797406, -3.430616, 1, 0, 0, 1, 1,
-0.5976821, 1.12208, 0.9538332, 0, 0, 0, 1, 1,
-0.5956005, 1.964858, -0.6445485, 0, 0, 0, 1, 1,
-0.5911639, -0.4701317, -1.9144, 0, 0, 0, 1, 1,
-0.5867829, 0.1910255, -0.766829, 0, 0, 0, 1, 1,
-0.5819606, 0.3630362, -2.293613, 0, 0, 0, 1, 1,
-0.5761628, -1.209588, -3.920966, 0, 0, 0, 1, 1,
-0.5761215, 0.1126393, -2.721009, 0, 0, 0, 1, 1,
-0.5675693, -0.1396459, -1.861074, 1, 1, 1, 1, 1,
-0.5633503, -0.1984659, -2.969369, 1, 1, 1, 1, 1,
-0.5555484, -1.980975, -2.214642, 1, 1, 1, 1, 1,
-0.5555106, -1.695222, -2.987705, 1, 1, 1, 1, 1,
-0.5470226, 0.01867479, -3.52008, 1, 1, 1, 1, 1,
-0.5438877, -0.3651406, -0.9850489, 1, 1, 1, 1, 1,
-0.5436609, 0.3989838, -0.8993872, 1, 1, 1, 1, 1,
-0.542597, -0.7717212, -2.362592, 1, 1, 1, 1, 1,
-0.5380244, -0.4137846, -1.174355, 1, 1, 1, 1, 1,
-0.5368345, -0.5202302, -1.8116, 1, 1, 1, 1, 1,
-0.5331237, -0.5711801, -3.355308, 1, 1, 1, 1, 1,
-0.5293057, 0.08221716, -1.737409, 1, 1, 1, 1, 1,
-0.5287488, 0.9158896, -1.55393, 1, 1, 1, 1, 1,
-0.5247046, 0.02201292, -1.598531, 1, 1, 1, 1, 1,
-0.5232427, -1.434376, -2.021192, 1, 1, 1, 1, 1,
-0.5201741, 0.05685214, -2.557462, 0, 0, 1, 1, 1,
-0.5169477, -1.481165, -1.876419, 1, 0, 0, 1, 1,
-0.5156301, -0.155325, -2.653882, 1, 0, 0, 1, 1,
-0.5138931, 0.2210313, -2.336195, 1, 0, 0, 1, 1,
-0.5090224, 1.89203, -2.678473, 1, 0, 0, 1, 1,
-0.5081598, -0.4791636, -2.470842, 1, 0, 0, 1, 1,
-0.4996854, 0.6724439, -1.322225, 0, 0, 0, 1, 1,
-0.4996836, 0.189041, -3.833441, 0, 0, 0, 1, 1,
-0.4922457, -1.73133, -4.547868, 0, 0, 0, 1, 1,
-0.4921797, -0.3513393, -1.350721, 0, 0, 0, 1, 1,
-0.4906732, 0.7731794, -0.3196046, 0, 0, 0, 1, 1,
-0.4835882, 2.58012, -0.2731252, 0, 0, 0, 1, 1,
-0.4809282, 1.48749, -0.7739166, 0, 0, 0, 1, 1,
-0.4788126, -1.034136, -3.163964, 1, 1, 1, 1, 1,
-0.4785821, -0.2845377, -2.215797, 1, 1, 1, 1, 1,
-0.4737384, 0.4837176, -0.5831386, 1, 1, 1, 1, 1,
-0.4709234, 0.3140447, -0.3470883, 1, 1, 1, 1, 1,
-0.4709053, -0.2011625, -1.095354, 1, 1, 1, 1, 1,
-0.4704358, -0.5560485, -3.597798, 1, 1, 1, 1, 1,
-0.4581615, 0.462298, -1.40399, 1, 1, 1, 1, 1,
-0.4554832, 1.917288, 0.8266558, 1, 1, 1, 1, 1,
-0.451389, -1.090446, -1.364007, 1, 1, 1, 1, 1,
-0.4510027, -0.1087974, -3.383583, 1, 1, 1, 1, 1,
-0.4487089, -0.7087369, -2.393645, 1, 1, 1, 1, 1,
-0.4473183, -0.5920996, -3.085129, 1, 1, 1, 1, 1,
-0.4438456, 0.1818797, -1.046968, 1, 1, 1, 1, 1,
-0.4395565, -0.3447455, -2.916846, 1, 1, 1, 1, 1,
-0.4390212, -0.5041427, -2.866192, 1, 1, 1, 1, 1,
-0.4276011, -0.9509676, -4.010325, 0, 0, 1, 1, 1,
-0.4267161, 1.019436, -1.002892, 1, 0, 0, 1, 1,
-0.4250893, -0.8515828, -5.009262, 1, 0, 0, 1, 1,
-0.4225409, 0.8745541, 0.8193123, 1, 0, 0, 1, 1,
-0.4225188, 1.194396, -0.1007808, 1, 0, 0, 1, 1,
-0.4209292, 0.07723906, -0.2582461, 1, 0, 0, 1, 1,
-0.4106207, -1.076468, -1.809328, 0, 0, 0, 1, 1,
-0.4100772, 0.3865364, -0.5048788, 0, 0, 0, 1, 1,
-0.410014, -0.2595411, -4.071454, 0, 0, 0, 1, 1,
-0.4056901, 0.4874791, -0.7652491, 0, 0, 0, 1, 1,
-0.4055907, -0.6688119, -2.704994, 0, 0, 0, 1, 1,
-0.4053685, -0.8100503, -3.92809, 0, 0, 0, 1, 1,
-0.3941215, 1.686514, 0.3908053, 0, 0, 0, 1, 1,
-0.3926395, 0.5775782, -0.4777309, 1, 1, 1, 1, 1,
-0.3852708, 0.5299336, -0.4015655, 1, 1, 1, 1, 1,
-0.3841358, -1.068477, -2.969564, 1, 1, 1, 1, 1,
-0.3834908, 0.8125581, -0.206128, 1, 1, 1, 1, 1,
-0.3834595, -0.01202721, -1.96454, 1, 1, 1, 1, 1,
-0.3819181, -0.847482, -2.835817, 1, 1, 1, 1, 1,
-0.3801935, 0.06590763, -3.123397, 1, 1, 1, 1, 1,
-0.3760847, -0.6970502, -0.7069585, 1, 1, 1, 1, 1,
-0.3707689, 1.646025, -0.7874001, 1, 1, 1, 1, 1,
-0.3692177, 0.7461879, 0.8634753, 1, 1, 1, 1, 1,
-0.3615761, -0.0546708, -2.158276, 1, 1, 1, 1, 1,
-0.3576326, -2.199953, -2.837771, 1, 1, 1, 1, 1,
-0.3571965, 1.212416, -0.6331293, 1, 1, 1, 1, 1,
-0.3519981, 0.3948911, -0.1410338, 1, 1, 1, 1, 1,
-0.3437175, -0.7507017, -1.528632, 1, 1, 1, 1, 1,
-0.3431109, 0.4219649, -1.307477, 0, 0, 1, 1, 1,
-0.3386738, 0.4494462, -1.25576, 1, 0, 0, 1, 1,
-0.337866, -0.02600756, -2.235112, 1, 0, 0, 1, 1,
-0.3359465, -0.8572248, -2.243314, 1, 0, 0, 1, 1,
-0.3351657, 1.536776, 1.056668, 1, 0, 0, 1, 1,
-0.3346244, 0.4015093, -1.230214, 1, 0, 0, 1, 1,
-0.3319238, -0.1251497, -0.8063589, 0, 0, 0, 1, 1,
-0.3292592, 1.156976, -0.6959481, 0, 0, 0, 1, 1,
-0.3269818, -0.9694679, -1.5509, 0, 0, 0, 1, 1,
-0.320829, -0.9285409, -2.842441, 0, 0, 0, 1, 1,
-0.3154853, -3.822839, -3.65461, 0, 0, 0, 1, 1,
-0.3152037, -0.7456769, -2.686321, 0, 0, 0, 1, 1,
-0.3148209, 0.4803093, 0.4371356, 0, 0, 0, 1, 1,
-0.3107382, -0.6950406, -1.911438, 1, 1, 1, 1, 1,
-0.309074, -0.1542336, -1.631829, 1, 1, 1, 1, 1,
-0.298375, -1.486322, -0.832505, 1, 1, 1, 1, 1,
-0.2965219, -0.532858, -1.865776, 1, 1, 1, 1, 1,
-0.2939354, 1.445666, 0.376706, 1, 1, 1, 1, 1,
-0.2938251, -0.7120187, -3.063311, 1, 1, 1, 1, 1,
-0.2887652, -0.1719532, -2.313687, 1, 1, 1, 1, 1,
-0.2862208, -1.27903, -3.846283, 1, 1, 1, 1, 1,
-0.2808449, 0.3596602, -0.6925963, 1, 1, 1, 1, 1,
-0.2803341, 2.464741, -0.7777336, 1, 1, 1, 1, 1,
-0.2775553, -0.4453102, -2.959318, 1, 1, 1, 1, 1,
-0.2736154, -0.8876556, -2.930277, 1, 1, 1, 1, 1,
-0.2700661, -0.07887872, -1.73708, 1, 1, 1, 1, 1,
-0.2700412, -0.1485207, -1.679207, 1, 1, 1, 1, 1,
-0.2664436, -0.8721513, -2.705, 1, 1, 1, 1, 1,
-0.2660289, 1.173602, -2.760718, 0, 0, 1, 1, 1,
-0.2624041, -0.8335344, -3.050998, 1, 0, 0, 1, 1,
-0.2580193, -0.1053341, -0.6449226, 1, 0, 0, 1, 1,
-0.2565443, 2.302286, 0.7320638, 1, 0, 0, 1, 1,
-0.2502187, 1.128244, 0.08972654, 1, 0, 0, 1, 1,
-0.24986, -0.692477, -3.403959, 1, 0, 0, 1, 1,
-0.2468431, 2.10057, 1.067696, 0, 0, 0, 1, 1,
-0.2434822, 1.101229, -0.7454037, 0, 0, 0, 1, 1,
-0.2418806, -0.7886903, -3.246234, 0, 0, 0, 1, 1,
-0.2404373, -0.4142581, -2.523408, 0, 0, 0, 1, 1,
-0.2402763, -0.431906, -3.26741, 0, 0, 0, 1, 1,
-0.2397516, -1.21834, -2.680231, 0, 0, 0, 1, 1,
-0.2388854, 0.3002664, -0.5090454, 0, 0, 0, 1, 1,
-0.2327649, -0.6991525, -3.178356, 1, 1, 1, 1, 1,
-0.2272399, -0.8928277, -2.405913, 1, 1, 1, 1, 1,
-0.224709, -2.066203, -6.850309, 1, 1, 1, 1, 1,
-0.2243761, 1.791534, 0.5831103, 1, 1, 1, 1, 1,
-0.2169184, 0.4064163, -1.936123, 1, 1, 1, 1, 1,
-0.2108715, -0.3768003, -2.180779, 1, 1, 1, 1, 1,
-0.2069449, 0.01359873, -1.67437, 1, 1, 1, 1, 1,
-0.2050434, -0.9905417, -1.48143, 1, 1, 1, 1, 1,
-0.201393, 0.1701585, -1.651464, 1, 1, 1, 1, 1,
-0.1960043, -0.0922945, -0.5179724, 1, 1, 1, 1, 1,
-0.1886481, 1.611537, -0.08552363, 1, 1, 1, 1, 1,
-0.1873542, 0.0180698, -0.671309, 1, 1, 1, 1, 1,
-0.1830453, 1.884979, 0.2957686, 1, 1, 1, 1, 1,
-0.1828386, 2.320953, -0.8282488, 1, 1, 1, 1, 1,
-0.1810355, -0.4880539, -0.9876385, 1, 1, 1, 1, 1,
-0.1788602, -0.04770901, -1.501092, 0, 0, 1, 1, 1,
-0.1757948, -0.3005053, -3.573985, 1, 0, 0, 1, 1,
-0.1755293, -0.5047252, -2.903221, 1, 0, 0, 1, 1,
-0.1724106, -0.3692439, -3.327298, 1, 0, 0, 1, 1,
-0.1721978, -0.1268983, -3.109171, 1, 0, 0, 1, 1,
-0.1717777, 1.037396, 0.4403844, 1, 0, 0, 1, 1,
-0.1686155, 0.100428, 0.9305981, 0, 0, 0, 1, 1,
-0.1635613, 1.01722, -1.038656, 0, 0, 0, 1, 1,
-0.163316, -0.02448609, -1.104433, 0, 0, 0, 1, 1,
-0.1580994, 0.9037229, 0.2121964, 0, 0, 0, 1, 1,
-0.1569993, 1.090645, -0.6257176, 0, 0, 0, 1, 1,
-0.1563817, 1.85962, -0.1341897, 0, 0, 0, 1, 1,
-0.152401, -1.148505, -1.367895, 0, 0, 0, 1, 1,
-0.151316, -0.8304499, -3.657805, 1, 1, 1, 1, 1,
-0.1511155, 1.363978, -0.3969083, 1, 1, 1, 1, 1,
-0.1486982, 0.4394286, -2.346997, 1, 1, 1, 1, 1,
-0.1472167, -2.3163, -1.906637, 1, 1, 1, 1, 1,
-0.1444148, 1.60416, -0.2235321, 1, 1, 1, 1, 1,
-0.1425862, -0.6753795, -3.25735, 1, 1, 1, 1, 1,
-0.1423488, -0.0539002, -1.821265, 1, 1, 1, 1, 1,
-0.1382491, -1.299381, -2.84008, 1, 1, 1, 1, 1,
-0.1338527, 0.7007159, 0.4616783, 1, 1, 1, 1, 1,
-0.1318467, 2.029783, -0.1360357, 1, 1, 1, 1, 1,
-0.1281094, -1.432714, -4.232646, 1, 1, 1, 1, 1,
-0.127787, -0.01184356, -0.08962963, 1, 1, 1, 1, 1,
-0.1268672, 0.6066234, -0.1748945, 1, 1, 1, 1, 1,
-0.1254541, 0.06139651, -2.03158, 1, 1, 1, 1, 1,
-0.1092558, -0.5559924, -3.57228, 1, 1, 1, 1, 1,
-0.1089455, 0.4967094, 0.6167549, 0, 0, 1, 1, 1,
-0.1033399, -0.5197724, -2.019007, 1, 0, 0, 1, 1,
-0.103232, 0.7229922, -0.9605736, 1, 0, 0, 1, 1,
-0.1015242, 0.349402, -1.172187, 1, 0, 0, 1, 1,
-0.1013594, 1.106046, -1.683366, 1, 0, 0, 1, 1,
-0.1003634, -1.734959, -3.300382, 1, 0, 0, 1, 1,
-0.09196179, 0.5399443, 0.5546263, 0, 0, 0, 1, 1,
-0.08938596, 1.183497, -1.586111, 0, 0, 0, 1, 1,
-0.08405267, 0.1658334, 0.4516119, 0, 0, 0, 1, 1,
-0.07763307, -1.350795, -3.944796, 0, 0, 0, 1, 1,
-0.07763156, 0.5888378, 0.2268981, 0, 0, 0, 1, 1,
-0.07061169, -0.9966524, -3.989349, 0, 0, 0, 1, 1,
-0.07023772, 0.9391008, 0.5604613, 0, 0, 0, 1, 1,
-0.0700983, 0.303119, 0.423263, 1, 1, 1, 1, 1,
-0.06863881, -0.8443608, -2.296485, 1, 1, 1, 1, 1,
-0.06655685, -0.4491231, -3.347181, 1, 1, 1, 1, 1,
-0.06621698, -0.4119447, -2.780525, 1, 1, 1, 1, 1,
-0.063892, 1.464558, -0.8748659, 1, 1, 1, 1, 1,
-0.06289463, 0.8858907, 0.750522, 1, 1, 1, 1, 1,
-0.06231775, -1.272034, -2.935488, 1, 1, 1, 1, 1,
-0.05610333, 1.364673, -1.352744, 1, 1, 1, 1, 1,
-0.05525735, 0.04338829, -2.330421, 1, 1, 1, 1, 1,
-0.05509518, -1.407776, -3.380927, 1, 1, 1, 1, 1,
-0.05477584, 2.120189, 1.590615, 1, 1, 1, 1, 1,
-0.05432827, 0.6019455, 0.8795766, 1, 1, 1, 1, 1,
-0.05336144, 0.4269651, 0.3944933, 1, 1, 1, 1, 1,
-0.05092163, 0.4134191, 0.4043607, 1, 1, 1, 1, 1,
-0.05020375, 0.7568318, 1.335091, 1, 1, 1, 1, 1,
-0.0493834, 0.2564117, -1.31958, 0, 0, 1, 1, 1,
-0.04572263, 0.06433356, 1.45138, 1, 0, 0, 1, 1,
-0.04462914, -0.1752397, -2.697195, 1, 0, 0, 1, 1,
-0.04451407, 0.305737, -1.8629, 1, 0, 0, 1, 1,
-0.04037954, -0.07303616, -2.189952, 1, 0, 0, 1, 1,
-0.0387906, -1.709053, -3.257473, 1, 0, 0, 1, 1,
-0.03294598, 0.5081938, -0.4291493, 0, 0, 0, 1, 1,
-0.02875321, 1.825974, -0.5643002, 0, 0, 0, 1, 1,
-0.02614898, -0.2563141, -2.581172, 0, 0, 0, 1, 1,
-0.02608511, 0.4048304, -2.889554, 0, 0, 0, 1, 1,
-0.02397457, 0.1109941, -1.306748, 0, 0, 0, 1, 1,
-0.01904288, -0.326897, -3.057239, 0, 0, 0, 1, 1,
-0.01886287, 0.7398914, 0.6207634, 0, 0, 0, 1, 1,
-0.01567635, -1.59616, -4.38187, 1, 1, 1, 1, 1,
-0.01560862, 0.03276582, 0.1759056, 1, 1, 1, 1, 1,
-0.01345109, 3.427122, -1.053524, 1, 1, 1, 1, 1,
-0.01050964, -2.882307, -3.351774, 1, 1, 1, 1, 1,
-0.004475897, 0.4405172, 0.5655344, 1, 1, 1, 1, 1,
-0.002796415, -0.7688996, -3.781251, 1, 1, 1, 1, 1,
-0.0001703761, 0.4761416, -0.130964, 1, 1, 1, 1, 1,
0.001472617, -0.3835322, 3.83608, 1, 1, 1, 1, 1,
0.00250387, -1.132488, 2.739893, 1, 1, 1, 1, 1,
0.002646633, -0.5468649, 0.8979225, 1, 1, 1, 1, 1,
0.003299772, -2.272572, 5.201911, 1, 1, 1, 1, 1,
0.003466498, 0.9753403, -0.4985251, 1, 1, 1, 1, 1,
0.004847622, -0.4324762, 3.18353, 1, 1, 1, 1, 1,
0.01376606, -0.2134885, 1.557384, 1, 1, 1, 1, 1,
0.0222628, -1.959315, 1.762518, 1, 1, 1, 1, 1,
0.02242989, 0.2173212, 0.7459019, 0, 0, 1, 1, 1,
0.02247717, 0.06608462, -0.0400065, 1, 0, 0, 1, 1,
0.02525387, -0.1236103, 3.002734, 1, 0, 0, 1, 1,
0.0252736, 1.217982, -0.9491432, 1, 0, 0, 1, 1,
0.02541001, 0.7658519, -0.2120398, 1, 0, 0, 1, 1,
0.02959904, -0.1464091, 1.822371, 1, 0, 0, 1, 1,
0.03436869, -0.3497923, 3.451625, 0, 0, 0, 1, 1,
0.03456292, 0.6869488, 0.1714326, 0, 0, 0, 1, 1,
0.03725344, -0.2149128, 2.041853, 0, 0, 0, 1, 1,
0.03754449, -0.4282725, 3.540812, 0, 0, 0, 1, 1,
0.03763259, 0.1512655, -0.7442085, 0, 0, 0, 1, 1,
0.03957263, 0.6250043, -1.909751, 0, 0, 0, 1, 1,
0.04069501, -1.252977, 2.235422, 0, 0, 0, 1, 1,
0.05023301, -0.6954378, 3.700648, 1, 1, 1, 1, 1,
0.05156741, 0.7427678, 0.08393038, 1, 1, 1, 1, 1,
0.05176856, -0.0323777, 1.817714, 1, 1, 1, 1, 1,
0.05414079, 1.16606, 0.7905443, 1, 1, 1, 1, 1,
0.05491654, -0.4411255, 3.919583, 1, 1, 1, 1, 1,
0.05569872, -1.852675, 3.867993, 1, 1, 1, 1, 1,
0.05652405, 1.889894, -0.6149229, 1, 1, 1, 1, 1,
0.05700566, 0.7848992, -1.040545, 1, 1, 1, 1, 1,
0.05754217, 0.7440524, -0.8598639, 1, 1, 1, 1, 1,
0.05871569, 0.3509725, 0.6264742, 1, 1, 1, 1, 1,
0.06373735, 0.2589353, 1.036179, 1, 1, 1, 1, 1,
0.06684989, 0.2398648, 0.8809649, 1, 1, 1, 1, 1,
0.06692287, -0.8219177, 2.482079, 1, 1, 1, 1, 1,
0.06698723, -1.223262, 1.733112, 1, 1, 1, 1, 1,
0.07249678, 0.9344587, -0.6146492, 1, 1, 1, 1, 1,
0.07483923, 0.797788, -1.025355, 0, 0, 1, 1, 1,
0.07832253, -0.05558516, 2.368797, 1, 0, 0, 1, 1,
0.07898317, -1.896109, 2.811769, 1, 0, 0, 1, 1,
0.07905085, -0.7265543, 3.901059, 1, 0, 0, 1, 1,
0.08432933, 0.02235379, 0.2091648, 1, 0, 0, 1, 1,
0.08497514, 1.413042, 1.706828, 1, 0, 0, 1, 1,
0.0862451, 0.134412, 0.2058113, 0, 0, 0, 1, 1,
0.08875951, -1.126285, 2.403912, 0, 0, 0, 1, 1,
0.09019698, -0.13957, 1.936089, 0, 0, 0, 1, 1,
0.09161735, 1.355669, -1.820743, 0, 0, 0, 1, 1,
0.09256166, -0.2364358, 1.367011, 0, 0, 0, 1, 1,
0.0947734, -0.6792608, 4.650634, 0, 0, 0, 1, 1,
0.09565052, 0.02281382, 2.863413, 0, 0, 0, 1, 1,
0.09592524, -0.1500341, 0.7072431, 1, 1, 1, 1, 1,
0.09646998, -0.7404037, 2.373929, 1, 1, 1, 1, 1,
0.100452, -0.6272033, 1.893778, 1, 1, 1, 1, 1,
0.1084311, 1.654343, 0.5189682, 1, 1, 1, 1, 1,
0.1108027, -0.5722278, 2.821189, 1, 1, 1, 1, 1,
0.1123805, -0.1841676, 2.463509, 1, 1, 1, 1, 1,
0.1143235, -2.538484, 2.908, 1, 1, 1, 1, 1,
0.1188815, 1.473173, 0.5093794, 1, 1, 1, 1, 1,
0.1209983, -0.5291752, 2.852933, 1, 1, 1, 1, 1,
0.1220899, -0.8958772, 3.140541, 1, 1, 1, 1, 1,
0.1226643, 0.6972222, 1.790273, 1, 1, 1, 1, 1,
0.1302313, -1.873155, 2.858128, 1, 1, 1, 1, 1,
0.1308914, -0.2444661, 4.358165, 1, 1, 1, 1, 1,
0.1326108, -1.577131, 3.785335, 1, 1, 1, 1, 1,
0.1427092, -0.6605602, 4.018418, 1, 1, 1, 1, 1,
0.142845, -1.246198, 3.513077, 0, 0, 1, 1, 1,
0.1461587, 1.17784, -1.264107, 1, 0, 0, 1, 1,
0.148163, -2.302189, 3.137493, 1, 0, 0, 1, 1,
0.1488232, 1.812004, 1.081732, 1, 0, 0, 1, 1,
0.1503902, -0.5641805, 2.923665, 1, 0, 0, 1, 1,
0.1526757, -0.2137162, 1.865539, 1, 0, 0, 1, 1,
0.1528759, -0.8381634, 4.216447, 0, 0, 0, 1, 1,
0.1529337, 0.7431194, -0.07285468, 0, 0, 0, 1, 1,
0.1549114, 0.03065142, -0.2402571, 0, 0, 0, 1, 1,
0.1569016, 1.169057, -2.142918, 0, 0, 0, 1, 1,
0.1595789, -0.1053314, 2.733731, 0, 0, 0, 1, 1,
0.1611575, 1.262146, -0.7037537, 0, 0, 0, 1, 1,
0.1644466, 1.055218, -0.7792821, 0, 0, 0, 1, 1,
0.1656465, -1.185182, 1.89868, 1, 1, 1, 1, 1,
0.1668555, -1.208568, 3.802691, 1, 1, 1, 1, 1,
0.1672637, -0.9186036, 2.238904, 1, 1, 1, 1, 1,
0.1719532, 1.849905, -0.4290344, 1, 1, 1, 1, 1,
0.1783304, 0.2551923, -0.5619802, 1, 1, 1, 1, 1,
0.1808994, 0.9175996, -0.4879859, 1, 1, 1, 1, 1,
0.1828015, -1.416479, 2.052172, 1, 1, 1, 1, 1,
0.1935706, 0.7486289, 0.1828632, 1, 1, 1, 1, 1,
0.1944198, -0.6949863, 1.8607, 1, 1, 1, 1, 1,
0.195403, 0.547825, -0.1276554, 1, 1, 1, 1, 1,
0.2036867, -1.50399, 1.96691, 1, 1, 1, 1, 1,
0.2122869, 0.5395638, -0.9951453, 1, 1, 1, 1, 1,
0.2123999, -0.4151218, 2.673313, 1, 1, 1, 1, 1,
0.2141204, -0.600681, 2.421314, 1, 1, 1, 1, 1,
0.2194796, -0.4843079, 3.645753, 1, 1, 1, 1, 1,
0.2218171, -0.5698496, 2.899082, 0, 0, 1, 1, 1,
0.2220301, -0.08487073, 2.077662, 1, 0, 0, 1, 1,
0.2230285, 1.262671, 1.026697, 1, 0, 0, 1, 1,
0.2279686, 0.4768832, 2.995412, 1, 0, 0, 1, 1,
0.2315828, 2.576958, -0.7035051, 1, 0, 0, 1, 1,
0.2393754, -0.4991304, 4.768166, 1, 0, 0, 1, 1,
0.2412761, 0.1910599, 0.6951513, 0, 0, 0, 1, 1,
0.2427198, -1.646477, 0.318045, 0, 0, 0, 1, 1,
0.2436376, -0.4203594, 2.293276, 0, 0, 0, 1, 1,
0.2470876, 0.2702034, -1.258836, 0, 0, 0, 1, 1,
0.2489498, -1.886353, 2.878311, 0, 0, 0, 1, 1,
0.2597427, 1.536922, 1.358881, 0, 0, 0, 1, 1,
0.2600252, -1.451223, 1.62559, 0, 0, 0, 1, 1,
0.2618748, -0.2789454, 2.841062, 1, 1, 1, 1, 1,
0.2636603, -0.1879459, 2.131103, 1, 1, 1, 1, 1,
0.2747416, 1.638704, -0.8467571, 1, 1, 1, 1, 1,
0.2767031, -0.9336138, 3.246316, 1, 1, 1, 1, 1,
0.281615, -0.592831, 4.855486, 1, 1, 1, 1, 1,
0.2816628, -0.6564829, 3.016519, 1, 1, 1, 1, 1,
0.2959445, -1.700402, 2.977191, 1, 1, 1, 1, 1,
0.2971446, -0.05025829, 1.189675, 1, 1, 1, 1, 1,
0.2991741, -1.641981, 2.507553, 1, 1, 1, 1, 1,
0.3013215, -0.9801981, 1.954097, 1, 1, 1, 1, 1,
0.3014745, 0.2427864, 1.345809, 1, 1, 1, 1, 1,
0.3018466, 1.004115, 0.3469435, 1, 1, 1, 1, 1,
0.3030163, 0.569429, -0.07131683, 1, 1, 1, 1, 1,
0.3055212, 0.2288515, 0.03982568, 1, 1, 1, 1, 1,
0.3067707, -0.3251158, 2.155367, 1, 1, 1, 1, 1,
0.3110378, 0.1125786, 2.042867, 0, 0, 1, 1, 1,
0.313398, -1.076253, 1.77803, 1, 0, 0, 1, 1,
0.3185458, 0.9144577, 0.5051863, 1, 0, 0, 1, 1,
0.3219671, 0.8730187, -0.6386372, 1, 0, 0, 1, 1,
0.327204, -0.6081289, 1.535703, 1, 0, 0, 1, 1,
0.3294069, -0.8115178, 2.949521, 1, 0, 0, 1, 1,
0.330255, 0.003500587, 2.647247, 0, 0, 0, 1, 1,
0.331748, -1.220154, 2.910149, 0, 0, 0, 1, 1,
0.332477, -0.3657252, 1.106386, 0, 0, 0, 1, 1,
0.3352728, -1.172533, 3.163752, 0, 0, 0, 1, 1,
0.3352951, 0.2950074, 2.286058, 0, 0, 0, 1, 1,
0.3369966, 1.059665, 0.3483565, 0, 0, 0, 1, 1,
0.3375554, -0.1497364, 2.021122, 0, 0, 0, 1, 1,
0.3378537, -0.8240169, 1.714973, 1, 1, 1, 1, 1,
0.3403343, -0.1606325, 1.407806, 1, 1, 1, 1, 1,
0.3419082, 0.103188, 1.092785, 1, 1, 1, 1, 1,
0.3456521, -1.665806, 1.747463, 1, 1, 1, 1, 1,
0.3480188, 1.433261, 0.7055193, 1, 1, 1, 1, 1,
0.3535359, -2.06247, 2.33989, 1, 1, 1, 1, 1,
0.35394, -1.101589, 2.229587, 1, 1, 1, 1, 1,
0.361662, -0.4543675, 4.003453, 1, 1, 1, 1, 1,
0.3625444, -0.6100436, 3.041109, 1, 1, 1, 1, 1,
0.3646148, 0.156303, 0.2243548, 1, 1, 1, 1, 1,
0.3693521, 1.211971, -0.3731083, 1, 1, 1, 1, 1,
0.375014, 0.5992277, 0.5112844, 1, 1, 1, 1, 1,
0.3788884, 0.6304075, 0.2991865, 1, 1, 1, 1, 1,
0.3796358, 0.7238091, -0.5904862, 1, 1, 1, 1, 1,
0.3854594, -1.161165, 4.581242, 1, 1, 1, 1, 1,
0.3856108, -1.655715, 2.274398, 0, 0, 1, 1, 1,
0.3881117, 0.1310844, -0.2914815, 1, 0, 0, 1, 1,
0.3947257, -1.13804, 2.35064, 1, 0, 0, 1, 1,
0.4000118, 0.6027979, -0.7046968, 1, 0, 0, 1, 1,
0.4037566, -1.17502, 3.447659, 1, 0, 0, 1, 1,
0.4039495, 0.9414291, 1.21364, 1, 0, 0, 1, 1,
0.4067451, 0.7359792, -0.6210728, 0, 0, 0, 1, 1,
0.4086502, -0.6135665, 1.709493, 0, 0, 0, 1, 1,
0.409638, -0.5939759, 2.147881, 0, 0, 0, 1, 1,
0.4164552, -1.829119, 2.019135, 0, 0, 0, 1, 1,
0.4179063, -0.5194512, 3.213682, 0, 0, 0, 1, 1,
0.4231774, -0.03812569, 1.467891, 0, 0, 0, 1, 1,
0.4300367, 1.171396, 0.9781061, 0, 0, 0, 1, 1,
0.430758, 0.288729, 3.563829, 1, 1, 1, 1, 1,
0.4317351, 0.3660612, 2.176196, 1, 1, 1, 1, 1,
0.4336819, -1.195896, 1.207694, 1, 1, 1, 1, 1,
0.4346109, -1.056404, 3.266688, 1, 1, 1, 1, 1,
0.4360791, 0.1340961, 1.189372, 1, 1, 1, 1, 1,
0.4400571, -0.05571203, 1.515103, 1, 1, 1, 1, 1,
0.4413527, -0.6580831, 4.001604, 1, 1, 1, 1, 1,
0.4425703, 0.4562356, 0.3250211, 1, 1, 1, 1, 1,
0.4426468, -1.839283, 2.969859, 1, 1, 1, 1, 1,
0.4428704, 1.285087, 0.08773376, 1, 1, 1, 1, 1,
0.4430361, -0.6110626, 4.568041, 1, 1, 1, 1, 1,
0.4455875, -0.08890428, 2.677348, 1, 1, 1, 1, 1,
0.4469059, -1.770778, 1.768523, 1, 1, 1, 1, 1,
0.4553166, -0.2083557, 0.7836503, 1, 1, 1, 1, 1,
0.4557775, -0.795275, 1.017228, 1, 1, 1, 1, 1,
0.457936, 0.5355258, 0.06173454, 0, 0, 1, 1, 1,
0.4601845, 0.6838837, -0.2752421, 1, 0, 0, 1, 1,
0.4614687, -0.05208189, 1.578063, 1, 0, 0, 1, 1,
0.4621019, -0.06823169, 0.7010213, 1, 0, 0, 1, 1,
0.467001, 0.7729793, 1.456854, 1, 0, 0, 1, 1,
0.4684621, 0.02960444, 1.929865, 1, 0, 0, 1, 1,
0.4711031, 1.740076, 0.08959289, 0, 0, 0, 1, 1,
0.4716014, 0.2422425, 1.00417, 0, 0, 0, 1, 1,
0.4740741, -0.7548791, 2.399283, 0, 0, 0, 1, 1,
0.4741324, -0.02350019, 0.5350383, 0, 0, 0, 1, 1,
0.4742066, 0.1755903, 2.623293, 0, 0, 0, 1, 1,
0.4748968, -0.265281, 2.096846, 0, 0, 0, 1, 1,
0.4766328, 0.4519251, 0.8955735, 0, 0, 0, 1, 1,
0.4788152, -1.723287, 2.503941, 1, 1, 1, 1, 1,
0.4789355, 0.430831, 0.5469012, 1, 1, 1, 1, 1,
0.4801775, 0.8979349, 2.397329, 1, 1, 1, 1, 1,
0.4821066, -1.920491, 1.741338, 1, 1, 1, 1, 1,
0.4846648, 0.9716247, 1.247093, 1, 1, 1, 1, 1,
0.4901923, -0.8484902, 3.101934, 1, 1, 1, 1, 1,
0.4908389, 0.6529514, 0.6313443, 1, 1, 1, 1, 1,
0.493859, -0.2761723, 3.503005, 1, 1, 1, 1, 1,
0.4953519, -0.9653532, 3.263536, 1, 1, 1, 1, 1,
0.4990678, 0.4295159, -0.7044635, 1, 1, 1, 1, 1,
0.5021926, 1.086107, 1.463921, 1, 1, 1, 1, 1,
0.5092857, 1.604042, 1.121992, 1, 1, 1, 1, 1,
0.5110431, -1.111864, 2.194935, 1, 1, 1, 1, 1,
0.5126792, 0.6216412, -0.867463, 1, 1, 1, 1, 1,
0.5137278, 0.07365235, 3.439284, 1, 1, 1, 1, 1,
0.5167382, -1.17734, 2.568237, 0, 0, 1, 1, 1,
0.5188603, -0.2796594, 2.134762, 1, 0, 0, 1, 1,
0.5193689, -0.3375588, 1.235649, 1, 0, 0, 1, 1,
0.5197628, 1.589327, -0.227783, 1, 0, 0, 1, 1,
0.5200176, 0.332192, 1.196122, 1, 0, 0, 1, 1,
0.5222459, 0.724211, 2.222518, 1, 0, 0, 1, 1,
0.5229324, -0.2429835, -0.260377, 0, 0, 0, 1, 1,
0.5233228, 1.114683, 0.3139835, 0, 0, 0, 1, 1,
0.5251187, 1.272116, 0.9068077, 0, 0, 0, 1, 1,
0.5302494, 0.389586, 0.971841, 0, 0, 0, 1, 1,
0.5306656, 0.1322976, 1.531342, 0, 0, 0, 1, 1,
0.5323455, -0.7905797, 3.206179, 0, 0, 0, 1, 1,
0.5324504, -0.4359224, 0.386658, 0, 0, 0, 1, 1,
0.5366257, -0.6268312, 1.990314, 1, 1, 1, 1, 1,
0.538019, -3.014627, 2.480022, 1, 1, 1, 1, 1,
0.5403681, 1.022484, 1.586148, 1, 1, 1, 1, 1,
0.5426806, -0.1867235, 1.235055, 1, 1, 1, 1, 1,
0.5442507, 0.7476959, 0.9364659, 1, 1, 1, 1, 1,
0.5617319, 0.2575316, 2.615582, 1, 1, 1, 1, 1,
0.5644711, 1.574411, -0.2648887, 1, 1, 1, 1, 1,
0.5715882, -0.5882124, 1.527964, 1, 1, 1, 1, 1,
0.5717134, -1.801866, 3.39139, 1, 1, 1, 1, 1,
0.5754191, -0.8609377, 1.307487, 1, 1, 1, 1, 1,
0.5763372, -0.9974818, 1.223002, 1, 1, 1, 1, 1,
0.5842508, -1.838064, 4.864936, 1, 1, 1, 1, 1,
0.592023, 0.3994761, 1.721723, 1, 1, 1, 1, 1,
0.5945809, -0.6636483, 0.8708608, 1, 1, 1, 1, 1,
0.5994552, 0.224539, 2.079793, 1, 1, 1, 1, 1,
0.6003122, -0.4307084, 2.562188, 0, 0, 1, 1, 1,
0.600577, -1.144836, 0.7840222, 1, 0, 0, 1, 1,
0.6038777, -0.8184327, 1.774794, 1, 0, 0, 1, 1,
0.6073932, 0.263394, 0.8873186, 1, 0, 0, 1, 1,
0.6074076, 0.6334311, -0.4252666, 1, 0, 0, 1, 1,
0.6094424, -0.1762728, 1.755627, 1, 0, 0, 1, 1,
0.6130216, 1.165037, 0.484984, 0, 0, 0, 1, 1,
0.6187251, 0.1057424, 1.38916, 0, 0, 0, 1, 1,
0.6197641, -0.3205701, 3.157168, 0, 0, 0, 1, 1,
0.6203386, -0.7860681, 2.452137, 0, 0, 0, 1, 1,
0.6230798, 0.6774084, 1.696066, 0, 0, 0, 1, 1,
0.6336607, -0.3501278, 2.088934, 0, 0, 0, 1, 1,
0.6347905, -1.787195, 2.149091, 0, 0, 0, 1, 1,
0.6400908, 0.4683719, 0.3286582, 1, 1, 1, 1, 1,
0.6404364, 1.835564, 1.011946, 1, 1, 1, 1, 1,
0.6415413, 0.2837438, 0.4545671, 1, 1, 1, 1, 1,
0.6421516, -0.5824441, 1.484415, 1, 1, 1, 1, 1,
0.6471084, -0.5108271, 1.412048, 1, 1, 1, 1, 1,
0.6492491, 0.3691728, 1.610383, 1, 1, 1, 1, 1,
0.6502461, 0.2554202, 1.087037, 1, 1, 1, 1, 1,
0.6557475, 0.546494, 3.188043, 1, 1, 1, 1, 1,
0.6575434, 0.2849822, 0.6510489, 1, 1, 1, 1, 1,
0.6595295, -0.9459746, 0.3169739, 1, 1, 1, 1, 1,
0.6598427, -2.063677, 2.403266, 1, 1, 1, 1, 1,
0.6639451, 0.4978894, 0.7327904, 1, 1, 1, 1, 1,
0.665442, -0.434699, 3.85536, 1, 1, 1, 1, 1,
0.6658826, -2.332378, 0.9898501, 1, 1, 1, 1, 1,
0.6727542, 1.06248, 0.1094704, 1, 1, 1, 1, 1,
0.6741728, 2.162687, 0.04955116, 0, 0, 1, 1, 1,
0.6742429, 1.410756, 0.8282599, 1, 0, 0, 1, 1,
0.6742676, 1.201296, -0.8511195, 1, 0, 0, 1, 1,
0.6797369, 0.2731791, 1.66452, 1, 0, 0, 1, 1,
0.6803005, -1.091665, 4.225584, 1, 0, 0, 1, 1,
0.6881952, 0.1659219, 0.9378999, 1, 0, 0, 1, 1,
0.6893733, -1.15449, 2.579669, 0, 0, 0, 1, 1,
0.6928726, -1.367235, 2.026495, 0, 0, 0, 1, 1,
0.694414, -0.3390146, 1.539616, 0, 0, 0, 1, 1,
0.6951584, -0.5047523, 2.813433, 0, 0, 0, 1, 1,
0.6955712, 0.1117429, 0.6297869, 0, 0, 0, 1, 1,
0.7014005, 2.093514, -0.08002242, 0, 0, 0, 1, 1,
0.7089622, -0.2659631, 3.013946, 0, 0, 0, 1, 1,
0.7112519, -0.3015034, 1.405057, 1, 1, 1, 1, 1,
0.7122365, -0.08088098, 0.4709806, 1, 1, 1, 1, 1,
0.7141943, 0.6144903, -0.9198499, 1, 1, 1, 1, 1,
0.7146413, 1.322137, 2.362341, 1, 1, 1, 1, 1,
0.7171469, 0.4089793, -0.3138161, 1, 1, 1, 1, 1,
0.7336839, 2.267636, -0.2086733, 1, 1, 1, 1, 1,
0.7346641, 0.1194718, 1.688452, 1, 1, 1, 1, 1,
0.7346902, -2.495524, 3.163857, 1, 1, 1, 1, 1,
0.7381309, 0.04825481, 0.9040751, 1, 1, 1, 1, 1,
0.7399542, -1.785361, 1.908145, 1, 1, 1, 1, 1,
0.7454588, 2.023439, -0.2789662, 1, 1, 1, 1, 1,
0.7476484, -0.1346785, 3.276195, 1, 1, 1, 1, 1,
0.7505581, -1.536971, 0.3596448, 1, 1, 1, 1, 1,
0.7570897, -0.1478443, 1.384764, 1, 1, 1, 1, 1,
0.76281, 1.215995, 0.4957874, 1, 1, 1, 1, 1,
0.7693117, -1.676342, 2.201626, 0, 0, 1, 1, 1,
0.7694651, 1.02462, 0.4474944, 1, 0, 0, 1, 1,
0.7706625, 0.2752297, 1.834077, 1, 0, 0, 1, 1,
0.7719246, -0.02894567, 2.179406, 1, 0, 0, 1, 1,
0.7803696, 0.9662625, 2.714009, 1, 0, 0, 1, 1,
0.7806515, 1.463487, 0.2975838, 1, 0, 0, 1, 1,
0.7894924, -0.1159332, 1.077413, 0, 0, 0, 1, 1,
0.7953929, 0.4472611, -0.342413, 0, 0, 0, 1, 1,
0.7975127, 0.699442, 0.9653026, 0, 0, 0, 1, 1,
0.808523, -1.14188, 1.569182, 0, 0, 0, 1, 1,
0.8099658, 1.048348, 0.3134489, 0, 0, 0, 1, 1,
0.8113418, -0.1239269, 0.7574436, 0, 0, 0, 1, 1,
0.8130696, 1.237242, -0.8939101, 0, 0, 0, 1, 1,
0.8132493, -2.31803, 3.177367, 1, 1, 1, 1, 1,
0.8158358, -0.8223746, 4.04159, 1, 1, 1, 1, 1,
0.8162324, 0.6772488, 1.609746, 1, 1, 1, 1, 1,
0.8180451, -1.125082, 2.809075, 1, 1, 1, 1, 1,
0.8207204, 0.9632524, -0.9726822, 1, 1, 1, 1, 1,
0.8266858, -0.5083875, 2.084962, 1, 1, 1, 1, 1,
0.8281738, 0.2479446, 0.470356, 1, 1, 1, 1, 1,
0.8286716, -1.620759, 2.388285, 1, 1, 1, 1, 1,
0.8346974, -0.4858968, 1.62159, 1, 1, 1, 1, 1,
0.8358941, -1.454729, 2.208946, 1, 1, 1, 1, 1,
0.8365689, 0.5019289, 1.560127, 1, 1, 1, 1, 1,
0.8384699, -0.0144517, 1.019878, 1, 1, 1, 1, 1,
0.8403096, 1.208534, 0.7497762, 1, 1, 1, 1, 1,
0.8406665, -1.188102, 2.235348, 1, 1, 1, 1, 1,
0.8424318, 0.4258995, 0.6842159, 1, 1, 1, 1, 1,
0.8452736, 0.1077327, 2.843433, 0, 0, 1, 1, 1,
0.8510251, -0.1613466, 2.506576, 1, 0, 0, 1, 1,
0.8544571, 0.07444577, 2.11323, 1, 0, 0, 1, 1,
0.8548646, 2.636998, 2.891118, 1, 0, 0, 1, 1,
0.8578933, 1.664954, 1.561943, 1, 0, 0, 1, 1,
0.8649064, 0.9392724, 0.7436416, 1, 0, 0, 1, 1,
0.8712854, -1.604632, 2.184325, 0, 0, 0, 1, 1,
0.8756193, -1.062667, 3.653683, 0, 0, 0, 1, 1,
0.8787145, -0.5928348, 3.397152, 0, 0, 0, 1, 1,
0.882676, 0.4527476, 0.9922895, 0, 0, 0, 1, 1,
0.8951554, -1.010839, 2.938223, 0, 0, 0, 1, 1,
0.8992799, 0.3573809, 2.296215, 0, 0, 0, 1, 1,
0.9008716, 0.360042, 1.170803, 0, 0, 0, 1, 1,
0.9016767, -3.580341, 2.901272, 1, 1, 1, 1, 1,
0.9017819, -1.248588, 1.372429, 1, 1, 1, 1, 1,
0.9020405, -0.6737331, 2.68635, 1, 1, 1, 1, 1,
0.9055361, 0.8899332, 2.209189, 1, 1, 1, 1, 1,
0.9242228, 0.791674, 1.553586, 1, 1, 1, 1, 1,
0.9242373, -0.463518, 3.153766, 1, 1, 1, 1, 1,
0.9476442, 0.6474126, 1.764922, 1, 1, 1, 1, 1,
0.9509553, 1.473629, 0.4810703, 1, 1, 1, 1, 1,
0.9533596, -0.2860117, 1.028182, 1, 1, 1, 1, 1,
0.9654596, -1.531014, 2.421352, 1, 1, 1, 1, 1,
0.9745312, -1.605941, 3.558519, 1, 1, 1, 1, 1,
0.9758444, 1.655835, -0.1271371, 1, 1, 1, 1, 1,
0.9849132, 2.806944, -0.2145226, 1, 1, 1, 1, 1,
0.9901428, 1.300305, 2.171087, 1, 1, 1, 1, 1,
0.9923217, -1.324843, 1.09592, 1, 1, 1, 1, 1,
0.9930466, -0.1573178, 2.619298, 0, 0, 1, 1, 1,
1.003585, 0.0006978709, 0.7223456, 1, 0, 0, 1, 1,
1.015185, 0.7655072, 2.049889, 1, 0, 0, 1, 1,
1.017192, -0.3442021, 3.045333, 1, 0, 0, 1, 1,
1.020292, 0.3253947, -0.03004625, 1, 0, 0, 1, 1,
1.0226, 0.4856846, 0.7521605, 1, 0, 0, 1, 1,
1.033976, 0.2684869, 1.759487, 0, 0, 0, 1, 1,
1.043233, 0.04011773, 2.041459, 0, 0, 0, 1, 1,
1.048628, -1.386154, 4.738997, 0, 0, 0, 1, 1,
1.049472, -0.3739484, 3.102013, 0, 0, 0, 1, 1,
1.054839, -0.3071178, 3.385378, 0, 0, 0, 1, 1,
1.055229, -1.367125, 2.785193, 0, 0, 0, 1, 1,
1.055839, 0.4324628, 1.347359, 0, 0, 0, 1, 1,
1.059723, 0.618924, 0.8171142, 1, 1, 1, 1, 1,
1.075255, 0.2518508, 1.426401, 1, 1, 1, 1, 1,
1.082483, 0.00685735, -0.544918, 1, 1, 1, 1, 1,
1.086946, 0.1464965, 1.113853, 1, 1, 1, 1, 1,
1.087526, -1.104979, 2.607576, 1, 1, 1, 1, 1,
1.108408, 1.168646, 0.466359, 1, 1, 1, 1, 1,
1.109942, -1.637476, 1.606191, 1, 1, 1, 1, 1,
1.11165, 2.4564, -0.2756017, 1, 1, 1, 1, 1,
1.116773, 3.162486, -1.091894, 1, 1, 1, 1, 1,
1.122114, 1.485908, 1.758882, 1, 1, 1, 1, 1,
1.129741, 0.1398048, 2.008737, 1, 1, 1, 1, 1,
1.131971, 1.1349, 1.759444, 1, 1, 1, 1, 1,
1.132725, -0.508969, 3.87018, 1, 1, 1, 1, 1,
1.132997, -0.4647242, 1.964727, 1, 1, 1, 1, 1,
1.135555, 0.6056517, 1.437731, 1, 1, 1, 1, 1,
1.154902, 1.03572, 1.747649, 0, 0, 1, 1, 1,
1.158596, -0.1611089, 1.090494, 1, 0, 0, 1, 1,
1.159456, -0.7034602, 3.095476, 1, 0, 0, 1, 1,
1.16495, 1.065925, -0.4183213, 1, 0, 0, 1, 1,
1.166037, -0.2959351, 1.685016, 1, 0, 0, 1, 1,
1.171319, 0.7255515, -0.6984898, 1, 0, 0, 1, 1,
1.174246, -1.932202, 1.912255, 0, 0, 0, 1, 1,
1.176024, -0.3441477, 2.889141, 0, 0, 0, 1, 1,
1.179945, 1.198333, 0.4445433, 0, 0, 0, 1, 1,
1.18099, -0.5839119, 1.452423, 0, 0, 0, 1, 1,
1.184622, -1.289845, 2.669749, 0, 0, 0, 1, 1,
1.202275, 1.297664, 1.002898, 0, 0, 0, 1, 1,
1.205372, 0.1260157, 0.8657774, 0, 0, 0, 1, 1,
1.205691, -0.5224892, 2.751078, 1, 1, 1, 1, 1,
1.213571, 0.04651845, 2.664219, 1, 1, 1, 1, 1,
1.218099, 0.4817785, 2.57206, 1, 1, 1, 1, 1,
1.222697, 0.5608902, 0.6182193, 1, 1, 1, 1, 1,
1.226876, -0.2776792, 1.054894, 1, 1, 1, 1, 1,
1.23046, 0.2126219, 0.9661241, 1, 1, 1, 1, 1,
1.232997, 0.04471941, 1.591517, 1, 1, 1, 1, 1,
1.242054, 2.165258, 0.5891894, 1, 1, 1, 1, 1,
1.242711, 2.031, 0.8362519, 1, 1, 1, 1, 1,
1.246266, -0.3702301, 1.123757, 1, 1, 1, 1, 1,
1.24729, 1.114567, 0.8354223, 1, 1, 1, 1, 1,
1.261085, -0.986937, 3.794144, 1, 1, 1, 1, 1,
1.276028, 0.1090697, 0.6755648, 1, 1, 1, 1, 1,
1.286034, -1.433809, 1.850408, 1, 1, 1, 1, 1,
1.286405, 0.7968878, 2.11482, 1, 1, 1, 1, 1,
1.297965, -1.159615, 3.723113, 0, 0, 1, 1, 1,
1.305441, 1.134313, 1.975594, 1, 0, 0, 1, 1,
1.306427, -1.667459, 3.875924, 1, 0, 0, 1, 1,
1.313021, 0.9630008, 2.499029, 1, 0, 0, 1, 1,
1.31512, 0.9008033, 2.365708, 1, 0, 0, 1, 1,
1.315417, 0.1979547, 2.562189, 1, 0, 0, 1, 1,
1.315878, 0.5998195, -1.04411, 0, 0, 0, 1, 1,
1.322989, -0.5640991, 3.000496, 0, 0, 0, 1, 1,
1.331456, -0.6931501, 0.4947168, 0, 0, 0, 1, 1,
1.338782, -0.7910922, 1.884528, 0, 0, 0, 1, 1,
1.339853, -0.0430162, 3.744147, 0, 0, 0, 1, 1,
1.346534, -1.311393, 1.752237, 0, 0, 0, 1, 1,
1.355993, 1.850278, 1.357874, 0, 0, 0, 1, 1,
1.360888, -1.020902, 1.013291, 1, 1, 1, 1, 1,
1.372759, 0.2271551, 0.5793573, 1, 1, 1, 1, 1,
1.374716, -0.7952269, 3.244505, 1, 1, 1, 1, 1,
1.37759, -1.985867, 3.797472, 1, 1, 1, 1, 1,
1.380108, -1.585284, 2.728068, 1, 1, 1, 1, 1,
1.38401, -0.3012554, 1.21342, 1, 1, 1, 1, 1,
1.388226, -0.1015745, 2.563432, 1, 1, 1, 1, 1,
1.388961, -0.550827, 1.405585, 1, 1, 1, 1, 1,
1.393008, 2.370912, 0.3458885, 1, 1, 1, 1, 1,
1.397463, 0.4288541, 0.3814939, 1, 1, 1, 1, 1,
1.404749, 0.8317133, 0.916481, 1, 1, 1, 1, 1,
1.406846, 0.1143002, 0.03490491, 1, 1, 1, 1, 1,
1.420961, 0.1452155, 3.275029, 1, 1, 1, 1, 1,
1.428089, -0.3138455, -0.4238515, 1, 1, 1, 1, 1,
1.43035, -0.7293037, 2.383495, 1, 1, 1, 1, 1,
1.43434, -0.2972308, 2.158205, 0, 0, 1, 1, 1,
1.43743, 0.9159277, -0.2479275, 1, 0, 0, 1, 1,
1.447931, 0.3555504, 2.703151, 1, 0, 0, 1, 1,
1.44956, -0.5296074, 2.036733, 1, 0, 0, 1, 1,
1.45142, 0.3711461, 1.279906, 1, 0, 0, 1, 1,
1.463782, 0.8322514, 0.4524367, 1, 0, 0, 1, 1,
1.480821, 0.09507484, 1.542313, 0, 0, 0, 1, 1,
1.489289, 0.6398448, 0.6709498, 0, 0, 0, 1, 1,
1.494394, -1.841411, 3.270898, 0, 0, 0, 1, 1,
1.498913, 0.5303295, -0.4155742, 0, 0, 0, 1, 1,
1.500878, 1.137943, -0.4005614, 0, 0, 0, 1, 1,
1.504472, 0.6663609, 0.5418195, 0, 0, 0, 1, 1,
1.515491, -0.8078675, 1.787616, 0, 0, 0, 1, 1,
1.534243, -0.4913751, 0.5046332, 1, 1, 1, 1, 1,
1.544188, -0.6240551, 1.792198, 1, 1, 1, 1, 1,
1.555844, -0.316645, 2.828215, 1, 1, 1, 1, 1,
1.560101, 0.02520311, 1.592673, 1, 1, 1, 1, 1,
1.57191, 2.667903, 0.1019017, 1, 1, 1, 1, 1,
1.590345, -0.6585569, 1.989144, 1, 1, 1, 1, 1,
1.595832, -0.6683341, 3.14344, 1, 1, 1, 1, 1,
1.607638, -0.3299387, 1.560314, 1, 1, 1, 1, 1,
1.640093, -1.774082, 2.42033, 1, 1, 1, 1, 1,
1.648837, 1.542779, -0.3194486, 1, 1, 1, 1, 1,
1.667971, -0.6396877, 1.385733, 1, 1, 1, 1, 1,
1.68697, 0.5032699, -0.7339064, 1, 1, 1, 1, 1,
1.692091, 0.307149, 1.49095, 1, 1, 1, 1, 1,
1.716898, 1.033781, 0.9411256, 1, 1, 1, 1, 1,
1.721105, -3.129367, 2.114935, 1, 1, 1, 1, 1,
1.722964, 0.1949188, -0.4117137, 0, 0, 1, 1, 1,
1.733456, 1.117786, 0.7951126, 1, 0, 0, 1, 1,
1.779537, 0.8126849, 2.515033, 1, 0, 0, 1, 1,
1.795503, 1.21584, -0.156929, 1, 0, 0, 1, 1,
1.795609, -1.248459, 2.967846, 1, 0, 0, 1, 1,
1.809314, 0.3842327, 2.309458, 1, 0, 0, 1, 1,
1.810098, -2.480851, 2.474858, 0, 0, 0, 1, 1,
1.810375, 1.109533, 1.297179, 0, 0, 0, 1, 1,
1.810711, 1.810552, -0.300057, 0, 0, 0, 1, 1,
1.815122, -1.710161, 1.273084, 0, 0, 0, 1, 1,
1.823864, -0.8954883, 3.198493, 0, 0, 0, 1, 1,
1.834116, -1.748418, 3.051795, 0, 0, 0, 1, 1,
1.837982, 0.8369051, 1.727936, 0, 0, 0, 1, 1,
1.848221, 0.5463726, 1.563627, 1, 1, 1, 1, 1,
1.853076, 0.04979098, 1.497411, 1, 1, 1, 1, 1,
1.873304, -1.422623, 1.514006, 1, 1, 1, 1, 1,
1.896163, -0.1448429, 2.683204, 1, 1, 1, 1, 1,
1.902367, -0.3824084, 0.6505941, 1, 1, 1, 1, 1,
1.935366, -0.4550614, 1.589193, 1, 1, 1, 1, 1,
1.940259, 1.225406, 1.185392, 1, 1, 1, 1, 1,
1.942091, 0.2967083, 2.133101, 1, 1, 1, 1, 1,
1.95611, -1.838758, 2.633274, 1, 1, 1, 1, 1,
1.963623, -1.33536, 2.786288, 1, 1, 1, 1, 1,
1.969961, -0.2774582, 1.592006, 1, 1, 1, 1, 1,
1.979791, -1.000883, 1.780986, 1, 1, 1, 1, 1,
1.989706, 0.1647777, 1.981854, 1, 1, 1, 1, 1,
2.019785, -0.3582947, 4.54491, 1, 1, 1, 1, 1,
2.039819, 0.02081013, 2.282685, 1, 1, 1, 1, 1,
2.045393, 2.103189, 0.4504865, 0, 0, 1, 1, 1,
2.063807, 0.4681391, 2.035833, 1, 0, 0, 1, 1,
2.06734, -1.642042, 2.758031, 1, 0, 0, 1, 1,
2.101254, -0.8597956, 3.786506, 1, 0, 0, 1, 1,
2.133935, 0.3860523, 1.478339, 1, 0, 0, 1, 1,
2.143826, 0.3159645, 0.6729669, 1, 0, 0, 1, 1,
2.18492, -0.8321131, 2.25946, 0, 0, 0, 1, 1,
2.214553, -0.9228864, 2.469486, 0, 0, 0, 1, 1,
2.220262, -1.580023, 3.920658, 0, 0, 0, 1, 1,
2.242987, 0.5015692, 1.874769, 0, 0, 0, 1, 1,
2.244702, 0.1859256, 1.014497, 0, 0, 0, 1, 1,
2.27125, -0.06859973, 2.685619, 0, 0, 0, 1, 1,
2.298754, 0.2039554, 0.551392, 0, 0, 0, 1, 1,
2.479631, -0.290291, 3.282647, 1, 1, 1, 1, 1,
2.513936, 0.5627673, 0.3445306, 1, 1, 1, 1, 1,
2.540265, -0.7098768, 2.766003, 1, 1, 1, 1, 1,
2.563411, 0.1033715, 0.3612424, 1, 1, 1, 1, 1,
2.675213, 2.043456, -0.5576425, 1, 1, 1, 1, 1,
2.699739, -1.407677, 2.301886, 1, 1, 1, 1, 1,
2.794299, 0.7459125, 0.7636834, 1, 1, 1, 1, 1
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
var radius = 10.20549;
var distance = 35.84634;
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
mvMatrix.translate( 0.1196946, 0.1978588, 0.8241987 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.84634);
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
