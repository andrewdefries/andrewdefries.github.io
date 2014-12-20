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
-2.990872, 0.292649, -2.114242, 1, 0, 0, 1,
-2.791015, 0.03616697, -1.922502, 1, 0.007843138, 0, 1,
-2.699235, -0.6270802, -2.357111, 1, 0.01176471, 0, 1,
-2.649749, -0.03253788, -0.5907879, 1, 0.01960784, 0, 1,
-2.595432, 0.4316288, -0.6686954, 1, 0.02352941, 0, 1,
-2.594454, -2.759959, -2.727218, 1, 0.03137255, 0, 1,
-2.593046, 0.3786421, -0.284274, 1, 0.03529412, 0, 1,
-2.509407, -1.45166, -0.7151809, 1, 0.04313726, 0, 1,
-2.396384, -1.689257, -1.652086, 1, 0.04705882, 0, 1,
-2.282301, 2.329924, -1.660339, 1, 0.05490196, 0, 1,
-2.268904, 2.554505, -1.578926, 1, 0.05882353, 0, 1,
-2.205864, 1.013982, -1.545803, 1, 0.06666667, 0, 1,
-2.121164, -0.03378445, -2.381109, 1, 0.07058824, 0, 1,
-2.107989, -0.5828388, -2.333288, 1, 0.07843138, 0, 1,
-2.071105, -0.2017442, -0.9692284, 1, 0.08235294, 0, 1,
-2.070074, -0.8822908, -1.958951, 1, 0.09019608, 0, 1,
-2.043521, -1.007945, -2.696865, 1, 0.09411765, 0, 1,
-2.038111, 0.1385448, -1.369263, 1, 0.1019608, 0, 1,
-2.008795, 0.2465436, -1.137585, 1, 0.1098039, 0, 1,
-2.002585, 0.737222, -0.3367032, 1, 0.1137255, 0, 1,
-1.963107, 2.148303, -1.039721, 1, 0.1215686, 0, 1,
-1.927648, -0.9701371, -3.769984, 1, 0.1254902, 0, 1,
-1.893893, -1.627264, -3.018255, 1, 0.1333333, 0, 1,
-1.870163, 0.1564992, -1.294041, 1, 0.1372549, 0, 1,
-1.853546, 0.3102603, -1.909046, 1, 0.145098, 0, 1,
-1.838961, 0.1342144, -2.656567, 1, 0.1490196, 0, 1,
-1.829806, 0.08100825, -1.960671, 1, 0.1568628, 0, 1,
-1.774692, -0.3905902, -1.877735, 1, 0.1607843, 0, 1,
-1.759465, -1.321979, -2.007863, 1, 0.1686275, 0, 1,
-1.745367, 2.260689, -0.3116885, 1, 0.172549, 0, 1,
-1.70048, -1.426606, -1.23885, 1, 0.1803922, 0, 1,
-1.689465, -0.238691, 0.5402536, 1, 0.1843137, 0, 1,
-1.68873, -1.339503, -2.334414, 1, 0.1921569, 0, 1,
-1.674933, 0.438135, -1.644863, 1, 0.1960784, 0, 1,
-1.656639, 0.5987827, -1.649514, 1, 0.2039216, 0, 1,
-1.640618, 0.5259156, 0.3651889, 1, 0.2117647, 0, 1,
-1.633652, 1.635082, -0.2798952, 1, 0.2156863, 0, 1,
-1.619816, 1.151873, -0.5508792, 1, 0.2235294, 0, 1,
-1.618483, -1.823295, -2.72232, 1, 0.227451, 0, 1,
-1.595974, 1.419372, -0.6477745, 1, 0.2352941, 0, 1,
-1.59286, -2.249005, -1.533765, 1, 0.2392157, 0, 1,
-1.579872, 0.3923763, -0.6455419, 1, 0.2470588, 0, 1,
-1.56563, -1.749888, -1.592834, 1, 0.2509804, 0, 1,
-1.56452, 0.616126, -1.339536, 1, 0.2588235, 0, 1,
-1.560388, 0.0323896, -1.658879, 1, 0.2627451, 0, 1,
-1.555884, -0.6421448, -0.9320559, 1, 0.2705882, 0, 1,
-1.541811, -2.916701, -4.075918, 1, 0.2745098, 0, 1,
-1.533615, -2.017023, -3.906824, 1, 0.282353, 0, 1,
-1.519503, -0.914362, -2.517186, 1, 0.2862745, 0, 1,
-1.504518, 0.01459771, -0.7425624, 1, 0.2941177, 0, 1,
-1.503909, -0.1606607, -2.039645, 1, 0.3019608, 0, 1,
-1.501421, -1.536477, -3.000962, 1, 0.3058824, 0, 1,
-1.500087, 0.987229, -0.3899832, 1, 0.3137255, 0, 1,
-1.481437, 0.4769477, -1.963441, 1, 0.3176471, 0, 1,
-1.477002, 0.1013602, -1.942503, 1, 0.3254902, 0, 1,
-1.464848, 1.356268, -2.306777, 1, 0.3294118, 0, 1,
-1.457337, -1.240439, -2.003748, 1, 0.3372549, 0, 1,
-1.448543, 1.079133, -0.4930725, 1, 0.3411765, 0, 1,
-1.439952, 0.5172703, -1.558023, 1, 0.3490196, 0, 1,
-1.434055, 0.659005, -0.3143201, 1, 0.3529412, 0, 1,
-1.431988, 0.3717058, -2.487507, 1, 0.3607843, 0, 1,
-1.423355, 0.2895865, -1.632543, 1, 0.3647059, 0, 1,
-1.420143, -1.222364, -2.675838, 1, 0.372549, 0, 1,
-1.4105, 0.8951203, 0.4972362, 1, 0.3764706, 0, 1,
-1.403753, 1.014663, -0.7405379, 1, 0.3843137, 0, 1,
-1.384897, -1.451481, -1.92001, 1, 0.3882353, 0, 1,
-1.383728, -0.6315992, -2.442601, 1, 0.3960784, 0, 1,
-1.373291, 0.4235071, -0.7003478, 1, 0.4039216, 0, 1,
-1.371443, 0.09610721, -2.767163, 1, 0.4078431, 0, 1,
-1.369725, 0.3111813, -0.3324591, 1, 0.4156863, 0, 1,
-1.36823, 0.843937, -2.533087, 1, 0.4196078, 0, 1,
-1.357185, -0.7563962, -2.362663, 1, 0.427451, 0, 1,
-1.34874, 0.9475388, -0.7971865, 1, 0.4313726, 0, 1,
-1.326678, -1.966765, -2.866979, 1, 0.4392157, 0, 1,
-1.315111, -0.3756492, -2.07594, 1, 0.4431373, 0, 1,
-1.313708, -1.948879, -1.65222, 1, 0.4509804, 0, 1,
-1.300301, -0.6244647, -3.286878, 1, 0.454902, 0, 1,
-1.298917, 1.659907, -0.2798674, 1, 0.4627451, 0, 1,
-1.29513, 1.597805, -1.691865, 1, 0.4666667, 0, 1,
-1.28192, 0.1642722, -3.050061, 1, 0.4745098, 0, 1,
-1.278814, -0.2123843, -1.84056, 1, 0.4784314, 0, 1,
-1.276225, 0.1603199, -3.056157, 1, 0.4862745, 0, 1,
-1.272611, 0.30935, -1.850091, 1, 0.4901961, 0, 1,
-1.271687, 0.774962, 0.2053118, 1, 0.4980392, 0, 1,
-1.268263, -0.1051614, -2.405927, 1, 0.5058824, 0, 1,
-1.261421, -1.813406, -2.322773, 1, 0.509804, 0, 1,
-1.256611, -1.039215, -1.491767, 1, 0.5176471, 0, 1,
-1.254811, 0.4932977, -1.638996, 1, 0.5215687, 0, 1,
-1.221587, -0.7756912, -2.901826, 1, 0.5294118, 0, 1,
-1.216336, 0.7630377, -1.034023, 1, 0.5333334, 0, 1,
-1.213264, 0.588702, -2.66385, 1, 0.5411765, 0, 1,
-1.199249, -1.003205, -1.699728, 1, 0.5450981, 0, 1,
-1.183745, 0.1657849, -1.921775, 1, 0.5529412, 0, 1,
-1.182249, 0.3352925, -0.9422283, 1, 0.5568628, 0, 1,
-1.173101, -0.5538518, -0.280652, 1, 0.5647059, 0, 1,
-1.168907, 0.8248662, -2.152193, 1, 0.5686275, 0, 1,
-1.168637, 2.132839, -0.2041227, 1, 0.5764706, 0, 1,
-1.166328, 0.4942961, -0.2946064, 1, 0.5803922, 0, 1,
-1.162856, -0.6576365, -2.179362, 1, 0.5882353, 0, 1,
-1.160927, 2.270953, -0.7369381, 1, 0.5921569, 0, 1,
-1.154166, 0.5461776, -0.1921072, 1, 0.6, 0, 1,
-1.147619, 0.5974405, 0.07150465, 1, 0.6078432, 0, 1,
-1.139341, -1.056076, -3.803469, 1, 0.6117647, 0, 1,
-1.135514, -0.1394874, 0.1236345, 1, 0.6196079, 0, 1,
-1.134055, -0.1546451, -2.717286, 1, 0.6235294, 0, 1,
-1.131588, -0.2229375, -1.832686, 1, 0.6313726, 0, 1,
-1.130356, -0.3461036, -0.2267537, 1, 0.6352941, 0, 1,
-1.129778, -0.9199836, -2.943149, 1, 0.6431373, 0, 1,
-1.121311, -1.506075, -4.47958, 1, 0.6470588, 0, 1,
-1.117615, 2.008782, -1.383049, 1, 0.654902, 0, 1,
-1.110314, -0.6882187, -1.471581, 1, 0.6588235, 0, 1,
-1.108975, -1.347743, -3.63397, 1, 0.6666667, 0, 1,
-1.108888, 0.7401269, -0.3768951, 1, 0.6705883, 0, 1,
-1.106134, 0.3536923, -1.718496, 1, 0.6784314, 0, 1,
-1.099115, 0.1916764, 1.324823, 1, 0.682353, 0, 1,
-1.097469, -0.3215705, -0.8051134, 1, 0.6901961, 0, 1,
-1.097153, -0.6051258, -1.370828, 1, 0.6941177, 0, 1,
-1.090941, 0.475888, 0.2687544, 1, 0.7019608, 0, 1,
-1.081811, -1.640355, -4.59492, 1, 0.7098039, 0, 1,
-1.071264, 0.3458474, -2.561004, 1, 0.7137255, 0, 1,
-1.070689, 0.2897507, -1.184551, 1, 0.7215686, 0, 1,
-1.069048, 1.041541, -2.244971, 1, 0.7254902, 0, 1,
-1.068268, 0.2977229, -0.7577237, 1, 0.7333333, 0, 1,
-1.065527, 1.359836, -0.8261565, 1, 0.7372549, 0, 1,
-1.058161, 0.399943, -1.894947, 1, 0.7450981, 0, 1,
-1.058113, -1.492282, -2.026732, 1, 0.7490196, 0, 1,
-1.05356, -0.5475417, -2.03912, 1, 0.7568628, 0, 1,
-1.04913, -0.6980905, -3.870782, 1, 0.7607843, 0, 1,
-1.035866, 0.3575567, -0.3985316, 1, 0.7686275, 0, 1,
-1.017058, -0.106376, -1.909259, 1, 0.772549, 0, 1,
-1.015473, 0.3967373, -0.7902771, 1, 0.7803922, 0, 1,
-1.005388, -1.006061, -1.956102, 1, 0.7843137, 0, 1,
-1.002223, -0.2857586, -3.187089, 1, 0.7921569, 0, 1,
-0.9922209, 0.2395771, -2.279209, 1, 0.7960784, 0, 1,
-0.9895674, -0.7216435, -0.178512, 1, 0.8039216, 0, 1,
-0.9834201, -0.7802818, -2.122054, 1, 0.8117647, 0, 1,
-0.9775545, 0.2581907, -2.783246, 1, 0.8156863, 0, 1,
-0.9758324, 0.285324, -1.168236, 1, 0.8235294, 0, 1,
-0.9757621, -2.047789, -2.295951, 1, 0.827451, 0, 1,
-0.9714826, 0.9284749, -0.5044111, 1, 0.8352941, 0, 1,
-0.9706053, 0.3648397, -1.588385, 1, 0.8392157, 0, 1,
-0.9679742, -0.2855601, -2.913075, 1, 0.8470588, 0, 1,
-0.961103, -1.945846, -2.92975, 1, 0.8509804, 0, 1,
-0.9505744, -1.407092, -2.844368, 1, 0.8588235, 0, 1,
-0.9330787, -1.187279, -2.420074, 1, 0.8627451, 0, 1,
-0.9326999, -0.8549756, -3.357503, 1, 0.8705882, 0, 1,
-0.9303558, 0.9022631, -2.504, 1, 0.8745098, 0, 1,
-0.9249293, 0.5506251, -3.079282, 1, 0.8823529, 0, 1,
-0.9212443, 0.6327767, -1.653118, 1, 0.8862745, 0, 1,
-0.9127812, -1.168446, -4.037076, 1, 0.8941177, 0, 1,
-0.9127476, -0.9626101, -2.65755, 1, 0.8980392, 0, 1,
-0.9111298, -0.9624885, -1.079995, 1, 0.9058824, 0, 1,
-0.9025406, 0.1108899, -1.264468, 1, 0.9137255, 0, 1,
-0.9010241, -1.384686, -3.469726, 1, 0.9176471, 0, 1,
-0.8989456, -1.980658, -0.7675404, 1, 0.9254902, 0, 1,
-0.8948393, 1.185506, 0.217838, 1, 0.9294118, 0, 1,
-0.8941619, -1.376935, -2.705254, 1, 0.9372549, 0, 1,
-0.8869924, -0.04036501, -2.577029, 1, 0.9411765, 0, 1,
-0.8803264, -1.345104, -0.8941201, 1, 0.9490196, 0, 1,
-0.8716486, -1.493136, -2.885151, 1, 0.9529412, 0, 1,
-0.8587645, -0.6275318, -2.202978, 1, 0.9607843, 0, 1,
-0.8544552, -0.3953272, -1.376296, 1, 0.9647059, 0, 1,
-0.8490466, 0.1327169, -2.713212, 1, 0.972549, 0, 1,
-0.8454613, -0.3403383, -4.144165, 1, 0.9764706, 0, 1,
-0.8426565, 1.448408, 0.03279737, 1, 0.9843137, 0, 1,
-0.8396639, 0.9264283, -0.7240117, 1, 0.9882353, 0, 1,
-0.8368427, 0.6445673, 0.9731143, 1, 0.9960784, 0, 1,
-0.8305997, -0.8069208, -2.298828, 0.9960784, 1, 0, 1,
-0.8284171, -0.2936236, -3.153576, 0.9921569, 1, 0, 1,
-0.8276767, -0.08627183, -1.721565, 0.9843137, 1, 0, 1,
-0.8240874, 0.4754639, -1.47325, 0.9803922, 1, 0, 1,
-0.8234771, 0.2109833, -1.212048, 0.972549, 1, 0, 1,
-0.8218678, -0.6350752, -4.238335, 0.9686275, 1, 0, 1,
-0.8211417, 0.4338349, -0.563082, 0.9607843, 1, 0, 1,
-0.8185406, -0.4278784, -2.54912, 0.9568627, 1, 0, 1,
-0.8179314, 0.2570344, -1.008608, 0.9490196, 1, 0, 1,
-0.8099906, 0.1025224, -1.738147, 0.945098, 1, 0, 1,
-0.8052304, 0.3287774, -1.447434, 0.9372549, 1, 0, 1,
-0.8050095, 0.7226259, 0.3461943, 0.9333333, 1, 0, 1,
-0.8048756, 1.955251, 0.4047858, 0.9254902, 1, 0, 1,
-0.7951801, 0.04225608, -2.363012, 0.9215686, 1, 0, 1,
-0.7950307, 0.3594833, -3.08281, 0.9137255, 1, 0, 1,
-0.7933381, 0.8651092, -0.04242424, 0.9098039, 1, 0, 1,
-0.7909813, 0.5025416, -1.261604, 0.9019608, 1, 0, 1,
-0.7875662, 2.847439, 0.8083881, 0.8941177, 1, 0, 1,
-0.7875566, 0.130178, -0.7123583, 0.8901961, 1, 0, 1,
-0.7858839, 1.38516, -0.2751437, 0.8823529, 1, 0, 1,
-0.7844874, -0.8071483, -2.412183, 0.8784314, 1, 0, 1,
-0.782941, -0.8212253, -1.369741, 0.8705882, 1, 0, 1,
-0.7823032, 0.09469007, -1.96277, 0.8666667, 1, 0, 1,
-0.7765383, -0.8963696, -1.673488, 0.8588235, 1, 0, 1,
-0.7760565, -0.9365321, -2.194587, 0.854902, 1, 0, 1,
-0.7683975, -0.1924781, -0.8950275, 0.8470588, 1, 0, 1,
-0.7554408, -1.436326, -4.737757, 0.8431373, 1, 0, 1,
-0.7548735, -1.107382, -3.068277, 0.8352941, 1, 0, 1,
-0.7544793, -0.8131449, -2.226838, 0.8313726, 1, 0, 1,
-0.752227, -1.793768, -3.547352, 0.8235294, 1, 0, 1,
-0.7499555, 0.08690318, -2.552079, 0.8196079, 1, 0, 1,
-0.7471699, 0.5394827, -1.161311, 0.8117647, 1, 0, 1,
-0.7462435, 0.623641, 0.4202389, 0.8078431, 1, 0, 1,
-0.746215, 0.1091597, 0.04834165, 0.8, 1, 0, 1,
-0.745789, -0.06400423, -0.3132488, 0.7921569, 1, 0, 1,
-0.7455057, 0.9261157, -0.9248434, 0.7882353, 1, 0, 1,
-0.7421023, 1.742873, -0.702038, 0.7803922, 1, 0, 1,
-0.7376327, 1.035805, 0.5301501, 0.7764706, 1, 0, 1,
-0.7370674, -0.7380712, -1.550698, 0.7686275, 1, 0, 1,
-0.7344139, -1.273753, -0.6689218, 0.7647059, 1, 0, 1,
-0.7341991, -0.6278356, -1.739344, 0.7568628, 1, 0, 1,
-0.7339761, -0.3741378, -2.39993, 0.7529412, 1, 0, 1,
-0.7322984, 1.373049, -1.125111, 0.7450981, 1, 0, 1,
-0.7309664, -1.421669, -2.993972, 0.7411765, 1, 0, 1,
-0.7281562, 0.4004225, -1.651018, 0.7333333, 1, 0, 1,
-0.7257538, -0.4981448, -3.232045, 0.7294118, 1, 0, 1,
-0.7103655, -0.1796663, -0.6781887, 0.7215686, 1, 0, 1,
-0.7085019, 0.2338861, -1.129688, 0.7176471, 1, 0, 1,
-0.7081183, -0.3625946, -2.105865, 0.7098039, 1, 0, 1,
-0.7059824, 0.3714423, -0.8075218, 0.7058824, 1, 0, 1,
-0.6999735, -2.026906, -2.767492, 0.6980392, 1, 0, 1,
-0.6983477, 0.8245724, 0.7970253, 0.6901961, 1, 0, 1,
-0.6928955, -0.2667173, -2.247114, 0.6862745, 1, 0, 1,
-0.6854562, 0.1845971, -1.546144, 0.6784314, 1, 0, 1,
-0.6844022, 0.3083306, -0.9100892, 0.6745098, 1, 0, 1,
-0.6819208, -1.189691, -3.298182, 0.6666667, 1, 0, 1,
-0.6785309, 0.2735885, -2.291082, 0.6627451, 1, 0, 1,
-0.6598125, -0.4529887, -0.6391774, 0.654902, 1, 0, 1,
-0.65767, 0.6669817, 0.4416317, 0.6509804, 1, 0, 1,
-0.6552434, -0.07560918, -1.896863, 0.6431373, 1, 0, 1,
-0.651284, -0.6109944, -2.883744, 0.6392157, 1, 0, 1,
-0.646869, -0.6466096, -1.561351, 0.6313726, 1, 0, 1,
-0.6445087, -0.09789101, -2.931834, 0.627451, 1, 0, 1,
-0.6443371, 0.526185, 1.035759, 0.6196079, 1, 0, 1,
-0.6422638, 1.515145, 0.2291832, 0.6156863, 1, 0, 1,
-0.6406083, -0.8878003, -3.233855, 0.6078432, 1, 0, 1,
-0.6405995, -1.288629, -2.92151, 0.6039216, 1, 0, 1,
-0.6389076, 0.2886427, -1.341915, 0.5960785, 1, 0, 1,
-0.6282675, -0.2998166, -1.071256, 0.5882353, 1, 0, 1,
-0.6118059, 0.9927844, -0.748495, 0.5843138, 1, 0, 1,
-0.6082014, -1.751093, -2.145081, 0.5764706, 1, 0, 1,
-0.6065069, 0.5714056, -0.6013155, 0.572549, 1, 0, 1,
-0.600476, 0.05789755, -0.7742133, 0.5647059, 1, 0, 1,
-0.5978375, -1.243444, -4.143423, 0.5607843, 1, 0, 1,
-0.5965689, 0.3947737, -2.412696, 0.5529412, 1, 0, 1,
-0.5946425, -0.05223363, -0.5096176, 0.5490196, 1, 0, 1,
-0.5894021, 0.7977499, 0.4462483, 0.5411765, 1, 0, 1,
-0.5882003, -1.11922, -2.980869, 0.5372549, 1, 0, 1,
-0.5874499, 2.381539, -0.06068052, 0.5294118, 1, 0, 1,
-0.5870048, 1.98463, -1.126204, 0.5254902, 1, 0, 1,
-0.5863315, -0.8468342, -0.3378217, 0.5176471, 1, 0, 1,
-0.5861469, -0.2007767, -1.934411, 0.5137255, 1, 0, 1,
-0.585366, 0.6943012, 0.544524, 0.5058824, 1, 0, 1,
-0.5827187, 1.61027, -2.595523, 0.5019608, 1, 0, 1,
-0.5821215, 0.2246623, -1.937443, 0.4941176, 1, 0, 1,
-0.5801045, 0.1155149, -1.028188, 0.4862745, 1, 0, 1,
-0.5718017, -1.149904, -2.470678, 0.4823529, 1, 0, 1,
-0.5711626, -0.9496924, -1.375188, 0.4745098, 1, 0, 1,
-0.5710039, -2.062945, -2.361645, 0.4705882, 1, 0, 1,
-0.5614166, 0.8136182, 0.270051, 0.4627451, 1, 0, 1,
-0.5610986, -0.8318467, -0.3422473, 0.4588235, 1, 0, 1,
-0.5604862, 1.739478, 0.7636691, 0.4509804, 1, 0, 1,
-0.5598211, 1.988154, -0.6327448, 0.4470588, 1, 0, 1,
-0.5414563, -0.6197793, -2.412981, 0.4392157, 1, 0, 1,
-0.5337319, 0.4480508, -2.521842, 0.4352941, 1, 0, 1,
-0.5313522, -0.4269512, -2.061129, 0.427451, 1, 0, 1,
-0.5248695, 0.4442082, -1.585451, 0.4235294, 1, 0, 1,
-0.5187625, 1.078421, -1.056126, 0.4156863, 1, 0, 1,
-0.5174788, -0.4967671, -2.396618, 0.4117647, 1, 0, 1,
-0.516355, 1.101611, 0.8282175, 0.4039216, 1, 0, 1,
-0.5153414, 0.004547027, -3.149818, 0.3960784, 1, 0, 1,
-0.5152647, -0.913109, -2.725086, 0.3921569, 1, 0, 1,
-0.5094114, -1.466732, -4.005652, 0.3843137, 1, 0, 1,
-0.5091668, -1.020412, -2.231137, 0.3803922, 1, 0, 1,
-0.5046529, -0.5301474, -1.815918, 0.372549, 1, 0, 1,
-0.5041812, -0.4127734, -0.5542192, 0.3686275, 1, 0, 1,
-0.5039572, 2.126313, -0.3220325, 0.3607843, 1, 0, 1,
-0.5016521, 0.02877507, 1.290884, 0.3568628, 1, 0, 1,
-0.5001339, 0.6093287, 0.08212616, 0.3490196, 1, 0, 1,
-0.4950128, -0.769521, -1.957234, 0.345098, 1, 0, 1,
-0.4923649, -1.187374, -2.718616, 0.3372549, 1, 0, 1,
-0.4911359, -1.75382, -1.695122, 0.3333333, 1, 0, 1,
-0.4866702, -0.03371479, -3.211477, 0.3254902, 1, 0, 1,
-0.4838338, -0.2898686, -2.835425, 0.3215686, 1, 0, 1,
-0.4787706, 2.085567, -0.5762887, 0.3137255, 1, 0, 1,
-0.4786212, 0.2426157, -1.527553, 0.3098039, 1, 0, 1,
-0.4752235, 1.245262, 0.410239, 0.3019608, 1, 0, 1,
-0.4654779, 0.9660378, 0.24578, 0.2941177, 1, 0, 1,
-0.4614834, 1.189255, -0.9035238, 0.2901961, 1, 0, 1,
-0.4604479, 0.0003697693, -0.6246074, 0.282353, 1, 0, 1,
-0.457464, 1.148593, 0.931649, 0.2784314, 1, 0, 1,
-0.45726, -0.6491578, -1.769513, 0.2705882, 1, 0, 1,
-0.4559089, -1.054041, -2.673177, 0.2666667, 1, 0, 1,
-0.4534409, -0.3040923, -3.052563, 0.2588235, 1, 0, 1,
-0.4509956, -0.4009597, -1.922721, 0.254902, 1, 0, 1,
-0.4484718, -0.3408357, -2.852872, 0.2470588, 1, 0, 1,
-0.4471328, 0.8402399, -1.069987, 0.2431373, 1, 0, 1,
-0.444045, 0.07388781, -2.638797, 0.2352941, 1, 0, 1,
-0.4384829, -1.249626, -2.475421, 0.2313726, 1, 0, 1,
-0.4376845, -0.0191165, -0.9692441, 0.2235294, 1, 0, 1,
-0.4356336, -0.1154174, -2.551858, 0.2196078, 1, 0, 1,
-0.4343305, 0.3507976, -2.201259, 0.2117647, 1, 0, 1,
-0.4305173, -1.322348, -1.610203, 0.2078431, 1, 0, 1,
-0.4301281, 0.9130061, -0.2241621, 0.2, 1, 0, 1,
-0.4260103, -1.089284, -4.905142, 0.1921569, 1, 0, 1,
-0.4250575, -0.6453621, -1.720744, 0.1882353, 1, 0, 1,
-0.4241658, -1.708365, -2.517051, 0.1803922, 1, 0, 1,
-0.4169918, 1.262139, -0.502353, 0.1764706, 1, 0, 1,
-0.4154167, 0.08603901, -0.5282039, 0.1686275, 1, 0, 1,
-0.4129525, 1.930395, -1.124043, 0.1647059, 1, 0, 1,
-0.4065371, 0.2969, -0.7070453, 0.1568628, 1, 0, 1,
-0.389886, 1.196758, 3.249455, 0.1529412, 1, 0, 1,
-0.3872306, 0.5784011, -0.5452069, 0.145098, 1, 0, 1,
-0.3868556, 1.182487, -0.6602206, 0.1411765, 1, 0, 1,
-0.3810771, -0.04067244, -0.4466769, 0.1333333, 1, 0, 1,
-0.3762841, 0.03553203, -1.309925, 0.1294118, 1, 0, 1,
-0.3750585, 0.1247855, -0.9279956, 0.1215686, 1, 0, 1,
-0.3738135, 0.02226686, -1.323732, 0.1176471, 1, 0, 1,
-0.3562686, -0.2286739, -2.785489, 0.1098039, 1, 0, 1,
-0.3545029, -0.4721387, -4.431562, 0.1058824, 1, 0, 1,
-0.3542503, 0.3673163, -1.369376, 0.09803922, 1, 0, 1,
-0.353332, 0.8699289, -0.9571828, 0.09019608, 1, 0, 1,
-0.3503965, 1.93659, 0.9611305, 0.08627451, 1, 0, 1,
-0.3422087, 1.800613, 1.119896, 0.07843138, 1, 0, 1,
-0.3399726, 0.4969092, 0.1999669, 0.07450981, 1, 0, 1,
-0.3394126, 2.597291, 0.3647446, 0.06666667, 1, 0, 1,
-0.338496, -0.09756579, -1.623518, 0.0627451, 1, 0, 1,
-0.3363273, 0.8647318, -0.2388784, 0.05490196, 1, 0, 1,
-0.3361271, 1.491553, 0.1019062, 0.05098039, 1, 0, 1,
-0.3329231, -0.6336486, -1.35499, 0.04313726, 1, 0, 1,
-0.3318335, -1.591775, -2.86186, 0.03921569, 1, 0, 1,
-0.329979, -0.1928564, -1.960787, 0.03137255, 1, 0, 1,
-0.3277453, -0.6167904, -1.959909, 0.02745098, 1, 0, 1,
-0.3265988, -0.336109, -3.723666, 0.01960784, 1, 0, 1,
-0.3265486, -0.2332801, -1.403718, 0.01568628, 1, 0, 1,
-0.3250766, -0.8807352, -2.126224, 0.007843138, 1, 0, 1,
-0.3246292, -0.95533, -4.022697, 0.003921569, 1, 0, 1,
-0.3241571, -0.1912443, -2.030202, 0, 1, 0.003921569, 1,
-0.3223212, 0.404405, 0.8861551, 0, 1, 0.01176471, 1,
-0.3191993, -1.111467, -1.766755, 0, 1, 0.01568628, 1,
-0.3172532, -0.1466135, -2.072491, 0, 1, 0.02352941, 1,
-0.317041, 1.911425, 0.37361, 0, 1, 0.02745098, 1,
-0.3147131, -0.5239617, -1.830531, 0, 1, 0.03529412, 1,
-0.304588, -1.761012, -4.745836, 0, 1, 0.03921569, 1,
-0.2982322, -1.226264, -0.1529633, 0, 1, 0.04705882, 1,
-0.2980315, 0.8200509, -1.531146, 0, 1, 0.05098039, 1,
-0.2944607, 0.9500996, -0.7786982, 0, 1, 0.05882353, 1,
-0.2941793, 0.6997954, -1.931877, 0, 1, 0.0627451, 1,
-0.2908708, 0.675749, 1.504288, 0, 1, 0.07058824, 1,
-0.2906056, -0.005885899, -1.263079, 0, 1, 0.07450981, 1,
-0.2887679, 0.5680778, -1.526191, 0, 1, 0.08235294, 1,
-0.2874644, 1.163139, -2.590346, 0, 1, 0.08627451, 1,
-0.2848521, -0.7681829, -2.520756, 0, 1, 0.09411765, 1,
-0.2831749, -0.1845591, -1.46399, 0, 1, 0.1019608, 1,
-0.2817926, 1.189729, 0.01698705, 0, 1, 0.1058824, 1,
-0.2794097, -0.4311358, -3.604213, 0, 1, 0.1137255, 1,
-0.2791008, 0.07749321, -1.765932, 0, 1, 0.1176471, 1,
-0.2775054, 0.8414002, 0.08288486, 0, 1, 0.1254902, 1,
-0.2757838, -0.4399016, -2.050314, 0, 1, 0.1294118, 1,
-0.2747335, 2.248879, 1.05534, 0, 1, 0.1372549, 1,
-0.2743415, 0.01789632, -1.619591, 0, 1, 0.1411765, 1,
-0.2732398, -0.07070603, -2.031837, 0, 1, 0.1490196, 1,
-0.271267, -0.02339265, -2.923918, 0, 1, 0.1529412, 1,
-0.2675559, -1.436998, -2.347587, 0, 1, 0.1607843, 1,
-0.2670931, -1.130158, -2.252002, 0, 1, 0.1647059, 1,
-0.2647944, 0.4356695, -0.9502917, 0, 1, 0.172549, 1,
-0.2640254, 2.016333, -0.1364973, 0, 1, 0.1764706, 1,
-0.2625547, -0.4413946, -3.36062, 0, 1, 0.1843137, 1,
-0.2621802, -1.093153, -3.303147, 0, 1, 0.1882353, 1,
-0.2598641, -0.1685049, -1.640001, 0, 1, 0.1960784, 1,
-0.2593846, -2.108711, -1.747026, 0, 1, 0.2039216, 1,
-0.2578157, -1.438024, -3.53195, 0, 1, 0.2078431, 1,
-0.2569767, 1.748593, -1.326498, 0, 1, 0.2156863, 1,
-0.2562567, -1.11119, -4.08133, 0, 1, 0.2196078, 1,
-0.2490727, 0.1928791, -2.991475, 0, 1, 0.227451, 1,
-0.2481925, -1.42394, -3.627212, 0, 1, 0.2313726, 1,
-0.2480975, -0.9913329, -1.058739, 0, 1, 0.2392157, 1,
-0.2478553, -1.054989, -2.230449, 0, 1, 0.2431373, 1,
-0.247601, -0.08626319, -2.764019, 0, 1, 0.2509804, 1,
-0.2405591, -1.49715, -3.014737, 0, 1, 0.254902, 1,
-0.238646, -1.569802, -3.969316, 0, 1, 0.2627451, 1,
-0.2379971, -0.2203889, -1.172252, 0, 1, 0.2666667, 1,
-0.2372728, 1.659884, -0.08015734, 0, 1, 0.2745098, 1,
-0.2344664, -1.902995, -2.468152, 0, 1, 0.2784314, 1,
-0.2340778, 1.196238, -1.516613, 0, 1, 0.2862745, 1,
-0.2293096, -0.2225175, -0.7976876, 0, 1, 0.2901961, 1,
-0.2233436, 2.158321, -1.037582, 0, 1, 0.2980392, 1,
-0.2191563, 0.3008833, -0.5474842, 0, 1, 0.3058824, 1,
-0.2151539, -0.01607933, -1.129755, 0, 1, 0.3098039, 1,
-0.2132292, 0.3842345, -0.8361921, 0, 1, 0.3176471, 1,
-0.2126729, -1.389467, -1.088515, 0, 1, 0.3215686, 1,
-0.2112737, 0.2163342, -0.5756615, 0, 1, 0.3294118, 1,
-0.2103952, -1.098284, -5.29755, 0, 1, 0.3333333, 1,
-0.210109, 1.533458, 0.05881542, 0, 1, 0.3411765, 1,
-0.2101029, 1.585022, -0.7384551, 0, 1, 0.345098, 1,
-0.2090728, 0.8632047, 1.339327, 0, 1, 0.3529412, 1,
-0.2083417, -0.5479083, -2.171011, 0, 1, 0.3568628, 1,
-0.2080157, 0.04870805, -0.9948547, 0, 1, 0.3647059, 1,
-0.207652, 0.9427169, 0.1727234, 0, 1, 0.3686275, 1,
-0.2073877, -0.6541515, -2.302418, 0, 1, 0.3764706, 1,
-0.1910871, -1.214088, -1.834566, 0, 1, 0.3803922, 1,
-0.1907968, -0.5802085, -3.669994, 0, 1, 0.3882353, 1,
-0.1897505, 0.3958589, -2.119064, 0, 1, 0.3921569, 1,
-0.1886831, 0.2854683, 0.3183714, 0, 1, 0.4, 1,
-0.1881951, -1.115734, -3.206387, 0, 1, 0.4078431, 1,
-0.1880395, 1.261719, 0.3664415, 0, 1, 0.4117647, 1,
-0.1874384, -1.683533, -2.294964, 0, 1, 0.4196078, 1,
-0.1870891, -0.3802686, -2.750258, 0, 1, 0.4235294, 1,
-0.1849115, -0.6156483, -3.782834, 0, 1, 0.4313726, 1,
-0.1812807, 0.1218072, -1.398374, 0, 1, 0.4352941, 1,
-0.1769366, 0.4850905, -0.3186508, 0, 1, 0.4431373, 1,
-0.1769086, 0.3424369, 0.7978391, 0, 1, 0.4470588, 1,
-0.1766747, -1.136958, -3.449816, 0, 1, 0.454902, 1,
-0.175979, -0.9050742, -3.697919, 0, 1, 0.4588235, 1,
-0.1739955, 0.5292526, -0.8435949, 0, 1, 0.4666667, 1,
-0.1701989, -0.5641341, -3.466631, 0, 1, 0.4705882, 1,
-0.1687759, -1.605214, -1.633534, 0, 1, 0.4784314, 1,
-0.1684567, 1.61268, -0.1603454, 0, 1, 0.4823529, 1,
-0.163301, -1.350059, -3.128766, 0, 1, 0.4901961, 1,
-0.1543396, 0.1789323, -1.546162, 0, 1, 0.4941176, 1,
-0.1507135, 1.018608, -1.633628, 0, 1, 0.5019608, 1,
-0.1448099, 0.3059619, -0.1385487, 0, 1, 0.509804, 1,
-0.1447005, -1.196895, -4.108066, 0, 1, 0.5137255, 1,
-0.1424404, -0.8541723, -3.154879, 0, 1, 0.5215687, 1,
-0.1394242, 0.7347192, 1.060677, 0, 1, 0.5254902, 1,
-0.1364829, 0.2109122, -0.7314647, 0, 1, 0.5333334, 1,
-0.1343656, 1.023186, 0.5076132, 0, 1, 0.5372549, 1,
-0.1309875, 0.2797994, -2.196283, 0, 1, 0.5450981, 1,
-0.1288542, -0.8809416, -3.431484, 0, 1, 0.5490196, 1,
-0.1274545, 0.7850505, -1.294573, 0, 1, 0.5568628, 1,
-0.1272654, -0.7066767, -2.346372, 0, 1, 0.5607843, 1,
-0.1265529, -0.8677552, -3.668004, 0, 1, 0.5686275, 1,
-0.1221345, 0.1459894, 0.7062411, 0, 1, 0.572549, 1,
-0.1197661, 0.0720995, -0.9054396, 0, 1, 0.5803922, 1,
-0.1181333, 0.1567162, -1.247219, 0, 1, 0.5843138, 1,
-0.1176564, 0.2565455, 0.2495329, 0, 1, 0.5921569, 1,
-0.1164521, 0.8042776, -0.7856655, 0, 1, 0.5960785, 1,
-0.1059872, -0.6400721, -3.690159, 0, 1, 0.6039216, 1,
-0.1052648, -0.6974007, -3.156828, 0, 1, 0.6117647, 1,
-0.09975305, 0.3378025, -0.07252224, 0, 1, 0.6156863, 1,
-0.09274645, -0.9508438, -2.79145, 0, 1, 0.6235294, 1,
-0.09270239, 0.06110775, -2.212593, 0, 1, 0.627451, 1,
-0.08972456, -0.9511117, -2.169995, 0, 1, 0.6352941, 1,
-0.08532745, 0.8816295, -0.7817556, 0, 1, 0.6392157, 1,
-0.07726892, -0.5678113, -2.225177, 0, 1, 0.6470588, 1,
-0.07134739, 0.05193771, 1.424564, 0, 1, 0.6509804, 1,
-0.0697316, -1.157856, -2.240428, 0, 1, 0.6588235, 1,
-0.06933302, 1.340702, -0.9080619, 0, 1, 0.6627451, 1,
-0.06910229, 1.506711, 0.5748445, 0, 1, 0.6705883, 1,
-0.06811108, 1.687643, -0.6037212, 0, 1, 0.6745098, 1,
-0.06339402, -0.7765502, -2.667369, 0, 1, 0.682353, 1,
-0.06325679, 0.9620588, 0.09933463, 0, 1, 0.6862745, 1,
-0.06282729, 2.057407, 0.4096461, 0, 1, 0.6941177, 1,
-0.05926533, 0.7785111, 0.8086757, 0, 1, 0.7019608, 1,
-0.0589953, -0.04742852, -1.886497, 0, 1, 0.7058824, 1,
-0.0577338, -0.3424714, -4.200048, 0, 1, 0.7137255, 1,
-0.0561339, 0.3694023, 1.055688, 0, 1, 0.7176471, 1,
-0.05595449, -0.6104847, -0.4479812, 0, 1, 0.7254902, 1,
-0.05512298, 0.1037738, -2.940754, 0, 1, 0.7294118, 1,
-0.05475603, -0.300158, -3.87387, 0, 1, 0.7372549, 1,
-0.05340067, -1.459071, -3.117092, 0, 1, 0.7411765, 1,
-0.05277252, 0.4015653, 0.637274, 0, 1, 0.7490196, 1,
-0.05095441, 0.4881477, 1.165037, 0, 1, 0.7529412, 1,
-0.05073863, 0.6081522, 0.1847438, 0, 1, 0.7607843, 1,
-0.04393494, -0.2580215, -3.799223, 0, 1, 0.7647059, 1,
-0.0417175, -0.1793448, -2.524768, 0, 1, 0.772549, 1,
-0.03904004, 1.574168, 0.6721174, 0, 1, 0.7764706, 1,
-0.03572682, 1.203461, -0.7759256, 0, 1, 0.7843137, 1,
-0.03222134, 0.02622289, -1.371947, 0, 1, 0.7882353, 1,
-0.02932292, 0.654704, -0.4032715, 0, 1, 0.7960784, 1,
-0.02681013, 0.7363369, 1.123307, 0, 1, 0.8039216, 1,
-0.02474698, 0.5066881, -0.9054404, 0, 1, 0.8078431, 1,
-0.02358635, -0.8058495, -2.737332, 0, 1, 0.8156863, 1,
-0.02208482, -0.2754175, -1.391117, 0, 1, 0.8196079, 1,
-0.02125904, -0.9530739, -1.118052, 0, 1, 0.827451, 1,
-0.02085795, 0.478253, -1.358467, 0, 1, 0.8313726, 1,
-0.01973585, 0.8203169, -0.07688031, 0, 1, 0.8392157, 1,
-0.01818995, 1.303256, 0.544497, 0, 1, 0.8431373, 1,
-0.01642513, -0.1718655, -4.104387, 0, 1, 0.8509804, 1,
-0.01556382, -0.7907042, -2.115387, 0, 1, 0.854902, 1,
-0.01494794, -2.928611, -2.7984, 0, 1, 0.8627451, 1,
-0.01476386, -1.279822, -2.259842, 0, 1, 0.8666667, 1,
-0.01450186, -0.8370972, -4.64775, 0, 1, 0.8745098, 1,
-0.01192468, 1.641419, -0.2450733, 0, 1, 0.8784314, 1,
-0.01114051, -0.9198655, -3.043277, 0, 1, 0.8862745, 1,
-0.007594737, -1.131875, -1.920689, 0, 1, 0.8901961, 1,
-0.006208197, 1.117471, -0.3115905, 0, 1, 0.8980392, 1,
-0.005314138, -0.4978938, -3.743091, 0, 1, 0.9058824, 1,
-0.003210856, 1.596012, -0.3860196, 0, 1, 0.9098039, 1,
-0.002536458, 0.6064969, -0.1323521, 0, 1, 0.9176471, 1,
0.0001286924, -0.7936585, 2.395118, 0, 1, 0.9215686, 1,
0.0007154046, -1.6772, 3.89716, 0, 1, 0.9294118, 1,
0.002089944, -0.7742978, 2.989054, 0, 1, 0.9333333, 1,
0.006854176, -1.038269, 2.723752, 0, 1, 0.9411765, 1,
0.007117065, 1.062521, -0.1847588, 0, 1, 0.945098, 1,
0.01237504, -0.1855186, 2.99429, 0, 1, 0.9529412, 1,
0.0152327, -0.6611332, 2.55818, 0, 1, 0.9568627, 1,
0.02048254, -1.303566, 1.453396, 0, 1, 0.9647059, 1,
0.02346451, -0.8907905, 3.524812, 0, 1, 0.9686275, 1,
0.02579943, 0.8320923, 2.151234, 0, 1, 0.9764706, 1,
0.02904222, -0.1372547, 1.874035, 0, 1, 0.9803922, 1,
0.0293961, 1.191953, -0.5387881, 0, 1, 0.9882353, 1,
0.02944744, -0.1864873, 4.102937, 0, 1, 0.9921569, 1,
0.03051805, 1.677009, 0.539896, 0, 1, 1, 1,
0.03136479, -1.459179, 2.633251, 0, 0.9921569, 1, 1,
0.03296471, 1.242762, -1.71478, 0, 0.9882353, 1, 1,
0.03328418, 1.112996, -0.1409295, 0, 0.9803922, 1, 1,
0.03393783, -0.1126065, 0.9928795, 0, 0.9764706, 1, 1,
0.03786736, 0.06181386, 2.495911, 0, 0.9686275, 1, 1,
0.03866713, 2.491345, 0.6213478, 0, 0.9647059, 1, 1,
0.04053858, -1.444064, 1.973913, 0, 0.9568627, 1, 1,
0.04397483, -0.7395185, 3.986897, 0, 0.9529412, 1, 1,
0.04892163, 0.2195799, -1.68935, 0, 0.945098, 1, 1,
0.05020839, -1.144797, 2.923147, 0, 0.9411765, 1, 1,
0.05364902, 0.1080962, -0.3910028, 0, 0.9333333, 1, 1,
0.05521065, 0.7446264, -0.1637293, 0, 0.9294118, 1, 1,
0.05604696, -1.303439, 3.534142, 0, 0.9215686, 1, 1,
0.05885292, 1.110401, 2.030164, 0, 0.9176471, 1, 1,
0.06032641, 1.14858, 1.163255, 0, 0.9098039, 1, 1,
0.06631611, -0.5740603, 2.016829, 0, 0.9058824, 1, 1,
0.0685511, -0.6388369, 3.37302, 0, 0.8980392, 1, 1,
0.06945296, 0.9778587, 1.101955, 0, 0.8901961, 1, 1,
0.07024006, 0.6689099, 0.0870854, 0, 0.8862745, 1, 1,
0.07836472, 0.2529284, 0.1613341, 0, 0.8784314, 1, 1,
0.08290766, -0.5192137, 2.496272, 0, 0.8745098, 1, 1,
0.08331425, -0.1303054, 0.8941368, 0, 0.8666667, 1, 1,
0.08431783, -0.9098268, 1.696298, 0, 0.8627451, 1, 1,
0.08666766, -0.8800188, 3.395736, 0, 0.854902, 1, 1,
0.08678757, -1.282765, 4.304221, 0, 0.8509804, 1, 1,
0.08689979, 2.4239, 0.8582785, 0, 0.8431373, 1, 1,
0.08731391, 0.9114931, -0.9073762, 0, 0.8392157, 1, 1,
0.09290415, 0.96842, -0.6628847, 0, 0.8313726, 1, 1,
0.09347895, 0.5424758, -0.2628655, 0, 0.827451, 1, 1,
0.09378115, -1.512925, 1.629788, 0, 0.8196079, 1, 1,
0.1042925, 0.07314789, -1.390308, 0, 0.8156863, 1, 1,
0.1156494, -1.105496, 3.221532, 0, 0.8078431, 1, 1,
0.1157954, 0.1946326, -0.3010424, 0, 0.8039216, 1, 1,
0.1161436, -1.138724, 4.260265, 0, 0.7960784, 1, 1,
0.1166139, -0.7065871, 4.520303, 0, 0.7882353, 1, 1,
0.1186178, 0.5204597, 0.1068094, 0, 0.7843137, 1, 1,
0.1197314, 0.7601746, 0.1073345, 0, 0.7764706, 1, 1,
0.1215168, -0.5628906, 2.643382, 0, 0.772549, 1, 1,
0.1237367, 0.8983307, -0.9354346, 0, 0.7647059, 1, 1,
0.1275679, 0.8521096, -0.2810455, 0, 0.7607843, 1, 1,
0.1286099, -2.344157, 2.953716, 0, 0.7529412, 1, 1,
0.1293361, 1.668217, 1.50403, 0, 0.7490196, 1, 1,
0.1316797, 1.693889, -0.3561977, 0, 0.7411765, 1, 1,
0.1328397, -1.255684, 1.075283, 0, 0.7372549, 1, 1,
0.1424142, 1.416116, 0.4104653, 0, 0.7294118, 1, 1,
0.1459458, 0.4696975, -0.790828, 0, 0.7254902, 1, 1,
0.1468215, 0.6484986, -0.0657074, 0, 0.7176471, 1, 1,
0.1484676, -1.196262, 4.911843, 0, 0.7137255, 1, 1,
0.1490293, 0.347499, -0.06736694, 0, 0.7058824, 1, 1,
0.1510851, -0.5742092, 3.503491, 0, 0.6980392, 1, 1,
0.1558325, 0.6659585, 0.4090113, 0, 0.6941177, 1, 1,
0.1567018, 0.2759839, -0.2435337, 0, 0.6862745, 1, 1,
0.1576656, -0.3777317, 1.170321, 0, 0.682353, 1, 1,
0.1581498, -2.276256, 3.338588, 0, 0.6745098, 1, 1,
0.1582306, -0.2486656, 2.229459, 0, 0.6705883, 1, 1,
0.1606919, -0.6359911, 4.880095, 0, 0.6627451, 1, 1,
0.1637729, 0.3932529, -0.09570616, 0, 0.6588235, 1, 1,
0.1639252, -1.260974, 4.650326, 0, 0.6509804, 1, 1,
0.1656694, 0.3909695, -0.2637545, 0, 0.6470588, 1, 1,
0.1677536, 0.2305113, 0.8032048, 0, 0.6392157, 1, 1,
0.1684355, -0.2038063, 3.146848, 0, 0.6352941, 1, 1,
0.1689993, 0.4211695, 0.5307196, 0, 0.627451, 1, 1,
0.1702631, -0.4674054, 3.704869, 0, 0.6235294, 1, 1,
0.1734208, 0.08562121, 0.5875236, 0, 0.6156863, 1, 1,
0.1751679, -0.3575027, 1.753622, 0, 0.6117647, 1, 1,
0.1791615, -0.3438967, 2.205641, 0, 0.6039216, 1, 1,
0.1826428, -0.4533297, 3.007821, 0, 0.5960785, 1, 1,
0.1928049, 0.4495442, 1.023537, 0, 0.5921569, 1, 1,
0.1935749, -1.081509, 2.001531, 0, 0.5843138, 1, 1,
0.1939325, -0.02158173, 1.578518, 0, 0.5803922, 1, 1,
0.1948381, -0.5414584, 1.851954, 0, 0.572549, 1, 1,
0.1955791, -0.2277708, 1.942504, 0, 0.5686275, 1, 1,
0.1987789, -0.9464307, 1.551002, 0, 0.5607843, 1, 1,
0.2037513, -0.8441094, 3.125463, 0, 0.5568628, 1, 1,
0.2041683, -0.2827566, 2.541615, 0, 0.5490196, 1, 1,
0.2046397, -0.1294297, 1.384341, 0, 0.5450981, 1, 1,
0.2071353, 0.8974596, 0.3818518, 0, 0.5372549, 1, 1,
0.2079495, 0.2675547, 0.2302315, 0, 0.5333334, 1, 1,
0.2085633, 2.213406, 2.028436, 0, 0.5254902, 1, 1,
0.2097358, -1.600561, 2.450642, 0, 0.5215687, 1, 1,
0.2144777, -0.4240613, 2.485743, 0, 0.5137255, 1, 1,
0.2157851, -1.246101, 2.777632, 0, 0.509804, 1, 1,
0.2159005, 1.760084, 0.1658774, 0, 0.5019608, 1, 1,
0.2290811, 0.5514853, -0.3010058, 0, 0.4941176, 1, 1,
0.2298084, 0.8545371, 2.471553, 0, 0.4901961, 1, 1,
0.2299518, -0.03678583, 1.368196, 0, 0.4823529, 1, 1,
0.2302815, -0.710601, 1.632403, 0, 0.4784314, 1, 1,
0.2340024, 0.8560169, 1.760132, 0, 0.4705882, 1, 1,
0.2349902, 1.543977, 0.2086379, 0, 0.4666667, 1, 1,
0.2358787, 0.6456921, -0.04276949, 0, 0.4588235, 1, 1,
0.2383971, -0.6561822, 2.096262, 0, 0.454902, 1, 1,
0.2385571, -1.22545, 2.033883, 0, 0.4470588, 1, 1,
0.2447573, 0.2896351, 0.9157807, 0, 0.4431373, 1, 1,
0.2451448, -0.3065041, 2.667459, 0, 0.4352941, 1, 1,
0.2487246, 0.02485863, 3.345019, 0, 0.4313726, 1, 1,
0.250263, 0.6107918, 1.404899, 0, 0.4235294, 1, 1,
0.2519451, -1.110914, 3.418682, 0, 0.4196078, 1, 1,
0.2567115, -1.651149, 4.168448, 0, 0.4117647, 1, 1,
0.2587216, 1.159804, 0.4790698, 0, 0.4078431, 1, 1,
0.2642733, 0.6207933, -0.2505569, 0, 0.4, 1, 1,
0.2646542, -0.130194, 2.958919, 0, 0.3921569, 1, 1,
0.2680927, -0.7913088, 2.240667, 0, 0.3882353, 1, 1,
0.276367, 0.462938, 1.383955, 0, 0.3803922, 1, 1,
0.2764278, -1.264161, 2.089759, 0, 0.3764706, 1, 1,
0.2799082, 0.1980544, 3.161499, 0, 0.3686275, 1, 1,
0.2877137, 0.1803303, 2.40414, 0, 0.3647059, 1, 1,
0.2893881, -0.8794083, 3.160691, 0, 0.3568628, 1, 1,
0.2916787, 0.9232306, 1.927694, 0, 0.3529412, 1, 1,
0.2920492, 0.5105171, 0.4095573, 0, 0.345098, 1, 1,
0.2947082, -2.088924, 0.919566, 0, 0.3411765, 1, 1,
0.2959, 0.0691461, 1.533826, 0, 0.3333333, 1, 1,
0.2967544, -1.63691, 3.275743, 0, 0.3294118, 1, 1,
0.2981503, -2.021973, 3.021844, 0, 0.3215686, 1, 1,
0.2981956, 0.2862734, 0.7415796, 0, 0.3176471, 1, 1,
0.3004128, -1.197946, 4.00941, 0, 0.3098039, 1, 1,
0.3020798, -1.020026, 3.006563, 0, 0.3058824, 1, 1,
0.3084731, -0.6102583, 1.254867, 0, 0.2980392, 1, 1,
0.3146404, -0.1666535, 0.4880679, 0, 0.2901961, 1, 1,
0.3199161, 1.155973, 0.9990968, 0, 0.2862745, 1, 1,
0.3199686, 1.268292, 0.9785486, 0, 0.2784314, 1, 1,
0.3215879, -0.7962317, 1.643113, 0, 0.2745098, 1, 1,
0.3234509, -0.05895854, 0.462799, 0, 0.2666667, 1, 1,
0.3266658, 0.8911358, 1.268165, 0, 0.2627451, 1, 1,
0.3328466, 1.247012, 0.2345399, 0, 0.254902, 1, 1,
0.3371423, 1.189589, 1.072559, 0, 0.2509804, 1, 1,
0.3390937, 0.3758324, 0.1900528, 0, 0.2431373, 1, 1,
0.339939, 0.4315384, 3.275307, 0, 0.2392157, 1, 1,
0.3411531, 0.5981545, 0.356062, 0, 0.2313726, 1, 1,
0.3456862, 0.07027135, 2.121003, 0, 0.227451, 1, 1,
0.3460579, -0.002218469, 1.806409, 0, 0.2196078, 1, 1,
0.3485297, -1.261954, 0.6554294, 0, 0.2156863, 1, 1,
0.3513142, 0.1144131, 1.514358, 0, 0.2078431, 1, 1,
0.3520767, 1.596642, 1.262953, 0, 0.2039216, 1, 1,
0.3565504, -1.520195, 1.880708, 0, 0.1960784, 1, 1,
0.3584546, 0.3059466, 0.7628067, 0, 0.1882353, 1, 1,
0.363035, 0.6149331, 0.1385958, 0, 0.1843137, 1, 1,
0.3666821, -0.5267116, 2.667379, 0, 0.1764706, 1, 1,
0.3667037, 0.2764953, 2.13888, 0, 0.172549, 1, 1,
0.36899, -0.3189897, 1.076003, 0, 0.1647059, 1, 1,
0.3756608, 0.6551829, -0.7423944, 0, 0.1607843, 1, 1,
0.3784941, -0.0684279, 2.448699, 0, 0.1529412, 1, 1,
0.3828226, 0.6374575, -0.08378317, 0, 0.1490196, 1, 1,
0.3829837, 1.171907, -1.550631, 0, 0.1411765, 1, 1,
0.3882743, 0.7688271, 0.9570764, 0, 0.1372549, 1, 1,
0.3883972, -0.5259987, 4.684119, 0, 0.1294118, 1, 1,
0.3894399, -1.576107, 1.450732, 0, 0.1254902, 1, 1,
0.3929982, 0.6404525, 0.429344, 0, 0.1176471, 1, 1,
0.3973156, -1.47948, 3.303322, 0, 0.1137255, 1, 1,
0.4011331, -2.112428, 3.758102, 0, 0.1058824, 1, 1,
0.409999, -2.118923, 2.555995, 0, 0.09803922, 1, 1,
0.4167942, 0.3815157, 1.702209, 0, 0.09411765, 1, 1,
0.4214098, 0.4579409, 1.649122, 0, 0.08627451, 1, 1,
0.4222572, 0.4955012, 1.101956, 0, 0.08235294, 1, 1,
0.4243154, 0.4771579, -0.8989974, 0, 0.07450981, 1, 1,
0.4287046, -0.1593598, 1.437201, 0, 0.07058824, 1, 1,
0.4310838, -1.115816, 1.962743, 0, 0.0627451, 1, 1,
0.4337988, -0.5193748, 1.612172, 0, 0.05882353, 1, 1,
0.4349174, -2.472316, 2.414092, 0, 0.05098039, 1, 1,
0.435064, -0.630232, 2.238877, 0, 0.04705882, 1, 1,
0.4364875, 0.9213161, -0.28606, 0, 0.03921569, 1, 1,
0.4418893, 0.6278338, 0.1016695, 0, 0.03529412, 1, 1,
0.4433792, -1.036604, 1.883041, 0, 0.02745098, 1, 1,
0.4433946, -0.243547, 1.074685, 0, 0.02352941, 1, 1,
0.4437356, -1.242371, 2.993891, 0, 0.01568628, 1, 1,
0.4457318, 1.166534, 2.420959, 0, 0.01176471, 1, 1,
0.4472106, -0.5146136, 2.600646, 0, 0.003921569, 1, 1,
0.4474084, 1.129065, -0.9458687, 0.003921569, 0, 1, 1,
0.4492097, -0.1041675, 1.198326, 0.007843138, 0, 1, 1,
0.4512883, -0.8095759, 3.388424, 0.01568628, 0, 1, 1,
0.4534658, 1.360003, -0.2140565, 0.01960784, 0, 1, 1,
0.4544418, 0.6398438, -0.1934468, 0.02745098, 0, 1, 1,
0.4560234, -0.3290935, 2.100158, 0.03137255, 0, 1, 1,
0.4597076, -0.06103558, 2.870583, 0.03921569, 0, 1, 1,
0.4616678, -0.746595, 0.2686666, 0.04313726, 0, 1, 1,
0.4663849, 1.3462, -0.5008972, 0.05098039, 0, 1, 1,
0.4717734, 0.5151719, 2.031366, 0.05490196, 0, 1, 1,
0.4767624, -0.3821459, 3.657104, 0.0627451, 0, 1, 1,
0.480801, -0.8868378, 0.7686545, 0.06666667, 0, 1, 1,
0.4813249, -0.1221921, 3.207429, 0.07450981, 0, 1, 1,
0.4813871, -0.4206339, 2.747043, 0.07843138, 0, 1, 1,
0.4854106, 1.977026, 1.706962, 0.08627451, 0, 1, 1,
0.4876175, -0.8698298, 3.495255, 0.09019608, 0, 1, 1,
0.4878484, 0.2377185, 2.07326, 0.09803922, 0, 1, 1,
0.4969737, 0.6006367, 1.123658, 0.1058824, 0, 1, 1,
0.5006765, -0.4516513, 1.917599, 0.1098039, 0, 1, 1,
0.5046715, 0.1235651, 0.6598362, 0.1176471, 0, 1, 1,
0.5059253, 0.08528037, 0.2511679, 0.1215686, 0, 1, 1,
0.5125905, -0.541506, 3.509019, 0.1294118, 0, 1, 1,
0.5149225, -0.2959539, 2.282645, 0.1333333, 0, 1, 1,
0.5199893, -1.254488, 3.111165, 0.1411765, 0, 1, 1,
0.5218669, -0.1895055, 4.392598, 0.145098, 0, 1, 1,
0.5240945, 1.057703, 0.5912717, 0.1529412, 0, 1, 1,
0.5252409, 0.6852193, -0.7617781, 0.1568628, 0, 1, 1,
0.5257391, -0.1791588, -0.04209442, 0.1647059, 0, 1, 1,
0.5284398, 1.224035, 0.783629, 0.1686275, 0, 1, 1,
0.5303247, -0.1601291, 1.611724, 0.1764706, 0, 1, 1,
0.530865, 1.439817, 1.031147, 0.1803922, 0, 1, 1,
0.5328184, -1.858091, 3.763026, 0.1882353, 0, 1, 1,
0.5336187, -0.8241897, 4.283682, 0.1921569, 0, 1, 1,
0.5434124, 1.004819, -0.2997741, 0.2, 0, 1, 1,
0.5447315, 1.642273, -0.1353935, 0.2078431, 0, 1, 1,
0.5472115, 0.5417072, 1.913163, 0.2117647, 0, 1, 1,
0.5499043, 0.5159853, 1.92176, 0.2196078, 0, 1, 1,
0.5502099, -0.5464547, 2.391208, 0.2235294, 0, 1, 1,
0.5502612, -0.1548525, 1.483653, 0.2313726, 0, 1, 1,
0.5505602, 0.4088545, 1.313731, 0.2352941, 0, 1, 1,
0.553584, -0.4097678, 2.751873, 0.2431373, 0, 1, 1,
0.5564306, -0.1840924, 2.774301, 0.2470588, 0, 1, 1,
0.568657, -0.06893495, 1.863332, 0.254902, 0, 1, 1,
0.5744954, -1.574887, 2.988369, 0.2588235, 0, 1, 1,
0.5757926, 0.00633189, 0.5488331, 0.2666667, 0, 1, 1,
0.5772805, -0.3314781, 0.3093759, 0.2705882, 0, 1, 1,
0.5791254, -0.7420331, 4.21651, 0.2784314, 0, 1, 1,
0.5841233, -1.343226, 2.075654, 0.282353, 0, 1, 1,
0.5878981, 0.389527, 1.692271, 0.2901961, 0, 1, 1,
0.5912006, -0.5861847, 2.789434, 0.2941177, 0, 1, 1,
0.5943685, 0.8177199, 0.1123828, 0.3019608, 0, 1, 1,
0.5955728, 1.21625, 1.302929, 0.3098039, 0, 1, 1,
0.5980436, 0.009907984, 1.96788, 0.3137255, 0, 1, 1,
0.6002331, 0.4499781, 1.834226, 0.3215686, 0, 1, 1,
0.6040491, 1.450357, 0.5027242, 0.3254902, 0, 1, 1,
0.6042773, 0.5469736, 1.144569, 0.3333333, 0, 1, 1,
0.6060761, -0.8799538, 2.231163, 0.3372549, 0, 1, 1,
0.620459, 1.11406, 2.853547, 0.345098, 0, 1, 1,
0.6219249, -0.3149862, 3.494336, 0.3490196, 0, 1, 1,
0.6224664, 2.06431, 0.07278921, 0.3568628, 0, 1, 1,
0.6224665, 0.6755342, 0.2133555, 0.3607843, 0, 1, 1,
0.6266604, -2.931158, 3.471206, 0.3686275, 0, 1, 1,
0.6355215, -0.5151188, 1.802405, 0.372549, 0, 1, 1,
0.6409719, -0.5854822, 2.249694, 0.3803922, 0, 1, 1,
0.6423237, -0.6136582, 3.09044, 0.3843137, 0, 1, 1,
0.6448675, -0.4942461, 2.333452, 0.3921569, 0, 1, 1,
0.6460125, 1.247206, 0.2322198, 0.3960784, 0, 1, 1,
0.6475281, -0.2470086, 1.997349, 0.4039216, 0, 1, 1,
0.6477242, 1.023849, 0.1149954, 0.4117647, 0, 1, 1,
0.6493647, -0.9436076, 1.994395, 0.4156863, 0, 1, 1,
0.6616368, -0.05759467, 2.151079, 0.4235294, 0, 1, 1,
0.6618556, 0.2463167, 0.495358, 0.427451, 0, 1, 1,
0.6636943, 0.1643576, 1.932506, 0.4352941, 0, 1, 1,
0.6641611, -1.077368, 0.5149253, 0.4392157, 0, 1, 1,
0.669085, -0.9883767, 1.747303, 0.4470588, 0, 1, 1,
0.6744817, -0.9429911, 2.521034, 0.4509804, 0, 1, 1,
0.6803015, -0.1443364, 2.049012, 0.4588235, 0, 1, 1,
0.6897258, -0.5143133, 2.470859, 0.4627451, 0, 1, 1,
0.6912305, 0.1731457, 1.10547, 0.4705882, 0, 1, 1,
0.6920456, 1.558435, 0.3715431, 0.4745098, 0, 1, 1,
0.6933625, 0.8164175, 1.140731, 0.4823529, 0, 1, 1,
0.6954164, -2.07584, 3.916108, 0.4862745, 0, 1, 1,
0.6972665, 0.5121449, 3.855189, 0.4941176, 0, 1, 1,
0.6976693, 1.005116, 0.210736, 0.5019608, 0, 1, 1,
0.701791, 0.2199747, 2.934724, 0.5058824, 0, 1, 1,
0.7106446, -1.248989, 3.790786, 0.5137255, 0, 1, 1,
0.7108372, 0.5390683, 1.835583, 0.5176471, 0, 1, 1,
0.713691, -0.5716128, 1.178954, 0.5254902, 0, 1, 1,
0.7153786, 1.116237, -0.02163528, 0.5294118, 0, 1, 1,
0.71602, 0.6298268, 2.27711, 0.5372549, 0, 1, 1,
0.7198793, 1.537691, 1.933327, 0.5411765, 0, 1, 1,
0.7230573, 1.267922, 1.243033, 0.5490196, 0, 1, 1,
0.7251891, 1.262164, 1.500858, 0.5529412, 0, 1, 1,
0.7356228, 2.042452, -0.3734177, 0.5607843, 0, 1, 1,
0.738679, 0.08845568, 1.970561, 0.5647059, 0, 1, 1,
0.7439651, 1.134251, 0.4841955, 0.572549, 0, 1, 1,
0.7439854, 0.424261, -0.4230301, 0.5764706, 0, 1, 1,
0.7449288, 0.2601465, 1.992124, 0.5843138, 0, 1, 1,
0.7496752, -1.57824, 2.589175, 0.5882353, 0, 1, 1,
0.7516014, -0.9246702, 2.950325, 0.5960785, 0, 1, 1,
0.7584213, 0.09606969, 1.193013, 0.6039216, 0, 1, 1,
0.7584432, 0.3411315, 1.172817, 0.6078432, 0, 1, 1,
0.7647185, 0.8513402, 0.83691, 0.6156863, 0, 1, 1,
0.7687853, -1.038019, 3.266119, 0.6196079, 0, 1, 1,
0.7747724, -2.330438, 2.750949, 0.627451, 0, 1, 1,
0.7773406, -0.1355817, 2.586151, 0.6313726, 0, 1, 1,
0.7810225, -0.3842195, 3.07976, 0.6392157, 0, 1, 1,
0.7848133, -0.5970647, 3.693774, 0.6431373, 0, 1, 1,
0.7870168, -0.9158476, 1.920771, 0.6509804, 0, 1, 1,
0.7883378, -0.1585728, 2.989349, 0.654902, 0, 1, 1,
0.7902651, -0.91411, 4.738225, 0.6627451, 0, 1, 1,
0.7934743, -0.5003273, 3.128968, 0.6666667, 0, 1, 1,
0.7968777, -0.08808837, 1.167921, 0.6745098, 0, 1, 1,
0.7990495, -0.07967203, 1.591931, 0.6784314, 0, 1, 1,
0.8047614, 0.263465, 0.5103737, 0.6862745, 0, 1, 1,
0.8165752, 0.09229159, 0.1929954, 0.6901961, 0, 1, 1,
0.8166394, -0.956521, 1.338903, 0.6980392, 0, 1, 1,
0.8174275, 1.055859, -0.7407463, 0.7058824, 0, 1, 1,
0.8177516, 1.855564, 0.4954217, 0.7098039, 0, 1, 1,
0.819726, 0.9663985, 1.582906, 0.7176471, 0, 1, 1,
0.8203924, -0.2903931, 1.713437, 0.7215686, 0, 1, 1,
0.8295961, 0.8391395, 2.349101, 0.7294118, 0, 1, 1,
0.8308308, 0.04290273, 0.1659847, 0.7333333, 0, 1, 1,
0.8431688, -1.232471, 2.659832, 0.7411765, 0, 1, 1,
0.8437594, 0.4713624, 1.599868, 0.7450981, 0, 1, 1,
0.8445674, -0.02379614, 1.908748, 0.7529412, 0, 1, 1,
0.8505387, 0.5781389, 2.119388, 0.7568628, 0, 1, 1,
0.8521205, 1.022859, 0.3105712, 0.7647059, 0, 1, 1,
0.8524583, -2.625222, 2.777173, 0.7686275, 0, 1, 1,
0.8538988, 0.6326261, -0.931741, 0.7764706, 0, 1, 1,
0.8549248, -0.3518332, 3.025796, 0.7803922, 0, 1, 1,
0.8663821, 1.748878, 1.308069, 0.7882353, 0, 1, 1,
0.869864, 1.410425, 1.229123, 0.7921569, 0, 1, 1,
0.8726341, -0.09681836, 2.859869, 0.8, 0, 1, 1,
0.8735253, -1.374775, 1.396051, 0.8078431, 0, 1, 1,
0.8747001, -1.175706, 2.090295, 0.8117647, 0, 1, 1,
0.8771194, 0.4953218, -1.858739, 0.8196079, 0, 1, 1,
0.8843886, 2.43259, -0.2377278, 0.8235294, 0, 1, 1,
0.885955, 1.253626, -0.1884507, 0.8313726, 0, 1, 1,
0.8879086, 1.550533, -2.198262, 0.8352941, 0, 1, 1,
0.8904577, -1.070018, 2.960143, 0.8431373, 0, 1, 1,
0.8942567, -0.4227374, 1.22796, 0.8470588, 0, 1, 1,
0.9098977, 0.2905262, 1.994664, 0.854902, 0, 1, 1,
0.9104435, -0.5921217, 1.756971, 0.8588235, 0, 1, 1,
0.9125519, -1.994578, 1.306192, 0.8666667, 0, 1, 1,
0.9128495, -0.4870861, 1.783133, 0.8705882, 0, 1, 1,
0.9148962, 1.361301, 0.08940038, 0.8784314, 0, 1, 1,
0.9178151, 0.7901368, 1.70156, 0.8823529, 0, 1, 1,
0.9203663, -0.7335016, 1.51466, 0.8901961, 0, 1, 1,
0.9297507, -1.394071, 1.197903, 0.8941177, 0, 1, 1,
0.9299092, -0.8333477, 2.584182, 0.9019608, 0, 1, 1,
0.9336866, 0.9585992, 0.05812583, 0.9098039, 0, 1, 1,
0.9393985, -1.365812, 3.496779, 0.9137255, 0, 1, 1,
0.9429288, 0.6012658, 2.329443, 0.9215686, 0, 1, 1,
0.9574297, -0.9106225, 2.788286, 0.9254902, 0, 1, 1,
0.9584229, -0.6189857, 1.052949, 0.9333333, 0, 1, 1,
0.9594532, 2.933535, -1.211406, 0.9372549, 0, 1, 1,
0.9659457, 1.409137, -0.2849186, 0.945098, 0, 1, 1,
0.9674925, 2.7191, -0.4023229, 0.9490196, 0, 1, 1,
0.9698242, 0.1558105, 1.378466, 0.9568627, 0, 1, 1,
0.9699679, -1.223626, 2.686057, 0.9607843, 0, 1, 1,
0.9711019, -2.151141, 2.420366, 0.9686275, 0, 1, 1,
0.9723409, -1.16488, 2.684225, 0.972549, 0, 1, 1,
0.972362, 1.784254, 1.517931, 0.9803922, 0, 1, 1,
0.9729065, -2.55605, 1.20753, 0.9843137, 0, 1, 1,
0.9737595, 0.4943843, 1.269748, 0.9921569, 0, 1, 1,
0.9780591, 0.3543936, -0.03891988, 0.9960784, 0, 1, 1,
0.981997, 0.8121547, 1.319367, 1, 0, 0.9960784, 1,
0.9831067, -1.071199, 2.734988, 1, 0, 0.9882353, 1,
0.9851974, -0.9511513, 3.417442, 1, 0, 0.9843137, 1,
0.986416, 0.1977554, 0.4814295, 1, 0, 0.9764706, 1,
0.9867001, -0.1601675, -0.000296317, 1, 0, 0.972549, 1,
0.9977377, 0.3218308, 0.302298, 1, 0, 0.9647059, 1,
1.000587, -1.458745, 1.400775, 1, 0, 0.9607843, 1,
1.005023, 0.3839797, 0.9554309, 1, 0, 0.9529412, 1,
1.00756, 0.1382324, 1.330281, 1, 0, 0.9490196, 1,
1.010694, -0.5520842, 2.508672, 1, 0, 0.9411765, 1,
1.019034, 0.6928591, 2.267505, 1, 0, 0.9372549, 1,
1.019572, -0.5117013, 1.862168, 1, 0, 0.9294118, 1,
1.027282, -0.3014721, 2.26848, 1, 0, 0.9254902, 1,
1.028783, 0.9058456, 1.642227, 1, 0, 0.9176471, 1,
1.042055, -0.795021, 0.7911717, 1, 0, 0.9137255, 1,
1.050819, -1.039236, 3.957114, 1, 0, 0.9058824, 1,
1.052441, -0.3477075, 2.944767, 1, 0, 0.9019608, 1,
1.057376, 0.3049971, 1.421938, 1, 0, 0.8941177, 1,
1.062425, -0.3163508, 2.127167, 1, 0, 0.8862745, 1,
1.066635, -0.2750399, 1.493371, 1, 0, 0.8823529, 1,
1.068758, 0.311526, 2.856042, 1, 0, 0.8745098, 1,
1.070145, 1.703476, 0.4285686, 1, 0, 0.8705882, 1,
1.07063, -0.2113567, 0.9742237, 1, 0, 0.8627451, 1,
1.074087, 0.1084374, 2.158622, 1, 0, 0.8588235, 1,
1.074919, 1.892825, 0.6965322, 1, 0, 0.8509804, 1,
1.09587, 2.266336, 0.7615513, 1, 0, 0.8470588, 1,
1.09642, -0.199788, 3.198838, 1, 0, 0.8392157, 1,
1.097666, -0.6585715, 3.387289, 1, 0, 0.8352941, 1,
1.100059, -0.2922699, 3.121038, 1, 0, 0.827451, 1,
1.100682, -0.351951, 2.52253, 1, 0, 0.8235294, 1,
1.103532, -0.4478671, 0.9569598, 1, 0, 0.8156863, 1,
1.10672, 0.8798194, 0.3464124, 1, 0, 0.8117647, 1,
1.115278, -0.1826855, 1.293608, 1, 0, 0.8039216, 1,
1.117063, -1.254029, 1.768997, 1, 0, 0.7960784, 1,
1.135174, 0.9625558, 0.5500515, 1, 0, 0.7921569, 1,
1.143526, 1.443073, 2.793604, 1, 0, 0.7843137, 1,
1.144559, -0.4124217, 2.336646, 1, 0, 0.7803922, 1,
1.147319, 0.4470196, 1.394987, 1, 0, 0.772549, 1,
1.150915, -1.280625, 2.11357, 1, 0, 0.7686275, 1,
1.154465, -0.4228478, 2.38518, 1, 0, 0.7607843, 1,
1.157198, -0.7824455, 3.967574, 1, 0, 0.7568628, 1,
1.161931, -1.80622, 3.585702, 1, 0, 0.7490196, 1,
1.169776, 0.4765081, 1.720408, 1, 0, 0.7450981, 1,
1.178636, 1.494306, 0.8556525, 1, 0, 0.7372549, 1,
1.181605, -0.3932092, 0.9030752, 1, 0, 0.7333333, 1,
1.185874, 0.3622113, 1.883048, 1, 0, 0.7254902, 1,
1.186056, 0.6210127, 0.1758199, 1, 0, 0.7215686, 1,
1.188439, -1.21399, 1.702983, 1, 0, 0.7137255, 1,
1.214956, -0.4689842, 2.175785, 1, 0, 0.7098039, 1,
1.227473, 1.203328, -0.03866705, 1, 0, 0.7019608, 1,
1.228561, 1.30021, 0.6653725, 1, 0, 0.6941177, 1,
1.24548, 1.021012, 1.806506, 1, 0, 0.6901961, 1,
1.249725, 0.4643966, 0.9018466, 1, 0, 0.682353, 1,
1.250956, -0.2385229, 2.621375, 1, 0, 0.6784314, 1,
1.25385, -0.9948953, 1.780965, 1, 0, 0.6705883, 1,
1.254199, 1.034289, 1.408325, 1, 0, 0.6666667, 1,
1.254598, 1.045772, 0.3254603, 1, 0, 0.6588235, 1,
1.255704, 0.2724352, 2.510376, 1, 0, 0.654902, 1,
1.259867, -1.311788, 3.219095, 1, 0, 0.6470588, 1,
1.261166, -0.1702198, 2.167297, 1, 0, 0.6431373, 1,
1.263751, -1.400187, 2.026521, 1, 0, 0.6352941, 1,
1.272515, 1.849973, 0.5908996, 1, 0, 0.6313726, 1,
1.2735, -0.7082371, 0.1074175, 1, 0, 0.6235294, 1,
1.277013, 0.1616092, 0.9796988, 1, 0, 0.6196079, 1,
1.283833, -1.567961, 4.09417, 1, 0, 0.6117647, 1,
1.28407, -1.330391, 0.8822247, 1, 0, 0.6078432, 1,
1.297273, 0.2984672, 2.267563, 1, 0, 0.6, 1,
1.302095, 0.6880506, 1.703015, 1, 0, 0.5921569, 1,
1.30873, -0.4312362, 1.619758, 1, 0, 0.5882353, 1,
1.323434, 0.215693, 1.804602, 1, 0, 0.5803922, 1,
1.324838, -2.187122, 3.16231, 1, 0, 0.5764706, 1,
1.330681, -1.323059, 1.310622, 1, 0, 0.5686275, 1,
1.330685, 0.400759, 1.485559, 1, 0, 0.5647059, 1,
1.354449, 1.344385, 1.605785, 1, 0, 0.5568628, 1,
1.369129, -0.8571773, 1.658171, 1, 0, 0.5529412, 1,
1.371775, -0.9271943, 2.205061, 1, 0, 0.5450981, 1,
1.381399, 1.861683, -0.4952109, 1, 0, 0.5411765, 1,
1.394415, 0.4731339, 0.746423, 1, 0, 0.5333334, 1,
1.395581, 0.04508212, 0.661299, 1, 0, 0.5294118, 1,
1.406259, -0.7903659, 0.5565322, 1, 0, 0.5215687, 1,
1.408115, 0.09784972, 1.782693, 1, 0, 0.5176471, 1,
1.426859, 0.5641659, 1.642618, 1, 0, 0.509804, 1,
1.429109, 1.201399, 0.001351491, 1, 0, 0.5058824, 1,
1.434196, -0.4774345, 2.01777, 1, 0, 0.4980392, 1,
1.438628, -0.9654132, 1.806595, 1, 0, 0.4901961, 1,
1.44285, 0.7225042, 3.061526, 1, 0, 0.4862745, 1,
1.44933, 0.2125922, 1.257431, 1, 0, 0.4784314, 1,
1.452338, 0.7656892, 2.145632, 1, 0, 0.4745098, 1,
1.473917, 0.70847, -0.8655226, 1, 0, 0.4666667, 1,
1.475608, -2.640492, 4.456409, 1, 0, 0.4627451, 1,
1.48493, -0.9785637, 0.4563632, 1, 0, 0.454902, 1,
1.49999, 0.8473246, 2.115912, 1, 0, 0.4509804, 1,
1.530285, 2.338871, 1.59073, 1, 0, 0.4431373, 1,
1.533247, -0.461544, 1.975479, 1, 0, 0.4392157, 1,
1.534296, 2.607187, 0.5651839, 1, 0, 0.4313726, 1,
1.542065, 0.6902326, 1.661131, 1, 0, 0.427451, 1,
1.549524, -0.7253424, 3.325328, 1, 0, 0.4196078, 1,
1.550494, -0.5570313, 2.108611, 1, 0, 0.4156863, 1,
1.554884, 0.2163816, 2.053753, 1, 0, 0.4078431, 1,
1.560687, -2.038058, 3.217537, 1, 0, 0.4039216, 1,
1.56474, 0.2490756, 4.409532, 1, 0, 0.3960784, 1,
1.576284, -0.4187467, 0.05913607, 1, 0, 0.3882353, 1,
1.582426, 0.7015887, -0.3308591, 1, 0, 0.3843137, 1,
1.586145, -1.216698, 2.003234, 1, 0, 0.3764706, 1,
1.58899, 0.3755703, 2.531909, 1, 0, 0.372549, 1,
1.590886, -0.9638351, 3.590502, 1, 0, 0.3647059, 1,
1.595973, 1.371634, 1.082593, 1, 0, 0.3607843, 1,
1.597388, -0.7184796, 1.11235, 1, 0, 0.3529412, 1,
1.603376, -0.4565399, 1.900567, 1, 0, 0.3490196, 1,
1.609796, 0.7051815, -0.198417, 1, 0, 0.3411765, 1,
1.611507, -1.885657, 0.9573169, 1, 0, 0.3372549, 1,
1.641549, 0.1685937, 1.534401, 1, 0, 0.3294118, 1,
1.678313, 0.8157116, -0.8090532, 1, 0, 0.3254902, 1,
1.686707, -1.281693, 3.27944, 1, 0, 0.3176471, 1,
1.694052, 2.079072, 0.154195, 1, 0, 0.3137255, 1,
1.694526, -1.058704, 1.691916, 1, 0, 0.3058824, 1,
1.706673, -1.654944, 3.60766, 1, 0, 0.2980392, 1,
1.708146, 0.9451684, 0.3793412, 1, 0, 0.2941177, 1,
1.713097, 0.4268429, 3.977639, 1, 0, 0.2862745, 1,
1.723721, -0.3627005, 0.3414685, 1, 0, 0.282353, 1,
1.729857, 1.224986, 0.5460069, 1, 0, 0.2745098, 1,
1.76278, 0.349204, -0.750173, 1, 0, 0.2705882, 1,
1.768948, 1.281635, 1.53623, 1, 0, 0.2627451, 1,
1.78233, -0.2336994, 2.59768, 1, 0, 0.2588235, 1,
1.816961, -0.6268417, 0.4979383, 1, 0, 0.2509804, 1,
1.820794, -0.7534978, 0.3145522, 1, 0, 0.2470588, 1,
1.84558, 1.725163, -0.04527588, 1, 0, 0.2392157, 1,
1.869418, -0.5504124, 1.562991, 1, 0, 0.2352941, 1,
1.901888, 0.06785182, 0.4756229, 1, 0, 0.227451, 1,
1.904619, 0.7827604, 2.813263, 1, 0, 0.2235294, 1,
1.905411, 0.06992624, 1.438103, 1, 0, 0.2156863, 1,
1.938768, -1.11782, 3.265727, 1, 0, 0.2117647, 1,
1.959169, -0.7368044, 2.286698, 1, 0, 0.2039216, 1,
1.95936, 0.04549716, 1.182475, 1, 0, 0.1960784, 1,
1.966195, -1.462534, 3.473737, 1, 0, 0.1921569, 1,
1.969919, -0.8450472, 1.405661, 1, 0, 0.1843137, 1,
2.003123, -1.048308, 1.509444, 1, 0, 0.1803922, 1,
2.005641, -0.5671856, 1.298264, 1, 0, 0.172549, 1,
2.012152, 0.02233922, 1.276212, 1, 0, 0.1686275, 1,
2.031598, -0.811848, 1.140424, 1, 0, 0.1607843, 1,
2.047945, -0.2435374, 1.152897, 1, 0, 0.1568628, 1,
2.054343, 1.255367, 0.6138956, 1, 0, 0.1490196, 1,
2.06106, 1.613439, 1.503232, 1, 0, 0.145098, 1,
2.076882, -0.4269137, 2.551803, 1, 0, 0.1372549, 1,
2.094777, 1.067843, 0.7197587, 1, 0, 0.1333333, 1,
2.150815, 1.195486, 1.426604, 1, 0, 0.1254902, 1,
2.158206, 0.3354388, 1.00882, 1, 0, 0.1215686, 1,
2.159724, 0.532099, 1.364772, 1, 0, 0.1137255, 1,
2.196767, -0.6304309, 2.854786, 1, 0, 0.1098039, 1,
2.243412, -0.4136655, -0.3908681, 1, 0, 0.1019608, 1,
2.270663, -1.458189, 3.678597, 1, 0, 0.09411765, 1,
2.296761, -0.815872, 3.794564, 1, 0, 0.09019608, 1,
2.310968, 0.7022595, 1.180434, 1, 0, 0.08235294, 1,
2.330625, -0.8078808, 1.366489, 1, 0, 0.07843138, 1,
2.335923, -1.533775, 1.675303, 1, 0, 0.07058824, 1,
2.340585, 0.3158965, 1.628425, 1, 0, 0.06666667, 1,
2.353412, 0.6080619, 2.227057, 1, 0, 0.05882353, 1,
2.439044, -0.9992562, 2.68311, 1, 0, 0.05490196, 1,
2.603476, 0.2139303, 1.967703, 1, 0, 0.04705882, 1,
2.678169, 1.213372, -0.1740374, 1, 0, 0.04313726, 1,
2.714332, -0.1318821, 2.716142, 1, 0, 0.03529412, 1,
2.969312, 1.38185, 0.2178612, 1, 0, 0.03137255, 1,
3.029109, 2.772157, 0.9193046, 1, 0, 0.02352941, 1,
3.262187, -0.2871628, 1.15694, 1, 0, 0.01960784, 1,
3.341314, 1.091388, 2.278837, 1, 0, 0.01176471, 1,
3.465561, 2.815893, 1.121132, 1, 0, 0.007843138, 1
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
0.2373445, -3.925224, -7.028042, 0, -0.5, 0.5, 0.5,
0.2373445, -3.925224, -7.028042, 1, -0.5, 0.5, 0.5,
0.2373445, -3.925224, -7.028042, 1, 1.5, 0.5, 0.5,
0.2373445, -3.925224, -7.028042, 0, 1.5, 0.5, 0.5
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
-4.085238, 0.001188517, -7.028042, 0, -0.5, 0.5, 0.5,
-4.085238, 0.001188517, -7.028042, 1, -0.5, 0.5, 0.5,
-4.085238, 0.001188517, -7.028042, 1, 1.5, 0.5, 0.5,
-4.085238, 0.001188517, -7.028042, 0, 1.5, 0.5, 0.5
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
-4.085238, -3.925224, -0.1928535, 0, -0.5, 0.5, 0.5,
-4.085238, -3.925224, -0.1928535, 1, -0.5, 0.5, 0.5,
-4.085238, -3.925224, -0.1928535, 1, 1.5, 0.5, 0.5,
-4.085238, -3.925224, -0.1928535, 0, 1.5, 0.5, 0.5
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
-2, -3.019129, -5.450691,
3, -3.019129, -5.450691,
-2, -3.019129, -5.450691,
-2, -3.170145, -5.713583,
-1, -3.019129, -5.450691,
-1, -3.170145, -5.713583,
0, -3.019129, -5.450691,
0, -3.170145, -5.713583,
1, -3.019129, -5.450691,
1, -3.170145, -5.713583,
2, -3.019129, -5.450691,
2, -3.170145, -5.713583,
3, -3.019129, -5.450691,
3, -3.170145, -5.713583
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
-2, -3.472176, -6.239366, 0, -0.5, 0.5, 0.5,
-2, -3.472176, -6.239366, 1, -0.5, 0.5, 0.5,
-2, -3.472176, -6.239366, 1, 1.5, 0.5, 0.5,
-2, -3.472176, -6.239366, 0, 1.5, 0.5, 0.5,
-1, -3.472176, -6.239366, 0, -0.5, 0.5, 0.5,
-1, -3.472176, -6.239366, 1, -0.5, 0.5, 0.5,
-1, -3.472176, -6.239366, 1, 1.5, 0.5, 0.5,
-1, -3.472176, -6.239366, 0, 1.5, 0.5, 0.5,
0, -3.472176, -6.239366, 0, -0.5, 0.5, 0.5,
0, -3.472176, -6.239366, 1, -0.5, 0.5, 0.5,
0, -3.472176, -6.239366, 1, 1.5, 0.5, 0.5,
0, -3.472176, -6.239366, 0, 1.5, 0.5, 0.5,
1, -3.472176, -6.239366, 0, -0.5, 0.5, 0.5,
1, -3.472176, -6.239366, 1, -0.5, 0.5, 0.5,
1, -3.472176, -6.239366, 1, 1.5, 0.5, 0.5,
1, -3.472176, -6.239366, 0, 1.5, 0.5, 0.5,
2, -3.472176, -6.239366, 0, -0.5, 0.5, 0.5,
2, -3.472176, -6.239366, 1, -0.5, 0.5, 0.5,
2, -3.472176, -6.239366, 1, 1.5, 0.5, 0.5,
2, -3.472176, -6.239366, 0, 1.5, 0.5, 0.5,
3, -3.472176, -6.239366, 0, -0.5, 0.5, 0.5,
3, -3.472176, -6.239366, 1, -0.5, 0.5, 0.5,
3, -3.472176, -6.239366, 1, 1.5, 0.5, 0.5,
3, -3.472176, -6.239366, 0, 1.5, 0.5, 0.5
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
-3.087719, -2, -5.450691,
-3.087719, 2, -5.450691,
-3.087719, -2, -5.450691,
-3.253972, -2, -5.713583,
-3.087719, -1, -5.450691,
-3.253972, -1, -5.713583,
-3.087719, 0, -5.450691,
-3.253972, 0, -5.713583,
-3.087719, 1, -5.450691,
-3.253972, 1, -5.713583,
-3.087719, 2, -5.450691,
-3.253972, 2, -5.713583
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
-3.586478, -2, -6.239366, 0, -0.5, 0.5, 0.5,
-3.586478, -2, -6.239366, 1, -0.5, 0.5, 0.5,
-3.586478, -2, -6.239366, 1, 1.5, 0.5, 0.5,
-3.586478, -2, -6.239366, 0, 1.5, 0.5, 0.5,
-3.586478, -1, -6.239366, 0, -0.5, 0.5, 0.5,
-3.586478, -1, -6.239366, 1, -0.5, 0.5, 0.5,
-3.586478, -1, -6.239366, 1, 1.5, 0.5, 0.5,
-3.586478, -1, -6.239366, 0, 1.5, 0.5, 0.5,
-3.586478, 0, -6.239366, 0, -0.5, 0.5, 0.5,
-3.586478, 0, -6.239366, 1, -0.5, 0.5, 0.5,
-3.586478, 0, -6.239366, 1, 1.5, 0.5, 0.5,
-3.586478, 0, -6.239366, 0, 1.5, 0.5, 0.5,
-3.586478, 1, -6.239366, 0, -0.5, 0.5, 0.5,
-3.586478, 1, -6.239366, 1, -0.5, 0.5, 0.5,
-3.586478, 1, -6.239366, 1, 1.5, 0.5, 0.5,
-3.586478, 1, -6.239366, 0, 1.5, 0.5, 0.5,
-3.586478, 2, -6.239366, 0, -0.5, 0.5, 0.5,
-3.586478, 2, -6.239366, 1, -0.5, 0.5, 0.5,
-3.586478, 2, -6.239366, 1, 1.5, 0.5, 0.5,
-3.586478, 2, -6.239366, 0, 1.5, 0.5, 0.5
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
-3.087719, -3.019129, -4,
-3.087719, -3.019129, 4,
-3.087719, -3.019129, -4,
-3.253972, -3.170145, -4,
-3.087719, -3.019129, -2,
-3.253972, -3.170145, -2,
-3.087719, -3.019129, 0,
-3.253972, -3.170145, 0,
-3.087719, -3.019129, 2,
-3.253972, -3.170145, 2,
-3.087719, -3.019129, 4,
-3.253972, -3.170145, 4
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
-3.586478, -3.472176, -4, 0, -0.5, 0.5, 0.5,
-3.586478, -3.472176, -4, 1, -0.5, 0.5, 0.5,
-3.586478, -3.472176, -4, 1, 1.5, 0.5, 0.5,
-3.586478, -3.472176, -4, 0, 1.5, 0.5, 0.5,
-3.586478, -3.472176, -2, 0, -0.5, 0.5, 0.5,
-3.586478, -3.472176, -2, 1, -0.5, 0.5, 0.5,
-3.586478, -3.472176, -2, 1, 1.5, 0.5, 0.5,
-3.586478, -3.472176, -2, 0, 1.5, 0.5, 0.5,
-3.586478, -3.472176, 0, 0, -0.5, 0.5, 0.5,
-3.586478, -3.472176, 0, 1, -0.5, 0.5, 0.5,
-3.586478, -3.472176, 0, 1, 1.5, 0.5, 0.5,
-3.586478, -3.472176, 0, 0, 1.5, 0.5, 0.5,
-3.586478, -3.472176, 2, 0, -0.5, 0.5, 0.5,
-3.586478, -3.472176, 2, 1, -0.5, 0.5, 0.5,
-3.586478, -3.472176, 2, 1, 1.5, 0.5, 0.5,
-3.586478, -3.472176, 2, 0, 1.5, 0.5, 0.5,
-3.586478, -3.472176, 4, 0, -0.5, 0.5, 0.5,
-3.586478, -3.472176, 4, 1, -0.5, 0.5, 0.5,
-3.586478, -3.472176, 4, 1, 1.5, 0.5, 0.5,
-3.586478, -3.472176, 4, 0, 1.5, 0.5, 0.5
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
-3.087719, -3.019129, -5.450691,
-3.087719, 3.021506, -5.450691,
-3.087719, -3.019129, 5.064984,
-3.087719, 3.021506, 5.064984,
-3.087719, -3.019129, -5.450691,
-3.087719, -3.019129, 5.064984,
-3.087719, 3.021506, -5.450691,
-3.087719, 3.021506, 5.064984,
-3.087719, -3.019129, -5.450691,
3.562408, -3.019129, -5.450691,
-3.087719, -3.019129, 5.064984,
3.562408, -3.019129, 5.064984,
-3.087719, 3.021506, -5.450691,
3.562408, 3.021506, -5.450691,
-3.087719, 3.021506, 5.064984,
3.562408, 3.021506, 5.064984,
3.562408, -3.019129, -5.450691,
3.562408, 3.021506, -5.450691,
3.562408, -3.019129, 5.064984,
3.562408, 3.021506, 5.064984,
3.562408, -3.019129, -5.450691,
3.562408, -3.019129, 5.064984,
3.562408, 3.021506, -5.450691,
3.562408, 3.021506, 5.064984
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
var radius = 7.385414;
var distance = 32.85854;
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
mvMatrix.translate( -0.2373445, -0.001188517, 0.1928535 );
mvMatrix.scale( 1.200767, 1.321923, 0.7593668 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.85854);
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
triazole-1-propaneni<-read.table("triazole-1-propaneni.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triazole-1-propaneni$V2
```

```
## Error in eval(expr, envir, enclos): object 'triazole' not found
```

```r
y<-triazole-1-propaneni$V3
```

```
## Error in eval(expr, envir, enclos): object 'triazole' not found
```

```r
z<-triazole-1-propaneni$V4
```

```
## Error in eval(expr, envir, enclos): object 'triazole' not found
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
-2.990872, 0.292649, -2.114242, 0, 0, 1, 1, 1,
-2.791015, 0.03616697, -1.922502, 1, 0, 0, 1, 1,
-2.699235, -0.6270802, -2.357111, 1, 0, 0, 1, 1,
-2.649749, -0.03253788, -0.5907879, 1, 0, 0, 1, 1,
-2.595432, 0.4316288, -0.6686954, 1, 0, 0, 1, 1,
-2.594454, -2.759959, -2.727218, 1, 0, 0, 1, 1,
-2.593046, 0.3786421, -0.284274, 0, 0, 0, 1, 1,
-2.509407, -1.45166, -0.7151809, 0, 0, 0, 1, 1,
-2.396384, -1.689257, -1.652086, 0, 0, 0, 1, 1,
-2.282301, 2.329924, -1.660339, 0, 0, 0, 1, 1,
-2.268904, 2.554505, -1.578926, 0, 0, 0, 1, 1,
-2.205864, 1.013982, -1.545803, 0, 0, 0, 1, 1,
-2.121164, -0.03378445, -2.381109, 0, 0, 0, 1, 1,
-2.107989, -0.5828388, -2.333288, 1, 1, 1, 1, 1,
-2.071105, -0.2017442, -0.9692284, 1, 1, 1, 1, 1,
-2.070074, -0.8822908, -1.958951, 1, 1, 1, 1, 1,
-2.043521, -1.007945, -2.696865, 1, 1, 1, 1, 1,
-2.038111, 0.1385448, -1.369263, 1, 1, 1, 1, 1,
-2.008795, 0.2465436, -1.137585, 1, 1, 1, 1, 1,
-2.002585, 0.737222, -0.3367032, 1, 1, 1, 1, 1,
-1.963107, 2.148303, -1.039721, 1, 1, 1, 1, 1,
-1.927648, -0.9701371, -3.769984, 1, 1, 1, 1, 1,
-1.893893, -1.627264, -3.018255, 1, 1, 1, 1, 1,
-1.870163, 0.1564992, -1.294041, 1, 1, 1, 1, 1,
-1.853546, 0.3102603, -1.909046, 1, 1, 1, 1, 1,
-1.838961, 0.1342144, -2.656567, 1, 1, 1, 1, 1,
-1.829806, 0.08100825, -1.960671, 1, 1, 1, 1, 1,
-1.774692, -0.3905902, -1.877735, 1, 1, 1, 1, 1,
-1.759465, -1.321979, -2.007863, 0, 0, 1, 1, 1,
-1.745367, 2.260689, -0.3116885, 1, 0, 0, 1, 1,
-1.70048, -1.426606, -1.23885, 1, 0, 0, 1, 1,
-1.689465, -0.238691, 0.5402536, 1, 0, 0, 1, 1,
-1.68873, -1.339503, -2.334414, 1, 0, 0, 1, 1,
-1.674933, 0.438135, -1.644863, 1, 0, 0, 1, 1,
-1.656639, 0.5987827, -1.649514, 0, 0, 0, 1, 1,
-1.640618, 0.5259156, 0.3651889, 0, 0, 0, 1, 1,
-1.633652, 1.635082, -0.2798952, 0, 0, 0, 1, 1,
-1.619816, 1.151873, -0.5508792, 0, 0, 0, 1, 1,
-1.618483, -1.823295, -2.72232, 0, 0, 0, 1, 1,
-1.595974, 1.419372, -0.6477745, 0, 0, 0, 1, 1,
-1.59286, -2.249005, -1.533765, 0, 0, 0, 1, 1,
-1.579872, 0.3923763, -0.6455419, 1, 1, 1, 1, 1,
-1.56563, -1.749888, -1.592834, 1, 1, 1, 1, 1,
-1.56452, 0.616126, -1.339536, 1, 1, 1, 1, 1,
-1.560388, 0.0323896, -1.658879, 1, 1, 1, 1, 1,
-1.555884, -0.6421448, -0.9320559, 1, 1, 1, 1, 1,
-1.541811, -2.916701, -4.075918, 1, 1, 1, 1, 1,
-1.533615, -2.017023, -3.906824, 1, 1, 1, 1, 1,
-1.519503, -0.914362, -2.517186, 1, 1, 1, 1, 1,
-1.504518, 0.01459771, -0.7425624, 1, 1, 1, 1, 1,
-1.503909, -0.1606607, -2.039645, 1, 1, 1, 1, 1,
-1.501421, -1.536477, -3.000962, 1, 1, 1, 1, 1,
-1.500087, 0.987229, -0.3899832, 1, 1, 1, 1, 1,
-1.481437, 0.4769477, -1.963441, 1, 1, 1, 1, 1,
-1.477002, 0.1013602, -1.942503, 1, 1, 1, 1, 1,
-1.464848, 1.356268, -2.306777, 1, 1, 1, 1, 1,
-1.457337, -1.240439, -2.003748, 0, 0, 1, 1, 1,
-1.448543, 1.079133, -0.4930725, 1, 0, 0, 1, 1,
-1.439952, 0.5172703, -1.558023, 1, 0, 0, 1, 1,
-1.434055, 0.659005, -0.3143201, 1, 0, 0, 1, 1,
-1.431988, 0.3717058, -2.487507, 1, 0, 0, 1, 1,
-1.423355, 0.2895865, -1.632543, 1, 0, 0, 1, 1,
-1.420143, -1.222364, -2.675838, 0, 0, 0, 1, 1,
-1.4105, 0.8951203, 0.4972362, 0, 0, 0, 1, 1,
-1.403753, 1.014663, -0.7405379, 0, 0, 0, 1, 1,
-1.384897, -1.451481, -1.92001, 0, 0, 0, 1, 1,
-1.383728, -0.6315992, -2.442601, 0, 0, 0, 1, 1,
-1.373291, 0.4235071, -0.7003478, 0, 0, 0, 1, 1,
-1.371443, 0.09610721, -2.767163, 0, 0, 0, 1, 1,
-1.369725, 0.3111813, -0.3324591, 1, 1, 1, 1, 1,
-1.36823, 0.843937, -2.533087, 1, 1, 1, 1, 1,
-1.357185, -0.7563962, -2.362663, 1, 1, 1, 1, 1,
-1.34874, 0.9475388, -0.7971865, 1, 1, 1, 1, 1,
-1.326678, -1.966765, -2.866979, 1, 1, 1, 1, 1,
-1.315111, -0.3756492, -2.07594, 1, 1, 1, 1, 1,
-1.313708, -1.948879, -1.65222, 1, 1, 1, 1, 1,
-1.300301, -0.6244647, -3.286878, 1, 1, 1, 1, 1,
-1.298917, 1.659907, -0.2798674, 1, 1, 1, 1, 1,
-1.29513, 1.597805, -1.691865, 1, 1, 1, 1, 1,
-1.28192, 0.1642722, -3.050061, 1, 1, 1, 1, 1,
-1.278814, -0.2123843, -1.84056, 1, 1, 1, 1, 1,
-1.276225, 0.1603199, -3.056157, 1, 1, 1, 1, 1,
-1.272611, 0.30935, -1.850091, 1, 1, 1, 1, 1,
-1.271687, 0.774962, 0.2053118, 1, 1, 1, 1, 1,
-1.268263, -0.1051614, -2.405927, 0, 0, 1, 1, 1,
-1.261421, -1.813406, -2.322773, 1, 0, 0, 1, 1,
-1.256611, -1.039215, -1.491767, 1, 0, 0, 1, 1,
-1.254811, 0.4932977, -1.638996, 1, 0, 0, 1, 1,
-1.221587, -0.7756912, -2.901826, 1, 0, 0, 1, 1,
-1.216336, 0.7630377, -1.034023, 1, 0, 0, 1, 1,
-1.213264, 0.588702, -2.66385, 0, 0, 0, 1, 1,
-1.199249, -1.003205, -1.699728, 0, 0, 0, 1, 1,
-1.183745, 0.1657849, -1.921775, 0, 0, 0, 1, 1,
-1.182249, 0.3352925, -0.9422283, 0, 0, 0, 1, 1,
-1.173101, -0.5538518, -0.280652, 0, 0, 0, 1, 1,
-1.168907, 0.8248662, -2.152193, 0, 0, 0, 1, 1,
-1.168637, 2.132839, -0.2041227, 0, 0, 0, 1, 1,
-1.166328, 0.4942961, -0.2946064, 1, 1, 1, 1, 1,
-1.162856, -0.6576365, -2.179362, 1, 1, 1, 1, 1,
-1.160927, 2.270953, -0.7369381, 1, 1, 1, 1, 1,
-1.154166, 0.5461776, -0.1921072, 1, 1, 1, 1, 1,
-1.147619, 0.5974405, 0.07150465, 1, 1, 1, 1, 1,
-1.139341, -1.056076, -3.803469, 1, 1, 1, 1, 1,
-1.135514, -0.1394874, 0.1236345, 1, 1, 1, 1, 1,
-1.134055, -0.1546451, -2.717286, 1, 1, 1, 1, 1,
-1.131588, -0.2229375, -1.832686, 1, 1, 1, 1, 1,
-1.130356, -0.3461036, -0.2267537, 1, 1, 1, 1, 1,
-1.129778, -0.9199836, -2.943149, 1, 1, 1, 1, 1,
-1.121311, -1.506075, -4.47958, 1, 1, 1, 1, 1,
-1.117615, 2.008782, -1.383049, 1, 1, 1, 1, 1,
-1.110314, -0.6882187, -1.471581, 1, 1, 1, 1, 1,
-1.108975, -1.347743, -3.63397, 1, 1, 1, 1, 1,
-1.108888, 0.7401269, -0.3768951, 0, 0, 1, 1, 1,
-1.106134, 0.3536923, -1.718496, 1, 0, 0, 1, 1,
-1.099115, 0.1916764, 1.324823, 1, 0, 0, 1, 1,
-1.097469, -0.3215705, -0.8051134, 1, 0, 0, 1, 1,
-1.097153, -0.6051258, -1.370828, 1, 0, 0, 1, 1,
-1.090941, 0.475888, 0.2687544, 1, 0, 0, 1, 1,
-1.081811, -1.640355, -4.59492, 0, 0, 0, 1, 1,
-1.071264, 0.3458474, -2.561004, 0, 0, 0, 1, 1,
-1.070689, 0.2897507, -1.184551, 0, 0, 0, 1, 1,
-1.069048, 1.041541, -2.244971, 0, 0, 0, 1, 1,
-1.068268, 0.2977229, -0.7577237, 0, 0, 0, 1, 1,
-1.065527, 1.359836, -0.8261565, 0, 0, 0, 1, 1,
-1.058161, 0.399943, -1.894947, 0, 0, 0, 1, 1,
-1.058113, -1.492282, -2.026732, 1, 1, 1, 1, 1,
-1.05356, -0.5475417, -2.03912, 1, 1, 1, 1, 1,
-1.04913, -0.6980905, -3.870782, 1, 1, 1, 1, 1,
-1.035866, 0.3575567, -0.3985316, 1, 1, 1, 1, 1,
-1.017058, -0.106376, -1.909259, 1, 1, 1, 1, 1,
-1.015473, 0.3967373, -0.7902771, 1, 1, 1, 1, 1,
-1.005388, -1.006061, -1.956102, 1, 1, 1, 1, 1,
-1.002223, -0.2857586, -3.187089, 1, 1, 1, 1, 1,
-0.9922209, 0.2395771, -2.279209, 1, 1, 1, 1, 1,
-0.9895674, -0.7216435, -0.178512, 1, 1, 1, 1, 1,
-0.9834201, -0.7802818, -2.122054, 1, 1, 1, 1, 1,
-0.9775545, 0.2581907, -2.783246, 1, 1, 1, 1, 1,
-0.9758324, 0.285324, -1.168236, 1, 1, 1, 1, 1,
-0.9757621, -2.047789, -2.295951, 1, 1, 1, 1, 1,
-0.9714826, 0.9284749, -0.5044111, 1, 1, 1, 1, 1,
-0.9706053, 0.3648397, -1.588385, 0, 0, 1, 1, 1,
-0.9679742, -0.2855601, -2.913075, 1, 0, 0, 1, 1,
-0.961103, -1.945846, -2.92975, 1, 0, 0, 1, 1,
-0.9505744, -1.407092, -2.844368, 1, 0, 0, 1, 1,
-0.9330787, -1.187279, -2.420074, 1, 0, 0, 1, 1,
-0.9326999, -0.8549756, -3.357503, 1, 0, 0, 1, 1,
-0.9303558, 0.9022631, -2.504, 0, 0, 0, 1, 1,
-0.9249293, 0.5506251, -3.079282, 0, 0, 0, 1, 1,
-0.9212443, 0.6327767, -1.653118, 0, 0, 0, 1, 1,
-0.9127812, -1.168446, -4.037076, 0, 0, 0, 1, 1,
-0.9127476, -0.9626101, -2.65755, 0, 0, 0, 1, 1,
-0.9111298, -0.9624885, -1.079995, 0, 0, 0, 1, 1,
-0.9025406, 0.1108899, -1.264468, 0, 0, 0, 1, 1,
-0.9010241, -1.384686, -3.469726, 1, 1, 1, 1, 1,
-0.8989456, -1.980658, -0.7675404, 1, 1, 1, 1, 1,
-0.8948393, 1.185506, 0.217838, 1, 1, 1, 1, 1,
-0.8941619, -1.376935, -2.705254, 1, 1, 1, 1, 1,
-0.8869924, -0.04036501, -2.577029, 1, 1, 1, 1, 1,
-0.8803264, -1.345104, -0.8941201, 1, 1, 1, 1, 1,
-0.8716486, -1.493136, -2.885151, 1, 1, 1, 1, 1,
-0.8587645, -0.6275318, -2.202978, 1, 1, 1, 1, 1,
-0.8544552, -0.3953272, -1.376296, 1, 1, 1, 1, 1,
-0.8490466, 0.1327169, -2.713212, 1, 1, 1, 1, 1,
-0.8454613, -0.3403383, -4.144165, 1, 1, 1, 1, 1,
-0.8426565, 1.448408, 0.03279737, 1, 1, 1, 1, 1,
-0.8396639, 0.9264283, -0.7240117, 1, 1, 1, 1, 1,
-0.8368427, 0.6445673, 0.9731143, 1, 1, 1, 1, 1,
-0.8305997, -0.8069208, -2.298828, 1, 1, 1, 1, 1,
-0.8284171, -0.2936236, -3.153576, 0, 0, 1, 1, 1,
-0.8276767, -0.08627183, -1.721565, 1, 0, 0, 1, 1,
-0.8240874, 0.4754639, -1.47325, 1, 0, 0, 1, 1,
-0.8234771, 0.2109833, -1.212048, 1, 0, 0, 1, 1,
-0.8218678, -0.6350752, -4.238335, 1, 0, 0, 1, 1,
-0.8211417, 0.4338349, -0.563082, 1, 0, 0, 1, 1,
-0.8185406, -0.4278784, -2.54912, 0, 0, 0, 1, 1,
-0.8179314, 0.2570344, -1.008608, 0, 0, 0, 1, 1,
-0.8099906, 0.1025224, -1.738147, 0, 0, 0, 1, 1,
-0.8052304, 0.3287774, -1.447434, 0, 0, 0, 1, 1,
-0.8050095, 0.7226259, 0.3461943, 0, 0, 0, 1, 1,
-0.8048756, 1.955251, 0.4047858, 0, 0, 0, 1, 1,
-0.7951801, 0.04225608, -2.363012, 0, 0, 0, 1, 1,
-0.7950307, 0.3594833, -3.08281, 1, 1, 1, 1, 1,
-0.7933381, 0.8651092, -0.04242424, 1, 1, 1, 1, 1,
-0.7909813, 0.5025416, -1.261604, 1, 1, 1, 1, 1,
-0.7875662, 2.847439, 0.8083881, 1, 1, 1, 1, 1,
-0.7875566, 0.130178, -0.7123583, 1, 1, 1, 1, 1,
-0.7858839, 1.38516, -0.2751437, 1, 1, 1, 1, 1,
-0.7844874, -0.8071483, -2.412183, 1, 1, 1, 1, 1,
-0.782941, -0.8212253, -1.369741, 1, 1, 1, 1, 1,
-0.7823032, 0.09469007, -1.96277, 1, 1, 1, 1, 1,
-0.7765383, -0.8963696, -1.673488, 1, 1, 1, 1, 1,
-0.7760565, -0.9365321, -2.194587, 1, 1, 1, 1, 1,
-0.7683975, -0.1924781, -0.8950275, 1, 1, 1, 1, 1,
-0.7554408, -1.436326, -4.737757, 1, 1, 1, 1, 1,
-0.7548735, -1.107382, -3.068277, 1, 1, 1, 1, 1,
-0.7544793, -0.8131449, -2.226838, 1, 1, 1, 1, 1,
-0.752227, -1.793768, -3.547352, 0, 0, 1, 1, 1,
-0.7499555, 0.08690318, -2.552079, 1, 0, 0, 1, 1,
-0.7471699, 0.5394827, -1.161311, 1, 0, 0, 1, 1,
-0.7462435, 0.623641, 0.4202389, 1, 0, 0, 1, 1,
-0.746215, 0.1091597, 0.04834165, 1, 0, 0, 1, 1,
-0.745789, -0.06400423, -0.3132488, 1, 0, 0, 1, 1,
-0.7455057, 0.9261157, -0.9248434, 0, 0, 0, 1, 1,
-0.7421023, 1.742873, -0.702038, 0, 0, 0, 1, 1,
-0.7376327, 1.035805, 0.5301501, 0, 0, 0, 1, 1,
-0.7370674, -0.7380712, -1.550698, 0, 0, 0, 1, 1,
-0.7344139, -1.273753, -0.6689218, 0, 0, 0, 1, 1,
-0.7341991, -0.6278356, -1.739344, 0, 0, 0, 1, 1,
-0.7339761, -0.3741378, -2.39993, 0, 0, 0, 1, 1,
-0.7322984, 1.373049, -1.125111, 1, 1, 1, 1, 1,
-0.7309664, -1.421669, -2.993972, 1, 1, 1, 1, 1,
-0.7281562, 0.4004225, -1.651018, 1, 1, 1, 1, 1,
-0.7257538, -0.4981448, -3.232045, 1, 1, 1, 1, 1,
-0.7103655, -0.1796663, -0.6781887, 1, 1, 1, 1, 1,
-0.7085019, 0.2338861, -1.129688, 1, 1, 1, 1, 1,
-0.7081183, -0.3625946, -2.105865, 1, 1, 1, 1, 1,
-0.7059824, 0.3714423, -0.8075218, 1, 1, 1, 1, 1,
-0.6999735, -2.026906, -2.767492, 1, 1, 1, 1, 1,
-0.6983477, 0.8245724, 0.7970253, 1, 1, 1, 1, 1,
-0.6928955, -0.2667173, -2.247114, 1, 1, 1, 1, 1,
-0.6854562, 0.1845971, -1.546144, 1, 1, 1, 1, 1,
-0.6844022, 0.3083306, -0.9100892, 1, 1, 1, 1, 1,
-0.6819208, -1.189691, -3.298182, 1, 1, 1, 1, 1,
-0.6785309, 0.2735885, -2.291082, 1, 1, 1, 1, 1,
-0.6598125, -0.4529887, -0.6391774, 0, 0, 1, 1, 1,
-0.65767, 0.6669817, 0.4416317, 1, 0, 0, 1, 1,
-0.6552434, -0.07560918, -1.896863, 1, 0, 0, 1, 1,
-0.651284, -0.6109944, -2.883744, 1, 0, 0, 1, 1,
-0.646869, -0.6466096, -1.561351, 1, 0, 0, 1, 1,
-0.6445087, -0.09789101, -2.931834, 1, 0, 0, 1, 1,
-0.6443371, 0.526185, 1.035759, 0, 0, 0, 1, 1,
-0.6422638, 1.515145, 0.2291832, 0, 0, 0, 1, 1,
-0.6406083, -0.8878003, -3.233855, 0, 0, 0, 1, 1,
-0.6405995, -1.288629, -2.92151, 0, 0, 0, 1, 1,
-0.6389076, 0.2886427, -1.341915, 0, 0, 0, 1, 1,
-0.6282675, -0.2998166, -1.071256, 0, 0, 0, 1, 1,
-0.6118059, 0.9927844, -0.748495, 0, 0, 0, 1, 1,
-0.6082014, -1.751093, -2.145081, 1, 1, 1, 1, 1,
-0.6065069, 0.5714056, -0.6013155, 1, 1, 1, 1, 1,
-0.600476, 0.05789755, -0.7742133, 1, 1, 1, 1, 1,
-0.5978375, -1.243444, -4.143423, 1, 1, 1, 1, 1,
-0.5965689, 0.3947737, -2.412696, 1, 1, 1, 1, 1,
-0.5946425, -0.05223363, -0.5096176, 1, 1, 1, 1, 1,
-0.5894021, 0.7977499, 0.4462483, 1, 1, 1, 1, 1,
-0.5882003, -1.11922, -2.980869, 1, 1, 1, 1, 1,
-0.5874499, 2.381539, -0.06068052, 1, 1, 1, 1, 1,
-0.5870048, 1.98463, -1.126204, 1, 1, 1, 1, 1,
-0.5863315, -0.8468342, -0.3378217, 1, 1, 1, 1, 1,
-0.5861469, -0.2007767, -1.934411, 1, 1, 1, 1, 1,
-0.585366, 0.6943012, 0.544524, 1, 1, 1, 1, 1,
-0.5827187, 1.61027, -2.595523, 1, 1, 1, 1, 1,
-0.5821215, 0.2246623, -1.937443, 1, 1, 1, 1, 1,
-0.5801045, 0.1155149, -1.028188, 0, 0, 1, 1, 1,
-0.5718017, -1.149904, -2.470678, 1, 0, 0, 1, 1,
-0.5711626, -0.9496924, -1.375188, 1, 0, 0, 1, 1,
-0.5710039, -2.062945, -2.361645, 1, 0, 0, 1, 1,
-0.5614166, 0.8136182, 0.270051, 1, 0, 0, 1, 1,
-0.5610986, -0.8318467, -0.3422473, 1, 0, 0, 1, 1,
-0.5604862, 1.739478, 0.7636691, 0, 0, 0, 1, 1,
-0.5598211, 1.988154, -0.6327448, 0, 0, 0, 1, 1,
-0.5414563, -0.6197793, -2.412981, 0, 0, 0, 1, 1,
-0.5337319, 0.4480508, -2.521842, 0, 0, 0, 1, 1,
-0.5313522, -0.4269512, -2.061129, 0, 0, 0, 1, 1,
-0.5248695, 0.4442082, -1.585451, 0, 0, 0, 1, 1,
-0.5187625, 1.078421, -1.056126, 0, 0, 0, 1, 1,
-0.5174788, -0.4967671, -2.396618, 1, 1, 1, 1, 1,
-0.516355, 1.101611, 0.8282175, 1, 1, 1, 1, 1,
-0.5153414, 0.004547027, -3.149818, 1, 1, 1, 1, 1,
-0.5152647, -0.913109, -2.725086, 1, 1, 1, 1, 1,
-0.5094114, -1.466732, -4.005652, 1, 1, 1, 1, 1,
-0.5091668, -1.020412, -2.231137, 1, 1, 1, 1, 1,
-0.5046529, -0.5301474, -1.815918, 1, 1, 1, 1, 1,
-0.5041812, -0.4127734, -0.5542192, 1, 1, 1, 1, 1,
-0.5039572, 2.126313, -0.3220325, 1, 1, 1, 1, 1,
-0.5016521, 0.02877507, 1.290884, 1, 1, 1, 1, 1,
-0.5001339, 0.6093287, 0.08212616, 1, 1, 1, 1, 1,
-0.4950128, -0.769521, -1.957234, 1, 1, 1, 1, 1,
-0.4923649, -1.187374, -2.718616, 1, 1, 1, 1, 1,
-0.4911359, -1.75382, -1.695122, 1, 1, 1, 1, 1,
-0.4866702, -0.03371479, -3.211477, 1, 1, 1, 1, 1,
-0.4838338, -0.2898686, -2.835425, 0, 0, 1, 1, 1,
-0.4787706, 2.085567, -0.5762887, 1, 0, 0, 1, 1,
-0.4786212, 0.2426157, -1.527553, 1, 0, 0, 1, 1,
-0.4752235, 1.245262, 0.410239, 1, 0, 0, 1, 1,
-0.4654779, 0.9660378, 0.24578, 1, 0, 0, 1, 1,
-0.4614834, 1.189255, -0.9035238, 1, 0, 0, 1, 1,
-0.4604479, 0.0003697693, -0.6246074, 0, 0, 0, 1, 1,
-0.457464, 1.148593, 0.931649, 0, 0, 0, 1, 1,
-0.45726, -0.6491578, -1.769513, 0, 0, 0, 1, 1,
-0.4559089, -1.054041, -2.673177, 0, 0, 0, 1, 1,
-0.4534409, -0.3040923, -3.052563, 0, 0, 0, 1, 1,
-0.4509956, -0.4009597, -1.922721, 0, 0, 0, 1, 1,
-0.4484718, -0.3408357, -2.852872, 0, 0, 0, 1, 1,
-0.4471328, 0.8402399, -1.069987, 1, 1, 1, 1, 1,
-0.444045, 0.07388781, -2.638797, 1, 1, 1, 1, 1,
-0.4384829, -1.249626, -2.475421, 1, 1, 1, 1, 1,
-0.4376845, -0.0191165, -0.9692441, 1, 1, 1, 1, 1,
-0.4356336, -0.1154174, -2.551858, 1, 1, 1, 1, 1,
-0.4343305, 0.3507976, -2.201259, 1, 1, 1, 1, 1,
-0.4305173, -1.322348, -1.610203, 1, 1, 1, 1, 1,
-0.4301281, 0.9130061, -0.2241621, 1, 1, 1, 1, 1,
-0.4260103, -1.089284, -4.905142, 1, 1, 1, 1, 1,
-0.4250575, -0.6453621, -1.720744, 1, 1, 1, 1, 1,
-0.4241658, -1.708365, -2.517051, 1, 1, 1, 1, 1,
-0.4169918, 1.262139, -0.502353, 1, 1, 1, 1, 1,
-0.4154167, 0.08603901, -0.5282039, 1, 1, 1, 1, 1,
-0.4129525, 1.930395, -1.124043, 1, 1, 1, 1, 1,
-0.4065371, 0.2969, -0.7070453, 1, 1, 1, 1, 1,
-0.389886, 1.196758, 3.249455, 0, 0, 1, 1, 1,
-0.3872306, 0.5784011, -0.5452069, 1, 0, 0, 1, 1,
-0.3868556, 1.182487, -0.6602206, 1, 0, 0, 1, 1,
-0.3810771, -0.04067244, -0.4466769, 1, 0, 0, 1, 1,
-0.3762841, 0.03553203, -1.309925, 1, 0, 0, 1, 1,
-0.3750585, 0.1247855, -0.9279956, 1, 0, 0, 1, 1,
-0.3738135, 0.02226686, -1.323732, 0, 0, 0, 1, 1,
-0.3562686, -0.2286739, -2.785489, 0, 0, 0, 1, 1,
-0.3545029, -0.4721387, -4.431562, 0, 0, 0, 1, 1,
-0.3542503, 0.3673163, -1.369376, 0, 0, 0, 1, 1,
-0.353332, 0.8699289, -0.9571828, 0, 0, 0, 1, 1,
-0.3503965, 1.93659, 0.9611305, 0, 0, 0, 1, 1,
-0.3422087, 1.800613, 1.119896, 0, 0, 0, 1, 1,
-0.3399726, 0.4969092, 0.1999669, 1, 1, 1, 1, 1,
-0.3394126, 2.597291, 0.3647446, 1, 1, 1, 1, 1,
-0.338496, -0.09756579, -1.623518, 1, 1, 1, 1, 1,
-0.3363273, 0.8647318, -0.2388784, 1, 1, 1, 1, 1,
-0.3361271, 1.491553, 0.1019062, 1, 1, 1, 1, 1,
-0.3329231, -0.6336486, -1.35499, 1, 1, 1, 1, 1,
-0.3318335, -1.591775, -2.86186, 1, 1, 1, 1, 1,
-0.329979, -0.1928564, -1.960787, 1, 1, 1, 1, 1,
-0.3277453, -0.6167904, -1.959909, 1, 1, 1, 1, 1,
-0.3265988, -0.336109, -3.723666, 1, 1, 1, 1, 1,
-0.3265486, -0.2332801, -1.403718, 1, 1, 1, 1, 1,
-0.3250766, -0.8807352, -2.126224, 1, 1, 1, 1, 1,
-0.3246292, -0.95533, -4.022697, 1, 1, 1, 1, 1,
-0.3241571, -0.1912443, -2.030202, 1, 1, 1, 1, 1,
-0.3223212, 0.404405, 0.8861551, 1, 1, 1, 1, 1,
-0.3191993, -1.111467, -1.766755, 0, 0, 1, 1, 1,
-0.3172532, -0.1466135, -2.072491, 1, 0, 0, 1, 1,
-0.317041, 1.911425, 0.37361, 1, 0, 0, 1, 1,
-0.3147131, -0.5239617, -1.830531, 1, 0, 0, 1, 1,
-0.304588, -1.761012, -4.745836, 1, 0, 0, 1, 1,
-0.2982322, -1.226264, -0.1529633, 1, 0, 0, 1, 1,
-0.2980315, 0.8200509, -1.531146, 0, 0, 0, 1, 1,
-0.2944607, 0.9500996, -0.7786982, 0, 0, 0, 1, 1,
-0.2941793, 0.6997954, -1.931877, 0, 0, 0, 1, 1,
-0.2908708, 0.675749, 1.504288, 0, 0, 0, 1, 1,
-0.2906056, -0.005885899, -1.263079, 0, 0, 0, 1, 1,
-0.2887679, 0.5680778, -1.526191, 0, 0, 0, 1, 1,
-0.2874644, 1.163139, -2.590346, 0, 0, 0, 1, 1,
-0.2848521, -0.7681829, -2.520756, 1, 1, 1, 1, 1,
-0.2831749, -0.1845591, -1.46399, 1, 1, 1, 1, 1,
-0.2817926, 1.189729, 0.01698705, 1, 1, 1, 1, 1,
-0.2794097, -0.4311358, -3.604213, 1, 1, 1, 1, 1,
-0.2791008, 0.07749321, -1.765932, 1, 1, 1, 1, 1,
-0.2775054, 0.8414002, 0.08288486, 1, 1, 1, 1, 1,
-0.2757838, -0.4399016, -2.050314, 1, 1, 1, 1, 1,
-0.2747335, 2.248879, 1.05534, 1, 1, 1, 1, 1,
-0.2743415, 0.01789632, -1.619591, 1, 1, 1, 1, 1,
-0.2732398, -0.07070603, -2.031837, 1, 1, 1, 1, 1,
-0.271267, -0.02339265, -2.923918, 1, 1, 1, 1, 1,
-0.2675559, -1.436998, -2.347587, 1, 1, 1, 1, 1,
-0.2670931, -1.130158, -2.252002, 1, 1, 1, 1, 1,
-0.2647944, 0.4356695, -0.9502917, 1, 1, 1, 1, 1,
-0.2640254, 2.016333, -0.1364973, 1, 1, 1, 1, 1,
-0.2625547, -0.4413946, -3.36062, 0, 0, 1, 1, 1,
-0.2621802, -1.093153, -3.303147, 1, 0, 0, 1, 1,
-0.2598641, -0.1685049, -1.640001, 1, 0, 0, 1, 1,
-0.2593846, -2.108711, -1.747026, 1, 0, 0, 1, 1,
-0.2578157, -1.438024, -3.53195, 1, 0, 0, 1, 1,
-0.2569767, 1.748593, -1.326498, 1, 0, 0, 1, 1,
-0.2562567, -1.11119, -4.08133, 0, 0, 0, 1, 1,
-0.2490727, 0.1928791, -2.991475, 0, 0, 0, 1, 1,
-0.2481925, -1.42394, -3.627212, 0, 0, 0, 1, 1,
-0.2480975, -0.9913329, -1.058739, 0, 0, 0, 1, 1,
-0.2478553, -1.054989, -2.230449, 0, 0, 0, 1, 1,
-0.247601, -0.08626319, -2.764019, 0, 0, 0, 1, 1,
-0.2405591, -1.49715, -3.014737, 0, 0, 0, 1, 1,
-0.238646, -1.569802, -3.969316, 1, 1, 1, 1, 1,
-0.2379971, -0.2203889, -1.172252, 1, 1, 1, 1, 1,
-0.2372728, 1.659884, -0.08015734, 1, 1, 1, 1, 1,
-0.2344664, -1.902995, -2.468152, 1, 1, 1, 1, 1,
-0.2340778, 1.196238, -1.516613, 1, 1, 1, 1, 1,
-0.2293096, -0.2225175, -0.7976876, 1, 1, 1, 1, 1,
-0.2233436, 2.158321, -1.037582, 1, 1, 1, 1, 1,
-0.2191563, 0.3008833, -0.5474842, 1, 1, 1, 1, 1,
-0.2151539, -0.01607933, -1.129755, 1, 1, 1, 1, 1,
-0.2132292, 0.3842345, -0.8361921, 1, 1, 1, 1, 1,
-0.2126729, -1.389467, -1.088515, 1, 1, 1, 1, 1,
-0.2112737, 0.2163342, -0.5756615, 1, 1, 1, 1, 1,
-0.2103952, -1.098284, -5.29755, 1, 1, 1, 1, 1,
-0.210109, 1.533458, 0.05881542, 1, 1, 1, 1, 1,
-0.2101029, 1.585022, -0.7384551, 1, 1, 1, 1, 1,
-0.2090728, 0.8632047, 1.339327, 0, 0, 1, 1, 1,
-0.2083417, -0.5479083, -2.171011, 1, 0, 0, 1, 1,
-0.2080157, 0.04870805, -0.9948547, 1, 0, 0, 1, 1,
-0.207652, 0.9427169, 0.1727234, 1, 0, 0, 1, 1,
-0.2073877, -0.6541515, -2.302418, 1, 0, 0, 1, 1,
-0.1910871, -1.214088, -1.834566, 1, 0, 0, 1, 1,
-0.1907968, -0.5802085, -3.669994, 0, 0, 0, 1, 1,
-0.1897505, 0.3958589, -2.119064, 0, 0, 0, 1, 1,
-0.1886831, 0.2854683, 0.3183714, 0, 0, 0, 1, 1,
-0.1881951, -1.115734, -3.206387, 0, 0, 0, 1, 1,
-0.1880395, 1.261719, 0.3664415, 0, 0, 0, 1, 1,
-0.1874384, -1.683533, -2.294964, 0, 0, 0, 1, 1,
-0.1870891, -0.3802686, -2.750258, 0, 0, 0, 1, 1,
-0.1849115, -0.6156483, -3.782834, 1, 1, 1, 1, 1,
-0.1812807, 0.1218072, -1.398374, 1, 1, 1, 1, 1,
-0.1769366, 0.4850905, -0.3186508, 1, 1, 1, 1, 1,
-0.1769086, 0.3424369, 0.7978391, 1, 1, 1, 1, 1,
-0.1766747, -1.136958, -3.449816, 1, 1, 1, 1, 1,
-0.175979, -0.9050742, -3.697919, 1, 1, 1, 1, 1,
-0.1739955, 0.5292526, -0.8435949, 1, 1, 1, 1, 1,
-0.1701989, -0.5641341, -3.466631, 1, 1, 1, 1, 1,
-0.1687759, -1.605214, -1.633534, 1, 1, 1, 1, 1,
-0.1684567, 1.61268, -0.1603454, 1, 1, 1, 1, 1,
-0.163301, -1.350059, -3.128766, 1, 1, 1, 1, 1,
-0.1543396, 0.1789323, -1.546162, 1, 1, 1, 1, 1,
-0.1507135, 1.018608, -1.633628, 1, 1, 1, 1, 1,
-0.1448099, 0.3059619, -0.1385487, 1, 1, 1, 1, 1,
-0.1447005, -1.196895, -4.108066, 1, 1, 1, 1, 1,
-0.1424404, -0.8541723, -3.154879, 0, 0, 1, 1, 1,
-0.1394242, 0.7347192, 1.060677, 1, 0, 0, 1, 1,
-0.1364829, 0.2109122, -0.7314647, 1, 0, 0, 1, 1,
-0.1343656, 1.023186, 0.5076132, 1, 0, 0, 1, 1,
-0.1309875, 0.2797994, -2.196283, 1, 0, 0, 1, 1,
-0.1288542, -0.8809416, -3.431484, 1, 0, 0, 1, 1,
-0.1274545, 0.7850505, -1.294573, 0, 0, 0, 1, 1,
-0.1272654, -0.7066767, -2.346372, 0, 0, 0, 1, 1,
-0.1265529, -0.8677552, -3.668004, 0, 0, 0, 1, 1,
-0.1221345, 0.1459894, 0.7062411, 0, 0, 0, 1, 1,
-0.1197661, 0.0720995, -0.9054396, 0, 0, 0, 1, 1,
-0.1181333, 0.1567162, -1.247219, 0, 0, 0, 1, 1,
-0.1176564, 0.2565455, 0.2495329, 0, 0, 0, 1, 1,
-0.1164521, 0.8042776, -0.7856655, 1, 1, 1, 1, 1,
-0.1059872, -0.6400721, -3.690159, 1, 1, 1, 1, 1,
-0.1052648, -0.6974007, -3.156828, 1, 1, 1, 1, 1,
-0.09975305, 0.3378025, -0.07252224, 1, 1, 1, 1, 1,
-0.09274645, -0.9508438, -2.79145, 1, 1, 1, 1, 1,
-0.09270239, 0.06110775, -2.212593, 1, 1, 1, 1, 1,
-0.08972456, -0.9511117, -2.169995, 1, 1, 1, 1, 1,
-0.08532745, 0.8816295, -0.7817556, 1, 1, 1, 1, 1,
-0.07726892, -0.5678113, -2.225177, 1, 1, 1, 1, 1,
-0.07134739, 0.05193771, 1.424564, 1, 1, 1, 1, 1,
-0.0697316, -1.157856, -2.240428, 1, 1, 1, 1, 1,
-0.06933302, 1.340702, -0.9080619, 1, 1, 1, 1, 1,
-0.06910229, 1.506711, 0.5748445, 1, 1, 1, 1, 1,
-0.06811108, 1.687643, -0.6037212, 1, 1, 1, 1, 1,
-0.06339402, -0.7765502, -2.667369, 1, 1, 1, 1, 1,
-0.06325679, 0.9620588, 0.09933463, 0, 0, 1, 1, 1,
-0.06282729, 2.057407, 0.4096461, 1, 0, 0, 1, 1,
-0.05926533, 0.7785111, 0.8086757, 1, 0, 0, 1, 1,
-0.0589953, -0.04742852, -1.886497, 1, 0, 0, 1, 1,
-0.0577338, -0.3424714, -4.200048, 1, 0, 0, 1, 1,
-0.0561339, 0.3694023, 1.055688, 1, 0, 0, 1, 1,
-0.05595449, -0.6104847, -0.4479812, 0, 0, 0, 1, 1,
-0.05512298, 0.1037738, -2.940754, 0, 0, 0, 1, 1,
-0.05475603, -0.300158, -3.87387, 0, 0, 0, 1, 1,
-0.05340067, -1.459071, -3.117092, 0, 0, 0, 1, 1,
-0.05277252, 0.4015653, 0.637274, 0, 0, 0, 1, 1,
-0.05095441, 0.4881477, 1.165037, 0, 0, 0, 1, 1,
-0.05073863, 0.6081522, 0.1847438, 0, 0, 0, 1, 1,
-0.04393494, -0.2580215, -3.799223, 1, 1, 1, 1, 1,
-0.0417175, -0.1793448, -2.524768, 1, 1, 1, 1, 1,
-0.03904004, 1.574168, 0.6721174, 1, 1, 1, 1, 1,
-0.03572682, 1.203461, -0.7759256, 1, 1, 1, 1, 1,
-0.03222134, 0.02622289, -1.371947, 1, 1, 1, 1, 1,
-0.02932292, 0.654704, -0.4032715, 1, 1, 1, 1, 1,
-0.02681013, 0.7363369, 1.123307, 1, 1, 1, 1, 1,
-0.02474698, 0.5066881, -0.9054404, 1, 1, 1, 1, 1,
-0.02358635, -0.8058495, -2.737332, 1, 1, 1, 1, 1,
-0.02208482, -0.2754175, -1.391117, 1, 1, 1, 1, 1,
-0.02125904, -0.9530739, -1.118052, 1, 1, 1, 1, 1,
-0.02085795, 0.478253, -1.358467, 1, 1, 1, 1, 1,
-0.01973585, 0.8203169, -0.07688031, 1, 1, 1, 1, 1,
-0.01818995, 1.303256, 0.544497, 1, 1, 1, 1, 1,
-0.01642513, -0.1718655, -4.104387, 1, 1, 1, 1, 1,
-0.01556382, -0.7907042, -2.115387, 0, 0, 1, 1, 1,
-0.01494794, -2.928611, -2.7984, 1, 0, 0, 1, 1,
-0.01476386, -1.279822, -2.259842, 1, 0, 0, 1, 1,
-0.01450186, -0.8370972, -4.64775, 1, 0, 0, 1, 1,
-0.01192468, 1.641419, -0.2450733, 1, 0, 0, 1, 1,
-0.01114051, -0.9198655, -3.043277, 1, 0, 0, 1, 1,
-0.007594737, -1.131875, -1.920689, 0, 0, 0, 1, 1,
-0.006208197, 1.117471, -0.3115905, 0, 0, 0, 1, 1,
-0.005314138, -0.4978938, -3.743091, 0, 0, 0, 1, 1,
-0.003210856, 1.596012, -0.3860196, 0, 0, 0, 1, 1,
-0.002536458, 0.6064969, -0.1323521, 0, 0, 0, 1, 1,
0.0001286924, -0.7936585, 2.395118, 0, 0, 0, 1, 1,
0.0007154046, -1.6772, 3.89716, 0, 0, 0, 1, 1,
0.002089944, -0.7742978, 2.989054, 1, 1, 1, 1, 1,
0.006854176, -1.038269, 2.723752, 1, 1, 1, 1, 1,
0.007117065, 1.062521, -0.1847588, 1, 1, 1, 1, 1,
0.01237504, -0.1855186, 2.99429, 1, 1, 1, 1, 1,
0.0152327, -0.6611332, 2.55818, 1, 1, 1, 1, 1,
0.02048254, -1.303566, 1.453396, 1, 1, 1, 1, 1,
0.02346451, -0.8907905, 3.524812, 1, 1, 1, 1, 1,
0.02579943, 0.8320923, 2.151234, 1, 1, 1, 1, 1,
0.02904222, -0.1372547, 1.874035, 1, 1, 1, 1, 1,
0.0293961, 1.191953, -0.5387881, 1, 1, 1, 1, 1,
0.02944744, -0.1864873, 4.102937, 1, 1, 1, 1, 1,
0.03051805, 1.677009, 0.539896, 1, 1, 1, 1, 1,
0.03136479, -1.459179, 2.633251, 1, 1, 1, 1, 1,
0.03296471, 1.242762, -1.71478, 1, 1, 1, 1, 1,
0.03328418, 1.112996, -0.1409295, 1, 1, 1, 1, 1,
0.03393783, -0.1126065, 0.9928795, 0, 0, 1, 1, 1,
0.03786736, 0.06181386, 2.495911, 1, 0, 0, 1, 1,
0.03866713, 2.491345, 0.6213478, 1, 0, 0, 1, 1,
0.04053858, -1.444064, 1.973913, 1, 0, 0, 1, 1,
0.04397483, -0.7395185, 3.986897, 1, 0, 0, 1, 1,
0.04892163, 0.2195799, -1.68935, 1, 0, 0, 1, 1,
0.05020839, -1.144797, 2.923147, 0, 0, 0, 1, 1,
0.05364902, 0.1080962, -0.3910028, 0, 0, 0, 1, 1,
0.05521065, 0.7446264, -0.1637293, 0, 0, 0, 1, 1,
0.05604696, -1.303439, 3.534142, 0, 0, 0, 1, 1,
0.05885292, 1.110401, 2.030164, 0, 0, 0, 1, 1,
0.06032641, 1.14858, 1.163255, 0, 0, 0, 1, 1,
0.06631611, -0.5740603, 2.016829, 0, 0, 0, 1, 1,
0.0685511, -0.6388369, 3.37302, 1, 1, 1, 1, 1,
0.06945296, 0.9778587, 1.101955, 1, 1, 1, 1, 1,
0.07024006, 0.6689099, 0.0870854, 1, 1, 1, 1, 1,
0.07836472, 0.2529284, 0.1613341, 1, 1, 1, 1, 1,
0.08290766, -0.5192137, 2.496272, 1, 1, 1, 1, 1,
0.08331425, -0.1303054, 0.8941368, 1, 1, 1, 1, 1,
0.08431783, -0.9098268, 1.696298, 1, 1, 1, 1, 1,
0.08666766, -0.8800188, 3.395736, 1, 1, 1, 1, 1,
0.08678757, -1.282765, 4.304221, 1, 1, 1, 1, 1,
0.08689979, 2.4239, 0.8582785, 1, 1, 1, 1, 1,
0.08731391, 0.9114931, -0.9073762, 1, 1, 1, 1, 1,
0.09290415, 0.96842, -0.6628847, 1, 1, 1, 1, 1,
0.09347895, 0.5424758, -0.2628655, 1, 1, 1, 1, 1,
0.09378115, -1.512925, 1.629788, 1, 1, 1, 1, 1,
0.1042925, 0.07314789, -1.390308, 1, 1, 1, 1, 1,
0.1156494, -1.105496, 3.221532, 0, 0, 1, 1, 1,
0.1157954, 0.1946326, -0.3010424, 1, 0, 0, 1, 1,
0.1161436, -1.138724, 4.260265, 1, 0, 0, 1, 1,
0.1166139, -0.7065871, 4.520303, 1, 0, 0, 1, 1,
0.1186178, 0.5204597, 0.1068094, 1, 0, 0, 1, 1,
0.1197314, 0.7601746, 0.1073345, 1, 0, 0, 1, 1,
0.1215168, -0.5628906, 2.643382, 0, 0, 0, 1, 1,
0.1237367, 0.8983307, -0.9354346, 0, 0, 0, 1, 1,
0.1275679, 0.8521096, -0.2810455, 0, 0, 0, 1, 1,
0.1286099, -2.344157, 2.953716, 0, 0, 0, 1, 1,
0.1293361, 1.668217, 1.50403, 0, 0, 0, 1, 1,
0.1316797, 1.693889, -0.3561977, 0, 0, 0, 1, 1,
0.1328397, -1.255684, 1.075283, 0, 0, 0, 1, 1,
0.1424142, 1.416116, 0.4104653, 1, 1, 1, 1, 1,
0.1459458, 0.4696975, -0.790828, 1, 1, 1, 1, 1,
0.1468215, 0.6484986, -0.0657074, 1, 1, 1, 1, 1,
0.1484676, -1.196262, 4.911843, 1, 1, 1, 1, 1,
0.1490293, 0.347499, -0.06736694, 1, 1, 1, 1, 1,
0.1510851, -0.5742092, 3.503491, 1, 1, 1, 1, 1,
0.1558325, 0.6659585, 0.4090113, 1, 1, 1, 1, 1,
0.1567018, 0.2759839, -0.2435337, 1, 1, 1, 1, 1,
0.1576656, -0.3777317, 1.170321, 1, 1, 1, 1, 1,
0.1581498, -2.276256, 3.338588, 1, 1, 1, 1, 1,
0.1582306, -0.2486656, 2.229459, 1, 1, 1, 1, 1,
0.1606919, -0.6359911, 4.880095, 1, 1, 1, 1, 1,
0.1637729, 0.3932529, -0.09570616, 1, 1, 1, 1, 1,
0.1639252, -1.260974, 4.650326, 1, 1, 1, 1, 1,
0.1656694, 0.3909695, -0.2637545, 1, 1, 1, 1, 1,
0.1677536, 0.2305113, 0.8032048, 0, 0, 1, 1, 1,
0.1684355, -0.2038063, 3.146848, 1, 0, 0, 1, 1,
0.1689993, 0.4211695, 0.5307196, 1, 0, 0, 1, 1,
0.1702631, -0.4674054, 3.704869, 1, 0, 0, 1, 1,
0.1734208, 0.08562121, 0.5875236, 1, 0, 0, 1, 1,
0.1751679, -0.3575027, 1.753622, 1, 0, 0, 1, 1,
0.1791615, -0.3438967, 2.205641, 0, 0, 0, 1, 1,
0.1826428, -0.4533297, 3.007821, 0, 0, 0, 1, 1,
0.1928049, 0.4495442, 1.023537, 0, 0, 0, 1, 1,
0.1935749, -1.081509, 2.001531, 0, 0, 0, 1, 1,
0.1939325, -0.02158173, 1.578518, 0, 0, 0, 1, 1,
0.1948381, -0.5414584, 1.851954, 0, 0, 0, 1, 1,
0.1955791, -0.2277708, 1.942504, 0, 0, 0, 1, 1,
0.1987789, -0.9464307, 1.551002, 1, 1, 1, 1, 1,
0.2037513, -0.8441094, 3.125463, 1, 1, 1, 1, 1,
0.2041683, -0.2827566, 2.541615, 1, 1, 1, 1, 1,
0.2046397, -0.1294297, 1.384341, 1, 1, 1, 1, 1,
0.2071353, 0.8974596, 0.3818518, 1, 1, 1, 1, 1,
0.2079495, 0.2675547, 0.2302315, 1, 1, 1, 1, 1,
0.2085633, 2.213406, 2.028436, 1, 1, 1, 1, 1,
0.2097358, -1.600561, 2.450642, 1, 1, 1, 1, 1,
0.2144777, -0.4240613, 2.485743, 1, 1, 1, 1, 1,
0.2157851, -1.246101, 2.777632, 1, 1, 1, 1, 1,
0.2159005, 1.760084, 0.1658774, 1, 1, 1, 1, 1,
0.2290811, 0.5514853, -0.3010058, 1, 1, 1, 1, 1,
0.2298084, 0.8545371, 2.471553, 1, 1, 1, 1, 1,
0.2299518, -0.03678583, 1.368196, 1, 1, 1, 1, 1,
0.2302815, -0.710601, 1.632403, 1, 1, 1, 1, 1,
0.2340024, 0.8560169, 1.760132, 0, 0, 1, 1, 1,
0.2349902, 1.543977, 0.2086379, 1, 0, 0, 1, 1,
0.2358787, 0.6456921, -0.04276949, 1, 0, 0, 1, 1,
0.2383971, -0.6561822, 2.096262, 1, 0, 0, 1, 1,
0.2385571, -1.22545, 2.033883, 1, 0, 0, 1, 1,
0.2447573, 0.2896351, 0.9157807, 1, 0, 0, 1, 1,
0.2451448, -0.3065041, 2.667459, 0, 0, 0, 1, 1,
0.2487246, 0.02485863, 3.345019, 0, 0, 0, 1, 1,
0.250263, 0.6107918, 1.404899, 0, 0, 0, 1, 1,
0.2519451, -1.110914, 3.418682, 0, 0, 0, 1, 1,
0.2567115, -1.651149, 4.168448, 0, 0, 0, 1, 1,
0.2587216, 1.159804, 0.4790698, 0, 0, 0, 1, 1,
0.2642733, 0.6207933, -0.2505569, 0, 0, 0, 1, 1,
0.2646542, -0.130194, 2.958919, 1, 1, 1, 1, 1,
0.2680927, -0.7913088, 2.240667, 1, 1, 1, 1, 1,
0.276367, 0.462938, 1.383955, 1, 1, 1, 1, 1,
0.2764278, -1.264161, 2.089759, 1, 1, 1, 1, 1,
0.2799082, 0.1980544, 3.161499, 1, 1, 1, 1, 1,
0.2877137, 0.1803303, 2.40414, 1, 1, 1, 1, 1,
0.2893881, -0.8794083, 3.160691, 1, 1, 1, 1, 1,
0.2916787, 0.9232306, 1.927694, 1, 1, 1, 1, 1,
0.2920492, 0.5105171, 0.4095573, 1, 1, 1, 1, 1,
0.2947082, -2.088924, 0.919566, 1, 1, 1, 1, 1,
0.2959, 0.0691461, 1.533826, 1, 1, 1, 1, 1,
0.2967544, -1.63691, 3.275743, 1, 1, 1, 1, 1,
0.2981503, -2.021973, 3.021844, 1, 1, 1, 1, 1,
0.2981956, 0.2862734, 0.7415796, 1, 1, 1, 1, 1,
0.3004128, -1.197946, 4.00941, 1, 1, 1, 1, 1,
0.3020798, -1.020026, 3.006563, 0, 0, 1, 1, 1,
0.3084731, -0.6102583, 1.254867, 1, 0, 0, 1, 1,
0.3146404, -0.1666535, 0.4880679, 1, 0, 0, 1, 1,
0.3199161, 1.155973, 0.9990968, 1, 0, 0, 1, 1,
0.3199686, 1.268292, 0.9785486, 1, 0, 0, 1, 1,
0.3215879, -0.7962317, 1.643113, 1, 0, 0, 1, 1,
0.3234509, -0.05895854, 0.462799, 0, 0, 0, 1, 1,
0.3266658, 0.8911358, 1.268165, 0, 0, 0, 1, 1,
0.3328466, 1.247012, 0.2345399, 0, 0, 0, 1, 1,
0.3371423, 1.189589, 1.072559, 0, 0, 0, 1, 1,
0.3390937, 0.3758324, 0.1900528, 0, 0, 0, 1, 1,
0.339939, 0.4315384, 3.275307, 0, 0, 0, 1, 1,
0.3411531, 0.5981545, 0.356062, 0, 0, 0, 1, 1,
0.3456862, 0.07027135, 2.121003, 1, 1, 1, 1, 1,
0.3460579, -0.002218469, 1.806409, 1, 1, 1, 1, 1,
0.3485297, -1.261954, 0.6554294, 1, 1, 1, 1, 1,
0.3513142, 0.1144131, 1.514358, 1, 1, 1, 1, 1,
0.3520767, 1.596642, 1.262953, 1, 1, 1, 1, 1,
0.3565504, -1.520195, 1.880708, 1, 1, 1, 1, 1,
0.3584546, 0.3059466, 0.7628067, 1, 1, 1, 1, 1,
0.363035, 0.6149331, 0.1385958, 1, 1, 1, 1, 1,
0.3666821, -0.5267116, 2.667379, 1, 1, 1, 1, 1,
0.3667037, 0.2764953, 2.13888, 1, 1, 1, 1, 1,
0.36899, -0.3189897, 1.076003, 1, 1, 1, 1, 1,
0.3756608, 0.6551829, -0.7423944, 1, 1, 1, 1, 1,
0.3784941, -0.0684279, 2.448699, 1, 1, 1, 1, 1,
0.3828226, 0.6374575, -0.08378317, 1, 1, 1, 1, 1,
0.3829837, 1.171907, -1.550631, 1, 1, 1, 1, 1,
0.3882743, 0.7688271, 0.9570764, 0, 0, 1, 1, 1,
0.3883972, -0.5259987, 4.684119, 1, 0, 0, 1, 1,
0.3894399, -1.576107, 1.450732, 1, 0, 0, 1, 1,
0.3929982, 0.6404525, 0.429344, 1, 0, 0, 1, 1,
0.3973156, -1.47948, 3.303322, 1, 0, 0, 1, 1,
0.4011331, -2.112428, 3.758102, 1, 0, 0, 1, 1,
0.409999, -2.118923, 2.555995, 0, 0, 0, 1, 1,
0.4167942, 0.3815157, 1.702209, 0, 0, 0, 1, 1,
0.4214098, 0.4579409, 1.649122, 0, 0, 0, 1, 1,
0.4222572, 0.4955012, 1.101956, 0, 0, 0, 1, 1,
0.4243154, 0.4771579, -0.8989974, 0, 0, 0, 1, 1,
0.4287046, -0.1593598, 1.437201, 0, 0, 0, 1, 1,
0.4310838, -1.115816, 1.962743, 0, 0, 0, 1, 1,
0.4337988, -0.5193748, 1.612172, 1, 1, 1, 1, 1,
0.4349174, -2.472316, 2.414092, 1, 1, 1, 1, 1,
0.435064, -0.630232, 2.238877, 1, 1, 1, 1, 1,
0.4364875, 0.9213161, -0.28606, 1, 1, 1, 1, 1,
0.4418893, 0.6278338, 0.1016695, 1, 1, 1, 1, 1,
0.4433792, -1.036604, 1.883041, 1, 1, 1, 1, 1,
0.4433946, -0.243547, 1.074685, 1, 1, 1, 1, 1,
0.4437356, -1.242371, 2.993891, 1, 1, 1, 1, 1,
0.4457318, 1.166534, 2.420959, 1, 1, 1, 1, 1,
0.4472106, -0.5146136, 2.600646, 1, 1, 1, 1, 1,
0.4474084, 1.129065, -0.9458687, 1, 1, 1, 1, 1,
0.4492097, -0.1041675, 1.198326, 1, 1, 1, 1, 1,
0.4512883, -0.8095759, 3.388424, 1, 1, 1, 1, 1,
0.4534658, 1.360003, -0.2140565, 1, 1, 1, 1, 1,
0.4544418, 0.6398438, -0.1934468, 1, 1, 1, 1, 1,
0.4560234, -0.3290935, 2.100158, 0, 0, 1, 1, 1,
0.4597076, -0.06103558, 2.870583, 1, 0, 0, 1, 1,
0.4616678, -0.746595, 0.2686666, 1, 0, 0, 1, 1,
0.4663849, 1.3462, -0.5008972, 1, 0, 0, 1, 1,
0.4717734, 0.5151719, 2.031366, 1, 0, 0, 1, 1,
0.4767624, -0.3821459, 3.657104, 1, 0, 0, 1, 1,
0.480801, -0.8868378, 0.7686545, 0, 0, 0, 1, 1,
0.4813249, -0.1221921, 3.207429, 0, 0, 0, 1, 1,
0.4813871, -0.4206339, 2.747043, 0, 0, 0, 1, 1,
0.4854106, 1.977026, 1.706962, 0, 0, 0, 1, 1,
0.4876175, -0.8698298, 3.495255, 0, 0, 0, 1, 1,
0.4878484, 0.2377185, 2.07326, 0, 0, 0, 1, 1,
0.4969737, 0.6006367, 1.123658, 0, 0, 0, 1, 1,
0.5006765, -0.4516513, 1.917599, 1, 1, 1, 1, 1,
0.5046715, 0.1235651, 0.6598362, 1, 1, 1, 1, 1,
0.5059253, 0.08528037, 0.2511679, 1, 1, 1, 1, 1,
0.5125905, -0.541506, 3.509019, 1, 1, 1, 1, 1,
0.5149225, -0.2959539, 2.282645, 1, 1, 1, 1, 1,
0.5199893, -1.254488, 3.111165, 1, 1, 1, 1, 1,
0.5218669, -0.1895055, 4.392598, 1, 1, 1, 1, 1,
0.5240945, 1.057703, 0.5912717, 1, 1, 1, 1, 1,
0.5252409, 0.6852193, -0.7617781, 1, 1, 1, 1, 1,
0.5257391, -0.1791588, -0.04209442, 1, 1, 1, 1, 1,
0.5284398, 1.224035, 0.783629, 1, 1, 1, 1, 1,
0.5303247, -0.1601291, 1.611724, 1, 1, 1, 1, 1,
0.530865, 1.439817, 1.031147, 1, 1, 1, 1, 1,
0.5328184, -1.858091, 3.763026, 1, 1, 1, 1, 1,
0.5336187, -0.8241897, 4.283682, 1, 1, 1, 1, 1,
0.5434124, 1.004819, -0.2997741, 0, 0, 1, 1, 1,
0.5447315, 1.642273, -0.1353935, 1, 0, 0, 1, 1,
0.5472115, 0.5417072, 1.913163, 1, 0, 0, 1, 1,
0.5499043, 0.5159853, 1.92176, 1, 0, 0, 1, 1,
0.5502099, -0.5464547, 2.391208, 1, 0, 0, 1, 1,
0.5502612, -0.1548525, 1.483653, 1, 0, 0, 1, 1,
0.5505602, 0.4088545, 1.313731, 0, 0, 0, 1, 1,
0.553584, -0.4097678, 2.751873, 0, 0, 0, 1, 1,
0.5564306, -0.1840924, 2.774301, 0, 0, 0, 1, 1,
0.568657, -0.06893495, 1.863332, 0, 0, 0, 1, 1,
0.5744954, -1.574887, 2.988369, 0, 0, 0, 1, 1,
0.5757926, 0.00633189, 0.5488331, 0, 0, 0, 1, 1,
0.5772805, -0.3314781, 0.3093759, 0, 0, 0, 1, 1,
0.5791254, -0.7420331, 4.21651, 1, 1, 1, 1, 1,
0.5841233, -1.343226, 2.075654, 1, 1, 1, 1, 1,
0.5878981, 0.389527, 1.692271, 1, 1, 1, 1, 1,
0.5912006, -0.5861847, 2.789434, 1, 1, 1, 1, 1,
0.5943685, 0.8177199, 0.1123828, 1, 1, 1, 1, 1,
0.5955728, 1.21625, 1.302929, 1, 1, 1, 1, 1,
0.5980436, 0.009907984, 1.96788, 1, 1, 1, 1, 1,
0.6002331, 0.4499781, 1.834226, 1, 1, 1, 1, 1,
0.6040491, 1.450357, 0.5027242, 1, 1, 1, 1, 1,
0.6042773, 0.5469736, 1.144569, 1, 1, 1, 1, 1,
0.6060761, -0.8799538, 2.231163, 1, 1, 1, 1, 1,
0.620459, 1.11406, 2.853547, 1, 1, 1, 1, 1,
0.6219249, -0.3149862, 3.494336, 1, 1, 1, 1, 1,
0.6224664, 2.06431, 0.07278921, 1, 1, 1, 1, 1,
0.6224665, 0.6755342, 0.2133555, 1, 1, 1, 1, 1,
0.6266604, -2.931158, 3.471206, 0, 0, 1, 1, 1,
0.6355215, -0.5151188, 1.802405, 1, 0, 0, 1, 1,
0.6409719, -0.5854822, 2.249694, 1, 0, 0, 1, 1,
0.6423237, -0.6136582, 3.09044, 1, 0, 0, 1, 1,
0.6448675, -0.4942461, 2.333452, 1, 0, 0, 1, 1,
0.6460125, 1.247206, 0.2322198, 1, 0, 0, 1, 1,
0.6475281, -0.2470086, 1.997349, 0, 0, 0, 1, 1,
0.6477242, 1.023849, 0.1149954, 0, 0, 0, 1, 1,
0.6493647, -0.9436076, 1.994395, 0, 0, 0, 1, 1,
0.6616368, -0.05759467, 2.151079, 0, 0, 0, 1, 1,
0.6618556, 0.2463167, 0.495358, 0, 0, 0, 1, 1,
0.6636943, 0.1643576, 1.932506, 0, 0, 0, 1, 1,
0.6641611, -1.077368, 0.5149253, 0, 0, 0, 1, 1,
0.669085, -0.9883767, 1.747303, 1, 1, 1, 1, 1,
0.6744817, -0.9429911, 2.521034, 1, 1, 1, 1, 1,
0.6803015, -0.1443364, 2.049012, 1, 1, 1, 1, 1,
0.6897258, -0.5143133, 2.470859, 1, 1, 1, 1, 1,
0.6912305, 0.1731457, 1.10547, 1, 1, 1, 1, 1,
0.6920456, 1.558435, 0.3715431, 1, 1, 1, 1, 1,
0.6933625, 0.8164175, 1.140731, 1, 1, 1, 1, 1,
0.6954164, -2.07584, 3.916108, 1, 1, 1, 1, 1,
0.6972665, 0.5121449, 3.855189, 1, 1, 1, 1, 1,
0.6976693, 1.005116, 0.210736, 1, 1, 1, 1, 1,
0.701791, 0.2199747, 2.934724, 1, 1, 1, 1, 1,
0.7106446, -1.248989, 3.790786, 1, 1, 1, 1, 1,
0.7108372, 0.5390683, 1.835583, 1, 1, 1, 1, 1,
0.713691, -0.5716128, 1.178954, 1, 1, 1, 1, 1,
0.7153786, 1.116237, -0.02163528, 1, 1, 1, 1, 1,
0.71602, 0.6298268, 2.27711, 0, 0, 1, 1, 1,
0.7198793, 1.537691, 1.933327, 1, 0, 0, 1, 1,
0.7230573, 1.267922, 1.243033, 1, 0, 0, 1, 1,
0.7251891, 1.262164, 1.500858, 1, 0, 0, 1, 1,
0.7356228, 2.042452, -0.3734177, 1, 0, 0, 1, 1,
0.738679, 0.08845568, 1.970561, 1, 0, 0, 1, 1,
0.7439651, 1.134251, 0.4841955, 0, 0, 0, 1, 1,
0.7439854, 0.424261, -0.4230301, 0, 0, 0, 1, 1,
0.7449288, 0.2601465, 1.992124, 0, 0, 0, 1, 1,
0.7496752, -1.57824, 2.589175, 0, 0, 0, 1, 1,
0.7516014, -0.9246702, 2.950325, 0, 0, 0, 1, 1,
0.7584213, 0.09606969, 1.193013, 0, 0, 0, 1, 1,
0.7584432, 0.3411315, 1.172817, 0, 0, 0, 1, 1,
0.7647185, 0.8513402, 0.83691, 1, 1, 1, 1, 1,
0.7687853, -1.038019, 3.266119, 1, 1, 1, 1, 1,
0.7747724, -2.330438, 2.750949, 1, 1, 1, 1, 1,
0.7773406, -0.1355817, 2.586151, 1, 1, 1, 1, 1,
0.7810225, -0.3842195, 3.07976, 1, 1, 1, 1, 1,
0.7848133, -0.5970647, 3.693774, 1, 1, 1, 1, 1,
0.7870168, -0.9158476, 1.920771, 1, 1, 1, 1, 1,
0.7883378, -0.1585728, 2.989349, 1, 1, 1, 1, 1,
0.7902651, -0.91411, 4.738225, 1, 1, 1, 1, 1,
0.7934743, -0.5003273, 3.128968, 1, 1, 1, 1, 1,
0.7968777, -0.08808837, 1.167921, 1, 1, 1, 1, 1,
0.7990495, -0.07967203, 1.591931, 1, 1, 1, 1, 1,
0.8047614, 0.263465, 0.5103737, 1, 1, 1, 1, 1,
0.8165752, 0.09229159, 0.1929954, 1, 1, 1, 1, 1,
0.8166394, -0.956521, 1.338903, 1, 1, 1, 1, 1,
0.8174275, 1.055859, -0.7407463, 0, 0, 1, 1, 1,
0.8177516, 1.855564, 0.4954217, 1, 0, 0, 1, 1,
0.819726, 0.9663985, 1.582906, 1, 0, 0, 1, 1,
0.8203924, -0.2903931, 1.713437, 1, 0, 0, 1, 1,
0.8295961, 0.8391395, 2.349101, 1, 0, 0, 1, 1,
0.8308308, 0.04290273, 0.1659847, 1, 0, 0, 1, 1,
0.8431688, -1.232471, 2.659832, 0, 0, 0, 1, 1,
0.8437594, 0.4713624, 1.599868, 0, 0, 0, 1, 1,
0.8445674, -0.02379614, 1.908748, 0, 0, 0, 1, 1,
0.8505387, 0.5781389, 2.119388, 0, 0, 0, 1, 1,
0.8521205, 1.022859, 0.3105712, 0, 0, 0, 1, 1,
0.8524583, -2.625222, 2.777173, 0, 0, 0, 1, 1,
0.8538988, 0.6326261, -0.931741, 0, 0, 0, 1, 1,
0.8549248, -0.3518332, 3.025796, 1, 1, 1, 1, 1,
0.8663821, 1.748878, 1.308069, 1, 1, 1, 1, 1,
0.869864, 1.410425, 1.229123, 1, 1, 1, 1, 1,
0.8726341, -0.09681836, 2.859869, 1, 1, 1, 1, 1,
0.8735253, -1.374775, 1.396051, 1, 1, 1, 1, 1,
0.8747001, -1.175706, 2.090295, 1, 1, 1, 1, 1,
0.8771194, 0.4953218, -1.858739, 1, 1, 1, 1, 1,
0.8843886, 2.43259, -0.2377278, 1, 1, 1, 1, 1,
0.885955, 1.253626, -0.1884507, 1, 1, 1, 1, 1,
0.8879086, 1.550533, -2.198262, 1, 1, 1, 1, 1,
0.8904577, -1.070018, 2.960143, 1, 1, 1, 1, 1,
0.8942567, -0.4227374, 1.22796, 1, 1, 1, 1, 1,
0.9098977, 0.2905262, 1.994664, 1, 1, 1, 1, 1,
0.9104435, -0.5921217, 1.756971, 1, 1, 1, 1, 1,
0.9125519, -1.994578, 1.306192, 1, 1, 1, 1, 1,
0.9128495, -0.4870861, 1.783133, 0, 0, 1, 1, 1,
0.9148962, 1.361301, 0.08940038, 1, 0, 0, 1, 1,
0.9178151, 0.7901368, 1.70156, 1, 0, 0, 1, 1,
0.9203663, -0.7335016, 1.51466, 1, 0, 0, 1, 1,
0.9297507, -1.394071, 1.197903, 1, 0, 0, 1, 1,
0.9299092, -0.8333477, 2.584182, 1, 0, 0, 1, 1,
0.9336866, 0.9585992, 0.05812583, 0, 0, 0, 1, 1,
0.9393985, -1.365812, 3.496779, 0, 0, 0, 1, 1,
0.9429288, 0.6012658, 2.329443, 0, 0, 0, 1, 1,
0.9574297, -0.9106225, 2.788286, 0, 0, 0, 1, 1,
0.9584229, -0.6189857, 1.052949, 0, 0, 0, 1, 1,
0.9594532, 2.933535, -1.211406, 0, 0, 0, 1, 1,
0.9659457, 1.409137, -0.2849186, 0, 0, 0, 1, 1,
0.9674925, 2.7191, -0.4023229, 1, 1, 1, 1, 1,
0.9698242, 0.1558105, 1.378466, 1, 1, 1, 1, 1,
0.9699679, -1.223626, 2.686057, 1, 1, 1, 1, 1,
0.9711019, -2.151141, 2.420366, 1, 1, 1, 1, 1,
0.9723409, -1.16488, 2.684225, 1, 1, 1, 1, 1,
0.972362, 1.784254, 1.517931, 1, 1, 1, 1, 1,
0.9729065, -2.55605, 1.20753, 1, 1, 1, 1, 1,
0.9737595, 0.4943843, 1.269748, 1, 1, 1, 1, 1,
0.9780591, 0.3543936, -0.03891988, 1, 1, 1, 1, 1,
0.981997, 0.8121547, 1.319367, 1, 1, 1, 1, 1,
0.9831067, -1.071199, 2.734988, 1, 1, 1, 1, 1,
0.9851974, -0.9511513, 3.417442, 1, 1, 1, 1, 1,
0.986416, 0.1977554, 0.4814295, 1, 1, 1, 1, 1,
0.9867001, -0.1601675, -0.000296317, 1, 1, 1, 1, 1,
0.9977377, 0.3218308, 0.302298, 1, 1, 1, 1, 1,
1.000587, -1.458745, 1.400775, 0, 0, 1, 1, 1,
1.005023, 0.3839797, 0.9554309, 1, 0, 0, 1, 1,
1.00756, 0.1382324, 1.330281, 1, 0, 0, 1, 1,
1.010694, -0.5520842, 2.508672, 1, 0, 0, 1, 1,
1.019034, 0.6928591, 2.267505, 1, 0, 0, 1, 1,
1.019572, -0.5117013, 1.862168, 1, 0, 0, 1, 1,
1.027282, -0.3014721, 2.26848, 0, 0, 0, 1, 1,
1.028783, 0.9058456, 1.642227, 0, 0, 0, 1, 1,
1.042055, -0.795021, 0.7911717, 0, 0, 0, 1, 1,
1.050819, -1.039236, 3.957114, 0, 0, 0, 1, 1,
1.052441, -0.3477075, 2.944767, 0, 0, 0, 1, 1,
1.057376, 0.3049971, 1.421938, 0, 0, 0, 1, 1,
1.062425, -0.3163508, 2.127167, 0, 0, 0, 1, 1,
1.066635, -0.2750399, 1.493371, 1, 1, 1, 1, 1,
1.068758, 0.311526, 2.856042, 1, 1, 1, 1, 1,
1.070145, 1.703476, 0.4285686, 1, 1, 1, 1, 1,
1.07063, -0.2113567, 0.9742237, 1, 1, 1, 1, 1,
1.074087, 0.1084374, 2.158622, 1, 1, 1, 1, 1,
1.074919, 1.892825, 0.6965322, 1, 1, 1, 1, 1,
1.09587, 2.266336, 0.7615513, 1, 1, 1, 1, 1,
1.09642, -0.199788, 3.198838, 1, 1, 1, 1, 1,
1.097666, -0.6585715, 3.387289, 1, 1, 1, 1, 1,
1.100059, -0.2922699, 3.121038, 1, 1, 1, 1, 1,
1.100682, -0.351951, 2.52253, 1, 1, 1, 1, 1,
1.103532, -0.4478671, 0.9569598, 1, 1, 1, 1, 1,
1.10672, 0.8798194, 0.3464124, 1, 1, 1, 1, 1,
1.115278, -0.1826855, 1.293608, 1, 1, 1, 1, 1,
1.117063, -1.254029, 1.768997, 1, 1, 1, 1, 1,
1.135174, 0.9625558, 0.5500515, 0, 0, 1, 1, 1,
1.143526, 1.443073, 2.793604, 1, 0, 0, 1, 1,
1.144559, -0.4124217, 2.336646, 1, 0, 0, 1, 1,
1.147319, 0.4470196, 1.394987, 1, 0, 0, 1, 1,
1.150915, -1.280625, 2.11357, 1, 0, 0, 1, 1,
1.154465, -0.4228478, 2.38518, 1, 0, 0, 1, 1,
1.157198, -0.7824455, 3.967574, 0, 0, 0, 1, 1,
1.161931, -1.80622, 3.585702, 0, 0, 0, 1, 1,
1.169776, 0.4765081, 1.720408, 0, 0, 0, 1, 1,
1.178636, 1.494306, 0.8556525, 0, 0, 0, 1, 1,
1.181605, -0.3932092, 0.9030752, 0, 0, 0, 1, 1,
1.185874, 0.3622113, 1.883048, 0, 0, 0, 1, 1,
1.186056, 0.6210127, 0.1758199, 0, 0, 0, 1, 1,
1.188439, -1.21399, 1.702983, 1, 1, 1, 1, 1,
1.214956, -0.4689842, 2.175785, 1, 1, 1, 1, 1,
1.227473, 1.203328, -0.03866705, 1, 1, 1, 1, 1,
1.228561, 1.30021, 0.6653725, 1, 1, 1, 1, 1,
1.24548, 1.021012, 1.806506, 1, 1, 1, 1, 1,
1.249725, 0.4643966, 0.9018466, 1, 1, 1, 1, 1,
1.250956, -0.2385229, 2.621375, 1, 1, 1, 1, 1,
1.25385, -0.9948953, 1.780965, 1, 1, 1, 1, 1,
1.254199, 1.034289, 1.408325, 1, 1, 1, 1, 1,
1.254598, 1.045772, 0.3254603, 1, 1, 1, 1, 1,
1.255704, 0.2724352, 2.510376, 1, 1, 1, 1, 1,
1.259867, -1.311788, 3.219095, 1, 1, 1, 1, 1,
1.261166, -0.1702198, 2.167297, 1, 1, 1, 1, 1,
1.263751, -1.400187, 2.026521, 1, 1, 1, 1, 1,
1.272515, 1.849973, 0.5908996, 1, 1, 1, 1, 1,
1.2735, -0.7082371, 0.1074175, 0, 0, 1, 1, 1,
1.277013, 0.1616092, 0.9796988, 1, 0, 0, 1, 1,
1.283833, -1.567961, 4.09417, 1, 0, 0, 1, 1,
1.28407, -1.330391, 0.8822247, 1, 0, 0, 1, 1,
1.297273, 0.2984672, 2.267563, 1, 0, 0, 1, 1,
1.302095, 0.6880506, 1.703015, 1, 0, 0, 1, 1,
1.30873, -0.4312362, 1.619758, 0, 0, 0, 1, 1,
1.323434, 0.215693, 1.804602, 0, 0, 0, 1, 1,
1.324838, -2.187122, 3.16231, 0, 0, 0, 1, 1,
1.330681, -1.323059, 1.310622, 0, 0, 0, 1, 1,
1.330685, 0.400759, 1.485559, 0, 0, 0, 1, 1,
1.354449, 1.344385, 1.605785, 0, 0, 0, 1, 1,
1.369129, -0.8571773, 1.658171, 0, 0, 0, 1, 1,
1.371775, -0.9271943, 2.205061, 1, 1, 1, 1, 1,
1.381399, 1.861683, -0.4952109, 1, 1, 1, 1, 1,
1.394415, 0.4731339, 0.746423, 1, 1, 1, 1, 1,
1.395581, 0.04508212, 0.661299, 1, 1, 1, 1, 1,
1.406259, -0.7903659, 0.5565322, 1, 1, 1, 1, 1,
1.408115, 0.09784972, 1.782693, 1, 1, 1, 1, 1,
1.426859, 0.5641659, 1.642618, 1, 1, 1, 1, 1,
1.429109, 1.201399, 0.001351491, 1, 1, 1, 1, 1,
1.434196, -0.4774345, 2.01777, 1, 1, 1, 1, 1,
1.438628, -0.9654132, 1.806595, 1, 1, 1, 1, 1,
1.44285, 0.7225042, 3.061526, 1, 1, 1, 1, 1,
1.44933, 0.2125922, 1.257431, 1, 1, 1, 1, 1,
1.452338, 0.7656892, 2.145632, 1, 1, 1, 1, 1,
1.473917, 0.70847, -0.8655226, 1, 1, 1, 1, 1,
1.475608, -2.640492, 4.456409, 1, 1, 1, 1, 1,
1.48493, -0.9785637, 0.4563632, 0, 0, 1, 1, 1,
1.49999, 0.8473246, 2.115912, 1, 0, 0, 1, 1,
1.530285, 2.338871, 1.59073, 1, 0, 0, 1, 1,
1.533247, -0.461544, 1.975479, 1, 0, 0, 1, 1,
1.534296, 2.607187, 0.5651839, 1, 0, 0, 1, 1,
1.542065, 0.6902326, 1.661131, 1, 0, 0, 1, 1,
1.549524, -0.7253424, 3.325328, 0, 0, 0, 1, 1,
1.550494, -0.5570313, 2.108611, 0, 0, 0, 1, 1,
1.554884, 0.2163816, 2.053753, 0, 0, 0, 1, 1,
1.560687, -2.038058, 3.217537, 0, 0, 0, 1, 1,
1.56474, 0.2490756, 4.409532, 0, 0, 0, 1, 1,
1.576284, -0.4187467, 0.05913607, 0, 0, 0, 1, 1,
1.582426, 0.7015887, -0.3308591, 0, 0, 0, 1, 1,
1.586145, -1.216698, 2.003234, 1, 1, 1, 1, 1,
1.58899, 0.3755703, 2.531909, 1, 1, 1, 1, 1,
1.590886, -0.9638351, 3.590502, 1, 1, 1, 1, 1,
1.595973, 1.371634, 1.082593, 1, 1, 1, 1, 1,
1.597388, -0.7184796, 1.11235, 1, 1, 1, 1, 1,
1.603376, -0.4565399, 1.900567, 1, 1, 1, 1, 1,
1.609796, 0.7051815, -0.198417, 1, 1, 1, 1, 1,
1.611507, -1.885657, 0.9573169, 1, 1, 1, 1, 1,
1.641549, 0.1685937, 1.534401, 1, 1, 1, 1, 1,
1.678313, 0.8157116, -0.8090532, 1, 1, 1, 1, 1,
1.686707, -1.281693, 3.27944, 1, 1, 1, 1, 1,
1.694052, 2.079072, 0.154195, 1, 1, 1, 1, 1,
1.694526, -1.058704, 1.691916, 1, 1, 1, 1, 1,
1.706673, -1.654944, 3.60766, 1, 1, 1, 1, 1,
1.708146, 0.9451684, 0.3793412, 1, 1, 1, 1, 1,
1.713097, 0.4268429, 3.977639, 0, 0, 1, 1, 1,
1.723721, -0.3627005, 0.3414685, 1, 0, 0, 1, 1,
1.729857, 1.224986, 0.5460069, 1, 0, 0, 1, 1,
1.76278, 0.349204, -0.750173, 1, 0, 0, 1, 1,
1.768948, 1.281635, 1.53623, 1, 0, 0, 1, 1,
1.78233, -0.2336994, 2.59768, 1, 0, 0, 1, 1,
1.816961, -0.6268417, 0.4979383, 0, 0, 0, 1, 1,
1.820794, -0.7534978, 0.3145522, 0, 0, 0, 1, 1,
1.84558, 1.725163, -0.04527588, 0, 0, 0, 1, 1,
1.869418, -0.5504124, 1.562991, 0, 0, 0, 1, 1,
1.901888, 0.06785182, 0.4756229, 0, 0, 0, 1, 1,
1.904619, 0.7827604, 2.813263, 0, 0, 0, 1, 1,
1.905411, 0.06992624, 1.438103, 0, 0, 0, 1, 1,
1.938768, -1.11782, 3.265727, 1, 1, 1, 1, 1,
1.959169, -0.7368044, 2.286698, 1, 1, 1, 1, 1,
1.95936, 0.04549716, 1.182475, 1, 1, 1, 1, 1,
1.966195, -1.462534, 3.473737, 1, 1, 1, 1, 1,
1.969919, -0.8450472, 1.405661, 1, 1, 1, 1, 1,
2.003123, -1.048308, 1.509444, 1, 1, 1, 1, 1,
2.005641, -0.5671856, 1.298264, 1, 1, 1, 1, 1,
2.012152, 0.02233922, 1.276212, 1, 1, 1, 1, 1,
2.031598, -0.811848, 1.140424, 1, 1, 1, 1, 1,
2.047945, -0.2435374, 1.152897, 1, 1, 1, 1, 1,
2.054343, 1.255367, 0.6138956, 1, 1, 1, 1, 1,
2.06106, 1.613439, 1.503232, 1, 1, 1, 1, 1,
2.076882, -0.4269137, 2.551803, 1, 1, 1, 1, 1,
2.094777, 1.067843, 0.7197587, 1, 1, 1, 1, 1,
2.150815, 1.195486, 1.426604, 1, 1, 1, 1, 1,
2.158206, 0.3354388, 1.00882, 0, 0, 1, 1, 1,
2.159724, 0.532099, 1.364772, 1, 0, 0, 1, 1,
2.196767, -0.6304309, 2.854786, 1, 0, 0, 1, 1,
2.243412, -0.4136655, -0.3908681, 1, 0, 0, 1, 1,
2.270663, -1.458189, 3.678597, 1, 0, 0, 1, 1,
2.296761, -0.815872, 3.794564, 1, 0, 0, 1, 1,
2.310968, 0.7022595, 1.180434, 0, 0, 0, 1, 1,
2.330625, -0.8078808, 1.366489, 0, 0, 0, 1, 1,
2.335923, -1.533775, 1.675303, 0, 0, 0, 1, 1,
2.340585, 0.3158965, 1.628425, 0, 0, 0, 1, 1,
2.353412, 0.6080619, 2.227057, 0, 0, 0, 1, 1,
2.439044, -0.9992562, 2.68311, 0, 0, 0, 1, 1,
2.603476, 0.2139303, 1.967703, 0, 0, 0, 1, 1,
2.678169, 1.213372, -0.1740374, 1, 1, 1, 1, 1,
2.714332, -0.1318821, 2.716142, 1, 1, 1, 1, 1,
2.969312, 1.38185, 0.2178612, 1, 1, 1, 1, 1,
3.029109, 2.772157, 0.9193046, 1, 1, 1, 1, 1,
3.262187, -0.2871628, 1.15694, 1, 1, 1, 1, 1,
3.341314, 1.091388, 2.278837, 1, 1, 1, 1, 1,
3.465561, 2.815893, 1.121132, 1, 1, 1, 1, 1
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
var radius = 9.243174;
var distance = 32.46626;
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
mvMatrix.translate( -0.2373444, -0.001188517, 0.1928535 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.46626);
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
