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
-3.2105, 0.2548243, -4.102041, 1, 0, 0, 1,
-2.965423, -0.8969428, -1.898027, 1, 0.007843138, 0, 1,
-2.82425, 0.01584526, -1.30977, 1, 0.01176471, 0, 1,
-2.671402, -0.7076666, -2.783467, 1, 0.01960784, 0, 1,
-2.554814, 0.8702988, -1.547961, 1, 0.02352941, 0, 1,
-2.552235, 0.6721985, 0.84066, 1, 0.03137255, 0, 1,
-2.538873, 0.3746825, -2.521147, 1, 0.03529412, 0, 1,
-2.538433, 0.2296461, -0.8389412, 1, 0.04313726, 0, 1,
-2.460146, -0.6518748, -1.19552, 1, 0.04705882, 0, 1,
-2.377161, 1.920488, -0.356385, 1, 0.05490196, 0, 1,
-2.30916, -2.337863, -2.476505, 1, 0.05882353, 0, 1,
-2.260313, 0.07740434, -2.932243, 1, 0.06666667, 0, 1,
-2.231636, -0.7251067, -2.343082, 1, 0.07058824, 0, 1,
-2.12276, -0.03688908, -1.619313, 1, 0.07843138, 0, 1,
-2.11866, -0.902586, -3.035868, 1, 0.08235294, 0, 1,
-2.088229, 0.6745888, -1.692039, 1, 0.09019608, 0, 1,
-2.079375, -0.9247071, -0.9219016, 1, 0.09411765, 0, 1,
-2.056319, -0.4223097, -0.9221237, 1, 0.1019608, 0, 1,
-2.037617, 1.820119, -3.207529, 1, 0.1098039, 0, 1,
-2.032734, 1.359751, -1.994493, 1, 0.1137255, 0, 1,
-2.026748, 1.153964, -1.466253, 1, 0.1215686, 0, 1,
-2.018656, 0.2048625, -1.374318, 1, 0.1254902, 0, 1,
-1.956622, -0.2903132, -0.7020594, 1, 0.1333333, 0, 1,
-1.954654, 0.2401035, -2.987496, 1, 0.1372549, 0, 1,
-1.933214, -0.07984155, -1.404285, 1, 0.145098, 0, 1,
-1.914626, 0.6304031, -0.9573343, 1, 0.1490196, 0, 1,
-1.885786, -0.06667476, -0.1537088, 1, 0.1568628, 0, 1,
-1.884734, 0.7197639, -1.672739, 1, 0.1607843, 0, 1,
-1.883286, 2.027327, -1.637845, 1, 0.1686275, 0, 1,
-1.883103, 0.5889279, 1.092353, 1, 0.172549, 0, 1,
-1.863303, 1.259695, -0.6549704, 1, 0.1803922, 0, 1,
-1.83988, -0.5899728, -1.945226, 1, 0.1843137, 0, 1,
-1.839557, 0.858142, -2.194865, 1, 0.1921569, 0, 1,
-1.827755, -0.5151465, -1.88569, 1, 0.1960784, 0, 1,
-1.80044, 1.172995, -1.187206, 1, 0.2039216, 0, 1,
-1.786794, 1.134176, -1.073766, 1, 0.2117647, 0, 1,
-1.780869, -0.8081787, -1.377239, 1, 0.2156863, 0, 1,
-1.765072, -0.5424229, -1.303401, 1, 0.2235294, 0, 1,
-1.759072, 0.8025436, -0.755663, 1, 0.227451, 0, 1,
-1.744812, -1.600427, -2.625749, 1, 0.2352941, 0, 1,
-1.739423, 0.2717251, -1.050649, 1, 0.2392157, 0, 1,
-1.738032, 1.702954, -1.478038, 1, 0.2470588, 0, 1,
-1.731363, 0.07661051, -2.672706, 1, 0.2509804, 0, 1,
-1.709916, 1.451911, -0.4490806, 1, 0.2588235, 0, 1,
-1.689163, 0.3791962, -2.268666, 1, 0.2627451, 0, 1,
-1.662602, 1.390683, -0.3236726, 1, 0.2705882, 0, 1,
-1.6605, -0.8785681, -2.132612, 1, 0.2745098, 0, 1,
-1.658661, -0.7168667, -1.915806, 1, 0.282353, 0, 1,
-1.648773, -0.1556817, -2.228188, 1, 0.2862745, 0, 1,
-1.6397, 0.9521481, -0.2752752, 1, 0.2941177, 0, 1,
-1.637949, 0.04296107, -1.302306, 1, 0.3019608, 0, 1,
-1.636111, 2.231536, -1.531182, 1, 0.3058824, 0, 1,
-1.635069, -0.6830372, -0.4437659, 1, 0.3137255, 0, 1,
-1.628733, -0.04469014, 0.1005293, 1, 0.3176471, 0, 1,
-1.622252, 0.7509807, -0.8401781, 1, 0.3254902, 0, 1,
-1.613497, 0.2777847, -3.052312, 1, 0.3294118, 0, 1,
-1.582036, 0.6149725, -1.480255, 1, 0.3372549, 0, 1,
-1.580388, -0.2276649, -3.241264, 1, 0.3411765, 0, 1,
-1.572321, -0.06850661, -1.2742, 1, 0.3490196, 0, 1,
-1.566023, -0.8990173, -1.549696, 1, 0.3529412, 0, 1,
-1.560771, 0.1495681, -0.7593209, 1, 0.3607843, 0, 1,
-1.554468, -1.336076, -2.958709, 1, 0.3647059, 0, 1,
-1.549534, -0.5146263, -3.037203, 1, 0.372549, 0, 1,
-1.540411, -2.011814, -3.451218, 1, 0.3764706, 0, 1,
-1.539598, 0.4439031, -2.928204, 1, 0.3843137, 0, 1,
-1.513162, -0.7534104, 0.1224906, 1, 0.3882353, 0, 1,
-1.505086, 1.140041, -2.26532, 1, 0.3960784, 0, 1,
-1.493704, 1.817324, -1.12968, 1, 0.4039216, 0, 1,
-1.490444, 1.195975, -0.1484757, 1, 0.4078431, 0, 1,
-1.489517, -0.6823646, -3.049163, 1, 0.4156863, 0, 1,
-1.478058, -0.1350516, -2.027968, 1, 0.4196078, 0, 1,
-1.472996, -1.500038, -2.963078, 1, 0.427451, 0, 1,
-1.468567, -1.375851, -2.783423, 1, 0.4313726, 0, 1,
-1.46725, -0.6783547, -0.3631163, 1, 0.4392157, 0, 1,
-1.462838, -0.2019907, -2.091506, 1, 0.4431373, 0, 1,
-1.461183, 0.7372783, -2.588316, 1, 0.4509804, 0, 1,
-1.459368, 1.231065, -0.2280017, 1, 0.454902, 0, 1,
-1.453504, -0.009386082, -1.372062, 1, 0.4627451, 0, 1,
-1.444115, 0.3182306, -2.407008, 1, 0.4666667, 0, 1,
-1.443894, -0.7043039, -0.5581332, 1, 0.4745098, 0, 1,
-1.440423, 1.241162, 0.8673466, 1, 0.4784314, 0, 1,
-1.436981, 1.198008, -0.4970244, 1, 0.4862745, 0, 1,
-1.432549, -0.06035529, -1.800066, 1, 0.4901961, 0, 1,
-1.428912, -0.7097437, -2.416701, 1, 0.4980392, 0, 1,
-1.422947, -1.497459, -1.588779, 1, 0.5058824, 0, 1,
-1.415814, -0.9884241, -0.4631952, 1, 0.509804, 0, 1,
-1.412275, -0.8227282, -3.618536, 1, 0.5176471, 0, 1,
-1.40562, -1.521343, -1.502872, 1, 0.5215687, 0, 1,
-1.385648, 1.284244, -2.005248, 1, 0.5294118, 0, 1,
-1.384133, 0.3030601, 0.4497409, 1, 0.5333334, 0, 1,
-1.379692, 0.03954619, -1.760034, 1, 0.5411765, 0, 1,
-1.377607, 0.2761521, -1.411187, 1, 0.5450981, 0, 1,
-1.376151, -1.42975, -2.113844, 1, 0.5529412, 0, 1,
-1.375762, 0.8644752, -2.251384, 1, 0.5568628, 0, 1,
-1.374342, -1.674281, -3.005257, 1, 0.5647059, 0, 1,
-1.374243, 0.8494724, -1.105051, 1, 0.5686275, 0, 1,
-1.373739, -0.7774037, -2.882285, 1, 0.5764706, 0, 1,
-1.371723, 1.690816, -1.009188, 1, 0.5803922, 0, 1,
-1.362546, -0.425956, -1.683985, 1, 0.5882353, 0, 1,
-1.359635, 0.4503626, -2.093572, 1, 0.5921569, 0, 1,
-1.359491, -0.6987877, -3.218057, 1, 0.6, 0, 1,
-1.353229, -0.3075614, -2.528629, 1, 0.6078432, 0, 1,
-1.352133, -0.3452512, -2.851456, 1, 0.6117647, 0, 1,
-1.348417, 1.311288, 0.1500791, 1, 0.6196079, 0, 1,
-1.348056, -0.190397, -0.4606829, 1, 0.6235294, 0, 1,
-1.332581, -0.2591376, -1.489695, 1, 0.6313726, 0, 1,
-1.315936, -1.374625, -2.901887, 1, 0.6352941, 0, 1,
-1.315876, 0.2822436, -2.102774, 1, 0.6431373, 0, 1,
-1.314938, 1.282997, -0.5725435, 1, 0.6470588, 0, 1,
-1.31482, 0.6825207, -1.177631, 1, 0.654902, 0, 1,
-1.310555, -0.3098305, -1.136208, 1, 0.6588235, 0, 1,
-1.306034, -0.05211794, -0.9951596, 1, 0.6666667, 0, 1,
-1.298235, -0.4131232, -0.7816274, 1, 0.6705883, 0, 1,
-1.291733, -1.563499, -1.603111, 1, 0.6784314, 0, 1,
-1.289936, -1.790827, -3.198567, 1, 0.682353, 0, 1,
-1.28013, -0.3603556, -2.4718, 1, 0.6901961, 0, 1,
-1.266451, 0.4100937, -0.8248967, 1, 0.6941177, 0, 1,
-1.265135, 0.4809636, -2.716678, 1, 0.7019608, 0, 1,
-1.26276, 0.2904028, -0.748036, 1, 0.7098039, 0, 1,
-1.262468, 1.982934, -0.09982219, 1, 0.7137255, 0, 1,
-1.260124, 0.214473, -2.744158, 1, 0.7215686, 0, 1,
-1.253575, 1.149752, -2.537528, 1, 0.7254902, 0, 1,
-1.247819, -0.4072504, -0.03131707, 1, 0.7333333, 0, 1,
-1.246978, 0.8181494, -0.2071785, 1, 0.7372549, 0, 1,
-1.246722, -0.2501593, -0.921597, 1, 0.7450981, 0, 1,
-1.243217, 0.4515261, -2.183832, 1, 0.7490196, 0, 1,
-1.233554, -0.143666, -2.555816, 1, 0.7568628, 0, 1,
-1.230536, 1.045131, 0.16268, 1, 0.7607843, 0, 1,
-1.2269, -1.432968, -1.213493, 1, 0.7686275, 0, 1,
-1.21444, 0.8490237, -0.987521, 1, 0.772549, 0, 1,
-1.206539, -2.403152, -3.380943, 1, 0.7803922, 0, 1,
-1.201353, -1.758883, -2.948626, 1, 0.7843137, 0, 1,
-1.200513, -1.383734, -3.336011, 1, 0.7921569, 0, 1,
-1.19945, 0.6069171, -0.6241638, 1, 0.7960784, 0, 1,
-1.198414, 0.03372212, -0.9920137, 1, 0.8039216, 0, 1,
-1.197821, 0.008400658, -1.519298, 1, 0.8117647, 0, 1,
-1.194689, 0.08197482, -0.6285121, 1, 0.8156863, 0, 1,
-1.192843, 0.7400851, 0.9769374, 1, 0.8235294, 0, 1,
-1.188887, 1.196985, -1.787602, 1, 0.827451, 0, 1,
-1.185307, -1.757389, -3.450524, 1, 0.8352941, 0, 1,
-1.184272, -0.7349057, -2.495827, 1, 0.8392157, 0, 1,
-1.183456, 1.137107, -1.794405, 1, 0.8470588, 0, 1,
-1.179486, -0.4223134, -1.487732, 1, 0.8509804, 0, 1,
-1.174987, 0.3517693, -3.7181, 1, 0.8588235, 0, 1,
-1.171192, -2.200434, -0.2454809, 1, 0.8627451, 0, 1,
-1.168447, -0.08210714, -2.129331, 1, 0.8705882, 0, 1,
-1.167867, -0.8472525, -3.550802, 1, 0.8745098, 0, 1,
-1.161969, 0.4253054, -0.3033694, 1, 0.8823529, 0, 1,
-1.154142, 2.025713, -0.3264755, 1, 0.8862745, 0, 1,
-1.145198, 0.5883855, -1.889416, 1, 0.8941177, 0, 1,
-1.126149, -1.008267, -1.604456, 1, 0.8980392, 0, 1,
-1.110735, 0.2804071, 0.9097511, 1, 0.9058824, 0, 1,
-1.109835, 0.8197501, -1.488412, 1, 0.9137255, 0, 1,
-1.097102, 1.771508, 0.1609363, 1, 0.9176471, 0, 1,
-1.096862, 1.246938, -0.5383636, 1, 0.9254902, 0, 1,
-1.095094, 0.5390214, -0.8130761, 1, 0.9294118, 0, 1,
-1.094341, -1.553985, -2.415027, 1, 0.9372549, 0, 1,
-1.094166, 1.590835, -1.132674, 1, 0.9411765, 0, 1,
-1.093636, 0.2437727, -1.501874, 1, 0.9490196, 0, 1,
-1.092535, -0.8186517, -2.636321, 1, 0.9529412, 0, 1,
-1.078486, -1.057406, -1.441944, 1, 0.9607843, 0, 1,
-1.073252, 0.8067572, -1.096785, 1, 0.9647059, 0, 1,
-1.071269, -1.226433, -2.810366, 1, 0.972549, 0, 1,
-1.07095, -0.5442781, -2.573273, 1, 0.9764706, 0, 1,
-1.066615, 0.6205559, -1.630103, 1, 0.9843137, 0, 1,
-1.054491, -0.627679, -2.231092, 1, 0.9882353, 0, 1,
-1.039718, 0.5233237, -1.2536, 1, 0.9960784, 0, 1,
-1.039483, 0.8205339, -0.6289201, 0.9960784, 1, 0, 1,
-1.039089, -1.249402, -0.4735338, 0.9921569, 1, 0, 1,
-1.03854, 0.7855885, -0.9536507, 0.9843137, 1, 0, 1,
-1.037974, 1.509964, -1.056494, 0.9803922, 1, 0, 1,
-1.03509, -0.2830815, 0.04585136, 0.972549, 1, 0, 1,
-1.033981, -1.818676, -3.348805, 0.9686275, 1, 0, 1,
-1.033137, -0.1901398, -1.22819, 0.9607843, 1, 0, 1,
-1.031024, -0.3331102, -0.9932183, 0.9568627, 1, 0, 1,
-1.025333, -0.7743042, -1.799673, 0.9490196, 1, 0, 1,
-1.023499, 0.2999089, -0.8545313, 0.945098, 1, 0, 1,
-1.022789, -0.4532484, -1.675379, 0.9372549, 1, 0, 1,
-1.016883, 1.197393, -2.037022, 0.9333333, 1, 0, 1,
-1.010074, 1.39343, -2.114794, 0.9254902, 1, 0, 1,
-1.006097, -0.3869573, -2.120337, 0.9215686, 1, 0, 1,
-0.9977504, 0.4669987, -1.348294, 0.9137255, 1, 0, 1,
-0.9937665, -0.4806721, -0.7238594, 0.9098039, 1, 0, 1,
-0.9924973, 0.9095919, -0.641715, 0.9019608, 1, 0, 1,
-0.9881362, 0.6245513, -1.16826, 0.8941177, 1, 0, 1,
-0.9879635, -2.72776, -2.2272, 0.8901961, 1, 0, 1,
-0.9748529, 0.4685445, -1.078256, 0.8823529, 1, 0, 1,
-0.9718841, -1.85624, -3.261438, 0.8784314, 1, 0, 1,
-0.9653528, 0.6214405, -0.2886383, 0.8705882, 1, 0, 1,
-0.9502541, 1.488219, 0.06184158, 0.8666667, 1, 0, 1,
-0.9478653, 1.628597, 1.907377, 0.8588235, 1, 0, 1,
-0.9345321, -0.135097, -1.836746, 0.854902, 1, 0, 1,
-0.9308231, -0.8666738, -2.920059, 0.8470588, 1, 0, 1,
-0.9238991, 1.653391, -2.41258, 0.8431373, 1, 0, 1,
-0.9160492, 1.720944, -0.1394473, 0.8352941, 1, 0, 1,
-0.9156967, -0.7661001, -2.565748, 0.8313726, 1, 0, 1,
-0.9149923, 0.7374378, -2.174576, 0.8235294, 1, 0, 1,
-0.9121692, -0.7374607, -4.026862, 0.8196079, 1, 0, 1,
-0.9100893, -0.733981, -1.93684, 0.8117647, 1, 0, 1,
-0.9090917, 1.946909, -2.025305, 0.8078431, 1, 0, 1,
-0.9069861, -0.3016942, -2.460295, 0.8, 1, 0, 1,
-0.9044998, 2.046549, -0.4348893, 0.7921569, 1, 0, 1,
-0.9036313, 1.248409, -1.072976, 0.7882353, 1, 0, 1,
-0.9016759, 1.509804, -1.211701, 0.7803922, 1, 0, 1,
-0.8992109, 1.698947, 0.3044709, 0.7764706, 1, 0, 1,
-0.8985204, 1.223959, 1.456036, 0.7686275, 1, 0, 1,
-0.8963427, 1.319908, -1.623195, 0.7647059, 1, 0, 1,
-0.8958037, 0.7437549, -1.334515, 0.7568628, 1, 0, 1,
-0.8930955, 0.2324997, -1.770352, 0.7529412, 1, 0, 1,
-0.8912118, 0.2114646, -2.293952, 0.7450981, 1, 0, 1,
-0.8909, -1.388944, -1.086177, 0.7411765, 1, 0, 1,
-0.8861274, -0.1220354, -2.10975, 0.7333333, 1, 0, 1,
-0.8842244, 0.5212554, -2.338295, 0.7294118, 1, 0, 1,
-0.8809569, 2.80118, 0.4290194, 0.7215686, 1, 0, 1,
-0.8801141, -0.9130304, -2.568421, 0.7176471, 1, 0, 1,
-0.8776535, 0.8355391, -0.1067625, 0.7098039, 1, 0, 1,
-0.8618405, -0.09333193, -2.916871, 0.7058824, 1, 0, 1,
-0.8566552, -0.1632111, -1.231858, 0.6980392, 1, 0, 1,
-0.8566346, -0.4421392, -2.269409, 0.6901961, 1, 0, 1,
-0.8543608, -0.4577306, -1.395342, 0.6862745, 1, 0, 1,
-0.843264, -0.4890958, -3.001495, 0.6784314, 1, 0, 1,
-0.8411362, 1.865307, 0.05574476, 0.6745098, 1, 0, 1,
-0.8343226, 0.8731305, -1.768815, 0.6666667, 1, 0, 1,
-0.8295864, -1.69497, -2.33794, 0.6627451, 1, 0, 1,
-0.8241619, -0.05559075, -4.115193, 0.654902, 1, 0, 1,
-0.8220489, -0.1558411, -2.403884, 0.6509804, 1, 0, 1,
-0.82154, 0.8944832, -1.360192, 0.6431373, 1, 0, 1,
-0.820199, 2.338683, -0.3863128, 0.6392157, 1, 0, 1,
-0.8198346, 1.583214, -0.09254684, 0.6313726, 1, 0, 1,
-0.8185192, -0.1235391, -1.512882, 0.627451, 1, 0, 1,
-0.8174014, 2.54489, 0.855749, 0.6196079, 1, 0, 1,
-0.813556, -0.8517355, -2.820264, 0.6156863, 1, 0, 1,
-0.8101546, -0.7453052, -2.121012, 0.6078432, 1, 0, 1,
-0.8085673, -0.4401058, -0.9883222, 0.6039216, 1, 0, 1,
-0.8003602, 1.512082, -0.3087963, 0.5960785, 1, 0, 1,
-0.7832137, 1.295995, -1.350676, 0.5882353, 1, 0, 1,
-0.7801048, -0.5091308, -1.487027, 0.5843138, 1, 0, 1,
-0.7800907, 1.750421, -0.456435, 0.5764706, 1, 0, 1,
-0.7757124, 0.2333773, 0.2750922, 0.572549, 1, 0, 1,
-0.7675459, 0.3460952, -0.992847, 0.5647059, 1, 0, 1,
-0.7669232, -0.411631, -3.403119, 0.5607843, 1, 0, 1,
-0.7651545, 1.178945, -1.02332, 0.5529412, 1, 0, 1,
-0.760289, -1.089988, -2.981721, 0.5490196, 1, 0, 1,
-0.7602074, 0.03377576, -1.485235, 0.5411765, 1, 0, 1,
-0.7600726, 0.7567774, -0.5526659, 0.5372549, 1, 0, 1,
-0.7598242, -0.08739016, -1.437857, 0.5294118, 1, 0, 1,
-0.7549098, 0.06406331, -2.559081, 0.5254902, 1, 0, 1,
-0.7528868, 0.2552757, -0.7640904, 0.5176471, 1, 0, 1,
-0.748198, 1.024028, -1.846166, 0.5137255, 1, 0, 1,
-0.7452767, -0.2579006, -3.163866, 0.5058824, 1, 0, 1,
-0.7451888, 0.3057673, -1.799218, 0.5019608, 1, 0, 1,
-0.7436117, 0.3813914, -0.5927866, 0.4941176, 1, 0, 1,
-0.7429406, -1.514923, -2.312682, 0.4862745, 1, 0, 1,
-0.741079, 0.4807702, -0.12098, 0.4823529, 1, 0, 1,
-0.7400185, 0.4052526, -0.5579106, 0.4745098, 1, 0, 1,
-0.7364932, 0.01667482, -1.037118, 0.4705882, 1, 0, 1,
-0.732998, 2.371379, 0.03493059, 0.4627451, 1, 0, 1,
-0.7317519, 0.06995916, -0.7941868, 0.4588235, 1, 0, 1,
-0.7307916, 1.898506, -1.134405, 0.4509804, 1, 0, 1,
-0.726994, 0.4197748, -0.1616427, 0.4470588, 1, 0, 1,
-0.7251978, 1.109504, 0.001845403, 0.4392157, 1, 0, 1,
-0.72403, 0.05776256, -2.711756, 0.4352941, 1, 0, 1,
-0.7214205, -0.3495106, -2.844997, 0.427451, 1, 0, 1,
-0.7040828, -0.2675361, -1.358814, 0.4235294, 1, 0, 1,
-0.7028843, 0.2444139, -1.99345, 0.4156863, 1, 0, 1,
-0.6950437, 1.183605, -0.0654504, 0.4117647, 1, 0, 1,
-0.6892251, -0.590746, -2.141554, 0.4039216, 1, 0, 1,
-0.6869397, 1.220923, -0.4095317, 0.3960784, 1, 0, 1,
-0.6759518, 0.7077197, -1.745658, 0.3921569, 1, 0, 1,
-0.6721694, 0.6999575, -1.061412, 0.3843137, 1, 0, 1,
-0.670497, 1.622681, -0.3579484, 0.3803922, 1, 0, 1,
-0.6699944, -1.004292, -1.861216, 0.372549, 1, 0, 1,
-0.6699632, 1.552553, 1.026314, 0.3686275, 1, 0, 1,
-0.6661476, 0.008975011, -0.9970014, 0.3607843, 1, 0, 1,
-0.6601316, -1.418638, -3.391359, 0.3568628, 1, 0, 1,
-0.6585431, -1.10107, -2.121819, 0.3490196, 1, 0, 1,
-0.6577945, 1.022509, -1.031532, 0.345098, 1, 0, 1,
-0.6529608, -0.03209017, -2.081442, 0.3372549, 1, 0, 1,
-0.6505398, -0.963619, -2.156826, 0.3333333, 1, 0, 1,
-0.6500138, -1.457019, -3.208569, 0.3254902, 1, 0, 1,
-0.6463788, -1.150574, -3.360573, 0.3215686, 1, 0, 1,
-0.6448848, 1.825812, 0.2112903, 0.3137255, 1, 0, 1,
-0.644622, -1.081766, -3.847184, 0.3098039, 1, 0, 1,
-0.6413279, 0.4563614, -1.001182, 0.3019608, 1, 0, 1,
-0.6373518, 0.9750506, 1.185835, 0.2941177, 1, 0, 1,
-0.6359534, -0.6579134, -2.860748, 0.2901961, 1, 0, 1,
-0.6313047, -1.126067, -3.062446, 0.282353, 1, 0, 1,
-0.6269782, -0.03709737, -2.517191, 0.2784314, 1, 0, 1,
-0.6225961, -0.8350574, -3.144501, 0.2705882, 1, 0, 1,
-0.6184356, -0.6678664, -0.3733556, 0.2666667, 1, 0, 1,
-0.6174589, -0.04707682, -0.3064829, 0.2588235, 1, 0, 1,
-0.6142508, 1.137909, -1.718519, 0.254902, 1, 0, 1,
-0.6095763, -0.3910146, -0.9498631, 0.2470588, 1, 0, 1,
-0.6083902, -1.043751, -4.031153, 0.2431373, 1, 0, 1,
-0.601954, -0.9883399, -2.266345, 0.2352941, 1, 0, 1,
-0.5983527, 0.9306283, 0.2582667, 0.2313726, 1, 0, 1,
-0.5957694, -0.1411451, -2.076429, 0.2235294, 1, 0, 1,
-0.5940286, -0.03085334, -2.563898, 0.2196078, 1, 0, 1,
-0.5940081, -0.3672452, -2.210067, 0.2117647, 1, 0, 1,
-0.5920732, 0.1007611, -0.9017845, 0.2078431, 1, 0, 1,
-0.5902569, -0.06335846, -2.777502, 0.2, 1, 0, 1,
-0.5895996, 0.07577477, -3.038605, 0.1921569, 1, 0, 1,
-0.5895981, -0.6192633, -2.610885, 0.1882353, 1, 0, 1,
-0.5892619, -0.3818837, -0.9733415, 0.1803922, 1, 0, 1,
-0.5856168, 0.03336765, -1.462032, 0.1764706, 1, 0, 1,
-0.5836474, 0.8420849, -2.449996, 0.1686275, 1, 0, 1,
-0.5766124, 0.4051394, -2.111138, 0.1647059, 1, 0, 1,
-0.5718021, -0.8783405, -1.598042, 0.1568628, 1, 0, 1,
-0.5698991, -1.429181, -1.410209, 0.1529412, 1, 0, 1,
-0.5591679, -0.1353423, 0.2372045, 0.145098, 1, 0, 1,
-0.5559776, -1.058752, -0.6801227, 0.1411765, 1, 0, 1,
-0.5545418, -1.105265, -2.40589, 0.1333333, 1, 0, 1,
-0.5512245, 1.247843, 0.9119422, 0.1294118, 1, 0, 1,
-0.5486506, 1.305867, 2.239999, 0.1215686, 1, 0, 1,
-0.5468144, -1.025818, -1.94321, 0.1176471, 1, 0, 1,
-0.5436919, 0.08422911, -1.46766, 0.1098039, 1, 0, 1,
-0.5359321, -0.8637394, -2.706692, 0.1058824, 1, 0, 1,
-0.5294703, 0.03495287, -0.9450767, 0.09803922, 1, 0, 1,
-0.5277178, 0.4126622, -2.407947, 0.09019608, 1, 0, 1,
-0.5227851, -1.370175, -2.222913, 0.08627451, 1, 0, 1,
-0.521038, 0.4130956, 0.8030367, 0.07843138, 1, 0, 1,
-0.5178356, -1.494284, -1.923448, 0.07450981, 1, 0, 1,
-0.516646, -0.1953024, -2.548752, 0.06666667, 1, 0, 1,
-0.5164129, -1.296958, -3.590857, 0.0627451, 1, 0, 1,
-0.5144311, 1.208654, -0.8534847, 0.05490196, 1, 0, 1,
-0.5091751, -0.1504413, -2.275684, 0.05098039, 1, 0, 1,
-0.5072369, -2.02556, -3.575738, 0.04313726, 1, 0, 1,
-0.5042655, -2.186145, -3.169506, 0.03921569, 1, 0, 1,
-0.5017352, -0.4199847, -3.06979, 0.03137255, 1, 0, 1,
-0.4902255, -0.5169028, -1.54114, 0.02745098, 1, 0, 1,
-0.4901319, -1.507244, -2.83186, 0.01960784, 1, 0, 1,
-0.4855858, -1.301348, -3.474243, 0.01568628, 1, 0, 1,
-0.482888, -0.6036247, -1.993162, 0.007843138, 1, 0, 1,
-0.4818791, 0.7247282, 0.6971123, 0.003921569, 1, 0, 1,
-0.4739573, -0.3922146, -3.77102, 0, 1, 0.003921569, 1,
-0.4736075, -0.2897215, -1.488576, 0, 1, 0.01176471, 1,
-0.4711406, 0.3591104, 1.33791, 0, 1, 0.01568628, 1,
-0.4706522, -0.7506102, -2.940306, 0, 1, 0.02352941, 1,
-0.4700205, -0.8682489, -3.846728, 0, 1, 0.02745098, 1,
-0.4662617, 0.4546024, -0.9991897, 0, 1, 0.03529412, 1,
-0.4661267, 1.381991, -0.4171568, 0, 1, 0.03921569, 1,
-0.4610249, -0.6469201, -2.694871, 0, 1, 0.04705882, 1,
-0.4596737, 0.5114394, 0.5892404, 0, 1, 0.05098039, 1,
-0.4555845, 1.857771, 1.703778, 0, 1, 0.05882353, 1,
-0.4552929, -0.0410753, -0.9157962, 0, 1, 0.0627451, 1,
-0.454659, 0.3907358, -3.090983, 0, 1, 0.07058824, 1,
-0.45222, -0.8000726, -3.361428, 0, 1, 0.07450981, 1,
-0.4505001, 1.414956, -1.125722, 0, 1, 0.08235294, 1,
-0.444959, 1.876428, -0.9142759, 0, 1, 0.08627451, 1,
-0.4396548, -0.009151867, -2.451197, 0, 1, 0.09411765, 1,
-0.4345297, -0.9309121, -3.555872, 0, 1, 0.1019608, 1,
-0.434263, -1.498801, -2.659157, 0, 1, 0.1058824, 1,
-0.4337293, -0.313702, -1.158244, 0, 1, 0.1137255, 1,
-0.4314098, 1.208566, 0.7572914, 0, 1, 0.1176471, 1,
-0.43134, -0.9591942, -1.837584, 0, 1, 0.1254902, 1,
-0.4289272, 0.5160064, -1.896917, 0, 1, 0.1294118, 1,
-0.4276775, -0.2275414, -0.2312358, 0, 1, 0.1372549, 1,
-0.4266468, -0.6643789, -4.172205, 0, 1, 0.1411765, 1,
-0.4239188, -0.5879424, -1.595656, 0, 1, 0.1490196, 1,
-0.4211253, -1.095081, -4.16422, 0, 1, 0.1529412, 1,
-0.4191192, -1.063911, -1.720691, 0, 1, 0.1607843, 1,
-0.4172834, -0.8668143, -2.552258, 0, 1, 0.1647059, 1,
-0.415588, -1.569853, -2.853828, 0, 1, 0.172549, 1,
-0.4110164, -0.1353093, -0.6761843, 0, 1, 0.1764706, 1,
-0.4014253, 0.407905, -1.368224, 0, 1, 0.1843137, 1,
-0.3989457, 1.852609, -0.2281598, 0, 1, 0.1882353, 1,
-0.3975084, -0.8465036, -2.358334, 0, 1, 0.1960784, 1,
-0.3959981, -0.3739517, -3.595541, 0, 1, 0.2039216, 1,
-0.3930304, -1.491883, -2.775111, 0, 1, 0.2078431, 1,
-0.3877446, -0.1593949, -2.671751, 0, 1, 0.2156863, 1,
-0.3858466, -1.127206, -1.018816, 0, 1, 0.2196078, 1,
-0.381704, -0.1486408, -2.393614, 0, 1, 0.227451, 1,
-0.3808956, 0.006594521, -0.9995822, 0, 1, 0.2313726, 1,
-0.3801853, -0.003381177, -1.82678, 0, 1, 0.2392157, 1,
-0.3758735, 0.5140358, -1.426874, 0, 1, 0.2431373, 1,
-0.3707767, 0.7054261, -0.6189963, 0, 1, 0.2509804, 1,
-0.369532, -0.380098, -2.237615, 0, 1, 0.254902, 1,
-0.3670027, -2.219841, -4.447417, 0, 1, 0.2627451, 1,
-0.3657623, 0.318128, 0.2577733, 0, 1, 0.2666667, 1,
-0.3634321, 2.514177, -0.6049758, 0, 1, 0.2745098, 1,
-0.3622541, 0.6295571, -2.954154, 0, 1, 0.2784314, 1,
-0.3613513, 0.1234847, -1.978549, 0, 1, 0.2862745, 1,
-0.3613119, 1.181346, -0.2843925, 0, 1, 0.2901961, 1,
-0.3570608, -0.4594673, 0.9608305, 0, 1, 0.2980392, 1,
-0.3508919, -0.8495267, -4.845519, 0, 1, 0.3058824, 1,
-0.342167, -1.823744, -3.758072, 0, 1, 0.3098039, 1,
-0.3417207, -0.4171162, -3.522661, 0, 1, 0.3176471, 1,
-0.3409526, 0.4885021, -0.3177165, 0, 1, 0.3215686, 1,
-0.3398405, 0.7027065, -1.314943, 0, 1, 0.3294118, 1,
-0.3370716, -1.748626, -2.264006, 0, 1, 0.3333333, 1,
-0.3360068, 2.141762, 1.021582, 0, 1, 0.3411765, 1,
-0.3330091, -0.5713845, -1.778015, 0, 1, 0.345098, 1,
-0.3326818, 1.447374, -0.8779573, 0, 1, 0.3529412, 1,
-0.327796, 0.6089269, -0.4711331, 0, 1, 0.3568628, 1,
-0.3263941, -1.538113, -1.850886, 0, 1, 0.3647059, 1,
-0.3209404, 2.078102, -0.8459435, 0, 1, 0.3686275, 1,
-0.3206915, -1.070118, -3.12744, 0, 1, 0.3764706, 1,
-0.3182856, 0.03418948, -2.967943, 0, 1, 0.3803922, 1,
-0.3180756, -1.100619, -2.331693, 0, 1, 0.3882353, 1,
-0.3145845, 1.401914, -0.3187947, 0, 1, 0.3921569, 1,
-0.3128301, 1.370079, 0.929697, 0, 1, 0.4, 1,
-0.3126844, 0.290147, -0.791602, 0, 1, 0.4078431, 1,
-0.312002, -1.691589, -1.349121, 0, 1, 0.4117647, 1,
-0.3097018, 0.01122077, -2.959563, 0, 1, 0.4196078, 1,
-0.302029, 0.4584586, -2.005986, 0, 1, 0.4235294, 1,
-0.2988075, -0.4333878, -2.384417, 0, 1, 0.4313726, 1,
-0.297531, 0.001471506, -1.023055, 0, 1, 0.4352941, 1,
-0.2942129, -0.01686836, -1.686626, 0, 1, 0.4431373, 1,
-0.2871259, -0.7536525, -1.446356, 0, 1, 0.4470588, 1,
-0.2863934, 0.2274659, 0.7641004, 0, 1, 0.454902, 1,
-0.2856935, 0.7292001, -0.06769221, 0, 1, 0.4588235, 1,
-0.2790124, 1.135484, 0.717871, 0, 1, 0.4666667, 1,
-0.2752083, -0.2092416, -2.697431, 0, 1, 0.4705882, 1,
-0.2676305, -1.159837, -2.555111, 0, 1, 0.4784314, 1,
-0.2619173, 0.1219308, -2.298809, 0, 1, 0.4823529, 1,
-0.2612168, 0.9595528, -0.4823968, 0, 1, 0.4901961, 1,
-0.2602949, -0.8295724, -3.096107, 0, 1, 0.4941176, 1,
-0.2601798, -0.9083423, -3.395428, 0, 1, 0.5019608, 1,
-0.2600505, -2.587125, -2.322646, 0, 1, 0.509804, 1,
-0.2574205, 0.3754932, -0.3391016, 0, 1, 0.5137255, 1,
-0.256997, 0.3487775, -0.2556346, 0, 1, 0.5215687, 1,
-0.2567487, -0.269803, -1.89772, 0, 1, 0.5254902, 1,
-0.255376, -1.096123, -3.709804, 0, 1, 0.5333334, 1,
-0.2550493, 1.17103, -1.084391, 0, 1, 0.5372549, 1,
-0.2536845, -0.8423964, -4.119925, 0, 1, 0.5450981, 1,
-0.2525228, 0.5299834, -0.2741451, 0, 1, 0.5490196, 1,
-0.2518719, 0.4640505, -0.1456335, 0, 1, 0.5568628, 1,
-0.2478933, -0.5545242, -3.438764, 0, 1, 0.5607843, 1,
-0.2421353, 1.185398, -0.1648413, 0, 1, 0.5686275, 1,
-0.2360245, 0.9008049, -0.5328134, 0, 1, 0.572549, 1,
-0.2334451, -0.04057922, -3.364993, 0, 1, 0.5803922, 1,
-0.2309217, -0.8295467, -3.389213, 0, 1, 0.5843138, 1,
-0.2238118, 0.805476, -1.346505, 0, 1, 0.5921569, 1,
-0.2218005, 0.8677486, -0.274832, 0, 1, 0.5960785, 1,
-0.217714, 0.267588, -2.622655, 0, 1, 0.6039216, 1,
-0.2171296, -1.630377, -2.851422, 0, 1, 0.6117647, 1,
-0.2143966, -0.6000482, -3.10596, 0, 1, 0.6156863, 1,
-0.2125057, -0.5517495, -2.948105, 0, 1, 0.6235294, 1,
-0.2117082, 0.5967532, 0.2495824, 0, 1, 0.627451, 1,
-0.2113397, -0.3966177, -2.939707, 0, 1, 0.6352941, 1,
-0.2103127, -1.472264, -2.788371, 0, 1, 0.6392157, 1,
-0.208588, 1.422895, -1.389597, 0, 1, 0.6470588, 1,
-0.198428, -0.6429546, -3.920029, 0, 1, 0.6509804, 1,
-0.1957025, 0.128663, 0.8918227, 0, 1, 0.6588235, 1,
-0.1859852, 2.08077, 0.511412, 0, 1, 0.6627451, 1,
-0.1831583, -0.6410744, -4.416572, 0, 1, 0.6705883, 1,
-0.1786615, 1.56552, -0.9282761, 0, 1, 0.6745098, 1,
-0.1742289, 0.6069685, -0.3348971, 0, 1, 0.682353, 1,
-0.1716882, 0.003974195, -1.911743, 0, 1, 0.6862745, 1,
-0.1690505, 1.953576, -0.5618915, 0, 1, 0.6941177, 1,
-0.165546, 0.4882928, -1.125019, 0, 1, 0.7019608, 1,
-0.1634864, -1.052558, -3.691282, 0, 1, 0.7058824, 1,
-0.1614344, 1.22886, 1.474511, 0, 1, 0.7137255, 1,
-0.1590673, -0.08253317, -2.82704, 0, 1, 0.7176471, 1,
-0.1531406, 1.29655, -0.2906139, 0, 1, 0.7254902, 1,
-0.1523572, 1.292257, 0.1860216, 0, 1, 0.7294118, 1,
-0.150593, -0.264991, -1.236857, 0, 1, 0.7372549, 1,
-0.1485465, 0.2436888, -0.0005398782, 0, 1, 0.7411765, 1,
-0.1463871, 0.1549536, -0.4451374, 0, 1, 0.7490196, 1,
-0.1462984, 0.07590643, -1.918726, 0, 1, 0.7529412, 1,
-0.1415264, 0.8067074, -1.303493, 0, 1, 0.7607843, 1,
-0.1340153, 1.727208, 0.4517287, 0, 1, 0.7647059, 1,
-0.1323266, 1.037746, -0.008064719, 0, 1, 0.772549, 1,
-0.1314054, -0.9464505, -2.358868, 0, 1, 0.7764706, 1,
-0.1313079, -0.1640188, -2.170899, 0, 1, 0.7843137, 1,
-0.1285891, 1.754706, 0.7763761, 0, 1, 0.7882353, 1,
-0.1270692, 0.8573897, 0.4108454, 0, 1, 0.7960784, 1,
-0.1251909, 0.2926333, -1.367597, 0, 1, 0.8039216, 1,
-0.1218765, -0.7705825, -3.114288, 0, 1, 0.8078431, 1,
-0.1175478, 0.2565404, 0.9655243, 0, 1, 0.8156863, 1,
-0.1148736, -1.475066, -2.037812, 0, 1, 0.8196079, 1,
-0.1113414, 0.3245169, -0.8921915, 0, 1, 0.827451, 1,
-0.1102346, -0.2884022, -1.897202, 0, 1, 0.8313726, 1,
-0.1101703, -0.2853017, -4.265703, 0, 1, 0.8392157, 1,
-0.1095577, 1.427327, 1.498203, 0, 1, 0.8431373, 1,
-0.1093242, -0.7510139, -4.02783, 0, 1, 0.8509804, 1,
-0.1064392, 1.276467, 0.197767, 0, 1, 0.854902, 1,
-0.1060173, -0.9642608, -3.959552, 0, 1, 0.8627451, 1,
-0.1055819, -0.3289963, -3.913444, 0, 1, 0.8666667, 1,
-0.09926039, 0.8381869, 0.929097, 0, 1, 0.8745098, 1,
-0.09764414, 0.5525536, 0.55778, 0, 1, 0.8784314, 1,
-0.09645342, 0.336199, -0.01339489, 0, 1, 0.8862745, 1,
-0.09098469, -1.179414, -2.76362, 0, 1, 0.8901961, 1,
-0.08751236, -1.098901, -4.20023, 0, 1, 0.8980392, 1,
-0.0871371, 0.122478, -2.102016, 0, 1, 0.9058824, 1,
-0.08704918, -0.5707828, -4.102657, 0, 1, 0.9098039, 1,
-0.08611168, 0.3497587, -1.105386, 0, 1, 0.9176471, 1,
-0.08405507, 1.056336, -0.9533006, 0, 1, 0.9215686, 1,
-0.08351355, 0.4249119, -0.4394318, 0, 1, 0.9294118, 1,
-0.07908737, -0.8313543, -1.89792, 0, 1, 0.9333333, 1,
-0.07675195, -0.5501888, -3.447667, 0, 1, 0.9411765, 1,
-0.07664356, 2.507761, -0.1071287, 0, 1, 0.945098, 1,
-0.0717453, -1.025593, -2.756205, 0, 1, 0.9529412, 1,
-0.07138217, 0.657161, 0.9185857, 0, 1, 0.9568627, 1,
-0.07072733, -1.727601, -3.44056, 0, 1, 0.9647059, 1,
-0.06919247, 0.5200751, 0.169568, 0, 1, 0.9686275, 1,
-0.06507009, -0.4257067, -4.972519, 0, 1, 0.9764706, 1,
-0.06114868, 1.090587, 0.6858262, 0, 1, 0.9803922, 1,
-0.05988577, 0.04831166, 0.2320428, 0, 1, 0.9882353, 1,
-0.05566965, -0.09478645, -3.047191, 0, 1, 0.9921569, 1,
-0.05434779, 0.2036061, 1.432658, 0, 1, 1, 1,
-0.05166784, 0.4165295, -1.207947, 0, 0.9921569, 1, 1,
-0.05104474, -0.8047601, -4.512995, 0, 0.9882353, 1, 1,
-0.04808064, -0.1014171, -4.275599, 0, 0.9803922, 1, 1,
-0.04790566, -0.9779705, -2.699535, 0, 0.9764706, 1, 1,
-0.04780554, -0.8497205, -3.229146, 0, 0.9686275, 1, 1,
-0.04548934, -1.984325, -3.113706, 0, 0.9647059, 1, 1,
-0.04493733, -1.283756, -3.498415, 0, 0.9568627, 1, 1,
-0.04178592, 1.099121, -0.725481, 0, 0.9529412, 1, 1,
-0.04052134, -0.8672419, -3.431737, 0, 0.945098, 1, 1,
-0.04030946, -0.4939034, -4.863904, 0, 0.9411765, 1, 1,
-0.03693086, -1.791107, -2.536001, 0, 0.9333333, 1, 1,
-0.03411189, 0.8189515, -1.745247, 0, 0.9294118, 1, 1,
-0.03256894, 0.1695523, 0.649909, 0, 0.9215686, 1, 1,
-0.02877853, -0.2259178, -2.301003, 0, 0.9176471, 1, 1,
-0.02523224, -0.2022351, -4.747446, 0, 0.9098039, 1, 1,
-0.02325564, -0.1254238, -1.787822, 0, 0.9058824, 1, 1,
-0.02122785, 0.832039, -0.3062224, 0, 0.8980392, 1, 1,
-0.02120921, 0.4107839, -0.2689996, 0, 0.8901961, 1, 1,
-0.02036155, 1.760506, 0.7154897, 0, 0.8862745, 1, 1,
-0.009621291, 1.069614, 0.8756524, 0, 0.8784314, 1, 1,
-0.00633969, -0.9489099, -2.384591, 0, 0.8745098, 1, 1,
-0.002584496, -0.07914168, -3.490484, 0, 0.8666667, 1, 1,
0.001374948, 0.5889871, 1.365272, 0, 0.8627451, 1, 1,
0.003905268, -1.858455, 3.161175, 0, 0.854902, 1, 1,
0.008927647, 0.04247806, -0.6472366, 0, 0.8509804, 1, 1,
0.01009624, 1.921733, -1.446334, 0, 0.8431373, 1, 1,
0.01336616, 0.3606412, -1.203111, 0, 0.8392157, 1, 1,
0.01369987, -2.374351, 4.476399, 0, 0.8313726, 1, 1,
0.01603379, -0.06875002, 1.058623, 0, 0.827451, 1, 1,
0.0162818, -0.4066403, 3.091632, 0, 0.8196079, 1, 1,
0.0173356, -2.403759, 5.123474, 0, 0.8156863, 1, 1,
0.02603107, 0.8242267, -0.6655241, 0, 0.8078431, 1, 1,
0.03020286, 2.740374, 1.005939, 0, 0.8039216, 1, 1,
0.03054004, 1.479487, 1.924212, 0, 0.7960784, 1, 1,
0.03310888, 0.06818382, 0.08818019, 0, 0.7882353, 1, 1,
0.03594765, 0.5567313, 1.556711, 0, 0.7843137, 1, 1,
0.03869354, -0.7836491, 1.90576, 0, 0.7764706, 1, 1,
0.04312559, 0.9013002, 0.9162119, 0, 0.772549, 1, 1,
0.04747166, -0.8042622, 4.346506, 0, 0.7647059, 1, 1,
0.05984279, 1.106626, 0.3563542, 0, 0.7607843, 1, 1,
0.06239302, -0.7270085, 2.410835, 0, 0.7529412, 1, 1,
0.0626606, -0.7061467, 2.904917, 0, 0.7490196, 1, 1,
0.06680838, 0.2074267, 0.3835959, 0, 0.7411765, 1, 1,
0.06775642, -1.866031, 4.131729, 0, 0.7372549, 1, 1,
0.06863351, 0.6685929, -0.5807549, 0, 0.7294118, 1, 1,
0.06927922, -0.1143309, 2.608552, 0, 0.7254902, 1, 1,
0.0825237, -1.580193, 3.650431, 0, 0.7176471, 1, 1,
0.08404046, -0.8013038, 2.281524, 0, 0.7137255, 1, 1,
0.08570802, 1.100693, -0.3724129, 0, 0.7058824, 1, 1,
0.08652093, 1.130011, -0.7594216, 0, 0.6980392, 1, 1,
0.0881457, 0.6193576, 1.889425, 0, 0.6941177, 1, 1,
0.08877316, 0.1615106, 0.8316217, 0, 0.6862745, 1, 1,
0.08966009, 0.03389217, 1.216768, 0, 0.682353, 1, 1,
0.09160808, 0.8788127, 0.5178881, 0, 0.6745098, 1, 1,
0.09252542, -0.5456981, 1.615638, 0, 0.6705883, 1, 1,
0.09272011, -1.481006, 2.054299, 0, 0.6627451, 1, 1,
0.0981327, -1.314723, 2.660783, 0, 0.6588235, 1, 1,
0.0982611, 0.1149404, 1.501157, 0, 0.6509804, 1, 1,
0.1014969, 0.6831101, 0.201306, 0, 0.6470588, 1, 1,
0.1027493, 0.1236258, -1.607216, 0, 0.6392157, 1, 1,
0.1075306, 0.06236628, 1.157179, 0, 0.6352941, 1, 1,
0.1088658, -0.3127786, 2.840283, 0, 0.627451, 1, 1,
0.1148059, 0.7029243, 1.434074, 0, 0.6235294, 1, 1,
0.1178527, 0.008217885, 1.675731, 0, 0.6156863, 1, 1,
0.1179855, -0.3702224, 1.881922, 0, 0.6117647, 1, 1,
0.1206463, 0.3618671, -0.3328165, 0, 0.6039216, 1, 1,
0.1212902, 0.6329157, 0.3137013, 0, 0.5960785, 1, 1,
0.1254168, -0.7036178, 4.23374, 0, 0.5921569, 1, 1,
0.1300425, 0.6539624, -0.02094371, 0, 0.5843138, 1, 1,
0.1336666, 1.789411, -0.4796581, 0, 0.5803922, 1, 1,
0.1360143, 0.2107135, 0.5232772, 0, 0.572549, 1, 1,
0.1369579, -2.108521, 2.911339, 0, 0.5686275, 1, 1,
0.1381368, -0.5880033, 3.175942, 0, 0.5607843, 1, 1,
0.1392712, 0.2536705, 1.865553, 0, 0.5568628, 1, 1,
0.1447688, 0.3015771, 0.3828421, 0, 0.5490196, 1, 1,
0.1466285, 0.7867082, -0.505025, 0, 0.5450981, 1, 1,
0.1491057, 1.334866, -0.8603153, 0, 0.5372549, 1, 1,
0.1529966, -1.646536, 4.252994, 0, 0.5333334, 1, 1,
0.1557853, -0.6412441, 3.890018, 0, 0.5254902, 1, 1,
0.1625288, -0.7159197, 2.464499, 0, 0.5215687, 1, 1,
0.1627038, -1.064031, 1.259536, 0, 0.5137255, 1, 1,
0.1650729, 0.2943633, -0.1857205, 0, 0.509804, 1, 1,
0.1672453, -0.108328, 3.630846, 0, 0.5019608, 1, 1,
0.1682349, 0.3946341, -0.3217453, 0, 0.4941176, 1, 1,
0.1700988, -0.6238596, 2.806653, 0, 0.4901961, 1, 1,
0.1712496, 0.2410659, 0.2380276, 0, 0.4823529, 1, 1,
0.1748186, -0.09972738, 2.171434, 0, 0.4784314, 1, 1,
0.1750304, 1.477948, 0.2699083, 0, 0.4705882, 1, 1,
0.1765127, -0.322918, 2.341484, 0, 0.4666667, 1, 1,
0.1816497, -0.1421203, 1.008852, 0, 0.4588235, 1, 1,
0.1840393, -0.9173121, 1.386031, 0, 0.454902, 1, 1,
0.1870849, 0.5229077, 0.1008605, 0, 0.4470588, 1, 1,
0.1915356, 0.8724088, 1.153663, 0, 0.4431373, 1, 1,
0.1939298, 0.02031033, 1.533943, 0, 0.4352941, 1, 1,
0.1988502, 0.6352937, 0.4333054, 0, 0.4313726, 1, 1,
0.2007188, -0.2598377, 2.805597, 0, 0.4235294, 1, 1,
0.2028349, 2.61256, -1.91041, 0, 0.4196078, 1, 1,
0.2047427, -0.2522839, 4.002192, 0, 0.4117647, 1, 1,
0.207222, 0.8687241, -0.2475939, 0, 0.4078431, 1, 1,
0.2199225, -1.208322, 2.289132, 0, 0.4, 1, 1,
0.2228771, -0.2451616, 2.61748, 0, 0.3921569, 1, 1,
0.2236751, -1.113798, 3.79871, 0, 0.3882353, 1, 1,
0.2254868, -0.9334491, 3.756372, 0, 0.3803922, 1, 1,
0.2274698, 0.01432805, 1.640077, 0, 0.3764706, 1, 1,
0.2288792, 0.9626577, 0.9516288, 0, 0.3686275, 1, 1,
0.2329236, 0.6116981, 0.3671007, 0, 0.3647059, 1, 1,
0.232948, 0.108939, 0.5547159, 0, 0.3568628, 1, 1,
0.2380355, -0.1087192, 1.882357, 0, 0.3529412, 1, 1,
0.238388, 1.716155, -0.17612, 0, 0.345098, 1, 1,
0.2397477, -0.337062, 2.889641, 0, 0.3411765, 1, 1,
0.2412156, -0.4197972, 3.835472, 0, 0.3333333, 1, 1,
0.2451757, -1.444606, 5.211182, 0, 0.3294118, 1, 1,
0.2462747, -2.143431, 2.410259, 0, 0.3215686, 1, 1,
0.2482722, 0.3839557, 0.5853199, 0, 0.3176471, 1, 1,
0.250947, -1.748827, 1.948814, 0, 0.3098039, 1, 1,
0.251282, -1.430135, 1.098063, 0, 0.3058824, 1, 1,
0.2516385, -1.106657, 3.556306, 0, 0.2980392, 1, 1,
0.2522011, -0.1721379, 2.761703, 0, 0.2901961, 1, 1,
0.2562498, 0.5915729, -0.05956353, 0, 0.2862745, 1, 1,
0.2567612, -2.382378, 3.375099, 0, 0.2784314, 1, 1,
0.2570808, 0.7146156, 0.1754303, 0, 0.2745098, 1, 1,
0.2575269, 1.367568, 0.3172683, 0, 0.2666667, 1, 1,
0.2577484, 0.7249567, -1.712092, 0, 0.2627451, 1, 1,
0.2609694, -2.434311, 2.901168, 0, 0.254902, 1, 1,
0.261703, 0.9733154, 0.2495883, 0, 0.2509804, 1, 1,
0.2646561, -2.327114, 3.022724, 0, 0.2431373, 1, 1,
0.2694852, -0.1155309, 2.240549, 0, 0.2392157, 1, 1,
0.2709247, 0.354466, 2.575872, 0, 0.2313726, 1, 1,
0.272558, -0.07190479, 2.112959, 0, 0.227451, 1, 1,
0.2740167, -0.9489198, 3.129107, 0, 0.2196078, 1, 1,
0.2752202, -1.061792, 3.666249, 0, 0.2156863, 1, 1,
0.2771617, 0.7995644, 0.5516853, 0, 0.2078431, 1, 1,
0.277623, 0.4813564, -0.2324754, 0, 0.2039216, 1, 1,
0.2793756, -2.818064, 3.979364, 0, 0.1960784, 1, 1,
0.2824153, -0.4739159, 2.583646, 0, 0.1882353, 1, 1,
0.2873098, -0.5047663, 2.250482, 0, 0.1843137, 1, 1,
0.2891633, -0.3696961, 3.418724, 0, 0.1764706, 1, 1,
0.2892967, 0.9188249, 1.126272, 0, 0.172549, 1, 1,
0.2931617, -0.2001653, 2.033408, 0, 0.1647059, 1, 1,
0.2948923, 1.04828, -0.6914539, 0, 0.1607843, 1, 1,
0.2957259, 0.3764072, -0.636347, 0, 0.1529412, 1, 1,
0.296261, -0.6601772, 3.2519, 0, 0.1490196, 1, 1,
0.300053, 0.7796162, 0.8366762, 0, 0.1411765, 1, 1,
0.3013433, 0.3808586, 0.1079289, 0, 0.1372549, 1, 1,
0.3049578, -0.894576, 3.620601, 0, 0.1294118, 1, 1,
0.3166945, 1.164501, -0.7586491, 0, 0.1254902, 1, 1,
0.3217811, 0.533372, -0.09844627, 0, 0.1176471, 1, 1,
0.3232363, 0.8920054, 0.6149134, 0, 0.1137255, 1, 1,
0.3233163, -0.4504453, 1.035334, 0, 0.1058824, 1, 1,
0.3287455, -0.9382927, 3.275713, 0, 0.09803922, 1, 1,
0.3327561, 0.870017, 0.05121962, 0, 0.09411765, 1, 1,
0.333902, 0.879437, 1.454918, 0, 0.08627451, 1, 1,
0.3340002, 1.328005, 0.127357, 0, 0.08235294, 1, 1,
0.335157, -0.3584883, 1.92738, 0, 0.07450981, 1, 1,
0.3369344, 0.1589832, 1.482349, 0, 0.07058824, 1, 1,
0.3384321, 0.8286037, 0.2985733, 0, 0.0627451, 1, 1,
0.3411899, -0.223175, 3.00457, 0, 0.05882353, 1, 1,
0.3423978, 0.6203908, 0.5583345, 0, 0.05098039, 1, 1,
0.3523688, 0.378684, -1.455092, 0, 0.04705882, 1, 1,
0.3547909, -0.2424936, 1.008514, 0, 0.03921569, 1, 1,
0.357413, 0.2219866, 3.119769, 0, 0.03529412, 1, 1,
0.3655186, 0.03170293, 0.322066, 0, 0.02745098, 1, 1,
0.3661518, 0.5334082, -0.4143096, 0, 0.02352941, 1, 1,
0.3679926, 0.6227844, 0.4300655, 0, 0.01568628, 1, 1,
0.3688778, 0.765872, -0.4187396, 0, 0.01176471, 1, 1,
0.3692428, -0.098887, 1.173113, 0, 0.003921569, 1, 1,
0.3732738, -0.5897242, 4.114162, 0.003921569, 0, 1, 1,
0.3787269, -0.006903629, 3.09986, 0.007843138, 0, 1, 1,
0.3828094, 0.2788431, 2.181946, 0.01568628, 0, 1, 1,
0.387019, -0.2867903, 0.6654086, 0.01960784, 0, 1, 1,
0.388372, 0.5914428, 0.6760755, 0.02745098, 0, 1, 1,
0.3943101, 0.2858504, -0.008751694, 0.03137255, 0, 1, 1,
0.396034, 0.3402223, -1.254419, 0.03921569, 0, 1, 1,
0.3965459, -0.2660041, 3.847578, 0.04313726, 0, 1, 1,
0.3973024, 0.9928811, -0.9340437, 0.05098039, 0, 1, 1,
0.4012785, -0.4526813, 0.914795, 0.05490196, 0, 1, 1,
0.4051602, -1.580208, 2.149157, 0.0627451, 0, 1, 1,
0.4073797, 1.05646, 0.9886822, 0.06666667, 0, 1, 1,
0.4097234, -0.955121, 1.650609, 0.07450981, 0, 1, 1,
0.4097447, -1.987168, 2.901026, 0.07843138, 0, 1, 1,
0.412096, 0.7235482, 0.8889316, 0.08627451, 0, 1, 1,
0.4138217, 0.144285, -0.3241121, 0.09019608, 0, 1, 1,
0.4157395, 1.437619, -2.151611, 0.09803922, 0, 1, 1,
0.4159748, 2.307651, -1.065374, 0.1058824, 0, 1, 1,
0.4172931, -0.1140781, 0.8891596, 0.1098039, 0, 1, 1,
0.4200405, -0.08470684, 2.591767, 0.1176471, 0, 1, 1,
0.4202881, -0.7652841, 4.410269, 0.1215686, 0, 1, 1,
0.4221924, -1.07038, 1.338348, 0.1294118, 0, 1, 1,
0.4228873, -0.3713306, 3.058068, 0.1333333, 0, 1, 1,
0.4298654, -0.3921669, 1.124759, 0.1411765, 0, 1, 1,
0.4434059, -0.8991269, 4.292805, 0.145098, 0, 1, 1,
0.4467787, -0.4678694, 3.161194, 0.1529412, 0, 1, 1,
0.4469241, -0.3040669, 2.947432, 0.1568628, 0, 1, 1,
0.4502227, 0.7791071, -1.247787, 0.1647059, 0, 1, 1,
0.452732, -0.2611132, 1.885254, 0.1686275, 0, 1, 1,
0.453437, -0.6667827, 2.564291, 0.1764706, 0, 1, 1,
0.4638162, -0.4607963, 2.022339, 0.1803922, 0, 1, 1,
0.4645602, 0.827768, 1.037513, 0.1882353, 0, 1, 1,
0.4671267, 0.7750642, 0.6986869, 0.1921569, 0, 1, 1,
0.4702253, 2.168089, -0.2508835, 0.2, 0, 1, 1,
0.4749762, -1.334903, 4.109482, 0.2078431, 0, 1, 1,
0.4759626, -0.3223569, 3.172931, 0.2117647, 0, 1, 1,
0.4803474, -0.6202131, 3.22926, 0.2196078, 0, 1, 1,
0.4833467, 0.0550088, 0.679428, 0.2235294, 0, 1, 1,
0.4853092, 1.286169, 0.3613602, 0.2313726, 0, 1, 1,
0.4865839, -2.204187, 2.857933, 0.2352941, 0, 1, 1,
0.4873891, -0.2987828, 2.654656, 0.2431373, 0, 1, 1,
0.4904288, 0.8180742, 2.186252, 0.2470588, 0, 1, 1,
0.4911456, -0.3521381, 1.465435, 0.254902, 0, 1, 1,
0.5069875, 0.1673699, 2.234189, 0.2588235, 0, 1, 1,
0.5173753, 1.527442, 0.07062225, 0.2666667, 0, 1, 1,
0.5205962, -0.7907486, 3.00627, 0.2705882, 0, 1, 1,
0.5209672, -0.851032, 3.822915, 0.2784314, 0, 1, 1,
0.5216134, -1.050137, 4.62575, 0.282353, 0, 1, 1,
0.5229135, -0.06873096, 1.16569, 0.2901961, 0, 1, 1,
0.5231723, -0.6397145, 0.9246451, 0.2941177, 0, 1, 1,
0.5298315, -0.1156402, 2.346817, 0.3019608, 0, 1, 1,
0.5309377, 0.1385759, 1.90734, 0.3098039, 0, 1, 1,
0.5344355, 0.0874844, 0.04096479, 0.3137255, 0, 1, 1,
0.5399097, 0.06586313, 2.357881, 0.3215686, 0, 1, 1,
0.542851, 0.6202009, -0.692, 0.3254902, 0, 1, 1,
0.5470318, -1.047036, 0.6220655, 0.3333333, 0, 1, 1,
0.5560944, 0.6055781, 0.3801691, 0.3372549, 0, 1, 1,
0.5597202, 0.2465886, 1.074289, 0.345098, 0, 1, 1,
0.5618426, -0.1711603, 0.6298318, 0.3490196, 0, 1, 1,
0.561942, -0.1122666, 2.653167, 0.3568628, 0, 1, 1,
0.5649194, -1.303255, 1.343896, 0.3607843, 0, 1, 1,
0.5662025, -1.132229, 2.973887, 0.3686275, 0, 1, 1,
0.566935, -0.07757734, 1.003335, 0.372549, 0, 1, 1,
0.571102, 0.4984702, 0.2219432, 0.3803922, 0, 1, 1,
0.5716681, 0.3522441, 1.692761, 0.3843137, 0, 1, 1,
0.5907661, 2.760402, -0.1107928, 0.3921569, 0, 1, 1,
0.5952769, 0.1265454, 1.279032, 0.3960784, 0, 1, 1,
0.5997146, -3.669289, 3.485985, 0.4039216, 0, 1, 1,
0.6002123, -1.498874, 2.461669, 0.4117647, 0, 1, 1,
0.6062136, 0.2347715, 1.042397, 0.4156863, 0, 1, 1,
0.6096858, -0.620892, 2.045525, 0.4235294, 0, 1, 1,
0.6144144, -1.342065, 3.468313, 0.427451, 0, 1, 1,
0.6162829, -1.05517, 2.853125, 0.4352941, 0, 1, 1,
0.6244408, 0.9399829, -0.8838388, 0.4392157, 0, 1, 1,
0.6258532, -0.8981342, 1.460943, 0.4470588, 0, 1, 1,
0.6397402, -0.6989068, 2.186307, 0.4509804, 0, 1, 1,
0.6416098, -0.005596403, 1.993133, 0.4588235, 0, 1, 1,
0.6416163, 0.1505369, 3.865805, 0.4627451, 0, 1, 1,
0.6543093, 1.954903, 0.3743213, 0.4705882, 0, 1, 1,
0.6549917, 0.5982343, 1.427248, 0.4745098, 0, 1, 1,
0.6551791, -0.354146, 2.857234, 0.4823529, 0, 1, 1,
0.6573799, 1.064759, 0.9745997, 0.4862745, 0, 1, 1,
0.6649816, 1.115756, -0.3728915, 0.4941176, 0, 1, 1,
0.6655478, 0.1102024, 1.25116, 0.5019608, 0, 1, 1,
0.6700046, 0.3019392, 0.7537628, 0.5058824, 0, 1, 1,
0.6725448, 0.4372179, -0.4371182, 0.5137255, 0, 1, 1,
0.6728889, 0.0679905, 0.3965202, 0.5176471, 0, 1, 1,
0.6769565, 0.8828745, 0.9907634, 0.5254902, 0, 1, 1,
0.6781929, -0.4691528, 2.179199, 0.5294118, 0, 1, 1,
0.6800793, 1.816082, -0.273011, 0.5372549, 0, 1, 1,
0.681384, 0.6911103, 1.0502, 0.5411765, 0, 1, 1,
0.6833827, -0.4053924, 0.2205184, 0.5490196, 0, 1, 1,
0.6898855, -0.5938362, 3.238994, 0.5529412, 0, 1, 1,
0.6945526, -1.169742, 3.056272, 0.5607843, 0, 1, 1,
0.6948166, -0.5914221, 3.235312, 0.5647059, 0, 1, 1,
0.6952326, -0.3237721, 2.37086, 0.572549, 0, 1, 1,
0.6953277, 0.1292712, 1.126639, 0.5764706, 0, 1, 1,
0.6975125, -1.154535, 2.06878, 0.5843138, 0, 1, 1,
0.7076416, -1.1838, 3.524419, 0.5882353, 0, 1, 1,
0.7213129, -0.3819618, 1.991832, 0.5960785, 0, 1, 1,
0.7222083, 0.8674846, 0.02953326, 0.6039216, 0, 1, 1,
0.7248908, -0.06016178, 2.321262, 0.6078432, 0, 1, 1,
0.7257887, -0.2528363, 0.9870197, 0.6156863, 0, 1, 1,
0.7434038, -1.370334, 2.902516, 0.6196079, 0, 1, 1,
0.747199, 0.2406479, 1.580449, 0.627451, 0, 1, 1,
0.7539517, -0.3956747, 2.675005, 0.6313726, 0, 1, 1,
0.7544783, -1.362483, 4.051116, 0.6392157, 0, 1, 1,
0.7567009, -0.2913896, 1.260034, 0.6431373, 0, 1, 1,
0.7624542, -1.034723, 1.718614, 0.6509804, 0, 1, 1,
0.7659779, 0.5199941, 2.229171, 0.654902, 0, 1, 1,
0.7661102, 0.1859338, 2.474652, 0.6627451, 0, 1, 1,
0.7698016, 0.6185818, 0.2285695, 0.6666667, 0, 1, 1,
0.7773525, -1.268124, 2.489192, 0.6745098, 0, 1, 1,
0.7780737, 0.4594204, 1.57994, 0.6784314, 0, 1, 1,
0.7783701, -0.1953858, 3.914765, 0.6862745, 0, 1, 1,
0.7821184, -0.1661812, 1.927739, 0.6901961, 0, 1, 1,
0.7881382, 0.3641722, 1.152429, 0.6980392, 0, 1, 1,
0.801572, -0.9384611, 2.840585, 0.7058824, 0, 1, 1,
0.8043395, 0.287416, -0.4839921, 0.7098039, 0, 1, 1,
0.806116, -0.3198695, 2.600699, 0.7176471, 0, 1, 1,
0.8133529, 0.2141633, 0.7742807, 0.7215686, 0, 1, 1,
0.8198743, 0.1767464, 2.22858, 0.7294118, 0, 1, 1,
0.8255644, 0.8701316, 0.2593705, 0.7333333, 0, 1, 1,
0.8282853, 0.6180784, 1.917007, 0.7411765, 0, 1, 1,
0.8346412, 1.213567, 1.666773, 0.7450981, 0, 1, 1,
0.8411475, 0.1608158, 2.610943, 0.7529412, 0, 1, 1,
0.8431621, -2.586891, 1.915299, 0.7568628, 0, 1, 1,
0.8480359, 2.11221, -0.2010092, 0.7647059, 0, 1, 1,
0.8490461, 0.3163545, 3.578166, 0.7686275, 0, 1, 1,
0.8513706, 0.5173906, 1.177576, 0.7764706, 0, 1, 1,
0.8518853, 0.4038432, 3.466681, 0.7803922, 0, 1, 1,
0.8522467, -0.7926783, 3.16026, 0.7882353, 0, 1, 1,
0.8534419, -0.6535013, 2.154018, 0.7921569, 0, 1, 1,
0.8558605, -0.299737, 0.6964847, 0.8, 0, 1, 1,
0.8624023, -0.4500704, 1.853808, 0.8078431, 0, 1, 1,
0.8637571, 0.8203034, 1.82596, 0.8117647, 0, 1, 1,
0.8790629, 0.1167797, 0.7182006, 0.8196079, 0, 1, 1,
0.8803367, -0.6381752, 1.597083, 0.8235294, 0, 1, 1,
0.8812014, 1.176519, 1.353248, 0.8313726, 0, 1, 1,
0.8821644, 1.260713, -0.1720259, 0.8352941, 0, 1, 1,
0.8888414, 0.6993965, -0.005269072, 0.8431373, 0, 1, 1,
0.8907215, -0.7568665, 2.545576, 0.8470588, 0, 1, 1,
0.8909319, -1.781911, 0.4883247, 0.854902, 0, 1, 1,
0.8964844, -0.98129, 1.142594, 0.8588235, 0, 1, 1,
0.8981905, -0.2777353, 1.561117, 0.8666667, 0, 1, 1,
0.9053665, -1.525213, 2.46414, 0.8705882, 0, 1, 1,
0.9097197, -1.224747, 2.449481, 0.8784314, 0, 1, 1,
0.9241618, -1.637893, 2.177408, 0.8823529, 0, 1, 1,
0.9267379, 1.443414, 0.1839141, 0.8901961, 0, 1, 1,
0.9276066, 2.521753, 1.498598, 0.8941177, 0, 1, 1,
0.9319787, 0.44246, 1.746491, 0.9019608, 0, 1, 1,
0.9333878, -0.4121919, 0.9460258, 0.9098039, 0, 1, 1,
0.9365888, -1.277211, 2.405285, 0.9137255, 0, 1, 1,
0.9443728, 0.8053244, 1.930393, 0.9215686, 0, 1, 1,
0.9487465, -0.3092957, 4.674335, 0.9254902, 0, 1, 1,
0.9487963, -0.02820151, 1.501697, 0.9333333, 0, 1, 1,
0.9501472, 0.6248595, 0.9670173, 0.9372549, 0, 1, 1,
0.9518142, -0.7935117, 0.4232363, 0.945098, 0, 1, 1,
0.953486, 2.068426, 1.531082, 0.9490196, 0, 1, 1,
0.9604756, 2.169494, 0.5464159, 0.9568627, 0, 1, 1,
0.9617675, 0.3614895, 1.889519, 0.9607843, 0, 1, 1,
0.9629996, 0.2434806, 0.8493028, 0.9686275, 0, 1, 1,
0.9647842, -0.3825501, 1.563051, 0.972549, 0, 1, 1,
0.9670591, -0.9082716, 3.41561, 0.9803922, 0, 1, 1,
0.9680226, -0.781477, 2.296733, 0.9843137, 0, 1, 1,
0.9707811, 0.6693637, 1.350387, 0.9921569, 0, 1, 1,
0.9763971, 0.2178087, 1.799883, 0.9960784, 0, 1, 1,
0.9779019, -1.15249, 2.142377, 1, 0, 0.9960784, 1,
0.9804215, -0.1117333, 2.224347, 1, 0, 0.9882353, 1,
0.9893988, -1.888457, 2.639112, 1, 0, 0.9843137, 1,
0.9923295, 0.5838223, 1.51921, 1, 0, 0.9764706, 1,
0.9927461, 0.2295371, 2.341519, 1, 0, 0.972549, 1,
0.995935, 1.279711, 1.717359, 1, 0, 0.9647059, 1,
1.002945, -0.07245278, 1.802608, 1, 0, 0.9607843, 1,
1.002981, -0.2429319, 1.19997, 1, 0, 0.9529412, 1,
1.003895, 0.3872778, 2.06443, 1, 0, 0.9490196, 1,
1.013707, -0.6485925, 0.7975311, 1, 0, 0.9411765, 1,
1.019856, 0.7137341, 1.977885, 1, 0, 0.9372549, 1,
1.020026, 0.6819263, 0.1262474, 1, 0, 0.9294118, 1,
1.022626, 0.6767207, 1.497806, 1, 0, 0.9254902, 1,
1.025669, 0.4476771, 1.840566, 1, 0, 0.9176471, 1,
1.026175, -0.9708341, 2.894922, 1, 0, 0.9137255, 1,
1.029655, 0.3313695, 2.896816, 1, 0, 0.9058824, 1,
1.039076, -0.675945, 3.732702, 1, 0, 0.9019608, 1,
1.043058, -0.6517742, 1.678742, 1, 0, 0.8941177, 1,
1.04404, -0.2221749, 4.198616, 1, 0, 0.8862745, 1,
1.048608, 0.2871357, 1.693037, 1, 0, 0.8823529, 1,
1.051508, -0.5392545, 3.283062, 1, 0, 0.8745098, 1,
1.053528, -0.00412246, -0.4619943, 1, 0, 0.8705882, 1,
1.056036, 0.6607759, 1.022406, 1, 0, 0.8627451, 1,
1.076644, -1.815059, 2.406316, 1, 0, 0.8588235, 1,
1.080298, -0.2385971, -0.01159975, 1, 0, 0.8509804, 1,
1.084891, 0.3761445, 1.855082, 1, 0, 0.8470588, 1,
1.094284, -1.31168, 2.264318, 1, 0, 0.8392157, 1,
1.095974, -1.827234, 2.290543, 1, 0, 0.8352941, 1,
1.097211, 0.066437, 1.00514, 1, 0, 0.827451, 1,
1.09932, -2.267382, 1.549578, 1, 0, 0.8235294, 1,
1.10193, 0.6614257, 1.007357, 1, 0, 0.8156863, 1,
1.104509, -0.2426382, 1.187597, 1, 0, 0.8117647, 1,
1.108, 1.577103, -0.3808704, 1, 0, 0.8039216, 1,
1.112972, 0.04752276, 1.283286, 1, 0, 0.7960784, 1,
1.126039, 0.51054, -0.4288681, 1, 0, 0.7921569, 1,
1.130185, -1.150054, 1.564757, 1, 0, 0.7843137, 1,
1.133213, 0.04536732, 1.751601, 1, 0, 0.7803922, 1,
1.135537, -2.026188, 2.954113, 1, 0, 0.772549, 1,
1.139066, 1.519222, 1.618056, 1, 0, 0.7686275, 1,
1.146726, -0.1329052, 2.514404, 1, 0, 0.7607843, 1,
1.152783, 0.9609401, 1.796394, 1, 0, 0.7568628, 1,
1.154222, 0.1857846, 2.23899, 1, 0, 0.7490196, 1,
1.156943, 0.0766068, 1.61965, 1, 0, 0.7450981, 1,
1.160437, -0.0502492, 1.153318, 1, 0, 0.7372549, 1,
1.162392, -0.8902227, 1.421853, 1, 0, 0.7333333, 1,
1.163663, 0.9458265, 1.063755, 1, 0, 0.7254902, 1,
1.164112, 0.1828978, 0.9168298, 1, 0, 0.7215686, 1,
1.164803, -0.1986471, 0.5288841, 1, 0, 0.7137255, 1,
1.165765, 1.650805, 1.85084, 1, 0, 0.7098039, 1,
1.177137, 2.682206, 0.4696109, 1, 0, 0.7019608, 1,
1.177975, 1.185979, -0.2560677, 1, 0, 0.6941177, 1,
1.179847, -0.5118245, 2.421707, 1, 0, 0.6901961, 1,
1.185727, 1.678666, 0.8092074, 1, 0, 0.682353, 1,
1.194077, 1.767328, 0.456958, 1, 0, 0.6784314, 1,
1.196186, -1.397059, 1.722287, 1, 0, 0.6705883, 1,
1.197649, 1.383076, 0.05408266, 1, 0, 0.6666667, 1,
1.207268, 1.087587, 0.7783319, 1, 0, 0.6588235, 1,
1.2211, 0.1148812, 1.88599, 1, 0, 0.654902, 1,
1.22256, -1.914537, 4.17993, 1, 0, 0.6470588, 1,
1.230983, 0.2894693, 2.315458, 1, 0, 0.6431373, 1,
1.241923, 0.6254525, 1.781386, 1, 0, 0.6352941, 1,
1.241992, -0.1029911, 0.5079321, 1, 0, 0.6313726, 1,
1.248482, -1.387821, 3.619552, 1, 0, 0.6235294, 1,
1.250021, 0.05855354, 1.02872, 1, 0, 0.6196079, 1,
1.252367, -1.652804, 1.922812, 1, 0, 0.6117647, 1,
1.262891, -0.5348042, 2.480875, 1, 0, 0.6078432, 1,
1.264342, -0.1811039, 2.222792, 1, 0, 0.6, 1,
1.278031, -0.03416635, 1.777565, 1, 0, 0.5921569, 1,
1.282451, 1.007931, 2.327223, 1, 0, 0.5882353, 1,
1.292645, -2.023692, 4.096892, 1, 0, 0.5803922, 1,
1.299146, -0.3482686, 1.474741, 1, 0, 0.5764706, 1,
1.299555, 1.978153, -0.1237414, 1, 0, 0.5686275, 1,
1.303724, -0.958213, 1.282912, 1, 0, 0.5647059, 1,
1.309202, 0.3170459, 0.04452677, 1, 0, 0.5568628, 1,
1.319837, 1.746096, -0.1229362, 1, 0, 0.5529412, 1,
1.321805, 0.4586206, -0.9043137, 1, 0, 0.5450981, 1,
1.321888, -0.8532167, 3.770457, 1, 0, 0.5411765, 1,
1.323817, -0.508195, 2.329426, 1, 0, 0.5333334, 1,
1.327615, -0.5048885, 1.721755, 1, 0, 0.5294118, 1,
1.327837, -0.6698005, 2.162808, 1, 0, 0.5215687, 1,
1.330647, 0.3214405, 0.8358017, 1, 0, 0.5176471, 1,
1.33301, 0.3200531, 1.700298, 1, 0, 0.509804, 1,
1.334366, 0.174865, 0.9756231, 1, 0, 0.5058824, 1,
1.341894, 0.6895346, 2.018541, 1, 0, 0.4980392, 1,
1.347758, 2.158423, -0.3768224, 1, 0, 0.4901961, 1,
1.357845, 0.8841205, -0.1884602, 1, 0, 0.4862745, 1,
1.359788, -0.6625016, 2.7312, 1, 0, 0.4784314, 1,
1.37359, 0.5663922, 3.594038, 1, 0, 0.4745098, 1,
1.379932, -2.804118, 2.624427, 1, 0, 0.4666667, 1,
1.389896, 0.6816485, 0.2063761, 1, 0, 0.4627451, 1,
1.402122, -1.202101, 2.548007, 1, 0, 0.454902, 1,
1.410048, 0.9181434, 2.229045, 1, 0, 0.4509804, 1,
1.410149, 0.7280558, 1.979217, 1, 0, 0.4431373, 1,
1.410482, 0.4924742, 0.2496261, 1, 0, 0.4392157, 1,
1.431068, -0.4242727, 1.803718, 1, 0, 0.4313726, 1,
1.432557, 1.096362, 0.254238, 1, 0, 0.427451, 1,
1.440408, -0.3631476, 0.5806955, 1, 0, 0.4196078, 1,
1.445035, 0.3114185, -0.9792634, 1, 0, 0.4156863, 1,
1.454822, -2.073055, 4.948932, 1, 0, 0.4078431, 1,
1.481257, -0.4879265, 2.73211, 1, 0, 0.4039216, 1,
1.49776, 0.05354642, 1.186052, 1, 0, 0.3960784, 1,
1.500864, 0.0008862026, 1.762538, 1, 0, 0.3882353, 1,
1.519462, -1.292836, 3.163434, 1, 0, 0.3843137, 1,
1.521823, 0.544094, 3.389129, 1, 0, 0.3764706, 1,
1.52997, -0.3038155, 0.6533053, 1, 0, 0.372549, 1,
1.540891, 1.59047, 1.707522, 1, 0, 0.3647059, 1,
1.549952, 0.1710405, 0.9742722, 1, 0, 0.3607843, 1,
1.551756, 1.145249, 0.201038, 1, 0, 0.3529412, 1,
1.555995, 1.365945, 2.225814, 1, 0, 0.3490196, 1,
1.558576, 0.728071, 1.816355, 1, 0, 0.3411765, 1,
1.563677, -0.1855088, 3.997832, 1, 0, 0.3372549, 1,
1.57479, 0.9916152, 0.8235829, 1, 0, 0.3294118, 1,
1.583744, 1.428061, 0.3855741, 1, 0, 0.3254902, 1,
1.603384, -0.9681191, 0.96242, 1, 0, 0.3176471, 1,
1.604427, -1.210381, 3.69988, 1, 0, 0.3137255, 1,
1.614132, -0.04686245, 1.244403, 1, 0, 0.3058824, 1,
1.627855, 1.428542, 1.075706, 1, 0, 0.2980392, 1,
1.638826, 0.1919225, 1.801211, 1, 0, 0.2941177, 1,
1.644119, 0.743884, 1.171118, 1, 0, 0.2862745, 1,
1.644892, 2.797642, 0.675696, 1, 0, 0.282353, 1,
1.65545, 1.30564, 0.1558202, 1, 0, 0.2745098, 1,
1.674134, -0.655297, 1.409012, 1, 0, 0.2705882, 1,
1.674278, -1.874894, 2.282618, 1, 0, 0.2627451, 1,
1.715796, -1.698663, 1.958286, 1, 0, 0.2588235, 1,
1.717351, -0.4229215, 1.851281, 1, 0, 0.2509804, 1,
1.720649, -0.3171335, 3.01132, 1, 0, 0.2470588, 1,
1.729539, 0.6761187, 0.3519599, 1, 0, 0.2392157, 1,
1.732387, -0.5077162, 2.57204, 1, 0, 0.2352941, 1,
1.754741, 1.46677, 1.879613, 1, 0, 0.227451, 1,
1.761126, 0.1990401, 1.360812, 1, 0, 0.2235294, 1,
1.790882, -1.237056, 3.06315, 1, 0, 0.2156863, 1,
1.806824, 1.115383, 0.2475073, 1, 0, 0.2117647, 1,
1.818359, -0.4252748, 0.2836505, 1, 0, 0.2039216, 1,
1.825849, 0.8924922, -0.2031421, 1, 0, 0.1960784, 1,
1.829632, -0.5386082, 1.372101, 1, 0, 0.1921569, 1,
1.848355, -0.8370998, 1.811268, 1, 0, 0.1843137, 1,
1.851982, -0.8472821, 0.8116685, 1, 0, 0.1803922, 1,
1.884102, 0.6851099, 2.909638, 1, 0, 0.172549, 1,
1.90661, 0.8009239, 3.421574, 1, 0, 0.1686275, 1,
1.908363, -0.5776914, 2.235601, 1, 0, 0.1607843, 1,
1.956522, 0.6452655, 1.290287, 1, 0, 0.1568628, 1,
1.967426, -0.5690591, 0.6153574, 1, 0, 0.1490196, 1,
1.996561, 0.01478976, 0.5956241, 1, 0, 0.145098, 1,
1.996614, 0.2106351, 0.02872127, 1, 0, 0.1372549, 1,
1.997428, 0.3791672, 2.930133, 1, 0, 0.1333333, 1,
2.002342, 0.06521703, 2.985087, 1, 0, 0.1254902, 1,
2.008794, -2.026977, 1.729788, 1, 0, 0.1215686, 1,
2.038639, -1.829857, 3.040902, 1, 0, 0.1137255, 1,
2.062793, 1.113752, 2.073244, 1, 0, 0.1098039, 1,
2.069134, 0.763785, 1.498064, 1, 0, 0.1019608, 1,
2.087034, -0.8474512, 2.861055, 1, 0, 0.09411765, 1,
2.101437, 1.024465, 0.09800722, 1, 0, 0.09019608, 1,
2.130822, 0.1800147, 1.800924, 1, 0, 0.08235294, 1,
2.142708, 1.030792, 1.674512, 1, 0, 0.07843138, 1,
2.152951, -1.110645, 2.148429, 1, 0, 0.07058824, 1,
2.162927, -0.5182846, 2.031728, 1, 0, 0.06666667, 1,
2.241547, 1.154504, 1.168305, 1, 0, 0.05882353, 1,
2.316707, -0.533023, 2.107571, 1, 0, 0.05490196, 1,
2.384963, -0.6466846, 0.5600954, 1, 0, 0.04705882, 1,
2.400461, 0.7521443, 1.364752, 1, 0, 0.04313726, 1,
2.423275, 0.5143525, 2.105671, 1, 0, 0.03529412, 1,
2.453355, -0.8898247, 2.935784, 1, 0, 0.03137255, 1,
2.501207, 0.8246164, 1.049429, 1, 0, 0.02352941, 1,
2.686858, 1.752813, 1.487544, 1, 0, 0.01960784, 1,
2.76037, -1.251335, 1.871161, 1, 0, 0.01176471, 1,
3.009969, -0.2122185, 2.246128, 1, 0, 0.007843138, 1
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
-0.1002655, -4.766034, -6.698657, 0, -0.5, 0.5, 0.5,
-0.1002655, -4.766034, -6.698657, 1, -0.5, 0.5, 0.5,
-0.1002655, -4.766034, -6.698657, 1, 1.5, 0.5, 0.5,
-0.1002655, -4.766034, -6.698657, 0, 1.5, 0.5, 0.5
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
-4.26487, -0.4340547, -6.698657, 0, -0.5, 0.5, 0.5,
-4.26487, -0.4340547, -6.698657, 1, -0.5, 0.5, 0.5,
-4.26487, -0.4340547, -6.698657, 1, 1.5, 0.5, 0.5,
-4.26487, -0.4340547, -6.698657, 0, 1.5, 0.5, 0.5
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
-4.26487, -4.766034, 0.1193314, 0, -0.5, 0.5, 0.5,
-4.26487, -4.766034, 0.1193314, 1, -0.5, 0.5, 0.5,
-4.26487, -4.766034, 0.1193314, 1, 1.5, 0.5, 0.5,
-4.26487, -4.766034, 0.1193314, 0, 1.5, 0.5, 0.5
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
-3, -3.766346, -5.125275,
3, -3.766346, -5.125275,
-3, -3.766346, -5.125275,
-3, -3.932961, -5.387505,
-2, -3.766346, -5.125275,
-2, -3.932961, -5.387505,
-1, -3.766346, -5.125275,
-1, -3.932961, -5.387505,
0, -3.766346, -5.125275,
0, -3.932961, -5.387505,
1, -3.766346, -5.125275,
1, -3.932961, -5.387505,
2, -3.766346, -5.125275,
2, -3.932961, -5.387505,
3, -3.766346, -5.125275,
3, -3.932961, -5.387505
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
-3, -4.26619, -5.911966, 0, -0.5, 0.5, 0.5,
-3, -4.26619, -5.911966, 1, -0.5, 0.5, 0.5,
-3, -4.26619, -5.911966, 1, 1.5, 0.5, 0.5,
-3, -4.26619, -5.911966, 0, 1.5, 0.5, 0.5,
-2, -4.26619, -5.911966, 0, -0.5, 0.5, 0.5,
-2, -4.26619, -5.911966, 1, -0.5, 0.5, 0.5,
-2, -4.26619, -5.911966, 1, 1.5, 0.5, 0.5,
-2, -4.26619, -5.911966, 0, 1.5, 0.5, 0.5,
-1, -4.26619, -5.911966, 0, -0.5, 0.5, 0.5,
-1, -4.26619, -5.911966, 1, -0.5, 0.5, 0.5,
-1, -4.26619, -5.911966, 1, 1.5, 0.5, 0.5,
-1, -4.26619, -5.911966, 0, 1.5, 0.5, 0.5,
0, -4.26619, -5.911966, 0, -0.5, 0.5, 0.5,
0, -4.26619, -5.911966, 1, -0.5, 0.5, 0.5,
0, -4.26619, -5.911966, 1, 1.5, 0.5, 0.5,
0, -4.26619, -5.911966, 0, 1.5, 0.5, 0.5,
1, -4.26619, -5.911966, 0, -0.5, 0.5, 0.5,
1, -4.26619, -5.911966, 1, -0.5, 0.5, 0.5,
1, -4.26619, -5.911966, 1, 1.5, 0.5, 0.5,
1, -4.26619, -5.911966, 0, 1.5, 0.5, 0.5,
2, -4.26619, -5.911966, 0, -0.5, 0.5, 0.5,
2, -4.26619, -5.911966, 1, -0.5, 0.5, 0.5,
2, -4.26619, -5.911966, 1, 1.5, 0.5, 0.5,
2, -4.26619, -5.911966, 0, 1.5, 0.5, 0.5,
3, -4.26619, -5.911966, 0, -0.5, 0.5, 0.5,
3, -4.26619, -5.911966, 1, -0.5, 0.5, 0.5,
3, -4.26619, -5.911966, 1, 1.5, 0.5, 0.5,
3, -4.26619, -5.911966, 0, 1.5, 0.5, 0.5
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
-3.303807, -3, -5.125275,
-3.303807, 2, -5.125275,
-3.303807, -3, -5.125275,
-3.463985, -3, -5.387505,
-3.303807, -2, -5.125275,
-3.463985, -2, -5.387505,
-3.303807, -1, -5.125275,
-3.463985, -1, -5.387505,
-3.303807, 0, -5.125275,
-3.463985, 0, -5.387505,
-3.303807, 1, -5.125275,
-3.463985, 1, -5.387505,
-3.303807, 2, -5.125275,
-3.463985, 2, -5.387505
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
-3.784339, -3, -5.911966, 0, -0.5, 0.5, 0.5,
-3.784339, -3, -5.911966, 1, -0.5, 0.5, 0.5,
-3.784339, -3, -5.911966, 1, 1.5, 0.5, 0.5,
-3.784339, -3, -5.911966, 0, 1.5, 0.5, 0.5,
-3.784339, -2, -5.911966, 0, -0.5, 0.5, 0.5,
-3.784339, -2, -5.911966, 1, -0.5, 0.5, 0.5,
-3.784339, -2, -5.911966, 1, 1.5, 0.5, 0.5,
-3.784339, -2, -5.911966, 0, 1.5, 0.5, 0.5,
-3.784339, -1, -5.911966, 0, -0.5, 0.5, 0.5,
-3.784339, -1, -5.911966, 1, -0.5, 0.5, 0.5,
-3.784339, -1, -5.911966, 1, 1.5, 0.5, 0.5,
-3.784339, -1, -5.911966, 0, 1.5, 0.5, 0.5,
-3.784339, 0, -5.911966, 0, -0.5, 0.5, 0.5,
-3.784339, 0, -5.911966, 1, -0.5, 0.5, 0.5,
-3.784339, 0, -5.911966, 1, 1.5, 0.5, 0.5,
-3.784339, 0, -5.911966, 0, 1.5, 0.5, 0.5,
-3.784339, 1, -5.911966, 0, -0.5, 0.5, 0.5,
-3.784339, 1, -5.911966, 1, -0.5, 0.5, 0.5,
-3.784339, 1, -5.911966, 1, 1.5, 0.5, 0.5,
-3.784339, 1, -5.911966, 0, 1.5, 0.5, 0.5,
-3.784339, 2, -5.911966, 0, -0.5, 0.5, 0.5,
-3.784339, 2, -5.911966, 1, -0.5, 0.5, 0.5,
-3.784339, 2, -5.911966, 1, 1.5, 0.5, 0.5,
-3.784339, 2, -5.911966, 0, 1.5, 0.5, 0.5
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
-3.303807, -3.766346, -4,
-3.303807, -3.766346, 4,
-3.303807, -3.766346, -4,
-3.463985, -3.932961, -4,
-3.303807, -3.766346, -2,
-3.463985, -3.932961, -2,
-3.303807, -3.766346, 0,
-3.463985, -3.932961, 0,
-3.303807, -3.766346, 2,
-3.463985, -3.932961, 2,
-3.303807, -3.766346, 4,
-3.463985, -3.932961, 4
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
-3.784339, -4.26619, -4, 0, -0.5, 0.5, 0.5,
-3.784339, -4.26619, -4, 1, -0.5, 0.5, 0.5,
-3.784339, -4.26619, -4, 1, 1.5, 0.5, 0.5,
-3.784339, -4.26619, -4, 0, 1.5, 0.5, 0.5,
-3.784339, -4.26619, -2, 0, -0.5, 0.5, 0.5,
-3.784339, -4.26619, -2, 1, -0.5, 0.5, 0.5,
-3.784339, -4.26619, -2, 1, 1.5, 0.5, 0.5,
-3.784339, -4.26619, -2, 0, 1.5, 0.5, 0.5,
-3.784339, -4.26619, 0, 0, -0.5, 0.5, 0.5,
-3.784339, -4.26619, 0, 1, -0.5, 0.5, 0.5,
-3.784339, -4.26619, 0, 1, 1.5, 0.5, 0.5,
-3.784339, -4.26619, 0, 0, 1.5, 0.5, 0.5,
-3.784339, -4.26619, 2, 0, -0.5, 0.5, 0.5,
-3.784339, -4.26619, 2, 1, -0.5, 0.5, 0.5,
-3.784339, -4.26619, 2, 1, 1.5, 0.5, 0.5,
-3.784339, -4.26619, 2, 0, 1.5, 0.5, 0.5,
-3.784339, -4.26619, 4, 0, -0.5, 0.5, 0.5,
-3.784339, -4.26619, 4, 1, -0.5, 0.5, 0.5,
-3.784339, -4.26619, 4, 1, 1.5, 0.5, 0.5,
-3.784339, -4.26619, 4, 0, 1.5, 0.5, 0.5
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
-3.303807, -3.766346, -5.125275,
-3.303807, 2.898237, -5.125275,
-3.303807, -3.766346, 5.363938,
-3.303807, 2.898237, 5.363938,
-3.303807, -3.766346, -5.125275,
-3.303807, -3.766346, 5.363938,
-3.303807, 2.898237, -5.125275,
-3.303807, 2.898237, 5.363938,
-3.303807, -3.766346, -5.125275,
3.103276, -3.766346, -5.125275,
-3.303807, -3.766346, 5.363938,
3.103276, -3.766346, 5.363938,
-3.303807, 2.898237, -5.125275,
3.103276, 2.898237, -5.125275,
-3.303807, 2.898237, 5.363938,
3.103276, 2.898237, 5.363938,
3.103276, -3.766346, -5.125275,
3.103276, 2.898237, -5.125275,
3.103276, -3.766346, 5.363938,
3.103276, 2.898237, 5.363938,
3.103276, -3.766346, -5.125275,
3.103276, -3.766346, 5.363938,
3.103276, 2.898237, -5.125275,
3.103276, 2.898237, 5.363938
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
var radius = 7.466014;
var distance = 33.21714;
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
mvMatrix.translate( 0.1002655, 0.4340547, -0.1193314 );
mvMatrix.scale( 1.259918, 1.211239, 0.7695907 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.21714);
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
thiadiazine-2-thione<-read.table("thiadiazine-2-thione.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiadiazine-2-thione$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazine' not found
```

```r
y<-thiadiazine-2-thione$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazine' not found
```

```r
z<-thiadiazine-2-thione$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazine' not found
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
-3.2105, 0.2548243, -4.102041, 0, 0, 1, 1, 1,
-2.965423, -0.8969428, -1.898027, 1, 0, 0, 1, 1,
-2.82425, 0.01584526, -1.30977, 1, 0, 0, 1, 1,
-2.671402, -0.7076666, -2.783467, 1, 0, 0, 1, 1,
-2.554814, 0.8702988, -1.547961, 1, 0, 0, 1, 1,
-2.552235, 0.6721985, 0.84066, 1, 0, 0, 1, 1,
-2.538873, 0.3746825, -2.521147, 0, 0, 0, 1, 1,
-2.538433, 0.2296461, -0.8389412, 0, 0, 0, 1, 1,
-2.460146, -0.6518748, -1.19552, 0, 0, 0, 1, 1,
-2.377161, 1.920488, -0.356385, 0, 0, 0, 1, 1,
-2.30916, -2.337863, -2.476505, 0, 0, 0, 1, 1,
-2.260313, 0.07740434, -2.932243, 0, 0, 0, 1, 1,
-2.231636, -0.7251067, -2.343082, 0, 0, 0, 1, 1,
-2.12276, -0.03688908, -1.619313, 1, 1, 1, 1, 1,
-2.11866, -0.902586, -3.035868, 1, 1, 1, 1, 1,
-2.088229, 0.6745888, -1.692039, 1, 1, 1, 1, 1,
-2.079375, -0.9247071, -0.9219016, 1, 1, 1, 1, 1,
-2.056319, -0.4223097, -0.9221237, 1, 1, 1, 1, 1,
-2.037617, 1.820119, -3.207529, 1, 1, 1, 1, 1,
-2.032734, 1.359751, -1.994493, 1, 1, 1, 1, 1,
-2.026748, 1.153964, -1.466253, 1, 1, 1, 1, 1,
-2.018656, 0.2048625, -1.374318, 1, 1, 1, 1, 1,
-1.956622, -0.2903132, -0.7020594, 1, 1, 1, 1, 1,
-1.954654, 0.2401035, -2.987496, 1, 1, 1, 1, 1,
-1.933214, -0.07984155, -1.404285, 1, 1, 1, 1, 1,
-1.914626, 0.6304031, -0.9573343, 1, 1, 1, 1, 1,
-1.885786, -0.06667476, -0.1537088, 1, 1, 1, 1, 1,
-1.884734, 0.7197639, -1.672739, 1, 1, 1, 1, 1,
-1.883286, 2.027327, -1.637845, 0, 0, 1, 1, 1,
-1.883103, 0.5889279, 1.092353, 1, 0, 0, 1, 1,
-1.863303, 1.259695, -0.6549704, 1, 0, 0, 1, 1,
-1.83988, -0.5899728, -1.945226, 1, 0, 0, 1, 1,
-1.839557, 0.858142, -2.194865, 1, 0, 0, 1, 1,
-1.827755, -0.5151465, -1.88569, 1, 0, 0, 1, 1,
-1.80044, 1.172995, -1.187206, 0, 0, 0, 1, 1,
-1.786794, 1.134176, -1.073766, 0, 0, 0, 1, 1,
-1.780869, -0.8081787, -1.377239, 0, 0, 0, 1, 1,
-1.765072, -0.5424229, -1.303401, 0, 0, 0, 1, 1,
-1.759072, 0.8025436, -0.755663, 0, 0, 0, 1, 1,
-1.744812, -1.600427, -2.625749, 0, 0, 0, 1, 1,
-1.739423, 0.2717251, -1.050649, 0, 0, 0, 1, 1,
-1.738032, 1.702954, -1.478038, 1, 1, 1, 1, 1,
-1.731363, 0.07661051, -2.672706, 1, 1, 1, 1, 1,
-1.709916, 1.451911, -0.4490806, 1, 1, 1, 1, 1,
-1.689163, 0.3791962, -2.268666, 1, 1, 1, 1, 1,
-1.662602, 1.390683, -0.3236726, 1, 1, 1, 1, 1,
-1.6605, -0.8785681, -2.132612, 1, 1, 1, 1, 1,
-1.658661, -0.7168667, -1.915806, 1, 1, 1, 1, 1,
-1.648773, -0.1556817, -2.228188, 1, 1, 1, 1, 1,
-1.6397, 0.9521481, -0.2752752, 1, 1, 1, 1, 1,
-1.637949, 0.04296107, -1.302306, 1, 1, 1, 1, 1,
-1.636111, 2.231536, -1.531182, 1, 1, 1, 1, 1,
-1.635069, -0.6830372, -0.4437659, 1, 1, 1, 1, 1,
-1.628733, -0.04469014, 0.1005293, 1, 1, 1, 1, 1,
-1.622252, 0.7509807, -0.8401781, 1, 1, 1, 1, 1,
-1.613497, 0.2777847, -3.052312, 1, 1, 1, 1, 1,
-1.582036, 0.6149725, -1.480255, 0, 0, 1, 1, 1,
-1.580388, -0.2276649, -3.241264, 1, 0, 0, 1, 1,
-1.572321, -0.06850661, -1.2742, 1, 0, 0, 1, 1,
-1.566023, -0.8990173, -1.549696, 1, 0, 0, 1, 1,
-1.560771, 0.1495681, -0.7593209, 1, 0, 0, 1, 1,
-1.554468, -1.336076, -2.958709, 1, 0, 0, 1, 1,
-1.549534, -0.5146263, -3.037203, 0, 0, 0, 1, 1,
-1.540411, -2.011814, -3.451218, 0, 0, 0, 1, 1,
-1.539598, 0.4439031, -2.928204, 0, 0, 0, 1, 1,
-1.513162, -0.7534104, 0.1224906, 0, 0, 0, 1, 1,
-1.505086, 1.140041, -2.26532, 0, 0, 0, 1, 1,
-1.493704, 1.817324, -1.12968, 0, 0, 0, 1, 1,
-1.490444, 1.195975, -0.1484757, 0, 0, 0, 1, 1,
-1.489517, -0.6823646, -3.049163, 1, 1, 1, 1, 1,
-1.478058, -0.1350516, -2.027968, 1, 1, 1, 1, 1,
-1.472996, -1.500038, -2.963078, 1, 1, 1, 1, 1,
-1.468567, -1.375851, -2.783423, 1, 1, 1, 1, 1,
-1.46725, -0.6783547, -0.3631163, 1, 1, 1, 1, 1,
-1.462838, -0.2019907, -2.091506, 1, 1, 1, 1, 1,
-1.461183, 0.7372783, -2.588316, 1, 1, 1, 1, 1,
-1.459368, 1.231065, -0.2280017, 1, 1, 1, 1, 1,
-1.453504, -0.009386082, -1.372062, 1, 1, 1, 1, 1,
-1.444115, 0.3182306, -2.407008, 1, 1, 1, 1, 1,
-1.443894, -0.7043039, -0.5581332, 1, 1, 1, 1, 1,
-1.440423, 1.241162, 0.8673466, 1, 1, 1, 1, 1,
-1.436981, 1.198008, -0.4970244, 1, 1, 1, 1, 1,
-1.432549, -0.06035529, -1.800066, 1, 1, 1, 1, 1,
-1.428912, -0.7097437, -2.416701, 1, 1, 1, 1, 1,
-1.422947, -1.497459, -1.588779, 0, 0, 1, 1, 1,
-1.415814, -0.9884241, -0.4631952, 1, 0, 0, 1, 1,
-1.412275, -0.8227282, -3.618536, 1, 0, 0, 1, 1,
-1.40562, -1.521343, -1.502872, 1, 0, 0, 1, 1,
-1.385648, 1.284244, -2.005248, 1, 0, 0, 1, 1,
-1.384133, 0.3030601, 0.4497409, 1, 0, 0, 1, 1,
-1.379692, 0.03954619, -1.760034, 0, 0, 0, 1, 1,
-1.377607, 0.2761521, -1.411187, 0, 0, 0, 1, 1,
-1.376151, -1.42975, -2.113844, 0, 0, 0, 1, 1,
-1.375762, 0.8644752, -2.251384, 0, 0, 0, 1, 1,
-1.374342, -1.674281, -3.005257, 0, 0, 0, 1, 1,
-1.374243, 0.8494724, -1.105051, 0, 0, 0, 1, 1,
-1.373739, -0.7774037, -2.882285, 0, 0, 0, 1, 1,
-1.371723, 1.690816, -1.009188, 1, 1, 1, 1, 1,
-1.362546, -0.425956, -1.683985, 1, 1, 1, 1, 1,
-1.359635, 0.4503626, -2.093572, 1, 1, 1, 1, 1,
-1.359491, -0.6987877, -3.218057, 1, 1, 1, 1, 1,
-1.353229, -0.3075614, -2.528629, 1, 1, 1, 1, 1,
-1.352133, -0.3452512, -2.851456, 1, 1, 1, 1, 1,
-1.348417, 1.311288, 0.1500791, 1, 1, 1, 1, 1,
-1.348056, -0.190397, -0.4606829, 1, 1, 1, 1, 1,
-1.332581, -0.2591376, -1.489695, 1, 1, 1, 1, 1,
-1.315936, -1.374625, -2.901887, 1, 1, 1, 1, 1,
-1.315876, 0.2822436, -2.102774, 1, 1, 1, 1, 1,
-1.314938, 1.282997, -0.5725435, 1, 1, 1, 1, 1,
-1.31482, 0.6825207, -1.177631, 1, 1, 1, 1, 1,
-1.310555, -0.3098305, -1.136208, 1, 1, 1, 1, 1,
-1.306034, -0.05211794, -0.9951596, 1, 1, 1, 1, 1,
-1.298235, -0.4131232, -0.7816274, 0, 0, 1, 1, 1,
-1.291733, -1.563499, -1.603111, 1, 0, 0, 1, 1,
-1.289936, -1.790827, -3.198567, 1, 0, 0, 1, 1,
-1.28013, -0.3603556, -2.4718, 1, 0, 0, 1, 1,
-1.266451, 0.4100937, -0.8248967, 1, 0, 0, 1, 1,
-1.265135, 0.4809636, -2.716678, 1, 0, 0, 1, 1,
-1.26276, 0.2904028, -0.748036, 0, 0, 0, 1, 1,
-1.262468, 1.982934, -0.09982219, 0, 0, 0, 1, 1,
-1.260124, 0.214473, -2.744158, 0, 0, 0, 1, 1,
-1.253575, 1.149752, -2.537528, 0, 0, 0, 1, 1,
-1.247819, -0.4072504, -0.03131707, 0, 0, 0, 1, 1,
-1.246978, 0.8181494, -0.2071785, 0, 0, 0, 1, 1,
-1.246722, -0.2501593, -0.921597, 0, 0, 0, 1, 1,
-1.243217, 0.4515261, -2.183832, 1, 1, 1, 1, 1,
-1.233554, -0.143666, -2.555816, 1, 1, 1, 1, 1,
-1.230536, 1.045131, 0.16268, 1, 1, 1, 1, 1,
-1.2269, -1.432968, -1.213493, 1, 1, 1, 1, 1,
-1.21444, 0.8490237, -0.987521, 1, 1, 1, 1, 1,
-1.206539, -2.403152, -3.380943, 1, 1, 1, 1, 1,
-1.201353, -1.758883, -2.948626, 1, 1, 1, 1, 1,
-1.200513, -1.383734, -3.336011, 1, 1, 1, 1, 1,
-1.19945, 0.6069171, -0.6241638, 1, 1, 1, 1, 1,
-1.198414, 0.03372212, -0.9920137, 1, 1, 1, 1, 1,
-1.197821, 0.008400658, -1.519298, 1, 1, 1, 1, 1,
-1.194689, 0.08197482, -0.6285121, 1, 1, 1, 1, 1,
-1.192843, 0.7400851, 0.9769374, 1, 1, 1, 1, 1,
-1.188887, 1.196985, -1.787602, 1, 1, 1, 1, 1,
-1.185307, -1.757389, -3.450524, 1, 1, 1, 1, 1,
-1.184272, -0.7349057, -2.495827, 0, 0, 1, 1, 1,
-1.183456, 1.137107, -1.794405, 1, 0, 0, 1, 1,
-1.179486, -0.4223134, -1.487732, 1, 0, 0, 1, 1,
-1.174987, 0.3517693, -3.7181, 1, 0, 0, 1, 1,
-1.171192, -2.200434, -0.2454809, 1, 0, 0, 1, 1,
-1.168447, -0.08210714, -2.129331, 1, 0, 0, 1, 1,
-1.167867, -0.8472525, -3.550802, 0, 0, 0, 1, 1,
-1.161969, 0.4253054, -0.3033694, 0, 0, 0, 1, 1,
-1.154142, 2.025713, -0.3264755, 0, 0, 0, 1, 1,
-1.145198, 0.5883855, -1.889416, 0, 0, 0, 1, 1,
-1.126149, -1.008267, -1.604456, 0, 0, 0, 1, 1,
-1.110735, 0.2804071, 0.9097511, 0, 0, 0, 1, 1,
-1.109835, 0.8197501, -1.488412, 0, 0, 0, 1, 1,
-1.097102, 1.771508, 0.1609363, 1, 1, 1, 1, 1,
-1.096862, 1.246938, -0.5383636, 1, 1, 1, 1, 1,
-1.095094, 0.5390214, -0.8130761, 1, 1, 1, 1, 1,
-1.094341, -1.553985, -2.415027, 1, 1, 1, 1, 1,
-1.094166, 1.590835, -1.132674, 1, 1, 1, 1, 1,
-1.093636, 0.2437727, -1.501874, 1, 1, 1, 1, 1,
-1.092535, -0.8186517, -2.636321, 1, 1, 1, 1, 1,
-1.078486, -1.057406, -1.441944, 1, 1, 1, 1, 1,
-1.073252, 0.8067572, -1.096785, 1, 1, 1, 1, 1,
-1.071269, -1.226433, -2.810366, 1, 1, 1, 1, 1,
-1.07095, -0.5442781, -2.573273, 1, 1, 1, 1, 1,
-1.066615, 0.6205559, -1.630103, 1, 1, 1, 1, 1,
-1.054491, -0.627679, -2.231092, 1, 1, 1, 1, 1,
-1.039718, 0.5233237, -1.2536, 1, 1, 1, 1, 1,
-1.039483, 0.8205339, -0.6289201, 1, 1, 1, 1, 1,
-1.039089, -1.249402, -0.4735338, 0, 0, 1, 1, 1,
-1.03854, 0.7855885, -0.9536507, 1, 0, 0, 1, 1,
-1.037974, 1.509964, -1.056494, 1, 0, 0, 1, 1,
-1.03509, -0.2830815, 0.04585136, 1, 0, 0, 1, 1,
-1.033981, -1.818676, -3.348805, 1, 0, 0, 1, 1,
-1.033137, -0.1901398, -1.22819, 1, 0, 0, 1, 1,
-1.031024, -0.3331102, -0.9932183, 0, 0, 0, 1, 1,
-1.025333, -0.7743042, -1.799673, 0, 0, 0, 1, 1,
-1.023499, 0.2999089, -0.8545313, 0, 0, 0, 1, 1,
-1.022789, -0.4532484, -1.675379, 0, 0, 0, 1, 1,
-1.016883, 1.197393, -2.037022, 0, 0, 0, 1, 1,
-1.010074, 1.39343, -2.114794, 0, 0, 0, 1, 1,
-1.006097, -0.3869573, -2.120337, 0, 0, 0, 1, 1,
-0.9977504, 0.4669987, -1.348294, 1, 1, 1, 1, 1,
-0.9937665, -0.4806721, -0.7238594, 1, 1, 1, 1, 1,
-0.9924973, 0.9095919, -0.641715, 1, 1, 1, 1, 1,
-0.9881362, 0.6245513, -1.16826, 1, 1, 1, 1, 1,
-0.9879635, -2.72776, -2.2272, 1, 1, 1, 1, 1,
-0.9748529, 0.4685445, -1.078256, 1, 1, 1, 1, 1,
-0.9718841, -1.85624, -3.261438, 1, 1, 1, 1, 1,
-0.9653528, 0.6214405, -0.2886383, 1, 1, 1, 1, 1,
-0.9502541, 1.488219, 0.06184158, 1, 1, 1, 1, 1,
-0.9478653, 1.628597, 1.907377, 1, 1, 1, 1, 1,
-0.9345321, -0.135097, -1.836746, 1, 1, 1, 1, 1,
-0.9308231, -0.8666738, -2.920059, 1, 1, 1, 1, 1,
-0.9238991, 1.653391, -2.41258, 1, 1, 1, 1, 1,
-0.9160492, 1.720944, -0.1394473, 1, 1, 1, 1, 1,
-0.9156967, -0.7661001, -2.565748, 1, 1, 1, 1, 1,
-0.9149923, 0.7374378, -2.174576, 0, 0, 1, 1, 1,
-0.9121692, -0.7374607, -4.026862, 1, 0, 0, 1, 1,
-0.9100893, -0.733981, -1.93684, 1, 0, 0, 1, 1,
-0.9090917, 1.946909, -2.025305, 1, 0, 0, 1, 1,
-0.9069861, -0.3016942, -2.460295, 1, 0, 0, 1, 1,
-0.9044998, 2.046549, -0.4348893, 1, 0, 0, 1, 1,
-0.9036313, 1.248409, -1.072976, 0, 0, 0, 1, 1,
-0.9016759, 1.509804, -1.211701, 0, 0, 0, 1, 1,
-0.8992109, 1.698947, 0.3044709, 0, 0, 0, 1, 1,
-0.8985204, 1.223959, 1.456036, 0, 0, 0, 1, 1,
-0.8963427, 1.319908, -1.623195, 0, 0, 0, 1, 1,
-0.8958037, 0.7437549, -1.334515, 0, 0, 0, 1, 1,
-0.8930955, 0.2324997, -1.770352, 0, 0, 0, 1, 1,
-0.8912118, 0.2114646, -2.293952, 1, 1, 1, 1, 1,
-0.8909, -1.388944, -1.086177, 1, 1, 1, 1, 1,
-0.8861274, -0.1220354, -2.10975, 1, 1, 1, 1, 1,
-0.8842244, 0.5212554, -2.338295, 1, 1, 1, 1, 1,
-0.8809569, 2.80118, 0.4290194, 1, 1, 1, 1, 1,
-0.8801141, -0.9130304, -2.568421, 1, 1, 1, 1, 1,
-0.8776535, 0.8355391, -0.1067625, 1, 1, 1, 1, 1,
-0.8618405, -0.09333193, -2.916871, 1, 1, 1, 1, 1,
-0.8566552, -0.1632111, -1.231858, 1, 1, 1, 1, 1,
-0.8566346, -0.4421392, -2.269409, 1, 1, 1, 1, 1,
-0.8543608, -0.4577306, -1.395342, 1, 1, 1, 1, 1,
-0.843264, -0.4890958, -3.001495, 1, 1, 1, 1, 1,
-0.8411362, 1.865307, 0.05574476, 1, 1, 1, 1, 1,
-0.8343226, 0.8731305, -1.768815, 1, 1, 1, 1, 1,
-0.8295864, -1.69497, -2.33794, 1, 1, 1, 1, 1,
-0.8241619, -0.05559075, -4.115193, 0, 0, 1, 1, 1,
-0.8220489, -0.1558411, -2.403884, 1, 0, 0, 1, 1,
-0.82154, 0.8944832, -1.360192, 1, 0, 0, 1, 1,
-0.820199, 2.338683, -0.3863128, 1, 0, 0, 1, 1,
-0.8198346, 1.583214, -0.09254684, 1, 0, 0, 1, 1,
-0.8185192, -0.1235391, -1.512882, 1, 0, 0, 1, 1,
-0.8174014, 2.54489, 0.855749, 0, 0, 0, 1, 1,
-0.813556, -0.8517355, -2.820264, 0, 0, 0, 1, 1,
-0.8101546, -0.7453052, -2.121012, 0, 0, 0, 1, 1,
-0.8085673, -0.4401058, -0.9883222, 0, 0, 0, 1, 1,
-0.8003602, 1.512082, -0.3087963, 0, 0, 0, 1, 1,
-0.7832137, 1.295995, -1.350676, 0, 0, 0, 1, 1,
-0.7801048, -0.5091308, -1.487027, 0, 0, 0, 1, 1,
-0.7800907, 1.750421, -0.456435, 1, 1, 1, 1, 1,
-0.7757124, 0.2333773, 0.2750922, 1, 1, 1, 1, 1,
-0.7675459, 0.3460952, -0.992847, 1, 1, 1, 1, 1,
-0.7669232, -0.411631, -3.403119, 1, 1, 1, 1, 1,
-0.7651545, 1.178945, -1.02332, 1, 1, 1, 1, 1,
-0.760289, -1.089988, -2.981721, 1, 1, 1, 1, 1,
-0.7602074, 0.03377576, -1.485235, 1, 1, 1, 1, 1,
-0.7600726, 0.7567774, -0.5526659, 1, 1, 1, 1, 1,
-0.7598242, -0.08739016, -1.437857, 1, 1, 1, 1, 1,
-0.7549098, 0.06406331, -2.559081, 1, 1, 1, 1, 1,
-0.7528868, 0.2552757, -0.7640904, 1, 1, 1, 1, 1,
-0.748198, 1.024028, -1.846166, 1, 1, 1, 1, 1,
-0.7452767, -0.2579006, -3.163866, 1, 1, 1, 1, 1,
-0.7451888, 0.3057673, -1.799218, 1, 1, 1, 1, 1,
-0.7436117, 0.3813914, -0.5927866, 1, 1, 1, 1, 1,
-0.7429406, -1.514923, -2.312682, 0, 0, 1, 1, 1,
-0.741079, 0.4807702, -0.12098, 1, 0, 0, 1, 1,
-0.7400185, 0.4052526, -0.5579106, 1, 0, 0, 1, 1,
-0.7364932, 0.01667482, -1.037118, 1, 0, 0, 1, 1,
-0.732998, 2.371379, 0.03493059, 1, 0, 0, 1, 1,
-0.7317519, 0.06995916, -0.7941868, 1, 0, 0, 1, 1,
-0.7307916, 1.898506, -1.134405, 0, 0, 0, 1, 1,
-0.726994, 0.4197748, -0.1616427, 0, 0, 0, 1, 1,
-0.7251978, 1.109504, 0.001845403, 0, 0, 0, 1, 1,
-0.72403, 0.05776256, -2.711756, 0, 0, 0, 1, 1,
-0.7214205, -0.3495106, -2.844997, 0, 0, 0, 1, 1,
-0.7040828, -0.2675361, -1.358814, 0, 0, 0, 1, 1,
-0.7028843, 0.2444139, -1.99345, 0, 0, 0, 1, 1,
-0.6950437, 1.183605, -0.0654504, 1, 1, 1, 1, 1,
-0.6892251, -0.590746, -2.141554, 1, 1, 1, 1, 1,
-0.6869397, 1.220923, -0.4095317, 1, 1, 1, 1, 1,
-0.6759518, 0.7077197, -1.745658, 1, 1, 1, 1, 1,
-0.6721694, 0.6999575, -1.061412, 1, 1, 1, 1, 1,
-0.670497, 1.622681, -0.3579484, 1, 1, 1, 1, 1,
-0.6699944, -1.004292, -1.861216, 1, 1, 1, 1, 1,
-0.6699632, 1.552553, 1.026314, 1, 1, 1, 1, 1,
-0.6661476, 0.008975011, -0.9970014, 1, 1, 1, 1, 1,
-0.6601316, -1.418638, -3.391359, 1, 1, 1, 1, 1,
-0.6585431, -1.10107, -2.121819, 1, 1, 1, 1, 1,
-0.6577945, 1.022509, -1.031532, 1, 1, 1, 1, 1,
-0.6529608, -0.03209017, -2.081442, 1, 1, 1, 1, 1,
-0.6505398, -0.963619, -2.156826, 1, 1, 1, 1, 1,
-0.6500138, -1.457019, -3.208569, 1, 1, 1, 1, 1,
-0.6463788, -1.150574, -3.360573, 0, 0, 1, 1, 1,
-0.6448848, 1.825812, 0.2112903, 1, 0, 0, 1, 1,
-0.644622, -1.081766, -3.847184, 1, 0, 0, 1, 1,
-0.6413279, 0.4563614, -1.001182, 1, 0, 0, 1, 1,
-0.6373518, 0.9750506, 1.185835, 1, 0, 0, 1, 1,
-0.6359534, -0.6579134, -2.860748, 1, 0, 0, 1, 1,
-0.6313047, -1.126067, -3.062446, 0, 0, 0, 1, 1,
-0.6269782, -0.03709737, -2.517191, 0, 0, 0, 1, 1,
-0.6225961, -0.8350574, -3.144501, 0, 0, 0, 1, 1,
-0.6184356, -0.6678664, -0.3733556, 0, 0, 0, 1, 1,
-0.6174589, -0.04707682, -0.3064829, 0, 0, 0, 1, 1,
-0.6142508, 1.137909, -1.718519, 0, 0, 0, 1, 1,
-0.6095763, -0.3910146, -0.9498631, 0, 0, 0, 1, 1,
-0.6083902, -1.043751, -4.031153, 1, 1, 1, 1, 1,
-0.601954, -0.9883399, -2.266345, 1, 1, 1, 1, 1,
-0.5983527, 0.9306283, 0.2582667, 1, 1, 1, 1, 1,
-0.5957694, -0.1411451, -2.076429, 1, 1, 1, 1, 1,
-0.5940286, -0.03085334, -2.563898, 1, 1, 1, 1, 1,
-0.5940081, -0.3672452, -2.210067, 1, 1, 1, 1, 1,
-0.5920732, 0.1007611, -0.9017845, 1, 1, 1, 1, 1,
-0.5902569, -0.06335846, -2.777502, 1, 1, 1, 1, 1,
-0.5895996, 0.07577477, -3.038605, 1, 1, 1, 1, 1,
-0.5895981, -0.6192633, -2.610885, 1, 1, 1, 1, 1,
-0.5892619, -0.3818837, -0.9733415, 1, 1, 1, 1, 1,
-0.5856168, 0.03336765, -1.462032, 1, 1, 1, 1, 1,
-0.5836474, 0.8420849, -2.449996, 1, 1, 1, 1, 1,
-0.5766124, 0.4051394, -2.111138, 1, 1, 1, 1, 1,
-0.5718021, -0.8783405, -1.598042, 1, 1, 1, 1, 1,
-0.5698991, -1.429181, -1.410209, 0, 0, 1, 1, 1,
-0.5591679, -0.1353423, 0.2372045, 1, 0, 0, 1, 1,
-0.5559776, -1.058752, -0.6801227, 1, 0, 0, 1, 1,
-0.5545418, -1.105265, -2.40589, 1, 0, 0, 1, 1,
-0.5512245, 1.247843, 0.9119422, 1, 0, 0, 1, 1,
-0.5486506, 1.305867, 2.239999, 1, 0, 0, 1, 1,
-0.5468144, -1.025818, -1.94321, 0, 0, 0, 1, 1,
-0.5436919, 0.08422911, -1.46766, 0, 0, 0, 1, 1,
-0.5359321, -0.8637394, -2.706692, 0, 0, 0, 1, 1,
-0.5294703, 0.03495287, -0.9450767, 0, 0, 0, 1, 1,
-0.5277178, 0.4126622, -2.407947, 0, 0, 0, 1, 1,
-0.5227851, -1.370175, -2.222913, 0, 0, 0, 1, 1,
-0.521038, 0.4130956, 0.8030367, 0, 0, 0, 1, 1,
-0.5178356, -1.494284, -1.923448, 1, 1, 1, 1, 1,
-0.516646, -0.1953024, -2.548752, 1, 1, 1, 1, 1,
-0.5164129, -1.296958, -3.590857, 1, 1, 1, 1, 1,
-0.5144311, 1.208654, -0.8534847, 1, 1, 1, 1, 1,
-0.5091751, -0.1504413, -2.275684, 1, 1, 1, 1, 1,
-0.5072369, -2.02556, -3.575738, 1, 1, 1, 1, 1,
-0.5042655, -2.186145, -3.169506, 1, 1, 1, 1, 1,
-0.5017352, -0.4199847, -3.06979, 1, 1, 1, 1, 1,
-0.4902255, -0.5169028, -1.54114, 1, 1, 1, 1, 1,
-0.4901319, -1.507244, -2.83186, 1, 1, 1, 1, 1,
-0.4855858, -1.301348, -3.474243, 1, 1, 1, 1, 1,
-0.482888, -0.6036247, -1.993162, 1, 1, 1, 1, 1,
-0.4818791, 0.7247282, 0.6971123, 1, 1, 1, 1, 1,
-0.4739573, -0.3922146, -3.77102, 1, 1, 1, 1, 1,
-0.4736075, -0.2897215, -1.488576, 1, 1, 1, 1, 1,
-0.4711406, 0.3591104, 1.33791, 0, 0, 1, 1, 1,
-0.4706522, -0.7506102, -2.940306, 1, 0, 0, 1, 1,
-0.4700205, -0.8682489, -3.846728, 1, 0, 0, 1, 1,
-0.4662617, 0.4546024, -0.9991897, 1, 0, 0, 1, 1,
-0.4661267, 1.381991, -0.4171568, 1, 0, 0, 1, 1,
-0.4610249, -0.6469201, -2.694871, 1, 0, 0, 1, 1,
-0.4596737, 0.5114394, 0.5892404, 0, 0, 0, 1, 1,
-0.4555845, 1.857771, 1.703778, 0, 0, 0, 1, 1,
-0.4552929, -0.0410753, -0.9157962, 0, 0, 0, 1, 1,
-0.454659, 0.3907358, -3.090983, 0, 0, 0, 1, 1,
-0.45222, -0.8000726, -3.361428, 0, 0, 0, 1, 1,
-0.4505001, 1.414956, -1.125722, 0, 0, 0, 1, 1,
-0.444959, 1.876428, -0.9142759, 0, 0, 0, 1, 1,
-0.4396548, -0.009151867, -2.451197, 1, 1, 1, 1, 1,
-0.4345297, -0.9309121, -3.555872, 1, 1, 1, 1, 1,
-0.434263, -1.498801, -2.659157, 1, 1, 1, 1, 1,
-0.4337293, -0.313702, -1.158244, 1, 1, 1, 1, 1,
-0.4314098, 1.208566, 0.7572914, 1, 1, 1, 1, 1,
-0.43134, -0.9591942, -1.837584, 1, 1, 1, 1, 1,
-0.4289272, 0.5160064, -1.896917, 1, 1, 1, 1, 1,
-0.4276775, -0.2275414, -0.2312358, 1, 1, 1, 1, 1,
-0.4266468, -0.6643789, -4.172205, 1, 1, 1, 1, 1,
-0.4239188, -0.5879424, -1.595656, 1, 1, 1, 1, 1,
-0.4211253, -1.095081, -4.16422, 1, 1, 1, 1, 1,
-0.4191192, -1.063911, -1.720691, 1, 1, 1, 1, 1,
-0.4172834, -0.8668143, -2.552258, 1, 1, 1, 1, 1,
-0.415588, -1.569853, -2.853828, 1, 1, 1, 1, 1,
-0.4110164, -0.1353093, -0.6761843, 1, 1, 1, 1, 1,
-0.4014253, 0.407905, -1.368224, 0, 0, 1, 1, 1,
-0.3989457, 1.852609, -0.2281598, 1, 0, 0, 1, 1,
-0.3975084, -0.8465036, -2.358334, 1, 0, 0, 1, 1,
-0.3959981, -0.3739517, -3.595541, 1, 0, 0, 1, 1,
-0.3930304, -1.491883, -2.775111, 1, 0, 0, 1, 1,
-0.3877446, -0.1593949, -2.671751, 1, 0, 0, 1, 1,
-0.3858466, -1.127206, -1.018816, 0, 0, 0, 1, 1,
-0.381704, -0.1486408, -2.393614, 0, 0, 0, 1, 1,
-0.3808956, 0.006594521, -0.9995822, 0, 0, 0, 1, 1,
-0.3801853, -0.003381177, -1.82678, 0, 0, 0, 1, 1,
-0.3758735, 0.5140358, -1.426874, 0, 0, 0, 1, 1,
-0.3707767, 0.7054261, -0.6189963, 0, 0, 0, 1, 1,
-0.369532, -0.380098, -2.237615, 0, 0, 0, 1, 1,
-0.3670027, -2.219841, -4.447417, 1, 1, 1, 1, 1,
-0.3657623, 0.318128, 0.2577733, 1, 1, 1, 1, 1,
-0.3634321, 2.514177, -0.6049758, 1, 1, 1, 1, 1,
-0.3622541, 0.6295571, -2.954154, 1, 1, 1, 1, 1,
-0.3613513, 0.1234847, -1.978549, 1, 1, 1, 1, 1,
-0.3613119, 1.181346, -0.2843925, 1, 1, 1, 1, 1,
-0.3570608, -0.4594673, 0.9608305, 1, 1, 1, 1, 1,
-0.3508919, -0.8495267, -4.845519, 1, 1, 1, 1, 1,
-0.342167, -1.823744, -3.758072, 1, 1, 1, 1, 1,
-0.3417207, -0.4171162, -3.522661, 1, 1, 1, 1, 1,
-0.3409526, 0.4885021, -0.3177165, 1, 1, 1, 1, 1,
-0.3398405, 0.7027065, -1.314943, 1, 1, 1, 1, 1,
-0.3370716, -1.748626, -2.264006, 1, 1, 1, 1, 1,
-0.3360068, 2.141762, 1.021582, 1, 1, 1, 1, 1,
-0.3330091, -0.5713845, -1.778015, 1, 1, 1, 1, 1,
-0.3326818, 1.447374, -0.8779573, 0, 0, 1, 1, 1,
-0.327796, 0.6089269, -0.4711331, 1, 0, 0, 1, 1,
-0.3263941, -1.538113, -1.850886, 1, 0, 0, 1, 1,
-0.3209404, 2.078102, -0.8459435, 1, 0, 0, 1, 1,
-0.3206915, -1.070118, -3.12744, 1, 0, 0, 1, 1,
-0.3182856, 0.03418948, -2.967943, 1, 0, 0, 1, 1,
-0.3180756, -1.100619, -2.331693, 0, 0, 0, 1, 1,
-0.3145845, 1.401914, -0.3187947, 0, 0, 0, 1, 1,
-0.3128301, 1.370079, 0.929697, 0, 0, 0, 1, 1,
-0.3126844, 0.290147, -0.791602, 0, 0, 0, 1, 1,
-0.312002, -1.691589, -1.349121, 0, 0, 0, 1, 1,
-0.3097018, 0.01122077, -2.959563, 0, 0, 0, 1, 1,
-0.302029, 0.4584586, -2.005986, 0, 0, 0, 1, 1,
-0.2988075, -0.4333878, -2.384417, 1, 1, 1, 1, 1,
-0.297531, 0.001471506, -1.023055, 1, 1, 1, 1, 1,
-0.2942129, -0.01686836, -1.686626, 1, 1, 1, 1, 1,
-0.2871259, -0.7536525, -1.446356, 1, 1, 1, 1, 1,
-0.2863934, 0.2274659, 0.7641004, 1, 1, 1, 1, 1,
-0.2856935, 0.7292001, -0.06769221, 1, 1, 1, 1, 1,
-0.2790124, 1.135484, 0.717871, 1, 1, 1, 1, 1,
-0.2752083, -0.2092416, -2.697431, 1, 1, 1, 1, 1,
-0.2676305, -1.159837, -2.555111, 1, 1, 1, 1, 1,
-0.2619173, 0.1219308, -2.298809, 1, 1, 1, 1, 1,
-0.2612168, 0.9595528, -0.4823968, 1, 1, 1, 1, 1,
-0.2602949, -0.8295724, -3.096107, 1, 1, 1, 1, 1,
-0.2601798, -0.9083423, -3.395428, 1, 1, 1, 1, 1,
-0.2600505, -2.587125, -2.322646, 1, 1, 1, 1, 1,
-0.2574205, 0.3754932, -0.3391016, 1, 1, 1, 1, 1,
-0.256997, 0.3487775, -0.2556346, 0, 0, 1, 1, 1,
-0.2567487, -0.269803, -1.89772, 1, 0, 0, 1, 1,
-0.255376, -1.096123, -3.709804, 1, 0, 0, 1, 1,
-0.2550493, 1.17103, -1.084391, 1, 0, 0, 1, 1,
-0.2536845, -0.8423964, -4.119925, 1, 0, 0, 1, 1,
-0.2525228, 0.5299834, -0.2741451, 1, 0, 0, 1, 1,
-0.2518719, 0.4640505, -0.1456335, 0, 0, 0, 1, 1,
-0.2478933, -0.5545242, -3.438764, 0, 0, 0, 1, 1,
-0.2421353, 1.185398, -0.1648413, 0, 0, 0, 1, 1,
-0.2360245, 0.9008049, -0.5328134, 0, 0, 0, 1, 1,
-0.2334451, -0.04057922, -3.364993, 0, 0, 0, 1, 1,
-0.2309217, -0.8295467, -3.389213, 0, 0, 0, 1, 1,
-0.2238118, 0.805476, -1.346505, 0, 0, 0, 1, 1,
-0.2218005, 0.8677486, -0.274832, 1, 1, 1, 1, 1,
-0.217714, 0.267588, -2.622655, 1, 1, 1, 1, 1,
-0.2171296, -1.630377, -2.851422, 1, 1, 1, 1, 1,
-0.2143966, -0.6000482, -3.10596, 1, 1, 1, 1, 1,
-0.2125057, -0.5517495, -2.948105, 1, 1, 1, 1, 1,
-0.2117082, 0.5967532, 0.2495824, 1, 1, 1, 1, 1,
-0.2113397, -0.3966177, -2.939707, 1, 1, 1, 1, 1,
-0.2103127, -1.472264, -2.788371, 1, 1, 1, 1, 1,
-0.208588, 1.422895, -1.389597, 1, 1, 1, 1, 1,
-0.198428, -0.6429546, -3.920029, 1, 1, 1, 1, 1,
-0.1957025, 0.128663, 0.8918227, 1, 1, 1, 1, 1,
-0.1859852, 2.08077, 0.511412, 1, 1, 1, 1, 1,
-0.1831583, -0.6410744, -4.416572, 1, 1, 1, 1, 1,
-0.1786615, 1.56552, -0.9282761, 1, 1, 1, 1, 1,
-0.1742289, 0.6069685, -0.3348971, 1, 1, 1, 1, 1,
-0.1716882, 0.003974195, -1.911743, 0, 0, 1, 1, 1,
-0.1690505, 1.953576, -0.5618915, 1, 0, 0, 1, 1,
-0.165546, 0.4882928, -1.125019, 1, 0, 0, 1, 1,
-0.1634864, -1.052558, -3.691282, 1, 0, 0, 1, 1,
-0.1614344, 1.22886, 1.474511, 1, 0, 0, 1, 1,
-0.1590673, -0.08253317, -2.82704, 1, 0, 0, 1, 1,
-0.1531406, 1.29655, -0.2906139, 0, 0, 0, 1, 1,
-0.1523572, 1.292257, 0.1860216, 0, 0, 0, 1, 1,
-0.150593, -0.264991, -1.236857, 0, 0, 0, 1, 1,
-0.1485465, 0.2436888, -0.0005398782, 0, 0, 0, 1, 1,
-0.1463871, 0.1549536, -0.4451374, 0, 0, 0, 1, 1,
-0.1462984, 0.07590643, -1.918726, 0, 0, 0, 1, 1,
-0.1415264, 0.8067074, -1.303493, 0, 0, 0, 1, 1,
-0.1340153, 1.727208, 0.4517287, 1, 1, 1, 1, 1,
-0.1323266, 1.037746, -0.008064719, 1, 1, 1, 1, 1,
-0.1314054, -0.9464505, -2.358868, 1, 1, 1, 1, 1,
-0.1313079, -0.1640188, -2.170899, 1, 1, 1, 1, 1,
-0.1285891, 1.754706, 0.7763761, 1, 1, 1, 1, 1,
-0.1270692, 0.8573897, 0.4108454, 1, 1, 1, 1, 1,
-0.1251909, 0.2926333, -1.367597, 1, 1, 1, 1, 1,
-0.1218765, -0.7705825, -3.114288, 1, 1, 1, 1, 1,
-0.1175478, 0.2565404, 0.9655243, 1, 1, 1, 1, 1,
-0.1148736, -1.475066, -2.037812, 1, 1, 1, 1, 1,
-0.1113414, 0.3245169, -0.8921915, 1, 1, 1, 1, 1,
-0.1102346, -0.2884022, -1.897202, 1, 1, 1, 1, 1,
-0.1101703, -0.2853017, -4.265703, 1, 1, 1, 1, 1,
-0.1095577, 1.427327, 1.498203, 1, 1, 1, 1, 1,
-0.1093242, -0.7510139, -4.02783, 1, 1, 1, 1, 1,
-0.1064392, 1.276467, 0.197767, 0, 0, 1, 1, 1,
-0.1060173, -0.9642608, -3.959552, 1, 0, 0, 1, 1,
-0.1055819, -0.3289963, -3.913444, 1, 0, 0, 1, 1,
-0.09926039, 0.8381869, 0.929097, 1, 0, 0, 1, 1,
-0.09764414, 0.5525536, 0.55778, 1, 0, 0, 1, 1,
-0.09645342, 0.336199, -0.01339489, 1, 0, 0, 1, 1,
-0.09098469, -1.179414, -2.76362, 0, 0, 0, 1, 1,
-0.08751236, -1.098901, -4.20023, 0, 0, 0, 1, 1,
-0.0871371, 0.122478, -2.102016, 0, 0, 0, 1, 1,
-0.08704918, -0.5707828, -4.102657, 0, 0, 0, 1, 1,
-0.08611168, 0.3497587, -1.105386, 0, 0, 0, 1, 1,
-0.08405507, 1.056336, -0.9533006, 0, 0, 0, 1, 1,
-0.08351355, 0.4249119, -0.4394318, 0, 0, 0, 1, 1,
-0.07908737, -0.8313543, -1.89792, 1, 1, 1, 1, 1,
-0.07675195, -0.5501888, -3.447667, 1, 1, 1, 1, 1,
-0.07664356, 2.507761, -0.1071287, 1, 1, 1, 1, 1,
-0.0717453, -1.025593, -2.756205, 1, 1, 1, 1, 1,
-0.07138217, 0.657161, 0.9185857, 1, 1, 1, 1, 1,
-0.07072733, -1.727601, -3.44056, 1, 1, 1, 1, 1,
-0.06919247, 0.5200751, 0.169568, 1, 1, 1, 1, 1,
-0.06507009, -0.4257067, -4.972519, 1, 1, 1, 1, 1,
-0.06114868, 1.090587, 0.6858262, 1, 1, 1, 1, 1,
-0.05988577, 0.04831166, 0.2320428, 1, 1, 1, 1, 1,
-0.05566965, -0.09478645, -3.047191, 1, 1, 1, 1, 1,
-0.05434779, 0.2036061, 1.432658, 1, 1, 1, 1, 1,
-0.05166784, 0.4165295, -1.207947, 1, 1, 1, 1, 1,
-0.05104474, -0.8047601, -4.512995, 1, 1, 1, 1, 1,
-0.04808064, -0.1014171, -4.275599, 1, 1, 1, 1, 1,
-0.04790566, -0.9779705, -2.699535, 0, 0, 1, 1, 1,
-0.04780554, -0.8497205, -3.229146, 1, 0, 0, 1, 1,
-0.04548934, -1.984325, -3.113706, 1, 0, 0, 1, 1,
-0.04493733, -1.283756, -3.498415, 1, 0, 0, 1, 1,
-0.04178592, 1.099121, -0.725481, 1, 0, 0, 1, 1,
-0.04052134, -0.8672419, -3.431737, 1, 0, 0, 1, 1,
-0.04030946, -0.4939034, -4.863904, 0, 0, 0, 1, 1,
-0.03693086, -1.791107, -2.536001, 0, 0, 0, 1, 1,
-0.03411189, 0.8189515, -1.745247, 0, 0, 0, 1, 1,
-0.03256894, 0.1695523, 0.649909, 0, 0, 0, 1, 1,
-0.02877853, -0.2259178, -2.301003, 0, 0, 0, 1, 1,
-0.02523224, -0.2022351, -4.747446, 0, 0, 0, 1, 1,
-0.02325564, -0.1254238, -1.787822, 0, 0, 0, 1, 1,
-0.02122785, 0.832039, -0.3062224, 1, 1, 1, 1, 1,
-0.02120921, 0.4107839, -0.2689996, 1, 1, 1, 1, 1,
-0.02036155, 1.760506, 0.7154897, 1, 1, 1, 1, 1,
-0.009621291, 1.069614, 0.8756524, 1, 1, 1, 1, 1,
-0.00633969, -0.9489099, -2.384591, 1, 1, 1, 1, 1,
-0.002584496, -0.07914168, -3.490484, 1, 1, 1, 1, 1,
0.001374948, 0.5889871, 1.365272, 1, 1, 1, 1, 1,
0.003905268, -1.858455, 3.161175, 1, 1, 1, 1, 1,
0.008927647, 0.04247806, -0.6472366, 1, 1, 1, 1, 1,
0.01009624, 1.921733, -1.446334, 1, 1, 1, 1, 1,
0.01336616, 0.3606412, -1.203111, 1, 1, 1, 1, 1,
0.01369987, -2.374351, 4.476399, 1, 1, 1, 1, 1,
0.01603379, -0.06875002, 1.058623, 1, 1, 1, 1, 1,
0.0162818, -0.4066403, 3.091632, 1, 1, 1, 1, 1,
0.0173356, -2.403759, 5.123474, 1, 1, 1, 1, 1,
0.02603107, 0.8242267, -0.6655241, 0, 0, 1, 1, 1,
0.03020286, 2.740374, 1.005939, 1, 0, 0, 1, 1,
0.03054004, 1.479487, 1.924212, 1, 0, 0, 1, 1,
0.03310888, 0.06818382, 0.08818019, 1, 0, 0, 1, 1,
0.03594765, 0.5567313, 1.556711, 1, 0, 0, 1, 1,
0.03869354, -0.7836491, 1.90576, 1, 0, 0, 1, 1,
0.04312559, 0.9013002, 0.9162119, 0, 0, 0, 1, 1,
0.04747166, -0.8042622, 4.346506, 0, 0, 0, 1, 1,
0.05984279, 1.106626, 0.3563542, 0, 0, 0, 1, 1,
0.06239302, -0.7270085, 2.410835, 0, 0, 0, 1, 1,
0.0626606, -0.7061467, 2.904917, 0, 0, 0, 1, 1,
0.06680838, 0.2074267, 0.3835959, 0, 0, 0, 1, 1,
0.06775642, -1.866031, 4.131729, 0, 0, 0, 1, 1,
0.06863351, 0.6685929, -0.5807549, 1, 1, 1, 1, 1,
0.06927922, -0.1143309, 2.608552, 1, 1, 1, 1, 1,
0.0825237, -1.580193, 3.650431, 1, 1, 1, 1, 1,
0.08404046, -0.8013038, 2.281524, 1, 1, 1, 1, 1,
0.08570802, 1.100693, -0.3724129, 1, 1, 1, 1, 1,
0.08652093, 1.130011, -0.7594216, 1, 1, 1, 1, 1,
0.0881457, 0.6193576, 1.889425, 1, 1, 1, 1, 1,
0.08877316, 0.1615106, 0.8316217, 1, 1, 1, 1, 1,
0.08966009, 0.03389217, 1.216768, 1, 1, 1, 1, 1,
0.09160808, 0.8788127, 0.5178881, 1, 1, 1, 1, 1,
0.09252542, -0.5456981, 1.615638, 1, 1, 1, 1, 1,
0.09272011, -1.481006, 2.054299, 1, 1, 1, 1, 1,
0.0981327, -1.314723, 2.660783, 1, 1, 1, 1, 1,
0.0982611, 0.1149404, 1.501157, 1, 1, 1, 1, 1,
0.1014969, 0.6831101, 0.201306, 1, 1, 1, 1, 1,
0.1027493, 0.1236258, -1.607216, 0, 0, 1, 1, 1,
0.1075306, 0.06236628, 1.157179, 1, 0, 0, 1, 1,
0.1088658, -0.3127786, 2.840283, 1, 0, 0, 1, 1,
0.1148059, 0.7029243, 1.434074, 1, 0, 0, 1, 1,
0.1178527, 0.008217885, 1.675731, 1, 0, 0, 1, 1,
0.1179855, -0.3702224, 1.881922, 1, 0, 0, 1, 1,
0.1206463, 0.3618671, -0.3328165, 0, 0, 0, 1, 1,
0.1212902, 0.6329157, 0.3137013, 0, 0, 0, 1, 1,
0.1254168, -0.7036178, 4.23374, 0, 0, 0, 1, 1,
0.1300425, 0.6539624, -0.02094371, 0, 0, 0, 1, 1,
0.1336666, 1.789411, -0.4796581, 0, 0, 0, 1, 1,
0.1360143, 0.2107135, 0.5232772, 0, 0, 0, 1, 1,
0.1369579, -2.108521, 2.911339, 0, 0, 0, 1, 1,
0.1381368, -0.5880033, 3.175942, 1, 1, 1, 1, 1,
0.1392712, 0.2536705, 1.865553, 1, 1, 1, 1, 1,
0.1447688, 0.3015771, 0.3828421, 1, 1, 1, 1, 1,
0.1466285, 0.7867082, -0.505025, 1, 1, 1, 1, 1,
0.1491057, 1.334866, -0.8603153, 1, 1, 1, 1, 1,
0.1529966, -1.646536, 4.252994, 1, 1, 1, 1, 1,
0.1557853, -0.6412441, 3.890018, 1, 1, 1, 1, 1,
0.1625288, -0.7159197, 2.464499, 1, 1, 1, 1, 1,
0.1627038, -1.064031, 1.259536, 1, 1, 1, 1, 1,
0.1650729, 0.2943633, -0.1857205, 1, 1, 1, 1, 1,
0.1672453, -0.108328, 3.630846, 1, 1, 1, 1, 1,
0.1682349, 0.3946341, -0.3217453, 1, 1, 1, 1, 1,
0.1700988, -0.6238596, 2.806653, 1, 1, 1, 1, 1,
0.1712496, 0.2410659, 0.2380276, 1, 1, 1, 1, 1,
0.1748186, -0.09972738, 2.171434, 1, 1, 1, 1, 1,
0.1750304, 1.477948, 0.2699083, 0, 0, 1, 1, 1,
0.1765127, -0.322918, 2.341484, 1, 0, 0, 1, 1,
0.1816497, -0.1421203, 1.008852, 1, 0, 0, 1, 1,
0.1840393, -0.9173121, 1.386031, 1, 0, 0, 1, 1,
0.1870849, 0.5229077, 0.1008605, 1, 0, 0, 1, 1,
0.1915356, 0.8724088, 1.153663, 1, 0, 0, 1, 1,
0.1939298, 0.02031033, 1.533943, 0, 0, 0, 1, 1,
0.1988502, 0.6352937, 0.4333054, 0, 0, 0, 1, 1,
0.2007188, -0.2598377, 2.805597, 0, 0, 0, 1, 1,
0.2028349, 2.61256, -1.91041, 0, 0, 0, 1, 1,
0.2047427, -0.2522839, 4.002192, 0, 0, 0, 1, 1,
0.207222, 0.8687241, -0.2475939, 0, 0, 0, 1, 1,
0.2199225, -1.208322, 2.289132, 0, 0, 0, 1, 1,
0.2228771, -0.2451616, 2.61748, 1, 1, 1, 1, 1,
0.2236751, -1.113798, 3.79871, 1, 1, 1, 1, 1,
0.2254868, -0.9334491, 3.756372, 1, 1, 1, 1, 1,
0.2274698, 0.01432805, 1.640077, 1, 1, 1, 1, 1,
0.2288792, 0.9626577, 0.9516288, 1, 1, 1, 1, 1,
0.2329236, 0.6116981, 0.3671007, 1, 1, 1, 1, 1,
0.232948, 0.108939, 0.5547159, 1, 1, 1, 1, 1,
0.2380355, -0.1087192, 1.882357, 1, 1, 1, 1, 1,
0.238388, 1.716155, -0.17612, 1, 1, 1, 1, 1,
0.2397477, -0.337062, 2.889641, 1, 1, 1, 1, 1,
0.2412156, -0.4197972, 3.835472, 1, 1, 1, 1, 1,
0.2451757, -1.444606, 5.211182, 1, 1, 1, 1, 1,
0.2462747, -2.143431, 2.410259, 1, 1, 1, 1, 1,
0.2482722, 0.3839557, 0.5853199, 1, 1, 1, 1, 1,
0.250947, -1.748827, 1.948814, 1, 1, 1, 1, 1,
0.251282, -1.430135, 1.098063, 0, 0, 1, 1, 1,
0.2516385, -1.106657, 3.556306, 1, 0, 0, 1, 1,
0.2522011, -0.1721379, 2.761703, 1, 0, 0, 1, 1,
0.2562498, 0.5915729, -0.05956353, 1, 0, 0, 1, 1,
0.2567612, -2.382378, 3.375099, 1, 0, 0, 1, 1,
0.2570808, 0.7146156, 0.1754303, 1, 0, 0, 1, 1,
0.2575269, 1.367568, 0.3172683, 0, 0, 0, 1, 1,
0.2577484, 0.7249567, -1.712092, 0, 0, 0, 1, 1,
0.2609694, -2.434311, 2.901168, 0, 0, 0, 1, 1,
0.261703, 0.9733154, 0.2495883, 0, 0, 0, 1, 1,
0.2646561, -2.327114, 3.022724, 0, 0, 0, 1, 1,
0.2694852, -0.1155309, 2.240549, 0, 0, 0, 1, 1,
0.2709247, 0.354466, 2.575872, 0, 0, 0, 1, 1,
0.272558, -0.07190479, 2.112959, 1, 1, 1, 1, 1,
0.2740167, -0.9489198, 3.129107, 1, 1, 1, 1, 1,
0.2752202, -1.061792, 3.666249, 1, 1, 1, 1, 1,
0.2771617, 0.7995644, 0.5516853, 1, 1, 1, 1, 1,
0.277623, 0.4813564, -0.2324754, 1, 1, 1, 1, 1,
0.2793756, -2.818064, 3.979364, 1, 1, 1, 1, 1,
0.2824153, -0.4739159, 2.583646, 1, 1, 1, 1, 1,
0.2873098, -0.5047663, 2.250482, 1, 1, 1, 1, 1,
0.2891633, -0.3696961, 3.418724, 1, 1, 1, 1, 1,
0.2892967, 0.9188249, 1.126272, 1, 1, 1, 1, 1,
0.2931617, -0.2001653, 2.033408, 1, 1, 1, 1, 1,
0.2948923, 1.04828, -0.6914539, 1, 1, 1, 1, 1,
0.2957259, 0.3764072, -0.636347, 1, 1, 1, 1, 1,
0.296261, -0.6601772, 3.2519, 1, 1, 1, 1, 1,
0.300053, 0.7796162, 0.8366762, 1, 1, 1, 1, 1,
0.3013433, 0.3808586, 0.1079289, 0, 0, 1, 1, 1,
0.3049578, -0.894576, 3.620601, 1, 0, 0, 1, 1,
0.3166945, 1.164501, -0.7586491, 1, 0, 0, 1, 1,
0.3217811, 0.533372, -0.09844627, 1, 0, 0, 1, 1,
0.3232363, 0.8920054, 0.6149134, 1, 0, 0, 1, 1,
0.3233163, -0.4504453, 1.035334, 1, 0, 0, 1, 1,
0.3287455, -0.9382927, 3.275713, 0, 0, 0, 1, 1,
0.3327561, 0.870017, 0.05121962, 0, 0, 0, 1, 1,
0.333902, 0.879437, 1.454918, 0, 0, 0, 1, 1,
0.3340002, 1.328005, 0.127357, 0, 0, 0, 1, 1,
0.335157, -0.3584883, 1.92738, 0, 0, 0, 1, 1,
0.3369344, 0.1589832, 1.482349, 0, 0, 0, 1, 1,
0.3384321, 0.8286037, 0.2985733, 0, 0, 0, 1, 1,
0.3411899, -0.223175, 3.00457, 1, 1, 1, 1, 1,
0.3423978, 0.6203908, 0.5583345, 1, 1, 1, 1, 1,
0.3523688, 0.378684, -1.455092, 1, 1, 1, 1, 1,
0.3547909, -0.2424936, 1.008514, 1, 1, 1, 1, 1,
0.357413, 0.2219866, 3.119769, 1, 1, 1, 1, 1,
0.3655186, 0.03170293, 0.322066, 1, 1, 1, 1, 1,
0.3661518, 0.5334082, -0.4143096, 1, 1, 1, 1, 1,
0.3679926, 0.6227844, 0.4300655, 1, 1, 1, 1, 1,
0.3688778, 0.765872, -0.4187396, 1, 1, 1, 1, 1,
0.3692428, -0.098887, 1.173113, 1, 1, 1, 1, 1,
0.3732738, -0.5897242, 4.114162, 1, 1, 1, 1, 1,
0.3787269, -0.006903629, 3.09986, 1, 1, 1, 1, 1,
0.3828094, 0.2788431, 2.181946, 1, 1, 1, 1, 1,
0.387019, -0.2867903, 0.6654086, 1, 1, 1, 1, 1,
0.388372, 0.5914428, 0.6760755, 1, 1, 1, 1, 1,
0.3943101, 0.2858504, -0.008751694, 0, 0, 1, 1, 1,
0.396034, 0.3402223, -1.254419, 1, 0, 0, 1, 1,
0.3965459, -0.2660041, 3.847578, 1, 0, 0, 1, 1,
0.3973024, 0.9928811, -0.9340437, 1, 0, 0, 1, 1,
0.4012785, -0.4526813, 0.914795, 1, 0, 0, 1, 1,
0.4051602, -1.580208, 2.149157, 1, 0, 0, 1, 1,
0.4073797, 1.05646, 0.9886822, 0, 0, 0, 1, 1,
0.4097234, -0.955121, 1.650609, 0, 0, 0, 1, 1,
0.4097447, -1.987168, 2.901026, 0, 0, 0, 1, 1,
0.412096, 0.7235482, 0.8889316, 0, 0, 0, 1, 1,
0.4138217, 0.144285, -0.3241121, 0, 0, 0, 1, 1,
0.4157395, 1.437619, -2.151611, 0, 0, 0, 1, 1,
0.4159748, 2.307651, -1.065374, 0, 0, 0, 1, 1,
0.4172931, -0.1140781, 0.8891596, 1, 1, 1, 1, 1,
0.4200405, -0.08470684, 2.591767, 1, 1, 1, 1, 1,
0.4202881, -0.7652841, 4.410269, 1, 1, 1, 1, 1,
0.4221924, -1.07038, 1.338348, 1, 1, 1, 1, 1,
0.4228873, -0.3713306, 3.058068, 1, 1, 1, 1, 1,
0.4298654, -0.3921669, 1.124759, 1, 1, 1, 1, 1,
0.4434059, -0.8991269, 4.292805, 1, 1, 1, 1, 1,
0.4467787, -0.4678694, 3.161194, 1, 1, 1, 1, 1,
0.4469241, -0.3040669, 2.947432, 1, 1, 1, 1, 1,
0.4502227, 0.7791071, -1.247787, 1, 1, 1, 1, 1,
0.452732, -0.2611132, 1.885254, 1, 1, 1, 1, 1,
0.453437, -0.6667827, 2.564291, 1, 1, 1, 1, 1,
0.4638162, -0.4607963, 2.022339, 1, 1, 1, 1, 1,
0.4645602, 0.827768, 1.037513, 1, 1, 1, 1, 1,
0.4671267, 0.7750642, 0.6986869, 1, 1, 1, 1, 1,
0.4702253, 2.168089, -0.2508835, 0, 0, 1, 1, 1,
0.4749762, -1.334903, 4.109482, 1, 0, 0, 1, 1,
0.4759626, -0.3223569, 3.172931, 1, 0, 0, 1, 1,
0.4803474, -0.6202131, 3.22926, 1, 0, 0, 1, 1,
0.4833467, 0.0550088, 0.679428, 1, 0, 0, 1, 1,
0.4853092, 1.286169, 0.3613602, 1, 0, 0, 1, 1,
0.4865839, -2.204187, 2.857933, 0, 0, 0, 1, 1,
0.4873891, -0.2987828, 2.654656, 0, 0, 0, 1, 1,
0.4904288, 0.8180742, 2.186252, 0, 0, 0, 1, 1,
0.4911456, -0.3521381, 1.465435, 0, 0, 0, 1, 1,
0.5069875, 0.1673699, 2.234189, 0, 0, 0, 1, 1,
0.5173753, 1.527442, 0.07062225, 0, 0, 0, 1, 1,
0.5205962, -0.7907486, 3.00627, 0, 0, 0, 1, 1,
0.5209672, -0.851032, 3.822915, 1, 1, 1, 1, 1,
0.5216134, -1.050137, 4.62575, 1, 1, 1, 1, 1,
0.5229135, -0.06873096, 1.16569, 1, 1, 1, 1, 1,
0.5231723, -0.6397145, 0.9246451, 1, 1, 1, 1, 1,
0.5298315, -0.1156402, 2.346817, 1, 1, 1, 1, 1,
0.5309377, 0.1385759, 1.90734, 1, 1, 1, 1, 1,
0.5344355, 0.0874844, 0.04096479, 1, 1, 1, 1, 1,
0.5399097, 0.06586313, 2.357881, 1, 1, 1, 1, 1,
0.542851, 0.6202009, -0.692, 1, 1, 1, 1, 1,
0.5470318, -1.047036, 0.6220655, 1, 1, 1, 1, 1,
0.5560944, 0.6055781, 0.3801691, 1, 1, 1, 1, 1,
0.5597202, 0.2465886, 1.074289, 1, 1, 1, 1, 1,
0.5618426, -0.1711603, 0.6298318, 1, 1, 1, 1, 1,
0.561942, -0.1122666, 2.653167, 1, 1, 1, 1, 1,
0.5649194, -1.303255, 1.343896, 1, 1, 1, 1, 1,
0.5662025, -1.132229, 2.973887, 0, 0, 1, 1, 1,
0.566935, -0.07757734, 1.003335, 1, 0, 0, 1, 1,
0.571102, 0.4984702, 0.2219432, 1, 0, 0, 1, 1,
0.5716681, 0.3522441, 1.692761, 1, 0, 0, 1, 1,
0.5907661, 2.760402, -0.1107928, 1, 0, 0, 1, 1,
0.5952769, 0.1265454, 1.279032, 1, 0, 0, 1, 1,
0.5997146, -3.669289, 3.485985, 0, 0, 0, 1, 1,
0.6002123, -1.498874, 2.461669, 0, 0, 0, 1, 1,
0.6062136, 0.2347715, 1.042397, 0, 0, 0, 1, 1,
0.6096858, -0.620892, 2.045525, 0, 0, 0, 1, 1,
0.6144144, -1.342065, 3.468313, 0, 0, 0, 1, 1,
0.6162829, -1.05517, 2.853125, 0, 0, 0, 1, 1,
0.6244408, 0.9399829, -0.8838388, 0, 0, 0, 1, 1,
0.6258532, -0.8981342, 1.460943, 1, 1, 1, 1, 1,
0.6397402, -0.6989068, 2.186307, 1, 1, 1, 1, 1,
0.6416098, -0.005596403, 1.993133, 1, 1, 1, 1, 1,
0.6416163, 0.1505369, 3.865805, 1, 1, 1, 1, 1,
0.6543093, 1.954903, 0.3743213, 1, 1, 1, 1, 1,
0.6549917, 0.5982343, 1.427248, 1, 1, 1, 1, 1,
0.6551791, -0.354146, 2.857234, 1, 1, 1, 1, 1,
0.6573799, 1.064759, 0.9745997, 1, 1, 1, 1, 1,
0.6649816, 1.115756, -0.3728915, 1, 1, 1, 1, 1,
0.6655478, 0.1102024, 1.25116, 1, 1, 1, 1, 1,
0.6700046, 0.3019392, 0.7537628, 1, 1, 1, 1, 1,
0.6725448, 0.4372179, -0.4371182, 1, 1, 1, 1, 1,
0.6728889, 0.0679905, 0.3965202, 1, 1, 1, 1, 1,
0.6769565, 0.8828745, 0.9907634, 1, 1, 1, 1, 1,
0.6781929, -0.4691528, 2.179199, 1, 1, 1, 1, 1,
0.6800793, 1.816082, -0.273011, 0, 0, 1, 1, 1,
0.681384, 0.6911103, 1.0502, 1, 0, 0, 1, 1,
0.6833827, -0.4053924, 0.2205184, 1, 0, 0, 1, 1,
0.6898855, -0.5938362, 3.238994, 1, 0, 0, 1, 1,
0.6945526, -1.169742, 3.056272, 1, 0, 0, 1, 1,
0.6948166, -0.5914221, 3.235312, 1, 0, 0, 1, 1,
0.6952326, -0.3237721, 2.37086, 0, 0, 0, 1, 1,
0.6953277, 0.1292712, 1.126639, 0, 0, 0, 1, 1,
0.6975125, -1.154535, 2.06878, 0, 0, 0, 1, 1,
0.7076416, -1.1838, 3.524419, 0, 0, 0, 1, 1,
0.7213129, -0.3819618, 1.991832, 0, 0, 0, 1, 1,
0.7222083, 0.8674846, 0.02953326, 0, 0, 0, 1, 1,
0.7248908, -0.06016178, 2.321262, 0, 0, 0, 1, 1,
0.7257887, -0.2528363, 0.9870197, 1, 1, 1, 1, 1,
0.7434038, -1.370334, 2.902516, 1, 1, 1, 1, 1,
0.747199, 0.2406479, 1.580449, 1, 1, 1, 1, 1,
0.7539517, -0.3956747, 2.675005, 1, 1, 1, 1, 1,
0.7544783, -1.362483, 4.051116, 1, 1, 1, 1, 1,
0.7567009, -0.2913896, 1.260034, 1, 1, 1, 1, 1,
0.7624542, -1.034723, 1.718614, 1, 1, 1, 1, 1,
0.7659779, 0.5199941, 2.229171, 1, 1, 1, 1, 1,
0.7661102, 0.1859338, 2.474652, 1, 1, 1, 1, 1,
0.7698016, 0.6185818, 0.2285695, 1, 1, 1, 1, 1,
0.7773525, -1.268124, 2.489192, 1, 1, 1, 1, 1,
0.7780737, 0.4594204, 1.57994, 1, 1, 1, 1, 1,
0.7783701, -0.1953858, 3.914765, 1, 1, 1, 1, 1,
0.7821184, -0.1661812, 1.927739, 1, 1, 1, 1, 1,
0.7881382, 0.3641722, 1.152429, 1, 1, 1, 1, 1,
0.801572, -0.9384611, 2.840585, 0, 0, 1, 1, 1,
0.8043395, 0.287416, -0.4839921, 1, 0, 0, 1, 1,
0.806116, -0.3198695, 2.600699, 1, 0, 0, 1, 1,
0.8133529, 0.2141633, 0.7742807, 1, 0, 0, 1, 1,
0.8198743, 0.1767464, 2.22858, 1, 0, 0, 1, 1,
0.8255644, 0.8701316, 0.2593705, 1, 0, 0, 1, 1,
0.8282853, 0.6180784, 1.917007, 0, 0, 0, 1, 1,
0.8346412, 1.213567, 1.666773, 0, 0, 0, 1, 1,
0.8411475, 0.1608158, 2.610943, 0, 0, 0, 1, 1,
0.8431621, -2.586891, 1.915299, 0, 0, 0, 1, 1,
0.8480359, 2.11221, -0.2010092, 0, 0, 0, 1, 1,
0.8490461, 0.3163545, 3.578166, 0, 0, 0, 1, 1,
0.8513706, 0.5173906, 1.177576, 0, 0, 0, 1, 1,
0.8518853, 0.4038432, 3.466681, 1, 1, 1, 1, 1,
0.8522467, -0.7926783, 3.16026, 1, 1, 1, 1, 1,
0.8534419, -0.6535013, 2.154018, 1, 1, 1, 1, 1,
0.8558605, -0.299737, 0.6964847, 1, 1, 1, 1, 1,
0.8624023, -0.4500704, 1.853808, 1, 1, 1, 1, 1,
0.8637571, 0.8203034, 1.82596, 1, 1, 1, 1, 1,
0.8790629, 0.1167797, 0.7182006, 1, 1, 1, 1, 1,
0.8803367, -0.6381752, 1.597083, 1, 1, 1, 1, 1,
0.8812014, 1.176519, 1.353248, 1, 1, 1, 1, 1,
0.8821644, 1.260713, -0.1720259, 1, 1, 1, 1, 1,
0.8888414, 0.6993965, -0.005269072, 1, 1, 1, 1, 1,
0.8907215, -0.7568665, 2.545576, 1, 1, 1, 1, 1,
0.8909319, -1.781911, 0.4883247, 1, 1, 1, 1, 1,
0.8964844, -0.98129, 1.142594, 1, 1, 1, 1, 1,
0.8981905, -0.2777353, 1.561117, 1, 1, 1, 1, 1,
0.9053665, -1.525213, 2.46414, 0, 0, 1, 1, 1,
0.9097197, -1.224747, 2.449481, 1, 0, 0, 1, 1,
0.9241618, -1.637893, 2.177408, 1, 0, 0, 1, 1,
0.9267379, 1.443414, 0.1839141, 1, 0, 0, 1, 1,
0.9276066, 2.521753, 1.498598, 1, 0, 0, 1, 1,
0.9319787, 0.44246, 1.746491, 1, 0, 0, 1, 1,
0.9333878, -0.4121919, 0.9460258, 0, 0, 0, 1, 1,
0.9365888, -1.277211, 2.405285, 0, 0, 0, 1, 1,
0.9443728, 0.8053244, 1.930393, 0, 0, 0, 1, 1,
0.9487465, -0.3092957, 4.674335, 0, 0, 0, 1, 1,
0.9487963, -0.02820151, 1.501697, 0, 0, 0, 1, 1,
0.9501472, 0.6248595, 0.9670173, 0, 0, 0, 1, 1,
0.9518142, -0.7935117, 0.4232363, 0, 0, 0, 1, 1,
0.953486, 2.068426, 1.531082, 1, 1, 1, 1, 1,
0.9604756, 2.169494, 0.5464159, 1, 1, 1, 1, 1,
0.9617675, 0.3614895, 1.889519, 1, 1, 1, 1, 1,
0.9629996, 0.2434806, 0.8493028, 1, 1, 1, 1, 1,
0.9647842, -0.3825501, 1.563051, 1, 1, 1, 1, 1,
0.9670591, -0.9082716, 3.41561, 1, 1, 1, 1, 1,
0.9680226, -0.781477, 2.296733, 1, 1, 1, 1, 1,
0.9707811, 0.6693637, 1.350387, 1, 1, 1, 1, 1,
0.9763971, 0.2178087, 1.799883, 1, 1, 1, 1, 1,
0.9779019, -1.15249, 2.142377, 1, 1, 1, 1, 1,
0.9804215, -0.1117333, 2.224347, 1, 1, 1, 1, 1,
0.9893988, -1.888457, 2.639112, 1, 1, 1, 1, 1,
0.9923295, 0.5838223, 1.51921, 1, 1, 1, 1, 1,
0.9927461, 0.2295371, 2.341519, 1, 1, 1, 1, 1,
0.995935, 1.279711, 1.717359, 1, 1, 1, 1, 1,
1.002945, -0.07245278, 1.802608, 0, 0, 1, 1, 1,
1.002981, -0.2429319, 1.19997, 1, 0, 0, 1, 1,
1.003895, 0.3872778, 2.06443, 1, 0, 0, 1, 1,
1.013707, -0.6485925, 0.7975311, 1, 0, 0, 1, 1,
1.019856, 0.7137341, 1.977885, 1, 0, 0, 1, 1,
1.020026, 0.6819263, 0.1262474, 1, 0, 0, 1, 1,
1.022626, 0.6767207, 1.497806, 0, 0, 0, 1, 1,
1.025669, 0.4476771, 1.840566, 0, 0, 0, 1, 1,
1.026175, -0.9708341, 2.894922, 0, 0, 0, 1, 1,
1.029655, 0.3313695, 2.896816, 0, 0, 0, 1, 1,
1.039076, -0.675945, 3.732702, 0, 0, 0, 1, 1,
1.043058, -0.6517742, 1.678742, 0, 0, 0, 1, 1,
1.04404, -0.2221749, 4.198616, 0, 0, 0, 1, 1,
1.048608, 0.2871357, 1.693037, 1, 1, 1, 1, 1,
1.051508, -0.5392545, 3.283062, 1, 1, 1, 1, 1,
1.053528, -0.00412246, -0.4619943, 1, 1, 1, 1, 1,
1.056036, 0.6607759, 1.022406, 1, 1, 1, 1, 1,
1.076644, -1.815059, 2.406316, 1, 1, 1, 1, 1,
1.080298, -0.2385971, -0.01159975, 1, 1, 1, 1, 1,
1.084891, 0.3761445, 1.855082, 1, 1, 1, 1, 1,
1.094284, -1.31168, 2.264318, 1, 1, 1, 1, 1,
1.095974, -1.827234, 2.290543, 1, 1, 1, 1, 1,
1.097211, 0.066437, 1.00514, 1, 1, 1, 1, 1,
1.09932, -2.267382, 1.549578, 1, 1, 1, 1, 1,
1.10193, 0.6614257, 1.007357, 1, 1, 1, 1, 1,
1.104509, -0.2426382, 1.187597, 1, 1, 1, 1, 1,
1.108, 1.577103, -0.3808704, 1, 1, 1, 1, 1,
1.112972, 0.04752276, 1.283286, 1, 1, 1, 1, 1,
1.126039, 0.51054, -0.4288681, 0, 0, 1, 1, 1,
1.130185, -1.150054, 1.564757, 1, 0, 0, 1, 1,
1.133213, 0.04536732, 1.751601, 1, 0, 0, 1, 1,
1.135537, -2.026188, 2.954113, 1, 0, 0, 1, 1,
1.139066, 1.519222, 1.618056, 1, 0, 0, 1, 1,
1.146726, -0.1329052, 2.514404, 1, 0, 0, 1, 1,
1.152783, 0.9609401, 1.796394, 0, 0, 0, 1, 1,
1.154222, 0.1857846, 2.23899, 0, 0, 0, 1, 1,
1.156943, 0.0766068, 1.61965, 0, 0, 0, 1, 1,
1.160437, -0.0502492, 1.153318, 0, 0, 0, 1, 1,
1.162392, -0.8902227, 1.421853, 0, 0, 0, 1, 1,
1.163663, 0.9458265, 1.063755, 0, 0, 0, 1, 1,
1.164112, 0.1828978, 0.9168298, 0, 0, 0, 1, 1,
1.164803, -0.1986471, 0.5288841, 1, 1, 1, 1, 1,
1.165765, 1.650805, 1.85084, 1, 1, 1, 1, 1,
1.177137, 2.682206, 0.4696109, 1, 1, 1, 1, 1,
1.177975, 1.185979, -0.2560677, 1, 1, 1, 1, 1,
1.179847, -0.5118245, 2.421707, 1, 1, 1, 1, 1,
1.185727, 1.678666, 0.8092074, 1, 1, 1, 1, 1,
1.194077, 1.767328, 0.456958, 1, 1, 1, 1, 1,
1.196186, -1.397059, 1.722287, 1, 1, 1, 1, 1,
1.197649, 1.383076, 0.05408266, 1, 1, 1, 1, 1,
1.207268, 1.087587, 0.7783319, 1, 1, 1, 1, 1,
1.2211, 0.1148812, 1.88599, 1, 1, 1, 1, 1,
1.22256, -1.914537, 4.17993, 1, 1, 1, 1, 1,
1.230983, 0.2894693, 2.315458, 1, 1, 1, 1, 1,
1.241923, 0.6254525, 1.781386, 1, 1, 1, 1, 1,
1.241992, -0.1029911, 0.5079321, 1, 1, 1, 1, 1,
1.248482, -1.387821, 3.619552, 0, 0, 1, 1, 1,
1.250021, 0.05855354, 1.02872, 1, 0, 0, 1, 1,
1.252367, -1.652804, 1.922812, 1, 0, 0, 1, 1,
1.262891, -0.5348042, 2.480875, 1, 0, 0, 1, 1,
1.264342, -0.1811039, 2.222792, 1, 0, 0, 1, 1,
1.278031, -0.03416635, 1.777565, 1, 0, 0, 1, 1,
1.282451, 1.007931, 2.327223, 0, 0, 0, 1, 1,
1.292645, -2.023692, 4.096892, 0, 0, 0, 1, 1,
1.299146, -0.3482686, 1.474741, 0, 0, 0, 1, 1,
1.299555, 1.978153, -0.1237414, 0, 0, 0, 1, 1,
1.303724, -0.958213, 1.282912, 0, 0, 0, 1, 1,
1.309202, 0.3170459, 0.04452677, 0, 0, 0, 1, 1,
1.319837, 1.746096, -0.1229362, 0, 0, 0, 1, 1,
1.321805, 0.4586206, -0.9043137, 1, 1, 1, 1, 1,
1.321888, -0.8532167, 3.770457, 1, 1, 1, 1, 1,
1.323817, -0.508195, 2.329426, 1, 1, 1, 1, 1,
1.327615, -0.5048885, 1.721755, 1, 1, 1, 1, 1,
1.327837, -0.6698005, 2.162808, 1, 1, 1, 1, 1,
1.330647, 0.3214405, 0.8358017, 1, 1, 1, 1, 1,
1.33301, 0.3200531, 1.700298, 1, 1, 1, 1, 1,
1.334366, 0.174865, 0.9756231, 1, 1, 1, 1, 1,
1.341894, 0.6895346, 2.018541, 1, 1, 1, 1, 1,
1.347758, 2.158423, -0.3768224, 1, 1, 1, 1, 1,
1.357845, 0.8841205, -0.1884602, 1, 1, 1, 1, 1,
1.359788, -0.6625016, 2.7312, 1, 1, 1, 1, 1,
1.37359, 0.5663922, 3.594038, 1, 1, 1, 1, 1,
1.379932, -2.804118, 2.624427, 1, 1, 1, 1, 1,
1.389896, 0.6816485, 0.2063761, 1, 1, 1, 1, 1,
1.402122, -1.202101, 2.548007, 0, 0, 1, 1, 1,
1.410048, 0.9181434, 2.229045, 1, 0, 0, 1, 1,
1.410149, 0.7280558, 1.979217, 1, 0, 0, 1, 1,
1.410482, 0.4924742, 0.2496261, 1, 0, 0, 1, 1,
1.431068, -0.4242727, 1.803718, 1, 0, 0, 1, 1,
1.432557, 1.096362, 0.254238, 1, 0, 0, 1, 1,
1.440408, -0.3631476, 0.5806955, 0, 0, 0, 1, 1,
1.445035, 0.3114185, -0.9792634, 0, 0, 0, 1, 1,
1.454822, -2.073055, 4.948932, 0, 0, 0, 1, 1,
1.481257, -0.4879265, 2.73211, 0, 0, 0, 1, 1,
1.49776, 0.05354642, 1.186052, 0, 0, 0, 1, 1,
1.500864, 0.0008862026, 1.762538, 0, 0, 0, 1, 1,
1.519462, -1.292836, 3.163434, 0, 0, 0, 1, 1,
1.521823, 0.544094, 3.389129, 1, 1, 1, 1, 1,
1.52997, -0.3038155, 0.6533053, 1, 1, 1, 1, 1,
1.540891, 1.59047, 1.707522, 1, 1, 1, 1, 1,
1.549952, 0.1710405, 0.9742722, 1, 1, 1, 1, 1,
1.551756, 1.145249, 0.201038, 1, 1, 1, 1, 1,
1.555995, 1.365945, 2.225814, 1, 1, 1, 1, 1,
1.558576, 0.728071, 1.816355, 1, 1, 1, 1, 1,
1.563677, -0.1855088, 3.997832, 1, 1, 1, 1, 1,
1.57479, 0.9916152, 0.8235829, 1, 1, 1, 1, 1,
1.583744, 1.428061, 0.3855741, 1, 1, 1, 1, 1,
1.603384, -0.9681191, 0.96242, 1, 1, 1, 1, 1,
1.604427, -1.210381, 3.69988, 1, 1, 1, 1, 1,
1.614132, -0.04686245, 1.244403, 1, 1, 1, 1, 1,
1.627855, 1.428542, 1.075706, 1, 1, 1, 1, 1,
1.638826, 0.1919225, 1.801211, 1, 1, 1, 1, 1,
1.644119, 0.743884, 1.171118, 0, 0, 1, 1, 1,
1.644892, 2.797642, 0.675696, 1, 0, 0, 1, 1,
1.65545, 1.30564, 0.1558202, 1, 0, 0, 1, 1,
1.674134, -0.655297, 1.409012, 1, 0, 0, 1, 1,
1.674278, -1.874894, 2.282618, 1, 0, 0, 1, 1,
1.715796, -1.698663, 1.958286, 1, 0, 0, 1, 1,
1.717351, -0.4229215, 1.851281, 0, 0, 0, 1, 1,
1.720649, -0.3171335, 3.01132, 0, 0, 0, 1, 1,
1.729539, 0.6761187, 0.3519599, 0, 0, 0, 1, 1,
1.732387, -0.5077162, 2.57204, 0, 0, 0, 1, 1,
1.754741, 1.46677, 1.879613, 0, 0, 0, 1, 1,
1.761126, 0.1990401, 1.360812, 0, 0, 0, 1, 1,
1.790882, -1.237056, 3.06315, 0, 0, 0, 1, 1,
1.806824, 1.115383, 0.2475073, 1, 1, 1, 1, 1,
1.818359, -0.4252748, 0.2836505, 1, 1, 1, 1, 1,
1.825849, 0.8924922, -0.2031421, 1, 1, 1, 1, 1,
1.829632, -0.5386082, 1.372101, 1, 1, 1, 1, 1,
1.848355, -0.8370998, 1.811268, 1, 1, 1, 1, 1,
1.851982, -0.8472821, 0.8116685, 1, 1, 1, 1, 1,
1.884102, 0.6851099, 2.909638, 1, 1, 1, 1, 1,
1.90661, 0.8009239, 3.421574, 1, 1, 1, 1, 1,
1.908363, -0.5776914, 2.235601, 1, 1, 1, 1, 1,
1.956522, 0.6452655, 1.290287, 1, 1, 1, 1, 1,
1.967426, -0.5690591, 0.6153574, 1, 1, 1, 1, 1,
1.996561, 0.01478976, 0.5956241, 1, 1, 1, 1, 1,
1.996614, 0.2106351, 0.02872127, 1, 1, 1, 1, 1,
1.997428, 0.3791672, 2.930133, 1, 1, 1, 1, 1,
2.002342, 0.06521703, 2.985087, 1, 1, 1, 1, 1,
2.008794, -2.026977, 1.729788, 0, 0, 1, 1, 1,
2.038639, -1.829857, 3.040902, 1, 0, 0, 1, 1,
2.062793, 1.113752, 2.073244, 1, 0, 0, 1, 1,
2.069134, 0.763785, 1.498064, 1, 0, 0, 1, 1,
2.087034, -0.8474512, 2.861055, 1, 0, 0, 1, 1,
2.101437, 1.024465, 0.09800722, 1, 0, 0, 1, 1,
2.130822, 0.1800147, 1.800924, 0, 0, 0, 1, 1,
2.142708, 1.030792, 1.674512, 0, 0, 0, 1, 1,
2.152951, -1.110645, 2.148429, 0, 0, 0, 1, 1,
2.162927, -0.5182846, 2.031728, 0, 0, 0, 1, 1,
2.241547, 1.154504, 1.168305, 0, 0, 0, 1, 1,
2.316707, -0.533023, 2.107571, 0, 0, 0, 1, 1,
2.384963, -0.6466846, 0.5600954, 0, 0, 0, 1, 1,
2.400461, 0.7521443, 1.364752, 1, 1, 1, 1, 1,
2.423275, 0.5143525, 2.105671, 1, 1, 1, 1, 1,
2.453355, -0.8898247, 2.935784, 1, 1, 1, 1, 1,
2.501207, 0.8246164, 1.049429, 1, 1, 1, 1, 1,
2.686858, 1.752813, 1.487544, 1, 1, 1, 1, 1,
2.76037, -1.251335, 1.871161, 1, 1, 1, 1, 1,
3.009969, -0.2122185, 2.246128, 1, 1, 1, 1, 1
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
var radius = 9.330042;
var distance = 32.77138;
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
mvMatrix.translate( 0.1002655, 0.4340549, -0.1193314 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.77138);
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