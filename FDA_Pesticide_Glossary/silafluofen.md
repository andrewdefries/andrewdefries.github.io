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
-3.524656, -0.1738892, -0.5104849, 1, 0, 0, 1,
-2.737947, 1.180583, -0.731832, 1, 0.007843138, 0, 1,
-2.596162, -0.87338, -2.152965, 1, 0.01176471, 0, 1,
-2.577188, 0.2741314, -3.135594, 1, 0.01960784, 0, 1,
-2.447364, -2.098087, -2.031777, 1, 0.02352941, 0, 1,
-2.355912, 1.234624, -2.416104, 1, 0.03137255, 0, 1,
-2.309672, 0.9964556, -1.513062, 1, 0.03529412, 0, 1,
-2.289526, 0.6805789, -2.214597, 1, 0.04313726, 0, 1,
-2.265327, 1.106159, -0.1897349, 1, 0.04705882, 0, 1,
-2.254603, 0.8654893, -1.221166, 1, 0.05490196, 0, 1,
-2.247518, -1.441288, -1.987717, 1, 0.05882353, 0, 1,
-2.238119, 0.4076692, -0.3767828, 1, 0.06666667, 0, 1,
-2.228598, -0.229092, 0.4347523, 1, 0.07058824, 0, 1,
-2.197588, -0.1890214, -0.3804657, 1, 0.07843138, 0, 1,
-2.195722, -0.9258491, -1.059918, 1, 0.08235294, 0, 1,
-2.186522, -0.9930317, -1.990048, 1, 0.09019608, 0, 1,
-2.145887, 1.837978, 0.1108944, 1, 0.09411765, 0, 1,
-2.134878, 1.115764, -0.2250026, 1, 0.1019608, 0, 1,
-2.129422, -0.3639402, -2.825931, 1, 0.1098039, 0, 1,
-2.126411, 1.939391, 0.2992373, 1, 0.1137255, 0, 1,
-2.115961, -0.01054274, -1.970322, 1, 0.1215686, 0, 1,
-2.085888, 0.1514949, -0.1261907, 1, 0.1254902, 0, 1,
-2.075705, -0.9031897, -1.29255, 1, 0.1333333, 0, 1,
-2.059633, 0.4022552, -0.3166078, 1, 0.1372549, 0, 1,
-2.040843, -0.3086442, -1.565174, 1, 0.145098, 0, 1,
-2.024439, 0.367871, -0.9281043, 1, 0.1490196, 0, 1,
-1.993688, 0.02186723, -0.04071465, 1, 0.1568628, 0, 1,
-1.985833, 2.169979, 0.1354747, 1, 0.1607843, 0, 1,
-1.982982, 1.452443, -1.14644, 1, 0.1686275, 0, 1,
-1.98105, -0.1527612, -1.217481, 1, 0.172549, 0, 1,
-1.971477, 0.2031075, -0.8839009, 1, 0.1803922, 0, 1,
-1.955549, 1.082941, -0.07645128, 1, 0.1843137, 0, 1,
-1.945255, -0.7533231, -1.185378, 1, 0.1921569, 0, 1,
-1.944403, 1.640744, -0.8302317, 1, 0.1960784, 0, 1,
-1.929078, -0.2926751, 0.2184927, 1, 0.2039216, 0, 1,
-1.922681, 1.648316, -1.51458, 1, 0.2117647, 0, 1,
-1.912341, 0.3287354, -2.46617, 1, 0.2156863, 0, 1,
-1.902051, 0.1534287, -0.6225299, 1, 0.2235294, 0, 1,
-1.879758, 0.3955522, -2.221836, 1, 0.227451, 0, 1,
-1.862471, 0.8468428, -0.7325469, 1, 0.2352941, 0, 1,
-1.859127, 0.8890101, -1.853284, 1, 0.2392157, 0, 1,
-1.834337, 0.5947733, -2.649037, 1, 0.2470588, 0, 1,
-1.831835, -1.02228, -1.426099, 1, 0.2509804, 0, 1,
-1.811253, 0.3218988, -1.964532, 1, 0.2588235, 0, 1,
-1.811218, -1.369732, -3.187492, 1, 0.2627451, 0, 1,
-1.798038, 0.4357474, -1.775385, 1, 0.2705882, 0, 1,
-1.790778, -0.2328383, -1.819259, 1, 0.2745098, 0, 1,
-1.785727, 0.3679396, -1.673548, 1, 0.282353, 0, 1,
-1.784367, -0.6247905, -2.378902, 1, 0.2862745, 0, 1,
-1.783117, 0.2927244, -0.9354731, 1, 0.2941177, 0, 1,
-1.783062, 0.03001726, -1.092524, 1, 0.3019608, 0, 1,
-1.773419, 0.2506571, -1.059625, 1, 0.3058824, 0, 1,
-1.759113, 0.8221503, -1.105346, 1, 0.3137255, 0, 1,
-1.757966, -0.09744794, -1.915632, 1, 0.3176471, 0, 1,
-1.731786, -0.387352, -2.33541, 1, 0.3254902, 0, 1,
-1.721017, -1.675915, -0.2170809, 1, 0.3294118, 0, 1,
-1.720875, 0.718585, -0.5215847, 1, 0.3372549, 0, 1,
-1.701263, 0.975509, 0.2117202, 1, 0.3411765, 0, 1,
-1.667648, -0.9420462, -2.786341, 1, 0.3490196, 0, 1,
-1.653856, -0.9903522, -1.352874, 1, 0.3529412, 0, 1,
-1.653216, 1.612865, 0.607344, 1, 0.3607843, 0, 1,
-1.639716, 0.2077005, 0.2649578, 1, 0.3647059, 0, 1,
-1.622595, 1.122267, -2.266927, 1, 0.372549, 0, 1,
-1.617572, 0.6734836, -1.216383, 1, 0.3764706, 0, 1,
-1.605673, -0.4504284, -3.501868, 1, 0.3843137, 0, 1,
-1.600759, 0.3329534, -1.818519, 1, 0.3882353, 0, 1,
-1.591139, 0.1129749, -2.713777, 1, 0.3960784, 0, 1,
-1.582372, -0.1759652, -2.93896, 1, 0.4039216, 0, 1,
-1.582079, -0.5742598, -1.294326, 1, 0.4078431, 0, 1,
-1.581972, 0.2097201, 0.02917276, 1, 0.4156863, 0, 1,
-1.577527, -0.148249, -1.888844, 1, 0.4196078, 0, 1,
-1.573504, 1.374212, -0.2431021, 1, 0.427451, 0, 1,
-1.570512, -0.9067519, -2.024873, 1, 0.4313726, 0, 1,
-1.568225, 0.8710271, -0.9809231, 1, 0.4392157, 0, 1,
-1.567984, -0.1212718, -1.865225, 1, 0.4431373, 0, 1,
-1.55594, 0.2826479, -1.61126, 1, 0.4509804, 0, 1,
-1.5502, -0.7301195, -3.607367, 1, 0.454902, 0, 1,
-1.543942, 0.9902589, -0.4091679, 1, 0.4627451, 0, 1,
-1.529056, 2.516617, -0.05384705, 1, 0.4666667, 0, 1,
-1.526392, -0.2756871, -2.324513, 1, 0.4745098, 0, 1,
-1.523722, 0.4787899, -0.5015705, 1, 0.4784314, 0, 1,
-1.516833, -0.27014, -1.158125, 1, 0.4862745, 0, 1,
-1.51007, 0.3226282, -2.152486, 1, 0.4901961, 0, 1,
-1.507024, 1.448311, -2.227155, 1, 0.4980392, 0, 1,
-1.501531, -2.442696, -2.236966, 1, 0.5058824, 0, 1,
-1.499474, 0.9959438, -0.9581037, 1, 0.509804, 0, 1,
-1.486229, -2.864882, -2.540208, 1, 0.5176471, 0, 1,
-1.472616, -0.9827353, -1.506978, 1, 0.5215687, 0, 1,
-1.453853, -1.569999, -1.619843, 1, 0.5294118, 0, 1,
-1.451902, -0.8444504, -1.363192, 1, 0.5333334, 0, 1,
-1.448831, -0.1765781, -2.019835, 1, 0.5411765, 0, 1,
-1.448635, 1.114043, -0.3547464, 1, 0.5450981, 0, 1,
-1.44571, 0.6911153, 0.819093, 1, 0.5529412, 0, 1,
-1.428832, -0.2141506, -2.843174, 1, 0.5568628, 0, 1,
-1.426383, 1.486727, -2.255014, 1, 0.5647059, 0, 1,
-1.426013, 0.8905792, -0.4027306, 1, 0.5686275, 0, 1,
-1.413578, -1.800669, -2.592064, 1, 0.5764706, 0, 1,
-1.409602, 0.3522771, -0.3302491, 1, 0.5803922, 0, 1,
-1.406119, 2.979115, 0.03613907, 1, 0.5882353, 0, 1,
-1.395954, -0.7997307, -2.092947, 1, 0.5921569, 0, 1,
-1.380819, 0.6654967, -3.042147, 1, 0.6, 0, 1,
-1.379883, -1.003226, -4.024738, 1, 0.6078432, 0, 1,
-1.376167, -0.04023663, 0.2989235, 1, 0.6117647, 0, 1,
-1.374964, 0.397144, -1.478699, 1, 0.6196079, 0, 1,
-1.369225, 1.003397, -0.7029392, 1, 0.6235294, 0, 1,
-1.36742, -0.06245993, -1.081283, 1, 0.6313726, 0, 1,
-1.365094, -0.7809287, -3.196482, 1, 0.6352941, 0, 1,
-1.353263, -1.522243, -2.425195, 1, 0.6431373, 0, 1,
-1.351605, -0.5917555, -1.904667, 1, 0.6470588, 0, 1,
-1.345275, -1.310281, -1.693329, 1, 0.654902, 0, 1,
-1.34417, 1.037081, -0.7788149, 1, 0.6588235, 0, 1,
-1.342445, 1.408413, 0.8601621, 1, 0.6666667, 0, 1,
-1.319413, 1.999814, 0.3374144, 1, 0.6705883, 0, 1,
-1.310608, 0.6157207, -1.516424, 1, 0.6784314, 0, 1,
-1.294029, 2.256384, -0.4430524, 1, 0.682353, 0, 1,
-1.291803, 0.07131076, -1.927686, 1, 0.6901961, 0, 1,
-1.287602, -0.4406645, -2.499271, 1, 0.6941177, 0, 1,
-1.283593, -0.1197399, -2.380522, 1, 0.7019608, 0, 1,
-1.281986, -0.02089646, -0.2622275, 1, 0.7098039, 0, 1,
-1.281576, -0.8977306, -3.344825, 1, 0.7137255, 0, 1,
-1.280998, -2.195862, -4.238986, 1, 0.7215686, 0, 1,
-1.279668, -1.489509, -2.640333, 1, 0.7254902, 0, 1,
-1.275987, -0.816554, -2.434115, 1, 0.7333333, 0, 1,
-1.269438, -1.089126, -2.227858, 1, 0.7372549, 0, 1,
-1.263061, 1.038965, 1.022044, 1, 0.7450981, 0, 1,
-1.258613, 0.9375161, -0.3267633, 1, 0.7490196, 0, 1,
-1.252231, 1.203631, -1.726598, 1, 0.7568628, 0, 1,
-1.25155, -0.5078071, -3.393146, 1, 0.7607843, 0, 1,
-1.250944, 0.1664567, -0.5675846, 1, 0.7686275, 0, 1,
-1.243151, 0.5636231, -1.809839, 1, 0.772549, 0, 1,
-1.231415, -0.2525469, -2.770858, 1, 0.7803922, 0, 1,
-1.215986, 0.2438437, -2.534303, 1, 0.7843137, 0, 1,
-1.214, 0.3743835, -1.766824, 1, 0.7921569, 0, 1,
-1.210333, 0.1005688, -1.384904, 1, 0.7960784, 0, 1,
-1.208354, -1.570426, -3.542514, 1, 0.8039216, 0, 1,
-1.204805, -1.173383, -1.435767, 1, 0.8117647, 0, 1,
-1.204331, -0.1231117, -0.3393432, 1, 0.8156863, 0, 1,
-1.201261, -0.3197477, -1.946664, 1, 0.8235294, 0, 1,
-1.195279, -0.4601594, -1.673476, 1, 0.827451, 0, 1,
-1.188661, -0.7531961, -3.414556, 1, 0.8352941, 0, 1,
-1.188354, 2.078589, 0.4396265, 1, 0.8392157, 0, 1,
-1.183066, -0.3717286, -1.960663, 1, 0.8470588, 0, 1,
-1.182847, 0.2722031, -0.7764556, 1, 0.8509804, 0, 1,
-1.164907, 0.4725338, -1.059756, 1, 0.8588235, 0, 1,
-1.160431, -0.005766823, -0.9512803, 1, 0.8627451, 0, 1,
-1.157791, -0.7004756, -2.911478, 1, 0.8705882, 0, 1,
-1.150545, 0.5539008, -1.873645, 1, 0.8745098, 0, 1,
-1.149775, -0.1797394, -2.269214, 1, 0.8823529, 0, 1,
-1.144862, 0.01093827, 0.1179469, 1, 0.8862745, 0, 1,
-1.140529, -0.2116732, -1.766986, 1, 0.8941177, 0, 1,
-1.137413, -0.9996812, -4.193249, 1, 0.8980392, 0, 1,
-1.134491, 0.601909, -3.069822, 1, 0.9058824, 0, 1,
-1.132981, 0.5220091, -0.8186904, 1, 0.9137255, 0, 1,
-1.132577, -0.6931916, -2.975369, 1, 0.9176471, 0, 1,
-1.129391, -2.03986, -3.418271, 1, 0.9254902, 0, 1,
-1.12338, 0.9841551, -0.2894045, 1, 0.9294118, 0, 1,
-1.122105, -0.264939, -2.085815, 1, 0.9372549, 0, 1,
-1.118795, -1.474148, -2.221096, 1, 0.9411765, 0, 1,
-1.118756, 0.05592886, -2.074068, 1, 0.9490196, 0, 1,
-1.116678, -0.9765984, -1.734869, 1, 0.9529412, 0, 1,
-1.111418, 0.9583758, 0.3399653, 1, 0.9607843, 0, 1,
-1.107638, 0.8485294, -2.891683, 1, 0.9647059, 0, 1,
-1.105037, -0.4580942, -1.207034, 1, 0.972549, 0, 1,
-1.10449, 0.1078802, -1.48098, 1, 0.9764706, 0, 1,
-1.103581, 1.176337, -3.126055, 1, 0.9843137, 0, 1,
-1.096823, 1.540527, -0.8090579, 1, 0.9882353, 0, 1,
-1.095313, 1.283291, 0.532004, 1, 0.9960784, 0, 1,
-1.080936, -0.8906478, -0.5760748, 0.9960784, 1, 0, 1,
-1.079755, -1.502058, -1.256718, 0.9921569, 1, 0, 1,
-1.077823, 1.224139, -0.4935085, 0.9843137, 1, 0, 1,
-1.073273, 0.9948744, -0.3775179, 0.9803922, 1, 0, 1,
-1.07306, -0.6545378, -0.7642535, 0.972549, 1, 0, 1,
-1.06735, -0.2958438, -2.203861, 0.9686275, 1, 0, 1,
-1.065761, -0.2789652, -2.810451, 0.9607843, 1, 0, 1,
-1.056663, 0.1241159, -2.354203, 0.9568627, 1, 0, 1,
-1.055041, 1.295914, 0.2074876, 0.9490196, 1, 0, 1,
-1.052903, 0.3291678, 0.8864497, 0.945098, 1, 0, 1,
-1.047262, -0.5626159, -0.6684423, 0.9372549, 1, 0, 1,
-1.046354, -0.8901854, -2.085577, 0.9333333, 1, 0, 1,
-1.045947, 0.675664, -0.5255597, 0.9254902, 1, 0, 1,
-1.044451, -0.4605747, -2.055987, 0.9215686, 1, 0, 1,
-1.041285, 0.9545022, -3.280451, 0.9137255, 1, 0, 1,
-1.038796, -1.214134, -1.974595, 0.9098039, 1, 0, 1,
-1.016069, 1.335967, -0.4966386, 0.9019608, 1, 0, 1,
-1.012152, -0.07490765, -2.040344, 0.8941177, 1, 0, 1,
-1.007291, 0.3276911, -1.285712, 0.8901961, 1, 0, 1,
-1.000025, -0.7654284, -2.640028, 0.8823529, 1, 0, 1,
-0.9987539, 0.7890934, -1.393749, 0.8784314, 1, 0, 1,
-0.9971243, -0.2532148, -1.972852, 0.8705882, 1, 0, 1,
-0.9879047, -0.8990698, -3.328836, 0.8666667, 1, 0, 1,
-0.982458, 0.5518638, -1.148886, 0.8588235, 1, 0, 1,
-0.9784652, 0.01020334, -1.322588, 0.854902, 1, 0, 1,
-0.9775603, -0.9582251, -3.144732, 0.8470588, 1, 0, 1,
-0.9743912, -0.49045, -1.539545, 0.8431373, 1, 0, 1,
-0.9734485, 0.253599, -0.4129368, 0.8352941, 1, 0, 1,
-0.9733427, -0.7175551, -2.839979, 0.8313726, 1, 0, 1,
-0.965451, 1.220117, -0.04501989, 0.8235294, 1, 0, 1,
-0.9643455, -0.5770632, -3.086276, 0.8196079, 1, 0, 1,
-0.9642484, 2.663949, 0.1210323, 0.8117647, 1, 0, 1,
-0.9616555, 0.35549, -2.293916, 0.8078431, 1, 0, 1,
-0.9604187, -1.579068, -2.650007, 0.8, 1, 0, 1,
-0.9550831, -0.7890346, -1.872411, 0.7921569, 1, 0, 1,
-0.9547684, 0.8178122, -0.5770324, 0.7882353, 1, 0, 1,
-0.9535161, -0.3105834, -2.28455, 0.7803922, 1, 0, 1,
-0.9475416, 0.8890414, -2.012831, 0.7764706, 1, 0, 1,
-0.9398396, 0.9112366, -1.535859, 0.7686275, 1, 0, 1,
-0.9387183, -0.6617875, -1.934947, 0.7647059, 1, 0, 1,
-0.937644, 0.9095002, -1.050031, 0.7568628, 1, 0, 1,
-0.9350144, -1.072181, -2.207292, 0.7529412, 1, 0, 1,
-0.9311519, 1.021902, -0.6444479, 0.7450981, 1, 0, 1,
-0.9303115, -1.069328, -1.763382, 0.7411765, 1, 0, 1,
-0.9216149, -1.093643, -2.373226, 0.7333333, 1, 0, 1,
-0.9053456, 0.4661609, -0.6108624, 0.7294118, 1, 0, 1,
-0.9051178, -0.219767, -2.476006, 0.7215686, 1, 0, 1,
-0.895831, 0.4152032, -0.9521785, 0.7176471, 1, 0, 1,
-0.8926303, -0.7001048, -2.452915, 0.7098039, 1, 0, 1,
-0.8891514, 0.08281936, -1.483497, 0.7058824, 1, 0, 1,
-0.8874875, 0.3287631, -1.262147, 0.6980392, 1, 0, 1,
-0.879855, -1.035149, -2.695531, 0.6901961, 1, 0, 1,
-0.872968, 1.684247, -0.6168851, 0.6862745, 1, 0, 1,
-0.8713029, -2.248612, -4.005893, 0.6784314, 1, 0, 1,
-0.866667, 0.1586249, -1.922379, 0.6745098, 1, 0, 1,
-0.8609041, -1.134991, -2.447261, 0.6666667, 1, 0, 1,
-0.8587006, 0.5032421, 0.537773, 0.6627451, 1, 0, 1,
-0.8523787, -0.9059339, -1.878572, 0.654902, 1, 0, 1,
-0.8474004, 1.15389, -0.1600154, 0.6509804, 1, 0, 1,
-0.8470082, 1.121246, -0.5968653, 0.6431373, 1, 0, 1,
-0.8445374, -0.06261335, -3.232955, 0.6392157, 1, 0, 1,
-0.8411956, 1.800767, -0.1259461, 0.6313726, 1, 0, 1,
-0.8358414, 0.07087909, -2.362587, 0.627451, 1, 0, 1,
-0.8278466, -0.230368, -2.286785, 0.6196079, 1, 0, 1,
-0.825617, 0.07432571, -0.7576754, 0.6156863, 1, 0, 1,
-0.8226835, 0.3647048, -2.022467, 0.6078432, 1, 0, 1,
-0.8220583, 2.118498, 0.2943698, 0.6039216, 1, 0, 1,
-0.8214741, 0.6935266, -1.114261, 0.5960785, 1, 0, 1,
-0.8197305, 1.535981, -2.389206, 0.5882353, 1, 0, 1,
-0.8184572, -1.475102, -3.064589, 0.5843138, 1, 0, 1,
-0.8058046, -0.774011, -3.839374, 0.5764706, 1, 0, 1,
-0.8031558, -0.1814662, -1.906935, 0.572549, 1, 0, 1,
-0.7951514, 0.5359873, -0.7061329, 0.5647059, 1, 0, 1,
-0.7937519, -0.1293756, -0.276604, 0.5607843, 1, 0, 1,
-0.7936901, -0.7302658, -1.213709, 0.5529412, 1, 0, 1,
-0.7903066, -0.1876302, -0.3923704, 0.5490196, 1, 0, 1,
-0.7848095, -0.4840795, -2.324761, 0.5411765, 1, 0, 1,
-0.7795496, 2.073864, -1.481321, 0.5372549, 1, 0, 1,
-0.7778295, -1.033119, -2.271313, 0.5294118, 1, 0, 1,
-0.7771763, -1.382255, -3.054079, 0.5254902, 1, 0, 1,
-0.7662771, -0.9922552, -2.170497, 0.5176471, 1, 0, 1,
-0.7589892, -1.479323, -3.117029, 0.5137255, 1, 0, 1,
-0.746556, 1.047306, -0.3830517, 0.5058824, 1, 0, 1,
-0.74366, 0.5424209, -1.535972, 0.5019608, 1, 0, 1,
-0.7335936, -0.5172824, -1.568637, 0.4941176, 1, 0, 1,
-0.7305426, -0.6152082, -2.733617, 0.4862745, 1, 0, 1,
-0.7232829, 0.8134038, -1.274577, 0.4823529, 1, 0, 1,
-0.7122427, 0.04073245, -1.179408, 0.4745098, 1, 0, 1,
-0.7119585, -0.6748136, -2.17503, 0.4705882, 1, 0, 1,
-0.701105, -0.2358602, -1.361981, 0.4627451, 1, 0, 1,
-0.6968712, 1.164007, 1.415495, 0.4588235, 1, 0, 1,
-0.6967909, 2.445217, 1.450007, 0.4509804, 1, 0, 1,
-0.6950121, -0.4796893, -1.848195, 0.4470588, 1, 0, 1,
-0.6937504, -0.4998524, -2.637104, 0.4392157, 1, 0, 1,
-0.6856116, -1.303933, -4.264103, 0.4352941, 1, 0, 1,
-0.6833652, -0.99852, -4.979706, 0.427451, 1, 0, 1,
-0.6831277, 1.237323, -2.855603, 0.4235294, 1, 0, 1,
-0.6789733, -0.4088552, -2.847382, 0.4156863, 1, 0, 1,
-0.6759257, -1.103994, -1.475896, 0.4117647, 1, 0, 1,
-0.6755528, 1.249641, -0.2966395, 0.4039216, 1, 0, 1,
-0.6618463, -0.3134158, -2.488618, 0.3960784, 1, 0, 1,
-0.6566809, -0.009871794, -1.856062, 0.3921569, 1, 0, 1,
-0.6536126, -1.135563, -2.210321, 0.3843137, 1, 0, 1,
-0.6532697, -0.5602781, -2.848168, 0.3803922, 1, 0, 1,
-0.6521965, 1.287652, 0.05953721, 0.372549, 1, 0, 1,
-0.651545, 0.4609015, 0.2059136, 0.3686275, 1, 0, 1,
-0.6490164, -0.9075195, -3.543246, 0.3607843, 1, 0, 1,
-0.6463941, 0.2184912, -0.7652328, 0.3568628, 1, 0, 1,
-0.6443193, 0.3769118, -1.15923, 0.3490196, 1, 0, 1,
-0.6382254, -0.2977849, -5.065172, 0.345098, 1, 0, 1,
-0.6340834, 0.476267, -0.46577, 0.3372549, 1, 0, 1,
-0.6331266, -1.193783, -2.544473, 0.3333333, 1, 0, 1,
-0.632688, -0.1914219, -1.464661, 0.3254902, 1, 0, 1,
-0.6289939, -0.07579838, -1.921286, 0.3215686, 1, 0, 1,
-0.6217884, 1.539611, -0.4571623, 0.3137255, 1, 0, 1,
-0.6187568, 0.06614863, -2.280039, 0.3098039, 1, 0, 1,
-0.6122692, 0.2169745, -2.580913, 0.3019608, 1, 0, 1,
-0.6106875, 0.125592, -0.3856279, 0.2941177, 1, 0, 1,
-0.6104062, 2.423183, -0.7019541, 0.2901961, 1, 0, 1,
-0.6103948, 1.294292, -1.307264, 0.282353, 1, 0, 1,
-0.6023897, 0.3206409, -1.51107, 0.2784314, 1, 0, 1,
-0.6011528, -0.2785093, -1.503532, 0.2705882, 1, 0, 1,
-0.5966828, -1.049852, -2.221822, 0.2666667, 1, 0, 1,
-0.5963606, -0.4408797, -0.8710278, 0.2588235, 1, 0, 1,
-0.5868091, -0.6765383, -2.863634, 0.254902, 1, 0, 1,
-0.5860276, -0.7715925, -2.046306, 0.2470588, 1, 0, 1,
-0.5815958, -0.3606987, -2.373127, 0.2431373, 1, 0, 1,
-0.58085, 0.4178846, -1.186948, 0.2352941, 1, 0, 1,
-0.5791944, -0.06144835, -0.714835, 0.2313726, 1, 0, 1,
-0.576062, -0.131471, -1.503926, 0.2235294, 1, 0, 1,
-0.5760593, -0.2617861, -1.809221, 0.2196078, 1, 0, 1,
-0.5692472, 0.4395914, 0.6891459, 0.2117647, 1, 0, 1,
-0.5656846, 1.280276, 1.209589, 0.2078431, 1, 0, 1,
-0.5654625, -1.141302, -3.510248, 0.2, 1, 0, 1,
-0.5650367, -0.2450997, -1.058046, 0.1921569, 1, 0, 1,
-0.5641452, 0.009283847, -2.813703, 0.1882353, 1, 0, 1,
-0.5610708, 0.7196823, 0.05444169, 0.1803922, 1, 0, 1,
-0.5606983, 0.5454633, -0.3163031, 0.1764706, 1, 0, 1,
-0.5598463, -0.2830253, -2.096448, 0.1686275, 1, 0, 1,
-0.5537958, 0.03089144, -1.805319, 0.1647059, 1, 0, 1,
-0.5447553, 0.875833, -0.04842906, 0.1568628, 1, 0, 1,
-0.5447429, -0.1130933, -2.395317, 0.1529412, 1, 0, 1,
-0.5426734, -1.904627, -2.024323, 0.145098, 1, 0, 1,
-0.5282865, 1.169943, -0.4042932, 0.1411765, 1, 0, 1,
-0.5268971, 0.05285441, -0.323402, 0.1333333, 1, 0, 1,
-0.5259838, 0.008351266, -1.870624, 0.1294118, 1, 0, 1,
-0.5257568, 0.3691084, -2.288512, 0.1215686, 1, 0, 1,
-0.5246159, 0.9655597, 0.7930353, 0.1176471, 1, 0, 1,
-0.5152584, -0.2197035, -3.297704, 0.1098039, 1, 0, 1,
-0.5139102, 2.185899, -0.9650325, 0.1058824, 1, 0, 1,
-0.5097265, -0.2564809, -3.893033, 0.09803922, 1, 0, 1,
-0.5015683, -0.8191822, -2.409587, 0.09019608, 1, 0, 1,
-0.501115, 1.257746, -0.6560898, 0.08627451, 1, 0, 1,
-0.4974477, 1.567029, 0.7571837, 0.07843138, 1, 0, 1,
-0.4935386, 0.1468803, -2.417691, 0.07450981, 1, 0, 1,
-0.4925538, -1.391967, -0.5436932, 0.06666667, 1, 0, 1,
-0.4891204, 0.1763315, -1.014755, 0.0627451, 1, 0, 1,
-0.4798174, -0.07317756, -2.380938, 0.05490196, 1, 0, 1,
-0.479281, 0.1425319, -1.627445, 0.05098039, 1, 0, 1,
-0.4789963, 2.071768, -0.1435725, 0.04313726, 1, 0, 1,
-0.473282, 1.347678, -0.2319174, 0.03921569, 1, 0, 1,
-0.4721434, 0.3360659, -0.6947027, 0.03137255, 1, 0, 1,
-0.4708841, 0.2869097, -1.016348, 0.02745098, 1, 0, 1,
-0.470848, 0.5119562, 2.457939, 0.01960784, 1, 0, 1,
-0.4705702, -1.780229, -2.815436, 0.01568628, 1, 0, 1,
-0.4703819, -0.3389896, -2.143075, 0.007843138, 1, 0, 1,
-0.4695933, -1.179043, -1.116266, 0.003921569, 1, 0, 1,
-0.465887, 0.2606146, -1.756647, 0, 1, 0.003921569, 1,
-0.4564569, 0.3369686, -0.07053543, 0, 1, 0.01176471, 1,
-0.4531, 0.004241406, -2.906897, 0, 1, 0.01568628, 1,
-0.4514121, 1.302516, 0.8954932, 0, 1, 0.02352941, 1,
-0.450311, 0.921532, 0.6710469, 0, 1, 0.02745098, 1,
-0.4486569, -0.1777279, -2.616242, 0, 1, 0.03529412, 1,
-0.4465139, 0.2357432, -0.5686208, 0, 1, 0.03921569, 1,
-0.4431679, 0.740262, 0.05635351, 0, 1, 0.04705882, 1,
-0.4430082, 0.7268355, -0.02879499, 0, 1, 0.05098039, 1,
-0.4384556, -1.390116, -4.101094, 0, 1, 0.05882353, 1,
-0.4356575, 3.799381, -0.730774, 0, 1, 0.0627451, 1,
-0.4255814, 0.4157623, -0.3636778, 0, 1, 0.07058824, 1,
-0.4207402, 0.8461371, 0.1491702, 0, 1, 0.07450981, 1,
-0.4170413, -1.878591, -3.452246, 0, 1, 0.08235294, 1,
-0.4159973, -0.6551155, -2.328926, 0, 1, 0.08627451, 1,
-0.4110427, -1.286535, -4.483735, 0, 1, 0.09411765, 1,
-0.4085311, 0.4409247, -2.114571, 0, 1, 0.1019608, 1,
-0.4026131, 0.3819424, 0.138862, 0, 1, 0.1058824, 1,
-0.3993195, -1.875029, -3.053763, 0, 1, 0.1137255, 1,
-0.3978961, -1.22365, -2.32901, 0, 1, 0.1176471, 1,
-0.3966395, 1.162577, 0.3201573, 0, 1, 0.1254902, 1,
-0.3949053, -0.7399, -1.585192, 0, 1, 0.1294118, 1,
-0.3876254, -0.503396, -2.640451, 0, 1, 0.1372549, 1,
-0.3859396, -0.04584791, -2.827646, 0, 1, 0.1411765, 1,
-0.382751, -1.028139, -2.038903, 0, 1, 0.1490196, 1,
-0.3805331, -1.569873, -4.831582, 0, 1, 0.1529412, 1,
-0.3758035, -1.358143, -3.703482, 0, 1, 0.1607843, 1,
-0.3754261, 0.2686315, -1.315973, 0, 1, 0.1647059, 1,
-0.3724801, 0.8267442, -0.2477925, 0, 1, 0.172549, 1,
-0.3690712, -1.682912, -2.88625, 0, 1, 0.1764706, 1,
-0.3676901, 0.5924475, -1.58814, 0, 1, 0.1843137, 1,
-0.3662204, -0.5377984, -2.53067, 0, 1, 0.1882353, 1,
-0.363604, 0.02875447, -3.448383, 0, 1, 0.1960784, 1,
-0.36178, -0.5173391, -3.361702, 0, 1, 0.2039216, 1,
-0.3577037, -0.6551023, -2.121274, 0, 1, 0.2078431, 1,
-0.3576465, -0.1216434, -2.482482, 0, 1, 0.2156863, 1,
-0.3558783, -0.01447852, -0.70882, 0, 1, 0.2196078, 1,
-0.3462736, 0.3210801, -1.315808, 0, 1, 0.227451, 1,
-0.3461187, 0.7705248, 0.3801149, 0, 1, 0.2313726, 1,
-0.3405117, -0.4742429, -1.196583, 0, 1, 0.2392157, 1,
-0.3364157, -0.4123889, -3.121436, 0, 1, 0.2431373, 1,
-0.3338171, 0.06433357, -1.839354, 0, 1, 0.2509804, 1,
-0.331086, -0.9151592, -0.5467439, 0, 1, 0.254902, 1,
-0.3279282, 0.4972925, 0.3459202, 0, 1, 0.2627451, 1,
-0.324711, 0.8779867, -0.2940536, 0, 1, 0.2666667, 1,
-0.3202346, 0.1062562, -2.615621, 0, 1, 0.2745098, 1,
-0.319755, 1.018798, -1.036056, 0, 1, 0.2784314, 1,
-0.3194033, 0.8009578, 1.013269, 0, 1, 0.2862745, 1,
-0.3139462, -0.01409038, 0.1408367, 0, 1, 0.2901961, 1,
-0.3112836, -0.8710504, -2.343886, 0, 1, 0.2980392, 1,
-0.3105528, 0.6334563, -0.8790997, 0, 1, 0.3058824, 1,
-0.3087635, 0.3136898, -0.2792208, 0, 1, 0.3098039, 1,
-0.3027057, -1.893157, -2.047472, 0, 1, 0.3176471, 1,
-0.3011979, -1.932522, -2.227795, 0, 1, 0.3215686, 1,
-0.2996198, -0.54322, -2.079147, 0, 1, 0.3294118, 1,
-0.2969271, -0.1115478, -1.979534, 0, 1, 0.3333333, 1,
-0.2951139, 2.05277, 2.239005, 0, 1, 0.3411765, 1,
-0.2918836, -1.476754, -1.974416, 0, 1, 0.345098, 1,
-0.291274, 0.01686482, -1.876846, 0, 1, 0.3529412, 1,
-0.2885111, -1.192982, -3.848418, 0, 1, 0.3568628, 1,
-0.2810315, -0.144296, -2.029289, 0, 1, 0.3647059, 1,
-0.2800032, -0.9123747, -3.113083, 0, 1, 0.3686275, 1,
-0.2791722, -1.733935, -3.591772, 0, 1, 0.3764706, 1,
-0.2788576, 0.3712188, -1.622916, 0, 1, 0.3803922, 1,
-0.2778904, -0.2282368, -1.115468, 0, 1, 0.3882353, 1,
-0.2764679, 0.2228993, 0.7679781, 0, 1, 0.3921569, 1,
-0.2746356, 1.560653, -0.5993107, 0, 1, 0.4, 1,
-0.2691127, -0.7394783, -1.975524, 0, 1, 0.4078431, 1,
-0.2683721, 0.2634868, -1.033561, 0, 1, 0.4117647, 1,
-0.2670329, 1.079936, 0.5807325, 0, 1, 0.4196078, 1,
-0.2629938, 1.587838, 1.272309, 0, 1, 0.4235294, 1,
-0.2625054, 0.6397136, 0.5418234, 0, 1, 0.4313726, 1,
-0.2619601, -0.04671956, -1.459197, 0, 1, 0.4352941, 1,
-0.2536206, 0.4372483, 0.04796657, 0, 1, 0.4431373, 1,
-0.2525613, -0.7481928, -3.18179, 0, 1, 0.4470588, 1,
-0.2522607, 0.4296634, -1.582542, 0, 1, 0.454902, 1,
-0.2509882, 0.2169538, -1.46506, 0, 1, 0.4588235, 1,
-0.2504045, 0.08641867, -1.804617, 0, 1, 0.4666667, 1,
-0.246765, 0.4683943, -1.434093, 0, 1, 0.4705882, 1,
-0.2451835, -1.148809, -2.943969, 0, 1, 0.4784314, 1,
-0.2435301, -0.09240384, -1.815073, 0, 1, 0.4823529, 1,
-0.2433335, -1.45405, -3.351875, 0, 1, 0.4901961, 1,
-0.2432626, 2.726708, 0.8795022, 0, 1, 0.4941176, 1,
-0.2422782, 0.380002, 1.102228, 0, 1, 0.5019608, 1,
-0.2333563, -0.9265373, -2.437549, 0, 1, 0.509804, 1,
-0.2308767, -0.3212988, -1.57488, 0, 1, 0.5137255, 1,
-0.2308164, -0.53888, -1.887014, 0, 1, 0.5215687, 1,
-0.2293892, -0.1160303, -3.385427, 0, 1, 0.5254902, 1,
-0.226372, 0.2846714, 0.2021268, 0, 1, 0.5333334, 1,
-0.2227, 0.7111352, -1.208139, 0, 1, 0.5372549, 1,
-0.2223915, 0.06820874, -3.462257, 0, 1, 0.5450981, 1,
-0.2223366, -0.3341939, -1.483986, 0, 1, 0.5490196, 1,
-0.2192186, -0.3468403, -2.517391, 0, 1, 0.5568628, 1,
-0.2180944, -0.7353771, -2.857884, 0, 1, 0.5607843, 1,
-0.2172354, 2.963998, 0.06088682, 0, 1, 0.5686275, 1,
-0.2126715, -1.452066, -2.445652, 0, 1, 0.572549, 1,
-0.2113258, -0.1157177, -1.260675, 0, 1, 0.5803922, 1,
-0.2096259, 0.4914738, -0.4284838, 0, 1, 0.5843138, 1,
-0.2077866, -0.5414576, -1.925032, 0, 1, 0.5921569, 1,
-0.2054527, 2.060766, 0.6215893, 0, 1, 0.5960785, 1,
-0.1964706, 1.014297, 0.4263383, 0, 1, 0.6039216, 1,
-0.194601, 1.129538, 0.7270355, 0, 1, 0.6117647, 1,
-0.1933208, -0.2886194, -2.900251, 0, 1, 0.6156863, 1,
-0.1920346, -0.8415799, -1.323094, 0, 1, 0.6235294, 1,
-0.1849924, 1.711388, 1.411575, 0, 1, 0.627451, 1,
-0.184267, 0.3547147, -0.9816885, 0, 1, 0.6352941, 1,
-0.1828756, -0.2403473, -2.405128, 0, 1, 0.6392157, 1,
-0.1750064, -0.06833906, 0.6500114, 0, 1, 0.6470588, 1,
-0.1743192, 0.8305388, 2.061525, 0, 1, 0.6509804, 1,
-0.1719844, -0.307337, -2.815361, 0, 1, 0.6588235, 1,
-0.1710344, 0.02067833, -1.183919, 0, 1, 0.6627451, 1,
-0.170941, -0.268601, -1.436147, 0, 1, 0.6705883, 1,
-0.1655729, -1.533563, -1.82979, 0, 1, 0.6745098, 1,
-0.1646063, 0.580288, -0.1940058, 0, 1, 0.682353, 1,
-0.1640033, -0.2874208, -2.899909, 0, 1, 0.6862745, 1,
-0.1607185, -0.9446163, -2.931658, 0, 1, 0.6941177, 1,
-0.1584617, -0.6467493, -3.794886, 0, 1, 0.7019608, 1,
-0.1490443, 1.261641, 0.8796508, 0, 1, 0.7058824, 1,
-0.148714, 0.3042488, -1.465305, 0, 1, 0.7137255, 1,
-0.1448355, 0.2749921, -0.8136697, 0, 1, 0.7176471, 1,
-0.1438049, -0.89152, -2.520207, 0, 1, 0.7254902, 1,
-0.140204, 0.007090264, -0.5084743, 0, 1, 0.7294118, 1,
-0.1389502, 0.1129369, -0.8225272, 0, 1, 0.7372549, 1,
-0.1385029, 0.4789782, 0.7614235, 0, 1, 0.7411765, 1,
-0.1379123, -0.2882497, -2.949671, 0, 1, 0.7490196, 1,
-0.1361388, 0.3493902, -0.417726, 0, 1, 0.7529412, 1,
-0.1347972, -0.6254763, -3.278004, 0, 1, 0.7607843, 1,
-0.1321387, -0.3646884, -0.8227035, 0, 1, 0.7647059, 1,
-0.1301452, 1.308772, -0.32798, 0, 1, 0.772549, 1,
-0.1267508, -0.4231328, -2.438275, 0, 1, 0.7764706, 1,
-0.125757, -1.335659, -2.77436, 0, 1, 0.7843137, 1,
-0.1228735, -0.3588309, -2.070116, 0, 1, 0.7882353, 1,
-0.1185786, -0.3018051, -2.089528, 0, 1, 0.7960784, 1,
-0.1148235, 0.7306268, 0.5042693, 0, 1, 0.8039216, 1,
-0.1142476, 0.4598913, -2.137395, 0, 1, 0.8078431, 1,
-0.1102049, 1.018277, 0.3452973, 0, 1, 0.8156863, 1,
-0.107295, 0.6822345, -0.5974481, 0, 1, 0.8196079, 1,
-0.1068812, -1.727808, -1.403207, 0, 1, 0.827451, 1,
-0.1055898, -0.2033277, -3.480411, 0, 1, 0.8313726, 1,
-0.1008961, 0.3209424, -0.5333684, 0, 1, 0.8392157, 1,
-0.1000726, 0.3100507, 0.3737283, 0, 1, 0.8431373, 1,
-0.09537361, 0.9494759, 0.5517517, 0, 1, 0.8509804, 1,
-0.09258014, 0.7934371, 1.097854, 0, 1, 0.854902, 1,
-0.09193381, -1.793472, -3.341742, 0, 1, 0.8627451, 1,
-0.09182101, -0.6531074, -3.480706, 0, 1, 0.8666667, 1,
-0.08113993, -0.544607, -2.943534, 0, 1, 0.8745098, 1,
-0.0796214, 0.259887, 0.3132683, 0, 1, 0.8784314, 1,
-0.07295586, 0.6036958, 0.5220404, 0, 1, 0.8862745, 1,
-0.07121027, 0.5809544, -2.297794, 0, 1, 0.8901961, 1,
-0.06379949, -1.171179, -3.298141, 0, 1, 0.8980392, 1,
-0.06278829, -1.625867, -2.558776, 0, 1, 0.9058824, 1,
-0.06125655, -0.1445332, -2.187208, 0, 1, 0.9098039, 1,
-0.06059018, -0.08279195, -2.960858, 0, 1, 0.9176471, 1,
-0.0604679, 0.7526639, 0.9741356, 0, 1, 0.9215686, 1,
-0.05775054, 0.4095674, -1.828114, 0, 1, 0.9294118, 1,
-0.05703381, -0.9717509, -3.373918, 0, 1, 0.9333333, 1,
-0.05366476, -1.636295, -3.308675, 0, 1, 0.9411765, 1,
-0.04934885, -0.3897552, -4.230992, 0, 1, 0.945098, 1,
-0.04913179, 0.7341826, 0.2108078, 0, 1, 0.9529412, 1,
-0.04638758, -0.2223978, -2.747004, 0, 1, 0.9568627, 1,
-0.04378739, -0.17398, -1.87594, 0, 1, 0.9647059, 1,
-0.04275412, -0.6364741, -4.127361, 0, 1, 0.9686275, 1,
-0.04260485, -0.01877753, -2.205051, 0, 1, 0.9764706, 1,
-0.04086664, 0.1148384, 2.438031, 0, 1, 0.9803922, 1,
-0.03962059, -1.307259, -4.171902, 0, 1, 0.9882353, 1,
-0.03265136, -0.7473884, -2.62663, 0, 1, 0.9921569, 1,
-0.02318385, -0.2423789, -2.184081, 0, 1, 1, 1,
-0.01966036, 0.2859275, -2.34578, 0, 0.9921569, 1, 1,
-0.009247608, 0.3009675, -0.3400276, 0, 0.9882353, 1, 1,
-0.002979578, -0.5307134, -4.57432, 0, 0.9803922, 1, 1,
-0.001665088, -0.942358, -3.097859, 0, 0.9764706, 1, 1,
0.002512694, 0.9311933, -0.2337153, 0, 0.9686275, 1, 1,
0.002926626, 0.4626788, 0.4779777, 0, 0.9647059, 1, 1,
0.003566973, -1.241962, 1.604272, 0, 0.9568627, 1, 1,
0.01069065, 0.7274977, 0.1696485, 0, 0.9529412, 1, 1,
0.01216426, 1.073492, 0.2263157, 0, 0.945098, 1, 1,
0.01306796, 0.8335176, -0.5094868, 0, 0.9411765, 1, 1,
0.01793592, -0.1307832, 4.457104, 0, 0.9333333, 1, 1,
0.0199127, -0.1681163, 4.175233, 0, 0.9294118, 1, 1,
0.02349162, -0.386014, 2.074517, 0, 0.9215686, 1, 1,
0.02386203, 0.1255277, -0.2783825, 0, 0.9176471, 1, 1,
0.02554243, 0.3992167, 0.4801903, 0, 0.9098039, 1, 1,
0.03501682, 0.7365167, 0.9842191, 0, 0.9058824, 1, 1,
0.03766843, 0.09616577, 0.729075, 0, 0.8980392, 1, 1,
0.03959673, -0.7019431, 3.032393, 0, 0.8901961, 1, 1,
0.04169402, -1.627691, 2.117135, 0, 0.8862745, 1, 1,
0.04191137, -0.5049413, 2.4469, 0, 0.8784314, 1, 1,
0.0428502, -0.4680101, 3.315045, 0, 0.8745098, 1, 1,
0.04742058, 0.0008802045, 2.485308, 0, 0.8666667, 1, 1,
0.05610223, -1.55358, 1.8965, 0, 0.8627451, 1, 1,
0.0593381, -0.3461722, 4.879101, 0, 0.854902, 1, 1,
0.06582482, -2.083865, 3.264593, 0, 0.8509804, 1, 1,
0.06582871, 0.05332899, 2.566163, 0, 0.8431373, 1, 1,
0.07024937, -0.7152272, 5.33653, 0, 0.8392157, 1, 1,
0.07106248, 1.12286, -0.8753677, 0, 0.8313726, 1, 1,
0.07342106, -0.875737, 3.22486, 0, 0.827451, 1, 1,
0.07427511, 1.682071, -0.4083038, 0, 0.8196079, 1, 1,
0.07501466, 0.9134439, 0.1026089, 0, 0.8156863, 1, 1,
0.08747609, 1.32364, 0.1121889, 0, 0.8078431, 1, 1,
0.09044144, 0.7463549, 0.1009812, 0, 0.8039216, 1, 1,
0.0905329, 0.9446301, -0.0773448, 0, 0.7960784, 1, 1,
0.09246783, 0.3297597, 1.121544, 0, 0.7882353, 1, 1,
0.09800868, -0.5929499, 4.407819, 0, 0.7843137, 1, 1,
0.09837961, -0.1079208, 0.6537982, 0, 0.7764706, 1, 1,
0.09852772, 0.2496416, 0.9265066, 0, 0.772549, 1, 1,
0.09862206, -0.5986714, 3.208278, 0, 0.7647059, 1, 1,
0.09990478, 1.066156, -0.7445608, 0, 0.7607843, 1, 1,
0.1031439, -0.5691023, 4.977741, 0, 0.7529412, 1, 1,
0.1068097, -0.176134, 0.7418742, 0, 0.7490196, 1, 1,
0.1079314, -0.4503161, 2.087746, 0, 0.7411765, 1, 1,
0.1100865, -0.2660795, 2.596824, 0, 0.7372549, 1, 1,
0.1106183, 1.624331, -0.7470374, 0, 0.7294118, 1, 1,
0.1153285, 0.6504632, 1.105442, 0, 0.7254902, 1, 1,
0.1168176, -1.71761, 3.292567, 0, 0.7176471, 1, 1,
0.1195131, 1.501327, 0.7728173, 0, 0.7137255, 1, 1,
0.1209172, -1.429917, 3.962176, 0, 0.7058824, 1, 1,
0.1209351, 0.4701215, 0.1587572, 0, 0.6980392, 1, 1,
0.1228822, 1.133433, -0.6061671, 0, 0.6941177, 1, 1,
0.1263319, 0.4415993, 1.40259, 0, 0.6862745, 1, 1,
0.1283543, 0.4518597, 0.8424081, 0, 0.682353, 1, 1,
0.1283885, -0.01599336, 3.076983, 0, 0.6745098, 1, 1,
0.1307209, 0.05311086, 1.078916, 0, 0.6705883, 1, 1,
0.1311018, 0.429926, -0.6927282, 0, 0.6627451, 1, 1,
0.1329207, 0.0588525, 2.573574, 0, 0.6588235, 1, 1,
0.1341372, 0.9246861, -0.06209105, 0, 0.6509804, 1, 1,
0.134957, -0.1281681, 3.010448, 0, 0.6470588, 1, 1,
0.1358741, -0.6732817, 2.517202, 0, 0.6392157, 1, 1,
0.1386728, 0.009997874, 4.067459, 0, 0.6352941, 1, 1,
0.1404035, -1.341583, 3.542444, 0, 0.627451, 1, 1,
0.1434968, -1.948997, 3.567511, 0, 0.6235294, 1, 1,
0.1465905, -0.8309064, 2.98259, 0, 0.6156863, 1, 1,
0.1475524, 0.8469117, 0.1907862, 0, 0.6117647, 1, 1,
0.1476077, 0.3364322, -2.029115, 0, 0.6039216, 1, 1,
0.1479727, 0.3598406, 0.8298579, 0, 0.5960785, 1, 1,
0.1489542, 0.8340923, 2.207513, 0, 0.5921569, 1, 1,
0.1540593, -0.216148, 2.002209, 0, 0.5843138, 1, 1,
0.1541034, 0.3858583, 0.754998, 0, 0.5803922, 1, 1,
0.157708, -0.6470357, 0.8123922, 0, 0.572549, 1, 1,
0.1591358, -1.811712, 2.863008, 0, 0.5686275, 1, 1,
0.1602184, 0.1701455, 1.318583, 0, 0.5607843, 1, 1,
0.1621344, 1.318143, 1.735062, 0, 0.5568628, 1, 1,
0.1633339, -0.5441624, 1.811822, 0, 0.5490196, 1, 1,
0.1641956, -1.871578, 4.469791, 0, 0.5450981, 1, 1,
0.1703888, -0.4146436, 2.817901, 0, 0.5372549, 1, 1,
0.1705958, -0.9866879, 2.917073, 0, 0.5333334, 1, 1,
0.1713455, -0.9677273, 3.059809, 0, 0.5254902, 1, 1,
0.1717026, -2.795916, 2.657298, 0, 0.5215687, 1, 1,
0.1725577, -0.8654546, 4.85655, 0, 0.5137255, 1, 1,
0.1732203, -0.4271123, 2.035822, 0, 0.509804, 1, 1,
0.1768142, -1.349513, 1.793939, 0, 0.5019608, 1, 1,
0.1787698, 1.308651, -0.05457098, 0, 0.4941176, 1, 1,
0.1809825, 0.3790343, 1.162147, 0, 0.4901961, 1, 1,
0.1814926, 2.635453, -0.4796138, 0, 0.4823529, 1, 1,
0.1834578, 0.856046, -0.4015841, 0, 0.4784314, 1, 1,
0.1835179, 0.5467622, 0.6015108, 0, 0.4705882, 1, 1,
0.183767, 0.9547582, 1.564475, 0, 0.4666667, 1, 1,
0.18527, 1.057913, 0.4707179, 0, 0.4588235, 1, 1,
0.1873056, -1.0776, 3.981942, 0, 0.454902, 1, 1,
0.1888309, -0.3893492, 0.8841641, 0, 0.4470588, 1, 1,
0.1905564, 0.426374, -0.4224634, 0, 0.4431373, 1, 1,
0.1908075, 0.2408478, 1.798184, 0, 0.4352941, 1, 1,
0.1919367, 1.162929, 1.435798, 0, 0.4313726, 1, 1,
0.1927222, 1.251349, -0.5939677, 0, 0.4235294, 1, 1,
0.1931904, 0.9651428, 1.360174, 0, 0.4196078, 1, 1,
0.1949041, 0.9249097, -1.216909, 0, 0.4117647, 1, 1,
0.1971061, 0.5657442, 0.9668619, 0, 0.4078431, 1, 1,
0.1971094, -0.6391813, 2.807844, 0, 0.4, 1, 1,
0.2010987, 1.063412, -0.6061116, 0, 0.3921569, 1, 1,
0.2024319, -1.273418, 2.257088, 0, 0.3882353, 1, 1,
0.2160048, 1.602467, 0.4913323, 0, 0.3803922, 1, 1,
0.2166254, -0.8556061, 3.702293, 0, 0.3764706, 1, 1,
0.2185509, -0.5262578, 2.798795, 0, 0.3686275, 1, 1,
0.2201509, 1.017018, 0.5888594, 0, 0.3647059, 1, 1,
0.2205578, -0.7850986, 1.409113, 0, 0.3568628, 1, 1,
0.2252972, -1.036688, 2.910834, 0, 0.3529412, 1, 1,
0.2256954, -0.9109647, 4.76838, 0, 0.345098, 1, 1,
0.2293871, -1.943823, 1.305988, 0, 0.3411765, 1, 1,
0.2295642, 1.363644, 0.8401183, 0, 0.3333333, 1, 1,
0.2297573, -0.2247264, 2.363769, 0, 0.3294118, 1, 1,
0.238921, 0.165782, 2.404659, 0, 0.3215686, 1, 1,
0.2453397, 0.6202652, 1.053521, 0, 0.3176471, 1, 1,
0.2531022, -0.3289247, 4.063468, 0, 0.3098039, 1, 1,
0.2542259, 0.01895439, 1.800922, 0, 0.3058824, 1, 1,
0.268547, 1.227233, -1.664265, 0, 0.2980392, 1, 1,
0.2703575, 0.06359824, 0.2526206, 0, 0.2901961, 1, 1,
0.2716202, 0.01815423, 0.8534857, 0, 0.2862745, 1, 1,
0.2728693, -0.881387, 2.263031, 0, 0.2784314, 1, 1,
0.2730263, 1.98853, 0.02226305, 0, 0.2745098, 1, 1,
0.2744845, 0.6925238, 1.544462, 0, 0.2666667, 1, 1,
0.2745623, -1.878024, 3.549433, 0, 0.2627451, 1, 1,
0.2749478, -0.8822876, 3.618192, 0, 0.254902, 1, 1,
0.2790006, -0.8301097, 2.245908, 0, 0.2509804, 1, 1,
0.2794161, 0.03984089, 0.5756371, 0, 0.2431373, 1, 1,
0.2798989, -0.1425565, 4.447526, 0, 0.2392157, 1, 1,
0.2817865, 1.2966, 1.424882, 0, 0.2313726, 1, 1,
0.2894419, 0.9166294, 1.246628, 0, 0.227451, 1, 1,
0.2907486, -1.114325, 2.513345, 0, 0.2196078, 1, 1,
0.2974077, -1.075626, 2.937349, 0, 0.2156863, 1, 1,
0.2990836, 1.231513, -0.6942406, 0, 0.2078431, 1, 1,
0.3006205, -0.06861928, 2.130544, 0, 0.2039216, 1, 1,
0.3034124, -0.9689572, 1.02036, 0, 0.1960784, 1, 1,
0.3119643, -0.8971286, 2.164229, 0, 0.1882353, 1, 1,
0.3151737, -0.8236325, 2.440175, 0, 0.1843137, 1, 1,
0.320987, -0.6359295, 2.131225, 0, 0.1764706, 1, 1,
0.3216284, -0.9989459, 2.682525, 0, 0.172549, 1, 1,
0.3280631, 0.1715426, 1.004658, 0, 0.1647059, 1, 1,
0.3289136, 1.098193, 0.4921826, 0, 0.1607843, 1, 1,
0.3376218, -1.114121, 2.912714, 0, 0.1529412, 1, 1,
0.342623, -0.2465073, 1.918112, 0, 0.1490196, 1, 1,
0.34354, -1.49501, 3.102124, 0, 0.1411765, 1, 1,
0.3516304, -2.140485, 3.438344, 0, 0.1372549, 1, 1,
0.3528439, 0.007093281, 1.728911, 0, 0.1294118, 1, 1,
0.3529074, -0.4196087, 2.915437, 0, 0.1254902, 1, 1,
0.3611239, 1.153777, 0.9060082, 0, 0.1176471, 1, 1,
0.3613713, 1.794995, -1.460119, 0, 0.1137255, 1, 1,
0.3651797, -0.4865826, 1.978531, 0, 0.1058824, 1, 1,
0.3664541, -0.5783983, 2.960024, 0, 0.09803922, 1, 1,
0.3715811, -0.4705049, 2.144222, 0, 0.09411765, 1, 1,
0.3717155, -0.7128751, 2.464006, 0, 0.08627451, 1, 1,
0.3722408, -0.7768164, 4.257004, 0, 0.08235294, 1, 1,
0.3727646, -0.2119812, 3.028786, 0, 0.07450981, 1, 1,
0.3753007, -1.073169, 4.516993, 0, 0.07058824, 1, 1,
0.3772515, 0.7294719, -0.6877331, 0, 0.0627451, 1, 1,
0.3775394, -0.432697, 1.918851, 0, 0.05882353, 1, 1,
0.3839302, -2.939922, 1.881338, 0, 0.05098039, 1, 1,
0.3919214, -0.8264166, 1.649709, 0, 0.04705882, 1, 1,
0.3932112, -0.2113487, 3.444028, 0, 0.03921569, 1, 1,
0.3965542, -0.562564, 3.018305, 0, 0.03529412, 1, 1,
0.4031716, -0.1427961, 2.211802, 0, 0.02745098, 1, 1,
0.4038945, -1.220337, 1.068641, 0, 0.02352941, 1, 1,
0.4080631, -1.601261, 3.443053, 0, 0.01568628, 1, 1,
0.4091304, 0.7520059, 0.7538516, 0, 0.01176471, 1, 1,
0.4156219, -2.061939, 2.699847, 0, 0.003921569, 1, 1,
0.4176412, 0.07318003, 3.240742, 0.003921569, 0, 1, 1,
0.4185613, 0.2113647, 0.2690795, 0.007843138, 0, 1, 1,
0.4206087, 0.4624117, 1.032328, 0.01568628, 0, 1, 1,
0.4230892, 0.5381914, 0.7307868, 0.01960784, 0, 1, 1,
0.4233248, 1.181027, -0.68291, 0.02745098, 0, 1, 1,
0.4234326, 0.1973147, 2.284875, 0.03137255, 0, 1, 1,
0.4237949, 0.9184753, 0.7449918, 0.03921569, 0, 1, 1,
0.4241233, -0.5622649, 3.758032, 0.04313726, 0, 1, 1,
0.4241871, 0.6853261, -1.565173, 0.05098039, 0, 1, 1,
0.4242425, -0.8280321, 3.298453, 0.05490196, 0, 1, 1,
0.4258519, -1.202232, 3.456058, 0.0627451, 0, 1, 1,
0.428379, -0.2566219, 1.600515, 0.06666667, 0, 1, 1,
0.4323438, 0.1287798, 0.4600736, 0.07450981, 0, 1, 1,
0.4326509, -0.05926652, -0.3356105, 0.07843138, 0, 1, 1,
0.4337584, 0.6017025, 0.7103435, 0.08627451, 0, 1, 1,
0.4376194, -0.6619632, 4.587646, 0.09019608, 0, 1, 1,
0.442378, 1.072107, 1.268838, 0.09803922, 0, 1, 1,
0.4441542, 0.8472604, 0.6487036, 0.1058824, 0, 1, 1,
0.4476495, 0.8519062, 2.027003, 0.1098039, 0, 1, 1,
0.450232, -1.53547, 2.294241, 0.1176471, 0, 1, 1,
0.4506692, 0.4638374, -0.3257838, 0.1215686, 0, 1, 1,
0.4554063, -0.2716, 2.10142, 0.1294118, 0, 1, 1,
0.4558049, -0.01086524, 0.2719008, 0.1333333, 0, 1, 1,
0.4567024, 0.09492668, 2.813963, 0.1411765, 0, 1, 1,
0.4577294, 1.652885, 0.3076159, 0.145098, 0, 1, 1,
0.4586193, -1.119232, 4.34166, 0.1529412, 0, 1, 1,
0.4669598, -0.470959, 2.777891, 0.1568628, 0, 1, 1,
0.4692565, 0.7681766, 2.136242, 0.1647059, 0, 1, 1,
0.4694748, -1.288087, 3.670824, 0.1686275, 0, 1, 1,
0.4744585, -0.7820805, 0.7968229, 0.1764706, 0, 1, 1,
0.4754356, 1.279954, 1.263027, 0.1803922, 0, 1, 1,
0.4836349, -0.3807469, 2.925514, 0.1882353, 0, 1, 1,
0.4896986, 0.7656044, -0.7629811, 0.1921569, 0, 1, 1,
0.4973142, -1.159548, 2.345424, 0.2, 0, 1, 1,
0.5035968, -0.7774256, 3.466648, 0.2078431, 0, 1, 1,
0.5060135, -0.7931895, 1.3756, 0.2117647, 0, 1, 1,
0.5061592, -1.838535, 2.676121, 0.2196078, 0, 1, 1,
0.5125498, 0.4343127, 1.331653, 0.2235294, 0, 1, 1,
0.5133632, -0.6927957, 2.105887, 0.2313726, 0, 1, 1,
0.5188887, -0.6408273, 3.327269, 0.2352941, 0, 1, 1,
0.5236533, -1.063857, 2.522351, 0.2431373, 0, 1, 1,
0.5315836, -0.9526075, 3.916496, 0.2470588, 0, 1, 1,
0.5387324, 2.241013, 0.3879013, 0.254902, 0, 1, 1,
0.5403966, -0.1836822, 1.124273, 0.2588235, 0, 1, 1,
0.5405847, -0.2858162, 1.91335, 0.2666667, 0, 1, 1,
0.5419433, 1.091834, -0.4206871, 0.2705882, 0, 1, 1,
0.544048, -1.039323, 4.487031, 0.2784314, 0, 1, 1,
0.5478551, -0.9896544, 3.386235, 0.282353, 0, 1, 1,
0.5495487, 0.05686574, 2.243904, 0.2901961, 0, 1, 1,
0.5527214, 1.118997, 0.7667897, 0.2941177, 0, 1, 1,
0.5548177, -0.4662861, 1.617037, 0.3019608, 0, 1, 1,
0.55566, 2.421268, 0.9803315, 0.3098039, 0, 1, 1,
0.5557755, -0.2286023, 3.775621, 0.3137255, 0, 1, 1,
0.5614235, 2.55448, 1.749782, 0.3215686, 0, 1, 1,
0.5640743, -0.3887324, 2.081394, 0.3254902, 0, 1, 1,
0.571067, 0.944528, 1.933245, 0.3333333, 0, 1, 1,
0.5732211, 0.8585085, 0.3471409, 0.3372549, 0, 1, 1,
0.5746942, 0.331257, -0.3868367, 0.345098, 0, 1, 1,
0.5756413, -2.158929, 2.348917, 0.3490196, 0, 1, 1,
0.5757325, 0.4695809, 2.516664, 0.3568628, 0, 1, 1,
0.5757998, -0.8917484, 2.187507, 0.3607843, 0, 1, 1,
0.5794857, -1.128461, 2.239302, 0.3686275, 0, 1, 1,
0.5796178, -1.049433, 2.826296, 0.372549, 0, 1, 1,
0.5814989, 0.003938989, 2.588205, 0.3803922, 0, 1, 1,
0.5839413, -0.7112656, 3.096251, 0.3843137, 0, 1, 1,
0.5872208, -0.4427105, 2.286007, 0.3921569, 0, 1, 1,
0.5924767, -0.2391865, 1.540847, 0.3960784, 0, 1, 1,
0.5937375, -2.104572, 2.524857, 0.4039216, 0, 1, 1,
0.5978104, -1.747403, 3.324271, 0.4117647, 0, 1, 1,
0.598496, 1.653782, -0.1963215, 0.4156863, 0, 1, 1,
0.605089, 0.2575862, 1.148308, 0.4235294, 0, 1, 1,
0.6051575, -0.3750322, 1.272435, 0.427451, 0, 1, 1,
0.6093487, 0.1415806, -0.4422032, 0.4352941, 0, 1, 1,
0.6114529, -0.8211405, 1.877676, 0.4392157, 0, 1, 1,
0.6123366, 1.013336, 0.9281844, 0.4470588, 0, 1, 1,
0.61397, 1.334609, 0.03241103, 0.4509804, 0, 1, 1,
0.6159873, -1.069344, -0.04867679, 0.4588235, 0, 1, 1,
0.6177324, -1.60073, 2.289091, 0.4627451, 0, 1, 1,
0.619805, -0.9487607, 3.053951, 0.4705882, 0, 1, 1,
0.6226558, 0.6729463, -0.5004222, 0.4745098, 0, 1, 1,
0.6240675, -0.9028087, 4.780325, 0.4823529, 0, 1, 1,
0.6280766, -0.1361297, 1.315537, 0.4862745, 0, 1, 1,
0.6302033, 0.1406691, 1.160178, 0.4941176, 0, 1, 1,
0.6362616, 0.3178714, 0.1970123, 0.5019608, 0, 1, 1,
0.6382999, 0.3380425, -0.7368024, 0.5058824, 0, 1, 1,
0.6440098, -1.500871, 2.24287, 0.5137255, 0, 1, 1,
0.6440791, -0.5979162, 3.290916, 0.5176471, 0, 1, 1,
0.6452608, -1.926272, 3.505723, 0.5254902, 0, 1, 1,
0.6484607, 0.7716907, -0.0999712, 0.5294118, 0, 1, 1,
0.6573165, 0.7619916, 1.061049, 0.5372549, 0, 1, 1,
0.665381, -1.350296, 3.429645, 0.5411765, 0, 1, 1,
0.6655517, 0.5504725, 0.4780297, 0.5490196, 0, 1, 1,
0.6667683, 0.01921242, 1.563349, 0.5529412, 0, 1, 1,
0.6713028, 1.330875, -0.4903256, 0.5607843, 0, 1, 1,
0.6749483, -1.266374, 4.30599, 0.5647059, 0, 1, 1,
0.6761446, -1.851643, 2.992033, 0.572549, 0, 1, 1,
0.6770886, 1.545902, -0.3493813, 0.5764706, 0, 1, 1,
0.6824918, -0.2218254, 2.402096, 0.5843138, 0, 1, 1,
0.6830642, -1.12659, 1.972746, 0.5882353, 0, 1, 1,
0.6832445, 1.02842, 0.3129233, 0.5960785, 0, 1, 1,
0.6839426, 1.383132, 1.54693, 0.6039216, 0, 1, 1,
0.6867267, -0.5399197, 3.012112, 0.6078432, 0, 1, 1,
0.6877038, -1.203214, 0.4073039, 0.6156863, 0, 1, 1,
0.6937531, 0.5412211, 1.568093, 0.6196079, 0, 1, 1,
0.6955312, 0.1648775, 1.395981, 0.627451, 0, 1, 1,
0.6962206, 0.8575327, 2.561828, 0.6313726, 0, 1, 1,
0.6969339, 1.67108, 2.066655, 0.6392157, 0, 1, 1,
0.7079807, -0.7381505, 3.250734, 0.6431373, 0, 1, 1,
0.7101462, 2.675898, -0.9861059, 0.6509804, 0, 1, 1,
0.7108234, 0.8153693, 2.246129, 0.654902, 0, 1, 1,
0.7132108, 0.9294393, 0.2714187, 0.6627451, 0, 1, 1,
0.715328, 0.4825839, 1.393098, 0.6666667, 0, 1, 1,
0.7186983, 1.486401, 1.764612, 0.6745098, 0, 1, 1,
0.7231817, 0.3304845, 0.8067726, 0.6784314, 0, 1, 1,
0.7249625, 1.16286, -0.584209, 0.6862745, 0, 1, 1,
0.7274106, -0.0387818, 1.480884, 0.6901961, 0, 1, 1,
0.737803, -0.1851653, 2.584157, 0.6980392, 0, 1, 1,
0.740731, 0.2365481, 2.306346, 0.7058824, 0, 1, 1,
0.7439791, -1.128421, 2.861725, 0.7098039, 0, 1, 1,
0.750572, -1.637155, 2.328769, 0.7176471, 0, 1, 1,
0.7581863, 0.6651943, 1.14908, 0.7215686, 0, 1, 1,
0.767644, -0.997263, 2.88799, 0.7294118, 0, 1, 1,
0.7679185, 0.8955725, 0.8438305, 0.7333333, 0, 1, 1,
0.7680904, -0.8355546, 1.827377, 0.7411765, 0, 1, 1,
0.7744179, -1.024652, 1.178056, 0.7450981, 0, 1, 1,
0.7758592, -0.5197568, 1.572827, 0.7529412, 0, 1, 1,
0.7772304, -0.5104232, 2.348232, 0.7568628, 0, 1, 1,
0.7810401, -1.990259, 3.728486, 0.7647059, 0, 1, 1,
0.7838929, 0.06551154, 0.3070821, 0.7686275, 0, 1, 1,
0.7839994, 0.5755686, 1.730059, 0.7764706, 0, 1, 1,
0.7865679, -0.01819149, 1.603212, 0.7803922, 0, 1, 1,
0.786666, 1.705474, -0.7038153, 0.7882353, 0, 1, 1,
0.7878559, -0.1019736, 0.4336279, 0.7921569, 0, 1, 1,
0.7909217, 0.3725192, -0.2319225, 0.8, 0, 1, 1,
0.796046, -0.5935181, 2.436885, 0.8078431, 0, 1, 1,
0.804426, 0.3234799, 2.047354, 0.8117647, 0, 1, 1,
0.8096129, -0.5810271, 1.844703, 0.8196079, 0, 1, 1,
0.810384, 0.3062644, 1.264821, 0.8235294, 0, 1, 1,
0.8167289, 0.2749479, 1.328968, 0.8313726, 0, 1, 1,
0.8212303, -0.04917592, 1.540726, 0.8352941, 0, 1, 1,
0.8293675, -0.6614592, 2.007715, 0.8431373, 0, 1, 1,
0.8325145, 0.9200431, 2.894274, 0.8470588, 0, 1, 1,
0.8336014, -1.72786, 2.986195, 0.854902, 0, 1, 1,
0.8339471, 0.7748234, -0.3457762, 0.8588235, 0, 1, 1,
0.837848, -0.6937549, 3.09978, 0.8666667, 0, 1, 1,
0.8409156, -0.1030388, 0.7348925, 0.8705882, 0, 1, 1,
0.8411169, 0.5951164, 1.418765, 0.8784314, 0, 1, 1,
0.8455544, -0.5293415, 1.799715, 0.8823529, 0, 1, 1,
0.8471342, 0.9851326, 0.4461016, 0.8901961, 0, 1, 1,
0.8486457, 0.3410814, 0.4692338, 0.8941177, 0, 1, 1,
0.8623416, 0.2595819, 3.180396, 0.9019608, 0, 1, 1,
0.866888, -0.6331862, 2.482159, 0.9098039, 0, 1, 1,
0.8737271, -0.3391675, 2.052038, 0.9137255, 0, 1, 1,
0.8741146, -0.7339303, 0.8520424, 0.9215686, 0, 1, 1,
0.8748546, 0.3089096, 2.910081, 0.9254902, 0, 1, 1,
0.8847452, -0.1058094, 1.421566, 0.9333333, 0, 1, 1,
0.8884742, -1.394013, 3.241966, 0.9372549, 0, 1, 1,
0.8900807, 0.1071626, 1.264084, 0.945098, 0, 1, 1,
0.8913525, 1.686842, 1.037661, 0.9490196, 0, 1, 1,
0.8916148, 1.356889, -1.154023, 0.9568627, 0, 1, 1,
0.8946921, -1.207916, 1.685636, 0.9607843, 0, 1, 1,
0.898973, -0.5815653, 2.336974, 0.9686275, 0, 1, 1,
0.9057564, -1.015608, 1.371153, 0.972549, 0, 1, 1,
0.9080958, 0.2759627, 0.9779435, 0.9803922, 0, 1, 1,
0.9085046, -0.1114626, 2.380569, 0.9843137, 0, 1, 1,
0.9102112, 1.466552, 0.9425632, 0.9921569, 0, 1, 1,
0.9123879, -1.620886, 3.279904, 0.9960784, 0, 1, 1,
0.9212296, 0.8772588, 1.798291, 1, 0, 0.9960784, 1,
0.9225661, 0.1155127, 1.844548, 1, 0, 0.9882353, 1,
0.9243278, 2.517516, 1.189263, 1, 0, 0.9843137, 1,
0.9269254, -0.9013633, 2.657716, 1, 0, 0.9764706, 1,
0.9306747, -0.05642493, 1.470031, 1, 0, 0.972549, 1,
0.9313999, 1.296087, 0.6004559, 1, 0, 0.9647059, 1,
0.931621, 0.498978, 0.2717041, 1, 0, 0.9607843, 1,
0.9320403, -0.1989312, 4.527312, 1, 0, 0.9529412, 1,
0.9346985, 0.4976358, 0.7262985, 1, 0, 0.9490196, 1,
0.9378632, -0.3158576, 3.388719, 1, 0, 0.9411765, 1,
0.9387764, -0.2676675, 2.378462, 1, 0, 0.9372549, 1,
0.9416256, -0.05023124, 3.691868, 1, 0, 0.9294118, 1,
0.9417443, 1.571775, -0.7507431, 1, 0, 0.9254902, 1,
0.9431084, 1.250049, 0.1147232, 1, 0, 0.9176471, 1,
0.9630342, -0.4961835, 2.365592, 1, 0, 0.9137255, 1,
0.9677966, -0.5318847, 2.540299, 1, 0, 0.9058824, 1,
0.9839647, 0.7840609, 0.09753517, 1, 0, 0.9019608, 1,
0.984313, -1.063712, 1.316807, 1, 0, 0.8941177, 1,
0.9853207, -0.5781353, 1.146276, 1, 0, 0.8862745, 1,
0.9907534, 1.805565, 0.8604401, 1, 0, 0.8823529, 1,
1.007861, -0.5618208, 1.463296, 1, 0, 0.8745098, 1,
1.014203, 0.5349343, 2.482723, 1, 0, 0.8705882, 1,
1.016038, 1.134948, -0.2577028, 1, 0, 0.8627451, 1,
1.016739, -1.956635, 3.785911, 1, 0, 0.8588235, 1,
1.01739, 0.01960273, 1.176486, 1, 0, 0.8509804, 1,
1.018248, -1.203361, 1.703428, 1, 0, 0.8470588, 1,
1.026526, -1.084721, 2.93525, 1, 0, 0.8392157, 1,
1.029029, 0.2266323, 0.9768904, 1, 0, 0.8352941, 1,
1.032728, 1.408611, 0.5541191, 1, 0, 0.827451, 1,
1.034326, 1.521612, 0.531058, 1, 0, 0.8235294, 1,
1.034567, 0.4280536, 2.425917, 1, 0, 0.8156863, 1,
1.039612, 1.108602, 0.4186183, 1, 0, 0.8117647, 1,
1.041696, 1.521834, 0.7107396, 1, 0, 0.8039216, 1,
1.043955, 0.8562775, 1.451195, 1, 0, 0.7960784, 1,
1.04511, 0.7892102, 0.2324092, 1, 0, 0.7921569, 1,
1.05082, 1.185889, 1.478656, 1, 0, 0.7843137, 1,
1.056881, 0.2293464, 2.410395, 1, 0, 0.7803922, 1,
1.060646, 0.2711464, 3.089574, 1, 0, 0.772549, 1,
1.064735, -0.6942511, 2.386, 1, 0, 0.7686275, 1,
1.066167, 0.7862695, 1.285695, 1, 0, 0.7607843, 1,
1.080239, -1.713759, 3.390214, 1, 0, 0.7568628, 1,
1.090791, 1.841511, 1.244277, 1, 0, 0.7490196, 1,
1.094881, 2.025406, -0.08200866, 1, 0, 0.7450981, 1,
1.097403, 0.3094629, 2.679916, 1, 0, 0.7372549, 1,
1.099678, -0.04749285, 1.454609, 1, 0, 0.7333333, 1,
1.099751, -0.6254475, 1.800287, 1, 0, 0.7254902, 1,
1.101974, 1.278467, 1.010387, 1, 0, 0.7215686, 1,
1.105163, 0.02628506, 1.867026, 1, 0, 0.7137255, 1,
1.11318, 0.6491404, 1.057932, 1, 0, 0.7098039, 1,
1.117769, 0.08552679, 2.611527, 1, 0, 0.7019608, 1,
1.119305, -1.126674, 1.752191, 1, 0, 0.6941177, 1,
1.138382, -1.879523, 1.60997, 1, 0, 0.6901961, 1,
1.139757, 1.841686, 1.307838, 1, 0, 0.682353, 1,
1.144659, -1.691284, 1.393647, 1, 0, 0.6784314, 1,
1.145568, 0.07797855, 0.3520305, 1, 0, 0.6705883, 1,
1.147614, 0.7075187, -0.7000524, 1, 0, 0.6666667, 1,
1.156159, 1.00107, 1.631283, 1, 0, 0.6588235, 1,
1.158332, 0.5928802, 0.9329723, 1, 0, 0.654902, 1,
1.168886, -0.1268857, 0.6778926, 1, 0, 0.6470588, 1,
1.184155, 0.4403866, -0.170568, 1, 0, 0.6431373, 1,
1.195739, -1.413018, 2.109101, 1, 0, 0.6352941, 1,
1.200974, -0.5062516, 1.238091, 1, 0, 0.6313726, 1,
1.204472, -0.6236138, 3.049995, 1, 0, 0.6235294, 1,
1.206401, -0.0964404, 0.4412785, 1, 0, 0.6196079, 1,
1.210941, 1.811566, 0.3769656, 1, 0, 0.6117647, 1,
1.211004, -1.280334, 3.503865, 1, 0, 0.6078432, 1,
1.219324, -0.9737426, 3.242898, 1, 0, 0.6, 1,
1.228673, -1.498617, 1.82613, 1, 0, 0.5921569, 1,
1.233776, 0.834403, 0.667133, 1, 0, 0.5882353, 1,
1.236725, -1.277444, 3.483362, 1, 0, 0.5803922, 1,
1.237274, 0.2004793, 2.14756, 1, 0, 0.5764706, 1,
1.240376, -0.5146685, 1.498009, 1, 0, 0.5686275, 1,
1.242228, -0.1198115, 1.592841, 1, 0, 0.5647059, 1,
1.248128, -0.847192, 1.15894, 1, 0, 0.5568628, 1,
1.251534, 0.5620869, 1.795656, 1, 0, 0.5529412, 1,
1.265408, 0.3663486, 1.36213, 1, 0, 0.5450981, 1,
1.282815, 0.2078568, 0.976369, 1, 0, 0.5411765, 1,
1.291715, -0.5532404, 1.683945, 1, 0, 0.5333334, 1,
1.293647, -0.7823171, 3.0847, 1, 0, 0.5294118, 1,
1.314522, 1.676593, 0.02795777, 1, 0, 0.5215687, 1,
1.316837, 0.3980957, 2.128249, 1, 0, 0.5176471, 1,
1.32071, -0.5366017, 1.645885, 1, 0, 0.509804, 1,
1.322071, -0.3365922, -0.8158546, 1, 0, 0.5058824, 1,
1.323151, -0.4341149, 0.8028502, 1, 0, 0.4980392, 1,
1.326873, 0.605705, 2.220744, 1, 0, 0.4901961, 1,
1.332495, 2.503124, -1.090182, 1, 0, 0.4862745, 1,
1.342335, -0.6838435, 2.965599, 1, 0, 0.4784314, 1,
1.345492, 1.635811, 0.5842652, 1, 0, 0.4745098, 1,
1.346224, -3.065689, 3.055726, 1, 0, 0.4666667, 1,
1.347987, -0.01349698, 2.101213, 1, 0, 0.4627451, 1,
1.351076, 0.5032591, 1.23406, 1, 0, 0.454902, 1,
1.354661, 1.061198, 1.839335, 1, 0, 0.4509804, 1,
1.368437, -1.416913, 2.294543, 1, 0, 0.4431373, 1,
1.371407, 0.002600006, 2.469154, 1, 0, 0.4392157, 1,
1.389914, 0.1499503, 1.994614, 1, 0, 0.4313726, 1,
1.391075, -0.1270116, 0.6870376, 1, 0, 0.427451, 1,
1.402037, -1.606731, 3.697212, 1, 0, 0.4196078, 1,
1.405918, -2.004035, 1.046368, 1, 0, 0.4156863, 1,
1.408489, -1.216728, 2.297863, 1, 0, 0.4078431, 1,
1.433478, -0.9328788, 2.390583, 1, 0, 0.4039216, 1,
1.436126, -1.465553, 0.5951524, 1, 0, 0.3960784, 1,
1.447913, 0.8425657, 0.6088522, 1, 0, 0.3882353, 1,
1.449514, -1.361987, 0.6919962, 1, 0, 0.3843137, 1,
1.4687, 0.7522158, -0.474127, 1, 0, 0.3764706, 1,
1.501055, 2.03059, 0.7519228, 1, 0, 0.372549, 1,
1.503227, 0.713633, 0.1070748, 1, 0, 0.3647059, 1,
1.505173, 0.7202925, 2.302554, 1, 0, 0.3607843, 1,
1.506999, 0.8234848, -0.6415262, 1, 0, 0.3529412, 1,
1.509173, 0.7987179, 0.7655429, 1, 0, 0.3490196, 1,
1.511754, -0.1167715, 2.521899, 1, 0, 0.3411765, 1,
1.554152, 0.3108668, 2.146114, 1, 0, 0.3372549, 1,
1.569816, -0.03755344, 2.789868, 1, 0, 0.3294118, 1,
1.571869, 0.4088087, 1.15668, 1, 0, 0.3254902, 1,
1.577325, 0.006722206, 3.195355, 1, 0, 0.3176471, 1,
1.587749, 0.2588293, 1.056588, 1, 0, 0.3137255, 1,
1.592245, 0.3406226, 0.6724178, 1, 0, 0.3058824, 1,
1.656332, -0.01274492, 1.400473, 1, 0, 0.2980392, 1,
1.674727, 0.2148215, 1.309121, 1, 0, 0.2941177, 1,
1.675567, -1.435931, 1.278609, 1, 0, 0.2862745, 1,
1.696324, 0.2838666, 2.691226, 1, 0, 0.282353, 1,
1.700699, -1.001127, 0.2080238, 1, 0, 0.2745098, 1,
1.719756, 1.074962, -0.1988675, 1, 0, 0.2705882, 1,
1.722357, 0.2252102, 0.6931045, 1, 0, 0.2627451, 1,
1.729095, 1.224922, 0.7648942, 1, 0, 0.2588235, 1,
1.741194, 1.910508, 0.8407247, 1, 0, 0.2509804, 1,
1.793499, 0.1780749, 1.703588, 1, 0, 0.2470588, 1,
1.803684, -0.1451306, -0.1209255, 1, 0, 0.2392157, 1,
1.805175, -0.5436279, 1.851421, 1, 0, 0.2352941, 1,
1.806739, -0.3073255, 1.99079, 1, 0, 0.227451, 1,
1.852949, -0.128547, 1.435698, 1, 0, 0.2235294, 1,
1.872254, -1.55338, 3.181338, 1, 0, 0.2156863, 1,
1.872762, 1.639647, 1.758849, 1, 0, 0.2117647, 1,
1.911073, 1.382044, 0.7802745, 1, 0, 0.2039216, 1,
1.943002, -1.10436, 2.407426, 1, 0, 0.1960784, 1,
1.953794, -0.463197, 2.113045, 1, 0, 0.1921569, 1,
1.964743, 1.276084, -0.545723, 1, 0, 0.1843137, 1,
1.965563, -0.5836532, 3.295773, 1, 0, 0.1803922, 1,
2.042942, -0.6190625, 3.697109, 1, 0, 0.172549, 1,
2.064076, -0.5196293, 2.029262, 1, 0, 0.1686275, 1,
2.079059, -0.3222778, 0.6896433, 1, 0, 0.1607843, 1,
2.097554, 0.9528385, 0.1519819, 1, 0, 0.1568628, 1,
2.097774, -1.676614, 1.178617, 1, 0, 0.1490196, 1,
2.13877, 0.5782355, 1.587272, 1, 0, 0.145098, 1,
2.164743, -0.3014369, 1.901814, 1, 0, 0.1372549, 1,
2.16521, 0.5729299, 1.301181, 1, 0, 0.1333333, 1,
2.169798, 0.3575118, 0.3506677, 1, 0, 0.1254902, 1,
2.21869, 1.907708, 0.5209899, 1, 0, 0.1215686, 1,
2.236964, -0.5192912, -0.1781074, 1, 0, 0.1137255, 1,
2.253752, -0.2150467, 1.915013, 1, 0, 0.1098039, 1,
2.261943, 0.5553275, 1.006946, 1, 0, 0.1019608, 1,
2.305469, 1.434515, 1.082022, 1, 0, 0.09411765, 1,
2.314561, -1.371269, 1.747217, 1, 0, 0.09019608, 1,
2.325848, -1.294668, 1.044836, 1, 0, 0.08235294, 1,
2.353349, 0.05437267, 4.233696, 1, 0, 0.07843138, 1,
2.369006, 1.46002, 0.9451346, 1, 0, 0.07058824, 1,
2.410823, 2.277818, 1.60411, 1, 0, 0.06666667, 1,
2.412563, 0.3100808, 1.179924, 1, 0, 0.05882353, 1,
2.421112, -0.4019267, 1.075498, 1, 0, 0.05490196, 1,
2.463255, 0.9655112, 0.2156851, 1, 0, 0.04705882, 1,
2.505118, 0.6280749, 1.978185, 1, 0, 0.04313726, 1,
2.585801, 0.9342623, 1.082215, 1, 0, 0.03529412, 1,
2.589478, 0.5275661, 1.587466, 1, 0, 0.03137255, 1,
2.611255, 0.9673614, 1.381445, 1, 0, 0.02352941, 1,
2.648742, 1.171153, 2.168724, 1, 0, 0.01960784, 1,
2.687373, 0.286432, 2.344264, 1, 0, 0.01176471, 1,
2.886374, -0.4552582, -0.2072566, 1, 0, 0.007843138, 1
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
-0.319141, -4.229319, -6.828261, 0, -0.5, 0.5, 0.5,
-0.319141, -4.229319, -6.828261, 1, -0.5, 0.5, 0.5,
-0.319141, -4.229319, -6.828261, 1, 1.5, 0.5, 0.5,
-0.319141, -4.229319, -6.828261, 0, 1.5, 0.5, 0.5
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
-4.611325, 0.3668456, -6.828261, 0, -0.5, 0.5, 0.5,
-4.611325, 0.3668456, -6.828261, 1, -0.5, 0.5, 0.5,
-4.611325, 0.3668456, -6.828261, 1, 1.5, 0.5, 0.5,
-4.611325, 0.3668456, -6.828261, 0, 1.5, 0.5, 0.5
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
-4.611325, -4.229319, 0.135679, 0, -0.5, 0.5, 0.5,
-4.611325, -4.229319, 0.135679, 1, -0.5, 0.5, 0.5,
-4.611325, -4.229319, 0.135679, 1, 1.5, 0.5, 0.5,
-4.611325, -4.229319, 0.135679, 0, 1.5, 0.5, 0.5
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
-3, -3.168665, -5.221198,
2, -3.168665, -5.221198,
-3, -3.168665, -5.221198,
-3, -3.345441, -5.489042,
-2, -3.168665, -5.221198,
-2, -3.345441, -5.489042,
-1, -3.168665, -5.221198,
-1, -3.345441, -5.489042,
0, -3.168665, -5.221198,
0, -3.345441, -5.489042,
1, -3.168665, -5.221198,
1, -3.345441, -5.489042,
2, -3.168665, -5.221198,
2, -3.345441, -5.489042
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
-3, -3.698992, -6.024729, 0, -0.5, 0.5, 0.5,
-3, -3.698992, -6.024729, 1, -0.5, 0.5, 0.5,
-3, -3.698992, -6.024729, 1, 1.5, 0.5, 0.5,
-3, -3.698992, -6.024729, 0, 1.5, 0.5, 0.5,
-2, -3.698992, -6.024729, 0, -0.5, 0.5, 0.5,
-2, -3.698992, -6.024729, 1, -0.5, 0.5, 0.5,
-2, -3.698992, -6.024729, 1, 1.5, 0.5, 0.5,
-2, -3.698992, -6.024729, 0, 1.5, 0.5, 0.5,
-1, -3.698992, -6.024729, 0, -0.5, 0.5, 0.5,
-1, -3.698992, -6.024729, 1, -0.5, 0.5, 0.5,
-1, -3.698992, -6.024729, 1, 1.5, 0.5, 0.5,
-1, -3.698992, -6.024729, 0, 1.5, 0.5, 0.5,
0, -3.698992, -6.024729, 0, -0.5, 0.5, 0.5,
0, -3.698992, -6.024729, 1, -0.5, 0.5, 0.5,
0, -3.698992, -6.024729, 1, 1.5, 0.5, 0.5,
0, -3.698992, -6.024729, 0, 1.5, 0.5, 0.5,
1, -3.698992, -6.024729, 0, -0.5, 0.5, 0.5,
1, -3.698992, -6.024729, 1, -0.5, 0.5, 0.5,
1, -3.698992, -6.024729, 1, 1.5, 0.5, 0.5,
1, -3.698992, -6.024729, 0, 1.5, 0.5, 0.5,
2, -3.698992, -6.024729, 0, -0.5, 0.5, 0.5,
2, -3.698992, -6.024729, 1, -0.5, 0.5, 0.5,
2, -3.698992, -6.024729, 1, 1.5, 0.5, 0.5,
2, -3.698992, -6.024729, 0, 1.5, 0.5, 0.5
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
-3.620821, -3, -5.221198,
-3.620821, 3, -5.221198,
-3.620821, -3, -5.221198,
-3.785905, -3, -5.489042,
-3.620821, -2, -5.221198,
-3.785905, -2, -5.489042,
-3.620821, -1, -5.221198,
-3.785905, -1, -5.489042,
-3.620821, 0, -5.221198,
-3.785905, 0, -5.489042,
-3.620821, 1, -5.221198,
-3.785905, 1, -5.489042,
-3.620821, 2, -5.221198,
-3.785905, 2, -5.489042,
-3.620821, 3, -5.221198,
-3.785905, 3, -5.489042
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
-4.116073, -3, -6.024729, 0, -0.5, 0.5, 0.5,
-4.116073, -3, -6.024729, 1, -0.5, 0.5, 0.5,
-4.116073, -3, -6.024729, 1, 1.5, 0.5, 0.5,
-4.116073, -3, -6.024729, 0, 1.5, 0.5, 0.5,
-4.116073, -2, -6.024729, 0, -0.5, 0.5, 0.5,
-4.116073, -2, -6.024729, 1, -0.5, 0.5, 0.5,
-4.116073, -2, -6.024729, 1, 1.5, 0.5, 0.5,
-4.116073, -2, -6.024729, 0, 1.5, 0.5, 0.5,
-4.116073, -1, -6.024729, 0, -0.5, 0.5, 0.5,
-4.116073, -1, -6.024729, 1, -0.5, 0.5, 0.5,
-4.116073, -1, -6.024729, 1, 1.5, 0.5, 0.5,
-4.116073, -1, -6.024729, 0, 1.5, 0.5, 0.5,
-4.116073, 0, -6.024729, 0, -0.5, 0.5, 0.5,
-4.116073, 0, -6.024729, 1, -0.5, 0.5, 0.5,
-4.116073, 0, -6.024729, 1, 1.5, 0.5, 0.5,
-4.116073, 0, -6.024729, 0, 1.5, 0.5, 0.5,
-4.116073, 1, -6.024729, 0, -0.5, 0.5, 0.5,
-4.116073, 1, -6.024729, 1, -0.5, 0.5, 0.5,
-4.116073, 1, -6.024729, 1, 1.5, 0.5, 0.5,
-4.116073, 1, -6.024729, 0, 1.5, 0.5, 0.5,
-4.116073, 2, -6.024729, 0, -0.5, 0.5, 0.5,
-4.116073, 2, -6.024729, 1, -0.5, 0.5, 0.5,
-4.116073, 2, -6.024729, 1, 1.5, 0.5, 0.5,
-4.116073, 2, -6.024729, 0, 1.5, 0.5, 0.5,
-4.116073, 3, -6.024729, 0, -0.5, 0.5, 0.5,
-4.116073, 3, -6.024729, 1, -0.5, 0.5, 0.5,
-4.116073, 3, -6.024729, 1, 1.5, 0.5, 0.5,
-4.116073, 3, -6.024729, 0, 1.5, 0.5, 0.5
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
-3.620821, -3.168665, -4,
-3.620821, -3.168665, 4,
-3.620821, -3.168665, -4,
-3.785905, -3.345441, -4,
-3.620821, -3.168665, -2,
-3.785905, -3.345441, -2,
-3.620821, -3.168665, 0,
-3.785905, -3.345441, 0,
-3.620821, -3.168665, 2,
-3.785905, -3.345441, 2,
-3.620821, -3.168665, 4,
-3.785905, -3.345441, 4
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
-4.116073, -3.698992, -4, 0, -0.5, 0.5, 0.5,
-4.116073, -3.698992, -4, 1, -0.5, 0.5, 0.5,
-4.116073, -3.698992, -4, 1, 1.5, 0.5, 0.5,
-4.116073, -3.698992, -4, 0, 1.5, 0.5, 0.5,
-4.116073, -3.698992, -2, 0, -0.5, 0.5, 0.5,
-4.116073, -3.698992, -2, 1, -0.5, 0.5, 0.5,
-4.116073, -3.698992, -2, 1, 1.5, 0.5, 0.5,
-4.116073, -3.698992, -2, 0, 1.5, 0.5, 0.5,
-4.116073, -3.698992, 0, 0, -0.5, 0.5, 0.5,
-4.116073, -3.698992, 0, 1, -0.5, 0.5, 0.5,
-4.116073, -3.698992, 0, 1, 1.5, 0.5, 0.5,
-4.116073, -3.698992, 0, 0, 1.5, 0.5, 0.5,
-4.116073, -3.698992, 2, 0, -0.5, 0.5, 0.5,
-4.116073, -3.698992, 2, 1, -0.5, 0.5, 0.5,
-4.116073, -3.698992, 2, 1, 1.5, 0.5, 0.5,
-4.116073, -3.698992, 2, 0, 1.5, 0.5, 0.5,
-4.116073, -3.698992, 4, 0, -0.5, 0.5, 0.5,
-4.116073, -3.698992, 4, 1, -0.5, 0.5, 0.5,
-4.116073, -3.698992, 4, 1, 1.5, 0.5, 0.5,
-4.116073, -3.698992, 4, 0, 1.5, 0.5, 0.5
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
-3.620821, -3.168665, -5.221198,
-3.620821, 3.902357, -5.221198,
-3.620821, -3.168665, 5.492556,
-3.620821, 3.902357, 5.492556,
-3.620821, -3.168665, -5.221198,
-3.620821, -3.168665, 5.492556,
-3.620821, 3.902357, -5.221198,
-3.620821, 3.902357, 5.492556,
-3.620821, -3.168665, -5.221198,
2.982539, -3.168665, -5.221198,
-3.620821, -3.168665, 5.492556,
2.982539, -3.168665, 5.492556,
-3.620821, 3.902357, -5.221198,
2.982539, 3.902357, -5.221198,
-3.620821, 3.902357, 5.492556,
2.982539, 3.902357, 5.492556,
2.982539, -3.168665, -5.221198,
2.982539, 3.902357, -5.221198,
2.982539, -3.168665, 5.492556,
2.982539, 3.902357, 5.492556,
2.982539, -3.168665, -5.221198,
2.982539, -3.168665, 5.492556,
2.982539, 3.902357, -5.221198,
2.982539, 3.902357, 5.492556
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
var radius = 7.708361;
var distance = 34.29537;
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
mvMatrix.translate( 0.319141, -0.3668456, -0.135679 );
mvMatrix.scale( 1.26215, 1.178674, 0.7779189 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.29537);
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
silafluofen<-read.table("silafluofen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-silafluofen$V2
```

```
## Error in eval(expr, envir, enclos): object 'silafluofen' not found
```

```r
y<-silafluofen$V3
```

```
## Error in eval(expr, envir, enclos): object 'silafluofen' not found
```

```r
z<-silafluofen$V4
```

```
## Error in eval(expr, envir, enclos): object 'silafluofen' not found
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
-3.524656, -0.1738892, -0.5104849, 0, 0, 1, 1, 1,
-2.737947, 1.180583, -0.731832, 1, 0, 0, 1, 1,
-2.596162, -0.87338, -2.152965, 1, 0, 0, 1, 1,
-2.577188, 0.2741314, -3.135594, 1, 0, 0, 1, 1,
-2.447364, -2.098087, -2.031777, 1, 0, 0, 1, 1,
-2.355912, 1.234624, -2.416104, 1, 0, 0, 1, 1,
-2.309672, 0.9964556, -1.513062, 0, 0, 0, 1, 1,
-2.289526, 0.6805789, -2.214597, 0, 0, 0, 1, 1,
-2.265327, 1.106159, -0.1897349, 0, 0, 0, 1, 1,
-2.254603, 0.8654893, -1.221166, 0, 0, 0, 1, 1,
-2.247518, -1.441288, -1.987717, 0, 0, 0, 1, 1,
-2.238119, 0.4076692, -0.3767828, 0, 0, 0, 1, 1,
-2.228598, -0.229092, 0.4347523, 0, 0, 0, 1, 1,
-2.197588, -0.1890214, -0.3804657, 1, 1, 1, 1, 1,
-2.195722, -0.9258491, -1.059918, 1, 1, 1, 1, 1,
-2.186522, -0.9930317, -1.990048, 1, 1, 1, 1, 1,
-2.145887, 1.837978, 0.1108944, 1, 1, 1, 1, 1,
-2.134878, 1.115764, -0.2250026, 1, 1, 1, 1, 1,
-2.129422, -0.3639402, -2.825931, 1, 1, 1, 1, 1,
-2.126411, 1.939391, 0.2992373, 1, 1, 1, 1, 1,
-2.115961, -0.01054274, -1.970322, 1, 1, 1, 1, 1,
-2.085888, 0.1514949, -0.1261907, 1, 1, 1, 1, 1,
-2.075705, -0.9031897, -1.29255, 1, 1, 1, 1, 1,
-2.059633, 0.4022552, -0.3166078, 1, 1, 1, 1, 1,
-2.040843, -0.3086442, -1.565174, 1, 1, 1, 1, 1,
-2.024439, 0.367871, -0.9281043, 1, 1, 1, 1, 1,
-1.993688, 0.02186723, -0.04071465, 1, 1, 1, 1, 1,
-1.985833, 2.169979, 0.1354747, 1, 1, 1, 1, 1,
-1.982982, 1.452443, -1.14644, 0, 0, 1, 1, 1,
-1.98105, -0.1527612, -1.217481, 1, 0, 0, 1, 1,
-1.971477, 0.2031075, -0.8839009, 1, 0, 0, 1, 1,
-1.955549, 1.082941, -0.07645128, 1, 0, 0, 1, 1,
-1.945255, -0.7533231, -1.185378, 1, 0, 0, 1, 1,
-1.944403, 1.640744, -0.8302317, 1, 0, 0, 1, 1,
-1.929078, -0.2926751, 0.2184927, 0, 0, 0, 1, 1,
-1.922681, 1.648316, -1.51458, 0, 0, 0, 1, 1,
-1.912341, 0.3287354, -2.46617, 0, 0, 0, 1, 1,
-1.902051, 0.1534287, -0.6225299, 0, 0, 0, 1, 1,
-1.879758, 0.3955522, -2.221836, 0, 0, 0, 1, 1,
-1.862471, 0.8468428, -0.7325469, 0, 0, 0, 1, 1,
-1.859127, 0.8890101, -1.853284, 0, 0, 0, 1, 1,
-1.834337, 0.5947733, -2.649037, 1, 1, 1, 1, 1,
-1.831835, -1.02228, -1.426099, 1, 1, 1, 1, 1,
-1.811253, 0.3218988, -1.964532, 1, 1, 1, 1, 1,
-1.811218, -1.369732, -3.187492, 1, 1, 1, 1, 1,
-1.798038, 0.4357474, -1.775385, 1, 1, 1, 1, 1,
-1.790778, -0.2328383, -1.819259, 1, 1, 1, 1, 1,
-1.785727, 0.3679396, -1.673548, 1, 1, 1, 1, 1,
-1.784367, -0.6247905, -2.378902, 1, 1, 1, 1, 1,
-1.783117, 0.2927244, -0.9354731, 1, 1, 1, 1, 1,
-1.783062, 0.03001726, -1.092524, 1, 1, 1, 1, 1,
-1.773419, 0.2506571, -1.059625, 1, 1, 1, 1, 1,
-1.759113, 0.8221503, -1.105346, 1, 1, 1, 1, 1,
-1.757966, -0.09744794, -1.915632, 1, 1, 1, 1, 1,
-1.731786, -0.387352, -2.33541, 1, 1, 1, 1, 1,
-1.721017, -1.675915, -0.2170809, 1, 1, 1, 1, 1,
-1.720875, 0.718585, -0.5215847, 0, 0, 1, 1, 1,
-1.701263, 0.975509, 0.2117202, 1, 0, 0, 1, 1,
-1.667648, -0.9420462, -2.786341, 1, 0, 0, 1, 1,
-1.653856, -0.9903522, -1.352874, 1, 0, 0, 1, 1,
-1.653216, 1.612865, 0.607344, 1, 0, 0, 1, 1,
-1.639716, 0.2077005, 0.2649578, 1, 0, 0, 1, 1,
-1.622595, 1.122267, -2.266927, 0, 0, 0, 1, 1,
-1.617572, 0.6734836, -1.216383, 0, 0, 0, 1, 1,
-1.605673, -0.4504284, -3.501868, 0, 0, 0, 1, 1,
-1.600759, 0.3329534, -1.818519, 0, 0, 0, 1, 1,
-1.591139, 0.1129749, -2.713777, 0, 0, 0, 1, 1,
-1.582372, -0.1759652, -2.93896, 0, 0, 0, 1, 1,
-1.582079, -0.5742598, -1.294326, 0, 0, 0, 1, 1,
-1.581972, 0.2097201, 0.02917276, 1, 1, 1, 1, 1,
-1.577527, -0.148249, -1.888844, 1, 1, 1, 1, 1,
-1.573504, 1.374212, -0.2431021, 1, 1, 1, 1, 1,
-1.570512, -0.9067519, -2.024873, 1, 1, 1, 1, 1,
-1.568225, 0.8710271, -0.9809231, 1, 1, 1, 1, 1,
-1.567984, -0.1212718, -1.865225, 1, 1, 1, 1, 1,
-1.55594, 0.2826479, -1.61126, 1, 1, 1, 1, 1,
-1.5502, -0.7301195, -3.607367, 1, 1, 1, 1, 1,
-1.543942, 0.9902589, -0.4091679, 1, 1, 1, 1, 1,
-1.529056, 2.516617, -0.05384705, 1, 1, 1, 1, 1,
-1.526392, -0.2756871, -2.324513, 1, 1, 1, 1, 1,
-1.523722, 0.4787899, -0.5015705, 1, 1, 1, 1, 1,
-1.516833, -0.27014, -1.158125, 1, 1, 1, 1, 1,
-1.51007, 0.3226282, -2.152486, 1, 1, 1, 1, 1,
-1.507024, 1.448311, -2.227155, 1, 1, 1, 1, 1,
-1.501531, -2.442696, -2.236966, 0, 0, 1, 1, 1,
-1.499474, 0.9959438, -0.9581037, 1, 0, 0, 1, 1,
-1.486229, -2.864882, -2.540208, 1, 0, 0, 1, 1,
-1.472616, -0.9827353, -1.506978, 1, 0, 0, 1, 1,
-1.453853, -1.569999, -1.619843, 1, 0, 0, 1, 1,
-1.451902, -0.8444504, -1.363192, 1, 0, 0, 1, 1,
-1.448831, -0.1765781, -2.019835, 0, 0, 0, 1, 1,
-1.448635, 1.114043, -0.3547464, 0, 0, 0, 1, 1,
-1.44571, 0.6911153, 0.819093, 0, 0, 0, 1, 1,
-1.428832, -0.2141506, -2.843174, 0, 0, 0, 1, 1,
-1.426383, 1.486727, -2.255014, 0, 0, 0, 1, 1,
-1.426013, 0.8905792, -0.4027306, 0, 0, 0, 1, 1,
-1.413578, -1.800669, -2.592064, 0, 0, 0, 1, 1,
-1.409602, 0.3522771, -0.3302491, 1, 1, 1, 1, 1,
-1.406119, 2.979115, 0.03613907, 1, 1, 1, 1, 1,
-1.395954, -0.7997307, -2.092947, 1, 1, 1, 1, 1,
-1.380819, 0.6654967, -3.042147, 1, 1, 1, 1, 1,
-1.379883, -1.003226, -4.024738, 1, 1, 1, 1, 1,
-1.376167, -0.04023663, 0.2989235, 1, 1, 1, 1, 1,
-1.374964, 0.397144, -1.478699, 1, 1, 1, 1, 1,
-1.369225, 1.003397, -0.7029392, 1, 1, 1, 1, 1,
-1.36742, -0.06245993, -1.081283, 1, 1, 1, 1, 1,
-1.365094, -0.7809287, -3.196482, 1, 1, 1, 1, 1,
-1.353263, -1.522243, -2.425195, 1, 1, 1, 1, 1,
-1.351605, -0.5917555, -1.904667, 1, 1, 1, 1, 1,
-1.345275, -1.310281, -1.693329, 1, 1, 1, 1, 1,
-1.34417, 1.037081, -0.7788149, 1, 1, 1, 1, 1,
-1.342445, 1.408413, 0.8601621, 1, 1, 1, 1, 1,
-1.319413, 1.999814, 0.3374144, 0, 0, 1, 1, 1,
-1.310608, 0.6157207, -1.516424, 1, 0, 0, 1, 1,
-1.294029, 2.256384, -0.4430524, 1, 0, 0, 1, 1,
-1.291803, 0.07131076, -1.927686, 1, 0, 0, 1, 1,
-1.287602, -0.4406645, -2.499271, 1, 0, 0, 1, 1,
-1.283593, -0.1197399, -2.380522, 1, 0, 0, 1, 1,
-1.281986, -0.02089646, -0.2622275, 0, 0, 0, 1, 1,
-1.281576, -0.8977306, -3.344825, 0, 0, 0, 1, 1,
-1.280998, -2.195862, -4.238986, 0, 0, 0, 1, 1,
-1.279668, -1.489509, -2.640333, 0, 0, 0, 1, 1,
-1.275987, -0.816554, -2.434115, 0, 0, 0, 1, 1,
-1.269438, -1.089126, -2.227858, 0, 0, 0, 1, 1,
-1.263061, 1.038965, 1.022044, 0, 0, 0, 1, 1,
-1.258613, 0.9375161, -0.3267633, 1, 1, 1, 1, 1,
-1.252231, 1.203631, -1.726598, 1, 1, 1, 1, 1,
-1.25155, -0.5078071, -3.393146, 1, 1, 1, 1, 1,
-1.250944, 0.1664567, -0.5675846, 1, 1, 1, 1, 1,
-1.243151, 0.5636231, -1.809839, 1, 1, 1, 1, 1,
-1.231415, -0.2525469, -2.770858, 1, 1, 1, 1, 1,
-1.215986, 0.2438437, -2.534303, 1, 1, 1, 1, 1,
-1.214, 0.3743835, -1.766824, 1, 1, 1, 1, 1,
-1.210333, 0.1005688, -1.384904, 1, 1, 1, 1, 1,
-1.208354, -1.570426, -3.542514, 1, 1, 1, 1, 1,
-1.204805, -1.173383, -1.435767, 1, 1, 1, 1, 1,
-1.204331, -0.1231117, -0.3393432, 1, 1, 1, 1, 1,
-1.201261, -0.3197477, -1.946664, 1, 1, 1, 1, 1,
-1.195279, -0.4601594, -1.673476, 1, 1, 1, 1, 1,
-1.188661, -0.7531961, -3.414556, 1, 1, 1, 1, 1,
-1.188354, 2.078589, 0.4396265, 0, 0, 1, 1, 1,
-1.183066, -0.3717286, -1.960663, 1, 0, 0, 1, 1,
-1.182847, 0.2722031, -0.7764556, 1, 0, 0, 1, 1,
-1.164907, 0.4725338, -1.059756, 1, 0, 0, 1, 1,
-1.160431, -0.005766823, -0.9512803, 1, 0, 0, 1, 1,
-1.157791, -0.7004756, -2.911478, 1, 0, 0, 1, 1,
-1.150545, 0.5539008, -1.873645, 0, 0, 0, 1, 1,
-1.149775, -0.1797394, -2.269214, 0, 0, 0, 1, 1,
-1.144862, 0.01093827, 0.1179469, 0, 0, 0, 1, 1,
-1.140529, -0.2116732, -1.766986, 0, 0, 0, 1, 1,
-1.137413, -0.9996812, -4.193249, 0, 0, 0, 1, 1,
-1.134491, 0.601909, -3.069822, 0, 0, 0, 1, 1,
-1.132981, 0.5220091, -0.8186904, 0, 0, 0, 1, 1,
-1.132577, -0.6931916, -2.975369, 1, 1, 1, 1, 1,
-1.129391, -2.03986, -3.418271, 1, 1, 1, 1, 1,
-1.12338, 0.9841551, -0.2894045, 1, 1, 1, 1, 1,
-1.122105, -0.264939, -2.085815, 1, 1, 1, 1, 1,
-1.118795, -1.474148, -2.221096, 1, 1, 1, 1, 1,
-1.118756, 0.05592886, -2.074068, 1, 1, 1, 1, 1,
-1.116678, -0.9765984, -1.734869, 1, 1, 1, 1, 1,
-1.111418, 0.9583758, 0.3399653, 1, 1, 1, 1, 1,
-1.107638, 0.8485294, -2.891683, 1, 1, 1, 1, 1,
-1.105037, -0.4580942, -1.207034, 1, 1, 1, 1, 1,
-1.10449, 0.1078802, -1.48098, 1, 1, 1, 1, 1,
-1.103581, 1.176337, -3.126055, 1, 1, 1, 1, 1,
-1.096823, 1.540527, -0.8090579, 1, 1, 1, 1, 1,
-1.095313, 1.283291, 0.532004, 1, 1, 1, 1, 1,
-1.080936, -0.8906478, -0.5760748, 1, 1, 1, 1, 1,
-1.079755, -1.502058, -1.256718, 0, 0, 1, 1, 1,
-1.077823, 1.224139, -0.4935085, 1, 0, 0, 1, 1,
-1.073273, 0.9948744, -0.3775179, 1, 0, 0, 1, 1,
-1.07306, -0.6545378, -0.7642535, 1, 0, 0, 1, 1,
-1.06735, -0.2958438, -2.203861, 1, 0, 0, 1, 1,
-1.065761, -0.2789652, -2.810451, 1, 0, 0, 1, 1,
-1.056663, 0.1241159, -2.354203, 0, 0, 0, 1, 1,
-1.055041, 1.295914, 0.2074876, 0, 0, 0, 1, 1,
-1.052903, 0.3291678, 0.8864497, 0, 0, 0, 1, 1,
-1.047262, -0.5626159, -0.6684423, 0, 0, 0, 1, 1,
-1.046354, -0.8901854, -2.085577, 0, 0, 0, 1, 1,
-1.045947, 0.675664, -0.5255597, 0, 0, 0, 1, 1,
-1.044451, -0.4605747, -2.055987, 0, 0, 0, 1, 1,
-1.041285, 0.9545022, -3.280451, 1, 1, 1, 1, 1,
-1.038796, -1.214134, -1.974595, 1, 1, 1, 1, 1,
-1.016069, 1.335967, -0.4966386, 1, 1, 1, 1, 1,
-1.012152, -0.07490765, -2.040344, 1, 1, 1, 1, 1,
-1.007291, 0.3276911, -1.285712, 1, 1, 1, 1, 1,
-1.000025, -0.7654284, -2.640028, 1, 1, 1, 1, 1,
-0.9987539, 0.7890934, -1.393749, 1, 1, 1, 1, 1,
-0.9971243, -0.2532148, -1.972852, 1, 1, 1, 1, 1,
-0.9879047, -0.8990698, -3.328836, 1, 1, 1, 1, 1,
-0.982458, 0.5518638, -1.148886, 1, 1, 1, 1, 1,
-0.9784652, 0.01020334, -1.322588, 1, 1, 1, 1, 1,
-0.9775603, -0.9582251, -3.144732, 1, 1, 1, 1, 1,
-0.9743912, -0.49045, -1.539545, 1, 1, 1, 1, 1,
-0.9734485, 0.253599, -0.4129368, 1, 1, 1, 1, 1,
-0.9733427, -0.7175551, -2.839979, 1, 1, 1, 1, 1,
-0.965451, 1.220117, -0.04501989, 0, 0, 1, 1, 1,
-0.9643455, -0.5770632, -3.086276, 1, 0, 0, 1, 1,
-0.9642484, 2.663949, 0.1210323, 1, 0, 0, 1, 1,
-0.9616555, 0.35549, -2.293916, 1, 0, 0, 1, 1,
-0.9604187, -1.579068, -2.650007, 1, 0, 0, 1, 1,
-0.9550831, -0.7890346, -1.872411, 1, 0, 0, 1, 1,
-0.9547684, 0.8178122, -0.5770324, 0, 0, 0, 1, 1,
-0.9535161, -0.3105834, -2.28455, 0, 0, 0, 1, 1,
-0.9475416, 0.8890414, -2.012831, 0, 0, 0, 1, 1,
-0.9398396, 0.9112366, -1.535859, 0, 0, 0, 1, 1,
-0.9387183, -0.6617875, -1.934947, 0, 0, 0, 1, 1,
-0.937644, 0.9095002, -1.050031, 0, 0, 0, 1, 1,
-0.9350144, -1.072181, -2.207292, 0, 0, 0, 1, 1,
-0.9311519, 1.021902, -0.6444479, 1, 1, 1, 1, 1,
-0.9303115, -1.069328, -1.763382, 1, 1, 1, 1, 1,
-0.9216149, -1.093643, -2.373226, 1, 1, 1, 1, 1,
-0.9053456, 0.4661609, -0.6108624, 1, 1, 1, 1, 1,
-0.9051178, -0.219767, -2.476006, 1, 1, 1, 1, 1,
-0.895831, 0.4152032, -0.9521785, 1, 1, 1, 1, 1,
-0.8926303, -0.7001048, -2.452915, 1, 1, 1, 1, 1,
-0.8891514, 0.08281936, -1.483497, 1, 1, 1, 1, 1,
-0.8874875, 0.3287631, -1.262147, 1, 1, 1, 1, 1,
-0.879855, -1.035149, -2.695531, 1, 1, 1, 1, 1,
-0.872968, 1.684247, -0.6168851, 1, 1, 1, 1, 1,
-0.8713029, -2.248612, -4.005893, 1, 1, 1, 1, 1,
-0.866667, 0.1586249, -1.922379, 1, 1, 1, 1, 1,
-0.8609041, -1.134991, -2.447261, 1, 1, 1, 1, 1,
-0.8587006, 0.5032421, 0.537773, 1, 1, 1, 1, 1,
-0.8523787, -0.9059339, -1.878572, 0, 0, 1, 1, 1,
-0.8474004, 1.15389, -0.1600154, 1, 0, 0, 1, 1,
-0.8470082, 1.121246, -0.5968653, 1, 0, 0, 1, 1,
-0.8445374, -0.06261335, -3.232955, 1, 0, 0, 1, 1,
-0.8411956, 1.800767, -0.1259461, 1, 0, 0, 1, 1,
-0.8358414, 0.07087909, -2.362587, 1, 0, 0, 1, 1,
-0.8278466, -0.230368, -2.286785, 0, 0, 0, 1, 1,
-0.825617, 0.07432571, -0.7576754, 0, 0, 0, 1, 1,
-0.8226835, 0.3647048, -2.022467, 0, 0, 0, 1, 1,
-0.8220583, 2.118498, 0.2943698, 0, 0, 0, 1, 1,
-0.8214741, 0.6935266, -1.114261, 0, 0, 0, 1, 1,
-0.8197305, 1.535981, -2.389206, 0, 0, 0, 1, 1,
-0.8184572, -1.475102, -3.064589, 0, 0, 0, 1, 1,
-0.8058046, -0.774011, -3.839374, 1, 1, 1, 1, 1,
-0.8031558, -0.1814662, -1.906935, 1, 1, 1, 1, 1,
-0.7951514, 0.5359873, -0.7061329, 1, 1, 1, 1, 1,
-0.7937519, -0.1293756, -0.276604, 1, 1, 1, 1, 1,
-0.7936901, -0.7302658, -1.213709, 1, 1, 1, 1, 1,
-0.7903066, -0.1876302, -0.3923704, 1, 1, 1, 1, 1,
-0.7848095, -0.4840795, -2.324761, 1, 1, 1, 1, 1,
-0.7795496, 2.073864, -1.481321, 1, 1, 1, 1, 1,
-0.7778295, -1.033119, -2.271313, 1, 1, 1, 1, 1,
-0.7771763, -1.382255, -3.054079, 1, 1, 1, 1, 1,
-0.7662771, -0.9922552, -2.170497, 1, 1, 1, 1, 1,
-0.7589892, -1.479323, -3.117029, 1, 1, 1, 1, 1,
-0.746556, 1.047306, -0.3830517, 1, 1, 1, 1, 1,
-0.74366, 0.5424209, -1.535972, 1, 1, 1, 1, 1,
-0.7335936, -0.5172824, -1.568637, 1, 1, 1, 1, 1,
-0.7305426, -0.6152082, -2.733617, 0, 0, 1, 1, 1,
-0.7232829, 0.8134038, -1.274577, 1, 0, 0, 1, 1,
-0.7122427, 0.04073245, -1.179408, 1, 0, 0, 1, 1,
-0.7119585, -0.6748136, -2.17503, 1, 0, 0, 1, 1,
-0.701105, -0.2358602, -1.361981, 1, 0, 0, 1, 1,
-0.6968712, 1.164007, 1.415495, 1, 0, 0, 1, 1,
-0.6967909, 2.445217, 1.450007, 0, 0, 0, 1, 1,
-0.6950121, -0.4796893, -1.848195, 0, 0, 0, 1, 1,
-0.6937504, -0.4998524, -2.637104, 0, 0, 0, 1, 1,
-0.6856116, -1.303933, -4.264103, 0, 0, 0, 1, 1,
-0.6833652, -0.99852, -4.979706, 0, 0, 0, 1, 1,
-0.6831277, 1.237323, -2.855603, 0, 0, 0, 1, 1,
-0.6789733, -0.4088552, -2.847382, 0, 0, 0, 1, 1,
-0.6759257, -1.103994, -1.475896, 1, 1, 1, 1, 1,
-0.6755528, 1.249641, -0.2966395, 1, 1, 1, 1, 1,
-0.6618463, -0.3134158, -2.488618, 1, 1, 1, 1, 1,
-0.6566809, -0.009871794, -1.856062, 1, 1, 1, 1, 1,
-0.6536126, -1.135563, -2.210321, 1, 1, 1, 1, 1,
-0.6532697, -0.5602781, -2.848168, 1, 1, 1, 1, 1,
-0.6521965, 1.287652, 0.05953721, 1, 1, 1, 1, 1,
-0.651545, 0.4609015, 0.2059136, 1, 1, 1, 1, 1,
-0.6490164, -0.9075195, -3.543246, 1, 1, 1, 1, 1,
-0.6463941, 0.2184912, -0.7652328, 1, 1, 1, 1, 1,
-0.6443193, 0.3769118, -1.15923, 1, 1, 1, 1, 1,
-0.6382254, -0.2977849, -5.065172, 1, 1, 1, 1, 1,
-0.6340834, 0.476267, -0.46577, 1, 1, 1, 1, 1,
-0.6331266, -1.193783, -2.544473, 1, 1, 1, 1, 1,
-0.632688, -0.1914219, -1.464661, 1, 1, 1, 1, 1,
-0.6289939, -0.07579838, -1.921286, 0, 0, 1, 1, 1,
-0.6217884, 1.539611, -0.4571623, 1, 0, 0, 1, 1,
-0.6187568, 0.06614863, -2.280039, 1, 0, 0, 1, 1,
-0.6122692, 0.2169745, -2.580913, 1, 0, 0, 1, 1,
-0.6106875, 0.125592, -0.3856279, 1, 0, 0, 1, 1,
-0.6104062, 2.423183, -0.7019541, 1, 0, 0, 1, 1,
-0.6103948, 1.294292, -1.307264, 0, 0, 0, 1, 1,
-0.6023897, 0.3206409, -1.51107, 0, 0, 0, 1, 1,
-0.6011528, -0.2785093, -1.503532, 0, 0, 0, 1, 1,
-0.5966828, -1.049852, -2.221822, 0, 0, 0, 1, 1,
-0.5963606, -0.4408797, -0.8710278, 0, 0, 0, 1, 1,
-0.5868091, -0.6765383, -2.863634, 0, 0, 0, 1, 1,
-0.5860276, -0.7715925, -2.046306, 0, 0, 0, 1, 1,
-0.5815958, -0.3606987, -2.373127, 1, 1, 1, 1, 1,
-0.58085, 0.4178846, -1.186948, 1, 1, 1, 1, 1,
-0.5791944, -0.06144835, -0.714835, 1, 1, 1, 1, 1,
-0.576062, -0.131471, -1.503926, 1, 1, 1, 1, 1,
-0.5760593, -0.2617861, -1.809221, 1, 1, 1, 1, 1,
-0.5692472, 0.4395914, 0.6891459, 1, 1, 1, 1, 1,
-0.5656846, 1.280276, 1.209589, 1, 1, 1, 1, 1,
-0.5654625, -1.141302, -3.510248, 1, 1, 1, 1, 1,
-0.5650367, -0.2450997, -1.058046, 1, 1, 1, 1, 1,
-0.5641452, 0.009283847, -2.813703, 1, 1, 1, 1, 1,
-0.5610708, 0.7196823, 0.05444169, 1, 1, 1, 1, 1,
-0.5606983, 0.5454633, -0.3163031, 1, 1, 1, 1, 1,
-0.5598463, -0.2830253, -2.096448, 1, 1, 1, 1, 1,
-0.5537958, 0.03089144, -1.805319, 1, 1, 1, 1, 1,
-0.5447553, 0.875833, -0.04842906, 1, 1, 1, 1, 1,
-0.5447429, -0.1130933, -2.395317, 0, 0, 1, 1, 1,
-0.5426734, -1.904627, -2.024323, 1, 0, 0, 1, 1,
-0.5282865, 1.169943, -0.4042932, 1, 0, 0, 1, 1,
-0.5268971, 0.05285441, -0.323402, 1, 0, 0, 1, 1,
-0.5259838, 0.008351266, -1.870624, 1, 0, 0, 1, 1,
-0.5257568, 0.3691084, -2.288512, 1, 0, 0, 1, 1,
-0.5246159, 0.9655597, 0.7930353, 0, 0, 0, 1, 1,
-0.5152584, -0.2197035, -3.297704, 0, 0, 0, 1, 1,
-0.5139102, 2.185899, -0.9650325, 0, 0, 0, 1, 1,
-0.5097265, -0.2564809, -3.893033, 0, 0, 0, 1, 1,
-0.5015683, -0.8191822, -2.409587, 0, 0, 0, 1, 1,
-0.501115, 1.257746, -0.6560898, 0, 0, 0, 1, 1,
-0.4974477, 1.567029, 0.7571837, 0, 0, 0, 1, 1,
-0.4935386, 0.1468803, -2.417691, 1, 1, 1, 1, 1,
-0.4925538, -1.391967, -0.5436932, 1, 1, 1, 1, 1,
-0.4891204, 0.1763315, -1.014755, 1, 1, 1, 1, 1,
-0.4798174, -0.07317756, -2.380938, 1, 1, 1, 1, 1,
-0.479281, 0.1425319, -1.627445, 1, 1, 1, 1, 1,
-0.4789963, 2.071768, -0.1435725, 1, 1, 1, 1, 1,
-0.473282, 1.347678, -0.2319174, 1, 1, 1, 1, 1,
-0.4721434, 0.3360659, -0.6947027, 1, 1, 1, 1, 1,
-0.4708841, 0.2869097, -1.016348, 1, 1, 1, 1, 1,
-0.470848, 0.5119562, 2.457939, 1, 1, 1, 1, 1,
-0.4705702, -1.780229, -2.815436, 1, 1, 1, 1, 1,
-0.4703819, -0.3389896, -2.143075, 1, 1, 1, 1, 1,
-0.4695933, -1.179043, -1.116266, 1, 1, 1, 1, 1,
-0.465887, 0.2606146, -1.756647, 1, 1, 1, 1, 1,
-0.4564569, 0.3369686, -0.07053543, 1, 1, 1, 1, 1,
-0.4531, 0.004241406, -2.906897, 0, 0, 1, 1, 1,
-0.4514121, 1.302516, 0.8954932, 1, 0, 0, 1, 1,
-0.450311, 0.921532, 0.6710469, 1, 0, 0, 1, 1,
-0.4486569, -0.1777279, -2.616242, 1, 0, 0, 1, 1,
-0.4465139, 0.2357432, -0.5686208, 1, 0, 0, 1, 1,
-0.4431679, 0.740262, 0.05635351, 1, 0, 0, 1, 1,
-0.4430082, 0.7268355, -0.02879499, 0, 0, 0, 1, 1,
-0.4384556, -1.390116, -4.101094, 0, 0, 0, 1, 1,
-0.4356575, 3.799381, -0.730774, 0, 0, 0, 1, 1,
-0.4255814, 0.4157623, -0.3636778, 0, 0, 0, 1, 1,
-0.4207402, 0.8461371, 0.1491702, 0, 0, 0, 1, 1,
-0.4170413, -1.878591, -3.452246, 0, 0, 0, 1, 1,
-0.4159973, -0.6551155, -2.328926, 0, 0, 0, 1, 1,
-0.4110427, -1.286535, -4.483735, 1, 1, 1, 1, 1,
-0.4085311, 0.4409247, -2.114571, 1, 1, 1, 1, 1,
-0.4026131, 0.3819424, 0.138862, 1, 1, 1, 1, 1,
-0.3993195, -1.875029, -3.053763, 1, 1, 1, 1, 1,
-0.3978961, -1.22365, -2.32901, 1, 1, 1, 1, 1,
-0.3966395, 1.162577, 0.3201573, 1, 1, 1, 1, 1,
-0.3949053, -0.7399, -1.585192, 1, 1, 1, 1, 1,
-0.3876254, -0.503396, -2.640451, 1, 1, 1, 1, 1,
-0.3859396, -0.04584791, -2.827646, 1, 1, 1, 1, 1,
-0.382751, -1.028139, -2.038903, 1, 1, 1, 1, 1,
-0.3805331, -1.569873, -4.831582, 1, 1, 1, 1, 1,
-0.3758035, -1.358143, -3.703482, 1, 1, 1, 1, 1,
-0.3754261, 0.2686315, -1.315973, 1, 1, 1, 1, 1,
-0.3724801, 0.8267442, -0.2477925, 1, 1, 1, 1, 1,
-0.3690712, -1.682912, -2.88625, 1, 1, 1, 1, 1,
-0.3676901, 0.5924475, -1.58814, 0, 0, 1, 1, 1,
-0.3662204, -0.5377984, -2.53067, 1, 0, 0, 1, 1,
-0.363604, 0.02875447, -3.448383, 1, 0, 0, 1, 1,
-0.36178, -0.5173391, -3.361702, 1, 0, 0, 1, 1,
-0.3577037, -0.6551023, -2.121274, 1, 0, 0, 1, 1,
-0.3576465, -0.1216434, -2.482482, 1, 0, 0, 1, 1,
-0.3558783, -0.01447852, -0.70882, 0, 0, 0, 1, 1,
-0.3462736, 0.3210801, -1.315808, 0, 0, 0, 1, 1,
-0.3461187, 0.7705248, 0.3801149, 0, 0, 0, 1, 1,
-0.3405117, -0.4742429, -1.196583, 0, 0, 0, 1, 1,
-0.3364157, -0.4123889, -3.121436, 0, 0, 0, 1, 1,
-0.3338171, 0.06433357, -1.839354, 0, 0, 0, 1, 1,
-0.331086, -0.9151592, -0.5467439, 0, 0, 0, 1, 1,
-0.3279282, 0.4972925, 0.3459202, 1, 1, 1, 1, 1,
-0.324711, 0.8779867, -0.2940536, 1, 1, 1, 1, 1,
-0.3202346, 0.1062562, -2.615621, 1, 1, 1, 1, 1,
-0.319755, 1.018798, -1.036056, 1, 1, 1, 1, 1,
-0.3194033, 0.8009578, 1.013269, 1, 1, 1, 1, 1,
-0.3139462, -0.01409038, 0.1408367, 1, 1, 1, 1, 1,
-0.3112836, -0.8710504, -2.343886, 1, 1, 1, 1, 1,
-0.3105528, 0.6334563, -0.8790997, 1, 1, 1, 1, 1,
-0.3087635, 0.3136898, -0.2792208, 1, 1, 1, 1, 1,
-0.3027057, -1.893157, -2.047472, 1, 1, 1, 1, 1,
-0.3011979, -1.932522, -2.227795, 1, 1, 1, 1, 1,
-0.2996198, -0.54322, -2.079147, 1, 1, 1, 1, 1,
-0.2969271, -0.1115478, -1.979534, 1, 1, 1, 1, 1,
-0.2951139, 2.05277, 2.239005, 1, 1, 1, 1, 1,
-0.2918836, -1.476754, -1.974416, 1, 1, 1, 1, 1,
-0.291274, 0.01686482, -1.876846, 0, 0, 1, 1, 1,
-0.2885111, -1.192982, -3.848418, 1, 0, 0, 1, 1,
-0.2810315, -0.144296, -2.029289, 1, 0, 0, 1, 1,
-0.2800032, -0.9123747, -3.113083, 1, 0, 0, 1, 1,
-0.2791722, -1.733935, -3.591772, 1, 0, 0, 1, 1,
-0.2788576, 0.3712188, -1.622916, 1, 0, 0, 1, 1,
-0.2778904, -0.2282368, -1.115468, 0, 0, 0, 1, 1,
-0.2764679, 0.2228993, 0.7679781, 0, 0, 0, 1, 1,
-0.2746356, 1.560653, -0.5993107, 0, 0, 0, 1, 1,
-0.2691127, -0.7394783, -1.975524, 0, 0, 0, 1, 1,
-0.2683721, 0.2634868, -1.033561, 0, 0, 0, 1, 1,
-0.2670329, 1.079936, 0.5807325, 0, 0, 0, 1, 1,
-0.2629938, 1.587838, 1.272309, 0, 0, 0, 1, 1,
-0.2625054, 0.6397136, 0.5418234, 1, 1, 1, 1, 1,
-0.2619601, -0.04671956, -1.459197, 1, 1, 1, 1, 1,
-0.2536206, 0.4372483, 0.04796657, 1, 1, 1, 1, 1,
-0.2525613, -0.7481928, -3.18179, 1, 1, 1, 1, 1,
-0.2522607, 0.4296634, -1.582542, 1, 1, 1, 1, 1,
-0.2509882, 0.2169538, -1.46506, 1, 1, 1, 1, 1,
-0.2504045, 0.08641867, -1.804617, 1, 1, 1, 1, 1,
-0.246765, 0.4683943, -1.434093, 1, 1, 1, 1, 1,
-0.2451835, -1.148809, -2.943969, 1, 1, 1, 1, 1,
-0.2435301, -0.09240384, -1.815073, 1, 1, 1, 1, 1,
-0.2433335, -1.45405, -3.351875, 1, 1, 1, 1, 1,
-0.2432626, 2.726708, 0.8795022, 1, 1, 1, 1, 1,
-0.2422782, 0.380002, 1.102228, 1, 1, 1, 1, 1,
-0.2333563, -0.9265373, -2.437549, 1, 1, 1, 1, 1,
-0.2308767, -0.3212988, -1.57488, 1, 1, 1, 1, 1,
-0.2308164, -0.53888, -1.887014, 0, 0, 1, 1, 1,
-0.2293892, -0.1160303, -3.385427, 1, 0, 0, 1, 1,
-0.226372, 0.2846714, 0.2021268, 1, 0, 0, 1, 1,
-0.2227, 0.7111352, -1.208139, 1, 0, 0, 1, 1,
-0.2223915, 0.06820874, -3.462257, 1, 0, 0, 1, 1,
-0.2223366, -0.3341939, -1.483986, 1, 0, 0, 1, 1,
-0.2192186, -0.3468403, -2.517391, 0, 0, 0, 1, 1,
-0.2180944, -0.7353771, -2.857884, 0, 0, 0, 1, 1,
-0.2172354, 2.963998, 0.06088682, 0, 0, 0, 1, 1,
-0.2126715, -1.452066, -2.445652, 0, 0, 0, 1, 1,
-0.2113258, -0.1157177, -1.260675, 0, 0, 0, 1, 1,
-0.2096259, 0.4914738, -0.4284838, 0, 0, 0, 1, 1,
-0.2077866, -0.5414576, -1.925032, 0, 0, 0, 1, 1,
-0.2054527, 2.060766, 0.6215893, 1, 1, 1, 1, 1,
-0.1964706, 1.014297, 0.4263383, 1, 1, 1, 1, 1,
-0.194601, 1.129538, 0.7270355, 1, 1, 1, 1, 1,
-0.1933208, -0.2886194, -2.900251, 1, 1, 1, 1, 1,
-0.1920346, -0.8415799, -1.323094, 1, 1, 1, 1, 1,
-0.1849924, 1.711388, 1.411575, 1, 1, 1, 1, 1,
-0.184267, 0.3547147, -0.9816885, 1, 1, 1, 1, 1,
-0.1828756, -0.2403473, -2.405128, 1, 1, 1, 1, 1,
-0.1750064, -0.06833906, 0.6500114, 1, 1, 1, 1, 1,
-0.1743192, 0.8305388, 2.061525, 1, 1, 1, 1, 1,
-0.1719844, -0.307337, -2.815361, 1, 1, 1, 1, 1,
-0.1710344, 0.02067833, -1.183919, 1, 1, 1, 1, 1,
-0.170941, -0.268601, -1.436147, 1, 1, 1, 1, 1,
-0.1655729, -1.533563, -1.82979, 1, 1, 1, 1, 1,
-0.1646063, 0.580288, -0.1940058, 1, 1, 1, 1, 1,
-0.1640033, -0.2874208, -2.899909, 0, 0, 1, 1, 1,
-0.1607185, -0.9446163, -2.931658, 1, 0, 0, 1, 1,
-0.1584617, -0.6467493, -3.794886, 1, 0, 0, 1, 1,
-0.1490443, 1.261641, 0.8796508, 1, 0, 0, 1, 1,
-0.148714, 0.3042488, -1.465305, 1, 0, 0, 1, 1,
-0.1448355, 0.2749921, -0.8136697, 1, 0, 0, 1, 1,
-0.1438049, -0.89152, -2.520207, 0, 0, 0, 1, 1,
-0.140204, 0.007090264, -0.5084743, 0, 0, 0, 1, 1,
-0.1389502, 0.1129369, -0.8225272, 0, 0, 0, 1, 1,
-0.1385029, 0.4789782, 0.7614235, 0, 0, 0, 1, 1,
-0.1379123, -0.2882497, -2.949671, 0, 0, 0, 1, 1,
-0.1361388, 0.3493902, -0.417726, 0, 0, 0, 1, 1,
-0.1347972, -0.6254763, -3.278004, 0, 0, 0, 1, 1,
-0.1321387, -0.3646884, -0.8227035, 1, 1, 1, 1, 1,
-0.1301452, 1.308772, -0.32798, 1, 1, 1, 1, 1,
-0.1267508, -0.4231328, -2.438275, 1, 1, 1, 1, 1,
-0.125757, -1.335659, -2.77436, 1, 1, 1, 1, 1,
-0.1228735, -0.3588309, -2.070116, 1, 1, 1, 1, 1,
-0.1185786, -0.3018051, -2.089528, 1, 1, 1, 1, 1,
-0.1148235, 0.7306268, 0.5042693, 1, 1, 1, 1, 1,
-0.1142476, 0.4598913, -2.137395, 1, 1, 1, 1, 1,
-0.1102049, 1.018277, 0.3452973, 1, 1, 1, 1, 1,
-0.107295, 0.6822345, -0.5974481, 1, 1, 1, 1, 1,
-0.1068812, -1.727808, -1.403207, 1, 1, 1, 1, 1,
-0.1055898, -0.2033277, -3.480411, 1, 1, 1, 1, 1,
-0.1008961, 0.3209424, -0.5333684, 1, 1, 1, 1, 1,
-0.1000726, 0.3100507, 0.3737283, 1, 1, 1, 1, 1,
-0.09537361, 0.9494759, 0.5517517, 1, 1, 1, 1, 1,
-0.09258014, 0.7934371, 1.097854, 0, 0, 1, 1, 1,
-0.09193381, -1.793472, -3.341742, 1, 0, 0, 1, 1,
-0.09182101, -0.6531074, -3.480706, 1, 0, 0, 1, 1,
-0.08113993, -0.544607, -2.943534, 1, 0, 0, 1, 1,
-0.0796214, 0.259887, 0.3132683, 1, 0, 0, 1, 1,
-0.07295586, 0.6036958, 0.5220404, 1, 0, 0, 1, 1,
-0.07121027, 0.5809544, -2.297794, 0, 0, 0, 1, 1,
-0.06379949, -1.171179, -3.298141, 0, 0, 0, 1, 1,
-0.06278829, -1.625867, -2.558776, 0, 0, 0, 1, 1,
-0.06125655, -0.1445332, -2.187208, 0, 0, 0, 1, 1,
-0.06059018, -0.08279195, -2.960858, 0, 0, 0, 1, 1,
-0.0604679, 0.7526639, 0.9741356, 0, 0, 0, 1, 1,
-0.05775054, 0.4095674, -1.828114, 0, 0, 0, 1, 1,
-0.05703381, -0.9717509, -3.373918, 1, 1, 1, 1, 1,
-0.05366476, -1.636295, -3.308675, 1, 1, 1, 1, 1,
-0.04934885, -0.3897552, -4.230992, 1, 1, 1, 1, 1,
-0.04913179, 0.7341826, 0.2108078, 1, 1, 1, 1, 1,
-0.04638758, -0.2223978, -2.747004, 1, 1, 1, 1, 1,
-0.04378739, -0.17398, -1.87594, 1, 1, 1, 1, 1,
-0.04275412, -0.6364741, -4.127361, 1, 1, 1, 1, 1,
-0.04260485, -0.01877753, -2.205051, 1, 1, 1, 1, 1,
-0.04086664, 0.1148384, 2.438031, 1, 1, 1, 1, 1,
-0.03962059, -1.307259, -4.171902, 1, 1, 1, 1, 1,
-0.03265136, -0.7473884, -2.62663, 1, 1, 1, 1, 1,
-0.02318385, -0.2423789, -2.184081, 1, 1, 1, 1, 1,
-0.01966036, 0.2859275, -2.34578, 1, 1, 1, 1, 1,
-0.009247608, 0.3009675, -0.3400276, 1, 1, 1, 1, 1,
-0.002979578, -0.5307134, -4.57432, 1, 1, 1, 1, 1,
-0.001665088, -0.942358, -3.097859, 0, 0, 1, 1, 1,
0.002512694, 0.9311933, -0.2337153, 1, 0, 0, 1, 1,
0.002926626, 0.4626788, 0.4779777, 1, 0, 0, 1, 1,
0.003566973, -1.241962, 1.604272, 1, 0, 0, 1, 1,
0.01069065, 0.7274977, 0.1696485, 1, 0, 0, 1, 1,
0.01216426, 1.073492, 0.2263157, 1, 0, 0, 1, 1,
0.01306796, 0.8335176, -0.5094868, 0, 0, 0, 1, 1,
0.01793592, -0.1307832, 4.457104, 0, 0, 0, 1, 1,
0.0199127, -0.1681163, 4.175233, 0, 0, 0, 1, 1,
0.02349162, -0.386014, 2.074517, 0, 0, 0, 1, 1,
0.02386203, 0.1255277, -0.2783825, 0, 0, 0, 1, 1,
0.02554243, 0.3992167, 0.4801903, 0, 0, 0, 1, 1,
0.03501682, 0.7365167, 0.9842191, 0, 0, 0, 1, 1,
0.03766843, 0.09616577, 0.729075, 1, 1, 1, 1, 1,
0.03959673, -0.7019431, 3.032393, 1, 1, 1, 1, 1,
0.04169402, -1.627691, 2.117135, 1, 1, 1, 1, 1,
0.04191137, -0.5049413, 2.4469, 1, 1, 1, 1, 1,
0.0428502, -0.4680101, 3.315045, 1, 1, 1, 1, 1,
0.04742058, 0.0008802045, 2.485308, 1, 1, 1, 1, 1,
0.05610223, -1.55358, 1.8965, 1, 1, 1, 1, 1,
0.0593381, -0.3461722, 4.879101, 1, 1, 1, 1, 1,
0.06582482, -2.083865, 3.264593, 1, 1, 1, 1, 1,
0.06582871, 0.05332899, 2.566163, 1, 1, 1, 1, 1,
0.07024937, -0.7152272, 5.33653, 1, 1, 1, 1, 1,
0.07106248, 1.12286, -0.8753677, 1, 1, 1, 1, 1,
0.07342106, -0.875737, 3.22486, 1, 1, 1, 1, 1,
0.07427511, 1.682071, -0.4083038, 1, 1, 1, 1, 1,
0.07501466, 0.9134439, 0.1026089, 1, 1, 1, 1, 1,
0.08747609, 1.32364, 0.1121889, 0, 0, 1, 1, 1,
0.09044144, 0.7463549, 0.1009812, 1, 0, 0, 1, 1,
0.0905329, 0.9446301, -0.0773448, 1, 0, 0, 1, 1,
0.09246783, 0.3297597, 1.121544, 1, 0, 0, 1, 1,
0.09800868, -0.5929499, 4.407819, 1, 0, 0, 1, 1,
0.09837961, -0.1079208, 0.6537982, 1, 0, 0, 1, 1,
0.09852772, 0.2496416, 0.9265066, 0, 0, 0, 1, 1,
0.09862206, -0.5986714, 3.208278, 0, 0, 0, 1, 1,
0.09990478, 1.066156, -0.7445608, 0, 0, 0, 1, 1,
0.1031439, -0.5691023, 4.977741, 0, 0, 0, 1, 1,
0.1068097, -0.176134, 0.7418742, 0, 0, 0, 1, 1,
0.1079314, -0.4503161, 2.087746, 0, 0, 0, 1, 1,
0.1100865, -0.2660795, 2.596824, 0, 0, 0, 1, 1,
0.1106183, 1.624331, -0.7470374, 1, 1, 1, 1, 1,
0.1153285, 0.6504632, 1.105442, 1, 1, 1, 1, 1,
0.1168176, -1.71761, 3.292567, 1, 1, 1, 1, 1,
0.1195131, 1.501327, 0.7728173, 1, 1, 1, 1, 1,
0.1209172, -1.429917, 3.962176, 1, 1, 1, 1, 1,
0.1209351, 0.4701215, 0.1587572, 1, 1, 1, 1, 1,
0.1228822, 1.133433, -0.6061671, 1, 1, 1, 1, 1,
0.1263319, 0.4415993, 1.40259, 1, 1, 1, 1, 1,
0.1283543, 0.4518597, 0.8424081, 1, 1, 1, 1, 1,
0.1283885, -0.01599336, 3.076983, 1, 1, 1, 1, 1,
0.1307209, 0.05311086, 1.078916, 1, 1, 1, 1, 1,
0.1311018, 0.429926, -0.6927282, 1, 1, 1, 1, 1,
0.1329207, 0.0588525, 2.573574, 1, 1, 1, 1, 1,
0.1341372, 0.9246861, -0.06209105, 1, 1, 1, 1, 1,
0.134957, -0.1281681, 3.010448, 1, 1, 1, 1, 1,
0.1358741, -0.6732817, 2.517202, 0, 0, 1, 1, 1,
0.1386728, 0.009997874, 4.067459, 1, 0, 0, 1, 1,
0.1404035, -1.341583, 3.542444, 1, 0, 0, 1, 1,
0.1434968, -1.948997, 3.567511, 1, 0, 0, 1, 1,
0.1465905, -0.8309064, 2.98259, 1, 0, 0, 1, 1,
0.1475524, 0.8469117, 0.1907862, 1, 0, 0, 1, 1,
0.1476077, 0.3364322, -2.029115, 0, 0, 0, 1, 1,
0.1479727, 0.3598406, 0.8298579, 0, 0, 0, 1, 1,
0.1489542, 0.8340923, 2.207513, 0, 0, 0, 1, 1,
0.1540593, -0.216148, 2.002209, 0, 0, 0, 1, 1,
0.1541034, 0.3858583, 0.754998, 0, 0, 0, 1, 1,
0.157708, -0.6470357, 0.8123922, 0, 0, 0, 1, 1,
0.1591358, -1.811712, 2.863008, 0, 0, 0, 1, 1,
0.1602184, 0.1701455, 1.318583, 1, 1, 1, 1, 1,
0.1621344, 1.318143, 1.735062, 1, 1, 1, 1, 1,
0.1633339, -0.5441624, 1.811822, 1, 1, 1, 1, 1,
0.1641956, -1.871578, 4.469791, 1, 1, 1, 1, 1,
0.1703888, -0.4146436, 2.817901, 1, 1, 1, 1, 1,
0.1705958, -0.9866879, 2.917073, 1, 1, 1, 1, 1,
0.1713455, -0.9677273, 3.059809, 1, 1, 1, 1, 1,
0.1717026, -2.795916, 2.657298, 1, 1, 1, 1, 1,
0.1725577, -0.8654546, 4.85655, 1, 1, 1, 1, 1,
0.1732203, -0.4271123, 2.035822, 1, 1, 1, 1, 1,
0.1768142, -1.349513, 1.793939, 1, 1, 1, 1, 1,
0.1787698, 1.308651, -0.05457098, 1, 1, 1, 1, 1,
0.1809825, 0.3790343, 1.162147, 1, 1, 1, 1, 1,
0.1814926, 2.635453, -0.4796138, 1, 1, 1, 1, 1,
0.1834578, 0.856046, -0.4015841, 1, 1, 1, 1, 1,
0.1835179, 0.5467622, 0.6015108, 0, 0, 1, 1, 1,
0.183767, 0.9547582, 1.564475, 1, 0, 0, 1, 1,
0.18527, 1.057913, 0.4707179, 1, 0, 0, 1, 1,
0.1873056, -1.0776, 3.981942, 1, 0, 0, 1, 1,
0.1888309, -0.3893492, 0.8841641, 1, 0, 0, 1, 1,
0.1905564, 0.426374, -0.4224634, 1, 0, 0, 1, 1,
0.1908075, 0.2408478, 1.798184, 0, 0, 0, 1, 1,
0.1919367, 1.162929, 1.435798, 0, 0, 0, 1, 1,
0.1927222, 1.251349, -0.5939677, 0, 0, 0, 1, 1,
0.1931904, 0.9651428, 1.360174, 0, 0, 0, 1, 1,
0.1949041, 0.9249097, -1.216909, 0, 0, 0, 1, 1,
0.1971061, 0.5657442, 0.9668619, 0, 0, 0, 1, 1,
0.1971094, -0.6391813, 2.807844, 0, 0, 0, 1, 1,
0.2010987, 1.063412, -0.6061116, 1, 1, 1, 1, 1,
0.2024319, -1.273418, 2.257088, 1, 1, 1, 1, 1,
0.2160048, 1.602467, 0.4913323, 1, 1, 1, 1, 1,
0.2166254, -0.8556061, 3.702293, 1, 1, 1, 1, 1,
0.2185509, -0.5262578, 2.798795, 1, 1, 1, 1, 1,
0.2201509, 1.017018, 0.5888594, 1, 1, 1, 1, 1,
0.2205578, -0.7850986, 1.409113, 1, 1, 1, 1, 1,
0.2252972, -1.036688, 2.910834, 1, 1, 1, 1, 1,
0.2256954, -0.9109647, 4.76838, 1, 1, 1, 1, 1,
0.2293871, -1.943823, 1.305988, 1, 1, 1, 1, 1,
0.2295642, 1.363644, 0.8401183, 1, 1, 1, 1, 1,
0.2297573, -0.2247264, 2.363769, 1, 1, 1, 1, 1,
0.238921, 0.165782, 2.404659, 1, 1, 1, 1, 1,
0.2453397, 0.6202652, 1.053521, 1, 1, 1, 1, 1,
0.2531022, -0.3289247, 4.063468, 1, 1, 1, 1, 1,
0.2542259, 0.01895439, 1.800922, 0, 0, 1, 1, 1,
0.268547, 1.227233, -1.664265, 1, 0, 0, 1, 1,
0.2703575, 0.06359824, 0.2526206, 1, 0, 0, 1, 1,
0.2716202, 0.01815423, 0.8534857, 1, 0, 0, 1, 1,
0.2728693, -0.881387, 2.263031, 1, 0, 0, 1, 1,
0.2730263, 1.98853, 0.02226305, 1, 0, 0, 1, 1,
0.2744845, 0.6925238, 1.544462, 0, 0, 0, 1, 1,
0.2745623, -1.878024, 3.549433, 0, 0, 0, 1, 1,
0.2749478, -0.8822876, 3.618192, 0, 0, 0, 1, 1,
0.2790006, -0.8301097, 2.245908, 0, 0, 0, 1, 1,
0.2794161, 0.03984089, 0.5756371, 0, 0, 0, 1, 1,
0.2798989, -0.1425565, 4.447526, 0, 0, 0, 1, 1,
0.2817865, 1.2966, 1.424882, 0, 0, 0, 1, 1,
0.2894419, 0.9166294, 1.246628, 1, 1, 1, 1, 1,
0.2907486, -1.114325, 2.513345, 1, 1, 1, 1, 1,
0.2974077, -1.075626, 2.937349, 1, 1, 1, 1, 1,
0.2990836, 1.231513, -0.6942406, 1, 1, 1, 1, 1,
0.3006205, -0.06861928, 2.130544, 1, 1, 1, 1, 1,
0.3034124, -0.9689572, 1.02036, 1, 1, 1, 1, 1,
0.3119643, -0.8971286, 2.164229, 1, 1, 1, 1, 1,
0.3151737, -0.8236325, 2.440175, 1, 1, 1, 1, 1,
0.320987, -0.6359295, 2.131225, 1, 1, 1, 1, 1,
0.3216284, -0.9989459, 2.682525, 1, 1, 1, 1, 1,
0.3280631, 0.1715426, 1.004658, 1, 1, 1, 1, 1,
0.3289136, 1.098193, 0.4921826, 1, 1, 1, 1, 1,
0.3376218, -1.114121, 2.912714, 1, 1, 1, 1, 1,
0.342623, -0.2465073, 1.918112, 1, 1, 1, 1, 1,
0.34354, -1.49501, 3.102124, 1, 1, 1, 1, 1,
0.3516304, -2.140485, 3.438344, 0, 0, 1, 1, 1,
0.3528439, 0.007093281, 1.728911, 1, 0, 0, 1, 1,
0.3529074, -0.4196087, 2.915437, 1, 0, 0, 1, 1,
0.3611239, 1.153777, 0.9060082, 1, 0, 0, 1, 1,
0.3613713, 1.794995, -1.460119, 1, 0, 0, 1, 1,
0.3651797, -0.4865826, 1.978531, 1, 0, 0, 1, 1,
0.3664541, -0.5783983, 2.960024, 0, 0, 0, 1, 1,
0.3715811, -0.4705049, 2.144222, 0, 0, 0, 1, 1,
0.3717155, -0.7128751, 2.464006, 0, 0, 0, 1, 1,
0.3722408, -0.7768164, 4.257004, 0, 0, 0, 1, 1,
0.3727646, -0.2119812, 3.028786, 0, 0, 0, 1, 1,
0.3753007, -1.073169, 4.516993, 0, 0, 0, 1, 1,
0.3772515, 0.7294719, -0.6877331, 0, 0, 0, 1, 1,
0.3775394, -0.432697, 1.918851, 1, 1, 1, 1, 1,
0.3839302, -2.939922, 1.881338, 1, 1, 1, 1, 1,
0.3919214, -0.8264166, 1.649709, 1, 1, 1, 1, 1,
0.3932112, -0.2113487, 3.444028, 1, 1, 1, 1, 1,
0.3965542, -0.562564, 3.018305, 1, 1, 1, 1, 1,
0.4031716, -0.1427961, 2.211802, 1, 1, 1, 1, 1,
0.4038945, -1.220337, 1.068641, 1, 1, 1, 1, 1,
0.4080631, -1.601261, 3.443053, 1, 1, 1, 1, 1,
0.4091304, 0.7520059, 0.7538516, 1, 1, 1, 1, 1,
0.4156219, -2.061939, 2.699847, 1, 1, 1, 1, 1,
0.4176412, 0.07318003, 3.240742, 1, 1, 1, 1, 1,
0.4185613, 0.2113647, 0.2690795, 1, 1, 1, 1, 1,
0.4206087, 0.4624117, 1.032328, 1, 1, 1, 1, 1,
0.4230892, 0.5381914, 0.7307868, 1, 1, 1, 1, 1,
0.4233248, 1.181027, -0.68291, 1, 1, 1, 1, 1,
0.4234326, 0.1973147, 2.284875, 0, 0, 1, 1, 1,
0.4237949, 0.9184753, 0.7449918, 1, 0, 0, 1, 1,
0.4241233, -0.5622649, 3.758032, 1, 0, 0, 1, 1,
0.4241871, 0.6853261, -1.565173, 1, 0, 0, 1, 1,
0.4242425, -0.8280321, 3.298453, 1, 0, 0, 1, 1,
0.4258519, -1.202232, 3.456058, 1, 0, 0, 1, 1,
0.428379, -0.2566219, 1.600515, 0, 0, 0, 1, 1,
0.4323438, 0.1287798, 0.4600736, 0, 0, 0, 1, 1,
0.4326509, -0.05926652, -0.3356105, 0, 0, 0, 1, 1,
0.4337584, 0.6017025, 0.7103435, 0, 0, 0, 1, 1,
0.4376194, -0.6619632, 4.587646, 0, 0, 0, 1, 1,
0.442378, 1.072107, 1.268838, 0, 0, 0, 1, 1,
0.4441542, 0.8472604, 0.6487036, 0, 0, 0, 1, 1,
0.4476495, 0.8519062, 2.027003, 1, 1, 1, 1, 1,
0.450232, -1.53547, 2.294241, 1, 1, 1, 1, 1,
0.4506692, 0.4638374, -0.3257838, 1, 1, 1, 1, 1,
0.4554063, -0.2716, 2.10142, 1, 1, 1, 1, 1,
0.4558049, -0.01086524, 0.2719008, 1, 1, 1, 1, 1,
0.4567024, 0.09492668, 2.813963, 1, 1, 1, 1, 1,
0.4577294, 1.652885, 0.3076159, 1, 1, 1, 1, 1,
0.4586193, -1.119232, 4.34166, 1, 1, 1, 1, 1,
0.4669598, -0.470959, 2.777891, 1, 1, 1, 1, 1,
0.4692565, 0.7681766, 2.136242, 1, 1, 1, 1, 1,
0.4694748, -1.288087, 3.670824, 1, 1, 1, 1, 1,
0.4744585, -0.7820805, 0.7968229, 1, 1, 1, 1, 1,
0.4754356, 1.279954, 1.263027, 1, 1, 1, 1, 1,
0.4836349, -0.3807469, 2.925514, 1, 1, 1, 1, 1,
0.4896986, 0.7656044, -0.7629811, 1, 1, 1, 1, 1,
0.4973142, -1.159548, 2.345424, 0, 0, 1, 1, 1,
0.5035968, -0.7774256, 3.466648, 1, 0, 0, 1, 1,
0.5060135, -0.7931895, 1.3756, 1, 0, 0, 1, 1,
0.5061592, -1.838535, 2.676121, 1, 0, 0, 1, 1,
0.5125498, 0.4343127, 1.331653, 1, 0, 0, 1, 1,
0.5133632, -0.6927957, 2.105887, 1, 0, 0, 1, 1,
0.5188887, -0.6408273, 3.327269, 0, 0, 0, 1, 1,
0.5236533, -1.063857, 2.522351, 0, 0, 0, 1, 1,
0.5315836, -0.9526075, 3.916496, 0, 0, 0, 1, 1,
0.5387324, 2.241013, 0.3879013, 0, 0, 0, 1, 1,
0.5403966, -0.1836822, 1.124273, 0, 0, 0, 1, 1,
0.5405847, -0.2858162, 1.91335, 0, 0, 0, 1, 1,
0.5419433, 1.091834, -0.4206871, 0, 0, 0, 1, 1,
0.544048, -1.039323, 4.487031, 1, 1, 1, 1, 1,
0.5478551, -0.9896544, 3.386235, 1, 1, 1, 1, 1,
0.5495487, 0.05686574, 2.243904, 1, 1, 1, 1, 1,
0.5527214, 1.118997, 0.7667897, 1, 1, 1, 1, 1,
0.5548177, -0.4662861, 1.617037, 1, 1, 1, 1, 1,
0.55566, 2.421268, 0.9803315, 1, 1, 1, 1, 1,
0.5557755, -0.2286023, 3.775621, 1, 1, 1, 1, 1,
0.5614235, 2.55448, 1.749782, 1, 1, 1, 1, 1,
0.5640743, -0.3887324, 2.081394, 1, 1, 1, 1, 1,
0.571067, 0.944528, 1.933245, 1, 1, 1, 1, 1,
0.5732211, 0.8585085, 0.3471409, 1, 1, 1, 1, 1,
0.5746942, 0.331257, -0.3868367, 1, 1, 1, 1, 1,
0.5756413, -2.158929, 2.348917, 1, 1, 1, 1, 1,
0.5757325, 0.4695809, 2.516664, 1, 1, 1, 1, 1,
0.5757998, -0.8917484, 2.187507, 1, 1, 1, 1, 1,
0.5794857, -1.128461, 2.239302, 0, 0, 1, 1, 1,
0.5796178, -1.049433, 2.826296, 1, 0, 0, 1, 1,
0.5814989, 0.003938989, 2.588205, 1, 0, 0, 1, 1,
0.5839413, -0.7112656, 3.096251, 1, 0, 0, 1, 1,
0.5872208, -0.4427105, 2.286007, 1, 0, 0, 1, 1,
0.5924767, -0.2391865, 1.540847, 1, 0, 0, 1, 1,
0.5937375, -2.104572, 2.524857, 0, 0, 0, 1, 1,
0.5978104, -1.747403, 3.324271, 0, 0, 0, 1, 1,
0.598496, 1.653782, -0.1963215, 0, 0, 0, 1, 1,
0.605089, 0.2575862, 1.148308, 0, 0, 0, 1, 1,
0.6051575, -0.3750322, 1.272435, 0, 0, 0, 1, 1,
0.6093487, 0.1415806, -0.4422032, 0, 0, 0, 1, 1,
0.6114529, -0.8211405, 1.877676, 0, 0, 0, 1, 1,
0.6123366, 1.013336, 0.9281844, 1, 1, 1, 1, 1,
0.61397, 1.334609, 0.03241103, 1, 1, 1, 1, 1,
0.6159873, -1.069344, -0.04867679, 1, 1, 1, 1, 1,
0.6177324, -1.60073, 2.289091, 1, 1, 1, 1, 1,
0.619805, -0.9487607, 3.053951, 1, 1, 1, 1, 1,
0.6226558, 0.6729463, -0.5004222, 1, 1, 1, 1, 1,
0.6240675, -0.9028087, 4.780325, 1, 1, 1, 1, 1,
0.6280766, -0.1361297, 1.315537, 1, 1, 1, 1, 1,
0.6302033, 0.1406691, 1.160178, 1, 1, 1, 1, 1,
0.6362616, 0.3178714, 0.1970123, 1, 1, 1, 1, 1,
0.6382999, 0.3380425, -0.7368024, 1, 1, 1, 1, 1,
0.6440098, -1.500871, 2.24287, 1, 1, 1, 1, 1,
0.6440791, -0.5979162, 3.290916, 1, 1, 1, 1, 1,
0.6452608, -1.926272, 3.505723, 1, 1, 1, 1, 1,
0.6484607, 0.7716907, -0.0999712, 1, 1, 1, 1, 1,
0.6573165, 0.7619916, 1.061049, 0, 0, 1, 1, 1,
0.665381, -1.350296, 3.429645, 1, 0, 0, 1, 1,
0.6655517, 0.5504725, 0.4780297, 1, 0, 0, 1, 1,
0.6667683, 0.01921242, 1.563349, 1, 0, 0, 1, 1,
0.6713028, 1.330875, -0.4903256, 1, 0, 0, 1, 1,
0.6749483, -1.266374, 4.30599, 1, 0, 0, 1, 1,
0.6761446, -1.851643, 2.992033, 0, 0, 0, 1, 1,
0.6770886, 1.545902, -0.3493813, 0, 0, 0, 1, 1,
0.6824918, -0.2218254, 2.402096, 0, 0, 0, 1, 1,
0.6830642, -1.12659, 1.972746, 0, 0, 0, 1, 1,
0.6832445, 1.02842, 0.3129233, 0, 0, 0, 1, 1,
0.6839426, 1.383132, 1.54693, 0, 0, 0, 1, 1,
0.6867267, -0.5399197, 3.012112, 0, 0, 0, 1, 1,
0.6877038, -1.203214, 0.4073039, 1, 1, 1, 1, 1,
0.6937531, 0.5412211, 1.568093, 1, 1, 1, 1, 1,
0.6955312, 0.1648775, 1.395981, 1, 1, 1, 1, 1,
0.6962206, 0.8575327, 2.561828, 1, 1, 1, 1, 1,
0.6969339, 1.67108, 2.066655, 1, 1, 1, 1, 1,
0.7079807, -0.7381505, 3.250734, 1, 1, 1, 1, 1,
0.7101462, 2.675898, -0.9861059, 1, 1, 1, 1, 1,
0.7108234, 0.8153693, 2.246129, 1, 1, 1, 1, 1,
0.7132108, 0.9294393, 0.2714187, 1, 1, 1, 1, 1,
0.715328, 0.4825839, 1.393098, 1, 1, 1, 1, 1,
0.7186983, 1.486401, 1.764612, 1, 1, 1, 1, 1,
0.7231817, 0.3304845, 0.8067726, 1, 1, 1, 1, 1,
0.7249625, 1.16286, -0.584209, 1, 1, 1, 1, 1,
0.7274106, -0.0387818, 1.480884, 1, 1, 1, 1, 1,
0.737803, -0.1851653, 2.584157, 1, 1, 1, 1, 1,
0.740731, 0.2365481, 2.306346, 0, 0, 1, 1, 1,
0.7439791, -1.128421, 2.861725, 1, 0, 0, 1, 1,
0.750572, -1.637155, 2.328769, 1, 0, 0, 1, 1,
0.7581863, 0.6651943, 1.14908, 1, 0, 0, 1, 1,
0.767644, -0.997263, 2.88799, 1, 0, 0, 1, 1,
0.7679185, 0.8955725, 0.8438305, 1, 0, 0, 1, 1,
0.7680904, -0.8355546, 1.827377, 0, 0, 0, 1, 1,
0.7744179, -1.024652, 1.178056, 0, 0, 0, 1, 1,
0.7758592, -0.5197568, 1.572827, 0, 0, 0, 1, 1,
0.7772304, -0.5104232, 2.348232, 0, 0, 0, 1, 1,
0.7810401, -1.990259, 3.728486, 0, 0, 0, 1, 1,
0.7838929, 0.06551154, 0.3070821, 0, 0, 0, 1, 1,
0.7839994, 0.5755686, 1.730059, 0, 0, 0, 1, 1,
0.7865679, -0.01819149, 1.603212, 1, 1, 1, 1, 1,
0.786666, 1.705474, -0.7038153, 1, 1, 1, 1, 1,
0.7878559, -0.1019736, 0.4336279, 1, 1, 1, 1, 1,
0.7909217, 0.3725192, -0.2319225, 1, 1, 1, 1, 1,
0.796046, -0.5935181, 2.436885, 1, 1, 1, 1, 1,
0.804426, 0.3234799, 2.047354, 1, 1, 1, 1, 1,
0.8096129, -0.5810271, 1.844703, 1, 1, 1, 1, 1,
0.810384, 0.3062644, 1.264821, 1, 1, 1, 1, 1,
0.8167289, 0.2749479, 1.328968, 1, 1, 1, 1, 1,
0.8212303, -0.04917592, 1.540726, 1, 1, 1, 1, 1,
0.8293675, -0.6614592, 2.007715, 1, 1, 1, 1, 1,
0.8325145, 0.9200431, 2.894274, 1, 1, 1, 1, 1,
0.8336014, -1.72786, 2.986195, 1, 1, 1, 1, 1,
0.8339471, 0.7748234, -0.3457762, 1, 1, 1, 1, 1,
0.837848, -0.6937549, 3.09978, 1, 1, 1, 1, 1,
0.8409156, -0.1030388, 0.7348925, 0, 0, 1, 1, 1,
0.8411169, 0.5951164, 1.418765, 1, 0, 0, 1, 1,
0.8455544, -0.5293415, 1.799715, 1, 0, 0, 1, 1,
0.8471342, 0.9851326, 0.4461016, 1, 0, 0, 1, 1,
0.8486457, 0.3410814, 0.4692338, 1, 0, 0, 1, 1,
0.8623416, 0.2595819, 3.180396, 1, 0, 0, 1, 1,
0.866888, -0.6331862, 2.482159, 0, 0, 0, 1, 1,
0.8737271, -0.3391675, 2.052038, 0, 0, 0, 1, 1,
0.8741146, -0.7339303, 0.8520424, 0, 0, 0, 1, 1,
0.8748546, 0.3089096, 2.910081, 0, 0, 0, 1, 1,
0.8847452, -0.1058094, 1.421566, 0, 0, 0, 1, 1,
0.8884742, -1.394013, 3.241966, 0, 0, 0, 1, 1,
0.8900807, 0.1071626, 1.264084, 0, 0, 0, 1, 1,
0.8913525, 1.686842, 1.037661, 1, 1, 1, 1, 1,
0.8916148, 1.356889, -1.154023, 1, 1, 1, 1, 1,
0.8946921, -1.207916, 1.685636, 1, 1, 1, 1, 1,
0.898973, -0.5815653, 2.336974, 1, 1, 1, 1, 1,
0.9057564, -1.015608, 1.371153, 1, 1, 1, 1, 1,
0.9080958, 0.2759627, 0.9779435, 1, 1, 1, 1, 1,
0.9085046, -0.1114626, 2.380569, 1, 1, 1, 1, 1,
0.9102112, 1.466552, 0.9425632, 1, 1, 1, 1, 1,
0.9123879, -1.620886, 3.279904, 1, 1, 1, 1, 1,
0.9212296, 0.8772588, 1.798291, 1, 1, 1, 1, 1,
0.9225661, 0.1155127, 1.844548, 1, 1, 1, 1, 1,
0.9243278, 2.517516, 1.189263, 1, 1, 1, 1, 1,
0.9269254, -0.9013633, 2.657716, 1, 1, 1, 1, 1,
0.9306747, -0.05642493, 1.470031, 1, 1, 1, 1, 1,
0.9313999, 1.296087, 0.6004559, 1, 1, 1, 1, 1,
0.931621, 0.498978, 0.2717041, 0, 0, 1, 1, 1,
0.9320403, -0.1989312, 4.527312, 1, 0, 0, 1, 1,
0.9346985, 0.4976358, 0.7262985, 1, 0, 0, 1, 1,
0.9378632, -0.3158576, 3.388719, 1, 0, 0, 1, 1,
0.9387764, -0.2676675, 2.378462, 1, 0, 0, 1, 1,
0.9416256, -0.05023124, 3.691868, 1, 0, 0, 1, 1,
0.9417443, 1.571775, -0.7507431, 0, 0, 0, 1, 1,
0.9431084, 1.250049, 0.1147232, 0, 0, 0, 1, 1,
0.9630342, -0.4961835, 2.365592, 0, 0, 0, 1, 1,
0.9677966, -0.5318847, 2.540299, 0, 0, 0, 1, 1,
0.9839647, 0.7840609, 0.09753517, 0, 0, 0, 1, 1,
0.984313, -1.063712, 1.316807, 0, 0, 0, 1, 1,
0.9853207, -0.5781353, 1.146276, 0, 0, 0, 1, 1,
0.9907534, 1.805565, 0.8604401, 1, 1, 1, 1, 1,
1.007861, -0.5618208, 1.463296, 1, 1, 1, 1, 1,
1.014203, 0.5349343, 2.482723, 1, 1, 1, 1, 1,
1.016038, 1.134948, -0.2577028, 1, 1, 1, 1, 1,
1.016739, -1.956635, 3.785911, 1, 1, 1, 1, 1,
1.01739, 0.01960273, 1.176486, 1, 1, 1, 1, 1,
1.018248, -1.203361, 1.703428, 1, 1, 1, 1, 1,
1.026526, -1.084721, 2.93525, 1, 1, 1, 1, 1,
1.029029, 0.2266323, 0.9768904, 1, 1, 1, 1, 1,
1.032728, 1.408611, 0.5541191, 1, 1, 1, 1, 1,
1.034326, 1.521612, 0.531058, 1, 1, 1, 1, 1,
1.034567, 0.4280536, 2.425917, 1, 1, 1, 1, 1,
1.039612, 1.108602, 0.4186183, 1, 1, 1, 1, 1,
1.041696, 1.521834, 0.7107396, 1, 1, 1, 1, 1,
1.043955, 0.8562775, 1.451195, 1, 1, 1, 1, 1,
1.04511, 0.7892102, 0.2324092, 0, 0, 1, 1, 1,
1.05082, 1.185889, 1.478656, 1, 0, 0, 1, 1,
1.056881, 0.2293464, 2.410395, 1, 0, 0, 1, 1,
1.060646, 0.2711464, 3.089574, 1, 0, 0, 1, 1,
1.064735, -0.6942511, 2.386, 1, 0, 0, 1, 1,
1.066167, 0.7862695, 1.285695, 1, 0, 0, 1, 1,
1.080239, -1.713759, 3.390214, 0, 0, 0, 1, 1,
1.090791, 1.841511, 1.244277, 0, 0, 0, 1, 1,
1.094881, 2.025406, -0.08200866, 0, 0, 0, 1, 1,
1.097403, 0.3094629, 2.679916, 0, 0, 0, 1, 1,
1.099678, -0.04749285, 1.454609, 0, 0, 0, 1, 1,
1.099751, -0.6254475, 1.800287, 0, 0, 0, 1, 1,
1.101974, 1.278467, 1.010387, 0, 0, 0, 1, 1,
1.105163, 0.02628506, 1.867026, 1, 1, 1, 1, 1,
1.11318, 0.6491404, 1.057932, 1, 1, 1, 1, 1,
1.117769, 0.08552679, 2.611527, 1, 1, 1, 1, 1,
1.119305, -1.126674, 1.752191, 1, 1, 1, 1, 1,
1.138382, -1.879523, 1.60997, 1, 1, 1, 1, 1,
1.139757, 1.841686, 1.307838, 1, 1, 1, 1, 1,
1.144659, -1.691284, 1.393647, 1, 1, 1, 1, 1,
1.145568, 0.07797855, 0.3520305, 1, 1, 1, 1, 1,
1.147614, 0.7075187, -0.7000524, 1, 1, 1, 1, 1,
1.156159, 1.00107, 1.631283, 1, 1, 1, 1, 1,
1.158332, 0.5928802, 0.9329723, 1, 1, 1, 1, 1,
1.168886, -0.1268857, 0.6778926, 1, 1, 1, 1, 1,
1.184155, 0.4403866, -0.170568, 1, 1, 1, 1, 1,
1.195739, -1.413018, 2.109101, 1, 1, 1, 1, 1,
1.200974, -0.5062516, 1.238091, 1, 1, 1, 1, 1,
1.204472, -0.6236138, 3.049995, 0, 0, 1, 1, 1,
1.206401, -0.0964404, 0.4412785, 1, 0, 0, 1, 1,
1.210941, 1.811566, 0.3769656, 1, 0, 0, 1, 1,
1.211004, -1.280334, 3.503865, 1, 0, 0, 1, 1,
1.219324, -0.9737426, 3.242898, 1, 0, 0, 1, 1,
1.228673, -1.498617, 1.82613, 1, 0, 0, 1, 1,
1.233776, 0.834403, 0.667133, 0, 0, 0, 1, 1,
1.236725, -1.277444, 3.483362, 0, 0, 0, 1, 1,
1.237274, 0.2004793, 2.14756, 0, 0, 0, 1, 1,
1.240376, -0.5146685, 1.498009, 0, 0, 0, 1, 1,
1.242228, -0.1198115, 1.592841, 0, 0, 0, 1, 1,
1.248128, -0.847192, 1.15894, 0, 0, 0, 1, 1,
1.251534, 0.5620869, 1.795656, 0, 0, 0, 1, 1,
1.265408, 0.3663486, 1.36213, 1, 1, 1, 1, 1,
1.282815, 0.2078568, 0.976369, 1, 1, 1, 1, 1,
1.291715, -0.5532404, 1.683945, 1, 1, 1, 1, 1,
1.293647, -0.7823171, 3.0847, 1, 1, 1, 1, 1,
1.314522, 1.676593, 0.02795777, 1, 1, 1, 1, 1,
1.316837, 0.3980957, 2.128249, 1, 1, 1, 1, 1,
1.32071, -0.5366017, 1.645885, 1, 1, 1, 1, 1,
1.322071, -0.3365922, -0.8158546, 1, 1, 1, 1, 1,
1.323151, -0.4341149, 0.8028502, 1, 1, 1, 1, 1,
1.326873, 0.605705, 2.220744, 1, 1, 1, 1, 1,
1.332495, 2.503124, -1.090182, 1, 1, 1, 1, 1,
1.342335, -0.6838435, 2.965599, 1, 1, 1, 1, 1,
1.345492, 1.635811, 0.5842652, 1, 1, 1, 1, 1,
1.346224, -3.065689, 3.055726, 1, 1, 1, 1, 1,
1.347987, -0.01349698, 2.101213, 1, 1, 1, 1, 1,
1.351076, 0.5032591, 1.23406, 0, 0, 1, 1, 1,
1.354661, 1.061198, 1.839335, 1, 0, 0, 1, 1,
1.368437, -1.416913, 2.294543, 1, 0, 0, 1, 1,
1.371407, 0.002600006, 2.469154, 1, 0, 0, 1, 1,
1.389914, 0.1499503, 1.994614, 1, 0, 0, 1, 1,
1.391075, -0.1270116, 0.6870376, 1, 0, 0, 1, 1,
1.402037, -1.606731, 3.697212, 0, 0, 0, 1, 1,
1.405918, -2.004035, 1.046368, 0, 0, 0, 1, 1,
1.408489, -1.216728, 2.297863, 0, 0, 0, 1, 1,
1.433478, -0.9328788, 2.390583, 0, 0, 0, 1, 1,
1.436126, -1.465553, 0.5951524, 0, 0, 0, 1, 1,
1.447913, 0.8425657, 0.6088522, 0, 0, 0, 1, 1,
1.449514, -1.361987, 0.6919962, 0, 0, 0, 1, 1,
1.4687, 0.7522158, -0.474127, 1, 1, 1, 1, 1,
1.501055, 2.03059, 0.7519228, 1, 1, 1, 1, 1,
1.503227, 0.713633, 0.1070748, 1, 1, 1, 1, 1,
1.505173, 0.7202925, 2.302554, 1, 1, 1, 1, 1,
1.506999, 0.8234848, -0.6415262, 1, 1, 1, 1, 1,
1.509173, 0.7987179, 0.7655429, 1, 1, 1, 1, 1,
1.511754, -0.1167715, 2.521899, 1, 1, 1, 1, 1,
1.554152, 0.3108668, 2.146114, 1, 1, 1, 1, 1,
1.569816, -0.03755344, 2.789868, 1, 1, 1, 1, 1,
1.571869, 0.4088087, 1.15668, 1, 1, 1, 1, 1,
1.577325, 0.006722206, 3.195355, 1, 1, 1, 1, 1,
1.587749, 0.2588293, 1.056588, 1, 1, 1, 1, 1,
1.592245, 0.3406226, 0.6724178, 1, 1, 1, 1, 1,
1.656332, -0.01274492, 1.400473, 1, 1, 1, 1, 1,
1.674727, 0.2148215, 1.309121, 1, 1, 1, 1, 1,
1.675567, -1.435931, 1.278609, 0, 0, 1, 1, 1,
1.696324, 0.2838666, 2.691226, 1, 0, 0, 1, 1,
1.700699, -1.001127, 0.2080238, 1, 0, 0, 1, 1,
1.719756, 1.074962, -0.1988675, 1, 0, 0, 1, 1,
1.722357, 0.2252102, 0.6931045, 1, 0, 0, 1, 1,
1.729095, 1.224922, 0.7648942, 1, 0, 0, 1, 1,
1.741194, 1.910508, 0.8407247, 0, 0, 0, 1, 1,
1.793499, 0.1780749, 1.703588, 0, 0, 0, 1, 1,
1.803684, -0.1451306, -0.1209255, 0, 0, 0, 1, 1,
1.805175, -0.5436279, 1.851421, 0, 0, 0, 1, 1,
1.806739, -0.3073255, 1.99079, 0, 0, 0, 1, 1,
1.852949, -0.128547, 1.435698, 0, 0, 0, 1, 1,
1.872254, -1.55338, 3.181338, 0, 0, 0, 1, 1,
1.872762, 1.639647, 1.758849, 1, 1, 1, 1, 1,
1.911073, 1.382044, 0.7802745, 1, 1, 1, 1, 1,
1.943002, -1.10436, 2.407426, 1, 1, 1, 1, 1,
1.953794, -0.463197, 2.113045, 1, 1, 1, 1, 1,
1.964743, 1.276084, -0.545723, 1, 1, 1, 1, 1,
1.965563, -0.5836532, 3.295773, 1, 1, 1, 1, 1,
2.042942, -0.6190625, 3.697109, 1, 1, 1, 1, 1,
2.064076, -0.5196293, 2.029262, 1, 1, 1, 1, 1,
2.079059, -0.3222778, 0.6896433, 1, 1, 1, 1, 1,
2.097554, 0.9528385, 0.1519819, 1, 1, 1, 1, 1,
2.097774, -1.676614, 1.178617, 1, 1, 1, 1, 1,
2.13877, 0.5782355, 1.587272, 1, 1, 1, 1, 1,
2.164743, -0.3014369, 1.901814, 1, 1, 1, 1, 1,
2.16521, 0.5729299, 1.301181, 1, 1, 1, 1, 1,
2.169798, 0.3575118, 0.3506677, 1, 1, 1, 1, 1,
2.21869, 1.907708, 0.5209899, 0, 0, 1, 1, 1,
2.236964, -0.5192912, -0.1781074, 1, 0, 0, 1, 1,
2.253752, -0.2150467, 1.915013, 1, 0, 0, 1, 1,
2.261943, 0.5553275, 1.006946, 1, 0, 0, 1, 1,
2.305469, 1.434515, 1.082022, 1, 0, 0, 1, 1,
2.314561, -1.371269, 1.747217, 1, 0, 0, 1, 1,
2.325848, -1.294668, 1.044836, 0, 0, 0, 1, 1,
2.353349, 0.05437267, 4.233696, 0, 0, 0, 1, 1,
2.369006, 1.46002, 0.9451346, 0, 0, 0, 1, 1,
2.410823, 2.277818, 1.60411, 0, 0, 0, 1, 1,
2.412563, 0.3100808, 1.179924, 0, 0, 0, 1, 1,
2.421112, -0.4019267, 1.075498, 0, 0, 0, 1, 1,
2.463255, 0.9655112, 0.2156851, 0, 0, 0, 1, 1,
2.505118, 0.6280749, 1.978185, 1, 1, 1, 1, 1,
2.585801, 0.9342623, 1.082215, 1, 1, 1, 1, 1,
2.589478, 0.5275661, 1.587466, 1, 1, 1, 1, 1,
2.611255, 0.9673614, 1.381445, 1, 1, 1, 1, 1,
2.648742, 1.171153, 2.168724, 1, 1, 1, 1, 1,
2.687373, 0.286432, 2.344264, 1, 1, 1, 1, 1,
2.886374, -0.4552582, -0.2072566, 1, 1, 1, 1, 1
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
var radius = 9.575958;
var distance = 33.63514;
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
mvMatrix.translate( 0.319141, -0.3668456, -0.135679 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.63514);
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