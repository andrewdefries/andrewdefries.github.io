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
-3.178585, 1.10558, 0.008838698, 1, 0, 0, 1,
-3.118583, 1.395652, -0.2538121, 1, 0.007843138, 0, 1,
-2.708907, 0.7062818, -3.3862, 1, 0.01176471, 0, 1,
-2.69159, -0.5572747, -1.918851, 1, 0.01960784, 0, 1,
-2.560326, -1.14019, -1.890491, 1, 0.02352941, 0, 1,
-2.488581, 0.8541188, -1.691484, 1, 0.03137255, 0, 1,
-2.463001, 0.9400536, -1.544344, 1, 0.03529412, 0, 1,
-2.358299, -0.6003245, -1.742351, 1, 0.04313726, 0, 1,
-2.337171, 1.343245, -1.297988, 1, 0.04705882, 0, 1,
-2.298829, 0.1218424, -1.227277, 1, 0.05490196, 0, 1,
-2.285864, -1.736064, -3.278289, 1, 0.05882353, 0, 1,
-2.254603, -0.007461496, -3.099141, 1, 0.06666667, 0, 1,
-2.233299, -2.05176, -3.970686, 1, 0.07058824, 0, 1,
-2.16811, -1.017177, -2.447004, 1, 0.07843138, 0, 1,
-2.144736, -0.8065074, -1.9912, 1, 0.08235294, 0, 1,
-2.113574, -0.8690356, -2.114996, 1, 0.09019608, 0, 1,
-2.107457, 0.6716641, -2.751269, 1, 0.09411765, 0, 1,
-2.099694, 1.672743, -0.04598791, 1, 0.1019608, 0, 1,
-2.094188, 1.021236, -1.207587, 1, 0.1098039, 0, 1,
-2.06495, -1.207051, -2.443462, 1, 0.1137255, 0, 1,
-2.064382, -0.464671, -2.376693, 1, 0.1215686, 0, 1,
-2.044227, -1.534659, -1.548012, 1, 0.1254902, 0, 1,
-2.031436, -0.3210099, -5.100664, 1, 0.1333333, 0, 1,
-2.025758, 1.016822, -1.35471, 1, 0.1372549, 0, 1,
-2.01551, -0.5465652, -2.304406, 1, 0.145098, 0, 1,
-2.001576, -0.3977192, -1.204738, 1, 0.1490196, 0, 1,
-1.999325, -0.1149325, -0.4998623, 1, 0.1568628, 0, 1,
-1.998548, -0.8561004, -1.546488, 1, 0.1607843, 0, 1,
-1.988849, -1.388918, -1.38635, 1, 0.1686275, 0, 1,
-1.963162, 0.3237289, -0.1366999, 1, 0.172549, 0, 1,
-1.960446, -0.396771, -0.08876839, 1, 0.1803922, 0, 1,
-1.943785, -0.79269, -3.499619, 1, 0.1843137, 0, 1,
-1.933273, -0.5615606, -0.1200378, 1, 0.1921569, 0, 1,
-1.910027, -0.3329778, -2.479864, 1, 0.1960784, 0, 1,
-1.904579, -1.119703, -0.4372582, 1, 0.2039216, 0, 1,
-1.893713, -2.196959, -3.090884, 1, 0.2117647, 0, 1,
-1.881542, 0.02365596, -2.977112, 1, 0.2156863, 0, 1,
-1.859461, 0.5654424, 1.022985, 1, 0.2235294, 0, 1,
-1.847418, -1.367628, -2.791504, 1, 0.227451, 0, 1,
-1.847214, -0.4935354, -1.098741, 1, 0.2352941, 0, 1,
-1.846615, 0.1914443, -1.236066, 1, 0.2392157, 0, 1,
-1.834717, 0.8719597, -0.9878981, 1, 0.2470588, 0, 1,
-1.834227, 0.6832909, -1.279724, 1, 0.2509804, 0, 1,
-1.833924, 1.018863, -1.420968, 1, 0.2588235, 0, 1,
-1.817135, 1.038826, -0.9198071, 1, 0.2627451, 0, 1,
-1.80362, 0.04207728, -1.72764, 1, 0.2705882, 0, 1,
-1.786185, -0.6528049, -0.8730932, 1, 0.2745098, 0, 1,
-1.774679, -1.402854, -1.049312, 1, 0.282353, 0, 1,
-1.771198, 0.01036045, -1.255412, 1, 0.2862745, 0, 1,
-1.746712, 0.1224527, -1.712706, 1, 0.2941177, 0, 1,
-1.745818, -0.05284698, 0.001806079, 1, 0.3019608, 0, 1,
-1.725143, -1.402055, -1.536561, 1, 0.3058824, 0, 1,
-1.717612, -2.10818, -0.09268469, 1, 0.3137255, 0, 1,
-1.696084, -1.93781, -3.352817, 1, 0.3176471, 0, 1,
-1.6924, 0.8971077, -0.2858976, 1, 0.3254902, 0, 1,
-1.692013, -1.606981, -1.551243, 1, 0.3294118, 0, 1,
-1.683633, 0.4727188, -1.533118, 1, 0.3372549, 0, 1,
-1.683009, 1.028001, -0.7071114, 1, 0.3411765, 0, 1,
-1.672838, 0.4345856, -0.9442298, 1, 0.3490196, 0, 1,
-1.672039, 0.03358766, -0.4475045, 1, 0.3529412, 0, 1,
-1.660157, -2.077864, -1.933535, 1, 0.3607843, 0, 1,
-1.630915, 0.3858335, -3.103309, 1, 0.3647059, 0, 1,
-1.625792, 0.05982172, -1.564173, 1, 0.372549, 0, 1,
-1.605382, 1.119224, -1.444199, 1, 0.3764706, 0, 1,
-1.602808, -0.8677588, -2.983109, 1, 0.3843137, 0, 1,
-1.602806, -0.4905452, -2.40576, 1, 0.3882353, 0, 1,
-1.598154, 1.149646, -1.528655, 1, 0.3960784, 0, 1,
-1.594911, 0.6866269, 1.011648, 1, 0.4039216, 0, 1,
-1.592519, 0.5483558, -0.4315101, 1, 0.4078431, 0, 1,
-1.590875, 0.9593838, -1.47769, 1, 0.4156863, 0, 1,
-1.587566, -0.2740653, -2.013151, 1, 0.4196078, 0, 1,
-1.580871, -0.6451745, -0.7687475, 1, 0.427451, 0, 1,
-1.572545, -1.152222, -1.467989, 1, 0.4313726, 0, 1,
-1.567083, 0.7684341, -0.9274591, 1, 0.4392157, 0, 1,
-1.565511, -1.53459, -3.861208, 1, 0.4431373, 0, 1,
-1.563643, 1.461459, -2.472234, 1, 0.4509804, 0, 1,
-1.553573, 1.491189, -0.2032809, 1, 0.454902, 0, 1,
-1.551161, 1.278105, -0.2855006, 1, 0.4627451, 0, 1,
-1.551142, -1.796314, -3.645833, 1, 0.4666667, 0, 1,
-1.537509, 0.5636338, -0.05553554, 1, 0.4745098, 0, 1,
-1.528203, 2.444061, -1.792922, 1, 0.4784314, 0, 1,
-1.526639, 0.6484313, -1.397812, 1, 0.4862745, 0, 1,
-1.526088, 0.1081247, -0.4514725, 1, 0.4901961, 0, 1,
-1.521989, -0.398263, -2.996505, 1, 0.4980392, 0, 1,
-1.517688, -0.03922097, -1.070027, 1, 0.5058824, 0, 1,
-1.50809, 0.009652113, -0.9177108, 1, 0.509804, 0, 1,
-1.501333, -0.6018896, -2.287645, 1, 0.5176471, 0, 1,
-1.49867, -1.809708, -0.7763677, 1, 0.5215687, 0, 1,
-1.498311, 1.748917, -1.396298, 1, 0.5294118, 0, 1,
-1.49565, 1.832262, -1.788171, 1, 0.5333334, 0, 1,
-1.487886, -0.810526, -1.448248, 1, 0.5411765, 0, 1,
-1.476911, -0.624818, -0.6496478, 1, 0.5450981, 0, 1,
-1.440832, 1.29272, -0.5433178, 1, 0.5529412, 0, 1,
-1.422535, 0.5008258, -1.88863, 1, 0.5568628, 0, 1,
-1.419332, -1.7694, -2.986581, 1, 0.5647059, 0, 1,
-1.388213, 2.444443, -1.711886, 1, 0.5686275, 0, 1,
-1.370701, -0.048136, -1.0402, 1, 0.5764706, 0, 1,
-1.350899, -1.387377, -2.865276, 1, 0.5803922, 0, 1,
-1.344369, -0.1156952, -2.171552, 1, 0.5882353, 0, 1,
-1.323521, -0.05944818, -1.908562, 1, 0.5921569, 0, 1,
-1.32276, -0.3663343, -1.904425, 1, 0.6, 0, 1,
-1.31344, -1.102923, -1.567918, 1, 0.6078432, 0, 1,
-1.311081, 0.3456484, -2.225491, 1, 0.6117647, 0, 1,
-1.307691, 1.320501, -1.22356, 1, 0.6196079, 0, 1,
-1.301538, 0.7810823, -3.177887, 1, 0.6235294, 0, 1,
-1.296766, 0.9563051, -3.43062, 1, 0.6313726, 0, 1,
-1.294991, -1.039425, -1.807644, 1, 0.6352941, 0, 1,
-1.286844, -0.1504882, -3.277363, 1, 0.6431373, 0, 1,
-1.284201, 1.867546, 0.3885635, 1, 0.6470588, 0, 1,
-1.278785, -1.032975, -3.34566, 1, 0.654902, 0, 1,
-1.263482, 1.098368, -0.1429735, 1, 0.6588235, 0, 1,
-1.25701, 2.271127, -0.6133835, 1, 0.6666667, 0, 1,
-1.253417, -0.4891288, -1.590032, 1, 0.6705883, 0, 1,
-1.248385, -0.7893924, -0.6565821, 1, 0.6784314, 0, 1,
-1.246038, 0.5493118, -2.038579, 1, 0.682353, 0, 1,
-1.242899, 0.2994937, 0.5554552, 1, 0.6901961, 0, 1,
-1.226225, -0.6373652, -3.012397, 1, 0.6941177, 0, 1,
-1.223445, 1.081404, 0.1979408, 1, 0.7019608, 0, 1,
-1.221978, 0.1303122, -2.178648, 1, 0.7098039, 0, 1,
-1.212323, -0.5796964, -2.343903, 1, 0.7137255, 0, 1,
-1.206651, -0.3020219, -3.477895, 1, 0.7215686, 0, 1,
-1.205701, 0.2942482, -1.779456, 1, 0.7254902, 0, 1,
-1.198951, -0.1547083, -0.4636003, 1, 0.7333333, 0, 1,
-1.198913, -0.394706, -2.654649, 1, 0.7372549, 0, 1,
-1.195614, 0.1152588, -1.220808, 1, 0.7450981, 0, 1,
-1.194666, 0.1653988, -1.54607, 1, 0.7490196, 0, 1,
-1.192375, -0.4409626, -2.30203, 1, 0.7568628, 0, 1,
-1.186269, 0.21666, -2.174825, 1, 0.7607843, 0, 1,
-1.183908, 2.141054, -0.8363044, 1, 0.7686275, 0, 1,
-1.181643, -0.01196126, -2.25925, 1, 0.772549, 0, 1,
-1.180575, 0.798161, -0.6187303, 1, 0.7803922, 0, 1,
-1.179341, 0.6593505, -0.413086, 1, 0.7843137, 0, 1,
-1.178013, -0.292338, -3.502838, 1, 0.7921569, 0, 1,
-1.176129, -1.397759, -2.168807, 1, 0.7960784, 0, 1,
-1.161815, 0.5918951, -0.3098928, 1, 0.8039216, 0, 1,
-1.141664, -0.7879074, -3.255518, 1, 0.8117647, 0, 1,
-1.126826, -0.9788821, -1.649684, 1, 0.8156863, 0, 1,
-1.12522, 0.6412451, -1.034107, 1, 0.8235294, 0, 1,
-1.123375, -0.652919, -3.194474, 1, 0.827451, 0, 1,
-1.119391, -0.07901443, -1.422545, 1, 0.8352941, 0, 1,
-1.113211, -1.388448, -0.3212662, 1, 0.8392157, 0, 1,
-1.10993, -0.941469, -2.051857, 1, 0.8470588, 0, 1,
-1.102165, -0.0829325, -0.5223933, 1, 0.8509804, 0, 1,
-1.101829, 1.348105, 1.118847, 1, 0.8588235, 0, 1,
-1.081112, 0.007883887, -1.519394, 1, 0.8627451, 0, 1,
-1.078319, 0.4397412, 0.2135865, 1, 0.8705882, 0, 1,
-1.076517, 0.9622223, -1.35877, 1, 0.8745098, 0, 1,
-1.072109, -1.902323, -3.233662, 1, 0.8823529, 0, 1,
-1.071686, 0.1456933, -1.076422, 1, 0.8862745, 0, 1,
-1.065462, 0.1272469, -0.1912809, 1, 0.8941177, 0, 1,
-1.065422, -0.8563119, -1.904114, 1, 0.8980392, 0, 1,
-1.055194, -0.464319, -3.212816, 1, 0.9058824, 0, 1,
-1.052033, -0.6772546, -3.66318, 1, 0.9137255, 0, 1,
-1.051242, 0.08144636, -3.020591, 1, 0.9176471, 0, 1,
-1.050978, 0.5243377, -0.3390615, 1, 0.9254902, 0, 1,
-1.048078, 1.172311, -0.8702852, 1, 0.9294118, 0, 1,
-1.0473, -0.3779106, -0.6168064, 1, 0.9372549, 0, 1,
-1.041636, 0.8079975, -1.226093, 1, 0.9411765, 0, 1,
-1.027614, 0.6663084, 1.377556, 1, 0.9490196, 0, 1,
-1.02196, 0.589008, -1.016881, 1, 0.9529412, 0, 1,
-1.019319, -0.08496182, -2.006848, 1, 0.9607843, 0, 1,
-1.013148, -0.8653801, -3.763046, 1, 0.9647059, 0, 1,
-1.011224, 1.347928, -1.893895, 1, 0.972549, 0, 1,
-1.007864, -0.7164931, -2.468957, 1, 0.9764706, 0, 1,
-1.005959, -0.02281401, -2.697352, 1, 0.9843137, 0, 1,
-1.000285, -0.1205071, -0.9690981, 1, 0.9882353, 0, 1,
-0.991838, -0.6211081, -0.9802719, 1, 0.9960784, 0, 1,
-0.9909143, -1.553708, -1.268418, 0.9960784, 1, 0, 1,
-0.9888211, 0.1890934, -0.6368644, 0.9921569, 1, 0, 1,
-0.9875895, -0.3523687, -1.520414, 0.9843137, 1, 0, 1,
-0.9870518, -0.9410998, -1.997881, 0.9803922, 1, 0, 1,
-0.9853999, 0.8077414, -2.597472, 0.972549, 1, 0, 1,
-0.9671764, 0.1765014, -0.2804734, 0.9686275, 1, 0, 1,
-0.9621919, -0.3040544, -0.7779098, 0.9607843, 1, 0, 1,
-0.9530355, -0.05665744, 0.3697143, 0.9568627, 1, 0, 1,
-0.9521737, 0.8397539, -1.640836, 0.9490196, 1, 0, 1,
-0.9411783, 0.6675319, -2.291043, 0.945098, 1, 0, 1,
-0.9392865, 1.470834, -2.159199, 0.9372549, 1, 0, 1,
-0.9377819, 0.05803164, -1.572053, 0.9333333, 1, 0, 1,
-0.9355273, -0.9067916, -2.860868, 0.9254902, 1, 0, 1,
-0.9332775, 0.9518871, -0.1556094, 0.9215686, 1, 0, 1,
-0.9280659, 1.516626, -3.016547, 0.9137255, 1, 0, 1,
-0.9270784, -1.361718, -1.596161, 0.9098039, 1, 0, 1,
-0.9261305, -0.8246393, -2.684778, 0.9019608, 1, 0, 1,
-0.9260597, 0.3230865, 0.3528203, 0.8941177, 1, 0, 1,
-0.925643, 0.7495205, 0.2792969, 0.8901961, 1, 0, 1,
-0.9200283, 0.7067324, -1.741583, 0.8823529, 1, 0, 1,
-0.9193746, -1.313006, -2.839806, 0.8784314, 1, 0, 1,
-0.8935549, 0.5880837, -1.478738, 0.8705882, 1, 0, 1,
-0.8933907, -0.495427, -1.363951, 0.8666667, 1, 0, 1,
-0.8896884, 1.505567, 0.3138578, 0.8588235, 1, 0, 1,
-0.8837779, -1.648705, -2.697833, 0.854902, 1, 0, 1,
-0.8833361, -0.9109749, -2.83711, 0.8470588, 1, 0, 1,
-0.88201, -1.887182, -3.890928, 0.8431373, 1, 0, 1,
-0.8706992, 1.265662, 1.631139, 0.8352941, 1, 0, 1,
-0.8688696, -0.7117075, -1.34236, 0.8313726, 1, 0, 1,
-0.8560103, -2.00338, -2.097458, 0.8235294, 1, 0, 1,
-0.8552393, 0.9844646, 0.02701467, 0.8196079, 1, 0, 1,
-0.8534629, -0.2534342, -0.6328393, 0.8117647, 1, 0, 1,
-0.8476021, 1.444533, -1.46893, 0.8078431, 1, 0, 1,
-0.8381125, 0.5215102, -2.003136, 0.8, 1, 0, 1,
-0.8370156, 0.8289055, -2.571324, 0.7921569, 1, 0, 1,
-0.8321623, -1.286139, -3.896525, 0.7882353, 1, 0, 1,
-0.8312884, 1.072901, 1.073706, 0.7803922, 1, 0, 1,
-0.8294061, 0.8083645, -0.7478701, 0.7764706, 1, 0, 1,
-0.8288479, 0.6225205, -0.7770237, 0.7686275, 1, 0, 1,
-0.8284795, 0.3834228, -0.8058647, 0.7647059, 1, 0, 1,
-0.8223925, -0.5325602, -3.438283, 0.7568628, 1, 0, 1,
-0.8212236, 1.103376, 0.1527511, 0.7529412, 1, 0, 1,
-0.8196025, -0.4456468, -2.291283, 0.7450981, 1, 0, 1,
-0.814959, -1.767078, -2.552093, 0.7411765, 1, 0, 1,
-0.8138224, -0.8375384, -2.566427, 0.7333333, 1, 0, 1,
-0.8034573, -0.02989357, -2.543898, 0.7294118, 1, 0, 1,
-0.7979808, -0.4586841, -3.114535, 0.7215686, 1, 0, 1,
-0.7947229, 0.1735292, 1.673691, 0.7176471, 1, 0, 1,
-0.7914526, -1.33853, -2.894094, 0.7098039, 1, 0, 1,
-0.7896755, 0.1691433, -0.803846, 0.7058824, 1, 0, 1,
-0.7867963, 0.7337198, -0.384091, 0.6980392, 1, 0, 1,
-0.7863779, 1.418563, -1.085859, 0.6901961, 1, 0, 1,
-0.7846918, 0.294706, -0.8288168, 0.6862745, 1, 0, 1,
-0.7831216, -1.591179, -3.20992, 0.6784314, 1, 0, 1,
-0.7657818, 0.223167, -2.255383, 0.6745098, 1, 0, 1,
-0.7571254, -2.202367, -2.127769, 0.6666667, 1, 0, 1,
-0.7500284, -0.9709079, -1.004706, 0.6627451, 1, 0, 1,
-0.7487811, -0.8871001, -2.443602, 0.654902, 1, 0, 1,
-0.7378598, 0.1137067, -1.646156, 0.6509804, 1, 0, 1,
-0.7372944, -1.200021, -3.262917, 0.6431373, 1, 0, 1,
-0.7256562, 0.615879, -2.271421, 0.6392157, 1, 0, 1,
-0.7212528, 0.7037861, -2.109244, 0.6313726, 1, 0, 1,
-0.7178656, 1.172158, -1.078748, 0.627451, 1, 0, 1,
-0.7174911, -0.1016281, -2.096381, 0.6196079, 1, 0, 1,
-0.7096656, -1.544788, -2.559571, 0.6156863, 1, 0, 1,
-0.7051504, -0.5530353, -2.735314, 0.6078432, 1, 0, 1,
-0.7024575, -2.298002, -3.15079, 0.6039216, 1, 0, 1,
-0.7003034, -0.6793605, -1.80405, 0.5960785, 1, 0, 1,
-0.696113, -0.1577974, -3.260178, 0.5882353, 1, 0, 1,
-0.6946843, -0.3547011, -0.2034182, 0.5843138, 1, 0, 1,
-0.690946, 0.9691035, -2.091917, 0.5764706, 1, 0, 1,
-0.6895152, -0.116622, -2.239074, 0.572549, 1, 0, 1,
-0.6763332, 0.70415, -1.490352, 0.5647059, 1, 0, 1,
-0.6731249, 0.8111207, 0.03409888, 0.5607843, 1, 0, 1,
-0.6685689, 0.2184105, -1.117768, 0.5529412, 1, 0, 1,
-0.6667154, 0.6970789, -1.048716, 0.5490196, 1, 0, 1,
-0.6643832, -0.6207466, -4.447763, 0.5411765, 1, 0, 1,
-0.6616672, 0.4667228, -0.2124201, 0.5372549, 1, 0, 1,
-0.6551998, 1.005985, -2.02196, 0.5294118, 1, 0, 1,
-0.6527461, -0.2817736, -1.808974, 0.5254902, 1, 0, 1,
-0.6372994, 0.4422002, -1.182772, 0.5176471, 1, 0, 1,
-0.6368113, -0.9333245, -2.647963, 0.5137255, 1, 0, 1,
-0.6352224, 0.1013767, -1.28802, 0.5058824, 1, 0, 1,
-0.6334406, 0.322343, -1.019956, 0.5019608, 1, 0, 1,
-0.6289301, -1.007549, -2.759488, 0.4941176, 1, 0, 1,
-0.6266056, -0.1890481, -1.973046, 0.4862745, 1, 0, 1,
-0.6260589, -0.1823281, 0.2530659, 0.4823529, 1, 0, 1,
-0.6199977, 0.1404858, -0.6352068, 0.4745098, 1, 0, 1,
-0.6186322, -0.6905026, -2.145568, 0.4705882, 1, 0, 1,
-0.6180742, -1.128225, -3.135219, 0.4627451, 1, 0, 1,
-0.6144548, -0.4093737, -1.512469, 0.4588235, 1, 0, 1,
-0.6132975, 0.6632843, -1.068166, 0.4509804, 1, 0, 1,
-0.6102266, 0.2756538, -2.234779, 0.4470588, 1, 0, 1,
-0.6098568, -0.2551496, -1.077522, 0.4392157, 1, 0, 1,
-0.6058594, 1.532763, -1.830803, 0.4352941, 1, 0, 1,
-0.6050926, -0.6222073, 0.02340032, 0.427451, 1, 0, 1,
-0.6030754, -2.159513, -2.077013, 0.4235294, 1, 0, 1,
-0.5995435, 0.2267139, -0.7180409, 0.4156863, 1, 0, 1,
-0.5979271, -0.508782, -2.646146, 0.4117647, 1, 0, 1,
-0.5971696, 0.398566, -0.2614853, 0.4039216, 1, 0, 1,
-0.5966065, -0.1011015, -3.676779, 0.3960784, 1, 0, 1,
-0.5962055, -0.5768573, -3.040486, 0.3921569, 1, 0, 1,
-0.5930282, 0.5804186, -1.051339, 0.3843137, 1, 0, 1,
-0.5873276, -0.6390871, -2.449306, 0.3803922, 1, 0, 1,
-0.5854971, -0.04290771, -2.421991, 0.372549, 1, 0, 1,
-0.5818802, 0.07850416, -0.3108985, 0.3686275, 1, 0, 1,
-0.5683878, -1.579272, -1.606669, 0.3607843, 1, 0, 1,
-0.5656086, 0.7799009, -1.132071, 0.3568628, 1, 0, 1,
-0.5654521, -0.5886527, -3.401712, 0.3490196, 1, 0, 1,
-0.5652832, 0.6630297, -0.949625, 0.345098, 1, 0, 1,
-0.5597202, -0.1222504, -0.8435324, 0.3372549, 1, 0, 1,
-0.5569289, -0.01770733, -1.134221, 0.3333333, 1, 0, 1,
-0.5524364, 0.3662393, -0.015424, 0.3254902, 1, 0, 1,
-0.545887, -1.660756, -2.65598, 0.3215686, 1, 0, 1,
-0.542225, -1.47176, -3.014087, 0.3137255, 1, 0, 1,
-0.5406172, -0.7374201, -3.468748, 0.3098039, 1, 0, 1,
-0.5348209, 0.900832, 0.7667326, 0.3019608, 1, 0, 1,
-0.5342352, -1.370047, -2.439288, 0.2941177, 1, 0, 1,
-0.5342049, 0.7477073, -0.2250131, 0.2901961, 1, 0, 1,
-0.5337721, -0.2439665, -2.997418, 0.282353, 1, 0, 1,
-0.5334022, 0.6154493, -1.687933, 0.2784314, 1, 0, 1,
-0.5282212, -0.3985384, -1.521142, 0.2705882, 1, 0, 1,
-0.5280304, 0.2388737, -1.177284, 0.2666667, 1, 0, 1,
-0.5275576, -0.07390328, -0.7535558, 0.2588235, 1, 0, 1,
-0.52648, -1.515336, -2.419414, 0.254902, 1, 0, 1,
-0.5254713, 0.2652062, 0.151193, 0.2470588, 1, 0, 1,
-0.5140705, -1.337428, -2.262477, 0.2431373, 1, 0, 1,
-0.5108973, 1.148112, 1.109914, 0.2352941, 1, 0, 1,
-0.5102358, -0.3144928, -1.823835, 0.2313726, 1, 0, 1,
-0.5061978, 1.869602, -1.305112, 0.2235294, 1, 0, 1,
-0.5057499, -0.1442849, -1.661786, 0.2196078, 1, 0, 1,
-0.5042003, -0.1160275, -0.366041, 0.2117647, 1, 0, 1,
-0.5029784, 0.3888939, -0.2732301, 0.2078431, 1, 0, 1,
-0.4971858, 1.273991, 0.520338, 0.2, 1, 0, 1,
-0.4970659, -0.3778454, -2.9819, 0.1921569, 1, 0, 1,
-0.4954013, 0.7165036, -0.9774963, 0.1882353, 1, 0, 1,
-0.4903393, -0.7794306, -1.691269, 0.1803922, 1, 0, 1,
-0.486912, 1.277184, 0.5601578, 0.1764706, 1, 0, 1,
-0.4863397, -0.6935773, -2.196164, 0.1686275, 1, 0, 1,
-0.4834894, -0.4666962, -2.215616, 0.1647059, 1, 0, 1,
-0.4825058, -0.4512761, -2.344976, 0.1568628, 1, 0, 1,
-0.4811207, 1.383494, -0.3015283, 0.1529412, 1, 0, 1,
-0.4803747, 1.913435, -0.1964084, 0.145098, 1, 0, 1,
-0.4769074, 0.4894105, -1.029478, 0.1411765, 1, 0, 1,
-0.4698083, 1.113958, -1.177047, 0.1333333, 1, 0, 1,
-0.4684662, -1.257676, -4.224845, 0.1294118, 1, 0, 1,
-0.4671229, 1.864645, -1.145865, 0.1215686, 1, 0, 1,
-0.4665948, -0.968998, -3.197079, 0.1176471, 1, 0, 1,
-0.4637212, -0.03139486, -1.032432, 0.1098039, 1, 0, 1,
-0.4621722, 0.840674, -3.247175, 0.1058824, 1, 0, 1,
-0.4619319, 0.4378826, -0.4520853, 0.09803922, 1, 0, 1,
-0.4566797, -0.9993114, -1.75704, 0.09019608, 1, 0, 1,
-0.4558, 0.1107755, -1.509613, 0.08627451, 1, 0, 1,
-0.4528984, 0.4325674, -2.148729, 0.07843138, 1, 0, 1,
-0.4528566, -0.3448698, -0.2538744, 0.07450981, 1, 0, 1,
-0.4528157, 0.9489233, -0.2747347, 0.06666667, 1, 0, 1,
-0.4524305, -0.3297737, -3.071112, 0.0627451, 1, 0, 1,
-0.4500251, 1.042165, 0.5511469, 0.05490196, 1, 0, 1,
-0.4488034, -0.3411563, -2.643685, 0.05098039, 1, 0, 1,
-0.4453001, 0.3939557, 1.285738, 0.04313726, 1, 0, 1,
-0.4429336, 0.7070814, 0.7789311, 0.03921569, 1, 0, 1,
-0.4380274, 1.129749, 0.08700171, 0.03137255, 1, 0, 1,
-0.437731, -1.007253, -3.842383, 0.02745098, 1, 0, 1,
-0.4361561, -1.833378, -0.3653633, 0.01960784, 1, 0, 1,
-0.4351795, -0.04814893, -2.138012, 0.01568628, 1, 0, 1,
-0.4300904, -1.396736, -2.688921, 0.007843138, 1, 0, 1,
-0.4281107, 0.04430506, -1.11035, 0.003921569, 1, 0, 1,
-0.4264878, 0.3542061, -0.2425874, 0, 1, 0.003921569, 1,
-0.4236502, 1.092143, -1.634757, 0, 1, 0.01176471, 1,
-0.4089079, -0.2576465, -2.155256, 0, 1, 0.01568628, 1,
-0.4059753, -0.642572, -2.523015, 0, 1, 0.02352941, 1,
-0.4036501, -1.029409, -3.352679, 0, 1, 0.02745098, 1,
-0.4020325, 0.413184, 1.223846, 0, 1, 0.03529412, 1,
-0.3991002, 2.418597, -0.4573246, 0, 1, 0.03921569, 1,
-0.3968911, -0.6667705, -1.074282, 0, 1, 0.04705882, 1,
-0.3888569, -0.09964287, 0.7026429, 0, 1, 0.05098039, 1,
-0.3865718, 0.2486559, -1.742477, 0, 1, 0.05882353, 1,
-0.3855213, -0.1515881, -1.363858, 0, 1, 0.0627451, 1,
-0.383729, -1.48409, -4.348012, 0, 1, 0.07058824, 1,
-0.3817336, 0.628731, -0.3485349, 0, 1, 0.07450981, 1,
-0.3784174, 1.864196, -1.416241, 0, 1, 0.08235294, 1,
-0.3743746, -1.744098, -3.180482, 0, 1, 0.08627451, 1,
-0.372859, 0.3440717, -2.063145, 0, 1, 0.09411765, 1,
-0.3728084, -0.6332058, -1.976654, 0, 1, 0.1019608, 1,
-0.3726348, 1.502082, -1.551169, 0, 1, 0.1058824, 1,
-0.3717142, 0.8177485, -2.05438, 0, 1, 0.1137255, 1,
-0.3710432, 1.484843, 1.547965, 0, 1, 0.1176471, 1,
-0.3653264, -1.601823, -1.200489, 0, 1, 0.1254902, 1,
-0.3599754, 1.994186, -0.5908116, 0, 1, 0.1294118, 1,
-0.3565975, 0.02316577, -1.724124, 0, 1, 0.1372549, 1,
-0.3559345, 0.6704242, -0.4123726, 0, 1, 0.1411765, 1,
-0.3552439, -0.7771924, -2.189849, 0, 1, 0.1490196, 1,
-0.3528585, 1.630694, -0.7738378, 0, 1, 0.1529412, 1,
-0.3478542, 0.1946924, -0.07547937, 0, 1, 0.1607843, 1,
-0.3442006, 0.3369708, 1.388535, 0, 1, 0.1647059, 1,
-0.3437841, 0.2861227, -2.062097, 0, 1, 0.172549, 1,
-0.3405848, 0.7536505, -0.800059, 0, 1, 0.1764706, 1,
-0.3390766, -1.164161, -2.354175, 0, 1, 0.1843137, 1,
-0.3384247, -0.2770743, -2.341402, 0, 1, 0.1882353, 1,
-0.3373969, -0.3844376, -2.691944, 0, 1, 0.1960784, 1,
-0.3352837, 1.144356, 1.990229, 0, 1, 0.2039216, 1,
-0.3327064, -0.3558955, -1.360952, 0, 1, 0.2078431, 1,
-0.3302533, -0.3007918, -1.464161, 0, 1, 0.2156863, 1,
-0.3293357, -1.831023, -3.362518, 0, 1, 0.2196078, 1,
-0.3256064, 0.7489958, -1.059634, 0, 1, 0.227451, 1,
-0.3208602, 0.9158348, -1.669223, 0, 1, 0.2313726, 1,
-0.311083, 0.2622221, -0.6104352, 0, 1, 0.2392157, 1,
-0.3065836, 0.9413961, -0.2449723, 0, 1, 0.2431373, 1,
-0.306134, 0.6617789, -2.011327, 0, 1, 0.2509804, 1,
-0.3016088, -0.2068227, -0.9060975, 0, 1, 0.254902, 1,
-0.2981969, 2.460583, -0.3041236, 0, 1, 0.2627451, 1,
-0.2968211, 0.03215088, -3.110928, 0, 1, 0.2666667, 1,
-0.2932609, 0.5648103, 0.5666508, 0, 1, 0.2745098, 1,
-0.2824767, -0.04403299, 1.334961, 0, 1, 0.2784314, 1,
-0.2820136, -1.390707, -2.419961, 0, 1, 0.2862745, 1,
-0.2814247, 0.4961307, -1.118349, 0, 1, 0.2901961, 1,
-0.2785478, -0.4216104, -0.6900228, 0, 1, 0.2980392, 1,
-0.2750715, -0.01898879, -2.75893, 0, 1, 0.3058824, 1,
-0.2735833, -2.170693, -2.330282, 0, 1, 0.3098039, 1,
-0.2726891, 0.2487631, -0.8145292, 0, 1, 0.3176471, 1,
-0.272549, -0.2321765, -3.686085, 0, 1, 0.3215686, 1,
-0.2706778, -0.565336, -2.055566, 0, 1, 0.3294118, 1,
-0.2636127, 1.009433, 1.155939, 0, 1, 0.3333333, 1,
-0.2619198, 0.566977, -2.543816, 0, 1, 0.3411765, 1,
-0.2608027, -1.851911, -1.643367, 0, 1, 0.345098, 1,
-0.2582398, 0.1035238, -2.867225, 0, 1, 0.3529412, 1,
-0.2579395, 0.2589822, -2.224976, 0, 1, 0.3568628, 1,
-0.2549375, -0.4158399, -1.928153, 0, 1, 0.3647059, 1,
-0.253928, -1.904863, -3.708918, 0, 1, 0.3686275, 1,
-0.2499384, -0.8061827, -3.372789, 0, 1, 0.3764706, 1,
-0.2488502, -0.8742393, -4.551579, 0, 1, 0.3803922, 1,
-0.2484797, 0.73708, -0.1764175, 0, 1, 0.3882353, 1,
-0.2470658, 1.037551, -0.04092161, 0, 1, 0.3921569, 1,
-0.2468609, 0.2499846, 0.4671237, 0, 1, 0.4, 1,
-0.2421658, -0.3113177, -3.014828, 0, 1, 0.4078431, 1,
-0.2409943, -0.3742831, -3.409049, 0, 1, 0.4117647, 1,
-0.2382104, -0.3694088, -1.482067, 0, 1, 0.4196078, 1,
-0.2317428, -0.2220461, -1.832149, 0, 1, 0.4235294, 1,
-0.2272448, 0.9960216, -0.5190042, 0, 1, 0.4313726, 1,
-0.225175, 0.665832, -0.75752, 0, 1, 0.4352941, 1,
-0.2244146, 0.5767165, 1.057466, 0, 1, 0.4431373, 1,
-0.2208706, 0.8898111, -0.9998743, 0, 1, 0.4470588, 1,
-0.219351, 0.8538127, -1.078951, 0, 1, 0.454902, 1,
-0.2175081, -0.7165074, -2.986943, 0, 1, 0.4588235, 1,
-0.2166849, -0.442792, -4.465535, 0, 1, 0.4666667, 1,
-0.2160767, -0.3503155, -2.765013, 0, 1, 0.4705882, 1,
-0.2141467, 0.5765972, 0.3264141, 0, 1, 0.4784314, 1,
-0.2124959, -0.8983294, -3.605755, 0, 1, 0.4823529, 1,
-0.2049076, 2.222133, 0.2766426, 0, 1, 0.4901961, 1,
-0.2038705, 3.257036, 0.7406772, 0, 1, 0.4941176, 1,
-0.197771, -0.5495557, -4.190259, 0, 1, 0.5019608, 1,
-0.1968042, -0.3289527, -1.108903, 0, 1, 0.509804, 1,
-0.1943327, -0.2105024, -3.720315, 0, 1, 0.5137255, 1,
-0.18309, 0.463116, -2.30713, 0, 1, 0.5215687, 1,
-0.1796397, -1.062338, -1.624085, 0, 1, 0.5254902, 1,
-0.1780317, 0.5926192, -0.6050022, 0, 1, 0.5333334, 1,
-0.1726569, -0.03075244, 0.1775748, 0, 1, 0.5372549, 1,
-0.1701628, -0.2831187, -2.026985, 0, 1, 0.5450981, 1,
-0.1687368, -2.291103, -4.433424, 0, 1, 0.5490196, 1,
-0.1683147, -2.671351, -3.982852, 0, 1, 0.5568628, 1,
-0.1676501, 0.1351138, -0.01181486, 0, 1, 0.5607843, 1,
-0.1668081, -0.6050512, -4.689333, 0, 1, 0.5686275, 1,
-0.1613433, -0.531487, 0.1965564, 0, 1, 0.572549, 1,
-0.1576548, -0.8338856, -4.96905, 0, 1, 0.5803922, 1,
-0.1525666, -0.9325355, -2.429106, 0, 1, 0.5843138, 1,
-0.1522442, -0.914183, -4.047415, 0, 1, 0.5921569, 1,
-0.1513279, -1.616444, -3.458427, 0, 1, 0.5960785, 1,
-0.1476475, 0.8590429, -0.9125078, 0, 1, 0.6039216, 1,
-0.1451236, 0.9599259, -0.2629144, 0, 1, 0.6117647, 1,
-0.1422185, 0.3126968, -0.6781709, 0, 1, 0.6156863, 1,
-0.1420727, -0.07538732, -2.507792, 0, 1, 0.6235294, 1,
-0.1409504, 0.790274, 0.6988866, 0, 1, 0.627451, 1,
-0.1394375, -0.7087995, -2.430979, 0, 1, 0.6352941, 1,
-0.137346, -0.2435376, -1.862944, 0, 1, 0.6392157, 1,
-0.1358323, 0.3240553, -0.889044, 0, 1, 0.6470588, 1,
-0.133732, -2.844125, -3.823121, 0, 1, 0.6509804, 1,
-0.1333981, 0.506349, 0.2719366, 0, 1, 0.6588235, 1,
-0.1321405, 0.8671274, -2.191159, 0, 1, 0.6627451, 1,
-0.1298634, -1.096885, -2.906383, 0, 1, 0.6705883, 1,
-0.1252199, -0.2761541, -3.098818, 0, 1, 0.6745098, 1,
-0.1248197, -1.12937, -2.118332, 0, 1, 0.682353, 1,
-0.120593, -0.05089633, -2.265269, 0, 1, 0.6862745, 1,
-0.1201485, 0.6972144, -0.415451, 0, 1, 0.6941177, 1,
-0.1165696, -0.6182543, -2.67007, 0, 1, 0.7019608, 1,
-0.1150035, 0.3712539, -1.669077, 0, 1, 0.7058824, 1,
-0.1134704, -0.62905, -3.852593, 0, 1, 0.7137255, 1,
-0.1098234, 0.7820249, 1.089696, 0, 1, 0.7176471, 1,
-0.1080268, 0.5832712, 1.7482, 0, 1, 0.7254902, 1,
-0.1046751, -0.6567831, -2.827253, 0, 1, 0.7294118, 1,
-0.1044247, -0.1732243, -3.044708, 0, 1, 0.7372549, 1,
-0.1044094, 1.359432, 0.3037136, 0, 1, 0.7411765, 1,
-0.1015807, 0.2321307, -1.204748, 0, 1, 0.7490196, 1,
-0.09814746, 1.306013, 0.6118187, 0, 1, 0.7529412, 1,
-0.09781666, 0.3772334, 0.1053628, 0, 1, 0.7607843, 1,
-0.09639326, 2.458568, -0.5913243, 0, 1, 0.7647059, 1,
-0.09369507, 1.279092, 0.8681021, 0, 1, 0.772549, 1,
-0.09143157, 0.3057764, 0.2733929, 0, 1, 0.7764706, 1,
-0.09103519, 0.7974244, 0.03097929, 0, 1, 0.7843137, 1,
-0.08880323, 0.3642524, 0.1209204, 0, 1, 0.7882353, 1,
-0.08509044, -1.340463, -2.136127, 0, 1, 0.7960784, 1,
-0.08276501, 0.7406096, -0.05261473, 0, 1, 0.8039216, 1,
-0.08125909, 0.4775042, 0.1095445, 0, 1, 0.8078431, 1,
-0.07962973, -0.4729493, -2.863117, 0, 1, 0.8156863, 1,
-0.07742151, -1.166819, -1.572182, 0, 1, 0.8196079, 1,
-0.07343953, 0.9809425, 0.5869961, 0, 1, 0.827451, 1,
-0.06998998, -0.1105915, -2.047901, 0, 1, 0.8313726, 1,
-0.06461769, 1.82649, 1.803757, 0, 1, 0.8392157, 1,
-0.06412582, -0.1821114, -3.128703, 0, 1, 0.8431373, 1,
-0.05726027, 0.6860076, 1.524055, 0, 1, 0.8509804, 1,
-0.05575175, 1.663229, -1.120396, 0, 1, 0.854902, 1,
-0.05308644, -1.027914, -1.890608, 0, 1, 0.8627451, 1,
-0.05256182, 0.8389277, 1.27899, 0, 1, 0.8666667, 1,
-0.05171531, -1.03645, -3.297009, 0, 1, 0.8745098, 1,
-0.05024604, 1.949236e-06, -1.360133, 0, 1, 0.8784314, 1,
-0.0493684, 0.8462338, 0.2226555, 0, 1, 0.8862745, 1,
-0.04805032, 1.337194, 0.1375847, 0, 1, 0.8901961, 1,
-0.04312183, 0.002374199, 0.2622677, 0, 1, 0.8980392, 1,
-0.04260192, -1.693194, -4.065045, 0, 1, 0.9058824, 1,
-0.03818959, -1.681878, -4.770063, 0, 1, 0.9098039, 1,
-0.02827739, 0.5129789, -0.2664895, 0, 1, 0.9176471, 1,
-0.02711859, 0.002647498, -1.189912, 0, 1, 0.9215686, 1,
-0.02652427, 0.7118675, -1.01794, 0, 1, 0.9294118, 1,
-0.01875873, 0.3325315, -1.068045, 0, 1, 0.9333333, 1,
-0.01136146, -1.322626, -4.069313, 0, 1, 0.9411765, 1,
-0.01133244, -0.2619309, -4.015843, 0, 1, 0.945098, 1,
-0.01123894, -0.8202652, -4.84801, 0, 1, 0.9529412, 1,
-0.005897418, 0.1430515, 0.567222, 0, 1, 0.9568627, 1,
-0.005673724, -0.3222823, -3.583987, 0, 1, 0.9647059, 1,
-0.003246226, 0.567038, 1.964053, 0, 1, 0.9686275, 1,
-0.002403339, -0.7175996, -2.283959, 0, 1, 0.9764706, 1,
0.006077806, 0.2344467, -0.1407785, 0, 1, 0.9803922, 1,
0.008495974, 0.5860846, 0.4104214, 0, 1, 0.9882353, 1,
0.01011014, -1.765751, 0.4801621, 0, 1, 0.9921569, 1,
0.01103672, 1.085887, -0.8551285, 0, 1, 1, 1,
0.01506348, 0.9076628, -0.7186939, 0, 0.9921569, 1, 1,
0.015528, -0.8007496, 4.492574, 0, 0.9882353, 1, 1,
0.01792207, -2.457083, 2.272467, 0, 0.9803922, 1, 1,
0.01982772, 0.2164725, 1.141788, 0, 0.9764706, 1, 1,
0.01993322, -0.3173161, 0.8563738, 0, 0.9686275, 1, 1,
0.02823828, -1.403417, 2.650798, 0, 0.9647059, 1, 1,
0.0282972, 1.199249, -0.8605019, 0, 0.9568627, 1, 1,
0.03311888, -1.249688, 3.390554, 0, 0.9529412, 1, 1,
0.03653326, 1.441466, 0.7091212, 0, 0.945098, 1, 1,
0.03824339, 2.033665, -0.1546062, 0, 0.9411765, 1, 1,
0.0388514, -1.133009, 2.782271, 0, 0.9333333, 1, 1,
0.03907981, -0.5536878, 2.61567, 0, 0.9294118, 1, 1,
0.04116542, -0.4561872, 2.662871, 0, 0.9215686, 1, 1,
0.04250415, -1.637662, 4.720906, 0, 0.9176471, 1, 1,
0.04555575, 1.884421, -1.520439, 0, 0.9098039, 1, 1,
0.05119538, 1.158955, 0.6143607, 0, 0.9058824, 1, 1,
0.0579516, -0.03490226, 3.37718, 0, 0.8980392, 1, 1,
0.06084924, -1.136735, 2.898973, 0, 0.8901961, 1, 1,
0.06176957, 1.125538, -1.039971, 0, 0.8862745, 1, 1,
0.06608117, 0.9302526, -0.7230095, 0, 0.8784314, 1, 1,
0.06931952, -1.324772, 3.348271, 0, 0.8745098, 1, 1,
0.06996483, -1.229889, 3.918738, 0, 0.8666667, 1, 1,
0.07070037, -0.5537413, 2.283453, 0, 0.8627451, 1, 1,
0.07141298, 1.061835, 1.988045, 0, 0.854902, 1, 1,
0.07303169, 1.777372, -0.1916884, 0, 0.8509804, 1, 1,
0.07311542, 0.7934164, -0.1599607, 0, 0.8431373, 1, 1,
0.07431304, -1.625033, 3.588185, 0, 0.8392157, 1, 1,
0.08043866, 0.3963427, 0.9552509, 0, 0.8313726, 1, 1,
0.08094154, -0.5575454, 1.824351, 0, 0.827451, 1, 1,
0.0810387, -0.5549967, 2.876234, 0, 0.8196079, 1, 1,
0.08422139, 1.930344, -1.449111, 0, 0.8156863, 1, 1,
0.08423673, 0.07727697, 0.768324, 0, 0.8078431, 1, 1,
0.08460507, 0.9663081, -0.4356568, 0, 0.8039216, 1, 1,
0.08956909, -1.332485, 3.73638, 0, 0.7960784, 1, 1,
0.09157721, 0.03797903, 1.695371, 0, 0.7882353, 1, 1,
0.0974516, -0.9635922, 3.870752, 0, 0.7843137, 1, 1,
0.09844951, 1.287562, 0.7708559, 0, 0.7764706, 1, 1,
0.09846554, -2.095981, 3.226352, 0, 0.772549, 1, 1,
0.1009137, -0.3394254, 4.074923, 0, 0.7647059, 1, 1,
0.1022944, 0.09170076, -0.0005237816, 0, 0.7607843, 1, 1,
0.1047893, 0.07927524, 1.544249, 0, 0.7529412, 1, 1,
0.111397, 0.208456, -0.9092706, 0, 0.7490196, 1, 1,
0.1114783, -0.02242466, 2.960807, 0, 0.7411765, 1, 1,
0.1120541, -0.7984537, 2.549045, 0, 0.7372549, 1, 1,
0.1154666, 0.8800233, 0.1426604, 0, 0.7294118, 1, 1,
0.1201027, 1.816071, -0.6684583, 0, 0.7254902, 1, 1,
0.1220132, -1.123323, 2.109589, 0, 0.7176471, 1, 1,
0.122058, 0.2671796, 1.162322, 0, 0.7137255, 1, 1,
0.1240894, 0.3696219, -0.04931169, 0, 0.7058824, 1, 1,
0.1345189, 0.8035862, 0.8577279, 0, 0.6980392, 1, 1,
0.1361298, -0.5157404, 1.887525, 0, 0.6941177, 1, 1,
0.1381633, 0.05443697, -0.9987022, 0, 0.6862745, 1, 1,
0.1382356, 0.7067183, 0.9213664, 0, 0.682353, 1, 1,
0.1403508, 0.2497889, 0.6123042, 0, 0.6745098, 1, 1,
0.1420456, 0.8041998, 0.1707766, 0, 0.6705883, 1, 1,
0.1464015, 1.319506, -0.6627145, 0, 0.6627451, 1, 1,
0.1482049, 0.10449, -0.202984, 0, 0.6588235, 1, 1,
0.1500577, 0.2166265, 0.5435082, 0, 0.6509804, 1, 1,
0.1520832, -0.4602341, 2.678081, 0, 0.6470588, 1, 1,
0.1529773, 0.6080945, -0.2989359, 0, 0.6392157, 1, 1,
0.1551535, -0.503305, 6.409169, 0, 0.6352941, 1, 1,
0.1557289, -2.045405, 2.860564, 0, 0.627451, 1, 1,
0.1579622, -0.8836377, 4.201761, 0, 0.6235294, 1, 1,
0.1587548, 0.2975647, 0.8919367, 0, 0.6156863, 1, 1,
0.1635258, -0.1669214, 1.474543, 0, 0.6117647, 1, 1,
0.1635462, -0.2827459, 0.7275929, 0, 0.6039216, 1, 1,
0.1661446, 1.032558, 0.4768461, 0, 0.5960785, 1, 1,
0.1698334, 0.9772896, 2.362999, 0, 0.5921569, 1, 1,
0.1740329, 0.2060266, 1.519832, 0, 0.5843138, 1, 1,
0.1740527, 0.6562688, 1.774425, 0, 0.5803922, 1, 1,
0.1757852, 0.1963625, 1.791837, 0, 0.572549, 1, 1,
0.1769606, 0.7821042, -0.3664184, 0, 0.5686275, 1, 1,
0.1782658, -0.6312142, 2.394038, 0, 0.5607843, 1, 1,
0.1795976, 0.4991313, 0.7744976, 0, 0.5568628, 1, 1,
0.1850583, -1.346399, 2.005497, 0, 0.5490196, 1, 1,
0.1862129, -1.74251, 4.024314, 0, 0.5450981, 1, 1,
0.1874443, -1.403226, 2.796166, 0, 0.5372549, 1, 1,
0.1879682, -0.9523799, 1.671357, 0, 0.5333334, 1, 1,
0.1904559, -0.09298574, 1.288846, 0, 0.5254902, 1, 1,
0.199038, -0.5253048, 3.243414, 0, 0.5215687, 1, 1,
0.2018585, 1.137618, 0.4244917, 0, 0.5137255, 1, 1,
0.2028139, 0.1407133, 1.117579, 0, 0.509804, 1, 1,
0.209754, -0.01078275, 3.775809, 0, 0.5019608, 1, 1,
0.2130798, -1.276432, 2.022258, 0, 0.4941176, 1, 1,
0.2152703, 0.04975249, 3.497605, 0, 0.4901961, 1, 1,
0.2165232, 1.557603, 1.71729, 0, 0.4823529, 1, 1,
0.2178188, 0.3198504, 0.01329701, 0, 0.4784314, 1, 1,
0.2197371, -0.320172, 1.409664, 0, 0.4705882, 1, 1,
0.2239008, -0.3947775, 3.203459, 0, 0.4666667, 1, 1,
0.2290365, -0.6830301, 4.225958, 0, 0.4588235, 1, 1,
0.2319278, 0.7940184, 1.113523, 0, 0.454902, 1, 1,
0.2347634, -1.027583, 2.282337, 0, 0.4470588, 1, 1,
0.2386459, -0.3585245, 3.453453, 0, 0.4431373, 1, 1,
0.2424717, 0.2478596, 0.6881877, 0, 0.4352941, 1, 1,
0.244742, 1.004765, -1.400933, 0, 0.4313726, 1, 1,
0.2475737, -0.1552013, 1.377034, 0, 0.4235294, 1, 1,
0.2498854, 0.9843244, -0.2458557, 0, 0.4196078, 1, 1,
0.2510428, -2.297094, 4.039576, 0, 0.4117647, 1, 1,
0.2524132, 0.5855696, 1.09079, 0, 0.4078431, 1, 1,
0.255991, -1.604713, 2.562154, 0, 0.4, 1, 1,
0.262154, -0.3279265, 2.327247, 0, 0.3921569, 1, 1,
0.2640893, 2.037137, 0.1853311, 0, 0.3882353, 1, 1,
0.2674564, 0.9461885, 0.06831864, 0, 0.3803922, 1, 1,
0.2681393, 1.875392, 0.2358442, 0, 0.3764706, 1, 1,
0.271771, -2.655833, 2.419361, 0, 0.3686275, 1, 1,
0.2743891, -0.5150731, 3.153494, 0, 0.3647059, 1, 1,
0.2786393, -0.4014908, 3.335072, 0, 0.3568628, 1, 1,
0.2804546, -0.9196342, 1.519051, 0, 0.3529412, 1, 1,
0.2848263, 0.3291141, 0.4108939, 0, 0.345098, 1, 1,
0.2859536, -0.3142105, 2.232694, 0, 0.3411765, 1, 1,
0.2863788, 1.270366, 2.288185, 0, 0.3333333, 1, 1,
0.2901073, 0.2154625, 1.637143, 0, 0.3294118, 1, 1,
0.2916473, -0.3499406, 1.294505, 0, 0.3215686, 1, 1,
0.2924233, -1.543352, 3.826183, 0, 0.3176471, 1, 1,
0.2946923, -0.2865271, 3.379472, 0, 0.3098039, 1, 1,
0.2988412, 0.9592128, 0.3882421, 0, 0.3058824, 1, 1,
0.3026193, -0.9347643, 1.797063, 0, 0.2980392, 1, 1,
0.3033466, 1.777615, -0.1657846, 0, 0.2901961, 1, 1,
0.3037754, -0.475708, 3.370972, 0, 0.2862745, 1, 1,
0.3077201, 1.302421, 0.8101597, 0, 0.2784314, 1, 1,
0.3088287, -0.1752146, 2.407645, 0, 0.2745098, 1, 1,
0.3100117, 0.2793989, 2.723826, 0, 0.2666667, 1, 1,
0.3154287, -0.1896544, 3.152796, 0, 0.2627451, 1, 1,
0.3175329, 0.2525496, 0.2460132, 0, 0.254902, 1, 1,
0.3189163, 0.7482349, 0.7507657, 0, 0.2509804, 1, 1,
0.3210545, 0.03022808, 0.9982756, 0, 0.2431373, 1, 1,
0.3212455, 1.072683, 0.03789603, 0, 0.2392157, 1, 1,
0.3235184, 0.6158718, 0.5545228, 0, 0.2313726, 1, 1,
0.3250284, 0.6720984, 2.505848, 0, 0.227451, 1, 1,
0.3265471, -0.1420886, 2.490164, 0, 0.2196078, 1, 1,
0.3296093, 0.2914635, 1.021079, 0, 0.2156863, 1, 1,
0.3303069, 1.34048, 0.4965779, 0, 0.2078431, 1, 1,
0.3386136, 0.8153465, -0.2151738, 0, 0.2039216, 1, 1,
0.338634, -0.3023308, 0.9100568, 0, 0.1960784, 1, 1,
0.3392479, -0.503154, 2.469639, 0, 0.1882353, 1, 1,
0.3398544, -0.1050166, 2.313344, 0, 0.1843137, 1, 1,
0.3413345, -0.614023, 4.082091, 0, 0.1764706, 1, 1,
0.3451767, -0.2471824, 1.942746, 0, 0.172549, 1, 1,
0.3498048, 0.0352163, 1.631839, 0, 0.1647059, 1, 1,
0.3553568, -0.2295429, 1.405661, 0, 0.1607843, 1, 1,
0.3569074, -0.2479612, 0.956903, 0, 0.1529412, 1, 1,
0.358369, -1.120703, 0.03785575, 0, 0.1490196, 1, 1,
0.3636761, -0.2227062, 3.162165, 0, 0.1411765, 1, 1,
0.36767, 1.875544, 0.4301523, 0, 0.1372549, 1, 1,
0.3687997, -0.5702669, 3.51237, 0, 0.1294118, 1, 1,
0.3704303, -0.09572295, 1.381725, 0, 0.1254902, 1, 1,
0.3704373, -2.383967, 4.026994, 0, 0.1176471, 1, 1,
0.3715667, -0.6799224, 2.717343, 0, 0.1137255, 1, 1,
0.3720701, 0.0477858, 1.882391, 0, 0.1058824, 1, 1,
0.3806959, 2.034655, -1.104468, 0, 0.09803922, 1, 1,
0.3836477, 0.9212784, -0.09875829, 0, 0.09411765, 1, 1,
0.3868457, 0.7372904, -0.0345282, 0, 0.08627451, 1, 1,
0.3871161, -0.4686873, 3.497233, 0, 0.08235294, 1, 1,
0.3880555, -1.081043, 3.258723, 0, 0.07450981, 1, 1,
0.3896032, -0.7395877, 1.661708, 0, 0.07058824, 1, 1,
0.3900729, -0.2729551, 1.833241, 0, 0.0627451, 1, 1,
0.3915919, -0.9674641, 2.708504, 0, 0.05882353, 1, 1,
0.3916159, 0.3663045, -0.05827971, 0, 0.05098039, 1, 1,
0.3952679, 0.5149966, 0.04693482, 0, 0.04705882, 1, 1,
0.3968331, 0.5245434, 1.172119, 0, 0.03921569, 1, 1,
0.4029486, 1.389379, 1.084875, 0, 0.03529412, 1, 1,
0.4058108, 1.500662, -0.5036791, 0, 0.02745098, 1, 1,
0.4099907, -2.122588, 2.197395, 0, 0.02352941, 1, 1,
0.4101216, 0.6644866, 1.30849, 0, 0.01568628, 1, 1,
0.4109102, 0.0961133, 2.345027, 0, 0.01176471, 1, 1,
0.4162632, -2.487597, 2.332645, 0, 0.003921569, 1, 1,
0.4163166, -0.8885908, 1.70536, 0.003921569, 0, 1, 1,
0.4163619, -0.2249296, 3.305679, 0.007843138, 0, 1, 1,
0.4166596, 1.123124, -1.275283, 0.01568628, 0, 1, 1,
0.4180725, -0.06834675, 2.065576, 0.01960784, 0, 1, 1,
0.4205661, -1.661411, 2.222852, 0.02745098, 0, 1, 1,
0.4206248, -1.823259, 2.461414, 0.03137255, 0, 1, 1,
0.4289764, 1.474875, -1.417102, 0.03921569, 0, 1, 1,
0.4299842, -0.5983848, 1.498685, 0.04313726, 0, 1, 1,
0.4358254, 0.1491284, 0.9249102, 0.05098039, 0, 1, 1,
0.4427732, -0.1659349, 2.397291, 0.05490196, 0, 1, 1,
0.4446035, 0.5888298, 2.697622, 0.0627451, 0, 1, 1,
0.4468313, -1.499724, 3.504821, 0.06666667, 0, 1, 1,
0.4475896, -1.531847, 2.914589, 0.07450981, 0, 1, 1,
0.4496879, 0.7242889, 0.3861914, 0.07843138, 0, 1, 1,
0.454064, -0.4661243, 3.326456, 0.08627451, 0, 1, 1,
0.4584253, -0.3858597, 2.225623, 0.09019608, 0, 1, 1,
0.4629487, 0.3152599, 1.461493, 0.09803922, 0, 1, 1,
0.4656831, -0.7495005, 0.3077219, 0.1058824, 0, 1, 1,
0.4672313, -1.84704, 2.210526, 0.1098039, 0, 1, 1,
0.4676469, -0.6311544, 1.747275, 0.1176471, 0, 1, 1,
0.4695455, 0.1048148, 1.769848, 0.1215686, 0, 1, 1,
0.4696125, 0.2363578, 1.166238, 0.1294118, 0, 1, 1,
0.4709583, 0.4814059, -0.8831924, 0.1333333, 0, 1, 1,
0.4736098, 0.01267206, 1.981432, 0.1411765, 0, 1, 1,
0.4737516, -0.1476597, 2.030447, 0.145098, 0, 1, 1,
0.4757216, -0.4012239, 2.203131, 0.1529412, 0, 1, 1,
0.4788582, 0.9287434, 1.316162, 0.1568628, 0, 1, 1,
0.4830601, -1.117479, 2.148834, 0.1647059, 0, 1, 1,
0.4859557, 1.023424, 0.8084717, 0.1686275, 0, 1, 1,
0.4866277, 0.22161, 0.4643942, 0.1764706, 0, 1, 1,
0.4911886, 2.403802, 0.8502378, 0.1803922, 0, 1, 1,
0.4940472, 0.8159292, 0.7670096, 0.1882353, 0, 1, 1,
0.4985752, 0.2865999, -0.2968484, 0.1921569, 0, 1, 1,
0.499832, 1.238499, 1.563865, 0.2, 0, 1, 1,
0.5016381, 0.2845584, 0.9025985, 0.2078431, 0, 1, 1,
0.5096237, -0.01332363, 0.299373, 0.2117647, 0, 1, 1,
0.5146599, -0.02021652, 1.442039, 0.2196078, 0, 1, 1,
0.5170188, 0.5415249, 0.1591036, 0.2235294, 0, 1, 1,
0.520515, -1.521113, 2.765229, 0.2313726, 0, 1, 1,
0.5257483, 1.1843, -0.6910107, 0.2352941, 0, 1, 1,
0.5260866, 0.3195134, 0.0914062, 0.2431373, 0, 1, 1,
0.5289479, 0.5530295, 0.746141, 0.2470588, 0, 1, 1,
0.530493, 0.7005935, 0.1590544, 0.254902, 0, 1, 1,
0.5364797, -0.8785586, 3.916004, 0.2588235, 0, 1, 1,
0.5380364, -1.91468, 2.793637, 0.2666667, 0, 1, 1,
0.5388744, 0.5089835, 0.8315477, 0.2705882, 0, 1, 1,
0.5423936, -0.151715, 2.688071, 0.2784314, 0, 1, 1,
0.5449416, -1.177324, 2.032077, 0.282353, 0, 1, 1,
0.5456977, -1.747874, 2.894143, 0.2901961, 0, 1, 1,
0.5509181, -1.298019, 3.489492, 0.2941177, 0, 1, 1,
0.5525959, -0.10248, 0.9231167, 0.3019608, 0, 1, 1,
0.5583407, 0.3519923, -0.4965029, 0.3098039, 0, 1, 1,
0.5600758, -0.3005927, 1.840733, 0.3137255, 0, 1, 1,
0.5617675, 1.700132, -0.8111088, 0.3215686, 0, 1, 1,
0.5631502, 0.707322, 0.6949269, 0.3254902, 0, 1, 1,
0.5647039, -0.8599708, 1.54787, 0.3333333, 0, 1, 1,
0.5693458, 1.324587, 0.24548, 0.3372549, 0, 1, 1,
0.5703299, 1.169972, 1.562289, 0.345098, 0, 1, 1,
0.5728362, -0.6507154, 1.193477, 0.3490196, 0, 1, 1,
0.5729175, 1.378519, 2.262241, 0.3568628, 0, 1, 1,
0.5777006, -0.2432554, 1.107669, 0.3607843, 0, 1, 1,
0.5823711, -1.73583, 3.061573, 0.3686275, 0, 1, 1,
0.5865377, 0.1670159, 0.7775601, 0.372549, 0, 1, 1,
0.5960217, 0.6297347, 0.9049537, 0.3803922, 0, 1, 1,
0.6005391, -1.07098, 2.409787, 0.3843137, 0, 1, 1,
0.6050575, 0.9994727, -1.099381, 0.3921569, 0, 1, 1,
0.6055384, -0.9708756, 3.556536, 0.3960784, 0, 1, 1,
0.6081324, 2.553041, -0.3936015, 0.4039216, 0, 1, 1,
0.6081765, 1.512351, 0.7037551, 0.4117647, 0, 1, 1,
0.61406, -0.9270817, 1.731041, 0.4156863, 0, 1, 1,
0.6175614, -0.8263174, 2.44547, 0.4235294, 0, 1, 1,
0.6220441, -0.08396057, 1.924611, 0.427451, 0, 1, 1,
0.6247112, 0.5453537, 1.267622, 0.4352941, 0, 1, 1,
0.6282293, -0.81241, 1.771729, 0.4392157, 0, 1, 1,
0.6315439, 0.3590823, 0.6037139, 0.4470588, 0, 1, 1,
0.632921, 0.4682533, 1.921292, 0.4509804, 0, 1, 1,
0.6333637, -1.142315, 1.908008, 0.4588235, 0, 1, 1,
0.6346081, 0.5290228, 0.5108613, 0.4627451, 0, 1, 1,
0.635617, -0.7284731, 1.649273, 0.4705882, 0, 1, 1,
0.6387897, -1.291859, 1.935734, 0.4745098, 0, 1, 1,
0.6425349, -1.624374, 1.856879, 0.4823529, 0, 1, 1,
0.6445418, -1.574651, 3.084876, 0.4862745, 0, 1, 1,
0.6493461, 1.019777, -0.2220427, 0.4941176, 0, 1, 1,
0.6544169, 0.1471722, -0.4917685, 0.5019608, 0, 1, 1,
0.6590241, -0.582746, 1.891602, 0.5058824, 0, 1, 1,
0.6595303, 1.215007, 1.074611, 0.5137255, 0, 1, 1,
0.6602867, -0.2815247, 0.2677507, 0.5176471, 0, 1, 1,
0.6603011, -0.6335637, 2.673896, 0.5254902, 0, 1, 1,
0.6665958, -0.5083371, 2.542064, 0.5294118, 0, 1, 1,
0.6667077, 0.604469, 0.3160404, 0.5372549, 0, 1, 1,
0.6687528, -0.9348263, 3.244949, 0.5411765, 0, 1, 1,
0.6827539, 0.3865698, 0.7833452, 0.5490196, 0, 1, 1,
0.6836446, -2.017291, 4.097583, 0.5529412, 0, 1, 1,
0.6843687, 0.4617091, 0.5004119, 0.5607843, 0, 1, 1,
0.6864501, 2.049305, 2.720914, 0.5647059, 0, 1, 1,
0.6870819, -1.336815, 3.225244, 0.572549, 0, 1, 1,
0.687644, -0.9679652, 2.141636, 0.5764706, 0, 1, 1,
0.6915257, 0.007962056, 2.279876, 0.5843138, 0, 1, 1,
0.6992269, 1.286957, -1.311303, 0.5882353, 0, 1, 1,
0.7009638, 0.2561383, 1.715821, 0.5960785, 0, 1, 1,
0.7030343, -0.6813954, 3.332829, 0.6039216, 0, 1, 1,
0.703667, 0.3755872, 2.509478, 0.6078432, 0, 1, 1,
0.7072299, 0.2685122, 2.322559, 0.6156863, 0, 1, 1,
0.7077804, 0.7667344, 1.019743, 0.6196079, 0, 1, 1,
0.7083935, -0.1119564, 1.082906, 0.627451, 0, 1, 1,
0.7090898, -1.118099, 2.791573, 0.6313726, 0, 1, 1,
0.7093111, 0.3721106, 0.3493886, 0.6392157, 0, 1, 1,
0.7179753, -1.258563, 3.826365, 0.6431373, 0, 1, 1,
0.7269636, 0.3296909, 1.218493, 0.6509804, 0, 1, 1,
0.7328699, 1.355703, 2.296261, 0.654902, 0, 1, 1,
0.7401801, -0.4787783, 1.272536, 0.6627451, 0, 1, 1,
0.7433077, 0.8662419, -0.3731664, 0.6666667, 0, 1, 1,
0.7486251, 2.518789, 0.8497722, 0.6745098, 0, 1, 1,
0.7501429, 0.06122986, 0.7197443, 0.6784314, 0, 1, 1,
0.7518862, -0.7744178, 1.233569, 0.6862745, 0, 1, 1,
0.7556256, 2.341001, 2.036409, 0.6901961, 0, 1, 1,
0.7680335, 1.898653, 0.6565321, 0.6980392, 0, 1, 1,
0.7722705, 0.4933662, 1.308652, 0.7058824, 0, 1, 1,
0.7760191, 0.1862301, -2.027631, 0.7098039, 0, 1, 1,
0.7769518, -0.1747435, 1.322423, 0.7176471, 0, 1, 1,
0.7873546, -0.08340478, 1.836819, 0.7215686, 0, 1, 1,
0.790402, 1.57319, 2.699553, 0.7294118, 0, 1, 1,
0.7927703, 0.5614034, 0.8522232, 0.7333333, 0, 1, 1,
0.7950369, 0.8380851, -1.040933, 0.7411765, 0, 1, 1,
0.797593, -1.563324, 1.59834, 0.7450981, 0, 1, 1,
0.8002831, -0.8497781, 1.005059, 0.7529412, 0, 1, 1,
0.8039578, -0.4227423, 1.572968, 0.7568628, 0, 1, 1,
0.8041462, 0.2624487, 1.163536, 0.7647059, 0, 1, 1,
0.8169007, -0.8411443, 2.473253, 0.7686275, 0, 1, 1,
0.8223377, -0.598483, 1.647573, 0.7764706, 0, 1, 1,
0.8229113, 0.7197587, 0.5379218, 0.7803922, 0, 1, 1,
0.8261192, 1.135662, 1.444528, 0.7882353, 0, 1, 1,
0.8313195, 0.0221862, 1.508559, 0.7921569, 0, 1, 1,
0.8328767, 0.3681155, 0.8636163, 0.8, 0, 1, 1,
0.838107, -0.3880628, 2.410638, 0.8078431, 0, 1, 1,
0.8397247, -0.7114141, 0.1775969, 0.8117647, 0, 1, 1,
0.8423795, 1.330917, -0.1558439, 0.8196079, 0, 1, 1,
0.8476459, -0.4291622, -0.0735644, 0.8235294, 0, 1, 1,
0.8510496, 1.045382, 0.6865534, 0.8313726, 0, 1, 1,
0.8586857, 0.1516103, 1.345415, 0.8352941, 0, 1, 1,
0.8625083, -0.9602375, 1.486563, 0.8431373, 0, 1, 1,
0.8668575, 1.34738, 1.999388, 0.8470588, 0, 1, 1,
0.8688237, 0.1699799, 1.390634, 0.854902, 0, 1, 1,
0.8751013, 1.264096, 0.8773074, 0.8588235, 0, 1, 1,
0.8752996, 0.8990204, 1.29508, 0.8666667, 0, 1, 1,
0.8790806, -1.116062, 4.169482, 0.8705882, 0, 1, 1,
0.8797511, 1.513522, 0.8942822, 0.8784314, 0, 1, 1,
0.8818925, 0.1500151, 0.6738027, 0.8823529, 0, 1, 1,
0.89219, 0.5373212, 0.06565951, 0.8901961, 0, 1, 1,
0.8953241, -0.6763628, 1.707509, 0.8941177, 0, 1, 1,
0.8989254, 0.7574769, 1.491609, 0.9019608, 0, 1, 1,
0.8994861, -0.2692998, 2.377664, 0.9098039, 0, 1, 1,
0.9058526, -0.1101376, 1.453258, 0.9137255, 0, 1, 1,
0.9073246, -0.2281297, 1.566923, 0.9215686, 0, 1, 1,
0.9111373, -0.9283843, 1.702154, 0.9254902, 0, 1, 1,
0.9205351, 1.470708, 1.171989, 0.9333333, 0, 1, 1,
0.9222878, 0.909175, 0.69318, 0.9372549, 0, 1, 1,
0.9235622, -0.1519735, 2.481327, 0.945098, 0, 1, 1,
0.9235728, 0.7813782, -1.715346, 0.9490196, 0, 1, 1,
0.9254592, 0.6402997, -0.4674046, 0.9568627, 0, 1, 1,
0.9267463, 0.8622528, 0.1980672, 0.9607843, 0, 1, 1,
0.9295859, -1.821753, 2.824526, 0.9686275, 0, 1, 1,
0.9303155, -1.037979, 3.061516, 0.972549, 0, 1, 1,
0.9440274, -0.04146522, 1.590097, 0.9803922, 0, 1, 1,
0.944726, -0.2086529, 0.1868152, 0.9843137, 0, 1, 1,
0.9453747, 0.01740049, 0.4535475, 0.9921569, 0, 1, 1,
0.9461806, -0.8771791, 2.47591, 0.9960784, 0, 1, 1,
0.9517646, -0.7207111, 3.37028, 1, 0, 0.9960784, 1,
0.9523114, 0.4287128, 0.8037119, 1, 0, 0.9882353, 1,
0.9527029, -0.5393959, 2.47126, 1, 0, 0.9843137, 1,
0.961829, -0.7230023, 2.753719, 1, 0, 0.9764706, 1,
0.9619279, -0.2508651, 1.652132, 1, 0, 0.972549, 1,
0.963272, 0.3674245, 1.436578, 1, 0, 0.9647059, 1,
0.9671963, 0.3308622, 1.17833, 1, 0, 0.9607843, 1,
0.9686353, 0.2590429, 1.351638, 1, 0, 0.9529412, 1,
0.971025, -0.5577902, 1.78554, 1, 0, 0.9490196, 1,
0.9753679, -0.222437, 0.2344687, 1, 0, 0.9411765, 1,
0.9789826, 0.4778174, -0.7571632, 1, 0, 0.9372549, 1,
0.9810007, -1.048325, 3.354582, 1, 0, 0.9294118, 1,
0.9848857, -1.201705, 2.543574, 1, 0, 0.9254902, 1,
0.9893043, -0.07501221, 0.574412, 1, 0, 0.9176471, 1,
0.9927389, 0.9396765, 1.703808, 1, 0, 0.9137255, 1,
0.9945946, -1.467944, 1.32524, 1, 0, 0.9058824, 1,
0.9967121, -0.6340998, 2.210187, 1, 0, 0.9019608, 1,
0.997245, -0.5188562, 0.7821823, 1, 0, 0.8941177, 1,
1.00888, 0.8948168, 1.089051, 1, 0, 0.8862745, 1,
1.010466, 0.2940752, 0.6869141, 1, 0, 0.8823529, 1,
1.011317, 0.6589767, 4.07586, 1, 0, 0.8745098, 1,
1.030455, -1.753459, 2.544297, 1, 0, 0.8705882, 1,
1.034819, -0.6073995, 1.44601, 1, 0, 0.8627451, 1,
1.039082, 0.1264982, 2.651826, 1, 0, 0.8588235, 1,
1.057107, 1.323899, -0.4354002, 1, 0, 0.8509804, 1,
1.062805, 0.6478852, -0.4938307, 1, 0, 0.8470588, 1,
1.069275, -0.183089, 2.80952, 1, 0, 0.8392157, 1,
1.076534, -0.4165914, 2.009641, 1, 0, 0.8352941, 1,
1.078015, 0.1786035, 2.06706, 1, 0, 0.827451, 1,
1.083312, -0.5098303, 3.004413, 1, 0, 0.8235294, 1,
1.08478, -1.968265, 3.678338, 1, 0, 0.8156863, 1,
1.090506, 0.08521511, 2.558232, 1, 0, 0.8117647, 1,
1.096347, 0.8100098, -0.8220653, 1, 0, 0.8039216, 1,
1.097452, -0.2607295, 2.645812, 1, 0, 0.7960784, 1,
1.107725, -0.5126796, 3.384273, 1, 0, 0.7921569, 1,
1.111588, 0.194864, 3.75056, 1, 0, 0.7843137, 1,
1.118834, 0.2202481, 1.901589, 1, 0, 0.7803922, 1,
1.119098, 1.199069, -1.340795, 1, 0, 0.772549, 1,
1.120021, -0.2599798, 2.91256, 1, 0, 0.7686275, 1,
1.12211, 0.666406, 0.1289494, 1, 0, 0.7607843, 1,
1.126566, -2.004254, 3.136904, 1, 0, 0.7568628, 1,
1.128542, 0.1349798, -1.158982, 1, 0, 0.7490196, 1,
1.132132, -2.131994, 1.949528, 1, 0, 0.7450981, 1,
1.132498, -1.169006, 2.869211, 1, 0, 0.7372549, 1,
1.13321, 0.4269983, 0.7534214, 1, 0, 0.7333333, 1,
1.145626, -1.147347, 1.068334, 1, 0, 0.7254902, 1,
1.158516, -0.2972909, 2.105433, 1, 0, 0.7215686, 1,
1.165558, -0.5839736, 1.965741, 1, 0, 0.7137255, 1,
1.165619, -0.4390786, 1.384556, 1, 0, 0.7098039, 1,
1.172238, -0.09903959, 1.544491, 1, 0, 0.7019608, 1,
1.17267, -0.3332742, 2.681913, 1, 0, 0.6941177, 1,
1.175241, -1.526971, 3.123245, 1, 0, 0.6901961, 1,
1.18123, -0.1477269, 2.726999, 1, 0, 0.682353, 1,
1.181533, 0.06834418, 2.207776, 1, 0, 0.6784314, 1,
1.185224, -0.2370971, 1.968224, 1, 0, 0.6705883, 1,
1.192176, 0.5266554, 0.7227544, 1, 0, 0.6666667, 1,
1.195473, 0.3706286, -0.287062, 1, 0, 0.6588235, 1,
1.20525, 0.1716153, 3.25606, 1, 0, 0.654902, 1,
1.205662, 0.01107487, 1.702929, 1, 0, 0.6470588, 1,
1.206419, 0.2396045, 1.785841, 1, 0, 0.6431373, 1,
1.208788, 1.363053, 1.635861, 1, 0, 0.6352941, 1,
1.215227, 0.4917959, 0.6009306, 1, 0, 0.6313726, 1,
1.219124, 1.022879, 0.4075973, 1, 0, 0.6235294, 1,
1.265306, 1.442374, 1.164122, 1, 0, 0.6196079, 1,
1.273347, -0.2361243, 0.3990004, 1, 0, 0.6117647, 1,
1.281667, 0.06826333, 3.039127, 1, 0, 0.6078432, 1,
1.281946, -0.4610353, 0.7395763, 1, 0, 0.6, 1,
1.292809, -0.2138691, 1.265998, 1, 0, 0.5921569, 1,
1.298873, 0.7439811, 0.5525293, 1, 0, 0.5882353, 1,
1.301841, 0.797073, 2.273091, 1, 0, 0.5803922, 1,
1.306437, -1.440992, 2.708634, 1, 0, 0.5764706, 1,
1.308248, -0.3615316, 0.7081711, 1, 0, 0.5686275, 1,
1.308603, -1.612661, 2.344663, 1, 0, 0.5647059, 1,
1.335687, 0.2577324, 0.03675165, 1, 0, 0.5568628, 1,
1.336287, -1.020403, 2.847572, 1, 0, 0.5529412, 1,
1.340805, 1.267656, 1.660866, 1, 0, 0.5450981, 1,
1.342675, 0.6798364, -0.6572984, 1, 0, 0.5411765, 1,
1.35005, 0.2779588, 1.434027, 1, 0, 0.5333334, 1,
1.374086, -0.1952993, 3.149885, 1, 0, 0.5294118, 1,
1.379717, -1.482775, 3.197755, 1, 0, 0.5215687, 1,
1.389262, -0.2969564, 2.488699, 1, 0, 0.5176471, 1,
1.389798, 1.60167, -0.02988698, 1, 0, 0.509804, 1,
1.395801, 0.3433296, 2.57958, 1, 0, 0.5058824, 1,
1.396918, 0.08454883, 0.5082977, 1, 0, 0.4980392, 1,
1.400021, -1.396574, 3.32124, 1, 0, 0.4901961, 1,
1.404319, -0.009673516, 2.787242, 1, 0, 0.4862745, 1,
1.419188, 1.260143, 0.2294502, 1, 0, 0.4784314, 1,
1.426334, 1.809581, -0.5305732, 1, 0, 0.4745098, 1,
1.43658, 0.9675804, -0.5659456, 1, 0, 0.4666667, 1,
1.440446, 0.2619778, 1.143435, 1, 0, 0.4627451, 1,
1.443339, 1.399133, 0.880213, 1, 0, 0.454902, 1,
1.444117, -1.10561, 3.010568, 1, 0, 0.4509804, 1,
1.462731, -0.3924293, 0.9842495, 1, 0, 0.4431373, 1,
1.464272, -2.122016, 3.040689, 1, 0, 0.4392157, 1,
1.471447, 0.3066937, 1.037902, 1, 0, 0.4313726, 1,
1.481789, -1.056736, 3.206906, 1, 0, 0.427451, 1,
1.4875, 2.498649, 1.212091, 1, 0, 0.4196078, 1,
1.5021, 0.3056214, 1.978962, 1, 0, 0.4156863, 1,
1.506132, -2.271131, 2.840953, 1, 0, 0.4078431, 1,
1.507952, 0.6834332, 0.4315811, 1, 0, 0.4039216, 1,
1.508316, -0.1030821, 1.040959, 1, 0, 0.3960784, 1,
1.518799, -0.08456548, 1.108632, 1, 0, 0.3882353, 1,
1.531633, 0.3525793, 0.8452156, 1, 0, 0.3843137, 1,
1.541998, 0.4595336, 2.584834, 1, 0, 0.3764706, 1,
1.542941, 1.476683, 0.260022, 1, 0, 0.372549, 1,
1.547188, -1.274648, 0.8816658, 1, 0, 0.3647059, 1,
1.553267, -0.8128787, 1.968733, 1, 0, 0.3607843, 1,
1.590111, -0.1844783, 0.1174619, 1, 0, 0.3529412, 1,
1.599507, -0.7383446, 2.629658, 1, 0, 0.3490196, 1,
1.609757, 0.8236336, 2.633695, 1, 0, 0.3411765, 1,
1.619966, 0.01266218, 0.07933891, 1, 0, 0.3372549, 1,
1.622143, -1.064697, 2.052315, 1, 0, 0.3294118, 1,
1.622392, 1.170503, -0.1061242, 1, 0, 0.3254902, 1,
1.628018, 0.0426251, 1.334035, 1, 0, 0.3176471, 1,
1.645222, -0.6020529, 3.04618, 1, 0, 0.3137255, 1,
1.65411, 0.4660341, 1.965688, 1, 0, 0.3058824, 1,
1.663624, -0.2092839, -0.3141055, 1, 0, 0.2980392, 1,
1.666477, -0.3448012, 3.867096, 1, 0, 0.2941177, 1,
1.69125, 0.8319286, 0.5059613, 1, 0, 0.2862745, 1,
1.708171, 0.797276, 2.635077, 1, 0, 0.282353, 1,
1.710455, 0.8818514, 3.236283, 1, 0, 0.2745098, 1,
1.710754, 0.6824685, 1.5977, 1, 0, 0.2705882, 1,
1.735693, -0.1796418, 0.04181398, 1, 0, 0.2627451, 1,
1.744072, 0.8848938, -0.09700961, 1, 0, 0.2588235, 1,
1.760327, 0.1881684, 0.8301168, 1, 0, 0.2509804, 1,
1.777425, 1.610797, 0.8769947, 1, 0, 0.2470588, 1,
1.782678, 1.662763, 2.341059, 1, 0, 0.2392157, 1,
1.788402, 0.07956565, 0.5380354, 1, 0, 0.2352941, 1,
1.802436, -1.416973, 3.080349, 1, 0, 0.227451, 1,
1.810331, 1.170028, 1.897483, 1, 0, 0.2235294, 1,
1.834902, -0.8541777, 1.333472, 1, 0, 0.2156863, 1,
1.8454, -0.7302511, 1.944306, 1, 0, 0.2117647, 1,
1.846531, -1.282128, 3.323028, 1, 0, 0.2039216, 1,
1.895171, -1.653385, 2.561628, 1, 0, 0.1960784, 1,
1.898282, -0.3589965, 1.684967, 1, 0, 0.1921569, 1,
1.927023, -0.9958558, -0.2195714, 1, 0, 0.1843137, 1,
1.975636, 0.7870214, 2.300695, 1, 0, 0.1803922, 1,
1.986884, -1.04336, 2.191304, 1, 0, 0.172549, 1,
1.990845, 0.7463655, -1.115325, 1, 0, 0.1686275, 1,
2.012112, -1.548211, 1.260344, 1, 0, 0.1607843, 1,
2.045475, -0.3740893, 0.03835463, 1, 0, 0.1568628, 1,
2.081891, 0.2342607, 1.314249, 1, 0, 0.1490196, 1,
2.100736, 0.1643358, 1.756765, 1, 0, 0.145098, 1,
2.127886, 0.799015, 0.170751, 1, 0, 0.1372549, 1,
2.14676, 0.2736122, 1.744646, 1, 0, 0.1333333, 1,
2.168331, 1.355644, 1.030477, 1, 0, 0.1254902, 1,
2.172125, 0.1435273, 0.7565115, 1, 0, 0.1215686, 1,
2.24912, 0.9701263, 1.509115, 1, 0, 0.1137255, 1,
2.277256, -0.04279142, 1.347069, 1, 0, 0.1098039, 1,
2.290529, 0.5319116, 1.483654, 1, 0, 0.1019608, 1,
2.321713, -0.0844917, 2.351313, 1, 0, 0.09411765, 1,
2.330999, -0.7639733, 2.194574, 1, 0, 0.09019608, 1,
2.332877, -0.8656867, 4.557872, 1, 0, 0.08235294, 1,
2.348705, 0.5387174, 0.8412389, 1, 0, 0.07843138, 1,
2.350831, 0.5516714, 1.669371, 1, 0, 0.07058824, 1,
2.360204, -0.2488009, 0.772068, 1, 0, 0.06666667, 1,
2.382025, -1.296713, 0.2193256, 1, 0, 0.05882353, 1,
2.385996, 1.075695, -0.7397685, 1, 0, 0.05490196, 1,
2.445774, -0.9441735, 1.520376, 1, 0, 0.04705882, 1,
2.505013, 0.1940292, 0.773983, 1, 0, 0.04313726, 1,
2.521586, -0.3238671, 2.305119, 1, 0, 0.03529412, 1,
2.549939, 0.1330789, 2.001151, 1, 0, 0.03137255, 1,
2.751416, -1.170057, 0.7730657, 1, 0, 0.02352941, 1,
2.940291, 0.1570018, 0.6705006, 1, 0, 0.01960784, 1,
2.983405, 1.279416, 1.112322, 1, 0, 0.01176471, 1,
3.105531, 1.491803, -0.5824847, 1, 0, 0.007843138, 1
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
-0.03652716, -3.878272, -7.05158, 0, -0.5, 0.5, 0.5,
-0.03652716, -3.878272, -7.05158, 1, -0.5, 0.5, 0.5,
-0.03652716, -3.878272, -7.05158, 1, 1.5, 0.5, 0.5,
-0.03652716, -3.878272, -7.05158, 0, 1.5, 0.5, 0.5
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
-4.243743, 0.2064557, -7.05158, 0, -0.5, 0.5, 0.5,
-4.243743, 0.2064557, -7.05158, 1, -0.5, 0.5, 0.5,
-4.243743, 0.2064557, -7.05158, 1, 1.5, 0.5, 0.5,
-4.243743, 0.2064557, -7.05158, 0, 1.5, 0.5, 0.5
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
-4.243743, -3.878272, 0.6542525, 0, -0.5, 0.5, 0.5,
-4.243743, -3.878272, 0.6542525, 1, -0.5, 0.5, 0.5,
-4.243743, -3.878272, 0.6542525, 1, 1.5, 0.5, 0.5,
-4.243743, -3.878272, 0.6542525, 0, 1.5, 0.5, 0.5
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
-3, -2.935642, -5.273311,
3, -2.935642, -5.273311,
-3, -2.935642, -5.273311,
-3, -3.092747, -5.569689,
-2, -2.935642, -5.273311,
-2, -3.092747, -5.569689,
-1, -2.935642, -5.273311,
-1, -3.092747, -5.569689,
0, -2.935642, -5.273311,
0, -3.092747, -5.569689,
1, -2.935642, -5.273311,
1, -3.092747, -5.569689,
2, -2.935642, -5.273311,
2, -3.092747, -5.569689,
3, -2.935642, -5.273311,
3, -3.092747, -5.569689
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
-3, -3.406957, -6.162446, 0, -0.5, 0.5, 0.5,
-3, -3.406957, -6.162446, 1, -0.5, 0.5, 0.5,
-3, -3.406957, -6.162446, 1, 1.5, 0.5, 0.5,
-3, -3.406957, -6.162446, 0, 1.5, 0.5, 0.5,
-2, -3.406957, -6.162446, 0, -0.5, 0.5, 0.5,
-2, -3.406957, -6.162446, 1, -0.5, 0.5, 0.5,
-2, -3.406957, -6.162446, 1, 1.5, 0.5, 0.5,
-2, -3.406957, -6.162446, 0, 1.5, 0.5, 0.5,
-1, -3.406957, -6.162446, 0, -0.5, 0.5, 0.5,
-1, -3.406957, -6.162446, 1, -0.5, 0.5, 0.5,
-1, -3.406957, -6.162446, 1, 1.5, 0.5, 0.5,
-1, -3.406957, -6.162446, 0, 1.5, 0.5, 0.5,
0, -3.406957, -6.162446, 0, -0.5, 0.5, 0.5,
0, -3.406957, -6.162446, 1, -0.5, 0.5, 0.5,
0, -3.406957, -6.162446, 1, 1.5, 0.5, 0.5,
0, -3.406957, -6.162446, 0, 1.5, 0.5, 0.5,
1, -3.406957, -6.162446, 0, -0.5, 0.5, 0.5,
1, -3.406957, -6.162446, 1, -0.5, 0.5, 0.5,
1, -3.406957, -6.162446, 1, 1.5, 0.5, 0.5,
1, -3.406957, -6.162446, 0, 1.5, 0.5, 0.5,
2, -3.406957, -6.162446, 0, -0.5, 0.5, 0.5,
2, -3.406957, -6.162446, 1, -0.5, 0.5, 0.5,
2, -3.406957, -6.162446, 1, 1.5, 0.5, 0.5,
2, -3.406957, -6.162446, 0, 1.5, 0.5, 0.5,
3, -3.406957, -6.162446, 0, -0.5, 0.5, 0.5,
3, -3.406957, -6.162446, 1, -0.5, 0.5, 0.5,
3, -3.406957, -6.162446, 1, 1.5, 0.5, 0.5,
3, -3.406957, -6.162446, 0, 1.5, 0.5, 0.5
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
-3.272847, -2, -5.273311,
-3.272847, 3, -5.273311,
-3.272847, -2, -5.273311,
-3.434663, -2, -5.569689,
-3.272847, -1, -5.273311,
-3.434663, -1, -5.569689,
-3.272847, 0, -5.273311,
-3.434663, 0, -5.569689,
-3.272847, 1, -5.273311,
-3.434663, 1, -5.569689,
-3.272847, 2, -5.273311,
-3.434663, 2, -5.569689,
-3.272847, 3, -5.273311,
-3.434663, 3, -5.569689
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
-3.758295, -2, -6.162446, 0, -0.5, 0.5, 0.5,
-3.758295, -2, -6.162446, 1, -0.5, 0.5, 0.5,
-3.758295, -2, -6.162446, 1, 1.5, 0.5, 0.5,
-3.758295, -2, -6.162446, 0, 1.5, 0.5, 0.5,
-3.758295, -1, -6.162446, 0, -0.5, 0.5, 0.5,
-3.758295, -1, -6.162446, 1, -0.5, 0.5, 0.5,
-3.758295, -1, -6.162446, 1, 1.5, 0.5, 0.5,
-3.758295, -1, -6.162446, 0, 1.5, 0.5, 0.5,
-3.758295, 0, -6.162446, 0, -0.5, 0.5, 0.5,
-3.758295, 0, -6.162446, 1, -0.5, 0.5, 0.5,
-3.758295, 0, -6.162446, 1, 1.5, 0.5, 0.5,
-3.758295, 0, -6.162446, 0, 1.5, 0.5, 0.5,
-3.758295, 1, -6.162446, 0, -0.5, 0.5, 0.5,
-3.758295, 1, -6.162446, 1, -0.5, 0.5, 0.5,
-3.758295, 1, -6.162446, 1, 1.5, 0.5, 0.5,
-3.758295, 1, -6.162446, 0, 1.5, 0.5, 0.5,
-3.758295, 2, -6.162446, 0, -0.5, 0.5, 0.5,
-3.758295, 2, -6.162446, 1, -0.5, 0.5, 0.5,
-3.758295, 2, -6.162446, 1, 1.5, 0.5, 0.5,
-3.758295, 2, -6.162446, 0, 1.5, 0.5, 0.5,
-3.758295, 3, -6.162446, 0, -0.5, 0.5, 0.5,
-3.758295, 3, -6.162446, 1, -0.5, 0.5, 0.5,
-3.758295, 3, -6.162446, 1, 1.5, 0.5, 0.5,
-3.758295, 3, -6.162446, 0, 1.5, 0.5, 0.5
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
-3.272847, -2.935642, -4,
-3.272847, -2.935642, 6,
-3.272847, -2.935642, -4,
-3.434663, -3.092747, -4,
-3.272847, -2.935642, -2,
-3.434663, -3.092747, -2,
-3.272847, -2.935642, 0,
-3.434663, -3.092747, 0,
-3.272847, -2.935642, 2,
-3.434663, -3.092747, 2,
-3.272847, -2.935642, 4,
-3.434663, -3.092747, 4,
-3.272847, -2.935642, 6,
-3.434663, -3.092747, 6
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
-3.758295, -3.406957, -4, 0, -0.5, 0.5, 0.5,
-3.758295, -3.406957, -4, 1, -0.5, 0.5, 0.5,
-3.758295, -3.406957, -4, 1, 1.5, 0.5, 0.5,
-3.758295, -3.406957, -4, 0, 1.5, 0.5, 0.5,
-3.758295, -3.406957, -2, 0, -0.5, 0.5, 0.5,
-3.758295, -3.406957, -2, 1, -0.5, 0.5, 0.5,
-3.758295, -3.406957, -2, 1, 1.5, 0.5, 0.5,
-3.758295, -3.406957, -2, 0, 1.5, 0.5, 0.5,
-3.758295, -3.406957, 0, 0, -0.5, 0.5, 0.5,
-3.758295, -3.406957, 0, 1, -0.5, 0.5, 0.5,
-3.758295, -3.406957, 0, 1, 1.5, 0.5, 0.5,
-3.758295, -3.406957, 0, 0, 1.5, 0.5, 0.5,
-3.758295, -3.406957, 2, 0, -0.5, 0.5, 0.5,
-3.758295, -3.406957, 2, 1, -0.5, 0.5, 0.5,
-3.758295, -3.406957, 2, 1, 1.5, 0.5, 0.5,
-3.758295, -3.406957, 2, 0, 1.5, 0.5, 0.5,
-3.758295, -3.406957, 4, 0, -0.5, 0.5, 0.5,
-3.758295, -3.406957, 4, 1, -0.5, 0.5, 0.5,
-3.758295, -3.406957, 4, 1, 1.5, 0.5, 0.5,
-3.758295, -3.406957, 4, 0, 1.5, 0.5, 0.5,
-3.758295, -3.406957, 6, 0, -0.5, 0.5, 0.5,
-3.758295, -3.406957, 6, 1, -0.5, 0.5, 0.5,
-3.758295, -3.406957, 6, 1, 1.5, 0.5, 0.5,
-3.758295, -3.406957, 6, 0, 1.5, 0.5, 0.5
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
-3.272847, -2.935642, -5.273311,
-3.272847, 3.348554, -5.273311,
-3.272847, -2.935642, 6.581816,
-3.272847, 3.348554, 6.581816,
-3.272847, -2.935642, -5.273311,
-3.272847, -2.935642, 6.581816,
-3.272847, 3.348554, -5.273311,
-3.272847, 3.348554, 6.581816,
-3.272847, -2.935642, -5.273311,
3.199793, -2.935642, -5.273311,
-3.272847, -2.935642, 6.581816,
3.199793, -2.935642, 6.581816,
-3.272847, 3.348554, -5.273311,
3.199793, 3.348554, -5.273311,
-3.272847, 3.348554, 6.581816,
3.199793, 3.348554, 6.581816,
3.199793, -2.935642, -5.273311,
3.199793, 3.348554, -5.273311,
3.199793, -2.935642, 6.581816,
3.199793, 3.348554, 6.581816,
3.199793, -2.935642, -5.273311,
3.199793, -2.935642, 6.581816,
3.199793, 3.348554, -5.273311,
3.199793, 3.348554, 6.581816
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
var radius = 7.954881;
var distance = 35.39216;
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
mvMatrix.translate( 0.03652716, -0.2064557, -0.6542525 );
mvMatrix.scale( 1.32882, 1.368667, 0.7255066 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.39216);
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
pyrimidin-4-yl_phosp<-read.table("pyrimidin-4-yl_phosp.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrimidin-4-yl_phosp$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidin' not found
```

```r
y<-pyrimidin-4-yl_phosp$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidin' not found
```

```r
z<-pyrimidin-4-yl_phosp$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidin' not found
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
-3.178585, 1.10558, 0.008838698, 0, 0, 1, 1, 1,
-3.118583, 1.395652, -0.2538121, 1, 0, 0, 1, 1,
-2.708907, 0.7062818, -3.3862, 1, 0, 0, 1, 1,
-2.69159, -0.5572747, -1.918851, 1, 0, 0, 1, 1,
-2.560326, -1.14019, -1.890491, 1, 0, 0, 1, 1,
-2.488581, 0.8541188, -1.691484, 1, 0, 0, 1, 1,
-2.463001, 0.9400536, -1.544344, 0, 0, 0, 1, 1,
-2.358299, -0.6003245, -1.742351, 0, 0, 0, 1, 1,
-2.337171, 1.343245, -1.297988, 0, 0, 0, 1, 1,
-2.298829, 0.1218424, -1.227277, 0, 0, 0, 1, 1,
-2.285864, -1.736064, -3.278289, 0, 0, 0, 1, 1,
-2.254603, -0.007461496, -3.099141, 0, 0, 0, 1, 1,
-2.233299, -2.05176, -3.970686, 0, 0, 0, 1, 1,
-2.16811, -1.017177, -2.447004, 1, 1, 1, 1, 1,
-2.144736, -0.8065074, -1.9912, 1, 1, 1, 1, 1,
-2.113574, -0.8690356, -2.114996, 1, 1, 1, 1, 1,
-2.107457, 0.6716641, -2.751269, 1, 1, 1, 1, 1,
-2.099694, 1.672743, -0.04598791, 1, 1, 1, 1, 1,
-2.094188, 1.021236, -1.207587, 1, 1, 1, 1, 1,
-2.06495, -1.207051, -2.443462, 1, 1, 1, 1, 1,
-2.064382, -0.464671, -2.376693, 1, 1, 1, 1, 1,
-2.044227, -1.534659, -1.548012, 1, 1, 1, 1, 1,
-2.031436, -0.3210099, -5.100664, 1, 1, 1, 1, 1,
-2.025758, 1.016822, -1.35471, 1, 1, 1, 1, 1,
-2.01551, -0.5465652, -2.304406, 1, 1, 1, 1, 1,
-2.001576, -0.3977192, -1.204738, 1, 1, 1, 1, 1,
-1.999325, -0.1149325, -0.4998623, 1, 1, 1, 1, 1,
-1.998548, -0.8561004, -1.546488, 1, 1, 1, 1, 1,
-1.988849, -1.388918, -1.38635, 0, 0, 1, 1, 1,
-1.963162, 0.3237289, -0.1366999, 1, 0, 0, 1, 1,
-1.960446, -0.396771, -0.08876839, 1, 0, 0, 1, 1,
-1.943785, -0.79269, -3.499619, 1, 0, 0, 1, 1,
-1.933273, -0.5615606, -0.1200378, 1, 0, 0, 1, 1,
-1.910027, -0.3329778, -2.479864, 1, 0, 0, 1, 1,
-1.904579, -1.119703, -0.4372582, 0, 0, 0, 1, 1,
-1.893713, -2.196959, -3.090884, 0, 0, 0, 1, 1,
-1.881542, 0.02365596, -2.977112, 0, 0, 0, 1, 1,
-1.859461, 0.5654424, 1.022985, 0, 0, 0, 1, 1,
-1.847418, -1.367628, -2.791504, 0, 0, 0, 1, 1,
-1.847214, -0.4935354, -1.098741, 0, 0, 0, 1, 1,
-1.846615, 0.1914443, -1.236066, 0, 0, 0, 1, 1,
-1.834717, 0.8719597, -0.9878981, 1, 1, 1, 1, 1,
-1.834227, 0.6832909, -1.279724, 1, 1, 1, 1, 1,
-1.833924, 1.018863, -1.420968, 1, 1, 1, 1, 1,
-1.817135, 1.038826, -0.9198071, 1, 1, 1, 1, 1,
-1.80362, 0.04207728, -1.72764, 1, 1, 1, 1, 1,
-1.786185, -0.6528049, -0.8730932, 1, 1, 1, 1, 1,
-1.774679, -1.402854, -1.049312, 1, 1, 1, 1, 1,
-1.771198, 0.01036045, -1.255412, 1, 1, 1, 1, 1,
-1.746712, 0.1224527, -1.712706, 1, 1, 1, 1, 1,
-1.745818, -0.05284698, 0.001806079, 1, 1, 1, 1, 1,
-1.725143, -1.402055, -1.536561, 1, 1, 1, 1, 1,
-1.717612, -2.10818, -0.09268469, 1, 1, 1, 1, 1,
-1.696084, -1.93781, -3.352817, 1, 1, 1, 1, 1,
-1.6924, 0.8971077, -0.2858976, 1, 1, 1, 1, 1,
-1.692013, -1.606981, -1.551243, 1, 1, 1, 1, 1,
-1.683633, 0.4727188, -1.533118, 0, 0, 1, 1, 1,
-1.683009, 1.028001, -0.7071114, 1, 0, 0, 1, 1,
-1.672838, 0.4345856, -0.9442298, 1, 0, 0, 1, 1,
-1.672039, 0.03358766, -0.4475045, 1, 0, 0, 1, 1,
-1.660157, -2.077864, -1.933535, 1, 0, 0, 1, 1,
-1.630915, 0.3858335, -3.103309, 1, 0, 0, 1, 1,
-1.625792, 0.05982172, -1.564173, 0, 0, 0, 1, 1,
-1.605382, 1.119224, -1.444199, 0, 0, 0, 1, 1,
-1.602808, -0.8677588, -2.983109, 0, 0, 0, 1, 1,
-1.602806, -0.4905452, -2.40576, 0, 0, 0, 1, 1,
-1.598154, 1.149646, -1.528655, 0, 0, 0, 1, 1,
-1.594911, 0.6866269, 1.011648, 0, 0, 0, 1, 1,
-1.592519, 0.5483558, -0.4315101, 0, 0, 0, 1, 1,
-1.590875, 0.9593838, -1.47769, 1, 1, 1, 1, 1,
-1.587566, -0.2740653, -2.013151, 1, 1, 1, 1, 1,
-1.580871, -0.6451745, -0.7687475, 1, 1, 1, 1, 1,
-1.572545, -1.152222, -1.467989, 1, 1, 1, 1, 1,
-1.567083, 0.7684341, -0.9274591, 1, 1, 1, 1, 1,
-1.565511, -1.53459, -3.861208, 1, 1, 1, 1, 1,
-1.563643, 1.461459, -2.472234, 1, 1, 1, 1, 1,
-1.553573, 1.491189, -0.2032809, 1, 1, 1, 1, 1,
-1.551161, 1.278105, -0.2855006, 1, 1, 1, 1, 1,
-1.551142, -1.796314, -3.645833, 1, 1, 1, 1, 1,
-1.537509, 0.5636338, -0.05553554, 1, 1, 1, 1, 1,
-1.528203, 2.444061, -1.792922, 1, 1, 1, 1, 1,
-1.526639, 0.6484313, -1.397812, 1, 1, 1, 1, 1,
-1.526088, 0.1081247, -0.4514725, 1, 1, 1, 1, 1,
-1.521989, -0.398263, -2.996505, 1, 1, 1, 1, 1,
-1.517688, -0.03922097, -1.070027, 0, 0, 1, 1, 1,
-1.50809, 0.009652113, -0.9177108, 1, 0, 0, 1, 1,
-1.501333, -0.6018896, -2.287645, 1, 0, 0, 1, 1,
-1.49867, -1.809708, -0.7763677, 1, 0, 0, 1, 1,
-1.498311, 1.748917, -1.396298, 1, 0, 0, 1, 1,
-1.49565, 1.832262, -1.788171, 1, 0, 0, 1, 1,
-1.487886, -0.810526, -1.448248, 0, 0, 0, 1, 1,
-1.476911, -0.624818, -0.6496478, 0, 0, 0, 1, 1,
-1.440832, 1.29272, -0.5433178, 0, 0, 0, 1, 1,
-1.422535, 0.5008258, -1.88863, 0, 0, 0, 1, 1,
-1.419332, -1.7694, -2.986581, 0, 0, 0, 1, 1,
-1.388213, 2.444443, -1.711886, 0, 0, 0, 1, 1,
-1.370701, -0.048136, -1.0402, 0, 0, 0, 1, 1,
-1.350899, -1.387377, -2.865276, 1, 1, 1, 1, 1,
-1.344369, -0.1156952, -2.171552, 1, 1, 1, 1, 1,
-1.323521, -0.05944818, -1.908562, 1, 1, 1, 1, 1,
-1.32276, -0.3663343, -1.904425, 1, 1, 1, 1, 1,
-1.31344, -1.102923, -1.567918, 1, 1, 1, 1, 1,
-1.311081, 0.3456484, -2.225491, 1, 1, 1, 1, 1,
-1.307691, 1.320501, -1.22356, 1, 1, 1, 1, 1,
-1.301538, 0.7810823, -3.177887, 1, 1, 1, 1, 1,
-1.296766, 0.9563051, -3.43062, 1, 1, 1, 1, 1,
-1.294991, -1.039425, -1.807644, 1, 1, 1, 1, 1,
-1.286844, -0.1504882, -3.277363, 1, 1, 1, 1, 1,
-1.284201, 1.867546, 0.3885635, 1, 1, 1, 1, 1,
-1.278785, -1.032975, -3.34566, 1, 1, 1, 1, 1,
-1.263482, 1.098368, -0.1429735, 1, 1, 1, 1, 1,
-1.25701, 2.271127, -0.6133835, 1, 1, 1, 1, 1,
-1.253417, -0.4891288, -1.590032, 0, 0, 1, 1, 1,
-1.248385, -0.7893924, -0.6565821, 1, 0, 0, 1, 1,
-1.246038, 0.5493118, -2.038579, 1, 0, 0, 1, 1,
-1.242899, 0.2994937, 0.5554552, 1, 0, 0, 1, 1,
-1.226225, -0.6373652, -3.012397, 1, 0, 0, 1, 1,
-1.223445, 1.081404, 0.1979408, 1, 0, 0, 1, 1,
-1.221978, 0.1303122, -2.178648, 0, 0, 0, 1, 1,
-1.212323, -0.5796964, -2.343903, 0, 0, 0, 1, 1,
-1.206651, -0.3020219, -3.477895, 0, 0, 0, 1, 1,
-1.205701, 0.2942482, -1.779456, 0, 0, 0, 1, 1,
-1.198951, -0.1547083, -0.4636003, 0, 0, 0, 1, 1,
-1.198913, -0.394706, -2.654649, 0, 0, 0, 1, 1,
-1.195614, 0.1152588, -1.220808, 0, 0, 0, 1, 1,
-1.194666, 0.1653988, -1.54607, 1, 1, 1, 1, 1,
-1.192375, -0.4409626, -2.30203, 1, 1, 1, 1, 1,
-1.186269, 0.21666, -2.174825, 1, 1, 1, 1, 1,
-1.183908, 2.141054, -0.8363044, 1, 1, 1, 1, 1,
-1.181643, -0.01196126, -2.25925, 1, 1, 1, 1, 1,
-1.180575, 0.798161, -0.6187303, 1, 1, 1, 1, 1,
-1.179341, 0.6593505, -0.413086, 1, 1, 1, 1, 1,
-1.178013, -0.292338, -3.502838, 1, 1, 1, 1, 1,
-1.176129, -1.397759, -2.168807, 1, 1, 1, 1, 1,
-1.161815, 0.5918951, -0.3098928, 1, 1, 1, 1, 1,
-1.141664, -0.7879074, -3.255518, 1, 1, 1, 1, 1,
-1.126826, -0.9788821, -1.649684, 1, 1, 1, 1, 1,
-1.12522, 0.6412451, -1.034107, 1, 1, 1, 1, 1,
-1.123375, -0.652919, -3.194474, 1, 1, 1, 1, 1,
-1.119391, -0.07901443, -1.422545, 1, 1, 1, 1, 1,
-1.113211, -1.388448, -0.3212662, 0, 0, 1, 1, 1,
-1.10993, -0.941469, -2.051857, 1, 0, 0, 1, 1,
-1.102165, -0.0829325, -0.5223933, 1, 0, 0, 1, 1,
-1.101829, 1.348105, 1.118847, 1, 0, 0, 1, 1,
-1.081112, 0.007883887, -1.519394, 1, 0, 0, 1, 1,
-1.078319, 0.4397412, 0.2135865, 1, 0, 0, 1, 1,
-1.076517, 0.9622223, -1.35877, 0, 0, 0, 1, 1,
-1.072109, -1.902323, -3.233662, 0, 0, 0, 1, 1,
-1.071686, 0.1456933, -1.076422, 0, 0, 0, 1, 1,
-1.065462, 0.1272469, -0.1912809, 0, 0, 0, 1, 1,
-1.065422, -0.8563119, -1.904114, 0, 0, 0, 1, 1,
-1.055194, -0.464319, -3.212816, 0, 0, 0, 1, 1,
-1.052033, -0.6772546, -3.66318, 0, 0, 0, 1, 1,
-1.051242, 0.08144636, -3.020591, 1, 1, 1, 1, 1,
-1.050978, 0.5243377, -0.3390615, 1, 1, 1, 1, 1,
-1.048078, 1.172311, -0.8702852, 1, 1, 1, 1, 1,
-1.0473, -0.3779106, -0.6168064, 1, 1, 1, 1, 1,
-1.041636, 0.8079975, -1.226093, 1, 1, 1, 1, 1,
-1.027614, 0.6663084, 1.377556, 1, 1, 1, 1, 1,
-1.02196, 0.589008, -1.016881, 1, 1, 1, 1, 1,
-1.019319, -0.08496182, -2.006848, 1, 1, 1, 1, 1,
-1.013148, -0.8653801, -3.763046, 1, 1, 1, 1, 1,
-1.011224, 1.347928, -1.893895, 1, 1, 1, 1, 1,
-1.007864, -0.7164931, -2.468957, 1, 1, 1, 1, 1,
-1.005959, -0.02281401, -2.697352, 1, 1, 1, 1, 1,
-1.000285, -0.1205071, -0.9690981, 1, 1, 1, 1, 1,
-0.991838, -0.6211081, -0.9802719, 1, 1, 1, 1, 1,
-0.9909143, -1.553708, -1.268418, 1, 1, 1, 1, 1,
-0.9888211, 0.1890934, -0.6368644, 0, 0, 1, 1, 1,
-0.9875895, -0.3523687, -1.520414, 1, 0, 0, 1, 1,
-0.9870518, -0.9410998, -1.997881, 1, 0, 0, 1, 1,
-0.9853999, 0.8077414, -2.597472, 1, 0, 0, 1, 1,
-0.9671764, 0.1765014, -0.2804734, 1, 0, 0, 1, 1,
-0.9621919, -0.3040544, -0.7779098, 1, 0, 0, 1, 1,
-0.9530355, -0.05665744, 0.3697143, 0, 0, 0, 1, 1,
-0.9521737, 0.8397539, -1.640836, 0, 0, 0, 1, 1,
-0.9411783, 0.6675319, -2.291043, 0, 0, 0, 1, 1,
-0.9392865, 1.470834, -2.159199, 0, 0, 0, 1, 1,
-0.9377819, 0.05803164, -1.572053, 0, 0, 0, 1, 1,
-0.9355273, -0.9067916, -2.860868, 0, 0, 0, 1, 1,
-0.9332775, 0.9518871, -0.1556094, 0, 0, 0, 1, 1,
-0.9280659, 1.516626, -3.016547, 1, 1, 1, 1, 1,
-0.9270784, -1.361718, -1.596161, 1, 1, 1, 1, 1,
-0.9261305, -0.8246393, -2.684778, 1, 1, 1, 1, 1,
-0.9260597, 0.3230865, 0.3528203, 1, 1, 1, 1, 1,
-0.925643, 0.7495205, 0.2792969, 1, 1, 1, 1, 1,
-0.9200283, 0.7067324, -1.741583, 1, 1, 1, 1, 1,
-0.9193746, -1.313006, -2.839806, 1, 1, 1, 1, 1,
-0.8935549, 0.5880837, -1.478738, 1, 1, 1, 1, 1,
-0.8933907, -0.495427, -1.363951, 1, 1, 1, 1, 1,
-0.8896884, 1.505567, 0.3138578, 1, 1, 1, 1, 1,
-0.8837779, -1.648705, -2.697833, 1, 1, 1, 1, 1,
-0.8833361, -0.9109749, -2.83711, 1, 1, 1, 1, 1,
-0.88201, -1.887182, -3.890928, 1, 1, 1, 1, 1,
-0.8706992, 1.265662, 1.631139, 1, 1, 1, 1, 1,
-0.8688696, -0.7117075, -1.34236, 1, 1, 1, 1, 1,
-0.8560103, -2.00338, -2.097458, 0, 0, 1, 1, 1,
-0.8552393, 0.9844646, 0.02701467, 1, 0, 0, 1, 1,
-0.8534629, -0.2534342, -0.6328393, 1, 0, 0, 1, 1,
-0.8476021, 1.444533, -1.46893, 1, 0, 0, 1, 1,
-0.8381125, 0.5215102, -2.003136, 1, 0, 0, 1, 1,
-0.8370156, 0.8289055, -2.571324, 1, 0, 0, 1, 1,
-0.8321623, -1.286139, -3.896525, 0, 0, 0, 1, 1,
-0.8312884, 1.072901, 1.073706, 0, 0, 0, 1, 1,
-0.8294061, 0.8083645, -0.7478701, 0, 0, 0, 1, 1,
-0.8288479, 0.6225205, -0.7770237, 0, 0, 0, 1, 1,
-0.8284795, 0.3834228, -0.8058647, 0, 0, 0, 1, 1,
-0.8223925, -0.5325602, -3.438283, 0, 0, 0, 1, 1,
-0.8212236, 1.103376, 0.1527511, 0, 0, 0, 1, 1,
-0.8196025, -0.4456468, -2.291283, 1, 1, 1, 1, 1,
-0.814959, -1.767078, -2.552093, 1, 1, 1, 1, 1,
-0.8138224, -0.8375384, -2.566427, 1, 1, 1, 1, 1,
-0.8034573, -0.02989357, -2.543898, 1, 1, 1, 1, 1,
-0.7979808, -0.4586841, -3.114535, 1, 1, 1, 1, 1,
-0.7947229, 0.1735292, 1.673691, 1, 1, 1, 1, 1,
-0.7914526, -1.33853, -2.894094, 1, 1, 1, 1, 1,
-0.7896755, 0.1691433, -0.803846, 1, 1, 1, 1, 1,
-0.7867963, 0.7337198, -0.384091, 1, 1, 1, 1, 1,
-0.7863779, 1.418563, -1.085859, 1, 1, 1, 1, 1,
-0.7846918, 0.294706, -0.8288168, 1, 1, 1, 1, 1,
-0.7831216, -1.591179, -3.20992, 1, 1, 1, 1, 1,
-0.7657818, 0.223167, -2.255383, 1, 1, 1, 1, 1,
-0.7571254, -2.202367, -2.127769, 1, 1, 1, 1, 1,
-0.7500284, -0.9709079, -1.004706, 1, 1, 1, 1, 1,
-0.7487811, -0.8871001, -2.443602, 0, 0, 1, 1, 1,
-0.7378598, 0.1137067, -1.646156, 1, 0, 0, 1, 1,
-0.7372944, -1.200021, -3.262917, 1, 0, 0, 1, 1,
-0.7256562, 0.615879, -2.271421, 1, 0, 0, 1, 1,
-0.7212528, 0.7037861, -2.109244, 1, 0, 0, 1, 1,
-0.7178656, 1.172158, -1.078748, 1, 0, 0, 1, 1,
-0.7174911, -0.1016281, -2.096381, 0, 0, 0, 1, 1,
-0.7096656, -1.544788, -2.559571, 0, 0, 0, 1, 1,
-0.7051504, -0.5530353, -2.735314, 0, 0, 0, 1, 1,
-0.7024575, -2.298002, -3.15079, 0, 0, 0, 1, 1,
-0.7003034, -0.6793605, -1.80405, 0, 0, 0, 1, 1,
-0.696113, -0.1577974, -3.260178, 0, 0, 0, 1, 1,
-0.6946843, -0.3547011, -0.2034182, 0, 0, 0, 1, 1,
-0.690946, 0.9691035, -2.091917, 1, 1, 1, 1, 1,
-0.6895152, -0.116622, -2.239074, 1, 1, 1, 1, 1,
-0.6763332, 0.70415, -1.490352, 1, 1, 1, 1, 1,
-0.6731249, 0.8111207, 0.03409888, 1, 1, 1, 1, 1,
-0.6685689, 0.2184105, -1.117768, 1, 1, 1, 1, 1,
-0.6667154, 0.6970789, -1.048716, 1, 1, 1, 1, 1,
-0.6643832, -0.6207466, -4.447763, 1, 1, 1, 1, 1,
-0.6616672, 0.4667228, -0.2124201, 1, 1, 1, 1, 1,
-0.6551998, 1.005985, -2.02196, 1, 1, 1, 1, 1,
-0.6527461, -0.2817736, -1.808974, 1, 1, 1, 1, 1,
-0.6372994, 0.4422002, -1.182772, 1, 1, 1, 1, 1,
-0.6368113, -0.9333245, -2.647963, 1, 1, 1, 1, 1,
-0.6352224, 0.1013767, -1.28802, 1, 1, 1, 1, 1,
-0.6334406, 0.322343, -1.019956, 1, 1, 1, 1, 1,
-0.6289301, -1.007549, -2.759488, 1, 1, 1, 1, 1,
-0.6266056, -0.1890481, -1.973046, 0, 0, 1, 1, 1,
-0.6260589, -0.1823281, 0.2530659, 1, 0, 0, 1, 1,
-0.6199977, 0.1404858, -0.6352068, 1, 0, 0, 1, 1,
-0.6186322, -0.6905026, -2.145568, 1, 0, 0, 1, 1,
-0.6180742, -1.128225, -3.135219, 1, 0, 0, 1, 1,
-0.6144548, -0.4093737, -1.512469, 1, 0, 0, 1, 1,
-0.6132975, 0.6632843, -1.068166, 0, 0, 0, 1, 1,
-0.6102266, 0.2756538, -2.234779, 0, 0, 0, 1, 1,
-0.6098568, -0.2551496, -1.077522, 0, 0, 0, 1, 1,
-0.6058594, 1.532763, -1.830803, 0, 0, 0, 1, 1,
-0.6050926, -0.6222073, 0.02340032, 0, 0, 0, 1, 1,
-0.6030754, -2.159513, -2.077013, 0, 0, 0, 1, 1,
-0.5995435, 0.2267139, -0.7180409, 0, 0, 0, 1, 1,
-0.5979271, -0.508782, -2.646146, 1, 1, 1, 1, 1,
-0.5971696, 0.398566, -0.2614853, 1, 1, 1, 1, 1,
-0.5966065, -0.1011015, -3.676779, 1, 1, 1, 1, 1,
-0.5962055, -0.5768573, -3.040486, 1, 1, 1, 1, 1,
-0.5930282, 0.5804186, -1.051339, 1, 1, 1, 1, 1,
-0.5873276, -0.6390871, -2.449306, 1, 1, 1, 1, 1,
-0.5854971, -0.04290771, -2.421991, 1, 1, 1, 1, 1,
-0.5818802, 0.07850416, -0.3108985, 1, 1, 1, 1, 1,
-0.5683878, -1.579272, -1.606669, 1, 1, 1, 1, 1,
-0.5656086, 0.7799009, -1.132071, 1, 1, 1, 1, 1,
-0.5654521, -0.5886527, -3.401712, 1, 1, 1, 1, 1,
-0.5652832, 0.6630297, -0.949625, 1, 1, 1, 1, 1,
-0.5597202, -0.1222504, -0.8435324, 1, 1, 1, 1, 1,
-0.5569289, -0.01770733, -1.134221, 1, 1, 1, 1, 1,
-0.5524364, 0.3662393, -0.015424, 1, 1, 1, 1, 1,
-0.545887, -1.660756, -2.65598, 0, 0, 1, 1, 1,
-0.542225, -1.47176, -3.014087, 1, 0, 0, 1, 1,
-0.5406172, -0.7374201, -3.468748, 1, 0, 0, 1, 1,
-0.5348209, 0.900832, 0.7667326, 1, 0, 0, 1, 1,
-0.5342352, -1.370047, -2.439288, 1, 0, 0, 1, 1,
-0.5342049, 0.7477073, -0.2250131, 1, 0, 0, 1, 1,
-0.5337721, -0.2439665, -2.997418, 0, 0, 0, 1, 1,
-0.5334022, 0.6154493, -1.687933, 0, 0, 0, 1, 1,
-0.5282212, -0.3985384, -1.521142, 0, 0, 0, 1, 1,
-0.5280304, 0.2388737, -1.177284, 0, 0, 0, 1, 1,
-0.5275576, -0.07390328, -0.7535558, 0, 0, 0, 1, 1,
-0.52648, -1.515336, -2.419414, 0, 0, 0, 1, 1,
-0.5254713, 0.2652062, 0.151193, 0, 0, 0, 1, 1,
-0.5140705, -1.337428, -2.262477, 1, 1, 1, 1, 1,
-0.5108973, 1.148112, 1.109914, 1, 1, 1, 1, 1,
-0.5102358, -0.3144928, -1.823835, 1, 1, 1, 1, 1,
-0.5061978, 1.869602, -1.305112, 1, 1, 1, 1, 1,
-0.5057499, -0.1442849, -1.661786, 1, 1, 1, 1, 1,
-0.5042003, -0.1160275, -0.366041, 1, 1, 1, 1, 1,
-0.5029784, 0.3888939, -0.2732301, 1, 1, 1, 1, 1,
-0.4971858, 1.273991, 0.520338, 1, 1, 1, 1, 1,
-0.4970659, -0.3778454, -2.9819, 1, 1, 1, 1, 1,
-0.4954013, 0.7165036, -0.9774963, 1, 1, 1, 1, 1,
-0.4903393, -0.7794306, -1.691269, 1, 1, 1, 1, 1,
-0.486912, 1.277184, 0.5601578, 1, 1, 1, 1, 1,
-0.4863397, -0.6935773, -2.196164, 1, 1, 1, 1, 1,
-0.4834894, -0.4666962, -2.215616, 1, 1, 1, 1, 1,
-0.4825058, -0.4512761, -2.344976, 1, 1, 1, 1, 1,
-0.4811207, 1.383494, -0.3015283, 0, 0, 1, 1, 1,
-0.4803747, 1.913435, -0.1964084, 1, 0, 0, 1, 1,
-0.4769074, 0.4894105, -1.029478, 1, 0, 0, 1, 1,
-0.4698083, 1.113958, -1.177047, 1, 0, 0, 1, 1,
-0.4684662, -1.257676, -4.224845, 1, 0, 0, 1, 1,
-0.4671229, 1.864645, -1.145865, 1, 0, 0, 1, 1,
-0.4665948, -0.968998, -3.197079, 0, 0, 0, 1, 1,
-0.4637212, -0.03139486, -1.032432, 0, 0, 0, 1, 1,
-0.4621722, 0.840674, -3.247175, 0, 0, 0, 1, 1,
-0.4619319, 0.4378826, -0.4520853, 0, 0, 0, 1, 1,
-0.4566797, -0.9993114, -1.75704, 0, 0, 0, 1, 1,
-0.4558, 0.1107755, -1.509613, 0, 0, 0, 1, 1,
-0.4528984, 0.4325674, -2.148729, 0, 0, 0, 1, 1,
-0.4528566, -0.3448698, -0.2538744, 1, 1, 1, 1, 1,
-0.4528157, 0.9489233, -0.2747347, 1, 1, 1, 1, 1,
-0.4524305, -0.3297737, -3.071112, 1, 1, 1, 1, 1,
-0.4500251, 1.042165, 0.5511469, 1, 1, 1, 1, 1,
-0.4488034, -0.3411563, -2.643685, 1, 1, 1, 1, 1,
-0.4453001, 0.3939557, 1.285738, 1, 1, 1, 1, 1,
-0.4429336, 0.7070814, 0.7789311, 1, 1, 1, 1, 1,
-0.4380274, 1.129749, 0.08700171, 1, 1, 1, 1, 1,
-0.437731, -1.007253, -3.842383, 1, 1, 1, 1, 1,
-0.4361561, -1.833378, -0.3653633, 1, 1, 1, 1, 1,
-0.4351795, -0.04814893, -2.138012, 1, 1, 1, 1, 1,
-0.4300904, -1.396736, -2.688921, 1, 1, 1, 1, 1,
-0.4281107, 0.04430506, -1.11035, 1, 1, 1, 1, 1,
-0.4264878, 0.3542061, -0.2425874, 1, 1, 1, 1, 1,
-0.4236502, 1.092143, -1.634757, 1, 1, 1, 1, 1,
-0.4089079, -0.2576465, -2.155256, 0, 0, 1, 1, 1,
-0.4059753, -0.642572, -2.523015, 1, 0, 0, 1, 1,
-0.4036501, -1.029409, -3.352679, 1, 0, 0, 1, 1,
-0.4020325, 0.413184, 1.223846, 1, 0, 0, 1, 1,
-0.3991002, 2.418597, -0.4573246, 1, 0, 0, 1, 1,
-0.3968911, -0.6667705, -1.074282, 1, 0, 0, 1, 1,
-0.3888569, -0.09964287, 0.7026429, 0, 0, 0, 1, 1,
-0.3865718, 0.2486559, -1.742477, 0, 0, 0, 1, 1,
-0.3855213, -0.1515881, -1.363858, 0, 0, 0, 1, 1,
-0.383729, -1.48409, -4.348012, 0, 0, 0, 1, 1,
-0.3817336, 0.628731, -0.3485349, 0, 0, 0, 1, 1,
-0.3784174, 1.864196, -1.416241, 0, 0, 0, 1, 1,
-0.3743746, -1.744098, -3.180482, 0, 0, 0, 1, 1,
-0.372859, 0.3440717, -2.063145, 1, 1, 1, 1, 1,
-0.3728084, -0.6332058, -1.976654, 1, 1, 1, 1, 1,
-0.3726348, 1.502082, -1.551169, 1, 1, 1, 1, 1,
-0.3717142, 0.8177485, -2.05438, 1, 1, 1, 1, 1,
-0.3710432, 1.484843, 1.547965, 1, 1, 1, 1, 1,
-0.3653264, -1.601823, -1.200489, 1, 1, 1, 1, 1,
-0.3599754, 1.994186, -0.5908116, 1, 1, 1, 1, 1,
-0.3565975, 0.02316577, -1.724124, 1, 1, 1, 1, 1,
-0.3559345, 0.6704242, -0.4123726, 1, 1, 1, 1, 1,
-0.3552439, -0.7771924, -2.189849, 1, 1, 1, 1, 1,
-0.3528585, 1.630694, -0.7738378, 1, 1, 1, 1, 1,
-0.3478542, 0.1946924, -0.07547937, 1, 1, 1, 1, 1,
-0.3442006, 0.3369708, 1.388535, 1, 1, 1, 1, 1,
-0.3437841, 0.2861227, -2.062097, 1, 1, 1, 1, 1,
-0.3405848, 0.7536505, -0.800059, 1, 1, 1, 1, 1,
-0.3390766, -1.164161, -2.354175, 0, 0, 1, 1, 1,
-0.3384247, -0.2770743, -2.341402, 1, 0, 0, 1, 1,
-0.3373969, -0.3844376, -2.691944, 1, 0, 0, 1, 1,
-0.3352837, 1.144356, 1.990229, 1, 0, 0, 1, 1,
-0.3327064, -0.3558955, -1.360952, 1, 0, 0, 1, 1,
-0.3302533, -0.3007918, -1.464161, 1, 0, 0, 1, 1,
-0.3293357, -1.831023, -3.362518, 0, 0, 0, 1, 1,
-0.3256064, 0.7489958, -1.059634, 0, 0, 0, 1, 1,
-0.3208602, 0.9158348, -1.669223, 0, 0, 0, 1, 1,
-0.311083, 0.2622221, -0.6104352, 0, 0, 0, 1, 1,
-0.3065836, 0.9413961, -0.2449723, 0, 0, 0, 1, 1,
-0.306134, 0.6617789, -2.011327, 0, 0, 0, 1, 1,
-0.3016088, -0.2068227, -0.9060975, 0, 0, 0, 1, 1,
-0.2981969, 2.460583, -0.3041236, 1, 1, 1, 1, 1,
-0.2968211, 0.03215088, -3.110928, 1, 1, 1, 1, 1,
-0.2932609, 0.5648103, 0.5666508, 1, 1, 1, 1, 1,
-0.2824767, -0.04403299, 1.334961, 1, 1, 1, 1, 1,
-0.2820136, -1.390707, -2.419961, 1, 1, 1, 1, 1,
-0.2814247, 0.4961307, -1.118349, 1, 1, 1, 1, 1,
-0.2785478, -0.4216104, -0.6900228, 1, 1, 1, 1, 1,
-0.2750715, -0.01898879, -2.75893, 1, 1, 1, 1, 1,
-0.2735833, -2.170693, -2.330282, 1, 1, 1, 1, 1,
-0.2726891, 0.2487631, -0.8145292, 1, 1, 1, 1, 1,
-0.272549, -0.2321765, -3.686085, 1, 1, 1, 1, 1,
-0.2706778, -0.565336, -2.055566, 1, 1, 1, 1, 1,
-0.2636127, 1.009433, 1.155939, 1, 1, 1, 1, 1,
-0.2619198, 0.566977, -2.543816, 1, 1, 1, 1, 1,
-0.2608027, -1.851911, -1.643367, 1, 1, 1, 1, 1,
-0.2582398, 0.1035238, -2.867225, 0, 0, 1, 1, 1,
-0.2579395, 0.2589822, -2.224976, 1, 0, 0, 1, 1,
-0.2549375, -0.4158399, -1.928153, 1, 0, 0, 1, 1,
-0.253928, -1.904863, -3.708918, 1, 0, 0, 1, 1,
-0.2499384, -0.8061827, -3.372789, 1, 0, 0, 1, 1,
-0.2488502, -0.8742393, -4.551579, 1, 0, 0, 1, 1,
-0.2484797, 0.73708, -0.1764175, 0, 0, 0, 1, 1,
-0.2470658, 1.037551, -0.04092161, 0, 0, 0, 1, 1,
-0.2468609, 0.2499846, 0.4671237, 0, 0, 0, 1, 1,
-0.2421658, -0.3113177, -3.014828, 0, 0, 0, 1, 1,
-0.2409943, -0.3742831, -3.409049, 0, 0, 0, 1, 1,
-0.2382104, -0.3694088, -1.482067, 0, 0, 0, 1, 1,
-0.2317428, -0.2220461, -1.832149, 0, 0, 0, 1, 1,
-0.2272448, 0.9960216, -0.5190042, 1, 1, 1, 1, 1,
-0.225175, 0.665832, -0.75752, 1, 1, 1, 1, 1,
-0.2244146, 0.5767165, 1.057466, 1, 1, 1, 1, 1,
-0.2208706, 0.8898111, -0.9998743, 1, 1, 1, 1, 1,
-0.219351, 0.8538127, -1.078951, 1, 1, 1, 1, 1,
-0.2175081, -0.7165074, -2.986943, 1, 1, 1, 1, 1,
-0.2166849, -0.442792, -4.465535, 1, 1, 1, 1, 1,
-0.2160767, -0.3503155, -2.765013, 1, 1, 1, 1, 1,
-0.2141467, 0.5765972, 0.3264141, 1, 1, 1, 1, 1,
-0.2124959, -0.8983294, -3.605755, 1, 1, 1, 1, 1,
-0.2049076, 2.222133, 0.2766426, 1, 1, 1, 1, 1,
-0.2038705, 3.257036, 0.7406772, 1, 1, 1, 1, 1,
-0.197771, -0.5495557, -4.190259, 1, 1, 1, 1, 1,
-0.1968042, -0.3289527, -1.108903, 1, 1, 1, 1, 1,
-0.1943327, -0.2105024, -3.720315, 1, 1, 1, 1, 1,
-0.18309, 0.463116, -2.30713, 0, 0, 1, 1, 1,
-0.1796397, -1.062338, -1.624085, 1, 0, 0, 1, 1,
-0.1780317, 0.5926192, -0.6050022, 1, 0, 0, 1, 1,
-0.1726569, -0.03075244, 0.1775748, 1, 0, 0, 1, 1,
-0.1701628, -0.2831187, -2.026985, 1, 0, 0, 1, 1,
-0.1687368, -2.291103, -4.433424, 1, 0, 0, 1, 1,
-0.1683147, -2.671351, -3.982852, 0, 0, 0, 1, 1,
-0.1676501, 0.1351138, -0.01181486, 0, 0, 0, 1, 1,
-0.1668081, -0.6050512, -4.689333, 0, 0, 0, 1, 1,
-0.1613433, -0.531487, 0.1965564, 0, 0, 0, 1, 1,
-0.1576548, -0.8338856, -4.96905, 0, 0, 0, 1, 1,
-0.1525666, -0.9325355, -2.429106, 0, 0, 0, 1, 1,
-0.1522442, -0.914183, -4.047415, 0, 0, 0, 1, 1,
-0.1513279, -1.616444, -3.458427, 1, 1, 1, 1, 1,
-0.1476475, 0.8590429, -0.9125078, 1, 1, 1, 1, 1,
-0.1451236, 0.9599259, -0.2629144, 1, 1, 1, 1, 1,
-0.1422185, 0.3126968, -0.6781709, 1, 1, 1, 1, 1,
-0.1420727, -0.07538732, -2.507792, 1, 1, 1, 1, 1,
-0.1409504, 0.790274, 0.6988866, 1, 1, 1, 1, 1,
-0.1394375, -0.7087995, -2.430979, 1, 1, 1, 1, 1,
-0.137346, -0.2435376, -1.862944, 1, 1, 1, 1, 1,
-0.1358323, 0.3240553, -0.889044, 1, 1, 1, 1, 1,
-0.133732, -2.844125, -3.823121, 1, 1, 1, 1, 1,
-0.1333981, 0.506349, 0.2719366, 1, 1, 1, 1, 1,
-0.1321405, 0.8671274, -2.191159, 1, 1, 1, 1, 1,
-0.1298634, -1.096885, -2.906383, 1, 1, 1, 1, 1,
-0.1252199, -0.2761541, -3.098818, 1, 1, 1, 1, 1,
-0.1248197, -1.12937, -2.118332, 1, 1, 1, 1, 1,
-0.120593, -0.05089633, -2.265269, 0, 0, 1, 1, 1,
-0.1201485, 0.6972144, -0.415451, 1, 0, 0, 1, 1,
-0.1165696, -0.6182543, -2.67007, 1, 0, 0, 1, 1,
-0.1150035, 0.3712539, -1.669077, 1, 0, 0, 1, 1,
-0.1134704, -0.62905, -3.852593, 1, 0, 0, 1, 1,
-0.1098234, 0.7820249, 1.089696, 1, 0, 0, 1, 1,
-0.1080268, 0.5832712, 1.7482, 0, 0, 0, 1, 1,
-0.1046751, -0.6567831, -2.827253, 0, 0, 0, 1, 1,
-0.1044247, -0.1732243, -3.044708, 0, 0, 0, 1, 1,
-0.1044094, 1.359432, 0.3037136, 0, 0, 0, 1, 1,
-0.1015807, 0.2321307, -1.204748, 0, 0, 0, 1, 1,
-0.09814746, 1.306013, 0.6118187, 0, 0, 0, 1, 1,
-0.09781666, 0.3772334, 0.1053628, 0, 0, 0, 1, 1,
-0.09639326, 2.458568, -0.5913243, 1, 1, 1, 1, 1,
-0.09369507, 1.279092, 0.8681021, 1, 1, 1, 1, 1,
-0.09143157, 0.3057764, 0.2733929, 1, 1, 1, 1, 1,
-0.09103519, 0.7974244, 0.03097929, 1, 1, 1, 1, 1,
-0.08880323, 0.3642524, 0.1209204, 1, 1, 1, 1, 1,
-0.08509044, -1.340463, -2.136127, 1, 1, 1, 1, 1,
-0.08276501, 0.7406096, -0.05261473, 1, 1, 1, 1, 1,
-0.08125909, 0.4775042, 0.1095445, 1, 1, 1, 1, 1,
-0.07962973, -0.4729493, -2.863117, 1, 1, 1, 1, 1,
-0.07742151, -1.166819, -1.572182, 1, 1, 1, 1, 1,
-0.07343953, 0.9809425, 0.5869961, 1, 1, 1, 1, 1,
-0.06998998, -0.1105915, -2.047901, 1, 1, 1, 1, 1,
-0.06461769, 1.82649, 1.803757, 1, 1, 1, 1, 1,
-0.06412582, -0.1821114, -3.128703, 1, 1, 1, 1, 1,
-0.05726027, 0.6860076, 1.524055, 1, 1, 1, 1, 1,
-0.05575175, 1.663229, -1.120396, 0, 0, 1, 1, 1,
-0.05308644, -1.027914, -1.890608, 1, 0, 0, 1, 1,
-0.05256182, 0.8389277, 1.27899, 1, 0, 0, 1, 1,
-0.05171531, -1.03645, -3.297009, 1, 0, 0, 1, 1,
-0.05024604, 1.949236e-06, -1.360133, 1, 0, 0, 1, 1,
-0.0493684, 0.8462338, 0.2226555, 1, 0, 0, 1, 1,
-0.04805032, 1.337194, 0.1375847, 0, 0, 0, 1, 1,
-0.04312183, 0.002374199, 0.2622677, 0, 0, 0, 1, 1,
-0.04260192, -1.693194, -4.065045, 0, 0, 0, 1, 1,
-0.03818959, -1.681878, -4.770063, 0, 0, 0, 1, 1,
-0.02827739, 0.5129789, -0.2664895, 0, 0, 0, 1, 1,
-0.02711859, 0.002647498, -1.189912, 0, 0, 0, 1, 1,
-0.02652427, 0.7118675, -1.01794, 0, 0, 0, 1, 1,
-0.01875873, 0.3325315, -1.068045, 1, 1, 1, 1, 1,
-0.01136146, -1.322626, -4.069313, 1, 1, 1, 1, 1,
-0.01133244, -0.2619309, -4.015843, 1, 1, 1, 1, 1,
-0.01123894, -0.8202652, -4.84801, 1, 1, 1, 1, 1,
-0.005897418, 0.1430515, 0.567222, 1, 1, 1, 1, 1,
-0.005673724, -0.3222823, -3.583987, 1, 1, 1, 1, 1,
-0.003246226, 0.567038, 1.964053, 1, 1, 1, 1, 1,
-0.002403339, -0.7175996, -2.283959, 1, 1, 1, 1, 1,
0.006077806, 0.2344467, -0.1407785, 1, 1, 1, 1, 1,
0.008495974, 0.5860846, 0.4104214, 1, 1, 1, 1, 1,
0.01011014, -1.765751, 0.4801621, 1, 1, 1, 1, 1,
0.01103672, 1.085887, -0.8551285, 1, 1, 1, 1, 1,
0.01506348, 0.9076628, -0.7186939, 1, 1, 1, 1, 1,
0.015528, -0.8007496, 4.492574, 1, 1, 1, 1, 1,
0.01792207, -2.457083, 2.272467, 1, 1, 1, 1, 1,
0.01982772, 0.2164725, 1.141788, 0, 0, 1, 1, 1,
0.01993322, -0.3173161, 0.8563738, 1, 0, 0, 1, 1,
0.02823828, -1.403417, 2.650798, 1, 0, 0, 1, 1,
0.0282972, 1.199249, -0.8605019, 1, 0, 0, 1, 1,
0.03311888, -1.249688, 3.390554, 1, 0, 0, 1, 1,
0.03653326, 1.441466, 0.7091212, 1, 0, 0, 1, 1,
0.03824339, 2.033665, -0.1546062, 0, 0, 0, 1, 1,
0.0388514, -1.133009, 2.782271, 0, 0, 0, 1, 1,
0.03907981, -0.5536878, 2.61567, 0, 0, 0, 1, 1,
0.04116542, -0.4561872, 2.662871, 0, 0, 0, 1, 1,
0.04250415, -1.637662, 4.720906, 0, 0, 0, 1, 1,
0.04555575, 1.884421, -1.520439, 0, 0, 0, 1, 1,
0.05119538, 1.158955, 0.6143607, 0, 0, 0, 1, 1,
0.0579516, -0.03490226, 3.37718, 1, 1, 1, 1, 1,
0.06084924, -1.136735, 2.898973, 1, 1, 1, 1, 1,
0.06176957, 1.125538, -1.039971, 1, 1, 1, 1, 1,
0.06608117, 0.9302526, -0.7230095, 1, 1, 1, 1, 1,
0.06931952, -1.324772, 3.348271, 1, 1, 1, 1, 1,
0.06996483, -1.229889, 3.918738, 1, 1, 1, 1, 1,
0.07070037, -0.5537413, 2.283453, 1, 1, 1, 1, 1,
0.07141298, 1.061835, 1.988045, 1, 1, 1, 1, 1,
0.07303169, 1.777372, -0.1916884, 1, 1, 1, 1, 1,
0.07311542, 0.7934164, -0.1599607, 1, 1, 1, 1, 1,
0.07431304, -1.625033, 3.588185, 1, 1, 1, 1, 1,
0.08043866, 0.3963427, 0.9552509, 1, 1, 1, 1, 1,
0.08094154, -0.5575454, 1.824351, 1, 1, 1, 1, 1,
0.0810387, -0.5549967, 2.876234, 1, 1, 1, 1, 1,
0.08422139, 1.930344, -1.449111, 1, 1, 1, 1, 1,
0.08423673, 0.07727697, 0.768324, 0, 0, 1, 1, 1,
0.08460507, 0.9663081, -0.4356568, 1, 0, 0, 1, 1,
0.08956909, -1.332485, 3.73638, 1, 0, 0, 1, 1,
0.09157721, 0.03797903, 1.695371, 1, 0, 0, 1, 1,
0.0974516, -0.9635922, 3.870752, 1, 0, 0, 1, 1,
0.09844951, 1.287562, 0.7708559, 1, 0, 0, 1, 1,
0.09846554, -2.095981, 3.226352, 0, 0, 0, 1, 1,
0.1009137, -0.3394254, 4.074923, 0, 0, 0, 1, 1,
0.1022944, 0.09170076, -0.0005237816, 0, 0, 0, 1, 1,
0.1047893, 0.07927524, 1.544249, 0, 0, 0, 1, 1,
0.111397, 0.208456, -0.9092706, 0, 0, 0, 1, 1,
0.1114783, -0.02242466, 2.960807, 0, 0, 0, 1, 1,
0.1120541, -0.7984537, 2.549045, 0, 0, 0, 1, 1,
0.1154666, 0.8800233, 0.1426604, 1, 1, 1, 1, 1,
0.1201027, 1.816071, -0.6684583, 1, 1, 1, 1, 1,
0.1220132, -1.123323, 2.109589, 1, 1, 1, 1, 1,
0.122058, 0.2671796, 1.162322, 1, 1, 1, 1, 1,
0.1240894, 0.3696219, -0.04931169, 1, 1, 1, 1, 1,
0.1345189, 0.8035862, 0.8577279, 1, 1, 1, 1, 1,
0.1361298, -0.5157404, 1.887525, 1, 1, 1, 1, 1,
0.1381633, 0.05443697, -0.9987022, 1, 1, 1, 1, 1,
0.1382356, 0.7067183, 0.9213664, 1, 1, 1, 1, 1,
0.1403508, 0.2497889, 0.6123042, 1, 1, 1, 1, 1,
0.1420456, 0.8041998, 0.1707766, 1, 1, 1, 1, 1,
0.1464015, 1.319506, -0.6627145, 1, 1, 1, 1, 1,
0.1482049, 0.10449, -0.202984, 1, 1, 1, 1, 1,
0.1500577, 0.2166265, 0.5435082, 1, 1, 1, 1, 1,
0.1520832, -0.4602341, 2.678081, 1, 1, 1, 1, 1,
0.1529773, 0.6080945, -0.2989359, 0, 0, 1, 1, 1,
0.1551535, -0.503305, 6.409169, 1, 0, 0, 1, 1,
0.1557289, -2.045405, 2.860564, 1, 0, 0, 1, 1,
0.1579622, -0.8836377, 4.201761, 1, 0, 0, 1, 1,
0.1587548, 0.2975647, 0.8919367, 1, 0, 0, 1, 1,
0.1635258, -0.1669214, 1.474543, 1, 0, 0, 1, 1,
0.1635462, -0.2827459, 0.7275929, 0, 0, 0, 1, 1,
0.1661446, 1.032558, 0.4768461, 0, 0, 0, 1, 1,
0.1698334, 0.9772896, 2.362999, 0, 0, 0, 1, 1,
0.1740329, 0.2060266, 1.519832, 0, 0, 0, 1, 1,
0.1740527, 0.6562688, 1.774425, 0, 0, 0, 1, 1,
0.1757852, 0.1963625, 1.791837, 0, 0, 0, 1, 1,
0.1769606, 0.7821042, -0.3664184, 0, 0, 0, 1, 1,
0.1782658, -0.6312142, 2.394038, 1, 1, 1, 1, 1,
0.1795976, 0.4991313, 0.7744976, 1, 1, 1, 1, 1,
0.1850583, -1.346399, 2.005497, 1, 1, 1, 1, 1,
0.1862129, -1.74251, 4.024314, 1, 1, 1, 1, 1,
0.1874443, -1.403226, 2.796166, 1, 1, 1, 1, 1,
0.1879682, -0.9523799, 1.671357, 1, 1, 1, 1, 1,
0.1904559, -0.09298574, 1.288846, 1, 1, 1, 1, 1,
0.199038, -0.5253048, 3.243414, 1, 1, 1, 1, 1,
0.2018585, 1.137618, 0.4244917, 1, 1, 1, 1, 1,
0.2028139, 0.1407133, 1.117579, 1, 1, 1, 1, 1,
0.209754, -0.01078275, 3.775809, 1, 1, 1, 1, 1,
0.2130798, -1.276432, 2.022258, 1, 1, 1, 1, 1,
0.2152703, 0.04975249, 3.497605, 1, 1, 1, 1, 1,
0.2165232, 1.557603, 1.71729, 1, 1, 1, 1, 1,
0.2178188, 0.3198504, 0.01329701, 1, 1, 1, 1, 1,
0.2197371, -0.320172, 1.409664, 0, 0, 1, 1, 1,
0.2239008, -0.3947775, 3.203459, 1, 0, 0, 1, 1,
0.2290365, -0.6830301, 4.225958, 1, 0, 0, 1, 1,
0.2319278, 0.7940184, 1.113523, 1, 0, 0, 1, 1,
0.2347634, -1.027583, 2.282337, 1, 0, 0, 1, 1,
0.2386459, -0.3585245, 3.453453, 1, 0, 0, 1, 1,
0.2424717, 0.2478596, 0.6881877, 0, 0, 0, 1, 1,
0.244742, 1.004765, -1.400933, 0, 0, 0, 1, 1,
0.2475737, -0.1552013, 1.377034, 0, 0, 0, 1, 1,
0.2498854, 0.9843244, -0.2458557, 0, 0, 0, 1, 1,
0.2510428, -2.297094, 4.039576, 0, 0, 0, 1, 1,
0.2524132, 0.5855696, 1.09079, 0, 0, 0, 1, 1,
0.255991, -1.604713, 2.562154, 0, 0, 0, 1, 1,
0.262154, -0.3279265, 2.327247, 1, 1, 1, 1, 1,
0.2640893, 2.037137, 0.1853311, 1, 1, 1, 1, 1,
0.2674564, 0.9461885, 0.06831864, 1, 1, 1, 1, 1,
0.2681393, 1.875392, 0.2358442, 1, 1, 1, 1, 1,
0.271771, -2.655833, 2.419361, 1, 1, 1, 1, 1,
0.2743891, -0.5150731, 3.153494, 1, 1, 1, 1, 1,
0.2786393, -0.4014908, 3.335072, 1, 1, 1, 1, 1,
0.2804546, -0.9196342, 1.519051, 1, 1, 1, 1, 1,
0.2848263, 0.3291141, 0.4108939, 1, 1, 1, 1, 1,
0.2859536, -0.3142105, 2.232694, 1, 1, 1, 1, 1,
0.2863788, 1.270366, 2.288185, 1, 1, 1, 1, 1,
0.2901073, 0.2154625, 1.637143, 1, 1, 1, 1, 1,
0.2916473, -0.3499406, 1.294505, 1, 1, 1, 1, 1,
0.2924233, -1.543352, 3.826183, 1, 1, 1, 1, 1,
0.2946923, -0.2865271, 3.379472, 1, 1, 1, 1, 1,
0.2988412, 0.9592128, 0.3882421, 0, 0, 1, 1, 1,
0.3026193, -0.9347643, 1.797063, 1, 0, 0, 1, 1,
0.3033466, 1.777615, -0.1657846, 1, 0, 0, 1, 1,
0.3037754, -0.475708, 3.370972, 1, 0, 0, 1, 1,
0.3077201, 1.302421, 0.8101597, 1, 0, 0, 1, 1,
0.3088287, -0.1752146, 2.407645, 1, 0, 0, 1, 1,
0.3100117, 0.2793989, 2.723826, 0, 0, 0, 1, 1,
0.3154287, -0.1896544, 3.152796, 0, 0, 0, 1, 1,
0.3175329, 0.2525496, 0.2460132, 0, 0, 0, 1, 1,
0.3189163, 0.7482349, 0.7507657, 0, 0, 0, 1, 1,
0.3210545, 0.03022808, 0.9982756, 0, 0, 0, 1, 1,
0.3212455, 1.072683, 0.03789603, 0, 0, 0, 1, 1,
0.3235184, 0.6158718, 0.5545228, 0, 0, 0, 1, 1,
0.3250284, 0.6720984, 2.505848, 1, 1, 1, 1, 1,
0.3265471, -0.1420886, 2.490164, 1, 1, 1, 1, 1,
0.3296093, 0.2914635, 1.021079, 1, 1, 1, 1, 1,
0.3303069, 1.34048, 0.4965779, 1, 1, 1, 1, 1,
0.3386136, 0.8153465, -0.2151738, 1, 1, 1, 1, 1,
0.338634, -0.3023308, 0.9100568, 1, 1, 1, 1, 1,
0.3392479, -0.503154, 2.469639, 1, 1, 1, 1, 1,
0.3398544, -0.1050166, 2.313344, 1, 1, 1, 1, 1,
0.3413345, -0.614023, 4.082091, 1, 1, 1, 1, 1,
0.3451767, -0.2471824, 1.942746, 1, 1, 1, 1, 1,
0.3498048, 0.0352163, 1.631839, 1, 1, 1, 1, 1,
0.3553568, -0.2295429, 1.405661, 1, 1, 1, 1, 1,
0.3569074, -0.2479612, 0.956903, 1, 1, 1, 1, 1,
0.358369, -1.120703, 0.03785575, 1, 1, 1, 1, 1,
0.3636761, -0.2227062, 3.162165, 1, 1, 1, 1, 1,
0.36767, 1.875544, 0.4301523, 0, 0, 1, 1, 1,
0.3687997, -0.5702669, 3.51237, 1, 0, 0, 1, 1,
0.3704303, -0.09572295, 1.381725, 1, 0, 0, 1, 1,
0.3704373, -2.383967, 4.026994, 1, 0, 0, 1, 1,
0.3715667, -0.6799224, 2.717343, 1, 0, 0, 1, 1,
0.3720701, 0.0477858, 1.882391, 1, 0, 0, 1, 1,
0.3806959, 2.034655, -1.104468, 0, 0, 0, 1, 1,
0.3836477, 0.9212784, -0.09875829, 0, 0, 0, 1, 1,
0.3868457, 0.7372904, -0.0345282, 0, 0, 0, 1, 1,
0.3871161, -0.4686873, 3.497233, 0, 0, 0, 1, 1,
0.3880555, -1.081043, 3.258723, 0, 0, 0, 1, 1,
0.3896032, -0.7395877, 1.661708, 0, 0, 0, 1, 1,
0.3900729, -0.2729551, 1.833241, 0, 0, 0, 1, 1,
0.3915919, -0.9674641, 2.708504, 1, 1, 1, 1, 1,
0.3916159, 0.3663045, -0.05827971, 1, 1, 1, 1, 1,
0.3952679, 0.5149966, 0.04693482, 1, 1, 1, 1, 1,
0.3968331, 0.5245434, 1.172119, 1, 1, 1, 1, 1,
0.4029486, 1.389379, 1.084875, 1, 1, 1, 1, 1,
0.4058108, 1.500662, -0.5036791, 1, 1, 1, 1, 1,
0.4099907, -2.122588, 2.197395, 1, 1, 1, 1, 1,
0.4101216, 0.6644866, 1.30849, 1, 1, 1, 1, 1,
0.4109102, 0.0961133, 2.345027, 1, 1, 1, 1, 1,
0.4162632, -2.487597, 2.332645, 1, 1, 1, 1, 1,
0.4163166, -0.8885908, 1.70536, 1, 1, 1, 1, 1,
0.4163619, -0.2249296, 3.305679, 1, 1, 1, 1, 1,
0.4166596, 1.123124, -1.275283, 1, 1, 1, 1, 1,
0.4180725, -0.06834675, 2.065576, 1, 1, 1, 1, 1,
0.4205661, -1.661411, 2.222852, 1, 1, 1, 1, 1,
0.4206248, -1.823259, 2.461414, 0, 0, 1, 1, 1,
0.4289764, 1.474875, -1.417102, 1, 0, 0, 1, 1,
0.4299842, -0.5983848, 1.498685, 1, 0, 0, 1, 1,
0.4358254, 0.1491284, 0.9249102, 1, 0, 0, 1, 1,
0.4427732, -0.1659349, 2.397291, 1, 0, 0, 1, 1,
0.4446035, 0.5888298, 2.697622, 1, 0, 0, 1, 1,
0.4468313, -1.499724, 3.504821, 0, 0, 0, 1, 1,
0.4475896, -1.531847, 2.914589, 0, 0, 0, 1, 1,
0.4496879, 0.7242889, 0.3861914, 0, 0, 0, 1, 1,
0.454064, -0.4661243, 3.326456, 0, 0, 0, 1, 1,
0.4584253, -0.3858597, 2.225623, 0, 0, 0, 1, 1,
0.4629487, 0.3152599, 1.461493, 0, 0, 0, 1, 1,
0.4656831, -0.7495005, 0.3077219, 0, 0, 0, 1, 1,
0.4672313, -1.84704, 2.210526, 1, 1, 1, 1, 1,
0.4676469, -0.6311544, 1.747275, 1, 1, 1, 1, 1,
0.4695455, 0.1048148, 1.769848, 1, 1, 1, 1, 1,
0.4696125, 0.2363578, 1.166238, 1, 1, 1, 1, 1,
0.4709583, 0.4814059, -0.8831924, 1, 1, 1, 1, 1,
0.4736098, 0.01267206, 1.981432, 1, 1, 1, 1, 1,
0.4737516, -0.1476597, 2.030447, 1, 1, 1, 1, 1,
0.4757216, -0.4012239, 2.203131, 1, 1, 1, 1, 1,
0.4788582, 0.9287434, 1.316162, 1, 1, 1, 1, 1,
0.4830601, -1.117479, 2.148834, 1, 1, 1, 1, 1,
0.4859557, 1.023424, 0.8084717, 1, 1, 1, 1, 1,
0.4866277, 0.22161, 0.4643942, 1, 1, 1, 1, 1,
0.4911886, 2.403802, 0.8502378, 1, 1, 1, 1, 1,
0.4940472, 0.8159292, 0.7670096, 1, 1, 1, 1, 1,
0.4985752, 0.2865999, -0.2968484, 1, 1, 1, 1, 1,
0.499832, 1.238499, 1.563865, 0, 0, 1, 1, 1,
0.5016381, 0.2845584, 0.9025985, 1, 0, 0, 1, 1,
0.5096237, -0.01332363, 0.299373, 1, 0, 0, 1, 1,
0.5146599, -0.02021652, 1.442039, 1, 0, 0, 1, 1,
0.5170188, 0.5415249, 0.1591036, 1, 0, 0, 1, 1,
0.520515, -1.521113, 2.765229, 1, 0, 0, 1, 1,
0.5257483, 1.1843, -0.6910107, 0, 0, 0, 1, 1,
0.5260866, 0.3195134, 0.0914062, 0, 0, 0, 1, 1,
0.5289479, 0.5530295, 0.746141, 0, 0, 0, 1, 1,
0.530493, 0.7005935, 0.1590544, 0, 0, 0, 1, 1,
0.5364797, -0.8785586, 3.916004, 0, 0, 0, 1, 1,
0.5380364, -1.91468, 2.793637, 0, 0, 0, 1, 1,
0.5388744, 0.5089835, 0.8315477, 0, 0, 0, 1, 1,
0.5423936, -0.151715, 2.688071, 1, 1, 1, 1, 1,
0.5449416, -1.177324, 2.032077, 1, 1, 1, 1, 1,
0.5456977, -1.747874, 2.894143, 1, 1, 1, 1, 1,
0.5509181, -1.298019, 3.489492, 1, 1, 1, 1, 1,
0.5525959, -0.10248, 0.9231167, 1, 1, 1, 1, 1,
0.5583407, 0.3519923, -0.4965029, 1, 1, 1, 1, 1,
0.5600758, -0.3005927, 1.840733, 1, 1, 1, 1, 1,
0.5617675, 1.700132, -0.8111088, 1, 1, 1, 1, 1,
0.5631502, 0.707322, 0.6949269, 1, 1, 1, 1, 1,
0.5647039, -0.8599708, 1.54787, 1, 1, 1, 1, 1,
0.5693458, 1.324587, 0.24548, 1, 1, 1, 1, 1,
0.5703299, 1.169972, 1.562289, 1, 1, 1, 1, 1,
0.5728362, -0.6507154, 1.193477, 1, 1, 1, 1, 1,
0.5729175, 1.378519, 2.262241, 1, 1, 1, 1, 1,
0.5777006, -0.2432554, 1.107669, 1, 1, 1, 1, 1,
0.5823711, -1.73583, 3.061573, 0, 0, 1, 1, 1,
0.5865377, 0.1670159, 0.7775601, 1, 0, 0, 1, 1,
0.5960217, 0.6297347, 0.9049537, 1, 0, 0, 1, 1,
0.6005391, -1.07098, 2.409787, 1, 0, 0, 1, 1,
0.6050575, 0.9994727, -1.099381, 1, 0, 0, 1, 1,
0.6055384, -0.9708756, 3.556536, 1, 0, 0, 1, 1,
0.6081324, 2.553041, -0.3936015, 0, 0, 0, 1, 1,
0.6081765, 1.512351, 0.7037551, 0, 0, 0, 1, 1,
0.61406, -0.9270817, 1.731041, 0, 0, 0, 1, 1,
0.6175614, -0.8263174, 2.44547, 0, 0, 0, 1, 1,
0.6220441, -0.08396057, 1.924611, 0, 0, 0, 1, 1,
0.6247112, 0.5453537, 1.267622, 0, 0, 0, 1, 1,
0.6282293, -0.81241, 1.771729, 0, 0, 0, 1, 1,
0.6315439, 0.3590823, 0.6037139, 1, 1, 1, 1, 1,
0.632921, 0.4682533, 1.921292, 1, 1, 1, 1, 1,
0.6333637, -1.142315, 1.908008, 1, 1, 1, 1, 1,
0.6346081, 0.5290228, 0.5108613, 1, 1, 1, 1, 1,
0.635617, -0.7284731, 1.649273, 1, 1, 1, 1, 1,
0.6387897, -1.291859, 1.935734, 1, 1, 1, 1, 1,
0.6425349, -1.624374, 1.856879, 1, 1, 1, 1, 1,
0.6445418, -1.574651, 3.084876, 1, 1, 1, 1, 1,
0.6493461, 1.019777, -0.2220427, 1, 1, 1, 1, 1,
0.6544169, 0.1471722, -0.4917685, 1, 1, 1, 1, 1,
0.6590241, -0.582746, 1.891602, 1, 1, 1, 1, 1,
0.6595303, 1.215007, 1.074611, 1, 1, 1, 1, 1,
0.6602867, -0.2815247, 0.2677507, 1, 1, 1, 1, 1,
0.6603011, -0.6335637, 2.673896, 1, 1, 1, 1, 1,
0.6665958, -0.5083371, 2.542064, 1, 1, 1, 1, 1,
0.6667077, 0.604469, 0.3160404, 0, 0, 1, 1, 1,
0.6687528, -0.9348263, 3.244949, 1, 0, 0, 1, 1,
0.6827539, 0.3865698, 0.7833452, 1, 0, 0, 1, 1,
0.6836446, -2.017291, 4.097583, 1, 0, 0, 1, 1,
0.6843687, 0.4617091, 0.5004119, 1, 0, 0, 1, 1,
0.6864501, 2.049305, 2.720914, 1, 0, 0, 1, 1,
0.6870819, -1.336815, 3.225244, 0, 0, 0, 1, 1,
0.687644, -0.9679652, 2.141636, 0, 0, 0, 1, 1,
0.6915257, 0.007962056, 2.279876, 0, 0, 0, 1, 1,
0.6992269, 1.286957, -1.311303, 0, 0, 0, 1, 1,
0.7009638, 0.2561383, 1.715821, 0, 0, 0, 1, 1,
0.7030343, -0.6813954, 3.332829, 0, 0, 0, 1, 1,
0.703667, 0.3755872, 2.509478, 0, 0, 0, 1, 1,
0.7072299, 0.2685122, 2.322559, 1, 1, 1, 1, 1,
0.7077804, 0.7667344, 1.019743, 1, 1, 1, 1, 1,
0.7083935, -0.1119564, 1.082906, 1, 1, 1, 1, 1,
0.7090898, -1.118099, 2.791573, 1, 1, 1, 1, 1,
0.7093111, 0.3721106, 0.3493886, 1, 1, 1, 1, 1,
0.7179753, -1.258563, 3.826365, 1, 1, 1, 1, 1,
0.7269636, 0.3296909, 1.218493, 1, 1, 1, 1, 1,
0.7328699, 1.355703, 2.296261, 1, 1, 1, 1, 1,
0.7401801, -0.4787783, 1.272536, 1, 1, 1, 1, 1,
0.7433077, 0.8662419, -0.3731664, 1, 1, 1, 1, 1,
0.7486251, 2.518789, 0.8497722, 1, 1, 1, 1, 1,
0.7501429, 0.06122986, 0.7197443, 1, 1, 1, 1, 1,
0.7518862, -0.7744178, 1.233569, 1, 1, 1, 1, 1,
0.7556256, 2.341001, 2.036409, 1, 1, 1, 1, 1,
0.7680335, 1.898653, 0.6565321, 1, 1, 1, 1, 1,
0.7722705, 0.4933662, 1.308652, 0, 0, 1, 1, 1,
0.7760191, 0.1862301, -2.027631, 1, 0, 0, 1, 1,
0.7769518, -0.1747435, 1.322423, 1, 0, 0, 1, 1,
0.7873546, -0.08340478, 1.836819, 1, 0, 0, 1, 1,
0.790402, 1.57319, 2.699553, 1, 0, 0, 1, 1,
0.7927703, 0.5614034, 0.8522232, 1, 0, 0, 1, 1,
0.7950369, 0.8380851, -1.040933, 0, 0, 0, 1, 1,
0.797593, -1.563324, 1.59834, 0, 0, 0, 1, 1,
0.8002831, -0.8497781, 1.005059, 0, 0, 0, 1, 1,
0.8039578, -0.4227423, 1.572968, 0, 0, 0, 1, 1,
0.8041462, 0.2624487, 1.163536, 0, 0, 0, 1, 1,
0.8169007, -0.8411443, 2.473253, 0, 0, 0, 1, 1,
0.8223377, -0.598483, 1.647573, 0, 0, 0, 1, 1,
0.8229113, 0.7197587, 0.5379218, 1, 1, 1, 1, 1,
0.8261192, 1.135662, 1.444528, 1, 1, 1, 1, 1,
0.8313195, 0.0221862, 1.508559, 1, 1, 1, 1, 1,
0.8328767, 0.3681155, 0.8636163, 1, 1, 1, 1, 1,
0.838107, -0.3880628, 2.410638, 1, 1, 1, 1, 1,
0.8397247, -0.7114141, 0.1775969, 1, 1, 1, 1, 1,
0.8423795, 1.330917, -0.1558439, 1, 1, 1, 1, 1,
0.8476459, -0.4291622, -0.0735644, 1, 1, 1, 1, 1,
0.8510496, 1.045382, 0.6865534, 1, 1, 1, 1, 1,
0.8586857, 0.1516103, 1.345415, 1, 1, 1, 1, 1,
0.8625083, -0.9602375, 1.486563, 1, 1, 1, 1, 1,
0.8668575, 1.34738, 1.999388, 1, 1, 1, 1, 1,
0.8688237, 0.1699799, 1.390634, 1, 1, 1, 1, 1,
0.8751013, 1.264096, 0.8773074, 1, 1, 1, 1, 1,
0.8752996, 0.8990204, 1.29508, 1, 1, 1, 1, 1,
0.8790806, -1.116062, 4.169482, 0, 0, 1, 1, 1,
0.8797511, 1.513522, 0.8942822, 1, 0, 0, 1, 1,
0.8818925, 0.1500151, 0.6738027, 1, 0, 0, 1, 1,
0.89219, 0.5373212, 0.06565951, 1, 0, 0, 1, 1,
0.8953241, -0.6763628, 1.707509, 1, 0, 0, 1, 1,
0.8989254, 0.7574769, 1.491609, 1, 0, 0, 1, 1,
0.8994861, -0.2692998, 2.377664, 0, 0, 0, 1, 1,
0.9058526, -0.1101376, 1.453258, 0, 0, 0, 1, 1,
0.9073246, -0.2281297, 1.566923, 0, 0, 0, 1, 1,
0.9111373, -0.9283843, 1.702154, 0, 0, 0, 1, 1,
0.9205351, 1.470708, 1.171989, 0, 0, 0, 1, 1,
0.9222878, 0.909175, 0.69318, 0, 0, 0, 1, 1,
0.9235622, -0.1519735, 2.481327, 0, 0, 0, 1, 1,
0.9235728, 0.7813782, -1.715346, 1, 1, 1, 1, 1,
0.9254592, 0.6402997, -0.4674046, 1, 1, 1, 1, 1,
0.9267463, 0.8622528, 0.1980672, 1, 1, 1, 1, 1,
0.9295859, -1.821753, 2.824526, 1, 1, 1, 1, 1,
0.9303155, -1.037979, 3.061516, 1, 1, 1, 1, 1,
0.9440274, -0.04146522, 1.590097, 1, 1, 1, 1, 1,
0.944726, -0.2086529, 0.1868152, 1, 1, 1, 1, 1,
0.9453747, 0.01740049, 0.4535475, 1, 1, 1, 1, 1,
0.9461806, -0.8771791, 2.47591, 1, 1, 1, 1, 1,
0.9517646, -0.7207111, 3.37028, 1, 1, 1, 1, 1,
0.9523114, 0.4287128, 0.8037119, 1, 1, 1, 1, 1,
0.9527029, -0.5393959, 2.47126, 1, 1, 1, 1, 1,
0.961829, -0.7230023, 2.753719, 1, 1, 1, 1, 1,
0.9619279, -0.2508651, 1.652132, 1, 1, 1, 1, 1,
0.963272, 0.3674245, 1.436578, 1, 1, 1, 1, 1,
0.9671963, 0.3308622, 1.17833, 0, 0, 1, 1, 1,
0.9686353, 0.2590429, 1.351638, 1, 0, 0, 1, 1,
0.971025, -0.5577902, 1.78554, 1, 0, 0, 1, 1,
0.9753679, -0.222437, 0.2344687, 1, 0, 0, 1, 1,
0.9789826, 0.4778174, -0.7571632, 1, 0, 0, 1, 1,
0.9810007, -1.048325, 3.354582, 1, 0, 0, 1, 1,
0.9848857, -1.201705, 2.543574, 0, 0, 0, 1, 1,
0.9893043, -0.07501221, 0.574412, 0, 0, 0, 1, 1,
0.9927389, 0.9396765, 1.703808, 0, 0, 0, 1, 1,
0.9945946, -1.467944, 1.32524, 0, 0, 0, 1, 1,
0.9967121, -0.6340998, 2.210187, 0, 0, 0, 1, 1,
0.997245, -0.5188562, 0.7821823, 0, 0, 0, 1, 1,
1.00888, 0.8948168, 1.089051, 0, 0, 0, 1, 1,
1.010466, 0.2940752, 0.6869141, 1, 1, 1, 1, 1,
1.011317, 0.6589767, 4.07586, 1, 1, 1, 1, 1,
1.030455, -1.753459, 2.544297, 1, 1, 1, 1, 1,
1.034819, -0.6073995, 1.44601, 1, 1, 1, 1, 1,
1.039082, 0.1264982, 2.651826, 1, 1, 1, 1, 1,
1.057107, 1.323899, -0.4354002, 1, 1, 1, 1, 1,
1.062805, 0.6478852, -0.4938307, 1, 1, 1, 1, 1,
1.069275, -0.183089, 2.80952, 1, 1, 1, 1, 1,
1.076534, -0.4165914, 2.009641, 1, 1, 1, 1, 1,
1.078015, 0.1786035, 2.06706, 1, 1, 1, 1, 1,
1.083312, -0.5098303, 3.004413, 1, 1, 1, 1, 1,
1.08478, -1.968265, 3.678338, 1, 1, 1, 1, 1,
1.090506, 0.08521511, 2.558232, 1, 1, 1, 1, 1,
1.096347, 0.8100098, -0.8220653, 1, 1, 1, 1, 1,
1.097452, -0.2607295, 2.645812, 1, 1, 1, 1, 1,
1.107725, -0.5126796, 3.384273, 0, 0, 1, 1, 1,
1.111588, 0.194864, 3.75056, 1, 0, 0, 1, 1,
1.118834, 0.2202481, 1.901589, 1, 0, 0, 1, 1,
1.119098, 1.199069, -1.340795, 1, 0, 0, 1, 1,
1.120021, -0.2599798, 2.91256, 1, 0, 0, 1, 1,
1.12211, 0.666406, 0.1289494, 1, 0, 0, 1, 1,
1.126566, -2.004254, 3.136904, 0, 0, 0, 1, 1,
1.128542, 0.1349798, -1.158982, 0, 0, 0, 1, 1,
1.132132, -2.131994, 1.949528, 0, 0, 0, 1, 1,
1.132498, -1.169006, 2.869211, 0, 0, 0, 1, 1,
1.13321, 0.4269983, 0.7534214, 0, 0, 0, 1, 1,
1.145626, -1.147347, 1.068334, 0, 0, 0, 1, 1,
1.158516, -0.2972909, 2.105433, 0, 0, 0, 1, 1,
1.165558, -0.5839736, 1.965741, 1, 1, 1, 1, 1,
1.165619, -0.4390786, 1.384556, 1, 1, 1, 1, 1,
1.172238, -0.09903959, 1.544491, 1, 1, 1, 1, 1,
1.17267, -0.3332742, 2.681913, 1, 1, 1, 1, 1,
1.175241, -1.526971, 3.123245, 1, 1, 1, 1, 1,
1.18123, -0.1477269, 2.726999, 1, 1, 1, 1, 1,
1.181533, 0.06834418, 2.207776, 1, 1, 1, 1, 1,
1.185224, -0.2370971, 1.968224, 1, 1, 1, 1, 1,
1.192176, 0.5266554, 0.7227544, 1, 1, 1, 1, 1,
1.195473, 0.3706286, -0.287062, 1, 1, 1, 1, 1,
1.20525, 0.1716153, 3.25606, 1, 1, 1, 1, 1,
1.205662, 0.01107487, 1.702929, 1, 1, 1, 1, 1,
1.206419, 0.2396045, 1.785841, 1, 1, 1, 1, 1,
1.208788, 1.363053, 1.635861, 1, 1, 1, 1, 1,
1.215227, 0.4917959, 0.6009306, 1, 1, 1, 1, 1,
1.219124, 1.022879, 0.4075973, 0, 0, 1, 1, 1,
1.265306, 1.442374, 1.164122, 1, 0, 0, 1, 1,
1.273347, -0.2361243, 0.3990004, 1, 0, 0, 1, 1,
1.281667, 0.06826333, 3.039127, 1, 0, 0, 1, 1,
1.281946, -0.4610353, 0.7395763, 1, 0, 0, 1, 1,
1.292809, -0.2138691, 1.265998, 1, 0, 0, 1, 1,
1.298873, 0.7439811, 0.5525293, 0, 0, 0, 1, 1,
1.301841, 0.797073, 2.273091, 0, 0, 0, 1, 1,
1.306437, -1.440992, 2.708634, 0, 0, 0, 1, 1,
1.308248, -0.3615316, 0.7081711, 0, 0, 0, 1, 1,
1.308603, -1.612661, 2.344663, 0, 0, 0, 1, 1,
1.335687, 0.2577324, 0.03675165, 0, 0, 0, 1, 1,
1.336287, -1.020403, 2.847572, 0, 0, 0, 1, 1,
1.340805, 1.267656, 1.660866, 1, 1, 1, 1, 1,
1.342675, 0.6798364, -0.6572984, 1, 1, 1, 1, 1,
1.35005, 0.2779588, 1.434027, 1, 1, 1, 1, 1,
1.374086, -0.1952993, 3.149885, 1, 1, 1, 1, 1,
1.379717, -1.482775, 3.197755, 1, 1, 1, 1, 1,
1.389262, -0.2969564, 2.488699, 1, 1, 1, 1, 1,
1.389798, 1.60167, -0.02988698, 1, 1, 1, 1, 1,
1.395801, 0.3433296, 2.57958, 1, 1, 1, 1, 1,
1.396918, 0.08454883, 0.5082977, 1, 1, 1, 1, 1,
1.400021, -1.396574, 3.32124, 1, 1, 1, 1, 1,
1.404319, -0.009673516, 2.787242, 1, 1, 1, 1, 1,
1.419188, 1.260143, 0.2294502, 1, 1, 1, 1, 1,
1.426334, 1.809581, -0.5305732, 1, 1, 1, 1, 1,
1.43658, 0.9675804, -0.5659456, 1, 1, 1, 1, 1,
1.440446, 0.2619778, 1.143435, 1, 1, 1, 1, 1,
1.443339, 1.399133, 0.880213, 0, 0, 1, 1, 1,
1.444117, -1.10561, 3.010568, 1, 0, 0, 1, 1,
1.462731, -0.3924293, 0.9842495, 1, 0, 0, 1, 1,
1.464272, -2.122016, 3.040689, 1, 0, 0, 1, 1,
1.471447, 0.3066937, 1.037902, 1, 0, 0, 1, 1,
1.481789, -1.056736, 3.206906, 1, 0, 0, 1, 1,
1.4875, 2.498649, 1.212091, 0, 0, 0, 1, 1,
1.5021, 0.3056214, 1.978962, 0, 0, 0, 1, 1,
1.506132, -2.271131, 2.840953, 0, 0, 0, 1, 1,
1.507952, 0.6834332, 0.4315811, 0, 0, 0, 1, 1,
1.508316, -0.1030821, 1.040959, 0, 0, 0, 1, 1,
1.518799, -0.08456548, 1.108632, 0, 0, 0, 1, 1,
1.531633, 0.3525793, 0.8452156, 0, 0, 0, 1, 1,
1.541998, 0.4595336, 2.584834, 1, 1, 1, 1, 1,
1.542941, 1.476683, 0.260022, 1, 1, 1, 1, 1,
1.547188, -1.274648, 0.8816658, 1, 1, 1, 1, 1,
1.553267, -0.8128787, 1.968733, 1, 1, 1, 1, 1,
1.590111, -0.1844783, 0.1174619, 1, 1, 1, 1, 1,
1.599507, -0.7383446, 2.629658, 1, 1, 1, 1, 1,
1.609757, 0.8236336, 2.633695, 1, 1, 1, 1, 1,
1.619966, 0.01266218, 0.07933891, 1, 1, 1, 1, 1,
1.622143, -1.064697, 2.052315, 1, 1, 1, 1, 1,
1.622392, 1.170503, -0.1061242, 1, 1, 1, 1, 1,
1.628018, 0.0426251, 1.334035, 1, 1, 1, 1, 1,
1.645222, -0.6020529, 3.04618, 1, 1, 1, 1, 1,
1.65411, 0.4660341, 1.965688, 1, 1, 1, 1, 1,
1.663624, -0.2092839, -0.3141055, 1, 1, 1, 1, 1,
1.666477, -0.3448012, 3.867096, 1, 1, 1, 1, 1,
1.69125, 0.8319286, 0.5059613, 0, 0, 1, 1, 1,
1.708171, 0.797276, 2.635077, 1, 0, 0, 1, 1,
1.710455, 0.8818514, 3.236283, 1, 0, 0, 1, 1,
1.710754, 0.6824685, 1.5977, 1, 0, 0, 1, 1,
1.735693, -0.1796418, 0.04181398, 1, 0, 0, 1, 1,
1.744072, 0.8848938, -0.09700961, 1, 0, 0, 1, 1,
1.760327, 0.1881684, 0.8301168, 0, 0, 0, 1, 1,
1.777425, 1.610797, 0.8769947, 0, 0, 0, 1, 1,
1.782678, 1.662763, 2.341059, 0, 0, 0, 1, 1,
1.788402, 0.07956565, 0.5380354, 0, 0, 0, 1, 1,
1.802436, -1.416973, 3.080349, 0, 0, 0, 1, 1,
1.810331, 1.170028, 1.897483, 0, 0, 0, 1, 1,
1.834902, -0.8541777, 1.333472, 0, 0, 0, 1, 1,
1.8454, -0.7302511, 1.944306, 1, 1, 1, 1, 1,
1.846531, -1.282128, 3.323028, 1, 1, 1, 1, 1,
1.895171, -1.653385, 2.561628, 1, 1, 1, 1, 1,
1.898282, -0.3589965, 1.684967, 1, 1, 1, 1, 1,
1.927023, -0.9958558, -0.2195714, 1, 1, 1, 1, 1,
1.975636, 0.7870214, 2.300695, 1, 1, 1, 1, 1,
1.986884, -1.04336, 2.191304, 1, 1, 1, 1, 1,
1.990845, 0.7463655, -1.115325, 1, 1, 1, 1, 1,
2.012112, -1.548211, 1.260344, 1, 1, 1, 1, 1,
2.045475, -0.3740893, 0.03835463, 1, 1, 1, 1, 1,
2.081891, 0.2342607, 1.314249, 1, 1, 1, 1, 1,
2.100736, 0.1643358, 1.756765, 1, 1, 1, 1, 1,
2.127886, 0.799015, 0.170751, 1, 1, 1, 1, 1,
2.14676, 0.2736122, 1.744646, 1, 1, 1, 1, 1,
2.168331, 1.355644, 1.030477, 1, 1, 1, 1, 1,
2.172125, 0.1435273, 0.7565115, 0, 0, 1, 1, 1,
2.24912, 0.9701263, 1.509115, 1, 0, 0, 1, 1,
2.277256, -0.04279142, 1.347069, 1, 0, 0, 1, 1,
2.290529, 0.5319116, 1.483654, 1, 0, 0, 1, 1,
2.321713, -0.0844917, 2.351313, 1, 0, 0, 1, 1,
2.330999, -0.7639733, 2.194574, 1, 0, 0, 1, 1,
2.332877, -0.8656867, 4.557872, 0, 0, 0, 1, 1,
2.348705, 0.5387174, 0.8412389, 0, 0, 0, 1, 1,
2.350831, 0.5516714, 1.669371, 0, 0, 0, 1, 1,
2.360204, -0.2488009, 0.772068, 0, 0, 0, 1, 1,
2.382025, -1.296713, 0.2193256, 0, 0, 0, 1, 1,
2.385996, 1.075695, -0.7397685, 0, 0, 0, 1, 1,
2.445774, -0.9441735, 1.520376, 0, 0, 0, 1, 1,
2.505013, 0.1940292, 0.773983, 1, 1, 1, 1, 1,
2.521586, -0.3238671, 2.305119, 1, 1, 1, 1, 1,
2.549939, 0.1330789, 2.001151, 1, 1, 1, 1, 1,
2.751416, -1.170057, 0.7730657, 1, 1, 1, 1, 1,
2.940291, 0.1570018, 0.6705006, 1, 1, 1, 1, 1,
2.983405, 1.279416, 1.112322, 1, 1, 1, 1, 1,
3.105531, 1.491803, -0.5824847, 1, 1, 1, 1, 1
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
var radius = 9.788933;
var distance = 34.38321;
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
mvMatrix.translate( 0.03652716, -0.2064556, -0.6542525 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.38321);
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