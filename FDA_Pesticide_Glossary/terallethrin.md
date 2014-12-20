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
-3.092505, 0.7020622, -0.005974182, 1, 0, 0, 1,
-2.918307, -0.7744364, -3.567373, 1, 0.007843138, 0, 1,
-2.825408, -0.1368989, -4.627213, 1, 0.01176471, 0, 1,
-2.724223, -1.20296, -0.7910736, 1, 0.01960784, 0, 1,
-2.604729, -0.237534, -0.6699094, 1, 0.02352941, 0, 1,
-2.570799, 0.2929794, -2.282436, 1, 0.03137255, 0, 1,
-2.513447, -2.758595, -3.167863, 1, 0.03529412, 0, 1,
-2.506388, -0.496242, -2.083701, 1, 0.04313726, 0, 1,
-2.48595, -1.676604, -2.513319, 1, 0.04705882, 0, 1,
-2.474231, 0.1111476, -1.545189, 1, 0.05490196, 0, 1,
-2.474131, -0.54822, -1.88683, 1, 0.05882353, 0, 1,
-2.442522, -1.542135, -1.451055, 1, 0.06666667, 0, 1,
-2.426192, 0.385799, -1.103171, 1, 0.07058824, 0, 1,
-2.403105, 0.5038798, -1.761759, 1, 0.07843138, 0, 1,
-2.398163, 1.291352, -2.649415, 1, 0.08235294, 0, 1,
-2.393736, 0.8347532, -1.99594, 1, 0.09019608, 0, 1,
-2.376512, -0.312538, -4.096658, 1, 0.09411765, 0, 1,
-2.350213, 0.04751142, -1.484144, 1, 0.1019608, 0, 1,
-2.348606, 0.5424036, -1.893823, 1, 0.1098039, 0, 1,
-2.332206, 0.01178965, -2.191603, 1, 0.1137255, 0, 1,
-2.325333, -0.7386598, -2.362003, 1, 0.1215686, 0, 1,
-2.252605, 0.504154, -1.311999, 1, 0.1254902, 0, 1,
-2.242719, 1.575336, 0.1529513, 1, 0.1333333, 0, 1,
-2.232387, -0.5045307, -2.190922, 1, 0.1372549, 0, 1,
-2.232112, -0.2461156, -2.227564, 1, 0.145098, 0, 1,
-2.207618, 0.1323823, -1.841628, 1, 0.1490196, 0, 1,
-2.168922, -1.577431, -2.386044, 1, 0.1568628, 0, 1,
-2.159939, 1.195269, -1.266497, 1, 0.1607843, 0, 1,
-2.151215, 0.4382586, -0.4235986, 1, 0.1686275, 0, 1,
-2.110843, -0.3012179, -2.551907, 1, 0.172549, 0, 1,
-2.101417, 1.155874, 0.8945413, 1, 0.1803922, 0, 1,
-2.050337, -0.9128623, -2.309114, 1, 0.1843137, 0, 1,
-2.023998, 0.3570525, -2.245384, 1, 0.1921569, 0, 1,
-1.968012, 0.3143989, -1.572677, 1, 0.1960784, 0, 1,
-1.959109, -0.8616154, -3.771474, 1, 0.2039216, 0, 1,
-1.958168, 0.5297551, -1.918672, 1, 0.2117647, 0, 1,
-1.952386, 1.066902, -1.588336, 1, 0.2156863, 0, 1,
-1.921001, 2.205011, 1.185327, 1, 0.2235294, 0, 1,
-1.873141, -0.03830051, -1.62927, 1, 0.227451, 0, 1,
-1.872149, -1.910892, -1.453256, 1, 0.2352941, 0, 1,
-1.865139, 1.145334, -0.5762142, 1, 0.2392157, 0, 1,
-1.822595, -1.680901, -0.4803831, 1, 0.2470588, 0, 1,
-1.811846, -0.1679948, -1.540902, 1, 0.2509804, 0, 1,
-1.803223, 1.073395, -1.377091, 1, 0.2588235, 0, 1,
-1.782022, 0.3006262, -1.769014, 1, 0.2627451, 0, 1,
-1.774517, -0.7489169, 0.7411941, 1, 0.2705882, 0, 1,
-1.77318, 0.9750085, -2.237934, 1, 0.2745098, 0, 1,
-1.765151, -0.5123789, -1.865261, 1, 0.282353, 0, 1,
-1.762476, 0.8328403, -0.5140203, 1, 0.2862745, 0, 1,
-1.759652, -0.7372949, -1.67453, 1, 0.2941177, 0, 1,
-1.739723, 0.08439283, -2.359575, 1, 0.3019608, 0, 1,
-1.735716, -1.211592, -2.526267, 1, 0.3058824, 0, 1,
-1.729761, 1.695858, -1.615094, 1, 0.3137255, 0, 1,
-1.69312, -0.3715694, -1.366497, 1, 0.3176471, 0, 1,
-1.671488, 0.7540602, -1.571324, 1, 0.3254902, 0, 1,
-1.656361, 0.7479029, -1.017428, 1, 0.3294118, 0, 1,
-1.653052, -1.422376, -1.923599, 1, 0.3372549, 0, 1,
-1.651902, 0.748863, -0.6070512, 1, 0.3411765, 0, 1,
-1.644346, 0.4792297, -0.6313951, 1, 0.3490196, 0, 1,
-1.639078, 0.8173456, -1.807768, 1, 0.3529412, 0, 1,
-1.619985, 1.095156, -1.336862, 1, 0.3607843, 0, 1,
-1.615571, -0.4381478, -2.284905, 1, 0.3647059, 0, 1,
-1.615028, -0.7689853, -2.612387, 1, 0.372549, 0, 1,
-1.593217, 0.362204, -2.466105, 1, 0.3764706, 0, 1,
-1.591987, 0.4574232, 0.7629267, 1, 0.3843137, 0, 1,
-1.584654, -0.2249034, -0.408798, 1, 0.3882353, 0, 1,
-1.577734, 0.5536574, -3.168926, 1, 0.3960784, 0, 1,
-1.555386, 0.6504145, -1.191895, 1, 0.4039216, 0, 1,
-1.544749, -0.4142855, -2.294899, 1, 0.4078431, 0, 1,
-1.522274, -0.7528851, -1.894007, 1, 0.4156863, 0, 1,
-1.522265, -1.184659, -1.993068, 1, 0.4196078, 0, 1,
-1.504682, -0.3929807, -2.268212, 1, 0.427451, 0, 1,
-1.499596, 1.541535, -0.835257, 1, 0.4313726, 0, 1,
-1.490477, 1.034525, -1.435371, 1, 0.4392157, 0, 1,
-1.485475, -2.135152, -3.962854, 1, 0.4431373, 0, 1,
-1.470725, 0.7340243, -1.695333, 1, 0.4509804, 0, 1,
-1.464578, 2.104321, -1.958228, 1, 0.454902, 0, 1,
-1.461514, 0.9922341, -0.2317835, 1, 0.4627451, 0, 1,
-1.45581, -0.1271446, -1.10789, 1, 0.4666667, 0, 1,
-1.438855, 1.016067, -1.594767, 1, 0.4745098, 0, 1,
-1.432295, 0.6947873, 0.4086339, 1, 0.4784314, 0, 1,
-1.411089, -0.6238182, -1.379621, 1, 0.4862745, 0, 1,
-1.40496, -1.875832, -3.969933, 1, 0.4901961, 0, 1,
-1.402657, -0.1445658, -2.733334, 1, 0.4980392, 0, 1,
-1.396, -0.2214639, -1.801419, 1, 0.5058824, 0, 1,
-1.388562, 1.703253, -1.053885, 1, 0.509804, 0, 1,
-1.383093, 0.8686789, 0.3787352, 1, 0.5176471, 0, 1,
-1.37804, 0.6861239, -1.515446, 1, 0.5215687, 0, 1,
-1.376481, -1.252214, -1.762166, 1, 0.5294118, 0, 1,
-1.37548, -0.8160855, -2.385733, 1, 0.5333334, 0, 1,
-1.371489, -0.8258992, -2.920625, 1, 0.5411765, 0, 1,
-1.366517, -0.8813013, -1.631012, 1, 0.5450981, 0, 1,
-1.365468, 0.1451719, -1.147325, 1, 0.5529412, 0, 1,
-1.363212, -0.2122279, -1.638791, 1, 0.5568628, 0, 1,
-1.349737, 0.7433695, -1.778649, 1, 0.5647059, 0, 1,
-1.333706, -0.4149846, -0.2500501, 1, 0.5686275, 0, 1,
-1.331735, -0.4236831, -2.786541, 1, 0.5764706, 0, 1,
-1.329266, -0.2633438, -1.165512, 1, 0.5803922, 0, 1,
-1.326632, -0.04752105, 0.1105579, 1, 0.5882353, 0, 1,
-1.325289, 0.1873683, -2.016325, 1, 0.5921569, 0, 1,
-1.309052, -0.5875247, -1.289539, 1, 0.6, 0, 1,
-1.297019, -1.440534, -2.820817, 1, 0.6078432, 0, 1,
-1.280907, -0.01816482, -2.554171, 1, 0.6117647, 0, 1,
-1.276066, -0.9847606, -2.502929, 1, 0.6196079, 0, 1,
-1.271809, 0.3134291, -3.19417, 1, 0.6235294, 0, 1,
-1.26534, 1.066868, -2.224689, 1, 0.6313726, 0, 1,
-1.262298, 0.4425969, -0.4183973, 1, 0.6352941, 0, 1,
-1.259733, -0.03194504, -1.396601, 1, 0.6431373, 0, 1,
-1.254873, -0.344375, -2.801401, 1, 0.6470588, 0, 1,
-1.249815, 0.3835261, 0.8136585, 1, 0.654902, 0, 1,
-1.24454, -1.383245, -1.703451, 1, 0.6588235, 0, 1,
-1.244474, -0.9571024, -3.101811, 1, 0.6666667, 0, 1,
-1.236813, 1.167755, -1.290339, 1, 0.6705883, 0, 1,
-1.2206, -0.8489981, -2.749421, 1, 0.6784314, 0, 1,
-1.218813, -0.1549077, -1.426965, 1, 0.682353, 0, 1,
-1.206719, -0.6559346, -2.539984, 1, 0.6901961, 0, 1,
-1.205706, -0.3796582, -1.628822, 1, 0.6941177, 0, 1,
-1.204495, -1.032801, -2.248202, 1, 0.7019608, 0, 1,
-1.198479, 0.8087904, -0.9695873, 1, 0.7098039, 0, 1,
-1.185871, -0.3837425, -0.4003392, 1, 0.7137255, 0, 1,
-1.185563, -2.200398, -3.953519, 1, 0.7215686, 0, 1,
-1.182503, 0.7767405, -1.336363, 1, 0.7254902, 0, 1,
-1.182046, 0.565284, 1.047282, 1, 0.7333333, 0, 1,
-1.167807, 0.7533771, -2.040748, 1, 0.7372549, 0, 1,
-1.164513, -0.4515006, -2.204819, 1, 0.7450981, 0, 1,
-1.163933, -2.308284, -3.557619, 1, 0.7490196, 0, 1,
-1.155133, -0.8831528, -2.525004, 1, 0.7568628, 0, 1,
-1.147936, -0.199977, -2.413245, 1, 0.7607843, 0, 1,
-1.142684, 1.971903, -3.716661, 1, 0.7686275, 0, 1,
-1.141578, 0.7200871, -0.9344988, 1, 0.772549, 0, 1,
-1.138875, -0.9347124, -2.088407, 1, 0.7803922, 0, 1,
-1.132569, 0.9619754, -2.059464, 1, 0.7843137, 0, 1,
-1.118613, 0.04631813, -3.110927, 1, 0.7921569, 0, 1,
-1.11754, 0.5540419, -1.401101, 1, 0.7960784, 0, 1,
-1.110769, 0.4080873, -2.591499, 1, 0.8039216, 0, 1,
-1.106839, 0.372923, -0.8249946, 1, 0.8117647, 0, 1,
-1.102085, 0.9781169, -1.654784, 1, 0.8156863, 0, 1,
-1.100531, -0.3329039, -1.686811, 1, 0.8235294, 0, 1,
-1.097937, 2.032803, 0.08794539, 1, 0.827451, 0, 1,
-1.095189, -1.260557, -1.856049, 1, 0.8352941, 0, 1,
-1.083869, -0.06681576, -1.311481, 1, 0.8392157, 0, 1,
-1.079616, 0.01080504, -1.592577, 1, 0.8470588, 0, 1,
-1.079591, -1.174436, -2.319975, 1, 0.8509804, 0, 1,
-1.077462, -1.85867, -3.757691, 1, 0.8588235, 0, 1,
-1.071742, -0.07893446, 0.2328715, 1, 0.8627451, 0, 1,
-1.070225, -0.6684425, -2.784769, 1, 0.8705882, 0, 1,
-1.064974, 0.715546, -1.237013, 1, 0.8745098, 0, 1,
-1.064265, -0.3324667, -0.1676605, 1, 0.8823529, 0, 1,
-1.060437, -1.187585, -3.179306, 1, 0.8862745, 0, 1,
-1.059457, 0.3206233, -2.128291, 1, 0.8941177, 0, 1,
-1.051196, -0.3578542, -1.35313, 1, 0.8980392, 0, 1,
-1.047192, -0.7989649, -2.646626, 1, 0.9058824, 0, 1,
-1.044871, -0.5181714, -3.387927, 1, 0.9137255, 0, 1,
-1.028006, -2.099501, -1.924626, 1, 0.9176471, 0, 1,
-1.027254, 0.123976, -2.10322, 1, 0.9254902, 0, 1,
-1.015554, -0.6787875, -1.680747, 1, 0.9294118, 0, 1,
-1.010058, -1.106832, -2.305114, 1, 0.9372549, 0, 1,
-0.9919469, 0.02575351, -1.684784, 1, 0.9411765, 0, 1,
-0.9818984, -0.02696241, -0.6592693, 1, 0.9490196, 0, 1,
-0.969646, 0.2816701, -1.154506, 1, 0.9529412, 0, 1,
-0.9630603, 0.8569384, -2.21672, 1, 0.9607843, 0, 1,
-0.9629419, 0.3523796, -0.5984479, 1, 0.9647059, 0, 1,
-0.9603024, 1.388145, -2.162768, 1, 0.972549, 0, 1,
-0.9589481, 0.3620619, 0.02619985, 1, 0.9764706, 0, 1,
-0.9575316, 0.9176354, 0.7631826, 1, 0.9843137, 0, 1,
-0.9562955, 0.2108001, -1.797876, 1, 0.9882353, 0, 1,
-0.951989, -0.4791649, -3.192454, 1, 0.9960784, 0, 1,
-0.9501566, 0.469114, -2.345448, 0.9960784, 1, 0, 1,
-0.946467, -0.4228106, -1.600249, 0.9921569, 1, 0, 1,
-0.9396763, -0.8657855, -1.512942, 0.9843137, 1, 0, 1,
-0.9327159, -0.3880833, -3.459968, 0.9803922, 1, 0, 1,
-0.9243417, 1.175968, -0.7333117, 0.972549, 1, 0, 1,
-0.9233483, -0.3976706, -1.349406, 0.9686275, 1, 0, 1,
-0.9210523, -1.045636, -4.295472, 0.9607843, 1, 0, 1,
-0.9177626, 0.009073921, -1.157191, 0.9568627, 1, 0, 1,
-0.9175174, 0.6390367, -0.9475215, 0.9490196, 1, 0, 1,
-0.9037343, 0.6163667, 0.2102329, 0.945098, 1, 0, 1,
-0.9020185, 0.6470142, 0.2963644, 0.9372549, 1, 0, 1,
-0.8910969, 0.2428634, -0.5811317, 0.9333333, 1, 0, 1,
-0.8811821, 0.5014179, -1.054531, 0.9254902, 1, 0, 1,
-0.8782243, -0.2416908, -0.4359939, 0.9215686, 1, 0, 1,
-0.868122, -0.03894212, -1.224125, 0.9137255, 1, 0, 1,
-0.8580238, 0.2458964, -1.676831, 0.9098039, 1, 0, 1,
-0.8560027, 0.8124457, -0.2102107, 0.9019608, 1, 0, 1,
-0.8516451, 0.1662444, -2.582145, 0.8941177, 1, 0, 1,
-0.8470595, -0.7197942, -2.544558, 0.8901961, 1, 0, 1,
-0.8455133, -0.7714003, 0.4850703, 0.8823529, 1, 0, 1,
-0.8344584, -1.316367, -3.057413, 0.8784314, 1, 0, 1,
-0.8319282, -0.361099, -3.505497, 0.8705882, 1, 0, 1,
-0.8311163, 1.275362, 0.7885752, 0.8666667, 1, 0, 1,
-0.8263832, -0.641537, -2.124563, 0.8588235, 1, 0, 1,
-0.816958, -1.051204, -3.024292, 0.854902, 1, 0, 1,
-0.8159004, -0.6327838, -1.70108, 0.8470588, 1, 0, 1,
-0.8088104, 1.147669, 0.8465052, 0.8431373, 1, 0, 1,
-0.8084999, 1.013487, 0.7813684, 0.8352941, 1, 0, 1,
-0.8049573, 1.381853, -1.370651, 0.8313726, 1, 0, 1,
-0.8024517, 0.6742408, -1.705396, 0.8235294, 1, 0, 1,
-0.8008751, 1.010363, 0.3824232, 0.8196079, 1, 0, 1,
-0.7999663, 0.009660208, -2.30836, 0.8117647, 1, 0, 1,
-0.7990293, 1.347667, -2.157334, 0.8078431, 1, 0, 1,
-0.7982833, 1.519514, -1.053696, 0.8, 1, 0, 1,
-0.7937806, 1.862453, -0.8497212, 0.7921569, 1, 0, 1,
-0.7914496, 1.472117, -0.6141804, 0.7882353, 1, 0, 1,
-0.7897152, -0.5689574, -3.014985, 0.7803922, 1, 0, 1,
-0.7797375, 0.2296633, -2.033582, 0.7764706, 1, 0, 1,
-0.7772898, 1.780122, 0.5911469, 0.7686275, 1, 0, 1,
-0.7740094, 0.4483635, -0.7462605, 0.7647059, 1, 0, 1,
-0.7712042, 1.46211, -0.5073494, 0.7568628, 1, 0, 1,
-0.7703867, -0.4994455, -1.94184, 0.7529412, 1, 0, 1,
-0.7694818, 0.5823663, 0.5085784, 0.7450981, 1, 0, 1,
-0.7686953, 0.01887027, -0.7920321, 0.7411765, 1, 0, 1,
-0.7679731, 1.407963, 0.1268476, 0.7333333, 1, 0, 1,
-0.7621675, 0.183382, -0.8013696, 0.7294118, 1, 0, 1,
-0.7585548, -0.1609969, -1.961396, 0.7215686, 1, 0, 1,
-0.7585189, -1.626817, -1.820217, 0.7176471, 1, 0, 1,
-0.7567121, 0.8355404, -0.2464992, 0.7098039, 1, 0, 1,
-0.7518463, -0.5754083, -0.8557878, 0.7058824, 1, 0, 1,
-0.7457612, -0.01174185, -1.188119, 0.6980392, 1, 0, 1,
-0.7442648, -1.278382, -2.048079, 0.6901961, 1, 0, 1,
-0.7403277, -0.01644368, -1.047608, 0.6862745, 1, 0, 1,
-0.7268518, -1.723016, -3.745705, 0.6784314, 1, 0, 1,
-0.7242183, 0.882855, 0.3928708, 0.6745098, 1, 0, 1,
-0.7231899, 1.497287, -0.3404462, 0.6666667, 1, 0, 1,
-0.7211511, 0.1721956, -0.2544961, 0.6627451, 1, 0, 1,
-0.7172521, -0.009416657, -3.083412, 0.654902, 1, 0, 1,
-0.7117144, -0.7646585, -0.8225261, 0.6509804, 1, 0, 1,
-0.7097797, 0.7955305, -0.7473167, 0.6431373, 1, 0, 1,
-0.7067674, -0.01020833, -0.2457155, 0.6392157, 1, 0, 1,
-0.7034979, 0.7309693, -0.7943833, 0.6313726, 1, 0, 1,
-0.7019291, -0.2704143, -1.749435, 0.627451, 1, 0, 1,
-0.6925737, -2.555072, -4.031483, 0.6196079, 1, 0, 1,
-0.6915922, 1.317447, -0.6416942, 0.6156863, 1, 0, 1,
-0.6914319, -0.12543, -3.255406, 0.6078432, 1, 0, 1,
-0.6903145, 0.4310524, -1.910502, 0.6039216, 1, 0, 1,
-0.6876115, 0.9372248, 0.2738382, 0.5960785, 1, 0, 1,
-0.6872095, 0.6943756, 1.063625, 0.5882353, 1, 0, 1,
-0.6862995, 0.9213112, -0.09304679, 0.5843138, 1, 0, 1,
-0.6716005, -0.8651147, -1.336378, 0.5764706, 1, 0, 1,
-0.6699817, -0.06927408, -2.051812, 0.572549, 1, 0, 1,
-0.6664318, 0.03903684, -2.251142, 0.5647059, 1, 0, 1,
-0.6635519, 0.7160866, 0.3352549, 0.5607843, 1, 0, 1,
-0.6630388, 0.7802417, 1.016321, 0.5529412, 1, 0, 1,
-0.6568884, 1.352732, -0.4572374, 0.5490196, 1, 0, 1,
-0.6531737, -1.82562, -3.440648, 0.5411765, 1, 0, 1,
-0.649715, 0.4899485, -1.84723, 0.5372549, 1, 0, 1,
-0.6450142, -1.115612, -2.602988, 0.5294118, 1, 0, 1,
-0.6432588, -1.765075, -3.274498, 0.5254902, 1, 0, 1,
-0.6398748, 2.332924, -0.7046783, 0.5176471, 1, 0, 1,
-0.6395711, 0.8917342, -0.7375562, 0.5137255, 1, 0, 1,
-0.6394856, 0.3268903, -0.4473614, 0.5058824, 1, 0, 1,
-0.6388521, -0.01027364, -0.4734124, 0.5019608, 1, 0, 1,
-0.636054, -0.9888935, -1.920786, 0.4941176, 1, 0, 1,
-0.6329806, -0.47629, -3.246279, 0.4862745, 1, 0, 1,
-0.6262566, -0.3125704, -3.32295, 0.4823529, 1, 0, 1,
-0.6162816, 0.877578, -2.103563, 0.4745098, 1, 0, 1,
-0.6159074, 0.2098804, -1.289031, 0.4705882, 1, 0, 1,
-0.6142554, 0.1545718, -0.9474065, 0.4627451, 1, 0, 1,
-0.6129291, 0.005275258, -2.300714, 0.4588235, 1, 0, 1,
-0.6077715, -0.2936176, -2.647382, 0.4509804, 1, 0, 1,
-0.6075031, 0.7476901, 0.4180056, 0.4470588, 1, 0, 1,
-0.6060691, 1.610831, -1.531194, 0.4392157, 1, 0, 1,
-0.6042342, -0.1513914, -1.933328, 0.4352941, 1, 0, 1,
-0.6007563, 0.8450624, 1.233828, 0.427451, 1, 0, 1,
-0.5974607, 0.4633134, -1.261375, 0.4235294, 1, 0, 1,
-0.5968986, -1.555771, -4.222729, 0.4156863, 1, 0, 1,
-0.5961221, -0.8167287, -3.000654, 0.4117647, 1, 0, 1,
-0.5949025, 0.2626102, -1.498373, 0.4039216, 1, 0, 1,
-0.5927765, -0.7152506, -2.299458, 0.3960784, 1, 0, 1,
-0.585954, -0.5812414, -2.019697, 0.3921569, 1, 0, 1,
-0.5846105, -0.07937888, -2.496918, 0.3843137, 1, 0, 1,
-0.5824511, -1.148379, -2.957684, 0.3803922, 1, 0, 1,
-0.5812342, 1.476012, -1.336686, 0.372549, 1, 0, 1,
-0.5727346, -1.287284, -1.878774, 0.3686275, 1, 0, 1,
-0.5643351, 0.1071079, -0.2151004, 0.3607843, 1, 0, 1,
-0.5630504, 0.4879171, -2.650775, 0.3568628, 1, 0, 1,
-0.5546786, -1.757332, -1.891478, 0.3490196, 1, 0, 1,
-0.5444428, -0.09325466, -0.9095917, 0.345098, 1, 0, 1,
-0.5417359, 0.3339565, -1.781329, 0.3372549, 1, 0, 1,
-0.5406796, 1.075856, 0.658156, 0.3333333, 1, 0, 1,
-0.5377488, 0.3047723, -1.916685, 0.3254902, 1, 0, 1,
-0.533622, -0.4556302, -2.169857, 0.3215686, 1, 0, 1,
-0.5225129, -2.125122, -3.060519, 0.3137255, 1, 0, 1,
-0.5214109, 0.01199664, -1.652624, 0.3098039, 1, 0, 1,
-0.5206597, 0.05166998, -2.133282, 0.3019608, 1, 0, 1,
-0.5143796, 1.208055, -1.730413, 0.2941177, 1, 0, 1,
-0.5140949, -0.8033608, -1.187439, 0.2901961, 1, 0, 1,
-0.5136173, -0.962814, -1.724401, 0.282353, 1, 0, 1,
-0.5066903, 1.064033, -1.720846, 0.2784314, 1, 0, 1,
-0.5012208, -1.395368, -1.215371, 0.2705882, 1, 0, 1,
-0.4995944, -0.6798552, -1.699169, 0.2666667, 1, 0, 1,
-0.4962272, -0.2236246, -1.762386, 0.2588235, 1, 0, 1,
-0.4921566, -2.238541, -1.152847, 0.254902, 1, 0, 1,
-0.4914981, -2.158771, -0.9129197, 0.2470588, 1, 0, 1,
-0.4912759, 1.657212, 0.8995706, 0.2431373, 1, 0, 1,
-0.4846555, 0.06349323, -1.89975, 0.2352941, 1, 0, 1,
-0.4835922, 1.132651, -1.186103, 0.2313726, 1, 0, 1,
-0.4796607, 1.855024, 1.093296, 0.2235294, 1, 0, 1,
-0.4752185, 0.9442924, -0.7936898, 0.2196078, 1, 0, 1,
-0.4740935, -0.851194, -1.151803, 0.2117647, 1, 0, 1,
-0.4740558, 0.7987759, 0.04263327, 0.2078431, 1, 0, 1,
-0.4729193, 2.08944, -0.9708893, 0.2, 1, 0, 1,
-0.468576, 0.3353768, -1.311976, 0.1921569, 1, 0, 1,
-0.4630826, 1.047571, -0.05041459, 0.1882353, 1, 0, 1,
-0.4630115, 0.6529421, -0.4781945, 0.1803922, 1, 0, 1,
-0.4496738, 0.7009575, 0.8274858, 0.1764706, 1, 0, 1,
-0.4446084, 0.6410309, -2.444021, 0.1686275, 1, 0, 1,
-0.441547, -0.1972288, 0.5920668, 0.1647059, 1, 0, 1,
-0.4394228, -0.04617152, -0.7161613, 0.1568628, 1, 0, 1,
-0.4336642, -0.7221787, -2.905747, 0.1529412, 1, 0, 1,
-0.4318435, -0.308173, -2.529891, 0.145098, 1, 0, 1,
-0.4309801, 0.7888736, -1.72984, 0.1411765, 1, 0, 1,
-0.4266971, -0.3699909, -3.286306, 0.1333333, 1, 0, 1,
-0.4233976, -0.1750786, -2.075254, 0.1294118, 1, 0, 1,
-0.4218676, 0.3749, -0.05478632, 0.1215686, 1, 0, 1,
-0.4214214, -0.5158684, -4.327974, 0.1176471, 1, 0, 1,
-0.4202713, 0.4993114, 0.01343629, 0.1098039, 1, 0, 1,
-0.4194946, 0.7423064, -0.8192571, 0.1058824, 1, 0, 1,
-0.407463, -1.098772, -3.908018, 0.09803922, 1, 0, 1,
-0.4008872, 1.042439, -0.74379, 0.09019608, 1, 0, 1,
-0.4005629, 0.8738014, -1.551472, 0.08627451, 1, 0, 1,
-0.4000628, -0.09489054, -4.317529, 0.07843138, 1, 0, 1,
-0.3986095, 0.04373546, -0.9777721, 0.07450981, 1, 0, 1,
-0.3919042, -2.480889, -5.168779, 0.06666667, 1, 0, 1,
-0.3893505, 0.2533993, -0.640286, 0.0627451, 1, 0, 1,
-0.3876338, -1.212616, -3.779375, 0.05490196, 1, 0, 1,
-0.38762, -0.6963358, -1.307403, 0.05098039, 1, 0, 1,
-0.3844094, 0.1552982, -1.766451, 0.04313726, 1, 0, 1,
-0.3821921, -0.2438273, -1.720065, 0.03921569, 1, 0, 1,
-0.3754743, 0.502314, -1.535132, 0.03137255, 1, 0, 1,
-0.3741122, 0.09895325, -1.457338, 0.02745098, 1, 0, 1,
-0.3733864, 0.5497478, 0.193993, 0.01960784, 1, 0, 1,
-0.370493, -0.8953984, -3.493, 0.01568628, 1, 0, 1,
-0.3701348, -0.558287, -1.465023, 0.007843138, 1, 0, 1,
-0.3696514, -0.02574175, -3.289179, 0.003921569, 1, 0, 1,
-0.3675736, 1.878976, 2.061695, 0, 1, 0.003921569, 1,
-0.3650802, -1.68568, -3.841878, 0, 1, 0.01176471, 1,
-0.364926, 0.1913677, 0.2443596, 0, 1, 0.01568628, 1,
-0.3643943, 1.608536, -1.378242, 0, 1, 0.02352941, 1,
-0.3643137, -0.8558689, -2.478173, 0, 1, 0.02745098, 1,
-0.3634346, 0.1323576, -1.803156, 0, 1, 0.03529412, 1,
-0.3611386, 0.07890837, -3.004533, 0, 1, 0.03921569, 1,
-0.3583633, 0.06517133, -0.844711, 0, 1, 0.04705882, 1,
-0.3520907, 0.4136401, -0.3238504, 0, 1, 0.05098039, 1,
-0.3479054, 1.540826, -1.582164, 0, 1, 0.05882353, 1,
-0.3460647, 0.4935665, 0.6827137, 0, 1, 0.0627451, 1,
-0.3444222, 0.6865389, -0.998578, 0, 1, 0.07058824, 1,
-0.3426422, -0.9971355, -2.742197, 0, 1, 0.07450981, 1,
-0.3414367, 0.2698004, -0.9571544, 0, 1, 0.08235294, 1,
-0.3412504, 0.5600514, -0.1966052, 0, 1, 0.08627451, 1,
-0.3404699, -1.461318, -3.55164, 0, 1, 0.09411765, 1,
-0.3404638, 1.375572, -0.4213897, 0, 1, 0.1019608, 1,
-0.3361198, -1.089239, -4.948946, 0, 1, 0.1058824, 1,
-0.3341932, 0.7098787, -1.314893, 0, 1, 0.1137255, 1,
-0.3335406, -0.5874341, -2.714492, 0, 1, 0.1176471, 1,
-0.3325711, 1.087722, -1.009205, 0, 1, 0.1254902, 1,
-0.3300984, 0.05304361, 0.5838639, 0, 1, 0.1294118, 1,
-0.3253566, 0.9323074, 0.4077842, 0, 1, 0.1372549, 1,
-0.3210874, -1.358797, -2.119464, 0, 1, 0.1411765, 1,
-0.3165529, -1.486607, -2.008637, 0, 1, 0.1490196, 1,
-0.3154067, 0.776418, -1.30617, 0, 1, 0.1529412, 1,
-0.3101843, -0.3118696, -2.720399, 0, 1, 0.1607843, 1,
-0.3099059, 1.051217, -1.663137, 0, 1, 0.1647059, 1,
-0.3058437, 0.203948, -1.078302, 0, 1, 0.172549, 1,
-0.3035745, 0.2055348, 1.618899, 0, 1, 0.1764706, 1,
-0.3029765, -0.9089332, -3.058426, 0, 1, 0.1843137, 1,
-0.2996297, 0.2743397, 0.257047, 0, 1, 0.1882353, 1,
-0.2931471, -1.213591, -1.907872, 0, 1, 0.1960784, 1,
-0.2883649, 1.67597, 1.549297, 0, 1, 0.2039216, 1,
-0.2860909, 1.412207, 2.047562, 0, 1, 0.2078431, 1,
-0.2860318, -0.3543756, -1.62408, 0, 1, 0.2156863, 1,
-0.2809994, 0.9854749, 0.9639854, 0, 1, 0.2196078, 1,
-0.2800252, 0.3999363, -1.167595, 0, 1, 0.227451, 1,
-0.2599876, 0.2291718, -1.211976, 0, 1, 0.2313726, 1,
-0.2554714, -0.5859876, -2.241455, 0, 1, 0.2392157, 1,
-0.2513683, -1.570335, -3.382602, 0, 1, 0.2431373, 1,
-0.24855, 0.7035112, 0.06262436, 0, 1, 0.2509804, 1,
-0.2467816, 0.8474988, -0.4253891, 0, 1, 0.254902, 1,
-0.2467578, 0.9758517, -1.296252, 0, 1, 0.2627451, 1,
-0.2463957, -0.8107004, -2.233082, 0, 1, 0.2666667, 1,
-0.2458848, 0.435075, -1.294064, 0, 1, 0.2745098, 1,
-0.2410141, -0.4041642, -4.405961, 0, 1, 0.2784314, 1,
-0.2397859, 0.252224, -0.443456, 0, 1, 0.2862745, 1,
-0.2366607, -1.334786, -1.987184, 0, 1, 0.2901961, 1,
-0.2328038, -0.8405585, -2.856362, 0, 1, 0.2980392, 1,
-0.2318156, -1.023987, -1.96165, 0, 1, 0.3058824, 1,
-0.2293697, 0.3165933, -0.1277335, 0, 1, 0.3098039, 1,
-0.2270591, -0.680437, -3.248082, 0, 1, 0.3176471, 1,
-0.2266727, -0.5911564, -4.367399, 0, 1, 0.3215686, 1,
-0.2266642, -0.8534846, -1.032962, 0, 1, 0.3294118, 1,
-0.2234951, -0.0103776, -2.415475, 0, 1, 0.3333333, 1,
-0.2223859, 0.4296566, 1.415969, 0, 1, 0.3411765, 1,
-0.2223286, 0.263534, -0.2385688, 0, 1, 0.345098, 1,
-0.221242, -0.1058001, -1.565087, 0, 1, 0.3529412, 1,
-0.220792, 2.497718, -1.350988, 0, 1, 0.3568628, 1,
-0.219783, 1.921715, 0.1591808, 0, 1, 0.3647059, 1,
-0.2189849, 0.1446132, -1.551393, 0, 1, 0.3686275, 1,
-0.2169223, -1.470818, -1.754807, 0, 1, 0.3764706, 1,
-0.2158661, 0.2261334, -1.971529, 0, 1, 0.3803922, 1,
-0.2145534, -0.7604045, -2.706976, 0, 1, 0.3882353, 1,
-0.2144352, -1.749846, -2.124943, 0, 1, 0.3921569, 1,
-0.2135382, -0.9626004, -2.25389, 0, 1, 0.4, 1,
-0.2123543, 0.2623814, -0.3912104, 0, 1, 0.4078431, 1,
-0.2112969, -0.5078298, -2.931913, 0, 1, 0.4117647, 1,
-0.2099972, -1.020786, -4.439219, 0, 1, 0.4196078, 1,
-0.2065488, 0.3601446, -1.240999, 0, 1, 0.4235294, 1,
-0.2060361, 0.05991126, -1.806416, 0, 1, 0.4313726, 1,
-0.2053119, 1.252526, -0.6045005, 0, 1, 0.4352941, 1,
-0.2002526, 0.7200654, -0.7252005, 0, 1, 0.4431373, 1,
-0.196848, -0.3291249, -1.440793, 0, 1, 0.4470588, 1,
-0.1959222, -1.461294, -2.752623, 0, 1, 0.454902, 1,
-0.1899865, -0.3669193, -2.654817, 0, 1, 0.4588235, 1,
-0.1881352, 0.3077259, -0.9859347, 0, 1, 0.4666667, 1,
-0.1852746, -1.125605, -3.068012, 0, 1, 0.4705882, 1,
-0.1839365, 0.4817317, -1.302985, 0, 1, 0.4784314, 1,
-0.1801384, 0.3719833, 1.098188, 0, 1, 0.4823529, 1,
-0.1798394, 0.2904525, -0.6772205, 0, 1, 0.4901961, 1,
-0.1783561, 0.7113529, -0.1958673, 0, 1, 0.4941176, 1,
-0.1752994, 1.079606, 0.6161696, 0, 1, 0.5019608, 1,
-0.1746038, 1.313743, 0.02810209, 0, 1, 0.509804, 1,
-0.1744295, -0.9498925, -3.532256, 0, 1, 0.5137255, 1,
-0.1660157, -2.084402, -2.983246, 0, 1, 0.5215687, 1,
-0.1652375, 1.133993, -0.02434583, 0, 1, 0.5254902, 1,
-0.1648564, 2.443388, -0.5361775, 0, 1, 0.5333334, 1,
-0.1552919, -0.2543646, -1.686988, 0, 1, 0.5372549, 1,
-0.1506149, -0.2553633, -3.634442, 0, 1, 0.5450981, 1,
-0.1493346, -0.08151963, -2.555487, 0, 1, 0.5490196, 1,
-0.1462564, -0.5923829, -1.635968, 0, 1, 0.5568628, 1,
-0.1461388, -1.143421, -4.810742, 0, 1, 0.5607843, 1,
-0.1459513, 0.2195498, 0.4193512, 0, 1, 0.5686275, 1,
-0.1394954, 1.796352, 1.017218, 0, 1, 0.572549, 1,
-0.1382766, 1.847149, 0.3989531, 0, 1, 0.5803922, 1,
-0.1382091, -1.032623, -2.328379, 0, 1, 0.5843138, 1,
-0.1362866, -0.7520023, -3.186644, 0, 1, 0.5921569, 1,
-0.133019, -0.921382, -1.955784, 0, 1, 0.5960785, 1,
-0.1317881, -0.5992819, -2.419353, 0, 1, 0.6039216, 1,
-0.1291611, 0.458335, 1.456496, 0, 1, 0.6117647, 1,
-0.1250959, -1.480672, -3.51666, 0, 1, 0.6156863, 1,
-0.1189486, 0.5025176, 0.3440178, 0, 1, 0.6235294, 1,
-0.1186951, -0.419028, -3.870156, 0, 1, 0.627451, 1,
-0.1141749, 0.505174, -0.2471689, 0, 1, 0.6352941, 1,
-0.1140159, 0.4891293, -0.6452289, 0, 1, 0.6392157, 1,
-0.1137097, -0.7775065, -2.616702, 0, 1, 0.6470588, 1,
-0.1123814, 0.347062, -0.7137293, 0, 1, 0.6509804, 1,
-0.1123044, -0.5293075, -3.251525, 0, 1, 0.6588235, 1,
-0.1108171, -0.9572523, -5.12601, 0, 1, 0.6627451, 1,
-0.1103132, 0.8912627, -0.9629942, 0, 1, 0.6705883, 1,
-0.1068379, 1.524695, 0.6473591, 0, 1, 0.6745098, 1,
-0.1063219, -1.289667, -3.767455, 0, 1, 0.682353, 1,
-0.1016795, -0.4807269, -3.050548, 0, 1, 0.6862745, 1,
-0.09815566, 0.1115307, -1.709889, 0, 1, 0.6941177, 1,
-0.09682705, -0.02769538, -0.7192802, 0, 1, 0.7019608, 1,
-0.09626986, 0.5587541, 0.7902901, 0, 1, 0.7058824, 1,
-0.09262103, -0.7195969, -2.895447, 0, 1, 0.7137255, 1,
-0.0923976, -1.559541, -1.907599, 0, 1, 0.7176471, 1,
-0.09117197, -1.521059, -2.701607, 0, 1, 0.7254902, 1,
-0.09033717, 0.785897, -0.8239475, 0, 1, 0.7294118, 1,
-0.09004779, 0.03557542, 1.127409, 0, 1, 0.7372549, 1,
-0.08871888, 0.1617089, -2.565155, 0, 1, 0.7411765, 1,
-0.08534222, -0.7936755, -4.438162, 0, 1, 0.7490196, 1,
-0.08430226, 0.8788417, 1.139034, 0, 1, 0.7529412, 1,
-0.07944536, 0.9703088, 1.466354, 0, 1, 0.7607843, 1,
-0.07644591, 0.1217731, -0.7766339, 0, 1, 0.7647059, 1,
-0.0642119, 0.7654208, -0.5903013, 0, 1, 0.772549, 1,
-0.06352848, -0.6111251, -2.408473, 0, 1, 0.7764706, 1,
-0.05961351, 1.584914, 0.1414041, 0, 1, 0.7843137, 1,
-0.04513847, -0.2893859, -1.937691, 0, 1, 0.7882353, 1,
-0.0450745, 0.8762928, -0.3638878, 0, 1, 0.7960784, 1,
-0.04482392, 0.6464171, -0.3337312, 0, 1, 0.8039216, 1,
-0.04468933, -0.8378664, -3.085824, 0, 1, 0.8078431, 1,
-0.04391371, 0.03695428, 0.8192435, 0, 1, 0.8156863, 1,
-0.04364887, 0.6748754, -1.353354, 0, 1, 0.8196079, 1,
-0.04323765, -1.314264, -3.524706, 0, 1, 0.827451, 1,
-0.04128864, -0.7072781, -2.966443, 0, 1, 0.8313726, 1,
-0.0396036, -0.2533881, -2.399101, 0, 1, 0.8392157, 1,
-0.03937363, -1.14845, -4.180929, 0, 1, 0.8431373, 1,
-0.03263458, -1.171159, -2.865702, 0, 1, 0.8509804, 1,
-0.02992854, 1.610324, -0.7511861, 0, 1, 0.854902, 1,
-0.02710132, -0.4644203, -3.529397, 0, 1, 0.8627451, 1,
-0.02525316, -2.055184, -3.141659, 0, 1, 0.8666667, 1,
-0.02262405, -0.4460023, -1.937911, 0, 1, 0.8745098, 1,
-0.01948538, 0.6968215, 0.4811632, 0, 1, 0.8784314, 1,
-0.01944938, 1.127221, -1.809634, 0, 1, 0.8862745, 1,
-0.01363616, 0.3710984, -0.6366207, 0, 1, 0.8901961, 1,
-0.007078951, 0.1245827, -0.4605846, 0, 1, 0.8980392, 1,
-0.002381623, 0.3272941, 0.851473, 0, 1, 0.9058824, 1,
-0.00235699, -0.01929691, -3.580005, 0, 1, 0.9098039, 1,
-6.36307e-05, -0.1725038, -1.122483, 0, 1, 0.9176471, 1,
8.659823e-06, -0.2681503, 3.770889, 0, 1, 0.9215686, 1,
0.004457125, 0.2341824, -0.8111848, 0, 1, 0.9294118, 1,
0.01164036, 1.180807, 0.4275155, 0, 1, 0.9333333, 1,
0.0135605, 0.5945602, 0.6672552, 0, 1, 0.9411765, 1,
0.01788403, 1.737525, 1.06037, 0, 1, 0.945098, 1,
0.02671132, 0.4049842, 1.226214, 0, 1, 0.9529412, 1,
0.02858912, -0.4707002, 3.248111, 0, 1, 0.9568627, 1,
0.0322048, -1.255138, 4.419757, 0, 1, 0.9647059, 1,
0.03233714, -0.7146717, 4.407118, 0, 1, 0.9686275, 1,
0.03319087, 0.1057186, -2.258114, 0, 1, 0.9764706, 1,
0.03631453, 0.6084148, -0.1897833, 0, 1, 0.9803922, 1,
0.03660395, 0.789442, 0.2286916, 0, 1, 0.9882353, 1,
0.0389547, 0.691266, 1.10811, 0, 1, 0.9921569, 1,
0.03922847, -0.2366398, 2.795017, 0, 1, 1, 1,
0.04687615, -0.3939467, 1.848019, 0, 0.9921569, 1, 1,
0.04783871, 0.1992188, 0.7513044, 0, 0.9882353, 1, 1,
0.04807629, -1.537671, 3.843996, 0, 0.9803922, 1, 1,
0.05060622, 1.096011, -0.996511, 0, 0.9764706, 1, 1,
0.05081144, -1.394746, 1.163959, 0, 0.9686275, 1, 1,
0.05269175, -0.3805205, 2.930415, 0, 0.9647059, 1, 1,
0.05279966, -1.130991, 3.599744, 0, 0.9568627, 1, 1,
0.06755721, -0.1982733, 3.452652, 0, 0.9529412, 1, 1,
0.06757011, -0.3451517, 0.7202334, 0, 0.945098, 1, 1,
0.07147876, -0.5796158, 2.791858, 0, 0.9411765, 1, 1,
0.07339173, -1.253857, 3.496724, 0, 0.9333333, 1, 1,
0.07445189, -1.248891, 3.207133, 0, 0.9294118, 1, 1,
0.07905759, -0.7716245, 4.678679, 0, 0.9215686, 1, 1,
0.08164314, -1.30453, 3.423267, 0, 0.9176471, 1, 1,
0.0816558, 0.5331866, -1.169701, 0, 0.9098039, 1, 1,
0.08815101, 0.9963308, -0.1255345, 0, 0.9058824, 1, 1,
0.08821109, 0.1943463, 0.7367049, 0, 0.8980392, 1, 1,
0.09161959, -1.313112, 1.00232, 0, 0.8901961, 1, 1,
0.09490065, -0.1696791, 3.187658, 0, 0.8862745, 1, 1,
0.09559916, -0.1692496, 3.433681, 0, 0.8784314, 1, 1,
0.1036904, -0.5053218, 4.197945, 0, 0.8745098, 1, 1,
0.1049942, 0.3002611, 0.2895049, 0, 0.8666667, 1, 1,
0.1063905, -0.5801678, 3.458464, 0, 0.8627451, 1, 1,
0.1066974, 1.477774, 1.105482, 0, 0.854902, 1, 1,
0.1087224, -0.2033844, 3.017821, 0, 0.8509804, 1, 1,
0.1091732, 1.022156, -1.20135, 0, 0.8431373, 1, 1,
0.109425, 0.8972879, 0.08234002, 0, 0.8392157, 1, 1,
0.118155, 0.7370149, -1.865935, 0, 0.8313726, 1, 1,
0.1204419, -0.7129876, 2.996277, 0, 0.827451, 1, 1,
0.1245429, 0.7274391, 1.042785, 0, 0.8196079, 1, 1,
0.1247964, 1.023549, 0.5766088, 0, 0.8156863, 1, 1,
0.1282466, -0.3221883, 0.6895202, 0, 0.8078431, 1, 1,
0.1308135, 0.2472712, 0.3148666, 0, 0.8039216, 1, 1,
0.1319249, -0.8886088, 2.163446, 0, 0.7960784, 1, 1,
0.135903, 1.575719, -0.3523945, 0, 0.7882353, 1, 1,
0.1384986, 0.0153866, 1.629331, 0, 0.7843137, 1, 1,
0.1415311, 0.9782234, 0.3769515, 0, 0.7764706, 1, 1,
0.1426111, 0.4470631, 1.971836, 0, 0.772549, 1, 1,
0.1454385, 0.1654162, -1.240004, 0, 0.7647059, 1, 1,
0.1469848, -0.836641, 2.946795, 0, 0.7607843, 1, 1,
0.1523818, 1.1508, -0.09802923, 0, 0.7529412, 1, 1,
0.1543897, -0.2089318, 0.6434393, 0, 0.7490196, 1, 1,
0.1562761, -0.5740085, 2.34197, 0, 0.7411765, 1, 1,
0.1713734, -1.341635, 4.938839, 0, 0.7372549, 1, 1,
0.1808123, 0.2910438, 0.2546599, 0, 0.7294118, 1, 1,
0.1813801, -0.8779774, 3.833214, 0, 0.7254902, 1, 1,
0.182815, 2.681718, 1.000898, 0, 0.7176471, 1, 1,
0.1870768, 1.614504, -1.446753, 0, 0.7137255, 1, 1,
0.1877876, 0.2293982, 0.3017008, 0, 0.7058824, 1, 1,
0.190793, -0.8965115, 3.01529, 0, 0.6980392, 1, 1,
0.1909267, -1.364015, 3.166703, 0, 0.6941177, 1, 1,
0.1914096, 1.167612, -0.2712053, 0, 0.6862745, 1, 1,
0.1951373, 0.5326179, -0.5928195, 0, 0.682353, 1, 1,
0.1953977, 0.4113077, -0.1403039, 0, 0.6745098, 1, 1,
0.1956447, 0.2951308, -0.148485, 0, 0.6705883, 1, 1,
0.1966416, 0.8297565, 1.239499, 0, 0.6627451, 1, 1,
0.1978568, 0.4890722, -0.2770596, 0, 0.6588235, 1, 1,
0.1989785, 1.901373, 0.9943193, 0, 0.6509804, 1, 1,
0.201104, -0.3020017, 1.420854, 0, 0.6470588, 1, 1,
0.2025459, -0.3681386, 1.133264, 0, 0.6392157, 1, 1,
0.2032157, -1.524059, 3.065912, 0, 0.6352941, 1, 1,
0.2037281, 0.7117907, 0.6975897, 0, 0.627451, 1, 1,
0.2057519, -0.9279869, 2.750206, 0, 0.6235294, 1, 1,
0.2092616, -0.9289894, 3.667188, 0, 0.6156863, 1, 1,
0.2095773, 1.075784, -0.2470992, 0, 0.6117647, 1, 1,
0.2115101, 0.8141853, -0.02277733, 0, 0.6039216, 1, 1,
0.2152135, -0.4983189, 3.123768, 0, 0.5960785, 1, 1,
0.2186029, 0.6755632, -0.2345397, 0, 0.5921569, 1, 1,
0.2186381, -0.8551643, 2.708135, 0, 0.5843138, 1, 1,
0.2226848, 0.9066852, 0.6141875, 0, 0.5803922, 1, 1,
0.2238411, -1.385394, 2.953958, 0, 0.572549, 1, 1,
0.2248244, 1.275748, 0.9718508, 0, 0.5686275, 1, 1,
0.2299055, -1.594134, 3.36462, 0, 0.5607843, 1, 1,
0.2335778, -1.138669, 3.632258, 0, 0.5568628, 1, 1,
0.2381086, 0.5263306, 0.2386858, 0, 0.5490196, 1, 1,
0.2403013, -1.406424, 2.130777, 0, 0.5450981, 1, 1,
0.2444713, 1.472459, 0.04882801, 0, 0.5372549, 1, 1,
0.2450982, -0.1863296, 0.3898683, 0, 0.5333334, 1, 1,
0.2538614, -0.9019189, 2.841924, 0, 0.5254902, 1, 1,
0.2546457, 2.200943, -1.093663, 0, 0.5215687, 1, 1,
0.2672819, 1.184441, 0.3215619, 0, 0.5137255, 1, 1,
0.2673469, 0.7953618, -0.6563223, 0, 0.509804, 1, 1,
0.2678667, 0.506806, -0.06208253, 0, 0.5019608, 1, 1,
0.2694403, -2.265029, 1.680033, 0, 0.4941176, 1, 1,
0.2708265, 0.1958168, 0.8210649, 0, 0.4901961, 1, 1,
0.27115, -0.5597188, 2.563661, 0, 0.4823529, 1, 1,
0.2753268, 2.470699, 0.8068808, 0, 0.4784314, 1, 1,
0.2779499, -0.6909698, 3.04769, 0, 0.4705882, 1, 1,
0.2814043, -0.6630562, 5.724746, 0, 0.4666667, 1, 1,
0.2827957, 2.272676, -0.816804, 0, 0.4588235, 1, 1,
0.2860164, 1.737406, 1.087784, 0, 0.454902, 1, 1,
0.2862646, -0.6260378, 2.993624, 0, 0.4470588, 1, 1,
0.2917627, 0.8419428, 0.3980541, 0, 0.4431373, 1, 1,
0.2928215, 1.568952, 0.06883983, 0, 0.4352941, 1, 1,
0.2931902, -0.8386118, 2.576373, 0, 0.4313726, 1, 1,
0.2970876, 1.457814, 0.601405, 0, 0.4235294, 1, 1,
0.2971026, 0.9596803, -0.629598, 0, 0.4196078, 1, 1,
0.2971208, -0.2418712, 2.907577, 0, 0.4117647, 1, 1,
0.2976787, 1.39306, 1.54772, 0, 0.4078431, 1, 1,
0.3003317, 1.398545, 1.930014, 0, 0.4, 1, 1,
0.3012277, -0.09823585, 0.8676828, 0, 0.3921569, 1, 1,
0.3028008, 0.4075003, -0.3702878, 0, 0.3882353, 1, 1,
0.3075046, 0.1438128, 2.681136, 0, 0.3803922, 1, 1,
0.3115035, 0.4835192, 3.235, 0, 0.3764706, 1, 1,
0.3116574, 1.078406, -0.5275868, 0, 0.3686275, 1, 1,
0.3118486, 0.0572582, 0.8403535, 0, 0.3647059, 1, 1,
0.3180672, 0.09155139, 2.400505, 0, 0.3568628, 1, 1,
0.3189851, 1.516926, -0.4986641, 0, 0.3529412, 1, 1,
0.3194471, 0.1778385, 1.418716, 0, 0.345098, 1, 1,
0.3213509, 1.708586, 0.3908499, 0, 0.3411765, 1, 1,
0.3216455, 0.1568232, 1.090934, 0, 0.3333333, 1, 1,
0.3226423, -0.2176104, 2.754081, 0, 0.3294118, 1, 1,
0.3238103, 1.08406, 0.4614059, 0, 0.3215686, 1, 1,
0.3271803, -0.590424, 1.645973, 0, 0.3176471, 1, 1,
0.3295231, 2.012407, -1.891872, 0, 0.3098039, 1, 1,
0.3297778, 0.8104229, -0.8237674, 0, 0.3058824, 1, 1,
0.336406, 0.1822988, 0.5917144, 0, 0.2980392, 1, 1,
0.3416121, 0.6150469, 1.119992, 0, 0.2901961, 1, 1,
0.3443625, -1.4834, 2.722977, 0, 0.2862745, 1, 1,
0.3445899, 0.4398414, 1.264496, 0, 0.2784314, 1, 1,
0.3451411, -0.611254, 3.003938, 0, 0.2745098, 1, 1,
0.3489413, -1.555536, 2.447449, 0, 0.2666667, 1, 1,
0.3561685, -0.09353417, 2.094037, 0, 0.2627451, 1, 1,
0.3582149, 0.6147051, -0.4546595, 0, 0.254902, 1, 1,
0.358541, -0.5355823, 2.299176, 0, 0.2509804, 1, 1,
0.3640452, 0.5702293, 0.1701322, 0, 0.2431373, 1, 1,
0.3673188, 0.3058217, 2.989775, 0, 0.2392157, 1, 1,
0.3683758, -1.427128, 1.692224, 0, 0.2313726, 1, 1,
0.3688192, 1.022502, 1.058253, 0, 0.227451, 1, 1,
0.3689143, -0.1878079, 3.065962, 0, 0.2196078, 1, 1,
0.3704028, 1.030126, -0.8328721, 0, 0.2156863, 1, 1,
0.3768694, 1.388751, 0.349862, 0, 0.2078431, 1, 1,
0.3773581, 0.07460015, 1.921554, 0, 0.2039216, 1, 1,
0.3788297, -0.5906293, 2.93464, 0, 0.1960784, 1, 1,
0.3818604, 0.7726991, 1.860401, 0, 0.1882353, 1, 1,
0.3864371, 0.573038, 2.058336, 0, 0.1843137, 1, 1,
0.3877459, -0.8415862, 1.071717, 0, 0.1764706, 1, 1,
0.3889479, -0.707639, 2.410123, 0, 0.172549, 1, 1,
0.3893266, 0.8709222, 1.796362, 0, 0.1647059, 1, 1,
0.3896555, -0.7279856, 3.395004, 0, 0.1607843, 1, 1,
0.3983445, -0.1977665, 3.005073, 0, 0.1529412, 1, 1,
0.4057782, -1.024603, 1.312348, 0, 0.1490196, 1, 1,
0.4067552, 0.9511201, 1.020355, 0, 0.1411765, 1, 1,
0.4085385, 0.6863379, 0.7385412, 0, 0.1372549, 1, 1,
0.4114099, 1.0019, 0.834642, 0, 0.1294118, 1, 1,
0.4182884, 0.6992754, 1.237264, 0, 0.1254902, 1, 1,
0.4197399, 1.698914, 1.963838, 0, 0.1176471, 1, 1,
0.4212335, -1.250095, 2.233038, 0, 0.1137255, 1, 1,
0.4232502, -0.2986698, 3.683548, 0, 0.1058824, 1, 1,
0.4301318, -1.548523, 2.167916, 0, 0.09803922, 1, 1,
0.4318956, -0.6885197, 3.903983, 0, 0.09411765, 1, 1,
0.4325235, -0.1883319, 2.103941, 0, 0.08627451, 1, 1,
0.4351543, -3.252938, 1.759754, 0, 0.08235294, 1, 1,
0.4379835, -0.9007783, 3.936632, 0, 0.07450981, 1, 1,
0.443336, 0.6932387, 0.7153493, 0, 0.07058824, 1, 1,
0.4445351, -2.046449, 4.787707, 0, 0.0627451, 1, 1,
0.4460519, -0.5478573, 4.511952, 0, 0.05882353, 1, 1,
0.4465713, -1.321036, 1.078838, 0, 0.05098039, 1, 1,
0.448651, 1.059309, 1.821996, 0, 0.04705882, 1, 1,
0.4524913, 2.139412, 1.060386, 0, 0.03921569, 1, 1,
0.4575161, -0.2780478, 2.977875, 0, 0.03529412, 1, 1,
0.4580836, -0.539677, 2.623447, 0, 0.02745098, 1, 1,
0.460127, 1.369034, 0.6448376, 0, 0.02352941, 1, 1,
0.4689919, 0.6945412, 1.567246, 0, 0.01568628, 1, 1,
0.4698446, 1.342982, -1.293073, 0, 0.01176471, 1, 1,
0.4701954, 1.041351, 1.161486, 0, 0.003921569, 1, 1,
0.4706602, 0.1212242, 1.304196, 0.003921569, 0, 1, 1,
0.4724171, 0.9499064, 1.56705, 0.007843138, 0, 1, 1,
0.4782521, 2.478441, 1.69537, 0.01568628, 0, 1, 1,
0.4831855, 0.2685083, 1.563199, 0.01960784, 0, 1, 1,
0.4929267, 1.647988, 1.224727, 0.02745098, 0, 1, 1,
0.4938684, 0.2192699, 1.651295, 0.03137255, 0, 1, 1,
0.4948402, 0.6764482, 1.766175, 0.03921569, 0, 1, 1,
0.4964768, 1.096309, -0.3118033, 0.04313726, 0, 1, 1,
0.4991001, -0.9759856, 2.133253, 0.05098039, 0, 1, 1,
0.4999423, -0.01347942, 1.458601, 0.05490196, 0, 1, 1,
0.5046399, -0.4185351, 1.779529, 0.0627451, 0, 1, 1,
0.5050259, -1.188318, 3.649532, 0.06666667, 0, 1, 1,
0.5052734, 0.2165637, 1.458697, 0.07450981, 0, 1, 1,
0.5054386, -0.3907025, 3.383051, 0.07843138, 0, 1, 1,
0.5132072, 0.0157889, 1.215537, 0.08627451, 0, 1, 1,
0.5137457, -0.157755, 2.688851, 0.09019608, 0, 1, 1,
0.5140994, 0.9845433, 2.027139, 0.09803922, 0, 1, 1,
0.5169623, -0.4521558, 4.095192, 0.1058824, 0, 1, 1,
0.5170218, -1.920983, 3.079565, 0.1098039, 0, 1, 1,
0.5183918, 0.07615186, 0.6050385, 0.1176471, 0, 1, 1,
0.5205637, 1.185702, 0.9521825, 0.1215686, 0, 1, 1,
0.5228295, -1.41646, 2.572574, 0.1294118, 0, 1, 1,
0.5250034, -0.3531556, 1.874719, 0.1333333, 0, 1, 1,
0.5287189, -0.05721566, 1.476114, 0.1411765, 0, 1, 1,
0.5295592, -1.377539, 3.80713, 0.145098, 0, 1, 1,
0.5335732, 0.5778863, -1.430103, 0.1529412, 0, 1, 1,
0.5362359, 0.08898073, -0.3717596, 0.1568628, 0, 1, 1,
0.5377146, 0.03316278, -0.008074408, 0.1647059, 0, 1, 1,
0.5388814, 1.295741, 2.503817, 0.1686275, 0, 1, 1,
0.5393269, -0.1926234, 1.673994, 0.1764706, 0, 1, 1,
0.5404751, -0.385194, 1.681827, 0.1803922, 0, 1, 1,
0.540804, -0.4080408, 1.368589, 0.1882353, 0, 1, 1,
0.5454395, -0.6626692, 3.801764, 0.1921569, 0, 1, 1,
0.5501924, -0.04900073, 0.2973373, 0.2, 0, 1, 1,
0.5567748, -1.233281, 3.832214, 0.2078431, 0, 1, 1,
0.5580996, 0.4863954, 0.4000061, 0.2117647, 0, 1, 1,
0.5587531, -0.3091136, 2.433072, 0.2196078, 0, 1, 1,
0.5613831, -0.09487517, 0.9635352, 0.2235294, 0, 1, 1,
0.5618998, -1.587425, 3.475227, 0.2313726, 0, 1, 1,
0.5639611, 0.1524288, 1.439442, 0.2352941, 0, 1, 1,
0.568755, -1.386664, 1.467988, 0.2431373, 0, 1, 1,
0.5700427, 1.046348, 0.1423981, 0.2470588, 0, 1, 1,
0.5711962, -0.6389277, 2.572417, 0.254902, 0, 1, 1,
0.5722819, -0.06036423, 1.525869, 0.2588235, 0, 1, 1,
0.5741252, 1.045308, -0.03590903, 0.2666667, 0, 1, 1,
0.576116, -0.587719, 3.159188, 0.2705882, 0, 1, 1,
0.5799536, 1.879555, -1.569109, 0.2784314, 0, 1, 1,
0.5813631, -0.7138475, 1.900144, 0.282353, 0, 1, 1,
0.5814927, 1.640254, 0.788174, 0.2901961, 0, 1, 1,
0.5852829, -0.5637227, 2.657757, 0.2941177, 0, 1, 1,
0.5930271, -0.6153942, 2.077196, 0.3019608, 0, 1, 1,
0.5943896, -0.686142, 0.8129652, 0.3098039, 0, 1, 1,
0.5945057, -0.0459879, 2.146016, 0.3137255, 0, 1, 1,
0.5990428, -1.0351, 3.081012, 0.3215686, 0, 1, 1,
0.6024665, 0.7489692, 1.175262, 0.3254902, 0, 1, 1,
0.6052738, 0.02051648, 0.911077, 0.3333333, 0, 1, 1,
0.6058756, 1.921613, -0.4447597, 0.3372549, 0, 1, 1,
0.605889, 1.071818, 1.367069, 0.345098, 0, 1, 1,
0.6087373, -0.6471222, 3.872562, 0.3490196, 0, 1, 1,
0.6101027, -0.2521856, 2.285612, 0.3568628, 0, 1, 1,
0.6121945, -1.166281, 2.762366, 0.3607843, 0, 1, 1,
0.6132939, 0.266309, 2.311519, 0.3686275, 0, 1, 1,
0.6149966, 0.4460033, 0.9259127, 0.372549, 0, 1, 1,
0.6189998, 0.7261667, 2.268315, 0.3803922, 0, 1, 1,
0.6211556, -0.839747, 0.9097421, 0.3843137, 0, 1, 1,
0.6267015, 0.2241984, 1.625386, 0.3921569, 0, 1, 1,
0.641393, 0.5317742, 0.9899423, 0.3960784, 0, 1, 1,
0.6451052, -0.45612, 3.018426, 0.4039216, 0, 1, 1,
0.646335, -0.05523267, 3.468011, 0.4117647, 0, 1, 1,
0.6471649, -0.1664301, 1.911439, 0.4156863, 0, 1, 1,
0.6471863, 0.4406868, 0.5543408, 0.4235294, 0, 1, 1,
0.6526362, 0.07604356, 0.3144389, 0.427451, 0, 1, 1,
0.6529771, -0.1295841, 1.484212, 0.4352941, 0, 1, 1,
0.6567218, -1.088523, 2.817643, 0.4392157, 0, 1, 1,
0.6677029, -0.3159287, 2.243291, 0.4470588, 0, 1, 1,
0.6701064, -0.2513637, 2.177799, 0.4509804, 0, 1, 1,
0.6755633, 0.5948794, -0.8371799, 0.4588235, 0, 1, 1,
0.6755945, 0.6720616, 0.9336913, 0.4627451, 0, 1, 1,
0.67699, 0.3899627, 1.817832, 0.4705882, 0, 1, 1,
0.677124, -0.9201145, -0.1115244, 0.4745098, 0, 1, 1,
0.6774669, 0.2829598, 2.492319, 0.4823529, 0, 1, 1,
0.6877301, -0.1243967, 1.836146, 0.4862745, 0, 1, 1,
0.6909865, -0.07056254, 1.703131, 0.4941176, 0, 1, 1,
0.6934992, 1.181266, 0.8662083, 0.5019608, 0, 1, 1,
0.6954762, 0.3218127, 2.358285, 0.5058824, 0, 1, 1,
0.7034347, -0.06412414, 0.9838787, 0.5137255, 0, 1, 1,
0.7077746, 0.1515886, 1.90037, 0.5176471, 0, 1, 1,
0.7086911, 0.6736079, 0.6656783, 0.5254902, 0, 1, 1,
0.7087009, 0.01694764, -0.7910393, 0.5294118, 0, 1, 1,
0.7098818, -0.3683919, 1.544798, 0.5372549, 0, 1, 1,
0.715476, -1.017931, 1.840913, 0.5411765, 0, 1, 1,
0.7179283, 2.629484, -0.2313087, 0.5490196, 0, 1, 1,
0.7212823, -0.6016737, 1.433044, 0.5529412, 0, 1, 1,
0.7225563, 0.3079289, 2.048685, 0.5607843, 0, 1, 1,
0.724798, -0.3589387, 2.411791, 0.5647059, 0, 1, 1,
0.7287643, 0.06876304, 0.4210681, 0.572549, 0, 1, 1,
0.7364777, 0.909247, 1.468145, 0.5764706, 0, 1, 1,
0.7433036, -0.4316039, 2.318277, 0.5843138, 0, 1, 1,
0.7440851, -0.52007, 3.915389, 0.5882353, 0, 1, 1,
0.7458059, -0.4656533, 2.688874, 0.5960785, 0, 1, 1,
0.7483363, -0.005927493, 2.496623, 0.6039216, 0, 1, 1,
0.7585164, 1.310423, 0.2779154, 0.6078432, 0, 1, 1,
0.7597787, -1.138478, 2.321691, 0.6156863, 0, 1, 1,
0.7640139, 0.07236386, 1.770967, 0.6196079, 0, 1, 1,
0.769666, -0.788008, 2.814261, 0.627451, 0, 1, 1,
0.7792401, -0.07234243, 1.007382, 0.6313726, 0, 1, 1,
0.7817136, -1.494885, 2.778562, 0.6392157, 0, 1, 1,
0.7837055, -2.960253, 3.280453, 0.6431373, 0, 1, 1,
0.7875661, 0.249388, 1.581521, 0.6509804, 0, 1, 1,
0.7924246, -0.8364784, 1.490369, 0.654902, 0, 1, 1,
0.7940812, -1.739069, 3.393793, 0.6627451, 0, 1, 1,
0.7948533, -0.3653895, -0.3142977, 0.6666667, 0, 1, 1,
0.8006666, -0.8240881, 3.105453, 0.6745098, 0, 1, 1,
0.8020371, -0.02714189, 3.062237, 0.6784314, 0, 1, 1,
0.8120633, 1.618523, 0.7907798, 0.6862745, 0, 1, 1,
0.8223479, 0.8193785, -0.8786359, 0.6901961, 0, 1, 1,
0.8235765, 1.911719, -0.5914522, 0.6980392, 0, 1, 1,
0.8235978, -1.716751, 3.382105, 0.7058824, 0, 1, 1,
0.8238425, -1.174763, 1.774056, 0.7098039, 0, 1, 1,
0.8258389, -1.730023, 2.411987, 0.7176471, 0, 1, 1,
0.8281005, -0.9800757, 0.7895251, 0.7215686, 0, 1, 1,
0.8288662, 0.1942003, 0.3817476, 0.7294118, 0, 1, 1,
0.8302074, -1.348745, 2.55357, 0.7333333, 0, 1, 1,
0.832441, 3.151197, 0.3505423, 0.7411765, 0, 1, 1,
0.8334901, 0.2959754, 1.651843, 0.7450981, 0, 1, 1,
0.8338506, -0.7995545, 1.027679, 0.7529412, 0, 1, 1,
0.8343884, -0.05629105, 2.319968, 0.7568628, 0, 1, 1,
0.8351098, -0.1171925, 0.9382854, 0.7647059, 0, 1, 1,
0.8367184, 0.7034895, 0.8361257, 0.7686275, 0, 1, 1,
0.8419918, 0.2749926, 0.3728838, 0.7764706, 0, 1, 1,
0.8443173, 1.005582, 0.2048232, 0.7803922, 0, 1, 1,
0.8649287, -0.005021016, 1.40022, 0.7882353, 0, 1, 1,
0.8685649, 1.033223, 1.022341, 0.7921569, 0, 1, 1,
0.8696999, -0.2030591, 2.228586, 0.8, 0, 1, 1,
0.875348, 0.6222295, 1.741686, 0.8078431, 0, 1, 1,
0.8792785, 0.8112385, 2.980886, 0.8117647, 0, 1, 1,
0.888517, -3.328885, 3.319025, 0.8196079, 0, 1, 1,
0.8890867, 0.971382, 0.9248069, 0.8235294, 0, 1, 1,
0.8931868, 1.764181, 0.7754434, 0.8313726, 0, 1, 1,
0.8933917, 0.7310917, 0.08921107, 0.8352941, 0, 1, 1,
0.8984515, 2.482002, 0.3617311, 0.8431373, 0, 1, 1,
0.8995218, -0.7258934, 2.66397, 0.8470588, 0, 1, 1,
0.901575, -0.980586, 0.8493082, 0.854902, 0, 1, 1,
0.9029021, -0.7701003, 3.377496, 0.8588235, 0, 1, 1,
0.9144357, 0.3253503, 1.503216, 0.8666667, 0, 1, 1,
0.9191784, -0.4300275, 2.524863, 0.8705882, 0, 1, 1,
0.9234759, 0.3491746, 0.5167004, 0.8784314, 0, 1, 1,
0.9246154, -1.465865, 3.415207, 0.8823529, 0, 1, 1,
0.9271308, 1.367628, -0.09262351, 0.8901961, 0, 1, 1,
0.931373, -0.8531793, 1.338141, 0.8941177, 0, 1, 1,
0.9428065, -0.6816833, 1.988465, 0.9019608, 0, 1, 1,
0.9431209, 0.51407, 1.444757, 0.9098039, 0, 1, 1,
0.9441437, 0.6402977, 0.988028, 0.9137255, 0, 1, 1,
0.9456263, 0.1287079, -1.070378, 0.9215686, 0, 1, 1,
0.9461189, -1.063198, 4.224349, 0.9254902, 0, 1, 1,
0.9472384, 0.6365622, 0.05994969, 0.9333333, 0, 1, 1,
0.9494232, -0.4451087, 1.957934, 0.9372549, 0, 1, 1,
0.9521999, 0.01347865, 0.02811683, 0.945098, 0, 1, 1,
0.9578941, -0.85044, 1.885788, 0.9490196, 0, 1, 1,
0.9641036, -0.2271428, 1.998506, 0.9568627, 0, 1, 1,
0.9643769, -1.203396, 2.41753, 0.9607843, 0, 1, 1,
0.9657864, 2.188575, 1.23122, 0.9686275, 0, 1, 1,
0.9671936, -0.3495687, 1.141017, 0.972549, 0, 1, 1,
0.9828192, 0.3159834, 1.402274, 0.9803922, 0, 1, 1,
0.9829419, 1.459906, 2.034956, 0.9843137, 0, 1, 1,
0.9863735, -1.581057, 4.194508, 0.9921569, 0, 1, 1,
0.9889219, 1.124904, -1.378125, 0.9960784, 0, 1, 1,
0.9897981, -0.04114232, -0.3878248, 1, 0, 0.9960784, 1,
0.9902887, -0.8593832, 2.3438, 1, 0, 0.9882353, 1,
0.9903036, -0.09928674, 3.566847, 1, 0, 0.9843137, 1,
0.9950927, 0.3498164, 0.7946377, 1, 0, 0.9764706, 1,
0.9993545, -0.8438848, 2.857317, 1, 0, 0.972549, 1,
1.003476, -0.04808046, 2.592821, 1, 0, 0.9647059, 1,
1.006001, -2.034565, 2.380085, 1, 0, 0.9607843, 1,
1.021458, -0.6615614, 0.4725312, 1, 0, 0.9529412, 1,
1.02463, -0.02193411, 1.710887, 1, 0, 0.9490196, 1,
1.026555, -1.411711, 1.161206, 1, 0, 0.9411765, 1,
1.027634, 1.427732, -0.8291693, 1, 0, 0.9372549, 1,
1.036366, -0.9672539, 1.303411, 1, 0, 0.9294118, 1,
1.037792, -0.2560092, 1.132345, 1, 0, 0.9254902, 1,
1.050674, 0.05293493, 1.001294, 1, 0, 0.9176471, 1,
1.05231, -0.2567129, 2.767915, 1, 0, 0.9137255, 1,
1.061399, -1.662453, 1.677222, 1, 0, 0.9058824, 1,
1.062183, 0.3289633, 1.965637, 1, 0, 0.9019608, 1,
1.063503, 2.119839, -0.8655505, 1, 0, 0.8941177, 1,
1.069854, 2.081431, 0.2615792, 1, 0, 0.8862745, 1,
1.071458, 0.2194016, -0.1798122, 1, 0, 0.8823529, 1,
1.073377, -0.1710301, 0.8926659, 1, 0, 0.8745098, 1,
1.073855, 0.5107658, 2.682374, 1, 0, 0.8705882, 1,
1.077007, 0.9491634, 1.60625, 1, 0, 0.8627451, 1,
1.078991, -1.234305, 2.199766, 1, 0, 0.8588235, 1,
1.084731, 0.1398105, 0.9632446, 1, 0, 0.8509804, 1,
1.092419, -0.8585827, 2.028308, 1, 0, 0.8470588, 1,
1.099183, 0.08938184, 2.028119, 1, 0, 0.8392157, 1,
1.105355, 0.1392899, 1.670537, 1, 0, 0.8352941, 1,
1.114969, 0.03629201, 0.7742408, 1, 0, 0.827451, 1,
1.132074, -1.496129, 3.931148, 1, 0, 0.8235294, 1,
1.133484, 1.130328, 0.7004107, 1, 0, 0.8156863, 1,
1.135004, 2.322348, 1.396817, 1, 0, 0.8117647, 1,
1.139195, -0.6080666, 3.001296, 1, 0, 0.8039216, 1,
1.147366, -1.005441, 0.8141863, 1, 0, 0.7960784, 1,
1.149685, -0.172211, 2.107021, 1, 0, 0.7921569, 1,
1.152327, -0.9732271, 3.184043, 1, 0, 0.7843137, 1,
1.157365, -0.8640191, 2.055914, 1, 0, 0.7803922, 1,
1.165914, 1.508387, 1.09873, 1, 0, 0.772549, 1,
1.169904, 1.639862, 0.1495408, 1, 0, 0.7686275, 1,
1.171973, -0.2939294, 1.978939, 1, 0, 0.7607843, 1,
1.173031, 1.251373, -0.266235, 1, 0, 0.7568628, 1,
1.178725, 2.098436, 0.8592222, 1, 0, 0.7490196, 1,
1.192171, -0.9807903, 3.014663, 1, 0, 0.7450981, 1,
1.194628, -1.332796, 0.8564965, 1, 0, 0.7372549, 1,
1.202652, -2.052733, 1.377733, 1, 0, 0.7333333, 1,
1.202834, -0.03034021, 2.511702, 1, 0, 0.7254902, 1,
1.211993, 0.01991594, 1.324925, 1, 0, 0.7215686, 1,
1.251692, 1.32489, 2.272514, 1, 0, 0.7137255, 1,
1.275904, -2.4322, 1.95205, 1, 0, 0.7098039, 1,
1.277247, 1.096879, -1.542331, 1, 0, 0.7019608, 1,
1.285585, 0.3236494, 1.505294, 1, 0, 0.6941177, 1,
1.294382, -0.558301, 2.040991, 1, 0, 0.6901961, 1,
1.301633, 0.5784304, 2.034762, 1, 0, 0.682353, 1,
1.305826, -1.735905, 5.264304, 1, 0, 0.6784314, 1,
1.306206, -0.8613529, 1.464214, 1, 0, 0.6705883, 1,
1.306816, -0.6271381, 3.231639, 1, 0, 0.6666667, 1,
1.320179, 1.644849, 0.6253976, 1, 0, 0.6588235, 1,
1.32361, 1.19073, 0.7702422, 1, 0, 0.654902, 1,
1.347501, 0.5351539, 0.6210838, 1, 0, 0.6470588, 1,
1.377039, -0.7858889, -0.255237, 1, 0, 0.6431373, 1,
1.379288, 0.6310358, 1.797192, 1, 0, 0.6352941, 1,
1.381147, 0.472738, 0.8572232, 1, 0, 0.6313726, 1,
1.396763, 0.3339539, 0.8793331, 1, 0, 0.6235294, 1,
1.400259, -1.211188, 4.000839, 1, 0, 0.6196079, 1,
1.403181, 0.7408106, 1.012311, 1, 0, 0.6117647, 1,
1.409953, 0.9036205, 1.417986, 1, 0, 0.6078432, 1,
1.414074, 0.4701504, 0.9363378, 1, 0, 0.6, 1,
1.417069, -2.260786, 3.525888, 1, 0, 0.5921569, 1,
1.422659, -0.2248887, 1.623889, 1, 0, 0.5882353, 1,
1.425792, -0.585677, 1.012637, 1, 0, 0.5803922, 1,
1.430893, -0.4120446, 1.975916, 1, 0, 0.5764706, 1,
1.450196, -0.3830967, 1.240787, 1, 0, 0.5686275, 1,
1.452241, 0.3758017, 1.536475, 1, 0, 0.5647059, 1,
1.454358, -0.1231261, 2.355816, 1, 0, 0.5568628, 1,
1.464869, 0.03920924, 2.356997, 1, 0, 0.5529412, 1,
1.470664, 0.1619687, 1.768044, 1, 0, 0.5450981, 1,
1.473271, 1.298155, 0.6033816, 1, 0, 0.5411765, 1,
1.474358, 0.08601864, -0.9051673, 1, 0, 0.5333334, 1,
1.477707, 0.7530156, 1.320822, 1, 0, 0.5294118, 1,
1.48423, 0.235697, 3.694039, 1, 0, 0.5215687, 1,
1.486982, -1.704507, -0.08385836, 1, 0, 0.5176471, 1,
1.487256, 1.518303, 1.229475, 1, 0, 0.509804, 1,
1.496316, 0.1773765, 1.70858, 1, 0, 0.5058824, 1,
1.511201, 0.266813, 0.4191478, 1, 0, 0.4980392, 1,
1.51186, -0.8442691, 1.807075, 1, 0, 0.4901961, 1,
1.515505, 0.2372209, 1.854408, 1, 0, 0.4862745, 1,
1.522807, 1.414073, 1.845602, 1, 0, 0.4784314, 1,
1.523086, -0.2401128, 2.626196, 1, 0, 0.4745098, 1,
1.535109, -0.5208462, 2.023845, 1, 0, 0.4666667, 1,
1.547392, -0.7162667, 1.312322, 1, 0, 0.4627451, 1,
1.560686, 1.996675, -0.1866681, 1, 0, 0.454902, 1,
1.571749, -0.5852762, 2.047398, 1, 0, 0.4509804, 1,
1.57663, -1.029749, -0.6173106, 1, 0, 0.4431373, 1,
1.583017, 0.06022006, 1.578811, 1, 0, 0.4392157, 1,
1.59194, 0.4627768, 1.67878, 1, 0, 0.4313726, 1,
1.594006, 0.1309357, 0.7917235, 1, 0, 0.427451, 1,
1.595922, 0.09938738, 1.641302, 1, 0, 0.4196078, 1,
1.649038, 0.2252152, 1.767144, 1, 0, 0.4156863, 1,
1.649983, 0.4476917, 0.9450878, 1, 0, 0.4078431, 1,
1.656169, 0.6578305, 1.008667, 1, 0, 0.4039216, 1,
1.664793, 0.1610023, 0.1376976, 1, 0, 0.3960784, 1,
1.666666, 1.045879, -0.3599465, 1, 0, 0.3882353, 1,
1.66829, -0.7273598, 1.371033, 1, 0, 0.3843137, 1,
1.697437, 0.7874279, 2.342891, 1, 0, 0.3764706, 1,
1.698493, 0.478994, 0.9313924, 1, 0, 0.372549, 1,
1.700228, -0.1236459, 2.836826, 1, 0, 0.3647059, 1,
1.701215, 0.355211, 1.533391, 1, 0, 0.3607843, 1,
1.705544, -1.230184, 2.454229, 1, 0, 0.3529412, 1,
1.705896, -0.5162234, 2.217797, 1, 0, 0.3490196, 1,
1.709864, 0.5569242, 1.453257, 1, 0, 0.3411765, 1,
1.731754, -0.3043751, 3.244346, 1, 0, 0.3372549, 1,
1.737841, 1.174189, 2.768102, 1, 0, 0.3294118, 1,
1.740237, 2.528231, 0.9656546, 1, 0, 0.3254902, 1,
1.751997, 0.601031, 0.04925904, 1, 0, 0.3176471, 1,
1.754775, -0.03001812, 2.289213, 1, 0, 0.3137255, 1,
1.756153, -0.3425596, 1.647358, 1, 0, 0.3058824, 1,
1.762537, 0.9191191, 0.2180252, 1, 0, 0.2980392, 1,
1.772071, -3.855904, 3.558872, 1, 0, 0.2941177, 1,
1.784041, 0.5757489, 1.237651, 1, 0, 0.2862745, 1,
1.786233, -0.7498235, 2.520693, 1, 0, 0.282353, 1,
1.786833, -0.3171138, 0.8157861, 1, 0, 0.2745098, 1,
1.791292, -1.093048, 1.559696, 1, 0, 0.2705882, 1,
1.825673, 0.8622859, 2.693036, 1, 0, 0.2627451, 1,
1.885373, -0.1977728, 2.17957, 1, 0, 0.2588235, 1,
1.899253, -0.1831094, 1.667266, 1, 0, 0.2509804, 1,
1.900337, 0.05497411, 2.022341, 1, 0, 0.2470588, 1,
1.90515, 1.072654, 0.3153608, 1, 0, 0.2392157, 1,
1.908098, 0.2234211, 1.343127, 1, 0, 0.2352941, 1,
1.91538, -0.7652558, 0.5105275, 1, 0, 0.227451, 1,
1.921036, 1.423567, 1.279142, 1, 0, 0.2235294, 1,
1.945431, -0.2289792, 2.926473, 1, 0, 0.2156863, 1,
1.971305, 0.4968864, 3.050851, 1, 0, 0.2117647, 1,
1.980608, -1.31878, 2.623382, 1, 0, 0.2039216, 1,
1.982832, -1.167328, 1.247487, 1, 0, 0.1960784, 1,
1.992037, 1.391054, -0.2292865, 1, 0, 0.1921569, 1,
2.012207, 0.6362901, 0.2180521, 1, 0, 0.1843137, 1,
2.013116, 1.194831, 2.109157, 1, 0, 0.1803922, 1,
2.013235, 0.3998789, 0.7905869, 1, 0, 0.172549, 1,
2.022058, 0.0949954, 0.7065485, 1, 0, 0.1686275, 1,
2.039091, -0.06017964, 3.799134, 1, 0, 0.1607843, 1,
2.04509, 3.040429, 0.3358978, 1, 0, 0.1568628, 1,
2.076012, 0.50218, 1.765256, 1, 0, 0.1490196, 1,
2.105955, 0.1793551, -0.49091, 1, 0, 0.145098, 1,
2.118349, 0.2029072, 2.193775, 1, 0, 0.1372549, 1,
2.124055, 0.6214646, 2.674335, 1, 0, 0.1333333, 1,
2.137933, 0.7989815, 1.318287, 1, 0, 0.1254902, 1,
2.1681, 1.009122, 1.557334, 1, 0, 0.1215686, 1,
2.177738, -0.7495811, 2.228241, 1, 0, 0.1137255, 1,
2.198231, 0.9424167, 2.273378, 1, 0, 0.1098039, 1,
2.235346, 1.616807, 0.8518217, 1, 0, 0.1019608, 1,
2.237344, 0.6404651, -0.5368538, 1, 0, 0.09411765, 1,
2.259009, 1.759586, 1.059978, 1, 0, 0.09019608, 1,
2.272351, 0.3046394, 3.119721, 1, 0, 0.08235294, 1,
2.294291, 1.071944, -0.1128745, 1, 0, 0.07843138, 1,
2.304765, -0.6335106, 1.644235, 1, 0, 0.07058824, 1,
2.313466, 0.1809117, 1.387857, 1, 0, 0.06666667, 1,
2.32127, 0.001150688, 3.996942, 1, 0, 0.05882353, 1,
2.327806, 0.008494446, 1.511072, 1, 0, 0.05490196, 1,
2.332304, 0.5483261, 3.115913, 1, 0, 0.04705882, 1,
2.445473, -0.8274244, 0.4277658, 1, 0, 0.04313726, 1,
2.448403, -3.244498, 4.349915, 1, 0, 0.03529412, 1,
2.540104, 0.5553313, 0.3040524, 1, 0, 0.03137255, 1,
2.75386, 0.3996753, 1.495905, 1, 0, 0.02352941, 1,
2.895269, -0.8755608, 1.842659, 1, 0, 0.01960784, 1,
3.017823, 0.3830533, 0.6896566, 1, 0, 0.01176471, 1,
3.338387, -1.116812, 2.363327, 1, 0, 0.007843138, 1
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
0.1229413, -5.043608, -7.015232, 0, -0.5, 0.5, 0.5,
0.1229413, -5.043608, -7.015232, 1, -0.5, 0.5, 0.5,
0.1229413, -5.043608, -7.015232, 1, 1.5, 0.5, 0.5,
0.1229413, -5.043608, -7.015232, 0, 1.5, 0.5, 0.5
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
-4.182541, -0.3523537, -7.015232, 0, -0.5, 0.5, 0.5,
-4.182541, -0.3523537, -7.015232, 1, -0.5, 0.5, 0.5,
-4.182541, -0.3523537, -7.015232, 1, 1.5, 0.5, 0.5,
-4.182541, -0.3523537, -7.015232, 0, 1.5, 0.5, 0.5
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
-4.182541, -5.043608, 0.2779832, 0, -0.5, 0.5, 0.5,
-4.182541, -5.043608, 0.2779832, 1, -0.5, 0.5, 0.5,
-4.182541, -5.043608, 0.2779832, 1, 1.5, 0.5, 0.5,
-4.182541, -5.043608, 0.2779832, 0, 1.5, 0.5, 0.5
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
-3, -3.961011, -5.332182,
3, -3.961011, -5.332182,
-3, -3.961011, -5.332182,
-3, -4.141443, -5.61269,
-2, -3.961011, -5.332182,
-2, -4.141443, -5.61269,
-1, -3.961011, -5.332182,
-1, -4.141443, -5.61269,
0, -3.961011, -5.332182,
0, -4.141443, -5.61269,
1, -3.961011, -5.332182,
1, -4.141443, -5.61269,
2, -3.961011, -5.332182,
2, -4.141443, -5.61269,
3, -3.961011, -5.332182,
3, -4.141443, -5.61269
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
-3, -4.502309, -6.173707, 0, -0.5, 0.5, 0.5,
-3, -4.502309, -6.173707, 1, -0.5, 0.5, 0.5,
-3, -4.502309, -6.173707, 1, 1.5, 0.5, 0.5,
-3, -4.502309, -6.173707, 0, 1.5, 0.5, 0.5,
-2, -4.502309, -6.173707, 0, -0.5, 0.5, 0.5,
-2, -4.502309, -6.173707, 1, -0.5, 0.5, 0.5,
-2, -4.502309, -6.173707, 1, 1.5, 0.5, 0.5,
-2, -4.502309, -6.173707, 0, 1.5, 0.5, 0.5,
-1, -4.502309, -6.173707, 0, -0.5, 0.5, 0.5,
-1, -4.502309, -6.173707, 1, -0.5, 0.5, 0.5,
-1, -4.502309, -6.173707, 1, 1.5, 0.5, 0.5,
-1, -4.502309, -6.173707, 0, 1.5, 0.5, 0.5,
0, -4.502309, -6.173707, 0, -0.5, 0.5, 0.5,
0, -4.502309, -6.173707, 1, -0.5, 0.5, 0.5,
0, -4.502309, -6.173707, 1, 1.5, 0.5, 0.5,
0, -4.502309, -6.173707, 0, 1.5, 0.5, 0.5,
1, -4.502309, -6.173707, 0, -0.5, 0.5, 0.5,
1, -4.502309, -6.173707, 1, -0.5, 0.5, 0.5,
1, -4.502309, -6.173707, 1, 1.5, 0.5, 0.5,
1, -4.502309, -6.173707, 0, 1.5, 0.5, 0.5,
2, -4.502309, -6.173707, 0, -0.5, 0.5, 0.5,
2, -4.502309, -6.173707, 1, -0.5, 0.5, 0.5,
2, -4.502309, -6.173707, 1, 1.5, 0.5, 0.5,
2, -4.502309, -6.173707, 0, 1.5, 0.5, 0.5,
3, -4.502309, -6.173707, 0, -0.5, 0.5, 0.5,
3, -4.502309, -6.173707, 1, -0.5, 0.5, 0.5,
3, -4.502309, -6.173707, 1, 1.5, 0.5, 0.5,
3, -4.502309, -6.173707, 0, 1.5, 0.5, 0.5
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
-3.188968, -2, -5.332182,
-3.188968, 2, -5.332182,
-3.188968, -2, -5.332182,
-3.354564, -2, -5.61269,
-3.188968, 0, -5.332182,
-3.354564, 0, -5.61269,
-3.188968, 2, -5.332182,
-3.354564, 2, -5.61269
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
-3.685755, -2, -6.173707, 0, -0.5, 0.5, 0.5,
-3.685755, -2, -6.173707, 1, -0.5, 0.5, 0.5,
-3.685755, -2, -6.173707, 1, 1.5, 0.5, 0.5,
-3.685755, -2, -6.173707, 0, 1.5, 0.5, 0.5,
-3.685755, 0, -6.173707, 0, -0.5, 0.5, 0.5,
-3.685755, 0, -6.173707, 1, -0.5, 0.5, 0.5,
-3.685755, 0, -6.173707, 1, 1.5, 0.5, 0.5,
-3.685755, 0, -6.173707, 0, 1.5, 0.5, 0.5,
-3.685755, 2, -6.173707, 0, -0.5, 0.5, 0.5,
-3.685755, 2, -6.173707, 1, -0.5, 0.5, 0.5,
-3.685755, 2, -6.173707, 1, 1.5, 0.5, 0.5,
-3.685755, 2, -6.173707, 0, 1.5, 0.5, 0.5
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
-3.188968, -3.961011, -4,
-3.188968, -3.961011, 4,
-3.188968, -3.961011, -4,
-3.354564, -4.141443, -4,
-3.188968, -3.961011, -2,
-3.354564, -4.141443, -2,
-3.188968, -3.961011, 0,
-3.354564, -4.141443, 0,
-3.188968, -3.961011, 2,
-3.354564, -4.141443, 2,
-3.188968, -3.961011, 4,
-3.354564, -4.141443, 4
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
-3.685755, -4.502309, -4, 0, -0.5, 0.5, 0.5,
-3.685755, -4.502309, -4, 1, -0.5, 0.5, 0.5,
-3.685755, -4.502309, -4, 1, 1.5, 0.5, 0.5,
-3.685755, -4.502309, -4, 0, 1.5, 0.5, 0.5,
-3.685755, -4.502309, -2, 0, -0.5, 0.5, 0.5,
-3.685755, -4.502309, -2, 1, -0.5, 0.5, 0.5,
-3.685755, -4.502309, -2, 1, 1.5, 0.5, 0.5,
-3.685755, -4.502309, -2, 0, 1.5, 0.5, 0.5,
-3.685755, -4.502309, 0, 0, -0.5, 0.5, 0.5,
-3.685755, -4.502309, 0, 1, -0.5, 0.5, 0.5,
-3.685755, -4.502309, 0, 1, 1.5, 0.5, 0.5,
-3.685755, -4.502309, 0, 0, 1.5, 0.5, 0.5,
-3.685755, -4.502309, 2, 0, -0.5, 0.5, 0.5,
-3.685755, -4.502309, 2, 1, -0.5, 0.5, 0.5,
-3.685755, -4.502309, 2, 1, 1.5, 0.5, 0.5,
-3.685755, -4.502309, 2, 0, 1.5, 0.5, 0.5,
-3.685755, -4.502309, 4, 0, -0.5, 0.5, 0.5,
-3.685755, -4.502309, 4, 1, -0.5, 0.5, 0.5,
-3.685755, -4.502309, 4, 1, 1.5, 0.5, 0.5,
-3.685755, -4.502309, 4, 0, 1.5, 0.5, 0.5
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
-3.188968, -3.961011, -5.332182,
-3.188968, 3.256303, -5.332182,
-3.188968, -3.961011, 5.888149,
-3.188968, 3.256303, 5.888149,
-3.188968, -3.961011, -5.332182,
-3.188968, -3.961011, 5.888149,
-3.188968, 3.256303, -5.332182,
-3.188968, 3.256303, 5.888149,
-3.188968, -3.961011, -5.332182,
3.434851, -3.961011, -5.332182,
-3.188968, -3.961011, 5.888149,
3.434851, -3.961011, 5.888149,
-3.188968, 3.256303, -5.332182,
3.434851, 3.256303, -5.332182,
-3.188968, 3.256303, 5.888149,
3.434851, 3.256303, 5.888149,
3.434851, -3.961011, -5.332182,
3.434851, 3.256303, -5.332182,
3.434851, -3.961011, 5.888149,
3.434851, 3.256303, 5.888149,
3.434851, -3.961011, -5.332182,
3.434851, -3.961011, 5.888149,
3.434851, 3.256303, -5.332182,
3.434851, 3.256303, 5.888149
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
var radius = 7.95363;
var distance = 35.3866;
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
mvMatrix.translate( -0.1229413, 0.3523537, -0.2779832 );
mvMatrix.scale( 1.298287, 1.191527, 0.766432 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.3866);
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
terallethrin<-read.table("terallethrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-terallethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'terallethrin' not found
```

```r
y<-terallethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'terallethrin' not found
```

```r
z<-terallethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'terallethrin' not found
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
-3.092505, 0.7020622, -0.005974182, 0, 0, 1, 1, 1,
-2.918307, -0.7744364, -3.567373, 1, 0, 0, 1, 1,
-2.825408, -0.1368989, -4.627213, 1, 0, 0, 1, 1,
-2.724223, -1.20296, -0.7910736, 1, 0, 0, 1, 1,
-2.604729, -0.237534, -0.6699094, 1, 0, 0, 1, 1,
-2.570799, 0.2929794, -2.282436, 1, 0, 0, 1, 1,
-2.513447, -2.758595, -3.167863, 0, 0, 0, 1, 1,
-2.506388, -0.496242, -2.083701, 0, 0, 0, 1, 1,
-2.48595, -1.676604, -2.513319, 0, 0, 0, 1, 1,
-2.474231, 0.1111476, -1.545189, 0, 0, 0, 1, 1,
-2.474131, -0.54822, -1.88683, 0, 0, 0, 1, 1,
-2.442522, -1.542135, -1.451055, 0, 0, 0, 1, 1,
-2.426192, 0.385799, -1.103171, 0, 0, 0, 1, 1,
-2.403105, 0.5038798, -1.761759, 1, 1, 1, 1, 1,
-2.398163, 1.291352, -2.649415, 1, 1, 1, 1, 1,
-2.393736, 0.8347532, -1.99594, 1, 1, 1, 1, 1,
-2.376512, -0.312538, -4.096658, 1, 1, 1, 1, 1,
-2.350213, 0.04751142, -1.484144, 1, 1, 1, 1, 1,
-2.348606, 0.5424036, -1.893823, 1, 1, 1, 1, 1,
-2.332206, 0.01178965, -2.191603, 1, 1, 1, 1, 1,
-2.325333, -0.7386598, -2.362003, 1, 1, 1, 1, 1,
-2.252605, 0.504154, -1.311999, 1, 1, 1, 1, 1,
-2.242719, 1.575336, 0.1529513, 1, 1, 1, 1, 1,
-2.232387, -0.5045307, -2.190922, 1, 1, 1, 1, 1,
-2.232112, -0.2461156, -2.227564, 1, 1, 1, 1, 1,
-2.207618, 0.1323823, -1.841628, 1, 1, 1, 1, 1,
-2.168922, -1.577431, -2.386044, 1, 1, 1, 1, 1,
-2.159939, 1.195269, -1.266497, 1, 1, 1, 1, 1,
-2.151215, 0.4382586, -0.4235986, 0, 0, 1, 1, 1,
-2.110843, -0.3012179, -2.551907, 1, 0, 0, 1, 1,
-2.101417, 1.155874, 0.8945413, 1, 0, 0, 1, 1,
-2.050337, -0.9128623, -2.309114, 1, 0, 0, 1, 1,
-2.023998, 0.3570525, -2.245384, 1, 0, 0, 1, 1,
-1.968012, 0.3143989, -1.572677, 1, 0, 0, 1, 1,
-1.959109, -0.8616154, -3.771474, 0, 0, 0, 1, 1,
-1.958168, 0.5297551, -1.918672, 0, 0, 0, 1, 1,
-1.952386, 1.066902, -1.588336, 0, 0, 0, 1, 1,
-1.921001, 2.205011, 1.185327, 0, 0, 0, 1, 1,
-1.873141, -0.03830051, -1.62927, 0, 0, 0, 1, 1,
-1.872149, -1.910892, -1.453256, 0, 0, 0, 1, 1,
-1.865139, 1.145334, -0.5762142, 0, 0, 0, 1, 1,
-1.822595, -1.680901, -0.4803831, 1, 1, 1, 1, 1,
-1.811846, -0.1679948, -1.540902, 1, 1, 1, 1, 1,
-1.803223, 1.073395, -1.377091, 1, 1, 1, 1, 1,
-1.782022, 0.3006262, -1.769014, 1, 1, 1, 1, 1,
-1.774517, -0.7489169, 0.7411941, 1, 1, 1, 1, 1,
-1.77318, 0.9750085, -2.237934, 1, 1, 1, 1, 1,
-1.765151, -0.5123789, -1.865261, 1, 1, 1, 1, 1,
-1.762476, 0.8328403, -0.5140203, 1, 1, 1, 1, 1,
-1.759652, -0.7372949, -1.67453, 1, 1, 1, 1, 1,
-1.739723, 0.08439283, -2.359575, 1, 1, 1, 1, 1,
-1.735716, -1.211592, -2.526267, 1, 1, 1, 1, 1,
-1.729761, 1.695858, -1.615094, 1, 1, 1, 1, 1,
-1.69312, -0.3715694, -1.366497, 1, 1, 1, 1, 1,
-1.671488, 0.7540602, -1.571324, 1, 1, 1, 1, 1,
-1.656361, 0.7479029, -1.017428, 1, 1, 1, 1, 1,
-1.653052, -1.422376, -1.923599, 0, 0, 1, 1, 1,
-1.651902, 0.748863, -0.6070512, 1, 0, 0, 1, 1,
-1.644346, 0.4792297, -0.6313951, 1, 0, 0, 1, 1,
-1.639078, 0.8173456, -1.807768, 1, 0, 0, 1, 1,
-1.619985, 1.095156, -1.336862, 1, 0, 0, 1, 1,
-1.615571, -0.4381478, -2.284905, 1, 0, 0, 1, 1,
-1.615028, -0.7689853, -2.612387, 0, 0, 0, 1, 1,
-1.593217, 0.362204, -2.466105, 0, 0, 0, 1, 1,
-1.591987, 0.4574232, 0.7629267, 0, 0, 0, 1, 1,
-1.584654, -0.2249034, -0.408798, 0, 0, 0, 1, 1,
-1.577734, 0.5536574, -3.168926, 0, 0, 0, 1, 1,
-1.555386, 0.6504145, -1.191895, 0, 0, 0, 1, 1,
-1.544749, -0.4142855, -2.294899, 0, 0, 0, 1, 1,
-1.522274, -0.7528851, -1.894007, 1, 1, 1, 1, 1,
-1.522265, -1.184659, -1.993068, 1, 1, 1, 1, 1,
-1.504682, -0.3929807, -2.268212, 1, 1, 1, 1, 1,
-1.499596, 1.541535, -0.835257, 1, 1, 1, 1, 1,
-1.490477, 1.034525, -1.435371, 1, 1, 1, 1, 1,
-1.485475, -2.135152, -3.962854, 1, 1, 1, 1, 1,
-1.470725, 0.7340243, -1.695333, 1, 1, 1, 1, 1,
-1.464578, 2.104321, -1.958228, 1, 1, 1, 1, 1,
-1.461514, 0.9922341, -0.2317835, 1, 1, 1, 1, 1,
-1.45581, -0.1271446, -1.10789, 1, 1, 1, 1, 1,
-1.438855, 1.016067, -1.594767, 1, 1, 1, 1, 1,
-1.432295, 0.6947873, 0.4086339, 1, 1, 1, 1, 1,
-1.411089, -0.6238182, -1.379621, 1, 1, 1, 1, 1,
-1.40496, -1.875832, -3.969933, 1, 1, 1, 1, 1,
-1.402657, -0.1445658, -2.733334, 1, 1, 1, 1, 1,
-1.396, -0.2214639, -1.801419, 0, 0, 1, 1, 1,
-1.388562, 1.703253, -1.053885, 1, 0, 0, 1, 1,
-1.383093, 0.8686789, 0.3787352, 1, 0, 0, 1, 1,
-1.37804, 0.6861239, -1.515446, 1, 0, 0, 1, 1,
-1.376481, -1.252214, -1.762166, 1, 0, 0, 1, 1,
-1.37548, -0.8160855, -2.385733, 1, 0, 0, 1, 1,
-1.371489, -0.8258992, -2.920625, 0, 0, 0, 1, 1,
-1.366517, -0.8813013, -1.631012, 0, 0, 0, 1, 1,
-1.365468, 0.1451719, -1.147325, 0, 0, 0, 1, 1,
-1.363212, -0.2122279, -1.638791, 0, 0, 0, 1, 1,
-1.349737, 0.7433695, -1.778649, 0, 0, 0, 1, 1,
-1.333706, -0.4149846, -0.2500501, 0, 0, 0, 1, 1,
-1.331735, -0.4236831, -2.786541, 0, 0, 0, 1, 1,
-1.329266, -0.2633438, -1.165512, 1, 1, 1, 1, 1,
-1.326632, -0.04752105, 0.1105579, 1, 1, 1, 1, 1,
-1.325289, 0.1873683, -2.016325, 1, 1, 1, 1, 1,
-1.309052, -0.5875247, -1.289539, 1, 1, 1, 1, 1,
-1.297019, -1.440534, -2.820817, 1, 1, 1, 1, 1,
-1.280907, -0.01816482, -2.554171, 1, 1, 1, 1, 1,
-1.276066, -0.9847606, -2.502929, 1, 1, 1, 1, 1,
-1.271809, 0.3134291, -3.19417, 1, 1, 1, 1, 1,
-1.26534, 1.066868, -2.224689, 1, 1, 1, 1, 1,
-1.262298, 0.4425969, -0.4183973, 1, 1, 1, 1, 1,
-1.259733, -0.03194504, -1.396601, 1, 1, 1, 1, 1,
-1.254873, -0.344375, -2.801401, 1, 1, 1, 1, 1,
-1.249815, 0.3835261, 0.8136585, 1, 1, 1, 1, 1,
-1.24454, -1.383245, -1.703451, 1, 1, 1, 1, 1,
-1.244474, -0.9571024, -3.101811, 1, 1, 1, 1, 1,
-1.236813, 1.167755, -1.290339, 0, 0, 1, 1, 1,
-1.2206, -0.8489981, -2.749421, 1, 0, 0, 1, 1,
-1.218813, -0.1549077, -1.426965, 1, 0, 0, 1, 1,
-1.206719, -0.6559346, -2.539984, 1, 0, 0, 1, 1,
-1.205706, -0.3796582, -1.628822, 1, 0, 0, 1, 1,
-1.204495, -1.032801, -2.248202, 1, 0, 0, 1, 1,
-1.198479, 0.8087904, -0.9695873, 0, 0, 0, 1, 1,
-1.185871, -0.3837425, -0.4003392, 0, 0, 0, 1, 1,
-1.185563, -2.200398, -3.953519, 0, 0, 0, 1, 1,
-1.182503, 0.7767405, -1.336363, 0, 0, 0, 1, 1,
-1.182046, 0.565284, 1.047282, 0, 0, 0, 1, 1,
-1.167807, 0.7533771, -2.040748, 0, 0, 0, 1, 1,
-1.164513, -0.4515006, -2.204819, 0, 0, 0, 1, 1,
-1.163933, -2.308284, -3.557619, 1, 1, 1, 1, 1,
-1.155133, -0.8831528, -2.525004, 1, 1, 1, 1, 1,
-1.147936, -0.199977, -2.413245, 1, 1, 1, 1, 1,
-1.142684, 1.971903, -3.716661, 1, 1, 1, 1, 1,
-1.141578, 0.7200871, -0.9344988, 1, 1, 1, 1, 1,
-1.138875, -0.9347124, -2.088407, 1, 1, 1, 1, 1,
-1.132569, 0.9619754, -2.059464, 1, 1, 1, 1, 1,
-1.118613, 0.04631813, -3.110927, 1, 1, 1, 1, 1,
-1.11754, 0.5540419, -1.401101, 1, 1, 1, 1, 1,
-1.110769, 0.4080873, -2.591499, 1, 1, 1, 1, 1,
-1.106839, 0.372923, -0.8249946, 1, 1, 1, 1, 1,
-1.102085, 0.9781169, -1.654784, 1, 1, 1, 1, 1,
-1.100531, -0.3329039, -1.686811, 1, 1, 1, 1, 1,
-1.097937, 2.032803, 0.08794539, 1, 1, 1, 1, 1,
-1.095189, -1.260557, -1.856049, 1, 1, 1, 1, 1,
-1.083869, -0.06681576, -1.311481, 0, 0, 1, 1, 1,
-1.079616, 0.01080504, -1.592577, 1, 0, 0, 1, 1,
-1.079591, -1.174436, -2.319975, 1, 0, 0, 1, 1,
-1.077462, -1.85867, -3.757691, 1, 0, 0, 1, 1,
-1.071742, -0.07893446, 0.2328715, 1, 0, 0, 1, 1,
-1.070225, -0.6684425, -2.784769, 1, 0, 0, 1, 1,
-1.064974, 0.715546, -1.237013, 0, 0, 0, 1, 1,
-1.064265, -0.3324667, -0.1676605, 0, 0, 0, 1, 1,
-1.060437, -1.187585, -3.179306, 0, 0, 0, 1, 1,
-1.059457, 0.3206233, -2.128291, 0, 0, 0, 1, 1,
-1.051196, -0.3578542, -1.35313, 0, 0, 0, 1, 1,
-1.047192, -0.7989649, -2.646626, 0, 0, 0, 1, 1,
-1.044871, -0.5181714, -3.387927, 0, 0, 0, 1, 1,
-1.028006, -2.099501, -1.924626, 1, 1, 1, 1, 1,
-1.027254, 0.123976, -2.10322, 1, 1, 1, 1, 1,
-1.015554, -0.6787875, -1.680747, 1, 1, 1, 1, 1,
-1.010058, -1.106832, -2.305114, 1, 1, 1, 1, 1,
-0.9919469, 0.02575351, -1.684784, 1, 1, 1, 1, 1,
-0.9818984, -0.02696241, -0.6592693, 1, 1, 1, 1, 1,
-0.969646, 0.2816701, -1.154506, 1, 1, 1, 1, 1,
-0.9630603, 0.8569384, -2.21672, 1, 1, 1, 1, 1,
-0.9629419, 0.3523796, -0.5984479, 1, 1, 1, 1, 1,
-0.9603024, 1.388145, -2.162768, 1, 1, 1, 1, 1,
-0.9589481, 0.3620619, 0.02619985, 1, 1, 1, 1, 1,
-0.9575316, 0.9176354, 0.7631826, 1, 1, 1, 1, 1,
-0.9562955, 0.2108001, -1.797876, 1, 1, 1, 1, 1,
-0.951989, -0.4791649, -3.192454, 1, 1, 1, 1, 1,
-0.9501566, 0.469114, -2.345448, 1, 1, 1, 1, 1,
-0.946467, -0.4228106, -1.600249, 0, 0, 1, 1, 1,
-0.9396763, -0.8657855, -1.512942, 1, 0, 0, 1, 1,
-0.9327159, -0.3880833, -3.459968, 1, 0, 0, 1, 1,
-0.9243417, 1.175968, -0.7333117, 1, 0, 0, 1, 1,
-0.9233483, -0.3976706, -1.349406, 1, 0, 0, 1, 1,
-0.9210523, -1.045636, -4.295472, 1, 0, 0, 1, 1,
-0.9177626, 0.009073921, -1.157191, 0, 0, 0, 1, 1,
-0.9175174, 0.6390367, -0.9475215, 0, 0, 0, 1, 1,
-0.9037343, 0.6163667, 0.2102329, 0, 0, 0, 1, 1,
-0.9020185, 0.6470142, 0.2963644, 0, 0, 0, 1, 1,
-0.8910969, 0.2428634, -0.5811317, 0, 0, 0, 1, 1,
-0.8811821, 0.5014179, -1.054531, 0, 0, 0, 1, 1,
-0.8782243, -0.2416908, -0.4359939, 0, 0, 0, 1, 1,
-0.868122, -0.03894212, -1.224125, 1, 1, 1, 1, 1,
-0.8580238, 0.2458964, -1.676831, 1, 1, 1, 1, 1,
-0.8560027, 0.8124457, -0.2102107, 1, 1, 1, 1, 1,
-0.8516451, 0.1662444, -2.582145, 1, 1, 1, 1, 1,
-0.8470595, -0.7197942, -2.544558, 1, 1, 1, 1, 1,
-0.8455133, -0.7714003, 0.4850703, 1, 1, 1, 1, 1,
-0.8344584, -1.316367, -3.057413, 1, 1, 1, 1, 1,
-0.8319282, -0.361099, -3.505497, 1, 1, 1, 1, 1,
-0.8311163, 1.275362, 0.7885752, 1, 1, 1, 1, 1,
-0.8263832, -0.641537, -2.124563, 1, 1, 1, 1, 1,
-0.816958, -1.051204, -3.024292, 1, 1, 1, 1, 1,
-0.8159004, -0.6327838, -1.70108, 1, 1, 1, 1, 1,
-0.8088104, 1.147669, 0.8465052, 1, 1, 1, 1, 1,
-0.8084999, 1.013487, 0.7813684, 1, 1, 1, 1, 1,
-0.8049573, 1.381853, -1.370651, 1, 1, 1, 1, 1,
-0.8024517, 0.6742408, -1.705396, 0, 0, 1, 1, 1,
-0.8008751, 1.010363, 0.3824232, 1, 0, 0, 1, 1,
-0.7999663, 0.009660208, -2.30836, 1, 0, 0, 1, 1,
-0.7990293, 1.347667, -2.157334, 1, 0, 0, 1, 1,
-0.7982833, 1.519514, -1.053696, 1, 0, 0, 1, 1,
-0.7937806, 1.862453, -0.8497212, 1, 0, 0, 1, 1,
-0.7914496, 1.472117, -0.6141804, 0, 0, 0, 1, 1,
-0.7897152, -0.5689574, -3.014985, 0, 0, 0, 1, 1,
-0.7797375, 0.2296633, -2.033582, 0, 0, 0, 1, 1,
-0.7772898, 1.780122, 0.5911469, 0, 0, 0, 1, 1,
-0.7740094, 0.4483635, -0.7462605, 0, 0, 0, 1, 1,
-0.7712042, 1.46211, -0.5073494, 0, 0, 0, 1, 1,
-0.7703867, -0.4994455, -1.94184, 0, 0, 0, 1, 1,
-0.7694818, 0.5823663, 0.5085784, 1, 1, 1, 1, 1,
-0.7686953, 0.01887027, -0.7920321, 1, 1, 1, 1, 1,
-0.7679731, 1.407963, 0.1268476, 1, 1, 1, 1, 1,
-0.7621675, 0.183382, -0.8013696, 1, 1, 1, 1, 1,
-0.7585548, -0.1609969, -1.961396, 1, 1, 1, 1, 1,
-0.7585189, -1.626817, -1.820217, 1, 1, 1, 1, 1,
-0.7567121, 0.8355404, -0.2464992, 1, 1, 1, 1, 1,
-0.7518463, -0.5754083, -0.8557878, 1, 1, 1, 1, 1,
-0.7457612, -0.01174185, -1.188119, 1, 1, 1, 1, 1,
-0.7442648, -1.278382, -2.048079, 1, 1, 1, 1, 1,
-0.7403277, -0.01644368, -1.047608, 1, 1, 1, 1, 1,
-0.7268518, -1.723016, -3.745705, 1, 1, 1, 1, 1,
-0.7242183, 0.882855, 0.3928708, 1, 1, 1, 1, 1,
-0.7231899, 1.497287, -0.3404462, 1, 1, 1, 1, 1,
-0.7211511, 0.1721956, -0.2544961, 1, 1, 1, 1, 1,
-0.7172521, -0.009416657, -3.083412, 0, 0, 1, 1, 1,
-0.7117144, -0.7646585, -0.8225261, 1, 0, 0, 1, 1,
-0.7097797, 0.7955305, -0.7473167, 1, 0, 0, 1, 1,
-0.7067674, -0.01020833, -0.2457155, 1, 0, 0, 1, 1,
-0.7034979, 0.7309693, -0.7943833, 1, 0, 0, 1, 1,
-0.7019291, -0.2704143, -1.749435, 1, 0, 0, 1, 1,
-0.6925737, -2.555072, -4.031483, 0, 0, 0, 1, 1,
-0.6915922, 1.317447, -0.6416942, 0, 0, 0, 1, 1,
-0.6914319, -0.12543, -3.255406, 0, 0, 0, 1, 1,
-0.6903145, 0.4310524, -1.910502, 0, 0, 0, 1, 1,
-0.6876115, 0.9372248, 0.2738382, 0, 0, 0, 1, 1,
-0.6872095, 0.6943756, 1.063625, 0, 0, 0, 1, 1,
-0.6862995, 0.9213112, -0.09304679, 0, 0, 0, 1, 1,
-0.6716005, -0.8651147, -1.336378, 1, 1, 1, 1, 1,
-0.6699817, -0.06927408, -2.051812, 1, 1, 1, 1, 1,
-0.6664318, 0.03903684, -2.251142, 1, 1, 1, 1, 1,
-0.6635519, 0.7160866, 0.3352549, 1, 1, 1, 1, 1,
-0.6630388, 0.7802417, 1.016321, 1, 1, 1, 1, 1,
-0.6568884, 1.352732, -0.4572374, 1, 1, 1, 1, 1,
-0.6531737, -1.82562, -3.440648, 1, 1, 1, 1, 1,
-0.649715, 0.4899485, -1.84723, 1, 1, 1, 1, 1,
-0.6450142, -1.115612, -2.602988, 1, 1, 1, 1, 1,
-0.6432588, -1.765075, -3.274498, 1, 1, 1, 1, 1,
-0.6398748, 2.332924, -0.7046783, 1, 1, 1, 1, 1,
-0.6395711, 0.8917342, -0.7375562, 1, 1, 1, 1, 1,
-0.6394856, 0.3268903, -0.4473614, 1, 1, 1, 1, 1,
-0.6388521, -0.01027364, -0.4734124, 1, 1, 1, 1, 1,
-0.636054, -0.9888935, -1.920786, 1, 1, 1, 1, 1,
-0.6329806, -0.47629, -3.246279, 0, 0, 1, 1, 1,
-0.6262566, -0.3125704, -3.32295, 1, 0, 0, 1, 1,
-0.6162816, 0.877578, -2.103563, 1, 0, 0, 1, 1,
-0.6159074, 0.2098804, -1.289031, 1, 0, 0, 1, 1,
-0.6142554, 0.1545718, -0.9474065, 1, 0, 0, 1, 1,
-0.6129291, 0.005275258, -2.300714, 1, 0, 0, 1, 1,
-0.6077715, -0.2936176, -2.647382, 0, 0, 0, 1, 1,
-0.6075031, 0.7476901, 0.4180056, 0, 0, 0, 1, 1,
-0.6060691, 1.610831, -1.531194, 0, 0, 0, 1, 1,
-0.6042342, -0.1513914, -1.933328, 0, 0, 0, 1, 1,
-0.6007563, 0.8450624, 1.233828, 0, 0, 0, 1, 1,
-0.5974607, 0.4633134, -1.261375, 0, 0, 0, 1, 1,
-0.5968986, -1.555771, -4.222729, 0, 0, 0, 1, 1,
-0.5961221, -0.8167287, -3.000654, 1, 1, 1, 1, 1,
-0.5949025, 0.2626102, -1.498373, 1, 1, 1, 1, 1,
-0.5927765, -0.7152506, -2.299458, 1, 1, 1, 1, 1,
-0.585954, -0.5812414, -2.019697, 1, 1, 1, 1, 1,
-0.5846105, -0.07937888, -2.496918, 1, 1, 1, 1, 1,
-0.5824511, -1.148379, -2.957684, 1, 1, 1, 1, 1,
-0.5812342, 1.476012, -1.336686, 1, 1, 1, 1, 1,
-0.5727346, -1.287284, -1.878774, 1, 1, 1, 1, 1,
-0.5643351, 0.1071079, -0.2151004, 1, 1, 1, 1, 1,
-0.5630504, 0.4879171, -2.650775, 1, 1, 1, 1, 1,
-0.5546786, -1.757332, -1.891478, 1, 1, 1, 1, 1,
-0.5444428, -0.09325466, -0.9095917, 1, 1, 1, 1, 1,
-0.5417359, 0.3339565, -1.781329, 1, 1, 1, 1, 1,
-0.5406796, 1.075856, 0.658156, 1, 1, 1, 1, 1,
-0.5377488, 0.3047723, -1.916685, 1, 1, 1, 1, 1,
-0.533622, -0.4556302, -2.169857, 0, 0, 1, 1, 1,
-0.5225129, -2.125122, -3.060519, 1, 0, 0, 1, 1,
-0.5214109, 0.01199664, -1.652624, 1, 0, 0, 1, 1,
-0.5206597, 0.05166998, -2.133282, 1, 0, 0, 1, 1,
-0.5143796, 1.208055, -1.730413, 1, 0, 0, 1, 1,
-0.5140949, -0.8033608, -1.187439, 1, 0, 0, 1, 1,
-0.5136173, -0.962814, -1.724401, 0, 0, 0, 1, 1,
-0.5066903, 1.064033, -1.720846, 0, 0, 0, 1, 1,
-0.5012208, -1.395368, -1.215371, 0, 0, 0, 1, 1,
-0.4995944, -0.6798552, -1.699169, 0, 0, 0, 1, 1,
-0.4962272, -0.2236246, -1.762386, 0, 0, 0, 1, 1,
-0.4921566, -2.238541, -1.152847, 0, 0, 0, 1, 1,
-0.4914981, -2.158771, -0.9129197, 0, 0, 0, 1, 1,
-0.4912759, 1.657212, 0.8995706, 1, 1, 1, 1, 1,
-0.4846555, 0.06349323, -1.89975, 1, 1, 1, 1, 1,
-0.4835922, 1.132651, -1.186103, 1, 1, 1, 1, 1,
-0.4796607, 1.855024, 1.093296, 1, 1, 1, 1, 1,
-0.4752185, 0.9442924, -0.7936898, 1, 1, 1, 1, 1,
-0.4740935, -0.851194, -1.151803, 1, 1, 1, 1, 1,
-0.4740558, 0.7987759, 0.04263327, 1, 1, 1, 1, 1,
-0.4729193, 2.08944, -0.9708893, 1, 1, 1, 1, 1,
-0.468576, 0.3353768, -1.311976, 1, 1, 1, 1, 1,
-0.4630826, 1.047571, -0.05041459, 1, 1, 1, 1, 1,
-0.4630115, 0.6529421, -0.4781945, 1, 1, 1, 1, 1,
-0.4496738, 0.7009575, 0.8274858, 1, 1, 1, 1, 1,
-0.4446084, 0.6410309, -2.444021, 1, 1, 1, 1, 1,
-0.441547, -0.1972288, 0.5920668, 1, 1, 1, 1, 1,
-0.4394228, -0.04617152, -0.7161613, 1, 1, 1, 1, 1,
-0.4336642, -0.7221787, -2.905747, 0, 0, 1, 1, 1,
-0.4318435, -0.308173, -2.529891, 1, 0, 0, 1, 1,
-0.4309801, 0.7888736, -1.72984, 1, 0, 0, 1, 1,
-0.4266971, -0.3699909, -3.286306, 1, 0, 0, 1, 1,
-0.4233976, -0.1750786, -2.075254, 1, 0, 0, 1, 1,
-0.4218676, 0.3749, -0.05478632, 1, 0, 0, 1, 1,
-0.4214214, -0.5158684, -4.327974, 0, 0, 0, 1, 1,
-0.4202713, 0.4993114, 0.01343629, 0, 0, 0, 1, 1,
-0.4194946, 0.7423064, -0.8192571, 0, 0, 0, 1, 1,
-0.407463, -1.098772, -3.908018, 0, 0, 0, 1, 1,
-0.4008872, 1.042439, -0.74379, 0, 0, 0, 1, 1,
-0.4005629, 0.8738014, -1.551472, 0, 0, 0, 1, 1,
-0.4000628, -0.09489054, -4.317529, 0, 0, 0, 1, 1,
-0.3986095, 0.04373546, -0.9777721, 1, 1, 1, 1, 1,
-0.3919042, -2.480889, -5.168779, 1, 1, 1, 1, 1,
-0.3893505, 0.2533993, -0.640286, 1, 1, 1, 1, 1,
-0.3876338, -1.212616, -3.779375, 1, 1, 1, 1, 1,
-0.38762, -0.6963358, -1.307403, 1, 1, 1, 1, 1,
-0.3844094, 0.1552982, -1.766451, 1, 1, 1, 1, 1,
-0.3821921, -0.2438273, -1.720065, 1, 1, 1, 1, 1,
-0.3754743, 0.502314, -1.535132, 1, 1, 1, 1, 1,
-0.3741122, 0.09895325, -1.457338, 1, 1, 1, 1, 1,
-0.3733864, 0.5497478, 0.193993, 1, 1, 1, 1, 1,
-0.370493, -0.8953984, -3.493, 1, 1, 1, 1, 1,
-0.3701348, -0.558287, -1.465023, 1, 1, 1, 1, 1,
-0.3696514, -0.02574175, -3.289179, 1, 1, 1, 1, 1,
-0.3675736, 1.878976, 2.061695, 1, 1, 1, 1, 1,
-0.3650802, -1.68568, -3.841878, 1, 1, 1, 1, 1,
-0.364926, 0.1913677, 0.2443596, 0, 0, 1, 1, 1,
-0.3643943, 1.608536, -1.378242, 1, 0, 0, 1, 1,
-0.3643137, -0.8558689, -2.478173, 1, 0, 0, 1, 1,
-0.3634346, 0.1323576, -1.803156, 1, 0, 0, 1, 1,
-0.3611386, 0.07890837, -3.004533, 1, 0, 0, 1, 1,
-0.3583633, 0.06517133, -0.844711, 1, 0, 0, 1, 1,
-0.3520907, 0.4136401, -0.3238504, 0, 0, 0, 1, 1,
-0.3479054, 1.540826, -1.582164, 0, 0, 0, 1, 1,
-0.3460647, 0.4935665, 0.6827137, 0, 0, 0, 1, 1,
-0.3444222, 0.6865389, -0.998578, 0, 0, 0, 1, 1,
-0.3426422, -0.9971355, -2.742197, 0, 0, 0, 1, 1,
-0.3414367, 0.2698004, -0.9571544, 0, 0, 0, 1, 1,
-0.3412504, 0.5600514, -0.1966052, 0, 0, 0, 1, 1,
-0.3404699, -1.461318, -3.55164, 1, 1, 1, 1, 1,
-0.3404638, 1.375572, -0.4213897, 1, 1, 1, 1, 1,
-0.3361198, -1.089239, -4.948946, 1, 1, 1, 1, 1,
-0.3341932, 0.7098787, -1.314893, 1, 1, 1, 1, 1,
-0.3335406, -0.5874341, -2.714492, 1, 1, 1, 1, 1,
-0.3325711, 1.087722, -1.009205, 1, 1, 1, 1, 1,
-0.3300984, 0.05304361, 0.5838639, 1, 1, 1, 1, 1,
-0.3253566, 0.9323074, 0.4077842, 1, 1, 1, 1, 1,
-0.3210874, -1.358797, -2.119464, 1, 1, 1, 1, 1,
-0.3165529, -1.486607, -2.008637, 1, 1, 1, 1, 1,
-0.3154067, 0.776418, -1.30617, 1, 1, 1, 1, 1,
-0.3101843, -0.3118696, -2.720399, 1, 1, 1, 1, 1,
-0.3099059, 1.051217, -1.663137, 1, 1, 1, 1, 1,
-0.3058437, 0.203948, -1.078302, 1, 1, 1, 1, 1,
-0.3035745, 0.2055348, 1.618899, 1, 1, 1, 1, 1,
-0.3029765, -0.9089332, -3.058426, 0, 0, 1, 1, 1,
-0.2996297, 0.2743397, 0.257047, 1, 0, 0, 1, 1,
-0.2931471, -1.213591, -1.907872, 1, 0, 0, 1, 1,
-0.2883649, 1.67597, 1.549297, 1, 0, 0, 1, 1,
-0.2860909, 1.412207, 2.047562, 1, 0, 0, 1, 1,
-0.2860318, -0.3543756, -1.62408, 1, 0, 0, 1, 1,
-0.2809994, 0.9854749, 0.9639854, 0, 0, 0, 1, 1,
-0.2800252, 0.3999363, -1.167595, 0, 0, 0, 1, 1,
-0.2599876, 0.2291718, -1.211976, 0, 0, 0, 1, 1,
-0.2554714, -0.5859876, -2.241455, 0, 0, 0, 1, 1,
-0.2513683, -1.570335, -3.382602, 0, 0, 0, 1, 1,
-0.24855, 0.7035112, 0.06262436, 0, 0, 0, 1, 1,
-0.2467816, 0.8474988, -0.4253891, 0, 0, 0, 1, 1,
-0.2467578, 0.9758517, -1.296252, 1, 1, 1, 1, 1,
-0.2463957, -0.8107004, -2.233082, 1, 1, 1, 1, 1,
-0.2458848, 0.435075, -1.294064, 1, 1, 1, 1, 1,
-0.2410141, -0.4041642, -4.405961, 1, 1, 1, 1, 1,
-0.2397859, 0.252224, -0.443456, 1, 1, 1, 1, 1,
-0.2366607, -1.334786, -1.987184, 1, 1, 1, 1, 1,
-0.2328038, -0.8405585, -2.856362, 1, 1, 1, 1, 1,
-0.2318156, -1.023987, -1.96165, 1, 1, 1, 1, 1,
-0.2293697, 0.3165933, -0.1277335, 1, 1, 1, 1, 1,
-0.2270591, -0.680437, -3.248082, 1, 1, 1, 1, 1,
-0.2266727, -0.5911564, -4.367399, 1, 1, 1, 1, 1,
-0.2266642, -0.8534846, -1.032962, 1, 1, 1, 1, 1,
-0.2234951, -0.0103776, -2.415475, 1, 1, 1, 1, 1,
-0.2223859, 0.4296566, 1.415969, 1, 1, 1, 1, 1,
-0.2223286, 0.263534, -0.2385688, 1, 1, 1, 1, 1,
-0.221242, -0.1058001, -1.565087, 0, 0, 1, 1, 1,
-0.220792, 2.497718, -1.350988, 1, 0, 0, 1, 1,
-0.219783, 1.921715, 0.1591808, 1, 0, 0, 1, 1,
-0.2189849, 0.1446132, -1.551393, 1, 0, 0, 1, 1,
-0.2169223, -1.470818, -1.754807, 1, 0, 0, 1, 1,
-0.2158661, 0.2261334, -1.971529, 1, 0, 0, 1, 1,
-0.2145534, -0.7604045, -2.706976, 0, 0, 0, 1, 1,
-0.2144352, -1.749846, -2.124943, 0, 0, 0, 1, 1,
-0.2135382, -0.9626004, -2.25389, 0, 0, 0, 1, 1,
-0.2123543, 0.2623814, -0.3912104, 0, 0, 0, 1, 1,
-0.2112969, -0.5078298, -2.931913, 0, 0, 0, 1, 1,
-0.2099972, -1.020786, -4.439219, 0, 0, 0, 1, 1,
-0.2065488, 0.3601446, -1.240999, 0, 0, 0, 1, 1,
-0.2060361, 0.05991126, -1.806416, 1, 1, 1, 1, 1,
-0.2053119, 1.252526, -0.6045005, 1, 1, 1, 1, 1,
-0.2002526, 0.7200654, -0.7252005, 1, 1, 1, 1, 1,
-0.196848, -0.3291249, -1.440793, 1, 1, 1, 1, 1,
-0.1959222, -1.461294, -2.752623, 1, 1, 1, 1, 1,
-0.1899865, -0.3669193, -2.654817, 1, 1, 1, 1, 1,
-0.1881352, 0.3077259, -0.9859347, 1, 1, 1, 1, 1,
-0.1852746, -1.125605, -3.068012, 1, 1, 1, 1, 1,
-0.1839365, 0.4817317, -1.302985, 1, 1, 1, 1, 1,
-0.1801384, 0.3719833, 1.098188, 1, 1, 1, 1, 1,
-0.1798394, 0.2904525, -0.6772205, 1, 1, 1, 1, 1,
-0.1783561, 0.7113529, -0.1958673, 1, 1, 1, 1, 1,
-0.1752994, 1.079606, 0.6161696, 1, 1, 1, 1, 1,
-0.1746038, 1.313743, 0.02810209, 1, 1, 1, 1, 1,
-0.1744295, -0.9498925, -3.532256, 1, 1, 1, 1, 1,
-0.1660157, -2.084402, -2.983246, 0, 0, 1, 1, 1,
-0.1652375, 1.133993, -0.02434583, 1, 0, 0, 1, 1,
-0.1648564, 2.443388, -0.5361775, 1, 0, 0, 1, 1,
-0.1552919, -0.2543646, -1.686988, 1, 0, 0, 1, 1,
-0.1506149, -0.2553633, -3.634442, 1, 0, 0, 1, 1,
-0.1493346, -0.08151963, -2.555487, 1, 0, 0, 1, 1,
-0.1462564, -0.5923829, -1.635968, 0, 0, 0, 1, 1,
-0.1461388, -1.143421, -4.810742, 0, 0, 0, 1, 1,
-0.1459513, 0.2195498, 0.4193512, 0, 0, 0, 1, 1,
-0.1394954, 1.796352, 1.017218, 0, 0, 0, 1, 1,
-0.1382766, 1.847149, 0.3989531, 0, 0, 0, 1, 1,
-0.1382091, -1.032623, -2.328379, 0, 0, 0, 1, 1,
-0.1362866, -0.7520023, -3.186644, 0, 0, 0, 1, 1,
-0.133019, -0.921382, -1.955784, 1, 1, 1, 1, 1,
-0.1317881, -0.5992819, -2.419353, 1, 1, 1, 1, 1,
-0.1291611, 0.458335, 1.456496, 1, 1, 1, 1, 1,
-0.1250959, -1.480672, -3.51666, 1, 1, 1, 1, 1,
-0.1189486, 0.5025176, 0.3440178, 1, 1, 1, 1, 1,
-0.1186951, -0.419028, -3.870156, 1, 1, 1, 1, 1,
-0.1141749, 0.505174, -0.2471689, 1, 1, 1, 1, 1,
-0.1140159, 0.4891293, -0.6452289, 1, 1, 1, 1, 1,
-0.1137097, -0.7775065, -2.616702, 1, 1, 1, 1, 1,
-0.1123814, 0.347062, -0.7137293, 1, 1, 1, 1, 1,
-0.1123044, -0.5293075, -3.251525, 1, 1, 1, 1, 1,
-0.1108171, -0.9572523, -5.12601, 1, 1, 1, 1, 1,
-0.1103132, 0.8912627, -0.9629942, 1, 1, 1, 1, 1,
-0.1068379, 1.524695, 0.6473591, 1, 1, 1, 1, 1,
-0.1063219, -1.289667, -3.767455, 1, 1, 1, 1, 1,
-0.1016795, -0.4807269, -3.050548, 0, 0, 1, 1, 1,
-0.09815566, 0.1115307, -1.709889, 1, 0, 0, 1, 1,
-0.09682705, -0.02769538, -0.7192802, 1, 0, 0, 1, 1,
-0.09626986, 0.5587541, 0.7902901, 1, 0, 0, 1, 1,
-0.09262103, -0.7195969, -2.895447, 1, 0, 0, 1, 1,
-0.0923976, -1.559541, -1.907599, 1, 0, 0, 1, 1,
-0.09117197, -1.521059, -2.701607, 0, 0, 0, 1, 1,
-0.09033717, 0.785897, -0.8239475, 0, 0, 0, 1, 1,
-0.09004779, 0.03557542, 1.127409, 0, 0, 0, 1, 1,
-0.08871888, 0.1617089, -2.565155, 0, 0, 0, 1, 1,
-0.08534222, -0.7936755, -4.438162, 0, 0, 0, 1, 1,
-0.08430226, 0.8788417, 1.139034, 0, 0, 0, 1, 1,
-0.07944536, 0.9703088, 1.466354, 0, 0, 0, 1, 1,
-0.07644591, 0.1217731, -0.7766339, 1, 1, 1, 1, 1,
-0.0642119, 0.7654208, -0.5903013, 1, 1, 1, 1, 1,
-0.06352848, -0.6111251, -2.408473, 1, 1, 1, 1, 1,
-0.05961351, 1.584914, 0.1414041, 1, 1, 1, 1, 1,
-0.04513847, -0.2893859, -1.937691, 1, 1, 1, 1, 1,
-0.0450745, 0.8762928, -0.3638878, 1, 1, 1, 1, 1,
-0.04482392, 0.6464171, -0.3337312, 1, 1, 1, 1, 1,
-0.04468933, -0.8378664, -3.085824, 1, 1, 1, 1, 1,
-0.04391371, 0.03695428, 0.8192435, 1, 1, 1, 1, 1,
-0.04364887, 0.6748754, -1.353354, 1, 1, 1, 1, 1,
-0.04323765, -1.314264, -3.524706, 1, 1, 1, 1, 1,
-0.04128864, -0.7072781, -2.966443, 1, 1, 1, 1, 1,
-0.0396036, -0.2533881, -2.399101, 1, 1, 1, 1, 1,
-0.03937363, -1.14845, -4.180929, 1, 1, 1, 1, 1,
-0.03263458, -1.171159, -2.865702, 1, 1, 1, 1, 1,
-0.02992854, 1.610324, -0.7511861, 0, 0, 1, 1, 1,
-0.02710132, -0.4644203, -3.529397, 1, 0, 0, 1, 1,
-0.02525316, -2.055184, -3.141659, 1, 0, 0, 1, 1,
-0.02262405, -0.4460023, -1.937911, 1, 0, 0, 1, 1,
-0.01948538, 0.6968215, 0.4811632, 1, 0, 0, 1, 1,
-0.01944938, 1.127221, -1.809634, 1, 0, 0, 1, 1,
-0.01363616, 0.3710984, -0.6366207, 0, 0, 0, 1, 1,
-0.007078951, 0.1245827, -0.4605846, 0, 0, 0, 1, 1,
-0.002381623, 0.3272941, 0.851473, 0, 0, 0, 1, 1,
-0.00235699, -0.01929691, -3.580005, 0, 0, 0, 1, 1,
-6.36307e-05, -0.1725038, -1.122483, 0, 0, 0, 1, 1,
8.659823e-06, -0.2681503, 3.770889, 0, 0, 0, 1, 1,
0.004457125, 0.2341824, -0.8111848, 0, 0, 0, 1, 1,
0.01164036, 1.180807, 0.4275155, 1, 1, 1, 1, 1,
0.0135605, 0.5945602, 0.6672552, 1, 1, 1, 1, 1,
0.01788403, 1.737525, 1.06037, 1, 1, 1, 1, 1,
0.02671132, 0.4049842, 1.226214, 1, 1, 1, 1, 1,
0.02858912, -0.4707002, 3.248111, 1, 1, 1, 1, 1,
0.0322048, -1.255138, 4.419757, 1, 1, 1, 1, 1,
0.03233714, -0.7146717, 4.407118, 1, 1, 1, 1, 1,
0.03319087, 0.1057186, -2.258114, 1, 1, 1, 1, 1,
0.03631453, 0.6084148, -0.1897833, 1, 1, 1, 1, 1,
0.03660395, 0.789442, 0.2286916, 1, 1, 1, 1, 1,
0.0389547, 0.691266, 1.10811, 1, 1, 1, 1, 1,
0.03922847, -0.2366398, 2.795017, 1, 1, 1, 1, 1,
0.04687615, -0.3939467, 1.848019, 1, 1, 1, 1, 1,
0.04783871, 0.1992188, 0.7513044, 1, 1, 1, 1, 1,
0.04807629, -1.537671, 3.843996, 1, 1, 1, 1, 1,
0.05060622, 1.096011, -0.996511, 0, 0, 1, 1, 1,
0.05081144, -1.394746, 1.163959, 1, 0, 0, 1, 1,
0.05269175, -0.3805205, 2.930415, 1, 0, 0, 1, 1,
0.05279966, -1.130991, 3.599744, 1, 0, 0, 1, 1,
0.06755721, -0.1982733, 3.452652, 1, 0, 0, 1, 1,
0.06757011, -0.3451517, 0.7202334, 1, 0, 0, 1, 1,
0.07147876, -0.5796158, 2.791858, 0, 0, 0, 1, 1,
0.07339173, -1.253857, 3.496724, 0, 0, 0, 1, 1,
0.07445189, -1.248891, 3.207133, 0, 0, 0, 1, 1,
0.07905759, -0.7716245, 4.678679, 0, 0, 0, 1, 1,
0.08164314, -1.30453, 3.423267, 0, 0, 0, 1, 1,
0.0816558, 0.5331866, -1.169701, 0, 0, 0, 1, 1,
0.08815101, 0.9963308, -0.1255345, 0, 0, 0, 1, 1,
0.08821109, 0.1943463, 0.7367049, 1, 1, 1, 1, 1,
0.09161959, -1.313112, 1.00232, 1, 1, 1, 1, 1,
0.09490065, -0.1696791, 3.187658, 1, 1, 1, 1, 1,
0.09559916, -0.1692496, 3.433681, 1, 1, 1, 1, 1,
0.1036904, -0.5053218, 4.197945, 1, 1, 1, 1, 1,
0.1049942, 0.3002611, 0.2895049, 1, 1, 1, 1, 1,
0.1063905, -0.5801678, 3.458464, 1, 1, 1, 1, 1,
0.1066974, 1.477774, 1.105482, 1, 1, 1, 1, 1,
0.1087224, -0.2033844, 3.017821, 1, 1, 1, 1, 1,
0.1091732, 1.022156, -1.20135, 1, 1, 1, 1, 1,
0.109425, 0.8972879, 0.08234002, 1, 1, 1, 1, 1,
0.118155, 0.7370149, -1.865935, 1, 1, 1, 1, 1,
0.1204419, -0.7129876, 2.996277, 1, 1, 1, 1, 1,
0.1245429, 0.7274391, 1.042785, 1, 1, 1, 1, 1,
0.1247964, 1.023549, 0.5766088, 1, 1, 1, 1, 1,
0.1282466, -0.3221883, 0.6895202, 0, 0, 1, 1, 1,
0.1308135, 0.2472712, 0.3148666, 1, 0, 0, 1, 1,
0.1319249, -0.8886088, 2.163446, 1, 0, 0, 1, 1,
0.135903, 1.575719, -0.3523945, 1, 0, 0, 1, 1,
0.1384986, 0.0153866, 1.629331, 1, 0, 0, 1, 1,
0.1415311, 0.9782234, 0.3769515, 1, 0, 0, 1, 1,
0.1426111, 0.4470631, 1.971836, 0, 0, 0, 1, 1,
0.1454385, 0.1654162, -1.240004, 0, 0, 0, 1, 1,
0.1469848, -0.836641, 2.946795, 0, 0, 0, 1, 1,
0.1523818, 1.1508, -0.09802923, 0, 0, 0, 1, 1,
0.1543897, -0.2089318, 0.6434393, 0, 0, 0, 1, 1,
0.1562761, -0.5740085, 2.34197, 0, 0, 0, 1, 1,
0.1713734, -1.341635, 4.938839, 0, 0, 0, 1, 1,
0.1808123, 0.2910438, 0.2546599, 1, 1, 1, 1, 1,
0.1813801, -0.8779774, 3.833214, 1, 1, 1, 1, 1,
0.182815, 2.681718, 1.000898, 1, 1, 1, 1, 1,
0.1870768, 1.614504, -1.446753, 1, 1, 1, 1, 1,
0.1877876, 0.2293982, 0.3017008, 1, 1, 1, 1, 1,
0.190793, -0.8965115, 3.01529, 1, 1, 1, 1, 1,
0.1909267, -1.364015, 3.166703, 1, 1, 1, 1, 1,
0.1914096, 1.167612, -0.2712053, 1, 1, 1, 1, 1,
0.1951373, 0.5326179, -0.5928195, 1, 1, 1, 1, 1,
0.1953977, 0.4113077, -0.1403039, 1, 1, 1, 1, 1,
0.1956447, 0.2951308, -0.148485, 1, 1, 1, 1, 1,
0.1966416, 0.8297565, 1.239499, 1, 1, 1, 1, 1,
0.1978568, 0.4890722, -0.2770596, 1, 1, 1, 1, 1,
0.1989785, 1.901373, 0.9943193, 1, 1, 1, 1, 1,
0.201104, -0.3020017, 1.420854, 1, 1, 1, 1, 1,
0.2025459, -0.3681386, 1.133264, 0, 0, 1, 1, 1,
0.2032157, -1.524059, 3.065912, 1, 0, 0, 1, 1,
0.2037281, 0.7117907, 0.6975897, 1, 0, 0, 1, 1,
0.2057519, -0.9279869, 2.750206, 1, 0, 0, 1, 1,
0.2092616, -0.9289894, 3.667188, 1, 0, 0, 1, 1,
0.2095773, 1.075784, -0.2470992, 1, 0, 0, 1, 1,
0.2115101, 0.8141853, -0.02277733, 0, 0, 0, 1, 1,
0.2152135, -0.4983189, 3.123768, 0, 0, 0, 1, 1,
0.2186029, 0.6755632, -0.2345397, 0, 0, 0, 1, 1,
0.2186381, -0.8551643, 2.708135, 0, 0, 0, 1, 1,
0.2226848, 0.9066852, 0.6141875, 0, 0, 0, 1, 1,
0.2238411, -1.385394, 2.953958, 0, 0, 0, 1, 1,
0.2248244, 1.275748, 0.9718508, 0, 0, 0, 1, 1,
0.2299055, -1.594134, 3.36462, 1, 1, 1, 1, 1,
0.2335778, -1.138669, 3.632258, 1, 1, 1, 1, 1,
0.2381086, 0.5263306, 0.2386858, 1, 1, 1, 1, 1,
0.2403013, -1.406424, 2.130777, 1, 1, 1, 1, 1,
0.2444713, 1.472459, 0.04882801, 1, 1, 1, 1, 1,
0.2450982, -0.1863296, 0.3898683, 1, 1, 1, 1, 1,
0.2538614, -0.9019189, 2.841924, 1, 1, 1, 1, 1,
0.2546457, 2.200943, -1.093663, 1, 1, 1, 1, 1,
0.2672819, 1.184441, 0.3215619, 1, 1, 1, 1, 1,
0.2673469, 0.7953618, -0.6563223, 1, 1, 1, 1, 1,
0.2678667, 0.506806, -0.06208253, 1, 1, 1, 1, 1,
0.2694403, -2.265029, 1.680033, 1, 1, 1, 1, 1,
0.2708265, 0.1958168, 0.8210649, 1, 1, 1, 1, 1,
0.27115, -0.5597188, 2.563661, 1, 1, 1, 1, 1,
0.2753268, 2.470699, 0.8068808, 1, 1, 1, 1, 1,
0.2779499, -0.6909698, 3.04769, 0, 0, 1, 1, 1,
0.2814043, -0.6630562, 5.724746, 1, 0, 0, 1, 1,
0.2827957, 2.272676, -0.816804, 1, 0, 0, 1, 1,
0.2860164, 1.737406, 1.087784, 1, 0, 0, 1, 1,
0.2862646, -0.6260378, 2.993624, 1, 0, 0, 1, 1,
0.2917627, 0.8419428, 0.3980541, 1, 0, 0, 1, 1,
0.2928215, 1.568952, 0.06883983, 0, 0, 0, 1, 1,
0.2931902, -0.8386118, 2.576373, 0, 0, 0, 1, 1,
0.2970876, 1.457814, 0.601405, 0, 0, 0, 1, 1,
0.2971026, 0.9596803, -0.629598, 0, 0, 0, 1, 1,
0.2971208, -0.2418712, 2.907577, 0, 0, 0, 1, 1,
0.2976787, 1.39306, 1.54772, 0, 0, 0, 1, 1,
0.3003317, 1.398545, 1.930014, 0, 0, 0, 1, 1,
0.3012277, -0.09823585, 0.8676828, 1, 1, 1, 1, 1,
0.3028008, 0.4075003, -0.3702878, 1, 1, 1, 1, 1,
0.3075046, 0.1438128, 2.681136, 1, 1, 1, 1, 1,
0.3115035, 0.4835192, 3.235, 1, 1, 1, 1, 1,
0.3116574, 1.078406, -0.5275868, 1, 1, 1, 1, 1,
0.3118486, 0.0572582, 0.8403535, 1, 1, 1, 1, 1,
0.3180672, 0.09155139, 2.400505, 1, 1, 1, 1, 1,
0.3189851, 1.516926, -0.4986641, 1, 1, 1, 1, 1,
0.3194471, 0.1778385, 1.418716, 1, 1, 1, 1, 1,
0.3213509, 1.708586, 0.3908499, 1, 1, 1, 1, 1,
0.3216455, 0.1568232, 1.090934, 1, 1, 1, 1, 1,
0.3226423, -0.2176104, 2.754081, 1, 1, 1, 1, 1,
0.3238103, 1.08406, 0.4614059, 1, 1, 1, 1, 1,
0.3271803, -0.590424, 1.645973, 1, 1, 1, 1, 1,
0.3295231, 2.012407, -1.891872, 1, 1, 1, 1, 1,
0.3297778, 0.8104229, -0.8237674, 0, 0, 1, 1, 1,
0.336406, 0.1822988, 0.5917144, 1, 0, 0, 1, 1,
0.3416121, 0.6150469, 1.119992, 1, 0, 0, 1, 1,
0.3443625, -1.4834, 2.722977, 1, 0, 0, 1, 1,
0.3445899, 0.4398414, 1.264496, 1, 0, 0, 1, 1,
0.3451411, -0.611254, 3.003938, 1, 0, 0, 1, 1,
0.3489413, -1.555536, 2.447449, 0, 0, 0, 1, 1,
0.3561685, -0.09353417, 2.094037, 0, 0, 0, 1, 1,
0.3582149, 0.6147051, -0.4546595, 0, 0, 0, 1, 1,
0.358541, -0.5355823, 2.299176, 0, 0, 0, 1, 1,
0.3640452, 0.5702293, 0.1701322, 0, 0, 0, 1, 1,
0.3673188, 0.3058217, 2.989775, 0, 0, 0, 1, 1,
0.3683758, -1.427128, 1.692224, 0, 0, 0, 1, 1,
0.3688192, 1.022502, 1.058253, 1, 1, 1, 1, 1,
0.3689143, -0.1878079, 3.065962, 1, 1, 1, 1, 1,
0.3704028, 1.030126, -0.8328721, 1, 1, 1, 1, 1,
0.3768694, 1.388751, 0.349862, 1, 1, 1, 1, 1,
0.3773581, 0.07460015, 1.921554, 1, 1, 1, 1, 1,
0.3788297, -0.5906293, 2.93464, 1, 1, 1, 1, 1,
0.3818604, 0.7726991, 1.860401, 1, 1, 1, 1, 1,
0.3864371, 0.573038, 2.058336, 1, 1, 1, 1, 1,
0.3877459, -0.8415862, 1.071717, 1, 1, 1, 1, 1,
0.3889479, -0.707639, 2.410123, 1, 1, 1, 1, 1,
0.3893266, 0.8709222, 1.796362, 1, 1, 1, 1, 1,
0.3896555, -0.7279856, 3.395004, 1, 1, 1, 1, 1,
0.3983445, -0.1977665, 3.005073, 1, 1, 1, 1, 1,
0.4057782, -1.024603, 1.312348, 1, 1, 1, 1, 1,
0.4067552, 0.9511201, 1.020355, 1, 1, 1, 1, 1,
0.4085385, 0.6863379, 0.7385412, 0, 0, 1, 1, 1,
0.4114099, 1.0019, 0.834642, 1, 0, 0, 1, 1,
0.4182884, 0.6992754, 1.237264, 1, 0, 0, 1, 1,
0.4197399, 1.698914, 1.963838, 1, 0, 0, 1, 1,
0.4212335, -1.250095, 2.233038, 1, 0, 0, 1, 1,
0.4232502, -0.2986698, 3.683548, 1, 0, 0, 1, 1,
0.4301318, -1.548523, 2.167916, 0, 0, 0, 1, 1,
0.4318956, -0.6885197, 3.903983, 0, 0, 0, 1, 1,
0.4325235, -0.1883319, 2.103941, 0, 0, 0, 1, 1,
0.4351543, -3.252938, 1.759754, 0, 0, 0, 1, 1,
0.4379835, -0.9007783, 3.936632, 0, 0, 0, 1, 1,
0.443336, 0.6932387, 0.7153493, 0, 0, 0, 1, 1,
0.4445351, -2.046449, 4.787707, 0, 0, 0, 1, 1,
0.4460519, -0.5478573, 4.511952, 1, 1, 1, 1, 1,
0.4465713, -1.321036, 1.078838, 1, 1, 1, 1, 1,
0.448651, 1.059309, 1.821996, 1, 1, 1, 1, 1,
0.4524913, 2.139412, 1.060386, 1, 1, 1, 1, 1,
0.4575161, -0.2780478, 2.977875, 1, 1, 1, 1, 1,
0.4580836, -0.539677, 2.623447, 1, 1, 1, 1, 1,
0.460127, 1.369034, 0.6448376, 1, 1, 1, 1, 1,
0.4689919, 0.6945412, 1.567246, 1, 1, 1, 1, 1,
0.4698446, 1.342982, -1.293073, 1, 1, 1, 1, 1,
0.4701954, 1.041351, 1.161486, 1, 1, 1, 1, 1,
0.4706602, 0.1212242, 1.304196, 1, 1, 1, 1, 1,
0.4724171, 0.9499064, 1.56705, 1, 1, 1, 1, 1,
0.4782521, 2.478441, 1.69537, 1, 1, 1, 1, 1,
0.4831855, 0.2685083, 1.563199, 1, 1, 1, 1, 1,
0.4929267, 1.647988, 1.224727, 1, 1, 1, 1, 1,
0.4938684, 0.2192699, 1.651295, 0, 0, 1, 1, 1,
0.4948402, 0.6764482, 1.766175, 1, 0, 0, 1, 1,
0.4964768, 1.096309, -0.3118033, 1, 0, 0, 1, 1,
0.4991001, -0.9759856, 2.133253, 1, 0, 0, 1, 1,
0.4999423, -0.01347942, 1.458601, 1, 0, 0, 1, 1,
0.5046399, -0.4185351, 1.779529, 1, 0, 0, 1, 1,
0.5050259, -1.188318, 3.649532, 0, 0, 0, 1, 1,
0.5052734, 0.2165637, 1.458697, 0, 0, 0, 1, 1,
0.5054386, -0.3907025, 3.383051, 0, 0, 0, 1, 1,
0.5132072, 0.0157889, 1.215537, 0, 0, 0, 1, 1,
0.5137457, -0.157755, 2.688851, 0, 0, 0, 1, 1,
0.5140994, 0.9845433, 2.027139, 0, 0, 0, 1, 1,
0.5169623, -0.4521558, 4.095192, 0, 0, 0, 1, 1,
0.5170218, -1.920983, 3.079565, 1, 1, 1, 1, 1,
0.5183918, 0.07615186, 0.6050385, 1, 1, 1, 1, 1,
0.5205637, 1.185702, 0.9521825, 1, 1, 1, 1, 1,
0.5228295, -1.41646, 2.572574, 1, 1, 1, 1, 1,
0.5250034, -0.3531556, 1.874719, 1, 1, 1, 1, 1,
0.5287189, -0.05721566, 1.476114, 1, 1, 1, 1, 1,
0.5295592, -1.377539, 3.80713, 1, 1, 1, 1, 1,
0.5335732, 0.5778863, -1.430103, 1, 1, 1, 1, 1,
0.5362359, 0.08898073, -0.3717596, 1, 1, 1, 1, 1,
0.5377146, 0.03316278, -0.008074408, 1, 1, 1, 1, 1,
0.5388814, 1.295741, 2.503817, 1, 1, 1, 1, 1,
0.5393269, -0.1926234, 1.673994, 1, 1, 1, 1, 1,
0.5404751, -0.385194, 1.681827, 1, 1, 1, 1, 1,
0.540804, -0.4080408, 1.368589, 1, 1, 1, 1, 1,
0.5454395, -0.6626692, 3.801764, 1, 1, 1, 1, 1,
0.5501924, -0.04900073, 0.2973373, 0, 0, 1, 1, 1,
0.5567748, -1.233281, 3.832214, 1, 0, 0, 1, 1,
0.5580996, 0.4863954, 0.4000061, 1, 0, 0, 1, 1,
0.5587531, -0.3091136, 2.433072, 1, 0, 0, 1, 1,
0.5613831, -0.09487517, 0.9635352, 1, 0, 0, 1, 1,
0.5618998, -1.587425, 3.475227, 1, 0, 0, 1, 1,
0.5639611, 0.1524288, 1.439442, 0, 0, 0, 1, 1,
0.568755, -1.386664, 1.467988, 0, 0, 0, 1, 1,
0.5700427, 1.046348, 0.1423981, 0, 0, 0, 1, 1,
0.5711962, -0.6389277, 2.572417, 0, 0, 0, 1, 1,
0.5722819, -0.06036423, 1.525869, 0, 0, 0, 1, 1,
0.5741252, 1.045308, -0.03590903, 0, 0, 0, 1, 1,
0.576116, -0.587719, 3.159188, 0, 0, 0, 1, 1,
0.5799536, 1.879555, -1.569109, 1, 1, 1, 1, 1,
0.5813631, -0.7138475, 1.900144, 1, 1, 1, 1, 1,
0.5814927, 1.640254, 0.788174, 1, 1, 1, 1, 1,
0.5852829, -0.5637227, 2.657757, 1, 1, 1, 1, 1,
0.5930271, -0.6153942, 2.077196, 1, 1, 1, 1, 1,
0.5943896, -0.686142, 0.8129652, 1, 1, 1, 1, 1,
0.5945057, -0.0459879, 2.146016, 1, 1, 1, 1, 1,
0.5990428, -1.0351, 3.081012, 1, 1, 1, 1, 1,
0.6024665, 0.7489692, 1.175262, 1, 1, 1, 1, 1,
0.6052738, 0.02051648, 0.911077, 1, 1, 1, 1, 1,
0.6058756, 1.921613, -0.4447597, 1, 1, 1, 1, 1,
0.605889, 1.071818, 1.367069, 1, 1, 1, 1, 1,
0.6087373, -0.6471222, 3.872562, 1, 1, 1, 1, 1,
0.6101027, -0.2521856, 2.285612, 1, 1, 1, 1, 1,
0.6121945, -1.166281, 2.762366, 1, 1, 1, 1, 1,
0.6132939, 0.266309, 2.311519, 0, 0, 1, 1, 1,
0.6149966, 0.4460033, 0.9259127, 1, 0, 0, 1, 1,
0.6189998, 0.7261667, 2.268315, 1, 0, 0, 1, 1,
0.6211556, -0.839747, 0.9097421, 1, 0, 0, 1, 1,
0.6267015, 0.2241984, 1.625386, 1, 0, 0, 1, 1,
0.641393, 0.5317742, 0.9899423, 1, 0, 0, 1, 1,
0.6451052, -0.45612, 3.018426, 0, 0, 0, 1, 1,
0.646335, -0.05523267, 3.468011, 0, 0, 0, 1, 1,
0.6471649, -0.1664301, 1.911439, 0, 0, 0, 1, 1,
0.6471863, 0.4406868, 0.5543408, 0, 0, 0, 1, 1,
0.6526362, 0.07604356, 0.3144389, 0, 0, 0, 1, 1,
0.6529771, -0.1295841, 1.484212, 0, 0, 0, 1, 1,
0.6567218, -1.088523, 2.817643, 0, 0, 0, 1, 1,
0.6677029, -0.3159287, 2.243291, 1, 1, 1, 1, 1,
0.6701064, -0.2513637, 2.177799, 1, 1, 1, 1, 1,
0.6755633, 0.5948794, -0.8371799, 1, 1, 1, 1, 1,
0.6755945, 0.6720616, 0.9336913, 1, 1, 1, 1, 1,
0.67699, 0.3899627, 1.817832, 1, 1, 1, 1, 1,
0.677124, -0.9201145, -0.1115244, 1, 1, 1, 1, 1,
0.6774669, 0.2829598, 2.492319, 1, 1, 1, 1, 1,
0.6877301, -0.1243967, 1.836146, 1, 1, 1, 1, 1,
0.6909865, -0.07056254, 1.703131, 1, 1, 1, 1, 1,
0.6934992, 1.181266, 0.8662083, 1, 1, 1, 1, 1,
0.6954762, 0.3218127, 2.358285, 1, 1, 1, 1, 1,
0.7034347, -0.06412414, 0.9838787, 1, 1, 1, 1, 1,
0.7077746, 0.1515886, 1.90037, 1, 1, 1, 1, 1,
0.7086911, 0.6736079, 0.6656783, 1, 1, 1, 1, 1,
0.7087009, 0.01694764, -0.7910393, 1, 1, 1, 1, 1,
0.7098818, -0.3683919, 1.544798, 0, 0, 1, 1, 1,
0.715476, -1.017931, 1.840913, 1, 0, 0, 1, 1,
0.7179283, 2.629484, -0.2313087, 1, 0, 0, 1, 1,
0.7212823, -0.6016737, 1.433044, 1, 0, 0, 1, 1,
0.7225563, 0.3079289, 2.048685, 1, 0, 0, 1, 1,
0.724798, -0.3589387, 2.411791, 1, 0, 0, 1, 1,
0.7287643, 0.06876304, 0.4210681, 0, 0, 0, 1, 1,
0.7364777, 0.909247, 1.468145, 0, 0, 0, 1, 1,
0.7433036, -0.4316039, 2.318277, 0, 0, 0, 1, 1,
0.7440851, -0.52007, 3.915389, 0, 0, 0, 1, 1,
0.7458059, -0.4656533, 2.688874, 0, 0, 0, 1, 1,
0.7483363, -0.005927493, 2.496623, 0, 0, 0, 1, 1,
0.7585164, 1.310423, 0.2779154, 0, 0, 0, 1, 1,
0.7597787, -1.138478, 2.321691, 1, 1, 1, 1, 1,
0.7640139, 0.07236386, 1.770967, 1, 1, 1, 1, 1,
0.769666, -0.788008, 2.814261, 1, 1, 1, 1, 1,
0.7792401, -0.07234243, 1.007382, 1, 1, 1, 1, 1,
0.7817136, -1.494885, 2.778562, 1, 1, 1, 1, 1,
0.7837055, -2.960253, 3.280453, 1, 1, 1, 1, 1,
0.7875661, 0.249388, 1.581521, 1, 1, 1, 1, 1,
0.7924246, -0.8364784, 1.490369, 1, 1, 1, 1, 1,
0.7940812, -1.739069, 3.393793, 1, 1, 1, 1, 1,
0.7948533, -0.3653895, -0.3142977, 1, 1, 1, 1, 1,
0.8006666, -0.8240881, 3.105453, 1, 1, 1, 1, 1,
0.8020371, -0.02714189, 3.062237, 1, 1, 1, 1, 1,
0.8120633, 1.618523, 0.7907798, 1, 1, 1, 1, 1,
0.8223479, 0.8193785, -0.8786359, 1, 1, 1, 1, 1,
0.8235765, 1.911719, -0.5914522, 1, 1, 1, 1, 1,
0.8235978, -1.716751, 3.382105, 0, 0, 1, 1, 1,
0.8238425, -1.174763, 1.774056, 1, 0, 0, 1, 1,
0.8258389, -1.730023, 2.411987, 1, 0, 0, 1, 1,
0.8281005, -0.9800757, 0.7895251, 1, 0, 0, 1, 1,
0.8288662, 0.1942003, 0.3817476, 1, 0, 0, 1, 1,
0.8302074, -1.348745, 2.55357, 1, 0, 0, 1, 1,
0.832441, 3.151197, 0.3505423, 0, 0, 0, 1, 1,
0.8334901, 0.2959754, 1.651843, 0, 0, 0, 1, 1,
0.8338506, -0.7995545, 1.027679, 0, 0, 0, 1, 1,
0.8343884, -0.05629105, 2.319968, 0, 0, 0, 1, 1,
0.8351098, -0.1171925, 0.9382854, 0, 0, 0, 1, 1,
0.8367184, 0.7034895, 0.8361257, 0, 0, 0, 1, 1,
0.8419918, 0.2749926, 0.3728838, 0, 0, 0, 1, 1,
0.8443173, 1.005582, 0.2048232, 1, 1, 1, 1, 1,
0.8649287, -0.005021016, 1.40022, 1, 1, 1, 1, 1,
0.8685649, 1.033223, 1.022341, 1, 1, 1, 1, 1,
0.8696999, -0.2030591, 2.228586, 1, 1, 1, 1, 1,
0.875348, 0.6222295, 1.741686, 1, 1, 1, 1, 1,
0.8792785, 0.8112385, 2.980886, 1, 1, 1, 1, 1,
0.888517, -3.328885, 3.319025, 1, 1, 1, 1, 1,
0.8890867, 0.971382, 0.9248069, 1, 1, 1, 1, 1,
0.8931868, 1.764181, 0.7754434, 1, 1, 1, 1, 1,
0.8933917, 0.7310917, 0.08921107, 1, 1, 1, 1, 1,
0.8984515, 2.482002, 0.3617311, 1, 1, 1, 1, 1,
0.8995218, -0.7258934, 2.66397, 1, 1, 1, 1, 1,
0.901575, -0.980586, 0.8493082, 1, 1, 1, 1, 1,
0.9029021, -0.7701003, 3.377496, 1, 1, 1, 1, 1,
0.9144357, 0.3253503, 1.503216, 1, 1, 1, 1, 1,
0.9191784, -0.4300275, 2.524863, 0, 0, 1, 1, 1,
0.9234759, 0.3491746, 0.5167004, 1, 0, 0, 1, 1,
0.9246154, -1.465865, 3.415207, 1, 0, 0, 1, 1,
0.9271308, 1.367628, -0.09262351, 1, 0, 0, 1, 1,
0.931373, -0.8531793, 1.338141, 1, 0, 0, 1, 1,
0.9428065, -0.6816833, 1.988465, 1, 0, 0, 1, 1,
0.9431209, 0.51407, 1.444757, 0, 0, 0, 1, 1,
0.9441437, 0.6402977, 0.988028, 0, 0, 0, 1, 1,
0.9456263, 0.1287079, -1.070378, 0, 0, 0, 1, 1,
0.9461189, -1.063198, 4.224349, 0, 0, 0, 1, 1,
0.9472384, 0.6365622, 0.05994969, 0, 0, 0, 1, 1,
0.9494232, -0.4451087, 1.957934, 0, 0, 0, 1, 1,
0.9521999, 0.01347865, 0.02811683, 0, 0, 0, 1, 1,
0.9578941, -0.85044, 1.885788, 1, 1, 1, 1, 1,
0.9641036, -0.2271428, 1.998506, 1, 1, 1, 1, 1,
0.9643769, -1.203396, 2.41753, 1, 1, 1, 1, 1,
0.9657864, 2.188575, 1.23122, 1, 1, 1, 1, 1,
0.9671936, -0.3495687, 1.141017, 1, 1, 1, 1, 1,
0.9828192, 0.3159834, 1.402274, 1, 1, 1, 1, 1,
0.9829419, 1.459906, 2.034956, 1, 1, 1, 1, 1,
0.9863735, -1.581057, 4.194508, 1, 1, 1, 1, 1,
0.9889219, 1.124904, -1.378125, 1, 1, 1, 1, 1,
0.9897981, -0.04114232, -0.3878248, 1, 1, 1, 1, 1,
0.9902887, -0.8593832, 2.3438, 1, 1, 1, 1, 1,
0.9903036, -0.09928674, 3.566847, 1, 1, 1, 1, 1,
0.9950927, 0.3498164, 0.7946377, 1, 1, 1, 1, 1,
0.9993545, -0.8438848, 2.857317, 1, 1, 1, 1, 1,
1.003476, -0.04808046, 2.592821, 1, 1, 1, 1, 1,
1.006001, -2.034565, 2.380085, 0, 0, 1, 1, 1,
1.021458, -0.6615614, 0.4725312, 1, 0, 0, 1, 1,
1.02463, -0.02193411, 1.710887, 1, 0, 0, 1, 1,
1.026555, -1.411711, 1.161206, 1, 0, 0, 1, 1,
1.027634, 1.427732, -0.8291693, 1, 0, 0, 1, 1,
1.036366, -0.9672539, 1.303411, 1, 0, 0, 1, 1,
1.037792, -0.2560092, 1.132345, 0, 0, 0, 1, 1,
1.050674, 0.05293493, 1.001294, 0, 0, 0, 1, 1,
1.05231, -0.2567129, 2.767915, 0, 0, 0, 1, 1,
1.061399, -1.662453, 1.677222, 0, 0, 0, 1, 1,
1.062183, 0.3289633, 1.965637, 0, 0, 0, 1, 1,
1.063503, 2.119839, -0.8655505, 0, 0, 0, 1, 1,
1.069854, 2.081431, 0.2615792, 0, 0, 0, 1, 1,
1.071458, 0.2194016, -0.1798122, 1, 1, 1, 1, 1,
1.073377, -0.1710301, 0.8926659, 1, 1, 1, 1, 1,
1.073855, 0.5107658, 2.682374, 1, 1, 1, 1, 1,
1.077007, 0.9491634, 1.60625, 1, 1, 1, 1, 1,
1.078991, -1.234305, 2.199766, 1, 1, 1, 1, 1,
1.084731, 0.1398105, 0.9632446, 1, 1, 1, 1, 1,
1.092419, -0.8585827, 2.028308, 1, 1, 1, 1, 1,
1.099183, 0.08938184, 2.028119, 1, 1, 1, 1, 1,
1.105355, 0.1392899, 1.670537, 1, 1, 1, 1, 1,
1.114969, 0.03629201, 0.7742408, 1, 1, 1, 1, 1,
1.132074, -1.496129, 3.931148, 1, 1, 1, 1, 1,
1.133484, 1.130328, 0.7004107, 1, 1, 1, 1, 1,
1.135004, 2.322348, 1.396817, 1, 1, 1, 1, 1,
1.139195, -0.6080666, 3.001296, 1, 1, 1, 1, 1,
1.147366, -1.005441, 0.8141863, 1, 1, 1, 1, 1,
1.149685, -0.172211, 2.107021, 0, 0, 1, 1, 1,
1.152327, -0.9732271, 3.184043, 1, 0, 0, 1, 1,
1.157365, -0.8640191, 2.055914, 1, 0, 0, 1, 1,
1.165914, 1.508387, 1.09873, 1, 0, 0, 1, 1,
1.169904, 1.639862, 0.1495408, 1, 0, 0, 1, 1,
1.171973, -0.2939294, 1.978939, 1, 0, 0, 1, 1,
1.173031, 1.251373, -0.266235, 0, 0, 0, 1, 1,
1.178725, 2.098436, 0.8592222, 0, 0, 0, 1, 1,
1.192171, -0.9807903, 3.014663, 0, 0, 0, 1, 1,
1.194628, -1.332796, 0.8564965, 0, 0, 0, 1, 1,
1.202652, -2.052733, 1.377733, 0, 0, 0, 1, 1,
1.202834, -0.03034021, 2.511702, 0, 0, 0, 1, 1,
1.211993, 0.01991594, 1.324925, 0, 0, 0, 1, 1,
1.251692, 1.32489, 2.272514, 1, 1, 1, 1, 1,
1.275904, -2.4322, 1.95205, 1, 1, 1, 1, 1,
1.277247, 1.096879, -1.542331, 1, 1, 1, 1, 1,
1.285585, 0.3236494, 1.505294, 1, 1, 1, 1, 1,
1.294382, -0.558301, 2.040991, 1, 1, 1, 1, 1,
1.301633, 0.5784304, 2.034762, 1, 1, 1, 1, 1,
1.305826, -1.735905, 5.264304, 1, 1, 1, 1, 1,
1.306206, -0.8613529, 1.464214, 1, 1, 1, 1, 1,
1.306816, -0.6271381, 3.231639, 1, 1, 1, 1, 1,
1.320179, 1.644849, 0.6253976, 1, 1, 1, 1, 1,
1.32361, 1.19073, 0.7702422, 1, 1, 1, 1, 1,
1.347501, 0.5351539, 0.6210838, 1, 1, 1, 1, 1,
1.377039, -0.7858889, -0.255237, 1, 1, 1, 1, 1,
1.379288, 0.6310358, 1.797192, 1, 1, 1, 1, 1,
1.381147, 0.472738, 0.8572232, 1, 1, 1, 1, 1,
1.396763, 0.3339539, 0.8793331, 0, 0, 1, 1, 1,
1.400259, -1.211188, 4.000839, 1, 0, 0, 1, 1,
1.403181, 0.7408106, 1.012311, 1, 0, 0, 1, 1,
1.409953, 0.9036205, 1.417986, 1, 0, 0, 1, 1,
1.414074, 0.4701504, 0.9363378, 1, 0, 0, 1, 1,
1.417069, -2.260786, 3.525888, 1, 0, 0, 1, 1,
1.422659, -0.2248887, 1.623889, 0, 0, 0, 1, 1,
1.425792, -0.585677, 1.012637, 0, 0, 0, 1, 1,
1.430893, -0.4120446, 1.975916, 0, 0, 0, 1, 1,
1.450196, -0.3830967, 1.240787, 0, 0, 0, 1, 1,
1.452241, 0.3758017, 1.536475, 0, 0, 0, 1, 1,
1.454358, -0.1231261, 2.355816, 0, 0, 0, 1, 1,
1.464869, 0.03920924, 2.356997, 0, 0, 0, 1, 1,
1.470664, 0.1619687, 1.768044, 1, 1, 1, 1, 1,
1.473271, 1.298155, 0.6033816, 1, 1, 1, 1, 1,
1.474358, 0.08601864, -0.9051673, 1, 1, 1, 1, 1,
1.477707, 0.7530156, 1.320822, 1, 1, 1, 1, 1,
1.48423, 0.235697, 3.694039, 1, 1, 1, 1, 1,
1.486982, -1.704507, -0.08385836, 1, 1, 1, 1, 1,
1.487256, 1.518303, 1.229475, 1, 1, 1, 1, 1,
1.496316, 0.1773765, 1.70858, 1, 1, 1, 1, 1,
1.511201, 0.266813, 0.4191478, 1, 1, 1, 1, 1,
1.51186, -0.8442691, 1.807075, 1, 1, 1, 1, 1,
1.515505, 0.2372209, 1.854408, 1, 1, 1, 1, 1,
1.522807, 1.414073, 1.845602, 1, 1, 1, 1, 1,
1.523086, -0.2401128, 2.626196, 1, 1, 1, 1, 1,
1.535109, -0.5208462, 2.023845, 1, 1, 1, 1, 1,
1.547392, -0.7162667, 1.312322, 1, 1, 1, 1, 1,
1.560686, 1.996675, -0.1866681, 0, 0, 1, 1, 1,
1.571749, -0.5852762, 2.047398, 1, 0, 0, 1, 1,
1.57663, -1.029749, -0.6173106, 1, 0, 0, 1, 1,
1.583017, 0.06022006, 1.578811, 1, 0, 0, 1, 1,
1.59194, 0.4627768, 1.67878, 1, 0, 0, 1, 1,
1.594006, 0.1309357, 0.7917235, 1, 0, 0, 1, 1,
1.595922, 0.09938738, 1.641302, 0, 0, 0, 1, 1,
1.649038, 0.2252152, 1.767144, 0, 0, 0, 1, 1,
1.649983, 0.4476917, 0.9450878, 0, 0, 0, 1, 1,
1.656169, 0.6578305, 1.008667, 0, 0, 0, 1, 1,
1.664793, 0.1610023, 0.1376976, 0, 0, 0, 1, 1,
1.666666, 1.045879, -0.3599465, 0, 0, 0, 1, 1,
1.66829, -0.7273598, 1.371033, 0, 0, 0, 1, 1,
1.697437, 0.7874279, 2.342891, 1, 1, 1, 1, 1,
1.698493, 0.478994, 0.9313924, 1, 1, 1, 1, 1,
1.700228, -0.1236459, 2.836826, 1, 1, 1, 1, 1,
1.701215, 0.355211, 1.533391, 1, 1, 1, 1, 1,
1.705544, -1.230184, 2.454229, 1, 1, 1, 1, 1,
1.705896, -0.5162234, 2.217797, 1, 1, 1, 1, 1,
1.709864, 0.5569242, 1.453257, 1, 1, 1, 1, 1,
1.731754, -0.3043751, 3.244346, 1, 1, 1, 1, 1,
1.737841, 1.174189, 2.768102, 1, 1, 1, 1, 1,
1.740237, 2.528231, 0.9656546, 1, 1, 1, 1, 1,
1.751997, 0.601031, 0.04925904, 1, 1, 1, 1, 1,
1.754775, -0.03001812, 2.289213, 1, 1, 1, 1, 1,
1.756153, -0.3425596, 1.647358, 1, 1, 1, 1, 1,
1.762537, 0.9191191, 0.2180252, 1, 1, 1, 1, 1,
1.772071, -3.855904, 3.558872, 1, 1, 1, 1, 1,
1.784041, 0.5757489, 1.237651, 0, 0, 1, 1, 1,
1.786233, -0.7498235, 2.520693, 1, 0, 0, 1, 1,
1.786833, -0.3171138, 0.8157861, 1, 0, 0, 1, 1,
1.791292, -1.093048, 1.559696, 1, 0, 0, 1, 1,
1.825673, 0.8622859, 2.693036, 1, 0, 0, 1, 1,
1.885373, -0.1977728, 2.17957, 1, 0, 0, 1, 1,
1.899253, -0.1831094, 1.667266, 0, 0, 0, 1, 1,
1.900337, 0.05497411, 2.022341, 0, 0, 0, 1, 1,
1.90515, 1.072654, 0.3153608, 0, 0, 0, 1, 1,
1.908098, 0.2234211, 1.343127, 0, 0, 0, 1, 1,
1.91538, -0.7652558, 0.5105275, 0, 0, 0, 1, 1,
1.921036, 1.423567, 1.279142, 0, 0, 0, 1, 1,
1.945431, -0.2289792, 2.926473, 0, 0, 0, 1, 1,
1.971305, 0.4968864, 3.050851, 1, 1, 1, 1, 1,
1.980608, -1.31878, 2.623382, 1, 1, 1, 1, 1,
1.982832, -1.167328, 1.247487, 1, 1, 1, 1, 1,
1.992037, 1.391054, -0.2292865, 1, 1, 1, 1, 1,
2.012207, 0.6362901, 0.2180521, 1, 1, 1, 1, 1,
2.013116, 1.194831, 2.109157, 1, 1, 1, 1, 1,
2.013235, 0.3998789, 0.7905869, 1, 1, 1, 1, 1,
2.022058, 0.0949954, 0.7065485, 1, 1, 1, 1, 1,
2.039091, -0.06017964, 3.799134, 1, 1, 1, 1, 1,
2.04509, 3.040429, 0.3358978, 1, 1, 1, 1, 1,
2.076012, 0.50218, 1.765256, 1, 1, 1, 1, 1,
2.105955, 0.1793551, -0.49091, 1, 1, 1, 1, 1,
2.118349, 0.2029072, 2.193775, 1, 1, 1, 1, 1,
2.124055, 0.6214646, 2.674335, 1, 1, 1, 1, 1,
2.137933, 0.7989815, 1.318287, 1, 1, 1, 1, 1,
2.1681, 1.009122, 1.557334, 0, 0, 1, 1, 1,
2.177738, -0.7495811, 2.228241, 1, 0, 0, 1, 1,
2.198231, 0.9424167, 2.273378, 1, 0, 0, 1, 1,
2.235346, 1.616807, 0.8518217, 1, 0, 0, 1, 1,
2.237344, 0.6404651, -0.5368538, 1, 0, 0, 1, 1,
2.259009, 1.759586, 1.059978, 1, 0, 0, 1, 1,
2.272351, 0.3046394, 3.119721, 0, 0, 0, 1, 1,
2.294291, 1.071944, -0.1128745, 0, 0, 0, 1, 1,
2.304765, -0.6335106, 1.644235, 0, 0, 0, 1, 1,
2.313466, 0.1809117, 1.387857, 0, 0, 0, 1, 1,
2.32127, 0.001150688, 3.996942, 0, 0, 0, 1, 1,
2.327806, 0.008494446, 1.511072, 0, 0, 0, 1, 1,
2.332304, 0.5483261, 3.115913, 0, 0, 0, 1, 1,
2.445473, -0.8274244, 0.4277658, 1, 1, 1, 1, 1,
2.448403, -3.244498, 4.349915, 1, 1, 1, 1, 1,
2.540104, 0.5553313, 0.3040524, 1, 1, 1, 1, 1,
2.75386, 0.3996753, 1.495905, 1, 1, 1, 1, 1,
2.895269, -0.8755608, 1.842659, 1, 1, 1, 1, 1,
3.017823, 0.3830533, 0.6896566, 1, 1, 1, 1, 1,
3.338387, -1.116812, 2.363327, 1, 1, 1, 1, 1
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
var radius = 9.814854;
var distance = 34.47426;
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
mvMatrix.translate( -0.1229413, 0.3523538, -0.2779832 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.47426);
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
