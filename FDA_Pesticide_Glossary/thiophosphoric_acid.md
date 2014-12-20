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
-3.393136, -0.2335345, -2.317618, 1, 0, 0, 1,
-2.857177, 1.088018, -1.346775, 1, 0.007843138, 0, 1,
-2.748323, -0.8710547, -1.554158, 1, 0.01176471, 0, 1,
-2.631788, -0.684101, -2.749812, 1, 0.01960784, 0, 1,
-2.601199, -0.5736893, -2.127188, 1, 0.02352941, 0, 1,
-2.575739, 2.46214, -0.476073, 1, 0.03137255, 0, 1,
-2.49758, 1.700002, -1.793066, 1, 0.03529412, 0, 1,
-2.435051, -0.417642, -1.499882, 1, 0.04313726, 0, 1,
-2.423703, 0.2899656, -1.612199, 1, 0.04705882, 0, 1,
-2.416964, -0.4111499, -2.520768, 1, 0.05490196, 0, 1,
-2.346207, 0.3445754, -2.962424, 1, 0.05882353, 0, 1,
-2.328853, -1.014877, -2.73835, 1, 0.06666667, 0, 1,
-2.282279, 0.5900751, 0.7104149, 1, 0.07058824, 0, 1,
-2.2542, 0.8181777, -2.223644, 1, 0.07843138, 0, 1,
-2.243408, -0.4964868, -1.979535, 1, 0.08235294, 0, 1,
-2.243339, -1.857786, -3.431331, 1, 0.09019608, 0, 1,
-2.22423, -1.165615, -1.424808, 1, 0.09411765, 0, 1,
-2.1544, 1.823431, 0.01527104, 1, 0.1019608, 0, 1,
-2.138738, 0.4026461, -2.090472, 1, 0.1098039, 0, 1,
-2.122195, 0.04090415, -2.255211, 1, 0.1137255, 0, 1,
-2.077262, 0.8710225, -0.9527372, 1, 0.1215686, 0, 1,
-2.064037, 1.394255, -3.090257, 1, 0.1254902, 0, 1,
-2.062717, 0.3399806, -0.7935609, 1, 0.1333333, 0, 1,
-2.048656, 0.7499959, -1.161017, 1, 0.1372549, 0, 1,
-2.03578, -0.975201, -1.910328, 1, 0.145098, 0, 1,
-1.975898, 1.481901, 0.2767707, 1, 0.1490196, 0, 1,
-1.969587, 0.8910992, -1.934915, 1, 0.1568628, 0, 1,
-1.948568, 1.27763, 1.569822, 1, 0.1607843, 0, 1,
-1.947795, 1.029259, -0.3938318, 1, 0.1686275, 0, 1,
-1.947655, -0.8332952, -1.936345, 1, 0.172549, 0, 1,
-1.914317, -0.1610334, -1.122155, 1, 0.1803922, 0, 1,
-1.867836, 0.1246099, -1.596701, 1, 0.1843137, 0, 1,
-1.845072, 0.1295787, -1.4719, 1, 0.1921569, 0, 1,
-1.81402, 0.7517748, -1.886348, 1, 0.1960784, 0, 1,
-1.807117, -1.110369, -2.359223, 1, 0.2039216, 0, 1,
-1.799003, -0.8696896, -1.733293, 1, 0.2117647, 0, 1,
-1.794288, 1.118546, -0.8145612, 1, 0.2156863, 0, 1,
-1.789739, -0.4124416, -0.1917698, 1, 0.2235294, 0, 1,
-1.788454, 0.573386, -0.8082833, 1, 0.227451, 0, 1,
-1.781179, -1.015516, -0.4298803, 1, 0.2352941, 0, 1,
-1.7808, 0.6699412, -1.769331, 1, 0.2392157, 0, 1,
-1.734575, 0.4539932, -2.346635, 1, 0.2470588, 0, 1,
-1.721636, 0.2654145, -0.1208578, 1, 0.2509804, 0, 1,
-1.713696, 1.451102, -0.7323279, 1, 0.2588235, 0, 1,
-1.709877, 0.1819731, -1.968332, 1, 0.2627451, 0, 1,
-1.686792, -0.3807131, -1.417135, 1, 0.2705882, 0, 1,
-1.671341, 0.6456549, -1.193146, 1, 0.2745098, 0, 1,
-1.651947, -0.1213015, -2.631728, 1, 0.282353, 0, 1,
-1.61983, -1.592064, -0.8992025, 1, 0.2862745, 0, 1,
-1.606377, -1.923854, -3.053183, 1, 0.2941177, 0, 1,
-1.598289, -0.02704359, -1.813486, 1, 0.3019608, 0, 1,
-1.595433, 0.4525471, -1.875433, 1, 0.3058824, 0, 1,
-1.595417, -1.14104, -1.675876, 1, 0.3137255, 0, 1,
-1.59423, -0.4991624, -0.741465, 1, 0.3176471, 0, 1,
-1.593378, 1.883946, -2.204518, 1, 0.3254902, 0, 1,
-1.584309, -1.172419, -2.279334, 1, 0.3294118, 0, 1,
-1.580661, -0.1447823, -2.013036, 1, 0.3372549, 0, 1,
-1.56402, -0.2372976, -1.090327, 1, 0.3411765, 0, 1,
-1.560024, -0.2839002, -2.259471, 1, 0.3490196, 0, 1,
-1.547191, -0.4247884, -1.495946, 1, 0.3529412, 0, 1,
-1.531543, 0.812964, -1.04774, 1, 0.3607843, 0, 1,
-1.530872, 0.8840892, 0.423036, 1, 0.3647059, 0, 1,
-1.51904, 0.2844751, -1.635083, 1, 0.372549, 0, 1,
-1.517472, 0.08713058, -1.800873, 1, 0.3764706, 0, 1,
-1.510444, 0.02219726, 0.08930409, 1, 0.3843137, 0, 1,
-1.502443, -1.612004, -2.317748, 1, 0.3882353, 0, 1,
-1.488113, 0.6762439, 1.021421, 1, 0.3960784, 0, 1,
-1.486378, 0.556071, -0.7944162, 1, 0.4039216, 0, 1,
-1.484067, -0.3870606, -2.529089, 1, 0.4078431, 0, 1,
-1.483703, 0.7244984, -2.328399, 1, 0.4156863, 0, 1,
-1.474967, -0.3049875, -2.239526, 1, 0.4196078, 0, 1,
-1.472194, -0.6509003, -3.74967, 1, 0.427451, 0, 1,
-1.467361, 0.03363067, -2.293814, 1, 0.4313726, 0, 1,
-1.463764, -0.991196, -3.001055, 1, 0.4392157, 0, 1,
-1.449394, -0.4094354, -3.355898, 1, 0.4431373, 0, 1,
-1.440105, 1.362297, -2.159831, 1, 0.4509804, 0, 1,
-1.438263, -0.1959956, -0.9251193, 1, 0.454902, 0, 1,
-1.43825, -0.2741764, -2.030356, 1, 0.4627451, 0, 1,
-1.432074, -0.9933659, -2.150755, 1, 0.4666667, 0, 1,
-1.428639, 1.734153, -1.554326, 1, 0.4745098, 0, 1,
-1.421068, -1.107242, -1.73484, 1, 0.4784314, 0, 1,
-1.416498, -0.4548347, -2.361049, 1, 0.4862745, 0, 1,
-1.410108, 0.1551331, -1.527977, 1, 0.4901961, 0, 1,
-1.399837, 0.3929386, -0.1306346, 1, 0.4980392, 0, 1,
-1.377697, -0.5631332, -1.448866, 1, 0.5058824, 0, 1,
-1.376824, -0.4277525, -0.5300109, 1, 0.509804, 0, 1,
-1.37384, 0.5606619, -1.996297, 1, 0.5176471, 0, 1,
-1.373294, 0.8340699, -1.734392, 1, 0.5215687, 0, 1,
-1.370623, 0.4198994, -2.073189, 1, 0.5294118, 0, 1,
-1.369642, -0.4446294, -1.913426, 1, 0.5333334, 0, 1,
-1.363656, -0.2483392, -1.788597, 1, 0.5411765, 0, 1,
-1.360994, -0.01492132, -0.53217, 1, 0.5450981, 0, 1,
-1.356372, -1.133713, -1.733964, 1, 0.5529412, 0, 1,
-1.355607, -0.8790134, -0.9929644, 1, 0.5568628, 0, 1,
-1.353665, -0.5530273, -2.632279, 1, 0.5647059, 0, 1,
-1.35123, 0.255722, -1.392096, 1, 0.5686275, 0, 1,
-1.334622, -0.3477701, -0.8432345, 1, 0.5764706, 0, 1,
-1.332626, 0.1770208, -0.3557723, 1, 0.5803922, 0, 1,
-1.322171, -0.1716209, -0.3436119, 1, 0.5882353, 0, 1,
-1.313644, 0.2938122, -2.489947, 1, 0.5921569, 0, 1,
-1.305841, 0.5555086, 0.9773719, 1, 0.6, 0, 1,
-1.305548, 0.1793354, -1.939725, 1, 0.6078432, 0, 1,
-1.294095, 0.6345084, -1.175552, 1, 0.6117647, 0, 1,
-1.293232, 0.8841923, -1.83551, 1, 0.6196079, 0, 1,
-1.289147, 0.2535232, -2.203675, 1, 0.6235294, 0, 1,
-1.285439, -1.064383, -2.950029, 1, 0.6313726, 0, 1,
-1.279068, -0.497865, -2.085635, 1, 0.6352941, 0, 1,
-1.276276, -1.541644, -0.8717794, 1, 0.6431373, 0, 1,
-1.260724, 1.033048, -0.8642471, 1, 0.6470588, 0, 1,
-1.260345, -0.864793, -2.55696, 1, 0.654902, 0, 1,
-1.257149, 2.715907, -0.03549739, 1, 0.6588235, 0, 1,
-1.25276, -0.8397369, -4.589497, 1, 0.6666667, 0, 1,
-1.241842, -0.5033159, -0.2298825, 1, 0.6705883, 0, 1,
-1.235106, -0.2502996, -1.601169, 1, 0.6784314, 0, 1,
-1.234268, 0.7811638, -2.277636, 1, 0.682353, 0, 1,
-1.228617, 0.1747949, -2.483999, 1, 0.6901961, 0, 1,
-1.226923, -1.000818, -4.096022, 1, 0.6941177, 0, 1,
-1.221592, 0.6149581, -1.504349, 1, 0.7019608, 0, 1,
-1.213666, 2.156183, -0.04975412, 1, 0.7098039, 0, 1,
-1.209105, 0.3789246, -1.180562, 1, 0.7137255, 0, 1,
-1.200246, 0.5012854, -0.3584367, 1, 0.7215686, 0, 1,
-1.198925, 2.111684, -1.477945, 1, 0.7254902, 0, 1,
-1.196185, 0.04526885, -2.001574, 1, 0.7333333, 0, 1,
-1.189418, 0.7917919, -1.7501, 1, 0.7372549, 0, 1,
-1.187967, -0.009392383, -2.551727, 1, 0.7450981, 0, 1,
-1.185675, -0.1149917, -1.516684, 1, 0.7490196, 0, 1,
-1.183562, -0.1137385, -1.432228, 1, 0.7568628, 0, 1,
-1.180912, -0.1852038, -1.764355, 1, 0.7607843, 0, 1,
-1.175558, -1.269403, -1.469645, 1, 0.7686275, 0, 1,
-1.168135, -0.5601102, -2.932185, 1, 0.772549, 0, 1,
-1.164558, -0.1907615, -1.500082, 1, 0.7803922, 0, 1,
-1.153072, -0.3515771, -2.793805, 1, 0.7843137, 0, 1,
-1.142778, -1.487558, -1.432176, 1, 0.7921569, 0, 1,
-1.125252, 1.945597, -2.028172, 1, 0.7960784, 0, 1,
-1.122722, 0.306081, -2.518482, 1, 0.8039216, 0, 1,
-1.115947, -0.4436491, -2.38108, 1, 0.8117647, 0, 1,
-1.113322, 0.7772266, -0.02754579, 1, 0.8156863, 0, 1,
-1.108936, -0.6314063, -1.88371, 1, 0.8235294, 0, 1,
-1.108214, -0.007806429, -3.769575, 1, 0.827451, 0, 1,
-1.10578, 0.1301644, -1.546059, 1, 0.8352941, 0, 1,
-1.104725, -0.351643, -0.05061226, 1, 0.8392157, 0, 1,
-1.104207, 0.7472898, -1.282176, 1, 0.8470588, 0, 1,
-1.102161, -1.104895, -2.308507, 1, 0.8509804, 0, 1,
-1.099922, 1.302321, -1.163802, 1, 0.8588235, 0, 1,
-1.096025, -1.218068, -2.444791, 1, 0.8627451, 0, 1,
-1.076225, 0.5263724, -0.03255956, 1, 0.8705882, 0, 1,
-1.057419, -0.5705954, -1.327832, 1, 0.8745098, 0, 1,
-1.056972, -1.276798, -1.518771, 1, 0.8823529, 0, 1,
-1.055118, 0.2205381, -0.5277191, 1, 0.8862745, 0, 1,
-1.054513, -0.439148, -2.980526, 1, 0.8941177, 0, 1,
-1.054409, 1.048646, -1.774833, 1, 0.8980392, 0, 1,
-1.047945, 1.18246, -1.340795, 1, 0.9058824, 0, 1,
-1.047819, -1.001076, -2.122449, 1, 0.9137255, 0, 1,
-1.043252, -0.2569367, -1.399751, 1, 0.9176471, 0, 1,
-1.035866, -0.4811615, -3.00956, 1, 0.9254902, 0, 1,
-1.028936, -1.239646, -1.932453, 1, 0.9294118, 0, 1,
-1.019643, 0.3194885, -1.035663, 1, 0.9372549, 0, 1,
-1.017307, -1.531227, -3.596018, 1, 0.9411765, 0, 1,
-1.014781, 2.83364, -0.794757, 1, 0.9490196, 0, 1,
-1.004024, -1.337532, -5.075988, 1, 0.9529412, 0, 1,
-1.000638, -0.6026045, -3.210216, 1, 0.9607843, 0, 1,
-0.9924856, -2.262797, -2.463928, 1, 0.9647059, 0, 1,
-0.988407, 1.631723, 0.5495614, 1, 0.972549, 0, 1,
-0.9883004, -0.1791148, -1.947109, 1, 0.9764706, 0, 1,
-0.9876644, -0.526707, -3.754192, 1, 0.9843137, 0, 1,
-0.9854455, -0.0224228, -0.9023124, 1, 0.9882353, 0, 1,
-0.9805821, 0.1088552, -2.787709, 1, 0.9960784, 0, 1,
-0.9700164, -1.521312, -4.056627, 0.9960784, 1, 0, 1,
-0.9684337, -1.468295, -3.187066, 0.9921569, 1, 0, 1,
-0.9672091, -0.4264089, -1.700022, 0.9843137, 1, 0, 1,
-0.9630358, -0.08491432, -1.291626, 0.9803922, 1, 0, 1,
-0.96125, -0.9867867, -1.694708, 0.972549, 1, 0, 1,
-0.9609899, 0.9246273, -0.9016386, 0.9686275, 1, 0, 1,
-0.9572632, 0.4489819, -1.745043, 0.9607843, 1, 0, 1,
-0.9484113, 0.8328087, -2.447007, 0.9568627, 1, 0, 1,
-0.9453742, -1.159212, -3.05698, 0.9490196, 1, 0, 1,
-0.9429035, -0.2880394, -2.114128, 0.945098, 1, 0, 1,
-0.9408954, -1.710045, -2.552309, 0.9372549, 1, 0, 1,
-0.9283742, 0.8971958, 0.669027, 0.9333333, 1, 0, 1,
-0.9281748, -0.6821927, -1.79025, 0.9254902, 1, 0, 1,
-0.9141948, -0.3546431, -1.039071, 0.9215686, 1, 0, 1,
-0.9112458, -0.9045008, -2.128167, 0.9137255, 1, 0, 1,
-0.8957849, 0.0905256, -2.594713, 0.9098039, 1, 0, 1,
-0.8925945, 0.5945863, -1.432464, 0.9019608, 1, 0, 1,
-0.8910111, -0.1773931, -1.682619, 0.8941177, 1, 0, 1,
-0.889806, 0.3660564, -1.181816, 0.8901961, 1, 0, 1,
-0.8842538, -0.0008184245, -1.841964, 0.8823529, 1, 0, 1,
-0.8728554, -0.2658604, -3.675481, 0.8784314, 1, 0, 1,
-0.8633251, 0.9496372, 0.5846205, 0.8705882, 1, 0, 1,
-0.8622217, -0.9790449, -1.339518, 0.8666667, 1, 0, 1,
-0.859644, -0.001248468, 0.307009, 0.8588235, 1, 0, 1,
-0.8560802, -0.1558875, -1.222805, 0.854902, 1, 0, 1,
-0.8555372, 0.6087334, -1.462855, 0.8470588, 1, 0, 1,
-0.8553719, -1.261661, -2.552712, 0.8431373, 1, 0, 1,
-0.8545803, 0.881017, -1.450063, 0.8352941, 1, 0, 1,
-0.8515597, -1.36938, -1.572447, 0.8313726, 1, 0, 1,
-0.8439071, -0.957397, -1.035465, 0.8235294, 1, 0, 1,
-0.8424982, -1.43646, -1.874715, 0.8196079, 1, 0, 1,
-0.8398731, -0.4432792, -3.813984, 0.8117647, 1, 0, 1,
-0.8329638, -0.4846434, -1.904357, 0.8078431, 1, 0, 1,
-0.829332, -0.2710538, 0.4020587, 0.8, 1, 0, 1,
-0.8261083, -0.09039379, -1.207911, 0.7921569, 1, 0, 1,
-0.8222507, 0.2682666, -1.308321, 0.7882353, 1, 0, 1,
-0.8205579, -0.6502631, -1.600665, 0.7803922, 1, 0, 1,
-0.8191678, 0.2334437, -0.4250903, 0.7764706, 1, 0, 1,
-0.8180086, -0.7374757, -2.575838, 0.7686275, 1, 0, 1,
-0.8157966, -0.332732, -2.754597, 0.7647059, 1, 0, 1,
-0.8151156, 1.4104, -1.834539, 0.7568628, 1, 0, 1,
-0.8115757, 1.085634, 0.4975772, 0.7529412, 1, 0, 1,
-0.807924, -0.6827056, -1.646291, 0.7450981, 1, 0, 1,
-0.8006364, 0.578512, -0.1538107, 0.7411765, 1, 0, 1,
-0.7960124, 0.6213343, 0.286595, 0.7333333, 1, 0, 1,
-0.7910442, 0.2621478, -1.265612, 0.7294118, 1, 0, 1,
-0.7899861, 0.2559002, -1.316926, 0.7215686, 1, 0, 1,
-0.7883835, 1.461213, -1.477169, 0.7176471, 1, 0, 1,
-0.7816428, -1.73088, -3.196441, 0.7098039, 1, 0, 1,
-0.7784422, -0.9464531, -2.500707, 0.7058824, 1, 0, 1,
-0.777208, 0.3007723, -1.469286, 0.6980392, 1, 0, 1,
-0.7762489, 0.219968, -2.466347, 0.6901961, 1, 0, 1,
-0.7625807, 1.450404, -0.4861941, 0.6862745, 1, 0, 1,
-0.7622266, 0.8815627, -0.2423271, 0.6784314, 1, 0, 1,
-0.7614178, -0.09688349, -2.004525, 0.6745098, 1, 0, 1,
-0.7605988, -1.834471, -2.279442, 0.6666667, 1, 0, 1,
-0.7595509, -0.05761848, -1.7871, 0.6627451, 1, 0, 1,
-0.7580554, -0.1857719, -2.100768, 0.654902, 1, 0, 1,
-0.7534392, -0.2457402, -1.278479, 0.6509804, 1, 0, 1,
-0.7530821, 0.4080512, 0.3253361, 0.6431373, 1, 0, 1,
-0.7478364, 0.8472034, 0.6484702, 0.6392157, 1, 0, 1,
-0.7411235, 1.245625, 0.04385222, 0.6313726, 1, 0, 1,
-0.7381137, -0.1223614, 0.3699337, 0.627451, 1, 0, 1,
-0.7314519, 0.817917, 0.3444651, 0.6196079, 1, 0, 1,
-0.7208236, 2.131073, 0.3864959, 0.6156863, 1, 0, 1,
-0.7206077, -1.587854, -0.9057683, 0.6078432, 1, 0, 1,
-0.7174132, 0.02977874, -1.197501, 0.6039216, 1, 0, 1,
-0.7141242, -0.3709751, -5.403263, 0.5960785, 1, 0, 1,
-0.7139599, 0.9412924, -1.16515, 0.5882353, 1, 0, 1,
-0.7118881, -0.05222727, -2.169689, 0.5843138, 1, 0, 1,
-0.711692, 1.469476, -0.9280088, 0.5764706, 1, 0, 1,
-0.7095138, -1.303424, -3.120904, 0.572549, 1, 0, 1,
-0.7053633, 0.3261258, -1.923607, 0.5647059, 1, 0, 1,
-0.7004403, -1.959028, -3.813151, 0.5607843, 1, 0, 1,
-0.6991166, -1.578349, -3.789277, 0.5529412, 1, 0, 1,
-0.696667, -0.781307, -2.105016, 0.5490196, 1, 0, 1,
-0.6961045, -0.856002, -3.108095, 0.5411765, 1, 0, 1,
-0.6950676, -1.539602, -2.509596, 0.5372549, 1, 0, 1,
-0.6940771, -1.002008, -2.359627, 0.5294118, 1, 0, 1,
-0.6916733, -1.292095, -2.3258, 0.5254902, 1, 0, 1,
-0.691445, 0.1298982, -1.113865, 0.5176471, 1, 0, 1,
-0.6871436, 0.07189516, -0.8651141, 0.5137255, 1, 0, 1,
-0.6858464, 0.7082211, -0.6562394, 0.5058824, 1, 0, 1,
-0.6850917, -1.756572, -2.161684, 0.5019608, 1, 0, 1,
-0.6786821, 1.461066, -2.243386, 0.4941176, 1, 0, 1,
-0.6742449, 1.1621, 0.2902877, 0.4862745, 1, 0, 1,
-0.673998, 1.47888, -0.7939131, 0.4823529, 1, 0, 1,
-0.6723731, 0.3583615, -0.8773589, 0.4745098, 1, 0, 1,
-0.6697469, -1.282996, -1.879831, 0.4705882, 1, 0, 1,
-0.6656426, 0.8413954, -1.392683, 0.4627451, 1, 0, 1,
-0.6466557, 1.04422, 0.7034951, 0.4588235, 1, 0, 1,
-0.6454991, 0.8733277, -0.6324889, 0.4509804, 1, 0, 1,
-0.6413156, -0.7239202, -1.744333, 0.4470588, 1, 0, 1,
-0.6381218, -0.05476913, -2.46981, 0.4392157, 1, 0, 1,
-0.6373349, 0.9496014, -0.500115, 0.4352941, 1, 0, 1,
-0.635458, -0.846209, -2.616786, 0.427451, 1, 0, 1,
-0.6338078, -2.111048, -3.166183, 0.4235294, 1, 0, 1,
-0.6290565, 0.4186092, 0.3673047, 0.4156863, 1, 0, 1,
-0.6271898, 0.2162417, -0.03542788, 0.4117647, 1, 0, 1,
-0.6259869, 0.00927836, -2.732393, 0.4039216, 1, 0, 1,
-0.6238603, 0.5883451, 0.5125055, 0.3960784, 1, 0, 1,
-0.6210252, 1.083049, -1.092614, 0.3921569, 1, 0, 1,
-0.6186123, -0.7982447, -1.726916, 0.3843137, 1, 0, 1,
-0.6158787, 0.2017492, -1.648716, 0.3803922, 1, 0, 1,
-0.6150596, -1.195989, -1.757615, 0.372549, 1, 0, 1,
-0.6145727, -0.7710382, -3.247516, 0.3686275, 1, 0, 1,
-0.6125689, 0.26067, -1.980834, 0.3607843, 1, 0, 1,
-0.6095715, 0.8962626, -1.963993, 0.3568628, 1, 0, 1,
-0.608592, -1.674079, -1.446329, 0.3490196, 1, 0, 1,
-0.6049209, 0.1945225, -0.8469275, 0.345098, 1, 0, 1,
-0.6021217, 0.214966, -1.635495, 0.3372549, 1, 0, 1,
-0.5989985, -0.4591452, -1.693738, 0.3333333, 1, 0, 1,
-0.5987166, -0.8921265, -2.119156, 0.3254902, 1, 0, 1,
-0.596807, 2.32066, -0.08981708, 0.3215686, 1, 0, 1,
-0.5933827, 1.962022, -1.264879, 0.3137255, 1, 0, 1,
-0.592666, -0.8644955, -1.507918, 0.3098039, 1, 0, 1,
-0.5926556, -1.881154, -1.104978, 0.3019608, 1, 0, 1,
-0.5917736, 1.83686, -0.3408068, 0.2941177, 1, 0, 1,
-0.5912367, 1.426163, -0.5107315, 0.2901961, 1, 0, 1,
-0.5886781, 0.8910894, -1.66215, 0.282353, 1, 0, 1,
-0.5837935, -1.634068, -3.643857, 0.2784314, 1, 0, 1,
-0.5790427, 0.3271108, -1.129542, 0.2705882, 1, 0, 1,
-0.5786157, -0.1637778, -1.075397, 0.2666667, 1, 0, 1,
-0.5780625, 1.402872, -2.450001, 0.2588235, 1, 0, 1,
-0.5757737, 0.6156943, -0.8554454, 0.254902, 1, 0, 1,
-0.5725945, -1.875234, -4.824932, 0.2470588, 1, 0, 1,
-0.5721621, -0.8452524, -0.9906107, 0.2431373, 1, 0, 1,
-0.5720124, 0.05626174, -2.633324, 0.2352941, 1, 0, 1,
-0.5712147, -0.8457737, -1.519773, 0.2313726, 1, 0, 1,
-0.566199, -0.2094709, -3.476517, 0.2235294, 1, 0, 1,
-0.5628103, 2.075624, -0.05101514, 0.2196078, 1, 0, 1,
-0.557663, 0.2616164, -1.98882, 0.2117647, 1, 0, 1,
-0.5546659, 3.268554, 1.233749, 0.2078431, 1, 0, 1,
-0.5531186, -1.645353, -2.373201, 0.2, 1, 0, 1,
-0.5497522, -0.2558585, -1.846717, 0.1921569, 1, 0, 1,
-0.5491947, 0.136164, -2.420578, 0.1882353, 1, 0, 1,
-0.5483152, 1.415336, -1.546859, 0.1803922, 1, 0, 1,
-0.5409611, -1.930593, -2.514237, 0.1764706, 1, 0, 1,
-0.5404635, -0.5201805, -1.519346, 0.1686275, 1, 0, 1,
-0.5359622, -0.5066172, -2.044656, 0.1647059, 1, 0, 1,
-0.5307794, 0.9523317, 0.373122, 0.1568628, 1, 0, 1,
-0.5303968, -0.2901771, -0.8365233, 0.1529412, 1, 0, 1,
-0.526003, -1.043285, -3.003234, 0.145098, 1, 0, 1,
-0.5235437, -0.8561122, -3.3013, 0.1411765, 1, 0, 1,
-0.5226816, 0.5179374, 0.5379701, 0.1333333, 1, 0, 1,
-0.5225621, -0.2890223, -3.675048, 0.1294118, 1, 0, 1,
-0.5192802, 0.1681322, -3.378059, 0.1215686, 1, 0, 1,
-0.5178732, -0.8958053, -3.004224, 0.1176471, 1, 0, 1,
-0.517518, -1.535705, -1.331685, 0.1098039, 1, 0, 1,
-0.5166402, 1.02867, -0.9158615, 0.1058824, 1, 0, 1,
-0.5136691, -0.6587751, -2.657191, 0.09803922, 1, 0, 1,
-0.5118223, 0.4582107, 0.2534556, 0.09019608, 1, 0, 1,
-0.5098377, 0.9825785, -1.684891, 0.08627451, 1, 0, 1,
-0.5054156, 0.1777425, 0.1830195, 0.07843138, 1, 0, 1,
-0.5025843, 0.8456857, 0.7373729, 0.07450981, 1, 0, 1,
-0.5011458, 1.606945, -1.946553, 0.06666667, 1, 0, 1,
-0.5009264, -2.112664, -3.805552, 0.0627451, 1, 0, 1,
-0.4927718, 0.358042, -0.3323637, 0.05490196, 1, 0, 1,
-0.4902027, -0.3855362, -2.972786, 0.05098039, 1, 0, 1,
-0.4861752, -0.776309, -3.359159, 0.04313726, 1, 0, 1,
-0.4832448, -1.028337, -2.469142, 0.03921569, 1, 0, 1,
-0.4816606, -0.8907617, -2.441225, 0.03137255, 1, 0, 1,
-0.4788251, -0.6764038, -2.561099, 0.02745098, 1, 0, 1,
-0.4782046, 0.05322333, -1.548094, 0.01960784, 1, 0, 1,
-0.4768041, -0.1112847, -3.516196, 0.01568628, 1, 0, 1,
-0.4766419, 1.626697, 0.8064024, 0.007843138, 1, 0, 1,
-0.4744156, 1.465589, -0.3192773, 0.003921569, 1, 0, 1,
-0.469102, -1.80086, -4.426216, 0, 1, 0.003921569, 1,
-0.4663807, 0.253646, -1.955156, 0, 1, 0.01176471, 1,
-0.4633394, -1.482442, -2.245696, 0, 1, 0.01568628, 1,
-0.4605816, 0.7493551, -1.614097, 0, 1, 0.02352941, 1,
-0.4554587, 0.4224577, -1.436177, 0, 1, 0.02745098, 1,
-0.4536506, -0.4020308, -1.64591, 0, 1, 0.03529412, 1,
-0.4516051, -0.1630822, -1.293645, 0, 1, 0.03921569, 1,
-0.4513598, -0.261362, -5.959157, 0, 1, 0.04705882, 1,
-0.4499491, -1.32929, -2.564113, 0, 1, 0.05098039, 1,
-0.448617, -0.544461, -1.968665, 0, 1, 0.05882353, 1,
-0.4482203, -0.8710635, -3.837458, 0, 1, 0.0627451, 1,
-0.4468128, 0.8068416, -0.3771656, 0, 1, 0.07058824, 1,
-0.4455204, -0.7165864, -2.689028, 0, 1, 0.07450981, 1,
-0.4342987, -0.9747419, -1.96613, 0, 1, 0.08235294, 1,
-0.4333825, -0.15111, -2.562487, 0, 1, 0.08627451, 1,
-0.4308434, 0.8608244, -0.4111033, 0, 1, 0.09411765, 1,
-0.4274283, 1.357356, -0.5082223, 0, 1, 0.1019608, 1,
-0.4271846, -0.2748455, -0.9725419, 0, 1, 0.1058824, 1,
-0.4260022, 0.4600854, -1.22763, 0, 1, 0.1137255, 1,
-0.4241019, 1.873367, -0.1371965, 0, 1, 0.1176471, 1,
-0.4237067, 0.5844872, 0.3107513, 0, 1, 0.1254902, 1,
-0.4235232, 1.21525, -1.202028, 0, 1, 0.1294118, 1,
-0.4199564, -0.9283887, -4.577868, 0, 1, 0.1372549, 1,
-0.4159018, 1.938349, 0.9095901, 0, 1, 0.1411765, 1,
-0.4137177, -0.1635077, -0.8396693, 0, 1, 0.1490196, 1,
-0.4114626, 0.6078714, 0.1926346, 0, 1, 0.1529412, 1,
-0.4100721, -0.2469769, -4.375047, 0, 1, 0.1607843, 1,
-0.4098275, -2.073711, -2.593089, 0, 1, 0.1647059, 1,
-0.4076515, 0.5387593, -1.484671, 0, 1, 0.172549, 1,
-0.4055291, -0.4026062, -2.905535, 0, 1, 0.1764706, 1,
-0.4032348, 0.7173974, -1.351234, 0, 1, 0.1843137, 1,
-0.4022052, -1.32444, -3.189, 0, 1, 0.1882353, 1,
-0.3995838, -0.446895, -2.650003, 0, 1, 0.1960784, 1,
-0.3994485, 0.9786777, -0.6568356, 0, 1, 0.2039216, 1,
-0.3979086, 1.944938, -0.2195729, 0, 1, 0.2078431, 1,
-0.397713, -0.1854545, -3.326015, 0, 1, 0.2156863, 1,
-0.396288, -0.5960938, -2.868849, 0, 1, 0.2196078, 1,
-0.3901214, 0.2608802, -1.1645, 0, 1, 0.227451, 1,
-0.3864144, -0.5086013, -3.503881, 0, 1, 0.2313726, 1,
-0.3845097, -0.5149078, -3.181136, 0, 1, 0.2392157, 1,
-0.3777411, -0.2208346, -1.394768, 0, 1, 0.2431373, 1,
-0.3726607, -1.340695, -2.00498, 0, 1, 0.2509804, 1,
-0.37081, -0.1614426, -2.475808, 0, 1, 0.254902, 1,
-0.3687077, 0.855954, -0.2331873, 0, 1, 0.2627451, 1,
-0.3666036, -0.3062688, -1.723831, 0, 1, 0.2666667, 1,
-0.3626533, 0.449834, 1.160571, 0, 1, 0.2745098, 1,
-0.3621883, 0.2887405, -2.339575, 0, 1, 0.2784314, 1,
-0.3608763, -2.099942, -4.123824, 0, 1, 0.2862745, 1,
-0.3571342, 0.5445762, -0.6427267, 0, 1, 0.2901961, 1,
-0.3537878, 1.402058, -1.097813, 0, 1, 0.2980392, 1,
-0.3530741, -0.9079486, -2.494396, 0, 1, 0.3058824, 1,
-0.3518724, 0.2656096, -0.3633076, 0, 1, 0.3098039, 1,
-0.3518232, 0.2123433, -1.579347, 0, 1, 0.3176471, 1,
-0.3464645, -0.00765785, -1.988051, 0, 1, 0.3215686, 1,
-0.3435062, 0.4238602, 0.5091252, 0, 1, 0.3294118, 1,
-0.3393613, -0.4632273, -1.563376, 0, 1, 0.3333333, 1,
-0.3384702, 0.6536562, -1.559096, 0, 1, 0.3411765, 1,
-0.3365192, 0.2038458, -3.655453, 0, 1, 0.345098, 1,
-0.3343671, -0.2852865, -2.175134, 0, 1, 0.3529412, 1,
-0.3323362, -1.638861, -2.937479, 0, 1, 0.3568628, 1,
-0.3290441, -0.6991802, -1.469885, 0, 1, 0.3647059, 1,
-0.3268908, 1.547839, 1.266496, 0, 1, 0.3686275, 1,
-0.3231019, -0.290811, -1.169432, 0, 1, 0.3764706, 1,
-0.3224765, -0.7670617, -1.980506, 0, 1, 0.3803922, 1,
-0.3223734, -1.025699, -3.263949, 0, 1, 0.3882353, 1,
-0.309448, -1.767166, -3.062414, 0, 1, 0.3921569, 1,
-0.3057643, -1.08471, -3.259213, 0, 1, 0.4, 1,
-0.3048611, 0.3263646, -2.148598, 0, 1, 0.4078431, 1,
-0.2914868, -0.6418185, -2.551439, 0, 1, 0.4117647, 1,
-0.2901638, 0.7494779, 0.09518889, 0, 1, 0.4196078, 1,
-0.2863731, 0.301644, -1.700985, 0, 1, 0.4235294, 1,
-0.286212, 0.3470027, -0.7015556, 0, 1, 0.4313726, 1,
-0.2828483, -0.5443239, -2.845931, 0, 1, 0.4352941, 1,
-0.2744944, 1.216452, 0.937654, 0, 1, 0.4431373, 1,
-0.2713714, -3.130064, -0.9365495, 0, 1, 0.4470588, 1,
-0.2696886, -0.3063948, -2.590175, 0, 1, 0.454902, 1,
-0.2681993, 1.167203, -0.563378, 0, 1, 0.4588235, 1,
-0.2661972, -1.13364, -2.74596, 0, 1, 0.4666667, 1,
-0.2607802, -0.5517303, -1.902417, 0, 1, 0.4705882, 1,
-0.2587432, 0.9877598, -0.5656513, 0, 1, 0.4784314, 1,
-0.2582998, -1.098428, -4.520146, 0, 1, 0.4823529, 1,
-0.2569228, 1.271157, 0.3233311, 0, 1, 0.4901961, 1,
-0.2553958, -1.320802, -3.151301, 0, 1, 0.4941176, 1,
-0.2479775, -0.3347327, -2.172489, 0, 1, 0.5019608, 1,
-0.2464701, 1.812715, 1.34838, 0, 1, 0.509804, 1,
-0.2456821, 0.6643983, -1.998865, 0, 1, 0.5137255, 1,
-0.2432184, 1.100353, -0.5497926, 0, 1, 0.5215687, 1,
-0.2417661, -1.496205, -2.338973, 0, 1, 0.5254902, 1,
-0.2392363, 1.151041, -2.913861, 0, 1, 0.5333334, 1,
-0.2365314, -0.4329702, -2.301554, 0, 1, 0.5372549, 1,
-0.2319692, -1.036454, -1.188077, 0, 1, 0.5450981, 1,
-0.2313514, -0.84998, -3.666311, 0, 1, 0.5490196, 1,
-0.2308391, -0.7354695, -4.125306, 0, 1, 0.5568628, 1,
-0.2288776, -0.04295629, -2.805332, 0, 1, 0.5607843, 1,
-0.2272563, -1.168995, -2.92847, 0, 1, 0.5686275, 1,
-0.2257764, -1.961947, -3.132598, 0, 1, 0.572549, 1,
-0.2245402, -0.5030278, -1.751805, 0, 1, 0.5803922, 1,
-0.2243842, 1.818909, -0.7435051, 0, 1, 0.5843138, 1,
-0.220858, -0.5431704, -2.259087, 0, 1, 0.5921569, 1,
-0.220474, -0.4406453, -2.388024, 0, 1, 0.5960785, 1,
-0.2195063, 1.259598, -0.3571975, 0, 1, 0.6039216, 1,
-0.2194329, 1.003347, -0.01078723, 0, 1, 0.6117647, 1,
-0.2175865, -1.10359, -2.610879, 0, 1, 0.6156863, 1,
-0.2168247, 0.1877474, -1.169226, 0, 1, 0.6235294, 1,
-0.2045254, 0.8725909, 2.118841, 0, 1, 0.627451, 1,
-0.20366, 0.3562145, -0.08638648, 0, 1, 0.6352941, 1,
-0.1983149, -0.9214725, -4.658581, 0, 1, 0.6392157, 1,
-0.1901115, -1.358761, -2.081183, 0, 1, 0.6470588, 1,
-0.1854814, -0.08920133, -1.404416, 0, 1, 0.6509804, 1,
-0.1809513, -0.0005285221, -0.8853574, 0, 1, 0.6588235, 1,
-0.176597, -0.5133747, -1.882358, 0, 1, 0.6627451, 1,
-0.1760279, -0.7524684, -3.067229, 0, 1, 0.6705883, 1,
-0.1745764, -0.0854663, -3.345096, 0, 1, 0.6745098, 1,
-0.1735475, -0.3370822, -1.970029, 0, 1, 0.682353, 1,
-0.1665218, 0.8800898, -0.02436164, 0, 1, 0.6862745, 1,
-0.1636146, -0.8675418, -1.668747, 0, 1, 0.6941177, 1,
-0.159453, -0.08945469, -2.413999, 0, 1, 0.7019608, 1,
-0.1580692, 0.1196762, -0.2953542, 0, 1, 0.7058824, 1,
-0.1576467, -1.48725, -4.047059, 0, 1, 0.7137255, 1,
-0.1572664, 0.9678416, -0.01032858, 0, 1, 0.7176471, 1,
-0.1566252, -0.6480259, -5.442878, 0, 1, 0.7254902, 1,
-0.149934, 0.2713988, -0.4923798, 0, 1, 0.7294118, 1,
-0.1489229, -1.380287, -2.019121, 0, 1, 0.7372549, 1,
-0.146033, 0.3481005, 0.03016811, 0, 1, 0.7411765, 1,
-0.1432998, -0.7137901, -3.270415, 0, 1, 0.7490196, 1,
-0.1396797, -0.8313944, -4.097998, 0, 1, 0.7529412, 1,
-0.1367358, 0.8163638, 0.5547249, 0, 1, 0.7607843, 1,
-0.1318821, 1.209823, 0.6396192, 0, 1, 0.7647059, 1,
-0.1262777, 2.223202, -0.2001505, 0, 1, 0.772549, 1,
-0.1238611, 0.7153252, 0.570316, 0, 1, 0.7764706, 1,
-0.1203691, -0.1707408, -0.6219608, 0, 1, 0.7843137, 1,
-0.1198305, 1.087114, 1.460868, 0, 1, 0.7882353, 1,
-0.1108553, -0.1923009, -2.331122, 0, 1, 0.7960784, 1,
-0.1050541, -1.325393, -2.117932, 0, 1, 0.8039216, 1,
-0.09889328, 1.624298, 0.4872317, 0, 1, 0.8078431, 1,
-0.09688972, -0.4350258, -3.353091, 0, 1, 0.8156863, 1,
-0.0956054, -2.529263, -2.260484, 0, 1, 0.8196079, 1,
-0.09386422, 0.3765049, -0.8069467, 0, 1, 0.827451, 1,
-0.09305451, 1.008791, 0.927895, 0, 1, 0.8313726, 1,
-0.09297136, -0.4814384, -1.764613, 0, 1, 0.8392157, 1,
-0.09292652, 0.4049693, 0.278121, 0, 1, 0.8431373, 1,
-0.08688341, -1.141612, -0.4613279, 0, 1, 0.8509804, 1,
-0.08438235, -1.757152, -2.436247, 0, 1, 0.854902, 1,
-0.08215605, -0.3851675, -3.062344, 0, 1, 0.8627451, 1,
-0.07246998, 0.5810083, -0.6277393, 0, 1, 0.8666667, 1,
-0.07009046, -0.1055537, -4.147329, 0, 1, 0.8745098, 1,
-0.06952696, 1.039487, 0.2108761, 0, 1, 0.8784314, 1,
-0.0646622, -2.199801, -2.565651, 0, 1, 0.8862745, 1,
-0.06212613, 1.416402, -0.2200519, 0, 1, 0.8901961, 1,
-0.05655696, -2.63946, -2.146941, 0, 1, 0.8980392, 1,
-0.05332951, 1.448948, -1.4147, 0, 1, 0.9058824, 1,
-0.0510877, 0.7745864, -0.7585526, 0, 1, 0.9098039, 1,
-0.05011597, 2.682845, -1.555828, 0, 1, 0.9176471, 1,
-0.04505948, -1.030686, -4.91866, 0, 1, 0.9215686, 1,
-0.04473393, 0.1856623, 0.3128809, 0, 1, 0.9294118, 1,
-0.04332622, -0.0004924904, -1.64956, 0, 1, 0.9333333, 1,
-0.04316587, -0.4488807, -4.148338, 0, 1, 0.9411765, 1,
-0.04261989, -0.80613, -3.708752, 0, 1, 0.945098, 1,
-0.04193714, 1.1204, 0.4912331, 0, 1, 0.9529412, 1,
-0.03661876, -0.732004, -4.690149, 0, 1, 0.9568627, 1,
-0.03532597, -0.6699545, -3.243448, 0, 1, 0.9647059, 1,
-0.03248597, 1.07349, 0.2532807, 0, 1, 0.9686275, 1,
-0.03198387, -0.2370538, -2.024987, 0, 1, 0.9764706, 1,
-0.03176628, 0.8172734, -0.9654834, 0, 1, 0.9803922, 1,
-0.03073705, -1.209032, -3.414913, 0, 1, 0.9882353, 1,
-0.02970169, -0.5133883, -3.429051, 0, 1, 0.9921569, 1,
-0.02806832, -0.2089814, -1.868695, 0, 1, 1, 1,
-0.02504007, -0.4630617, -3.510824, 0, 0.9921569, 1, 1,
-0.02350907, 2.684253, -1.438839, 0, 0.9882353, 1, 1,
-0.02323463, -0.8086373, -2.666698, 0, 0.9803922, 1, 1,
-0.01908802, 0.5059047, 1.55973, 0, 0.9764706, 1, 1,
-0.01179336, -0.1602734, -3.810928, 0, 0.9686275, 1, 1,
-0.01175233, 0.719813, -0.5152023, 0, 0.9647059, 1, 1,
-0.008390818, 0.5440493, -1.940685, 0, 0.9568627, 1, 1,
-0.004082534, 1.525538, 1.085948, 0, 0.9529412, 1, 1,
-0.001269743, -1.378961, -3.047585, 0, 0.945098, 1, 1,
0.001457098, 1.138283, -0.01965481, 0, 0.9411765, 1, 1,
0.004585487, 0.3085298, -0.9793406, 0, 0.9333333, 1, 1,
0.006193435, 1.221393, 0.9177538, 0, 0.9294118, 1, 1,
0.007162638, -0.1215198, 3.489614, 0, 0.9215686, 1, 1,
0.007647862, -0.799489, 5.763555, 0, 0.9176471, 1, 1,
0.00809475, -0.3250795, 3.519931, 0, 0.9098039, 1, 1,
0.008492469, 0.9135055, 0.9143523, 0, 0.9058824, 1, 1,
0.0123955, 0.2080639, 1.079418, 0, 0.8980392, 1, 1,
0.01557176, -0.4159986, 3.792745, 0, 0.8901961, 1, 1,
0.01774505, 0.4755509, 0.7525808, 0, 0.8862745, 1, 1,
0.01932486, -0.6286812, 2.305607, 0, 0.8784314, 1, 1,
0.02360556, 0.3281317, 0.2338066, 0, 0.8745098, 1, 1,
0.02395353, 1.125028, 2.129884, 0, 0.8666667, 1, 1,
0.02396552, 0.03113907, -0.3804661, 0, 0.8627451, 1, 1,
0.02833044, 1.254482, 0.371968, 0, 0.854902, 1, 1,
0.02894776, -1.355402, 2.615472, 0, 0.8509804, 1, 1,
0.0314848, -0.07394298, 2.949089, 0, 0.8431373, 1, 1,
0.03539385, 1.744098, 0.8588934, 0, 0.8392157, 1, 1,
0.04906863, -0.4093528, 2.394433, 0, 0.8313726, 1, 1,
0.05069235, 0.2833238, 0.2577294, 0, 0.827451, 1, 1,
0.05073407, 0.1152735, -0.01197823, 0, 0.8196079, 1, 1,
0.05228753, -0.03957722, 2.944348, 0, 0.8156863, 1, 1,
0.05607065, 0.5371343, -0.1186864, 0, 0.8078431, 1, 1,
0.05702018, -1.53328, 2.952532, 0, 0.8039216, 1, 1,
0.05875079, -0.7514672, 2.837316, 0, 0.7960784, 1, 1,
0.06026901, 0.09180725, 0.7863596, 0, 0.7882353, 1, 1,
0.06672379, 0.1134783, 0.335202, 0, 0.7843137, 1, 1,
0.06780154, 0.5854187, -0.9206948, 0, 0.7764706, 1, 1,
0.06845086, 0.3901888, 1.398443, 0, 0.772549, 1, 1,
0.07321737, -0.1089074, 0.8495975, 0, 0.7647059, 1, 1,
0.07376397, -1.767332, 2.841873, 0, 0.7607843, 1, 1,
0.08009278, -0.4483925, 4.043328, 0, 0.7529412, 1, 1,
0.08821277, 2.204209, -1.653301, 0, 0.7490196, 1, 1,
0.09436405, 1.075928, -0.564718, 0, 0.7411765, 1, 1,
0.100484, 0.6324167, 0.6254251, 0, 0.7372549, 1, 1,
0.1008145, -1.134194, 2.663085, 0, 0.7294118, 1, 1,
0.1024538, 0.6855472, -0.929455, 0, 0.7254902, 1, 1,
0.1041318, 0.488613, 0.3118487, 0, 0.7176471, 1, 1,
0.1112127, 0.1034022, 1.263425, 0, 0.7137255, 1, 1,
0.1115458, 0.05096699, 1.285521, 0, 0.7058824, 1, 1,
0.1132833, 0.2669071, 0.9770432, 0, 0.6980392, 1, 1,
0.1154148, -1.482117, 2.015138, 0, 0.6941177, 1, 1,
0.1178332, -0.7138268, 3.28098, 0, 0.6862745, 1, 1,
0.117987, -0.4345543, 2.625347, 0, 0.682353, 1, 1,
0.1183935, -0.348828, 2.869076, 0, 0.6745098, 1, 1,
0.1188489, -0.1906476, 2.864048, 0, 0.6705883, 1, 1,
0.125227, 0.989925, -1.79975, 0, 0.6627451, 1, 1,
0.1252806, 1.483703, -1.253925, 0, 0.6588235, 1, 1,
0.1259338, 1.701863, -0.2263467, 0, 0.6509804, 1, 1,
0.1261436, 0.6489912, -0.9811457, 0, 0.6470588, 1, 1,
0.1266959, -2.049526, 1.820514, 0, 0.6392157, 1, 1,
0.1271878, 0.8806758, -1.759651, 0, 0.6352941, 1, 1,
0.1286054, 0.1586386, 1.629799, 0, 0.627451, 1, 1,
0.1286933, 0.03948463, 1.645921, 0, 0.6235294, 1, 1,
0.130595, -0.6056611, 3.907986, 0, 0.6156863, 1, 1,
0.1326286, -0.988717, 4.345859, 0, 0.6117647, 1, 1,
0.1344032, -0.9095386, 3.610925, 0, 0.6039216, 1, 1,
0.1345222, -1.532286, 3.268834, 0, 0.5960785, 1, 1,
0.1360047, -0.8738079, 3.20496, 0, 0.5921569, 1, 1,
0.1415844, 1.05334, 0.1852164, 0, 0.5843138, 1, 1,
0.143437, 0.3630677, 0.9569348, 0, 0.5803922, 1, 1,
0.1450977, -0.6295184, 3.121329, 0, 0.572549, 1, 1,
0.1468719, -2.381608, 2.375186, 0, 0.5686275, 1, 1,
0.1503799, -0.9236946, 2.07394, 0, 0.5607843, 1, 1,
0.151328, 0.8738878, -0.3150139, 0, 0.5568628, 1, 1,
0.1518451, 0.66657, 1.254278, 0, 0.5490196, 1, 1,
0.1526733, 1.565218, -1.296844, 0, 0.5450981, 1, 1,
0.1546476, -0.7632895, 3.274994, 0, 0.5372549, 1, 1,
0.159023, -0.580409, 2.787097, 0, 0.5333334, 1, 1,
0.1594932, 0.7711017, -1.365798, 0, 0.5254902, 1, 1,
0.1631664, 1.097857, 0.4548469, 0, 0.5215687, 1, 1,
0.1781661, 1.955112, -0.00936367, 0, 0.5137255, 1, 1,
0.1790403, 0.3032677, 1.453006, 0, 0.509804, 1, 1,
0.1792934, -2.693635, 3.383029, 0, 0.5019608, 1, 1,
0.1799842, 0.8851392, 0.728795, 0, 0.4941176, 1, 1,
0.1818798, 1.17515, 0.6780812, 0, 0.4901961, 1, 1,
0.1828166, 1.038061, 2.883649, 0, 0.4823529, 1, 1,
0.1863727, -0.8164542, 4.109973, 0, 0.4784314, 1, 1,
0.1871114, 0.03884597, 3.335737, 0, 0.4705882, 1, 1,
0.1873112, -0.8635148, 1.366105, 0, 0.4666667, 1, 1,
0.1911348, 0.5371516, -2.314168, 0, 0.4588235, 1, 1,
0.1928494, -1.316287, 3.533877, 0, 0.454902, 1, 1,
0.1929872, 0.01332085, 3.528339, 0, 0.4470588, 1, 1,
0.1958587, 2.51113, 2.906119, 0, 0.4431373, 1, 1,
0.1959688, 1.827853, 0.05484852, 0, 0.4352941, 1, 1,
0.1960538, -0.9018846, 1.659889, 0, 0.4313726, 1, 1,
0.1977225, 0.253929, 1.123148, 0, 0.4235294, 1, 1,
0.1984182, 1.584198, 0.1452868, 0, 0.4196078, 1, 1,
0.1984348, 0.2097103, -1.971743, 0, 0.4117647, 1, 1,
0.1985695, 0.9209862, -0.4195432, 0, 0.4078431, 1, 1,
0.2055015, 0.5714743, 0.2346161, 0, 0.4, 1, 1,
0.2064982, -1.009017, 2.396811, 0, 0.3921569, 1, 1,
0.2154751, 0.5584691, -0.9574919, 0, 0.3882353, 1, 1,
0.2183633, 0.537393, -1.703479, 0, 0.3803922, 1, 1,
0.2190385, 1.094873, 1.074762, 0, 0.3764706, 1, 1,
0.2197834, -0.402847, 2.434204, 0, 0.3686275, 1, 1,
0.219866, 0.6511061, 0.6666995, 0, 0.3647059, 1, 1,
0.2202311, -0.9097615, 1.449777, 0, 0.3568628, 1, 1,
0.220684, -0.2004978, 1.93491, 0, 0.3529412, 1, 1,
0.2251775, -1.089056, 3.766297, 0, 0.345098, 1, 1,
0.2337478, -1.882312, 3.31, 0, 0.3411765, 1, 1,
0.2344976, 0.4172738, 0.7879658, 0, 0.3333333, 1, 1,
0.239817, 0.2497172, 0.8002268, 0, 0.3294118, 1, 1,
0.2438851, -0.09696567, 0.4099695, 0, 0.3215686, 1, 1,
0.2469916, -1.474841, 3.995931, 0, 0.3176471, 1, 1,
0.2503086, -2.394683, 3.637403, 0, 0.3098039, 1, 1,
0.2546769, -0.03355556, 1.454203, 0, 0.3058824, 1, 1,
0.2576552, -0.6340963, 3.206075, 0, 0.2980392, 1, 1,
0.2612248, -0.7803247, 3.288839, 0, 0.2901961, 1, 1,
0.2614833, 1.055582, 0.9120211, 0, 0.2862745, 1, 1,
0.2656321, 1.36132, -0.5376473, 0, 0.2784314, 1, 1,
0.2727672, 0.1206546, 1.176303, 0, 0.2745098, 1, 1,
0.2758341, 0.1631579, 0.8505033, 0, 0.2666667, 1, 1,
0.2774459, -1.017225, 3.430598, 0, 0.2627451, 1, 1,
0.2835777, 0.690091, -1.595479, 0, 0.254902, 1, 1,
0.2881175, 1.492306, 0.5119886, 0, 0.2509804, 1, 1,
0.2910743, -0.2286962, 1.751782, 0, 0.2431373, 1, 1,
0.2921298, -1.827564, 2.86366, 0, 0.2392157, 1, 1,
0.2927048, -0.6555208, 3.047419, 0, 0.2313726, 1, 1,
0.3053174, 0.5216576, 0.05707803, 0, 0.227451, 1, 1,
0.3076056, -0.09607068, 2.169514, 0, 0.2196078, 1, 1,
0.3083628, 1.160065, -0.03119262, 0, 0.2156863, 1, 1,
0.3141947, 0.5770409, -1.015882, 0, 0.2078431, 1, 1,
0.3214241, 0.5936106, 3.015501, 0, 0.2039216, 1, 1,
0.3264402, -1.047076, 4.017411, 0, 0.1960784, 1, 1,
0.3315053, 1.472437, -1.954402, 0, 0.1882353, 1, 1,
0.3334763, 0.6654102, 0.8918145, 0, 0.1843137, 1, 1,
0.3345564, -1.535917, 2.232306, 0, 0.1764706, 1, 1,
0.3350574, -0.6288242, 2.961038, 0, 0.172549, 1, 1,
0.3375175, -0.7419356, 2.608973, 0, 0.1647059, 1, 1,
0.3376132, -0.9025438, 3.209703, 0, 0.1607843, 1, 1,
0.3428295, 0.3511819, 1.400844, 0, 0.1529412, 1, 1,
0.3437241, -2.234024, 2.411351, 0, 0.1490196, 1, 1,
0.3478755, 1.00666, -1.066024, 0, 0.1411765, 1, 1,
0.3511049, -0.5342945, 1.199659, 0, 0.1372549, 1, 1,
0.3529547, 0.9994864, -0.01005382, 0, 0.1294118, 1, 1,
0.3586837, 1.18912, 0.8828776, 0, 0.1254902, 1, 1,
0.3596807, 0.223445, 0.7353975, 0, 0.1176471, 1, 1,
0.361935, -0.5296829, 1.94401, 0, 0.1137255, 1, 1,
0.3716761, 0.1436539, 0.354854, 0, 0.1058824, 1, 1,
0.3740393, -0.1248537, 2.218665, 0, 0.09803922, 1, 1,
0.3812004, 0.1394641, 2.004839, 0, 0.09411765, 1, 1,
0.3878828, 0.08772426, 2.712389, 0, 0.08627451, 1, 1,
0.4008411, -0.2275176, 1.589224, 0, 0.08235294, 1, 1,
0.4035687, -0.5031645, 0.4656943, 0, 0.07450981, 1, 1,
0.4074979, -0.2617253, 1.379734, 0, 0.07058824, 1, 1,
0.4081544, -0.4239222, 2.180368, 0, 0.0627451, 1, 1,
0.4115824, -0.869527, 2.447267, 0, 0.05882353, 1, 1,
0.4121712, -0.8889195, 2.2374, 0, 0.05098039, 1, 1,
0.4161145, -0.2969456, 2.990075, 0, 0.04705882, 1, 1,
0.4170007, 0.1972793, 0.3681238, 0, 0.03921569, 1, 1,
0.4172531, -1.654211, 2.271329, 0, 0.03529412, 1, 1,
0.4177247, 0.7444653, -1.095239, 0, 0.02745098, 1, 1,
0.4230342, -0.5259722, 1.914927, 0, 0.02352941, 1, 1,
0.4248821, 1.504049, 2.322219, 0, 0.01568628, 1, 1,
0.4290491, -0.5324362, 3.343832, 0, 0.01176471, 1, 1,
0.430082, 1.256479, 0.3943818, 0, 0.003921569, 1, 1,
0.43202, 0.9330942, 0.06378665, 0.003921569, 0, 1, 1,
0.4353918, 0.7604517, 1.386805, 0.007843138, 0, 1, 1,
0.4370162, -1.067212, 4.279429, 0.01568628, 0, 1, 1,
0.4388439, 0.1957549, 1.757722, 0.01960784, 0, 1, 1,
0.4600793, -0.8646076, 2.264936, 0.02745098, 0, 1, 1,
0.4625623, -0.6140954, 2.280735, 0.03137255, 0, 1, 1,
0.4625743, -0.5864355, 2.813243, 0.03921569, 0, 1, 1,
0.4900746, 0.8152683, 1.563994, 0.04313726, 0, 1, 1,
0.4909742, -0.4165742, 3.679387, 0.05098039, 0, 1, 1,
0.4978143, -0.7259325, 3.565045, 0.05490196, 0, 1, 1,
0.5087031, -1.111709, 2.766764, 0.0627451, 0, 1, 1,
0.5118968, 0.4204912, 0.8713939, 0.06666667, 0, 1, 1,
0.5206714, -0.392444, 2.6805, 0.07450981, 0, 1, 1,
0.5245853, -0.5681242, 1.249671, 0.07843138, 0, 1, 1,
0.5261026, -0.47695, 3.024014, 0.08627451, 0, 1, 1,
0.5280763, 1.247195, 0.2383851, 0.09019608, 0, 1, 1,
0.5318334, -1.148777, 3.552801, 0.09803922, 0, 1, 1,
0.5339114, 1.683725, 1.164128, 0.1058824, 0, 1, 1,
0.5404978, -1.42675, 4.324307, 0.1098039, 0, 1, 1,
0.5410796, -1.647913, 3.539672, 0.1176471, 0, 1, 1,
0.5496468, -2.093675, 0.9649433, 0.1215686, 0, 1, 1,
0.5512701, -0.2391569, 0.3618414, 0.1294118, 0, 1, 1,
0.5523029, 0.9594678, 0.165055, 0.1333333, 0, 1, 1,
0.5542212, -0.02547263, 1.646322, 0.1411765, 0, 1, 1,
0.5548942, -1.453652, 4.146332, 0.145098, 0, 1, 1,
0.560376, 1.425686, -0.2237992, 0.1529412, 0, 1, 1,
0.5620066, 1.009277, 0.3978593, 0.1568628, 0, 1, 1,
0.5682067, -0.5013062, 2.842535, 0.1647059, 0, 1, 1,
0.572952, -1.466053, 1.856542, 0.1686275, 0, 1, 1,
0.5777268, 0.2303285, 0.6881413, 0.1764706, 0, 1, 1,
0.5835594, 1.583194, -1.401819, 0.1803922, 0, 1, 1,
0.5850449, -0.1175923, -0.4857609, 0.1882353, 0, 1, 1,
0.5875462, 0.5329797, 1.415548, 0.1921569, 0, 1, 1,
0.5900933, 1.079731, 0.9236523, 0.2, 0, 1, 1,
0.5910458, 0.1383945, 0.9390155, 0.2078431, 0, 1, 1,
0.6010631, -0.9532225, 3.417036, 0.2117647, 0, 1, 1,
0.6024065, 1.049595, -2.393423, 0.2196078, 0, 1, 1,
0.6073946, 0.0002424223, 3.227726, 0.2235294, 0, 1, 1,
0.6077268, -1.318544, 3.980299, 0.2313726, 0, 1, 1,
0.6088797, 0.2686225, 1.563909, 0.2352941, 0, 1, 1,
0.6120872, -0.3111432, 2.037724, 0.2431373, 0, 1, 1,
0.6127993, -0.4324953, 1.948472, 0.2470588, 0, 1, 1,
0.615958, -2.442453, 2.582284, 0.254902, 0, 1, 1,
0.6162251, -0.5912647, 1.14311, 0.2588235, 0, 1, 1,
0.6167114, -0.2798122, 2.108727, 0.2666667, 0, 1, 1,
0.6218046, 0.6296252, 0.8405066, 0.2705882, 0, 1, 1,
0.6227844, -0.21439, 1.31491, 0.2784314, 0, 1, 1,
0.6331049, 0.8251485, 0.3800888, 0.282353, 0, 1, 1,
0.635623, 0.2950352, 1.115614, 0.2901961, 0, 1, 1,
0.6423941, 0.4388997, 2.601785, 0.2941177, 0, 1, 1,
0.6488863, -0.6468397, 0.3986572, 0.3019608, 0, 1, 1,
0.6528143, -0.6290152, 2.651567, 0.3098039, 0, 1, 1,
0.6541583, 0.9998234, -0.1739956, 0.3137255, 0, 1, 1,
0.6556424, -0.369241, 0.8378892, 0.3215686, 0, 1, 1,
0.6648024, 1.443779, -0.02068447, 0.3254902, 0, 1, 1,
0.6690622, 0.460472, 0.5320386, 0.3333333, 0, 1, 1,
0.6690704, 1.008505, -0.3777767, 0.3372549, 0, 1, 1,
0.6740416, 1.519566, -1.488296, 0.345098, 0, 1, 1,
0.6756948, 0.6933286, 1.908367, 0.3490196, 0, 1, 1,
0.6763792, 0.4510973, 0.6721912, 0.3568628, 0, 1, 1,
0.6766582, 1.557014, 0.2036596, 0.3607843, 0, 1, 1,
0.6768528, 0.4369101, 1.067265, 0.3686275, 0, 1, 1,
0.6776799, -1.048643, 3.048479, 0.372549, 0, 1, 1,
0.6779859, 0.493713, 0.677657, 0.3803922, 0, 1, 1,
0.678115, 1.119812, 0.7431102, 0.3843137, 0, 1, 1,
0.6787624, 0.1765931, 0.4823825, 0.3921569, 0, 1, 1,
0.679501, 1.102597, -0.1704843, 0.3960784, 0, 1, 1,
0.6806189, -2.315465, 2.243485, 0.4039216, 0, 1, 1,
0.6849005, 0.8671371, 2.227355, 0.4117647, 0, 1, 1,
0.6866505, -0.05535408, 2.809652, 0.4156863, 0, 1, 1,
0.6887798, 1.465853, 0.6628649, 0.4235294, 0, 1, 1,
0.69167, 1.115753, -0.3851858, 0.427451, 0, 1, 1,
0.6921632, -1.140821, 3.261617, 0.4352941, 0, 1, 1,
0.6939766, 1.555078, -0.7787524, 0.4392157, 0, 1, 1,
0.6995512, 0.02318225, 2.627808, 0.4470588, 0, 1, 1,
0.7019866, -0.5566441, 0.6731881, 0.4509804, 0, 1, 1,
0.7032324, -0.08014379, 1.423725, 0.4588235, 0, 1, 1,
0.704416, -3.490797, 4.720723, 0.4627451, 0, 1, 1,
0.7055189, 0.7272525, -0.5260818, 0.4705882, 0, 1, 1,
0.7058151, -1.809851, 2.982589, 0.4745098, 0, 1, 1,
0.7089602, 0.3610266, 1.892218, 0.4823529, 0, 1, 1,
0.7174673, 1.625869, 0.3297238, 0.4862745, 0, 1, 1,
0.7202841, 0.2545702, 2.629699, 0.4941176, 0, 1, 1,
0.7262288, -0.4017456, 2.617407, 0.5019608, 0, 1, 1,
0.7343607, 0.7890995, 2.786887, 0.5058824, 0, 1, 1,
0.7419556, 0.1899246, 1.311392, 0.5137255, 0, 1, 1,
0.7447624, 0.1353931, 0.3394392, 0.5176471, 0, 1, 1,
0.744884, -1.366214, 2.157698, 0.5254902, 0, 1, 1,
0.7449712, -0.03647472, 0.8039593, 0.5294118, 0, 1, 1,
0.7469625, 1.424193, 0.7639667, 0.5372549, 0, 1, 1,
0.7489094, 1.70143, 0.5863838, 0.5411765, 0, 1, 1,
0.7510485, 1.535329, -2.09993, 0.5490196, 0, 1, 1,
0.7520786, -1.705586, 3.941712, 0.5529412, 0, 1, 1,
0.7531143, -1.752965, 0.5488083, 0.5607843, 0, 1, 1,
0.7535041, -1.315783, 2.471974, 0.5647059, 0, 1, 1,
0.7559407, -0.830381, 2.613043, 0.572549, 0, 1, 1,
0.7565097, -0.8386833, 1.791907, 0.5764706, 0, 1, 1,
0.7585248, 1.192973, 2.336933, 0.5843138, 0, 1, 1,
0.7640613, 0.6622452, 1.071538, 0.5882353, 0, 1, 1,
0.7651661, 1.736255, 2.148419, 0.5960785, 0, 1, 1,
0.7679332, -0.1193717, 3.331285, 0.6039216, 0, 1, 1,
0.7700048, 0.5930395, 0.1196888, 0.6078432, 0, 1, 1,
0.7768164, 0.2298551, 1.811444, 0.6156863, 0, 1, 1,
0.7802899, 0.4779223, 0.1605506, 0.6196079, 0, 1, 1,
0.7816785, 2.819501, 1.455512, 0.627451, 0, 1, 1,
0.7891332, -1.090808, 0.8916846, 0.6313726, 0, 1, 1,
0.7922819, -0.8651463, 2.999392, 0.6392157, 0, 1, 1,
0.8019541, -0.2540792, 1.985736, 0.6431373, 0, 1, 1,
0.8021598, 0.4708324, 1.634364, 0.6509804, 0, 1, 1,
0.803867, -0.2162395, 3.200111, 0.654902, 0, 1, 1,
0.8056229, 0.1091222, 2.71235, 0.6627451, 0, 1, 1,
0.8074083, 0.0008906903, 2.395602, 0.6666667, 0, 1, 1,
0.8268631, -0.2910717, 2.357809, 0.6745098, 0, 1, 1,
0.82693, 2.42152, 1.864448, 0.6784314, 0, 1, 1,
0.8313119, -0.7349096, 2.656083, 0.6862745, 0, 1, 1,
0.8334405, 0.3011134, 0.4831752, 0.6901961, 0, 1, 1,
0.8362628, -0.8970246, 3.602011, 0.6980392, 0, 1, 1,
0.8415055, -0.9644054, 4.495584, 0.7058824, 0, 1, 1,
0.8455328, 0.05592059, 1.774674, 0.7098039, 0, 1, 1,
0.8471249, -0.7843214, 1.720452, 0.7176471, 0, 1, 1,
0.8489226, 0.9037122, 1.72308, 0.7215686, 0, 1, 1,
0.8513356, 2.579894, 1.129982, 0.7294118, 0, 1, 1,
0.8531249, -1.461682, 3.213389, 0.7333333, 0, 1, 1,
0.8545178, 1.911655, -0.5792645, 0.7411765, 0, 1, 1,
0.8553727, -1.679514, 2.412066, 0.7450981, 0, 1, 1,
0.858492, 0.1332478, 3.150493, 0.7529412, 0, 1, 1,
0.8612806, 0.7239497, 1.681633, 0.7568628, 0, 1, 1,
0.864193, 0.7418593, 1.476593, 0.7647059, 0, 1, 1,
0.8791971, -0.6153988, 2.624654, 0.7686275, 0, 1, 1,
0.8842225, -0.336549, 1.632741, 0.7764706, 0, 1, 1,
0.8880073, 1.101566, 3.522917, 0.7803922, 0, 1, 1,
0.8920066, 1.512093, 0.7329685, 0.7882353, 0, 1, 1,
0.8936909, -0.4328499, 2.156384, 0.7921569, 0, 1, 1,
0.9087461, -1.043943, 4.60421, 0.8, 0, 1, 1,
0.9088683, 1.935588, -0.2717527, 0.8078431, 0, 1, 1,
0.9136215, -0.7657152, 3.936978, 0.8117647, 0, 1, 1,
0.9175731, -1.478788, 2.451773, 0.8196079, 0, 1, 1,
0.9181939, -0.2463638, 2.135755, 0.8235294, 0, 1, 1,
0.919345, 0.984108, 0.1199064, 0.8313726, 0, 1, 1,
0.923869, -0.9260822, 2.030295, 0.8352941, 0, 1, 1,
0.9295929, 0.07001581, 2.258831, 0.8431373, 0, 1, 1,
0.9311993, -0.3759985, 1.542976, 0.8470588, 0, 1, 1,
0.9395266, -0.8095989, 2.93936, 0.854902, 0, 1, 1,
0.9434137, 0.7384047, 2.400893, 0.8588235, 0, 1, 1,
0.9438277, 1.095056, -0.7201627, 0.8666667, 0, 1, 1,
0.9493111, 0.2253906, 1.633539, 0.8705882, 0, 1, 1,
0.9548449, 0.2414316, 2.269998, 0.8784314, 0, 1, 1,
0.9583426, -0.4632578, 2.756288, 0.8823529, 0, 1, 1,
0.9621021, 0.2171867, 2.714424, 0.8901961, 0, 1, 1,
0.9643989, 0.6127319, 0.9863783, 0.8941177, 0, 1, 1,
0.9687425, -0.4465114, 2.065894, 0.9019608, 0, 1, 1,
0.9763696, -0.89276, 2.534991, 0.9098039, 0, 1, 1,
0.9793144, 1.475566, 2.750802, 0.9137255, 0, 1, 1,
0.9803402, -0.3943748, -0.02718495, 0.9215686, 0, 1, 1,
0.9806243, 2.084842, 1.565752, 0.9254902, 0, 1, 1,
0.9852771, 0.1312097, 2.297966, 0.9333333, 0, 1, 1,
0.987149, 0.8611875, 0.5645275, 0.9372549, 0, 1, 1,
0.9974183, 1.562396, -0.1204004, 0.945098, 0, 1, 1,
0.9985313, 0.42829, -0.6542293, 0.9490196, 0, 1, 1,
1.016577, 0.5724755, -1.210086, 0.9568627, 0, 1, 1,
1.021039, -0.1719104, 2.068748, 0.9607843, 0, 1, 1,
1.021634, 0.665149, 1.163748, 0.9686275, 0, 1, 1,
1.031028, 0.9089889, -0.9873377, 0.972549, 0, 1, 1,
1.033292, 0.4611497, 0.1152661, 0.9803922, 0, 1, 1,
1.035691, -1.509406, 1.641927, 0.9843137, 0, 1, 1,
1.041363, -0.6095951, 2.922132, 0.9921569, 0, 1, 1,
1.043763, 0.6161952, 0.7563902, 0.9960784, 0, 1, 1,
1.045642, 2.424133, 0.251136, 1, 0, 0.9960784, 1,
1.046622, 2.896941, 1.253201, 1, 0, 0.9882353, 1,
1.047802, -0.4807473, 1.881756, 1, 0, 0.9843137, 1,
1.050942, -0.1830788, 2.20041, 1, 0, 0.9764706, 1,
1.063488, 0.9268892, 1.162104, 1, 0, 0.972549, 1,
1.063639, -0.9971111, 2.456187, 1, 0, 0.9647059, 1,
1.070467, -0.1464398, 1.873823, 1, 0, 0.9607843, 1,
1.070469, -0.7728781, 4.118505, 1, 0, 0.9529412, 1,
1.071677, 0.08089031, 1.76531, 1, 0, 0.9490196, 1,
1.07172, 0.04701985, 2.00035, 1, 0, 0.9411765, 1,
1.075356, -0.4337994, 3.855135, 1, 0, 0.9372549, 1,
1.075645, 1.802455, -0.2841813, 1, 0, 0.9294118, 1,
1.08704, -0.3518882, 1.619579, 1, 0, 0.9254902, 1,
1.087223, 0.02345438, 2.061603, 1, 0, 0.9176471, 1,
1.103097, 0.1635744, 3.022126, 1, 0, 0.9137255, 1,
1.104092, 0.01523701, 2.745437, 1, 0, 0.9058824, 1,
1.104965, -0.01403108, 1.272108, 1, 0, 0.9019608, 1,
1.106908, -1.08697, 1.141062, 1, 0, 0.8941177, 1,
1.108599, 0.477522, 1.702734, 1, 0, 0.8862745, 1,
1.1215, 1.400885, -1.728322, 1, 0, 0.8823529, 1,
1.122239, 1.114404, 1.258914, 1, 0, 0.8745098, 1,
1.125834, -1.927908, 2.76985, 1, 0, 0.8705882, 1,
1.128617, 2.282577, 0.6228731, 1, 0, 0.8627451, 1,
1.131121, -0.07880998, 1.848676, 1, 0, 0.8588235, 1,
1.141347, 0.114768, 1.804423, 1, 0, 0.8509804, 1,
1.156623, 0.2150604, -0.04078982, 1, 0, 0.8470588, 1,
1.170352, -0.3174954, 3.156142, 1, 0, 0.8392157, 1,
1.175997, -0.7522765, 0.492794, 1, 0, 0.8352941, 1,
1.180467, -0.245305, -0.6675466, 1, 0, 0.827451, 1,
1.181093, -1.003735, 3.975131, 1, 0, 0.8235294, 1,
1.181868, -0.4503465, 1.027897, 1, 0, 0.8156863, 1,
1.181954, 2.198986, -0.3030525, 1, 0, 0.8117647, 1,
1.18846, 0.6304761, 3.014006, 1, 0, 0.8039216, 1,
1.191156, -0.4141177, 2.309864, 1, 0, 0.7960784, 1,
1.194657, 0.4605373, 2.68964, 1, 0, 0.7921569, 1,
1.195536, 1.040741, 0.7396957, 1, 0, 0.7843137, 1,
1.19994, 0.5425513, 1.399958, 1, 0, 0.7803922, 1,
1.210871, 0.6372749, 0.7138812, 1, 0, 0.772549, 1,
1.212526, -0.6149558, 1.893495, 1, 0, 0.7686275, 1,
1.213324, 0.6788735, 1.625947, 1, 0, 0.7607843, 1,
1.213384, -0.463042, 1.640738, 1, 0, 0.7568628, 1,
1.214103, -0.44801, 3.146083, 1, 0, 0.7490196, 1,
1.217523, -0.5528374, 3.147306, 1, 0, 0.7450981, 1,
1.220701, -1.764791, 0.9644393, 1, 0, 0.7372549, 1,
1.228208, 0.5830645, -1.016807, 1, 0, 0.7333333, 1,
1.234406, 0.7736171, 1.028343, 1, 0, 0.7254902, 1,
1.234579, 1.05134, 0.4957752, 1, 0, 0.7215686, 1,
1.243357, -0.1887829, 2.361162, 1, 0, 0.7137255, 1,
1.251534, 0.1322806, 2.298556, 1, 0, 0.7098039, 1,
1.253255, -1.189527, 3.439641, 1, 0, 0.7019608, 1,
1.260847, -0.06115882, 3.187976, 1, 0, 0.6941177, 1,
1.282668, 0.8760269, 1.561701, 1, 0, 0.6901961, 1,
1.291781, -0.7112553, 2.962726, 1, 0, 0.682353, 1,
1.293134, -0.2400662, 1.368147, 1, 0, 0.6784314, 1,
1.293428, -0.005903208, 1.914009, 1, 0, 0.6705883, 1,
1.296017, 1.393298, 1.38846, 1, 0, 0.6666667, 1,
1.297607, -1.387159, 3.171683, 1, 0, 0.6588235, 1,
1.300254, 0.3781195, 2.222535, 1, 0, 0.654902, 1,
1.300278, -0.8397292, 3.206594, 1, 0, 0.6470588, 1,
1.300819, -1.53982, 1.875529, 1, 0, 0.6431373, 1,
1.301705, -0.4483167, 2.80464, 1, 0, 0.6352941, 1,
1.304348, -1.029509, 4.12367, 1, 0, 0.6313726, 1,
1.305181, -0.09844042, 1.971698, 1, 0, 0.6235294, 1,
1.316623, -0.2932019, 3.094212, 1, 0, 0.6196079, 1,
1.323623, 1.29372, 0.4558433, 1, 0, 0.6117647, 1,
1.326228, -0.9741247, 3.929489, 1, 0, 0.6078432, 1,
1.327011, -0.589344, 2.06279, 1, 0, 0.6, 1,
1.327494, 0.4093591, 1.970162, 1, 0, 0.5921569, 1,
1.351817, 1.240168, 1.352066, 1, 0, 0.5882353, 1,
1.36483, 0.4746836, 0.9237891, 1, 0, 0.5803922, 1,
1.367708, -1.11206, 3.464728, 1, 0, 0.5764706, 1,
1.369851, -1.27152, 1.410253, 1, 0, 0.5686275, 1,
1.371286, 0.2639342, -0.875181, 1, 0, 0.5647059, 1,
1.382155, 0.353452, 2.460866, 1, 0, 0.5568628, 1,
1.394963, -0.1546256, 2.334866, 1, 0, 0.5529412, 1,
1.403851, 0.2681575, 0.2983762, 1, 0, 0.5450981, 1,
1.418978, 2.468821, 1.295386, 1, 0, 0.5411765, 1,
1.424634, 0.8758487, -0.6326316, 1, 0, 0.5333334, 1,
1.42657, -1.324961, 2.608737, 1, 0, 0.5294118, 1,
1.43725, -0.8052556, 2.692624, 1, 0, 0.5215687, 1,
1.441499, 0.3924927, 0.3752882, 1, 0, 0.5176471, 1,
1.457345, -0.02725476, 2.141019, 1, 0, 0.509804, 1,
1.457726, -2.297475, 1.597379, 1, 0, 0.5058824, 1,
1.458977, -1.717011, 3.061664, 1, 0, 0.4980392, 1,
1.459485, -0.2720384, 3.39079, 1, 0, 0.4901961, 1,
1.467975, 0.3239662, 2.304132, 1, 0, 0.4862745, 1,
1.475384, -0.07925916, 2.626752, 1, 0, 0.4784314, 1,
1.480928, 1.293051, 0.6146432, 1, 0, 0.4745098, 1,
1.493172, -0.333497, 1.66543, 1, 0, 0.4666667, 1,
1.510957, -0.3902193, 1.246031, 1, 0, 0.4627451, 1,
1.519362, 0.1568606, 1.359771, 1, 0, 0.454902, 1,
1.521762, 0.3853228, 0.16706, 1, 0, 0.4509804, 1,
1.521799, 0.1098267, 1.226756, 1, 0, 0.4431373, 1,
1.525669, -0.0167974, 1.344319, 1, 0, 0.4392157, 1,
1.542104, -0.3157471, 0.9925984, 1, 0, 0.4313726, 1,
1.546411, 1.315804, 0.4488931, 1, 0, 0.427451, 1,
1.546665, -1.63227, 1.903594, 1, 0, 0.4196078, 1,
1.581413, 0.07463824, -0.5229749, 1, 0, 0.4156863, 1,
1.583406, -0.3463022, 0.7774468, 1, 0, 0.4078431, 1,
1.587386, -1.211427, 3.943832, 1, 0, 0.4039216, 1,
1.597298, -2.790949, 1.381038, 1, 0, 0.3960784, 1,
1.609974, 0.5584404, 1.260819, 1, 0, 0.3882353, 1,
1.619588, 0.4852956, 0.1882754, 1, 0, 0.3843137, 1,
1.628113, -0.4858897, 1.919819, 1, 0, 0.3764706, 1,
1.64031, 0.02975413, 1.752479, 1, 0, 0.372549, 1,
1.641598, 0.2206405, 1.620869, 1, 0, 0.3647059, 1,
1.651472, -0.7901552, 3.595554, 1, 0, 0.3607843, 1,
1.656899, 0.3322907, 0.4531926, 1, 0, 0.3529412, 1,
1.657328, 0.5227536, 0.6952364, 1, 0, 0.3490196, 1,
1.657693, 2.285697, 1.529813, 1, 0, 0.3411765, 1,
1.70239, -0.09913269, 2.698938, 1, 0, 0.3372549, 1,
1.709101, -0.9220948, 0.6864373, 1, 0, 0.3294118, 1,
1.719581, -0.2412927, 2.37794, 1, 0, 0.3254902, 1,
1.735659, -0.4034436, 1.460142, 1, 0, 0.3176471, 1,
1.736752, 0.5901394, 0.7181755, 1, 0, 0.3137255, 1,
1.759138, -0.1599672, 1.785077, 1, 0, 0.3058824, 1,
1.765132, -0.3770786, 2.244568, 1, 0, 0.2980392, 1,
1.768349, -0.5057953, 0.9826061, 1, 0, 0.2941177, 1,
1.773634, 1.820946, 1.122664, 1, 0, 0.2862745, 1,
1.781212, 0.8174506, 0.9963543, 1, 0, 0.282353, 1,
1.783818, -0.6855917, 0.7070206, 1, 0, 0.2745098, 1,
1.801225, -1.125066, 1.166942, 1, 0, 0.2705882, 1,
1.810835, -1.188596, 3.361728, 1, 0, 0.2627451, 1,
1.82454, -1.06906, 1.937639, 1, 0, 0.2588235, 1,
1.832909, 0.2952482, 0.5138076, 1, 0, 0.2509804, 1,
1.868716, 0.4067, 1.264219, 1, 0, 0.2470588, 1,
1.876618, -0.2219602, 1.201401, 1, 0, 0.2392157, 1,
1.890466, -0.2842429, 0.006837338, 1, 0, 0.2352941, 1,
1.903792, -0.6725454, 3.547043, 1, 0, 0.227451, 1,
1.90503, 1.201075, 0.5272228, 1, 0, 0.2235294, 1,
1.905553, 0.8141137, -0.9172111, 1, 0, 0.2156863, 1,
1.921464, 1.379568, 0.294467, 1, 0, 0.2117647, 1,
1.92205, 0.4623181, 1.18144, 1, 0, 0.2039216, 1,
1.924132, 0.4822393, 2.220603, 1, 0, 0.1960784, 1,
1.937915, -1.196175, 0.4859094, 1, 0, 0.1921569, 1,
1.971143, 1.18577, 0.8460195, 1, 0, 0.1843137, 1,
1.980141, 0.4408502, 1.920377, 1, 0, 0.1803922, 1,
1.980932, -0.2931139, 1.214147, 1, 0, 0.172549, 1,
1.993791, 0.6563108, 3.005797, 1, 0, 0.1686275, 1,
2.00706, -1.723529, 0.550171, 1, 0, 0.1607843, 1,
2.014752, 0.879829, -0.4323446, 1, 0, 0.1568628, 1,
2.017969, -1.00838, 2.497456, 1, 0, 0.1490196, 1,
2.031119, -1.784534, -0.2653467, 1, 0, 0.145098, 1,
2.046756, -0.9841222, 3.633084, 1, 0, 0.1372549, 1,
2.093005, 0.8735872, -0.09540349, 1, 0, 0.1333333, 1,
2.096228, -1.784625, 2.529146, 1, 0, 0.1254902, 1,
2.118413, 0.480402, 3.289861, 1, 0, 0.1215686, 1,
2.135633, 0.7299879, 0.7949023, 1, 0, 0.1137255, 1,
2.213683, 1.137709, 1.045154, 1, 0, 0.1098039, 1,
2.226458, 2.625326, 0.8247939, 1, 0, 0.1019608, 1,
2.265517, 0.4392908, 1.663029, 1, 0, 0.09411765, 1,
2.272314, 1.464375, -0.4565979, 1, 0, 0.09019608, 1,
2.308799, -1.062955, 0.7818367, 1, 0, 0.08235294, 1,
2.329346, -0.7470829, 1.604453, 1, 0, 0.07843138, 1,
2.344021, -0.6449097, 1.50617, 1, 0, 0.07058824, 1,
2.421529, -0.7996147, 2.807548, 1, 0, 0.06666667, 1,
2.432511, -0.7790053, -0.2243599, 1, 0, 0.05882353, 1,
2.461336, 0.2940227, 0.2980489, 1, 0, 0.05490196, 1,
2.48401, -0.07099465, 2.520579, 1, 0, 0.04705882, 1,
2.659632, 0.133873, 1.257164, 1, 0, 0.04313726, 1,
2.66352, -0.4079702, 2.10325, 1, 0, 0.03529412, 1,
2.69756, -0.9396331, 0.6985941, 1, 0, 0.03137255, 1,
2.741797, -0.08783154, 2.246967, 1, 0, 0.02352941, 1,
2.829966, 0.5647237, 0.555249, 1, 0, 0.01960784, 1,
2.860768, -1.26914, 1.828178, 1, 0, 0.01176471, 1,
2.914663, -0.2395356, 1.71814, 1, 0, 0.007843138, 1
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
-0.2392364, -4.636507, -7.946157, 0, -0.5, 0.5, 0.5,
-0.2392364, -4.636507, -7.946157, 1, -0.5, 0.5, 0.5,
-0.2392364, -4.636507, -7.946157, 1, 1.5, 0.5, 0.5,
-0.2392364, -4.636507, -7.946157, 0, 1.5, 0.5, 0.5
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
-4.462308, -0.1111213, -7.946157, 0, -0.5, 0.5, 0.5,
-4.462308, -0.1111213, -7.946157, 1, -0.5, 0.5, 0.5,
-4.462308, -0.1111213, -7.946157, 1, 1.5, 0.5, 0.5,
-4.462308, -0.1111213, -7.946157, 0, 1.5, 0.5, 0.5
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
-4.462308, -4.636507, -0.09780121, 0, -0.5, 0.5, 0.5,
-4.462308, -4.636507, -0.09780121, 1, -0.5, 0.5, 0.5,
-4.462308, -4.636507, -0.09780121, 1, 1.5, 0.5, 0.5,
-4.462308, -4.636507, -0.09780121, 0, 1.5, 0.5, 0.5
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
-3, -3.592187, -6.134998,
2, -3.592187, -6.134998,
-3, -3.592187, -6.134998,
-3, -3.766241, -6.436858,
-2, -3.592187, -6.134998,
-2, -3.766241, -6.436858,
-1, -3.592187, -6.134998,
-1, -3.766241, -6.436858,
0, -3.592187, -6.134998,
0, -3.766241, -6.436858,
1, -3.592187, -6.134998,
1, -3.766241, -6.436858,
2, -3.592187, -6.134998,
2, -3.766241, -6.436858
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
-3, -4.114347, -7.040577, 0, -0.5, 0.5, 0.5,
-3, -4.114347, -7.040577, 1, -0.5, 0.5, 0.5,
-3, -4.114347, -7.040577, 1, 1.5, 0.5, 0.5,
-3, -4.114347, -7.040577, 0, 1.5, 0.5, 0.5,
-2, -4.114347, -7.040577, 0, -0.5, 0.5, 0.5,
-2, -4.114347, -7.040577, 1, -0.5, 0.5, 0.5,
-2, -4.114347, -7.040577, 1, 1.5, 0.5, 0.5,
-2, -4.114347, -7.040577, 0, 1.5, 0.5, 0.5,
-1, -4.114347, -7.040577, 0, -0.5, 0.5, 0.5,
-1, -4.114347, -7.040577, 1, -0.5, 0.5, 0.5,
-1, -4.114347, -7.040577, 1, 1.5, 0.5, 0.5,
-1, -4.114347, -7.040577, 0, 1.5, 0.5, 0.5,
0, -4.114347, -7.040577, 0, -0.5, 0.5, 0.5,
0, -4.114347, -7.040577, 1, -0.5, 0.5, 0.5,
0, -4.114347, -7.040577, 1, 1.5, 0.5, 0.5,
0, -4.114347, -7.040577, 0, 1.5, 0.5, 0.5,
1, -4.114347, -7.040577, 0, -0.5, 0.5, 0.5,
1, -4.114347, -7.040577, 1, -0.5, 0.5, 0.5,
1, -4.114347, -7.040577, 1, 1.5, 0.5, 0.5,
1, -4.114347, -7.040577, 0, 1.5, 0.5, 0.5,
2, -4.114347, -7.040577, 0, -0.5, 0.5, 0.5,
2, -4.114347, -7.040577, 1, -0.5, 0.5, 0.5,
2, -4.114347, -7.040577, 1, 1.5, 0.5, 0.5,
2, -4.114347, -7.040577, 0, 1.5, 0.5, 0.5
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
-3.487753, -3, -6.134998,
-3.487753, 3, -6.134998,
-3.487753, -3, -6.134998,
-3.650179, -3, -6.436858,
-3.487753, -2, -6.134998,
-3.650179, -2, -6.436858,
-3.487753, -1, -6.134998,
-3.650179, -1, -6.436858,
-3.487753, 0, -6.134998,
-3.650179, 0, -6.436858,
-3.487753, 1, -6.134998,
-3.650179, 1, -6.436858,
-3.487753, 2, -6.134998,
-3.650179, 2, -6.436858,
-3.487753, 3, -6.134998,
-3.650179, 3, -6.436858
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
-3.97503, -3, -7.040577, 0, -0.5, 0.5, 0.5,
-3.97503, -3, -7.040577, 1, -0.5, 0.5, 0.5,
-3.97503, -3, -7.040577, 1, 1.5, 0.5, 0.5,
-3.97503, -3, -7.040577, 0, 1.5, 0.5, 0.5,
-3.97503, -2, -7.040577, 0, -0.5, 0.5, 0.5,
-3.97503, -2, -7.040577, 1, -0.5, 0.5, 0.5,
-3.97503, -2, -7.040577, 1, 1.5, 0.5, 0.5,
-3.97503, -2, -7.040577, 0, 1.5, 0.5, 0.5,
-3.97503, -1, -7.040577, 0, -0.5, 0.5, 0.5,
-3.97503, -1, -7.040577, 1, -0.5, 0.5, 0.5,
-3.97503, -1, -7.040577, 1, 1.5, 0.5, 0.5,
-3.97503, -1, -7.040577, 0, 1.5, 0.5, 0.5,
-3.97503, 0, -7.040577, 0, -0.5, 0.5, 0.5,
-3.97503, 0, -7.040577, 1, -0.5, 0.5, 0.5,
-3.97503, 0, -7.040577, 1, 1.5, 0.5, 0.5,
-3.97503, 0, -7.040577, 0, 1.5, 0.5, 0.5,
-3.97503, 1, -7.040577, 0, -0.5, 0.5, 0.5,
-3.97503, 1, -7.040577, 1, -0.5, 0.5, 0.5,
-3.97503, 1, -7.040577, 1, 1.5, 0.5, 0.5,
-3.97503, 1, -7.040577, 0, 1.5, 0.5, 0.5,
-3.97503, 2, -7.040577, 0, -0.5, 0.5, 0.5,
-3.97503, 2, -7.040577, 1, -0.5, 0.5, 0.5,
-3.97503, 2, -7.040577, 1, 1.5, 0.5, 0.5,
-3.97503, 2, -7.040577, 0, 1.5, 0.5, 0.5,
-3.97503, 3, -7.040577, 0, -0.5, 0.5, 0.5,
-3.97503, 3, -7.040577, 1, -0.5, 0.5, 0.5,
-3.97503, 3, -7.040577, 1, 1.5, 0.5, 0.5,
-3.97503, 3, -7.040577, 0, 1.5, 0.5, 0.5
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
-3.487753, -3.592187, -4,
-3.487753, -3.592187, 4,
-3.487753, -3.592187, -4,
-3.650179, -3.766241, -4,
-3.487753, -3.592187, -2,
-3.650179, -3.766241, -2,
-3.487753, -3.592187, 0,
-3.650179, -3.766241, 0,
-3.487753, -3.592187, 2,
-3.650179, -3.766241, 2,
-3.487753, -3.592187, 4,
-3.650179, -3.766241, 4
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
-3.97503, -4.114347, -4, 0, -0.5, 0.5, 0.5,
-3.97503, -4.114347, -4, 1, -0.5, 0.5, 0.5,
-3.97503, -4.114347, -4, 1, 1.5, 0.5, 0.5,
-3.97503, -4.114347, -4, 0, 1.5, 0.5, 0.5,
-3.97503, -4.114347, -2, 0, -0.5, 0.5, 0.5,
-3.97503, -4.114347, -2, 1, -0.5, 0.5, 0.5,
-3.97503, -4.114347, -2, 1, 1.5, 0.5, 0.5,
-3.97503, -4.114347, -2, 0, 1.5, 0.5, 0.5,
-3.97503, -4.114347, 0, 0, -0.5, 0.5, 0.5,
-3.97503, -4.114347, 0, 1, -0.5, 0.5, 0.5,
-3.97503, -4.114347, 0, 1, 1.5, 0.5, 0.5,
-3.97503, -4.114347, 0, 0, 1.5, 0.5, 0.5,
-3.97503, -4.114347, 2, 0, -0.5, 0.5, 0.5,
-3.97503, -4.114347, 2, 1, -0.5, 0.5, 0.5,
-3.97503, -4.114347, 2, 1, 1.5, 0.5, 0.5,
-3.97503, -4.114347, 2, 0, 1.5, 0.5, 0.5,
-3.97503, -4.114347, 4, 0, -0.5, 0.5, 0.5,
-3.97503, -4.114347, 4, 1, -0.5, 0.5, 0.5,
-3.97503, -4.114347, 4, 1, 1.5, 0.5, 0.5,
-3.97503, -4.114347, 4, 0, 1.5, 0.5, 0.5
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
-3.487753, -3.592187, -6.134998,
-3.487753, 3.369945, -6.134998,
-3.487753, -3.592187, 5.939395,
-3.487753, 3.369945, 5.939395,
-3.487753, -3.592187, -6.134998,
-3.487753, -3.592187, 5.939395,
-3.487753, 3.369945, -6.134998,
-3.487753, 3.369945, 5.939395,
-3.487753, -3.592187, -6.134998,
3.00928, -3.592187, -6.134998,
-3.487753, -3.592187, 5.939395,
3.00928, -3.592187, 5.939395,
-3.487753, 3.369945, -6.134998,
3.00928, 3.369945, -6.134998,
-3.487753, 3.369945, 5.939395,
3.00928, 3.369945, 5.939395,
3.00928, -3.592187, -6.134998,
3.00928, 3.369945, -6.134998,
3.00928, -3.592187, 5.939395,
3.00928, 3.369945, 5.939395,
3.00928, -3.592187, -6.134998,
3.00928, -3.592187, 5.939395,
3.00928, 3.369945, -6.134998,
3.00928, 3.369945, 5.939395
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
var radius = 8.211394;
var distance = 36.53342;
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
mvMatrix.translate( 0.2392364, 0.1111213, 0.09780121 );
mvMatrix.scale( 1.366519, 1.27523, 0.7353016 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.53342);
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
thiophosphoric_acid<-read.table("thiophosphoric_acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiophosphoric_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiophosphoric_acid' not found
```

```r
y<-thiophosphoric_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiophosphoric_acid' not found
```

```r
z<-thiophosphoric_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiophosphoric_acid' not found
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
-3.393136, -0.2335345, -2.317618, 0, 0, 1, 1, 1,
-2.857177, 1.088018, -1.346775, 1, 0, 0, 1, 1,
-2.748323, -0.8710547, -1.554158, 1, 0, 0, 1, 1,
-2.631788, -0.684101, -2.749812, 1, 0, 0, 1, 1,
-2.601199, -0.5736893, -2.127188, 1, 0, 0, 1, 1,
-2.575739, 2.46214, -0.476073, 1, 0, 0, 1, 1,
-2.49758, 1.700002, -1.793066, 0, 0, 0, 1, 1,
-2.435051, -0.417642, -1.499882, 0, 0, 0, 1, 1,
-2.423703, 0.2899656, -1.612199, 0, 0, 0, 1, 1,
-2.416964, -0.4111499, -2.520768, 0, 0, 0, 1, 1,
-2.346207, 0.3445754, -2.962424, 0, 0, 0, 1, 1,
-2.328853, -1.014877, -2.73835, 0, 0, 0, 1, 1,
-2.282279, 0.5900751, 0.7104149, 0, 0, 0, 1, 1,
-2.2542, 0.8181777, -2.223644, 1, 1, 1, 1, 1,
-2.243408, -0.4964868, -1.979535, 1, 1, 1, 1, 1,
-2.243339, -1.857786, -3.431331, 1, 1, 1, 1, 1,
-2.22423, -1.165615, -1.424808, 1, 1, 1, 1, 1,
-2.1544, 1.823431, 0.01527104, 1, 1, 1, 1, 1,
-2.138738, 0.4026461, -2.090472, 1, 1, 1, 1, 1,
-2.122195, 0.04090415, -2.255211, 1, 1, 1, 1, 1,
-2.077262, 0.8710225, -0.9527372, 1, 1, 1, 1, 1,
-2.064037, 1.394255, -3.090257, 1, 1, 1, 1, 1,
-2.062717, 0.3399806, -0.7935609, 1, 1, 1, 1, 1,
-2.048656, 0.7499959, -1.161017, 1, 1, 1, 1, 1,
-2.03578, -0.975201, -1.910328, 1, 1, 1, 1, 1,
-1.975898, 1.481901, 0.2767707, 1, 1, 1, 1, 1,
-1.969587, 0.8910992, -1.934915, 1, 1, 1, 1, 1,
-1.948568, 1.27763, 1.569822, 1, 1, 1, 1, 1,
-1.947795, 1.029259, -0.3938318, 0, 0, 1, 1, 1,
-1.947655, -0.8332952, -1.936345, 1, 0, 0, 1, 1,
-1.914317, -0.1610334, -1.122155, 1, 0, 0, 1, 1,
-1.867836, 0.1246099, -1.596701, 1, 0, 0, 1, 1,
-1.845072, 0.1295787, -1.4719, 1, 0, 0, 1, 1,
-1.81402, 0.7517748, -1.886348, 1, 0, 0, 1, 1,
-1.807117, -1.110369, -2.359223, 0, 0, 0, 1, 1,
-1.799003, -0.8696896, -1.733293, 0, 0, 0, 1, 1,
-1.794288, 1.118546, -0.8145612, 0, 0, 0, 1, 1,
-1.789739, -0.4124416, -0.1917698, 0, 0, 0, 1, 1,
-1.788454, 0.573386, -0.8082833, 0, 0, 0, 1, 1,
-1.781179, -1.015516, -0.4298803, 0, 0, 0, 1, 1,
-1.7808, 0.6699412, -1.769331, 0, 0, 0, 1, 1,
-1.734575, 0.4539932, -2.346635, 1, 1, 1, 1, 1,
-1.721636, 0.2654145, -0.1208578, 1, 1, 1, 1, 1,
-1.713696, 1.451102, -0.7323279, 1, 1, 1, 1, 1,
-1.709877, 0.1819731, -1.968332, 1, 1, 1, 1, 1,
-1.686792, -0.3807131, -1.417135, 1, 1, 1, 1, 1,
-1.671341, 0.6456549, -1.193146, 1, 1, 1, 1, 1,
-1.651947, -0.1213015, -2.631728, 1, 1, 1, 1, 1,
-1.61983, -1.592064, -0.8992025, 1, 1, 1, 1, 1,
-1.606377, -1.923854, -3.053183, 1, 1, 1, 1, 1,
-1.598289, -0.02704359, -1.813486, 1, 1, 1, 1, 1,
-1.595433, 0.4525471, -1.875433, 1, 1, 1, 1, 1,
-1.595417, -1.14104, -1.675876, 1, 1, 1, 1, 1,
-1.59423, -0.4991624, -0.741465, 1, 1, 1, 1, 1,
-1.593378, 1.883946, -2.204518, 1, 1, 1, 1, 1,
-1.584309, -1.172419, -2.279334, 1, 1, 1, 1, 1,
-1.580661, -0.1447823, -2.013036, 0, 0, 1, 1, 1,
-1.56402, -0.2372976, -1.090327, 1, 0, 0, 1, 1,
-1.560024, -0.2839002, -2.259471, 1, 0, 0, 1, 1,
-1.547191, -0.4247884, -1.495946, 1, 0, 0, 1, 1,
-1.531543, 0.812964, -1.04774, 1, 0, 0, 1, 1,
-1.530872, 0.8840892, 0.423036, 1, 0, 0, 1, 1,
-1.51904, 0.2844751, -1.635083, 0, 0, 0, 1, 1,
-1.517472, 0.08713058, -1.800873, 0, 0, 0, 1, 1,
-1.510444, 0.02219726, 0.08930409, 0, 0, 0, 1, 1,
-1.502443, -1.612004, -2.317748, 0, 0, 0, 1, 1,
-1.488113, 0.6762439, 1.021421, 0, 0, 0, 1, 1,
-1.486378, 0.556071, -0.7944162, 0, 0, 0, 1, 1,
-1.484067, -0.3870606, -2.529089, 0, 0, 0, 1, 1,
-1.483703, 0.7244984, -2.328399, 1, 1, 1, 1, 1,
-1.474967, -0.3049875, -2.239526, 1, 1, 1, 1, 1,
-1.472194, -0.6509003, -3.74967, 1, 1, 1, 1, 1,
-1.467361, 0.03363067, -2.293814, 1, 1, 1, 1, 1,
-1.463764, -0.991196, -3.001055, 1, 1, 1, 1, 1,
-1.449394, -0.4094354, -3.355898, 1, 1, 1, 1, 1,
-1.440105, 1.362297, -2.159831, 1, 1, 1, 1, 1,
-1.438263, -0.1959956, -0.9251193, 1, 1, 1, 1, 1,
-1.43825, -0.2741764, -2.030356, 1, 1, 1, 1, 1,
-1.432074, -0.9933659, -2.150755, 1, 1, 1, 1, 1,
-1.428639, 1.734153, -1.554326, 1, 1, 1, 1, 1,
-1.421068, -1.107242, -1.73484, 1, 1, 1, 1, 1,
-1.416498, -0.4548347, -2.361049, 1, 1, 1, 1, 1,
-1.410108, 0.1551331, -1.527977, 1, 1, 1, 1, 1,
-1.399837, 0.3929386, -0.1306346, 1, 1, 1, 1, 1,
-1.377697, -0.5631332, -1.448866, 0, 0, 1, 1, 1,
-1.376824, -0.4277525, -0.5300109, 1, 0, 0, 1, 1,
-1.37384, 0.5606619, -1.996297, 1, 0, 0, 1, 1,
-1.373294, 0.8340699, -1.734392, 1, 0, 0, 1, 1,
-1.370623, 0.4198994, -2.073189, 1, 0, 0, 1, 1,
-1.369642, -0.4446294, -1.913426, 1, 0, 0, 1, 1,
-1.363656, -0.2483392, -1.788597, 0, 0, 0, 1, 1,
-1.360994, -0.01492132, -0.53217, 0, 0, 0, 1, 1,
-1.356372, -1.133713, -1.733964, 0, 0, 0, 1, 1,
-1.355607, -0.8790134, -0.9929644, 0, 0, 0, 1, 1,
-1.353665, -0.5530273, -2.632279, 0, 0, 0, 1, 1,
-1.35123, 0.255722, -1.392096, 0, 0, 0, 1, 1,
-1.334622, -0.3477701, -0.8432345, 0, 0, 0, 1, 1,
-1.332626, 0.1770208, -0.3557723, 1, 1, 1, 1, 1,
-1.322171, -0.1716209, -0.3436119, 1, 1, 1, 1, 1,
-1.313644, 0.2938122, -2.489947, 1, 1, 1, 1, 1,
-1.305841, 0.5555086, 0.9773719, 1, 1, 1, 1, 1,
-1.305548, 0.1793354, -1.939725, 1, 1, 1, 1, 1,
-1.294095, 0.6345084, -1.175552, 1, 1, 1, 1, 1,
-1.293232, 0.8841923, -1.83551, 1, 1, 1, 1, 1,
-1.289147, 0.2535232, -2.203675, 1, 1, 1, 1, 1,
-1.285439, -1.064383, -2.950029, 1, 1, 1, 1, 1,
-1.279068, -0.497865, -2.085635, 1, 1, 1, 1, 1,
-1.276276, -1.541644, -0.8717794, 1, 1, 1, 1, 1,
-1.260724, 1.033048, -0.8642471, 1, 1, 1, 1, 1,
-1.260345, -0.864793, -2.55696, 1, 1, 1, 1, 1,
-1.257149, 2.715907, -0.03549739, 1, 1, 1, 1, 1,
-1.25276, -0.8397369, -4.589497, 1, 1, 1, 1, 1,
-1.241842, -0.5033159, -0.2298825, 0, 0, 1, 1, 1,
-1.235106, -0.2502996, -1.601169, 1, 0, 0, 1, 1,
-1.234268, 0.7811638, -2.277636, 1, 0, 0, 1, 1,
-1.228617, 0.1747949, -2.483999, 1, 0, 0, 1, 1,
-1.226923, -1.000818, -4.096022, 1, 0, 0, 1, 1,
-1.221592, 0.6149581, -1.504349, 1, 0, 0, 1, 1,
-1.213666, 2.156183, -0.04975412, 0, 0, 0, 1, 1,
-1.209105, 0.3789246, -1.180562, 0, 0, 0, 1, 1,
-1.200246, 0.5012854, -0.3584367, 0, 0, 0, 1, 1,
-1.198925, 2.111684, -1.477945, 0, 0, 0, 1, 1,
-1.196185, 0.04526885, -2.001574, 0, 0, 0, 1, 1,
-1.189418, 0.7917919, -1.7501, 0, 0, 0, 1, 1,
-1.187967, -0.009392383, -2.551727, 0, 0, 0, 1, 1,
-1.185675, -0.1149917, -1.516684, 1, 1, 1, 1, 1,
-1.183562, -0.1137385, -1.432228, 1, 1, 1, 1, 1,
-1.180912, -0.1852038, -1.764355, 1, 1, 1, 1, 1,
-1.175558, -1.269403, -1.469645, 1, 1, 1, 1, 1,
-1.168135, -0.5601102, -2.932185, 1, 1, 1, 1, 1,
-1.164558, -0.1907615, -1.500082, 1, 1, 1, 1, 1,
-1.153072, -0.3515771, -2.793805, 1, 1, 1, 1, 1,
-1.142778, -1.487558, -1.432176, 1, 1, 1, 1, 1,
-1.125252, 1.945597, -2.028172, 1, 1, 1, 1, 1,
-1.122722, 0.306081, -2.518482, 1, 1, 1, 1, 1,
-1.115947, -0.4436491, -2.38108, 1, 1, 1, 1, 1,
-1.113322, 0.7772266, -0.02754579, 1, 1, 1, 1, 1,
-1.108936, -0.6314063, -1.88371, 1, 1, 1, 1, 1,
-1.108214, -0.007806429, -3.769575, 1, 1, 1, 1, 1,
-1.10578, 0.1301644, -1.546059, 1, 1, 1, 1, 1,
-1.104725, -0.351643, -0.05061226, 0, 0, 1, 1, 1,
-1.104207, 0.7472898, -1.282176, 1, 0, 0, 1, 1,
-1.102161, -1.104895, -2.308507, 1, 0, 0, 1, 1,
-1.099922, 1.302321, -1.163802, 1, 0, 0, 1, 1,
-1.096025, -1.218068, -2.444791, 1, 0, 0, 1, 1,
-1.076225, 0.5263724, -0.03255956, 1, 0, 0, 1, 1,
-1.057419, -0.5705954, -1.327832, 0, 0, 0, 1, 1,
-1.056972, -1.276798, -1.518771, 0, 0, 0, 1, 1,
-1.055118, 0.2205381, -0.5277191, 0, 0, 0, 1, 1,
-1.054513, -0.439148, -2.980526, 0, 0, 0, 1, 1,
-1.054409, 1.048646, -1.774833, 0, 0, 0, 1, 1,
-1.047945, 1.18246, -1.340795, 0, 0, 0, 1, 1,
-1.047819, -1.001076, -2.122449, 0, 0, 0, 1, 1,
-1.043252, -0.2569367, -1.399751, 1, 1, 1, 1, 1,
-1.035866, -0.4811615, -3.00956, 1, 1, 1, 1, 1,
-1.028936, -1.239646, -1.932453, 1, 1, 1, 1, 1,
-1.019643, 0.3194885, -1.035663, 1, 1, 1, 1, 1,
-1.017307, -1.531227, -3.596018, 1, 1, 1, 1, 1,
-1.014781, 2.83364, -0.794757, 1, 1, 1, 1, 1,
-1.004024, -1.337532, -5.075988, 1, 1, 1, 1, 1,
-1.000638, -0.6026045, -3.210216, 1, 1, 1, 1, 1,
-0.9924856, -2.262797, -2.463928, 1, 1, 1, 1, 1,
-0.988407, 1.631723, 0.5495614, 1, 1, 1, 1, 1,
-0.9883004, -0.1791148, -1.947109, 1, 1, 1, 1, 1,
-0.9876644, -0.526707, -3.754192, 1, 1, 1, 1, 1,
-0.9854455, -0.0224228, -0.9023124, 1, 1, 1, 1, 1,
-0.9805821, 0.1088552, -2.787709, 1, 1, 1, 1, 1,
-0.9700164, -1.521312, -4.056627, 1, 1, 1, 1, 1,
-0.9684337, -1.468295, -3.187066, 0, 0, 1, 1, 1,
-0.9672091, -0.4264089, -1.700022, 1, 0, 0, 1, 1,
-0.9630358, -0.08491432, -1.291626, 1, 0, 0, 1, 1,
-0.96125, -0.9867867, -1.694708, 1, 0, 0, 1, 1,
-0.9609899, 0.9246273, -0.9016386, 1, 0, 0, 1, 1,
-0.9572632, 0.4489819, -1.745043, 1, 0, 0, 1, 1,
-0.9484113, 0.8328087, -2.447007, 0, 0, 0, 1, 1,
-0.9453742, -1.159212, -3.05698, 0, 0, 0, 1, 1,
-0.9429035, -0.2880394, -2.114128, 0, 0, 0, 1, 1,
-0.9408954, -1.710045, -2.552309, 0, 0, 0, 1, 1,
-0.9283742, 0.8971958, 0.669027, 0, 0, 0, 1, 1,
-0.9281748, -0.6821927, -1.79025, 0, 0, 0, 1, 1,
-0.9141948, -0.3546431, -1.039071, 0, 0, 0, 1, 1,
-0.9112458, -0.9045008, -2.128167, 1, 1, 1, 1, 1,
-0.8957849, 0.0905256, -2.594713, 1, 1, 1, 1, 1,
-0.8925945, 0.5945863, -1.432464, 1, 1, 1, 1, 1,
-0.8910111, -0.1773931, -1.682619, 1, 1, 1, 1, 1,
-0.889806, 0.3660564, -1.181816, 1, 1, 1, 1, 1,
-0.8842538, -0.0008184245, -1.841964, 1, 1, 1, 1, 1,
-0.8728554, -0.2658604, -3.675481, 1, 1, 1, 1, 1,
-0.8633251, 0.9496372, 0.5846205, 1, 1, 1, 1, 1,
-0.8622217, -0.9790449, -1.339518, 1, 1, 1, 1, 1,
-0.859644, -0.001248468, 0.307009, 1, 1, 1, 1, 1,
-0.8560802, -0.1558875, -1.222805, 1, 1, 1, 1, 1,
-0.8555372, 0.6087334, -1.462855, 1, 1, 1, 1, 1,
-0.8553719, -1.261661, -2.552712, 1, 1, 1, 1, 1,
-0.8545803, 0.881017, -1.450063, 1, 1, 1, 1, 1,
-0.8515597, -1.36938, -1.572447, 1, 1, 1, 1, 1,
-0.8439071, -0.957397, -1.035465, 0, 0, 1, 1, 1,
-0.8424982, -1.43646, -1.874715, 1, 0, 0, 1, 1,
-0.8398731, -0.4432792, -3.813984, 1, 0, 0, 1, 1,
-0.8329638, -0.4846434, -1.904357, 1, 0, 0, 1, 1,
-0.829332, -0.2710538, 0.4020587, 1, 0, 0, 1, 1,
-0.8261083, -0.09039379, -1.207911, 1, 0, 0, 1, 1,
-0.8222507, 0.2682666, -1.308321, 0, 0, 0, 1, 1,
-0.8205579, -0.6502631, -1.600665, 0, 0, 0, 1, 1,
-0.8191678, 0.2334437, -0.4250903, 0, 0, 0, 1, 1,
-0.8180086, -0.7374757, -2.575838, 0, 0, 0, 1, 1,
-0.8157966, -0.332732, -2.754597, 0, 0, 0, 1, 1,
-0.8151156, 1.4104, -1.834539, 0, 0, 0, 1, 1,
-0.8115757, 1.085634, 0.4975772, 0, 0, 0, 1, 1,
-0.807924, -0.6827056, -1.646291, 1, 1, 1, 1, 1,
-0.8006364, 0.578512, -0.1538107, 1, 1, 1, 1, 1,
-0.7960124, 0.6213343, 0.286595, 1, 1, 1, 1, 1,
-0.7910442, 0.2621478, -1.265612, 1, 1, 1, 1, 1,
-0.7899861, 0.2559002, -1.316926, 1, 1, 1, 1, 1,
-0.7883835, 1.461213, -1.477169, 1, 1, 1, 1, 1,
-0.7816428, -1.73088, -3.196441, 1, 1, 1, 1, 1,
-0.7784422, -0.9464531, -2.500707, 1, 1, 1, 1, 1,
-0.777208, 0.3007723, -1.469286, 1, 1, 1, 1, 1,
-0.7762489, 0.219968, -2.466347, 1, 1, 1, 1, 1,
-0.7625807, 1.450404, -0.4861941, 1, 1, 1, 1, 1,
-0.7622266, 0.8815627, -0.2423271, 1, 1, 1, 1, 1,
-0.7614178, -0.09688349, -2.004525, 1, 1, 1, 1, 1,
-0.7605988, -1.834471, -2.279442, 1, 1, 1, 1, 1,
-0.7595509, -0.05761848, -1.7871, 1, 1, 1, 1, 1,
-0.7580554, -0.1857719, -2.100768, 0, 0, 1, 1, 1,
-0.7534392, -0.2457402, -1.278479, 1, 0, 0, 1, 1,
-0.7530821, 0.4080512, 0.3253361, 1, 0, 0, 1, 1,
-0.7478364, 0.8472034, 0.6484702, 1, 0, 0, 1, 1,
-0.7411235, 1.245625, 0.04385222, 1, 0, 0, 1, 1,
-0.7381137, -0.1223614, 0.3699337, 1, 0, 0, 1, 1,
-0.7314519, 0.817917, 0.3444651, 0, 0, 0, 1, 1,
-0.7208236, 2.131073, 0.3864959, 0, 0, 0, 1, 1,
-0.7206077, -1.587854, -0.9057683, 0, 0, 0, 1, 1,
-0.7174132, 0.02977874, -1.197501, 0, 0, 0, 1, 1,
-0.7141242, -0.3709751, -5.403263, 0, 0, 0, 1, 1,
-0.7139599, 0.9412924, -1.16515, 0, 0, 0, 1, 1,
-0.7118881, -0.05222727, -2.169689, 0, 0, 0, 1, 1,
-0.711692, 1.469476, -0.9280088, 1, 1, 1, 1, 1,
-0.7095138, -1.303424, -3.120904, 1, 1, 1, 1, 1,
-0.7053633, 0.3261258, -1.923607, 1, 1, 1, 1, 1,
-0.7004403, -1.959028, -3.813151, 1, 1, 1, 1, 1,
-0.6991166, -1.578349, -3.789277, 1, 1, 1, 1, 1,
-0.696667, -0.781307, -2.105016, 1, 1, 1, 1, 1,
-0.6961045, -0.856002, -3.108095, 1, 1, 1, 1, 1,
-0.6950676, -1.539602, -2.509596, 1, 1, 1, 1, 1,
-0.6940771, -1.002008, -2.359627, 1, 1, 1, 1, 1,
-0.6916733, -1.292095, -2.3258, 1, 1, 1, 1, 1,
-0.691445, 0.1298982, -1.113865, 1, 1, 1, 1, 1,
-0.6871436, 0.07189516, -0.8651141, 1, 1, 1, 1, 1,
-0.6858464, 0.7082211, -0.6562394, 1, 1, 1, 1, 1,
-0.6850917, -1.756572, -2.161684, 1, 1, 1, 1, 1,
-0.6786821, 1.461066, -2.243386, 1, 1, 1, 1, 1,
-0.6742449, 1.1621, 0.2902877, 0, 0, 1, 1, 1,
-0.673998, 1.47888, -0.7939131, 1, 0, 0, 1, 1,
-0.6723731, 0.3583615, -0.8773589, 1, 0, 0, 1, 1,
-0.6697469, -1.282996, -1.879831, 1, 0, 0, 1, 1,
-0.6656426, 0.8413954, -1.392683, 1, 0, 0, 1, 1,
-0.6466557, 1.04422, 0.7034951, 1, 0, 0, 1, 1,
-0.6454991, 0.8733277, -0.6324889, 0, 0, 0, 1, 1,
-0.6413156, -0.7239202, -1.744333, 0, 0, 0, 1, 1,
-0.6381218, -0.05476913, -2.46981, 0, 0, 0, 1, 1,
-0.6373349, 0.9496014, -0.500115, 0, 0, 0, 1, 1,
-0.635458, -0.846209, -2.616786, 0, 0, 0, 1, 1,
-0.6338078, -2.111048, -3.166183, 0, 0, 0, 1, 1,
-0.6290565, 0.4186092, 0.3673047, 0, 0, 0, 1, 1,
-0.6271898, 0.2162417, -0.03542788, 1, 1, 1, 1, 1,
-0.6259869, 0.00927836, -2.732393, 1, 1, 1, 1, 1,
-0.6238603, 0.5883451, 0.5125055, 1, 1, 1, 1, 1,
-0.6210252, 1.083049, -1.092614, 1, 1, 1, 1, 1,
-0.6186123, -0.7982447, -1.726916, 1, 1, 1, 1, 1,
-0.6158787, 0.2017492, -1.648716, 1, 1, 1, 1, 1,
-0.6150596, -1.195989, -1.757615, 1, 1, 1, 1, 1,
-0.6145727, -0.7710382, -3.247516, 1, 1, 1, 1, 1,
-0.6125689, 0.26067, -1.980834, 1, 1, 1, 1, 1,
-0.6095715, 0.8962626, -1.963993, 1, 1, 1, 1, 1,
-0.608592, -1.674079, -1.446329, 1, 1, 1, 1, 1,
-0.6049209, 0.1945225, -0.8469275, 1, 1, 1, 1, 1,
-0.6021217, 0.214966, -1.635495, 1, 1, 1, 1, 1,
-0.5989985, -0.4591452, -1.693738, 1, 1, 1, 1, 1,
-0.5987166, -0.8921265, -2.119156, 1, 1, 1, 1, 1,
-0.596807, 2.32066, -0.08981708, 0, 0, 1, 1, 1,
-0.5933827, 1.962022, -1.264879, 1, 0, 0, 1, 1,
-0.592666, -0.8644955, -1.507918, 1, 0, 0, 1, 1,
-0.5926556, -1.881154, -1.104978, 1, 0, 0, 1, 1,
-0.5917736, 1.83686, -0.3408068, 1, 0, 0, 1, 1,
-0.5912367, 1.426163, -0.5107315, 1, 0, 0, 1, 1,
-0.5886781, 0.8910894, -1.66215, 0, 0, 0, 1, 1,
-0.5837935, -1.634068, -3.643857, 0, 0, 0, 1, 1,
-0.5790427, 0.3271108, -1.129542, 0, 0, 0, 1, 1,
-0.5786157, -0.1637778, -1.075397, 0, 0, 0, 1, 1,
-0.5780625, 1.402872, -2.450001, 0, 0, 0, 1, 1,
-0.5757737, 0.6156943, -0.8554454, 0, 0, 0, 1, 1,
-0.5725945, -1.875234, -4.824932, 0, 0, 0, 1, 1,
-0.5721621, -0.8452524, -0.9906107, 1, 1, 1, 1, 1,
-0.5720124, 0.05626174, -2.633324, 1, 1, 1, 1, 1,
-0.5712147, -0.8457737, -1.519773, 1, 1, 1, 1, 1,
-0.566199, -0.2094709, -3.476517, 1, 1, 1, 1, 1,
-0.5628103, 2.075624, -0.05101514, 1, 1, 1, 1, 1,
-0.557663, 0.2616164, -1.98882, 1, 1, 1, 1, 1,
-0.5546659, 3.268554, 1.233749, 1, 1, 1, 1, 1,
-0.5531186, -1.645353, -2.373201, 1, 1, 1, 1, 1,
-0.5497522, -0.2558585, -1.846717, 1, 1, 1, 1, 1,
-0.5491947, 0.136164, -2.420578, 1, 1, 1, 1, 1,
-0.5483152, 1.415336, -1.546859, 1, 1, 1, 1, 1,
-0.5409611, -1.930593, -2.514237, 1, 1, 1, 1, 1,
-0.5404635, -0.5201805, -1.519346, 1, 1, 1, 1, 1,
-0.5359622, -0.5066172, -2.044656, 1, 1, 1, 1, 1,
-0.5307794, 0.9523317, 0.373122, 1, 1, 1, 1, 1,
-0.5303968, -0.2901771, -0.8365233, 0, 0, 1, 1, 1,
-0.526003, -1.043285, -3.003234, 1, 0, 0, 1, 1,
-0.5235437, -0.8561122, -3.3013, 1, 0, 0, 1, 1,
-0.5226816, 0.5179374, 0.5379701, 1, 0, 0, 1, 1,
-0.5225621, -0.2890223, -3.675048, 1, 0, 0, 1, 1,
-0.5192802, 0.1681322, -3.378059, 1, 0, 0, 1, 1,
-0.5178732, -0.8958053, -3.004224, 0, 0, 0, 1, 1,
-0.517518, -1.535705, -1.331685, 0, 0, 0, 1, 1,
-0.5166402, 1.02867, -0.9158615, 0, 0, 0, 1, 1,
-0.5136691, -0.6587751, -2.657191, 0, 0, 0, 1, 1,
-0.5118223, 0.4582107, 0.2534556, 0, 0, 0, 1, 1,
-0.5098377, 0.9825785, -1.684891, 0, 0, 0, 1, 1,
-0.5054156, 0.1777425, 0.1830195, 0, 0, 0, 1, 1,
-0.5025843, 0.8456857, 0.7373729, 1, 1, 1, 1, 1,
-0.5011458, 1.606945, -1.946553, 1, 1, 1, 1, 1,
-0.5009264, -2.112664, -3.805552, 1, 1, 1, 1, 1,
-0.4927718, 0.358042, -0.3323637, 1, 1, 1, 1, 1,
-0.4902027, -0.3855362, -2.972786, 1, 1, 1, 1, 1,
-0.4861752, -0.776309, -3.359159, 1, 1, 1, 1, 1,
-0.4832448, -1.028337, -2.469142, 1, 1, 1, 1, 1,
-0.4816606, -0.8907617, -2.441225, 1, 1, 1, 1, 1,
-0.4788251, -0.6764038, -2.561099, 1, 1, 1, 1, 1,
-0.4782046, 0.05322333, -1.548094, 1, 1, 1, 1, 1,
-0.4768041, -0.1112847, -3.516196, 1, 1, 1, 1, 1,
-0.4766419, 1.626697, 0.8064024, 1, 1, 1, 1, 1,
-0.4744156, 1.465589, -0.3192773, 1, 1, 1, 1, 1,
-0.469102, -1.80086, -4.426216, 1, 1, 1, 1, 1,
-0.4663807, 0.253646, -1.955156, 1, 1, 1, 1, 1,
-0.4633394, -1.482442, -2.245696, 0, 0, 1, 1, 1,
-0.4605816, 0.7493551, -1.614097, 1, 0, 0, 1, 1,
-0.4554587, 0.4224577, -1.436177, 1, 0, 0, 1, 1,
-0.4536506, -0.4020308, -1.64591, 1, 0, 0, 1, 1,
-0.4516051, -0.1630822, -1.293645, 1, 0, 0, 1, 1,
-0.4513598, -0.261362, -5.959157, 1, 0, 0, 1, 1,
-0.4499491, -1.32929, -2.564113, 0, 0, 0, 1, 1,
-0.448617, -0.544461, -1.968665, 0, 0, 0, 1, 1,
-0.4482203, -0.8710635, -3.837458, 0, 0, 0, 1, 1,
-0.4468128, 0.8068416, -0.3771656, 0, 0, 0, 1, 1,
-0.4455204, -0.7165864, -2.689028, 0, 0, 0, 1, 1,
-0.4342987, -0.9747419, -1.96613, 0, 0, 0, 1, 1,
-0.4333825, -0.15111, -2.562487, 0, 0, 0, 1, 1,
-0.4308434, 0.8608244, -0.4111033, 1, 1, 1, 1, 1,
-0.4274283, 1.357356, -0.5082223, 1, 1, 1, 1, 1,
-0.4271846, -0.2748455, -0.9725419, 1, 1, 1, 1, 1,
-0.4260022, 0.4600854, -1.22763, 1, 1, 1, 1, 1,
-0.4241019, 1.873367, -0.1371965, 1, 1, 1, 1, 1,
-0.4237067, 0.5844872, 0.3107513, 1, 1, 1, 1, 1,
-0.4235232, 1.21525, -1.202028, 1, 1, 1, 1, 1,
-0.4199564, -0.9283887, -4.577868, 1, 1, 1, 1, 1,
-0.4159018, 1.938349, 0.9095901, 1, 1, 1, 1, 1,
-0.4137177, -0.1635077, -0.8396693, 1, 1, 1, 1, 1,
-0.4114626, 0.6078714, 0.1926346, 1, 1, 1, 1, 1,
-0.4100721, -0.2469769, -4.375047, 1, 1, 1, 1, 1,
-0.4098275, -2.073711, -2.593089, 1, 1, 1, 1, 1,
-0.4076515, 0.5387593, -1.484671, 1, 1, 1, 1, 1,
-0.4055291, -0.4026062, -2.905535, 1, 1, 1, 1, 1,
-0.4032348, 0.7173974, -1.351234, 0, 0, 1, 1, 1,
-0.4022052, -1.32444, -3.189, 1, 0, 0, 1, 1,
-0.3995838, -0.446895, -2.650003, 1, 0, 0, 1, 1,
-0.3994485, 0.9786777, -0.6568356, 1, 0, 0, 1, 1,
-0.3979086, 1.944938, -0.2195729, 1, 0, 0, 1, 1,
-0.397713, -0.1854545, -3.326015, 1, 0, 0, 1, 1,
-0.396288, -0.5960938, -2.868849, 0, 0, 0, 1, 1,
-0.3901214, 0.2608802, -1.1645, 0, 0, 0, 1, 1,
-0.3864144, -0.5086013, -3.503881, 0, 0, 0, 1, 1,
-0.3845097, -0.5149078, -3.181136, 0, 0, 0, 1, 1,
-0.3777411, -0.2208346, -1.394768, 0, 0, 0, 1, 1,
-0.3726607, -1.340695, -2.00498, 0, 0, 0, 1, 1,
-0.37081, -0.1614426, -2.475808, 0, 0, 0, 1, 1,
-0.3687077, 0.855954, -0.2331873, 1, 1, 1, 1, 1,
-0.3666036, -0.3062688, -1.723831, 1, 1, 1, 1, 1,
-0.3626533, 0.449834, 1.160571, 1, 1, 1, 1, 1,
-0.3621883, 0.2887405, -2.339575, 1, 1, 1, 1, 1,
-0.3608763, -2.099942, -4.123824, 1, 1, 1, 1, 1,
-0.3571342, 0.5445762, -0.6427267, 1, 1, 1, 1, 1,
-0.3537878, 1.402058, -1.097813, 1, 1, 1, 1, 1,
-0.3530741, -0.9079486, -2.494396, 1, 1, 1, 1, 1,
-0.3518724, 0.2656096, -0.3633076, 1, 1, 1, 1, 1,
-0.3518232, 0.2123433, -1.579347, 1, 1, 1, 1, 1,
-0.3464645, -0.00765785, -1.988051, 1, 1, 1, 1, 1,
-0.3435062, 0.4238602, 0.5091252, 1, 1, 1, 1, 1,
-0.3393613, -0.4632273, -1.563376, 1, 1, 1, 1, 1,
-0.3384702, 0.6536562, -1.559096, 1, 1, 1, 1, 1,
-0.3365192, 0.2038458, -3.655453, 1, 1, 1, 1, 1,
-0.3343671, -0.2852865, -2.175134, 0, 0, 1, 1, 1,
-0.3323362, -1.638861, -2.937479, 1, 0, 0, 1, 1,
-0.3290441, -0.6991802, -1.469885, 1, 0, 0, 1, 1,
-0.3268908, 1.547839, 1.266496, 1, 0, 0, 1, 1,
-0.3231019, -0.290811, -1.169432, 1, 0, 0, 1, 1,
-0.3224765, -0.7670617, -1.980506, 1, 0, 0, 1, 1,
-0.3223734, -1.025699, -3.263949, 0, 0, 0, 1, 1,
-0.309448, -1.767166, -3.062414, 0, 0, 0, 1, 1,
-0.3057643, -1.08471, -3.259213, 0, 0, 0, 1, 1,
-0.3048611, 0.3263646, -2.148598, 0, 0, 0, 1, 1,
-0.2914868, -0.6418185, -2.551439, 0, 0, 0, 1, 1,
-0.2901638, 0.7494779, 0.09518889, 0, 0, 0, 1, 1,
-0.2863731, 0.301644, -1.700985, 0, 0, 0, 1, 1,
-0.286212, 0.3470027, -0.7015556, 1, 1, 1, 1, 1,
-0.2828483, -0.5443239, -2.845931, 1, 1, 1, 1, 1,
-0.2744944, 1.216452, 0.937654, 1, 1, 1, 1, 1,
-0.2713714, -3.130064, -0.9365495, 1, 1, 1, 1, 1,
-0.2696886, -0.3063948, -2.590175, 1, 1, 1, 1, 1,
-0.2681993, 1.167203, -0.563378, 1, 1, 1, 1, 1,
-0.2661972, -1.13364, -2.74596, 1, 1, 1, 1, 1,
-0.2607802, -0.5517303, -1.902417, 1, 1, 1, 1, 1,
-0.2587432, 0.9877598, -0.5656513, 1, 1, 1, 1, 1,
-0.2582998, -1.098428, -4.520146, 1, 1, 1, 1, 1,
-0.2569228, 1.271157, 0.3233311, 1, 1, 1, 1, 1,
-0.2553958, -1.320802, -3.151301, 1, 1, 1, 1, 1,
-0.2479775, -0.3347327, -2.172489, 1, 1, 1, 1, 1,
-0.2464701, 1.812715, 1.34838, 1, 1, 1, 1, 1,
-0.2456821, 0.6643983, -1.998865, 1, 1, 1, 1, 1,
-0.2432184, 1.100353, -0.5497926, 0, 0, 1, 1, 1,
-0.2417661, -1.496205, -2.338973, 1, 0, 0, 1, 1,
-0.2392363, 1.151041, -2.913861, 1, 0, 0, 1, 1,
-0.2365314, -0.4329702, -2.301554, 1, 0, 0, 1, 1,
-0.2319692, -1.036454, -1.188077, 1, 0, 0, 1, 1,
-0.2313514, -0.84998, -3.666311, 1, 0, 0, 1, 1,
-0.2308391, -0.7354695, -4.125306, 0, 0, 0, 1, 1,
-0.2288776, -0.04295629, -2.805332, 0, 0, 0, 1, 1,
-0.2272563, -1.168995, -2.92847, 0, 0, 0, 1, 1,
-0.2257764, -1.961947, -3.132598, 0, 0, 0, 1, 1,
-0.2245402, -0.5030278, -1.751805, 0, 0, 0, 1, 1,
-0.2243842, 1.818909, -0.7435051, 0, 0, 0, 1, 1,
-0.220858, -0.5431704, -2.259087, 0, 0, 0, 1, 1,
-0.220474, -0.4406453, -2.388024, 1, 1, 1, 1, 1,
-0.2195063, 1.259598, -0.3571975, 1, 1, 1, 1, 1,
-0.2194329, 1.003347, -0.01078723, 1, 1, 1, 1, 1,
-0.2175865, -1.10359, -2.610879, 1, 1, 1, 1, 1,
-0.2168247, 0.1877474, -1.169226, 1, 1, 1, 1, 1,
-0.2045254, 0.8725909, 2.118841, 1, 1, 1, 1, 1,
-0.20366, 0.3562145, -0.08638648, 1, 1, 1, 1, 1,
-0.1983149, -0.9214725, -4.658581, 1, 1, 1, 1, 1,
-0.1901115, -1.358761, -2.081183, 1, 1, 1, 1, 1,
-0.1854814, -0.08920133, -1.404416, 1, 1, 1, 1, 1,
-0.1809513, -0.0005285221, -0.8853574, 1, 1, 1, 1, 1,
-0.176597, -0.5133747, -1.882358, 1, 1, 1, 1, 1,
-0.1760279, -0.7524684, -3.067229, 1, 1, 1, 1, 1,
-0.1745764, -0.0854663, -3.345096, 1, 1, 1, 1, 1,
-0.1735475, -0.3370822, -1.970029, 1, 1, 1, 1, 1,
-0.1665218, 0.8800898, -0.02436164, 0, 0, 1, 1, 1,
-0.1636146, -0.8675418, -1.668747, 1, 0, 0, 1, 1,
-0.159453, -0.08945469, -2.413999, 1, 0, 0, 1, 1,
-0.1580692, 0.1196762, -0.2953542, 1, 0, 0, 1, 1,
-0.1576467, -1.48725, -4.047059, 1, 0, 0, 1, 1,
-0.1572664, 0.9678416, -0.01032858, 1, 0, 0, 1, 1,
-0.1566252, -0.6480259, -5.442878, 0, 0, 0, 1, 1,
-0.149934, 0.2713988, -0.4923798, 0, 0, 0, 1, 1,
-0.1489229, -1.380287, -2.019121, 0, 0, 0, 1, 1,
-0.146033, 0.3481005, 0.03016811, 0, 0, 0, 1, 1,
-0.1432998, -0.7137901, -3.270415, 0, 0, 0, 1, 1,
-0.1396797, -0.8313944, -4.097998, 0, 0, 0, 1, 1,
-0.1367358, 0.8163638, 0.5547249, 0, 0, 0, 1, 1,
-0.1318821, 1.209823, 0.6396192, 1, 1, 1, 1, 1,
-0.1262777, 2.223202, -0.2001505, 1, 1, 1, 1, 1,
-0.1238611, 0.7153252, 0.570316, 1, 1, 1, 1, 1,
-0.1203691, -0.1707408, -0.6219608, 1, 1, 1, 1, 1,
-0.1198305, 1.087114, 1.460868, 1, 1, 1, 1, 1,
-0.1108553, -0.1923009, -2.331122, 1, 1, 1, 1, 1,
-0.1050541, -1.325393, -2.117932, 1, 1, 1, 1, 1,
-0.09889328, 1.624298, 0.4872317, 1, 1, 1, 1, 1,
-0.09688972, -0.4350258, -3.353091, 1, 1, 1, 1, 1,
-0.0956054, -2.529263, -2.260484, 1, 1, 1, 1, 1,
-0.09386422, 0.3765049, -0.8069467, 1, 1, 1, 1, 1,
-0.09305451, 1.008791, 0.927895, 1, 1, 1, 1, 1,
-0.09297136, -0.4814384, -1.764613, 1, 1, 1, 1, 1,
-0.09292652, 0.4049693, 0.278121, 1, 1, 1, 1, 1,
-0.08688341, -1.141612, -0.4613279, 1, 1, 1, 1, 1,
-0.08438235, -1.757152, -2.436247, 0, 0, 1, 1, 1,
-0.08215605, -0.3851675, -3.062344, 1, 0, 0, 1, 1,
-0.07246998, 0.5810083, -0.6277393, 1, 0, 0, 1, 1,
-0.07009046, -0.1055537, -4.147329, 1, 0, 0, 1, 1,
-0.06952696, 1.039487, 0.2108761, 1, 0, 0, 1, 1,
-0.0646622, -2.199801, -2.565651, 1, 0, 0, 1, 1,
-0.06212613, 1.416402, -0.2200519, 0, 0, 0, 1, 1,
-0.05655696, -2.63946, -2.146941, 0, 0, 0, 1, 1,
-0.05332951, 1.448948, -1.4147, 0, 0, 0, 1, 1,
-0.0510877, 0.7745864, -0.7585526, 0, 0, 0, 1, 1,
-0.05011597, 2.682845, -1.555828, 0, 0, 0, 1, 1,
-0.04505948, -1.030686, -4.91866, 0, 0, 0, 1, 1,
-0.04473393, 0.1856623, 0.3128809, 0, 0, 0, 1, 1,
-0.04332622, -0.0004924904, -1.64956, 1, 1, 1, 1, 1,
-0.04316587, -0.4488807, -4.148338, 1, 1, 1, 1, 1,
-0.04261989, -0.80613, -3.708752, 1, 1, 1, 1, 1,
-0.04193714, 1.1204, 0.4912331, 1, 1, 1, 1, 1,
-0.03661876, -0.732004, -4.690149, 1, 1, 1, 1, 1,
-0.03532597, -0.6699545, -3.243448, 1, 1, 1, 1, 1,
-0.03248597, 1.07349, 0.2532807, 1, 1, 1, 1, 1,
-0.03198387, -0.2370538, -2.024987, 1, 1, 1, 1, 1,
-0.03176628, 0.8172734, -0.9654834, 1, 1, 1, 1, 1,
-0.03073705, -1.209032, -3.414913, 1, 1, 1, 1, 1,
-0.02970169, -0.5133883, -3.429051, 1, 1, 1, 1, 1,
-0.02806832, -0.2089814, -1.868695, 1, 1, 1, 1, 1,
-0.02504007, -0.4630617, -3.510824, 1, 1, 1, 1, 1,
-0.02350907, 2.684253, -1.438839, 1, 1, 1, 1, 1,
-0.02323463, -0.8086373, -2.666698, 1, 1, 1, 1, 1,
-0.01908802, 0.5059047, 1.55973, 0, 0, 1, 1, 1,
-0.01179336, -0.1602734, -3.810928, 1, 0, 0, 1, 1,
-0.01175233, 0.719813, -0.5152023, 1, 0, 0, 1, 1,
-0.008390818, 0.5440493, -1.940685, 1, 0, 0, 1, 1,
-0.004082534, 1.525538, 1.085948, 1, 0, 0, 1, 1,
-0.001269743, -1.378961, -3.047585, 1, 0, 0, 1, 1,
0.001457098, 1.138283, -0.01965481, 0, 0, 0, 1, 1,
0.004585487, 0.3085298, -0.9793406, 0, 0, 0, 1, 1,
0.006193435, 1.221393, 0.9177538, 0, 0, 0, 1, 1,
0.007162638, -0.1215198, 3.489614, 0, 0, 0, 1, 1,
0.007647862, -0.799489, 5.763555, 0, 0, 0, 1, 1,
0.00809475, -0.3250795, 3.519931, 0, 0, 0, 1, 1,
0.008492469, 0.9135055, 0.9143523, 0, 0, 0, 1, 1,
0.0123955, 0.2080639, 1.079418, 1, 1, 1, 1, 1,
0.01557176, -0.4159986, 3.792745, 1, 1, 1, 1, 1,
0.01774505, 0.4755509, 0.7525808, 1, 1, 1, 1, 1,
0.01932486, -0.6286812, 2.305607, 1, 1, 1, 1, 1,
0.02360556, 0.3281317, 0.2338066, 1, 1, 1, 1, 1,
0.02395353, 1.125028, 2.129884, 1, 1, 1, 1, 1,
0.02396552, 0.03113907, -0.3804661, 1, 1, 1, 1, 1,
0.02833044, 1.254482, 0.371968, 1, 1, 1, 1, 1,
0.02894776, -1.355402, 2.615472, 1, 1, 1, 1, 1,
0.0314848, -0.07394298, 2.949089, 1, 1, 1, 1, 1,
0.03539385, 1.744098, 0.8588934, 1, 1, 1, 1, 1,
0.04906863, -0.4093528, 2.394433, 1, 1, 1, 1, 1,
0.05069235, 0.2833238, 0.2577294, 1, 1, 1, 1, 1,
0.05073407, 0.1152735, -0.01197823, 1, 1, 1, 1, 1,
0.05228753, -0.03957722, 2.944348, 1, 1, 1, 1, 1,
0.05607065, 0.5371343, -0.1186864, 0, 0, 1, 1, 1,
0.05702018, -1.53328, 2.952532, 1, 0, 0, 1, 1,
0.05875079, -0.7514672, 2.837316, 1, 0, 0, 1, 1,
0.06026901, 0.09180725, 0.7863596, 1, 0, 0, 1, 1,
0.06672379, 0.1134783, 0.335202, 1, 0, 0, 1, 1,
0.06780154, 0.5854187, -0.9206948, 1, 0, 0, 1, 1,
0.06845086, 0.3901888, 1.398443, 0, 0, 0, 1, 1,
0.07321737, -0.1089074, 0.8495975, 0, 0, 0, 1, 1,
0.07376397, -1.767332, 2.841873, 0, 0, 0, 1, 1,
0.08009278, -0.4483925, 4.043328, 0, 0, 0, 1, 1,
0.08821277, 2.204209, -1.653301, 0, 0, 0, 1, 1,
0.09436405, 1.075928, -0.564718, 0, 0, 0, 1, 1,
0.100484, 0.6324167, 0.6254251, 0, 0, 0, 1, 1,
0.1008145, -1.134194, 2.663085, 1, 1, 1, 1, 1,
0.1024538, 0.6855472, -0.929455, 1, 1, 1, 1, 1,
0.1041318, 0.488613, 0.3118487, 1, 1, 1, 1, 1,
0.1112127, 0.1034022, 1.263425, 1, 1, 1, 1, 1,
0.1115458, 0.05096699, 1.285521, 1, 1, 1, 1, 1,
0.1132833, 0.2669071, 0.9770432, 1, 1, 1, 1, 1,
0.1154148, -1.482117, 2.015138, 1, 1, 1, 1, 1,
0.1178332, -0.7138268, 3.28098, 1, 1, 1, 1, 1,
0.117987, -0.4345543, 2.625347, 1, 1, 1, 1, 1,
0.1183935, -0.348828, 2.869076, 1, 1, 1, 1, 1,
0.1188489, -0.1906476, 2.864048, 1, 1, 1, 1, 1,
0.125227, 0.989925, -1.79975, 1, 1, 1, 1, 1,
0.1252806, 1.483703, -1.253925, 1, 1, 1, 1, 1,
0.1259338, 1.701863, -0.2263467, 1, 1, 1, 1, 1,
0.1261436, 0.6489912, -0.9811457, 1, 1, 1, 1, 1,
0.1266959, -2.049526, 1.820514, 0, 0, 1, 1, 1,
0.1271878, 0.8806758, -1.759651, 1, 0, 0, 1, 1,
0.1286054, 0.1586386, 1.629799, 1, 0, 0, 1, 1,
0.1286933, 0.03948463, 1.645921, 1, 0, 0, 1, 1,
0.130595, -0.6056611, 3.907986, 1, 0, 0, 1, 1,
0.1326286, -0.988717, 4.345859, 1, 0, 0, 1, 1,
0.1344032, -0.9095386, 3.610925, 0, 0, 0, 1, 1,
0.1345222, -1.532286, 3.268834, 0, 0, 0, 1, 1,
0.1360047, -0.8738079, 3.20496, 0, 0, 0, 1, 1,
0.1415844, 1.05334, 0.1852164, 0, 0, 0, 1, 1,
0.143437, 0.3630677, 0.9569348, 0, 0, 0, 1, 1,
0.1450977, -0.6295184, 3.121329, 0, 0, 0, 1, 1,
0.1468719, -2.381608, 2.375186, 0, 0, 0, 1, 1,
0.1503799, -0.9236946, 2.07394, 1, 1, 1, 1, 1,
0.151328, 0.8738878, -0.3150139, 1, 1, 1, 1, 1,
0.1518451, 0.66657, 1.254278, 1, 1, 1, 1, 1,
0.1526733, 1.565218, -1.296844, 1, 1, 1, 1, 1,
0.1546476, -0.7632895, 3.274994, 1, 1, 1, 1, 1,
0.159023, -0.580409, 2.787097, 1, 1, 1, 1, 1,
0.1594932, 0.7711017, -1.365798, 1, 1, 1, 1, 1,
0.1631664, 1.097857, 0.4548469, 1, 1, 1, 1, 1,
0.1781661, 1.955112, -0.00936367, 1, 1, 1, 1, 1,
0.1790403, 0.3032677, 1.453006, 1, 1, 1, 1, 1,
0.1792934, -2.693635, 3.383029, 1, 1, 1, 1, 1,
0.1799842, 0.8851392, 0.728795, 1, 1, 1, 1, 1,
0.1818798, 1.17515, 0.6780812, 1, 1, 1, 1, 1,
0.1828166, 1.038061, 2.883649, 1, 1, 1, 1, 1,
0.1863727, -0.8164542, 4.109973, 1, 1, 1, 1, 1,
0.1871114, 0.03884597, 3.335737, 0, 0, 1, 1, 1,
0.1873112, -0.8635148, 1.366105, 1, 0, 0, 1, 1,
0.1911348, 0.5371516, -2.314168, 1, 0, 0, 1, 1,
0.1928494, -1.316287, 3.533877, 1, 0, 0, 1, 1,
0.1929872, 0.01332085, 3.528339, 1, 0, 0, 1, 1,
0.1958587, 2.51113, 2.906119, 1, 0, 0, 1, 1,
0.1959688, 1.827853, 0.05484852, 0, 0, 0, 1, 1,
0.1960538, -0.9018846, 1.659889, 0, 0, 0, 1, 1,
0.1977225, 0.253929, 1.123148, 0, 0, 0, 1, 1,
0.1984182, 1.584198, 0.1452868, 0, 0, 0, 1, 1,
0.1984348, 0.2097103, -1.971743, 0, 0, 0, 1, 1,
0.1985695, 0.9209862, -0.4195432, 0, 0, 0, 1, 1,
0.2055015, 0.5714743, 0.2346161, 0, 0, 0, 1, 1,
0.2064982, -1.009017, 2.396811, 1, 1, 1, 1, 1,
0.2154751, 0.5584691, -0.9574919, 1, 1, 1, 1, 1,
0.2183633, 0.537393, -1.703479, 1, 1, 1, 1, 1,
0.2190385, 1.094873, 1.074762, 1, 1, 1, 1, 1,
0.2197834, -0.402847, 2.434204, 1, 1, 1, 1, 1,
0.219866, 0.6511061, 0.6666995, 1, 1, 1, 1, 1,
0.2202311, -0.9097615, 1.449777, 1, 1, 1, 1, 1,
0.220684, -0.2004978, 1.93491, 1, 1, 1, 1, 1,
0.2251775, -1.089056, 3.766297, 1, 1, 1, 1, 1,
0.2337478, -1.882312, 3.31, 1, 1, 1, 1, 1,
0.2344976, 0.4172738, 0.7879658, 1, 1, 1, 1, 1,
0.239817, 0.2497172, 0.8002268, 1, 1, 1, 1, 1,
0.2438851, -0.09696567, 0.4099695, 1, 1, 1, 1, 1,
0.2469916, -1.474841, 3.995931, 1, 1, 1, 1, 1,
0.2503086, -2.394683, 3.637403, 1, 1, 1, 1, 1,
0.2546769, -0.03355556, 1.454203, 0, 0, 1, 1, 1,
0.2576552, -0.6340963, 3.206075, 1, 0, 0, 1, 1,
0.2612248, -0.7803247, 3.288839, 1, 0, 0, 1, 1,
0.2614833, 1.055582, 0.9120211, 1, 0, 0, 1, 1,
0.2656321, 1.36132, -0.5376473, 1, 0, 0, 1, 1,
0.2727672, 0.1206546, 1.176303, 1, 0, 0, 1, 1,
0.2758341, 0.1631579, 0.8505033, 0, 0, 0, 1, 1,
0.2774459, -1.017225, 3.430598, 0, 0, 0, 1, 1,
0.2835777, 0.690091, -1.595479, 0, 0, 0, 1, 1,
0.2881175, 1.492306, 0.5119886, 0, 0, 0, 1, 1,
0.2910743, -0.2286962, 1.751782, 0, 0, 0, 1, 1,
0.2921298, -1.827564, 2.86366, 0, 0, 0, 1, 1,
0.2927048, -0.6555208, 3.047419, 0, 0, 0, 1, 1,
0.3053174, 0.5216576, 0.05707803, 1, 1, 1, 1, 1,
0.3076056, -0.09607068, 2.169514, 1, 1, 1, 1, 1,
0.3083628, 1.160065, -0.03119262, 1, 1, 1, 1, 1,
0.3141947, 0.5770409, -1.015882, 1, 1, 1, 1, 1,
0.3214241, 0.5936106, 3.015501, 1, 1, 1, 1, 1,
0.3264402, -1.047076, 4.017411, 1, 1, 1, 1, 1,
0.3315053, 1.472437, -1.954402, 1, 1, 1, 1, 1,
0.3334763, 0.6654102, 0.8918145, 1, 1, 1, 1, 1,
0.3345564, -1.535917, 2.232306, 1, 1, 1, 1, 1,
0.3350574, -0.6288242, 2.961038, 1, 1, 1, 1, 1,
0.3375175, -0.7419356, 2.608973, 1, 1, 1, 1, 1,
0.3376132, -0.9025438, 3.209703, 1, 1, 1, 1, 1,
0.3428295, 0.3511819, 1.400844, 1, 1, 1, 1, 1,
0.3437241, -2.234024, 2.411351, 1, 1, 1, 1, 1,
0.3478755, 1.00666, -1.066024, 1, 1, 1, 1, 1,
0.3511049, -0.5342945, 1.199659, 0, 0, 1, 1, 1,
0.3529547, 0.9994864, -0.01005382, 1, 0, 0, 1, 1,
0.3586837, 1.18912, 0.8828776, 1, 0, 0, 1, 1,
0.3596807, 0.223445, 0.7353975, 1, 0, 0, 1, 1,
0.361935, -0.5296829, 1.94401, 1, 0, 0, 1, 1,
0.3716761, 0.1436539, 0.354854, 1, 0, 0, 1, 1,
0.3740393, -0.1248537, 2.218665, 0, 0, 0, 1, 1,
0.3812004, 0.1394641, 2.004839, 0, 0, 0, 1, 1,
0.3878828, 0.08772426, 2.712389, 0, 0, 0, 1, 1,
0.4008411, -0.2275176, 1.589224, 0, 0, 0, 1, 1,
0.4035687, -0.5031645, 0.4656943, 0, 0, 0, 1, 1,
0.4074979, -0.2617253, 1.379734, 0, 0, 0, 1, 1,
0.4081544, -0.4239222, 2.180368, 0, 0, 0, 1, 1,
0.4115824, -0.869527, 2.447267, 1, 1, 1, 1, 1,
0.4121712, -0.8889195, 2.2374, 1, 1, 1, 1, 1,
0.4161145, -0.2969456, 2.990075, 1, 1, 1, 1, 1,
0.4170007, 0.1972793, 0.3681238, 1, 1, 1, 1, 1,
0.4172531, -1.654211, 2.271329, 1, 1, 1, 1, 1,
0.4177247, 0.7444653, -1.095239, 1, 1, 1, 1, 1,
0.4230342, -0.5259722, 1.914927, 1, 1, 1, 1, 1,
0.4248821, 1.504049, 2.322219, 1, 1, 1, 1, 1,
0.4290491, -0.5324362, 3.343832, 1, 1, 1, 1, 1,
0.430082, 1.256479, 0.3943818, 1, 1, 1, 1, 1,
0.43202, 0.9330942, 0.06378665, 1, 1, 1, 1, 1,
0.4353918, 0.7604517, 1.386805, 1, 1, 1, 1, 1,
0.4370162, -1.067212, 4.279429, 1, 1, 1, 1, 1,
0.4388439, 0.1957549, 1.757722, 1, 1, 1, 1, 1,
0.4600793, -0.8646076, 2.264936, 1, 1, 1, 1, 1,
0.4625623, -0.6140954, 2.280735, 0, 0, 1, 1, 1,
0.4625743, -0.5864355, 2.813243, 1, 0, 0, 1, 1,
0.4900746, 0.8152683, 1.563994, 1, 0, 0, 1, 1,
0.4909742, -0.4165742, 3.679387, 1, 0, 0, 1, 1,
0.4978143, -0.7259325, 3.565045, 1, 0, 0, 1, 1,
0.5087031, -1.111709, 2.766764, 1, 0, 0, 1, 1,
0.5118968, 0.4204912, 0.8713939, 0, 0, 0, 1, 1,
0.5206714, -0.392444, 2.6805, 0, 0, 0, 1, 1,
0.5245853, -0.5681242, 1.249671, 0, 0, 0, 1, 1,
0.5261026, -0.47695, 3.024014, 0, 0, 0, 1, 1,
0.5280763, 1.247195, 0.2383851, 0, 0, 0, 1, 1,
0.5318334, -1.148777, 3.552801, 0, 0, 0, 1, 1,
0.5339114, 1.683725, 1.164128, 0, 0, 0, 1, 1,
0.5404978, -1.42675, 4.324307, 1, 1, 1, 1, 1,
0.5410796, -1.647913, 3.539672, 1, 1, 1, 1, 1,
0.5496468, -2.093675, 0.9649433, 1, 1, 1, 1, 1,
0.5512701, -0.2391569, 0.3618414, 1, 1, 1, 1, 1,
0.5523029, 0.9594678, 0.165055, 1, 1, 1, 1, 1,
0.5542212, -0.02547263, 1.646322, 1, 1, 1, 1, 1,
0.5548942, -1.453652, 4.146332, 1, 1, 1, 1, 1,
0.560376, 1.425686, -0.2237992, 1, 1, 1, 1, 1,
0.5620066, 1.009277, 0.3978593, 1, 1, 1, 1, 1,
0.5682067, -0.5013062, 2.842535, 1, 1, 1, 1, 1,
0.572952, -1.466053, 1.856542, 1, 1, 1, 1, 1,
0.5777268, 0.2303285, 0.6881413, 1, 1, 1, 1, 1,
0.5835594, 1.583194, -1.401819, 1, 1, 1, 1, 1,
0.5850449, -0.1175923, -0.4857609, 1, 1, 1, 1, 1,
0.5875462, 0.5329797, 1.415548, 1, 1, 1, 1, 1,
0.5900933, 1.079731, 0.9236523, 0, 0, 1, 1, 1,
0.5910458, 0.1383945, 0.9390155, 1, 0, 0, 1, 1,
0.6010631, -0.9532225, 3.417036, 1, 0, 0, 1, 1,
0.6024065, 1.049595, -2.393423, 1, 0, 0, 1, 1,
0.6073946, 0.0002424223, 3.227726, 1, 0, 0, 1, 1,
0.6077268, -1.318544, 3.980299, 1, 0, 0, 1, 1,
0.6088797, 0.2686225, 1.563909, 0, 0, 0, 1, 1,
0.6120872, -0.3111432, 2.037724, 0, 0, 0, 1, 1,
0.6127993, -0.4324953, 1.948472, 0, 0, 0, 1, 1,
0.615958, -2.442453, 2.582284, 0, 0, 0, 1, 1,
0.6162251, -0.5912647, 1.14311, 0, 0, 0, 1, 1,
0.6167114, -0.2798122, 2.108727, 0, 0, 0, 1, 1,
0.6218046, 0.6296252, 0.8405066, 0, 0, 0, 1, 1,
0.6227844, -0.21439, 1.31491, 1, 1, 1, 1, 1,
0.6331049, 0.8251485, 0.3800888, 1, 1, 1, 1, 1,
0.635623, 0.2950352, 1.115614, 1, 1, 1, 1, 1,
0.6423941, 0.4388997, 2.601785, 1, 1, 1, 1, 1,
0.6488863, -0.6468397, 0.3986572, 1, 1, 1, 1, 1,
0.6528143, -0.6290152, 2.651567, 1, 1, 1, 1, 1,
0.6541583, 0.9998234, -0.1739956, 1, 1, 1, 1, 1,
0.6556424, -0.369241, 0.8378892, 1, 1, 1, 1, 1,
0.6648024, 1.443779, -0.02068447, 1, 1, 1, 1, 1,
0.6690622, 0.460472, 0.5320386, 1, 1, 1, 1, 1,
0.6690704, 1.008505, -0.3777767, 1, 1, 1, 1, 1,
0.6740416, 1.519566, -1.488296, 1, 1, 1, 1, 1,
0.6756948, 0.6933286, 1.908367, 1, 1, 1, 1, 1,
0.6763792, 0.4510973, 0.6721912, 1, 1, 1, 1, 1,
0.6766582, 1.557014, 0.2036596, 1, 1, 1, 1, 1,
0.6768528, 0.4369101, 1.067265, 0, 0, 1, 1, 1,
0.6776799, -1.048643, 3.048479, 1, 0, 0, 1, 1,
0.6779859, 0.493713, 0.677657, 1, 0, 0, 1, 1,
0.678115, 1.119812, 0.7431102, 1, 0, 0, 1, 1,
0.6787624, 0.1765931, 0.4823825, 1, 0, 0, 1, 1,
0.679501, 1.102597, -0.1704843, 1, 0, 0, 1, 1,
0.6806189, -2.315465, 2.243485, 0, 0, 0, 1, 1,
0.6849005, 0.8671371, 2.227355, 0, 0, 0, 1, 1,
0.6866505, -0.05535408, 2.809652, 0, 0, 0, 1, 1,
0.6887798, 1.465853, 0.6628649, 0, 0, 0, 1, 1,
0.69167, 1.115753, -0.3851858, 0, 0, 0, 1, 1,
0.6921632, -1.140821, 3.261617, 0, 0, 0, 1, 1,
0.6939766, 1.555078, -0.7787524, 0, 0, 0, 1, 1,
0.6995512, 0.02318225, 2.627808, 1, 1, 1, 1, 1,
0.7019866, -0.5566441, 0.6731881, 1, 1, 1, 1, 1,
0.7032324, -0.08014379, 1.423725, 1, 1, 1, 1, 1,
0.704416, -3.490797, 4.720723, 1, 1, 1, 1, 1,
0.7055189, 0.7272525, -0.5260818, 1, 1, 1, 1, 1,
0.7058151, -1.809851, 2.982589, 1, 1, 1, 1, 1,
0.7089602, 0.3610266, 1.892218, 1, 1, 1, 1, 1,
0.7174673, 1.625869, 0.3297238, 1, 1, 1, 1, 1,
0.7202841, 0.2545702, 2.629699, 1, 1, 1, 1, 1,
0.7262288, -0.4017456, 2.617407, 1, 1, 1, 1, 1,
0.7343607, 0.7890995, 2.786887, 1, 1, 1, 1, 1,
0.7419556, 0.1899246, 1.311392, 1, 1, 1, 1, 1,
0.7447624, 0.1353931, 0.3394392, 1, 1, 1, 1, 1,
0.744884, -1.366214, 2.157698, 1, 1, 1, 1, 1,
0.7449712, -0.03647472, 0.8039593, 1, 1, 1, 1, 1,
0.7469625, 1.424193, 0.7639667, 0, 0, 1, 1, 1,
0.7489094, 1.70143, 0.5863838, 1, 0, 0, 1, 1,
0.7510485, 1.535329, -2.09993, 1, 0, 0, 1, 1,
0.7520786, -1.705586, 3.941712, 1, 0, 0, 1, 1,
0.7531143, -1.752965, 0.5488083, 1, 0, 0, 1, 1,
0.7535041, -1.315783, 2.471974, 1, 0, 0, 1, 1,
0.7559407, -0.830381, 2.613043, 0, 0, 0, 1, 1,
0.7565097, -0.8386833, 1.791907, 0, 0, 0, 1, 1,
0.7585248, 1.192973, 2.336933, 0, 0, 0, 1, 1,
0.7640613, 0.6622452, 1.071538, 0, 0, 0, 1, 1,
0.7651661, 1.736255, 2.148419, 0, 0, 0, 1, 1,
0.7679332, -0.1193717, 3.331285, 0, 0, 0, 1, 1,
0.7700048, 0.5930395, 0.1196888, 0, 0, 0, 1, 1,
0.7768164, 0.2298551, 1.811444, 1, 1, 1, 1, 1,
0.7802899, 0.4779223, 0.1605506, 1, 1, 1, 1, 1,
0.7816785, 2.819501, 1.455512, 1, 1, 1, 1, 1,
0.7891332, -1.090808, 0.8916846, 1, 1, 1, 1, 1,
0.7922819, -0.8651463, 2.999392, 1, 1, 1, 1, 1,
0.8019541, -0.2540792, 1.985736, 1, 1, 1, 1, 1,
0.8021598, 0.4708324, 1.634364, 1, 1, 1, 1, 1,
0.803867, -0.2162395, 3.200111, 1, 1, 1, 1, 1,
0.8056229, 0.1091222, 2.71235, 1, 1, 1, 1, 1,
0.8074083, 0.0008906903, 2.395602, 1, 1, 1, 1, 1,
0.8268631, -0.2910717, 2.357809, 1, 1, 1, 1, 1,
0.82693, 2.42152, 1.864448, 1, 1, 1, 1, 1,
0.8313119, -0.7349096, 2.656083, 1, 1, 1, 1, 1,
0.8334405, 0.3011134, 0.4831752, 1, 1, 1, 1, 1,
0.8362628, -0.8970246, 3.602011, 1, 1, 1, 1, 1,
0.8415055, -0.9644054, 4.495584, 0, 0, 1, 1, 1,
0.8455328, 0.05592059, 1.774674, 1, 0, 0, 1, 1,
0.8471249, -0.7843214, 1.720452, 1, 0, 0, 1, 1,
0.8489226, 0.9037122, 1.72308, 1, 0, 0, 1, 1,
0.8513356, 2.579894, 1.129982, 1, 0, 0, 1, 1,
0.8531249, -1.461682, 3.213389, 1, 0, 0, 1, 1,
0.8545178, 1.911655, -0.5792645, 0, 0, 0, 1, 1,
0.8553727, -1.679514, 2.412066, 0, 0, 0, 1, 1,
0.858492, 0.1332478, 3.150493, 0, 0, 0, 1, 1,
0.8612806, 0.7239497, 1.681633, 0, 0, 0, 1, 1,
0.864193, 0.7418593, 1.476593, 0, 0, 0, 1, 1,
0.8791971, -0.6153988, 2.624654, 0, 0, 0, 1, 1,
0.8842225, -0.336549, 1.632741, 0, 0, 0, 1, 1,
0.8880073, 1.101566, 3.522917, 1, 1, 1, 1, 1,
0.8920066, 1.512093, 0.7329685, 1, 1, 1, 1, 1,
0.8936909, -0.4328499, 2.156384, 1, 1, 1, 1, 1,
0.9087461, -1.043943, 4.60421, 1, 1, 1, 1, 1,
0.9088683, 1.935588, -0.2717527, 1, 1, 1, 1, 1,
0.9136215, -0.7657152, 3.936978, 1, 1, 1, 1, 1,
0.9175731, -1.478788, 2.451773, 1, 1, 1, 1, 1,
0.9181939, -0.2463638, 2.135755, 1, 1, 1, 1, 1,
0.919345, 0.984108, 0.1199064, 1, 1, 1, 1, 1,
0.923869, -0.9260822, 2.030295, 1, 1, 1, 1, 1,
0.9295929, 0.07001581, 2.258831, 1, 1, 1, 1, 1,
0.9311993, -0.3759985, 1.542976, 1, 1, 1, 1, 1,
0.9395266, -0.8095989, 2.93936, 1, 1, 1, 1, 1,
0.9434137, 0.7384047, 2.400893, 1, 1, 1, 1, 1,
0.9438277, 1.095056, -0.7201627, 1, 1, 1, 1, 1,
0.9493111, 0.2253906, 1.633539, 0, 0, 1, 1, 1,
0.9548449, 0.2414316, 2.269998, 1, 0, 0, 1, 1,
0.9583426, -0.4632578, 2.756288, 1, 0, 0, 1, 1,
0.9621021, 0.2171867, 2.714424, 1, 0, 0, 1, 1,
0.9643989, 0.6127319, 0.9863783, 1, 0, 0, 1, 1,
0.9687425, -0.4465114, 2.065894, 1, 0, 0, 1, 1,
0.9763696, -0.89276, 2.534991, 0, 0, 0, 1, 1,
0.9793144, 1.475566, 2.750802, 0, 0, 0, 1, 1,
0.9803402, -0.3943748, -0.02718495, 0, 0, 0, 1, 1,
0.9806243, 2.084842, 1.565752, 0, 0, 0, 1, 1,
0.9852771, 0.1312097, 2.297966, 0, 0, 0, 1, 1,
0.987149, 0.8611875, 0.5645275, 0, 0, 0, 1, 1,
0.9974183, 1.562396, -0.1204004, 0, 0, 0, 1, 1,
0.9985313, 0.42829, -0.6542293, 1, 1, 1, 1, 1,
1.016577, 0.5724755, -1.210086, 1, 1, 1, 1, 1,
1.021039, -0.1719104, 2.068748, 1, 1, 1, 1, 1,
1.021634, 0.665149, 1.163748, 1, 1, 1, 1, 1,
1.031028, 0.9089889, -0.9873377, 1, 1, 1, 1, 1,
1.033292, 0.4611497, 0.1152661, 1, 1, 1, 1, 1,
1.035691, -1.509406, 1.641927, 1, 1, 1, 1, 1,
1.041363, -0.6095951, 2.922132, 1, 1, 1, 1, 1,
1.043763, 0.6161952, 0.7563902, 1, 1, 1, 1, 1,
1.045642, 2.424133, 0.251136, 1, 1, 1, 1, 1,
1.046622, 2.896941, 1.253201, 1, 1, 1, 1, 1,
1.047802, -0.4807473, 1.881756, 1, 1, 1, 1, 1,
1.050942, -0.1830788, 2.20041, 1, 1, 1, 1, 1,
1.063488, 0.9268892, 1.162104, 1, 1, 1, 1, 1,
1.063639, -0.9971111, 2.456187, 1, 1, 1, 1, 1,
1.070467, -0.1464398, 1.873823, 0, 0, 1, 1, 1,
1.070469, -0.7728781, 4.118505, 1, 0, 0, 1, 1,
1.071677, 0.08089031, 1.76531, 1, 0, 0, 1, 1,
1.07172, 0.04701985, 2.00035, 1, 0, 0, 1, 1,
1.075356, -0.4337994, 3.855135, 1, 0, 0, 1, 1,
1.075645, 1.802455, -0.2841813, 1, 0, 0, 1, 1,
1.08704, -0.3518882, 1.619579, 0, 0, 0, 1, 1,
1.087223, 0.02345438, 2.061603, 0, 0, 0, 1, 1,
1.103097, 0.1635744, 3.022126, 0, 0, 0, 1, 1,
1.104092, 0.01523701, 2.745437, 0, 0, 0, 1, 1,
1.104965, -0.01403108, 1.272108, 0, 0, 0, 1, 1,
1.106908, -1.08697, 1.141062, 0, 0, 0, 1, 1,
1.108599, 0.477522, 1.702734, 0, 0, 0, 1, 1,
1.1215, 1.400885, -1.728322, 1, 1, 1, 1, 1,
1.122239, 1.114404, 1.258914, 1, 1, 1, 1, 1,
1.125834, -1.927908, 2.76985, 1, 1, 1, 1, 1,
1.128617, 2.282577, 0.6228731, 1, 1, 1, 1, 1,
1.131121, -0.07880998, 1.848676, 1, 1, 1, 1, 1,
1.141347, 0.114768, 1.804423, 1, 1, 1, 1, 1,
1.156623, 0.2150604, -0.04078982, 1, 1, 1, 1, 1,
1.170352, -0.3174954, 3.156142, 1, 1, 1, 1, 1,
1.175997, -0.7522765, 0.492794, 1, 1, 1, 1, 1,
1.180467, -0.245305, -0.6675466, 1, 1, 1, 1, 1,
1.181093, -1.003735, 3.975131, 1, 1, 1, 1, 1,
1.181868, -0.4503465, 1.027897, 1, 1, 1, 1, 1,
1.181954, 2.198986, -0.3030525, 1, 1, 1, 1, 1,
1.18846, 0.6304761, 3.014006, 1, 1, 1, 1, 1,
1.191156, -0.4141177, 2.309864, 1, 1, 1, 1, 1,
1.194657, 0.4605373, 2.68964, 0, 0, 1, 1, 1,
1.195536, 1.040741, 0.7396957, 1, 0, 0, 1, 1,
1.19994, 0.5425513, 1.399958, 1, 0, 0, 1, 1,
1.210871, 0.6372749, 0.7138812, 1, 0, 0, 1, 1,
1.212526, -0.6149558, 1.893495, 1, 0, 0, 1, 1,
1.213324, 0.6788735, 1.625947, 1, 0, 0, 1, 1,
1.213384, -0.463042, 1.640738, 0, 0, 0, 1, 1,
1.214103, -0.44801, 3.146083, 0, 0, 0, 1, 1,
1.217523, -0.5528374, 3.147306, 0, 0, 0, 1, 1,
1.220701, -1.764791, 0.9644393, 0, 0, 0, 1, 1,
1.228208, 0.5830645, -1.016807, 0, 0, 0, 1, 1,
1.234406, 0.7736171, 1.028343, 0, 0, 0, 1, 1,
1.234579, 1.05134, 0.4957752, 0, 0, 0, 1, 1,
1.243357, -0.1887829, 2.361162, 1, 1, 1, 1, 1,
1.251534, 0.1322806, 2.298556, 1, 1, 1, 1, 1,
1.253255, -1.189527, 3.439641, 1, 1, 1, 1, 1,
1.260847, -0.06115882, 3.187976, 1, 1, 1, 1, 1,
1.282668, 0.8760269, 1.561701, 1, 1, 1, 1, 1,
1.291781, -0.7112553, 2.962726, 1, 1, 1, 1, 1,
1.293134, -0.2400662, 1.368147, 1, 1, 1, 1, 1,
1.293428, -0.005903208, 1.914009, 1, 1, 1, 1, 1,
1.296017, 1.393298, 1.38846, 1, 1, 1, 1, 1,
1.297607, -1.387159, 3.171683, 1, 1, 1, 1, 1,
1.300254, 0.3781195, 2.222535, 1, 1, 1, 1, 1,
1.300278, -0.8397292, 3.206594, 1, 1, 1, 1, 1,
1.300819, -1.53982, 1.875529, 1, 1, 1, 1, 1,
1.301705, -0.4483167, 2.80464, 1, 1, 1, 1, 1,
1.304348, -1.029509, 4.12367, 1, 1, 1, 1, 1,
1.305181, -0.09844042, 1.971698, 0, 0, 1, 1, 1,
1.316623, -0.2932019, 3.094212, 1, 0, 0, 1, 1,
1.323623, 1.29372, 0.4558433, 1, 0, 0, 1, 1,
1.326228, -0.9741247, 3.929489, 1, 0, 0, 1, 1,
1.327011, -0.589344, 2.06279, 1, 0, 0, 1, 1,
1.327494, 0.4093591, 1.970162, 1, 0, 0, 1, 1,
1.351817, 1.240168, 1.352066, 0, 0, 0, 1, 1,
1.36483, 0.4746836, 0.9237891, 0, 0, 0, 1, 1,
1.367708, -1.11206, 3.464728, 0, 0, 0, 1, 1,
1.369851, -1.27152, 1.410253, 0, 0, 0, 1, 1,
1.371286, 0.2639342, -0.875181, 0, 0, 0, 1, 1,
1.382155, 0.353452, 2.460866, 0, 0, 0, 1, 1,
1.394963, -0.1546256, 2.334866, 0, 0, 0, 1, 1,
1.403851, 0.2681575, 0.2983762, 1, 1, 1, 1, 1,
1.418978, 2.468821, 1.295386, 1, 1, 1, 1, 1,
1.424634, 0.8758487, -0.6326316, 1, 1, 1, 1, 1,
1.42657, -1.324961, 2.608737, 1, 1, 1, 1, 1,
1.43725, -0.8052556, 2.692624, 1, 1, 1, 1, 1,
1.441499, 0.3924927, 0.3752882, 1, 1, 1, 1, 1,
1.457345, -0.02725476, 2.141019, 1, 1, 1, 1, 1,
1.457726, -2.297475, 1.597379, 1, 1, 1, 1, 1,
1.458977, -1.717011, 3.061664, 1, 1, 1, 1, 1,
1.459485, -0.2720384, 3.39079, 1, 1, 1, 1, 1,
1.467975, 0.3239662, 2.304132, 1, 1, 1, 1, 1,
1.475384, -0.07925916, 2.626752, 1, 1, 1, 1, 1,
1.480928, 1.293051, 0.6146432, 1, 1, 1, 1, 1,
1.493172, -0.333497, 1.66543, 1, 1, 1, 1, 1,
1.510957, -0.3902193, 1.246031, 1, 1, 1, 1, 1,
1.519362, 0.1568606, 1.359771, 0, 0, 1, 1, 1,
1.521762, 0.3853228, 0.16706, 1, 0, 0, 1, 1,
1.521799, 0.1098267, 1.226756, 1, 0, 0, 1, 1,
1.525669, -0.0167974, 1.344319, 1, 0, 0, 1, 1,
1.542104, -0.3157471, 0.9925984, 1, 0, 0, 1, 1,
1.546411, 1.315804, 0.4488931, 1, 0, 0, 1, 1,
1.546665, -1.63227, 1.903594, 0, 0, 0, 1, 1,
1.581413, 0.07463824, -0.5229749, 0, 0, 0, 1, 1,
1.583406, -0.3463022, 0.7774468, 0, 0, 0, 1, 1,
1.587386, -1.211427, 3.943832, 0, 0, 0, 1, 1,
1.597298, -2.790949, 1.381038, 0, 0, 0, 1, 1,
1.609974, 0.5584404, 1.260819, 0, 0, 0, 1, 1,
1.619588, 0.4852956, 0.1882754, 0, 0, 0, 1, 1,
1.628113, -0.4858897, 1.919819, 1, 1, 1, 1, 1,
1.64031, 0.02975413, 1.752479, 1, 1, 1, 1, 1,
1.641598, 0.2206405, 1.620869, 1, 1, 1, 1, 1,
1.651472, -0.7901552, 3.595554, 1, 1, 1, 1, 1,
1.656899, 0.3322907, 0.4531926, 1, 1, 1, 1, 1,
1.657328, 0.5227536, 0.6952364, 1, 1, 1, 1, 1,
1.657693, 2.285697, 1.529813, 1, 1, 1, 1, 1,
1.70239, -0.09913269, 2.698938, 1, 1, 1, 1, 1,
1.709101, -0.9220948, 0.6864373, 1, 1, 1, 1, 1,
1.719581, -0.2412927, 2.37794, 1, 1, 1, 1, 1,
1.735659, -0.4034436, 1.460142, 1, 1, 1, 1, 1,
1.736752, 0.5901394, 0.7181755, 1, 1, 1, 1, 1,
1.759138, -0.1599672, 1.785077, 1, 1, 1, 1, 1,
1.765132, -0.3770786, 2.244568, 1, 1, 1, 1, 1,
1.768349, -0.5057953, 0.9826061, 1, 1, 1, 1, 1,
1.773634, 1.820946, 1.122664, 0, 0, 1, 1, 1,
1.781212, 0.8174506, 0.9963543, 1, 0, 0, 1, 1,
1.783818, -0.6855917, 0.7070206, 1, 0, 0, 1, 1,
1.801225, -1.125066, 1.166942, 1, 0, 0, 1, 1,
1.810835, -1.188596, 3.361728, 1, 0, 0, 1, 1,
1.82454, -1.06906, 1.937639, 1, 0, 0, 1, 1,
1.832909, 0.2952482, 0.5138076, 0, 0, 0, 1, 1,
1.868716, 0.4067, 1.264219, 0, 0, 0, 1, 1,
1.876618, -0.2219602, 1.201401, 0, 0, 0, 1, 1,
1.890466, -0.2842429, 0.006837338, 0, 0, 0, 1, 1,
1.903792, -0.6725454, 3.547043, 0, 0, 0, 1, 1,
1.90503, 1.201075, 0.5272228, 0, 0, 0, 1, 1,
1.905553, 0.8141137, -0.9172111, 0, 0, 0, 1, 1,
1.921464, 1.379568, 0.294467, 1, 1, 1, 1, 1,
1.92205, 0.4623181, 1.18144, 1, 1, 1, 1, 1,
1.924132, 0.4822393, 2.220603, 1, 1, 1, 1, 1,
1.937915, -1.196175, 0.4859094, 1, 1, 1, 1, 1,
1.971143, 1.18577, 0.8460195, 1, 1, 1, 1, 1,
1.980141, 0.4408502, 1.920377, 1, 1, 1, 1, 1,
1.980932, -0.2931139, 1.214147, 1, 1, 1, 1, 1,
1.993791, 0.6563108, 3.005797, 1, 1, 1, 1, 1,
2.00706, -1.723529, 0.550171, 1, 1, 1, 1, 1,
2.014752, 0.879829, -0.4323446, 1, 1, 1, 1, 1,
2.017969, -1.00838, 2.497456, 1, 1, 1, 1, 1,
2.031119, -1.784534, -0.2653467, 1, 1, 1, 1, 1,
2.046756, -0.9841222, 3.633084, 1, 1, 1, 1, 1,
2.093005, 0.8735872, -0.09540349, 1, 1, 1, 1, 1,
2.096228, -1.784625, 2.529146, 1, 1, 1, 1, 1,
2.118413, 0.480402, 3.289861, 0, 0, 1, 1, 1,
2.135633, 0.7299879, 0.7949023, 1, 0, 0, 1, 1,
2.213683, 1.137709, 1.045154, 1, 0, 0, 1, 1,
2.226458, 2.625326, 0.8247939, 1, 0, 0, 1, 1,
2.265517, 0.4392908, 1.663029, 1, 0, 0, 1, 1,
2.272314, 1.464375, -0.4565979, 1, 0, 0, 1, 1,
2.308799, -1.062955, 0.7818367, 0, 0, 0, 1, 1,
2.329346, -0.7470829, 1.604453, 0, 0, 0, 1, 1,
2.344021, -0.6449097, 1.50617, 0, 0, 0, 1, 1,
2.421529, -0.7996147, 2.807548, 0, 0, 0, 1, 1,
2.432511, -0.7790053, -0.2243599, 0, 0, 0, 1, 1,
2.461336, 0.2940227, 0.2980489, 0, 0, 0, 1, 1,
2.48401, -0.07099465, 2.520579, 0, 0, 0, 1, 1,
2.659632, 0.133873, 1.257164, 1, 1, 1, 1, 1,
2.66352, -0.4079702, 2.10325, 1, 1, 1, 1, 1,
2.69756, -0.9396331, 0.6985941, 1, 1, 1, 1, 1,
2.741797, -0.08783154, 2.246967, 1, 1, 1, 1, 1,
2.829966, 0.5647237, 0.555249, 1, 1, 1, 1, 1,
2.860768, -1.26914, 1.828178, 1, 1, 1, 1, 1,
2.914663, -0.2395356, 1.71814, 1, 1, 1, 1, 1
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
var radius = 10.0525;
var distance = 35.30897;
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
mvMatrix.translate( 0.2392365, 0.1111212, 0.09780121 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.30897);
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
