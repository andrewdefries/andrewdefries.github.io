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
-3.284351, -1.750796, -1.473144, 1, 0, 0, 1,
-3.27139, 0.01264117, -2.237656, 1, 0.007843138, 0, 1,
-2.980416, -1.373724, 1.093695, 1, 0.01176471, 0, 1,
-2.895111, -0.09929407, -0.1664453, 1, 0.01960784, 0, 1,
-2.844045, 0.2995894, -2.026528, 1, 0.02352941, 0, 1,
-2.810672, -1.768709, -1.943215, 1, 0.03137255, 0, 1,
-2.78962, 0.5253711, -1.288654, 1, 0.03529412, 0, 1,
-2.676234, 0.7893031, -1.372846, 1, 0.04313726, 0, 1,
-2.618424, -0.1740041, -2.802998, 1, 0.04705882, 0, 1,
-2.615896, 1.214938, -0.1999782, 1, 0.05490196, 0, 1,
-2.612489, -0.6224285, -1.223584, 1, 0.05882353, 0, 1,
-2.571468, 0.5288886, -1.954207, 1, 0.06666667, 0, 1,
-2.529278, -1.20549, -1.831886, 1, 0.07058824, 0, 1,
-2.47156, -0.4937617, -1.776477, 1, 0.07843138, 0, 1,
-2.462593, 0.05476996, -0.7582421, 1, 0.08235294, 0, 1,
-2.409329, 1.132491, -1.459835, 1, 0.09019608, 0, 1,
-2.319428, -0.9051548, -2.329028, 1, 0.09411765, 0, 1,
-2.302467, 1.228395, -1.108926, 1, 0.1019608, 0, 1,
-2.277726, 0.7331114, 0.002325104, 1, 0.1098039, 0, 1,
-2.198556, 1.007554, -2.779276, 1, 0.1137255, 0, 1,
-2.164871, -0.7334643, -2.529693, 1, 0.1215686, 0, 1,
-2.14808, -1.437214, -3.886693, 1, 0.1254902, 0, 1,
-2.131054, 0.349339, -0.8546287, 1, 0.1333333, 0, 1,
-2.081285, 0.5736364, -2.296287, 1, 0.1372549, 0, 1,
-2.057657, -1.232593, -0.8454998, 1, 0.145098, 0, 1,
-2.023353, -0.4933605, -2.373033, 1, 0.1490196, 0, 1,
-2.016557, -0.405946, -1.713561, 1, 0.1568628, 0, 1,
-1.964447, 0.7650236, -2.337717, 1, 0.1607843, 0, 1,
-1.960602, -0.3966537, -1.749231, 1, 0.1686275, 0, 1,
-1.934153, 1.45457, -1.170255, 1, 0.172549, 0, 1,
-1.913171, -1.010538, -2.27696, 1, 0.1803922, 0, 1,
-1.888354, 0.3967975, -0.9888051, 1, 0.1843137, 0, 1,
-1.868554, -2.386235, -1.394095, 1, 0.1921569, 0, 1,
-1.838124, -0.4072253, -0.7187492, 1, 0.1960784, 0, 1,
-1.789562, -2.401689, -2.40211, 1, 0.2039216, 0, 1,
-1.780896, 0.9404708, -2.045697, 1, 0.2117647, 0, 1,
-1.780003, 1.278244, -0.6281182, 1, 0.2156863, 0, 1,
-1.762289, 0.7290665, -1.264746, 1, 0.2235294, 0, 1,
-1.733903, -0.1897645, -1.732286, 1, 0.227451, 0, 1,
-1.711557, 1.157454, -0.05929292, 1, 0.2352941, 0, 1,
-1.704069, 1.000485, 0.07987139, 1, 0.2392157, 0, 1,
-1.70192, 0.05672441, -1.524966, 1, 0.2470588, 0, 1,
-1.689112, -1.675638, -1.209944, 1, 0.2509804, 0, 1,
-1.679206, -0.5723115, -2.204859, 1, 0.2588235, 0, 1,
-1.669827, -0.02917468, -1.20192, 1, 0.2627451, 0, 1,
-1.633918, -1.363389, -3.328944, 1, 0.2705882, 0, 1,
-1.62968, 0.6756626, 0.1424023, 1, 0.2745098, 0, 1,
-1.624327, 0.546959, -1.929541, 1, 0.282353, 0, 1,
-1.619897, -1.711091, -2.747731, 1, 0.2862745, 0, 1,
-1.618367, -1.508544, -1.945631, 1, 0.2941177, 0, 1,
-1.615813, -0.6680075, -1.268189, 1, 0.3019608, 0, 1,
-1.610146, -1.0104, -3.632856, 1, 0.3058824, 0, 1,
-1.591434, -0.07847894, -3.588489, 1, 0.3137255, 0, 1,
-1.580356, -0.534941, -1.789101, 1, 0.3176471, 0, 1,
-1.570143, -1.183526, -2.630006, 1, 0.3254902, 0, 1,
-1.566244, 0.2275873, -1.424169, 1, 0.3294118, 0, 1,
-1.560505, -0.9675297, -2.143378, 1, 0.3372549, 0, 1,
-1.559732, 0.5594698, -0.7793653, 1, 0.3411765, 0, 1,
-1.55202, -1.586202, -2.694925, 1, 0.3490196, 0, 1,
-1.544307, -2.041322, -2.245552, 1, 0.3529412, 0, 1,
-1.540546, -0.1206582, -0.9001399, 1, 0.3607843, 0, 1,
-1.520777, 0.9934154, 0.1464687, 1, 0.3647059, 0, 1,
-1.519585, 0.4228472, -2.396706, 1, 0.372549, 0, 1,
-1.518984, 2.117496, -0.3946432, 1, 0.3764706, 0, 1,
-1.51328, 0.3059204, -0.8194696, 1, 0.3843137, 0, 1,
-1.507742, -0.7520793, -4.532529, 1, 0.3882353, 0, 1,
-1.490548, 1.324048, 0.5769795, 1, 0.3960784, 0, 1,
-1.490375, -1.382753, -2.220883, 1, 0.4039216, 0, 1,
-1.489336, 1.803294, -1.437396, 1, 0.4078431, 0, 1,
-1.48736, -0.2520593, -0.06325627, 1, 0.4156863, 0, 1,
-1.483563, -1.280939, -2.438812, 1, 0.4196078, 0, 1,
-1.473741, -0.4323663, -3.211154, 1, 0.427451, 0, 1,
-1.46635, -1.012525, -0.2775171, 1, 0.4313726, 0, 1,
-1.454138, 0.323637, -1.133363, 1, 0.4392157, 0, 1,
-1.442068, 0.2138044, -1.757803, 1, 0.4431373, 0, 1,
-1.415758, 1.959701, -0.2255695, 1, 0.4509804, 0, 1,
-1.415603, -0.5505819, -0.01518791, 1, 0.454902, 0, 1,
-1.412929, -0.8178854, -1.183511, 1, 0.4627451, 0, 1,
-1.404313, 0.5818811, 0.2601577, 1, 0.4666667, 0, 1,
-1.386794, -0.8546904, -2.326872, 1, 0.4745098, 0, 1,
-1.382523, 0.0924233, -1.138611, 1, 0.4784314, 0, 1,
-1.379977, 1.569247, -0.2032066, 1, 0.4862745, 0, 1,
-1.378636, -0.6329313, -2.559283, 1, 0.4901961, 0, 1,
-1.373614, -0.3358176, -1.439949, 1, 0.4980392, 0, 1,
-1.345908, -1.631293, -0.7492279, 1, 0.5058824, 0, 1,
-1.335892, -0.3458266, -0.6821564, 1, 0.509804, 0, 1,
-1.335753, 0.3872075, -0.4780339, 1, 0.5176471, 0, 1,
-1.334299, -0.5353183, -1.572927, 1, 0.5215687, 0, 1,
-1.327208, 0.7284701, -1.019608, 1, 0.5294118, 0, 1,
-1.325369, -1.990883, -3.524328, 1, 0.5333334, 0, 1,
-1.322759, 0.5509306, -2.739228, 1, 0.5411765, 0, 1,
-1.317602, -1.080796, -4.544727, 1, 0.5450981, 0, 1,
-1.308809, 1.012134, -1.175299, 1, 0.5529412, 0, 1,
-1.304406, -1.364581, -1.968663, 1, 0.5568628, 0, 1,
-1.304275, -0.7421538, -1.038311, 1, 0.5647059, 0, 1,
-1.300977, -1.429605, -1.146992, 1, 0.5686275, 0, 1,
-1.296101, 0.4730208, -1.816547, 1, 0.5764706, 0, 1,
-1.296009, -0.537941, -3.427449, 1, 0.5803922, 0, 1,
-1.278345, 1.113372, 1.113698, 1, 0.5882353, 0, 1,
-1.277784, -0.04029524, -1.023045, 1, 0.5921569, 0, 1,
-1.27747, -1.807787, -3.287555, 1, 0.6, 0, 1,
-1.272022, -1.04795, -1.30025, 1, 0.6078432, 0, 1,
-1.258801, -0.8262285, -2.434835, 1, 0.6117647, 0, 1,
-1.258618, 1.278913, -0.5397268, 1, 0.6196079, 0, 1,
-1.258193, 0.9976126, -1.34543, 1, 0.6235294, 0, 1,
-1.257916, 0.1784433, -1.510709, 1, 0.6313726, 0, 1,
-1.255666, 1.021498, -0.9860463, 1, 0.6352941, 0, 1,
-1.248538, -0.4717511, -0.9119551, 1, 0.6431373, 0, 1,
-1.247201, -0.7222821, -1.900514, 1, 0.6470588, 0, 1,
-1.246722, 0.8434033, -0.2960033, 1, 0.654902, 0, 1,
-1.245026, -0.1078591, -1.744202, 1, 0.6588235, 0, 1,
-1.242334, 1.273804, -1.02476, 1, 0.6666667, 0, 1,
-1.231926, -3.306291, -3.223773, 1, 0.6705883, 0, 1,
-1.231304, -0.5785054, -1.563898, 1, 0.6784314, 0, 1,
-1.227848, -0.9063914, -2.243944, 1, 0.682353, 0, 1,
-1.220387, -1.218547, -2.982257, 1, 0.6901961, 0, 1,
-1.21816, 1.696146, -0.1499704, 1, 0.6941177, 0, 1,
-1.215372, 0.2391584, -1.147895, 1, 0.7019608, 0, 1,
-1.214328, -0.6678643, -2.156656, 1, 0.7098039, 0, 1,
-1.212977, 0.9351267, 0.6723021, 1, 0.7137255, 0, 1,
-1.206559, -0.002491486, -2.782047, 1, 0.7215686, 0, 1,
-1.206486, -1.626016, -2.470394, 1, 0.7254902, 0, 1,
-1.196587, -0.4132971, -2.519193, 1, 0.7333333, 0, 1,
-1.193169, 0.747203, -1.720964, 1, 0.7372549, 0, 1,
-1.184978, 0.1099772, -2.573299, 1, 0.7450981, 0, 1,
-1.173692, 0.8565183, -1.687816, 1, 0.7490196, 0, 1,
-1.170597, 0.5440257, -2.162555, 1, 0.7568628, 0, 1,
-1.15932, 1.082859, -0.04767147, 1, 0.7607843, 0, 1,
-1.152459, 0.3918442, -3.216884, 1, 0.7686275, 0, 1,
-1.152252, 1.281165, -0.135933, 1, 0.772549, 0, 1,
-1.144883, 0.09624127, -1.110039, 1, 0.7803922, 0, 1,
-1.144821, 0.09150685, -1.361327, 1, 0.7843137, 0, 1,
-1.131712, 1.322549, -1.444227, 1, 0.7921569, 0, 1,
-1.130487, -0.5665696, -2.610343, 1, 0.7960784, 0, 1,
-1.124572, -1.561104, -2.655808, 1, 0.8039216, 0, 1,
-1.123358, -2.472012, -3.454712, 1, 0.8117647, 0, 1,
-1.12018, -0.4652573, -1.979241, 1, 0.8156863, 0, 1,
-1.118808, 0.2051941, -0.6126314, 1, 0.8235294, 0, 1,
-1.117628, 1.379244, 0.2189929, 1, 0.827451, 0, 1,
-1.112873, -1.121557, -2.894802, 1, 0.8352941, 0, 1,
-1.108258, -1.323968, -3.895434, 1, 0.8392157, 0, 1,
-1.096806, 0.3652442, -1.106919, 1, 0.8470588, 0, 1,
-1.088191, 0.09537616, -1.318547, 1, 0.8509804, 0, 1,
-1.083345, -0.1818745, -2.742303, 1, 0.8588235, 0, 1,
-1.082381, 0.4474318, -2.19642, 1, 0.8627451, 0, 1,
-1.074101, -1.894177, -2.575134, 1, 0.8705882, 0, 1,
-1.066806, -0.7363936, -1.963392, 1, 0.8745098, 0, 1,
-1.065936, -0.7656003, -0.09359966, 1, 0.8823529, 0, 1,
-1.048384, -0.154256, -0.8215491, 1, 0.8862745, 0, 1,
-1.0439, 1.411886, -1.332295, 1, 0.8941177, 0, 1,
-1.042673, -1.116471, -2.376493, 1, 0.8980392, 0, 1,
-1.041563, -0.2467524, -0.6430042, 1, 0.9058824, 0, 1,
-1.033391, 1.365078, -1.012566, 1, 0.9137255, 0, 1,
-1.031222, -0.6810598, -2.442105, 1, 0.9176471, 0, 1,
-1.02534, -0.5728665, -1.483573, 1, 0.9254902, 0, 1,
-1.022792, 1.236057, 0.2431165, 1, 0.9294118, 0, 1,
-1.021801, -0.5422929, -3.301326, 1, 0.9372549, 0, 1,
-1.020732, -0.1844008, -3.865429, 1, 0.9411765, 0, 1,
-1.017358, 1.059725, -0.6475965, 1, 0.9490196, 0, 1,
-1.014055, 0.7112904, -1.640709, 1, 0.9529412, 0, 1,
-1.0023, 0.7382241, -1.240722, 1, 0.9607843, 0, 1,
-0.9995417, 1.211365, -0.6097549, 1, 0.9647059, 0, 1,
-0.9992898, -1.63457, -1.742106, 1, 0.972549, 0, 1,
-0.9990854, 0.5767207, -0.1847827, 1, 0.9764706, 0, 1,
-0.9972978, -1.334326, -2.310018, 1, 0.9843137, 0, 1,
-0.9930935, 0.2228669, -1.74448, 1, 0.9882353, 0, 1,
-0.9908991, 0.5036196, -1.752955, 1, 0.9960784, 0, 1,
-0.9843241, 0.857058, -1.743819, 0.9960784, 1, 0, 1,
-0.9821156, 0.06341458, -1.487682, 0.9921569, 1, 0, 1,
-0.9804825, -0.1298252, -1.006489, 0.9843137, 1, 0, 1,
-0.969691, -1.117558, -4.666111, 0.9803922, 1, 0, 1,
-0.9660293, -0.5807927, -0.3949651, 0.972549, 1, 0, 1,
-0.9650596, -0.7136816, -1.926579, 0.9686275, 1, 0, 1,
-0.9612722, 0.8851573, -1.451753, 0.9607843, 1, 0, 1,
-0.9606838, -1.592657, -1.763574, 0.9568627, 1, 0, 1,
-0.960394, 1.456769, -0.4564827, 0.9490196, 1, 0, 1,
-0.9508114, -0.771038, -1.465915, 0.945098, 1, 0, 1,
-0.9471706, 0.3277691, -2.458087, 0.9372549, 1, 0, 1,
-0.9459524, 0.8520237, -2.308564, 0.9333333, 1, 0, 1,
-0.9443479, -0.1356484, -2.135793, 0.9254902, 1, 0, 1,
-0.9436297, 0.2298979, -2.755777, 0.9215686, 1, 0, 1,
-0.9231128, -1.033806, -2.037331, 0.9137255, 1, 0, 1,
-0.9084537, 1.363672, -0.6198163, 0.9098039, 1, 0, 1,
-0.900354, -1.925547, -1.238419, 0.9019608, 1, 0, 1,
-0.8966511, -1.255404, -2.594727, 0.8941177, 1, 0, 1,
-0.8932441, -1.26151, -3.357988, 0.8901961, 1, 0, 1,
-0.8868061, 1.434744, -1.912119, 0.8823529, 1, 0, 1,
-0.88495, -1.30448, -1.441881, 0.8784314, 1, 0, 1,
-0.8842065, 1.683127, -0.8660709, 0.8705882, 1, 0, 1,
-0.8824914, -0.4559375, -3.258372, 0.8666667, 1, 0, 1,
-0.882035, -0.2831075, -2.632491, 0.8588235, 1, 0, 1,
-0.8727527, -1.160337, -0.9139099, 0.854902, 1, 0, 1,
-0.8720818, -1.227265, -2.708116, 0.8470588, 1, 0, 1,
-0.8676751, -1.25126, -3.044352, 0.8431373, 1, 0, 1,
-0.8660011, -1.118326, -0.8851818, 0.8352941, 1, 0, 1,
-0.8647572, 0.5089687, -1.717809, 0.8313726, 1, 0, 1,
-0.8642157, 0.2067201, -2.302077, 0.8235294, 1, 0, 1,
-0.8612195, -1.184925, -3.134859, 0.8196079, 1, 0, 1,
-0.8571298, 0.2233267, -3.420315, 0.8117647, 1, 0, 1,
-0.853266, -0.5911594, -2.695152, 0.8078431, 1, 0, 1,
-0.8531443, 0.3116308, -1.205465, 0.8, 1, 0, 1,
-0.851975, 1.639395, 4.042654, 0.7921569, 1, 0, 1,
-0.8486691, 2.453819, -0.7833586, 0.7882353, 1, 0, 1,
-0.8469753, 0.4161184, -0.4830073, 0.7803922, 1, 0, 1,
-0.8460518, 1.222419, -1.459787, 0.7764706, 1, 0, 1,
-0.8434746, -0.9853204, 0.06222046, 0.7686275, 1, 0, 1,
-0.8424233, -0.9644178, -2.32272, 0.7647059, 1, 0, 1,
-0.8385421, 0.05670702, -1.493399, 0.7568628, 1, 0, 1,
-0.8375371, 2.024372, -0.6582474, 0.7529412, 1, 0, 1,
-0.8310438, 0.8798314, -2.437937, 0.7450981, 1, 0, 1,
-0.8289654, -1.782715, -2.499395, 0.7411765, 1, 0, 1,
-0.8272032, -1.400756, -1.730386, 0.7333333, 1, 0, 1,
-0.8107502, 0.5408285, -1.974124, 0.7294118, 1, 0, 1,
-0.8064812, 2.907345, -1.415354, 0.7215686, 1, 0, 1,
-0.8058852, 0.8251673, -1.33715, 0.7176471, 1, 0, 1,
-0.8058519, 0.511742, -0.3077225, 0.7098039, 1, 0, 1,
-0.8052552, 0.1612181, 0.8159382, 0.7058824, 1, 0, 1,
-0.7966917, -0.1615993, -3.189952, 0.6980392, 1, 0, 1,
-0.7956498, 0.9321625, 1.102666, 0.6901961, 1, 0, 1,
-0.7837549, -0.6220192, -2.874269, 0.6862745, 1, 0, 1,
-0.7817477, -0.6653842, -1.577001, 0.6784314, 1, 0, 1,
-0.7798262, 0.4123827, 0.9551358, 0.6745098, 1, 0, 1,
-0.7796912, 2.170021, 0.5024585, 0.6666667, 1, 0, 1,
-0.7676845, 0.155215, -1.015576, 0.6627451, 1, 0, 1,
-0.7673995, 1.833655, -0.229619, 0.654902, 1, 0, 1,
-0.7667797, 0.8433279, -0.4134018, 0.6509804, 1, 0, 1,
-0.7665767, 0.5750757, -1.093453, 0.6431373, 1, 0, 1,
-0.7595973, 1.24327, 0.7143382, 0.6392157, 1, 0, 1,
-0.7515978, -2.792929, -1.936897, 0.6313726, 1, 0, 1,
-0.7452387, 0.1654896, -1.90819, 0.627451, 1, 0, 1,
-0.7445527, -0.2164168, -2.456839, 0.6196079, 1, 0, 1,
-0.7425762, -0.6156771, -2.824984, 0.6156863, 1, 0, 1,
-0.7414693, -0.6426073, -3.972702, 0.6078432, 1, 0, 1,
-0.7397103, -0.6858661, -2.323835, 0.6039216, 1, 0, 1,
-0.7262164, -0.2740771, 1.1013, 0.5960785, 1, 0, 1,
-0.7235237, -0.08842862, -1.707033, 0.5882353, 1, 0, 1,
-0.7109608, 0.363833, 1.4657, 0.5843138, 1, 0, 1,
-0.7051345, 1.427107, -2.192551, 0.5764706, 1, 0, 1,
-0.7029681, 0.6437764, -0.930478, 0.572549, 1, 0, 1,
-0.6952944, 0.4338419, -1.247573, 0.5647059, 1, 0, 1,
-0.6837053, -0.4482553, -0.8653443, 0.5607843, 1, 0, 1,
-0.6821285, 1.607573, -1.284452, 0.5529412, 1, 0, 1,
-0.6798768, 1.32539, -0.7720732, 0.5490196, 1, 0, 1,
-0.6786538, -1.376054, -2.618456, 0.5411765, 1, 0, 1,
-0.6780968, 1.451556, -0.09066293, 0.5372549, 1, 0, 1,
-0.6766602, 0.08331035, -0.3031962, 0.5294118, 1, 0, 1,
-0.6701314, -0.9275379, -1.688303, 0.5254902, 1, 0, 1,
-0.6544734, 0.577866, -0.6976146, 0.5176471, 1, 0, 1,
-0.6525258, -0.679474, -3.471049, 0.5137255, 1, 0, 1,
-0.6459753, -0.6362664, -3.159024, 0.5058824, 1, 0, 1,
-0.6438145, 0.7577772, -1.322183, 0.5019608, 1, 0, 1,
-0.6396099, 0.09518845, -0.8022469, 0.4941176, 1, 0, 1,
-0.6394216, 0.6465629, 0.1855767, 0.4862745, 1, 0, 1,
-0.6357971, 0.4867674, -1.272131, 0.4823529, 1, 0, 1,
-0.6328586, 0.2432752, -0.724813, 0.4745098, 1, 0, 1,
-0.6319347, 0.9459742, 0.04906259, 0.4705882, 1, 0, 1,
-0.6312234, -1.729219, -2.976578, 0.4627451, 1, 0, 1,
-0.6260586, -0.04785112, -0.8411657, 0.4588235, 1, 0, 1,
-0.6214498, 0.6241654, -2.112529, 0.4509804, 1, 0, 1,
-0.6202873, 1.367694, -1.520727, 0.4470588, 1, 0, 1,
-0.6174747, 0.0272344, -3.057326, 0.4392157, 1, 0, 1,
-0.6131334, 0.9370324, -0.8030247, 0.4352941, 1, 0, 1,
-0.6092606, -1.007378, -3.284497, 0.427451, 1, 0, 1,
-0.6083441, -0.2012114, -3.029652, 0.4235294, 1, 0, 1,
-0.6076542, 0.4994016, -0.5929624, 0.4156863, 1, 0, 1,
-0.6049124, 0.01446758, -2.753947, 0.4117647, 1, 0, 1,
-0.6037016, -0.6728471, -2.877094, 0.4039216, 1, 0, 1,
-0.5963413, -0.4084138, -1.18006, 0.3960784, 1, 0, 1,
-0.5954019, 0.3831924, -0.2909945, 0.3921569, 1, 0, 1,
-0.5913001, -0.6122434, -2.472037, 0.3843137, 1, 0, 1,
-0.5830587, 0.9350654, 0.7297769, 0.3803922, 1, 0, 1,
-0.5815879, 0.08371705, -1.99023, 0.372549, 1, 0, 1,
-0.580063, -0.8889229, -4.035036, 0.3686275, 1, 0, 1,
-0.579413, -0.08215726, -2.413702, 0.3607843, 1, 0, 1,
-0.5781481, -1.681688, -3.736122, 0.3568628, 1, 0, 1,
-0.5650659, -1.320334, -3.137666, 0.3490196, 1, 0, 1,
-0.563436, 0.3807237, 0.6717728, 0.345098, 1, 0, 1,
-0.5631496, -0.4433385, -1.129219, 0.3372549, 1, 0, 1,
-0.5600928, 0.3115167, -1.401358, 0.3333333, 1, 0, 1,
-0.5598642, -0.3820003, -2.568523, 0.3254902, 1, 0, 1,
-0.55959, 1.155872, -1.243985, 0.3215686, 1, 0, 1,
-0.5539518, -0.7886578, -2.201339, 0.3137255, 1, 0, 1,
-0.5492141, 0.3484258, -1.276809, 0.3098039, 1, 0, 1,
-0.5454602, -0.919939, -1.728293, 0.3019608, 1, 0, 1,
-0.5415298, 0.576923, 0.4301904, 0.2941177, 1, 0, 1,
-0.5397331, 0.2194299, -1.323089, 0.2901961, 1, 0, 1,
-0.5380446, -0.5437566, -1.790736, 0.282353, 1, 0, 1,
-0.5370721, 0.2289762, -2.66573, 0.2784314, 1, 0, 1,
-0.5339163, -0.6115587, -1.755917, 0.2705882, 1, 0, 1,
-0.53046, 1.01872, 0.9632369, 0.2666667, 1, 0, 1,
-0.5284688, 0.6399639, 0.46446, 0.2588235, 1, 0, 1,
-0.5278875, -0.008841828, -1.623411, 0.254902, 1, 0, 1,
-0.5271273, -0.4160598, -2.763572, 0.2470588, 1, 0, 1,
-0.5257884, 0.4475579, 0.360773, 0.2431373, 1, 0, 1,
-0.5209826, 0.4121313, -1.332427, 0.2352941, 1, 0, 1,
-0.5207393, -0.002126153, 0.9207146, 0.2313726, 1, 0, 1,
-0.5196148, -0.9882995, -2.337814, 0.2235294, 1, 0, 1,
-0.51273, 0.3109198, -0.9553304, 0.2196078, 1, 0, 1,
-0.5117875, -0.6275655, -3.712718, 0.2117647, 1, 0, 1,
-0.5073134, -0.3395368, -4.086591, 0.2078431, 1, 0, 1,
-0.5003222, 2.677203, -0.0457489, 0.2, 1, 0, 1,
-0.4964023, -0.3211874, -2.209207, 0.1921569, 1, 0, 1,
-0.4946956, -1.582498, -4.031991, 0.1882353, 1, 0, 1,
-0.4899005, -0.2337368, -1.698105, 0.1803922, 1, 0, 1,
-0.4876901, 0.3641026, -2.008091, 0.1764706, 1, 0, 1,
-0.4823398, -0.732383, -1.599404, 0.1686275, 1, 0, 1,
-0.4821666, 0.9453692, -0.475851, 0.1647059, 1, 0, 1,
-0.481548, -1.46571, -2.721211, 0.1568628, 1, 0, 1,
-0.4772561, 1.174594, -3.032792, 0.1529412, 1, 0, 1,
-0.4733103, 0.2489649, -0.226413, 0.145098, 1, 0, 1,
-0.4653274, -0.02535975, -2.047148, 0.1411765, 1, 0, 1,
-0.4600877, 0.3931897, -1.077086, 0.1333333, 1, 0, 1,
-0.4540824, -0.7492411, -4.655075, 0.1294118, 1, 0, 1,
-0.4535465, -0.7017566, -3.722471, 0.1215686, 1, 0, 1,
-0.452363, 0.08764757, -2.099983, 0.1176471, 1, 0, 1,
-0.4514109, 0.5577713, -1.949908, 0.1098039, 1, 0, 1,
-0.4467469, 0.597715, 0.404945, 0.1058824, 1, 0, 1,
-0.4434391, -0.106697, -2.852529, 0.09803922, 1, 0, 1,
-0.4414912, 0.2241147, -2.164103, 0.09019608, 1, 0, 1,
-0.4330277, -0.04325292, -1.711725, 0.08627451, 1, 0, 1,
-0.4292901, -0.5304266, -1.600677, 0.07843138, 1, 0, 1,
-0.4272321, 0.7685669, -1.805795, 0.07450981, 1, 0, 1,
-0.4250956, -0.3849463, -1.75912, 0.06666667, 1, 0, 1,
-0.424547, 0.3661041, -0.6594491, 0.0627451, 1, 0, 1,
-0.4241539, 0.7092633, 0.1419352, 0.05490196, 1, 0, 1,
-0.4217963, -2.056433, -3.75123, 0.05098039, 1, 0, 1,
-0.4214187, -0.1876688, -1.422511, 0.04313726, 1, 0, 1,
-0.4147903, 1.295905, -2.841124, 0.03921569, 1, 0, 1,
-0.4139971, 0.6051551, -0.4111367, 0.03137255, 1, 0, 1,
-0.4135152, 0.03893519, -0.694915, 0.02745098, 1, 0, 1,
-0.4085982, 1.574822, -0.4765515, 0.01960784, 1, 0, 1,
-0.4042674, 0.901849, -0.06978799, 0.01568628, 1, 0, 1,
-0.3968388, 1.266712, -0.07685557, 0.007843138, 1, 0, 1,
-0.390314, -0.6524162, -1.397526, 0.003921569, 1, 0, 1,
-0.3891153, -0.58622, -2.625004, 0, 1, 0.003921569, 1,
-0.3823985, 0.5196526, -1.594102, 0, 1, 0.01176471, 1,
-0.3773672, 0.2227926, -2.354537, 0, 1, 0.01568628, 1,
-0.3747991, 1.223561, 0.06556054, 0, 1, 0.02352941, 1,
-0.3709584, 1.88604, -1.201754, 0, 1, 0.02745098, 1,
-0.370209, -1.119021, -1.965165, 0, 1, 0.03529412, 1,
-0.3686639, -0.1787792, -1.267166, 0, 1, 0.03921569, 1,
-0.3674287, 1.813721, -0.936061, 0, 1, 0.04705882, 1,
-0.3646758, 0.2157914, -2.279603, 0, 1, 0.05098039, 1,
-0.3642541, -1.965115, -1.385903, 0, 1, 0.05882353, 1,
-0.3594184, 0.8075695, -1.169645, 0, 1, 0.0627451, 1,
-0.3589368, 1.421953, 0.6242325, 0, 1, 0.07058824, 1,
-0.3570627, -1.381497, -3.395783, 0, 1, 0.07450981, 1,
-0.3497971, 0.9820571, -1.288879, 0, 1, 0.08235294, 1,
-0.3485216, 0.8046196, -0.6985667, 0, 1, 0.08627451, 1,
-0.3471579, 0.9269871, 0.1800054, 0, 1, 0.09411765, 1,
-0.3419894, -0.1588539, -3.016915, 0, 1, 0.1019608, 1,
-0.3416305, 1.049393, -0.1440861, 0, 1, 0.1058824, 1,
-0.3390302, 0.9796166, 1.108311, 0, 1, 0.1137255, 1,
-0.336573, 0.1877331, -2.047004, 0, 1, 0.1176471, 1,
-0.3314815, 1.402908, 0.6669622, 0, 1, 0.1254902, 1,
-0.3311516, 0.5909038, -1.110819, 0, 1, 0.1294118, 1,
-0.3280562, -0.148738, -1.676489, 0, 1, 0.1372549, 1,
-0.3254289, 1.567906, 0.4948937, 0, 1, 0.1411765, 1,
-0.3251462, -0.2491018, 0.9085681, 0, 1, 0.1490196, 1,
-0.3248481, 1.675176, 1.100144, 0, 1, 0.1529412, 1,
-0.3241798, -0.245805, -1.987051, 0, 1, 0.1607843, 1,
-0.3224031, 1.764515, 2.183633, 0, 1, 0.1647059, 1,
-0.3170429, 0.7843881, -0.2825083, 0, 1, 0.172549, 1,
-0.3120741, 0.9361544, 0.5102687, 0, 1, 0.1764706, 1,
-0.3111159, 0.6437715, -1.196651, 0, 1, 0.1843137, 1,
-0.3077725, -0.1664619, -2.477694, 0, 1, 0.1882353, 1,
-0.3058871, 0.05650547, -0.7182393, 0, 1, 0.1960784, 1,
-0.3028914, -0.1949171, -0.7718091, 0, 1, 0.2039216, 1,
-0.3021907, -0.7238023, -1.184791, 0, 1, 0.2078431, 1,
-0.3018608, 0.1218016, -0.2777092, 0, 1, 0.2156863, 1,
-0.3005778, 0.3423943, -0.6027874, 0, 1, 0.2196078, 1,
-0.2976021, 0.5395384, 1.077994, 0, 1, 0.227451, 1,
-0.2972856, -0.03330703, -0.1659155, 0, 1, 0.2313726, 1,
-0.2946829, 0.8389049, 1.136896, 0, 1, 0.2392157, 1,
-0.2895072, 0.1151159, -1.475598, 0, 1, 0.2431373, 1,
-0.2871145, 0.8467825, -1.051698, 0, 1, 0.2509804, 1,
-0.2841941, 1.279813, -0.4733198, 0, 1, 0.254902, 1,
-0.2826301, -0.3946335, -1.63713, 0, 1, 0.2627451, 1,
-0.2815307, 0.5512776, -1.162161, 0, 1, 0.2666667, 1,
-0.2807914, 0.9276723, -0.7293849, 0, 1, 0.2745098, 1,
-0.2801019, -0.6200961, -2.414924, 0, 1, 0.2784314, 1,
-0.2766347, -1.329706, -1.620955, 0, 1, 0.2862745, 1,
-0.2755419, -0.4956716, -1.940479, 0, 1, 0.2901961, 1,
-0.273828, -2.192968, -3.040683, 0, 1, 0.2980392, 1,
-0.2734908, -1.11086, -3.901979, 0, 1, 0.3058824, 1,
-0.2716429, -0.7816318, -2.109725, 0, 1, 0.3098039, 1,
-0.2710136, -0.2440553, -1.844383, 0, 1, 0.3176471, 1,
-0.2639013, -0.183584, -0.9485726, 0, 1, 0.3215686, 1,
-0.2636915, -0.01152713, -1.526808, 0, 1, 0.3294118, 1,
-0.2582403, 1.868224, 0.3390339, 0, 1, 0.3333333, 1,
-0.2581908, -1.764, -1.941326, 0, 1, 0.3411765, 1,
-0.2549388, -1.558381, -5.015097, 0, 1, 0.345098, 1,
-0.2529273, -0.4872934, -3.88923, 0, 1, 0.3529412, 1,
-0.2522911, -2.080898, -3.007175, 0, 1, 0.3568628, 1,
-0.2513669, -0.8744655, -2.844268, 0, 1, 0.3647059, 1,
-0.2508004, -0.1082829, -2.939315, 0, 1, 0.3686275, 1,
-0.2468183, -0.03083107, -3.279408, 0, 1, 0.3764706, 1,
-0.2448131, 0.8748513, -0.4794652, 0, 1, 0.3803922, 1,
-0.2403909, -0.1076116, -1.685961, 0, 1, 0.3882353, 1,
-0.2372022, 2.426801, 1.327539, 0, 1, 0.3921569, 1,
-0.2361857, -0.5956419, -1.641448, 0, 1, 0.4, 1,
-0.233597, -0.3518495, -1.998352, 0, 1, 0.4078431, 1,
-0.2325647, -0.9235064, -2.047119, 0, 1, 0.4117647, 1,
-0.2322125, -0.4937248, -2.900324, 0, 1, 0.4196078, 1,
-0.2266745, -0.5985798, -4.130317, 0, 1, 0.4235294, 1,
-0.2251726, 1.31678, 0.6906797, 0, 1, 0.4313726, 1,
-0.2235474, -1.474545, -2.177619, 0, 1, 0.4352941, 1,
-0.2224367, -0.6665359, -3.063383, 0, 1, 0.4431373, 1,
-0.2220215, -0.1764985, 0.1842331, 0, 1, 0.4470588, 1,
-0.2198424, -0.7648259, -2.57566, 0, 1, 0.454902, 1,
-0.2165521, -0.04533881, -1.111515, 0, 1, 0.4588235, 1,
-0.2136497, -0.5618125, -2.141587, 0, 1, 0.4666667, 1,
-0.2064778, 0.7782875, -0.3135783, 0, 1, 0.4705882, 1,
-0.2056737, -1.186194, -2.971519, 0, 1, 0.4784314, 1,
-0.2023118, 1.724139, 0.8061924, 0, 1, 0.4823529, 1,
-0.1957077, 1.774679, 1.472238, 0, 1, 0.4901961, 1,
-0.1955852, 0.4398787, 2.031301, 0, 1, 0.4941176, 1,
-0.1943954, 0.9143405, -1.728278, 0, 1, 0.5019608, 1,
-0.1903058, -0.88796, -4.770054, 0, 1, 0.509804, 1,
-0.1900298, 0.5253252, -1.599412, 0, 1, 0.5137255, 1,
-0.1864056, 1.117315, -0.7755478, 0, 1, 0.5215687, 1,
-0.1863047, 0.1918558, -0.7949728, 0, 1, 0.5254902, 1,
-0.182719, 0.6938621, -0.8430967, 0, 1, 0.5333334, 1,
-0.1773875, -0.6853755, -4.810744, 0, 1, 0.5372549, 1,
-0.1744833, -0.3333268, -2.448841, 0, 1, 0.5450981, 1,
-0.1706788, -0.02694735, -2.200836, 0, 1, 0.5490196, 1,
-0.167444, -0.5613957, -1.936305, 0, 1, 0.5568628, 1,
-0.1663217, -0.08425724, -2.295822, 0, 1, 0.5607843, 1,
-0.1663064, -0.837002, -0.6985546, 0, 1, 0.5686275, 1,
-0.1639344, -0.005762396, -1.601231, 0, 1, 0.572549, 1,
-0.1635099, 0.991817, -2.703675, 0, 1, 0.5803922, 1,
-0.1623545, 0.06248006, -2.344722, 0, 1, 0.5843138, 1,
-0.1619527, 0.474815, 0.6167749, 0, 1, 0.5921569, 1,
-0.1605653, -0.1258622, -2.822919, 0, 1, 0.5960785, 1,
-0.1599095, 0.9930648, -0.6423331, 0, 1, 0.6039216, 1,
-0.1511737, 0.6535362, 0.4710883, 0, 1, 0.6117647, 1,
-0.150204, 2.660851, -1.456589, 0, 1, 0.6156863, 1,
-0.1453552, 0.8671795, -0.8846139, 0, 1, 0.6235294, 1,
-0.1448201, -0.1533595, -0.476181, 0, 1, 0.627451, 1,
-0.1445066, -1.458425, -2.732253, 0, 1, 0.6352941, 1,
-0.1440871, -1.446872, -4.41784, 0, 1, 0.6392157, 1,
-0.1434135, -0.2799379, -1.661413, 0, 1, 0.6470588, 1,
-0.1428747, 0.3681374, -0.7601071, 0, 1, 0.6509804, 1,
-0.1427616, -0.1255516, -1.190336, 0, 1, 0.6588235, 1,
-0.1423699, 0.477069, 0.4075465, 0, 1, 0.6627451, 1,
-0.1375379, -1.98341, -3.081926, 0, 1, 0.6705883, 1,
-0.1374628, 0.8703912, 1.54451, 0, 1, 0.6745098, 1,
-0.1340296, 1.744082, 0.7978632, 0, 1, 0.682353, 1,
-0.1320102, 1.131944, -0.1947426, 0, 1, 0.6862745, 1,
-0.1279998, 1.25831, -3.046067, 0, 1, 0.6941177, 1,
-0.1277081, 1.262817, 0.0303331, 0, 1, 0.7019608, 1,
-0.1225679, -0.08039061, -3.164735, 0, 1, 0.7058824, 1,
-0.1214066, 0.7997082, -0.5244483, 0, 1, 0.7137255, 1,
-0.1181205, 0.1966637, 1.045489, 0, 1, 0.7176471, 1,
-0.1175256, 0.1189689, -1.450332, 0, 1, 0.7254902, 1,
-0.1170101, -0.8975835, -3.883801, 0, 1, 0.7294118, 1,
-0.110953, -2.063978, -4.299277, 0, 1, 0.7372549, 1,
-0.1102425, -0.2535706, -3.970299, 0, 1, 0.7411765, 1,
-0.1074244, -0.007159646, -1.782377, 0, 1, 0.7490196, 1,
-0.107304, 1.825749, 0.8217603, 0, 1, 0.7529412, 1,
-0.1043177, 0.6250142, 2.212183, 0, 1, 0.7607843, 1,
-0.102839, 0.2361512, 1.017087, 0, 1, 0.7647059, 1,
-0.1027598, -0.5492585, -4.758829, 0, 1, 0.772549, 1,
-0.09790828, -0.3231731, -2.410313, 0, 1, 0.7764706, 1,
-0.09403132, -0.1823465, -5.089747, 0, 1, 0.7843137, 1,
-0.08656774, -1.206794, -3.947793, 0, 1, 0.7882353, 1,
-0.08463173, -0.8934211, -2.735084, 0, 1, 0.7960784, 1,
-0.08454783, -0.01308533, -1.74343, 0, 1, 0.8039216, 1,
-0.08279536, -1.406927, -2.603025, 0, 1, 0.8078431, 1,
-0.08206651, 0.4083119, 0.2258203, 0, 1, 0.8156863, 1,
-0.08139466, -1.591206, -2.867398, 0, 1, 0.8196079, 1,
-0.06625609, 0.6913368, 1.761873, 0, 1, 0.827451, 1,
-0.06340791, 0.4335702, -0.02126039, 0, 1, 0.8313726, 1,
-0.06264041, -1.439839, -3.058154, 0, 1, 0.8392157, 1,
-0.06226979, 0.8768831, 1.142961, 0, 1, 0.8431373, 1,
-0.05848897, 0.8401275, -1.471527, 0, 1, 0.8509804, 1,
-0.05795483, -0.4427432, -2.889798, 0, 1, 0.854902, 1,
-0.05694307, -1.193934, -3.411362, 0, 1, 0.8627451, 1,
-0.05559806, 0.4130513, -0.8154987, 0, 1, 0.8666667, 1,
-0.05360429, -0.2482498, -3.693687, 0, 1, 0.8745098, 1,
-0.04153697, 0.4632478, 0.5955211, 0, 1, 0.8784314, 1,
-0.04046587, 0.9092364, 0.6148075, 0, 1, 0.8862745, 1,
-0.03515298, 0.2097455, -0.8105233, 0, 1, 0.8901961, 1,
-0.03352302, -0.5875455, -3.195716, 0, 1, 0.8980392, 1,
-0.03223639, 0.5010759, -1.244123, 0, 1, 0.9058824, 1,
-0.03158921, 0.184263, -1.42012, 0, 1, 0.9098039, 1,
-0.02949665, 0.1386349, -0.6010454, 0, 1, 0.9176471, 1,
-0.02904243, -0.1787387, -2.988652, 0, 1, 0.9215686, 1,
-0.0284523, -0.3517714, -3.286039, 0, 1, 0.9294118, 1,
-0.02778773, 0.9397759, -0.03761568, 0, 1, 0.9333333, 1,
-0.01782002, 0.2667264, -0.2370559, 0, 1, 0.9411765, 1,
-0.01733859, -0.780103, -4.98276, 0, 1, 0.945098, 1,
-0.01572771, 1.47811, 1.034773, 0, 1, 0.9529412, 1,
-0.01567418, -0.1916779, -3.365143, 0, 1, 0.9568627, 1,
-0.01421411, -0.1860469, -4.571353, 0, 1, 0.9647059, 1,
-0.01419474, 1.577438, 1.122831, 0, 1, 0.9686275, 1,
-0.01378187, 0.5236809, 0.05694076, 0, 1, 0.9764706, 1,
-0.01335972, -0.1792379, -4.775268, 0, 1, 0.9803922, 1,
-0.009818189, 0.2896436, 0.1328585, 0, 1, 0.9882353, 1,
-0.009028245, 0.8668281, -1.255646, 0, 1, 0.9921569, 1,
-0.007863196, 0.845814, 0.2878971, 0, 1, 1, 1,
-0.005353576, -1.447614, -3.244722, 0, 0.9921569, 1, 1,
-0.001208276, -0.2708263, -3.52061, 0, 0.9882353, 1, 1,
0.001304894, -0.3989681, 2.314812, 0, 0.9803922, 1, 1,
0.001559691, -0.651769, 2.284728, 0, 0.9764706, 1, 1,
0.001625351, -0.06364029, 3.33381, 0, 0.9686275, 1, 1,
0.002513678, 0.6915796, -0.4709271, 0, 0.9647059, 1, 1,
0.003014545, -0.1152807, 1.971683, 0, 0.9568627, 1, 1,
0.004911259, -0.0811744, 2.13098, 0, 0.9529412, 1, 1,
0.005435685, 0.4341336, -0.4599647, 0, 0.945098, 1, 1,
0.006812323, -1.157211, 3.780032, 0, 0.9411765, 1, 1,
0.007741808, 1.207793, 1.010864, 0, 0.9333333, 1, 1,
0.01449209, -0.4595952, 3.641901, 0, 0.9294118, 1, 1,
0.01496674, 1.49547, -1.275111, 0, 0.9215686, 1, 1,
0.01528738, -0.9454424, 3.701013, 0, 0.9176471, 1, 1,
0.01892242, -0.6272606, 2.892476, 0, 0.9098039, 1, 1,
0.02406085, 1.629321, 0.217627, 0, 0.9058824, 1, 1,
0.02518344, 0.9086559, 0.6781882, 0, 0.8980392, 1, 1,
0.02586049, 0.1865897, 0.3846689, 0, 0.8901961, 1, 1,
0.02946035, 1.204624, 0.5208467, 0, 0.8862745, 1, 1,
0.03648806, 0.5666012, 0.5510151, 0, 0.8784314, 1, 1,
0.03905451, 0.7730962, 0.2919322, 0, 0.8745098, 1, 1,
0.04342614, -0.6025481, 3.518972, 0, 0.8666667, 1, 1,
0.04417901, 2.352069, 0.8706914, 0, 0.8627451, 1, 1,
0.04727055, -0.7028158, 2.305821, 0, 0.854902, 1, 1,
0.04953002, 1.225446, 2.705019, 0, 0.8509804, 1, 1,
0.05145978, -0.438306, 3.648345, 0, 0.8431373, 1, 1,
0.05340004, -0.3208129, 4.134724, 0, 0.8392157, 1, 1,
0.05473872, 1.301646, 0.2477724, 0, 0.8313726, 1, 1,
0.05699931, -0.5251569, 3.505836, 0, 0.827451, 1, 1,
0.0613332, 0.8682408, -0.4650955, 0, 0.8196079, 1, 1,
0.06344143, -1.573532, 4.281312, 0, 0.8156863, 1, 1,
0.0637238, 0.4128048, 1.080477, 0, 0.8078431, 1, 1,
0.06949156, 0.6986479, 1.881499, 0, 0.8039216, 1, 1,
0.07040942, -0.01163493, 1.861136, 0, 0.7960784, 1, 1,
0.07864211, -0.04869545, 1.988016, 0, 0.7882353, 1, 1,
0.07912971, -0.3512268, 1.475955, 0, 0.7843137, 1, 1,
0.07951485, 1.106185, 0.6415645, 0, 0.7764706, 1, 1,
0.08255781, 0.3309176, 1.661886, 0, 0.772549, 1, 1,
0.08260278, 1.828075, 0.921677, 0, 0.7647059, 1, 1,
0.08317371, -0.9787467, 3.282457, 0, 0.7607843, 1, 1,
0.08493952, 0.8502145, -0.8660263, 0, 0.7529412, 1, 1,
0.08651154, 0.106619, 1.258578, 0, 0.7490196, 1, 1,
0.09242962, 0.6838546, -0.3077454, 0, 0.7411765, 1, 1,
0.1008365, 0.2127677, 0.6439068, 0, 0.7372549, 1, 1,
0.1079657, 1.682901, -1.017321, 0, 0.7294118, 1, 1,
0.1108177, -0.2241455, 2.844272, 0, 0.7254902, 1, 1,
0.1108898, -0.07015938, 3.364153, 0, 0.7176471, 1, 1,
0.1116022, -0.2844443, 1.547875, 0, 0.7137255, 1, 1,
0.1137737, 1.349465, -0.0744804, 0, 0.7058824, 1, 1,
0.1155827, 0.794066, 1.058464, 0, 0.6980392, 1, 1,
0.1179528, 2.94105, 1.971737, 0, 0.6941177, 1, 1,
0.1286625, -1.759071, 3.985286, 0, 0.6862745, 1, 1,
0.1310796, -0.8398803, 0.08448681, 0, 0.682353, 1, 1,
0.1370497, 1.174281, -0.5933096, 0, 0.6745098, 1, 1,
0.1383972, -1.411975, 3.674364, 0, 0.6705883, 1, 1,
0.1385736, -0.8008152, 5.683707, 0, 0.6627451, 1, 1,
0.1393163, -1.62544, 3.746958, 0, 0.6588235, 1, 1,
0.1396464, 0.3273717, 1.17044, 0, 0.6509804, 1, 1,
0.1425165, 1.483284, 1.14388, 0, 0.6470588, 1, 1,
0.1493233, -0.3740696, 2.293175, 0, 0.6392157, 1, 1,
0.1501671, 0.9909816, -0.1177308, 0, 0.6352941, 1, 1,
0.1567674, -0.501734, 2.131012, 0, 0.627451, 1, 1,
0.1579208, 0.4672427, 0.2404609, 0, 0.6235294, 1, 1,
0.1645812, -0.6082342, 2.454393, 0, 0.6156863, 1, 1,
0.1646013, -0.8478833, 3.28366, 0, 0.6117647, 1, 1,
0.1681858, 1.22226, 0.4947041, 0, 0.6039216, 1, 1,
0.1702948, 0.7357923, -0.1779424, 0, 0.5960785, 1, 1,
0.1707187, -0.5197251, 3.861466, 0, 0.5921569, 1, 1,
0.1724735, -0.1600841, 2.387905, 0, 0.5843138, 1, 1,
0.1725693, 0.6795439, 1.620265, 0, 0.5803922, 1, 1,
0.1749077, -0.6366065, 0.8444558, 0, 0.572549, 1, 1,
0.1757006, 0.2510398, 1.3169, 0, 0.5686275, 1, 1,
0.1763938, 0.3349451, -0.1735331, 0, 0.5607843, 1, 1,
0.1781681, -0.4147522, 2.22, 0, 0.5568628, 1, 1,
0.1783625, -0.141673, 0.9214162, 0, 0.5490196, 1, 1,
0.179291, -0.08427267, 1.343785, 0, 0.5450981, 1, 1,
0.1801166, 0.636519, 0.7521046, 0, 0.5372549, 1, 1,
0.1808396, -0.5433528, 2.193496, 0, 0.5333334, 1, 1,
0.1891777, 0.4240434, 1.466449, 0, 0.5254902, 1, 1,
0.1937489, 0.588753, 1.208264, 0, 0.5215687, 1, 1,
0.1960986, -0.1295166, 3.833335, 0, 0.5137255, 1, 1,
0.1965343, -0.2975034, 3.421937, 0, 0.509804, 1, 1,
0.1986228, -0.9099656, 3.951081, 0, 0.5019608, 1, 1,
0.2006349, -0.1008627, 3.334804, 0, 0.4941176, 1, 1,
0.2021547, -0.6294931, 1.583171, 0, 0.4901961, 1, 1,
0.2029122, 0.145329, 1.758908, 0, 0.4823529, 1, 1,
0.2037997, 0.2896174, 0.4074295, 0, 0.4784314, 1, 1,
0.2069665, 0.2667854, -3.383198, 0, 0.4705882, 1, 1,
0.2075431, -1.325425, 0.7872032, 0, 0.4666667, 1, 1,
0.2094771, -0.5863739, 2.203256, 0, 0.4588235, 1, 1,
0.2100497, 0.9055827, 1.349982, 0, 0.454902, 1, 1,
0.2133343, 1.069088, -0.5310934, 0, 0.4470588, 1, 1,
0.2160031, 0.8446612, 1.381189, 0, 0.4431373, 1, 1,
0.2167664, -0.5146438, 2.746454, 0, 0.4352941, 1, 1,
0.2168486, 0.5556767, 1.349866, 0, 0.4313726, 1, 1,
0.2170283, -0.462735, 2.519524, 0, 0.4235294, 1, 1,
0.2170638, 0.7104342, 1.108099, 0, 0.4196078, 1, 1,
0.2199801, 0.8389277, -0.5726206, 0, 0.4117647, 1, 1,
0.2251219, -0.4600017, 1.520801, 0, 0.4078431, 1, 1,
0.22583, -1.792431, 3.234219, 0, 0.4, 1, 1,
0.2261484, -2.146172, 3.805809, 0, 0.3921569, 1, 1,
0.2400182, 1.197371, -0.2422409, 0, 0.3882353, 1, 1,
0.2406086, 0.2792691, 1.824835, 0, 0.3803922, 1, 1,
0.2458539, 0.1382334, 1.336832, 0, 0.3764706, 1, 1,
0.2482872, 0.06943512, 1.258166, 0, 0.3686275, 1, 1,
0.2496502, -0.6872305, 3.094535, 0, 0.3647059, 1, 1,
0.2497623, 0.00245362, 0.942866, 0, 0.3568628, 1, 1,
0.2543799, -0.6597711, 3.092889, 0, 0.3529412, 1, 1,
0.2570194, 0.350566, -0.218815, 0, 0.345098, 1, 1,
0.2620478, 1.200463, 0.8038252, 0, 0.3411765, 1, 1,
0.2633885, 0.3810706, -0.05449331, 0, 0.3333333, 1, 1,
0.2652728, 0.4906509, 2.074194, 0, 0.3294118, 1, 1,
0.2669923, 1.657817, -0.683785, 0, 0.3215686, 1, 1,
0.2720053, -0.7214143, 3.884172, 0, 0.3176471, 1, 1,
0.2770327, 0.0949665, 0.08490299, 0, 0.3098039, 1, 1,
0.2781746, -0.9212863, 2.860756, 0, 0.3058824, 1, 1,
0.2782982, -1.735473, 2.119374, 0, 0.2980392, 1, 1,
0.281519, 2.002135, -1.252908, 0, 0.2901961, 1, 1,
0.2822122, -0.3650392, 4.343338, 0, 0.2862745, 1, 1,
0.2830946, 0.6168293, -0.0969386, 0, 0.2784314, 1, 1,
0.2838402, 0.2222251, 2.798459, 0, 0.2745098, 1, 1,
0.2875676, -0.1990667, 2.459113, 0, 0.2666667, 1, 1,
0.2901905, -0.8755165, 2.570125, 0, 0.2627451, 1, 1,
0.2942042, -0.9577001, 1.482012, 0, 0.254902, 1, 1,
0.2971034, 1.653549, 0.7280791, 0, 0.2509804, 1, 1,
0.2978933, 0.3764433, 1.859501, 0, 0.2431373, 1, 1,
0.3012682, -0.01542015, 2.26658, 0, 0.2392157, 1, 1,
0.3034401, 0.6090576, 0.6587416, 0, 0.2313726, 1, 1,
0.306297, -0.6286526, 2.117395, 0, 0.227451, 1, 1,
0.3064092, -1.236861, 1.919493, 0, 0.2196078, 1, 1,
0.3113679, -0.3747957, 1.925884, 0, 0.2156863, 1, 1,
0.3133681, 0.8147214, -0.4631999, 0, 0.2078431, 1, 1,
0.3134735, 0.853569, 0.7265899, 0, 0.2039216, 1, 1,
0.3136163, 0.6788611, 0.06498636, 0, 0.1960784, 1, 1,
0.3137015, 0.2963944, -0.2860653, 0, 0.1882353, 1, 1,
0.3163513, -1.17898, 3.618207, 0, 0.1843137, 1, 1,
0.3168118, -0.01495325, 1.114101, 0, 0.1764706, 1, 1,
0.3183888, -1.456553, 3.64611, 0, 0.172549, 1, 1,
0.3216403, 0.9726665, 1.763755, 0, 0.1647059, 1, 1,
0.3227476, -0.6727005, 3.288538, 0, 0.1607843, 1, 1,
0.3234748, 3.524035, 0.8497773, 0, 0.1529412, 1, 1,
0.3307842, -0.9887733, 4.204171, 0, 0.1490196, 1, 1,
0.3321343, 0.7025909, -0.07300244, 0, 0.1411765, 1, 1,
0.3407705, -0.1511286, 1.17308, 0, 0.1372549, 1, 1,
0.3437178, -0.01670972, 1.085524, 0, 0.1294118, 1, 1,
0.3445371, 1.578048, 1.630048, 0, 0.1254902, 1, 1,
0.348298, -1.918344, 5.161819, 0, 0.1176471, 1, 1,
0.3525508, 0.4195863, 0.1989688, 0, 0.1137255, 1, 1,
0.355628, 0.8660836, 0.2568652, 0, 0.1058824, 1, 1,
0.3584254, -0.0532438, 1.825751, 0, 0.09803922, 1, 1,
0.3609525, -1.64771, 2.817497, 0, 0.09411765, 1, 1,
0.3634019, 0.5856295, 0.2636326, 0, 0.08627451, 1, 1,
0.3672703, 2.264611, 1.011239, 0, 0.08235294, 1, 1,
0.3720931, 0.3123215, 1.997557, 0, 0.07450981, 1, 1,
0.3739699, 0.986593, -0.1543159, 0, 0.07058824, 1, 1,
0.3741711, -0.1716058, 1.77649, 0, 0.0627451, 1, 1,
0.3771942, -1.174705, 2.288446, 0, 0.05882353, 1, 1,
0.3783061, 0.6463363, 0.6944135, 0, 0.05098039, 1, 1,
0.3783191, -0.3876189, 1.192058, 0, 0.04705882, 1, 1,
0.378645, -0.6677518, 1.791043, 0, 0.03921569, 1, 1,
0.3856159, -1.170437, 3.373604, 0, 0.03529412, 1, 1,
0.3883514, -1.868949, 4.116615, 0, 0.02745098, 1, 1,
0.3925316, -2.419342, 3.333699, 0, 0.02352941, 1, 1,
0.3958389, 0.90029, 2.530239, 0, 0.01568628, 1, 1,
0.3961436, 1.238943, -1.42196, 0, 0.01176471, 1, 1,
0.399728, -1.110761, 3.368983, 0, 0.003921569, 1, 1,
0.4006621, -0.9897713, 2.924932, 0.003921569, 0, 1, 1,
0.4037862, 0.1888841, 1.638257, 0.007843138, 0, 1, 1,
0.4044448, -2.029048, 2.372605, 0.01568628, 0, 1, 1,
0.4047752, 0.706256, 0.2067588, 0.01960784, 0, 1, 1,
0.4075934, 1.326922, -0.3376735, 0.02745098, 0, 1, 1,
0.4080158, 0.3226707, -0.2737981, 0.03137255, 0, 1, 1,
0.4118648, 0.2712227, 1.200511, 0.03921569, 0, 1, 1,
0.4119185, -1.576177, 2.757781, 0.04313726, 0, 1, 1,
0.42258, 0.04308211, 0.3620735, 0.05098039, 0, 1, 1,
0.4237339, 0.90883, 0.76328, 0.05490196, 0, 1, 1,
0.4243415, -0.0639908, 1.815586, 0.0627451, 0, 1, 1,
0.4291044, 0.6843687, 1.015633, 0.06666667, 0, 1, 1,
0.4363884, -0.04477102, 2.379974, 0.07450981, 0, 1, 1,
0.4379211, -0.9210753, 3.138239, 0.07843138, 0, 1, 1,
0.4413442, -0.6142007, 0.4982278, 0.08627451, 0, 1, 1,
0.4424635, -0.8959058, 2.321347, 0.09019608, 0, 1, 1,
0.447026, -1.384662, 3.981318, 0.09803922, 0, 1, 1,
0.4473221, -0.5003912, 2.06861, 0.1058824, 0, 1, 1,
0.4489354, 0.1295162, 1.356647, 0.1098039, 0, 1, 1,
0.4529132, 0.8924903, -0.5383024, 0.1176471, 0, 1, 1,
0.4535608, -1.216442, 2.083573, 0.1215686, 0, 1, 1,
0.4581023, -1.790143, 2.695994, 0.1294118, 0, 1, 1,
0.4601408, 0.08142451, 0.7162191, 0.1333333, 0, 1, 1,
0.4670334, -1.711037, 3.492434, 0.1411765, 0, 1, 1,
0.4674389, -0.5019751, 1.607263, 0.145098, 0, 1, 1,
0.473297, -0.0535043, 3.02813, 0.1529412, 0, 1, 1,
0.4751175, 0.2347311, 2.344348, 0.1568628, 0, 1, 1,
0.4765483, 0.6657168, 2.469812, 0.1647059, 0, 1, 1,
0.4792189, -0.3595847, 2.346858, 0.1686275, 0, 1, 1,
0.4806745, 0.07461357, 1.790681, 0.1764706, 0, 1, 1,
0.4811743, -0.8342502, 2.522695, 0.1803922, 0, 1, 1,
0.4814131, 1.805717, 2.440885, 0.1882353, 0, 1, 1,
0.4886059, 0.8697677, 0.1448141, 0.1921569, 0, 1, 1,
0.4933181, 1.430255, 1.518404, 0.2, 0, 1, 1,
0.4945844, -0.8201354, 3.936224, 0.2078431, 0, 1, 1,
0.5001962, -0.7370582, 1.921202, 0.2117647, 0, 1, 1,
0.5121071, -0.5792705, 2.840739, 0.2196078, 0, 1, 1,
0.5140566, -0.6093153, 2.422419, 0.2235294, 0, 1, 1,
0.5144988, 2.225827, 0.6275319, 0.2313726, 0, 1, 1,
0.5147772, -0.5522977, 3.590737, 0.2352941, 0, 1, 1,
0.5166149, -1.014081, 2.194601, 0.2431373, 0, 1, 1,
0.5194967, 0.3005325, 0.2105165, 0.2470588, 0, 1, 1,
0.5226218, 0.319555, -1.502173, 0.254902, 0, 1, 1,
0.5241862, -1.081849, 2.740286, 0.2588235, 0, 1, 1,
0.5245828, -0.2291265, 2.586385, 0.2666667, 0, 1, 1,
0.5249088, 1.482562, -0.1017821, 0.2705882, 0, 1, 1,
0.5258998, -2.045165, 4.223646, 0.2784314, 0, 1, 1,
0.5269101, -0.3545348, 3.386918, 0.282353, 0, 1, 1,
0.5302212, -0.8924481, 1.839461, 0.2901961, 0, 1, 1,
0.5324689, 0.1665881, 0.9043694, 0.2941177, 0, 1, 1,
0.5336424, 0.8074409, 1.772725, 0.3019608, 0, 1, 1,
0.5338343, 0.8084642, -1.141282, 0.3098039, 0, 1, 1,
0.5359667, -0.0417422, -0.4183311, 0.3137255, 0, 1, 1,
0.5440401, 0.5517408, 0.5863, 0.3215686, 0, 1, 1,
0.5441842, 0.1975409, -0.3304836, 0.3254902, 0, 1, 1,
0.5476792, 2.102093, -0.8240055, 0.3333333, 0, 1, 1,
0.5492727, -0.3143033, 0.3072783, 0.3372549, 0, 1, 1,
0.5549312, 0.3106796, 0.407472, 0.345098, 0, 1, 1,
0.5608379, -0.7945648, 4.151324, 0.3490196, 0, 1, 1,
0.5638009, 0.342872, 2.258566, 0.3568628, 0, 1, 1,
0.5696973, 0.5236133, 0.9774325, 0.3607843, 0, 1, 1,
0.5724664, -0.09025316, 0.5269385, 0.3686275, 0, 1, 1,
0.5733077, 0.1260652, 1.017513, 0.372549, 0, 1, 1,
0.5740356, 0.1757586, -1.530328, 0.3803922, 0, 1, 1,
0.5748658, 1.050887, 0.486619, 0.3843137, 0, 1, 1,
0.577977, 0.1425846, 2.052951, 0.3921569, 0, 1, 1,
0.5796832, 1.02679, 2.126493, 0.3960784, 0, 1, 1,
0.5818567, -0.2346547, 3.037212, 0.4039216, 0, 1, 1,
0.5917025, -0.1366753, 1.543719, 0.4117647, 0, 1, 1,
0.5950137, -0.8926104, 1.726644, 0.4156863, 0, 1, 1,
0.59619, 1.080852, 0.1647075, 0.4235294, 0, 1, 1,
0.6021582, 0.8132844, 1.08473, 0.427451, 0, 1, 1,
0.6038034, 0.3035097, 1.236146, 0.4352941, 0, 1, 1,
0.6149146, 0.2083642, -1.068804, 0.4392157, 0, 1, 1,
0.6185616, 0.179777, 0.4592513, 0.4470588, 0, 1, 1,
0.6186005, 0.8125885, 1.014515, 0.4509804, 0, 1, 1,
0.625751, 0.9888608, -0.5980484, 0.4588235, 0, 1, 1,
0.6282348, 1.355013, 1.066858, 0.4627451, 0, 1, 1,
0.6319981, 0.6015505, 1.421034, 0.4705882, 0, 1, 1,
0.633828, 0.29505, 1.326421, 0.4745098, 0, 1, 1,
0.6347427, -0.09147681, 3.130927, 0.4823529, 0, 1, 1,
0.6399602, -0.9370144, 2.729707, 0.4862745, 0, 1, 1,
0.6554892, -1.105705, 4.166861, 0.4941176, 0, 1, 1,
0.6560059, 0.959027, 1.378641, 0.5019608, 0, 1, 1,
0.6585099, 0.2178429, 2.018614, 0.5058824, 0, 1, 1,
0.6759148, 0.9797685, -0.2810276, 0.5137255, 0, 1, 1,
0.67598, -0.2786129, 2.503646, 0.5176471, 0, 1, 1,
0.6793595, -0.6552735, 2.439436, 0.5254902, 0, 1, 1,
0.6799688, -2.28623, 2.539177, 0.5294118, 0, 1, 1,
0.6813114, -0.6065255, 2.741102, 0.5372549, 0, 1, 1,
0.6849167, -1.102334, 3.064775, 0.5411765, 0, 1, 1,
0.6923369, -0.8469383, 4.055607, 0.5490196, 0, 1, 1,
0.6952001, 0.6903612, 1.56102, 0.5529412, 0, 1, 1,
0.7004478, 0.4613818, 1.146503, 0.5607843, 0, 1, 1,
0.7133797, -0.09425148, 1.744822, 0.5647059, 0, 1, 1,
0.7169383, -1.066027, 3.493389, 0.572549, 0, 1, 1,
0.7175592, -0.197209, 1.835951, 0.5764706, 0, 1, 1,
0.721891, -0.1069437, 2.550792, 0.5843138, 0, 1, 1,
0.7231327, 0.3561305, 1.316527, 0.5882353, 0, 1, 1,
0.7232417, -0.4771411, 1.104963, 0.5960785, 0, 1, 1,
0.7255051, 1.308237, 1.341377, 0.6039216, 0, 1, 1,
0.7280428, -0.2017898, 2.518263, 0.6078432, 0, 1, 1,
0.7304434, -0.7760227, 4.409697, 0.6156863, 0, 1, 1,
0.7324334, 0.8521236, -0.2854133, 0.6196079, 0, 1, 1,
0.7332168, 0.2951949, 1.493834, 0.627451, 0, 1, 1,
0.7370774, -0.4966679, 2.622627, 0.6313726, 0, 1, 1,
0.741728, -0.01720811, 1.737732, 0.6392157, 0, 1, 1,
0.7428598, -0.3791501, 2.585144, 0.6431373, 0, 1, 1,
0.7433735, 1.153299, -0.7903264, 0.6509804, 0, 1, 1,
0.7445636, -0.85364, 2.961567, 0.654902, 0, 1, 1,
0.7467633, -0.6525066, 3.44996, 0.6627451, 0, 1, 1,
0.7479589, -0.06211638, -0.2248564, 0.6666667, 0, 1, 1,
0.7484838, -1.360133, 0.7250668, 0.6745098, 0, 1, 1,
0.7505766, 1.108115, 1.199607, 0.6784314, 0, 1, 1,
0.7561251, -0.4158669, 2.908476, 0.6862745, 0, 1, 1,
0.7605148, 0.5007156, 1.195047, 0.6901961, 0, 1, 1,
0.7675427, -0.3803287, 2.318439, 0.6980392, 0, 1, 1,
0.7679105, -0.3061637, 1.317887, 0.7058824, 0, 1, 1,
0.7695702, 0.1995903, 2.183605, 0.7098039, 0, 1, 1,
0.7696384, -0.5289928, 2.093942, 0.7176471, 0, 1, 1,
0.7752217, 1.34841, -0.1789936, 0.7215686, 0, 1, 1,
0.7850084, -2.108692, 3.440269, 0.7294118, 0, 1, 1,
0.7864992, 0.5386522, 0.5564985, 0.7333333, 0, 1, 1,
0.7874772, 1.132728, 0.2359106, 0.7411765, 0, 1, 1,
0.7887223, 0.06492841, 1.875068, 0.7450981, 0, 1, 1,
0.793909, 1.146258, 0.05834837, 0.7529412, 0, 1, 1,
0.794663, -0.621649, 1.943099, 0.7568628, 0, 1, 1,
0.7992844, -0.4582511, 1.94665, 0.7647059, 0, 1, 1,
0.8033273, 1.047413, -0.8984357, 0.7686275, 0, 1, 1,
0.8117518, -0.7584739, 1.319619, 0.7764706, 0, 1, 1,
0.8167429, 0.7890108, 1.0811, 0.7803922, 0, 1, 1,
0.8182451, -0.9740325, 3.222307, 0.7882353, 0, 1, 1,
0.8256764, 1.002925, 0.4377777, 0.7921569, 0, 1, 1,
0.82779, 0.1251012, 2.418244, 0.8, 0, 1, 1,
0.8377938, 0.2882016, 0.8984772, 0.8078431, 0, 1, 1,
0.8413452, 0.1998381, 1.899449, 0.8117647, 0, 1, 1,
0.8426696, -1.634868, 1.884367, 0.8196079, 0, 1, 1,
0.8434563, 1.022495, -0.6163482, 0.8235294, 0, 1, 1,
0.8674141, -0.6055862, 0.3694845, 0.8313726, 0, 1, 1,
0.8677687, -0.8733303, 0.2266006, 0.8352941, 0, 1, 1,
0.8743234, -1.108205, 2.898122, 0.8431373, 0, 1, 1,
0.8870417, -0.8455697, 2.193979, 0.8470588, 0, 1, 1,
0.8872652, -0.1404523, 1.780128, 0.854902, 0, 1, 1,
0.8880932, 0.4843426, 2.527744, 0.8588235, 0, 1, 1,
0.8933107, -1.619501, 3.750273, 0.8666667, 0, 1, 1,
0.8957474, -1.722204, 2.235168, 0.8705882, 0, 1, 1,
0.8990421, -1.241157, 1.852347, 0.8784314, 0, 1, 1,
0.9043859, 0.3585503, 1.661153, 0.8823529, 0, 1, 1,
0.9082395, 1.537007, -0.6545033, 0.8901961, 0, 1, 1,
0.9096955, 1.666758, -0.1520746, 0.8941177, 0, 1, 1,
0.9119386, 0.201843, 0.5688668, 0.9019608, 0, 1, 1,
0.912699, -0.5106192, 3.425705, 0.9098039, 0, 1, 1,
0.9153122, 0.8522764, 0.8847211, 0.9137255, 0, 1, 1,
0.9204703, 0.6758186, 0.9015082, 0.9215686, 0, 1, 1,
0.9266019, -0.5172574, 1.884485, 0.9254902, 0, 1, 1,
0.9296452, 0.9013597, 2.95802, 0.9333333, 0, 1, 1,
0.9347689, 0.9730601, 2.255777, 0.9372549, 0, 1, 1,
0.9348938, 0.02055956, 3.068276, 0.945098, 0, 1, 1,
0.9395262, 1.596033, 0.8098318, 0.9490196, 0, 1, 1,
0.9396662, 0.2318377, 1.843761, 0.9568627, 0, 1, 1,
0.9406955, 1.987916, 0.4913635, 0.9607843, 0, 1, 1,
0.9479496, 1.273132, 2.28758, 0.9686275, 0, 1, 1,
0.9542295, -0.8278105, 3.959947, 0.972549, 0, 1, 1,
0.954922, -0.1264823, 0.8871, 0.9803922, 0, 1, 1,
0.9591715, -2.78047, 1.161936, 0.9843137, 0, 1, 1,
0.961193, 0.8710357, 0.9627672, 0.9921569, 0, 1, 1,
0.9638267, 0.2708825, 0.7401238, 0.9960784, 0, 1, 1,
0.9647344, -0.2796174, 3.566997, 1, 0, 0.9960784, 1,
0.9647897, -0.9663221, 2.095837, 1, 0, 0.9882353, 1,
0.9659298, 0.4518504, 0.3824405, 1, 0, 0.9843137, 1,
0.96652, 1.55308, 0.1188971, 1, 0, 0.9764706, 1,
0.9684489, 1.133883, 1.94158, 1, 0, 0.972549, 1,
0.972347, -0.3987695, 1.632168, 1, 0, 0.9647059, 1,
0.9776878, 0.0731059, 1.872699, 1, 0, 0.9607843, 1,
0.9793324, 0.6697558, 1.583981, 1, 0, 0.9529412, 1,
0.9849513, 0.2641744, 2.539213, 1, 0, 0.9490196, 1,
0.998543, 0.4898151, 1.907811, 1, 0, 0.9411765, 1,
1.002829, 0.2233673, 3.252215, 1, 0, 0.9372549, 1,
1.008748, 2.318139, 2.076156, 1, 0, 0.9294118, 1,
1.009143, 0.8960996, 0.4049859, 1, 0, 0.9254902, 1,
1.009318, 1.325292, 1.532869, 1, 0, 0.9176471, 1,
1.009639, -0.6003203, 1.93571, 1, 0, 0.9137255, 1,
1.021958, -0.246988, 1.020058, 1, 0, 0.9058824, 1,
1.0292, 0.1437743, -0.06304336, 1, 0, 0.9019608, 1,
1.037355, 0.6222965, 1.661122, 1, 0, 0.8941177, 1,
1.044675, -0.8633508, 2.640618, 1, 0, 0.8862745, 1,
1.051454, 0.7334316, 0.9162742, 1, 0, 0.8823529, 1,
1.074608, 0.9655452, 0.2631731, 1, 0, 0.8745098, 1,
1.077259, 0.1584535, 1.353824, 1, 0, 0.8705882, 1,
1.08033, 1.129453, 1.962082, 1, 0, 0.8627451, 1,
1.083009, -1.476209, 3.449884, 1, 0, 0.8588235, 1,
1.086623, 1.519447, 1.268499, 1, 0, 0.8509804, 1,
1.09137, 0.4359343, 1.883297, 1, 0, 0.8470588, 1,
1.091844, 0.2621616, 2.822219, 1, 0, 0.8392157, 1,
1.093755, -0.5533523, 2.827216, 1, 0, 0.8352941, 1,
1.094594, -0.9236333, 2.282039, 1, 0, 0.827451, 1,
1.096908, -0.01046089, 2.215203, 1, 0, 0.8235294, 1,
1.098336, -0.5996745, 1.036665, 1, 0, 0.8156863, 1,
1.098575, -0.4886568, 2.83002, 1, 0, 0.8117647, 1,
1.099406, 0.4514689, 0.6074303, 1, 0, 0.8039216, 1,
1.111337, 0.9654421, 0.9269815, 1, 0, 0.7960784, 1,
1.115037, 0.6138217, 1.284173, 1, 0, 0.7921569, 1,
1.115577, 0.4358467, 0.6194335, 1, 0, 0.7843137, 1,
1.121568, 0.4304294, 0.366118, 1, 0, 0.7803922, 1,
1.130962, 1.603185, -0.3897743, 1, 0, 0.772549, 1,
1.133095, 0.7301982, 0.05789103, 1, 0, 0.7686275, 1,
1.137547, -0.7534235, 3.701299, 1, 0, 0.7607843, 1,
1.14121, -0.4735844, 3.057206, 1, 0, 0.7568628, 1,
1.144562, 0.3291789, 2.375544, 1, 0, 0.7490196, 1,
1.145285, -2.65125, 3.591094, 1, 0, 0.7450981, 1,
1.150201, 0.7794955, 2.948696, 1, 0, 0.7372549, 1,
1.151237, 0.05664964, 3.309388, 1, 0, 0.7333333, 1,
1.151603, -0.3560174, 1.779986, 1, 0, 0.7254902, 1,
1.162718, -1.570653, 3.739335, 1, 0, 0.7215686, 1,
1.163387, 0.7827722, 1.201449, 1, 0, 0.7137255, 1,
1.164215, 0.4332332, 1.08767, 1, 0, 0.7098039, 1,
1.164706, -0.6939862, 1.629729, 1, 0, 0.7019608, 1,
1.167542, -1.950497, 2.23569, 1, 0, 0.6941177, 1,
1.167659, 1.497316, -1.457768, 1, 0, 0.6901961, 1,
1.168465, 0.2235451, 1.795447, 1, 0, 0.682353, 1,
1.176161, -1.074082, 3.065154, 1, 0, 0.6784314, 1,
1.178658, -0.8161, 2.481042, 1, 0, 0.6705883, 1,
1.188417, -0.04167728, 0.5270172, 1, 0, 0.6666667, 1,
1.189862, 1.082224, -0.1496443, 1, 0, 0.6588235, 1,
1.205662, -0.3087665, 3.596128, 1, 0, 0.654902, 1,
1.210914, -1.996004, 3.20113, 1, 0, 0.6470588, 1,
1.218594, 1.075192, 0.7982906, 1, 0, 0.6431373, 1,
1.222073, -1.266535, 3.840335, 1, 0, 0.6352941, 1,
1.22541, -0.333716, 2.633777, 1, 0, 0.6313726, 1,
1.227606, -0.4416358, 1.556489, 1, 0, 0.6235294, 1,
1.231891, 1.034149, -0.1508953, 1, 0, 0.6196079, 1,
1.237129, 0.05747351, 2.715139, 1, 0, 0.6117647, 1,
1.237143, -0.5414186, 0.97058, 1, 0, 0.6078432, 1,
1.237231, -2.233814, 4.906138, 1, 0, 0.6, 1,
1.238443, 0.8670759, 0.8397202, 1, 0, 0.5921569, 1,
1.241803, -1.233371, 1.598484, 1, 0, 0.5882353, 1,
1.24841, -0.1933604, 2.264432, 1, 0, 0.5803922, 1,
1.259561, 0.3729601, 2.166571, 1, 0, 0.5764706, 1,
1.261716, -0.193238, 0.8216555, 1, 0, 0.5686275, 1,
1.274276, 0.7044146, -0.206135, 1, 0, 0.5647059, 1,
1.281408, 0.2343671, 0.6061549, 1, 0, 0.5568628, 1,
1.284384, 2.214972, 2.297487, 1, 0, 0.5529412, 1,
1.288966, -0.667327, 2.862028, 1, 0, 0.5450981, 1,
1.289639, 1.576959, 2.200537, 1, 0, 0.5411765, 1,
1.297589, -0.9958902, 4.625052, 1, 0, 0.5333334, 1,
1.313929, 0.2976872, 1.093863, 1, 0, 0.5294118, 1,
1.316559, -0.6009785, 3.208335, 1, 0, 0.5215687, 1,
1.348451, -0.02087705, 1.238467, 1, 0, 0.5176471, 1,
1.354149, -0.665903, 3.225411, 1, 0, 0.509804, 1,
1.35921, 0.770272, -0.2716425, 1, 0, 0.5058824, 1,
1.359947, -2.576931, 2.769253, 1, 0, 0.4980392, 1,
1.363605, -0.3761524, 2.031514, 1, 0, 0.4901961, 1,
1.366995, -0.03923299, 0.6675257, 1, 0, 0.4862745, 1,
1.367066, -1.222622, 3.484276, 1, 0, 0.4784314, 1,
1.380026, -0.9621781, 2.156809, 1, 0, 0.4745098, 1,
1.382292, 0.5574391, 0.8245156, 1, 0, 0.4666667, 1,
1.384, -0.363371, 1.526338, 1, 0, 0.4627451, 1,
1.40124, 0.1153468, 2.070633, 1, 0, 0.454902, 1,
1.427664, -0.5419896, 0.7767301, 1, 0, 0.4509804, 1,
1.429646, -0.8928461, 2.010602, 1, 0, 0.4431373, 1,
1.438671, -0.8691616, 0.05152624, 1, 0, 0.4392157, 1,
1.444593, 1.213528, 0.95768, 1, 0, 0.4313726, 1,
1.445535, 1.649964, 1.228638, 1, 0, 0.427451, 1,
1.460202, -1.363386, 3.339346, 1, 0, 0.4196078, 1,
1.470273, 0.1277072, -0.1050217, 1, 0, 0.4156863, 1,
1.50189, -0.374135, 0.9082969, 1, 0, 0.4078431, 1,
1.509269, -1.4825, 1.669201, 1, 0, 0.4039216, 1,
1.514791, -0.03325683, 1.001996, 1, 0, 0.3960784, 1,
1.515838, 0.2502641, 1.019532, 1, 0, 0.3882353, 1,
1.519603, 1.119795, 1.04528, 1, 0, 0.3843137, 1,
1.524339, 0.3306748, 0.8977997, 1, 0, 0.3764706, 1,
1.54214, 0.1361677, -1.092038, 1, 0, 0.372549, 1,
1.577811, -0.7790948, 2.280054, 1, 0, 0.3647059, 1,
1.589711, 0.5124348, 0.5049345, 1, 0, 0.3607843, 1,
1.613937, -1.294888, 1.931217, 1, 0, 0.3529412, 1,
1.629295, -2.05129, 2.329472, 1, 0, 0.3490196, 1,
1.629411, -1.013341, 2.378003, 1, 0, 0.3411765, 1,
1.644427, -0.1699985, 3.751061, 1, 0, 0.3372549, 1,
1.653882, -0.9638107, 1.559776, 1, 0, 0.3294118, 1,
1.655207, 1.010979, 2.102477, 1, 0, 0.3254902, 1,
1.667659, 0.01590437, 1.778043, 1, 0, 0.3176471, 1,
1.67016, -0.6480418, 0.471589, 1, 0, 0.3137255, 1,
1.693043, -0.2828863, 1.749301, 1, 0, 0.3058824, 1,
1.701998, 1.855162, 1.240605, 1, 0, 0.2980392, 1,
1.717474, 0.5787741, 1.503011, 1, 0, 0.2941177, 1,
1.724111, 0.07726381, 1.831542, 1, 0, 0.2862745, 1,
1.726753, -0.660493, 1.761365, 1, 0, 0.282353, 1,
1.776256, 0.6776466, -0.7784754, 1, 0, 0.2745098, 1,
1.781807, 0.2190055, 1.688114, 1, 0, 0.2705882, 1,
1.787278, 0.04897799, 1.103589, 1, 0, 0.2627451, 1,
1.808323, -1.424793, 0.2201589, 1, 0, 0.2588235, 1,
1.811833, 0.3232779, 2.438082, 1, 0, 0.2509804, 1,
1.814371, 0.1055721, 1.36984, 1, 0, 0.2470588, 1,
1.851425, 0.4826902, 2.810529, 1, 0, 0.2392157, 1,
1.856865, 0.8870878, 0.896792, 1, 0, 0.2352941, 1,
1.860209, 0.8387801, 0.5564254, 1, 0, 0.227451, 1,
1.866067, -0.7847913, 1.383195, 1, 0, 0.2235294, 1,
1.872824, 1.169495, 2.006023, 1, 0, 0.2156863, 1,
1.901847, 0.9397357, -0.06990355, 1, 0, 0.2117647, 1,
1.905682, -0.9582771, 2.497228, 1, 0, 0.2039216, 1,
1.907353, 0.6555368, -0.6395704, 1, 0, 0.1960784, 1,
1.909782, -0.9736147, 2.190689, 1, 0, 0.1921569, 1,
1.917642, 0.2530721, 1.372681, 1, 0, 0.1843137, 1,
1.942086, 1.840008, 0.05227172, 1, 0, 0.1803922, 1,
1.949207, -0.3756045, 2.435864, 1, 0, 0.172549, 1,
1.963978, -0.3809089, 2.27721, 1, 0, 0.1686275, 1,
1.98515, -1.742496, 1.921226, 1, 0, 0.1607843, 1,
2.010948, 0.1099856, 3.184113, 1, 0, 0.1568628, 1,
2.043305, -0.6027892, 2.679942, 1, 0, 0.1490196, 1,
2.04534, 1.888666, 0.4312625, 1, 0, 0.145098, 1,
2.058838, 0.2706355, 1.030876, 1, 0, 0.1372549, 1,
2.060646, 0.8671308, 2.982564, 1, 0, 0.1333333, 1,
2.067106, -0.7268398, 2.128161, 1, 0, 0.1254902, 1,
2.070557, 1.357452, 0.02806095, 1, 0, 0.1215686, 1,
2.090167, 1.576103, 1.088893, 1, 0, 0.1137255, 1,
2.105143, 1.630339, 1.631089, 1, 0, 0.1098039, 1,
2.123923, -0.3301055, 1.140842, 1, 0, 0.1019608, 1,
2.137354, -0.9705744, 2.685325, 1, 0, 0.09411765, 1,
2.142807, 0.3457331, 1.514198, 1, 0, 0.09019608, 1,
2.220863, 0.4694494, 0.4402764, 1, 0, 0.08235294, 1,
2.230649, -1.437437, 1.761841, 1, 0, 0.07843138, 1,
2.232836, 0.7998711, 1.073941, 1, 0, 0.07058824, 1,
2.26265, -0.6170482, 0.7721103, 1, 0, 0.06666667, 1,
2.264072, -0.1216401, 1.047387, 1, 0, 0.05882353, 1,
2.287585, -1.307588, 3.807713, 1, 0, 0.05490196, 1,
2.308193, -1.47017, 1.977873, 1, 0, 0.04705882, 1,
2.334675, 0.2474648, 0.6330075, 1, 0, 0.04313726, 1,
2.382709, 0.6899477, 0.8054146, 1, 0, 0.03529412, 1,
2.41235, 0.7329519, 0.4267902, 1, 0, 0.03137255, 1,
2.465128, 0.6801277, 2.79088, 1, 0, 0.02352941, 1,
2.57372, 1.878324, 0.02553364, 1, 0, 0.01960784, 1,
3.06828, -0.09060987, 1.289098, 1, 0, 0.01176471, 1,
3.082902, 1.804933, 1.668429, 1, 0, 0.007843138, 1
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
-0.1007245, -4.464031, -6.915847, 0, -0.5, 0.5, 0.5,
-0.1007245, -4.464031, -6.915847, 1, -0.5, 0.5, 0.5,
-0.1007245, -4.464031, -6.915847, 1, 1.5, 0.5, 0.5,
-0.1007245, -4.464031, -6.915847, 0, 1.5, 0.5, 0.5
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
-4.3636, 0.1088722, -6.915847, 0, -0.5, 0.5, 0.5,
-4.3636, 0.1088722, -6.915847, 1, -0.5, 0.5, 0.5,
-4.3636, 0.1088722, -6.915847, 1, 1.5, 0.5, 0.5,
-4.3636, 0.1088722, -6.915847, 0, 1.5, 0.5, 0.5
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
-4.3636, -4.464031, 0.2969801, 0, -0.5, 0.5, 0.5,
-4.3636, -4.464031, 0.2969801, 1, -0.5, 0.5, 0.5,
-4.3636, -4.464031, 0.2969801, 1, 1.5, 0.5, 0.5,
-4.3636, -4.464031, 0.2969801, 0, 1.5, 0.5, 0.5
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
-3, -3.408746, -5.251349,
3, -3.408746, -5.251349,
-3, -3.408746, -5.251349,
-3, -3.584626, -5.528765,
-2, -3.408746, -5.251349,
-2, -3.584626, -5.528765,
-1, -3.408746, -5.251349,
-1, -3.584626, -5.528765,
0, -3.408746, -5.251349,
0, -3.584626, -5.528765,
1, -3.408746, -5.251349,
1, -3.584626, -5.528765,
2, -3.408746, -5.251349,
2, -3.584626, -5.528765,
3, -3.408746, -5.251349,
3, -3.584626, -5.528765
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
-3, -3.936388, -6.083598, 0, -0.5, 0.5, 0.5,
-3, -3.936388, -6.083598, 1, -0.5, 0.5, 0.5,
-3, -3.936388, -6.083598, 1, 1.5, 0.5, 0.5,
-3, -3.936388, -6.083598, 0, 1.5, 0.5, 0.5,
-2, -3.936388, -6.083598, 0, -0.5, 0.5, 0.5,
-2, -3.936388, -6.083598, 1, -0.5, 0.5, 0.5,
-2, -3.936388, -6.083598, 1, 1.5, 0.5, 0.5,
-2, -3.936388, -6.083598, 0, 1.5, 0.5, 0.5,
-1, -3.936388, -6.083598, 0, -0.5, 0.5, 0.5,
-1, -3.936388, -6.083598, 1, -0.5, 0.5, 0.5,
-1, -3.936388, -6.083598, 1, 1.5, 0.5, 0.5,
-1, -3.936388, -6.083598, 0, 1.5, 0.5, 0.5,
0, -3.936388, -6.083598, 0, -0.5, 0.5, 0.5,
0, -3.936388, -6.083598, 1, -0.5, 0.5, 0.5,
0, -3.936388, -6.083598, 1, 1.5, 0.5, 0.5,
0, -3.936388, -6.083598, 0, 1.5, 0.5, 0.5,
1, -3.936388, -6.083598, 0, -0.5, 0.5, 0.5,
1, -3.936388, -6.083598, 1, -0.5, 0.5, 0.5,
1, -3.936388, -6.083598, 1, 1.5, 0.5, 0.5,
1, -3.936388, -6.083598, 0, 1.5, 0.5, 0.5,
2, -3.936388, -6.083598, 0, -0.5, 0.5, 0.5,
2, -3.936388, -6.083598, 1, -0.5, 0.5, 0.5,
2, -3.936388, -6.083598, 1, 1.5, 0.5, 0.5,
2, -3.936388, -6.083598, 0, 1.5, 0.5, 0.5,
3, -3.936388, -6.083598, 0, -0.5, 0.5, 0.5,
3, -3.936388, -6.083598, 1, -0.5, 0.5, 0.5,
3, -3.936388, -6.083598, 1, 1.5, 0.5, 0.5,
3, -3.936388, -6.083598, 0, 1.5, 0.5, 0.5
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
-3.379859, -3, -5.251349,
-3.379859, 3, -5.251349,
-3.379859, -3, -5.251349,
-3.543816, -3, -5.528765,
-3.379859, -2, -5.251349,
-3.543816, -2, -5.528765,
-3.379859, -1, -5.251349,
-3.543816, -1, -5.528765,
-3.379859, 0, -5.251349,
-3.543816, 0, -5.528765,
-3.379859, 1, -5.251349,
-3.543816, 1, -5.528765,
-3.379859, 2, -5.251349,
-3.543816, 2, -5.528765,
-3.379859, 3, -5.251349,
-3.543816, 3, -5.528765
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
-3.87173, -3, -6.083598, 0, -0.5, 0.5, 0.5,
-3.87173, -3, -6.083598, 1, -0.5, 0.5, 0.5,
-3.87173, -3, -6.083598, 1, 1.5, 0.5, 0.5,
-3.87173, -3, -6.083598, 0, 1.5, 0.5, 0.5,
-3.87173, -2, -6.083598, 0, -0.5, 0.5, 0.5,
-3.87173, -2, -6.083598, 1, -0.5, 0.5, 0.5,
-3.87173, -2, -6.083598, 1, 1.5, 0.5, 0.5,
-3.87173, -2, -6.083598, 0, 1.5, 0.5, 0.5,
-3.87173, -1, -6.083598, 0, -0.5, 0.5, 0.5,
-3.87173, -1, -6.083598, 1, -0.5, 0.5, 0.5,
-3.87173, -1, -6.083598, 1, 1.5, 0.5, 0.5,
-3.87173, -1, -6.083598, 0, 1.5, 0.5, 0.5,
-3.87173, 0, -6.083598, 0, -0.5, 0.5, 0.5,
-3.87173, 0, -6.083598, 1, -0.5, 0.5, 0.5,
-3.87173, 0, -6.083598, 1, 1.5, 0.5, 0.5,
-3.87173, 0, -6.083598, 0, 1.5, 0.5, 0.5,
-3.87173, 1, -6.083598, 0, -0.5, 0.5, 0.5,
-3.87173, 1, -6.083598, 1, -0.5, 0.5, 0.5,
-3.87173, 1, -6.083598, 1, 1.5, 0.5, 0.5,
-3.87173, 1, -6.083598, 0, 1.5, 0.5, 0.5,
-3.87173, 2, -6.083598, 0, -0.5, 0.5, 0.5,
-3.87173, 2, -6.083598, 1, -0.5, 0.5, 0.5,
-3.87173, 2, -6.083598, 1, 1.5, 0.5, 0.5,
-3.87173, 2, -6.083598, 0, 1.5, 0.5, 0.5,
-3.87173, 3, -6.083598, 0, -0.5, 0.5, 0.5,
-3.87173, 3, -6.083598, 1, -0.5, 0.5, 0.5,
-3.87173, 3, -6.083598, 1, 1.5, 0.5, 0.5,
-3.87173, 3, -6.083598, 0, 1.5, 0.5, 0.5
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
-3.379859, -3.408746, -4,
-3.379859, -3.408746, 4,
-3.379859, -3.408746, -4,
-3.543816, -3.584626, -4,
-3.379859, -3.408746, -2,
-3.543816, -3.584626, -2,
-3.379859, -3.408746, 0,
-3.543816, -3.584626, 0,
-3.379859, -3.408746, 2,
-3.543816, -3.584626, 2,
-3.379859, -3.408746, 4,
-3.543816, -3.584626, 4
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
-3.87173, -3.936388, -4, 0, -0.5, 0.5, 0.5,
-3.87173, -3.936388, -4, 1, -0.5, 0.5, 0.5,
-3.87173, -3.936388, -4, 1, 1.5, 0.5, 0.5,
-3.87173, -3.936388, -4, 0, 1.5, 0.5, 0.5,
-3.87173, -3.936388, -2, 0, -0.5, 0.5, 0.5,
-3.87173, -3.936388, -2, 1, -0.5, 0.5, 0.5,
-3.87173, -3.936388, -2, 1, 1.5, 0.5, 0.5,
-3.87173, -3.936388, -2, 0, 1.5, 0.5, 0.5,
-3.87173, -3.936388, 0, 0, -0.5, 0.5, 0.5,
-3.87173, -3.936388, 0, 1, -0.5, 0.5, 0.5,
-3.87173, -3.936388, 0, 1, 1.5, 0.5, 0.5,
-3.87173, -3.936388, 0, 0, 1.5, 0.5, 0.5,
-3.87173, -3.936388, 2, 0, -0.5, 0.5, 0.5,
-3.87173, -3.936388, 2, 1, -0.5, 0.5, 0.5,
-3.87173, -3.936388, 2, 1, 1.5, 0.5, 0.5,
-3.87173, -3.936388, 2, 0, 1.5, 0.5, 0.5,
-3.87173, -3.936388, 4, 0, -0.5, 0.5, 0.5,
-3.87173, -3.936388, 4, 1, -0.5, 0.5, 0.5,
-3.87173, -3.936388, 4, 1, 1.5, 0.5, 0.5,
-3.87173, -3.936388, 4, 0, 1.5, 0.5, 0.5
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
-3.379859, -3.408746, -5.251349,
-3.379859, 3.62649, -5.251349,
-3.379859, -3.408746, 5.845309,
-3.379859, 3.62649, 5.845309,
-3.379859, -3.408746, -5.251349,
-3.379859, -3.408746, 5.845309,
-3.379859, 3.62649, -5.251349,
-3.379859, 3.62649, 5.845309,
-3.379859, -3.408746, -5.251349,
3.178411, -3.408746, -5.251349,
-3.379859, -3.408746, 5.845309,
3.178411, -3.408746, 5.845309,
-3.379859, 3.62649, -5.251349,
3.178411, 3.62649, -5.251349,
-3.379859, 3.62649, 5.845309,
3.178411, 3.62649, 5.845309,
3.178411, -3.408746, -5.251349,
3.178411, 3.62649, -5.251349,
3.178411, -3.408746, 5.845309,
3.178411, 3.62649, 5.845309,
3.178411, -3.408746, -5.251349,
3.178411, -3.408746, 5.845309,
3.178411, 3.62649, -5.251349,
3.178411, 3.62649, 5.845309
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
var radius = 7.84136;
var distance = 34.8871;
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
mvMatrix.translate( 0.1007245, -0.1088722, -0.2969801 );
mvMatrix.scale( 1.292754, 1.20511, 0.7640347 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.8871);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
sulfallate<-read.table("sulfallate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sulfallate$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulfallate' not found
```

```r
y<-sulfallate$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulfallate' not found
```

```r
z<-sulfallate$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulfallate' not found
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
-3.284351, -1.750796, -1.473144, 0, 0, 1, 1, 1,
-3.27139, 0.01264117, -2.237656, 1, 0, 0, 1, 1,
-2.980416, -1.373724, 1.093695, 1, 0, 0, 1, 1,
-2.895111, -0.09929407, -0.1664453, 1, 0, 0, 1, 1,
-2.844045, 0.2995894, -2.026528, 1, 0, 0, 1, 1,
-2.810672, -1.768709, -1.943215, 1, 0, 0, 1, 1,
-2.78962, 0.5253711, -1.288654, 0, 0, 0, 1, 1,
-2.676234, 0.7893031, -1.372846, 0, 0, 0, 1, 1,
-2.618424, -0.1740041, -2.802998, 0, 0, 0, 1, 1,
-2.615896, 1.214938, -0.1999782, 0, 0, 0, 1, 1,
-2.612489, -0.6224285, -1.223584, 0, 0, 0, 1, 1,
-2.571468, 0.5288886, -1.954207, 0, 0, 0, 1, 1,
-2.529278, -1.20549, -1.831886, 0, 0, 0, 1, 1,
-2.47156, -0.4937617, -1.776477, 1, 1, 1, 1, 1,
-2.462593, 0.05476996, -0.7582421, 1, 1, 1, 1, 1,
-2.409329, 1.132491, -1.459835, 1, 1, 1, 1, 1,
-2.319428, -0.9051548, -2.329028, 1, 1, 1, 1, 1,
-2.302467, 1.228395, -1.108926, 1, 1, 1, 1, 1,
-2.277726, 0.7331114, 0.002325104, 1, 1, 1, 1, 1,
-2.198556, 1.007554, -2.779276, 1, 1, 1, 1, 1,
-2.164871, -0.7334643, -2.529693, 1, 1, 1, 1, 1,
-2.14808, -1.437214, -3.886693, 1, 1, 1, 1, 1,
-2.131054, 0.349339, -0.8546287, 1, 1, 1, 1, 1,
-2.081285, 0.5736364, -2.296287, 1, 1, 1, 1, 1,
-2.057657, -1.232593, -0.8454998, 1, 1, 1, 1, 1,
-2.023353, -0.4933605, -2.373033, 1, 1, 1, 1, 1,
-2.016557, -0.405946, -1.713561, 1, 1, 1, 1, 1,
-1.964447, 0.7650236, -2.337717, 1, 1, 1, 1, 1,
-1.960602, -0.3966537, -1.749231, 0, 0, 1, 1, 1,
-1.934153, 1.45457, -1.170255, 1, 0, 0, 1, 1,
-1.913171, -1.010538, -2.27696, 1, 0, 0, 1, 1,
-1.888354, 0.3967975, -0.9888051, 1, 0, 0, 1, 1,
-1.868554, -2.386235, -1.394095, 1, 0, 0, 1, 1,
-1.838124, -0.4072253, -0.7187492, 1, 0, 0, 1, 1,
-1.789562, -2.401689, -2.40211, 0, 0, 0, 1, 1,
-1.780896, 0.9404708, -2.045697, 0, 0, 0, 1, 1,
-1.780003, 1.278244, -0.6281182, 0, 0, 0, 1, 1,
-1.762289, 0.7290665, -1.264746, 0, 0, 0, 1, 1,
-1.733903, -0.1897645, -1.732286, 0, 0, 0, 1, 1,
-1.711557, 1.157454, -0.05929292, 0, 0, 0, 1, 1,
-1.704069, 1.000485, 0.07987139, 0, 0, 0, 1, 1,
-1.70192, 0.05672441, -1.524966, 1, 1, 1, 1, 1,
-1.689112, -1.675638, -1.209944, 1, 1, 1, 1, 1,
-1.679206, -0.5723115, -2.204859, 1, 1, 1, 1, 1,
-1.669827, -0.02917468, -1.20192, 1, 1, 1, 1, 1,
-1.633918, -1.363389, -3.328944, 1, 1, 1, 1, 1,
-1.62968, 0.6756626, 0.1424023, 1, 1, 1, 1, 1,
-1.624327, 0.546959, -1.929541, 1, 1, 1, 1, 1,
-1.619897, -1.711091, -2.747731, 1, 1, 1, 1, 1,
-1.618367, -1.508544, -1.945631, 1, 1, 1, 1, 1,
-1.615813, -0.6680075, -1.268189, 1, 1, 1, 1, 1,
-1.610146, -1.0104, -3.632856, 1, 1, 1, 1, 1,
-1.591434, -0.07847894, -3.588489, 1, 1, 1, 1, 1,
-1.580356, -0.534941, -1.789101, 1, 1, 1, 1, 1,
-1.570143, -1.183526, -2.630006, 1, 1, 1, 1, 1,
-1.566244, 0.2275873, -1.424169, 1, 1, 1, 1, 1,
-1.560505, -0.9675297, -2.143378, 0, 0, 1, 1, 1,
-1.559732, 0.5594698, -0.7793653, 1, 0, 0, 1, 1,
-1.55202, -1.586202, -2.694925, 1, 0, 0, 1, 1,
-1.544307, -2.041322, -2.245552, 1, 0, 0, 1, 1,
-1.540546, -0.1206582, -0.9001399, 1, 0, 0, 1, 1,
-1.520777, 0.9934154, 0.1464687, 1, 0, 0, 1, 1,
-1.519585, 0.4228472, -2.396706, 0, 0, 0, 1, 1,
-1.518984, 2.117496, -0.3946432, 0, 0, 0, 1, 1,
-1.51328, 0.3059204, -0.8194696, 0, 0, 0, 1, 1,
-1.507742, -0.7520793, -4.532529, 0, 0, 0, 1, 1,
-1.490548, 1.324048, 0.5769795, 0, 0, 0, 1, 1,
-1.490375, -1.382753, -2.220883, 0, 0, 0, 1, 1,
-1.489336, 1.803294, -1.437396, 0, 0, 0, 1, 1,
-1.48736, -0.2520593, -0.06325627, 1, 1, 1, 1, 1,
-1.483563, -1.280939, -2.438812, 1, 1, 1, 1, 1,
-1.473741, -0.4323663, -3.211154, 1, 1, 1, 1, 1,
-1.46635, -1.012525, -0.2775171, 1, 1, 1, 1, 1,
-1.454138, 0.323637, -1.133363, 1, 1, 1, 1, 1,
-1.442068, 0.2138044, -1.757803, 1, 1, 1, 1, 1,
-1.415758, 1.959701, -0.2255695, 1, 1, 1, 1, 1,
-1.415603, -0.5505819, -0.01518791, 1, 1, 1, 1, 1,
-1.412929, -0.8178854, -1.183511, 1, 1, 1, 1, 1,
-1.404313, 0.5818811, 0.2601577, 1, 1, 1, 1, 1,
-1.386794, -0.8546904, -2.326872, 1, 1, 1, 1, 1,
-1.382523, 0.0924233, -1.138611, 1, 1, 1, 1, 1,
-1.379977, 1.569247, -0.2032066, 1, 1, 1, 1, 1,
-1.378636, -0.6329313, -2.559283, 1, 1, 1, 1, 1,
-1.373614, -0.3358176, -1.439949, 1, 1, 1, 1, 1,
-1.345908, -1.631293, -0.7492279, 0, 0, 1, 1, 1,
-1.335892, -0.3458266, -0.6821564, 1, 0, 0, 1, 1,
-1.335753, 0.3872075, -0.4780339, 1, 0, 0, 1, 1,
-1.334299, -0.5353183, -1.572927, 1, 0, 0, 1, 1,
-1.327208, 0.7284701, -1.019608, 1, 0, 0, 1, 1,
-1.325369, -1.990883, -3.524328, 1, 0, 0, 1, 1,
-1.322759, 0.5509306, -2.739228, 0, 0, 0, 1, 1,
-1.317602, -1.080796, -4.544727, 0, 0, 0, 1, 1,
-1.308809, 1.012134, -1.175299, 0, 0, 0, 1, 1,
-1.304406, -1.364581, -1.968663, 0, 0, 0, 1, 1,
-1.304275, -0.7421538, -1.038311, 0, 0, 0, 1, 1,
-1.300977, -1.429605, -1.146992, 0, 0, 0, 1, 1,
-1.296101, 0.4730208, -1.816547, 0, 0, 0, 1, 1,
-1.296009, -0.537941, -3.427449, 1, 1, 1, 1, 1,
-1.278345, 1.113372, 1.113698, 1, 1, 1, 1, 1,
-1.277784, -0.04029524, -1.023045, 1, 1, 1, 1, 1,
-1.27747, -1.807787, -3.287555, 1, 1, 1, 1, 1,
-1.272022, -1.04795, -1.30025, 1, 1, 1, 1, 1,
-1.258801, -0.8262285, -2.434835, 1, 1, 1, 1, 1,
-1.258618, 1.278913, -0.5397268, 1, 1, 1, 1, 1,
-1.258193, 0.9976126, -1.34543, 1, 1, 1, 1, 1,
-1.257916, 0.1784433, -1.510709, 1, 1, 1, 1, 1,
-1.255666, 1.021498, -0.9860463, 1, 1, 1, 1, 1,
-1.248538, -0.4717511, -0.9119551, 1, 1, 1, 1, 1,
-1.247201, -0.7222821, -1.900514, 1, 1, 1, 1, 1,
-1.246722, 0.8434033, -0.2960033, 1, 1, 1, 1, 1,
-1.245026, -0.1078591, -1.744202, 1, 1, 1, 1, 1,
-1.242334, 1.273804, -1.02476, 1, 1, 1, 1, 1,
-1.231926, -3.306291, -3.223773, 0, 0, 1, 1, 1,
-1.231304, -0.5785054, -1.563898, 1, 0, 0, 1, 1,
-1.227848, -0.9063914, -2.243944, 1, 0, 0, 1, 1,
-1.220387, -1.218547, -2.982257, 1, 0, 0, 1, 1,
-1.21816, 1.696146, -0.1499704, 1, 0, 0, 1, 1,
-1.215372, 0.2391584, -1.147895, 1, 0, 0, 1, 1,
-1.214328, -0.6678643, -2.156656, 0, 0, 0, 1, 1,
-1.212977, 0.9351267, 0.6723021, 0, 0, 0, 1, 1,
-1.206559, -0.002491486, -2.782047, 0, 0, 0, 1, 1,
-1.206486, -1.626016, -2.470394, 0, 0, 0, 1, 1,
-1.196587, -0.4132971, -2.519193, 0, 0, 0, 1, 1,
-1.193169, 0.747203, -1.720964, 0, 0, 0, 1, 1,
-1.184978, 0.1099772, -2.573299, 0, 0, 0, 1, 1,
-1.173692, 0.8565183, -1.687816, 1, 1, 1, 1, 1,
-1.170597, 0.5440257, -2.162555, 1, 1, 1, 1, 1,
-1.15932, 1.082859, -0.04767147, 1, 1, 1, 1, 1,
-1.152459, 0.3918442, -3.216884, 1, 1, 1, 1, 1,
-1.152252, 1.281165, -0.135933, 1, 1, 1, 1, 1,
-1.144883, 0.09624127, -1.110039, 1, 1, 1, 1, 1,
-1.144821, 0.09150685, -1.361327, 1, 1, 1, 1, 1,
-1.131712, 1.322549, -1.444227, 1, 1, 1, 1, 1,
-1.130487, -0.5665696, -2.610343, 1, 1, 1, 1, 1,
-1.124572, -1.561104, -2.655808, 1, 1, 1, 1, 1,
-1.123358, -2.472012, -3.454712, 1, 1, 1, 1, 1,
-1.12018, -0.4652573, -1.979241, 1, 1, 1, 1, 1,
-1.118808, 0.2051941, -0.6126314, 1, 1, 1, 1, 1,
-1.117628, 1.379244, 0.2189929, 1, 1, 1, 1, 1,
-1.112873, -1.121557, -2.894802, 1, 1, 1, 1, 1,
-1.108258, -1.323968, -3.895434, 0, 0, 1, 1, 1,
-1.096806, 0.3652442, -1.106919, 1, 0, 0, 1, 1,
-1.088191, 0.09537616, -1.318547, 1, 0, 0, 1, 1,
-1.083345, -0.1818745, -2.742303, 1, 0, 0, 1, 1,
-1.082381, 0.4474318, -2.19642, 1, 0, 0, 1, 1,
-1.074101, -1.894177, -2.575134, 1, 0, 0, 1, 1,
-1.066806, -0.7363936, -1.963392, 0, 0, 0, 1, 1,
-1.065936, -0.7656003, -0.09359966, 0, 0, 0, 1, 1,
-1.048384, -0.154256, -0.8215491, 0, 0, 0, 1, 1,
-1.0439, 1.411886, -1.332295, 0, 0, 0, 1, 1,
-1.042673, -1.116471, -2.376493, 0, 0, 0, 1, 1,
-1.041563, -0.2467524, -0.6430042, 0, 0, 0, 1, 1,
-1.033391, 1.365078, -1.012566, 0, 0, 0, 1, 1,
-1.031222, -0.6810598, -2.442105, 1, 1, 1, 1, 1,
-1.02534, -0.5728665, -1.483573, 1, 1, 1, 1, 1,
-1.022792, 1.236057, 0.2431165, 1, 1, 1, 1, 1,
-1.021801, -0.5422929, -3.301326, 1, 1, 1, 1, 1,
-1.020732, -0.1844008, -3.865429, 1, 1, 1, 1, 1,
-1.017358, 1.059725, -0.6475965, 1, 1, 1, 1, 1,
-1.014055, 0.7112904, -1.640709, 1, 1, 1, 1, 1,
-1.0023, 0.7382241, -1.240722, 1, 1, 1, 1, 1,
-0.9995417, 1.211365, -0.6097549, 1, 1, 1, 1, 1,
-0.9992898, -1.63457, -1.742106, 1, 1, 1, 1, 1,
-0.9990854, 0.5767207, -0.1847827, 1, 1, 1, 1, 1,
-0.9972978, -1.334326, -2.310018, 1, 1, 1, 1, 1,
-0.9930935, 0.2228669, -1.74448, 1, 1, 1, 1, 1,
-0.9908991, 0.5036196, -1.752955, 1, 1, 1, 1, 1,
-0.9843241, 0.857058, -1.743819, 1, 1, 1, 1, 1,
-0.9821156, 0.06341458, -1.487682, 0, 0, 1, 1, 1,
-0.9804825, -0.1298252, -1.006489, 1, 0, 0, 1, 1,
-0.969691, -1.117558, -4.666111, 1, 0, 0, 1, 1,
-0.9660293, -0.5807927, -0.3949651, 1, 0, 0, 1, 1,
-0.9650596, -0.7136816, -1.926579, 1, 0, 0, 1, 1,
-0.9612722, 0.8851573, -1.451753, 1, 0, 0, 1, 1,
-0.9606838, -1.592657, -1.763574, 0, 0, 0, 1, 1,
-0.960394, 1.456769, -0.4564827, 0, 0, 0, 1, 1,
-0.9508114, -0.771038, -1.465915, 0, 0, 0, 1, 1,
-0.9471706, 0.3277691, -2.458087, 0, 0, 0, 1, 1,
-0.9459524, 0.8520237, -2.308564, 0, 0, 0, 1, 1,
-0.9443479, -0.1356484, -2.135793, 0, 0, 0, 1, 1,
-0.9436297, 0.2298979, -2.755777, 0, 0, 0, 1, 1,
-0.9231128, -1.033806, -2.037331, 1, 1, 1, 1, 1,
-0.9084537, 1.363672, -0.6198163, 1, 1, 1, 1, 1,
-0.900354, -1.925547, -1.238419, 1, 1, 1, 1, 1,
-0.8966511, -1.255404, -2.594727, 1, 1, 1, 1, 1,
-0.8932441, -1.26151, -3.357988, 1, 1, 1, 1, 1,
-0.8868061, 1.434744, -1.912119, 1, 1, 1, 1, 1,
-0.88495, -1.30448, -1.441881, 1, 1, 1, 1, 1,
-0.8842065, 1.683127, -0.8660709, 1, 1, 1, 1, 1,
-0.8824914, -0.4559375, -3.258372, 1, 1, 1, 1, 1,
-0.882035, -0.2831075, -2.632491, 1, 1, 1, 1, 1,
-0.8727527, -1.160337, -0.9139099, 1, 1, 1, 1, 1,
-0.8720818, -1.227265, -2.708116, 1, 1, 1, 1, 1,
-0.8676751, -1.25126, -3.044352, 1, 1, 1, 1, 1,
-0.8660011, -1.118326, -0.8851818, 1, 1, 1, 1, 1,
-0.8647572, 0.5089687, -1.717809, 1, 1, 1, 1, 1,
-0.8642157, 0.2067201, -2.302077, 0, 0, 1, 1, 1,
-0.8612195, -1.184925, -3.134859, 1, 0, 0, 1, 1,
-0.8571298, 0.2233267, -3.420315, 1, 0, 0, 1, 1,
-0.853266, -0.5911594, -2.695152, 1, 0, 0, 1, 1,
-0.8531443, 0.3116308, -1.205465, 1, 0, 0, 1, 1,
-0.851975, 1.639395, 4.042654, 1, 0, 0, 1, 1,
-0.8486691, 2.453819, -0.7833586, 0, 0, 0, 1, 1,
-0.8469753, 0.4161184, -0.4830073, 0, 0, 0, 1, 1,
-0.8460518, 1.222419, -1.459787, 0, 0, 0, 1, 1,
-0.8434746, -0.9853204, 0.06222046, 0, 0, 0, 1, 1,
-0.8424233, -0.9644178, -2.32272, 0, 0, 0, 1, 1,
-0.8385421, 0.05670702, -1.493399, 0, 0, 0, 1, 1,
-0.8375371, 2.024372, -0.6582474, 0, 0, 0, 1, 1,
-0.8310438, 0.8798314, -2.437937, 1, 1, 1, 1, 1,
-0.8289654, -1.782715, -2.499395, 1, 1, 1, 1, 1,
-0.8272032, -1.400756, -1.730386, 1, 1, 1, 1, 1,
-0.8107502, 0.5408285, -1.974124, 1, 1, 1, 1, 1,
-0.8064812, 2.907345, -1.415354, 1, 1, 1, 1, 1,
-0.8058852, 0.8251673, -1.33715, 1, 1, 1, 1, 1,
-0.8058519, 0.511742, -0.3077225, 1, 1, 1, 1, 1,
-0.8052552, 0.1612181, 0.8159382, 1, 1, 1, 1, 1,
-0.7966917, -0.1615993, -3.189952, 1, 1, 1, 1, 1,
-0.7956498, 0.9321625, 1.102666, 1, 1, 1, 1, 1,
-0.7837549, -0.6220192, -2.874269, 1, 1, 1, 1, 1,
-0.7817477, -0.6653842, -1.577001, 1, 1, 1, 1, 1,
-0.7798262, 0.4123827, 0.9551358, 1, 1, 1, 1, 1,
-0.7796912, 2.170021, 0.5024585, 1, 1, 1, 1, 1,
-0.7676845, 0.155215, -1.015576, 1, 1, 1, 1, 1,
-0.7673995, 1.833655, -0.229619, 0, 0, 1, 1, 1,
-0.7667797, 0.8433279, -0.4134018, 1, 0, 0, 1, 1,
-0.7665767, 0.5750757, -1.093453, 1, 0, 0, 1, 1,
-0.7595973, 1.24327, 0.7143382, 1, 0, 0, 1, 1,
-0.7515978, -2.792929, -1.936897, 1, 0, 0, 1, 1,
-0.7452387, 0.1654896, -1.90819, 1, 0, 0, 1, 1,
-0.7445527, -0.2164168, -2.456839, 0, 0, 0, 1, 1,
-0.7425762, -0.6156771, -2.824984, 0, 0, 0, 1, 1,
-0.7414693, -0.6426073, -3.972702, 0, 0, 0, 1, 1,
-0.7397103, -0.6858661, -2.323835, 0, 0, 0, 1, 1,
-0.7262164, -0.2740771, 1.1013, 0, 0, 0, 1, 1,
-0.7235237, -0.08842862, -1.707033, 0, 0, 0, 1, 1,
-0.7109608, 0.363833, 1.4657, 0, 0, 0, 1, 1,
-0.7051345, 1.427107, -2.192551, 1, 1, 1, 1, 1,
-0.7029681, 0.6437764, -0.930478, 1, 1, 1, 1, 1,
-0.6952944, 0.4338419, -1.247573, 1, 1, 1, 1, 1,
-0.6837053, -0.4482553, -0.8653443, 1, 1, 1, 1, 1,
-0.6821285, 1.607573, -1.284452, 1, 1, 1, 1, 1,
-0.6798768, 1.32539, -0.7720732, 1, 1, 1, 1, 1,
-0.6786538, -1.376054, -2.618456, 1, 1, 1, 1, 1,
-0.6780968, 1.451556, -0.09066293, 1, 1, 1, 1, 1,
-0.6766602, 0.08331035, -0.3031962, 1, 1, 1, 1, 1,
-0.6701314, -0.9275379, -1.688303, 1, 1, 1, 1, 1,
-0.6544734, 0.577866, -0.6976146, 1, 1, 1, 1, 1,
-0.6525258, -0.679474, -3.471049, 1, 1, 1, 1, 1,
-0.6459753, -0.6362664, -3.159024, 1, 1, 1, 1, 1,
-0.6438145, 0.7577772, -1.322183, 1, 1, 1, 1, 1,
-0.6396099, 0.09518845, -0.8022469, 1, 1, 1, 1, 1,
-0.6394216, 0.6465629, 0.1855767, 0, 0, 1, 1, 1,
-0.6357971, 0.4867674, -1.272131, 1, 0, 0, 1, 1,
-0.6328586, 0.2432752, -0.724813, 1, 0, 0, 1, 1,
-0.6319347, 0.9459742, 0.04906259, 1, 0, 0, 1, 1,
-0.6312234, -1.729219, -2.976578, 1, 0, 0, 1, 1,
-0.6260586, -0.04785112, -0.8411657, 1, 0, 0, 1, 1,
-0.6214498, 0.6241654, -2.112529, 0, 0, 0, 1, 1,
-0.6202873, 1.367694, -1.520727, 0, 0, 0, 1, 1,
-0.6174747, 0.0272344, -3.057326, 0, 0, 0, 1, 1,
-0.6131334, 0.9370324, -0.8030247, 0, 0, 0, 1, 1,
-0.6092606, -1.007378, -3.284497, 0, 0, 0, 1, 1,
-0.6083441, -0.2012114, -3.029652, 0, 0, 0, 1, 1,
-0.6076542, 0.4994016, -0.5929624, 0, 0, 0, 1, 1,
-0.6049124, 0.01446758, -2.753947, 1, 1, 1, 1, 1,
-0.6037016, -0.6728471, -2.877094, 1, 1, 1, 1, 1,
-0.5963413, -0.4084138, -1.18006, 1, 1, 1, 1, 1,
-0.5954019, 0.3831924, -0.2909945, 1, 1, 1, 1, 1,
-0.5913001, -0.6122434, -2.472037, 1, 1, 1, 1, 1,
-0.5830587, 0.9350654, 0.7297769, 1, 1, 1, 1, 1,
-0.5815879, 0.08371705, -1.99023, 1, 1, 1, 1, 1,
-0.580063, -0.8889229, -4.035036, 1, 1, 1, 1, 1,
-0.579413, -0.08215726, -2.413702, 1, 1, 1, 1, 1,
-0.5781481, -1.681688, -3.736122, 1, 1, 1, 1, 1,
-0.5650659, -1.320334, -3.137666, 1, 1, 1, 1, 1,
-0.563436, 0.3807237, 0.6717728, 1, 1, 1, 1, 1,
-0.5631496, -0.4433385, -1.129219, 1, 1, 1, 1, 1,
-0.5600928, 0.3115167, -1.401358, 1, 1, 1, 1, 1,
-0.5598642, -0.3820003, -2.568523, 1, 1, 1, 1, 1,
-0.55959, 1.155872, -1.243985, 0, 0, 1, 1, 1,
-0.5539518, -0.7886578, -2.201339, 1, 0, 0, 1, 1,
-0.5492141, 0.3484258, -1.276809, 1, 0, 0, 1, 1,
-0.5454602, -0.919939, -1.728293, 1, 0, 0, 1, 1,
-0.5415298, 0.576923, 0.4301904, 1, 0, 0, 1, 1,
-0.5397331, 0.2194299, -1.323089, 1, 0, 0, 1, 1,
-0.5380446, -0.5437566, -1.790736, 0, 0, 0, 1, 1,
-0.5370721, 0.2289762, -2.66573, 0, 0, 0, 1, 1,
-0.5339163, -0.6115587, -1.755917, 0, 0, 0, 1, 1,
-0.53046, 1.01872, 0.9632369, 0, 0, 0, 1, 1,
-0.5284688, 0.6399639, 0.46446, 0, 0, 0, 1, 1,
-0.5278875, -0.008841828, -1.623411, 0, 0, 0, 1, 1,
-0.5271273, -0.4160598, -2.763572, 0, 0, 0, 1, 1,
-0.5257884, 0.4475579, 0.360773, 1, 1, 1, 1, 1,
-0.5209826, 0.4121313, -1.332427, 1, 1, 1, 1, 1,
-0.5207393, -0.002126153, 0.9207146, 1, 1, 1, 1, 1,
-0.5196148, -0.9882995, -2.337814, 1, 1, 1, 1, 1,
-0.51273, 0.3109198, -0.9553304, 1, 1, 1, 1, 1,
-0.5117875, -0.6275655, -3.712718, 1, 1, 1, 1, 1,
-0.5073134, -0.3395368, -4.086591, 1, 1, 1, 1, 1,
-0.5003222, 2.677203, -0.0457489, 1, 1, 1, 1, 1,
-0.4964023, -0.3211874, -2.209207, 1, 1, 1, 1, 1,
-0.4946956, -1.582498, -4.031991, 1, 1, 1, 1, 1,
-0.4899005, -0.2337368, -1.698105, 1, 1, 1, 1, 1,
-0.4876901, 0.3641026, -2.008091, 1, 1, 1, 1, 1,
-0.4823398, -0.732383, -1.599404, 1, 1, 1, 1, 1,
-0.4821666, 0.9453692, -0.475851, 1, 1, 1, 1, 1,
-0.481548, -1.46571, -2.721211, 1, 1, 1, 1, 1,
-0.4772561, 1.174594, -3.032792, 0, 0, 1, 1, 1,
-0.4733103, 0.2489649, -0.226413, 1, 0, 0, 1, 1,
-0.4653274, -0.02535975, -2.047148, 1, 0, 0, 1, 1,
-0.4600877, 0.3931897, -1.077086, 1, 0, 0, 1, 1,
-0.4540824, -0.7492411, -4.655075, 1, 0, 0, 1, 1,
-0.4535465, -0.7017566, -3.722471, 1, 0, 0, 1, 1,
-0.452363, 0.08764757, -2.099983, 0, 0, 0, 1, 1,
-0.4514109, 0.5577713, -1.949908, 0, 0, 0, 1, 1,
-0.4467469, 0.597715, 0.404945, 0, 0, 0, 1, 1,
-0.4434391, -0.106697, -2.852529, 0, 0, 0, 1, 1,
-0.4414912, 0.2241147, -2.164103, 0, 0, 0, 1, 1,
-0.4330277, -0.04325292, -1.711725, 0, 0, 0, 1, 1,
-0.4292901, -0.5304266, -1.600677, 0, 0, 0, 1, 1,
-0.4272321, 0.7685669, -1.805795, 1, 1, 1, 1, 1,
-0.4250956, -0.3849463, -1.75912, 1, 1, 1, 1, 1,
-0.424547, 0.3661041, -0.6594491, 1, 1, 1, 1, 1,
-0.4241539, 0.7092633, 0.1419352, 1, 1, 1, 1, 1,
-0.4217963, -2.056433, -3.75123, 1, 1, 1, 1, 1,
-0.4214187, -0.1876688, -1.422511, 1, 1, 1, 1, 1,
-0.4147903, 1.295905, -2.841124, 1, 1, 1, 1, 1,
-0.4139971, 0.6051551, -0.4111367, 1, 1, 1, 1, 1,
-0.4135152, 0.03893519, -0.694915, 1, 1, 1, 1, 1,
-0.4085982, 1.574822, -0.4765515, 1, 1, 1, 1, 1,
-0.4042674, 0.901849, -0.06978799, 1, 1, 1, 1, 1,
-0.3968388, 1.266712, -0.07685557, 1, 1, 1, 1, 1,
-0.390314, -0.6524162, -1.397526, 1, 1, 1, 1, 1,
-0.3891153, -0.58622, -2.625004, 1, 1, 1, 1, 1,
-0.3823985, 0.5196526, -1.594102, 1, 1, 1, 1, 1,
-0.3773672, 0.2227926, -2.354537, 0, 0, 1, 1, 1,
-0.3747991, 1.223561, 0.06556054, 1, 0, 0, 1, 1,
-0.3709584, 1.88604, -1.201754, 1, 0, 0, 1, 1,
-0.370209, -1.119021, -1.965165, 1, 0, 0, 1, 1,
-0.3686639, -0.1787792, -1.267166, 1, 0, 0, 1, 1,
-0.3674287, 1.813721, -0.936061, 1, 0, 0, 1, 1,
-0.3646758, 0.2157914, -2.279603, 0, 0, 0, 1, 1,
-0.3642541, -1.965115, -1.385903, 0, 0, 0, 1, 1,
-0.3594184, 0.8075695, -1.169645, 0, 0, 0, 1, 1,
-0.3589368, 1.421953, 0.6242325, 0, 0, 0, 1, 1,
-0.3570627, -1.381497, -3.395783, 0, 0, 0, 1, 1,
-0.3497971, 0.9820571, -1.288879, 0, 0, 0, 1, 1,
-0.3485216, 0.8046196, -0.6985667, 0, 0, 0, 1, 1,
-0.3471579, 0.9269871, 0.1800054, 1, 1, 1, 1, 1,
-0.3419894, -0.1588539, -3.016915, 1, 1, 1, 1, 1,
-0.3416305, 1.049393, -0.1440861, 1, 1, 1, 1, 1,
-0.3390302, 0.9796166, 1.108311, 1, 1, 1, 1, 1,
-0.336573, 0.1877331, -2.047004, 1, 1, 1, 1, 1,
-0.3314815, 1.402908, 0.6669622, 1, 1, 1, 1, 1,
-0.3311516, 0.5909038, -1.110819, 1, 1, 1, 1, 1,
-0.3280562, -0.148738, -1.676489, 1, 1, 1, 1, 1,
-0.3254289, 1.567906, 0.4948937, 1, 1, 1, 1, 1,
-0.3251462, -0.2491018, 0.9085681, 1, 1, 1, 1, 1,
-0.3248481, 1.675176, 1.100144, 1, 1, 1, 1, 1,
-0.3241798, -0.245805, -1.987051, 1, 1, 1, 1, 1,
-0.3224031, 1.764515, 2.183633, 1, 1, 1, 1, 1,
-0.3170429, 0.7843881, -0.2825083, 1, 1, 1, 1, 1,
-0.3120741, 0.9361544, 0.5102687, 1, 1, 1, 1, 1,
-0.3111159, 0.6437715, -1.196651, 0, 0, 1, 1, 1,
-0.3077725, -0.1664619, -2.477694, 1, 0, 0, 1, 1,
-0.3058871, 0.05650547, -0.7182393, 1, 0, 0, 1, 1,
-0.3028914, -0.1949171, -0.7718091, 1, 0, 0, 1, 1,
-0.3021907, -0.7238023, -1.184791, 1, 0, 0, 1, 1,
-0.3018608, 0.1218016, -0.2777092, 1, 0, 0, 1, 1,
-0.3005778, 0.3423943, -0.6027874, 0, 0, 0, 1, 1,
-0.2976021, 0.5395384, 1.077994, 0, 0, 0, 1, 1,
-0.2972856, -0.03330703, -0.1659155, 0, 0, 0, 1, 1,
-0.2946829, 0.8389049, 1.136896, 0, 0, 0, 1, 1,
-0.2895072, 0.1151159, -1.475598, 0, 0, 0, 1, 1,
-0.2871145, 0.8467825, -1.051698, 0, 0, 0, 1, 1,
-0.2841941, 1.279813, -0.4733198, 0, 0, 0, 1, 1,
-0.2826301, -0.3946335, -1.63713, 1, 1, 1, 1, 1,
-0.2815307, 0.5512776, -1.162161, 1, 1, 1, 1, 1,
-0.2807914, 0.9276723, -0.7293849, 1, 1, 1, 1, 1,
-0.2801019, -0.6200961, -2.414924, 1, 1, 1, 1, 1,
-0.2766347, -1.329706, -1.620955, 1, 1, 1, 1, 1,
-0.2755419, -0.4956716, -1.940479, 1, 1, 1, 1, 1,
-0.273828, -2.192968, -3.040683, 1, 1, 1, 1, 1,
-0.2734908, -1.11086, -3.901979, 1, 1, 1, 1, 1,
-0.2716429, -0.7816318, -2.109725, 1, 1, 1, 1, 1,
-0.2710136, -0.2440553, -1.844383, 1, 1, 1, 1, 1,
-0.2639013, -0.183584, -0.9485726, 1, 1, 1, 1, 1,
-0.2636915, -0.01152713, -1.526808, 1, 1, 1, 1, 1,
-0.2582403, 1.868224, 0.3390339, 1, 1, 1, 1, 1,
-0.2581908, -1.764, -1.941326, 1, 1, 1, 1, 1,
-0.2549388, -1.558381, -5.015097, 1, 1, 1, 1, 1,
-0.2529273, -0.4872934, -3.88923, 0, 0, 1, 1, 1,
-0.2522911, -2.080898, -3.007175, 1, 0, 0, 1, 1,
-0.2513669, -0.8744655, -2.844268, 1, 0, 0, 1, 1,
-0.2508004, -0.1082829, -2.939315, 1, 0, 0, 1, 1,
-0.2468183, -0.03083107, -3.279408, 1, 0, 0, 1, 1,
-0.2448131, 0.8748513, -0.4794652, 1, 0, 0, 1, 1,
-0.2403909, -0.1076116, -1.685961, 0, 0, 0, 1, 1,
-0.2372022, 2.426801, 1.327539, 0, 0, 0, 1, 1,
-0.2361857, -0.5956419, -1.641448, 0, 0, 0, 1, 1,
-0.233597, -0.3518495, -1.998352, 0, 0, 0, 1, 1,
-0.2325647, -0.9235064, -2.047119, 0, 0, 0, 1, 1,
-0.2322125, -0.4937248, -2.900324, 0, 0, 0, 1, 1,
-0.2266745, -0.5985798, -4.130317, 0, 0, 0, 1, 1,
-0.2251726, 1.31678, 0.6906797, 1, 1, 1, 1, 1,
-0.2235474, -1.474545, -2.177619, 1, 1, 1, 1, 1,
-0.2224367, -0.6665359, -3.063383, 1, 1, 1, 1, 1,
-0.2220215, -0.1764985, 0.1842331, 1, 1, 1, 1, 1,
-0.2198424, -0.7648259, -2.57566, 1, 1, 1, 1, 1,
-0.2165521, -0.04533881, -1.111515, 1, 1, 1, 1, 1,
-0.2136497, -0.5618125, -2.141587, 1, 1, 1, 1, 1,
-0.2064778, 0.7782875, -0.3135783, 1, 1, 1, 1, 1,
-0.2056737, -1.186194, -2.971519, 1, 1, 1, 1, 1,
-0.2023118, 1.724139, 0.8061924, 1, 1, 1, 1, 1,
-0.1957077, 1.774679, 1.472238, 1, 1, 1, 1, 1,
-0.1955852, 0.4398787, 2.031301, 1, 1, 1, 1, 1,
-0.1943954, 0.9143405, -1.728278, 1, 1, 1, 1, 1,
-0.1903058, -0.88796, -4.770054, 1, 1, 1, 1, 1,
-0.1900298, 0.5253252, -1.599412, 1, 1, 1, 1, 1,
-0.1864056, 1.117315, -0.7755478, 0, 0, 1, 1, 1,
-0.1863047, 0.1918558, -0.7949728, 1, 0, 0, 1, 1,
-0.182719, 0.6938621, -0.8430967, 1, 0, 0, 1, 1,
-0.1773875, -0.6853755, -4.810744, 1, 0, 0, 1, 1,
-0.1744833, -0.3333268, -2.448841, 1, 0, 0, 1, 1,
-0.1706788, -0.02694735, -2.200836, 1, 0, 0, 1, 1,
-0.167444, -0.5613957, -1.936305, 0, 0, 0, 1, 1,
-0.1663217, -0.08425724, -2.295822, 0, 0, 0, 1, 1,
-0.1663064, -0.837002, -0.6985546, 0, 0, 0, 1, 1,
-0.1639344, -0.005762396, -1.601231, 0, 0, 0, 1, 1,
-0.1635099, 0.991817, -2.703675, 0, 0, 0, 1, 1,
-0.1623545, 0.06248006, -2.344722, 0, 0, 0, 1, 1,
-0.1619527, 0.474815, 0.6167749, 0, 0, 0, 1, 1,
-0.1605653, -0.1258622, -2.822919, 1, 1, 1, 1, 1,
-0.1599095, 0.9930648, -0.6423331, 1, 1, 1, 1, 1,
-0.1511737, 0.6535362, 0.4710883, 1, 1, 1, 1, 1,
-0.150204, 2.660851, -1.456589, 1, 1, 1, 1, 1,
-0.1453552, 0.8671795, -0.8846139, 1, 1, 1, 1, 1,
-0.1448201, -0.1533595, -0.476181, 1, 1, 1, 1, 1,
-0.1445066, -1.458425, -2.732253, 1, 1, 1, 1, 1,
-0.1440871, -1.446872, -4.41784, 1, 1, 1, 1, 1,
-0.1434135, -0.2799379, -1.661413, 1, 1, 1, 1, 1,
-0.1428747, 0.3681374, -0.7601071, 1, 1, 1, 1, 1,
-0.1427616, -0.1255516, -1.190336, 1, 1, 1, 1, 1,
-0.1423699, 0.477069, 0.4075465, 1, 1, 1, 1, 1,
-0.1375379, -1.98341, -3.081926, 1, 1, 1, 1, 1,
-0.1374628, 0.8703912, 1.54451, 1, 1, 1, 1, 1,
-0.1340296, 1.744082, 0.7978632, 1, 1, 1, 1, 1,
-0.1320102, 1.131944, -0.1947426, 0, 0, 1, 1, 1,
-0.1279998, 1.25831, -3.046067, 1, 0, 0, 1, 1,
-0.1277081, 1.262817, 0.0303331, 1, 0, 0, 1, 1,
-0.1225679, -0.08039061, -3.164735, 1, 0, 0, 1, 1,
-0.1214066, 0.7997082, -0.5244483, 1, 0, 0, 1, 1,
-0.1181205, 0.1966637, 1.045489, 1, 0, 0, 1, 1,
-0.1175256, 0.1189689, -1.450332, 0, 0, 0, 1, 1,
-0.1170101, -0.8975835, -3.883801, 0, 0, 0, 1, 1,
-0.110953, -2.063978, -4.299277, 0, 0, 0, 1, 1,
-0.1102425, -0.2535706, -3.970299, 0, 0, 0, 1, 1,
-0.1074244, -0.007159646, -1.782377, 0, 0, 0, 1, 1,
-0.107304, 1.825749, 0.8217603, 0, 0, 0, 1, 1,
-0.1043177, 0.6250142, 2.212183, 0, 0, 0, 1, 1,
-0.102839, 0.2361512, 1.017087, 1, 1, 1, 1, 1,
-0.1027598, -0.5492585, -4.758829, 1, 1, 1, 1, 1,
-0.09790828, -0.3231731, -2.410313, 1, 1, 1, 1, 1,
-0.09403132, -0.1823465, -5.089747, 1, 1, 1, 1, 1,
-0.08656774, -1.206794, -3.947793, 1, 1, 1, 1, 1,
-0.08463173, -0.8934211, -2.735084, 1, 1, 1, 1, 1,
-0.08454783, -0.01308533, -1.74343, 1, 1, 1, 1, 1,
-0.08279536, -1.406927, -2.603025, 1, 1, 1, 1, 1,
-0.08206651, 0.4083119, 0.2258203, 1, 1, 1, 1, 1,
-0.08139466, -1.591206, -2.867398, 1, 1, 1, 1, 1,
-0.06625609, 0.6913368, 1.761873, 1, 1, 1, 1, 1,
-0.06340791, 0.4335702, -0.02126039, 1, 1, 1, 1, 1,
-0.06264041, -1.439839, -3.058154, 1, 1, 1, 1, 1,
-0.06226979, 0.8768831, 1.142961, 1, 1, 1, 1, 1,
-0.05848897, 0.8401275, -1.471527, 1, 1, 1, 1, 1,
-0.05795483, -0.4427432, -2.889798, 0, 0, 1, 1, 1,
-0.05694307, -1.193934, -3.411362, 1, 0, 0, 1, 1,
-0.05559806, 0.4130513, -0.8154987, 1, 0, 0, 1, 1,
-0.05360429, -0.2482498, -3.693687, 1, 0, 0, 1, 1,
-0.04153697, 0.4632478, 0.5955211, 1, 0, 0, 1, 1,
-0.04046587, 0.9092364, 0.6148075, 1, 0, 0, 1, 1,
-0.03515298, 0.2097455, -0.8105233, 0, 0, 0, 1, 1,
-0.03352302, -0.5875455, -3.195716, 0, 0, 0, 1, 1,
-0.03223639, 0.5010759, -1.244123, 0, 0, 0, 1, 1,
-0.03158921, 0.184263, -1.42012, 0, 0, 0, 1, 1,
-0.02949665, 0.1386349, -0.6010454, 0, 0, 0, 1, 1,
-0.02904243, -0.1787387, -2.988652, 0, 0, 0, 1, 1,
-0.0284523, -0.3517714, -3.286039, 0, 0, 0, 1, 1,
-0.02778773, 0.9397759, -0.03761568, 1, 1, 1, 1, 1,
-0.01782002, 0.2667264, -0.2370559, 1, 1, 1, 1, 1,
-0.01733859, -0.780103, -4.98276, 1, 1, 1, 1, 1,
-0.01572771, 1.47811, 1.034773, 1, 1, 1, 1, 1,
-0.01567418, -0.1916779, -3.365143, 1, 1, 1, 1, 1,
-0.01421411, -0.1860469, -4.571353, 1, 1, 1, 1, 1,
-0.01419474, 1.577438, 1.122831, 1, 1, 1, 1, 1,
-0.01378187, 0.5236809, 0.05694076, 1, 1, 1, 1, 1,
-0.01335972, -0.1792379, -4.775268, 1, 1, 1, 1, 1,
-0.009818189, 0.2896436, 0.1328585, 1, 1, 1, 1, 1,
-0.009028245, 0.8668281, -1.255646, 1, 1, 1, 1, 1,
-0.007863196, 0.845814, 0.2878971, 1, 1, 1, 1, 1,
-0.005353576, -1.447614, -3.244722, 1, 1, 1, 1, 1,
-0.001208276, -0.2708263, -3.52061, 1, 1, 1, 1, 1,
0.001304894, -0.3989681, 2.314812, 1, 1, 1, 1, 1,
0.001559691, -0.651769, 2.284728, 0, 0, 1, 1, 1,
0.001625351, -0.06364029, 3.33381, 1, 0, 0, 1, 1,
0.002513678, 0.6915796, -0.4709271, 1, 0, 0, 1, 1,
0.003014545, -0.1152807, 1.971683, 1, 0, 0, 1, 1,
0.004911259, -0.0811744, 2.13098, 1, 0, 0, 1, 1,
0.005435685, 0.4341336, -0.4599647, 1, 0, 0, 1, 1,
0.006812323, -1.157211, 3.780032, 0, 0, 0, 1, 1,
0.007741808, 1.207793, 1.010864, 0, 0, 0, 1, 1,
0.01449209, -0.4595952, 3.641901, 0, 0, 0, 1, 1,
0.01496674, 1.49547, -1.275111, 0, 0, 0, 1, 1,
0.01528738, -0.9454424, 3.701013, 0, 0, 0, 1, 1,
0.01892242, -0.6272606, 2.892476, 0, 0, 0, 1, 1,
0.02406085, 1.629321, 0.217627, 0, 0, 0, 1, 1,
0.02518344, 0.9086559, 0.6781882, 1, 1, 1, 1, 1,
0.02586049, 0.1865897, 0.3846689, 1, 1, 1, 1, 1,
0.02946035, 1.204624, 0.5208467, 1, 1, 1, 1, 1,
0.03648806, 0.5666012, 0.5510151, 1, 1, 1, 1, 1,
0.03905451, 0.7730962, 0.2919322, 1, 1, 1, 1, 1,
0.04342614, -0.6025481, 3.518972, 1, 1, 1, 1, 1,
0.04417901, 2.352069, 0.8706914, 1, 1, 1, 1, 1,
0.04727055, -0.7028158, 2.305821, 1, 1, 1, 1, 1,
0.04953002, 1.225446, 2.705019, 1, 1, 1, 1, 1,
0.05145978, -0.438306, 3.648345, 1, 1, 1, 1, 1,
0.05340004, -0.3208129, 4.134724, 1, 1, 1, 1, 1,
0.05473872, 1.301646, 0.2477724, 1, 1, 1, 1, 1,
0.05699931, -0.5251569, 3.505836, 1, 1, 1, 1, 1,
0.0613332, 0.8682408, -0.4650955, 1, 1, 1, 1, 1,
0.06344143, -1.573532, 4.281312, 1, 1, 1, 1, 1,
0.0637238, 0.4128048, 1.080477, 0, 0, 1, 1, 1,
0.06949156, 0.6986479, 1.881499, 1, 0, 0, 1, 1,
0.07040942, -0.01163493, 1.861136, 1, 0, 0, 1, 1,
0.07864211, -0.04869545, 1.988016, 1, 0, 0, 1, 1,
0.07912971, -0.3512268, 1.475955, 1, 0, 0, 1, 1,
0.07951485, 1.106185, 0.6415645, 1, 0, 0, 1, 1,
0.08255781, 0.3309176, 1.661886, 0, 0, 0, 1, 1,
0.08260278, 1.828075, 0.921677, 0, 0, 0, 1, 1,
0.08317371, -0.9787467, 3.282457, 0, 0, 0, 1, 1,
0.08493952, 0.8502145, -0.8660263, 0, 0, 0, 1, 1,
0.08651154, 0.106619, 1.258578, 0, 0, 0, 1, 1,
0.09242962, 0.6838546, -0.3077454, 0, 0, 0, 1, 1,
0.1008365, 0.2127677, 0.6439068, 0, 0, 0, 1, 1,
0.1079657, 1.682901, -1.017321, 1, 1, 1, 1, 1,
0.1108177, -0.2241455, 2.844272, 1, 1, 1, 1, 1,
0.1108898, -0.07015938, 3.364153, 1, 1, 1, 1, 1,
0.1116022, -0.2844443, 1.547875, 1, 1, 1, 1, 1,
0.1137737, 1.349465, -0.0744804, 1, 1, 1, 1, 1,
0.1155827, 0.794066, 1.058464, 1, 1, 1, 1, 1,
0.1179528, 2.94105, 1.971737, 1, 1, 1, 1, 1,
0.1286625, -1.759071, 3.985286, 1, 1, 1, 1, 1,
0.1310796, -0.8398803, 0.08448681, 1, 1, 1, 1, 1,
0.1370497, 1.174281, -0.5933096, 1, 1, 1, 1, 1,
0.1383972, -1.411975, 3.674364, 1, 1, 1, 1, 1,
0.1385736, -0.8008152, 5.683707, 1, 1, 1, 1, 1,
0.1393163, -1.62544, 3.746958, 1, 1, 1, 1, 1,
0.1396464, 0.3273717, 1.17044, 1, 1, 1, 1, 1,
0.1425165, 1.483284, 1.14388, 1, 1, 1, 1, 1,
0.1493233, -0.3740696, 2.293175, 0, 0, 1, 1, 1,
0.1501671, 0.9909816, -0.1177308, 1, 0, 0, 1, 1,
0.1567674, -0.501734, 2.131012, 1, 0, 0, 1, 1,
0.1579208, 0.4672427, 0.2404609, 1, 0, 0, 1, 1,
0.1645812, -0.6082342, 2.454393, 1, 0, 0, 1, 1,
0.1646013, -0.8478833, 3.28366, 1, 0, 0, 1, 1,
0.1681858, 1.22226, 0.4947041, 0, 0, 0, 1, 1,
0.1702948, 0.7357923, -0.1779424, 0, 0, 0, 1, 1,
0.1707187, -0.5197251, 3.861466, 0, 0, 0, 1, 1,
0.1724735, -0.1600841, 2.387905, 0, 0, 0, 1, 1,
0.1725693, 0.6795439, 1.620265, 0, 0, 0, 1, 1,
0.1749077, -0.6366065, 0.8444558, 0, 0, 0, 1, 1,
0.1757006, 0.2510398, 1.3169, 0, 0, 0, 1, 1,
0.1763938, 0.3349451, -0.1735331, 1, 1, 1, 1, 1,
0.1781681, -0.4147522, 2.22, 1, 1, 1, 1, 1,
0.1783625, -0.141673, 0.9214162, 1, 1, 1, 1, 1,
0.179291, -0.08427267, 1.343785, 1, 1, 1, 1, 1,
0.1801166, 0.636519, 0.7521046, 1, 1, 1, 1, 1,
0.1808396, -0.5433528, 2.193496, 1, 1, 1, 1, 1,
0.1891777, 0.4240434, 1.466449, 1, 1, 1, 1, 1,
0.1937489, 0.588753, 1.208264, 1, 1, 1, 1, 1,
0.1960986, -0.1295166, 3.833335, 1, 1, 1, 1, 1,
0.1965343, -0.2975034, 3.421937, 1, 1, 1, 1, 1,
0.1986228, -0.9099656, 3.951081, 1, 1, 1, 1, 1,
0.2006349, -0.1008627, 3.334804, 1, 1, 1, 1, 1,
0.2021547, -0.6294931, 1.583171, 1, 1, 1, 1, 1,
0.2029122, 0.145329, 1.758908, 1, 1, 1, 1, 1,
0.2037997, 0.2896174, 0.4074295, 1, 1, 1, 1, 1,
0.2069665, 0.2667854, -3.383198, 0, 0, 1, 1, 1,
0.2075431, -1.325425, 0.7872032, 1, 0, 0, 1, 1,
0.2094771, -0.5863739, 2.203256, 1, 0, 0, 1, 1,
0.2100497, 0.9055827, 1.349982, 1, 0, 0, 1, 1,
0.2133343, 1.069088, -0.5310934, 1, 0, 0, 1, 1,
0.2160031, 0.8446612, 1.381189, 1, 0, 0, 1, 1,
0.2167664, -0.5146438, 2.746454, 0, 0, 0, 1, 1,
0.2168486, 0.5556767, 1.349866, 0, 0, 0, 1, 1,
0.2170283, -0.462735, 2.519524, 0, 0, 0, 1, 1,
0.2170638, 0.7104342, 1.108099, 0, 0, 0, 1, 1,
0.2199801, 0.8389277, -0.5726206, 0, 0, 0, 1, 1,
0.2251219, -0.4600017, 1.520801, 0, 0, 0, 1, 1,
0.22583, -1.792431, 3.234219, 0, 0, 0, 1, 1,
0.2261484, -2.146172, 3.805809, 1, 1, 1, 1, 1,
0.2400182, 1.197371, -0.2422409, 1, 1, 1, 1, 1,
0.2406086, 0.2792691, 1.824835, 1, 1, 1, 1, 1,
0.2458539, 0.1382334, 1.336832, 1, 1, 1, 1, 1,
0.2482872, 0.06943512, 1.258166, 1, 1, 1, 1, 1,
0.2496502, -0.6872305, 3.094535, 1, 1, 1, 1, 1,
0.2497623, 0.00245362, 0.942866, 1, 1, 1, 1, 1,
0.2543799, -0.6597711, 3.092889, 1, 1, 1, 1, 1,
0.2570194, 0.350566, -0.218815, 1, 1, 1, 1, 1,
0.2620478, 1.200463, 0.8038252, 1, 1, 1, 1, 1,
0.2633885, 0.3810706, -0.05449331, 1, 1, 1, 1, 1,
0.2652728, 0.4906509, 2.074194, 1, 1, 1, 1, 1,
0.2669923, 1.657817, -0.683785, 1, 1, 1, 1, 1,
0.2720053, -0.7214143, 3.884172, 1, 1, 1, 1, 1,
0.2770327, 0.0949665, 0.08490299, 1, 1, 1, 1, 1,
0.2781746, -0.9212863, 2.860756, 0, 0, 1, 1, 1,
0.2782982, -1.735473, 2.119374, 1, 0, 0, 1, 1,
0.281519, 2.002135, -1.252908, 1, 0, 0, 1, 1,
0.2822122, -0.3650392, 4.343338, 1, 0, 0, 1, 1,
0.2830946, 0.6168293, -0.0969386, 1, 0, 0, 1, 1,
0.2838402, 0.2222251, 2.798459, 1, 0, 0, 1, 1,
0.2875676, -0.1990667, 2.459113, 0, 0, 0, 1, 1,
0.2901905, -0.8755165, 2.570125, 0, 0, 0, 1, 1,
0.2942042, -0.9577001, 1.482012, 0, 0, 0, 1, 1,
0.2971034, 1.653549, 0.7280791, 0, 0, 0, 1, 1,
0.2978933, 0.3764433, 1.859501, 0, 0, 0, 1, 1,
0.3012682, -0.01542015, 2.26658, 0, 0, 0, 1, 1,
0.3034401, 0.6090576, 0.6587416, 0, 0, 0, 1, 1,
0.306297, -0.6286526, 2.117395, 1, 1, 1, 1, 1,
0.3064092, -1.236861, 1.919493, 1, 1, 1, 1, 1,
0.3113679, -0.3747957, 1.925884, 1, 1, 1, 1, 1,
0.3133681, 0.8147214, -0.4631999, 1, 1, 1, 1, 1,
0.3134735, 0.853569, 0.7265899, 1, 1, 1, 1, 1,
0.3136163, 0.6788611, 0.06498636, 1, 1, 1, 1, 1,
0.3137015, 0.2963944, -0.2860653, 1, 1, 1, 1, 1,
0.3163513, -1.17898, 3.618207, 1, 1, 1, 1, 1,
0.3168118, -0.01495325, 1.114101, 1, 1, 1, 1, 1,
0.3183888, -1.456553, 3.64611, 1, 1, 1, 1, 1,
0.3216403, 0.9726665, 1.763755, 1, 1, 1, 1, 1,
0.3227476, -0.6727005, 3.288538, 1, 1, 1, 1, 1,
0.3234748, 3.524035, 0.8497773, 1, 1, 1, 1, 1,
0.3307842, -0.9887733, 4.204171, 1, 1, 1, 1, 1,
0.3321343, 0.7025909, -0.07300244, 1, 1, 1, 1, 1,
0.3407705, -0.1511286, 1.17308, 0, 0, 1, 1, 1,
0.3437178, -0.01670972, 1.085524, 1, 0, 0, 1, 1,
0.3445371, 1.578048, 1.630048, 1, 0, 0, 1, 1,
0.348298, -1.918344, 5.161819, 1, 0, 0, 1, 1,
0.3525508, 0.4195863, 0.1989688, 1, 0, 0, 1, 1,
0.355628, 0.8660836, 0.2568652, 1, 0, 0, 1, 1,
0.3584254, -0.0532438, 1.825751, 0, 0, 0, 1, 1,
0.3609525, -1.64771, 2.817497, 0, 0, 0, 1, 1,
0.3634019, 0.5856295, 0.2636326, 0, 0, 0, 1, 1,
0.3672703, 2.264611, 1.011239, 0, 0, 0, 1, 1,
0.3720931, 0.3123215, 1.997557, 0, 0, 0, 1, 1,
0.3739699, 0.986593, -0.1543159, 0, 0, 0, 1, 1,
0.3741711, -0.1716058, 1.77649, 0, 0, 0, 1, 1,
0.3771942, -1.174705, 2.288446, 1, 1, 1, 1, 1,
0.3783061, 0.6463363, 0.6944135, 1, 1, 1, 1, 1,
0.3783191, -0.3876189, 1.192058, 1, 1, 1, 1, 1,
0.378645, -0.6677518, 1.791043, 1, 1, 1, 1, 1,
0.3856159, -1.170437, 3.373604, 1, 1, 1, 1, 1,
0.3883514, -1.868949, 4.116615, 1, 1, 1, 1, 1,
0.3925316, -2.419342, 3.333699, 1, 1, 1, 1, 1,
0.3958389, 0.90029, 2.530239, 1, 1, 1, 1, 1,
0.3961436, 1.238943, -1.42196, 1, 1, 1, 1, 1,
0.399728, -1.110761, 3.368983, 1, 1, 1, 1, 1,
0.4006621, -0.9897713, 2.924932, 1, 1, 1, 1, 1,
0.4037862, 0.1888841, 1.638257, 1, 1, 1, 1, 1,
0.4044448, -2.029048, 2.372605, 1, 1, 1, 1, 1,
0.4047752, 0.706256, 0.2067588, 1, 1, 1, 1, 1,
0.4075934, 1.326922, -0.3376735, 1, 1, 1, 1, 1,
0.4080158, 0.3226707, -0.2737981, 0, 0, 1, 1, 1,
0.4118648, 0.2712227, 1.200511, 1, 0, 0, 1, 1,
0.4119185, -1.576177, 2.757781, 1, 0, 0, 1, 1,
0.42258, 0.04308211, 0.3620735, 1, 0, 0, 1, 1,
0.4237339, 0.90883, 0.76328, 1, 0, 0, 1, 1,
0.4243415, -0.0639908, 1.815586, 1, 0, 0, 1, 1,
0.4291044, 0.6843687, 1.015633, 0, 0, 0, 1, 1,
0.4363884, -0.04477102, 2.379974, 0, 0, 0, 1, 1,
0.4379211, -0.9210753, 3.138239, 0, 0, 0, 1, 1,
0.4413442, -0.6142007, 0.4982278, 0, 0, 0, 1, 1,
0.4424635, -0.8959058, 2.321347, 0, 0, 0, 1, 1,
0.447026, -1.384662, 3.981318, 0, 0, 0, 1, 1,
0.4473221, -0.5003912, 2.06861, 0, 0, 0, 1, 1,
0.4489354, 0.1295162, 1.356647, 1, 1, 1, 1, 1,
0.4529132, 0.8924903, -0.5383024, 1, 1, 1, 1, 1,
0.4535608, -1.216442, 2.083573, 1, 1, 1, 1, 1,
0.4581023, -1.790143, 2.695994, 1, 1, 1, 1, 1,
0.4601408, 0.08142451, 0.7162191, 1, 1, 1, 1, 1,
0.4670334, -1.711037, 3.492434, 1, 1, 1, 1, 1,
0.4674389, -0.5019751, 1.607263, 1, 1, 1, 1, 1,
0.473297, -0.0535043, 3.02813, 1, 1, 1, 1, 1,
0.4751175, 0.2347311, 2.344348, 1, 1, 1, 1, 1,
0.4765483, 0.6657168, 2.469812, 1, 1, 1, 1, 1,
0.4792189, -0.3595847, 2.346858, 1, 1, 1, 1, 1,
0.4806745, 0.07461357, 1.790681, 1, 1, 1, 1, 1,
0.4811743, -0.8342502, 2.522695, 1, 1, 1, 1, 1,
0.4814131, 1.805717, 2.440885, 1, 1, 1, 1, 1,
0.4886059, 0.8697677, 0.1448141, 1, 1, 1, 1, 1,
0.4933181, 1.430255, 1.518404, 0, 0, 1, 1, 1,
0.4945844, -0.8201354, 3.936224, 1, 0, 0, 1, 1,
0.5001962, -0.7370582, 1.921202, 1, 0, 0, 1, 1,
0.5121071, -0.5792705, 2.840739, 1, 0, 0, 1, 1,
0.5140566, -0.6093153, 2.422419, 1, 0, 0, 1, 1,
0.5144988, 2.225827, 0.6275319, 1, 0, 0, 1, 1,
0.5147772, -0.5522977, 3.590737, 0, 0, 0, 1, 1,
0.5166149, -1.014081, 2.194601, 0, 0, 0, 1, 1,
0.5194967, 0.3005325, 0.2105165, 0, 0, 0, 1, 1,
0.5226218, 0.319555, -1.502173, 0, 0, 0, 1, 1,
0.5241862, -1.081849, 2.740286, 0, 0, 0, 1, 1,
0.5245828, -0.2291265, 2.586385, 0, 0, 0, 1, 1,
0.5249088, 1.482562, -0.1017821, 0, 0, 0, 1, 1,
0.5258998, -2.045165, 4.223646, 1, 1, 1, 1, 1,
0.5269101, -0.3545348, 3.386918, 1, 1, 1, 1, 1,
0.5302212, -0.8924481, 1.839461, 1, 1, 1, 1, 1,
0.5324689, 0.1665881, 0.9043694, 1, 1, 1, 1, 1,
0.5336424, 0.8074409, 1.772725, 1, 1, 1, 1, 1,
0.5338343, 0.8084642, -1.141282, 1, 1, 1, 1, 1,
0.5359667, -0.0417422, -0.4183311, 1, 1, 1, 1, 1,
0.5440401, 0.5517408, 0.5863, 1, 1, 1, 1, 1,
0.5441842, 0.1975409, -0.3304836, 1, 1, 1, 1, 1,
0.5476792, 2.102093, -0.8240055, 1, 1, 1, 1, 1,
0.5492727, -0.3143033, 0.3072783, 1, 1, 1, 1, 1,
0.5549312, 0.3106796, 0.407472, 1, 1, 1, 1, 1,
0.5608379, -0.7945648, 4.151324, 1, 1, 1, 1, 1,
0.5638009, 0.342872, 2.258566, 1, 1, 1, 1, 1,
0.5696973, 0.5236133, 0.9774325, 1, 1, 1, 1, 1,
0.5724664, -0.09025316, 0.5269385, 0, 0, 1, 1, 1,
0.5733077, 0.1260652, 1.017513, 1, 0, 0, 1, 1,
0.5740356, 0.1757586, -1.530328, 1, 0, 0, 1, 1,
0.5748658, 1.050887, 0.486619, 1, 0, 0, 1, 1,
0.577977, 0.1425846, 2.052951, 1, 0, 0, 1, 1,
0.5796832, 1.02679, 2.126493, 1, 0, 0, 1, 1,
0.5818567, -0.2346547, 3.037212, 0, 0, 0, 1, 1,
0.5917025, -0.1366753, 1.543719, 0, 0, 0, 1, 1,
0.5950137, -0.8926104, 1.726644, 0, 0, 0, 1, 1,
0.59619, 1.080852, 0.1647075, 0, 0, 0, 1, 1,
0.6021582, 0.8132844, 1.08473, 0, 0, 0, 1, 1,
0.6038034, 0.3035097, 1.236146, 0, 0, 0, 1, 1,
0.6149146, 0.2083642, -1.068804, 0, 0, 0, 1, 1,
0.6185616, 0.179777, 0.4592513, 1, 1, 1, 1, 1,
0.6186005, 0.8125885, 1.014515, 1, 1, 1, 1, 1,
0.625751, 0.9888608, -0.5980484, 1, 1, 1, 1, 1,
0.6282348, 1.355013, 1.066858, 1, 1, 1, 1, 1,
0.6319981, 0.6015505, 1.421034, 1, 1, 1, 1, 1,
0.633828, 0.29505, 1.326421, 1, 1, 1, 1, 1,
0.6347427, -0.09147681, 3.130927, 1, 1, 1, 1, 1,
0.6399602, -0.9370144, 2.729707, 1, 1, 1, 1, 1,
0.6554892, -1.105705, 4.166861, 1, 1, 1, 1, 1,
0.6560059, 0.959027, 1.378641, 1, 1, 1, 1, 1,
0.6585099, 0.2178429, 2.018614, 1, 1, 1, 1, 1,
0.6759148, 0.9797685, -0.2810276, 1, 1, 1, 1, 1,
0.67598, -0.2786129, 2.503646, 1, 1, 1, 1, 1,
0.6793595, -0.6552735, 2.439436, 1, 1, 1, 1, 1,
0.6799688, -2.28623, 2.539177, 1, 1, 1, 1, 1,
0.6813114, -0.6065255, 2.741102, 0, 0, 1, 1, 1,
0.6849167, -1.102334, 3.064775, 1, 0, 0, 1, 1,
0.6923369, -0.8469383, 4.055607, 1, 0, 0, 1, 1,
0.6952001, 0.6903612, 1.56102, 1, 0, 0, 1, 1,
0.7004478, 0.4613818, 1.146503, 1, 0, 0, 1, 1,
0.7133797, -0.09425148, 1.744822, 1, 0, 0, 1, 1,
0.7169383, -1.066027, 3.493389, 0, 0, 0, 1, 1,
0.7175592, -0.197209, 1.835951, 0, 0, 0, 1, 1,
0.721891, -0.1069437, 2.550792, 0, 0, 0, 1, 1,
0.7231327, 0.3561305, 1.316527, 0, 0, 0, 1, 1,
0.7232417, -0.4771411, 1.104963, 0, 0, 0, 1, 1,
0.7255051, 1.308237, 1.341377, 0, 0, 0, 1, 1,
0.7280428, -0.2017898, 2.518263, 0, 0, 0, 1, 1,
0.7304434, -0.7760227, 4.409697, 1, 1, 1, 1, 1,
0.7324334, 0.8521236, -0.2854133, 1, 1, 1, 1, 1,
0.7332168, 0.2951949, 1.493834, 1, 1, 1, 1, 1,
0.7370774, -0.4966679, 2.622627, 1, 1, 1, 1, 1,
0.741728, -0.01720811, 1.737732, 1, 1, 1, 1, 1,
0.7428598, -0.3791501, 2.585144, 1, 1, 1, 1, 1,
0.7433735, 1.153299, -0.7903264, 1, 1, 1, 1, 1,
0.7445636, -0.85364, 2.961567, 1, 1, 1, 1, 1,
0.7467633, -0.6525066, 3.44996, 1, 1, 1, 1, 1,
0.7479589, -0.06211638, -0.2248564, 1, 1, 1, 1, 1,
0.7484838, -1.360133, 0.7250668, 1, 1, 1, 1, 1,
0.7505766, 1.108115, 1.199607, 1, 1, 1, 1, 1,
0.7561251, -0.4158669, 2.908476, 1, 1, 1, 1, 1,
0.7605148, 0.5007156, 1.195047, 1, 1, 1, 1, 1,
0.7675427, -0.3803287, 2.318439, 1, 1, 1, 1, 1,
0.7679105, -0.3061637, 1.317887, 0, 0, 1, 1, 1,
0.7695702, 0.1995903, 2.183605, 1, 0, 0, 1, 1,
0.7696384, -0.5289928, 2.093942, 1, 0, 0, 1, 1,
0.7752217, 1.34841, -0.1789936, 1, 0, 0, 1, 1,
0.7850084, -2.108692, 3.440269, 1, 0, 0, 1, 1,
0.7864992, 0.5386522, 0.5564985, 1, 0, 0, 1, 1,
0.7874772, 1.132728, 0.2359106, 0, 0, 0, 1, 1,
0.7887223, 0.06492841, 1.875068, 0, 0, 0, 1, 1,
0.793909, 1.146258, 0.05834837, 0, 0, 0, 1, 1,
0.794663, -0.621649, 1.943099, 0, 0, 0, 1, 1,
0.7992844, -0.4582511, 1.94665, 0, 0, 0, 1, 1,
0.8033273, 1.047413, -0.8984357, 0, 0, 0, 1, 1,
0.8117518, -0.7584739, 1.319619, 0, 0, 0, 1, 1,
0.8167429, 0.7890108, 1.0811, 1, 1, 1, 1, 1,
0.8182451, -0.9740325, 3.222307, 1, 1, 1, 1, 1,
0.8256764, 1.002925, 0.4377777, 1, 1, 1, 1, 1,
0.82779, 0.1251012, 2.418244, 1, 1, 1, 1, 1,
0.8377938, 0.2882016, 0.8984772, 1, 1, 1, 1, 1,
0.8413452, 0.1998381, 1.899449, 1, 1, 1, 1, 1,
0.8426696, -1.634868, 1.884367, 1, 1, 1, 1, 1,
0.8434563, 1.022495, -0.6163482, 1, 1, 1, 1, 1,
0.8674141, -0.6055862, 0.3694845, 1, 1, 1, 1, 1,
0.8677687, -0.8733303, 0.2266006, 1, 1, 1, 1, 1,
0.8743234, -1.108205, 2.898122, 1, 1, 1, 1, 1,
0.8870417, -0.8455697, 2.193979, 1, 1, 1, 1, 1,
0.8872652, -0.1404523, 1.780128, 1, 1, 1, 1, 1,
0.8880932, 0.4843426, 2.527744, 1, 1, 1, 1, 1,
0.8933107, -1.619501, 3.750273, 1, 1, 1, 1, 1,
0.8957474, -1.722204, 2.235168, 0, 0, 1, 1, 1,
0.8990421, -1.241157, 1.852347, 1, 0, 0, 1, 1,
0.9043859, 0.3585503, 1.661153, 1, 0, 0, 1, 1,
0.9082395, 1.537007, -0.6545033, 1, 0, 0, 1, 1,
0.9096955, 1.666758, -0.1520746, 1, 0, 0, 1, 1,
0.9119386, 0.201843, 0.5688668, 1, 0, 0, 1, 1,
0.912699, -0.5106192, 3.425705, 0, 0, 0, 1, 1,
0.9153122, 0.8522764, 0.8847211, 0, 0, 0, 1, 1,
0.9204703, 0.6758186, 0.9015082, 0, 0, 0, 1, 1,
0.9266019, -0.5172574, 1.884485, 0, 0, 0, 1, 1,
0.9296452, 0.9013597, 2.95802, 0, 0, 0, 1, 1,
0.9347689, 0.9730601, 2.255777, 0, 0, 0, 1, 1,
0.9348938, 0.02055956, 3.068276, 0, 0, 0, 1, 1,
0.9395262, 1.596033, 0.8098318, 1, 1, 1, 1, 1,
0.9396662, 0.2318377, 1.843761, 1, 1, 1, 1, 1,
0.9406955, 1.987916, 0.4913635, 1, 1, 1, 1, 1,
0.9479496, 1.273132, 2.28758, 1, 1, 1, 1, 1,
0.9542295, -0.8278105, 3.959947, 1, 1, 1, 1, 1,
0.954922, -0.1264823, 0.8871, 1, 1, 1, 1, 1,
0.9591715, -2.78047, 1.161936, 1, 1, 1, 1, 1,
0.961193, 0.8710357, 0.9627672, 1, 1, 1, 1, 1,
0.9638267, 0.2708825, 0.7401238, 1, 1, 1, 1, 1,
0.9647344, -0.2796174, 3.566997, 1, 1, 1, 1, 1,
0.9647897, -0.9663221, 2.095837, 1, 1, 1, 1, 1,
0.9659298, 0.4518504, 0.3824405, 1, 1, 1, 1, 1,
0.96652, 1.55308, 0.1188971, 1, 1, 1, 1, 1,
0.9684489, 1.133883, 1.94158, 1, 1, 1, 1, 1,
0.972347, -0.3987695, 1.632168, 1, 1, 1, 1, 1,
0.9776878, 0.0731059, 1.872699, 0, 0, 1, 1, 1,
0.9793324, 0.6697558, 1.583981, 1, 0, 0, 1, 1,
0.9849513, 0.2641744, 2.539213, 1, 0, 0, 1, 1,
0.998543, 0.4898151, 1.907811, 1, 0, 0, 1, 1,
1.002829, 0.2233673, 3.252215, 1, 0, 0, 1, 1,
1.008748, 2.318139, 2.076156, 1, 0, 0, 1, 1,
1.009143, 0.8960996, 0.4049859, 0, 0, 0, 1, 1,
1.009318, 1.325292, 1.532869, 0, 0, 0, 1, 1,
1.009639, -0.6003203, 1.93571, 0, 0, 0, 1, 1,
1.021958, -0.246988, 1.020058, 0, 0, 0, 1, 1,
1.0292, 0.1437743, -0.06304336, 0, 0, 0, 1, 1,
1.037355, 0.6222965, 1.661122, 0, 0, 0, 1, 1,
1.044675, -0.8633508, 2.640618, 0, 0, 0, 1, 1,
1.051454, 0.7334316, 0.9162742, 1, 1, 1, 1, 1,
1.074608, 0.9655452, 0.2631731, 1, 1, 1, 1, 1,
1.077259, 0.1584535, 1.353824, 1, 1, 1, 1, 1,
1.08033, 1.129453, 1.962082, 1, 1, 1, 1, 1,
1.083009, -1.476209, 3.449884, 1, 1, 1, 1, 1,
1.086623, 1.519447, 1.268499, 1, 1, 1, 1, 1,
1.09137, 0.4359343, 1.883297, 1, 1, 1, 1, 1,
1.091844, 0.2621616, 2.822219, 1, 1, 1, 1, 1,
1.093755, -0.5533523, 2.827216, 1, 1, 1, 1, 1,
1.094594, -0.9236333, 2.282039, 1, 1, 1, 1, 1,
1.096908, -0.01046089, 2.215203, 1, 1, 1, 1, 1,
1.098336, -0.5996745, 1.036665, 1, 1, 1, 1, 1,
1.098575, -0.4886568, 2.83002, 1, 1, 1, 1, 1,
1.099406, 0.4514689, 0.6074303, 1, 1, 1, 1, 1,
1.111337, 0.9654421, 0.9269815, 1, 1, 1, 1, 1,
1.115037, 0.6138217, 1.284173, 0, 0, 1, 1, 1,
1.115577, 0.4358467, 0.6194335, 1, 0, 0, 1, 1,
1.121568, 0.4304294, 0.366118, 1, 0, 0, 1, 1,
1.130962, 1.603185, -0.3897743, 1, 0, 0, 1, 1,
1.133095, 0.7301982, 0.05789103, 1, 0, 0, 1, 1,
1.137547, -0.7534235, 3.701299, 1, 0, 0, 1, 1,
1.14121, -0.4735844, 3.057206, 0, 0, 0, 1, 1,
1.144562, 0.3291789, 2.375544, 0, 0, 0, 1, 1,
1.145285, -2.65125, 3.591094, 0, 0, 0, 1, 1,
1.150201, 0.7794955, 2.948696, 0, 0, 0, 1, 1,
1.151237, 0.05664964, 3.309388, 0, 0, 0, 1, 1,
1.151603, -0.3560174, 1.779986, 0, 0, 0, 1, 1,
1.162718, -1.570653, 3.739335, 0, 0, 0, 1, 1,
1.163387, 0.7827722, 1.201449, 1, 1, 1, 1, 1,
1.164215, 0.4332332, 1.08767, 1, 1, 1, 1, 1,
1.164706, -0.6939862, 1.629729, 1, 1, 1, 1, 1,
1.167542, -1.950497, 2.23569, 1, 1, 1, 1, 1,
1.167659, 1.497316, -1.457768, 1, 1, 1, 1, 1,
1.168465, 0.2235451, 1.795447, 1, 1, 1, 1, 1,
1.176161, -1.074082, 3.065154, 1, 1, 1, 1, 1,
1.178658, -0.8161, 2.481042, 1, 1, 1, 1, 1,
1.188417, -0.04167728, 0.5270172, 1, 1, 1, 1, 1,
1.189862, 1.082224, -0.1496443, 1, 1, 1, 1, 1,
1.205662, -0.3087665, 3.596128, 1, 1, 1, 1, 1,
1.210914, -1.996004, 3.20113, 1, 1, 1, 1, 1,
1.218594, 1.075192, 0.7982906, 1, 1, 1, 1, 1,
1.222073, -1.266535, 3.840335, 1, 1, 1, 1, 1,
1.22541, -0.333716, 2.633777, 1, 1, 1, 1, 1,
1.227606, -0.4416358, 1.556489, 0, 0, 1, 1, 1,
1.231891, 1.034149, -0.1508953, 1, 0, 0, 1, 1,
1.237129, 0.05747351, 2.715139, 1, 0, 0, 1, 1,
1.237143, -0.5414186, 0.97058, 1, 0, 0, 1, 1,
1.237231, -2.233814, 4.906138, 1, 0, 0, 1, 1,
1.238443, 0.8670759, 0.8397202, 1, 0, 0, 1, 1,
1.241803, -1.233371, 1.598484, 0, 0, 0, 1, 1,
1.24841, -0.1933604, 2.264432, 0, 0, 0, 1, 1,
1.259561, 0.3729601, 2.166571, 0, 0, 0, 1, 1,
1.261716, -0.193238, 0.8216555, 0, 0, 0, 1, 1,
1.274276, 0.7044146, -0.206135, 0, 0, 0, 1, 1,
1.281408, 0.2343671, 0.6061549, 0, 0, 0, 1, 1,
1.284384, 2.214972, 2.297487, 0, 0, 0, 1, 1,
1.288966, -0.667327, 2.862028, 1, 1, 1, 1, 1,
1.289639, 1.576959, 2.200537, 1, 1, 1, 1, 1,
1.297589, -0.9958902, 4.625052, 1, 1, 1, 1, 1,
1.313929, 0.2976872, 1.093863, 1, 1, 1, 1, 1,
1.316559, -0.6009785, 3.208335, 1, 1, 1, 1, 1,
1.348451, -0.02087705, 1.238467, 1, 1, 1, 1, 1,
1.354149, -0.665903, 3.225411, 1, 1, 1, 1, 1,
1.35921, 0.770272, -0.2716425, 1, 1, 1, 1, 1,
1.359947, -2.576931, 2.769253, 1, 1, 1, 1, 1,
1.363605, -0.3761524, 2.031514, 1, 1, 1, 1, 1,
1.366995, -0.03923299, 0.6675257, 1, 1, 1, 1, 1,
1.367066, -1.222622, 3.484276, 1, 1, 1, 1, 1,
1.380026, -0.9621781, 2.156809, 1, 1, 1, 1, 1,
1.382292, 0.5574391, 0.8245156, 1, 1, 1, 1, 1,
1.384, -0.363371, 1.526338, 1, 1, 1, 1, 1,
1.40124, 0.1153468, 2.070633, 0, 0, 1, 1, 1,
1.427664, -0.5419896, 0.7767301, 1, 0, 0, 1, 1,
1.429646, -0.8928461, 2.010602, 1, 0, 0, 1, 1,
1.438671, -0.8691616, 0.05152624, 1, 0, 0, 1, 1,
1.444593, 1.213528, 0.95768, 1, 0, 0, 1, 1,
1.445535, 1.649964, 1.228638, 1, 0, 0, 1, 1,
1.460202, -1.363386, 3.339346, 0, 0, 0, 1, 1,
1.470273, 0.1277072, -0.1050217, 0, 0, 0, 1, 1,
1.50189, -0.374135, 0.9082969, 0, 0, 0, 1, 1,
1.509269, -1.4825, 1.669201, 0, 0, 0, 1, 1,
1.514791, -0.03325683, 1.001996, 0, 0, 0, 1, 1,
1.515838, 0.2502641, 1.019532, 0, 0, 0, 1, 1,
1.519603, 1.119795, 1.04528, 0, 0, 0, 1, 1,
1.524339, 0.3306748, 0.8977997, 1, 1, 1, 1, 1,
1.54214, 0.1361677, -1.092038, 1, 1, 1, 1, 1,
1.577811, -0.7790948, 2.280054, 1, 1, 1, 1, 1,
1.589711, 0.5124348, 0.5049345, 1, 1, 1, 1, 1,
1.613937, -1.294888, 1.931217, 1, 1, 1, 1, 1,
1.629295, -2.05129, 2.329472, 1, 1, 1, 1, 1,
1.629411, -1.013341, 2.378003, 1, 1, 1, 1, 1,
1.644427, -0.1699985, 3.751061, 1, 1, 1, 1, 1,
1.653882, -0.9638107, 1.559776, 1, 1, 1, 1, 1,
1.655207, 1.010979, 2.102477, 1, 1, 1, 1, 1,
1.667659, 0.01590437, 1.778043, 1, 1, 1, 1, 1,
1.67016, -0.6480418, 0.471589, 1, 1, 1, 1, 1,
1.693043, -0.2828863, 1.749301, 1, 1, 1, 1, 1,
1.701998, 1.855162, 1.240605, 1, 1, 1, 1, 1,
1.717474, 0.5787741, 1.503011, 1, 1, 1, 1, 1,
1.724111, 0.07726381, 1.831542, 0, 0, 1, 1, 1,
1.726753, -0.660493, 1.761365, 1, 0, 0, 1, 1,
1.776256, 0.6776466, -0.7784754, 1, 0, 0, 1, 1,
1.781807, 0.2190055, 1.688114, 1, 0, 0, 1, 1,
1.787278, 0.04897799, 1.103589, 1, 0, 0, 1, 1,
1.808323, -1.424793, 0.2201589, 1, 0, 0, 1, 1,
1.811833, 0.3232779, 2.438082, 0, 0, 0, 1, 1,
1.814371, 0.1055721, 1.36984, 0, 0, 0, 1, 1,
1.851425, 0.4826902, 2.810529, 0, 0, 0, 1, 1,
1.856865, 0.8870878, 0.896792, 0, 0, 0, 1, 1,
1.860209, 0.8387801, 0.5564254, 0, 0, 0, 1, 1,
1.866067, -0.7847913, 1.383195, 0, 0, 0, 1, 1,
1.872824, 1.169495, 2.006023, 0, 0, 0, 1, 1,
1.901847, 0.9397357, -0.06990355, 1, 1, 1, 1, 1,
1.905682, -0.9582771, 2.497228, 1, 1, 1, 1, 1,
1.907353, 0.6555368, -0.6395704, 1, 1, 1, 1, 1,
1.909782, -0.9736147, 2.190689, 1, 1, 1, 1, 1,
1.917642, 0.2530721, 1.372681, 1, 1, 1, 1, 1,
1.942086, 1.840008, 0.05227172, 1, 1, 1, 1, 1,
1.949207, -0.3756045, 2.435864, 1, 1, 1, 1, 1,
1.963978, -0.3809089, 2.27721, 1, 1, 1, 1, 1,
1.98515, -1.742496, 1.921226, 1, 1, 1, 1, 1,
2.010948, 0.1099856, 3.184113, 1, 1, 1, 1, 1,
2.043305, -0.6027892, 2.679942, 1, 1, 1, 1, 1,
2.04534, 1.888666, 0.4312625, 1, 1, 1, 1, 1,
2.058838, 0.2706355, 1.030876, 1, 1, 1, 1, 1,
2.060646, 0.8671308, 2.982564, 1, 1, 1, 1, 1,
2.067106, -0.7268398, 2.128161, 1, 1, 1, 1, 1,
2.070557, 1.357452, 0.02806095, 0, 0, 1, 1, 1,
2.090167, 1.576103, 1.088893, 1, 0, 0, 1, 1,
2.105143, 1.630339, 1.631089, 1, 0, 0, 1, 1,
2.123923, -0.3301055, 1.140842, 1, 0, 0, 1, 1,
2.137354, -0.9705744, 2.685325, 1, 0, 0, 1, 1,
2.142807, 0.3457331, 1.514198, 1, 0, 0, 1, 1,
2.220863, 0.4694494, 0.4402764, 0, 0, 0, 1, 1,
2.230649, -1.437437, 1.761841, 0, 0, 0, 1, 1,
2.232836, 0.7998711, 1.073941, 0, 0, 0, 1, 1,
2.26265, -0.6170482, 0.7721103, 0, 0, 0, 1, 1,
2.264072, -0.1216401, 1.047387, 0, 0, 0, 1, 1,
2.287585, -1.307588, 3.807713, 0, 0, 0, 1, 1,
2.308193, -1.47017, 1.977873, 0, 0, 0, 1, 1,
2.334675, 0.2474648, 0.6330075, 1, 1, 1, 1, 1,
2.382709, 0.6899477, 0.8054146, 1, 1, 1, 1, 1,
2.41235, 0.7329519, 0.4267902, 1, 1, 1, 1, 1,
2.465128, 0.6801277, 2.79088, 1, 1, 1, 1, 1,
2.57372, 1.878324, 0.02553364, 1, 1, 1, 1, 1,
3.06828, -0.09060987, 1.289098, 1, 1, 1, 1, 1,
3.082902, 1.804933, 1.668429, 1, 1, 1, 1, 1
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
var radius = 9.701643;
var distance = 34.07661;
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
mvMatrix.translate( 0.1007242, -0.1088722, -0.2969801 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.07661);
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