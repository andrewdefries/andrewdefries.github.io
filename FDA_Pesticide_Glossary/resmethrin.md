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
-3.484898, 0.6446604, -2.598486, 1, 0, 0, 1,
-2.495885, -0.1818729, -2.388817, 1, 0.007843138, 0, 1,
-2.434792, 1.216826, -2.232074, 1, 0.01176471, 0, 1,
-2.387142, 1.66116, -0.2079643, 1, 0.01960784, 0, 1,
-2.370842, 1.484452, -2.668787, 1, 0.02352941, 0, 1,
-2.348821, 0.5610414, -0.6800911, 1, 0.03137255, 0, 1,
-2.343746, 1.301906, -2.940247, 1, 0.03529412, 0, 1,
-2.319907, 0.923512, -0.828915, 1, 0.04313726, 0, 1,
-2.201015, 1.156325, 0.7600518, 1, 0.04705882, 0, 1,
-2.157448, -0.2084044, -2.139422, 1, 0.05490196, 0, 1,
-2.136937, -0.7094878, -0.942925, 1, 0.05882353, 0, 1,
-2.136016, -0.2088532, -2.353025, 1, 0.06666667, 0, 1,
-2.127399, 1.65432, -0.2502795, 1, 0.07058824, 0, 1,
-2.102476, -1.247692, -1.769535, 1, 0.07843138, 0, 1,
-2.093823, 0.7050035, -1.116953, 1, 0.08235294, 0, 1,
-2.085324, 1.175776, -0.4297849, 1, 0.09019608, 0, 1,
-2.081025, 0.3844832, -2.902449, 1, 0.09411765, 0, 1,
-2.069229, -0.4848993, -1.565946, 1, 0.1019608, 0, 1,
-2.036657, 2.372012, -0.4524713, 1, 0.1098039, 0, 1,
-2.029285, -0.0409827, -3.342482, 1, 0.1137255, 0, 1,
-2.004078, -0.8510284, -1.361136, 1, 0.1215686, 0, 1,
-2.003984, -1.605614, -1.665981, 1, 0.1254902, 0, 1,
-1.988842, -1.534363, -2.422561, 1, 0.1333333, 0, 1,
-1.988185, -0.03665869, -1.986152, 1, 0.1372549, 0, 1,
-1.963497, -1.03371, -2.214928, 1, 0.145098, 0, 1,
-1.957834, -1.171364, -3.084628, 1, 0.1490196, 0, 1,
-1.931942, 1.25349, -0.2529348, 1, 0.1568628, 0, 1,
-1.901655, -1.717649, -1.826786, 1, 0.1607843, 0, 1,
-1.860469, -0.4200656, -0.5507742, 1, 0.1686275, 0, 1,
-1.859151, -1.181226, -2.129591, 1, 0.172549, 0, 1,
-1.851059, 2.082934, -0.1216417, 1, 0.1803922, 0, 1,
-1.849799, -0.04141614, -1.542016, 1, 0.1843137, 0, 1,
-1.843748, 1.83743, 0.03844447, 1, 0.1921569, 0, 1,
-1.834398, 0.488953, -2.184697, 1, 0.1960784, 0, 1,
-1.82748, -0.7501358, -2.026333, 1, 0.2039216, 0, 1,
-1.791246, 0.1066714, -1.037365, 1, 0.2117647, 0, 1,
-1.781231, -0.1419444, -1.031474, 1, 0.2156863, 0, 1,
-1.780309, -1.390209, -3.232163, 1, 0.2235294, 0, 1,
-1.76775, 0.5216642, -0.4249941, 1, 0.227451, 0, 1,
-1.767563, -0.6745942, -1.060004, 1, 0.2352941, 0, 1,
-1.765278, 0.2492085, -2.247364, 1, 0.2392157, 0, 1,
-1.761973, -0.7345182, -2.568283, 1, 0.2470588, 0, 1,
-1.753617, -0.8430645, -2.629103, 1, 0.2509804, 0, 1,
-1.700412, -0.2052148, 0.04040099, 1, 0.2588235, 0, 1,
-1.685717, -0.9018934, -1.795541, 1, 0.2627451, 0, 1,
-1.66338, 0.308232, -1.308578, 1, 0.2705882, 0, 1,
-1.662341, 1.422936, -0.5474471, 1, 0.2745098, 0, 1,
-1.63079, 0.3871555, -1.299364, 1, 0.282353, 0, 1,
-1.630484, -0.1556505, -0.554004, 1, 0.2862745, 0, 1,
-1.622689, -1.255357, -4.23066, 1, 0.2941177, 0, 1,
-1.620863, 0.8529601, -0.9394169, 1, 0.3019608, 0, 1,
-1.620348, -0.1592118, -0.9807991, 1, 0.3058824, 0, 1,
-1.612518, 1.528168, -1.490199, 1, 0.3137255, 0, 1,
-1.594197, -2.212703, -4.128159, 1, 0.3176471, 0, 1,
-1.593101, -2.25801, -3.516605, 1, 0.3254902, 0, 1,
-1.577809, 1.760459, -0.5953729, 1, 0.3294118, 0, 1,
-1.569214, -0.9315568, 0.1268945, 1, 0.3372549, 0, 1,
-1.553168, -1.08173, -2.374769, 1, 0.3411765, 0, 1,
-1.527716, 1.081746, -2.583658, 1, 0.3490196, 0, 1,
-1.523049, -1.408597, -1.741781, 1, 0.3529412, 0, 1,
-1.522137, -1.681953, -2.707499, 1, 0.3607843, 0, 1,
-1.521648, 0.03518679, -1.42994, 1, 0.3647059, 0, 1,
-1.516456, -0.5777995, -3.007031, 1, 0.372549, 0, 1,
-1.508595, -1.268196, -1.878384, 1, 0.3764706, 0, 1,
-1.506672, -0.3717352, -2.609455, 1, 0.3843137, 0, 1,
-1.502631, -0.9868055, -0.02981231, 1, 0.3882353, 0, 1,
-1.490395, 0.2573261, -1.412226, 1, 0.3960784, 0, 1,
-1.490312, -0.8203663, -3.204457, 1, 0.4039216, 0, 1,
-1.48736, 1.184818, -1.463243, 1, 0.4078431, 0, 1,
-1.484246, 1.032924, -1.245516, 1, 0.4156863, 0, 1,
-1.48117, -2.345377, -1.8621, 1, 0.4196078, 0, 1,
-1.47935, -1.683596, -2.045236, 1, 0.427451, 0, 1,
-1.476923, -0.2595233, -1.015019, 1, 0.4313726, 0, 1,
-1.47489, -0.4485503, -3.416446, 1, 0.4392157, 0, 1,
-1.460046, -1.226149, -2.180327, 1, 0.4431373, 0, 1,
-1.457111, -0.3988256, -1.739026, 1, 0.4509804, 0, 1,
-1.45552, -0.5086582, -0.6898695, 1, 0.454902, 0, 1,
-1.453748, -0.9803548, -1.378085, 1, 0.4627451, 0, 1,
-1.451877, 0.7254772, 0.476307, 1, 0.4666667, 0, 1,
-1.448655, 0.809064, -0.8476508, 1, 0.4745098, 0, 1,
-1.44553, 0.8656067, -2.956811, 1, 0.4784314, 0, 1,
-1.433773, 1.980167, -1.563431, 1, 0.4862745, 0, 1,
-1.417724, 1.114454, 0.3278607, 1, 0.4901961, 0, 1,
-1.402106, 0.5487341, -1.729173, 1, 0.4980392, 0, 1,
-1.395741, -0.3965584, -2.097477, 1, 0.5058824, 0, 1,
-1.394518, 1.554795, -0.2576681, 1, 0.509804, 0, 1,
-1.390321, -0.9946248, -2.258837, 1, 0.5176471, 0, 1,
-1.381681, 0.3492037, -1.401611, 1, 0.5215687, 0, 1,
-1.368086, 1.511185, -1.263408, 1, 0.5294118, 0, 1,
-1.367442, 0.9198817, -2.477743, 1, 0.5333334, 0, 1,
-1.366617, 0.7657793, -0.4262097, 1, 0.5411765, 0, 1,
-1.364735, 0.109635, 0.3590434, 1, 0.5450981, 0, 1,
-1.357072, -0.2200475, -2.762828, 1, 0.5529412, 0, 1,
-1.342732, -1.895186, -1.940192, 1, 0.5568628, 0, 1,
-1.335314, 0.7035071, -0.5627336, 1, 0.5647059, 0, 1,
-1.328248, 0.005939142, -2.362393, 1, 0.5686275, 0, 1,
-1.327426, 0.4350832, -0.5637066, 1, 0.5764706, 0, 1,
-1.32347, -0.9460868, -2.81775, 1, 0.5803922, 0, 1,
-1.315373, -0.9405239, -0.662511, 1, 0.5882353, 0, 1,
-1.312986, 0.8753687, 0.462363, 1, 0.5921569, 0, 1,
-1.308563, -1.03849, -4.033778, 1, 0.6, 0, 1,
-1.306917, 0.1717202, -1.087912, 1, 0.6078432, 0, 1,
-1.305431, -0.9013305, -3.969951, 1, 0.6117647, 0, 1,
-1.305178, 0.9873118, -1.661844, 1, 0.6196079, 0, 1,
-1.304864, 0.3055888, -1.700414, 1, 0.6235294, 0, 1,
-1.30241, -1.434376, -3.774394, 1, 0.6313726, 0, 1,
-1.297448, -1.32327, -1.592351, 1, 0.6352941, 0, 1,
-1.296843, -0.717237, -2.358242, 1, 0.6431373, 0, 1,
-1.294117, -0.542888, -1.283214, 1, 0.6470588, 0, 1,
-1.289035, 1.377891, -0.7106237, 1, 0.654902, 0, 1,
-1.288252, 0.5539513, -2.743036, 1, 0.6588235, 0, 1,
-1.285778, -0.359585, -0.9146748, 1, 0.6666667, 0, 1,
-1.285675, 0.3895652, -1.246093, 1, 0.6705883, 0, 1,
-1.272807, -0.04842977, -2.829664, 1, 0.6784314, 0, 1,
-1.269146, 0.8551304, -0.2418847, 1, 0.682353, 0, 1,
-1.266394, -1.426207, -2.265667, 1, 0.6901961, 0, 1,
-1.259847, -0.03369606, -2.076851, 1, 0.6941177, 0, 1,
-1.258552, -1.401186, -3.656808, 1, 0.7019608, 0, 1,
-1.251325, 1.361919, -1.269866, 1, 0.7098039, 0, 1,
-1.238014, 0.5862199, -0.7249737, 1, 0.7137255, 0, 1,
-1.223436, -0.631806, -1.684608, 1, 0.7215686, 0, 1,
-1.215835, -1.667667, -2.541348, 1, 0.7254902, 0, 1,
-1.213025, -0.4110159, -1.361576, 1, 0.7333333, 0, 1,
-1.212436, -0.7892888, -2.551697, 1, 0.7372549, 0, 1,
-1.202739, 0.8532436, -1.0213, 1, 0.7450981, 0, 1,
-1.199554, -0.6540851, -2.311215, 1, 0.7490196, 0, 1,
-1.193759, 0.2120356, -0.722699, 1, 0.7568628, 0, 1,
-1.189565, -1.516045, -2.457086, 1, 0.7607843, 0, 1,
-1.159636, -0.8034039, -2.757593, 1, 0.7686275, 0, 1,
-1.158785, -0.1013626, -1.494896, 1, 0.772549, 0, 1,
-1.151909, 1.664117, -0.3928769, 1, 0.7803922, 0, 1,
-1.144291, -0.1350414, -1.824308, 1, 0.7843137, 0, 1,
-1.136974, -0.6397433, -2.920715, 1, 0.7921569, 0, 1,
-1.133344, 0.8640168, -1.516875, 1, 0.7960784, 0, 1,
-1.132849, -0.03111682, -1.842539, 1, 0.8039216, 0, 1,
-1.123919, -1.088944, -2.960195, 1, 0.8117647, 0, 1,
-1.113366, 0.4266311, 0.248334, 1, 0.8156863, 0, 1,
-1.112414, 0.8614044, 1.330462, 1, 0.8235294, 0, 1,
-1.10858, -0.5543848, -2.147112, 1, 0.827451, 0, 1,
-1.099332, 1.827003, -1.509054, 1, 0.8352941, 0, 1,
-1.093218, -0.6093839, -2.597302, 1, 0.8392157, 0, 1,
-1.084358, 0.01140252, 0.07109611, 1, 0.8470588, 0, 1,
-1.082569, -1.718688, 0.07472908, 1, 0.8509804, 0, 1,
-1.081194, -1.260184, -2.419346, 1, 0.8588235, 0, 1,
-1.078979, -0.976306, -0.617142, 1, 0.8627451, 0, 1,
-1.078133, -1.958078, -4.759623, 1, 0.8705882, 0, 1,
-1.076866, -0.6909294, -1.900708, 1, 0.8745098, 0, 1,
-1.073995, -0.4794643, -2.51684, 1, 0.8823529, 0, 1,
-1.07377, -0.7162335, -1.415183, 1, 0.8862745, 0, 1,
-1.072332, 1.854688, 0.4884256, 1, 0.8941177, 0, 1,
-1.065852, 1.76216, -2.428895, 1, 0.8980392, 0, 1,
-1.064122, 0.7002276, -0.01014213, 1, 0.9058824, 0, 1,
-1.058221, 0.8560068, -2.62691, 1, 0.9137255, 0, 1,
-1.055721, -0.04025993, -2.883297, 1, 0.9176471, 0, 1,
-1.052686, -0.6062363, -3.338597, 1, 0.9254902, 0, 1,
-1.051104, -1.26277, -2.610977, 1, 0.9294118, 0, 1,
-1.045022, 0.549389, -0.7393945, 1, 0.9372549, 0, 1,
-1.044982, -1.773747, -4.709054, 1, 0.9411765, 0, 1,
-1.043313, -0.9392348, -2.66237, 1, 0.9490196, 0, 1,
-1.043175, -0.2966726, -2.000797, 1, 0.9529412, 0, 1,
-1.031045, 0.1999775, -2.309471, 1, 0.9607843, 0, 1,
-1.019167, -0.7918442, -2.852955, 1, 0.9647059, 0, 1,
-1.015522, 0.4892338, -0.7431696, 1, 0.972549, 0, 1,
-1.015156, -0.7795632, -3.33921, 1, 0.9764706, 0, 1,
-1.006303, 1.604747, 1.390944, 1, 0.9843137, 0, 1,
-1.005857, 0.4070338, -0.4586769, 1, 0.9882353, 0, 1,
-1.0048, 0.5532343, -0.2005112, 1, 0.9960784, 0, 1,
-1.002447, 0.3635644, -1.708976, 0.9960784, 1, 0, 1,
-0.9910332, -0.1463562, -2.969183, 0.9921569, 1, 0, 1,
-0.9848447, -0.2863069, -2.081234, 0.9843137, 1, 0, 1,
-0.9842408, 2.143898, -1.010514, 0.9803922, 1, 0, 1,
-0.9834279, 2.163035, -0.2579618, 0.972549, 1, 0, 1,
-0.975175, 0.4302362, -0.5421587, 0.9686275, 1, 0, 1,
-0.9715679, 0.1813568, -1.266851, 0.9607843, 1, 0, 1,
-0.969927, 0.9350235, -0.1047753, 0.9568627, 1, 0, 1,
-0.9691437, 0.1807852, -1.8977, 0.9490196, 1, 0, 1,
-0.9672141, 1.126244, 0.1010951, 0.945098, 1, 0, 1,
-0.9671955, 0.4806014, -1.233694, 0.9372549, 1, 0, 1,
-0.9599193, 2.399009, -0.3091865, 0.9333333, 1, 0, 1,
-0.9569609, -0.02705081, -1.973417, 0.9254902, 1, 0, 1,
-0.9536738, 2.201466, 0.3312034, 0.9215686, 1, 0, 1,
-0.9527006, 0.6262643, -2.014149, 0.9137255, 1, 0, 1,
-0.9520131, -1.419881, -2.209374, 0.9098039, 1, 0, 1,
-0.9445176, -0.4347755, -1.222, 0.9019608, 1, 0, 1,
-0.9397253, -0.4689439, -4.061102, 0.8941177, 1, 0, 1,
-0.9358419, 0.4342795, -1.11982, 0.8901961, 1, 0, 1,
-0.9290064, -1.306249, -3.435363, 0.8823529, 1, 0, 1,
-0.926932, 0.3661238, -0.430979, 0.8784314, 1, 0, 1,
-0.9259678, 1.515543, -1.922006, 0.8705882, 1, 0, 1,
-0.9236355, 0.8206803, -2.016329, 0.8666667, 1, 0, 1,
-0.9232488, -0.5439868, -0.4940325, 0.8588235, 1, 0, 1,
-0.9185023, -1.440593, -4.078331, 0.854902, 1, 0, 1,
-0.9176198, 0.2113543, -2.606518, 0.8470588, 1, 0, 1,
-0.9160736, -0.2433463, -4.179435, 0.8431373, 1, 0, 1,
-0.9100953, -1.654619, -2.515824, 0.8352941, 1, 0, 1,
-0.9053786, 0.1468473, -2.970605, 0.8313726, 1, 0, 1,
-0.9051821, -0.6321369, -2.391879, 0.8235294, 1, 0, 1,
-0.9042863, -0.5832532, -2.027035, 0.8196079, 1, 0, 1,
-0.886121, -0.679527, -2.135766, 0.8117647, 1, 0, 1,
-0.8860241, 0.7792264, -0.4335914, 0.8078431, 1, 0, 1,
-0.8802968, 0.6692394, -1.9982, 0.8, 1, 0, 1,
-0.8796175, 1.081299, -1.931396, 0.7921569, 1, 0, 1,
-0.8665187, -0.3180083, -1.930379, 0.7882353, 1, 0, 1,
-0.8663211, -0.1148655, -1.271519, 0.7803922, 1, 0, 1,
-0.8597592, -0.1381809, -1.806848, 0.7764706, 1, 0, 1,
-0.8567479, 0.9327039, -0.6224377, 0.7686275, 1, 0, 1,
-0.8535511, -0.1123253, -1.752297, 0.7647059, 1, 0, 1,
-0.851184, -0.5573192, -1.708405, 0.7568628, 1, 0, 1,
-0.8477566, -0.1257773, -2.529967, 0.7529412, 1, 0, 1,
-0.847717, -0.3661966, -2.880972, 0.7450981, 1, 0, 1,
-0.8468468, 0.0159337, -2.852806, 0.7411765, 1, 0, 1,
-0.8461217, -1.374025, -2.589565, 0.7333333, 1, 0, 1,
-0.8346571, -0.07733618, -1.487913, 0.7294118, 1, 0, 1,
-0.8221839, 1.976956, -1.603626, 0.7215686, 1, 0, 1,
-0.8074633, 1.772576, -0.9528289, 0.7176471, 1, 0, 1,
-0.807425, 0.373411, 1.003571, 0.7098039, 1, 0, 1,
-0.8014532, 0.7793487, -0.1418099, 0.7058824, 1, 0, 1,
-0.8011929, 1.016384, -1.924729, 0.6980392, 1, 0, 1,
-0.8009282, -0.1516222, -2.781303, 0.6901961, 1, 0, 1,
-0.7974635, -1.365035, -3.766891, 0.6862745, 1, 0, 1,
-0.7957802, 0.544105, 0.07553664, 0.6784314, 1, 0, 1,
-0.7953109, -0.5700451, -2.816216, 0.6745098, 1, 0, 1,
-0.7923391, -0.1643878, -2.352997, 0.6666667, 1, 0, 1,
-0.7868916, 1.383729, 1.031829, 0.6627451, 1, 0, 1,
-0.7866083, 1.69062, 0.05455593, 0.654902, 1, 0, 1,
-0.7848706, 0.4123336, -1.429041, 0.6509804, 1, 0, 1,
-0.7785512, -0.1017185, -1.522136, 0.6431373, 1, 0, 1,
-0.7774741, 1.630159, -0.8580166, 0.6392157, 1, 0, 1,
-0.7742836, 0.4001718, 0.2552034, 0.6313726, 1, 0, 1,
-0.7715257, -0.2099951, -0.696986, 0.627451, 1, 0, 1,
-0.7695277, 0.09416053, -1.687313, 0.6196079, 1, 0, 1,
-0.767826, -0.8250023, -3.518592, 0.6156863, 1, 0, 1,
-0.766085, -0.2364253, -1.06195, 0.6078432, 1, 0, 1,
-0.7641737, 0.1460928, -0.445444, 0.6039216, 1, 0, 1,
-0.7615069, -0.009124705, -0.4729396, 0.5960785, 1, 0, 1,
-0.7614887, 0.1083061, -1.38842, 0.5882353, 1, 0, 1,
-0.7509421, -1.920871, -3.556063, 0.5843138, 1, 0, 1,
-0.7485279, 1.802747, -2.202374, 0.5764706, 1, 0, 1,
-0.7428823, -0.8498346, -1.073318, 0.572549, 1, 0, 1,
-0.7388451, 0.1600048, -0.4303123, 0.5647059, 1, 0, 1,
-0.7323741, 0.0349951, -1.741547, 0.5607843, 1, 0, 1,
-0.7318723, 0.006582696, -1.437396, 0.5529412, 1, 0, 1,
-0.7266775, -0.9989403, -1.611003, 0.5490196, 1, 0, 1,
-0.7241088, -1.470959, -1.840855, 0.5411765, 1, 0, 1,
-0.7209169, 0.7102811, -0.1463178, 0.5372549, 1, 0, 1,
-0.7188733, -0.4537901, -2.020579, 0.5294118, 1, 0, 1,
-0.7177448, 2.079256, 0.02198874, 0.5254902, 1, 0, 1,
-0.7173384, 0.4809065, -1.402007, 0.5176471, 1, 0, 1,
-0.7144924, 1.008049, -0.523555, 0.5137255, 1, 0, 1,
-0.714148, 0.2325211, -2.223649, 0.5058824, 1, 0, 1,
-0.7128412, -0.761636, -3.46941, 0.5019608, 1, 0, 1,
-0.7104927, -0.4314678, -2.719209, 0.4941176, 1, 0, 1,
-0.710011, 0.1384774, -0.1440544, 0.4862745, 1, 0, 1,
-0.7086245, 1.063653, -0.5519928, 0.4823529, 1, 0, 1,
-0.706579, 1.142203, -0.626802, 0.4745098, 1, 0, 1,
-0.7053971, 1.446551, -1.022717, 0.4705882, 1, 0, 1,
-0.6990232, 0.513, -0.2093497, 0.4627451, 1, 0, 1,
-0.6960152, 0.09270458, -0.5823503, 0.4588235, 1, 0, 1,
-0.6943739, 0.9011122, -2.505106, 0.4509804, 1, 0, 1,
-0.6934623, 0.282264, -0.1951613, 0.4470588, 1, 0, 1,
-0.6898897, -0.008236011, -2.062911, 0.4392157, 1, 0, 1,
-0.6862438, -1.801966, -3.569468, 0.4352941, 1, 0, 1,
-0.6860651, -0.1331566, -1.713941, 0.427451, 1, 0, 1,
-0.685616, 0.9509896, -1.576252, 0.4235294, 1, 0, 1,
-0.6847579, -0.01487675, -2.403775, 0.4156863, 1, 0, 1,
-0.6834494, 1.153626, -0.9326641, 0.4117647, 1, 0, 1,
-0.6818261, -0.340708, -2.890602, 0.4039216, 1, 0, 1,
-0.6807049, -0.3319584, -1.86928, 0.3960784, 1, 0, 1,
-0.6720917, 0.3786015, 0.170689, 0.3921569, 1, 0, 1,
-0.6691161, -0.9954056, -2.04805, 0.3843137, 1, 0, 1,
-0.6663449, -1.182288, -3.085659, 0.3803922, 1, 0, 1,
-0.6639091, 1.448701, -0.3248602, 0.372549, 1, 0, 1,
-0.6618344, -0.9174449, -2.406895, 0.3686275, 1, 0, 1,
-0.6510616, 0.3717352, -0.7978559, 0.3607843, 1, 0, 1,
-0.6505874, -0.1436882, -1.703199, 0.3568628, 1, 0, 1,
-0.649282, 0.1066596, -3.592647, 0.3490196, 1, 0, 1,
-0.6484264, -1.510608, -2.193386, 0.345098, 1, 0, 1,
-0.6421088, -0.663496, -0.6815318, 0.3372549, 1, 0, 1,
-0.6413899, -0.03711733, -0.331017, 0.3333333, 1, 0, 1,
-0.6406871, -0.2093313, -2.746811, 0.3254902, 1, 0, 1,
-0.637675, -0.9091536, -1.596802, 0.3215686, 1, 0, 1,
-0.6363019, 0.6427485, 0.3093153, 0.3137255, 1, 0, 1,
-0.6348623, -0.9839743, -2.261604, 0.3098039, 1, 0, 1,
-0.6333556, 0.5168123, -0.7936614, 0.3019608, 1, 0, 1,
-0.6295067, 1.34872, 2.413262, 0.2941177, 1, 0, 1,
-0.6239119, -0.4307323, -2.936937, 0.2901961, 1, 0, 1,
-0.6215684, -1.361173, -1.255908, 0.282353, 1, 0, 1,
-0.6179277, 2.440193, 0.234381, 0.2784314, 1, 0, 1,
-0.617906, 0.5628211, -2.171808, 0.2705882, 1, 0, 1,
-0.6145473, -0.9866924, -2.311545, 0.2666667, 1, 0, 1,
-0.6138146, -1.003229, -4.710147, 0.2588235, 1, 0, 1,
-0.6086551, -0.7228094, -1.299285, 0.254902, 1, 0, 1,
-0.6085609, 1.308497, -1.076824, 0.2470588, 1, 0, 1,
-0.6082313, 0.7103252, -0.360708, 0.2431373, 1, 0, 1,
-0.6081513, 0.7174143, -0.1772392, 0.2352941, 1, 0, 1,
-0.6041521, -0.2299648, -0.8544914, 0.2313726, 1, 0, 1,
-0.6021156, -0.7043844, -0.7822741, 0.2235294, 1, 0, 1,
-0.6012974, -1.827939, -3.604493, 0.2196078, 1, 0, 1,
-0.6011079, -0.1939658, -0.5884783, 0.2117647, 1, 0, 1,
-0.5988832, 0.8829997, -0.2027865, 0.2078431, 1, 0, 1,
-0.5961926, -0.2072295, -1.644046, 0.2, 1, 0, 1,
-0.5937341, -1.733189, -3.631166, 0.1921569, 1, 0, 1,
-0.5928447, -0.301889, -1.694652, 0.1882353, 1, 0, 1,
-0.5927628, -0.8091488, -4.714235, 0.1803922, 1, 0, 1,
-0.5892637, -1.163655, -0.8335622, 0.1764706, 1, 0, 1,
-0.5864004, 0.1835002, -0.617067, 0.1686275, 1, 0, 1,
-0.5847075, -1.086102, -2.505466, 0.1647059, 1, 0, 1,
-0.5821447, 0.1321245, -1.500382, 0.1568628, 1, 0, 1,
-0.581293, -0.8006275, -2.588085, 0.1529412, 1, 0, 1,
-0.580771, 1.004714, -1.797435, 0.145098, 1, 0, 1,
-0.5804586, 0.2627472, -2.411903, 0.1411765, 1, 0, 1,
-0.579588, 0.7573938, -0.1573125, 0.1333333, 1, 0, 1,
-0.5756879, 0.5858351, 0.1305722, 0.1294118, 1, 0, 1,
-0.5739205, 0.8546612, -0.6525676, 0.1215686, 1, 0, 1,
-0.5707842, 1.634203, -0.6943999, 0.1176471, 1, 0, 1,
-0.5652547, 0.7527285, -1.257905, 0.1098039, 1, 0, 1,
-0.5593712, 0.4336872, -1.642566, 0.1058824, 1, 0, 1,
-0.5584653, 0.570858, -0.9441921, 0.09803922, 1, 0, 1,
-0.5571287, -0.371148, -0.03612168, 0.09019608, 1, 0, 1,
-0.5461884, -0.6536077, -3.491136, 0.08627451, 1, 0, 1,
-0.5451925, -0.3436555, -1.641178, 0.07843138, 1, 0, 1,
-0.533765, 0.4977473, -0.9674783, 0.07450981, 1, 0, 1,
-0.5322142, 0.08107915, -0.4372757, 0.06666667, 1, 0, 1,
-0.5249034, 1.759329, 0.8094804, 0.0627451, 1, 0, 1,
-0.52356, 0.6750267, -1.323569, 0.05490196, 1, 0, 1,
-0.5156707, -0.793918, -2.438211, 0.05098039, 1, 0, 1,
-0.5128958, -0.3502626, -1.679208, 0.04313726, 1, 0, 1,
-0.5095667, -0.5025792, -3.707895, 0.03921569, 1, 0, 1,
-0.5077472, -0.9412983, -2.866624, 0.03137255, 1, 0, 1,
-0.5026608, 0.9669105, -0.3647583, 0.02745098, 1, 0, 1,
-0.5004713, -1.373364, -2.72494, 0.01960784, 1, 0, 1,
-0.5000874, 0.3351207, 0.1277302, 0.01568628, 1, 0, 1,
-0.4983658, 0.2866084, -0.2593359, 0.007843138, 1, 0, 1,
-0.4973322, 0.3008128, -0.2066196, 0.003921569, 1, 0, 1,
-0.4951095, -0.3037196, -0.1787082, 0, 1, 0.003921569, 1,
-0.4939509, -0.4418977, -2.015056, 0, 1, 0.01176471, 1,
-0.4932612, -0.1911737, -2.189615, 0, 1, 0.01568628, 1,
-0.4930533, -0.5878438, -3.585649, 0, 1, 0.02352941, 1,
-0.491181, -0.814154, -2.278981, 0, 1, 0.02745098, 1,
-0.4895723, -1.43177, -3.00672, 0, 1, 0.03529412, 1,
-0.4807355, -0.8431514, -3.000676, 0, 1, 0.03921569, 1,
-0.4720134, -2.150533, -2.279158, 0, 1, 0.04705882, 1,
-0.4695219, -0.4882111, -3.319741, 0, 1, 0.05098039, 1,
-0.4691608, -0.5466785, -0.7983014, 0, 1, 0.05882353, 1,
-0.4653246, -0.6132043, -2.329332, 0, 1, 0.0627451, 1,
-0.4651309, -0.07609071, -2.712138, 0, 1, 0.07058824, 1,
-0.4594096, -0.8338816, -2.068433, 0, 1, 0.07450981, 1,
-0.4577825, 0.09919989, -0.8606596, 0, 1, 0.08235294, 1,
-0.456951, -0.4584266, -4.127056, 0, 1, 0.08627451, 1,
-0.4567222, 0.4970046, 0.1484436, 0, 1, 0.09411765, 1,
-0.4559219, -1.0967, -2.624579, 0, 1, 0.1019608, 1,
-0.4549353, 1.696626, -1.03857, 0, 1, 0.1058824, 1,
-0.4518821, -1.11807, -2.599499, 0, 1, 0.1137255, 1,
-0.4499348, 0.5547559, -1.090072, 0, 1, 0.1176471, 1,
-0.4497609, -0.115555, -3.293162, 0, 1, 0.1254902, 1,
-0.4488032, -2.247827, -4.143432, 0, 1, 0.1294118, 1,
-0.4458567, 0.6956958, -0.2598414, 0, 1, 0.1372549, 1,
-0.4447658, 0.7951766, -0.8882092, 0, 1, 0.1411765, 1,
-0.4415618, 1.083484, -2.12955, 0, 1, 0.1490196, 1,
-0.4361854, -1.228543, -3.076489, 0, 1, 0.1529412, 1,
-0.4332412, -0.1212987, -1.439343, 0, 1, 0.1607843, 1,
-0.4321723, 0.824629, 0.5391896, 0, 1, 0.1647059, 1,
-0.4302848, -0.2549456, -2.560848, 0, 1, 0.172549, 1,
-0.4285286, 0.7458703, 0.06642406, 0, 1, 0.1764706, 1,
-0.4278603, -1.072592, -2.766027, 0, 1, 0.1843137, 1,
-0.4269257, 1.3045, 0.9337914, 0, 1, 0.1882353, 1,
-0.4249258, 0.3062007, -1.656358, 0, 1, 0.1960784, 1,
-0.4247406, 0.7437568, -0.234162, 0, 1, 0.2039216, 1,
-0.4244443, 0.3185605, -2.525369, 0, 1, 0.2078431, 1,
-0.4235254, -0.7733864, -3.860239, 0, 1, 0.2156863, 1,
-0.4208001, 0.2144005, -0.7353691, 0, 1, 0.2196078, 1,
-0.4199987, 1.491061, 0.1480522, 0, 1, 0.227451, 1,
-0.4185603, 1.286917, 0.003765517, 0, 1, 0.2313726, 1,
-0.4154287, 0.2596329, -2.216215, 0, 1, 0.2392157, 1,
-0.4147279, 1.246582, -0.5155573, 0, 1, 0.2431373, 1,
-0.414171, 0.7520058, -0.5629226, 0, 1, 0.2509804, 1,
-0.4129857, 0.4748988, -0.4517815, 0, 1, 0.254902, 1,
-0.4087428, -0.4173317, -1.688043, 0, 1, 0.2627451, 1,
-0.4075806, 1.480577, -0.2629969, 0, 1, 0.2666667, 1,
-0.4067313, 0.1710889, -2.491596, 0, 1, 0.2745098, 1,
-0.4038886, -0.2346084, -1.989101, 0, 1, 0.2784314, 1,
-0.4034626, -0.5513248, -3.681066, 0, 1, 0.2862745, 1,
-0.4002405, -0.9900716, -3.026049, 0, 1, 0.2901961, 1,
-0.3970885, 0.2138643, -1.620419, 0, 1, 0.2980392, 1,
-0.3967761, 1.580046, 0.1776294, 0, 1, 0.3058824, 1,
-0.3945148, -0.4702804, -2.608073, 0, 1, 0.3098039, 1,
-0.3933448, -1.080808, -3.674176, 0, 1, 0.3176471, 1,
-0.3922424, -1.27306, -4.540206, 0, 1, 0.3215686, 1,
-0.3871397, 0.7254794, -0.4383643, 0, 1, 0.3294118, 1,
-0.3865234, 0.468706, -1.835081, 0, 1, 0.3333333, 1,
-0.3853379, 0.4725059, 0.1001789, 0, 1, 0.3411765, 1,
-0.3839486, 0.7211652, -1.560556, 0, 1, 0.345098, 1,
-0.3776532, -1.387128, -1.705698, 0, 1, 0.3529412, 1,
-0.3775249, -2.360997, -2.006247, 0, 1, 0.3568628, 1,
-0.3748383, 0.7231898, -0.5198393, 0, 1, 0.3647059, 1,
-0.3714333, -1.376898, -3.018157, 0, 1, 0.3686275, 1,
-0.3661332, 0.01984848, -1.578338, 0, 1, 0.3764706, 1,
-0.3635813, -2.64122, -2.313501, 0, 1, 0.3803922, 1,
-0.3604494, 0.2795144, -2.131185, 0, 1, 0.3882353, 1,
-0.3567219, -0.2973302, -3.584511, 0, 1, 0.3921569, 1,
-0.3535463, 0.3117033, 0.09439656, 0, 1, 0.4, 1,
-0.3507785, 0.8096722, 0.8139513, 0, 1, 0.4078431, 1,
-0.3488387, 1.564113, 1.134907, 0, 1, 0.4117647, 1,
-0.3465351, 0.08515029, 0.4770423, 0, 1, 0.4196078, 1,
-0.3463318, 0.9205943, -0.642794, 0, 1, 0.4235294, 1,
-0.3450691, 0.9764466, 0.4959852, 0, 1, 0.4313726, 1,
-0.3448783, 0.151921, -0.8463822, 0, 1, 0.4352941, 1,
-0.3417926, -0.754706, -3.067443, 0, 1, 0.4431373, 1,
-0.3404799, 1.516267, 1.281937, 0, 1, 0.4470588, 1,
-0.3333124, -0.1427476, -1.739164, 0, 1, 0.454902, 1,
-0.3307973, -1.190508, -2.723311, 0, 1, 0.4588235, 1,
-0.33077, -0.3312624, -1.335083, 0, 1, 0.4666667, 1,
-0.3266264, -0.925177, -1.245541, 0, 1, 0.4705882, 1,
-0.3258561, -1.788151, -1.555595, 0, 1, 0.4784314, 1,
-0.3212434, -2.210443, -4.213993, 0, 1, 0.4823529, 1,
-0.3209549, -0.8375481, -3.787659, 0, 1, 0.4901961, 1,
-0.3188646, 0.1148441, -0.6660652, 0, 1, 0.4941176, 1,
-0.3134847, -0.3519484, -3.88764, 0, 1, 0.5019608, 1,
-0.3127252, -0.5548059, -0.4681236, 0, 1, 0.509804, 1,
-0.3124429, 0.3345398, -1.528439, 0, 1, 0.5137255, 1,
-0.3074163, -1.143499, -1.503581, 0, 1, 0.5215687, 1,
-0.302879, -0.6337849, -3.112077, 0, 1, 0.5254902, 1,
-0.3016708, -1.597606, -2.778864, 0, 1, 0.5333334, 1,
-0.2943226, -1.591661, -2.120921, 0, 1, 0.5372549, 1,
-0.2807994, 0.7444897, -1.745397, 0, 1, 0.5450981, 1,
-0.2757583, 0.3002858, -0.9387017, 0, 1, 0.5490196, 1,
-0.2745452, -1.873402, -2.582589, 0, 1, 0.5568628, 1,
-0.2704362, -0.5374259, -2.792341, 0, 1, 0.5607843, 1,
-0.2702582, 0.309624, -0.216915, 0, 1, 0.5686275, 1,
-0.2698197, 0.0637665, -2.919985, 0, 1, 0.572549, 1,
-0.2677327, -1.686763, -4.382105, 0, 1, 0.5803922, 1,
-0.259589, -0.08269842, -1.710292, 0, 1, 0.5843138, 1,
-0.2586801, 0.2871271, -0.6973132, 0, 1, 0.5921569, 1,
-0.2560216, -0.1848054, -3.154364, 0, 1, 0.5960785, 1,
-0.2519986, 1.030314, -1.072143, 0, 1, 0.6039216, 1,
-0.2496513, 0.1501797, -3.091129, 0, 1, 0.6117647, 1,
-0.2391594, -0.5693589, -3.369178, 0, 1, 0.6156863, 1,
-0.2364262, -0.5122749, -2.303539, 0, 1, 0.6235294, 1,
-0.235234, 0.06281621, -1.686465, 0, 1, 0.627451, 1,
-0.2346442, -0.4488824, -2.232216, 0, 1, 0.6352941, 1,
-0.2343411, -0.1704439, -1.132942, 0, 1, 0.6392157, 1,
-0.2315127, -0.4204631, -4.158332, 0, 1, 0.6470588, 1,
-0.2303818, 0.01160999, -2.244532, 0, 1, 0.6509804, 1,
-0.2274039, -0.6194475, -1.409653, 0, 1, 0.6588235, 1,
-0.2254331, -0.9586902, -3.110872, 0, 1, 0.6627451, 1,
-0.22289, 0.2548538, 0.4281902, 0, 1, 0.6705883, 1,
-0.2145778, -0.2159469, -2.988467, 0, 1, 0.6745098, 1,
-0.2098526, 0.2965151, 1.086191, 0, 1, 0.682353, 1,
-0.2058482, 0.5137067, -1.289504, 0, 1, 0.6862745, 1,
-0.2049123, 0.6443692, -1.896879, 0, 1, 0.6941177, 1,
-0.2023515, -0.6121541, -2.517014, 0, 1, 0.7019608, 1,
-0.199615, -1.079044, -2.360209, 0, 1, 0.7058824, 1,
-0.1975528, -2.68603, -3.594081, 0, 1, 0.7137255, 1,
-0.1952492, -1.143043, -3.791303, 0, 1, 0.7176471, 1,
-0.1941589, -1.241784, -3.475699, 0, 1, 0.7254902, 1,
-0.1810839, -1.196776, -3.37219, 0, 1, 0.7294118, 1,
-0.1788975, 1.781837, -1.448458, 0, 1, 0.7372549, 1,
-0.1788046, 0.219105, 0.8959383, 0, 1, 0.7411765, 1,
-0.1763136, 1.453544, -0.5732036, 0, 1, 0.7490196, 1,
-0.1750382, 0.4500913, -0.1850548, 0, 1, 0.7529412, 1,
-0.1704717, -0.4520964, -2.685671, 0, 1, 0.7607843, 1,
-0.168091, 1.576229, -0.3019111, 0, 1, 0.7647059, 1,
-0.1669397, -0.6943691, -2.119054, 0, 1, 0.772549, 1,
-0.1518002, 0.02236095, -1.06658, 0, 1, 0.7764706, 1,
-0.1511341, 1.804236, -0.4800261, 0, 1, 0.7843137, 1,
-0.1502157, 0.9143154, -0.9845595, 0, 1, 0.7882353, 1,
-0.1490043, -1.83265, -2.864307, 0, 1, 0.7960784, 1,
-0.1433254, 0.1902511, -0.3022685, 0, 1, 0.8039216, 1,
-0.1422436, 0.4883807, -1.066915, 0, 1, 0.8078431, 1,
-0.1384506, 0.06812607, -1.467175, 0, 1, 0.8156863, 1,
-0.1372513, 0.4762332, -1.071842, 0, 1, 0.8196079, 1,
-0.1368134, -1.149875, -3.662782, 0, 1, 0.827451, 1,
-0.1349212, -1.56987, -3.74975, 0, 1, 0.8313726, 1,
-0.1346449, 1.725953, -0.09803249, 0, 1, 0.8392157, 1,
-0.1325118, -0.9922014, -3.603567, 0, 1, 0.8431373, 1,
-0.1313883, 1.473854, 0.04693916, 0, 1, 0.8509804, 1,
-0.1286402, 1.613724, 0.2074477, 0, 1, 0.854902, 1,
-0.1228623, -1.33637, -1.538613, 0, 1, 0.8627451, 1,
-0.1228359, 1.643196, -1.749222, 0, 1, 0.8666667, 1,
-0.1200374, 0.002795544, -1.021117, 0, 1, 0.8745098, 1,
-0.1163954, 0.2754704, -1.308892, 0, 1, 0.8784314, 1,
-0.1154841, -0.4114318, -2.421193, 0, 1, 0.8862745, 1,
-0.115098, -1.592379, -3.91233, 0, 1, 0.8901961, 1,
-0.1143378, -0.2706289, -1.903754, 0, 1, 0.8980392, 1,
-0.1130808, 0.6041096, -1.200511, 0, 1, 0.9058824, 1,
-0.1097625, -0.7656241, -2.576422, 0, 1, 0.9098039, 1,
-0.1095291, -0.4080162, -2.891097, 0, 1, 0.9176471, 1,
-0.09981983, -0.109248, -1.748987, 0, 1, 0.9215686, 1,
-0.09852964, 0.7433181, 0.114905, 0, 1, 0.9294118, 1,
-0.09132928, 0.3413727, 0.05325616, 0, 1, 0.9333333, 1,
-0.07947998, 0.5510252, -0.8139048, 0, 1, 0.9411765, 1,
-0.07299857, 0.4861595, -0.7061433, 0, 1, 0.945098, 1,
-0.07194502, -2.120041, -2.553548, 0, 1, 0.9529412, 1,
-0.0713966, -1.068616, -3.249645, 0, 1, 0.9568627, 1,
-0.06809609, -0.9040855, -0.7419758, 0, 1, 0.9647059, 1,
-0.05708561, -0.004456003, 0.02991197, 0, 1, 0.9686275, 1,
-0.05642534, 0.6421819, 1.340055, 0, 1, 0.9764706, 1,
-0.04726438, 1.777037, -0.4219609, 0, 1, 0.9803922, 1,
-0.04663421, 0.359985, 0.213388, 0, 1, 0.9882353, 1,
-0.04255778, -1.316186, -3.232522, 0, 1, 0.9921569, 1,
-0.04245476, -0.9310874, -2.507733, 0, 1, 1, 1,
-0.04111242, -0.4357132, -2.725041, 0, 0.9921569, 1, 1,
-0.03954845, 0.2635018, 0.006605102, 0, 0.9882353, 1, 1,
-0.03871191, 0.8157997, 0.8430366, 0, 0.9803922, 1, 1,
-0.03856709, 0.3800474, 1.211146, 0, 0.9764706, 1, 1,
-0.03187888, 0.5611112, 1.103246, 0, 0.9686275, 1, 1,
-0.03071318, 0.8540223, 1.568525, 0, 0.9647059, 1, 1,
-0.02653667, -1.964404, -3.826325, 0, 0.9568627, 1, 1,
-0.02600031, -0.1002069, -2.137767, 0, 0.9529412, 1, 1,
-0.02448251, -0.4149179, -3.116265, 0, 0.945098, 1, 1,
-0.02430118, -1.609855, -2.797988, 0, 0.9411765, 1, 1,
-0.02175608, -0.4591452, -4.649681, 0, 0.9333333, 1, 1,
-0.01845692, 1.73875, -0.4763232, 0, 0.9294118, 1, 1,
-0.01806667, 1.506419, 0.9049647, 0, 0.9215686, 1, 1,
-0.01183817, 0.0158305, -1.072322, 0, 0.9176471, 1, 1,
-0.008166224, 0.8335232, 0.3486391, 0, 0.9098039, 1, 1,
-0.007120505, 0.5205615, -0.890525, 0, 0.9058824, 1, 1,
-0.00240603, -0.9695837, -1.6767, 0, 0.8980392, 1, 1,
-0.001181947, -0.812998, -3.481488, 0, 0.8901961, 1, 1,
0.001790268, -0.5705208, 1.684476, 0, 0.8862745, 1, 1,
0.002210053, 0.3070448, 0.2836291, 0, 0.8784314, 1, 1,
0.004219505, 1.064585, -0.9798722, 0, 0.8745098, 1, 1,
0.00809381, -0.03744688, 2.922318, 0, 0.8666667, 1, 1,
0.01007718, -1.499631, 2.543359, 0, 0.8627451, 1, 1,
0.02489744, -1.862458, 3.419657, 0, 0.854902, 1, 1,
0.03272664, -2.27944, 1.482976, 0, 0.8509804, 1, 1,
0.03426448, -0.3709692, 1.807408, 0, 0.8431373, 1, 1,
0.03659819, 0.3829975, -1.094219, 0, 0.8392157, 1, 1,
0.04357945, 0.02417168, 1.162657, 0, 0.8313726, 1, 1,
0.04718837, 0.8582021, 0.8031935, 0, 0.827451, 1, 1,
0.04739706, -0.09373379, 3.256548, 0, 0.8196079, 1, 1,
0.05333536, -0.1594767, 3.434536, 0, 0.8156863, 1, 1,
0.05798779, 1.036557, 0.0811649, 0, 0.8078431, 1, 1,
0.06013952, 0.8628444, 1.471061, 0, 0.8039216, 1, 1,
0.06465633, 0.8720754, 1.79251, 0, 0.7960784, 1, 1,
0.06582277, 1.088977, 0.3359303, 0, 0.7882353, 1, 1,
0.06696204, 0.5689156, -0.8257148, 0, 0.7843137, 1, 1,
0.06858002, 0.6588303, -0.2366415, 0, 0.7764706, 1, 1,
0.06955833, -0.121482, 4.185469, 0, 0.772549, 1, 1,
0.07010935, -1.564723, 2.316329, 0, 0.7647059, 1, 1,
0.0848723, -0.5926435, 1.587607, 0, 0.7607843, 1, 1,
0.09263737, 1.15897, 1.333456, 0, 0.7529412, 1, 1,
0.09815081, 1.312301, -1.468985, 0, 0.7490196, 1, 1,
0.09985407, 0.3969459, 0.02146815, 0, 0.7411765, 1, 1,
0.1009754, 1.24298, 0.5899945, 0, 0.7372549, 1, 1,
0.1021359, 1.514688, 1.29725, 0, 0.7294118, 1, 1,
0.102934, -1.976816, 2.69613, 0, 0.7254902, 1, 1,
0.1070584, -0.3159206, 1.315881, 0, 0.7176471, 1, 1,
0.1083883, 0.486418, 0.1914199, 0, 0.7137255, 1, 1,
0.1098168, -0.407672, 1.413287, 0, 0.7058824, 1, 1,
0.1143098, -0.5681067, 2.719857, 0, 0.6980392, 1, 1,
0.1168347, 0.6916548, 1.261113, 0, 0.6941177, 1, 1,
0.1186369, -1.846997, 3.667141, 0, 0.6862745, 1, 1,
0.1264483, -1.586492, 3.393026, 0, 0.682353, 1, 1,
0.1307255, 0.06373246, 1.173286, 0, 0.6745098, 1, 1,
0.1321213, 0.02512287, -0.1124273, 0, 0.6705883, 1, 1,
0.136906, -0.1816703, 3.941607, 0, 0.6627451, 1, 1,
0.1379081, -0.9710035, 3.582848, 0, 0.6588235, 1, 1,
0.1431647, -0.02548991, 0.03822143, 0, 0.6509804, 1, 1,
0.1506941, -0.33315, 2.807637, 0, 0.6470588, 1, 1,
0.1540241, 0.337227, 0.9190155, 0, 0.6392157, 1, 1,
0.1540817, 1.087866, -0.2099139, 0, 0.6352941, 1, 1,
0.1541887, -2.290153, 2.812135, 0, 0.627451, 1, 1,
0.1567996, -0.1034803, 2.178801, 0, 0.6235294, 1, 1,
0.1594355, -0.5228914, 3.295739, 0, 0.6156863, 1, 1,
0.1594635, -0.6862899, 3.423215, 0, 0.6117647, 1, 1,
0.159496, 0.5329307, 0.1498784, 0, 0.6039216, 1, 1,
0.1682898, 0.4699447, 0.6854706, 0, 0.5960785, 1, 1,
0.1687678, 0.2314302, 0.1872304, 0, 0.5921569, 1, 1,
0.1705375, 1.726359, 0.09744693, 0, 0.5843138, 1, 1,
0.1743192, 0.02789051, -0.004636732, 0, 0.5803922, 1, 1,
0.1773274, -0.2066344, 2.89886, 0, 0.572549, 1, 1,
0.1775939, -0.5309926, 3.392266, 0, 0.5686275, 1, 1,
0.1798339, -0.3353309, 2.068148, 0, 0.5607843, 1, 1,
0.1842756, -1.490585, 1.546822, 0, 0.5568628, 1, 1,
0.1897132, -1.07077, 2.806067, 0, 0.5490196, 1, 1,
0.1926937, 0.79264, 0.248558, 0, 0.5450981, 1, 1,
0.1967875, 0.0958451, 1.183931, 0, 0.5372549, 1, 1,
0.1970408, -0.1961857, 1.74778, 0, 0.5333334, 1, 1,
0.1988108, -0.3471382, 2.420004, 0, 0.5254902, 1, 1,
0.1991421, -0.5256913, 3.311021, 0, 0.5215687, 1, 1,
0.2020486, -0.2499336, 2.140647, 0, 0.5137255, 1, 1,
0.2054342, -0.1525415, 1.084086, 0, 0.509804, 1, 1,
0.2055707, -0.241491, 1.469871, 0, 0.5019608, 1, 1,
0.2091786, 0.5983408, -1.118883, 0, 0.4941176, 1, 1,
0.2186312, 0.3135618, 0.9535424, 0, 0.4901961, 1, 1,
0.2194357, 0.5431997, 0.2598372, 0, 0.4823529, 1, 1,
0.2199232, -0.1552559, 2.018133, 0, 0.4784314, 1, 1,
0.220143, 0.2494019, 1.111261, 0, 0.4705882, 1, 1,
0.221411, -0.04866697, 1.991835, 0, 0.4666667, 1, 1,
0.2225376, 0.3547638, 1.156189, 0, 0.4588235, 1, 1,
0.2273478, -0.4591243, 3.991607, 0, 0.454902, 1, 1,
0.2279561, -0.9464051, 2.578244, 0, 0.4470588, 1, 1,
0.2348666, 0.2991318, 0.9901466, 0, 0.4431373, 1, 1,
0.2362891, 0.5563161, 0.5071125, 0, 0.4352941, 1, 1,
0.2388252, 1.008962, 0.7166474, 0, 0.4313726, 1, 1,
0.238937, 0.6069971, -0.01830821, 0, 0.4235294, 1, 1,
0.24191, 1.266121, -0.6217939, 0, 0.4196078, 1, 1,
0.2432741, -0.65465, 3.504751, 0, 0.4117647, 1, 1,
0.2478713, 2.323078, -0.0416263, 0, 0.4078431, 1, 1,
0.2492289, -1.211223, 3.637616, 0, 0.4, 1, 1,
0.2506494, -0.0009033832, -0.0976633, 0, 0.3921569, 1, 1,
0.2507223, 0.2471581, 1.171132, 0, 0.3882353, 1, 1,
0.2514116, -1.062677, 3.481471, 0, 0.3803922, 1, 1,
0.2543609, -1.808493, 3.141887, 0, 0.3764706, 1, 1,
0.2564729, -0.348769, 2.011833, 0, 0.3686275, 1, 1,
0.258037, 0.2839071, 2.085737, 0, 0.3647059, 1, 1,
0.2598774, 0.5434372, -0.986086, 0, 0.3568628, 1, 1,
0.265244, 0.8749103, -0.1676573, 0, 0.3529412, 1, 1,
0.2682981, 0.5793781, 3.37692, 0, 0.345098, 1, 1,
0.2711077, 0.5920466, 0.1682906, 0, 0.3411765, 1, 1,
0.2724554, 0.8215256, 1.102219, 0, 0.3333333, 1, 1,
0.2758621, 0.814753, -0.336623, 0, 0.3294118, 1, 1,
0.2769415, -2.305902, 3.887283, 0, 0.3215686, 1, 1,
0.2771113, 0.02904208, 3.262493, 0, 0.3176471, 1, 1,
0.2781681, -1.124818, 2.238723, 0, 0.3098039, 1, 1,
0.2814201, -0.4608473, 0.6935241, 0, 0.3058824, 1, 1,
0.2819807, -0.4759857, 1.736911, 0, 0.2980392, 1, 1,
0.2823887, -1.202826, 2.424441, 0, 0.2901961, 1, 1,
0.284155, 0.1145116, 1.864408, 0, 0.2862745, 1, 1,
0.2860265, -0.2125604, 3.114141, 0, 0.2784314, 1, 1,
0.2906918, -1.76669, 1.582468, 0, 0.2745098, 1, 1,
0.2934203, -0.2849585, 2.801581, 0, 0.2666667, 1, 1,
0.2977028, 1.485133, 0.2554598, 0, 0.2627451, 1, 1,
0.2994029, 0.9910375, -0.6347556, 0, 0.254902, 1, 1,
0.3050037, -1.307504, 3.145606, 0, 0.2509804, 1, 1,
0.3089233, -0.7635896, 3.135429, 0, 0.2431373, 1, 1,
0.3097894, 0.1930604, 1.290063, 0, 0.2392157, 1, 1,
0.310552, -0.5232025, 1.647641, 0, 0.2313726, 1, 1,
0.3115419, -0.2730487, 1.575946, 0, 0.227451, 1, 1,
0.3188071, 0.1203719, 1.540425, 0, 0.2196078, 1, 1,
0.3248543, 0.2932239, 2.098478, 0, 0.2156863, 1, 1,
0.3260405, 0.6787914, 0.3042421, 0, 0.2078431, 1, 1,
0.3299651, -0.0329828, 3.917403, 0, 0.2039216, 1, 1,
0.3310006, -0.369758, 3.836042, 0, 0.1960784, 1, 1,
0.3435886, -0.368283, 3.230054, 0, 0.1882353, 1, 1,
0.3440698, -1.55765, 3.49694, 0, 0.1843137, 1, 1,
0.3443545, -1.317503, 2.276184, 0, 0.1764706, 1, 1,
0.3472141, -1.175229, 2.13992, 0, 0.172549, 1, 1,
0.3494878, 0.7426469, -0.7067635, 0, 0.1647059, 1, 1,
0.3514937, 0.9726391, 1.374093, 0, 0.1607843, 1, 1,
0.3518095, 0.7939155, -0.2126259, 0, 0.1529412, 1, 1,
0.3586165, -0.4136966, 3.290545, 0, 0.1490196, 1, 1,
0.3618335, 0.5642737, 1.107414, 0, 0.1411765, 1, 1,
0.3701976, -2.211548, 0.5900244, 0, 0.1372549, 1, 1,
0.3761649, 2.060321, 2.244927, 0, 0.1294118, 1, 1,
0.3765967, 1.872559, -0.2350098, 0, 0.1254902, 1, 1,
0.3881406, 0.8945216, 0.0941076, 0, 0.1176471, 1, 1,
0.3894286, 0.4659371, 1.019825, 0, 0.1137255, 1, 1,
0.3905528, 0.8570221, -0.3115464, 0, 0.1058824, 1, 1,
0.392127, -1.630743, 3.786702, 0, 0.09803922, 1, 1,
0.3970383, 1.353259, -0.1531803, 0, 0.09411765, 1, 1,
0.3994434, -1.55064, 2.527771, 0, 0.08627451, 1, 1,
0.4078568, -0.1716027, 2.388169, 0, 0.08235294, 1, 1,
0.4080006, -0.8896682, 2.53349, 0, 0.07450981, 1, 1,
0.4095528, -0.5460207, 1.530306, 0, 0.07058824, 1, 1,
0.4106124, 1.018419, 2.726974, 0, 0.0627451, 1, 1,
0.4126523, 1.240271, 0.1404937, 0, 0.05882353, 1, 1,
0.4154023, -0.2930817, 3.13744, 0, 0.05098039, 1, 1,
0.4155937, 0.4000641, 1.030164, 0, 0.04705882, 1, 1,
0.4175828, 0.6933113, -0.01421347, 0, 0.03921569, 1, 1,
0.4209594, -0.9009752, 2.753262, 0, 0.03529412, 1, 1,
0.4223404, 1.023698, 0.2012859, 0, 0.02745098, 1, 1,
0.4242934, 1.927129, 0.1225564, 0, 0.02352941, 1, 1,
0.4272365, -0.07608914, 1.547061, 0, 0.01568628, 1, 1,
0.4287292, -0.1044234, 2.335518, 0, 0.01176471, 1, 1,
0.43347, -1.093255, 4.724419, 0, 0.003921569, 1, 1,
0.442128, 0.383985, 0.1172245, 0.003921569, 0, 1, 1,
0.4461496, 0.6726367, 0.5042173, 0.007843138, 0, 1, 1,
0.4489227, -3.379978, 3.647961, 0.01568628, 0, 1, 1,
0.4510403, -0.4389069, 2.746578, 0.01960784, 0, 1, 1,
0.4519822, -0.8260351, 2.206048, 0.02745098, 0, 1, 1,
0.4549485, 1.374948, -0.1149851, 0.03137255, 0, 1, 1,
0.4562503, 0.2850098, 1.430911, 0.03921569, 0, 1, 1,
0.4567938, -0.1621892, 1.271119, 0.04313726, 0, 1, 1,
0.4573664, 0.2062218, 0.6358079, 0.05098039, 0, 1, 1,
0.4613374, 0.7111636, 1.957128, 0.05490196, 0, 1, 1,
0.4616857, -0.170036, 2.449929, 0.0627451, 0, 1, 1,
0.462147, 0.8728428, 0.7892489, 0.06666667, 0, 1, 1,
0.4628838, 0.3123412, 1.903702, 0.07450981, 0, 1, 1,
0.4632328, 1.13004, 0.7363144, 0.07843138, 0, 1, 1,
0.4643418, 0.541395, 0.6975272, 0.08627451, 0, 1, 1,
0.4652776, 0.6303057, -0.07034537, 0.09019608, 0, 1, 1,
0.4681554, -1.246685, 2.624842, 0.09803922, 0, 1, 1,
0.4722182, 2.122447, -0.05330649, 0.1058824, 0, 1, 1,
0.4722394, 0.1364381, 0.05359314, 0.1098039, 0, 1, 1,
0.4727569, 3.967683, 0.1431513, 0.1176471, 0, 1, 1,
0.4745382, 0.7725362, 1.624477, 0.1215686, 0, 1, 1,
0.4753026, 1.255067, 1.254972, 0.1294118, 0, 1, 1,
0.4756922, -0.7948682, 3.38661, 0.1333333, 0, 1, 1,
0.4760958, 0.03302994, 2.164338, 0.1411765, 0, 1, 1,
0.4833509, 0.7494748, 1.193483, 0.145098, 0, 1, 1,
0.4840333, -0.2423202, 2.661487, 0.1529412, 0, 1, 1,
0.4870785, -0.4627936, 2.521691, 0.1568628, 0, 1, 1,
0.4888368, 0.3427576, 0.5325713, 0.1647059, 0, 1, 1,
0.4918627, 1.54928, 1.145251, 0.1686275, 0, 1, 1,
0.4930354, -0.3608173, 2.045035, 0.1764706, 0, 1, 1,
0.4957077, -0.6947721, 1.10837, 0.1803922, 0, 1, 1,
0.4958558, 2.220374, 0.3759412, 0.1882353, 0, 1, 1,
0.4983062, 0.0094176, 0.5439135, 0.1921569, 0, 1, 1,
0.4997693, -2.002356, 4.247549, 0.2, 0, 1, 1,
0.5097766, -0.6660929, 3.007531, 0.2078431, 0, 1, 1,
0.5121622, -0.6534494, 1.366283, 0.2117647, 0, 1, 1,
0.5129881, 0.4399538, 0.3077206, 0.2196078, 0, 1, 1,
0.5184981, 0.6869148, -0.4432456, 0.2235294, 0, 1, 1,
0.5238861, 1.241268, -2.120671, 0.2313726, 0, 1, 1,
0.5285178, 0.267965, 0.3103378, 0.2352941, 0, 1, 1,
0.5320694, -0.4897777, 2.293867, 0.2431373, 0, 1, 1,
0.5324494, 1.277626, 1.383028, 0.2470588, 0, 1, 1,
0.536486, 0.5532242, 1.426015, 0.254902, 0, 1, 1,
0.5399492, 1.43666, 1.663589, 0.2588235, 0, 1, 1,
0.5419219, 0.2964382, 0.8839535, 0.2666667, 0, 1, 1,
0.5422496, -0.6558461, 2.684118, 0.2705882, 0, 1, 1,
0.5430105, 1.060714, -1.549146, 0.2784314, 0, 1, 1,
0.5457727, -0.358417, 2.946538, 0.282353, 0, 1, 1,
0.5470603, -1.746251, 1.621861, 0.2901961, 0, 1, 1,
0.5499191, -1.636077, 2.17888, 0.2941177, 0, 1, 1,
0.5510933, 0.3749378, 1.334844, 0.3019608, 0, 1, 1,
0.5511357, -0.5288135, 1.034552, 0.3098039, 0, 1, 1,
0.5546759, 1.919613, -0.1223575, 0.3137255, 0, 1, 1,
0.5580864, 0.4792215, -0.6009397, 0.3215686, 0, 1, 1,
0.5650562, -0.5687434, 2.606492, 0.3254902, 0, 1, 1,
0.568311, 1.200727, -0.7111053, 0.3333333, 0, 1, 1,
0.5762609, 0.4134886, 2.341842, 0.3372549, 0, 1, 1,
0.5818614, -0.1132984, 0.8903952, 0.345098, 0, 1, 1,
0.5820554, -0.5980519, -0.5630541, 0.3490196, 0, 1, 1,
0.5836577, -0.7248271, 1.854269, 0.3568628, 0, 1, 1,
0.5852742, 0.7003539, -0.06187265, 0.3607843, 0, 1, 1,
0.5893909, -0.834541, 0.02670239, 0.3686275, 0, 1, 1,
0.5925373, -1.52854, 2.677651, 0.372549, 0, 1, 1,
0.5939187, 0.2530289, 1.361458, 0.3803922, 0, 1, 1,
0.593951, -0.3566507, 3.261328, 0.3843137, 0, 1, 1,
0.5949264, -0.3927632, 0.573791, 0.3921569, 0, 1, 1,
0.5954028, -0.3360406, 1.798006, 0.3960784, 0, 1, 1,
0.607805, -0.7597162, 1.490461, 0.4039216, 0, 1, 1,
0.610284, -0.2833504, 1.793837, 0.4117647, 0, 1, 1,
0.6107798, -0.4752862, 0.845155, 0.4156863, 0, 1, 1,
0.6159455, -1.720639, 2.790879, 0.4235294, 0, 1, 1,
0.616901, -0.3441354, 1.370372, 0.427451, 0, 1, 1,
0.6193917, -0.8738037, 2.645801, 0.4352941, 0, 1, 1,
0.6209936, -0.4945846, 2.84658, 0.4392157, 0, 1, 1,
0.6230859, 2.569134, 0.7354094, 0.4470588, 0, 1, 1,
0.6294269, -0.07811382, 2.167905, 0.4509804, 0, 1, 1,
0.6296311, -0.4121971, 2.222871, 0.4588235, 0, 1, 1,
0.6299775, -1.19621, 1.810513, 0.4627451, 0, 1, 1,
0.6383016, -0.9110409, 1.097418, 0.4705882, 0, 1, 1,
0.6385487, 0.2219313, 0.7859893, 0.4745098, 0, 1, 1,
0.6412523, 0.6062663, 0.8661418, 0.4823529, 0, 1, 1,
0.6430078, -0.4586757, 2.665428, 0.4862745, 0, 1, 1,
0.6443236, 1.462938, -0.04699101, 0.4941176, 0, 1, 1,
0.6469455, 0.5864287, 0.2363859, 0.5019608, 0, 1, 1,
0.6553969, 0.2350918, 2.216887, 0.5058824, 0, 1, 1,
0.659473, -0.03744723, 2.804517, 0.5137255, 0, 1, 1,
0.6650644, 0.1228362, 1.661089, 0.5176471, 0, 1, 1,
0.6685415, -0.461542, 2.285877, 0.5254902, 0, 1, 1,
0.6733414, 1.36754, -1.041152, 0.5294118, 0, 1, 1,
0.6741769, 0.9867747, 0.6653733, 0.5372549, 0, 1, 1,
0.6759332, 0.2262383, 2.065304, 0.5411765, 0, 1, 1,
0.6925854, -1.192068, 2.559902, 0.5490196, 0, 1, 1,
0.6970774, 0.7900141, 1.90089, 0.5529412, 0, 1, 1,
0.6997927, 0.2982263, 1.829487, 0.5607843, 0, 1, 1,
0.7052634, 0.2800728, 0.9499366, 0.5647059, 0, 1, 1,
0.7080469, -1.643321, 3.59493, 0.572549, 0, 1, 1,
0.7169214, -0.0145528, 2.20405, 0.5764706, 0, 1, 1,
0.7177719, -0.5537716, 2.478603, 0.5843138, 0, 1, 1,
0.7217675, -0.3704076, 1.854629, 0.5882353, 0, 1, 1,
0.7248183, 0.1019874, 2.519706, 0.5960785, 0, 1, 1,
0.7250048, -0.04183416, 2.217602, 0.6039216, 0, 1, 1,
0.7252653, 0.4939496, 1.723119, 0.6078432, 0, 1, 1,
0.7269526, -0.2290906, 2.418325, 0.6156863, 0, 1, 1,
0.731751, 0.7787134, 1.582284, 0.6196079, 0, 1, 1,
0.7392328, -0.1002307, 2.75389, 0.627451, 0, 1, 1,
0.7469181, -0.7345562, 1.795565, 0.6313726, 0, 1, 1,
0.7475919, 0.1143681, 0.4539938, 0.6392157, 0, 1, 1,
0.7488245, 0.4987773, 1.775935, 0.6431373, 0, 1, 1,
0.7636268, 0.903188, 1.023877, 0.6509804, 0, 1, 1,
0.7646177, 0.03434072, 1.513147, 0.654902, 0, 1, 1,
0.7685747, -0.6095055, 2.933741, 0.6627451, 0, 1, 1,
0.7693495, 0.4829548, 3.210471, 0.6666667, 0, 1, 1,
0.7703474, 1.207965, 0.2610345, 0.6745098, 0, 1, 1,
0.7741362, 1.012288, -0.002183078, 0.6784314, 0, 1, 1,
0.7902702, 0.1464258, 2.414338, 0.6862745, 0, 1, 1,
0.7927541, -1.304785, 0.5585862, 0.6901961, 0, 1, 1,
0.7956036, 0.5545136, -0.3083048, 0.6980392, 0, 1, 1,
0.8038417, 1.870311, 0.7067985, 0.7058824, 0, 1, 1,
0.807458, 2.070536, 1.879465, 0.7098039, 0, 1, 1,
0.8093807, -0.2614118, 1.088951, 0.7176471, 0, 1, 1,
0.811522, -1.088885, 3.08472, 0.7215686, 0, 1, 1,
0.8135015, 1.432461, 0.2425853, 0.7294118, 0, 1, 1,
0.8141423, 0.4395045, 0.7322596, 0.7333333, 0, 1, 1,
0.816234, -0.4917292, 1.953871, 0.7411765, 0, 1, 1,
0.8212885, -0.7026219, 1.858195, 0.7450981, 0, 1, 1,
0.8236051, -0.887983, 2.715777, 0.7529412, 0, 1, 1,
0.8264037, 0.7102898, -1.006704, 0.7568628, 0, 1, 1,
0.8272455, 0.1135544, 1.519205, 0.7647059, 0, 1, 1,
0.8284479, 2.130823, 0.1034253, 0.7686275, 0, 1, 1,
0.8302143, -0.06682333, 2.688218, 0.7764706, 0, 1, 1,
0.8324332, 0.05855047, 0.7832875, 0.7803922, 0, 1, 1,
0.8335978, 1.482333, 2.542186, 0.7882353, 0, 1, 1,
0.8352154, 0.5536778, 0.7643607, 0.7921569, 0, 1, 1,
0.8361318, -0.9320572, 2.488029, 0.8, 0, 1, 1,
0.8391426, -0.8505056, 1.443731, 0.8078431, 0, 1, 1,
0.8397655, -0.5206149, 2.631327, 0.8117647, 0, 1, 1,
0.8469198, 0.9505577, 1.028085, 0.8196079, 0, 1, 1,
0.8470112, 2.520043, 1.431672, 0.8235294, 0, 1, 1,
0.848488, 0.4610008, 1.863448, 0.8313726, 0, 1, 1,
0.8573499, 0.7891576, 1.925308, 0.8352941, 0, 1, 1,
0.8603096, -0.5359813, 1.94003, 0.8431373, 0, 1, 1,
0.8604489, -0.9528598, 2.824123, 0.8470588, 0, 1, 1,
0.8627331, -0.6926087, 1.600647, 0.854902, 0, 1, 1,
0.8734727, 0.3409153, 0.7185987, 0.8588235, 0, 1, 1,
0.8750914, 0.5001897, 3.21562, 0.8666667, 0, 1, 1,
0.8752446, -1.09368, 3.336842, 0.8705882, 0, 1, 1,
0.876031, -0.05828861, 1.593901, 0.8784314, 0, 1, 1,
0.8793688, 0.7901414, 1.361387, 0.8823529, 0, 1, 1,
0.8805815, -0.04688813, 1.601429, 0.8901961, 0, 1, 1,
0.8857964, -0.07271858, 0.6437968, 0.8941177, 0, 1, 1,
0.889302, 0.3479023, 2.196475, 0.9019608, 0, 1, 1,
0.9011981, 1.41188, -0.7057875, 0.9098039, 0, 1, 1,
0.9033332, -1.07763, 2.518674, 0.9137255, 0, 1, 1,
0.9062722, -0.8216884, -0.3697449, 0.9215686, 0, 1, 1,
0.9112545, 1.441668, -0.5479993, 0.9254902, 0, 1, 1,
0.9115585, -0.1774323, 2.162231, 0.9333333, 0, 1, 1,
0.9154611, -1.433251, 0.8358602, 0.9372549, 0, 1, 1,
0.916515, -1.402362, 1.130479, 0.945098, 0, 1, 1,
0.9208476, -0.397398, 2.002451, 0.9490196, 0, 1, 1,
0.9244759, 0.5829692, 0.6948614, 0.9568627, 0, 1, 1,
0.9307563, -1.143048, 2.922015, 0.9607843, 0, 1, 1,
0.9309542, 0.2641032, 2.028512, 0.9686275, 0, 1, 1,
0.9316234, -0.7999557, 2.762824, 0.972549, 0, 1, 1,
0.9323086, -0.1202416, 1.256447, 0.9803922, 0, 1, 1,
0.9334825, 0.5508859, 0.7349988, 0.9843137, 0, 1, 1,
0.9373074, 0.7714766, 0.725759, 0.9921569, 0, 1, 1,
0.9377694, -0.3629852, 1.307502, 0.9960784, 0, 1, 1,
0.9385245, -1.502693, 1.593682, 1, 0, 0.9960784, 1,
0.9399905, -0.8826447, 1.009652, 1, 0, 0.9882353, 1,
0.943118, 2.392945, -0.05752349, 1, 0, 0.9843137, 1,
0.9437193, -0.1820697, 1.193313, 1, 0, 0.9764706, 1,
0.9464763, -0.9462904, 3.435671, 1, 0, 0.972549, 1,
0.9506238, -1.764284, 1.2355, 1, 0, 0.9647059, 1,
0.9563756, -0.152569, 0.227086, 1, 0, 0.9607843, 1,
0.9581071, -1.27352, 2.751318, 1, 0, 0.9529412, 1,
0.9632223, -0.5839977, 2.922099, 1, 0, 0.9490196, 1,
0.9671491, 1.269338, -1.876504, 1, 0, 0.9411765, 1,
0.9719136, 0.7106137, -0.7162866, 1, 0, 0.9372549, 1,
0.9733453, 0.1341912, 2.180124, 1, 0, 0.9294118, 1,
0.9848256, 1.752786, 3.406725, 1, 0, 0.9254902, 1,
0.991107, 2.362925, 2.230517, 1, 0, 0.9176471, 1,
0.9947393, 1.426845, 2.538535, 1, 0, 0.9137255, 1,
1.006042, 0.003457015, 2.770469, 1, 0, 0.9058824, 1,
1.015897, 1.374654, 2.187366, 1, 0, 0.9019608, 1,
1.016428, -1.15514, 3.815711, 1, 0, 0.8941177, 1,
1.01789, -2.39645, 2.570349, 1, 0, 0.8862745, 1,
1.019102, -1.554996, 3.176565, 1, 0, 0.8823529, 1,
1.022553, 0.1038082, 0.9514447, 1, 0, 0.8745098, 1,
1.025088, 0.157838, 2.383756, 1, 0, 0.8705882, 1,
1.032672, 0.5177602, 1.219205, 1, 0, 0.8627451, 1,
1.041261, 1.368374, -0.3343298, 1, 0, 0.8588235, 1,
1.043204, 0.5559565, 2.419312, 1, 0, 0.8509804, 1,
1.043747, 0.6909819, 0.6878293, 1, 0, 0.8470588, 1,
1.044369, 0.540799, -0.1398713, 1, 0, 0.8392157, 1,
1.049652, 0.2588074, -0.394567, 1, 0, 0.8352941, 1,
1.057148, -0.5433725, 0.1052671, 1, 0, 0.827451, 1,
1.059334, -0.5511923, 1.026385, 1, 0, 0.8235294, 1,
1.065024, -0.2638296, 1.353762, 1, 0, 0.8156863, 1,
1.072335, -0.7560341, 0.8366476, 1, 0, 0.8117647, 1,
1.072795, -0.8287644, 4.10689, 1, 0, 0.8039216, 1,
1.073319, 0.6946307, 0.9544669, 1, 0, 0.7960784, 1,
1.077903, -0.9039496, 0.6807796, 1, 0, 0.7921569, 1,
1.090101, 0.2413644, 0.3657509, 1, 0, 0.7843137, 1,
1.099917, -0.3306582, 2.789751, 1, 0, 0.7803922, 1,
1.101792, 0.903249, 0.7567458, 1, 0, 0.772549, 1,
1.105345, -1.046796, 1.536129, 1, 0, 0.7686275, 1,
1.112347, -0.4760834, 4.266545, 1, 0, 0.7607843, 1,
1.114923, 1.074876, 0.8399635, 1, 0, 0.7568628, 1,
1.123535, 0.1893579, 2.626207, 1, 0, 0.7490196, 1,
1.126596, 0.6820928, 1.642849, 1, 0, 0.7450981, 1,
1.135964, -0.3478031, 1.646114, 1, 0, 0.7372549, 1,
1.139104, 1.041747, 1.568836, 1, 0, 0.7333333, 1,
1.139465, 0.5631989, 2.045596, 1, 0, 0.7254902, 1,
1.140572, 0.2207268, 1.522087, 1, 0, 0.7215686, 1,
1.146053, 0.488264, 0.4118277, 1, 0, 0.7137255, 1,
1.148498, -0.9811661, 3.196176, 1, 0, 0.7098039, 1,
1.152689, 0.5298161, 0.6947138, 1, 0, 0.7019608, 1,
1.152844, -0.712944, 1.250704, 1, 0, 0.6941177, 1,
1.178368, 0.3719973, 1.35357, 1, 0, 0.6901961, 1,
1.185314, 1.011461, 2.202183, 1, 0, 0.682353, 1,
1.187963, 2.272841, 1.652507, 1, 0, 0.6784314, 1,
1.206944, 0.9005883, -0.1776004, 1, 0, 0.6705883, 1,
1.21939, -0.8704377, 2.032783, 1, 0, 0.6666667, 1,
1.221505, 0.4932747, 0.1548021, 1, 0, 0.6588235, 1,
1.227249, 0.4442719, 2.310626, 1, 0, 0.654902, 1,
1.237244, -0.4784943, 1.920934, 1, 0, 0.6470588, 1,
1.237722, -0.6045653, 3.712505, 1, 0, 0.6431373, 1,
1.257246, 0.1405887, 2.147724, 1, 0, 0.6352941, 1,
1.257437, -0.08104082, 2.634164, 1, 0, 0.6313726, 1,
1.271056, 1.230719, 0.7799271, 1, 0, 0.6235294, 1,
1.282369, 1.933143, 0.5554352, 1, 0, 0.6196079, 1,
1.282416, 1.129684, 0.08224106, 1, 0, 0.6117647, 1,
1.286357, 1.918681, -0.3646118, 1, 0, 0.6078432, 1,
1.286799, 0.785844, -0.07417465, 1, 0, 0.6, 1,
1.287174, -1.598754, 1.390545, 1, 0, 0.5921569, 1,
1.287946, 1.161676, 0.7921456, 1, 0, 0.5882353, 1,
1.289414, 0.5115544, 1.78089, 1, 0, 0.5803922, 1,
1.301132, 0.3794155, 1.259419, 1, 0, 0.5764706, 1,
1.304944, 0.550784, 0.8933426, 1, 0, 0.5686275, 1,
1.314191, 1.487676, 0.06038567, 1, 0, 0.5647059, 1,
1.315398, -0.3201717, 2.131991, 1, 0, 0.5568628, 1,
1.320061, -0.9993744, 1.944472, 1, 0, 0.5529412, 1,
1.320945, -0.6064435, 1.861171, 1, 0, 0.5450981, 1,
1.321688, 1.382824, 1.26387, 1, 0, 0.5411765, 1,
1.328251, -0.8490151, 1.188871, 1, 0, 0.5333334, 1,
1.329046, 0.7410569, 1.20665, 1, 0, 0.5294118, 1,
1.329755, 1.778376, 1.011888, 1, 0, 0.5215687, 1,
1.338781, 0.170151, 0.2684104, 1, 0, 0.5176471, 1,
1.358076, 0.8443707, 0.4592098, 1, 0, 0.509804, 1,
1.35919, -2.56118, 3.231329, 1, 0, 0.5058824, 1,
1.360351, 1.071285, 2.08078, 1, 0, 0.4980392, 1,
1.363327, 1.243561, 0.8542043, 1, 0, 0.4901961, 1,
1.368861, -0.4571538, 2.377309, 1, 0, 0.4862745, 1,
1.379656, -0.5587754, 0.152238, 1, 0, 0.4784314, 1,
1.386756, 2.408296, 0.4003083, 1, 0, 0.4745098, 1,
1.387014, -0.227123, 1.955431, 1, 0, 0.4666667, 1,
1.388174, -1.078666, 4.128277, 1, 0, 0.4627451, 1,
1.396024, 0.9452332, 1.5856, 1, 0, 0.454902, 1,
1.412041, 1.317623, 0.6585751, 1, 0, 0.4509804, 1,
1.439285, -0.5988644, 1.792875, 1, 0, 0.4431373, 1,
1.444842, 0.4758543, 1.459118, 1, 0, 0.4392157, 1,
1.447368, 0.835354, 1.620807, 1, 0, 0.4313726, 1,
1.453745, -0.0465848, 2.804976, 1, 0, 0.427451, 1,
1.457095, -0.1582717, 2.267763, 1, 0, 0.4196078, 1,
1.460585, -0.05227814, 2.946432, 1, 0, 0.4156863, 1,
1.465573, 0.06758635, 3.192142, 1, 0, 0.4078431, 1,
1.467152, 0.151477, 2.802214, 1, 0, 0.4039216, 1,
1.470807, 0.282035, -0.09599777, 1, 0, 0.3960784, 1,
1.472286, 0.01224421, 1.030227, 1, 0, 0.3882353, 1,
1.520179, 1.939247, -0.6290827, 1, 0, 0.3843137, 1,
1.526441, 0.4709736, 2.209198, 1, 0, 0.3764706, 1,
1.536824, 0.535493, 1.628839, 1, 0, 0.372549, 1,
1.537309, 0.4213315, 1.820526, 1, 0, 0.3647059, 1,
1.538156, -0.7811649, 1.762491, 1, 0, 0.3607843, 1,
1.550048, -1.080198, 1.965439, 1, 0, 0.3529412, 1,
1.553611, -0.8094379, 1.368794, 1, 0, 0.3490196, 1,
1.571209, -1.04835, 3.18346, 1, 0, 0.3411765, 1,
1.577282, 1.294792, 1.451, 1, 0, 0.3372549, 1,
1.58646, -0.2346198, 4.411351, 1, 0, 0.3294118, 1,
1.60038, 0.2040962, 1.679374, 1, 0, 0.3254902, 1,
1.60911, 1.138866, 0.8448213, 1, 0, 0.3176471, 1,
1.612082, 1.353099, 0.3979534, 1, 0, 0.3137255, 1,
1.613762, -0.1517114, 0.6789175, 1, 0, 0.3058824, 1,
1.619038, -0.7208326, 1.989786, 1, 0, 0.2980392, 1,
1.62789, 2.3862, 0.1679919, 1, 0, 0.2941177, 1,
1.667478, -0.6722834, 0.3253878, 1, 0, 0.2862745, 1,
1.69561, 0.9708807, 2.130043, 1, 0, 0.282353, 1,
1.698718, 0.3996977, 1.215368, 1, 0, 0.2745098, 1,
1.711965, 2.045326, -0.9262618, 1, 0, 0.2705882, 1,
1.717917, -2.262099, 0.8047367, 1, 0, 0.2627451, 1,
1.738933, 0.4237925, 0.7729316, 1, 0, 0.2588235, 1,
1.743914, -0.4681274, 3.689871, 1, 0, 0.2509804, 1,
1.757329, 0.09379197, 2.090171, 1, 0, 0.2470588, 1,
1.768207, -0.7806094, 1.547114, 1, 0, 0.2392157, 1,
1.771299, -0.3160613, 1.3666, 1, 0, 0.2352941, 1,
1.802821, -0.7970817, 1.557073, 1, 0, 0.227451, 1,
1.874773, 1.230609, 1.256104, 1, 0, 0.2235294, 1,
1.888765, 0.2844809, 2.397254, 1, 0, 0.2156863, 1,
1.891091, 0.9325458, 1.227129, 1, 0, 0.2117647, 1,
1.893792, -0.06914001, 1.683827, 1, 0, 0.2039216, 1,
1.900766, -0.1102745, 2.836649, 1, 0, 0.1960784, 1,
1.920017, -1.226263, 0.9274426, 1, 0, 0.1921569, 1,
1.92063, 0.5552123, 0.0358327, 1, 0, 0.1843137, 1,
1.947041, -0.471216, 0.8942783, 1, 0, 0.1803922, 1,
1.949592, 0.3257665, 1.224894, 1, 0, 0.172549, 1,
1.950006, -0.5319855, 1.904911, 1, 0, 0.1686275, 1,
1.958605, 0.6995754, -0.3663985, 1, 0, 0.1607843, 1,
1.992851, -0.8448955, 1.485713, 1, 0, 0.1568628, 1,
2.006669, 2.351299, 2.98208, 1, 0, 0.1490196, 1,
2.102293, 1.995562, 2.04533, 1, 0, 0.145098, 1,
2.148008, -1.22805, 1.912577, 1, 0, 0.1372549, 1,
2.154089, 1.943723, 0.7362828, 1, 0, 0.1333333, 1,
2.161014, -0.9232444, 2.850698, 1, 0, 0.1254902, 1,
2.184001, -0.1827874, 1.458683, 1, 0, 0.1215686, 1,
2.187109, -2.109188, 2.354921, 1, 0, 0.1137255, 1,
2.249088, 0.4993923, 2.147658, 1, 0, 0.1098039, 1,
2.258183, 0.7193822, 1.444667, 1, 0, 0.1019608, 1,
2.262858, 0.312983, 1.113796, 1, 0, 0.09411765, 1,
2.26784, 0.2703795, 0.7982017, 1, 0, 0.09019608, 1,
2.336859, -0.6204947, 0.7612001, 1, 0, 0.08235294, 1,
2.369739, 0.1209007, 2.174989, 1, 0, 0.07843138, 1,
2.370462, 0.8395864, 3.523995, 1, 0, 0.07058824, 1,
2.408312, 0.4246164, 0.9895588, 1, 0, 0.06666667, 1,
2.423432, -1.495945, 1.674366, 1, 0, 0.05882353, 1,
2.460046, -0.1973915, 2.502046, 1, 0, 0.05490196, 1,
2.511594, -1.779962, 2.402624, 1, 0, 0.04705882, 1,
2.575149, 2.564284, 0.7269744, 1, 0, 0.04313726, 1,
2.581415, 0.4809101, 0.4702925, 1, 0, 0.03529412, 1,
2.678227, -0.6618169, 4.753793, 1, 0, 0.03137255, 1,
2.68936, 0.1006449, 1.865008, 1, 0, 0.02352941, 1,
2.729879, 0.9261974, 1.74341, 1, 0, 0.01960784, 1,
3.304173, 0.5860883, 1.122653, 1, 0, 0.01176471, 1,
3.610327, 0.1450874, 0.2205316, 1, 0, 0.007843138, 1
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
0.06271422, -4.625407, -6.372147, 0, -0.5, 0.5, 0.5,
0.06271422, -4.625407, -6.372147, 1, -0.5, 0.5, 0.5,
0.06271422, -4.625407, -6.372147, 1, 1.5, 0.5, 0.5,
0.06271422, -4.625407, -6.372147, 0, 1.5, 0.5, 0.5
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
-4.687539, 0.2938524, -6.372147, 0, -0.5, 0.5, 0.5,
-4.687539, 0.2938524, -6.372147, 1, -0.5, 0.5, 0.5,
-4.687539, 0.2938524, -6.372147, 1, 1.5, 0.5, 0.5,
-4.687539, 0.2938524, -6.372147, 0, 1.5, 0.5, 0.5
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
-4.687539, -4.625407, -0.002914906, 0, -0.5, 0.5, 0.5,
-4.687539, -4.625407, -0.002914906, 1, -0.5, 0.5, 0.5,
-4.687539, -4.625407, -0.002914906, 1, 1.5, 0.5, 0.5,
-4.687539, -4.625407, -0.002914906, 0, 1.5, 0.5, 0.5
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
-2, -3.490193, -4.902324,
2, -3.490193, -4.902324,
-2, -3.490193, -4.902324,
-2, -3.679396, -5.147294,
0, -3.490193, -4.902324,
0, -3.679396, -5.147294,
2, -3.490193, -4.902324,
2, -3.679396, -5.147294
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
"0",
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
-2, -4.0578, -5.637235, 0, -0.5, 0.5, 0.5,
-2, -4.0578, -5.637235, 1, -0.5, 0.5, 0.5,
-2, -4.0578, -5.637235, 1, 1.5, 0.5, 0.5,
-2, -4.0578, -5.637235, 0, 1.5, 0.5, 0.5,
0, -4.0578, -5.637235, 0, -0.5, 0.5, 0.5,
0, -4.0578, -5.637235, 1, -0.5, 0.5, 0.5,
0, -4.0578, -5.637235, 1, 1.5, 0.5, 0.5,
0, -4.0578, -5.637235, 0, 1.5, 0.5, 0.5,
2, -4.0578, -5.637235, 0, -0.5, 0.5, 0.5,
2, -4.0578, -5.637235, 1, -0.5, 0.5, 0.5,
2, -4.0578, -5.637235, 1, 1.5, 0.5, 0.5,
2, -4.0578, -5.637235, 0, 1.5, 0.5, 0.5
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
-3.591327, -2, -4.902324,
-3.591327, 2, -4.902324,
-3.591327, -2, -4.902324,
-3.774029, -2, -5.147294,
-3.591327, 0, -4.902324,
-3.774029, 0, -5.147294,
-3.591327, 2, -4.902324,
-3.774029, 2, -5.147294
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
-4.139433, -2, -5.637235, 0, -0.5, 0.5, 0.5,
-4.139433, -2, -5.637235, 1, -0.5, 0.5, 0.5,
-4.139433, -2, -5.637235, 1, 1.5, 0.5, 0.5,
-4.139433, -2, -5.637235, 0, 1.5, 0.5, 0.5,
-4.139433, 0, -5.637235, 0, -0.5, 0.5, 0.5,
-4.139433, 0, -5.637235, 1, -0.5, 0.5, 0.5,
-4.139433, 0, -5.637235, 1, 1.5, 0.5, 0.5,
-4.139433, 0, -5.637235, 0, 1.5, 0.5, 0.5,
-4.139433, 2, -5.637235, 0, -0.5, 0.5, 0.5,
-4.139433, 2, -5.637235, 1, -0.5, 0.5, 0.5,
-4.139433, 2, -5.637235, 1, 1.5, 0.5, 0.5,
-4.139433, 2, -5.637235, 0, 1.5, 0.5, 0.5
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
-3.591327, -3.490193, -4,
-3.591327, -3.490193, 4,
-3.591327, -3.490193, -4,
-3.774029, -3.679396, -4,
-3.591327, -3.490193, -2,
-3.774029, -3.679396, -2,
-3.591327, -3.490193, 0,
-3.774029, -3.679396, 0,
-3.591327, -3.490193, 2,
-3.774029, -3.679396, 2,
-3.591327, -3.490193, 4,
-3.774029, -3.679396, 4
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
-4.139433, -4.0578, -4, 0, -0.5, 0.5, 0.5,
-4.139433, -4.0578, -4, 1, -0.5, 0.5, 0.5,
-4.139433, -4.0578, -4, 1, 1.5, 0.5, 0.5,
-4.139433, -4.0578, -4, 0, 1.5, 0.5, 0.5,
-4.139433, -4.0578, -2, 0, -0.5, 0.5, 0.5,
-4.139433, -4.0578, -2, 1, -0.5, 0.5, 0.5,
-4.139433, -4.0578, -2, 1, 1.5, 0.5, 0.5,
-4.139433, -4.0578, -2, 0, 1.5, 0.5, 0.5,
-4.139433, -4.0578, 0, 0, -0.5, 0.5, 0.5,
-4.139433, -4.0578, 0, 1, -0.5, 0.5, 0.5,
-4.139433, -4.0578, 0, 1, 1.5, 0.5, 0.5,
-4.139433, -4.0578, 0, 0, 1.5, 0.5, 0.5,
-4.139433, -4.0578, 2, 0, -0.5, 0.5, 0.5,
-4.139433, -4.0578, 2, 1, -0.5, 0.5, 0.5,
-4.139433, -4.0578, 2, 1, 1.5, 0.5, 0.5,
-4.139433, -4.0578, 2, 0, 1.5, 0.5, 0.5,
-4.139433, -4.0578, 4, 0, -0.5, 0.5, 0.5,
-4.139433, -4.0578, 4, 1, -0.5, 0.5, 0.5,
-4.139433, -4.0578, 4, 1, 1.5, 0.5, 0.5,
-4.139433, -4.0578, 4, 0, 1.5, 0.5, 0.5
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
-3.591327, -3.490193, -4.902324,
-3.591327, 4.077898, -4.902324,
-3.591327, -3.490193, 4.896494,
-3.591327, 4.077898, 4.896494,
-3.591327, -3.490193, -4.902324,
-3.591327, -3.490193, 4.896494,
-3.591327, 4.077898, -4.902324,
-3.591327, 4.077898, 4.896494,
-3.591327, -3.490193, -4.902324,
3.716755, -3.490193, -4.902324,
-3.591327, -3.490193, 4.896494,
3.716755, -3.490193, 4.896494,
-3.591327, 4.077898, -4.902324,
3.716755, 4.077898, -4.902324,
-3.591327, 4.077898, 4.896494,
3.716755, 4.077898, 4.896494,
3.716755, -3.490193, -4.902324,
3.716755, 4.077898, -4.902324,
3.716755, -3.490193, 4.896494,
3.716755, 4.077898, 4.896494,
3.716755, -3.490193, -4.902324,
3.716755, -3.490193, 4.896494,
3.716755, 4.077898, -4.902324,
3.716755, 4.077898, 4.896494
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
var radius = 7.67709;
var distance = 34.15624;
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
mvMatrix.translate( -0.06271422, -0.2938524, 0.002914906 );
mvMatrix.scale( 1.135814, 1.096792, 0.8471043 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.15624);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
resmethrin<-read.table("resmethrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-resmethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'resmethrin' not found
```

```r
y<-resmethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'resmethrin' not found
```

```r
z<-resmethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'resmethrin' not found
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
-3.484898, 0.6446604, -2.598486, 0, 0, 1, 1, 1,
-2.495885, -0.1818729, -2.388817, 1, 0, 0, 1, 1,
-2.434792, 1.216826, -2.232074, 1, 0, 0, 1, 1,
-2.387142, 1.66116, -0.2079643, 1, 0, 0, 1, 1,
-2.370842, 1.484452, -2.668787, 1, 0, 0, 1, 1,
-2.348821, 0.5610414, -0.6800911, 1, 0, 0, 1, 1,
-2.343746, 1.301906, -2.940247, 0, 0, 0, 1, 1,
-2.319907, 0.923512, -0.828915, 0, 0, 0, 1, 1,
-2.201015, 1.156325, 0.7600518, 0, 0, 0, 1, 1,
-2.157448, -0.2084044, -2.139422, 0, 0, 0, 1, 1,
-2.136937, -0.7094878, -0.942925, 0, 0, 0, 1, 1,
-2.136016, -0.2088532, -2.353025, 0, 0, 0, 1, 1,
-2.127399, 1.65432, -0.2502795, 0, 0, 0, 1, 1,
-2.102476, -1.247692, -1.769535, 1, 1, 1, 1, 1,
-2.093823, 0.7050035, -1.116953, 1, 1, 1, 1, 1,
-2.085324, 1.175776, -0.4297849, 1, 1, 1, 1, 1,
-2.081025, 0.3844832, -2.902449, 1, 1, 1, 1, 1,
-2.069229, -0.4848993, -1.565946, 1, 1, 1, 1, 1,
-2.036657, 2.372012, -0.4524713, 1, 1, 1, 1, 1,
-2.029285, -0.0409827, -3.342482, 1, 1, 1, 1, 1,
-2.004078, -0.8510284, -1.361136, 1, 1, 1, 1, 1,
-2.003984, -1.605614, -1.665981, 1, 1, 1, 1, 1,
-1.988842, -1.534363, -2.422561, 1, 1, 1, 1, 1,
-1.988185, -0.03665869, -1.986152, 1, 1, 1, 1, 1,
-1.963497, -1.03371, -2.214928, 1, 1, 1, 1, 1,
-1.957834, -1.171364, -3.084628, 1, 1, 1, 1, 1,
-1.931942, 1.25349, -0.2529348, 1, 1, 1, 1, 1,
-1.901655, -1.717649, -1.826786, 1, 1, 1, 1, 1,
-1.860469, -0.4200656, -0.5507742, 0, 0, 1, 1, 1,
-1.859151, -1.181226, -2.129591, 1, 0, 0, 1, 1,
-1.851059, 2.082934, -0.1216417, 1, 0, 0, 1, 1,
-1.849799, -0.04141614, -1.542016, 1, 0, 0, 1, 1,
-1.843748, 1.83743, 0.03844447, 1, 0, 0, 1, 1,
-1.834398, 0.488953, -2.184697, 1, 0, 0, 1, 1,
-1.82748, -0.7501358, -2.026333, 0, 0, 0, 1, 1,
-1.791246, 0.1066714, -1.037365, 0, 0, 0, 1, 1,
-1.781231, -0.1419444, -1.031474, 0, 0, 0, 1, 1,
-1.780309, -1.390209, -3.232163, 0, 0, 0, 1, 1,
-1.76775, 0.5216642, -0.4249941, 0, 0, 0, 1, 1,
-1.767563, -0.6745942, -1.060004, 0, 0, 0, 1, 1,
-1.765278, 0.2492085, -2.247364, 0, 0, 0, 1, 1,
-1.761973, -0.7345182, -2.568283, 1, 1, 1, 1, 1,
-1.753617, -0.8430645, -2.629103, 1, 1, 1, 1, 1,
-1.700412, -0.2052148, 0.04040099, 1, 1, 1, 1, 1,
-1.685717, -0.9018934, -1.795541, 1, 1, 1, 1, 1,
-1.66338, 0.308232, -1.308578, 1, 1, 1, 1, 1,
-1.662341, 1.422936, -0.5474471, 1, 1, 1, 1, 1,
-1.63079, 0.3871555, -1.299364, 1, 1, 1, 1, 1,
-1.630484, -0.1556505, -0.554004, 1, 1, 1, 1, 1,
-1.622689, -1.255357, -4.23066, 1, 1, 1, 1, 1,
-1.620863, 0.8529601, -0.9394169, 1, 1, 1, 1, 1,
-1.620348, -0.1592118, -0.9807991, 1, 1, 1, 1, 1,
-1.612518, 1.528168, -1.490199, 1, 1, 1, 1, 1,
-1.594197, -2.212703, -4.128159, 1, 1, 1, 1, 1,
-1.593101, -2.25801, -3.516605, 1, 1, 1, 1, 1,
-1.577809, 1.760459, -0.5953729, 1, 1, 1, 1, 1,
-1.569214, -0.9315568, 0.1268945, 0, 0, 1, 1, 1,
-1.553168, -1.08173, -2.374769, 1, 0, 0, 1, 1,
-1.527716, 1.081746, -2.583658, 1, 0, 0, 1, 1,
-1.523049, -1.408597, -1.741781, 1, 0, 0, 1, 1,
-1.522137, -1.681953, -2.707499, 1, 0, 0, 1, 1,
-1.521648, 0.03518679, -1.42994, 1, 0, 0, 1, 1,
-1.516456, -0.5777995, -3.007031, 0, 0, 0, 1, 1,
-1.508595, -1.268196, -1.878384, 0, 0, 0, 1, 1,
-1.506672, -0.3717352, -2.609455, 0, 0, 0, 1, 1,
-1.502631, -0.9868055, -0.02981231, 0, 0, 0, 1, 1,
-1.490395, 0.2573261, -1.412226, 0, 0, 0, 1, 1,
-1.490312, -0.8203663, -3.204457, 0, 0, 0, 1, 1,
-1.48736, 1.184818, -1.463243, 0, 0, 0, 1, 1,
-1.484246, 1.032924, -1.245516, 1, 1, 1, 1, 1,
-1.48117, -2.345377, -1.8621, 1, 1, 1, 1, 1,
-1.47935, -1.683596, -2.045236, 1, 1, 1, 1, 1,
-1.476923, -0.2595233, -1.015019, 1, 1, 1, 1, 1,
-1.47489, -0.4485503, -3.416446, 1, 1, 1, 1, 1,
-1.460046, -1.226149, -2.180327, 1, 1, 1, 1, 1,
-1.457111, -0.3988256, -1.739026, 1, 1, 1, 1, 1,
-1.45552, -0.5086582, -0.6898695, 1, 1, 1, 1, 1,
-1.453748, -0.9803548, -1.378085, 1, 1, 1, 1, 1,
-1.451877, 0.7254772, 0.476307, 1, 1, 1, 1, 1,
-1.448655, 0.809064, -0.8476508, 1, 1, 1, 1, 1,
-1.44553, 0.8656067, -2.956811, 1, 1, 1, 1, 1,
-1.433773, 1.980167, -1.563431, 1, 1, 1, 1, 1,
-1.417724, 1.114454, 0.3278607, 1, 1, 1, 1, 1,
-1.402106, 0.5487341, -1.729173, 1, 1, 1, 1, 1,
-1.395741, -0.3965584, -2.097477, 0, 0, 1, 1, 1,
-1.394518, 1.554795, -0.2576681, 1, 0, 0, 1, 1,
-1.390321, -0.9946248, -2.258837, 1, 0, 0, 1, 1,
-1.381681, 0.3492037, -1.401611, 1, 0, 0, 1, 1,
-1.368086, 1.511185, -1.263408, 1, 0, 0, 1, 1,
-1.367442, 0.9198817, -2.477743, 1, 0, 0, 1, 1,
-1.366617, 0.7657793, -0.4262097, 0, 0, 0, 1, 1,
-1.364735, 0.109635, 0.3590434, 0, 0, 0, 1, 1,
-1.357072, -0.2200475, -2.762828, 0, 0, 0, 1, 1,
-1.342732, -1.895186, -1.940192, 0, 0, 0, 1, 1,
-1.335314, 0.7035071, -0.5627336, 0, 0, 0, 1, 1,
-1.328248, 0.005939142, -2.362393, 0, 0, 0, 1, 1,
-1.327426, 0.4350832, -0.5637066, 0, 0, 0, 1, 1,
-1.32347, -0.9460868, -2.81775, 1, 1, 1, 1, 1,
-1.315373, -0.9405239, -0.662511, 1, 1, 1, 1, 1,
-1.312986, 0.8753687, 0.462363, 1, 1, 1, 1, 1,
-1.308563, -1.03849, -4.033778, 1, 1, 1, 1, 1,
-1.306917, 0.1717202, -1.087912, 1, 1, 1, 1, 1,
-1.305431, -0.9013305, -3.969951, 1, 1, 1, 1, 1,
-1.305178, 0.9873118, -1.661844, 1, 1, 1, 1, 1,
-1.304864, 0.3055888, -1.700414, 1, 1, 1, 1, 1,
-1.30241, -1.434376, -3.774394, 1, 1, 1, 1, 1,
-1.297448, -1.32327, -1.592351, 1, 1, 1, 1, 1,
-1.296843, -0.717237, -2.358242, 1, 1, 1, 1, 1,
-1.294117, -0.542888, -1.283214, 1, 1, 1, 1, 1,
-1.289035, 1.377891, -0.7106237, 1, 1, 1, 1, 1,
-1.288252, 0.5539513, -2.743036, 1, 1, 1, 1, 1,
-1.285778, -0.359585, -0.9146748, 1, 1, 1, 1, 1,
-1.285675, 0.3895652, -1.246093, 0, 0, 1, 1, 1,
-1.272807, -0.04842977, -2.829664, 1, 0, 0, 1, 1,
-1.269146, 0.8551304, -0.2418847, 1, 0, 0, 1, 1,
-1.266394, -1.426207, -2.265667, 1, 0, 0, 1, 1,
-1.259847, -0.03369606, -2.076851, 1, 0, 0, 1, 1,
-1.258552, -1.401186, -3.656808, 1, 0, 0, 1, 1,
-1.251325, 1.361919, -1.269866, 0, 0, 0, 1, 1,
-1.238014, 0.5862199, -0.7249737, 0, 0, 0, 1, 1,
-1.223436, -0.631806, -1.684608, 0, 0, 0, 1, 1,
-1.215835, -1.667667, -2.541348, 0, 0, 0, 1, 1,
-1.213025, -0.4110159, -1.361576, 0, 0, 0, 1, 1,
-1.212436, -0.7892888, -2.551697, 0, 0, 0, 1, 1,
-1.202739, 0.8532436, -1.0213, 0, 0, 0, 1, 1,
-1.199554, -0.6540851, -2.311215, 1, 1, 1, 1, 1,
-1.193759, 0.2120356, -0.722699, 1, 1, 1, 1, 1,
-1.189565, -1.516045, -2.457086, 1, 1, 1, 1, 1,
-1.159636, -0.8034039, -2.757593, 1, 1, 1, 1, 1,
-1.158785, -0.1013626, -1.494896, 1, 1, 1, 1, 1,
-1.151909, 1.664117, -0.3928769, 1, 1, 1, 1, 1,
-1.144291, -0.1350414, -1.824308, 1, 1, 1, 1, 1,
-1.136974, -0.6397433, -2.920715, 1, 1, 1, 1, 1,
-1.133344, 0.8640168, -1.516875, 1, 1, 1, 1, 1,
-1.132849, -0.03111682, -1.842539, 1, 1, 1, 1, 1,
-1.123919, -1.088944, -2.960195, 1, 1, 1, 1, 1,
-1.113366, 0.4266311, 0.248334, 1, 1, 1, 1, 1,
-1.112414, 0.8614044, 1.330462, 1, 1, 1, 1, 1,
-1.10858, -0.5543848, -2.147112, 1, 1, 1, 1, 1,
-1.099332, 1.827003, -1.509054, 1, 1, 1, 1, 1,
-1.093218, -0.6093839, -2.597302, 0, 0, 1, 1, 1,
-1.084358, 0.01140252, 0.07109611, 1, 0, 0, 1, 1,
-1.082569, -1.718688, 0.07472908, 1, 0, 0, 1, 1,
-1.081194, -1.260184, -2.419346, 1, 0, 0, 1, 1,
-1.078979, -0.976306, -0.617142, 1, 0, 0, 1, 1,
-1.078133, -1.958078, -4.759623, 1, 0, 0, 1, 1,
-1.076866, -0.6909294, -1.900708, 0, 0, 0, 1, 1,
-1.073995, -0.4794643, -2.51684, 0, 0, 0, 1, 1,
-1.07377, -0.7162335, -1.415183, 0, 0, 0, 1, 1,
-1.072332, 1.854688, 0.4884256, 0, 0, 0, 1, 1,
-1.065852, 1.76216, -2.428895, 0, 0, 0, 1, 1,
-1.064122, 0.7002276, -0.01014213, 0, 0, 0, 1, 1,
-1.058221, 0.8560068, -2.62691, 0, 0, 0, 1, 1,
-1.055721, -0.04025993, -2.883297, 1, 1, 1, 1, 1,
-1.052686, -0.6062363, -3.338597, 1, 1, 1, 1, 1,
-1.051104, -1.26277, -2.610977, 1, 1, 1, 1, 1,
-1.045022, 0.549389, -0.7393945, 1, 1, 1, 1, 1,
-1.044982, -1.773747, -4.709054, 1, 1, 1, 1, 1,
-1.043313, -0.9392348, -2.66237, 1, 1, 1, 1, 1,
-1.043175, -0.2966726, -2.000797, 1, 1, 1, 1, 1,
-1.031045, 0.1999775, -2.309471, 1, 1, 1, 1, 1,
-1.019167, -0.7918442, -2.852955, 1, 1, 1, 1, 1,
-1.015522, 0.4892338, -0.7431696, 1, 1, 1, 1, 1,
-1.015156, -0.7795632, -3.33921, 1, 1, 1, 1, 1,
-1.006303, 1.604747, 1.390944, 1, 1, 1, 1, 1,
-1.005857, 0.4070338, -0.4586769, 1, 1, 1, 1, 1,
-1.0048, 0.5532343, -0.2005112, 1, 1, 1, 1, 1,
-1.002447, 0.3635644, -1.708976, 1, 1, 1, 1, 1,
-0.9910332, -0.1463562, -2.969183, 0, 0, 1, 1, 1,
-0.9848447, -0.2863069, -2.081234, 1, 0, 0, 1, 1,
-0.9842408, 2.143898, -1.010514, 1, 0, 0, 1, 1,
-0.9834279, 2.163035, -0.2579618, 1, 0, 0, 1, 1,
-0.975175, 0.4302362, -0.5421587, 1, 0, 0, 1, 1,
-0.9715679, 0.1813568, -1.266851, 1, 0, 0, 1, 1,
-0.969927, 0.9350235, -0.1047753, 0, 0, 0, 1, 1,
-0.9691437, 0.1807852, -1.8977, 0, 0, 0, 1, 1,
-0.9672141, 1.126244, 0.1010951, 0, 0, 0, 1, 1,
-0.9671955, 0.4806014, -1.233694, 0, 0, 0, 1, 1,
-0.9599193, 2.399009, -0.3091865, 0, 0, 0, 1, 1,
-0.9569609, -0.02705081, -1.973417, 0, 0, 0, 1, 1,
-0.9536738, 2.201466, 0.3312034, 0, 0, 0, 1, 1,
-0.9527006, 0.6262643, -2.014149, 1, 1, 1, 1, 1,
-0.9520131, -1.419881, -2.209374, 1, 1, 1, 1, 1,
-0.9445176, -0.4347755, -1.222, 1, 1, 1, 1, 1,
-0.9397253, -0.4689439, -4.061102, 1, 1, 1, 1, 1,
-0.9358419, 0.4342795, -1.11982, 1, 1, 1, 1, 1,
-0.9290064, -1.306249, -3.435363, 1, 1, 1, 1, 1,
-0.926932, 0.3661238, -0.430979, 1, 1, 1, 1, 1,
-0.9259678, 1.515543, -1.922006, 1, 1, 1, 1, 1,
-0.9236355, 0.8206803, -2.016329, 1, 1, 1, 1, 1,
-0.9232488, -0.5439868, -0.4940325, 1, 1, 1, 1, 1,
-0.9185023, -1.440593, -4.078331, 1, 1, 1, 1, 1,
-0.9176198, 0.2113543, -2.606518, 1, 1, 1, 1, 1,
-0.9160736, -0.2433463, -4.179435, 1, 1, 1, 1, 1,
-0.9100953, -1.654619, -2.515824, 1, 1, 1, 1, 1,
-0.9053786, 0.1468473, -2.970605, 1, 1, 1, 1, 1,
-0.9051821, -0.6321369, -2.391879, 0, 0, 1, 1, 1,
-0.9042863, -0.5832532, -2.027035, 1, 0, 0, 1, 1,
-0.886121, -0.679527, -2.135766, 1, 0, 0, 1, 1,
-0.8860241, 0.7792264, -0.4335914, 1, 0, 0, 1, 1,
-0.8802968, 0.6692394, -1.9982, 1, 0, 0, 1, 1,
-0.8796175, 1.081299, -1.931396, 1, 0, 0, 1, 1,
-0.8665187, -0.3180083, -1.930379, 0, 0, 0, 1, 1,
-0.8663211, -0.1148655, -1.271519, 0, 0, 0, 1, 1,
-0.8597592, -0.1381809, -1.806848, 0, 0, 0, 1, 1,
-0.8567479, 0.9327039, -0.6224377, 0, 0, 0, 1, 1,
-0.8535511, -0.1123253, -1.752297, 0, 0, 0, 1, 1,
-0.851184, -0.5573192, -1.708405, 0, 0, 0, 1, 1,
-0.8477566, -0.1257773, -2.529967, 0, 0, 0, 1, 1,
-0.847717, -0.3661966, -2.880972, 1, 1, 1, 1, 1,
-0.8468468, 0.0159337, -2.852806, 1, 1, 1, 1, 1,
-0.8461217, -1.374025, -2.589565, 1, 1, 1, 1, 1,
-0.8346571, -0.07733618, -1.487913, 1, 1, 1, 1, 1,
-0.8221839, 1.976956, -1.603626, 1, 1, 1, 1, 1,
-0.8074633, 1.772576, -0.9528289, 1, 1, 1, 1, 1,
-0.807425, 0.373411, 1.003571, 1, 1, 1, 1, 1,
-0.8014532, 0.7793487, -0.1418099, 1, 1, 1, 1, 1,
-0.8011929, 1.016384, -1.924729, 1, 1, 1, 1, 1,
-0.8009282, -0.1516222, -2.781303, 1, 1, 1, 1, 1,
-0.7974635, -1.365035, -3.766891, 1, 1, 1, 1, 1,
-0.7957802, 0.544105, 0.07553664, 1, 1, 1, 1, 1,
-0.7953109, -0.5700451, -2.816216, 1, 1, 1, 1, 1,
-0.7923391, -0.1643878, -2.352997, 1, 1, 1, 1, 1,
-0.7868916, 1.383729, 1.031829, 1, 1, 1, 1, 1,
-0.7866083, 1.69062, 0.05455593, 0, 0, 1, 1, 1,
-0.7848706, 0.4123336, -1.429041, 1, 0, 0, 1, 1,
-0.7785512, -0.1017185, -1.522136, 1, 0, 0, 1, 1,
-0.7774741, 1.630159, -0.8580166, 1, 0, 0, 1, 1,
-0.7742836, 0.4001718, 0.2552034, 1, 0, 0, 1, 1,
-0.7715257, -0.2099951, -0.696986, 1, 0, 0, 1, 1,
-0.7695277, 0.09416053, -1.687313, 0, 0, 0, 1, 1,
-0.767826, -0.8250023, -3.518592, 0, 0, 0, 1, 1,
-0.766085, -0.2364253, -1.06195, 0, 0, 0, 1, 1,
-0.7641737, 0.1460928, -0.445444, 0, 0, 0, 1, 1,
-0.7615069, -0.009124705, -0.4729396, 0, 0, 0, 1, 1,
-0.7614887, 0.1083061, -1.38842, 0, 0, 0, 1, 1,
-0.7509421, -1.920871, -3.556063, 0, 0, 0, 1, 1,
-0.7485279, 1.802747, -2.202374, 1, 1, 1, 1, 1,
-0.7428823, -0.8498346, -1.073318, 1, 1, 1, 1, 1,
-0.7388451, 0.1600048, -0.4303123, 1, 1, 1, 1, 1,
-0.7323741, 0.0349951, -1.741547, 1, 1, 1, 1, 1,
-0.7318723, 0.006582696, -1.437396, 1, 1, 1, 1, 1,
-0.7266775, -0.9989403, -1.611003, 1, 1, 1, 1, 1,
-0.7241088, -1.470959, -1.840855, 1, 1, 1, 1, 1,
-0.7209169, 0.7102811, -0.1463178, 1, 1, 1, 1, 1,
-0.7188733, -0.4537901, -2.020579, 1, 1, 1, 1, 1,
-0.7177448, 2.079256, 0.02198874, 1, 1, 1, 1, 1,
-0.7173384, 0.4809065, -1.402007, 1, 1, 1, 1, 1,
-0.7144924, 1.008049, -0.523555, 1, 1, 1, 1, 1,
-0.714148, 0.2325211, -2.223649, 1, 1, 1, 1, 1,
-0.7128412, -0.761636, -3.46941, 1, 1, 1, 1, 1,
-0.7104927, -0.4314678, -2.719209, 1, 1, 1, 1, 1,
-0.710011, 0.1384774, -0.1440544, 0, 0, 1, 1, 1,
-0.7086245, 1.063653, -0.5519928, 1, 0, 0, 1, 1,
-0.706579, 1.142203, -0.626802, 1, 0, 0, 1, 1,
-0.7053971, 1.446551, -1.022717, 1, 0, 0, 1, 1,
-0.6990232, 0.513, -0.2093497, 1, 0, 0, 1, 1,
-0.6960152, 0.09270458, -0.5823503, 1, 0, 0, 1, 1,
-0.6943739, 0.9011122, -2.505106, 0, 0, 0, 1, 1,
-0.6934623, 0.282264, -0.1951613, 0, 0, 0, 1, 1,
-0.6898897, -0.008236011, -2.062911, 0, 0, 0, 1, 1,
-0.6862438, -1.801966, -3.569468, 0, 0, 0, 1, 1,
-0.6860651, -0.1331566, -1.713941, 0, 0, 0, 1, 1,
-0.685616, 0.9509896, -1.576252, 0, 0, 0, 1, 1,
-0.6847579, -0.01487675, -2.403775, 0, 0, 0, 1, 1,
-0.6834494, 1.153626, -0.9326641, 1, 1, 1, 1, 1,
-0.6818261, -0.340708, -2.890602, 1, 1, 1, 1, 1,
-0.6807049, -0.3319584, -1.86928, 1, 1, 1, 1, 1,
-0.6720917, 0.3786015, 0.170689, 1, 1, 1, 1, 1,
-0.6691161, -0.9954056, -2.04805, 1, 1, 1, 1, 1,
-0.6663449, -1.182288, -3.085659, 1, 1, 1, 1, 1,
-0.6639091, 1.448701, -0.3248602, 1, 1, 1, 1, 1,
-0.6618344, -0.9174449, -2.406895, 1, 1, 1, 1, 1,
-0.6510616, 0.3717352, -0.7978559, 1, 1, 1, 1, 1,
-0.6505874, -0.1436882, -1.703199, 1, 1, 1, 1, 1,
-0.649282, 0.1066596, -3.592647, 1, 1, 1, 1, 1,
-0.6484264, -1.510608, -2.193386, 1, 1, 1, 1, 1,
-0.6421088, -0.663496, -0.6815318, 1, 1, 1, 1, 1,
-0.6413899, -0.03711733, -0.331017, 1, 1, 1, 1, 1,
-0.6406871, -0.2093313, -2.746811, 1, 1, 1, 1, 1,
-0.637675, -0.9091536, -1.596802, 0, 0, 1, 1, 1,
-0.6363019, 0.6427485, 0.3093153, 1, 0, 0, 1, 1,
-0.6348623, -0.9839743, -2.261604, 1, 0, 0, 1, 1,
-0.6333556, 0.5168123, -0.7936614, 1, 0, 0, 1, 1,
-0.6295067, 1.34872, 2.413262, 1, 0, 0, 1, 1,
-0.6239119, -0.4307323, -2.936937, 1, 0, 0, 1, 1,
-0.6215684, -1.361173, -1.255908, 0, 0, 0, 1, 1,
-0.6179277, 2.440193, 0.234381, 0, 0, 0, 1, 1,
-0.617906, 0.5628211, -2.171808, 0, 0, 0, 1, 1,
-0.6145473, -0.9866924, -2.311545, 0, 0, 0, 1, 1,
-0.6138146, -1.003229, -4.710147, 0, 0, 0, 1, 1,
-0.6086551, -0.7228094, -1.299285, 0, 0, 0, 1, 1,
-0.6085609, 1.308497, -1.076824, 0, 0, 0, 1, 1,
-0.6082313, 0.7103252, -0.360708, 1, 1, 1, 1, 1,
-0.6081513, 0.7174143, -0.1772392, 1, 1, 1, 1, 1,
-0.6041521, -0.2299648, -0.8544914, 1, 1, 1, 1, 1,
-0.6021156, -0.7043844, -0.7822741, 1, 1, 1, 1, 1,
-0.6012974, -1.827939, -3.604493, 1, 1, 1, 1, 1,
-0.6011079, -0.1939658, -0.5884783, 1, 1, 1, 1, 1,
-0.5988832, 0.8829997, -0.2027865, 1, 1, 1, 1, 1,
-0.5961926, -0.2072295, -1.644046, 1, 1, 1, 1, 1,
-0.5937341, -1.733189, -3.631166, 1, 1, 1, 1, 1,
-0.5928447, -0.301889, -1.694652, 1, 1, 1, 1, 1,
-0.5927628, -0.8091488, -4.714235, 1, 1, 1, 1, 1,
-0.5892637, -1.163655, -0.8335622, 1, 1, 1, 1, 1,
-0.5864004, 0.1835002, -0.617067, 1, 1, 1, 1, 1,
-0.5847075, -1.086102, -2.505466, 1, 1, 1, 1, 1,
-0.5821447, 0.1321245, -1.500382, 1, 1, 1, 1, 1,
-0.581293, -0.8006275, -2.588085, 0, 0, 1, 1, 1,
-0.580771, 1.004714, -1.797435, 1, 0, 0, 1, 1,
-0.5804586, 0.2627472, -2.411903, 1, 0, 0, 1, 1,
-0.579588, 0.7573938, -0.1573125, 1, 0, 0, 1, 1,
-0.5756879, 0.5858351, 0.1305722, 1, 0, 0, 1, 1,
-0.5739205, 0.8546612, -0.6525676, 1, 0, 0, 1, 1,
-0.5707842, 1.634203, -0.6943999, 0, 0, 0, 1, 1,
-0.5652547, 0.7527285, -1.257905, 0, 0, 0, 1, 1,
-0.5593712, 0.4336872, -1.642566, 0, 0, 0, 1, 1,
-0.5584653, 0.570858, -0.9441921, 0, 0, 0, 1, 1,
-0.5571287, -0.371148, -0.03612168, 0, 0, 0, 1, 1,
-0.5461884, -0.6536077, -3.491136, 0, 0, 0, 1, 1,
-0.5451925, -0.3436555, -1.641178, 0, 0, 0, 1, 1,
-0.533765, 0.4977473, -0.9674783, 1, 1, 1, 1, 1,
-0.5322142, 0.08107915, -0.4372757, 1, 1, 1, 1, 1,
-0.5249034, 1.759329, 0.8094804, 1, 1, 1, 1, 1,
-0.52356, 0.6750267, -1.323569, 1, 1, 1, 1, 1,
-0.5156707, -0.793918, -2.438211, 1, 1, 1, 1, 1,
-0.5128958, -0.3502626, -1.679208, 1, 1, 1, 1, 1,
-0.5095667, -0.5025792, -3.707895, 1, 1, 1, 1, 1,
-0.5077472, -0.9412983, -2.866624, 1, 1, 1, 1, 1,
-0.5026608, 0.9669105, -0.3647583, 1, 1, 1, 1, 1,
-0.5004713, -1.373364, -2.72494, 1, 1, 1, 1, 1,
-0.5000874, 0.3351207, 0.1277302, 1, 1, 1, 1, 1,
-0.4983658, 0.2866084, -0.2593359, 1, 1, 1, 1, 1,
-0.4973322, 0.3008128, -0.2066196, 1, 1, 1, 1, 1,
-0.4951095, -0.3037196, -0.1787082, 1, 1, 1, 1, 1,
-0.4939509, -0.4418977, -2.015056, 1, 1, 1, 1, 1,
-0.4932612, -0.1911737, -2.189615, 0, 0, 1, 1, 1,
-0.4930533, -0.5878438, -3.585649, 1, 0, 0, 1, 1,
-0.491181, -0.814154, -2.278981, 1, 0, 0, 1, 1,
-0.4895723, -1.43177, -3.00672, 1, 0, 0, 1, 1,
-0.4807355, -0.8431514, -3.000676, 1, 0, 0, 1, 1,
-0.4720134, -2.150533, -2.279158, 1, 0, 0, 1, 1,
-0.4695219, -0.4882111, -3.319741, 0, 0, 0, 1, 1,
-0.4691608, -0.5466785, -0.7983014, 0, 0, 0, 1, 1,
-0.4653246, -0.6132043, -2.329332, 0, 0, 0, 1, 1,
-0.4651309, -0.07609071, -2.712138, 0, 0, 0, 1, 1,
-0.4594096, -0.8338816, -2.068433, 0, 0, 0, 1, 1,
-0.4577825, 0.09919989, -0.8606596, 0, 0, 0, 1, 1,
-0.456951, -0.4584266, -4.127056, 0, 0, 0, 1, 1,
-0.4567222, 0.4970046, 0.1484436, 1, 1, 1, 1, 1,
-0.4559219, -1.0967, -2.624579, 1, 1, 1, 1, 1,
-0.4549353, 1.696626, -1.03857, 1, 1, 1, 1, 1,
-0.4518821, -1.11807, -2.599499, 1, 1, 1, 1, 1,
-0.4499348, 0.5547559, -1.090072, 1, 1, 1, 1, 1,
-0.4497609, -0.115555, -3.293162, 1, 1, 1, 1, 1,
-0.4488032, -2.247827, -4.143432, 1, 1, 1, 1, 1,
-0.4458567, 0.6956958, -0.2598414, 1, 1, 1, 1, 1,
-0.4447658, 0.7951766, -0.8882092, 1, 1, 1, 1, 1,
-0.4415618, 1.083484, -2.12955, 1, 1, 1, 1, 1,
-0.4361854, -1.228543, -3.076489, 1, 1, 1, 1, 1,
-0.4332412, -0.1212987, -1.439343, 1, 1, 1, 1, 1,
-0.4321723, 0.824629, 0.5391896, 1, 1, 1, 1, 1,
-0.4302848, -0.2549456, -2.560848, 1, 1, 1, 1, 1,
-0.4285286, 0.7458703, 0.06642406, 1, 1, 1, 1, 1,
-0.4278603, -1.072592, -2.766027, 0, 0, 1, 1, 1,
-0.4269257, 1.3045, 0.9337914, 1, 0, 0, 1, 1,
-0.4249258, 0.3062007, -1.656358, 1, 0, 0, 1, 1,
-0.4247406, 0.7437568, -0.234162, 1, 0, 0, 1, 1,
-0.4244443, 0.3185605, -2.525369, 1, 0, 0, 1, 1,
-0.4235254, -0.7733864, -3.860239, 1, 0, 0, 1, 1,
-0.4208001, 0.2144005, -0.7353691, 0, 0, 0, 1, 1,
-0.4199987, 1.491061, 0.1480522, 0, 0, 0, 1, 1,
-0.4185603, 1.286917, 0.003765517, 0, 0, 0, 1, 1,
-0.4154287, 0.2596329, -2.216215, 0, 0, 0, 1, 1,
-0.4147279, 1.246582, -0.5155573, 0, 0, 0, 1, 1,
-0.414171, 0.7520058, -0.5629226, 0, 0, 0, 1, 1,
-0.4129857, 0.4748988, -0.4517815, 0, 0, 0, 1, 1,
-0.4087428, -0.4173317, -1.688043, 1, 1, 1, 1, 1,
-0.4075806, 1.480577, -0.2629969, 1, 1, 1, 1, 1,
-0.4067313, 0.1710889, -2.491596, 1, 1, 1, 1, 1,
-0.4038886, -0.2346084, -1.989101, 1, 1, 1, 1, 1,
-0.4034626, -0.5513248, -3.681066, 1, 1, 1, 1, 1,
-0.4002405, -0.9900716, -3.026049, 1, 1, 1, 1, 1,
-0.3970885, 0.2138643, -1.620419, 1, 1, 1, 1, 1,
-0.3967761, 1.580046, 0.1776294, 1, 1, 1, 1, 1,
-0.3945148, -0.4702804, -2.608073, 1, 1, 1, 1, 1,
-0.3933448, -1.080808, -3.674176, 1, 1, 1, 1, 1,
-0.3922424, -1.27306, -4.540206, 1, 1, 1, 1, 1,
-0.3871397, 0.7254794, -0.4383643, 1, 1, 1, 1, 1,
-0.3865234, 0.468706, -1.835081, 1, 1, 1, 1, 1,
-0.3853379, 0.4725059, 0.1001789, 1, 1, 1, 1, 1,
-0.3839486, 0.7211652, -1.560556, 1, 1, 1, 1, 1,
-0.3776532, -1.387128, -1.705698, 0, 0, 1, 1, 1,
-0.3775249, -2.360997, -2.006247, 1, 0, 0, 1, 1,
-0.3748383, 0.7231898, -0.5198393, 1, 0, 0, 1, 1,
-0.3714333, -1.376898, -3.018157, 1, 0, 0, 1, 1,
-0.3661332, 0.01984848, -1.578338, 1, 0, 0, 1, 1,
-0.3635813, -2.64122, -2.313501, 1, 0, 0, 1, 1,
-0.3604494, 0.2795144, -2.131185, 0, 0, 0, 1, 1,
-0.3567219, -0.2973302, -3.584511, 0, 0, 0, 1, 1,
-0.3535463, 0.3117033, 0.09439656, 0, 0, 0, 1, 1,
-0.3507785, 0.8096722, 0.8139513, 0, 0, 0, 1, 1,
-0.3488387, 1.564113, 1.134907, 0, 0, 0, 1, 1,
-0.3465351, 0.08515029, 0.4770423, 0, 0, 0, 1, 1,
-0.3463318, 0.9205943, -0.642794, 0, 0, 0, 1, 1,
-0.3450691, 0.9764466, 0.4959852, 1, 1, 1, 1, 1,
-0.3448783, 0.151921, -0.8463822, 1, 1, 1, 1, 1,
-0.3417926, -0.754706, -3.067443, 1, 1, 1, 1, 1,
-0.3404799, 1.516267, 1.281937, 1, 1, 1, 1, 1,
-0.3333124, -0.1427476, -1.739164, 1, 1, 1, 1, 1,
-0.3307973, -1.190508, -2.723311, 1, 1, 1, 1, 1,
-0.33077, -0.3312624, -1.335083, 1, 1, 1, 1, 1,
-0.3266264, -0.925177, -1.245541, 1, 1, 1, 1, 1,
-0.3258561, -1.788151, -1.555595, 1, 1, 1, 1, 1,
-0.3212434, -2.210443, -4.213993, 1, 1, 1, 1, 1,
-0.3209549, -0.8375481, -3.787659, 1, 1, 1, 1, 1,
-0.3188646, 0.1148441, -0.6660652, 1, 1, 1, 1, 1,
-0.3134847, -0.3519484, -3.88764, 1, 1, 1, 1, 1,
-0.3127252, -0.5548059, -0.4681236, 1, 1, 1, 1, 1,
-0.3124429, 0.3345398, -1.528439, 1, 1, 1, 1, 1,
-0.3074163, -1.143499, -1.503581, 0, 0, 1, 1, 1,
-0.302879, -0.6337849, -3.112077, 1, 0, 0, 1, 1,
-0.3016708, -1.597606, -2.778864, 1, 0, 0, 1, 1,
-0.2943226, -1.591661, -2.120921, 1, 0, 0, 1, 1,
-0.2807994, 0.7444897, -1.745397, 1, 0, 0, 1, 1,
-0.2757583, 0.3002858, -0.9387017, 1, 0, 0, 1, 1,
-0.2745452, -1.873402, -2.582589, 0, 0, 0, 1, 1,
-0.2704362, -0.5374259, -2.792341, 0, 0, 0, 1, 1,
-0.2702582, 0.309624, -0.216915, 0, 0, 0, 1, 1,
-0.2698197, 0.0637665, -2.919985, 0, 0, 0, 1, 1,
-0.2677327, -1.686763, -4.382105, 0, 0, 0, 1, 1,
-0.259589, -0.08269842, -1.710292, 0, 0, 0, 1, 1,
-0.2586801, 0.2871271, -0.6973132, 0, 0, 0, 1, 1,
-0.2560216, -0.1848054, -3.154364, 1, 1, 1, 1, 1,
-0.2519986, 1.030314, -1.072143, 1, 1, 1, 1, 1,
-0.2496513, 0.1501797, -3.091129, 1, 1, 1, 1, 1,
-0.2391594, -0.5693589, -3.369178, 1, 1, 1, 1, 1,
-0.2364262, -0.5122749, -2.303539, 1, 1, 1, 1, 1,
-0.235234, 0.06281621, -1.686465, 1, 1, 1, 1, 1,
-0.2346442, -0.4488824, -2.232216, 1, 1, 1, 1, 1,
-0.2343411, -0.1704439, -1.132942, 1, 1, 1, 1, 1,
-0.2315127, -0.4204631, -4.158332, 1, 1, 1, 1, 1,
-0.2303818, 0.01160999, -2.244532, 1, 1, 1, 1, 1,
-0.2274039, -0.6194475, -1.409653, 1, 1, 1, 1, 1,
-0.2254331, -0.9586902, -3.110872, 1, 1, 1, 1, 1,
-0.22289, 0.2548538, 0.4281902, 1, 1, 1, 1, 1,
-0.2145778, -0.2159469, -2.988467, 1, 1, 1, 1, 1,
-0.2098526, 0.2965151, 1.086191, 1, 1, 1, 1, 1,
-0.2058482, 0.5137067, -1.289504, 0, 0, 1, 1, 1,
-0.2049123, 0.6443692, -1.896879, 1, 0, 0, 1, 1,
-0.2023515, -0.6121541, -2.517014, 1, 0, 0, 1, 1,
-0.199615, -1.079044, -2.360209, 1, 0, 0, 1, 1,
-0.1975528, -2.68603, -3.594081, 1, 0, 0, 1, 1,
-0.1952492, -1.143043, -3.791303, 1, 0, 0, 1, 1,
-0.1941589, -1.241784, -3.475699, 0, 0, 0, 1, 1,
-0.1810839, -1.196776, -3.37219, 0, 0, 0, 1, 1,
-0.1788975, 1.781837, -1.448458, 0, 0, 0, 1, 1,
-0.1788046, 0.219105, 0.8959383, 0, 0, 0, 1, 1,
-0.1763136, 1.453544, -0.5732036, 0, 0, 0, 1, 1,
-0.1750382, 0.4500913, -0.1850548, 0, 0, 0, 1, 1,
-0.1704717, -0.4520964, -2.685671, 0, 0, 0, 1, 1,
-0.168091, 1.576229, -0.3019111, 1, 1, 1, 1, 1,
-0.1669397, -0.6943691, -2.119054, 1, 1, 1, 1, 1,
-0.1518002, 0.02236095, -1.06658, 1, 1, 1, 1, 1,
-0.1511341, 1.804236, -0.4800261, 1, 1, 1, 1, 1,
-0.1502157, 0.9143154, -0.9845595, 1, 1, 1, 1, 1,
-0.1490043, -1.83265, -2.864307, 1, 1, 1, 1, 1,
-0.1433254, 0.1902511, -0.3022685, 1, 1, 1, 1, 1,
-0.1422436, 0.4883807, -1.066915, 1, 1, 1, 1, 1,
-0.1384506, 0.06812607, -1.467175, 1, 1, 1, 1, 1,
-0.1372513, 0.4762332, -1.071842, 1, 1, 1, 1, 1,
-0.1368134, -1.149875, -3.662782, 1, 1, 1, 1, 1,
-0.1349212, -1.56987, -3.74975, 1, 1, 1, 1, 1,
-0.1346449, 1.725953, -0.09803249, 1, 1, 1, 1, 1,
-0.1325118, -0.9922014, -3.603567, 1, 1, 1, 1, 1,
-0.1313883, 1.473854, 0.04693916, 1, 1, 1, 1, 1,
-0.1286402, 1.613724, 0.2074477, 0, 0, 1, 1, 1,
-0.1228623, -1.33637, -1.538613, 1, 0, 0, 1, 1,
-0.1228359, 1.643196, -1.749222, 1, 0, 0, 1, 1,
-0.1200374, 0.002795544, -1.021117, 1, 0, 0, 1, 1,
-0.1163954, 0.2754704, -1.308892, 1, 0, 0, 1, 1,
-0.1154841, -0.4114318, -2.421193, 1, 0, 0, 1, 1,
-0.115098, -1.592379, -3.91233, 0, 0, 0, 1, 1,
-0.1143378, -0.2706289, -1.903754, 0, 0, 0, 1, 1,
-0.1130808, 0.6041096, -1.200511, 0, 0, 0, 1, 1,
-0.1097625, -0.7656241, -2.576422, 0, 0, 0, 1, 1,
-0.1095291, -0.4080162, -2.891097, 0, 0, 0, 1, 1,
-0.09981983, -0.109248, -1.748987, 0, 0, 0, 1, 1,
-0.09852964, 0.7433181, 0.114905, 0, 0, 0, 1, 1,
-0.09132928, 0.3413727, 0.05325616, 1, 1, 1, 1, 1,
-0.07947998, 0.5510252, -0.8139048, 1, 1, 1, 1, 1,
-0.07299857, 0.4861595, -0.7061433, 1, 1, 1, 1, 1,
-0.07194502, -2.120041, -2.553548, 1, 1, 1, 1, 1,
-0.0713966, -1.068616, -3.249645, 1, 1, 1, 1, 1,
-0.06809609, -0.9040855, -0.7419758, 1, 1, 1, 1, 1,
-0.05708561, -0.004456003, 0.02991197, 1, 1, 1, 1, 1,
-0.05642534, 0.6421819, 1.340055, 1, 1, 1, 1, 1,
-0.04726438, 1.777037, -0.4219609, 1, 1, 1, 1, 1,
-0.04663421, 0.359985, 0.213388, 1, 1, 1, 1, 1,
-0.04255778, -1.316186, -3.232522, 1, 1, 1, 1, 1,
-0.04245476, -0.9310874, -2.507733, 1, 1, 1, 1, 1,
-0.04111242, -0.4357132, -2.725041, 1, 1, 1, 1, 1,
-0.03954845, 0.2635018, 0.006605102, 1, 1, 1, 1, 1,
-0.03871191, 0.8157997, 0.8430366, 1, 1, 1, 1, 1,
-0.03856709, 0.3800474, 1.211146, 0, 0, 1, 1, 1,
-0.03187888, 0.5611112, 1.103246, 1, 0, 0, 1, 1,
-0.03071318, 0.8540223, 1.568525, 1, 0, 0, 1, 1,
-0.02653667, -1.964404, -3.826325, 1, 0, 0, 1, 1,
-0.02600031, -0.1002069, -2.137767, 1, 0, 0, 1, 1,
-0.02448251, -0.4149179, -3.116265, 1, 0, 0, 1, 1,
-0.02430118, -1.609855, -2.797988, 0, 0, 0, 1, 1,
-0.02175608, -0.4591452, -4.649681, 0, 0, 0, 1, 1,
-0.01845692, 1.73875, -0.4763232, 0, 0, 0, 1, 1,
-0.01806667, 1.506419, 0.9049647, 0, 0, 0, 1, 1,
-0.01183817, 0.0158305, -1.072322, 0, 0, 0, 1, 1,
-0.008166224, 0.8335232, 0.3486391, 0, 0, 0, 1, 1,
-0.007120505, 0.5205615, -0.890525, 0, 0, 0, 1, 1,
-0.00240603, -0.9695837, -1.6767, 1, 1, 1, 1, 1,
-0.001181947, -0.812998, -3.481488, 1, 1, 1, 1, 1,
0.001790268, -0.5705208, 1.684476, 1, 1, 1, 1, 1,
0.002210053, 0.3070448, 0.2836291, 1, 1, 1, 1, 1,
0.004219505, 1.064585, -0.9798722, 1, 1, 1, 1, 1,
0.00809381, -0.03744688, 2.922318, 1, 1, 1, 1, 1,
0.01007718, -1.499631, 2.543359, 1, 1, 1, 1, 1,
0.02489744, -1.862458, 3.419657, 1, 1, 1, 1, 1,
0.03272664, -2.27944, 1.482976, 1, 1, 1, 1, 1,
0.03426448, -0.3709692, 1.807408, 1, 1, 1, 1, 1,
0.03659819, 0.3829975, -1.094219, 1, 1, 1, 1, 1,
0.04357945, 0.02417168, 1.162657, 1, 1, 1, 1, 1,
0.04718837, 0.8582021, 0.8031935, 1, 1, 1, 1, 1,
0.04739706, -0.09373379, 3.256548, 1, 1, 1, 1, 1,
0.05333536, -0.1594767, 3.434536, 1, 1, 1, 1, 1,
0.05798779, 1.036557, 0.0811649, 0, 0, 1, 1, 1,
0.06013952, 0.8628444, 1.471061, 1, 0, 0, 1, 1,
0.06465633, 0.8720754, 1.79251, 1, 0, 0, 1, 1,
0.06582277, 1.088977, 0.3359303, 1, 0, 0, 1, 1,
0.06696204, 0.5689156, -0.8257148, 1, 0, 0, 1, 1,
0.06858002, 0.6588303, -0.2366415, 1, 0, 0, 1, 1,
0.06955833, -0.121482, 4.185469, 0, 0, 0, 1, 1,
0.07010935, -1.564723, 2.316329, 0, 0, 0, 1, 1,
0.0848723, -0.5926435, 1.587607, 0, 0, 0, 1, 1,
0.09263737, 1.15897, 1.333456, 0, 0, 0, 1, 1,
0.09815081, 1.312301, -1.468985, 0, 0, 0, 1, 1,
0.09985407, 0.3969459, 0.02146815, 0, 0, 0, 1, 1,
0.1009754, 1.24298, 0.5899945, 0, 0, 0, 1, 1,
0.1021359, 1.514688, 1.29725, 1, 1, 1, 1, 1,
0.102934, -1.976816, 2.69613, 1, 1, 1, 1, 1,
0.1070584, -0.3159206, 1.315881, 1, 1, 1, 1, 1,
0.1083883, 0.486418, 0.1914199, 1, 1, 1, 1, 1,
0.1098168, -0.407672, 1.413287, 1, 1, 1, 1, 1,
0.1143098, -0.5681067, 2.719857, 1, 1, 1, 1, 1,
0.1168347, 0.6916548, 1.261113, 1, 1, 1, 1, 1,
0.1186369, -1.846997, 3.667141, 1, 1, 1, 1, 1,
0.1264483, -1.586492, 3.393026, 1, 1, 1, 1, 1,
0.1307255, 0.06373246, 1.173286, 1, 1, 1, 1, 1,
0.1321213, 0.02512287, -0.1124273, 1, 1, 1, 1, 1,
0.136906, -0.1816703, 3.941607, 1, 1, 1, 1, 1,
0.1379081, -0.9710035, 3.582848, 1, 1, 1, 1, 1,
0.1431647, -0.02548991, 0.03822143, 1, 1, 1, 1, 1,
0.1506941, -0.33315, 2.807637, 1, 1, 1, 1, 1,
0.1540241, 0.337227, 0.9190155, 0, 0, 1, 1, 1,
0.1540817, 1.087866, -0.2099139, 1, 0, 0, 1, 1,
0.1541887, -2.290153, 2.812135, 1, 0, 0, 1, 1,
0.1567996, -0.1034803, 2.178801, 1, 0, 0, 1, 1,
0.1594355, -0.5228914, 3.295739, 1, 0, 0, 1, 1,
0.1594635, -0.6862899, 3.423215, 1, 0, 0, 1, 1,
0.159496, 0.5329307, 0.1498784, 0, 0, 0, 1, 1,
0.1682898, 0.4699447, 0.6854706, 0, 0, 0, 1, 1,
0.1687678, 0.2314302, 0.1872304, 0, 0, 0, 1, 1,
0.1705375, 1.726359, 0.09744693, 0, 0, 0, 1, 1,
0.1743192, 0.02789051, -0.004636732, 0, 0, 0, 1, 1,
0.1773274, -0.2066344, 2.89886, 0, 0, 0, 1, 1,
0.1775939, -0.5309926, 3.392266, 0, 0, 0, 1, 1,
0.1798339, -0.3353309, 2.068148, 1, 1, 1, 1, 1,
0.1842756, -1.490585, 1.546822, 1, 1, 1, 1, 1,
0.1897132, -1.07077, 2.806067, 1, 1, 1, 1, 1,
0.1926937, 0.79264, 0.248558, 1, 1, 1, 1, 1,
0.1967875, 0.0958451, 1.183931, 1, 1, 1, 1, 1,
0.1970408, -0.1961857, 1.74778, 1, 1, 1, 1, 1,
0.1988108, -0.3471382, 2.420004, 1, 1, 1, 1, 1,
0.1991421, -0.5256913, 3.311021, 1, 1, 1, 1, 1,
0.2020486, -0.2499336, 2.140647, 1, 1, 1, 1, 1,
0.2054342, -0.1525415, 1.084086, 1, 1, 1, 1, 1,
0.2055707, -0.241491, 1.469871, 1, 1, 1, 1, 1,
0.2091786, 0.5983408, -1.118883, 1, 1, 1, 1, 1,
0.2186312, 0.3135618, 0.9535424, 1, 1, 1, 1, 1,
0.2194357, 0.5431997, 0.2598372, 1, 1, 1, 1, 1,
0.2199232, -0.1552559, 2.018133, 1, 1, 1, 1, 1,
0.220143, 0.2494019, 1.111261, 0, 0, 1, 1, 1,
0.221411, -0.04866697, 1.991835, 1, 0, 0, 1, 1,
0.2225376, 0.3547638, 1.156189, 1, 0, 0, 1, 1,
0.2273478, -0.4591243, 3.991607, 1, 0, 0, 1, 1,
0.2279561, -0.9464051, 2.578244, 1, 0, 0, 1, 1,
0.2348666, 0.2991318, 0.9901466, 1, 0, 0, 1, 1,
0.2362891, 0.5563161, 0.5071125, 0, 0, 0, 1, 1,
0.2388252, 1.008962, 0.7166474, 0, 0, 0, 1, 1,
0.238937, 0.6069971, -0.01830821, 0, 0, 0, 1, 1,
0.24191, 1.266121, -0.6217939, 0, 0, 0, 1, 1,
0.2432741, -0.65465, 3.504751, 0, 0, 0, 1, 1,
0.2478713, 2.323078, -0.0416263, 0, 0, 0, 1, 1,
0.2492289, -1.211223, 3.637616, 0, 0, 0, 1, 1,
0.2506494, -0.0009033832, -0.0976633, 1, 1, 1, 1, 1,
0.2507223, 0.2471581, 1.171132, 1, 1, 1, 1, 1,
0.2514116, -1.062677, 3.481471, 1, 1, 1, 1, 1,
0.2543609, -1.808493, 3.141887, 1, 1, 1, 1, 1,
0.2564729, -0.348769, 2.011833, 1, 1, 1, 1, 1,
0.258037, 0.2839071, 2.085737, 1, 1, 1, 1, 1,
0.2598774, 0.5434372, -0.986086, 1, 1, 1, 1, 1,
0.265244, 0.8749103, -0.1676573, 1, 1, 1, 1, 1,
0.2682981, 0.5793781, 3.37692, 1, 1, 1, 1, 1,
0.2711077, 0.5920466, 0.1682906, 1, 1, 1, 1, 1,
0.2724554, 0.8215256, 1.102219, 1, 1, 1, 1, 1,
0.2758621, 0.814753, -0.336623, 1, 1, 1, 1, 1,
0.2769415, -2.305902, 3.887283, 1, 1, 1, 1, 1,
0.2771113, 0.02904208, 3.262493, 1, 1, 1, 1, 1,
0.2781681, -1.124818, 2.238723, 1, 1, 1, 1, 1,
0.2814201, -0.4608473, 0.6935241, 0, 0, 1, 1, 1,
0.2819807, -0.4759857, 1.736911, 1, 0, 0, 1, 1,
0.2823887, -1.202826, 2.424441, 1, 0, 0, 1, 1,
0.284155, 0.1145116, 1.864408, 1, 0, 0, 1, 1,
0.2860265, -0.2125604, 3.114141, 1, 0, 0, 1, 1,
0.2906918, -1.76669, 1.582468, 1, 0, 0, 1, 1,
0.2934203, -0.2849585, 2.801581, 0, 0, 0, 1, 1,
0.2977028, 1.485133, 0.2554598, 0, 0, 0, 1, 1,
0.2994029, 0.9910375, -0.6347556, 0, 0, 0, 1, 1,
0.3050037, -1.307504, 3.145606, 0, 0, 0, 1, 1,
0.3089233, -0.7635896, 3.135429, 0, 0, 0, 1, 1,
0.3097894, 0.1930604, 1.290063, 0, 0, 0, 1, 1,
0.310552, -0.5232025, 1.647641, 0, 0, 0, 1, 1,
0.3115419, -0.2730487, 1.575946, 1, 1, 1, 1, 1,
0.3188071, 0.1203719, 1.540425, 1, 1, 1, 1, 1,
0.3248543, 0.2932239, 2.098478, 1, 1, 1, 1, 1,
0.3260405, 0.6787914, 0.3042421, 1, 1, 1, 1, 1,
0.3299651, -0.0329828, 3.917403, 1, 1, 1, 1, 1,
0.3310006, -0.369758, 3.836042, 1, 1, 1, 1, 1,
0.3435886, -0.368283, 3.230054, 1, 1, 1, 1, 1,
0.3440698, -1.55765, 3.49694, 1, 1, 1, 1, 1,
0.3443545, -1.317503, 2.276184, 1, 1, 1, 1, 1,
0.3472141, -1.175229, 2.13992, 1, 1, 1, 1, 1,
0.3494878, 0.7426469, -0.7067635, 1, 1, 1, 1, 1,
0.3514937, 0.9726391, 1.374093, 1, 1, 1, 1, 1,
0.3518095, 0.7939155, -0.2126259, 1, 1, 1, 1, 1,
0.3586165, -0.4136966, 3.290545, 1, 1, 1, 1, 1,
0.3618335, 0.5642737, 1.107414, 1, 1, 1, 1, 1,
0.3701976, -2.211548, 0.5900244, 0, 0, 1, 1, 1,
0.3761649, 2.060321, 2.244927, 1, 0, 0, 1, 1,
0.3765967, 1.872559, -0.2350098, 1, 0, 0, 1, 1,
0.3881406, 0.8945216, 0.0941076, 1, 0, 0, 1, 1,
0.3894286, 0.4659371, 1.019825, 1, 0, 0, 1, 1,
0.3905528, 0.8570221, -0.3115464, 1, 0, 0, 1, 1,
0.392127, -1.630743, 3.786702, 0, 0, 0, 1, 1,
0.3970383, 1.353259, -0.1531803, 0, 0, 0, 1, 1,
0.3994434, -1.55064, 2.527771, 0, 0, 0, 1, 1,
0.4078568, -0.1716027, 2.388169, 0, 0, 0, 1, 1,
0.4080006, -0.8896682, 2.53349, 0, 0, 0, 1, 1,
0.4095528, -0.5460207, 1.530306, 0, 0, 0, 1, 1,
0.4106124, 1.018419, 2.726974, 0, 0, 0, 1, 1,
0.4126523, 1.240271, 0.1404937, 1, 1, 1, 1, 1,
0.4154023, -0.2930817, 3.13744, 1, 1, 1, 1, 1,
0.4155937, 0.4000641, 1.030164, 1, 1, 1, 1, 1,
0.4175828, 0.6933113, -0.01421347, 1, 1, 1, 1, 1,
0.4209594, -0.9009752, 2.753262, 1, 1, 1, 1, 1,
0.4223404, 1.023698, 0.2012859, 1, 1, 1, 1, 1,
0.4242934, 1.927129, 0.1225564, 1, 1, 1, 1, 1,
0.4272365, -0.07608914, 1.547061, 1, 1, 1, 1, 1,
0.4287292, -0.1044234, 2.335518, 1, 1, 1, 1, 1,
0.43347, -1.093255, 4.724419, 1, 1, 1, 1, 1,
0.442128, 0.383985, 0.1172245, 1, 1, 1, 1, 1,
0.4461496, 0.6726367, 0.5042173, 1, 1, 1, 1, 1,
0.4489227, -3.379978, 3.647961, 1, 1, 1, 1, 1,
0.4510403, -0.4389069, 2.746578, 1, 1, 1, 1, 1,
0.4519822, -0.8260351, 2.206048, 1, 1, 1, 1, 1,
0.4549485, 1.374948, -0.1149851, 0, 0, 1, 1, 1,
0.4562503, 0.2850098, 1.430911, 1, 0, 0, 1, 1,
0.4567938, -0.1621892, 1.271119, 1, 0, 0, 1, 1,
0.4573664, 0.2062218, 0.6358079, 1, 0, 0, 1, 1,
0.4613374, 0.7111636, 1.957128, 1, 0, 0, 1, 1,
0.4616857, -0.170036, 2.449929, 1, 0, 0, 1, 1,
0.462147, 0.8728428, 0.7892489, 0, 0, 0, 1, 1,
0.4628838, 0.3123412, 1.903702, 0, 0, 0, 1, 1,
0.4632328, 1.13004, 0.7363144, 0, 0, 0, 1, 1,
0.4643418, 0.541395, 0.6975272, 0, 0, 0, 1, 1,
0.4652776, 0.6303057, -0.07034537, 0, 0, 0, 1, 1,
0.4681554, -1.246685, 2.624842, 0, 0, 0, 1, 1,
0.4722182, 2.122447, -0.05330649, 0, 0, 0, 1, 1,
0.4722394, 0.1364381, 0.05359314, 1, 1, 1, 1, 1,
0.4727569, 3.967683, 0.1431513, 1, 1, 1, 1, 1,
0.4745382, 0.7725362, 1.624477, 1, 1, 1, 1, 1,
0.4753026, 1.255067, 1.254972, 1, 1, 1, 1, 1,
0.4756922, -0.7948682, 3.38661, 1, 1, 1, 1, 1,
0.4760958, 0.03302994, 2.164338, 1, 1, 1, 1, 1,
0.4833509, 0.7494748, 1.193483, 1, 1, 1, 1, 1,
0.4840333, -0.2423202, 2.661487, 1, 1, 1, 1, 1,
0.4870785, -0.4627936, 2.521691, 1, 1, 1, 1, 1,
0.4888368, 0.3427576, 0.5325713, 1, 1, 1, 1, 1,
0.4918627, 1.54928, 1.145251, 1, 1, 1, 1, 1,
0.4930354, -0.3608173, 2.045035, 1, 1, 1, 1, 1,
0.4957077, -0.6947721, 1.10837, 1, 1, 1, 1, 1,
0.4958558, 2.220374, 0.3759412, 1, 1, 1, 1, 1,
0.4983062, 0.0094176, 0.5439135, 1, 1, 1, 1, 1,
0.4997693, -2.002356, 4.247549, 0, 0, 1, 1, 1,
0.5097766, -0.6660929, 3.007531, 1, 0, 0, 1, 1,
0.5121622, -0.6534494, 1.366283, 1, 0, 0, 1, 1,
0.5129881, 0.4399538, 0.3077206, 1, 0, 0, 1, 1,
0.5184981, 0.6869148, -0.4432456, 1, 0, 0, 1, 1,
0.5238861, 1.241268, -2.120671, 1, 0, 0, 1, 1,
0.5285178, 0.267965, 0.3103378, 0, 0, 0, 1, 1,
0.5320694, -0.4897777, 2.293867, 0, 0, 0, 1, 1,
0.5324494, 1.277626, 1.383028, 0, 0, 0, 1, 1,
0.536486, 0.5532242, 1.426015, 0, 0, 0, 1, 1,
0.5399492, 1.43666, 1.663589, 0, 0, 0, 1, 1,
0.5419219, 0.2964382, 0.8839535, 0, 0, 0, 1, 1,
0.5422496, -0.6558461, 2.684118, 0, 0, 0, 1, 1,
0.5430105, 1.060714, -1.549146, 1, 1, 1, 1, 1,
0.5457727, -0.358417, 2.946538, 1, 1, 1, 1, 1,
0.5470603, -1.746251, 1.621861, 1, 1, 1, 1, 1,
0.5499191, -1.636077, 2.17888, 1, 1, 1, 1, 1,
0.5510933, 0.3749378, 1.334844, 1, 1, 1, 1, 1,
0.5511357, -0.5288135, 1.034552, 1, 1, 1, 1, 1,
0.5546759, 1.919613, -0.1223575, 1, 1, 1, 1, 1,
0.5580864, 0.4792215, -0.6009397, 1, 1, 1, 1, 1,
0.5650562, -0.5687434, 2.606492, 1, 1, 1, 1, 1,
0.568311, 1.200727, -0.7111053, 1, 1, 1, 1, 1,
0.5762609, 0.4134886, 2.341842, 1, 1, 1, 1, 1,
0.5818614, -0.1132984, 0.8903952, 1, 1, 1, 1, 1,
0.5820554, -0.5980519, -0.5630541, 1, 1, 1, 1, 1,
0.5836577, -0.7248271, 1.854269, 1, 1, 1, 1, 1,
0.5852742, 0.7003539, -0.06187265, 1, 1, 1, 1, 1,
0.5893909, -0.834541, 0.02670239, 0, 0, 1, 1, 1,
0.5925373, -1.52854, 2.677651, 1, 0, 0, 1, 1,
0.5939187, 0.2530289, 1.361458, 1, 0, 0, 1, 1,
0.593951, -0.3566507, 3.261328, 1, 0, 0, 1, 1,
0.5949264, -0.3927632, 0.573791, 1, 0, 0, 1, 1,
0.5954028, -0.3360406, 1.798006, 1, 0, 0, 1, 1,
0.607805, -0.7597162, 1.490461, 0, 0, 0, 1, 1,
0.610284, -0.2833504, 1.793837, 0, 0, 0, 1, 1,
0.6107798, -0.4752862, 0.845155, 0, 0, 0, 1, 1,
0.6159455, -1.720639, 2.790879, 0, 0, 0, 1, 1,
0.616901, -0.3441354, 1.370372, 0, 0, 0, 1, 1,
0.6193917, -0.8738037, 2.645801, 0, 0, 0, 1, 1,
0.6209936, -0.4945846, 2.84658, 0, 0, 0, 1, 1,
0.6230859, 2.569134, 0.7354094, 1, 1, 1, 1, 1,
0.6294269, -0.07811382, 2.167905, 1, 1, 1, 1, 1,
0.6296311, -0.4121971, 2.222871, 1, 1, 1, 1, 1,
0.6299775, -1.19621, 1.810513, 1, 1, 1, 1, 1,
0.6383016, -0.9110409, 1.097418, 1, 1, 1, 1, 1,
0.6385487, 0.2219313, 0.7859893, 1, 1, 1, 1, 1,
0.6412523, 0.6062663, 0.8661418, 1, 1, 1, 1, 1,
0.6430078, -0.4586757, 2.665428, 1, 1, 1, 1, 1,
0.6443236, 1.462938, -0.04699101, 1, 1, 1, 1, 1,
0.6469455, 0.5864287, 0.2363859, 1, 1, 1, 1, 1,
0.6553969, 0.2350918, 2.216887, 1, 1, 1, 1, 1,
0.659473, -0.03744723, 2.804517, 1, 1, 1, 1, 1,
0.6650644, 0.1228362, 1.661089, 1, 1, 1, 1, 1,
0.6685415, -0.461542, 2.285877, 1, 1, 1, 1, 1,
0.6733414, 1.36754, -1.041152, 1, 1, 1, 1, 1,
0.6741769, 0.9867747, 0.6653733, 0, 0, 1, 1, 1,
0.6759332, 0.2262383, 2.065304, 1, 0, 0, 1, 1,
0.6925854, -1.192068, 2.559902, 1, 0, 0, 1, 1,
0.6970774, 0.7900141, 1.90089, 1, 0, 0, 1, 1,
0.6997927, 0.2982263, 1.829487, 1, 0, 0, 1, 1,
0.7052634, 0.2800728, 0.9499366, 1, 0, 0, 1, 1,
0.7080469, -1.643321, 3.59493, 0, 0, 0, 1, 1,
0.7169214, -0.0145528, 2.20405, 0, 0, 0, 1, 1,
0.7177719, -0.5537716, 2.478603, 0, 0, 0, 1, 1,
0.7217675, -0.3704076, 1.854629, 0, 0, 0, 1, 1,
0.7248183, 0.1019874, 2.519706, 0, 0, 0, 1, 1,
0.7250048, -0.04183416, 2.217602, 0, 0, 0, 1, 1,
0.7252653, 0.4939496, 1.723119, 0, 0, 0, 1, 1,
0.7269526, -0.2290906, 2.418325, 1, 1, 1, 1, 1,
0.731751, 0.7787134, 1.582284, 1, 1, 1, 1, 1,
0.7392328, -0.1002307, 2.75389, 1, 1, 1, 1, 1,
0.7469181, -0.7345562, 1.795565, 1, 1, 1, 1, 1,
0.7475919, 0.1143681, 0.4539938, 1, 1, 1, 1, 1,
0.7488245, 0.4987773, 1.775935, 1, 1, 1, 1, 1,
0.7636268, 0.903188, 1.023877, 1, 1, 1, 1, 1,
0.7646177, 0.03434072, 1.513147, 1, 1, 1, 1, 1,
0.7685747, -0.6095055, 2.933741, 1, 1, 1, 1, 1,
0.7693495, 0.4829548, 3.210471, 1, 1, 1, 1, 1,
0.7703474, 1.207965, 0.2610345, 1, 1, 1, 1, 1,
0.7741362, 1.012288, -0.002183078, 1, 1, 1, 1, 1,
0.7902702, 0.1464258, 2.414338, 1, 1, 1, 1, 1,
0.7927541, -1.304785, 0.5585862, 1, 1, 1, 1, 1,
0.7956036, 0.5545136, -0.3083048, 1, 1, 1, 1, 1,
0.8038417, 1.870311, 0.7067985, 0, 0, 1, 1, 1,
0.807458, 2.070536, 1.879465, 1, 0, 0, 1, 1,
0.8093807, -0.2614118, 1.088951, 1, 0, 0, 1, 1,
0.811522, -1.088885, 3.08472, 1, 0, 0, 1, 1,
0.8135015, 1.432461, 0.2425853, 1, 0, 0, 1, 1,
0.8141423, 0.4395045, 0.7322596, 1, 0, 0, 1, 1,
0.816234, -0.4917292, 1.953871, 0, 0, 0, 1, 1,
0.8212885, -0.7026219, 1.858195, 0, 0, 0, 1, 1,
0.8236051, -0.887983, 2.715777, 0, 0, 0, 1, 1,
0.8264037, 0.7102898, -1.006704, 0, 0, 0, 1, 1,
0.8272455, 0.1135544, 1.519205, 0, 0, 0, 1, 1,
0.8284479, 2.130823, 0.1034253, 0, 0, 0, 1, 1,
0.8302143, -0.06682333, 2.688218, 0, 0, 0, 1, 1,
0.8324332, 0.05855047, 0.7832875, 1, 1, 1, 1, 1,
0.8335978, 1.482333, 2.542186, 1, 1, 1, 1, 1,
0.8352154, 0.5536778, 0.7643607, 1, 1, 1, 1, 1,
0.8361318, -0.9320572, 2.488029, 1, 1, 1, 1, 1,
0.8391426, -0.8505056, 1.443731, 1, 1, 1, 1, 1,
0.8397655, -0.5206149, 2.631327, 1, 1, 1, 1, 1,
0.8469198, 0.9505577, 1.028085, 1, 1, 1, 1, 1,
0.8470112, 2.520043, 1.431672, 1, 1, 1, 1, 1,
0.848488, 0.4610008, 1.863448, 1, 1, 1, 1, 1,
0.8573499, 0.7891576, 1.925308, 1, 1, 1, 1, 1,
0.8603096, -0.5359813, 1.94003, 1, 1, 1, 1, 1,
0.8604489, -0.9528598, 2.824123, 1, 1, 1, 1, 1,
0.8627331, -0.6926087, 1.600647, 1, 1, 1, 1, 1,
0.8734727, 0.3409153, 0.7185987, 1, 1, 1, 1, 1,
0.8750914, 0.5001897, 3.21562, 1, 1, 1, 1, 1,
0.8752446, -1.09368, 3.336842, 0, 0, 1, 1, 1,
0.876031, -0.05828861, 1.593901, 1, 0, 0, 1, 1,
0.8793688, 0.7901414, 1.361387, 1, 0, 0, 1, 1,
0.8805815, -0.04688813, 1.601429, 1, 0, 0, 1, 1,
0.8857964, -0.07271858, 0.6437968, 1, 0, 0, 1, 1,
0.889302, 0.3479023, 2.196475, 1, 0, 0, 1, 1,
0.9011981, 1.41188, -0.7057875, 0, 0, 0, 1, 1,
0.9033332, -1.07763, 2.518674, 0, 0, 0, 1, 1,
0.9062722, -0.8216884, -0.3697449, 0, 0, 0, 1, 1,
0.9112545, 1.441668, -0.5479993, 0, 0, 0, 1, 1,
0.9115585, -0.1774323, 2.162231, 0, 0, 0, 1, 1,
0.9154611, -1.433251, 0.8358602, 0, 0, 0, 1, 1,
0.916515, -1.402362, 1.130479, 0, 0, 0, 1, 1,
0.9208476, -0.397398, 2.002451, 1, 1, 1, 1, 1,
0.9244759, 0.5829692, 0.6948614, 1, 1, 1, 1, 1,
0.9307563, -1.143048, 2.922015, 1, 1, 1, 1, 1,
0.9309542, 0.2641032, 2.028512, 1, 1, 1, 1, 1,
0.9316234, -0.7999557, 2.762824, 1, 1, 1, 1, 1,
0.9323086, -0.1202416, 1.256447, 1, 1, 1, 1, 1,
0.9334825, 0.5508859, 0.7349988, 1, 1, 1, 1, 1,
0.9373074, 0.7714766, 0.725759, 1, 1, 1, 1, 1,
0.9377694, -0.3629852, 1.307502, 1, 1, 1, 1, 1,
0.9385245, -1.502693, 1.593682, 1, 1, 1, 1, 1,
0.9399905, -0.8826447, 1.009652, 1, 1, 1, 1, 1,
0.943118, 2.392945, -0.05752349, 1, 1, 1, 1, 1,
0.9437193, -0.1820697, 1.193313, 1, 1, 1, 1, 1,
0.9464763, -0.9462904, 3.435671, 1, 1, 1, 1, 1,
0.9506238, -1.764284, 1.2355, 1, 1, 1, 1, 1,
0.9563756, -0.152569, 0.227086, 0, 0, 1, 1, 1,
0.9581071, -1.27352, 2.751318, 1, 0, 0, 1, 1,
0.9632223, -0.5839977, 2.922099, 1, 0, 0, 1, 1,
0.9671491, 1.269338, -1.876504, 1, 0, 0, 1, 1,
0.9719136, 0.7106137, -0.7162866, 1, 0, 0, 1, 1,
0.9733453, 0.1341912, 2.180124, 1, 0, 0, 1, 1,
0.9848256, 1.752786, 3.406725, 0, 0, 0, 1, 1,
0.991107, 2.362925, 2.230517, 0, 0, 0, 1, 1,
0.9947393, 1.426845, 2.538535, 0, 0, 0, 1, 1,
1.006042, 0.003457015, 2.770469, 0, 0, 0, 1, 1,
1.015897, 1.374654, 2.187366, 0, 0, 0, 1, 1,
1.016428, -1.15514, 3.815711, 0, 0, 0, 1, 1,
1.01789, -2.39645, 2.570349, 0, 0, 0, 1, 1,
1.019102, -1.554996, 3.176565, 1, 1, 1, 1, 1,
1.022553, 0.1038082, 0.9514447, 1, 1, 1, 1, 1,
1.025088, 0.157838, 2.383756, 1, 1, 1, 1, 1,
1.032672, 0.5177602, 1.219205, 1, 1, 1, 1, 1,
1.041261, 1.368374, -0.3343298, 1, 1, 1, 1, 1,
1.043204, 0.5559565, 2.419312, 1, 1, 1, 1, 1,
1.043747, 0.6909819, 0.6878293, 1, 1, 1, 1, 1,
1.044369, 0.540799, -0.1398713, 1, 1, 1, 1, 1,
1.049652, 0.2588074, -0.394567, 1, 1, 1, 1, 1,
1.057148, -0.5433725, 0.1052671, 1, 1, 1, 1, 1,
1.059334, -0.5511923, 1.026385, 1, 1, 1, 1, 1,
1.065024, -0.2638296, 1.353762, 1, 1, 1, 1, 1,
1.072335, -0.7560341, 0.8366476, 1, 1, 1, 1, 1,
1.072795, -0.8287644, 4.10689, 1, 1, 1, 1, 1,
1.073319, 0.6946307, 0.9544669, 1, 1, 1, 1, 1,
1.077903, -0.9039496, 0.6807796, 0, 0, 1, 1, 1,
1.090101, 0.2413644, 0.3657509, 1, 0, 0, 1, 1,
1.099917, -0.3306582, 2.789751, 1, 0, 0, 1, 1,
1.101792, 0.903249, 0.7567458, 1, 0, 0, 1, 1,
1.105345, -1.046796, 1.536129, 1, 0, 0, 1, 1,
1.112347, -0.4760834, 4.266545, 1, 0, 0, 1, 1,
1.114923, 1.074876, 0.8399635, 0, 0, 0, 1, 1,
1.123535, 0.1893579, 2.626207, 0, 0, 0, 1, 1,
1.126596, 0.6820928, 1.642849, 0, 0, 0, 1, 1,
1.135964, -0.3478031, 1.646114, 0, 0, 0, 1, 1,
1.139104, 1.041747, 1.568836, 0, 0, 0, 1, 1,
1.139465, 0.5631989, 2.045596, 0, 0, 0, 1, 1,
1.140572, 0.2207268, 1.522087, 0, 0, 0, 1, 1,
1.146053, 0.488264, 0.4118277, 1, 1, 1, 1, 1,
1.148498, -0.9811661, 3.196176, 1, 1, 1, 1, 1,
1.152689, 0.5298161, 0.6947138, 1, 1, 1, 1, 1,
1.152844, -0.712944, 1.250704, 1, 1, 1, 1, 1,
1.178368, 0.3719973, 1.35357, 1, 1, 1, 1, 1,
1.185314, 1.011461, 2.202183, 1, 1, 1, 1, 1,
1.187963, 2.272841, 1.652507, 1, 1, 1, 1, 1,
1.206944, 0.9005883, -0.1776004, 1, 1, 1, 1, 1,
1.21939, -0.8704377, 2.032783, 1, 1, 1, 1, 1,
1.221505, 0.4932747, 0.1548021, 1, 1, 1, 1, 1,
1.227249, 0.4442719, 2.310626, 1, 1, 1, 1, 1,
1.237244, -0.4784943, 1.920934, 1, 1, 1, 1, 1,
1.237722, -0.6045653, 3.712505, 1, 1, 1, 1, 1,
1.257246, 0.1405887, 2.147724, 1, 1, 1, 1, 1,
1.257437, -0.08104082, 2.634164, 1, 1, 1, 1, 1,
1.271056, 1.230719, 0.7799271, 0, 0, 1, 1, 1,
1.282369, 1.933143, 0.5554352, 1, 0, 0, 1, 1,
1.282416, 1.129684, 0.08224106, 1, 0, 0, 1, 1,
1.286357, 1.918681, -0.3646118, 1, 0, 0, 1, 1,
1.286799, 0.785844, -0.07417465, 1, 0, 0, 1, 1,
1.287174, -1.598754, 1.390545, 1, 0, 0, 1, 1,
1.287946, 1.161676, 0.7921456, 0, 0, 0, 1, 1,
1.289414, 0.5115544, 1.78089, 0, 0, 0, 1, 1,
1.301132, 0.3794155, 1.259419, 0, 0, 0, 1, 1,
1.304944, 0.550784, 0.8933426, 0, 0, 0, 1, 1,
1.314191, 1.487676, 0.06038567, 0, 0, 0, 1, 1,
1.315398, -0.3201717, 2.131991, 0, 0, 0, 1, 1,
1.320061, -0.9993744, 1.944472, 0, 0, 0, 1, 1,
1.320945, -0.6064435, 1.861171, 1, 1, 1, 1, 1,
1.321688, 1.382824, 1.26387, 1, 1, 1, 1, 1,
1.328251, -0.8490151, 1.188871, 1, 1, 1, 1, 1,
1.329046, 0.7410569, 1.20665, 1, 1, 1, 1, 1,
1.329755, 1.778376, 1.011888, 1, 1, 1, 1, 1,
1.338781, 0.170151, 0.2684104, 1, 1, 1, 1, 1,
1.358076, 0.8443707, 0.4592098, 1, 1, 1, 1, 1,
1.35919, -2.56118, 3.231329, 1, 1, 1, 1, 1,
1.360351, 1.071285, 2.08078, 1, 1, 1, 1, 1,
1.363327, 1.243561, 0.8542043, 1, 1, 1, 1, 1,
1.368861, -0.4571538, 2.377309, 1, 1, 1, 1, 1,
1.379656, -0.5587754, 0.152238, 1, 1, 1, 1, 1,
1.386756, 2.408296, 0.4003083, 1, 1, 1, 1, 1,
1.387014, -0.227123, 1.955431, 1, 1, 1, 1, 1,
1.388174, -1.078666, 4.128277, 1, 1, 1, 1, 1,
1.396024, 0.9452332, 1.5856, 0, 0, 1, 1, 1,
1.412041, 1.317623, 0.6585751, 1, 0, 0, 1, 1,
1.439285, -0.5988644, 1.792875, 1, 0, 0, 1, 1,
1.444842, 0.4758543, 1.459118, 1, 0, 0, 1, 1,
1.447368, 0.835354, 1.620807, 1, 0, 0, 1, 1,
1.453745, -0.0465848, 2.804976, 1, 0, 0, 1, 1,
1.457095, -0.1582717, 2.267763, 0, 0, 0, 1, 1,
1.460585, -0.05227814, 2.946432, 0, 0, 0, 1, 1,
1.465573, 0.06758635, 3.192142, 0, 0, 0, 1, 1,
1.467152, 0.151477, 2.802214, 0, 0, 0, 1, 1,
1.470807, 0.282035, -0.09599777, 0, 0, 0, 1, 1,
1.472286, 0.01224421, 1.030227, 0, 0, 0, 1, 1,
1.520179, 1.939247, -0.6290827, 0, 0, 0, 1, 1,
1.526441, 0.4709736, 2.209198, 1, 1, 1, 1, 1,
1.536824, 0.535493, 1.628839, 1, 1, 1, 1, 1,
1.537309, 0.4213315, 1.820526, 1, 1, 1, 1, 1,
1.538156, -0.7811649, 1.762491, 1, 1, 1, 1, 1,
1.550048, -1.080198, 1.965439, 1, 1, 1, 1, 1,
1.553611, -0.8094379, 1.368794, 1, 1, 1, 1, 1,
1.571209, -1.04835, 3.18346, 1, 1, 1, 1, 1,
1.577282, 1.294792, 1.451, 1, 1, 1, 1, 1,
1.58646, -0.2346198, 4.411351, 1, 1, 1, 1, 1,
1.60038, 0.2040962, 1.679374, 1, 1, 1, 1, 1,
1.60911, 1.138866, 0.8448213, 1, 1, 1, 1, 1,
1.612082, 1.353099, 0.3979534, 1, 1, 1, 1, 1,
1.613762, -0.1517114, 0.6789175, 1, 1, 1, 1, 1,
1.619038, -0.7208326, 1.989786, 1, 1, 1, 1, 1,
1.62789, 2.3862, 0.1679919, 1, 1, 1, 1, 1,
1.667478, -0.6722834, 0.3253878, 0, 0, 1, 1, 1,
1.69561, 0.9708807, 2.130043, 1, 0, 0, 1, 1,
1.698718, 0.3996977, 1.215368, 1, 0, 0, 1, 1,
1.711965, 2.045326, -0.9262618, 1, 0, 0, 1, 1,
1.717917, -2.262099, 0.8047367, 1, 0, 0, 1, 1,
1.738933, 0.4237925, 0.7729316, 1, 0, 0, 1, 1,
1.743914, -0.4681274, 3.689871, 0, 0, 0, 1, 1,
1.757329, 0.09379197, 2.090171, 0, 0, 0, 1, 1,
1.768207, -0.7806094, 1.547114, 0, 0, 0, 1, 1,
1.771299, -0.3160613, 1.3666, 0, 0, 0, 1, 1,
1.802821, -0.7970817, 1.557073, 0, 0, 0, 1, 1,
1.874773, 1.230609, 1.256104, 0, 0, 0, 1, 1,
1.888765, 0.2844809, 2.397254, 0, 0, 0, 1, 1,
1.891091, 0.9325458, 1.227129, 1, 1, 1, 1, 1,
1.893792, -0.06914001, 1.683827, 1, 1, 1, 1, 1,
1.900766, -0.1102745, 2.836649, 1, 1, 1, 1, 1,
1.920017, -1.226263, 0.9274426, 1, 1, 1, 1, 1,
1.92063, 0.5552123, 0.0358327, 1, 1, 1, 1, 1,
1.947041, -0.471216, 0.8942783, 1, 1, 1, 1, 1,
1.949592, 0.3257665, 1.224894, 1, 1, 1, 1, 1,
1.950006, -0.5319855, 1.904911, 1, 1, 1, 1, 1,
1.958605, 0.6995754, -0.3663985, 1, 1, 1, 1, 1,
1.992851, -0.8448955, 1.485713, 1, 1, 1, 1, 1,
2.006669, 2.351299, 2.98208, 1, 1, 1, 1, 1,
2.102293, 1.995562, 2.04533, 1, 1, 1, 1, 1,
2.148008, -1.22805, 1.912577, 1, 1, 1, 1, 1,
2.154089, 1.943723, 0.7362828, 1, 1, 1, 1, 1,
2.161014, -0.9232444, 2.850698, 1, 1, 1, 1, 1,
2.184001, -0.1827874, 1.458683, 0, 0, 1, 1, 1,
2.187109, -2.109188, 2.354921, 1, 0, 0, 1, 1,
2.249088, 0.4993923, 2.147658, 1, 0, 0, 1, 1,
2.258183, 0.7193822, 1.444667, 1, 0, 0, 1, 1,
2.262858, 0.312983, 1.113796, 1, 0, 0, 1, 1,
2.26784, 0.2703795, 0.7982017, 1, 0, 0, 1, 1,
2.336859, -0.6204947, 0.7612001, 0, 0, 0, 1, 1,
2.369739, 0.1209007, 2.174989, 0, 0, 0, 1, 1,
2.370462, 0.8395864, 3.523995, 0, 0, 0, 1, 1,
2.408312, 0.4246164, 0.9895588, 0, 0, 0, 1, 1,
2.423432, -1.495945, 1.674366, 0, 0, 0, 1, 1,
2.460046, -0.1973915, 2.502046, 0, 0, 0, 1, 1,
2.511594, -1.779962, 2.402624, 0, 0, 0, 1, 1,
2.575149, 2.564284, 0.7269744, 1, 1, 1, 1, 1,
2.581415, 0.4809101, 0.4702925, 1, 1, 1, 1, 1,
2.678227, -0.6618169, 4.753793, 1, 1, 1, 1, 1,
2.68936, 0.1006449, 1.865008, 1, 1, 1, 1, 1,
2.729879, 0.9261974, 1.74341, 1, 1, 1, 1, 1,
3.304173, 0.5860883, 1.122653, 1, 1, 1, 1, 1,
3.610327, 0.1450874, 0.2205316, 1, 1, 1, 1, 1
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
var radius = 9.568429;
var distance = 33.6087;
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
mvMatrix.translate( -0.0627141, -0.2938526, 0.002914906 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.6087);
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