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
-3.393698, -0.7808648, -0.1536146, 1, 0, 0, 1,
-2.902952, -1.591104, -3.757306, 1, 0.007843138, 0, 1,
-2.777941, -0.1138009, -2.316919, 1, 0.01176471, 0, 1,
-2.755055, 1.095302, 1.380897, 1, 0.01960784, 0, 1,
-2.445769, -2.893782, -2.062217, 1, 0.02352941, 0, 1,
-2.401108, 0.9600707, -2.689755, 1, 0.03137255, 0, 1,
-2.363083, -0.3402501, -2.629121, 1, 0.03529412, 0, 1,
-2.315658, -0.01707276, -0.8225158, 1, 0.04313726, 0, 1,
-2.300957, -2.342174, -2.373674, 1, 0.04705882, 0, 1,
-2.258909, -0.8399032, -1.154308, 1, 0.05490196, 0, 1,
-2.204314, -1.226272, -1.360753, 1, 0.05882353, 0, 1,
-2.181433, 1.008576, -2.551374, 1, 0.06666667, 0, 1,
-2.122622, -0.1153429, -4.034719, 1, 0.07058824, 0, 1,
-2.065489, 0.6903058, -0.3585417, 1, 0.07843138, 0, 1,
-2.054364, -0.6318503, -1.371227, 1, 0.08235294, 0, 1,
-2.049858, 0.1308102, -1.736943, 1, 0.09019608, 0, 1,
-1.993521, -0.2023776, -2.993983, 1, 0.09411765, 0, 1,
-1.965181, 0.4389109, 0.01996991, 1, 0.1019608, 0, 1,
-1.942825, -0.3453018, -1.443536, 1, 0.1098039, 0, 1,
-1.917883, -1.41468, -1.690012, 1, 0.1137255, 0, 1,
-1.902383, -0.1837399, -0.6667557, 1, 0.1215686, 0, 1,
-1.89725, -0.6369711, -2.325391, 1, 0.1254902, 0, 1,
-1.870123, 1.049535, -1.569353, 1, 0.1333333, 0, 1,
-1.824753, 0.004384014, -1.25052, 1, 0.1372549, 0, 1,
-1.824748, 0.9110767, -2.083562, 1, 0.145098, 0, 1,
-1.820898, -0.532641, -1.700588, 1, 0.1490196, 0, 1,
-1.809923, 0.8441632, -0.268435, 1, 0.1568628, 0, 1,
-1.800201, -0.5465387, -1.815801, 1, 0.1607843, 0, 1,
-1.794861, 0.9179395, 1.367674, 1, 0.1686275, 0, 1,
-1.783729, -0.5317212, -1.645584, 1, 0.172549, 0, 1,
-1.781613, -0.07078354, -1.938795, 1, 0.1803922, 0, 1,
-1.779677, 0.6134154, -1.464893, 1, 0.1843137, 0, 1,
-1.775781, -1.165892, -0.2377377, 1, 0.1921569, 0, 1,
-1.771765, 1.49412, -0.2107345, 1, 0.1960784, 0, 1,
-1.754861, 0.6589396, -0.5216923, 1, 0.2039216, 0, 1,
-1.753568, -1.317092, -1.488806, 1, 0.2117647, 0, 1,
-1.746911, 0.04052045, -0.3760405, 1, 0.2156863, 0, 1,
-1.741855, 0.06082743, -1.752801, 1, 0.2235294, 0, 1,
-1.741434, -0.01722563, -0.8666881, 1, 0.227451, 0, 1,
-1.732501, -0.1657983, -0.4708246, 1, 0.2352941, 0, 1,
-1.726353, 1.578971, -1.941635, 1, 0.2392157, 0, 1,
-1.717405, -0.09662192, -2.043201, 1, 0.2470588, 0, 1,
-1.681745, -0.9274019, -1.010097, 1, 0.2509804, 0, 1,
-1.677833, -1.054364, -1.6384, 1, 0.2588235, 0, 1,
-1.621484, 0.1465748, -1.44913, 1, 0.2627451, 0, 1,
-1.613676, -0.4156067, -1.790423, 1, 0.2705882, 0, 1,
-1.611579, 1.654742, -1.414949, 1, 0.2745098, 0, 1,
-1.592786, 0.8564384, -1.195132, 1, 0.282353, 0, 1,
-1.588842, -1.161306, -1.866879, 1, 0.2862745, 0, 1,
-1.584096, 1.382924, -0.5676987, 1, 0.2941177, 0, 1,
-1.581487, -1.085112, -1.344261, 1, 0.3019608, 0, 1,
-1.57789, -3.083343, -5.057479, 1, 0.3058824, 0, 1,
-1.572805, 0.8413329, 0.4221339, 1, 0.3137255, 0, 1,
-1.535304, 0.3868214, -0.05817527, 1, 0.3176471, 0, 1,
-1.524023, 0.5000454, -0.9474956, 1, 0.3254902, 0, 1,
-1.518027, -0.04981841, -0.7615579, 1, 0.3294118, 0, 1,
-1.517626, 1.717882, -0.4585153, 1, 0.3372549, 0, 1,
-1.515189, -0.5768846, -2.339314, 1, 0.3411765, 0, 1,
-1.513751, 0.8023837, 0.4398585, 1, 0.3490196, 0, 1,
-1.511539, -0.258705, -1.367038, 1, 0.3529412, 0, 1,
-1.504633, 0.04114901, -2.961303, 1, 0.3607843, 0, 1,
-1.481824, 0.5268092, -2.134712, 1, 0.3647059, 0, 1,
-1.478343, 1.645302, -0.6737465, 1, 0.372549, 0, 1,
-1.472021, 0.1233574, -3.093547, 1, 0.3764706, 0, 1,
-1.469583, 0.8550383, -1.032937, 1, 0.3843137, 0, 1,
-1.463562, 0.675147, 0.5330387, 1, 0.3882353, 0, 1,
-1.460688, -0.236839, -1.14913, 1, 0.3960784, 0, 1,
-1.457703, 1.507246, -2.026993, 1, 0.4039216, 0, 1,
-1.447454, 1.523049, -1.265488, 1, 0.4078431, 0, 1,
-1.42708, 1.225696, -1.519334, 1, 0.4156863, 0, 1,
-1.423459, 1.036147, -1.03711, 1, 0.4196078, 0, 1,
-1.423234, 0.04916783, -1.225026, 1, 0.427451, 0, 1,
-1.422621, -0.9702602, -2.063882, 1, 0.4313726, 0, 1,
-1.413265, 0.5647788, -1.661141, 1, 0.4392157, 0, 1,
-1.389766, -1.266084, -3.17313, 1, 0.4431373, 0, 1,
-1.386863, 1.859817, 1.766196, 1, 0.4509804, 0, 1,
-1.379625, -0.366767, -2.136374, 1, 0.454902, 0, 1,
-1.376526, 0.003412385, -2.010875, 1, 0.4627451, 0, 1,
-1.369711, -0.9753913, -2.936917, 1, 0.4666667, 0, 1,
-1.368779, -0.9185294, -2.038523, 1, 0.4745098, 0, 1,
-1.368282, -0.3615961, -0.3894033, 1, 0.4784314, 0, 1,
-1.36826, -0.926861, -1.398937, 1, 0.4862745, 0, 1,
-1.366996, 0.8428332, -2.488316, 1, 0.4901961, 0, 1,
-1.363292, -0.4569043, -2.974665, 1, 0.4980392, 0, 1,
-1.362506, -0.4985895, -1.476698, 1, 0.5058824, 0, 1,
-1.350888, 0.2858213, -0.701576, 1, 0.509804, 0, 1,
-1.343645, -1.226055, -3.131845, 1, 0.5176471, 0, 1,
-1.340027, 1.074588, -0.5766598, 1, 0.5215687, 0, 1,
-1.332957, 0.924493, 0.424086, 1, 0.5294118, 0, 1,
-1.314307, -1.159534, -1.777854, 1, 0.5333334, 0, 1,
-1.313674, -0.7271197, -3.269694, 1, 0.5411765, 0, 1,
-1.306449, -1.518041, -2.658441, 1, 0.5450981, 0, 1,
-1.300728, 0.9804689, -2.144335, 1, 0.5529412, 0, 1,
-1.298584, -1.371179, -2.973468, 1, 0.5568628, 0, 1,
-1.297987, 0.07023888, -0.5293672, 1, 0.5647059, 0, 1,
-1.289206, -2.605226, -1.523235, 1, 0.5686275, 0, 1,
-1.288752, -1.19581, -3.201982, 1, 0.5764706, 0, 1,
-1.288016, 0.1320861, -3.072722, 1, 0.5803922, 0, 1,
-1.286361, 0.3316667, -1.624108, 1, 0.5882353, 0, 1,
-1.266094, -0.01976827, -1.814755, 1, 0.5921569, 0, 1,
-1.264573, -0.4687986, -1.5096, 1, 0.6, 0, 1,
-1.258707, 0.7405249, -1.500432, 1, 0.6078432, 0, 1,
-1.255935, 0.333445, -0.06641785, 1, 0.6117647, 0, 1,
-1.253358, 0.2517288, -0.7139884, 1, 0.6196079, 0, 1,
-1.246861, -0.2045813, -1.514209, 1, 0.6235294, 0, 1,
-1.246746, 1.275549, -0.4988993, 1, 0.6313726, 0, 1,
-1.236519, 0.5470519, -1.648165, 1, 0.6352941, 0, 1,
-1.230076, -0.1281615, -1.139157, 1, 0.6431373, 0, 1,
-1.229698, 1.011134, -0.6469155, 1, 0.6470588, 0, 1,
-1.224213, 1.704521, -1.421819, 1, 0.654902, 0, 1,
-1.221325, -0.8187711, -2.107608, 1, 0.6588235, 0, 1,
-1.212646, 0.0288667, -3.323387, 1, 0.6666667, 0, 1,
-1.212058, -1.391142, -2.38899, 1, 0.6705883, 0, 1,
-1.209156, -0.273128, -0.0842902, 1, 0.6784314, 0, 1,
-1.197531, -2.758416, -2.722659, 1, 0.682353, 0, 1,
-1.194123, -1.647762, -2.128291, 1, 0.6901961, 0, 1,
-1.188561, 0.05489047, -2.064617, 1, 0.6941177, 0, 1,
-1.186124, -0.2792014, -1.522401, 1, 0.7019608, 0, 1,
-1.183031, -0.02325799, -0.2030642, 1, 0.7098039, 0, 1,
-1.181683, -0.2654922, -1.971907, 1, 0.7137255, 0, 1,
-1.179181, 0.2513075, -0.9456485, 1, 0.7215686, 0, 1,
-1.171455, 1.241154, -2.239697, 1, 0.7254902, 0, 1,
-1.163888, 0.2178304, -0.6626433, 1, 0.7333333, 0, 1,
-1.154735, 1.139324, 0.377813, 1, 0.7372549, 0, 1,
-1.141695, 0.456024, -2.037012, 1, 0.7450981, 0, 1,
-1.136208, -0.0592352, -1.61033, 1, 0.7490196, 0, 1,
-1.135316, -0.07181442, 0.5759413, 1, 0.7568628, 0, 1,
-1.126932, 1.589759, 0.68608, 1, 0.7607843, 0, 1,
-1.12506, 0.3566122, -0.4054728, 1, 0.7686275, 0, 1,
-1.124191, 0.01400776, -1.944572, 1, 0.772549, 0, 1,
-1.112178, 0.09113289, -3.836009, 1, 0.7803922, 0, 1,
-1.111246, -0.2203006, -2.421185, 1, 0.7843137, 0, 1,
-1.111177, -1.808947, -2.324177, 1, 0.7921569, 0, 1,
-1.110264, 0.06715911, -0.3141865, 1, 0.7960784, 0, 1,
-1.092547, -0.2386259, -2.156534, 1, 0.8039216, 0, 1,
-1.087497, -0.7264848, -2.996412, 1, 0.8117647, 0, 1,
-1.079286, -1.241353, -3.546745, 1, 0.8156863, 0, 1,
-1.071462, -0.20195, -2.853732, 1, 0.8235294, 0, 1,
-1.069027, -0.05153065, -2.297696, 1, 0.827451, 0, 1,
-1.064783, -0.7362841, -2.79427, 1, 0.8352941, 0, 1,
-1.063161, -0.5986588, -1.259556, 1, 0.8392157, 0, 1,
-1.056666, 0.0314218, -1.425371, 1, 0.8470588, 0, 1,
-1.0565, 0.2706985, -0.5903205, 1, 0.8509804, 0, 1,
-1.053688, -0.377967, -2.095738, 1, 0.8588235, 0, 1,
-1.051923, -0.02168676, -1.656134, 1, 0.8627451, 0, 1,
-1.047429, 0.7189808, 1.099659, 1, 0.8705882, 0, 1,
-1.045424, 1.052493, -1.292852, 1, 0.8745098, 0, 1,
-1.0426, -0.2546557, -1.068463, 1, 0.8823529, 0, 1,
-1.027341, -1.185016, -3.449132, 1, 0.8862745, 0, 1,
-1.02298, -1.386009, -1.764663, 1, 0.8941177, 0, 1,
-1.022012, 0.3678136, -2.721175, 1, 0.8980392, 0, 1,
-1.016431, -1.435295, -1.48575, 1, 0.9058824, 0, 1,
-1.014641, -0.7722673, -2.744375, 1, 0.9137255, 0, 1,
-1.011771, 0.4023171, -0.533174, 1, 0.9176471, 0, 1,
-1.010803, -0.1452082, -2.247097, 1, 0.9254902, 0, 1,
-1.003534, -0.3327806, -1.972605, 1, 0.9294118, 0, 1,
-1.000919, -0.09140663, -1.404714, 1, 0.9372549, 0, 1,
-0.991263, -0.01108074, 1.353829, 1, 0.9411765, 0, 1,
-0.9890981, 0.8537424, 0.03905812, 1, 0.9490196, 0, 1,
-0.9860603, -0.1081522, -2.246173, 1, 0.9529412, 0, 1,
-0.9847065, 1.087342, -0.7845399, 1, 0.9607843, 0, 1,
-0.9692012, 2.320163, -0.9340155, 1, 0.9647059, 0, 1,
-0.9673595, -1.42256, -3.81445, 1, 0.972549, 0, 1,
-0.9620001, 0.06464276, -1.951044, 1, 0.9764706, 0, 1,
-0.9584773, 1.485062, -0.1165056, 1, 0.9843137, 0, 1,
-0.9573391, 0.9208954, 0.7680393, 1, 0.9882353, 0, 1,
-0.9493527, -0.9425002, -2.268119, 1, 0.9960784, 0, 1,
-0.9493291, -0.08994683, -2.380108, 0.9960784, 1, 0, 1,
-0.9423209, 0.5845963, -2.102615, 0.9921569, 1, 0, 1,
-0.9387452, -0.9553705, -2.528823, 0.9843137, 1, 0, 1,
-0.9381911, 0.4102359, -1.197051, 0.9803922, 1, 0, 1,
-0.9365907, -0.9825484, -3.180098, 0.972549, 1, 0, 1,
-0.9240969, -0.4604258, -2.360155, 0.9686275, 1, 0, 1,
-0.9214458, -1.119103, -4.475242, 0.9607843, 1, 0, 1,
-0.9134216, -0.1556578, 0.2648772, 0.9568627, 1, 0, 1,
-0.9119814, 0.8771219, -0.5033473, 0.9490196, 1, 0, 1,
-0.9073851, -0.3982007, -1.93953, 0.945098, 1, 0, 1,
-0.9000301, -0.5145171, -1.412623, 0.9372549, 1, 0, 1,
-0.8985265, -0.02815795, -0.5782916, 0.9333333, 1, 0, 1,
-0.8912333, -0.02669444, 1.093202, 0.9254902, 1, 0, 1,
-0.8856692, -0.748216, -1.702588, 0.9215686, 1, 0, 1,
-0.8836671, -0.4740907, 0.2500251, 0.9137255, 1, 0, 1,
-0.879714, -1.896052, -2.659036, 0.9098039, 1, 0, 1,
-0.8776079, 1.265154, -1.173169, 0.9019608, 1, 0, 1,
-0.8662305, -0.1278747, -1.956444, 0.8941177, 1, 0, 1,
-0.8660929, -0.8353716, -0.4458699, 0.8901961, 1, 0, 1,
-0.8657998, 0.002224186, -0.2252499, 0.8823529, 1, 0, 1,
-0.8540691, 0.9876303, 0.3201818, 0.8784314, 1, 0, 1,
-0.8517694, -0.1653512, -1.921182, 0.8705882, 1, 0, 1,
-0.8502814, 0.8023883, -1.95539, 0.8666667, 1, 0, 1,
-0.8482858, -0.4464643, -2.261976, 0.8588235, 1, 0, 1,
-0.8431252, -0.2617161, -1.174658, 0.854902, 1, 0, 1,
-0.8408105, -0.7884831, -2.919548, 0.8470588, 1, 0, 1,
-0.839466, 0.3843783, -1.803147, 0.8431373, 1, 0, 1,
-0.8392665, 2.850695, 0.7684089, 0.8352941, 1, 0, 1,
-0.8391252, 1.949605, -0.8868978, 0.8313726, 1, 0, 1,
-0.8358591, -1.913736, -1.790652, 0.8235294, 1, 0, 1,
-0.8312686, 0.3941565, -0.9255442, 0.8196079, 1, 0, 1,
-0.8289151, -0.8872796, -1.304709, 0.8117647, 1, 0, 1,
-0.8257463, 0.5971784, 0.5763918, 0.8078431, 1, 0, 1,
-0.8254524, -0.06008619, -2.063251, 0.8, 1, 0, 1,
-0.8175265, 0.4679732, -0.8002822, 0.7921569, 1, 0, 1,
-0.8134694, -0.0362079, -0.6287513, 0.7882353, 1, 0, 1,
-0.8123081, -0.4522837, -2.517726, 0.7803922, 1, 0, 1,
-0.8030338, -0.4361218, -3.109022, 0.7764706, 1, 0, 1,
-0.7964728, 0.2813767, 0.03634672, 0.7686275, 1, 0, 1,
-0.7886944, 0.8136718, 2.295833, 0.7647059, 1, 0, 1,
-0.7884119, -0.3947543, -2.596403, 0.7568628, 1, 0, 1,
-0.7882347, -0.6905295, 0.2225436, 0.7529412, 1, 0, 1,
-0.7879902, -0.9766452, -2.382981, 0.7450981, 1, 0, 1,
-0.7879022, -0.9405915, -0.996411, 0.7411765, 1, 0, 1,
-0.7825341, -0.3239322, -2.835359, 0.7333333, 1, 0, 1,
-0.7752329, -0.04911207, 0.3297287, 0.7294118, 1, 0, 1,
-0.7739582, -0.01122546, -1.53526, 0.7215686, 1, 0, 1,
-0.7672252, -1.083068, -2.283033, 0.7176471, 1, 0, 1,
-0.7601639, 1.244075, 1.047334, 0.7098039, 1, 0, 1,
-0.7599087, 1.059526, -1.700287, 0.7058824, 1, 0, 1,
-0.7541348, -0.719123, -1.763144, 0.6980392, 1, 0, 1,
-0.7397193, 0.07091427, -1.241254, 0.6901961, 1, 0, 1,
-0.7193248, 0.2970143, -0.5618582, 0.6862745, 1, 0, 1,
-0.7171075, 0.4895445, -1.357337, 0.6784314, 1, 0, 1,
-0.7164043, 0.8294875, -0.6400781, 0.6745098, 1, 0, 1,
-0.7155651, -0.2371273, -0.8538844, 0.6666667, 1, 0, 1,
-0.7154729, 0.1331269, -0.4924284, 0.6627451, 1, 0, 1,
-0.7061988, 1.113549, -1.897498, 0.654902, 1, 0, 1,
-0.7048938, -0.4491816, -1.941203, 0.6509804, 1, 0, 1,
-0.7013642, -0.3552333, -2.146716, 0.6431373, 1, 0, 1,
-0.6995372, 0.2286969, -3.768555, 0.6392157, 1, 0, 1,
-0.6981375, -0.3340164, -1.92793, 0.6313726, 1, 0, 1,
-0.6940113, 0.3889182, -0.98553, 0.627451, 1, 0, 1,
-0.692707, 0.7175745, -1.831972, 0.6196079, 1, 0, 1,
-0.6918105, 0.8874615, -1.31836, 0.6156863, 1, 0, 1,
-0.6910101, -0.3784072, -3.71624, 0.6078432, 1, 0, 1,
-0.6907967, -0.9618602, -1.445937, 0.6039216, 1, 0, 1,
-0.6877491, 0.5733194, -1.88678, 0.5960785, 1, 0, 1,
-0.684024, 0.4391445, -0.173347, 0.5882353, 1, 0, 1,
-0.6793968, -0.684077, -2.460829, 0.5843138, 1, 0, 1,
-0.6782456, -0.7224311, -1.218718, 0.5764706, 1, 0, 1,
-0.6758932, 0.8754813, 0.8711919, 0.572549, 1, 0, 1,
-0.6752326, 1.533966, -0.5469903, 0.5647059, 1, 0, 1,
-0.6751809, -1.070955, -3.070846, 0.5607843, 1, 0, 1,
-0.667457, 0.01815965, -0.2842258, 0.5529412, 1, 0, 1,
-0.6623967, 1.329948, 0.6663703, 0.5490196, 1, 0, 1,
-0.6608313, -0.455607, -2.468746, 0.5411765, 1, 0, 1,
-0.6575124, 0.03556788, -3.392518, 0.5372549, 1, 0, 1,
-0.6568096, 0.8548369, -1.43788, 0.5294118, 1, 0, 1,
-0.6533694, 2.879292, -0.9783918, 0.5254902, 1, 0, 1,
-0.6515297, 0.1915205, 0.04174675, 0.5176471, 1, 0, 1,
-0.650075, 0.4526847, -2.238456, 0.5137255, 1, 0, 1,
-0.6489695, -0.7107799, -2.322471, 0.5058824, 1, 0, 1,
-0.6426044, 1.437101, 0.5770135, 0.5019608, 1, 0, 1,
-0.6376575, 0.6699814, -1.684731, 0.4941176, 1, 0, 1,
-0.6342289, 0.5451531, 1.52473, 0.4862745, 1, 0, 1,
-0.6290511, 0.5872683, 1.136639, 0.4823529, 1, 0, 1,
-0.6236635, 1.806941, -0.003038288, 0.4745098, 1, 0, 1,
-0.6179198, 0.2101553, 0.636103, 0.4705882, 1, 0, 1,
-0.6061925, -0.3481331, -0.7148765, 0.4627451, 1, 0, 1,
-0.6061633, -1.104286, -3.218692, 0.4588235, 1, 0, 1,
-0.6049091, 1.40762, -0.003584184, 0.4509804, 1, 0, 1,
-0.6026266, 0.6080713, -0.2919209, 0.4470588, 1, 0, 1,
-0.5918627, 0.3505616, -3.202098, 0.4392157, 1, 0, 1,
-0.5864744, 0.4653524, -1.388028, 0.4352941, 1, 0, 1,
-0.5845674, 2.79237, -1.147229, 0.427451, 1, 0, 1,
-0.5829951, 0.1953855, -1.075901, 0.4235294, 1, 0, 1,
-0.5822021, 1.499555, 0.2896845, 0.4156863, 1, 0, 1,
-0.5817039, -0.1055096, -2.462617, 0.4117647, 1, 0, 1,
-0.5802537, 1.097094, -1.667282, 0.4039216, 1, 0, 1,
-0.5721668, -0.7191831, -2.591697, 0.3960784, 1, 0, 1,
-0.5696554, 0.3225864, -0.4245251, 0.3921569, 1, 0, 1,
-0.5616377, -0.3626488, -2.989269, 0.3843137, 1, 0, 1,
-0.5615559, -2.570527, -3.662558, 0.3803922, 1, 0, 1,
-0.5596685, 0.24493, -0.5882994, 0.372549, 1, 0, 1,
-0.5589826, -1.422462, -1.974725, 0.3686275, 1, 0, 1,
-0.55878, -0.9845472, -2.43891, 0.3607843, 1, 0, 1,
-0.5586584, 0.3511286, -2.128444, 0.3568628, 1, 0, 1,
-0.5580955, -0.1131975, -3.59839, 0.3490196, 1, 0, 1,
-0.555702, 1.080568, -0.1244235, 0.345098, 1, 0, 1,
-0.5554264, 1.301377, 0.5059487, 0.3372549, 1, 0, 1,
-0.54279, 1.388141, -1.771316, 0.3333333, 1, 0, 1,
-0.5411687, -0.4672811, -3.15628, 0.3254902, 1, 0, 1,
-0.54081, 0.4334173, 0.2826046, 0.3215686, 1, 0, 1,
-0.5398048, -1.28854, -1.787371, 0.3137255, 1, 0, 1,
-0.5320926, -0.3696295, -3.08717, 0.3098039, 1, 0, 1,
-0.5288702, 0.2061915, -1.166386, 0.3019608, 1, 0, 1,
-0.5287102, 0.3102959, 1.06977, 0.2941177, 1, 0, 1,
-0.527293, -1.486551, -1.649437, 0.2901961, 1, 0, 1,
-0.5254952, -0.350615, -2.771937, 0.282353, 1, 0, 1,
-0.5196041, 0.7679226, -0.545615, 0.2784314, 1, 0, 1,
-0.5142606, -0.2080622, -1.056741, 0.2705882, 1, 0, 1,
-0.5103415, 0.5431392, -1.092057, 0.2666667, 1, 0, 1,
-0.5090854, -0.2070379, -2.041465, 0.2588235, 1, 0, 1,
-0.5079997, -0.04496968, -1.163532, 0.254902, 1, 0, 1,
-0.5031305, -0.9905503, -3.216556, 0.2470588, 1, 0, 1,
-0.5021817, 0.1407769, -3.588724, 0.2431373, 1, 0, 1,
-0.5013538, -0.4696046, -3.045024, 0.2352941, 1, 0, 1,
-0.4995322, 1.36403, -0.5094659, 0.2313726, 1, 0, 1,
-0.4987583, -0.1250465, -2.111004, 0.2235294, 1, 0, 1,
-0.4985455, 1.517069, 1.072309, 0.2196078, 1, 0, 1,
-0.498476, 1.23207, 0.3694902, 0.2117647, 1, 0, 1,
-0.4983487, 0.577599, -0.6044941, 0.2078431, 1, 0, 1,
-0.4967537, 1.18818, -0.7647303, 0.2, 1, 0, 1,
-0.4958498, 1.897373, 0.007793055, 0.1921569, 1, 0, 1,
-0.4932711, 0.6699721, 0.5263195, 0.1882353, 1, 0, 1,
-0.4931336, 1.740573, 0.3636643, 0.1803922, 1, 0, 1,
-0.4930902, -0.2716836, 0.1898081, 0.1764706, 1, 0, 1,
-0.4919563, -0.8804163, -2.926734, 0.1686275, 1, 0, 1,
-0.4826303, -0.4112802, -2.908559, 0.1647059, 1, 0, 1,
-0.4785415, -0.7441644, -3.305086, 0.1568628, 1, 0, 1,
-0.4728425, 1.169775, -1.178918, 0.1529412, 1, 0, 1,
-0.4673129, -2.076253, -2.762145, 0.145098, 1, 0, 1,
-0.4662251, -0.4491646, -2.305625, 0.1411765, 1, 0, 1,
-0.4612553, -0.06779559, -3.44785, 0.1333333, 1, 0, 1,
-0.4592662, 0.5170444, -2.114037, 0.1294118, 1, 0, 1,
-0.4565427, 0.3341661, -1.951748, 0.1215686, 1, 0, 1,
-0.4506796, 0.9467117, 1.070169, 0.1176471, 1, 0, 1,
-0.4410799, 0.8859323, -0.7192258, 0.1098039, 1, 0, 1,
-0.4392301, -1.361672, -2.963649, 0.1058824, 1, 0, 1,
-0.4389493, 0.7684945, 0.2668025, 0.09803922, 1, 0, 1,
-0.4380508, -2.070232, -2.42687, 0.09019608, 1, 0, 1,
-0.4380022, 0.1508422, -1.851839, 0.08627451, 1, 0, 1,
-0.4378172, -0.8366479, -3.685889, 0.07843138, 1, 0, 1,
-0.431913, 0.576953, -2.908013, 0.07450981, 1, 0, 1,
-0.4299906, 0.8843505, -1.01415, 0.06666667, 1, 0, 1,
-0.4283403, -1.849291, -1.920656, 0.0627451, 1, 0, 1,
-0.4281136, -0.5767856, -2.559491, 0.05490196, 1, 0, 1,
-0.4229338, -1.753421, -2.871537, 0.05098039, 1, 0, 1,
-0.4219206, -1.566951, -2.479949, 0.04313726, 1, 0, 1,
-0.4175546, -0.2806767, -0.9374846, 0.03921569, 1, 0, 1,
-0.4130632, -0.005865514, -0.9886234, 0.03137255, 1, 0, 1,
-0.4119888, -0.5168866, -2.383124, 0.02745098, 1, 0, 1,
-0.4102346, -0.06259903, -3.419185, 0.01960784, 1, 0, 1,
-0.4099008, -0.0120463, 0.04323441, 0.01568628, 1, 0, 1,
-0.4098331, -0.6775188, -3.289084, 0.007843138, 1, 0, 1,
-0.4073268, 1.129186, 0.03377555, 0.003921569, 1, 0, 1,
-0.4034836, -1.250394, -4.213776, 0, 1, 0.003921569, 1,
-0.4020784, -0.004422836, -0.671649, 0, 1, 0.01176471, 1,
-0.4010522, 1.740148, -0.1843293, 0, 1, 0.01568628, 1,
-0.4009833, 0.8630022, -0.6199891, 0, 1, 0.02352941, 1,
-0.3990753, 0.4272543, -0.3484714, 0, 1, 0.02745098, 1,
-0.3979544, 1.381915, -1.043014, 0, 1, 0.03529412, 1,
-0.3971526, 0.4786376, -0.8663931, 0, 1, 0.03921569, 1,
-0.3962173, -0.4744071, -2.509427, 0, 1, 0.04705882, 1,
-0.394152, -1.141087, -3.32298, 0, 1, 0.05098039, 1,
-0.3938255, 0.7668502, -0.2393985, 0, 1, 0.05882353, 1,
-0.3937691, 0.4580095, -1.140941, 0, 1, 0.0627451, 1,
-0.3910014, -0.4158142, -2.508883, 0, 1, 0.07058824, 1,
-0.3900512, 0.8495036, -3.395328, 0, 1, 0.07450981, 1,
-0.3877673, -0.2267888, -3.734908, 0, 1, 0.08235294, 1,
-0.387005, 0.7859271, -0.5329868, 0, 1, 0.08627451, 1,
-0.3794057, 0.8334034, 0.4508373, 0, 1, 0.09411765, 1,
-0.377266, 0.1796278, -0.1796415, 0, 1, 0.1019608, 1,
-0.374334, -0.1753123, -1.962669, 0, 1, 0.1058824, 1,
-0.3678826, 0.726615, -2.006745, 0, 1, 0.1137255, 1,
-0.3660633, 2.442042, 0.002561538, 0, 1, 0.1176471, 1,
-0.3632555, -0.6099735, -1.902645, 0, 1, 0.1254902, 1,
-0.3607009, -0.88564, -4.21016, 0, 1, 0.1294118, 1,
-0.3601853, -1.092376, -3.840331, 0, 1, 0.1372549, 1,
-0.35408, -0.9659273, -3.625152, 0, 1, 0.1411765, 1,
-0.3478195, -1.16546, -0.8418803, 0, 1, 0.1490196, 1,
-0.3418271, -0.07937324, -1.181053, 0, 1, 0.1529412, 1,
-0.3417365, -1.460539, -3.005443, 0, 1, 0.1607843, 1,
-0.3394511, -0.3404433, -3.200315, 0, 1, 0.1647059, 1,
-0.3362569, -0.9932462, -4.263085, 0, 1, 0.172549, 1,
-0.333054, 0.6902168, -1.474631, 0, 1, 0.1764706, 1,
-0.3306575, 1.676306, -0.9984433, 0, 1, 0.1843137, 1,
-0.3255022, 0.3038949, -1.280561, 0, 1, 0.1882353, 1,
-0.3222317, -0.09216859, -2.144445, 0, 1, 0.1960784, 1,
-0.3173468, -0.7669052, -3.360925, 0, 1, 0.2039216, 1,
-0.3110824, 0.4753504, -2.960218, 0, 1, 0.2078431, 1,
-0.3097696, -0.1666517, -2.231691, 0, 1, 0.2156863, 1,
-0.3081671, 0.3100907, -1.03863, 0, 1, 0.2196078, 1,
-0.3058713, -1.516126, -3.244011, 0, 1, 0.227451, 1,
-0.3041375, -0.5754158, -3.580121, 0, 1, 0.2313726, 1,
-0.3021373, -0.470462, -3.346601, 0, 1, 0.2392157, 1,
-0.3015679, -2.279898, -1.242748, 0, 1, 0.2431373, 1,
-0.298115, 0.4372992, 0.1078482, 0, 1, 0.2509804, 1,
-0.2916125, 0.9647728, 0.5110362, 0, 1, 0.254902, 1,
-0.2914954, -0.4950672, -3.112256, 0, 1, 0.2627451, 1,
-0.2881962, -0.7030821, -2.491305, 0, 1, 0.2666667, 1,
-0.2867, -2.739007, -2.743152, 0, 1, 0.2745098, 1,
-0.2781622, 1.407667, -0.5076541, 0, 1, 0.2784314, 1,
-0.2757719, -1.075052, -1.525165, 0, 1, 0.2862745, 1,
-0.2752605, -0.1461542, -0.6133632, 0, 1, 0.2901961, 1,
-0.2746398, -0.7314153, -3.852382, 0, 1, 0.2980392, 1,
-0.2738739, 1.130362, -0.9622882, 0, 1, 0.3058824, 1,
-0.2663558, -1.245161, -2.987894, 0, 1, 0.3098039, 1,
-0.2641746, 0.5857323, 0.865352, 0, 1, 0.3176471, 1,
-0.2637682, 0.7457772, 0.6594576, 0, 1, 0.3215686, 1,
-0.2619412, -0.4929574, -1.878148, 0, 1, 0.3294118, 1,
-0.2614003, -1.996706, -3.38825, 0, 1, 0.3333333, 1,
-0.2598565, -0.6915517, -3.35089, 0, 1, 0.3411765, 1,
-0.258437, -0.5689126, -2.627477, 0, 1, 0.345098, 1,
-0.2550262, 0.0126535, -1.855283, 0, 1, 0.3529412, 1,
-0.254156, 0.7643817, -0.4158346, 0, 1, 0.3568628, 1,
-0.2534729, 1.256672, -0.5723857, 0, 1, 0.3647059, 1,
-0.2479522, 0.7810028, -0.8533598, 0, 1, 0.3686275, 1,
-0.2454317, -0.3853011, -2.594806, 0, 1, 0.3764706, 1,
-0.2450414, 0.495361, -0.4794866, 0, 1, 0.3803922, 1,
-0.244786, -0.04863476, -1.068149, 0, 1, 0.3882353, 1,
-0.2436983, 0.4283642, -1.301327, 0, 1, 0.3921569, 1,
-0.2378042, -0.3885664, -1.055267, 0, 1, 0.4, 1,
-0.2375249, -1.613806, -2.846295, 0, 1, 0.4078431, 1,
-0.2364548, 0.6663119, 1.012143, 0, 1, 0.4117647, 1,
-0.2357645, -0.7086154, -2.012356, 0, 1, 0.4196078, 1,
-0.2332727, -0.5308366, -3.425569, 0, 1, 0.4235294, 1,
-0.2301496, -0.5452361, -2.852524, 0, 1, 0.4313726, 1,
-0.2294755, 0.3339371, -0.5214244, 0, 1, 0.4352941, 1,
-0.2288722, 0.3475591, -0.08193915, 0, 1, 0.4431373, 1,
-0.2245822, 1.423606, 1.768028, 0, 1, 0.4470588, 1,
-0.224113, -0.1145719, -1.622018, 0, 1, 0.454902, 1,
-0.2233304, 1.561913, 0.7172608, 0, 1, 0.4588235, 1,
-0.2214151, 0.2000252, 0.2108765, 0, 1, 0.4666667, 1,
-0.217778, 0.2038366, -0.4309721, 0, 1, 0.4705882, 1,
-0.2162162, 0.5602117, -1.580161, 0, 1, 0.4784314, 1,
-0.2140265, 0.5458385, -1.915916, 0, 1, 0.4823529, 1,
-0.2111701, -0.4805924, -3.543629, 0, 1, 0.4901961, 1,
-0.2091862, 0.6874584, 1.023697, 0, 1, 0.4941176, 1,
-0.2075107, 1.149545, 0.05334755, 0, 1, 0.5019608, 1,
-0.2074713, -0.01145932, -2.323789, 0, 1, 0.509804, 1,
-0.2028823, 0.2484836, -0.8304567, 0, 1, 0.5137255, 1,
-0.2012949, 1.662781, -0.6953287, 0, 1, 0.5215687, 1,
-0.2007435, 0.3497568, 0.3661481, 0, 1, 0.5254902, 1,
-0.2004755, 0.8002288, 0.8934039, 0, 1, 0.5333334, 1,
-0.1995429, 0.5942792, -0.1638805, 0, 1, 0.5372549, 1,
-0.1966391, -0.4128543, -1.805031, 0, 1, 0.5450981, 1,
-0.1894134, -0.2969102, -0.6351229, 0, 1, 0.5490196, 1,
-0.1873039, -1.515126, 0.2961327, 0, 1, 0.5568628, 1,
-0.1814201, -0.471509, -2.56073, 0, 1, 0.5607843, 1,
-0.1797452, 0.6294222, 0.2015784, 0, 1, 0.5686275, 1,
-0.1764753, 0.1598011, -0.1088979, 0, 1, 0.572549, 1,
-0.1761452, 0.345564, -1.033714, 0, 1, 0.5803922, 1,
-0.174407, 0.443953, -1.138339, 0, 1, 0.5843138, 1,
-0.1731059, 0.4155451, -1.830728, 0, 1, 0.5921569, 1,
-0.1623757, -0.9431818, -4.134967, 0, 1, 0.5960785, 1,
-0.1615131, -1.320823, -3.661878, 0, 1, 0.6039216, 1,
-0.1601881, 0.1949706, 0.9001614, 0, 1, 0.6117647, 1,
-0.159574, -0.2387698, -1.755464, 0, 1, 0.6156863, 1,
-0.1560504, -1.895278, -3.988686, 0, 1, 0.6235294, 1,
-0.1559115, 1.840444, 1.293211, 0, 1, 0.627451, 1,
-0.154995, -1.204613, -2.165068, 0, 1, 0.6352941, 1,
-0.146038, -1.089156, -3.758283, 0, 1, 0.6392157, 1,
-0.1402118, 0.6556039, -1.110923, 0, 1, 0.6470588, 1,
-0.1351017, 1.019791, 1.480582, 0, 1, 0.6509804, 1,
-0.1329006, -1.136221, -4.180456, 0, 1, 0.6588235, 1,
-0.1320003, -1.457185, -3.676069, 0, 1, 0.6627451, 1,
-0.1308012, -0.3899809, -3.13076, 0, 1, 0.6705883, 1,
-0.1305236, -1.336041, -4.417744, 0, 1, 0.6745098, 1,
-0.1300046, 0.5112594, 0.2478241, 0, 1, 0.682353, 1,
-0.128814, 0.5412757, -1.09521, 0, 1, 0.6862745, 1,
-0.1233585, -0.3801501, -2.638057, 0, 1, 0.6941177, 1,
-0.1209338, -1.301978, -3.216399, 0, 1, 0.7019608, 1,
-0.118901, -1.115849, -2.281597, 0, 1, 0.7058824, 1,
-0.1148735, -0.8504704, -2.157474, 0, 1, 0.7137255, 1,
-0.1129421, -1.648319, -3.38473, 0, 1, 0.7176471, 1,
-0.1116973, -0.3988883, -3.015746, 0, 1, 0.7254902, 1,
-0.108013, -0.08344532, -2.413174, 0, 1, 0.7294118, 1,
-0.1048677, -1.521613, -3.956764, 0, 1, 0.7372549, 1,
-0.1048359, 0.541908, 0.3451687, 0, 1, 0.7411765, 1,
-0.1040099, 0.4871288, 0.2804922, 0, 1, 0.7490196, 1,
-0.103351, 1.054489, -1.053597, 0, 1, 0.7529412, 1,
-0.1029379, 1.105415, 0.8803826, 0, 1, 0.7607843, 1,
-0.09887878, 0.3700843, -1.363602, 0, 1, 0.7647059, 1,
-0.09746161, -0.2233954, -3.159514, 0, 1, 0.772549, 1,
-0.09478317, 1.064323, 1.578679, 0, 1, 0.7764706, 1,
-0.09393733, -1.293867, -3.953199, 0, 1, 0.7843137, 1,
-0.08948973, -0.6877981, -3.103359, 0, 1, 0.7882353, 1,
-0.08928641, 1.167188, 0.5811331, 0, 1, 0.7960784, 1,
-0.08809888, 0.3744982, 0.49627, 0, 1, 0.8039216, 1,
-0.08220153, 0.3980229, -0.7274267, 0, 1, 0.8078431, 1,
-0.07908006, -0.4131999, -2.911659, 0, 1, 0.8156863, 1,
-0.07470454, -0.8781418, -1.933663, 0, 1, 0.8196079, 1,
-0.07412983, -0.1537448, -3.436391, 0, 1, 0.827451, 1,
-0.07228701, -1.724194, -2.922764, 0, 1, 0.8313726, 1,
-0.07220627, -0.464449, -3.47764, 0, 1, 0.8392157, 1,
-0.06878551, 0.1795637, -1.0606, 0, 1, 0.8431373, 1,
-0.06811854, 0.3931388, 0.8602537, 0, 1, 0.8509804, 1,
-0.06730668, -0.539144, -2.754714, 0, 1, 0.854902, 1,
-0.06639347, -0.612332, -3.162781, 0, 1, 0.8627451, 1,
-0.0657715, 0.8519231, -0.7660629, 0, 1, 0.8666667, 1,
-0.06288894, 0.9018862, -1.576163, 0, 1, 0.8745098, 1,
-0.06055927, -1.608535, -2.822413, 0, 1, 0.8784314, 1,
-0.05606004, 1.726172, 1.052999, 0, 1, 0.8862745, 1,
-0.05124069, -1.273701, -3.543465, 0, 1, 0.8901961, 1,
-0.0473704, -0.6392681, -3.906255, 0, 1, 0.8980392, 1,
-0.04605149, -0.02077626, -2.131951, 0, 1, 0.9058824, 1,
-0.04517612, 0.7144698, 0.4434617, 0, 1, 0.9098039, 1,
-0.04436824, -0.6530169, -2.142905, 0, 1, 0.9176471, 1,
-0.03586328, 1.503687, 0.3094735, 0, 1, 0.9215686, 1,
-0.03475162, 0.3034365, 1.010095, 0, 1, 0.9294118, 1,
-0.03070004, 0.1236561, -0.1752667, 0, 1, 0.9333333, 1,
-0.02836503, 0.01181642, -1.386314, 0, 1, 0.9411765, 1,
-0.02555743, -1.303467, -4.050066, 0, 1, 0.945098, 1,
-0.02248588, -1.081065, -3.693801, 0, 1, 0.9529412, 1,
-0.0201596, -1.335209, -3.430054, 0, 1, 0.9568627, 1,
-0.01984157, 0.2936953, 1.119832, 0, 1, 0.9647059, 1,
-0.01400677, 0.05073782, -0.010536, 0, 1, 0.9686275, 1,
-0.008668507, 0.2803864, 0.6747482, 0, 1, 0.9764706, 1,
-0.007885817, -0.02750702, -1.258598, 0, 1, 0.9803922, 1,
-0.007679477, -1.115618, -1.674959, 0, 1, 0.9882353, 1,
-0.00454748, 0.7980427, -1.230869, 0, 1, 0.9921569, 1,
-0.003932899, -1.335028, -2.24654, 0, 1, 1, 1,
0.006119557, 1.029046, -0.2116096, 0, 0.9921569, 1, 1,
0.006193503, 0.2723694, 0.522189, 0, 0.9882353, 1, 1,
0.006656237, -0.03697478, 2.457742, 0, 0.9803922, 1, 1,
0.007736758, -1.451228, 3.386697, 0, 0.9764706, 1, 1,
0.009468925, -0.1152658, 4.417857, 0, 0.9686275, 1, 1,
0.02224411, 0.2149469, 0.9480362, 0, 0.9647059, 1, 1,
0.02272962, 0.2420585, 0.5319049, 0, 0.9568627, 1, 1,
0.02518099, -1.521846, 3.65517, 0, 0.9529412, 1, 1,
0.0253741, 1.247174, 0.02015032, 0, 0.945098, 1, 1,
0.027226, 0.3231, -0.193778, 0, 0.9411765, 1, 1,
0.03138959, -1.463275, 1.637825, 0, 0.9333333, 1, 1,
0.03606822, 0.6989784, 0.8192449, 0, 0.9294118, 1, 1,
0.03677003, -0.7301384, 2.595087, 0, 0.9215686, 1, 1,
0.04057674, 0.9115528, 1.828596, 0, 0.9176471, 1, 1,
0.04226987, -0.7227232, 3.390851, 0, 0.9098039, 1, 1,
0.04486429, -1.548689, 1.161135, 0, 0.9058824, 1, 1,
0.04798141, -0.004526496, -0.1374361, 0, 0.8980392, 1, 1,
0.05183855, -0.6268133, 4.181986, 0, 0.8901961, 1, 1,
0.05237092, 1.105575, 1.110721, 0, 0.8862745, 1, 1,
0.05599906, -1.359726, 1.835765, 0, 0.8784314, 1, 1,
0.06331619, -2.275578, 3.785875, 0, 0.8745098, 1, 1,
0.06337605, 1.346195, 0.2165748, 0, 0.8666667, 1, 1,
0.0634942, 1.002426, -0.2924189, 0, 0.8627451, 1, 1,
0.06499676, 0.07040584, -0.2512219, 0, 0.854902, 1, 1,
0.06931792, -0.3303938, 1.396867, 0, 0.8509804, 1, 1,
0.07267526, -0.04129057, 1.365103, 0, 0.8431373, 1, 1,
0.07406737, 0.3111575, -0.6115363, 0, 0.8392157, 1, 1,
0.07481917, 2.684831, -0.4673727, 0, 0.8313726, 1, 1,
0.07525421, -0.4156779, 2.072246, 0, 0.827451, 1, 1,
0.07592092, 1.337772, -0.2911885, 0, 0.8196079, 1, 1,
0.08163903, -0.3415371, 3.315642, 0, 0.8156863, 1, 1,
0.08244607, -1.096654, 3.375254, 0, 0.8078431, 1, 1,
0.08355766, 1.215722, 0.1957202, 0, 0.8039216, 1, 1,
0.08425889, -0.01066257, 2.481698, 0, 0.7960784, 1, 1,
0.08485804, -0.1750057, 3.374401, 0, 0.7882353, 1, 1,
0.08800257, 0.9581087, -0.526793, 0, 0.7843137, 1, 1,
0.08820049, 1.606759, 0.4875585, 0, 0.7764706, 1, 1,
0.0884247, -0.4449722, 3.790383, 0, 0.772549, 1, 1,
0.08865274, 1.093605, 1.030114, 0, 0.7647059, 1, 1,
0.0894367, 1.577893, -1.646084, 0, 0.7607843, 1, 1,
0.09075756, -1.788881, 2.696719, 0, 0.7529412, 1, 1,
0.09306303, -1.130619, 3.281358, 0, 0.7490196, 1, 1,
0.09409703, -0.104126, 2.414257, 0, 0.7411765, 1, 1,
0.09481943, -0.3673101, 2.499268, 0, 0.7372549, 1, 1,
0.09483586, 0.2853597, 0.2456086, 0, 0.7294118, 1, 1,
0.09528656, -0.2070802, 2.444467, 0, 0.7254902, 1, 1,
0.09698123, 1.164937, -0.6485008, 0, 0.7176471, 1, 1,
0.107178, -0.1245533, 1.036586, 0, 0.7137255, 1, 1,
0.1079892, -0.4044294, 3.606807, 0, 0.7058824, 1, 1,
0.1088501, 0.1611989, -0.1809118, 0, 0.6980392, 1, 1,
0.1097356, -1.498066, 3.715957, 0, 0.6941177, 1, 1,
0.1119789, 0.6137317, 0.3241078, 0, 0.6862745, 1, 1,
0.1128052, 0.1479606, 0.5097152, 0, 0.682353, 1, 1,
0.1189376, 0.6713756, 1.041719, 0, 0.6745098, 1, 1,
0.1195685, 0.3808976, -0.2251449, 0, 0.6705883, 1, 1,
0.1236571, 0.9159874, 0.01006546, 0, 0.6627451, 1, 1,
0.125264, 1.260629, 0.3131292, 0, 0.6588235, 1, 1,
0.132395, -1.316384, 2.508198, 0, 0.6509804, 1, 1,
0.133407, 1.151971, 1.43206, 0, 0.6470588, 1, 1,
0.1338585, -0.6760817, 2.170202, 0, 0.6392157, 1, 1,
0.1364688, 0.9300144, 1.964396, 0, 0.6352941, 1, 1,
0.1429351, -1.296142, 1.629082, 0, 0.627451, 1, 1,
0.1447007, 0.4409225, -0.9723233, 0, 0.6235294, 1, 1,
0.1506208, -1.184193, 2.926876, 0, 0.6156863, 1, 1,
0.1509882, 1.757218, -0.6781853, 0, 0.6117647, 1, 1,
0.1510451, -0.3865688, 0.9747043, 0, 0.6039216, 1, 1,
0.1514677, -1.399202, 2.404235, 0, 0.5960785, 1, 1,
0.1607512, 0.6429508, 0.2594133, 0, 0.5921569, 1, 1,
0.1613645, 0.5817739, 1.388167, 0, 0.5843138, 1, 1,
0.1617228, -1.136203, 2.218299, 0, 0.5803922, 1, 1,
0.1617575, -1.30511, 3.105041, 0, 0.572549, 1, 1,
0.1617614, -1.101248, 2.776584, 0, 0.5686275, 1, 1,
0.1643166, -0.4764343, 2.368042, 0, 0.5607843, 1, 1,
0.1649104, 0.07690246, 1.493762, 0, 0.5568628, 1, 1,
0.1649629, 0.07752679, 1.179282, 0, 0.5490196, 1, 1,
0.1665167, -0.1876564, 4.082277, 0, 0.5450981, 1, 1,
0.1757496, -0.2268724, 0.5360717, 0, 0.5372549, 1, 1,
0.1813362, -0.4341674, 2.913511, 0, 0.5333334, 1, 1,
0.1820279, -0.2179497, 3.333873, 0, 0.5254902, 1, 1,
0.1825967, 0.3026916, 0.8227366, 0, 0.5215687, 1, 1,
0.1831334, 0.5712938, -0.3418998, 0, 0.5137255, 1, 1,
0.1895397, 0.1874164, 1.466341, 0, 0.509804, 1, 1,
0.1908777, -0.05146251, 3.44717, 0, 0.5019608, 1, 1,
0.1931531, -0.7147749, 1.736924, 0, 0.4941176, 1, 1,
0.1949494, -2.129499, 4.161273, 0, 0.4901961, 1, 1,
0.2003929, 0.1080127, 0.2596981, 0, 0.4823529, 1, 1,
0.202117, 0.335017, 1.600282, 0, 0.4784314, 1, 1,
0.2022438, 0.5856671, 1.03163, 0, 0.4705882, 1, 1,
0.2026411, 0.6751738, 0.8464099, 0, 0.4666667, 1, 1,
0.2061661, -0.8312592, 1.063702, 0, 0.4588235, 1, 1,
0.2107716, -0.8408344, 2.891323, 0, 0.454902, 1, 1,
0.2169555, -0.243451, 1.417949, 0, 0.4470588, 1, 1,
0.2179373, 2.085086, 0.3539817, 0, 0.4431373, 1, 1,
0.2180066, -0.5530486, 3.891196, 0, 0.4352941, 1, 1,
0.2195349, 0.6698428, 2.070704, 0, 0.4313726, 1, 1,
0.2209425, -1.811966, 4.633518, 0, 0.4235294, 1, 1,
0.2219975, 0.654353, -0.1120854, 0, 0.4196078, 1, 1,
0.2260348, 0.1402851, 0.8698497, 0, 0.4117647, 1, 1,
0.2265497, 0.9287701, 0.9190642, 0, 0.4078431, 1, 1,
0.2267262, -0.3122022, 4.749682, 0, 0.4, 1, 1,
0.2319772, 0.3874925, 0.8560541, 0, 0.3921569, 1, 1,
0.2335395, 0.88124, 0.7845183, 0, 0.3882353, 1, 1,
0.2364005, -1.437775, 2.960959, 0, 0.3803922, 1, 1,
0.236801, -0.5914932, 2.191925, 0, 0.3764706, 1, 1,
0.2409024, 0.3306538, -0.04052331, 0, 0.3686275, 1, 1,
0.2411342, 0.2987447, 1.261555, 0, 0.3647059, 1, 1,
0.244369, 0.8313584, -0.1330443, 0, 0.3568628, 1, 1,
0.2457472, 0.5046049, 1.739772, 0, 0.3529412, 1, 1,
0.2462878, 0.2687736, -0.4484036, 0, 0.345098, 1, 1,
0.2495787, -0.5357524, 2.811314, 0, 0.3411765, 1, 1,
0.249596, -0.9033933, 1.016972, 0, 0.3333333, 1, 1,
0.2512121, 0.7202522, -1.209404, 0, 0.3294118, 1, 1,
0.2529918, 0.3842906, 0.3078834, 0, 0.3215686, 1, 1,
0.2538394, -0.6678978, 1.99298, 0, 0.3176471, 1, 1,
0.2555916, 0.214225, 1.64887, 0, 0.3098039, 1, 1,
0.2715897, 1.057546, -1.181926, 0, 0.3058824, 1, 1,
0.2762759, -2.07164, 4.124418, 0, 0.2980392, 1, 1,
0.2792305, 0.5766218, -1.056681, 0, 0.2901961, 1, 1,
0.2804325, -0.5979119, 2.899923, 0, 0.2862745, 1, 1,
0.2808686, -0.5441707, 2.076206, 0, 0.2784314, 1, 1,
0.2834897, -0.4547263, 0.6339883, 0, 0.2745098, 1, 1,
0.2860433, -1.29018, 1.643637, 0, 0.2666667, 1, 1,
0.2895003, -0.1670374, 0.6326017, 0, 0.2627451, 1, 1,
0.2962336, 1.068926, 0.1233509, 0, 0.254902, 1, 1,
0.2970707, -0.7198017, 2.384787, 0, 0.2509804, 1, 1,
0.2984691, 0.002897023, 1.434258, 0, 0.2431373, 1, 1,
0.3012772, 0.2993833, 0.552527, 0, 0.2392157, 1, 1,
0.3048033, -0.8825501, 2.676196, 0, 0.2313726, 1, 1,
0.3093633, 0.7656915, -0.3545134, 0, 0.227451, 1, 1,
0.3105232, -1.439967, 3.089215, 0, 0.2196078, 1, 1,
0.3179204, 1.750595, 0.2655488, 0, 0.2156863, 1, 1,
0.3192904, -1.039588, 1.947033, 0, 0.2078431, 1, 1,
0.3219796, 0.7039429, -0.4098017, 0, 0.2039216, 1, 1,
0.3229176, -0.7973884, 2.881502, 0, 0.1960784, 1, 1,
0.3233556, 0.3494904, 0.7311823, 0, 0.1882353, 1, 1,
0.3237612, -0.05695693, 1.827232, 0, 0.1843137, 1, 1,
0.3294304, -0.1306119, 3.420112, 0, 0.1764706, 1, 1,
0.3300806, 0.2213787, 0.3523533, 0, 0.172549, 1, 1,
0.330269, -1.058211, 2.94751, 0, 0.1647059, 1, 1,
0.3323105, -1.030255, 1.510956, 0, 0.1607843, 1, 1,
0.3367304, -0.3020331, 1.097307, 0, 0.1529412, 1, 1,
0.3371597, -0.3700903, 3.591413, 0, 0.1490196, 1, 1,
0.3395729, -0.987444, 2.755805, 0, 0.1411765, 1, 1,
0.3411216, 0.6509972, -0.1185689, 0, 0.1372549, 1, 1,
0.3411373, 0.3016573, -0.611471, 0, 0.1294118, 1, 1,
0.3412737, -0.547924, 3.104501, 0, 0.1254902, 1, 1,
0.343997, -0.4664375, 2.763625, 0, 0.1176471, 1, 1,
0.3452576, 0.03965473, 0.2237293, 0, 0.1137255, 1, 1,
0.3460405, 0.4078544, 1.045344, 0, 0.1058824, 1, 1,
0.3503729, 1.659526, -0.4191596, 0, 0.09803922, 1, 1,
0.3575101, -0.178483, 2.890444, 0, 0.09411765, 1, 1,
0.3616348, 0.8624566, 0.4043179, 0, 0.08627451, 1, 1,
0.3645667, -1.61913, 3.358689, 0, 0.08235294, 1, 1,
0.3659329, 0.4785528, 1.238203, 0, 0.07450981, 1, 1,
0.368884, 0.6010537, 0.1768985, 0, 0.07058824, 1, 1,
0.3691716, 0.3703185, -0.4927711, 0, 0.0627451, 1, 1,
0.3733099, -0.4312307, 1.149424, 0, 0.05882353, 1, 1,
0.3767721, -0.5089796, 2.390413, 0, 0.05098039, 1, 1,
0.3767855, -1.521088, 2.379404, 0, 0.04705882, 1, 1,
0.3808804, 0.1996392, -0.5043293, 0, 0.03921569, 1, 1,
0.3816476, 0.3466929, 0.5711693, 0, 0.03529412, 1, 1,
0.3851823, 0.3490543, 2.714167, 0, 0.02745098, 1, 1,
0.3929164, -0.845809, 3.558116, 0, 0.02352941, 1, 1,
0.3933586, 0.6031149, 0.3670833, 0, 0.01568628, 1, 1,
0.3952923, 0.723718, 0.7025079, 0, 0.01176471, 1, 1,
0.3967088, 0.8107581, 2.431287, 0, 0.003921569, 1, 1,
0.3984139, -0.4729468, 0.8151343, 0.003921569, 0, 1, 1,
0.4011414, -1.17696, 3.800974, 0.007843138, 0, 1, 1,
0.4029943, -1.561621, 2.440707, 0.01568628, 0, 1, 1,
0.4045857, 1.837059, 1.407749, 0.01960784, 0, 1, 1,
0.4069851, 2.145609, -0.1355227, 0.02745098, 0, 1, 1,
0.4080766, 0.3974245, 0.8154211, 0.03137255, 0, 1, 1,
0.4153949, -1.484271, 3.574186, 0.03921569, 0, 1, 1,
0.4178985, 0.419289, 0.4000771, 0.04313726, 0, 1, 1,
0.4345487, 0.6611869, -1.328061, 0.05098039, 0, 1, 1,
0.4357445, 1.158784, 1.356543, 0.05490196, 0, 1, 1,
0.4368396, 0.4028894, 0.5282409, 0.0627451, 0, 1, 1,
0.4457725, -1.396671, 4.343195, 0.06666667, 0, 1, 1,
0.4482017, -0.6196403, 2.678829, 0.07450981, 0, 1, 1,
0.4484205, 1.264848, 0.3102672, 0.07843138, 0, 1, 1,
0.4497172, -0.06891041, -0.06205118, 0.08627451, 0, 1, 1,
0.4499191, 1.349312, 2.597647, 0.09019608, 0, 1, 1,
0.455482, 1.793864, -0.02321258, 0.09803922, 0, 1, 1,
0.4563715, -0.5299447, 2.193189, 0.1058824, 0, 1, 1,
0.4589995, 1.565034, 0.5030866, 0.1098039, 0, 1, 1,
0.4606224, 0.1043276, -0.1892142, 0.1176471, 0, 1, 1,
0.4643386, -0.2334429, 1.859812, 0.1215686, 0, 1, 1,
0.464493, 0.507987, 1.632208, 0.1294118, 0, 1, 1,
0.4654631, 0.07094955, 3.364397, 0.1333333, 0, 1, 1,
0.4697581, 0.3756784, 2.664497, 0.1411765, 0, 1, 1,
0.472491, -0.5567565, 1.325868, 0.145098, 0, 1, 1,
0.4732532, 0.4653862, 0.7208462, 0.1529412, 0, 1, 1,
0.4747705, -1.535044, 4.277463, 0.1568628, 0, 1, 1,
0.4749969, 1.425769, 0.5396563, 0.1647059, 0, 1, 1,
0.481313, 1.819195, 0.7475696, 0.1686275, 0, 1, 1,
0.48181, 0.4846093, 1.675922, 0.1764706, 0, 1, 1,
0.4836821, 0.009612439, 2.697958, 0.1803922, 0, 1, 1,
0.4838775, 1.991949, -1.258027, 0.1882353, 0, 1, 1,
0.490368, 0.9747458, 0.3673578, 0.1921569, 0, 1, 1,
0.4932152, 2.026427, -0.8277633, 0.2, 0, 1, 1,
0.4945483, 1.313079, -1.713842, 0.2078431, 0, 1, 1,
0.4969755, -0.4363141, 3.386332, 0.2117647, 0, 1, 1,
0.5019834, 1.273585, 0.376708, 0.2196078, 0, 1, 1,
0.5035315, -0.7181638, 2.583828, 0.2235294, 0, 1, 1,
0.5062783, -0.9313698, 2.800881, 0.2313726, 0, 1, 1,
0.5093902, -0.9209611, 2.022937, 0.2352941, 0, 1, 1,
0.513086, 0.8363125, 0.8948983, 0.2431373, 0, 1, 1,
0.513919, -0.1105834, 1.627651, 0.2470588, 0, 1, 1,
0.5173137, -0.3476117, 3.351084, 0.254902, 0, 1, 1,
0.5220832, -0.01600233, 0.03040945, 0.2588235, 0, 1, 1,
0.5281442, 0.1430279, 0.5115001, 0.2666667, 0, 1, 1,
0.5355735, 0.1844477, 1.151419, 0.2705882, 0, 1, 1,
0.5412443, -1.599898, 2.419993, 0.2784314, 0, 1, 1,
0.5486651, 3.000741, -0.976448, 0.282353, 0, 1, 1,
0.5487847, -0.6208843, -0.3910216, 0.2901961, 0, 1, 1,
0.5498964, 1.256596, -0.2787115, 0.2941177, 0, 1, 1,
0.5501573, -0.5134653, 1.165202, 0.3019608, 0, 1, 1,
0.5512656, -0.6607764, 2.29584, 0.3098039, 0, 1, 1,
0.5549549, -0.8060525, 4.235307, 0.3137255, 0, 1, 1,
0.5688499, -0.03468909, 1.952771, 0.3215686, 0, 1, 1,
0.5728578, 0.7291427, 1.779725, 0.3254902, 0, 1, 1,
0.5756191, 0.6353266, 0.7039438, 0.3333333, 0, 1, 1,
0.5850911, -0.3587014, 2.655186, 0.3372549, 0, 1, 1,
0.5855479, 0.1211898, 1.414405, 0.345098, 0, 1, 1,
0.5875427, -0.2430424, 2.34445, 0.3490196, 0, 1, 1,
0.5914336, 0.1723298, 1.129251, 0.3568628, 0, 1, 1,
0.5940775, 0.9327948, 0.9310536, 0.3607843, 0, 1, 1,
0.5980195, 0.8211123, 0.2832661, 0.3686275, 0, 1, 1,
0.6049033, -0.9065479, 2.604601, 0.372549, 0, 1, 1,
0.6049109, 0.8627027, 2.238776, 0.3803922, 0, 1, 1,
0.6055421, -0.6527787, 3.254167, 0.3843137, 0, 1, 1,
0.613094, 0.1991812, 2.036237, 0.3921569, 0, 1, 1,
0.614447, 0.4021574, 3.328475, 0.3960784, 0, 1, 1,
0.6243854, -0.6696019, 1.772929, 0.4039216, 0, 1, 1,
0.6275426, -1.199769, 1.866116, 0.4117647, 0, 1, 1,
0.6294918, -1.634523, 2.55248, 0.4156863, 0, 1, 1,
0.6315509, -0.3199705, 1.891727, 0.4235294, 0, 1, 1,
0.6327202, 0.3006964, 2.711952, 0.427451, 0, 1, 1,
0.6333868, -1.435532, 2.524252, 0.4352941, 0, 1, 1,
0.6405973, -0.4933378, 2.831939, 0.4392157, 0, 1, 1,
0.6422642, -0.09578145, 1.666992, 0.4470588, 0, 1, 1,
0.6435353, 1.857157, 1.910702, 0.4509804, 0, 1, 1,
0.6453827, 0.9778129, 0.7566421, 0.4588235, 0, 1, 1,
0.6474873, 0.2582985, 0.4217193, 0.4627451, 0, 1, 1,
0.6510811, -0.5544412, 1.908738, 0.4705882, 0, 1, 1,
0.6571488, 1.019936, 1.767361, 0.4745098, 0, 1, 1,
0.6583434, 1.014354, 2.786319, 0.4823529, 0, 1, 1,
0.6591626, -0.02919912, 1.345635, 0.4862745, 0, 1, 1,
0.666887, -0.4789586, 2.174817, 0.4941176, 0, 1, 1,
0.6698853, 0.003069367, 1.218538, 0.5019608, 0, 1, 1,
0.6723685, 0.2678796, -0.5887291, 0.5058824, 0, 1, 1,
0.6740612, 0.04814621, 1.231643, 0.5137255, 0, 1, 1,
0.6759175, -1.813429, 1.97304, 0.5176471, 0, 1, 1,
0.6833092, 0.4206318, 1.950284, 0.5254902, 0, 1, 1,
0.686209, 0.6767276, -1.806133, 0.5294118, 0, 1, 1,
0.6863022, -0.2872071, 2.533315, 0.5372549, 0, 1, 1,
0.6887497, 0.6113846, 1.653283, 0.5411765, 0, 1, 1,
0.6889979, 0.7505694, -0.3261575, 0.5490196, 0, 1, 1,
0.6931559, 0.5805375, 1.103255, 0.5529412, 0, 1, 1,
0.6963087, -1.644314, 2.266823, 0.5607843, 0, 1, 1,
0.6970662, 1.002429, 0.2420446, 0.5647059, 0, 1, 1,
0.7006103, -0.4579005, 2.591787, 0.572549, 0, 1, 1,
0.7027075, 0.8325924, 2.008302, 0.5764706, 0, 1, 1,
0.7028341, -0.6589212, 2.609955, 0.5843138, 0, 1, 1,
0.7180803, 0.1728191, 2.639663, 0.5882353, 0, 1, 1,
0.7214063, 2.15898, 1.72797, 0.5960785, 0, 1, 1,
0.7233023, 0.4368887, 0.2510272, 0.6039216, 0, 1, 1,
0.7297184, 0.0006182338, 2.209249, 0.6078432, 0, 1, 1,
0.7308089, 1.182895, 0.8393062, 0.6156863, 0, 1, 1,
0.7336369, -0.2818726, 1.976179, 0.6196079, 0, 1, 1,
0.737338, -0.8667167, 2.970721, 0.627451, 0, 1, 1,
0.7435917, -0.6323783, 3.021148, 0.6313726, 0, 1, 1,
0.743681, -0.7277129, 3.381536, 0.6392157, 0, 1, 1,
0.7501619, 0.08305929, 1.73264, 0.6431373, 0, 1, 1,
0.7538806, 0.2960382, 1.151934, 0.6509804, 0, 1, 1,
0.7563648, 1.742805, -0.1976329, 0.654902, 0, 1, 1,
0.7593735, 0.3532664, 0.6001582, 0.6627451, 0, 1, 1,
0.7598883, -1.055368, 1.129318, 0.6666667, 0, 1, 1,
0.761692, -0.6216952, 2.559781, 0.6745098, 0, 1, 1,
0.7637852, -1.063443, 2.721131, 0.6784314, 0, 1, 1,
0.7665253, 0.3330525, 0.9514062, 0.6862745, 0, 1, 1,
0.7675773, -0.5494315, 2.294551, 0.6901961, 0, 1, 1,
0.7724048, -1.383269, 1.600605, 0.6980392, 0, 1, 1,
0.7731835, 0.1786814, -0.8551154, 0.7058824, 0, 1, 1,
0.7808269, -0.8489472, 1.10399, 0.7098039, 0, 1, 1,
0.7819965, -0.286942, 1.711828, 0.7176471, 0, 1, 1,
0.7874246, 0.6177463, 1.851231, 0.7215686, 0, 1, 1,
0.7936077, -1.076575, 1.791754, 0.7294118, 0, 1, 1,
0.7962841, 0.9216977, -0.06738518, 0.7333333, 0, 1, 1,
0.7973852, -0.1244968, 1.754477, 0.7411765, 0, 1, 1,
0.8009204, -0.7534919, 1.792371, 0.7450981, 0, 1, 1,
0.8083762, 0.1721488, 0.817921, 0.7529412, 0, 1, 1,
0.8090891, 0.7019557, -0.540751, 0.7568628, 0, 1, 1,
0.8116897, 0.06643032, 2.642493, 0.7647059, 0, 1, 1,
0.8147044, 0.3494299, 0.07002886, 0.7686275, 0, 1, 1,
0.817563, 0.3250658, 1.207078, 0.7764706, 0, 1, 1,
0.8198922, 0.925274, 1.168405, 0.7803922, 0, 1, 1,
0.8257126, -1.049862, 2.461094, 0.7882353, 0, 1, 1,
0.832541, 0.3788437, -0.2786748, 0.7921569, 0, 1, 1,
0.8369893, -1.330501, 5.473775, 0.8, 0, 1, 1,
0.8374507, -0.7584518, 1.542693, 0.8078431, 0, 1, 1,
0.8406907, -1.017021, 2.25636, 0.8117647, 0, 1, 1,
0.8410405, 0.6263505, 3.857049, 0.8196079, 0, 1, 1,
0.8461133, -0.213051, 1.427999, 0.8235294, 0, 1, 1,
0.8462934, -0.01011019, 1.883275, 0.8313726, 0, 1, 1,
0.8484187, 1.423196, 0.5194399, 0.8352941, 0, 1, 1,
0.850394, 0.3544638, 0.1173846, 0.8431373, 0, 1, 1,
0.85044, -0.4202841, 2.596606, 0.8470588, 0, 1, 1,
0.8533981, 0.6495804, -0.5494474, 0.854902, 0, 1, 1,
0.8596776, -0.3128773, 2.004488, 0.8588235, 0, 1, 1,
0.8604522, 0.6728402, 1.584277, 0.8666667, 0, 1, 1,
0.8657183, 0.6807165, 2.077309, 0.8705882, 0, 1, 1,
0.8716269, 0.9232809, 0.3862956, 0.8784314, 0, 1, 1,
0.8815832, -0.7058222, 1.785181, 0.8823529, 0, 1, 1,
0.8860227, -0.3581953, 4.053501, 0.8901961, 0, 1, 1,
0.8911476, 0.09461825, 1.920864, 0.8941177, 0, 1, 1,
0.89876, 1.099274, 1.581516, 0.9019608, 0, 1, 1,
0.8990483, -1.321748, 2.404923, 0.9098039, 0, 1, 1,
0.903842, -1.610559, 2.894505, 0.9137255, 0, 1, 1,
0.9039156, -0.002941984, 2.832859, 0.9215686, 0, 1, 1,
0.9079489, 1.307754, 0.5423166, 0.9254902, 0, 1, 1,
0.9105433, 1.379278, -0.01852065, 0.9333333, 0, 1, 1,
0.9162462, 0.1730625, 2.061242, 0.9372549, 0, 1, 1,
0.9168539, -0.9618527, 3.73062, 0.945098, 0, 1, 1,
0.9184951, 1.083892, 1.465577, 0.9490196, 0, 1, 1,
0.9244831, 0.6486977, 2.094111, 0.9568627, 0, 1, 1,
0.926806, -0.8284146, 3.321731, 0.9607843, 0, 1, 1,
0.9269536, 1.022516, 2.015368, 0.9686275, 0, 1, 1,
0.9299818, -2.117568, 2.939386, 0.972549, 0, 1, 1,
0.9307823, -1.181864, 2.695612, 0.9803922, 0, 1, 1,
0.9380997, -1.357446, 4.181079, 0.9843137, 0, 1, 1,
0.9391485, 0.6309197, 2.005699, 0.9921569, 0, 1, 1,
0.9405814, -2.000666, 4.653965, 0.9960784, 0, 1, 1,
0.9512923, 0.8939604, 1.538822, 1, 0, 0.9960784, 1,
0.9571878, 0.714976, 1.292561, 1, 0, 0.9882353, 1,
0.9605775, -0.4239873, 1.073118, 1, 0, 0.9843137, 1,
0.9618447, -0.6839009, 2.760743, 1, 0, 0.9764706, 1,
0.9633693, -1.729767, 3.033112, 1, 0, 0.972549, 1,
0.9635084, -0.7294456, 1.139845, 1, 0, 0.9647059, 1,
0.9636108, 0.2015996, 2.729921, 1, 0, 0.9607843, 1,
0.965135, 0.856677, -0.7685242, 1, 0, 0.9529412, 1,
0.9707066, 1.947644, 0.5760124, 1, 0, 0.9490196, 1,
0.9717337, -1.527151, 3.335373, 1, 0, 0.9411765, 1,
0.9782274, 2.17798, -0.6370745, 1, 0, 0.9372549, 1,
0.9802815, 0.1607329, 1.009076, 1, 0, 0.9294118, 1,
0.9877178, -0.6680543, 2.215621, 1, 0, 0.9254902, 1,
0.9888409, 0.8071766, 0.1515349, 1, 0, 0.9176471, 1,
0.9892156, -1.673506, 2.6448, 1, 0, 0.9137255, 1,
0.9955662, -0.1590176, 3.194265, 1, 0, 0.9058824, 1,
0.9996657, -0.530516, 3.530382, 1, 0, 0.9019608, 1,
0.9997175, -0.617799, 1.882427, 1, 0, 0.8941177, 1,
1.002201, -0.4370231, 0.5579095, 1, 0, 0.8862745, 1,
1.002304, 0.3487362, 0.6954087, 1, 0, 0.8823529, 1,
1.002979, 0.7305171, 1.810124, 1, 0, 0.8745098, 1,
1.013056, -0.4766422, 1.569345, 1, 0, 0.8705882, 1,
1.017823, 0.1203094, 2.924347, 1, 0, 0.8627451, 1,
1.020348, -0.4291692, 1.48671, 1, 0, 0.8588235, 1,
1.030465, 0.9518774, 1.620489, 1, 0, 0.8509804, 1,
1.032363, -0.3091269, 0.02931521, 1, 0, 0.8470588, 1,
1.034838, 0.7028796, 1.423745, 1, 0, 0.8392157, 1,
1.036374, 1.823264, 0.3135369, 1, 0, 0.8352941, 1,
1.038625, 0.1749925, -0.6479724, 1, 0, 0.827451, 1,
1.047274, 0.6345435, 1.12086, 1, 0, 0.8235294, 1,
1.048653, 0.7189966, 1.694017, 1, 0, 0.8156863, 1,
1.051041, -0.9270103, 1.272308, 1, 0, 0.8117647, 1,
1.062868, 0.2744502, 1.490914, 1, 0, 0.8039216, 1,
1.076143, -1.017329, 2.250295, 1, 0, 0.7960784, 1,
1.080824, 0.2317025, 1.86336, 1, 0, 0.7921569, 1,
1.082921, 1.735826, 2.116824, 1, 0, 0.7843137, 1,
1.08873, -2.317741, 2.363817, 1, 0, 0.7803922, 1,
1.091785, -1.267129, 2.774484, 1, 0, 0.772549, 1,
1.094464, 0.7259192, 0.9823278, 1, 0, 0.7686275, 1,
1.096212, 1.314966, 0.9557756, 1, 0, 0.7607843, 1,
1.096743, -0.7527275, 2.146384, 1, 0, 0.7568628, 1,
1.097162, -0.5909708, 2.368585, 1, 0, 0.7490196, 1,
1.098206, -1.818347, 2.38179, 1, 0, 0.7450981, 1,
1.101223, 0.6724386, 1.129559, 1, 0, 0.7372549, 1,
1.104015, -0.3043481, 2.351968, 1, 0, 0.7333333, 1,
1.10626, 0.778725, 1.758228, 1, 0, 0.7254902, 1,
1.109533, 1.68944, 1.185069, 1, 0, 0.7215686, 1,
1.121377, 0.5122529, 2.126768, 1, 0, 0.7137255, 1,
1.123658, -0.5152684, 2.685492, 1, 0, 0.7098039, 1,
1.125345, 0.1485447, 0.9032801, 1, 0, 0.7019608, 1,
1.127362, -1.452846, 0.9680342, 1, 0, 0.6941177, 1,
1.132424, -0.5369204, -0.04390407, 1, 0, 0.6901961, 1,
1.139705, -1.624119, 1.596059, 1, 0, 0.682353, 1,
1.159973, 0.1840485, 1.002686, 1, 0, 0.6784314, 1,
1.165972, 0.9939257, 1.523099, 1, 0, 0.6705883, 1,
1.172171, -0.9214623, 0.8642198, 1, 0, 0.6666667, 1,
1.17901, 0.4055328, 0.4697367, 1, 0, 0.6588235, 1,
1.194168, -0.1822248, 2.947714, 1, 0, 0.654902, 1,
1.194701, 0.621425, 2.059036, 1, 0, 0.6470588, 1,
1.195155, -1.098288, 4.222518, 1, 0, 0.6431373, 1,
1.198603, 0.6485935, 0.8462652, 1, 0, 0.6352941, 1,
1.200272, -1.718597, 2.818481, 1, 0, 0.6313726, 1,
1.200296, 0.5816091, -1.10213, 1, 0, 0.6235294, 1,
1.215824, -0.6001121, 2.625361, 1, 0, 0.6196079, 1,
1.216417, -0.8868035, 1.94477, 1, 0, 0.6117647, 1,
1.226079, 0.9240426, 1.204605, 1, 0, 0.6078432, 1,
1.227775, -1.481595, 2.166466, 1, 0, 0.6, 1,
1.231346, 1.35232, 0.5152509, 1, 0, 0.5921569, 1,
1.23398, -0.2665539, 2.168927, 1, 0, 0.5882353, 1,
1.23672, -0.7670902, 1.597556, 1, 0, 0.5803922, 1,
1.258198, -1.515022, 2.765574, 1, 0, 0.5764706, 1,
1.277772, 0.439545, 0.5422834, 1, 0, 0.5686275, 1,
1.282732, 1.281367, 0.08859322, 1, 0, 0.5647059, 1,
1.286017, -1.86717, 1.791352, 1, 0, 0.5568628, 1,
1.28841, -1.278653, 1.831313, 1, 0, 0.5529412, 1,
1.292546, 0.9925942, -0.07288896, 1, 0, 0.5450981, 1,
1.307706, -2.31345, 2.74892, 1, 0, 0.5411765, 1,
1.320649, 0.127174, 3.107224, 1, 0, 0.5333334, 1,
1.322955, 0.4311946, 2.687334, 1, 0, 0.5294118, 1,
1.324656, 0.4312314, 0.8667438, 1, 0, 0.5215687, 1,
1.325888, 0.9176345, 1.195283, 1, 0, 0.5176471, 1,
1.34469, 0.03078714, 0.8687303, 1, 0, 0.509804, 1,
1.357419, -1.369497, 0.3490027, 1, 0, 0.5058824, 1,
1.374599, -0.1890836, 1.070711, 1, 0, 0.4980392, 1,
1.380023, 0.6719507, 1.094236, 1, 0, 0.4901961, 1,
1.385359, -0.8923182, 3.574294, 1, 0, 0.4862745, 1,
1.402647, 0.5731727, 2.388004, 1, 0, 0.4784314, 1,
1.421436, -0.8245095, 2.183988, 1, 0, 0.4745098, 1,
1.429765, 1.442762, 1.732248, 1, 0, 0.4666667, 1,
1.440318, 1.102752, 0.2494725, 1, 0, 0.4627451, 1,
1.44071, -1.585513, 1.346981, 1, 0, 0.454902, 1,
1.444146, -1.66055, 1.308388, 1, 0, 0.4509804, 1,
1.454993, -0.1592524, 0.5060007, 1, 0, 0.4431373, 1,
1.456373, -0.06047985, 1.679434, 1, 0, 0.4392157, 1,
1.473057, -0.1659687, 0.332774, 1, 0, 0.4313726, 1,
1.483282, -1.865304, 0.5515646, 1, 0, 0.427451, 1,
1.486354, 1.488283, 0.434374, 1, 0, 0.4196078, 1,
1.507901, -0.2569184, 1.276976, 1, 0, 0.4156863, 1,
1.510325, 0.2426678, 1.162083, 1, 0, 0.4078431, 1,
1.516169, -0.9434867, 1.351108, 1, 0, 0.4039216, 1,
1.534097, -1.017619, 1.448598, 1, 0, 0.3960784, 1,
1.53835, 0.3890377, 0.2385444, 1, 0, 0.3882353, 1,
1.541724, 0.6016928, 1.505525, 1, 0, 0.3843137, 1,
1.541902, -1.072789, 1.398562, 1, 0, 0.3764706, 1,
1.544316, -0.470022, 2.70297, 1, 0, 0.372549, 1,
1.550052, 0.9291189, 1.936051, 1, 0, 0.3647059, 1,
1.556664, 0.9660247, -0.3121585, 1, 0, 0.3607843, 1,
1.559704, 0.103172, 1.731158, 1, 0, 0.3529412, 1,
1.568286, -1.006973, 5.086051, 1, 0, 0.3490196, 1,
1.569458, -1.863468, 2.978453, 1, 0, 0.3411765, 1,
1.587092, 0.3908702, 0.9657119, 1, 0, 0.3372549, 1,
1.58991, 0.05983479, 2.132935, 1, 0, 0.3294118, 1,
1.590748, 1.126405, 0.311091, 1, 0, 0.3254902, 1,
1.594561, -1.045183, 3.189526, 1, 0, 0.3176471, 1,
1.595269, -0.2105189, -0.1694316, 1, 0, 0.3137255, 1,
1.600113, 0.1719586, 1.559381, 1, 0, 0.3058824, 1,
1.607695, -1.021965, 1.958533, 1, 0, 0.2980392, 1,
1.609979, 0.1010383, 2.53391, 1, 0, 0.2941177, 1,
1.619802, 0.5424088, 1.149636, 1, 0, 0.2862745, 1,
1.62341, 1.001215, 1.099484, 1, 0, 0.282353, 1,
1.632287, -0.2273211, 1.051587, 1, 0, 0.2745098, 1,
1.659311, 1.183401, 0.6919898, 1, 0, 0.2705882, 1,
1.671198, 0.7288768, 0.8492427, 1, 0, 0.2627451, 1,
1.719773, -0.9517122, 3.130137, 1, 0, 0.2588235, 1,
1.721813, -0.383681, 2.580256, 1, 0, 0.2509804, 1,
1.734084, 0.3776422, 0.6611164, 1, 0, 0.2470588, 1,
1.753592, 0.3601172, -0.7351692, 1, 0, 0.2392157, 1,
1.758434, -0.4710813, 0.8625199, 1, 0, 0.2352941, 1,
1.798321, -1.307957, 0.6286525, 1, 0, 0.227451, 1,
1.812145, 0.5175147, 0.5338631, 1, 0, 0.2235294, 1,
1.834635, 0.4586189, 1.984824, 1, 0, 0.2156863, 1,
1.83767, -0.1385708, 2.871535, 1, 0, 0.2117647, 1,
1.846444, -0.4316229, -0.6967159, 1, 0, 0.2039216, 1,
1.861148, -0.502046, 3.013645, 1, 0, 0.1960784, 1,
1.882611, -0.602753, 1.713434, 1, 0, 0.1921569, 1,
1.884369, 0.6035556, 0.9641767, 1, 0, 0.1843137, 1,
1.89847, -0.07355969, 1.247418, 1, 0, 0.1803922, 1,
1.916571, -0.4126882, 1.484031, 1, 0, 0.172549, 1,
1.979686, 0.6926876, 0.009708399, 1, 0, 0.1686275, 1,
1.999377, 1.642947, 1.519428, 1, 0, 0.1607843, 1,
2.014364, 0.6212978, -0.7176645, 1, 0, 0.1568628, 1,
2.030372, -0.2651237, 0.9293457, 1, 0, 0.1490196, 1,
2.047458, -0.3468747, 1.930746, 1, 0, 0.145098, 1,
2.063145, -1.990949, 3.006362, 1, 0, 0.1372549, 1,
2.094007, 0.02240389, 2.518742, 1, 0, 0.1333333, 1,
2.096421, -0.3297564, 0.5143124, 1, 0, 0.1254902, 1,
2.099251, 0.25937, 0.3375352, 1, 0, 0.1215686, 1,
2.134159, 0.4743722, 2.163591, 1, 0, 0.1137255, 1,
2.136384, -0.3543384, 2.358199, 1, 0, 0.1098039, 1,
2.203781, 1.213247, 0.6785981, 1, 0, 0.1019608, 1,
2.209278, -0.182807, 1.028758, 1, 0, 0.09411765, 1,
2.213137, 1.574723, 0.3304788, 1, 0, 0.09019608, 1,
2.246925, -0.760514, 1.680208, 1, 0, 0.08235294, 1,
2.2766, 0.3649197, 2.146559, 1, 0, 0.07843138, 1,
2.293597, -0.01524901, 2.742384, 1, 0, 0.07058824, 1,
2.388872, 1.09687, 0.3093839, 1, 0, 0.06666667, 1,
2.474277, -2.262094, 2.885213, 1, 0, 0.05882353, 1,
2.500652, 0.9365252, 1.583651, 1, 0, 0.05490196, 1,
2.542875, 0.5443052, 2.575321, 1, 0, 0.04705882, 1,
2.543736, -0.9440033, 1.975293, 1, 0, 0.04313726, 1,
2.548342, 0.484031, 1.577925, 1, 0, 0.03529412, 1,
2.557384, -0.8698025, 2.522292, 1, 0, 0.03137255, 1,
2.617997, 0.2758235, 2.343155, 1, 0, 0.02352941, 1,
2.619008, -0.827418, 2.232933, 1, 0, 0.01960784, 1,
2.718266, 0.2029541, 1.413551, 1, 0, 0.01176471, 1,
3.157663, 0.9315487, 1.534413, 1, 0, 0.007843138, 1
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
-0.1180178, -4.114595, -6.842527, 0, -0.5, 0.5, 0.5,
-0.1180178, -4.114595, -6.842527, 1, -0.5, 0.5, 0.5,
-0.1180178, -4.114595, -6.842527, 1, 1.5, 0.5, 0.5,
-0.1180178, -4.114595, -6.842527, 0, 1.5, 0.5, 0.5
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
-4.504154, -0.04130113, -6.842527, 0, -0.5, 0.5, 0.5,
-4.504154, -0.04130113, -6.842527, 1, -0.5, 0.5, 0.5,
-4.504154, -0.04130113, -6.842527, 1, 1.5, 0.5, 0.5,
-4.504154, -0.04130113, -6.842527, 0, 1.5, 0.5, 0.5
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
-4.504154, -4.114595, 0.2081478, 0, -0.5, 0.5, 0.5,
-4.504154, -4.114595, 0.2081478, 1, -0.5, 0.5, 0.5,
-4.504154, -4.114595, 0.2081478, 1, 1.5, 0.5, 0.5,
-4.504154, -4.114595, 0.2081478, 0, 1.5, 0.5, 0.5
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
-3, -3.174604, -5.215448,
3, -3.174604, -5.215448,
-3, -3.174604, -5.215448,
-3, -3.33127, -5.486628,
-2, -3.174604, -5.215448,
-2, -3.33127, -5.486628,
-1, -3.174604, -5.215448,
-1, -3.33127, -5.486628,
0, -3.174604, -5.215448,
0, -3.33127, -5.486628,
1, -3.174604, -5.215448,
1, -3.33127, -5.486628,
2, -3.174604, -5.215448,
2, -3.33127, -5.486628,
3, -3.174604, -5.215448,
3, -3.33127, -5.486628
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
-3, -3.6446, -6.028987, 0, -0.5, 0.5, 0.5,
-3, -3.6446, -6.028987, 1, -0.5, 0.5, 0.5,
-3, -3.6446, -6.028987, 1, 1.5, 0.5, 0.5,
-3, -3.6446, -6.028987, 0, 1.5, 0.5, 0.5,
-2, -3.6446, -6.028987, 0, -0.5, 0.5, 0.5,
-2, -3.6446, -6.028987, 1, -0.5, 0.5, 0.5,
-2, -3.6446, -6.028987, 1, 1.5, 0.5, 0.5,
-2, -3.6446, -6.028987, 0, 1.5, 0.5, 0.5,
-1, -3.6446, -6.028987, 0, -0.5, 0.5, 0.5,
-1, -3.6446, -6.028987, 1, -0.5, 0.5, 0.5,
-1, -3.6446, -6.028987, 1, 1.5, 0.5, 0.5,
-1, -3.6446, -6.028987, 0, 1.5, 0.5, 0.5,
0, -3.6446, -6.028987, 0, -0.5, 0.5, 0.5,
0, -3.6446, -6.028987, 1, -0.5, 0.5, 0.5,
0, -3.6446, -6.028987, 1, 1.5, 0.5, 0.5,
0, -3.6446, -6.028987, 0, 1.5, 0.5, 0.5,
1, -3.6446, -6.028987, 0, -0.5, 0.5, 0.5,
1, -3.6446, -6.028987, 1, -0.5, 0.5, 0.5,
1, -3.6446, -6.028987, 1, 1.5, 0.5, 0.5,
1, -3.6446, -6.028987, 0, 1.5, 0.5, 0.5,
2, -3.6446, -6.028987, 0, -0.5, 0.5, 0.5,
2, -3.6446, -6.028987, 1, -0.5, 0.5, 0.5,
2, -3.6446, -6.028987, 1, 1.5, 0.5, 0.5,
2, -3.6446, -6.028987, 0, 1.5, 0.5, 0.5,
3, -3.6446, -6.028987, 0, -0.5, 0.5, 0.5,
3, -3.6446, -6.028987, 1, -0.5, 0.5, 0.5,
3, -3.6446, -6.028987, 1, 1.5, 0.5, 0.5,
3, -3.6446, -6.028987, 0, 1.5, 0.5, 0.5
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
-3.491969, -3, -5.215448,
-3.491969, 3, -5.215448,
-3.491969, -3, -5.215448,
-3.660666, -3, -5.486628,
-3.491969, -2, -5.215448,
-3.660666, -2, -5.486628,
-3.491969, -1, -5.215448,
-3.660666, -1, -5.486628,
-3.491969, 0, -5.215448,
-3.660666, 0, -5.486628,
-3.491969, 1, -5.215448,
-3.660666, 1, -5.486628,
-3.491969, 2, -5.215448,
-3.660666, 2, -5.486628,
-3.491969, 3, -5.215448,
-3.660666, 3, -5.486628
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
-3.998061, -3, -6.028987, 0, -0.5, 0.5, 0.5,
-3.998061, -3, -6.028987, 1, -0.5, 0.5, 0.5,
-3.998061, -3, -6.028987, 1, 1.5, 0.5, 0.5,
-3.998061, -3, -6.028987, 0, 1.5, 0.5, 0.5,
-3.998061, -2, -6.028987, 0, -0.5, 0.5, 0.5,
-3.998061, -2, -6.028987, 1, -0.5, 0.5, 0.5,
-3.998061, -2, -6.028987, 1, 1.5, 0.5, 0.5,
-3.998061, -2, -6.028987, 0, 1.5, 0.5, 0.5,
-3.998061, -1, -6.028987, 0, -0.5, 0.5, 0.5,
-3.998061, -1, -6.028987, 1, -0.5, 0.5, 0.5,
-3.998061, -1, -6.028987, 1, 1.5, 0.5, 0.5,
-3.998061, -1, -6.028987, 0, 1.5, 0.5, 0.5,
-3.998061, 0, -6.028987, 0, -0.5, 0.5, 0.5,
-3.998061, 0, -6.028987, 1, -0.5, 0.5, 0.5,
-3.998061, 0, -6.028987, 1, 1.5, 0.5, 0.5,
-3.998061, 0, -6.028987, 0, 1.5, 0.5, 0.5,
-3.998061, 1, -6.028987, 0, -0.5, 0.5, 0.5,
-3.998061, 1, -6.028987, 1, -0.5, 0.5, 0.5,
-3.998061, 1, -6.028987, 1, 1.5, 0.5, 0.5,
-3.998061, 1, -6.028987, 0, 1.5, 0.5, 0.5,
-3.998061, 2, -6.028987, 0, -0.5, 0.5, 0.5,
-3.998061, 2, -6.028987, 1, -0.5, 0.5, 0.5,
-3.998061, 2, -6.028987, 1, 1.5, 0.5, 0.5,
-3.998061, 2, -6.028987, 0, 1.5, 0.5, 0.5,
-3.998061, 3, -6.028987, 0, -0.5, 0.5, 0.5,
-3.998061, 3, -6.028987, 1, -0.5, 0.5, 0.5,
-3.998061, 3, -6.028987, 1, 1.5, 0.5, 0.5,
-3.998061, 3, -6.028987, 0, 1.5, 0.5, 0.5
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
-3.491969, -3.174604, -4,
-3.491969, -3.174604, 4,
-3.491969, -3.174604, -4,
-3.660666, -3.33127, -4,
-3.491969, -3.174604, -2,
-3.660666, -3.33127, -2,
-3.491969, -3.174604, 0,
-3.660666, -3.33127, 0,
-3.491969, -3.174604, 2,
-3.660666, -3.33127, 2,
-3.491969, -3.174604, 4,
-3.660666, -3.33127, 4
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
-3.998061, -3.6446, -4, 0, -0.5, 0.5, 0.5,
-3.998061, -3.6446, -4, 1, -0.5, 0.5, 0.5,
-3.998061, -3.6446, -4, 1, 1.5, 0.5, 0.5,
-3.998061, -3.6446, -4, 0, 1.5, 0.5, 0.5,
-3.998061, -3.6446, -2, 0, -0.5, 0.5, 0.5,
-3.998061, -3.6446, -2, 1, -0.5, 0.5, 0.5,
-3.998061, -3.6446, -2, 1, 1.5, 0.5, 0.5,
-3.998061, -3.6446, -2, 0, 1.5, 0.5, 0.5,
-3.998061, -3.6446, 0, 0, -0.5, 0.5, 0.5,
-3.998061, -3.6446, 0, 1, -0.5, 0.5, 0.5,
-3.998061, -3.6446, 0, 1, 1.5, 0.5, 0.5,
-3.998061, -3.6446, 0, 0, 1.5, 0.5, 0.5,
-3.998061, -3.6446, 2, 0, -0.5, 0.5, 0.5,
-3.998061, -3.6446, 2, 1, -0.5, 0.5, 0.5,
-3.998061, -3.6446, 2, 1, 1.5, 0.5, 0.5,
-3.998061, -3.6446, 2, 0, 1.5, 0.5, 0.5,
-3.998061, -3.6446, 4, 0, -0.5, 0.5, 0.5,
-3.998061, -3.6446, 4, 1, -0.5, 0.5, 0.5,
-3.998061, -3.6446, 4, 1, 1.5, 0.5, 0.5,
-3.998061, -3.6446, 4, 0, 1.5, 0.5, 0.5
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
-3.491969, -3.174604, -5.215448,
-3.491969, 3.092002, -5.215448,
-3.491969, -3.174604, 5.631744,
-3.491969, 3.092002, 5.631744,
-3.491969, -3.174604, -5.215448,
-3.491969, -3.174604, 5.631744,
-3.491969, 3.092002, -5.215448,
-3.491969, 3.092002, 5.631744,
-3.491969, -3.174604, -5.215448,
3.255933, -3.174604, -5.215448,
-3.491969, -3.174604, 5.631744,
3.255933, -3.174604, 5.631744,
-3.491969, 3.092002, -5.215448,
3.255933, 3.092002, -5.215448,
-3.491969, 3.092002, 5.631744,
3.255933, 3.092002, 5.631744,
3.255933, -3.174604, -5.215448,
3.255933, 3.092002, -5.215448,
3.255933, -3.174604, 5.631744,
3.255933, 3.092002, 5.631744,
3.255933, -3.174604, -5.215448,
3.255933, -3.174604, 5.631744,
3.255933, 3.092002, -5.215448,
3.255933, 3.092002, 5.631744
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
var radius = 7.598041;
var distance = 33.80454;
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
mvMatrix.translate( 0.1180178, 0.04130113, -0.2081478 );
mvMatrix.scale( 1.217438, 1.310941, 0.7573528 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.80454);
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
triforine<-read.table("triforine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triforine$V2
```

```
## Error in eval(expr, envir, enclos): object 'triforine' not found
```

```r
y<-triforine$V3
```

```
## Error in eval(expr, envir, enclos): object 'triforine' not found
```

```r
z<-triforine$V4
```

```
## Error in eval(expr, envir, enclos): object 'triforine' not found
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
-3.393698, -0.7808648, -0.1536146, 0, 0, 1, 1, 1,
-2.902952, -1.591104, -3.757306, 1, 0, 0, 1, 1,
-2.777941, -0.1138009, -2.316919, 1, 0, 0, 1, 1,
-2.755055, 1.095302, 1.380897, 1, 0, 0, 1, 1,
-2.445769, -2.893782, -2.062217, 1, 0, 0, 1, 1,
-2.401108, 0.9600707, -2.689755, 1, 0, 0, 1, 1,
-2.363083, -0.3402501, -2.629121, 0, 0, 0, 1, 1,
-2.315658, -0.01707276, -0.8225158, 0, 0, 0, 1, 1,
-2.300957, -2.342174, -2.373674, 0, 0, 0, 1, 1,
-2.258909, -0.8399032, -1.154308, 0, 0, 0, 1, 1,
-2.204314, -1.226272, -1.360753, 0, 0, 0, 1, 1,
-2.181433, 1.008576, -2.551374, 0, 0, 0, 1, 1,
-2.122622, -0.1153429, -4.034719, 0, 0, 0, 1, 1,
-2.065489, 0.6903058, -0.3585417, 1, 1, 1, 1, 1,
-2.054364, -0.6318503, -1.371227, 1, 1, 1, 1, 1,
-2.049858, 0.1308102, -1.736943, 1, 1, 1, 1, 1,
-1.993521, -0.2023776, -2.993983, 1, 1, 1, 1, 1,
-1.965181, 0.4389109, 0.01996991, 1, 1, 1, 1, 1,
-1.942825, -0.3453018, -1.443536, 1, 1, 1, 1, 1,
-1.917883, -1.41468, -1.690012, 1, 1, 1, 1, 1,
-1.902383, -0.1837399, -0.6667557, 1, 1, 1, 1, 1,
-1.89725, -0.6369711, -2.325391, 1, 1, 1, 1, 1,
-1.870123, 1.049535, -1.569353, 1, 1, 1, 1, 1,
-1.824753, 0.004384014, -1.25052, 1, 1, 1, 1, 1,
-1.824748, 0.9110767, -2.083562, 1, 1, 1, 1, 1,
-1.820898, -0.532641, -1.700588, 1, 1, 1, 1, 1,
-1.809923, 0.8441632, -0.268435, 1, 1, 1, 1, 1,
-1.800201, -0.5465387, -1.815801, 1, 1, 1, 1, 1,
-1.794861, 0.9179395, 1.367674, 0, 0, 1, 1, 1,
-1.783729, -0.5317212, -1.645584, 1, 0, 0, 1, 1,
-1.781613, -0.07078354, -1.938795, 1, 0, 0, 1, 1,
-1.779677, 0.6134154, -1.464893, 1, 0, 0, 1, 1,
-1.775781, -1.165892, -0.2377377, 1, 0, 0, 1, 1,
-1.771765, 1.49412, -0.2107345, 1, 0, 0, 1, 1,
-1.754861, 0.6589396, -0.5216923, 0, 0, 0, 1, 1,
-1.753568, -1.317092, -1.488806, 0, 0, 0, 1, 1,
-1.746911, 0.04052045, -0.3760405, 0, 0, 0, 1, 1,
-1.741855, 0.06082743, -1.752801, 0, 0, 0, 1, 1,
-1.741434, -0.01722563, -0.8666881, 0, 0, 0, 1, 1,
-1.732501, -0.1657983, -0.4708246, 0, 0, 0, 1, 1,
-1.726353, 1.578971, -1.941635, 0, 0, 0, 1, 1,
-1.717405, -0.09662192, -2.043201, 1, 1, 1, 1, 1,
-1.681745, -0.9274019, -1.010097, 1, 1, 1, 1, 1,
-1.677833, -1.054364, -1.6384, 1, 1, 1, 1, 1,
-1.621484, 0.1465748, -1.44913, 1, 1, 1, 1, 1,
-1.613676, -0.4156067, -1.790423, 1, 1, 1, 1, 1,
-1.611579, 1.654742, -1.414949, 1, 1, 1, 1, 1,
-1.592786, 0.8564384, -1.195132, 1, 1, 1, 1, 1,
-1.588842, -1.161306, -1.866879, 1, 1, 1, 1, 1,
-1.584096, 1.382924, -0.5676987, 1, 1, 1, 1, 1,
-1.581487, -1.085112, -1.344261, 1, 1, 1, 1, 1,
-1.57789, -3.083343, -5.057479, 1, 1, 1, 1, 1,
-1.572805, 0.8413329, 0.4221339, 1, 1, 1, 1, 1,
-1.535304, 0.3868214, -0.05817527, 1, 1, 1, 1, 1,
-1.524023, 0.5000454, -0.9474956, 1, 1, 1, 1, 1,
-1.518027, -0.04981841, -0.7615579, 1, 1, 1, 1, 1,
-1.517626, 1.717882, -0.4585153, 0, 0, 1, 1, 1,
-1.515189, -0.5768846, -2.339314, 1, 0, 0, 1, 1,
-1.513751, 0.8023837, 0.4398585, 1, 0, 0, 1, 1,
-1.511539, -0.258705, -1.367038, 1, 0, 0, 1, 1,
-1.504633, 0.04114901, -2.961303, 1, 0, 0, 1, 1,
-1.481824, 0.5268092, -2.134712, 1, 0, 0, 1, 1,
-1.478343, 1.645302, -0.6737465, 0, 0, 0, 1, 1,
-1.472021, 0.1233574, -3.093547, 0, 0, 0, 1, 1,
-1.469583, 0.8550383, -1.032937, 0, 0, 0, 1, 1,
-1.463562, 0.675147, 0.5330387, 0, 0, 0, 1, 1,
-1.460688, -0.236839, -1.14913, 0, 0, 0, 1, 1,
-1.457703, 1.507246, -2.026993, 0, 0, 0, 1, 1,
-1.447454, 1.523049, -1.265488, 0, 0, 0, 1, 1,
-1.42708, 1.225696, -1.519334, 1, 1, 1, 1, 1,
-1.423459, 1.036147, -1.03711, 1, 1, 1, 1, 1,
-1.423234, 0.04916783, -1.225026, 1, 1, 1, 1, 1,
-1.422621, -0.9702602, -2.063882, 1, 1, 1, 1, 1,
-1.413265, 0.5647788, -1.661141, 1, 1, 1, 1, 1,
-1.389766, -1.266084, -3.17313, 1, 1, 1, 1, 1,
-1.386863, 1.859817, 1.766196, 1, 1, 1, 1, 1,
-1.379625, -0.366767, -2.136374, 1, 1, 1, 1, 1,
-1.376526, 0.003412385, -2.010875, 1, 1, 1, 1, 1,
-1.369711, -0.9753913, -2.936917, 1, 1, 1, 1, 1,
-1.368779, -0.9185294, -2.038523, 1, 1, 1, 1, 1,
-1.368282, -0.3615961, -0.3894033, 1, 1, 1, 1, 1,
-1.36826, -0.926861, -1.398937, 1, 1, 1, 1, 1,
-1.366996, 0.8428332, -2.488316, 1, 1, 1, 1, 1,
-1.363292, -0.4569043, -2.974665, 1, 1, 1, 1, 1,
-1.362506, -0.4985895, -1.476698, 0, 0, 1, 1, 1,
-1.350888, 0.2858213, -0.701576, 1, 0, 0, 1, 1,
-1.343645, -1.226055, -3.131845, 1, 0, 0, 1, 1,
-1.340027, 1.074588, -0.5766598, 1, 0, 0, 1, 1,
-1.332957, 0.924493, 0.424086, 1, 0, 0, 1, 1,
-1.314307, -1.159534, -1.777854, 1, 0, 0, 1, 1,
-1.313674, -0.7271197, -3.269694, 0, 0, 0, 1, 1,
-1.306449, -1.518041, -2.658441, 0, 0, 0, 1, 1,
-1.300728, 0.9804689, -2.144335, 0, 0, 0, 1, 1,
-1.298584, -1.371179, -2.973468, 0, 0, 0, 1, 1,
-1.297987, 0.07023888, -0.5293672, 0, 0, 0, 1, 1,
-1.289206, -2.605226, -1.523235, 0, 0, 0, 1, 1,
-1.288752, -1.19581, -3.201982, 0, 0, 0, 1, 1,
-1.288016, 0.1320861, -3.072722, 1, 1, 1, 1, 1,
-1.286361, 0.3316667, -1.624108, 1, 1, 1, 1, 1,
-1.266094, -0.01976827, -1.814755, 1, 1, 1, 1, 1,
-1.264573, -0.4687986, -1.5096, 1, 1, 1, 1, 1,
-1.258707, 0.7405249, -1.500432, 1, 1, 1, 1, 1,
-1.255935, 0.333445, -0.06641785, 1, 1, 1, 1, 1,
-1.253358, 0.2517288, -0.7139884, 1, 1, 1, 1, 1,
-1.246861, -0.2045813, -1.514209, 1, 1, 1, 1, 1,
-1.246746, 1.275549, -0.4988993, 1, 1, 1, 1, 1,
-1.236519, 0.5470519, -1.648165, 1, 1, 1, 1, 1,
-1.230076, -0.1281615, -1.139157, 1, 1, 1, 1, 1,
-1.229698, 1.011134, -0.6469155, 1, 1, 1, 1, 1,
-1.224213, 1.704521, -1.421819, 1, 1, 1, 1, 1,
-1.221325, -0.8187711, -2.107608, 1, 1, 1, 1, 1,
-1.212646, 0.0288667, -3.323387, 1, 1, 1, 1, 1,
-1.212058, -1.391142, -2.38899, 0, 0, 1, 1, 1,
-1.209156, -0.273128, -0.0842902, 1, 0, 0, 1, 1,
-1.197531, -2.758416, -2.722659, 1, 0, 0, 1, 1,
-1.194123, -1.647762, -2.128291, 1, 0, 0, 1, 1,
-1.188561, 0.05489047, -2.064617, 1, 0, 0, 1, 1,
-1.186124, -0.2792014, -1.522401, 1, 0, 0, 1, 1,
-1.183031, -0.02325799, -0.2030642, 0, 0, 0, 1, 1,
-1.181683, -0.2654922, -1.971907, 0, 0, 0, 1, 1,
-1.179181, 0.2513075, -0.9456485, 0, 0, 0, 1, 1,
-1.171455, 1.241154, -2.239697, 0, 0, 0, 1, 1,
-1.163888, 0.2178304, -0.6626433, 0, 0, 0, 1, 1,
-1.154735, 1.139324, 0.377813, 0, 0, 0, 1, 1,
-1.141695, 0.456024, -2.037012, 0, 0, 0, 1, 1,
-1.136208, -0.0592352, -1.61033, 1, 1, 1, 1, 1,
-1.135316, -0.07181442, 0.5759413, 1, 1, 1, 1, 1,
-1.126932, 1.589759, 0.68608, 1, 1, 1, 1, 1,
-1.12506, 0.3566122, -0.4054728, 1, 1, 1, 1, 1,
-1.124191, 0.01400776, -1.944572, 1, 1, 1, 1, 1,
-1.112178, 0.09113289, -3.836009, 1, 1, 1, 1, 1,
-1.111246, -0.2203006, -2.421185, 1, 1, 1, 1, 1,
-1.111177, -1.808947, -2.324177, 1, 1, 1, 1, 1,
-1.110264, 0.06715911, -0.3141865, 1, 1, 1, 1, 1,
-1.092547, -0.2386259, -2.156534, 1, 1, 1, 1, 1,
-1.087497, -0.7264848, -2.996412, 1, 1, 1, 1, 1,
-1.079286, -1.241353, -3.546745, 1, 1, 1, 1, 1,
-1.071462, -0.20195, -2.853732, 1, 1, 1, 1, 1,
-1.069027, -0.05153065, -2.297696, 1, 1, 1, 1, 1,
-1.064783, -0.7362841, -2.79427, 1, 1, 1, 1, 1,
-1.063161, -0.5986588, -1.259556, 0, 0, 1, 1, 1,
-1.056666, 0.0314218, -1.425371, 1, 0, 0, 1, 1,
-1.0565, 0.2706985, -0.5903205, 1, 0, 0, 1, 1,
-1.053688, -0.377967, -2.095738, 1, 0, 0, 1, 1,
-1.051923, -0.02168676, -1.656134, 1, 0, 0, 1, 1,
-1.047429, 0.7189808, 1.099659, 1, 0, 0, 1, 1,
-1.045424, 1.052493, -1.292852, 0, 0, 0, 1, 1,
-1.0426, -0.2546557, -1.068463, 0, 0, 0, 1, 1,
-1.027341, -1.185016, -3.449132, 0, 0, 0, 1, 1,
-1.02298, -1.386009, -1.764663, 0, 0, 0, 1, 1,
-1.022012, 0.3678136, -2.721175, 0, 0, 0, 1, 1,
-1.016431, -1.435295, -1.48575, 0, 0, 0, 1, 1,
-1.014641, -0.7722673, -2.744375, 0, 0, 0, 1, 1,
-1.011771, 0.4023171, -0.533174, 1, 1, 1, 1, 1,
-1.010803, -0.1452082, -2.247097, 1, 1, 1, 1, 1,
-1.003534, -0.3327806, -1.972605, 1, 1, 1, 1, 1,
-1.000919, -0.09140663, -1.404714, 1, 1, 1, 1, 1,
-0.991263, -0.01108074, 1.353829, 1, 1, 1, 1, 1,
-0.9890981, 0.8537424, 0.03905812, 1, 1, 1, 1, 1,
-0.9860603, -0.1081522, -2.246173, 1, 1, 1, 1, 1,
-0.9847065, 1.087342, -0.7845399, 1, 1, 1, 1, 1,
-0.9692012, 2.320163, -0.9340155, 1, 1, 1, 1, 1,
-0.9673595, -1.42256, -3.81445, 1, 1, 1, 1, 1,
-0.9620001, 0.06464276, -1.951044, 1, 1, 1, 1, 1,
-0.9584773, 1.485062, -0.1165056, 1, 1, 1, 1, 1,
-0.9573391, 0.9208954, 0.7680393, 1, 1, 1, 1, 1,
-0.9493527, -0.9425002, -2.268119, 1, 1, 1, 1, 1,
-0.9493291, -0.08994683, -2.380108, 1, 1, 1, 1, 1,
-0.9423209, 0.5845963, -2.102615, 0, 0, 1, 1, 1,
-0.9387452, -0.9553705, -2.528823, 1, 0, 0, 1, 1,
-0.9381911, 0.4102359, -1.197051, 1, 0, 0, 1, 1,
-0.9365907, -0.9825484, -3.180098, 1, 0, 0, 1, 1,
-0.9240969, -0.4604258, -2.360155, 1, 0, 0, 1, 1,
-0.9214458, -1.119103, -4.475242, 1, 0, 0, 1, 1,
-0.9134216, -0.1556578, 0.2648772, 0, 0, 0, 1, 1,
-0.9119814, 0.8771219, -0.5033473, 0, 0, 0, 1, 1,
-0.9073851, -0.3982007, -1.93953, 0, 0, 0, 1, 1,
-0.9000301, -0.5145171, -1.412623, 0, 0, 0, 1, 1,
-0.8985265, -0.02815795, -0.5782916, 0, 0, 0, 1, 1,
-0.8912333, -0.02669444, 1.093202, 0, 0, 0, 1, 1,
-0.8856692, -0.748216, -1.702588, 0, 0, 0, 1, 1,
-0.8836671, -0.4740907, 0.2500251, 1, 1, 1, 1, 1,
-0.879714, -1.896052, -2.659036, 1, 1, 1, 1, 1,
-0.8776079, 1.265154, -1.173169, 1, 1, 1, 1, 1,
-0.8662305, -0.1278747, -1.956444, 1, 1, 1, 1, 1,
-0.8660929, -0.8353716, -0.4458699, 1, 1, 1, 1, 1,
-0.8657998, 0.002224186, -0.2252499, 1, 1, 1, 1, 1,
-0.8540691, 0.9876303, 0.3201818, 1, 1, 1, 1, 1,
-0.8517694, -0.1653512, -1.921182, 1, 1, 1, 1, 1,
-0.8502814, 0.8023883, -1.95539, 1, 1, 1, 1, 1,
-0.8482858, -0.4464643, -2.261976, 1, 1, 1, 1, 1,
-0.8431252, -0.2617161, -1.174658, 1, 1, 1, 1, 1,
-0.8408105, -0.7884831, -2.919548, 1, 1, 1, 1, 1,
-0.839466, 0.3843783, -1.803147, 1, 1, 1, 1, 1,
-0.8392665, 2.850695, 0.7684089, 1, 1, 1, 1, 1,
-0.8391252, 1.949605, -0.8868978, 1, 1, 1, 1, 1,
-0.8358591, -1.913736, -1.790652, 0, 0, 1, 1, 1,
-0.8312686, 0.3941565, -0.9255442, 1, 0, 0, 1, 1,
-0.8289151, -0.8872796, -1.304709, 1, 0, 0, 1, 1,
-0.8257463, 0.5971784, 0.5763918, 1, 0, 0, 1, 1,
-0.8254524, -0.06008619, -2.063251, 1, 0, 0, 1, 1,
-0.8175265, 0.4679732, -0.8002822, 1, 0, 0, 1, 1,
-0.8134694, -0.0362079, -0.6287513, 0, 0, 0, 1, 1,
-0.8123081, -0.4522837, -2.517726, 0, 0, 0, 1, 1,
-0.8030338, -0.4361218, -3.109022, 0, 0, 0, 1, 1,
-0.7964728, 0.2813767, 0.03634672, 0, 0, 0, 1, 1,
-0.7886944, 0.8136718, 2.295833, 0, 0, 0, 1, 1,
-0.7884119, -0.3947543, -2.596403, 0, 0, 0, 1, 1,
-0.7882347, -0.6905295, 0.2225436, 0, 0, 0, 1, 1,
-0.7879902, -0.9766452, -2.382981, 1, 1, 1, 1, 1,
-0.7879022, -0.9405915, -0.996411, 1, 1, 1, 1, 1,
-0.7825341, -0.3239322, -2.835359, 1, 1, 1, 1, 1,
-0.7752329, -0.04911207, 0.3297287, 1, 1, 1, 1, 1,
-0.7739582, -0.01122546, -1.53526, 1, 1, 1, 1, 1,
-0.7672252, -1.083068, -2.283033, 1, 1, 1, 1, 1,
-0.7601639, 1.244075, 1.047334, 1, 1, 1, 1, 1,
-0.7599087, 1.059526, -1.700287, 1, 1, 1, 1, 1,
-0.7541348, -0.719123, -1.763144, 1, 1, 1, 1, 1,
-0.7397193, 0.07091427, -1.241254, 1, 1, 1, 1, 1,
-0.7193248, 0.2970143, -0.5618582, 1, 1, 1, 1, 1,
-0.7171075, 0.4895445, -1.357337, 1, 1, 1, 1, 1,
-0.7164043, 0.8294875, -0.6400781, 1, 1, 1, 1, 1,
-0.7155651, -0.2371273, -0.8538844, 1, 1, 1, 1, 1,
-0.7154729, 0.1331269, -0.4924284, 1, 1, 1, 1, 1,
-0.7061988, 1.113549, -1.897498, 0, 0, 1, 1, 1,
-0.7048938, -0.4491816, -1.941203, 1, 0, 0, 1, 1,
-0.7013642, -0.3552333, -2.146716, 1, 0, 0, 1, 1,
-0.6995372, 0.2286969, -3.768555, 1, 0, 0, 1, 1,
-0.6981375, -0.3340164, -1.92793, 1, 0, 0, 1, 1,
-0.6940113, 0.3889182, -0.98553, 1, 0, 0, 1, 1,
-0.692707, 0.7175745, -1.831972, 0, 0, 0, 1, 1,
-0.6918105, 0.8874615, -1.31836, 0, 0, 0, 1, 1,
-0.6910101, -0.3784072, -3.71624, 0, 0, 0, 1, 1,
-0.6907967, -0.9618602, -1.445937, 0, 0, 0, 1, 1,
-0.6877491, 0.5733194, -1.88678, 0, 0, 0, 1, 1,
-0.684024, 0.4391445, -0.173347, 0, 0, 0, 1, 1,
-0.6793968, -0.684077, -2.460829, 0, 0, 0, 1, 1,
-0.6782456, -0.7224311, -1.218718, 1, 1, 1, 1, 1,
-0.6758932, 0.8754813, 0.8711919, 1, 1, 1, 1, 1,
-0.6752326, 1.533966, -0.5469903, 1, 1, 1, 1, 1,
-0.6751809, -1.070955, -3.070846, 1, 1, 1, 1, 1,
-0.667457, 0.01815965, -0.2842258, 1, 1, 1, 1, 1,
-0.6623967, 1.329948, 0.6663703, 1, 1, 1, 1, 1,
-0.6608313, -0.455607, -2.468746, 1, 1, 1, 1, 1,
-0.6575124, 0.03556788, -3.392518, 1, 1, 1, 1, 1,
-0.6568096, 0.8548369, -1.43788, 1, 1, 1, 1, 1,
-0.6533694, 2.879292, -0.9783918, 1, 1, 1, 1, 1,
-0.6515297, 0.1915205, 0.04174675, 1, 1, 1, 1, 1,
-0.650075, 0.4526847, -2.238456, 1, 1, 1, 1, 1,
-0.6489695, -0.7107799, -2.322471, 1, 1, 1, 1, 1,
-0.6426044, 1.437101, 0.5770135, 1, 1, 1, 1, 1,
-0.6376575, 0.6699814, -1.684731, 1, 1, 1, 1, 1,
-0.6342289, 0.5451531, 1.52473, 0, 0, 1, 1, 1,
-0.6290511, 0.5872683, 1.136639, 1, 0, 0, 1, 1,
-0.6236635, 1.806941, -0.003038288, 1, 0, 0, 1, 1,
-0.6179198, 0.2101553, 0.636103, 1, 0, 0, 1, 1,
-0.6061925, -0.3481331, -0.7148765, 1, 0, 0, 1, 1,
-0.6061633, -1.104286, -3.218692, 1, 0, 0, 1, 1,
-0.6049091, 1.40762, -0.003584184, 0, 0, 0, 1, 1,
-0.6026266, 0.6080713, -0.2919209, 0, 0, 0, 1, 1,
-0.5918627, 0.3505616, -3.202098, 0, 0, 0, 1, 1,
-0.5864744, 0.4653524, -1.388028, 0, 0, 0, 1, 1,
-0.5845674, 2.79237, -1.147229, 0, 0, 0, 1, 1,
-0.5829951, 0.1953855, -1.075901, 0, 0, 0, 1, 1,
-0.5822021, 1.499555, 0.2896845, 0, 0, 0, 1, 1,
-0.5817039, -0.1055096, -2.462617, 1, 1, 1, 1, 1,
-0.5802537, 1.097094, -1.667282, 1, 1, 1, 1, 1,
-0.5721668, -0.7191831, -2.591697, 1, 1, 1, 1, 1,
-0.5696554, 0.3225864, -0.4245251, 1, 1, 1, 1, 1,
-0.5616377, -0.3626488, -2.989269, 1, 1, 1, 1, 1,
-0.5615559, -2.570527, -3.662558, 1, 1, 1, 1, 1,
-0.5596685, 0.24493, -0.5882994, 1, 1, 1, 1, 1,
-0.5589826, -1.422462, -1.974725, 1, 1, 1, 1, 1,
-0.55878, -0.9845472, -2.43891, 1, 1, 1, 1, 1,
-0.5586584, 0.3511286, -2.128444, 1, 1, 1, 1, 1,
-0.5580955, -0.1131975, -3.59839, 1, 1, 1, 1, 1,
-0.555702, 1.080568, -0.1244235, 1, 1, 1, 1, 1,
-0.5554264, 1.301377, 0.5059487, 1, 1, 1, 1, 1,
-0.54279, 1.388141, -1.771316, 1, 1, 1, 1, 1,
-0.5411687, -0.4672811, -3.15628, 1, 1, 1, 1, 1,
-0.54081, 0.4334173, 0.2826046, 0, 0, 1, 1, 1,
-0.5398048, -1.28854, -1.787371, 1, 0, 0, 1, 1,
-0.5320926, -0.3696295, -3.08717, 1, 0, 0, 1, 1,
-0.5288702, 0.2061915, -1.166386, 1, 0, 0, 1, 1,
-0.5287102, 0.3102959, 1.06977, 1, 0, 0, 1, 1,
-0.527293, -1.486551, -1.649437, 1, 0, 0, 1, 1,
-0.5254952, -0.350615, -2.771937, 0, 0, 0, 1, 1,
-0.5196041, 0.7679226, -0.545615, 0, 0, 0, 1, 1,
-0.5142606, -0.2080622, -1.056741, 0, 0, 0, 1, 1,
-0.5103415, 0.5431392, -1.092057, 0, 0, 0, 1, 1,
-0.5090854, -0.2070379, -2.041465, 0, 0, 0, 1, 1,
-0.5079997, -0.04496968, -1.163532, 0, 0, 0, 1, 1,
-0.5031305, -0.9905503, -3.216556, 0, 0, 0, 1, 1,
-0.5021817, 0.1407769, -3.588724, 1, 1, 1, 1, 1,
-0.5013538, -0.4696046, -3.045024, 1, 1, 1, 1, 1,
-0.4995322, 1.36403, -0.5094659, 1, 1, 1, 1, 1,
-0.4987583, -0.1250465, -2.111004, 1, 1, 1, 1, 1,
-0.4985455, 1.517069, 1.072309, 1, 1, 1, 1, 1,
-0.498476, 1.23207, 0.3694902, 1, 1, 1, 1, 1,
-0.4983487, 0.577599, -0.6044941, 1, 1, 1, 1, 1,
-0.4967537, 1.18818, -0.7647303, 1, 1, 1, 1, 1,
-0.4958498, 1.897373, 0.007793055, 1, 1, 1, 1, 1,
-0.4932711, 0.6699721, 0.5263195, 1, 1, 1, 1, 1,
-0.4931336, 1.740573, 0.3636643, 1, 1, 1, 1, 1,
-0.4930902, -0.2716836, 0.1898081, 1, 1, 1, 1, 1,
-0.4919563, -0.8804163, -2.926734, 1, 1, 1, 1, 1,
-0.4826303, -0.4112802, -2.908559, 1, 1, 1, 1, 1,
-0.4785415, -0.7441644, -3.305086, 1, 1, 1, 1, 1,
-0.4728425, 1.169775, -1.178918, 0, 0, 1, 1, 1,
-0.4673129, -2.076253, -2.762145, 1, 0, 0, 1, 1,
-0.4662251, -0.4491646, -2.305625, 1, 0, 0, 1, 1,
-0.4612553, -0.06779559, -3.44785, 1, 0, 0, 1, 1,
-0.4592662, 0.5170444, -2.114037, 1, 0, 0, 1, 1,
-0.4565427, 0.3341661, -1.951748, 1, 0, 0, 1, 1,
-0.4506796, 0.9467117, 1.070169, 0, 0, 0, 1, 1,
-0.4410799, 0.8859323, -0.7192258, 0, 0, 0, 1, 1,
-0.4392301, -1.361672, -2.963649, 0, 0, 0, 1, 1,
-0.4389493, 0.7684945, 0.2668025, 0, 0, 0, 1, 1,
-0.4380508, -2.070232, -2.42687, 0, 0, 0, 1, 1,
-0.4380022, 0.1508422, -1.851839, 0, 0, 0, 1, 1,
-0.4378172, -0.8366479, -3.685889, 0, 0, 0, 1, 1,
-0.431913, 0.576953, -2.908013, 1, 1, 1, 1, 1,
-0.4299906, 0.8843505, -1.01415, 1, 1, 1, 1, 1,
-0.4283403, -1.849291, -1.920656, 1, 1, 1, 1, 1,
-0.4281136, -0.5767856, -2.559491, 1, 1, 1, 1, 1,
-0.4229338, -1.753421, -2.871537, 1, 1, 1, 1, 1,
-0.4219206, -1.566951, -2.479949, 1, 1, 1, 1, 1,
-0.4175546, -0.2806767, -0.9374846, 1, 1, 1, 1, 1,
-0.4130632, -0.005865514, -0.9886234, 1, 1, 1, 1, 1,
-0.4119888, -0.5168866, -2.383124, 1, 1, 1, 1, 1,
-0.4102346, -0.06259903, -3.419185, 1, 1, 1, 1, 1,
-0.4099008, -0.0120463, 0.04323441, 1, 1, 1, 1, 1,
-0.4098331, -0.6775188, -3.289084, 1, 1, 1, 1, 1,
-0.4073268, 1.129186, 0.03377555, 1, 1, 1, 1, 1,
-0.4034836, -1.250394, -4.213776, 1, 1, 1, 1, 1,
-0.4020784, -0.004422836, -0.671649, 1, 1, 1, 1, 1,
-0.4010522, 1.740148, -0.1843293, 0, 0, 1, 1, 1,
-0.4009833, 0.8630022, -0.6199891, 1, 0, 0, 1, 1,
-0.3990753, 0.4272543, -0.3484714, 1, 0, 0, 1, 1,
-0.3979544, 1.381915, -1.043014, 1, 0, 0, 1, 1,
-0.3971526, 0.4786376, -0.8663931, 1, 0, 0, 1, 1,
-0.3962173, -0.4744071, -2.509427, 1, 0, 0, 1, 1,
-0.394152, -1.141087, -3.32298, 0, 0, 0, 1, 1,
-0.3938255, 0.7668502, -0.2393985, 0, 0, 0, 1, 1,
-0.3937691, 0.4580095, -1.140941, 0, 0, 0, 1, 1,
-0.3910014, -0.4158142, -2.508883, 0, 0, 0, 1, 1,
-0.3900512, 0.8495036, -3.395328, 0, 0, 0, 1, 1,
-0.3877673, -0.2267888, -3.734908, 0, 0, 0, 1, 1,
-0.387005, 0.7859271, -0.5329868, 0, 0, 0, 1, 1,
-0.3794057, 0.8334034, 0.4508373, 1, 1, 1, 1, 1,
-0.377266, 0.1796278, -0.1796415, 1, 1, 1, 1, 1,
-0.374334, -0.1753123, -1.962669, 1, 1, 1, 1, 1,
-0.3678826, 0.726615, -2.006745, 1, 1, 1, 1, 1,
-0.3660633, 2.442042, 0.002561538, 1, 1, 1, 1, 1,
-0.3632555, -0.6099735, -1.902645, 1, 1, 1, 1, 1,
-0.3607009, -0.88564, -4.21016, 1, 1, 1, 1, 1,
-0.3601853, -1.092376, -3.840331, 1, 1, 1, 1, 1,
-0.35408, -0.9659273, -3.625152, 1, 1, 1, 1, 1,
-0.3478195, -1.16546, -0.8418803, 1, 1, 1, 1, 1,
-0.3418271, -0.07937324, -1.181053, 1, 1, 1, 1, 1,
-0.3417365, -1.460539, -3.005443, 1, 1, 1, 1, 1,
-0.3394511, -0.3404433, -3.200315, 1, 1, 1, 1, 1,
-0.3362569, -0.9932462, -4.263085, 1, 1, 1, 1, 1,
-0.333054, 0.6902168, -1.474631, 1, 1, 1, 1, 1,
-0.3306575, 1.676306, -0.9984433, 0, 0, 1, 1, 1,
-0.3255022, 0.3038949, -1.280561, 1, 0, 0, 1, 1,
-0.3222317, -0.09216859, -2.144445, 1, 0, 0, 1, 1,
-0.3173468, -0.7669052, -3.360925, 1, 0, 0, 1, 1,
-0.3110824, 0.4753504, -2.960218, 1, 0, 0, 1, 1,
-0.3097696, -0.1666517, -2.231691, 1, 0, 0, 1, 1,
-0.3081671, 0.3100907, -1.03863, 0, 0, 0, 1, 1,
-0.3058713, -1.516126, -3.244011, 0, 0, 0, 1, 1,
-0.3041375, -0.5754158, -3.580121, 0, 0, 0, 1, 1,
-0.3021373, -0.470462, -3.346601, 0, 0, 0, 1, 1,
-0.3015679, -2.279898, -1.242748, 0, 0, 0, 1, 1,
-0.298115, 0.4372992, 0.1078482, 0, 0, 0, 1, 1,
-0.2916125, 0.9647728, 0.5110362, 0, 0, 0, 1, 1,
-0.2914954, -0.4950672, -3.112256, 1, 1, 1, 1, 1,
-0.2881962, -0.7030821, -2.491305, 1, 1, 1, 1, 1,
-0.2867, -2.739007, -2.743152, 1, 1, 1, 1, 1,
-0.2781622, 1.407667, -0.5076541, 1, 1, 1, 1, 1,
-0.2757719, -1.075052, -1.525165, 1, 1, 1, 1, 1,
-0.2752605, -0.1461542, -0.6133632, 1, 1, 1, 1, 1,
-0.2746398, -0.7314153, -3.852382, 1, 1, 1, 1, 1,
-0.2738739, 1.130362, -0.9622882, 1, 1, 1, 1, 1,
-0.2663558, -1.245161, -2.987894, 1, 1, 1, 1, 1,
-0.2641746, 0.5857323, 0.865352, 1, 1, 1, 1, 1,
-0.2637682, 0.7457772, 0.6594576, 1, 1, 1, 1, 1,
-0.2619412, -0.4929574, -1.878148, 1, 1, 1, 1, 1,
-0.2614003, -1.996706, -3.38825, 1, 1, 1, 1, 1,
-0.2598565, -0.6915517, -3.35089, 1, 1, 1, 1, 1,
-0.258437, -0.5689126, -2.627477, 1, 1, 1, 1, 1,
-0.2550262, 0.0126535, -1.855283, 0, 0, 1, 1, 1,
-0.254156, 0.7643817, -0.4158346, 1, 0, 0, 1, 1,
-0.2534729, 1.256672, -0.5723857, 1, 0, 0, 1, 1,
-0.2479522, 0.7810028, -0.8533598, 1, 0, 0, 1, 1,
-0.2454317, -0.3853011, -2.594806, 1, 0, 0, 1, 1,
-0.2450414, 0.495361, -0.4794866, 1, 0, 0, 1, 1,
-0.244786, -0.04863476, -1.068149, 0, 0, 0, 1, 1,
-0.2436983, 0.4283642, -1.301327, 0, 0, 0, 1, 1,
-0.2378042, -0.3885664, -1.055267, 0, 0, 0, 1, 1,
-0.2375249, -1.613806, -2.846295, 0, 0, 0, 1, 1,
-0.2364548, 0.6663119, 1.012143, 0, 0, 0, 1, 1,
-0.2357645, -0.7086154, -2.012356, 0, 0, 0, 1, 1,
-0.2332727, -0.5308366, -3.425569, 0, 0, 0, 1, 1,
-0.2301496, -0.5452361, -2.852524, 1, 1, 1, 1, 1,
-0.2294755, 0.3339371, -0.5214244, 1, 1, 1, 1, 1,
-0.2288722, 0.3475591, -0.08193915, 1, 1, 1, 1, 1,
-0.2245822, 1.423606, 1.768028, 1, 1, 1, 1, 1,
-0.224113, -0.1145719, -1.622018, 1, 1, 1, 1, 1,
-0.2233304, 1.561913, 0.7172608, 1, 1, 1, 1, 1,
-0.2214151, 0.2000252, 0.2108765, 1, 1, 1, 1, 1,
-0.217778, 0.2038366, -0.4309721, 1, 1, 1, 1, 1,
-0.2162162, 0.5602117, -1.580161, 1, 1, 1, 1, 1,
-0.2140265, 0.5458385, -1.915916, 1, 1, 1, 1, 1,
-0.2111701, -0.4805924, -3.543629, 1, 1, 1, 1, 1,
-0.2091862, 0.6874584, 1.023697, 1, 1, 1, 1, 1,
-0.2075107, 1.149545, 0.05334755, 1, 1, 1, 1, 1,
-0.2074713, -0.01145932, -2.323789, 1, 1, 1, 1, 1,
-0.2028823, 0.2484836, -0.8304567, 1, 1, 1, 1, 1,
-0.2012949, 1.662781, -0.6953287, 0, 0, 1, 1, 1,
-0.2007435, 0.3497568, 0.3661481, 1, 0, 0, 1, 1,
-0.2004755, 0.8002288, 0.8934039, 1, 0, 0, 1, 1,
-0.1995429, 0.5942792, -0.1638805, 1, 0, 0, 1, 1,
-0.1966391, -0.4128543, -1.805031, 1, 0, 0, 1, 1,
-0.1894134, -0.2969102, -0.6351229, 1, 0, 0, 1, 1,
-0.1873039, -1.515126, 0.2961327, 0, 0, 0, 1, 1,
-0.1814201, -0.471509, -2.56073, 0, 0, 0, 1, 1,
-0.1797452, 0.6294222, 0.2015784, 0, 0, 0, 1, 1,
-0.1764753, 0.1598011, -0.1088979, 0, 0, 0, 1, 1,
-0.1761452, 0.345564, -1.033714, 0, 0, 0, 1, 1,
-0.174407, 0.443953, -1.138339, 0, 0, 0, 1, 1,
-0.1731059, 0.4155451, -1.830728, 0, 0, 0, 1, 1,
-0.1623757, -0.9431818, -4.134967, 1, 1, 1, 1, 1,
-0.1615131, -1.320823, -3.661878, 1, 1, 1, 1, 1,
-0.1601881, 0.1949706, 0.9001614, 1, 1, 1, 1, 1,
-0.159574, -0.2387698, -1.755464, 1, 1, 1, 1, 1,
-0.1560504, -1.895278, -3.988686, 1, 1, 1, 1, 1,
-0.1559115, 1.840444, 1.293211, 1, 1, 1, 1, 1,
-0.154995, -1.204613, -2.165068, 1, 1, 1, 1, 1,
-0.146038, -1.089156, -3.758283, 1, 1, 1, 1, 1,
-0.1402118, 0.6556039, -1.110923, 1, 1, 1, 1, 1,
-0.1351017, 1.019791, 1.480582, 1, 1, 1, 1, 1,
-0.1329006, -1.136221, -4.180456, 1, 1, 1, 1, 1,
-0.1320003, -1.457185, -3.676069, 1, 1, 1, 1, 1,
-0.1308012, -0.3899809, -3.13076, 1, 1, 1, 1, 1,
-0.1305236, -1.336041, -4.417744, 1, 1, 1, 1, 1,
-0.1300046, 0.5112594, 0.2478241, 1, 1, 1, 1, 1,
-0.128814, 0.5412757, -1.09521, 0, 0, 1, 1, 1,
-0.1233585, -0.3801501, -2.638057, 1, 0, 0, 1, 1,
-0.1209338, -1.301978, -3.216399, 1, 0, 0, 1, 1,
-0.118901, -1.115849, -2.281597, 1, 0, 0, 1, 1,
-0.1148735, -0.8504704, -2.157474, 1, 0, 0, 1, 1,
-0.1129421, -1.648319, -3.38473, 1, 0, 0, 1, 1,
-0.1116973, -0.3988883, -3.015746, 0, 0, 0, 1, 1,
-0.108013, -0.08344532, -2.413174, 0, 0, 0, 1, 1,
-0.1048677, -1.521613, -3.956764, 0, 0, 0, 1, 1,
-0.1048359, 0.541908, 0.3451687, 0, 0, 0, 1, 1,
-0.1040099, 0.4871288, 0.2804922, 0, 0, 0, 1, 1,
-0.103351, 1.054489, -1.053597, 0, 0, 0, 1, 1,
-0.1029379, 1.105415, 0.8803826, 0, 0, 0, 1, 1,
-0.09887878, 0.3700843, -1.363602, 1, 1, 1, 1, 1,
-0.09746161, -0.2233954, -3.159514, 1, 1, 1, 1, 1,
-0.09478317, 1.064323, 1.578679, 1, 1, 1, 1, 1,
-0.09393733, -1.293867, -3.953199, 1, 1, 1, 1, 1,
-0.08948973, -0.6877981, -3.103359, 1, 1, 1, 1, 1,
-0.08928641, 1.167188, 0.5811331, 1, 1, 1, 1, 1,
-0.08809888, 0.3744982, 0.49627, 1, 1, 1, 1, 1,
-0.08220153, 0.3980229, -0.7274267, 1, 1, 1, 1, 1,
-0.07908006, -0.4131999, -2.911659, 1, 1, 1, 1, 1,
-0.07470454, -0.8781418, -1.933663, 1, 1, 1, 1, 1,
-0.07412983, -0.1537448, -3.436391, 1, 1, 1, 1, 1,
-0.07228701, -1.724194, -2.922764, 1, 1, 1, 1, 1,
-0.07220627, -0.464449, -3.47764, 1, 1, 1, 1, 1,
-0.06878551, 0.1795637, -1.0606, 1, 1, 1, 1, 1,
-0.06811854, 0.3931388, 0.8602537, 1, 1, 1, 1, 1,
-0.06730668, -0.539144, -2.754714, 0, 0, 1, 1, 1,
-0.06639347, -0.612332, -3.162781, 1, 0, 0, 1, 1,
-0.0657715, 0.8519231, -0.7660629, 1, 0, 0, 1, 1,
-0.06288894, 0.9018862, -1.576163, 1, 0, 0, 1, 1,
-0.06055927, -1.608535, -2.822413, 1, 0, 0, 1, 1,
-0.05606004, 1.726172, 1.052999, 1, 0, 0, 1, 1,
-0.05124069, -1.273701, -3.543465, 0, 0, 0, 1, 1,
-0.0473704, -0.6392681, -3.906255, 0, 0, 0, 1, 1,
-0.04605149, -0.02077626, -2.131951, 0, 0, 0, 1, 1,
-0.04517612, 0.7144698, 0.4434617, 0, 0, 0, 1, 1,
-0.04436824, -0.6530169, -2.142905, 0, 0, 0, 1, 1,
-0.03586328, 1.503687, 0.3094735, 0, 0, 0, 1, 1,
-0.03475162, 0.3034365, 1.010095, 0, 0, 0, 1, 1,
-0.03070004, 0.1236561, -0.1752667, 1, 1, 1, 1, 1,
-0.02836503, 0.01181642, -1.386314, 1, 1, 1, 1, 1,
-0.02555743, -1.303467, -4.050066, 1, 1, 1, 1, 1,
-0.02248588, -1.081065, -3.693801, 1, 1, 1, 1, 1,
-0.0201596, -1.335209, -3.430054, 1, 1, 1, 1, 1,
-0.01984157, 0.2936953, 1.119832, 1, 1, 1, 1, 1,
-0.01400677, 0.05073782, -0.010536, 1, 1, 1, 1, 1,
-0.008668507, 0.2803864, 0.6747482, 1, 1, 1, 1, 1,
-0.007885817, -0.02750702, -1.258598, 1, 1, 1, 1, 1,
-0.007679477, -1.115618, -1.674959, 1, 1, 1, 1, 1,
-0.00454748, 0.7980427, -1.230869, 1, 1, 1, 1, 1,
-0.003932899, -1.335028, -2.24654, 1, 1, 1, 1, 1,
0.006119557, 1.029046, -0.2116096, 1, 1, 1, 1, 1,
0.006193503, 0.2723694, 0.522189, 1, 1, 1, 1, 1,
0.006656237, -0.03697478, 2.457742, 1, 1, 1, 1, 1,
0.007736758, -1.451228, 3.386697, 0, 0, 1, 1, 1,
0.009468925, -0.1152658, 4.417857, 1, 0, 0, 1, 1,
0.02224411, 0.2149469, 0.9480362, 1, 0, 0, 1, 1,
0.02272962, 0.2420585, 0.5319049, 1, 0, 0, 1, 1,
0.02518099, -1.521846, 3.65517, 1, 0, 0, 1, 1,
0.0253741, 1.247174, 0.02015032, 1, 0, 0, 1, 1,
0.027226, 0.3231, -0.193778, 0, 0, 0, 1, 1,
0.03138959, -1.463275, 1.637825, 0, 0, 0, 1, 1,
0.03606822, 0.6989784, 0.8192449, 0, 0, 0, 1, 1,
0.03677003, -0.7301384, 2.595087, 0, 0, 0, 1, 1,
0.04057674, 0.9115528, 1.828596, 0, 0, 0, 1, 1,
0.04226987, -0.7227232, 3.390851, 0, 0, 0, 1, 1,
0.04486429, -1.548689, 1.161135, 0, 0, 0, 1, 1,
0.04798141, -0.004526496, -0.1374361, 1, 1, 1, 1, 1,
0.05183855, -0.6268133, 4.181986, 1, 1, 1, 1, 1,
0.05237092, 1.105575, 1.110721, 1, 1, 1, 1, 1,
0.05599906, -1.359726, 1.835765, 1, 1, 1, 1, 1,
0.06331619, -2.275578, 3.785875, 1, 1, 1, 1, 1,
0.06337605, 1.346195, 0.2165748, 1, 1, 1, 1, 1,
0.0634942, 1.002426, -0.2924189, 1, 1, 1, 1, 1,
0.06499676, 0.07040584, -0.2512219, 1, 1, 1, 1, 1,
0.06931792, -0.3303938, 1.396867, 1, 1, 1, 1, 1,
0.07267526, -0.04129057, 1.365103, 1, 1, 1, 1, 1,
0.07406737, 0.3111575, -0.6115363, 1, 1, 1, 1, 1,
0.07481917, 2.684831, -0.4673727, 1, 1, 1, 1, 1,
0.07525421, -0.4156779, 2.072246, 1, 1, 1, 1, 1,
0.07592092, 1.337772, -0.2911885, 1, 1, 1, 1, 1,
0.08163903, -0.3415371, 3.315642, 1, 1, 1, 1, 1,
0.08244607, -1.096654, 3.375254, 0, 0, 1, 1, 1,
0.08355766, 1.215722, 0.1957202, 1, 0, 0, 1, 1,
0.08425889, -0.01066257, 2.481698, 1, 0, 0, 1, 1,
0.08485804, -0.1750057, 3.374401, 1, 0, 0, 1, 1,
0.08800257, 0.9581087, -0.526793, 1, 0, 0, 1, 1,
0.08820049, 1.606759, 0.4875585, 1, 0, 0, 1, 1,
0.0884247, -0.4449722, 3.790383, 0, 0, 0, 1, 1,
0.08865274, 1.093605, 1.030114, 0, 0, 0, 1, 1,
0.0894367, 1.577893, -1.646084, 0, 0, 0, 1, 1,
0.09075756, -1.788881, 2.696719, 0, 0, 0, 1, 1,
0.09306303, -1.130619, 3.281358, 0, 0, 0, 1, 1,
0.09409703, -0.104126, 2.414257, 0, 0, 0, 1, 1,
0.09481943, -0.3673101, 2.499268, 0, 0, 0, 1, 1,
0.09483586, 0.2853597, 0.2456086, 1, 1, 1, 1, 1,
0.09528656, -0.2070802, 2.444467, 1, 1, 1, 1, 1,
0.09698123, 1.164937, -0.6485008, 1, 1, 1, 1, 1,
0.107178, -0.1245533, 1.036586, 1, 1, 1, 1, 1,
0.1079892, -0.4044294, 3.606807, 1, 1, 1, 1, 1,
0.1088501, 0.1611989, -0.1809118, 1, 1, 1, 1, 1,
0.1097356, -1.498066, 3.715957, 1, 1, 1, 1, 1,
0.1119789, 0.6137317, 0.3241078, 1, 1, 1, 1, 1,
0.1128052, 0.1479606, 0.5097152, 1, 1, 1, 1, 1,
0.1189376, 0.6713756, 1.041719, 1, 1, 1, 1, 1,
0.1195685, 0.3808976, -0.2251449, 1, 1, 1, 1, 1,
0.1236571, 0.9159874, 0.01006546, 1, 1, 1, 1, 1,
0.125264, 1.260629, 0.3131292, 1, 1, 1, 1, 1,
0.132395, -1.316384, 2.508198, 1, 1, 1, 1, 1,
0.133407, 1.151971, 1.43206, 1, 1, 1, 1, 1,
0.1338585, -0.6760817, 2.170202, 0, 0, 1, 1, 1,
0.1364688, 0.9300144, 1.964396, 1, 0, 0, 1, 1,
0.1429351, -1.296142, 1.629082, 1, 0, 0, 1, 1,
0.1447007, 0.4409225, -0.9723233, 1, 0, 0, 1, 1,
0.1506208, -1.184193, 2.926876, 1, 0, 0, 1, 1,
0.1509882, 1.757218, -0.6781853, 1, 0, 0, 1, 1,
0.1510451, -0.3865688, 0.9747043, 0, 0, 0, 1, 1,
0.1514677, -1.399202, 2.404235, 0, 0, 0, 1, 1,
0.1607512, 0.6429508, 0.2594133, 0, 0, 0, 1, 1,
0.1613645, 0.5817739, 1.388167, 0, 0, 0, 1, 1,
0.1617228, -1.136203, 2.218299, 0, 0, 0, 1, 1,
0.1617575, -1.30511, 3.105041, 0, 0, 0, 1, 1,
0.1617614, -1.101248, 2.776584, 0, 0, 0, 1, 1,
0.1643166, -0.4764343, 2.368042, 1, 1, 1, 1, 1,
0.1649104, 0.07690246, 1.493762, 1, 1, 1, 1, 1,
0.1649629, 0.07752679, 1.179282, 1, 1, 1, 1, 1,
0.1665167, -0.1876564, 4.082277, 1, 1, 1, 1, 1,
0.1757496, -0.2268724, 0.5360717, 1, 1, 1, 1, 1,
0.1813362, -0.4341674, 2.913511, 1, 1, 1, 1, 1,
0.1820279, -0.2179497, 3.333873, 1, 1, 1, 1, 1,
0.1825967, 0.3026916, 0.8227366, 1, 1, 1, 1, 1,
0.1831334, 0.5712938, -0.3418998, 1, 1, 1, 1, 1,
0.1895397, 0.1874164, 1.466341, 1, 1, 1, 1, 1,
0.1908777, -0.05146251, 3.44717, 1, 1, 1, 1, 1,
0.1931531, -0.7147749, 1.736924, 1, 1, 1, 1, 1,
0.1949494, -2.129499, 4.161273, 1, 1, 1, 1, 1,
0.2003929, 0.1080127, 0.2596981, 1, 1, 1, 1, 1,
0.202117, 0.335017, 1.600282, 1, 1, 1, 1, 1,
0.2022438, 0.5856671, 1.03163, 0, 0, 1, 1, 1,
0.2026411, 0.6751738, 0.8464099, 1, 0, 0, 1, 1,
0.2061661, -0.8312592, 1.063702, 1, 0, 0, 1, 1,
0.2107716, -0.8408344, 2.891323, 1, 0, 0, 1, 1,
0.2169555, -0.243451, 1.417949, 1, 0, 0, 1, 1,
0.2179373, 2.085086, 0.3539817, 1, 0, 0, 1, 1,
0.2180066, -0.5530486, 3.891196, 0, 0, 0, 1, 1,
0.2195349, 0.6698428, 2.070704, 0, 0, 0, 1, 1,
0.2209425, -1.811966, 4.633518, 0, 0, 0, 1, 1,
0.2219975, 0.654353, -0.1120854, 0, 0, 0, 1, 1,
0.2260348, 0.1402851, 0.8698497, 0, 0, 0, 1, 1,
0.2265497, 0.9287701, 0.9190642, 0, 0, 0, 1, 1,
0.2267262, -0.3122022, 4.749682, 0, 0, 0, 1, 1,
0.2319772, 0.3874925, 0.8560541, 1, 1, 1, 1, 1,
0.2335395, 0.88124, 0.7845183, 1, 1, 1, 1, 1,
0.2364005, -1.437775, 2.960959, 1, 1, 1, 1, 1,
0.236801, -0.5914932, 2.191925, 1, 1, 1, 1, 1,
0.2409024, 0.3306538, -0.04052331, 1, 1, 1, 1, 1,
0.2411342, 0.2987447, 1.261555, 1, 1, 1, 1, 1,
0.244369, 0.8313584, -0.1330443, 1, 1, 1, 1, 1,
0.2457472, 0.5046049, 1.739772, 1, 1, 1, 1, 1,
0.2462878, 0.2687736, -0.4484036, 1, 1, 1, 1, 1,
0.2495787, -0.5357524, 2.811314, 1, 1, 1, 1, 1,
0.249596, -0.9033933, 1.016972, 1, 1, 1, 1, 1,
0.2512121, 0.7202522, -1.209404, 1, 1, 1, 1, 1,
0.2529918, 0.3842906, 0.3078834, 1, 1, 1, 1, 1,
0.2538394, -0.6678978, 1.99298, 1, 1, 1, 1, 1,
0.2555916, 0.214225, 1.64887, 1, 1, 1, 1, 1,
0.2715897, 1.057546, -1.181926, 0, 0, 1, 1, 1,
0.2762759, -2.07164, 4.124418, 1, 0, 0, 1, 1,
0.2792305, 0.5766218, -1.056681, 1, 0, 0, 1, 1,
0.2804325, -0.5979119, 2.899923, 1, 0, 0, 1, 1,
0.2808686, -0.5441707, 2.076206, 1, 0, 0, 1, 1,
0.2834897, -0.4547263, 0.6339883, 1, 0, 0, 1, 1,
0.2860433, -1.29018, 1.643637, 0, 0, 0, 1, 1,
0.2895003, -0.1670374, 0.6326017, 0, 0, 0, 1, 1,
0.2962336, 1.068926, 0.1233509, 0, 0, 0, 1, 1,
0.2970707, -0.7198017, 2.384787, 0, 0, 0, 1, 1,
0.2984691, 0.002897023, 1.434258, 0, 0, 0, 1, 1,
0.3012772, 0.2993833, 0.552527, 0, 0, 0, 1, 1,
0.3048033, -0.8825501, 2.676196, 0, 0, 0, 1, 1,
0.3093633, 0.7656915, -0.3545134, 1, 1, 1, 1, 1,
0.3105232, -1.439967, 3.089215, 1, 1, 1, 1, 1,
0.3179204, 1.750595, 0.2655488, 1, 1, 1, 1, 1,
0.3192904, -1.039588, 1.947033, 1, 1, 1, 1, 1,
0.3219796, 0.7039429, -0.4098017, 1, 1, 1, 1, 1,
0.3229176, -0.7973884, 2.881502, 1, 1, 1, 1, 1,
0.3233556, 0.3494904, 0.7311823, 1, 1, 1, 1, 1,
0.3237612, -0.05695693, 1.827232, 1, 1, 1, 1, 1,
0.3294304, -0.1306119, 3.420112, 1, 1, 1, 1, 1,
0.3300806, 0.2213787, 0.3523533, 1, 1, 1, 1, 1,
0.330269, -1.058211, 2.94751, 1, 1, 1, 1, 1,
0.3323105, -1.030255, 1.510956, 1, 1, 1, 1, 1,
0.3367304, -0.3020331, 1.097307, 1, 1, 1, 1, 1,
0.3371597, -0.3700903, 3.591413, 1, 1, 1, 1, 1,
0.3395729, -0.987444, 2.755805, 1, 1, 1, 1, 1,
0.3411216, 0.6509972, -0.1185689, 0, 0, 1, 1, 1,
0.3411373, 0.3016573, -0.611471, 1, 0, 0, 1, 1,
0.3412737, -0.547924, 3.104501, 1, 0, 0, 1, 1,
0.343997, -0.4664375, 2.763625, 1, 0, 0, 1, 1,
0.3452576, 0.03965473, 0.2237293, 1, 0, 0, 1, 1,
0.3460405, 0.4078544, 1.045344, 1, 0, 0, 1, 1,
0.3503729, 1.659526, -0.4191596, 0, 0, 0, 1, 1,
0.3575101, -0.178483, 2.890444, 0, 0, 0, 1, 1,
0.3616348, 0.8624566, 0.4043179, 0, 0, 0, 1, 1,
0.3645667, -1.61913, 3.358689, 0, 0, 0, 1, 1,
0.3659329, 0.4785528, 1.238203, 0, 0, 0, 1, 1,
0.368884, 0.6010537, 0.1768985, 0, 0, 0, 1, 1,
0.3691716, 0.3703185, -0.4927711, 0, 0, 0, 1, 1,
0.3733099, -0.4312307, 1.149424, 1, 1, 1, 1, 1,
0.3767721, -0.5089796, 2.390413, 1, 1, 1, 1, 1,
0.3767855, -1.521088, 2.379404, 1, 1, 1, 1, 1,
0.3808804, 0.1996392, -0.5043293, 1, 1, 1, 1, 1,
0.3816476, 0.3466929, 0.5711693, 1, 1, 1, 1, 1,
0.3851823, 0.3490543, 2.714167, 1, 1, 1, 1, 1,
0.3929164, -0.845809, 3.558116, 1, 1, 1, 1, 1,
0.3933586, 0.6031149, 0.3670833, 1, 1, 1, 1, 1,
0.3952923, 0.723718, 0.7025079, 1, 1, 1, 1, 1,
0.3967088, 0.8107581, 2.431287, 1, 1, 1, 1, 1,
0.3984139, -0.4729468, 0.8151343, 1, 1, 1, 1, 1,
0.4011414, -1.17696, 3.800974, 1, 1, 1, 1, 1,
0.4029943, -1.561621, 2.440707, 1, 1, 1, 1, 1,
0.4045857, 1.837059, 1.407749, 1, 1, 1, 1, 1,
0.4069851, 2.145609, -0.1355227, 1, 1, 1, 1, 1,
0.4080766, 0.3974245, 0.8154211, 0, 0, 1, 1, 1,
0.4153949, -1.484271, 3.574186, 1, 0, 0, 1, 1,
0.4178985, 0.419289, 0.4000771, 1, 0, 0, 1, 1,
0.4345487, 0.6611869, -1.328061, 1, 0, 0, 1, 1,
0.4357445, 1.158784, 1.356543, 1, 0, 0, 1, 1,
0.4368396, 0.4028894, 0.5282409, 1, 0, 0, 1, 1,
0.4457725, -1.396671, 4.343195, 0, 0, 0, 1, 1,
0.4482017, -0.6196403, 2.678829, 0, 0, 0, 1, 1,
0.4484205, 1.264848, 0.3102672, 0, 0, 0, 1, 1,
0.4497172, -0.06891041, -0.06205118, 0, 0, 0, 1, 1,
0.4499191, 1.349312, 2.597647, 0, 0, 0, 1, 1,
0.455482, 1.793864, -0.02321258, 0, 0, 0, 1, 1,
0.4563715, -0.5299447, 2.193189, 0, 0, 0, 1, 1,
0.4589995, 1.565034, 0.5030866, 1, 1, 1, 1, 1,
0.4606224, 0.1043276, -0.1892142, 1, 1, 1, 1, 1,
0.4643386, -0.2334429, 1.859812, 1, 1, 1, 1, 1,
0.464493, 0.507987, 1.632208, 1, 1, 1, 1, 1,
0.4654631, 0.07094955, 3.364397, 1, 1, 1, 1, 1,
0.4697581, 0.3756784, 2.664497, 1, 1, 1, 1, 1,
0.472491, -0.5567565, 1.325868, 1, 1, 1, 1, 1,
0.4732532, 0.4653862, 0.7208462, 1, 1, 1, 1, 1,
0.4747705, -1.535044, 4.277463, 1, 1, 1, 1, 1,
0.4749969, 1.425769, 0.5396563, 1, 1, 1, 1, 1,
0.481313, 1.819195, 0.7475696, 1, 1, 1, 1, 1,
0.48181, 0.4846093, 1.675922, 1, 1, 1, 1, 1,
0.4836821, 0.009612439, 2.697958, 1, 1, 1, 1, 1,
0.4838775, 1.991949, -1.258027, 1, 1, 1, 1, 1,
0.490368, 0.9747458, 0.3673578, 1, 1, 1, 1, 1,
0.4932152, 2.026427, -0.8277633, 0, 0, 1, 1, 1,
0.4945483, 1.313079, -1.713842, 1, 0, 0, 1, 1,
0.4969755, -0.4363141, 3.386332, 1, 0, 0, 1, 1,
0.5019834, 1.273585, 0.376708, 1, 0, 0, 1, 1,
0.5035315, -0.7181638, 2.583828, 1, 0, 0, 1, 1,
0.5062783, -0.9313698, 2.800881, 1, 0, 0, 1, 1,
0.5093902, -0.9209611, 2.022937, 0, 0, 0, 1, 1,
0.513086, 0.8363125, 0.8948983, 0, 0, 0, 1, 1,
0.513919, -0.1105834, 1.627651, 0, 0, 0, 1, 1,
0.5173137, -0.3476117, 3.351084, 0, 0, 0, 1, 1,
0.5220832, -0.01600233, 0.03040945, 0, 0, 0, 1, 1,
0.5281442, 0.1430279, 0.5115001, 0, 0, 0, 1, 1,
0.5355735, 0.1844477, 1.151419, 0, 0, 0, 1, 1,
0.5412443, -1.599898, 2.419993, 1, 1, 1, 1, 1,
0.5486651, 3.000741, -0.976448, 1, 1, 1, 1, 1,
0.5487847, -0.6208843, -0.3910216, 1, 1, 1, 1, 1,
0.5498964, 1.256596, -0.2787115, 1, 1, 1, 1, 1,
0.5501573, -0.5134653, 1.165202, 1, 1, 1, 1, 1,
0.5512656, -0.6607764, 2.29584, 1, 1, 1, 1, 1,
0.5549549, -0.8060525, 4.235307, 1, 1, 1, 1, 1,
0.5688499, -0.03468909, 1.952771, 1, 1, 1, 1, 1,
0.5728578, 0.7291427, 1.779725, 1, 1, 1, 1, 1,
0.5756191, 0.6353266, 0.7039438, 1, 1, 1, 1, 1,
0.5850911, -0.3587014, 2.655186, 1, 1, 1, 1, 1,
0.5855479, 0.1211898, 1.414405, 1, 1, 1, 1, 1,
0.5875427, -0.2430424, 2.34445, 1, 1, 1, 1, 1,
0.5914336, 0.1723298, 1.129251, 1, 1, 1, 1, 1,
0.5940775, 0.9327948, 0.9310536, 1, 1, 1, 1, 1,
0.5980195, 0.8211123, 0.2832661, 0, 0, 1, 1, 1,
0.6049033, -0.9065479, 2.604601, 1, 0, 0, 1, 1,
0.6049109, 0.8627027, 2.238776, 1, 0, 0, 1, 1,
0.6055421, -0.6527787, 3.254167, 1, 0, 0, 1, 1,
0.613094, 0.1991812, 2.036237, 1, 0, 0, 1, 1,
0.614447, 0.4021574, 3.328475, 1, 0, 0, 1, 1,
0.6243854, -0.6696019, 1.772929, 0, 0, 0, 1, 1,
0.6275426, -1.199769, 1.866116, 0, 0, 0, 1, 1,
0.6294918, -1.634523, 2.55248, 0, 0, 0, 1, 1,
0.6315509, -0.3199705, 1.891727, 0, 0, 0, 1, 1,
0.6327202, 0.3006964, 2.711952, 0, 0, 0, 1, 1,
0.6333868, -1.435532, 2.524252, 0, 0, 0, 1, 1,
0.6405973, -0.4933378, 2.831939, 0, 0, 0, 1, 1,
0.6422642, -0.09578145, 1.666992, 1, 1, 1, 1, 1,
0.6435353, 1.857157, 1.910702, 1, 1, 1, 1, 1,
0.6453827, 0.9778129, 0.7566421, 1, 1, 1, 1, 1,
0.6474873, 0.2582985, 0.4217193, 1, 1, 1, 1, 1,
0.6510811, -0.5544412, 1.908738, 1, 1, 1, 1, 1,
0.6571488, 1.019936, 1.767361, 1, 1, 1, 1, 1,
0.6583434, 1.014354, 2.786319, 1, 1, 1, 1, 1,
0.6591626, -0.02919912, 1.345635, 1, 1, 1, 1, 1,
0.666887, -0.4789586, 2.174817, 1, 1, 1, 1, 1,
0.6698853, 0.003069367, 1.218538, 1, 1, 1, 1, 1,
0.6723685, 0.2678796, -0.5887291, 1, 1, 1, 1, 1,
0.6740612, 0.04814621, 1.231643, 1, 1, 1, 1, 1,
0.6759175, -1.813429, 1.97304, 1, 1, 1, 1, 1,
0.6833092, 0.4206318, 1.950284, 1, 1, 1, 1, 1,
0.686209, 0.6767276, -1.806133, 1, 1, 1, 1, 1,
0.6863022, -0.2872071, 2.533315, 0, 0, 1, 1, 1,
0.6887497, 0.6113846, 1.653283, 1, 0, 0, 1, 1,
0.6889979, 0.7505694, -0.3261575, 1, 0, 0, 1, 1,
0.6931559, 0.5805375, 1.103255, 1, 0, 0, 1, 1,
0.6963087, -1.644314, 2.266823, 1, 0, 0, 1, 1,
0.6970662, 1.002429, 0.2420446, 1, 0, 0, 1, 1,
0.7006103, -0.4579005, 2.591787, 0, 0, 0, 1, 1,
0.7027075, 0.8325924, 2.008302, 0, 0, 0, 1, 1,
0.7028341, -0.6589212, 2.609955, 0, 0, 0, 1, 1,
0.7180803, 0.1728191, 2.639663, 0, 0, 0, 1, 1,
0.7214063, 2.15898, 1.72797, 0, 0, 0, 1, 1,
0.7233023, 0.4368887, 0.2510272, 0, 0, 0, 1, 1,
0.7297184, 0.0006182338, 2.209249, 0, 0, 0, 1, 1,
0.7308089, 1.182895, 0.8393062, 1, 1, 1, 1, 1,
0.7336369, -0.2818726, 1.976179, 1, 1, 1, 1, 1,
0.737338, -0.8667167, 2.970721, 1, 1, 1, 1, 1,
0.7435917, -0.6323783, 3.021148, 1, 1, 1, 1, 1,
0.743681, -0.7277129, 3.381536, 1, 1, 1, 1, 1,
0.7501619, 0.08305929, 1.73264, 1, 1, 1, 1, 1,
0.7538806, 0.2960382, 1.151934, 1, 1, 1, 1, 1,
0.7563648, 1.742805, -0.1976329, 1, 1, 1, 1, 1,
0.7593735, 0.3532664, 0.6001582, 1, 1, 1, 1, 1,
0.7598883, -1.055368, 1.129318, 1, 1, 1, 1, 1,
0.761692, -0.6216952, 2.559781, 1, 1, 1, 1, 1,
0.7637852, -1.063443, 2.721131, 1, 1, 1, 1, 1,
0.7665253, 0.3330525, 0.9514062, 1, 1, 1, 1, 1,
0.7675773, -0.5494315, 2.294551, 1, 1, 1, 1, 1,
0.7724048, -1.383269, 1.600605, 1, 1, 1, 1, 1,
0.7731835, 0.1786814, -0.8551154, 0, 0, 1, 1, 1,
0.7808269, -0.8489472, 1.10399, 1, 0, 0, 1, 1,
0.7819965, -0.286942, 1.711828, 1, 0, 0, 1, 1,
0.7874246, 0.6177463, 1.851231, 1, 0, 0, 1, 1,
0.7936077, -1.076575, 1.791754, 1, 0, 0, 1, 1,
0.7962841, 0.9216977, -0.06738518, 1, 0, 0, 1, 1,
0.7973852, -0.1244968, 1.754477, 0, 0, 0, 1, 1,
0.8009204, -0.7534919, 1.792371, 0, 0, 0, 1, 1,
0.8083762, 0.1721488, 0.817921, 0, 0, 0, 1, 1,
0.8090891, 0.7019557, -0.540751, 0, 0, 0, 1, 1,
0.8116897, 0.06643032, 2.642493, 0, 0, 0, 1, 1,
0.8147044, 0.3494299, 0.07002886, 0, 0, 0, 1, 1,
0.817563, 0.3250658, 1.207078, 0, 0, 0, 1, 1,
0.8198922, 0.925274, 1.168405, 1, 1, 1, 1, 1,
0.8257126, -1.049862, 2.461094, 1, 1, 1, 1, 1,
0.832541, 0.3788437, -0.2786748, 1, 1, 1, 1, 1,
0.8369893, -1.330501, 5.473775, 1, 1, 1, 1, 1,
0.8374507, -0.7584518, 1.542693, 1, 1, 1, 1, 1,
0.8406907, -1.017021, 2.25636, 1, 1, 1, 1, 1,
0.8410405, 0.6263505, 3.857049, 1, 1, 1, 1, 1,
0.8461133, -0.213051, 1.427999, 1, 1, 1, 1, 1,
0.8462934, -0.01011019, 1.883275, 1, 1, 1, 1, 1,
0.8484187, 1.423196, 0.5194399, 1, 1, 1, 1, 1,
0.850394, 0.3544638, 0.1173846, 1, 1, 1, 1, 1,
0.85044, -0.4202841, 2.596606, 1, 1, 1, 1, 1,
0.8533981, 0.6495804, -0.5494474, 1, 1, 1, 1, 1,
0.8596776, -0.3128773, 2.004488, 1, 1, 1, 1, 1,
0.8604522, 0.6728402, 1.584277, 1, 1, 1, 1, 1,
0.8657183, 0.6807165, 2.077309, 0, 0, 1, 1, 1,
0.8716269, 0.9232809, 0.3862956, 1, 0, 0, 1, 1,
0.8815832, -0.7058222, 1.785181, 1, 0, 0, 1, 1,
0.8860227, -0.3581953, 4.053501, 1, 0, 0, 1, 1,
0.8911476, 0.09461825, 1.920864, 1, 0, 0, 1, 1,
0.89876, 1.099274, 1.581516, 1, 0, 0, 1, 1,
0.8990483, -1.321748, 2.404923, 0, 0, 0, 1, 1,
0.903842, -1.610559, 2.894505, 0, 0, 0, 1, 1,
0.9039156, -0.002941984, 2.832859, 0, 0, 0, 1, 1,
0.9079489, 1.307754, 0.5423166, 0, 0, 0, 1, 1,
0.9105433, 1.379278, -0.01852065, 0, 0, 0, 1, 1,
0.9162462, 0.1730625, 2.061242, 0, 0, 0, 1, 1,
0.9168539, -0.9618527, 3.73062, 0, 0, 0, 1, 1,
0.9184951, 1.083892, 1.465577, 1, 1, 1, 1, 1,
0.9244831, 0.6486977, 2.094111, 1, 1, 1, 1, 1,
0.926806, -0.8284146, 3.321731, 1, 1, 1, 1, 1,
0.9269536, 1.022516, 2.015368, 1, 1, 1, 1, 1,
0.9299818, -2.117568, 2.939386, 1, 1, 1, 1, 1,
0.9307823, -1.181864, 2.695612, 1, 1, 1, 1, 1,
0.9380997, -1.357446, 4.181079, 1, 1, 1, 1, 1,
0.9391485, 0.6309197, 2.005699, 1, 1, 1, 1, 1,
0.9405814, -2.000666, 4.653965, 1, 1, 1, 1, 1,
0.9512923, 0.8939604, 1.538822, 1, 1, 1, 1, 1,
0.9571878, 0.714976, 1.292561, 1, 1, 1, 1, 1,
0.9605775, -0.4239873, 1.073118, 1, 1, 1, 1, 1,
0.9618447, -0.6839009, 2.760743, 1, 1, 1, 1, 1,
0.9633693, -1.729767, 3.033112, 1, 1, 1, 1, 1,
0.9635084, -0.7294456, 1.139845, 1, 1, 1, 1, 1,
0.9636108, 0.2015996, 2.729921, 0, 0, 1, 1, 1,
0.965135, 0.856677, -0.7685242, 1, 0, 0, 1, 1,
0.9707066, 1.947644, 0.5760124, 1, 0, 0, 1, 1,
0.9717337, -1.527151, 3.335373, 1, 0, 0, 1, 1,
0.9782274, 2.17798, -0.6370745, 1, 0, 0, 1, 1,
0.9802815, 0.1607329, 1.009076, 1, 0, 0, 1, 1,
0.9877178, -0.6680543, 2.215621, 0, 0, 0, 1, 1,
0.9888409, 0.8071766, 0.1515349, 0, 0, 0, 1, 1,
0.9892156, -1.673506, 2.6448, 0, 0, 0, 1, 1,
0.9955662, -0.1590176, 3.194265, 0, 0, 0, 1, 1,
0.9996657, -0.530516, 3.530382, 0, 0, 0, 1, 1,
0.9997175, -0.617799, 1.882427, 0, 0, 0, 1, 1,
1.002201, -0.4370231, 0.5579095, 0, 0, 0, 1, 1,
1.002304, 0.3487362, 0.6954087, 1, 1, 1, 1, 1,
1.002979, 0.7305171, 1.810124, 1, 1, 1, 1, 1,
1.013056, -0.4766422, 1.569345, 1, 1, 1, 1, 1,
1.017823, 0.1203094, 2.924347, 1, 1, 1, 1, 1,
1.020348, -0.4291692, 1.48671, 1, 1, 1, 1, 1,
1.030465, 0.9518774, 1.620489, 1, 1, 1, 1, 1,
1.032363, -0.3091269, 0.02931521, 1, 1, 1, 1, 1,
1.034838, 0.7028796, 1.423745, 1, 1, 1, 1, 1,
1.036374, 1.823264, 0.3135369, 1, 1, 1, 1, 1,
1.038625, 0.1749925, -0.6479724, 1, 1, 1, 1, 1,
1.047274, 0.6345435, 1.12086, 1, 1, 1, 1, 1,
1.048653, 0.7189966, 1.694017, 1, 1, 1, 1, 1,
1.051041, -0.9270103, 1.272308, 1, 1, 1, 1, 1,
1.062868, 0.2744502, 1.490914, 1, 1, 1, 1, 1,
1.076143, -1.017329, 2.250295, 1, 1, 1, 1, 1,
1.080824, 0.2317025, 1.86336, 0, 0, 1, 1, 1,
1.082921, 1.735826, 2.116824, 1, 0, 0, 1, 1,
1.08873, -2.317741, 2.363817, 1, 0, 0, 1, 1,
1.091785, -1.267129, 2.774484, 1, 0, 0, 1, 1,
1.094464, 0.7259192, 0.9823278, 1, 0, 0, 1, 1,
1.096212, 1.314966, 0.9557756, 1, 0, 0, 1, 1,
1.096743, -0.7527275, 2.146384, 0, 0, 0, 1, 1,
1.097162, -0.5909708, 2.368585, 0, 0, 0, 1, 1,
1.098206, -1.818347, 2.38179, 0, 0, 0, 1, 1,
1.101223, 0.6724386, 1.129559, 0, 0, 0, 1, 1,
1.104015, -0.3043481, 2.351968, 0, 0, 0, 1, 1,
1.10626, 0.778725, 1.758228, 0, 0, 0, 1, 1,
1.109533, 1.68944, 1.185069, 0, 0, 0, 1, 1,
1.121377, 0.5122529, 2.126768, 1, 1, 1, 1, 1,
1.123658, -0.5152684, 2.685492, 1, 1, 1, 1, 1,
1.125345, 0.1485447, 0.9032801, 1, 1, 1, 1, 1,
1.127362, -1.452846, 0.9680342, 1, 1, 1, 1, 1,
1.132424, -0.5369204, -0.04390407, 1, 1, 1, 1, 1,
1.139705, -1.624119, 1.596059, 1, 1, 1, 1, 1,
1.159973, 0.1840485, 1.002686, 1, 1, 1, 1, 1,
1.165972, 0.9939257, 1.523099, 1, 1, 1, 1, 1,
1.172171, -0.9214623, 0.8642198, 1, 1, 1, 1, 1,
1.17901, 0.4055328, 0.4697367, 1, 1, 1, 1, 1,
1.194168, -0.1822248, 2.947714, 1, 1, 1, 1, 1,
1.194701, 0.621425, 2.059036, 1, 1, 1, 1, 1,
1.195155, -1.098288, 4.222518, 1, 1, 1, 1, 1,
1.198603, 0.6485935, 0.8462652, 1, 1, 1, 1, 1,
1.200272, -1.718597, 2.818481, 1, 1, 1, 1, 1,
1.200296, 0.5816091, -1.10213, 0, 0, 1, 1, 1,
1.215824, -0.6001121, 2.625361, 1, 0, 0, 1, 1,
1.216417, -0.8868035, 1.94477, 1, 0, 0, 1, 1,
1.226079, 0.9240426, 1.204605, 1, 0, 0, 1, 1,
1.227775, -1.481595, 2.166466, 1, 0, 0, 1, 1,
1.231346, 1.35232, 0.5152509, 1, 0, 0, 1, 1,
1.23398, -0.2665539, 2.168927, 0, 0, 0, 1, 1,
1.23672, -0.7670902, 1.597556, 0, 0, 0, 1, 1,
1.258198, -1.515022, 2.765574, 0, 0, 0, 1, 1,
1.277772, 0.439545, 0.5422834, 0, 0, 0, 1, 1,
1.282732, 1.281367, 0.08859322, 0, 0, 0, 1, 1,
1.286017, -1.86717, 1.791352, 0, 0, 0, 1, 1,
1.28841, -1.278653, 1.831313, 0, 0, 0, 1, 1,
1.292546, 0.9925942, -0.07288896, 1, 1, 1, 1, 1,
1.307706, -2.31345, 2.74892, 1, 1, 1, 1, 1,
1.320649, 0.127174, 3.107224, 1, 1, 1, 1, 1,
1.322955, 0.4311946, 2.687334, 1, 1, 1, 1, 1,
1.324656, 0.4312314, 0.8667438, 1, 1, 1, 1, 1,
1.325888, 0.9176345, 1.195283, 1, 1, 1, 1, 1,
1.34469, 0.03078714, 0.8687303, 1, 1, 1, 1, 1,
1.357419, -1.369497, 0.3490027, 1, 1, 1, 1, 1,
1.374599, -0.1890836, 1.070711, 1, 1, 1, 1, 1,
1.380023, 0.6719507, 1.094236, 1, 1, 1, 1, 1,
1.385359, -0.8923182, 3.574294, 1, 1, 1, 1, 1,
1.402647, 0.5731727, 2.388004, 1, 1, 1, 1, 1,
1.421436, -0.8245095, 2.183988, 1, 1, 1, 1, 1,
1.429765, 1.442762, 1.732248, 1, 1, 1, 1, 1,
1.440318, 1.102752, 0.2494725, 1, 1, 1, 1, 1,
1.44071, -1.585513, 1.346981, 0, 0, 1, 1, 1,
1.444146, -1.66055, 1.308388, 1, 0, 0, 1, 1,
1.454993, -0.1592524, 0.5060007, 1, 0, 0, 1, 1,
1.456373, -0.06047985, 1.679434, 1, 0, 0, 1, 1,
1.473057, -0.1659687, 0.332774, 1, 0, 0, 1, 1,
1.483282, -1.865304, 0.5515646, 1, 0, 0, 1, 1,
1.486354, 1.488283, 0.434374, 0, 0, 0, 1, 1,
1.507901, -0.2569184, 1.276976, 0, 0, 0, 1, 1,
1.510325, 0.2426678, 1.162083, 0, 0, 0, 1, 1,
1.516169, -0.9434867, 1.351108, 0, 0, 0, 1, 1,
1.534097, -1.017619, 1.448598, 0, 0, 0, 1, 1,
1.53835, 0.3890377, 0.2385444, 0, 0, 0, 1, 1,
1.541724, 0.6016928, 1.505525, 0, 0, 0, 1, 1,
1.541902, -1.072789, 1.398562, 1, 1, 1, 1, 1,
1.544316, -0.470022, 2.70297, 1, 1, 1, 1, 1,
1.550052, 0.9291189, 1.936051, 1, 1, 1, 1, 1,
1.556664, 0.9660247, -0.3121585, 1, 1, 1, 1, 1,
1.559704, 0.103172, 1.731158, 1, 1, 1, 1, 1,
1.568286, -1.006973, 5.086051, 1, 1, 1, 1, 1,
1.569458, -1.863468, 2.978453, 1, 1, 1, 1, 1,
1.587092, 0.3908702, 0.9657119, 1, 1, 1, 1, 1,
1.58991, 0.05983479, 2.132935, 1, 1, 1, 1, 1,
1.590748, 1.126405, 0.311091, 1, 1, 1, 1, 1,
1.594561, -1.045183, 3.189526, 1, 1, 1, 1, 1,
1.595269, -0.2105189, -0.1694316, 1, 1, 1, 1, 1,
1.600113, 0.1719586, 1.559381, 1, 1, 1, 1, 1,
1.607695, -1.021965, 1.958533, 1, 1, 1, 1, 1,
1.609979, 0.1010383, 2.53391, 1, 1, 1, 1, 1,
1.619802, 0.5424088, 1.149636, 0, 0, 1, 1, 1,
1.62341, 1.001215, 1.099484, 1, 0, 0, 1, 1,
1.632287, -0.2273211, 1.051587, 1, 0, 0, 1, 1,
1.659311, 1.183401, 0.6919898, 1, 0, 0, 1, 1,
1.671198, 0.7288768, 0.8492427, 1, 0, 0, 1, 1,
1.719773, -0.9517122, 3.130137, 1, 0, 0, 1, 1,
1.721813, -0.383681, 2.580256, 0, 0, 0, 1, 1,
1.734084, 0.3776422, 0.6611164, 0, 0, 0, 1, 1,
1.753592, 0.3601172, -0.7351692, 0, 0, 0, 1, 1,
1.758434, -0.4710813, 0.8625199, 0, 0, 0, 1, 1,
1.798321, -1.307957, 0.6286525, 0, 0, 0, 1, 1,
1.812145, 0.5175147, 0.5338631, 0, 0, 0, 1, 1,
1.834635, 0.4586189, 1.984824, 0, 0, 0, 1, 1,
1.83767, -0.1385708, 2.871535, 1, 1, 1, 1, 1,
1.846444, -0.4316229, -0.6967159, 1, 1, 1, 1, 1,
1.861148, -0.502046, 3.013645, 1, 1, 1, 1, 1,
1.882611, -0.602753, 1.713434, 1, 1, 1, 1, 1,
1.884369, 0.6035556, 0.9641767, 1, 1, 1, 1, 1,
1.89847, -0.07355969, 1.247418, 1, 1, 1, 1, 1,
1.916571, -0.4126882, 1.484031, 1, 1, 1, 1, 1,
1.979686, 0.6926876, 0.009708399, 1, 1, 1, 1, 1,
1.999377, 1.642947, 1.519428, 1, 1, 1, 1, 1,
2.014364, 0.6212978, -0.7176645, 1, 1, 1, 1, 1,
2.030372, -0.2651237, 0.9293457, 1, 1, 1, 1, 1,
2.047458, -0.3468747, 1.930746, 1, 1, 1, 1, 1,
2.063145, -1.990949, 3.006362, 1, 1, 1, 1, 1,
2.094007, 0.02240389, 2.518742, 1, 1, 1, 1, 1,
2.096421, -0.3297564, 0.5143124, 1, 1, 1, 1, 1,
2.099251, 0.25937, 0.3375352, 0, 0, 1, 1, 1,
2.134159, 0.4743722, 2.163591, 1, 0, 0, 1, 1,
2.136384, -0.3543384, 2.358199, 1, 0, 0, 1, 1,
2.203781, 1.213247, 0.6785981, 1, 0, 0, 1, 1,
2.209278, -0.182807, 1.028758, 1, 0, 0, 1, 1,
2.213137, 1.574723, 0.3304788, 1, 0, 0, 1, 1,
2.246925, -0.760514, 1.680208, 0, 0, 0, 1, 1,
2.2766, 0.3649197, 2.146559, 0, 0, 0, 1, 1,
2.293597, -0.01524901, 2.742384, 0, 0, 0, 1, 1,
2.388872, 1.09687, 0.3093839, 0, 0, 0, 1, 1,
2.474277, -2.262094, 2.885213, 0, 0, 0, 1, 1,
2.500652, 0.9365252, 1.583651, 0, 0, 0, 1, 1,
2.542875, 0.5443052, 2.575321, 0, 0, 0, 1, 1,
2.543736, -0.9440033, 1.975293, 1, 1, 1, 1, 1,
2.548342, 0.484031, 1.577925, 1, 1, 1, 1, 1,
2.557384, -0.8698025, 2.522292, 1, 1, 1, 1, 1,
2.617997, 0.2758235, 2.343155, 1, 1, 1, 1, 1,
2.619008, -0.827418, 2.232933, 1, 1, 1, 1, 1,
2.718266, 0.2029541, 1.413551, 1, 1, 1, 1, 1,
3.157663, 0.9315487, 1.534413, 1, 1, 1, 1, 1
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
var radius = 9.454731;
var distance = 33.20934;
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
mvMatrix.translate( 0.1180179, 0.04130101, -0.2081478 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.20934);
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
